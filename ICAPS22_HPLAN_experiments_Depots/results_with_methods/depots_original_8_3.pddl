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
      ?auto_39484 - SURFACE
      ?auto_39485 - SURFACE
    )
    :vars
    (
      ?auto_39486 - HOIST
      ?auto_39487 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39486 ?auto_39487 ) ( SURFACE-AT ?auto_39485 ?auto_39487 ) ( CLEAR ?auto_39485 ) ( LIFTING ?auto_39486 ?auto_39484 ) ( IS-CRATE ?auto_39484 ) ( not ( = ?auto_39484 ?auto_39485 ) ) )
    :subtasks
    ( ( !DROP ?auto_39486 ?auto_39484 ?auto_39485 ?auto_39487 )
      ( MAKE-ON-VERIFY ?auto_39484 ?auto_39485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39488 - SURFACE
      ?auto_39489 - SURFACE
    )
    :vars
    (
      ?auto_39490 - HOIST
      ?auto_39491 - PLACE
      ?auto_39492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39490 ?auto_39491 ) ( SURFACE-AT ?auto_39489 ?auto_39491 ) ( CLEAR ?auto_39489 ) ( IS-CRATE ?auto_39488 ) ( not ( = ?auto_39488 ?auto_39489 ) ) ( TRUCK-AT ?auto_39492 ?auto_39491 ) ( AVAILABLE ?auto_39490 ) ( IN ?auto_39488 ?auto_39492 ) )
    :subtasks
    ( ( !UNLOAD ?auto_39490 ?auto_39488 ?auto_39492 ?auto_39491 )
      ( MAKE-ON ?auto_39488 ?auto_39489 )
      ( MAKE-ON-VERIFY ?auto_39488 ?auto_39489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39493 - SURFACE
      ?auto_39494 - SURFACE
    )
    :vars
    (
      ?auto_39496 - HOIST
      ?auto_39495 - PLACE
      ?auto_39497 - TRUCK
      ?auto_39498 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39496 ?auto_39495 ) ( SURFACE-AT ?auto_39494 ?auto_39495 ) ( CLEAR ?auto_39494 ) ( IS-CRATE ?auto_39493 ) ( not ( = ?auto_39493 ?auto_39494 ) ) ( AVAILABLE ?auto_39496 ) ( IN ?auto_39493 ?auto_39497 ) ( TRUCK-AT ?auto_39497 ?auto_39498 ) ( not ( = ?auto_39498 ?auto_39495 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_39497 ?auto_39498 ?auto_39495 )
      ( MAKE-ON ?auto_39493 ?auto_39494 )
      ( MAKE-ON-VERIFY ?auto_39493 ?auto_39494 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39499 - SURFACE
      ?auto_39500 - SURFACE
    )
    :vars
    (
      ?auto_39504 - HOIST
      ?auto_39503 - PLACE
      ?auto_39502 - TRUCK
      ?auto_39501 - PLACE
      ?auto_39505 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_39504 ?auto_39503 ) ( SURFACE-AT ?auto_39500 ?auto_39503 ) ( CLEAR ?auto_39500 ) ( IS-CRATE ?auto_39499 ) ( not ( = ?auto_39499 ?auto_39500 ) ) ( AVAILABLE ?auto_39504 ) ( TRUCK-AT ?auto_39502 ?auto_39501 ) ( not ( = ?auto_39501 ?auto_39503 ) ) ( HOIST-AT ?auto_39505 ?auto_39501 ) ( LIFTING ?auto_39505 ?auto_39499 ) ( not ( = ?auto_39504 ?auto_39505 ) ) )
    :subtasks
    ( ( !LOAD ?auto_39505 ?auto_39499 ?auto_39502 ?auto_39501 )
      ( MAKE-ON ?auto_39499 ?auto_39500 )
      ( MAKE-ON-VERIFY ?auto_39499 ?auto_39500 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39506 - SURFACE
      ?auto_39507 - SURFACE
    )
    :vars
    (
      ?auto_39509 - HOIST
      ?auto_39508 - PLACE
      ?auto_39512 - TRUCK
      ?auto_39511 - PLACE
      ?auto_39510 - HOIST
      ?auto_39513 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39509 ?auto_39508 ) ( SURFACE-AT ?auto_39507 ?auto_39508 ) ( CLEAR ?auto_39507 ) ( IS-CRATE ?auto_39506 ) ( not ( = ?auto_39506 ?auto_39507 ) ) ( AVAILABLE ?auto_39509 ) ( TRUCK-AT ?auto_39512 ?auto_39511 ) ( not ( = ?auto_39511 ?auto_39508 ) ) ( HOIST-AT ?auto_39510 ?auto_39511 ) ( not ( = ?auto_39509 ?auto_39510 ) ) ( AVAILABLE ?auto_39510 ) ( SURFACE-AT ?auto_39506 ?auto_39511 ) ( ON ?auto_39506 ?auto_39513 ) ( CLEAR ?auto_39506 ) ( not ( = ?auto_39506 ?auto_39513 ) ) ( not ( = ?auto_39507 ?auto_39513 ) ) )
    :subtasks
    ( ( !LIFT ?auto_39510 ?auto_39506 ?auto_39513 ?auto_39511 )
      ( MAKE-ON ?auto_39506 ?auto_39507 )
      ( MAKE-ON-VERIFY ?auto_39506 ?auto_39507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39514 - SURFACE
      ?auto_39515 - SURFACE
    )
    :vars
    (
      ?auto_39517 - HOIST
      ?auto_39521 - PLACE
      ?auto_39518 - PLACE
      ?auto_39516 - HOIST
      ?auto_39520 - SURFACE
      ?auto_39519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39517 ?auto_39521 ) ( SURFACE-AT ?auto_39515 ?auto_39521 ) ( CLEAR ?auto_39515 ) ( IS-CRATE ?auto_39514 ) ( not ( = ?auto_39514 ?auto_39515 ) ) ( AVAILABLE ?auto_39517 ) ( not ( = ?auto_39518 ?auto_39521 ) ) ( HOIST-AT ?auto_39516 ?auto_39518 ) ( not ( = ?auto_39517 ?auto_39516 ) ) ( AVAILABLE ?auto_39516 ) ( SURFACE-AT ?auto_39514 ?auto_39518 ) ( ON ?auto_39514 ?auto_39520 ) ( CLEAR ?auto_39514 ) ( not ( = ?auto_39514 ?auto_39520 ) ) ( not ( = ?auto_39515 ?auto_39520 ) ) ( TRUCK-AT ?auto_39519 ?auto_39521 ) )
    :subtasks
    ( ( !DRIVE ?auto_39519 ?auto_39521 ?auto_39518 )
      ( MAKE-ON ?auto_39514 ?auto_39515 )
      ( MAKE-ON-VERIFY ?auto_39514 ?auto_39515 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39524 - SURFACE
      ?auto_39525 - SURFACE
    )
    :vars
    (
      ?auto_39526 - HOIST
      ?auto_39527 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39526 ?auto_39527 ) ( SURFACE-AT ?auto_39525 ?auto_39527 ) ( CLEAR ?auto_39525 ) ( LIFTING ?auto_39526 ?auto_39524 ) ( IS-CRATE ?auto_39524 ) ( not ( = ?auto_39524 ?auto_39525 ) ) )
    :subtasks
    ( ( !DROP ?auto_39526 ?auto_39524 ?auto_39525 ?auto_39527 )
      ( MAKE-ON-VERIFY ?auto_39524 ?auto_39525 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39528 - SURFACE
      ?auto_39529 - SURFACE
    )
    :vars
    (
      ?auto_39531 - HOIST
      ?auto_39530 - PLACE
      ?auto_39532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39531 ?auto_39530 ) ( SURFACE-AT ?auto_39529 ?auto_39530 ) ( CLEAR ?auto_39529 ) ( IS-CRATE ?auto_39528 ) ( not ( = ?auto_39528 ?auto_39529 ) ) ( TRUCK-AT ?auto_39532 ?auto_39530 ) ( AVAILABLE ?auto_39531 ) ( IN ?auto_39528 ?auto_39532 ) )
    :subtasks
    ( ( !UNLOAD ?auto_39531 ?auto_39528 ?auto_39532 ?auto_39530 )
      ( MAKE-ON ?auto_39528 ?auto_39529 )
      ( MAKE-ON-VERIFY ?auto_39528 ?auto_39529 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39533 - SURFACE
      ?auto_39534 - SURFACE
    )
    :vars
    (
      ?auto_39535 - HOIST
      ?auto_39536 - PLACE
      ?auto_39537 - TRUCK
      ?auto_39538 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39535 ?auto_39536 ) ( SURFACE-AT ?auto_39534 ?auto_39536 ) ( CLEAR ?auto_39534 ) ( IS-CRATE ?auto_39533 ) ( not ( = ?auto_39533 ?auto_39534 ) ) ( AVAILABLE ?auto_39535 ) ( IN ?auto_39533 ?auto_39537 ) ( TRUCK-AT ?auto_39537 ?auto_39538 ) ( not ( = ?auto_39538 ?auto_39536 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_39537 ?auto_39538 ?auto_39536 )
      ( MAKE-ON ?auto_39533 ?auto_39534 )
      ( MAKE-ON-VERIFY ?auto_39533 ?auto_39534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39539 - SURFACE
      ?auto_39540 - SURFACE
    )
    :vars
    (
      ?auto_39542 - HOIST
      ?auto_39544 - PLACE
      ?auto_39543 - TRUCK
      ?auto_39541 - PLACE
      ?auto_39545 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_39542 ?auto_39544 ) ( SURFACE-AT ?auto_39540 ?auto_39544 ) ( CLEAR ?auto_39540 ) ( IS-CRATE ?auto_39539 ) ( not ( = ?auto_39539 ?auto_39540 ) ) ( AVAILABLE ?auto_39542 ) ( TRUCK-AT ?auto_39543 ?auto_39541 ) ( not ( = ?auto_39541 ?auto_39544 ) ) ( HOIST-AT ?auto_39545 ?auto_39541 ) ( LIFTING ?auto_39545 ?auto_39539 ) ( not ( = ?auto_39542 ?auto_39545 ) ) )
    :subtasks
    ( ( !LOAD ?auto_39545 ?auto_39539 ?auto_39543 ?auto_39541 )
      ( MAKE-ON ?auto_39539 ?auto_39540 )
      ( MAKE-ON-VERIFY ?auto_39539 ?auto_39540 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39546 - SURFACE
      ?auto_39547 - SURFACE
    )
    :vars
    (
      ?auto_39550 - HOIST
      ?auto_39552 - PLACE
      ?auto_39548 - TRUCK
      ?auto_39551 - PLACE
      ?auto_39549 - HOIST
      ?auto_39553 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39550 ?auto_39552 ) ( SURFACE-AT ?auto_39547 ?auto_39552 ) ( CLEAR ?auto_39547 ) ( IS-CRATE ?auto_39546 ) ( not ( = ?auto_39546 ?auto_39547 ) ) ( AVAILABLE ?auto_39550 ) ( TRUCK-AT ?auto_39548 ?auto_39551 ) ( not ( = ?auto_39551 ?auto_39552 ) ) ( HOIST-AT ?auto_39549 ?auto_39551 ) ( not ( = ?auto_39550 ?auto_39549 ) ) ( AVAILABLE ?auto_39549 ) ( SURFACE-AT ?auto_39546 ?auto_39551 ) ( ON ?auto_39546 ?auto_39553 ) ( CLEAR ?auto_39546 ) ( not ( = ?auto_39546 ?auto_39553 ) ) ( not ( = ?auto_39547 ?auto_39553 ) ) )
    :subtasks
    ( ( !LIFT ?auto_39549 ?auto_39546 ?auto_39553 ?auto_39551 )
      ( MAKE-ON ?auto_39546 ?auto_39547 )
      ( MAKE-ON-VERIFY ?auto_39546 ?auto_39547 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39554 - SURFACE
      ?auto_39555 - SURFACE
    )
    :vars
    (
      ?auto_39560 - HOIST
      ?auto_39561 - PLACE
      ?auto_39558 - PLACE
      ?auto_39557 - HOIST
      ?auto_39556 - SURFACE
      ?auto_39559 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39560 ?auto_39561 ) ( SURFACE-AT ?auto_39555 ?auto_39561 ) ( CLEAR ?auto_39555 ) ( IS-CRATE ?auto_39554 ) ( not ( = ?auto_39554 ?auto_39555 ) ) ( AVAILABLE ?auto_39560 ) ( not ( = ?auto_39558 ?auto_39561 ) ) ( HOIST-AT ?auto_39557 ?auto_39558 ) ( not ( = ?auto_39560 ?auto_39557 ) ) ( AVAILABLE ?auto_39557 ) ( SURFACE-AT ?auto_39554 ?auto_39558 ) ( ON ?auto_39554 ?auto_39556 ) ( CLEAR ?auto_39554 ) ( not ( = ?auto_39554 ?auto_39556 ) ) ( not ( = ?auto_39555 ?auto_39556 ) ) ( TRUCK-AT ?auto_39559 ?auto_39561 ) )
    :subtasks
    ( ( !DRIVE ?auto_39559 ?auto_39561 ?auto_39558 )
      ( MAKE-ON ?auto_39554 ?auto_39555 )
      ( MAKE-ON-VERIFY ?auto_39554 ?auto_39555 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39562 - SURFACE
      ?auto_39563 - SURFACE
    )
    :vars
    (
      ?auto_39569 - HOIST
      ?auto_39567 - PLACE
      ?auto_39566 - PLACE
      ?auto_39565 - HOIST
      ?auto_39564 - SURFACE
      ?auto_39568 - TRUCK
      ?auto_39570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39569 ?auto_39567 ) ( IS-CRATE ?auto_39562 ) ( not ( = ?auto_39562 ?auto_39563 ) ) ( not ( = ?auto_39566 ?auto_39567 ) ) ( HOIST-AT ?auto_39565 ?auto_39566 ) ( not ( = ?auto_39569 ?auto_39565 ) ) ( AVAILABLE ?auto_39565 ) ( SURFACE-AT ?auto_39562 ?auto_39566 ) ( ON ?auto_39562 ?auto_39564 ) ( CLEAR ?auto_39562 ) ( not ( = ?auto_39562 ?auto_39564 ) ) ( not ( = ?auto_39563 ?auto_39564 ) ) ( TRUCK-AT ?auto_39568 ?auto_39567 ) ( SURFACE-AT ?auto_39570 ?auto_39567 ) ( CLEAR ?auto_39570 ) ( LIFTING ?auto_39569 ?auto_39563 ) ( IS-CRATE ?auto_39563 ) ( not ( = ?auto_39562 ?auto_39570 ) ) ( not ( = ?auto_39563 ?auto_39570 ) ) ( not ( = ?auto_39564 ?auto_39570 ) ) )
    :subtasks
    ( ( !DROP ?auto_39569 ?auto_39563 ?auto_39570 ?auto_39567 )
      ( MAKE-ON ?auto_39562 ?auto_39563 )
      ( MAKE-ON-VERIFY ?auto_39562 ?auto_39563 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39571 - SURFACE
      ?auto_39572 - SURFACE
    )
    :vars
    (
      ?auto_39574 - HOIST
      ?auto_39575 - PLACE
      ?auto_39576 - PLACE
      ?auto_39573 - HOIST
      ?auto_39578 - SURFACE
      ?auto_39579 - TRUCK
      ?auto_39577 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39574 ?auto_39575 ) ( IS-CRATE ?auto_39571 ) ( not ( = ?auto_39571 ?auto_39572 ) ) ( not ( = ?auto_39576 ?auto_39575 ) ) ( HOIST-AT ?auto_39573 ?auto_39576 ) ( not ( = ?auto_39574 ?auto_39573 ) ) ( AVAILABLE ?auto_39573 ) ( SURFACE-AT ?auto_39571 ?auto_39576 ) ( ON ?auto_39571 ?auto_39578 ) ( CLEAR ?auto_39571 ) ( not ( = ?auto_39571 ?auto_39578 ) ) ( not ( = ?auto_39572 ?auto_39578 ) ) ( TRUCK-AT ?auto_39579 ?auto_39575 ) ( SURFACE-AT ?auto_39577 ?auto_39575 ) ( CLEAR ?auto_39577 ) ( IS-CRATE ?auto_39572 ) ( not ( = ?auto_39571 ?auto_39577 ) ) ( not ( = ?auto_39572 ?auto_39577 ) ) ( not ( = ?auto_39578 ?auto_39577 ) ) ( AVAILABLE ?auto_39574 ) ( IN ?auto_39572 ?auto_39579 ) )
    :subtasks
    ( ( !UNLOAD ?auto_39574 ?auto_39572 ?auto_39579 ?auto_39575 )
      ( MAKE-ON ?auto_39571 ?auto_39572 )
      ( MAKE-ON-VERIFY ?auto_39571 ?auto_39572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39580 - SURFACE
      ?auto_39581 - SURFACE
    )
    :vars
    (
      ?auto_39586 - HOIST
      ?auto_39587 - PLACE
      ?auto_39585 - PLACE
      ?auto_39582 - HOIST
      ?auto_39588 - SURFACE
      ?auto_39584 - SURFACE
      ?auto_39583 - TRUCK
      ?auto_39589 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39586 ?auto_39587 ) ( IS-CRATE ?auto_39580 ) ( not ( = ?auto_39580 ?auto_39581 ) ) ( not ( = ?auto_39585 ?auto_39587 ) ) ( HOIST-AT ?auto_39582 ?auto_39585 ) ( not ( = ?auto_39586 ?auto_39582 ) ) ( AVAILABLE ?auto_39582 ) ( SURFACE-AT ?auto_39580 ?auto_39585 ) ( ON ?auto_39580 ?auto_39588 ) ( CLEAR ?auto_39580 ) ( not ( = ?auto_39580 ?auto_39588 ) ) ( not ( = ?auto_39581 ?auto_39588 ) ) ( SURFACE-AT ?auto_39584 ?auto_39587 ) ( CLEAR ?auto_39584 ) ( IS-CRATE ?auto_39581 ) ( not ( = ?auto_39580 ?auto_39584 ) ) ( not ( = ?auto_39581 ?auto_39584 ) ) ( not ( = ?auto_39588 ?auto_39584 ) ) ( AVAILABLE ?auto_39586 ) ( IN ?auto_39581 ?auto_39583 ) ( TRUCK-AT ?auto_39583 ?auto_39589 ) ( not ( = ?auto_39589 ?auto_39587 ) ) ( not ( = ?auto_39585 ?auto_39589 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_39583 ?auto_39589 ?auto_39587 )
      ( MAKE-ON ?auto_39580 ?auto_39581 )
      ( MAKE-ON-VERIFY ?auto_39580 ?auto_39581 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39590 - SURFACE
      ?auto_39591 - SURFACE
    )
    :vars
    (
      ?auto_39594 - HOIST
      ?auto_39598 - PLACE
      ?auto_39593 - PLACE
      ?auto_39596 - HOIST
      ?auto_39592 - SURFACE
      ?auto_39599 - SURFACE
      ?auto_39597 - TRUCK
      ?auto_39595 - PLACE
      ?auto_39600 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_39594 ?auto_39598 ) ( IS-CRATE ?auto_39590 ) ( not ( = ?auto_39590 ?auto_39591 ) ) ( not ( = ?auto_39593 ?auto_39598 ) ) ( HOIST-AT ?auto_39596 ?auto_39593 ) ( not ( = ?auto_39594 ?auto_39596 ) ) ( AVAILABLE ?auto_39596 ) ( SURFACE-AT ?auto_39590 ?auto_39593 ) ( ON ?auto_39590 ?auto_39592 ) ( CLEAR ?auto_39590 ) ( not ( = ?auto_39590 ?auto_39592 ) ) ( not ( = ?auto_39591 ?auto_39592 ) ) ( SURFACE-AT ?auto_39599 ?auto_39598 ) ( CLEAR ?auto_39599 ) ( IS-CRATE ?auto_39591 ) ( not ( = ?auto_39590 ?auto_39599 ) ) ( not ( = ?auto_39591 ?auto_39599 ) ) ( not ( = ?auto_39592 ?auto_39599 ) ) ( AVAILABLE ?auto_39594 ) ( TRUCK-AT ?auto_39597 ?auto_39595 ) ( not ( = ?auto_39595 ?auto_39598 ) ) ( not ( = ?auto_39593 ?auto_39595 ) ) ( HOIST-AT ?auto_39600 ?auto_39595 ) ( LIFTING ?auto_39600 ?auto_39591 ) ( not ( = ?auto_39594 ?auto_39600 ) ) ( not ( = ?auto_39596 ?auto_39600 ) ) )
    :subtasks
    ( ( !LOAD ?auto_39600 ?auto_39591 ?auto_39597 ?auto_39595 )
      ( MAKE-ON ?auto_39590 ?auto_39591 )
      ( MAKE-ON-VERIFY ?auto_39590 ?auto_39591 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39601 - SURFACE
      ?auto_39602 - SURFACE
    )
    :vars
    (
      ?auto_39607 - HOIST
      ?auto_39611 - PLACE
      ?auto_39605 - PLACE
      ?auto_39606 - HOIST
      ?auto_39608 - SURFACE
      ?auto_39604 - SURFACE
      ?auto_39610 - TRUCK
      ?auto_39609 - PLACE
      ?auto_39603 - HOIST
      ?auto_39612 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39607 ?auto_39611 ) ( IS-CRATE ?auto_39601 ) ( not ( = ?auto_39601 ?auto_39602 ) ) ( not ( = ?auto_39605 ?auto_39611 ) ) ( HOIST-AT ?auto_39606 ?auto_39605 ) ( not ( = ?auto_39607 ?auto_39606 ) ) ( AVAILABLE ?auto_39606 ) ( SURFACE-AT ?auto_39601 ?auto_39605 ) ( ON ?auto_39601 ?auto_39608 ) ( CLEAR ?auto_39601 ) ( not ( = ?auto_39601 ?auto_39608 ) ) ( not ( = ?auto_39602 ?auto_39608 ) ) ( SURFACE-AT ?auto_39604 ?auto_39611 ) ( CLEAR ?auto_39604 ) ( IS-CRATE ?auto_39602 ) ( not ( = ?auto_39601 ?auto_39604 ) ) ( not ( = ?auto_39602 ?auto_39604 ) ) ( not ( = ?auto_39608 ?auto_39604 ) ) ( AVAILABLE ?auto_39607 ) ( TRUCK-AT ?auto_39610 ?auto_39609 ) ( not ( = ?auto_39609 ?auto_39611 ) ) ( not ( = ?auto_39605 ?auto_39609 ) ) ( HOIST-AT ?auto_39603 ?auto_39609 ) ( not ( = ?auto_39607 ?auto_39603 ) ) ( not ( = ?auto_39606 ?auto_39603 ) ) ( AVAILABLE ?auto_39603 ) ( SURFACE-AT ?auto_39602 ?auto_39609 ) ( ON ?auto_39602 ?auto_39612 ) ( CLEAR ?auto_39602 ) ( not ( = ?auto_39601 ?auto_39612 ) ) ( not ( = ?auto_39602 ?auto_39612 ) ) ( not ( = ?auto_39608 ?auto_39612 ) ) ( not ( = ?auto_39604 ?auto_39612 ) ) )
    :subtasks
    ( ( !LIFT ?auto_39603 ?auto_39602 ?auto_39612 ?auto_39609 )
      ( MAKE-ON ?auto_39601 ?auto_39602 )
      ( MAKE-ON-VERIFY ?auto_39601 ?auto_39602 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39613 - SURFACE
      ?auto_39614 - SURFACE
    )
    :vars
    (
      ?auto_39619 - HOIST
      ?auto_39624 - PLACE
      ?auto_39621 - PLACE
      ?auto_39620 - HOIST
      ?auto_39618 - SURFACE
      ?auto_39615 - SURFACE
      ?auto_39623 - PLACE
      ?auto_39617 - HOIST
      ?auto_39622 - SURFACE
      ?auto_39616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39619 ?auto_39624 ) ( IS-CRATE ?auto_39613 ) ( not ( = ?auto_39613 ?auto_39614 ) ) ( not ( = ?auto_39621 ?auto_39624 ) ) ( HOIST-AT ?auto_39620 ?auto_39621 ) ( not ( = ?auto_39619 ?auto_39620 ) ) ( AVAILABLE ?auto_39620 ) ( SURFACE-AT ?auto_39613 ?auto_39621 ) ( ON ?auto_39613 ?auto_39618 ) ( CLEAR ?auto_39613 ) ( not ( = ?auto_39613 ?auto_39618 ) ) ( not ( = ?auto_39614 ?auto_39618 ) ) ( SURFACE-AT ?auto_39615 ?auto_39624 ) ( CLEAR ?auto_39615 ) ( IS-CRATE ?auto_39614 ) ( not ( = ?auto_39613 ?auto_39615 ) ) ( not ( = ?auto_39614 ?auto_39615 ) ) ( not ( = ?auto_39618 ?auto_39615 ) ) ( AVAILABLE ?auto_39619 ) ( not ( = ?auto_39623 ?auto_39624 ) ) ( not ( = ?auto_39621 ?auto_39623 ) ) ( HOIST-AT ?auto_39617 ?auto_39623 ) ( not ( = ?auto_39619 ?auto_39617 ) ) ( not ( = ?auto_39620 ?auto_39617 ) ) ( AVAILABLE ?auto_39617 ) ( SURFACE-AT ?auto_39614 ?auto_39623 ) ( ON ?auto_39614 ?auto_39622 ) ( CLEAR ?auto_39614 ) ( not ( = ?auto_39613 ?auto_39622 ) ) ( not ( = ?auto_39614 ?auto_39622 ) ) ( not ( = ?auto_39618 ?auto_39622 ) ) ( not ( = ?auto_39615 ?auto_39622 ) ) ( TRUCK-AT ?auto_39616 ?auto_39624 ) )
    :subtasks
    ( ( !DRIVE ?auto_39616 ?auto_39624 ?auto_39623 )
      ( MAKE-ON ?auto_39613 ?auto_39614 )
      ( MAKE-ON-VERIFY ?auto_39613 ?auto_39614 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39627 - SURFACE
      ?auto_39628 - SURFACE
    )
    :vars
    (
      ?auto_39629 - HOIST
      ?auto_39630 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39629 ?auto_39630 ) ( SURFACE-AT ?auto_39628 ?auto_39630 ) ( CLEAR ?auto_39628 ) ( LIFTING ?auto_39629 ?auto_39627 ) ( IS-CRATE ?auto_39627 ) ( not ( = ?auto_39627 ?auto_39628 ) ) )
    :subtasks
    ( ( !DROP ?auto_39629 ?auto_39627 ?auto_39628 ?auto_39630 )
      ( MAKE-ON-VERIFY ?auto_39627 ?auto_39628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39631 - SURFACE
      ?auto_39632 - SURFACE
    )
    :vars
    (
      ?auto_39634 - HOIST
      ?auto_39633 - PLACE
      ?auto_39635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39634 ?auto_39633 ) ( SURFACE-AT ?auto_39632 ?auto_39633 ) ( CLEAR ?auto_39632 ) ( IS-CRATE ?auto_39631 ) ( not ( = ?auto_39631 ?auto_39632 ) ) ( TRUCK-AT ?auto_39635 ?auto_39633 ) ( AVAILABLE ?auto_39634 ) ( IN ?auto_39631 ?auto_39635 ) )
    :subtasks
    ( ( !UNLOAD ?auto_39634 ?auto_39631 ?auto_39635 ?auto_39633 )
      ( MAKE-ON ?auto_39631 ?auto_39632 )
      ( MAKE-ON-VERIFY ?auto_39631 ?auto_39632 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39636 - SURFACE
      ?auto_39637 - SURFACE
    )
    :vars
    (
      ?auto_39640 - HOIST
      ?auto_39639 - PLACE
      ?auto_39638 - TRUCK
      ?auto_39641 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39640 ?auto_39639 ) ( SURFACE-AT ?auto_39637 ?auto_39639 ) ( CLEAR ?auto_39637 ) ( IS-CRATE ?auto_39636 ) ( not ( = ?auto_39636 ?auto_39637 ) ) ( AVAILABLE ?auto_39640 ) ( IN ?auto_39636 ?auto_39638 ) ( TRUCK-AT ?auto_39638 ?auto_39641 ) ( not ( = ?auto_39641 ?auto_39639 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_39638 ?auto_39641 ?auto_39639 )
      ( MAKE-ON ?auto_39636 ?auto_39637 )
      ( MAKE-ON-VERIFY ?auto_39636 ?auto_39637 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39642 - SURFACE
      ?auto_39643 - SURFACE
    )
    :vars
    (
      ?auto_39645 - HOIST
      ?auto_39646 - PLACE
      ?auto_39644 - TRUCK
      ?auto_39647 - PLACE
      ?auto_39648 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_39645 ?auto_39646 ) ( SURFACE-AT ?auto_39643 ?auto_39646 ) ( CLEAR ?auto_39643 ) ( IS-CRATE ?auto_39642 ) ( not ( = ?auto_39642 ?auto_39643 ) ) ( AVAILABLE ?auto_39645 ) ( TRUCK-AT ?auto_39644 ?auto_39647 ) ( not ( = ?auto_39647 ?auto_39646 ) ) ( HOIST-AT ?auto_39648 ?auto_39647 ) ( LIFTING ?auto_39648 ?auto_39642 ) ( not ( = ?auto_39645 ?auto_39648 ) ) )
    :subtasks
    ( ( !LOAD ?auto_39648 ?auto_39642 ?auto_39644 ?auto_39647 )
      ( MAKE-ON ?auto_39642 ?auto_39643 )
      ( MAKE-ON-VERIFY ?auto_39642 ?auto_39643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39649 - SURFACE
      ?auto_39650 - SURFACE
    )
    :vars
    (
      ?auto_39655 - HOIST
      ?auto_39653 - PLACE
      ?auto_39654 - TRUCK
      ?auto_39652 - PLACE
      ?auto_39651 - HOIST
      ?auto_39656 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39655 ?auto_39653 ) ( SURFACE-AT ?auto_39650 ?auto_39653 ) ( CLEAR ?auto_39650 ) ( IS-CRATE ?auto_39649 ) ( not ( = ?auto_39649 ?auto_39650 ) ) ( AVAILABLE ?auto_39655 ) ( TRUCK-AT ?auto_39654 ?auto_39652 ) ( not ( = ?auto_39652 ?auto_39653 ) ) ( HOIST-AT ?auto_39651 ?auto_39652 ) ( not ( = ?auto_39655 ?auto_39651 ) ) ( AVAILABLE ?auto_39651 ) ( SURFACE-AT ?auto_39649 ?auto_39652 ) ( ON ?auto_39649 ?auto_39656 ) ( CLEAR ?auto_39649 ) ( not ( = ?auto_39649 ?auto_39656 ) ) ( not ( = ?auto_39650 ?auto_39656 ) ) )
    :subtasks
    ( ( !LIFT ?auto_39651 ?auto_39649 ?auto_39656 ?auto_39652 )
      ( MAKE-ON ?auto_39649 ?auto_39650 )
      ( MAKE-ON-VERIFY ?auto_39649 ?auto_39650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39657 - SURFACE
      ?auto_39658 - SURFACE
    )
    :vars
    (
      ?auto_39659 - HOIST
      ?auto_39663 - PLACE
      ?auto_39661 - PLACE
      ?auto_39664 - HOIST
      ?auto_39662 - SURFACE
      ?auto_39660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39659 ?auto_39663 ) ( SURFACE-AT ?auto_39658 ?auto_39663 ) ( CLEAR ?auto_39658 ) ( IS-CRATE ?auto_39657 ) ( not ( = ?auto_39657 ?auto_39658 ) ) ( AVAILABLE ?auto_39659 ) ( not ( = ?auto_39661 ?auto_39663 ) ) ( HOIST-AT ?auto_39664 ?auto_39661 ) ( not ( = ?auto_39659 ?auto_39664 ) ) ( AVAILABLE ?auto_39664 ) ( SURFACE-AT ?auto_39657 ?auto_39661 ) ( ON ?auto_39657 ?auto_39662 ) ( CLEAR ?auto_39657 ) ( not ( = ?auto_39657 ?auto_39662 ) ) ( not ( = ?auto_39658 ?auto_39662 ) ) ( TRUCK-AT ?auto_39660 ?auto_39663 ) )
    :subtasks
    ( ( !DRIVE ?auto_39660 ?auto_39663 ?auto_39661 )
      ( MAKE-ON ?auto_39657 ?auto_39658 )
      ( MAKE-ON-VERIFY ?auto_39657 ?auto_39658 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39665 - SURFACE
      ?auto_39666 - SURFACE
    )
    :vars
    (
      ?auto_39669 - HOIST
      ?auto_39671 - PLACE
      ?auto_39668 - PLACE
      ?auto_39670 - HOIST
      ?auto_39672 - SURFACE
      ?auto_39667 - TRUCK
      ?auto_39673 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39669 ?auto_39671 ) ( IS-CRATE ?auto_39665 ) ( not ( = ?auto_39665 ?auto_39666 ) ) ( not ( = ?auto_39668 ?auto_39671 ) ) ( HOIST-AT ?auto_39670 ?auto_39668 ) ( not ( = ?auto_39669 ?auto_39670 ) ) ( AVAILABLE ?auto_39670 ) ( SURFACE-AT ?auto_39665 ?auto_39668 ) ( ON ?auto_39665 ?auto_39672 ) ( CLEAR ?auto_39665 ) ( not ( = ?auto_39665 ?auto_39672 ) ) ( not ( = ?auto_39666 ?auto_39672 ) ) ( TRUCK-AT ?auto_39667 ?auto_39671 ) ( SURFACE-AT ?auto_39673 ?auto_39671 ) ( CLEAR ?auto_39673 ) ( LIFTING ?auto_39669 ?auto_39666 ) ( IS-CRATE ?auto_39666 ) ( not ( = ?auto_39665 ?auto_39673 ) ) ( not ( = ?auto_39666 ?auto_39673 ) ) ( not ( = ?auto_39672 ?auto_39673 ) ) )
    :subtasks
    ( ( !DROP ?auto_39669 ?auto_39666 ?auto_39673 ?auto_39671 )
      ( MAKE-ON ?auto_39665 ?auto_39666 )
      ( MAKE-ON-VERIFY ?auto_39665 ?auto_39666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39674 - SURFACE
      ?auto_39675 - SURFACE
    )
    :vars
    (
      ?auto_39677 - HOIST
      ?auto_39681 - PLACE
      ?auto_39679 - PLACE
      ?auto_39678 - HOIST
      ?auto_39680 - SURFACE
      ?auto_39676 - TRUCK
      ?auto_39682 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39677 ?auto_39681 ) ( IS-CRATE ?auto_39674 ) ( not ( = ?auto_39674 ?auto_39675 ) ) ( not ( = ?auto_39679 ?auto_39681 ) ) ( HOIST-AT ?auto_39678 ?auto_39679 ) ( not ( = ?auto_39677 ?auto_39678 ) ) ( AVAILABLE ?auto_39678 ) ( SURFACE-AT ?auto_39674 ?auto_39679 ) ( ON ?auto_39674 ?auto_39680 ) ( CLEAR ?auto_39674 ) ( not ( = ?auto_39674 ?auto_39680 ) ) ( not ( = ?auto_39675 ?auto_39680 ) ) ( TRUCK-AT ?auto_39676 ?auto_39681 ) ( SURFACE-AT ?auto_39682 ?auto_39681 ) ( CLEAR ?auto_39682 ) ( IS-CRATE ?auto_39675 ) ( not ( = ?auto_39674 ?auto_39682 ) ) ( not ( = ?auto_39675 ?auto_39682 ) ) ( not ( = ?auto_39680 ?auto_39682 ) ) ( AVAILABLE ?auto_39677 ) ( IN ?auto_39675 ?auto_39676 ) )
    :subtasks
    ( ( !UNLOAD ?auto_39677 ?auto_39675 ?auto_39676 ?auto_39681 )
      ( MAKE-ON ?auto_39674 ?auto_39675 )
      ( MAKE-ON-VERIFY ?auto_39674 ?auto_39675 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39683 - SURFACE
      ?auto_39684 - SURFACE
    )
    :vars
    (
      ?auto_39685 - HOIST
      ?auto_39688 - PLACE
      ?auto_39686 - PLACE
      ?auto_39687 - HOIST
      ?auto_39690 - SURFACE
      ?auto_39689 - SURFACE
      ?auto_39691 - TRUCK
      ?auto_39692 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39685 ?auto_39688 ) ( IS-CRATE ?auto_39683 ) ( not ( = ?auto_39683 ?auto_39684 ) ) ( not ( = ?auto_39686 ?auto_39688 ) ) ( HOIST-AT ?auto_39687 ?auto_39686 ) ( not ( = ?auto_39685 ?auto_39687 ) ) ( AVAILABLE ?auto_39687 ) ( SURFACE-AT ?auto_39683 ?auto_39686 ) ( ON ?auto_39683 ?auto_39690 ) ( CLEAR ?auto_39683 ) ( not ( = ?auto_39683 ?auto_39690 ) ) ( not ( = ?auto_39684 ?auto_39690 ) ) ( SURFACE-AT ?auto_39689 ?auto_39688 ) ( CLEAR ?auto_39689 ) ( IS-CRATE ?auto_39684 ) ( not ( = ?auto_39683 ?auto_39689 ) ) ( not ( = ?auto_39684 ?auto_39689 ) ) ( not ( = ?auto_39690 ?auto_39689 ) ) ( AVAILABLE ?auto_39685 ) ( IN ?auto_39684 ?auto_39691 ) ( TRUCK-AT ?auto_39691 ?auto_39692 ) ( not ( = ?auto_39692 ?auto_39688 ) ) ( not ( = ?auto_39686 ?auto_39692 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_39691 ?auto_39692 ?auto_39688 )
      ( MAKE-ON ?auto_39683 ?auto_39684 )
      ( MAKE-ON-VERIFY ?auto_39683 ?auto_39684 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39693 - SURFACE
      ?auto_39694 - SURFACE
    )
    :vars
    (
      ?auto_39697 - HOIST
      ?auto_39701 - PLACE
      ?auto_39695 - PLACE
      ?auto_39696 - HOIST
      ?auto_39700 - SURFACE
      ?auto_39698 - SURFACE
      ?auto_39699 - TRUCK
      ?auto_39702 - PLACE
      ?auto_39703 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_39697 ?auto_39701 ) ( IS-CRATE ?auto_39693 ) ( not ( = ?auto_39693 ?auto_39694 ) ) ( not ( = ?auto_39695 ?auto_39701 ) ) ( HOIST-AT ?auto_39696 ?auto_39695 ) ( not ( = ?auto_39697 ?auto_39696 ) ) ( AVAILABLE ?auto_39696 ) ( SURFACE-AT ?auto_39693 ?auto_39695 ) ( ON ?auto_39693 ?auto_39700 ) ( CLEAR ?auto_39693 ) ( not ( = ?auto_39693 ?auto_39700 ) ) ( not ( = ?auto_39694 ?auto_39700 ) ) ( SURFACE-AT ?auto_39698 ?auto_39701 ) ( CLEAR ?auto_39698 ) ( IS-CRATE ?auto_39694 ) ( not ( = ?auto_39693 ?auto_39698 ) ) ( not ( = ?auto_39694 ?auto_39698 ) ) ( not ( = ?auto_39700 ?auto_39698 ) ) ( AVAILABLE ?auto_39697 ) ( TRUCK-AT ?auto_39699 ?auto_39702 ) ( not ( = ?auto_39702 ?auto_39701 ) ) ( not ( = ?auto_39695 ?auto_39702 ) ) ( HOIST-AT ?auto_39703 ?auto_39702 ) ( LIFTING ?auto_39703 ?auto_39694 ) ( not ( = ?auto_39697 ?auto_39703 ) ) ( not ( = ?auto_39696 ?auto_39703 ) ) )
    :subtasks
    ( ( !LOAD ?auto_39703 ?auto_39694 ?auto_39699 ?auto_39702 )
      ( MAKE-ON ?auto_39693 ?auto_39694 )
      ( MAKE-ON-VERIFY ?auto_39693 ?auto_39694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39704 - SURFACE
      ?auto_39705 - SURFACE
    )
    :vars
    (
      ?auto_39707 - HOIST
      ?auto_39708 - PLACE
      ?auto_39714 - PLACE
      ?auto_39712 - HOIST
      ?auto_39709 - SURFACE
      ?auto_39713 - SURFACE
      ?auto_39711 - TRUCK
      ?auto_39706 - PLACE
      ?auto_39710 - HOIST
      ?auto_39715 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39707 ?auto_39708 ) ( IS-CRATE ?auto_39704 ) ( not ( = ?auto_39704 ?auto_39705 ) ) ( not ( = ?auto_39714 ?auto_39708 ) ) ( HOIST-AT ?auto_39712 ?auto_39714 ) ( not ( = ?auto_39707 ?auto_39712 ) ) ( AVAILABLE ?auto_39712 ) ( SURFACE-AT ?auto_39704 ?auto_39714 ) ( ON ?auto_39704 ?auto_39709 ) ( CLEAR ?auto_39704 ) ( not ( = ?auto_39704 ?auto_39709 ) ) ( not ( = ?auto_39705 ?auto_39709 ) ) ( SURFACE-AT ?auto_39713 ?auto_39708 ) ( CLEAR ?auto_39713 ) ( IS-CRATE ?auto_39705 ) ( not ( = ?auto_39704 ?auto_39713 ) ) ( not ( = ?auto_39705 ?auto_39713 ) ) ( not ( = ?auto_39709 ?auto_39713 ) ) ( AVAILABLE ?auto_39707 ) ( TRUCK-AT ?auto_39711 ?auto_39706 ) ( not ( = ?auto_39706 ?auto_39708 ) ) ( not ( = ?auto_39714 ?auto_39706 ) ) ( HOIST-AT ?auto_39710 ?auto_39706 ) ( not ( = ?auto_39707 ?auto_39710 ) ) ( not ( = ?auto_39712 ?auto_39710 ) ) ( AVAILABLE ?auto_39710 ) ( SURFACE-AT ?auto_39705 ?auto_39706 ) ( ON ?auto_39705 ?auto_39715 ) ( CLEAR ?auto_39705 ) ( not ( = ?auto_39704 ?auto_39715 ) ) ( not ( = ?auto_39705 ?auto_39715 ) ) ( not ( = ?auto_39709 ?auto_39715 ) ) ( not ( = ?auto_39713 ?auto_39715 ) ) )
    :subtasks
    ( ( !LIFT ?auto_39710 ?auto_39705 ?auto_39715 ?auto_39706 )
      ( MAKE-ON ?auto_39704 ?auto_39705 )
      ( MAKE-ON-VERIFY ?auto_39704 ?auto_39705 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39716 - SURFACE
      ?auto_39717 - SURFACE
    )
    :vars
    (
      ?auto_39726 - HOIST
      ?auto_39719 - PLACE
      ?auto_39722 - PLACE
      ?auto_39724 - HOIST
      ?auto_39725 - SURFACE
      ?auto_39723 - SURFACE
      ?auto_39718 - PLACE
      ?auto_39720 - HOIST
      ?auto_39727 - SURFACE
      ?auto_39721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39726 ?auto_39719 ) ( IS-CRATE ?auto_39716 ) ( not ( = ?auto_39716 ?auto_39717 ) ) ( not ( = ?auto_39722 ?auto_39719 ) ) ( HOIST-AT ?auto_39724 ?auto_39722 ) ( not ( = ?auto_39726 ?auto_39724 ) ) ( AVAILABLE ?auto_39724 ) ( SURFACE-AT ?auto_39716 ?auto_39722 ) ( ON ?auto_39716 ?auto_39725 ) ( CLEAR ?auto_39716 ) ( not ( = ?auto_39716 ?auto_39725 ) ) ( not ( = ?auto_39717 ?auto_39725 ) ) ( SURFACE-AT ?auto_39723 ?auto_39719 ) ( CLEAR ?auto_39723 ) ( IS-CRATE ?auto_39717 ) ( not ( = ?auto_39716 ?auto_39723 ) ) ( not ( = ?auto_39717 ?auto_39723 ) ) ( not ( = ?auto_39725 ?auto_39723 ) ) ( AVAILABLE ?auto_39726 ) ( not ( = ?auto_39718 ?auto_39719 ) ) ( not ( = ?auto_39722 ?auto_39718 ) ) ( HOIST-AT ?auto_39720 ?auto_39718 ) ( not ( = ?auto_39726 ?auto_39720 ) ) ( not ( = ?auto_39724 ?auto_39720 ) ) ( AVAILABLE ?auto_39720 ) ( SURFACE-AT ?auto_39717 ?auto_39718 ) ( ON ?auto_39717 ?auto_39727 ) ( CLEAR ?auto_39717 ) ( not ( = ?auto_39716 ?auto_39727 ) ) ( not ( = ?auto_39717 ?auto_39727 ) ) ( not ( = ?auto_39725 ?auto_39727 ) ) ( not ( = ?auto_39723 ?auto_39727 ) ) ( TRUCK-AT ?auto_39721 ?auto_39719 ) )
    :subtasks
    ( ( !DRIVE ?auto_39721 ?auto_39719 ?auto_39718 )
      ( MAKE-ON ?auto_39716 ?auto_39717 )
      ( MAKE-ON-VERIFY ?auto_39716 ?auto_39717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39728 - SURFACE
      ?auto_39729 - SURFACE
    )
    :vars
    (
      ?auto_39735 - HOIST
      ?auto_39736 - PLACE
      ?auto_39731 - PLACE
      ?auto_39734 - HOIST
      ?auto_39739 - SURFACE
      ?auto_39732 - SURFACE
      ?auto_39730 - PLACE
      ?auto_39733 - HOIST
      ?auto_39737 - SURFACE
      ?auto_39738 - TRUCK
      ?auto_39740 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39735 ?auto_39736 ) ( IS-CRATE ?auto_39728 ) ( not ( = ?auto_39728 ?auto_39729 ) ) ( not ( = ?auto_39731 ?auto_39736 ) ) ( HOIST-AT ?auto_39734 ?auto_39731 ) ( not ( = ?auto_39735 ?auto_39734 ) ) ( AVAILABLE ?auto_39734 ) ( SURFACE-AT ?auto_39728 ?auto_39731 ) ( ON ?auto_39728 ?auto_39739 ) ( CLEAR ?auto_39728 ) ( not ( = ?auto_39728 ?auto_39739 ) ) ( not ( = ?auto_39729 ?auto_39739 ) ) ( IS-CRATE ?auto_39729 ) ( not ( = ?auto_39728 ?auto_39732 ) ) ( not ( = ?auto_39729 ?auto_39732 ) ) ( not ( = ?auto_39739 ?auto_39732 ) ) ( not ( = ?auto_39730 ?auto_39736 ) ) ( not ( = ?auto_39731 ?auto_39730 ) ) ( HOIST-AT ?auto_39733 ?auto_39730 ) ( not ( = ?auto_39735 ?auto_39733 ) ) ( not ( = ?auto_39734 ?auto_39733 ) ) ( AVAILABLE ?auto_39733 ) ( SURFACE-AT ?auto_39729 ?auto_39730 ) ( ON ?auto_39729 ?auto_39737 ) ( CLEAR ?auto_39729 ) ( not ( = ?auto_39728 ?auto_39737 ) ) ( not ( = ?auto_39729 ?auto_39737 ) ) ( not ( = ?auto_39739 ?auto_39737 ) ) ( not ( = ?auto_39732 ?auto_39737 ) ) ( TRUCK-AT ?auto_39738 ?auto_39736 ) ( SURFACE-AT ?auto_39740 ?auto_39736 ) ( CLEAR ?auto_39740 ) ( LIFTING ?auto_39735 ?auto_39732 ) ( IS-CRATE ?auto_39732 ) ( not ( = ?auto_39728 ?auto_39740 ) ) ( not ( = ?auto_39729 ?auto_39740 ) ) ( not ( = ?auto_39739 ?auto_39740 ) ) ( not ( = ?auto_39732 ?auto_39740 ) ) ( not ( = ?auto_39737 ?auto_39740 ) ) )
    :subtasks
    ( ( !DROP ?auto_39735 ?auto_39732 ?auto_39740 ?auto_39736 )
      ( MAKE-ON ?auto_39728 ?auto_39729 )
      ( MAKE-ON-VERIFY ?auto_39728 ?auto_39729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39741 - SURFACE
      ?auto_39742 - SURFACE
    )
    :vars
    (
      ?auto_39750 - HOIST
      ?auto_39752 - PLACE
      ?auto_39746 - PLACE
      ?auto_39747 - HOIST
      ?auto_39753 - SURFACE
      ?auto_39749 - SURFACE
      ?auto_39744 - PLACE
      ?auto_39751 - HOIST
      ?auto_39743 - SURFACE
      ?auto_39748 - TRUCK
      ?auto_39745 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39750 ?auto_39752 ) ( IS-CRATE ?auto_39741 ) ( not ( = ?auto_39741 ?auto_39742 ) ) ( not ( = ?auto_39746 ?auto_39752 ) ) ( HOIST-AT ?auto_39747 ?auto_39746 ) ( not ( = ?auto_39750 ?auto_39747 ) ) ( AVAILABLE ?auto_39747 ) ( SURFACE-AT ?auto_39741 ?auto_39746 ) ( ON ?auto_39741 ?auto_39753 ) ( CLEAR ?auto_39741 ) ( not ( = ?auto_39741 ?auto_39753 ) ) ( not ( = ?auto_39742 ?auto_39753 ) ) ( IS-CRATE ?auto_39742 ) ( not ( = ?auto_39741 ?auto_39749 ) ) ( not ( = ?auto_39742 ?auto_39749 ) ) ( not ( = ?auto_39753 ?auto_39749 ) ) ( not ( = ?auto_39744 ?auto_39752 ) ) ( not ( = ?auto_39746 ?auto_39744 ) ) ( HOIST-AT ?auto_39751 ?auto_39744 ) ( not ( = ?auto_39750 ?auto_39751 ) ) ( not ( = ?auto_39747 ?auto_39751 ) ) ( AVAILABLE ?auto_39751 ) ( SURFACE-AT ?auto_39742 ?auto_39744 ) ( ON ?auto_39742 ?auto_39743 ) ( CLEAR ?auto_39742 ) ( not ( = ?auto_39741 ?auto_39743 ) ) ( not ( = ?auto_39742 ?auto_39743 ) ) ( not ( = ?auto_39753 ?auto_39743 ) ) ( not ( = ?auto_39749 ?auto_39743 ) ) ( TRUCK-AT ?auto_39748 ?auto_39752 ) ( SURFACE-AT ?auto_39745 ?auto_39752 ) ( CLEAR ?auto_39745 ) ( IS-CRATE ?auto_39749 ) ( not ( = ?auto_39741 ?auto_39745 ) ) ( not ( = ?auto_39742 ?auto_39745 ) ) ( not ( = ?auto_39753 ?auto_39745 ) ) ( not ( = ?auto_39749 ?auto_39745 ) ) ( not ( = ?auto_39743 ?auto_39745 ) ) ( AVAILABLE ?auto_39750 ) ( IN ?auto_39749 ?auto_39748 ) )
    :subtasks
    ( ( !UNLOAD ?auto_39750 ?auto_39749 ?auto_39748 ?auto_39752 )
      ( MAKE-ON ?auto_39741 ?auto_39742 )
      ( MAKE-ON-VERIFY ?auto_39741 ?auto_39742 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39754 - SURFACE
      ?auto_39755 - SURFACE
    )
    :vars
    (
      ?auto_39759 - HOIST
      ?auto_39760 - PLACE
      ?auto_39758 - PLACE
      ?auto_39757 - HOIST
      ?auto_39764 - SURFACE
      ?auto_39765 - SURFACE
      ?auto_39761 - PLACE
      ?auto_39756 - HOIST
      ?auto_39763 - SURFACE
      ?auto_39766 - SURFACE
      ?auto_39762 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39759 ?auto_39760 ) ( IS-CRATE ?auto_39754 ) ( not ( = ?auto_39754 ?auto_39755 ) ) ( not ( = ?auto_39758 ?auto_39760 ) ) ( HOIST-AT ?auto_39757 ?auto_39758 ) ( not ( = ?auto_39759 ?auto_39757 ) ) ( AVAILABLE ?auto_39757 ) ( SURFACE-AT ?auto_39754 ?auto_39758 ) ( ON ?auto_39754 ?auto_39764 ) ( CLEAR ?auto_39754 ) ( not ( = ?auto_39754 ?auto_39764 ) ) ( not ( = ?auto_39755 ?auto_39764 ) ) ( IS-CRATE ?auto_39755 ) ( not ( = ?auto_39754 ?auto_39765 ) ) ( not ( = ?auto_39755 ?auto_39765 ) ) ( not ( = ?auto_39764 ?auto_39765 ) ) ( not ( = ?auto_39761 ?auto_39760 ) ) ( not ( = ?auto_39758 ?auto_39761 ) ) ( HOIST-AT ?auto_39756 ?auto_39761 ) ( not ( = ?auto_39759 ?auto_39756 ) ) ( not ( = ?auto_39757 ?auto_39756 ) ) ( AVAILABLE ?auto_39756 ) ( SURFACE-AT ?auto_39755 ?auto_39761 ) ( ON ?auto_39755 ?auto_39763 ) ( CLEAR ?auto_39755 ) ( not ( = ?auto_39754 ?auto_39763 ) ) ( not ( = ?auto_39755 ?auto_39763 ) ) ( not ( = ?auto_39764 ?auto_39763 ) ) ( not ( = ?auto_39765 ?auto_39763 ) ) ( SURFACE-AT ?auto_39766 ?auto_39760 ) ( CLEAR ?auto_39766 ) ( IS-CRATE ?auto_39765 ) ( not ( = ?auto_39754 ?auto_39766 ) ) ( not ( = ?auto_39755 ?auto_39766 ) ) ( not ( = ?auto_39764 ?auto_39766 ) ) ( not ( = ?auto_39765 ?auto_39766 ) ) ( not ( = ?auto_39763 ?auto_39766 ) ) ( AVAILABLE ?auto_39759 ) ( IN ?auto_39765 ?auto_39762 ) ( TRUCK-AT ?auto_39762 ?auto_39758 ) )
    :subtasks
    ( ( !DRIVE ?auto_39762 ?auto_39758 ?auto_39760 )
      ( MAKE-ON ?auto_39754 ?auto_39755 )
      ( MAKE-ON-VERIFY ?auto_39754 ?auto_39755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39767 - SURFACE
      ?auto_39768 - SURFACE
    )
    :vars
    (
      ?auto_39771 - HOIST
      ?auto_39777 - PLACE
      ?auto_39779 - PLACE
      ?auto_39775 - HOIST
      ?auto_39770 - SURFACE
      ?auto_39776 - SURFACE
      ?auto_39773 - PLACE
      ?auto_39769 - HOIST
      ?auto_39772 - SURFACE
      ?auto_39778 - SURFACE
      ?auto_39774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39771 ?auto_39777 ) ( IS-CRATE ?auto_39767 ) ( not ( = ?auto_39767 ?auto_39768 ) ) ( not ( = ?auto_39779 ?auto_39777 ) ) ( HOIST-AT ?auto_39775 ?auto_39779 ) ( not ( = ?auto_39771 ?auto_39775 ) ) ( SURFACE-AT ?auto_39767 ?auto_39779 ) ( ON ?auto_39767 ?auto_39770 ) ( CLEAR ?auto_39767 ) ( not ( = ?auto_39767 ?auto_39770 ) ) ( not ( = ?auto_39768 ?auto_39770 ) ) ( IS-CRATE ?auto_39768 ) ( not ( = ?auto_39767 ?auto_39776 ) ) ( not ( = ?auto_39768 ?auto_39776 ) ) ( not ( = ?auto_39770 ?auto_39776 ) ) ( not ( = ?auto_39773 ?auto_39777 ) ) ( not ( = ?auto_39779 ?auto_39773 ) ) ( HOIST-AT ?auto_39769 ?auto_39773 ) ( not ( = ?auto_39771 ?auto_39769 ) ) ( not ( = ?auto_39775 ?auto_39769 ) ) ( AVAILABLE ?auto_39769 ) ( SURFACE-AT ?auto_39768 ?auto_39773 ) ( ON ?auto_39768 ?auto_39772 ) ( CLEAR ?auto_39768 ) ( not ( = ?auto_39767 ?auto_39772 ) ) ( not ( = ?auto_39768 ?auto_39772 ) ) ( not ( = ?auto_39770 ?auto_39772 ) ) ( not ( = ?auto_39776 ?auto_39772 ) ) ( SURFACE-AT ?auto_39778 ?auto_39777 ) ( CLEAR ?auto_39778 ) ( IS-CRATE ?auto_39776 ) ( not ( = ?auto_39767 ?auto_39778 ) ) ( not ( = ?auto_39768 ?auto_39778 ) ) ( not ( = ?auto_39770 ?auto_39778 ) ) ( not ( = ?auto_39776 ?auto_39778 ) ) ( not ( = ?auto_39772 ?auto_39778 ) ) ( AVAILABLE ?auto_39771 ) ( TRUCK-AT ?auto_39774 ?auto_39779 ) ( LIFTING ?auto_39775 ?auto_39776 ) )
    :subtasks
    ( ( !LOAD ?auto_39775 ?auto_39776 ?auto_39774 ?auto_39779 )
      ( MAKE-ON ?auto_39767 ?auto_39768 )
      ( MAKE-ON-VERIFY ?auto_39767 ?auto_39768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39780 - SURFACE
      ?auto_39781 - SURFACE
    )
    :vars
    (
      ?auto_39792 - HOIST
      ?auto_39791 - PLACE
      ?auto_39785 - PLACE
      ?auto_39789 - HOIST
      ?auto_39784 - SURFACE
      ?auto_39786 - SURFACE
      ?auto_39787 - PLACE
      ?auto_39783 - HOIST
      ?auto_39788 - SURFACE
      ?auto_39790 - SURFACE
      ?auto_39782 - TRUCK
      ?auto_39793 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39792 ?auto_39791 ) ( IS-CRATE ?auto_39780 ) ( not ( = ?auto_39780 ?auto_39781 ) ) ( not ( = ?auto_39785 ?auto_39791 ) ) ( HOIST-AT ?auto_39789 ?auto_39785 ) ( not ( = ?auto_39792 ?auto_39789 ) ) ( SURFACE-AT ?auto_39780 ?auto_39785 ) ( ON ?auto_39780 ?auto_39784 ) ( CLEAR ?auto_39780 ) ( not ( = ?auto_39780 ?auto_39784 ) ) ( not ( = ?auto_39781 ?auto_39784 ) ) ( IS-CRATE ?auto_39781 ) ( not ( = ?auto_39780 ?auto_39786 ) ) ( not ( = ?auto_39781 ?auto_39786 ) ) ( not ( = ?auto_39784 ?auto_39786 ) ) ( not ( = ?auto_39787 ?auto_39791 ) ) ( not ( = ?auto_39785 ?auto_39787 ) ) ( HOIST-AT ?auto_39783 ?auto_39787 ) ( not ( = ?auto_39792 ?auto_39783 ) ) ( not ( = ?auto_39789 ?auto_39783 ) ) ( AVAILABLE ?auto_39783 ) ( SURFACE-AT ?auto_39781 ?auto_39787 ) ( ON ?auto_39781 ?auto_39788 ) ( CLEAR ?auto_39781 ) ( not ( = ?auto_39780 ?auto_39788 ) ) ( not ( = ?auto_39781 ?auto_39788 ) ) ( not ( = ?auto_39784 ?auto_39788 ) ) ( not ( = ?auto_39786 ?auto_39788 ) ) ( SURFACE-AT ?auto_39790 ?auto_39791 ) ( CLEAR ?auto_39790 ) ( IS-CRATE ?auto_39786 ) ( not ( = ?auto_39780 ?auto_39790 ) ) ( not ( = ?auto_39781 ?auto_39790 ) ) ( not ( = ?auto_39784 ?auto_39790 ) ) ( not ( = ?auto_39786 ?auto_39790 ) ) ( not ( = ?auto_39788 ?auto_39790 ) ) ( AVAILABLE ?auto_39792 ) ( TRUCK-AT ?auto_39782 ?auto_39785 ) ( AVAILABLE ?auto_39789 ) ( SURFACE-AT ?auto_39786 ?auto_39785 ) ( ON ?auto_39786 ?auto_39793 ) ( CLEAR ?auto_39786 ) ( not ( = ?auto_39780 ?auto_39793 ) ) ( not ( = ?auto_39781 ?auto_39793 ) ) ( not ( = ?auto_39784 ?auto_39793 ) ) ( not ( = ?auto_39786 ?auto_39793 ) ) ( not ( = ?auto_39788 ?auto_39793 ) ) ( not ( = ?auto_39790 ?auto_39793 ) ) )
    :subtasks
    ( ( !LIFT ?auto_39789 ?auto_39786 ?auto_39793 ?auto_39785 )
      ( MAKE-ON ?auto_39780 ?auto_39781 )
      ( MAKE-ON-VERIFY ?auto_39780 ?auto_39781 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39794 - SURFACE
      ?auto_39795 - SURFACE
    )
    :vars
    (
      ?auto_39799 - HOIST
      ?auto_39803 - PLACE
      ?auto_39798 - PLACE
      ?auto_39801 - HOIST
      ?auto_39797 - SURFACE
      ?auto_39807 - SURFACE
      ?auto_39800 - PLACE
      ?auto_39804 - HOIST
      ?auto_39802 - SURFACE
      ?auto_39805 - SURFACE
      ?auto_39796 - SURFACE
      ?auto_39806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39799 ?auto_39803 ) ( IS-CRATE ?auto_39794 ) ( not ( = ?auto_39794 ?auto_39795 ) ) ( not ( = ?auto_39798 ?auto_39803 ) ) ( HOIST-AT ?auto_39801 ?auto_39798 ) ( not ( = ?auto_39799 ?auto_39801 ) ) ( SURFACE-AT ?auto_39794 ?auto_39798 ) ( ON ?auto_39794 ?auto_39797 ) ( CLEAR ?auto_39794 ) ( not ( = ?auto_39794 ?auto_39797 ) ) ( not ( = ?auto_39795 ?auto_39797 ) ) ( IS-CRATE ?auto_39795 ) ( not ( = ?auto_39794 ?auto_39807 ) ) ( not ( = ?auto_39795 ?auto_39807 ) ) ( not ( = ?auto_39797 ?auto_39807 ) ) ( not ( = ?auto_39800 ?auto_39803 ) ) ( not ( = ?auto_39798 ?auto_39800 ) ) ( HOIST-AT ?auto_39804 ?auto_39800 ) ( not ( = ?auto_39799 ?auto_39804 ) ) ( not ( = ?auto_39801 ?auto_39804 ) ) ( AVAILABLE ?auto_39804 ) ( SURFACE-AT ?auto_39795 ?auto_39800 ) ( ON ?auto_39795 ?auto_39802 ) ( CLEAR ?auto_39795 ) ( not ( = ?auto_39794 ?auto_39802 ) ) ( not ( = ?auto_39795 ?auto_39802 ) ) ( not ( = ?auto_39797 ?auto_39802 ) ) ( not ( = ?auto_39807 ?auto_39802 ) ) ( SURFACE-AT ?auto_39805 ?auto_39803 ) ( CLEAR ?auto_39805 ) ( IS-CRATE ?auto_39807 ) ( not ( = ?auto_39794 ?auto_39805 ) ) ( not ( = ?auto_39795 ?auto_39805 ) ) ( not ( = ?auto_39797 ?auto_39805 ) ) ( not ( = ?auto_39807 ?auto_39805 ) ) ( not ( = ?auto_39802 ?auto_39805 ) ) ( AVAILABLE ?auto_39799 ) ( AVAILABLE ?auto_39801 ) ( SURFACE-AT ?auto_39807 ?auto_39798 ) ( ON ?auto_39807 ?auto_39796 ) ( CLEAR ?auto_39807 ) ( not ( = ?auto_39794 ?auto_39796 ) ) ( not ( = ?auto_39795 ?auto_39796 ) ) ( not ( = ?auto_39797 ?auto_39796 ) ) ( not ( = ?auto_39807 ?auto_39796 ) ) ( not ( = ?auto_39802 ?auto_39796 ) ) ( not ( = ?auto_39805 ?auto_39796 ) ) ( TRUCK-AT ?auto_39806 ?auto_39803 ) )
    :subtasks
    ( ( !DRIVE ?auto_39806 ?auto_39803 ?auto_39798 )
      ( MAKE-ON ?auto_39794 ?auto_39795 )
      ( MAKE-ON-VERIFY ?auto_39794 ?auto_39795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39810 - SURFACE
      ?auto_39811 - SURFACE
    )
    :vars
    (
      ?auto_39812 - HOIST
      ?auto_39813 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39812 ?auto_39813 ) ( SURFACE-AT ?auto_39811 ?auto_39813 ) ( CLEAR ?auto_39811 ) ( LIFTING ?auto_39812 ?auto_39810 ) ( IS-CRATE ?auto_39810 ) ( not ( = ?auto_39810 ?auto_39811 ) ) )
    :subtasks
    ( ( !DROP ?auto_39812 ?auto_39810 ?auto_39811 ?auto_39813 )
      ( MAKE-ON-VERIFY ?auto_39810 ?auto_39811 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39814 - SURFACE
      ?auto_39815 - SURFACE
    )
    :vars
    (
      ?auto_39817 - HOIST
      ?auto_39816 - PLACE
      ?auto_39818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39817 ?auto_39816 ) ( SURFACE-AT ?auto_39815 ?auto_39816 ) ( CLEAR ?auto_39815 ) ( IS-CRATE ?auto_39814 ) ( not ( = ?auto_39814 ?auto_39815 ) ) ( TRUCK-AT ?auto_39818 ?auto_39816 ) ( AVAILABLE ?auto_39817 ) ( IN ?auto_39814 ?auto_39818 ) )
    :subtasks
    ( ( !UNLOAD ?auto_39817 ?auto_39814 ?auto_39818 ?auto_39816 )
      ( MAKE-ON ?auto_39814 ?auto_39815 )
      ( MAKE-ON-VERIFY ?auto_39814 ?auto_39815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39819 - SURFACE
      ?auto_39820 - SURFACE
    )
    :vars
    (
      ?auto_39822 - HOIST
      ?auto_39823 - PLACE
      ?auto_39821 - TRUCK
      ?auto_39824 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39822 ?auto_39823 ) ( SURFACE-AT ?auto_39820 ?auto_39823 ) ( CLEAR ?auto_39820 ) ( IS-CRATE ?auto_39819 ) ( not ( = ?auto_39819 ?auto_39820 ) ) ( AVAILABLE ?auto_39822 ) ( IN ?auto_39819 ?auto_39821 ) ( TRUCK-AT ?auto_39821 ?auto_39824 ) ( not ( = ?auto_39824 ?auto_39823 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_39821 ?auto_39824 ?auto_39823 )
      ( MAKE-ON ?auto_39819 ?auto_39820 )
      ( MAKE-ON-VERIFY ?auto_39819 ?auto_39820 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39825 - SURFACE
      ?auto_39826 - SURFACE
    )
    :vars
    (
      ?auto_39828 - HOIST
      ?auto_39827 - PLACE
      ?auto_39829 - TRUCK
      ?auto_39830 - PLACE
      ?auto_39831 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_39828 ?auto_39827 ) ( SURFACE-AT ?auto_39826 ?auto_39827 ) ( CLEAR ?auto_39826 ) ( IS-CRATE ?auto_39825 ) ( not ( = ?auto_39825 ?auto_39826 ) ) ( AVAILABLE ?auto_39828 ) ( TRUCK-AT ?auto_39829 ?auto_39830 ) ( not ( = ?auto_39830 ?auto_39827 ) ) ( HOIST-AT ?auto_39831 ?auto_39830 ) ( LIFTING ?auto_39831 ?auto_39825 ) ( not ( = ?auto_39828 ?auto_39831 ) ) )
    :subtasks
    ( ( !LOAD ?auto_39831 ?auto_39825 ?auto_39829 ?auto_39830 )
      ( MAKE-ON ?auto_39825 ?auto_39826 )
      ( MAKE-ON-VERIFY ?auto_39825 ?auto_39826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39832 - SURFACE
      ?auto_39833 - SURFACE
    )
    :vars
    (
      ?auto_39834 - HOIST
      ?auto_39836 - PLACE
      ?auto_39837 - TRUCK
      ?auto_39835 - PLACE
      ?auto_39838 - HOIST
      ?auto_39839 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39834 ?auto_39836 ) ( SURFACE-AT ?auto_39833 ?auto_39836 ) ( CLEAR ?auto_39833 ) ( IS-CRATE ?auto_39832 ) ( not ( = ?auto_39832 ?auto_39833 ) ) ( AVAILABLE ?auto_39834 ) ( TRUCK-AT ?auto_39837 ?auto_39835 ) ( not ( = ?auto_39835 ?auto_39836 ) ) ( HOIST-AT ?auto_39838 ?auto_39835 ) ( not ( = ?auto_39834 ?auto_39838 ) ) ( AVAILABLE ?auto_39838 ) ( SURFACE-AT ?auto_39832 ?auto_39835 ) ( ON ?auto_39832 ?auto_39839 ) ( CLEAR ?auto_39832 ) ( not ( = ?auto_39832 ?auto_39839 ) ) ( not ( = ?auto_39833 ?auto_39839 ) ) )
    :subtasks
    ( ( !LIFT ?auto_39838 ?auto_39832 ?auto_39839 ?auto_39835 )
      ( MAKE-ON ?auto_39832 ?auto_39833 )
      ( MAKE-ON-VERIFY ?auto_39832 ?auto_39833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39840 - SURFACE
      ?auto_39841 - SURFACE
    )
    :vars
    (
      ?auto_39847 - HOIST
      ?auto_39846 - PLACE
      ?auto_39844 - PLACE
      ?auto_39842 - HOIST
      ?auto_39845 - SURFACE
      ?auto_39843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39847 ?auto_39846 ) ( SURFACE-AT ?auto_39841 ?auto_39846 ) ( CLEAR ?auto_39841 ) ( IS-CRATE ?auto_39840 ) ( not ( = ?auto_39840 ?auto_39841 ) ) ( AVAILABLE ?auto_39847 ) ( not ( = ?auto_39844 ?auto_39846 ) ) ( HOIST-AT ?auto_39842 ?auto_39844 ) ( not ( = ?auto_39847 ?auto_39842 ) ) ( AVAILABLE ?auto_39842 ) ( SURFACE-AT ?auto_39840 ?auto_39844 ) ( ON ?auto_39840 ?auto_39845 ) ( CLEAR ?auto_39840 ) ( not ( = ?auto_39840 ?auto_39845 ) ) ( not ( = ?auto_39841 ?auto_39845 ) ) ( TRUCK-AT ?auto_39843 ?auto_39846 ) )
    :subtasks
    ( ( !DRIVE ?auto_39843 ?auto_39846 ?auto_39844 )
      ( MAKE-ON ?auto_39840 ?auto_39841 )
      ( MAKE-ON-VERIFY ?auto_39840 ?auto_39841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39848 - SURFACE
      ?auto_39849 - SURFACE
    )
    :vars
    (
      ?auto_39852 - HOIST
      ?auto_39851 - PLACE
      ?auto_39853 - PLACE
      ?auto_39850 - HOIST
      ?auto_39854 - SURFACE
      ?auto_39855 - TRUCK
      ?auto_39856 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39852 ?auto_39851 ) ( IS-CRATE ?auto_39848 ) ( not ( = ?auto_39848 ?auto_39849 ) ) ( not ( = ?auto_39853 ?auto_39851 ) ) ( HOIST-AT ?auto_39850 ?auto_39853 ) ( not ( = ?auto_39852 ?auto_39850 ) ) ( AVAILABLE ?auto_39850 ) ( SURFACE-AT ?auto_39848 ?auto_39853 ) ( ON ?auto_39848 ?auto_39854 ) ( CLEAR ?auto_39848 ) ( not ( = ?auto_39848 ?auto_39854 ) ) ( not ( = ?auto_39849 ?auto_39854 ) ) ( TRUCK-AT ?auto_39855 ?auto_39851 ) ( SURFACE-AT ?auto_39856 ?auto_39851 ) ( CLEAR ?auto_39856 ) ( LIFTING ?auto_39852 ?auto_39849 ) ( IS-CRATE ?auto_39849 ) ( not ( = ?auto_39848 ?auto_39856 ) ) ( not ( = ?auto_39849 ?auto_39856 ) ) ( not ( = ?auto_39854 ?auto_39856 ) ) )
    :subtasks
    ( ( !DROP ?auto_39852 ?auto_39849 ?auto_39856 ?auto_39851 )
      ( MAKE-ON ?auto_39848 ?auto_39849 )
      ( MAKE-ON-VERIFY ?auto_39848 ?auto_39849 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39857 - SURFACE
      ?auto_39858 - SURFACE
    )
    :vars
    (
      ?auto_39859 - HOIST
      ?auto_39862 - PLACE
      ?auto_39864 - PLACE
      ?auto_39861 - HOIST
      ?auto_39860 - SURFACE
      ?auto_39865 - TRUCK
      ?auto_39863 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39859 ?auto_39862 ) ( IS-CRATE ?auto_39857 ) ( not ( = ?auto_39857 ?auto_39858 ) ) ( not ( = ?auto_39864 ?auto_39862 ) ) ( HOIST-AT ?auto_39861 ?auto_39864 ) ( not ( = ?auto_39859 ?auto_39861 ) ) ( AVAILABLE ?auto_39861 ) ( SURFACE-AT ?auto_39857 ?auto_39864 ) ( ON ?auto_39857 ?auto_39860 ) ( CLEAR ?auto_39857 ) ( not ( = ?auto_39857 ?auto_39860 ) ) ( not ( = ?auto_39858 ?auto_39860 ) ) ( TRUCK-AT ?auto_39865 ?auto_39862 ) ( SURFACE-AT ?auto_39863 ?auto_39862 ) ( CLEAR ?auto_39863 ) ( IS-CRATE ?auto_39858 ) ( not ( = ?auto_39857 ?auto_39863 ) ) ( not ( = ?auto_39858 ?auto_39863 ) ) ( not ( = ?auto_39860 ?auto_39863 ) ) ( AVAILABLE ?auto_39859 ) ( IN ?auto_39858 ?auto_39865 ) )
    :subtasks
    ( ( !UNLOAD ?auto_39859 ?auto_39858 ?auto_39865 ?auto_39862 )
      ( MAKE-ON ?auto_39857 ?auto_39858 )
      ( MAKE-ON-VERIFY ?auto_39857 ?auto_39858 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39866 - SURFACE
      ?auto_39867 - SURFACE
    )
    :vars
    (
      ?auto_39874 - HOIST
      ?auto_39870 - PLACE
      ?auto_39873 - PLACE
      ?auto_39869 - HOIST
      ?auto_39868 - SURFACE
      ?auto_39871 - SURFACE
      ?auto_39872 - TRUCK
      ?auto_39875 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39874 ?auto_39870 ) ( IS-CRATE ?auto_39866 ) ( not ( = ?auto_39866 ?auto_39867 ) ) ( not ( = ?auto_39873 ?auto_39870 ) ) ( HOIST-AT ?auto_39869 ?auto_39873 ) ( not ( = ?auto_39874 ?auto_39869 ) ) ( AVAILABLE ?auto_39869 ) ( SURFACE-AT ?auto_39866 ?auto_39873 ) ( ON ?auto_39866 ?auto_39868 ) ( CLEAR ?auto_39866 ) ( not ( = ?auto_39866 ?auto_39868 ) ) ( not ( = ?auto_39867 ?auto_39868 ) ) ( SURFACE-AT ?auto_39871 ?auto_39870 ) ( CLEAR ?auto_39871 ) ( IS-CRATE ?auto_39867 ) ( not ( = ?auto_39866 ?auto_39871 ) ) ( not ( = ?auto_39867 ?auto_39871 ) ) ( not ( = ?auto_39868 ?auto_39871 ) ) ( AVAILABLE ?auto_39874 ) ( IN ?auto_39867 ?auto_39872 ) ( TRUCK-AT ?auto_39872 ?auto_39875 ) ( not ( = ?auto_39875 ?auto_39870 ) ) ( not ( = ?auto_39873 ?auto_39875 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_39872 ?auto_39875 ?auto_39870 )
      ( MAKE-ON ?auto_39866 ?auto_39867 )
      ( MAKE-ON-VERIFY ?auto_39866 ?auto_39867 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39876 - SURFACE
      ?auto_39877 - SURFACE
    )
    :vars
    (
      ?auto_39879 - HOIST
      ?auto_39884 - PLACE
      ?auto_39881 - PLACE
      ?auto_39883 - HOIST
      ?auto_39885 - SURFACE
      ?auto_39880 - SURFACE
      ?auto_39878 - TRUCK
      ?auto_39882 - PLACE
      ?auto_39886 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_39879 ?auto_39884 ) ( IS-CRATE ?auto_39876 ) ( not ( = ?auto_39876 ?auto_39877 ) ) ( not ( = ?auto_39881 ?auto_39884 ) ) ( HOIST-AT ?auto_39883 ?auto_39881 ) ( not ( = ?auto_39879 ?auto_39883 ) ) ( AVAILABLE ?auto_39883 ) ( SURFACE-AT ?auto_39876 ?auto_39881 ) ( ON ?auto_39876 ?auto_39885 ) ( CLEAR ?auto_39876 ) ( not ( = ?auto_39876 ?auto_39885 ) ) ( not ( = ?auto_39877 ?auto_39885 ) ) ( SURFACE-AT ?auto_39880 ?auto_39884 ) ( CLEAR ?auto_39880 ) ( IS-CRATE ?auto_39877 ) ( not ( = ?auto_39876 ?auto_39880 ) ) ( not ( = ?auto_39877 ?auto_39880 ) ) ( not ( = ?auto_39885 ?auto_39880 ) ) ( AVAILABLE ?auto_39879 ) ( TRUCK-AT ?auto_39878 ?auto_39882 ) ( not ( = ?auto_39882 ?auto_39884 ) ) ( not ( = ?auto_39881 ?auto_39882 ) ) ( HOIST-AT ?auto_39886 ?auto_39882 ) ( LIFTING ?auto_39886 ?auto_39877 ) ( not ( = ?auto_39879 ?auto_39886 ) ) ( not ( = ?auto_39883 ?auto_39886 ) ) )
    :subtasks
    ( ( !LOAD ?auto_39886 ?auto_39877 ?auto_39878 ?auto_39882 )
      ( MAKE-ON ?auto_39876 ?auto_39877 )
      ( MAKE-ON-VERIFY ?auto_39876 ?auto_39877 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39887 - SURFACE
      ?auto_39888 - SURFACE
    )
    :vars
    (
      ?auto_39890 - HOIST
      ?auto_39897 - PLACE
      ?auto_39894 - PLACE
      ?auto_39896 - HOIST
      ?auto_39891 - SURFACE
      ?auto_39893 - SURFACE
      ?auto_39892 - TRUCK
      ?auto_39889 - PLACE
      ?auto_39895 - HOIST
      ?auto_39898 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39890 ?auto_39897 ) ( IS-CRATE ?auto_39887 ) ( not ( = ?auto_39887 ?auto_39888 ) ) ( not ( = ?auto_39894 ?auto_39897 ) ) ( HOIST-AT ?auto_39896 ?auto_39894 ) ( not ( = ?auto_39890 ?auto_39896 ) ) ( AVAILABLE ?auto_39896 ) ( SURFACE-AT ?auto_39887 ?auto_39894 ) ( ON ?auto_39887 ?auto_39891 ) ( CLEAR ?auto_39887 ) ( not ( = ?auto_39887 ?auto_39891 ) ) ( not ( = ?auto_39888 ?auto_39891 ) ) ( SURFACE-AT ?auto_39893 ?auto_39897 ) ( CLEAR ?auto_39893 ) ( IS-CRATE ?auto_39888 ) ( not ( = ?auto_39887 ?auto_39893 ) ) ( not ( = ?auto_39888 ?auto_39893 ) ) ( not ( = ?auto_39891 ?auto_39893 ) ) ( AVAILABLE ?auto_39890 ) ( TRUCK-AT ?auto_39892 ?auto_39889 ) ( not ( = ?auto_39889 ?auto_39897 ) ) ( not ( = ?auto_39894 ?auto_39889 ) ) ( HOIST-AT ?auto_39895 ?auto_39889 ) ( not ( = ?auto_39890 ?auto_39895 ) ) ( not ( = ?auto_39896 ?auto_39895 ) ) ( AVAILABLE ?auto_39895 ) ( SURFACE-AT ?auto_39888 ?auto_39889 ) ( ON ?auto_39888 ?auto_39898 ) ( CLEAR ?auto_39888 ) ( not ( = ?auto_39887 ?auto_39898 ) ) ( not ( = ?auto_39888 ?auto_39898 ) ) ( not ( = ?auto_39891 ?auto_39898 ) ) ( not ( = ?auto_39893 ?auto_39898 ) ) )
    :subtasks
    ( ( !LIFT ?auto_39895 ?auto_39888 ?auto_39898 ?auto_39889 )
      ( MAKE-ON ?auto_39887 ?auto_39888 )
      ( MAKE-ON-VERIFY ?auto_39887 ?auto_39888 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39899 - SURFACE
      ?auto_39900 - SURFACE
    )
    :vars
    (
      ?auto_39904 - HOIST
      ?auto_39901 - PLACE
      ?auto_39908 - PLACE
      ?auto_39903 - HOIST
      ?auto_39907 - SURFACE
      ?auto_39902 - SURFACE
      ?auto_39910 - PLACE
      ?auto_39906 - HOIST
      ?auto_39905 - SURFACE
      ?auto_39909 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39904 ?auto_39901 ) ( IS-CRATE ?auto_39899 ) ( not ( = ?auto_39899 ?auto_39900 ) ) ( not ( = ?auto_39908 ?auto_39901 ) ) ( HOIST-AT ?auto_39903 ?auto_39908 ) ( not ( = ?auto_39904 ?auto_39903 ) ) ( AVAILABLE ?auto_39903 ) ( SURFACE-AT ?auto_39899 ?auto_39908 ) ( ON ?auto_39899 ?auto_39907 ) ( CLEAR ?auto_39899 ) ( not ( = ?auto_39899 ?auto_39907 ) ) ( not ( = ?auto_39900 ?auto_39907 ) ) ( SURFACE-AT ?auto_39902 ?auto_39901 ) ( CLEAR ?auto_39902 ) ( IS-CRATE ?auto_39900 ) ( not ( = ?auto_39899 ?auto_39902 ) ) ( not ( = ?auto_39900 ?auto_39902 ) ) ( not ( = ?auto_39907 ?auto_39902 ) ) ( AVAILABLE ?auto_39904 ) ( not ( = ?auto_39910 ?auto_39901 ) ) ( not ( = ?auto_39908 ?auto_39910 ) ) ( HOIST-AT ?auto_39906 ?auto_39910 ) ( not ( = ?auto_39904 ?auto_39906 ) ) ( not ( = ?auto_39903 ?auto_39906 ) ) ( AVAILABLE ?auto_39906 ) ( SURFACE-AT ?auto_39900 ?auto_39910 ) ( ON ?auto_39900 ?auto_39905 ) ( CLEAR ?auto_39900 ) ( not ( = ?auto_39899 ?auto_39905 ) ) ( not ( = ?auto_39900 ?auto_39905 ) ) ( not ( = ?auto_39907 ?auto_39905 ) ) ( not ( = ?auto_39902 ?auto_39905 ) ) ( TRUCK-AT ?auto_39909 ?auto_39901 ) )
    :subtasks
    ( ( !DRIVE ?auto_39909 ?auto_39901 ?auto_39910 )
      ( MAKE-ON ?auto_39899 ?auto_39900 )
      ( MAKE-ON-VERIFY ?auto_39899 ?auto_39900 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39911 - SURFACE
      ?auto_39912 - SURFACE
    )
    :vars
    (
      ?auto_39913 - HOIST
      ?auto_39921 - PLACE
      ?auto_39918 - PLACE
      ?auto_39920 - HOIST
      ?auto_39919 - SURFACE
      ?auto_39916 - SURFACE
      ?auto_39915 - PLACE
      ?auto_39922 - HOIST
      ?auto_39914 - SURFACE
      ?auto_39917 - TRUCK
      ?auto_39923 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39913 ?auto_39921 ) ( IS-CRATE ?auto_39911 ) ( not ( = ?auto_39911 ?auto_39912 ) ) ( not ( = ?auto_39918 ?auto_39921 ) ) ( HOIST-AT ?auto_39920 ?auto_39918 ) ( not ( = ?auto_39913 ?auto_39920 ) ) ( AVAILABLE ?auto_39920 ) ( SURFACE-AT ?auto_39911 ?auto_39918 ) ( ON ?auto_39911 ?auto_39919 ) ( CLEAR ?auto_39911 ) ( not ( = ?auto_39911 ?auto_39919 ) ) ( not ( = ?auto_39912 ?auto_39919 ) ) ( IS-CRATE ?auto_39912 ) ( not ( = ?auto_39911 ?auto_39916 ) ) ( not ( = ?auto_39912 ?auto_39916 ) ) ( not ( = ?auto_39919 ?auto_39916 ) ) ( not ( = ?auto_39915 ?auto_39921 ) ) ( not ( = ?auto_39918 ?auto_39915 ) ) ( HOIST-AT ?auto_39922 ?auto_39915 ) ( not ( = ?auto_39913 ?auto_39922 ) ) ( not ( = ?auto_39920 ?auto_39922 ) ) ( AVAILABLE ?auto_39922 ) ( SURFACE-AT ?auto_39912 ?auto_39915 ) ( ON ?auto_39912 ?auto_39914 ) ( CLEAR ?auto_39912 ) ( not ( = ?auto_39911 ?auto_39914 ) ) ( not ( = ?auto_39912 ?auto_39914 ) ) ( not ( = ?auto_39919 ?auto_39914 ) ) ( not ( = ?auto_39916 ?auto_39914 ) ) ( TRUCK-AT ?auto_39917 ?auto_39921 ) ( SURFACE-AT ?auto_39923 ?auto_39921 ) ( CLEAR ?auto_39923 ) ( LIFTING ?auto_39913 ?auto_39916 ) ( IS-CRATE ?auto_39916 ) ( not ( = ?auto_39911 ?auto_39923 ) ) ( not ( = ?auto_39912 ?auto_39923 ) ) ( not ( = ?auto_39919 ?auto_39923 ) ) ( not ( = ?auto_39916 ?auto_39923 ) ) ( not ( = ?auto_39914 ?auto_39923 ) ) )
    :subtasks
    ( ( !DROP ?auto_39913 ?auto_39916 ?auto_39923 ?auto_39921 )
      ( MAKE-ON ?auto_39911 ?auto_39912 )
      ( MAKE-ON-VERIFY ?auto_39911 ?auto_39912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39924 - SURFACE
      ?auto_39925 - SURFACE
    )
    :vars
    (
      ?auto_39927 - HOIST
      ?auto_39936 - PLACE
      ?auto_39932 - PLACE
      ?auto_39934 - HOIST
      ?auto_39929 - SURFACE
      ?auto_39930 - SURFACE
      ?auto_39933 - PLACE
      ?auto_39935 - HOIST
      ?auto_39928 - SURFACE
      ?auto_39931 - TRUCK
      ?auto_39926 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39927 ?auto_39936 ) ( IS-CRATE ?auto_39924 ) ( not ( = ?auto_39924 ?auto_39925 ) ) ( not ( = ?auto_39932 ?auto_39936 ) ) ( HOIST-AT ?auto_39934 ?auto_39932 ) ( not ( = ?auto_39927 ?auto_39934 ) ) ( AVAILABLE ?auto_39934 ) ( SURFACE-AT ?auto_39924 ?auto_39932 ) ( ON ?auto_39924 ?auto_39929 ) ( CLEAR ?auto_39924 ) ( not ( = ?auto_39924 ?auto_39929 ) ) ( not ( = ?auto_39925 ?auto_39929 ) ) ( IS-CRATE ?auto_39925 ) ( not ( = ?auto_39924 ?auto_39930 ) ) ( not ( = ?auto_39925 ?auto_39930 ) ) ( not ( = ?auto_39929 ?auto_39930 ) ) ( not ( = ?auto_39933 ?auto_39936 ) ) ( not ( = ?auto_39932 ?auto_39933 ) ) ( HOIST-AT ?auto_39935 ?auto_39933 ) ( not ( = ?auto_39927 ?auto_39935 ) ) ( not ( = ?auto_39934 ?auto_39935 ) ) ( AVAILABLE ?auto_39935 ) ( SURFACE-AT ?auto_39925 ?auto_39933 ) ( ON ?auto_39925 ?auto_39928 ) ( CLEAR ?auto_39925 ) ( not ( = ?auto_39924 ?auto_39928 ) ) ( not ( = ?auto_39925 ?auto_39928 ) ) ( not ( = ?auto_39929 ?auto_39928 ) ) ( not ( = ?auto_39930 ?auto_39928 ) ) ( TRUCK-AT ?auto_39931 ?auto_39936 ) ( SURFACE-AT ?auto_39926 ?auto_39936 ) ( CLEAR ?auto_39926 ) ( IS-CRATE ?auto_39930 ) ( not ( = ?auto_39924 ?auto_39926 ) ) ( not ( = ?auto_39925 ?auto_39926 ) ) ( not ( = ?auto_39929 ?auto_39926 ) ) ( not ( = ?auto_39930 ?auto_39926 ) ) ( not ( = ?auto_39928 ?auto_39926 ) ) ( AVAILABLE ?auto_39927 ) ( IN ?auto_39930 ?auto_39931 ) )
    :subtasks
    ( ( !UNLOAD ?auto_39927 ?auto_39930 ?auto_39931 ?auto_39936 )
      ( MAKE-ON ?auto_39924 ?auto_39925 )
      ( MAKE-ON-VERIFY ?auto_39924 ?auto_39925 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39937 - SURFACE
      ?auto_39938 - SURFACE
    )
    :vars
    (
      ?auto_39943 - HOIST
      ?auto_39940 - PLACE
      ?auto_39939 - PLACE
      ?auto_39949 - HOIST
      ?auto_39944 - SURFACE
      ?auto_39948 - SURFACE
      ?auto_39946 - PLACE
      ?auto_39942 - HOIST
      ?auto_39947 - SURFACE
      ?auto_39945 - SURFACE
      ?auto_39941 - TRUCK
      ?auto_39950 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39943 ?auto_39940 ) ( IS-CRATE ?auto_39937 ) ( not ( = ?auto_39937 ?auto_39938 ) ) ( not ( = ?auto_39939 ?auto_39940 ) ) ( HOIST-AT ?auto_39949 ?auto_39939 ) ( not ( = ?auto_39943 ?auto_39949 ) ) ( AVAILABLE ?auto_39949 ) ( SURFACE-AT ?auto_39937 ?auto_39939 ) ( ON ?auto_39937 ?auto_39944 ) ( CLEAR ?auto_39937 ) ( not ( = ?auto_39937 ?auto_39944 ) ) ( not ( = ?auto_39938 ?auto_39944 ) ) ( IS-CRATE ?auto_39938 ) ( not ( = ?auto_39937 ?auto_39948 ) ) ( not ( = ?auto_39938 ?auto_39948 ) ) ( not ( = ?auto_39944 ?auto_39948 ) ) ( not ( = ?auto_39946 ?auto_39940 ) ) ( not ( = ?auto_39939 ?auto_39946 ) ) ( HOIST-AT ?auto_39942 ?auto_39946 ) ( not ( = ?auto_39943 ?auto_39942 ) ) ( not ( = ?auto_39949 ?auto_39942 ) ) ( AVAILABLE ?auto_39942 ) ( SURFACE-AT ?auto_39938 ?auto_39946 ) ( ON ?auto_39938 ?auto_39947 ) ( CLEAR ?auto_39938 ) ( not ( = ?auto_39937 ?auto_39947 ) ) ( not ( = ?auto_39938 ?auto_39947 ) ) ( not ( = ?auto_39944 ?auto_39947 ) ) ( not ( = ?auto_39948 ?auto_39947 ) ) ( SURFACE-AT ?auto_39945 ?auto_39940 ) ( CLEAR ?auto_39945 ) ( IS-CRATE ?auto_39948 ) ( not ( = ?auto_39937 ?auto_39945 ) ) ( not ( = ?auto_39938 ?auto_39945 ) ) ( not ( = ?auto_39944 ?auto_39945 ) ) ( not ( = ?auto_39948 ?auto_39945 ) ) ( not ( = ?auto_39947 ?auto_39945 ) ) ( AVAILABLE ?auto_39943 ) ( IN ?auto_39948 ?auto_39941 ) ( TRUCK-AT ?auto_39941 ?auto_39950 ) ( not ( = ?auto_39950 ?auto_39940 ) ) ( not ( = ?auto_39939 ?auto_39950 ) ) ( not ( = ?auto_39946 ?auto_39950 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_39941 ?auto_39950 ?auto_39940 )
      ( MAKE-ON ?auto_39937 ?auto_39938 )
      ( MAKE-ON-VERIFY ?auto_39937 ?auto_39938 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39951 - SURFACE
      ?auto_39952 - SURFACE
    )
    :vars
    (
      ?auto_39953 - HOIST
      ?auto_39954 - PLACE
      ?auto_39961 - PLACE
      ?auto_39957 - HOIST
      ?auto_39958 - SURFACE
      ?auto_39959 - SURFACE
      ?auto_39956 - PLACE
      ?auto_39955 - HOIST
      ?auto_39960 - SURFACE
      ?auto_39964 - SURFACE
      ?auto_39963 - TRUCK
      ?auto_39962 - PLACE
      ?auto_39965 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_39953 ?auto_39954 ) ( IS-CRATE ?auto_39951 ) ( not ( = ?auto_39951 ?auto_39952 ) ) ( not ( = ?auto_39961 ?auto_39954 ) ) ( HOIST-AT ?auto_39957 ?auto_39961 ) ( not ( = ?auto_39953 ?auto_39957 ) ) ( AVAILABLE ?auto_39957 ) ( SURFACE-AT ?auto_39951 ?auto_39961 ) ( ON ?auto_39951 ?auto_39958 ) ( CLEAR ?auto_39951 ) ( not ( = ?auto_39951 ?auto_39958 ) ) ( not ( = ?auto_39952 ?auto_39958 ) ) ( IS-CRATE ?auto_39952 ) ( not ( = ?auto_39951 ?auto_39959 ) ) ( not ( = ?auto_39952 ?auto_39959 ) ) ( not ( = ?auto_39958 ?auto_39959 ) ) ( not ( = ?auto_39956 ?auto_39954 ) ) ( not ( = ?auto_39961 ?auto_39956 ) ) ( HOIST-AT ?auto_39955 ?auto_39956 ) ( not ( = ?auto_39953 ?auto_39955 ) ) ( not ( = ?auto_39957 ?auto_39955 ) ) ( AVAILABLE ?auto_39955 ) ( SURFACE-AT ?auto_39952 ?auto_39956 ) ( ON ?auto_39952 ?auto_39960 ) ( CLEAR ?auto_39952 ) ( not ( = ?auto_39951 ?auto_39960 ) ) ( not ( = ?auto_39952 ?auto_39960 ) ) ( not ( = ?auto_39958 ?auto_39960 ) ) ( not ( = ?auto_39959 ?auto_39960 ) ) ( SURFACE-AT ?auto_39964 ?auto_39954 ) ( CLEAR ?auto_39964 ) ( IS-CRATE ?auto_39959 ) ( not ( = ?auto_39951 ?auto_39964 ) ) ( not ( = ?auto_39952 ?auto_39964 ) ) ( not ( = ?auto_39958 ?auto_39964 ) ) ( not ( = ?auto_39959 ?auto_39964 ) ) ( not ( = ?auto_39960 ?auto_39964 ) ) ( AVAILABLE ?auto_39953 ) ( TRUCK-AT ?auto_39963 ?auto_39962 ) ( not ( = ?auto_39962 ?auto_39954 ) ) ( not ( = ?auto_39961 ?auto_39962 ) ) ( not ( = ?auto_39956 ?auto_39962 ) ) ( HOIST-AT ?auto_39965 ?auto_39962 ) ( LIFTING ?auto_39965 ?auto_39959 ) ( not ( = ?auto_39953 ?auto_39965 ) ) ( not ( = ?auto_39957 ?auto_39965 ) ) ( not ( = ?auto_39955 ?auto_39965 ) ) )
    :subtasks
    ( ( !LOAD ?auto_39965 ?auto_39959 ?auto_39963 ?auto_39962 )
      ( MAKE-ON ?auto_39951 ?auto_39952 )
      ( MAKE-ON-VERIFY ?auto_39951 ?auto_39952 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39966 - SURFACE
      ?auto_39967 - SURFACE
    )
    :vars
    (
      ?auto_39977 - HOIST
      ?auto_39972 - PLACE
      ?auto_39976 - PLACE
      ?auto_39969 - HOIST
      ?auto_39968 - SURFACE
      ?auto_39974 - SURFACE
      ?auto_39973 - PLACE
      ?auto_39979 - HOIST
      ?auto_39978 - SURFACE
      ?auto_39980 - SURFACE
      ?auto_39971 - TRUCK
      ?auto_39970 - PLACE
      ?auto_39975 - HOIST
      ?auto_39981 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39977 ?auto_39972 ) ( IS-CRATE ?auto_39966 ) ( not ( = ?auto_39966 ?auto_39967 ) ) ( not ( = ?auto_39976 ?auto_39972 ) ) ( HOIST-AT ?auto_39969 ?auto_39976 ) ( not ( = ?auto_39977 ?auto_39969 ) ) ( AVAILABLE ?auto_39969 ) ( SURFACE-AT ?auto_39966 ?auto_39976 ) ( ON ?auto_39966 ?auto_39968 ) ( CLEAR ?auto_39966 ) ( not ( = ?auto_39966 ?auto_39968 ) ) ( not ( = ?auto_39967 ?auto_39968 ) ) ( IS-CRATE ?auto_39967 ) ( not ( = ?auto_39966 ?auto_39974 ) ) ( not ( = ?auto_39967 ?auto_39974 ) ) ( not ( = ?auto_39968 ?auto_39974 ) ) ( not ( = ?auto_39973 ?auto_39972 ) ) ( not ( = ?auto_39976 ?auto_39973 ) ) ( HOIST-AT ?auto_39979 ?auto_39973 ) ( not ( = ?auto_39977 ?auto_39979 ) ) ( not ( = ?auto_39969 ?auto_39979 ) ) ( AVAILABLE ?auto_39979 ) ( SURFACE-AT ?auto_39967 ?auto_39973 ) ( ON ?auto_39967 ?auto_39978 ) ( CLEAR ?auto_39967 ) ( not ( = ?auto_39966 ?auto_39978 ) ) ( not ( = ?auto_39967 ?auto_39978 ) ) ( not ( = ?auto_39968 ?auto_39978 ) ) ( not ( = ?auto_39974 ?auto_39978 ) ) ( SURFACE-AT ?auto_39980 ?auto_39972 ) ( CLEAR ?auto_39980 ) ( IS-CRATE ?auto_39974 ) ( not ( = ?auto_39966 ?auto_39980 ) ) ( not ( = ?auto_39967 ?auto_39980 ) ) ( not ( = ?auto_39968 ?auto_39980 ) ) ( not ( = ?auto_39974 ?auto_39980 ) ) ( not ( = ?auto_39978 ?auto_39980 ) ) ( AVAILABLE ?auto_39977 ) ( TRUCK-AT ?auto_39971 ?auto_39970 ) ( not ( = ?auto_39970 ?auto_39972 ) ) ( not ( = ?auto_39976 ?auto_39970 ) ) ( not ( = ?auto_39973 ?auto_39970 ) ) ( HOIST-AT ?auto_39975 ?auto_39970 ) ( not ( = ?auto_39977 ?auto_39975 ) ) ( not ( = ?auto_39969 ?auto_39975 ) ) ( not ( = ?auto_39979 ?auto_39975 ) ) ( AVAILABLE ?auto_39975 ) ( SURFACE-AT ?auto_39974 ?auto_39970 ) ( ON ?auto_39974 ?auto_39981 ) ( CLEAR ?auto_39974 ) ( not ( = ?auto_39966 ?auto_39981 ) ) ( not ( = ?auto_39967 ?auto_39981 ) ) ( not ( = ?auto_39968 ?auto_39981 ) ) ( not ( = ?auto_39974 ?auto_39981 ) ) ( not ( = ?auto_39978 ?auto_39981 ) ) ( not ( = ?auto_39980 ?auto_39981 ) ) )
    :subtasks
    ( ( !LIFT ?auto_39975 ?auto_39974 ?auto_39981 ?auto_39970 )
      ( MAKE-ON ?auto_39966 ?auto_39967 )
      ( MAKE-ON-VERIFY ?auto_39966 ?auto_39967 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39982 - SURFACE
      ?auto_39983 - SURFACE
    )
    :vars
    (
      ?auto_39984 - HOIST
      ?auto_39997 - PLACE
      ?auto_39985 - PLACE
      ?auto_39996 - HOIST
      ?auto_39995 - SURFACE
      ?auto_39988 - SURFACE
      ?auto_39994 - PLACE
      ?auto_39991 - HOIST
      ?auto_39987 - SURFACE
      ?auto_39990 - SURFACE
      ?auto_39989 - PLACE
      ?auto_39992 - HOIST
      ?auto_39993 - SURFACE
      ?auto_39986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39984 ?auto_39997 ) ( IS-CRATE ?auto_39982 ) ( not ( = ?auto_39982 ?auto_39983 ) ) ( not ( = ?auto_39985 ?auto_39997 ) ) ( HOIST-AT ?auto_39996 ?auto_39985 ) ( not ( = ?auto_39984 ?auto_39996 ) ) ( AVAILABLE ?auto_39996 ) ( SURFACE-AT ?auto_39982 ?auto_39985 ) ( ON ?auto_39982 ?auto_39995 ) ( CLEAR ?auto_39982 ) ( not ( = ?auto_39982 ?auto_39995 ) ) ( not ( = ?auto_39983 ?auto_39995 ) ) ( IS-CRATE ?auto_39983 ) ( not ( = ?auto_39982 ?auto_39988 ) ) ( not ( = ?auto_39983 ?auto_39988 ) ) ( not ( = ?auto_39995 ?auto_39988 ) ) ( not ( = ?auto_39994 ?auto_39997 ) ) ( not ( = ?auto_39985 ?auto_39994 ) ) ( HOIST-AT ?auto_39991 ?auto_39994 ) ( not ( = ?auto_39984 ?auto_39991 ) ) ( not ( = ?auto_39996 ?auto_39991 ) ) ( AVAILABLE ?auto_39991 ) ( SURFACE-AT ?auto_39983 ?auto_39994 ) ( ON ?auto_39983 ?auto_39987 ) ( CLEAR ?auto_39983 ) ( not ( = ?auto_39982 ?auto_39987 ) ) ( not ( = ?auto_39983 ?auto_39987 ) ) ( not ( = ?auto_39995 ?auto_39987 ) ) ( not ( = ?auto_39988 ?auto_39987 ) ) ( SURFACE-AT ?auto_39990 ?auto_39997 ) ( CLEAR ?auto_39990 ) ( IS-CRATE ?auto_39988 ) ( not ( = ?auto_39982 ?auto_39990 ) ) ( not ( = ?auto_39983 ?auto_39990 ) ) ( not ( = ?auto_39995 ?auto_39990 ) ) ( not ( = ?auto_39988 ?auto_39990 ) ) ( not ( = ?auto_39987 ?auto_39990 ) ) ( AVAILABLE ?auto_39984 ) ( not ( = ?auto_39989 ?auto_39997 ) ) ( not ( = ?auto_39985 ?auto_39989 ) ) ( not ( = ?auto_39994 ?auto_39989 ) ) ( HOIST-AT ?auto_39992 ?auto_39989 ) ( not ( = ?auto_39984 ?auto_39992 ) ) ( not ( = ?auto_39996 ?auto_39992 ) ) ( not ( = ?auto_39991 ?auto_39992 ) ) ( AVAILABLE ?auto_39992 ) ( SURFACE-AT ?auto_39988 ?auto_39989 ) ( ON ?auto_39988 ?auto_39993 ) ( CLEAR ?auto_39988 ) ( not ( = ?auto_39982 ?auto_39993 ) ) ( not ( = ?auto_39983 ?auto_39993 ) ) ( not ( = ?auto_39995 ?auto_39993 ) ) ( not ( = ?auto_39988 ?auto_39993 ) ) ( not ( = ?auto_39987 ?auto_39993 ) ) ( not ( = ?auto_39990 ?auto_39993 ) ) ( TRUCK-AT ?auto_39986 ?auto_39997 ) )
    :subtasks
    ( ( !DRIVE ?auto_39986 ?auto_39997 ?auto_39989 )
      ( MAKE-ON ?auto_39982 ?auto_39983 )
      ( MAKE-ON-VERIFY ?auto_39982 ?auto_39983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39998 - SURFACE
      ?auto_39999 - SURFACE
    )
    :vars
    (
      ?auto_40001 - HOIST
      ?auto_40012 - PLACE
      ?auto_40009 - PLACE
      ?auto_40005 - HOIST
      ?auto_40011 - SURFACE
      ?auto_40002 - SURFACE
      ?auto_40003 - PLACE
      ?auto_40010 - HOIST
      ?auto_40000 - SURFACE
      ?auto_40013 - SURFACE
      ?auto_40006 - PLACE
      ?auto_40008 - HOIST
      ?auto_40007 - SURFACE
      ?auto_40004 - TRUCK
      ?auto_40014 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40001 ?auto_40012 ) ( IS-CRATE ?auto_39998 ) ( not ( = ?auto_39998 ?auto_39999 ) ) ( not ( = ?auto_40009 ?auto_40012 ) ) ( HOIST-AT ?auto_40005 ?auto_40009 ) ( not ( = ?auto_40001 ?auto_40005 ) ) ( AVAILABLE ?auto_40005 ) ( SURFACE-AT ?auto_39998 ?auto_40009 ) ( ON ?auto_39998 ?auto_40011 ) ( CLEAR ?auto_39998 ) ( not ( = ?auto_39998 ?auto_40011 ) ) ( not ( = ?auto_39999 ?auto_40011 ) ) ( IS-CRATE ?auto_39999 ) ( not ( = ?auto_39998 ?auto_40002 ) ) ( not ( = ?auto_39999 ?auto_40002 ) ) ( not ( = ?auto_40011 ?auto_40002 ) ) ( not ( = ?auto_40003 ?auto_40012 ) ) ( not ( = ?auto_40009 ?auto_40003 ) ) ( HOIST-AT ?auto_40010 ?auto_40003 ) ( not ( = ?auto_40001 ?auto_40010 ) ) ( not ( = ?auto_40005 ?auto_40010 ) ) ( AVAILABLE ?auto_40010 ) ( SURFACE-AT ?auto_39999 ?auto_40003 ) ( ON ?auto_39999 ?auto_40000 ) ( CLEAR ?auto_39999 ) ( not ( = ?auto_39998 ?auto_40000 ) ) ( not ( = ?auto_39999 ?auto_40000 ) ) ( not ( = ?auto_40011 ?auto_40000 ) ) ( not ( = ?auto_40002 ?auto_40000 ) ) ( IS-CRATE ?auto_40002 ) ( not ( = ?auto_39998 ?auto_40013 ) ) ( not ( = ?auto_39999 ?auto_40013 ) ) ( not ( = ?auto_40011 ?auto_40013 ) ) ( not ( = ?auto_40002 ?auto_40013 ) ) ( not ( = ?auto_40000 ?auto_40013 ) ) ( not ( = ?auto_40006 ?auto_40012 ) ) ( not ( = ?auto_40009 ?auto_40006 ) ) ( not ( = ?auto_40003 ?auto_40006 ) ) ( HOIST-AT ?auto_40008 ?auto_40006 ) ( not ( = ?auto_40001 ?auto_40008 ) ) ( not ( = ?auto_40005 ?auto_40008 ) ) ( not ( = ?auto_40010 ?auto_40008 ) ) ( AVAILABLE ?auto_40008 ) ( SURFACE-AT ?auto_40002 ?auto_40006 ) ( ON ?auto_40002 ?auto_40007 ) ( CLEAR ?auto_40002 ) ( not ( = ?auto_39998 ?auto_40007 ) ) ( not ( = ?auto_39999 ?auto_40007 ) ) ( not ( = ?auto_40011 ?auto_40007 ) ) ( not ( = ?auto_40002 ?auto_40007 ) ) ( not ( = ?auto_40000 ?auto_40007 ) ) ( not ( = ?auto_40013 ?auto_40007 ) ) ( TRUCK-AT ?auto_40004 ?auto_40012 ) ( SURFACE-AT ?auto_40014 ?auto_40012 ) ( CLEAR ?auto_40014 ) ( LIFTING ?auto_40001 ?auto_40013 ) ( IS-CRATE ?auto_40013 ) ( not ( = ?auto_39998 ?auto_40014 ) ) ( not ( = ?auto_39999 ?auto_40014 ) ) ( not ( = ?auto_40011 ?auto_40014 ) ) ( not ( = ?auto_40002 ?auto_40014 ) ) ( not ( = ?auto_40000 ?auto_40014 ) ) ( not ( = ?auto_40013 ?auto_40014 ) ) ( not ( = ?auto_40007 ?auto_40014 ) ) )
    :subtasks
    ( ( !DROP ?auto_40001 ?auto_40013 ?auto_40014 ?auto_40012 )
      ( MAKE-ON ?auto_39998 ?auto_39999 )
      ( MAKE-ON-VERIFY ?auto_39998 ?auto_39999 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40015 - SURFACE
      ?auto_40016 - SURFACE
    )
    :vars
    (
      ?auto_40020 - HOIST
      ?auto_40028 - PLACE
      ?auto_40027 - PLACE
      ?auto_40022 - HOIST
      ?auto_40029 - SURFACE
      ?auto_40026 - SURFACE
      ?auto_40030 - PLACE
      ?auto_40025 - HOIST
      ?auto_40024 - SURFACE
      ?auto_40021 - SURFACE
      ?auto_40023 - PLACE
      ?auto_40018 - HOIST
      ?auto_40019 - SURFACE
      ?auto_40017 - TRUCK
      ?auto_40031 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40020 ?auto_40028 ) ( IS-CRATE ?auto_40015 ) ( not ( = ?auto_40015 ?auto_40016 ) ) ( not ( = ?auto_40027 ?auto_40028 ) ) ( HOIST-AT ?auto_40022 ?auto_40027 ) ( not ( = ?auto_40020 ?auto_40022 ) ) ( AVAILABLE ?auto_40022 ) ( SURFACE-AT ?auto_40015 ?auto_40027 ) ( ON ?auto_40015 ?auto_40029 ) ( CLEAR ?auto_40015 ) ( not ( = ?auto_40015 ?auto_40029 ) ) ( not ( = ?auto_40016 ?auto_40029 ) ) ( IS-CRATE ?auto_40016 ) ( not ( = ?auto_40015 ?auto_40026 ) ) ( not ( = ?auto_40016 ?auto_40026 ) ) ( not ( = ?auto_40029 ?auto_40026 ) ) ( not ( = ?auto_40030 ?auto_40028 ) ) ( not ( = ?auto_40027 ?auto_40030 ) ) ( HOIST-AT ?auto_40025 ?auto_40030 ) ( not ( = ?auto_40020 ?auto_40025 ) ) ( not ( = ?auto_40022 ?auto_40025 ) ) ( AVAILABLE ?auto_40025 ) ( SURFACE-AT ?auto_40016 ?auto_40030 ) ( ON ?auto_40016 ?auto_40024 ) ( CLEAR ?auto_40016 ) ( not ( = ?auto_40015 ?auto_40024 ) ) ( not ( = ?auto_40016 ?auto_40024 ) ) ( not ( = ?auto_40029 ?auto_40024 ) ) ( not ( = ?auto_40026 ?auto_40024 ) ) ( IS-CRATE ?auto_40026 ) ( not ( = ?auto_40015 ?auto_40021 ) ) ( not ( = ?auto_40016 ?auto_40021 ) ) ( not ( = ?auto_40029 ?auto_40021 ) ) ( not ( = ?auto_40026 ?auto_40021 ) ) ( not ( = ?auto_40024 ?auto_40021 ) ) ( not ( = ?auto_40023 ?auto_40028 ) ) ( not ( = ?auto_40027 ?auto_40023 ) ) ( not ( = ?auto_40030 ?auto_40023 ) ) ( HOIST-AT ?auto_40018 ?auto_40023 ) ( not ( = ?auto_40020 ?auto_40018 ) ) ( not ( = ?auto_40022 ?auto_40018 ) ) ( not ( = ?auto_40025 ?auto_40018 ) ) ( AVAILABLE ?auto_40018 ) ( SURFACE-AT ?auto_40026 ?auto_40023 ) ( ON ?auto_40026 ?auto_40019 ) ( CLEAR ?auto_40026 ) ( not ( = ?auto_40015 ?auto_40019 ) ) ( not ( = ?auto_40016 ?auto_40019 ) ) ( not ( = ?auto_40029 ?auto_40019 ) ) ( not ( = ?auto_40026 ?auto_40019 ) ) ( not ( = ?auto_40024 ?auto_40019 ) ) ( not ( = ?auto_40021 ?auto_40019 ) ) ( TRUCK-AT ?auto_40017 ?auto_40028 ) ( SURFACE-AT ?auto_40031 ?auto_40028 ) ( CLEAR ?auto_40031 ) ( IS-CRATE ?auto_40021 ) ( not ( = ?auto_40015 ?auto_40031 ) ) ( not ( = ?auto_40016 ?auto_40031 ) ) ( not ( = ?auto_40029 ?auto_40031 ) ) ( not ( = ?auto_40026 ?auto_40031 ) ) ( not ( = ?auto_40024 ?auto_40031 ) ) ( not ( = ?auto_40021 ?auto_40031 ) ) ( not ( = ?auto_40019 ?auto_40031 ) ) ( AVAILABLE ?auto_40020 ) ( IN ?auto_40021 ?auto_40017 ) )
    :subtasks
    ( ( !UNLOAD ?auto_40020 ?auto_40021 ?auto_40017 ?auto_40028 )
      ( MAKE-ON ?auto_40015 ?auto_40016 )
      ( MAKE-ON-VERIFY ?auto_40015 ?auto_40016 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40032 - SURFACE
      ?auto_40033 - SURFACE
    )
    :vars
    (
      ?auto_40039 - HOIST
      ?auto_40044 - PLACE
      ?auto_40043 - PLACE
      ?auto_40034 - HOIST
      ?auto_40035 - SURFACE
      ?auto_40036 - SURFACE
      ?auto_40040 - PLACE
      ?auto_40046 - HOIST
      ?auto_40048 - SURFACE
      ?auto_40045 - SURFACE
      ?auto_40037 - PLACE
      ?auto_40041 - HOIST
      ?auto_40042 - SURFACE
      ?auto_40047 - SURFACE
      ?auto_40038 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40039 ?auto_40044 ) ( IS-CRATE ?auto_40032 ) ( not ( = ?auto_40032 ?auto_40033 ) ) ( not ( = ?auto_40043 ?auto_40044 ) ) ( HOIST-AT ?auto_40034 ?auto_40043 ) ( not ( = ?auto_40039 ?auto_40034 ) ) ( AVAILABLE ?auto_40034 ) ( SURFACE-AT ?auto_40032 ?auto_40043 ) ( ON ?auto_40032 ?auto_40035 ) ( CLEAR ?auto_40032 ) ( not ( = ?auto_40032 ?auto_40035 ) ) ( not ( = ?auto_40033 ?auto_40035 ) ) ( IS-CRATE ?auto_40033 ) ( not ( = ?auto_40032 ?auto_40036 ) ) ( not ( = ?auto_40033 ?auto_40036 ) ) ( not ( = ?auto_40035 ?auto_40036 ) ) ( not ( = ?auto_40040 ?auto_40044 ) ) ( not ( = ?auto_40043 ?auto_40040 ) ) ( HOIST-AT ?auto_40046 ?auto_40040 ) ( not ( = ?auto_40039 ?auto_40046 ) ) ( not ( = ?auto_40034 ?auto_40046 ) ) ( AVAILABLE ?auto_40046 ) ( SURFACE-AT ?auto_40033 ?auto_40040 ) ( ON ?auto_40033 ?auto_40048 ) ( CLEAR ?auto_40033 ) ( not ( = ?auto_40032 ?auto_40048 ) ) ( not ( = ?auto_40033 ?auto_40048 ) ) ( not ( = ?auto_40035 ?auto_40048 ) ) ( not ( = ?auto_40036 ?auto_40048 ) ) ( IS-CRATE ?auto_40036 ) ( not ( = ?auto_40032 ?auto_40045 ) ) ( not ( = ?auto_40033 ?auto_40045 ) ) ( not ( = ?auto_40035 ?auto_40045 ) ) ( not ( = ?auto_40036 ?auto_40045 ) ) ( not ( = ?auto_40048 ?auto_40045 ) ) ( not ( = ?auto_40037 ?auto_40044 ) ) ( not ( = ?auto_40043 ?auto_40037 ) ) ( not ( = ?auto_40040 ?auto_40037 ) ) ( HOIST-AT ?auto_40041 ?auto_40037 ) ( not ( = ?auto_40039 ?auto_40041 ) ) ( not ( = ?auto_40034 ?auto_40041 ) ) ( not ( = ?auto_40046 ?auto_40041 ) ) ( AVAILABLE ?auto_40041 ) ( SURFACE-AT ?auto_40036 ?auto_40037 ) ( ON ?auto_40036 ?auto_40042 ) ( CLEAR ?auto_40036 ) ( not ( = ?auto_40032 ?auto_40042 ) ) ( not ( = ?auto_40033 ?auto_40042 ) ) ( not ( = ?auto_40035 ?auto_40042 ) ) ( not ( = ?auto_40036 ?auto_40042 ) ) ( not ( = ?auto_40048 ?auto_40042 ) ) ( not ( = ?auto_40045 ?auto_40042 ) ) ( SURFACE-AT ?auto_40047 ?auto_40044 ) ( CLEAR ?auto_40047 ) ( IS-CRATE ?auto_40045 ) ( not ( = ?auto_40032 ?auto_40047 ) ) ( not ( = ?auto_40033 ?auto_40047 ) ) ( not ( = ?auto_40035 ?auto_40047 ) ) ( not ( = ?auto_40036 ?auto_40047 ) ) ( not ( = ?auto_40048 ?auto_40047 ) ) ( not ( = ?auto_40045 ?auto_40047 ) ) ( not ( = ?auto_40042 ?auto_40047 ) ) ( AVAILABLE ?auto_40039 ) ( IN ?auto_40045 ?auto_40038 ) ( TRUCK-AT ?auto_40038 ?auto_40040 ) )
    :subtasks
    ( ( !DRIVE ?auto_40038 ?auto_40040 ?auto_40044 )
      ( MAKE-ON ?auto_40032 ?auto_40033 )
      ( MAKE-ON-VERIFY ?auto_40032 ?auto_40033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40049 - SURFACE
      ?auto_40050 - SURFACE
    )
    :vars
    (
      ?auto_40064 - HOIST
      ?auto_40058 - PLACE
      ?auto_40051 - PLACE
      ?auto_40065 - HOIST
      ?auto_40059 - SURFACE
      ?auto_40063 - SURFACE
      ?auto_40053 - PLACE
      ?auto_40060 - HOIST
      ?auto_40052 - SURFACE
      ?auto_40056 - SURFACE
      ?auto_40061 - PLACE
      ?auto_40062 - HOIST
      ?auto_40057 - SURFACE
      ?auto_40054 - SURFACE
      ?auto_40055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40064 ?auto_40058 ) ( IS-CRATE ?auto_40049 ) ( not ( = ?auto_40049 ?auto_40050 ) ) ( not ( = ?auto_40051 ?auto_40058 ) ) ( HOIST-AT ?auto_40065 ?auto_40051 ) ( not ( = ?auto_40064 ?auto_40065 ) ) ( AVAILABLE ?auto_40065 ) ( SURFACE-AT ?auto_40049 ?auto_40051 ) ( ON ?auto_40049 ?auto_40059 ) ( CLEAR ?auto_40049 ) ( not ( = ?auto_40049 ?auto_40059 ) ) ( not ( = ?auto_40050 ?auto_40059 ) ) ( IS-CRATE ?auto_40050 ) ( not ( = ?auto_40049 ?auto_40063 ) ) ( not ( = ?auto_40050 ?auto_40063 ) ) ( not ( = ?auto_40059 ?auto_40063 ) ) ( not ( = ?auto_40053 ?auto_40058 ) ) ( not ( = ?auto_40051 ?auto_40053 ) ) ( HOIST-AT ?auto_40060 ?auto_40053 ) ( not ( = ?auto_40064 ?auto_40060 ) ) ( not ( = ?auto_40065 ?auto_40060 ) ) ( SURFACE-AT ?auto_40050 ?auto_40053 ) ( ON ?auto_40050 ?auto_40052 ) ( CLEAR ?auto_40050 ) ( not ( = ?auto_40049 ?auto_40052 ) ) ( not ( = ?auto_40050 ?auto_40052 ) ) ( not ( = ?auto_40059 ?auto_40052 ) ) ( not ( = ?auto_40063 ?auto_40052 ) ) ( IS-CRATE ?auto_40063 ) ( not ( = ?auto_40049 ?auto_40056 ) ) ( not ( = ?auto_40050 ?auto_40056 ) ) ( not ( = ?auto_40059 ?auto_40056 ) ) ( not ( = ?auto_40063 ?auto_40056 ) ) ( not ( = ?auto_40052 ?auto_40056 ) ) ( not ( = ?auto_40061 ?auto_40058 ) ) ( not ( = ?auto_40051 ?auto_40061 ) ) ( not ( = ?auto_40053 ?auto_40061 ) ) ( HOIST-AT ?auto_40062 ?auto_40061 ) ( not ( = ?auto_40064 ?auto_40062 ) ) ( not ( = ?auto_40065 ?auto_40062 ) ) ( not ( = ?auto_40060 ?auto_40062 ) ) ( AVAILABLE ?auto_40062 ) ( SURFACE-AT ?auto_40063 ?auto_40061 ) ( ON ?auto_40063 ?auto_40057 ) ( CLEAR ?auto_40063 ) ( not ( = ?auto_40049 ?auto_40057 ) ) ( not ( = ?auto_40050 ?auto_40057 ) ) ( not ( = ?auto_40059 ?auto_40057 ) ) ( not ( = ?auto_40063 ?auto_40057 ) ) ( not ( = ?auto_40052 ?auto_40057 ) ) ( not ( = ?auto_40056 ?auto_40057 ) ) ( SURFACE-AT ?auto_40054 ?auto_40058 ) ( CLEAR ?auto_40054 ) ( IS-CRATE ?auto_40056 ) ( not ( = ?auto_40049 ?auto_40054 ) ) ( not ( = ?auto_40050 ?auto_40054 ) ) ( not ( = ?auto_40059 ?auto_40054 ) ) ( not ( = ?auto_40063 ?auto_40054 ) ) ( not ( = ?auto_40052 ?auto_40054 ) ) ( not ( = ?auto_40056 ?auto_40054 ) ) ( not ( = ?auto_40057 ?auto_40054 ) ) ( AVAILABLE ?auto_40064 ) ( TRUCK-AT ?auto_40055 ?auto_40053 ) ( LIFTING ?auto_40060 ?auto_40056 ) )
    :subtasks
    ( ( !LOAD ?auto_40060 ?auto_40056 ?auto_40055 ?auto_40053 )
      ( MAKE-ON ?auto_40049 ?auto_40050 )
      ( MAKE-ON-VERIFY ?auto_40049 ?auto_40050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40066 - SURFACE
      ?auto_40067 - SURFACE
    )
    :vars
    (
      ?auto_40073 - HOIST
      ?auto_40071 - PLACE
      ?auto_40069 - PLACE
      ?auto_40068 - HOIST
      ?auto_40070 - SURFACE
      ?auto_40082 - SURFACE
      ?auto_40074 - PLACE
      ?auto_40079 - HOIST
      ?auto_40081 - SURFACE
      ?auto_40075 - SURFACE
      ?auto_40078 - PLACE
      ?auto_40072 - HOIST
      ?auto_40076 - SURFACE
      ?auto_40080 - SURFACE
      ?auto_40077 - TRUCK
      ?auto_40083 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40073 ?auto_40071 ) ( IS-CRATE ?auto_40066 ) ( not ( = ?auto_40066 ?auto_40067 ) ) ( not ( = ?auto_40069 ?auto_40071 ) ) ( HOIST-AT ?auto_40068 ?auto_40069 ) ( not ( = ?auto_40073 ?auto_40068 ) ) ( AVAILABLE ?auto_40068 ) ( SURFACE-AT ?auto_40066 ?auto_40069 ) ( ON ?auto_40066 ?auto_40070 ) ( CLEAR ?auto_40066 ) ( not ( = ?auto_40066 ?auto_40070 ) ) ( not ( = ?auto_40067 ?auto_40070 ) ) ( IS-CRATE ?auto_40067 ) ( not ( = ?auto_40066 ?auto_40082 ) ) ( not ( = ?auto_40067 ?auto_40082 ) ) ( not ( = ?auto_40070 ?auto_40082 ) ) ( not ( = ?auto_40074 ?auto_40071 ) ) ( not ( = ?auto_40069 ?auto_40074 ) ) ( HOIST-AT ?auto_40079 ?auto_40074 ) ( not ( = ?auto_40073 ?auto_40079 ) ) ( not ( = ?auto_40068 ?auto_40079 ) ) ( SURFACE-AT ?auto_40067 ?auto_40074 ) ( ON ?auto_40067 ?auto_40081 ) ( CLEAR ?auto_40067 ) ( not ( = ?auto_40066 ?auto_40081 ) ) ( not ( = ?auto_40067 ?auto_40081 ) ) ( not ( = ?auto_40070 ?auto_40081 ) ) ( not ( = ?auto_40082 ?auto_40081 ) ) ( IS-CRATE ?auto_40082 ) ( not ( = ?auto_40066 ?auto_40075 ) ) ( not ( = ?auto_40067 ?auto_40075 ) ) ( not ( = ?auto_40070 ?auto_40075 ) ) ( not ( = ?auto_40082 ?auto_40075 ) ) ( not ( = ?auto_40081 ?auto_40075 ) ) ( not ( = ?auto_40078 ?auto_40071 ) ) ( not ( = ?auto_40069 ?auto_40078 ) ) ( not ( = ?auto_40074 ?auto_40078 ) ) ( HOIST-AT ?auto_40072 ?auto_40078 ) ( not ( = ?auto_40073 ?auto_40072 ) ) ( not ( = ?auto_40068 ?auto_40072 ) ) ( not ( = ?auto_40079 ?auto_40072 ) ) ( AVAILABLE ?auto_40072 ) ( SURFACE-AT ?auto_40082 ?auto_40078 ) ( ON ?auto_40082 ?auto_40076 ) ( CLEAR ?auto_40082 ) ( not ( = ?auto_40066 ?auto_40076 ) ) ( not ( = ?auto_40067 ?auto_40076 ) ) ( not ( = ?auto_40070 ?auto_40076 ) ) ( not ( = ?auto_40082 ?auto_40076 ) ) ( not ( = ?auto_40081 ?auto_40076 ) ) ( not ( = ?auto_40075 ?auto_40076 ) ) ( SURFACE-AT ?auto_40080 ?auto_40071 ) ( CLEAR ?auto_40080 ) ( IS-CRATE ?auto_40075 ) ( not ( = ?auto_40066 ?auto_40080 ) ) ( not ( = ?auto_40067 ?auto_40080 ) ) ( not ( = ?auto_40070 ?auto_40080 ) ) ( not ( = ?auto_40082 ?auto_40080 ) ) ( not ( = ?auto_40081 ?auto_40080 ) ) ( not ( = ?auto_40075 ?auto_40080 ) ) ( not ( = ?auto_40076 ?auto_40080 ) ) ( AVAILABLE ?auto_40073 ) ( TRUCK-AT ?auto_40077 ?auto_40074 ) ( AVAILABLE ?auto_40079 ) ( SURFACE-AT ?auto_40075 ?auto_40074 ) ( ON ?auto_40075 ?auto_40083 ) ( CLEAR ?auto_40075 ) ( not ( = ?auto_40066 ?auto_40083 ) ) ( not ( = ?auto_40067 ?auto_40083 ) ) ( not ( = ?auto_40070 ?auto_40083 ) ) ( not ( = ?auto_40082 ?auto_40083 ) ) ( not ( = ?auto_40081 ?auto_40083 ) ) ( not ( = ?auto_40075 ?auto_40083 ) ) ( not ( = ?auto_40076 ?auto_40083 ) ) ( not ( = ?auto_40080 ?auto_40083 ) ) )
    :subtasks
    ( ( !LIFT ?auto_40079 ?auto_40075 ?auto_40083 ?auto_40074 )
      ( MAKE-ON ?auto_40066 ?auto_40067 )
      ( MAKE-ON-VERIFY ?auto_40066 ?auto_40067 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40084 - SURFACE
      ?auto_40085 - SURFACE
    )
    :vars
    (
      ?auto_40089 - HOIST
      ?auto_40096 - PLACE
      ?auto_40099 - PLACE
      ?auto_40100 - HOIST
      ?auto_40091 - SURFACE
      ?auto_40088 - SURFACE
      ?auto_40092 - PLACE
      ?auto_40095 - HOIST
      ?auto_40098 - SURFACE
      ?auto_40090 - SURFACE
      ?auto_40086 - PLACE
      ?auto_40097 - HOIST
      ?auto_40101 - SURFACE
      ?auto_40094 - SURFACE
      ?auto_40093 - SURFACE
      ?auto_40087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40089 ?auto_40096 ) ( IS-CRATE ?auto_40084 ) ( not ( = ?auto_40084 ?auto_40085 ) ) ( not ( = ?auto_40099 ?auto_40096 ) ) ( HOIST-AT ?auto_40100 ?auto_40099 ) ( not ( = ?auto_40089 ?auto_40100 ) ) ( AVAILABLE ?auto_40100 ) ( SURFACE-AT ?auto_40084 ?auto_40099 ) ( ON ?auto_40084 ?auto_40091 ) ( CLEAR ?auto_40084 ) ( not ( = ?auto_40084 ?auto_40091 ) ) ( not ( = ?auto_40085 ?auto_40091 ) ) ( IS-CRATE ?auto_40085 ) ( not ( = ?auto_40084 ?auto_40088 ) ) ( not ( = ?auto_40085 ?auto_40088 ) ) ( not ( = ?auto_40091 ?auto_40088 ) ) ( not ( = ?auto_40092 ?auto_40096 ) ) ( not ( = ?auto_40099 ?auto_40092 ) ) ( HOIST-AT ?auto_40095 ?auto_40092 ) ( not ( = ?auto_40089 ?auto_40095 ) ) ( not ( = ?auto_40100 ?auto_40095 ) ) ( SURFACE-AT ?auto_40085 ?auto_40092 ) ( ON ?auto_40085 ?auto_40098 ) ( CLEAR ?auto_40085 ) ( not ( = ?auto_40084 ?auto_40098 ) ) ( not ( = ?auto_40085 ?auto_40098 ) ) ( not ( = ?auto_40091 ?auto_40098 ) ) ( not ( = ?auto_40088 ?auto_40098 ) ) ( IS-CRATE ?auto_40088 ) ( not ( = ?auto_40084 ?auto_40090 ) ) ( not ( = ?auto_40085 ?auto_40090 ) ) ( not ( = ?auto_40091 ?auto_40090 ) ) ( not ( = ?auto_40088 ?auto_40090 ) ) ( not ( = ?auto_40098 ?auto_40090 ) ) ( not ( = ?auto_40086 ?auto_40096 ) ) ( not ( = ?auto_40099 ?auto_40086 ) ) ( not ( = ?auto_40092 ?auto_40086 ) ) ( HOIST-AT ?auto_40097 ?auto_40086 ) ( not ( = ?auto_40089 ?auto_40097 ) ) ( not ( = ?auto_40100 ?auto_40097 ) ) ( not ( = ?auto_40095 ?auto_40097 ) ) ( AVAILABLE ?auto_40097 ) ( SURFACE-AT ?auto_40088 ?auto_40086 ) ( ON ?auto_40088 ?auto_40101 ) ( CLEAR ?auto_40088 ) ( not ( = ?auto_40084 ?auto_40101 ) ) ( not ( = ?auto_40085 ?auto_40101 ) ) ( not ( = ?auto_40091 ?auto_40101 ) ) ( not ( = ?auto_40088 ?auto_40101 ) ) ( not ( = ?auto_40098 ?auto_40101 ) ) ( not ( = ?auto_40090 ?auto_40101 ) ) ( SURFACE-AT ?auto_40094 ?auto_40096 ) ( CLEAR ?auto_40094 ) ( IS-CRATE ?auto_40090 ) ( not ( = ?auto_40084 ?auto_40094 ) ) ( not ( = ?auto_40085 ?auto_40094 ) ) ( not ( = ?auto_40091 ?auto_40094 ) ) ( not ( = ?auto_40088 ?auto_40094 ) ) ( not ( = ?auto_40098 ?auto_40094 ) ) ( not ( = ?auto_40090 ?auto_40094 ) ) ( not ( = ?auto_40101 ?auto_40094 ) ) ( AVAILABLE ?auto_40089 ) ( AVAILABLE ?auto_40095 ) ( SURFACE-AT ?auto_40090 ?auto_40092 ) ( ON ?auto_40090 ?auto_40093 ) ( CLEAR ?auto_40090 ) ( not ( = ?auto_40084 ?auto_40093 ) ) ( not ( = ?auto_40085 ?auto_40093 ) ) ( not ( = ?auto_40091 ?auto_40093 ) ) ( not ( = ?auto_40088 ?auto_40093 ) ) ( not ( = ?auto_40098 ?auto_40093 ) ) ( not ( = ?auto_40090 ?auto_40093 ) ) ( not ( = ?auto_40101 ?auto_40093 ) ) ( not ( = ?auto_40094 ?auto_40093 ) ) ( TRUCK-AT ?auto_40087 ?auto_40096 ) )
    :subtasks
    ( ( !DRIVE ?auto_40087 ?auto_40096 ?auto_40092 )
      ( MAKE-ON ?auto_40084 ?auto_40085 )
      ( MAKE-ON-VERIFY ?auto_40084 ?auto_40085 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40104 - SURFACE
      ?auto_40105 - SURFACE
    )
    :vars
    (
      ?auto_40106 - HOIST
      ?auto_40107 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40106 ?auto_40107 ) ( SURFACE-AT ?auto_40105 ?auto_40107 ) ( CLEAR ?auto_40105 ) ( LIFTING ?auto_40106 ?auto_40104 ) ( IS-CRATE ?auto_40104 ) ( not ( = ?auto_40104 ?auto_40105 ) ) )
    :subtasks
    ( ( !DROP ?auto_40106 ?auto_40104 ?auto_40105 ?auto_40107 )
      ( MAKE-ON-VERIFY ?auto_40104 ?auto_40105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40108 - SURFACE
      ?auto_40109 - SURFACE
    )
    :vars
    (
      ?auto_40110 - HOIST
      ?auto_40111 - PLACE
      ?auto_40112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40110 ?auto_40111 ) ( SURFACE-AT ?auto_40109 ?auto_40111 ) ( CLEAR ?auto_40109 ) ( IS-CRATE ?auto_40108 ) ( not ( = ?auto_40108 ?auto_40109 ) ) ( TRUCK-AT ?auto_40112 ?auto_40111 ) ( AVAILABLE ?auto_40110 ) ( IN ?auto_40108 ?auto_40112 ) )
    :subtasks
    ( ( !UNLOAD ?auto_40110 ?auto_40108 ?auto_40112 ?auto_40111 )
      ( MAKE-ON ?auto_40108 ?auto_40109 )
      ( MAKE-ON-VERIFY ?auto_40108 ?auto_40109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40113 - SURFACE
      ?auto_40114 - SURFACE
    )
    :vars
    (
      ?auto_40117 - HOIST
      ?auto_40116 - PLACE
      ?auto_40115 - TRUCK
      ?auto_40118 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40117 ?auto_40116 ) ( SURFACE-AT ?auto_40114 ?auto_40116 ) ( CLEAR ?auto_40114 ) ( IS-CRATE ?auto_40113 ) ( not ( = ?auto_40113 ?auto_40114 ) ) ( AVAILABLE ?auto_40117 ) ( IN ?auto_40113 ?auto_40115 ) ( TRUCK-AT ?auto_40115 ?auto_40118 ) ( not ( = ?auto_40118 ?auto_40116 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_40115 ?auto_40118 ?auto_40116 )
      ( MAKE-ON ?auto_40113 ?auto_40114 )
      ( MAKE-ON-VERIFY ?auto_40113 ?auto_40114 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40119 - SURFACE
      ?auto_40120 - SURFACE
    )
    :vars
    (
      ?auto_40124 - HOIST
      ?auto_40121 - PLACE
      ?auto_40122 - TRUCK
      ?auto_40123 - PLACE
      ?auto_40125 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_40124 ?auto_40121 ) ( SURFACE-AT ?auto_40120 ?auto_40121 ) ( CLEAR ?auto_40120 ) ( IS-CRATE ?auto_40119 ) ( not ( = ?auto_40119 ?auto_40120 ) ) ( AVAILABLE ?auto_40124 ) ( TRUCK-AT ?auto_40122 ?auto_40123 ) ( not ( = ?auto_40123 ?auto_40121 ) ) ( HOIST-AT ?auto_40125 ?auto_40123 ) ( LIFTING ?auto_40125 ?auto_40119 ) ( not ( = ?auto_40124 ?auto_40125 ) ) )
    :subtasks
    ( ( !LOAD ?auto_40125 ?auto_40119 ?auto_40122 ?auto_40123 )
      ( MAKE-ON ?auto_40119 ?auto_40120 )
      ( MAKE-ON-VERIFY ?auto_40119 ?auto_40120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40126 - SURFACE
      ?auto_40127 - SURFACE
    )
    :vars
    (
      ?auto_40128 - HOIST
      ?auto_40131 - PLACE
      ?auto_40130 - TRUCK
      ?auto_40129 - PLACE
      ?auto_40132 - HOIST
      ?auto_40133 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40128 ?auto_40131 ) ( SURFACE-AT ?auto_40127 ?auto_40131 ) ( CLEAR ?auto_40127 ) ( IS-CRATE ?auto_40126 ) ( not ( = ?auto_40126 ?auto_40127 ) ) ( AVAILABLE ?auto_40128 ) ( TRUCK-AT ?auto_40130 ?auto_40129 ) ( not ( = ?auto_40129 ?auto_40131 ) ) ( HOIST-AT ?auto_40132 ?auto_40129 ) ( not ( = ?auto_40128 ?auto_40132 ) ) ( AVAILABLE ?auto_40132 ) ( SURFACE-AT ?auto_40126 ?auto_40129 ) ( ON ?auto_40126 ?auto_40133 ) ( CLEAR ?auto_40126 ) ( not ( = ?auto_40126 ?auto_40133 ) ) ( not ( = ?auto_40127 ?auto_40133 ) ) )
    :subtasks
    ( ( !LIFT ?auto_40132 ?auto_40126 ?auto_40133 ?auto_40129 )
      ( MAKE-ON ?auto_40126 ?auto_40127 )
      ( MAKE-ON-VERIFY ?auto_40126 ?auto_40127 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40134 - SURFACE
      ?auto_40135 - SURFACE
    )
    :vars
    (
      ?auto_40136 - HOIST
      ?auto_40137 - PLACE
      ?auto_40138 - PLACE
      ?auto_40139 - HOIST
      ?auto_40140 - SURFACE
      ?auto_40141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40136 ?auto_40137 ) ( SURFACE-AT ?auto_40135 ?auto_40137 ) ( CLEAR ?auto_40135 ) ( IS-CRATE ?auto_40134 ) ( not ( = ?auto_40134 ?auto_40135 ) ) ( AVAILABLE ?auto_40136 ) ( not ( = ?auto_40138 ?auto_40137 ) ) ( HOIST-AT ?auto_40139 ?auto_40138 ) ( not ( = ?auto_40136 ?auto_40139 ) ) ( AVAILABLE ?auto_40139 ) ( SURFACE-AT ?auto_40134 ?auto_40138 ) ( ON ?auto_40134 ?auto_40140 ) ( CLEAR ?auto_40134 ) ( not ( = ?auto_40134 ?auto_40140 ) ) ( not ( = ?auto_40135 ?auto_40140 ) ) ( TRUCK-AT ?auto_40141 ?auto_40137 ) )
    :subtasks
    ( ( !DRIVE ?auto_40141 ?auto_40137 ?auto_40138 )
      ( MAKE-ON ?auto_40134 ?auto_40135 )
      ( MAKE-ON-VERIFY ?auto_40134 ?auto_40135 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40142 - SURFACE
      ?auto_40143 - SURFACE
    )
    :vars
    (
      ?auto_40145 - HOIST
      ?auto_40146 - PLACE
      ?auto_40147 - PLACE
      ?auto_40149 - HOIST
      ?auto_40148 - SURFACE
      ?auto_40144 - TRUCK
      ?auto_40150 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40145 ?auto_40146 ) ( IS-CRATE ?auto_40142 ) ( not ( = ?auto_40142 ?auto_40143 ) ) ( not ( = ?auto_40147 ?auto_40146 ) ) ( HOIST-AT ?auto_40149 ?auto_40147 ) ( not ( = ?auto_40145 ?auto_40149 ) ) ( AVAILABLE ?auto_40149 ) ( SURFACE-AT ?auto_40142 ?auto_40147 ) ( ON ?auto_40142 ?auto_40148 ) ( CLEAR ?auto_40142 ) ( not ( = ?auto_40142 ?auto_40148 ) ) ( not ( = ?auto_40143 ?auto_40148 ) ) ( TRUCK-AT ?auto_40144 ?auto_40146 ) ( SURFACE-AT ?auto_40150 ?auto_40146 ) ( CLEAR ?auto_40150 ) ( LIFTING ?auto_40145 ?auto_40143 ) ( IS-CRATE ?auto_40143 ) ( not ( = ?auto_40142 ?auto_40150 ) ) ( not ( = ?auto_40143 ?auto_40150 ) ) ( not ( = ?auto_40148 ?auto_40150 ) ) )
    :subtasks
    ( ( !DROP ?auto_40145 ?auto_40143 ?auto_40150 ?auto_40146 )
      ( MAKE-ON ?auto_40142 ?auto_40143 )
      ( MAKE-ON-VERIFY ?auto_40142 ?auto_40143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40151 - SURFACE
      ?auto_40152 - SURFACE
    )
    :vars
    (
      ?auto_40156 - HOIST
      ?auto_40159 - PLACE
      ?auto_40158 - PLACE
      ?auto_40157 - HOIST
      ?auto_40155 - SURFACE
      ?auto_40154 - TRUCK
      ?auto_40153 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40156 ?auto_40159 ) ( IS-CRATE ?auto_40151 ) ( not ( = ?auto_40151 ?auto_40152 ) ) ( not ( = ?auto_40158 ?auto_40159 ) ) ( HOIST-AT ?auto_40157 ?auto_40158 ) ( not ( = ?auto_40156 ?auto_40157 ) ) ( AVAILABLE ?auto_40157 ) ( SURFACE-AT ?auto_40151 ?auto_40158 ) ( ON ?auto_40151 ?auto_40155 ) ( CLEAR ?auto_40151 ) ( not ( = ?auto_40151 ?auto_40155 ) ) ( not ( = ?auto_40152 ?auto_40155 ) ) ( TRUCK-AT ?auto_40154 ?auto_40159 ) ( SURFACE-AT ?auto_40153 ?auto_40159 ) ( CLEAR ?auto_40153 ) ( IS-CRATE ?auto_40152 ) ( not ( = ?auto_40151 ?auto_40153 ) ) ( not ( = ?auto_40152 ?auto_40153 ) ) ( not ( = ?auto_40155 ?auto_40153 ) ) ( AVAILABLE ?auto_40156 ) ( IN ?auto_40152 ?auto_40154 ) )
    :subtasks
    ( ( !UNLOAD ?auto_40156 ?auto_40152 ?auto_40154 ?auto_40159 )
      ( MAKE-ON ?auto_40151 ?auto_40152 )
      ( MAKE-ON-VERIFY ?auto_40151 ?auto_40152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40160 - SURFACE
      ?auto_40161 - SURFACE
    )
    :vars
    (
      ?auto_40168 - HOIST
      ?auto_40164 - PLACE
      ?auto_40165 - PLACE
      ?auto_40167 - HOIST
      ?auto_40166 - SURFACE
      ?auto_40163 - SURFACE
      ?auto_40162 - TRUCK
      ?auto_40169 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40168 ?auto_40164 ) ( IS-CRATE ?auto_40160 ) ( not ( = ?auto_40160 ?auto_40161 ) ) ( not ( = ?auto_40165 ?auto_40164 ) ) ( HOIST-AT ?auto_40167 ?auto_40165 ) ( not ( = ?auto_40168 ?auto_40167 ) ) ( AVAILABLE ?auto_40167 ) ( SURFACE-AT ?auto_40160 ?auto_40165 ) ( ON ?auto_40160 ?auto_40166 ) ( CLEAR ?auto_40160 ) ( not ( = ?auto_40160 ?auto_40166 ) ) ( not ( = ?auto_40161 ?auto_40166 ) ) ( SURFACE-AT ?auto_40163 ?auto_40164 ) ( CLEAR ?auto_40163 ) ( IS-CRATE ?auto_40161 ) ( not ( = ?auto_40160 ?auto_40163 ) ) ( not ( = ?auto_40161 ?auto_40163 ) ) ( not ( = ?auto_40166 ?auto_40163 ) ) ( AVAILABLE ?auto_40168 ) ( IN ?auto_40161 ?auto_40162 ) ( TRUCK-AT ?auto_40162 ?auto_40169 ) ( not ( = ?auto_40169 ?auto_40164 ) ) ( not ( = ?auto_40165 ?auto_40169 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_40162 ?auto_40169 ?auto_40164 )
      ( MAKE-ON ?auto_40160 ?auto_40161 )
      ( MAKE-ON-VERIFY ?auto_40160 ?auto_40161 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40170 - SURFACE
      ?auto_40171 - SURFACE
    )
    :vars
    (
      ?auto_40172 - HOIST
      ?auto_40179 - PLACE
      ?auto_40177 - PLACE
      ?auto_40173 - HOIST
      ?auto_40178 - SURFACE
      ?auto_40174 - SURFACE
      ?auto_40175 - TRUCK
      ?auto_40176 - PLACE
      ?auto_40180 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_40172 ?auto_40179 ) ( IS-CRATE ?auto_40170 ) ( not ( = ?auto_40170 ?auto_40171 ) ) ( not ( = ?auto_40177 ?auto_40179 ) ) ( HOIST-AT ?auto_40173 ?auto_40177 ) ( not ( = ?auto_40172 ?auto_40173 ) ) ( AVAILABLE ?auto_40173 ) ( SURFACE-AT ?auto_40170 ?auto_40177 ) ( ON ?auto_40170 ?auto_40178 ) ( CLEAR ?auto_40170 ) ( not ( = ?auto_40170 ?auto_40178 ) ) ( not ( = ?auto_40171 ?auto_40178 ) ) ( SURFACE-AT ?auto_40174 ?auto_40179 ) ( CLEAR ?auto_40174 ) ( IS-CRATE ?auto_40171 ) ( not ( = ?auto_40170 ?auto_40174 ) ) ( not ( = ?auto_40171 ?auto_40174 ) ) ( not ( = ?auto_40178 ?auto_40174 ) ) ( AVAILABLE ?auto_40172 ) ( TRUCK-AT ?auto_40175 ?auto_40176 ) ( not ( = ?auto_40176 ?auto_40179 ) ) ( not ( = ?auto_40177 ?auto_40176 ) ) ( HOIST-AT ?auto_40180 ?auto_40176 ) ( LIFTING ?auto_40180 ?auto_40171 ) ( not ( = ?auto_40172 ?auto_40180 ) ) ( not ( = ?auto_40173 ?auto_40180 ) ) )
    :subtasks
    ( ( !LOAD ?auto_40180 ?auto_40171 ?auto_40175 ?auto_40176 )
      ( MAKE-ON ?auto_40170 ?auto_40171 )
      ( MAKE-ON-VERIFY ?auto_40170 ?auto_40171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40181 - SURFACE
      ?auto_40182 - SURFACE
    )
    :vars
    (
      ?auto_40191 - HOIST
      ?auto_40187 - PLACE
      ?auto_40185 - PLACE
      ?auto_40189 - HOIST
      ?auto_40188 - SURFACE
      ?auto_40186 - SURFACE
      ?auto_40183 - TRUCK
      ?auto_40190 - PLACE
      ?auto_40184 - HOIST
      ?auto_40192 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40191 ?auto_40187 ) ( IS-CRATE ?auto_40181 ) ( not ( = ?auto_40181 ?auto_40182 ) ) ( not ( = ?auto_40185 ?auto_40187 ) ) ( HOIST-AT ?auto_40189 ?auto_40185 ) ( not ( = ?auto_40191 ?auto_40189 ) ) ( AVAILABLE ?auto_40189 ) ( SURFACE-AT ?auto_40181 ?auto_40185 ) ( ON ?auto_40181 ?auto_40188 ) ( CLEAR ?auto_40181 ) ( not ( = ?auto_40181 ?auto_40188 ) ) ( not ( = ?auto_40182 ?auto_40188 ) ) ( SURFACE-AT ?auto_40186 ?auto_40187 ) ( CLEAR ?auto_40186 ) ( IS-CRATE ?auto_40182 ) ( not ( = ?auto_40181 ?auto_40186 ) ) ( not ( = ?auto_40182 ?auto_40186 ) ) ( not ( = ?auto_40188 ?auto_40186 ) ) ( AVAILABLE ?auto_40191 ) ( TRUCK-AT ?auto_40183 ?auto_40190 ) ( not ( = ?auto_40190 ?auto_40187 ) ) ( not ( = ?auto_40185 ?auto_40190 ) ) ( HOIST-AT ?auto_40184 ?auto_40190 ) ( not ( = ?auto_40191 ?auto_40184 ) ) ( not ( = ?auto_40189 ?auto_40184 ) ) ( AVAILABLE ?auto_40184 ) ( SURFACE-AT ?auto_40182 ?auto_40190 ) ( ON ?auto_40182 ?auto_40192 ) ( CLEAR ?auto_40182 ) ( not ( = ?auto_40181 ?auto_40192 ) ) ( not ( = ?auto_40182 ?auto_40192 ) ) ( not ( = ?auto_40188 ?auto_40192 ) ) ( not ( = ?auto_40186 ?auto_40192 ) ) )
    :subtasks
    ( ( !LIFT ?auto_40184 ?auto_40182 ?auto_40192 ?auto_40190 )
      ( MAKE-ON ?auto_40181 ?auto_40182 )
      ( MAKE-ON-VERIFY ?auto_40181 ?auto_40182 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40193 - SURFACE
      ?auto_40194 - SURFACE
    )
    :vars
    (
      ?auto_40197 - HOIST
      ?auto_40203 - PLACE
      ?auto_40198 - PLACE
      ?auto_40204 - HOIST
      ?auto_40195 - SURFACE
      ?auto_40196 - SURFACE
      ?auto_40199 - PLACE
      ?auto_40202 - HOIST
      ?auto_40200 - SURFACE
      ?auto_40201 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40197 ?auto_40203 ) ( IS-CRATE ?auto_40193 ) ( not ( = ?auto_40193 ?auto_40194 ) ) ( not ( = ?auto_40198 ?auto_40203 ) ) ( HOIST-AT ?auto_40204 ?auto_40198 ) ( not ( = ?auto_40197 ?auto_40204 ) ) ( AVAILABLE ?auto_40204 ) ( SURFACE-AT ?auto_40193 ?auto_40198 ) ( ON ?auto_40193 ?auto_40195 ) ( CLEAR ?auto_40193 ) ( not ( = ?auto_40193 ?auto_40195 ) ) ( not ( = ?auto_40194 ?auto_40195 ) ) ( SURFACE-AT ?auto_40196 ?auto_40203 ) ( CLEAR ?auto_40196 ) ( IS-CRATE ?auto_40194 ) ( not ( = ?auto_40193 ?auto_40196 ) ) ( not ( = ?auto_40194 ?auto_40196 ) ) ( not ( = ?auto_40195 ?auto_40196 ) ) ( AVAILABLE ?auto_40197 ) ( not ( = ?auto_40199 ?auto_40203 ) ) ( not ( = ?auto_40198 ?auto_40199 ) ) ( HOIST-AT ?auto_40202 ?auto_40199 ) ( not ( = ?auto_40197 ?auto_40202 ) ) ( not ( = ?auto_40204 ?auto_40202 ) ) ( AVAILABLE ?auto_40202 ) ( SURFACE-AT ?auto_40194 ?auto_40199 ) ( ON ?auto_40194 ?auto_40200 ) ( CLEAR ?auto_40194 ) ( not ( = ?auto_40193 ?auto_40200 ) ) ( not ( = ?auto_40194 ?auto_40200 ) ) ( not ( = ?auto_40195 ?auto_40200 ) ) ( not ( = ?auto_40196 ?auto_40200 ) ) ( TRUCK-AT ?auto_40201 ?auto_40203 ) )
    :subtasks
    ( ( !DRIVE ?auto_40201 ?auto_40203 ?auto_40199 )
      ( MAKE-ON ?auto_40193 ?auto_40194 )
      ( MAKE-ON-VERIFY ?auto_40193 ?auto_40194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40205 - SURFACE
      ?auto_40206 - SURFACE
    )
    :vars
    (
      ?auto_40207 - HOIST
      ?auto_40215 - PLACE
      ?auto_40210 - PLACE
      ?auto_40213 - HOIST
      ?auto_40214 - SURFACE
      ?auto_40211 - SURFACE
      ?auto_40212 - PLACE
      ?auto_40209 - HOIST
      ?auto_40208 - SURFACE
      ?auto_40216 - TRUCK
      ?auto_40217 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40207 ?auto_40215 ) ( IS-CRATE ?auto_40205 ) ( not ( = ?auto_40205 ?auto_40206 ) ) ( not ( = ?auto_40210 ?auto_40215 ) ) ( HOIST-AT ?auto_40213 ?auto_40210 ) ( not ( = ?auto_40207 ?auto_40213 ) ) ( AVAILABLE ?auto_40213 ) ( SURFACE-AT ?auto_40205 ?auto_40210 ) ( ON ?auto_40205 ?auto_40214 ) ( CLEAR ?auto_40205 ) ( not ( = ?auto_40205 ?auto_40214 ) ) ( not ( = ?auto_40206 ?auto_40214 ) ) ( IS-CRATE ?auto_40206 ) ( not ( = ?auto_40205 ?auto_40211 ) ) ( not ( = ?auto_40206 ?auto_40211 ) ) ( not ( = ?auto_40214 ?auto_40211 ) ) ( not ( = ?auto_40212 ?auto_40215 ) ) ( not ( = ?auto_40210 ?auto_40212 ) ) ( HOIST-AT ?auto_40209 ?auto_40212 ) ( not ( = ?auto_40207 ?auto_40209 ) ) ( not ( = ?auto_40213 ?auto_40209 ) ) ( AVAILABLE ?auto_40209 ) ( SURFACE-AT ?auto_40206 ?auto_40212 ) ( ON ?auto_40206 ?auto_40208 ) ( CLEAR ?auto_40206 ) ( not ( = ?auto_40205 ?auto_40208 ) ) ( not ( = ?auto_40206 ?auto_40208 ) ) ( not ( = ?auto_40214 ?auto_40208 ) ) ( not ( = ?auto_40211 ?auto_40208 ) ) ( TRUCK-AT ?auto_40216 ?auto_40215 ) ( SURFACE-AT ?auto_40217 ?auto_40215 ) ( CLEAR ?auto_40217 ) ( LIFTING ?auto_40207 ?auto_40211 ) ( IS-CRATE ?auto_40211 ) ( not ( = ?auto_40205 ?auto_40217 ) ) ( not ( = ?auto_40206 ?auto_40217 ) ) ( not ( = ?auto_40214 ?auto_40217 ) ) ( not ( = ?auto_40211 ?auto_40217 ) ) ( not ( = ?auto_40208 ?auto_40217 ) ) )
    :subtasks
    ( ( !DROP ?auto_40207 ?auto_40211 ?auto_40217 ?auto_40215 )
      ( MAKE-ON ?auto_40205 ?auto_40206 )
      ( MAKE-ON-VERIFY ?auto_40205 ?auto_40206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40218 - SURFACE
      ?auto_40219 - SURFACE
    )
    :vars
    (
      ?auto_40227 - HOIST
      ?auto_40229 - PLACE
      ?auto_40228 - PLACE
      ?auto_40223 - HOIST
      ?auto_40226 - SURFACE
      ?auto_40224 - SURFACE
      ?auto_40220 - PLACE
      ?auto_40225 - HOIST
      ?auto_40230 - SURFACE
      ?auto_40222 - TRUCK
      ?auto_40221 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40227 ?auto_40229 ) ( IS-CRATE ?auto_40218 ) ( not ( = ?auto_40218 ?auto_40219 ) ) ( not ( = ?auto_40228 ?auto_40229 ) ) ( HOIST-AT ?auto_40223 ?auto_40228 ) ( not ( = ?auto_40227 ?auto_40223 ) ) ( AVAILABLE ?auto_40223 ) ( SURFACE-AT ?auto_40218 ?auto_40228 ) ( ON ?auto_40218 ?auto_40226 ) ( CLEAR ?auto_40218 ) ( not ( = ?auto_40218 ?auto_40226 ) ) ( not ( = ?auto_40219 ?auto_40226 ) ) ( IS-CRATE ?auto_40219 ) ( not ( = ?auto_40218 ?auto_40224 ) ) ( not ( = ?auto_40219 ?auto_40224 ) ) ( not ( = ?auto_40226 ?auto_40224 ) ) ( not ( = ?auto_40220 ?auto_40229 ) ) ( not ( = ?auto_40228 ?auto_40220 ) ) ( HOIST-AT ?auto_40225 ?auto_40220 ) ( not ( = ?auto_40227 ?auto_40225 ) ) ( not ( = ?auto_40223 ?auto_40225 ) ) ( AVAILABLE ?auto_40225 ) ( SURFACE-AT ?auto_40219 ?auto_40220 ) ( ON ?auto_40219 ?auto_40230 ) ( CLEAR ?auto_40219 ) ( not ( = ?auto_40218 ?auto_40230 ) ) ( not ( = ?auto_40219 ?auto_40230 ) ) ( not ( = ?auto_40226 ?auto_40230 ) ) ( not ( = ?auto_40224 ?auto_40230 ) ) ( TRUCK-AT ?auto_40222 ?auto_40229 ) ( SURFACE-AT ?auto_40221 ?auto_40229 ) ( CLEAR ?auto_40221 ) ( IS-CRATE ?auto_40224 ) ( not ( = ?auto_40218 ?auto_40221 ) ) ( not ( = ?auto_40219 ?auto_40221 ) ) ( not ( = ?auto_40226 ?auto_40221 ) ) ( not ( = ?auto_40224 ?auto_40221 ) ) ( not ( = ?auto_40230 ?auto_40221 ) ) ( AVAILABLE ?auto_40227 ) ( IN ?auto_40224 ?auto_40222 ) )
    :subtasks
    ( ( !UNLOAD ?auto_40227 ?auto_40224 ?auto_40222 ?auto_40229 )
      ( MAKE-ON ?auto_40218 ?auto_40219 )
      ( MAKE-ON-VERIFY ?auto_40218 ?auto_40219 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40231 - SURFACE
      ?auto_40232 - SURFACE
    )
    :vars
    (
      ?auto_40242 - HOIST
      ?auto_40240 - PLACE
      ?auto_40237 - PLACE
      ?auto_40239 - HOIST
      ?auto_40234 - SURFACE
      ?auto_40233 - SURFACE
      ?auto_40243 - PLACE
      ?auto_40238 - HOIST
      ?auto_40235 - SURFACE
      ?auto_40236 - SURFACE
      ?auto_40241 - TRUCK
      ?auto_40244 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40242 ?auto_40240 ) ( IS-CRATE ?auto_40231 ) ( not ( = ?auto_40231 ?auto_40232 ) ) ( not ( = ?auto_40237 ?auto_40240 ) ) ( HOIST-AT ?auto_40239 ?auto_40237 ) ( not ( = ?auto_40242 ?auto_40239 ) ) ( AVAILABLE ?auto_40239 ) ( SURFACE-AT ?auto_40231 ?auto_40237 ) ( ON ?auto_40231 ?auto_40234 ) ( CLEAR ?auto_40231 ) ( not ( = ?auto_40231 ?auto_40234 ) ) ( not ( = ?auto_40232 ?auto_40234 ) ) ( IS-CRATE ?auto_40232 ) ( not ( = ?auto_40231 ?auto_40233 ) ) ( not ( = ?auto_40232 ?auto_40233 ) ) ( not ( = ?auto_40234 ?auto_40233 ) ) ( not ( = ?auto_40243 ?auto_40240 ) ) ( not ( = ?auto_40237 ?auto_40243 ) ) ( HOIST-AT ?auto_40238 ?auto_40243 ) ( not ( = ?auto_40242 ?auto_40238 ) ) ( not ( = ?auto_40239 ?auto_40238 ) ) ( AVAILABLE ?auto_40238 ) ( SURFACE-AT ?auto_40232 ?auto_40243 ) ( ON ?auto_40232 ?auto_40235 ) ( CLEAR ?auto_40232 ) ( not ( = ?auto_40231 ?auto_40235 ) ) ( not ( = ?auto_40232 ?auto_40235 ) ) ( not ( = ?auto_40234 ?auto_40235 ) ) ( not ( = ?auto_40233 ?auto_40235 ) ) ( SURFACE-AT ?auto_40236 ?auto_40240 ) ( CLEAR ?auto_40236 ) ( IS-CRATE ?auto_40233 ) ( not ( = ?auto_40231 ?auto_40236 ) ) ( not ( = ?auto_40232 ?auto_40236 ) ) ( not ( = ?auto_40234 ?auto_40236 ) ) ( not ( = ?auto_40233 ?auto_40236 ) ) ( not ( = ?auto_40235 ?auto_40236 ) ) ( AVAILABLE ?auto_40242 ) ( IN ?auto_40233 ?auto_40241 ) ( TRUCK-AT ?auto_40241 ?auto_40244 ) ( not ( = ?auto_40244 ?auto_40240 ) ) ( not ( = ?auto_40237 ?auto_40244 ) ) ( not ( = ?auto_40243 ?auto_40244 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_40241 ?auto_40244 ?auto_40240 )
      ( MAKE-ON ?auto_40231 ?auto_40232 )
      ( MAKE-ON-VERIFY ?auto_40231 ?auto_40232 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40245 - SURFACE
      ?auto_40246 - SURFACE
    )
    :vars
    (
      ?auto_40248 - HOIST
      ?auto_40253 - PLACE
      ?auto_40255 - PLACE
      ?auto_40250 - HOIST
      ?auto_40257 - SURFACE
      ?auto_40252 - SURFACE
      ?auto_40247 - PLACE
      ?auto_40256 - HOIST
      ?auto_40258 - SURFACE
      ?auto_40254 - SURFACE
      ?auto_40251 - TRUCK
      ?auto_40249 - PLACE
      ?auto_40259 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_40248 ?auto_40253 ) ( IS-CRATE ?auto_40245 ) ( not ( = ?auto_40245 ?auto_40246 ) ) ( not ( = ?auto_40255 ?auto_40253 ) ) ( HOIST-AT ?auto_40250 ?auto_40255 ) ( not ( = ?auto_40248 ?auto_40250 ) ) ( AVAILABLE ?auto_40250 ) ( SURFACE-AT ?auto_40245 ?auto_40255 ) ( ON ?auto_40245 ?auto_40257 ) ( CLEAR ?auto_40245 ) ( not ( = ?auto_40245 ?auto_40257 ) ) ( not ( = ?auto_40246 ?auto_40257 ) ) ( IS-CRATE ?auto_40246 ) ( not ( = ?auto_40245 ?auto_40252 ) ) ( not ( = ?auto_40246 ?auto_40252 ) ) ( not ( = ?auto_40257 ?auto_40252 ) ) ( not ( = ?auto_40247 ?auto_40253 ) ) ( not ( = ?auto_40255 ?auto_40247 ) ) ( HOIST-AT ?auto_40256 ?auto_40247 ) ( not ( = ?auto_40248 ?auto_40256 ) ) ( not ( = ?auto_40250 ?auto_40256 ) ) ( AVAILABLE ?auto_40256 ) ( SURFACE-AT ?auto_40246 ?auto_40247 ) ( ON ?auto_40246 ?auto_40258 ) ( CLEAR ?auto_40246 ) ( not ( = ?auto_40245 ?auto_40258 ) ) ( not ( = ?auto_40246 ?auto_40258 ) ) ( not ( = ?auto_40257 ?auto_40258 ) ) ( not ( = ?auto_40252 ?auto_40258 ) ) ( SURFACE-AT ?auto_40254 ?auto_40253 ) ( CLEAR ?auto_40254 ) ( IS-CRATE ?auto_40252 ) ( not ( = ?auto_40245 ?auto_40254 ) ) ( not ( = ?auto_40246 ?auto_40254 ) ) ( not ( = ?auto_40257 ?auto_40254 ) ) ( not ( = ?auto_40252 ?auto_40254 ) ) ( not ( = ?auto_40258 ?auto_40254 ) ) ( AVAILABLE ?auto_40248 ) ( TRUCK-AT ?auto_40251 ?auto_40249 ) ( not ( = ?auto_40249 ?auto_40253 ) ) ( not ( = ?auto_40255 ?auto_40249 ) ) ( not ( = ?auto_40247 ?auto_40249 ) ) ( HOIST-AT ?auto_40259 ?auto_40249 ) ( LIFTING ?auto_40259 ?auto_40252 ) ( not ( = ?auto_40248 ?auto_40259 ) ) ( not ( = ?auto_40250 ?auto_40259 ) ) ( not ( = ?auto_40256 ?auto_40259 ) ) )
    :subtasks
    ( ( !LOAD ?auto_40259 ?auto_40252 ?auto_40251 ?auto_40249 )
      ( MAKE-ON ?auto_40245 ?auto_40246 )
      ( MAKE-ON-VERIFY ?auto_40245 ?auto_40246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40260 - SURFACE
      ?auto_40261 - SURFACE
    )
    :vars
    (
      ?auto_40265 - HOIST
      ?auto_40271 - PLACE
      ?auto_40267 - PLACE
      ?auto_40266 - HOIST
      ?auto_40270 - SURFACE
      ?auto_40269 - SURFACE
      ?auto_40272 - PLACE
      ?auto_40268 - HOIST
      ?auto_40263 - SURFACE
      ?auto_40262 - SURFACE
      ?auto_40274 - TRUCK
      ?auto_40264 - PLACE
      ?auto_40273 - HOIST
      ?auto_40275 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40265 ?auto_40271 ) ( IS-CRATE ?auto_40260 ) ( not ( = ?auto_40260 ?auto_40261 ) ) ( not ( = ?auto_40267 ?auto_40271 ) ) ( HOIST-AT ?auto_40266 ?auto_40267 ) ( not ( = ?auto_40265 ?auto_40266 ) ) ( AVAILABLE ?auto_40266 ) ( SURFACE-AT ?auto_40260 ?auto_40267 ) ( ON ?auto_40260 ?auto_40270 ) ( CLEAR ?auto_40260 ) ( not ( = ?auto_40260 ?auto_40270 ) ) ( not ( = ?auto_40261 ?auto_40270 ) ) ( IS-CRATE ?auto_40261 ) ( not ( = ?auto_40260 ?auto_40269 ) ) ( not ( = ?auto_40261 ?auto_40269 ) ) ( not ( = ?auto_40270 ?auto_40269 ) ) ( not ( = ?auto_40272 ?auto_40271 ) ) ( not ( = ?auto_40267 ?auto_40272 ) ) ( HOIST-AT ?auto_40268 ?auto_40272 ) ( not ( = ?auto_40265 ?auto_40268 ) ) ( not ( = ?auto_40266 ?auto_40268 ) ) ( AVAILABLE ?auto_40268 ) ( SURFACE-AT ?auto_40261 ?auto_40272 ) ( ON ?auto_40261 ?auto_40263 ) ( CLEAR ?auto_40261 ) ( not ( = ?auto_40260 ?auto_40263 ) ) ( not ( = ?auto_40261 ?auto_40263 ) ) ( not ( = ?auto_40270 ?auto_40263 ) ) ( not ( = ?auto_40269 ?auto_40263 ) ) ( SURFACE-AT ?auto_40262 ?auto_40271 ) ( CLEAR ?auto_40262 ) ( IS-CRATE ?auto_40269 ) ( not ( = ?auto_40260 ?auto_40262 ) ) ( not ( = ?auto_40261 ?auto_40262 ) ) ( not ( = ?auto_40270 ?auto_40262 ) ) ( not ( = ?auto_40269 ?auto_40262 ) ) ( not ( = ?auto_40263 ?auto_40262 ) ) ( AVAILABLE ?auto_40265 ) ( TRUCK-AT ?auto_40274 ?auto_40264 ) ( not ( = ?auto_40264 ?auto_40271 ) ) ( not ( = ?auto_40267 ?auto_40264 ) ) ( not ( = ?auto_40272 ?auto_40264 ) ) ( HOIST-AT ?auto_40273 ?auto_40264 ) ( not ( = ?auto_40265 ?auto_40273 ) ) ( not ( = ?auto_40266 ?auto_40273 ) ) ( not ( = ?auto_40268 ?auto_40273 ) ) ( AVAILABLE ?auto_40273 ) ( SURFACE-AT ?auto_40269 ?auto_40264 ) ( ON ?auto_40269 ?auto_40275 ) ( CLEAR ?auto_40269 ) ( not ( = ?auto_40260 ?auto_40275 ) ) ( not ( = ?auto_40261 ?auto_40275 ) ) ( not ( = ?auto_40270 ?auto_40275 ) ) ( not ( = ?auto_40269 ?auto_40275 ) ) ( not ( = ?auto_40263 ?auto_40275 ) ) ( not ( = ?auto_40262 ?auto_40275 ) ) )
    :subtasks
    ( ( !LIFT ?auto_40273 ?auto_40269 ?auto_40275 ?auto_40264 )
      ( MAKE-ON ?auto_40260 ?auto_40261 )
      ( MAKE-ON-VERIFY ?auto_40260 ?auto_40261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40276 - SURFACE
      ?auto_40277 - SURFACE
    )
    :vars
    (
      ?auto_40289 - HOIST
      ?auto_40281 - PLACE
      ?auto_40286 - PLACE
      ?auto_40284 - HOIST
      ?auto_40279 - SURFACE
      ?auto_40291 - SURFACE
      ?auto_40283 - PLACE
      ?auto_40290 - HOIST
      ?auto_40287 - SURFACE
      ?auto_40288 - SURFACE
      ?auto_40280 - PLACE
      ?auto_40278 - HOIST
      ?auto_40282 - SURFACE
      ?auto_40285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40289 ?auto_40281 ) ( IS-CRATE ?auto_40276 ) ( not ( = ?auto_40276 ?auto_40277 ) ) ( not ( = ?auto_40286 ?auto_40281 ) ) ( HOIST-AT ?auto_40284 ?auto_40286 ) ( not ( = ?auto_40289 ?auto_40284 ) ) ( AVAILABLE ?auto_40284 ) ( SURFACE-AT ?auto_40276 ?auto_40286 ) ( ON ?auto_40276 ?auto_40279 ) ( CLEAR ?auto_40276 ) ( not ( = ?auto_40276 ?auto_40279 ) ) ( not ( = ?auto_40277 ?auto_40279 ) ) ( IS-CRATE ?auto_40277 ) ( not ( = ?auto_40276 ?auto_40291 ) ) ( not ( = ?auto_40277 ?auto_40291 ) ) ( not ( = ?auto_40279 ?auto_40291 ) ) ( not ( = ?auto_40283 ?auto_40281 ) ) ( not ( = ?auto_40286 ?auto_40283 ) ) ( HOIST-AT ?auto_40290 ?auto_40283 ) ( not ( = ?auto_40289 ?auto_40290 ) ) ( not ( = ?auto_40284 ?auto_40290 ) ) ( AVAILABLE ?auto_40290 ) ( SURFACE-AT ?auto_40277 ?auto_40283 ) ( ON ?auto_40277 ?auto_40287 ) ( CLEAR ?auto_40277 ) ( not ( = ?auto_40276 ?auto_40287 ) ) ( not ( = ?auto_40277 ?auto_40287 ) ) ( not ( = ?auto_40279 ?auto_40287 ) ) ( not ( = ?auto_40291 ?auto_40287 ) ) ( SURFACE-AT ?auto_40288 ?auto_40281 ) ( CLEAR ?auto_40288 ) ( IS-CRATE ?auto_40291 ) ( not ( = ?auto_40276 ?auto_40288 ) ) ( not ( = ?auto_40277 ?auto_40288 ) ) ( not ( = ?auto_40279 ?auto_40288 ) ) ( not ( = ?auto_40291 ?auto_40288 ) ) ( not ( = ?auto_40287 ?auto_40288 ) ) ( AVAILABLE ?auto_40289 ) ( not ( = ?auto_40280 ?auto_40281 ) ) ( not ( = ?auto_40286 ?auto_40280 ) ) ( not ( = ?auto_40283 ?auto_40280 ) ) ( HOIST-AT ?auto_40278 ?auto_40280 ) ( not ( = ?auto_40289 ?auto_40278 ) ) ( not ( = ?auto_40284 ?auto_40278 ) ) ( not ( = ?auto_40290 ?auto_40278 ) ) ( AVAILABLE ?auto_40278 ) ( SURFACE-AT ?auto_40291 ?auto_40280 ) ( ON ?auto_40291 ?auto_40282 ) ( CLEAR ?auto_40291 ) ( not ( = ?auto_40276 ?auto_40282 ) ) ( not ( = ?auto_40277 ?auto_40282 ) ) ( not ( = ?auto_40279 ?auto_40282 ) ) ( not ( = ?auto_40291 ?auto_40282 ) ) ( not ( = ?auto_40287 ?auto_40282 ) ) ( not ( = ?auto_40288 ?auto_40282 ) ) ( TRUCK-AT ?auto_40285 ?auto_40281 ) )
    :subtasks
    ( ( !DRIVE ?auto_40285 ?auto_40281 ?auto_40280 )
      ( MAKE-ON ?auto_40276 ?auto_40277 )
      ( MAKE-ON-VERIFY ?auto_40276 ?auto_40277 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40292 - SURFACE
      ?auto_40293 - SURFACE
    )
    :vars
    (
      ?auto_40298 - HOIST
      ?auto_40307 - PLACE
      ?auto_40299 - PLACE
      ?auto_40306 - HOIST
      ?auto_40295 - SURFACE
      ?auto_40297 - SURFACE
      ?auto_40301 - PLACE
      ?auto_40296 - HOIST
      ?auto_40304 - SURFACE
      ?auto_40302 - SURFACE
      ?auto_40294 - PLACE
      ?auto_40300 - HOIST
      ?auto_40305 - SURFACE
      ?auto_40303 - TRUCK
      ?auto_40308 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40298 ?auto_40307 ) ( IS-CRATE ?auto_40292 ) ( not ( = ?auto_40292 ?auto_40293 ) ) ( not ( = ?auto_40299 ?auto_40307 ) ) ( HOIST-AT ?auto_40306 ?auto_40299 ) ( not ( = ?auto_40298 ?auto_40306 ) ) ( AVAILABLE ?auto_40306 ) ( SURFACE-AT ?auto_40292 ?auto_40299 ) ( ON ?auto_40292 ?auto_40295 ) ( CLEAR ?auto_40292 ) ( not ( = ?auto_40292 ?auto_40295 ) ) ( not ( = ?auto_40293 ?auto_40295 ) ) ( IS-CRATE ?auto_40293 ) ( not ( = ?auto_40292 ?auto_40297 ) ) ( not ( = ?auto_40293 ?auto_40297 ) ) ( not ( = ?auto_40295 ?auto_40297 ) ) ( not ( = ?auto_40301 ?auto_40307 ) ) ( not ( = ?auto_40299 ?auto_40301 ) ) ( HOIST-AT ?auto_40296 ?auto_40301 ) ( not ( = ?auto_40298 ?auto_40296 ) ) ( not ( = ?auto_40306 ?auto_40296 ) ) ( AVAILABLE ?auto_40296 ) ( SURFACE-AT ?auto_40293 ?auto_40301 ) ( ON ?auto_40293 ?auto_40304 ) ( CLEAR ?auto_40293 ) ( not ( = ?auto_40292 ?auto_40304 ) ) ( not ( = ?auto_40293 ?auto_40304 ) ) ( not ( = ?auto_40295 ?auto_40304 ) ) ( not ( = ?auto_40297 ?auto_40304 ) ) ( IS-CRATE ?auto_40297 ) ( not ( = ?auto_40292 ?auto_40302 ) ) ( not ( = ?auto_40293 ?auto_40302 ) ) ( not ( = ?auto_40295 ?auto_40302 ) ) ( not ( = ?auto_40297 ?auto_40302 ) ) ( not ( = ?auto_40304 ?auto_40302 ) ) ( not ( = ?auto_40294 ?auto_40307 ) ) ( not ( = ?auto_40299 ?auto_40294 ) ) ( not ( = ?auto_40301 ?auto_40294 ) ) ( HOIST-AT ?auto_40300 ?auto_40294 ) ( not ( = ?auto_40298 ?auto_40300 ) ) ( not ( = ?auto_40306 ?auto_40300 ) ) ( not ( = ?auto_40296 ?auto_40300 ) ) ( AVAILABLE ?auto_40300 ) ( SURFACE-AT ?auto_40297 ?auto_40294 ) ( ON ?auto_40297 ?auto_40305 ) ( CLEAR ?auto_40297 ) ( not ( = ?auto_40292 ?auto_40305 ) ) ( not ( = ?auto_40293 ?auto_40305 ) ) ( not ( = ?auto_40295 ?auto_40305 ) ) ( not ( = ?auto_40297 ?auto_40305 ) ) ( not ( = ?auto_40304 ?auto_40305 ) ) ( not ( = ?auto_40302 ?auto_40305 ) ) ( TRUCK-AT ?auto_40303 ?auto_40307 ) ( SURFACE-AT ?auto_40308 ?auto_40307 ) ( CLEAR ?auto_40308 ) ( LIFTING ?auto_40298 ?auto_40302 ) ( IS-CRATE ?auto_40302 ) ( not ( = ?auto_40292 ?auto_40308 ) ) ( not ( = ?auto_40293 ?auto_40308 ) ) ( not ( = ?auto_40295 ?auto_40308 ) ) ( not ( = ?auto_40297 ?auto_40308 ) ) ( not ( = ?auto_40304 ?auto_40308 ) ) ( not ( = ?auto_40302 ?auto_40308 ) ) ( not ( = ?auto_40305 ?auto_40308 ) ) )
    :subtasks
    ( ( !DROP ?auto_40298 ?auto_40302 ?auto_40308 ?auto_40307 )
      ( MAKE-ON ?auto_40292 ?auto_40293 )
      ( MAKE-ON-VERIFY ?auto_40292 ?auto_40293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40309 - SURFACE
      ?auto_40310 - SURFACE
    )
    :vars
    (
      ?auto_40323 - HOIST
      ?auto_40313 - PLACE
      ?auto_40314 - PLACE
      ?auto_40317 - HOIST
      ?auto_40315 - SURFACE
      ?auto_40324 - SURFACE
      ?auto_40312 - PLACE
      ?auto_40320 - HOIST
      ?auto_40321 - SURFACE
      ?auto_40316 - SURFACE
      ?auto_40318 - PLACE
      ?auto_40325 - HOIST
      ?auto_40311 - SURFACE
      ?auto_40319 - TRUCK
      ?auto_40322 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40323 ?auto_40313 ) ( IS-CRATE ?auto_40309 ) ( not ( = ?auto_40309 ?auto_40310 ) ) ( not ( = ?auto_40314 ?auto_40313 ) ) ( HOIST-AT ?auto_40317 ?auto_40314 ) ( not ( = ?auto_40323 ?auto_40317 ) ) ( AVAILABLE ?auto_40317 ) ( SURFACE-AT ?auto_40309 ?auto_40314 ) ( ON ?auto_40309 ?auto_40315 ) ( CLEAR ?auto_40309 ) ( not ( = ?auto_40309 ?auto_40315 ) ) ( not ( = ?auto_40310 ?auto_40315 ) ) ( IS-CRATE ?auto_40310 ) ( not ( = ?auto_40309 ?auto_40324 ) ) ( not ( = ?auto_40310 ?auto_40324 ) ) ( not ( = ?auto_40315 ?auto_40324 ) ) ( not ( = ?auto_40312 ?auto_40313 ) ) ( not ( = ?auto_40314 ?auto_40312 ) ) ( HOIST-AT ?auto_40320 ?auto_40312 ) ( not ( = ?auto_40323 ?auto_40320 ) ) ( not ( = ?auto_40317 ?auto_40320 ) ) ( AVAILABLE ?auto_40320 ) ( SURFACE-AT ?auto_40310 ?auto_40312 ) ( ON ?auto_40310 ?auto_40321 ) ( CLEAR ?auto_40310 ) ( not ( = ?auto_40309 ?auto_40321 ) ) ( not ( = ?auto_40310 ?auto_40321 ) ) ( not ( = ?auto_40315 ?auto_40321 ) ) ( not ( = ?auto_40324 ?auto_40321 ) ) ( IS-CRATE ?auto_40324 ) ( not ( = ?auto_40309 ?auto_40316 ) ) ( not ( = ?auto_40310 ?auto_40316 ) ) ( not ( = ?auto_40315 ?auto_40316 ) ) ( not ( = ?auto_40324 ?auto_40316 ) ) ( not ( = ?auto_40321 ?auto_40316 ) ) ( not ( = ?auto_40318 ?auto_40313 ) ) ( not ( = ?auto_40314 ?auto_40318 ) ) ( not ( = ?auto_40312 ?auto_40318 ) ) ( HOIST-AT ?auto_40325 ?auto_40318 ) ( not ( = ?auto_40323 ?auto_40325 ) ) ( not ( = ?auto_40317 ?auto_40325 ) ) ( not ( = ?auto_40320 ?auto_40325 ) ) ( AVAILABLE ?auto_40325 ) ( SURFACE-AT ?auto_40324 ?auto_40318 ) ( ON ?auto_40324 ?auto_40311 ) ( CLEAR ?auto_40324 ) ( not ( = ?auto_40309 ?auto_40311 ) ) ( not ( = ?auto_40310 ?auto_40311 ) ) ( not ( = ?auto_40315 ?auto_40311 ) ) ( not ( = ?auto_40324 ?auto_40311 ) ) ( not ( = ?auto_40321 ?auto_40311 ) ) ( not ( = ?auto_40316 ?auto_40311 ) ) ( TRUCK-AT ?auto_40319 ?auto_40313 ) ( SURFACE-AT ?auto_40322 ?auto_40313 ) ( CLEAR ?auto_40322 ) ( IS-CRATE ?auto_40316 ) ( not ( = ?auto_40309 ?auto_40322 ) ) ( not ( = ?auto_40310 ?auto_40322 ) ) ( not ( = ?auto_40315 ?auto_40322 ) ) ( not ( = ?auto_40324 ?auto_40322 ) ) ( not ( = ?auto_40321 ?auto_40322 ) ) ( not ( = ?auto_40316 ?auto_40322 ) ) ( not ( = ?auto_40311 ?auto_40322 ) ) ( AVAILABLE ?auto_40323 ) ( IN ?auto_40316 ?auto_40319 ) )
    :subtasks
    ( ( !UNLOAD ?auto_40323 ?auto_40316 ?auto_40319 ?auto_40313 )
      ( MAKE-ON ?auto_40309 ?auto_40310 )
      ( MAKE-ON-VERIFY ?auto_40309 ?auto_40310 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40326 - SURFACE
      ?auto_40327 - SURFACE
    )
    :vars
    (
      ?auto_40335 - HOIST
      ?auto_40334 - PLACE
      ?auto_40331 - PLACE
      ?auto_40328 - HOIST
      ?auto_40329 - SURFACE
      ?auto_40330 - SURFACE
      ?auto_40339 - PLACE
      ?auto_40338 - HOIST
      ?auto_40336 - SURFACE
      ?auto_40337 - SURFACE
      ?auto_40333 - PLACE
      ?auto_40342 - HOIST
      ?auto_40332 - SURFACE
      ?auto_40340 - SURFACE
      ?auto_40341 - TRUCK
      ?auto_40343 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40335 ?auto_40334 ) ( IS-CRATE ?auto_40326 ) ( not ( = ?auto_40326 ?auto_40327 ) ) ( not ( = ?auto_40331 ?auto_40334 ) ) ( HOIST-AT ?auto_40328 ?auto_40331 ) ( not ( = ?auto_40335 ?auto_40328 ) ) ( AVAILABLE ?auto_40328 ) ( SURFACE-AT ?auto_40326 ?auto_40331 ) ( ON ?auto_40326 ?auto_40329 ) ( CLEAR ?auto_40326 ) ( not ( = ?auto_40326 ?auto_40329 ) ) ( not ( = ?auto_40327 ?auto_40329 ) ) ( IS-CRATE ?auto_40327 ) ( not ( = ?auto_40326 ?auto_40330 ) ) ( not ( = ?auto_40327 ?auto_40330 ) ) ( not ( = ?auto_40329 ?auto_40330 ) ) ( not ( = ?auto_40339 ?auto_40334 ) ) ( not ( = ?auto_40331 ?auto_40339 ) ) ( HOIST-AT ?auto_40338 ?auto_40339 ) ( not ( = ?auto_40335 ?auto_40338 ) ) ( not ( = ?auto_40328 ?auto_40338 ) ) ( AVAILABLE ?auto_40338 ) ( SURFACE-AT ?auto_40327 ?auto_40339 ) ( ON ?auto_40327 ?auto_40336 ) ( CLEAR ?auto_40327 ) ( not ( = ?auto_40326 ?auto_40336 ) ) ( not ( = ?auto_40327 ?auto_40336 ) ) ( not ( = ?auto_40329 ?auto_40336 ) ) ( not ( = ?auto_40330 ?auto_40336 ) ) ( IS-CRATE ?auto_40330 ) ( not ( = ?auto_40326 ?auto_40337 ) ) ( not ( = ?auto_40327 ?auto_40337 ) ) ( not ( = ?auto_40329 ?auto_40337 ) ) ( not ( = ?auto_40330 ?auto_40337 ) ) ( not ( = ?auto_40336 ?auto_40337 ) ) ( not ( = ?auto_40333 ?auto_40334 ) ) ( not ( = ?auto_40331 ?auto_40333 ) ) ( not ( = ?auto_40339 ?auto_40333 ) ) ( HOIST-AT ?auto_40342 ?auto_40333 ) ( not ( = ?auto_40335 ?auto_40342 ) ) ( not ( = ?auto_40328 ?auto_40342 ) ) ( not ( = ?auto_40338 ?auto_40342 ) ) ( AVAILABLE ?auto_40342 ) ( SURFACE-AT ?auto_40330 ?auto_40333 ) ( ON ?auto_40330 ?auto_40332 ) ( CLEAR ?auto_40330 ) ( not ( = ?auto_40326 ?auto_40332 ) ) ( not ( = ?auto_40327 ?auto_40332 ) ) ( not ( = ?auto_40329 ?auto_40332 ) ) ( not ( = ?auto_40330 ?auto_40332 ) ) ( not ( = ?auto_40336 ?auto_40332 ) ) ( not ( = ?auto_40337 ?auto_40332 ) ) ( SURFACE-AT ?auto_40340 ?auto_40334 ) ( CLEAR ?auto_40340 ) ( IS-CRATE ?auto_40337 ) ( not ( = ?auto_40326 ?auto_40340 ) ) ( not ( = ?auto_40327 ?auto_40340 ) ) ( not ( = ?auto_40329 ?auto_40340 ) ) ( not ( = ?auto_40330 ?auto_40340 ) ) ( not ( = ?auto_40336 ?auto_40340 ) ) ( not ( = ?auto_40337 ?auto_40340 ) ) ( not ( = ?auto_40332 ?auto_40340 ) ) ( AVAILABLE ?auto_40335 ) ( IN ?auto_40337 ?auto_40341 ) ( TRUCK-AT ?auto_40341 ?auto_40343 ) ( not ( = ?auto_40343 ?auto_40334 ) ) ( not ( = ?auto_40331 ?auto_40343 ) ) ( not ( = ?auto_40339 ?auto_40343 ) ) ( not ( = ?auto_40333 ?auto_40343 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_40341 ?auto_40343 ?auto_40334 )
      ( MAKE-ON ?auto_40326 ?auto_40327 )
      ( MAKE-ON-VERIFY ?auto_40326 ?auto_40327 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40344 - SURFACE
      ?auto_40345 - SURFACE
    )
    :vars
    (
      ?auto_40352 - HOIST
      ?auto_40360 - PLACE
      ?auto_40346 - PLACE
      ?auto_40356 - HOIST
      ?auto_40354 - SURFACE
      ?auto_40357 - SURFACE
      ?auto_40355 - PLACE
      ?auto_40358 - HOIST
      ?auto_40350 - SURFACE
      ?auto_40347 - SURFACE
      ?auto_40353 - PLACE
      ?auto_40351 - HOIST
      ?auto_40348 - SURFACE
      ?auto_40359 - SURFACE
      ?auto_40349 - TRUCK
      ?auto_40361 - PLACE
      ?auto_40362 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_40352 ?auto_40360 ) ( IS-CRATE ?auto_40344 ) ( not ( = ?auto_40344 ?auto_40345 ) ) ( not ( = ?auto_40346 ?auto_40360 ) ) ( HOIST-AT ?auto_40356 ?auto_40346 ) ( not ( = ?auto_40352 ?auto_40356 ) ) ( AVAILABLE ?auto_40356 ) ( SURFACE-AT ?auto_40344 ?auto_40346 ) ( ON ?auto_40344 ?auto_40354 ) ( CLEAR ?auto_40344 ) ( not ( = ?auto_40344 ?auto_40354 ) ) ( not ( = ?auto_40345 ?auto_40354 ) ) ( IS-CRATE ?auto_40345 ) ( not ( = ?auto_40344 ?auto_40357 ) ) ( not ( = ?auto_40345 ?auto_40357 ) ) ( not ( = ?auto_40354 ?auto_40357 ) ) ( not ( = ?auto_40355 ?auto_40360 ) ) ( not ( = ?auto_40346 ?auto_40355 ) ) ( HOIST-AT ?auto_40358 ?auto_40355 ) ( not ( = ?auto_40352 ?auto_40358 ) ) ( not ( = ?auto_40356 ?auto_40358 ) ) ( AVAILABLE ?auto_40358 ) ( SURFACE-AT ?auto_40345 ?auto_40355 ) ( ON ?auto_40345 ?auto_40350 ) ( CLEAR ?auto_40345 ) ( not ( = ?auto_40344 ?auto_40350 ) ) ( not ( = ?auto_40345 ?auto_40350 ) ) ( not ( = ?auto_40354 ?auto_40350 ) ) ( not ( = ?auto_40357 ?auto_40350 ) ) ( IS-CRATE ?auto_40357 ) ( not ( = ?auto_40344 ?auto_40347 ) ) ( not ( = ?auto_40345 ?auto_40347 ) ) ( not ( = ?auto_40354 ?auto_40347 ) ) ( not ( = ?auto_40357 ?auto_40347 ) ) ( not ( = ?auto_40350 ?auto_40347 ) ) ( not ( = ?auto_40353 ?auto_40360 ) ) ( not ( = ?auto_40346 ?auto_40353 ) ) ( not ( = ?auto_40355 ?auto_40353 ) ) ( HOIST-AT ?auto_40351 ?auto_40353 ) ( not ( = ?auto_40352 ?auto_40351 ) ) ( not ( = ?auto_40356 ?auto_40351 ) ) ( not ( = ?auto_40358 ?auto_40351 ) ) ( AVAILABLE ?auto_40351 ) ( SURFACE-AT ?auto_40357 ?auto_40353 ) ( ON ?auto_40357 ?auto_40348 ) ( CLEAR ?auto_40357 ) ( not ( = ?auto_40344 ?auto_40348 ) ) ( not ( = ?auto_40345 ?auto_40348 ) ) ( not ( = ?auto_40354 ?auto_40348 ) ) ( not ( = ?auto_40357 ?auto_40348 ) ) ( not ( = ?auto_40350 ?auto_40348 ) ) ( not ( = ?auto_40347 ?auto_40348 ) ) ( SURFACE-AT ?auto_40359 ?auto_40360 ) ( CLEAR ?auto_40359 ) ( IS-CRATE ?auto_40347 ) ( not ( = ?auto_40344 ?auto_40359 ) ) ( not ( = ?auto_40345 ?auto_40359 ) ) ( not ( = ?auto_40354 ?auto_40359 ) ) ( not ( = ?auto_40357 ?auto_40359 ) ) ( not ( = ?auto_40350 ?auto_40359 ) ) ( not ( = ?auto_40347 ?auto_40359 ) ) ( not ( = ?auto_40348 ?auto_40359 ) ) ( AVAILABLE ?auto_40352 ) ( TRUCK-AT ?auto_40349 ?auto_40361 ) ( not ( = ?auto_40361 ?auto_40360 ) ) ( not ( = ?auto_40346 ?auto_40361 ) ) ( not ( = ?auto_40355 ?auto_40361 ) ) ( not ( = ?auto_40353 ?auto_40361 ) ) ( HOIST-AT ?auto_40362 ?auto_40361 ) ( LIFTING ?auto_40362 ?auto_40347 ) ( not ( = ?auto_40352 ?auto_40362 ) ) ( not ( = ?auto_40356 ?auto_40362 ) ) ( not ( = ?auto_40358 ?auto_40362 ) ) ( not ( = ?auto_40351 ?auto_40362 ) ) )
    :subtasks
    ( ( !LOAD ?auto_40362 ?auto_40347 ?auto_40349 ?auto_40361 )
      ( MAKE-ON ?auto_40344 ?auto_40345 )
      ( MAKE-ON-VERIFY ?auto_40344 ?auto_40345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40363 - SURFACE
      ?auto_40364 - SURFACE
    )
    :vars
    (
      ?auto_40371 - HOIST
      ?auto_40370 - PLACE
      ?auto_40368 - PLACE
      ?auto_40372 - HOIST
      ?auto_40365 - SURFACE
      ?auto_40369 - SURFACE
      ?auto_40376 - PLACE
      ?auto_40367 - HOIST
      ?auto_40378 - SURFACE
      ?auto_40380 - SURFACE
      ?auto_40379 - PLACE
      ?auto_40375 - HOIST
      ?auto_40381 - SURFACE
      ?auto_40366 - SURFACE
      ?auto_40373 - TRUCK
      ?auto_40377 - PLACE
      ?auto_40374 - HOIST
      ?auto_40382 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40371 ?auto_40370 ) ( IS-CRATE ?auto_40363 ) ( not ( = ?auto_40363 ?auto_40364 ) ) ( not ( = ?auto_40368 ?auto_40370 ) ) ( HOIST-AT ?auto_40372 ?auto_40368 ) ( not ( = ?auto_40371 ?auto_40372 ) ) ( AVAILABLE ?auto_40372 ) ( SURFACE-AT ?auto_40363 ?auto_40368 ) ( ON ?auto_40363 ?auto_40365 ) ( CLEAR ?auto_40363 ) ( not ( = ?auto_40363 ?auto_40365 ) ) ( not ( = ?auto_40364 ?auto_40365 ) ) ( IS-CRATE ?auto_40364 ) ( not ( = ?auto_40363 ?auto_40369 ) ) ( not ( = ?auto_40364 ?auto_40369 ) ) ( not ( = ?auto_40365 ?auto_40369 ) ) ( not ( = ?auto_40376 ?auto_40370 ) ) ( not ( = ?auto_40368 ?auto_40376 ) ) ( HOIST-AT ?auto_40367 ?auto_40376 ) ( not ( = ?auto_40371 ?auto_40367 ) ) ( not ( = ?auto_40372 ?auto_40367 ) ) ( AVAILABLE ?auto_40367 ) ( SURFACE-AT ?auto_40364 ?auto_40376 ) ( ON ?auto_40364 ?auto_40378 ) ( CLEAR ?auto_40364 ) ( not ( = ?auto_40363 ?auto_40378 ) ) ( not ( = ?auto_40364 ?auto_40378 ) ) ( not ( = ?auto_40365 ?auto_40378 ) ) ( not ( = ?auto_40369 ?auto_40378 ) ) ( IS-CRATE ?auto_40369 ) ( not ( = ?auto_40363 ?auto_40380 ) ) ( not ( = ?auto_40364 ?auto_40380 ) ) ( not ( = ?auto_40365 ?auto_40380 ) ) ( not ( = ?auto_40369 ?auto_40380 ) ) ( not ( = ?auto_40378 ?auto_40380 ) ) ( not ( = ?auto_40379 ?auto_40370 ) ) ( not ( = ?auto_40368 ?auto_40379 ) ) ( not ( = ?auto_40376 ?auto_40379 ) ) ( HOIST-AT ?auto_40375 ?auto_40379 ) ( not ( = ?auto_40371 ?auto_40375 ) ) ( not ( = ?auto_40372 ?auto_40375 ) ) ( not ( = ?auto_40367 ?auto_40375 ) ) ( AVAILABLE ?auto_40375 ) ( SURFACE-AT ?auto_40369 ?auto_40379 ) ( ON ?auto_40369 ?auto_40381 ) ( CLEAR ?auto_40369 ) ( not ( = ?auto_40363 ?auto_40381 ) ) ( not ( = ?auto_40364 ?auto_40381 ) ) ( not ( = ?auto_40365 ?auto_40381 ) ) ( not ( = ?auto_40369 ?auto_40381 ) ) ( not ( = ?auto_40378 ?auto_40381 ) ) ( not ( = ?auto_40380 ?auto_40381 ) ) ( SURFACE-AT ?auto_40366 ?auto_40370 ) ( CLEAR ?auto_40366 ) ( IS-CRATE ?auto_40380 ) ( not ( = ?auto_40363 ?auto_40366 ) ) ( not ( = ?auto_40364 ?auto_40366 ) ) ( not ( = ?auto_40365 ?auto_40366 ) ) ( not ( = ?auto_40369 ?auto_40366 ) ) ( not ( = ?auto_40378 ?auto_40366 ) ) ( not ( = ?auto_40380 ?auto_40366 ) ) ( not ( = ?auto_40381 ?auto_40366 ) ) ( AVAILABLE ?auto_40371 ) ( TRUCK-AT ?auto_40373 ?auto_40377 ) ( not ( = ?auto_40377 ?auto_40370 ) ) ( not ( = ?auto_40368 ?auto_40377 ) ) ( not ( = ?auto_40376 ?auto_40377 ) ) ( not ( = ?auto_40379 ?auto_40377 ) ) ( HOIST-AT ?auto_40374 ?auto_40377 ) ( not ( = ?auto_40371 ?auto_40374 ) ) ( not ( = ?auto_40372 ?auto_40374 ) ) ( not ( = ?auto_40367 ?auto_40374 ) ) ( not ( = ?auto_40375 ?auto_40374 ) ) ( AVAILABLE ?auto_40374 ) ( SURFACE-AT ?auto_40380 ?auto_40377 ) ( ON ?auto_40380 ?auto_40382 ) ( CLEAR ?auto_40380 ) ( not ( = ?auto_40363 ?auto_40382 ) ) ( not ( = ?auto_40364 ?auto_40382 ) ) ( not ( = ?auto_40365 ?auto_40382 ) ) ( not ( = ?auto_40369 ?auto_40382 ) ) ( not ( = ?auto_40378 ?auto_40382 ) ) ( not ( = ?auto_40380 ?auto_40382 ) ) ( not ( = ?auto_40381 ?auto_40382 ) ) ( not ( = ?auto_40366 ?auto_40382 ) ) )
    :subtasks
    ( ( !LIFT ?auto_40374 ?auto_40380 ?auto_40382 ?auto_40377 )
      ( MAKE-ON ?auto_40363 ?auto_40364 )
      ( MAKE-ON-VERIFY ?auto_40363 ?auto_40364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40383 - SURFACE
      ?auto_40384 - SURFACE
    )
    :vars
    (
      ?auto_40399 - HOIST
      ?auto_40387 - PLACE
      ?auto_40395 - PLACE
      ?auto_40388 - HOIST
      ?auto_40398 - SURFACE
      ?auto_40394 - SURFACE
      ?auto_40391 - PLACE
      ?auto_40397 - HOIST
      ?auto_40402 - SURFACE
      ?auto_40385 - SURFACE
      ?auto_40393 - PLACE
      ?auto_40390 - HOIST
      ?auto_40392 - SURFACE
      ?auto_40396 - SURFACE
      ?auto_40389 - PLACE
      ?auto_40400 - HOIST
      ?auto_40386 - SURFACE
      ?auto_40401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40399 ?auto_40387 ) ( IS-CRATE ?auto_40383 ) ( not ( = ?auto_40383 ?auto_40384 ) ) ( not ( = ?auto_40395 ?auto_40387 ) ) ( HOIST-AT ?auto_40388 ?auto_40395 ) ( not ( = ?auto_40399 ?auto_40388 ) ) ( AVAILABLE ?auto_40388 ) ( SURFACE-AT ?auto_40383 ?auto_40395 ) ( ON ?auto_40383 ?auto_40398 ) ( CLEAR ?auto_40383 ) ( not ( = ?auto_40383 ?auto_40398 ) ) ( not ( = ?auto_40384 ?auto_40398 ) ) ( IS-CRATE ?auto_40384 ) ( not ( = ?auto_40383 ?auto_40394 ) ) ( not ( = ?auto_40384 ?auto_40394 ) ) ( not ( = ?auto_40398 ?auto_40394 ) ) ( not ( = ?auto_40391 ?auto_40387 ) ) ( not ( = ?auto_40395 ?auto_40391 ) ) ( HOIST-AT ?auto_40397 ?auto_40391 ) ( not ( = ?auto_40399 ?auto_40397 ) ) ( not ( = ?auto_40388 ?auto_40397 ) ) ( AVAILABLE ?auto_40397 ) ( SURFACE-AT ?auto_40384 ?auto_40391 ) ( ON ?auto_40384 ?auto_40402 ) ( CLEAR ?auto_40384 ) ( not ( = ?auto_40383 ?auto_40402 ) ) ( not ( = ?auto_40384 ?auto_40402 ) ) ( not ( = ?auto_40398 ?auto_40402 ) ) ( not ( = ?auto_40394 ?auto_40402 ) ) ( IS-CRATE ?auto_40394 ) ( not ( = ?auto_40383 ?auto_40385 ) ) ( not ( = ?auto_40384 ?auto_40385 ) ) ( not ( = ?auto_40398 ?auto_40385 ) ) ( not ( = ?auto_40394 ?auto_40385 ) ) ( not ( = ?auto_40402 ?auto_40385 ) ) ( not ( = ?auto_40393 ?auto_40387 ) ) ( not ( = ?auto_40395 ?auto_40393 ) ) ( not ( = ?auto_40391 ?auto_40393 ) ) ( HOIST-AT ?auto_40390 ?auto_40393 ) ( not ( = ?auto_40399 ?auto_40390 ) ) ( not ( = ?auto_40388 ?auto_40390 ) ) ( not ( = ?auto_40397 ?auto_40390 ) ) ( AVAILABLE ?auto_40390 ) ( SURFACE-AT ?auto_40394 ?auto_40393 ) ( ON ?auto_40394 ?auto_40392 ) ( CLEAR ?auto_40394 ) ( not ( = ?auto_40383 ?auto_40392 ) ) ( not ( = ?auto_40384 ?auto_40392 ) ) ( not ( = ?auto_40398 ?auto_40392 ) ) ( not ( = ?auto_40394 ?auto_40392 ) ) ( not ( = ?auto_40402 ?auto_40392 ) ) ( not ( = ?auto_40385 ?auto_40392 ) ) ( SURFACE-AT ?auto_40396 ?auto_40387 ) ( CLEAR ?auto_40396 ) ( IS-CRATE ?auto_40385 ) ( not ( = ?auto_40383 ?auto_40396 ) ) ( not ( = ?auto_40384 ?auto_40396 ) ) ( not ( = ?auto_40398 ?auto_40396 ) ) ( not ( = ?auto_40394 ?auto_40396 ) ) ( not ( = ?auto_40402 ?auto_40396 ) ) ( not ( = ?auto_40385 ?auto_40396 ) ) ( not ( = ?auto_40392 ?auto_40396 ) ) ( AVAILABLE ?auto_40399 ) ( not ( = ?auto_40389 ?auto_40387 ) ) ( not ( = ?auto_40395 ?auto_40389 ) ) ( not ( = ?auto_40391 ?auto_40389 ) ) ( not ( = ?auto_40393 ?auto_40389 ) ) ( HOIST-AT ?auto_40400 ?auto_40389 ) ( not ( = ?auto_40399 ?auto_40400 ) ) ( not ( = ?auto_40388 ?auto_40400 ) ) ( not ( = ?auto_40397 ?auto_40400 ) ) ( not ( = ?auto_40390 ?auto_40400 ) ) ( AVAILABLE ?auto_40400 ) ( SURFACE-AT ?auto_40385 ?auto_40389 ) ( ON ?auto_40385 ?auto_40386 ) ( CLEAR ?auto_40385 ) ( not ( = ?auto_40383 ?auto_40386 ) ) ( not ( = ?auto_40384 ?auto_40386 ) ) ( not ( = ?auto_40398 ?auto_40386 ) ) ( not ( = ?auto_40394 ?auto_40386 ) ) ( not ( = ?auto_40402 ?auto_40386 ) ) ( not ( = ?auto_40385 ?auto_40386 ) ) ( not ( = ?auto_40392 ?auto_40386 ) ) ( not ( = ?auto_40396 ?auto_40386 ) ) ( TRUCK-AT ?auto_40401 ?auto_40387 ) )
    :subtasks
    ( ( !DRIVE ?auto_40401 ?auto_40387 ?auto_40389 )
      ( MAKE-ON ?auto_40383 ?auto_40384 )
      ( MAKE-ON-VERIFY ?auto_40383 ?auto_40384 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40403 - SURFACE
      ?auto_40404 - SURFACE
    )
    :vars
    (
      ?auto_40413 - HOIST
      ?auto_40412 - PLACE
      ?auto_40408 - PLACE
      ?auto_40409 - HOIST
      ?auto_40418 - SURFACE
      ?auto_40407 - SURFACE
      ?auto_40421 - PLACE
      ?auto_40411 - HOIST
      ?auto_40410 - SURFACE
      ?auto_40406 - SURFACE
      ?auto_40419 - PLACE
      ?auto_40405 - HOIST
      ?auto_40416 - SURFACE
      ?auto_40417 - SURFACE
      ?auto_40422 - PLACE
      ?auto_40414 - HOIST
      ?auto_40420 - SURFACE
      ?auto_40415 - TRUCK
      ?auto_40423 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40413 ?auto_40412 ) ( IS-CRATE ?auto_40403 ) ( not ( = ?auto_40403 ?auto_40404 ) ) ( not ( = ?auto_40408 ?auto_40412 ) ) ( HOIST-AT ?auto_40409 ?auto_40408 ) ( not ( = ?auto_40413 ?auto_40409 ) ) ( AVAILABLE ?auto_40409 ) ( SURFACE-AT ?auto_40403 ?auto_40408 ) ( ON ?auto_40403 ?auto_40418 ) ( CLEAR ?auto_40403 ) ( not ( = ?auto_40403 ?auto_40418 ) ) ( not ( = ?auto_40404 ?auto_40418 ) ) ( IS-CRATE ?auto_40404 ) ( not ( = ?auto_40403 ?auto_40407 ) ) ( not ( = ?auto_40404 ?auto_40407 ) ) ( not ( = ?auto_40418 ?auto_40407 ) ) ( not ( = ?auto_40421 ?auto_40412 ) ) ( not ( = ?auto_40408 ?auto_40421 ) ) ( HOIST-AT ?auto_40411 ?auto_40421 ) ( not ( = ?auto_40413 ?auto_40411 ) ) ( not ( = ?auto_40409 ?auto_40411 ) ) ( AVAILABLE ?auto_40411 ) ( SURFACE-AT ?auto_40404 ?auto_40421 ) ( ON ?auto_40404 ?auto_40410 ) ( CLEAR ?auto_40404 ) ( not ( = ?auto_40403 ?auto_40410 ) ) ( not ( = ?auto_40404 ?auto_40410 ) ) ( not ( = ?auto_40418 ?auto_40410 ) ) ( not ( = ?auto_40407 ?auto_40410 ) ) ( IS-CRATE ?auto_40407 ) ( not ( = ?auto_40403 ?auto_40406 ) ) ( not ( = ?auto_40404 ?auto_40406 ) ) ( not ( = ?auto_40418 ?auto_40406 ) ) ( not ( = ?auto_40407 ?auto_40406 ) ) ( not ( = ?auto_40410 ?auto_40406 ) ) ( not ( = ?auto_40419 ?auto_40412 ) ) ( not ( = ?auto_40408 ?auto_40419 ) ) ( not ( = ?auto_40421 ?auto_40419 ) ) ( HOIST-AT ?auto_40405 ?auto_40419 ) ( not ( = ?auto_40413 ?auto_40405 ) ) ( not ( = ?auto_40409 ?auto_40405 ) ) ( not ( = ?auto_40411 ?auto_40405 ) ) ( AVAILABLE ?auto_40405 ) ( SURFACE-AT ?auto_40407 ?auto_40419 ) ( ON ?auto_40407 ?auto_40416 ) ( CLEAR ?auto_40407 ) ( not ( = ?auto_40403 ?auto_40416 ) ) ( not ( = ?auto_40404 ?auto_40416 ) ) ( not ( = ?auto_40418 ?auto_40416 ) ) ( not ( = ?auto_40407 ?auto_40416 ) ) ( not ( = ?auto_40410 ?auto_40416 ) ) ( not ( = ?auto_40406 ?auto_40416 ) ) ( IS-CRATE ?auto_40406 ) ( not ( = ?auto_40403 ?auto_40417 ) ) ( not ( = ?auto_40404 ?auto_40417 ) ) ( not ( = ?auto_40418 ?auto_40417 ) ) ( not ( = ?auto_40407 ?auto_40417 ) ) ( not ( = ?auto_40410 ?auto_40417 ) ) ( not ( = ?auto_40406 ?auto_40417 ) ) ( not ( = ?auto_40416 ?auto_40417 ) ) ( not ( = ?auto_40422 ?auto_40412 ) ) ( not ( = ?auto_40408 ?auto_40422 ) ) ( not ( = ?auto_40421 ?auto_40422 ) ) ( not ( = ?auto_40419 ?auto_40422 ) ) ( HOIST-AT ?auto_40414 ?auto_40422 ) ( not ( = ?auto_40413 ?auto_40414 ) ) ( not ( = ?auto_40409 ?auto_40414 ) ) ( not ( = ?auto_40411 ?auto_40414 ) ) ( not ( = ?auto_40405 ?auto_40414 ) ) ( AVAILABLE ?auto_40414 ) ( SURFACE-AT ?auto_40406 ?auto_40422 ) ( ON ?auto_40406 ?auto_40420 ) ( CLEAR ?auto_40406 ) ( not ( = ?auto_40403 ?auto_40420 ) ) ( not ( = ?auto_40404 ?auto_40420 ) ) ( not ( = ?auto_40418 ?auto_40420 ) ) ( not ( = ?auto_40407 ?auto_40420 ) ) ( not ( = ?auto_40410 ?auto_40420 ) ) ( not ( = ?auto_40406 ?auto_40420 ) ) ( not ( = ?auto_40416 ?auto_40420 ) ) ( not ( = ?auto_40417 ?auto_40420 ) ) ( TRUCK-AT ?auto_40415 ?auto_40412 ) ( SURFACE-AT ?auto_40423 ?auto_40412 ) ( CLEAR ?auto_40423 ) ( LIFTING ?auto_40413 ?auto_40417 ) ( IS-CRATE ?auto_40417 ) ( not ( = ?auto_40403 ?auto_40423 ) ) ( not ( = ?auto_40404 ?auto_40423 ) ) ( not ( = ?auto_40418 ?auto_40423 ) ) ( not ( = ?auto_40407 ?auto_40423 ) ) ( not ( = ?auto_40410 ?auto_40423 ) ) ( not ( = ?auto_40406 ?auto_40423 ) ) ( not ( = ?auto_40416 ?auto_40423 ) ) ( not ( = ?auto_40417 ?auto_40423 ) ) ( not ( = ?auto_40420 ?auto_40423 ) ) )
    :subtasks
    ( ( !DROP ?auto_40413 ?auto_40417 ?auto_40423 ?auto_40412 )
      ( MAKE-ON ?auto_40403 ?auto_40404 )
      ( MAKE-ON-VERIFY ?auto_40403 ?auto_40404 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40424 - SURFACE
      ?auto_40425 - SURFACE
    )
    :vars
    (
      ?auto_40436 - HOIST
      ?auto_40432 - PLACE
      ?auto_40441 - PLACE
      ?auto_40435 - HOIST
      ?auto_40431 - SURFACE
      ?auto_40442 - SURFACE
      ?auto_40438 - PLACE
      ?auto_40426 - HOIST
      ?auto_40429 - SURFACE
      ?auto_40443 - SURFACE
      ?auto_40427 - PLACE
      ?auto_40437 - HOIST
      ?auto_40439 - SURFACE
      ?auto_40434 - SURFACE
      ?auto_40433 - PLACE
      ?auto_40428 - HOIST
      ?auto_40440 - SURFACE
      ?auto_40430 - TRUCK
      ?auto_40444 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40436 ?auto_40432 ) ( IS-CRATE ?auto_40424 ) ( not ( = ?auto_40424 ?auto_40425 ) ) ( not ( = ?auto_40441 ?auto_40432 ) ) ( HOIST-AT ?auto_40435 ?auto_40441 ) ( not ( = ?auto_40436 ?auto_40435 ) ) ( AVAILABLE ?auto_40435 ) ( SURFACE-AT ?auto_40424 ?auto_40441 ) ( ON ?auto_40424 ?auto_40431 ) ( CLEAR ?auto_40424 ) ( not ( = ?auto_40424 ?auto_40431 ) ) ( not ( = ?auto_40425 ?auto_40431 ) ) ( IS-CRATE ?auto_40425 ) ( not ( = ?auto_40424 ?auto_40442 ) ) ( not ( = ?auto_40425 ?auto_40442 ) ) ( not ( = ?auto_40431 ?auto_40442 ) ) ( not ( = ?auto_40438 ?auto_40432 ) ) ( not ( = ?auto_40441 ?auto_40438 ) ) ( HOIST-AT ?auto_40426 ?auto_40438 ) ( not ( = ?auto_40436 ?auto_40426 ) ) ( not ( = ?auto_40435 ?auto_40426 ) ) ( AVAILABLE ?auto_40426 ) ( SURFACE-AT ?auto_40425 ?auto_40438 ) ( ON ?auto_40425 ?auto_40429 ) ( CLEAR ?auto_40425 ) ( not ( = ?auto_40424 ?auto_40429 ) ) ( not ( = ?auto_40425 ?auto_40429 ) ) ( not ( = ?auto_40431 ?auto_40429 ) ) ( not ( = ?auto_40442 ?auto_40429 ) ) ( IS-CRATE ?auto_40442 ) ( not ( = ?auto_40424 ?auto_40443 ) ) ( not ( = ?auto_40425 ?auto_40443 ) ) ( not ( = ?auto_40431 ?auto_40443 ) ) ( not ( = ?auto_40442 ?auto_40443 ) ) ( not ( = ?auto_40429 ?auto_40443 ) ) ( not ( = ?auto_40427 ?auto_40432 ) ) ( not ( = ?auto_40441 ?auto_40427 ) ) ( not ( = ?auto_40438 ?auto_40427 ) ) ( HOIST-AT ?auto_40437 ?auto_40427 ) ( not ( = ?auto_40436 ?auto_40437 ) ) ( not ( = ?auto_40435 ?auto_40437 ) ) ( not ( = ?auto_40426 ?auto_40437 ) ) ( AVAILABLE ?auto_40437 ) ( SURFACE-AT ?auto_40442 ?auto_40427 ) ( ON ?auto_40442 ?auto_40439 ) ( CLEAR ?auto_40442 ) ( not ( = ?auto_40424 ?auto_40439 ) ) ( not ( = ?auto_40425 ?auto_40439 ) ) ( not ( = ?auto_40431 ?auto_40439 ) ) ( not ( = ?auto_40442 ?auto_40439 ) ) ( not ( = ?auto_40429 ?auto_40439 ) ) ( not ( = ?auto_40443 ?auto_40439 ) ) ( IS-CRATE ?auto_40443 ) ( not ( = ?auto_40424 ?auto_40434 ) ) ( not ( = ?auto_40425 ?auto_40434 ) ) ( not ( = ?auto_40431 ?auto_40434 ) ) ( not ( = ?auto_40442 ?auto_40434 ) ) ( not ( = ?auto_40429 ?auto_40434 ) ) ( not ( = ?auto_40443 ?auto_40434 ) ) ( not ( = ?auto_40439 ?auto_40434 ) ) ( not ( = ?auto_40433 ?auto_40432 ) ) ( not ( = ?auto_40441 ?auto_40433 ) ) ( not ( = ?auto_40438 ?auto_40433 ) ) ( not ( = ?auto_40427 ?auto_40433 ) ) ( HOIST-AT ?auto_40428 ?auto_40433 ) ( not ( = ?auto_40436 ?auto_40428 ) ) ( not ( = ?auto_40435 ?auto_40428 ) ) ( not ( = ?auto_40426 ?auto_40428 ) ) ( not ( = ?auto_40437 ?auto_40428 ) ) ( AVAILABLE ?auto_40428 ) ( SURFACE-AT ?auto_40443 ?auto_40433 ) ( ON ?auto_40443 ?auto_40440 ) ( CLEAR ?auto_40443 ) ( not ( = ?auto_40424 ?auto_40440 ) ) ( not ( = ?auto_40425 ?auto_40440 ) ) ( not ( = ?auto_40431 ?auto_40440 ) ) ( not ( = ?auto_40442 ?auto_40440 ) ) ( not ( = ?auto_40429 ?auto_40440 ) ) ( not ( = ?auto_40443 ?auto_40440 ) ) ( not ( = ?auto_40439 ?auto_40440 ) ) ( not ( = ?auto_40434 ?auto_40440 ) ) ( TRUCK-AT ?auto_40430 ?auto_40432 ) ( SURFACE-AT ?auto_40444 ?auto_40432 ) ( CLEAR ?auto_40444 ) ( IS-CRATE ?auto_40434 ) ( not ( = ?auto_40424 ?auto_40444 ) ) ( not ( = ?auto_40425 ?auto_40444 ) ) ( not ( = ?auto_40431 ?auto_40444 ) ) ( not ( = ?auto_40442 ?auto_40444 ) ) ( not ( = ?auto_40429 ?auto_40444 ) ) ( not ( = ?auto_40443 ?auto_40444 ) ) ( not ( = ?auto_40439 ?auto_40444 ) ) ( not ( = ?auto_40434 ?auto_40444 ) ) ( not ( = ?auto_40440 ?auto_40444 ) ) ( AVAILABLE ?auto_40436 ) ( IN ?auto_40434 ?auto_40430 ) )
    :subtasks
    ( ( !UNLOAD ?auto_40436 ?auto_40434 ?auto_40430 ?auto_40432 )
      ( MAKE-ON ?auto_40424 ?auto_40425 )
      ( MAKE-ON-VERIFY ?auto_40424 ?auto_40425 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40445 - SURFACE
      ?auto_40446 - SURFACE
    )
    :vars
    (
      ?auto_40453 - HOIST
      ?auto_40448 - PLACE
      ?auto_40461 - PLACE
      ?auto_40459 - HOIST
      ?auto_40455 - SURFACE
      ?auto_40464 - SURFACE
      ?auto_40447 - PLACE
      ?auto_40456 - HOIST
      ?auto_40462 - SURFACE
      ?auto_40465 - SURFACE
      ?auto_40452 - PLACE
      ?auto_40454 - HOIST
      ?auto_40451 - SURFACE
      ?auto_40450 - SURFACE
      ?auto_40458 - PLACE
      ?auto_40460 - HOIST
      ?auto_40457 - SURFACE
      ?auto_40463 - SURFACE
      ?auto_40449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40453 ?auto_40448 ) ( IS-CRATE ?auto_40445 ) ( not ( = ?auto_40445 ?auto_40446 ) ) ( not ( = ?auto_40461 ?auto_40448 ) ) ( HOIST-AT ?auto_40459 ?auto_40461 ) ( not ( = ?auto_40453 ?auto_40459 ) ) ( AVAILABLE ?auto_40459 ) ( SURFACE-AT ?auto_40445 ?auto_40461 ) ( ON ?auto_40445 ?auto_40455 ) ( CLEAR ?auto_40445 ) ( not ( = ?auto_40445 ?auto_40455 ) ) ( not ( = ?auto_40446 ?auto_40455 ) ) ( IS-CRATE ?auto_40446 ) ( not ( = ?auto_40445 ?auto_40464 ) ) ( not ( = ?auto_40446 ?auto_40464 ) ) ( not ( = ?auto_40455 ?auto_40464 ) ) ( not ( = ?auto_40447 ?auto_40448 ) ) ( not ( = ?auto_40461 ?auto_40447 ) ) ( HOIST-AT ?auto_40456 ?auto_40447 ) ( not ( = ?auto_40453 ?auto_40456 ) ) ( not ( = ?auto_40459 ?auto_40456 ) ) ( AVAILABLE ?auto_40456 ) ( SURFACE-AT ?auto_40446 ?auto_40447 ) ( ON ?auto_40446 ?auto_40462 ) ( CLEAR ?auto_40446 ) ( not ( = ?auto_40445 ?auto_40462 ) ) ( not ( = ?auto_40446 ?auto_40462 ) ) ( not ( = ?auto_40455 ?auto_40462 ) ) ( not ( = ?auto_40464 ?auto_40462 ) ) ( IS-CRATE ?auto_40464 ) ( not ( = ?auto_40445 ?auto_40465 ) ) ( not ( = ?auto_40446 ?auto_40465 ) ) ( not ( = ?auto_40455 ?auto_40465 ) ) ( not ( = ?auto_40464 ?auto_40465 ) ) ( not ( = ?auto_40462 ?auto_40465 ) ) ( not ( = ?auto_40452 ?auto_40448 ) ) ( not ( = ?auto_40461 ?auto_40452 ) ) ( not ( = ?auto_40447 ?auto_40452 ) ) ( HOIST-AT ?auto_40454 ?auto_40452 ) ( not ( = ?auto_40453 ?auto_40454 ) ) ( not ( = ?auto_40459 ?auto_40454 ) ) ( not ( = ?auto_40456 ?auto_40454 ) ) ( AVAILABLE ?auto_40454 ) ( SURFACE-AT ?auto_40464 ?auto_40452 ) ( ON ?auto_40464 ?auto_40451 ) ( CLEAR ?auto_40464 ) ( not ( = ?auto_40445 ?auto_40451 ) ) ( not ( = ?auto_40446 ?auto_40451 ) ) ( not ( = ?auto_40455 ?auto_40451 ) ) ( not ( = ?auto_40464 ?auto_40451 ) ) ( not ( = ?auto_40462 ?auto_40451 ) ) ( not ( = ?auto_40465 ?auto_40451 ) ) ( IS-CRATE ?auto_40465 ) ( not ( = ?auto_40445 ?auto_40450 ) ) ( not ( = ?auto_40446 ?auto_40450 ) ) ( not ( = ?auto_40455 ?auto_40450 ) ) ( not ( = ?auto_40464 ?auto_40450 ) ) ( not ( = ?auto_40462 ?auto_40450 ) ) ( not ( = ?auto_40465 ?auto_40450 ) ) ( not ( = ?auto_40451 ?auto_40450 ) ) ( not ( = ?auto_40458 ?auto_40448 ) ) ( not ( = ?auto_40461 ?auto_40458 ) ) ( not ( = ?auto_40447 ?auto_40458 ) ) ( not ( = ?auto_40452 ?auto_40458 ) ) ( HOIST-AT ?auto_40460 ?auto_40458 ) ( not ( = ?auto_40453 ?auto_40460 ) ) ( not ( = ?auto_40459 ?auto_40460 ) ) ( not ( = ?auto_40456 ?auto_40460 ) ) ( not ( = ?auto_40454 ?auto_40460 ) ) ( AVAILABLE ?auto_40460 ) ( SURFACE-AT ?auto_40465 ?auto_40458 ) ( ON ?auto_40465 ?auto_40457 ) ( CLEAR ?auto_40465 ) ( not ( = ?auto_40445 ?auto_40457 ) ) ( not ( = ?auto_40446 ?auto_40457 ) ) ( not ( = ?auto_40455 ?auto_40457 ) ) ( not ( = ?auto_40464 ?auto_40457 ) ) ( not ( = ?auto_40462 ?auto_40457 ) ) ( not ( = ?auto_40465 ?auto_40457 ) ) ( not ( = ?auto_40451 ?auto_40457 ) ) ( not ( = ?auto_40450 ?auto_40457 ) ) ( SURFACE-AT ?auto_40463 ?auto_40448 ) ( CLEAR ?auto_40463 ) ( IS-CRATE ?auto_40450 ) ( not ( = ?auto_40445 ?auto_40463 ) ) ( not ( = ?auto_40446 ?auto_40463 ) ) ( not ( = ?auto_40455 ?auto_40463 ) ) ( not ( = ?auto_40464 ?auto_40463 ) ) ( not ( = ?auto_40462 ?auto_40463 ) ) ( not ( = ?auto_40465 ?auto_40463 ) ) ( not ( = ?auto_40451 ?auto_40463 ) ) ( not ( = ?auto_40450 ?auto_40463 ) ) ( not ( = ?auto_40457 ?auto_40463 ) ) ( AVAILABLE ?auto_40453 ) ( IN ?auto_40450 ?auto_40449 ) ( TRUCK-AT ?auto_40449 ?auto_40452 ) )
    :subtasks
    ( ( !DRIVE ?auto_40449 ?auto_40452 ?auto_40448 )
      ( MAKE-ON ?auto_40445 ?auto_40446 )
      ( MAKE-ON-VERIFY ?auto_40445 ?auto_40446 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40466 - SURFACE
      ?auto_40467 - SURFACE
    )
    :vars
    (
      ?auto_40478 - HOIST
      ?auto_40483 - PLACE
      ?auto_40485 - PLACE
      ?auto_40473 - HOIST
      ?auto_40469 - SURFACE
      ?auto_40474 - SURFACE
      ?auto_40486 - PLACE
      ?auto_40470 - HOIST
      ?auto_40481 - SURFACE
      ?auto_40471 - SURFACE
      ?auto_40472 - PLACE
      ?auto_40479 - HOIST
      ?auto_40476 - SURFACE
      ?auto_40477 - SURFACE
      ?auto_40482 - PLACE
      ?auto_40475 - HOIST
      ?auto_40484 - SURFACE
      ?auto_40480 - SURFACE
      ?auto_40468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40478 ?auto_40483 ) ( IS-CRATE ?auto_40466 ) ( not ( = ?auto_40466 ?auto_40467 ) ) ( not ( = ?auto_40485 ?auto_40483 ) ) ( HOIST-AT ?auto_40473 ?auto_40485 ) ( not ( = ?auto_40478 ?auto_40473 ) ) ( AVAILABLE ?auto_40473 ) ( SURFACE-AT ?auto_40466 ?auto_40485 ) ( ON ?auto_40466 ?auto_40469 ) ( CLEAR ?auto_40466 ) ( not ( = ?auto_40466 ?auto_40469 ) ) ( not ( = ?auto_40467 ?auto_40469 ) ) ( IS-CRATE ?auto_40467 ) ( not ( = ?auto_40466 ?auto_40474 ) ) ( not ( = ?auto_40467 ?auto_40474 ) ) ( not ( = ?auto_40469 ?auto_40474 ) ) ( not ( = ?auto_40486 ?auto_40483 ) ) ( not ( = ?auto_40485 ?auto_40486 ) ) ( HOIST-AT ?auto_40470 ?auto_40486 ) ( not ( = ?auto_40478 ?auto_40470 ) ) ( not ( = ?auto_40473 ?auto_40470 ) ) ( AVAILABLE ?auto_40470 ) ( SURFACE-AT ?auto_40467 ?auto_40486 ) ( ON ?auto_40467 ?auto_40481 ) ( CLEAR ?auto_40467 ) ( not ( = ?auto_40466 ?auto_40481 ) ) ( not ( = ?auto_40467 ?auto_40481 ) ) ( not ( = ?auto_40469 ?auto_40481 ) ) ( not ( = ?auto_40474 ?auto_40481 ) ) ( IS-CRATE ?auto_40474 ) ( not ( = ?auto_40466 ?auto_40471 ) ) ( not ( = ?auto_40467 ?auto_40471 ) ) ( not ( = ?auto_40469 ?auto_40471 ) ) ( not ( = ?auto_40474 ?auto_40471 ) ) ( not ( = ?auto_40481 ?auto_40471 ) ) ( not ( = ?auto_40472 ?auto_40483 ) ) ( not ( = ?auto_40485 ?auto_40472 ) ) ( not ( = ?auto_40486 ?auto_40472 ) ) ( HOIST-AT ?auto_40479 ?auto_40472 ) ( not ( = ?auto_40478 ?auto_40479 ) ) ( not ( = ?auto_40473 ?auto_40479 ) ) ( not ( = ?auto_40470 ?auto_40479 ) ) ( SURFACE-AT ?auto_40474 ?auto_40472 ) ( ON ?auto_40474 ?auto_40476 ) ( CLEAR ?auto_40474 ) ( not ( = ?auto_40466 ?auto_40476 ) ) ( not ( = ?auto_40467 ?auto_40476 ) ) ( not ( = ?auto_40469 ?auto_40476 ) ) ( not ( = ?auto_40474 ?auto_40476 ) ) ( not ( = ?auto_40481 ?auto_40476 ) ) ( not ( = ?auto_40471 ?auto_40476 ) ) ( IS-CRATE ?auto_40471 ) ( not ( = ?auto_40466 ?auto_40477 ) ) ( not ( = ?auto_40467 ?auto_40477 ) ) ( not ( = ?auto_40469 ?auto_40477 ) ) ( not ( = ?auto_40474 ?auto_40477 ) ) ( not ( = ?auto_40481 ?auto_40477 ) ) ( not ( = ?auto_40471 ?auto_40477 ) ) ( not ( = ?auto_40476 ?auto_40477 ) ) ( not ( = ?auto_40482 ?auto_40483 ) ) ( not ( = ?auto_40485 ?auto_40482 ) ) ( not ( = ?auto_40486 ?auto_40482 ) ) ( not ( = ?auto_40472 ?auto_40482 ) ) ( HOIST-AT ?auto_40475 ?auto_40482 ) ( not ( = ?auto_40478 ?auto_40475 ) ) ( not ( = ?auto_40473 ?auto_40475 ) ) ( not ( = ?auto_40470 ?auto_40475 ) ) ( not ( = ?auto_40479 ?auto_40475 ) ) ( AVAILABLE ?auto_40475 ) ( SURFACE-AT ?auto_40471 ?auto_40482 ) ( ON ?auto_40471 ?auto_40484 ) ( CLEAR ?auto_40471 ) ( not ( = ?auto_40466 ?auto_40484 ) ) ( not ( = ?auto_40467 ?auto_40484 ) ) ( not ( = ?auto_40469 ?auto_40484 ) ) ( not ( = ?auto_40474 ?auto_40484 ) ) ( not ( = ?auto_40481 ?auto_40484 ) ) ( not ( = ?auto_40471 ?auto_40484 ) ) ( not ( = ?auto_40476 ?auto_40484 ) ) ( not ( = ?auto_40477 ?auto_40484 ) ) ( SURFACE-AT ?auto_40480 ?auto_40483 ) ( CLEAR ?auto_40480 ) ( IS-CRATE ?auto_40477 ) ( not ( = ?auto_40466 ?auto_40480 ) ) ( not ( = ?auto_40467 ?auto_40480 ) ) ( not ( = ?auto_40469 ?auto_40480 ) ) ( not ( = ?auto_40474 ?auto_40480 ) ) ( not ( = ?auto_40481 ?auto_40480 ) ) ( not ( = ?auto_40471 ?auto_40480 ) ) ( not ( = ?auto_40476 ?auto_40480 ) ) ( not ( = ?auto_40477 ?auto_40480 ) ) ( not ( = ?auto_40484 ?auto_40480 ) ) ( AVAILABLE ?auto_40478 ) ( TRUCK-AT ?auto_40468 ?auto_40472 ) ( LIFTING ?auto_40479 ?auto_40477 ) )
    :subtasks
    ( ( !LOAD ?auto_40479 ?auto_40477 ?auto_40468 ?auto_40472 )
      ( MAKE-ON ?auto_40466 ?auto_40467 )
      ( MAKE-ON-VERIFY ?auto_40466 ?auto_40467 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40487 - SURFACE
      ?auto_40488 - SURFACE
    )
    :vars
    (
      ?auto_40490 - HOIST
      ?auto_40506 - PLACE
      ?auto_40505 - PLACE
      ?auto_40493 - HOIST
      ?auto_40498 - SURFACE
      ?auto_40495 - SURFACE
      ?auto_40504 - PLACE
      ?auto_40497 - HOIST
      ?auto_40492 - SURFACE
      ?auto_40501 - SURFACE
      ?auto_40503 - PLACE
      ?auto_40494 - HOIST
      ?auto_40489 - SURFACE
      ?auto_40496 - SURFACE
      ?auto_40491 - PLACE
      ?auto_40499 - HOIST
      ?auto_40507 - SURFACE
      ?auto_40500 - SURFACE
      ?auto_40502 - TRUCK
      ?auto_40508 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40490 ?auto_40506 ) ( IS-CRATE ?auto_40487 ) ( not ( = ?auto_40487 ?auto_40488 ) ) ( not ( = ?auto_40505 ?auto_40506 ) ) ( HOIST-AT ?auto_40493 ?auto_40505 ) ( not ( = ?auto_40490 ?auto_40493 ) ) ( AVAILABLE ?auto_40493 ) ( SURFACE-AT ?auto_40487 ?auto_40505 ) ( ON ?auto_40487 ?auto_40498 ) ( CLEAR ?auto_40487 ) ( not ( = ?auto_40487 ?auto_40498 ) ) ( not ( = ?auto_40488 ?auto_40498 ) ) ( IS-CRATE ?auto_40488 ) ( not ( = ?auto_40487 ?auto_40495 ) ) ( not ( = ?auto_40488 ?auto_40495 ) ) ( not ( = ?auto_40498 ?auto_40495 ) ) ( not ( = ?auto_40504 ?auto_40506 ) ) ( not ( = ?auto_40505 ?auto_40504 ) ) ( HOIST-AT ?auto_40497 ?auto_40504 ) ( not ( = ?auto_40490 ?auto_40497 ) ) ( not ( = ?auto_40493 ?auto_40497 ) ) ( AVAILABLE ?auto_40497 ) ( SURFACE-AT ?auto_40488 ?auto_40504 ) ( ON ?auto_40488 ?auto_40492 ) ( CLEAR ?auto_40488 ) ( not ( = ?auto_40487 ?auto_40492 ) ) ( not ( = ?auto_40488 ?auto_40492 ) ) ( not ( = ?auto_40498 ?auto_40492 ) ) ( not ( = ?auto_40495 ?auto_40492 ) ) ( IS-CRATE ?auto_40495 ) ( not ( = ?auto_40487 ?auto_40501 ) ) ( not ( = ?auto_40488 ?auto_40501 ) ) ( not ( = ?auto_40498 ?auto_40501 ) ) ( not ( = ?auto_40495 ?auto_40501 ) ) ( not ( = ?auto_40492 ?auto_40501 ) ) ( not ( = ?auto_40503 ?auto_40506 ) ) ( not ( = ?auto_40505 ?auto_40503 ) ) ( not ( = ?auto_40504 ?auto_40503 ) ) ( HOIST-AT ?auto_40494 ?auto_40503 ) ( not ( = ?auto_40490 ?auto_40494 ) ) ( not ( = ?auto_40493 ?auto_40494 ) ) ( not ( = ?auto_40497 ?auto_40494 ) ) ( SURFACE-AT ?auto_40495 ?auto_40503 ) ( ON ?auto_40495 ?auto_40489 ) ( CLEAR ?auto_40495 ) ( not ( = ?auto_40487 ?auto_40489 ) ) ( not ( = ?auto_40488 ?auto_40489 ) ) ( not ( = ?auto_40498 ?auto_40489 ) ) ( not ( = ?auto_40495 ?auto_40489 ) ) ( not ( = ?auto_40492 ?auto_40489 ) ) ( not ( = ?auto_40501 ?auto_40489 ) ) ( IS-CRATE ?auto_40501 ) ( not ( = ?auto_40487 ?auto_40496 ) ) ( not ( = ?auto_40488 ?auto_40496 ) ) ( not ( = ?auto_40498 ?auto_40496 ) ) ( not ( = ?auto_40495 ?auto_40496 ) ) ( not ( = ?auto_40492 ?auto_40496 ) ) ( not ( = ?auto_40501 ?auto_40496 ) ) ( not ( = ?auto_40489 ?auto_40496 ) ) ( not ( = ?auto_40491 ?auto_40506 ) ) ( not ( = ?auto_40505 ?auto_40491 ) ) ( not ( = ?auto_40504 ?auto_40491 ) ) ( not ( = ?auto_40503 ?auto_40491 ) ) ( HOIST-AT ?auto_40499 ?auto_40491 ) ( not ( = ?auto_40490 ?auto_40499 ) ) ( not ( = ?auto_40493 ?auto_40499 ) ) ( not ( = ?auto_40497 ?auto_40499 ) ) ( not ( = ?auto_40494 ?auto_40499 ) ) ( AVAILABLE ?auto_40499 ) ( SURFACE-AT ?auto_40501 ?auto_40491 ) ( ON ?auto_40501 ?auto_40507 ) ( CLEAR ?auto_40501 ) ( not ( = ?auto_40487 ?auto_40507 ) ) ( not ( = ?auto_40488 ?auto_40507 ) ) ( not ( = ?auto_40498 ?auto_40507 ) ) ( not ( = ?auto_40495 ?auto_40507 ) ) ( not ( = ?auto_40492 ?auto_40507 ) ) ( not ( = ?auto_40501 ?auto_40507 ) ) ( not ( = ?auto_40489 ?auto_40507 ) ) ( not ( = ?auto_40496 ?auto_40507 ) ) ( SURFACE-AT ?auto_40500 ?auto_40506 ) ( CLEAR ?auto_40500 ) ( IS-CRATE ?auto_40496 ) ( not ( = ?auto_40487 ?auto_40500 ) ) ( not ( = ?auto_40488 ?auto_40500 ) ) ( not ( = ?auto_40498 ?auto_40500 ) ) ( not ( = ?auto_40495 ?auto_40500 ) ) ( not ( = ?auto_40492 ?auto_40500 ) ) ( not ( = ?auto_40501 ?auto_40500 ) ) ( not ( = ?auto_40489 ?auto_40500 ) ) ( not ( = ?auto_40496 ?auto_40500 ) ) ( not ( = ?auto_40507 ?auto_40500 ) ) ( AVAILABLE ?auto_40490 ) ( TRUCK-AT ?auto_40502 ?auto_40503 ) ( AVAILABLE ?auto_40494 ) ( SURFACE-AT ?auto_40496 ?auto_40503 ) ( ON ?auto_40496 ?auto_40508 ) ( CLEAR ?auto_40496 ) ( not ( = ?auto_40487 ?auto_40508 ) ) ( not ( = ?auto_40488 ?auto_40508 ) ) ( not ( = ?auto_40498 ?auto_40508 ) ) ( not ( = ?auto_40495 ?auto_40508 ) ) ( not ( = ?auto_40492 ?auto_40508 ) ) ( not ( = ?auto_40501 ?auto_40508 ) ) ( not ( = ?auto_40489 ?auto_40508 ) ) ( not ( = ?auto_40496 ?auto_40508 ) ) ( not ( = ?auto_40507 ?auto_40508 ) ) ( not ( = ?auto_40500 ?auto_40508 ) ) )
    :subtasks
    ( ( !LIFT ?auto_40494 ?auto_40496 ?auto_40508 ?auto_40503 )
      ( MAKE-ON ?auto_40487 ?auto_40488 )
      ( MAKE-ON-VERIFY ?auto_40487 ?auto_40488 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40509 - SURFACE
      ?auto_40510 - SURFACE
    )
    :vars
    (
      ?auto_40528 - HOIST
      ?auto_40530 - PLACE
      ?auto_40529 - PLACE
      ?auto_40516 - HOIST
      ?auto_40518 - SURFACE
      ?auto_40525 - SURFACE
      ?auto_40521 - PLACE
      ?auto_40511 - HOIST
      ?auto_40519 - SURFACE
      ?auto_40520 - SURFACE
      ?auto_40515 - PLACE
      ?auto_40527 - HOIST
      ?auto_40512 - SURFACE
      ?auto_40514 - SURFACE
      ?auto_40526 - PLACE
      ?auto_40524 - HOIST
      ?auto_40513 - SURFACE
      ?auto_40522 - SURFACE
      ?auto_40517 - SURFACE
      ?auto_40523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40528 ?auto_40530 ) ( IS-CRATE ?auto_40509 ) ( not ( = ?auto_40509 ?auto_40510 ) ) ( not ( = ?auto_40529 ?auto_40530 ) ) ( HOIST-AT ?auto_40516 ?auto_40529 ) ( not ( = ?auto_40528 ?auto_40516 ) ) ( AVAILABLE ?auto_40516 ) ( SURFACE-AT ?auto_40509 ?auto_40529 ) ( ON ?auto_40509 ?auto_40518 ) ( CLEAR ?auto_40509 ) ( not ( = ?auto_40509 ?auto_40518 ) ) ( not ( = ?auto_40510 ?auto_40518 ) ) ( IS-CRATE ?auto_40510 ) ( not ( = ?auto_40509 ?auto_40525 ) ) ( not ( = ?auto_40510 ?auto_40525 ) ) ( not ( = ?auto_40518 ?auto_40525 ) ) ( not ( = ?auto_40521 ?auto_40530 ) ) ( not ( = ?auto_40529 ?auto_40521 ) ) ( HOIST-AT ?auto_40511 ?auto_40521 ) ( not ( = ?auto_40528 ?auto_40511 ) ) ( not ( = ?auto_40516 ?auto_40511 ) ) ( AVAILABLE ?auto_40511 ) ( SURFACE-AT ?auto_40510 ?auto_40521 ) ( ON ?auto_40510 ?auto_40519 ) ( CLEAR ?auto_40510 ) ( not ( = ?auto_40509 ?auto_40519 ) ) ( not ( = ?auto_40510 ?auto_40519 ) ) ( not ( = ?auto_40518 ?auto_40519 ) ) ( not ( = ?auto_40525 ?auto_40519 ) ) ( IS-CRATE ?auto_40525 ) ( not ( = ?auto_40509 ?auto_40520 ) ) ( not ( = ?auto_40510 ?auto_40520 ) ) ( not ( = ?auto_40518 ?auto_40520 ) ) ( not ( = ?auto_40525 ?auto_40520 ) ) ( not ( = ?auto_40519 ?auto_40520 ) ) ( not ( = ?auto_40515 ?auto_40530 ) ) ( not ( = ?auto_40529 ?auto_40515 ) ) ( not ( = ?auto_40521 ?auto_40515 ) ) ( HOIST-AT ?auto_40527 ?auto_40515 ) ( not ( = ?auto_40528 ?auto_40527 ) ) ( not ( = ?auto_40516 ?auto_40527 ) ) ( not ( = ?auto_40511 ?auto_40527 ) ) ( SURFACE-AT ?auto_40525 ?auto_40515 ) ( ON ?auto_40525 ?auto_40512 ) ( CLEAR ?auto_40525 ) ( not ( = ?auto_40509 ?auto_40512 ) ) ( not ( = ?auto_40510 ?auto_40512 ) ) ( not ( = ?auto_40518 ?auto_40512 ) ) ( not ( = ?auto_40525 ?auto_40512 ) ) ( not ( = ?auto_40519 ?auto_40512 ) ) ( not ( = ?auto_40520 ?auto_40512 ) ) ( IS-CRATE ?auto_40520 ) ( not ( = ?auto_40509 ?auto_40514 ) ) ( not ( = ?auto_40510 ?auto_40514 ) ) ( not ( = ?auto_40518 ?auto_40514 ) ) ( not ( = ?auto_40525 ?auto_40514 ) ) ( not ( = ?auto_40519 ?auto_40514 ) ) ( not ( = ?auto_40520 ?auto_40514 ) ) ( not ( = ?auto_40512 ?auto_40514 ) ) ( not ( = ?auto_40526 ?auto_40530 ) ) ( not ( = ?auto_40529 ?auto_40526 ) ) ( not ( = ?auto_40521 ?auto_40526 ) ) ( not ( = ?auto_40515 ?auto_40526 ) ) ( HOIST-AT ?auto_40524 ?auto_40526 ) ( not ( = ?auto_40528 ?auto_40524 ) ) ( not ( = ?auto_40516 ?auto_40524 ) ) ( not ( = ?auto_40511 ?auto_40524 ) ) ( not ( = ?auto_40527 ?auto_40524 ) ) ( AVAILABLE ?auto_40524 ) ( SURFACE-AT ?auto_40520 ?auto_40526 ) ( ON ?auto_40520 ?auto_40513 ) ( CLEAR ?auto_40520 ) ( not ( = ?auto_40509 ?auto_40513 ) ) ( not ( = ?auto_40510 ?auto_40513 ) ) ( not ( = ?auto_40518 ?auto_40513 ) ) ( not ( = ?auto_40525 ?auto_40513 ) ) ( not ( = ?auto_40519 ?auto_40513 ) ) ( not ( = ?auto_40520 ?auto_40513 ) ) ( not ( = ?auto_40512 ?auto_40513 ) ) ( not ( = ?auto_40514 ?auto_40513 ) ) ( SURFACE-AT ?auto_40522 ?auto_40530 ) ( CLEAR ?auto_40522 ) ( IS-CRATE ?auto_40514 ) ( not ( = ?auto_40509 ?auto_40522 ) ) ( not ( = ?auto_40510 ?auto_40522 ) ) ( not ( = ?auto_40518 ?auto_40522 ) ) ( not ( = ?auto_40525 ?auto_40522 ) ) ( not ( = ?auto_40519 ?auto_40522 ) ) ( not ( = ?auto_40520 ?auto_40522 ) ) ( not ( = ?auto_40512 ?auto_40522 ) ) ( not ( = ?auto_40514 ?auto_40522 ) ) ( not ( = ?auto_40513 ?auto_40522 ) ) ( AVAILABLE ?auto_40528 ) ( AVAILABLE ?auto_40527 ) ( SURFACE-AT ?auto_40514 ?auto_40515 ) ( ON ?auto_40514 ?auto_40517 ) ( CLEAR ?auto_40514 ) ( not ( = ?auto_40509 ?auto_40517 ) ) ( not ( = ?auto_40510 ?auto_40517 ) ) ( not ( = ?auto_40518 ?auto_40517 ) ) ( not ( = ?auto_40525 ?auto_40517 ) ) ( not ( = ?auto_40519 ?auto_40517 ) ) ( not ( = ?auto_40520 ?auto_40517 ) ) ( not ( = ?auto_40512 ?auto_40517 ) ) ( not ( = ?auto_40514 ?auto_40517 ) ) ( not ( = ?auto_40513 ?auto_40517 ) ) ( not ( = ?auto_40522 ?auto_40517 ) ) ( TRUCK-AT ?auto_40523 ?auto_40530 ) )
    :subtasks
    ( ( !DRIVE ?auto_40523 ?auto_40530 ?auto_40515 )
      ( MAKE-ON ?auto_40509 ?auto_40510 )
      ( MAKE-ON-VERIFY ?auto_40509 ?auto_40510 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40533 - SURFACE
      ?auto_40534 - SURFACE
    )
    :vars
    (
      ?auto_40535 - HOIST
      ?auto_40536 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40535 ?auto_40536 ) ( SURFACE-AT ?auto_40534 ?auto_40536 ) ( CLEAR ?auto_40534 ) ( LIFTING ?auto_40535 ?auto_40533 ) ( IS-CRATE ?auto_40533 ) ( not ( = ?auto_40533 ?auto_40534 ) ) )
    :subtasks
    ( ( !DROP ?auto_40535 ?auto_40533 ?auto_40534 ?auto_40536 )
      ( MAKE-ON-VERIFY ?auto_40533 ?auto_40534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40537 - SURFACE
      ?auto_40538 - SURFACE
    )
    :vars
    (
      ?auto_40539 - HOIST
      ?auto_40540 - PLACE
      ?auto_40541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40539 ?auto_40540 ) ( SURFACE-AT ?auto_40538 ?auto_40540 ) ( CLEAR ?auto_40538 ) ( IS-CRATE ?auto_40537 ) ( not ( = ?auto_40537 ?auto_40538 ) ) ( TRUCK-AT ?auto_40541 ?auto_40540 ) ( AVAILABLE ?auto_40539 ) ( IN ?auto_40537 ?auto_40541 ) )
    :subtasks
    ( ( !UNLOAD ?auto_40539 ?auto_40537 ?auto_40541 ?auto_40540 )
      ( MAKE-ON ?auto_40537 ?auto_40538 )
      ( MAKE-ON-VERIFY ?auto_40537 ?auto_40538 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40542 - SURFACE
      ?auto_40543 - SURFACE
    )
    :vars
    (
      ?auto_40545 - HOIST
      ?auto_40544 - PLACE
      ?auto_40546 - TRUCK
      ?auto_40547 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40545 ?auto_40544 ) ( SURFACE-AT ?auto_40543 ?auto_40544 ) ( CLEAR ?auto_40543 ) ( IS-CRATE ?auto_40542 ) ( not ( = ?auto_40542 ?auto_40543 ) ) ( AVAILABLE ?auto_40545 ) ( IN ?auto_40542 ?auto_40546 ) ( TRUCK-AT ?auto_40546 ?auto_40547 ) ( not ( = ?auto_40547 ?auto_40544 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_40546 ?auto_40547 ?auto_40544 )
      ( MAKE-ON ?auto_40542 ?auto_40543 )
      ( MAKE-ON-VERIFY ?auto_40542 ?auto_40543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40548 - SURFACE
      ?auto_40549 - SURFACE
    )
    :vars
    (
      ?auto_40553 - HOIST
      ?auto_40552 - PLACE
      ?auto_40550 - TRUCK
      ?auto_40551 - PLACE
      ?auto_40554 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_40553 ?auto_40552 ) ( SURFACE-AT ?auto_40549 ?auto_40552 ) ( CLEAR ?auto_40549 ) ( IS-CRATE ?auto_40548 ) ( not ( = ?auto_40548 ?auto_40549 ) ) ( AVAILABLE ?auto_40553 ) ( TRUCK-AT ?auto_40550 ?auto_40551 ) ( not ( = ?auto_40551 ?auto_40552 ) ) ( HOIST-AT ?auto_40554 ?auto_40551 ) ( LIFTING ?auto_40554 ?auto_40548 ) ( not ( = ?auto_40553 ?auto_40554 ) ) )
    :subtasks
    ( ( !LOAD ?auto_40554 ?auto_40548 ?auto_40550 ?auto_40551 )
      ( MAKE-ON ?auto_40548 ?auto_40549 )
      ( MAKE-ON-VERIFY ?auto_40548 ?auto_40549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40555 - SURFACE
      ?auto_40556 - SURFACE
    )
    :vars
    (
      ?auto_40558 - HOIST
      ?auto_40559 - PLACE
      ?auto_40557 - TRUCK
      ?auto_40561 - PLACE
      ?auto_40560 - HOIST
      ?auto_40562 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40558 ?auto_40559 ) ( SURFACE-AT ?auto_40556 ?auto_40559 ) ( CLEAR ?auto_40556 ) ( IS-CRATE ?auto_40555 ) ( not ( = ?auto_40555 ?auto_40556 ) ) ( AVAILABLE ?auto_40558 ) ( TRUCK-AT ?auto_40557 ?auto_40561 ) ( not ( = ?auto_40561 ?auto_40559 ) ) ( HOIST-AT ?auto_40560 ?auto_40561 ) ( not ( = ?auto_40558 ?auto_40560 ) ) ( AVAILABLE ?auto_40560 ) ( SURFACE-AT ?auto_40555 ?auto_40561 ) ( ON ?auto_40555 ?auto_40562 ) ( CLEAR ?auto_40555 ) ( not ( = ?auto_40555 ?auto_40562 ) ) ( not ( = ?auto_40556 ?auto_40562 ) ) )
    :subtasks
    ( ( !LIFT ?auto_40560 ?auto_40555 ?auto_40562 ?auto_40561 )
      ( MAKE-ON ?auto_40555 ?auto_40556 )
      ( MAKE-ON-VERIFY ?auto_40555 ?auto_40556 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40563 - SURFACE
      ?auto_40564 - SURFACE
    )
    :vars
    (
      ?auto_40567 - HOIST
      ?auto_40569 - PLACE
      ?auto_40570 - PLACE
      ?auto_40565 - HOIST
      ?auto_40568 - SURFACE
      ?auto_40566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40567 ?auto_40569 ) ( SURFACE-AT ?auto_40564 ?auto_40569 ) ( CLEAR ?auto_40564 ) ( IS-CRATE ?auto_40563 ) ( not ( = ?auto_40563 ?auto_40564 ) ) ( AVAILABLE ?auto_40567 ) ( not ( = ?auto_40570 ?auto_40569 ) ) ( HOIST-AT ?auto_40565 ?auto_40570 ) ( not ( = ?auto_40567 ?auto_40565 ) ) ( AVAILABLE ?auto_40565 ) ( SURFACE-AT ?auto_40563 ?auto_40570 ) ( ON ?auto_40563 ?auto_40568 ) ( CLEAR ?auto_40563 ) ( not ( = ?auto_40563 ?auto_40568 ) ) ( not ( = ?auto_40564 ?auto_40568 ) ) ( TRUCK-AT ?auto_40566 ?auto_40569 ) )
    :subtasks
    ( ( !DRIVE ?auto_40566 ?auto_40569 ?auto_40570 )
      ( MAKE-ON ?auto_40563 ?auto_40564 )
      ( MAKE-ON-VERIFY ?auto_40563 ?auto_40564 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40571 - SURFACE
      ?auto_40572 - SURFACE
    )
    :vars
    (
      ?auto_40573 - HOIST
      ?auto_40574 - PLACE
      ?auto_40576 - PLACE
      ?auto_40577 - HOIST
      ?auto_40578 - SURFACE
      ?auto_40575 - TRUCK
      ?auto_40579 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40573 ?auto_40574 ) ( IS-CRATE ?auto_40571 ) ( not ( = ?auto_40571 ?auto_40572 ) ) ( not ( = ?auto_40576 ?auto_40574 ) ) ( HOIST-AT ?auto_40577 ?auto_40576 ) ( not ( = ?auto_40573 ?auto_40577 ) ) ( AVAILABLE ?auto_40577 ) ( SURFACE-AT ?auto_40571 ?auto_40576 ) ( ON ?auto_40571 ?auto_40578 ) ( CLEAR ?auto_40571 ) ( not ( = ?auto_40571 ?auto_40578 ) ) ( not ( = ?auto_40572 ?auto_40578 ) ) ( TRUCK-AT ?auto_40575 ?auto_40574 ) ( SURFACE-AT ?auto_40579 ?auto_40574 ) ( CLEAR ?auto_40579 ) ( LIFTING ?auto_40573 ?auto_40572 ) ( IS-CRATE ?auto_40572 ) ( not ( = ?auto_40571 ?auto_40579 ) ) ( not ( = ?auto_40572 ?auto_40579 ) ) ( not ( = ?auto_40578 ?auto_40579 ) ) )
    :subtasks
    ( ( !DROP ?auto_40573 ?auto_40572 ?auto_40579 ?auto_40574 )
      ( MAKE-ON ?auto_40571 ?auto_40572 )
      ( MAKE-ON-VERIFY ?auto_40571 ?auto_40572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40580 - SURFACE
      ?auto_40581 - SURFACE
    )
    :vars
    (
      ?auto_40587 - HOIST
      ?auto_40583 - PLACE
      ?auto_40588 - PLACE
      ?auto_40584 - HOIST
      ?auto_40585 - SURFACE
      ?auto_40582 - TRUCK
      ?auto_40586 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40587 ?auto_40583 ) ( IS-CRATE ?auto_40580 ) ( not ( = ?auto_40580 ?auto_40581 ) ) ( not ( = ?auto_40588 ?auto_40583 ) ) ( HOIST-AT ?auto_40584 ?auto_40588 ) ( not ( = ?auto_40587 ?auto_40584 ) ) ( AVAILABLE ?auto_40584 ) ( SURFACE-AT ?auto_40580 ?auto_40588 ) ( ON ?auto_40580 ?auto_40585 ) ( CLEAR ?auto_40580 ) ( not ( = ?auto_40580 ?auto_40585 ) ) ( not ( = ?auto_40581 ?auto_40585 ) ) ( TRUCK-AT ?auto_40582 ?auto_40583 ) ( SURFACE-AT ?auto_40586 ?auto_40583 ) ( CLEAR ?auto_40586 ) ( IS-CRATE ?auto_40581 ) ( not ( = ?auto_40580 ?auto_40586 ) ) ( not ( = ?auto_40581 ?auto_40586 ) ) ( not ( = ?auto_40585 ?auto_40586 ) ) ( AVAILABLE ?auto_40587 ) ( IN ?auto_40581 ?auto_40582 ) )
    :subtasks
    ( ( !UNLOAD ?auto_40587 ?auto_40581 ?auto_40582 ?auto_40583 )
      ( MAKE-ON ?auto_40580 ?auto_40581 )
      ( MAKE-ON-VERIFY ?auto_40580 ?auto_40581 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40589 - SURFACE
      ?auto_40590 - SURFACE
    )
    :vars
    (
      ?auto_40594 - HOIST
      ?auto_40595 - PLACE
      ?auto_40593 - PLACE
      ?auto_40592 - HOIST
      ?auto_40591 - SURFACE
      ?auto_40597 - SURFACE
      ?auto_40596 - TRUCK
      ?auto_40598 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40594 ?auto_40595 ) ( IS-CRATE ?auto_40589 ) ( not ( = ?auto_40589 ?auto_40590 ) ) ( not ( = ?auto_40593 ?auto_40595 ) ) ( HOIST-AT ?auto_40592 ?auto_40593 ) ( not ( = ?auto_40594 ?auto_40592 ) ) ( AVAILABLE ?auto_40592 ) ( SURFACE-AT ?auto_40589 ?auto_40593 ) ( ON ?auto_40589 ?auto_40591 ) ( CLEAR ?auto_40589 ) ( not ( = ?auto_40589 ?auto_40591 ) ) ( not ( = ?auto_40590 ?auto_40591 ) ) ( SURFACE-AT ?auto_40597 ?auto_40595 ) ( CLEAR ?auto_40597 ) ( IS-CRATE ?auto_40590 ) ( not ( = ?auto_40589 ?auto_40597 ) ) ( not ( = ?auto_40590 ?auto_40597 ) ) ( not ( = ?auto_40591 ?auto_40597 ) ) ( AVAILABLE ?auto_40594 ) ( IN ?auto_40590 ?auto_40596 ) ( TRUCK-AT ?auto_40596 ?auto_40598 ) ( not ( = ?auto_40598 ?auto_40595 ) ) ( not ( = ?auto_40593 ?auto_40598 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_40596 ?auto_40598 ?auto_40595 )
      ( MAKE-ON ?auto_40589 ?auto_40590 )
      ( MAKE-ON-VERIFY ?auto_40589 ?auto_40590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40599 - SURFACE
      ?auto_40600 - SURFACE
    )
    :vars
    (
      ?auto_40605 - HOIST
      ?auto_40603 - PLACE
      ?auto_40606 - PLACE
      ?auto_40602 - HOIST
      ?auto_40601 - SURFACE
      ?auto_40607 - SURFACE
      ?auto_40608 - TRUCK
      ?auto_40604 - PLACE
      ?auto_40609 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_40605 ?auto_40603 ) ( IS-CRATE ?auto_40599 ) ( not ( = ?auto_40599 ?auto_40600 ) ) ( not ( = ?auto_40606 ?auto_40603 ) ) ( HOIST-AT ?auto_40602 ?auto_40606 ) ( not ( = ?auto_40605 ?auto_40602 ) ) ( AVAILABLE ?auto_40602 ) ( SURFACE-AT ?auto_40599 ?auto_40606 ) ( ON ?auto_40599 ?auto_40601 ) ( CLEAR ?auto_40599 ) ( not ( = ?auto_40599 ?auto_40601 ) ) ( not ( = ?auto_40600 ?auto_40601 ) ) ( SURFACE-AT ?auto_40607 ?auto_40603 ) ( CLEAR ?auto_40607 ) ( IS-CRATE ?auto_40600 ) ( not ( = ?auto_40599 ?auto_40607 ) ) ( not ( = ?auto_40600 ?auto_40607 ) ) ( not ( = ?auto_40601 ?auto_40607 ) ) ( AVAILABLE ?auto_40605 ) ( TRUCK-AT ?auto_40608 ?auto_40604 ) ( not ( = ?auto_40604 ?auto_40603 ) ) ( not ( = ?auto_40606 ?auto_40604 ) ) ( HOIST-AT ?auto_40609 ?auto_40604 ) ( LIFTING ?auto_40609 ?auto_40600 ) ( not ( = ?auto_40605 ?auto_40609 ) ) ( not ( = ?auto_40602 ?auto_40609 ) ) )
    :subtasks
    ( ( !LOAD ?auto_40609 ?auto_40600 ?auto_40608 ?auto_40604 )
      ( MAKE-ON ?auto_40599 ?auto_40600 )
      ( MAKE-ON-VERIFY ?auto_40599 ?auto_40600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40610 - SURFACE
      ?auto_40611 - SURFACE
    )
    :vars
    (
      ?auto_40617 - HOIST
      ?auto_40616 - PLACE
      ?auto_40619 - PLACE
      ?auto_40618 - HOIST
      ?auto_40614 - SURFACE
      ?auto_40613 - SURFACE
      ?auto_40615 - TRUCK
      ?auto_40612 - PLACE
      ?auto_40620 - HOIST
      ?auto_40621 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40617 ?auto_40616 ) ( IS-CRATE ?auto_40610 ) ( not ( = ?auto_40610 ?auto_40611 ) ) ( not ( = ?auto_40619 ?auto_40616 ) ) ( HOIST-AT ?auto_40618 ?auto_40619 ) ( not ( = ?auto_40617 ?auto_40618 ) ) ( AVAILABLE ?auto_40618 ) ( SURFACE-AT ?auto_40610 ?auto_40619 ) ( ON ?auto_40610 ?auto_40614 ) ( CLEAR ?auto_40610 ) ( not ( = ?auto_40610 ?auto_40614 ) ) ( not ( = ?auto_40611 ?auto_40614 ) ) ( SURFACE-AT ?auto_40613 ?auto_40616 ) ( CLEAR ?auto_40613 ) ( IS-CRATE ?auto_40611 ) ( not ( = ?auto_40610 ?auto_40613 ) ) ( not ( = ?auto_40611 ?auto_40613 ) ) ( not ( = ?auto_40614 ?auto_40613 ) ) ( AVAILABLE ?auto_40617 ) ( TRUCK-AT ?auto_40615 ?auto_40612 ) ( not ( = ?auto_40612 ?auto_40616 ) ) ( not ( = ?auto_40619 ?auto_40612 ) ) ( HOIST-AT ?auto_40620 ?auto_40612 ) ( not ( = ?auto_40617 ?auto_40620 ) ) ( not ( = ?auto_40618 ?auto_40620 ) ) ( AVAILABLE ?auto_40620 ) ( SURFACE-AT ?auto_40611 ?auto_40612 ) ( ON ?auto_40611 ?auto_40621 ) ( CLEAR ?auto_40611 ) ( not ( = ?auto_40610 ?auto_40621 ) ) ( not ( = ?auto_40611 ?auto_40621 ) ) ( not ( = ?auto_40614 ?auto_40621 ) ) ( not ( = ?auto_40613 ?auto_40621 ) ) )
    :subtasks
    ( ( !LIFT ?auto_40620 ?auto_40611 ?auto_40621 ?auto_40612 )
      ( MAKE-ON ?auto_40610 ?auto_40611 )
      ( MAKE-ON-VERIFY ?auto_40610 ?auto_40611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40622 - SURFACE
      ?auto_40623 - SURFACE
    )
    :vars
    (
      ?auto_40626 - HOIST
      ?auto_40629 - PLACE
      ?auto_40631 - PLACE
      ?auto_40627 - HOIST
      ?auto_40633 - SURFACE
      ?auto_40632 - SURFACE
      ?auto_40624 - PLACE
      ?auto_40625 - HOIST
      ?auto_40630 - SURFACE
      ?auto_40628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40626 ?auto_40629 ) ( IS-CRATE ?auto_40622 ) ( not ( = ?auto_40622 ?auto_40623 ) ) ( not ( = ?auto_40631 ?auto_40629 ) ) ( HOIST-AT ?auto_40627 ?auto_40631 ) ( not ( = ?auto_40626 ?auto_40627 ) ) ( AVAILABLE ?auto_40627 ) ( SURFACE-AT ?auto_40622 ?auto_40631 ) ( ON ?auto_40622 ?auto_40633 ) ( CLEAR ?auto_40622 ) ( not ( = ?auto_40622 ?auto_40633 ) ) ( not ( = ?auto_40623 ?auto_40633 ) ) ( SURFACE-AT ?auto_40632 ?auto_40629 ) ( CLEAR ?auto_40632 ) ( IS-CRATE ?auto_40623 ) ( not ( = ?auto_40622 ?auto_40632 ) ) ( not ( = ?auto_40623 ?auto_40632 ) ) ( not ( = ?auto_40633 ?auto_40632 ) ) ( AVAILABLE ?auto_40626 ) ( not ( = ?auto_40624 ?auto_40629 ) ) ( not ( = ?auto_40631 ?auto_40624 ) ) ( HOIST-AT ?auto_40625 ?auto_40624 ) ( not ( = ?auto_40626 ?auto_40625 ) ) ( not ( = ?auto_40627 ?auto_40625 ) ) ( AVAILABLE ?auto_40625 ) ( SURFACE-AT ?auto_40623 ?auto_40624 ) ( ON ?auto_40623 ?auto_40630 ) ( CLEAR ?auto_40623 ) ( not ( = ?auto_40622 ?auto_40630 ) ) ( not ( = ?auto_40623 ?auto_40630 ) ) ( not ( = ?auto_40633 ?auto_40630 ) ) ( not ( = ?auto_40632 ?auto_40630 ) ) ( TRUCK-AT ?auto_40628 ?auto_40629 ) )
    :subtasks
    ( ( !DRIVE ?auto_40628 ?auto_40629 ?auto_40624 )
      ( MAKE-ON ?auto_40622 ?auto_40623 )
      ( MAKE-ON-VERIFY ?auto_40622 ?auto_40623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40634 - SURFACE
      ?auto_40635 - SURFACE
    )
    :vars
    (
      ?auto_40636 - HOIST
      ?auto_40640 - PLACE
      ?auto_40637 - PLACE
      ?auto_40638 - HOIST
      ?auto_40643 - SURFACE
      ?auto_40645 - SURFACE
      ?auto_40644 - PLACE
      ?auto_40641 - HOIST
      ?auto_40642 - SURFACE
      ?auto_40639 - TRUCK
      ?auto_40646 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40636 ?auto_40640 ) ( IS-CRATE ?auto_40634 ) ( not ( = ?auto_40634 ?auto_40635 ) ) ( not ( = ?auto_40637 ?auto_40640 ) ) ( HOIST-AT ?auto_40638 ?auto_40637 ) ( not ( = ?auto_40636 ?auto_40638 ) ) ( AVAILABLE ?auto_40638 ) ( SURFACE-AT ?auto_40634 ?auto_40637 ) ( ON ?auto_40634 ?auto_40643 ) ( CLEAR ?auto_40634 ) ( not ( = ?auto_40634 ?auto_40643 ) ) ( not ( = ?auto_40635 ?auto_40643 ) ) ( IS-CRATE ?auto_40635 ) ( not ( = ?auto_40634 ?auto_40645 ) ) ( not ( = ?auto_40635 ?auto_40645 ) ) ( not ( = ?auto_40643 ?auto_40645 ) ) ( not ( = ?auto_40644 ?auto_40640 ) ) ( not ( = ?auto_40637 ?auto_40644 ) ) ( HOIST-AT ?auto_40641 ?auto_40644 ) ( not ( = ?auto_40636 ?auto_40641 ) ) ( not ( = ?auto_40638 ?auto_40641 ) ) ( AVAILABLE ?auto_40641 ) ( SURFACE-AT ?auto_40635 ?auto_40644 ) ( ON ?auto_40635 ?auto_40642 ) ( CLEAR ?auto_40635 ) ( not ( = ?auto_40634 ?auto_40642 ) ) ( not ( = ?auto_40635 ?auto_40642 ) ) ( not ( = ?auto_40643 ?auto_40642 ) ) ( not ( = ?auto_40645 ?auto_40642 ) ) ( TRUCK-AT ?auto_40639 ?auto_40640 ) ( SURFACE-AT ?auto_40646 ?auto_40640 ) ( CLEAR ?auto_40646 ) ( LIFTING ?auto_40636 ?auto_40645 ) ( IS-CRATE ?auto_40645 ) ( not ( = ?auto_40634 ?auto_40646 ) ) ( not ( = ?auto_40635 ?auto_40646 ) ) ( not ( = ?auto_40643 ?auto_40646 ) ) ( not ( = ?auto_40645 ?auto_40646 ) ) ( not ( = ?auto_40642 ?auto_40646 ) ) )
    :subtasks
    ( ( !DROP ?auto_40636 ?auto_40645 ?auto_40646 ?auto_40640 )
      ( MAKE-ON ?auto_40634 ?auto_40635 )
      ( MAKE-ON-VERIFY ?auto_40634 ?auto_40635 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40647 - SURFACE
      ?auto_40648 - SURFACE
    )
    :vars
    (
      ?auto_40651 - HOIST
      ?auto_40650 - PLACE
      ?auto_40658 - PLACE
      ?auto_40656 - HOIST
      ?auto_40657 - SURFACE
      ?auto_40654 - SURFACE
      ?auto_40653 - PLACE
      ?auto_40652 - HOIST
      ?auto_40655 - SURFACE
      ?auto_40649 - TRUCK
      ?auto_40659 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40651 ?auto_40650 ) ( IS-CRATE ?auto_40647 ) ( not ( = ?auto_40647 ?auto_40648 ) ) ( not ( = ?auto_40658 ?auto_40650 ) ) ( HOIST-AT ?auto_40656 ?auto_40658 ) ( not ( = ?auto_40651 ?auto_40656 ) ) ( AVAILABLE ?auto_40656 ) ( SURFACE-AT ?auto_40647 ?auto_40658 ) ( ON ?auto_40647 ?auto_40657 ) ( CLEAR ?auto_40647 ) ( not ( = ?auto_40647 ?auto_40657 ) ) ( not ( = ?auto_40648 ?auto_40657 ) ) ( IS-CRATE ?auto_40648 ) ( not ( = ?auto_40647 ?auto_40654 ) ) ( not ( = ?auto_40648 ?auto_40654 ) ) ( not ( = ?auto_40657 ?auto_40654 ) ) ( not ( = ?auto_40653 ?auto_40650 ) ) ( not ( = ?auto_40658 ?auto_40653 ) ) ( HOIST-AT ?auto_40652 ?auto_40653 ) ( not ( = ?auto_40651 ?auto_40652 ) ) ( not ( = ?auto_40656 ?auto_40652 ) ) ( AVAILABLE ?auto_40652 ) ( SURFACE-AT ?auto_40648 ?auto_40653 ) ( ON ?auto_40648 ?auto_40655 ) ( CLEAR ?auto_40648 ) ( not ( = ?auto_40647 ?auto_40655 ) ) ( not ( = ?auto_40648 ?auto_40655 ) ) ( not ( = ?auto_40657 ?auto_40655 ) ) ( not ( = ?auto_40654 ?auto_40655 ) ) ( TRUCK-AT ?auto_40649 ?auto_40650 ) ( SURFACE-AT ?auto_40659 ?auto_40650 ) ( CLEAR ?auto_40659 ) ( IS-CRATE ?auto_40654 ) ( not ( = ?auto_40647 ?auto_40659 ) ) ( not ( = ?auto_40648 ?auto_40659 ) ) ( not ( = ?auto_40657 ?auto_40659 ) ) ( not ( = ?auto_40654 ?auto_40659 ) ) ( not ( = ?auto_40655 ?auto_40659 ) ) ( AVAILABLE ?auto_40651 ) ( IN ?auto_40654 ?auto_40649 ) )
    :subtasks
    ( ( !UNLOAD ?auto_40651 ?auto_40654 ?auto_40649 ?auto_40650 )
      ( MAKE-ON ?auto_40647 ?auto_40648 )
      ( MAKE-ON-VERIFY ?auto_40647 ?auto_40648 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40660 - SURFACE
      ?auto_40661 - SURFACE
    )
    :vars
    (
      ?auto_40667 - HOIST
      ?auto_40672 - PLACE
      ?auto_40669 - PLACE
      ?auto_40670 - HOIST
      ?auto_40662 - SURFACE
      ?auto_40664 - SURFACE
      ?auto_40663 - PLACE
      ?auto_40666 - HOIST
      ?auto_40671 - SURFACE
      ?auto_40665 - SURFACE
      ?auto_40668 - TRUCK
      ?auto_40673 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40667 ?auto_40672 ) ( IS-CRATE ?auto_40660 ) ( not ( = ?auto_40660 ?auto_40661 ) ) ( not ( = ?auto_40669 ?auto_40672 ) ) ( HOIST-AT ?auto_40670 ?auto_40669 ) ( not ( = ?auto_40667 ?auto_40670 ) ) ( AVAILABLE ?auto_40670 ) ( SURFACE-AT ?auto_40660 ?auto_40669 ) ( ON ?auto_40660 ?auto_40662 ) ( CLEAR ?auto_40660 ) ( not ( = ?auto_40660 ?auto_40662 ) ) ( not ( = ?auto_40661 ?auto_40662 ) ) ( IS-CRATE ?auto_40661 ) ( not ( = ?auto_40660 ?auto_40664 ) ) ( not ( = ?auto_40661 ?auto_40664 ) ) ( not ( = ?auto_40662 ?auto_40664 ) ) ( not ( = ?auto_40663 ?auto_40672 ) ) ( not ( = ?auto_40669 ?auto_40663 ) ) ( HOIST-AT ?auto_40666 ?auto_40663 ) ( not ( = ?auto_40667 ?auto_40666 ) ) ( not ( = ?auto_40670 ?auto_40666 ) ) ( AVAILABLE ?auto_40666 ) ( SURFACE-AT ?auto_40661 ?auto_40663 ) ( ON ?auto_40661 ?auto_40671 ) ( CLEAR ?auto_40661 ) ( not ( = ?auto_40660 ?auto_40671 ) ) ( not ( = ?auto_40661 ?auto_40671 ) ) ( not ( = ?auto_40662 ?auto_40671 ) ) ( not ( = ?auto_40664 ?auto_40671 ) ) ( SURFACE-AT ?auto_40665 ?auto_40672 ) ( CLEAR ?auto_40665 ) ( IS-CRATE ?auto_40664 ) ( not ( = ?auto_40660 ?auto_40665 ) ) ( not ( = ?auto_40661 ?auto_40665 ) ) ( not ( = ?auto_40662 ?auto_40665 ) ) ( not ( = ?auto_40664 ?auto_40665 ) ) ( not ( = ?auto_40671 ?auto_40665 ) ) ( AVAILABLE ?auto_40667 ) ( IN ?auto_40664 ?auto_40668 ) ( TRUCK-AT ?auto_40668 ?auto_40673 ) ( not ( = ?auto_40673 ?auto_40672 ) ) ( not ( = ?auto_40669 ?auto_40673 ) ) ( not ( = ?auto_40663 ?auto_40673 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_40668 ?auto_40673 ?auto_40672 )
      ( MAKE-ON ?auto_40660 ?auto_40661 )
      ( MAKE-ON-VERIFY ?auto_40660 ?auto_40661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40674 - SURFACE
      ?auto_40675 - SURFACE
    )
    :vars
    (
      ?auto_40686 - HOIST
      ?auto_40680 - PLACE
      ?auto_40676 - PLACE
      ?auto_40684 - HOIST
      ?auto_40687 - SURFACE
      ?auto_40678 - SURFACE
      ?auto_40682 - PLACE
      ?auto_40685 - HOIST
      ?auto_40677 - SURFACE
      ?auto_40681 - SURFACE
      ?auto_40683 - TRUCK
      ?auto_40679 - PLACE
      ?auto_40688 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_40686 ?auto_40680 ) ( IS-CRATE ?auto_40674 ) ( not ( = ?auto_40674 ?auto_40675 ) ) ( not ( = ?auto_40676 ?auto_40680 ) ) ( HOIST-AT ?auto_40684 ?auto_40676 ) ( not ( = ?auto_40686 ?auto_40684 ) ) ( AVAILABLE ?auto_40684 ) ( SURFACE-AT ?auto_40674 ?auto_40676 ) ( ON ?auto_40674 ?auto_40687 ) ( CLEAR ?auto_40674 ) ( not ( = ?auto_40674 ?auto_40687 ) ) ( not ( = ?auto_40675 ?auto_40687 ) ) ( IS-CRATE ?auto_40675 ) ( not ( = ?auto_40674 ?auto_40678 ) ) ( not ( = ?auto_40675 ?auto_40678 ) ) ( not ( = ?auto_40687 ?auto_40678 ) ) ( not ( = ?auto_40682 ?auto_40680 ) ) ( not ( = ?auto_40676 ?auto_40682 ) ) ( HOIST-AT ?auto_40685 ?auto_40682 ) ( not ( = ?auto_40686 ?auto_40685 ) ) ( not ( = ?auto_40684 ?auto_40685 ) ) ( AVAILABLE ?auto_40685 ) ( SURFACE-AT ?auto_40675 ?auto_40682 ) ( ON ?auto_40675 ?auto_40677 ) ( CLEAR ?auto_40675 ) ( not ( = ?auto_40674 ?auto_40677 ) ) ( not ( = ?auto_40675 ?auto_40677 ) ) ( not ( = ?auto_40687 ?auto_40677 ) ) ( not ( = ?auto_40678 ?auto_40677 ) ) ( SURFACE-AT ?auto_40681 ?auto_40680 ) ( CLEAR ?auto_40681 ) ( IS-CRATE ?auto_40678 ) ( not ( = ?auto_40674 ?auto_40681 ) ) ( not ( = ?auto_40675 ?auto_40681 ) ) ( not ( = ?auto_40687 ?auto_40681 ) ) ( not ( = ?auto_40678 ?auto_40681 ) ) ( not ( = ?auto_40677 ?auto_40681 ) ) ( AVAILABLE ?auto_40686 ) ( TRUCK-AT ?auto_40683 ?auto_40679 ) ( not ( = ?auto_40679 ?auto_40680 ) ) ( not ( = ?auto_40676 ?auto_40679 ) ) ( not ( = ?auto_40682 ?auto_40679 ) ) ( HOIST-AT ?auto_40688 ?auto_40679 ) ( LIFTING ?auto_40688 ?auto_40678 ) ( not ( = ?auto_40686 ?auto_40688 ) ) ( not ( = ?auto_40684 ?auto_40688 ) ) ( not ( = ?auto_40685 ?auto_40688 ) ) )
    :subtasks
    ( ( !LOAD ?auto_40688 ?auto_40678 ?auto_40683 ?auto_40679 )
      ( MAKE-ON ?auto_40674 ?auto_40675 )
      ( MAKE-ON-VERIFY ?auto_40674 ?auto_40675 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40689 - SURFACE
      ?auto_40690 - SURFACE
    )
    :vars
    (
      ?auto_40694 - HOIST
      ?auto_40693 - PLACE
      ?auto_40696 - PLACE
      ?auto_40698 - HOIST
      ?auto_40699 - SURFACE
      ?auto_40702 - SURFACE
      ?auto_40697 - PLACE
      ?auto_40701 - HOIST
      ?auto_40692 - SURFACE
      ?auto_40700 - SURFACE
      ?auto_40695 - TRUCK
      ?auto_40691 - PLACE
      ?auto_40703 - HOIST
      ?auto_40704 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40694 ?auto_40693 ) ( IS-CRATE ?auto_40689 ) ( not ( = ?auto_40689 ?auto_40690 ) ) ( not ( = ?auto_40696 ?auto_40693 ) ) ( HOIST-AT ?auto_40698 ?auto_40696 ) ( not ( = ?auto_40694 ?auto_40698 ) ) ( AVAILABLE ?auto_40698 ) ( SURFACE-AT ?auto_40689 ?auto_40696 ) ( ON ?auto_40689 ?auto_40699 ) ( CLEAR ?auto_40689 ) ( not ( = ?auto_40689 ?auto_40699 ) ) ( not ( = ?auto_40690 ?auto_40699 ) ) ( IS-CRATE ?auto_40690 ) ( not ( = ?auto_40689 ?auto_40702 ) ) ( not ( = ?auto_40690 ?auto_40702 ) ) ( not ( = ?auto_40699 ?auto_40702 ) ) ( not ( = ?auto_40697 ?auto_40693 ) ) ( not ( = ?auto_40696 ?auto_40697 ) ) ( HOIST-AT ?auto_40701 ?auto_40697 ) ( not ( = ?auto_40694 ?auto_40701 ) ) ( not ( = ?auto_40698 ?auto_40701 ) ) ( AVAILABLE ?auto_40701 ) ( SURFACE-AT ?auto_40690 ?auto_40697 ) ( ON ?auto_40690 ?auto_40692 ) ( CLEAR ?auto_40690 ) ( not ( = ?auto_40689 ?auto_40692 ) ) ( not ( = ?auto_40690 ?auto_40692 ) ) ( not ( = ?auto_40699 ?auto_40692 ) ) ( not ( = ?auto_40702 ?auto_40692 ) ) ( SURFACE-AT ?auto_40700 ?auto_40693 ) ( CLEAR ?auto_40700 ) ( IS-CRATE ?auto_40702 ) ( not ( = ?auto_40689 ?auto_40700 ) ) ( not ( = ?auto_40690 ?auto_40700 ) ) ( not ( = ?auto_40699 ?auto_40700 ) ) ( not ( = ?auto_40702 ?auto_40700 ) ) ( not ( = ?auto_40692 ?auto_40700 ) ) ( AVAILABLE ?auto_40694 ) ( TRUCK-AT ?auto_40695 ?auto_40691 ) ( not ( = ?auto_40691 ?auto_40693 ) ) ( not ( = ?auto_40696 ?auto_40691 ) ) ( not ( = ?auto_40697 ?auto_40691 ) ) ( HOIST-AT ?auto_40703 ?auto_40691 ) ( not ( = ?auto_40694 ?auto_40703 ) ) ( not ( = ?auto_40698 ?auto_40703 ) ) ( not ( = ?auto_40701 ?auto_40703 ) ) ( AVAILABLE ?auto_40703 ) ( SURFACE-AT ?auto_40702 ?auto_40691 ) ( ON ?auto_40702 ?auto_40704 ) ( CLEAR ?auto_40702 ) ( not ( = ?auto_40689 ?auto_40704 ) ) ( not ( = ?auto_40690 ?auto_40704 ) ) ( not ( = ?auto_40699 ?auto_40704 ) ) ( not ( = ?auto_40702 ?auto_40704 ) ) ( not ( = ?auto_40692 ?auto_40704 ) ) ( not ( = ?auto_40700 ?auto_40704 ) ) )
    :subtasks
    ( ( !LIFT ?auto_40703 ?auto_40702 ?auto_40704 ?auto_40691 )
      ( MAKE-ON ?auto_40689 ?auto_40690 )
      ( MAKE-ON-VERIFY ?auto_40689 ?auto_40690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40705 - SURFACE
      ?auto_40706 - SURFACE
    )
    :vars
    (
      ?auto_40718 - HOIST
      ?auto_40719 - PLACE
      ?auto_40712 - PLACE
      ?auto_40709 - HOIST
      ?auto_40714 - SURFACE
      ?auto_40716 - SURFACE
      ?auto_40708 - PLACE
      ?auto_40720 - HOIST
      ?auto_40713 - SURFACE
      ?auto_40710 - SURFACE
      ?auto_40715 - PLACE
      ?auto_40707 - HOIST
      ?auto_40717 - SURFACE
      ?auto_40711 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40718 ?auto_40719 ) ( IS-CRATE ?auto_40705 ) ( not ( = ?auto_40705 ?auto_40706 ) ) ( not ( = ?auto_40712 ?auto_40719 ) ) ( HOIST-AT ?auto_40709 ?auto_40712 ) ( not ( = ?auto_40718 ?auto_40709 ) ) ( AVAILABLE ?auto_40709 ) ( SURFACE-AT ?auto_40705 ?auto_40712 ) ( ON ?auto_40705 ?auto_40714 ) ( CLEAR ?auto_40705 ) ( not ( = ?auto_40705 ?auto_40714 ) ) ( not ( = ?auto_40706 ?auto_40714 ) ) ( IS-CRATE ?auto_40706 ) ( not ( = ?auto_40705 ?auto_40716 ) ) ( not ( = ?auto_40706 ?auto_40716 ) ) ( not ( = ?auto_40714 ?auto_40716 ) ) ( not ( = ?auto_40708 ?auto_40719 ) ) ( not ( = ?auto_40712 ?auto_40708 ) ) ( HOIST-AT ?auto_40720 ?auto_40708 ) ( not ( = ?auto_40718 ?auto_40720 ) ) ( not ( = ?auto_40709 ?auto_40720 ) ) ( AVAILABLE ?auto_40720 ) ( SURFACE-AT ?auto_40706 ?auto_40708 ) ( ON ?auto_40706 ?auto_40713 ) ( CLEAR ?auto_40706 ) ( not ( = ?auto_40705 ?auto_40713 ) ) ( not ( = ?auto_40706 ?auto_40713 ) ) ( not ( = ?auto_40714 ?auto_40713 ) ) ( not ( = ?auto_40716 ?auto_40713 ) ) ( SURFACE-AT ?auto_40710 ?auto_40719 ) ( CLEAR ?auto_40710 ) ( IS-CRATE ?auto_40716 ) ( not ( = ?auto_40705 ?auto_40710 ) ) ( not ( = ?auto_40706 ?auto_40710 ) ) ( not ( = ?auto_40714 ?auto_40710 ) ) ( not ( = ?auto_40716 ?auto_40710 ) ) ( not ( = ?auto_40713 ?auto_40710 ) ) ( AVAILABLE ?auto_40718 ) ( not ( = ?auto_40715 ?auto_40719 ) ) ( not ( = ?auto_40712 ?auto_40715 ) ) ( not ( = ?auto_40708 ?auto_40715 ) ) ( HOIST-AT ?auto_40707 ?auto_40715 ) ( not ( = ?auto_40718 ?auto_40707 ) ) ( not ( = ?auto_40709 ?auto_40707 ) ) ( not ( = ?auto_40720 ?auto_40707 ) ) ( AVAILABLE ?auto_40707 ) ( SURFACE-AT ?auto_40716 ?auto_40715 ) ( ON ?auto_40716 ?auto_40717 ) ( CLEAR ?auto_40716 ) ( not ( = ?auto_40705 ?auto_40717 ) ) ( not ( = ?auto_40706 ?auto_40717 ) ) ( not ( = ?auto_40714 ?auto_40717 ) ) ( not ( = ?auto_40716 ?auto_40717 ) ) ( not ( = ?auto_40713 ?auto_40717 ) ) ( not ( = ?auto_40710 ?auto_40717 ) ) ( TRUCK-AT ?auto_40711 ?auto_40719 ) )
    :subtasks
    ( ( !DRIVE ?auto_40711 ?auto_40719 ?auto_40715 )
      ( MAKE-ON ?auto_40705 ?auto_40706 )
      ( MAKE-ON-VERIFY ?auto_40705 ?auto_40706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40721 - SURFACE
      ?auto_40722 - SURFACE
    )
    :vars
    (
      ?auto_40723 - HOIST
      ?auto_40735 - PLACE
      ?auto_40728 - PLACE
      ?auto_40732 - HOIST
      ?auto_40734 - SURFACE
      ?auto_40727 - SURFACE
      ?auto_40733 - PLACE
      ?auto_40724 - HOIST
      ?auto_40731 - SURFACE
      ?auto_40725 - SURFACE
      ?auto_40730 - PLACE
      ?auto_40729 - HOIST
      ?auto_40736 - SURFACE
      ?auto_40726 - TRUCK
      ?auto_40737 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40723 ?auto_40735 ) ( IS-CRATE ?auto_40721 ) ( not ( = ?auto_40721 ?auto_40722 ) ) ( not ( = ?auto_40728 ?auto_40735 ) ) ( HOIST-AT ?auto_40732 ?auto_40728 ) ( not ( = ?auto_40723 ?auto_40732 ) ) ( AVAILABLE ?auto_40732 ) ( SURFACE-AT ?auto_40721 ?auto_40728 ) ( ON ?auto_40721 ?auto_40734 ) ( CLEAR ?auto_40721 ) ( not ( = ?auto_40721 ?auto_40734 ) ) ( not ( = ?auto_40722 ?auto_40734 ) ) ( IS-CRATE ?auto_40722 ) ( not ( = ?auto_40721 ?auto_40727 ) ) ( not ( = ?auto_40722 ?auto_40727 ) ) ( not ( = ?auto_40734 ?auto_40727 ) ) ( not ( = ?auto_40733 ?auto_40735 ) ) ( not ( = ?auto_40728 ?auto_40733 ) ) ( HOIST-AT ?auto_40724 ?auto_40733 ) ( not ( = ?auto_40723 ?auto_40724 ) ) ( not ( = ?auto_40732 ?auto_40724 ) ) ( AVAILABLE ?auto_40724 ) ( SURFACE-AT ?auto_40722 ?auto_40733 ) ( ON ?auto_40722 ?auto_40731 ) ( CLEAR ?auto_40722 ) ( not ( = ?auto_40721 ?auto_40731 ) ) ( not ( = ?auto_40722 ?auto_40731 ) ) ( not ( = ?auto_40734 ?auto_40731 ) ) ( not ( = ?auto_40727 ?auto_40731 ) ) ( IS-CRATE ?auto_40727 ) ( not ( = ?auto_40721 ?auto_40725 ) ) ( not ( = ?auto_40722 ?auto_40725 ) ) ( not ( = ?auto_40734 ?auto_40725 ) ) ( not ( = ?auto_40727 ?auto_40725 ) ) ( not ( = ?auto_40731 ?auto_40725 ) ) ( not ( = ?auto_40730 ?auto_40735 ) ) ( not ( = ?auto_40728 ?auto_40730 ) ) ( not ( = ?auto_40733 ?auto_40730 ) ) ( HOIST-AT ?auto_40729 ?auto_40730 ) ( not ( = ?auto_40723 ?auto_40729 ) ) ( not ( = ?auto_40732 ?auto_40729 ) ) ( not ( = ?auto_40724 ?auto_40729 ) ) ( AVAILABLE ?auto_40729 ) ( SURFACE-AT ?auto_40727 ?auto_40730 ) ( ON ?auto_40727 ?auto_40736 ) ( CLEAR ?auto_40727 ) ( not ( = ?auto_40721 ?auto_40736 ) ) ( not ( = ?auto_40722 ?auto_40736 ) ) ( not ( = ?auto_40734 ?auto_40736 ) ) ( not ( = ?auto_40727 ?auto_40736 ) ) ( not ( = ?auto_40731 ?auto_40736 ) ) ( not ( = ?auto_40725 ?auto_40736 ) ) ( TRUCK-AT ?auto_40726 ?auto_40735 ) ( SURFACE-AT ?auto_40737 ?auto_40735 ) ( CLEAR ?auto_40737 ) ( LIFTING ?auto_40723 ?auto_40725 ) ( IS-CRATE ?auto_40725 ) ( not ( = ?auto_40721 ?auto_40737 ) ) ( not ( = ?auto_40722 ?auto_40737 ) ) ( not ( = ?auto_40734 ?auto_40737 ) ) ( not ( = ?auto_40727 ?auto_40737 ) ) ( not ( = ?auto_40731 ?auto_40737 ) ) ( not ( = ?auto_40725 ?auto_40737 ) ) ( not ( = ?auto_40736 ?auto_40737 ) ) )
    :subtasks
    ( ( !DROP ?auto_40723 ?auto_40725 ?auto_40737 ?auto_40735 )
      ( MAKE-ON ?auto_40721 ?auto_40722 )
      ( MAKE-ON-VERIFY ?auto_40721 ?auto_40722 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40738 - SURFACE
      ?auto_40739 - SURFACE
    )
    :vars
    (
      ?auto_40753 - HOIST
      ?auto_40741 - PLACE
      ?auto_40747 - PLACE
      ?auto_40750 - HOIST
      ?auto_40752 - SURFACE
      ?auto_40744 - SURFACE
      ?auto_40754 - PLACE
      ?auto_40745 - HOIST
      ?auto_40751 - SURFACE
      ?auto_40742 - SURFACE
      ?auto_40748 - PLACE
      ?auto_40740 - HOIST
      ?auto_40749 - SURFACE
      ?auto_40746 - TRUCK
      ?auto_40743 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40753 ?auto_40741 ) ( IS-CRATE ?auto_40738 ) ( not ( = ?auto_40738 ?auto_40739 ) ) ( not ( = ?auto_40747 ?auto_40741 ) ) ( HOIST-AT ?auto_40750 ?auto_40747 ) ( not ( = ?auto_40753 ?auto_40750 ) ) ( AVAILABLE ?auto_40750 ) ( SURFACE-AT ?auto_40738 ?auto_40747 ) ( ON ?auto_40738 ?auto_40752 ) ( CLEAR ?auto_40738 ) ( not ( = ?auto_40738 ?auto_40752 ) ) ( not ( = ?auto_40739 ?auto_40752 ) ) ( IS-CRATE ?auto_40739 ) ( not ( = ?auto_40738 ?auto_40744 ) ) ( not ( = ?auto_40739 ?auto_40744 ) ) ( not ( = ?auto_40752 ?auto_40744 ) ) ( not ( = ?auto_40754 ?auto_40741 ) ) ( not ( = ?auto_40747 ?auto_40754 ) ) ( HOIST-AT ?auto_40745 ?auto_40754 ) ( not ( = ?auto_40753 ?auto_40745 ) ) ( not ( = ?auto_40750 ?auto_40745 ) ) ( AVAILABLE ?auto_40745 ) ( SURFACE-AT ?auto_40739 ?auto_40754 ) ( ON ?auto_40739 ?auto_40751 ) ( CLEAR ?auto_40739 ) ( not ( = ?auto_40738 ?auto_40751 ) ) ( not ( = ?auto_40739 ?auto_40751 ) ) ( not ( = ?auto_40752 ?auto_40751 ) ) ( not ( = ?auto_40744 ?auto_40751 ) ) ( IS-CRATE ?auto_40744 ) ( not ( = ?auto_40738 ?auto_40742 ) ) ( not ( = ?auto_40739 ?auto_40742 ) ) ( not ( = ?auto_40752 ?auto_40742 ) ) ( not ( = ?auto_40744 ?auto_40742 ) ) ( not ( = ?auto_40751 ?auto_40742 ) ) ( not ( = ?auto_40748 ?auto_40741 ) ) ( not ( = ?auto_40747 ?auto_40748 ) ) ( not ( = ?auto_40754 ?auto_40748 ) ) ( HOIST-AT ?auto_40740 ?auto_40748 ) ( not ( = ?auto_40753 ?auto_40740 ) ) ( not ( = ?auto_40750 ?auto_40740 ) ) ( not ( = ?auto_40745 ?auto_40740 ) ) ( AVAILABLE ?auto_40740 ) ( SURFACE-AT ?auto_40744 ?auto_40748 ) ( ON ?auto_40744 ?auto_40749 ) ( CLEAR ?auto_40744 ) ( not ( = ?auto_40738 ?auto_40749 ) ) ( not ( = ?auto_40739 ?auto_40749 ) ) ( not ( = ?auto_40752 ?auto_40749 ) ) ( not ( = ?auto_40744 ?auto_40749 ) ) ( not ( = ?auto_40751 ?auto_40749 ) ) ( not ( = ?auto_40742 ?auto_40749 ) ) ( TRUCK-AT ?auto_40746 ?auto_40741 ) ( SURFACE-AT ?auto_40743 ?auto_40741 ) ( CLEAR ?auto_40743 ) ( IS-CRATE ?auto_40742 ) ( not ( = ?auto_40738 ?auto_40743 ) ) ( not ( = ?auto_40739 ?auto_40743 ) ) ( not ( = ?auto_40752 ?auto_40743 ) ) ( not ( = ?auto_40744 ?auto_40743 ) ) ( not ( = ?auto_40751 ?auto_40743 ) ) ( not ( = ?auto_40742 ?auto_40743 ) ) ( not ( = ?auto_40749 ?auto_40743 ) ) ( AVAILABLE ?auto_40753 ) ( IN ?auto_40742 ?auto_40746 ) )
    :subtasks
    ( ( !UNLOAD ?auto_40753 ?auto_40742 ?auto_40746 ?auto_40741 )
      ( MAKE-ON ?auto_40738 ?auto_40739 )
      ( MAKE-ON-VERIFY ?auto_40738 ?auto_40739 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40755 - SURFACE
      ?auto_40756 - SURFACE
    )
    :vars
    (
      ?auto_40768 - HOIST
      ?auto_40771 - PLACE
      ?auto_40764 - PLACE
      ?auto_40757 - HOIST
      ?auto_40758 - SURFACE
      ?auto_40770 - SURFACE
      ?auto_40766 - PLACE
      ?auto_40763 - HOIST
      ?auto_40767 - SURFACE
      ?auto_40762 - SURFACE
      ?auto_40759 - PLACE
      ?auto_40760 - HOIST
      ?auto_40765 - SURFACE
      ?auto_40761 - SURFACE
      ?auto_40769 - TRUCK
      ?auto_40772 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40768 ?auto_40771 ) ( IS-CRATE ?auto_40755 ) ( not ( = ?auto_40755 ?auto_40756 ) ) ( not ( = ?auto_40764 ?auto_40771 ) ) ( HOIST-AT ?auto_40757 ?auto_40764 ) ( not ( = ?auto_40768 ?auto_40757 ) ) ( AVAILABLE ?auto_40757 ) ( SURFACE-AT ?auto_40755 ?auto_40764 ) ( ON ?auto_40755 ?auto_40758 ) ( CLEAR ?auto_40755 ) ( not ( = ?auto_40755 ?auto_40758 ) ) ( not ( = ?auto_40756 ?auto_40758 ) ) ( IS-CRATE ?auto_40756 ) ( not ( = ?auto_40755 ?auto_40770 ) ) ( not ( = ?auto_40756 ?auto_40770 ) ) ( not ( = ?auto_40758 ?auto_40770 ) ) ( not ( = ?auto_40766 ?auto_40771 ) ) ( not ( = ?auto_40764 ?auto_40766 ) ) ( HOIST-AT ?auto_40763 ?auto_40766 ) ( not ( = ?auto_40768 ?auto_40763 ) ) ( not ( = ?auto_40757 ?auto_40763 ) ) ( AVAILABLE ?auto_40763 ) ( SURFACE-AT ?auto_40756 ?auto_40766 ) ( ON ?auto_40756 ?auto_40767 ) ( CLEAR ?auto_40756 ) ( not ( = ?auto_40755 ?auto_40767 ) ) ( not ( = ?auto_40756 ?auto_40767 ) ) ( not ( = ?auto_40758 ?auto_40767 ) ) ( not ( = ?auto_40770 ?auto_40767 ) ) ( IS-CRATE ?auto_40770 ) ( not ( = ?auto_40755 ?auto_40762 ) ) ( not ( = ?auto_40756 ?auto_40762 ) ) ( not ( = ?auto_40758 ?auto_40762 ) ) ( not ( = ?auto_40770 ?auto_40762 ) ) ( not ( = ?auto_40767 ?auto_40762 ) ) ( not ( = ?auto_40759 ?auto_40771 ) ) ( not ( = ?auto_40764 ?auto_40759 ) ) ( not ( = ?auto_40766 ?auto_40759 ) ) ( HOIST-AT ?auto_40760 ?auto_40759 ) ( not ( = ?auto_40768 ?auto_40760 ) ) ( not ( = ?auto_40757 ?auto_40760 ) ) ( not ( = ?auto_40763 ?auto_40760 ) ) ( AVAILABLE ?auto_40760 ) ( SURFACE-AT ?auto_40770 ?auto_40759 ) ( ON ?auto_40770 ?auto_40765 ) ( CLEAR ?auto_40770 ) ( not ( = ?auto_40755 ?auto_40765 ) ) ( not ( = ?auto_40756 ?auto_40765 ) ) ( not ( = ?auto_40758 ?auto_40765 ) ) ( not ( = ?auto_40770 ?auto_40765 ) ) ( not ( = ?auto_40767 ?auto_40765 ) ) ( not ( = ?auto_40762 ?auto_40765 ) ) ( SURFACE-AT ?auto_40761 ?auto_40771 ) ( CLEAR ?auto_40761 ) ( IS-CRATE ?auto_40762 ) ( not ( = ?auto_40755 ?auto_40761 ) ) ( not ( = ?auto_40756 ?auto_40761 ) ) ( not ( = ?auto_40758 ?auto_40761 ) ) ( not ( = ?auto_40770 ?auto_40761 ) ) ( not ( = ?auto_40767 ?auto_40761 ) ) ( not ( = ?auto_40762 ?auto_40761 ) ) ( not ( = ?auto_40765 ?auto_40761 ) ) ( AVAILABLE ?auto_40768 ) ( IN ?auto_40762 ?auto_40769 ) ( TRUCK-AT ?auto_40769 ?auto_40772 ) ( not ( = ?auto_40772 ?auto_40771 ) ) ( not ( = ?auto_40764 ?auto_40772 ) ) ( not ( = ?auto_40766 ?auto_40772 ) ) ( not ( = ?auto_40759 ?auto_40772 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_40769 ?auto_40772 ?auto_40771 )
      ( MAKE-ON ?auto_40755 ?auto_40756 )
      ( MAKE-ON-VERIFY ?auto_40755 ?auto_40756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40773 - SURFACE
      ?auto_40774 - SURFACE
    )
    :vars
    (
      ?auto_40786 - HOIST
      ?auto_40780 - PLACE
      ?auto_40788 - PLACE
      ?auto_40785 - HOIST
      ?auto_40776 - SURFACE
      ?auto_40787 - SURFACE
      ?auto_40781 - PLACE
      ?auto_40778 - HOIST
      ?auto_40775 - SURFACE
      ?auto_40789 - SURFACE
      ?auto_40790 - PLACE
      ?auto_40783 - HOIST
      ?auto_40779 - SURFACE
      ?auto_40784 - SURFACE
      ?auto_40777 - TRUCK
      ?auto_40782 - PLACE
      ?auto_40791 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_40786 ?auto_40780 ) ( IS-CRATE ?auto_40773 ) ( not ( = ?auto_40773 ?auto_40774 ) ) ( not ( = ?auto_40788 ?auto_40780 ) ) ( HOIST-AT ?auto_40785 ?auto_40788 ) ( not ( = ?auto_40786 ?auto_40785 ) ) ( AVAILABLE ?auto_40785 ) ( SURFACE-AT ?auto_40773 ?auto_40788 ) ( ON ?auto_40773 ?auto_40776 ) ( CLEAR ?auto_40773 ) ( not ( = ?auto_40773 ?auto_40776 ) ) ( not ( = ?auto_40774 ?auto_40776 ) ) ( IS-CRATE ?auto_40774 ) ( not ( = ?auto_40773 ?auto_40787 ) ) ( not ( = ?auto_40774 ?auto_40787 ) ) ( not ( = ?auto_40776 ?auto_40787 ) ) ( not ( = ?auto_40781 ?auto_40780 ) ) ( not ( = ?auto_40788 ?auto_40781 ) ) ( HOIST-AT ?auto_40778 ?auto_40781 ) ( not ( = ?auto_40786 ?auto_40778 ) ) ( not ( = ?auto_40785 ?auto_40778 ) ) ( AVAILABLE ?auto_40778 ) ( SURFACE-AT ?auto_40774 ?auto_40781 ) ( ON ?auto_40774 ?auto_40775 ) ( CLEAR ?auto_40774 ) ( not ( = ?auto_40773 ?auto_40775 ) ) ( not ( = ?auto_40774 ?auto_40775 ) ) ( not ( = ?auto_40776 ?auto_40775 ) ) ( not ( = ?auto_40787 ?auto_40775 ) ) ( IS-CRATE ?auto_40787 ) ( not ( = ?auto_40773 ?auto_40789 ) ) ( not ( = ?auto_40774 ?auto_40789 ) ) ( not ( = ?auto_40776 ?auto_40789 ) ) ( not ( = ?auto_40787 ?auto_40789 ) ) ( not ( = ?auto_40775 ?auto_40789 ) ) ( not ( = ?auto_40790 ?auto_40780 ) ) ( not ( = ?auto_40788 ?auto_40790 ) ) ( not ( = ?auto_40781 ?auto_40790 ) ) ( HOIST-AT ?auto_40783 ?auto_40790 ) ( not ( = ?auto_40786 ?auto_40783 ) ) ( not ( = ?auto_40785 ?auto_40783 ) ) ( not ( = ?auto_40778 ?auto_40783 ) ) ( AVAILABLE ?auto_40783 ) ( SURFACE-AT ?auto_40787 ?auto_40790 ) ( ON ?auto_40787 ?auto_40779 ) ( CLEAR ?auto_40787 ) ( not ( = ?auto_40773 ?auto_40779 ) ) ( not ( = ?auto_40774 ?auto_40779 ) ) ( not ( = ?auto_40776 ?auto_40779 ) ) ( not ( = ?auto_40787 ?auto_40779 ) ) ( not ( = ?auto_40775 ?auto_40779 ) ) ( not ( = ?auto_40789 ?auto_40779 ) ) ( SURFACE-AT ?auto_40784 ?auto_40780 ) ( CLEAR ?auto_40784 ) ( IS-CRATE ?auto_40789 ) ( not ( = ?auto_40773 ?auto_40784 ) ) ( not ( = ?auto_40774 ?auto_40784 ) ) ( not ( = ?auto_40776 ?auto_40784 ) ) ( not ( = ?auto_40787 ?auto_40784 ) ) ( not ( = ?auto_40775 ?auto_40784 ) ) ( not ( = ?auto_40789 ?auto_40784 ) ) ( not ( = ?auto_40779 ?auto_40784 ) ) ( AVAILABLE ?auto_40786 ) ( TRUCK-AT ?auto_40777 ?auto_40782 ) ( not ( = ?auto_40782 ?auto_40780 ) ) ( not ( = ?auto_40788 ?auto_40782 ) ) ( not ( = ?auto_40781 ?auto_40782 ) ) ( not ( = ?auto_40790 ?auto_40782 ) ) ( HOIST-AT ?auto_40791 ?auto_40782 ) ( LIFTING ?auto_40791 ?auto_40789 ) ( not ( = ?auto_40786 ?auto_40791 ) ) ( not ( = ?auto_40785 ?auto_40791 ) ) ( not ( = ?auto_40778 ?auto_40791 ) ) ( not ( = ?auto_40783 ?auto_40791 ) ) )
    :subtasks
    ( ( !LOAD ?auto_40791 ?auto_40789 ?auto_40777 ?auto_40782 )
      ( MAKE-ON ?auto_40773 ?auto_40774 )
      ( MAKE-ON-VERIFY ?auto_40773 ?auto_40774 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40792 - SURFACE
      ?auto_40793 - SURFACE
    )
    :vars
    (
      ?auto_40803 - HOIST
      ?auto_40806 - PLACE
      ?auto_40798 - PLACE
      ?auto_40802 - HOIST
      ?auto_40794 - SURFACE
      ?auto_40795 - SURFACE
      ?auto_40800 - PLACE
      ?auto_40810 - HOIST
      ?auto_40796 - SURFACE
      ?auto_40797 - SURFACE
      ?auto_40804 - PLACE
      ?auto_40805 - HOIST
      ?auto_40799 - SURFACE
      ?auto_40808 - SURFACE
      ?auto_40801 - TRUCK
      ?auto_40807 - PLACE
      ?auto_40809 - HOIST
      ?auto_40811 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40803 ?auto_40806 ) ( IS-CRATE ?auto_40792 ) ( not ( = ?auto_40792 ?auto_40793 ) ) ( not ( = ?auto_40798 ?auto_40806 ) ) ( HOIST-AT ?auto_40802 ?auto_40798 ) ( not ( = ?auto_40803 ?auto_40802 ) ) ( AVAILABLE ?auto_40802 ) ( SURFACE-AT ?auto_40792 ?auto_40798 ) ( ON ?auto_40792 ?auto_40794 ) ( CLEAR ?auto_40792 ) ( not ( = ?auto_40792 ?auto_40794 ) ) ( not ( = ?auto_40793 ?auto_40794 ) ) ( IS-CRATE ?auto_40793 ) ( not ( = ?auto_40792 ?auto_40795 ) ) ( not ( = ?auto_40793 ?auto_40795 ) ) ( not ( = ?auto_40794 ?auto_40795 ) ) ( not ( = ?auto_40800 ?auto_40806 ) ) ( not ( = ?auto_40798 ?auto_40800 ) ) ( HOIST-AT ?auto_40810 ?auto_40800 ) ( not ( = ?auto_40803 ?auto_40810 ) ) ( not ( = ?auto_40802 ?auto_40810 ) ) ( AVAILABLE ?auto_40810 ) ( SURFACE-AT ?auto_40793 ?auto_40800 ) ( ON ?auto_40793 ?auto_40796 ) ( CLEAR ?auto_40793 ) ( not ( = ?auto_40792 ?auto_40796 ) ) ( not ( = ?auto_40793 ?auto_40796 ) ) ( not ( = ?auto_40794 ?auto_40796 ) ) ( not ( = ?auto_40795 ?auto_40796 ) ) ( IS-CRATE ?auto_40795 ) ( not ( = ?auto_40792 ?auto_40797 ) ) ( not ( = ?auto_40793 ?auto_40797 ) ) ( not ( = ?auto_40794 ?auto_40797 ) ) ( not ( = ?auto_40795 ?auto_40797 ) ) ( not ( = ?auto_40796 ?auto_40797 ) ) ( not ( = ?auto_40804 ?auto_40806 ) ) ( not ( = ?auto_40798 ?auto_40804 ) ) ( not ( = ?auto_40800 ?auto_40804 ) ) ( HOIST-AT ?auto_40805 ?auto_40804 ) ( not ( = ?auto_40803 ?auto_40805 ) ) ( not ( = ?auto_40802 ?auto_40805 ) ) ( not ( = ?auto_40810 ?auto_40805 ) ) ( AVAILABLE ?auto_40805 ) ( SURFACE-AT ?auto_40795 ?auto_40804 ) ( ON ?auto_40795 ?auto_40799 ) ( CLEAR ?auto_40795 ) ( not ( = ?auto_40792 ?auto_40799 ) ) ( not ( = ?auto_40793 ?auto_40799 ) ) ( not ( = ?auto_40794 ?auto_40799 ) ) ( not ( = ?auto_40795 ?auto_40799 ) ) ( not ( = ?auto_40796 ?auto_40799 ) ) ( not ( = ?auto_40797 ?auto_40799 ) ) ( SURFACE-AT ?auto_40808 ?auto_40806 ) ( CLEAR ?auto_40808 ) ( IS-CRATE ?auto_40797 ) ( not ( = ?auto_40792 ?auto_40808 ) ) ( not ( = ?auto_40793 ?auto_40808 ) ) ( not ( = ?auto_40794 ?auto_40808 ) ) ( not ( = ?auto_40795 ?auto_40808 ) ) ( not ( = ?auto_40796 ?auto_40808 ) ) ( not ( = ?auto_40797 ?auto_40808 ) ) ( not ( = ?auto_40799 ?auto_40808 ) ) ( AVAILABLE ?auto_40803 ) ( TRUCK-AT ?auto_40801 ?auto_40807 ) ( not ( = ?auto_40807 ?auto_40806 ) ) ( not ( = ?auto_40798 ?auto_40807 ) ) ( not ( = ?auto_40800 ?auto_40807 ) ) ( not ( = ?auto_40804 ?auto_40807 ) ) ( HOIST-AT ?auto_40809 ?auto_40807 ) ( not ( = ?auto_40803 ?auto_40809 ) ) ( not ( = ?auto_40802 ?auto_40809 ) ) ( not ( = ?auto_40810 ?auto_40809 ) ) ( not ( = ?auto_40805 ?auto_40809 ) ) ( AVAILABLE ?auto_40809 ) ( SURFACE-AT ?auto_40797 ?auto_40807 ) ( ON ?auto_40797 ?auto_40811 ) ( CLEAR ?auto_40797 ) ( not ( = ?auto_40792 ?auto_40811 ) ) ( not ( = ?auto_40793 ?auto_40811 ) ) ( not ( = ?auto_40794 ?auto_40811 ) ) ( not ( = ?auto_40795 ?auto_40811 ) ) ( not ( = ?auto_40796 ?auto_40811 ) ) ( not ( = ?auto_40797 ?auto_40811 ) ) ( not ( = ?auto_40799 ?auto_40811 ) ) ( not ( = ?auto_40808 ?auto_40811 ) ) )
    :subtasks
    ( ( !LIFT ?auto_40809 ?auto_40797 ?auto_40811 ?auto_40807 )
      ( MAKE-ON ?auto_40792 ?auto_40793 )
      ( MAKE-ON-VERIFY ?auto_40792 ?auto_40793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40812 - SURFACE
      ?auto_40813 - SURFACE
    )
    :vars
    (
      ?auto_40830 - HOIST
      ?auto_40814 - PLACE
      ?auto_40825 - PLACE
      ?auto_40831 - HOIST
      ?auto_40827 - SURFACE
      ?auto_40817 - SURFACE
      ?auto_40822 - PLACE
      ?auto_40819 - HOIST
      ?auto_40823 - SURFACE
      ?auto_40824 - SURFACE
      ?auto_40815 - PLACE
      ?auto_40816 - HOIST
      ?auto_40828 - SURFACE
      ?auto_40818 - SURFACE
      ?auto_40820 - PLACE
      ?auto_40826 - HOIST
      ?auto_40821 - SURFACE
      ?auto_40829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40830 ?auto_40814 ) ( IS-CRATE ?auto_40812 ) ( not ( = ?auto_40812 ?auto_40813 ) ) ( not ( = ?auto_40825 ?auto_40814 ) ) ( HOIST-AT ?auto_40831 ?auto_40825 ) ( not ( = ?auto_40830 ?auto_40831 ) ) ( AVAILABLE ?auto_40831 ) ( SURFACE-AT ?auto_40812 ?auto_40825 ) ( ON ?auto_40812 ?auto_40827 ) ( CLEAR ?auto_40812 ) ( not ( = ?auto_40812 ?auto_40827 ) ) ( not ( = ?auto_40813 ?auto_40827 ) ) ( IS-CRATE ?auto_40813 ) ( not ( = ?auto_40812 ?auto_40817 ) ) ( not ( = ?auto_40813 ?auto_40817 ) ) ( not ( = ?auto_40827 ?auto_40817 ) ) ( not ( = ?auto_40822 ?auto_40814 ) ) ( not ( = ?auto_40825 ?auto_40822 ) ) ( HOIST-AT ?auto_40819 ?auto_40822 ) ( not ( = ?auto_40830 ?auto_40819 ) ) ( not ( = ?auto_40831 ?auto_40819 ) ) ( AVAILABLE ?auto_40819 ) ( SURFACE-AT ?auto_40813 ?auto_40822 ) ( ON ?auto_40813 ?auto_40823 ) ( CLEAR ?auto_40813 ) ( not ( = ?auto_40812 ?auto_40823 ) ) ( not ( = ?auto_40813 ?auto_40823 ) ) ( not ( = ?auto_40827 ?auto_40823 ) ) ( not ( = ?auto_40817 ?auto_40823 ) ) ( IS-CRATE ?auto_40817 ) ( not ( = ?auto_40812 ?auto_40824 ) ) ( not ( = ?auto_40813 ?auto_40824 ) ) ( not ( = ?auto_40827 ?auto_40824 ) ) ( not ( = ?auto_40817 ?auto_40824 ) ) ( not ( = ?auto_40823 ?auto_40824 ) ) ( not ( = ?auto_40815 ?auto_40814 ) ) ( not ( = ?auto_40825 ?auto_40815 ) ) ( not ( = ?auto_40822 ?auto_40815 ) ) ( HOIST-AT ?auto_40816 ?auto_40815 ) ( not ( = ?auto_40830 ?auto_40816 ) ) ( not ( = ?auto_40831 ?auto_40816 ) ) ( not ( = ?auto_40819 ?auto_40816 ) ) ( AVAILABLE ?auto_40816 ) ( SURFACE-AT ?auto_40817 ?auto_40815 ) ( ON ?auto_40817 ?auto_40828 ) ( CLEAR ?auto_40817 ) ( not ( = ?auto_40812 ?auto_40828 ) ) ( not ( = ?auto_40813 ?auto_40828 ) ) ( not ( = ?auto_40827 ?auto_40828 ) ) ( not ( = ?auto_40817 ?auto_40828 ) ) ( not ( = ?auto_40823 ?auto_40828 ) ) ( not ( = ?auto_40824 ?auto_40828 ) ) ( SURFACE-AT ?auto_40818 ?auto_40814 ) ( CLEAR ?auto_40818 ) ( IS-CRATE ?auto_40824 ) ( not ( = ?auto_40812 ?auto_40818 ) ) ( not ( = ?auto_40813 ?auto_40818 ) ) ( not ( = ?auto_40827 ?auto_40818 ) ) ( not ( = ?auto_40817 ?auto_40818 ) ) ( not ( = ?auto_40823 ?auto_40818 ) ) ( not ( = ?auto_40824 ?auto_40818 ) ) ( not ( = ?auto_40828 ?auto_40818 ) ) ( AVAILABLE ?auto_40830 ) ( not ( = ?auto_40820 ?auto_40814 ) ) ( not ( = ?auto_40825 ?auto_40820 ) ) ( not ( = ?auto_40822 ?auto_40820 ) ) ( not ( = ?auto_40815 ?auto_40820 ) ) ( HOIST-AT ?auto_40826 ?auto_40820 ) ( not ( = ?auto_40830 ?auto_40826 ) ) ( not ( = ?auto_40831 ?auto_40826 ) ) ( not ( = ?auto_40819 ?auto_40826 ) ) ( not ( = ?auto_40816 ?auto_40826 ) ) ( AVAILABLE ?auto_40826 ) ( SURFACE-AT ?auto_40824 ?auto_40820 ) ( ON ?auto_40824 ?auto_40821 ) ( CLEAR ?auto_40824 ) ( not ( = ?auto_40812 ?auto_40821 ) ) ( not ( = ?auto_40813 ?auto_40821 ) ) ( not ( = ?auto_40827 ?auto_40821 ) ) ( not ( = ?auto_40817 ?auto_40821 ) ) ( not ( = ?auto_40823 ?auto_40821 ) ) ( not ( = ?auto_40824 ?auto_40821 ) ) ( not ( = ?auto_40828 ?auto_40821 ) ) ( not ( = ?auto_40818 ?auto_40821 ) ) ( TRUCK-AT ?auto_40829 ?auto_40814 ) )
    :subtasks
    ( ( !DRIVE ?auto_40829 ?auto_40814 ?auto_40820 )
      ( MAKE-ON ?auto_40812 ?auto_40813 )
      ( MAKE-ON-VERIFY ?auto_40812 ?auto_40813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40832 - SURFACE
      ?auto_40833 - SURFACE
    )
    :vars
    (
      ?auto_40844 - HOIST
      ?auto_40850 - PLACE
      ?auto_40848 - PLACE
      ?auto_40834 - HOIST
      ?auto_40837 - SURFACE
      ?auto_40835 - SURFACE
      ?auto_40839 - PLACE
      ?auto_40845 - HOIST
      ?auto_40843 - SURFACE
      ?auto_40841 - SURFACE
      ?auto_40849 - PLACE
      ?auto_40836 - HOIST
      ?auto_40842 - SURFACE
      ?auto_40851 - SURFACE
      ?auto_40838 - PLACE
      ?auto_40846 - HOIST
      ?auto_40847 - SURFACE
      ?auto_40840 - TRUCK
      ?auto_40852 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40844 ?auto_40850 ) ( IS-CRATE ?auto_40832 ) ( not ( = ?auto_40832 ?auto_40833 ) ) ( not ( = ?auto_40848 ?auto_40850 ) ) ( HOIST-AT ?auto_40834 ?auto_40848 ) ( not ( = ?auto_40844 ?auto_40834 ) ) ( AVAILABLE ?auto_40834 ) ( SURFACE-AT ?auto_40832 ?auto_40848 ) ( ON ?auto_40832 ?auto_40837 ) ( CLEAR ?auto_40832 ) ( not ( = ?auto_40832 ?auto_40837 ) ) ( not ( = ?auto_40833 ?auto_40837 ) ) ( IS-CRATE ?auto_40833 ) ( not ( = ?auto_40832 ?auto_40835 ) ) ( not ( = ?auto_40833 ?auto_40835 ) ) ( not ( = ?auto_40837 ?auto_40835 ) ) ( not ( = ?auto_40839 ?auto_40850 ) ) ( not ( = ?auto_40848 ?auto_40839 ) ) ( HOIST-AT ?auto_40845 ?auto_40839 ) ( not ( = ?auto_40844 ?auto_40845 ) ) ( not ( = ?auto_40834 ?auto_40845 ) ) ( AVAILABLE ?auto_40845 ) ( SURFACE-AT ?auto_40833 ?auto_40839 ) ( ON ?auto_40833 ?auto_40843 ) ( CLEAR ?auto_40833 ) ( not ( = ?auto_40832 ?auto_40843 ) ) ( not ( = ?auto_40833 ?auto_40843 ) ) ( not ( = ?auto_40837 ?auto_40843 ) ) ( not ( = ?auto_40835 ?auto_40843 ) ) ( IS-CRATE ?auto_40835 ) ( not ( = ?auto_40832 ?auto_40841 ) ) ( not ( = ?auto_40833 ?auto_40841 ) ) ( not ( = ?auto_40837 ?auto_40841 ) ) ( not ( = ?auto_40835 ?auto_40841 ) ) ( not ( = ?auto_40843 ?auto_40841 ) ) ( not ( = ?auto_40849 ?auto_40850 ) ) ( not ( = ?auto_40848 ?auto_40849 ) ) ( not ( = ?auto_40839 ?auto_40849 ) ) ( HOIST-AT ?auto_40836 ?auto_40849 ) ( not ( = ?auto_40844 ?auto_40836 ) ) ( not ( = ?auto_40834 ?auto_40836 ) ) ( not ( = ?auto_40845 ?auto_40836 ) ) ( AVAILABLE ?auto_40836 ) ( SURFACE-AT ?auto_40835 ?auto_40849 ) ( ON ?auto_40835 ?auto_40842 ) ( CLEAR ?auto_40835 ) ( not ( = ?auto_40832 ?auto_40842 ) ) ( not ( = ?auto_40833 ?auto_40842 ) ) ( not ( = ?auto_40837 ?auto_40842 ) ) ( not ( = ?auto_40835 ?auto_40842 ) ) ( not ( = ?auto_40843 ?auto_40842 ) ) ( not ( = ?auto_40841 ?auto_40842 ) ) ( IS-CRATE ?auto_40841 ) ( not ( = ?auto_40832 ?auto_40851 ) ) ( not ( = ?auto_40833 ?auto_40851 ) ) ( not ( = ?auto_40837 ?auto_40851 ) ) ( not ( = ?auto_40835 ?auto_40851 ) ) ( not ( = ?auto_40843 ?auto_40851 ) ) ( not ( = ?auto_40841 ?auto_40851 ) ) ( not ( = ?auto_40842 ?auto_40851 ) ) ( not ( = ?auto_40838 ?auto_40850 ) ) ( not ( = ?auto_40848 ?auto_40838 ) ) ( not ( = ?auto_40839 ?auto_40838 ) ) ( not ( = ?auto_40849 ?auto_40838 ) ) ( HOIST-AT ?auto_40846 ?auto_40838 ) ( not ( = ?auto_40844 ?auto_40846 ) ) ( not ( = ?auto_40834 ?auto_40846 ) ) ( not ( = ?auto_40845 ?auto_40846 ) ) ( not ( = ?auto_40836 ?auto_40846 ) ) ( AVAILABLE ?auto_40846 ) ( SURFACE-AT ?auto_40841 ?auto_40838 ) ( ON ?auto_40841 ?auto_40847 ) ( CLEAR ?auto_40841 ) ( not ( = ?auto_40832 ?auto_40847 ) ) ( not ( = ?auto_40833 ?auto_40847 ) ) ( not ( = ?auto_40837 ?auto_40847 ) ) ( not ( = ?auto_40835 ?auto_40847 ) ) ( not ( = ?auto_40843 ?auto_40847 ) ) ( not ( = ?auto_40841 ?auto_40847 ) ) ( not ( = ?auto_40842 ?auto_40847 ) ) ( not ( = ?auto_40851 ?auto_40847 ) ) ( TRUCK-AT ?auto_40840 ?auto_40850 ) ( SURFACE-AT ?auto_40852 ?auto_40850 ) ( CLEAR ?auto_40852 ) ( LIFTING ?auto_40844 ?auto_40851 ) ( IS-CRATE ?auto_40851 ) ( not ( = ?auto_40832 ?auto_40852 ) ) ( not ( = ?auto_40833 ?auto_40852 ) ) ( not ( = ?auto_40837 ?auto_40852 ) ) ( not ( = ?auto_40835 ?auto_40852 ) ) ( not ( = ?auto_40843 ?auto_40852 ) ) ( not ( = ?auto_40841 ?auto_40852 ) ) ( not ( = ?auto_40842 ?auto_40852 ) ) ( not ( = ?auto_40851 ?auto_40852 ) ) ( not ( = ?auto_40847 ?auto_40852 ) ) )
    :subtasks
    ( ( !DROP ?auto_40844 ?auto_40851 ?auto_40852 ?auto_40850 )
      ( MAKE-ON ?auto_40832 ?auto_40833 )
      ( MAKE-ON-VERIFY ?auto_40832 ?auto_40833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40853 - SURFACE
      ?auto_40854 - SURFACE
    )
    :vars
    (
      ?auto_40861 - HOIST
      ?auto_40873 - PLACE
      ?auto_40856 - PLACE
      ?auto_40866 - HOIST
      ?auto_40871 - SURFACE
      ?auto_40864 - SURFACE
      ?auto_40860 - PLACE
      ?auto_40869 - HOIST
      ?auto_40857 - SURFACE
      ?auto_40868 - SURFACE
      ?auto_40858 - PLACE
      ?auto_40865 - HOIST
      ?auto_40859 - SURFACE
      ?auto_40872 - SURFACE
      ?auto_40870 - PLACE
      ?auto_40855 - HOIST
      ?auto_40867 - SURFACE
      ?auto_40863 - TRUCK
      ?auto_40862 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40861 ?auto_40873 ) ( IS-CRATE ?auto_40853 ) ( not ( = ?auto_40853 ?auto_40854 ) ) ( not ( = ?auto_40856 ?auto_40873 ) ) ( HOIST-AT ?auto_40866 ?auto_40856 ) ( not ( = ?auto_40861 ?auto_40866 ) ) ( AVAILABLE ?auto_40866 ) ( SURFACE-AT ?auto_40853 ?auto_40856 ) ( ON ?auto_40853 ?auto_40871 ) ( CLEAR ?auto_40853 ) ( not ( = ?auto_40853 ?auto_40871 ) ) ( not ( = ?auto_40854 ?auto_40871 ) ) ( IS-CRATE ?auto_40854 ) ( not ( = ?auto_40853 ?auto_40864 ) ) ( not ( = ?auto_40854 ?auto_40864 ) ) ( not ( = ?auto_40871 ?auto_40864 ) ) ( not ( = ?auto_40860 ?auto_40873 ) ) ( not ( = ?auto_40856 ?auto_40860 ) ) ( HOIST-AT ?auto_40869 ?auto_40860 ) ( not ( = ?auto_40861 ?auto_40869 ) ) ( not ( = ?auto_40866 ?auto_40869 ) ) ( AVAILABLE ?auto_40869 ) ( SURFACE-AT ?auto_40854 ?auto_40860 ) ( ON ?auto_40854 ?auto_40857 ) ( CLEAR ?auto_40854 ) ( not ( = ?auto_40853 ?auto_40857 ) ) ( not ( = ?auto_40854 ?auto_40857 ) ) ( not ( = ?auto_40871 ?auto_40857 ) ) ( not ( = ?auto_40864 ?auto_40857 ) ) ( IS-CRATE ?auto_40864 ) ( not ( = ?auto_40853 ?auto_40868 ) ) ( not ( = ?auto_40854 ?auto_40868 ) ) ( not ( = ?auto_40871 ?auto_40868 ) ) ( not ( = ?auto_40864 ?auto_40868 ) ) ( not ( = ?auto_40857 ?auto_40868 ) ) ( not ( = ?auto_40858 ?auto_40873 ) ) ( not ( = ?auto_40856 ?auto_40858 ) ) ( not ( = ?auto_40860 ?auto_40858 ) ) ( HOIST-AT ?auto_40865 ?auto_40858 ) ( not ( = ?auto_40861 ?auto_40865 ) ) ( not ( = ?auto_40866 ?auto_40865 ) ) ( not ( = ?auto_40869 ?auto_40865 ) ) ( AVAILABLE ?auto_40865 ) ( SURFACE-AT ?auto_40864 ?auto_40858 ) ( ON ?auto_40864 ?auto_40859 ) ( CLEAR ?auto_40864 ) ( not ( = ?auto_40853 ?auto_40859 ) ) ( not ( = ?auto_40854 ?auto_40859 ) ) ( not ( = ?auto_40871 ?auto_40859 ) ) ( not ( = ?auto_40864 ?auto_40859 ) ) ( not ( = ?auto_40857 ?auto_40859 ) ) ( not ( = ?auto_40868 ?auto_40859 ) ) ( IS-CRATE ?auto_40868 ) ( not ( = ?auto_40853 ?auto_40872 ) ) ( not ( = ?auto_40854 ?auto_40872 ) ) ( not ( = ?auto_40871 ?auto_40872 ) ) ( not ( = ?auto_40864 ?auto_40872 ) ) ( not ( = ?auto_40857 ?auto_40872 ) ) ( not ( = ?auto_40868 ?auto_40872 ) ) ( not ( = ?auto_40859 ?auto_40872 ) ) ( not ( = ?auto_40870 ?auto_40873 ) ) ( not ( = ?auto_40856 ?auto_40870 ) ) ( not ( = ?auto_40860 ?auto_40870 ) ) ( not ( = ?auto_40858 ?auto_40870 ) ) ( HOIST-AT ?auto_40855 ?auto_40870 ) ( not ( = ?auto_40861 ?auto_40855 ) ) ( not ( = ?auto_40866 ?auto_40855 ) ) ( not ( = ?auto_40869 ?auto_40855 ) ) ( not ( = ?auto_40865 ?auto_40855 ) ) ( AVAILABLE ?auto_40855 ) ( SURFACE-AT ?auto_40868 ?auto_40870 ) ( ON ?auto_40868 ?auto_40867 ) ( CLEAR ?auto_40868 ) ( not ( = ?auto_40853 ?auto_40867 ) ) ( not ( = ?auto_40854 ?auto_40867 ) ) ( not ( = ?auto_40871 ?auto_40867 ) ) ( not ( = ?auto_40864 ?auto_40867 ) ) ( not ( = ?auto_40857 ?auto_40867 ) ) ( not ( = ?auto_40868 ?auto_40867 ) ) ( not ( = ?auto_40859 ?auto_40867 ) ) ( not ( = ?auto_40872 ?auto_40867 ) ) ( TRUCK-AT ?auto_40863 ?auto_40873 ) ( SURFACE-AT ?auto_40862 ?auto_40873 ) ( CLEAR ?auto_40862 ) ( IS-CRATE ?auto_40872 ) ( not ( = ?auto_40853 ?auto_40862 ) ) ( not ( = ?auto_40854 ?auto_40862 ) ) ( not ( = ?auto_40871 ?auto_40862 ) ) ( not ( = ?auto_40864 ?auto_40862 ) ) ( not ( = ?auto_40857 ?auto_40862 ) ) ( not ( = ?auto_40868 ?auto_40862 ) ) ( not ( = ?auto_40859 ?auto_40862 ) ) ( not ( = ?auto_40872 ?auto_40862 ) ) ( not ( = ?auto_40867 ?auto_40862 ) ) ( AVAILABLE ?auto_40861 ) ( IN ?auto_40872 ?auto_40863 ) )
    :subtasks
    ( ( !UNLOAD ?auto_40861 ?auto_40872 ?auto_40863 ?auto_40873 )
      ( MAKE-ON ?auto_40853 ?auto_40854 )
      ( MAKE-ON-VERIFY ?auto_40853 ?auto_40854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40874 - SURFACE
      ?auto_40875 - SURFACE
    )
    :vars
    (
      ?auto_40877 - HOIST
      ?auto_40884 - PLACE
      ?auto_40892 - PLACE
      ?auto_40881 - HOIST
      ?auto_40888 - SURFACE
      ?auto_40889 - SURFACE
      ?auto_40887 - PLACE
      ?auto_40876 - HOIST
      ?auto_40882 - SURFACE
      ?auto_40891 - SURFACE
      ?auto_40879 - PLACE
      ?auto_40890 - HOIST
      ?auto_40893 - SURFACE
      ?auto_40885 - SURFACE
      ?auto_40883 - PLACE
      ?auto_40894 - HOIST
      ?auto_40886 - SURFACE
      ?auto_40878 - SURFACE
      ?auto_40880 - TRUCK
      ?auto_40895 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40877 ?auto_40884 ) ( IS-CRATE ?auto_40874 ) ( not ( = ?auto_40874 ?auto_40875 ) ) ( not ( = ?auto_40892 ?auto_40884 ) ) ( HOIST-AT ?auto_40881 ?auto_40892 ) ( not ( = ?auto_40877 ?auto_40881 ) ) ( AVAILABLE ?auto_40881 ) ( SURFACE-AT ?auto_40874 ?auto_40892 ) ( ON ?auto_40874 ?auto_40888 ) ( CLEAR ?auto_40874 ) ( not ( = ?auto_40874 ?auto_40888 ) ) ( not ( = ?auto_40875 ?auto_40888 ) ) ( IS-CRATE ?auto_40875 ) ( not ( = ?auto_40874 ?auto_40889 ) ) ( not ( = ?auto_40875 ?auto_40889 ) ) ( not ( = ?auto_40888 ?auto_40889 ) ) ( not ( = ?auto_40887 ?auto_40884 ) ) ( not ( = ?auto_40892 ?auto_40887 ) ) ( HOIST-AT ?auto_40876 ?auto_40887 ) ( not ( = ?auto_40877 ?auto_40876 ) ) ( not ( = ?auto_40881 ?auto_40876 ) ) ( AVAILABLE ?auto_40876 ) ( SURFACE-AT ?auto_40875 ?auto_40887 ) ( ON ?auto_40875 ?auto_40882 ) ( CLEAR ?auto_40875 ) ( not ( = ?auto_40874 ?auto_40882 ) ) ( not ( = ?auto_40875 ?auto_40882 ) ) ( not ( = ?auto_40888 ?auto_40882 ) ) ( not ( = ?auto_40889 ?auto_40882 ) ) ( IS-CRATE ?auto_40889 ) ( not ( = ?auto_40874 ?auto_40891 ) ) ( not ( = ?auto_40875 ?auto_40891 ) ) ( not ( = ?auto_40888 ?auto_40891 ) ) ( not ( = ?auto_40889 ?auto_40891 ) ) ( not ( = ?auto_40882 ?auto_40891 ) ) ( not ( = ?auto_40879 ?auto_40884 ) ) ( not ( = ?auto_40892 ?auto_40879 ) ) ( not ( = ?auto_40887 ?auto_40879 ) ) ( HOIST-AT ?auto_40890 ?auto_40879 ) ( not ( = ?auto_40877 ?auto_40890 ) ) ( not ( = ?auto_40881 ?auto_40890 ) ) ( not ( = ?auto_40876 ?auto_40890 ) ) ( AVAILABLE ?auto_40890 ) ( SURFACE-AT ?auto_40889 ?auto_40879 ) ( ON ?auto_40889 ?auto_40893 ) ( CLEAR ?auto_40889 ) ( not ( = ?auto_40874 ?auto_40893 ) ) ( not ( = ?auto_40875 ?auto_40893 ) ) ( not ( = ?auto_40888 ?auto_40893 ) ) ( not ( = ?auto_40889 ?auto_40893 ) ) ( not ( = ?auto_40882 ?auto_40893 ) ) ( not ( = ?auto_40891 ?auto_40893 ) ) ( IS-CRATE ?auto_40891 ) ( not ( = ?auto_40874 ?auto_40885 ) ) ( not ( = ?auto_40875 ?auto_40885 ) ) ( not ( = ?auto_40888 ?auto_40885 ) ) ( not ( = ?auto_40889 ?auto_40885 ) ) ( not ( = ?auto_40882 ?auto_40885 ) ) ( not ( = ?auto_40891 ?auto_40885 ) ) ( not ( = ?auto_40893 ?auto_40885 ) ) ( not ( = ?auto_40883 ?auto_40884 ) ) ( not ( = ?auto_40892 ?auto_40883 ) ) ( not ( = ?auto_40887 ?auto_40883 ) ) ( not ( = ?auto_40879 ?auto_40883 ) ) ( HOIST-AT ?auto_40894 ?auto_40883 ) ( not ( = ?auto_40877 ?auto_40894 ) ) ( not ( = ?auto_40881 ?auto_40894 ) ) ( not ( = ?auto_40876 ?auto_40894 ) ) ( not ( = ?auto_40890 ?auto_40894 ) ) ( AVAILABLE ?auto_40894 ) ( SURFACE-AT ?auto_40891 ?auto_40883 ) ( ON ?auto_40891 ?auto_40886 ) ( CLEAR ?auto_40891 ) ( not ( = ?auto_40874 ?auto_40886 ) ) ( not ( = ?auto_40875 ?auto_40886 ) ) ( not ( = ?auto_40888 ?auto_40886 ) ) ( not ( = ?auto_40889 ?auto_40886 ) ) ( not ( = ?auto_40882 ?auto_40886 ) ) ( not ( = ?auto_40891 ?auto_40886 ) ) ( not ( = ?auto_40893 ?auto_40886 ) ) ( not ( = ?auto_40885 ?auto_40886 ) ) ( SURFACE-AT ?auto_40878 ?auto_40884 ) ( CLEAR ?auto_40878 ) ( IS-CRATE ?auto_40885 ) ( not ( = ?auto_40874 ?auto_40878 ) ) ( not ( = ?auto_40875 ?auto_40878 ) ) ( not ( = ?auto_40888 ?auto_40878 ) ) ( not ( = ?auto_40889 ?auto_40878 ) ) ( not ( = ?auto_40882 ?auto_40878 ) ) ( not ( = ?auto_40891 ?auto_40878 ) ) ( not ( = ?auto_40893 ?auto_40878 ) ) ( not ( = ?auto_40885 ?auto_40878 ) ) ( not ( = ?auto_40886 ?auto_40878 ) ) ( AVAILABLE ?auto_40877 ) ( IN ?auto_40885 ?auto_40880 ) ( TRUCK-AT ?auto_40880 ?auto_40895 ) ( not ( = ?auto_40895 ?auto_40884 ) ) ( not ( = ?auto_40892 ?auto_40895 ) ) ( not ( = ?auto_40887 ?auto_40895 ) ) ( not ( = ?auto_40879 ?auto_40895 ) ) ( not ( = ?auto_40883 ?auto_40895 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_40880 ?auto_40895 ?auto_40884 )
      ( MAKE-ON ?auto_40874 ?auto_40875 )
      ( MAKE-ON-VERIFY ?auto_40874 ?auto_40875 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40896 - SURFACE
      ?auto_40897 - SURFACE
    )
    :vars
    (
      ?auto_40898 - HOIST
      ?auto_40900 - PLACE
      ?auto_40903 - PLACE
      ?auto_40906 - HOIST
      ?auto_40912 - SURFACE
      ?auto_40901 - SURFACE
      ?auto_40899 - PLACE
      ?auto_40915 - HOIST
      ?auto_40911 - SURFACE
      ?auto_40914 - SURFACE
      ?auto_40909 - PLACE
      ?auto_40910 - HOIST
      ?auto_40904 - SURFACE
      ?auto_40917 - SURFACE
      ?auto_40916 - PLACE
      ?auto_40905 - HOIST
      ?auto_40907 - SURFACE
      ?auto_40913 - SURFACE
      ?auto_40908 - TRUCK
      ?auto_40902 - PLACE
      ?auto_40918 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_40898 ?auto_40900 ) ( IS-CRATE ?auto_40896 ) ( not ( = ?auto_40896 ?auto_40897 ) ) ( not ( = ?auto_40903 ?auto_40900 ) ) ( HOIST-AT ?auto_40906 ?auto_40903 ) ( not ( = ?auto_40898 ?auto_40906 ) ) ( AVAILABLE ?auto_40906 ) ( SURFACE-AT ?auto_40896 ?auto_40903 ) ( ON ?auto_40896 ?auto_40912 ) ( CLEAR ?auto_40896 ) ( not ( = ?auto_40896 ?auto_40912 ) ) ( not ( = ?auto_40897 ?auto_40912 ) ) ( IS-CRATE ?auto_40897 ) ( not ( = ?auto_40896 ?auto_40901 ) ) ( not ( = ?auto_40897 ?auto_40901 ) ) ( not ( = ?auto_40912 ?auto_40901 ) ) ( not ( = ?auto_40899 ?auto_40900 ) ) ( not ( = ?auto_40903 ?auto_40899 ) ) ( HOIST-AT ?auto_40915 ?auto_40899 ) ( not ( = ?auto_40898 ?auto_40915 ) ) ( not ( = ?auto_40906 ?auto_40915 ) ) ( AVAILABLE ?auto_40915 ) ( SURFACE-AT ?auto_40897 ?auto_40899 ) ( ON ?auto_40897 ?auto_40911 ) ( CLEAR ?auto_40897 ) ( not ( = ?auto_40896 ?auto_40911 ) ) ( not ( = ?auto_40897 ?auto_40911 ) ) ( not ( = ?auto_40912 ?auto_40911 ) ) ( not ( = ?auto_40901 ?auto_40911 ) ) ( IS-CRATE ?auto_40901 ) ( not ( = ?auto_40896 ?auto_40914 ) ) ( not ( = ?auto_40897 ?auto_40914 ) ) ( not ( = ?auto_40912 ?auto_40914 ) ) ( not ( = ?auto_40901 ?auto_40914 ) ) ( not ( = ?auto_40911 ?auto_40914 ) ) ( not ( = ?auto_40909 ?auto_40900 ) ) ( not ( = ?auto_40903 ?auto_40909 ) ) ( not ( = ?auto_40899 ?auto_40909 ) ) ( HOIST-AT ?auto_40910 ?auto_40909 ) ( not ( = ?auto_40898 ?auto_40910 ) ) ( not ( = ?auto_40906 ?auto_40910 ) ) ( not ( = ?auto_40915 ?auto_40910 ) ) ( AVAILABLE ?auto_40910 ) ( SURFACE-AT ?auto_40901 ?auto_40909 ) ( ON ?auto_40901 ?auto_40904 ) ( CLEAR ?auto_40901 ) ( not ( = ?auto_40896 ?auto_40904 ) ) ( not ( = ?auto_40897 ?auto_40904 ) ) ( not ( = ?auto_40912 ?auto_40904 ) ) ( not ( = ?auto_40901 ?auto_40904 ) ) ( not ( = ?auto_40911 ?auto_40904 ) ) ( not ( = ?auto_40914 ?auto_40904 ) ) ( IS-CRATE ?auto_40914 ) ( not ( = ?auto_40896 ?auto_40917 ) ) ( not ( = ?auto_40897 ?auto_40917 ) ) ( not ( = ?auto_40912 ?auto_40917 ) ) ( not ( = ?auto_40901 ?auto_40917 ) ) ( not ( = ?auto_40911 ?auto_40917 ) ) ( not ( = ?auto_40914 ?auto_40917 ) ) ( not ( = ?auto_40904 ?auto_40917 ) ) ( not ( = ?auto_40916 ?auto_40900 ) ) ( not ( = ?auto_40903 ?auto_40916 ) ) ( not ( = ?auto_40899 ?auto_40916 ) ) ( not ( = ?auto_40909 ?auto_40916 ) ) ( HOIST-AT ?auto_40905 ?auto_40916 ) ( not ( = ?auto_40898 ?auto_40905 ) ) ( not ( = ?auto_40906 ?auto_40905 ) ) ( not ( = ?auto_40915 ?auto_40905 ) ) ( not ( = ?auto_40910 ?auto_40905 ) ) ( AVAILABLE ?auto_40905 ) ( SURFACE-AT ?auto_40914 ?auto_40916 ) ( ON ?auto_40914 ?auto_40907 ) ( CLEAR ?auto_40914 ) ( not ( = ?auto_40896 ?auto_40907 ) ) ( not ( = ?auto_40897 ?auto_40907 ) ) ( not ( = ?auto_40912 ?auto_40907 ) ) ( not ( = ?auto_40901 ?auto_40907 ) ) ( not ( = ?auto_40911 ?auto_40907 ) ) ( not ( = ?auto_40914 ?auto_40907 ) ) ( not ( = ?auto_40904 ?auto_40907 ) ) ( not ( = ?auto_40917 ?auto_40907 ) ) ( SURFACE-AT ?auto_40913 ?auto_40900 ) ( CLEAR ?auto_40913 ) ( IS-CRATE ?auto_40917 ) ( not ( = ?auto_40896 ?auto_40913 ) ) ( not ( = ?auto_40897 ?auto_40913 ) ) ( not ( = ?auto_40912 ?auto_40913 ) ) ( not ( = ?auto_40901 ?auto_40913 ) ) ( not ( = ?auto_40911 ?auto_40913 ) ) ( not ( = ?auto_40914 ?auto_40913 ) ) ( not ( = ?auto_40904 ?auto_40913 ) ) ( not ( = ?auto_40917 ?auto_40913 ) ) ( not ( = ?auto_40907 ?auto_40913 ) ) ( AVAILABLE ?auto_40898 ) ( TRUCK-AT ?auto_40908 ?auto_40902 ) ( not ( = ?auto_40902 ?auto_40900 ) ) ( not ( = ?auto_40903 ?auto_40902 ) ) ( not ( = ?auto_40899 ?auto_40902 ) ) ( not ( = ?auto_40909 ?auto_40902 ) ) ( not ( = ?auto_40916 ?auto_40902 ) ) ( HOIST-AT ?auto_40918 ?auto_40902 ) ( LIFTING ?auto_40918 ?auto_40917 ) ( not ( = ?auto_40898 ?auto_40918 ) ) ( not ( = ?auto_40906 ?auto_40918 ) ) ( not ( = ?auto_40915 ?auto_40918 ) ) ( not ( = ?auto_40910 ?auto_40918 ) ) ( not ( = ?auto_40905 ?auto_40918 ) ) )
    :subtasks
    ( ( !LOAD ?auto_40918 ?auto_40917 ?auto_40908 ?auto_40902 )
      ( MAKE-ON ?auto_40896 ?auto_40897 )
      ( MAKE-ON-VERIFY ?auto_40896 ?auto_40897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40919 - SURFACE
      ?auto_40920 - SURFACE
    )
    :vars
    (
      ?auto_40932 - HOIST
      ?auto_40929 - PLACE
      ?auto_40921 - PLACE
      ?auto_40936 - HOIST
      ?auto_40924 - SURFACE
      ?auto_40938 - SURFACE
      ?auto_40937 - PLACE
      ?auto_40934 - HOIST
      ?auto_40926 - SURFACE
      ?auto_40941 - SURFACE
      ?auto_40922 - PLACE
      ?auto_40928 - HOIST
      ?auto_40935 - SURFACE
      ?auto_40933 - SURFACE
      ?auto_40939 - PLACE
      ?auto_40925 - HOIST
      ?auto_40927 - SURFACE
      ?auto_40923 - SURFACE
      ?auto_40930 - TRUCK
      ?auto_40931 - PLACE
      ?auto_40940 - HOIST
      ?auto_40942 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40932 ?auto_40929 ) ( IS-CRATE ?auto_40919 ) ( not ( = ?auto_40919 ?auto_40920 ) ) ( not ( = ?auto_40921 ?auto_40929 ) ) ( HOIST-AT ?auto_40936 ?auto_40921 ) ( not ( = ?auto_40932 ?auto_40936 ) ) ( AVAILABLE ?auto_40936 ) ( SURFACE-AT ?auto_40919 ?auto_40921 ) ( ON ?auto_40919 ?auto_40924 ) ( CLEAR ?auto_40919 ) ( not ( = ?auto_40919 ?auto_40924 ) ) ( not ( = ?auto_40920 ?auto_40924 ) ) ( IS-CRATE ?auto_40920 ) ( not ( = ?auto_40919 ?auto_40938 ) ) ( not ( = ?auto_40920 ?auto_40938 ) ) ( not ( = ?auto_40924 ?auto_40938 ) ) ( not ( = ?auto_40937 ?auto_40929 ) ) ( not ( = ?auto_40921 ?auto_40937 ) ) ( HOIST-AT ?auto_40934 ?auto_40937 ) ( not ( = ?auto_40932 ?auto_40934 ) ) ( not ( = ?auto_40936 ?auto_40934 ) ) ( AVAILABLE ?auto_40934 ) ( SURFACE-AT ?auto_40920 ?auto_40937 ) ( ON ?auto_40920 ?auto_40926 ) ( CLEAR ?auto_40920 ) ( not ( = ?auto_40919 ?auto_40926 ) ) ( not ( = ?auto_40920 ?auto_40926 ) ) ( not ( = ?auto_40924 ?auto_40926 ) ) ( not ( = ?auto_40938 ?auto_40926 ) ) ( IS-CRATE ?auto_40938 ) ( not ( = ?auto_40919 ?auto_40941 ) ) ( not ( = ?auto_40920 ?auto_40941 ) ) ( not ( = ?auto_40924 ?auto_40941 ) ) ( not ( = ?auto_40938 ?auto_40941 ) ) ( not ( = ?auto_40926 ?auto_40941 ) ) ( not ( = ?auto_40922 ?auto_40929 ) ) ( not ( = ?auto_40921 ?auto_40922 ) ) ( not ( = ?auto_40937 ?auto_40922 ) ) ( HOIST-AT ?auto_40928 ?auto_40922 ) ( not ( = ?auto_40932 ?auto_40928 ) ) ( not ( = ?auto_40936 ?auto_40928 ) ) ( not ( = ?auto_40934 ?auto_40928 ) ) ( AVAILABLE ?auto_40928 ) ( SURFACE-AT ?auto_40938 ?auto_40922 ) ( ON ?auto_40938 ?auto_40935 ) ( CLEAR ?auto_40938 ) ( not ( = ?auto_40919 ?auto_40935 ) ) ( not ( = ?auto_40920 ?auto_40935 ) ) ( not ( = ?auto_40924 ?auto_40935 ) ) ( not ( = ?auto_40938 ?auto_40935 ) ) ( not ( = ?auto_40926 ?auto_40935 ) ) ( not ( = ?auto_40941 ?auto_40935 ) ) ( IS-CRATE ?auto_40941 ) ( not ( = ?auto_40919 ?auto_40933 ) ) ( not ( = ?auto_40920 ?auto_40933 ) ) ( not ( = ?auto_40924 ?auto_40933 ) ) ( not ( = ?auto_40938 ?auto_40933 ) ) ( not ( = ?auto_40926 ?auto_40933 ) ) ( not ( = ?auto_40941 ?auto_40933 ) ) ( not ( = ?auto_40935 ?auto_40933 ) ) ( not ( = ?auto_40939 ?auto_40929 ) ) ( not ( = ?auto_40921 ?auto_40939 ) ) ( not ( = ?auto_40937 ?auto_40939 ) ) ( not ( = ?auto_40922 ?auto_40939 ) ) ( HOIST-AT ?auto_40925 ?auto_40939 ) ( not ( = ?auto_40932 ?auto_40925 ) ) ( not ( = ?auto_40936 ?auto_40925 ) ) ( not ( = ?auto_40934 ?auto_40925 ) ) ( not ( = ?auto_40928 ?auto_40925 ) ) ( AVAILABLE ?auto_40925 ) ( SURFACE-AT ?auto_40941 ?auto_40939 ) ( ON ?auto_40941 ?auto_40927 ) ( CLEAR ?auto_40941 ) ( not ( = ?auto_40919 ?auto_40927 ) ) ( not ( = ?auto_40920 ?auto_40927 ) ) ( not ( = ?auto_40924 ?auto_40927 ) ) ( not ( = ?auto_40938 ?auto_40927 ) ) ( not ( = ?auto_40926 ?auto_40927 ) ) ( not ( = ?auto_40941 ?auto_40927 ) ) ( not ( = ?auto_40935 ?auto_40927 ) ) ( not ( = ?auto_40933 ?auto_40927 ) ) ( SURFACE-AT ?auto_40923 ?auto_40929 ) ( CLEAR ?auto_40923 ) ( IS-CRATE ?auto_40933 ) ( not ( = ?auto_40919 ?auto_40923 ) ) ( not ( = ?auto_40920 ?auto_40923 ) ) ( not ( = ?auto_40924 ?auto_40923 ) ) ( not ( = ?auto_40938 ?auto_40923 ) ) ( not ( = ?auto_40926 ?auto_40923 ) ) ( not ( = ?auto_40941 ?auto_40923 ) ) ( not ( = ?auto_40935 ?auto_40923 ) ) ( not ( = ?auto_40933 ?auto_40923 ) ) ( not ( = ?auto_40927 ?auto_40923 ) ) ( AVAILABLE ?auto_40932 ) ( TRUCK-AT ?auto_40930 ?auto_40931 ) ( not ( = ?auto_40931 ?auto_40929 ) ) ( not ( = ?auto_40921 ?auto_40931 ) ) ( not ( = ?auto_40937 ?auto_40931 ) ) ( not ( = ?auto_40922 ?auto_40931 ) ) ( not ( = ?auto_40939 ?auto_40931 ) ) ( HOIST-AT ?auto_40940 ?auto_40931 ) ( not ( = ?auto_40932 ?auto_40940 ) ) ( not ( = ?auto_40936 ?auto_40940 ) ) ( not ( = ?auto_40934 ?auto_40940 ) ) ( not ( = ?auto_40928 ?auto_40940 ) ) ( not ( = ?auto_40925 ?auto_40940 ) ) ( AVAILABLE ?auto_40940 ) ( SURFACE-AT ?auto_40933 ?auto_40931 ) ( ON ?auto_40933 ?auto_40942 ) ( CLEAR ?auto_40933 ) ( not ( = ?auto_40919 ?auto_40942 ) ) ( not ( = ?auto_40920 ?auto_40942 ) ) ( not ( = ?auto_40924 ?auto_40942 ) ) ( not ( = ?auto_40938 ?auto_40942 ) ) ( not ( = ?auto_40926 ?auto_40942 ) ) ( not ( = ?auto_40941 ?auto_40942 ) ) ( not ( = ?auto_40935 ?auto_40942 ) ) ( not ( = ?auto_40933 ?auto_40942 ) ) ( not ( = ?auto_40927 ?auto_40942 ) ) ( not ( = ?auto_40923 ?auto_40942 ) ) )
    :subtasks
    ( ( !LIFT ?auto_40940 ?auto_40933 ?auto_40942 ?auto_40931 )
      ( MAKE-ON ?auto_40919 ?auto_40920 )
      ( MAKE-ON-VERIFY ?auto_40919 ?auto_40920 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40943 - SURFACE
      ?auto_40944 - SURFACE
    )
    :vars
    (
      ?auto_40956 - HOIST
      ?auto_40948 - PLACE
      ?auto_40949 - PLACE
      ?auto_40962 - HOIST
      ?auto_40951 - SURFACE
      ?auto_40959 - SURFACE
      ?auto_40966 - PLACE
      ?auto_40957 - HOIST
      ?auto_40954 - SURFACE
      ?auto_40963 - SURFACE
      ?auto_40955 - PLACE
      ?auto_40947 - HOIST
      ?auto_40946 - SURFACE
      ?auto_40953 - SURFACE
      ?auto_40958 - PLACE
      ?auto_40964 - HOIST
      ?auto_40961 - SURFACE
      ?auto_40945 - SURFACE
      ?auto_40960 - PLACE
      ?auto_40965 - HOIST
      ?auto_40950 - SURFACE
      ?auto_40952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40956 ?auto_40948 ) ( IS-CRATE ?auto_40943 ) ( not ( = ?auto_40943 ?auto_40944 ) ) ( not ( = ?auto_40949 ?auto_40948 ) ) ( HOIST-AT ?auto_40962 ?auto_40949 ) ( not ( = ?auto_40956 ?auto_40962 ) ) ( AVAILABLE ?auto_40962 ) ( SURFACE-AT ?auto_40943 ?auto_40949 ) ( ON ?auto_40943 ?auto_40951 ) ( CLEAR ?auto_40943 ) ( not ( = ?auto_40943 ?auto_40951 ) ) ( not ( = ?auto_40944 ?auto_40951 ) ) ( IS-CRATE ?auto_40944 ) ( not ( = ?auto_40943 ?auto_40959 ) ) ( not ( = ?auto_40944 ?auto_40959 ) ) ( not ( = ?auto_40951 ?auto_40959 ) ) ( not ( = ?auto_40966 ?auto_40948 ) ) ( not ( = ?auto_40949 ?auto_40966 ) ) ( HOIST-AT ?auto_40957 ?auto_40966 ) ( not ( = ?auto_40956 ?auto_40957 ) ) ( not ( = ?auto_40962 ?auto_40957 ) ) ( AVAILABLE ?auto_40957 ) ( SURFACE-AT ?auto_40944 ?auto_40966 ) ( ON ?auto_40944 ?auto_40954 ) ( CLEAR ?auto_40944 ) ( not ( = ?auto_40943 ?auto_40954 ) ) ( not ( = ?auto_40944 ?auto_40954 ) ) ( not ( = ?auto_40951 ?auto_40954 ) ) ( not ( = ?auto_40959 ?auto_40954 ) ) ( IS-CRATE ?auto_40959 ) ( not ( = ?auto_40943 ?auto_40963 ) ) ( not ( = ?auto_40944 ?auto_40963 ) ) ( not ( = ?auto_40951 ?auto_40963 ) ) ( not ( = ?auto_40959 ?auto_40963 ) ) ( not ( = ?auto_40954 ?auto_40963 ) ) ( not ( = ?auto_40955 ?auto_40948 ) ) ( not ( = ?auto_40949 ?auto_40955 ) ) ( not ( = ?auto_40966 ?auto_40955 ) ) ( HOIST-AT ?auto_40947 ?auto_40955 ) ( not ( = ?auto_40956 ?auto_40947 ) ) ( not ( = ?auto_40962 ?auto_40947 ) ) ( not ( = ?auto_40957 ?auto_40947 ) ) ( AVAILABLE ?auto_40947 ) ( SURFACE-AT ?auto_40959 ?auto_40955 ) ( ON ?auto_40959 ?auto_40946 ) ( CLEAR ?auto_40959 ) ( not ( = ?auto_40943 ?auto_40946 ) ) ( not ( = ?auto_40944 ?auto_40946 ) ) ( not ( = ?auto_40951 ?auto_40946 ) ) ( not ( = ?auto_40959 ?auto_40946 ) ) ( not ( = ?auto_40954 ?auto_40946 ) ) ( not ( = ?auto_40963 ?auto_40946 ) ) ( IS-CRATE ?auto_40963 ) ( not ( = ?auto_40943 ?auto_40953 ) ) ( not ( = ?auto_40944 ?auto_40953 ) ) ( not ( = ?auto_40951 ?auto_40953 ) ) ( not ( = ?auto_40959 ?auto_40953 ) ) ( not ( = ?auto_40954 ?auto_40953 ) ) ( not ( = ?auto_40963 ?auto_40953 ) ) ( not ( = ?auto_40946 ?auto_40953 ) ) ( not ( = ?auto_40958 ?auto_40948 ) ) ( not ( = ?auto_40949 ?auto_40958 ) ) ( not ( = ?auto_40966 ?auto_40958 ) ) ( not ( = ?auto_40955 ?auto_40958 ) ) ( HOIST-AT ?auto_40964 ?auto_40958 ) ( not ( = ?auto_40956 ?auto_40964 ) ) ( not ( = ?auto_40962 ?auto_40964 ) ) ( not ( = ?auto_40957 ?auto_40964 ) ) ( not ( = ?auto_40947 ?auto_40964 ) ) ( AVAILABLE ?auto_40964 ) ( SURFACE-AT ?auto_40963 ?auto_40958 ) ( ON ?auto_40963 ?auto_40961 ) ( CLEAR ?auto_40963 ) ( not ( = ?auto_40943 ?auto_40961 ) ) ( not ( = ?auto_40944 ?auto_40961 ) ) ( not ( = ?auto_40951 ?auto_40961 ) ) ( not ( = ?auto_40959 ?auto_40961 ) ) ( not ( = ?auto_40954 ?auto_40961 ) ) ( not ( = ?auto_40963 ?auto_40961 ) ) ( not ( = ?auto_40946 ?auto_40961 ) ) ( not ( = ?auto_40953 ?auto_40961 ) ) ( SURFACE-AT ?auto_40945 ?auto_40948 ) ( CLEAR ?auto_40945 ) ( IS-CRATE ?auto_40953 ) ( not ( = ?auto_40943 ?auto_40945 ) ) ( not ( = ?auto_40944 ?auto_40945 ) ) ( not ( = ?auto_40951 ?auto_40945 ) ) ( not ( = ?auto_40959 ?auto_40945 ) ) ( not ( = ?auto_40954 ?auto_40945 ) ) ( not ( = ?auto_40963 ?auto_40945 ) ) ( not ( = ?auto_40946 ?auto_40945 ) ) ( not ( = ?auto_40953 ?auto_40945 ) ) ( not ( = ?auto_40961 ?auto_40945 ) ) ( AVAILABLE ?auto_40956 ) ( not ( = ?auto_40960 ?auto_40948 ) ) ( not ( = ?auto_40949 ?auto_40960 ) ) ( not ( = ?auto_40966 ?auto_40960 ) ) ( not ( = ?auto_40955 ?auto_40960 ) ) ( not ( = ?auto_40958 ?auto_40960 ) ) ( HOIST-AT ?auto_40965 ?auto_40960 ) ( not ( = ?auto_40956 ?auto_40965 ) ) ( not ( = ?auto_40962 ?auto_40965 ) ) ( not ( = ?auto_40957 ?auto_40965 ) ) ( not ( = ?auto_40947 ?auto_40965 ) ) ( not ( = ?auto_40964 ?auto_40965 ) ) ( AVAILABLE ?auto_40965 ) ( SURFACE-AT ?auto_40953 ?auto_40960 ) ( ON ?auto_40953 ?auto_40950 ) ( CLEAR ?auto_40953 ) ( not ( = ?auto_40943 ?auto_40950 ) ) ( not ( = ?auto_40944 ?auto_40950 ) ) ( not ( = ?auto_40951 ?auto_40950 ) ) ( not ( = ?auto_40959 ?auto_40950 ) ) ( not ( = ?auto_40954 ?auto_40950 ) ) ( not ( = ?auto_40963 ?auto_40950 ) ) ( not ( = ?auto_40946 ?auto_40950 ) ) ( not ( = ?auto_40953 ?auto_40950 ) ) ( not ( = ?auto_40961 ?auto_40950 ) ) ( not ( = ?auto_40945 ?auto_40950 ) ) ( TRUCK-AT ?auto_40952 ?auto_40948 ) )
    :subtasks
    ( ( !DRIVE ?auto_40952 ?auto_40948 ?auto_40960 )
      ( MAKE-ON ?auto_40943 ?auto_40944 )
      ( MAKE-ON-VERIFY ?auto_40943 ?auto_40944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40967 - SURFACE
      ?auto_40968 - SURFACE
    )
    :vars
    (
      ?auto_40971 - HOIST
      ?auto_40975 - PLACE
      ?auto_40978 - PLACE
      ?auto_40973 - HOIST
      ?auto_40970 - SURFACE
      ?auto_40979 - SURFACE
      ?auto_40987 - PLACE
      ?auto_40989 - HOIST
      ?auto_40983 - SURFACE
      ?auto_40984 - SURFACE
      ?auto_40969 - PLACE
      ?auto_40982 - HOIST
      ?auto_40977 - SURFACE
      ?auto_40981 - SURFACE
      ?auto_40980 - PLACE
      ?auto_40985 - HOIST
      ?auto_40972 - SURFACE
      ?auto_40974 - SURFACE
      ?auto_40990 - PLACE
      ?auto_40986 - HOIST
      ?auto_40988 - SURFACE
      ?auto_40976 - TRUCK
      ?auto_40991 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40971 ?auto_40975 ) ( IS-CRATE ?auto_40967 ) ( not ( = ?auto_40967 ?auto_40968 ) ) ( not ( = ?auto_40978 ?auto_40975 ) ) ( HOIST-AT ?auto_40973 ?auto_40978 ) ( not ( = ?auto_40971 ?auto_40973 ) ) ( AVAILABLE ?auto_40973 ) ( SURFACE-AT ?auto_40967 ?auto_40978 ) ( ON ?auto_40967 ?auto_40970 ) ( CLEAR ?auto_40967 ) ( not ( = ?auto_40967 ?auto_40970 ) ) ( not ( = ?auto_40968 ?auto_40970 ) ) ( IS-CRATE ?auto_40968 ) ( not ( = ?auto_40967 ?auto_40979 ) ) ( not ( = ?auto_40968 ?auto_40979 ) ) ( not ( = ?auto_40970 ?auto_40979 ) ) ( not ( = ?auto_40987 ?auto_40975 ) ) ( not ( = ?auto_40978 ?auto_40987 ) ) ( HOIST-AT ?auto_40989 ?auto_40987 ) ( not ( = ?auto_40971 ?auto_40989 ) ) ( not ( = ?auto_40973 ?auto_40989 ) ) ( AVAILABLE ?auto_40989 ) ( SURFACE-AT ?auto_40968 ?auto_40987 ) ( ON ?auto_40968 ?auto_40983 ) ( CLEAR ?auto_40968 ) ( not ( = ?auto_40967 ?auto_40983 ) ) ( not ( = ?auto_40968 ?auto_40983 ) ) ( not ( = ?auto_40970 ?auto_40983 ) ) ( not ( = ?auto_40979 ?auto_40983 ) ) ( IS-CRATE ?auto_40979 ) ( not ( = ?auto_40967 ?auto_40984 ) ) ( not ( = ?auto_40968 ?auto_40984 ) ) ( not ( = ?auto_40970 ?auto_40984 ) ) ( not ( = ?auto_40979 ?auto_40984 ) ) ( not ( = ?auto_40983 ?auto_40984 ) ) ( not ( = ?auto_40969 ?auto_40975 ) ) ( not ( = ?auto_40978 ?auto_40969 ) ) ( not ( = ?auto_40987 ?auto_40969 ) ) ( HOIST-AT ?auto_40982 ?auto_40969 ) ( not ( = ?auto_40971 ?auto_40982 ) ) ( not ( = ?auto_40973 ?auto_40982 ) ) ( not ( = ?auto_40989 ?auto_40982 ) ) ( AVAILABLE ?auto_40982 ) ( SURFACE-AT ?auto_40979 ?auto_40969 ) ( ON ?auto_40979 ?auto_40977 ) ( CLEAR ?auto_40979 ) ( not ( = ?auto_40967 ?auto_40977 ) ) ( not ( = ?auto_40968 ?auto_40977 ) ) ( not ( = ?auto_40970 ?auto_40977 ) ) ( not ( = ?auto_40979 ?auto_40977 ) ) ( not ( = ?auto_40983 ?auto_40977 ) ) ( not ( = ?auto_40984 ?auto_40977 ) ) ( IS-CRATE ?auto_40984 ) ( not ( = ?auto_40967 ?auto_40981 ) ) ( not ( = ?auto_40968 ?auto_40981 ) ) ( not ( = ?auto_40970 ?auto_40981 ) ) ( not ( = ?auto_40979 ?auto_40981 ) ) ( not ( = ?auto_40983 ?auto_40981 ) ) ( not ( = ?auto_40984 ?auto_40981 ) ) ( not ( = ?auto_40977 ?auto_40981 ) ) ( not ( = ?auto_40980 ?auto_40975 ) ) ( not ( = ?auto_40978 ?auto_40980 ) ) ( not ( = ?auto_40987 ?auto_40980 ) ) ( not ( = ?auto_40969 ?auto_40980 ) ) ( HOIST-AT ?auto_40985 ?auto_40980 ) ( not ( = ?auto_40971 ?auto_40985 ) ) ( not ( = ?auto_40973 ?auto_40985 ) ) ( not ( = ?auto_40989 ?auto_40985 ) ) ( not ( = ?auto_40982 ?auto_40985 ) ) ( AVAILABLE ?auto_40985 ) ( SURFACE-AT ?auto_40984 ?auto_40980 ) ( ON ?auto_40984 ?auto_40972 ) ( CLEAR ?auto_40984 ) ( not ( = ?auto_40967 ?auto_40972 ) ) ( not ( = ?auto_40968 ?auto_40972 ) ) ( not ( = ?auto_40970 ?auto_40972 ) ) ( not ( = ?auto_40979 ?auto_40972 ) ) ( not ( = ?auto_40983 ?auto_40972 ) ) ( not ( = ?auto_40984 ?auto_40972 ) ) ( not ( = ?auto_40977 ?auto_40972 ) ) ( not ( = ?auto_40981 ?auto_40972 ) ) ( IS-CRATE ?auto_40981 ) ( not ( = ?auto_40967 ?auto_40974 ) ) ( not ( = ?auto_40968 ?auto_40974 ) ) ( not ( = ?auto_40970 ?auto_40974 ) ) ( not ( = ?auto_40979 ?auto_40974 ) ) ( not ( = ?auto_40983 ?auto_40974 ) ) ( not ( = ?auto_40984 ?auto_40974 ) ) ( not ( = ?auto_40977 ?auto_40974 ) ) ( not ( = ?auto_40981 ?auto_40974 ) ) ( not ( = ?auto_40972 ?auto_40974 ) ) ( not ( = ?auto_40990 ?auto_40975 ) ) ( not ( = ?auto_40978 ?auto_40990 ) ) ( not ( = ?auto_40987 ?auto_40990 ) ) ( not ( = ?auto_40969 ?auto_40990 ) ) ( not ( = ?auto_40980 ?auto_40990 ) ) ( HOIST-AT ?auto_40986 ?auto_40990 ) ( not ( = ?auto_40971 ?auto_40986 ) ) ( not ( = ?auto_40973 ?auto_40986 ) ) ( not ( = ?auto_40989 ?auto_40986 ) ) ( not ( = ?auto_40982 ?auto_40986 ) ) ( not ( = ?auto_40985 ?auto_40986 ) ) ( AVAILABLE ?auto_40986 ) ( SURFACE-AT ?auto_40981 ?auto_40990 ) ( ON ?auto_40981 ?auto_40988 ) ( CLEAR ?auto_40981 ) ( not ( = ?auto_40967 ?auto_40988 ) ) ( not ( = ?auto_40968 ?auto_40988 ) ) ( not ( = ?auto_40970 ?auto_40988 ) ) ( not ( = ?auto_40979 ?auto_40988 ) ) ( not ( = ?auto_40983 ?auto_40988 ) ) ( not ( = ?auto_40984 ?auto_40988 ) ) ( not ( = ?auto_40977 ?auto_40988 ) ) ( not ( = ?auto_40981 ?auto_40988 ) ) ( not ( = ?auto_40972 ?auto_40988 ) ) ( not ( = ?auto_40974 ?auto_40988 ) ) ( TRUCK-AT ?auto_40976 ?auto_40975 ) ( SURFACE-AT ?auto_40991 ?auto_40975 ) ( CLEAR ?auto_40991 ) ( LIFTING ?auto_40971 ?auto_40974 ) ( IS-CRATE ?auto_40974 ) ( not ( = ?auto_40967 ?auto_40991 ) ) ( not ( = ?auto_40968 ?auto_40991 ) ) ( not ( = ?auto_40970 ?auto_40991 ) ) ( not ( = ?auto_40979 ?auto_40991 ) ) ( not ( = ?auto_40983 ?auto_40991 ) ) ( not ( = ?auto_40984 ?auto_40991 ) ) ( not ( = ?auto_40977 ?auto_40991 ) ) ( not ( = ?auto_40981 ?auto_40991 ) ) ( not ( = ?auto_40972 ?auto_40991 ) ) ( not ( = ?auto_40974 ?auto_40991 ) ) ( not ( = ?auto_40988 ?auto_40991 ) ) )
    :subtasks
    ( ( !DROP ?auto_40971 ?auto_40974 ?auto_40991 ?auto_40975 )
      ( MAKE-ON ?auto_40967 ?auto_40968 )
      ( MAKE-ON-VERIFY ?auto_40967 ?auto_40968 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_40992 - SURFACE
      ?auto_40993 - SURFACE
    )
    :vars
    (
      ?auto_40995 - HOIST
      ?auto_40998 - PLACE
      ?auto_41013 - PLACE
      ?auto_41002 - HOIST
      ?auto_41001 - SURFACE
      ?auto_41012 - SURFACE
      ?auto_41008 - PLACE
      ?auto_41010 - HOIST
      ?auto_40994 - SURFACE
      ?auto_41004 - SURFACE
      ?auto_41005 - PLACE
      ?auto_41003 - HOIST
      ?auto_40996 - SURFACE
      ?auto_41016 - SURFACE
      ?auto_41006 - PLACE
      ?auto_40999 - HOIST
      ?auto_40997 - SURFACE
      ?auto_41015 - SURFACE
      ?auto_41011 - PLACE
      ?auto_41000 - HOIST
      ?auto_41009 - SURFACE
      ?auto_41014 - TRUCK
      ?auto_41007 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40995 ?auto_40998 ) ( IS-CRATE ?auto_40992 ) ( not ( = ?auto_40992 ?auto_40993 ) ) ( not ( = ?auto_41013 ?auto_40998 ) ) ( HOIST-AT ?auto_41002 ?auto_41013 ) ( not ( = ?auto_40995 ?auto_41002 ) ) ( AVAILABLE ?auto_41002 ) ( SURFACE-AT ?auto_40992 ?auto_41013 ) ( ON ?auto_40992 ?auto_41001 ) ( CLEAR ?auto_40992 ) ( not ( = ?auto_40992 ?auto_41001 ) ) ( not ( = ?auto_40993 ?auto_41001 ) ) ( IS-CRATE ?auto_40993 ) ( not ( = ?auto_40992 ?auto_41012 ) ) ( not ( = ?auto_40993 ?auto_41012 ) ) ( not ( = ?auto_41001 ?auto_41012 ) ) ( not ( = ?auto_41008 ?auto_40998 ) ) ( not ( = ?auto_41013 ?auto_41008 ) ) ( HOIST-AT ?auto_41010 ?auto_41008 ) ( not ( = ?auto_40995 ?auto_41010 ) ) ( not ( = ?auto_41002 ?auto_41010 ) ) ( AVAILABLE ?auto_41010 ) ( SURFACE-AT ?auto_40993 ?auto_41008 ) ( ON ?auto_40993 ?auto_40994 ) ( CLEAR ?auto_40993 ) ( not ( = ?auto_40992 ?auto_40994 ) ) ( not ( = ?auto_40993 ?auto_40994 ) ) ( not ( = ?auto_41001 ?auto_40994 ) ) ( not ( = ?auto_41012 ?auto_40994 ) ) ( IS-CRATE ?auto_41012 ) ( not ( = ?auto_40992 ?auto_41004 ) ) ( not ( = ?auto_40993 ?auto_41004 ) ) ( not ( = ?auto_41001 ?auto_41004 ) ) ( not ( = ?auto_41012 ?auto_41004 ) ) ( not ( = ?auto_40994 ?auto_41004 ) ) ( not ( = ?auto_41005 ?auto_40998 ) ) ( not ( = ?auto_41013 ?auto_41005 ) ) ( not ( = ?auto_41008 ?auto_41005 ) ) ( HOIST-AT ?auto_41003 ?auto_41005 ) ( not ( = ?auto_40995 ?auto_41003 ) ) ( not ( = ?auto_41002 ?auto_41003 ) ) ( not ( = ?auto_41010 ?auto_41003 ) ) ( AVAILABLE ?auto_41003 ) ( SURFACE-AT ?auto_41012 ?auto_41005 ) ( ON ?auto_41012 ?auto_40996 ) ( CLEAR ?auto_41012 ) ( not ( = ?auto_40992 ?auto_40996 ) ) ( not ( = ?auto_40993 ?auto_40996 ) ) ( not ( = ?auto_41001 ?auto_40996 ) ) ( not ( = ?auto_41012 ?auto_40996 ) ) ( not ( = ?auto_40994 ?auto_40996 ) ) ( not ( = ?auto_41004 ?auto_40996 ) ) ( IS-CRATE ?auto_41004 ) ( not ( = ?auto_40992 ?auto_41016 ) ) ( not ( = ?auto_40993 ?auto_41016 ) ) ( not ( = ?auto_41001 ?auto_41016 ) ) ( not ( = ?auto_41012 ?auto_41016 ) ) ( not ( = ?auto_40994 ?auto_41016 ) ) ( not ( = ?auto_41004 ?auto_41016 ) ) ( not ( = ?auto_40996 ?auto_41016 ) ) ( not ( = ?auto_41006 ?auto_40998 ) ) ( not ( = ?auto_41013 ?auto_41006 ) ) ( not ( = ?auto_41008 ?auto_41006 ) ) ( not ( = ?auto_41005 ?auto_41006 ) ) ( HOIST-AT ?auto_40999 ?auto_41006 ) ( not ( = ?auto_40995 ?auto_40999 ) ) ( not ( = ?auto_41002 ?auto_40999 ) ) ( not ( = ?auto_41010 ?auto_40999 ) ) ( not ( = ?auto_41003 ?auto_40999 ) ) ( AVAILABLE ?auto_40999 ) ( SURFACE-AT ?auto_41004 ?auto_41006 ) ( ON ?auto_41004 ?auto_40997 ) ( CLEAR ?auto_41004 ) ( not ( = ?auto_40992 ?auto_40997 ) ) ( not ( = ?auto_40993 ?auto_40997 ) ) ( not ( = ?auto_41001 ?auto_40997 ) ) ( not ( = ?auto_41012 ?auto_40997 ) ) ( not ( = ?auto_40994 ?auto_40997 ) ) ( not ( = ?auto_41004 ?auto_40997 ) ) ( not ( = ?auto_40996 ?auto_40997 ) ) ( not ( = ?auto_41016 ?auto_40997 ) ) ( IS-CRATE ?auto_41016 ) ( not ( = ?auto_40992 ?auto_41015 ) ) ( not ( = ?auto_40993 ?auto_41015 ) ) ( not ( = ?auto_41001 ?auto_41015 ) ) ( not ( = ?auto_41012 ?auto_41015 ) ) ( not ( = ?auto_40994 ?auto_41015 ) ) ( not ( = ?auto_41004 ?auto_41015 ) ) ( not ( = ?auto_40996 ?auto_41015 ) ) ( not ( = ?auto_41016 ?auto_41015 ) ) ( not ( = ?auto_40997 ?auto_41015 ) ) ( not ( = ?auto_41011 ?auto_40998 ) ) ( not ( = ?auto_41013 ?auto_41011 ) ) ( not ( = ?auto_41008 ?auto_41011 ) ) ( not ( = ?auto_41005 ?auto_41011 ) ) ( not ( = ?auto_41006 ?auto_41011 ) ) ( HOIST-AT ?auto_41000 ?auto_41011 ) ( not ( = ?auto_40995 ?auto_41000 ) ) ( not ( = ?auto_41002 ?auto_41000 ) ) ( not ( = ?auto_41010 ?auto_41000 ) ) ( not ( = ?auto_41003 ?auto_41000 ) ) ( not ( = ?auto_40999 ?auto_41000 ) ) ( AVAILABLE ?auto_41000 ) ( SURFACE-AT ?auto_41016 ?auto_41011 ) ( ON ?auto_41016 ?auto_41009 ) ( CLEAR ?auto_41016 ) ( not ( = ?auto_40992 ?auto_41009 ) ) ( not ( = ?auto_40993 ?auto_41009 ) ) ( not ( = ?auto_41001 ?auto_41009 ) ) ( not ( = ?auto_41012 ?auto_41009 ) ) ( not ( = ?auto_40994 ?auto_41009 ) ) ( not ( = ?auto_41004 ?auto_41009 ) ) ( not ( = ?auto_40996 ?auto_41009 ) ) ( not ( = ?auto_41016 ?auto_41009 ) ) ( not ( = ?auto_40997 ?auto_41009 ) ) ( not ( = ?auto_41015 ?auto_41009 ) ) ( TRUCK-AT ?auto_41014 ?auto_40998 ) ( SURFACE-AT ?auto_41007 ?auto_40998 ) ( CLEAR ?auto_41007 ) ( IS-CRATE ?auto_41015 ) ( not ( = ?auto_40992 ?auto_41007 ) ) ( not ( = ?auto_40993 ?auto_41007 ) ) ( not ( = ?auto_41001 ?auto_41007 ) ) ( not ( = ?auto_41012 ?auto_41007 ) ) ( not ( = ?auto_40994 ?auto_41007 ) ) ( not ( = ?auto_41004 ?auto_41007 ) ) ( not ( = ?auto_40996 ?auto_41007 ) ) ( not ( = ?auto_41016 ?auto_41007 ) ) ( not ( = ?auto_40997 ?auto_41007 ) ) ( not ( = ?auto_41015 ?auto_41007 ) ) ( not ( = ?auto_41009 ?auto_41007 ) ) ( AVAILABLE ?auto_40995 ) ( IN ?auto_41015 ?auto_41014 ) )
    :subtasks
    ( ( !UNLOAD ?auto_40995 ?auto_41015 ?auto_41014 ?auto_40998 )
      ( MAKE-ON ?auto_40992 ?auto_40993 )
      ( MAKE-ON-VERIFY ?auto_40992 ?auto_40993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41017 - SURFACE
      ?auto_41018 - SURFACE
    )
    :vars
    (
      ?auto_41031 - HOIST
      ?auto_41027 - PLACE
      ?auto_41030 - PLACE
      ?auto_41029 - HOIST
      ?auto_41023 - SURFACE
      ?auto_41034 - SURFACE
      ?auto_41019 - PLACE
      ?auto_41026 - HOIST
      ?auto_41036 - SURFACE
      ?auto_41022 - SURFACE
      ?auto_41024 - PLACE
      ?auto_41041 - HOIST
      ?auto_41033 - SURFACE
      ?auto_41037 - SURFACE
      ?auto_41020 - PLACE
      ?auto_41032 - HOIST
      ?auto_41039 - SURFACE
      ?auto_41028 - SURFACE
      ?auto_41035 - PLACE
      ?auto_41040 - HOIST
      ?auto_41038 - SURFACE
      ?auto_41025 - SURFACE
      ?auto_41021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41031 ?auto_41027 ) ( IS-CRATE ?auto_41017 ) ( not ( = ?auto_41017 ?auto_41018 ) ) ( not ( = ?auto_41030 ?auto_41027 ) ) ( HOIST-AT ?auto_41029 ?auto_41030 ) ( not ( = ?auto_41031 ?auto_41029 ) ) ( AVAILABLE ?auto_41029 ) ( SURFACE-AT ?auto_41017 ?auto_41030 ) ( ON ?auto_41017 ?auto_41023 ) ( CLEAR ?auto_41017 ) ( not ( = ?auto_41017 ?auto_41023 ) ) ( not ( = ?auto_41018 ?auto_41023 ) ) ( IS-CRATE ?auto_41018 ) ( not ( = ?auto_41017 ?auto_41034 ) ) ( not ( = ?auto_41018 ?auto_41034 ) ) ( not ( = ?auto_41023 ?auto_41034 ) ) ( not ( = ?auto_41019 ?auto_41027 ) ) ( not ( = ?auto_41030 ?auto_41019 ) ) ( HOIST-AT ?auto_41026 ?auto_41019 ) ( not ( = ?auto_41031 ?auto_41026 ) ) ( not ( = ?auto_41029 ?auto_41026 ) ) ( AVAILABLE ?auto_41026 ) ( SURFACE-AT ?auto_41018 ?auto_41019 ) ( ON ?auto_41018 ?auto_41036 ) ( CLEAR ?auto_41018 ) ( not ( = ?auto_41017 ?auto_41036 ) ) ( not ( = ?auto_41018 ?auto_41036 ) ) ( not ( = ?auto_41023 ?auto_41036 ) ) ( not ( = ?auto_41034 ?auto_41036 ) ) ( IS-CRATE ?auto_41034 ) ( not ( = ?auto_41017 ?auto_41022 ) ) ( not ( = ?auto_41018 ?auto_41022 ) ) ( not ( = ?auto_41023 ?auto_41022 ) ) ( not ( = ?auto_41034 ?auto_41022 ) ) ( not ( = ?auto_41036 ?auto_41022 ) ) ( not ( = ?auto_41024 ?auto_41027 ) ) ( not ( = ?auto_41030 ?auto_41024 ) ) ( not ( = ?auto_41019 ?auto_41024 ) ) ( HOIST-AT ?auto_41041 ?auto_41024 ) ( not ( = ?auto_41031 ?auto_41041 ) ) ( not ( = ?auto_41029 ?auto_41041 ) ) ( not ( = ?auto_41026 ?auto_41041 ) ) ( AVAILABLE ?auto_41041 ) ( SURFACE-AT ?auto_41034 ?auto_41024 ) ( ON ?auto_41034 ?auto_41033 ) ( CLEAR ?auto_41034 ) ( not ( = ?auto_41017 ?auto_41033 ) ) ( not ( = ?auto_41018 ?auto_41033 ) ) ( not ( = ?auto_41023 ?auto_41033 ) ) ( not ( = ?auto_41034 ?auto_41033 ) ) ( not ( = ?auto_41036 ?auto_41033 ) ) ( not ( = ?auto_41022 ?auto_41033 ) ) ( IS-CRATE ?auto_41022 ) ( not ( = ?auto_41017 ?auto_41037 ) ) ( not ( = ?auto_41018 ?auto_41037 ) ) ( not ( = ?auto_41023 ?auto_41037 ) ) ( not ( = ?auto_41034 ?auto_41037 ) ) ( not ( = ?auto_41036 ?auto_41037 ) ) ( not ( = ?auto_41022 ?auto_41037 ) ) ( not ( = ?auto_41033 ?auto_41037 ) ) ( not ( = ?auto_41020 ?auto_41027 ) ) ( not ( = ?auto_41030 ?auto_41020 ) ) ( not ( = ?auto_41019 ?auto_41020 ) ) ( not ( = ?auto_41024 ?auto_41020 ) ) ( HOIST-AT ?auto_41032 ?auto_41020 ) ( not ( = ?auto_41031 ?auto_41032 ) ) ( not ( = ?auto_41029 ?auto_41032 ) ) ( not ( = ?auto_41026 ?auto_41032 ) ) ( not ( = ?auto_41041 ?auto_41032 ) ) ( AVAILABLE ?auto_41032 ) ( SURFACE-AT ?auto_41022 ?auto_41020 ) ( ON ?auto_41022 ?auto_41039 ) ( CLEAR ?auto_41022 ) ( not ( = ?auto_41017 ?auto_41039 ) ) ( not ( = ?auto_41018 ?auto_41039 ) ) ( not ( = ?auto_41023 ?auto_41039 ) ) ( not ( = ?auto_41034 ?auto_41039 ) ) ( not ( = ?auto_41036 ?auto_41039 ) ) ( not ( = ?auto_41022 ?auto_41039 ) ) ( not ( = ?auto_41033 ?auto_41039 ) ) ( not ( = ?auto_41037 ?auto_41039 ) ) ( IS-CRATE ?auto_41037 ) ( not ( = ?auto_41017 ?auto_41028 ) ) ( not ( = ?auto_41018 ?auto_41028 ) ) ( not ( = ?auto_41023 ?auto_41028 ) ) ( not ( = ?auto_41034 ?auto_41028 ) ) ( not ( = ?auto_41036 ?auto_41028 ) ) ( not ( = ?auto_41022 ?auto_41028 ) ) ( not ( = ?auto_41033 ?auto_41028 ) ) ( not ( = ?auto_41037 ?auto_41028 ) ) ( not ( = ?auto_41039 ?auto_41028 ) ) ( not ( = ?auto_41035 ?auto_41027 ) ) ( not ( = ?auto_41030 ?auto_41035 ) ) ( not ( = ?auto_41019 ?auto_41035 ) ) ( not ( = ?auto_41024 ?auto_41035 ) ) ( not ( = ?auto_41020 ?auto_41035 ) ) ( HOIST-AT ?auto_41040 ?auto_41035 ) ( not ( = ?auto_41031 ?auto_41040 ) ) ( not ( = ?auto_41029 ?auto_41040 ) ) ( not ( = ?auto_41026 ?auto_41040 ) ) ( not ( = ?auto_41041 ?auto_41040 ) ) ( not ( = ?auto_41032 ?auto_41040 ) ) ( AVAILABLE ?auto_41040 ) ( SURFACE-AT ?auto_41037 ?auto_41035 ) ( ON ?auto_41037 ?auto_41038 ) ( CLEAR ?auto_41037 ) ( not ( = ?auto_41017 ?auto_41038 ) ) ( not ( = ?auto_41018 ?auto_41038 ) ) ( not ( = ?auto_41023 ?auto_41038 ) ) ( not ( = ?auto_41034 ?auto_41038 ) ) ( not ( = ?auto_41036 ?auto_41038 ) ) ( not ( = ?auto_41022 ?auto_41038 ) ) ( not ( = ?auto_41033 ?auto_41038 ) ) ( not ( = ?auto_41037 ?auto_41038 ) ) ( not ( = ?auto_41039 ?auto_41038 ) ) ( not ( = ?auto_41028 ?auto_41038 ) ) ( SURFACE-AT ?auto_41025 ?auto_41027 ) ( CLEAR ?auto_41025 ) ( IS-CRATE ?auto_41028 ) ( not ( = ?auto_41017 ?auto_41025 ) ) ( not ( = ?auto_41018 ?auto_41025 ) ) ( not ( = ?auto_41023 ?auto_41025 ) ) ( not ( = ?auto_41034 ?auto_41025 ) ) ( not ( = ?auto_41036 ?auto_41025 ) ) ( not ( = ?auto_41022 ?auto_41025 ) ) ( not ( = ?auto_41033 ?auto_41025 ) ) ( not ( = ?auto_41037 ?auto_41025 ) ) ( not ( = ?auto_41039 ?auto_41025 ) ) ( not ( = ?auto_41028 ?auto_41025 ) ) ( not ( = ?auto_41038 ?auto_41025 ) ) ( AVAILABLE ?auto_41031 ) ( IN ?auto_41028 ?auto_41021 ) ( TRUCK-AT ?auto_41021 ?auto_41020 ) )
    :subtasks
    ( ( !DRIVE ?auto_41021 ?auto_41020 ?auto_41027 )
      ( MAKE-ON ?auto_41017 ?auto_41018 )
      ( MAKE-ON-VERIFY ?auto_41017 ?auto_41018 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41042 - SURFACE
      ?auto_41043 - SURFACE
    )
    :vars
    (
      ?auto_41051 - HOIST
      ?auto_41045 - PLACE
      ?auto_41050 - PLACE
      ?auto_41054 - HOIST
      ?auto_41059 - SURFACE
      ?auto_41053 - SURFACE
      ?auto_41066 - PLACE
      ?auto_41057 - HOIST
      ?auto_41048 - SURFACE
      ?auto_41046 - SURFACE
      ?auto_41044 - PLACE
      ?auto_41065 - HOIST
      ?auto_41058 - SURFACE
      ?auto_41049 - SURFACE
      ?auto_41056 - PLACE
      ?auto_41060 - HOIST
      ?auto_41063 - SURFACE
      ?auto_41061 - SURFACE
      ?auto_41047 - PLACE
      ?auto_41064 - HOIST
      ?auto_41062 - SURFACE
      ?auto_41055 - SURFACE
      ?auto_41052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41051 ?auto_41045 ) ( IS-CRATE ?auto_41042 ) ( not ( = ?auto_41042 ?auto_41043 ) ) ( not ( = ?auto_41050 ?auto_41045 ) ) ( HOIST-AT ?auto_41054 ?auto_41050 ) ( not ( = ?auto_41051 ?auto_41054 ) ) ( AVAILABLE ?auto_41054 ) ( SURFACE-AT ?auto_41042 ?auto_41050 ) ( ON ?auto_41042 ?auto_41059 ) ( CLEAR ?auto_41042 ) ( not ( = ?auto_41042 ?auto_41059 ) ) ( not ( = ?auto_41043 ?auto_41059 ) ) ( IS-CRATE ?auto_41043 ) ( not ( = ?auto_41042 ?auto_41053 ) ) ( not ( = ?auto_41043 ?auto_41053 ) ) ( not ( = ?auto_41059 ?auto_41053 ) ) ( not ( = ?auto_41066 ?auto_41045 ) ) ( not ( = ?auto_41050 ?auto_41066 ) ) ( HOIST-AT ?auto_41057 ?auto_41066 ) ( not ( = ?auto_41051 ?auto_41057 ) ) ( not ( = ?auto_41054 ?auto_41057 ) ) ( AVAILABLE ?auto_41057 ) ( SURFACE-AT ?auto_41043 ?auto_41066 ) ( ON ?auto_41043 ?auto_41048 ) ( CLEAR ?auto_41043 ) ( not ( = ?auto_41042 ?auto_41048 ) ) ( not ( = ?auto_41043 ?auto_41048 ) ) ( not ( = ?auto_41059 ?auto_41048 ) ) ( not ( = ?auto_41053 ?auto_41048 ) ) ( IS-CRATE ?auto_41053 ) ( not ( = ?auto_41042 ?auto_41046 ) ) ( not ( = ?auto_41043 ?auto_41046 ) ) ( not ( = ?auto_41059 ?auto_41046 ) ) ( not ( = ?auto_41053 ?auto_41046 ) ) ( not ( = ?auto_41048 ?auto_41046 ) ) ( not ( = ?auto_41044 ?auto_41045 ) ) ( not ( = ?auto_41050 ?auto_41044 ) ) ( not ( = ?auto_41066 ?auto_41044 ) ) ( HOIST-AT ?auto_41065 ?auto_41044 ) ( not ( = ?auto_41051 ?auto_41065 ) ) ( not ( = ?auto_41054 ?auto_41065 ) ) ( not ( = ?auto_41057 ?auto_41065 ) ) ( AVAILABLE ?auto_41065 ) ( SURFACE-AT ?auto_41053 ?auto_41044 ) ( ON ?auto_41053 ?auto_41058 ) ( CLEAR ?auto_41053 ) ( not ( = ?auto_41042 ?auto_41058 ) ) ( not ( = ?auto_41043 ?auto_41058 ) ) ( not ( = ?auto_41059 ?auto_41058 ) ) ( not ( = ?auto_41053 ?auto_41058 ) ) ( not ( = ?auto_41048 ?auto_41058 ) ) ( not ( = ?auto_41046 ?auto_41058 ) ) ( IS-CRATE ?auto_41046 ) ( not ( = ?auto_41042 ?auto_41049 ) ) ( not ( = ?auto_41043 ?auto_41049 ) ) ( not ( = ?auto_41059 ?auto_41049 ) ) ( not ( = ?auto_41053 ?auto_41049 ) ) ( not ( = ?auto_41048 ?auto_41049 ) ) ( not ( = ?auto_41046 ?auto_41049 ) ) ( not ( = ?auto_41058 ?auto_41049 ) ) ( not ( = ?auto_41056 ?auto_41045 ) ) ( not ( = ?auto_41050 ?auto_41056 ) ) ( not ( = ?auto_41066 ?auto_41056 ) ) ( not ( = ?auto_41044 ?auto_41056 ) ) ( HOIST-AT ?auto_41060 ?auto_41056 ) ( not ( = ?auto_41051 ?auto_41060 ) ) ( not ( = ?auto_41054 ?auto_41060 ) ) ( not ( = ?auto_41057 ?auto_41060 ) ) ( not ( = ?auto_41065 ?auto_41060 ) ) ( SURFACE-AT ?auto_41046 ?auto_41056 ) ( ON ?auto_41046 ?auto_41063 ) ( CLEAR ?auto_41046 ) ( not ( = ?auto_41042 ?auto_41063 ) ) ( not ( = ?auto_41043 ?auto_41063 ) ) ( not ( = ?auto_41059 ?auto_41063 ) ) ( not ( = ?auto_41053 ?auto_41063 ) ) ( not ( = ?auto_41048 ?auto_41063 ) ) ( not ( = ?auto_41046 ?auto_41063 ) ) ( not ( = ?auto_41058 ?auto_41063 ) ) ( not ( = ?auto_41049 ?auto_41063 ) ) ( IS-CRATE ?auto_41049 ) ( not ( = ?auto_41042 ?auto_41061 ) ) ( not ( = ?auto_41043 ?auto_41061 ) ) ( not ( = ?auto_41059 ?auto_41061 ) ) ( not ( = ?auto_41053 ?auto_41061 ) ) ( not ( = ?auto_41048 ?auto_41061 ) ) ( not ( = ?auto_41046 ?auto_41061 ) ) ( not ( = ?auto_41058 ?auto_41061 ) ) ( not ( = ?auto_41049 ?auto_41061 ) ) ( not ( = ?auto_41063 ?auto_41061 ) ) ( not ( = ?auto_41047 ?auto_41045 ) ) ( not ( = ?auto_41050 ?auto_41047 ) ) ( not ( = ?auto_41066 ?auto_41047 ) ) ( not ( = ?auto_41044 ?auto_41047 ) ) ( not ( = ?auto_41056 ?auto_41047 ) ) ( HOIST-AT ?auto_41064 ?auto_41047 ) ( not ( = ?auto_41051 ?auto_41064 ) ) ( not ( = ?auto_41054 ?auto_41064 ) ) ( not ( = ?auto_41057 ?auto_41064 ) ) ( not ( = ?auto_41065 ?auto_41064 ) ) ( not ( = ?auto_41060 ?auto_41064 ) ) ( AVAILABLE ?auto_41064 ) ( SURFACE-AT ?auto_41049 ?auto_41047 ) ( ON ?auto_41049 ?auto_41062 ) ( CLEAR ?auto_41049 ) ( not ( = ?auto_41042 ?auto_41062 ) ) ( not ( = ?auto_41043 ?auto_41062 ) ) ( not ( = ?auto_41059 ?auto_41062 ) ) ( not ( = ?auto_41053 ?auto_41062 ) ) ( not ( = ?auto_41048 ?auto_41062 ) ) ( not ( = ?auto_41046 ?auto_41062 ) ) ( not ( = ?auto_41058 ?auto_41062 ) ) ( not ( = ?auto_41049 ?auto_41062 ) ) ( not ( = ?auto_41063 ?auto_41062 ) ) ( not ( = ?auto_41061 ?auto_41062 ) ) ( SURFACE-AT ?auto_41055 ?auto_41045 ) ( CLEAR ?auto_41055 ) ( IS-CRATE ?auto_41061 ) ( not ( = ?auto_41042 ?auto_41055 ) ) ( not ( = ?auto_41043 ?auto_41055 ) ) ( not ( = ?auto_41059 ?auto_41055 ) ) ( not ( = ?auto_41053 ?auto_41055 ) ) ( not ( = ?auto_41048 ?auto_41055 ) ) ( not ( = ?auto_41046 ?auto_41055 ) ) ( not ( = ?auto_41058 ?auto_41055 ) ) ( not ( = ?auto_41049 ?auto_41055 ) ) ( not ( = ?auto_41063 ?auto_41055 ) ) ( not ( = ?auto_41061 ?auto_41055 ) ) ( not ( = ?auto_41062 ?auto_41055 ) ) ( AVAILABLE ?auto_41051 ) ( TRUCK-AT ?auto_41052 ?auto_41056 ) ( LIFTING ?auto_41060 ?auto_41061 ) )
    :subtasks
    ( ( !LOAD ?auto_41060 ?auto_41061 ?auto_41052 ?auto_41056 )
      ( MAKE-ON ?auto_41042 ?auto_41043 )
      ( MAKE-ON-VERIFY ?auto_41042 ?auto_41043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41067 - SURFACE
      ?auto_41068 - SURFACE
    )
    :vars
    (
      ?auto_41072 - HOIST
      ?auto_41084 - PLACE
      ?auto_41078 - PLACE
      ?auto_41087 - HOIST
      ?auto_41069 - SURFACE
      ?auto_41080 - SURFACE
      ?auto_41091 - PLACE
      ?auto_41079 - HOIST
      ?auto_41081 - SURFACE
      ?auto_41085 - SURFACE
      ?auto_41074 - PLACE
      ?auto_41090 - HOIST
      ?auto_41075 - SURFACE
      ?auto_41071 - SURFACE
      ?auto_41082 - PLACE
      ?auto_41076 - HOIST
      ?auto_41088 - SURFACE
      ?auto_41077 - SURFACE
      ?auto_41083 - PLACE
      ?auto_41089 - HOIST
      ?auto_41073 - SURFACE
      ?auto_41086 - SURFACE
      ?auto_41070 - TRUCK
      ?auto_41092 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41072 ?auto_41084 ) ( IS-CRATE ?auto_41067 ) ( not ( = ?auto_41067 ?auto_41068 ) ) ( not ( = ?auto_41078 ?auto_41084 ) ) ( HOIST-AT ?auto_41087 ?auto_41078 ) ( not ( = ?auto_41072 ?auto_41087 ) ) ( AVAILABLE ?auto_41087 ) ( SURFACE-AT ?auto_41067 ?auto_41078 ) ( ON ?auto_41067 ?auto_41069 ) ( CLEAR ?auto_41067 ) ( not ( = ?auto_41067 ?auto_41069 ) ) ( not ( = ?auto_41068 ?auto_41069 ) ) ( IS-CRATE ?auto_41068 ) ( not ( = ?auto_41067 ?auto_41080 ) ) ( not ( = ?auto_41068 ?auto_41080 ) ) ( not ( = ?auto_41069 ?auto_41080 ) ) ( not ( = ?auto_41091 ?auto_41084 ) ) ( not ( = ?auto_41078 ?auto_41091 ) ) ( HOIST-AT ?auto_41079 ?auto_41091 ) ( not ( = ?auto_41072 ?auto_41079 ) ) ( not ( = ?auto_41087 ?auto_41079 ) ) ( AVAILABLE ?auto_41079 ) ( SURFACE-AT ?auto_41068 ?auto_41091 ) ( ON ?auto_41068 ?auto_41081 ) ( CLEAR ?auto_41068 ) ( not ( = ?auto_41067 ?auto_41081 ) ) ( not ( = ?auto_41068 ?auto_41081 ) ) ( not ( = ?auto_41069 ?auto_41081 ) ) ( not ( = ?auto_41080 ?auto_41081 ) ) ( IS-CRATE ?auto_41080 ) ( not ( = ?auto_41067 ?auto_41085 ) ) ( not ( = ?auto_41068 ?auto_41085 ) ) ( not ( = ?auto_41069 ?auto_41085 ) ) ( not ( = ?auto_41080 ?auto_41085 ) ) ( not ( = ?auto_41081 ?auto_41085 ) ) ( not ( = ?auto_41074 ?auto_41084 ) ) ( not ( = ?auto_41078 ?auto_41074 ) ) ( not ( = ?auto_41091 ?auto_41074 ) ) ( HOIST-AT ?auto_41090 ?auto_41074 ) ( not ( = ?auto_41072 ?auto_41090 ) ) ( not ( = ?auto_41087 ?auto_41090 ) ) ( not ( = ?auto_41079 ?auto_41090 ) ) ( AVAILABLE ?auto_41090 ) ( SURFACE-AT ?auto_41080 ?auto_41074 ) ( ON ?auto_41080 ?auto_41075 ) ( CLEAR ?auto_41080 ) ( not ( = ?auto_41067 ?auto_41075 ) ) ( not ( = ?auto_41068 ?auto_41075 ) ) ( not ( = ?auto_41069 ?auto_41075 ) ) ( not ( = ?auto_41080 ?auto_41075 ) ) ( not ( = ?auto_41081 ?auto_41075 ) ) ( not ( = ?auto_41085 ?auto_41075 ) ) ( IS-CRATE ?auto_41085 ) ( not ( = ?auto_41067 ?auto_41071 ) ) ( not ( = ?auto_41068 ?auto_41071 ) ) ( not ( = ?auto_41069 ?auto_41071 ) ) ( not ( = ?auto_41080 ?auto_41071 ) ) ( not ( = ?auto_41081 ?auto_41071 ) ) ( not ( = ?auto_41085 ?auto_41071 ) ) ( not ( = ?auto_41075 ?auto_41071 ) ) ( not ( = ?auto_41082 ?auto_41084 ) ) ( not ( = ?auto_41078 ?auto_41082 ) ) ( not ( = ?auto_41091 ?auto_41082 ) ) ( not ( = ?auto_41074 ?auto_41082 ) ) ( HOIST-AT ?auto_41076 ?auto_41082 ) ( not ( = ?auto_41072 ?auto_41076 ) ) ( not ( = ?auto_41087 ?auto_41076 ) ) ( not ( = ?auto_41079 ?auto_41076 ) ) ( not ( = ?auto_41090 ?auto_41076 ) ) ( SURFACE-AT ?auto_41085 ?auto_41082 ) ( ON ?auto_41085 ?auto_41088 ) ( CLEAR ?auto_41085 ) ( not ( = ?auto_41067 ?auto_41088 ) ) ( not ( = ?auto_41068 ?auto_41088 ) ) ( not ( = ?auto_41069 ?auto_41088 ) ) ( not ( = ?auto_41080 ?auto_41088 ) ) ( not ( = ?auto_41081 ?auto_41088 ) ) ( not ( = ?auto_41085 ?auto_41088 ) ) ( not ( = ?auto_41075 ?auto_41088 ) ) ( not ( = ?auto_41071 ?auto_41088 ) ) ( IS-CRATE ?auto_41071 ) ( not ( = ?auto_41067 ?auto_41077 ) ) ( not ( = ?auto_41068 ?auto_41077 ) ) ( not ( = ?auto_41069 ?auto_41077 ) ) ( not ( = ?auto_41080 ?auto_41077 ) ) ( not ( = ?auto_41081 ?auto_41077 ) ) ( not ( = ?auto_41085 ?auto_41077 ) ) ( not ( = ?auto_41075 ?auto_41077 ) ) ( not ( = ?auto_41071 ?auto_41077 ) ) ( not ( = ?auto_41088 ?auto_41077 ) ) ( not ( = ?auto_41083 ?auto_41084 ) ) ( not ( = ?auto_41078 ?auto_41083 ) ) ( not ( = ?auto_41091 ?auto_41083 ) ) ( not ( = ?auto_41074 ?auto_41083 ) ) ( not ( = ?auto_41082 ?auto_41083 ) ) ( HOIST-AT ?auto_41089 ?auto_41083 ) ( not ( = ?auto_41072 ?auto_41089 ) ) ( not ( = ?auto_41087 ?auto_41089 ) ) ( not ( = ?auto_41079 ?auto_41089 ) ) ( not ( = ?auto_41090 ?auto_41089 ) ) ( not ( = ?auto_41076 ?auto_41089 ) ) ( AVAILABLE ?auto_41089 ) ( SURFACE-AT ?auto_41071 ?auto_41083 ) ( ON ?auto_41071 ?auto_41073 ) ( CLEAR ?auto_41071 ) ( not ( = ?auto_41067 ?auto_41073 ) ) ( not ( = ?auto_41068 ?auto_41073 ) ) ( not ( = ?auto_41069 ?auto_41073 ) ) ( not ( = ?auto_41080 ?auto_41073 ) ) ( not ( = ?auto_41081 ?auto_41073 ) ) ( not ( = ?auto_41085 ?auto_41073 ) ) ( not ( = ?auto_41075 ?auto_41073 ) ) ( not ( = ?auto_41071 ?auto_41073 ) ) ( not ( = ?auto_41088 ?auto_41073 ) ) ( not ( = ?auto_41077 ?auto_41073 ) ) ( SURFACE-AT ?auto_41086 ?auto_41084 ) ( CLEAR ?auto_41086 ) ( IS-CRATE ?auto_41077 ) ( not ( = ?auto_41067 ?auto_41086 ) ) ( not ( = ?auto_41068 ?auto_41086 ) ) ( not ( = ?auto_41069 ?auto_41086 ) ) ( not ( = ?auto_41080 ?auto_41086 ) ) ( not ( = ?auto_41081 ?auto_41086 ) ) ( not ( = ?auto_41085 ?auto_41086 ) ) ( not ( = ?auto_41075 ?auto_41086 ) ) ( not ( = ?auto_41071 ?auto_41086 ) ) ( not ( = ?auto_41088 ?auto_41086 ) ) ( not ( = ?auto_41077 ?auto_41086 ) ) ( not ( = ?auto_41073 ?auto_41086 ) ) ( AVAILABLE ?auto_41072 ) ( TRUCK-AT ?auto_41070 ?auto_41082 ) ( AVAILABLE ?auto_41076 ) ( SURFACE-AT ?auto_41077 ?auto_41082 ) ( ON ?auto_41077 ?auto_41092 ) ( CLEAR ?auto_41077 ) ( not ( = ?auto_41067 ?auto_41092 ) ) ( not ( = ?auto_41068 ?auto_41092 ) ) ( not ( = ?auto_41069 ?auto_41092 ) ) ( not ( = ?auto_41080 ?auto_41092 ) ) ( not ( = ?auto_41081 ?auto_41092 ) ) ( not ( = ?auto_41085 ?auto_41092 ) ) ( not ( = ?auto_41075 ?auto_41092 ) ) ( not ( = ?auto_41071 ?auto_41092 ) ) ( not ( = ?auto_41088 ?auto_41092 ) ) ( not ( = ?auto_41077 ?auto_41092 ) ) ( not ( = ?auto_41073 ?auto_41092 ) ) ( not ( = ?auto_41086 ?auto_41092 ) ) )
    :subtasks
    ( ( !LIFT ?auto_41076 ?auto_41077 ?auto_41092 ?auto_41082 )
      ( MAKE-ON ?auto_41067 ?auto_41068 )
      ( MAKE-ON-VERIFY ?auto_41067 ?auto_41068 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41093 - SURFACE
      ?auto_41094 - SURFACE
    )
    :vars
    (
      ?auto_41109 - HOIST
      ?auto_41106 - PLACE
      ?auto_41111 - PLACE
      ?auto_41117 - HOIST
      ?auto_41107 - SURFACE
      ?auto_41097 - SURFACE
      ?auto_41105 - PLACE
      ?auto_41112 - HOIST
      ?auto_41098 - SURFACE
      ?auto_41113 - SURFACE
      ?auto_41114 - PLACE
      ?auto_41104 - HOIST
      ?auto_41101 - SURFACE
      ?auto_41110 - SURFACE
      ?auto_41116 - PLACE
      ?auto_41115 - HOIST
      ?auto_41095 - SURFACE
      ?auto_41103 - SURFACE
      ?auto_41100 - PLACE
      ?auto_41096 - HOIST
      ?auto_41108 - SURFACE
      ?auto_41118 - SURFACE
      ?auto_41099 - SURFACE
      ?auto_41102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41109 ?auto_41106 ) ( IS-CRATE ?auto_41093 ) ( not ( = ?auto_41093 ?auto_41094 ) ) ( not ( = ?auto_41111 ?auto_41106 ) ) ( HOIST-AT ?auto_41117 ?auto_41111 ) ( not ( = ?auto_41109 ?auto_41117 ) ) ( AVAILABLE ?auto_41117 ) ( SURFACE-AT ?auto_41093 ?auto_41111 ) ( ON ?auto_41093 ?auto_41107 ) ( CLEAR ?auto_41093 ) ( not ( = ?auto_41093 ?auto_41107 ) ) ( not ( = ?auto_41094 ?auto_41107 ) ) ( IS-CRATE ?auto_41094 ) ( not ( = ?auto_41093 ?auto_41097 ) ) ( not ( = ?auto_41094 ?auto_41097 ) ) ( not ( = ?auto_41107 ?auto_41097 ) ) ( not ( = ?auto_41105 ?auto_41106 ) ) ( not ( = ?auto_41111 ?auto_41105 ) ) ( HOIST-AT ?auto_41112 ?auto_41105 ) ( not ( = ?auto_41109 ?auto_41112 ) ) ( not ( = ?auto_41117 ?auto_41112 ) ) ( AVAILABLE ?auto_41112 ) ( SURFACE-AT ?auto_41094 ?auto_41105 ) ( ON ?auto_41094 ?auto_41098 ) ( CLEAR ?auto_41094 ) ( not ( = ?auto_41093 ?auto_41098 ) ) ( not ( = ?auto_41094 ?auto_41098 ) ) ( not ( = ?auto_41107 ?auto_41098 ) ) ( not ( = ?auto_41097 ?auto_41098 ) ) ( IS-CRATE ?auto_41097 ) ( not ( = ?auto_41093 ?auto_41113 ) ) ( not ( = ?auto_41094 ?auto_41113 ) ) ( not ( = ?auto_41107 ?auto_41113 ) ) ( not ( = ?auto_41097 ?auto_41113 ) ) ( not ( = ?auto_41098 ?auto_41113 ) ) ( not ( = ?auto_41114 ?auto_41106 ) ) ( not ( = ?auto_41111 ?auto_41114 ) ) ( not ( = ?auto_41105 ?auto_41114 ) ) ( HOIST-AT ?auto_41104 ?auto_41114 ) ( not ( = ?auto_41109 ?auto_41104 ) ) ( not ( = ?auto_41117 ?auto_41104 ) ) ( not ( = ?auto_41112 ?auto_41104 ) ) ( AVAILABLE ?auto_41104 ) ( SURFACE-AT ?auto_41097 ?auto_41114 ) ( ON ?auto_41097 ?auto_41101 ) ( CLEAR ?auto_41097 ) ( not ( = ?auto_41093 ?auto_41101 ) ) ( not ( = ?auto_41094 ?auto_41101 ) ) ( not ( = ?auto_41107 ?auto_41101 ) ) ( not ( = ?auto_41097 ?auto_41101 ) ) ( not ( = ?auto_41098 ?auto_41101 ) ) ( not ( = ?auto_41113 ?auto_41101 ) ) ( IS-CRATE ?auto_41113 ) ( not ( = ?auto_41093 ?auto_41110 ) ) ( not ( = ?auto_41094 ?auto_41110 ) ) ( not ( = ?auto_41107 ?auto_41110 ) ) ( not ( = ?auto_41097 ?auto_41110 ) ) ( not ( = ?auto_41098 ?auto_41110 ) ) ( not ( = ?auto_41113 ?auto_41110 ) ) ( not ( = ?auto_41101 ?auto_41110 ) ) ( not ( = ?auto_41116 ?auto_41106 ) ) ( not ( = ?auto_41111 ?auto_41116 ) ) ( not ( = ?auto_41105 ?auto_41116 ) ) ( not ( = ?auto_41114 ?auto_41116 ) ) ( HOIST-AT ?auto_41115 ?auto_41116 ) ( not ( = ?auto_41109 ?auto_41115 ) ) ( not ( = ?auto_41117 ?auto_41115 ) ) ( not ( = ?auto_41112 ?auto_41115 ) ) ( not ( = ?auto_41104 ?auto_41115 ) ) ( SURFACE-AT ?auto_41113 ?auto_41116 ) ( ON ?auto_41113 ?auto_41095 ) ( CLEAR ?auto_41113 ) ( not ( = ?auto_41093 ?auto_41095 ) ) ( not ( = ?auto_41094 ?auto_41095 ) ) ( not ( = ?auto_41107 ?auto_41095 ) ) ( not ( = ?auto_41097 ?auto_41095 ) ) ( not ( = ?auto_41098 ?auto_41095 ) ) ( not ( = ?auto_41113 ?auto_41095 ) ) ( not ( = ?auto_41101 ?auto_41095 ) ) ( not ( = ?auto_41110 ?auto_41095 ) ) ( IS-CRATE ?auto_41110 ) ( not ( = ?auto_41093 ?auto_41103 ) ) ( not ( = ?auto_41094 ?auto_41103 ) ) ( not ( = ?auto_41107 ?auto_41103 ) ) ( not ( = ?auto_41097 ?auto_41103 ) ) ( not ( = ?auto_41098 ?auto_41103 ) ) ( not ( = ?auto_41113 ?auto_41103 ) ) ( not ( = ?auto_41101 ?auto_41103 ) ) ( not ( = ?auto_41110 ?auto_41103 ) ) ( not ( = ?auto_41095 ?auto_41103 ) ) ( not ( = ?auto_41100 ?auto_41106 ) ) ( not ( = ?auto_41111 ?auto_41100 ) ) ( not ( = ?auto_41105 ?auto_41100 ) ) ( not ( = ?auto_41114 ?auto_41100 ) ) ( not ( = ?auto_41116 ?auto_41100 ) ) ( HOIST-AT ?auto_41096 ?auto_41100 ) ( not ( = ?auto_41109 ?auto_41096 ) ) ( not ( = ?auto_41117 ?auto_41096 ) ) ( not ( = ?auto_41112 ?auto_41096 ) ) ( not ( = ?auto_41104 ?auto_41096 ) ) ( not ( = ?auto_41115 ?auto_41096 ) ) ( AVAILABLE ?auto_41096 ) ( SURFACE-AT ?auto_41110 ?auto_41100 ) ( ON ?auto_41110 ?auto_41108 ) ( CLEAR ?auto_41110 ) ( not ( = ?auto_41093 ?auto_41108 ) ) ( not ( = ?auto_41094 ?auto_41108 ) ) ( not ( = ?auto_41107 ?auto_41108 ) ) ( not ( = ?auto_41097 ?auto_41108 ) ) ( not ( = ?auto_41098 ?auto_41108 ) ) ( not ( = ?auto_41113 ?auto_41108 ) ) ( not ( = ?auto_41101 ?auto_41108 ) ) ( not ( = ?auto_41110 ?auto_41108 ) ) ( not ( = ?auto_41095 ?auto_41108 ) ) ( not ( = ?auto_41103 ?auto_41108 ) ) ( SURFACE-AT ?auto_41118 ?auto_41106 ) ( CLEAR ?auto_41118 ) ( IS-CRATE ?auto_41103 ) ( not ( = ?auto_41093 ?auto_41118 ) ) ( not ( = ?auto_41094 ?auto_41118 ) ) ( not ( = ?auto_41107 ?auto_41118 ) ) ( not ( = ?auto_41097 ?auto_41118 ) ) ( not ( = ?auto_41098 ?auto_41118 ) ) ( not ( = ?auto_41113 ?auto_41118 ) ) ( not ( = ?auto_41101 ?auto_41118 ) ) ( not ( = ?auto_41110 ?auto_41118 ) ) ( not ( = ?auto_41095 ?auto_41118 ) ) ( not ( = ?auto_41103 ?auto_41118 ) ) ( not ( = ?auto_41108 ?auto_41118 ) ) ( AVAILABLE ?auto_41109 ) ( AVAILABLE ?auto_41115 ) ( SURFACE-AT ?auto_41103 ?auto_41116 ) ( ON ?auto_41103 ?auto_41099 ) ( CLEAR ?auto_41103 ) ( not ( = ?auto_41093 ?auto_41099 ) ) ( not ( = ?auto_41094 ?auto_41099 ) ) ( not ( = ?auto_41107 ?auto_41099 ) ) ( not ( = ?auto_41097 ?auto_41099 ) ) ( not ( = ?auto_41098 ?auto_41099 ) ) ( not ( = ?auto_41113 ?auto_41099 ) ) ( not ( = ?auto_41101 ?auto_41099 ) ) ( not ( = ?auto_41110 ?auto_41099 ) ) ( not ( = ?auto_41095 ?auto_41099 ) ) ( not ( = ?auto_41103 ?auto_41099 ) ) ( not ( = ?auto_41108 ?auto_41099 ) ) ( not ( = ?auto_41118 ?auto_41099 ) ) ( TRUCK-AT ?auto_41102 ?auto_41106 ) )
    :subtasks
    ( ( !DRIVE ?auto_41102 ?auto_41106 ?auto_41116 )
      ( MAKE-ON ?auto_41093 ?auto_41094 )
      ( MAKE-ON-VERIFY ?auto_41093 ?auto_41094 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41121 - SURFACE
      ?auto_41122 - SURFACE
    )
    :vars
    (
      ?auto_41123 - HOIST
      ?auto_41124 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41123 ?auto_41124 ) ( SURFACE-AT ?auto_41122 ?auto_41124 ) ( CLEAR ?auto_41122 ) ( LIFTING ?auto_41123 ?auto_41121 ) ( IS-CRATE ?auto_41121 ) ( not ( = ?auto_41121 ?auto_41122 ) ) )
    :subtasks
    ( ( !DROP ?auto_41123 ?auto_41121 ?auto_41122 ?auto_41124 )
      ( MAKE-ON-VERIFY ?auto_41121 ?auto_41122 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41125 - SURFACE
      ?auto_41126 - SURFACE
    )
    :vars
    (
      ?auto_41127 - HOIST
      ?auto_41128 - PLACE
      ?auto_41129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41127 ?auto_41128 ) ( SURFACE-AT ?auto_41126 ?auto_41128 ) ( CLEAR ?auto_41126 ) ( IS-CRATE ?auto_41125 ) ( not ( = ?auto_41125 ?auto_41126 ) ) ( TRUCK-AT ?auto_41129 ?auto_41128 ) ( AVAILABLE ?auto_41127 ) ( IN ?auto_41125 ?auto_41129 ) )
    :subtasks
    ( ( !UNLOAD ?auto_41127 ?auto_41125 ?auto_41129 ?auto_41128 )
      ( MAKE-ON ?auto_41125 ?auto_41126 )
      ( MAKE-ON-VERIFY ?auto_41125 ?auto_41126 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41130 - SURFACE
      ?auto_41131 - SURFACE
    )
    :vars
    (
      ?auto_41134 - HOIST
      ?auto_41132 - PLACE
      ?auto_41133 - TRUCK
      ?auto_41135 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41134 ?auto_41132 ) ( SURFACE-AT ?auto_41131 ?auto_41132 ) ( CLEAR ?auto_41131 ) ( IS-CRATE ?auto_41130 ) ( not ( = ?auto_41130 ?auto_41131 ) ) ( AVAILABLE ?auto_41134 ) ( IN ?auto_41130 ?auto_41133 ) ( TRUCK-AT ?auto_41133 ?auto_41135 ) ( not ( = ?auto_41135 ?auto_41132 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_41133 ?auto_41135 ?auto_41132 )
      ( MAKE-ON ?auto_41130 ?auto_41131 )
      ( MAKE-ON-VERIFY ?auto_41130 ?auto_41131 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41136 - SURFACE
      ?auto_41137 - SURFACE
    )
    :vars
    (
      ?auto_41139 - HOIST
      ?auto_41141 - PLACE
      ?auto_41140 - TRUCK
      ?auto_41138 - PLACE
      ?auto_41142 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_41139 ?auto_41141 ) ( SURFACE-AT ?auto_41137 ?auto_41141 ) ( CLEAR ?auto_41137 ) ( IS-CRATE ?auto_41136 ) ( not ( = ?auto_41136 ?auto_41137 ) ) ( AVAILABLE ?auto_41139 ) ( TRUCK-AT ?auto_41140 ?auto_41138 ) ( not ( = ?auto_41138 ?auto_41141 ) ) ( HOIST-AT ?auto_41142 ?auto_41138 ) ( LIFTING ?auto_41142 ?auto_41136 ) ( not ( = ?auto_41139 ?auto_41142 ) ) )
    :subtasks
    ( ( !LOAD ?auto_41142 ?auto_41136 ?auto_41140 ?auto_41138 )
      ( MAKE-ON ?auto_41136 ?auto_41137 )
      ( MAKE-ON-VERIFY ?auto_41136 ?auto_41137 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41143 - SURFACE
      ?auto_41144 - SURFACE
    )
    :vars
    (
      ?auto_41149 - HOIST
      ?auto_41146 - PLACE
      ?auto_41145 - TRUCK
      ?auto_41148 - PLACE
      ?auto_41147 - HOIST
      ?auto_41150 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41149 ?auto_41146 ) ( SURFACE-AT ?auto_41144 ?auto_41146 ) ( CLEAR ?auto_41144 ) ( IS-CRATE ?auto_41143 ) ( not ( = ?auto_41143 ?auto_41144 ) ) ( AVAILABLE ?auto_41149 ) ( TRUCK-AT ?auto_41145 ?auto_41148 ) ( not ( = ?auto_41148 ?auto_41146 ) ) ( HOIST-AT ?auto_41147 ?auto_41148 ) ( not ( = ?auto_41149 ?auto_41147 ) ) ( AVAILABLE ?auto_41147 ) ( SURFACE-AT ?auto_41143 ?auto_41148 ) ( ON ?auto_41143 ?auto_41150 ) ( CLEAR ?auto_41143 ) ( not ( = ?auto_41143 ?auto_41150 ) ) ( not ( = ?auto_41144 ?auto_41150 ) ) )
    :subtasks
    ( ( !LIFT ?auto_41147 ?auto_41143 ?auto_41150 ?auto_41148 )
      ( MAKE-ON ?auto_41143 ?auto_41144 )
      ( MAKE-ON-VERIFY ?auto_41143 ?auto_41144 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41151 - SURFACE
      ?auto_41152 - SURFACE
    )
    :vars
    (
      ?auto_41156 - HOIST
      ?auto_41157 - PLACE
      ?auto_41155 - PLACE
      ?auto_41158 - HOIST
      ?auto_41154 - SURFACE
      ?auto_41153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41156 ?auto_41157 ) ( SURFACE-AT ?auto_41152 ?auto_41157 ) ( CLEAR ?auto_41152 ) ( IS-CRATE ?auto_41151 ) ( not ( = ?auto_41151 ?auto_41152 ) ) ( AVAILABLE ?auto_41156 ) ( not ( = ?auto_41155 ?auto_41157 ) ) ( HOIST-AT ?auto_41158 ?auto_41155 ) ( not ( = ?auto_41156 ?auto_41158 ) ) ( AVAILABLE ?auto_41158 ) ( SURFACE-AT ?auto_41151 ?auto_41155 ) ( ON ?auto_41151 ?auto_41154 ) ( CLEAR ?auto_41151 ) ( not ( = ?auto_41151 ?auto_41154 ) ) ( not ( = ?auto_41152 ?auto_41154 ) ) ( TRUCK-AT ?auto_41153 ?auto_41157 ) )
    :subtasks
    ( ( !DRIVE ?auto_41153 ?auto_41157 ?auto_41155 )
      ( MAKE-ON ?auto_41151 ?auto_41152 )
      ( MAKE-ON-VERIFY ?auto_41151 ?auto_41152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41159 - SURFACE
      ?auto_41160 - SURFACE
    )
    :vars
    (
      ?auto_41163 - HOIST
      ?auto_41164 - PLACE
      ?auto_41161 - PLACE
      ?auto_41166 - HOIST
      ?auto_41165 - SURFACE
      ?auto_41162 - TRUCK
      ?auto_41167 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41163 ?auto_41164 ) ( IS-CRATE ?auto_41159 ) ( not ( = ?auto_41159 ?auto_41160 ) ) ( not ( = ?auto_41161 ?auto_41164 ) ) ( HOIST-AT ?auto_41166 ?auto_41161 ) ( not ( = ?auto_41163 ?auto_41166 ) ) ( AVAILABLE ?auto_41166 ) ( SURFACE-AT ?auto_41159 ?auto_41161 ) ( ON ?auto_41159 ?auto_41165 ) ( CLEAR ?auto_41159 ) ( not ( = ?auto_41159 ?auto_41165 ) ) ( not ( = ?auto_41160 ?auto_41165 ) ) ( TRUCK-AT ?auto_41162 ?auto_41164 ) ( SURFACE-AT ?auto_41167 ?auto_41164 ) ( CLEAR ?auto_41167 ) ( LIFTING ?auto_41163 ?auto_41160 ) ( IS-CRATE ?auto_41160 ) ( not ( = ?auto_41159 ?auto_41167 ) ) ( not ( = ?auto_41160 ?auto_41167 ) ) ( not ( = ?auto_41165 ?auto_41167 ) ) )
    :subtasks
    ( ( !DROP ?auto_41163 ?auto_41160 ?auto_41167 ?auto_41164 )
      ( MAKE-ON ?auto_41159 ?auto_41160 )
      ( MAKE-ON-VERIFY ?auto_41159 ?auto_41160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41168 - SURFACE
      ?auto_41169 - SURFACE
    )
    :vars
    (
      ?auto_41173 - HOIST
      ?auto_41170 - PLACE
      ?auto_41172 - PLACE
      ?auto_41175 - HOIST
      ?auto_41176 - SURFACE
      ?auto_41174 - TRUCK
      ?auto_41171 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41173 ?auto_41170 ) ( IS-CRATE ?auto_41168 ) ( not ( = ?auto_41168 ?auto_41169 ) ) ( not ( = ?auto_41172 ?auto_41170 ) ) ( HOIST-AT ?auto_41175 ?auto_41172 ) ( not ( = ?auto_41173 ?auto_41175 ) ) ( AVAILABLE ?auto_41175 ) ( SURFACE-AT ?auto_41168 ?auto_41172 ) ( ON ?auto_41168 ?auto_41176 ) ( CLEAR ?auto_41168 ) ( not ( = ?auto_41168 ?auto_41176 ) ) ( not ( = ?auto_41169 ?auto_41176 ) ) ( TRUCK-AT ?auto_41174 ?auto_41170 ) ( SURFACE-AT ?auto_41171 ?auto_41170 ) ( CLEAR ?auto_41171 ) ( IS-CRATE ?auto_41169 ) ( not ( = ?auto_41168 ?auto_41171 ) ) ( not ( = ?auto_41169 ?auto_41171 ) ) ( not ( = ?auto_41176 ?auto_41171 ) ) ( AVAILABLE ?auto_41173 ) ( IN ?auto_41169 ?auto_41174 ) )
    :subtasks
    ( ( !UNLOAD ?auto_41173 ?auto_41169 ?auto_41174 ?auto_41170 )
      ( MAKE-ON ?auto_41168 ?auto_41169 )
      ( MAKE-ON-VERIFY ?auto_41168 ?auto_41169 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41177 - SURFACE
      ?auto_41178 - SURFACE
    )
    :vars
    (
      ?auto_41182 - HOIST
      ?auto_41180 - PLACE
      ?auto_41185 - PLACE
      ?auto_41183 - HOIST
      ?auto_41179 - SURFACE
      ?auto_41184 - SURFACE
      ?auto_41181 - TRUCK
      ?auto_41186 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41182 ?auto_41180 ) ( IS-CRATE ?auto_41177 ) ( not ( = ?auto_41177 ?auto_41178 ) ) ( not ( = ?auto_41185 ?auto_41180 ) ) ( HOIST-AT ?auto_41183 ?auto_41185 ) ( not ( = ?auto_41182 ?auto_41183 ) ) ( AVAILABLE ?auto_41183 ) ( SURFACE-AT ?auto_41177 ?auto_41185 ) ( ON ?auto_41177 ?auto_41179 ) ( CLEAR ?auto_41177 ) ( not ( = ?auto_41177 ?auto_41179 ) ) ( not ( = ?auto_41178 ?auto_41179 ) ) ( SURFACE-AT ?auto_41184 ?auto_41180 ) ( CLEAR ?auto_41184 ) ( IS-CRATE ?auto_41178 ) ( not ( = ?auto_41177 ?auto_41184 ) ) ( not ( = ?auto_41178 ?auto_41184 ) ) ( not ( = ?auto_41179 ?auto_41184 ) ) ( AVAILABLE ?auto_41182 ) ( IN ?auto_41178 ?auto_41181 ) ( TRUCK-AT ?auto_41181 ?auto_41186 ) ( not ( = ?auto_41186 ?auto_41180 ) ) ( not ( = ?auto_41185 ?auto_41186 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_41181 ?auto_41186 ?auto_41180 )
      ( MAKE-ON ?auto_41177 ?auto_41178 )
      ( MAKE-ON-VERIFY ?auto_41177 ?auto_41178 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41187 - SURFACE
      ?auto_41188 - SURFACE
    )
    :vars
    (
      ?auto_41189 - HOIST
      ?auto_41190 - PLACE
      ?auto_41191 - PLACE
      ?auto_41193 - HOIST
      ?auto_41196 - SURFACE
      ?auto_41194 - SURFACE
      ?auto_41192 - TRUCK
      ?auto_41195 - PLACE
      ?auto_41197 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_41189 ?auto_41190 ) ( IS-CRATE ?auto_41187 ) ( not ( = ?auto_41187 ?auto_41188 ) ) ( not ( = ?auto_41191 ?auto_41190 ) ) ( HOIST-AT ?auto_41193 ?auto_41191 ) ( not ( = ?auto_41189 ?auto_41193 ) ) ( AVAILABLE ?auto_41193 ) ( SURFACE-AT ?auto_41187 ?auto_41191 ) ( ON ?auto_41187 ?auto_41196 ) ( CLEAR ?auto_41187 ) ( not ( = ?auto_41187 ?auto_41196 ) ) ( not ( = ?auto_41188 ?auto_41196 ) ) ( SURFACE-AT ?auto_41194 ?auto_41190 ) ( CLEAR ?auto_41194 ) ( IS-CRATE ?auto_41188 ) ( not ( = ?auto_41187 ?auto_41194 ) ) ( not ( = ?auto_41188 ?auto_41194 ) ) ( not ( = ?auto_41196 ?auto_41194 ) ) ( AVAILABLE ?auto_41189 ) ( TRUCK-AT ?auto_41192 ?auto_41195 ) ( not ( = ?auto_41195 ?auto_41190 ) ) ( not ( = ?auto_41191 ?auto_41195 ) ) ( HOIST-AT ?auto_41197 ?auto_41195 ) ( LIFTING ?auto_41197 ?auto_41188 ) ( not ( = ?auto_41189 ?auto_41197 ) ) ( not ( = ?auto_41193 ?auto_41197 ) ) )
    :subtasks
    ( ( !LOAD ?auto_41197 ?auto_41188 ?auto_41192 ?auto_41195 )
      ( MAKE-ON ?auto_41187 ?auto_41188 )
      ( MAKE-ON-VERIFY ?auto_41187 ?auto_41188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41198 - SURFACE
      ?auto_41199 - SURFACE
    )
    :vars
    (
      ?auto_41208 - HOIST
      ?auto_41206 - PLACE
      ?auto_41200 - PLACE
      ?auto_41203 - HOIST
      ?auto_41204 - SURFACE
      ?auto_41201 - SURFACE
      ?auto_41202 - TRUCK
      ?auto_41205 - PLACE
      ?auto_41207 - HOIST
      ?auto_41209 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41208 ?auto_41206 ) ( IS-CRATE ?auto_41198 ) ( not ( = ?auto_41198 ?auto_41199 ) ) ( not ( = ?auto_41200 ?auto_41206 ) ) ( HOIST-AT ?auto_41203 ?auto_41200 ) ( not ( = ?auto_41208 ?auto_41203 ) ) ( AVAILABLE ?auto_41203 ) ( SURFACE-AT ?auto_41198 ?auto_41200 ) ( ON ?auto_41198 ?auto_41204 ) ( CLEAR ?auto_41198 ) ( not ( = ?auto_41198 ?auto_41204 ) ) ( not ( = ?auto_41199 ?auto_41204 ) ) ( SURFACE-AT ?auto_41201 ?auto_41206 ) ( CLEAR ?auto_41201 ) ( IS-CRATE ?auto_41199 ) ( not ( = ?auto_41198 ?auto_41201 ) ) ( not ( = ?auto_41199 ?auto_41201 ) ) ( not ( = ?auto_41204 ?auto_41201 ) ) ( AVAILABLE ?auto_41208 ) ( TRUCK-AT ?auto_41202 ?auto_41205 ) ( not ( = ?auto_41205 ?auto_41206 ) ) ( not ( = ?auto_41200 ?auto_41205 ) ) ( HOIST-AT ?auto_41207 ?auto_41205 ) ( not ( = ?auto_41208 ?auto_41207 ) ) ( not ( = ?auto_41203 ?auto_41207 ) ) ( AVAILABLE ?auto_41207 ) ( SURFACE-AT ?auto_41199 ?auto_41205 ) ( ON ?auto_41199 ?auto_41209 ) ( CLEAR ?auto_41199 ) ( not ( = ?auto_41198 ?auto_41209 ) ) ( not ( = ?auto_41199 ?auto_41209 ) ) ( not ( = ?auto_41204 ?auto_41209 ) ) ( not ( = ?auto_41201 ?auto_41209 ) ) )
    :subtasks
    ( ( !LIFT ?auto_41207 ?auto_41199 ?auto_41209 ?auto_41205 )
      ( MAKE-ON ?auto_41198 ?auto_41199 )
      ( MAKE-ON-VERIFY ?auto_41198 ?auto_41199 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41210 - SURFACE
      ?auto_41211 - SURFACE
    )
    :vars
    (
      ?auto_41221 - HOIST
      ?auto_41214 - PLACE
      ?auto_41220 - PLACE
      ?auto_41216 - HOIST
      ?auto_41219 - SURFACE
      ?auto_41218 - SURFACE
      ?auto_41217 - PLACE
      ?auto_41215 - HOIST
      ?auto_41212 - SURFACE
      ?auto_41213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41221 ?auto_41214 ) ( IS-CRATE ?auto_41210 ) ( not ( = ?auto_41210 ?auto_41211 ) ) ( not ( = ?auto_41220 ?auto_41214 ) ) ( HOIST-AT ?auto_41216 ?auto_41220 ) ( not ( = ?auto_41221 ?auto_41216 ) ) ( AVAILABLE ?auto_41216 ) ( SURFACE-AT ?auto_41210 ?auto_41220 ) ( ON ?auto_41210 ?auto_41219 ) ( CLEAR ?auto_41210 ) ( not ( = ?auto_41210 ?auto_41219 ) ) ( not ( = ?auto_41211 ?auto_41219 ) ) ( SURFACE-AT ?auto_41218 ?auto_41214 ) ( CLEAR ?auto_41218 ) ( IS-CRATE ?auto_41211 ) ( not ( = ?auto_41210 ?auto_41218 ) ) ( not ( = ?auto_41211 ?auto_41218 ) ) ( not ( = ?auto_41219 ?auto_41218 ) ) ( AVAILABLE ?auto_41221 ) ( not ( = ?auto_41217 ?auto_41214 ) ) ( not ( = ?auto_41220 ?auto_41217 ) ) ( HOIST-AT ?auto_41215 ?auto_41217 ) ( not ( = ?auto_41221 ?auto_41215 ) ) ( not ( = ?auto_41216 ?auto_41215 ) ) ( AVAILABLE ?auto_41215 ) ( SURFACE-AT ?auto_41211 ?auto_41217 ) ( ON ?auto_41211 ?auto_41212 ) ( CLEAR ?auto_41211 ) ( not ( = ?auto_41210 ?auto_41212 ) ) ( not ( = ?auto_41211 ?auto_41212 ) ) ( not ( = ?auto_41219 ?auto_41212 ) ) ( not ( = ?auto_41218 ?auto_41212 ) ) ( TRUCK-AT ?auto_41213 ?auto_41214 ) )
    :subtasks
    ( ( !DRIVE ?auto_41213 ?auto_41214 ?auto_41217 )
      ( MAKE-ON ?auto_41210 ?auto_41211 )
      ( MAKE-ON-VERIFY ?auto_41210 ?auto_41211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41222 - SURFACE
      ?auto_41223 - SURFACE
    )
    :vars
    (
      ?auto_41229 - HOIST
      ?auto_41227 - PLACE
      ?auto_41232 - PLACE
      ?auto_41225 - HOIST
      ?auto_41226 - SURFACE
      ?auto_41233 - SURFACE
      ?auto_41228 - PLACE
      ?auto_41230 - HOIST
      ?auto_41231 - SURFACE
      ?auto_41224 - TRUCK
      ?auto_41234 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41229 ?auto_41227 ) ( IS-CRATE ?auto_41222 ) ( not ( = ?auto_41222 ?auto_41223 ) ) ( not ( = ?auto_41232 ?auto_41227 ) ) ( HOIST-AT ?auto_41225 ?auto_41232 ) ( not ( = ?auto_41229 ?auto_41225 ) ) ( AVAILABLE ?auto_41225 ) ( SURFACE-AT ?auto_41222 ?auto_41232 ) ( ON ?auto_41222 ?auto_41226 ) ( CLEAR ?auto_41222 ) ( not ( = ?auto_41222 ?auto_41226 ) ) ( not ( = ?auto_41223 ?auto_41226 ) ) ( IS-CRATE ?auto_41223 ) ( not ( = ?auto_41222 ?auto_41233 ) ) ( not ( = ?auto_41223 ?auto_41233 ) ) ( not ( = ?auto_41226 ?auto_41233 ) ) ( not ( = ?auto_41228 ?auto_41227 ) ) ( not ( = ?auto_41232 ?auto_41228 ) ) ( HOIST-AT ?auto_41230 ?auto_41228 ) ( not ( = ?auto_41229 ?auto_41230 ) ) ( not ( = ?auto_41225 ?auto_41230 ) ) ( AVAILABLE ?auto_41230 ) ( SURFACE-AT ?auto_41223 ?auto_41228 ) ( ON ?auto_41223 ?auto_41231 ) ( CLEAR ?auto_41223 ) ( not ( = ?auto_41222 ?auto_41231 ) ) ( not ( = ?auto_41223 ?auto_41231 ) ) ( not ( = ?auto_41226 ?auto_41231 ) ) ( not ( = ?auto_41233 ?auto_41231 ) ) ( TRUCK-AT ?auto_41224 ?auto_41227 ) ( SURFACE-AT ?auto_41234 ?auto_41227 ) ( CLEAR ?auto_41234 ) ( LIFTING ?auto_41229 ?auto_41233 ) ( IS-CRATE ?auto_41233 ) ( not ( = ?auto_41222 ?auto_41234 ) ) ( not ( = ?auto_41223 ?auto_41234 ) ) ( not ( = ?auto_41226 ?auto_41234 ) ) ( not ( = ?auto_41233 ?auto_41234 ) ) ( not ( = ?auto_41231 ?auto_41234 ) ) )
    :subtasks
    ( ( !DROP ?auto_41229 ?auto_41233 ?auto_41234 ?auto_41227 )
      ( MAKE-ON ?auto_41222 ?auto_41223 )
      ( MAKE-ON-VERIFY ?auto_41222 ?auto_41223 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41235 - SURFACE
      ?auto_41236 - SURFACE
    )
    :vars
    (
      ?auto_41246 - HOIST
      ?auto_41247 - PLACE
      ?auto_41240 - PLACE
      ?auto_41242 - HOIST
      ?auto_41245 - SURFACE
      ?auto_41238 - SURFACE
      ?auto_41243 - PLACE
      ?auto_41237 - HOIST
      ?auto_41239 - SURFACE
      ?auto_41244 - TRUCK
      ?auto_41241 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41246 ?auto_41247 ) ( IS-CRATE ?auto_41235 ) ( not ( = ?auto_41235 ?auto_41236 ) ) ( not ( = ?auto_41240 ?auto_41247 ) ) ( HOIST-AT ?auto_41242 ?auto_41240 ) ( not ( = ?auto_41246 ?auto_41242 ) ) ( AVAILABLE ?auto_41242 ) ( SURFACE-AT ?auto_41235 ?auto_41240 ) ( ON ?auto_41235 ?auto_41245 ) ( CLEAR ?auto_41235 ) ( not ( = ?auto_41235 ?auto_41245 ) ) ( not ( = ?auto_41236 ?auto_41245 ) ) ( IS-CRATE ?auto_41236 ) ( not ( = ?auto_41235 ?auto_41238 ) ) ( not ( = ?auto_41236 ?auto_41238 ) ) ( not ( = ?auto_41245 ?auto_41238 ) ) ( not ( = ?auto_41243 ?auto_41247 ) ) ( not ( = ?auto_41240 ?auto_41243 ) ) ( HOIST-AT ?auto_41237 ?auto_41243 ) ( not ( = ?auto_41246 ?auto_41237 ) ) ( not ( = ?auto_41242 ?auto_41237 ) ) ( AVAILABLE ?auto_41237 ) ( SURFACE-AT ?auto_41236 ?auto_41243 ) ( ON ?auto_41236 ?auto_41239 ) ( CLEAR ?auto_41236 ) ( not ( = ?auto_41235 ?auto_41239 ) ) ( not ( = ?auto_41236 ?auto_41239 ) ) ( not ( = ?auto_41245 ?auto_41239 ) ) ( not ( = ?auto_41238 ?auto_41239 ) ) ( TRUCK-AT ?auto_41244 ?auto_41247 ) ( SURFACE-AT ?auto_41241 ?auto_41247 ) ( CLEAR ?auto_41241 ) ( IS-CRATE ?auto_41238 ) ( not ( = ?auto_41235 ?auto_41241 ) ) ( not ( = ?auto_41236 ?auto_41241 ) ) ( not ( = ?auto_41245 ?auto_41241 ) ) ( not ( = ?auto_41238 ?auto_41241 ) ) ( not ( = ?auto_41239 ?auto_41241 ) ) ( AVAILABLE ?auto_41246 ) ( IN ?auto_41238 ?auto_41244 ) )
    :subtasks
    ( ( !UNLOAD ?auto_41246 ?auto_41238 ?auto_41244 ?auto_41247 )
      ( MAKE-ON ?auto_41235 ?auto_41236 )
      ( MAKE-ON-VERIFY ?auto_41235 ?auto_41236 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41248 - SURFACE
      ?auto_41249 - SURFACE
    )
    :vars
    (
      ?auto_41254 - HOIST
      ?auto_41259 - PLACE
      ?auto_41256 - PLACE
      ?auto_41250 - HOIST
      ?auto_41252 - SURFACE
      ?auto_41251 - SURFACE
      ?auto_41255 - PLACE
      ?auto_41253 - HOIST
      ?auto_41260 - SURFACE
      ?auto_41258 - SURFACE
      ?auto_41257 - TRUCK
      ?auto_41261 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41254 ?auto_41259 ) ( IS-CRATE ?auto_41248 ) ( not ( = ?auto_41248 ?auto_41249 ) ) ( not ( = ?auto_41256 ?auto_41259 ) ) ( HOIST-AT ?auto_41250 ?auto_41256 ) ( not ( = ?auto_41254 ?auto_41250 ) ) ( AVAILABLE ?auto_41250 ) ( SURFACE-AT ?auto_41248 ?auto_41256 ) ( ON ?auto_41248 ?auto_41252 ) ( CLEAR ?auto_41248 ) ( not ( = ?auto_41248 ?auto_41252 ) ) ( not ( = ?auto_41249 ?auto_41252 ) ) ( IS-CRATE ?auto_41249 ) ( not ( = ?auto_41248 ?auto_41251 ) ) ( not ( = ?auto_41249 ?auto_41251 ) ) ( not ( = ?auto_41252 ?auto_41251 ) ) ( not ( = ?auto_41255 ?auto_41259 ) ) ( not ( = ?auto_41256 ?auto_41255 ) ) ( HOIST-AT ?auto_41253 ?auto_41255 ) ( not ( = ?auto_41254 ?auto_41253 ) ) ( not ( = ?auto_41250 ?auto_41253 ) ) ( AVAILABLE ?auto_41253 ) ( SURFACE-AT ?auto_41249 ?auto_41255 ) ( ON ?auto_41249 ?auto_41260 ) ( CLEAR ?auto_41249 ) ( not ( = ?auto_41248 ?auto_41260 ) ) ( not ( = ?auto_41249 ?auto_41260 ) ) ( not ( = ?auto_41252 ?auto_41260 ) ) ( not ( = ?auto_41251 ?auto_41260 ) ) ( SURFACE-AT ?auto_41258 ?auto_41259 ) ( CLEAR ?auto_41258 ) ( IS-CRATE ?auto_41251 ) ( not ( = ?auto_41248 ?auto_41258 ) ) ( not ( = ?auto_41249 ?auto_41258 ) ) ( not ( = ?auto_41252 ?auto_41258 ) ) ( not ( = ?auto_41251 ?auto_41258 ) ) ( not ( = ?auto_41260 ?auto_41258 ) ) ( AVAILABLE ?auto_41254 ) ( IN ?auto_41251 ?auto_41257 ) ( TRUCK-AT ?auto_41257 ?auto_41261 ) ( not ( = ?auto_41261 ?auto_41259 ) ) ( not ( = ?auto_41256 ?auto_41261 ) ) ( not ( = ?auto_41255 ?auto_41261 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_41257 ?auto_41261 ?auto_41259 )
      ( MAKE-ON ?auto_41248 ?auto_41249 )
      ( MAKE-ON-VERIFY ?auto_41248 ?auto_41249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41262 - SURFACE
      ?auto_41263 - SURFACE
    )
    :vars
    (
      ?auto_41266 - HOIST
      ?auto_41272 - PLACE
      ?auto_41269 - PLACE
      ?auto_41274 - HOIST
      ?auto_41273 - SURFACE
      ?auto_41268 - SURFACE
      ?auto_41270 - PLACE
      ?auto_41265 - HOIST
      ?auto_41264 - SURFACE
      ?auto_41267 - SURFACE
      ?auto_41271 - TRUCK
      ?auto_41275 - PLACE
      ?auto_41276 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_41266 ?auto_41272 ) ( IS-CRATE ?auto_41262 ) ( not ( = ?auto_41262 ?auto_41263 ) ) ( not ( = ?auto_41269 ?auto_41272 ) ) ( HOIST-AT ?auto_41274 ?auto_41269 ) ( not ( = ?auto_41266 ?auto_41274 ) ) ( AVAILABLE ?auto_41274 ) ( SURFACE-AT ?auto_41262 ?auto_41269 ) ( ON ?auto_41262 ?auto_41273 ) ( CLEAR ?auto_41262 ) ( not ( = ?auto_41262 ?auto_41273 ) ) ( not ( = ?auto_41263 ?auto_41273 ) ) ( IS-CRATE ?auto_41263 ) ( not ( = ?auto_41262 ?auto_41268 ) ) ( not ( = ?auto_41263 ?auto_41268 ) ) ( not ( = ?auto_41273 ?auto_41268 ) ) ( not ( = ?auto_41270 ?auto_41272 ) ) ( not ( = ?auto_41269 ?auto_41270 ) ) ( HOIST-AT ?auto_41265 ?auto_41270 ) ( not ( = ?auto_41266 ?auto_41265 ) ) ( not ( = ?auto_41274 ?auto_41265 ) ) ( AVAILABLE ?auto_41265 ) ( SURFACE-AT ?auto_41263 ?auto_41270 ) ( ON ?auto_41263 ?auto_41264 ) ( CLEAR ?auto_41263 ) ( not ( = ?auto_41262 ?auto_41264 ) ) ( not ( = ?auto_41263 ?auto_41264 ) ) ( not ( = ?auto_41273 ?auto_41264 ) ) ( not ( = ?auto_41268 ?auto_41264 ) ) ( SURFACE-AT ?auto_41267 ?auto_41272 ) ( CLEAR ?auto_41267 ) ( IS-CRATE ?auto_41268 ) ( not ( = ?auto_41262 ?auto_41267 ) ) ( not ( = ?auto_41263 ?auto_41267 ) ) ( not ( = ?auto_41273 ?auto_41267 ) ) ( not ( = ?auto_41268 ?auto_41267 ) ) ( not ( = ?auto_41264 ?auto_41267 ) ) ( AVAILABLE ?auto_41266 ) ( TRUCK-AT ?auto_41271 ?auto_41275 ) ( not ( = ?auto_41275 ?auto_41272 ) ) ( not ( = ?auto_41269 ?auto_41275 ) ) ( not ( = ?auto_41270 ?auto_41275 ) ) ( HOIST-AT ?auto_41276 ?auto_41275 ) ( LIFTING ?auto_41276 ?auto_41268 ) ( not ( = ?auto_41266 ?auto_41276 ) ) ( not ( = ?auto_41274 ?auto_41276 ) ) ( not ( = ?auto_41265 ?auto_41276 ) ) )
    :subtasks
    ( ( !LOAD ?auto_41276 ?auto_41268 ?auto_41271 ?auto_41275 )
      ( MAKE-ON ?auto_41262 ?auto_41263 )
      ( MAKE-ON-VERIFY ?auto_41262 ?auto_41263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41277 - SURFACE
      ?auto_41278 - SURFACE
    )
    :vars
    (
      ?auto_41287 - HOIST
      ?auto_41291 - PLACE
      ?auto_41285 - PLACE
      ?auto_41281 - HOIST
      ?auto_41286 - SURFACE
      ?auto_41280 - SURFACE
      ?auto_41289 - PLACE
      ?auto_41288 - HOIST
      ?auto_41283 - SURFACE
      ?auto_41282 - SURFACE
      ?auto_41284 - TRUCK
      ?auto_41279 - PLACE
      ?auto_41290 - HOIST
      ?auto_41292 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41287 ?auto_41291 ) ( IS-CRATE ?auto_41277 ) ( not ( = ?auto_41277 ?auto_41278 ) ) ( not ( = ?auto_41285 ?auto_41291 ) ) ( HOIST-AT ?auto_41281 ?auto_41285 ) ( not ( = ?auto_41287 ?auto_41281 ) ) ( AVAILABLE ?auto_41281 ) ( SURFACE-AT ?auto_41277 ?auto_41285 ) ( ON ?auto_41277 ?auto_41286 ) ( CLEAR ?auto_41277 ) ( not ( = ?auto_41277 ?auto_41286 ) ) ( not ( = ?auto_41278 ?auto_41286 ) ) ( IS-CRATE ?auto_41278 ) ( not ( = ?auto_41277 ?auto_41280 ) ) ( not ( = ?auto_41278 ?auto_41280 ) ) ( not ( = ?auto_41286 ?auto_41280 ) ) ( not ( = ?auto_41289 ?auto_41291 ) ) ( not ( = ?auto_41285 ?auto_41289 ) ) ( HOIST-AT ?auto_41288 ?auto_41289 ) ( not ( = ?auto_41287 ?auto_41288 ) ) ( not ( = ?auto_41281 ?auto_41288 ) ) ( AVAILABLE ?auto_41288 ) ( SURFACE-AT ?auto_41278 ?auto_41289 ) ( ON ?auto_41278 ?auto_41283 ) ( CLEAR ?auto_41278 ) ( not ( = ?auto_41277 ?auto_41283 ) ) ( not ( = ?auto_41278 ?auto_41283 ) ) ( not ( = ?auto_41286 ?auto_41283 ) ) ( not ( = ?auto_41280 ?auto_41283 ) ) ( SURFACE-AT ?auto_41282 ?auto_41291 ) ( CLEAR ?auto_41282 ) ( IS-CRATE ?auto_41280 ) ( not ( = ?auto_41277 ?auto_41282 ) ) ( not ( = ?auto_41278 ?auto_41282 ) ) ( not ( = ?auto_41286 ?auto_41282 ) ) ( not ( = ?auto_41280 ?auto_41282 ) ) ( not ( = ?auto_41283 ?auto_41282 ) ) ( AVAILABLE ?auto_41287 ) ( TRUCK-AT ?auto_41284 ?auto_41279 ) ( not ( = ?auto_41279 ?auto_41291 ) ) ( not ( = ?auto_41285 ?auto_41279 ) ) ( not ( = ?auto_41289 ?auto_41279 ) ) ( HOIST-AT ?auto_41290 ?auto_41279 ) ( not ( = ?auto_41287 ?auto_41290 ) ) ( not ( = ?auto_41281 ?auto_41290 ) ) ( not ( = ?auto_41288 ?auto_41290 ) ) ( AVAILABLE ?auto_41290 ) ( SURFACE-AT ?auto_41280 ?auto_41279 ) ( ON ?auto_41280 ?auto_41292 ) ( CLEAR ?auto_41280 ) ( not ( = ?auto_41277 ?auto_41292 ) ) ( not ( = ?auto_41278 ?auto_41292 ) ) ( not ( = ?auto_41286 ?auto_41292 ) ) ( not ( = ?auto_41280 ?auto_41292 ) ) ( not ( = ?auto_41283 ?auto_41292 ) ) ( not ( = ?auto_41282 ?auto_41292 ) ) )
    :subtasks
    ( ( !LIFT ?auto_41290 ?auto_41280 ?auto_41292 ?auto_41279 )
      ( MAKE-ON ?auto_41277 ?auto_41278 )
      ( MAKE-ON-VERIFY ?auto_41277 ?auto_41278 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41293 - SURFACE
      ?auto_41294 - SURFACE
    )
    :vars
    (
      ?auto_41299 - HOIST
      ?auto_41302 - PLACE
      ?auto_41301 - PLACE
      ?auto_41306 - HOIST
      ?auto_41300 - SURFACE
      ?auto_41298 - SURFACE
      ?auto_41296 - PLACE
      ?auto_41307 - HOIST
      ?auto_41295 - SURFACE
      ?auto_41297 - SURFACE
      ?auto_41303 - PLACE
      ?auto_41304 - HOIST
      ?auto_41308 - SURFACE
      ?auto_41305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41299 ?auto_41302 ) ( IS-CRATE ?auto_41293 ) ( not ( = ?auto_41293 ?auto_41294 ) ) ( not ( = ?auto_41301 ?auto_41302 ) ) ( HOIST-AT ?auto_41306 ?auto_41301 ) ( not ( = ?auto_41299 ?auto_41306 ) ) ( AVAILABLE ?auto_41306 ) ( SURFACE-AT ?auto_41293 ?auto_41301 ) ( ON ?auto_41293 ?auto_41300 ) ( CLEAR ?auto_41293 ) ( not ( = ?auto_41293 ?auto_41300 ) ) ( not ( = ?auto_41294 ?auto_41300 ) ) ( IS-CRATE ?auto_41294 ) ( not ( = ?auto_41293 ?auto_41298 ) ) ( not ( = ?auto_41294 ?auto_41298 ) ) ( not ( = ?auto_41300 ?auto_41298 ) ) ( not ( = ?auto_41296 ?auto_41302 ) ) ( not ( = ?auto_41301 ?auto_41296 ) ) ( HOIST-AT ?auto_41307 ?auto_41296 ) ( not ( = ?auto_41299 ?auto_41307 ) ) ( not ( = ?auto_41306 ?auto_41307 ) ) ( AVAILABLE ?auto_41307 ) ( SURFACE-AT ?auto_41294 ?auto_41296 ) ( ON ?auto_41294 ?auto_41295 ) ( CLEAR ?auto_41294 ) ( not ( = ?auto_41293 ?auto_41295 ) ) ( not ( = ?auto_41294 ?auto_41295 ) ) ( not ( = ?auto_41300 ?auto_41295 ) ) ( not ( = ?auto_41298 ?auto_41295 ) ) ( SURFACE-AT ?auto_41297 ?auto_41302 ) ( CLEAR ?auto_41297 ) ( IS-CRATE ?auto_41298 ) ( not ( = ?auto_41293 ?auto_41297 ) ) ( not ( = ?auto_41294 ?auto_41297 ) ) ( not ( = ?auto_41300 ?auto_41297 ) ) ( not ( = ?auto_41298 ?auto_41297 ) ) ( not ( = ?auto_41295 ?auto_41297 ) ) ( AVAILABLE ?auto_41299 ) ( not ( = ?auto_41303 ?auto_41302 ) ) ( not ( = ?auto_41301 ?auto_41303 ) ) ( not ( = ?auto_41296 ?auto_41303 ) ) ( HOIST-AT ?auto_41304 ?auto_41303 ) ( not ( = ?auto_41299 ?auto_41304 ) ) ( not ( = ?auto_41306 ?auto_41304 ) ) ( not ( = ?auto_41307 ?auto_41304 ) ) ( AVAILABLE ?auto_41304 ) ( SURFACE-AT ?auto_41298 ?auto_41303 ) ( ON ?auto_41298 ?auto_41308 ) ( CLEAR ?auto_41298 ) ( not ( = ?auto_41293 ?auto_41308 ) ) ( not ( = ?auto_41294 ?auto_41308 ) ) ( not ( = ?auto_41300 ?auto_41308 ) ) ( not ( = ?auto_41298 ?auto_41308 ) ) ( not ( = ?auto_41295 ?auto_41308 ) ) ( not ( = ?auto_41297 ?auto_41308 ) ) ( TRUCK-AT ?auto_41305 ?auto_41302 ) )
    :subtasks
    ( ( !DRIVE ?auto_41305 ?auto_41302 ?auto_41303 )
      ( MAKE-ON ?auto_41293 ?auto_41294 )
      ( MAKE-ON-VERIFY ?auto_41293 ?auto_41294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41309 - SURFACE
      ?auto_41310 - SURFACE
    )
    :vars
    (
      ?auto_41320 - HOIST
      ?auto_41317 - PLACE
      ?auto_41322 - PLACE
      ?auto_41311 - HOIST
      ?auto_41316 - SURFACE
      ?auto_41313 - SURFACE
      ?auto_41324 - PLACE
      ?auto_41321 - HOIST
      ?auto_41315 - SURFACE
      ?auto_41323 - SURFACE
      ?auto_41314 - PLACE
      ?auto_41319 - HOIST
      ?auto_41312 - SURFACE
      ?auto_41318 - TRUCK
      ?auto_41325 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41320 ?auto_41317 ) ( IS-CRATE ?auto_41309 ) ( not ( = ?auto_41309 ?auto_41310 ) ) ( not ( = ?auto_41322 ?auto_41317 ) ) ( HOIST-AT ?auto_41311 ?auto_41322 ) ( not ( = ?auto_41320 ?auto_41311 ) ) ( AVAILABLE ?auto_41311 ) ( SURFACE-AT ?auto_41309 ?auto_41322 ) ( ON ?auto_41309 ?auto_41316 ) ( CLEAR ?auto_41309 ) ( not ( = ?auto_41309 ?auto_41316 ) ) ( not ( = ?auto_41310 ?auto_41316 ) ) ( IS-CRATE ?auto_41310 ) ( not ( = ?auto_41309 ?auto_41313 ) ) ( not ( = ?auto_41310 ?auto_41313 ) ) ( not ( = ?auto_41316 ?auto_41313 ) ) ( not ( = ?auto_41324 ?auto_41317 ) ) ( not ( = ?auto_41322 ?auto_41324 ) ) ( HOIST-AT ?auto_41321 ?auto_41324 ) ( not ( = ?auto_41320 ?auto_41321 ) ) ( not ( = ?auto_41311 ?auto_41321 ) ) ( AVAILABLE ?auto_41321 ) ( SURFACE-AT ?auto_41310 ?auto_41324 ) ( ON ?auto_41310 ?auto_41315 ) ( CLEAR ?auto_41310 ) ( not ( = ?auto_41309 ?auto_41315 ) ) ( not ( = ?auto_41310 ?auto_41315 ) ) ( not ( = ?auto_41316 ?auto_41315 ) ) ( not ( = ?auto_41313 ?auto_41315 ) ) ( IS-CRATE ?auto_41313 ) ( not ( = ?auto_41309 ?auto_41323 ) ) ( not ( = ?auto_41310 ?auto_41323 ) ) ( not ( = ?auto_41316 ?auto_41323 ) ) ( not ( = ?auto_41313 ?auto_41323 ) ) ( not ( = ?auto_41315 ?auto_41323 ) ) ( not ( = ?auto_41314 ?auto_41317 ) ) ( not ( = ?auto_41322 ?auto_41314 ) ) ( not ( = ?auto_41324 ?auto_41314 ) ) ( HOIST-AT ?auto_41319 ?auto_41314 ) ( not ( = ?auto_41320 ?auto_41319 ) ) ( not ( = ?auto_41311 ?auto_41319 ) ) ( not ( = ?auto_41321 ?auto_41319 ) ) ( AVAILABLE ?auto_41319 ) ( SURFACE-AT ?auto_41313 ?auto_41314 ) ( ON ?auto_41313 ?auto_41312 ) ( CLEAR ?auto_41313 ) ( not ( = ?auto_41309 ?auto_41312 ) ) ( not ( = ?auto_41310 ?auto_41312 ) ) ( not ( = ?auto_41316 ?auto_41312 ) ) ( not ( = ?auto_41313 ?auto_41312 ) ) ( not ( = ?auto_41315 ?auto_41312 ) ) ( not ( = ?auto_41323 ?auto_41312 ) ) ( TRUCK-AT ?auto_41318 ?auto_41317 ) ( SURFACE-AT ?auto_41325 ?auto_41317 ) ( CLEAR ?auto_41325 ) ( LIFTING ?auto_41320 ?auto_41323 ) ( IS-CRATE ?auto_41323 ) ( not ( = ?auto_41309 ?auto_41325 ) ) ( not ( = ?auto_41310 ?auto_41325 ) ) ( not ( = ?auto_41316 ?auto_41325 ) ) ( not ( = ?auto_41313 ?auto_41325 ) ) ( not ( = ?auto_41315 ?auto_41325 ) ) ( not ( = ?auto_41323 ?auto_41325 ) ) ( not ( = ?auto_41312 ?auto_41325 ) ) )
    :subtasks
    ( ( !DROP ?auto_41320 ?auto_41323 ?auto_41325 ?auto_41317 )
      ( MAKE-ON ?auto_41309 ?auto_41310 )
      ( MAKE-ON-VERIFY ?auto_41309 ?auto_41310 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41326 - SURFACE
      ?auto_41327 - SURFACE
    )
    :vars
    (
      ?auto_41335 - HOIST
      ?auto_41338 - PLACE
      ?auto_41329 - PLACE
      ?auto_41334 - HOIST
      ?auto_41339 - SURFACE
      ?auto_41333 - SURFACE
      ?auto_41340 - PLACE
      ?auto_41328 - HOIST
      ?auto_41336 - SURFACE
      ?auto_41332 - SURFACE
      ?auto_41342 - PLACE
      ?auto_41330 - HOIST
      ?auto_41341 - SURFACE
      ?auto_41337 - TRUCK
      ?auto_41331 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41335 ?auto_41338 ) ( IS-CRATE ?auto_41326 ) ( not ( = ?auto_41326 ?auto_41327 ) ) ( not ( = ?auto_41329 ?auto_41338 ) ) ( HOIST-AT ?auto_41334 ?auto_41329 ) ( not ( = ?auto_41335 ?auto_41334 ) ) ( AVAILABLE ?auto_41334 ) ( SURFACE-AT ?auto_41326 ?auto_41329 ) ( ON ?auto_41326 ?auto_41339 ) ( CLEAR ?auto_41326 ) ( not ( = ?auto_41326 ?auto_41339 ) ) ( not ( = ?auto_41327 ?auto_41339 ) ) ( IS-CRATE ?auto_41327 ) ( not ( = ?auto_41326 ?auto_41333 ) ) ( not ( = ?auto_41327 ?auto_41333 ) ) ( not ( = ?auto_41339 ?auto_41333 ) ) ( not ( = ?auto_41340 ?auto_41338 ) ) ( not ( = ?auto_41329 ?auto_41340 ) ) ( HOIST-AT ?auto_41328 ?auto_41340 ) ( not ( = ?auto_41335 ?auto_41328 ) ) ( not ( = ?auto_41334 ?auto_41328 ) ) ( AVAILABLE ?auto_41328 ) ( SURFACE-AT ?auto_41327 ?auto_41340 ) ( ON ?auto_41327 ?auto_41336 ) ( CLEAR ?auto_41327 ) ( not ( = ?auto_41326 ?auto_41336 ) ) ( not ( = ?auto_41327 ?auto_41336 ) ) ( not ( = ?auto_41339 ?auto_41336 ) ) ( not ( = ?auto_41333 ?auto_41336 ) ) ( IS-CRATE ?auto_41333 ) ( not ( = ?auto_41326 ?auto_41332 ) ) ( not ( = ?auto_41327 ?auto_41332 ) ) ( not ( = ?auto_41339 ?auto_41332 ) ) ( not ( = ?auto_41333 ?auto_41332 ) ) ( not ( = ?auto_41336 ?auto_41332 ) ) ( not ( = ?auto_41342 ?auto_41338 ) ) ( not ( = ?auto_41329 ?auto_41342 ) ) ( not ( = ?auto_41340 ?auto_41342 ) ) ( HOIST-AT ?auto_41330 ?auto_41342 ) ( not ( = ?auto_41335 ?auto_41330 ) ) ( not ( = ?auto_41334 ?auto_41330 ) ) ( not ( = ?auto_41328 ?auto_41330 ) ) ( AVAILABLE ?auto_41330 ) ( SURFACE-AT ?auto_41333 ?auto_41342 ) ( ON ?auto_41333 ?auto_41341 ) ( CLEAR ?auto_41333 ) ( not ( = ?auto_41326 ?auto_41341 ) ) ( not ( = ?auto_41327 ?auto_41341 ) ) ( not ( = ?auto_41339 ?auto_41341 ) ) ( not ( = ?auto_41333 ?auto_41341 ) ) ( not ( = ?auto_41336 ?auto_41341 ) ) ( not ( = ?auto_41332 ?auto_41341 ) ) ( TRUCK-AT ?auto_41337 ?auto_41338 ) ( SURFACE-AT ?auto_41331 ?auto_41338 ) ( CLEAR ?auto_41331 ) ( IS-CRATE ?auto_41332 ) ( not ( = ?auto_41326 ?auto_41331 ) ) ( not ( = ?auto_41327 ?auto_41331 ) ) ( not ( = ?auto_41339 ?auto_41331 ) ) ( not ( = ?auto_41333 ?auto_41331 ) ) ( not ( = ?auto_41336 ?auto_41331 ) ) ( not ( = ?auto_41332 ?auto_41331 ) ) ( not ( = ?auto_41341 ?auto_41331 ) ) ( AVAILABLE ?auto_41335 ) ( IN ?auto_41332 ?auto_41337 ) )
    :subtasks
    ( ( !UNLOAD ?auto_41335 ?auto_41332 ?auto_41337 ?auto_41338 )
      ( MAKE-ON ?auto_41326 ?auto_41327 )
      ( MAKE-ON-VERIFY ?auto_41326 ?auto_41327 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41343 - SURFACE
      ?auto_41344 - SURFACE
    )
    :vars
    (
      ?auto_41348 - HOIST
      ?auto_41351 - PLACE
      ?auto_41346 - PLACE
      ?auto_41354 - HOIST
      ?auto_41352 - SURFACE
      ?auto_41359 - SURFACE
      ?auto_41345 - PLACE
      ?auto_41356 - HOIST
      ?auto_41355 - SURFACE
      ?auto_41349 - SURFACE
      ?auto_41353 - PLACE
      ?auto_41358 - HOIST
      ?auto_41350 - SURFACE
      ?auto_41357 - SURFACE
      ?auto_41347 - TRUCK
      ?auto_41360 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41348 ?auto_41351 ) ( IS-CRATE ?auto_41343 ) ( not ( = ?auto_41343 ?auto_41344 ) ) ( not ( = ?auto_41346 ?auto_41351 ) ) ( HOIST-AT ?auto_41354 ?auto_41346 ) ( not ( = ?auto_41348 ?auto_41354 ) ) ( AVAILABLE ?auto_41354 ) ( SURFACE-AT ?auto_41343 ?auto_41346 ) ( ON ?auto_41343 ?auto_41352 ) ( CLEAR ?auto_41343 ) ( not ( = ?auto_41343 ?auto_41352 ) ) ( not ( = ?auto_41344 ?auto_41352 ) ) ( IS-CRATE ?auto_41344 ) ( not ( = ?auto_41343 ?auto_41359 ) ) ( not ( = ?auto_41344 ?auto_41359 ) ) ( not ( = ?auto_41352 ?auto_41359 ) ) ( not ( = ?auto_41345 ?auto_41351 ) ) ( not ( = ?auto_41346 ?auto_41345 ) ) ( HOIST-AT ?auto_41356 ?auto_41345 ) ( not ( = ?auto_41348 ?auto_41356 ) ) ( not ( = ?auto_41354 ?auto_41356 ) ) ( AVAILABLE ?auto_41356 ) ( SURFACE-AT ?auto_41344 ?auto_41345 ) ( ON ?auto_41344 ?auto_41355 ) ( CLEAR ?auto_41344 ) ( not ( = ?auto_41343 ?auto_41355 ) ) ( not ( = ?auto_41344 ?auto_41355 ) ) ( not ( = ?auto_41352 ?auto_41355 ) ) ( not ( = ?auto_41359 ?auto_41355 ) ) ( IS-CRATE ?auto_41359 ) ( not ( = ?auto_41343 ?auto_41349 ) ) ( not ( = ?auto_41344 ?auto_41349 ) ) ( not ( = ?auto_41352 ?auto_41349 ) ) ( not ( = ?auto_41359 ?auto_41349 ) ) ( not ( = ?auto_41355 ?auto_41349 ) ) ( not ( = ?auto_41353 ?auto_41351 ) ) ( not ( = ?auto_41346 ?auto_41353 ) ) ( not ( = ?auto_41345 ?auto_41353 ) ) ( HOIST-AT ?auto_41358 ?auto_41353 ) ( not ( = ?auto_41348 ?auto_41358 ) ) ( not ( = ?auto_41354 ?auto_41358 ) ) ( not ( = ?auto_41356 ?auto_41358 ) ) ( AVAILABLE ?auto_41358 ) ( SURFACE-AT ?auto_41359 ?auto_41353 ) ( ON ?auto_41359 ?auto_41350 ) ( CLEAR ?auto_41359 ) ( not ( = ?auto_41343 ?auto_41350 ) ) ( not ( = ?auto_41344 ?auto_41350 ) ) ( not ( = ?auto_41352 ?auto_41350 ) ) ( not ( = ?auto_41359 ?auto_41350 ) ) ( not ( = ?auto_41355 ?auto_41350 ) ) ( not ( = ?auto_41349 ?auto_41350 ) ) ( SURFACE-AT ?auto_41357 ?auto_41351 ) ( CLEAR ?auto_41357 ) ( IS-CRATE ?auto_41349 ) ( not ( = ?auto_41343 ?auto_41357 ) ) ( not ( = ?auto_41344 ?auto_41357 ) ) ( not ( = ?auto_41352 ?auto_41357 ) ) ( not ( = ?auto_41359 ?auto_41357 ) ) ( not ( = ?auto_41355 ?auto_41357 ) ) ( not ( = ?auto_41349 ?auto_41357 ) ) ( not ( = ?auto_41350 ?auto_41357 ) ) ( AVAILABLE ?auto_41348 ) ( IN ?auto_41349 ?auto_41347 ) ( TRUCK-AT ?auto_41347 ?auto_41360 ) ( not ( = ?auto_41360 ?auto_41351 ) ) ( not ( = ?auto_41346 ?auto_41360 ) ) ( not ( = ?auto_41345 ?auto_41360 ) ) ( not ( = ?auto_41353 ?auto_41360 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_41347 ?auto_41360 ?auto_41351 )
      ( MAKE-ON ?auto_41343 ?auto_41344 )
      ( MAKE-ON-VERIFY ?auto_41343 ?auto_41344 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41361 - SURFACE
      ?auto_41362 - SURFACE
    )
    :vars
    (
      ?auto_41374 - HOIST
      ?auto_41375 - PLACE
      ?auto_41369 - PLACE
      ?auto_41376 - HOIST
      ?auto_41367 - SURFACE
      ?auto_41365 - SURFACE
      ?auto_41363 - PLACE
      ?auto_41378 - HOIST
      ?auto_41371 - SURFACE
      ?auto_41377 - SURFACE
      ?auto_41364 - PLACE
      ?auto_41366 - HOIST
      ?auto_41368 - SURFACE
      ?auto_41372 - SURFACE
      ?auto_41370 - TRUCK
      ?auto_41373 - PLACE
      ?auto_41379 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_41374 ?auto_41375 ) ( IS-CRATE ?auto_41361 ) ( not ( = ?auto_41361 ?auto_41362 ) ) ( not ( = ?auto_41369 ?auto_41375 ) ) ( HOIST-AT ?auto_41376 ?auto_41369 ) ( not ( = ?auto_41374 ?auto_41376 ) ) ( AVAILABLE ?auto_41376 ) ( SURFACE-AT ?auto_41361 ?auto_41369 ) ( ON ?auto_41361 ?auto_41367 ) ( CLEAR ?auto_41361 ) ( not ( = ?auto_41361 ?auto_41367 ) ) ( not ( = ?auto_41362 ?auto_41367 ) ) ( IS-CRATE ?auto_41362 ) ( not ( = ?auto_41361 ?auto_41365 ) ) ( not ( = ?auto_41362 ?auto_41365 ) ) ( not ( = ?auto_41367 ?auto_41365 ) ) ( not ( = ?auto_41363 ?auto_41375 ) ) ( not ( = ?auto_41369 ?auto_41363 ) ) ( HOIST-AT ?auto_41378 ?auto_41363 ) ( not ( = ?auto_41374 ?auto_41378 ) ) ( not ( = ?auto_41376 ?auto_41378 ) ) ( AVAILABLE ?auto_41378 ) ( SURFACE-AT ?auto_41362 ?auto_41363 ) ( ON ?auto_41362 ?auto_41371 ) ( CLEAR ?auto_41362 ) ( not ( = ?auto_41361 ?auto_41371 ) ) ( not ( = ?auto_41362 ?auto_41371 ) ) ( not ( = ?auto_41367 ?auto_41371 ) ) ( not ( = ?auto_41365 ?auto_41371 ) ) ( IS-CRATE ?auto_41365 ) ( not ( = ?auto_41361 ?auto_41377 ) ) ( not ( = ?auto_41362 ?auto_41377 ) ) ( not ( = ?auto_41367 ?auto_41377 ) ) ( not ( = ?auto_41365 ?auto_41377 ) ) ( not ( = ?auto_41371 ?auto_41377 ) ) ( not ( = ?auto_41364 ?auto_41375 ) ) ( not ( = ?auto_41369 ?auto_41364 ) ) ( not ( = ?auto_41363 ?auto_41364 ) ) ( HOIST-AT ?auto_41366 ?auto_41364 ) ( not ( = ?auto_41374 ?auto_41366 ) ) ( not ( = ?auto_41376 ?auto_41366 ) ) ( not ( = ?auto_41378 ?auto_41366 ) ) ( AVAILABLE ?auto_41366 ) ( SURFACE-AT ?auto_41365 ?auto_41364 ) ( ON ?auto_41365 ?auto_41368 ) ( CLEAR ?auto_41365 ) ( not ( = ?auto_41361 ?auto_41368 ) ) ( not ( = ?auto_41362 ?auto_41368 ) ) ( not ( = ?auto_41367 ?auto_41368 ) ) ( not ( = ?auto_41365 ?auto_41368 ) ) ( not ( = ?auto_41371 ?auto_41368 ) ) ( not ( = ?auto_41377 ?auto_41368 ) ) ( SURFACE-AT ?auto_41372 ?auto_41375 ) ( CLEAR ?auto_41372 ) ( IS-CRATE ?auto_41377 ) ( not ( = ?auto_41361 ?auto_41372 ) ) ( not ( = ?auto_41362 ?auto_41372 ) ) ( not ( = ?auto_41367 ?auto_41372 ) ) ( not ( = ?auto_41365 ?auto_41372 ) ) ( not ( = ?auto_41371 ?auto_41372 ) ) ( not ( = ?auto_41377 ?auto_41372 ) ) ( not ( = ?auto_41368 ?auto_41372 ) ) ( AVAILABLE ?auto_41374 ) ( TRUCK-AT ?auto_41370 ?auto_41373 ) ( not ( = ?auto_41373 ?auto_41375 ) ) ( not ( = ?auto_41369 ?auto_41373 ) ) ( not ( = ?auto_41363 ?auto_41373 ) ) ( not ( = ?auto_41364 ?auto_41373 ) ) ( HOIST-AT ?auto_41379 ?auto_41373 ) ( LIFTING ?auto_41379 ?auto_41377 ) ( not ( = ?auto_41374 ?auto_41379 ) ) ( not ( = ?auto_41376 ?auto_41379 ) ) ( not ( = ?auto_41378 ?auto_41379 ) ) ( not ( = ?auto_41366 ?auto_41379 ) ) )
    :subtasks
    ( ( !LOAD ?auto_41379 ?auto_41377 ?auto_41370 ?auto_41373 )
      ( MAKE-ON ?auto_41361 ?auto_41362 )
      ( MAKE-ON-VERIFY ?auto_41361 ?auto_41362 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41380 - SURFACE
      ?auto_41381 - SURFACE
    )
    :vars
    (
      ?auto_41393 - HOIST
      ?auto_41384 - PLACE
      ?auto_41395 - PLACE
      ?auto_41387 - HOIST
      ?auto_41391 - SURFACE
      ?auto_41388 - SURFACE
      ?auto_41397 - PLACE
      ?auto_41394 - HOIST
      ?auto_41386 - SURFACE
      ?auto_41382 - SURFACE
      ?auto_41390 - PLACE
      ?auto_41398 - HOIST
      ?auto_41385 - SURFACE
      ?auto_41383 - SURFACE
      ?auto_41389 - TRUCK
      ?auto_41392 - PLACE
      ?auto_41396 - HOIST
      ?auto_41399 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41393 ?auto_41384 ) ( IS-CRATE ?auto_41380 ) ( not ( = ?auto_41380 ?auto_41381 ) ) ( not ( = ?auto_41395 ?auto_41384 ) ) ( HOIST-AT ?auto_41387 ?auto_41395 ) ( not ( = ?auto_41393 ?auto_41387 ) ) ( AVAILABLE ?auto_41387 ) ( SURFACE-AT ?auto_41380 ?auto_41395 ) ( ON ?auto_41380 ?auto_41391 ) ( CLEAR ?auto_41380 ) ( not ( = ?auto_41380 ?auto_41391 ) ) ( not ( = ?auto_41381 ?auto_41391 ) ) ( IS-CRATE ?auto_41381 ) ( not ( = ?auto_41380 ?auto_41388 ) ) ( not ( = ?auto_41381 ?auto_41388 ) ) ( not ( = ?auto_41391 ?auto_41388 ) ) ( not ( = ?auto_41397 ?auto_41384 ) ) ( not ( = ?auto_41395 ?auto_41397 ) ) ( HOIST-AT ?auto_41394 ?auto_41397 ) ( not ( = ?auto_41393 ?auto_41394 ) ) ( not ( = ?auto_41387 ?auto_41394 ) ) ( AVAILABLE ?auto_41394 ) ( SURFACE-AT ?auto_41381 ?auto_41397 ) ( ON ?auto_41381 ?auto_41386 ) ( CLEAR ?auto_41381 ) ( not ( = ?auto_41380 ?auto_41386 ) ) ( not ( = ?auto_41381 ?auto_41386 ) ) ( not ( = ?auto_41391 ?auto_41386 ) ) ( not ( = ?auto_41388 ?auto_41386 ) ) ( IS-CRATE ?auto_41388 ) ( not ( = ?auto_41380 ?auto_41382 ) ) ( not ( = ?auto_41381 ?auto_41382 ) ) ( not ( = ?auto_41391 ?auto_41382 ) ) ( not ( = ?auto_41388 ?auto_41382 ) ) ( not ( = ?auto_41386 ?auto_41382 ) ) ( not ( = ?auto_41390 ?auto_41384 ) ) ( not ( = ?auto_41395 ?auto_41390 ) ) ( not ( = ?auto_41397 ?auto_41390 ) ) ( HOIST-AT ?auto_41398 ?auto_41390 ) ( not ( = ?auto_41393 ?auto_41398 ) ) ( not ( = ?auto_41387 ?auto_41398 ) ) ( not ( = ?auto_41394 ?auto_41398 ) ) ( AVAILABLE ?auto_41398 ) ( SURFACE-AT ?auto_41388 ?auto_41390 ) ( ON ?auto_41388 ?auto_41385 ) ( CLEAR ?auto_41388 ) ( not ( = ?auto_41380 ?auto_41385 ) ) ( not ( = ?auto_41381 ?auto_41385 ) ) ( not ( = ?auto_41391 ?auto_41385 ) ) ( not ( = ?auto_41388 ?auto_41385 ) ) ( not ( = ?auto_41386 ?auto_41385 ) ) ( not ( = ?auto_41382 ?auto_41385 ) ) ( SURFACE-AT ?auto_41383 ?auto_41384 ) ( CLEAR ?auto_41383 ) ( IS-CRATE ?auto_41382 ) ( not ( = ?auto_41380 ?auto_41383 ) ) ( not ( = ?auto_41381 ?auto_41383 ) ) ( not ( = ?auto_41391 ?auto_41383 ) ) ( not ( = ?auto_41388 ?auto_41383 ) ) ( not ( = ?auto_41386 ?auto_41383 ) ) ( not ( = ?auto_41382 ?auto_41383 ) ) ( not ( = ?auto_41385 ?auto_41383 ) ) ( AVAILABLE ?auto_41393 ) ( TRUCK-AT ?auto_41389 ?auto_41392 ) ( not ( = ?auto_41392 ?auto_41384 ) ) ( not ( = ?auto_41395 ?auto_41392 ) ) ( not ( = ?auto_41397 ?auto_41392 ) ) ( not ( = ?auto_41390 ?auto_41392 ) ) ( HOIST-AT ?auto_41396 ?auto_41392 ) ( not ( = ?auto_41393 ?auto_41396 ) ) ( not ( = ?auto_41387 ?auto_41396 ) ) ( not ( = ?auto_41394 ?auto_41396 ) ) ( not ( = ?auto_41398 ?auto_41396 ) ) ( AVAILABLE ?auto_41396 ) ( SURFACE-AT ?auto_41382 ?auto_41392 ) ( ON ?auto_41382 ?auto_41399 ) ( CLEAR ?auto_41382 ) ( not ( = ?auto_41380 ?auto_41399 ) ) ( not ( = ?auto_41381 ?auto_41399 ) ) ( not ( = ?auto_41391 ?auto_41399 ) ) ( not ( = ?auto_41388 ?auto_41399 ) ) ( not ( = ?auto_41386 ?auto_41399 ) ) ( not ( = ?auto_41382 ?auto_41399 ) ) ( not ( = ?auto_41385 ?auto_41399 ) ) ( not ( = ?auto_41383 ?auto_41399 ) ) )
    :subtasks
    ( ( !LIFT ?auto_41396 ?auto_41382 ?auto_41399 ?auto_41392 )
      ( MAKE-ON ?auto_41380 ?auto_41381 )
      ( MAKE-ON-VERIFY ?auto_41380 ?auto_41381 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41400 - SURFACE
      ?auto_41401 - SURFACE
    )
    :vars
    (
      ?auto_41416 - HOIST
      ?auto_41403 - PLACE
      ?auto_41419 - PLACE
      ?auto_41414 - HOIST
      ?auto_41417 - SURFACE
      ?auto_41410 - SURFACE
      ?auto_41412 - PLACE
      ?auto_41406 - HOIST
      ?auto_41407 - SURFACE
      ?auto_41413 - SURFACE
      ?auto_41418 - PLACE
      ?auto_41411 - HOIST
      ?auto_41409 - SURFACE
      ?auto_41402 - SURFACE
      ?auto_41415 - PLACE
      ?auto_41408 - HOIST
      ?auto_41405 - SURFACE
      ?auto_41404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41416 ?auto_41403 ) ( IS-CRATE ?auto_41400 ) ( not ( = ?auto_41400 ?auto_41401 ) ) ( not ( = ?auto_41419 ?auto_41403 ) ) ( HOIST-AT ?auto_41414 ?auto_41419 ) ( not ( = ?auto_41416 ?auto_41414 ) ) ( AVAILABLE ?auto_41414 ) ( SURFACE-AT ?auto_41400 ?auto_41419 ) ( ON ?auto_41400 ?auto_41417 ) ( CLEAR ?auto_41400 ) ( not ( = ?auto_41400 ?auto_41417 ) ) ( not ( = ?auto_41401 ?auto_41417 ) ) ( IS-CRATE ?auto_41401 ) ( not ( = ?auto_41400 ?auto_41410 ) ) ( not ( = ?auto_41401 ?auto_41410 ) ) ( not ( = ?auto_41417 ?auto_41410 ) ) ( not ( = ?auto_41412 ?auto_41403 ) ) ( not ( = ?auto_41419 ?auto_41412 ) ) ( HOIST-AT ?auto_41406 ?auto_41412 ) ( not ( = ?auto_41416 ?auto_41406 ) ) ( not ( = ?auto_41414 ?auto_41406 ) ) ( AVAILABLE ?auto_41406 ) ( SURFACE-AT ?auto_41401 ?auto_41412 ) ( ON ?auto_41401 ?auto_41407 ) ( CLEAR ?auto_41401 ) ( not ( = ?auto_41400 ?auto_41407 ) ) ( not ( = ?auto_41401 ?auto_41407 ) ) ( not ( = ?auto_41417 ?auto_41407 ) ) ( not ( = ?auto_41410 ?auto_41407 ) ) ( IS-CRATE ?auto_41410 ) ( not ( = ?auto_41400 ?auto_41413 ) ) ( not ( = ?auto_41401 ?auto_41413 ) ) ( not ( = ?auto_41417 ?auto_41413 ) ) ( not ( = ?auto_41410 ?auto_41413 ) ) ( not ( = ?auto_41407 ?auto_41413 ) ) ( not ( = ?auto_41418 ?auto_41403 ) ) ( not ( = ?auto_41419 ?auto_41418 ) ) ( not ( = ?auto_41412 ?auto_41418 ) ) ( HOIST-AT ?auto_41411 ?auto_41418 ) ( not ( = ?auto_41416 ?auto_41411 ) ) ( not ( = ?auto_41414 ?auto_41411 ) ) ( not ( = ?auto_41406 ?auto_41411 ) ) ( AVAILABLE ?auto_41411 ) ( SURFACE-AT ?auto_41410 ?auto_41418 ) ( ON ?auto_41410 ?auto_41409 ) ( CLEAR ?auto_41410 ) ( not ( = ?auto_41400 ?auto_41409 ) ) ( not ( = ?auto_41401 ?auto_41409 ) ) ( not ( = ?auto_41417 ?auto_41409 ) ) ( not ( = ?auto_41410 ?auto_41409 ) ) ( not ( = ?auto_41407 ?auto_41409 ) ) ( not ( = ?auto_41413 ?auto_41409 ) ) ( SURFACE-AT ?auto_41402 ?auto_41403 ) ( CLEAR ?auto_41402 ) ( IS-CRATE ?auto_41413 ) ( not ( = ?auto_41400 ?auto_41402 ) ) ( not ( = ?auto_41401 ?auto_41402 ) ) ( not ( = ?auto_41417 ?auto_41402 ) ) ( not ( = ?auto_41410 ?auto_41402 ) ) ( not ( = ?auto_41407 ?auto_41402 ) ) ( not ( = ?auto_41413 ?auto_41402 ) ) ( not ( = ?auto_41409 ?auto_41402 ) ) ( AVAILABLE ?auto_41416 ) ( not ( = ?auto_41415 ?auto_41403 ) ) ( not ( = ?auto_41419 ?auto_41415 ) ) ( not ( = ?auto_41412 ?auto_41415 ) ) ( not ( = ?auto_41418 ?auto_41415 ) ) ( HOIST-AT ?auto_41408 ?auto_41415 ) ( not ( = ?auto_41416 ?auto_41408 ) ) ( not ( = ?auto_41414 ?auto_41408 ) ) ( not ( = ?auto_41406 ?auto_41408 ) ) ( not ( = ?auto_41411 ?auto_41408 ) ) ( AVAILABLE ?auto_41408 ) ( SURFACE-AT ?auto_41413 ?auto_41415 ) ( ON ?auto_41413 ?auto_41405 ) ( CLEAR ?auto_41413 ) ( not ( = ?auto_41400 ?auto_41405 ) ) ( not ( = ?auto_41401 ?auto_41405 ) ) ( not ( = ?auto_41417 ?auto_41405 ) ) ( not ( = ?auto_41410 ?auto_41405 ) ) ( not ( = ?auto_41407 ?auto_41405 ) ) ( not ( = ?auto_41413 ?auto_41405 ) ) ( not ( = ?auto_41409 ?auto_41405 ) ) ( not ( = ?auto_41402 ?auto_41405 ) ) ( TRUCK-AT ?auto_41404 ?auto_41403 ) )
    :subtasks
    ( ( !DRIVE ?auto_41404 ?auto_41403 ?auto_41415 )
      ( MAKE-ON ?auto_41400 ?auto_41401 )
      ( MAKE-ON-VERIFY ?auto_41400 ?auto_41401 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41420 - SURFACE
      ?auto_41421 - SURFACE
    )
    :vars
    (
      ?auto_41427 - HOIST
      ?auto_41424 - PLACE
      ?auto_41430 - PLACE
      ?auto_41438 - HOIST
      ?auto_41431 - SURFACE
      ?auto_41426 - SURFACE
      ?auto_41432 - PLACE
      ?auto_41433 - HOIST
      ?auto_41422 - SURFACE
      ?auto_41434 - SURFACE
      ?auto_41429 - PLACE
      ?auto_41428 - HOIST
      ?auto_41439 - SURFACE
      ?auto_41423 - SURFACE
      ?auto_41437 - PLACE
      ?auto_41425 - HOIST
      ?auto_41436 - SURFACE
      ?auto_41435 - TRUCK
      ?auto_41440 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41427 ?auto_41424 ) ( IS-CRATE ?auto_41420 ) ( not ( = ?auto_41420 ?auto_41421 ) ) ( not ( = ?auto_41430 ?auto_41424 ) ) ( HOIST-AT ?auto_41438 ?auto_41430 ) ( not ( = ?auto_41427 ?auto_41438 ) ) ( AVAILABLE ?auto_41438 ) ( SURFACE-AT ?auto_41420 ?auto_41430 ) ( ON ?auto_41420 ?auto_41431 ) ( CLEAR ?auto_41420 ) ( not ( = ?auto_41420 ?auto_41431 ) ) ( not ( = ?auto_41421 ?auto_41431 ) ) ( IS-CRATE ?auto_41421 ) ( not ( = ?auto_41420 ?auto_41426 ) ) ( not ( = ?auto_41421 ?auto_41426 ) ) ( not ( = ?auto_41431 ?auto_41426 ) ) ( not ( = ?auto_41432 ?auto_41424 ) ) ( not ( = ?auto_41430 ?auto_41432 ) ) ( HOIST-AT ?auto_41433 ?auto_41432 ) ( not ( = ?auto_41427 ?auto_41433 ) ) ( not ( = ?auto_41438 ?auto_41433 ) ) ( AVAILABLE ?auto_41433 ) ( SURFACE-AT ?auto_41421 ?auto_41432 ) ( ON ?auto_41421 ?auto_41422 ) ( CLEAR ?auto_41421 ) ( not ( = ?auto_41420 ?auto_41422 ) ) ( not ( = ?auto_41421 ?auto_41422 ) ) ( not ( = ?auto_41431 ?auto_41422 ) ) ( not ( = ?auto_41426 ?auto_41422 ) ) ( IS-CRATE ?auto_41426 ) ( not ( = ?auto_41420 ?auto_41434 ) ) ( not ( = ?auto_41421 ?auto_41434 ) ) ( not ( = ?auto_41431 ?auto_41434 ) ) ( not ( = ?auto_41426 ?auto_41434 ) ) ( not ( = ?auto_41422 ?auto_41434 ) ) ( not ( = ?auto_41429 ?auto_41424 ) ) ( not ( = ?auto_41430 ?auto_41429 ) ) ( not ( = ?auto_41432 ?auto_41429 ) ) ( HOIST-AT ?auto_41428 ?auto_41429 ) ( not ( = ?auto_41427 ?auto_41428 ) ) ( not ( = ?auto_41438 ?auto_41428 ) ) ( not ( = ?auto_41433 ?auto_41428 ) ) ( AVAILABLE ?auto_41428 ) ( SURFACE-AT ?auto_41426 ?auto_41429 ) ( ON ?auto_41426 ?auto_41439 ) ( CLEAR ?auto_41426 ) ( not ( = ?auto_41420 ?auto_41439 ) ) ( not ( = ?auto_41421 ?auto_41439 ) ) ( not ( = ?auto_41431 ?auto_41439 ) ) ( not ( = ?auto_41426 ?auto_41439 ) ) ( not ( = ?auto_41422 ?auto_41439 ) ) ( not ( = ?auto_41434 ?auto_41439 ) ) ( IS-CRATE ?auto_41434 ) ( not ( = ?auto_41420 ?auto_41423 ) ) ( not ( = ?auto_41421 ?auto_41423 ) ) ( not ( = ?auto_41431 ?auto_41423 ) ) ( not ( = ?auto_41426 ?auto_41423 ) ) ( not ( = ?auto_41422 ?auto_41423 ) ) ( not ( = ?auto_41434 ?auto_41423 ) ) ( not ( = ?auto_41439 ?auto_41423 ) ) ( not ( = ?auto_41437 ?auto_41424 ) ) ( not ( = ?auto_41430 ?auto_41437 ) ) ( not ( = ?auto_41432 ?auto_41437 ) ) ( not ( = ?auto_41429 ?auto_41437 ) ) ( HOIST-AT ?auto_41425 ?auto_41437 ) ( not ( = ?auto_41427 ?auto_41425 ) ) ( not ( = ?auto_41438 ?auto_41425 ) ) ( not ( = ?auto_41433 ?auto_41425 ) ) ( not ( = ?auto_41428 ?auto_41425 ) ) ( AVAILABLE ?auto_41425 ) ( SURFACE-AT ?auto_41434 ?auto_41437 ) ( ON ?auto_41434 ?auto_41436 ) ( CLEAR ?auto_41434 ) ( not ( = ?auto_41420 ?auto_41436 ) ) ( not ( = ?auto_41421 ?auto_41436 ) ) ( not ( = ?auto_41431 ?auto_41436 ) ) ( not ( = ?auto_41426 ?auto_41436 ) ) ( not ( = ?auto_41422 ?auto_41436 ) ) ( not ( = ?auto_41434 ?auto_41436 ) ) ( not ( = ?auto_41439 ?auto_41436 ) ) ( not ( = ?auto_41423 ?auto_41436 ) ) ( TRUCK-AT ?auto_41435 ?auto_41424 ) ( SURFACE-AT ?auto_41440 ?auto_41424 ) ( CLEAR ?auto_41440 ) ( LIFTING ?auto_41427 ?auto_41423 ) ( IS-CRATE ?auto_41423 ) ( not ( = ?auto_41420 ?auto_41440 ) ) ( not ( = ?auto_41421 ?auto_41440 ) ) ( not ( = ?auto_41431 ?auto_41440 ) ) ( not ( = ?auto_41426 ?auto_41440 ) ) ( not ( = ?auto_41422 ?auto_41440 ) ) ( not ( = ?auto_41434 ?auto_41440 ) ) ( not ( = ?auto_41439 ?auto_41440 ) ) ( not ( = ?auto_41423 ?auto_41440 ) ) ( not ( = ?auto_41436 ?auto_41440 ) ) )
    :subtasks
    ( ( !DROP ?auto_41427 ?auto_41423 ?auto_41440 ?auto_41424 )
      ( MAKE-ON ?auto_41420 ?auto_41421 )
      ( MAKE-ON-VERIFY ?auto_41420 ?auto_41421 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41441 - SURFACE
      ?auto_41442 - SURFACE
    )
    :vars
    (
      ?auto_41460 - HOIST
      ?auto_41457 - PLACE
      ?auto_41443 - PLACE
      ?auto_41447 - HOIST
      ?auto_41451 - SURFACE
      ?auto_41459 - SURFACE
      ?auto_41452 - PLACE
      ?auto_41455 - HOIST
      ?auto_41446 - SURFACE
      ?auto_41449 - SURFACE
      ?auto_41454 - PLACE
      ?auto_41444 - HOIST
      ?auto_41448 - SURFACE
      ?auto_41456 - SURFACE
      ?auto_41445 - PLACE
      ?auto_41458 - HOIST
      ?auto_41450 - SURFACE
      ?auto_41453 - TRUCK
      ?auto_41461 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41460 ?auto_41457 ) ( IS-CRATE ?auto_41441 ) ( not ( = ?auto_41441 ?auto_41442 ) ) ( not ( = ?auto_41443 ?auto_41457 ) ) ( HOIST-AT ?auto_41447 ?auto_41443 ) ( not ( = ?auto_41460 ?auto_41447 ) ) ( AVAILABLE ?auto_41447 ) ( SURFACE-AT ?auto_41441 ?auto_41443 ) ( ON ?auto_41441 ?auto_41451 ) ( CLEAR ?auto_41441 ) ( not ( = ?auto_41441 ?auto_41451 ) ) ( not ( = ?auto_41442 ?auto_41451 ) ) ( IS-CRATE ?auto_41442 ) ( not ( = ?auto_41441 ?auto_41459 ) ) ( not ( = ?auto_41442 ?auto_41459 ) ) ( not ( = ?auto_41451 ?auto_41459 ) ) ( not ( = ?auto_41452 ?auto_41457 ) ) ( not ( = ?auto_41443 ?auto_41452 ) ) ( HOIST-AT ?auto_41455 ?auto_41452 ) ( not ( = ?auto_41460 ?auto_41455 ) ) ( not ( = ?auto_41447 ?auto_41455 ) ) ( AVAILABLE ?auto_41455 ) ( SURFACE-AT ?auto_41442 ?auto_41452 ) ( ON ?auto_41442 ?auto_41446 ) ( CLEAR ?auto_41442 ) ( not ( = ?auto_41441 ?auto_41446 ) ) ( not ( = ?auto_41442 ?auto_41446 ) ) ( not ( = ?auto_41451 ?auto_41446 ) ) ( not ( = ?auto_41459 ?auto_41446 ) ) ( IS-CRATE ?auto_41459 ) ( not ( = ?auto_41441 ?auto_41449 ) ) ( not ( = ?auto_41442 ?auto_41449 ) ) ( not ( = ?auto_41451 ?auto_41449 ) ) ( not ( = ?auto_41459 ?auto_41449 ) ) ( not ( = ?auto_41446 ?auto_41449 ) ) ( not ( = ?auto_41454 ?auto_41457 ) ) ( not ( = ?auto_41443 ?auto_41454 ) ) ( not ( = ?auto_41452 ?auto_41454 ) ) ( HOIST-AT ?auto_41444 ?auto_41454 ) ( not ( = ?auto_41460 ?auto_41444 ) ) ( not ( = ?auto_41447 ?auto_41444 ) ) ( not ( = ?auto_41455 ?auto_41444 ) ) ( AVAILABLE ?auto_41444 ) ( SURFACE-AT ?auto_41459 ?auto_41454 ) ( ON ?auto_41459 ?auto_41448 ) ( CLEAR ?auto_41459 ) ( not ( = ?auto_41441 ?auto_41448 ) ) ( not ( = ?auto_41442 ?auto_41448 ) ) ( not ( = ?auto_41451 ?auto_41448 ) ) ( not ( = ?auto_41459 ?auto_41448 ) ) ( not ( = ?auto_41446 ?auto_41448 ) ) ( not ( = ?auto_41449 ?auto_41448 ) ) ( IS-CRATE ?auto_41449 ) ( not ( = ?auto_41441 ?auto_41456 ) ) ( not ( = ?auto_41442 ?auto_41456 ) ) ( not ( = ?auto_41451 ?auto_41456 ) ) ( not ( = ?auto_41459 ?auto_41456 ) ) ( not ( = ?auto_41446 ?auto_41456 ) ) ( not ( = ?auto_41449 ?auto_41456 ) ) ( not ( = ?auto_41448 ?auto_41456 ) ) ( not ( = ?auto_41445 ?auto_41457 ) ) ( not ( = ?auto_41443 ?auto_41445 ) ) ( not ( = ?auto_41452 ?auto_41445 ) ) ( not ( = ?auto_41454 ?auto_41445 ) ) ( HOIST-AT ?auto_41458 ?auto_41445 ) ( not ( = ?auto_41460 ?auto_41458 ) ) ( not ( = ?auto_41447 ?auto_41458 ) ) ( not ( = ?auto_41455 ?auto_41458 ) ) ( not ( = ?auto_41444 ?auto_41458 ) ) ( AVAILABLE ?auto_41458 ) ( SURFACE-AT ?auto_41449 ?auto_41445 ) ( ON ?auto_41449 ?auto_41450 ) ( CLEAR ?auto_41449 ) ( not ( = ?auto_41441 ?auto_41450 ) ) ( not ( = ?auto_41442 ?auto_41450 ) ) ( not ( = ?auto_41451 ?auto_41450 ) ) ( not ( = ?auto_41459 ?auto_41450 ) ) ( not ( = ?auto_41446 ?auto_41450 ) ) ( not ( = ?auto_41449 ?auto_41450 ) ) ( not ( = ?auto_41448 ?auto_41450 ) ) ( not ( = ?auto_41456 ?auto_41450 ) ) ( TRUCK-AT ?auto_41453 ?auto_41457 ) ( SURFACE-AT ?auto_41461 ?auto_41457 ) ( CLEAR ?auto_41461 ) ( IS-CRATE ?auto_41456 ) ( not ( = ?auto_41441 ?auto_41461 ) ) ( not ( = ?auto_41442 ?auto_41461 ) ) ( not ( = ?auto_41451 ?auto_41461 ) ) ( not ( = ?auto_41459 ?auto_41461 ) ) ( not ( = ?auto_41446 ?auto_41461 ) ) ( not ( = ?auto_41449 ?auto_41461 ) ) ( not ( = ?auto_41448 ?auto_41461 ) ) ( not ( = ?auto_41456 ?auto_41461 ) ) ( not ( = ?auto_41450 ?auto_41461 ) ) ( AVAILABLE ?auto_41460 ) ( IN ?auto_41456 ?auto_41453 ) )
    :subtasks
    ( ( !UNLOAD ?auto_41460 ?auto_41456 ?auto_41453 ?auto_41457 )
      ( MAKE-ON ?auto_41441 ?auto_41442 )
      ( MAKE-ON-VERIFY ?auto_41441 ?auto_41442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41462 - SURFACE
      ?auto_41463 - SURFACE
    )
    :vars
    (
      ?auto_41468 - HOIST
      ?auto_41481 - PLACE
      ?auto_41480 - PLACE
      ?auto_41465 - HOIST
      ?auto_41474 - SURFACE
      ?auto_41469 - SURFACE
      ?auto_41478 - PLACE
      ?auto_41473 - HOIST
      ?auto_41471 - SURFACE
      ?auto_41476 - SURFACE
      ?auto_41475 - PLACE
      ?auto_41464 - HOIST
      ?auto_41477 - SURFACE
      ?auto_41482 - SURFACE
      ?auto_41466 - PLACE
      ?auto_41470 - HOIST
      ?auto_41472 - SURFACE
      ?auto_41467 - SURFACE
      ?auto_41479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41468 ?auto_41481 ) ( IS-CRATE ?auto_41462 ) ( not ( = ?auto_41462 ?auto_41463 ) ) ( not ( = ?auto_41480 ?auto_41481 ) ) ( HOIST-AT ?auto_41465 ?auto_41480 ) ( not ( = ?auto_41468 ?auto_41465 ) ) ( AVAILABLE ?auto_41465 ) ( SURFACE-AT ?auto_41462 ?auto_41480 ) ( ON ?auto_41462 ?auto_41474 ) ( CLEAR ?auto_41462 ) ( not ( = ?auto_41462 ?auto_41474 ) ) ( not ( = ?auto_41463 ?auto_41474 ) ) ( IS-CRATE ?auto_41463 ) ( not ( = ?auto_41462 ?auto_41469 ) ) ( not ( = ?auto_41463 ?auto_41469 ) ) ( not ( = ?auto_41474 ?auto_41469 ) ) ( not ( = ?auto_41478 ?auto_41481 ) ) ( not ( = ?auto_41480 ?auto_41478 ) ) ( HOIST-AT ?auto_41473 ?auto_41478 ) ( not ( = ?auto_41468 ?auto_41473 ) ) ( not ( = ?auto_41465 ?auto_41473 ) ) ( AVAILABLE ?auto_41473 ) ( SURFACE-AT ?auto_41463 ?auto_41478 ) ( ON ?auto_41463 ?auto_41471 ) ( CLEAR ?auto_41463 ) ( not ( = ?auto_41462 ?auto_41471 ) ) ( not ( = ?auto_41463 ?auto_41471 ) ) ( not ( = ?auto_41474 ?auto_41471 ) ) ( not ( = ?auto_41469 ?auto_41471 ) ) ( IS-CRATE ?auto_41469 ) ( not ( = ?auto_41462 ?auto_41476 ) ) ( not ( = ?auto_41463 ?auto_41476 ) ) ( not ( = ?auto_41474 ?auto_41476 ) ) ( not ( = ?auto_41469 ?auto_41476 ) ) ( not ( = ?auto_41471 ?auto_41476 ) ) ( not ( = ?auto_41475 ?auto_41481 ) ) ( not ( = ?auto_41480 ?auto_41475 ) ) ( not ( = ?auto_41478 ?auto_41475 ) ) ( HOIST-AT ?auto_41464 ?auto_41475 ) ( not ( = ?auto_41468 ?auto_41464 ) ) ( not ( = ?auto_41465 ?auto_41464 ) ) ( not ( = ?auto_41473 ?auto_41464 ) ) ( AVAILABLE ?auto_41464 ) ( SURFACE-AT ?auto_41469 ?auto_41475 ) ( ON ?auto_41469 ?auto_41477 ) ( CLEAR ?auto_41469 ) ( not ( = ?auto_41462 ?auto_41477 ) ) ( not ( = ?auto_41463 ?auto_41477 ) ) ( not ( = ?auto_41474 ?auto_41477 ) ) ( not ( = ?auto_41469 ?auto_41477 ) ) ( not ( = ?auto_41471 ?auto_41477 ) ) ( not ( = ?auto_41476 ?auto_41477 ) ) ( IS-CRATE ?auto_41476 ) ( not ( = ?auto_41462 ?auto_41482 ) ) ( not ( = ?auto_41463 ?auto_41482 ) ) ( not ( = ?auto_41474 ?auto_41482 ) ) ( not ( = ?auto_41469 ?auto_41482 ) ) ( not ( = ?auto_41471 ?auto_41482 ) ) ( not ( = ?auto_41476 ?auto_41482 ) ) ( not ( = ?auto_41477 ?auto_41482 ) ) ( not ( = ?auto_41466 ?auto_41481 ) ) ( not ( = ?auto_41480 ?auto_41466 ) ) ( not ( = ?auto_41478 ?auto_41466 ) ) ( not ( = ?auto_41475 ?auto_41466 ) ) ( HOIST-AT ?auto_41470 ?auto_41466 ) ( not ( = ?auto_41468 ?auto_41470 ) ) ( not ( = ?auto_41465 ?auto_41470 ) ) ( not ( = ?auto_41473 ?auto_41470 ) ) ( not ( = ?auto_41464 ?auto_41470 ) ) ( AVAILABLE ?auto_41470 ) ( SURFACE-AT ?auto_41476 ?auto_41466 ) ( ON ?auto_41476 ?auto_41472 ) ( CLEAR ?auto_41476 ) ( not ( = ?auto_41462 ?auto_41472 ) ) ( not ( = ?auto_41463 ?auto_41472 ) ) ( not ( = ?auto_41474 ?auto_41472 ) ) ( not ( = ?auto_41469 ?auto_41472 ) ) ( not ( = ?auto_41471 ?auto_41472 ) ) ( not ( = ?auto_41476 ?auto_41472 ) ) ( not ( = ?auto_41477 ?auto_41472 ) ) ( not ( = ?auto_41482 ?auto_41472 ) ) ( SURFACE-AT ?auto_41467 ?auto_41481 ) ( CLEAR ?auto_41467 ) ( IS-CRATE ?auto_41482 ) ( not ( = ?auto_41462 ?auto_41467 ) ) ( not ( = ?auto_41463 ?auto_41467 ) ) ( not ( = ?auto_41474 ?auto_41467 ) ) ( not ( = ?auto_41469 ?auto_41467 ) ) ( not ( = ?auto_41471 ?auto_41467 ) ) ( not ( = ?auto_41476 ?auto_41467 ) ) ( not ( = ?auto_41477 ?auto_41467 ) ) ( not ( = ?auto_41482 ?auto_41467 ) ) ( not ( = ?auto_41472 ?auto_41467 ) ) ( AVAILABLE ?auto_41468 ) ( IN ?auto_41482 ?auto_41479 ) ( TRUCK-AT ?auto_41479 ?auto_41480 ) )
    :subtasks
    ( ( !DRIVE ?auto_41479 ?auto_41480 ?auto_41481 )
      ( MAKE-ON ?auto_41462 ?auto_41463 )
      ( MAKE-ON-VERIFY ?auto_41462 ?auto_41463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41483 - SURFACE
      ?auto_41484 - SURFACE
    )
    :vars
    (
      ?auto_41503 - HOIST
      ?auto_41493 - PLACE
      ?auto_41491 - PLACE
      ?auto_41498 - HOIST
      ?auto_41497 - SURFACE
      ?auto_41496 - SURFACE
      ?auto_41494 - PLACE
      ?auto_41500 - HOIST
      ?auto_41502 - SURFACE
      ?auto_41501 - SURFACE
      ?auto_41499 - PLACE
      ?auto_41489 - HOIST
      ?auto_41487 - SURFACE
      ?auto_41492 - SURFACE
      ?auto_41485 - PLACE
      ?auto_41495 - HOIST
      ?auto_41486 - SURFACE
      ?auto_41488 - SURFACE
      ?auto_41490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41503 ?auto_41493 ) ( IS-CRATE ?auto_41483 ) ( not ( = ?auto_41483 ?auto_41484 ) ) ( not ( = ?auto_41491 ?auto_41493 ) ) ( HOIST-AT ?auto_41498 ?auto_41491 ) ( not ( = ?auto_41503 ?auto_41498 ) ) ( SURFACE-AT ?auto_41483 ?auto_41491 ) ( ON ?auto_41483 ?auto_41497 ) ( CLEAR ?auto_41483 ) ( not ( = ?auto_41483 ?auto_41497 ) ) ( not ( = ?auto_41484 ?auto_41497 ) ) ( IS-CRATE ?auto_41484 ) ( not ( = ?auto_41483 ?auto_41496 ) ) ( not ( = ?auto_41484 ?auto_41496 ) ) ( not ( = ?auto_41497 ?auto_41496 ) ) ( not ( = ?auto_41494 ?auto_41493 ) ) ( not ( = ?auto_41491 ?auto_41494 ) ) ( HOIST-AT ?auto_41500 ?auto_41494 ) ( not ( = ?auto_41503 ?auto_41500 ) ) ( not ( = ?auto_41498 ?auto_41500 ) ) ( AVAILABLE ?auto_41500 ) ( SURFACE-AT ?auto_41484 ?auto_41494 ) ( ON ?auto_41484 ?auto_41502 ) ( CLEAR ?auto_41484 ) ( not ( = ?auto_41483 ?auto_41502 ) ) ( not ( = ?auto_41484 ?auto_41502 ) ) ( not ( = ?auto_41497 ?auto_41502 ) ) ( not ( = ?auto_41496 ?auto_41502 ) ) ( IS-CRATE ?auto_41496 ) ( not ( = ?auto_41483 ?auto_41501 ) ) ( not ( = ?auto_41484 ?auto_41501 ) ) ( not ( = ?auto_41497 ?auto_41501 ) ) ( not ( = ?auto_41496 ?auto_41501 ) ) ( not ( = ?auto_41502 ?auto_41501 ) ) ( not ( = ?auto_41499 ?auto_41493 ) ) ( not ( = ?auto_41491 ?auto_41499 ) ) ( not ( = ?auto_41494 ?auto_41499 ) ) ( HOIST-AT ?auto_41489 ?auto_41499 ) ( not ( = ?auto_41503 ?auto_41489 ) ) ( not ( = ?auto_41498 ?auto_41489 ) ) ( not ( = ?auto_41500 ?auto_41489 ) ) ( AVAILABLE ?auto_41489 ) ( SURFACE-AT ?auto_41496 ?auto_41499 ) ( ON ?auto_41496 ?auto_41487 ) ( CLEAR ?auto_41496 ) ( not ( = ?auto_41483 ?auto_41487 ) ) ( not ( = ?auto_41484 ?auto_41487 ) ) ( not ( = ?auto_41497 ?auto_41487 ) ) ( not ( = ?auto_41496 ?auto_41487 ) ) ( not ( = ?auto_41502 ?auto_41487 ) ) ( not ( = ?auto_41501 ?auto_41487 ) ) ( IS-CRATE ?auto_41501 ) ( not ( = ?auto_41483 ?auto_41492 ) ) ( not ( = ?auto_41484 ?auto_41492 ) ) ( not ( = ?auto_41497 ?auto_41492 ) ) ( not ( = ?auto_41496 ?auto_41492 ) ) ( not ( = ?auto_41502 ?auto_41492 ) ) ( not ( = ?auto_41501 ?auto_41492 ) ) ( not ( = ?auto_41487 ?auto_41492 ) ) ( not ( = ?auto_41485 ?auto_41493 ) ) ( not ( = ?auto_41491 ?auto_41485 ) ) ( not ( = ?auto_41494 ?auto_41485 ) ) ( not ( = ?auto_41499 ?auto_41485 ) ) ( HOIST-AT ?auto_41495 ?auto_41485 ) ( not ( = ?auto_41503 ?auto_41495 ) ) ( not ( = ?auto_41498 ?auto_41495 ) ) ( not ( = ?auto_41500 ?auto_41495 ) ) ( not ( = ?auto_41489 ?auto_41495 ) ) ( AVAILABLE ?auto_41495 ) ( SURFACE-AT ?auto_41501 ?auto_41485 ) ( ON ?auto_41501 ?auto_41486 ) ( CLEAR ?auto_41501 ) ( not ( = ?auto_41483 ?auto_41486 ) ) ( not ( = ?auto_41484 ?auto_41486 ) ) ( not ( = ?auto_41497 ?auto_41486 ) ) ( not ( = ?auto_41496 ?auto_41486 ) ) ( not ( = ?auto_41502 ?auto_41486 ) ) ( not ( = ?auto_41501 ?auto_41486 ) ) ( not ( = ?auto_41487 ?auto_41486 ) ) ( not ( = ?auto_41492 ?auto_41486 ) ) ( SURFACE-AT ?auto_41488 ?auto_41493 ) ( CLEAR ?auto_41488 ) ( IS-CRATE ?auto_41492 ) ( not ( = ?auto_41483 ?auto_41488 ) ) ( not ( = ?auto_41484 ?auto_41488 ) ) ( not ( = ?auto_41497 ?auto_41488 ) ) ( not ( = ?auto_41496 ?auto_41488 ) ) ( not ( = ?auto_41502 ?auto_41488 ) ) ( not ( = ?auto_41501 ?auto_41488 ) ) ( not ( = ?auto_41487 ?auto_41488 ) ) ( not ( = ?auto_41492 ?auto_41488 ) ) ( not ( = ?auto_41486 ?auto_41488 ) ) ( AVAILABLE ?auto_41503 ) ( TRUCK-AT ?auto_41490 ?auto_41491 ) ( LIFTING ?auto_41498 ?auto_41492 ) )
    :subtasks
    ( ( !LOAD ?auto_41498 ?auto_41492 ?auto_41490 ?auto_41491 )
      ( MAKE-ON ?auto_41483 ?auto_41484 )
      ( MAKE-ON-VERIFY ?auto_41483 ?auto_41484 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41504 - SURFACE
      ?auto_41505 - SURFACE
    )
    :vars
    (
      ?auto_41508 - HOIST
      ?auto_41506 - PLACE
      ?auto_41513 - PLACE
      ?auto_41517 - HOIST
      ?auto_41520 - SURFACE
      ?auto_41522 - SURFACE
      ?auto_41518 - PLACE
      ?auto_41514 - HOIST
      ?auto_41509 - SURFACE
      ?auto_41510 - SURFACE
      ?auto_41515 - PLACE
      ?auto_41512 - HOIST
      ?auto_41519 - SURFACE
      ?auto_41516 - SURFACE
      ?auto_41511 - PLACE
      ?auto_41507 - HOIST
      ?auto_41523 - SURFACE
      ?auto_41521 - SURFACE
      ?auto_41524 - TRUCK
      ?auto_41525 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41508 ?auto_41506 ) ( IS-CRATE ?auto_41504 ) ( not ( = ?auto_41504 ?auto_41505 ) ) ( not ( = ?auto_41513 ?auto_41506 ) ) ( HOIST-AT ?auto_41517 ?auto_41513 ) ( not ( = ?auto_41508 ?auto_41517 ) ) ( SURFACE-AT ?auto_41504 ?auto_41513 ) ( ON ?auto_41504 ?auto_41520 ) ( CLEAR ?auto_41504 ) ( not ( = ?auto_41504 ?auto_41520 ) ) ( not ( = ?auto_41505 ?auto_41520 ) ) ( IS-CRATE ?auto_41505 ) ( not ( = ?auto_41504 ?auto_41522 ) ) ( not ( = ?auto_41505 ?auto_41522 ) ) ( not ( = ?auto_41520 ?auto_41522 ) ) ( not ( = ?auto_41518 ?auto_41506 ) ) ( not ( = ?auto_41513 ?auto_41518 ) ) ( HOIST-AT ?auto_41514 ?auto_41518 ) ( not ( = ?auto_41508 ?auto_41514 ) ) ( not ( = ?auto_41517 ?auto_41514 ) ) ( AVAILABLE ?auto_41514 ) ( SURFACE-AT ?auto_41505 ?auto_41518 ) ( ON ?auto_41505 ?auto_41509 ) ( CLEAR ?auto_41505 ) ( not ( = ?auto_41504 ?auto_41509 ) ) ( not ( = ?auto_41505 ?auto_41509 ) ) ( not ( = ?auto_41520 ?auto_41509 ) ) ( not ( = ?auto_41522 ?auto_41509 ) ) ( IS-CRATE ?auto_41522 ) ( not ( = ?auto_41504 ?auto_41510 ) ) ( not ( = ?auto_41505 ?auto_41510 ) ) ( not ( = ?auto_41520 ?auto_41510 ) ) ( not ( = ?auto_41522 ?auto_41510 ) ) ( not ( = ?auto_41509 ?auto_41510 ) ) ( not ( = ?auto_41515 ?auto_41506 ) ) ( not ( = ?auto_41513 ?auto_41515 ) ) ( not ( = ?auto_41518 ?auto_41515 ) ) ( HOIST-AT ?auto_41512 ?auto_41515 ) ( not ( = ?auto_41508 ?auto_41512 ) ) ( not ( = ?auto_41517 ?auto_41512 ) ) ( not ( = ?auto_41514 ?auto_41512 ) ) ( AVAILABLE ?auto_41512 ) ( SURFACE-AT ?auto_41522 ?auto_41515 ) ( ON ?auto_41522 ?auto_41519 ) ( CLEAR ?auto_41522 ) ( not ( = ?auto_41504 ?auto_41519 ) ) ( not ( = ?auto_41505 ?auto_41519 ) ) ( not ( = ?auto_41520 ?auto_41519 ) ) ( not ( = ?auto_41522 ?auto_41519 ) ) ( not ( = ?auto_41509 ?auto_41519 ) ) ( not ( = ?auto_41510 ?auto_41519 ) ) ( IS-CRATE ?auto_41510 ) ( not ( = ?auto_41504 ?auto_41516 ) ) ( not ( = ?auto_41505 ?auto_41516 ) ) ( not ( = ?auto_41520 ?auto_41516 ) ) ( not ( = ?auto_41522 ?auto_41516 ) ) ( not ( = ?auto_41509 ?auto_41516 ) ) ( not ( = ?auto_41510 ?auto_41516 ) ) ( not ( = ?auto_41519 ?auto_41516 ) ) ( not ( = ?auto_41511 ?auto_41506 ) ) ( not ( = ?auto_41513 ?auto_41511 ) ) ( not ( = ?auto_41518 ?auto_41511 ) ) ( not ( = ?auto_41515 ?auto_41511 ) ) ( HOIST-AT ?auto_41507 ?auto_41511 ) ( not ( = ?auto_41508 ?auto_41507 ) ) ( not ( = ?auto_41517 ?auto_41507 ) ) ( not ( = ?auto_41514 ?auto_41507 ) ) ( not ( = ?auto_41512 ?auto_41507 ) ) ( AVAILABLE ?auto_41507 ) ( SURFACE-AT ?auto_41510 ?auto_41511 ) ( ON ?auto_41510 ?auto_41523 ) ( CLEAR ?auto_41510 ) ( not ( = ?auto_41504 ?auto_41523 ) ) ( not ( = ?auto_41505 ?auto_41523 ) ) ( not ( = ?auto_41520 ?auto_41523 ) ) ( not ( = ?auto_41522 ?auto_41523 ) ) ( not ( = ?auto_41509 ?auto_41523 ) ) ( not ( = ?auto_41510 ?auto_41523 ) ) ( not ( = ?auto_41519 ?auto_41523 ) ) ( not ( = ?auto_41516 ?auto_41523 ) ) ( SURFACE-AT ?auto_41521 ?auto_41506 ) ( CLEAR ?auto_41521 ) ( IS-CRATE ?auto_41516 ) ( not ( = ?auto_41504 ?auto_41521 ) ) ( not ( = ?auto_41505 ?auto_41521 ) ) ( not ( = ?auto_41520 ?auto_41521 ) ) ( not ( = ?auto_41522 ?auto_41521 ) ) ( not ( = ?auto_41509 ?auto_41521 ) ) ( not ( = ?auto_41510 ?auto_41521 ) ) ( not ( = ?auto_41519 ?auto_41521 ) ) ( not ( = ?auto_41516 ?auto_41521 ) ) ( not ( = ?auto_41523 ?auto_41521 ) ) ( AVAILABLE ?auto_41508 ) ( TRUCK-AT ?auto_41524 ?auto_41513 ) ( AVAILABLE ?auto_41517 ) ( SURFACE-AT ?auto_41516 ?auto_41513 ) ( ON ?auto_41516 ?auto_41525 ) ( CLEAR ?auto_41516 ) ( not ( = ?auto_41504 ?auto_41525 ) ) ( not ( = ?auto_41505 ?auto_41525 ) ) ( not ( = ?auto_41520 ?auto_41525 ) ) ( not ( = ?auto_41522 ?auto_41525 ) ) ( not ( = ?auto_41509 ?auto_41525 ) ) ( not ( = ?auto_41510 ?auto_41525 ) ) ( not ( = ?auto_41519 ?auto_41525 ) ) ( not ( = ?auto_41516 ?auto_41525 ) ) ( not ( = ?auto_41523 ?auto_41525 ) ) ( not ( = ?auto_41521 ?auto_41525 ) ) )
    :subtasks
    ( ( !LIFT ?auto_41517 ?auto_41516 ?auto_41525 ?auto_41513 )
      ( MAKE-ON ?auto_41504 ?auto_41505 )
      ( MAKE-ON-VERIFY ?auto_41504 ?auto_41505 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41526 - SURFACE
      ?auto_41527 - SURFACE
    )
    :vars
    (
      ?auto_41544 - HOIST
      ?auto_41528 - PLACE
      ?auto_41543 - PLACE
      ?auto_41532 - HOIST
      ?auto_41536 - SURFACE
      ?auto_41542 - SURFACE
      ?auto_41530 - PLACE
      ?auto_41547 - HOIST
      ?auto_41529 - SURFACE
      ?auto_41533 - SURFACE
      ?auto_41531 - PLACE
      ?auto_41539 - HOIST
      ?auto_41534 - SURFACE
      ?auto_41545 - SURFACE
      ?auto_41538 - PLACE
      ?auto_41537 - HOIST
      ?auto_41535 - SURFACE
      ?auto_41540 - SURFACE
      ?auto_41546 - SURFACE
      ?auto_41541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41544 ?auto_41528 ) ( IS-CRATE ?auto_41526 ) ( not ( = ?auto_41526 ?auto_41527 ) ) ( not ( = ?auto_41543 ?auto_41528 ) ) ( HOIST-AT ?auto_41532 ?auto_41543 ) ( not ( = ?auto_41544 ?auto_41532 ) ) ( SURFACE-AT ?auto_41526 ?auto_41543 ) ( ON ?auto_41526 ?auto_41536 ) ( CLEAR ?auto_41526 ) ( not ( = ?auto_41526 ?auto_41536 ) ) ( not ( = ?auto_41527 ?auto_41536 ) ) ( IS-CRATE ?auto_41527 ) ( not ( = ?auto_41526 ?auto_41542 ) ) ( not ( = ?auto_41527 ?auto_41542 ) ) ( not ( = ?auto_41536 ?auto_41542 ) ) ( not ( = ?auto_41530 ?auto_41528 ) ) ( not ( = ?auto_41543 ?auto_41530 ) ) ( HOIST-AT ?auto_41547 ?auto_41530 ) ( not ( = ?auto_41544 ?auto_41547 ) ) ( not ( = ?auto_41532 ?auto_41547 ) ) ( AVAILABLE ?auto_41547 ) ( SURFACE-AT ?auto_41527 ?auto_41530 ) ( ON ?auto_41527 ?auto_41529 ) ( CLEAR ?auto_41527 ) ( not ( = ?auto_41526 ?auto_41529 ) ) ( not ( = ?auto_41527 ?auto_41529 ) ) ( not ( = ?auto_41536 ?auto_41529 ) ) ( not ( = ?auto_41542 ?auto_41529 ) ) ( IS-CRATE ?auto_41542 ) ( not ( = ?auto_41526 ?auto_41533 ) ) ( not ( = ?auto_41527 ?auto_41533 ) ) ( not ( = ?auto_41536 ?auto_41533 ) ) ( not ( = ?auto_41542 ?auto_41533 ) ) ( not ( = ?auto_41529 ?auto_41533 ) ) ( not ( = ?auto_41531 ?auto_41528 ) ) ( not ( = ?auto_41543 ?auto_41531 ) ) ( not ( = ?auto_41530 ?auto_41531 ) ) ( HOIST-AT ?auto_41539 ?auto_41531 ) ( not ( = ?auto_41544 ?auto_41539 ) ) ( not ( = ?auto_41532 ?auto_41539 ) ) ( not ( = ?auto_41547 ?auto_41539 ) ) ( AVAILABLE ?auto_41539 ) ( SURFACE-AT ?auto_41542 ?auto_41531 ) ( ON ?auto_41542 ?auto_41534 ) ( CLEAR ?auto_41542 ) ( not ( = ?auto_41526 ?auto_41534 ) ) ( not ( = ?auto_41527 ?auto_41534 ) ) ( not ( = ?auto_41536 ?auto_41534 ) ) ( not ( = ?auto_41542 ?auto_41534 ) ) ( not ( = ?auto_41529 ?auto_41534 ) ) ( not ( = ?auto_41533 ?auto_41534 ) ) ( IS-CRATE ?auto_41533 ) ( not ( = ?auto_41526 ?auto_41545 ) ) ( not ( = ?auto_41527 ?auto_41545 ) ) ( not ( = ?auto_41536 ?auto_41545 ) ) ( not ( = ?auto_41542 ?auto_41545 ) ) ( not ( = ?auto_41529 ?auto_41545 ) ) ( not ( = ?auto_41533 ?auto_41545 ) ) ( not ( = ?auto_41534 ?auto_41545 ) ) ( not ( = ?auto_41538 ?auto_41528 ) ) ( not ( = ?auto_41543 ?auto_41538 ) ) ( not ( = ?auto_41530 ?auto_41538 ) ) ( not ( = ?auto_41531 ?auto_41538 ) ) ( HOIST-AT ?auto_41537 ?auto_41538 ) ( not ( = ?auto_41544 ?auto_41537 ) ) ( not ( = ?auto_41532 ?auto_41537 ) ) ( not ( = ?auto_41547 ?auto_41537 ) ) ( not ( = ?auto_41539 ?auto_41537 ) ) ( AVAILABLE ?auto_41537 ) ( SURFACE-AT ?auto_41533 ?auto_41538 ) ( ON ?auto_41533 ?auto_41535 ) ( CLEAR ?auto_41533 ) ( not ( = ?auto_41526 ?auto_41535 ) ) ( not ( = ?auto_41527 ?auto_41535 ) ) ( not ( = ?auto_41536 ?auto_41535 ) ) ( not ( = ?auto_41542 ?auto_41535 ) ) ( not ( = ?auto_41529 ?auto_41535 ) ) ( not ( = ?auto_41533 ?auto_41535 ) ) ( not ( = ?auto_41534 ?auto_41535 ) ) ( not ( = ?auto_41545 ?auto_41535 ) ) ( SURFACE-AT ?auto_41540 ?auto_41528 ) ( CLEAR ?auto_41540 ) ( IS-CRATE ?auto_41545 ) ( not ( = ?auto_41526 ?auto_41540 ) ) ( not ( = ?auto_41527 ?auto_41540 ) ) ( not ( = ?auto_41536 ?auto_41540 ) ) ( not ( = ?auto_41542 ?auto_41540 ) ) ( not ( = ?auto_41529 ?auto_41540 ) ) ( not ( = ?auto_41533 ?auto_41540 ) ) ( not ( = ?auto_41534 ?auto_41540 ) ) ( not ( = ?auto_41545 ?auto_41540 ) ) ( not ( = ?auto_41535 ?auto_41540 ) ) ( AVAILABLE ?auto_41544 ) ( AVAILABLE ?auto_41532 ) ( SURFACE-AT ?auto_41545 ?auto_41543 ) ( ON ?auto_41545 ?auto_41546 ) ( CLEAR ?auto_41545 ) ( not ( = ?auto_41526 ?auto_41546 ) ) ( not ( = ?auto_41527 ?auto_41546 ) ) ( not ( = ?auto_41536 ?auto_41546 ) ) ( not ( = ?auto_41542 ?auto_41546 ) ) ( not ( = ?auto_41529 ?auto_41546 ) ) ( not ( = ?auto_41533 ?auto_41546 ) ) ( not ( = ?auto_41534 ?auto_41546 ) ) ( not ( = ?auto_41545 ?auto_41546 ) ) ( not ( = ?auto_41535 ?auto_41546 ) ) ( not ( = ?auto_41540 ?auto_41546 ) ) ( TRUCK-AT ?auto_41541 ?auto_41528 ) )
    :subtasks
    ( ( !DRIVE ?auto_41541 ?auto_41528 ?auto_41543 )
      ( MAKE-ON ?auto_41526 ?auto_41527 )
      ( MAKE-ON-VERIFY ?auto_41526 ?auto_41527 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41548 - SURFACE
      ?auto_41549 - SURFACE
    )
    :vars
    (
      ?auto_41553 - HOIST
      ?auto_41552 - PLACE
      ?auto_41555 - PLACE
      ?auto_41567 - HOIST
      ?auto_41565 - SURFACE
      ?auto_41551 - SURFACE
      ?auto_41554 - PLACE
      ?auto_41557 - HOIST
      ?auto_41568 - SURFACE
      ?auto_41559 - SURFACE
      ?auto_41560 - PLACE
      ?auto_41564 - HOIST
      ?auto_41563 - SURFACE
      ?auto_41556 - SURFACE
      ?auto_41562 - PLACE
      ?auto_41566 - HOIST
      ?auto_41569 - SURFACE
      ?auto_41558 - SURFACE
      ?auto_41550 - SURFACE
      ?auto_41561 - TRUCK
      ?auto_41570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41553 ?auto_41552 ) ( IS-CRATE ?auto_41548 ) ( not ( = ?auto_41548 ?auto_41549 ) ) ( not ( = ?auto_41555 ?auto_41552 ) ) ( HOIST-AT ?auto_41567 ?auto_41555 ) ( not ( = ?auto_41553 ?auto_41567 ) ) ( SURFACE-AT ?auto_41548 ?auto_41555 ) ( ON ?auto_41548 ?auto_41565 ) ( CLEAR ?auto_41548 ) ( not ( = ?auto_41548 ?auto_41565 ) ) ( not ( = ?auto_41549 ?auto_41565 ) ) ( IS-CRATE ?auto_41549 ) ( not ( = ?auto_41548 ?auto_41551 ) ) ( not ( = ?auto_41549 ?auto_41551 ) ) ( not ( = ?auto_41565 ?auto_41551 ) ) ( not ( = ?auto_41554 ?auto_41552 ) ) ( not ( = ?auto_41555 ?auto_41554 ) ) ( HOIST-AT ?auto_41557 ?auto_41554 ) ( not ( = ?auto_41553 ?auto_41557 ) ) ( not ( = ?auto_41567 ?auto_41557 ) ) ( AVAILABLE ?auto_41557 ) ( SURFACE-AT ?auto_41549 ?auto_41554 ) ( ON ?auto_41549 ?auto_41568 ) ( CLEAR ?auto_41549 ) ( not ( = ?auto_41548 ?auto_41568 ) ) ( not ( = ?auto_41549 ?auto_41568 ) ) ( not ( = ?auto_41565 ?auto_41568 ) ) ( not ( = ?auto_41551 ?auto_41568 ) ) ( IS-CRATE ?auto_41551 ) ( not ( = ?auto_41548 ?auto_41559 ) ) ( not ( = ?auto_41549 ?auto_41559 ) ) ( not ( = ?auto_41565 ?auto_41559 ) ) ( not ( = ?auto_41551 ?auto_41559 ) ) ( not ( = ?auto_41568 ?auto_41559 ) ) ( not ( = ?auto_41560 ?auto_41552 ) ) ( not ( = ?auto_41555 ?auto_41560 ) ) ( not ( = ?auto_41554 ?auto_41560 ) ) ( HOIST-AT ?auto_41564 ?auto_41560 ) ( not ( = ?auto_41553 ?auto_41564 ) ) ( not ( = ?auto_41567 ?auto_41564 ) ) ( not ( = ?auto_41557 ?auto_41564 ) ) ( AVAILABLE ?auto_41564 ) ( SURFACE-AT ?auto_41551 ?auto_41560 ) ( ON ?auto_41551 ?auto_41563 ) ( CLEAR ?auto_41551 ) ( not ( = ?auto_41548 ?auto_41563 ) ) ( not ( = ?auto_41549 ?auto_41563 ) ) ( not ( = ?auto_41565 ?auto_41563 ) ) ( not ( = ?auto_41551 ?auto_41563 ) ) ( not ( = ?auto_41568 ?auto_41563 ) ) ( not ( = ?auto_41559 ?auto_41563 ) ) ( IS-CRATE ?auto_41559 ) ( not ( = ?auto_41548 ?auto_41556 ) ) ( not ( = ?auto_41549 ?auto_41556 ) ) ( not ( = ?auto_41565 ?auto_41556 ) ) ( not ( = ?auto_41551 ?auto_41556 ) ) ( not ( = ?auto_41568 ?auto_41556 ) ) ( not ( = ?auto_41559 ?auto_41556 ) ) ( not ( = ?auto_41563 ?auto_41556 ) ) ( not ( = ?auto_41562 ?auto_41552 ) ) ( not ( = ?auto_41555 ?auto_41562 ) ) ( not ( = ?auto_41554 ?auto_41562 ) ) ( not ( = ?auto_41560 ?auto_41562 ) ) ( HOIST-AT ?auto_41566 ?auto_41562 ) ( not ( = ?auto_41553 ?auto_41566 ) ) ( not ( = ?auto_41567 ?auto_41566 ) ) ( not ( = ?auto_41557 ?auto_41566 ) ) ( not ( = ?auto_41564 ?auto_41566 ) ) ( AVAILABLE ?auto_41566 ) ( SURFACE-AT ?auto_41559 ?auto_41562 ) ( ON ?auto_41559 ?auto_41569 ) ( CLEAR ?auto_41559 ) ( not ( = ?auto_41548 ?auto_41569 ) ) ( not ( = ?auto_41549 ?auto_41569 ) ) ( not ( = ?auto_41565 ?auto_41569 ) ) ( not ( = ?auto_41551 ?auto_41569 ) ) ( not ( = ?auto_41568 ?auto_41569 ) ) ( not ( = ?auto_41559 ?auto_41569 ) ) ( not ( = ?auto_41563 ?auto_41569 ) ) ( not ( = ?auto_41556 ?auto_41569 ) ) ( IS-CRATE ?auto_41556 ) ( not ( = ?auto_41548 ?auto_41558 ) ) ( not ( = ?auto_41549 ?auto_41558 ) ) ( not ( = ?auto_41565 ?auto_41558 ) ) ( not ( = ?auto_41551 ?auto_41558 ) ) ( not ( = ?auto_41568 ?auto_41558 ) ) ( not ( = ?auto_41559 ?auto_41558 ) ) ( not ( = ?auto_41563 ?auto_41558 ) ) ( not ( = ?auto_41556 ?auto_41558 ) ) ( not ( = ?auto_41569 ?auto_41558 ) ) ( AVAILABLE ?auto_41567 ) ( SURFACE-AT ?auto_41556 ?auto_41555 ) ( ON ?auto_41556 ?auto_41550 ) ( CLEAR ?auto_41556 ) ( not ( = ?auto_41548 ?auto_41550 ) ) ( not ( = ?auto_41549 ?auto_41550 ) ) ( not ( = ?auto_41565 ?auto_41550 ) ) ( not ( = ?auto_41551 ?auto_41550 ) ) ( not ( = ?auto_41568 ?auto_41550 ) ) ( not ( = ?auto_41559 ?auto_41550 ) ) ( not ( = ?auto_41563 ?auto_41550 ) ) ( not ( = ?auto_41556 ?auto_41550 ) ) ( not ( = ?auto_41569 ?auto_41550 ) ) ( not ( = ?auto_41558 ?auto_41550 ) ) ( TRUCK-AT ?auto_41561 ?auto_41552 ) ( SURFACE-AT ?auto_41570 ?auto_41552 ) ( CLEAR ?auto_41570 ) ( LIFTING ?auto_41553 ?auto_41558 ) ( IS-CRATE ?auto_41558 ) ( not ( = ?auto_41548 ?auto_41570 ) ) ( not ( = ?auto_41549 ?auto_41570 ) ) ( not ( = ?auto_41565 ?auto_41570 ) ) ( not ( = ?auto_41551 ?auto_41570 ) ) ( not ( = ?auto_41568 ?auto_41570 ) ) ( not ( = ?auto_41559 ?auto_41570 ) ) ( not ( = ?auto_41563 ?auto_41570 ) ) ( not ( = ?auto_41556 ?auto_41570 ) ) ( not ( = ?auto_41569 ?auto_41570 ) ) ( not ( = ?auto_41558 ?auto_41570 ) ) ( not ( = ?auto_41550 ?auto_41570 ) ) )
    :subtasks
    ( ( !DROP ?auto_41553 ?auto_41558 ?auto_41570 ?auto_41552 )
      ( MAKE-ON ?auto_41548 ?auto_41549 )
      ( MAKE-ON-VERIFY ?auto_41548 ?auto_41549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41571 - SURFACE
      ?auto_41572 - SURFACE
    )
    :vars
    (
      ?auto_41577 - HOIST
      ?auto_41574 - PLACE
      ?auto_41589 - PLACE
      ?auto_41579 - HOIST
      ?auto_41584 - SURFACE
      ?auto_41586 - SURFACE
      ?auto_41587 - PLACE
      ?auto_41588 - HOIST
      ?auto_41576 - SURFACE
      ?auto_41593 - SURFACE
      ?auto_41592 - PLACE
      ?auto_41581 - HOIST
      ?auto_41591 - SURFACE
      ?auto_41582 - SURFACE
      ?auto_41590 - PLACE
      ?auto_41578 - HOIST
      ?auto_41575 - SURFACE
      ?auto_41573 - SURFACE
      ?auto_41583 - SURFACE
      ?auto_41585 - TRUCK
      ?auto_41580 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41577 ?auto_41574 ) ( IS-CRATE ?auto_41571 ) ( not ( = ?auto_41571 ?auto_41572 ) ) ( not ( = ?auto_41589 ?auto_41574 ) ) ( HOIST-AT ?auto_41579 ?auto_41589 ) ( not ( = ?auto_41577 ?auto_41579 ) ) ( SURFACE-AT ?auto_41571 ?auto_41589 ) ( ON ?auto_41571 ?auto_41584 ) ( CLEAR ?auto_41571 ) ( not ( = ?auto_41571 ?auto_41584 ) ) ( not ( = ?auto_41572 ?auto_41584 ) ) ( IS-CRATE ?auto_41572 ) ( not ( = ?auto_41571 ?auto_41586 ) ) ( not ( = ?auto_41572 ?auto_41586 ) ) ( not ( = ?auto_41584 ?auto_41586 ) ) ( not ( = ?auto_41587 ?auto_41574 ) ) ( not ( = ?auto_41589 ?auto_41587 ) ) ( HOIST-AT ?auto_41588 ?auto_41587 ) ( not ( = ?auto_41577 ?auto_41588 ) ) ( not ( = ?auto_41579 ?auto_41588 ) ) ( AVAILABLE ?auto_41588 ) ( SURFACE-AT ?auto_41572 ?auto_41587 ) ( ON ?auto_41572 ?auto_41576 ) ( CLEAR ?auto_41572 ) ( not ( = ?auto_41571 ?auto_41576 ) ) ( not ( = ?auto_41572 ?auto_41576 ) ) ( not ( = ?auto_41584 ?auto_41576 ) ) ( not ( = ?auto_41586 ?auto_41576 ) ) ( IS-CRATE ?auto_41586 ) ( not ( = ?auto_41571 ?auto_41593 ) ) ( not ( = ?auto_41572 ?auto_41593 ) ) ( not ( = ?auto_41584 ?auto_41593 ) ) ( not ( = ?auto_41586 ?auto_41593 ) ) ( not ( = ?auto_41576 ?auto_41593 ) ) ( not ( = ?auto_41592 ?auto_41574 ) ) ( not ( = ?auto_41589 ?auto_41592 ) ) ( not ( = ?auto_41587 ?auto_41592 ) ) ( HOIST-AT ?auto_41581 ?auto_41592 ) ( not ( = ?auto_41577 ?auto_41581 ) ) ( not ( = ?auto_41579 ?auto_41581 ) ) ( not ( = ?auto_41588 ?auto_41581 ) ) ( AVAILABLE ?auto_41581 ) ( SURFACE-AT ?auto_41586 ?auto_41592 ) ( ON ?auto_41586 ?auto_41591 ) ( CLEAR ?auto_41586 ) ( not ( = ?auto_41571 ?auto_41591 ) ) ( not ( = ?auto_41572 ?auto_41591 ) ) ( not ( = ?auto_41584 ?auto_41591 ) ) ( not ( = ?auto_41586 ?auto_41591 ) ) ( not ( = ?auto_41576 ?auto_41591 ) ) ( not ( = ?auto_41593 ?auto_41591 ) ) ( IS-CRATE ?auto_41593 ) ( not ( = ?auto_41571 ?auto_41582 ) ) ( not ( = ?auto_41572 ?auto_41582 ) ) ( not ( = ?auto_41584 ?auto_41582 ) ) ( not ( = ?auto_41586 ?auto_41582 ) ) ( not ( = ?auto_41576 ?auto_41582 ) ) ( not ( = ?auto_41593 ?auto_41582 ) ) ( not ( = ?auto_41591 ?auto_41582 ) ) ( not ( = ?auto_41590 ?auto_41574 ) ) ( not ( = ?auto_41589 ?auto_41590 ) ) ( not ( = ?auto_41587 ?auto_41590 ) ) ( not ( = ?auto_41592 ?auto_41590 ) ) ( HOIST-AT ?auto_41578 ?auto_41590 ) ( not ( = ?auto_41577 ?auto_41578 ) ) ( not ( = ?auto_41579 ?auto_41578 ) ) ( not ( = ?auto_41588 ?auto_41578 ) ) ( not ( = ?auto_41581 ?auto_41578 ) ) ( AVAILABLE ?auto_41578 ) ( SURFACE-AT ?auto_41593 ?auto_41590 ) ( ON ?auto_41593 ?auto_41575 ) ( CLEAR ?auto_41593 ) ( not ( = ?auto_41571 ?auto_41575 ) ) ( not ( = ?auto_41572 ?auto_41575 ) ) ( not ( = ?auto_41584 ?auto_41575 ) ) ( not ( = ?auto_41586 ?auto_41575 ) ) ( not ( = ?auto_41576 ?auto_41575 ) ) ( not ( = ?auto_41593 ?auto_41575 ) ) ( not ( = ?auto_41591 ?auto_41575 ) ) ( not ( = ?auto_41582 ?auto_41575 ) ) ( IS-CRATE ?auto_41582 ) ( not ( = ?auto_41571 ?auto_41573 ) ) ( not ( = ?auto_41572 ?auto_41573 ) ) ( not ( = ?auto_41584 ?auto_41573 ) ) ( not ( = ?auto_41586 ?auto_41573 ) ) ( not ( = ?auto_41576 ?auto_41573 ) ) ( not ( = ?auto_41593 ?auto_41573 ) ) ( not ( = ?auto_41591 ?auto_41573 ) ) ( not ( = ?auto_41582 ?auto_41573 ) ) ( not ( = ?auto_41575 ?auto_41573 ) ) ( AVAILABLE ?auto_41579 ) ( SURFACE-AT ?auto_41582 ?auto_41589 ) ( ON ?auto_41582 ?auto_41583 ) ( CLEAR ?auto_41582 ) ( not ( = ?auto_41571 ?auto_41583 ) ) ( not ( = ?auto_41572 ?auto_41583 ) ) ( not ( = ?auto_41584 ?auto_41583 ) ) ( not ( = ?auto_41586 ?auto_41583 ) ) ( not ( = ?auto_41576 ?auto_41583 ) ) ( not ( = ?auto_41593 ?auto_41583 ) ) ( not ( = ?auto_41591 ?auto_41583 ) ) ( not ( = ?auto_41582 ?auto_41583 ) ) ( not ( = ?auto_41575 ?auto_41583 ) ) ( not ( = ?auto_41573 ?auto_41583 ) ) ( TRUCK-AT ?auto_41585 ?auto_41574 ) ( SURFACE-AT ?auto_41580 ?auto_41574 ) ( CLEAR ?auto_41580 ) ( IS-CRATE ?auto_41573 ) ( not ( = ?auto_41571 ?auto_41580 ) ) ( not ( = ?auto_41572 ?auto_41580 ) ) ( not ( = ?auto_41584 ?auto_41580 ) ) ( not ( = ?auto_41586 ?auto_41580 ) ) ( not ( = ?auto_41576 ?auto_41580 ) ) ( not ( = ?auto_41593 ?auto_41580 ) ) ( not ( = ?auto_41591 ?auto_41580 ) ) ( not ( = ?auto_41582 ?auto_41580 ) ) ( not ( = ?auto_41575 ?auto_41580 ) ) ( not ( = ?auto_41573 ?auto_41580 ) ) ( not ( = ?auto_41583 ?auto_41580 ) ) ( AVAILABLE ?auto_41577 ) ( IN ?auto_41573 ?auto_41585 ) )
    :subtasks
    ( ( !UNLOAD ?auto_41577 ?auto_41573 ?auto_41585 ?auto_41574 )
      ( MAKE-ON ?auto_41571 ?auto_41572 )
      ( MAKE-ON-VERIFY ?auto_41571 ?auto_41572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41594 - SURFACE
      ?auto_41595 - SURFACE
    )
    :vars
    (
      ?auto_41601 - HOIST
      ?auto_41609 - PLACE
      ?auto_41605 - PLACE
      ?auto_41597 - HOIST
      ?auto_41610 - SURFACE
      ?auto_41612 - SURFACE
      ?auto_41616 - PLACE
      ?auto_41614 - HOIST
      ?auto_41615 - SURFACE
      ?auto_41613 - SURFACE
      ?auto_41600 - PLACE
      ?auto_41598 - HOIST
      ?auto_41608 - SURFACE
      ?auto_41606 - SURFACE
      ?auto_41607 - PLACE
      ?auto_41602 - HOIST
      ?auto_41604 - SURFACE
      ?auto_41599 - SURFACE
      ?auto_41603 - SURFACE
      ?auto_41611 - SURFACE
      ?auto_41596 - TRUCK
      ?auto_41617 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41601 ?auto_41609 ) ( IS-CRATE ?auto_41594 ) ( not ( = ?auto_41594 ?auto_41595 ) ) ( not ( = ?auto_41605 ?auto_41609 ) ) ( HOIST-AT ?auto_41597 ?auto_41605 ) ( not ( = ?auto_41601 ?auto_41597 ) ) ( SURFACE-AT ?auto_41594 ?auto_41605 ) ( ON ?auto_41594 ?auto_41610 ) ( CLEAR ?auto_41594 ) ( not ( = ?auto_41594 ?auto_41610 ) ) ( not ( = ?auto_41595 ?auto_41610 ) ) ( IS-CRATE ?auto_41595 ) ( not ( = ?auto_41594 ?auto_41612 ) ) ( not ( = ?auto_41595 ?auto_41612 ) ) ( not ( = ?auto_41610 ?auto_41612 ) ) ( not ( = ?auto_41616 ?auto_41609 ) ) ( not ( = ?auto_41605 ?auto_41616 ) ) ( HOIST-AT ?auto_41614 ?auto_41616 ) ( not ( = ?auto_41601 ?auto_41614 ) ) ( not ( = ?auto_41597 ?auto_41614 ) ) ( AVAILABLE ?auto_41614 ) ( SURFACE-AT ?auto_41595 ?auto_41616 ) ( ON ?auto_41595 ?auto_41615 ) ( CLEAR ?auto_41595 ) ( not ( = ?auto_41594 ?auto_41615 ) ) ( not ( = ?auto_41595 ?auto_41615 ) ) ( not ( = ?auto_41610 ?auto_41615 ) ) ( not ( = ?auto_41612 ?auto_41615 ) ) ( IS-CRATE ?auto_41612 ) ( not ( = ?auto_41594 ?auto_41613 ) ) ( not ( = ?auto_41595 ?auto_41613 ) ) ( not ( = ?auto_41610 ?auto_41613 ) ) ( not ( = ?auto_41612 ?auto_41613 ) ) ( not ( = ?auto_41615 ?auto_41613 ) ) ( not ( = ?auto_41600 ?auto_41609 ) ) ( not ( = ?auto_41605 ?auto_41600 ) ) ( not ( = ?auto_41616 ?auto_41600 ) ) ( HOIST-AT ?auto_41598 ?auto_41600 ) ( not ( = ?auto_41601 ?auto_41598 ) ) ( not ( = ?auto_41597 ?auto_41598 ) ) ( not ( = ?auto_41614 ?auto_41598 ) ) ( AVAILABLE ?auto_41598 ) ( SURFACE-AT ?auto_41612 ?auto_41600 ) ( ON ?auto_41612 ?auto_41608 ) ( CLEAR ?auto_41612 ) ( not ( = ?auto_41594 ?auto_41608 ) ) ( not ( = ?auto_41595 ?auto_41608 ) ) ( not ( = ?auto_41610 ?auto_41608 ) ) ( not ( = ?auto_41612 ?auto_41608 ) ) ( not ( = ?auto_41615 ?auto_41608 ) ) ( not ( = ?auto_41613 ?auto_41608 ) ) ( IS-CRATE ?auto_41613 ) ( not ( = ?auto_41594 ?auto_41606 ) ) ( not ( = ?auto_41595 ?auto_41606 ) ) ( not ( = ?auto_41610 ?auto_41606 ) ) ( not ( = ?auto_41612 ?auto_41606 ) ) ( not ( = ?auto_41615 ?auto_41606 ) ) ( not ( = ?auto_41613 ?auto_41606 ) ) ( not ( = ?auto_41608 ?auto_41606 ) ) ( not ( = ?auto_41607 ?auto_41609 ) ) ( not ( = ?auto_41605 ?auto_41607 ) ) ( not ( = ?auto_41616 ?auto_41607 ) ) ( not ( = ?auto_41600 ?auto_41607 ) ) ( HOIST-AT ?auto_41602 ?auto_41607 ) ( not ( = ?auto_41601 ?auto_41602 ) ) ( not ( = ?auto_41597 ?auto_41602 ) ) ( not ( = ?auto_41614 ?auto_41602 ) ) ( not ( = ?auto_41598 ?auto_41602 ) ) ( AVAILABLE ?auto_41602 ) ( SURFACE-AT ?auto_41613 ?auto_41607 ) ( ON ?auto_41613 ?auto_41604 ) ( CLEAR ?auto_41613 ) ( not ( = ?auto_41594 ?auto_41604 ) ) ( not ( = ?auto_41595 ?auto_41604 ) ) ( not ( = ?auto_41610 ?auto_41604 ) ) ( not ( = ?auto_41612 ?auto_41604 ) ) ( not ( = ?auto_41615 ?auto_41604 ) ) ( not ( = ?auto_41613 ?auto_41604 ) ) ( not ( = ?auto_41608 ?auto_41604 ) ) ( not ( = ?auto_41606 ?auto_41604 ) ) ( IS-CRATE ?auto_41606 ) ( not ( = ?auto_41594 ?auto_41599 ) ) ( not ( = ?auto_41595 ?auto_41599 ) ) ( not ( = ?auto_41610 ?auto_41599 ) ) ( not ( = ?auto_41612 ?auto_41599 ) ) ( not ( = ?auto_41615 ?auto_41599 ) ) ( not ( = ?auto_41613 ?auto_41599 ) ) ( not ( = ?auto_41608 ?auto_41599 ) ) ( not ( = ?auto_41606 ?auto_41599 ) ) ( not ( = ?auto_41604 ?auto_41599 ) ) ( AVAILABLE ?auto_41597 ) ( SURFACE-AT ?auto_41606 ?auto_41605 ) ( ON ?auto_41606 ?auto_41603 ) ( CLEAR ?auto_41606 ) ( not ( = ?auto_41594 ?auto_41603 ) ) ( not ( = ?auto_41595 ?auto_41603 ) ) ( not ( = ?auto_41610 ?auto_41603 ) ) ( not ( = ?auto_41612 ?auto_41603 ) ) ( not ( = ?auto_41615 ?auto_41603 ) ) ( not ( = ?auto_41613 ?auto_41603 ) ) ( not ( = ?auto_41608 ?auto_41603 ) ) ( not ( = ?auto_41606 ?auto_41603 ) ) ( not ( = ?auto_41604 ?auto_41603 ) ) ( not ( = ?auto_41599 ?auto_41603 ) ) ( SURFACE-AT ?auto_41611 ?auto_41609 ) ( CLEAR ?auto_41611 ) ( IS-CRATE ?auto_41599 ) ( not ( = ?auto_41594 ?auto_41611 ) ) ( not ( = ?auto_41595 ?auto_41611 ) ) ( not ( = ?auto_41610 ?auto_41611 ) ) ( not ( = ?auto_41612 ?auto_41611 ) ) ( not ( = ?auto_41615 ?auto_41611 ) ) ( not ( = ?auto_41613 ?auto_41611 ) ) ( not ( = ?auto_41608 ?auto_41611 ) ) ( not ( = ?auto_41606 ?auto_41611 ) ) ( not ( = ?auto_41604 ?auto_41611 ) ) ( not ( = ?auto_41599 ?auto_41611 ) ) ( not ( = ?auto_41603 ?auto_41611 ) ) ( AVAILABLE ?auto_41601 ) ( IN ?auto_41599 ?auto_41596 ) ( TRUCK-AT ?auto_41596 ?auto_41617 ) ( not ( = ?auto_41617 ?auto_41609 ) ) ( not ( = ?auto_41605 ?auto_41617 ) ) ( not ( = ?auto_41616 ?auto_41617 ) ) ( not ( = ?auto_41600 ?auto_41617 ) ) ( not ( = ?auto_41607 ?auto_41617 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_41596 ?auto_41617 ?auto_41609 )
      ( MAKE-ON ?auto_41594 ?auto_41595 )
      ( MAKE-ON-VERIFY ?auto_41594 ?auto_41595 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41618 - SURFACE
      ?auto_41619 - SURFACE
    )
    :vars
    (
      ?auto_41620 - HOIST
      ?auto_41634 - PLACE
      ?auto_41628 - PLACE
      ?auto_41621 - HOIST
      ?auto_41633 - SURFACE
      ?auto_41626 - SURFACE
      ?auto_41641 - PLACE
      ?auto_41639 - HOIST
      ?auto_41640 - SURFACE
      ?auto_41627 - SURFACE
      ?auto_41635 - PLACE
      ?auto_41631 - HOIST
      ?auto_41630 - SURFACE
      ?auto_41638 - SURFACE
      ?auto_41629 - PLACE
      ?auto_41636 - HOIST
      ?auto_41623 - SURFACE
      ?auto_41625 - SURFACE
      ?auto_41632 - SURFACE
      ?auto_41637 - SURFACE
      ?auto_41624 - TRUCK
      ?auto_41622 - PLACE
      ?auto_41642 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_41620 ?auto_41634 ) ( IS-CRATE ?auto_41618 ) ( not ( = ?auto_41618 ?auto_41619 ) ) ( not ( = ?auto_41628 ?auto_41634 ) ) ( HOIST-AT ?auto_41621 ?auto_41628 ) ( not ( = ?auto_41620 ?auto_41621 ) ) ( SURFACE-AT ?auto_41618 ?auto_41628 ) ( ON ?auto_41618 ?auto_41633 ) ( CLEAR ?auto_41618 ) ( not ( = ?auto_41618 ?auto_41633 ) ) ( not ( = ?auto_41619 ?auto_41633 ) ) ( IS-CRATE ?auto_41619 ) ( not ( = ?auto_41618 ?auto_41626 ) ) ( not ( = ?auto_41619 ?auto_41626 ) ) ( not ( = ?auto_41633 ?auto_41626 ) ) ( not ( = ?auto_41641 ?auto_41634 ) ) ( not ( = ?auto_41628 ?auto_41641 ) ) ( HOIST-AT ?auto_41639 ?auto_41641 ) ( not ( = ?auto_41620 ?auto_41639 ) ) ( not ( = ?auto_41621 ?auto_41639 ) ) ( AVAILABLE ?auto_41639 ) ( SURFACE-AT ?auto_41619 ?auto_41641 ) ( ON ?auto_41619 ?auto_41640 ) ( CLEAR ?auto_41619 ) ( not ( = ?auto_41618 ?auto_41640 ) ) ( not ( = ?auto_41619 ?auto_41640 ) ) ( not ( = ?auto_41633 ?auto_41640 ) ) ( not ( = ?auto_41626 ?auto_41640 ) ) ( IS-CRATE ?auto_41626 ) ( not ( = ?auto_41618 ?auto_41627 ) ) ( not ( = ?auto_41619 ?auto_41627 ) ) ( not ( = ?auto_41633 ?auto_41627 ) ) ( not ( = ?auto_41626 ?auto_41627 ) ) ( not ( = ?auto_41640 ?auto_41627 ) ) ( not ( = ?auto_41635 ?auto_41634 ) ) ( not ( = ?auto_41628 ?auto_41635 ) ) ( not ( = ?auto_41641 ?auto_41635 ) ) ( HOIST-AT ?auto_41631 ?auto_41635 ) ( not ( = ?auto_41620 ?auto_41631 ) ) ( not ( = ?auto_41621 ?auto_41631 ) ) ( not ( = ?auto_41639 ?auto_41631 ) ) ( AVAILABLE ?auto_41631 ) ( SURFACE-AT ?auto_41626 ?auto_41635 ) ( ON ?auto_41626 ?auto_41630 ) ( CLEAR ?auto_41626 ) ( not ( = ?auto_41618 ?auto_41630 ) ) ( not ( = ?auto_41619 ?auto_41630 ) ) ( not ( = ?auto_41633 ?auto_41630 ) ) ( not ( = ?auto_41626 ?auto_41630 ) ) ( not ( = ?auto_41640 ?auto_41630 ) ) ( not ( = ?auto_41627 ?auto_41630 ) ) ( IS-CRATE ?auto_41627 ) ( not ( = ?auto_41618 ?auto_41638 ) ) ( not ( = ?auto_41619 ?auto_41638 ) ) ( not ( = ?auto_41633 ?auto_41638 ) ) ( not ( = ?auto_41626 ?auto_41638 ) ) ( not ( = ?auto_41640 ?auto_41638 ) ) ( not ( = ?auto_41627 ?auto_41638 ) ) ( not ( = ?auto_41630 ?auto_41638 ) ) ( not ( = ?auto_41629 ?auto_41634 ) ) ( not ( = ?auto_41628 ?auto_41629 ) ) ( not ( = ?auto_41641 ?auto_41629 ) ) ( not ( = ?auto_41635 ?auto_41629 ) ) ( HOIST-AT ?auto_41636 ?auto_41629 ) ( not ( = ?auto_41620 ?auto_41636 ) ) ( not ( = ?auto_41621 ?auto_41636 ) ) ( not ( = ?auto_41639 ?auto_41636 ) ) ( not ( = ?auto_41631 ?auto_41636 ) ) ( AVAILABLE ?auto_41636 ) ( SURFACE-AT ?auto_41627 ?auto_41629 ) ( ON ?auto_41627 ?auto_41623 ) ( CLEAR ?auto_41627 ) ( not ( = ?auto_41618 ?auto_41623 ) ) ( not ( = ?auto_41619 ?auto_41623 ) ) ( not ( = ?auto_41633 ?auto_41623 ) ) ( not ( = ?auto_41626 ?auto_41623 ) ) ( not ( = ?auto_41640 ?auto_41623 ) ) ( not ( = ?auto_41627 ?auto_41623 ) ) ( not ( = ?auto_41630 ?auto_41623 ) ) ( not ( = ?auto_41638 ?auto_41623 ) ) ( IS-CRATE ?auto_41638 ) ( not ( = ?auto_41618 ?auto_41625 ) ) ( not ( = ?auto_41619 ?auto_41625 ) ) ( not ( = ?auto_41633 ?auto_41625 ) ) ( not ( = ?auto_41626 ?auto_41625 ) ) ( not ( = ?auto_41640 ?auto_41625 ) ) ( not ( = ?auto_41627 ?auto_41625 ) ) ( not ( = ?auto_41630 ?auto_41625 ) ) ( not ( = ?auto_41638 ?auto_41625 ) ) ( not ( = ?auto_41623 ?auto_41625 ) ) ( AVAILABLE ?auto_41621 ) ( SURFACE-AT ?auto_41638 ?auto_41628 ) ( ON ?auto_41638 ?auto_41632 ) ( CLEAR ?auto_41638 ) ( not ( = ?auto_41618 ?auto_41632 ) ) ( not ( = ?auto_41619 ?auto_41632 ) ) ( not ( = ?auto_41633 ?auto_41632 ) ) ( not ( = ?auto_41626 ?auto_41632 ) ) ( not ( = ?auto_41640 ?auto_41632 ) ) ( not ( = ?auto_41627 ?auto_41632 ) ) ( not ( = ?auto_41630 ?auto_41632 ) ) ( not ( = ?auto_41638 ?auto_41632 ) ) ( not ( = ?auto_41623 ?auto_41632 ) ) ( not ( = ?auto_41625 ?auto_41632 ) ) ( SURFACE-AT ?auto_41637 ?auto_41634 ) ( CLEAR ?auto_41637 ) ( IS-CRATE ?auto_41625 ) ( not ( = ?auto_41618 ?auto_41637 ) ) ( not ( = ?auto_41619 ?auto_41637 ) ) ( not ( = ?auto_41633 ?auto_41637 ) ) ( not ( = ?auto_41626 ?auto_41637 ) ) ( not ( = ?auto_41640 ?auto_41637 ) ) ( not ( = ?auto_41627 ?auto_41637 ) ) ( not ( = ?auto_41630 ?auto_41637 ) ) ( not ( = ?auto_41638 ?auto_41637 ) ) ( not ( = ?auto_41623 ?auto_41637 ) ) ( not ( = ?auto_41625 ?auto_41637 ) ) ( not ( = ?auto_41632 ?auto_41637 ) ) ( AVAILABLE ?auto_41620 ) ( TRUCK-AT ?auto_41624 ?auto_41622 ) ( not ( = ?auto_41622 ?auto_41634 ) ) ( not ( = ?auto_41628 ?auto_41622 ) ) ( not ( = ?auto_41641 ?auto_41622 ) ) ( not ( = ?auto_41635 ?auto_41622 ) ) ( not ( = ?auto_41629 ?auto_41622 ) ) ( HOIST-AT ?auto_41642 ?auto_41622 ) ( LIFTING ?auto_41642 ?auto_41625 ) ( not ( = ?auto_41620 ?auto_41642 ) ) ( not ( = ?auto_41621 ?auto_41642 ) ) ( not ( = ?auto_41639 ?auto_41642 ) ) ( not ( = ?auto_41631 ?auto_41642 ) ) ( not ( = ?auto_41636 ?auto_41642 ) ) )
    :subtasks
    ( ( !LOAD ?auto_41642 ?auto_41625 ?auto_41624 ?auto_41622 )
      ( MAKE-ON ?auto_41618 ?auto_41619 )
      ( MAKE-ON-VERIFY ?auto_41618 ?auto_41619 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41643 - SURFACE
      ?auto_41644 - SURFACE
    )
    :vars
    (
      ?auto_41659 - HOIST
      ?auto_41660 - PLACE
      ?auto_41664 - PLACE
      ?auto_41656 - HOIST
      ?auto_41650 - SURFACE
      ?auto_41651 - SURFACE
      ?auto_41665 - PLACE
      ?auto_41661 - HOIST
      ?auto_41647 - SURFACE
      ?auto_41653 - SURFACE
      ?auto_41663 - PLACE
      ?auto_41666 - HOIST
      ?auto_41646 - SURFACE
      ?auto_41662 - SURFACE
      ?auto_41667 - PLACE
      ?auto_41648 - HOIST
      ?auto_41655 - SURFACE
      ?auto_41652 - SURFACE
      ?auto_41645 - SURFACE
      ?auto_41658 - SURFACE
      ?auto_41657 - TRUCK
      ?auto_41654 - PLACE
      ?auto_41649 - HOIST
      ?auto_41668 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41659 ?auto_41660 ) ( IS-CRATE ?auto_41643 ) ( not ( = ?auto_41643 ?auto_41644 ) ) ( not ( = ?auto_41664 ?auto_41660 ) ) ( HOIST-AT ?auto_41656 ?auto_41664 ) ( not ( = ?auto_41659 ?auto_41656 ) ) ( SURFACE-AT ?auto_41643 ?auto_41664 ) ( ON ?auto_41643 ?auto_41650 ) ( CLEAR ?auto_41643 ) ( not ( = ?auto_41643 ?auto_41650 ) ) ( not ( = ?auto_41644 ?auto_41650 ) ) ( IS-CRATE ?auto_41644 ) ( not ( = ?auto_41643 ?auto_41651 ) ) ( not ( = ?auto_41644 ?auto_41651 ) ) ( not ( = ?auto_41650 ?auto_41651 ) ) ( not ( = ?auto_41665 ?auto_41660 ) ) ( not ( = ?auto_41664 ?auto_41665 ) ) ( HOIST-AT ?auto_41661 ?auto_41665 ) ( not ( = ?auto_41659 ?auto_41661 ) ) ( not ( = ?auto_41656 ?auto_41661 ) ) ( AVAILABLE ?auto_41661 ) ( SURFACE-AT ?auto_41644 ?auto_41665 ) ( ON ?auto_41644 ?auto_41647 ) ( CLEAR ?auto_41644 ) ( not ( = ?auto_41643 ?auto_41647 ) ) ( not ( = ?auto_41644 ?auto_41647 ) ) ( not ( = ?auto_41650 ?auto_41647 ) ) ( not ( = ?auto_41651 ?auto_41647 ) ) ( IS-CRATE ?auto_41651 ) ( not ( = ?auto_41643 ?auto_41653 ) ) ( not ( = ?auto_41644 ?auto_41653 ) ) ( not ( = ?auto_41650 ?auto_41653 ) ) ( not ( = ?auto_41651 ?auto_41653 ) ) ( not ( = ?auto_41647 ?auto_41653 ) ) ( not ( = ?auto_41663 ?auto_41660 ) ) ( not ( = ?auto_41664 ?auto_41663 ) ) ( not ( = ?auto_41665 ?auto_41663 ) ) ( HOIST-AT ?auto_41666 ?auto_41663 ) ( not ( = ?auto_41659 ?auto_41666 ) ) ( not ( = ?auto_41656 ?auto_41666 ) ) ( not ( = ?auto_41661 ?auto_41666 ) ) ( AVAILABLE ?auto_41666 ) ( SURFACE-AT ?auto_41651 ?auto_41663 ) ( ON ?auto_41651 ?auto_41646 ) ( CLEAR ?auto_41651 ) ( not ( = ?auto_41643 ?auto_41646 ) ) ( not ( = ?auto_41644 ?auto_41646 ) ) ( not ( = ?auto_41650 ?auto_41646 ) ) ( not ( = ?auto_41651 ?auto_41646 ) ) ( not ( = ?auto_41647 ?auto_41646 ) ) ( not ( = ?auto_41653 ?auto_41646 ) ) ( IS-CRATE ?auto_41653 ) ( not ( = ?auto_41643 ?auto_41662 ) ) ( not ( = ?auto_41644 ?auto_41662 ) ) ( not ( = ?auto_41650 ?auto_41662 ) ) ( not ( = ?auto_41651 ?auto_41662 ) ) ( not ( = ?auto_41647 ?auto_41662 ) ) ( not ( = ?auto_41653 ?auto_41662 ) ) ( not ( = ?auto_41646 ?auto_41662 ) ) ( not ( = ?auto_41667 ?auto_41660 ) ) ( not ( = ?auto_41664 ?auto_41667 ) ) ( not ( = ?auto_41665 ?auto_41667 ) ) ( not ( = ?auto_41663 ?auto_41667 ) ) ( HOIST-AT ?auto_41648 ?auto_41667 ) ( not ( = ?auto_41659 ?auto_41648 ) ) ( not ( = ?auto_41656 ?auto_41648 ) ) ( not ( = ?auto_41661 ?auto_41648 ) ) ( not ( = ?auto_41666 ?auto_41648 ) ) ( AVAILABLE ?auto_41648 ) ( SURFACE-AT ?auto_41653 ?auto_41667 ) ( ON ?auto_41653 ?auto_41655 ) ( CLEAR ?auto_41653 ) ( not ( = ?auto_41643 ?auto_41655 ) ) ( not ( = ?auto_41644 ?auto_41655 ) ) ( not ( = ?auto_41650 ?auto_41655 ) ) ( not ( = ?auto_41651 ?auto_41655 ) ) ( not ( = ?auto_41647 ?auto_41655 ) ) ( not ( = ?auto_41653 ?auto_41655 ) ) ( not ( = ?auto_41646 ?auto_41655 ) ) ( not ( = ?auto_41662 ?auto_41655 ) ) ( IS-CRATE ?auto_41662 ) ( not ( = ?auto_41643 ?auto_41652 ) ) ( not ( = ?auto_41644 ?auto_41652 ) ) ( not ( = ?auto_41650 ?auto_41652 ) ) ( not ( = ?auto_41651 ?auto_41652 ) ) ( not ( = ?auto_41647 ?auto_41652 ) ) ( not ( = ?auto_41653 ?auto_41652 ) ) ( not ( = ?auto_41646 ?auto_41652 ) ) ( not ( = ?auto_41662 ?auto_41652 ) ) ( not ( = ?auto_41655 ?auto_41652 ) ) ( AVAILABLE ?auto_41656 ) ( SURFACE-AT ?auto_41662 ?auto_41664 ) ( ON ?auto_41662 ?auto_41645 ) ( CLEAR ?auto_41662 ) ( not ( = ?auto_41643 ?auto_41645 ) ) ( not ( = ?auto_41644 ?auto_41645 ) ) ( not ( = ?auto_41650 ?auto_41645 ) ) ( not ( = ?auto_41651 ?auto_41645 ) ) ( not ( = ?auto_41647 ?auto_41645 ) ) ( not ( = ?auto_41653 ?auto_41645 ) ) ( not ( = ?auto_41646 ?auto_41645 ) ) ( not ( = ?auto_41662 ?auto_41645 ) ) ( not ( = ?auto_41655 ?auto_41645 ) ) ( not ( = ?auto_41652 ?auto_41645 ) ) ( SURFACE-AT ?auto_41658 ?auto_41660 ) ( CLEAR ?auto_41658 ) ( IS-CRATE ?auto_41652 ) ( not ( = ?auto_41643 ?auto_41658 ) ) ( not ( = ?auto_41644 ?auto_41658 ) ) ( not ( = ?auto_41650 ?auto_41658 ) ) ( not ( = ?auto_41651 ?auto_41658 ) ) ( not ( = ?auto_41647 ?auto_41658 ) ) ( not ( = ?auto_41653 ?auto_41658 ) ) ( not ( = ?auto_41646 ?auto_41658 ) ) ( not ( = ?auto_41662 ?auto_41658 ) ) ( not ( = ?auto_41655 ?auto_41658 ) ) ( not ( = ?auto_41652 ?auto_41658 ) ) ( not ( = ?auto_41645 ?auto_41658 ) ) ( AVAILABLE ?auto_41659 ) ( TRUCK-AT ?auto_41657 ?auto_41654 ) ( not ( = ?auto_41654 ?auto_41660 ) ) ( not ( = ?auto_41664 ?auto_41654 ) ) ( not ( = ?auto_41665 ?auto_41654 ) ) ( not ( = ?auto_41663 ?auto_41654 ) ) ( not ( = ?auto_41667 ?auto_41654 ) ) ( HOIST-AT ?auto_41649 ?auto_41654 ) ( not ( = ?auto_41659 ?auto_41649 ) ) ( not ( = ?auto_41656 ?auto_41649 ) ) ( not ( = ?auto_41661 ?auto_41649 ) ) ( not ( = ?auto_41666 ?auto_41649 ) ) ( not ( = ?auto_41648 ?auto_41649 ) ) ( AVAILABLE ?auto_41649 ) ( SURFACE-AT ?auto_41652 ?auto_41654 ) ( ON ?auto_41652 ?auto_41668 ) ( CLEAR ?auto_41652 ) ( not ( = ?auto_41643 ?auto_41668 ) ) ( not ( = ?auto_41644 ?auto_41668 ) ) ( not ( = ?auto_41650 ?auto_41668 ) ) ( not ( = ?auto_41651 ?auto_41668 ) ) ( not ( = ?auto_41647 ?auto_41668 ) ) ( not ( = ?auto_41653 ?auto_41668 ) ) ( not ( = ?auto_41646 ?auto_41668 ) ) ( not ( = ?auto_41662 ?auto_41668 ) ) ( not ( = ?auto_41655 ?auto_41668 ) ) ( not ( = ?auto_41652 ?auto_41668 ) ) ( not ( = ?auto_41645 ?auto_41668 ) ) ( not ( = ?auto_41658 ?auto_41668 ) ) )
    :subtasks
    ( ( !LIFT ?auto_41649 ?auto_41652 ?auto_41668 ?auto_41654 )
      ( MAKE-ON ?auto_41643 ?auto_41644 )
      ( MAKE-ON-VERIFY ?auto_41643 ?auto_41644 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41669 - SURFACE
      ?auto_41670 - SURFACE
    )
    :vars
    (
      ?auto_41675 - HOIST
      ?auto_41686 - PLACE
      ?auto_41673 - PLACE
      ?auto_41688 - HOIST
      ?auto_41685 - SURFACE
      ?auto_41691 - SURFACE
      ?auto_41674 - PLACE
      ?auto_41694 - HOIST
      ?auto_41679 - SURFACE
      ?auto_41684 - SURFACE
      ?auto_41692 - PLACE
      ?auto_41671 - HOIST
      ?auto_41676 - SURFACE
      ?auto_41693 - SURFACE
      ?auto_41672 - PLACE
      ?auto_41681 - HOIST
      ?auto_41678 - SURFACE
      ?auto_41683 - SURFACE
      ?auto_41687 - SURFACE
      ?auto_41682 - SURFACE
      ?auto_41677 - PLACE
      ?auto_41680 - HOIST
      ?auto_41690 - SURFACE
      ?auto_41689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41675 ?auto_41686 ) ( IS-CRATE ?auto_41669 ) ( not ( = ?auto_41669 ?auto_41670 ) ) ( not ( = ?auto_41673 ?auto_41686 ) ) ( HOIST-AT ?auto_41688 ?auto_41673 ) ( not ( = ?auto_41675 ?auto_41688 ) ) ( SURFACE-AT ?auto_41669 ?auto_41673 ) ( ON ?auto_41669 ?auto_41685 ) ( CLEAR ?auto_41669 ) ( not ( = ?auto_41669 ?auto_41685 ) ) ( not ( = ?auto_41670 ?auto_41685 ) ) ( IS-CRATE ?auto_41670 ) ( not ( = ?auto_41669 ?auto_41691 ) ) ( not ( = ?auto_41670 ?auto_41691 ) ) ( not ( = ?auto_41685 ?auto_41691 ) ) ( not ( = ?auto_41674 ?auto_41686 ) ) ( not ( = ?auto_41673 ?auto_41674 ) ) ( HOIST-AT ?auto_41694 ?auto_41674 ) ( not ( = ?auto_41675 ?auto_41694 ) ) ( not ( = ?auto_41688 ?auto_41694 ) ) ( AVAILABLE ?auto_41694 ) ( SURFACE-AT ?auto_41670 ?auto_41674 ) ( ON ?auto_41670 ?auto_41679 ) ( CLEAR ?auto_41670 ) ( not ( = ?auto_41669 ?auto_41679 ) ) ( not ( = ?auto_41670 ?auto_41679 ) ) ( not ( = ?auto_41685 ?auto_41679 ) ) ( not ( = ?auto_41691 ?auto_41679 ) ) ( IS-CRATE ?auto_41691 ) ( not ( = ?auto_41669 ?auto_41684 ) ) ( not ( = ?auto_41670 ?auto_41684 ) ) ( not ( = ?auto_41685 ?auto_41684 ) ) ( not ( = ?auto_41691 ?auto_41684 ) ) ( not ( = ?auto_41679 ?auto_41684 ) ) ( not ( = ?auto_41692 ?auto_41686 ) ) ( not ( = ?auto_41673 ?auto_41692 ) ) ( not ( = ?auto_41674 ?auto_41692 ) ) ( HOIST-AT ?auto_41671 ?auto_41692 ) ( not ( = ?auto_41675 ?auto_41671 ) ) ( not ( = ?auto_41688 ?auto_41671 ) ) ( not ( = ?auto_41694 ?auto_41671 ) ) ( AVAILABLE ?auto_41671 ) ( SURFACE-AT ?auto_41691 ?auto_41692 ) ( ON ?auto_41691 ?auto_41676 ) ( CLEAR ?auto_41691 ) ( not ( = ?auto_41669 ?auto_41676 ) ) ( not ( = ?auto_41670 ?auto_41676 ) ) ( not ( = ?auto_41685 ?auto_41676 ) ) ( not ( = ?auto_41691 ?auto_41676 ) ) ( not ( = ?auto_41679 ?auto_41676 ) ) ( not ( = ?auto_41684 ?auto_41676 ) ) ( IS-CRATE ?auto_41684 ) ( not ( = ?auto_41669 ?auto_41693 ) ) ( not ( = ?auto_41670 ?auto_41693 ) ) ( not ( = ?auto_41685 ?auto_41693 ) ) ( not ( = ?auto_41691 ?auto_41693 ) ) ( not ( = ?auto_41679 ?auto_41693 ) ) ( not ( = ?auto_41684 ?auto_41693 ) ) ( not ( = ?auto_41676 ?auto_41693 ) ) ( not ( = ?auto_41672 ?auto_41686 ) ) ( not ( = ?auto_41673 ?auto_41672 ) ) ( not ( = ?auto_41674 ?auto_41672 ) ) ( not ( = ?auto_41692 ?auto_41672 ) ) ( HOIST-AT ?auto_41681 ?auto_41672 ) ( not ( = ?auto_41675 ?auto_41681 ) ) ( not ( = ?auto_41688 ?auto_41681 ) ) ( not ( = ?auto_41694 ?auto_41681 ) ) ( not ( = ?auto_41671 ?auto_41681 ) ) ( AVAILABLE ?auto_41681 ) ( SURFACE-AT ?auto_41684 ?auto_41672 ) ( ON ?auto_41684 ?auto_41678 ) ( CLEAR ?auto_41684 ) ( not ( = ?auto_41669 ?auto_41678 ) ) ( not ( = ?auto_41670 ?auto_41678 ) ) ( not ( = ?auto_41685 ?auto_41678 ) ) ( not ( = ?auto_41691 ?auto_41678 ) ) ( not ( = ?auto_41679 ?auto_41678 ) ) ( not ( = ?auto_41684 ?auto_41678 ) ) ( not ( = ?auto_41676 ?auto_41678 ) ) ( not ( = ?auto_41693 ?auto_41678 ) ) ( IS-CRATE ?auto_41693 ) ( not ( = ?auto_41669 ?auto_41683 ) ) ( not ( = ?auto_41670 ?auto_41683 ) ) ( not ( = ?auto_41685 ?auto_41683 ) ) ( not ( = ?auto_41691 ?auto_41683 ) ) ( not ( = ?auto_41679 ?auto_41683 ) ) ( not ( = ?auto_41684 ?auto_41683 ) ) ( not ( = ?auto_41676 ?auto_41683 ) ) ( not ( = ?auto_41693 ?auto_41683 ) ) ( not ( = ?auto_41678 ?auto_41683 ) ) ( AVAILABLE ?auto_41688 ) ( SURFACE-AT ?auto_41693 ?auto_41673 ) ( ON ?auto_41693 ?auto_41687 ) ( CLEAR ?auto_41693 ) ( not ( = ?auto_41669 ?auto_41687 ) ) ( not ( = ?auto_41670 ?auto_41687 ) ) ( not ( = ?auto_41685 ?auto_41687 ) ) ( not ( = ?auto_41691 ?auto_41687 ) ) ( not ( = ?auto_41679 ?auto_41687 ) ) ( not ( = ?auto_41684 ?auto_41687 ) ) ( not ( = ?auto_41676 ?auto_41687 ) ) ( not ( = ?auto_41693 ?auto_41687 ) ) ( not ( = ?auto_41678 ?auto_41687 ) ) ( not ( = ?auto_41683 ?auto_41687 ) ) ( SURFACE-AT ?auto_41682 ?auto_41686 ) ( CLEAR ?auto_41682 ) ( IS-CRATE ?auto_41683 ) ( not ( = ?auto_41669 ?auto_41682 ) ) ( not ( = ?auto_41670 ?auto_41682 ) ) ( not ( = ?auto_41685 ?auto_41682 ) ) ( not ( = ?auto_41691 ?auto_41682 ) ) ( not ( = ?auto_41679 ?auto_41682 ) ) ( not ( = ?auto_41684 ?auto_41682 ) ) ( not ( = ?auto_41676 ?auto_41682 ) ) ( not ( = ?auto_41693 ?auto_41682 ) ) ( not ( = ?auto_41678 ?auto_41682 ) ) ( not ( = ?auto_41683 ?auto_41682 ) ) ( not ( = ?auto_41687 ?auto_41682 ) ) ( AVAILABLE ?auto_41675 ) ( not ( = ?auto_41677 ?auto_41686 ) ) ( not ( = ?auto_41673 ?auto_41677 ) ) ( not ( = ?auto_41674 ?auto_41677 ) ) ( not ( = ?auto_41692 ?auto_41677 ) ) ( not ( = ?auto_41672 ?auto_41677 ) ) ( HOIST-AT ?auto_41680 ?auto_41677 ) ( not ( = ?auto_41675 ?auto_41680 ) ) ( not ( = ?auto_41688 ?auto_41680 ) ) ( not ( = ?auto_41694 ?auto_41680 ) ) ( not ( = ?auto_41671 ?auto_41680 ) ) ( not ( = ?auto_41681 ?auto_41680 ) ) ( AVAILABLE ?auto_41680 ) ( SURFACE-AT ?auto_41683 ?auto_41677 ) ( ON ?auto_41683 ?auto_41690 ) ( CLEAR ?auto_41683 ) ( not ( = ?auto_41669 ?auto_41690 ) ) ( not ( = ?auto_41670 ?auto_41690 ) ) ( not ( = ?auto_41685 ?auto_41690 ) ) ( not ( = ?auto_41691 ?auto_41690 ) ) ( not ( = ?auto_41679 ?auto_41690 ) ) ( not ( = ?auto_41684 ?auto_41690 ) ) ( not ( = ?auto_41676 ?auto_41690 ) ) ( not ( = ?auto_41693 ?auto_41690 ) ) ( not ( = ?auto_41678 ?auto_41690 ) ) ( not ( = ?auto_41683 ?auto_41690 ) ) ( not ( = ?auto_41687 ?auto_41690 ) ) ( not ( = ?auto_41682 ?auto_41690 ) ) ( TRUCK-AT ?auto_41689 ?auto_41686 ) )
    :subtasks
    ( ( !DRIVE ?auto_41689 ?auto_41686 ?auto_41677 )
      ( MAKE-ON ?auto_41669 ?auto_41670 )
      ( MAKE-ON-VERIFY ?auto_41669 ?auto_41670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41695 - SURFACE
      ?auto_41696 - SURFACE
    )
    :vars
    (
      ?auto_41707 - HOIST
      ?auto_41719 - PLACE
      ?auto_41714 - PLACE
      ?auto_41702 - HOIST
      ?auto_41720 - SURFACE
      ?auto_41704 - SURFACE
      ?auto_41706 - PLACE
      ?auto_41697 - HOIST
      ?auto_41718 - SURFACE
      ?auto_41700 - SURFACE
      ?auto_41715 - PLACE
      ?auto_41711 - HOIST
      ?auto_41698 - SURFACE
      ?auto_41716 - SURFACE
      ?auto_41713 - PLACE
      ?auto_41705 - HOIST
      ?auto_41708 - SURFACE
      ?auto_41712 - SURFACE
      ?auto_41703 - SURFACE
      ?auto_41699 - SURFACE
      ?auto_41717 - PLACE
      ?auto_41710 - HOIST
      ?auto_41701 - SURFACE
      ?auto_41709 - TRUCK
      ?auto_41721 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41707 ?auto_41719 ) ( IS-CRATE ?auto_41695 ) ( not ( = ?auto_41695 ?auto_41696 ) ) ( not ( = ?auto_41714 ?auto_41719 ) ) ( HOIST-AT ?auto_41702 ?auto_41714 ) ( not ( = ?auto_41707 ?auto_41702 ) ) ( SURFACE-AT ?auto_41695 ?auto_41714 ) ( ON ?auto_41695 ?auto_41720 ) ( CLEAR ?auto_41695 ) ( not ( = ?auto_41695 ?auto_41720 ) ) ( not ( = ?auto_41696 ?auto_41720 ) ) ( IS-CRATE ?auto_41696 ) ( not ( = ?auto_41695 ?auto_41704 ) ) ( not ( = ?auto_41696 ?auto_41704 ) ) ( not ( = ?auto_41720 ?auto_41704 ) ) ( not ( = ?auto_41706 ?auto_41719 ) ) ( not ( = ?auto_41714 ?auto_41706 ) ) ( HOIST-AT ?auto_41697 ?auto_41706 ) ( not ( = ?auto_41707 ?auto_41697 ) ) ( not ( = ?auto_41702 ?auto_41697 ) ) ( AVAILABLE ?auto_41697 ) ( SURFACE-AT ?auto_41696 ?auto_41706 ) ( ON ?auto_41696 ?auto_41718 ) ( CLEAR ?auto_41696 ) ( not ( = ?auto_41695 ?auto_41718 ) ) ( not ( = ?auto_41696 ?auto_41718 ) ) ( not ( = ?auto_41720 ?auto_41718 ) ) ( not ( = ?auto_41704 ?auto_41718 ) ) ( IS-CRATE ?auto_41704 ) ( not ( = ?auto_41695 ?auto_41700 ) ) ( not ( = ?auto_41696 ?auto_41700 ) ) ( not ( = ?auto_41720 ?auto_41700 ) ) ( not ( = ?auto_41704 ?auto_41700 ) ) ( not ( = ?auto_41718 ?auto_41700 ) ) ( not ( = ?auto_41715 ?auto_41719 ) ) ( not ( = ?auto_41714 ?auto_41715 ) ) ( not ( = ?auto_41706 ?auto_41715 ) ) ( HOIST-AT ?auto_41711 ?auto_41715 ) ( not ( = ?auto_41707 ?auto_41711 ) ) ( not ( = ?auto_41702 ?auto_41711 ) ) ( not ( = ?auto_41697 ?auto_41711 ) ) ( AVAILABLE ?auto_41711 ) ( SURFACE-AT ?auto_41704 ?auto_41715 ) ( ON ?auto_41704 ?auto_41698 ) ( CLEAR ?auto_41704 ) ( not ( = ?auto_41695 ?auto_41698 ) ) ( not ( = ?auto_41696 ?auto_41698 ) ) ( not ( = ?auto_41720 ?auto_41698 ) ) ( not ( = ?auto_41704 ?auto_41698 ) ) ( not ( = ?auto_41718 ?auto_41698 ) ) ( not ( = ?auto_41700 ?auto_41698 ) ) ( IS-CRATE ?auto_41700 ) ( not ( = ?auto_41695 ?auto_41716 ) ) ( not ( = ?auto_41696 ?auto_41716 ) ) ( not ( = ?auto_41720 ?auto_41716 ) ) ( not ( = ?auto_41704 ?auto_41716 ) ) ( not ( = ?auto_41718 ?auto_41716 ) ) ( not ( = ?auto_41700 ?auto_41716 ) ) ( not ( = ?auto_41698 ?auto_41716 ) ) ( not ( = ?auto_41713 ?auto_41719 ) ) ( not ( = ?auto_41714 ?auto_41713 ) ) ( not ( = ?auto_41706 ?auto_41713 ) ) ( not ( = ?auto_41715 ?auto_41713 ) ) ( HOIST-AT ?auto_41705 ?auto_41713 ) ( not ( = ?auto_41707 ?auto_41705 ) ) ( not ( = ?auto_41702 ?auto_41705 ) ) ( not ( = ?auto_41697 ?auto_41705 ) ) ( not ( = ?auto_41711 ?auto_41705 ) ) ( AVAILABLE ?auto_41705 ) ( SURFACE-AT ?auto_41700 ?auto_41713 ) ( ON ?auto_41700 ?auto_41708 ) ( CLEAR ?auto_41700 ) ( not ( = ?auto_41695 ?auto_41708 ) ) ( not ( = ?auto_41696 ?auto_41708 ) ) ( not ( = ?auto_41720 ?auto_41708 ) ) ( not ( = ?auto_41704 ?auto_41708 ) ) ( not ( = ?auto_41718 ?auto_41708 ) ) ( not ( = ?auto_41700 ?auto_41708 ) ) ( not ( = ?auto_41698 ?auto_41708 ) ) ( not ( = ?auto_41716 ?auto_41708 ) ) ( IS-CRATE ?auto_41716 ) ( not ( = ?auto_41695 ?auto_41712 ) ) ( not ( = ?auto_41696 ?auto_41712 ) ) ( not ( = ?auto_41720 ?auto_41712 ) ) ( not ( = ?auto_41704 ?auto_41712 ) ) ( not ( = ?auto_41718 ?auto_41712 ) ) ( not ( = ?auto_41700 ?auto_41712 ) ) ( not ( = ?auto_41698 ?auto_41712 ) ) ( not ( = ?auto_41716 ?auto_41712 ) ) ( not ( = ?auto_41708 ?auto_41712 ) ) ( AVAILABLE ?auto_41702 ) ( SURFACE-AT ?auto_41716 ?auto_41714 ) ( ON ?auto_41716 ?auto_41703 ) ( CLEAR ?auto_41716 ) ( not ( = ?auto_41695 ?auto_41703 ) ) ( not ( = ?auto_41696 ?auto_41703 ) ) ( not ( = ?auto_41720 ?auto_41703 ) ) ( not ( = ?auto_41704 ?auto_41703 ) ) ( not ( = ?auto_41718 ?auto_41703 ) ) ( not ( = ?auto_41700 ?auto_41703 ) ) ( not ( = ?auto_41698 ?auto_41703 ) ) ( not ( = ?auto_41716 ?auto_41703 ) ) ( not ( = ?auto_41708 ?auto_41703 ) ) ( not ( = ?auto_41712 ?auto_41703 ) ) ( IS-CRATE ?auto_41712 ) ( not ( = ?auto_41695 ?auto_41699 ) ) ( not ( = ?auto_41696 ?auto_41699 ) ) ( not ( = ?auto_41720 ?auto_41699 ) ) ( not ( = ?auto_41704 ?auto_41699 ) ) ( not ( = ?auto_41718 ?auto_41699 ) ) ( not ( = ?auto_41700 ?auto_41699 ) ) ( not ( = ?auto_41698 ?auto_41699 ) ) ( not ( = ?auto_41716 ?auto_41699 ) ) ( not ( = ?auto_41708 ?auto_41699 ) ) ( not ( = ?auto_41712 ?auto_41699 ) ) ( not ( = ?auto_41703 ?auto_41699 ) ) ( not ( = ?auto_41717 ?auto_41719 ) ) ( not ( = ?auto_41714 ?auto_41717 ) ) ( not ( = ?auto_41706 ?auto_41717 ) ) ( not ( = ?auto_41715 ?auto_41717 ) ) ( not ( = ?auto_41713 ?auto_41717 ) ) ( HOIST-AT ?auto_41710 ?auto_41717 ) ( not ( = ?auto_41707 ?auto_41710 ) ) ( not ( = ?auto_41702 ?auto_41710 ) ) ( not ( = ?auto_41697 ?auto_41710 ) ) ( not ( = ?auto_41711 ?auto_41710 ) ) ( not ( = ?auto_41705 ?auto_41710 ) ) ( AVAILABLE ?auto_41710 ) ( SURFACE-AT ?auto_41712 ?auto_41717 ) ( ON ?auto_41712 ?auto_41701 ) ( CLEAR ?auto_41712 ) ( not ( = ?auto_41695 ?auto_41701 ) ) ( not ( = ?auto_41696 ?auto_41701 ) ) ( not ( = ?auto_41720 ?auto_41701 ) ) ( not ( = ?auto_41704 ?auto_41701 ) ) ( not ( = ?auto_41718 ?auto_41701 ) ) ( not ( = ?auto_41700 ?auto_41701 ) ) ( not ( = ?auto_41698 ?auto_41701 ) ) ( not ( = ?auto_41716 ?auto_41701 ) ) ( not ( = ?auto_41708 ?auto_41701 ) ) ( not ( = ?auto_41712 ?auto_41701 ) ) ( not ( = ?auto_41703 ?auto_41701 ) ) ( not ( = ?auto_41699 ?auto_41701 ) ) ( TRUCK-AT ?auto_41709 ?auto_41719 ) ( SURFACE-AT ?auto_41721 ?auto_41719 ) ( CLEAR ?auto_41721 ) ( LIFTING ?auto_41707 ?auto_41699 ) ( IS-CRATE ?auto_41699 ) ( not ( = ?auto_41695 ?auto_41721 ) ) ( not ( = ?auto_41696 ?auto_41721 ) ) ( not ( = ?auto_41720 ?auto_41721 ) ) ( not ( = ?auto_41704 ?auto_41721 ) ) ( not ( = ?auto_41718 ?auto_41721 ) ) ( not ( = ?auto_41700 ?auto_41721 ) ) ( not ( = ?auto_41698 ?auto_41721 ) ) ( not ( = ?auto_41716 ?auto_41721 ) ) ( not ( = ?auto_41708 ?auto_41721 ) ) ( not ( = ?auto_41712 ?auto_41721 ) ) ( not ( = ?auto_41703 ?auto_41721 ) ) ( not ( = ?auto_41699 ?auto_41721 ) ) ( not ( = ?auto_41701 ?auto_41721 ) ) )
    :subtasks
    ( ( !DROP ?auto_41707 ?auto_41699 ?auto_41721 ?auto_41719 )
      ( MAKE-ON ?auto_41695 ?auto_41696 )
      ( MAKE-ON-VERIFY ?auto_41695 ?auto_41696 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41722 - SURFACE
      ?auto_41723 - SURFACE
    )
    :vars
    (
      ?auto_41726 - HOIST
      ?auto_41733 - PLACE
      ?auto_41731 - PLACE
      ?auto_41725 - HOIST
      ?auto_41738 - SURFACE
      ?auto_41745 - SURFACE
      ?auto_41746 - PLACE
      ?auto_41737 - HOIST
      ?auto_41728 - SURFACE
      ?auto_41727 - SURFACE
      ?auto_41730 - PLACE
      ?auto_41739 - HOIST
      ?auto_41741 - SURFACE
      ?auto_41729 - SURFACE
      ?auto_41732 - PLACE
      ?auto_41736 - HOIST
      ?auto_41743 - SURFACE
      ?auto_41734 - SURFACE
      ?auto_41735 - SURFACE
      ?auto_41747 - SURFACE
      ?auto_41724 - PLACE
      ?auto_41744 - HOIST
      ?auto_41740 - SURFACE
      ?auto_41742 - TRUCK
      ?auto_41748 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41726 ?auto_41733 ) ( IS-CRATE ?auto_41722 ) ( not ( = ?auto_41722 ?auto_41723 ) ) ( not ( = ?auto_41731 ?auto_41733 ) ) ( HOIST-AT ?auto_41725 ?auto_41731 ) ( not ( = ?auto_41726 ?auto_41725 ) ) ( SURFACE-AT ?auto_41722 ?auto_41731 ) ( ON ?auto_41722 ?auto_41738 ) ( CLEAR ?auto_41722 ) ( not ( = ?auto_41722 ?auto_41738 ) ) ( not ( = ?auto_41723 ?auto_41738 ) ) ( IS-CRATE ?auto_41723 ) ( not ( = ?auto_41722 ?auto_41745 ) ) ( not ( = ?auto_41723 ?auto_41745 ) ) ( not ( = ?auto_41738 ?auto_41745 ) ) ( not ( = ?auto_41746 ?auto_41733 ) ) ( not ( = ?auto_41731 ?auto_41746 ) ) ( HOIST-AT ?auto_41737 ?auto_41746 ) ( not ( = ?auto_41726 ?auto_41737 ) ) ( not ( = ?auto_41725 ?auto_41737 ) ) ( AVAILABLE ?auto_41737 ) ( SURFACE-AT ?auto_41723 ?auto_41746 ) ( ON ?auto_41723 ?auto_41728 ) ( CLEAR ?auto_41723 ) ( not ( = ?auto_41722 ?auto_41728 ) ) ( not ( = ?auto_41723 ?auto_41728 ) ) ( not ( = ?auto_41738 ?auto_41728 ) ) ( not ( = ?auto_41745 ?auto_41728 ) ) ( IS-CRATE ?auto_41745 ) ( not ( = ?auto_41722 ?auto_41727 ) ) ( not ( = ?auto_41723 ?auto_41727 ) ) ( not ( = ?auto_41738 ?auto_41727 ) ) ( not ( = ?auto_41745 ?auto_41727 ) ) ( not ( = ?auto_41728 ?auto_41727 ) ) ( not ( = ?auto_41730 ?auto_41733 ) ) ( not ( = ?auto_41731 ?auto_41730 ) ) ( not ( = ?auto_41746 ?auto_41730 ) ) ( HOIST-AT ?auto_41739 ?auto_41730 ) ( not ( = ?auto_41726 ?auto_41739 ) ) ( not ( = ?auto_41725 ?auto_41739 ) ) ( not ( = ?auto_41737 ?auto_41739 ) ) ( AVAILABLE ?auto_41739 ) ( SURFACE-AT ?auto_41745 ?auto_41730 ) ( ON ?auto_41745 ?auto_41741 ) ( CLEAR ?auto_41745 ) ( not ( = ?auto_41722 ?auto_41741 ) ) ( not ( = ?auto_41723 ?auto_41741 ) ) ( not ( = ?auto_41738 ?auto_41741 ) ) ( not ( = ?auto_41745 ?auto_41741 ) ) ( not ( = ?auto_41728 ?auto_41741 ) ) ( not ( = ?auto_41727 ?auto_41741 ) ) ( IS-CRATE ?auto_41727 ) ( not ( = ?auto_41722 ?auto_41729 ) ) ( not ( = ?auto_41723 ?auto_41729 ) ) ( not ( = ?auto_41738 ?auto_41729 ) ) ( not ( = ?auto_41745 ?auto_41729 ) ) ( not ( = ?auto_41728 ?auto_41729 ) ) ( not ( = ?auto_41727 ?auto_41729 ) ) ( not ( = ?auto_41741 ?auto_41729 ) ) ( not ( = ?auto_41732 ?auto_41733 ) ) ( not ( = ?auto_41731 ?auto_41732 ) ) ( not ( = ?auto_41746 ?auto_41732 ) ) ( not ( = ?auto_41730 ?auto_41732 ) ) ( HOIST-AT ?auto_41736 ?auto_41732 ) ( not ( = ?auto_41726 ?auto_41736 ) ) ( not ( = ?auto_41725 ?auto_41736 ) ) ( not ( = ?auto_41737 ?auto_41736 ) ) ( not ( = ?auto_41739 ?auto_41736 ) ) ( AVAILABLE ?auto_41736 ) ( SURFACE-AT ?auto_41727 ?auto_41732 ) ( ON ?auto_41727 ?auto_41743 ) ( CLEAR ?auto_41727 ) ( not ( = ?auto_41722 ?auto_41743 ) ) ( not ( = ?auto_41723 ?auto_41743 ) ) ( not ( = ?auto_41738 ?auto_41743 ) ) ( not ( = ?auto_41745 ?auto_41743 ) ) ( not ( = ?auto_41728 ?auto_41743 ) ) ( not ( = ?auto_41727 ?auto_41743 ) ) ( not ( = ?auto_41741 ?auto_41743 ) ) ( not ( = ?auto_41729 ?auto_41743 ) ) ( IS-CRATE ?auto_41729 ) ( not ( = ?auto_41722 ?auto_41734 ) ) ( not ( = ?auto_41723 ?auto_41734 ) ) ( not ( = ?auto_41738 ?auto_41734 ) ) ( not ( = ?auto_41745 ?auto_41734 ) ) ( not ( = ?auto_41728 ?auto_41734 ) ) ( not ( = ?auto_41727 ?auto_41734 ) ) ( not ( = ?auto_41741 ?auto_41734 ) ) ( not ( = ?auto_41729 ?auto_41734 ) ) ( not ( = ?auto_41743 ?auto_41734 ) ) ( AVAILABLE ?auto_41725 ) ( SURFACE-AT ?auto_41729 ?auto_41731 ) ( ON ?auto_41729 ?auto_41735 ) ( CLEAR ?auto_41729 ) ( not ( = ?auto_41722 ?auto_41735 ) ) ( not ( = ?auto_41723 ?auto_41735 ) ) ( not ( = ?auto_41738 ?auto_41735 ) ) ( not ( = ?auto_41745 ?auto_41735 ) ) ( not ( = ?auto_41728 ?auto_41735 ) ) ( not ( = ?auto_41727 ?auto_41735 ) ) ( not ( = ?auto_41741 ?auto_41735 ) ) ( not ( = ?auto_41729 ?auto_41735 ) ) ( not ( = ?auto_41743 ?auto_41735 ) ) ( not ( = ?auto_41734 ?auto_41735 ) ) ( IS-CRATE ?auto_41734 ) ( not ( = ?auto_41722 ?auto_41747 ) ) ( not ( = ?auto_41723 ?auto_41747 ) ) ( not ( = ?auto_41738 ?auto_41747 ) ) ( not ( = ?auto_41745 ?auto_41747 ) ) ( not ( = ?auto_41728 ?auto_41747 ) ) ( not ( = ?auto_41727 ?auto_41747 ) ) ( not ( = ?auto_41741 ?auto_41747 ) ) ( not ( = ?auto_41729 ?auto_41747 ) ) ( not ( = ?auto_41743 ?auto_41747 ) ) ( not ( = ?auto_41734 ?auto_41747 ) ) ( not ( = ?auto_41735 ?auto_41747 ) ) ( not ( = ?auto_41724 ?auto_41733 ) ) ( not ( = ?auto_41731 ?auto_41724 ) ) ( not ( = ?auto_41746 ?auto_41724 ) ) ( not ( = ?auto_41730 ?auto_41724 ) ) ( not ( = ?auto_41732 ?auto_41724 ) ) ( HOIST-AT ?auto_41744 ?auto_41724 ) ( not ( = ?auto_41726 ?auto_41744 ) ) ( not ( = ?auto_41725 ?auto_41744 ) ) ( not ( = ?auto_41737 ?auto_41744 ) ) ( not ( = ?auto_41739 ?auto_41744 ) ) ( not ( = ?auto_41736 ?auto_41744 ) ) ( AVAILABLE ?auto_41744 ) ( SURFACE-AT ?auto_41734 ?auto_41724 ) ( ON ?auto_41734 ?auto_41740 ) ( CLEAR ?auto_41734 ) ( not ( = ?auto_41722 ?auto_41740 ) ) ( not ( = ?auto_41723 ?auto_41740 ) ) ( not ( = ?auto_41738 ?auto_41740 ) ) ( not ( = ?auto_41745 ?auto_41740 ) ) ( not ( = ?auto_41728 ?auto_41740 ) ) ( not ( = ?auto_41727 ?auto_41740 ) ) ( not ( = ?auto_41741 ?auto_41740 ) ) ( not ( = ?auto_41729 ?auto_41740 ) ) ( not ( = ?auto_41743 ?auto_41740 ) ) ( not ( = ?auto_41734 ?auto_41740 ) ) ( not ( = ?auto_41735 ?auto_41740 ) ) ( not ( = ?auto_41747 ?auto_41740 ) ) ( TRUCK-AT ?auto_41742 ?auto_41733 ) ( SURFACE-AT ?auto_41748 ?auto_41733 ) ( CLEAR ?auto_41748 ) ( IS-CRATE ?auto_41747 ) ( not ( = ?auto_41722 ?auto_41748 ) ) ( not ( = ?auto_41723 ?auto_41748 ) ) ( not ( = ?auto_41738 ?auto_41748 ) ) ( not ( = ?auto_41745 ?auto_41748 ) ) ( not ( = ?auto_41728 ?auto_41748 ) ) ( not ( = ?auto_41727 ?auto_41748 ) ) ( not ( = ?auto_41741 ?auto_41748 ) ) ( not ( = ?auto_41729 ?auto_41748 ) ) ( not ( = ?auto_41743 ?auto_41748 ) ) ( not ( = ?auto_41734 ?auto_41748 ) ) ( not ( = ?auto_41735 ?auto_41748 ) ) ( not ( = ?auto_41747 ?auto_41748 ) ) ( not ( = ?auto_41740 ?auto_41748 ) ) ( AVAILABLE ?auto_41726 ) ( IN ?auto_41747 ?auto_41742 ) )
    :subtasks
    ( ( !UNLOAD ?auto_41726 ?auto_41747 ?auto_41742 ?auto_41733 )
      ( MAKE-ON ?auto_41722 ?auto_41723 )
      ( MAKE-ON-VERIFY ?auto_41722 ?auto_41723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41749 - SURFACE
      ?auto_41750 - SURFACE
    )
    :vars
    (
      ?auto_41775 - HOIST
      ?auto_41755 - PLACE
      ?auto_41757 - PLACE
      ?auto_41770 - HOIST
      ?auto_41753 - SURFACE
      ?auto_41762 - SURFACE
      ?auto_41763 - PLACE
      ?auto_41771 - HOIST
      ?auto_41765 - SURFACE
      ?auto_41767 - SURFACE
      ?auto_41773 - PLACE
      ?auto_41764 - HOIST
      ?auto_41758 - SURFACE
      ?auto_41756 - SURFACE
      ?auto_41766 - PLACE
      ?auto_41754 - HOIST
      ?auto_41760 - SURFACE
      ?auto_41772 - SURFACE
      ?auto_41774 - SURFACE
      ?auto_41768 - SURFACE
      ?auto_41752 - PLACE
      ?auto_41761 - HOIST
      ?auto_41769 - SURFACE
      ?auto_41751 - SURFACE
      ?auto_41759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41775 ?auto_41755 ) ( IS-CRATE ?auto_41749 ) ( not ( = ?auto_41749 ?auto_41750 ) ) ( not ( = ?auto_41757 ?auto_41755 ) ) ( HOIST-AT ?auto_41770 ?auto_41757 ) ( not ( = ?auto_41775 ?auto_41770 ) ) ( SURFACE-AT ?auto_41749 ?auto_41757 ) ( ON ?auto_41749 ?auto_41753 ) ( CLEAR ?auto_41749 ) ( not ( = ?auto_41749 ?auto_41753 ) ) ( not ( = ?auto_41750 ?auto_41753 ) ) ( IS-CRATE ?auto_41750 ) ( not ( = ?auto_41749 ?auto_41762 ) ) ( not ( = ?auto_41750 ?auto_41762 ) ) ( not ( = ?auto_41753 ?auto_41762 ) ) ( not ( = ?auto_41763 ?auto_41755 ) ) ( not ( = ?auto_41757 ?auto_41763 ) ) ( HOIST-AT ?auto_41771 ?auto_41763 ) ( not ( = ?auto_41775 ?auto_41771 ) ) ( not ( = ?auto_41770 ?auto_41771 ) ) ( AVAILABLE ?auto_41771 ) ( SURFACE-AT ?auto_41750 ?auto_41763 ) ( ON ?auto_41750 ?auto_41765 ) ( CLEAR ?auto_41750 ) ( not ( = ?auto_41749 ?auto_41765 ) ) ( not ( = ?auto_41750 ?auto_41765 ) ) ( not ( = ?auto_41753 ?auto_41765 ) ) ( not ( = ?auto_41762 ?auto_41765 ) ) ( IS-CRATE ?auto_41762 ) ( not ( = ?auto_41749 ?auto_41767 ) ) ( not ( = ?auto_41750 ?auto_41767 ) ) ( not ( = ?auto_41753 ?auto_41767 ) ) ( not ( = ?auto_41762 ?auto_41767 ) ) ( not ( = ?auto_41765 ?auto_41767 ) ) ( not ( = ?auto_41773 ?auto_41755 ) ) ( not ( = ?auto_41757 ?auto_41773 ) ) ( not ( = ?auto_41763 ?auto_41773 ) ) ( HOIST-AT ?auto_41764 ?auto_41773 ) ( not ( = ?auto_41775 ?auto_41764 ) ) ( not ( = ?auto_41770 ?auto_41764 ) ) ( not ( = ?auto_41771 ?auto_41764 ) ) ( AVAILABLE ?auto_41764 ) ( SURFACE-AT ?auto_41762 ?auto_41773 ) ( ON ?auto_41762 ?auto_41758 ) ( CLEAR ?auto_41762 ) ( not ( = ?auto_41749 ?auto_41758 ) ) ( not ( = ?auto_41750 ?auto_41758 ) ) ( not ( = ?auto_41753 ?auto_41758 ) ) ( not ( = ?auto_41762 ?auto_41758 ) ) ( not ( = ?auto_41765 ?auto_41758 ) ) ( not ( = ?auto_41767 ?auto_41758 ) ) ( IS-CRATE ?auto_41767 ) ( not ( = ?auto_41749 ?auto_41756 ) ) ( not ( = ?auto_41750 ?auto_41756 ) ) ( not ( = ?auto_41753 ?auto_41756 ) ) ( not ( = ?auto_41762 ?auto_41756 ) ) ( not ( = ?auto_41765 ?auto_41756 ) ) ( not ( = ?auto_41767 ?auto_41756 ) ) ( not ( = ?auto_41758 ?auto_41756 ) ) ( not ( = ?auto_41766 ?auto_41755 ) ) ( not ( = ?auto_41757 ?auto_41766 ) ) ( not ( = ?auto_41763 ?auto_41766 ) ) ( not ( = ?auto_41773 ?auto_41766 ) ) ( HOIST-AT ?auto_41754 ?auto_41766 ) ( not ( = ?auto_41775 ?auto_41754 ) ) ( not ( = ?auto_41770 ?auto_41754 ) ) ( not ( = ?auto_41771 ?auto_41754 ) ) ( not ( = ?auto_41764 ?auto_41754 ) ) ( AVAILABLE ?auto_41754 ) ( SURFACE-AT ?auto_41767 ?auto_41766 ) ( ON ?auto_41767 ?auto_41760 ) ( CLEAR ?auto_41767 ) ( not ( = ?auto_41749 ?auto_41760 ) ) ( not ( = ?auto_41750 ?auto_41760 ) ) ( not ( = ?auto_41753 ?auto_41760 ) ) ( not ( = ?auto_41762 ?auto_41760 ) ) ( not ( = ?auto_41765 ?auto_41760 ) ) ( not ( = ?auto_41767 ?auto_41760 ) ) ( not ( = ?auto_41758 ?auto_41760 ) ) ( not ( = ?auto_41756 ?auto_41760 ) ) ( IS-CRATE ?auto_41756 ) ( not ( = ?auto_41749 ?auto_41772 ) ) ( not ( = ?auto_41750 ?auto_41772 ) ) ( not ( = ?auto_41753 ?auto_41772 ) ) ( not ( = ?auto_41762 ?auto_41772 ) ) ( not ( = ?auto_41765 ?auto_41772 ) ) ( not ( = ?auto_41767 ?auto_41772 ) ) ( not ( = ?auto_41758 ?auto_41772 ) ) ( not ( = ?auto_41756 ?auto_41772 ) ) ( not ( = ?auto_41760 ?auto_41772 ) ) ( AVAILABLE ?auto_41770 ) ( SURFACE-AT ?auto_41756 ?auto_41757 ) ( ON ?auto_41756 ?auto_41774 ) ( CLEAR ?auto_41756 ) ( not ( = ?auto_41749 ?auto_41774 ) ) ( not ( = ?auto_41750 ?auto_41774 ) ) ( not ( = ?auto_41753 ?auto_41774 ) ) ( not ( = ?auto_41762 ?auto_41774 ) ) ( not ( = ?auto_41765 ?auto_41774 ) ) ( not ( = ?auto_41767 ?auto_41774 ) ) ( not ( = ?auto_41758 ?auto_41774 ) ) ( not ( = ?auto_41756 ?auto_41774 ) ) ( not ( = ?auto_41760 ?auto_41774 ) ) ( not ( = ?auto_41772 ?auto_41774 ) ) ( IS-CRATE ?auto_41772 ) ( not ( = ?auto_41749 ?auto_41768 ) ) ( not ( = ?auto_41750 ?auto_41768 ) ) ( not ( = ?auto_41753 ?auto_41768 ) ) ( not ( = ?auto_41762 ?auto_41768 ) ) ( not ( = ?auto_41765 ?auto_41768 ) ) ( not ( = ?auto_41767 ?auto_41768 ) ) ( not ( = ?auto_41758 ?auto_41768 ) ) ( not ( = ?auto_41756 ?auto_41768 ) ) ( not ( = ?auto_41760 ?auto_41768 ) ) ( not ( = ?auto_41772 ?auto_41768 ) ) ( not ( = ?auto_41774 ?auto_41768 ) ) ( not ( = ?auto_41752 ?auto_41755 ) ) ( not ( = ?auto_41757 ?auto_41752 ) ) ( not ( = ?auto_41763 ?auto_41752 ) ) ( not ( = ?auto_41773 ?auto_41752 ) ) ( not ( = ?auto_41766 ?auto_41752 ) ) ( HOIST-AT ?auto_41761 ?auto_41752 ) ( not ( = ?auto_41775 ?auto_41761 ) ) ( not ( = ?auto_41770 ?auto_41761 ) ) ( not ( = ?auto_41771 ?auto_41761 ) ) ( not ( = ?auto_41764 ?auto_41761 ) ) ( not ( = ?auto_41754 ?auto_41761 ) ) ( AVAILABLE ?auto_41761 ) ( SURFACE-AT ?auto_41772 ?auto_41752 ) ( ON ?auto_41772 ?auto_41769 ) ( CLEAR ?auto_41772 ) ( not ( = ?auto_41749 ?auto_41769 ) ) ( not ( = ?auto_41750 ?auto_41769 ) ) ( not ( = ?auto_41753 ?auto_41769 ) ) ( not ( = ?auto_41762 ?auto_41769 ) ) ( not ( = ?auto_41765 ?auto_41769 ) ) ( not ( = ?auto_41767 ?auto_41769 ) ) ( not ( = ?auto_41758 ?auto_41769 ) ) ( not ( = ?auto_41756 ?auto_41769 ) ) ( not ( = ?auto_41760 ?auto_41769 ) ) ( not ( = ?auto_41772 ?auto_41769 ) ) ( not ( = ?auto_41774 ?auto_41769 ) ) ( not ( = ?auto_41768 ?auto_41769 ) ) ( SURFACE-AT ?auto_41751 ?auto_41755 ) ( CLEAR ?auto_41751 ) ( IS-CRATE ?auto_41768 ) ( not ( = ?auto_41749 ?auto_41751 ) ) ( not ( = ?auto_41750 ?auto_41751 ) ) ( not ( = ?auto_41753 ?auto_41751 ) ) ( not ( = ?auto_41762 ?auto_41751 ) ) ( not ( = ?auto_41765 ?auto_41751 ) ) ( not ( = ?auto_41767 ?auto_41751 ) ) ( not ( = ?auto_41758 ?auto_41751 ) ) ( not ( = ?auto_41756 ?auto_41751 ) ) ( not ( = ?auto_41760 ?auto_41751 ) ) ( not ( = ?auto_41772 ?auto_41751 ) ) ( not ( = ?auto_41774 ?auto_41751 ) ) ( not ( = ?auto_41768 ?auto_41751 ) ) ( not ( = ?auto_41769 ?auto_41751 ) ) ( AVAILABLE ?auto_41775 ) ( IN ?auto_41768 ?auto_41759 ) ( TRUCK-AT ?auto_41759 ?auto_41757 ) )
    :subtasks
    ( ( !DRIVE ?auto_41759 ?auto_41757 ?auto_41755 )
      ( MAKE-ON ?auto_41749 ?auto_41750 )
      ( MAKE-ON-VERIFY ?auto_41749 ?auto_41750 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41776 - SURFACE
      ?auto_41777 - SURFACE
    )
    :vars
    (
      ?auto_41799 - HOIST
      ?auto_41798 - PLACE
      ?auto_41785 - PLACE
      ?auto_41783 - HOIST
      ?auto_41781 - SURFACE
      ?auto_41789 - SURFACE
      ?auto_41788 - PLACE
      ?auto_41786 - HOIST
      ?auto_41784 - SURFACE
      ?auto_41801 - SURFACE
      ?auto_41780 - PLACE
      ?auto_41796 - HOIST
      ?auto_41793 - SURFACE
      ?auto_41792 - SURFACE
      ?auto_41791 - PLACE
      ?auto_41787 - HOIST
      ?auto_41795 - SURFACE
      ?auto_41779 - SURFACE
      ?auto_41800 - SURFACE
      ?auto_41802 - SURFACE
      ?auto_41794 - PLACE
      ?auto_41797 - HOIST
      ?auto_41778 - SURFACE
      ?auto_41782 - SURFACE
      ?auto_41790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41799 ?auto_41798 ) ( IS-CRATE ?auto_41776 ) ( not ( = ?auto_41776 ?auto_41777 ) ) ( not ( = ?auto_41785 ?auto_41798 ) ) ( HOIST-AT ?auto_41783 ?auto_41785 ) ( not ( = ?auto_41799 ?auto_41783 ) ) ( SURFACE-AT ?auto_41776 ?auto_41785 ) ( ON ?auto_41776 ?auto_41781 ) ( CLEAR ?auto_41776 ) ( not ( = ?auto_41776 ?auto_41781 ) ) ( not ( = ?auto_41777 ?auto_41781 ) ) ( IS-CRATE ?auto_41777 ) ( not ( = ?auto_41776 ?auto_41789 ) ) ( not ( = ?auto_41777 ?auto_41789 ) ) ( not ( = ?auto_41781 ?auto_41789 ) ) ( not ( = ?auto_41788 ?auto_41798 ) ) ( not ( = ?auto_41785 ?auto_41788 ) ) ( HOIST-AT ?auto_41786 ?auto_41788 ) ( not ( = ?auto_41799 ?auto_41786 ) ) ( not ( = ?auto_41783 ?auto_41786 ) ) ( AVAILABLE ?auto_41786 ) ( SURFACE-AT ?auto_41777 ?auto_41788 ) ( ON ?auto_41777 ?auto_41784 ) ( CLEAR ?auto_41777 ) ( not ( = ?auto_41776 ?auto_41784 ) ) ( not ( = ?auto_41777 ?auto_41784 ) ) ( not ( = ?auto_41781 ?auto_41784 ) ) ( not ( = ?auto_41789 ?auto_41784 ) ) ( IS-CRATE ?auto_41789 ) ( not ( = ?auto_41776 ?auto_41801 ) ) ( not ( = ?auto_41777 ?auto_41801 ) ) ( not ( = ?auto_41781 ?auto_41801 ) ) ( not ( = ?auto_41789 ?auto_41801 ) ) ( not ( = ?auto_41784 ?auto_41801 ) ) ( not ( = ?auto_41780 ?auto_41798 ) ) ( not ( = ?auto_41785 ?auto_41780 ) ) ( not ( = ?auto_41788 ?auto_41780 ) ) ( HOIST-AT ?auto_41796 ?auto_41780 ) ( not ( = ?auto_41799 ?auto_41796 ) ) ( not ( = ?auto_41783 ?auto_41796 ) ) ( not ( = ?auto_41786 ?auto_41796 ) ) ( AVAILABLE ?auto_41796 ) ( SURFACE-AT ?auto_41789 ?auto_41780 ) ( ON ?auto_41789 ?auto_41793 ) ( CLEAR ?auto_41789 ) ( not ( = ?auto_41776 ?auto_41793 ) ) ( not ( = ?auto_41777 ?auto_41793 ) ) ( not ( = ?auto_41781 ?auto_41793 ) ) ( not ( = ?auto_41789 ?auto_41793 ) ) ( not ( = ?auto_41784 ?auto_41793 ) ) ( not ( = ?auto_41801 ?auto_41793 ) ) ( IS-CRATE ?auto_41801 ) ( not ( = ?auto_41776 ?auto_41792 ) ) ( not ( = ?auto_41777 ?auto_41792 ) ) ( not ( = ?auto_41781 ?auto_41792 ) ) ( not ( = ?auto_41789 ?auto_41792 ) ) ( not ( = ?auto_41784 ?auto_41792 ) ) ( not ( = ?auto_41801 ?auto_41792 ) ) ( not ( = ?auto_41793 ?auto_41792 ) ) ( not ( = ?auto_41791 ?auto_41798 ) ) ( not ( = ?auto_41785 ?auto_41791 ) ) ( not ( = ?auto_41788 ?auto_41791 ) ) ( not ( = ?auto_41780 ?auto_41791 ) ) ( HOIST-AT ?auto_41787 ?auto_41791 ) ( not ( = ?auto_41799 ?auto_41787 ) ) ( not ( = ?auto_41783 ?auto_41787 ) ) ( not ( = ?auto_41786 ?auto_41787 ) ) ( not ( = ?auto_41796 ?auto_41787 ) ) ( AVAILABLE ?auto_41787 ) ( SURFACE-AT ?auto_41801 ?auto_41791 ) ( ON ?auto_41801 ?auto_41795 ) ( CLEAR ?auto_41801 ) ( not ( = ?auto_41776 ?auto_41795 ) ) ( not ( = ?auto_41777 ?auto_41795 ) ) ( not ( = ?auto_41781 ?auto_41795 ) ) ( not ( = ?auto_41789 ?auto_41795 ) ) ( not ( = ?auto_41784 ?auto_41795 ) ) ( not ( = ?auto_41801 ?auto_41795 ) ) ( not ( = ?auto_41793 ?auto_41795 ) ) ( not ( = ?auto_41792 ?auto_41795 ) ) ( IS-CRATE ?auto_41792 ) ( not ( = ?auto_41776 ?auto_41779 ) ) ( not ( = ?auto_41777 ?auto_41779 ) ) ( not ( = ?auto_41781 ?auto_41779 ) ) ( not ( = ?auto_41789 ?auto_41779 ) ) ( not ( = ?auto_41784 ?auto_41779 ) ) ( not ( = ?auto_41801 ?auto_41779 ) ) ( not ( = ?auto_41793 ?auto_41779 ) ) ( not ( = ?auto_41792 ?auto_41779 ) ) ( not ( = ?auto_41795 ?auto_41779 ) ) ( SURFACE-AT ?auto_41792 ?auto_41785 ) ( ON ?auto_41792 ?auto_41800 ) ( CLEAR ?auto_41792 ) ( not ( = ?auto_41776 ?auto_41800 ) ) ( not ( = ?auto_41777 ?auto_41800 ) ) ( not ( = ?auto_41781 ?auto_41800 ) ) ( not ( = ?auto_41789 ?auto_41800 ) ) ( not ( = ?auto_41784 ?auto_41800 ) ) ( not ( = ?auto_41801 ?auto_41800 ) ) ( not ( = ?auto_41793 ?auto_41800 ) ) ( not ( = ?auto_41792 ?auto_41800 ) ) ( not ( = ?auto_41795 ?auto_41800 ) ) ( not ( = ?auto_41779 ?auto_41800 ) ) ( IS-CRATE ?auto_41779 ) ( not ( = ?auto_41776 ?auto_41802 ) ) ( not ( = ?auto_41777 ?auto_41802 ) ) ( not ( = ?auto_41781 ?auto_41802 ) ) ( not ( = ?auto_41789 ?auto_41802 ) ) ( not ( = ?auto_41784 ?auto_41802 ) ) ( not ( = ?auto_41801 ?auto_41802 ) ) ( not ( = ?auto_41793 ?auto_41802 ) ) ( not ( = ?auto_41792 ?auto_41802 ) ) ( not ( = ?auto_41795 ?auto_41802 ) ) ( not ( = ?auto_41779 ?auto_41802 ) ) ( not ( = ?auto_41800 ?auto_41802 ) ) ( not ( = ?auto_41794 ?auto_41798 ) ) ( not ( = ?auto_41785 ?auto_41794 ) ) ( not ( = ?auto_41788 ?auto_41794 ) ) ( not ( = ?auto_41780 ?auto_41794 ) ) ( not ( = ?auto_41791 ?auto_41794 ) ) ( HOIST-AT ?auto_41797 ?auto_41794 ) ( not ( = ?auto_41799 ?auto_41797 ) ) ( not ( = ?auto_41783 ?auto_41797 ) ) ( not ( = ?auto_41786 ?auto_41797 ) ) ( not ( = ?auto_41796 ?auto_41797 ) ) ( not ( = ?auto_41787 ?auto_41797 ) ) ( AVAILABLE ?auto_41797 ) ( SURFACE-AT ?auto_41779 ?auto_41794 ) ( ON ?auto_41779 ?auto_41778 ) ( CLEAR ?auto_41779 ) ( not ( = ?auto_41776 ?auto_41778 ) ) ( not ( = ?auto_41777 ?auto_41778 ) ) ( not ( = ?auto_41781 ?auto_41778 ) ) ( not ( = ?auto_41789 ?auto_41778 ) ) ( not ( = ?auto_41784 ?auto_41778 ) ) ( not ( = ?auto_41801 ?auto_41778 ) ) ( not ( = ?auto_41793 ?auto_41778 ) ) ( not ( = ?auto_41792 ?auto_41778 ) ) ( not ( = ?auto_41795 ?auto_41778 ) ) ( not ( = ?auto_41779 ?auto_41778 ) ) ( not ( = ?auto_41800 ?auto_41778 ) ) ( not ( = ?auto_41802 ?auto_41778 ) ) ( SURFACE-AT ?auto_41782 ?auto_41798 ) ( CLEAR ?auto_41782 ) ( IS-CRATE ?auto_41802 ) ( not ( = ?auto_41776 ?auto_41782 ) ) ( not ( = ?auto_41777 ?auto_41782 ) ) ( not ( = ?auto_41781 ?auto_41782 ) ) ( not ( = ?auto_41789 ?auto_41782 ) ) ( not ( = ?auto_41784 ?auto_41782 ) ) ( not ( = ?auto_41801 ?auto_41782 ) ) ( not ( = ?auto_41793 ?auto_41782 ) ) ( not ( = ?auto_41792 ?auto_41782 ) ) ( not ( = ?auto_41795 ?auto_41782 ) ) ( not ( = ?auto_41779 ?auto_41782 ) ) ( not ( = ?auto_41800 ?auto_41782 ) ) ( not ( = ?auto_41802 ?auto_41782 ) ) ( not ( = ?auto_41778 ?auto_41782 ) ) ( AVAILABLE ?auto_41799 ) ( TRUCK-AT ?auto_41790 ?auto_41785 ) ( LIFTING ?auto_41783 ?auto_41802 ) )
    :subtasks
    ( ( !LOAD ?auto_41783 ?auto_41802 ?auto_41790 ?auto_41785 )
      ( MAKE-ON ?auto_41776 ?auto_41777 )
      ( MAKE-ON-VERIFY ?auto_41776 ?auto_41777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41803 - SURFACE
      ?auto_41804 - SURFACE
    )
    :vars
    (
      ?auto_41814 - HOIST
      ?auto_41813 - PLACE
      ?auto_41827 - PLACE
      ?auto_41819 - HOIST
      ?auto_41824 - SURFACE
      ?auto_41821 - SURFACE
      ?auto_41818 - PLACE
      ?auto_41805 - HOIST
      ?auto_41807 - SURFACE
      ?auto_41808 - SURFACE
      ?auto_41829 - PLACE
      ?auto_41811 - HOIST
      ?auto_41816 - SURFACE
      ?auto_41817 - SURFACE
      ?auto_41823 - PLACE
      ?auto_41826 - HOIST
      ?auto_41810 - SURFACE
      ?auto_41820 - SURFACE
      ?auto_41815 - SURFACE
      ?auto_41806 - SURFACE
      ?auto_41809 - PLACE
      ?auto_41812 - HOIST
      ?auto_41828 - SURFACE
      ?auto_41822 - SURFACE
      ?auto_41825 - TRUCK
      ?auto_41830 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41814 ?auto_41813 ) ( IS-CRATE ?auto_41803 ) ( not ( = ?auto_41803 ?auto_41804 ) ) ( not ( = ?auto_41827 ?auto_41813 ) ) ( HOIST-AT ?auto_41819 ?auto_41827 ) ( not ( = ?auto_41814 ?auto_41819 ) ) ( SURFACE-AT ?auto_41803 ?auto_41827 ) ( ON ?auto_41803 ?auto_41824 ) ( CLEAR ?auto_41803 ) ( not ( = ?auto_41803 ?auto_41824 ) ) ( not ( = ?auto_41804 ?auto_41824 ) ) ( IS-CRATE ?auto_41804 ) ( not ( = ?auto_41803 ?auto_41821 ) ) ( not ( = ?auto_41804 ?auto_41821 ) ) ( not ( = ?auto_41824 ?auto_41821 ) ) ( not ( = ?auto_41818 ?auto_41813 ) ) ( not ( = ?auto_41827 ?auto_41818 ) ) ( HOIST-AT ?auto_41805 ?auto_41818 ) ( not ( = ?auto_41814 ?auto_41805 ) ) ( not ( = ?auto_41819 ?auto_41805 ) ) ( AVAILABLE ?auto_41805 ) ( SURFACE-AT ?auto_41804 ?auto_41818 ) ( ON ?auto_41804 ?auto_41807 ) ( CLEAR ?auto_41804 ) ( not ( = ?auto_41803 ?auto_41807 ) ) ( not ( = ?auto_41804 ?auto_41807 ) ) ( not ( = ?auto_41824 ?auto_41807 ) ) ( not ( = ?auto_41821 ?auto_41807 ) ) ( IS-CRATE ?auto_41821 ) ( not ( = ?auto_41803 ?auto_41808 ) ) ( not ( = ?auto_41804 ?auto_41808 ) ) ( not ( = ?auto_41824 ?auto_41808 ) ) ( not ( = ?auto_41821 ?auto_41808 ) ) ( not ( = ?auto_41807 ?auto_41808 ) ) ( not ( = ?auto_41829 ?auto_41813 ) ) ( not ( = ?auto_41827 ?auto_41829 ) ) ( not ( = ?auto_41818 ?auto_41829 ) ) ( HOIST-AT ?auto_41811 ?auto_41829 ) ( not ( = ?auto_41814 ?auto_41811 ) ) ( not ( = ?auto_41819 ?auto_41811 ) ) ( not ( = ?auto_41805 ?auto_41811 ) ) ( AVAILABLE ?auto_41811 ) ( SURFACE-AT ?auto_41821 ?auto_41829 ) ( ON ?auto_41821 ?auto_41816 ) ( CLEAR ?auto_41821 ) ( not ( = ?auto_41803 ?auto_41816 ) ) ( not ( = ?auto_41804 ?auto_41816 ) ) ( not ( = ?auto_41824 ?auto_41816 ) ) ( not ( = ?auto_41821 ?auto_41816 ) ) ( not ( = ?auto_41807 ?auto_41816 ) ) ( not ( = ?auto_41808 ?auto_41816 ) ) ( IS-CRATE ?auto_41808 ) ( not ( = ?auto_41803 ?auto_41817 ) ) ( not ( = ?auto_41804 ?auto_41817 ) ) ( not ( = ?auto_41824 ?auto_41817 ) ) ( not ( = ?auto_41821 ?auto_41817 ) ) ( not ( = ?auto_41807 ?auto_41817 ) ) ( not ( = ?auto_41808 ?auto_41817 ) ) ( not ( = ?auto_41816 ?auto_41817 ) ) ( not ( = ?auto_41823 ?auto_41813 ) ) ( not ( = ?auto_41827 ?auto_41823 ) ) ( not ( = ?auto_41818 ?auto_41823 ) ) ( not ( = ?auto_41829 ?auto_41823 ) ) ( HOIST-AT ?auto_41826 ?auto_41823 ) ( not ( = ?auto_41814 ?auto_41826 ) ) ( not ( = ?auto_41819 ?auto_41826 ) ) ( not ( = ?auto_41805 ?auto_41826 ) ) ( not ( = ?auto_41811 ?auto_41826 ) ) ( AVAILABLE ?auto_41826 ) ( SURFACE-AT ?auto_41808 ?auto_41823 ) ( ON ?auto_41808 ?auto_41810 ) ( CLEAR ?auto_41808 ) ( not ( = ?auto_41803 ?auto_41810 ) ) ( not ( = ?auto_41804 ?auto_41810 ) ) ( not ( = ?auto_41824 ?auto_41810 ) ) ( not ( = ?auto_41821 ?auto_41810 ) ) ( not ( = ?auto_41807 ?auto_41810 ) ) ( not ( = ?auto_41808 ?auto_41810 ) ) ( not ( = ?auto_41816 ?auto_41810 ) ) ( not ( = ?auto_41817 ?auto_41810 ) ) ( IS-CRATE ?auto_41817 ) ( not ( = ?auto_41803 ?auto_41820 ) ) ( not ( = ?auto_41804 ?auto_41820 ) ) ( not ( = ?auto_41824 ?auto_41820 ) ) ( not ( = ?auto_41821 ?auto_41820 ) ) ( not ( = ?auto_41807 ?auto_41820 ) ) ( not ( = ?auto_41808 ?auto_41820 ) ) ( not ( = ?auto_41816 ?auto_41820 ) ) ( not ( = ?auto_41817 ?auto_41820 ) ) ( not ( = ?auto_41810 ?auto_41820 ) ) ( SURFACE-AT ?auto_41817 ?auto_41827 ) ( ON ?auto_41817 ?auto_41815 ) ( CLEAR ?auto_41817 ) ( not ( = ?auto_41803 ?auto_41815 ) ) ( not ( = ?auto_41804 ?auto_41815 ) ) ( not ( = ?auto_41824 ?auto_41815 ) ) ( not ( = ?auto_41821 ?auto_41815 ) ) ( not ( = ?auto_41807 ?auto_41815 ) ) ( not ( = ?auto_41808 ?auto_41815 ) ) ( not ( = ?auto_41816 ?auto_41815 ) ) ( not ( = ?auto_41817 ?auto_41815 ) ) ( not ( = ?auto_41810 ?auto_41815 ) ) ( not ( = ?auto_41820 ?auto_41815 ) ) ( IS-CRATE ?auto_41820 ) ( not ( = ?auto_41803 ?auto_41806 ) ) ( not ( = ?auto_41804 ?auto_41806 ) ) ( not ( = ?auto_41824 ?auto_41806 ) ) ( not ( = ?auto_41821 ?auto_41806 ) ) ( not ( = ?auto_41807 ?auto_41806 ) ) ( not ( = ?auto_41808 ?auto_41806 ) ) ( not ( = ?auto_41816 ?auto_41806 ) ) ( not ( = ?auto_41817 ?auto_41806 ) ) ( not ( = ?auto_41810 ?auto_41806 ) ) ( not ( = ?auto_41820 ?auto_41806 ) ) ( not ( = ?auto_41815 ?auto_41806 ) ) ( not ( = ?auto_41809 ?auto_41813 ) ) ( not ( = ?auto_41827 ?auto_41809 ) ) ( not ( = ?auto_41818 ?auto_41809 ) ) ( not ( = ?auto_41829 ?auto_41809 ) ) ( not ( = ?auto_41823 ?auto_41809 ) ) ( HOIST-AT ?auto_41812 ?auto_41809 ) ( not ( = ?auto_41814 ?auto_41812 ) ) ( not ( = ?auto_41819 ?auto_41812 ) ) ( not ( = ?auto_41805 ?auto_41812 ) ) ( not ( = ?auto_41811 ?auto_41812 ) ) ( not ( = ?auto_41826 ?auto_41812 ) ) ( AVAILABLE ?auto_41812 ) ( SURFACE-AT ?auto_41820 ?auto_41809 ) ( ON ?auto_41820 ?auto_41828 ) ( CLEAR ?auto_41820 ) ( not ( = ?auto_41803 ?auto_41828 ) ) ( not ( = ?auto_41804 ?auto_41828 ) ) ( not ( = ?auto_41824 ?auto_41828 ) ) ( not ( = ?auto_41821 ?auto_41828 ) ) ( not ( = ?auto_41807 ?auto_41828 ) ) ( not ( = ?auto_41808 ?auto_41828 ) ) ( not ( = ?auto_41816 ?auto_41828 ) ) ( not ( = ?auto_41817 ?auto_41828 ) ) ( not ( = ?auto_41810 ?auto_41828 ) ) ( not ( = ?auto_41820 ?auto_41828 ) ) ( not ( = ?auto_41815 ?auto_41828 ) ) ( not ( = ?auto_41806 ?auto_41828 ) ) ( SURFACE-AT ?auto_41822 ?auto_41813 ) ( CLEAR ?auto_41822 ) ( IS-CRATE ?auto_41806 ) ( not ( = ?auto_41803 ?auto_41822 ) ) ( not ( = ?auto_41804 ?auto_41822 ) ) ( not ( = ?auto_41824 ?auto_41822 ) ) ( not ( = ?auto_41821 ?auto_41822 ) ) ( not ( = ?auto_41807 ?auto_41822 ) ) ( not ( = ?auto_41808 ?auto_41822 ) ) ( not ( = ?auto_41816 ?auto_41822 ) ) ( not ( = ?auto_41817 ?auto_41822 ) ) ( not ( = ?auto_41810 ?auto_41822 ) ) ( not ( = ?auto_41820 ?auto_41822 ) ) ( not ( = ?auto_41815 ?auto_41822 ) ) ( not ( = ?auto_41806 ?auto_41822 ) ) ( not ( = ?auto_41828 ?auto_41822 ) ) ( AVAILABLE ?auto_41814 ) ( TRUCK-AT ?auto_41825 ?auto_41827 ) ( AVAILABLE ?auto_41819 ) ( SURFACE-AT ?auto_41806 ?auto_41827 ) ( ON ?auto_41806 ?auto_41830 ) ( CLEAR ?auto_41806 ) ( not ( = ?auto_41803 ?auto_41830 ) ) ( not ( = ?auto_41804 ?auto_41830 ) ) ( not ( = ?auto_41824 ?auto_41830 ) ) ( not ( = ?auto_41821 ?auto_41830 ) ) ( not ( = ?auto_41807 ?auto_41830 ) ) ( not ( = ?auto_41808 ?auto_41830 ) ) ( not ( = ?auto_41816 ?auto_41830 ) ) ( not ( = ?auto_41817 ?auto_41830 ) ) ( not ( = ?auto_41810 ?auto_41830 ) ) ( not ( = ?auto_41820 ?auto_41830 ) ) ( not ( = ?auto_41815 ?auto_41830 ) ) ( not ( = ?auto_41806 ?auto_41830 ) ) ( not ( = ?auto_41828 ?auto_41830 ) ) ( not ( = ?auto_41822 ?auto_41830 ) ) )
    :subtasks
    ( ( !LIFT ?auto_41819 ?auto_41806 ?auto_41830 ?auto_41827 )
      ( MAKE-ON ?auto_41803 ?auto_41804 )
      ( MAKE-ON-VERIFY ?auto_41803 ?auto_41804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41831 - SURFACE
      ?auto_41832 - SURFACE
    )
    :vars
    (
      ?auto_41841 - HOIST
      ?auto_41858 - PLACE
      ?auto_41838 - PLACE
      ?auto_41853 - HOIST
      ?auto_41849 - SURFACE
      ?auto_41846 - SURFACE
      ?auto_41855 - PLACE
      ?auto_41833 - HOIST
      ?auto_41835 - SURFACE
      ?auto_41842 - SURFACE
      ?auto_41851 - PLACE
      ?auto_41836 - HOIST
      ?auto_41852 - SURFACE
      ?auto_41840 - SURFACE
      ?auto_41848 - PLACE
      ?auto_41839 - HOIST
      ?auto_41844 - SURFACE
      ?auto_41837 - SURFACE
      ?auto_41834 - SURFACE
      ?auto_41857 - SURFACE
      ?auto_41856 - PLACE
      ?auto_41843 - HOIST
      ?auto_41845 - SURFACE
      ?auto_41847 - SURFACE
      ?auto_41854 - SURFACE
      ?auto_41850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41841 ?auto_41858 ) ( IS-CRATE ?auto_41831 ) ( not ( = ?auto_41831 ?auto_41832 ) ) ( not ( = ?auto_41838 ?auto_41858 ) ) ( HOIST-AT ?auto_41853 ?auto_41838 ) ( not ( = ?auto_41841 ?auto_41853 ) ) ( SURFACE-AT ?auto_41831 ?auto_41838 ) ( ON ?auto_41831 ?auto_41849 ) ( CLEAR ?auto_41831 ) ( not ( = ?auto_41831 ?auto_41849 ) ) ( not ( = ?auto_41832 ?auto_41849 ) ) ( IS-CRATE ?auto_41832 ) ( not ( = ?auto_41831 ?auto_41846 ) ) ( not ( = ?auto_41832 ?auto_41846 ) ) ( not ( = ?auto_41849 ?auto_41846 ) ) ( not ( = ?auto_41855 ?auto_41858 ) ) ( not ( = ?auto_41838 ?auto_41855 ) ) ( HOIST-AT ?auto_41833 ?auto_41855 ) ( not ( = ?auto_41841 ?auto_41833 ) ) ( not ( = ?auto_41853 ?auto_41833 ) ) ( AVAILABLE ?auto_41833 ) ( SURFACE-AT ?auto_41832 ?auto_41855 ) ( ON ?auto_41832 ?auto_41835 ) ( CLEAR ?auto_41832 ) ( not ( = ?auto_41831 ?auto_41835 ) ) ( not ( = ?auto_41832 ?auto_41835 ) ) ( not ( = ?auto_41849 ?auto_41835 ) ) ( not ( = ?auto_41846 ?auto_41835 ) ) ( IS-CRATE ?auto_41846 ) ( not ( = ?auto_41831 ?auto_41842 ) ) ( not ( = ?auto_41832 ?auto_41842 ) ) ( not ( = ?auto_41849 ?auto_41842 ) ) ( not ( = ?auto_41846 ?auto_41842 ) ) ( not ( = ?auto_41835 ?auto_41842 ) ) ( not ( = ?auto_41851 ?auto_41858 ) ) ( not ( = ?auto_41838 ?auto_41851 ) ) ( not ( = ?auto_41855 ?auto_41851 ) ) ( HOIST-AT ?auto_41836 ?auto_41851 ) ( not ( = ?auto_41841 ?auto_41836 ) ) ( not ( = ?auto_41853 ?auto_41836 ) ) ( not ( = ?auto_41833 ?auto_41836 ) ) ( AVAILABLE ?auto_41836 ) ( SURFACE-AT ?auto_41846 ?auto_41851 ) ( ON ?auto_41846 ?auto_41852 ) ( CLEAR ?auto_41846 ) ( not ( = ?auto_41831 ?auto_41852 ) ) ( not ( = ?auto_41832 ?auto_41852 ) ) ( not ( = ?auto_41849 ?auto_41852 ) ) ( not ( = ?auto_41846 ?auto_41852 ) ) ( not ( = ?auto_41835 ?auto_41852 ) ) ( not ( = ?auto_41842 ?auto_41852 ) ) ( IS-CRATE ?auto_41842 ) ( not ( = ?auto_41831 ?auto_41840 ) ) ( not ( = ?auto_41832 ?auto_41840 ) ) ( not ( = ?auto_41849 ?auto_41840 ) ) ( not ( = ?auto_41846 ?auto_41840 ) ) ( not ( = ?auto_41835 ?auto_41840 ) ) ( not ( = ?auto_41842 ?auto_41840 ) ) ( not ( = ?auto_41852 ?auto_41840 ) ) ( not ( = ?auto_41848 ?auto_41858 ) ) ( not ( = ?auto_41838 ?auto_41848 ) ) ( not ( = ?auto_41855 ?auto_41848 ) ) ( not ( = ?auto_41851 ?auto_41848 ) ) ( HOIST-AT ?auto_41839 ?auto_41848 ) ( not ( = ?auto_41841 ?auto_41839 ) ) ( not ( = ?auto_41853 ?auto_41839 ) ) ( not ( = ?auto_41833 ?auto_41839 ) ) ( not ( = ?auto_41836 ?auto_41839 ) ) ( AVAILABLE ?auto_41839 ) ( SURFACE-AT ?auto_41842 ?auto_41848 ) ( ON ?auto_41842 ?auto_41844 ) ( CLEAR ?auto_41842 ) ( not ( = ?auto_41831 ?auto_41844 ) ) ( not ( = ?auto_41832 ?auto_41844 ) ) ( not ( = ?auto_41849 ?auto_41844 ) ) ( not ( = ?auto_41846 ?auto_41844 ) ) ( not ( = ?auto_41835 ?auto_41844 ) ) ( not ( = ?auto_41842 ?auto_41844 ) ) ( not ( = ?auto_41852 ?auto_41844 ) ) ( not ( = ?auto_41840 ?auto_41844 ) ) ( IS-CRATE ?auto_41840 ) ( not ( = ?auto_41831 ?auto_41837 ) ) ( not ( = ?auto_41832 ?auto_41837 ) ) ( not ( = ?auto_41849 ?auto_41837 ) ) ( not ( = ?auto_41846 ?auto_41837 ) ) ( not ( = ?auto_41835 ?auto_41837 ) ) ( not ( = ?auto_41842 ?auto_41837 ) ) ( not ( = ?auto_41852 ?auto_41837 ) ) ( not ( = ?auto_41840 ?auto_41837 ) ) ( not ( = ?auto_41844 ?auto_41837 ) ) ( SURFACE-AT ?auto_41840 ?auto_41838 ) ( ON ?auto_41840 ?auto_41834 ) ( CLEAR ?auto_41840 ) ( not ( = ?auto_41831 ?auto_41834 ) ) ( not ( = ?auto_41832 ?auto_41834 ) ) ( not ( = ?auto_41849 ?auto_41834 ) ) ( not ( = ?auto_41846 ?auto_41834 ) ) ( not ( = ?auto_41835 ?auto_41834 ) ) ( not ( = ?auto_41842 ?auto_41834 ) ) ( not ( = ?auto_41852 ?auto_41834 ) ) ( not ( = ?auto_41840 ?auto_41834 ) ) ( not ( = ?auto_41844 ?auto_41834 ) ) ( not ( = ?auto_41837 ?auto_41834 ) ) ( IS-CRATE ?auto_41837 ) ( not ( = ?auto_41831 ?auto_41857 ) ) ( not ( = ?auto_41832 ?auto_41857 ) ) ( not ( = ?auto_41849 ?auto_41857 ) ) ( not ( = ?auto_41846 ?auto_41857 ) ) ( not ( = ?auto_41835 ?auto_41857 ) ) ( not ( = ?auto_41842 ?auto_41857 ) ) ( not ( = ?auto_41852 ?auto_41857 ) ) ( not ( = ?auto_41840 ?auto_41857 ) ) ( not ( = ?auto_41844 ?auto_41857 ) ) ( not ( = ?auto_41837 ?auto_41857 ) ) ( not ( = ?auto_41834 ?auto_41857 ) ) ( not ( = ?auto_41856 ?auto_41858 ) ) ( not ( = ?auto_41838 ?auto_41856 ) ) ( not ( = ?auto_41855 ?auto_41856 ) ) ( not ( = ?auto_41851 ?auto_41856 ) ) ( not ( = ?auto_41848 ?auto_41856 ) ) ( HOIST-AT ?auto_41843 ?auto_41856 ) ( not ( = ?auto_41841 ?auto_41843 ) ) ( not ( = ?auto_41853 ?auto_41843 ) ) ( not ( = ?auto_41833 ?auto_41843 ) ) ( not ( = ?auto_41836 ?auto_41843 ) ) ( not ( = ?auto_41839 ?auto_41843 ) ) ( AVAILABLE ?auto_41843 ) ( SURFACE-AT ?auto_41837 ?auto_41856 ) ( ON ?auto_41837 ?auto_41845 ) ( CLEAR ?auto_41837 ) ( not ( = ?auto_41831 ?auto_41845 ) ) ( not ( = ?auto_41832 ?auto_41845 ) ) ( not ( = ?auto_41849 ?auto_41845 ) ) ( not ( = ?auto_41846 ?auto_41845 ) ) ( not ( = ?auto_41835 ?auto_41845 ) ) ( not ( = ?auto_41842 ?auto_41845 ) ) ( not ( = ?auto_41852 ?auto_41845 ) ) ( not ( = ?auto_41840 ?auto_41845 ) ) ( not ( = ?auto_41844 ?auto_41845 ) ) ( not ( = ?auto_41837 ?auto_41845 ) ) ( not ( = ?auto_41834 ?auto_41845 ) ) ( not ( = ?auto_41857 ?auto_41845 ) ) ( SURFACE-AT ?auto_41847 ?auto_41858 ) ( CLEAR ?auto_41847 ) ( IS-CRATE ?auto_41857 ) ( not ( = ?auto_41831 ?auto_41847 ) ) ( not ( = ?auto_41832 ?auto_41847 ) ) ( not ( = ?auto_41849 ?auto_41847 ) ) ( not ( = ?auto_41846 ?auto_41847 ) ) ( not ( = ?auto_41835 ?auto_41847 ) ) ( not ( = ?auto_41842 ?auto_41847 ) ) ( not ( = ?auto_41852 ?auto_41847 ) ) ( not ( = ?auto_41840 ?auto_41847 ) ) ( not ( = ?auto_41844 ?auto_41847 ) ) ( not ( = ?auto_41837 ?auto_41847 ) ) ( not ( = ?auto_41834 ?auto_41847 ) ) ( not ( = ?auto_41857 ?auto_41847 ) ) ( not ( = ?auto_41845 ?auto_41847 ) ) ( AVAILABLE ?auto_41841 ) ( AVAILABLE ?auto_41853 ) ( SURFACE-AT ?auto_41857 ?auto_41838 ) ( ON ?auto_41857 ?auto_41854 ) ( CLEAR ?auto_41857 ) ( not ( = ?auto_41831 ?auto_41854 ) ) ( not ( = ?auto_41832 ?auto_41854 ) ) ( not ( = ?auto_41849 ?auto_41854 ) ) ( not ( = ?auto_41846 ?auto_41854 ) ) ( not ( = ?auto_41835 ?auto_41854 ) ) ( not ( = ?auto_41842 ?auto_41854 ) ) ( not ( = ?auto_41852 ?auto_41854 ) ) ( not ( = ?auto_41840 ?auto_41854 ) ) ( not ( = ?auto_41844 ?auto_41854 ) ) ( not ( = ?auto_41837 ?auto_41854 ) ) ( not ( = ?auto_41834 ?auto_41854 ) ) ( not ( = ?auto_41857 ?auto_41854 ) ) ( not ( = ?auto_41845 ?auto_41854 ) ) ( not ( = ?auto_41847 ?auto_41854 ) ) ( TRUCK-AT ?auto_41850 ?auto_41858 ) )
    :subtasks
    ( ( !DRIVE ?auto_41850 ?auto_41858 ?auto_41838 )
      ( MAKE-ON ?auto_41831 ?auto_41832 )
      ( MAKE-ON-VERIFY ?auto_41831 ?auto_41832 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41861 - SURFACE
      ?auto_41862 - SURFACE
    )
    :vars
    (
      ?auto_41863 - HOIST
      ?auto_41864 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41863 ?auto_41864 ) ( SURFACE-AT ?auto_41862 ?auto_41864 ) ( CLEAR ?auto_41862 ) ( LIFTING ?auto_41863 ?auto_41861 ) ( IS-CRATE ?auto_41861 ) ( not ( = ?auto_41861 ?auto_41862 ) ) )
    :subtasks
    ( ( !DROP ?auto_41863 ?auto_41861 ?auto_41862 ?auto_41864 )
      ( MAKE-ON-VERIFY ?auto_41861 ?auto_41862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41865 - SURFACE
      ?auto_41866 - SURFACE
    )
    :vars
    (
      ?auto_41867 - HOIST
      ?auto_41868 - PLACE
      ?auto_41869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41867 ?auto_41868 ) ( SURFACE-AT ?auto_41866 ?auto_41868 ) ( CLEAR ?auto_41866 ) ( IS-CRATE ?auto_41865 ) ( not ( = ?auto_41865 ?auto_41866 ) ) ( TRUCK-AT ?auto_41869 ?auto_41868 ) ( AVAILABLE ?auto_41867 ) ( IN ?auto_41865 ?auto_41869 ) )
    :subtasks
    ( ( !UNLOAD ?auto_41867 ?auto_41865 ?auto_41869 ?auto_41868 )
      ( MAKE-ON ?auto_41865 ?auto_41866 )
      ( MAKE-ON-VERIFY ?auto_41865 ?auto_41866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41870 - SURFACE
      ?auto_41871 - SURFACE
    )
    :vars
    (
      ?auto_41874 - HOIST
      ?auto_41873 - PLACE
      ?auto_41872 - TRUCK
      ?auto_41875 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41874 ?auto_41873 ) ( SURFACE-AT ?auto_41871 ?auto_41873 ) ( CLEAR ?auto_41871 ) ( IS-CRATE ?auto_41870 ) ( not ( = ?auto_41870 ?auto_41871 ) ) ( AVAILABLE ?auto_41874 ) ( IN ?auto_41870 ?auto_41872 ) ( TRUCK-AT ?auto_41872 ?auto_41875 ) ( not ( = ?auto_41875 ?auto_41873 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_41872 ?auto_41875 ?auto_41873 )
      ( MAKE-ON ?auto_41870 ?auto_41871 )
      ( MAKE-ON-VERIFY ?auto_41870 ?auto_41871 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41876 - SURFACE
      ?auto_41877 - SURFACE
    )
    :vars
    (
      ?auto_41880 - HOIST
      ?auto_41879 - PLACE
      ?auto_41881 - TRUCK
      ?auto_41878 - PLACE
      ?auto_41882 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_41880 ?auto_41879 ) ( SURFACE-AT ?auto_41877 ?auto_41879 ) ( CLEAR ?auto_41877 ) ( IS-CRATE ?auto_41876 ) ( not ( = ?auto_41876 ?auto_41877 ) ) ( AVAILABLE ?auto_41880 ) ( TRUCK-AT ?auto_41881 ?auto_41878 ) ( not ( = ?auto_41878 ?auto_41879 ) ) ( HOIST-AT ?auto_41882 ?auto_41878 ) ( LIFTING ?auto_41882 ?auto_41876 ) ( not ( = ?auto_41880 ?auto_41882 ) ) )
    :subtasks
    ( ( !LOAD ?auto_41882 ?auto_41876 ?auto_41881 ?auto_41878 )
      ( MAKE-ON ?auto_41876 ?auto_41877 )
      ( MAKE-ON-VERIFY ?auto_41876 ?auto_41877 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41883 - SURFACE
      ?auto_41884 - SURFACE
    )
    :vars
    (
      ?auto_41886 - HOIST
      ?auto_41885 - PLACE
      ?auto_41887 - TRUCK
      ?auto_41889 - PLACE
      ?auto_41888 - HOIST
      ?auto_41890 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41886 ?auto_41885 ) ( SURFACE-AT ?auto_41884 ?auto_41885 ) ( CLEAR ?auto_41884 ) ( IS-CRATE ?auto_41883 ) ( not ( = ?auto_41883 ?auto_41884 ) ) ( AVAILABLE ?auto_41886 ) ( TRUCK-AT ?auto_41887 ?auto_41889 ) ( not ( = ?auto_41889 ?auto_41885 ) ) ( HOIST-AT ?auto_41888 ?auto_41889 ) ( not ( = ?auto_41886 ?auto_41888 ) ) ( AVAILABLE ?auto_41888 ) ( SURFACE-AT ?auto_41883 ?auto_41889 ) ( ON ?auto_41883 ?auto_41890 ) ( CLEAR ?auto_41883 ) ( not ( = ?auto_41883 ?auto_41890 ) ) ( not ( = ?auto_41884 ?auto_41890 ) ) )
    :subtasks
    ( ( !LIFT ?auto_41888 ?auto_41883 ?auto_41890 ?auto_41889 )
      ( MAKE-ON ?auto_41883 ?auto_41884 )
      ( MAKE-ON-VERIFY ?auto_41883 ?auto_41884 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41891 - SURFACE
      ?auto_41892 - SURFACE
    )
    :vars
    (
      ?auto_41898 - HOIST
      ?auto_41897 - PLACE
      ?auto_41894 - PLACE
      ?auto_41896 - HOIST
      ?auto_41893 - SURFACE
      ?auto_41895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41898 ?auto_41897 ) ( SURFACE-AT ?auto_41892 ?auto_41897 ) ( CLEAR ?auto_41892 ) ( IS-CRATE ?auto_41891 ) ( not ( = ?auto_41891 ?auto_41892 ) ) ( AVAILABLE ?auto_41898 ) ( not ( = ?auto_41894 ?auto_41897 ) ) ( HOIST-AT ?auto_41896 ?auto_41894 ) ( not ( = ?auto_41898 ?auto_41896 ) ) ( AVAILABLE ?auto_41896 ) ( SURFACE-AT ?auto_41891 ?auto_41894 ) ( ON ?auto_41891 ?auto_41893 ) ( CLEAR ?auto_41891 ) ( not ( = ?auto_41891 ?auto_41893 ) ) ( not ( = ?auto_41892 ?auto_41893 ) ) ( TRUCK-AT ?auto_41895 ?auto_41897 ) )
    :subtasks
    ( ( !DRIVE ?auto_41895 ?auto_41897 ?auto_41894 )
      ( MAKE-ON ?auto_41891 ?auto_41892 )
      ( MAKE-ON-VERIFY ?auto_41891 ?auto_41892 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41899 - SURFACE
      ?auto_41900 - SURFACE
    )
    :vars
    (
      ?auto_41902 - HOIST
      ?auto_41906 - PLACE
      ?auto_41904 - PLACE
      ?auto_41905 - HOIST
      ?auto_41903 - SURFACE
      ?auto_41901 - TRUCK
      ?auto_41907 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41902 ?auto_41906 ) ( IS-CRATE ?auto_41899 ) ( not ( = ?auto_41899 ?auto_41900 ) ) ( not ( = ?auto_41904 ?auto_41906 ) ) ( HOIST-AT ?auto_41905 ?auto_41904 ) ( not ( = ?auto_41902 ?auto_41905 ) ) ( AVAILABLE ?auto_41905 ) ( SURFACE-AT ?auto_41899 ?auto_41904 ) ( ON ?auto_41899 ?auto_41903 ) ( CLEAR ?auto_41899 ) ( not ( = ?auto_41899 ?auto_41903 ) ) ( not ( = ?auto_41900 ?auto_41903 ) ) ( TRUCK-AT ?auto_41901 ?auto_41906 ) ( SURFACE-AT ?auto_41907 ?auto_41906 ) ( CLEAR ?auto_41907 ) ( LIFTING ?auto_41902 ?auto_41900 ) ( IS-CRATE ?auto_41900 ) ( not ( = ?auto_41899 ?auto_41907 ) ) ( not ( = ?auto_41900 ?auto_41907 ) ) ( not ( = ?auto_41903 ?auto_41907 ) ) )
    :subtasks
    ( ( !DROP ?auto_41902 ?auto_41900 ?auto_41907 ?auto_41906 )
      ( MAKE-ON ?auto_41899 ?auto_41900 )
      ( MAKE-ON-VERIFY ?auto_41899 ?auto_41900 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41908 - SURFACE
      ?auto_41909 - SURFACE
    )
    :vars
    (
      ?auto_41915 - HOIST
      ?auto_41916 - PLACE
      ?auto_41910 - PLACE
      ?auto_41911 - HOIST
      ?auto_41914 - SURFACE
      ?auto_41912 - TRUCK
      ?auto_41913 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41915 ?auto_41916 ) ( IS-CRATE ?auto_41908 ) ( not ( = ?auto_41908 ?auto_41909 ) ) ( not ( = ?auto_41910 ?auto_41916 ) ) ( HOIST-AT ?auto_41911 ?auto_41910 ) ( not ( = ?auto_41915 ?auto_41911 ) ) ( AVAILABLE ?auto_41911 ) ( SURFACE-AT ?auto_41908 ?auto_41910 ) ( ON ?auto_41908 ?auto_41914 ) ( CLEAR ?auto_41908 ) ( not ( = ?auto_41908 ?auto_41914 ) ) ( not ( = ?auto_41909 ?auto_41914 ) ) ( TRUCK-AT ?auto_41912 ?auto_41916 ) ( SURFACE-AT ?auto_41913 ?auto_41916 ) ( CLEAR ?auto_41913 ) ( IS-CRATE ?auto_41909 ) ( not ( = ?auto_41908 ?auto_41913 ) ) ( not ( = ?auto_41909 ?auto_41913 ) ) ( not ( = ?auto_41914 ?auto_41913 ) ) ( AVAILABLE ?auto_41915 ) ( IN ?auto_41909 ?auto_41912 ) )
    :subtasks
    ( ( !UNLOAD ?auto_41915 ?auto_41909 ?auto_41912 ?auto_41916 )
      ( MAKE-ON ?auto_41908 ?auto_41909 )
      ( MAKE-ON-VERIFY ?auto_41908 ?auto_41909 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41917 - SURFACE
      ?auto_41918 - SURFACE
    )
    :vars
    (
      ?auto_41924 - HOIST
      ?auto_41919 - PLACE
      ?auto_41920 - PLACE
      ?auto_41925 - HOIST
      ?auto_41922 - SURFACE
      ?auto_41923 - SURFACE
      ?auto_41921 - TRUCK
      ?auto_41926 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41924 ?auto_41919 ) ( IS-CRATE ?auto_41917 ) ( not ( = ?auto_41917 ?auto_41918 ) ) ( not ( = ?auto_41920 ?auto_41919 ) ) ( HOIST-AT ?auto_41925 ?auto_41920 ) ( not ( = ?auto_41924 ?auto_41925 ) ) ( AVAILABLE ?auto_41925 ) ( SURFACE-AT ?auto_41917 ?auto_41920 ) ( ON ?auto_41917 ?auto_41922 ) ( CLEAR ?auto_41917 ) ( not ( = ?auto_41917 ?auto_41922 ) ) ( not ( = ?auto_41918 ?auto_41922 ) ) ( SURFACE-AT ?auto_41923 ?auto_41919 ) ( CLEAR ?auto_41923 ) ( IS-CRATE ?auto_41918 ) ( not ( = ?auto_41917 ?auto_41923 ) ) ( not ( = ?auto_41918 ?auto_41923 ) ) ( not ( = ?auto_41922 ?auto_41923 ) ) ( AVAILABLE ?auto_41924 ) ( IN ?auto_41918 ?auto_41921 ) ( TRUCK-AT ?auto_41921 ?auto_41926 ) ( not ( = ?auto_41926 ?auto_41919 ) ) ( not ( = ?auto_41920 ?auto_41926 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_41921 ?auto_41926 ?auto_41919 )
      ( MAKE-ON ?auto_41917 ?auto_41918 )
      ( MAKE-ON-VERIFY ?auto_41917 ?auto_41918 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41927 - SURFACE
      ?auto_41928 - SURFACE
    )
    :vars
    (
      ?auto_41936 - HOIST
      ?auto_41933 - PLACE
      ?auto_41934 - PLACE
      ?auto_41931 - HOIST
      ?auto_41929 - SURFACE
      ?auto_41935 - SURFACE
      ?auto_41932 - TRUCK
      ?auto_41930 - PLACE
      ?auto_41937 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_41936 ?auto_41933 ) ( IS-CRATE ?auto_41927 ) ( not ( = ?auto_41927 ?auto_41928 ) ) ( not ( = ?auto_41934 ?auto_41933 ) ) ( HOIST-AT ?auto_41931 ?auto_41934 ) ( not ( = ?auto_41936 ?auto_41931 ) ) ( AVAILABLE ?auto_41931 ) ( SURFACE-AT ?auto_41927 ?auto_41934 ) ( ON ?auto_41927 ?auto_41929 ) ( CLEAR ?auto_41927 ) ( not ( = ?auto_41927 ?auto_41929 ) ) ( not ( = ?auto_41928 ?auto_41929 ) ) ( SURFACE-AT ?auto_41935 ?auto_41933 ) ( CLEAR ?auto_41935 ) ( IS-CRATE ?auto_41928 ) ( not ( = ?auto_41927 ?auto_41935 ) ) ( not ( = ?auto_41928 ?auto_41935 ) ) ( not ( = ?auto_41929 ?auto_41935 ) ) ( AVAILABLE ?auto_41936 ) ( TRUCK-AT ?auto_41932 ?auto_41930 ) ( not ( = ?auto_41930 ?auto_41933 ) ) ( not ( = ?auto_41934 ?auto_41930 ) ) ( HOIST-AT ?auto_41937 ?auto_41930 ) ( LIFTING ?auto_41937 ?auto_41928 ) ( not ( = ?auto_41936 ?auto_41937 ) ) ( not ( = ?auto_41931 ?auto_41937 ) ) )
    :subtasks
    ( ( !LOAD ?auto_41937 ?auto_41928 ?auto_41932 ?auto_41930 )
      ( MAKE-ON ?auto_41927 ?auto_41928 )
      ( MAKE-ON-VERIFY ?auto_41927 ?auto_41928 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41938 - SURFACE
      ?auto_41939 - SURFACE
    )
    :vars
    (
      ?auto_41946 - HOIST
      ?auto_41943 - PLACE
      ?auto_41945 - PLACE
      ?auto_41941 - HOIST
      ?auto_41948 - SURFACE
      ?auto_41942 - SURFACE
      ?auto_41940 - TRUCK
      ?auto_41944 - PLACE
      ?auto_41947 - HOIST
      ?auto_41949 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41946 ?auto_41943 ) ( IS-CRATE ?auto_41938 ) ( not ( = ?auto_41938 ?auto_41939 ) ) ( not ( = ?auto_41945 ?auto_41943 ) ) ( HOIST-AT ?auto_41941 ?auto_41945 ) ( not ( = ?auto_41946 ?auto_41941 ) ) ( AVAILABLE ?auto_41941 ) ( SURFACE-AT ?auto_41938 ?auto_41945 ) ( ON ?auto_41938 ?auto_41948 ) ( CLEAR ?auto_41938 ) ( not ( = ?auto_41938 ?auto_41948 ) ) ( not ( = ?auto_41939 ?auto_41948 ) ) ( SURFACE-AT ?auto_41942 ?auto_41943 ) ( CLEAR ?auto_41942 ) ( IS-CRATE ?auto_41939 ) ( not ( = ?auto_41938 ?auto_41942 ) ) ( not ( = ?auto_41939 ?auto_41942 ) ) ( not ( = ?auto_41948 ?auto_41942 ) ) ( AVAILABLE ?auto_41946 ) ( TRUCK-AT ?auto_41940 ?auto_41944 ) ( not ( = ?auto_41944 ?auto_41943 ) ) ( not ( = ?auto_41945 ?auto_41944 ) ) ( HOIST-AT ?auto_41947 ?auto_41944 ) ( not ( = ?auto_41946 ?auto_41947 ) ) ( not ( = ?auto_41941 ?auto_41947 ) ) ( AVAILABLE ?auto_41947 ) ( SURFACE-AT ?auto_41939 ?auto_41944 ) ( ON ?auto_41939 ?auto_41949 ) ( CLEAR ?auto_41939 ) ( not ( = ?auto_41938 ?auto_41949 ) ) ( not ( = ?auto_41939 ?auto_41949 ) ) ( not ( = ?auto_41948 ?auto_41949 ) ) ( not ( = ?auto_41942 ?auto_41949 ) ) )
    :subtasks
    ( ( !LIFT ?auto_41947 ?auto_41939 ?auto_41949 ?auto_41944 )
      ( MAKE-ON ?auto_41938 ?auto_41939 )
      ( MAKE-ON-VERIFY ?auto_41938 ?auto_41939 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41950 - SURFACE
      ?auto_41951 - SURFACE
    )
    :vars
    (
      ?auto_41955 - HOIST
      ?auto_41956 - PLACE
      ?auto_41957 - PLACE
      ?auto_41959 - HOIST
      ?auto_41954 - SURFACE
      ?auto_41952 - SURFACE
      ?auto_41953 - PLACE
      ?auto_41960 - HOIST
      ?auto_41961 - SURFACE
      ?auto_41958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41955 ?auto_41956 ) ( IS-CRATE ?auto_41950 ) ( not ( = ?auto_41950 ?auto_41951 ) ) ( not ( = ?auto_41957 ?auto_41956 ) ) ( HOIST-AT ?auto_41959 ?auto_41957 ) ( not ( = ?auto_41955 ?auto_41959 ) ) ( AVAILABLE ?auto_41959 ) ( SURFACE-AT ?auto_41950 ?auto_41957 ) ( ON ?auto_41950 ?auto_41954 ) ( CLEAR ?auto_41950 ) ( not ( = ?auto_41950 ?auto_41954 ) ) ( not ( = ?auto_41951 ?auto_41954 ) ) ( SURFACE-AT ?auto_41952 ?auto_41956 ) ( CLEAR ?auto_41952 ) ( IS-CRATE ?auto_41951 ) ( not ( = ?auto_41950 ?auto_41952 ) ) ( not ( = ?auto_41951 ?auto_41952 ) ) ( not ( = ?auto_41954 ?auto_41952 ) ) ( AVAILABLE ?auto_41955 ) ( not ( = ?auto_41953 ?auto_41956 ) ) ( not ( = ?auto_41957 ?auto_41953 ) ) ( HOIST-AT ?auto_41960 ?auto_41953 ) ( not ( = ?auto_41955 ?auto_41960 ) ) ( not ( = ?auto_41959 ?auto_41960 ) ) ( AVAILABLE ?auto_41960 ) ( SURFACE-AT ?auto_41951 ?auto_41953 ) ( ON ?auto_41951 ?auto_41961 ) ( CLEAR ?auto_41951 ) ( not ( = ?auto_41950 ?auto_41961 ) ) ( not ( = ?auto_41951 ?auto_41961 ) ) ( not ( = ?auto_41954 ?auto_41961 ) ) ( not ( = ?auto_41952 ?auto_41961 ) ) ( TRUCK-AT ?auto_41958 ?auto_41956 ) )
    :subtasks
    ( ( !DRIVE ?auto_41958 ?auto_41956 ?auto_41953 )
      ( MAKE-ON ?auto_41950 ?auto_41951 )
      ( MAKE-ON-VERIFY ?auto_41950 ?auto_41951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41962 - SURFACE
      ?auto_41963 - SURFACE
    )
    :vars
    (
      ?auto_41968 - HOIST
      ?auto_41967 - PLACE
      ?auto_41964 - PLACE
      ?auto_41969 - HOIST
      ?auto_41970 - SURFACE
      ?auto_41971 - SURFACE
      ?auto_41973 - PLACE
      ?auto_41965 - HOIST
      ?auto_41972 - SURFACE
      ?auto_41966 - TRUCK
      ?auto_41974 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41968 ?auto_41967 ) ( IS-CRATE ?auto_41962 ) ( not ( = ?auto_41962 ?auto_41963 ) ) ( not ( = ?auto_41964 ?auto_41967 ) ) ( HOIST-AT ?auto_41969 ?auto_41964 ) ( not ( = ?auto_41968 ?auto_41969 ) ) ( AVAILABLE ?auto_41969 ) ( SURFACE-AT ?auto_41962 ?auto_41964 ) ( ON ?auto_41962 ?auto_41970 ) ( CLEAR ?auto_41962 ) ( not ( = ?auto_41962 ?auto_41970 ) ) ( not ( = ?auto_41963 ?auto_41970 ) ) ( IS-CRATE ?auto_41963 ) ( not ( = ?auto_41962 ?auto_41971 ) ) ( not ( = ?auto_41963 ?auto_41971 ) ) ( not ( = ?auto_41970 ?auto_41971 ) ) ( not ( = ?auto_41973 ?auto_41967 ) ) ( not ( = ?auto_41964 ?auto_41973 ) ) ( HOIST-AT ?auto_41965 ?auto_41973 ) ( not ( = ?auto_41968 ?auto_41965 ) ) ( not ( = ?auto_41969 ?auto_41965 ) ) ( AVAILABLE ?auto_41965 ) ( SURFACE-AT ?auto_41963 ?auto_41973 ) ( ON ?auto_41963 ?auto_41972 ) ( CLEAR ?auto_41963 ) ( not ( = ?auto_41962 ?auto_41972 ) ) ( not ( = ?auto_41963 ?auto_41972 ) ) ( not ( = ?auto_41970 ?auto_41972 ) ) ( not ( = ?auto_41971 ?auto_41972 ) ) ( TRUCK-AT ?auto_41966 ?auto_41967 ) ( SURFACE-AT ?auto_41974 ?auto_41967 ) ( CLEAR ?auto_41974 ) ( LIFTING ?auto_41968 ?auto_41971 ) ( IS-CRATE ?auto_41971 ) ( not ( = ?auto_41962 ?auto_41974 ) ) ( not ( = ?auto_41963 ?auto_41974 ) ) ( not ( = ?auto_41970 ?auto_41974 ) ) ( not ( = ?auto_41971 ?auto_41974 ) ) ( not ( = ?auto_41972 ?auto_41974 ) ) )
    :subtasks
    ( ( !DROP ?auto_41968 ?auto_41971 ?auto_41974 ?auto_41967 )
      ( MAKE-ON ?auto_41962 ?auto_41963 )
      ( MAKE-ON-VERIFY ?auto_41962 ?auto_41963 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41975 - SURFACE
      ?auto_41976 - SURFACE
    )
    :vars
    (
      ?auto_41987 - HOIST
      ?auto_41986 - PLACE
      ?auto_41977 - PLACE
      ?auto_41984 - HOIST
      ?auto_41980 - SURFACE
      ?auto_41982 - SURFACE
      ?auto_41981 - PLACE
      ?auto_41985 - HOIST
      ?auto_41978 - SURFACE
      ?auto_41983 - TRUCK
      ?auto_41979 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41987 ?auto_41986 ) ( IS-CRATE ?auto_41975 ) ( not ( = ?auto_41975 ?auto_41976 ) ) ( not ( = ?auto_41977 ?auto_41986 ) ) ( HOIST-AT ?auto_41984 ?auto_41977 ) ( not ( = ?auto_41987 ?auto_41984 ) ) ( AVAILABLE ?auto_41984 ) ( SURFACE-AT ?auto_41975 ?auto_41977 ) ( ON ?auto_41975 ?auto_41980 ) ( CLEAR ?auto_41975 ) ( not ( = ?auto_41975 ?auto_41980 ) ) ( not ( = ?auto_41976 ?auto_41980 ) ) ( IS-CRATE ?auto_41976 ) ( not ( = ?auto_41975 ?auto_41982 ) ) ( not ( = ?auto_41976 ?auto_41982 ) ) ( not ( = ?auto_41980 ?auto_41982 ) ) ( not ( = ?auto_41981 ?auto_41986 ) ) ( not ( = ?auto_41977 ?auto_41981 ) ) ( HOIST-AT ?auto_41985 ?auto_41981 ) ( not ( = ?auto_41987 ?auto_41985 ) ) ( not ( = ?auto_41984 ?auto_41985 ) ) ( AVAILABLE ?auto_41985 ) ( SURFACE-AT ?auto_41976 ?auto_41981 ) ( ON ?auto_41976 ?auto_41978 ) ( CLEAR ?auto_41976 ) ( not ( = ?auto_41975 ?auto_41978 ) ) ( not ( = ?auto_41976 ?auto_41978 ) ) ( not ( = ?auto_41980 ?auto_41978 ) ) ( not ( = ?auto_41982 ?auto_41978 ) ) ( TRUCK-AT ?auto_41983 ?auto_41986 ) ( SURFACE-AT ?auto_41979 ?auto_41986 ) ( CLEAR ?auto_41979 ) ( IS-CRATE ?auto_41982 ) ( not ( = ?auto_41975 ?auto_41979 ) ) ( not ( = ?auto_41976 ?auto_41979 ) ) ( not ( = ?auto_41980 ?auto_41979 ) ) ( not ( = ?auto_41982 ?auto_41979 ) ) ( not ( = ?auto_41978 ?auto_41979 ) ) ( AVAILABLE ?auto_41987 ) ( IN ?auto_41982 ?auto_41983 ) )
    :subtasks
    ( ( !UNLOAD ?auto_41987 ?auto_41982 ?auto_41983 ?auto_41986 )
      ( MAKE-ON ?auto_41975 ?auto_41976 )
      ( MAKE-ON-VERIFY ?auto_41975 ?auto_41976 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41988 - SURFACE
      ?auto_41989 - SURFACE
    )
    :vars
    (
      ?auto_41998 - HOIST
      ?auto_41994 - PLACE
      ?auto_41993 - PLACE
      ?auto_41995 - HOIST
      ?auto_41999 - SURFACE
      ?auto_42000 - SURFACE
      ?auto_41997 - PLACE
      ?auto_41990 - HOIST
      ?auto_41991 - SURFACE
      ?auto_41996 - SURFACE
      ?auto_41992 - TRUCK
      ?auto_42001 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41998 ?auto_41994 ) ( IS-CRATE ?auto_41988 ) ( not ( = ?auto_41988 ?auto_41989 ) ) ( not ( = ?auto_41993 ?auto_41994 ) ) ( HOIST-AT ?auto_41995 ?auto_41993 ) ( not ( = ?auto_41998 ?auto_41995 ) ) ( AVAILABLE ?auto_41995 ) ( SURFACE-AT ?auto_41988 ?auto_41993 ) ( ON ?auto_41988 ?auto_41999 ) ( CLEAR ?auto_41988 ) ( not ( = ?auto_41988 ?auto_41999 ) ) ( not ( = ?auto_41989 ?auto_41999 ) ) ( IS-CRATE ?auto_41989 ) ( not ( = ?auto_41988 ?auto_42000 ) ) ( not ( = ?auto_41989 ?auto_42000 ) ) ( not ( = ?auto_41999 ?auto_42000 ) ) ( not ( = ?auto_41997 ?auto_41994 ) ) ( not ( = ?auto_41993 ?auto_41997 ) ) ( HOIST-AT ?auto_41990 ?auto_41997 ) ( not ( = ?auto_41998 ?auto_41990 ) ) ( not ( = ?auto_41995 ?auto_41990 ) ) ( AVAILABLE ?auto_41990 ) ( SURFACE-AT ?auto_41989 ?auto_41997 ) ( ON ?auto_41989 ?auto_41991 ) ( CLEAR ?auto_41989 ) ( not ( = ?auto_41988 ?auto_41991 ) ) ( not ( = ?auto_41989 ?auto_41991 ) ) ( not ( = ?auto_41999 ?auto_41991 ) ) ( not ( = ?auto_42000 ?auto_41991 ) ) ( SURFACE-AT ?auto_41996 ?auto_41994 ) ( CLEAR ?auto_41996 ) ( IS-CRATE ?auto_42000 ) ( not ( = ?auto_41988 ?auto_41996 ) ) ( not ( = ?auto_41989 ?auto_41996 ) ) ( not ( = ?auto_41999 ?auto_41996 ) ) ( not ( = ?auto_42000 ?auto_41996 ) ) ( not ( = ?auto_41991 ?auto_41996 ) ) ( AVAILABLE ?auto_41998 ) ( IN ?auto_42000 ?auto_41992 ) ( TRUCK-AT ?auto_41992 ?auto_42001 ) ( not ( = ?auto_42001 ?auto_41994 ) ) ( not ( = ?auto_41993 ?auto_42001 ) ) ( not ( = ?auto_41997 ?auto_42001 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_41992 ?auto_42001 ?auto_41994 )
      ( MAKE-ON ?auto_41988 ?auto_41989 )
      ( MAKE-ON-VERIFY ?auto_41988 ?auto_41989 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42002 - SURFACE
      ?auto_42003 - SURFACE
    )
    :vars
    (
      ?auto_42012 - HOIST
      ?auto_42010 - PLACE
      ?auto_42006 - PLACE
      ?auto_42011 - HOIST
      ?auto_42015 - SURFACE
      ?auto_42005 - SURFACE
      ?auto_42014 - PLACE
      ?auto_42013 - HOIST
      ?auto_42007 - SURFACE
      ?auto_42008 - SURFACE
      ?auto_42004 - TRUCK
      ?auto_42009 - PLACE
      ?auto_42016 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_42012 ?auto_42010 ) ( IS-CRATE ?auto_42002 ) ( not ( = ?auto_42002 ?auto_42003 ) ) ( not ( = ?auto_42006 ?auto_42010 ) ) ( HOIST-AT ?auto_42011 ?auto_42006 ) ( not ( = ?auto_42012 ?auto_42011 ) ) ( AVAILABLE ?auto_42011 ) ( SURFACE-AT ?auto_42002 ?auto_42006 ) ( ON ?auto_42002 ?auto_42015 ) ( CLEAR ?auto_42002 ) ( not ( = ?auto_42002 ?auto_42015 ) ) ( not ( = ?auto_42003 ?auto_42015 ) ) ( IS-CRATE ?auto_42003 ) ( not ( = ?auto_42002 ?auto_42005 ) ) ( not ( = ?auto_42003 ?auto_42005 ) ) ( not ( = ?auto_42015 ?auto_42005 ) ) ( not ( = ?auto_42014 ?auto_42010 ) ) ( not ( = ?auto_42006 ?auto_42014 ) ) ( HOIST-AT ?auto_42013 ?auto_42014 ) ( not ( = ?auto_42012 ?auto_42013 ) ) ( not ( = ?auto_42011 ?auto_42013 ) ) ( AVAILABLE ?auto_42013 ) ( SURFACE-AT ?auto_42003 ?auto_42014 ) ( ON ?auto_42003 ?auto_42007 ) ( CLEAR ?auto_42003 ) ( not ( = ?auto_42002 ?auto_42007 ) ) ( not ( = ?auto_42003 ?auto_42007 ) ) ( not ( = ?auto_42015 ?auto_42007 ) ) ( not ( = ?auto_42005 ?auto_42007 ) ) ( SURFACE-AT ?auto_42008 ?auto_42010 ) ( CLEAR ?auto_42008 ) ( IS-CRATE ?auto_42005 ) ( not ( = ?auto_42002 ?auto_42008 ) ) ( not ( = ?auto_42003 ?auto_42008 ) ) ( not ( = ?auto_42015 ?auto_42008 ) ) ( not ( = ?auto_42005 ?auto_42008 ) ) ( not ( = ?auto_42007 ?auto_42008 ) ) ( AVAILABLE ?auto_42012 ) ( TRUCK-AT ?auto_42004 ?auto_42009 ) ( not ( = ?auto_42009 ?auto_42010 ) ) ( not ( = ?auto_42006 ?auto_42009 ) ) ( not ( = ?auto_42014 ?auto_42009 ) ) ( HOIST-AT ?auto_42016 ?auto_42009 ) ( LIFTING ?auto_42016 ?auto_42005 ) ( not ( = ?auto_42012 ?auto_42016 ) ) ( not ( = ?auto_42011 ?auto_42016 ) ) ( not ( = ?auto_42013 ?auto_42016 ) ) )
    :subtasks
    ( ( !LOAD ?auto_42016 ?auto_42005 ?auto_42004 ?auto_42009 )
      ( MAKE-ON ?auto_42002 ?auto_42003 )
      ( MAKE-ON-VERIFY ?auto_42002 ?auto_42003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42017 - SURFACE
      ?auto_42018 - SURFACE
    )
    :vars
    (
      ?auto_42030 - HOIST
      ?auto_42029 - PLACE
      ?auto_42027 - PLACE
      ?auto_42023 - HOIST
      ?auto_42024 - SURFACE
      ?auto_42022 - SURFACE
      ?auto_42019 - PLACE
      ?auto_42026 - HOIST
      ?auto_42020 - SURFACE
      ?auto_42021 - SURFACE
      ?auto_42025 - TRUCK
      ?auto_42031 - PLACE
      ?auto_42028 - HOIST
      ?auto_42032 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42030 ?auto_42029 ) ( IS-CRATE ?auto_42017 ) ( not ( = ?auto_42017 ?auto_42018 ) ) ( not ( = ?auto_42027 ?auto_42029 ) ) ( HOIST-AT ?auto_42023 ?auto_42027 ) ( not ( = ?auto_42030 ?auto_42023 ) ) ( AVAILABLE ?auto_42023 ) ( SURFACE-AT ?auto_42017 ?auto_42027 ) ( ON ?auto_42017 ?auto_42024 ) ( CLEAR ?auto_42017 ) ( not ( = ?auto_42017 ?auto_42024 ) ) ( not ( = ?auto_42018 ?auto_42024 ) ) ( IS-CRATE ?auto_42018 ) ( not ( = ?auto_42017 ?auto_42022 ) ) ( not ( = ?auto_42018 ?auto_42022 ) ) ( not ( = ?auto_42024 ?auto_42022 ) ) ( not ( = ?auto_42019 ?auto_42029 ) ) ( not ( = ?auto_42027 ?auto_42019 ) ) ( HOIST-AT ?auto_42026 ?auto_42019 ) ( not ( = ?auto_42030 ?auto_42026 ) ) ( not ( = ?auto_42023 ?auto_42026 ) ) ( AVAILABLE ?auto_42026 ) ( SURFACE-AT ?auto_42018 ?auto_42019 ) ( ON ?auto_42018 ?auto_42020 ) ( CLEAR ?auto_42018 ) ( not ( = ?auto_42017 ?auto_42020 ) ) ( not ( = ?auto_42018 ?auto_42020 ) ) ( not ( = ?auto_42024 ?auto_42020 ) ) ( not ( = ?auto_42022 ?auto_42020 ) ) ( SURFACE-AT ?auto_42021 ?auto_42029 ) ( CLEAR ?auto_42021 ) ( IS-CRATE ?auto_42022 ) ( not ( = ?auto_42017 ?auto_42021 ) ) ( not ( = ?auto_42018 ?auto_42021 ) ) ( not ( = ?auto_42024 ?auto_42021 ) ) ( not ( = ?auto_42022 ?auto_42021 ) ) ( not ( = ?auto_42020 ?auto_42021 ) ) ( AVAILABLE ?auto_42030 ) ( TRUCK-AT ?auto_42025 ?auto_42031 ) ( not ( = ?auto_42031 ?auto_42029 ) ) ( not ( = ?auto_42027 ?auto_42031 ) ) ( not ( = ?auto_42019 ?auto_42031 ) ) ( HOIST-AT ?auto_42028 ?auto_42031 ) ( not ( = ?auto_42030 ?auto_42028 ) ) ( not ( = ?auto_42023 ?auto_42028 ) ) ( not ( = ?auto_42026 ?auto_42028 ) ) ( AVAILABLE ?auto_42028 ) ( SURFACE-AT ?auto_42022 ?auto_42031 ) ( ON ?auto_42022 ?auto_42032 ) ( CLEAR ?auto_42022 ) ( not ( = ?auto_42017 ?auto_42032 ) ) ( not ( = ?auto_42018 ?auto_42032 ) ) ( not ( = ?auto_42024 ?auto_42032 ) ) ( not ( = ?auto_42022 ?auto_42032 ) ) ( not ( = ?auto_42020 ?auto_42032 ) ) ( not ( = ?auto_42021 ?auto_42032 ) ) )
    :subtasks
    ( ( !LIFT ?auto_42028 ?auto_42022 ?auto_42032 ?auto_42031 )
      ( MAKE-ON ?auto_42017 ?auto_42018 )
      ( MAKE-ON-VERIFY ?auto_42017 ?auto_42018 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42033 - SURFACE
      ?auto_42034 - SURFACE
    )
    :vars
    (
      ?auto_42043 - HOIST
      ?auto_42047 - PLACE
      ?auto_42041 - PLACE
      ?auto_42046 - HOIST
      ?auto_42045 - SURFACE
      ?auto_42048 - SURFACE
      ?auto_42035 - PLACE
      ?auto_42036 - HOIST
      ?auto_42044 - SURFACE
      ?auto_42040 - SURFACE
      ?auto_42038 - PLACE
      ?auto_42039 - HOIST
      ?auto_42042 - SURFACE
      ?auto_42037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42043 ?auto_42047 ) ( IS-CRATE ?auto_42033 ) ( not ( = ?auto_42033 ?auto_42034 ) ) ( not ( = ?auto_42041 ?auto_42047 ) ) ( HOIST-AT ?auto_42046 ?auto_42041 ) ( not ( = ?auto_42043 ?auto_42046 ) ) ( AVAILABLE ?auto_42046 ) ( SURFACE-AT ?auto_42033 ?auto_42041 ) ( ON ?auto_42033 ?auto_42045 ) ( CLEAR ?auto_42033 ) ( not ( = ?auto_42033 ?auto_42045 ) ) ( not ( = ?auto_42034 ?auto_42045 ) ) ( IS-CRATE ?auto_42034 ) ( not ( = ?auto_42033 ?auto_42048 ) ) ( not ( = ?auto_42034 ?auto_42048 ) ) ( not ( = ?auto_42045 ?auto_42048 ) ) ( not ( = ?auto_42035 ?auto_42047 ) ) ( not ( = ?auto_42041 ?auto_42035 ) ) ( HOIST-AT ?auto_42036 ?auto_42035 ) ( not ( = ?auto_42043 ?auto_42036 ) ) ( not ( = ?auto_42046 ?auto_42036 ) ) ( AVAILABLE ?auto_42036 ) ( SURFACE-AT ?auto_42034 ?auto_42035 ) ( ON ?auto_42034 ?auto_42044 ) ( CLEAR ?auto_42034 ) ( not ( = ?auto_42033 ?auto_42044 ) ) ( not ( = ?auto_42034 ?auto_42044 ) ) ( not ( = ?auto_42045 ?auto_42044 ) ) ( not ( = ?auto_42048 ?auto_42044 ) ) ( SURFACE-AT ?auto_42040 ?auto_42047 ) ( CLEAR ?auto_42040 ) ( IS-CRATE ?auto_42048 ) ( not ( = ?auto_42033 ?auto_42040 ) ) ( not ( = ?auto_42034 ?auto_42040 ) ) ( not ( = ?auto_42045 ?auto_42040 ) ) ( not ( = ?auto_42048 ?auto_42040 ) ) ( not ( = ?auto_42044 ?auto_42040 ) ) ( AVAILABLE ?auto_42043 ) ( not ( = ?auto_42038 ?auto_42047 ) ) ( not ( = ?auto_42041 ?auto_42038 ) ) ( not ( = ?auto_42035 ?auto_42038 ) ) ( HOIST-AT ?auto_42039 ?auto_42038 ) ( not ( = ?auto_42043 ?auto_42039 ) ) ( not ( = ?auto_42046 ?auto_42039 ) ) ( not ( = ?auto_42036 ?auto_42039 ) ) ( AVAILABLE ?auto_42039 ) ( SURFACE-AT ?auto_42048 ?auto_42038 ) ( ON ?auto_42048 ?auto_42042 ) ( CLEAR ?auto_42048 ) ( not ( = ?auto_42033 ?auto_42042 ) ) ( not ( = ?auto_42034 ?auto_42042 ) ) ( not ( = ?auto_42045 ?auto_42042 ) ) ( not ( = ?auto_42048 ?auto_42042 ) ) ( not ( = ?auto_42044 ?auto_42042 ) ) ( not ( = ?auto_42040 ?auto_42042 ) ) ( TRUCK-AT ?auto_42037 ?auto_42047 ) )
    :subtasks
    ( ( !DRIVE ?auto_42037 ?auto_42047 ?auto_42038 )
      ( MAKE-ON ?auto_42033 ?auto_42034 )
      ( MAKE-ON-VERIFY ?auto_42033 ?auto_42034 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42049 - SURFACE
      ?auto_42050 - SURFACE
    )
    :vars
    (
      ?auto_42063 - HOIST
      ?auto_42064 - PLACE
      ?auto_42057 - PLACE
      ?auto_42060 - HOIST
      ?auto_42051 - SURFACE
      ?auto_42061 - SURFACE
      ?auto_42053 - PLACE
      ?auto_42059 - HOIST
      ?auto_42055 - SURFACE
      ?auto_42054 - SURFACE
      ?auto_42062 - PLACE
      ?auto_42052 - HOIST
      ?auto_42058 - SURFACE
      ?auto_42056 - TRUCK
      ?auto_42065 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42063 ?auto_42064 ) ( IS-CRATE ?auto_42049 ) ( not ( = ?auto_42049 ?auto_42050 ) ) ( not ( = ?auto_42057 ?auto_42064 ) ) ( HOIST-AT ?auto_42060 ?auto_42057 ) ( not ( = ?auto_42063 ?auto_42060 ) ) ( AVAILABLE ?auto_42060 ) ( SURFACE-AT ?auto_42049 ?auto_42057 ) ( ON ?auto_42049 ?auto_42051 ) ( CLEAR ?auto_42049 ) ( not ( = ?auto_42049 ?auto_42051 ) ) ( not ( = ?auto_42050 ?auto_42051 ) ) ( IS-CRATE ?auto_42050 ) ( not ( = ?auto_42049 ?auto_42061 ) ) ( not ( = ?auto_42050 ?auto_42061 ) ) ( not ( = ?auto_42051 ?auto_42061 ) ) ( not ( = ?auto_42053 ?auto_42064 ) ) ( not ( = ?auto_42057 ?auto_42053 ) ) ( HOIST-AT ?auto_42059 ?auto_42053 ) ( not ( = ?auto_42063 ?auto_42059 ) ) ( not ( = ?auto_42060 ?auto_42059 ) ) ( AVAILABLE ?auto_42059 ) ( SURFACE-AT ?auto_42050 ?auto_42053 ) ( ON ?auto_42050 ?auto_42055 ) ( CLEAR ?auto_42050 ) ( not ( = ?auto_42049 ?auto_42055 ) ) ( not ( = ?auto_42050 ?auto_42055 ) ) ( not ( = ?auto_42051 ?auto_42055 ) ) ( not ( = ?auto_42061 ?auto_42055 ) ) ( IS-CRATE ?auto_42061 ) ( not ( = ?auto_42049 ?auto_42054 ) ) ( not ( = ?auto_42050 ?auto_42054 ) ) ( not ( = ?auto_42051 ?auto_42054 ) ) ( not ( = ?auto_42061 ?auto_42054 ) ) ( not ( = ?auto_42055 ?auto_42054 ) ) ( not ( = ?auto_42062 ?auto_42064 ) ) ( not ( = ?auto_42057 ?auto_42062 ) ) ( not ( = ?auto_42053 ?auto_42062 ) ) ( HOIST-AT ?auto_42052 ?auto_42062 ) ( not ( = ?auto_42063 ?auto_42052 ) ) ( not ( = ?auto_42060 ?auto_42052 ) ) ( not ( = ?auto_42059 ?auto_42052 ) ) ( AVAILABLE ?auto_42052 ) ( SURFACE-AT ?auto_42061 ?auto_42062 ) ( ON ?auto_42061 ?auto_42058 ) ( CLEAR ?auto_42061 ) ( not ( = ?auto_42049 ?auto_42058 ) ) ( not ( = ?auto_42050 ?auto_42058 ) ) ( not ( = ?auto_42051 ?auto_42058 ) ) ( not ( = ?auto_42061 ?auto_42058 ) ) ( not ( = ?auto_42055 ?auto_42058 ) ) ( not ( = ?auto_42054 ?auto_42058 ) ) ( TRUCK-AT ?auto_42056 ?auto_42064 ) ( SURFACE-AT ?auto_42065 ?auto_42064 ) ( CLEAR ?auto_42065 ) ( LIFTING ?auto_42063 ?auto_42054 ) ( IS-CRATE ?auto_42054 ) ( not ( = ?auto_42049 ?auto_42065 ) ) ( not ( = ?auto_42050 ?auto_42065 ) ) ( not ( = ?auto_42051 ?auto_42065 ) ) ( not ( = ?auto_42061 ?auto_42065 ) ) ( not ( = ?auto_42055 ?auto_42065 ) ) ( not ( = ?auto_42054 ?auto_42065 ) ) ( not ( = ?auto_42058 ?auto_42065 ) ) )
    :subtasks
    ( ( !DROP ?auto_42063 ?auto_42054 ?auto_42065 ?auto_42064 )
      ( MAKE-ON ?auto_42049 ?auto_42050 )
      ( MAKE-ON-VERIFY ?auto_42049 ?auto_42050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42066 - SURFACE
      ?auto_42067 - SURFACE
    )
    :vars
    (
      ?auto_42069 - HOIST
      ?auto_42077 - PLACE
      ?auto_42081 - PLACE
      ?auto_42073 - HOIST
      ?auto_42072 - SURFACE
      ?auto_42080 - SURFACE
      ?auto_42068 - PLACE
      ?auto_42070 - HOIST
      ?auto_42074 - SURFACE
      ?auto_42079 - SURFACE
      ?auto_42071 - PLACE
      ?auto_42078 - HOIST
      ?auto_42075 - SURFACE
      ?auto_42076 - TRUCK
      ?auto_42082 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42069 ?auto_42077 ) ( IS-CRATE ?auto_42066 ) ( not ( = ?auto_42066 ?auto_42067 ) ) ( not ( = ?auto_42081 ?auto_42077 ) ) ( HOIST-AT ?auto_42073 ?auto_42081 ) ( not ( = ?auto_42069 ?auto_42073 ) ) ( AVAILABLE ?auto_42073 ) ( SURFACE-AT ?auto_42066 ?auto_42081 ) ( ON ?auto_42066 ?auto_42072 ) ( CLEAR ?auto_42066 ) ( not ( = ?auto_42066 ?auto_42072 ) ) ( not ( = ?auto_42067 ?auto_42072 ) ) ( IS-CRATE ?auto_42067 ) ( not ( = ?auto_42066 ?auto_42080 ) ) ( not ( = ?auto_42067 ?auto_42080 ) ) ( not ( = ?auto_42072 ?auto_42080 ) ) ( not ( = ?auto_42068 ?auto_42077 ) ) ( not ( = ?auto_42081 ?auto_42068 ) ) ( HOIST-AT ?auto_42070 ?auto_42068 ) ( not ( = ?auto_42069 ?auto_42070 ) ) ( not ( = ?auto_42073 ?auto_42070 ) ) ( AVAILABLE ?auto_42070 ) ( SURFACE-AT ?auto_42067 ?auto_42068 ) ( ON ?auto_42067 ?auto_42074 ) ( CLEAR ?auto_42067 ) ( not ( = ?auto_42066 ?auto_42074 ) ) ( not ( = ?auto_42067 ?auto_42074 ) ) ( not ( = ?auto_42072 ?auto_42074 ) ) ( not ( = ?auto_42080 ?auto_42074 ) ) ( IS-CRATE ?auto_42080 ) ( not ( = ?auto_42066 ?auto_42079 ) ) ( not ( = ?auto_42067 ?auto_42079 ) ) ( not ( = ?auto_42072 ?auto_42079 ) ) ( not ( = ?auto_42080 ?auto_42079 ) ) ( not ( = ?auto_42074 ?auto_42079 ) ) ( not ( = ?auto_42071 ?auto_42077 ) ) ( not ( = ?auto_42081 ?auto_42071 ) ) ( not ( = ?auto_42068 ?auto_42071 ) ) ( HOIST-AT ?auto_42078 ?auto_42071 ) ( not ( = ?auto_42069 ?auto_42078 ) ) ( not ( = ?auto_42073 ?auto_42078 ) ) ( not ( = ?auto_42070 ?auto_42078 ) ) ( AVAILABLE ?auto_42078 ) ( SURFACE-AT ?auto_42080 ?auto_42071 ) ( ON ?auto_42080 ?auto_42075 ) ( CLEAR ?auto_42080 ) ( not ( = ?auto_42066 ?auto_42075 ) ) ( not ( = ?auto_42067 ?auto_42075 ) ) ( not ( = ?auto_42072 ?auto_42075 ) ) ( not ( = ?auto_42080 ?auto_42075 ) ) ( not ( = ?auto_42074 ?auto_42075 ) ) ( not ( = ?auto_42079 ?auto_42075 ) ) ( TRUCK-AT ?auto_42076 ?auto_42077 ) ( SURFACE-AT ?auto_42082 ?auto_42077 ) ( CLEAR ?auto_42082 ) ( IS-CRATE ?auto_42079 ) ( not ( = ?auto_42066 ?auto_42082 ) ) ( not ( = ?auto_42067 ?auto_42082 ) ) ( not ( = ?auto_42072 ?auto_42082 ) ) ( not ( = ?auto_42080 ?auto_42082 ) ) ( not ( = ?auto_42074 ?auto_42082 ) ) ( not ( = ?auto_42079 ?auto_42082 ) ) ( not ( = ?auto_42075 ?auto_42082 ) ) ( AVAILABLE ?auto_42069 ) ( IN ?auto_42079 ?auto_42076 ) )
    :subtasks
    ( ( !UNLOAD ?auto_42069 ?auto_42079 ?auto_42076 ?auto_42077 )
      ( MAKE-ON ?auto_42066 ?auto_42067 )
      ( MAKE-ON-VERIFY ?auto_42066 ?auto_42067 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42083 - SURFACE
      ?auto_42084 - SURFACE
    )
    :vars
    (
      ?auto_42097 - HOIST
      ?auto_42093 - PLACE
      ?auto_42096 - PLACE
      ?auto_42086 - HOIST
      ?auto_42094 - SURFACE
      ?auto_42099 - SURFACE
      ?auto_42091 - PLACE
      ?auto_42085 - HOIST
      ?auto_42089 - SURFACE
      ?auto_42087 - SURFACE
      ?auto_42092 - PLACE
      ?auto_42098 - HOIST
      ?auto_42095 - SURFACE
      ?auto_42088 - SURFACE
      ?auto_42090 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42097 ?auto_42093 ) ( IS-CRATE ?auto_42083 ) ( not ( = ?auto_42083 ?auto_42084 ) ) ( not ( = ?auto_42096 ?auto_42093 ) ) ( HOIST-AT ?auto_42086 ?auto_42096 ) ( not ( = ?auto_42097 ?auto_42086 ) ) ( AVAILABLE ?auto_42086 ) ( SURFACE-AT ?auto_42083 ?auto_42096 ) ( ON ?auto_42083 ?auto_42094 ) ( CLEAR ?auto_42083 ) ( not ( = ?auto_42083 ?auto_42094 ) ) ( not ( = ?auto_42084 ?auto_42094 ) ) ( IS-CRATE ?auto_42084 ) ( not ( = ?auto_42083 ?auto_42099 ) ) ( not ( = ?auto_42084 ?auto_42099 ) ) ( not ( = ?auto_42094 ?auto_42099 ) ) ( not ( = ?auto_42091 ?auto_42093 ) ) ( not ( = ?auto_42096 ?auto_42091 ) ) ( HOIST-AT ?auto_42085 ?auto_42091 ) ( not ( = ?auto_42097 ?auto_42085 ) ) ( not ( = ?auto_42086 ?auto_42085 ) ) ( AVAILABLE ?auto_42085 ) ( SURFACE-AT ?auto_42084 ?auto_42091 ) ( ON ?auto_42084 ?auto_42089 ) ( CLEAR ?auto_42084 ) ( not ( = ?auto_42083 ?auto_42089 ) ) ( not ( = ?auto_42084 ?auto_42089 ) ) ( not ( = ?auto_42094 ?auto_42089 ) ) ( not ( = ?auto_42099 ?auto_42089 ) ) ( IS-CRATE ?auto_42099 ) ( not ( = ?auto_42083 ?auto_42087 ) ) ( not ( = ?auto_42084 ?auto_42087 ) ) ( not ( = ?auto_42094 ?auto_42087 ) ) ( not ( = ?auto_42099 ?auto_42087 ) ) ( not ( = ?auto_42089 ?auto_42087 ) ) ( not ( = ?auto_42092 ?auto_42093 ) ) ( not ( = ?auto_42096 ?auto_42092 ) ) ( not ( = ?auto_42091 ?auto_42092 ) ) ( HOIST-AT ?auto_42098 ?auto_42092 ) ( not ( = ?auto_42097 ?auto_42098 ) ) ( not ( = ?auto_42086 ?auto_42098 ) ) ( not ( = ?auto_42085 ?auto_42098 ) ) ( AVAILABLE ?auto_42098 ) ( SURFACE-AT ?auto_42099 ?auto_42092 ) ( ON ?auto_42099 ?auto_42095 ) ( CLEAR ?auto_42099 ) ( not ( = ?auto_42083 ?auto_42095 ) ) ( not ( = ?auto_42084 ?auto_42095 ) ) ( not ( = ?auto_42094 ?auto_42095 ) ) ( not ( = ?auto_42099 ?auto_42095 ) ) ( not ( = ?auto_42089 ?auto_42095 ) ) ( not ( = ?auto_42087 ?auto_42095 ) ) ( SURFACE-AT ?auto_42088 ?auto_42093 ) ( CLEAR ?auto_42088 ) ( IS-CRATE ?auto_42087 ) ( not ( = ?auto_42083 ?auto_42088 ) ) ( not ( = ?auto_42084 ?auto_42088 ) ) ( not ( = ?auto_42094 ?auto_42088 ) ) ( not ( = ?auto_42099 ?auto_42088 ) ) ( not ( = ?auto_42089 ?auto_42088 ) ) ( not ( = ?auto_42087 ?auto_42088 ) ) ( not ( = ?auto_42095 ?auto_42088 ) ) ( AVAILABLE ?auto_42097 ) ( IN ?auto_42087 ?auto_42090 ) ( TRUCK-AT ?auto_42090 ?auto_42096 ) )
    :subtasks
    ( ( !DRIVE ?auto_42090 ?auto_42096 ?auto_42093 )
      ( MAKE-ON ?auto_42083 ?auto_42084 )
      ( MAKE-ON-VERIFY ?auto_42083 ?auto_42084 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42100 - SURFACE
      ?auto_42101 - SURFACE
    )
    :vars
    (
      ?auto_42114 - HOIST
      ?auto_42108 - PLACE
      ?auto_42102 - PLACE
      ?auto_42103 - HOIST
      ?auto_42113 - SURFACE
      ?auto_42111 - SURFACE
      ?auto_42107 - PLACE
      ?auto_42109 - HOIST
      ?auto_42112 - SURFACE
      ?auto_42104 - SURFACE
      ?auto_42115 - PLACE
      ?auto_42116 - HOIST
      ?auto_42105 - SURFACE
      ?auto_42106 - SURFACE
      ?auto_42110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42114 ?auto_42108 ) ( IS-CRATE ?auto_42100 ) ( not ( = ?auto_42100 ?auto_42101 ) ) ( not ( = ?auto_42102 ?auto_42108 ) ) ( HOIST-AT ?auto_42103 ?auto_42102 ) ( not ( = ?auto_42114 ?auto_42103 ) ) ( SURFACE-AT ?auto_42100 ?auto_42102 ) ( ON ?auto_42100 ?auto_42113 ) ( CLEAR ?auto_42100 ) ( not ( = ?auto_42100 ?auto_42113 ) ) ( not ( = ?auto_42101 ?auto_42113 ) ) ( IS-CRATE ?auto_42101 ) ( not ( = ?auto_42100 ?auto_42111 ) ) ( not ( = ?auto_42101 ?auto_42111 ) ) ( not ( = ?auto_42113 ?auto_42111 ) ) ( not ( = ?auto_42107 ?auto_42108 ) ) ( not ( = ?auto_42102 ?auto_42107 ) ) ( HOIST-AT ?auto_42109 ?auto_42107 ) ( not ( = ?auto_42114 ?auto_42109 ) ) ( not ( = ?auto_42103 ?auto_42109 ) ) ( AVAILABLE ?auto_42109 ) ( SURFACE-AT ?auto_42101 ?auto_42107 ) ( ON ?auto_42101 ?auto_42112 ) ( CLEAR ?auto_42101 ) ( not ( = ?auto_42100 ?auto_42112 ) ) ( not ( = ?auto_42101 ?auto_42112 ) ) ( not ( = ?auto_42113 ?auto_42112 ) ) ( not ( = ?auto_42111 ?auto_42112 ) ) ( IS-CRATE ?auto_42111 ) ( not ( = ?auto_42100 ?auto_42104 ) ) ( not ( = ?auto_42101 ?auto_42104 ) ) ( not ( = ?auto_42113 ?auto_42104 ) ) ( not ( = ?auto_42111 ?auto_42104 ) ) ( not ( = ?auto_42112 ?auto_42104 ) ) ( not ( = ?auto_42115 ?auto_42108 ) ) ( not ( = ?auto_42102 ?auto_42115 ) ) ( not ( = ?auto_42107 ?auto_42115 ) ) ( HOIST-AT ?auto_42116 ?auto_42115 ) ( not ( = ?auto_42114 ?auto_42116 ) ) ( not ( = ?auto_42103 ?auto_42116 ) ) ( not ( = ?auto_42109 ?auto_42116 ) ) ( AVAILABLE ?auto_42116 ) ( SURFACE-AT ?auto_42111 ?auto_42115 ) ( ON ?auto_42111 ?auto_42105 ) ( CLEAR ?auto_42111 ) ( not ( = ?auto_42100 ?auto_42105 ) ) ( not ( = ?auto_42101 ?auto_42105 ) ) ( not ( = ?auto_42113 ?auto_42105 ) ) ( not ( = ?auto_42111 ?auto_42105 ) ) ( not ( = ?auto_42112 ?auto_42105 ) ) ( not ( = ?auto_42104 ?auto_42105 ) ) ( SURFACE-AT ?auto_42106 ?auto_42108 ) ( CLEAR ?auto_42106 ) ( IS-CRATE ?auto_42104 ) ( not ( = ?auto_42100 ?auto_42106 ) ) ( not ( = ?auto_42101 ?auto_42106 ) ) ( not ( = ?auto_42113 ?auto_42106 ) ) ( not ( = ?auto_42111 ?auto_42106 ) ) ( not ( = ?auto_42112 ?auto_42106 ) ) ( not ( = ?auto_42104 ?auto_42106 ) ) ( not ( = ?auto_42105 ?auto_42106 ) ) ( AVAILABLE ?auto_42114 ) ( TRUCK-AT ?auto_42110 ?auto_42102 ) ( LIFTING ?auto_42103 ?auto_42104 ) )
    :subtasks
    ( ( !LOAD ?auto_42103 ?auto_42104 ?auto_42110 ?auto_42102 )
      ( MAKE-ON ?auto_42100 ?auto_42101 )
      ( MAKE-ON-VERIFY ?auto_42100 ?auto_42101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42117 - SURFACE
      ?auto_42118 - SURFACE
    )
    :vars
    (
      ?auto_42129 - HOIST
      ?auto_42132 - PLACE
      ?auto_42119 - PLACE
      ?auto_42130 - HOIST
      ?auto_42128 - SURFACE
      ?auto_42127 - SURFACE
      ?auto_42131 - PLACE
      ?auto_42120 - HOIST
      ?auto_42126 - SURFACE
      ?auto_42121 - SURFACE
      ?auto_42124 - PLACE
      ?auto_42122 - HOIST
      ?auto_42133 - SURFACE
      ?auto_42125 - SURFACE
      ?auto_42123 - TRUCK
      ?auto_42134 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42129 ?auto_42132 ) ( IS-CRATE ?auto_42117 ) ( not ( = ?auto_42117 ?auto_42118 ) ) ( not ( = ?auto_42119 ?auto_42132 ) ) ( HOIST-AT ?auto_42130 ?auto_42119 ) ( not ( = ?auto_42129 ?auto_42130 ) ) ( SURFACE-AT ?auto_42117 ?auto_42119 ) ( ON ?auto_42117 ?auto_42128 ) ( CLEAR ?auto_42117 ) ( not ( = ?auto_42117 ?auto_42128 ) ) ( not ( = ?auto_42118 ?auto_42128 ) ) ( IS-CRATE ?auto_42118 ) ( not ( = ?auto_42117 ?auto_42127 ) ) ( not ( = ?auto_42118 ?auto_42127 ) ) ( not ( = ?auto_42128 ?auto_42127 ) ) ( not ( = ?auto_42131 ?auto_42132 ) ) ( not ( = ?auto_42119 ?auto_42131 ) ) ( HOIST-AT ?auto_42120 ?auto_42131 ) ( not ( = ?auto_42129 ?auto_42120 ) ) ( not ( = ?auto_42130 ?auto_42120 ) ) ( AVAILABLE ?auto_42120 ) ( SURFACE-AT ?auto_42118 ?auto_42131 ) ( ON ?auto_42118 ?auto_42126 ) ( CLEAR ?auto_42118 ) ( not ( = ?auto_42117 ?auto_42126 ) ) ( not ( = ?auto_42118 ?auto_42126 ) ) ( not ( = ?auto_42128 ?auto_42126 ) ) ( not ( = ?auto_42127 ?auto_42126 ) ) ( IS-CRATE ?auto_42127 ) ( not ( = ?auto_42117 ?auto_42121 ) ) ( not ( = ?auto_42118 ?auto_42121 ) ) ( not ( = ?auto_42128 ?auto_42121 ) ) ( not ( = ?auto_42127 ?auto_42121 ) ) ( not ( = ?auto_42126 ?auto_42121 ) ) ( not ( = ?auto_42124 ?auto_42132 ) ) ( not ( = ?auto_42119 ?auto_42124 ) ) ( not ( = ?auto_42131 ?auto_42124 ) ) ( HOIST-AT ?auto_42122 ?auto_42124 ) ( not ( = ?auto_42129 ?auto_42122 ) ) ( not ( = ?auto_42130 ?auto_42122 ) ) ( not ( = ?auto_42120 ?auto_42122 ) ) ( AVAILABLE ?auto_42122 ) ( SURFACE-AT ?auto_42127 ?auto_42124 ) ( ON ?auto_42127 ?auto_42133 ) ( CLEAR ?auto_42127 ) ( not ( = ?auto_42117 ?auto_42133 ) ) ( not ( = ?auto_42118 ?auto_42133 ) ) ( not ( = ?auto_42128 ?auto_42133 ) ) ( not ( = ?auto_42127 ?auto_42133 ) ) ( not ( = ?auto_42126 ?auto_42133 ) ) ( not ( = ?auto_42121 ?auto_42133 ) ) ( SURFACE-AT ?auto_42125 ?auto_42132 ) ( CLEAR ?auto_42125 ) ( IS-CRATE ?auto_42121 ) ( not ( = ?auto_42117 ?auto_42125 ) ) ( not ( = ?auto_42118 ?auto_42125 ) ) ( not ( = ?auto_42128 ?auto_42125 ) ) ( not ( = ?auto_42127 ?auto_42125 ) ) ( not ( = ?auto_42126 ?auto_42125 ) ) ( not ( = ?auto_42121 ?auto_42125 ) ) ( not ( = ?auto_42133 ?auto_42125 ) ) ( AVAILABLE ?auto_42129 ) ( TRUCK-AT ?auto_42123 ?auto_42119 ) ( AVAILABLE ?auto_42130 ) ( SURFACE-AT ?auto_42121 ?auto_42119 ) ( ON ?auto_42121 ?auto_42134 ) ( CLEAR ?auto_42121 ) ( not ( = ?auto_42117 ?auto_42134 ) ) ( not ( = ?auto_42118 ?auto_42134 ) ) ( not ( = ?auto_42128 ?auto_42134 ) ) ( not ( = ?auto_42127 ?auto_42134 ) ) ( not ( = ?auto_42126 ?auto_42134 ) ) ( not ( = ?auto_42121 ?auto_42134 ) ) ( not ( = ?auto_42133 ?auto_42134 ) ) ( not ( = ?auto_42125 ?auto_42134 ) ) )
    :subtasks
    ( ( !LIFT ?auto_42130 ?auto_42121 ?auto_42134 ?auto_42119 )
      ( MAKE-ON ?auto_42117 ?auto_42118 )
      ( MAKE-ON-VERIFY ?auto_42117 ?auto_42118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42135 - SURFACE
      ?auto_42136 - SURFACE
    )
    :vars
    (
      ?auto_42138 - HOIST
      ?auto_42150 - PLACE
      ?auto_42148 - PLACE
      ?auto_42151 - HOIST
      ?auto_42137 - SURFACE
      ?auto_42152 - SURFACE
      ?auto_42149 - PLACE
      ?auto_42145 - HOIST
      ?auto_42140 - SURFACE
      ?auto_42139 - SURFACE
      ?auto_42141 - PLACE
      ?auto_42146 - HOIST
      ?auto_42142 - SURFACE
      ?auto_42144 - SURFACE
      ?auto_42143 - SURFACE
      ?auto_42147 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42138 ?auto_42150 ) ( IS-CRATE ?auto_42135 ) ( not ( = ?auto_42135 ?auto_42136 ) ) ( not ( = ?auto_42148 ?auto_42150 ) ) ( HOIST-AT ?auto_42151 ?auto_42148 ) ( not ( = ?auto_42138 ?auto_42151 ) ) ( SURFACE-AT ?auto_42135 ?auto_42148 ) ( ON ?auto_42135 ?auto_42137 ) ( CLEAR ?auto_42135 ) ( not ( = ?auto_42135 ?auto_42137 ) ) ( not ( = ?auto_42136 ?auto_42137 ) ) ( IS-CRATE ?auto_42136 ) ( not ( = ?auto_42135 ?auto_42152 ) ) ( not ( = ?auto_42136 ?auto_42152 ) ) ( not ( = ?auto_42137 ?auto_42152 ) ) ( not ( = ?auto_42149 ?auto_42150 ) ) ( not ( = ?auto_42148 ?auto_42149 ) ) ( HOIST-AT ?auto_42145 ?auto_42149 ) ( not ( = ?auto_42138 ?auto_42145 ) ) ( not ( = ?auto_42151 ?auto_42145 ) ) ( AVAILABLE ?auto_42145 ) ( SURFACE-AT ?auto_42136 ?auto_42149 ) ( ON ?auto_42136 ?auto_42140 ) ( CLEAR ?auto_42136 ) ( not ( = ?auto_42135 ?auto_42140 ) ) ( not ( = ?auto_42136 ?auto_42140 ) ) ( not ( = ?auto_42137 ?auto_42140 ) ) ( not ( = ?auto_42152 ?auto_42140 ) ) ( IS-CRATE ?auto_42152 ) ( not ( = ?auto_42135 ?auto_42139 ) ) ( not ( = ?auto_42136 ?auto_42139 ) ) ( not ( = ?auto_42137 ?auto_42139 ) ) ( not ( = ?auto_42152 ?auto_42139 ) ) ( not ( = ?auto_42140 ?auto_42139 ) ) ( not ( = ?auto_42141 ?auto_42150 ) ) ( not ( = ?auto_42148 ?auto_42141 ) ) ( not ( = ?auto_42149 ?auto_42141 ) ) ( HOIST-AT ?auto_42146 ?auto_42141 ) ( not ( = ?auto_42138 ?auto_42146 ) ) ( not ( = ?auto_42151 ?auto_42146 ) ) ( not ( = ?auto_42145 ?auto_42146 ) ) ( AVAILABLE ?auto_42146 ) ( SURFACE-AT ?auto_42152 ?auto_42141 ) ( ON ?auto_42152 ?auto_42142 ) ( CLEAR ?auto_42152 ) ( not ( = ?auto_42135 ?auto_42142 ) ) ( not ( = ?auto_42136 ?auto_42142 ) ) ( not ( = ?auto_42137 ?auto_42142 ) ) ( not ( = ?auto_42152 ?auto_42142 ) ) ( not ( = ?auto_42140 ?auto_42142 ) ) ( not ( = ?auto_42139 ?auto_42142 ) ) ( SURFACE-AT ?auto_42144 ?auto_42150 ) ( CLEAR ?auto_42144 ) ( IS-CRATE ?auto_42139 ) ( not ( = ?auto_42135 ?auto_42144 ) ) ( not ( = ?auto_42136 ?auto_42144 ) ) ( not ( = ?auto_42137 ?auto_42144 ) ) ( not ( = ?auto_42152 ?auto_42144 ) ) ( not ( = ?auto_42140 ?auto_42144 ) ) ( not ( = ?auto_42139 ?auto_42144 ) ) ( not ( = ?auto_42142 ?auto_42144 ) ) ( AVAILABLE ?auto_42138 ) ( AVAILABLE ?auto_42151 ) ( SURFACE-AT ?auto_42139 ?auto_42148 ) ( ON ?auto_42139 ?auto_42143 ) ( CLEAR ?auto_42139 ) ( not ( = ?auto_42135 ?auto_42143 ) ) ( not ( = ?auto_42136 ?auto_42143 ) ) ( not ( = ?auto_42137 ?auto_42143 ) ) ( not ( = ?auto_42152 ?auto_42143 ) ) ( not ( = ?auto_42140 ?auto_42143 ) ) ( not ( = ?auto_42139 ?auto_42143 ) ) ( not ( = ?auto_42142 ?auto_42143 ) ) ( not ( = ?auto_42144 ?auto_42143 ) ) ( TRUCK-AT ?auto_42147 ?auto_42150 ) )
    :subtasks
    ( ( !DRIVE ?auto_42147 ?auto_42150 ?auto_42148 )
      ( MAKE-ON ?auto_42135 ?auto_42136 )
      ( MAKE-ON-VERIFY ?auto_42135 ?auto_42136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42153 - SURFACE
      ?auto_42154 - SURFACE
    )
    :vars
    (
      ?auto_42157 - HOIST
      ?auto_42164 - PLACE
      ?auto_42156 - PLACE
      ?auto_42158 - HOIST
      ?auto_42165 - SURFACE
      ?auto_42168 - SURFACE
      ?auto_42160 - PLACE
      ?auto_42162 - HOIST
      ?auto_42167 - SURFACE
      ?auto_42163 - SURFACE
      ?auto_42170 - PLACE
      ?auto_42159 - HOIST
      ?auto_42155 - SURFACE
      ?auto_42161 - SURFACE
      ?auto_42166 - SURFACE
      ?auto_42169 - TRUCK
      ?auto_42171 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42157 ?auto_42164 ) ( IS-CRATE ?auto_42153 ) ( not ( = ?auto_42153 ?auto_42154 ) ) ( not ( = ?auto_42156 ?auto_42164 ) ) ( HOIST-AT ?auto_42158 ?auto_42156 ) ( not ( = ?auto_42157 ?auto_42158 ) ) ( SURFACE-AT ?auto_42153 ?auto_42156 ) ( ON ?auto_42153 ?auto_42165 ) ( CLEAR ?auto_42153 ) ( not ( = ?auto_42153 ?auto_42165 ) ) ( not ( = ?auto_42154 ?auto_42165 ) ) ( IS-CRATE ?auto_42154 ) ( not ( = ?auto_42153 ?auto_42168 ) ) ( not ( = ?auto_42154 ?auto_42168 ) ) ( not ( = ?auto_42165 ?auto_42168 ) ) ( not ( = ?auto_42160 ?auto_42164 ) ) ( not ( = ?auto_42156 ?auto_42160 ) ) ( HOIST-AT ?auto_42162 ?auto_42160 ) ( not ( = ?auto_42157 ?auto_42162 ) ) ( not ( = ?auto_42158 ?auto_42162 ) ) ( AVAILABLE ?auto_42162 ) ( SURFACE-AT ?auto_42154 ?auto_42160 ) ( ON ?auto_42154 ?auto_42167 ) ( CLEAR ?auto_42154 ) ( not ( = ?auto_42153 ?auto_42167 ) ) ( not ( = ?auto_42154 ?auto_42167 ) ) ( not ( = ?auto_42165 ?auto_42167 ) ) ( not ( = ?auto_42168 ?auto_42167 ) ) ( IS-CRATE ?auto_42168 ) ( not ( = ?auto_42153 ?auto_42163 ) ) ( not ( = ?auto_42154 ?auto_42163 ) ) ( not ( = ?auto_42165 ?auto_42163 ) ) ( not ( = ?auto_42168 ?auto_42163 ) ) ( not ( = ?auto_42167 ?auto_42163 ) ) ( not ( = ?auto_42170 ?auto_42164 ) ) ( not ( = ?auto_42156 ?auto_42170 ) ) ( not ( = ?auto_42160 ?auto_42170 ) ) ( HOIST-AT ?auto_42159 ?auto_42170 ) ( not ( = ?auto_42157 ?auto_42159 ) ) ( not ( = ?auto_42158 ?auto_42159 ) ) ( not ( = ?auto_42162 ?auto_42159 ) ) ( AVAILABLE ?auto_42159 ) ( SURFACE-AT ?auto_42168 ?auto_42170 ) ( ON ?auto_42168 ?auto_42155 ) ( CLEAR ?auto_42168 ) ( not ( = ?auto_42153 ?auto_42155 ) ) ( not ( = ?auto_42154 ?auto_42155 ) ) ( not ( = ?auto_42165 ?auto_42155 ) ) ( not ( = ?auto_42168 ?auto_42155 ) ) ( not ( = ?auto_42167 ?auto_42155 ) ) ( not ( = ?auto_42163 ?auto_42155 ) ) ( IS-CRATE ?auto_42163 ) ( not ( = ?auto_42153 ?auto_42161 ) ) ( not ( = ?auto_42154 ?auto_42161 ) ) ( not ( = ?auto_42165 ?auto_42161 ) ) ( not ( = ?auto_42168 ?auto_42161 ) ) ( not ( = ?auto_42167 ?auto_42161 ) ) ( not ( = ?auto_42163 ?auto_42161 ) ) ( not ( = ?auto_42155 ?auto_42161 ) ) ( AVAILABLE ?auto_42158 ) ( SURFACE-AT ?auto_42163 ?auto_42156 ) ( ON ?auto_42163 ?auto_42166 ) ( CLEAR ?auto_42163 ) ( not ( = ?auto_42153 ?auto_42166 ) ) ( not ( = ?auto_42154 ?auto_42166 ) ) ( not ( = ?auto_42165 ?auto_42166 ) ) ( not ( = ?auto_42168 ?auto_42166 ) ) ( not ( = ?auto_42167 ?auto_42166 ) ) ( not ( = ?auto_42163 ?auto_42166 ) ) ( not ( = ?auto_42155 ?auto_42166 ) ) ( not ( = ?auto_42161 ?auto_42166 ) ) ( TRUCK-AT ?auto_42169 ?auto_42164 ) ( SURFACE-AT ?auto_42171 ?auto_42164 ) ( CLEAR ?auto_42171 ) ( LIFTING ?auto_42157 ?auto_42161 ) ( IS-CRATE ?auto_42161 ) ( not ( = ?auto_42153 ?auto_42171 ) ) ( not ( = ?auto_42154 ?auto_42171 ) ) ( not ( = ?auto_42165 ?auto_42171 ) ) ( not ( = ?auto_42168 ?auto_42171 ) ) ( not ( = ?auto_42167 ?auto_42171 ) ) ( not ( = ?auto_42163 ?auto_42171 ) ) ( not ( = ?auto_42155 ?auto_42171 ) ) ( not ( = ?auto_42161 ?auto_42171 ) ) ( not ( = ?auto_42166 ?auto_42171 ) ) )
    :subtasks
    ( ( !DROP ?auto_42157 ?auto_42161 ?auto_42171 ?auto_42164 )
      ( MAKE-ON ?auto_42153 ?auto_42154 )
      ( MAKE-ON-VERIFY ?auto_42153 ?auto_42154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42172 - SURFACE
      ?auto_42173 - SURFACE
    )
    :vars
    (
      ?auto_42182 - HOIST
      ?auto_42186 - PLACE
      ?auto_42181 - PLACE
      ?auto_42175 - HOIST
      ?auto_42177 - SURFACE
      ?auto_42176 - SURFACE
      ?auto_42180 - PLACE
      ?auto_42178 - HOIST
      ?auto_42188 - SURFACE
      ?auto_42184 - SURFACE
      ?auto_42189 - PLACE
      ?auto_42174 - HOIST
      ?auto_42185 - SURFACE
      ?auto_42190 - SURFACE
      ?auto_42179 - SURFACE
      ?auto_42187 - TRUCK
      ?auto_42183 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42182 ?auto_42186 ) ( IS-CRATE ?auto_42172 ) ( not ( = ?auto_42172 ?auto_42173 ) ) ( not ( = ?auto_42181 ?auto_42186 ) ) ( HOIST-AT ?auto_42175 ?auto_42181 ) ( not ( = ?auto_42182 ?auto_42175 ) ) ( SURFACE-AT ?auto_42172 ?auto_42181 ) ( ON ?auto_42172 ?auto_42177 ) ( CLEAR ?auto_42172 ) ( not ( = ?auto_42172 ?auto_42177 ) ) ( not ( = ?auto_42173 ?auto_42177 ) ) ( IS-CRATE ?auto_42173 ) ( not ( = ?auto_42172 ?auto_42176 ) ) ( not ( = ?auto_42173 ?auto_42176 ) ) ( not ( = ?auto_42177 ?auto_42176 ) ) ( not ( = ?auto_42180 ?auto_42186 ) ) ( not ( = ?auto_42181 ?auto_42180 ) ) ( HOIST-AT ?auto_42178 ?auto_42180 ) ( not ( = ?auto_42182 ?auto_42178 ) ) ( not ( = ?auto_42175 ?auto_42178 ) ) ( AVAILABLE ?auto_42178 ) ( SURFACE-AT ?auto_42173 ?auto_42180 ) ( ON ?auto_42173 ?auto_42188 ) ( CLEAR ?auto_42173 ) ( not ( = ?auto_42172 ?auto_42188 ) ) ( not ( = ?auto_42173 ?auto_42188 ) ) ( not ( = ?auto_42177 ?auto_42188 ) ) ( not ( = ?auto_42176 ?auto_42188 ) ) ( IS-CRATE ?auto_42176 ) ( not ( = ?auto_42172 ?auto_42184 ) ) ( not ( = ?auto_42173 ?auto_42184 ) ) ( not ( = ?auto_42177 ?auto_42184 ) ) ( not ( = ?auto_42176 ?auto_42184 ) ) ( not ( = ?auto_42188 ?auto_42184 ) ) ( not ( = ?auto_42189 ?auto_42186 ) ) ( not ( = ?auto_42181 ?auto_42189 ) ) ( not ( = ?auto_42180 ?auto_42189 ) ) ( HOIST-AT ?auto_42174 ?auto_42189 ) ( not ( = ?auto_42182 ?auto_42174 ) ) ( not ( = ?auto_42175 ?auto_42174 ) ) ( not ( = ?auto_42178 ?auto_42174 ) ) ( AVAILABLE ?auto_42174 ) ( SURFACE-AT ?auto_42176 ?auto_42189 ) ( ON ?auto_42176 ?auto_42185 ) ( CLEAR ?auto_42176 ) ( not ( = ?auto_42172 ?auto_42185 ) ) ( not ( = ?auto_42173 ?auto_42185 ) ) ( not ( = ?auto_42177 ?auto_42185 ) ) ( not ( = ?auto_42176 ?auto_42185 ) ) ( not ( = ?auto_42188 ?auto_42185 ) ) ( not ( = ?auto_42184 ?auto_42185 ) ) ( IS-CRATE ?auto_42184 ) ( not ( = ?auto_42172 ?auto_42190 ) ) ( not ( = ?auto_42173 ?auto_42190 ) ) ( not ( = ?auto_42177 ?auto_42190 ) ) ( not ( = ?auto_42176 ?auto_42190 ) ) ( not ( = ?auto_42188 ?auto_42190 ) ) ( not ( = ?auto_42184 ?auto_42190 ) ) ( not ( = ?auto_42185 ?auto_42190 ) ) ( AVAILABLE ?auto_42175 ) ( SURFACE-AT ?auto_42184 ?auto_42181 ) ( ON ?auto_42184 ?auto_42179 ) ( CLEAR ?auto_42184 ) ( not ( = ?auto_42172 ?auto_42179 ) ) ( not ( = ?auto_42173 ?auto_42179 ) ) ( not ( = ?auto_42177 ?auto_42179 ) ) ( not ( = ?auto_42176 ?auto_42179 ) ) ( not ( = ?auto_42188 ?auto_42179 ) ) ( not ( = ?auto_42184 ?auto_42179 ) ) ( not ( = ?auto_42185 ?auto_42179 ) ) ( not ( = ?auto_42190 ?auto_42179 ) ) ( TRUCK-AT ?auto_42187 ?auto_42186 ) ( SURFACE-AT ?auto_42183 ?auto_42186 ) ( CLEAR ?auto_42183 ) ( IS-CRATE ?auto_42190 ) ( not ( = ?auto_42172 ?auto_42183 ) ) ( not ( = ?auto_42173 ?auto_42183 ) ) ( not ( = ?auto_42177 ?auto_42183 ) ) ( not ( = ?auto_42176 ?auto_42183 ) ) ( not ( = ?auto_42188 ?auto_42183 ) ) ( not ( = ?auto_42184 ?auto_42183 ) ) ( not ( = ?auto_42185 ?auto_42183 ) ) ( not ( = ?auto_42190 ?auto_42183 ) ) ( not ( = ?auto_42179 ?auto_42183 ) ) ( AVAILABLE ?auto_42182 ) ( IN ?auto_42190 ?auto_42187 ) )
    :subtasks
    ( ( !UNLOAD ?auto_42182 ?auto_42190 ?auto_42187 ?auto_42186 )
      ( MAKE-ON ?auto_42172 ?auto_42173 )
      ( MAKE-ON-VERIFY ?auto_42172 ?auto_42173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42191 - SURFACE
      ?auto_42192 - SURFACE
    )
    :vars
    (
      ?auto_42204 - HOIST
      ?auto_42203 - PLACE
      ?auto_42195 - PLACE
      ?auto_42199 - HOIST
      ?auto_42193 - SURFACE
      ?auto_42206 - SURFACE
      ?auto_42207 - PLACE
      ?auto_42201 - HOIST
      ?auto_42209 - SURFACE
      ?auto_42197 - SURFACE
      ?auto_42202 - PLACE
      ?auto_42208 - HOIST
      ?auto_42205 - SURFACE
      ?auto_42196 - SURFACE
      ?auto_42198 - SURFACE
      ?auto_42194 - SURFACE
      ?auto_42200 - TRUCK
      ?auto_42210 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42204 ?auto_42203 ) ( IS-CRATE ?auto_42191 ) ( not ( = ?auto_42191 ?auto_42192 ) ) ( not ( = ?auto_42195 ?auto_42203 ) ) ( HOIST-AT ?auto_42199 ?auto_42195 ) ( not ( = ?auto_42204 ?auto_42199 ) ) ( SURFACE-AT ?auto_42191 ?auto_42195 ) ( ON ?auto_42191 ?auto_42193 ) ( CLEAR ?auto_42191 ) ( not ( = ?auto_42191 ?auto_42193 ) ) ( not ( = ?auto_42192 ?auto_42193 ) ) ( IS-CRATE ?auto_42192 ) ( not ( = ?auto_42191 ?auto_42206 ) ) ( not ( = ?auto_42192 ?auto_42206 ) ) ( not ( = ?auto_42193 ?auto_42206 ) ) ( not ( = ?auto_42207 ?auto_42203 ) ) ( not ( = ?auto_42195 ?auto_42207 ) ) ( HOIST-AT ?auto_42201 ?auto_42207 ) ( not ( = ?auto_42204 ?auto_42201 ) ) ( not ( = ?auto_42199 ?auto_42201 ) ) ( AVAILABLE ?auto_42201 ) ( SURFACE-AT ?auto_42192 ?auto_42207 ) ( ON ?auto_42192 ?auto_42209 ) ( CLEAR ?auto_42192 ) ( not ( = ?auto_42191 ?auto_42209 ) ) ( not ( = ?auto_42192 ?auto_42209 ) ) ( not ( = ?auto_42193 ?auto_42209 ) ) ( not ( = ?auto_42206 ?auto_42209 ) ) ( IS-CRATE ?auto_42206 ) ( not ( = ?auto_42191 ?auto_42197 ) ) ( not ( = ?auto_42192 ?auto_42197 ) ) ( not ( = ?auto_42193 ?auto_42197 ) ) ( not ( = ?auto_42206 ?auto_42197 ) ) ( not ( = ?auto_42209 ?auto_42197 ) ) ( not ( = ?auto_42202 ?auto_42203 ) ) ( not ( = ?auto_42195 ?auto_42202 ) ) ( not ( = ?auto_42207 ?auto_42202 ) ) ( HOIST-AT ?auto_42208 ?auto_42202 ) ( not ( = ?auto_42204 ?auto_42208 ) ) ( not ( = ?auto_42199 ?auto_42208 ) ) ( not ( = ?auto_42201 ?auto_42208 ) ) ( AVAILABLE ?auto_42208 ) ( SURFACE-AT ?auto_42206 ?auto_42202 ) ( ON ?auto_42206 ?auto_42205 ) ( CLEAR ?auto_42206 ) ( not ( = ?auto_42191 ?auto_42205 ) ) ( not ( = ?auto_42192 ?auto_42205 ) ) ( not ( = ?auto_42193 ?auto_42205 ) ) ( not ( = ?auto_42206 ?auto_42205 ) ) ( not ( = ?auto_42209 ?auto_42205 ) ) ( not ( = ?auto_42197 ?auto_42205 ) ) ( IS-CRATE ?auto_42197 ) ( not ( = ?auto_42191 ?auto_42196 ) ) ( not ( = ?auto_42192 ?auto_42196 ) ) ( not ( = ?auto_42193 ?auto_42196 ) ) ( not ( = ?auto_42206 ?auto_42196 ) ) ( not ( = ?auto_42209 ?auto_42196 ) ) ( not ( = ?auto_42197 ?auto_42196 ) ) ( not ( = ?auto_42205 ?auto_42196 ) ) ( AVAILABLE ?auto_42199 ) ( SURFACE-AT ?auto_42197 ?auto_42195 ) ( ON ?auto_42197 ?auto_42198 ) ( CLEAR ?auto_42197 ) ( not ( = ?auto_42191 ?auto_42198 ) ) ( not ( = ?auto_42192 ?auto_42198 ) ) ( not ( = ?auto_42193 ?auto_42198 ) ) ( not ( = ?auto_42206 ?auto_42198 ) ) ( not ( = ?auto_42209 ?auto_42198 ) ) ( not ( = ?auto_42197 ?auto_42198 ) ) ( not ( = ?auto_42205 ?auto_42198 ) ) ( not ( = ?auto_42196 ?auto_42198 ) ) ( SURFACE-AT ?auto_42194 ?auto_42203 ) ( CLEAR ?auto_42194 ) ( IS-CRATE ?auto_42196 ) ( not ( = ?auto_42191 ?auto_42194 ) ) ( not ( = ?auto_42192 ?auto_42194 ) ) ( not ( = ?auto_42193 ?auto_42194 ) ) ( not ( = ?auto_42206 ?auto_42194 ) ) ( not ( = ?auto_42209 ?auto_42194 ) ) ( not ( = ?auto_42197 ?auto_42194 ) ) ( not ( = ?auto_42205 ?auto_42194 ) ) ( not ( = ?auto_42196 ?auto_42194 ) ) ( not ( = ?auto_42198 ?auto_42194 ) ) ( AVAILABLE ?auto_42204 ) ( IN ?auto_42196 ?auto_42200 ) ( TRUCK-AT ?auto_42200 ?auto_42210 ) ( not ( = ?auto_42210 ?auto_42203 ) ) ( not ( = ?auto_42195 ?auto_42210 ) ) ( not ( = ?auto_42207 ?auto_42210 ) ) ( not ( = ?auto_42202 ?auto_42210 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_42200 ?auto_42210 ?auto_42203 )
      ( MAKE-ON ?auto_42191 ?auto_42192 )
      ( MAKE-ON-VERIFY ?auto_42191 ?auto_42192 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42211 - SURFACE
      ?auto_42212 - SURFACE
    )
    :vars
    (
      ?auto_42226 - HOIST
      ?auto_42218 - PLACE
      ?auto_42222 - PLACE
      ?auto_42229 - HOIST
      ?auto_42215 - SURFACE
      ?auto_42221 - SURFACE
      ?auto_42228 - PLACE
      ?auto_42220 - HOIST
      ?auto_42223 - SURFACE
      ?auto_42213 - SURFACE
      ?auto_42227 - PLACE
      ?auto_42216 - HOIST
      ?auto_42224 - SURFACE
      ?auto_42214 - SURFACE
      ?auto_42217 - SURFACE
      ?auto_42225 - SURFACE
      ?auto_42219 - TRUCK
      ?auto_42230 - PLACE
      ?auto_42231 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_42226 ?auto_42218 ) ( IS-CRATE ?auto_42211 ) ( not ( = ?auto_42211 ?auto_42212 ) ) ( not ( = ?auto_42222 ?auto_42218 ) ) ( HOIST-AT ?auto_42229 ?auto_42222 ) ( not ( = ?auto_42226 ?auto_42229 ) ) ( SURFACE-AT ?auto_42211 ?auto_42222 ) ( ON ?auto_42211 ?auto_42215 ) ( CLEAR ?auto_42211 ) ( not ( = ?auto_42211 ?auto_42215 ) ) ( not ( = ?auto_42212 ?auto_42215 ) ) ( IS-CRATE ?auto_42212 ) ( not ( = ?auto_42211 ?auto_42221 ) ) ( not ( = ?auto_42212 ?auto_42221 ) ) ( not ( = ?auto_42215 ?auto_42221 ) ) ( not ( = ?auto_42228 ?auto_42218 ) ) ( not ( = ?auto_42222 ?auto_42228 ) ) ( HOIST-AT ?auto_42220 ?auto_42228 ) ( not ( = ?auto_42226 ?auto_42220 ) ) ( not ( = ?auto_42229 ?auto_42220 ) ) ( AVAILABLE ?auto_42220 ) ( SURFACE-AT ?auto_42212 ?auto_42228 ) ( ON ?auto_42212 ?auto_42223 ) ( CLEAR ?auto_42212 ) ( not ( = ?auto_42211 ?auto_42223 ) ) ( not ( = ?auto_42212 ?auto_42223 ) ) ( not ( = ?auto_42215 ?auto_42223 ) ) ( not ( = ?auto_42221 ?auto_42223 ) ) ( IS-CRATE ?auto_42221 ) ( not ( = ?auto_42211 ?auto_42213 ) ) ( not ( = ?auto_42212 ?auto_42213 ) ) ( not ( = ?auto_42215 ?auto_42213 ) ) ( not ( = ?auto_42221 ?auto_42213 ) ) ( not ( = ?auto_42223 ?auto_42213 ) ) ( not ( = ?auto_42227 ?auto_42218 ) ) ( not ( = ?auto_42222 ?auto_42227 ) ) ( not ( = ?auto_42228 ?auto_42227 ) ) ( HOIST-AT ?auto_42216 ?auto_42227 ) ( not ( = ?auto_42226 ?auto_42216 ) ) ( not ( = ?auto_42229 ?auto_42216 ) ) ( not ( = ?auto_42220 ?auto_42216 ) ) ( AVAILABLE ?auto_42216 ) ( SURFACE-AT ?auto_42221 ?auto_42227 ) ( ON ?auto_42221 ?auto_42224 ) ( CLEAR ?auto_42221 ) ( not ( = ?auto_42211 ?auto_42224 ) ) ( not ( = ?auto_42212 ?auto_42224 ) ) ( not ( = ?auto_42215 ?auto_42224 ) ) ( not ( = ?auto_42221 ?auto_42224 ) ) ( not ( = ?auto_42223 ?auto_42224 ) ) ( not ( = ?auto_42213 ?auto_42224 ) ) ( IS-CRATE ?auto_42213 ) ( not ( = ?auto_42211 ?auto_42214 ) ) ( not ( = ?auto_42212 ?auto_42214 ) ) ( not ( = ?auto_42215 ?auto_42214 ) ) ( not ( = ?auto_42221 ?auto_42214 ) ) ( not ( = ?auto_42223 ?auto_42214 ) ) ( not ( = ?auto_42213 ?auto_42214 ) ) ( not ( = ?auto_42224 ?auto_42214 ) ) ( AVAILABLE ?auto_42229 ) ( SURFACE-AT ?auto_42213 ?auto_42222 ) ( ON ?auto_42213 ?auto_42217 ) ( CLEAR ?auto_42213 ) ( not ( = ?auto_42211 ?auto_42217 ) ) ( not ( = ?auto_42212 ?auto_42217 ) ) ( not ( = ?auto_42215 ?auto_42217 ) ) ( not ( = ?auto_42221 ?auto_42217 ) ) ( not ( = ?auto_42223 ?auto_42217 ) ) ( not ( = ?auto_42213 ?auto_42217 ) ) ( not ( = ?auto_42224 ?auto_42217 ) ) ( not ( = ?auto_42214 ?auto_42217 ) ) ( SURFACE-AT ?auto_42225 ?auto_42218 ) ( CLEAR ?auto_42225 ) ( IS-CRATE ?auto_42214 ) ( not ( = ?auto_42211 ?auto_42225 ) ) ( not ( = ?auto_42212 ?auto_42225 ) ) ( not ( = ?auto_42215 ?auto_42225 ) ) ( not ( = ?auto_42221 ?auto_42225 ) ) ( not ( = ?auto_42223 ?auto_42225 ) ) ( not ( = ?auto_42213 ?auto_42225 ) ) ( not ( = ?auto_42224 ?auto_42225 ) ) ( not ( = ?auto_42214 ?auto_42225 ) ) ( not ( = ?auto_42217 ?auto_42225 ) ) ( AVAILABLE ?auto_42226 ) ( TRUCK-AT ?auto_42219 ?auto_42230 ) ( not ( = ?auto_42230 ?auto_42218 ) ) ( not ( = ?auto_42222 ?auto_42230 ) ) ( not ( = ?auto_42228 ?auto_42230 ) ) ( not ( = ?auto_42227 ?auto_42230 ) ) ( HOIST-AT ?auto_42231 ?auto_42230 ) ( LIFTING ?auto_42231 ?auto_42214 ) ( not ( = ?auto_42226 ?auto_42231 ) ) ( not ( = ?auto_42229 ?auto_42231 ) ) ( not ( = ?auto_42220 ?auto_42231 ) ) ( not ( = ?auto_42216 ?auto_42231 ) ) )
    :subtasks
    ( ( !LOAD ?auto_42231 ?auto_42214 ?auto_42219 ?auto_42230 )
      ( MAKE-ON ?auto_42211 ?auto_42212 )
      ( MAKE-ON-VERIFY ?auto_42211 ?auto_42212 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42232 - SURFACE
      ?auto_42233 - SURFACE
    )
    :vars
    (
      ?auto_42246 - HOIST
      ?auto_42238 - PLACE
      ?auto_42247 - PLACE
      ?auto_42237 - HOIST
      ?auto_42249 - SURFACE
      ?auto_42243 - SURFACE
      ?auto_42251 - PLACE
      ?auto_42245 - HOIST
      ?auto_42252 - SURFACE
      ?auto_42234 - SURFACE
      ?auto_42244 - PLACE
      ?auto_42250 - HOIST
      ?auto_42240 - SURFACE
      ?auto_42239 - SURFACE
      ?auto_42235 - SURFACE
      ?auto_42248 - SURFACE
      ?auto_42242 - TRUCK
      ?auto_42236 - PLACE
      ?auto_42241 - HOIST
      ?auto_42253 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42246 ?auto_42238 ) ( IS-CRATE ?auto_42232 ) ( not ( = ?auto_42232 ?auto_42233 ) ) ( not ( = ?auto_42247 ?auto_42238 ) ) ( HOIST-AT ?auto_42237 ?auto_42247 ) ( not ( = ?auto_42246 ?auto_42237 ) ) ( SURFACE-AT ?auto_42232 ?auto_42247 ) ( ON ?auto_42232 ?auto_42249 ) ( CLEAR ?auto_42232 ) ( not ( = ?auto_42232 ?auto_42249 ) ) ( not ( = ?auto_42233 ?auto_42249 ) ) ( IS-CRATE ?auto_42233 ) ( not ( = ?auto_42232 ?auto_42243 ) ) ( not ( = ?auto_42233 ?auto_42243 ) ) ( not ( = ?auto_42249 ?auto_42243 ) ) ( not ( = ?auto_42251 ?auto_42238 ) ) ( not ( = ?auto_42247 ?auto_42251 ) ) ( HOIST-AT ?auto_42245 ?auto_42251 ) ( not ( = ?auto_42246 ?auto_42245 ) ) ( not ( = ?auto_42237 ?auto_42245 ) ) ( AVAILABLE ?auto_42245 ) ( SURFACE-AT ?auto_42233 ?auto_42251 ) ( ON ?auto_42233 ?auto_42252 ) ( CLEAR ?auto_42233 ) ( not ( = ?auto_42232 ?auto_42252 ) ) ( not ( = ?auto_42233 ?auto_42252 ) ) ( not ( = ?auto_42249 ?auto_42252 ) ) ( not ( = ?auto_42243 ?auto_42252 ) ) ( IS-CRATE ?auto_42243 ) ( not ( = ?auto_42232 ?auto_42234 ) ) ( not ( = ?auto_42233 ?auto_42234 ) ) ( not ( = ?auto_42249 ?auto_42234 ) ) ( not ( = ?auto_42243 ?auto_42234 ) ) ( not ( = ?auto_42252 ?auto_42234 ) ) ( not ( = ?auto_42244 ?auto_42238 ) ) ( not ( = ?auto_42247 ?auto_42244 ) ) ( not ( = ?auto_42251 ?auto_42244 ) ) ( HOIST-AT ?auto_42250 ?auto_42244 ) ( not ( = ?auto_42246 ?auto_42250 ) ) ( not ( = ?auto_42237 ?auto_42250 ) ) ( not ( = ?auto_42245 ?auto_42250 ) ) ( AVAILABLE ?auto_42250 ) ( SURFACE-AT ?auto_42243 ?auto_42244 ) ( ON ?auto_42243 ?auto_42240 ) ( CLEAR ?auto_42243 ) ( not ( = ?auto_42232 ?auto_42240 ) ) ( not ( = ?auto_42233 ?auto_42240 ) ) ( not ( = ?auto_42249 ?auto_42240 ) ) ( not ( = ?auto_42243 ?auto_42240 ) ) ( not ( = ?auto_42252 ?auto_42240 ) ) ( not ( = ?auto_42234 ?auto_42240 ) ) ( IS-CRATE ?auto_42234 ) ( not ( = ?auto_42232 ?auto_42239 ) ) ( not ( = ?auto_42233 ?auto_42239 ) ) ( not ( = ?auto_42249 ?auto_42239 ) ) ( not ( = ?auto_42243 ?auto_42239 ) ) ( not ( = ?auto_42252 ?auto_42239 ) ) ( not ( = ?auto_42234 ?auto_42239 ) ) ( not ( = ?auto_42240 ?auto_42239 ) ) ( AVAILABLE ?auto_42237 ) ( SURFACE-AT ?auto_42234 ?auto_42247 ) ( ON ?auto_42234 ?auto_42235 ) ( CLEAR ?auto_42234 ) ( not ( = ?auto_42232 ?auto_42235 ) ) ( not ( = ?auto_42233 ?auto_42235 ) ) ( not ( = ?auto_42249 ?auto_42235 ) ) ( not ( = ?auto_42243 ?auto_42235 ) ) ( not ( = ?auto_42252 ?auto_42235 ) ) ( not ( = ?auto_42234 ?auto_42235 ) ) ( not ( = ?auto_42240 ?auto_42235 ) ) ( not ( = ?auto_42239 ?auto_42235 ) ) ( SURFACE-AT ?auto_42248 ?auto_42238 ) ( CLEAR ?auto_42248 ) ( IS-CRATE ?auto_42239 ) ( not ( = ?auto_42232 ?auto_42248 ) ) ( not ( = ?auto_42233 ?auto_42248 ) ) ( not ( = ?auto_42249 ?auto_42248 ) ) ( not ( = ?auto_42243 ?auto_42248 ) ) ( not ( = ?auto_42252 ?auto_42248 ) ) ( not ( = ?auto_42234 ?auto_42248 ) ) ( not ( = ?auto_42240 ?auto_42248 ) ) ( not ( = ?auto_42239 ?auto_42248 ) ) ( not ( = ?auto_42235 ?auto_42248 ) ) ( AVAILABLE ?auto_42246 ) ( TRUCK-AT ?auto_42242 ?auto_42236 ) ( not ( = ?auto_42236 ?auto_42238 ) ) ( not ( = ?auto_42247 ?auto_42236 ) ) ( not ( = ?auto_42251 ?auto_42236 ) ) ( not ( = ?auto_42244 ?auto_42236 ) ) ( HOIST-AT ?auto_42241 ?auto_42236 ) ( not ( = ?auto_42246 ?auto_42241 ) ) ( not ( = ?auto_42237 ?auto_42241 ) ) ( not ( = ?auto_42245 ?auto_42241 ) ) ( not ( = ?auto_42250 ?auto_42241 ) ) ( AVAILABLE ?auto_42241 ) ( SURFACE-AT ?auto_42239 ?auto_42236 ) ( ON ?auto_42239 ?auto_42253 ) ( CLEAR ?auto_42239 ) ( not ( = ?auto_42232 ?auto_42253 ) ) ( not ( = ?auto_42233 ?auto_42253 ) ) ( not ( = ?auto_42249 ?auto_42253 ) ) ( not ( = ?auto_42243 ?auto_42253 ) ) ( not ( = ?auto_42252 ?auto_42253 ) ) ( not ( = ?auto_42234 ?auto_42253 ) ) ( not ( = ?auto_42240 ?auto_42253 ) ) ( not ( = ?auto_42239 ?auto_42253 ) ) ( not ( = ?auto_42235 ?auto_42253 ) ) ( not ( = ?auto_42248 ?auto_42253 ) ) )
    :subtasks
    ( ( !LIFT ?auto_42241 ?auto_42239 ?auto_42253 ?auto_42236 )
      ( MAKE-ON ?auto_42232 ?auto_42233 )
      ( MAKE-ON-VERIFY ?auto_42232 ?auto_42233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42254 - SURFACE
      ?auto_42255 - SURFACE
    )
    :vars
    (
      ?auto_42262 - HOIST
      ?auto_42261 - PLACE
      ?auto_42260 - PLACE
      ?auto_42256 - HOIST
      ?auto_42274 - SURFACE
      ?auto_42257 - SURFACE
      ?auto_42258 - PLACE
      ?auto_42266 - HOIST
      ?auto_42271 - SURFACE
      ?auto_42273 - SURFACE
      ?auto_42263 - PLACE
      ?auto_42270 - HOIST
      ?auto_42275 - SURFACE
      ?auto_42264 - SURFACE
      ?auto_42265 - SURFACE
      ?auto_42268 - SURFACE
      ?auto_42267 - PLACE
      ?auto_42259 - HOIST
      ?auto_42269 - SURFACE
      ?auto_42272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42262 ?auto_42261 ) ( IS-CRATE ?auto_42254 ) ( not ( = ?auto_42254 ?auto_42255 ) ) ( not ( = ?auto_42260 ?auto_42261 ) ) ( HOIST-AT ?auto_42256 ?auto_42260 ) ( not ( = ?auto_42262 ?auto_42256 ) ) ( SURFACE-AT ?auto_42254 ?auto_42260 ) ( ON ?auto_42254 ?auto_42274 ) ( CLEAR ?auto_42254 ) ( not ( = ?auto_42254 ?auto_42274 ) ) ( not ( = ?auto_42255 ?auto_42274 ) ) ( IS-CRATE ?auto_42255 ) ( not ( = ?auto_42254 ?auto_42257 ) ) ( not ( = ?auto_42255 ?auto_42257 ) ) ( not ( = ?auto_42274 ?auto_42257 ) ) ( not ( = ?auto_42258 ?auto_42261 ) ) ( not ( = ?auto_42260 ?auto_42258 ) ) ( HOIST-AT ?auto_42266 ?auto_42258 ) ( not ( = ?auto_42262 ?auto_42266 ) ) ( not ( = ?auto_42256 ?auto_42266 ) ) ( AVAILABLE ?auto_42266 ) ( SURFACE-AT ?auto_42255 ?auto_42258 ) ( ON ?auto_42255 ?auto_42271 ) ( CLEAR ?auto_42255 ) ( not ( = ?auto_42254 ?auto_42271 ) ) ( not ( = ?auto_42255 ?auto_42271 ) ) ( not ( = ?auto_42274 ?auto_42271 ) ) ( not ( = ?auto_42257 ?auto_42271 ) ) ( IS-CRATE ?auto_42257 ) ( not ( = ?auto_42254 ?auto_42273 ) ) ( not ( = ?auto_42255 ?auto_42273 ) ) ( not ( = ?auto_42274 ?auto_42273 ) ) ( not ( = ?auto_42257 ?auto_42273 ) ) ( not ( = ?auto_42271 ?auto_42273 ) ) ( not ( = ?auto_42263 ?auto_42261 ) ) ( not ( = ?auto_42260 ?auto_42263 ) ) ( not ( = ?auto_42258 ?auto_42263 ) ) ( HOIST-AT ?auto_42270 ?auto_42263 ) ( not ( = ?auto_42262 ?auto_42270 ) ) ( not ( = ?auto_42256 ?auto_42270 ) ) ( not ( = ?auto_42266 ?auto_42270 ) ) ( AVAILABLE ?auto_42270 ) ( SURFACE-AT ?auto_42257 ?auto_42263 ) ( ON ?auto_42257 ?auto_42275 ) ( CLEAR ?auto_42257 ) ( not ( = ?auto_42254 ?auto_42275 ) ) ( not ( = ?auto_42255 ?auto_42275 ) ) ( not ( = ?auto_42274 ?auto_42275 ) ) ( not ( = ?auto_42257 ?auto_42275 ) ) ( not ( = ?auto_42271 ?auto_42275 ) ) ( not ( = ?auto_42273 ?auto_42275 ) ) ( IS-CRATE ?auto_42273 ) ( not ( = ?auto_42254 ?auto_42264 ) ) ( not ( = ?auto_42255 ?auto_42264 ) ) ( not ( = ?auto_42274 ?auto_42264 ) ) ( not ( = ?auto_42257 ?auto_42264 ) ) ( not ( = ?auto_42271 ?auto_42264 ) ) ( not ( = ?auto_42273 ?auto_42264 ) ) ( not ( = ?auto_42275 ?auto_42264 ) ) ( AVAILABLE ?auto_42256 ) ( SURFACE-AT ?auto_42273 ?auto_42260 ) ( ON ?auto_42273 ?auto_42265 ) ( CLEAR ?auto_42273 ) ( not ( = ?auto_42254 ?auto_42265 ) ) ( not ( = ?auto_42255 ?auto_42265 ) ) ( not ( = ?auto_42274 ?auto_42265 ) ) ( not ( = ?auto_42257 ?auto_42265 ) ) ( not ( = ?auto_42271 ?auto_42265 ) ) ( not ( = ?auto_42273 ?auto_42265 ) ) ( not ( = ?auto_42275 ?auto_42265 ) ) ( not ( = ?auto_42264 ?auto_42265 ) ) ( SURFACE-AT ?auto_42268 ?auto_42261 ) ( CLEAR ?auto_42268 ) ( IS-CRATE ?auto_42264 ) ( not ( = ?auto_42254 ?auto_42268 ) ) ( not ( = ?auto_42255 ?auto_42268 ) ) ( not ( = ?auto_42274 ?auto_42268 ) ) ( not ( = ?auto_42257 ?auto_42268 ) ) ( not ( = ?auto_42271 ?auto_42268 ) ) ( not ( = ?auto_42273 ?auto_42268 ) ) ( not ( = ?auto_42275 ?auto_42268 ) ) ( not ( = ?auto_42264 ?auto_42268 ) ) ( not ( = ?auto_42265 ?auto_42268 ) ) ( AVAILABLE ?auto_42262 ) ( not ( = ?auto_42267 ?auto_42261 ) ) ( not ( = ?auto_42260 ?auto_42267 ) ) ( not ( = ?auto_42258 ?auto_42267 ) ) ( not ( = ?auto_42263 ?auto_42267 ) ) ( HOIST-AT ?auto_42259 ?auto_42267 ) ( not ( = ?auto_42262 ?auto_42259 ) ) ( not ( = ?auto_42256 ?auto_42259 ) ) ( not ( = ?auto_42266 ?auto_42259 ) ) ( not ( = ?auto_42270 ?auto_42259 ) ) ( AVAILABLE ?auto_42259 ) ( SURFACE-AT ?auto_42264 ?auto_42267 ) ( ON ?auto_42264 ?auto_42269 ) ( CLEAR ?auto_42264 ) ( not ( = ?auto_42254 ?auto_42269 ) ) ( not ( = ?auto_42255 ?auto_42269 ) ) ( not ( = ?auto_42274 ?auto_42269 ) ) ( not ( = ?auto_42257 ?auto_42269 ) ) ( not ( = ?auto_42271 ?auto_42269 ) ) ( not ( = ?auto_42273 ?auto_42269 ) ) ( not ( = ?auto_42275 ?auto_42269 ) ) ( not ( = ?auto_42264 ?auto_42269 ) ) ( not ( = ?auto_42265 ?auto_42269 ) ) ( not ( = ?auto_42268 ?auto_42269 ) ) ( TRUCK-AT ?auto_42272 ?auto_42261 ) )
    :subtasks
    ( ( !DRIVE ?auto_42272 ?auto_42261 ?auto_42267 )
      ( MAKE-ON ?auto_42254 ?auto_42255 )
      ( MAKE-ON-VERIFY ?auto_42254 ?auto_42255 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42276 - SURFACE
      ?auto_42277 - SURFACE
    )
    :vars
    (
      ?auto_42278 - HOIST
      ?auto_42297 - PLACE
      ?auto_42288 - PLACE
      ?auto_42286 - HOIST
      ?auto_42293 - SURFACE
      ?auto_42289 - SURFACE
      ?auto_42281 - PLACE
      ?auto_42283 - HOIST
      ?auto_42295 - SURFACE
      ?auto_42292 - SURFACE
      ?auto_42290 - PLACE
      ?auto_42287 - HOIST
      ?auto_42294 - SURFACE
      ?auto_42282 - SURFACE
      ?auto_42296 - SURFACE
      ?auto_42280 - SURFACE
      ?auto_42285 - PLACE
      ?auto_42279 - HOIST
      ?auto_42284 - SURFACE
      ?auto_42291 - TRUCK
      ?auto_42298 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42278 ?auto_42297 ) ( IS-CRATE ?auto_42276 ) ( not ( = ?auto_42276 ?auto_42277 ) ) ( not ( = ?auto_42288 ?auto_42297 ) ) ( HOIST-AT ?auto_42286 ?auto_42288 ) ( not ( = ?auto_42278 ?auto_42286 ) ) ( SURFACE-AT ?auto_42276 ?auto_42288 ) ( ON ?auto_42276 ?auto_42293 ) ( CLEAR ?auto_42276 ) ( not ( = ?auto_42276 ?auto_42293 ) ) ( not ( = ?auto_42277 ?auto_42293 ) ) ( IS-CRATE ?auto_42277 ) ( not ( = ?auto_42276 ?auto_42289 ) ) ( not ( = ?auto_42277 ?auto_42289 ) ) ( not ( = ?auto_42293 ?auto_42289 ) ) ( not ( = ?auto_42281 ?auto_42297 ) ) ( not ( = ?auto_42288 ?auto_42281 ) ) ( HOIST-AT ?auto_42283 ?auto_42281 ) ( not ( = ?auto_42278 ?auto_42283 ) ) ( not ( = ?auto_42286 ?auto_42283 ) ) ( AVAILABLE ?auto_42283 ) ( SURFACE-AT ?auto_42277 ?auto_42281 ) ( ON ?auto_42277 ?auto_42295 ) ( CLEAR ?auto_42277 ) ( not ( = ?auto_42276 ?auto_42295 ) ) ( not ( = ?auto_42277 ?auto_42295 ) ) ( not ( = ?auto_42293 ?auto_42295 ) ) ( not ( = ?auto_42289 ?auto_42295 ) ) ( IS-CRATE ?auto_42289 ) ( not ( = ?auto_42276 ?auto_42292 ) ) ( not ( = ?auto_42277 ?auto_42292 ) ) ( not ( = ?auto_42293 ?auto_42292 ) ) ( not ( = ?auto_42289 ?auto_42292 ) ) ( not ( = ?auto_42295 ?auto_42292 ) ) ( not ( = ?auto_42290 ?auto_42297 ) ) ( not ( = ?auto_42288 ?auto_42290 ) ) ( not ( = ?auto_42281 ?auto_42290 ) ) ( HOIST-AT ?auto_42287 ?auto_42290 ) ( not ( = ?auto_42278 ?auto_42287 ) ) ( not ( = ?auto_42286 ?auto_42287 ) ) ( not ( = ?auto_42283 ?auto_42287 ) ) ( AVAILABLE ?auto_42287 ) ( SURFACE-AT ?auto_42289 ?auto_42290 ) ( ON ?auto_42289 ?auto_42294 ) ( CLEAR ?auto_42289 ) ( not ( = ?auto_42276 ?auto_42294 ) ) ( not ( = ?auto_42277 ?auto_42294 ) ) ( not ( = ?auto_42293 ?auto_42294 ) ) ( not ( = ?auto_42289 ?auto_42294 ) ) ( not ( = ?auto_42295 ?auto_42294 ) ) ( not ( = ?auto_42292 ?auto_42294 ) ) ( IS-CRATE ?auto_42292 ) ( not ( = ?auto_42276 ?auto_42282 ) ) ( not ( = ?auto_42277 ?auto_42282 ) ) ( not ( = ?auto_42293 ?auto_42282 ) ) ( not ( = ?auto_42289 ?auto_42282 ) ) ( not ( = ?auto_42295 ?auto_42282 ) ) ( not ( = ?auto_42292 ?auto_42282 ) ) ( not ( = ?auto_42294 ?auto_42282 ) ) ( AVAILABLE ?auto_42286 ) ( SURFACE-AT ?auto_42292 ?auto_42288 ) ( ON ?auto_42292 ?auto_42296 ) ( CLEAR ?auto_42292 ) ( not ( = ?auto_42276 ?auto_42296 ) ) ( not ( = ?auto_42277 ?auto_42296 ) ) ( not ( = ?auto_42293 ?auto_42296 ) ) ( not ( = ?auto_42289 ?auto_42296 ) ) ( not ( = ?auto_42295 ?auto_42296 ) ) ( not ( = ?auto_42292 ?auto_42296 ) ) ( not ( = ?auto_42294 ?auto_42296 ) ) ( not ( = ?auto_42282 ?auto_42296 ) ) ( IS-CRATE ?auto_42282 ) ( not ( = ?auto_42276 ?auto_42280 ) ) ( not ( = ?auto_42277 ?auto_42280 ) ) ( not ( = ?auto_42293 ?auto_42280 ) ) ( not ( = ?auto_42289 ?auto_42280 ) ) ( not ( = ?auto_42295 ?auto_42280 ) ) ( not ( = ?auto_42292 ?auto_42280 ) ) ( not ( = ?auto_42294 ?auto_42280 ) ) ( not ( = ?auto_42282 ?auto_42280 ) ) ( not ( = ?auto_42296 ?auto_42280 ) ) ( not ( = ?auto_42285 ?auto_42297 ) ) ( not ( = ?auto_42288 ?auto_42285 ) ) ( not ( = ?auto_42281 ?auto_42285 ) ) ( not ( = ?auto_42290 ?auto_42285 ) ) ( HOIST-AT ?auto_42279 ?auto_42285 ) ( not ( = ?auto_42278 ?auto_42279 ) ) ( not ( = ?auto_42286 ?auto_42279 ) ) ( not ( = ?auto_42283 ?auto_42279 ) ) ( not ( = ?auto_42287 ?auto_42279 ) ) ( AVAILABLE ?auto_42279 ) ( SURFACE-AT ?auto_42282 ?auto_42285 ) ( ON ?auto_42282 ?auto_42284 ) ( CLEAR ?auto_42282 ) ( not ( = ?auto_42276 ?auto_42284 ) ) ( not ( = ?auto_42277 ?auto_42284 ) ) ( not ( = ?auto_42293 ?auto_42284 ) ) ( not ( = ?auto_42289 ?auto_42284 ) ) ( not ( = ?auto_42295 ?auto_42284 ) ) ( not ( = ?auto_42292 ?auto_42284 ) ) ( not ( = ?auto_42294 ?auto_42284 ) ) ( not ( = ?auto_42282 ?auto_42284 ) ) ( not ( = ?auto_42296 ?auto_42284 ) ) ( not ( = ?auto_42280 ?auto_42284 ) ) ( TRUCK-AT ?auto_42291 ?auto_42297 ) ( SURFACE-AT ?auto_42298 ?auto_42297 ) ( CLEAR ?auto_42298 ) ( LIFTING ?auto_42278 ?auto_42280 ) ( IS-CRATE ?auto_42280 ) ( not ( = ?auto_42276 ?auto_42298 ) ) ( not ( = ?auto_42277 ?auto_42298 ) ) ( not ( = ?auto_42293 ?auto_42298 ) ) ( not ( = ?auto_42289 ?auto_42298 ) ) ( not ( = ?auto_42295 ?auto_42298 ) ) ( not ( = ?auto_42292 ?auto_42298 ) ) ( not ( = ?auto_42294 ?auto_42298 ) ) ( not ( = ?auto_42282 ?auto_42298 ) ) ( not ( = ?auto_42296 ?auto_42298 ) ) ( not ( = ?auto_42280 ?auto_42298 ) ) ( not ( = ?auto_42284 ?auto_42298 ) ) )
    :subtasks
    ( ( !DROP ?auto_42278 ?auto_42280 ?auto_42298 ?auto_42297 )
      ( MAKE-ON ?auto_42276 ?auto_42277 )
      ( MAKE-ON-VERIFY ?auto_42276 ?auto_42277 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42299 - SURFACE
      ?auto_42300 - SURFACE
    )
    :vars
    (
      ?auto_42313 - HOIST
      ?auto_42303 - PLACE
      ?auto_42318 - PLACE
      ?auto_42311 - HOIST
      ?auto_42312 - SURFACE
      ?auto_42314 - SURFACE
      ?auto_42306 - PLACE
      ?auto_42321 - HOIST
      ?auto_42309 - SURFACE
      ?auto_42301 - SURFACE
      ?auto_42307 - PLACE
      ?auto_42319 - HOIST
      ?auto_42308 - SURFACE
      ?auto_42316 - SURFACE
      ?auto_42304 - SURFACE
      ?auto_42310 - SURFACE
      ?auto_42320 - PLACE
      ?auto_42315 - HOIST
      ?auto_42305 - SURFACE
      ?auto_42317 - TRUCK
      ?auto_42302 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42313 ?auto_42303 ) ( IS-CRATE ?auto_42299 ) ( not ( = ?auto_42299 ?auto_42300 ) ) ( not ( = ?auto_42318 ?auto_42303 ) ) ( HOIST-AT ?auto_42311 ?auto_42318 ) ( not ( = ?auto_42313 ?auto_42311 ) ) ( SURFACE-AT ?auto_42299 ?auto_42318 ) ( ON ?auto_42299 ?auto_42312 ) ( CLEAR ?auto_42299 ) ( not ( = ?auto_42299 ?auto_42312 ) ) ( not ( = ?auto_42300 ?auto_42312 ) ) ( IS-CRATE ?auto_42300 ) ( not ( = ?auto_42299 ?auto_42314 ) ) ( not ( = ?auto_42300 ?auto_42314 ) ) ( not ( = ?auto_42312 ?auto_42314 ) ) ( not ( = ?auto_42306 ?auto_42303 ) ) ( not ( = ?auto_42318 ?auto_42306 ) ) ( HOIST-AT ?auto_42321 ?auto_42306 ) ( not ( = ?auto_42313 ?auto_42321 ) ) ( not ( = ?auto_42311 ?auto_42321 ) ) ( AVAILABLE ?auto_42321 ) ( SURFACE-AT ?auto_42300 ?auto_42306 ) ( ON ?auto_42300 ?auto_42309 ) ( CLEAR ?auto_42300 ) ( not ( = ?auto_42299 ?auto_42309 ) ) ( not ( = ?auto_42300 ?auto_42309 ) ) ( not ( = ?auto_42312 ?auto_42309 ) ) ( not ( = ?auto_42314 ?auto_42309 ) ) ( IS-CRATE ?auto_42314 ) ( not ( = ?auto_42299 ?auto_42301 ) ) ( not ( = ?auto_42300 ?auto_42301 ) ) ( not ( = ?auto_42312 ?auto_42301 ) ) ( not ( = ?auto_42314 ?auto_42301 ) ) ( not ( = ?auto_42309 ?auto_42301 ) ) ( not ( = ?auto_42307 ?auto_42303 ) ) ( not ( = ?auto_42318 ?auto_42307 ) ) ( not ( = ?auto_42306 ?auto_42307 ) ) ( HOIST-AT ?auto_42319 ?auto_42307 ) ( not ( = ?auto_42313 ?auto_42319 ) ) ( not ( = ?auto_42311 ?auto_42319 ) ) ( not ( = ?auto_42321 ?auto_42319 ) ) ( AVAILABLE ?auto_42319 ) ( SURFACE-AT ?auto_42314 ?auto_42307 ) ( ON ?auto_42314 ?auto_42308 ) ( CLEAR ?auto_42314 ) ( not ( = ?auto_42299 ?auto_42308 ) ) ( not ( = ?auto_42300 ?auto_42308 ) ) ( not ( = ?auto_42312 ?auto_42308 ) ) ( not ( = ?auto_42314 ?auto_42308 ) ) ( not ( = ?auto_42309 ?auto_42308 ) ) ( not ( = ?auto_42301 ?auto_42308 ) ) ( IS-CRATE ?auto_42301 ) ( not ( = ?auto_42299 ?auto_42316 ) ) ( not ( = ?auto_42300 ?auto_42316 ) ) ( not ( = ?auto_42312 ?auto_42316 ) ) ( not ( = ?auto_42314 ?auto_42316 ) ) ( not ( = ?auto_42309 ?auto_42316 ) ) ( not ( = ?auto_42301 ?auto_42316 ) ) ( not ( = ?auto_42308 ?auto_42316 ) ) ( AVAILABLE ?auto_42311 ) ( SURFACE-AT ?auto_42301 ?auto_42318 ) ( ON ?auto_42301 ?auto_42304 ) ( CLEAR ?auto_42301 ) ( not ( = ?auto_42299 ?auto_42304 ) ) ( not ( = ?auto_42300 ?auto_42304 ) ) ( not ( = ?auto_42312 ?auto_42304 ) ) ( not ( = ?auto_42314 ?auto_42304 ) ) ( not ( = ?auto_42309 ?auto_42304 ) ) ( not ( = ?auto_42301 ?auto_42304 ) ) ( not ( = ?auto_42308 ?auto_42304 ) ) ( not ( = ?auto_42316 ?auto_42304 ) ) ( IS-CRATE ?auto_42316 ) ( not ( = ?auto_42299 ?auto_42310 ) ) ( not ( = ?auto_42300 ?auto_42310 ) ) ( not ( = ?auto_42312 ?auto_42310 ) ) ( not ( = ?auto_42314 ?auto_42310 ) ) ( not ( = ?auto_42309 ?auto_42310 ) ) ( not ( = ?auto_42301 ?auto_42310 ) ) ( not ( = ?auto_42308 ?auto_42310 ) ) ( not ( = ?auto_42316 ?auto_42310 ) ) ( not ( = ?auto_42304 ?auto_42310 ) ) ( not ( = ?auto_42320 ?auto_42303 ) ) ( not ( = ?auto_42318 ?auto_42320 ) ) ( not ( = ?auto_42306 ?auto_42320 ) ) ( not ( = ?auto_42307 ?auto_42320 ) ) ( HOIST-AT ?auto_42315 ?auto_42320 ) ( not ( = ?auto_42313 ?auto_42315 ) ) ( not ( = ?auto_42311 ?auto_42315 ) ) ( not ( = ?auto_42321 ?auto_42315 ) ) ( not ( = ?auto_42319 ?auto_42315 ) ) ( AVAILABLE ?auto_42315 ) ( SURFACE-AT ?auto_42316 ?auto_42320 ) ( ON ?auto_42316 ?auto_42305 ) ( CLEAR ?auto_42316 ) ( not ( = ?auto_42299 ?auto_42305 ) ) ( not ( = ?auto_42300 ?auto_42305 ) ) ( not ( = ?auto_42312 ?auto_42305 ) ) ( not ( = ?auto_42314 ?auto_42305 ) ) ( not ( = ?auto_42309 ?auto_42305 ) ) ( not ( = ?auto_42301 ?auto_42305 ) ) ( not ( = ?auto_42308 ?auto_42305 ) ) ( not ( = ?auto_42316 ?auto_42305 ) ) ( not ( = ?auto_42304 ?auto_42305 ) ) ( not ( = ?auto_42310 ?auto_42305 ) ) ( TRUCK-AT ?auto_42317 ?auto_42303 ) ( SURFACE-AT ?auto_42302 ?auto_42303 ) ( CLEAR ?auto_42302 ) ( IS-CRATE ?auto_42310 ) ( not ( = ?auto_42299 ?auto_42302 ) ) ( not ( = ?auto_42300 ?auto_42302 ) ) ( not ( = ?auto_42312 ?auto_42302 ) ) ( not ( = ?auto_42314 ?auto_42302 ) ) ( not ( = ?auto_42309 ?auto_42302 ) ) ( not ( = ?auto_42301 ?auto_42302 ) ) ( not ( = ?auto_42308 ?auto_42302 ) ) ( not ( = ?auto_42316 ?auto_42302 ) ) ( not ( = ?auto_42304 ?auto_42302 ) ) ( not ( = ?auto_42310 ?auto_42302 ) ) ( not ( = ?auto_42305 ?auto_42302 ) ) ( AVAILABLE ?auto_42313 ) ( IN ?auto_42310 ?auto_42317 ) )
    :subtasks
    ( ( !UNLOAD ?auto_42313 ?auto_42310 ?auto_42317 ?auto_42303 )
      ( MAKE-ON ?auto_42299 ?auto_42300 )
      ( MAKE-ON-VERIFY ?auto_42299 ?auto_42300 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42322 - SURFACE
      ?auto_42323 - SURFACE
    )
    :vars
    (
      ?auto_42337 - HOIST
      ?auto_42327 - PLACE
      ?auto_42330 - PLACE
      ?auto_42326 - HOIST
      ?auto_42338 - SURFACE
      ?auto_42340 - SURFACE
      ?auto_42328 - PLACE
      ?auto_42332 - HOIST
      ?auto_42336 - SURFACE
      ?auto_42324 - SURFACE
      ?auto_42335 - PLACE
      ?auto_42343 - HOIST
      ?auto_42339 - SURFACE
      ?auto_42333 - SURFACE
      ?auto_42334 - SURFACE
      ?auto_42331 - SURFACE
      ?auto_42342 - PLACE
      ?auto_42341 - HOIST
      ?auto_42329 - SURFACE
      ?auto_42325 - SURFACE
      ?auto_42344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42337 ?auto_42327 ) ( IS-CRATE ?auto_42322 ) ( not ( = ?auto_42322 ?auto_42323 ) ) ( not ( = ?auto_42330 ?auto_42327 ) ) ( HOIST-AT ?auto_42326 ?auto_42330 ) ( not ( = ?auto_42337 ?auto_42326 ) ) ( SURFACE-AT ?auto_42322 ?auto_42330 ) ( ON ?auto_42322 ?auto_42338 ) ( CLEAR ?auto_42322 ) ( not ( = ?auto_42322 ?auto_42338 ) ) ( not ( = ?auto_42323 ?auto_42338 ) ) ( IS-CRATE ?auto_42323 ) ( not ( = ?auto_42322 ?auto_42340 ) ) ( not ( = ?auto_42323 ?auto_42340 ) ) ( not ( = ?auto_42338 ?auto_42340 ) ) ( not ( = ?auto_42328 ?auto_42327 ) ) ( not ( = ?auto_42330 ?auto_42328 ) ) ( HOIST-AT ?auto_42332 ?auto_42328 ) ( not ( = ?auto_42337 ?auto_42332 ) ) ( not ( = ?auto_42326 ?auto_42332 ) ) ( AVAILABLE ?auto_42332 ) ( SURFACE-AT ?auto_42323 ?auto_42328 ) ( ON ?auto_42323 ?auto_42336 ) ( CLEAR ?auto_42323 ) ( not ( = ?auto_42322 ?auto_42336 ) ) ( not ( = ?auto_42323 ?auto_42336 ) ) ( not ( = ?auto_42338 ?auto_42336 ) ) ( not ( = ?auto_42340 ?auto_42336 ) ) ( IS-CRATE ?auto_42340 ) ( not ( = ?auto_42322 ?auto_42324 ) ) ( not ( = ?auto_42323 ?auto_42324 ) ) ( not ( = ?auto_42338 ?auto_42324 ) ) ( not ( = ?auto_42340 ?auto_42324 ) ) ( not ( = ?auto_42336 ?auto_42324 ) ) ( not ( = ?auto_42335 ?auto_42327 ) ) ( not ( = ?auto_42330 ?auto_42335 ) ) ( not ( = ?auto_42328 ?auto_42335 ) ) ( HOIST-AT ?auto_42343 ?auto_42335 ) ( not ( = ?auto_42337 ?auto_42343 ) ) ( not ( = ?auto_42326 ?auto_42343 ) ) ( not ( = ?auto_42332 ?auto_42343 ) ) ( AVAILABLE ?auto_42343 ) ( SURFACE-AT ?auto_42340 ?auto_42335 ) ( ON ?auto_42340 ?auto_42339 ) ( CLEAR ?auto_42340 ) ( not ( = ?auto_42322 ?auto_42339 ) ) ( not ( = ?auto_42323 ?auto_42339 ) ) ( not ( = ?auto_42338 ?auto_42339 ) ) ( not ( = ?auto_42340 ?auto_42339 ) ) ( not ( = ?auto_42336 ?auto_42339 ) ) ( not ( = ?auto_42324 ?auto_42339 ) ) ( IS-CRATE ?auto_42324 ) ( not ( = ?auto_42322 ?auto_42333 ) ) ( not ( = ?auto_42323 ?auto_42333 ) ) ( not ( = ?auto_42338 ?auto_42333 ) ) ( not ( = ?auto_42340 ?auto_42333 ) ) ( not ( = ?auto_42336 ?auto_42333 ) ) ( not ( = ?auto_42324 ?auto_42333 ) ) ( not ( = ?auto_42339 ?auto_42333 ) ) ( AVAILABLE ?auto_42326 ) ( SURFACE-AT ?auto_42324 ?auto_42330 ) ( ON ?auto_42324 ?auto_42334 ) ( CLEAR ?auto_42324 ) ( not ( = ?auto_42322 ?auto_42334 ) ) ( not ( = ?auto_42323 ?auto_42334 ) ) ( not ( = ?auto_42338 ?auto_42334 ) ) ( not ( = ?auto_42340 ?auto_42334 ) ) ( not ( = ?auto_42336 ?auto_42334 ) ) ( not ( = ?auto_42324 ?auto_42334 ) ) ( not ( = ?auto_42339 ?auto_42334 ) ) ( not ( = ?auto_42333 ?auto_42334 ) ) ( IS-CRATE ?auto_42333 ) ( not ( = ?auto_42322 ?auto_42331 ) ) ( not ( = ?auto_42323 ?auto_42331 ) ) ( not ( = ?auto_42338 ?auto_42331 ) ) ( not ( = ?auto_42340 ?auto_42331 ) ) ( not ( = ?auto_42336 ?auto_42331 ) ) ( not ( = ?auto_42324 ?auto_42331 ) ) ( not ( = ?auto_42339 ?auto_42331 ) ) ( not ( = ?auto_42333 ?auto_42331 ) ) ( not ( = ?auto_42334 ?auto_42331 ) ) ( not ( = ?auto_42342 ?auto_42327 ) ) ( not ( = ?auto_42330 ?auto_42342 ) ) ( not ( = ?auto_42328 ?auto_42342 ) ) ( not ( = ?auto_42335 ?auto_42342 ) ) ( HOIST-AT ?auto_42341 ?auto_42342 ) ( not ( = ?auto_42337 ?auto_42341 ) ) ( not ( = ?auto_42326 ?auto_42341 ) ) ( not ( = ?auto_42332 ?auto_42341 ) ) ( not ( = ?auto_42343 ?auto_42341 ) ) ( AVAILABLE ?auto_42341 ) ( SURFACE-AT ?auto_42333 ?auto_42342 ) ( ON ?auto_42333 ?auto_42329 ) ( CLEAR ?auto_42333 ) ( not ( = ?auto_42322 ?auto_42329 ) ) ( not ( = ?auto_42323 ?auto_42329 ) ) ( not ( = ?auto_42338 ?auto_42329 ) ) ( not ( = ?auto_42340 ?auto_42329 ) ) ( not ( = ?auto_42336 ?auto_42329 ) ) ( not ( = ?auto_42324 ?auto_42329 ) ) ( not ( = ?auto_42339 ?auto_42329 ) ) ( not ( = ?auto_42333 ?auto_42329 ) ) ( not ( = ?auto_42334 ?auto_42329 ) ) ( not ( = ?auto_42331 ?auto_42329 ) ) ( SURFACE-AT ?auto_42325 ?auto_42327 ) ( CLEAR ?auto_42325 ) ( IS-CRATE ?auto_42331 ) ( not ( = ?auto_42322 ?auto_42325 ) ) ( not ( = ?auto_42323 ?auto_42325 ) ) ( not ( = ?auto_42338 ?auto_42325 ) ) ( not ( = ?auto_42340 ?auto_42325 ) ) ( not ( = ?auto_42336 ?auto_42325 ) ) ( not ( = ?auto_42324 ?auto_42325 ) ) ( not ( = ?auto_42339 ?auto_42325 ) ) ( not ( = ?auto_42333 ?auto_42325 ) ) ( not ( = ?auto_42334 ?auto_42325 ) ) ( not ( = ?auto_42331 ?auto_42325 ) ) ( not ( = ?auto_42329 ?auto_42325 ) ) ( AVAILABLE ?auto_42337 ) ( IN ?auto_42331 ?auto_42344 ) ( TRUCK-AT ?auto_42344 ?auto_42328 ) )
    :subtasks
    ( ( !DRIVE ?auto_42344 ?auto_42328 ?auto_42327 )
      ( MAKE-ON ?auto_42322 ?auto_42323 )
      ( MAKE-ON-VERIFY ?auto_42322 ?auto_42323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42345 - SURFACE
      ?auto_42346 - SURFACE
    )
    :vars
    (
      ?auto_42358 - HOIST
      ?auto_42350 - PLACE
      ?auto_42364 - PLACE
      ?auto_42353 - HOIST
      ?auto_42367 - SURFACE
      ?auto_42356 - SURFACE
      ?auto_42359 - PLACE
      ?auto_42348 - HOIST
      ?auto_42352 - SURFACE
      ?auto_42347 - SURFACE
      ?auto_42362 - PLACE
      ?auto_42366 - HOIST
      ?auto_42363 - SURFACE
      ?auto_42361 - SURFACE
      ?auto_42360 - SURFACE
      ?auto_42355 - SURFACE
      ?auto_42365 - PLACE
      ?auto_42357 - HOIST
      ?auto_42351 - SURFACE
      ?auto_42349 - SURFACE
      ?auto_42354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42358 ?auto_42350 ) ( IS-CRATE ?auto_42345 ) ( not ( = ?auto_42345 ?auto_42346 ) ) ( not ( = ?auto_42364 ?auto_42350 ) ) ( HOIST-AT ?auto_42353 ?auto_42364 ) ( not ( = ?auto_42358 ?auto_42353 ) ) ( SURFACE-AT ?auto_42345 ?auto_42364 ) ( ON ?auto_42345 ?auto_42367 ) ( CLEAR ?auto_42345 ) ( not ( = ?auto_42345 ?auto_42367 ) ) ( not ( = ?auto_42346 ?auto_42367 ) ) ( IS-CRATE ?auto_42346 ) ( not ( = ?auto_42345 ?auto_42356 ) ) ( not ( = ?auto_42346 ?auto_42356 ) ) ( not ( = ?auto_42367 ?auto_42356 ) ) ( not ( = ?auto_42359 ?auto_42350 ) ) ( not ( = ?auto_42364 ?auto_42359 ) ) ( HOIST-AT ?auto_42348 ?auto_42359 ) ( not ( = ?auto_42358 ?auto_42348 ) ) ( not ( = ?auto_42353 ?auto_42348 ) ) ( SURFACE-AT ?auto_42346 ?auto_42359 ) ( ON ?auto_42346 ?auto_42352 ) ( CLEAR ?auto_42346 ) ( not ( = ?auto_42345 ?auto_42352 ) ) ( not ( = ?auto_42346 ?auto_42352 ) ) ( not ( = ?auto_42367 ?auto_42352 ) ) ( not ( = ?auto_42356 ?auto_42352 ) ) ( IS-CRATE ?auto_42356 ) ( not ( = ?auto_42345 ?auto_42347 ) ) ( not ( = ?auto_42346 ?auto_42347 ) ) ( not ( = ?auto_42367 ?auto_42347 ) ) ( not ( = ?auto_42356 ?auto_42347 ) ) ( not ( = ?auto_42352 ?auto_42347 ) ) ( not ( = ?auto_42362 ?auto_42350 ) ) ( not ( = ?auto_42364 ?auto_42362 ) ) ( not ( = ?auto_42359 ?auto_42362 ) ) ( HOIST-AT ?auto_42366 ?auto_42362 ) ( not ( = ?auto_42358 ?auto_42366 ) ) ( not ( = ?auto_42353 ?auto_42366 ) ) ( not ( = ?auto_42348 ?auto_42366 ) ) ( AVAILABLE ?auto_42366 ) ( SURFACE-AT ?auto_42356 ?auto_42362 ) ( ON ?auto_42356 ?auto_42363 ) ( CLEAR ?auto_42356 ) ( not ( = ?auto_42345 ?auto_42363 ) ) ( not ( = ?auto_42346 ?auto_42363 ) ) ( not ( = ?auto_42367 ?auto_42363 ) ) ( not ( = ?auto_42356 ?auto_42363 ) ) ( not ( = ?auto_42352 ?auto_42363 ) ) ( not ( = ?auto_42347 ?auto_42363 ) ) ( IS-CRATE ?auto_42347 ) ( not ( = ?auto_42345 ?auto_42361 ) ) ( not ( = ?auto_42346 ?auto_42361 ) ) ( not ( = ?auto_42367 ?auto_42361 ) ) ( not ( = ?auto_42356 ?auto_42361 ) ) ( not ( = ?auto_42352 ?auto_42361 ) ) ( not ( = ?auto_42347 ?auto_42361 ) ) ( not ( = ?auto_42363 ?auto_42361 ) ) ( AVAILABLE ?auto_42353 ) ( SURFACE-AT ?auto_42347 ?auto_42364 ) ( ON ?auto_42347 ?auto_42360 ) ( CLEAR ?auto_42347 ) ( not ( = ?auto_42345 ?auto_42360 ) ) ( not ( = ?auto_42346 ?auto_42360 ) ) ( not ( = ?auto_42367 ?auto_42360 ) ) ( not ( = ?auto_42356 ?auto_42360 ) ) ( not ( = ?auto_42352 ?auto_42360 ) ) ( not ( = ?auto_42347 ?auto_42360 ) ) ( not ( = ?auto_42363 ?auto_42360 ) ) ( not ( = ?auto_42361 ?auto_42360 ) ) ( IS-CRATE ?auto_42361 ) ( not ( = ?auto_42345 ?auto_42355 ) ) ( not ( = ?auto_42346 ?auto_42355 ) ) ( not ( = ?auto_42367 ?auto_42355 ) ) ( not ( = ?auto_42356 ?auto_42355 ) ) ( not ( = ?auto_42352 ?auto_42355 ) ) ( not ( = ?auto_42347 ?auto_42355 ) ) ( not ( = ?auto_42363 ?auto_42355 ) ) ( not ( = ?auto_42361 ?auto_42355 ) ) ( not ( = ?auto_42360 ?auto_42355 ) ) ( not ( = ?auto_42365 ?auto_42350 ) ) ( not ( = ?auto_42364 ?auto_42365 ) ) ( not ( = ?auto_42359 ?auto_42365 ) ) ( not ( = ?auto_42362 ?auto_42365 ) ) ( HOIST-AT ?auto_42357 ?auto_42365 ) ( not ( = ?auto_42358 ?auto_42357 ) ) ( not ( = ?auto_42353 ?auto_42357 ) ) ( not ( = ?auto_42348 ?auto_42357 ) ) ( not ( = ?auto_42366 ?auto_42357 ) ) ( AVAILABLE ?auto_42357 ) ( SURFACE-AT ?auto_42361 ?auto_42365 ) ( ON ?auto_42361 ?auto_42351 ) ( CLEAR ?auto_42361 ) ( not ( = ?auto_42345 ?auto_42351 ) ) ( not ( = ?auto_42346 ?auto_42351 ) ) ( not ( = ?auto_42367 ?auto_42351 ) ) ( not ( = ?auto_42356 ?auto_42351 ) ) ( not ( = ?auto_42352 ?auto_42351 ) ) ( not ( = ?auto_42347 ?auto_42351 ) ) ( not ( = ?auto_42363 ?auto_42351 ) ) ( not ( = ?auto_42361 ?auto_42351 ) ) ( not ( = ?auto_42360 ?auto_42351 ) ) ( not ( = ?auto_42355 ?auto_42351 ) ) ( SURFACE-AT ?auto_42349 ?auto_42350 ) ( CLEAR ?auto_42349 ) ( IS-CRATE ?auto_42355 ) ( not ( = ?auto_42345 ?auto_42349 ) ) ( not ( = ?auto_42346 ?auto_42349 ) ) ( not ( = ?auto_42367 ?auto_42349 ) ) ( not ( = ?auto_42356 ?auto_42349 ) ) ( not ( = ?auto_42352 ?auto_42349 ) ) ( not ( = ?auto_42347 ?auto_42349 ) ) ( not ( = ?auto_42363 ?auto_42349 ) ) ( not ( = ?auto_42361 ?auto_42349 ) ) ( not ( = ?auto_42360 ?auto_42349 ) ) ( not ( = ?auto_42355 ?auto_42349 ) ) ( not ( = ?auto_42351 ?auto_42349 ) ) ( AVAILABLE ?auto_42358 ) ( TRUCK-AT ?auto_42354 ?auto_42359 ) ( LIFTING ?auto_42348 ?auto_42355 ) )
    :subtasks
    ( ( !LOAD ?auto_42348 ?auto_42355 ?auto_42354 ?auto_42359 )
      ( MAKE-ON ?auto_42345 ?auto_42346 )
      ( MAKE-ON-VERIFY ?auto_42345 ?auto_42346 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42368 - SURFACE
      ?auto_42369 - SURFACE
    )
    :vars
    (
      ?auto_42389 - HOIST
      ?auto_42386 - PLACE
      ?auto_42375 - PLACE
      ?auto_42373 - HOIST
      ?auto_42377 - SURFACE
      ?auto_42372 - SURFACE
      ?auto_42388 - PLACE
      ?auto_42385 - HOIST
      ?auto_42382 - SURFACE
      ?auto_42380 - SURFACE
      ?auto_42374 - PLACE
      ?auto_42378 - HOIST
      ?auto_42379 - SURFACE
      ?auto_42381 - SURFACE
      ?auto_42370 - SURFACE
      ?auto_42371 - SURFACE
      ?auto_42376 - PLACE
      ?auto_42390 - HOIST
      ?auto_42387 - SURFACE
      ?auto_42384 - SURFACE
      ?auto_42383 - TRUCK
      ?auto_42391 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42389 ?auto_42386 ) ( IS-CRATE ?auto_42368 ) ( not ( = ?auto_42368 ?auto_42369 ) ) ( not ( = ?auto_42375 ?auto_42386 ) ) ( HOIST-AT ?auto_42373 ?auto_42375 ) ( not ( = ?auto_42389 ?auto_42373 ) ) ( SURFACE-AT ?auto_42368 ?auto_42375 ) ( ON ?auto_42368 ?auto_42377 ) ( CLEAR ?auto_42368 ) ( not ( = ?auto_42368 ?auto_42377 ) ) ( not ( = ?auto_42369 ?auto_42377 ) ) ( IS-CRATE ?auto_42369 ) ( not ( = ?auto_42368 ?auto_42372 ) ) ( not ( = ?auto_42369 ?auto_42372 ) ) ( not ( = ?auto_42377 ?auto_42372 ) ) ( not ( = ?auto_42388 ?auto_42386 ) ) ( not ( = ?auto_42375 ?auto_42388 ) ) ( HOIST-AT ?auto_42385 ?auto_42388 ) ( not ( = ?auto_42389 ?auto_42385 ) ) ( not ( = ?auto_42373 ?auto_42385 ) ) ( SURFACE-AT ?auto_42369 ?auto_42388 ) ( ON ?auto_42369 ?auto_42382 ) ( CLEAR ?auto_42369 ) ( not ( = ?auto_42368 ?auto_42382 ) ) ( not ( = ?auto_42369 ?auto_42382 ) ) ( not ( = ?auto_42377 ?auto_42382 ) ) ( not ( = ?auto_42372 ?auto_42382 ) ) ( IS-CRATE ?auto_42372 ) ( not ( = ?auto_42368 ?auto_42380 ) ) ( not ( = ?auto_42369 ?auto_42380 ) ) ( not ( = ?auto_42377 ?auto_42380 ) ) ( not ( = ?auto_42372 ?auto_42380 ) ) ( not ( = ?auto_42382 ?auto_42380 ) ) ( not ( = ?auto_42374 ?auto_42386 ) ) ( not ( = ?auto_42375 ?auto_42374 ) ) ( not ( = ?auto_42388 ?auto_42374 ) ) ( HOIST-AT ?auto_42378 ?auto_42374 ) ( not ( = ?auto_42389 ?auto_42378 ) ) ( not ( = ?auto_42373 ?auto_42378 ) ) ( not ( = ?auto_42385 ?auto_42378 ) ) ( AVAILABLE ?auto_42378 ) ( SURFACE-AT ?auto_42372 ?auto_42374 ) ( ON ?auto_42372 ?auto_42379 ) ( CLEAR ?auto_42372 ) ( not ( = ?auto_42368 ?auto_42379 ) ) ( not ( = ?auto_42369 ?auto_42379 ) ) ( not ( = ?auto_42377 ?auto_42379 ) ) ( not ( = ?auto_42372 ?auto_42379 ) ) ( not ( = ?auto_42382 ?auto_42379 ) ) ( not ( = ?auto_42380 ?auto_42379 ) ) ( IS-CRATE ?auto_42380 ) ( not ( = ?auto_42368 ?auto_42381 ) ) ( not ( = ?auto_42369 ?auto_42381 ) ) ( not ( = ?auto_42377 ?auto_42381 ) ) ( not ( = ?auto_42372 ?auto_42381 ) ) ( not ( = ?auto_42382 ?auto_42381 ) ) ( not ( = ?auto_42380 ?auto_42381 ) ) ( not ( = ?auto_42379 ?auto_42381 ) ) ( AVAILABLE ?auto_42373 ) ( SURFACE-AT ?auto_42380 ?auto_42375 ) ( ON ?auto_42380 ?auto_42370 ) ( CLEAR ?auto_42380 ) ( not ( = ?auto_42368 ?auto_42370 ) ) ( not ( = ?auto_42369 ?auto_42370 ) ) ( not ( = ?auto_42377 ?auto_42370 ) ) ( not ( = ?auto_42372 ?auto_42370 ) ) ( not ( = ?auto_42382 ?auto_42370 ) ) ( not ( = ?auto_42380 ?auto_42370 ) ) ( not ( = ?auto_42379 ?auto_42370 ) ) ( not ( = ?auto_42381 ?auto_42370 ) ) ( IS-CRATE ?auto_42381 ) ( not ( = ?auto_42368 ?auto_42371 ) ) ( not ( = ?auto_42369 ?auto_42371 ) ) ( not ( = ?auto_42377 ?auto_42371 ) ) ( not ( = ?auto_42372 ?auto_42371 ) ) ( not ( = ?auto_42382 ?auto_42371 ) ) ( not ( = ?auto_42380 ?auto_42371 ) ) ( not ( = ?auto_42379 ?auto_42371 ) ) ( not ( = ?auto_42381 ?auto_42371 ) ) ( not ( = ?auto_42370 ?auto_42371 ) ) ( not ( = ?auto_42376 ?auto_42386 ) ) ( not ( = ?auto_42375 ?auto_42376 ) ) ( not ( = ?auto_42388 ?auto_42376 ) ) ( not ( = ?auto_42374 ?auto_42376 ) ) ( HOIST-AT ?auto_42390 ?auto_42376 ) ( not ( = ?auto_42389 ?auto_42390 ) ) ( not ( = ?auto_42373 ?auto_42390 ) ) ( not ( = ?auto_42385 ?auto_42390 ) ) ( not ( = ?auto_42378 ?auto_42390 ) ) ( AVAILABLE ?auto_42390 ) ( SURFACE-AT ?auto_42381 ?auto_42376 ) ( ON ?auto_42381 ?auto_42387 ) ( CLEAR ?auto_42381 ) ( not ( = ?auto_42368 ?auto_42387 ) ) ( not ( = ?auto_42369 ?auto_42387 ) ) ( not ( = ?auto_42377 ?auto_42387 ) ) ( not ( = ?auto_42372 ?auto_42387 ) ) ( not ( = ?auto_42382 ?auto_42387 ) ) ( not ( = ?auto_42380 ?auto_42387 ) ) ( not ( = ?auto_42379 ?auto_42387 ) ) ( not ( = ?auto_42381 ?auto_42387 ) ) ( not ( = ?auto_42370 ?auto_42387 ) ) ( not ( = ?auto_42371 ?auto_42387 ) ) ( SURFACE-AT ?auto_42384 ?auto_42386 ) ( CLEAR ?auto_42384 ) ( IS-CRATE ?auto_42371 ) ( not ( = ?auto_42368 ?auto_42384 ) ) ( not ( = ?auto_42369 ?auto_42384 ) ) ( not ( = ?auto_42377 ?auto_42384 ) ) ( not ( = ?auto_42372 ?auto_42384 ) ) ( not ( = ?auto_42382 ?auto_42384 ) ) ( not ( = ?auto_42380 ?auto_42384 ) ) ( not ( = ?auto_42379 ?auto_42384 ) ) ( not ( = ?auto_42381 ?auto_42384 ) ) ( not ( = ?auto_42370 ?auto_42384 ) ) ( not ( = ?auto_42371 ?auto_42384 ) ) ( not ( = ?auto_42387 ?auto_42384 ) ) ( AVAILABLE ?auto_42389 ) ( TRUCK-AT ?auto_42383 ?auto_42388 ) ( AVAILABLE ?auto_42385 ) ( SURFACE-AT ?auto_42371 ?auto_42388 ) ( ON ?auto_42371 ?auto_42391 ) ( CLEAR ?auto_42371 ) ( not ( = ?auto_42368 ?auto_42391 ) ) ( not ( = ?auto_42369 ?auto_42391 ) ) ( not ( = ?auto_42377 ?auto_42391 ) ) ( not ( = ?auto_42372 ?auto_42391 ) ) ( not ( = ?auto_42382 ?auto_42391 ) ) ( not ( = ?auto_42380 ?auto_42391 ) ) ( not ( = ?auto_42379 ?auto_42391 ) ) ( not ( = ?auto_42381 ?auto_42391 ) ) ( not ( = ?auto_42370 ?auto_42391 ) ) ( not ( = ?auto_42371 ?auto_42391 ) ) ( not ( = ?auto_42387 ?auto_42391 ) ) ( not ( = ?auto_42384 ?auto_42391 ) ) )
    :subtasks
    ( ( !LIFT ?auto_42385 ?auto_42371 ?auto_42391 ?auto_42388 )
      ( MAKE-ON ?auto_42368 ?auto_42369 )
      ( MAKE-ON-VERIFY ?auto_42368 ?auto_42369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42392 - SURFACE
      ?auto_42393 - SURFACE
    )
    :vars
    (
      ?auto_42407 - HOIST
      ?auto_42404 - PLACE
      ?auto_42395 - PLACE
      ?auto_42394 - HOIST
      ?auto_42398 - SURFACE
      ?auto_42400 - SURFACE
      ?auto_42406 - PLACE
      ?auto_42409 - HOIST
      ?auto_42396 - SURFACE
      ?auto_42413 - SURFACE
      ?auto_42411 - PLACE
      ?auto_42415 - HOIST
      ?auto_42412 - SURFACE
      ?auto_42397 - SURFACE
      ?auto_42410 - SURFACE
      ?auto_42414 - SURFACE
      ?auto_42403 - PLACE
      ?auto_42408 - HOIST
      ?auto_42405 - SURFACE
      ?auto_42402 - SURFACE
      ?auto_42401 - SURFACE
      ?auto_42399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42407 ?auto_42404 ) ( IS-CRATE ?auto_42392 ) ( not ( = ?auto_42392 ?auto_42393 ) ) ( not ( = ?auto_42395 ?auto_42404 ) ) ( HOIST-AT ?auto_42394 ?auto_42395 ) ( not ( = ?auto_42407 ?auto_42394 ) ) ( SURFACE-AT ?auto_42392 ?auto_42395 ) ( ON ?auto_42392 ?auto_42398 ) ( CLEAR ?auto_42392 ) ( not ( = ?auto_42392 ?auto_42398 ) ) ( not ( = ?auto_42393 ?auto_42398 ) ) ( IS-CRATE ?auto_42393 ) ( not ( = ?auto_42392 ?auto_42400 ) ) ( not ( = ?auto_42393 ?auto_42400 ) ) ( not ( = ?auto_42398 ?auto_42400 ) ) ( not ( = ?auto_42406 ?auto_42404 ) ) ( not ( = ?auto_42395 ?auto_42406 ) ) ( HOIST-AT ?auto_42409 ?auto_42406 ) ( not ( = ?auto_42407 ?auto_42409 ) ) ( not ( = ?auto_42394 ?auto_42409 ) ) ( SURFACE-AT ?auto_42393 ?auto_42406 ) ( ON ?auto_42393 ?auto_42396 ) ( CLEAR ?auto_42393 ) ( not ( = ?auto_42392 ?auto_42396 ) ) ( not ( = ?auto_42393 ?auto_42396 ) ) ( not ( = ?auto_42398 ?auto_42396 ) ) ( not ( = ?auto_42400 ?auto_42396 ) ) ( IS-CRATE ?auto_42400 ) ( not ( = ?auto_42392 ?auto_42413 ) ) ( not ( = ?auto_42393 ?auto_42413 ) ) ( not ( = ?auto_42398 ?auto_42413 ) ) ( not ( = ?auto_42400 ?auto_42413 ) ) ( not ( = ?auto_42396 ?auto_42413 ) ) ( not ( = ?auto_42411 ?auto_42404 ) ) ( not ( = ?auto_42395 ?auto_42411 ) ) ( not ( = ?auto_42406 ?auto_42411 ) ) ( HOIST-AT ?auto_42415 ?auto_42411 ) ( not ( = ?auto_42407 ?auto_42415 ) ) ( not ( = ?auto_42394 ?auto_42415 ) ) ( not ( = ?auto_42409 ?auto_42415 ) ) ( AVAILABLE ?auto_42415 ) ( SURFACE-AT ?auto_42400 ?auto_42411 ) ( ON ?auto_42400 ?auto_42412 ) ( CLEAR ?auto_42400 ) ( not ( = ?auto_42392 ?auto_42412 ) ) ( not ( = ?auto_42393 ?auto_42412 ) ) ( not ( = ?auto_42398 ?auto_42412 ) ) ( not ( = ?auto_42400 ?auto_42412 ) ) ( not ( = ?auto_42396 ?auto_42412 ) ) ( not ( = ?auto_42413 ?auto_42412 ) ) ( IS-CRATE ?auto_42413 ) ( not ( = ?auto_42392 ?auto_42397 ) ) ( not ( = ?auto_42393 ?auto_42397 ) ) ( not ( = ?auto_42398 ?auto_42397 ) ) ( not ( = ?auto_42400 ?auto_42397 ) ) ( not ( = ?auto_42396 ?auto_42397 ) ) ( not ( = ?auto_42413 ?auto_42397 ) ) ( not ( = ?auto_42412 ?auto_42397 ) ) ( AVAILABLE ?auto_42394 ) ( SURFACE-AT ?auto_42413 ?auto_42395 ) ( ON ?auto_42413 ?auto_42410 ) ( CLEAR ?auto_42413 ) ( not ( = ?auto_42392 ?auto_42410 ) ) ( not ( = ?auto_42393 ?auto_42410 ) ) ( not ( = ?auto_42398 ?auto_42410 ) ) ( not ( = ?auto_42400 ?auto_42410 ) ) ( not ( = ?auto_42396 ?auto_42410 ) ) ( not ( = ?auto_42413 ?auto_42410 ) ) ( not ( = ?auto_42412 ?auto_42410 ) ) ( not ( = ?auto_42397 ?auto_42410 ) ) ( IS-CRATE ?auto_42397 ) ( not ( = ?auto_42392 ?auto_42414 ) ) ( not ( = ?auto_42393 ?auto_42414 ) ) ( not ( = ?auto_42398 ?auto_42414 ) ) ( not ( = ?auto_42400 ?auto_42414 ) ) ( not ( = ?auto_42396 ?auto_42414 ) ) ( not ( = ?auto_42413 ?auto_42414 ) ) ( not ( = ?auto_42412 ?auto_42414 ) ) ( not ( = ?auto_42397 ?auto_42414 ) ) ( not ( = ?auto_42410 ?auto_42414 ) ) ( not ( = ?auto_42403 ?auto_42404 ) ) ( not ( = ?auto_42395 ?auto_42403 ) ) ( not ( = ?auto_42406 ?auto_42403 ) ) ( not ( = ?auto_42411 ?auto_42403 ) ) ( HOIST-AT ?auto_42408 ?auto_42403 ) ( not ( = ?auto_42407 ?auto_42408 ) ) ( not ( = ?auto_42394 ?auto_42408 ) ) ( not ( = ?auto_42409 ?auto_42408 ) ) ( not ( = ?auto_42415 ?auto_42408 ) ) ( AVAILABLE ?auto_42408 ) ( SURFACE-AT ?auto_42397 ?auto_42403 ) ( ON ?auto_42397 ?auto_42405 ) ( CLEAR ?auto_42397 ) ( not ( = ?auto_42392 ?auto_42405 ) ) ( not ( = ?auto_42393 ?auto_42405 ) ) ( not ( = ?auto_42398 ?auto_42405 ) ) ( not ( = ?auto_42400 ?auto_42405 ) ) ( not ( = ?auto_42396 ?auto_42405 ) ) ( not ( = ?auto_42413 ?auto_42405 ) ) ( not ( = ?auto_42412 ?auto_42405 ) ) ( not ( = ?auto_42397 ?auto_42405 ) ) ( not ( = ?auto_42410 ?auto_42405 ) ) ( not ( = ?auto_42414 ?auto_42405 ) ) ( SURFACE-AT ?auto_42402 ?auto_42404 ) ( CLEAR ?auto_42402 ) ( IS-CRATE ?auto_42414 ) ( not ( = ?auto_42392 ?auto_42402 ) ) ( not ( = ?auto_42393 ?auto_42402 ) ) ( not ( = ?auto_42398 ?auto_42402 ) ) ( not ( = ?auto_42400 ?auto_42402 ) ) ( not ( = ?auto_42396 ?auto_42402 ) ) ( not ( = ?auto_42413 ?auto_42402 ) ) ( not ( = ?auto_42412 ?auto_42402 ) ) ( not ( = ?auto_42397 ?auto_42402 ) ) ( not ( = ?auto_42410 ?auto_42402 ) ) ( not ( = ?auto_42414 ?auto_42402 ) ) ( not ( = ?auto_42405 ?auto_42402 ) ) ( AVAILABLE ?auto_42407 ) ( AVAILABLE ?auto_42409 ) ( SURFACE-AT ?auto_42414 ?auto_42406 ) ( ON ?auto_42414 ?auto_42401 ) ( CLEAR ?auto_42414 ) ( not ( = ?auto_42392 ?auto_42401 ) ) ( not ( = ?auto_42393 ?auto_42401 ) ) ( not ( = ?auto_42398 ?auto_42401 ) ) ( not ( = ?auto_42400 ?auto_42401 ) ) ( not ( = ?auto_42396 ?auto_42401 ) ) ( not ( = ?auto_42413 ?auto_42401 ) ) ( not ( = ?auto_42412 ?auto_42401 ) ) ( not ( = ?auto_42397 ?auto_42401 ) ) ( not ( = ?auto_42410 ?auto_42401 ) ) ( not ( = ?auto_42414 ?auto_42401 ) ) ( not ( = ?auto_42405 ?auto_42401 ) ) ( not ( = ?auto_42402 ?auto_42401 ) ) ( TRUCK-AT ?auto_42399 ?auto_42404 ) )
    :subtasks
    ( ( !DRIVE ?auto_42399 ?auto_42404 ?auto_42406 )
      ( MAKE-ON ?auto_42392 ?auto_42393 )
      ( MAKE-ON-VERIFY ?auto_42392 ?auto_42393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42416 - SURFACE
      ?auto_42417 - SURFACE
    )
    :vars
    (
      ?auto_42420 - HOIST
      ?auto_42425 - PLACE
      ?auto_42436 - PLACE
      ?auto_42429 - HOIST
      ?auto_42426 - SURFACE
      ?auto_42438 - SURFACE
      ?auto_42430 - PLACE
      ?auto_42434 - HOIST
      ?auto_42419 - SURFACE
      ?auto_42432 - SURFACE
      ?auto_42431 - PLACE
      ?auto_42435 - HOIST
      ?auto_42433 - SURFACE
      ?auto_42424 - SURFACE
      ?auto_42437 - SURFACE
      ?auto_42423 - SURFACE
      ?auto_42428 - PLACE
      ?auto_42439 - HOIST
      ?auto_42421 - SURFACE
      ?auto_42418 - SURFACE
      ?auto_42427 - SURFACE
      ?auto_42422 - TRUCK
      ?auto_42440 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42420 ?auto_42425 ) ( IS-CRATE ?auto_42416 ) ( not ( = ?auto_42416 ?auto_42417 ) ) ( not ( = ?auto_42436 ?auto_42425 ) ) ( HOIST-AT ?auto_42429 ?auto_42436 ) ( not ( = ?auto_42420 ?auto_42429 ) ) ( SURFACE-AT ?auto_42416 ?auto_42436 ) ( ON ?auto_42416 ?auto_42426 ) ( CLEAR ?auto_42416 ) ( not ( = ?auto_42416 ?auto_42426 ) ) ( not ( = ?auto_42417 ?auto_42426 ) ) ( IS-CRATE ?auto_42417 ) ( not ( = ?auto_42416 ?auto_42438 ) ) ( not ( = ?auto_42417 ?auto_42438 ) ) ( not ( = ?auto_42426 ?auto_42438 ) ) ( not ( = ?auto_42430 ?auto_42425 ) ) ( not ( = ?auto_42436 ?auto_42430 ) ) ( HOIST-AT ?auto_42434 ?auto_42430 ) ( not ( = ?auto_42420 ?auto_42434 ) ) ( not ( = ?auto_42429 ?auto_42434 ) ) ( SURFACE-AT ?auto_42417 ?auto_42430 ) ( ON ?auto_42417 ?auto_42419 ) ( CLEAR ?auto_42417 ) ( not ( = ?auto_42416 ?auto_42419 ) ) ( not ( = ?auto_42417 ?auto_42419 ) ) ( not ( = ?auto_42426 ?auto_42419 ) ) ( not ( = ?auto_42438 ?auto_42419 ) ) ( IS-CRATE ?auto_42438 ) ( not ( = ?auto_42416 ?auto_42432 ) ) ( not ( = ?auto_42417 ?auto_42432 ) ) ( not ( = ?auto_42426 ?auto_42432 ) ) ( not ( = ?auto_42438 ?auto_42432 ) ) ( not ( = ?auto_42419 ?auto_42432 ) ) ( not ( = ?auto_42431 ?auto_42425 ) ) ( not ( = ?auto_42436 ?auto_42431 ) ) ( not ( = ?auto_42430 ?auto_42431 ) ) ( HOIST-AT ?auto_42435 ?auto_42431 ) ( not ( = ?auto_42420 ?auto_42435 ) ) ( not ( = ?auto_42429 ?auto_42435 ) ) ( not ( = ?auto_42434 ?auto_42435 ) ) ( AVAILABLE ?auto_42435 ) ( SURFACE-AT ?auto_42438 ?auto_42431 ) ( ON ?auto_42438 ?auto_42433 ) ( CLEAR ?auto_42438 ) ( not ( = ?auto_42416 ?auto_42433 ) ) ( not ( = ?auto_42417 ?auto_42433 ) ) ( not ( = ?auto_42426 ?auto_42433 ) ) ( not ( = ?auto_42438 ?auto_42433 ) ) ( not ( = ?auto_42419 ?auto_42433 ) ) ( not ( = ?auto_42432 ?auto_42433 ) ) ( IS-CRATE ?auto_42432 ) ( not ( = ?auto_42416 ?auto_42424 ) ) ( not ( = ?auto_42417 ?auto_42424 ) ) ( not ( = ?auto_42426 ?auto_42424 ) ) ( not ( = ?auto_42438 ?auto_42424 ) ) ( not ( = ?auto_42419 ?auto_42424 ) ) ( not ( = ?auto_42432 ?auto_42424 ) ) ( not ( = ?auto_42433 ?auto_42424 ) ) ( AVAILABLE ?auto_42429 ) ( SURFACE-AT ?auto_42432 ?auto_42436 ) ( ON ?auto_42432 ?auto_42437 ) ( CLEAR ?auto_42432 ) ( not ( = ?auto_42416 ?auto_42437 ) ) ( not ( = ?auto_42417 ?auto_42437 ) ) ( not ( = ?auto_42426 ?auto_42437 ) ) ( not ( = ?auto_42438 ?auto_42437 ) ) ( not ( = ?auto_42419 ?auto_42437 ) ) ( not ( = ?auto_42432 ?auto_42437 ) ) ( not ( = ?auto_42433 ?auto_42437 ) ) ( not ( = ?auto_42424 ?auto_42437 ) ) ( IS-CRATE ?auto_42424 ) ( not ( = ?auto_42416 ?auto_42423 ) ) ( not ( = ?auto_42417 ?auto_42423 ) ) ( not ( = ?auto_42426 ?auto_42423 ) ) ( not ( = ?auto_42438 ?auto_42423 ) ) ( not ( = ?auto_42419 ?auto_42423 ) ) ( not ( = ?auto_42432 ?auto_42423 ) ) ( not ( = ?auto_42433 ?auto_42423 ) ) ( not ( = ?auto_42424 ?auto_42423 ) ) ( not ( = ?auto_42437 ?auto_42423 ) ) ( not ( = ?auto_42428 ?auto_42425 ) ) ( not ( = ?auto_42436 ?auto_42428 ) ) ( not ( = ?auto_42430 ?auto_42428 ) ) ( not ( = ?auto_42431 ?auto_42428 ) ) ( HOIST-AT ?auto_42439 ?auto_42428 ) ( not ( = ?auto_42420 ?auto_42439 ) ) ( not ( = ?auto_42429 ?auto_42439 ) ) ( not ( = ?auto_42434 ?auto_42439 ) ) ( not ( = ?auto_42435 ?auto_42439 ) ) ( AVAILABLE ?auto_42439 ) ( SURFACE-AT ?auto_42424 ?auto_42428 ) ( ON ?auto_42424 ?auto_42421 ) ( CLEAR ?auto_42424 ) ( not ( = ?auto_42416 ?auto_42421 ) ) ( not ( = ?auto_42417 ?auto_42421 ) ) ( not ( = ?auto_42426 ?auto_42421 ) ) ( not ( = ?auto_42438 ?auto_42421 ) ) ( not ( = ?auto_42419 ?auto_42421 ) ) ( not ( = ?auto_42432 ?auto_42421 ) ) ( not ( = ?auto_42433 ?auto_42421 ) ) ( not ( = ?auto_42424 ?auto_42421 ) ) ( not ( = ?auto_42437 ?auto_42421 ) ) ( not ( = ?auto_42423 ?auto_42421 ) ) ( IS-CRATE ?auto_42423 ) ( not ( = ?auto_42416 ?auto_42418 ) ) ( not ( = ?auto_42417 ?auto_42418 ) ) ( not ( = ?auto_42426 ?auto_42418 ) ) ( not ( = ?auto_42438 ?auto_42418 ) ) ( not ( = ?auto_42419 ?auto_42418 ) ) ( not ( = ?auto_42432 ?auto_42418 ) ) ( not ( = ?auto_42433 ?auto_42418 ) ) ( not ( = ?auto_42424 ?auto_42418 ) ) ( not ( = ?auto_42437 ?auto_42418 ) ) ( not ( = ?auto_42423 ?auto_42418 ) ) ( not ( = ?auto_42421 ?auto_42418 ) ) ( AVAILABLE ?auto_42434 ) ( SURFACE-AT ?auto_42423 ?auto_42430 ) ( ON ?auto_42423 ?auto_42427 ) ( CLEAR ?auto_42423 ) ( not ( = ?auto_42416 ?auto_42427 ) ) ( not ( = ?auto_42417 ?auto_42427 ) ) ( not ( = ?auto_42426 ?auto_42427 ) ) ( not ( = ?auto_42438 ?auto_42427 ) ) ( not ( = ?auto_42419 ?auto_42427 ) ) ( not ( = ?auto_42432 ?auto_42427 ) ) ( not ( = ?auto_42433 ?auto_42427 ) ) ( not ( = ?auto_42424 ?auto_42427 ) ) ( not ( = ?auto_42437 ?auto_42427 ) ) ( not ( = ?auto_42423 ?auto_42427 ) ) ( not ( = ?auto_42421 ?auto_42427 ) ) ( not ( = ?auto_42418 ?auto_42427 ) ) ( TRUCK-AT ?auto_42422 ?auto_42425 ) ( SURFACE-AT ?auto_42440 ?auto_42425 ) ( CLEAR ?auto_42440 ) ( LIFTING ?auto_42420 ?auto_42418 ) ( IS-CRATE ?auto_42418 ) ( not ( = ?auto_42416 ?auto_42440 ) ) ( not ( = ?auto_42417 ?auto_42440 ) ) ( not ( = ?auto_42426 ?auto_42440 ) ) ( not ( = ?auto_42438 ?auto_42440 ) ) ( not ( = ?auto_42419 ?auto_42440 ) ) ( not ( = ?auto_42432 ?auto_42440 ) ) ( not ( = ?auto_42433 ?auto_42440 ) ) ( not ( = ?auto_42424 ?auto_42440 ) ) ( not ( = ?auto_42437 ?auto_42440 ) ) ( not ( = ?auto_42423 ?auto_42440 ) ) ( not ( = ?auto_42421 ?auto_42440 ) ) ( not ( = ?auto_42418 ?auto_42440 ) ) ( not ( = ?auto_42427 ?auto_42440 ) ) )
    :subtasks
    ( ( !DROP ?auto_42420 ?auto_42418 ?auto_42440 ?auto_42425 )
      ( MAKE-ON ?auto_42416 ?auto_42417 )
      ( MAKE-ON-VERIFY ?auto_42416 ?auto_42417 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42441 - SURFACE
      ?auto_42442 - SURFACE
    )
    :vars
    (
      ?auto_42459 - HOIST
      ?auto_42454 - PLACE
      ?auto_42465 - PLACE
      ?auto_42452 - HOIST
      ?auto_42456 - SURFACE
      ?auto_42450 - SURFACE
      ?auto_42451 - PLACE
      ?auto_42463 - HOIST
      ?auto_42446 - SURFACE
      ?auto_42444 - SURFACE
      ?auto_42453 - PLACE
      ?auto_42464 - HOIST
      ?auto_42447 - SURFACE
      ?auto_42448 - SURFACE
      ?auto_42449 - SURFACE
      ?auto_42460 - SURFACE
      ?auto_42461 - PLACE
      ?auto_42443 - HOIST
      ?auto_42462 - SURFACE
      ?auto_42457 - SURFACE
      ?auto_42455 - SURFACE
      ?auto_42445 - TRUCK
      ?auto_42458 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42459 ?auto_42454 ) ( IS-CRATE ?auto_42441 ) ( not ( = ?auto_42441 ?auto_42442 ) ) ( not ( = ?auto_42465 ?auto_42454 ) ) ( HOIST-AT ?auto_42452 ?auto_42465 ) ( not ( = ?auto_42459 ?auto_42452 ) ) ( SURFACE-AT ?auto_42441 ?auto_42465 ) ( ON ?auto_42441 ?auto_42456 ) ( CLEAR ?auto_42441 ) ( not ( = ?auto_42441 ?auto_42456 ) ) ( not ( = ?auto_42442 ?auto_42456 ) ) ( IS-CRATE ?auto_42442 ) ( not ( = ?auto_42441 ?auto_42450 ) ) ( not ( = ?auto_42442 ?auto_42450 ) ) ( not ( = ?auto_42456 ?auto_42450 ) ) ( not ( = ?auto_42451 ?auto_42454 ) ) ( not ( = ?auto_42465 ?auto_42451 ) ) ( HOIST-AT ?auto_42463 ?auto_42451 ) ( not ( = ?auto_42459 ?auto_42463 ) ) ( not ( = ?auto_42452 ?auto_42463 ) ) ( SURFACE-AT ?auto_42442 ?auto_42451 ) ( ON ?auto_42442 ?auto_42446 ) ( CLEAR ?auto_42442 ) ( not ( = ?auto_42441 ?auto_42446 ) ) ( not ( = ?auto_42442 ?auto_42446 ) ) ( not ( = ?auto_42456 ?auto_42446 ) ) ( not ( = ?auto_42450 ?auto_42446 ) ) ( IS-CRATE ?auto_42450 ) ( not ( = ?auto_42441 ?auto_42444 ) ) ( not ( = ?auto_42442 ?auto_42444 ) ) ( not ( = ?auto_42456 ?auto_42444 ) ) ( not ( = ?auto_42450 ?auto_42444 ) ) ( not ( = ?auto_42446 ?auto_42444 ) ) ( not ( = ?auto_42453 ?auto_42454 ) ) ( not ( = ?auto_42465 ?auto_42453 ) ) ( not ( = ?auto_42451 ?auto_42453 ) ) ( HOIST-AT ?auto_42464 ?auto_42453 ) ( not ( = ?auto_42459 ?auto_42464 ) ) ( not ( = ?auto_42452 ?auto_42464 ) ) ( not ( = ?auto_42463 ?auto_42464 ) ) ( AVAILABLE ?auto_42464 ) ( SURFACE-AT ?auto_42450 ?auto_42453 ) ( ON ?auto_42450 ?auto_42447 ) ( CLEAR ?auto_42450 ) ( not ( = ?auto_42441 ?auto_42447 ) ) ( not ( = ?auto_42442 ?auto_42447 ) ) ( not ( = ?auto_42456 ?auto_42447 ) ) ( not ( = ?auto_42450 ?auto_42447 ) ) ( not ( = ?auto_42446 ?auto_42447 ) ) ( not ( = ?auto_42444 ?auto_42447 ) ) ( IS-CRATE ?auto_42444 ) ( not ( = ?auto_42441 ?auto_42448 ) ) ( not ( = ?auto_42442 ?auto_42448 ) ) ( not ( = ?auto_42456 ?auto_42448 ) ) ( not ( = ?auto_42450 ?auto_42448 ) ) ( not ( = ?auto_42446 ?auto_42448 ) ) ( not ( = ?auto_42444 ?auto_42448 ) ) ( not ( = ?auto_42447 ?auto_42448 ) ) ( AVAILABLE ?auto_42452 ) ( SURFACE-AT ?auto_42444 ?auto_42465 ) ( ON ?auto_42444 ?auto_42449 ) ( CLEAR ?auto_42444 ) ( not ( = ?auto_42441 ?auto_42449 ) ) ( not ( = ?auto_42442 ?auto_42449 ) ) ( not ( = ?auto_42456 ?auto_42449 ) ) ( not ( = ?auto_42450 ?auto_42449 ) ) ( not ( = ?auto_42446 ?auto_42449 ) ) ( not ( = ?auto_42444 ?auto_42449 ) ) ( not ( = ?auto_42447 ?auto_42449 ) ) ( not ( = ?auto_42448 ?auto_42449 ) ) ( IS-CRATE ?auto_42448 ) ( not ( = ?auto_42441 ?auto_42460 ) ) ( not ( = ?auto_42442 ?auto_42460 ) ) ( not ( = ?auto_42456 ?auto_42460 ) ) ( not ( = ?auto_42450 ?auto_42460 ) ) ( not ( = ?auto_42446 ?auto_42460 ) ) ( not ( = ?auto_42444 ?auto_42460 ) ) ( not ( = ?auto_42447 ?auto_42460 ) ) ( not ( = ?auto_42448 ?auto_42460 ) ) ( not ( = ?auto_42449 ?auto_42460 ) ) ( not ( = ?auto_42461 ?auto_42454 ) ) ( not ( = ?auto_42465 ?auto_42461 ) ) ( not ( = ?auto_42451 ?auto_42461 ) ) ( not ( = ?auto_42453 ?auto_42461 ) ) ( HOIST-AT ?auto_42443 ?auto_42461 ) ( not ( = ?auto_42459 ?auto_42443 ) ) ( not ( = ?auto_42452 ?auto_42443 ) ) ( not ( = ?auto_42463 ?auto_42443 ) ) ( not ( = ?auto_42464 ?auto_42443 ) ) ( AVAILABLE ?auto_42443 ) ( SURFACE-AT ?auto_42448 ?auto_42461 ) ( ON ?auto_42448 ?auto_42462 ) ( CLEAR ?auto_42448 ) ( not ( = ?auto_42441 ?auto_42462 ) ) ( not ( = ?auto_42442 ?auto_42462 ) ) ( not ( = ?auto_42456 ?auto_42462 ) ) ( not ( = ?auto_42450 ?auto_42462 ) ) ( not ( = ?auto_42446 ?auto_42462 ) ) ( not ( = ?auto_42444 ?auto_42462 ) ) ( not ( = ?auto_42447 ?auto_42462 ) ) ( not ( = ?auto_42448 ?auto_42462 ) ) ( not ( = ?auto_42449 ?auto_42462 ) ) ( not ( = ?auto_42460 ?auto_42462 ) ) ( IS-CRATE ?auto_42460 ) ( not ( = ?auto_42441 ?auto_42457 ) ) ( not ( = ?auto_42442 ?auto_42457 ) ) ( not ( = ?auto_42456 ?auto_42457 ) ) ( not ( = ?auto_42450 ?auto_42457 ) ) ( not ( = ?auto_42446 ?auto_42457 ) ) ( not ( = ?auto_42444 ?auto_42457 ) ) ( not ( = ?auto_42447 ?auto_42457 ) ) ( not ( = ?auto_42448 ?auto_42457 ) ) ( not ( = ?auto_42449 ?auto_42457 ) ) ( not ( = ?auto_42460 ?auto_42457 ) ) ( not ( = ?auto_42462 ?auto_42457 ) ) ( AVAILABLE ?auto_42463 ) ( SURFACE-AT ?auto_42460 ?auto_42451 ) ( ON ?auto_42460 ?auto_42455 ) ( CLEAR ?auto_42460 ) ( not ( = ?auto_42441 ?auto_42455 ) ) ( not ( = ?auto_42442 ?auto_42455 ) ) ( not ( = ?auto_42456 ?auto_42455 ) ) ( not ( = ?auto_42450 ?auto_42455 ) ) ( not ( = ?auto_42446 ?auto_42455 ) ) ( not ( = ?auto_42444 ?auto_42455 ) ) ( not ( = ?auto_42447 ?auto_42455 ) ) ( not ( = ?auto_42448 ?auto_42455 ) ) ( not ( = ?auto_42449 ?auto_42455 ) ) ( not ( = ?auto_42460 ?auto_42455 ) ) ( not ( = ?auto_42462 ?auto_42455 ) ) ( not ( = ?auto_42457 ?auto_42455 ) ) ( TRUCK-AT ?auto_42445 ?auto_42454 ) ( SURFACE-AT ?auto_42458 ?auto_42454 ) ( CLEAR ?auto_42458 ) ( IS-CRATE ?auto_42457 ) ( not ( = ?auto_42441 ?auto_42458 ) ) ( not ( = ?auto_42442 ?auto_42458 ) ) ( not ( = ?auto_42456 ?auto_42458 ) ) ( not ( = ?auto_42450 ?auto_42458 ) ) ( not ( = ?auto_42446 ?auto_42458 ) ) ( not ( = ?auto_42444 ?auto_42458 ) ) ( not ( = ?auto_42447 ?auto_42458 ) ) ( not ( = ?auto_42448 ?auto_42458 ) ) ( not ( = ?auto_42449 ?auto_42458 ) ) ( not ( = ?auto_42460 ?auto_42458 ) ) ( not ( = ?auto_42462 ?auto_42458 ) ) ( not ( = ?auto_42457 ?auto_42458 ) ) ( not ( = ?auto_42455 ?auto_42458 ) ) ( AVAILABLE ?auto_42459 ) ( IN ?auto_42457 ?auto_42445 ) )
    :subtasks
    ( ( !UNLOAD ?auto_42459 ?auto_42457 ?auto_42445 ?auto_42454 )
      ( MAKE-ON ?auto_42441 ?auto_42442 )
      ( MAKE-ON-VERIFY ?auto_42441 ?auto_42442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42466 - SURFACE
      ?auto_42467 - SURFACE
    )
    :vars
    (
      ?auto_42475 - HOIST
      ?auto_42479 - PLACE
      ?auto_42490 - PLACE
      ?auto_42480 - HOIST
      ?auto_42478 - SURFACE
      ?auto_42489 - SURFACE
      ?auto_42470 - PLACE
      ?auto_42474 - HOIST
      ?auto_42471 - SURFACE
      ?auto_42483 - SURFACE
      ?auto_42484 - PLACE
      ?auto_42476 - HOIST
      ?auto_42469 - SURFACE
      ?auto_42487 - SURFACE
      ?auto_42477 - SURFACE
      ?auto_42482 - SURFACE
      ?auto_42486 - PLACE
      ?auto_42472 - HOIST
      ?auto_42485 - SURFACE
      ?auto_42473 - SURFACE
      ?auto_42488 - SURFACE
      ?auto_42468 - SURFACE
      ?auto_42481 - TRUCK
      ?auto_42491 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42475 ?auto_42479 ) ( IS-CRATE ?auto_42466 ) ( not ( = ?auto_42466 ?auto_42467 ) ) ( not ( = ?auto_42490 ?auto_42479 ) ) ( HOIST-AT ?auto_42480 ?auto_42490 ) ( not ( = ?auto_42475 ?auto_42480 ) ) ( SURFACE-AT ?auto_42466 ?auto_42490 ) ( ON ?auto_42466 ?auto_42478 ) ( CLEAR ?auto_42466 ) ( not ( = ?auto_42466 ?auto_42478 ) ) ( not ( = ?auto_42467 ?auto_42478 ) ) ( IS-CRATE ?auto_42467 ) ( not ( = ?auto_42466 ?auto_42489 ) ) ( not ( = ?auto_42467 ?auto_42489 ) ) ( not ( = ?auto_42478 ?auto_42489 ) ) ( not ( = ?auto_42470 ?auto_42479 ) ) ( not ( = ?auto_42490 ?auto_42470 ) ) ( HOIST-AT ?auto_42474 ?auto_42470 ) ( not ( = ?auto_42475 ?auto_42474 ) ) ( not ( = ?auto_42480 ?auto_42474 ) ) ( SURFACE-AT ?auto_42467 ?auto_42470 ) ( ON ?auto_42467 ?auto_42471 ) ( CLEAR ?auto_42467 ) ( not ( = ?auto_42466 ?auto_42471 ) ) ( not ( = ?auto_42467 ?auto_42471 ) ) ( not ( = ?auto_42478 ?auto_42471 ) ) ( not ( = ?auto_42489 ?auto_42471 ) ) ( IS-CRATE ?auto_42489 ) ( not ( = ?auto_42466 ?auto_42483 ) ) ( not ( = ?auto_42467 ?auto_42483 ) ) ( not ( = ?auto_42478 ?auto_42483 ) ) ( not ( = ?auto_42489 ?auto_42483 ) ) ( not ( = ?auto_42471 ?auto_42483 ) ) ( not ( = ?auto_42484 ?auto_42479 ) ) ( not ( = ?auto_42490 ?auto_42484 ) ) ( not ( = ?auto_42470 ?auto_42484 ) ) ( HOIST-AT ?auto_42476 ?auto_42484 ) ( not ( = ?auto_42475 ?auto_42476 ) ) ( not ( = ?auto_42480 ?auto_42476 ) ) ( not ( = ?auto_42474 ?auto_42476 ) ) ( AVAILABLE ?auto_42476 ) ( SURFACE-AT ?auto_42489 ?auto_42484 ) ( ON ?auto_42489 ?auto_42469 ) ( CLEAR ?auto_42489 ) ( not ( = ?auto_42466 ?auto_42469 ) ) ( not ( = ?auto_42467 ?auto_42469 ) ) ( not ( = ?auto_42478 ?auto_42469 ) ) ( not ( = ?auto_42489 ?auto_42469 ) ) ( not ( = ?auto_42471 ?auto_42469 ) ) ( not ( = ?auto_42483 ?auto_42469 ) ) ( IS-CRATE ?auto_42483 ) ( not ( = ?auto_42466 ?auto_42487 ) ) ( not ( = ?auto_42467 ?auto_42487 ) ) ( not ( = ?auto_42478 ?auto_42487 ) ) ( not ( = ?auto_42489 ?auto_42487 ) ) ( not ( = ?auto_42471 ?auto_42487 ) ) ( not ( = ?auto_42483 ?auto_42487 ) ) ( not ( = ?auto_42469 ?auto_42487 ) ) ( AVAILABLE ?auto_42480 ) ( SURFACE-AT ?auto_42483 ?auto_42490 ) ( ON ?auto_42483 ?auto_42477 ) ( CLEAR ?auto_42483 ) ( not ( = ?auto_42466 ?auto_42477 ) ) ( not ( = ?auto_42467 ?auto_42477 ) ) ( not ( = ?auto_42478 ?auto_42477 ) ) ( not ( = ?auto_42489 ?auto_42477 ) ) ( not ( = ?auto_42471 ?auto_42477 ) ) ( not ( = ?auto_42483 ?auto_42477 ) ) ( not ( = ?auto_42469 ?auto_42477 ) ) ( not ( = ?auto_42487 ?auto_42477 ) ) ( IS-CRATE ?auto_42487 ) ( not ( = ?auto_42466 ?auto_42482 ) ) ( not ( = ?auto_42467 ?auto_42482 ) ) ( not ( = ?auto_42478 ?auto_42482 ) ) ( not ( = ?auto_42489 ?auto_42482 ) ) ( not ( = ?auto_42471 ?auto_42482 ) ) ( not ( = ?auto_42483 ?auto_42482 ) ) ( not ( = ?auto_42469 ?auto_42482 ) ) ( not ( = ?auto_42487 ?auto_42482 ) ) ( not ( = ?auto_42477 ?auto_42482 ) ) ( not ( = ?auto_42486 ?auto_42479 ) ) ( not ( = ?auto_42490 ?auto_42486 ) ) ( not ( = ?auto_42470 ?auto_42486 ) ) ( not ( = ?auto_42484 ?auto_42486 ) ) ( HOIST-AT ?auto_42472 ?auto_42486 ) ( not ( = ?auto_42475 ?auto_42472 ) ) ( not ( = ?auto_42480 ?auto_42472 ) ) ( not ( = ?auto_42474 ?auto_42472 ) ) ( not ( = ?auto_42476 ?auto_42472 ) ) ( AVAILABLE ?auto_42472 ) ( SURFACE-AT ?auto_42487 ?auto_42486 ) ( ON ?auto_42487 ?auto_42485 ) ( CLEAR ?auto_42487 ) ( not ( = ?auto_42466 ?auto_42485 ) ) ( not ( = ?auto_42467 ?auto_42485 ) ) ( not ( = ?auto_42478 ?auto_42485 ) ) ( not ( = ?auto_42489 ?auto_42485 ) ) ( not ( = ?auto_42471 ?auto_42485 ) ) ( not ( = ?auto_42483 ?auto_42485 ) ) ( not ( = ?auto_42469 ?auto_42485 ) ) ( not ( = ?auto_42487 ?auto_42485 ) ) ( not ( = ?auto_42477 ?auto_42485 ) ) ( not ( = ?auto_42482 ?auto_42485 ) ) ( IS-CRATE ?auto_42482 ) ( not ( = ?auto_42466 ?auto_42473 ) ) ( not ( = ?auto_42467 ?auto_42473 ) ) ( not ( = ?auto_42478 ?auto_42473 ) ) ( not ( = ?auto_42489 ?auto_42473 ) ) ( not ( = ?auto_42471 ?auto_42473 ) ) ( not ( = ?auto_42483 ?auto_42473 ) ) ( not ( = ?auto_42469 ?auto_42473 ) ) ( not ( = ?auto_42487 ?auto_42473 ) ) ( not ( = ?auto_42477 ?auto_42473 ) ) ( not ( = ?auto_42482 ?auto_42473 ) ) ( not ( = ?auto_42485 ?auto_42473 ) ) ( AVAILABLE ?auto_42474 ) ( SURFACE-AT ?auto_42482 ?auto_42470 ) ( ON ?auto_42482 ?auto_42488 ) ( CLEAR ?auto_42482 ) ( not ( = ?auto_42466 ?auto_42488 ) ) ( not ( = ?auto_42467 ?auto_42488 ) ) ( not ( = ?auto_42478 ?auto_42488 ) ) ( not ( = ?auto_42489 ?auto_42488 ) ) ( not ( = ?auto_42471 ?auto_42488 ) ) ( not ( = ?auto_42483 ?auto_42488 ) ) ( not ( = ?auto_42469 ?auto_42488 ) ) ( not ( = ?auto_42487 ?auto_42488 ) ) ( not ( = ?auto_42477 ?auto_42488 ) ) ( not ( = ?auto_42482 ?auto_42488 ) ) ( not ( = ?auto_42485 ?auto_42488 ) ) ( not ( = ?auto_42473 ?auto_42488 ) ) ( SURFACE-AT ?auto_42468 ?auto_42479 ) ( CLEAR ?auto_42468 ) ( IS-CRATE ?auto_42473 ) ( not ( = ?auto_42466 ?auto_42468 ) ) ( not ( = ?auto_42467 ?auto_42468 ) ) ( not ( = ?auto_42478 ?auto_42468 ) ) ( not ( = ?auto_42489 ?auto_42468 ) ) ( not ( = ?auto_42471 ?auto_42468 ) ) ( not ( = ?auto_42483 ?auto_42468 ) ) ( not ( = ?auto_42469 ?auto_42468 ) ) ( not ( = ?auto_42487 ?auto_42468 ) ) ( not ( = ?auto_42477 ?auto_42468 ) ) ( not ( = ?auto_42482 ?auto_42468 ) ) ( not ( = ?auto_42485 ?auto_42468 ) ) ( not ( = ?auto_42473 ?auto_42468 ) ) ( not ( = ?auto_42488 ?auto_42468 ) ) ( AVAILABLE ?auto_42475 ) ( IN ?auto_42473 ?auto_42481 ) ( TRUCK-AT ?auto_42481 ?auto_42491 ) ( not ( = ?auto_42491 ?auto_42479 ) ) ( not ( = ?auto_42490 ?auto_42491 ) ) ( not ( = ?auto_42470 ?auto_42491 ) ) ( not ( = ?auto_42484 ?auto_42491 ) ) ( not ( = ?auto_42486 ?auto_42491 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_42481 ?auto_42491 ?auto_42479 )
      ( MAKE-ON ?auto_42466 ?auto_42467 )
      ( MAKE-ON-VERIFY ?auto_42466 ?auto_42467 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42492 - SURFACE
      ?auto_42493 - SURFACE
    )
    :vars
    (
      ?auto_42505 - HOIST
      ?auto_42517 - PLACE
      ?auto_42495 - PLACE
      ?auto_42509 - HOIST
      ?auto_42500 - SURFACE
      ?auto_42494 - SURFACE
      ?auto_42508 - PLACE
      ?auto_42513 - HOIST
      ?auto_42510 - SURFACE
      ?auto_42498 - SURFACE
      ?auto_42502 - PLACE
      ?auto_42515 - HOIST
      ?auto_42514 - SURFACE
      ?auto_42497 - SURFACE
      ?auto_42507 - SURFACE
      ?auto_42512 - SURFACE
      ?auto_42504 - PLACE
      ?auto_42501 - HOIST
      ?auto_42503 - SURFACE
      ?auto_42516 - SURFACE
      ?auto_42496 - SURFACE
      ?auto_42499 - SURFACE
      ?auto_42506 - TRUCK
      ?auto_42511 - PLACE
      ?auto_42518 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_42505 ?auto_42517 ) ( IS-CRATE ?auto_42492 ) ( not ( = ?auto_42492 ?auto_42493 ) ) ( not ( = ?auto_42495 ?auto_42517 ) ) ( HOIST-AT ?auto_42509 ?auto_42495 ) ( not ( = ?auto_42505 ?auto_42509 ) ) ( SURFACE-AT ?auto_42492 ?auto_42495 ) ( ON ?auto_42492 ?auto_42500 ) ( CLEAR ?auto_42492 ) ( not ( = ?auto_42492 ?auto_42500 ) ) ( not ( = ?auto_42493 ?auto_42500 ) ) ( IS-CRATE ?auto_42493 ) ( not ( = ?auto_42492 ?auto_42494 ) ) ( not ( = ?auto_42493 ?auto_42494 ) ) ( not ( = ?auto_42500 ?auto_42494 ) ) ( not ( = ?auto_42508 ?auto_42517 ) ) ( not ( = ?auto_42495 ?auto_42508 ) ) ( HOIST-AT ?auto_42513 ?auto_42508 ) ( not ( = ?auto_42505 ?auto_42513 ) ) ( not ( = ?auto_42509 ?auto_42513 ) ) ( SURFACE-AT ?auto_42493 ?auto_42508 ) ( ON ?auto_42493 ?auto_42510 ) ( CLEAR ?auto_42493 ) ( not ( = ?auto_42492 ?auto_42510 ) ) ( not ( = ?auto_42493 ?auto_42510 ) ) ( not ( = ?auto_42500 ?auto_42510 ) ) ( not ( = ?auto_42494 ?auto_42510 ) ) ( IS-CRATE ?auto_42494 ) ( not ( = ?auto_42492 ?auto_42498 ) ) ( not ( = ?auto_42493 ?auto_42498 ) ) ( not ( = ?auto_42500 ?auto_42498 ) ) ( not ( = ?auto_42494 ?auto_42498 ) ) ( not ( = ?auto_42510 ?auto_42498 ) ) ( not ( = ?auto_42502 ?auto_42517 ) ) ( not ( = ?auto_42495 ?auto_42502 ) ) ( not ( = ?auto_42508 ?auto_42502 ) ) ( HOIST-AT ?auto_42515 ?auto_42502 ) ( not ( = ?auto_42505 ?auto_42515 ) ) ( not ( = ?auto_42509 ?auto_42515 ) ) ( not ( = ?auto_42513 ?auto_42515 ) ) ( AVAILABLE ?auto_42515 ) ( SURFACE-AT ?auto_42494 ?auto_42502 ) ( ON ?auto_42494 ?auto_42514 ) ( CLEAR ?auto_42494 ) ( not ( = ?auto_42492 ?auto_42514 ) ) ( not ( = ?auto_42493 ?auto_42514 ) ) ( not ( = ?auto_42500 ?auto_42514 ) ) ( not ( = ?auto_42494 ?auto_42514 ) ) ( not ( = ?auto_42510 ?auto_42514 ) ) ( not ( = ?auto_42498 ?auto_42514 ) ) ( IS-CRATE ?auto_42498 ) ( not ( = ?auto_42492 ?auto_42497 ) ) ( not ( = ?auto_42493 ?auto_42497 ) ) ( not ( = ?auto_42500 ?auto_42497 ) ) ( not ( = ?auto_42494 ?auto_42497 ) ) ( not ( = ?auto_42510 ?auto_42497 ) ) ( not ( = ?auto_42498 ?auto_42497 ) ) ( not ( = ?auto_42514 ?auto_42497 ) ) ( AVAILABLE ?auto_42509 ) ( SURFACE-AT ?auto_42498 ?auto_42495 ) ( ON ?auto_42498 ?auto_42507 ) ( CLEAR ?auto_42498 ) ( not ( = ?auto_42492 ?auto_42507 ) ) ( not ( = ?auto_42493 ?auto_42507 ) ) ( not ( = ?auto_42500 ?auto_42507 ) ) ( not ( = ?auto_42494 ?auto_42507 ) ) ( not ( = ?auto_42510 ?auto_42507 ) ) ( not ( = ?auto_42498 ?auto_42507 ) ) ( not ( = ?auto_42514 ?auto_42507 ) ) ( not ( = ?auto_42497 ?auto_42507 ) ) ( IS-CRATE ?auto_42497 ) ( not ( = ?auto_42492 ?auto_42512 ) ) ( not ( = ?auto_42493 ?auto_42512 ) ) ( not ( = ?auto_42500 ?auto_42512 ) ) ( not ( = ?auto_42494 ?auto_42512 ) ) ( not ( = ?auto_42510 ?auto_42512 ) ) ( not ( = ?auto_42498 ?auto_42512 ) ) ( not ( = ?auto_42514 ?auto_42512 ) ) ( not ( = ?auto_42497 ?auto_42512 ) ) ( not ( = ?auto_42507 ?auto_42512 ) ) ( not ( = ?auto_42504 ?auto_42517 ) ) ( not ( = ?auto_42495 ?auto_42504 ) ) ( not ( = ?auto_42508 ?auto_42504 ) ) ( not ( = ?auto_42502 ?auto_42504 ) ) ( HOIST-AT ?auto_42501 ?auto_42504 ) ( not ( = ?auto_42505 ?auto_42501 ) ) ( not ( = ?auto_42509 ?auto_42501 ) ) ( not ( = ?auto_42513 ?auto_42501 ) ) ( not ( = ?auto_42515 ?auto_42501 ) ) ( AVAILABLE ?auto_42501 ) ( SURFACE-AT ?auto_42497 ?auto_42504 ) ( ON ?auto_42497 ?auto_42503 ) ( CLEAR ?auto_42497 ) ( not ( = ?auto_42492 ?auto_42503 ) ) ( not ( = ?auto_42493 ?auto_42503 ) ) ( not ( = ?auto_42500 ?auto_42503 ) ) ( not ( = ?auto_42494 ?auto_42503 ) ) ( not ( = ?auto_42510 ?auto_42503 ) ) ( not ( = ?auto_42498 ?auto_42503 ) ) ( not ( = ?auto_42514 ?auto_42503 ) ) ( not ( = ?auto_42497 ?auto_42503 ) ) ( not ( = ?auto_42507 ?auto_42503 ) ) ( not ( = ?auto_42512 ?auto_42503 ) ) ( IS-CRATE ?auto_42512 ) ( not ( = ?auto_42492 ?auto_42516 ) ) ( not ( = ?auto_42493 ?auto_42516 ) ) ( not ( = ?auto_42500 ?auto_42516 ) ) ( not ( = ?auto_42494 ?auto_42516 ) ) ( not ( = ?auto_42510 ?auto_42516 ) ) ( not ( = ?auto_42498 ?auto_42516 ) ) ( not ( = ?auto_42514 ?auto_42516 ) ) ( not ( = ?auto_42497 ?auto_42516 ) ) ( not ( = ?auto_42507 ?auto_42516 ) ) ( not ( = ?auto_42512 ?auto_42516 ) ) ( not ( = ?auto_42503 ?auto_42516 ) ) ( AVAILABLE ?auto_42513 ) ( SURFACE-AT ?auto_42512 ?auto_42508 ) ( ON ?auto_42512 ?auto_42496 ) ( CLEAR ?auto_42512 ) ( not ( = ?auto_42492 ?auto_42496 ) ) ( not ( = ?auto_42493 ?auto_42496 ) ) ( not ( = ?auto_42500 ?auto_42496 ) ) ( not ( = ?auto_42494 ?auto_42496 ) ) ( not ( = ?auto_42510 ?auto_42496 ) ) ( not ( = ?auto_42498 ?auto_42496 ) ) ( not ( = ?auto_42514 ?auto_42496 ) ) ( not ( = ?auto_42497 ?auto_42496 ) ) ( not ( = ?auto_42507 ?auto_42496 ) ) ( not ( = ?auto_42512 ?auto_42496 ) ) ( not ( = ?auto_42503 ?auto_42496 ) ) ( not ( = ?auto_42516 ?auto_42496 ) ) ( SURFACE-AT ?auto_42499 ?auto_42517 ) ( CLEAR ?auto_42499 ) ( IS-CRATE ?auto_42516 ) ( not ( = ?auto_42492 ?auto_42499 ) ) ( not ( = ?auto_42493 ?auto_42499 ) ) ( not ( = ?auto_42500 ?auto_42499 ) ) ( not ( = ?auto_42494 ?auto_42499 ) ) ( not ( = ?auto_42510 ?auto_42499 ) ) ( not ( = ?auto_42498 ?auto_42499 ) ) ( not ( = ?auto_42514 ?auto_42499 ) ) ( not ( = ?auto_42497 ?auto_42499 ) ) ( not ( = ?auto_42507 ?auto_42499 ) ) ( not ( = ?auto_42512 ?auto_42499 ) ) ( not ( = ?auto_42503 ?auto_42499 ) ) ( not ( = ?auto_42516 ?auto_42499 ) ) ( not ( = ?auto_42496 ?auto_42499 ) ) ( AVAILABLE ?auto_42505 ) ( TRUCK-AT ?auto_42506 ?auto_42511 ) ( not ( = ?auto_42511 ?auto_42517 ) ) ( not ( = ?auto_42495 ?auto_42511 ) ) ( not ( = ?auto_42508 ?auto_42511 ) ) ( not ( = ?auto_42502 ?auto_42511 ) ) ( not ( = ?auto_42504 ?auto_42511 ) ) ( HOIST-AT ?auto_42518 ?auto_42511 ) ( LIFTING ?auto_42518 ?auto_42516 ) ( not ( = ?auto_42505 ?auto_42518 ) ) ( not ( = ?auto_42509 ?auto_42518 ) ) ( not ( = ?auto_42513 ?auto_42518 ) ) ( not ( = ?auto_42515 ?auto_42518 ) ) ( not ( = ?auto_42501 ?auto_42518 ) ) )
    :subtasks
    ( ( !LOAD ?auto_42518 ?auto_42516 ?auto_42506 ?auto_42511 )
      ( MAKE-ON ?auto_42492 ?auto_42493 )
      ( MAKE-ON-VERIFY ?auto_42492 ?auto_42493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42519 - SURFACE
      ?auto_42520 - SURFACE
    )
    :vars
    (
      ?auto_42528 - HOIST
      ?auto_42523 - PLACE
      ?auto_42544 - PLACE
      ?auto_42540 - HOIST
      ?auto_42531 - SURFACE
      ?auto_42522 - SURFACE
      ?auto_42541 - PLACE
      ?auto_42535 - HOIST
      ?auto_42526 - SURFACE
      ?auto_42527 - SURFACE
      ?auto_42532 - PLACE
      ?auto_42537 - HOIST
      ?auto_42536 - SURFACE
      ?auto_42538 - SURFACE
      ?auto_42529 - SURFACE
      ?auto_42534 - SURFACE
      ?auto_42542 - PLACE
      ?auto_42521 - HOIST
      ?auto_42524 - SURFACE
      ?auto_42539 - SURFACE
      ?auto_42545 - SURFACE
      ?auto_42543 - SURFACE
      ?auto_42525 - TRUCK
      ?auto_42533 - PLACE
      ?auto_42530 - HOIST
      ?auto_42546 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42528 ?auto_42523 ) ( IS-CRATE ?auto_42519 ) ( not ( = ?auto_42519 ?auto_42520 ) ) ( not ( = ?auto_42544 ?auto_42523 ) ) ( HOIST-AT ?auto_42540 ?auto_42544 ) ( not ( = ?auto_42528 ?auto_42540 ) ) ( SURFACE-AT ?auto_42519 ?auto_42544 ) ( ON ?auto_42519 ?auto_42531 ) ( CLEAR ?auto_42519 ) ( not ( = ?auto_42519 ?auto_42531 ) ) ( not ( = ?auto_42520 ?auto_42531 ) ) ( IS-CRATE ?auto_42520 ) ( not ( = ?auto_42519 ?auto_42522 ) ) ( not ( = ?auto_42520 ?auto_42522 ) ) ( not ( = ?auto_42531 ?auto_42522 ) ) ( not ( = ?auto_42541 ?auto_42523 ) ) ( not ( = ?auto_42544 ?auto_42541 ) ) ( HOIST-AT ?auto_42535 ?auto_42541 ) ( not ( = ?auto_42528 ?auto_42535 ) ) ( not ( = ?auto_42540 ?auto_42535 ) ) ( SURFACE-AT ?auto_42520 ?auto_42541 ) ( ON ?auto_42520 ?auto_42526 ) ( CLEAR ?auto_42520 ) ( not ( = ?auto_42519 ?auto_42526 ) ) ( not ( = ?auto_42520 ?auto_42526 ) ) ( not ( = ?auto_42531 ?auto_42526 ) ) ( not ( = ?auto_42522 ?auto_42526 ) ) ( IS-CRATE ?auto_42522 ) ( not ( = ?auto_42519 ?auto_42527 ) ) ( not ( = ?auto_42520 ?auto_42527 ) ) ( not ( = ?auto_42531 ?auto_42527 ) ) ( not ( = ?auto_42522 ?auto_42527 ) ) ( not ( = ?auto_42526 ?auto_42527 ) ) ( not ( = ?auto_42532 ?auto_42523 ) ) ( not ( = ?auto_42544 ?auto_42532 ) ) ( not ( = ?auto_42541 ?auto_42532 ) ) ( HOIST-AT ?auto_42537 ?auto_42532 ) ( not ( = ?auto_42528 ?auto_42537 ) ) ( not ( = ?auto_42540 ?auto_42537 ) ) ( not ( = ?auto_42535 ?auto_42537 ) ) ( AVAILABLE ?auto_42537 ) ( SURFACE-AT ?auto_42522 ?auto_42532 ) ( ON ?auto_42522 ?auto_42536 ) ( CLEAR ?auto_42522 ) ( not ( = ?auto_42519 ?auto_42536 ) ) ( not ( = ?auto_42520 ?auto_42536 ) ) ( not ( = ?auto_42531 ?auto_42536 ) ) ( not ( = ?auto_42522 ?auto_42536 ) ) ( not ( = ?auto_42526 ?auto_42536 ) ) ( not ( = ?auto_42527 ?auto_42536 ) ) ( IS-CRATE ?auto_42527 ) ( not ( = ?auto_42519 ?auto_42538 ) ) ( not ( = ?auto_42520 ?auto_42538 ) ) ( not ( = ?auto_42531 ?auto_42538 ) ) ( not ( = ?auto_42522 ?auto_42538 ) ) ( not ( = ?auto_42526 ?auto_42538 ) ) ( not ( = ?auto_42527 ?auto_42538 ) ) ( not ( = ?auto_42536 ?auto_42538 ) ) ( AVAILABLE ?auto_42540 ) ( SURFACE-AT ?auto_42527 ?auto_42544 ) ( ON ?auto_42527 ?auto_42529 ) ( CLEAR ?auto_42527 ) ( not ( = ?auto_42519 ?auto_42529 ) ) ( not ( = ?auto_42520 ?auto_42529 ) ) ( not ( = ?auto_42531 ?auto_42529 ) ) ( not ( = ?auto_42522 ?auto_42529 ) ) ( not ( = ?auto_42526 ?auto_42529 ) ) ( not ( = ?auto_42527 ?auto_42529 ) ) ( not ( = ?auto_42536 ?auto_42529 ) ) ( not ( = ?auto_42538 ?auto_42529 ) ) ( IS-CRATE ?auto_42538 ) ( not ( = ?auto_42519 ?auto_42534 ) ) ( not ( = ?auto_42520 ?auto_42534 ) ) ( not ( = ?auto_42531 ?auto_42534 ) ) ( not ( = ?auto_42522 ?auto_42534 ) ) ( not ( = ?auto_42526 ?auto_42534 ) ) ( not ( = ?auto_42527 ?auto_42534 ) ) ( not ( = ?auto_42536 ?auto_42534 ) ) ( not ( = ?auto_42538 ?auto_42534 ) ) ( not ( = ?auto_42529 ?auto_42534 ) ) ( not ( = ?auto_42542 ?auto_42523 ) ) ( not ( = ?auto_42544 ?auto_42542 ) ) ( not ( = ?auto_42541 ?auto_42542 ) ) ( not ( = ?auto_42532 ?auto_42542 ) ) ( HOIST-AT ?auto_42521 ?auto_42542 ) ( not ( = ?auto_42528 ?auto_42521 ) ) ( not ( = ?auto_42540 ?auto_42521 ) ) ( not ( = ?auto_42535 ?auto_42521 ) ) ( not ( = ?auto_42537 ?auto_42521 ) ) ( AVAILABLE ?auto_42521 ) ( SURFACE-AT ?auto_42538 ?auto_42542 ) ( ON ?auto_42538 ?auto_42524 ) ( CLEAR ?auto_42538 ) ( not ( = ?auto_42519 ?auto_42524 ) ) ( not ( = ?auto_42520 ?auto_42524 ) ) ( not ( = ?auto_42531 ?auto_42524 ) ) ( not ( = ?auto_42522 ?auto_42524 ) ) ( not ( = ?auto_42526 ?auto_42524 ) ) ( not ( = ?auto_42527 ?auto_42524 ) ) ( not ( = ?auto_42536 ?auto_42524 ) ) ( not ( = ?auto_42538 ?auto_42524 ) ) ( not ( = ?auto_42529 ?auto_42524 ) ) ( not ( = ?auto_42534 ?auto_42524 ) ) ( IS-CRATE ?auto_42534 ) ( not ( = ?auto_42519 ?auto_42539 ) ) ( not ( = ?auto_42520 ?auto_42539 ) ) ( not ( = ?auto_42531 ?auto_42539 ) ) ( not ( = ?auto_42522 ?auto_42539 ) ) ( not ( = ?auto_42526 ?auto_42539 ) ) ( not ( = ?auto_42527 ?auto_42539 ) ) ( not ( = ?auto_42536 ?auto_42539 ) ) ( not ( = ?auto_42538 ?auto_42539 ) ) ( not ( = ?auto_42529 ?auto_42539 ) ) ( not ( = ?auto_42534 ?auto_42539 ) ) ( not ( = ?auto_42524 ?auto_42539 ) ) ( AVAILABLE ?auto_42535 ) ( SURFACE-AT ?auto_42534 ?auto_42541 ) ( ON ?auto_42534 ?auto_42545 ) ( CLEAR ?auto_42534 ) ( not ( = ?auto_42519 ?auto_42545 ) ) ( not ( = ?auto_42520 ?auto_42545 ) ) ( not ( = ?auto_42531 ?auto_42545 ) ) ( not ( = ?auto_42522 ?auto_42545 ) ) ( not ( = ?auto_42526 ?auto_42545 ) ) ( not ( = ?auto_42527 ?auto_42545 ) ) ( not ( = ?auto_42536 ?auto_42545 ) ) ( not ( = ?auto_42538 ?auto_42545 ) ) ( not ( = ?auto_42529 ?auto_42545 ) ) ( not ( = ?auto_42534 ?auto_42545 ) ) ( not ( = ?auto_42524 ?auto_42545 ) ) ( not ( = ?auto_42539 ?auto_42545 ) ) ( SURFACE-AT ?auto_42543 ?auto_42523 ) ( CLEAR ?auto_42543 ) ( IS-CRATE ?auto_42539 ) ( not ( = ?auto_42519 ?auto_42543 ) ) ( not ( = ?auto_42520 ?auto_42543 ) ) ( not ( = ?auto_42531 ?auto_42543 ) ) ( not ( = ?auto_42522 ?auto_42543 ) ) ( not ( = ?auto_42526 ?auto_42543 ) ) ( not ( = ?auto_42527 ?auto_42543 ) ) ( not ( = ?auto_42536 ?auto_42543 ) ) ( not ( = ?auto_42538 ?auto_42543 ) ) ( not ( = ?auto_42529 ?auto_42543 ) ) ( not ( = ?auto_42534 ?auto_42543 ) ) ( not ( = ?auto_42524 ?auto_42543 ) ) ( not ( = ?auto_42539 ?auto_42543 ) ) ( not ( = ?auto_42545 ?auto_42543 ) ) ( AVAILABLE ?auto_42528 ) ( TRUCK-AT ?auto_42525 ?auto_42533 ) ( not ( = ?auto_42533 ?auto_42523 ) ) ( not ( = ?auto_42544 ?auto_42533 ) ) ( not ( = ?auto_42541 ?auto_42533 ) ) ( not ( = ?auto_42532 ?auto_42533 ) ) ( not ( = ?auto_42542 ?auto_42533 ) ) ( HOIST-AT ?auto_42530 ?auto_42533 ) ( not ( = ?auto_42528 ?auto_42530 ) ) ( not ( = ?auto_42540 ?auto_42530 ) ) ( not ( = ?auto_42535 ?auto_42530 ) ) ( not ( = ?auto_42537 ?auto_42530 ) ) ( not ( = ?auto_42521 ?auto_42530 ) ) ( AVAILABLE ?auto_42530 ) ( SURFACE-AT ?auto_42539 ?auto_42533 ) ( ON ?auto_42539 ?auto_42546 ) ( CLEAR ?auto_42539 ) ( not ( = ?auto_42519 ?auto_42546 ) ) ( not ( = ?auto_42520 ?auto_42546 ) ) ( not ( = ?auto_42531 ?auto_42546 ) ) ( not ( = ?auto_42522 ?auto_42546 ) ) ( not ( = ?auto_42526 ?auto_42546 ) ) ( not ( = ?auto_42527 ?auto_42546 ) ) ( not ( = ?auto_42536 ?auto_42546 ) ) ( not ( = ?auto_42538 ?auto_42546 ) ) ( not ( = ?auto_42529 ?auto_42546 ) ) ( not ( = ?auto_42534 ?auto_42546 ) ) ( not ( = ?auto_42524 ?auto_42546 ) ) ( not ( = ?auto_42539 ?auto_42546 ) ) ( not ( = ?auto_42545 ?auto_42546 ) ) ( not ( = ?auto_42543 ?auto_42546 ) ) )
    :subtasks
    ( ( !LIFT ?auto_42530 ?auto_42539 ?auto_42546 ?auto_42533 )
      ( MAKE-ON ?auto_42519 ?auto_42520 )
      ( MAKE-ON-VERIFY ?auto_42519 ?auto_42520 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42547 - SURFACE
      ?auto_42548 - SURFACE
    )
    :vars
    (
      ?auto_42557 - HOIST
      ?auto_42549 - PLACE
      ?auto_42563 - PLACE
      ?auto_42570 - HOIST
      ?auto_42560 - SURFACE
      ?auto_42565 - SURFACE
      ?auto_42571 - PLACE
      ?auto_42559 - HOIST
      ?auto_42558 - SURFACE
      ?auto_42562 - SURFACE
      ?auto_42550 - PLACE
      ?auto_42564 - HOIST
      ?auto_42561 - SURFACE
      ?auto_42568 - SURFACE
      ?auto_42572 - SURFACE
      ?auto_42566 - SURFACE
      ?auto_42552 - PLACE
      ?auto_42573 - HOIST
      ?auto_42556 - SURFACE
      ?auto_42569 - SURFACE
      ?auto_42553 - SURFACE
      ?auto_42551 - SURFACE
      ?auto_42554 - PLACE
      ?auto_42555 - HOIST
      ?auto_42574 - SURFACE
      ?auto_42567 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42557 ?auto_42549 ) ( IS-CRATE ?auto_42547 ) ( not ( = ?auto_42547 ?auto_42548 ) ) ( not ( = ?auto_42563 ?auto_42549 ) ) ( HOIST-AT ?auto_42570 ?auto_42563 ) ( not ( = ?auto_42557 ?auto_42570 ) ) ( SURFACE-AT ?auto_42547 ?auto_42563 ) ( ON ?auto_42547 ?auto_42560 ) ( CLEAR ?auto_42547 ) ( not ( = ?auto_42547 ?auto_42560 ) ) ( not ( = ?auto_42548 ?auto_42560 ) ) ( IS-CRATE ?auto_42548 ) ( not ( = ?auto_42547 ?auto_42565 ) ) ( not ( = ?auto_42548 ?auto_42565 ) ) ( not ( = ?auto_42560 ?auto_42565 ) ) ( not ( = ?auto_42571 ?auto_42549 ) ) ( not ( = ?auto_42563 ?auto_42571 ) ) ( HOIST-AT ?auto_42559 ?auto_42571 ) ( not ( = ?auto_42557 ?auto_42559 ) ) ( not ( = ?auto_42570 ?auto_42559 ) ) ( SURFACE-AT ?auto_42548 ?auto_42571 ) ( ON ?auto_42548 ?auto_42558 ) ( CLEAR ?auto_42548 ) ( not ( = ?auto_42547 ?auto_42558 ) ) ( not ( = ?auto_42548 ?auto_42558 ) ) ( not ( = ?auto_42560 ?auto_42558 ) ) ( not ( = ?auto_42565 ?auto_42558 ) ) ( IS-CRATE ?auto_42565 ) ( not ( = ?auto_42547 ?auto_42562 ) ) ( not ( = ?auto_42548 ?auto_42562 ) ) ( not ( = ?auto_42560 ?auto_42562 ) ) ( not ( = ?auto_42565 ?auto_42562 ) ) ( not ( = ?auto_42558 ?auto_42562 ) ) ( not ( = ?auto_42550 ?auto_42549 ) ) ( not ( = ?auto_42563 ?auto_42550 ) ) ( not ( = ?auto_42571 ?auto_42550 ) ) ( HOIST-AT ?auto_42564 ?auto_42550 ) ( not ( = ?auto_42557 ?auto_42564 ) ) ( not ( = ?auto_42570 ?auto_42564 ) ) ( not ( = ?auto_42559 ?auto_42564 ) ) ( AVAILABLE ?auto_42564 ) ( SURFACE-AT ?auto_42565 ?auto_42550 ) ( ON ?auto_42565 ?auto_42561 ) ( CLEAR ?auto_42565 ) ( not ( = ?auto_42547 ?auto_42561 ) ) ( not ( = ?auto_42548 ?auto_42561 ) ) ( not ( = ?auto_42560 ?auto_42561 ) ) ( not ( = ?auto_42565 ?auto_42561 ) ) ( not ( = ?auto_42558 ?auto_42561 ) ) ( not ( = ?auto_42562 ?auto_42561 ) ) ( IS-CRATE ?auto_42562 ) ( not ( = ?auto_42547 ?auto_42568 ) ) ( not ( = ?auto_42548 ?auto_42568 ) ) ( not ( = ?auto_42560 ?auto_42568 ) ) ( not ( = ?auto_42565 ?auto_42568 ) ) ( not ( = ?auto_42558 ?auto_42568 ) ) ( not ( = ?auto_42562 ?auto_42568 ) ) ( not ( = ?auto_42561 ?auto_42568 ) ) ( AVAILABLE ?auto_42570 ) ( SURFACE-AT ?auto_42562 ?auto_42563 ) ( ON ?auto_42562 ?auto_42572 ) ( CLEAR ?auto_42562 ) ( not ( = ?auto_42547 ?auto_42572 ) ) ( not ( = ?auto_42548 ?auto_42572 ) ) ( not ( = ?auto_42560 ?auto_42572 ) ) ( not ( = ?auto_42565 ?auto_42572 ) ) ( not ( = ?auto_42558 ?auto_42572 ) ) ( not ( = ?auto_42562 ?auto_42572 ) ) ( not ( = ?auto_42561 ?auto_42572 ) ) ( not ( = ?auto_42568 ?auto_42572 ) ) ( IS-CRATE ?auto_42568 ) ( not ( = ?auto_42547 ?auto_42566 ) ) ( not ( = ?auto_42548 ?auto_42566 ) ) ( not ( = ?auto_42560 ?auto_42566 ) ) ( not ( = ?auto_42565 ?auto_42566 ) ) ( not ( = ?auto_42558 ?auto_42566 ) ) ( not ( = ?auto_42562 ?auto_42566 ) ) ( not ( = ?auto_42561 ?auto_42566 ) ) ( not ( = ?auto_42568 ?auto_42566 ) ) ( not ( = ?auto_42572 ?auto_42566 ) ) ( not ( = ?auto_42552 ?auto_42549 ) ) ( not ( = ?auto_42563 ?auto_42552 ) ) ( not ( = ?auto_42571 ?auto_42552 ) ) ( not ( = ?auto_42550 ?auto_42552 ) ) ( HOIST-AT ?auto_42573 ?auto_42552 ) ( not ( = ?auto_42557 ?auto_42573 ) ) ( not ( = ?auto_42570 ?auto_42573 ) ) ( not ( = ?auto_42559 ?auto_42573 ) ) ( not ( = ?auto_42564 ?auto_42573 ) ) ( AVAILABLE ?auto_42573 ) ( SURFACE-AT ?auto_42568 ?auto_42552 ) ( ON ?auto_42568 ?auto_42556 ) ( CLEAR ?auto_42568 ) ( not ( = ?auto_42547 ?auto_42556 ) ) ( not ( = ?auto_42548 ?auto_42556 ) ) ( not ( = ?auto_42560 ?auto_42556 ) ) ( not ( = ?auto_42565 ?auto_42556 ) ) ( not ( = ?auto_42558 ?auto_42556 ) ) ( not ( = ?auto_42562 ?auto_42556 ) ) ( not ( = ?auto_42561 ?auto_42556 ) ) ( not ( = ?auto_42568 ?auto_42556 ) ) ( not ( = ?auto_42572 ?auto_42556 ) ) ( not ( = ?auto_42566 ?auto_42556 ) ) ( IS-CRATE ?auto_42566 ) ( not ( = ?auto_42547 ?auto_42569 ) ) ( not ( = ?auto_42548 ?auto_42569 ) ) ( not ( = ?auto_42560 ?auto_42569 ) ) ( not ( = ?auto_42565 ?auto_42569 ) ) ( not ( = ?auto_42558 ?auto_42569 ) ) ( not ( = ?auto_42562 ?auto_42569 ) ) ( not ( = ?auto_42561 ?auto_42569 ) ) ( not ( = ?auto_42568 ?auto_42569 ) ) ( not ( = ?auto_42572 ?auto_42569 ) ) ( not ( = ?auto_42566 ?auto_42569 ) ) ( not ( = ?auto_42556 ?auto_42569 ) ) ( AVAILABLE ?auto_42559 ) ( SURFACE-AT ?auto_42566 ?auto_42571 ) ( ON ?auto_42566 ?auto_42553 ) ( CLEAR ?auto_42566 ) ( not ( = ?auto_42547 ?auto_42553 ) ) ( not ( = ?auto_42548 ?auto_42553 ) ) ( not ( = ?auto_42560 ?auto_42553 ) ) ( not ( = ?auto_42565 ?auto_42553 ) ) ( not ( = ?auto_42558 ?auto_42553 ) ) ( not ( = ?auto_42562 ?auto_42553 ) ) ( not ( = ?auto_42561 ?auto_42553 ) ) ( not ( = ?auto_42568 ?auto_42553 ) ) ( not ( = ?auto_42572 ?auto_42553 ) ) ( not ( = ?auto_42566 ?auto_42553 ) ) ( not ( = ?auto_42556 ?auto_42553 ) ) ( not ( = ?auto_42569 ?auto_42553 ) ) ( SURFACE-AT ?auto_42551 ?auto_42549 ) ( CLEAR ?auto_42551 ) ( IS-CRATE ?auto_42569 ) ( not ( = ?auto_42547 ?auto_42551 ) ) ( not ( = ?auto_42548 ?auto_42551 ) ) ( not ( = ?auto_42560 ?auto_42551 ) ) ( not ( = ?auto_42565 ?auto_42551 ) ) ( not ( = ?auto_42558 ?auto_42551 ) ) ( not ( = ?auto_42562 ?auto_42551 ) ) ( not ( = ?auto_42561 ?auto_42551 ) ) ( not ( = ?auto_42568 ?auto_42551 ) ) ( not ( = ?auto_42572 ?auto_42551 ) ) ( not ( = ?auto_42566 ?auto_42551 ) ) ( not ( = ?auto_42556 ?auto_42551 ) ) ( not ( = ?auto_42569 ?auto_42551 ) ) ( not ( = ?auto_42553 ?auto_42551 ) ) ( AVAILABLE ?auto_42557 ) ( not ( = ?auto_42554 ?auto_42549 ) ) ( not ( = ?auto_42563 ?auto_42554 ) ) ( not ( = ?auto_42571 ?auto_42554 ) ) ( not ( = ?auto_42550 ?auto_42554 ) ) ( not ( = ?auto_42552 ?auto_42554 ) ) ( HOIST-AT ?auto_42555 ?auto_42554 ) ( not ( = ?auto_42557 ?auto_42555 ) ) ( not ( = ?auto_42570 ?auto_42555 ) ) ( not ( = ?auto_42559 ?auto_42555 ) ) ( not ( = ?auto_42564 ?auto_42555 ) ) ( not ( = ?auto_42573 ?auto_42555 ) ) ( AVAILABLE ?auto_42555 ) ( SURFACE-AT ?auto_42569 ?auto_42554 ) ( ON ?auto_42569 ?auto_42574 ) ( CLEAR ?auto_42569 ) ( not ( = ?auto_42547 ?auto_42574 ) ) ( not ( = ?auto_42548 ?auto_42574 ) ) ( not ( = ?auto_42560 ?auto_42574 ) ) ( not ( = ?auto_42565 ?auto_42574 ) ) ( not ( = ?auto_42558 ?auto_42574 ) ) ( not ( = ?auto_42562 ?auto_42574 ) ) ( not ( = ?auto_42561 ?auto_42574 ) ) ( not ( = ?auto_42568 ?auto_42574 ) ) ( not ( = ?auto_42572 ?auto_42574 ) ) ( not ( = ?auto_42566 ?auto_42574 ) ) ( not ( = ?auto_42556 ?auto_42574 ) ) ( not ( = ?auto_42569 ?auto_42574 ) ) ( not ( = ?auto_42553 ?auto_42574 ) ) ( not ( = ?auto_42551 ?auto_42574 ) ) ( TRUCK-AT ?auto_42567 ?auto_42549 ) )
    :subtasks
    ( ( !DRIVE ?auto_42567 ?auto_42549 ?auto_42554 )
      ( MAKE-ON ?auto_42547 ?auto_42548 )
      ( MAKE-ON-VERIFY ?auto_42547 ?auto_42548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42575 - SURFACE
      ?auto_42576 - SURFACE
    )
    :vars
    (
      ?auto_42577 - HOIST
      ?auto_42589 - PLACE
      ?auto_42590 - PLACE
      ?auto_42580 - HOIST
      ?auto_42582 - SURFACE
      ?auto_42598 - SURFACE
      ?auto_42579 - PLACE
      ?auto_42596 - HOIST
      ?auto_42591 - SURFACE
      ?auto_42584 - SURFACE
      ?auto_42581 - PLACE
      ?auto_42578 - HOIST
      ?auto_42595 - SURFACE
      ?auto_42601 - SURFACE
      ?auto_42597 - SURFACE
      ?auto_42599 - SURFACE
      ?auto_42588 - PLACE
      ?auto_42592 - HOIST
      ?auto_42594 - SURFACE
      ?auto_42602 - SURFACE
      ?auto_42583 - SURFACE
      ?auto_42586 - SURFACE
      ?auto_42585 - PLACE
      ?auto_42587 - HOIST
      ?auto_42593 - SURFACE
      ?auto_42600 - TRUCK
      ?auto_42603 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42577 ?auto_42589 ) ( IS-CRATE ?auto_42575 ) ( not ( = ?auto_42575 ?auto_42576 ) ) ( not ( = ?auto_42590 ?auto_42589 ) ) ( HOIST-AT ?auto_42580 ?auto_42590 ) ( not ( = ?auto_42577 ?auto_42580 ) ) ( SURFACE-AT ?auto_42575 ?auto_42590 ) ( ON ?auto_42575 ?auto_42582 ) ( CLEAR ?auto_42575 ) ( not ( = ?auto_42575 ?auto_42582 ) ) ( not ( = ?auto_42576 ?auto_42582 ) ) ( IS-CRATE ?auto_42576 ) ( not ( = ?auto_42575 ?auto_42598 ) ) ( not ( = ?auto_42576 ?auto_42598 ) ) ( not ( = ?auto_42582 ?auto_42598 ) ) ( not ( = ?auto_42579 ?auto_42589 ) ) ( not ( = ?auto_42590 ?auto_42579 ) ) ( HOIST-AT ?auto_42596 ?auto_42579 ) ( not ( = ?auto_42577 ?auto_42596 ) ) ( not ( = ?auto_42580 ?auto_42596 ) ) ( SURFACE-AT ?auto_42576 ?auto_42579 ) ( ON ?auto_42576 ?auto_42591 ) ( CLEAR ?auto_42576 ) ( not ( = ?auto_42575 ?auto_42591 ) ) ( not ( = ?auto_42576 ?auto_42591 ) ) ( not ( = ?auto_42582 ?auto_42591 ) ) ( not ( = ?auto_42598 ?auto_42591 ) ) ( IS-CRATE ?auto_42598 ) ( not ( = ?auto_42575 ?auto_42584 ) ) ( not ( = ?auto_42576 ?auto_42584 ) ) ( not ( = ?auto_42582 ?auto_42584 ) ) ( not ( = ?auto_42598 ?auto_42584 ) ) ( not ( = ?auto_42591 ?auto_42584 ) ) ( not ( = ?auto_42581 ?auto_42589 ) ) ( not ( = ?auto_42590 ?auto_42581 ) ) ( not ( = ?auto_42579 ?auto_42581 ) ) ( HOIST-AT ?auto_42578 ?auto_42581 ) ( not ( = ?auto_42577 ?auto_42578 ) ) ( not ( = ?auto_42580 ?auto_42578 ) ) ( not ( = ?auto_42596 ?auto_42578 ) ) ( AVAILABLE ?auto_42578 ) ( SURFACE-AT ?auto_42598 ?auto_42581 ) ( ON ?auto_42598 ?auto_42595 ) ( CLEAR ?auto_42598 ) ( not ( = ?auto_42575 ?auto_42595 ) ) ( not ( = ?auto_42576 ?auto_42595 ) ) ( not ( = ?auto_42582 ?auto_42595 ) ) ( not ( = ?auto_42598 ?auto_42595 ) ) ( not ( = ?auto_42591 ?auto_42595 ) ) ( not ( = ?auto_42584 ?auto_42595 ) ) ( IS-CRATE ?auto_42584 ) ( not ( = ?auto_42575 ?auto_42601 ) ) ( not ( = ?auto_42576 ?auto_42601 ) ) ( not ( = ?auto_42582 ?auto_42601 ) ) ( not ( = ?auto_42598 ?auto_42601 ) ) ( not ( = ?auto_42591 ?auto_42601 ) ) ( not ( = ?auto_42584 ?auto_42601 ) ) ( not ( = ?auto_42595 ?auto_42601 ) ) ( AVAILABLE ?auto_42580 ) ( SURFACE-AT ?auto_42584 ?auto_42590 ) ( ON ?auto_42584 ?auto_42597 ) ( CLEAR ?auto_42584 ) ( not ( = ?auto_42575 ?auto_42597 ) ) ( not ( = ?auto_42576 ?auto_42597 ) ) ( not ( = ?auto_42582 ?auto_42597 ) ) ( not ( = ?auto_42598 ?auto_42597 ) ) ( not ( = ?auto_42591 ?auto_42597 ) ) ( not ( = ?auto_42584 ?auto_42597 ) ) ( not ( = ?auto_42595 ?auto_42597 ) ) ( not ( = ?auto_42601 ?auto_42597 ) ) ( IS-CRATE ?auto_42601 ) ( not ( = ?auto_42575 ?auto_42599 ) ) ( not ( = ?auto_42576 ?auto_42599 ) ) ( not ( = ?auto_42582 ?auto_42599 ) ) ( not ( = ?auto_42598 ?auto_42599 ) ) ( not ( = ?auto_42591 ?auto_42599 ) ) ( not ( = ?auto_42584 ?auto_42599 ) ) ( not ( = ?auto_42595 ?auto_42599 ) ) ( not ( = ?auto_42601 ?auto_42599 ) ) ( not ( = ?auto_42597 ?auto_42599 ) ) ( not ( = ?auto_42588 ?auto_42589 ) ) ( not ( = ?auto_42590 ?auto_42588 ) ) ( not ( = ?auto_42579 ?auto_42588 ) ) ( not ( = ?auto_42581 ?auto_42588 ) ) ( HOIST-AT ?auto_42592 ?auto_42588 ) ( not ( = ?auto_42577 ?auto_42592 ) ) ( not ( = ?auto_42580 ?auto_42592 ) ) ( not ( = ?auto_42596 ?auto_42592 ) ) ( not ( = ?auto_42578 ?auto_42592 ) ) ( AVAILABLE ?auto_42592 ) ( SURFACE-AT ?auto_42601 ?auto_42588 ) ( ON ?auto_42601 ?auto_42594 ) ( CLEAR ?auto_42601 ) ( not ( = ?auto_42575 ?auto_42594 ) ) ( not ( = ?auto_42576 ?auto_42594 ) ) ( not ( = ?auto_42582 ?auto_42594 ) ) ( not ( = ?auto_42598 ?auto_42594 ) ) ( not ( = ?auto_42591 ?auto_42594 ) ) ( not ( = ?auto_42584 ?auto_42594 ) ) ( not ( = ?auto_42595 ?auto_42594 ) ) ( not ( = ?auto_42601 ?auto_42594 ) ) ( not ( = ?auto_42597 ?auto_42594 ) ) ( not ( = ?auto_42599 ?auto_42594 ) ) ( IS-CRATE ?auto_42599 ) ( not ( = ?auto_42575 ?auto_42602 ) ) ( not ( = ?auto_42576 ?auto_42602 ) ) ( not ( = ?auto_42582 ?auto_42602 ) ) ( not ( = ?auto_42598 ?auto_42602 ) ) ( not ( = ?auto_42591 ?auto_42602 ) ) ( not ( = ?auto_42584 ?auto_42602 ) ) ( not ( = ?auto_42595 ?auto_42602 ) ) ( not ( = ?auto_42601 ?auto_42602 ) ) ( not ( = ?auto_42597 ?auto_42602 ) ) ( not ( = ?auto_42599 ?auto_42602 ) ) ( not ( = ?auto_42594 ?auto_42602 ) ) ( AVAILABLE ?auto_42596 ) ( SURFACE-AT ?auto_42599 ?auto_42579 ) ( ON ?auto_42599 ?auto_42583 ) ( CLEAR ?auto_42599 ) ( not ( = ?auto_42575 ?auto_42583 ) ) ( not ( = ?auto_42576 ?auto_42583 ) ) ( not ( = ?auto_42582 ?auto_42583 ) ) ( not ( = ?auto_42598 ?auto_42583 ) ) ( not ( = ?auto_42591 ?auto_42583 ) ) ( not ( = ?auto_42584 ?auto_42583 ) ) ( not ( = ?auto_42595 ?auto_42583 ) ) ( not ( = ?auto_42601 ?auto_42583 ) ) ( not ( = ?auto_42597 ?auto_42583 ) ) ( not ( = ?auto_42599 ?auto_42583 ) ) ( not ( = ?auto_42594 ?auto_42583 ) ) ( not ( = ?auto_42602 ?auto_42583 ) ) ( IS-CRATE ?auto_42602 ) ( not ( = ?auto_42575 ?auto_42586 ) ) ( not ( = ?auto_42576 ?auto_42586 ) ) ( not ( = ?auto_42582 ?auto_42586 ) ) ( not ( = ?auto_42598 ?auto_42586 ) ) ( not ( = ?auto_42591 ?auto_42586 ) ) ( not ( = ?auto_42584 ?auto_42586 ) ) ( not ( = ?auto_42595 ?auto_42586 ) ) ( not ( = ?auto_42601 ?auto_42586 ) ) ( not ( = ?auto_42597 ?auto_42586 ) ) ( not ( = ?auto_42599 ?auto_42586 ) ) ( not ( = ?auto_42594 ?auto_42586 ) ) ( not ( = ?auto_42602 ?auto_42586 ) ) ( not ( = ?auto_42583 ?auto_42586 ) ) ( not ( = ?auto_42585 ?auto_42589 ) ) ( not ( = ?auto_42590 ?auto_42585 ) ) ( not ( = ?auto_42579 ?auto_42585 ) ) ( not ( = ?auto_42581 ?auto_42585 ) ) ( not ( = ?auto_42588 ?auto_42585 ) ) ( HOIST-AT ?auto_42587 ?auto_42585 ) ( not ( = ?auto_42577 ?auto_42587 ) ) ( not ( = ?auto_42580 ?auto_42587 ) ) ( not ( = ?auto_42596 ?auto_42587 ) ) ( not ( = ?auto_42578 ?auto_42587 ) ) ( not ( = ?auto_42592 ?auto_42587 ) ) ( AVAILABLE ?auto_42587 ) ( SURFACE-AT ?auto_42602 ?auto_42585 ) ( ON ?auto_42602 ?auto_42593 ) ( CLEAR ?auto_42602 ) ( not ( = ?auto_42575 ?auto_42593 ) ) ( not ( = ?auto_42576 ?auto_42593 ) ) ( not ( = ?auto_42582 ?auto_42593 ) ) ( not ( = ?auto_42598 ?auto_42593 ) ) ( not ( = ?auto_42591 ?auto_42593 ) ) ( not ( = ?auto_42584 ?auto_42593 ) ) ( not ( = ?auto_42595 ?auto_42593 ) ) ( not ( = ?auto_42601 ?auto_42593 ) ) ( not ( = ?auto_42597 ?auto_42593 ) ) ( not ( = ?auto_42599 ?auto_42593 ) ) ( not ( = ?auto_42594 ?auto_42593 ) ) ( not ( = ?auto_42602 ?auto_42593 ) ) ( not ( = ?auto_42583 ?auto_42593 ) ) ( not ( = ?auto_42586 ?auto_42593 ) ) ( TRUCK-AT ?auto_42600 ?auto_42589 ) ( SURFACE-AT ?auto_42603 ?auto_42589 ) ( CLEAR ?auto_42603 ) ( LIFTING ?auto_42577 ?auto_42586 ) ( IS-CRATE ?auto_42586 ) ( not ( = ?auto_42575 ?auto_42603 ) ) ( not ( = ?auto_42576 ?auto_42603 ) ) ( not ( = ?auto_42582 ?auto_42603 ) ) ( not ( = ?auto_42598 ?auto_42603 ) ) ( not ( = ?auto_42591 ?auto_42603 ) ) ( not ( = ?auto_42584 ?auto_42603 ) ) ( not ( = ?auto_42595 ?auto_42603 ) ) ( not ( = ?auto_42601 ?auto_42603 ) ) ( not ( = ?auto_42597 ?auto_42603 ) ) ( not ( = ?auto_42599 ?auto_42603 ) ) ( not ( = ?auto_42594 ?auto_42603 ) ) ( not ( = ?auto_42602 ?auto_42603 ) ) ( not ( = ?auto_42583 ?auto_42603 ) ) ( not ( = ?auto_42586 ?auto_42603 ) ) ( not ( = ?auto_42593 ?auto_42603 ) ) )
    :subtasks
    ( ( !DROP ?auto_42577 ?auto_42586 ?auto_42603 ?auto_42589 )
      ( MAKE-ON ?auto_42575 ?auto_42576 )
      ( MAKE-ON-VERIFY ?auto_42575 ?auto_42576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42604 - SURFACE
      ?auto_42605 - SURFACE
    )
    :vars
    (
      ?auto_42627 - HOIST
      ?auto_42629 - PLACE
      ?auto_42622 - PLACE
      ?auto_42628 - HOIST
      ?auto_42631 - SURFACE
      ?auto_42613 - SURFACE
      ?auto_42632 - PLACE
      ?auto_42611 - HOIST
      ?auto_42624 - SURFACE
      ?auto_42630 - SURFACE
      ?auto_42619 - PLACE
      ?auto_42616 - HOIST
      ?auto_42610 - SURFACE
      ?auto_42609 - SURFACE
      ?auto_42612 - SURFACE
      ?auto_42614 - SURFACE
      ?auto_42621 - PLACE
      ?auto_42615 - HOIST
      ?auto_42606 - SURFACE
      ?auto_42623 - SURFACE
      ?auto_42625 - SURFACE
      ?auto_42618 - SURFACE
      ?auto_42620 - PLACE
      ?auto_42617 - HOIST
      ?auto_42607 - SURFACE
      ?auto_42608 - TRUCK
      ?auto_42626 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42627 ?auto_42629 ) ( IS-CRATE ?auto_42604 ) ( not ( = ?auto_42604 ?auto_42605 ) ) ( not ( = ?auto_42622 ?auto_42629 ) ) ( HOIST-AT ?auto_42628 ?auto_42622 ) ( not ( = ?auto_42627 ?auto_42628 ) ) ( SURFACE-AT ?auto_42604 ?auto_42622 ) ( ON ?auto_42604 ?auto_42631 ) ( CLEAR ?auto_42604 ) ( not ( = ?auto_42604 ?auto_42631 ) ) ( not ( = ?auto_42605 ?auto_42631 ) ) ( IS-CRATE ?auto_42605 ) ( not ( = ?auto_42604 ?auto_42613 ) ) ( not ( = ?auto_42605 ?auto_42613 ) ) ( not ( = ?auto_42631 ?auto_42613 ) ) ( not ( = ?auto_42632 ?auto_42629 ) ) ( not ( = ?auto_42622 ?auto_42632 ) ) ( HOIST-AT ?auto_42611 ?auto_42632 ) ( not ( = ?auto_42627 ?auto_42611 ) ) ( not ( = ?auto_42628 ?auto_42611 ) ) ( SURFACE-AT ?auto_42605 ?auto_42632 ) ( ON ?auto_42605 ?auto_42624 ) ( CLEAR ?auto_42605 ) ( not ( = ?auto_42604 ?auto_42624 ) ) ( not ( = ?auto_42605 ?auto_42624 ) ) ( not ( = ?auto_42631 ?auto_42624 ) ) ( not ( = ?auto_42613 ?auto_42624 ) ) ( IS-CRATE ?auto_42613 ) ( not ( = ?auto_42604 ?auto_42630 ) ) ( not ( = ?auto_42605 ?auto_42630 ) ) ( not ( = ?auto_42631 ?auto_42630 ) ) ( not ( = ?auto_42613 ?auto_42630 ) ) ( not ( = ?auto_42624 ?auto_42630 ) ) ( not ( = ?auto_42619 ?auto_42629 ) ) ( not ( = ?auto_42622 ?auto_42619 ) ) ( not ( = ?auto_42632 ?auto_42619 ) ) ( HOIST-AT ?auto_42616 ?auto_42619 ) ( not ( = ?auto_42627 ?auto_42616 ) ) ( not ( = ?auto_42628 ?auto_42616 ) ) ( not ( = ?auto_42611 ?auto_42616 ) ) ( AVAILABLE ?auto_42616 ) ( SURFACE-AT ?auto_42613 ?auto_42619 ) ( ON ?auto_42613 ?auto_42610 ) ( CLEAR ?auto_42613 ) ( not ( = ?auto_42604 ?auto_42610 ) ) ( not ( = ?auto_42605 ?auto_42610 ) ) ( not ( = ?auto_42631 ?auto_42610 ) ) ( not ( = ?auto_42613 ?auto_42610 ) ) ( not ( = ?auto_42624 ?auto_42610 ) ) ( not ( = ?auto_42630 ?auto_42610 ) ) ( IS-CRATE ?auto_42630 ) ( not ( = ?auto_42604 ?auto_42609 ) ) ( not ( = ?auto_42605 ?auto_42609 ) ) ( not ( = ?auto_42631 ?auto_42609 ) ) ( not ( = ?auto_42613 ?auto_42609 ) ) ( not ( = ?auto_42624 ?auto_42609 ) ) ( not ( = ?auto_42630 ?auto_42609 ) ) ( not ( = ?auto_42610 ?auto_42609 ) ) ( AVAILABLE ?auto_42628 ) ( SURFACE-AT ?auto_42630 ?auto_42622 ) ( ON ?auto_42630 ?auto_42612 ) ( CLEAR ?auto_42630 ) ( not ( = ?auto_42604 ?auto_42612 ) ) ( not ( = ?auto_42605 ?auto_42612 ) ) ( not ( = ?auto_42631 ?auto_42612 ) ) ( not ( = ?auto_42613 ?auto_42612 ) ) ( not ( = ?auto_42624 ?auto_42612 ) ) ( not ( = ?auto_42630 ?auto_42612 ) ) ( not ( = ?auto_42610 ?auto_42612 ) ) ( not ( = ?auto_42609 ?auto_42612 ) ) ( IS-CRATE ?auto_42609 ) ( not ( = ?auto_42604 ?auto_42614 ) ) ( not ( = ?auto_42605 ?auto_42614 ) ) ( not ( = ?auto_42631 ?auto_42614 ) ) ( not ( = ?auto_42613 ?auto_42614 ) ) ( not ( = ?auto_42624 ?auto_42614 ) ) ( not ( = ?auto_42630 ?auto_42614 ) ) ( not ( = ?auto_42610 ?auto_42614 ) ) ( not ( = ?auto_42609 ?auto_42614 ) ) ( not ( = ?auto_42612 ?auto_42614 ) ) ( not ( = ?auto_42621 ?auto_42629 ) ) ( not ( = ?auto_42622 ?auto_42621 ) ) ( not ( = ?auto_42632 ?auto_42621 ) ) ( not ( = ?auto_42619 ?auto_42621 ) ) ( HOIST-AT ?auto_42615 ?auto_42621 ) ( not ( = ?auto_42627 ?auto_42615 ) ) ( not ( = ?auto_42628 ?auto_42615 ) ) ( not ( = ?auto_42611 ?auto_42615 ) ) ( not ( = ?auto_42616 ?auto_42615 ) ) ( AVAILABLE ?auto_42615 ) ( SURFACE-AT ?auto_42609 ?auto_42621 ) ( ON ?auto_42609 ?auto_42606 ) ( CLEAR ?auto_42609 ) ( not ( = ?auto_42604 ?auto_42606 ) ) ( not ( = ?auto_42605 ?auto_42606 ) ) ( not ( = ?auto_42631 ?auto_42606 ) ) ( not ( = ?auto_42613 ?auto_42606 ) ) ( not ( = ?auto_42624 ?auto_42606 ) ) ( not ( = ?auto_42630 ?auto_42606 ) ) ( not ( = ?auto_42610 ?auto_42606 ) ) ( not ( = ?auto_42609 ?auto_42606 ) ) ( not ( = ?auto_42612 ?auto_42606 ) ) ( not ( = ?auto_42614 ?auto_42606 ) ) ( IS-CRATE ?auto_42614 ) ( not ( = ?auto_42604 ?auto_42623 ) ) ( not ( = ?auto_42605 ?auto_42623 ) ) ( not ( = ?auto_42631 ?auto_42623 ) ) ( not ( = ?auto_42613 ?auto_42623 ) ) ( not ( = ?auto_42624 ?auto_42623 ) ) ( not ( = ?auto_42630 ?auto_42623 ) ) ( not ( = ?auto_42610 ?auto_42623 ) ) ( not ( = ?auto_42609 ?auto_42623 ) ) ( not ( = ?auto_42612 ?auto_42623 ) ) ( not ( = ?auto_42614 ?auto_42623 ) ) ( not ( = ?auto_42606 ?auto_42623 ) ) ( AVAILABLE ?auto_42611 ) ( SURFACE-AT ?auto_42614 ?auto_42632 ) ( ON ?auto_42614 ?auto_42625 ) ( CLEAR ?auto_42614 ) ( not ( = ?auto_42604 ?auto_42625 ) ) ( not ( = ?auto_42605 ?auto_42625 ) ) ( not ( = ?auto_42631 ?auto_42625 ) ) ( not ( = ?auto_42613 ?auto_42625 ) ) ( not ( = ?auto_42624 ?auto_42625 ) ) ( not ( = ?auto_42630 ?auto_42625 ) ) ( not ( = ?auto_42610 ?auto_42625 ) ) ( not ( = ?auto_42609 ?auto_42625 ) ) ( not ( = ?auto_42612 ?auto_42625 ) ) ( not ( = ?auto_42614 ?auto_42625 ) ) ( not ( = ?auto_42606 ?auto_42625 ) ) ( not ( = ?auto_42623 ?auto_42625 ) ) ( IS-CRATE ?auto_42623 ) ( not ( = ?auto_42604 ?auto_42618 ) ) ( not ( = ?auto_42605 ?auto_42618 ) ) ( not ( = ?auto_42631 ?auto_42618 ) ) ( not ( = ?auto_42613 ?auto_42618 ) ) ( not ( = ?auto_42624 ?auto_42618 ) ) ( not ( = ?auto_42630 ?auto_42618 ) ) ( not ( = ?auto_42610 ?auto_42618 ) ) ( not ( = ?auto_42609 ?auto_42618 ) ) ( not ( = ?auto_42612 ?auto_42618 ) ) ( not ( = ?auto_42614 ?auto_42618 ) ) ( not ( = ?auto_42606 ?auto_42618 ) ) ( not ( = ?auto_42623 ?auto_42618 ) ) ( not ( = ?auto_42625 ?auto_42618 ) ) ( not ( = ?auto_42620 ?auto_42629 ) ) ( not ( = ?auto_42622 ?auto_42620 ) ) ( not ( = ?auto_42632 ?auto_42620 ) ) ( not ( = ?auto_42619 ?auto_42620 ) ) ( not ( = ?auto_42621 ?auto_42620 ) ) ( HOIST-AT ?auto_42617 ?auto_42620 ) ( not ( = ?auto_42627 ?auto_42617 ) ) ( not ( = ?auto_42628 ?auto_42617 ) ) ( not ( = ?auto_42611 ?auto_42617 ) ) ( not ( = ?auto_42616 ?auto_42617 ) ) ( not ( = ?auto_42615 ?auto_42617 ) ) ( AVAILABLE ?auto_42617 ) ( SURFACE-AT ?auto_42623 ?auto_42620 ) ( ON ?auto_42623 ?auto_42607 ) ( CLEAR ?auto_42623 ) ( not ( = ?auto_42604 ?auto_42607 ) ) ( not ( = ?auto_42605 ?auto_42607 ) ) ( not ( = ?auto_42631 ?auto_42607 ) ) ( not ( = ?auto_42613 ?auto_42607 ) ) ( not ( = ?auto_42624 ?auto_42607 ) ) ( not ( = ?auto_42630 ?auto_42607 ) ) ( not ( = ?auto_42610 ?auto_42607 ) ) ( not ( = ?auto_42609 ?auto_42607 ) ) ( not ( = ?auto_42612 ?auto_42607 ) ) ( not ( = ?auto_42614 ?auto_42607 ) ) ( not ( = ?auto_42606 ?auto_42607 ) ) ( not ( = ?auto_42623 ?auto_42607 ) ) ( not ( = ?auto_42625 ?auto_42607 ) ) ( not ( = ?auto_42618 ?auto_42607 ) ) ( TRUCK-AT ?auto_42608 ?auto_42629 ) ( SURFACE-AT ?auto_42626 ?auto_42629 ) ( CLEAR ?auto_42626 ) ( IS-CRATE ?auto_42618 ) ( not ( = ?auto_42604 ?auto_42626 ) ) ( not ( = ?auto_42605 ?auto_42626 ) ) ( not ( = ?auto_42631 ?auto_42626 ) ) ( not ( = ?auto_42613 ?auto_42626 ) ) ( not ( = ?auto_42624 ?auto_42626 ) ) ( not ( = ?auto_42630 ?auto_42626 ) ) ( not ( = ?auto_42610 ?auto_42626 ) ) ( not ( = ?auto_42609 ?auto_42626 ) ) ( not ( = ?auto_42612 ?auto_42626 ) ) ( not ( = ?auto_42614 ?auto_42626 ) ) ( not ( = ?auto_42606 ?auto_42626 ) ) ( not ( = ?auto_42623 ?auto_42626 ) ) ( not ( = ?auto_42625 ?auto_42626 ) ) ( not ( = ?auto_42618 ?auto_42626 ) ) ( not ( = ?auto_42607 ?auto_42626 ) ) ( AVAILABLE ?auto_42627 ) ( IN ?auto_42618 ?auto_42608 ) )
    :subtasks
    ( ( !UNLOAD ?auto_42627 ?auto_42618 ?auto_42608 ?auto_42629 )
      ( MAKE-ON ?auto_42604 ?auto_42605 )
      ( MAKE-ON-VERIFY ?auto_42604 ?auto_42605 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42633 - SURFACE
      ?auto_42634 - SURFACE
    )
    :vars
    (
      ?auto_42656 - HOIST
      ?auto_42650 - PLACE
      ?auto_42651 - PLACE
      ?auto_42657 - HOIST
      ?auto_42644 - SURFACE
      ?auto_42637 - SURFACE
      ?auto_42642 - PLACE
      ?auto_42647 - HOIST
      ?auto_42653 - SURFACE
      ?auto_42641 - SURFACE
      ?auto_42659 - PLACE
      ?auto_42646 - HOIST
      ?auto_42661 - SURFACE
      ?auto_42645 - SURFACE
      ?auto_42648 - SURFACE
      ?auto_42649 - SURFACE
      ?auto_42658 - PLACE
      ?auto_42635 - HOIST
      ?auto_42643 - SURFACE
      ?auto_42652 - SURFACE
      ?auto_42654 - SURFACE
      ?auto_42636 - SURFACE
      ?auto_42660 - PLACE
      ?auto_42639 - HOIST
      ?auto_42638 - SURFACE
      ?auto_42655 - SURFACE
      ?auto_42640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42656 ?auto_42650 ) ( IS-CRATE ?auto_42633 ) ( not ( = ?auto_42633 ?auto_42634 ) ) ( not ( = ?auto_42651 ?auto_42650 ) ) ( HOIST-AT ?auto_42657 ?auto_42651 ) ( not ( = ?auto_42656 ?auto_42657 ) ) ( SURFACE-AT ?auto_42633 ?auto_42651 ) ( ON ?auto_42633 ?auto_42644 ) ( CLEAR ?auto_42633 ) ( not ( = ?auto_42633 ?auto_42644 ) ) ( not ( = ?auto_42634 ?auto_42644 ) ) ( IS-CRATE ?auto_42634 ) ( not ( = ?auto_42633 ?auto_42637 ) ) ( not ( = ?auto_42634 ?auto_42637 ) ) ( not ( = ?auto_42644 ?auto_42637 ) ) ( not ( = ?auto_42642 ?auto_42650 ) ) ( not ( = ?auto_42651 ?auto_42642 ) ) ( HOIST-AT ?auto_42647 ?auto_42642 ) ( not ( = ?auto_42656 ?auto_42647 ) ) ( not ( = ?auto_42657 ?auto_42647 ) ) ( SURFACE-AT ?auto_42634 ?auto_42642 ) ( ON ?auto_42634 ?auto_42653 ) ( CLEAR ?auto_42634 ) ( not ( = ?auto_42633 ?auto_42653 ) ) ( not ( = ?auto_42634 ?auto_42653 ) ) ( not ( = ?auto_42644 ?auto_42653 ) ) ( not ( = ?auto_42637 ?auto_42653 ) ) ( IS-CRATE ?auto_42637 ) ( not ( = ?auto_42633 ?auto_42641 ) ) ( not ( = ?auto_42634 ?auto_42641 ) ) ( not ( = ?auto_42644 ?auto_42641 ) ) ( not ( = ?auto_42637 ?auto_42641 ) ) ( not ( = ?auto_42653 ?auto_42641 ) ) ( not ( = ?auto_42659 ?auto_42650 ) ) ( not ( = ?auto_42651 ?auto_42659 ) ) ( not ( = ?auto_42642 ?auto_42659 ) ) ( HOIST-AT ?auto_42646 ?auto_42659 ) ( not ( = ?auto_42656 ?auto_42646 ) ) ( not ( = ?auto_42657 ?auto_42646 ) ) ( not ( = ?auto_42647 ?auto_42646 ) ) ( AVAILABLE ?auto_42646 ) ( SURFACE-AT ?auto_42637 ?auto_42659 ) ( ON ?auto_42637 ?auto_42661 ) ( CLEAR ?auto_42637 ) ( not ( = ?auto_42633 ?auto_42661 ) ) ( not ( = ?auto_42634 ?auto_42661 ) ) ( not ( = ?auto_42644 ?auto_42661 ) ) ( not ( = ?auto_42637 ?auto_42661 ) ) ( not ( = ?auto_42653 ?auto_42661 ) ) ( not ( = ?auto_42641 ?auto_42661 ) ) ( IS-CRATE ?auto_42641 ) ( not ( = ?auto_42633 ?auto_42645 ) ) ( not ( = ?auto_42634 ?auto_42645 ) ) ( not ( = ?auto_42644 ?auto_42645 ) ) ( not ( = ?auto_42637 ?auto_42645 ) ) ( not ( = ?auto_42653 ?auto_42645 ) ) ( not ( = ?auto_42641 ?auto_42645 ) ) ( not ( = ?auto_42661 ?auto_42645 ) ) ( AVAILABLE ?auto_42657 ) ( SURFACE-AT ?auto_42641 ?auto_42651 ) ( ON ?auto_42641 ?auto_42648 ) ( CLEAR ?auto_42641 ) ( not ( = ?auto_42633 ?auto_42648 ) ) ( not ( = ?auto_42634 ?auto_42648 ) ) ( not ( = ?auto_42644 ?auto_42648 ) ) ( not ( = ?auto_42637 ?auto_42648 ) ) ( not ( = ?auto_42653 ?auto_42648 ) ) ( not ( = ?auto_42641 ?auto_42648 ) ) ( not ( = ?auto_42661 ?auto_42648 ) ) ( not ( = ?auto_42645 ?auto_42648 ) ) ( IS-CRATE ?auto_42645 ) ( not ( = ?auto_42633 ?auto_42649 ) ) ( not ( = ?auto_42634 ?auto_42649 ) ) ( not ( = ?auto_42644 ?auto_42649 ) ) ( not ( = ?auto_42637 ?auto_42649 ) ) ( not ( = ?auto_42653 ?auto_42649 ) ) ( not ( = ?auto_42641 ?auto_42649 ) ) ( not ( = ?auto_42661 ?auto_42649 ) ) ( not ( = ?auto_42645 ?auto_42649 ) ) ( not ( = ?auto_42648 ?auto_42649 ) ) ( not ( = ?auto_42658 ?auto_42650 ) ) ( not ( = ?auto_42651 ?auto_42658 ) ) ( not ( = ?auto_42642 ?auto_42658 ) ) ( not ( = ?auto_42659 ?auto_42658 ) ) ( HOIST-AT ?auto_42635 ?auto_42658 ) ( not ( = ?auto_42656 ?auto_42635 ) ) ( not ( = ?auto_42657 ?auto_42635 ) ) ( not ( = ?auto_42647 ?auto_42635 ) ) ( not ( = ?auto_42646 ?auto_42635 ) ) ( AVAILABLE ?auto_42635 ) ( SURFACE-AT ?auto_42645 ?auto_42658 ) ( ON ?auto_42645 ?auto_42643 ) ( CLEAR ?auto_42645 ) ( not ( = ?auto_42633 ?auto_42643 ) ) ( not ( = ?auto_42634 ?auto_42643 ) ) ( not ( = ?auto_42644 ?auto_42643 ) ) ( not ( = ?auto_42637 ?auto_42643 ) ) ( not ( = ?auto_42653 ?auto_42643 ) ) ( not ( = ?auto_42641 ?auto_42643 ) ) ( not ( = ?auto_42661 ?auto_42643 ) ) ( not ( = ?auto_42645 ?auto_42643 ) ) ( not ( = ?auto_42648 ?auto_42643 ) ) ( not ( = ?auto_42649 ?auto_42643 ) ) ( IS-CRATE ?auto_42649 ) ( not ( = ?auto_42633 ?auto_42652 ) ) ( not ( = ?auto_42634 ?auto_42652 ) ) ( not ( = ?auto_42644 ?auto_42652 ) ) ( not ( = ?auto_42637 ?auto_42652 ) ) ( not ( = ?auto_42653 ?auto_42652 ) ) ( not ( = ?auto_42641 ?auto_42652 ) ) ( not ( = ?auto_42661 ?auto_42652 ) ) ( not ( = ?auto_42645 ?auto_42652 ) ) ( not ( = ?auto_42648 ?auto_42652 ) ) ( not ( = ?auto_42649 ?auto_42652 ) ) ( not ( = ?auto_42643 ?auto_42652 ) ) ( AVAILABLE ?auto_42647 ) ( SURFACE-AT ?auto_42649 ?auto_42642 ) ( ON ?auto_42649 ?auto_42654 ) ( CLEAR ?auto_42649 ) ( not ( = ?auto_42633 ?auto_42654 ) ) ( not ( = ?auto_42634 ?auto_42654 ) ) ( not ( = ?auto_42644 ?auto_42654 ) ) ( not ( = ?auto_42637 ?auto_42654 ) ) ( not ( = ?auto_42653 ?auto_42654 ) ) ( not ( = ?auto_42641 ?auto_42654 ) ) ( not ( = ?auto_42661 ?auto_42654 ) ) ( not ( = ?auto_42645 ?auto_42654 ) ) ( not ( = ?auto_42648 ?auto_42654 ) ) ( not ( = ?auto_42649 ?auto_42654 ) ) ( not ( = ?auto_42643 ?auto_42654 ) ) ( not ( = ?auto_42652 ?auto_42654 ) ) ( IS-CRATE ?auto_42652 ) ( not ( = ?auto_42633 ?auto_42636 ) ) ( not ( = ?auto_42634 ?auto_42636 ) ) ( not ( = ?auto_42644 ?auto_42636 ) ) ( not ( = ?auto_42637 ?auto_42636 ) ) ( not ( = ?auto_42653 ?auto_42636 ) ) ( not ( = ?auto_42641 ?auto_42636 ) ) ( not ( = ?auto_42661 ?auto_42636 ) ) ( not ( = ?auto_42645 ?auto_42636 ) ) ( not ( = ?auto_42648 ?auto_42636 ) ) ( not ( = ?auto_42649 ?auto_42636 ) ) ( not ( = ?auto_42643 ?auto_42636 ) ) ( not ( = ?auto_42652 ?auto_42636 ) ) ( not ( = ?auto_42654 ?auto_42636 ) ) ( not ( = ?auto_42660 ?auto_42650 ) ) ( not ( = ?auto_42651 ?auto_42660 ) ) ( not ( = ?auto_42642 ?auto_42660 ) ) ( not ( = ?auto_42659 ?auto_42660 ) ) ( not ( = ?auto_42658 ?auto_42660 ) ) ( HOIST-AT ?auto_42639 ?auto_42660 ) ( not ( = ?auto_42656 ?auto_42639 ) ) ( not ( = ?auto_42657 ?auto_42639 ) ) ( not ( = ?auto_42647 ?auto_42639 ) ) ( not ( = ?auto_42646 ?auto_42639 ) ) ( not ( = ?auto_42635 ?auto_42639 ) ) ( AVAILABLE ?auto_42639 ) ( SURFACE-AT ?auto_42652 ?auto_42660 ) ( ON ?auto_42652 ?auto_42638 ) ( CLEAR ?auto_42652 ) ( not ( = ?auto_42633 ?auto_42638 ) ) ( not ( = ?auto_42634 ?auto_42638 ) ) ( not ( = ?auto_42644 ?auto_42638 ) ) ( not ( = ?auto_42637 ?auto_42638 ) ) ( not ( = ?auto_42653 ?auto_42638 ) ) ( not ( = ?auto_42641 ?auto_42638 ) ) ( not ( = ?auto_42661 ?auto_42638 ) ) ( not ( = ?auto_42645 ?auto_42638 ) ) ( not ( = ?auto_42648 ?auto_42638 ) ) ( not ( = ?auto_42649 ?auto_42638 ) ) ( not ( = ?auto_42643 ?auto_42638 ) ) ( not ( = ?auto_42652 ?auto_42638 ) ) ( not ( = ?auto_42654 ?auto_42638 ) ) ( not ( = ?auto_42636 ?auto_42638 ) ) ( SURFACE-AT ?auto_42655 ?auto_42650 ) ( CLEAR ?auto_42655 ) ( IS-CRATE ?auto_42636 ) ( not ( = ?auto_42633 ?auto_42655 ) ) ( not ( = ?auto_42634 ?auto_42655 ) ) ( not ( = ?auto_42644 ?auto_42655 ) ) ( not ( = ?auto_42637 ?auto_42655 ) ) ( not ( = ?auto_42653 ?auto_42655 ) ) ( not ( = ?auto_42641 ?auto_42655 ) ) ( not ( = ?auto_42661 ?auto_42655 ) ) ( not ( = ?auto_42645 ?auto_42655 ) ) ( not ( = ?auto_42648 ?auto_42655 ) ) ( not ( = ?auto_42649 ?auto_42655 ) ) ( not ( = ?auto_42643 ?auto_42655 ) ) ( not ( = ?auto_42652 ?auto_42655 ) ) ( not ( = ?auto_42654 ?auto_42655 ) ) ( not ( = ?auto_42636 ?auto_42655 ) ) ( not ( = ?auto_42638 ?auto_42655 ) ) ( AVAILABLE ?auto_42656 ) ( IN ?auto_42636 ?auto_42640 ) ( TRUCK-AT ?auto_42640 ?auto_42642 ) )
    :subtasks
    ( ( !DRIVE ?auto_42640 ?auto_42642 ?auto_42650 )
      ( MAKE-ON ?auto_42633 ?auto_42634 )
      ( MAKE-ON-VERIFY ?auto_42633 ?auto_42634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42662 - SURFACE
      ?auto_42663 - SURFACE
    )
    :vars
    (
      ?auto_42669 - HOIST
      ?auto_42670 - PLACE
      ?auto_42674 - PLACE
      ?auto_42668 - HOIST
      ?auto_42667 - SURFACE
      ?auto_42684 - SURFACE
      ?auto_42683 - PLACE
      ?auto_42689 - HOIST
      ?auto_42676 - SURFACE
      ?auto_42681 - SURFACE
      ?auto_42687 - PLACE
      ?auto_42678 - HOIST
      ?auto_42672 - SURFACE
      ?auto_42688 - SURFACE
      ?auto_42666 - SURFACE
      ?auto_42690 - SURFACE
      ?auto_42673 - PLACE
      ?auto_42680 - HOIST
      ?auto_42679 - SURFACE
      ?auto_42675 - SURFACE
      ?auto_42665 - SURFACE
      ?auto_42685 - SURFACE
      ?auto_42671 - PLACE
      ?auto_42677 - HOIST
      ?auto_42686 - SURFACE
      ?auto_42664 - SURFACE
      ?auto_42682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42669 ?auto_42670 ) ( IS-CRATE ?auto_42662 ) ( not ( = ?auto_42662 ?auto_42663 ) ) ( not ( = ?auto_42674 ?auto_42670 ) ) ( HOIST-AT ?auto_42668 ?auto_42674 ) ( not ( = ?auto_42669 ?auto_42668 ) ) ( SURFACE-AT ?auto_42662 ?auto_42674 ) ( ON ?auto_42662 ?auto_42667 ) ( CLEAR ?auto_42662 ) ( not ( = ?auto_42662 ?auto_42667 ) ) ( not ( = ?auto_42663 ?auto_42667 ) ) ( IS-CRATE ?auto_42663 ) ( not ( = ?auto_42662 ?auto_42684 ) ) ( not ( = ?auto_42663 ?auto_42684 ) ) ( not ( = ?auto_42667 ?auto_42684 ) ) ( not ( = ?auto_42683 ?auto_42670 ) ) ( not ( = ?auto_42674 ?auto_42683 ) ) ( HOIST-AT ?auto_42689 ?auto_42683 ) ( not ( = ?auto_42669 ?auto_42689 ) ) ( not ( = ?auto_42668 ?auto_42689 ) ) ( SURFACE-AT ?auto_42663 ?auto_42683 ) ( ON ?auto_42663 ?auto_42676 ) ( CLEAR ?auto_42663 ) ( not ( = ?auto_42662 ?auto_42676 ) ) ( not ( = ?auto_42663 ?auto_42676 ) ) ( not ( = ?auto_42667 ?auto_42676 ) ) ( not ( = ?auto_42684 ?auto_42676 ) ) ( IS-CRATE ?auto_42684 ) ( not ( = ?auto_42662 ?auto_42681 ) ) ( not ( = ?auto_42663 ?auto_42681 ) ) ( not ( = ?auto_42667 ?auto_42681 ) ) ( not ( = ?auto_42684 ?auto_42681 ) ) ( not ( = ?auto_42676 ?auto_42681 ) ) ( not ( = ?auto_42687 ?auto_42670 ) ) ( not ( = ?auto_42674 ?auto_42687 ) ) ( not ( = ?auto_42683 ?auto_42687 ) ) ( HOIST-AT ?auto_42678 ?auto_42687 ) ( not ( = ?auto_42669 ?auto_42678 ) ) ( not ( = ?auto_42668 ?auto_42678 ) ) ( not ( = ?auto_42689 ?auto_42678 ) ) ( AVAILABLE ?auto_42678 ) ( SURFACE-AT ?auto_42684 ?auto_42687 ) ( ON ?auto_42684 ?auto_42672 ) ( CLEAR ?auto_42684 ) ( not ( = ?auto_42662 ?auto_42672 ) ) ( not ( = ?auto_42663 ?auto_42672 ) ) ( not ( = ?auto_42667 ?auto_42672 ) ) ( not ( = ?auto_42684 ?auto_42672 ) ) ( not ( = ?auto_42676 ?auto_42672 ) ) ( not ( = ?auto_42681 ?auto_42672 ) ) ( IS-CRATE ?auto_42681 ) ( not ( = ?auto_42662 ?auto_42688 ) ) ( not ( = ?auto_42663 ?auto_42688 ) ) ( not ( = ?auto_42667 ?auto_42688 ) ) ( not ( = ?auto_42684 ?auto_42688 ) ) ( not ( = ?auto_42676 ?auto_42688 ) ) ( not ( = ?auto_42681 ?auto_42688 ) ) ( not ( = ?auto_42672 ?auto_42688 ) ) ( AVAILABLE ?auto_42668 ) ( SURFACE-AT ?auto_42681 ?auto_42674 ) ( ON ?auto_42681 ?auto_42666 ) ( CLEAR ?auto_42681 ) ( not ( = ?auto_42662 ?auto_42666 ) ) ( not ( = ?auto_42663 ?auto_42666 ) ) ( not ( = ?auto_42667 ?auto_42666 ) ) ( not ( = ?auto_42684 ?auto_42666 ) ) ( not ( = ?auto_42676 ?auto_42666 ) ) ( not ( = ?auto_42681 ?auto_42666 ) ) ( not ( = ?auto_42672 ?auto_42666 ) ) ( not ( = ?auto_42688 ?auto_42666 ) ) ( IS-CRATE ?auto_42688 ) ( not ( = ?auto_42662 ?auto_42690 ) ) ( not ( = ?auto_42663 ?auto_42690 ) ) ( not ( = ?auto_42667 ?auto_42690 ) ) ( not ( = ?auto_42684 ?auto_42690 ) ) ( not ( = ?auto_42676 ?auto_42690 ) ) ( not ( = ?auto_42681 ?auto_42690 ) ) ( not ( = ?auto_42672 ?auto_42690 ) ) ( not ( = ?auto_42688 ?auto_42690 ) ) ( not ( = ?auto_42666 ?auto_42690 ) ) ( not ( = ?auto_42673 ?auto_42670 ) ) ( not ( = ?auto_42674 ?auto_42673 ) ) ( not ( = ?auto_42683 ?auto_42673 ) ) ( not ( = ?auto_42687 ?auto_42673 ) ) ( HOIST-AT ?auto_42680 ?auto_42673 ) ( not ( = ?auto_42669 ?auto_42680 ) ) ( not ( = ?auto_42668 ?auto_42680 ) ) ( not ( = ?auto_42689 ?auto_42680 ) ) ( not ( = ?auto_42678 ?auto_42680 ) ) ( AVAILABLE ?auto_42680 ) ( SURFACE-AT ?auto_42688 ?auto_42673 ) ( ON ?auto_42688 ?auto_42679 ) ( CLEAR ?auto_42688 ) ( not ( = ?auto_42662 ?auto_42679 ) ) ( not ( = ?auto_42663 ?auto_42679 ) ) ( not ( = ?auto_42667 ?auto_42679 ) ) ( not ( = ?auto_42684 ?auto_42679 ) ) ( not ( = ?auto_42676 ?auto_42679 ) ) ( not ( = ?auto_42681 ?auto_42679 ) ) ( not ( = ?auto_42672 ?auto_42679 ) ) ( not ( = ?auto_42688 ?auto_42679 ) ) ( not ( = ?auto_42666 ?auto_42679 ) ) ( not ( = ?auto_42690 ?auto_42679 ) ) ( IS-CRATE ?auto_42690 ) ( not ( = ?auto_42662 ?auto_42675 ) ) ( not ( = ?auto_42663 ?auto_42675 ) ) ( not ( = ?auto_42667 ?auto_42675 ) ) ( not ( = ?auto_42684 ?auto_42675 ) ) ( not ( = ?auto_42676 ?auto_42675 ) ) ( not ( = ?auto_42681 ?auto_42675 ) ) ( not ( = ?auto_42672 ?auto_42675 ) ) ( not ( = ?auto_42688 ?auto_42675 ) ) ( not ( = ?auto_42666 ?auto_42675 ) ) ( not ( = ?auto_42690 ?auto_42675 ) ) ( not ( = ?auto_42679 ?auto_42675 ) ) ( SURFACE-AT ?auto_42690 ?auto_42683 ) ( ON ?auto_42690 ?auto_42665 ) ( CLEAR ?auto_42690 ) ( not ( = ?auto_42662 ?auto_42665 ) ) ( not ( = ?auto_42663 ?auto_42665 ) ) ( not ( = ?auto_42667 ?auto_42665 ) ) ( not ( = ?auto_42684 ?auto_42665 ) ) ( not ( = ?auto_42676 ?auto_42665 ) ) ( not ( = ?auto_42681 ?auto_42665 ) ) ( not ( = ?auto_42672 ?auto_42665 ) ) ( not ( = ?auto_42688 ?auto_42665 ) ) ( not ( = ?auto_42666 ?auto_42665 ) ) ( not ( = ?auto_42690 ?auto_42665 ) ) ( not ( = ?auto_42679 ?auto_42665 ) ) ( not ( = ?auto_42675 ?auto_42665 ) ) ( IS-CRATE ?auto_42675 ) ( not ( = ?auto_42662 ?auto_42685 ) ) ( not ( = ?auto_42663 ?auto_42685 ) ) ( not ( = ?auto_42667 ?auto_42685 ) ) ( not ( = ?auto_42684 ?auto_42685 ) ) ( not ( = ?auto_42676 ?auto_42685 ) ) ( not ( = ?auto_42681 ?auto_42685 ) ) ( not ( = ?auto_42672 ?auto_42685 ) ) ( not ( = ?auto_42688 ?auto_42685 ) ) ( not ( = ?auto_42666 ?auto_42685 ) ) ( not ( = ?auto_42690 ?auto_42685 ) ) ( not ( = ?auto_42679 ?auto_42685 ) ) ( not ( = ?auto_42675 ?auto_42685 ) ) ( not ( = ?auto_42665 ?auto_42685 ) ) ( not ( = ?auto_42671 ?auto_42670 ) ) ( not ( = ?auto_42674 ?auto_42671 ) ) ( not ( = ?auto_42683 ?auto_42671 ) ) ( not ( = ?auto_42687 ?auto_42671 ) ) ( not ( = ?auto_42673 ?auto_42671 ) ) ( HOIST-AT ?auto_42677 ?auto_42671 ) ( not ( = ?auto_42669 ?auto_42677 ) ) ( not ( = ?auto_42668 ?auto_42677 ) ) ( not ( = ?auto_42689 ?auto_42677 ) ) ( not ( = ?auto_42678 ?auto_42677 ) ) ( not ( = ?auto_42680 ?auto_42677 ) ) ( AVAILABLE ?auto_42677 ) ( SURFACE-AT ?auto_42675 ?auto_42671 ) ( ON ?auto_42675 ?auto_42686 ) ( CLEAR ?auto_42675 ) ( not ( = ?auto_42662 ?auto_42686 ) ) ( not ( = ?auto_42663 ?auto_42686 ) ) ( not ( = ?auto_42667 ?auto_42686 ) ) ( not ( = ?auto_42684 ?auto_42686 ) ) ( not ( = ?auto_42676 ?auto_42686 ) ) ( not ( = ?auto_42681 ?auto_42686 ) ) ( not ( = ?auto_42672 ?auto_42686 ) ) ( not ( = ?auto_42688 ?auto_42686 ) ) ( not ( = ?auto_42666 ?auto_42686 ) ) ( not ( = ?auto_42690 ?auto_42686 ) ) ( not ( = ?auto_42679 ?auto_42686 ) ) ( not ( = ?auto_42675 ?auto_42686 ) ) ( not ( = ?auto_42665 ?auto_42686 ) ) ( not ( = ?auto_42685 ?auto_42686 ) ) ( SURFACE-AT ?auto_42664 ?auto_42670 ) ( CLEAR ?auto_42664 ) ( IS-CRATE ?auto_42685 ) ( not ( = ?auto_42662 ?auto_42664 ) ) ( not ( = ?auto_42663 ?auto_42664 ) ) ( not ( = ?auto_42667 ?auto_42664 ) ) ( not ( = ?auto_42684 ?auto_42664 ) ) ( not ( = ?auto_42676 ?auto_42664 ) ) ( not ( = ?auto_42681 ?auto_42664 ) ) ( not ( = ?auto_42672 ?auto_42664 ) ) ( not ( = ?auto_42688 ?auto_42664 ) ) ( not ( = ?auto_42666 ?auto_42664 ) ) ( not ( = ?auto_42690 ?auto_42664 ) ) ( not ( = ?auto_42679 ?auto_42664 ) ) ( not ( = ?auto_42675 ?auto_42664 ) ) ( not ( = ?auto_42665 ?auto_42664 ) ) ( not ( = ?auto_42685 ?auto_42664 ) ) ( not ( = ?auto_42686 ?auto_42664 ) ) ( AVAILABLE ?auto_42669 ) ( TRUCK-AT ?auto_42682 ?auto_42683 ) ( LIFTING ?auto_42689 ?auto_42685 ) )
    :subtasks
    ( ( !LOAD ?auto_42689 ?auto_42685 ?auto_42682 ?auto_42683 )
      ( MAKE-ON ?auto_42662 ?auto_42663 )
      ( MAKE-ON-VERIFY ?auto_42662 ?auto_42663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42691 - SURFACE
      ?auto_42692 - SURFACE
    )
    :vars
    (
      ?auto_42699 - HOIST
      ?auto_42701 - PLACE
      ?auto_42712 - PLACE
      ?auto_42717 - HOIST
      ?auto_42718 - SURFACE
      ?auto_42706 - SURFACE
      ?auto_42705 - PLACE
      ?auto_42697 - HOIST
      ?auto_42714 - SURFACE
      ?auto_42695 - SURFACE
      ?auto_42694 - PLACE
      ?auto_42704 - HOIST
      ?auto_42710 - SURFACE
      ?auto_42696 - SURFACE
      ?auto_42719 - SURFACE
      ?auto_42693 - SURFACE
      ?auto_42711 - PLACE
      ?auto_42698 - HOIST
      ?auto_42709 - SURFACE
      ?auto_42713 - SURFACE
      ?auto_42700 - SURFACE
      ?auto_42707 - SURFACE
      ?auto_42716 - PLACE
      ?auto_42715 - HOIST
      ?auto_42708 - SURFACE
      ?auto_42703 - SURFACE
      ?auto_42702 - TRUCK
      ?auto_42720 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42699 ?auto_42701 ) ( IS-CRATE ?auto_42691 ) ( not ( = ?auto_42691 ?auto_42692 ) ) ( not ( = ?auto_42712 ?auto_42701 ) ) ( HOIST-AT ?auto_42717 ?auto_42712 ) ( not ( = ?auto_42699 ?auto_42717 ) ) ( SURFACE-AT ?auto_42691 ?auto_42712 ) ( ON ?auto_42691 ?auto_42718 ) ( CLEAR ?auto_42691 ) ( not ( = ?auto_42691 ?auto_42718 ) ) ( not ( = ?auto_42692 ?auto_42718 ) ) ( IS-CRATE ?auto_42692 ) ( not ( = ?auto_42691 ?auto_42706 ) ) ( not ( = ?auto_42692 ?auto_42706 ) ) ( not ( = ?auto_42718 ?auto_42706 ) ) ( not ( = ?auto_42705 ?auto_42701 ) ) ( not ( = ?auto_42712 ?auto_42705 ) ) ( HOIST-AT ?auto_42697 ?auto_42705 ) ( not ( = ?auto_42699 ?auto_42697 ) ) ( not ( = ?auto_42717 ?auto_42697 ) ) ( SURFACE-AT ?auto_42692 ?auto_42705 ) ( ON ?auto_42692 ?auto_42714 ) ( CLEAR ?auto_42692 ) ( not ( = ?auto_42691 ?auto_42714 ) ) ( not ( = ?auto_42692 ?auto_42714 ) ) ( not ( = ?auto_42718 ?auto_42714 ) ) ( not ( = ?auto_42706 ?auto_42714 ) ) ( IS-CRATE ?auto_42706 ) ( not ( = ?auto_42691 ?auto_42695 ) ) ( not ( = ?auto_42692 ?auto_42695 ) ) ( not ( = ?auto_42718 ?auto_42695 ) ) ( not ( = ?auto_42706 ?auto_42695 ) ) ( not ( = ?auto_42714 ?auto_42695 ) ) ( not ( = ?auto_42694 ?auto_42701 ) ) ( not ( = ?auto_42712 ?auto_42694 ) ) ( not ( = ?auto_42705 ?auto_42694 ) ) ( HOIST-AT ?auto_42704 ?auto_42694 ) ( not ( = ?auto_42699 ?auto_42704 ) ) ( not ( = ?auto_42717 ?auto_42704 ) ) ( not ( = ?auto_42697 ?auto_42704 ) ) ( AVAILABLE ?auto_42704 ) ( SURFACE-AT ?auto_42706 ?auto_42694 ) ( ON ?auto_42706 ?auto_42710 ) ( CLEAR ?auto_42706 ) ( not ( = ?auto_42691 ?auto_42710 ) ) ( not ( = ?auto_42692 ?auto_42710 ) ) ( not ( = ?auto_42718 ?auto_42710 ) ) ( not ( = ?auto_42706 ?auto_42710 ) ) ( not ( = ?auto_42714 ?auto_42710 ) ) ( not ( = ?auto_42695 ?auto_42710 ) ) ( IS-CRATE ?auto_42695 ) ( not ( = ?auto_42691 ?auto_42696 ) ) ( not ( = ?auto_42692 ?auto_42696 ) ) ( not ( = ?auto_42718 ?auto_42696 ) ) ( not ( = ?auto_42706 ?auto_42696 ) ) ( not ( = ?auto_42714 ?auto_42696 ) ) ( not ( = ?auto_42695 ?auto_42696 ) ) ( not ( = ?auto_42710 ?auto_42696 ) ) ( AVAILABLE ?auto_42717 ) ( SURFACE-AT ?auto_42695 ?auto_42712 ) ( ON ?auto_42695 ?auto_42719 ) ( CLEAR ?auto_42695 ) ( not ( = ?auto_42691 ?auto_42719 ) ) ( not ( = ?auto_42692 ?auto_42719 ) ) ( not ( = ?auto_42718 ?auto_42719 ) ) ( not ( = ?auto_42706 ?auto_42719 ) ) ( not ( = ?auto_42714 ?auto_42719 ) ) ( not ( = ?auto_42695 ?auto_42719 ) ) ( not ( = ?auto_42710 ?auto_42719 ) ) ( not ( = ?auto_42696 ?auto_42719 ) ) ( IS-CRATE ?auto_42696 ) ( not ( = ?auto_42691 ?auto_42693 ) ) ( not ( = ?auto_42692 ?auto_42693 ) ) ( not ( = ?auto_42718 ?auto_42693 ) ) ( not ( = ?auto_42706 ?auto_42693 ) ) ( not ( = ?auto_42714 ?auto_42693 ) ) ( not ( = ?auto_42695 ?auto_42693 ) ) ( not ( = ?auto_42710 ?auto_42693 ) ) ( not ( = ?auto_42696 ?auto_42693 ) ) ( not ( = ?auto_42719 ?auto_42693 ) ) ( not ( = ?auto_42711 ?auto_42701 ) ) ( not ( = ?auto_42712 ?auto_42711 ) ) ( not ( = ?auto_42705 ?auto_42711 ) ) ( not ( = ?auto_42694 ?auto_42711 ) ) ( HOIST-AT ?auto_42698 ?auto_42711 ) ( not ( = ?auto_42699 ?auto_42698 ) ) ( not ( = ?auto_42717 ?auto_42698 ) ) ( not ( = ?auto_42697 ?auto_42698 ) ) ( not ( = ?auto_42704 ?auto_42698 ) ) ( AVAILABLE ?auto_42698 ) ( SURFACE-AT ?auto_42696 ?auto_42711 ) ( ON ?auto_42696 ?auto_42709 ) ( CLEAR ?auto_42696 ) ( not ( = ?auto_42691 ?auto_42709 ) ) ( not ( = ?auto_42692 ?auto_42709 ) ) ( not ( = ?auto_42718 ?auto_42709 ) ) ( not ( = ?auto_42706 ?auto_42709 ) ) ( not ( = ?auto_42714 ?auto_42709 ) ) ( not ( = ?auto_42695 ?auto_42709 ) ) ( not ( = ?auto_42710 ?auto_42709 ) ) ( not ( = ?auto_42696 ?auto_42709 ) ) ( not ( = ?auto_42719 ?auto_42709 ) ) ( not ( = ?auto_42693 ?auto_42709 ) ) ( IS-CRATE ?auto_42693 ) ( not ( = ?auto_42691 ?auto_42713 ) ) ( not ( = ?auto_42692 ?auto_42713 ) ) ( not ( = ?auto_42718 ?auto_42713 ) ) ( not ( = ?auto_42706 ?auto_42713 ) ) ( not ( = ?auto_42714 ?auto_42713 ) ) ( not ( = ?auto_42695 ?auto_42713 ) ) ( not ( = ?auto_42710 ?auto_42713 ) ) ( not ( = ?auto_42696 ?auto_42713 ) ) ( not ( = ?auto_42719 ?auto_42713 ) ) ( not ( = ?auto_42693 ?auto_42713 ) ) ( not ( = ?auto_42709 ?auto_42713 ) ) ( SURFACE-AT ?auto_42693 ?auto_42705 ) ( ON ?auto_42693 ?auto_42700 ) ( CLEAR ?auto_42693 ) ( not ( = ?auto_42691 ?auto_42700 ) ) ( not ( = ?auto_42692 ?auto_42700 ) ) ( not ( = ?auto_42718 ?auto_42700 ) ) ( not ( = ?auto_42706 ?auto_42700 ) ) ( not ( = ?auto_42714 ?auto_42700 ) ) ( not ( = ?auto_42695 ?auto_42700 ) ) ( not ( = ?auto_42710 ?auto_42700 ) ) ( not ( = ?auto_42696 ?auto_42700 ) ) ( not ( = ?auto_42719 ?auto_42700 ) ) ( not ( = ?auto_42693 ?auto_42700 ) ) ( not ( = ?auto_42709 ?auto_42700 ) ) ( not ( = ?auto_42713 ?auto_42700 ) ) ( IS-CRATE ?auto_42713 ) ( not ( = ?auto_42691 ?auto_42707 ) ) ( not ( = ?auto_42692 ?auto_42707 ) ) ( not ( = ?auto_42718 ?auto_42707 ) ) ( not ( = ?auto_42706 ?auto_42707 ) ) ( not ( = ?auto_42714 ?auto_42707 ) ) ( not ( = ?auto_42695 ?auto_42707 ) ) ( not ( = ?auto_42710 ?auto_42707 ) ) ( not ( = ?auto_42696 ?auto_42707 ) ) ( not ( = ?auto_42719 ?auto_42707 ) ) ( not ( = ?auto_42693 ?auto_42707 ) ) ( not ( = ?auto_42709 ?auto_42707 ) ) ( not ( = ?auto_42713 ?auto_42707 ) ) ( not ( = ?auto_42700 ?auto_42707 ) ) ( not ( = ?auto_42716 ?auto_42701 ) ) ( not ( = ?auto_42712 ?auto_42716 ) ) ( not ( = ?auto_42705 ?auto_42716 ) ) ( not ( = ?auto_42694 ?auto_42716 ) ) ( not ( = ?auto_42711 ?auto_42716 ) ) ( HOIST-AT ?auto_42715 ?auto_42716 ) ( not ( = ?auto_42699 ?auto_42715 ) ) ( not ( = ?auto_42717 ?auto_42715 ) ) ( not ( = ?auto_42697 ?auto_42715 ) ) ( not ( = ?auto_42704 ?auto_42715 ) ) ( not ( = ?auto_42698 ?auto_42715 ) ) ( AVAILABLE ?auto_42715 ) ( SURFACE-AT ?auto_42713 ?auto_42716 ) ( ON ?auto_42713 ?auto_42708 ) ( CLEAR ?auto_42713 ) ( not ( = ?auto_42691 ?auto_42708 ) ) ( not ( = ?auto_42692 ?auto_42708 ) ) ( not ( = ?auto_42718 ?auto_42708 ) ) ( not ( = ?auto_42706 ?auto_42708 ) ) ( not ( = ?auto_42714 ?auto_42708 ) ) ( not ( = ?auto_42695 ?auto_42708 ) ) ( not ( = ?auto_42710 ?auto_42708 ) ) ( not ( = ?auto_42696 ?auto_42708 ) ) ( not ( = ?auto_42719 ?auto_42708 ) ) ( not ( = ?auto_42693 ?auto_42708 ) ) ( not ( = ?auto_42709 ?auto_42708 ) ) ( not ( = ?auto_42713 ?auto_42708 ) ) ( not ( = ?auto_42700 ?auto_42708 ) ) ( not ( = ?auto_42707 ?auto_42708 ) ) ( SURFACE-AT ?auto_42703 ?auto_42701 ) ( CLEAR ?auto_42703 ) ( IS-CRATE ?auto_42707 ) ( not ( = ?auto_42691 ?auto_42703 ) ) ( not ( = ?auto_42692 ?auto_42703 ) ) ( not ( = ?auto_42718 ?auto_42703 ) ) ( not ( = ?auto_42706 ?auto_42703 ) ) ( not ( = ?auto_42714 ?auto_42703 ) ) ( not ( = ?auto_42695 ?auto_42703 ) ) ( not ( = ?auto_42710 ?auto_42703 ) ) ( not ( = ?auto_42696 ?auto_42703 ) ) ( not ( = ?auto_42719 ?auto_42703 ) ) ( not ( = ?auto_42693 ?auto_42703 ) ) ( not ( = ?auto_42709 ?auto_42703 ) ) ( not ( = ?auto_42713 ?auto_42703 ) ) ( not ( = ?auto_42700 ?auto_42703 ) ) ( not ( = ?auto_42707 ?auto_42703 ) ) ( not ( = ?auto_42708 ?auto_42703 ) ) ( AVAILABLE ?auto_42699 ) ( TRUCK-AT ?auto_42702 ?auto_42705 ) ( AVAILABLE ?auto_42697 ) ( SURFACE-AT ?auto_42707 ?auto_42705 ) ( ON ?auto_42707 ?auto_42720 ) ( CLEAR ?auto_42707 ) ( not ( = ?auto_42691 ?auto_42720 ) ) ( not ( = ?auto_42692 ?auto_42720 ) ) ( not ( = ?auto_42718 ?auto_42720 ) ) ( not ( = ?auto_42706 ?auto_42720 ) ) ( not ( = ?auto_42714 ?auto_42720 ) ) ( not ( = ?auto_42695 ?auto_42720 ) ) ( not ( = ?auto_42710 ?auto_42720 ) ) ( not ( = ?auto_42696 ?auto_42720 ) ) ( not ( = ?auto_42719 ?auto_42720 ) ) ( not ( = ?auto_42693 ?auto_42720 ) ) ( not ( = ?auto_42709 ?auto_42720 ) ) ( not ( = ?auto_42713 ?auto_42720 ) ) ( not ( = ?auto_42700 ?auto_42720 ) ) ( not ( = ?auto_42707 ?auto_42720 ) ) ( not ( = ?auto_42708 ?auto_42720 ) ) ( not ( = ?auto_42703 ?auto_42720 ) ) )
    :subtasks
    ( ( !LIFT ?auto_42697 ?auto_42707 ?auto_42720 ?auto_42705 )
      ( MAKE-ON ?auto_42691 ?auto_42692 )
      ( MAKE-ON-VERIFY ?auto_42691 ?auto_42692 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42721 - SURFACE
      ?auto_42722 - SURFACE
    )
    :vars
    (
      ?auto_42745 - HOIST
      ?auto_42726 - PLACE
      ?auto_42729 - PLACE
      ?auto_42747 - HOIST
      ?auto_42748 - SURFACE
      ?auto_42741 - SURFACE
      ?auto_42742 - PLACE
      ?auto_42736 - HOIST
      ?auto_42724 - SURFACE
      ?auto_42732 - SURFACE
      ?auto_42739 - PLACE
      ?auto_42743 - HOIST
      ?auto_42735 - SURFACE
      ?auto_42733 - SURFACE
      ?auto_42749 - SURFACE
      ?auto_42738 - SURFACE
      ?auto_42723 - PLACE
      ?auto_42737 - HOIST
      ?auto_42734 - SURFACE
      ?auto_42725 - SURFACE
      ?auto_42740 - SURFACE
      ?auto_42744 - SURFACE
      ?auto_42750 - PLACE
      ?auto_42728 - HOIST
      ?auto_42730 - SURFACE
      ?auto_42731 - SURFACE
      ?auto_42746 - SURFACE
      ?auto_42727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42745 ?auto_42726 ) ( IS-CRATE ?auto_42721 ) ( not ( = ?auto_42721 ?auto_42722 ) ) ( not ( = ?auto_42729 ?auto_42726 ) ) ( HOIST-AT ?auto_42747 ?auto_42729 ) ( not ( = ?auto_42745 ?auto_42747 ) ) ( SURFACE-AT ?auto_42721 ?auto_42729 ) ( ON ?auto_42721 ?auto_42748 ) ( CLEAR ?auto_42721 ) ( not ( = ?auto_42721 ?auto_42748 ) ) ( not ( = ?auto_42722 ?auto_42748 ) ) ( IS-CRATE ?auto_42722 ) ( not ( = ?auto_42721 ?auto_42741 ) ) ( not ( = ?auto_42722 ?auto_42741 ) ) ( not ( = ?auto_42748 ?auto_42741 ) ) ( not ( = ?auto_42742 ?auto_42726 ) ) ( not ( = ?auto_42729 ?auto_42742 ) ) ( HOIST-AT ?auto_42736 ?auto_42742 ) ( not ( = ?auto_42745 ?auto_42736 ) ) ( not ( = ?auto_42747 ?auto_42736 ) ) ( SURFACE-AT ?auto_42722 ?auto_42742 ) ( ON ?auto_42722 ?auto_42724 ) ( CLEAR ?auto_42722 ) ( not ( = ?auto_42721 ?auto_42724 ) ) ( not ( = ?auto_42722 ?auto_42724 ) ) ( not ( = ?auto_42748 ?auto_42724 ) ) ( not ( = ?auto_42741 ?auto_42724 ) ) ( IS-CRATE ?auto_42741 ) ( not ( = ?auto_42721 ?auto_42732 ) ) ( not ( = ?auto_42722 ?auto_42732 ) ) ( not ( = ?auto_42748 ?auto_42732 ) ) ( not ( = ?auto_42741 ?auto_42732 ) ) ( not ( = ?auto_42724 ?auto_42732 ) ) ( not ( = ?auto_42739 ?auto_42726 ) ) ( not ( = ?auto_42729 ?auto_42739 ) ) ( not ( = ?auto_42742 ?auto_42739 ) ) ( HOIST-AT ?auto_42743 ?auto_42739 ) ( not ( = ?auto_42745 ?auto_42743 ) ) ( not ( = ?auto_42747 ?auto_42743 ) ) ( not ( = ?auto_42736 ?auto_42743 ) ) ( AVAILABLE ?auto_42743 ) ( SURFACE-AT ?auto_42741 ?auto_42739 ) ( ON ?auto_42741 ?auto_42735 ) ( CLEAR ?auto_42741 ) ( not ( = ?auto_42721 ?auto_42735 ) ) ( not ( = ?auto_42722 ?auto_42735 ) ) ( not ( = ?auto_42748 ?auto_42735 ) ) ( not ( = ?auto_42741 ?auto_42735 ) ) ( not ( = ?auto_42724 ?auto_42735 ) ) ( not ( = ?auto_42732 ?auto_42735 ) ) ( IS-CRATE ?auto_42732 ) ( not ( = ?auto_42721 ?auto_42733 ) ) ( not ( = ?auto_42722 ?auto_42733 ) ) ( not ( = ?auto_42748 ?auto_42733 ) ) ( not ( = ?auto_42741 ?auto_42733 ) ) ( not ( = ?auto_42724 ?auto_42733 ) ) ( not ( = ?auto_42732 ?auto_42733 ) ) ( not ( = ?auto_42735 ?auto_42733 ) ) ( AVAILABLE ?auto_42747 ) ( SURFACE-AT ?auto_42732 ?auto_42729 ) ( ON ?auto_42732 ?auto_42749 ) ( CLEAR ?auto_42732 ) ( not ( = ?auto_42721 ?auto_42749 ) ) ( not ( = ?auto_42722 ?auto_42749 ) ) ( not ( = ?auto_42748 ?auto_42749 ) ) ( not ( = ?auto_42741 ?auto_42749 ) ) ( not ( = ?auto_42724 ?auto_42749 ) ) ( not ( = ?auto_42732 ?auto_42749 ) ) ( not ( = ?auto_42735 ?auto_42749 ) ) ( not ( = ?auto_42733 ?auto_42749 ) ) ( IS-CRATE ?auto_42733 ) ( not ( = ?auto_42721 ?auto_42738 ) ) ( not ( = ?auto_42722 ?auto_42738 ) ) ( not ( = ?auto_42748 ?auto_42738 ) ) ( not ( = ?auto_42741 ?auto_42738 ) ) ( not ( = ?auto_42724 ?auto_42738 ) ) ( not ( = ?auto_42732 ?auto_42738 ) ) ( not ( = ?auto_42735 ?auto_42738 ) ) ( not ( = ?auto_42733 ?auto_42738 ) ) ( not ( = ?auto_42749 ?auto_42738 ) ) ( not ( = ?auto_42723 ?auto_42726 ) ) ( not ( = ?auto_42729 ?auto_42723 ) ) ( not ( = ?auto_42742 ?auto_42723 ) ) ( not ( = ?auto_42739 ?auto_42723 ) ) ( HOIST-AT ?auto_42737 ?auto_42723 ) ( not ( = ?auto_42745 ?auto_42737 ) ) ( not ( = ?auto_42747 ?auto_42737 ) ) ( not ( = ?auto_42736 ?auto_42737 ) ) ( not ( = ?auto_42743 ?auto_42737 ) ) ( AVAILABLE ?auto_42737 ) ( SURFACE-AT ?auto_42733 ?auto_42723 ) ( ON ?auto_42733 ?auto_42734 ) ( CLEAR ?auto_42733 ) ( not ( = ?auto_42721 ?auto_42734 ) ) ( not ( = ?auto_42722 ?auto_42734 ) ) ( not ( = ?auto_42748 ?auto_42734 ) ) ( not ( = ?auto_42741 ?auto_42734 ) ) ( not ( = ?auto_42724 ?auto_42734 ) ) ( not ( = ?auto_42732 ?auto_42734 ) ) ( not ( = ?auto_42735 ?auto_42734 ) ) ( not ( = ?auto_42733 ?auto_42734 ) ) ( not ( = ?auto_42749 ?auto_42734 ) ) ( not ( = ?auto_42738 ?auto_42734 ) ) ( IS-CRATE ?auto_42738 ) ( not ( = ?auto_42721 ?auto_42725 ) ) ( not ( = ?auto_42722 ?auto_42725 ) ) ( not ( = ?auto_42748 ?auto_42725 ) ) ( not ( = ?auto_42741 ?auto_42725 ) ) ( not ( = ?auto_42724 ?auto_42725 ) ) ( not ( = ?auto_42732 ?auto_42725 ) ) ( not ( = ?auto_42735 ?auto_42725 ) ) ( not ( = ?auto_42733 ?auto_42725 ) ) ( not ( = ?auto_42749 ?auto_42725 ) ) ( not ( = ?auto_42738 ?auto_42725 ) ) ( not ( = ?auto_42734 ?auto_42725 ) ) ( SURFACE-AT ?auto_42738 ?auto_42742 ) ( ON ?auto_42738 ?auto_42740 ) ( CLEAR ?auto_42738 ) ( not ( = ?auto_42721 ?auto_42740 ) ) ( not ( = ?auto_42722 ?auto_42740 ) ) ( not ( = ?auto_42748 ?auto_42740 ) ) ( not ( = ?auto_42741 ?auto_42740 ) ) ( not ( = ?auto_42724 ?auto_42740 ) ) ( not ( = ?auto_42732 ?auto_42740 ) ) ( not ( = ?auto_42735 ?auto_42740 ) ) ( not ( = ?auto_42733 ?auto_42740 ) ) ( not ( = ?auto_42749 ?auto_42740 ) ) ( not ( = ?auto_42738 ?auto_42740 ) ) ( not ( = ?auto_42734 ?auto_42740 ) ) ( not ( = ?auto_42725 ?auto_42740 ) ) ( IS-CRATE ?auto_42725 ) ( not ( = ?auto_42721 ?auto_42744 ) ) ( not ( = ?auto_42722 ?auto_42744 ) ) ( not ( = ?auto_42748 ?auto_42744 ) ) ( not ( = ?auto_42741 ?auto_42744 ) ) ( not ( = ?auto_42724 ?auto_42744 ) ) ( not ( = ?auto_42732 ?auto_42744 ) ) ( not ( = ?auto_42735 ?auto_42744 ) ) ( not ( = ?auto_42733 ?auto_42744 ) ) ( not ( = ?auto_42749 ?auto_42744 ) ) ( not ( = ?auto_42738 ?auto_42744 ) ) ( not ( = ?auto_42734 ?auto_42744 ) ) ( not ( = ?auto_42725 ?auto_42744 ) ) ( not ( = ?auto_42740 ?auto_42744 ) ) ( not ( = ?auto_42750 ?auto_42726 ) ) ( not ( = ?auto_42729 ?auto_42750 ) ) ( not ( = ?auto_42742 ?auto_42750 ) ) ( not ( = ?auto_42739 ?auto_42750 ) ) ( not ( = ?auto_42723 ?auto_42750 ) ) ( HOIST-AT ?auto_42728 ?auto_42750 ) ( not ( = ?auto_42745 ?auto_42728 ) ) ( not ( = ?auto_42747 ?auto_42728 ) ) ( not ( = ?auto_42736 ?auto_42728 ) ) ( not ( = ?auto_42743 ?auto_42728 ) ) ( not ( = ?auto_42737 ?auto_42728 ) ) ( AVAILABLE ?auto_42728 ) ( SURFACE-AT ?auto_42725 ?auto_42750 ) ( ON ?auto_42725 ?auto_42730 ) ( CLEAR ?auto_42725 ) ( not ( = ?auto_42721 ?auto_42730 ) ) ( not ( = ?auto_42722 ?auto_42730 ) ) ( not ( = ?auto_42748 ?auto_42730 ) ) ( not ( = ?auto_42741 ?auto_42730 ) ) ( not ( = ?auto_42724 ?auto_42730 ) ) ( not ( = ?auto_42732 ?auto_42730 ) ) ( not ( = ?auto_42735 ?auto_42730 ) ) ( not ( = ?auto_42733 ?auto_42730 ) ) ( not ( = ?auto_42749 ?auto_42730 ) ) ( not ( = ?auto_42738 ?auto_42730 ) ) ( not ( = ?auto_42734 ?auto_42730 ) ) ( not ( = ?auto_42725 ?auto_42730 ) ) ( not ( = ?auto_42740 ?auto_42730 ) ) ( not ( = ?auto_42744 ?auto_42730 ) ) ( SURFACE-AT ?auto_42731 ?auto_42726 ) ( CLEAR ?auto_42731 ) ( IS-CRATE ?auto_42744 ) ( not ( = ?auto_42721 ?auto_42731 ) ) ( not ( = ?auto_42722 ?auto_42731 ) ) ( not ( = ?auto_42748 ?auto_42731 ) ) ( not ( = ?auto_42741 ?auto_42731 ) ) ( not ( = ?auto_42724 ?auto_42731 ) ) ( not ( = ?auto_42732 ?auto_42731 ) ) ( not ( = ?auto_42735 ?auto_42731 ) ) ( not ( = ?auto_42733 ?auto_42731 ) ) ( not ( = ?auto_42749 ?auto_42731 ) ) ( not ( = ?auto_42738 ?auto_42731 ) ) ( not ( = ?auto_42734 ?auto_42731 ) ) ( not ( = ?auto_42725 ?auto_42731 ) ) ( not ( = ?auto_42740 ?auto_42731 ) ) ( not ( = ?auto_42744 ?auto_42731 ) ) ( not ( = ?auto_42730 ?auto_42731 ) ) ( AVAILABLE ?auto_42745 ) ( AVAILABLE ?auto_42736 ) ( SURFACE-AT ?auto_42744 ?auto_42742 ) ( ON ?auto_42744 ?auto_42746 ) ( CLEAR ?auto_42744 ) ( not ( = ?auto_42721 ?auto_42746 ) ) ( not ( = ?auto_42722 ?auto_42746 ) ) ( not ( = ?auto_42748 ?auto_42746 ) ) ( not ( = ?auto_42741 ?auto_42746 ) ) ( not ( = ?auto_42724 ?auto_42746 ) ) ( not ( = ?auto_42732 ?auto_42746 ) ) ( not ( = ?auto_42735 ?auto_42746 ) ) ( not ( = ?auto_42733 ?auto_42746 ) ) ( not ( = ?auto_42749 ?auto_42746 ) ) ( not ( = ?auto_42738 ?auto_42746 ) ) ( not ( = ?auto_42734 ?auto_42746 ) ) ( not ( = ?auto_42725 ?auto_42746 ) ) ( not ( = ?auto_42740 ?auto_42746 ) ) ( not ( = ?auto_42744 ?auto_42746 ) ) ( not ( = ?auto_42730 ?auto_42746 ) ) ( not ( = ?auto_42731 ?auto_42746 ) ) ( TRUCK-AT ?auto_42727 ?auto_42726 ) )
    :subtasks
    ( ( !DRIVE ?auto_42727 ?auto_42726 ?auto_42742 )
      ( MAKE-ON ?auto_42721 ?auto_42722 )
      ( MAKE-ON-VERIFY ?auto_42721 ?auto_42722 ) )
  )

)

