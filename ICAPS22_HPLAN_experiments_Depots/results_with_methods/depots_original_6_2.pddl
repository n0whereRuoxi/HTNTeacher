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
      ?auto_13497 - SURFACE
      ?auto_13498 - SURFACE
    )
    :vars
    (
      ?auto_13499 - HOIST
      ?auto_13500 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13499 ?auto_13500 ) ( SURFACE-AT ?auto_13498 ?auto_13500 ) ( CLEAR ?auto_13498 ) ( LIFTING ?auto_13499 ?auto_13497 ) ( IS-CRATE ?auto_13497 ) ( not ( = ?auto_13497 ?auto_13498 ) ) )
    :subtasks
    ( ( !DROP ?auto_13499 ?auto_13497 ?auto_13498 ?auto_13500 )
      ( MAKE-ON-VERIFY ?auto_13497 ?auto_13498 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13501 - SURFACE
      ?auto_13502 - SURFACE
    )
    :vars
    (
      ?auto_13504 - HOIST
      ?auto_13503 - PLACE
      ?auto_13505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13504 ?auto_13503 ) ( SURFACE-AT ?auto_13502 ?auto_13503 ) ( CLEAR ?auto_13502 ) ( IS-CRATE ?auto_13501 ) ( not ( = ?auto_13501 ?auto_13502 ) ) ( TRUCK-AT ?auto_13505 ?auto_13503 ) ( AVAILABLE ?auto_13504 ) ( IN ?auto_13501 ?auto_13505 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13504 ?auto_13501 ?auto_13505 ?auto_13503 )
      ( MAKE-ON ?auto_13501 ?auto_13502 )
      ( MAKE-ON-VERIFY ?auto_13501 ?auto_13502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13506 - SURFACE
      ?auto_13507 - SURFACE
    )
    :vars
    (
      ?auto_13510 - HOIST
      ?auto_13509 - PLACE
      ?auto_13508 - TRUCK
      ?auto_13511 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13510 ?auto_13509 ) ( SURFACE-AT ?auto_13507 ?auto_13509 ) ( CLEAR ?auto_13507 ) ( IS-CRATE ?auto_13506 ) ( not ( = ?auto_13506 ?auto_13507 ) ) ( AVAILABLE ?auto_13510 ) ( IN ?auto_13506 ?auto_13508 ) ( TRUCK-AT ?auto_13508 ?auto_13511 ) ( not ( = ?auto_13511 ?auto_13509 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13508 ?auto_13511 ?auto_13509 )
      ( MAKE-ON ?auto_13506 ?auto_13507 )
      ( MAKE-ON-VERIFY ?auto_13506 ?auto_13507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13512 - SURFACE
      ?auto_13513 - SURFACE
    )
    :vars
    (
      ?auto_13517 - HOIST
      ?auto_13515 - PLACE
      ?auto_13516 - TRUCK
      ?auto_13514 - PLACE
      ?auto_13518 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13517 ?auto_13515 ) ( SURFACE-AT ?auto_13513 ?auto_13515 ) ( CLEAR ?auto_13513 ) ( IS-CRATE ?auto_13512 ) ( not ( = ?auto_13512 ?auto_13513 ) ) ( AVAILABLE ?auto_13517 ) ( TRUCK-AT ?auto_13516 ?auto_13514 ) ( not ( = ?auto_13514 ?auto_13515 ) ) ( HOIST-AT ?auto_13518 ?auto_13514 ) ( LIFTING ?auto_13518 ?auto_13512 ) ( not ( = ?auto_13517 ?auto_13518 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13518 ?auto_13512 ?auto_13516 ?auto_13514 )
      ( MAKE-ON ?auto_13512 ?auto_13513 )
      ( MAKE-ON-VERIFY ?auto_13512 ?auto_13513 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13519 - SURFACE
      ?auto_13520 - SURFACE
    )
    :vars
    (
      ?auto_13523 - HOIST
      ?auto_13521 - PLACE
      ?auto_13525 - TRUCK
      ?auto_13522 - PLACE
      ?auto_13524 - HOIST
      ?auto_13526 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13523 ?auto_13521 ) ( SURFACE-AT ?auto_13520 ?auto_13521 ) ( CLEAR ?auto_13520 ) ( IS-CRATE ?auto_13519 ) ( not ( = ?auto_13519 ?auto_13520 ) ) ( AVAILABLE ?auto_13523 ) ( TRUCK-AT ?auto_13525 ?auto_13522 ) ( not ( = ?auto_13522 ?auto_13521 ) ) ( HOIST-AT ?auto_13524 ?auto_13522 ) ( not ( = ?auto_13523 ?auto_13524 ) ) ( AVAILABLE ?auto_13524 ) ( SURFACE-AT ?auto_13519 ?auto_13522 ) ( ON ?auto_13519 ?auto_13526 ) ( CLEAR ?auto_13519 ) ( not ( = ?auto_13519 ?auto_13526 ) ) ( not ( = ?auto_13520 ?auto_13526 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13524 ?auto_13519 ?auto_13526 ?auto_13522 )
      ( MAKE-ON ?auto_13519 ?auto_13520 )
      ( MAKE-ON-VERIFY ?auto_13519 ?auto_13520 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13527 - SURFACE
      ?auto_13528 - SURFACE
    )
    :vars
    (
      ?auto_13529 - HOIST
      ?auto_13530 - PLACE
      ?auto_13531 - PLACE
      ?auto_13534 - HOIST
      ?auto_13533 - SURFACE
      ?auto_13532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13529 ?auto_13530 ) ( SURFACE-AT ?auto_13528 ?auto_13530 ) ( CLEAR ?auto_13528 ) ( IS-CRATE ?auto_13527 ) ( not ( = ?auto_13527 ?auto_13528 ) ) ( AVAILABLE ?auto_13529 ) ( not ( = ?auto_13531 ?auto_13530 ) ) ( HOIST-AT ?auto_13534 ?auto_13531 ) ( not ( = ?auto_13529 ?auto_13534 ) ) ( AVAILABLE ?auto_13534 ) ( SURFACE-AT ?auto_13527 ?auto_13531 ) ( ON ?auto_13527 ?auto_13533 ) ( CLEAR ?auto_13527 ) ( not ( = ?auto_13527 ?auto_13533 ) ) ( not ( = ?auto_13528 ?auto_13533 ) ) ( TRUCK-AT ?auto_13532 ?auto_13530 ) )
    :subtasks
    ( ( !DRIVE ?auto_13532 ?auto_13530 ?auto_13531 )
      ( MAKE-ON ?auto_13527 ?auto_13528 )
      ( MAKE-ON-VERIFY ?auto_13527 ?auto_13528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13537 - SURFACE
      ?auto_13538 - SURFACE
    )
    :vars
    (
      ?auto_13539 - HOIST
      ?auto_13540 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13539 ?auto_13540 ) ( SURFACE-AT ?auto_13538 ?auto_13540 ) ( CLEAR ?auto_13538 ) ( LIFTING ?auto_13539 ?auto_13537 ) ( IS-CRATE ?auto_13537 ) ( not ( = ?auto_13537 ?auto_13538 ) ) )
    :subtasks
    ( ( !DROP ?auto_13539 ?auto_13537 ?auto_13538 ?auto_13540 )
      ( MAKE-ON-VERIFY ?auto_13537 ?auto_13538 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13541 - SURFACE
      ?auto_13542 - SURFACE
    )
    :vars
    (
      ?auto_13543 - HOIST
      ?auto_13544 - PLACE
      ?auto_13545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13543 ?auto_13544 ) ( SURFACE-AT ?auto_13542 ?auto_13544 ) ( CLEAR ?auto_13542 ) ( IS-CRATE ?auto_13541 ) ( not ( = ?auto_13541 ?auto_13542 ) ) ( TRUCK-AT ?auto_13545 ?auto_13544 ) ( AVAILABLE ?auto_13543 ) ( IN ?auto_13541 ?auto_13545 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13543 ?auto_13541 ?auto_13545 ?auto_13544 )
      ( MAKE-ON ?auto_13541 ?auto_13542 )
      ( MAKE-ON-VERIFY ?auto_13541 ?auto_13542 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13546 - SURFACE
      ?auto_13547 - SURFACE
    )
    :vars
    (
      ?auto_13549 - HOIST
      ?auto_13550 - PLACE
      ?auto_13548 - TRUCK
      ?auto_13551 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13549 ?auto_13550 ) ( SURFACE-AT ?auto_13547 ?auto_13550 ) ( CLEAR ?auto_13547 ) ( IS-CRATE ?auto_13546 ) ( not ( = ?auto_13546 ?auto_13547 ) ) ( AVAILABLE ?auto_13549 ) ( IN ?auto_13546 ?auto_13548 ) ( TRUCK-AT ?auto_13548 ?auto_13551 ) ( not ( = ?auto_13551 ?auto_13550 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13548 ?auto_13551 ?auto_13550 )
      ( MAKE-ON ?auto_13546 ?auto_13547 )
      ( MAKE-ON-VERIFY ?auto_13546 ?auto_13547 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13552 - SURFACE
      ?auto_13553 - SURFACE
    )
    :vars
    (
      ?auto_13556 - HOIST
      ?auto_13555 - PLACE
      ?auto_13554 - TRUCK
      ?auto_13557 - PLACE
      ?auto_13558 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13556 ?auto_13555 ) ( SURFACE-AT ?auto_13553 ?auto_13555 ) ( CLEAR ?auto_13553 ) ( IS-CRATE ?auto_13552 ) ( not ( = ?auto_13552 ?auto_13553 ) ) ( AVAILABLE ?auto_13556 ) ( TRUCK-AT ?auto_13554 ?auto_13557 ) ( not ( = ?auto_13557 ?auto_13555 ) ) ( HOIST-AT ?auto_13558 ?auto_13557 ) ( LIFTING ?auto_13558 ?auto_13552 ) ( not ( = ?auto_13556 ?auto_13558 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13558 ?auto_13552 ?auto_13554 ?auto_13557 )
      ( MAKE-ON ?auto_13552 ?auto_13553 )
      ( MAKE-ON-VERIFY ?auto_13552 ?auto_13553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13559 - SURFACE
      ?auto_13560 - SURFACE
    )
    :vars
    (
      ?auto_13564 - HOIST
      ?auto_13562 - PLACE
      ?auto_13561 - TRUCK
      ?auto_13565 - PLACE
      ?auto_13563 - HOIST
      ?auto_13566 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13564 ?auto_13562 ) ( SURFACE-AT ?auto_13560 ?auto_13562 ) ( CLEAR ?auto_13560 ) ( IS-CRATE ?auto_13559 ) ( not ( = ?auto_13559 ?auto_13560 ) ) ( AVAILABLE ?auto_13564 ) ( TRUCK-AT ?auto_13561 ?auto_13565 ) ( not ( = ?auto_13565 ?auto_13562 ) ) ( HOIST-AT ?auto_13563 ?auto_13565 ) ( not ( = ?auto_13564 ?auto_13563 ) ) ( AVAILABLE ?auto_13563 ) ( SURFACE-AT ?auto_13559 ?auto_13565 ) ( ON ?auto_13559 ?auto_13566 ) ( CLEAR ?auto_13559 ) ( not ( = ?auto_13559 ?auto_13566 ) ) ( not ( = ?auto_13560 ?auto_13566 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13563 ?auto_13559 ?auto_13566 ?auto_13565 )
      ( MAKE-ON ?auto_13559 ?auto_13560 )
      ( MAKE-ON-VERIFY ?auto_13559 ?auto_13560 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13567 - SURFACE
      ?auto_13568 - SURFACE
    )
    :vars
    (
      ?auto_13570 - HOIST
      ?auto_13571 - PLACE
      ?auto_13569 - PLACE
      ?auto_13573 - HOIST
      ?auto_13574 - SURFACE
      ?auto_13572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13570 ?auto_13571 ) ( SURFACE-AT ?auto_13568 ?auto_13571 ) ( CLEAR ?auto_13568 ) ( IS-CRATE ?auto_13567 ) ( not ( = ?auto_13567 ?auto_13568 ) ) ( AVAILABLE ?auto_13570 ) ( not ( = ?auto_13569 ?auto_13571 ) ) ( HOIST-AT ?auto_13573 ?auto_13569 ) ( not ( = ?auto_13570 ?auto_13573 ) ) ( AVAILABLE ?auto_13573 ) ( SURFACE-AT ?auto_13567 ?auto_13569 ) ( ON ?auto_13567 ?auto_13574 ) ( CLEAR ?auto_13567 ) ( not ( = ?auto_13567 ?auto_13574 ) ) ( not ( = ?auto_13568 ?auto_13574 ) ) ( TRUCK-AT ?auto_13572 ?auto_13571 ) )
    :subtasks
    ( ( !DRIVE ?auto_13572 ?auto_13571 ?auto_13569 )
      ( MAKE-ON ?auto_13567 ?auto_13568 )
      ( MAKE-ON-VERIFY ?auto_13567 ?auto_13568 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13575 - SURFACE
      ?auto_13576 - SURFACE
    )
    :vars
    (
      ?auto_13582 - HOIST
      ?auto_13578 - PLACE
      ?auto_13580 - PLACE
      ?auto_13577 - HOIST
      ?auto_13579 - SURFACE
      ?auto_13581 - TRUCK
      ?auto_13583 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13582 ?auto_13578 ) ( IS-CRATE ?auto_13575 ) ( not ( = ?auto_13575 ?auto_13576 ) ) ( not ( = ?auto_13580 ?auto_13578 ) ) ( HOIST-AT ?auto_13577 ?auto_13580 ) ( not ( = ?auto_13582 ?auto_13577 ) ) ( AVAILABLE ?auto_13577 ) ( SURFACE-AT ?auto_13575 ?auto_13580 ) ( ON ?auto_13575 ?auto_13579 ) ( CLEAR ?auto_13575 ) ( not ( = ?auto_13575 ?auto_13579 ) ) ( not ( = ?auto_13576 ?auto_13579 ) ) ( TRUCK-AT ?auto_13581 ?auto_13578 ) ( SURFACE-AT ?auto_13583 ?auto_13578 ) ( CLEAR ?auto_13583 ) ( LIFTING ?auto_13582 ?auto_13576 ) ( IS-CRATE ?auto_13576 ) ( not ( = ?auto_13575 ?auto_13583 ) ) ( not ( = ?auto_13576 ?auto_13583 ) ) ( not ( = ?auto_13579 ?auto_13583 ) ) )
    :subtasks
    ( ( !DROP ?auto_13582 ?auto_13576 ?auto_13583 ?auto_13578 )
      ( MAKE-ON ?auto_13575 ?auto_13576 )
      ( MAKE-ON-VERIFY ?auto_13575 ?auto_13576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13584 - SURFACE
      ?auto_13585 - SURFACE
    )
    :vars
    (
      ?auto_13588 - HOIST
      ?auto_13592 - PLACE
      ?auto_13586 - PLACE
      ?auto_13589 - HOIST
      ?auto_13591 - SURFACE
      ?auto_13590 - TRUCK
      ?auto_13587 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13588 ?auto_13592 ) ( IS-CRATE ?auto_13584 ) ( not ( = ?auto_13584 ?auto_13585 ) ) ( not ( = ?auto_13586 ?auto_13592 ) ) ( HOIST-AT ?auto_13589 ?auto_13586 ) ( not ( = ?auto_13588 ?auto_13589 ) ) ( AVAILABLE ?auto_13589 ) ( SURFACE-AT ?auto_13584 ?auto_13586 ) ( ON ?auto_13584 ?auto_13591 ) ( CLEAR ?auto_13584 ) ( not ( = ?auto_13584 ?auto_13591 ) ) ( not ( = ?auto_13585 ?auto_13591 ) ) ( TRUCK-AT ?auto_13590 ?auto_13592 ) ( SURFACE-AT ?auto_13587 ?auto_13592 ) ( CLEAR ?auto_13587 ) ( IS-CRATE ?auto_13585 ) ( not ( = ?auto_13584 ?auto_13587 ) ) ( not ( = ?auto_13585 ?auto_13587 ) ) ( not ( = ?auto_13591 ?auto_13587 ) ) ( AVAILABLE ?auto_13588 ) ( IN ?auto_13585 ?auto_13590 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13588 ?auto_13585 ?auto_13590 ?auto_13592 )
      ( MAKE-ON ?auto_13584 ?auto_13585 )
      ( MAKE-ON-VERIFY ?auto_13584 ?auto_13585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13593 - SURFACE
      ?auto_13594 - SURFACE
    )
    :vars
    (
      ?auto_13598 - HOIST
      ?auto_13596 - PLACE
      ?auto_13599 - PLACE
      ?auto_13597 - HOIST
      ?auto_13601 - SURFACE
      ?auto_13595 - SURFACE
      ?auto_13600 - TRUCK
      ?auto_13602 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13598 ?auto_13596 ) ( IS-CRATE ?auto_13593 ) ( not ( = ?auto_13593 ?auto_13594 ) ) ( not ( = ?auto_13599 ?auto_13596 ) ) ( HOIST-AT ?auto_13597 ?auto_13599 ) ( not ( = ?auto_13598 ?auto_13597 ) ) ( AVAILABLE ?auto_13597 ) ( SURFACE-AT ?auto_13593 ?auto_13599 ) ( ON ?auto_13593 ?auto_13601 ) ( CLEAR ?auto_13593 ) ( not ( = ?auto_13593 ?auto_13601 ) ) ( not ( = ?auto_13594 ?auto_13601 ) ) ( SURFACE-AT ?auto_13595 ?auto_13596 ) ( CLEAR ?auto_13595 ) ( IS-CRATE ?auto_13594 ) ( not ( = ?auto_13593 ?auto_13595 ) ) ( not ( = ?auto_13594 ?auto_13595 ) ) ( not ( = ?auto_13601 ?auto_13595 ) ) ( AVAILABLE ?auto_13598 ) ( IN ?auto_13594 ?auto_13600 ) ( TRUCK-AT ?auto_13600 ?auto_13602 ) ( not ( = ?auto_13602 ?auto_13596 ) ) ( not ( = ?auto_13599 ?auto_13602 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13600 ?auto_13602 ?auto_13596 )
      ( MAKE-ON ?auto_13593 ?auto_13594 )
      ( MAKE-ON-VERIFY ?auto_13593 ?auto_13594 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13603 - SURFACE
      ?auto_13604 - SURFACE
    )
    :vars
    (
      ?auto_13608 - HOIST
      ?auto_13605 - PLACE
      ?auto_13612 - PLACE
      ?auto_13607 - HOIST
      ?auto_13606 - SURFACE
      ?auto_13611 - SURFACE
      ?auto_13610 - TRUCK
      ?auto_13609 - PLACE
      ?auto_13613 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13608 ?auto_13605 ) ( IS-CRATE ?auto_13603 ) ( not ( = ?auto_13603 ?auto_13604 ) ) ( not ( = ?auto_13612 ?auto_13605 ) ) ( HOIST-AT ?auto_13607 ?auto_13612 ) ( not ( = ?auto_13608 ?auto_13607 ) ) ( AVAILABLE ?auto_13607 ) ( SURFACE-AT ?auto_13603 ?auto_13612 ) ( ON ?auto_13603 ?auto_13606 ) ( CLEAR ?auto_13603 ) ( not ( = ?auto_13603 ?auto_13606 ) ) ( not ( = ?auto_13604 ?auto_13606 ) ) ( SURFACE-AT ?auto_13611 ?auto_13605 ) ( CLEAR ?auto_13611 ) ( IS-CRATE ?auto_13604 ) ( not ( = ?auto_13603 ?auto_13611 ) ) ( not ( = ?auto_13604 ?auto_13611 ) ) ( not ( = ?auto_13606 ?auto_13611 ) ) ( AVAILABLE ?auto_13608 ) ( TRUCK-AT ?auto_13610 ?auto_13609 ) ( not ( = ?auto_13609 ?auto_13605 ) ) ( not ( = ?auto_13612 ?auto_13609 ) ) ( HOIST-AT ?auto_13613 ?auto_13609 ) ( LIFTING ?auto_13613 ?auto_13604 ) ( not ( = ?auto_13608 ?auto_13613 ) ) ( not ( = ?auto_13607 ?auto_13613 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13613 ?auto_13604 ?auto_13610 ?auto_13609 )
      ( MAKE-ON ?auto_13603 ?auto_13604 )
      ( MAKE-ON-VERIFY ?auto_13603 ?auto_13604 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13614 - SURFACE
      ?auto_13615 - SURFACE
    )
    :vars
    (
      ?auto_13619 - HOIST
      ?auto_13616 - PLACE
      ?auto_13623 - PLACE
      ?auto_13621 - HOIST
      ?auto_13618 - SURFACE
      ?auto_13622 - SURFACE
      ?auto_13617 - TRUCK
      ?auto_13620 - PLACE
      ?auto_13624 - HOIST
      ?auto_13625 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13619 ?auto_13616 ) ( IS-CRATE ?auto_13614 ) ( not ( = ?auto_13614 ?auto_13615 ) ) ( not ( = ?auto_13623 ?auto_13616 ) ) ( HOIST-AT ?auto_13621 ?auto_13623 ) ( not ( = ?auto_13619 ?auto_13621 ) ) ( AVAILABLE ?auto_13621 ) ( SURFACE-AT ?auto_13614 ?auto_13623 ) ( ON ?auto_13614 ?auto_13618 ) ( CLEAR ?auto_13614 ) ( not ( = ?auto_13614 ?auto_13618 ) ) ( not ( = ?auto_13615 ?auto_13618 ) ) ( SURFACE-AT ?auto_13622 ?auto_13616 ) ( CLEAR ?auto_13622 ) ( IS-CRATE ?auto_13615 ) ( not ( = ?auto_13614 ?auto_13622 ) ) ( not ( = ?auto_13615 ?auto_13622 ) ) ( not ( = ?auto_13618 ?auto_13622 ) ) ( AVAILABLE ?auto_13619 ) ( TRUCK-AT ?auto_13617 ?auto_13620 ) ( not ( = ?auto_13620 ?auto_13616 ) ) ( not ( = ?auto_13623 ?auto_13620 ) ) ( HOIST-AT ?auto_13624 ?auto_13620 ) ( not ( = ?auto_13619 ?auto_13624 ) ) ( not ( = ?auto_13621 ?auto_13624 ) ) ( AVAILABLE ?auto_13624 ) ( SURFACE-AT ?auto_13615 ?auto_13620 ) ( ON ?auto_13615 ?auto_13625 ) ( CLEAR ?auto_13615 ) ( not ( = ?auto_13614 ?auto_13625 ) ) ( not ( = ?auto_13615 ?auto_13625 ) ) ( not ( = ?auto_13618 ?auto_13625 ) ) ( not ( = ?auto_13622 ?auto_13625 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13624 ?auto_13615 ?auto_13625 ?auto_13620 )
      ( MAKE-ON ?auto_13614 ?auto_13615 )
      ( MAKE-ON-VERIFY ?auto_13614 ?auto_13615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13626 - SURFACE
      ?auto_13627 - SURFACE
    )
    :vars
    (
      ?auto_13634 - HOIST
      ?auto_13633 - PLACE
      ?auto_13631 - PLACE
      ?auto_13635 - HOIST
      ?auto_13636 - SURFACE
      ?auto_13629 - SURFACE
      ?auto_13632 - PLACE
      ?auto_13630 - HOIST
      ?auto_13628 - SURFACE
      ?auto_13637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13634 ?auto_13633 ) ( IS-CRATE ?auto_13626 ) ( not ( = ?auto_13626 ?auto_13627 ) ) ( not ( = ?auto_13631 ?auto_13633 ) ) ( HOIST-AT ?auto_13635 ?auto_13631 ) ( not ( = ?auto_13634 ?auto_13635 ) ) ( AVAILABLE ?auto_13635 ) ( SURFACE-AT ?auto_13626 ?auto_13631 ) ( ON ?auto_13626 ?auto_13636 ) ( CLEAR ?auto_13626 ) ( not ( = ?auto_13626 ?auto_13636 ) ) ( not ( = ?auto_13627 ?auto_13636 ) ) ( SURFACE-AT ?auto_13629 ?auto_13633 ) ( CLEAR ?auto_13629 ) ( IS-CRATE ?auto_13627 ) ( not ( = ?auto_13626 ?auto_13629 ) ) ( not ( = ?auto_13627 ?auto_13629 ) ) ( not ( = ?auto_13636 ?auto_13629 ) ) ( AVAILABLE ?auto_13634 ) ( not ( = ?auto_13632 ?auto_13633 ) ) ( not ( = ?auto_13631 ?auto_13632 ) ) ( HOIST-AT ?auto_13630 ?auto_13632 ) ( not ( = ?auto_13634 ?auto_13630 ) ) ( not ( = ?auto_13635 ?auto_13630 ) ) ( AVAILABLE ?auto_13630 ) ( SURFACE-AT ?auto_13627 ?auto_13632 ) ( ON ?auto_13627 ?auto_13628 ) ( CLEAR ?auto_13627 ) ( not ( = ?auto_13626 ?auto_13628 ) ) ( not ( = ?auto_13627 ?auto_13628 ) ) ( not ( = ?auto_13636 ?auto_13628 ) ) ( not ( = ?auto_13629 ?auto_13628 ) ) ( TRUCK-AT ?auto_13637 ?auto_13633 ) )
    :subtasks
    ( ( !DRIVE ?auto_13637 ?auto_13633 ?auto_13632 )
      ( MAKE-ON ?auto_13626 ?auto_13627 )
      ( MAKE-ON-VERIFY ?auto_13626 ?auto_13627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13640 - SURFACE
      ?auto_13641 - SURFACE
    )
    :vars
    (
      ?auto_13642 - HOIST
      ?auto_13643 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13642 ?auto_13643 ) ( SURFACE-AT ?auto_13641 ?auto_13643 ) ( CLEAR ?auto_13641 ) ( LIFTING ?auto_13642 ?auto_13640 ) ( IS-CRATE ?auto_13640 ) ( not ( = ?auto_13640 ?auto_13641 ) ) )
    :subtasks
    ( ( !DROP ?auto_13642 ?auto_13640 ?auto_13641 ?auto_13643 )
      ( MAKE-ON-VERIFY ?auto_13640 ?auto_13641 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13644 - SURFACE
      ?auto_13645 - SURFACE
    )
    :vars
    (
      ?auto_13646 - HOIST
      ?auto_13647 - PLACE
      ?auto_13648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13646 ?auto_13647 ) ( SURFACE-AT ?auto_13645 ?auto_13647 ) ( CLEAR ?auto_13645 ) ( IS-CRATE ?auto_13644 ) ( not ( = ?auto_13644 ?auto_13645 ) ) ( TRUCK-AT ?auto_13648 ?auto_13647 ) ( AVAILABLE ?auto_13646 ) ( IN ?auto_13644 ?auto_13648 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13646 ?auto_13644 ?auto_13648 ?auto_13647 )
      ( MAKE-ON ?auto_13644 ?auto_13645 )
      ( MAKE-ON-VERIFY ?auto_13644 ?auto_13645 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13649 - SURFACE
      ?auto_13650 - SURFACE
    )
    :vars
    (
      ?auto_13653 - HOIST
      ?auto_13652 - PLACE
      ?auto_13651 - TRUCK
      ?auto_13654 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13653 ?auto_13652 ) ( SURFACE-AT ?auto_13650 ?auto_13652 ) ( CLEAR ?auto_13650 ) ( IS-CRATE ?auto_13649 ) ( not ( = ?auto_13649 ?auto_13650 ) ) ( AVAILABLE ?auto_13653 ) ( IN ?auto_13649 ?auto_13651 ) ( TRUCK-AT ?auto_13651 ?auto_13654 ) ( not ( = ?auto_13654 ?auto_13652 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13651 ?auto_13654 ?auto_13652 )
      ( MAKE-ON ?auto_13649 ?auto_13650 )
      ( MAKE-ON-VERIFY ?auto_13649 ?auto_13650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13655 - SURFACE
      ?auto_13656 - SURFACE
    )
    :vars
    (
      ?auto_13660 - HOIST
      ?auto_13659 - PLACE
      ?auto_13657 - TRUCK
      ?auto_13658 - PLACE
      ?auto_13661 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13660 ?auto_13659 ) ( SURFACE-AT ?auto_13656 ?auto_13659 ) ( CLEAR ?auto_13656 ) ( IS-CRATE ?auto_13655 ) ( not ( = ?auto_13655 ?auto_13656 ) ) ( AVAILABLE ?auto_13660 ) ( TRUCK-AT ?auto_13657 ?auto_13658 ) ( not ( = ?auto_13658 ?auto_13659 ) ) ( HOIST-AT ?auto_13661 ?auto_13658 ) ( LIFTING ?auto_13661 ?auto_13655 ) ( not ( = ?auto_13660 ?auto_13661 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13661 ?auto_13655 ?auto_13657 ?auto_13658 )
      ( MAKE-ON ?auto_13655 ?auto_13656 )
      ( MAKE-ON-VERIFY ?auto_13655 ?auto_13656 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13662 - SURFACE
      ?auto_13663 - SURFACE
    )
    :vars
    (
      ?auto_13667 - HOIST
      ?auto_13668 - PLACE
      ?auto_13664 - TRUCK
      ?auto_13665 - PLACE
      ?auto_13666 - HOIST
      ?auto_13669 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13667 ?auto_13668 ) ( SURFACE-AT ?auto_13663 ?auto_13668 ) ( CLEAR ?auto_13663 ) ( IS-CRATE ?auto_13662 ) ( not ( = ?auto_13662 ?auto_13663 ) ) ( AVAILABLE ?auto_13667 ) ( TRUCK-AT ?auto_13664 ?auto_13665 ) ( not ( = ?auto_13665 ?auto_13668 ) ) ( HOIST-AT ?auto_13666 ?auto_13665 ) ( not ( = ?auto_13667 ?auto_13666 ) ) ( AVAILABLE ?auto_13666 ) ( SURFACE-AT ?auto_13662 ?auto_13665 ) ( ON ?auto_13662 ?auto_13669 ) ( CLEAR ?auto_13662 ) ( not ( = ?auto_13662 ?auto_13669 ) ) ( not ( = ?auto_13663 ?auto_13669 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13666 ?auto_13662 ?auto_13669 ?auto_13665 )
      ( MAKE-ON ?auto_13662 ?auto_13663 )
      ( MAKE-ON-VERIFY ?auto_13662 ?auto_13663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13670 - SURFACE
      ?auto_13671 - SURFACE
    )
    :vars
    (
      ?auto_13677 - HOIST
      ?auto_13675 - PLACE
      ?auto_13674 - PLACE
      ?auto_13673 - HOIST
      ?auto_13676 - SURFACE
      ?auto_13672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13677 ?auto_13675 ) ( SURFACE-AT ?auto_13671 ?auto_13675 ) ( CLEAR ?auto_13671 ) ( IS-CRATE ?auto_13670 ) ( not ( = ?auto_13670 ?auto_13671 ) ) ( AVAILABLE ?auto_13677 ) ( not ( = ?auto_13674 ?auto_13675 ) ) ( HOIST-AT ?auto_13673 ?auto_13674 ) ( not ( = ?auto_13677 ?auto_13673 ) ) ( AVAILABLE ?auto_13673 ) ( SURFACE-AT ?auto_13670 ?auto_13674 ) ( ON ?auto_13670 ?auto_13676 ) ( CLEAR ?auto_13670 ) ( not ( = ?auto_13670 ?auto_13676 ) ) ( not ( = ?auto_13671 ?auto_13676 ) ) ( TRUCK-AT ?auto_13672 ?auto_13675 ) )
    :subtasks
    ( ( !DRIVE ?auto_13672 ?auto_13675 ?auto_13674 )
      ( MAKE-ON ?auto_13670 ?auto_13671 )
      ( MAKE-ON-VERIFY ?auto_13670 ?auto_13671 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13678 - SURFACE
      ?auto_13679 - SURFACE
    )
    :vars
    (
      ?auto_13680 - HOIST
      ?auto_13681 - PLACE
      ?auto_13684 - PLACE
      ?auto_13682 - HOIST
      ?auto_13683 - SURFACE
      ?auto_13685 - TRUCK
      ?auto_13686 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13680 ?auto_13681 ) ( IS-CRATE ?auto_13678 ) ( not ( = ?auto_13678 ?auto_13679 ) ) ( not ( = ?auto_13684 ?auto_13681 ) ) ( HOIST-AT ?auto_13682 ?auto_13684 ) ( not ( = ?auto_13680 ?auto_13682 ) ) ( AVAILABLE ?auto_13682 ) ( SURFACE-AT ?auto_13678 ?auto_13684 ) ( ON ?auto_13678 ?auto_13683 ) ( CLEAR ?auto_13678 ) ( not ( = ?auto_13678 ?auto_13683 ) ) ( not ( = ?auto_13679 ?auto_13683 ) ) ( TRUCK-AT ?auto_13685 ?auto_13681 ) ( SURFACE-AT ?auto_13686 ?auto_13681 ) ( CLEAR ?auto_13686 ) ( LIFTING ?auto_13680 ?auto_13679 ) ( IS-CRATE ?auto_13679 ) ( not ( = ?auto_13678 ?auto_13686 ) ) ( not ( = ?auto_13679 ?auto_13686 ) ) ( not ( = ?auto_13683 ?auto_13686 ) ) )
    :subtasks
    ( ( !DROP ?auto_13680 ?auto_13679 ?auto_13686 ?auto_13681 )
      ( MAKE-ON ?auto_13678 ?auto_13679 )
      ( MAKE-ON-VERIFY ?auto_13678 ?auto_13679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13687 - SURFACE
      ?auto_13688 - SURFACE
    )
    :vars
    (
      ?auto_13694 - HOIST
      ?auto_13689 - PLACE
      ?auto_13691 - PLACE
      ?auto_13695 - HOIST
      ?auto_13693 - SURFACE
      ?auto_13692 - TRUCK
      ?auto_13690 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13694 ?auto_13689 ) ( IS-CRATE ?auto_13687 ) ( not ( = ?auto_13687 ?auto_13688 ) ) ( not ( = ?auto_13691 ?auto_13689 ) ) ( HOIST-AT ?auto_13695 ?auto_13691 ) ( not ( = ?auto_13694 ?auto_13695 ) ) ( AVAILABLE ?auto_13695 ) ( SURFACE-AT ?auto_13687 ?auto_13691 ) ( ON ?auto_13687 ?auto_13693 ) ( CLEAR ?auto_13687 ) ( not ( = ?auto_13687 ?auto_13693 ) ) ( not ( = ?auto_13688 ?auto_13693 ) ) ( TRUCK-AT ?auto_13692 ?auto_13689 ) ( SURFACE-AT ?auto_13690 ?auto_13689 ) ( CLEAR ?auto_13690 ) ( IS-CRATE ?auto_13688 ) ( not ( = ?auto_13687 ?auto_13690 ) ) ( not ( = ?auto_13688 ?auto_13690 ) ) ( not ( = ?auto_13693 ?auto_13690 ) ) ( AVAILABLE ?auto_13694 ) ( IN ?auto_13688 ?auto_13692 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13694 ?auto_13688 ?auto_13692 ?auto_13689 )
      ( MAKE-ON ?auto_13687 ?auto_13688 )
      ( MAKE-ON-VERIFY ?auto_13687 ?auto_13688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13696 - SURFACE
      ?auto_13697 - SURFACE
    )
    :vars
    (
      ?auto_13702 - HOIST
      ?auto_13704 - PLACE
      ?auto_13701 - PLACE
      ?auto_13699 - HOIST
      ?auto_13700 - SURFACE
      ?auto_13698 - SURFACE
      ?auto_13703 - TRUCK
      ?auto_13705 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13702 ?auto_13704 ) ( IS-CRATE ?auto_13696 ) ( not ( = ?auto_13696 ?auto_13697 ) ) ( not ( = ?auto_13701 ?auto_13704 ) ) ( HOIST-AT ?auto_13699 ?auto_13701 ) ( not ( = ?auto_13702 ?auto_13699 ) ) ( AVAILABLE ?auto_13699 ) ( SURFACE-AT ?auto_13696 ?auto_13701 ) ( ON ?auto_13696 ?auto_13700 ) ( CLEAR ?auto_13696 ) ( not ( = ?auto_13696 ?auto_13700 ) ) ( not ( = ?auto_13697 ?auto_13700 ) ) ( SURFACE-AT ?auto_13698 ?auto_13704 ) ( CLEAR ?auto_13698 ) ( IS-CRATE ?auto_13697 ) ( not ( = ?auto_13696 ?auto_13698 ) ) ( not ( = ?auto_13697 ?auto_13698 ) ) ( not ( = ?auto_13700 ?auto_13698 ) ) ( AVAILABLE ?auto_13702 ) ( IN ?auto_13697 ?auto_13703 ) ( TRUCK-AT ?auto_13703 ?auto_13705 ) ( not ( = ?auto_13705 ?auto_13704 ) ) ( not ( = ?auto_13701 ?auto_13705 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13703 ?auto_13705 ?auto_13704 )
      ( MAKE-ON ?auto_13696 ?auto_13697 )
      ( MAKE-ON-VERIFY ?auto_13696 ?auto_13697 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13706 - SURFACE
      ?auto_13707 - SURFACE
    )
    :vars
    (
      ?auto_13711 - HOIST
      ?auto_13714 - PLACE
      ?auto_13713 - PLACE
      ?auto_13712 - HOIST
      ?auto_13710 - SURFACE
      ?auto_13715 - SURFACE
      ?auto_13709 - TRUCK
      ?auto_13708 - PLACE
      ?auto_13716 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13711 ?auto_13714 ) ( IS-CRATE ?auto_13706 ) ( not ( = ?auto_13706 ?auto_13707 ) ) ( not ( = ?auto_13713 ?auto_13714 ) ) ( HOIST-AT ?auto_13712 ?auto_13713 ) ( not ( = ?auto_13711 ?auto_13712 ) ) ( AVAILABLE ?auto_13712 ) ( SURFACE-AT ?auto_13706 ?auto_13713 ) ( ON ?auto_13706 ?auto_13710 ) ( CLEAR ?auto_13706 ) ( not ( = ?auto_13706 ?auto_13710 ) ) ( not ( = ?auto_13707 ?auto_13710 ) ) ( SURFACE-AT ?auto_13715 ?auto_13714 ) ( CLEAR ?auto_13715 ) ( IS-CRATE ?auto_13707 ) ( not ( = ?auto_13706 ?auto_13715 ) ) ( not ( = ?auto_13707 ?auto_13715 ) ) ( not ( = ?auto_13710 ?auto_13715 ) ) ( AVAILABLE ?auto_13711 ) ( TRUCK-AT ?auto_13709 ?auto_13708 ) ( not ( = ?auto_13708 ?auto_13714 ) ) ( not ( = ?auto_13713 ?auto_13708 ) ) ( HOIST-AT ?auto_13716 ?auto_13708 ) ( LIFTING ?auto_13716 ?auto_13707 ) ( not ( = ?auto_13711 ?auto_13716 ) ) ( not ( = ?auto_13712 ?auto_13716 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13716 ?auto_13707 ?auto_13709 ?auto_13708 )
      ( MAKE-ON ?auto_13706 ?auto_13707 )
      ( MAKE-ON-VERIFY ?auto_13706 ?auto_13707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13717 - SURFACE
      ?auto_13718 - SURFACE
    )
    :vars
    (
      ?auto_13724 - HOIST
      ?auto_13726 - PLACE
      ?auto_13720 - PLACE
      ?auto_13723 - HOIST
      ?auto_13719 - SURFACE
      ?auto_13722 - SURFACE
      ?auto_13721 - TRUCK
      ?auto_13725 - PLACE
      ?auto_13727 - HOIST
      ?auto_13728 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13724 ?auto_13726 ) ( IS-CRATE ?auto_13717 ) ( not ( = ?auto_13717 ?auto_13718 ) ) ( not ( = ?auto_13720 ?auto_13726 ) ) ( HOIST-AT ?auto_13723 ?auto_13720 ) ( not ( = ?auto_13724 ?auto_13723 ) ) ( AVAILABLE ?auto_13723 ) ( SURFACE-AT ?auto_13717 ?auto_13720 ) ( ON ?auto_13717 ?auto_13719 ) ( CLEAR ?auto_13717 ) ( not ( = ?auto_13717 ?auto_13719 ) ) ( not ( = ?auto_13718 ?auto_13719 ) ) ( SURFACE-AT ?auto_13722 ?auto_13726 ) ( CLEAR ?auto_13722 ) ( IS-CRATE ?auto_13718 ) ( not ( = ?auto_13717 ?auto_13722 ) ) ( not ( = ?auto_13718 ?auto_13722 ) ) ( not ( = ?auto_13719 ?auto_13722 ) ) ( AVAILABLE ?auto_13724 ) ( TRUCK-AT ?auto_13721 ?auto_13725 ) ( not ( = ?auto_13725 ?auto_13726 ) ) ( not ( = ?auto_13720 ?auto_13725 ) ) ( HOIST-AT ?auto_13727 ?auto_13725 ) ( not ( = ?auto_13724 ?auto_13727 ) ) ( not ( = ?auto_13723 ?auto_13727 ) ) ( AVAILABLE ?auto_13727 ) ( SURFACE-AT ?auto_13718 ?auto_13725 ) ( ON ?auto_13718 ?auto_13728 ) ( CLEAR ?auto_13718 ) ( not ( = ?auto_13717 ?auto_13728 ) ) ( not ( = ?auto_13718 ?auto_13728 ) ) ( not ( = ?auto_13719 ?auto_13728 ) ) ( not ( = ?auto_13722 ?auto_13728 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13727 ?auto_13718 ?auto_13728 ?auto_13725 )
      ( MAKE-ON ?auto_13717 ?auto_13718 )
      ( MAKE-ON-VERIFY ?auto_13717 ?auto_13718 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13729 - SURFACE
      ?auto_13730 - SURFACE
    )
    :vars
    (
      ?auto_13739 - HOIST
      ?auto_13740 - PLACE
      ?auto_13737 - PLACE
      ?auto_13738 - HOIST
      ?auto_13732 - SURFACE
      ?auto_13736 - SURFACE
      ?auto_13734 - PLACE
      ?auto_13731 - HOIST
      ?auto_13735 - SURFACE
      ?auto_13733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13739 ?auto_13740 ) ( IS-CRATE ?auto_13729 ) ( not ( = ?auto_13729 ?auto_13730 ) ) ( not ( = ?auto_13737 ?auto_13740 ) ) ( HOIST-AT ?auto_13738 ?auto_13737 ) ( not ( = ?auto_13739 ?auto_13738 ) ) ( AVAILABLE ?auto_13738 ) ( SURFACE-AT ?auto_13729 ?auto_13737 ) ( ON ?auto_13729 ?auto_13732 ) ( CLEAR ?auto_13729 ) ( not ( = ?auto_13729 ?auto_13732 ) ) ( not ( = ?auto_13730 ?auto_13732 ) ) ( SURFACE-AT ?auto_13736 ?auto_13740 ) ( CLEAR ?auto_13736 ) ( IS-CRATE ?auto_13730 ) ( not ( = ?auto_13729 ?auto_13736 ) ) ( not ( = ?auto_13730 ?auto_13736 ) ) ( not ( = ?auto_13732 ?auto_13736 ) ) ( AVAILABLE ?auto_13739 ) ( not ( = ?auto_13734 ?auto_13740 ) ) ( not ( = ?auto_13737 ?auto_13734 ) ) ( HOIST-AT ?auto_13731 ?auto_13734 ) ( not ( = ?auto_13739 ?auto_13731 ) ) ( not ( = ?auto_13738 ?auto_13731 ) ) ( AVAILABLE ?auto_13731 ) ( SURFACE-AT ?auto_13730 ?auto_13734 ) ( ON ?auto_13730 ?auto_13735 ) ( CLEAR ?auto_13730 ) ( not ( = ?auto_13729 ?auto_13735 ) ) ( not ( = ?auto_13730 ?auto_13735 ) ) ( not ( = ?auto_13732 ?auto_13735 ) ) ( not ( = ?auto_13736 ?auto_13735 ) ) ( TRUCK-AT ?auto_13733 ?auto_13740 ) )
    :subtasks
    ( ( !DRIVE ?auto_13733 ?auto_13740 ?auto_13734 )
      ( MAKE-ON ?auto_13729 ?auto_13730 )
      ( MAKE-ON-VERIFY ?auto_13729 ?auto_13730 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13741 - SURFACE
      ?auto_13742 - SURFACE
    )
    :vars
    (
      ?auto_13750 - HOIST
      ?auto_13747 - PLACE
      ?auto_13752 - PLACE
      ?auto_13746 - HOIST
      ?auto_13743 - SURFACE
      ?auto_13749 - SURFACE
      ?auto_13751 - PLACE
      ?auto_13745 - HOIST
      ?auto_13748 - SURFACE
      ?auto_13744 - TRUCK
      ?auto_13753 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13750 ?auto_13747 ) ( IS-CRATE ?auto_13741 ) ( not ( = ?auto_13741 ?auto_13742 ) ) ( not ( = ?auto_13752 ?auto_13747 ) ) ( HOIST-AT ?auto_13746 ?auto_13752 ) ( not ( = ?auto_13750 ?auto_13746 ) ) ( AVAILABLE ?auto_13746 ) ( SURFACE-AT ?auto_13741 ?auto_13752 ) ( ON ?auto_13741 ?auto_13743 ) ( CLEAR ?auto_13741 ) ( not ( = ?auto_13741 ?auto_13743 ) ) ( not ( = ?auto_13742 ?auto_13743 ) ) ( IS-CRATE ?auto_13742 ) ( not ( = ?auto_13741 ?auto_13749 ) ) ( not ( = ?auto_13742 ?auto_13749 ) ) ( not ( = ?auto_13743 ?auto_13749 ) ) ( not ( = ?auto_13751 ?auto_13747 ) ) ( not ( = ?auto_13752 ?auto_13751 ) ) ( HOIST-AT ?auto_13745 ?auto_13751 ) ( not ( = ?auto_13750 ?auto_13745 ) ) ( not ( = ?auto_13746 ?auto_13745 ) ) ( AVAILABLE ?auto_13745 ) ( SURFACE-AT ?auto_13742 ?auto_13751 ) ( ON ?auto_13742 ?auto_13748 ) ( CLEAR ?auto_13742 ) ( not ( = ?auto_13741 ?auto_13748 ) ) ( not ( = ?auto_13742 ?auto_13748 ) ) ( not ( = ?auto_13743 ?auto_13748 ) ) ( not ( = ?auto_13749 ?auto_13748 ) ) ( TRUCK-AT ?auto_13744 ?auto_13747 ) ( SURFACE-AT ?auto_13753 ?auto_13747 ) ( CLEAR ?auto_13753 ) ( LIFTING ?auto_13750 ?auto_13749 ) ( IS-CRATE ?auto_13749 ) ( not ( = ?auto_13741 ?auto_13753 ) ) ( not ( = ?auto_13742 ?auto_13753 ) ) ( not ( = ?auto_13743 ?auto_13753 ) ) ( not ( = ?auto_13749 ?auto_13753 ) ) ( not ( = ?auto_13748 ?auto_13753 ) ) )
    :subtasks
    ( ( !DROP ?auto_13750 ?auto_13749 ?auto_13753 ?auto_13747 )
      ( MAKE-ON ?auto_13741 ?auto_13742 )
      ( MAKE-ON-VERIFY ?auto_13741 ?auto_13742 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13754 - SURFACE
      ?auto_13755 - SURFACE
    )
    :vars
    (
      ?auto_13766 - HOIST
      ?auto_13763 - PLACE
      ?auto_13761 - PLACE
      ?auto_13765 - HOIST
      ?auto_13756 - SURFACE
      ?auto_13760 - SURFACE
      ?auto_13764 - PLACE
      ?auto_13757 - HOIST
      ?auto_13758 - SURFACE
      ?auto_13759 - TRUCK
      ?auto_13762 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13766 ?auto_13763 ) ( IS-CRATE ?auto_13754 ) ( not ( = ?auto_13754 ?auto_13755 ) ) ( not ( = ?auto_13761 ?auto_13763 ) ) ( HOIST-AT ?auto_13765 ?auto_13761 ) ( not ( = ?auto_13766 ?auto_13765 ) ) ( AVAILABLE ?auto_13765 ) ( SURFACE-AT ?auto_13754 ?auto_13761 ) ( ON ?auto_13754 ?auto_13756 ) ( CLEAR ?auto_13754 ) ( not ( = ?auto_13754 ?auto_13756 ) ) ( not ( = ?auto_13755 ?auto_13756 ) ) ( IS-CRATE ?auto_13755 ) ( not ( = ?auto_13754 ?auto_13760 ) ) ( not ( = ?auto_13755 ?auto_13760 ) ) ( not ( = ?auto_13756 ?auto_13760 ) ) ( not ( = ?auto_13764 ?auto_13763 ) ) ( not ( = ?auto_13761 ?auto_13764 ) ) ( HOIST-AT ?auto_13757 ?auto_13764 ) ( not ( = ?auto_13766 ?auto_13757 ) ) ( not ( = ?auto_13765 ?auto_13757 ) ) ( AVAILABLE ?auto_13757 ) ( SURFACE-AT ?auto_13755 ?auto_13764 ) ( ON ?auto_13755 ?auto_13758 ) ( CLEAR ?auto_13755 ) ( not ( = ?auto_13754 ?auto_13758 ) ) ( not ( = ?auto_13755 ?auto_13758 ) ) ( not ( = ?auto_13756 ?auto_13758 ) ) ( not ( = ?auto_13760 ?auto_13758 ) ) ( TRUCK-AT ?auto_13759 ?auto_13763 ) ( SURFACE-AT ?auto_13762 ?auto_13763 ) ( CLEAR ?auto_13762 ) ( IS-CRATE ?auto_13760 ) ( not ( = ?auto_13754 ?auto_13762 ) ) ( not ( = ?auto_13755 ?auto_13762 ) ) ( not ( = ?auto_13756 ?auto_13762 ) ) ( not ( = ?auto_13760 ?auto_13762 ) ) ( not ( = ?auto_13758 ?auto_13762 ) ) ( AVAILABLE ?auto_13766 ) ( IN ?auto_13760 ?auto_13759 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13766 ?auto_13760 ?auto_13759 ?auto_13763 )
      ( MAKE-ON ?auto_13754 ?auto_13755 )
      ( MAKE-ON-VERIFY ?auto_13754 ?auto_13755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13767 - SURFACE
      ?auto_13768 - SURFACE
    )
    :vars
    (
      ?auto_13770 - HOIST
      ?auto_13773 - PLACE
      ?auto_13769 - PLACE
      ?auto_13774 - HOIST
      ?auto_13771 - SURFACE
      ?auto_13778 - SURFACE
      ?auto_13772 - PLACE
      ?auto_13779 - HOIST
      ?auto_13775 - SURFACE
      ?auto_13777 - SURFACE
      ?auto_13776 - TRUCK
      ?auto_13780 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13770 ?auto_13773 ) ( IS-CRATE ?auto_13767 ) ( not ( = ?auto_13767 ?auto_13768 ) ) ( not ( = ?auto_13769 ?auto_13773 ) ) ( HOIST-AT ?auto_13774 ?auto_13769 ) ( not ( = ?auto_13770 ?auto_13774 ) ) ( AVAILABLE ?auto_13774 ) ( SURFACE-AT ?auto_13767 ?auto_13769 ) ( ON ?auto_13767 ?auto_13771 ) ( CLEAR ?auto_13767 ) ( not ( = ?auto_13767 ?auto_13771 ) ) ( not ( = ?auto_13768 ?auto_13771 ) ) ( IS-CRATE ?auto_13768 ) ( not ( = ?auto_13767 ?auto_13778 ) ) ( not ( = ?auto_13768 ?auto_13778 ) ) ( not ( = ?auto_13771 ?auto_13778 ) ) ( not ( = ?auto_13772 ?auto_13773 ) ) ( not ( = ?auto_13769 ?auto_13772 ) ) ( HOIST-AT ?auto_13779 ?auto_13772 ) ( not ( = ?auto_13770 ?auto_13779 ) ) ( not ( = ?auto_13774 ?auto_13779 ) ) ( AVAILABLE ?auto_13779 ) ( SURFACE-AT ?auto_13768 ?auto_13772 ) ( ON ?auto_13768 ?auto_13775 ) ( CLEAR ?auto_13768 ) ( not ( = ?auto_13767 ?auto_13775 ) ) ( not ( = ?auto_13768 ?auto_13775 ) ) ( not ( = ?auto_13771 ?auto_13775 ) ) ( not ( = ?auto_13778 ?auto_13775 ) ) ( SURFACE-AT ?auto_13777 ?auto_13773 ) ( CLEAR ?auto_13777 ) ( IS-CRATE ?auto_13778 ) ( not ( = ?auto_13767 ?auto_13777 ) ) ( not ( = ?auto_13768 ?auto_13777 ) ) ( not ( = ?auto_13771 ?auto_13777 ) ) ( not ( = ?auto_13778 ?auto_13777 ) ) ( not ( = ?auto_13775 ?auto_13777 ) ) ( AVAILABLE ?auto_13770 ) ( IN ?auto_13778 ?auto_13776 ) ( TRUCK-AT ?auto_13776 ?auto_13780 ) ( not ( = ?auto_13780 ?auto_13773 ) ) ( not ( = ?auto_13769 ?auto_13780 ) ) ( not ( = ?auto_13772 ?auto_13780 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13776 ?auto_13780 ?auto_13773 )
      ( MAKE-ON ?auto_13767 ?auto_13768 )
      ( MAKE-ON-VERIFY ?auto_13767 ?auto_13768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13781 - SURFACE
      ?auto_13782 - SURFACE
    )
    :vars
    (
      ?auto_13789 - HOIST
      ?auto_13787 - PLACE
      ?auto_13794 - PLACE
      ?auto_13793 - HOIST
      ?auto_13785 - SURFACE
      ?auto_13788 - SURFACE
      ?auto_13791 - PLACE
      ?auto_13783 - HOIST
      ?auto_13786 - SURFACE
      ?auto_13792 - SURFACE
      ?auto_13784 - TRUCK
      ?auto_13790 - PLACE
      ?auto_13795 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13789 ?auto_13787 ) ( IS-CRATE ?auto_13781 ) ( not ( = ?auto_13781 ?auto_13782 ) ) ( not ( = ?auto_13794 ?auto_13787 ) ) ( HOIST-AT ?auto_13793 ?auto_13794 ) ( not ( = ?auto_13789 ?auto_13793 ) ) ( AVAILABLE ?auto_13793 ) ( SURFACE-AT ?auto_13781 ?auto_13794 ) ( ON ?auto_13781 ?auto_13785 ) ( CLEAR ?auto_13781 ) ( not ( = ?auto_13781 ?auto_13785 ) ) ( not ( = ?auto_13782 ?auto_13785 ) ) ( IS-CRATE ?auto_13782 ) ( not ( = ?auto_13781 ?auto_13788 ) ) ( not ( = ?auto_13782 ?auto_13788 ) ) ( not ( = ?auto_13785 ?auto_13788 ) ) ( not ( = ?auto_13791 ?auto_13787 ) ) ( not ( = ?auto_13794 ?auto_13791 ) ) ( HOIST-AT ?auto_13783 ?auto_13791 ) ( not ( = ?auto_13789 ?auto_13783 ) ) ( not ( = ?auto_13793 ?auto_13783 ) ) ( AVAILABLE ?auto_13783 ) ( SURFACE-AT ?auto_13782 ?auto_13791 ) ( ON ?auto_13782 ?auto_13786 ) ( CLEAR ?auto_13782 ) ( not ( = ?auto_13781 ?auto_13786 ) ) ( not ( = ?auto_13782 ?auto_13786 ) ) ( not ( = ?auto_13785 ?auto_13786 ) ) ( not ( = ?auto_13788 ?auto_13786 ) ) ( SURFACE-AT ?auto_13792 ?auto_13787 ) ( CLEAR ?auto_13792 ) ( IS-CRATE ?auto_13788 ) ( not ( = ?auto_13781 ?auto_13792 ) ) ( not ( = ?auto_13782 ?auto_13792 ) ) ( not ( = ?auto_13785 ?auto_13792 ) ) ( not ( = ?auto_13788 ?auto_13792 ) ) ( not ( = ?auto_13786 ?auto_13792 ) ) ( AVAILABLE ?auto_13789 ) ( TRUCK-AT ?auto_13784 ?auto_13790 ) ( not ( = ?auto_13790 ?auto_13787 ) ) ( not ( = ?auto_13794 ?auto_13790 ) ) ( not ( = ?auto_13791 ?auto_13790 ) ) ( HOIST-AT ?auto_13795 ?auto_13790 ) ( LIFTING ?auto_13795 ?auto_13788 ) ( not ( = ?auto_13789 ?auto_13795 ) ) ( not ( = ?auto_13793 ?auto_13795 ) ) ( not ( = ?auto_13783 ?auto_13795 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13795 ?auto_13788 ?auto_13784 ?auto_13790 )
      ( MAKE-ON ?auto_13781 ?auto_13782 )
      ( MAKE-ON-VERIFY ?auto_13781 ?auto_13782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13796 - SURFACE
      ?auto_13797 - SURFACE
    )
    :vars
    (
      ?auto_13804 - HOIST
      ?auto_13807 - PLACE
      ?auto_13808 - PLACE
      ?auto_13800 - HOIST
      ?auto_13801 - SURFACE
      ?auto_13802 - SURFACE
      ?auto_13803 - PLACE
      ?auto_13809 - HOIST
      ?auto_13805 - SURFACE
      ?auto_13798 - SURFACE
      ?auto_13806 - TRUCK
      ?auto_13810 - PLACE
      ?auto_13799 - HOIST
      ?auto_13811 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13804 ?auto_13807 ) ( IS-CRATE ?auto_13796 ) ( not ( = ?auto_13796 ?auto_13797 ) ) ( not ( = ?auto_13808 ?auto_13807 ) ) ( HOIST-AT ?auto_13800 ?auto_13808 ) ( not ( = ?auto_13804 ?auto_13800 ) ) ( AVAILABLE ?auto_13800 ) ( SURFACE-AT ?auto_13796 ?auto_13808 ) ( ON ?auto_13796 ?auto_13801 ) ( CLEAR ?auto_13796 ) ( not ( = ?auto_13796 ?auto_13801 ) ) ( not ( = ?auto_13797 ?auto_13801 ) ) ( IS-CRATE ?auto_13797 ) ( not ( = ?auto_13796 ?auto_13802 ) ) ( not ( = ?auto_13797 ?auto_13802 ) ) ( not ( = ?auto_13801 ?auto_13802 ) ) ( not ( = ?auto_13803 ?auto_13807 ) ) ( not ( = ?auto_13808 ?auto_13803 ) ) ( HOIST-AT ?auto_13809 ?auto_13803 ) ( not ( = ?auto_13804 ?auto_13809 ) ) ( not ( = ?auto_13800 ?auto_13809 ) ) ( AVAILABLE ?auto_13809 ) ( SURFACE-AT ?auto_13797 ?auto_13803 ) ( ON ?auto_13797 ?auto_13805 ) ( CLEAR ?auto_13797 ) ( not ( = ?auto_13796 ?auto_13805 ) ) ( not ( = ?auto_13797 ?auto_13805 ) ) ( not ( = ?auto_13801 ?auto_13805 ) ) ( not ( = ?auto_13802 ?auto_13805 ) ) ( SURFACE-AT ?auto_13798 ?auto_13807 ) ( CLEAR ?auto_13798 ) ( IS-CRATE ?auto_13802 ) ( not ( = ?auto_13796 ?auto_13798 ) ) ( not ( = ?auto_13797 ?auto_13798 ) ) ( not ( = ?auto_13801 ?auto_13798 ) ) ( not ( = ?auto_13802 ?auto_13798 ) ) ( not ( = ?auto_13805 ?auto_13798 ) ) ( AVAILABLE ?auto_13804 ) ( TRUCK-AT ?auto_13806 ?auto_13810 ) ( not ( = ?auto_13810 ?auto_13807 ) ) ( not ( = ?auto_13808 ?auto_13810 ) ) ( not ( = ?auto_13803 ?auto_13810 ) ) ( HOIST-AT ?auto_13799 ?auto_13810 ) ( not ( = ?auto_13804 ?auto_13799 ) ) ( not ( = ?auto_13800 ?auto_13799 ) ) ( not ( = ?auto_13809 ?auto_13799 ) ) ( AVAILABLE ?auto_13799 ) ( SURFACE-AT ?auto_13802 ?auto_13810 ) ( ON ?auto_13802 ?auto_13811 ) ( CLEAR ?auto_13802 ) ( not ( = ?auto_13796 ?auto_13811 ) ) ( not ( = ?auto_13797 ?auto_13811 ) ) ( not ( = ?auto_13801 ?auto_13811 ) ) ( not ( = ?auto_13802 ?auto_13811 ) ) ( not ( = ?auto_13805 ?auto_13811 ) ) ( not ( = ?auto_13798 ?auto_13811 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13799 ?auto_13802 ?auto_13811 ?auto_13810 )
      ( MAKE-ON ?auto_13796 ?auto_13797 )
      ( MAKE-ON-VERIFY ?auto_13796 ?auto_13797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13812 - SURFACE
      ?auto_13813 - SURFACE
    )
    :vars
    (
      ?auto_13820 - HOIST
      ?auto_13822 - PLACE
      ?auto_13818 - PLACE
      ?auto_13823 - HOIST
      ?auto_13821 - SURFACE
      ?auto_13817 - SURFACE
      ?auto_13826 - PLACE
      ?auto_13827 - HOIST
      ?auto_13825 - SURFACE
      ?auto_13816 - SURFACE
      ?auto_13819 - PLACE
      ?auto_13824 - HOIST
      ?auto_13815 - SURFACE
      ?auto_13814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13820 ?auto_13822 ) ( IS-CRATE ?auto_13812 ) ( not ( = ?auto_13812 ?auto_13813 ) ) ( not ( = ?auto_13818 ?auto_13822 ) ) ( HOIST-AT ?auto_13823 ?auto_13818 ) ( not ( = ?auto_13820 ?auto_13823 ) ) ( AVAILABLE ?auto_13823 ) ( SURFACE-AT ?auto_13812 ?auto_13818 ) ( ON ?auto_13812 ?auto_13821 ) ( CLEAR ?auto_13812 ) ( not ( = ?auto_13812 ?auto_13821 ) ) ( not ( = ?auto_13813 ?auto_13821 ) ) ( IS-CRATE ?auto_13813 ) ( not ( = ?auto_13812 ?auto_13817 ) ) ( not ( = ?auto_13813 ?auto_13817 ) ) ( not ( = ?auto_13821 ?auto_13817 ) ) ( not ( = ?auto_13826 ?auto_13822 ) ) ( not ( = ?auto_13818 ?auto_13826 ) ) ( HOIST-AT ?auto_13827 ?auto_13826 ) ( not ( = ?auto_13820 ?auto_13827 ) ) ( not ( = ?auto_13823 ?auto_13827 ) ) ( AVAILABLE ?auto_13827 ) ( SURFACE-AT ?auto_13813 ?auto_13826 ) ( ON ?auto_13813 ?auto_13825 ) ( CLEAR ?auto_13813 ) ( not ( = ?auto_13812 ?auto_13825 ) ) ( not ( = ?auto_13813 ?auto_13825 ) ) ( not ( = ?auto_13821 ?auto_13825 ) ) ( not ( = ?auto_13817 ?auto_13825 ) ) ( SURFACE-AT ?auto_13816 ?auto_13822 ) ( CLEAR ?auto_13816 ) ( IS-CRATE ?auto_13817 ) ( not ( = ?auto_13812 ?auto_13816 ) ) ( not ( = ?auto_13813 ?auto_13816 ) ) ( not ( = ?auto_13821 ?auto_13816 ) ) ( not ( = ?auto_13817 ?auto_13816 ) ) ( not ( = ?auto_13825 ?auto_13816 ) ) ( AVAILABLE ?auto_13820 ) ( not ( = ?auto_13819 ?auto_13822 ) ) ( not ( = ?auto_13818 ?auto_13819 ) ) ( not ( = ?auto_13826 ?auto_13819 ) ) ( HOIST-AT ?auto_13824 ?auto_13819 ) ( not ( = ?auto_13820 ?auto_13824 ) ) ( not ( = ?auto_13823 ?auto_13824 ) ) ( not ( = ?auto_13827 ?auto_13824 ) ) ( AVAILABLE ?auto_13824 ) ( SURFACE-AT ?auto_13817 ?auto_13819 ) ( ON ?auto_13817 ?auto_13815 ) ( CLEAR ?auto_13817 ) ( not ( = ?auto_13812 ?auto_13815 ) ) ( not ( = ?auto_13813 ?auto_13815 ) ) ( not ( = ?auto_13821 ?auto_13815 ) ) ( not ( = ?auto_13817 ?auto_13815 ) ) ( not ( = ?auto_13825 ?auto_13815 ) ) ( not ( = ?auto_13816 ?auto_13815 ) ) ( TRUCK-AT ?auto_13814 ?auto_13822 ) )
    :subtasks
    ( ( !DRIVE ?auto_13814 ?auto_13822 ?auto_13819 )
      ( MAKE-ON ?auto_13812 ?auto_13813 )
      ( MAKE-ON-VERIFY ?auto_13812 ?auto_13813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13830 - SURFACE
      ?auto_13831 - SURFACE
    )
    :vars
    (
      ?auto_13832 - HOIST
      ?auto_13833 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13832 ?auto_13833 ) ( SURFACE-AT ?auto_13831 ?auto_13833 ) ( CLEAR ?auto_13831 ) ( LIFTING ?auto_13832 ?auto_13830 ) ( IS-CRATE ?auto_13830 ) ( not ( = ?auto_13830 ?auto_13831 ) ) )
    :subtasks
    ( ( !DROP ?auto_13832 ?auto_13830 ?auto_13831 ?auto_13833 )
      ( MAKE-ON-VERIFY ?auto_13830 ?auto_13831 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13834 - SURFACE
      ?auto_13835 - SURFACE
    )
    :vars
    (
      ?auto_13836 - HOIST
      ?auto_13837 - PLACE
      ?auto_13838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13836 ?auto_13837 ) ( SURFACE-AT ?auto_13835 ?auto_13837 ) ( CLEAR ?auto_13835 ) ( IS-CRATE ?auto_13834 ) ( not ( = ?auto_13834 ?auto_13835 ) ) ( TRUCK-AT ?auto_13838 ?auto_13837 ) ( AVAILABLE ?auto_13836 ) ( IN ?auto_13834 ?auto_13838 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13836 ?auto_13834 ?auto_13838 ?auto_13837 )
      ( MAKE-ON ?auto_13834 ?auto_13835 )
      ( MAKE-ON-VERIFY ?auto_13834 ?auto_13835 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13839 - SURFACE
      ?auto_13840 - SURFACE
    )
    :vars
    (
      ?auto_13841 - HOIST
      ?auto_13843 - PLACE
      ?auto_13842 - TRUCK
      ?auto_13844 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13841 ?auto_13843 ) ( SURFACE-AT ?auto_13840 ?auto_13843 ) ( CLEAR ?auto_13840 ) ( IS-CRATE ?auto_13839 ) ( not ( = ?auto_13839 ?auto_13840 ) ) ( AVAILABLE ?auto_13841 ) ( IN ?auto_13839 ?auto_13842 ) ( TRUCK-AT ?auto_13842 ?auto_13844 ) ( not ( = ?auto_13844 ?auto_13843 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13842 ?auto_13844 ?auto_13843 )
      ( MAKE-ON ?auto_13839 ?auto_13840 )
      ( MAKE-ON-VERIFY ?auto_13839 ?auto_13840 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13845 - SURFACE
      ?auto_13846 - SURFACE
    )
    :vars
    (
      ?auto_13847 - HOIST
      ?auto_13849 - PLACE
      ?auto_13850 - TRUCK
      ?auto_13848 - PLACE
      ?auto_13851 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13847 ?auto_13849 ) ( SURFACE-AT ?auto_13846 ?auto_13849 ) ( CLEAR ?auto_13846 ) ( IS-CRATE ?auto_13845 ) ( not ( = ?auto_13845 ?auto_13846 ) ) ( AVAILABLE ?auto_13847 ) ( TRUCK-AT ?auto_13850 ?auto_13848 ) ( not ( = ?auto_13848 ?auto_13849 ) ) ( HOIST-AT ?auto_13851 ?auto_13848 ) ( LIFTING ?auto_13851 ?auto_13845 ) ( not ( = ?auto_13847 ?auto_13851 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13851 ?auto_13845 ?auto_13850 ?auto_13848 )
      ( MAKE-ON ?auto_13845 ?auto_13846 )
      ( MAKE-ON-VERIFY ?auto_13845 ?auto_13846 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13852 - SURFACE
      ?auto_13853 - SURFACE
    )
    :vars
    (
      ?auto_13856 - HOIST
      ?auto_13857 - PLACE
      ?auto_13854 - TRUCK
      ?auto_13855 - PLACE
      ?auto_13858 - HOIST
      ?auto_13859 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13856 ?auto_13857 ) ( SURFACE-AT ?auto_13853 ?auto_13857 ) ( CLEAR ?auto_13853 ) ( IS-CRATE ?auto_13852 ) ( not ( = ?auto_13852 ?auto_13853 ) ) ( AVAILABLE ?auto_13856 ) ( TRUCK-AT ?auto_13854 ?auto_13855 ) ( not ( = ?auto_13855 ?auto_13857 ) ) ( HOIST-AT ?auto_13858 ?auto_13855 ) ( not ( = ?auto_13856 ?auto_13858 ) ) ( AVAILABLE ?auto_13858 ) ( SURFACE-AT ?auto_13852 ?auto_13855 ) ( ON ?auto_13852 ?auto_13859 ) ( CLEAR ?auto_13852 ) ( not ( = ?auto_13852 ?auto_13859 ) ) ( not ( = ?auto_13853 ?auto_13859 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13858 ?auto_13852 ?auto_13859 ?auto_13855 )
      ( MAKE-ON ?auto_13852 ?auto_13853 )
      ( MAKE-ON-VERIFY ?auto_13852 ?auto_13853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13860 - SURFACE
      ?auto_13861 - SURFACE
    )
    :vars
    (
      ?auto_13867 - HOIST
      ?auto_13865 - PLACE
      ?auto_13866 - PLACE
      ?auto_13863 - HOIST
      ?auto_13862 - SURFACE
      ?auto_13864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13867 ?auto_13865 ) ( SURFACE-AT ?auto_13861 ?auto_13865 ) ( CLEAR ?auto_13861 ) ( IS-CRATE ?auto_13860 ) ( not ( = ?auto_13860 ?auto_13861 ) ) ( AVAILABLE ?auto_13867 ) ( not ( = ?auto_13866 ?auto_13865 ) ) ( HOIST-AT ?auto_13863 ?auto_13866 ) ( not ( = ?auto_13867 ?auto_13863 ) ) ( AVAILABLE ?auto_13863 ) ( SURFACE-AT ?auto_13860 ?auto_13866 ) ( ON ?auto_13860 ?auto_13862 ) ( CLEAR ?auto_13860 ) ( not ( = ?auto_13860 ?auto_13862 ) ) ( not ( = ?auto_13861 ?auto_13862 ) ) ( TRUCK-AT ?auto_13864 ?auto_13865 ) )
    :subtasks
    ( ( !DRIVE ?auto_13864 ?auto_13865 ?auto_13866 )
      ( MAKE-ON ?auto_13860 ?auto_13861 )
      ( MAKE-ON-VERIFY ?auto_13860 ?auto_13861 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13868 - SURFACE
      ?auto_13869 - SURFACE
    )
    :vars
    (
      ?auto_13872 - HOIST
      ?auto_13873 - PLACE
      ?auto_13870 - PLACE
      ?auto_13874 - HOIST
      ?auto_13875 - SURFACE
      ?auto_13871 - TRUCK
      ?auto_13876 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13872 ?auto_13873 ) ( IS-CRATE ?auto_13868 ) ( not ( = ?auto_13868 ?auto_13869 ) ) ( not ( = ?auto_13870 ?auto_13873 ) ) ( HOIST-AT ?auto_13874 ?auto_13870 ) ( not ( = ?auto_13872 ?auto_13874 ) ) ( AVAILABLE ?auto_13874 ) ( SURFACE-AT ?auto_13868 ?auto_13870 ) ( ON ?auto_13868 ?auto_13875 ) ( CLEAR ?auto_13868 ) ( not ( = ?auto_13868 ?auto_13875 ) ) ( not ( = ?auto_13869 ?auto_13875 ) ) ( TRUCK-AT ?auto_13871 ?auto_13873 ) ( SURFACE-AT ?auto_13876 ?auto_13873 ) ( CLEAR ?auto_13876 ) ( LIFTING ?auto_13872 ?auto_13869 ) ( IS-CRATE ?auto_13869 ) ( not ( = ?auto_13868 ?auto_13876 ) ) ( not ( = ?auto_13869 ?auto_13876 ) ) ( not ( = ?auto_13875 ?auto_13876 ) ) )
    :subtasks
    ( ( !DROP ?auto_13872 ?auto_13869 ?auto_13876 ?auto_13873 )
      ( MAKE-ON ?auto_13868 ?auto_13869 )
      ( MAKE-ON-VERIFY ?auto_13868 ?auto_13869 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13877 - SURFACE
      ?auto_13878 - SURFACE
    )
    :vars
    (
      ?auto_13883 - HOIST
      ?auto_13884 - PLACE
      ?auto_13885 - PLACE
      ?auto_13882 - HOIST
      ?auto_13879 - SURFACE
      ?auto_13881 - TRUCK
      ?auto_13880 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13883 ?auto_13884 ) ( IS-CRATE ?auto_13877 ) ( not ( = ?auto_13877 ?auto_13878 ) ) ( not ( = ?auto_13885 ?auto_13884 ) ) ( HOIST-AT ?auto_13882 ?auto_13885 ) ( not ( = ?auto_13883 ?auto_13882 ) ) ( AVAILABLE ?auto_13882 ) ( SURFACE-AT ?auto_13877 ?auto_13885 ) ( ON ?auto_13877 ?auto_13879 ) ( CLEAR ?auto_13877 ) ( not ( = ?auto_13877 ?auto_13879 ) ) ( not ( = ?auto_13878 ?auto_13879 ) ) ( TRUCK-AT ?auto_13881 ?auto_13884 ) ( SURFACE-AT ?auto_13880 ?auto_13884 ) ( CLEAR ?auto_13880 ) ( IS-CRATE ?auto_13878 ) ( not ( = ?auto_13877 ?auto_13880 ) ) ( not ( = ?auto_13878 ?auto_13880 ) ) ( not ( = ?auto_13879 ?auto_13880 ) ) ( AVAILABLE ?auto_13883 ) ( IN ?auto_13878 ?auto_13881 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13883 ?auto_13878 ?auto_13881 ?auto_13884 )
      ( MAKE-ON ?auto_13877 ?auto_13878 )
      ( MAKE-ON-VERIFY ?auto_13877 ?auto_13878 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13886 - SURFACE
      ?auto_13887 - SURFACE
    )
    :vars
    (
      ?auto_13889 - HOIST
      ?auto_13890 - PLACE
      ?auto_13891 - PLACE
      ?auto_13894 - HOIST
      ?auto_13893 - SURFACE
      ?auto_13888 - SURFACE
      ?auto_13892 - TRUCK
      ?auto_13895 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13889 ?auto_13890 ) ( IS-CRATE ?auto_13886 ) ( not ( = ?auto_13886 ?auto_13887 ) ) ( not ( = ?auto_13891 ?auto_13890 ) ) ( HOIST-AT ?auto_13894 ?auto_13891 ) ( not ( = ?auto_13889 ?auto_13894 ) ) ( AVAILABLE ?auto_13894 ) ( SURFACE-AT ?auto_13886 ?auto_13891 ) ( ON ?auto_13886 ?auto_13893 ) ( CLEAR ?auto_13886 ) ( not ( = ?auto_13886 ?auto_13893 ) ) ( not ( = ?auto_13887 ?auto_13893 ) ) ( SURFACE-AT ?auto_13888 ?auto_13890 ) ( CLEAR ?auto_13888 ) ( IS-CRATE ?auto_13887 ) ( not ( = ?auto_13886 ?auto_13888 ) ) ( not ( = ?auto_13887 ?auto_13888 ) ) ( not ( = ?auto_13893 ?auto_13888 ) ) ( AVAILABLE ?auto_13889 ) ( IN ?auto_13887 ?auto_13892 ) ( TRUCK-AT ?auto_13892 ?auto_13895 ) ( not ( = ?auto_13895 ?auto_13890 ) ) ( not ( = ?auto_13891 ?auto_13895 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13892 ?auto_13895 ?auto_13890 )
      ( MAKE-ON ?auto_13886 ?auto_13887 )
      ( MAKE-ON-VERIFY ?auto_13886 ?auto_13887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13896 - SURFACE
      ?auto_13897 - SURFACE
    )
    :vars
    (
      ?auto_13905 - HOIST
      ?auto_13902 - PLACE
      ?auto_13900 - PLACE
      ?auto_13904 - HOIST
      ?auto_13901 - SURFACE
      ?auto_13898 - SURFACE
      ?auto_13903 - TRUCK
      ?auto_13899 - PLACE
      ?auto_13906 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13905 ?auto_13902 ) ( IS-CRATE ?auto_13896 ) ( not ( = ?auto_13896 ?auto_13897 ) ) ( not ( = ?auto_13900 ?auto_13902 ) ) ( HOIST-AT ?auto_13904 ?auto_13900 ) ( not ( = ?auto_13905 ?auto_13904 ) ) ( AVAILABLE ?auto_13904 ) ( SURFACE-AT ?auto_13896 ?auto_13900 ) ( ON ?auto_13896 ?auto_13901 ) ( CLEAR ?auto_13896 ) ( not ( = ?auto_13896 ?auto_13901 ) ) ( not ( = ?auto_13897 ?auto_13901 ) ) ( SURFACE-AT ?auto_13898 ?auto_13902 ) ( CLEAR ?auto_13898 ) ( IS-CRATE ?auto_13897 ) ( not ( = ?auto_13896 ?auto_13898 ) ) ( not ( = ?auto_13897 ?auto_13898 ) ) ( not ( = ?auto_13901 ?auto_13898 ) ) ( AVAILABLE ?auto_13905 ) ( TRUCK-AT ?auto_13903 ?auto_13899 ) ( not ( = ?auto_13899 ?auto_13902 ) ) ( not ( = ?auto_13900 ?auto_13899 ) ) ( HOIST-AT ?auto_13906 ?auto_13899 ) ( LIFTING ?auto_13906 ?auto_13897 ) ( not ( = ?auto_13905 ?auto_13906 ) ) ( not ( = ?auto_13904 ?auto_13906 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13906 ?auto_13897 ?auto_13903 ?auto_13899 )
      ( MAKE-ON ?auto_13896 ?auto_13897 )
      ( MAKE-ON-VERIFY ?auto_13896 ?auto_13897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13907 - SURFACE
      ?auto_13908 - SURFACE
    )
    :vars
    (
      ?auto_13917 - HOIST
      ?auto_13914 - PLACE
      ?auto_13912 - PLACE
      ?auto_13910 - HOIST
      ?auto_13915 - SURFACE
      ?auto_13909 - SURFACE
      ?auto_13916 - TRUCK
      ?auto_13913 - PLACE
      ?auto_13911 - HOIST
      ?auto_13918 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13917 ?auto_13914 ) ( IS-CRATE ?auto_13907 ) ( not ( = ?auto_13907 ?auto_13908 ) ) ( not ( = ?auto_13912 ?auto_13914 ) ) ( HOIST-AT ?auto_13910 ?auto_13912 ) ( not ( = ?auto_13917 ?auto_13910 ) ) ( AVAILABLE ?auto_13910 ) ( SURFACE-AT ?auto_13907 ?auto_13912 ) ( ON ?auto_13907 ?auto_13915 ) ( CLEAR ?auto_13907 ) ( not ( = ?auto_13907 ?auto_13915 ) ) ( not ( = ?auto_13908 ?auto_13915 ) ) ( SURFACE-AT ?auto_13909 ?auto_13914 ) ( CLEAR ?auto_13909 ) ( IS-CRATE ?auto_13908 ) ( not ( = ?auto_13907 ?auto_13909 ) ) ( not ( = ?auto_13908 ?auto_13909 ) ) ( not ( = ?auto_13915 ?auto_13909 ) ) ( AVAILABLE ?auto_13917 ) ( TRUCK-AT ?auto_13916 ?auto_13913 ) ( not ( = ?auto_13913 ?auto_13914 ) ) ( not ( = ?auto_13912 ?auto_13913 ) ) ( HOIST-AT ?auto_13911 ?auto_13913 ) ( not ( = ?auto_13917 ?auto_13911 ) ) ( not ( = ?auto_13910 ?auto_13911 ) ) ( AVAILABLE ?auto_13911 ) ( SURFACE-AT ?auto_13908 ?auto_13913 ) ( ON ?auto_13908 ?auto_13918 ) ( CLEAR ?auto_13908 ) ( not ( = ?auto_13907 ?auto_13918 ) ) ( not ( = ?auto_13908 ?auto_13918 ) ) ( not ( = ?auto_13915 ?auto_13918 ) ) ( not ( = ?auto_13909 ?auto_13918 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13911 ?auto_13908 ?auto_13918 ?auto_13913 )
      ( MAKE-ON ?auto_13907 ?auto_13908 )
      ( MAKE-ON-VERIFY ?auto_13907 ?auto_13908 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13919 - SURFACE
      ?auto_13920 - SURFACE
    )
    :vars
    (
      ?auto_13929 - HOIST
      ?auto_13924 - PLACE
      ?auto_13930 - PLACE
      ?auto_13926 - HOIST
      ?auto_13928 - SURFACE
      ?auto_13921 - SURFACE
      ?auto_13923 - PLACE
      ?auto_13927 - HOIST
      ?auto_13922 - SURFACE
      ?auto_13925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13929 ?auto_13924 ) ( IS-CRATE ?auto_13919 ) ( not ( = ?auto_13919 ?auto_13920 ) ) ( not ( = ?auto_13930 ?auto_13924 ) ) ( HOIST-AT ?auto_13926 ?auto_13930 ) ( not ( = ?auto_13929 ?auto_13926 ) ) ( AVAILABLE ?auto_13926 ) ( SURFACE-AT ?auto_13919 ?auto_13930 ) ( ON ?auto_13919 ?auto_13928 ) ( CLEAR ?auto_13919 ) ( not ( = ?auto_13919 ?auto_13928 ) ) ( not ( = ?auto_13920 ?auto_13928 ) ) ( SURFACE-AT ?auto_13921 ?auto_13924 ) ( CLEAR ?auto_13921 ) ( IS-CRATE ?auto_13920 ) ( not ( = ?auto_13919 ?auto_13921 ) ) ( not ( = ?auto_13920 ?auto_13921 ) ) ( not ( = ?auto_13928 ?auto_13921 ) ) ( AVAILABLE ?auto_13929 ) ( not ( = ?auto_13923 ?auto_13924 ) ) ( not ( = ?auto_13930 ?auto_13923 ) ) ( HOIST-AT ?auto_13927 ?auto_13923 ) ( not ( = ?auto_13929 ?auto_13927 ) ) ( not ( = ?auto_13926 ?auto_13927 ) ) ( AVAILABLE ?auto_13927 ) ( SURFACE-AT ?auto_13920 ?auto_13923 ) ( ON ?auto_13920 ?auto_13922 ) ( CLEAR ?auto_13920 ) ( not ( = ?auto_13919 ?auto_13922 ) ) ( not ( = ?auto_13920 ?auto_13922 ) ) ( not ( = ?auto_13928 ?auto_13922 ) ) ( not ( = ?auto_13921 ?auto_13922 ) ) ( TRUCK-AT ?auto_13925 ?auto_13924 ) )
    :subtasks
    ( ( !DRIVE ?auto_13925 ?auto_13924 ?auto_13923 )
      ( MAKE-ON ?auto_13919 ?auto_13920 )
      ( MAKE-ON-VERIFY ?auto_13919 ?auto_13920 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13931 - SURFACE
      ?auto_13932 - SURFACE
    )
    :vars
    (
      ?auto_13938 - HOIST
      ?auto_13940 - PLACE
      ?auto_13941 - PLACE
      ?auto_13936 - HOIST
      ?auto_13937 - SURFACE
      ?auto_13934 - SURFACE
      ?auto_13933 - PLACE
      ?auto_13942 - HOIST
      ?auto_13935 - SURFACE
      ?auto_13939 - TRUCK
      ?auto_13943 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13938 ?auto_13940 ) ( IS-CRATE ?auto_13931 ) ( not ( = ?auto_13931 ?auto_13932 ) ) ( not ( = ?auto_13941 ?auto_13940 ) ) ( HOIST-AT ?auto_13936 ?auto_13941 ) ( not ( = ?auto_13938 ?auto_13936 ) ) ( AVAILABLE ?auto_13936 ) ( SURFACE-AT ?auto_13931 ?auto_13941 ) ( ON ?auto_13931 ?auto_13937 ) ( CLEAR ?auto_13931 ) ( not ( = ?auto_13931 ?auto_13937 ) ) ( not ( = ?auto_13932 ?auto_13937 ) ) ( IS-CRATE ?auto_13932 ) ( not ( = ?auto_13931 ?auto_13934 ) ) ( not ( = ?auto_13932 ?auto_13934 ) ) ( not ( = ?auto_13937 ?auto_13934 ) ) ( not ( = ?auto_13933 ?auto_13940 ) ) ( not ( = ?auto_13941 ?auto_13933 ) ) ( HOIST-AT ?auto_13942 ?auto_13933 ) ( not ( = ?auto_13938 ?auto_13942 ) ) ( not ( = ?auto_13936 ?auto_13942 ) ) ( AVAILABLE ?auto_13942 ) ( SURFACE-AT ?auto_13932 ?auto_13933 ) ( ON ?auto_13932 ?auto_13935 ) ( CLEAR ?auto_13932 ) ( not ( = ?auto_13931 ?auto_13935 ) ) ( not ( = ?auto_13932 ?auto_13935 ) ) ( not ( = ?auto_13937 ?auto_13935 ) ) ( not ( = ?auto_13934 ?auto_13935 ) ) ( TRUCK-AT ?auto_13939 ?auto_13940 ) ( SURFACE-AT ?auto_13943 ?auto_13940 ) ( CLEAR ?auto_13943 ) ( LIFTING ?auto_13938 ?auto_13934 ) ( IS-CRATE ?auto_13934 ) ( not ( = ?auto_13931 ?auto_13943 ) ) ( not ( = ?auto_13932 ?auto_13943 ) ) ( not ( = ?auto_13937 ?auto_13943 ) ) ( not ( = ?auto_13934 ?auto_13943 ) ) ( not ( = ?auto_13935 ?auto_13943 ) ) )
    :subtasks
    ( ( !DROP ?auto_13938 ?auto_13934 ?auto_13943 ?auto_13940 )
      ( MAKE-ON ?auto_13931 ?auto_13932 )
      ( MAKE-ON-VERIFY ?auto_13931 ?auto_13932 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13944 - SURFACE
      ?auto_13945 - SURFACE
    )
    :vars
    (
      ?auto_13946 - HOIST
      ?auto_13951 - PLACE
      ?auto_13956 - PLACE
      ?auto_13948 - HOIST
      ?auto_13949 - SURFACE
      ?auto_13947 - SURFACE
      ?auto_13954 - PLACE
      ?auto_13950 - HOIST
      ?auto_13952 - SURFACE
      ?auto_13953 - TRUCK
      ?auto_13955 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13946 ?auto_13951 ) ( IS-CRATE ?auto_13944 ) ( not ( = ?auto_13944 ?auto_13945 ) ) ( not ( = ?auto_13956 ?auto_13951 ) ) ( HOIST-AT ?auto_13948 ?auto_13956 ) ( not ( = ?auto_13946 ?auto_13948 ) ) ( AVAILABLE ?auto_13948 ) ( SURFACE-AT ?auto_13944 ?auto_13956 ) ( ON ?auto_13944 ?auto_13949 ) ( CLEAR ?auto_13944 ) ( not ( = ?auto_13944 ?auto_13949 ) ) ( not ( = ?auto_13945 ?auto_13949 ) ) ( IS-CRATE ?auto_13945 ) ( not ( = ?auto_13944 ?auto_13947 ) ) ( not ( = ?auto_13945 ?auto_13947 ) ) ( not ( = ?auto_13949 ?auto_13947 ) ) ( not ( = ?auto_13954 ?auto_13951 ) ) ( not ( = ?auto_13956 ?auto_13954 ) ) ( HOIST-AT ?auto_13950 ?auto_13954 ) ( not ( = ?auto_13946 ?auto_13950 ) ) ( not ( = ?auto_13948 ?auto_13950 ) ) ( AVAILABLE ?auto_13950 ) ( SURFACE-AT ?auto_13945 ?auto_13954 ) ( ON ?auto_13945 ?auto_13952 ) ( CLEAR ?auto_13945 ) ( not ( = ?auto_13944 ?auto_13952 ) ) ( not ( = ?auto_13945 ?auto_13952 ) ) ( not ( = ?auto_13949 ?auto_13952 ) ) ( not ( = ?auto_13947 ?auto_13952 ) ) ( TRUCK-AT ?auto_13953 ?auto_13951 ) ( SURFACE-AT ?auto_13955 ?auto_13951 ) ( CLEAR ?auto_13955 ) ( IS-CRATE ?auto_13947 ) ( not ( = ?auto_13944 ?auto_13955 ) ) ( not ( = ?auto_13945 ?auto_13955 ) ) ( not ( = ?auto_13949 ?auto_13955 ) ) ( not ( = ?auto_13947 ?auto_13955 ) ) ( not ( = ?auto_13952 ?auto_13955 ) ) ( AVAILABLE ?auto_13946 ) ( IN ?auto_13947 ?auto_13953 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13946 ?auto_13947 ?auto_13953 ?auto_13951 )
      ( MAKE-ON ?auto_13944 ?auto_13945 )
      ( MAKE-ON-VERIFY ?auto_13944 ?auto_13945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13957 - SURFACE
      ?auto_13958 - SURFACE
    )
    :vars
    (
      ?auto_13963 - HOIST
      ?auto_13964 - PLACE
      ?auto_13961 - PLACE
      ?auto_13959 - HOIST
      ?auto_13969 - SURFACE
      ?auto_13965 - SURFACE
      ?auto_13962 - PLACE
      ?auto_13960 - HOIST
      ?auto_13968 - SURFACE
      ?auto_13966 - SURFACE
      ?auto_13967 - TRUCK
      ?auto_13970 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13963 ?auto_13964 ) ( IS-CRATE ?auto_13957 ) ( not ( = ?auto_13957 ?auto_13958 ) ) ( not ( = ?auto_13961 ?auto_13964 ) ) ( HOIST-AT ?auto_13959 ?auto_13961 ) ( not ( = ?auto_13963 ?auto_13959 ) ) ( AVAILABLE ?auto_13959 ) ( SURFACE-AT ?auto_13957 ?auto_13961 ) ( ON ?auto_13957 ?auto_13969 ) ( CLEAR ?auto_13957 ) ( not ( = ?auto_13957 ?auto_13969 ) ) ( not ( = ?auto_13958 ?auto_13969 ) ) ( IS-CRATE ?auto_13958 ) ( not ( = ?auto_13957 ?auto_13965 ) ) ( not ( = ?auto_13958 ?auto_13965 ) ) ( not ( = ?auto_13969 ?auto_13965 ) ) ( not ( = ?auto_13962 ?auto_13964 ) ) ( not ( = ?auto_13961 ?auto_13962 ) ) ( HOIST-AT ?auto_13960 ?auto_13962 ) ( not ( = ?auto_13963 ?auto_13960 ) ) ( not ( = ?auto_13959 ?auto_13960 ) ) ( AVAILABLE ?auto_13960 ) ( SURFACE-AT ?auto_13958 ?auto_13962 ) ( ON ?auto_13958 ?auto_13968 ) ( CLEAR ?auto_13958 ) ( not ( = ?auto_13957 ?auto_13968 ) ) ( not ( = ?auto_13958 ?auto_13968 ) ) ( not ( = ?auto_13969 ?auto_13968 ) ) ( not ( = ?auto_13965 ?auto_13968 ) ) ( SURFACE-AT ?auto_13966 ?auto_13964 ) ( CLEAR ?auto_13966 ) ( IS-CRATE ?auto_13965 ) ( not ( = ?auto_13957 ?auto_13966 ) ) ( not ( = ?auto_13958 ?auto_13966 ) ) ( not ( = ?auto_13969 ?auto_13966 ) ) ( not ( = ?auto_13965 ?auto_13966 ) ) ( not ( = ?auto_13968 ?auto_13966 ) ) ( AVAILABLE ?auto_13963 ) ( IN ?auto_13965 ?auto_13967 ) ( TRUCK-AT ?auto_13967 ?auto_13970 ) ( not ( = ?auto_13970 ?auto_13964 ) ) ( not ( = ?auto_13961 ?auto_13970 ) ) ( not ( = ?auto_13962 ?auto_13970 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13967 ?auto_13970 ?auto_13964 )
      ( MAKE-ON ?auto_13957 ?auto_13958 )
      ( MAKE-ON-VERIFY ?auto_13957 ?auto_13958 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13971 - SURFACE
      ?auto_13972 - SURFACE
    )
    :vars
    (
      ?auto_13978 - HOIST
      ?auto_13973 - PLACE
      ?auto_13977 - PLACE
      ?auto_13981 - HOIST
      ?auto_13980 - SURFACE
      ?auto_13984 - SURFACE
      ?auto_13983 - PLACE
      ?auto_13974 - HOIST
      ?auto_13976 - SURFACE
      ?auto_13975 - SURFACE
      ?auto_13982 - TRUCK
      ?auto_13979 - PLACE
      ?auto_13985 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13978 ?auto_13973 ) ( IS-CRATE ?auto_13971 ) ( not ( = ?auto_13971 ?auto_13972 ) ) ( not ( = ?auto_13977 ?auto_13973 ) ) ( HOIST-AT ?auto_13981 ?auto_13977 ) ( not ( = ?auto_13978 ?auto_13981 ) ) ( AVAILABLE ?auto_13981 ) ( SURFACE-AT ?auto_13971 ?auto_13977 ) ( ON ?auto_13971 ?auto_13980 ) ( CLEAR ?auto_13971 ) ( not ( = ?auto_13971 ?auto_13980 ) ) ( not ( = ?auto_13972 ?auto_13980 ) ) ( IS-CRATE ?auto_13972 ) ( not ( = ?auto_13971 ?auto_13984 ) ) ( not ( = ?auto_13972 ?auto_13984 ) ) ( not ( = ?auto_13980 ?auto_13984 ) ) ( not ( = ?auto_13983 ?auto_13973 ) ) ( not ( = ?auto_13977 ?auto_13983 ) ) ( HOIST-AT ?auto_13974 ?auto_13983 ) ( not ( = ?auto_13978 ?auto_13974 ) ) ( not ( = ?auto_13981 ?auto_13974 ) ) ( AVAILABLE ?auto_13974 ) ( SURFACE-AT ?auto_13972 ?auto_13983 ) ( ON ?auto_13972 ?auto_13976 ) ( CLEAR ?auto_13972 ) ( not ( = ?auto_13971 ?auto_13976 ) ) ( not ( = ?auto_13972 ?auto_13976 ) ) ( not ( = ?auto_13980 ?auto_13976 ) ) ( not ( = ?auto_13984 ?auto_13976 ) ) ( SURFACE-AT ?auto_13975 ?auto_13973 ) ( CLEAR ?auto_13975 ) ( IS-CRATE ?auto_13984 ) ( not ( = ?auto_13971 ?auto_13975 ) ) ( not ( = ?auto_13972 ?auto_13975 ) ) ( not ( = ?auto_13980 ?auto_13975 ) ) ( not ( = ?auto_13984 ?auto_13975 ) ) ( not ( = ?auto_13976 ?auto_13975 ) ) ( AVAILABLE ?auto_13978 ) ( TRUCK-AT ?auto_13982 ?auto_13979 ) ( not ( = ?auto_13979 ?auto_13973 ) ) ( not ( = ?auto_13977 ?auto_13979 ) ) ( not ( = ?auto_13983 ?auto_13979 ) ) ( HOIST-AT ?auto_13985 ?auto_13979 ) ( LIFTING ?auto_13985 ?auto_13984 ) ( not ( = ?auto_13978 ?auto_13985 ) ) ( not ( = ?auto_13981 ?auto_13985 ) ) ( not ( = ?auto_13974 ?auto_13985 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13985 ?auto_13984 ?auto_13982 ?auto_13979 )
      ( MAKE-ON ?auto_13971 ?auto_13972 )
      ( MAKE-ON-VERIFY ?auto_13971 ?auto_13972 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13986 - SURFACE
      ?auto_13987 - SURFACE
    )
    :vars
    (
      ?auto_13999 - HOIST
      ?auto_13998 - PLACE
      ?auto_13995 - PLACE
      ?auto_13994 - HOIST
      ?auto_13988 - SURFACE
      ?auto_14000 - SURFACE
      ?auto_13992 - PLACE
      ?auto_13993 - HOIST
      ?auto_13991 - SURFACE
      ?auto_13989 - SURFACE
      ?auto_13997 - TRUCK
      ?auto_13996 - PLACE
      ?auto_13990 - HOIST
      ?auto_14001 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13999 ?auto_13998 ) ( IS-CRATE ?auto_13986 ) ( not ( = ?auto_13986 ?auto_13987 ) ) ( not ( = ?auto_13995 ?auto_13998 ) ) ( HOIST-AT ?auto_13994 ?auto_13995 ) ( not ( = ?auto_13999 ?auto_13994 ) ) ( AVAILABLE ?auto_13994 ) ( SURFACE-AT ?auto_13986 ?auto_13995 ) ( ON ?auto_13986 ?auto_13988 ) ( CLEAR ?auto_13986 ) ( not ( = ?auto_13986 ?auto_13988 ) ) ( not ( = ?auto_13987 ?auto_13988 ) ) ( IS-CRATE ?auto_13987 ) ( not ( = ?auto_13986 ?auto_14000 ) ) ( not ( = ?auto_13987 ?auto_14000 ) ) ( not ( = ?auto_13988 ?auto_14000 ) ) ( not ( = ?auto_13992 ?auto_13998 ) ) ( not ( = ?auto_13995 ?auto_13992 ) ) ( HOIST-AT ?auto_13993 ?auto_13992 ) ( not ( = ?auto_13999 ?auto_13993 ) ) ( not ( = ?auto_13994 ?auto_13993 ) ) ( AVAILABLE ?auto_13993 ) ( SURFACE-AT ?auto_13987 ?auto_13992 ) ( ON ?auto_13987 ?auto_13991 ) ( CLEAR ?auto_13987 ) ( not ( = ?auto_13986 ?auto_13991 ) ) ( not ( = ?auto_13987 ?auto_13991 ) ) ( not ( = ?auto_13988 ?auto_13991 ) ) ( not ( = ?auto_14000 ?auto_13991 ) ) ( SURFACE-AT ?auto_13989 ?auto_13998 ) ( CLEAR ?auto_13989 ) ( IS-CRATE ?auto_14000 ) ( not ( = ?auto_13986 ?auto_13989 ) ) ( not ( = ?auto_13987 ?auto_13989 ) ) ( not ( = ?auto_13988 ?auto_13989 ) ) ( not ( = ?auto_14000 ?auto_13989 ) ) ( not ( = ?auto_13991 ?auto_13989 ) ) ( AVAILABLE ?auto_13999 ) ( TRUCK-AT ?auto_13997 ?auto_13996 ) ( not ( = ?auto_13996 ?auto_13998 ) ) ( not ( = ?auto_13995 ?auto_13996 ) ) ( not ( = ?auto_13992 ?auto_13996 ) ) ( HOIST-AT ?auto_13990 ?auto_13996 ) ( not ( = ?auto_13999 ?auto_13990 ) ) ( not ( = ?auto_13994 ?auto_13990 ) ) ( not ( = ?auto_13993 ?auto_13990 ) ) ( AVAILABLE ?auto_13990 ) ( SURFACE-AT ?auto_14000 ?auto_13996 ) ( ON ?auto_14000 ?auto_14001 ) ( CLEAR ?auto_14000 ) ( not ( = ?auto_13986 ?auto_14001 ) ) ( not ( = ?auto_13987 ?auto_14001 ) ) ( not ( = ?auto_13988 ?auto_14001 ) ) ( not ( = ?auto_14000 ?auto_14001 ) ) ( not ( = ?auto_13991 ?auto_14001 ) ) ( not ( = ?auto_13989 ?auto_14001 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13990 ?auto_14000 ?auto_14001 ?auto_13996 )
      ( MAKE-ON ?auto_13986 ?auto_13987 )
      ( MAKE-ON-VERIFY ?auto_13986 ?auto_13987 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14002 - SURFACE
      ?auto_14003 - SURFACE
    )
    :vars
    (
      ?auto_14017 - HOIST
      ?auto_14013 - PLACE
      ?auto_14007 - PLACE
      ?auto_14008 - HOIST
      ?auto_14006 - SURFACE
      ?auto_14011 - SURFACE
      ?auto_14012 - PLACE
      ?auto_14016 - HOIST
      ?auto_14005 - SURFACE
      ?auto_14015 - SURFACE
      ?auto_14004 - PLACE
      ?auto_14010 - HOIST
      ?auto_14014 - SURFACE
      ?auto_14009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14017 ?auto_14013 ) ( IS-CRATE ?auto_14002 ) ( not ( = ?auto_14002 ?auto_14003 ) ) ( not ( = ?auto_14007 ?auto_14013 ) ) ( HOIST-AT ?auto_14008 ?auto_14007 ) ( not ( = ?auto_14017 ?auto_14008 ) ) ( AVAILABLE ?auto_14008 ) ( SURFACE-AT ?auto_14002 ?auto_14007 ) ( ON ?auto_14002 ?auto_14006 ) ( CLEAR ?auto_14002 ) ( not ( = ?auto_14002 ?auto_14006 ) ) ( not ( = ?auto_14003 ?auto_14006 ) ) ( IS-CRATE ?auto_14003 ) ( not ( = ?auto_14002 ?auto_14011 ) ) ( not ( = ?auto_14003 ?auto_14011 ) ) ( not ( = ?auto_14006 ?auto_14011 ) ) ( not ( = ?auto_14012 ?auto_14013 ) ) ( not ( = ?auto_14007 ?auto_14012 ) ) ( HOIST-AT ?auto_14016 ?auto_14012 ) ( not ( = ?auto_14017 ?auto_14016 ) ) ( not ( = ?auto_14008 ?auto_14016 ) ) ( AVAILABLE ?auto_14016 ) ( SURFACE-AT ?auto_14003 ?auto_14012 ) ( ON ?auto_14003 ?auto_14005 ) ( CLEAR ?auto_14003 ) ( not ( = ?auto_14002 ?auto_14005 ) ) ( not ( = ?auto_14003 ?auto_14005 ) ) ( not ( = ?auto_14006 ?auto_14005 ) ) ( not ( = ?auto_14011 ?auto_14005 ) ) ( SURFACE-AT ?auto_14015 ?auto_14013 ) ( CLEAR ?auto_14015 ) ( IS-CRATE ?auto_14011 ) ( not ( = ?auto_14002 ?auto_14015 ) ) ( not ( = ?auto_14003 ?auto_14015 ) ) ( not ( = ?auto_14006 ?auto_14015 ) ) ( not ( = ?auto_14011 ?auto_14015 ) ) ( not ( = ?auto_14005 ?auto_14015 ) ) ( AVAILABLE ?auto_14017 ) ( not ( = ?auto_14004 ?auto_14013 ) ) ( not ( = ?auto_14007 ?auto_14004 ) ) ( not ( = ?auto_14012 ?auto_14004 ) ) ( HOIST-AT ?auto_14010 ?auto_14004 ) ( not ( = ?auto_14017 ?auto_14010 ) ) ( not ( = ?auto_14008 ?auto_14010 ) ) ( not ( = ?auto_14016 ?auto_14010 ) ) ( AVAILABLE ?auto_14010 ) ( SURFACE-AT ?auto_14011 ?auto_14004 ) ( ON ?auto_14011 ?auto_14014 ) ( CLEAR ?auto_14011 ) ( not ( = ?auto_14002 ?auto_14014 ) ) ( not ( = ?auto_14003 ?auto_14014 ) ) ( not ( = ?auto_14006 ?auto_14014 ) ) ( not ( = ?auto_14011 ?auto_14014 ) ) ( not ( = ?auto_14005 ?auto_14014 ) ) ( not ( = ?auto_14015 ?auto_14014 ) ) ( TRUCK-AT ?auto_14009 ?auto_14013 ) )
    :subtasks
    ( ( !DRIVE ?auto_14009 ?auto_14013 ?auto_14004 )
      ( MAKE-ON ?auto_14002 ?auto_14003 )
      ( MAKE-ON-VERIFY ?auto_14002 ?auto_14003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14018 - SURFACE
      ?auto_14019 - SURFACE
    )
    :vars
    (
      ?auto_14024 - HOIST
      ?auto_14032 - PLACE
      ?auto_14025 - PLACE
      ?auto_14026 - HOIST
      ?auto_14029 - SURFACE
      ?auto_14030 - SURFACE
      ?auto_14020 - PLACE
      ?auto_14028 - HOIST
      ?auto_14023 - SURFACE
      ?auto_14033 - SURFACE
      ?auto_14027 - PLACE
      ?auto_14021 - HOIST
      ?auto_14031 - SURFACE
      ?auto_14022 - TRUCK
      ?auto_14034 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14024 ?auto_14032 ) ( IS-CRATE ?auto_14018 ) ( not ( = ?auto_14018 ?auto_14019 ) ) ( not ( = ?auto_14025 ?auto_14032 ) ) ( HOIST-AT ?auto_14026 ?auto_14025 ) ( not ( = ?auto_14024 ?auto_14026 ) ) ( AVAILABLE ?auto_14026 ) ( SURFACE-AT ?auto_14018 ?auto_14025 ) ( ON ?auto_14018 ?auto_14029 ) ( CLEAR ?auto_14018 ) ( not ( = ?auto_14018 ?auto_14029 ) ) ( not ( = ?auto_14019 ?auto_14029 ) ) ( IS-CRATE ?auto_14019 ) ( not ( = ?auto_14018 ?auto_14030 ) ) ( not ( = ?auto_14019 ?auto_14030 ) ) ( not ( = ?auto_14029 ?auto_14030 ) ) ( not ( = ?auto_14020 ?auto_14032 ) ) ( not ( = ?auto_14025 ?auto_14020 ) ) ( HOIST-AT ?auto_14028 ?auto_14020 ) ( not ( = ?auto_14024 ?auto_14028 ) ) ( not ( = ?auto_14026 ?auto_14028 ) ) ( AVAILABLE ?auto_14028 ) ( SURFACE-AT ?auto_14019 ?auto_14020 ) ( ON ?auto_14019 ?auto_14023 ) ( CLEAR ?auto_14019 ) ( not ( = ?auto_14018 ?auto_14023 ) ) ( not ( = ?auto_14019 ?auto_14023 ) ) ( not ( = ?auto_14029 ?auto_14023 ) ) ( not ( = ?auto_14030 ?auto_14023 ) ) ( IS-CRATE ?auto_14030 ) ( not ( = ?auto_14018 ?auto_14033 ) ) ( not ( = ?auto_14019 ?auto_14033 ) ) ( not ( = ?auto_14029 ?auto_14033 ) ) ( not ( = ?auto_14030 ?auto_14033 ) ) ( not ( = ?auto_14023 ?auto_14033 ) ) ( not ( = ?auto_14027 ?auto_14032 ) ) ( not ( = ?auto_14025 ?auto_14027 ) ) ( not ( = ?auto_14020 ?auto_14027 ) ) ( HOIST-AT ?auto_14021 ?auto_14027 ) ( not ( = ?auto_14024 ?auto_14021 ) ) ( not ( = ?auto_14026 ?auto_14021 ) ) ( not ( = ?auto_14028 ?auto_14021 ) ) ( AVAILABLE ?auto_14021 ) ( SURFACE-AT ?auto_14030 ?auto_14027 ) ( ON ?auto_14030 ?auto_14031 ) ( CLEAR ?auto_14030 ) ( not ( = ?auto_14018 ?auto_14031 ) ) ( not ( = ?auto_14019 ?auto_14031 ) ) ( not ( = ?auto_14029 ?auto_14031 ) ) ( not ( = ?auto_14030 ?auto_14031 ) ) ( not ( = ?auto_14023 ?auto_14031 ) ) ( not ( = ?auto_14033 ?auto_14031 ) ) ( TRUCK-AT ?auto_14022 ?auto_14032 ) ( SURFACE-AT ?auto_14034 ?auto_14032 ) ( CLEAR ?auto_14034 ) ( LIFTING ?auto_14024 ?auto_14033 ) ( IS-CRATE ?auto_14033 ) ( not ( = ?auto_14018 ?auto_14034 ) ) ( not ( = ?auto_14019 ?auto_14034 ) ) ( not ( = ?auto_14029 ?auto_14034 ) ) ( not ( = ?auto_14030 ?auto_14034 ) ) ( not ( = ?auto_14023 ?auto_14034 ) ) ( not ( = ?auto_14033 ?auto_14034 ) ) ( not ( = ?auto_14031 ?auto_14034 ) ) )
    :subtasks
    ( ( !DROP ?auto_14024 ?auto_14033 ?auto_14034 ?auto_14032 )
      ( MAKE-ON ?auto_14018 ?auto_14019 )
      ( MAKE-ON-VERIFY ?auto_14018 ?auto_14019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14035 - SURFACE
      ?auto_14036 - SURFACE
    )
    :vars
    (
      ?auto_14037 - HOIST
      ?auto_14051 - PLACE
      ?auto_14039 - PLACE
      ?auto_14040 - HOIST
      ?auto_14046 - SURFACE
      ?auto_14043 - SURFACE
      ?auto_14045 - PLACE
      ?auto_14041 - HOIST
      ?auto_14049 - SURFACE
      ?auto_14047 - SURFACE
      ?auto_14038 - PLACE
      ?auto_14048 - HOIST
      ?auto_14050 - SURFACE
      ?auto_14044 - TRUCK
      ?auto_14042 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14037 ?auto_14051 ) ( IS-CRATE ?auto_14035 ) ( not ( = ?auto_14035 ?auto_14036 ) ) ( not ( = ?auto_14039 ?auto_14051 ) ) ( HOIST-AT ?auto_14040 ?auto_14039 ) ( not ( = ?auto_14037 ?auto_14040 ) ) ( AVAILABLE ?auto_14040 ) ( SURFACE-AT ?auto_14035 ?auto_14039 ) ( ON ?auto_14035 ?auto_14046 ) ( CLEAR ?auto_14035 ) ( not ( = ?auto_14035 ?auto_14046 ) ) ( not ( = ?auto_14036 ?auto_14046 ) ) ( IS-CRATE ?auto_14036 ) ( not ( = ?auto_14035 ?auto_14043 ) ) ( not ( = ?auto_14036 ?auto_14043 ) ) ( not ( = ?auto_14046 ?auto_14043 ) ) ( not ( = ?auto_14045 ?auto_14051 ) ) ( not ( = ?auto_14039 ?auto_14045 ) ) ( HOIST-AT ?auto_14041 ?auto_14045 ) ( not ( = ?auto_14037 ?auto_14041 ) ) ( not ( = ?auto_14040 ?auto_14041 ) ) ( AVAILABLE ?auto_14041 ) ( SURFACE-AT ?auto_14036 ?auto_14045 ) ( ON ?auto_14036 ?auto_14049 ) ( CLEAR ?auto_14036 ) ( not ( = ?auto_14035 ?auto_14049 ) ) ( not ( = ?auto_14036 ?auto_14049 ) ) ( not ( = ?auto_14046 ?auto_14049 ) ) ( not ( = ?auto_14043 ?auto_14049 ) ) ( IS-CRATE ?auto_14043 ) ( not ( = ?auto_14035 ?auto_14047 ) ) ( not ( = ?auto_14036 ?auto_14047 ) ) ( not ( = ?auto_14046 ?auto_14047 ) ) ( not ( = ?auto_14043 ?auto_14047 ) ) ( not ( = ?auto_14049 ?auto_14047 ) ) ( not ( = ?auto_14038 ?auto_14051 ) ) ( not ( = ?auto_14039 ?auto_14038 ) ) ( not ( = ?auto_14045 ?auto_14038 ) ) ( HOIST-AT ?auto_14048 ?auto_14038 ) ( not ( = ?auto_14037 ?auto_14048 ) ) ( not ( = ?auto_14040 ?auto_14048 ) ) ( not ( = ?auto_14041 ?auto_14048 ) ) ( AVAILABLE ?auto_14048 ) ( SURFACE-AT ?auto_14043 ?auto_14038 ) ( ON ?auto_14043 ?auto_14050 ) ( CLEAR ?auto_14043 ) ( not ( = ?auto_14035 ?auto_14050 ) ) ( not ( = ?auto_14036 ?auto_14050 ) ) ( not ( = ?auto_14046 ?auto_14050 ) ) ( not ( = ?auto_14043 ?auto_14050 ) ) ( not ( = ?auto_14049 ?auto_14050 ) ) ( not ( = ?auto_14047 ?auto_14050 ) ) ( TRUCK-AT ?auto_14044 ?auto_14051 ) ( SURFACE-AT ?auto_14042 ?auto_14051 ) ( CLEAR ?auto_14042 ) ( IS-CRATE ?auto_14047 ) ( not ( = ?auto_14035 ?auto_14042 ) ) ( not ( = ?auto_14036 ?auto_14042 ) ) ( not ( = ?auto_14046 ?auto_14042 ) ) ( not ( = ?auto_14043 ?auto_14042 ) ) ( not ( = ?auto_14049 ?auto_14042 ) ) ( not ( = ?auto_14047 ?auto_14042 ) ) ( not ( = ?auto_14050 ?auto_14042 ) ) ( AVAILABLE ?auto_14037 ) ( IN ?auto_14047 ?auto_14044 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14037 ?auto_14047 ?auto_14044 ?auto_14051 )
      ( MAKE-ON ?auto_14035 ?auto_14036 )
      ( MAKE-ON-VERIFY ?auto_14035 ?auto_14036 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14052 - SURFACE
      ?auto_14053 - SURFACE
    )
    :vars
    (
      ?auto_14054 - HOIST
      ?auto_14063 - PLACE
      ?auto_14058 - PLACE
      ?auto_14055 - HOIST
      ?auto_14067 - SURFACE
      ?auto_14064 - SURFACE
      ?auto_14056 - PLACE
      ?auto_14065 - HOIST
      ?auto_14068 - SURFACE
      ?auto_14062 - SURFACE
      ?auto_14057 - PLACE
      ?auto_14061 - HOIST
      ?auto_14060 - SURFACE
      ?auto_14059 - SURFACE
      ?auto_14066 - TRUCK
      ?auto_14069 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14054 ?auto_14063 ) ( IS-CRATE ?auto_14052 ) ( not ( = ?auto_14052 ?auto_14053 ) ) ( not ( = ?auto_14058 ?auto_14063 ) ) ( HOIST-AT ?auto_14055 ?auto_14058 ) ( not ( = ?auto_14054 ?auto_14055 ) ) ( AVAILABLE ?auto_14055 ) ( SURFACE-AT ?auto_14052 ?auto_14058 ) ( ON ?auto_14052 ?auto_14067 ) ( CLEAR ?auto_14052 ) ( not ( = ?auto_14052 ?auto_14067 ) ) ( not ( = ?auto_14053 ?auto_14067 ) ) ( IS-CRATE ?auto_14053 ) ( not ( = ?auto_14052 ?auto_14064 ) ) ( not ( = ?auto_14053 ?auto_14064 ) ) ( not ( = ?auto_14067 ?auto_14064 ) ) ( not ( = ?auto_14056 ?auto_14063 ) ) ( not ( = ?auto_14058 ?auto_14056 ) ) ( HOIST-AT ?auto_14065 ?auto_14056 ) ( not ( = ?auto_14054 ?auto_14065 ) ) ( not ( = ?auto_14055 ?auto_14065 ) ) ( AVAILABLE ?auto_14065 ) ( SURFACE-AT ?auto_14053 ?auto_14056 ) ( ON ?auto_14053 ?auto_14068 ) ( CLEAR ?auto_14053 ) ( not ( = ?auto_14052 ?auto_14068 ) ) ( not ( = ?auto_14053 ?auto_14068 ) ) ( not ( = ?auto_14067 ?auto_14068 ) ) ( not ( = ?auto_14064 ?auto_14068 ) ) ( IS-CRATE ?auto_14064 ) ( not ( = ?auto_14052 ?auto_14062 ) ) ( not ( = ?auto_14053 ?auto_14062 ) ) ( not ( = ?auto_14067 ?auto_14062 ) ) ( not ( = ?auto_14064 ?auto_14062 ) ) ( not ( = ?auto_14068 ?auto_14062 ) ) ( not ( = ?auto_14057 ?auto_14063 ) ) ( not ( = ?auto_14058 ?auto_14057 ) ) ( not ( = ?auto_14056 ?auto_14057 ) ) ( HOIST-AT ?auto_14061 ?auto_14057 ) ( not ( = ?auto_14054 ?auto_14061 ) ) ( not ( = ?auto_14055 ?auto_14061 ) ) ( not ( = ?auto_14065 ?auto_14061 ) ) ( AVAILABLE ?auto_14061 ) ( SURFACE-AT ?auto_14064 ?auto_14057 ) ( ON ?auto_14064 ?auto_14060 ) ( CLEAR ?auto_14064 ) ( not ( = ?auto_14052 ?auto_14060 ) ) ( not ( = ?auto_14053 ?auto_14060 ) ) ( not ( = ?auto_14067 ?auto_14060 ) ) ( not ( = ?auto_14064 ?auto_14060 ) ) ( not ( = ?auto_14068 ?auto_14060 ) ) ( not ( = ?auto_14062 ?auto_14060 ) ) ( SURFACE-AT ?auto_14059 ?auto_14063 ) ( CLEAR ?auto_14059 ) ( IS-CRATE ?auto_14062 ) ( not ( = ?auto_14052 ?auto_14059 ) ) ( not ( = ?auto_14053 ?auto_14059 ) ) ( not ( = ?auto_14067 ?auto_14059 ) ) ( not ( = ?auto_14064 ?auto_14059 ) ) ( not ( = ?auto_14068 ?auto_14059 ) ) ( not ( = ?auto_14062 ?auto_14059 ) ) ( not ( = ?auto_14060 ?auto_14059 ) ) ( AVAILABLE ?auto_14054 ) ( IN ?auto_14062 ?auto_14066 ) ( TRUCK-AT ?auto_14066 ?auto_14069 ) ( not ( = ?auto_14069 ?auto_14063 ) ) ( not ( = ?auto_14058 ?auto_14069 ) ) ( not ( = ?auto_14056 ?auto_14069 ) ) ( not ( = ?auto_14057 ?auto_14069 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14066 ?auto_14069 ?auto_14063 )
      ( MAKE-ON ?auto_14052 ?auto_14053 )
      ( MAKE-ON-VERIFY ?auto_14052 ?auto_14053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14070 - SURFACE
      ?auto_14071 - SURFACE
    )
    :vars
    (
      ?auto_14080 - HOIST
      ?auto_14085 - PLACE
      ?auto_14086 - PLACE
      ?auto_14077 - HOIST
      ?auto_14084 - SURFACE
      ?auto_14076 - SURFACE
      ?auto_14075 - PLACE
      ?auto_14087 - HOIST
      ?auto_14083 - SURFACE
      ?auto_14081 - SURFACE
      ?auto_14072 - PLACE
      ?auto_14073 - HOIST
      ?auto_14079 - SURFACE
      ?auto_14074 - SURFACE
      ?auto_14078 - TRUCK
      ?auto_14082 - PLACE
      ?auto_14088 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14080 ?auto_14085 ) ( IS-CRATE ?auto_14070 ) ( not ( = ?auto_14070 ?auto_14071 ) ) ( not ( = ?auto_14086 ?auto_14085 ) ) ( HOIST-AT ?auto_14077 ?auto_14086 ) ( not ( = ?auto_14080 ?auto_14077 ) ) ( AVAILABLE ?auto_14077 ) ( SURFACE-AT ?auto_14070 ?auto_14086 ) ( ON ?auto_14070 ?auto_14084 ) ( CLEAR ?auto_14070 ) ( not ( = ?auto_14070 ?auto_14084 ) ) ( not ( = ?auto_14071 ?auto_14084 ) ) ( IS-CRATE ?auto_14071 ) ( not ( = ?auto_14070 ?auto_14076 ) ) ( not ( = ?auto_14071 ?auto_14076 ) ) ( not ( = ?auto_14084 ?auto_14076 ) ) ( not ( = ?auto_14075 ?auto_14085 ) ) ( not ( = ?auto_14086 ?auto_14075 ) ) ( HOIST-AT ?auto_14087 ?auto_14075 ) ( not ( = ?auto_14080 ?auto_14087 ) ) ( not ( = ?auto_14077 ?auto_14087 ) ) ( AVAILABLE ?auto_14087 ) ( SURFACE-AT ?auto_14071 ?auto_14075 ) ( ON ?auto_14071 ?auto_14083 ) ( CLEAR ?auto_14071 ) ( not ( = ?auto_14070 ?auto_14083 ) ) ( not ( = ?auto_14071 ?auto_14083 ) ) ( not ( = ?auto_14084 ?auto_14083 ) ) ( not ( = ?auto_14076 ?auto_14083 ) ) ( IS-CRATE ?auto_14076 ) ( not ( = ?auto_14070 ?auto_14081 ) ) ( not ( = ?auto_14071 ?auto_14081 ) ) ( not ( = ?auto_14084 ?auto_14081 ) ) ( not ( = ?auto_14076 ?auto_14081 ) ) ( not ( = ?auto_14083 ?auto_14081 ) ) ( not ( = ?auto_14072 ?auto_14085 ) ) ( not ( = ?auto_14086 ?auto_14072 ) ) ( not ( = ?auto_14075 ?auto_14072 ) ) ( HOIST-AT ?auto_14073 ?auto_14072 ) ( not ( = ?auto_14080 ?auto_14073 ) ) ( not ( = ?auto_14077 ?auto_14073 ) ) ( not ( = ?auto_14087 ?auto_14073 ) ) ( AVAILABLE ?auto_14073 ) ( SURFACE-AT ?auto_14076 ?auto_14072 ) ( ON ?auto_14076 ?auto_14079 ) ( CLEAR ?auto_14076 ) ( not ( = ?auto_14070 ?auto_14079 ) ) ( not ( = ?auto_14071 ?auto_14079 ) ) ( not ( = ?auto_14084 ?auto_14079 ) ) ( not ( = ?auto_14076 ?auto_14079 ) ) ( not ( = ?auto_14083 ?auto_14079 ) ) ( not ( = ?auto_14081 ?auto_14079 ) ) ( SURFACE-AT ?auto_14074 ?auto_14085 ) ( CLEAR ?auto_14074 ) ( IS-CRATE ?auto_14081 ) ( not ( = ?auto_14070 ?auto_14074 ) ) ( not ( = ?auto_14071 ?auto_14074 ) ) ( not ( = ?auto_14084 ?auto_14074 ) ) ( not ( = ?auto_14076 ?auto_14074 ) ) ( not ( = ?auto_14083 ?auto_14074 ) ) ( not ( = ?auto_14081 ?auto_14074 ) ) ( not ( = ?auto_14079 ?auto_14074 ) ) ( AVAILABLE ?auto_14080 ) ( TRUCK-AT ?auto_14078 ?auto_14082 ) ( not ( = ?auto_14082 ?auto_14085 ) ) ( not ( = ?auto_14086 ?auto_14082 ) ) ( not ( = ?auto_14075 ?auto_14082 ) ) ( not ( = ?auto_14072 ?auto_14082 ) ) ( HOIST-AT ?auto_14088 ?auto_14082 ) ( LIFTING ?auto_14088 ?auto_14081 ) ( not ( = ?auto_14080 ?auto_14088 ) ) ( not ( = ?auto_14077 ?auto_14088 ) ) ( not ( = ?auto_14087 ?auto_14088 ) ) ( not ( = ?auto_14073 ?auto_14088 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14088 ?auto_14081 ?auto_14078 ?auto_14082 )
      ( MAKE-ON ?auto_14070 ?auto_14071 )
      ( MAKE-ON-VERIFY ?auto_14070 ?auto_14071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14089 - SURFACE
      ?auto_14090 - SURFACE
    )
    :vars
    (
      ?auto_14107 - HOIST
      ?auto_14105 - PLACE
      ?auto_14100 - PLACE
      ?auto_14093 - HOIST
      ?auto_14098 - SURFACE
      ?auto_14091 - SURFACE
      ?auto_14102 - PLACE
      ?auto_14092 - HOIST
      ?auto_14096 - SURFACE
      ?auto_14097 - SURFACE
      ?auto_14099 - PLACE
      ?auto_14106 - HOIST
      ?auto_14104 - SURFACE
      ?auto_14103 - SURFACE
      ?auto_14095 - TRUCK
      ?auto_14101 - PLACE
      ?auto_14094 - HOIST
      ?auto_14108 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14107 ?auto_14105 ) ( IS-CRATE ?auto_14089 ) ( not ( = ?auto_14089 ?auto_14090 ) ) ( not ( = ?auto_14100 ?auto_14105 ) ) ( HOIST-AT ?auto_14093 ?auto_14100 ) ( not ( = ?auto_14107 ?auto_14093 ) ) ( AVAILABLE ?auto_14093 ) ( SURFACE-AT ?auto_14089 ?auto_14100 ) ( ON ?auto_14089 ?auto_14098 ) ( CLEAR ?auto_14089 ) ( not ( = ?auto_14089 ?auto_14098 ) ) ( not ( = ?auto_14090 ?auto_14098 ) ) ( IS-CRATE ?auto_14090 ) ( not ( = ?auto_14089 ?auto_14091 ) ) ( not ( = ?auto_14090 ?auto_14091 ) ) ( not ( = ?auto_14098 ?auto_14091 ) ) ( not ( = ?auto_14102 ?auto_14105 ) ) ( not ( = ?auto_14100 ?auto_14102 ) ) ( HOIST-AT ?auto_14092 ?auto_14102 ) ( not ( = ?auto_14107 ?auto_14092 ) ) ( not ( = ?auto_14093 ?auto_14092 ) ) ( AVAILABLE ?auto_14092 ) ( SURFACE-AT ?auto_14090 ?auto_14102 ) ( ON ?auto_14090 ?auto_14096 ) ( CLEAR ?auto_14090 ) ( not ( = ?auto_14089 ?auto_14096 ) ) ( not ( = ?auto_14090 ?auto_14096 ) ) ( not ( = ?auto_14098 ?auto_14096 ) ) ( not ( = ?auto_14091 ?auto_14096 ) ) ( IS-CRATE ?auto_14091 ) ( not ( = ?auto_14089 ?auto_14097 ) ) ( not ( = ?auto_14090 ?auto_14097 ) ) ( not ( = ?auto_14098 ?auto_14097 ) ) ( not ( = ?auto_14091 ?auto_14097 ) ) ( not ( = ?auto_14096 ?auto_14097 ) ) ( not ( = ?auto_14099 ?auto_14105 ) ) ( not ( = ?auto_14100 ?auto_14099 ) ) ( not ( = ?auto_14102 ?auto_14099 ) ) ( HOIST-AT ?auto_14106 ?auto_14099 ) ( not ( = ?auto_14107 ?auto_14106 ) ) ( not ( = ?auto_14093 ?auto_14106 ) ) ( not ( = ?auto_14092 ?auto_14106 ) ) ( AVAILABLE ?auto_14106 ) ( SURFACE-AT ?auto_14091 ?auto_14099 ) ( ON ?auto_14091 ?auto_14104 ) ( CLEAR ?auto_14091 ) ( not ( = ?auto_14089 ?auto_14104 ) ) ( not ( = ?auto_14090 ?auto_14104 ) ) ( not ( = ?auto_14098 ?auto_14104 ) ) ( not ( = ?auto_14091 ?auto_14104 ) ) ( not ( = ?auto_14096 ?auto_14104 ) ) ( not ( = ?auto_14097 ?auto_14104 ) ) ( SURFACE-AT ?auto_14103 ?auto_14105 ) ( CLEAR ?auto_14103 ) ( IS-CRATE ?auto_14097 ) ( not ( = ?auto_14089 ?auto_14103 ) ) ( not ( = ?auto_14090 ?auto_14103 ) ) ( not ( = ?auto_14098 ?auto_14103 ) ) ( not ( = ?auto_14091 ?auto_14103 ) ) ( not ( = ?auto_14096 ?auto_14103 ) ) ( not ( = ?auto_14097 ?auto_14103 ) ) ( not ( = ?auto_14104 ?auto_14103 ) ) ( AVAILABLE ?auto_14107 ) ( TRUCK-AT ?auto_14095 ?auto_14101 ) ( not ( = ?auto_14101 ?auto_14105 ) ) ( not ( = ?auto_14100 ?auto_14101 ) ) ( not ( = ?auto_14102 ?auto_14101 ) ) ( not ( = ?auto_14099 ?auto_14101 ) ) ( HOIST-AT ?auto_14094 ?auto_14101 ) ( not ( = ?auto_14107 ?auto_14094 ) ) ( not ( = ?auto_14093 ?auto_14094 ) ) ( not ( = ?auto_14092 ?auto_14094 ) ) ( not ( = ?auto_14106 ?auto_14094 ) ) ( AVAILABLE ?auto_14094 ) ( SURFACE-AT ?auto_14097 ?auto_14101 ) ( ON ?auto_14097 ?auto_14108 ) ( CLEAR ?auto_14097 ) ( not ( = ?auto_14089 ?auto_14108 ) ) ( not ( = ?auto_14090 ?auto_14108 ) ) ( not ( = ?auto_14098 ?auto_14108 ) ) ( not ( = ?auto_14091 ?auto_14108 ) ) ( not ( = ?auto_14096 ?auto_14108 ) ) ( not ( = ?auto_14097 ?auto_14108 ) ) ( not ( = ?auto_14104 ?auto_14108 ) ) ( not ( = ?auto_14103 ?auto_14108 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14094 ?auto_14097 ?auto_14108 ?auto_14101 )
      ( MAKE-ON ?auto_14089 ?auto_14090 )
      ( MAKE-ON-VERIFY ?auto_14089 ?auto_14090 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14109 - SURFACE
      ?auto_14110 - SURFACE
    )
    :vars
    (
      ?auto_14122 - HOIST
      ?auto_14114 - PLACE
      ?auto_14127 - PLACE
      ?auto_14116 - HOIST
      ?auto_14117 - SURFACE
      ?auto_14119 - SURFACE
      ?auto_14124 - PLACE
      ?auto_14123 - HOIST
      ?auto_14118 - SURFACE
      ?auto_14111 - SURFACE
      ?auto_14128 - PLACE
      ?auto_14120 - HOIST
      ?auto_14121 - SURFACE
      ?auto_14112 - SURFACE
      ?auto_14113 - PLACE
      ?auto_14125 - HOIST
      ?auto_14115 - SURFACE
      ?auto_14126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14122 ?auto_14114 ) ( IS-CRATE ?auto_14109 ) ( not ( = ?auto_14109 ?auto_14110 ) ) ( not ( = ?auto_14127 ?auto_14114 ) ) ( HOIST-AT ?auto_14116 ?auto_14127 ) ( not ( = ?auto_14122 ?auto_14116 ) ) ( AVAILABLE ?auto_14116 ) ( SURFACE-AT ?auto_14109 ?auto_14127 ) ( ON ?auto_14109 ?auto_14117 ) ( CLEAR ?auto_14109 ) ( not ( = ?auto_14109 ?auto_14117 ) ) ( not ( = ?auto_14110 ?auto_14117 ) ) ( IS-CRATE ?auto_14110 ) ( not ( = ?auto_14109 ?auto_14119 ) ) ( not ( = ?auto_14110 ?auto_14119 ) ) ( not ( = ?auto_14117 ?auto_14119 ) ) ( not ( = ?auto_14124 ?auto_14114 ) ) ( not ( = ?auto_14127 ?auto_14124 ) ) ( HOIST-AT ?auto_14123 ?auto_14124 ) ( not ( = ?auto_14122 ?auto_14123 ) ) ( not ( = ?auto_14116 ?auto_14123 ) ) ( AVAILABLE ?auto_14123 ) ( SURFACE-AT ?auto_14110 ?auto_14124 ) ( ON ?auto_14110 ?auto_14118 ) ( CLEAR ?auto_14110 ) ( not ( = ?auto_14109 ?auto_14118 ) ) ( not ( = ?auto_14110 ?auto_14118 ) ) ( not ( = ?auto_14117 ?auto_14118 ) ) ( not ( = ?auto_14119 ?auto_14118 ) ) ( IS-CRATE ?auto_14119 ) ( not ( = ?auto_14109 ?auto_14111 ) ) ( not ( = ?auto_14110 ?auto_14111 ) ) ( not ( = ?auto_14117 ?auto_14111 ) ) ( not ( = ?auto_14119 ?auto_14111 ) ) ( not ( = ?auto_14118 ?auto_14111 ) ) ( not ( = ?auto_14128 ?auto_14114 ) ) ( not ( = ?auto_14127 ?auto_14128 ) ) ( not ( = ?auto_14124 ?auto_14128 ) ) ( HOIST-AT ?auto_14120 ?auto_14128 ) ( not ( = ?auto_14122 ?auto_14120 ) ) ( not ( = ?auto_14116 ?auto_14120 ) ) ( not ( = ?auto_14123 ?auto_14120 ) ) ( AVAILABLE ?auto_14120 ) ( SURFACE-AT ?auto_14119 ?auto_14128 ) ( ON ?auto_14119 ?auto_14121 ) ( CLEAR ?auto_14119 ) ( not ( = ?auto_14109 ?auto_14121 ) ) ( not ( = ?auto_14110 ?auto_14121 ) ) ( not ( = ?auto_14117 ?auto_14121 ) ) ( not ( = ?auto_14119 ?auto_14121 ) ) ( not ( = ?auto_14118 ?auto_14121 ) ) ( not ( = ?auto_14111 ?auto_14121 ) ) ( SURFACE-AT ?auto_14112 ?auto_14114 ) ( CLEAR ?auto_14112 ) ( IS-CRATE ?auto_14111 ) ( not ( = ?auto_14109 ?auto_14112 ) ) ( not ( = ?auto_14110 ?auto_14112 ) ) ( not ( = ?auto_14117 ?auto_14112 ) ) ( not ( = ?auto_14119 ?auto_14112 ) ) ( not ( = ?auto_14118 ?auto_14112 ) ) ( not ( = ?auto_14111 ?auto_14112 ) ) ( not ( = ?auto_14121 ?auto_14112 ) ) ( AVAILABLE ?auto_14122 ) ( not ( = ?auto_14113 ?auto_14114 ) ) ( not ( = ?auto_14127 ?auto_14113 ) ) ( not ( = ?auto_14124 ?auto_14113 ) ) ( not ( = ?auto_14128 ?auto_14113 ) ) ( HOIST-AT ?auto_14125 ?auto_14113 ) ( not ( = ?auto_14122 ?auto_14125 ) ) ( not ( = ?auto_14116 ?auto_14125 ) ) ( not ( = ?auto_14123 ?auto_14125 ) ) ( not ( = ?auto_14120 ?auto_14125 ) ) ( AVAILABLE ?auto_14125 ) ( SURFACE-AT ?auto_14111 ?auto_14113 ) ( ON ?auto_14111 ?auto_14115 ) ( CLEAR ?auto_14111 ) ( not ( = ?auto_14109 ?auto_14115 ) ) ( not ( = ?auto_14110 ?auto_14115 ) ) ( not ( = ?auto_14117 ?auto_14115 ) ) ( not ( = ?auto_14119 ?auto_14115 ) ) ( not ( = ?auto_14118 ?auto_14115 ) ) ( not ( = ?auto_14111 ?auto_14115 ) ) ( not ( = ?auto_14121 ?auto_14115 ) ) ( not ( = ?auto_14112 ?auto_14115 ) ) ( TRUCK-AT ?auto_14126 ?auto_14114 ) )
    :subtasks
    ( ( !DRIVE ?auto_14126 ?auto_14114 ?auto_14113 )
      ( MAKE-ON ?auto_14109 ?auto_14110 )
      ( MAKE-ON-VERIFY ?auto_14109 ?auto_14110 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14131 - SURFACE
      ?auto_14132 - SURFACE
    )
    :vars
    (
      ?auto_14133 - HOIST
      ?auto_14134 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14133 ?auto_14134 ) ( SURFACE-AT ?auto_14132 ?auto_14134 ) ( CLEAR ?auto_14132 ) ( LIFTING ?auto_14133 ?auto_14131 ) ( IS-CRATE ?auto_14131 ) ( not ( = ?auto_14131 ?auto_14132 ) ) )
    :subtasks
    ( ( !DROP ?auto_14133 ?auto_14131 ?auto_14132 ?auto_14134 )
      ( MAKE-ON-VERIFY ?auto_14131 ?auto_14132 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14135 - SURFACE
      ?auto_14136 - SURFACE
    )
    :vars
    (
      ?auto_14137 - HOIST
      ?auto_14138 - PLACE
      ?auto_14139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14137 ?auto_14138 ) ( SURFACE-AT ?auto_14136 ?auto_14138 ) ( CLEAR ?auto_14136 ) ( IS-CRATE ?auto_14135 ) ( not ( = ?auto_14135 ?auto_14136 ) ) ( TRUCK-AT ?auto_14139 ?auto_14138 ) ( AVAILABLE ?auto_14137 ) ( IN ?auto_14135 ?auto_14139 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14137 ?auto_14135 ?auto_14139 ?auto_14138 )
      ( MAKE-ON ?auto_14135 ?auto_14136 )
      ( MAKE-ON-VERIFY ?auto_14135 ?auto_14136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14140 - SURFACE
      ?auto_14141 - SURFACE
    )
    :vars
    (
      ?auto_14142 - HOIST
      ?auto_14144 - PLACE
      ?auto_14143 - TRUCK
      ?auto_14145 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14142 ?auto_14144 ) ( SURFACE-AT ?auto_14141 ?auto_14144 ) ( CLEAR ?auto_14141 ) ( IS-CRATE ?auto_14140 ) ( not ( = ?auto_14140 ?auto_14141 ) ) ( AVAILABLE ?auto_14142 ) ( IN ?auto_14140 ?auto_14143 ) ( TRUCK-AT ?auto_14143 ?auto_14145 ) ( not ( = ?auto_14145 ?auto_14144 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14143 ?auto_14145 ?auto_14144 )
      ( MAKE-ON ?auto_14140 ?auto_14141 )
      ( MAKE-ON-VERIFY ?auto_14140 ?auto_14141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14146 - SURFACE
      ?auto_14147 - SURFACE
    )
    :vars
    (
      ?auto_14150 - HOIST
      ?auto_14149 - PLACE
      ?auto_14151 - TRUCK
      ?auto_14148 - PLACE
      ?auto_14152 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14150 ?auto_14149 ) ( SURFACE-AT ?auto_14147 ?auto_14149 ) ( CLEAR ?auto_14147 ) ( IS-CRATE ?auto_14146 ) ( not ( = ?auto_14146 ?auto_14147 ) ) ( AVAILABLE ?auto_14150 ) ( TRUCK-AT ?auto_14151 ?auto_14148 ) ( not ( = ?auto_14148 ?auto_14149 ) ) ( HOIST-AT ?auto_14152 ?auto_14148 ) ( LIFTING ?auto_14152 ?auto_14146 ) ( not ( = ?auto_14150 ?auto_14152 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14152 ?auto_14146 ?auto_14151 ?auto_14148 )
      ( MAKE-ON ?auto_14146 ?auto_14147 )
      ( MAKE-ON-VERIFY ?auto_14146 ?auto_14147 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14153 - SURFACE
      ?auto_14154 - SURFACE
    )
    :vars
    (
      ?auto_14155 - HOIST
      ?auto_14158 - PLACE
      ?auto_14157 - TRUCK
      ?auto_14156 - PLACE
      ?auto_14159 - HOIST
      ?auto_14160 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14155 ?auto_14158 ) ( SURFACE-AT ?auto_14154 ?auto_14158 ) ( CLEAR ?auto_14154 ) ( IS-CRATE ?auto_14153 ) ( not ( = ?auto_14153 ?auto_14154 ) ) ( AVAILABLE ?auto_14155 ) ( TRUCK-AT ?auto_14157 ?auto_14156 ) ( not ( = ?auto_14156 ?auto_14158 ) ) ( HOIST-AT ?auto_14159 ?auto_14156 ) ( not ( = ?auto_14155 ?auto_14159 ) ) ( AVAILABLE ?auto_14159 ) ( SURFACE-AT ?auto_14153 ?auto_14156 ) ( ON ?auto_14153 ?auto_14160 ) ( CLEAR ?auto_14153 ) ( not ( = ?auto_14153 ?auto_14160 ) ) ( not ( = ?auto_14154 ?auto_14160 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14159 ?auto_14153 ?auto_14160 ?auto_14156 )
      ( MAKE-ON ?auto_14153 ?auto_14154 )
      ( MAKE-ON-VERIFY ?auto_14153 ?auto_14154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14161 - SURFACE
      ?auto_14162 - SURFACE
    )
    :vars
    (
      ?auto_14167 - HOIST
      ?auto_14168 - PLACE
      ?auto_14165 - PLACE
      ?auto_14166 - HOIST
      ?auto_14163 - SURFACE
      ?auto_14164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14167 ?auto_14168 ) ( SURFACE-AT ?auto_14162 ?auto_14168 ) ( CLEAR ?auto_14162 ) ( IS-CRATE ?auto_14161 ) ( not ( = ?auto_14161 ?auto_14162 ) ) ( AVAILABLE ?auto_14167 ) ( not ( = ?auto_14165 ?auto_14168 ) ) ( HOIST-AT ?auto_14166 ?auto_14165 ) ( not ( = ?auto_14167 ?auto_14166 ) ) ( AVAILABLE ?auto_14166 ) ( SURFACE-AT ?auto_14161 ?auto_14165 ) ( ON ?auto_14161 ?auto_14163 ) ( CLEAR ?auto_14161 ) ( not ( = ?auto_14161 ?auto_14163 ) ) ( not ( = ?auto_14162 ?auto_14163 ) ) ( TRUCK-AT ?auto_14164 ?auto_14168 ) )
    :subtasks
    ( ( !DRIVE ?auto_14164 ?auto_14168 ?auto_14165 )
      ( MAKE-ON ?auto_14161 ?auto_14162 )
      ( MAKE-ON-VERIFY ?auto_14161 ?auto_14162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14169 - SURFACE
      ?auto_14170 - SURFACE
    )
    :vars
    (
      ?auto_14172 - HOIST
      ?auto_14171 - PLACE
      ?auto_14173 - PLACE
      ?auto_14174 - HOIST
      ?auto_14176 - SURFACE
      ?auto_14175 - TRUCK
      ?auto_14177 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14172 ?auto_14171 ) ( IS-CRATE ?auto_14169 ) ( not ( = ?auto_14169 ?auto_14170 ) ) ( not ( = ?auto_14173 ?auto_14171 ) ) ( HOIST-AT ?auto_14174 ?auto_14173 ) ( not ( = ?auto_14172 ?auto_14174 ) ) ( AVAILABLE ?auto_14174 ) ( SURFACE-AT ?auto_14169 ?auto_14173 ) ( ON ?auto_14169 ?auto_14176 ) ( CLEAR ?auto_14169 ) ( not ( = ?auto_14169 ?auto_14176 ) ) ( not ( = ?auto_14170 ?auto_14176 ) ) ( TRUCK-AT ?auto_14175 ?auto_14171 ) ( SURFACE-AT ?auto_14177 ?auto_14171 ) ( CLEAR ?auto_14177 ) ( LIFTING ?auto_14172 ?auto_14170 ) ( IS-CRATE ?auto_14170 ) ( not ( = ?auto_14169 ?auto_14177 ) ) ( not ( = ?auto_14170 ?auto_14177 ) ) ( not ( = ?auto_14176 ?auto_14177 ) ) )
    :subtasks
    ( ( !DROP ?auto_14172 ?auto_14170 ?auto_14177 ?auto_14171 )
      ( MAKE-ON ?auto_14169 ?auto_14170 )
      ( MAKE-ON-VERIFY ?auto_14169 ?auto_14170 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14178 - SURFACE
      ?auto_14179 - SURFACE
    )
    :vars
    (
      ?auto_14182 - HOIST
      ?auto_14180 - PLACE
      ?auto_14183 - PLACE
      ?auto_14184 - HOIST
      ?auto_14181 - SURFACE
      ?auto_14186 - TRUCK
      ?auto_14185 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14182 ?auto_14180 ) ( IS-CRATE ?auto_14178 ) ( not ( = ?auto_14178 ?auto_14179 ) ) ( not ( = ?auto_14183 ?auto_14180 ) ) ( HOIST-AT ?auto_14184 ?auto_14183 ) ( not ( = ?auto_14182 ?auto_14184 ) ) ( AVAILABLE ?auto_14184 ) ( SURFACE-AT ?auto_14178 ?auto_14183 ) ( ON ?auto_14178 ?auto_14181 ) ( CLEAR ?auto_14178 ) ( not ( = ?auto_14178 ?auto_14181 ) ) ( not ( = ?auto_14179 ?auto_14181 ) ) ( TRUCK-AT ?auto_14186 ?auto_14180 ) ( SURFACE-AT ?auto_14185 ?auto_14180 ) ( CLEAR ?auto_14185 ) ( IS-CRATE ?auto_14179 ) ( not ( = ?auto_14178 ?auto_14185 ) ) ( not ( = ?auto_14179 ?auto_14185 ) ) ( not ( = ?auto_14181 ?auto_14185 ) ) ( AVAILABLE ?auto_14182 ) ( IN ?auto_14179 ?auto_14186 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14182 ?auto_14179 ?auto_14186 ?auto_14180 )
      ( MAKE-ON ?auto_14178 ?auto_14179 )
      ( MAKE-ON-VERIFY ?auto_14178 ?auto_14179 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14187 - SURFACE
      ?auto_14188 - SURFACE
    )
    :vars
    (
      ?auto_14190 - HOIST
      ?auto_14192 - PLACE
      ?auto_14195 - PLACE
      ?auto_14194 - HOIST
      ?auto_14193 - SURFACE
      ?auto_14191 - SURFACE
      ?auto_14189 - TRUCK
      ?auto_14196 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14190 ?auto_14192 ) ( IS-CRATE ?auto_14187 ) ( not ( = ?auto_14187 ?auto_14188 ) ) ( not ( = ?auto_14195 ?auto_14192 ) ) ( HOIST-AT ?auto_14194 ?auto_14195 ) ( not ( = ?auto_14190 ?auto_14194 ) ) ( AVAILABLE ?auto_14194 ) ( SURFACE-AT ?auto_14187 ?auto_14195 ) ( ON ?auto_14187 ?auto_14193 ) ( CLEAR ?auto_14187 ) ( not ( = ?auto_14187 ?auto_14193 ) ) ( not ( = ?auto_14188 ?auto_14193 ) ) ( SURFACE-AT ?auto_14191 ?auto_14192 ) ( CLEAR ?auto_14191 ) ( IS-CRATE ?auto_14188 ) ( not ( = ?auto_14187 ?auto_14191 ) ) ( not ( = ?auto_14188 ?auto_14191 ) ) ( not ( = ?auto_14193 ?auto_14191 ) ) ( AVAILABLE ?auto_14190 ) ( IN ?auto_14188 ?auto_14189 ) ( TRUCK-AT ?auto_14189 ?auto_14196 ) ( not ( = ?auto_14196 ?auto_14192 ) ) ( not ( = ?auto_14195 ?auto_14196 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14189 ?auto_14196 ?auto_14192 )
      ( MAKE-ON ?auto_14187 ?auto_14188 )
      ( MAKE-ON-VERIFY ?auto_14187 ?auto_14188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14197 - SURFACE
      ?auto_14198 - SURFACE
    )
    :vars
    (
      ?auto_14202 - HOIST
      ?auto_14205 - PLACE
      ?auto_14199 - PLACE
      ?auto_14200 - HOIST
      ?auto_14201 - SURFACE
      ?auto_14206 - SURFACE
      ?auto_14204 - TRUCK
      ?auto_14203 - PLACE
      ?auto_14207 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14202 ?auto_14205 ) ( IS-CRATE ?auto_14197 ) ( not ( = ?auto_14197 ?auto_14198 ) ) ( not ( = ?auto_14199 ?auto_14205 ) ) ( HOIST-AT ?auto_14200 ?auto_14199 ) ( not ( = ?auto_14202 ?auto_14200 ) ) ( AVAILABLE ?auto_14200 ) ( SURFACE-AT ?auto_14197 ?auto_14199 ) ( ON ?auto_14197 ?auto_14201 ) ( CLEAR ?auto_14197 ) ( not ( = ?auto_14197 ?auto_14201 ) ) ( not ( = ?auto_14198 ?auto_14201 ) ) ( SURFACE-AT ?auto_14206 ?auto_14205 ) ( CLEAR ?auto_14206 ) ( IS-CRATE ?auto_14198 ) ( not ( = ?auto_14197 ?auto_14206 ) ) ( not ( = ?auto_14198 ?auto_14206 ) ) ( not ( = ?auto_14201 ?auto_14206 ) ) ( AVAILABLE ?auto_14202 ) ( TRUCK-AT ?auto_14204 ?auto_14203 ) ( not ( = ?auto_14203 ?auto_14205 ) ) ( not ( = ?auto_14199 ?auto_14203 ) ) ( HOIST-AT ?auto_14207 ?auto_14203 ) ( LIFTING ?auto_14207 ?auto_14198 ) ( not ( = ?auto_14202 ?auto_14207 ) ) ( not ( = ?auto_14200 ?auto_14207 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14207 ?auto_14198 ?auto_14204 ?auto_14203 )
      ( MAKE-ON ?auto_14197 ?auto_14198 )
      ( MAKE-ON-VERIFY ?auto_14197 ?auto_14198 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14208 - SURFACE
      ?auto_14209 - SURFACE
    )
    :vars
    (
      ?auto_14214 - HOIST
      ?auto_14212 - PLACE
      ?auto_14218 - PLACE
      ?auto_14211 - HOIST
      ?auto_14216 - SURFACE
      ?auto_14213 - SURFACE
      ?auto_14215 - TRUCK
      ?auto_14210 - PLACE
      ?auto_14217 - HOIST
      ?auto_14219 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14214 ?auto_14212 ) ( IS-CRATE ?auto_14208 ) ( not ( = ?auto_14208 ?auto_14209 ) ) ( not ( = ?auto_14218 ?auto_14212 ) ) ( HOIST-AT ?auto_14211 ?auto_14218 ) ( not ( = ?auto_14214 ?auto_14211 ) ) ( AVAILABLE ?auto_14211 ) ( SURFACE-AT ?auto_14208 ?auto_14218 ) ( ON ?auto_14208 ?auto_14216 ) ( CLEAR ?auto_14208 ) ( not ( = ?auto_14208 ?auto_14216 ) ) ( not ( = ?auto_14209 ?auto_14216 ) ) ( SURFACE-AT ?auto_14213 ?auto_14212 ) ( CLEAR ?auto_14213 ) ( IS-CRATE ?auto_14209 ) ( not ( = ?auto_14208 ?auto_14213 ) ) ( not ( = ?auto_14209 ?auto_14213 ) ) ( not ( = ?auto_14216 ?auto_14213 ) ) ( AVAILABLE ?auto_14214 ) ( TRUCK-AT ?auto_14215 ?auto_14210 ) ( not ( = ?auto_14210 ?auto_14212 ) ) ( not ( = ?auto_14218 ?auto_14210 ) ) ( HOIST-AT ?auto_14217 ?auto_14210 ) ( not ( = ?auto_14214 ?auto_14217 ) ) ( not ( = ?auto_14211 ?auto_14217 ) ) ( AVAILABLE ?auto_14217 ) ( SURFACE-AT ?auto_14209 ?auto_14210 ) ( ON ?auto_14209 ?auto_14219 ) ( CLEAR ?auto_14209 ) ( not ( = ?auto_14208 ?auto_14219 ) ) ( not ( = ?auto_14209 ?auto_14219 ) ) ( not ( = ?auto_14216 ?auto_14219 ) ) ( not ( = ?auto_14213 ?auto_14219 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14217 ?auto_14209 ?auto_14219 ?auto_14210 )
      ( MAKE-ON ?auto_14208 ?auto_14209 )
      ( MAKE-ON-VERIFY ?auto_14208 ?auto_14209 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14220 - SURFACE
      ?auto_14221 - SURFACE
    )
    :vars
    (
      ?auto_14223 - HOIST
      ?auto_14231 - PLACE
      ?auto_14228 - PLACE
      ?auto_14229 - HOIST
      ?auto_14222 - SURFACE
      ?auto_14225 - SURFACE
      ?auto_14227 - PLACE
      ?auto_14230 - HOIST
      ?auto_14224 - SURFACE
      ?auto_14226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14223 ?auto_14231 ) ( IS-CRATE ?auto_14220 ) ( not ( = ?auto_14220 ?auto_14221 ) ) ( not ( = ?auto_14228 ?auto_14231 ) ) ( HOIST-AT ?auto_14229 ?auto_14228 ) ( not ( = ?auto_14223 ?auto_14229 ) ) ( AVAILABLE ?auto_14229 ) ( SURFACE-AT ?auto_14220 ?auto_14228 ) ( ON ?auto_14220 ?auto_14222 ) ( CLEAR ?auto_14220 ) ( not ( = ?auto_14220 ?auto_14222 ) ) ( not ( = ?auto_14221 ?auto_14222 ) ) ( SURFACE-AT ?auto_14225 ?auto_14231 ) ( CLEAR ?auto_14225 ) ( IS-CRATE ?auto_14221 ) ( not ( = ?auto_14220 ?auto_14225 ) ) ( not ( = ?auto_14221 ?auto_14225 ) ) ( not ( = ?auto_14222 ?auto_14225 ) ) ( AVAILABLE ?auto_14223 ) ( not ( = ?auto_14227 ?auto_14231 ) ) ( not ( = ?auto_14228 ?auto_14227 ) ) ( HOIST-AT ?auto_14230 ?auto_14227 ) ( not ( = ?auto_14223 ?auto_14230 ) ) ( not ( = ?auto_14229 ?auto_14230 ) ) ( AVAILABLE ?auto_14230 ) ( SURFACE-AT ?auto_14221 ?auto_14227 ) ( ON ?auto_14221 ?auto_14224 ) ( CLEAR ?auto_14221 ) ( not ( = ?auto_14220 ?auto_14224 ) ) ( not ( = ?auto_14221 ?auto_14224 ) ) ( not ( = ?auto_14222 ?auto_14224 ) ) ( not ( = ?auto_14225 ?auto_14224 ) ) ( TRUCK-AT ?auto_14226 ?auto_14231 ) )
    :subtasks
    ( ( !DRIVE ?auto_14226 ?auto_14231 ?auto_14227 )
      ( MAKE-ON ?auto_14220 ?auto_14221 )
      ( MAKE-ON-VERIFY ?auto_14220 ?auto_14221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14232 - SURFACE
      ?auto_14233 - SURFACE
    )
    :vars
    (
      ?auto_14238 - HOIST
      ?auto_14239 - PLACE
      ?auto_14241 - PLACE
      ?auto_14234 - HOIST
      ?auto_14240 - SURFACE
      ?auto_14235 - SURFACE
      ?auto_14243 - PLACE
      ?auto_14242 - HOIST
      ?auto_14237 - SURFACE
      ?auto_14236 - TRUCK
      ?auto_14244 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14238 ?auto_14239 ) ( IS-CRATE ?auto_14232 ) ( not ( = ?auto_14232 ?auto_14233 ) ) ( not ( = ?auto_14241 ?auto_14239 ) ) ( HOIST-AT ?auto_14234 ?auto_14241 ) ( not ( = ?auto_14238 ?auto_14234 ) ) ( AVAILABLE ?auto_14234 ) ( SURFACE-AT ?auto_14232 ?auto_14241 ) ( ON ?auto_14232 ?auto_14240 ) ( CLEAR ?auto_14232 ) ( not ( = ?auto_14232 ?auto_14240 ) ) ( not ( = ?auto_14233 ?auto_14240 ) ) ( IS-CRATE ?auto_14233 ) ( not ( = ?auto_14232 ?auto_14235 ) ) ( not ( = ?auto_14233 ?auto_14235 ) ) ( not ( = ?auto_14240 ?auto_14235 ) ) ( not ( = ?auto_14243 ?auto_14239 ) ) ( not ( = ?auto_14241 ?auto_14243 ) ) ( HOIST-AT ?auto_14242 ?auto_14243 ) ( not ( = ?auto_14238 ?auto_14242 ) ) ( not ( = ?auto_14234 ?auto_14242 ) ) ( AVAILABLE ?auto_14242 ) ( SURFACE-AT ?auto_14233 ?auto_14243 ) ( ON ?auto_14233 ?auto_14237 ) ( CLEAR ?auto_14233 ) ( not ( = ?auto_14232 ?auto_14237 ) ) ( not ( = ?auto_14233 ?auto_14237 ) ) ( not ( = ?auto_14240 ?auto_14237 ) ) ( not ( = ?auto_14235 ?auto_14237 ) ) ( TRUCK-AT ?auto_14236 ?auto_14239 ) ( SURFACE-AT ?auto_14244 ?auto_14239 ) ( CLEAR ?auto_14244 ) ( LIFTING ?auto_14238 ?auto_14235 ) ( IS-CRATE ?auto_14235 ) ( not ( = ?auto_14232 ?auto_14244 ) ) ( not ( = ?auto_14233 ?auto_14244 ) ) ( not ( = ?auto_14240 ?auto_14244 ) ) ( not ( = ?auto_14235 ?auto_14244 ) ) ( not ( = ?auto_14237 ?auto_14244 ) ) )
    :subtasks
    ( ( !DROP ?auto_14238 ?auto_14235 ?auto_14244 ?auto_14239 )
      ( MAKE-ON ?auto_14232 ?auto_14233 )
      ( MAKE-ON-VERIFY ?auto_14232 ?auto_14233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14245 - SURFACE
      ?auto_14246 - SURFACE
    )
    :vars
    (
      ?auto_14257 - HOIST
      ?auto_14252 - PLACE
      ?auto_14249 - PLACE
      ?auto_14256 - HOIST
      ?auto_14247 - SURFACE
      ?auto_14254 - SURFACE
      ?auto_14248 - PLACE
      ?auto_14250 - HOIST
      ?auto_14253 - SURFACE
      ?auto_14251 - TRUCK
      ?auto_14255 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14257 ?auto_14252 ) ( IS-CRATE ?auto_14245 ) ( not ( = ?auto_14245 ?auto_14246 ) ) ( not ( = ?auto_14249 ?auto_14252 ) ) ( HOIST-AT ?auto_14256 ?auto_14249 ) ( not ( = ?auto_14257 ?auto_14256 ) ) ( AVAILABLE ?auto_14256 ) ( SURFACE-AT ?auto_14245 ?auto_14249 ) ( ON ?auto_14245 ?auto_14247 ) ( CLEAR ?auto_14245 ) ( not ( = ?auto_14245 ?auto_14247 ) ) ( not ( = ?auto_14246 ?auto_14247 ) ) ( IS-CRATE ?auto_14246 ) ( not ( = ?auto_14245 ?auto_14254 ) ) ( not ( = ?auto_14246 ?auto_14254 ) ) ( not ( = ?auto_14247 ?auto_14254 ) ) ( not ( = ?auto_14248 ?auto_14252 ) ) ( not ( = ?auto_14249 ?auto_14248 ) ) ( HOIST-AT ?auto_14250 ?auto_14248 ) ( not ( = ?auto_14257 ?auto_14250 ) ) ( not ( = ?auto_14256 ?auto_14250 ) ) ( AVAILABLE ?auto_14250 ) ( SURFACE-AT ?auto_14246 ?auto_14248 ) ( ON ?auto_14246 ?auto_14253 ) ( CLEAR ?auto_14246 ) ( not ( = ?auto_14245 ?auto_14253 ) ) ( not ( = ?auto_14246 ?auto_14253 ) ) ( not ( = ?auto_14247 ?auto_14253 ) ) ( not ( = ?auto_14254 ?auto_14253 ) ) ( TRUCK-AT ?auto_14251 ?auto_14252 ) ( SURFACE-AT ?auto_14255 ?auto_14252 ) ( CLEAR ?auto_14255 ) ( IS-CRATE ?auto_14254 ) ( not ( = ?auto_14245 ?auto_14255 ) ) ( not ( = ?auto_14246 ?auto_14255 ) ) ( not ( = ?auto_14247 ?auto_14255 ) ) ( not ( = ?auto_14254 ?auto_14255 ) ) ( not ( = ?auto_14253 ?auto_14255 ) ) ( AVAILABLE ?auto_14257 ) ( IN ?auto_14254 ?auto_14251 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14257 ?auto_14254 ?auto_14251 ?auto_14252 )
      ( MAKE-ON ?auto_14245 ?auto_14246 )
      ( MAKE-ON-VERIFY ?auto_14245 ?auto_14246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14258 - SURFACE
      ?auto_14259 - SURFACE
    )
    :vars
    (
      ?auto_14266 - HOIST
      ?auto_14265 - PLACE
      ?auto_14261 - PLACE
      ?auto_14269 - HOIST
      ?auto_14264 - SURFACE
      ?auto_14270 - SURFACE
      ?auto_14262 - PLACE
      ?auto_14267 - HOIST
      ?auto_14268 - SURFACE
      ?auto_14263 - SURFACE
      ?auto_14260 - TRUCK
      ?auto_14271 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14266 ?auto_14265 ) ( IS-CRATE ?auto_14258 ) ( not ( = ?auto_14258 ?auto_14259 ) ) ( not ( = ?auto_14261 ?auto_14265 ) ) ( HOIST-AT ?auto_14269 ?auto_14261 ) ( not ( = ?auto_14266 ?auto_14269 ) ) ( AVAILABLE ?auto_14269 ) ( SURFACE-AT ?auto_14258 ?auto_14261 ) ( ON ?auto_14258 ?auto_14264 ) ( CLEAR ?auto_14258 ) ( not ( = ?auto_14258 ?auto_14264 ) ) ( not ( = ?auto_14259 ?auto_14264 ) ) ( IS-CRATE ?auto_14259 ) ( not ( = ?auto_14258 ?auto_14270 ) ) ( not ( = ?auto_14259 ?auto_14270 ) ) ( not ( = ?auto_14264 ?auto_14270 ) ) ( not ( = ?auto_14262 ?auto_14265 ) ) ( not ( = ?auto_14261 ?auto_14262 ) ) ( HOIST-AT ?auto_14267 ?auto_14262 ) ( not ( = ?auto_14266 ?auto_14267 ) ) ( not ( = ?auto_14269 ?auto_14267 ) ) ( AVAILABLE ?auto_14267 ) ( SURFACE-AT ?auto_14259 ?auto_14262 ) ( ON ?auto_14259 ?auto_14268 ) ( CLEAR ?auto_14259 ) ( not ( = ?auto_14258 ?auto_14268 ) ) ( not ( = ?auto_14259 ?auto_14268 ) ) ( not ( = ?auto_14264 ?auto_14268 ) ) ( not ( = ?auto_14270 ?auto_14268 ) ) ( SURFACE-AT ?auto_14263 ?auto_14265 ) ( CLEAR ?auto_14263 ) ( IS-CRATE ?auto_14270 ) ( not ( = ?auto_14258 ?auto_14263 ) ) ( not ( = ?auto_14259 ?auto_14263 ) ) ( not ( = ?auto_14264 ?auto_14263 ) ) ( not ( = ?auto_14270 ?auto_14263 ) ) ( not ( = ?auto_14268 ?auto_14263 ) ) ( AVAILABLE ?auto_14266 ) ( IN ?auto_14270 ?auto_14260 ) ( TRUCK-AT ?auto_14260 ?auto_14271 ) ( not ( = ?auto_14271 ?auto_14265 ) ) ( not ( = ?auto_14261 ?auto_14271 ) ) ( not ( = ?auto_14262 ?auto_14271 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14260 ?auto_14271 ?auto_14265 )
      ( MAKE-ON ?auto_14258 ?auto_14259 )
      ( MAKE-ON-VERIFY ?auto_14258 ?auto_14259 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14272 - SURFACE
      ?auto_14273 - SURFACE
    )
    :vars
    (
      ?auto_14277 - HOIST
      ?auto_14279 - PLACE
      ?auto_14275 - PLACE
      ?auto_14283 - HOIST
      ?auto_14278 - SURFACE
      ?auto_14285 - SURFACE
      ?auto_14284 - PLACE
      ?auto_14282 - HOIST
      ?auto_14280 - SURFACE
      ?auto_14274 - SURFACE
      ?auto_14281 - TRUCK
      ?auto_14276 - PLACE
      ?auto_14286 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14277 ?auto_14279 ) ( IS-CRATE ?auto_14272 ) ( not ( = ?auto_14272 ?auto_14273 ) ) ( not ( = ?auto_14275 ?auto_14279 ) ) ( HOIST-AT ?auto_14283 ?auto_14275 ) ( not ( = ?auto_14277 ?auto_14283 ) ) ( AVAILABLE ?auto_14283 ) ( SURFACE-AT ?auto_14272 ?auto_14275 ) ( ON ?auto_14272 ?auto_14278 ) ( CLEAR ?auto_14272 ) ( not ( = ?auto_14272 ?auto_14278 ) ) ( not ( = ?auto_14273 ?auto_14278 ) ) ( IS-CRATE ?auto_14273 ) ( not ( = ?auto_14272 ?auto_14285 ) ) ( not ( = ?auto_14273 ?auto_14285 ) ) ( not ( = ?auto_14278 ?auto_14285 ) ) ( not ( = ?auto_14284 ?auto_14279 ) ) ( not ( = ?auto_14275 ?auto_14284 ) ) ( HOIST-AT ?auto_14282 ?auto_14284 ) ( not ( = ?auto_14277 ?auto_14282 ) ) ( not ( = ?auto_14283 ?auto_14282 ) ) ( AVAILABLE ?auto_14282 ) ( SURFACE-AT ?auto_14273 ?auto_14284 ) ( ON ?auto_14273 ?auto_14280 ) ( CLEAR ?auto_14273 ) ( not ( = ?auto_14272 ?auto_14280 ) ) ( not ( = ?auto_14273 ?auto_14280 ) ) ( not ( = ?auto_14278 ?auto_14280 ) ) ( not ( = ?auto_14285 ?auto_14280 ) ) ( SURFACE-AT ?auto_14274 ?auto_14279 ) ( CLEAR ?auto_14274 ) ( IS-CRATE ?auto_14285 ) ( not ( = ?auto_14272 ?auto_14274 ) ) ( not ( = ?auto_14273 ?auto_14274 ) ) ( not ( = ?auto_14278 ?auto_14274 ) ) ( not ( = ?auto_14285 ?auto_14274 ) ) ( not ( = ?auto_14280 ?auto_14274 ) ) ( AVAILABLE ?auto_14277 ) ( TRUCK-AT ?auto_14281 ?auto_14276 ) ( not ( = ?auto_14276 ?auto_14279 ) ) ( not ( = ?auto_14275 ?auto_14276 ) ) ( not ( = ?auto_14284 ?auto_14276 ) ) ( HOIST-AT ?auto_14286 ?auto_14276 ) ( LIFTING ?auto_14286 ?auto_14285 ) ( not ( = ?auto_14277 ?auto_14286 ) ) ( not ( = ?auto_14283 ?auto_14286 ) ) ( not ( = ?auto_14282 ?auto_14286 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14286 ?auto_14285 ?auto_14281 ?auto_14276 )
      ( MAKE-ON ?auto_14272 ?auto_14273 )
      ( MAKE-ON-VERIFY ?auto_14272 ?auto_14273 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14287 - SURFACE
      ?auto_14288 - SURFACE
    )
    :vars
    (
      ?auto_14297 - HOIST
      ?auto_14295 - PLACE
      ?auto_14299 - PLACE
      ?auto_14293 - HOIST
      ?auto_14298 - SURFACE
      ?auto_14292 - SURFACE
      ?auto_14296 - PLACE
      ?auto_14289 - HOIST
      ?auto_14301 - SURFACE
      ?auto_14291 - SURFACE
      ?auto_14290 - TRUCK
      ?auto_14294 - PLACE
      ?auto_14300 - HOIST
      ?auto_14302 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14297 ?auto_14295 ) ( IS-CRATE ?auto_14287 ) ( not ( = ?auto_14287 ?auto_14288 ) ) ( not ( = ?auto_14299 ?auto_14295 ) ) ( HOIST-AT ?auto_14293 ?auto_14299 ) ( not ( = ?auto_14297 ?auto_14293 ) ) ( AVAILABLE ?auto_14293 ) ( SURFACE-AT ?auto_14287 ?auto_14299 ) ( ON ?auto_14287 ?auto_14298 ) ( CLEAR ?auto_14287 ) ( not ( = ?auto_14287 ?auto_14298 ) ) ( not ( = ?auto_14288 ?auto_14298 ) ) ( IS-CRATE ?auto_14288 ) ( not ( = ?auto_14287 ?auto_14292 ) ) ( not ( = ?auto_14288 ?auto_14292 ) ) ( not ( = ?auto_14298 ?auto_14292 ) ) ( not ( = ?auto_14296 ?auto_14295 ) ) ( not ( = ?auto_14299 ?auto_14296 ) ) ( HOIST-AT ?auto_14289 ?auto_14296 ) ( not ( = ?auto_14297 ?auto_14289 ) ) ( not ( = ?auto_14293 ?auto_14289 ) ) ( AVAILABLE ?auto_14289 ) ( SURFACE-AT ?auto_14288 ?auto_14296 ) ( ON ?auto_14288 ?auto_14301 ) ( CLEAR ?auto_14288 ) ( not ( = ?auto_14287 ?auto_14301 ) ) ( not ( = ?auto_14288 ?auto_14301 ) ) ( not ( = ?auto_14298 ?auto_14301 ) ) ( not ( = ?auto_14292 ?auto_14301 ) ) ( SURFACE-AT ?auto_14291 ?auto_14295 ) ( CLEAR ?auto_14291 ) ( IS-CRATE ?auto_14292 ) ( not ( = ?auto_14287 ?auto_14291 ) ) ( not ( = ?auto_14288 ?auto_14291 ) ) ( not ( = ?auto_14298 ?auto_14291 ) ) ( not ( = ?auto_14292 ?auto_14291 ) ) ( not ( = ?auto_14301 ?auto_14291 ) ) ( AVAILABLE ?auto_14297 ) ( TRUCK-AT ?auto_14290 ?auto_14294 ) ( not ( = ?auto_14294 ?auto_14295 ) ) ( not ( = ?auto_14299 ?auto_14294 ) ) ( not ( = ?auto_14296 ?auto_14294 ) ) ( HOIST-AT ?auto_14300 ?auto_14294 ) ( not ( = ?auto_14297 ?auto_14300 ) ) ( not ( = ?auto_14293 ?auto_14300 ) ) ( not ( = ?auto_14289 ?auto_14300 ) ) ( AVAILABLE ?auto_14300 ) ( SURFACE-AT ?auto_14292 ?auto_14294 ) ( ON ?auto_14292 ?auto_14302 ) ( CLEAR ?auto_14292 ) ( not ( = ?auto_14287 ?auto_14302 ) ) ( not ( = ?auto_14288 ?auto_14302 ) ) ( not ( = ?auto_14298 ?auto_14302 ) ) ( not ( = ?auto_14292 ?auto_14302 ) ) ( not ( = ?auto_14301 ?auto_14302 ) ) ( not ( = ?auto_14291 ?auto_14302 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14300 ?auto_14292 ?auto_14302 ?auto_14294 )
      ( MAKE-ON ?auto_14287 ?auto_14288 )
      ( MAKE-ON-VERIFY ?auto_14287 ?auto_14288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14303 - SURFACE
      ?auto_14304 - SURFACE
    )
    :vars
    (
      ?auto_14310 - HOIST
      ?auto_14312 - PLACE
      ?auto_14307 - PLACE
      ?auto_14306 - HOIST
      ?auto_14318 - SURFACE
      ?auto_14308 - SURFACE
      ?auto_14311 - PLACE
      ?auto_14314 - HOIST
      ?auto_14313 - SURFACE
      ?auto_14317 - SURFACE
      ?auto_14305 - PLACE
      ?auto_14315 - HOIST
      ?auto_14316 - SURFACE
      ?auto_14309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14310 ?auto_14312 ) ( IS-CRATE ?auto_14303 ) ( not ( = ?auto_14303 ?auto_14304 ) ) ( not ( = ?auto_14307 ?auto_14312 ) ) ( HOIST-AT ?auto_14306 ?auto_14307 ) ( not ( = ?auto_14310 ?auto_14306 ) ) ( AVAILABLE ?auto_14306 ) ( SURFACE-AT ?auto_14303 ?auto_14307 ) ( ON ?auto_14303 ?auto_14318 ) ( CLEAR ?auto_14303 ) ( not ( = ?auto_14303 ?auto_14318 ) ) ( not ( = ?auto_14304 ?auto_14318 ) ) ( IS-CRATE ?auto_14304 ) ( not ( = ?auto_14303 ?auto_14308 ) ) ( not ( = ?auto_14304 ?auto_14308 ) ) ( not ( = ?auto_14318 ?auto_14308 ) ) ( not ( = ?auto_14311 ?auto_14312 ) ) ( not ( = ?auto_14307 ?auto_14311 ) ) ( HOIST-AT ?auto_14314 ?auto_14311 ) ( not ( = ?auto_14310 ?auto_14314 ) ) ( not ( = ?auto_14306 ?auto_14314 ) ) ( AVAILABLE ?auto_14314 ) ( SURFACE-AT ?auto_14304 ?auto_14311 ) ( ON ?auto_14304 ?auto_14313 ) ( CLEAR ?auto_14304 ) ( not ( = ?auto_14303 ?auto_14313 ) ) ( not ( = ?auto_14304 ?auto_14313 ) ) ( not ( = ?auto_14318 ?auto_14313 ) ) ( not ( = ?auto_14308 ?auto_14313 ) ) ( SURFACE-AT ?auto_14317 ?auto_14312 ) ( CLEAR ?auto_14317 ) ( IS-CRATE ?auto_14308 ) ( not ( = ?auto_14303 ?auto_14317 ) ) ( not ( = ?auto_14304 ?auto_14317 ) ) ( not ( = ?auto_14318 ?auto_14317 ) ) ( not ( = ?auto_14308 ?auto_14317 ) ) ( not ( = ?auto_14313 ?auto_14317 ) ) ( AVAILABLE ?auto_14310 ) ( not ( = ?auto_14305 ?auto_14312 ) ) ( not ( = ?auto_14307 ?auto_14305 ) ) ( not ( = ?auto_14311 ?auto_14305 ) ) ( HOIST-AT ?auto_14315 ?auto_14305 ) ( not ( = ?auto_14310 ?auto_14315 ) ) ( not ( = ?auto_14306 ?auto_14315 ) ) ( not ( = ?auto_14314 ?auto_14315 ) ) ( AVAILABLE ?auto_14315 ) ( SURFACE-AT ?auto_14308 ?auto_14305 ) ( ON ?auto_14308 ?auto_14316 ) ( CLEAR ?auto_14308 ) ( not ( = ?auto_14303 ?auto_14316 ) ) ( not ( = ?auto_14304 ?auto_14316 ) ) ( not ( = ?auto_14318 ?auto_14316 ) ) ( not ( = ?auto_14308 ?auto_14316 ) ) ( not ( = ?auto_14313 ?auto_14316 ) ) ( not ( = ?auto_14317 ?auto_14316 ) ) ( TRUCK-AT ?auto_14309 ?auto_14312 ) )
    :subtasks
    ( ( !DRIVE ?auto_14309 ?auto_14312 ?auto_14305 )
      ( MAKE-ON ?auto_14303 ?auto_14304 )
      ( MAKE-ON-VERIFY ?auto_14303 ?auto_14304 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14319 - SURFACE
      ?auto_14320 - SURFACE
    )
    :vars
    (
      ?auto_14331 - HOIST
      ?auto_14321 - PLACE
      ?auto_14327 - PLACE
      ?auto_14328 - HOIST
      ?auto_14330 - SURFACE
      ?auto_14332 - SURFACE
      ?auto_14326 - PLACE
      ?auto_14323 - HOIST
      ?auto_14333 - SURFACE
      ?auto_14325 - SURFACE
      ?auto_14334 - PLACE
      ?auto_14322 - HOIST
      ?auto_14329 - SURFACE
      ?auto_14324 - TRUCK
      ?auto_14335 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14331 ?auto_14321 ) ( IS-CRATE ?auto_14319 ) ( not ( = ?auto_14319 ?auto_14320 ) ) ( not ( = ?auto_14327 ?auto_14321 ) ) ( HOIST-AT ?auto_14328 ?auto_14327 ) ( not ( = ?auto_14331 ?auto_14328 ) ) ( AVAILABLE ?auto_14328 ) ( SURFACE-AT ?auto_14319 ?auto_14327 ) ( ON ?auto_14319 ?auto_14330 ) ( CLEAR ?auto_14319 ) ( not ( = ?auto_14319 ?auto_14330 ) ) ( not ( = ?auto_14320 ?auto_14330 ) ) ( IS-CRATE ?auto_14320 ) ( not ( = ?auto_14319 ?auto_14332 ) ) ( not ( = ?auto_14320 ?auto_14332 ) ) ( not ( = ?auto_14330 ?auto_14332 ) ) ( not ( = ?auto_14326 ?auto_14321 ) ) ( not ( = ?auto_14327 ?auto_14326 ) ) ( HOIST-AT ?auto_14323 ?auto_14326 ) ( not ( = ?auto_14331 ?auto_14323 ) ) ( not ( = ?auto_14328 ?auto_14323 ) ) ( AVAILABLE ?auto_14323 ) ( SURFACE-AT ?auto_14320 ?auto_14326 ) ( ON ?auto_14320 ?auto_14333 ) ( CLEAR ?auto_14320 ) ( not ( = ?auto_14319 ?auto_14333 ) ) ( not ( = ?auto_14320 ?auto_14333 ) ) ( not ( = ?auto_14330 ?auto_14333 ) ) ( not ( = ?auto_14332 ?auto_14333 ) ) ( IS-CRATE ?auto_14332 ) ( not ( = ?auto_14319 ?auto_14325 ) ) ( not ( = ?auto_14320 ?auto_14325 ) ) ( not ( = ?auto_14330 ?auto_14325 ) ) ( not ( = ?auto_14332 ?auto_14325 ) ) ( not ( = ?auto_14333 ?auto_14325 ) ) ( not ( = ?auto_14334 ?auto_14321 ) ) ( not ( = ?auto_14327 ?auto_14334 ) ) ( not ( = ?auto_14326 ?auto_14334 ) ) ( HOIST-AT ?auto_14322 ?auto_14334 ) ( not ( = ?auto_14331 ?auto_14322 ) ) ( not ( = ?auto_14328 ?auto_14322 ) ) ( not ( = ?auto_14323 ?auto_14322 ) ) ( AVAILABLE ?auto_14322 ) ( SURFACE-AT ?auto_14332 ?auto_14334 ) ( ON ?auto_14332 ?auto_14329 ) ( CLEAR ?auto_14332 ) ( not ( = ?auto_14319 ?auto_14329 ) ) ( not ( = ?auto_14320 ?auto_14329 ) ) ( not ( = ?auto_14330 ?auto_14329 ) ) ( not ( = ?auto_14332 ?auto_14329 ) ) ( not ( = ?auto_14333 ?auto_14329 ) ) ( not ( = ?auto_14325 ?auto_14329 ) ) ( TRUCK-AT ?auto_14324 ?auto_14321 ) ( SURFACE-AT ?auto_14335 ?auto_14321 ) ( CLEAR ?auto_14335 ) ( LIFTING ?auto_14331 ?auto_14325 ) ( IS-CRATE ?auto_14325 ) ( not ( = ?auto_14319 ?auto_14335 ) ) ( not ( = ?auto_14320 ?auto_14335 ) ) ( not ( = ?auto_14330 ?auto_14335 ) ) ( not ( = ?auto_14332 ?auto_14335 ) ) ( not ( = ?auto_14333 ?auto_14335 ) ) ( not ( = ?auto_14325 ?auto_14335 ) ) ( not ( = ?auto_14329 ?auto_14335 ) ) )
    :subtasks
    ( ( !DROP ?auto_14331 ?auto_14325 ?auto_14335 ?auto_14321 )
      ( MAKE-ON ?auto_14319 ?auto_14320 )
      ( MAKE-ON-VERIFY ?auto_14319 ?auto_14320 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14336 - SURFACE
      ?auto_14337 - SURFACE
    )
    :vars
    (
      ?auto_14343 - HOIST
      ?auto_14349 - PLACE
      ?auto_14351 - PLACE
      ?auto_14344 - HOIST
      ?auto_14339 - SURFACE
      ?auto_14350 - SURFACE
      ?auto_14345 - PLACE
      ?auto_14340 - HOIST
      ?auto_14341 - SURFACE
      ?auto_14346 - SURFACE
      ?auto_14342 - PLACE
      ?auto_14347 - HOIST
      ?auto_14338 - SURFACE
      ?auto_14348 - TRUCK
      ?auto_14352 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14343 ?auto_14349 ) ( IS-CRATE ?auto_14336 ) ( not ( = ?auto_14336 ?auto_14337 ) ) ( not ( = ?auto_14351 ?auto_14349 ) ) ( HOIST-AT ?auto_14344 ?auto_14351 ) ( not ( = ?auto_14343 ?auto_14344 ) ) ( AVAILABLE ?auto_14344 ) ( SURFACE-AT ?auto_14336 ?auto_14351 ) ( ON ?auto_14336 ?auto_14339 ) ( CLEAR ?auto_14336 ) ( not ( = ?auto_14336 ?auto_14339 ) ) ( not ( = ?auto_14337 ?auto_14339 ) ) ( IS-CRATE ?auto_14337 ) ( not ( = ?auto_14336 ?auto_14350 ) ) ( not ( = ?auto_14337 ?auto_14350 ) ) ( not ( = ?auto_14339 ?auto_14350 ) ) ( not ( = ?auto_14345 ?auto_14349 ) ) ( not ( = ?auto_14351 ?auto_14345 ) ) ( HOIST-AT ?auto_14340 ?auto_14345 ) ( not ( = ?auto_14343 ?auto_14340 ) ) ( not ( = ?auto_14344 ?auto_14340 ) ) ( AVAILABLE ?auto_14340 ) ( SURFACE-AT ?auto_14337 ?auto_14345 ) ( ON ?auto_14337 ?auto_14341 ) ( CLEAR ?auto_14337 ) ( not ( = ?auto_14336 ?auto_14341 ) ) ( not ( = ?auto_14337 ?auto_14341 ) ) ( not ( = ?auto_14339 ?auto_14341 ) ) ( not ( = ?auto_14350 ?auto_14341 ) ) ( IS-CRATE ?auto_14350 ) ( not ( = ?auto_14336 ?auto_14346 ) ) ( not ( = ?auto_14337 ?auto_14346 ) ) ( not ( = ?auto_14339 ?auto_14346 ) ) ( not ( = ?auto_14350 ?auto_14346 ) ) ( not ( = ?auto_14341 ?auto_14346 ) ) ( not ( = ?auto_14342 ?auto_14349 ) ) ( not ( = ?auto_14351 ?auto_14342 ) ) ( not ( = ?auto_14345 ?auto_14342 ) ) ( HOIST-AT ?auto_14347 ?auto_14342 ) ( not ( = ?auto_14343 ?auto_14347 ) ) ( not ( = ?auto_14344 ?auto_14347 ) ) ( not ( = ?auto_14340 ?auto_14347 ) ) ( AVAILABLE ?auto_14347 ) ( SURFACE-AT ?auto_14350 ?auto_14342 ) ( ON ?auto_14350 ?auto_14338 ) ( CLEAR ?auto_14350 ) ( not ( = ?auto_14336 ?auto_14338 ) ) ( not ( = ?auto_14337 ?auto_14338 ) ) ( not ( = ?auto_14339 ?auto_14338 ) ) ( not ( = ?auto_14350 ?auto_14338 ) ) ( not ( = ?auto_14341 ?auto_14338 ) ) ( not ( = ?auto_14346 ?auto_14338 ) ) ( TRUCK-AT ?auto_14348 ?auto_14349 ) ( SURFACE-AT ?auto_14352 ?auto_14349 ) ( CLEAR ?auto_14352 ) ( IS-CRATE ?auto_14346 ) ( not ( = ?auto_14336 ?auto_14352 ) ) ( not ( = ?auto_14337 ?auto_14352 ) ) ( not ( = ?auto_14339 ?auto_14352 ) ) ( not ( = ?auto_14350 ?auto_14352 ) ) ( not ( = ?auto_14341 ?auto_14352 ) ) ( not ( = ?auto_14346 ?auto_14352 ) ) ( not ( = ?auto_14338 ?auto_14352 ) ) ( AVAILABLE ?auto_14343 ) ( IN ?auto_14346 ?auto_14348 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14343 ?auto_14346 ?auto_14348 ?auto_14349 )
      ( MAKE-ON ?auto_14336 ?auto_14337 )
      ( MAKE-ON-VERIFY ?auto_14336 ?auto_14337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14353 - SURFACE
      ?auto_14354 - SURFACE
    )
    :vars
    (
      ?auto_14355 - HOIST
      ?auto_14358 - PLACE
      ?auto_14356 - PLACE
      ?auto_14367 - HOIST
      ?auto_14363 - SURFACE
      ?auto_14365 - SURFACE
      ?auto_14364 - PLACE
      ?auto_14357 - HOIST
      ?auto_14360 - SURFACE
      ?auto_14368 - SURFACE
      ?auto_14366 - PLACE
      ?auto_14362 - HOIST
      ?auto_14359 - SURFACE
      ?auto_14361 - SURFACE
      ?auto_14369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14355 ?auto_14358 ) ( IS-CRATE ?auto_14353 ) ( not ( = ?auto_14353 ?auto_14354 ) ) ( not ( = ?auto_14356 ?auto_14358 ) ) ( HOIST-AT ?auto_14367 ?auto_14356 ) ( not ( = ?auto_14355 ?auto_14367 ) ) ( AVAILABLE ?auto_14367 ) ( SURFACE-AT ?auto_14353 ?auto_14356 ) ( ON ?auto_14353 ?auto_14363 ) ( CLEAR ?auto_14353 ) ( not ( = ?auto_14353 ?auto_14363 ) ) ( not ( = ?auto_14354 ?auto_14363 ) ) ( IS-CRATE ?auto_14354 ) ( not ( = ?auto_14353 ?auto_14365 ) ) ( not ( = ?auto_14354 ?auto_14365 ) ) ( not ( = ?auto_14363 ?auto_14365 ) ) ( not ( = ?auto_14364 ?auto_14358 ) ) ( not ( = ?auto_14356 ?auto_14364 ) ) ( HOIST-AT ?auto_14357 ?auto_14364 ) ( not ( = ?auto_14355 ?auto_14357 ) ) ( not ( = ?auto_14367 ?auto_14357 ) ) ( AVAILABLE ?auto_14357 ) ( SURFACE-AT ?auto_14354 ?auto_14364 ) ( ON ?auto_14354 ?auto_14360 ) ( CLEAR ?auto_14354 ) ( not ( = ?auto_14353 ?auto_14360 ) ) ( not ( = ?auto_14354 ?auto_14360 ) ) ( not ( = ?auto_14363 ?auto_14360 ) ) ( not ( = ?auto_14365 ?auto_14360 ) ) ( IS-CRATE ?auto_14365 ) ( not ( = ?auto_14353 ?auto_14368 ) ) ( not ( = ?auto_14354 ?auto_14368 ) ) ( not ( = ?auto_14363 ?auto_14368 ) ) ( not ( = ?auto_14365 ?auto_14368 ) ) ( not ( = ?auto_14360 ?auto_14368 ) ) ( not ( = ?auto_14366 ?auto_14358 ) ) ( not ( = ?auto_14356 ?auto_14366 ) ) ( not ( = ?auto_14364 ?auto_14366 ) ) ( HOIST-AT ?auto_14362 ?auto_14366 ) ( not ( = ?auto_14355 ?auto_14362 ) ) ( not ( = ?auto_14367 ?auto_14362 ) ) ( not ( = ?auto_14357 ?auto_14362 ) ) ( AVAILABLE ?auto_14362 ) ( SURFACE-AT ?auto_14365 ?auto_14366 ) ( ON ?auto_14365 ?auto_14359 ) ( CLEAR ?auto_14365 ) ( not ( = ?auto_14353 ?auto_14359 ) ) ( not ( = ?auto_14354 ?auto_14359 ) ) ( not ( = ?auto_14363 ?auto_14359 ) ) ( not ( = ?auto_14365 ?auto_14359 ) ) ( not ( = ?auto_14360 ?auto_14359 ) ) ( not ( = ?auto_14368 ?auto_14359 ) ) ( SURFACE-AT ?auto_14361 ?auto_14358 ) ( CLEAR ?auto_14361 ) ( IS-CRATE ?auto_14368 ) ( not ( = ?auto_14353 ?auto_14361 ) ) ( not ( = ?auto_14354 ?auto_14361 ) ) ( not ( = ?auto_14363 ?auto_14361 ) ) ( not ( = ?auto_14365 ?auto_14361 ) ) ( not ( = ?auto_14360 ?auto_14361 ) ) ( not ( = ?auto_14368 ?auto_14361 ) ) ( not ( = ?auto_14359 ?auto_14361 ) ) ( AVAILABLE ?auto_14355 ) ( IN ?auto_14368 ?auto_14369 ) ( TRUCK-AT ?auto_14369 ?auto_14356 ) )
    :subtasks
    ( ( !DRIVE ?auto_14369 ?auto_14356 ?auto_14358 )
      ( MAKE-ON ?auto_14353 ?auto_14354 )
      ( MAKE-ON-VERIFY ?auto_14353 ?auto_14354 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14370 - SURFACE
      ?auto_14371 - SURFACE
    )
    :vars
    (
      ?auto_14377 - HOIST
      ?auto_14385 - PLACE
      ?auto_14382 - PLACE
      ?auto_14373 - HOIST
      ?auto_14372 - SURFACE
      ?auto_14384 - SURFACE
      ?auto_14376 - PLACE
      ?auto_14383 - HOIST
      ?auto_14381 - SURFACE
      ?auto_14379 - SURFACE
      ?auto_14374 - PLACE
      ?auto_14380 - HOIST
      ?auto_14375 - SURFACE
      ?auto_14386 - SURFACE
      ?auto_14378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14377 ?auto_14385 ) ( IS-CRATE ?auto_14370 ) ( not ( = ?auto_14370 ?auto_14371 ) ) ( not ( = ?auto_14382 ?auto_14385 ) ) ( HOIST-AT ?auto_14373 ?auto_14382 ) ( not ( = ?auto_14377 ?auto_14373 ) ) ( SURFACE-AT ?auto_14370 ?auto_14382 ) ( ON ?auto_14370 ?auto_14372 ) ( CLEAR ?auto_14370 ) ( not ( = ?auto_14370 ?auto_14372 ) ) ( not ( = ?auto_14371 ?auto_14372 ) ) ( IS-CRATE ?auto_14371 ) ( not ( = ?auto_14370 ?auto_14384 ) ) ( not ( = ?auto_14371 ?auto_14384 ) ) ( not ( = ?auto_14372 ?auto_14384 ) ) ( not ( = ?auto_14376 ?auto_14385 ) ) ( not ( = ?auto_14382 ?auto_14376 ) ) ( HOIST-AT ?auto_14383 ?auto_14376 ) ( not ( = ?auto_14377 ?auto_14383 ) ) ( not ( = ?auto_14373 ?auto_14383 ) ) ( AVAILABLE ?auto_14383 ) ( SURFACE-AT ?auto_14371 ?auto_14376 ) ( ON ?auto_14371 ?auto_14381 ) ( CLEAR ?auto_14371 ) ( not ( = ?auto_14370 ?auto_14381 ) ) ( not ( = ?auto_14371 ?auto_14381 ) ) ( not ( = ?auto_14372 ?auto_14381 ) ) ( not ( = ?auto_14384 ?auto_14381 ) ) ( IS-CRATE ?auto_14384 ) ( not ( = ?auto_14370 ?auto_14379 ) ) ( not ( = ?auto_14371 ?auto_14379 ) ) ( not ( = ?auto_14372 ?auto_14379 ) ) ( not ( = ?auto_14384 ?auto_14379 ) ) ( not ( = ?auto_14381 ?auto_14379 ) ) ( not ( = ?auto_14374 ?auto_14385 ) ) ( not ( = ?auto_14382 ?auto_14374 ) ) ( not ( = ?auto_14376 ?auto_14374 ) ) ( HOIST-AT ?auto_14380 ?auto_14374 ) ( not ( = ?auto_14377 ?auto_14380 ) ) ( not ( = ?auto_14373 ?auto_14380 ) ) ( not ( = ?auto_14383 ?auto_14380 ) ) ( AVAILABLE ?auto_14380 ) ( SURFACE-AT ?auto_14384 ?auto_14374 ) ( ON ?auto_14384 ?auto_14375 ) ( CLEAR ?auto_14384 ) ( not ( = ?auto_14370 ?auto_14375 ) ) ( not ( = ?auto_14371 ?auto_14375 ) ) ( not ( = ?auto_14372 ?auto_14375 ) ) ( not ( = ?auto_14384 ?auto_14375 ) ) ( not ( = ?auto_14381 ?auto_14375 ) ) ( not ( = ?auto_14379 ?auto_14375 ) ) ( SURFACE-AT ?auto_14386 ?auto_14385 ) ( CLEAR ?auto_14386 ) ( IS-CRATE ?auto_14379 ) ( not ( = ?auto_14370 ?auto_14386 ) ) ( not ( = ?auto_14371 ?auto_14386 ) ) ( not ( = ?auto_14372 ?auto_14386 ) ) ( not ( = ?auto_14384 ?auto_14386 ) ) ( not ( = ?auto_14381 ?auto_14386 ) ) ( not ( = ?auto_14379 ?auto_14386 ) ) ( not ( = ?auto_14375 ?auto_14386 ) ) ( AVAILABLE ?auto_14377 ) ( TRUCK-AT ?auto_14378 ?auto_14382 ) ( LIFTING ?auto_14373 ?auto_14379 ) )
    :subtasks
    ( ( !LOAD ?auto_14373 ?auto_14379 ?auto_14378 ?auto_14382 )
      ( MAKE-ON ?auto_14370 ?auto_14371 )
      ( MAKE-ON-VERIFY ?auto_14370 ?auto_14371 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14387 - SURFACE
      ?auto_14388 - SURFACE
    )
    :vars
    (
      ?auto_14397 - HOIST
      ?auto_14394 - PLACE
      ?auto_14401 - PLACE
      ?auto_14392 - HOIST
      ?auto_14391 - SURFACE
      ?auto_14390 - SURFACE
      ?auto_14400 - PLACE
      ?auto_14403 - HOIST
      ?auto_14402 - SURFACE
      ?auto_14396 - SURFACE
      ?auto_14395 - PLACE
      ?auto_14393 - HOIST
      ?auto_14399 - SURFACE
      ?auto_14389 - SURFACE
      ?auto_14398 - TRUCK
      ?auto_14404 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14397 ?auto_14394 ) ( IS-CRATE ?auto_14387 ) ( not ( = ?auto_14387 ?auto_14388 ) ) ( not ( = ?auto_14401 ?auto_14394 ) ) ( HOIST-AT ?auto_14392 ?auto_14401 ) ( not ( = ?auto_14397 ?auto_14392 ) ) ( SURFACE-AT ?auto_14387 ?auto_14401 ) ( ON ?auto_14387 ?auto_14391 ) ( CLEAR ?auto_14387 ) ( not ( = ?auto_14387 ?auto_14391 ) ) ( not ( = ?auto_14388 ?auto_14391 ) ) ( IS-CRATE ?auto_14388 ) ( not ( = ?auto_14387 ?auto_14390 ) ) ( not ( = ?auto_14388 ?auto_14390 ) ) ( not ( = ?auto_14391 ?auto_14390 ) ) ( not ( = ?auto_14400 ?auto_14394 ) ) ( not ( = ?auto_14401 ?auto_14400 ) ) ( HOIST-AT ?auto_14403 ?auto_14400 ) ( not ( = ?auto_14397 ?auto_14403 ) ) ( not ( = ?auto_14392 ?auto_14403 ) ) ( AVAILABLE ?auto_14403 ) ( SURFACE-AT ?auto_14388 ?auto_14400 ) ( ON ?auto_14388 ?auto_14402 ) ( CLEAR ?auto_14388 ) ( not ( = ?auto_14387 ?auto_14402 ) ) ( not ( = ?auto_14388 ?auto_14402 ) ) ( not ( = ?auto_14391 ?auto_14402 ) ) ( not ( = ?auto_14390 ?auto_14402 ) ) ( IS-CRATE ?auto_14390 ) ( not ( = ?auto_14387 ?auto_14396 ) ) ( not ( = ?auto_14388 ?auto_14396 ) ) ( not ( = ?auto_14391 ?auto_14396 ) ) ( not ( = ?auto_14390 ?auto_14396 ) ) ( not ( = ?auto_14402 ?auto_14396 ) ) ( not ( = ?auto_14395 ?auto_14394 ) ) ( not ( = ?auto_14401 ?auto_14395 ) ) ( not ( = ?auto_14400 ?auto_14395 ) ) ( HOIST-AT ?auto_14393 ?auto_14395 ) ( not ( = ?auto_14397 ?auto_14393 ) ) ( not ( = ?auto_14392 ?auto_14393 ) ) ( not ( = ?auto_14403 ?auto_14393 ) ) ( AVAILABLE ?auto_14393 ) ( SURFACE-AT ?auto_14390 ?auto_14395 ) ( ON ?auto_14390 ?auto_14399 ) ( CLEAR ?auto_14390 ) ( not ( = ?auto_14387 ?auto_14399 ) ) ( not ( = ?auto_14388 ?auto_14399 ) ) ( not ( = ?auto_14391 ?auto_14399 ) ) ( not ( = ?auto_14390 ?auto_14399 ) ) ( not ( = ?auto_14402 ?auto_14399 ) ) ( not ( = ?auto_14396 ?auto_14399 ) ) ( SURFACE-AT ?auto_14389 ?auto_14394 ) ( CLEAR ?auto_14389 ) ( IS-CRATE ?auto_14396 ) ( not ( = ?auto_14387 ?auto_14389 ) ) ( not ( = ?auto_14388 ?auto_14389 ) ) ( not ( = ?auto_14391 ?auto_14389 ) ) ( not ( = ?auto_14390 ?auto_14389 ) ) ( not ( = ?auto_14402 ?auto_14389 ) ) ( not ( = ?auto_14396 ?auto_14389 ) ) ( not ( = ?auto_14399 ?auto_14389 ) ) ( AVAILABLE ?auto_14397 ) ( TRUCK-AT ?auto_14398 ?auto_14401 ) ( AVAILABLE ?auto_14392 ) ( SURFACE-AT ?auto_14396 ?auto_14401 ) ( ON ?auto_14396 ?auto_14404 ) ( CLEAR ?auto_14396 ) ( not ( = ?auto_14387 ?auto_14404 ) ) ( not ( = ?auto_14388 ?auto_14404 ) ) ( not ( = ?auto_14391 ?auto_14404 ) ) ( not ( = ?auto_14390 ?auto_14404 ) ) ( not ( = ?auto_14402 ?auto_14404 ) ) ( not ( = ?auto_14396 ?auto_14404 ) ) ( not ( = ?auto_14399 ?auto_14404 ) ) ( not ( = ?auto_14389 ?auto_14404 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14392 ?auto_14396 ?auto_14404 ?auto_14401 )
      ( MAKE-ON ?auto_14387 ?auto_14388 )
      ( MAKE-ON-VERIFY ?auto_14387 ?auto_14388 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14405 - SURFACE
      ?auto_14406 - SURFACE
    )
    :vars
    (
      ?auto_14414 - HOIST
      ?auto_14408 - PLACE
      ?auto_14411 - PLACE
      ?auto_14422 - HOIST
      ?auto_14420 - SURFACE
      ?auto_14421 - SURFACE
      ?auto_14418 - PLACE
      ?auto_14412 - HOIST
      ?auto_14415 - SURFACE
      ?auto_14409 - SURFACE
      ?auto_14416 - PLACE
      ?auto_14413 - HOIST
      ?auto_14419 - SURFACE
      ?auto_14407 - SURFACE
      ?auto_14417 - SURFACE
      ?auto_14410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14414 ?auto_14408 ) ( IS-CRATE ?auto_14405 ) ( not ( = ?auto_14405 ?auto_14406 ) ) ( not ( = ?auto_14411 ?auto_14408 ) ) ( HOIST-AT ?auto_14422 ?auto_14411 ) ( not ( = ?auto_14414 ?auto_14422 ) ) ( SURFACE-AT ?auto_14405 ?auto_14411 ) ( ON ?auto_14405 ?auto_14420 ) ( CLEAR ?auto_14405 ) ( not ( = ?auto_14405 ?auto_14420 ) ) ( not ( = ?auto_14406 ?auto_14420 ) ) ( IS-CRATE ?auto_14406 ) ( not ( = ?auto_14405 ?auto_14421 ) ) ( not ( = ?auto_14406 ?auto_14421 ) ) ( not ( = ?auto_14420 ?auto_14421 ) ) ( not ( = ?auto_14418 ?auto_14408 ) ) ( not ( = ?auto_14411 ?auto_14418 ) ) ( HOIST-AT ?auto_14412 ?auto_14418 ) ( not ( = ?auto_14414 ?auto_14412 ) ) ( not ( = ?auto_14422 ?auto_14412 ) ) ( AVAILABLE ?auto_14412 ) ( SURFACE-AT ?auto_14406 ?auto_14418 ) ( ON ?auto_14406 ?auto_14415 ) ( CLEAR ?auto_14406 ) ( not ( = ?auto_14405 ?auto_14415 ) ) ( not ( = ?auto_14406 ?auto_14415 ) ) ( not ( = ?auto_14420 ?auto_14415 ) ) ( not ( = ?auto_14421 ?auto_14415 ) ) ( IS-CRATE ?auto_14421 ) ( not ( = ?auto_14405 ?auto_14409 ) ) ( not ( = ?auto_14406 ?auto_14409 ) ) ( not ( = ?auto_14420 ?auto_14409 ) ) ( not ( = ?auto_14421 ?auto_14409 ) ) ( not ( = ?auto_14415 ?auto_14409 ) ) ( not ( = ?auto_14416 ?auto_14408 ) ) ( not ( = ?auto_14411 ?auto_14416 ) ) ( not ( = ?auto_14418 ?auto_14416 ) ) ( HOIST-AT ?auto_14413 ?auto_14416 ) ( not ( = ?auto_14414 ?auto_14413 ) ) ( not ( = ?auto_14422 ?auto_14413 ) ) ( not ( = ?auto_14412 ?auto_14413 ) ) ( AVAILABLE ?auto_14413 ) ( SURFACE-AT ?auto_14421 ?auto_14416 ) ( ON ?auto_14421 ?auto_14419 ) ( CLEAR ?auto_14421 ) ( not ( = ?auto_14405 ?auto_14419 ) ) ( not ( = ?auto_14406 ?auto_14419 ) ) ( not ( = ?auto_14420 ?auto_14419 ) ) ( not ( = ?auto_14421 ?auto_14419 ) ) ( not ( = ?auto_14415 ?auto_14419 ) ) ( not ( = ?auto_14409 ?auto_14419 ) ) ( SURFACE-AT ?auto_14407 ?auto_14408 ) ( CLEAR ?auto_14407 ) ( IS-CRATE ?auto_14409 ) ( not ( = ?auto_14405 ?auto_14407 ) ) ( not ( = ?auto_14406 ?auto_14407 ) ) ( not ( = ?auto_14420 ?auto_14407 ) ) ( not ( = ?auto_14421 ?auto_14407 ) ) ( not ( = ?auto_14415 ?auto_14407 ) ) ( not ( = ?auto_14409 ?auto_14407 ) ) ( not ( = ?auto_14419 ?auto_14407 ) ) ( AVAILABLE ?auto_14414 ) ( AVAILABLE ?auto_14422 ) ( SURFACE-AT ?auto_14409 ?auto_14411 ) ( ON ?auto_14409 ?auto_14417 ) ( CLEAR ?auto_14409 ) ( not ( = ?auto_14405 ?auto_14417 ) ) ( not ( = ?auto_14406 ?auto_14417 ) ) ( not ( = ?auto_14420 ?auto_14417 ) ) ( not ( = ?auto_14421 ?auto_14417 ) ) ( not ( = ?auto_14415 ?auto_14417 ) ) ( not ( = ?auto_14409 ?auto_14417 ) ) ( not ( = ?auto_14419 ?auto_14417 ) ) ( not ( = ?auto_14407 ?auto_14417 ) ) ( TRUCK-AT ?auto_14410 ?auto_14408 ) )
    :subtasks
    ( ( !DRIVE ?auto_14410 ?auto_14408 ?auto_14411 )
      ( MAKE-ON ?auto_14405 ?auto_14406 )
      ( MAKE-ON-VERIFY ?auto_14405 ?auto_14406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14423 - SURFACE
      ?auto_14424 - SURFACE
    )
    :vars
    (
      ?auto_14429 - HOIST
      ?auto_14427 - PLACE
      ?auto_14440 - PLACE
      ?auto_14426 - HOIST
      ?auto_14425 - SURFACE
      ?auto_14434 - SURFACE
      ?auto_14430 - PLACE
      ?auto_14431 - HOIST
      ?auto_14439 - SURFACE
      ?auto_14437 - SURFACE
      ?auto_14433 - PLACE
      ?auto_14438 - HOIST
      ?auto_14428 - SURFACE
      ?auto_14432 - SURFACE
      ?auto_14435 - SURFACE
      ?auto_14436 - TRUCK
      ?auto_14441 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14429 ?auto_14427 ) ( IS-CRATE ?auto_14423 ) ( not ( = ?auto_14423 ?auto_14424 ) ) ( not ( = ?auto_14440 ?auto_14427 ) ) ( HOIST-AT ?auto_14426 ?auto_14440 ) ( not ( = ?auto_14429 ?auto_14426 ) ) ( SURFACE-AT ?auto_14423 ?auto_14440 ) ( ON ?auto_14423 ?auto_14425 ) ( CLEAR ?auto_14423 ) ( not ( = ?auto_14423 ?auto_14425 ) ) ( not ( = ?auto_14424 ?auto_14425 ) ) ( IS-CRATE ?auto_14424 ) ( not ( = ?auto_14423 ?auto_14434 ) ) ( not ( = ?auto_14424 ?auto_14434 ) ) ( not ( = ?auto_14425 ?auto_14434 ) ) ( not ( = ?auto_14430 ?auto_14427 ) ) ( not ( = ?auto_14440 ?auto_14430 ) ) ( HOIST-AT ?auto_14431 ?auto_14430 ) ( not ( = ?auto_14429 ?auto_14431 ) ) ( not ( = ?auto_14426 ?auto_14431 ) ) ( AVAILABLE ?auto_14431 ) ( SURFACE-AT ?auto_14424 ?auto_14430 ) ( ON ?auto_14424 ?auto_14439 ) ( CLEAR ?auto_14424 ) ( not ( = ?auto_14423 ?auto_14439 ) ) ( not ( = ?auto_14424 ?auto_14439 ) ) ( not ( = ?auto_14425 ?auto_14439 ) ) ( not ( = ?auto_14434 ?auto_14439 ) ) ( IS-CRATE ?auto_14434 ) ( not ( = ?auto_14423 ?auto_14437 ) ) ( not ( = ?auto_14424 ?auto_14437 ) ) ( not ( = ?auto_14425 ?auto_14437 ) ) ( not ( = ?auto_14434 ?auto_14437 ) ) ( not ( = ?auto_14439 ?auto_14437 ) ) ( not ( = ?auto_14433 ?auto_14427 ) ) ( not ( = ?auto_14440 ?auto_14433 ) ) ( not ( = ?auto_14430 ?auto_14433 ) ) ( HOIST-AT ?auto_14438 ?auto_14433 ) ( not ( = ?auto_14429 ?auto_14438 ) ) ( not ( = ?auto_14426 ?auto_14438 ) ) ( not ( = ?auto_14431 ?auto_14438 ) ) ( AVAILABLE ?auto_14438 ) ( SURFACE-AT ?auto_14434 ?auto_14433 ) ( ON ?auto_14434 ?auto_14428 ) ( CLEAR ?auto_14434 ) ( not ( = ?auto_14423 ?auto_14428 ) ) ( not ( = ?auto_14424 ?auto_14428 ) ) ( not ( = ?auto_14425 ?auto_14428 ) ) ( not ( = ?auto_14434 ?auto_14428 ) ) ( not ( = ?auto_14439 ?auto_14428 ) ) ( not ( = ?auto_14437 ?auto_14428 ) ) ( IS-CRATE ?auto_14437 ) ( not ( = ?auto_14423 ?auto_14432 ) ) ( not ( = ?auto_14424 ?auto_14432 ) ) ( not ( = ?auto_14425 ?auto_14432 ) ) ( not ( = ?auto_14434 ?auto_14432 ) ) ( not ( = ?auto_14439 ?auto_14432 ) ) ( not ( = ?auto_14437 ?auto_14432 ) ) ( not ( = ?auto_14428 ?auto_14432 ) ) ( AVAILABLE ?auto_14426 ) ( SURFACE-AT ?auto_14437 ?auto_14440 ) ( ON ?auto_14437 ?auto_14435 ) ( CLEAR ?auto_14437 ) ( not ( = ?auto_14423 ?auto_14435 ) ) ( not ( = ?auto_14424 ?auto_14435 ) ) ( not ( = ?auto_14425 ?auto_14435 ) ) ( not ( = ?auto_14434 ?auto_14435 ) ) ( not ( = ?auto_14439 ?auto_14435 ) ) ( not ( = ?auto_14437 ?auto_14435 ) ) ( not ( = ?auto_14428 ?auto_14435 ) ) ( not ( = ?auto_14432 ?auto_14435 ) ) ( TRUCK-AT ?auto_14436 ?auto_14427 ) ( SURFACE-AT ?auto_14441 ?auto_14427 ) ( CLEAR ?auto_14441 ) ( LIFTING ?auto_14429 ?auto_14432 ) ( IS-CRATE ?auto_14432 ) ( not ( = ?auto_14423 ?auto_14441 ) ) ( not ( = ?auto_14424 ?auto_14441 ) ) ( not ( = ?auto_14425 ?auto_14441 ) ) ( not ( = ?auto_14434 ?auto_14441 ) ) ( not ( = ?auto_14439 ?auto_14441 ) ) ( not ( = ?auto_14437 ?auto_14441 ) ) ( not ( = ?auto_14428 ?auto_14441 ) ) ( not ( = ?auto_14432 ?auto_14441 ) ) ( not ( = ?auto_14435 ?auto_14441 ) ) )
    :subtasks
    ( ( !DROP ?auto_14429 ?auto_14432 ?auto_14441 ?auto_14427 )
      ( MAKE-ON ?auto_14423 ?auto_14424 )
      ( MAKE-ON-VERIFY ?auto_14423 ?auto_14424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14442 - SURFACE
      ?auto_14443 - SURFACE
    )
    :vars
    (
      ?auto_14450 - HOIST
      ?auto_14448 - PLACE
      ?auto_14453 - PLACE
      ?auto_14451 - HOIST
      ?auto_14459 - SURFACE
      ?auto_14455 - SURFACE
      ?auto_14444 - PLACE
      ?auto_14452 - HOIST
      ?auto_14456 - SURFACE
      ?auto_14457 - SURFACE
      ?auto_14458 - PLACE
      ?auto_14446 - HOIST
      ?auto_14449 - SURFACE
      ?auto_14447 - SURFACE
      ?auto_14445 - SURFACE
      ?auto_14454 - TRUCK
      ?auto_14460 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14450 ?auto_14448 ) ( IS-CRATE ?auto_14442 ) ( not ( = ?auto_14442 ?auto_14443 ) ) ( not ( = ?auto_14453 ?auto_14448 ) ) ( HOIST-AT ?auto_14451 ?auto_14453 ) ( not ( = ?auto_14450 ?auto_14451 ) ) ( SURFACE-AT ?auto_14442 ?auto_14453 ) ( ON ?auto_14442 ?auto_14459 ) ( CLEAR ?auto_14442 ) ( not ( = ?auto_14442 ?auto_14459 ) ) ( not ( = ?auto_14443 ?auto_14459 ) ) ( IS-CRATE ?auto_14443 ) ( not ( = ?auto_14442 ?auto_14455 ) ) ( not ( = ?auto_14443 ?auto_14455 ) ) ( not ( = ?auto_14459 ?auto_14455 ) ) ( not ( = ?auto_14444 ?auto_14448 ) ) ( not ( = ?auto_14453 ?auto_14444 ) ) ( HOIST-AT ?auto_14452 ?auto_14444 ) ( not ( = ?auto_14450 ?auto_14452 ) ) ( not ( = ?auto_14451 ?auto_14452 ) ) ( AVAILABLE ?auto_14452 ) ( SURFACE-AT ?auto_14443 ?auto_14444 ) ( ON ?auto_14443 ?auto_14456 ) ( CLEAR ?auto_14443 ) ( not ( = ?auto_14442 ?auto_14456 ) ) ( not ( = ?auto_14443 ?auto_14456 ) ) ( not ( = ?auto_14459 ?auto_14456 ) ) ( not ( = ?auto_14455 ?auto_14456 ) ) ( IS-CRATE ?auto_14455 ) ( not ( = ?auto_14442 ?auto_14457 ) ) ( not ( = ?auto_14443 ?auto_14457 ) ) ( not ( = ?auto_14459 ?auto_14457 ) ) ( not ( = ?auto_14455 ?auto_14457 ) ) ( not ( = ?auto_14456 ?auto_14457 ) ) ( not ( = ?auto_14458 ?auto_14448 ) ) ( not ( = ?auto_14453 ?auto_14458 ) ) ( not ( = ?auto_14444 ?auto_14458 ) ) ( HOIST-AT ?auto_14446 ?auto_14458 ) ( not ( = ?auto_14450 ?auto_14446 ) ) ( not ( = ?auto_14451 ?auto_14446 ) ) ( not ( = ?auto_14452 ?auto_14446 ) ) ( AVAILABLE ?auto_14446 ) ( SURFACE-AT ?auto_14455 ?auto_14458 ) ( ON ?auto_14455 ?auto_14449 ) ( CLEAR ?auto_14455 ) ( not ( = ?auto_14442 ?auto_14449 ) ) ( not ( = ?auto_14443 ?auto_14449 ) ) ( not ( = ?auto_14459 ?auto_14449 ) ) ( not ( = ?auto_14455 ?auto_14449 ) ) ( not ( = ?auto_14456 ?auto_14449 ) ) ( not ( = ?auto_14457 ?auto_14449 ) ) ( IS-CRATE ?auto_14457 ) ( not ( = ?auto_14442 ?auto_14447 ) ) ( not ( = ?auto_14443 ?auto_14447 ) ) ( not ( = ?auto_14459 ?auto_14447 ) ) ( not ( = ?auto_14455 ?auto_14447 ) ) ( not ( = ?auto_14456 ?auto_14447 ) ) ( not ( = ?auto_14457 ?auto_14447 ) ) ( not ( = ?auto_14449 ?auto_14447 ) ) ( AVAILABLE ?auto_14451 ) ( SURFACE-AT ?auto_14457 ?auto_14453 ) ( ON ?auto_14457 ?auto_14445 ) ( CLEAR ?auto_14457 ) ( not ( = ?auto_14442 ?auto_14445 ) ) ( not ( = ?auto_14443 ?auto_14445 ) ) ( not ( = ?auto_14459 ?auto_14445 ) ) ( not ( = ?auto_14455 ?auto_14445 ) ) ( not ( = ?auto_14456 ?auto_14445 ) ) ( not ( = ?auto_14457 ?auto_14445 ) ) ( not ( = ?auto_14449 ?auto_14445 ) ) ( not ( = ?auto_14447 ?auto_14445 ) ) ( TRUCK-AT ?auto_14454 ?auto_14448 ) ( SURFACE-AT ?auto_14460 ?auto_14448 ) ( CLEAR ?auto_14460 ) ( IS-CRATE ?auto_14447 ) ( not ( = ?auto_14442 ?auto_14460 ) ) ( not ( = ?auto_14443 ?auto_14460 ) ) ( not ( = ?auto_14459 ?auto_14460 ) ) ( not ( = ?auto_14455 ?auto_14460 ) ) ( not ( = ?auto_14456 ?auto_14460 ) ) ( not ( = ?auto_14457 ?auto_14460 ) ) ( not ( = ?auto_14449 ?auto_14460 ) ) ( not ( = ?auto_14447 ?auto_14460 ) ) ( not ( = ?auto_14445 ?auto_14460 ) ) ( AVAILABLE ?auto_14450 ) ( IN ?auto_14447 ?auto_14454 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14450 ?auto_14447 ?auto_14454 ?auto_14448 )
      ( MAKE-ON ?auto_14442 ?auto_14443 )
      ( MAKE-ON-VERIFY ?auto_14442 ?auto_14443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14461 - SURFACE
      ?auto_14462 - SURFACE
    )
    :vars
    (
      ?auto_14470 - HOIST
      ?auto_14467 - PLACE
      ?auto_14472 - PLACE
      ?auto_14464 - HOIST
      ?auto_14476 - SURFACE
      ?auto_14479 - SURFACE
      ?auto_14477 - PLACE
      ?auto_14478 - HOIST
      ?auto_14475 - SURFACE
      ?auto_14466 - SURFACE
      ?auto_14463 - PLACE
      ?auto_14473 - HOIST
      ?auto_14469 - SURFACE
      ?auto_14474 - SURFACE
      ?auto_14465 - SURFACE
      ?auto_14468 - SURFACE
      ?auto_14471 - TRUCK
      ?auto_14480 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14470 ?auto_14467 ) ( IS-CRATE ?auto_14461 ) ( not ( = ?auto_14461 ?auto_14462 ) ) ( not ( = ?auto_14472 ?auto_14467 ) ) ( HOIST-AT ?auto_14464 ?auto_14472 ) ( not ( = ?auto_14470 ?auto_14464 ) ) ( SURFACE-AT ?auto_14461 ?auto_14472 ) ( ON ?auto_14461 ?auto_14476 ) ( CLEAR ?auto_14461 ) ( not ( = ?auto_14461 ?auto_14476 ) ) ( not ( = ?auto_14462 ?auto_14476 ) ) ( IS-CRATE ?auto_14462 ) ( not ( = ?auto_14461 ?auto_14479 ) ) ( not ( = ?auto_14462 ?auto_14479 ) ) ( not ( = ?auto_14476 ?auto_14479 ) ) ( not ( = ?auto_14477 ?auto_14467 ) ) ( not ( = ?auto_14472 ?auto_14477 ) ) ( HOIST-AT ?auto_14478 ?auto_14477 ) ( not ( = ?auto_14470 ?auto_14478 ) ) ( not ( = ?auto_14464 ?auto_14478 ) ) ( AVAILABLE ?auto_14478 ) ( SURFACE-AT ?auto_14462 ?auto_14477 ) ( ON ?auto_14462 ?auto_14475 ) ( CLEAR ?auto_14462 ) ( not ( = ?auto_14461 ?auto_14475 ) ) ( not ( = ?auto_14462 ?auto_14475 ) ) ( not ( = ?auto_14476 ?auto_14475 ) ) ( not ( = ?auto_14479 ?auto_14475 ) ) ( IS-CRATE ?auto_14479 ) ( not ( = ?auto_14461 ?auto_14466 ) ) ( not ( = ?auto_14462 ?auto_14466 ) ) ( not ( = ?auto_14476 ?auto_14466 ) ) ( not ( = ?auto_14479 ?auto_14466 ) ) ( not ( = ?auto_14475 ?auto_14466 ) ) ( not ( = ?auto_14463 ?auto_14467 ) ) ( not ( = ?auto_14472 ?auto_14463 ) ) ( not ( = ?auto_14477 ?auto_14463 ) ) ( HOIST-AT ?auto_14473 ?auto_14463 ) ( not ( = ?auto_14470 ?auto_14473 ) ) ( not ( = ?auto_14464 ?auto_14473 ) ) ( not ( = ?auto_14478 ?auto_14473 ) ) ( AVAILABLE ?auto_14473 ) ( SURFACE-AT ?auto_14479 ?auto_14463 ) ( ON ?auto_14479 ?auto_14469 ) ( CLEAR ?auto_14479 ) ( not ( = ?auto_14461 ?auto_14469 ) ) ( not ( = ?auto_14462 ?auto_14469 ) ) ( not ( = ?auto_14476 ?auto_14469 ) ) ( not ( = ?auto_14479 ?auto_14469 ) ) ( not ( = ?auto_14475 ?auto_14469 ) ) ( not ( = ?auto_14466 ?auto_14469 ) ) ( IS-CRATE ?auto_14466 ) ( not ( = ?auto_14461 ?auto_14474 ) ) ( not ( = ?auto_14462 ?auto_14474 ) ) ( not ( = ?auto_14476 ?auto_14474 ) ) ( not ( = ?auto_14479 ?auto_14474 ) ) ( not ( = ?auto_14475 ?auto_14474 ) ) ( not ( = ?auto_14466 ?auto_14474 ) ) ( not ( = ?auto_14469 ?auto_14474 ) ) ( AVAILABLE ?auto_14464 ) ( SURFACE-AT ?auto_14466 ?auto_14472 ) ( ON ?auto_14466 ?auto_14465 ) ( CLEAR ?auto_14466 ) ( not ( = ?auto_14461 ?auto_14465 ) ) ( not ( = ?auto_14462 ?auto_14465 ) ) ( not ( = ?auto_14476 ?auto_14465 ) ) ( not ( = ?auto_14479 ?auto_14465 ) ) ( not ( = ?auto_14475 ?auto_14465 ) ) ( not ( = ?auto_14466 ?auto_14465 ) ) ( not ( = ?auto_14469 ?auto_14465 ) ) ( not ( = ?auto_14474 ?auto_14465 ) ) ( SURFACE-AT ?auto_14468 ?auto_14467 ) ( CLEAR ?auto_14468 ) ( IS-CRATE ?auto_14474 ) ( not ( = ?auto_14461 ?auto_14468 ) ) ( not ( = ?auto_14462 ?auto_14468 ) ) ( not ( = ?auto_14476 ?auto_14468 ) ) ( not ( = ?auto_14479 ?auto_14468 ) ) ( not ( = ?auto_14475 ?auto_14468 ) ) ( not ( = ?auto_14466 ?auto_14468 ) ) ( not ( = ?auto_14469 ?auto_14468 ) ) ( not ( = ?auto_14474 ?auto_14468 ) ) ( not ( = ?auto_14465 ?auto_14468 ) ) ( AVAILABLE ?auto_14470 ) ( IN ?auto_14474 ?auto_14471 ) ( TRUCK-AT ?auto_14471 ?auto_14480 ) ( not ( = ?auto_14480 ?auto_14467 ) ) ( not ( = ?auto_14472 ?auto_14480 ) ) ( not ( = ?auto_14477 ?auto_14480 ) ) ( not ( = ?auto_14463 ?auto_14480 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14471 ?auto_14480 ?auto_14467 )
      ( MAKE-ON ?auto_14461 ?auto_14462 )
      ( MAKE-ON-VERIFY ?auto_14461 ?auto_14462 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14481 - SURFACE
      ?auto_14482 - SURFACE
    )
    :vars
    (
      ?auto_14486 - HOIST
      ?auto_14494 - PLACE
      ?auto_14492 - PLACE
      ?auto_14490 - HOIST
      ?auto_14488 - SURFACE
      ?auto_14500 - SURFACE
      ?auto_14498 - PLACE
      ?auto_14485 - HOIST
      ?auto_14489 - SURFACE
      ?auto_14495 - SURFACE
      ?auto_14483 - PLACE
      ?auto_14497 - HOIST
      ?auto_14499 - SURFACE
      ?auto_14491 - SURFACE
      ?auto_14487 - SURFACE
      ?auto_14496 - SURFACE
      ?auto_14484 - TRUCK
      ?auto_14493 - PLACE
      ?auto_14501 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14486 ?auto_14494 ) ( IS-CRATE ?auto_14481 ) ( not ( = ?auto_14481 ?auto_14482 ) ) ( not ( = ?auto_14492 ?auto_14494 ) ) ( HOIST-AT ?auto_14490 ?auto_14492 ) ( not ( = ?auto_14486 ?auto_14490 ) ) ( SURFACE-AT ?auto_14481 ?auto_14492 ) ( ON ?auto_14481 ?auto_14488 ) ( CLEAR ?auto_14481 ) ( not ( = ?auto_14481 ?auto_14488 ) ) ( not ( = ?auto_14482 ?auto_14488 ) ) ( IS-CRATE ?auto_14482 ) ( not ( = ?auto_14481 ?auto_14500 ) ) ( not ( = ?auto_14482 ?auto_14500 ) ) ( not ( = ?auto_14488 ?auto_14500 ) ) ( not ( = ?auto_14498 ?auto_14494 ) ) ( not ( = ?auto_14492 ?auto_14498 ) ) ( HOIST-AT ?auto_14485 ?auto_14498 ) ( not ( = ?auto_14486 ?auto_14485 ) ) ( not ( = ?auto_14490 ?auto_14485 ) ) ( AVAILABLE ?auto_14485 ) ( SURFACE-AT ?auto_14482 ?auto_14498 ) ( ON ?auto_14482 ?auto_14489 ) ( CLEAR ?auto_14482 ) ( not ( = ?auto_14481 ?auto_14489 ) ) ( not ( = ?auto_14482 ?auto_14489 ) ) ( not ( = ?auto_14488 ?auto_14489 ) ) ( not ( = ?auto_14500 ?auto_14489 ) ) ( IS-CRATE ?auto_14500 ) ( not ( = ?auto_14481 ?auto_14495 ) ) ( not ( = ?auto_14482 ?auto_14495 ) ) ( not ( = ?auto_14488 ?auto_14495 ) ) ( not ( = ?auto_14500 ?auto_14495 ) ) ( not ( = ?auto_14489 ?auto_14495 ) ) ( not ( = ?auto_14483 ?auto_14494 ) ) ( not ( = ?auto_14492 ?auto_14483 ) ) ( not ( = ?auto_14498 ?auto_14483 ) ) ( HOIST-AT ?auto_14497 ?auto_14483 ) ( not ( = ?auto_14486 ?auto_14497 ) ) ( not ( = ?auto_14490 ?auto_14497 ) ) ( not ( = ?auto_14485 ?auto_14497 ) ) ( AVAILABLE ?auto_14497 ) ( SURFACE-AT ?auto_14500 ?auto_14483 ) ( ON ?auto_14500 ?auto_14499 ) ( CLEAR ?auto_14500 ) ( not ( = ?auto_14481 ?auto_14499 ) ) ( not ( = ?auto_14482 ?auto_14499 ) ) ( not ( = ?auto_14488 ?auto_14499 ) ) ( not ( = ?auto_14500 ?auto_14499 ) ) ( not ( = ?auto_14489 ?auto_14499 ) ) ( not ( = ?auto_14495 ?auto_14499 ) ) ( IS-CRATE ?auto_14495 ) ( not ( = ?auto_14481 ?auto_14491 ) ) ( not ( = ?auto_14482 ?auto_14491 ) ) ( not ( = ?auto_14488 ?auto_14491 ) ) ( not ( = ?auto_14500 ?auto_14491 ) ) ( not ( = ?auto_14489 ?auto_14491 ) ) ( not ( = ?auto_14495 ?auto_14491 ) ) ( not ( = ?auto_14499 ?auto_14491 ) ) ( AVAILABLE ?auto_14490 ) ( SURFACE-AT ?auto_14495 ?auto_14492 ) ( ON ?auto_14495 ?auto_14487 ) ( CLEAR ?auto_14495 ) ( not ( = ?auto_14481 ?auto_14487 ) ) ( not ( = ?auto_14482 ?auto_14487 ) ) ( not ( = ?auto_14488 ?auto_14487 ) ) ( not ( = ?auto_14500 ?auto_14487 ) ) ( not ( = ?auto_14489 ?auto_14487 ) ) ( not ( = ?auto_14495 ?auto_14487 ) ) ( not ( = ?auto_14499 ?auto_14487 ) ) ( not ( = ?auto_14491 ?auto_14487 ) ) ( SURFACE-AT ?auto_14496 ?auto_14494 ) ( CLEAR ?auto_14496 ) ( IS-CRATE ?auto_14491 ) ( not ( = ?auto_14481 ?auto_14496 ) ) ( not ( = ?auto_14482 ?auto_14496 ) ) ( not ( = ?auto_14488 ?auto_14496 ) ) ( not ( = ?auto_14500 ?auto_14496 ) ) ( not ( = ?auto_14489 ?auto_14496 ) ) ( not ( = ?auto_14495 ?auto_14496 ) ) ( not ( = ?auto_14499 ?auto_14496 ) ) ( not ( = ?auto_14491 ?auto_14496 ) ) ( not ( = ?auto_14487 ?auto_14496 ) ) ( AVAILABLE ?auto_14486 ) ( TRUCK-AT ?auto_14484 ?auto_14493 ) ( not ( = ?auto_14493 ?auto_14494 ) ) ( not ( = ?auto_14492 ?auto_14493 ) ) ( not ( = ?auto_14498 ?auto_14493 ) ) ( not ( = ?auto_14483 ?auto_14493 ) ) ( HOIST-AT ?auto_14501 ?auto_14493 ) ( LIFTING ?auto_14501 ?auto_14491 ) ( not ( = ?auto_14486 ?auto_14501 ) ) ( not ( = ?auto_14490 ?auto_14501 ) ) ( not ( = ?auto_14485 ?auto_14501 ) ) ( not ( = ?auto_14497 ?auto_14501 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14501 ?auto_14491 ?auto_14484 ?auto_14493 )
      ( MAKE-ON ?auto_14481 ?auto_14482 )
      ( MAKE-ON-VERIFY ?auto_14481 ?auto_14482 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14502 - SURFACE
      ?auto_14503 - SURFACE
    )
    :vars
    (
      ?auto_14512 - HOIST
      ?auto_14519 - PLACE
      ?auto_14509 - PLACE
      ?auto_14513 - HOIST
      ?auto_14517 - SURFACE
      ?auto_14516 - SURFACE
      ?auto_14520 - PLACE
      ?auto_14511 - HOIST
      ?auto_14504 - SURFACE
      ?auto_14510 - SURFACE
      ?auto_14506 - PLACE
      ?auto_14508 - HOIST
      ?auto_14521 - SURFACE
      ?auto_14505 - SURFACE
      ?auto_14522 - SURFACE
      ?auto_14514 - SURFACE
      ?auto_14518 - TRUCK
      ?auto_14507 - PLACE
      ?auto_14515 - HOIST
      ?auto_14523 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14512 ?auto_14519 ) ( IS-CRATE ?auto_14502 ) ( not ( = ?auto_14502 ?auto_14503 ) ) ( not ( = ?auto_14509 ?auto_14519 ) ) ( HOIST-AT ?auto_14513 ?auto_14509 ) ( not ( = ?auto_14512 ?auto_14513 ) ) ( SURFACE-AT ?auto_14502 ?auto_14509 ) ( ON ?auto_14502 ?auto_14517 ) ( CLEAR ?auto_14502 ) ( not ( = ?auto_14502 ?auto_14517 ) ) ( not ( = ?auto_14503 ?auto_14517 ) ) ( IS-CRATE ?auto_14503 ) ( not ( = ?auto_14502 ?auto_14516 ) ) ( not ( = ?auto_14503 ?auto_14516 ) ) ( not ( = ?auto_14517 ?auto_14516 ) ) ( not ( = ?auto_14520 ?auto_14519 ) ) ( not ( = ?auto_14509 ?auto_14520 ) ) ( HOIST-AT ?auto_14511 ?auto_14520 ) ( not ( = ?auto_14512 ?auto_14511 ) ) ( not ( = ?auto_14513 ?auto_14511 ) ) ( AVAILABLE ?auto_14511 ) ( SURFACE-AT ?auto_14503 ?auto_14520 ) ( ON ?auto_14503 ?auto_14504 ) ( CLEAR ?auto_14503 ) ( not ( = ?auto_14502 ?auto_14504 ) ) ( not ( = ?auto_14503 ?auto_14504 ) ) ( not ( = ?auto_14517 ?auto_14504 ) ) ( not ( = ?auto_14516 ?auto_14504 ) ) ( IS-CRATE ?auto_14516 ) ( not ( = ?auto_14502 ?auto_14510 ) ) ( not ( = ?auto_14503 ?auto_14510 ) ) ( not ( = ?auto_14517 ?auto_14510 ) ) ( not ( = ?auto_14516 ?auto_14510 ) ) ( not ( = ?auto_14504 ?auto_14510 ) ) ( not ( = ?auto_14506 ?auto_14519 ) ) ( not ( = ?auto_14509 ?auto_14506 ) ) ( not ( = ?auto_14520 ?auto_14506 ) ) ( HOIST-AT ?auto_14508 ?auto_14506 ) ( not ( = ?auto_14512 ?auto_14508 ) ) ( not ( = ?auto_14513 ?auto_14508 ) ) ( not ( = ?auto_14511 ?auto_14508 ) ) ( AVAILABLE ?auto_14508 ) ( SURFACE-AT ?auto_14516 ?auto_14506 ) ( ON ?auto_14516 ?auto_14521 ) ( CLEAR ?auto_14516 ) ( not ( = ?auto_14502 ?auto_14521 ) ) ( not ( = ?auto_14503 ?auto_14521 ) ) ( not ( = ?auto_14517 ?auto_14521 ) ) ( not ( = ?auto_14516 ?auto_14521 ) ) ( not ( = ?auto_14504 ?auto_14521 ) ) ( not ( = ?auto_14510 ?auto_14521 ) ) ( IS-CRATE ?auto_14510 ) ( not ( = ?auto_14502 ?auto_14505 ) ) ( not ( = ?auto_14503 ?auto_14505 ) ) ( not ( = ?auto_14517 ?auto_14505 ) ) ( not ( = ?auto_14516 ?auto_14505 ) ) ( not ( = ?auto_14504 ?auto_14505 ) ) ( not ( = ?auto_14510 ?auto_14505 ) ) ( not ( = ?auto_14521 ?auto_14505 ) ) ( AVAILABLE ?auto_14513 ) ( SURFACE-AT ?auto_14510 ?auto_14509 ) ( ON ?auto_14510 ?auto_14522 ) ( CLEAR ?auto_14510 ) ( not ( = ?auto_14502 ?auto_14522 ) ) ( not ( = ?auto_14503 ?auto_14522 ) ) ( not ( = ?auto_14517 ?auto_14522 ) ) ( not ( = ?auto_14516 ?auto_14522 ) ) ( not ( = ?auto_14504 ?auto_14522 ) ) ( not ( = ?auto_14510 ?auto_14522 ) ) ( not ( = ?auto_14521 ?auto_14522 ) ) ( not ( = ?auto_14505 ?auto_14522 ) ) ( SURFACE-AT ?auto_14514 ?auto_14519 ) ( CLEAR ?auto_14514 ) ( IS-CRATE ?auto_14505 ) ( not ( = ?auto_14502 ?auto_14514 ) ) ( not ( = ?auto_14503 ?auto_14514 ) ) ( not ( = ?auto_14517 ?auto_14514 ) ) ( not ( = ?auto_14516 ?auto_14514 ) ) ( not ( = ?auto_14504 ?auto_14514 ) ) ( not ( = ?auto_14510 ?auto_14514 ) ) ( not ( = ?auto_14521 ?auto_14514 ) ) ( not ( = ?auto_14505 ?auto_14514 ) ) ( not ( = ?auto_14522 ?auto_14514 ) ) ( AVAILABLE ?auto_14512 ) ( TRUCK-AT ?auto_14518 ?auto_14507 ) ( not ( = ?auto_14507 ?auto_14519 ) ) ( not ( = ?auto_14509 ?auto_14507 ) ) ( not ( = ?auto_14520 ?auto_14507 ) ) ( not ( = ?auto_14506 ?auto_14507 ) ) ( HOIST-AT ?auto_14515 ?auto_14507 ) ( not ( = ?auto_14512 ?auto_14515 ) ) ( not ( = ?auto_14513 ?auto_14515 ) ) ( not ( = ?auto_14511 ?auto_14515 ) ) ( not ( = ?auto_14508 ?auto_14515 ) ) ( AVAILABLE ?auto_14515 ) ( SURFACE-AT ?auto_14505 ?auto_14507 ) ( ON ?auto_14505 ?auto_14523 ) ( CLEAR ?auto_14505 ) ( not ( = ?auto_14502 ?auto_14523 ) ) ( not ( = ?auto_14503 ?auto_14523 ) ) ( not ( = ?auto_14517 ?auto_14523 ) ) ( not ( = ?auto_14516 ?auto_14523 ) ) ( not ( = ?auto_14504 ?auto_14523 ) ) ( not ( = ?auto_14510 ?auto_14523 ) ) ( not ( = ?auto_14521 ?auto_14523 ) ) ( not ( = ?auto_14505 ?auto_14523 ) ) ( not ( = ?auto_14522 ?auto_14523 ) ) ( not ( = ?auto_14514 ?auto_14523 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14515 ?auto_14505 ?auto_14523 ?auto_14507 )
      ( MAKE-ON ?auto_14502 ?auto_14503 )
      ( MAKE-ON-VERIFY ?auto_14502 ?auto_14503 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14524 - SURFACE
      ?auto_14525 - SURFACE
    )
    :vars
    (
      ?auto_14541 - HOIST
      ?auto_14536 - PLACE
      ?auto_14537 - PLACE
      ?auto_14544 - HOIST
      ?auto_14539 - SURFACE
      ?auto_14526 - SURFACE
      ?auto_14529 - PLACE
      ?auto_14531 - HOIST
      ?auto_14542 - SURFACE
      ?auto_14535 - SURFACE
      ?auto_14533 - PLACE
      ?auto_14540 - HOIST
      ?auto_14532 - SURFACE
      ?auto_14527 - SURFACE
      ?auto_14530 - SURFACE
      ?auto_14538 - SURFACE
      ?auto_14545 - PLACE
      ?auto_14528 - HOIST
      ?auto_14543 - SURFACE
      ?auto_14534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14541 ?auto_14536 ) ( IS-CRATE ?auto_14524 ) ( not ( = ?auto_14524 ?auto_14525 ) ) ( not ( = ?auto_14537 ?auto_14536 ) ) ( HOIST-AT ?auto_14544 ?auto_14537 ) ( not ( = ?auto_14541 ?auto_14544 ) ) ( SURFACE-AT ?auto_14524 ?auto_14537 ) ( ON ?auto_14524 ?auto_14539 ) ( CLEAR ?auto_14524 ) ( not ( = ?auto_14524 ?auto_14539 ) ) ( not ( = ?auto_14525 ?auto_14539 ) ) ( IS-CRATE ?auto_14525 ) ( not ( = ?auto_14524 ?auto_14526 ) ) ( not ( = ?auto_14525 ?auto_14526 ) ) ( not ( = ?auto_14539 ?auto_14526 ) ) ( not ( = ?auto_14529 ?auto_14536 ) ) ( not ( = ?auto_14537 ?auto_14529 ) ) ( HOIST-AT ?auto_14531 ?auto_14529 ) ( not ( = ?auto_14541 ?auto_14531 ) ) ( not ( = ?auto_14544 ?auto_14531 ) ) ( AVAILABLE ?auto_14531 ) ( SURFACE-AT ?auto_14525 ?auto_14529 ) ( ON ?auto_14525 ?auto_14542 ) ( CLEAR ?auto_14525 ) ( not ( = ?auto_14524 ?auto_14542 ) ) ( not ( = ?auto_14525 ?auto_14542 ) ) ( not ( = ?auto_14539 ?auto_14542 ) ) ( not ( = ?auto_14526 ?auto_14542 ) ) ( IS-CRATE ?auto_14526 ) ( not ( = ?auto_14524 ?auto_14535 ) ) ( not ( = ?auto_14525 ?auto_14535 ) ) ( not ( = ?auto_14539 ?auto_14535 ) ) ( not ( = ?auto_14526 ?auto_14535 ) ) ( not ( = ?auto_14542 ?auto_14535 ) ) ( not ( = ?auto_14533 ?auto_14536 ) ) ( not ( = ?auto_14537 ?auto_14533 ) ) ( not ( = ?auto_14529 ?auto_14533 ) ) ( HOIST-AT ?auto_14540 ?auto_14533 ) ( not ( = ?auto_14541 ?auto_14540 ) ) ( not ( = ?auto_14544 ?auto_14540 ) ) ( not ( = ?auto_14531 ?auto_14540 ) ) ( AVAILABLE ?auto_14540 ) ( SURFACE-AT ?auto_14526 ?auto_14533 ) ( ON ?auto_14526 ?auto_14532 ) ( CLEAR ?auto_14526 ) ( not ( = ?auto_14524 ?auto_14532 ) ) ( not ( = ?auto_14525 ?auto_14532 ) ) ( not ( = ?auto_14539 ?auto_14532 ) ) ( not ( = ?auto_14526 ?auto_14532 ) ) ( not ( = ?auto_14542 ?auto_14532 ) ) ( not ( = ?auto_14535 ?auto_14532 ) ) ( IS-CRATE ?auto_14535 ) ( not ( = ?auto_14524 ?auto_14527 ) ) ( not ( = ?auto_14525 ?auto_14527 ) ) ( not ( = ?auto_14539 ?auto_14527 ) ) ( not ( = ?auto_14526 ?auto_14527 ) ) ( not ( = ?auto_14542 ?auto_14527 ) ) ( not ( = ?auto_14535 ?auto_14527 ) ) ( not ( = ?auto_14532 ?auto_14527 ) ) ( AVAILABLE ?auto_14544 ) ( SURFACE-AT ?auto_14535 ?auto_14537 ) ( ON ?auto_14535 ?auto_14530 ) ( CLEAR ?auto_14535 ) ( not ( = ?auto_14524 ?auto_14530 ) ) ( not ( = ?auto_14525 ?auto_14530 ) ) ( not ( = ?auto_14539 ?auto_14530 ) ) ( not ( = ?auto_14526 ?auto_14530 ) ) ( not ( = ?auto_14542 ?auto_14530 ) ) ( not ( = ?auto_14535 ?auto_14530 ) ) ( not ( = ?auto_14532 ?auto_14530 ) ) ( not ( = ?auto_14527 ?auto_14530 ) ) ( SURFACE-AT ?auto_14538 ?auto_14536 ) ( CLEAR ?auto_14538 ) ( IS-CRATE ?auto_14527 ) ( not ( = ?auto_14524 ?auto_14538 ) ) ( not ( = ?auto_14525 ?auto_14538 ) ) ( not ( = ?auto_14539 ?auto_14538 ) ) ( not ( = ?auto_14526 ?auto_14538 ) ) ( not ( = ?auto_14542 ?auto_14538 ) ) ( not ( = ?auto_14535 ?auto_14538 ) ) ( not ( = ?auto_14532 ?auto_14538 ) ) ( not ( = ?auto_14527 ?auto_14538 ) ) ( not ( = ?auto_14530 ?auto_14538 ) ) ( AVAILABLE ?auto_14541 ) ( not ( = ?auto_14545 ?auto_14536 ) ) ( not ( = ?auto_14537 ?auto_14545 ) ) ( not ( = ?auto_14529 ?auto_14545 ) ) ( not ( = ?auto_14533 ?auto_14545 ) ) ( HOIST-AT ?auto_14528 ?auto_14545 ) ( not ( = ?auto_14541 ?auto_14528 ) ) ( not ( = ?auto_14544 ?auto_14528 ) ) ( not ( = ?auto_14531 ?auto_14528 ) ) ( not ( = ?auto_14540 ?auto_14528 ) ) ( AVAILABLE ?auto_14528 ) ( SURFACE-AT ?auto_14527 ?auto_14545 ) ( ON ?auto_14527 ?auto_14543 ) ( CLEAR ?auto_14527 ) ( not ( = ?auto_14524 ?auto_14543 ) ) ( not ( = ?auto_14525 ?auto_14543 ) ) ( not ( = ?auto_14539 ?auto_14543 ) ) ( not ( = ?auto_14526 ?auto_14543 ) ) ( not ( = ?auto_14542 ?auto_14543 ) ) ( not ( = ?auto_14535 ?auto_14543 ) ) ( not ( = ?auto_14532 ?auto_14543 ) ) ( not ( = ?auto_14527 ?auto_14543 ) ) ( not ( = ?auto_14530 ?auto_14543 ) ) ( not ( = ?auto_14538 ?auto_14543 ) ) ( TRUCK-AT ?auto_14534 ?auto_14536 ) )
    :subtasks
    ( ( !DRIVE ?auto_14534 ?auto_14536 ?auto_14545 )
      ( MAKE-ON ?auto_14524 ?auto_14525 )
      ( MAKE-ON-VERIFY ?auto_14524 ?auto_14525 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14548 - SURFACE
      ?auto_14549 - SURFACE
    )
    :vars
    (
      ?auto_14550 - HOIST
      ?auto_14551 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14550 ?auto_14551 ) ( SURFACE-AT ?auto_14549 ?auto_14551 ) ( CLEAR ?auto_14549 ) ( LIFTING ?auto_14550 ?auto_14548 ) ( IS-CRATE ?auto_14548 ) ( not ( = ?auto_14548 ?auto_14549 ) ) )
    :subtasks
    ( ( !DROP ?auto_14550 ?auto_14548 ?auto_14549 ?auto_14551 )
      ( MAKE-ON-VERIFY ?auto_14548 ?auto_14549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14552 - SURFACE
      ?auto_14553 - SURFACE
    )
    :vars
    (
      ?auto_14554 - HOIST
      ?auto_14555 - PLACE
      ?auto_14556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14554 ?auto_14555 ) ( SURFACE-AT ?auto_14553 ?auto_14555 ) ( CLEAR ?auto_14553 ) ( IS-CRATE ?auto_14552 ) ( not ( = ?auto_14552 ?auto_14553 ) ) ( TRUCK-AT ?auto_14556 ?auto_14555 ) ( AVAILABLE ?auto_14554 ) ( IN ?auto_14552 ?auto_14556 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14554 ?auto_14552 ?auto_14556 ?auto_14555 )
      ( MAKE-ON ?auto_14552 ?auto_14553 )
      ( MAKE-ON-VERIFY ?auto_14552 ?auto_14553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14557 - SURFACE
      ?auto_14558 - SURFACE
    )
    :vars
    (
      ?auto_14561 - HOIST
      ?auto_14560 - PLACE
      ?auto_14559 - TRUCK
      ?auto_14562 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14561 ?auto_14560 ) ( SURFACE-AT ?auto_14558 ?auto_14560 ) ( CLEAR ?auto_14558 ) ( IS-CRATE ?auto_14557 ) ( not ( = ?auto_14557 ?auto_14558 ) ) ( AVAILABLE ?auto_14561 ) ( IN ?auto_14557 ?auto_14559 ) ( TRUCK-AT ?auto_14559 ?auto_14562 ) ( not ( = ?auto_14562 ?auto_14560 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14559 ?auto_14562 ?auto_14560 )
      ( MAKE-ON ?auto_14557 ?auto_14558 )
      ( MAKE-ON-VERIFY ?auto_14557 ?auto_14558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14563 - SURFACE
      ?auto_14564 - SURFACE
    )
    :vars
    (
      ?auto_14565 - HOIST
      ?auto_14566 - PLACE
      ?auto_14567 - TRUCK
      ?auto_14568 - PLACE
      ?auto_14569 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14565 ?auto_14566 ) ( SURFACE-AT ?auto_14564 ?auto_14566 ) ( CLEAR ?auto_14564 ) ( IS-CRATE ?auto_14563 ) ( not ( = ?auto_14563 ?auto_14564 ) ) ( AVAILABLE ?auto_14565 ) ( TRUCK-AT ?auto_14567 ?auto_14568 ) ( not ( = ?auto_14568 ?auto_14566 ) ) ( HOIST-AT ?auto_14569 ?auto_14568 ) ( LIFTING ?auto_14569 ?auto_14563 ) ( not ( = ?auto_14565 ?auto_14569 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14569 ?auto_14563 ?auto_14567 ?auto_14568 )
      ( MAKE-ON ?auto_14563 ?auto_14564 )
      ( MAKE-ON-VERIFY ?auto_14563 ?auto_14564 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14570 - SURFACE
      ?auto_14571 - SURFACE
    )
    :vars
    (
      ?auto_14576 - HOIST
      ?auto_14575 - PLACE
      ?auto_14573 - TRUCK
      ?auto_14572 - PLACE
      ?auto_14574 - HOIST
      ?auto_14577 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14576 ?auto_14575 ) ( SURFACE-AT ?auto_14571 ?auto_14575 ) ( CLEAR ?auto_14571 ) ( IS-CRATE ?auto_14570 ) ( not ( = ?auto_14570 ?auto_14571 ) ) ( AVAILABLE ?auto_14576 ) ( TRUCK-AT ?auto_14573 ?auto_14572 ) ( not ( = ?auto_14572 ?auto_14575 ) ) ( HOIST-AT ?auto_14574 ?auto_14572 ) ( not ( = ?auto_14576 ?auto_14574 ) ) ( AVAILABLE ?auto_14574 ) ( SURFACE-AT ?auto_14570 ?auto_14572 ) ( ON ?auto_14570 ?auto_14577 ) ( CLEAR ?auto_14570 ) ( not ( = ?auto_14570 ?auto_14577 ) ) ( not ( = ?auto_14571 ?auto_14577 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14574 ?auto_14570 ?auto_14577 ?auto_14572 )
      ( MAKE-ON ?auto_14570 ?auto_14571 )
      ( MAKE-ON-VERIFY ?auto_14570 ?auto_14571 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14578 - SURFACE
      ?auto_14579 - SURFACE
    )
    :vars
    (
      ?auto_14583 - HOIST
      ?auto_14585 - PLACE
      ?auto_14581 - PLACE
      ?auto_14582 - HOIST
      ?auto_14580 - SURFACE
      ?auto_14584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14583 ?auto_14585 ) ( SURFACE-AT ?auto_14579 ?auto_14585 ) ( CLEAR ?auto_14579 ) ( IS-CRATE ?auto_14578 ) ( not ( = ?auto_14578 ?auto_14579 ) ) ( AVAILABLE ?auto_14583 ) ( not ( = ?auto_14581 ?auto_14585 ) ) ( HOIST-AT ?auto_14582 ?auto_14581 ) ( not ( = ?auto_14583 ?auto_14582 ) ) ( AVAILABLE ?auto_14582 ) ( SURFACE-AT ?auto_14578 ?auto_14581 ) ( ON ?auto_14578 ?auto_14580 ) ( CLEAR ?auto_14578 ) ( not ( = ?auto_14578 ?auto_14580 ) ) ( not ( = ?auto_14579 ?auto_14580 ) ) ( TRUCK-AT ?auto_14584 ?auto_14585 ) )
    :subtasks
    ( ( !DRIVE ?auto_14584 ?auto_14585 ?auto_14581 )
      ( MAKE-ON ?auto_14578 ?auto_14579 )
      ( MAKE-ON-VERIFY ?auto_14578 ?auto_14579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14586 - SURFACE
      ?auto_14587 - SURFACE
    )
    :vars
    (
      ?auto_14592 - HOIST
      ?auto_14590 - PLACE
      ?auto_14588 - PLACE
      ?auto_14593 - HOIST
      ?auto_14591 - SURFACE
      ?auto_14589 - TRUCK
      ?auto_14594 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14592 ?auto_14590 ) ( IS-CRATE ?auto_14586 ) ( not ( = ?auto_14586 ?auto_14587 ) ) ( not ( = ?auto_14588 ?auto_14590 ) ) ( HOIST-AT ?auto_14593 ?auto_14588 ) ( not ( = ?auto_14592 ?auto_14593 ) ) ( AVAILABLE ?auto_14593 ) ( SURFACE-AT ?auto_14586 ?auto_14588 ) ( ON ?auto_14586 ?auto_14591 ) ( CLEAR ?auto_14586 ) ( not ( = ?auto_14586 ?auto_14591 ) ) ( not ( = ?auto_14587 ?auto_14591 ) ) ( TRUCK-AT ?auto_14589 ?auto_14590 ) ( SURFACE-AT ?auto_14594 ?auto_14590 ) ( CLEAR ?auto_14594 ) ( LIFTING ?auto_14592 ?auto_14587 ) ( IS-CRATE ?auto_14587 ) ( not ( = ?auto_14586 ?auto_14594 ) ) ( not ( = ?auto_14587 ?auto_14594 ) ) ( not ( = ?auto_14591 ?auto_14594 ) ) )
    :subtasks
    ( ( !DROP ?auto_14592 ?auto_14587 ?auto_14594 ?auto_14590 )
      ( MAKE-ON ?auto_14586 ?auto_14587 )
      ( MAKE-ON-VERIFY ?auto_14586 ?auto_14587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14595 - SURFACE
      ?auto_14596 - SURFACE
    )
    :vars
    (
      ?auto_14597 - HOIST
      ?auto_14601 - PLACE
      ?auto_14598 - PLACE
      ?auto_14603 - HOIST
      ?auto_14599 - SURFACE
      ?auto_14602 - TRUCK
      ?auto_14600 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14597 ?auto_14601 ) ( IS-CRATE ?auto_14595 ) ( not ( = ?auto_14595 ?auto_14596 ) ) ( not ( = ?auto_14598 ?auto_14601 ) ) ( HOIST-AT ?auto_14603 ?auto_14598 ) ( not ( = ?auto_14597 ?auto_14603 ) ) ( AVAILABLE ?auto_14603 ) ( SURFACE-AT ?auto_14595 ?auto_14598 ) ( ON ?auto_14595 ?auto_14599 ) ( CLEAR ?auto_14595 ) ( not ( = ?auto_14595 ?auto_14599 ) ) ( not ( = ?auto_14596 ?auto_14599 ) ) ( TRUCK-AT ?auto_14602 ?auto_14601 ) ( SURFACE-AT ?auto_14600 ?auto_14601 ) ( CLEAR ?auto_14600 ) ( IS-CRATE ?auto_14596 ) ( not ( = ?auto_14595 ?auto_14600 ) ) ( not ( = ?auto_14596 ?auto_14600 ) ) ( not ( = ?auto_14599 ?auto_14600 ) ) ( AVAILABLE ?auto_14597 ) ( IN ?auto_14596 ?auto_14602 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14597 ?auto_14596 ?auto_14602 ?auto_14601 )
      ( MAKE-ON ?auto_14595 ?auto_14596 )
      ( MAKE-ON-VERIFY ?auto_14595 ?auto_14596 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14604 - SURFACE
      ?auto_14605 - SURFACE
    )
    :vars
    (
      ?auto_14607 - HOIST
      ?auto_14608 - PLACE
      ?auto_14611 - PLACE
      ?auto_14606 - HOIST
      ?auto_14610 - SURFACE
      ?auto_14609 - SURFACE
      ?auto_14612 - TRUCK
      ?auto_14613 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14607 ?auto_14608 ) ( IS-CRATE ?auto_14604 ) ( not ( = ?auto_14604 ?auto_14605 ) ) ( not ( = ?auto_14611 ?auto_14608 ) ) ( HOIST-AT ?auto_14606 ?auto_14611 ) ( not ( = ?auto_14607 ?auto_14606 ) ) ( AVAILABLE ?auto_14606 ) ( SURFACE-AT ?auto_14604 ?auto_14611 ) ( ON ?auto_14604 ?auto_14610 ) ( CLEAR ?auto_14604 ) ( not ( = ?auto_14604 ?auto_14610 ) ) ( not ( = ?auto_14605 ?auto_14610 ) ) ( SURFACE-AT ?auto_14609 ?auto_14608 ) ( CLEAR ?auto_14609 ) ( IS-CRATE ?auto_14605 ) ( not ( = ?auto_14604 ?auto_14609 ) ) ( not ( = ?auto_14605 ?auto_14609 ) ) ( not ( = ?auto_14610 ?auto_14609 ) ) ( AVAILABLE ?auto_14607 ) ( IN ?auto_14605 ?auto_14612 ) ( TRUCK-AT ?auto_14612 ?auto_14613 ) ( not ( = ?auto_14613 ?auto_14608 ) ) ( not ( = ?auto_14611 ?auto_14613 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14612 ?auto_14613 ?auto_14608 )
      ( MAKE-ON ?auto_14604 ?auto_14605 )
      ( MAKE-ON-VERIFY ?auto_14604 ?auto_14605 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14614 - SURFACE
      ?auto_14615 - SURFACE
    )
    :vars
    (
      ?auto_14619 - HOIST
      ?auto_14620 - PLACE
      ?auto_14616 - PLACE
      ?auto_14623 - HOIST
      ?auto_14618 - SURFACE
      ?auto_14617 - SURFACE
      ?auto_14621 - TRUCK
      ?auto_14622 - PLACE
      ?auto_14624 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14619 ?auto_14620 ) ( IS-CRATE ?auto_14614 ) ( not ( = ?auto_14614 ?auto_14615 ) ) ( not ( = ?auto_14616 ?auto_14620 ) ) ( HOIST-AT ?auto_14623 ?auto_14616 ) ( not ( = ?auto_14619 ?auto_14623 ) ) ( AVAILABLE ?auto_14623 ) ( SURFACE-AT ?auto_14614 ?auto_14616 ) ( ON ?auto_14614 ?auto_14618 ) ( CLEAR ?auto_14614 ) ( not ( = ?auto_14614 ?auto_14618 ) ) ( not ( = ?auto_14615 ?auto_14618 ) ) ( SURFACE-AT ?auto_14617 ?auto_14620 ) ( CLEAR ?auto_14617 ) ( IS-CRATE ?auto_14615 ) ( not ( = ?auto_14614 ?auto_14617 ) ) ( not ( = ?auto_14615 ?auto_14617 ) ) ( not ( = ?auto_14618 ?auto_14617 ) ) ( AVAILABLE ?auto_14619 ) ( TRUCK-AT ?auto_14621 ?auto_14622 ) ( not ( = ?auto_14622 ?auto_14620 ) ) ( not ( = ?auto_14616 ?auto_14622 ) ) ( HOIST-AT ?auto_14624 ?auto_14622 ) ( LIFTING ?auto_14624 ?auto_14615 ) ( not ( = ?auto_14619 ?auto_14624 ) ) ( not ( = ?auto_14623 ?auto_14624 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14624 ?auto_14615 ?auto_14621 ?auto_14622 )
      ( MAKE-ON ?auto_14614 ?auto_14615 )
      ( MAKE-ON-VERIFY ?auto_14614 ?auto_14615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14625 - SURFACE
      ?auto_14626 - SURFACE
    )
    :vars
    (
      ?auto_14627 - HOIST
      ?auto_14633 - PLACE
      ?auto_14635 - PLACE
      ?auto_14631 - HOIST
      ?auto_14628 - SURFACE
      ?auto_14632 - SURFACE
      ?auto_14629 - TRUCK
      ?auto_14630 - PLACE
      ?auto_14634 - HOIST
      ?auto_14636 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14627 ?auto_14633 ) ( IS-CRATE ?auto_14625 ) ( not ( = ?auto_14625 ?auto_14626 ) ) ( not ( = ?auto_14635 ?auto_14633 ) ) ( HOIST-AT ?auto_14631 ?auto_14635 ) ( not ( = ?auto_14627 ?auto_14631 ) ) ( AVAILABLE ?auto_14631 ) ( SURFACE-AT ?auto_14625 ?auto_14635 ) ( ON ?auto_14625 ?auto_14628 ) ( CLEAR ?auto_14625 ) ( not ( = ?auto_14625 ?auto_14628 ) ) ( not ( = ?auto_14626 ?auto_14628 ) ) ( SURFACE-AT ?auto_14632 ?auto_14633 ) ( CLEAR ?auto_14632 ) ( IS-CRATE ?auto_14626 ) ( not ( = ?auto_14625 ?auto_14632 ) ) ( not ( = ?auto_14626 ?auto_14632 ) ) ( not ( = ?auto_14628 ?auto_14632 ) ) ( AVAILABLE ?auto_14627 ) ( TRUCK-AT ?auto_14629 ?auto_14630 ) ( not ( = ?auto_14630 ?auto_14633 ) ) ( not ( = ?auto_14635 ?auto_14630 ) ) ( HOIST-AT ?auto_14634 ?auto_14630 ) ( not ( = ?auto_14627 ?auto_14634 ) ) ( not ( = ?auto_14631 ?auto_14634 ) ) ( AVAILABLE ?auto_14634 ) ( SURFACE-AT ?auto_14626 ?auto_14630 ) ( ON ?auto_14626 ?auto_14636 ) ( CLEAR ?auto_14626 ) ( not ( = ?auto_14625 ?auto_14636 ) ) ( not ( = ?auto_14626 ?auto_14636 ) ) ( not ( = ?auto_14628 ?auto_14636 ) ) ( not ( = ?auto_14632 ?auto_14636 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14634 ?auto_14626 ?auto_14636 ?auto_14630 )
      ( MAKE-ON ?auto_14625 ?auto_14626 )
      ( MAKE-ON-VERIFY ?auto_14625 ?auto_14626 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14637 - SURFACE
      ?auto_14638 - SURFACE
    )
    :vars
    (
      ?auto_14639 - HOIST
      ?auto_14640 - PLACE
      ?auto_14646 - PLACE
      ?auto_14645 - HOIST
      ?auto_14643 - SURFACE
      ?auto_14647 - SURFACE
      ?auto_14648 - PLACE
      ?auto_14644 - HOIST
      ?auto_14641 - SURFACE
      ?auto_14642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14639 ?auto_14640 ) ( IS-CRATE ?auto_14637 ) ( not ( = ?auto_14637 ?auto_14638 ) ) ( not ( = ?auto_14646 ?auto_14640 ) ) ( HOIST-AT ?auto_14645 ?auto_14646 ) ( not ( = ?auto_14639 ?auto_14645 ) ) ( AVAILABLE ?auto_14645 ) ( SURFACE-AT ?auto_14637 ?auto_14646 ) ( ON ?auto_14637 ?auto_14643 ) ( CLEAR ?auto_14637 ) ( not ( = ?auto_14637 ?auto_14643 ) ) ( not ( = ?auto_14638 ?auto_14643 ) ) ( SURFACE-AT ?auto_14647 ?auto_14640 ) ( CLEAR ?auto_14647 ) ( IS-CRATE ?auto_14638 ) ( not ( = ?auto_14637 ?auto_14647 ) ) ( not ( = ?auto_14638 ?auto_14647 ) ) ( not ( = ?auto_14643 ?auto_14647 ) ) ( AVAILABLE ?auto_14639 ) ( not ( = ?auto_14648 ?auto_14640 ) ) ( not ( = ?auto_14646 ?auto_14648 ) ) ( HOIST-AT ?auto_14644 ?auto_14648 ) ( not ( = ?auto_14639 ?auto_14644 ) ) ( not ( = ?auto_14645 ?auto_14644 ) ) ( AVAILABLE ?auto_14644 ) ( SURFACE-AT ?auto_14638 ?auto_14648 ) ( ON ?auto_14638 ?auto_14641 ) ( CLEAR ?auto_14638 ) ( not ( = ?auto_14637 ?auto_14641 ) ) ( not ( = ?auto_14638 ?auto_14641 ) ) ( not ( = ?auto_14643 ?auto_14641 ) ) ( not ( = ?auto_14647 ?auto_14641 ) ) ( TRUCK-AT ?auto_14642 ?auto_14640 ) )
    :subtasks
    ( ( !DRIVE ?auto_14642 ?auto_14640 ?auto_14648 )
      ( MAKE-ON ?auto_14637 ?auto_14638 )
      ( MAKE-ON-VERIFY ?auto_14637 ?auto_14638 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14649 - SURFACE
      ?auto_14650 - SURFACE
    )
    :vars
    (
      ?auto_14652 - HOIST
      ?auto_14656 - PLACE
      ?auto_14654 - PLACE
      ?auto_14659 - HOIST
      ?auto_14658 - SURFACE
      ?auto_14660 - SURFACE
      ?auto_14657 - PLACE
      ?auto_14655 - HOIST
      ?auto_14651 - SURFACE
      ?auto_14653 - TRUCK
      ?auto_14661 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14652 ?auto_14656 ) ( IS-CRATE ?auto_14649 ) ( not ( = ?auto_14649 ?auto_14650 ) ) ( not ( = ?auto_14654 ?auto_14656 ) ) ( HOIST-AT ?auto_14659 ?auto_14654 ) ( not ( = ?auto_14652 ?auto_14659 ) ) ( AVAILABLE ?auto_14659 ) ( SURFACE-AT ?auto_14649 ?auto_14654 ) ( ON ?auto_14649 ?auto_14658 ) ( CLEAR ?auto_14649 ) ( not ( = ?auto_14649 ?auto_14658 ) ) ( not ( = ?auto_14650 ?auto_14658 ) ) ( IS-CRATE ?auto_14650 ) ( not ( = ?auto_14649 ?auto_14660 ) ) ( not ( = ?auto_14650 ?auto_14660 ) ) ( not ( = ?auto_14658 ?auto_14660 ) ) ( not ( = ?auto_14657 ?auto_14656 ) ) ( not ( = ?auto_14654 ?auto_14657 ) ) ( HOIST-AT ?auto_14655 ?auto_14657 ) ( not ( = ?auto_14652 ?auto_14655 ) ) ( not ( = ?auto_14659 ?auto_14655 ) ) ( AVAILABLE ?auto_14655 ) ( SURFACE-AT ?auto_14650 ?auto_14657 ) ( ON ?auto_14650 ?auto_14651 ) ( CLEAR ?auto_14650 ) ( not ( = ?auto_14649 ?auto_14651 ) ) ( not ( = ?auto_14650 ?auto_14651 ) ) ( not ( = ?auto_14658 ?auto_14651 ) ) ( not ( = ?auto_14660 ?auto_14651 ) ) ( TRUCK-AT ?auto_14653 ?auto_14656 ) ( SURFACE-AT ?auto_14661 ?auto_14656 ) ( CLEAR ?auto_14661 ) ( LIFTING ?auto_14652 ?auto_14660 ) ( IS-CRATE ?auto_14660 ) ( not ( = ?auto_14649 ?auto_14661 ) ) ( not ( = ?auto_14650 ?auto_14661 ) ) ( not ( = ?auto_14658 ?auto_14661 ) ) ( not ( = ?auto_14660 ?auto_14661 ) ) ( not ( = ?auto_14651 ?auto_14661 ) ) )
    :subtasks
    ( ( !DROP ?auto_14652 ?auto_14660 ?auto_14661 ?auto_14656 )
      ( MAKE-ON ?auto_14649 ?auto_14650 )
      ( MAKE-ON-VERIFY ?auto_14649 ?auto_14650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14662 - SURFACE
      ?auto_14663 - SURFACE
    )
    :vars
    (
      ?auto_14665 - HOIST
      ?auto_14666 - PLACE
      ?auto_14664 - PLACE
      ?auto_14671 - HOIST
      ?auto_14674 - SURFACE
      ?auto_14673 - SURFACE
      ?auto_14672 - PLACE
      ?auto_14668 - HOIST
      ?auto_14669 - SURFACE
      ?auto_14667 - TRUCK
      ?auto_14670 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14665 ?auto_14666 ) ( IS-CRATE ?auto_14662 ) ( not ( = ?auto_14662 ?auto_14663 ) ) ( not ( = ?auto_14664 ?auto_14666 ) ) ( HOIST-AT ?auto_14671 ?auto_14664 ) ( not ( = ?auto_14665 ?auto_14671 ) ) ( AVAILABLE ?auto_14671 ) ( SURFACE-AT ?auto_14662 ?auto_14664 ) ( ON ?auto_14662 ?auto_14674 ) ( CLEAR ?auto_14662 ) ( not ( = ?auto_14662 ?auto_14674 ) ) ( not ( = ?auto_14663 ?auto_14674 ) ) ( IS-CRATE ?auto_14663 ) ( not ( = ?auto_14662 ?auto_14673 ) ) ( not ( = ?auto_14663 ?auto_14673 ) ) ( not ( = ?auto_14674 ?auto_14673 ) ) ( not ( = ?auto_14672 ?auto_14666 ) ) ( not ( = ?auto_14664 ?auto_14672 ) ) ( HOIST-AT ?auto_14668 ?auto_14672 ) ( not ( = ?auto_14665 ?auto_14668 ) ) ( not ( = ?auto_14671 ?auto_14668 ) ) ( AVAILABLE ?auto_14668 ) ( SURFACE-AT ?auto_14663 ?auto_14672 ) ( ON ?auto_14663 ?auto_14669 ) ( CLEAR ?auto_14663 ) ( not ( = ?auto_14662 ?auto_14669 ) ) ( not ( = ?auto_14663 ?auto_14669 ) ) ( not ( = ?auto_14674 ?auto_14669 ) ) ( not ( = ?auto_14673 ?auto_14669 ) ) ( TRUCK-AT ?auto_14667 ?auto_14666 ) ( SURFACE-AT ?auto_14670 ?auto_14666 ) ( CLEAR ?auto_14670 ) ( IS-CRATE ?auto_14673 ) ( not ( = ?auto_14662 ?auto_14670 ) ) ( not ( = ?auto_14663 ?auto_14670 ) ) ( not ( = ?auto_14674 ?auto_14670 ) ) ( not ( = ?auto_14673 ?auto_14670 ) ) ( not ( = ?auto_14669 ?auto_14670 ) ) ( AVAILABLE ?auto_14665 ) ( IN ?auto_14673 ?auto_14667 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14665 ?auto_14673 ?auto_14667 ?auto_14666 )
      ( MAKE-ON ?auto_14662 ?auto_14663 )
      ( MAKE-ON-VERIFY ?auto_14662 ?auto_14663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14675 - SURFACE
      ?auto_14676 - SURFACE
    )
    :vars
    (
      ?auto_14683 - HOIST
      ?auto_14687 - PLACE
      ?auto_14686 - PLACE
      ?auto_14680 - HOIST
      ?auto_14682 - SURFACE
      ?auto_14677 - SURFACE
      ?auto_14684 - PLACE
      ?auto_14681 - HOIST
      ?auto_14685 - SURFACE
      ?auto_14678 - SURFACE
      ?auto_14679 - TRUCK
      ?auto_14688 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14683 ?auto_14687 ) ( IS-CRATE ?auto_14675 ) ( not ( = ?auto_14675 ?auto_14676 ) ) ( not ( = ?auto_14686 ?auto_14687 ) ) ( HOIST-AT ?auto_14680 ?auto_14686 ) ( not ( = ?auto_14683 ?auto_14680 ) ) ( AVAILABLE ?auto_14680 ) ( SURFACE-AT ?auto_14675 ?auto_14686 ) ( ON ?auto_14675 ?auto_14682 ) ( CLEAR ?auto_14675 ) ( not ( = ?auto_14675 ?auto_14682 ) ) ( not ( = ?auto_14676 ?auto_14682 ) ) ( IS-CRATE ?auto_14676 ) ( not ( = ?auto_14675 ?auto_14677 ) ) ( not ( = ?auto_14676 ?auto_14677 ) ) ( not ( = ?auto_14682 ?auto_14677 ) ) ( not ( = ?auto_14684 ?auto_14687 ) ) ( not ( = ?auto_14686 ?auto_14684 ) ) ( HOIST-AT ?auto_14681 ?auto_14684 ) ( not ( = ?auto_14683 ?auto_14681 ) ) ( not ( = ?auto_14680 ?auto_14681 ) ) ( AVAILABLE ?auto_14681 ) ( SURFACE-AT ?auto_14676 ?auto_14684 ) ( ON ?auto_14676 ?auto_14685 ) ( CLEAR ?auto_14676 ) ( not ( = ?auto_14675 ?auto_14685 ) ) ( not ( = ?auto_14676 ?auto_14685 ) ) ( not ( = ?auto_14682 ?auto_14685 ) ) ( not ( = ?auto_14677 ?auto_14685 ) ) ( SURFACE-AT ?auto_14678 ?auto_14687 ) ( CLEAR ?auto_14678 ) ( IS-CRATE ?auto_14677 ) ( not ( = ?auto_14675 ?auto_14678 ) ) ( not ( = ?auto_14676 ?auto_14678 ) ) ( not ( = ?auto_14682 ?auto_14678 ) ) ( not ( = ?auto_14677 ?auto_14678 ) ) ( not ( = ?auto_14685 ?auto_14678 ) ) ( AVAILABLE ?auto_14683 ) ( IN ?auto_14677 ?auto_14679 ) ( TRUCK-AT ?auto_14679 ?auto_14688 ) ( not ( = ?auto_14688 ?auto_14687 ) ) ( not ( = ?auto_14686 ?auto_14688 ) ) ( not ( = ?auto_14684 ?auto_14688 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14679 ?auto_14688 ?auto_14687 )
      ( MAKE-ON ?auto_14675 ?auto_14676 )
      ( MAKE-ON-VERIFY ?auto_14675 ?auto_14676 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14689 - SURFACE
      ?auto_14690 - SURFACE
    )
    :vars
    (
      ?auto_14702 - HOIST
      ?auto_14693 - PLACE
      ?auto_14697 - PLACE
      ?auto_14691 - HOIST
      ?auto_14695 - SURFACE
      ?auto_14699 - SURFACE
      ?auto_14696 - PLACE
      ?auto_14701 - HOIST
      ?auto_14700 - SURFACE
      ?auto_14692 - SURFACE
      ?auto_14698 - TRUCK
      ?auto_14694 - PLACE
      ?auto_14703 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14702 ?auto_14693 ) ( IS-CRATE ?auto_14689 ) ( not ( = ?auto_14689 ?auto_14690 ) ) ( not ( = ?auto_14697 ?auto_14693 ) ) ( HOIST-AT ?auto_14691 ?auto_14697 ) ( not ( = ?auto_14702 ?auto_14691 ) ) ( AVAILABLE ?auto_14691 ) ( SURFACE-AT ?auto_14689 ?auto_14697 ) ( ON ?auto_14689 ?auto_14695 ) ( CLEAR ?auto_14689 ) ( not ( = ?auto_14689 ?auto_14695 ) ) ( not ( = ?auto_14690 ?auto_14695 ) ) ( IS-CRATE ?auto_14690 ) ( not ( = ?auto_14689 ?auto_14699 ) ) ( not ( = ?auto_14690 ?auto_14699 ) ) ( not ( = ?auto_14695 ?auto_14699 ) ) ( not ( = ?auto_14696 ?auto_14693 ) ) ( not ( = ?auto_14697 ?auto_14696 ) ) ( HOIST-AT ?auto_14701 ?auto_14696 ) ( not ( = ?auto_14702 ?auto_14701 ) ) ( not ( = ?auto_14691 ?auto_14701 ) ) ( AVAILABLE ?auto_14701 ) ( SURFACE-AT ?auto_14690 ?auto_14696 ) ( ON ?auto_14690 ?auto_14700 ) ( CLEAR ?auto_14690 ) ( not ( = ?auto_14689 ?auto_14700 ) ) ( not ( = ?auto_14690 ?auto_14700 ) ) ( not ( = ?auto_14695 ?auto_14700 ) ) ( not ( = ?auto_14699 ?auto_14700 ) ) ( SURFACE-AT ?auto_14692 ?auto_14693 ) ( CLEAR ?auto_14692 ) ( IS-CRATE ?auto_14699 ) ( not ( = ?auto_14689 ?auto_14692 ) ) ( not ( = ?auto_14690 ?auto_14692 ) ) ( not ( = ?auto_14695 ?auto_14692 ) ) ( not ( = ?auto_14699 ?auto_14692 ) ) ( not ( = ?auto_14700 ?auto_14692 ) ) ( AVAILABLE ?auto_14702 ) ( TRUCK-AT ?auto_14698 ?auto_14694 ) ( not ( = ?auto_14694 ?auto_14693 ) ) ( not ( = ?auto_14697 ?auto_14694 ) ) ( not ( = ?auto_14696 ?auto_14694 ) ) ( HOIST-AT ?auto_14703 ?auto_14694 ) ( LIFTING ?auto_14703 ?auto_14699 ) ( not ( = ?auto_14702 ?auto_14703 ) ) ( not ( = ?auto_14691 ?auto_14703 ) ) ( not ( = ?auto_14701 ?auto_14703 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14703 ?auto_14699 ?auto_14698 ?auto_14694 )
      ( MAKE-ON ?auto_14689 ?auto_14690 )
      ( MAKE-ON-VERIFY ?auto_14689 ?auto_14690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14704 - SURFACE
      ?auto_14705 - SURFACE
    )
    :vars
    (
      ?auto_14708 - HOIST
      ?auto_14717 - PLACE
      ?auto_14707 - PLACE
      ?auto_14718 - HOIST
      ?auto_14712 - SURFACE
      ?auto_14709 - SURFACE
      ?auto_14710 - PLACE
      ?auto_14715 - HOIST
      ?auto_14716 - SURFACE
      ?auto_14714 - SURFACE
      ?auto_14711 - TRUCK
      ?auto_14713 - PLACE
      ?auto_14706 - HOIST
      ?auto_14719 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14708 ?auto_14717 ) ( IS-CRATE ?auto_14704 ) ( not ( = ?auto_14704 ?auto_14705 ) ) ( not ( = ?auto_14707 ?auto_14717 ) ) ( HOIST-AT ?auto_14718 ?auto_14707 ) ( not ( = ?auto_14708 ?auto_14718 ) ) ( AVAILABLE ?auto_14718 ) ( SURFACE-AT ?auto_14704 ?auto_14707 ) ( ON ?auto_14704 ?auto_14712 ) ( CLEAR ?auto_14704 ) ( not ( = ?auto_14704 ?auto_14712 ) ) ( not ( = ?auto_14705 ?auto_14712 ) ) ( IS-CRATE ?auto_14705 ) ( not ( = ?auto_14704 ?auto_14709 ) ) ( not ( = ?auto_14705 ?auto_14709 ) ) ( not ( = ?auto_14712 ?auto_14709 ) ) ( not ( = ?auto_14710 ?auto_14717 ) ) ( not ( = ?auto_14707 ?auto_14710 ) ) ( HOIST-AT ?auto_14715 ?auto_14710 ) ( not ( = ?auto_14708 ?auto_14715 ) ) ( not ( = ?auto_14718 ?auto_14715 ) ) ( AVAILABLE ?auto_14715 ) ( SURFACE-AT ?auto_14705 ?auto_14710 ) ( ON ?auto_14705 ?auto_14716 ) ( CLEAR ?auto_14705 ) ( not ( = ?auto_14704 ?auto_14716 ) ) ( not ( = ?auto_14705 ?auto_14716 ) ) ( not ( = ?auto_14712 ?auto_14716 ) ) ( not ( = ?auto_14709 ?auto_14716 ) ) ( SURFACE-AT ?auto_14714 ?auto_14717 ) ( CLEAR ?auto_14714 ) ( IS-CRATE ?auto_14709 ) ( not ( = ?auto_14704 ?auto_14714 ) ) ( not ( = ?auto_14705 ?auto_14714 ) ) ( not ( = ?auto_14712 ?auto_14714 ) ) ( not ( = ?auto_14709 ?auto_14714 ) ) ( not ( = ?auto_14716 ?auto_14714 ) ) ( AVAILABLE ?auto_14708 ) ( TRUCK-AT ?auto_14711 ?auto_14713 ) ( not ( = ?auto_14713 ?auto_14717 ) ) ( not ( = ?auto_14707 ?auto_14713 ) ) ( not ( = ?auto_14710 ?auto_14713 ) ) ( HOIST-AT ?auto_14706 ?auto_14713 ) ( not ( = ?auto_14708 ?auto_14706 ) ) ( not ( = ?auto_14718 ?auto_14706 ) ) ( not ( = ?auto_14715 ?auto_14706 ) ) ( AVAILABLE ?auto_14706 ) ( SURFACE-AT ?auto_14709 ?auto_14713 ) ( ON ?auto_14709 ?auto_14719 ) ( CLEAR ?auto_14709 ) ( not ( = ?auto_14704 ?auto_14719 ) ) ( not ( = ?auto_14705 ?auto_14719 ) ) ( not ( = ?auto_14712 ?auto_14719 ) ) ( not ( = ?auto_14709 ?auto_14719 ) ) ( not ( = ?auto_14716 ?auto_14719 ) ) ( not ( = ?auto_14714 ?auto_14719 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14706 ?auto_14709 ?auto_14719 ?auto_14713 )
      ( MAKE-ON ?auto_14704 ?auto_14705 )
      ( MAKE-ON-VERIFY ?auto_14704 ?auto_14705 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14720 - SURFACE
      ?auto_14721 - SURFACE
    )
    :vars
    (
      ?auto_14734 - HOIST
      ?auto_14727 - PLACE
      ?auto_14726 - PLACE
      ?auto_14728 - HOIST
      ?auto_14729 - SURFACE
      ?auto_14730 - SURFACE
      ?auto_14724 - PLACE
      ?auto_14735 - HOIST
      ?auto_14723 - SURFACE
      ?auto_14731 - SURFACE
      ?auto_14722 - PLACE
      ?auto_14732 - HOIST
      ?auto_14733 - SURFACE
      ?auto_14725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14734 ?auto_14727 ) ( IS-CRATE ?auto_14720 ) ( not ( = ?auto_14720 ?auto_14721 ) ) ( not ( = ?auto_14726 ?auto_14727 ) ) ( HOIST-AT ?auto_14728 ?auto_14726 ) ( not ( = ?auto_14734 ?auto_14728 ) ) ( AVAILABLE ?auto_14728 ) ( SURFACE-AT ?auto_14720 ?auto_14726 ) ( ON ?auto_14720 ?auto_14729 ) ( CLEAR ?auto_14720 ) ( not ( = ?auto_14720 ?auto_14729 ) ) ( not ( = ?auto_14721 ?auto_14729 ) ) ( IS-CRATE ?auto_14721 ) ( not ( = ?auto_14720 ?auto_14730 ) ) ( not ( = ?auto_14721 ?auto_14730 ) ) ( not ( = ?auto_14729 ?auto_14730 ) ) ( not ( = ?auto_14724 ?auto_14727 ) ) ( not ( = ?auto_14726 ?auto_14724 ) ) ( HOIST-AT ?auto_14735 ?auto_14724 ) ( not ( = ?auto_14734 ?auto_14735 ) ) ( not ( = ?auto_14728 ?auto_14735 ) ) ( AVAILABLE ?auto_14735 ) ( SURFACE-AT ?auto_14721 ?auto_14724 ) ( ON ?auto_14721 ?auto_14723 ) ( CLEAR ?auto_14721 ) ( not ( = ?auto_14720 ?auto_14723 ) ) ( not ( = ?auto_14721 ?auto_14723 ) ) ( not ( = ?auto_14729 ?auto_14723 ) ) ( not ( = ?auto_14730 ?auto_14723 ) ) ( SURFACE-AT ?auto_14731 ?auto_14727 ) ( CLEAR ?auto_14731 ) ( IS-CRATE ?auto_14730 ) ( not ( = ?auto_14720 ?auto_14731 ) ) ( not ( = ?auto_14721 ?auto_14731 ) ) ( not ( = ?auto_14729 ?auto_14731 ) ) ( not ( = ?auto_14730 ?auto_14731 ) ) ( not ( = ?auto_14723 ?auto_14731 ) ) ( AVAILABLE ?auto_14734 ) ( not ( = ?auto_14722 ?auto_14727 ) ) ( not ( = ?auto_14726 ?auto_14722 ) ) ( not ( = ?auto_14724 ?auto_14722 ) ) ( HOIST-AT ?auto_14732 ?auto_14722 ) ( not ( = ?auto_14734 ?auto_14732 ) ) ( not ( = ?auto_14728 ?auto_14732 ) ) ( not ( = ?auto_14735 ?auto_14732 ) ) ( AVAILABLE ?auto_14732 ) ( SURFACE-AT ?auto_14730 ?auto_14722 ) ( ON ?auto_14730 ?auto_14733 ) ( CLEAR ?auto_14730 ) ( not ( = ?auto_14720 ?auto_14733 ) ) ( not ( = ?auto_14721 ?auto_14733 ) ) ( not ( = ?auto_14729 ?auto_14733 ) ) ( not ( = ?auto_14730 ?auto_14733 ) ) ( not ( = ?auto_14723 ?auto_14733 ) ) ( not ( = ?auto_14731 ?auto_14733 ) ) ( TRUCK-AT ?auto_14725 ?auto_14727 ) )
    :subtasks
    ( ( !DRIVE ?auto_14725 ?auto_14727 ?auto_14722 )
      ( MAKE-ON ?auto_14720 ?auto_14721 )
      ( MAKE-ON-VERIFY ?auto_14720 ?auto_14721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14736 - SURFACE
      ?auto_14737 - SURFACE
    )
    :vars
    (
      ?auto_14740 - HOIST
      ?auto_14742 - PLACE
      ?auto_14739 - PLACE
      ?auto_14745 - HOIST
      ?auto_14746 - SURFACE
      ?auto_14751 - SURFACE
      ?auto_14744 - PLACE
      ?auto_14749 - HOIST
      ?auto_14747 - SURFACE
      ?auto_14743 - SURFACE
      ?auto_14741 - PLACE
      ?auto_14738 - HOIST
      ?auto_14748 - SURFACE
      ?auto_14750 - TRUCK
      ?auto_14752 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14740 ?auto_14742 ) ( IS-CRATE ?auto_14736 ) ( not ( = ?auto_14736 ?auto_14737 ) ) ( not ( = ?auto_14739 ?auto_14742 ) ) ( HOIST-AT ?auto_14745 ?auto_14739 ) ( not ( = ?auto_14740 ?auto_14745 ) ) ( AVAILABLE ?auto_14745 ) ( SURFACE-AT ?auto_14736 ?auto_14739 ) ( ON ?auto_14736 ?auto_14746 ) ( CLEAR ?auto_14736 ) ( not ( = ?auto_14736 ?auto_14746 ) ) ( not ( = ?auto_14737 ?auto_14746 ) ) ( IS-CRATE ?auto_14737 ) ( not ( = ?auto_14736 ?auto_14751 ) ) ( not ( = ?auto_14737 ?auto_14751 ) ) ( not ( = ?auto_14746 ?auto_14751 ) ) ( not ( = ?auto_14744 ?auto_14742 ) ) ( not ( = ?auto_14739 ?auto_14744 ) ) ( HOIST-AT ?auto_14749 ?auto_14744 ) ( not ( = ?auto_14740 ?auto_14749 ) ) ( not ( = ?auto_14745 ?auto_14749 ) ) ( AVAILABLE ?auto_14749 ) ( SURFACE-AT ?auto_14737 ?auto_14744 ) ( ON ?auto_14737 ?auto_14747 ) ( CLEAR ?auto_14737 ) ( not ( = ?auto_14736 ?auto_14747 ) ) ( not ( = ?auto_14737 ?auto_14747 ) ) ( not ( = ?auto_14746 ?auto_14747 ) ) ( not ( = ?auto_14751 ?auto_14747 ) ) ( IS-CRATE ?auto_14751 ) ( not ( = ?auto_14736 ?auto_14743 ) ) ( not ( = ?auto_14737 ?auto_14743 ) ) ( not ( = ?auto_14746 ?auto_14743 ) ) ( not ( = ?auto_14751 ?auto_14743 ) ) ( not ( = ?auto_14747 ?auto_14743 ) ) ( not ( = ?auto_14741 ?auto_14742 ) ) ( not ( = ?auto_14739 ?auto_14741 ) ) ( not ( = ?auto_14744 ?auto_14741 ) ) ( HOIST-AT ?auto_14738 ?auto_14741 ) ( not ( = ?auto_14740 ?auto_14738 ) ) ( not ( = ?auto_14745 ?auto_14738 ) ) ( not ( = ?auto_14749 ?auto_14738 ) ) ( AVAILABLE ?auto_14738 ) ( SURFACE-AT ?auto_14751 ?auto_14741 ) ( ON ?auto_14751 ?auto_14748 ) ( CLEAR ?auto_14751 ) ( not ( = ?auto_14736 ?auto_14748 ) ) ( not ( = ?auto_14737 ?auto_14748 ) ) ( not ( = ?auto_14746 ?auto_14748 ) ) ( not ( = ?auto_14751 ?auto_14748 ) ) ( not ( = ?auto_14747 ?auto_14748 ) ) ( not ( = ?auto_14743 ?auto_14748 ) ) ( TRUCK-AT ?auto_14750 ?auto_14742 ) ( SURFACE-AT ?auto_14752 ?auto_14742 ) ( CLEAR ?auto_14752 ) ( LIFTING ?auto_14740 ?auto_14743 ) ( IS-CRATE ?auto_14743 ) ( not ( = ?auto_14736 ?auto_14752 ) ) ( not ( = ?auto_14737 ?auto_14752 ) ) ( not ( = ?auto_14746 ?auto_14752 ) ) ( not ( = ?auto_14751 ?auto_14752 ) ) ( not ( = ?auto_14747 ?auto_14752 ) ) ( not ( = ?auto_14743 ?auto_14752 ) ) ( not ( = ?auto_14748 ?auto_14752 ) ) )
    :subtasks
    ( ( !DROP ?auto_14740 ?auto_14743 ?auto_14752 ?auto_14742 )
      ( MAKE-ON ?auto_14736 ?auto_14737 )
      ( MAKE-ON-VERIFY ?auto_14736 ?auto_14737 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14753 - SURFACE
      ?auto_14754 - SURFACE
    )
    :vars
    (
      ?auto_14757 - HOIST
      ?auto_14759 - PLACE
      ?auto_14763 - PLACE
      ?auto_14760 - HOIST
      ?auto_14767 - SURFACE
      ?auto_14762 - SURFACE
      ?auto_14765 - PLACE
      ?auto_14768 - HOIST
      ?auto_14755 - SURFACE
      ?auto_14761 - SURFACE
      ?auto_14764 - PLACE
      ?auto_14756 - HOIST
      ?auto_14769 - SURFACE
      ?auto_14758 - TRUCK
      ?auto_14766 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14757 ?auto_14759 ) ( IS-CRATE ?auto_14753 ) ( not ( = ?auto_14753 ?auto_14754 ) ) ( not ( = ?auto_14763 ?auto_14759 ) ) ( HOIST-AT ?auto_14760 ?auto_14763 ) ( not ( = ?auto_14757 ?auto_14760 ) ) ( AVAILABLE ?auto_14760 ) ( SURFACE-AT ?auto_14753 ?auto_14763 ) ( ON ?auto_14753 ?auto_14767 ) ( CLEAR ?auto_14753 ) ( not ( = ?auto_14753 ?auto_14767 ) ) ( not ( = ?auto_14754 ?auto_14767 ) ) ( IS-CRATE ?auto_14754 ) ( not ( = ?auto_14753 ?auto_14762 ) ) ( not ( = ?auto_14754 ?auto_14762 ) ) ( not ( = ?auto_14767 ?auto_14762 ) ) ( not ( = ?auto_14765 ?auto_14759 ) ) ( not ( = ?auto_14763 ?auto_14765 ) ) ( HOIST-AT ?auto_14768 ?auto_14765 ) ( not ( = ?auto_14757 ?auto_14768 ) ) ( not ( = ?auto_14760 ?auto_14768 ) ) ( AVAILABLE ?auto_14768 ) ( SURFACE-AT ?auto_14754 ?auto_14765 ) ( ON ?auto_14754 ?auto_14755 ) ( CLEAR ?auto_14754 ) ( not ( = ?auto_14753 ?auto_14755 ) ) ( not ( = ?auto_14754 ?auto_14755 ) ) ( not ( = ?auto_14767 ?auto_14755 ) ) ( not ( = ?auto_14762 ?auto_14755 ) ) ( IS-CRATE ?auto_14762 ) ( not ( = ?auto_14753 ?auto_14761 ) ) ( not ( = ?auto_14754 ?auto_14761 ) ) ( not ( = ?auto_14767 ?auto_14761 ) ) ( not ( = ?auto_14762 ?auto_14761 ) ) ( not ( = ?auto_14755 ?auto_14761 ) ) ( not ( = ?auto_14764 ?auto_14759 ) ) ( not ( = ?auto_14763 ?auto_14764 ) ) ( not ( = ?auto_14765 ?auto_14764 ) ) ( HOIST-AT ?auto_14756 ?auto_14764 ) ( not ( = ?auto_14757 ?auto_14756 ) ) ( not ( = ?auto_14760 ?auto_14756 ) ) ( not ( = ?auto_14768 ?auto_14756 ) ) ( AVAILABLE ?auto_14756 ) ( SURFACE-AT ?auto_14762 ?auto_14764 ) ( ON ?auto_14762 ?auto_14769 ) ( CLEAR ?auto_14762 ) ( not ( = ?auto_14753 ?auto_14769 ) ) ( not ( = ?auto_14754 ?auto_14769 ) ) ( not ( = ?auto_14767 ?auto_14769 ) ) ( not ( = ?auto_14762 ?auto_14769 ) ) ( not ( = ?auto_14755 ?auto_14769 ) ) ( not ( = ?auto_14761 ?auto_14769 ) ) ( TRUCK-AT ?auto_14758 ?auto_14759 ) ( SURFACE-AT ?auto_14766 ?auto_14759 ) ( CLEAR ?auto_14766 ) ( IS-CRATE ?auto_14761 ) ( not ( = ?auto_14753 ?auto_14766 ) ) ( not ( = ?auto_14754 ?auto_14766 ) ) ( not ( = ?auto_14767 ?auto_14766 ) ) ( not ( = ?auto_14762 ?auto_14766 ) ) ( not ( = ?auto_14755 ?auto_14766 ) ) ( not ( = ?auto_14761 ?auto_14766 ) ) ( not ( = ?auto_14769 ?auto_14766 ) ) ( AVAILABLE ?auto_14757 ) ( IN ?auto_14761 ?auto_14758 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14757 ?auto_14761 ?auto_14758 ?auto_14759 )
      ( MAKE-ON ?auto_14753 ?auto_14754 )
      ( MAKE-ON-VERIFY ?auto_14753 ?auto_14754 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14770 - SURFACE
      ?auto_14771 - SURFACE
    )
    :vars
    (
      ?auto_14779 - HOIST
      ?auto_14772 - PLACE
      ?auto_14784 - PLACE
      ?auto_14780 - HOIST
      ?auto_14786 - SURFACE
      ?auto_14776 - SURFACE
      ?auto_14773 - PLACE
      ?auto_14777 - HOIST
      ?auto_14775 - SURFACE
      ?auto_14783 - SURFACE
      ?auto_14785 - PLACE
      ?auto_14774 - HOIST
      ?auto_14782 - SURFACE
      ?auto_14781 - SURFACE
      ?auto_14778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14779 ?auto_14772 ) ( IS-CRATE ?auto_14770 ) ( not ( = ?auto_14770 ?auto_14771 ) ) ( not ( = ?auto_14784 ?auto_14772 ) ) ( HOIST-AT ?auto_14780 ?auto_14784 ) ( not ( = ?auto_14779 ?auto_14780 ) ) ( AVAILABLE ?auto_14780 ) ( SURFACE-AT ?auto_14770 ?auto_14784 ) ( ON ?auto_14770 ?auto_14786 ) ( CLEAR ?auto_14770 ) ( not ( = ?auto_14770 ?auto_14786 ) ) ( not ( = ?auto_14771 ?auto_14786 ) ) ( IS-CRATE ?auto_14771 ) ( not ( = ?auto_14770 ?auto_14776 ) ) ( not ( = ?auto_14771 ?auto_14776 ) ) ( not ( = ?auto_14786 ?auto_14776 ) ) ( not ( = ?auto_14773 ?auto_14772 ) ) ( not ( = ?auto_14784 ?auto_14773 ) ) ( HOIST-AT ?auto_14777 ?auto_14773 ) ( not ( = ?auto_14779 ?auto_14777 ) ) ( not ( = ?auto_14780 ?auto_14777 ) ) ( AVAILABLE ?auto_14777 ) ( SURFACE-AT ?auto_14771 ?auto_14773 ) ( ON ?auto_14771 ?auto_14775 ) ( CLEAR ?auto_14771 ) ( not ( = ?auto_14770 ?auto_14775 ) ) ( not ( = ?auto_14771 ?auto_14775 ) ) ( not ( = ?auto_14786 ?auto_14775 ) ) ( not ( = ?auto_14776 ?auto_14775 ) ) ( IS-CRATE ?auto_14776 ) ( not ( = ?auto_14770 ?auto_14783 ) ) ( not ( = ?auto_14771 ?auto_14783 ) ) ( not ( = ?auto_14786 ?auto_14783 ) ) ( not ( = ?auto_14776 ?auto_14783 ) ) ( not ( = ?auto_14775 ?auto_14783 ) ) ( not ( = ?auto_14785 ?auto_14772 ) ) ( not ( = ?auto_14784 ?auto_14785 ) ) ( not ( = ?auto_14773 ?auto_14785 ) ) ( HOIST-AT ?auto_14774 ?auto_14785 ) ( not ( = ?auto_14779 ?auto_14774 ) ) ( not ( = ?auto_14780 ?auto_14774 ) ) ( not ( = ?auto_14777 ?auto_14774 ) ) ( AVAILABLE ?auto_14774 ) ( SURFACE-AT ?auto_14776 ?auto_14785 ) ( ON ?auto_14776 ?auto_14782 ) ( CLEAR ?auto_14776 ) ( not ( = ?auto_14770 ?auto_14782 ) ) ( not ( = ?auto_14771 ?auto_14782 ) ) ( not ( = ?auto_14786 ?auto_14782 ) ) ( not ( = ?auto_14776 ?auto_14782 ) ) ( not ( = ?auto_14775 ?auto_14782 ) ) ( not ( = ?auto_14783 ?auto_14782 ) ) ( SURFACE-AT ?auto_14781 ?auto_14772 ) ( CLEAR ?auto_14781 ) ( IS-CRATE ?auto_14783 ) ( not ( = ?auto_14770 ?auto_14781 ) ) ( not ( = ?auto_14771 ?auto_14781 ) ) ( not ( = ?auto_14786 ?auto_14781 ) ) ( not ( = ?auto_14776 ?auto_14781 ) ) ( not ( = ?auto_14775 ?auto_14781 ) ) ( not ( = ?auto_14783 ?auto_14781 ) ) ( not ( = ?auto_14782 ?auto_14781 ) ) ( AVAILABLE ?auto_14779 ) ( IN ?auto_14783 ?auto_14778 ) ( TRUCK-AT ?auto_14778 ?auto_14784 ) )
    :subtasks
    ( ( !DRIVE ?auto_14778 ?auto_14784 ?auto_14772 )
      ( MAKE-ON ?auto_14770 ?auto_14771 )
      ( MAKE-ON-VERIFY ?auto_14770 ?auto_14771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14787 - SURFACE
      ?auto_14788 - SURFACE
    )
    :vars
    (
      ?auto_14795 - HOIST
      ?auto_14803 - PLACE
      ?auto_14789 - PLACE
      ?auto_14802 - HOIST
      ?auto_14796 - SURFACE
      ?auto_14793 - SURFACE
      ?auto_14798 - PLACE
      ?auto_14790 - HOIST
      ?auto_14800 - SURFACE
      ?auto_14792 - SURFACE
      ?auto_14791 - PLACE
      ?auto_14797 - HOIST
      ?auto_14799 - SURFACE
      ?auto_14794 - SURFACE
      ?auto_14801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14795 ?auto_14803 ) ( IS-CRATE ?auto_14787 ) ( not ( = ?auto_14787 ?auto_14788 ) ) ( not ( = ?auto_14789 ?auto_14803 ) ) ( HOIST-AT ?auto_14802 ?auto_14789 ) ( not ( = ?auto_14795 ?auto_14802 ) ) ( SURFACE-AT ?auto_14787 ?auto_14789 ) ( ON ?auto_14787 ?auto_14796 ) ( CLEAR ?auto_14787 ) ( not ( = ?auto_14787 ?auto_14796 ) ) ( not ( = ?auto_14788 ?auto_14796 ) ) ( IS-CRATE ?auto_14788 ) ( not ( = ?auto_14787 ?auto_14793 ) ) ( not ( = ?auto_14788 ?auto_14793 ) ) ( not ( = ?auto_14796 ?auto_14793 ) ) ( not ( = ?auto_14798 ?auto_14803 ) ) ( not ( = ?auto_14789 ?auto_14798 ) ) ( HOIST-AT ?auto_14790 ?auto_14798 ) ( not ( = ?auto_14795 ?auto_14790 ) ) ( not ( = ?auto_14802 ?auto_14790 ) ) ( AVAILABLE ?auto_14790 ) ( SURFACE-AT ?auto_14788 ?auto_14798 ) ( ON ?auto_14788 ?auto_14800 ) ( CLEAR ?auto_14788 ) ( not ( = ?auto_14787 ?auto_14800 ) ) ( not ( = ?auto_14788 ?auto_14800 ) ) ( not ( = ?auto_14796 ?auto_14800 ) ) ( not ( = ?auto_14793 ?auto_14800 ) ) ( IS-CRATE ?auto_14793 ) ( not ( = ?auto_14787 ?auto_14792 ) ) ( not ( = ?auto_14788 ?auto_14792 ) ) ( not ( = ?auto_14796 ?auto_14792 ) ) ( not ( = ?auto_14793 ?auto_14792 ) ) ( not ( = ?auto_14800 ?auto_14792 ) ) ( not ( = ?auto_14791 ?auto_14803 ) ) ( not ( = ?auto_14789 ?auto_14791 ) ) ( not ( = ?auto_14798 ?auto_14791 ) ) ( HOIST-AT ?auto_14797 ?auto_14791 ) ( not ( = ?auto_14795 ?auto_14797 ) ) ( not ( = ?auto_14802 ?auto_14797 ) ) ( not ( = ?auto_14790 ?auto_14797 ) ) ( AVAILABLE ?auto_14797 ) ( SURFACE-AT ?auto_14793 ?auto_14791 ) ( ON ?auto_14793 ?auto_14799 ) ( CLEAR ?auto_14793 ) ( not ( = ?auto_14787 ?auto_14799 ) ) ( not ( = ?auto_14788 ?auto_14799 ) ) ( not ( = ?auto_14796 ?auto_14799 ) ) ( not ( = ?auto_14793 ?auto_14799 ) ) ( not ( = ?auto_14800 ?auto_14799 ) ) ( not ( = ?auto_14792 ?auto_14799 ) ) ( SURFACE-AT ?auto_14794 ?auto_14803 ) ( CLEAR ?auto_14794 ) ( IS-CRATE ?auto_14792 ) ( not ( = ?auto_14787 ?auto_14794 ) ) ( not ( = ?auto_14788 ?auto_14794 ) ) ( not ( = ?auto_14796 ?auto_14794 ) ) ( not ( = ?auto_14793 ?auto_14794 ) ) ( not ( = ?auto_14800 ?auto_14794 ) ) ( not ( = ?auto_14792 ?auto_14794 ) ) ( not ( = ?auto_14799 ?auto_14794 ) ) ( AVAILABLE ?auto_14795 ) ( TRUCK-AT ?auto_14801 ?auto_14789 ) ( LIFTING ?auto_14802 ?auto_14792 ) )
    :subtasks
    ( ( !LOAD ?auto_14802 ?auto_14792 ?auto_14801 ?auto_14789 )
      ( MAKE-ON ?auto_14787 ?auto_14788 )
      ( MAKE-ON-VERIFY ?auto_14787 ?auto_14788 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14804 - SURFACE
      ?auto_14805 - SURFACE
    )
    :vars
    (
      ?auto_14806 - HOIST
      ?auto_14812 - PLACE
      ?auto_14811 - PLACE
      ?auto_14814 - HOIST
      ?auto_14809 - SURFACE
      ?auto_14815 - SURFACE
      ?auto_14817 - PLACE
      ?auto_14820 - HOIST
      ?auto_14818 - SURFACE
      ?auto_14807 - SURFACE
      ?auto_14810 - PLACE
      ?auto_14813 - HOIST
      ?auto_14816 - SURFACE
      ?auto_14808 - SURFACE
      ?auto_14819 - TRUCK
      ?auto_14821 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14806 ?auto_14812 ) ( IS-CRATE ?auto_14804 ) ( not ( = ?auto_14804 ?auto_14805 ) ) ( not ( = ?auto_14811 ?auto_14812 ) ) ( HOIST-AT ?auto_14814 ?auto_14811 ) ( not ( = ?auto_14806 ?auto_14814 ) ) ( SURFACE-AT ?auto_14804 ?auto_14811 ) ( ON ?auto_14804 ?auto_14809 ) ( CLEAR ?auto_14804 ) ( not ( = ?auto_14804 ?auto_14809 ) ) ( not ( = ?auto_14805 ?auto_14809 ) ) ( IS-CRATE ?auto_14805 ) ( not ( = ?auto_14804 ?auto_14815 ) ) ( not ( = ?auto_14805 ?auto_14815 ) ) ( not ( = ?auto_14809 ?auto_14815 ) ) ( not ( = ?auto_14817 ?auto_14812 ) ) ( not ( = ?auto_14811 ?auto_14817 ) ) ( HOIST-AT ?auto_14820 ?auto_14817 ) ( not ( = ?auto_14806 ?auto_14820 ) ) ( not ( = ?auto_14814 ?auto_14820 ) ) ( AVAILABLE ?auto_14820 ) ( SURFACE-AT ?auto_14805 ?auto_14817 ) ( ON ?auto_14805 ?auto_14818 ) ( CLEAR ?auto_14805 ) ( not ( = ?auto_14804 ?auto_14818 ) ) ( not ( = ?auto_14805 ?auto_14818 ) ) ( not ( = ?auto_14809 ?auto_14818 ) ) ( not ( = ?auto_14815 ?auto_14818 ) ) ( IS-CRATE ?auto_14815 ) ( not ( = ?auto_14804 ?auto_14807 ) ) ( not ( = ?auto_14805 ?auto_14807 ) ) ( not ( = ?auto_14809 ?auto_14807 ) ) ( not ( = ?auto_14815 ?auto_14807 ) ) ( not ( = ?auto_14818 ?auto_14807 ) ) ( not ( = ?auto_14810 ?auto_14812 ) ) ( not ( = ?auto_14811 ?auto_14810 ) ) ( not ( = ?auto_14817 ?auto_14810 ) ) ( HOIST-AT ?auto_14813 ?auto_14810 ) ( not ( = ?auto_14806 ?auto_14813 ) ) ( not ( = ?auto_14814 ?auto_14813 ) ) ( not ( = ?auto_14820 ?auto_14813 ) ) ( AVAILABLE ?auto_14813 ) ( SURFACE-AT ?auto_14815 ?auto_14810 ) ( ON ?auto_14815 ?auto_14816 ) ( CLEAR ?auto_14815 ) ( not ( = ?auto_14804 ?auto_14816 ) ) ( not ( = ?auto_14805 ?auto_14816 ) ) ( not ( = ?auto_14809 ?auto_14816 ) ) ( not ( = ?auto_14815 ?auto_14816 ) ) ( not ( = ?auto_14818 ?auto_14816 ) ) ( not ( = ?auto_14807 ?auto_14816 ) ) ( SURFACE-AT ?auto_14808 ?auto_14812 ) ( CLEAR ?auto_14808 ) ( IS-CRATE ?auto_14807 ) ( not ( = ?auto_14804 ?auto_14808 ) ) ( not ( = ?auto_14805 ?auto_14808 ) ) ( not ( = ?auto_14809 ?auto_14808 ) ) ( not ( = ?auto_14815 ?auto_14808 ) ) ( not ( = ?auto_14818 ?auto_14808 ) ) ( not ( = ?auto_14807 ?auto_14808 ) ) ( not ( = ?auto_14816 ?auto_14808 ) ) ( AVAILABLE ?auto_14806 ) ( TRUCK-AT ?auto_14819 ?auto_14811 ) ( AVAILABLE ?auto_14814 ) ( SURFACE-AT ?auto_14807 ?auto_14811 ) ( ON ?auto_14807 ?auto_14821 ) ( CLEAR ?auto_14807 ) ( not ( = ?auto_14804 ?auto_14821 ) ) ( not ( = ?auto_14805 ?auto_14821 ) ) ( not ( = ?auto_14809 ?auto_14821 ) ) ( not ( = ?auto_14815 ?auto_14821 ) ) ( not ( = ?auto_14818 ?auto_14821 ) ) ( not ( = ?auto_14807 ?auto_14821 ) ) ( not ( = ?auto_14816 ?auto_14821 ) ) ( not ( = ?auto_14808 ?auto_14821 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14814 ?auto_14807 ?auto_14821 ?auto_14811 )
      ( MAKE-ON ?auto_14804 ?auto_14805 )
      ( MAKE-ON-VERIFY ?auto_14804 ?auto_14805 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14822 - SURFACE
      ?auto_14823 - SURFACE
    )
    :vars
    (
      ?auto_14828 - HOIST
      ?auto_14835 - PLACE
      ?auto_14827 - PLACE
      ?auto_14839 - HOIST
      ?auto_14830 - SURFACE
      ?auto_14824 - SURFACE
      ?auto_14837 - PLACE
      ?auto_14834 - HOIST
      ?auto_14833 - SURFACE
      ?auto_14832 - SURFACE
      ?auto_14831 - PLACE
      ?auto_14826 - HOIST
      ?auto_14838 - SURFACE
      ?auto_14825 - SURFACE
      ?auto_14836 - SURFACE
      ?auto_14829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14828 ?auto_14835 ) ( IS-CRATE ?auto_14822 ) ( not ( = ?auto_14822 ?auto_14823 ) ) ( not ( = ?auto_14827 ?auto_14835 ) ) ( HOIST-AT ?auto_14839 ?auto_14827 ) ( not ( = ?auto_14828 ?auto_14839 ) ) ( SURFACE-AT ?auto_14822 ?auto_14827 ) ( ON ?auto_14822 ?auto_14830 ) ( CLEAR ?auto_14822 ) ( not ( = ?auto_14822 ?auto_14830 ) ) ( not ( = ?auto_14823 ?auto_14830 ) ) ( IS-CRATE ?auto_14823 ) ( not ( = ?auto_14822 ?auto_14824 ) ) ( not ( = ?auto_14823 ?auto_14824 ) ) ( not ( = ?auto_14830 ?auto_14824 ) ) ( not ( = ?auto_14837 ?auto_14835 ) ) ( not ( = ?auto_14827 ?auto_14837 ) ) ( HOIST-AT ?auto_14834 ?auto_14837 ) ( not ( = ?auto_14828 ?auto_14834 ) ) ( not ( = ?auto_14839 ?auto_14834 ) ) ( AVAILABLE ?auto_14834 ) ( SURFACE-AT ?auto_14823 ?auto_14837 ) ( ON ?auto_14823 ?auto_14833 ) ( CLEAR ?auto_14823 ) ( not ( = ?auto_14822 ?auto_14833 ) ) ( not ( = ?auto_14823 ?auto_14833 ) ) ( not ( = ?auto_14830 ?auto_14833 ) ) ( not ( = ?auto_14824 ?auto_14833 ) ) ( IS-CRATE ?auto_14824 ) ( not ( = ?auto_14822 ?auto_14832 ) ) ( not ( = ?auto_14823 ?auto_14832 ) ) ( not ( = ?auto_14830 ?auto_14832 ) ) ( not ( = ?auto_14824 ?auto_14832 ) ) ( not ( = ?auto_14833 ?auto_14832 ) ) ( not ( = ?auto_14831 ?auto_14835 ) ) ( not ( = ?auto_14827 ?auto_14831 ) ) ( not ( = ?auto_14837 ?auto_14831 ) ) ( HOIST-AT ?auto_14826 ?auto_14831 ) ( not ( = ?auto_14828 ?auto_14826 ) ) ( not ( = ?auto_14839 ?auto_14826 ) ) ( not ( = ?auto_14834 ?auto_14826 ) ) ( AVAILABLE ?auto_14826 ) ( SURFACE-AT ?auto_14824 ?auto_14831 ) ( ON ?auto_14824 ?auto_14838 ) ( CLEAR ?auto_14824 ) ( not ( = ?auto_14822 ?auto_14838 ) ) ( not ( = ?auto_14823 ?auto_14838 ) ) ( not ( = ?auto_14830 ?auto_14838 ) ) ( not ( = ?auto_14824 ?auto_14838 ) ) ( not ( = ?auto_14833 ?auto_14838 ) ) ( not ( = ?auto_14832 ?auto_14838 ) ) ( SURFACE-AT ?auto_14825 ?auto_14835 ) ( CLEAR ?auto_14825 ) ( IS-CRATE ?auto_14832 ) ( not ( = ?auto_14822 ?auto_14825 ) ) ( not ( = ?auto_14823 ?auto_14825 ) ) ( not ( = ?auto_14830 ?auto_14825 ) ) ( not ( = ?auto_14824 ?auto_14825 ) ) ( not ( = ?auto_14833 ?auto_14825 ) ) ( not ( = ?auto_14832 ?auto_14825 ) ) ( not ( = ?auto_14838 ?auto_14825 ) ) ( AVAILABLE ?auto_14828 ) ( AVAILABLE ?auto_14839 ) ( SURFACE-AT ?auto_14832 ?auto_14827 ) ( ON ?auto_14832 ?auto_14836 ) ( CLEAR ?auto_14832 ) ( not ( = ?auto_14822 ?auto_14836 ) ) ( not ( = ?auto_14823 ?auto_14836 ) ) ( not ( = ?auto_14830 ?auto_14836 ) ) ( not ( = ?auto_14824 ?auto_14836 ) ) ( not ( = ?auto_14833 ?auto_14836 ) ) ( not ( = ?auto_14832 ?auto_14836 ) ) ( not ( = ?auto_14838 ?auto_14836 ) ) ( not ( = ?auto_14825 ?auto_14836 ) ) ( TRUCK-AT ?auto_14829 ?auto_14835 ) )
    :subtasks
    ( ( !DRIVE ?auto_14829 ?auto_14835 ?auto_14827 )
      ( MAKE-ON ?auto_14822 ?auto_14823 )
      ( MAKE-ON-VERIFY ?auto_14822 ?auto_14823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14840 - SURFACE
      ?auto_14841 - SURFACE
    )
    :vars
    (
      ?auto_14845 - HOIST
      ?auto_14848 - PLACE
      ?auto_14849 - PLACE
      ?auto_14852 - HOIST
      ?auto_14855 - SURFACE
      ?auto_14851 - SURFACE
      ?auto_14854 - PLACE
      ?auto_14844 - HOIST
      ?auto_14857 - SURFACE
      ?auto_14856 - SURFACE
      ?auto_14843 - PLACE
      ?auto_14853 - HOIST
      ?auto_14846 - SURFACE
      ?auto_14847 - SURFACE
      ?auto_14850 - SURFACE
      ?auto_14842 - TRUCK
      ?auto_14858 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14845 ?auto_14848 ) ( IS-CRATE ?auto_14840 ) ( not ( = ?auto_14840 ?auto_14841 ) ) ( not ( = ?auto_14849 ?auto_14848 ) ) ( HOIST-AT ?auto_14852 ?auto_14849 ) ( not ( = ?auto_14845 ?auto_14852 ) ) ( SURFACE-AT ?auto_14840 ?auto_14849 ) ( ON ?auto_14840 ?auto_14855 ) ( CLEAR ?auto_14840 ) ( not ( = ?auto_14840 ?auto_14855 ) ) ( not ( = ?auto_14841 ?auto_14855 ) ) ( IS-CRATE ?auto_14841 ) ( not ( = ?auto_14840 ?auto_14851 ) ) ( not ( = ?auto_14841 ?auto_14851 ) ) ( not ( = ?auto_14855 ?auto_14851 ) ) ( not ( = ?auto_14854 ?auto_14848 ) ) ( not ( = ?auto_14849 ?auto_14854 ) ) ( HOIST-AT ?auto_14844 ?auto_14854 ) ( not ( = ?auto_14845 ?auto_14844 ) ) ( not ( = ?auto_14852 ?auto_14844 ) ) ( AVAILABLE ?auto_14844 ) ( SURFACE-AT ?auto_14841 ?auto_14854 ) ( ON ?auto_14841 ?auto_14857 ) ( CLEAR ?auto_14841 ) ( not ( = ?auto_14840 ?auto_14857 ) ) ( not ( = ?auto_14841 ?auto_14857 ) ) ( not ( = ?auto_14855 ?auto_14857 ) ) ( not ( = ?auto_14851 ?auto_14857 ) ) ( IS-CRATE ?auto_14851 ) ( not ( = ?auto_14840 ?auto_14856 ) ) ( not ( = ?auto_14841 ?auto_14856 ) ) ( not ( = ?auto_14855 ?auto_14856 ) ) ( not ( = ?auto_14851 ?auto_14856 ) ) ( not ( = ?auto_14857 ?auto_14856 ) ) ( not ( = ?auto_14843 ?auto_14848 ) ) ( not ( = ?auto_14849 ?auto_14843 ) ) ( not ( = ?auto_14854 ?auto_14843 ) ) ( HOIST-AT ?auto_14853 ?auto_14843 ) ( not ( = ?auto_14845 ?auto_14853 ) ) ( not ( = ?auto_14852 ?auto_14853 ) ) ( not ( = ?auto_14844 ?auto_14853 ) ) ( AVAILABLE ?auto_14853 ) ( SURFACE-AT ?auto_14851 ?auto_14843 ) ( ON ?auto_14851 ?auto_14846 ) ( CLEAR ?auto_14851 ) ( not ( = ?auto_14840 ?auto_14846 ) ) ( not ( = ?auto_14841 ?auto_14846 ) ) ( not ( = ?auto_14855 ?auto_14846 ) ) ( not ( = ?auto_14851 ?auto_14846 ) ) ( not ( = ?auto_14857 ?auto_14846 ) ) ( not ( = ?auto_14856 ?auto_14846 ) ) ( IS-CRATE ?auto_14856 ) ( not ( = ?auto_14840 ?auto_14847 ) ) ( not ( = ?auto_14841 ?auto_14847 ) ) ( not ( = ?auto_14855 ?auto_14847 ) ) ( not ( = ?auto_14851 ?auto_14847 ) ) ( not ( = ?auto_14857 ?auto_14847 ) ) ( not ( = ?auto_14856 ?auto_14847 ) ) ( not ( = ?auto_14846 ?auto_14847 ) ) ( AVAILABLE ?auto_14852 ) ( SURFACE-AT ?auto_14856 ?auto_14849 ) ( ON ?auto_14856 ?auto_14850 ) ( CLEAR ?auto_14856 ) ( not ( = ?auto_14840 ?auto_14850 ) ) ( not ( = ?auto_14841 ?auto_14850 ) ) ( not ( = ?auto_14855 ?auto_14850 ) ) ( not ( = ?auto_14851 ?auto_14850 ) ) ( not ( = ?auto_14857 ?auto_14850 ) ) ( not ( = ?auto_14856 ?auto_14850 ) ) ( not ( = ?auto_14846 ?auto_14850 ) ) ( not ( = ?auto_14847 ?auto_14850 ) ) ( TRUCK-AT ?auto_14842 ?auto_14848 ) ( SURFACE-AT ?auto_14858 ?auto_14848 ) ( CLEAR ?auto_14858 ) ( LIFTING ?auto_14845 ?auto_14847 ) ( IS-CRATE ?auto_14847 ) ( not ( = ?auto_14840 ?auto_14858 ) ) ( not ( = ?auto_14841 ?auto_14858 ) ) ( not ( = ?auto_14855 ?auto_14858 ) ) ( not ( = ?auto_14851 ?auto_14858 ) ) ( not ( = ?auto_14857 ?auto_14858 ) ) ( not ( = ?auto_14856 ?auto_14858 ) ) ( not ( = ?auto_14846 ?auto_14858 ) ) ( not ( = ?auto_14847 ?auto_14858 ) ) ( not ( = ?auto_14850 ?auto_14858 ) ) )
    :subtasks
    ( ( !DROP ?auto_14845 ?auto_14847 ?auto_14858 ?auto_14848 )
      ( MAKE-ON ?auto_14840 ?auto_14841 )
      ( MAKE-ON-VERIFY ?auto_14840 ?auto_14841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14859 - SURFACE
      ?auto_14860 - SURFACE
    )
    :vars
    (
      ?auto_14861 - HOIST
      ?auto_14871 - PLACE
      ?auto_14863 - PLACE
      ?auto_14869 - HOIST
      ?auto_14864 - SURFACE
      ?auto_14872 - SURFACE
      ?auto_14874 - PLACE
      ?auto_14867 - HOIST
      ?auto_14870 - SURFACE
      ?auto_14873 - SURFACE
      ?auto_14866 - PLACE
      ?auto_14862 - HOIST
      ?auto_14865 - SURFACE
      ?auto_14868 - SURFACE
      ?auto_14876 - SURFACE
      ?auto_14877 - TRUCK
      ?auto_14875 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14861 ?auto_14871 ) ( IS-CRATE ?auto_14859 ) ( not ( = ?auto_14859 ?auto_14860 ) ) ( not ( = ?auto_14863 ?auto_14871 ) ) ( HOIST-AT ?auto_14869 ?auto_14863 ) ( not ( = ?auto_14861 ?auto_14869 ) ) ( SURFACE-AT ?auto_14859 ?auto_14863 ) ( ON ?auto_14859 ?auto_14864 ) ( CLEAR ?auto_14859 ) ( not ( = ?auto_14859 ?auto_14864 ) ) ( not ( = ?auto_14860 ?auto_14864 ) ) ( IS-CRATE ?auto_14860 ) ( not ( = ?auto_14859 ?auto_14872 ) ) ( not ( = ?auto_14860 ?auto_14872 ) ) ( not ( = ?auto_14864 ?auto_14872 ) ) ( not ( = ?auto_14874 ?auto_14871 ) ) ( not ( = ?auto_14863 ?auto_14874 ) ) ( HOIST-AT ?auto_14867 ?auto_14874 ) ( not ( = ?auto_14861 ?auto_14867 ) ) ( not ( = ?auto_14869 ?auto_14867 ) ) ( AVAILABLE ?auto_14867 ) ( SURFACE-AT ?auto_14860 ?auto_14874 ) ( ON ?auto_14860 ?auto_14870 ) ( CLEAR ?auto_14860 ) ( not ( = ?auto_14859 ?auto_14870 ) ) ( not ( = ?auto_14860 ?auto_14870 ) ) ( not ( = ?auto_14864 ?auto_14870 ) ) ( not ( = ?auto_14872 ?auto_14870 ) ) ( IS-CRATE ?auto_14872 ) ( not ( = ?auto_14859 ?auto_14873 ) ) ( not ( = ?auto_14860 ?auto_14873 ) ) ( not ( = ?auto_14864 ?auto_14873 ) ) ( not ( = ?auto_14872 ?auto_14873 ) ) ( not ( = ?auto_14870 ?auto_14873 ) ) ( not ( = ?auto_14866 ?auto_14871 ) ) ( not ( = ?auto_14863 ?auto_14866 ) ) ( not ( = ?auto_14874 ?auto_14866 ) ) ( HOIST-AT ?auto_14862 ?auto_14866 ) ( not ( = ?auto_14861 ?auto_14862 ) ) ( not ( = ?auto_14869 ?auto_14862 ) ) ( not ( = ?auto_14867 ?auto_14862 ) ) ( AVAILABLE ?auto_14862 ) ( SURFACE-AT ?auto_14872 ?auto_14866 ) ( ON ?auto_14872 ?auto_14865 ) ( CLEAR ?auto_14872 ) ( not ( = ?auto_14859 ?auto_14865 ) ) ( not ( = ?auto_14860 ?auto_14865 ) ) ( not ( = ?auto_14864 ?auto_14865 ) ) ( not ( = ?auto_14872 ?auto_14865 ) ) ( not ( = ?auto_14870 ?auto_14865 ) ) ( not ( = ?auto_14873 ?auto_14865 ) ) ( IS-CRATE ?auto_14873 ) ( not ( = ?auto_14859 ?auto_14868 ) ) ( not ( = ?auto_14860 ?auto_14868 ) ) ( not ( = ?auto_14864 ?auto_14868 ) ) ( not ( = ?auto_14872 ?auto_14868 ) ) ( not ( = ?auto_14870 ?auto_14868 ) ) ( not ( = ?auto_14873 ?auto_14868 ) ) ( not ( = ?auto_14865 ?auto_14868 ) ) ( AVAILABLE ?auto_14869 ) ( SURFACE-AT ?auto_14873 ?auto_14863 ) ( ON ?auto_14873 ?auto_14876 ) ( CLEAR ?auto_14873 ) ( not ( = ?auto_14859 ?auto_14876 ) ) ( not ( = ?auto_14860 ?auto_14876 ) ) ( not ( = ?auto_14864 ?auto_14876 ) ) ( not ( = ?auto_14872 ?auto_14876 ) ) ( not ( = ?auto_14870 ?auto_14876 ) ) ( not ( = ?auto_14873 ?auto_14876 ) ) ( not ( = ?auto_14865 ?auto_14876 ) ) ( not ( = ?auto_14868 ?auto_14876 ) ) ( TRUCK-AT ?auto_14877 ?auto_14871 ) ( SURFACE-AT ?auto_14875 ?auto_14871 ) ( CLEAR ?auto_14875 ) ( IS-CRATE ?auto_14868 ) ( not ( = ?auto_14859 ?auto_14875 ) ) ( not ( = ?auto_14860 ?auto_14875 ) ) ( not ( = ?auto_14864 ?auto_14875 ) ) ( not ( = ?auto_14872 ?auto_14875 ) ) ( not ( = ?auto_14870 ?auto_14875 ) ) ( not ( = ?auto_14873 ?auto_14875 ) ) ( not ( = ?auto_14865 ?auto_14875 ) ) ( not ( = ?auto_14868 ?auto_14875 ) ) ( not ( = ?auto_14876 ?auto_14875 ) ) ( AVAILABLE ?auto_14861 ) ( IN ?auto_14868 ?auto_14877 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14861 ?auto_14868 ?auto_14877 ?auto_14871 )
      ( MAKE-ON ?auto_14859 ?auto_14860 )
      ( MAKE-ON-VERIFY ?auto_14859 ?auto_14860 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14878 - SURFACE
      ?auto_14879 - SURFACE
    )
    :vars
    (
      ?auto_14891 - HOIST
      ?auto_14880 - PLACE
      ?auto_14890 - PLACE
      ?auto_14895 - HOIST
      ?auto_14889 - SURFACE
      ?auto_14896 - SURFACE
      ?auto_14887 - PLACE
      ?auto_14882 - HOIST
      ?auto_14881 - SURFACE
      ?auto_14894 - SURFACE
      ?auto_14884 - PLACE
      ?auto_14886 - HOIST
      ?auto_14888 - SURFACE
      ?auto_14885 - SURFACE
      ?auto_14893 - SURFACE
      ?auto_14892 - SURFACE
      ?auto_14883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14891 ?auto_14880 ) ( IS-CRATE ?auto_14878 ) ( not ( = ?auto_14878 ?auto_14879 ) ) ( not ( = ?auto_14890 ?auto_14880 ) ) ( HOIST-AT ?auto_14895 ?auto_14890 ) ( not ( = ?auto_14891 ?auto_14895 ) ) ( SURFACE-AT ?auto_14878 ?auto_14890 ) ( ON ?auto_14878 ?auto_14889 ) ( CLEAR ?auto_14878 ) ( not ( = ?auto_14878 ?auto_14889 ) ) ( not ( = ?auto_14879 ?auto_14889 ) ) ( IS-CRATE ?auto_14879 ) ( not ( = ?auto_14878 ?auto_14896 ) ) ( not ( = ?auto_14879 ?auto_14896 ) ) ( not ( = ?auto_14889 ?auto_14896 ) ) ( not ( = ?auto_14887 ?auto_14880 ) ) ( not ( = ?auto_14890 ?auto_14887 ) ) ( HOIST-AT ?auto_14882 ?auto_14887 ) ( not ( = ?auto_14891 ?auto_14882 ) ) ( not ( = ?auto_14895 ?auto_14882 ) ) ( AVAILABLE ?auto_14882 ) ( SURFACE-AT ?auto_14879 ?auto_14887 ) ( ON ?auto_14879 ?auto_14881 ) ( CLEAR ?auto_14879 ) ( not ( = ?auto_14878 ?auto_14881 ) ) ( not ( = ?auto_14879 ?auto_14881 ) ) ( not ( = ?auto_14889 ?auto_14881 ) ) ( not ( = ?auto_14896 ?auto_14881 ) ) ( IS-CRATE ?auto_14896 ) ( not ( = ?auto_14878 ?auto_14894 ) ) ( not ( = ?auto_14879 ?auto_14894 ) ) ( not ( = ?auto_14889 ?auto_14894 ) ) ( not ( = ?auto_14896 ?auto_14894 ) ) ( not ( = ?auto_14881 ?auto_14894 ) ) ( not ( = ?auto_14884 ?auto_14880 ) ) ( not ( = ?auto_14890 ?auto_14884 ) ) ( not ( = ?auto_14887 ?auto_14884 ) ) ( HOIST-AT ?auto_14886 ?auto_14884 ) ( not ( = ?auto_14891 ?auto_14886 ) ) ( not ( = ?auto_14895 ?auto_14886 ) ) ( not ( = ?auto_14882 ?auto_14886 ) ) ( AVAILABLE ?auto_14886 ) ( SURFACE-AT ?auto_14896 ?auto_14884 ) ( ON ?auto_14896 ?auto_14888 ) ( CLEAR ?auto_14896 ) ( not ( = ?auto_14878 ?auto_14888 ) ) ( not ( = ?auto_14879 ?auto_14888 ) ) ( not ( = ?auto_14889 ?auto_14888 ) ) ( not ( = ?auto_14896 ?auto_14888 ) ) ( not ( = ?auto_14881 ?auto_14888 ) ) ( not ( = ?auto_14894 ?auto_14888 ) ) ( IS-CRATE ?auto_14894 ) ( not ( = ?auto_14878 ?auto_14885 ) ) ( not ( = ?auto_14879 ?auto_14885 ) ) ( not ( = ?auto_14889 ?auto_14885 ) ) ( not ( = ?auto_14896 ?auto_14885 ) ) ( not ( = ?auto_14881 ?auto_14885 ) ) ( not ( = ?auto_14894 ?auto_14885 ) ) ( not ( = ?auto_14888 ?auto_14885 ) ) ( AVAILABLE ?auto_14895 ) ( SURFACE-AT ?auto_14894 ?auto_14890 ) ( ON ?auto_14894 ?auto_14893 ) ( CLEAR ?auto_14894 ) ( not ( = ?auto_14878 ?auto_14893 ) ) ( not ( = ?auto_14879 ?auto_14893 ) ) ( not ( = ?auto_14889 ?auto_14893 ) ) ( not ( = ?auto_14896 ?auto_14893 ) ) ( not ( = ?auto_14881 ?auto_14893 ) ) ( not ( = ?auto_14894 ?auto_14893 ) ) ( not ( = ?auto_14888 ?auto_14893 ) ) ( not ( = ?auto_14885 ?auto_14893 ) ) ( SURFACE-AT ?auto_14892 ?auto_14880 ) ( CLEAR ?auto_14892 ) ( IS-CRATE ?auto_14885 ) ( not ( = ?auto_14878 ?auto_14892 ) ) ( not ( = ?auto_14879 ?auto_14892 ) ) ( not ( = ?auto_14889 ?auto_14892 ) ) ( not ( = ?auto_14896 ?auto_14892 ) ) ( not ( = ?auto_14881 ?auto_14892 ) ) ( not ( = ?auto_14894 ?auto_14892 ) ) ( not ( = ?auto_14888 ?auto_14892 ) ) ( not ( = ?auto_14885 ?auto_14892 ) ) ( not ( = ?auto_14893 ?auto_14892 ) ) ( AVAILABLE ?auto_14891 ) ( IN ?auto_14885 ?auto_14883 ) ( TRUCK-AT ?auto_14883 ?auto_14887 ) )
    :subtasks
    ( ( !DRIVE ?auto_14883 ?auto_14887 ?auto_14880 )
      ( MAKE-ON ?auto_14878 ?auto_14879 )
      ( MAKE-ON-VERIFY ?auto_14878 ?auto_14879 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14897 - SURFACE
      ?auto_14898 - SURFACE
    )
    :vars
    (
      ?auto_14905 - HOIST
      ?auto_14899 - PLACE
      ?auto_14914 - PLACE
      ?auto_14902 - HOIST
      ?auto_14900 - SURFACE
      ?auto_14907 - SURFACE
      ?auto_14901 - PLACE
      ?auto_14910 - HOIST
      ?auto_14915 - SURFACE
      ?auto_14911 - SURFACE
      ?auto_14904 - PLACE
      ?auto_14912 - HOIST
      ?auto_14909 - SURFACE
      ?auto_14913 - SURFACE
      ?auto_14908 - SURFACE
      ?auto_14906 - SURFACE
      ?auto_14903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14905 ?auto_14899 ) ( IS-CRATE ?auto_14897 ) ( not ( = ?auto_14897 ?auto_14898 ) ) ( not ( = ?auto_14914 ?auto_14899 ) ) ( HOIST-AT ?auto_14902 ?auto_14914 ) ( not ( = ?auto_14905 ?auto_14902 ) ) ( SURFACE-AT ?auto_14897 ?auto_14914 ) ( ON ?auto_14897 ?auto_14900 ) ( CLEAR ?auto_14897 ) ( not ( = ?auto_14897 ?auto_14900 ) ) ( not ( = ?auto_14898 ?auto_14900 ) ) ( IS-CRATE ?auto_14898 ) ( not ( = ?auto_14897 ?auto_14907 ) ) ( not ( = ?auto_14898 ?auto_14907 ) ) ( not ( = ?auto_14900 ?auto_14907 ) ) ( not ( = ?auto_14901 ?auto_14899 ) ) ( not ( = ?auto_14914 ?auto_14901 ) ) ( HOIST-AT ?auto_14910 ?auto_14901 ) ( not ( = ?auto_14905 ?auto_14910 ) ) ( not ( = ?auto_14902 ?auto_14910 ) ) ( SURFACE-AT ?auto_14898 ?auto_14901 ) ( ON ?auto_14898 ?auto_14915 ) ( CLEAR ?auto_14898 ) ( not ( = ?auto_14897 ?auto_14915 ) ) ( not ( = ?auto_14898 ?auto_14915 ) ) ( not ( = ?auto_14900 ?auto_14915 ) ) ( not ( = ?auto_14907 ?auto_14915 ) ) ( IS-CRATE ?auto_14907 ) ( not ( = ?auto_14897 ?auto_14911 ) ) ( not ( = ?auto_14898 ?auto_14911 ) ) ( not ( = ?auto_14900 ?auto_14911 ) ) ( not ( = ?auto_14907 ?auto_14911 ) ) ( not ( = ?auto_14915 ?auto_14911 ) ) ( not ( = ?auto_14904 ?auto_14899 ) ) ( not ( = ?auto_14914 ?auto_14904 ) ) ( not ( = ?auto_14901 ?auto_14904 ) ) ( HOIST-AT ?auto_14912 ?auto_14904 ) ( not ( = ?auto_14905 ?auto_14912 ) ) ( not ( = ?auto_14902 ?auto_14912 ) ) ( not ( = ?auto_14910 ?auto_14912 ) ) ( AVAILABLE ?auto_14912 ) ( SURFACE-AT ?auto_14907 ?auto_14904 ) ( ON ?auto_14907 ?auto_14909 ) ( CLEAR ?auto_14907 ) ( not ( = ?auto_14897 ?auto_14909 ) ) ( not ( = ?auto_14898 ?auto_14909 ) ) ( not ( = ?auto_14900 ?auto_14909 ) ) ( not ( = ?auto_14907 ?auto_14909 ) ) ( not ( = ?auto_14915 ?auto_14909 ) ) ( not ( = ?auto_14911 ?auto_14909 ) ) ( IS-CRATE ?auto_14911 ) ( not ( = ?auto_14897 ?auto_14913 ) ) ( not ( = ?auto_14898 ?auto_14913 ) ) ( not ( = ?auto_14900 ?auto_14913 ) ) ( not ( = ?auto_14907 ?auto_14913 ) ) ( not ( = ?auto_14915 ?auto_14913 ) ) ( not ( = ?auto_14911 ?auto_14913 ) ) ( not ( = ?auto_14909 ?auto_14913 ) ) ( AVAILABLE ?auto_14902 ) ( SURFACE-AT ?auto_14911 ?auto_14914 ) ( ON ?auto_14911 ?auto_14908 ) ( CLEAR ?auto_14911 ) ( not ( = ?auto_14897 ?auto_14908 ) ) ( not ( = ?auto_14898 ?auto_14908 ) ) ( not ( = ?auto_14900 ?auto_14908 ) ) ( not ( = ?auto_14907 ?auto_14908 ) ) ( not ( = ?auto_14915 ?auto_14908 ) ) ( not ( = ?auto_14911 ?auto_14908 ) ) ( not ( = ?auto_14909 ?auto_14908 ) ) ( not ( = ?auto_14913 ?auto_14908 ) ) ( SURFACE-AT ?auto_14906 ?auto_14899 ) ( CLEAR ?auto_14906 ) ( IS-CRATE ?auto_14913 ) ( not ( = ?auto_14897 ?auto_14906 ) ) ( not ( = ?auto_14898 ?auto_14906 ) ) ( not ( = ?auto_14900 ?auto_14906 ) ) ( not ( = ?auto_14907 ?auto_14906 ) ) ( not ( = ?auto_14915 ?auto_14906 ) ) ( not ( = ?auto_14911 ?auto_14906 ) ) ( not ( = ?auto_14909 ?auto_14906 ) ) ( not ( = ?auto_14913 ?auto_14906 ) ) ( not ( = ?auto_14908 ?auto_14906 ) ) ( AVAILABLE ?auto_14905 ) ( TRUCK-AT ?auto_14903 ?auto_14901 ) ( LIFTING ?auto_14910 ?auto_14913 ) )
    :subtasks
    ( ( !LOAD ?auto_14910 ?auto_14913 ?auto_14903 ?auto_14901 )
      ( MAKE-ON ?auto_14897 ?auto_14898 )
      ( MAKE-ON-VERIFY ?auto_14897 ?auto_14898 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14916 - SURFACE
      ?auto_14917 - SURFACE
    )
    :vars
    (
      ?auto_14929 - HOIST
      ?auto_14927 - PLACE
      ?auto_14920 - PLACE
      ?auto_14931 - HOIST
      ?auto_14933 - SURFACE
      ?auto_14930 - SURFACE
      ?auto_14918 - PLACE
      ?auto_14932 - HOIST
      ?auto_14928 - SURFACE
      ?auto_14919 - SURFACE
      ?auto_14934 - PLACE
      ?auto_14921 - HOIST
      ?auto_14925 - SURFACE
      ?auto_14922 - SURFACE
      ?auto_14923 - SURFACE
      ?auto_14924 - SURFACE
      ?auto_14926 - TRUCK
      ?auto_14935 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14929 ?auto_14927 ) ( IS-CRATE ?auto_14916 ) ( not ( = ?auto_14916 ?auto_14917 ) ) ( not ( = ?auto_14920 ?auto_14927 ) ) ( HOIST-AT ?auto_14931 ?auto_14920 ) ( not ( = ?auto_14929 ?auto_14931 ) ) ( SURFACE-AT ?auto_14916 ?auto_14920 ) ( ON ?auto_14916 ?auto_14933 ) ( CLEAR ?auto_14916 ) ( not ( = ?auto_14916 ?auto_14933 ) ) ( not ( = ?auto_14917 ?auto_14933 ) ) ( IS-CRATE ?auto_14917 ) ( not ( = ?auto_14916 ?auto_14930 ) ) ( not ( = ?auto_14917 ?auto_14930 ) ) ( not ( = ?auto_14933 ?auto_14930 ) ) ( not ( = ?auto_14918 ?auto_14927 ) ) ( not ( = ?auto_14920 ?auto_14918 ) ) ( HOIST-AT ?auto_14932 ?auto_14918 ) ( not ( = ?auto_14929 ?auto_14932 ) ) ( not ( = ?auto_14931 ?auto_14932 ) ) ( SURFACE-AT ?auto_14917 ?auto_14918 ) ( ON ?auto_14917 ?auto_14928 ) ( CLEAR ?auto_14917 ) ( not ( = ?auto_14916 ?auto_14928 ) ) ( not ( = ?auto_14917 ?auto_14928 ) ) ( not ( = ?auto_14933 ?auto_14928 ) ) ( not ( = ?auto_14930 ?auto_14928 ) ) ( IS-CRATE ?auto_14930 ) ( not ( = ?auto_14916 ?auto_14919 ) ) ( not ( = ?auto_14917 ?auto_14919 ) ) ( not ( = ?auto_14933 ?auto_14919 ) ) ( not ( = ?auto_14930 ?auto_14919 ) ) ( not ( = ?auto_14928 ?auto_14919 ) ) ( not ( = ?auto_14934 ?auto_14927 ) ) ( not ( = ?auto_14920 ?auto_14934 ) ) ( not ( = ?auto_14918 ?auto_14934 ) ) ( HOIST-AT ?auto_14921 ?auto_14934 ) ( not ( = ?auto_14929 ?auto_14921 ) ) ( not ( = ?auto_14931 ?auto_14921 ) ) ( not ( = ?auto_14932 ?auto_14921 ) ) ( AVAILABLE ?auto_14921 ) ( SURFACE-AT ?auto_14930 ?auto_14934 ) ( ON ?auto_14930 ?auto_14925 ) ( CLEAR ?auto_14930 ) ( not ( = ?auto_14916 ?auto_14925 ) ) ( not ( = ?auto_14917 ?auto_14925 ) ) ( not ( = ?auto_14933 ?auto_14925 ) ) ( not ( = ?auto_14930 ?auto_14925 ) ) ( not ( = ?auto_14928 ?auto_14925 ) ) ( not ( = ?auto_14919 ?auto_14925 ) ) ( IS-CRATE ?auto_14919 ) ( not ( = ?auto_14916 ?auto_14922 ) ) ( not ( = ?auto_14917 ?auto_14922 ) ) ( not ( = ?auto_14933 ?auto_14922 ) ) ( not ( = ?auto_14930 ?auto_14922 ) ) ( not ( = ?auto_14928 ?auto_14922 ) ) ( not ( = ?auto_14919 ?auto_14922 ) ) ( not ( = ?auto_14925 ?auto_14922 ) ) ( AVAILABLE ?auto_14931 ) ( SURFACE-AT ?auto_14919 ?auto_14920 ) ( ON ?auto_14919 ?auto_14923 ) ( CLEAR ?auto_14919 ) ( not ( = ?auto_14916 ?auto_14923 ) ) ( not ( = ?auto_14917 ?auto_14923 ) ) ( not ( = ?auto_14933 ?auto_14923 ) ) ( not ( = ?auto_14930 ?auto_14923 ) ) ( not ( = ?auto_14928 ?auto_14923 ) ) ( not ( = ?auto_14919 ?auto_14923 ) ) ( not ( = ?auto_14925 ?auto_14923 ) ) ( not ( = ?auto_14922 ?auto_14923 ) ) ( SURFACE-AT ?auto_14924 ?auto_14927 ) ( CLEAR ?auto_14924 ) ( IS-CRATE ?auto_14922 ) ( not ( = ?auto_14916 ?auto_14924 ) ) ( not ( = ?auto_14917 ?auto_14924 ) ) ( not ( = ?auto_14933 ?auto_14924 ) ) ( not ( = ?auto_14930 ?auto_14924 ) ) ( not ( = ?auto_14928 ?auto_14924 ) ) ( not ( = ?auto_14919 ?auto_14924 ) ) ( not ( = ?auto_14925 ?auto_14924 ) ) ( not ( = ?auto_14922 ?auto_14924 ) ) ( not ( = ?auto_14923 ?auto_14924 ) ) ( AVAILABLE ?auto_14929 ) ( TRUCK-AT ?auto_14926 ?auto_14918 ) ( AVAILABLE ?auto_14932 ) ( SURFACE-AT ?auto_14922 ?auto_14918 ) ( ON ?auto_14922 ?auto_14935 ) ( CLEAR ?auto_14922 ) ( not ( = ?auto_14916 ?auto_14935 ) ) ( not ( = ?auto_14917 ?auto_14935 ) ) ( not ( = ?auto_14933 ?auto_14935 ) ) ( not ( = ?auto_14930 ?auto_14935 ) ) ( not ( = ?auto_14928 ?auto_14935 ) ) ( not ( = ?auto_14919 ?auto_14935 ) ) ( not ( = ?auto_14925 ?auto_14935 ) ) ( not ( = ?auto_14922 ?auto_14935 ) ) ( not ( = ?auto_14923 ?auto_14935 ) ) ( not ( = ?auto_14924 ?auto_14935 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14932 ?auto_14922 ?auto_14935 ?auto_14918 )
      ( MAKE-ON ?auto_14916 ?auto_14917 )
      ( MAKE-ON-VERIFY ?auto_14916 ?auto_14917 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14936 - SURFACE
      ?auto_14937 - SURFACE
    )
    :vars
    (
      ?auto_14944 - HOIST
      ?auto_14949 - PLACE
      ?auto_14951 - PLACE
      ?auto_14947 - HOIST
      ?auto_14942 - SURFACE
      ?auto_14948 - SURFACE
      ?auto_14953 - PLACE
      ?auto_14943 - HOIST
      ?auto_14940 - SURFACE
      ?auto_14938 - SURFACE
      ?auto_14955 - PLACE
      ?auto_14950 - HOIST
      ?auto_14945 - SURFACE
      ?auto_14946 - SURFACE
      ?auto_14939 - SURFACE
      ?auto_14941 - SURFACE
      ?auto_14954 - SURFACE
      ?auto_14952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14944 ?auto_14949 ) ( IS-CRATE ?auto_14936 ) ( not ( = ?auto_14936 ?auto_14937 ) ) ( not ( = ?auto_14951 ?auto_14949 ) ) ( HOIST-AT ?auto_14947 ?auto_14951 ) ( not ( = ?auto_14944 ?auto_14947 ) ) ( SURFACE-AT ?auto_14936 ?auto_14951 ) ( ON ?auto_14936 ?auto_14942 ) ( CLEAR ?auto_14936 ) ( not ( = ?auto_14936 ?auto_14942 ) ) ( not ( = ?auto_14937 ?auto_14942 ) ) ( IS-CRATE ?auto_14937 ) ( not ( = ?auto_14936 ?auto_14948 ) ) ( not ( = ?auto_14937 ?auto_14948 ) ) ( not ( = ?auto_14942 ?auto_14948 ) ) ( not ( = ?auto_14953 ?auto_14949 ) ) ( not ( = ?auto_14951 ?auto_14953 ) ) ( HOIST-AT ?auto_14943 ?auto_14953 ) ( not ( = ?auto_14944 ?auto_14943 ) ) ( not ( = ?auto_14947 ?auto_14943 ) ) ( SURFACE-AT ?auto_14937 ?auto_14953 ) ( ON ?auto_14937 ?auto_14940 ) ( CLEAR ?auto_14937 ) ( not ( = ?auto_14936 ?auto_14940 ) ) ( not ( = ?auto_14937 ?auto_14940 ) ) ( not ( = ?auto_14942 ?auto_14940 ) ) ( not ( = ?auto_14948 ?auto_14940 ) ) ( IS-CRATE ?auto_14948 ) ( not ( = ?auto_14936 ?auto_14938 ) ) ( not ( = ?auto_14937 ?auto_14938 ) ) ( not ( = ?auto_14942 ?auto_14938 ) ) ( not ( = ?auto_14948 ?auto_14938 ) ) ( not ( = ?auto_14940 ?auto_14938 ) ) ( not ( = ?auto_14955 ?auto_14949 ) ) ( not ( = ?auto_14951 ?auto_14955 ) ) ( not ( = ?auto_14953 ?auto_14955 ) ) ( HOIST-AT ?auto_14950 ?auto_14955 ) ( not ( = ?auto_14944 ?auto_14950 ) ) ( not ( = ?auto_14947 ?auto_14950 ) ) ( not ( = ?auto_14943 ?auto_14950 ) ) ( AVAILABLE ?auto_14950 ) ( SURFACE-AT ?auto_14948 ?auto_14955 ) ( ON ?auto_14948 ?auto_14945 ) ( CLEAR ?auto_14948 ) ( not ( = ?auto_14936 ?auto_14945 ) ) ( not ( = ?auto_14937 ?auto_14945 ) ) ( not ( = ?auto_14942 ?auto_14945 ) ) ( not ( = ?auto_14948 ?auto_14945 ) ) ( not ( = ?auto_14940 ?auto_14945 ) ) ( not ( = ?auto_14938 ?auto_14945 ) ) ( IS-CRATE ?auto_14938 ) ( not ( = ?auto_14936 ?auto_14946 ) ) ( not ( = ?auto_14937 ?auto_14946 ) ) ( not ( = ?auto_14942 ?auto_14946 ) ) ( not ( = ?auto_14948 ?auto_14946 ) ) ( not ( = ?auto_14940 ?auto_14946 ) ) ( not ( = ?auto_14938 ?auto_14946 ) ) ( not ( = ?auto_14945 ?auto_14946 ) ) ( AVAILABLE ?auto_14947 ) ( SURFACE-AT ?auto_14938 ?auto_14951 ) ( ON ?auto_14938 ?auto_14939 ) ( CLEAR ?auto_14938 ) ( not ( = ?auto_14936 ?auto_14939 ) ) ( not ( = ?auto_14937 ?auto_14939 ) ) ( not ( = ?auto_14942 ?auto_14939 ) ) ( not ( = ?auto_14948 ?auto_14939 ) ) ( not ( = ?auto_14940 ?auto_14939 ) ) ( not ( = ?auto_14938 ?auto_14939 ) ) ( not ( = ?auto_14945 ?auto_14939 ) ) ( not ( = ?auto_14946 ?auto_14939 ) ) ( SURFACE-AT ?auto_14941 ?auto_14949 ) ( CLEAR ?auto_14941 ) ( IS-CRATE ?auto_14946 ) ( not ( = ?auto_14936 ?auto_14941 ) ) ( not ( = ?auto_14937 ?auto_14941 ) ) ( not ( = ?auto_14942 ?auto_14941 ) ) ( not ( = ?auto_14948 ?auto_14941 ) ) ( not ( = ?auto_14940 ?auto_14941 ) ) ( not ( = ?auto_14938 ?auto_14941 ) ) ( not ( = ?auto_14945 ?auto_14941 ) ) ( not ( = ?auto_14946 ?auto_14941 ) ) ( not ( = ?auto_14939 ?auto_14941 ) ) ( AVAILABLE ?auto_14944 ) ( AVAILABLE ?auto_14943 ) ( SURFACE-AT ?auto_14946 ?auto_14953 ) ( ON ?auto_14946 ?auto_14954 ) ( CLEAR ?auto_14946 ) ( not ( = ?auto_14936 ?auto_14954 ) ) ( not ( = ?auto_14937 ?auto_14954 ) ) ( not ( = ?auto_14942 ?auto_14954 ) ) ( not ( = ?auto_14948 ?auto_14954 ) ) ( not ( = ?auto_14940 ?auto_14954 ) ) ( not ( = ?auto_14938 ?auto_14954 ) ) ( not ( = ?auto_14945 ?auto_14954 ) ) ( not ( = ?auto_14946 ?auto_14954 ) ) ( not ( = ?auto_14939 ?auto_14954 ) ) ( not ( = ?auto_14941 ?auto_14954 ) ) ( TRUCK-AT ?auto_14952 ?auto_14949 ) )
    :subtasks
    ( ( !DRIVE ?auto_14952 ?auto_14949 ?auto_14953 )
      ( MAKE-ON ?auto_14936 ?auto_14937 )
      ( MAKE-ON-VERIFY ?auto_14936 ?auto_14937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14956 - SURFACE
      ?auto_14957 - SURFACE
    )
    :vars
    (
      ?auto_14967 - HOIST
      ?auto_14968 - PLACE
      ?auto_14959 - PLACE
      ?auto_14964 - HOIST
      ?auto_14958 - SURFACE
      ?auto_14966 - SURFACE
      ?auto_14960 - PLACE
      ?auto_14970 - HOIST
      ?auto_14965 - SURFACE
      ?auto_14972 - SURFACE
      ?auto_14961 - PLACE
      ?auto_14969 - HOIST
      ?auto_14975 - SURFACE
      ?auto_14963 - SURFACE
      ?auto_14974 - SURFACE
      ?auto_14971 - SURFACE
      ?auto_14962 - SURFACE
      ?auto_14973 - TRUCK
      ?auto_14976 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14967 ?auto_14968 ) ( IS-CRATE ?auto_14956 ) ( not ( = ?auto_14956 ?auto_14957 ) ) ( not ( = ?auto_14959 ?auto_14968 ) ) ( HOIST-AT ?auto_14964 ?auto_14959 ) ( not ( = ?auto_14967 ?auto_14964 ) ) ( SURFACE-AT ?auto_14956 ?auto_14959 ) ( ON ?auto_14956 ?auto_14958 ) ( CLEAR ?auto_14956 ) ( not ( = ?auto_14956 ?auto_14958 ) ) ( not ( = ?auto_14957 ?auto_14958 ) ) ( IS-CRATE ?auto_14957 ) ( not ( = ?auto_14956 ?auto_14966 ) ) ( not ( = ?auto_14957 ?auto_14966 ) ) ( not ( = ?auto_14958 ?auto_14966 ) ) ( not ( = ?auto_14960 ?auto_14968 ) ) ( not ( = ?auto_14959 ?auto_14960 ) ) ( HOIST-AT ?auto_14970 ?auto_14960 ) ( not ( = ?auto_14967 ?auto_14970 ) ) ( not ( = ?auto_14964 ?auto_14970 ) ) ( SURFACE-AT ?auto_14957 ?auto_14960 ) ( ON ?auto_14957 ?auto_14965 ) ( CLEAR ?auto_14957 ) ( not ( = ?auto_14956 ?auto_14965 ) ) ( not ( = ?auto_14957 ?auto_14965 ) ) ( not ( = ?auto_14958 ?auto_14965 ) ) ( not ( = ?auto_14966 ?auto_14965 ) ) ( IS-CRATE ?auto_14966 ) ( not ( = ?auto_14956 ?auto_14972 ) ) ( not ( = ?auto_14957 ?auto_14972 ) ) ( not ( = ?auto_14958 ?auto_14972 ) ) ( not ( = ?auto_14966 ?auto_14972 ) ) ( not ( = ?auto_14965 ?auto_14972 ) ) ( not ( = ?auto_14961 ?auto_14968 ) ) ( not ( = ?auto_14959 ?auto_14961 ) ) ( not ( = ?auto_14960 ?auto_14961 ) ) ( HOIST-AT ?auto_14969 ?auto_14961 ) ( not ( = ?auto_14967 ?auto_14969 ) ) ( not ( = ?auto_14964 ?auto_14969 ) ) ( not ( = ?auto_14970 ?auto_14969 ) ) ( AVAILABLE ?auto_14969 ) ( SURFACE-AT ?auto_14966 ?auto_14961 ) ( ON ?auto_14966 ?auto_14975 ) ( CLEAR ?auto_14966 ) ( not ( = ?auto_14956 ?auto_14975 ) ) ( not ( = ?auto_14957 ?auto_14975 ) ) ( not ( = ?auto_14958 ?auto_14975 ) ) ( not ( = ?auto_14966 ?auto_14975 ) ) ( not ( = ?auto_14965 ?auto_14975 ) ) ( not ( = ?auto_14972 ?auto_14975 ) ) ( IS-CRATE ?auto_14972 ) ( not ( = ?auto_14956 ?auto_14963 ) ) ( not ( = ?auto_14957 ?auto_14963 ) ) ( not ( = ?auto_14958 ?auto_14963 ) ) ( not ( = ?auto_14966 ?auto_14963 ) ) ( not ( = ?auto_14965 ?auto_14963 ) ) ( not ( = ?auto_14972 ?auto_14963 ) ) ( not ( = ?auto_14975 ?auto_14963 ) ) ( AVAILABLE ?auto_14964 ) ( SURFACE-AT ?auto_14972 ?auto_14959 ) ( ON ?auto_14972 ?auto_14974 ) ( CLEAR ?auto_14972 ) ( not ( = ?auto_14956 ?auto_14974 ) ) ( not ( = ?auto_14957 ?auto_14974 ) ) ( not ( = ?auto_14958 ?auto_14974 ) ) ( not ( = ?auto_14966 ?auto_14974 ) ) ( not ( = ?auto_14965 ?auto_14974 ) ) ( not ( = ?auto_14972 ?auto_14974 ) ) ( not ( = ?auto_14975 ?auto_14974 ) ) ( not ( = ?auto_14963 ?auto_14974 ) ) ( IS-CRATE ?auto_14963 ) ( not ( = ?auto_14956 ?auto_14971 ) ) ( not ( = ?auto_14957 ?auto_14971 ) ) ( not ( = ?auto_14958 ?auto_14971 ) ) ( not ( = ?auto_14966 ?auto_14971 ) ) ( not ( = ?auto_14965 ?auto_14971 ) ) ( not ( = ?auto_14972 ?auto_14971 ) ) ( not ( = ?auto_14975 ?auto_14971 ) ) ( not ( = ?auto_14963 ?auto_14971 ) ) ( not ( = ?auto_14974 ?auto_14971 ) ) ( AVAILABLE ?auto_14970 ) ( SURFACE-AT ?auto_14963 ?auto_14960 ) ( ON ?auto_14963 ?auto_14962 ) ( CLEAR ?auto_14963 ) ( not ( = ?auto_14956 ?auto_14962 ) ) ( not ( = ?auto_14957 ?auto_14962 ) ) ( not ( = ?auto_14958 ?auto_14962 ) ) ( not ( = ?auto_14966 ?auto_14962 ) ) ( not ( = ?auto_14965 ?auto_14962 ) ) ( not ( = ?auto_14972 ?auto_14962 ) ) ( not ( = ?auto_14975 ?auto_14962 ) ) ( not ( = ?auto_14963 ?auto_14962 ) ) ( not ( = ?auto_14974 ?auto_14962 ) ) ( not ( = ?auto_14971 ?auto_14962 ) ) ( TRUCK-AT ?auto_14973 ?auto_14968 ) ( SURFACE-AT ?auto_14976 ?auto_14968 ) ( CLEAR ?auto_14976 ) ( LIFTING ?auto_14967 ?auto_14971 ) ( IS-CRATE ?auto_14971 ) ( not ( = ?auto_14956 ?auto_14976 ) ) ( not ( = ?auto_14957 ?auto_14976 ) ) ( not ( = ?auto_14958 ?auto_14976 ) ) ( not ( = ?auto_14966 ?auto_14976 ) ) ( not ( = ?auto_14965 ?auto_14976 ) ) ( not ( = ?auto_14972 ?auto_14976 ) ) ( not ( = ?auto_14975 ?auto_14976 ) ) ( not ( = ?auto_14963 ?auto_14976 ) ) ( not ( = ?auto_14974 ?auto_14976 ) ) ( not ( = ?auto_14971 ?auto_14976 ) ) ( not ( = ?auto_14962 ?auto_14976 ) ) )
    :subtasks
    ( ( !DROP ?auto_14967 ?auto_14971 ?auto_14976 ?auto_14968 )
      ( MAKE-ON ?auto_14956 ?auto_14957 )
      ( MAKE-ON-VERIFY ?auto_14956 ?auto_14957 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14977 - SURFACE
      ?auto_14978 - SURFACE
    )
    :vars
    (
      ?auto_14986 - HOIST
      ?auto_14985 - PLACE
      ?auto_14980 - PLACE
      ?auto_14997 - HOIST
      ?auto_14983 - SURFACE
      ?auto_14990 - SURFACE
      ?auto_14992 - PLACE
      ?auto_14989 - HOIST
      ?auto_14987 - SURFACE
      ?auto_14996 - SURFACE
      ?auto_14991 - PLACE
      ?auto_14981 - HOIST
      ?auto_14984 - SURFACE
      ?auto_14988 - SURFACE
      ?auto_14982 - SURFACE
      ?auto_14994 - SURFACE
      ?auto_14993 - SURFACE
      ?auto_14979 - TRUCK
      ?auto_14995 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14986 ?auto_14985 ) ( IS-CRATE ?auto_14977 ) ( not ( = ?auto_14977 ?auto_14978 ) ) ( not ( = ?auto_14980 ?auto_14985 ) ) ( HOIST-AT ?auto_14997 ?auto_14980 ) ( not ( = ?auto_14986 ?auto_14997 ) ) ( SURFACE-AT ?auto_14977 ?auto_14980 ) ( ON ?auto_14977 ?auto_14983 ) ( CLEAR ?auto_14977 ) ( not ( = ?auto_14977 ?auto_14983 ) ) ( not ( = ?auto_14978 ?auto_14983 ) ) ( IS-CRATE ?auto_14978 ) ( not ( = ?auto_14977 ?auto_14990 ) ) ( not ( = ?auto_14978 ?auto_14990 ) ) ( not ( = ?auto_14983 ?auto_14990 ) ) ( not ( = ?auto_14992 ?auto_14985 ) ) ( not ( = ?auto_14980 ?auto_14992 ) ) ( HOIST-AT ?auto_14989 ?auto_14992 ) ( not ( = ?auto_14986 ?auto_14989 ) ) ( not ( = ?auto_14997 ?auto_14989 ) ) ( SURFACE-AT ?auto_14978 ?auto_14992 ) ( ON ?auto_14978 ?auto_14987 ) ( CLEAR ?auto_14978 ) ( not ( = ?auto_14977 ?auto_14987 ) ) ( not ( = ?auto_14978 ?auto_14987 ) ) ( not ( = ?auto_14983 ?auto_14987 ) ) ( not ( = ?auto_14990 ?auto_14987 ) ) ( IS-CRATE ?auto_14990 ) ( not ( = ?auto_14977 ?auto_14996 ) ) ( not ( = ?auto_14978 ?auto_14996 ) ) ( not ( = ?auto_14983 ?auto_14996 ) ) ( not ( = ?auto_14990 ?auto_14996 ) ) ( not ( = ?auto_14987 ?auto_14996 ) ) ( not ( = ?auto_14991 ?auto_14985 ) ) ( not ( = ?auto_14980 ?auto_14991 ) ) ( not ( = ?auto_14992 ?auto_14991 ) ) ( HOIST-AT ?auto_14981 ?auto_14991 ) ( not ( = ?auto_14986 ?auto_14981 ) ) ( not ( = ?auto_14997 ?auto_14981 ) ) ( not ( = ?auto_14989 ?auto_14981 ) ) ( AVAILABLE ?auto_14981 ) ( SURFACE-AT ?auto_14990 ?auto_14991 ) ( ON ?auto_14990 ?auto_14984 ) ( CLEAR ?auto_14990 ) ( not ( = ?auto_14977 ?auto_14984 ) ) ( not ( = ?auto_14978 ?auto_14984 ) ) ( not ( = ?auto_14983 ?auto_14984 ) ) ( not ( = ?auto_14990 ?auto_14984 ) ) ( not ( = ?auto_14987 ?auto_14984 ) ) ( not ( = ?auto_14996 ?auto_14984 ) ) ( IS-CRATE ?auto_14996 ) ( not ( = ?auto_14977 ?auto_14988 ) ) ( not ( = ?auto_14978 ?auto_14988 ) ) ( not ( = ?auto_14983 ?auto_14988 ) ) ( not ( = ?auto_14990 ?auto_14988 ) ) ( not ( = ?auto_14987 ?auto_14988 ) ) ( not ( = ?auto_14996 ?auto_14988 ) ) ( not ( = ?auto_14984 ?auto_14988 ) ) ( AVAILABLE ?auto_14997 ) ( SURFACE-AT ?auto_14996 ?auto_14980 ) ( ON ?auto_14996 ?auto_14982 ) ( CLEAR ?auto_14996 ) ( not ( = ?auto_14977 ?auto_14982 ) ) ( not ( = ?auto_14978 ?auto_14982 ) ) ( not ( = ?auto_14983 ?auto_14982 ) ) ( not ( = ?auto_14990 ?auto_14982 ) ) ( not ( = ?auto_14987 ?auto_14982 ) ) ( not ( = ?auto_14996 ?auto_14982 ) ) ( not ( = ?auto_14984 ?auto_14982 ) ) ( not ( = ?auto_14988 ?auto_14982 ) ) ( IS-CRATE ?auto_14988 ) ( not ( = ?auto_14977 ?auto_14994 ) ) ( not ( = ?auto_14978 ?auto_14994 ) ) ( not ( = ?auto_14983 ?auto_14994 ) ) ( not ( = ?auto_14990 ?auto_14994 ) ) ( not ( = ?auto_14987 ?auto_14994 ) ) ( not ( = ?auto_14996 ?auto_14994 ) ) ( not ( = ?auto_14984 ?auto_14994 ) ) ( not ( = ?auto_14988 ?auto_14994 ) ) ( not ( = ?auto_14982 ?auto_14994 ) ) ( AVAILABLE ?auto_14989 ) ( SURFACE-AT ?auto_14988 ?auto_14992 ) ( ON ?auto_14988 ?auto_14993 ) ( CLEAR ?auto_14988 ) ( not ( = ?auto_14977 ?auto_14993 ) ) ( not ( = ?auto_14978 ?auto_14993 ) ) ( not ( = ?auto_14983 ?auto_14993 ) ) ( not ( = ?auto_14990 ?auto_14993 ) ) ( not ( = ?auto_14987 ?auto_14993 ) ) ( not ( = ?auto_14996 ?auto_14993 ) ) ( not ( = ?auto_14984 ?auto_14993 ) ) ( not ( = ?auto_14988 ?auto_14993 ) ) ( not ( = ?auto_14982 ?auto_14993 ) ) ( not ( = ?auto_14994 ?auto_14993 ) ) ( TRUCK-AT ?auto_14979 ?auto_14985 ) ( SURFACE-AT ?auto_14995 ?auto_14985 ) ( CLEAR ?auto_14995 ) ( IS-CRATE ?auto_14994 ) ( not ( = ?auto_14977 ?auto_14995 ) ) ( not ( = ?auto_14978 ?auto_14995 ) ) ( not ( = ?auto_14983 ?auto_14995 ) ) ( not ( = ?auto_14990 ?auto_14995 ) ) ( not ( = ?auto_14987 ?auto_14995 ) ) ( not ( = ?auto_14996 ?auto_14995 ) ) ( not ( = ?auto_14984 ?auto_14995 ) ) ( not ( = ?auto_14988 ?auto_14995 ) ) ( not ( = ?auto_14982 ?auto_14995 ) ) ( not ( = ?auto_14994 ?auto_14995 ) ) ( not ( = ?auto_14993 ?auto_14995 ) ) ( AVAILABLE ?auto_14986 ) ( IN ?auto_14994 ?auto_14979 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14986 ?auto_14994 ?auto_14979 ?auto_14985 )
      ( MAKE-ON ?auto_14977 ?auto_14978 )
      ( MAKE-ON-VERIFY ?auto_14977 ?auto_14978 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14998 - SURFACE
      ?auto_14999 - SURFACE
    )
    :vars
    (
      ?auto_15008 - HOIST
      ?auto_15013 - PLACE
      ?auto_15003 - PLACE
      ?auto_15007 - HOIST
      ?auto_15001 - SURFACE
      ?auto_15009 - SURFACE
      ?auto_15010 - PLACE
      ?auto_15005 - HOIST
      ?auto_15014 - SURFACE
      ?auto_15011 - SURFACE
      ?auto_15018 - PLACE
      ?auto_15000 - HOIST
      ?auto_15002 - SURFACE
      ?auto_15004 - SURFACE
      ?auto_15016 - SURFACE
      ?auto_15015 - SURFACE
      ?auto_15017 - SURFACE
      ?auto_15012 - SURFACE
      ?auto_15006 - TRUCK
      ?auto_15019 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15008 ?auto_15013 ) ( IS-CRATE ?auto_14998 ) ( not ( = ?auto_14998 ?auto_14999 ) ) ( not ( = ?auto_15003 ?auto_15013 ) ) ( HOIST-AT ?auto_15007 ?auto_15003 ) ( not ( = ?auto_15008 ?auto_15007 ) ) ( SURFACE-AT ?auto_14998 ?auto_15003 ) ( ON ?auto_14998 ?auto_15001 ) ( CLEAR ?auto_14998 ) ( not ( = ?auto_14998 ?auto_15001 ) ) ( not ( = ?auto_14999 ?auto_15001 ) ) ( IS-CRATE ?auto_14999 ) ( not ( = ?auto_14998 ?auto_15009 ) ) ( not ( = ?auto_14999 ?auto_15009 ) ) ( not ( = ?auto_15001 ?auto_15009 ) ) ( not ( = ?auto_15010 ?auto_15013 ) ) ( not ( = ?auto_15003 ?auto_15010 ) ) ( HOIST-AT ?auto_15005 ?auto_15010 ) ( not ( = ?auto_15008 ?auto_15005 ) ) ( not ( = ?auto_15007 ?auto_15005 ) ) ( SURFACE-AT ?auto_14999 ?auto_15010 ) ( ON ?auto_14999 ?auto_15014 ) ( CLEAR ?auto_14999 ) ( not ( = ?auto_14998 ?auto_15014 ) ) ( not ( = ?auto_14999 ?auto_15014 ) ) ( not ( = ?auto_15001 ?auto_15014 ) ) ( not ( = ?auto_15009 ?auto_15014 ) ) ( IS-CRATE ?auto_15009 ) ( not ( = ?auto_14998 ?auto_15011 ) ) ( not ( = ?auto_14999 ?auto_15011 ) ) ( not ( = ?auto_15001 ?auto_15011 ) ) ( not ( = ?auto_15009 ?auto_15011 ) ) ( not ( = ?auto_15014 ?auto_15011 ) ) ( not ( = ?auto_15018 ?auto_15013 ) ) ( not ( = ?auto_15003 ?auto_15018 ) ) ( not ( = ?auto_15010 ?auto_15018 ) ) ( HOIST-AT ?auto_15000 ?auto_15018 ) ( not ( = ?auto_15008 ?auto_15000 ) ) ( not ( = ?auto_15007 ?auto_15000 ) ) ( not ( = ?auto_15005 ?auto_15000 ) ) ( AVAILABLE ?auto_15000 ) ( SURFACE-AT ?auto_15009 ?auto_15018 ) ( ON ?auto_15009 ?auto_15002 ) ( CLEAR ?auto_15009 ) ( not ( = ?auto_14998 ?auto_15002 ) ) ( not ( = ?auto_14999 ?auto_15002 ) ) ( not ( = ?auto_15001 ?auto_15002 ) ) ( not ( = ?auto_15009 ?auto_15002 ) ) ( not ( = ?auto_15014 ?auto_15002 ) ) ( not ( = ?auto_15011 ?auto_15002 ) ) ( IS-CRATE ?auto_15011 ) ( not ( = ?auto_14998 ?auto_15004 ) ) ( not ( = ?auto_14999 ?auto_15004 ) ) ( not ( = ?auto_15001 ?auto_15004 ) ) ( not ( = ?auto_15009 ?auto_15004 ) ) ( not ( = ?auto_15014 ?auto_15004 ) ) ( not ( = ?auto_15011 ?auto_15004 ) ) ( not ( = ?auto_15002 ?auto_15004 ) ) ( AVAILABLE ?auto_15007 ) ( SURFACE-AT ?auto_15011 ?auto_15003 ) ( ON ?auto_15011 ?auto_15016 ) ( CLEAR ?auto_15011 ) ( not ( = ?auto_14998 ?auto_15016 ) ) ( not ( = ?auto_14999 ?auto_15016 ) ) ( not ( = ?auto_15001 ?auto_15016 ) ) ( not ( = ?auto_15009 ?auto_15016 ) ) ( not ( = ?auto_15014 ?auto_15016 ) ) ( not ( = ?auto_15011 ?auto_15016 ) ) ( not ( = ?auto_15002 ?auto_15016 ) ) ( not ( = ?auto_15004 ?auto_15016 ) ) ( IS-CRATE ?auto_15004 ) ( not ( = ?auto_14998 ?auto_15015 ) ) ( not ( = ?auto_14999 ?auto_15015 ) ) ( not ( = ?auto_15001 ?auto_15015 ) ) ( not ( = ?auto_15009 ?auto_15015 ) ) ( not ( = ?auto_15014 ?auto_15015 ) ) ( not ( = ?auto_15011 ?auto_15015 ) ) ( not ( = ?auto_15002 ?auto_15015 ) ) ( not ( = ?auto_15004 ?auto_15015 ) ) ( not ( = ?auto_15016 ?auto_15015 ) ) ( AVAILABLE ?auto_15005 ) ( SURFACE-AT ?auto_15004 ?auto_15010 ) ( ON ?auto_15004 ?auto_15017 ) ( CLEAR ?auto_15004 ) ( not ( = ?auto_14998 ?auto_15017 ) ) ( not ( = ?auto_14999 ?auto_15017 ) ) ( not ( = ?auto_15001 ?auto_15017 ) ) ( not ( = ?auto_15009 ?auto_15017 ) ) ( not ( = ?auto_15014 ?auto_15017 ) ) ( not ( = ?auto_15011 ?auto_15017 ) ) ( not ( = ?auto_15002 ?auto_15017 ) ) ( not ( = ?auto_15004 ?auto_15017 ) ) ( not ( = ?auto_15016 ?auto_15017 ) ) ( not ( = ?auto_15015 ?auto_15017 ) ) ( SURFACE-AT ?auto_15012 ?auto_15013 ) ( CLEAR ?auto_15012 ) ( IS-CRATE ?auto_15015 ) ( not ( = ?auto_14998 ?auto_15012 ) ) ( not ( = ?auto_14999 ?auto_15012 ) ) ( not ( = ?auto_15001 ?auto_15012 ) ) ( not ( = ?auto_15009 ?auto_15012 ) ) ( not ( = ?auto_15014 ?auto_15012 ) ) ( not ( = ?auto_15011 ?auto_15012 ) ) ( not ( = ?auto_15002 ?auto_15012 ) ) ( not ( = ?auto_15004 ?auto_15012 ) ) ( not ( = ?auto_15016 ?auto_15012 ) ) ( not ( = ?auto_15015 ?auto_15012 ) ) ( not ( = ?auto_15017 ?auto_15012 ) ) ( AVAILABLE ?auto_15008 ) ( IN ?auto_15015 ?auto_15006 ) ( TRUCK-AT ?auto_15006 ?auto_15019 ) ( not ( = ?auto_15019 ?auto_15013 ) ) ( not ( = ?auto_15003 ?auto_15019 ) ) ( not ( = ?auto_15010 ?auto_15019 ) ) ( not ( = ?auto_15018 ?auto_15019 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15006 ?auto_15019 ?auto_15013 )
      ( MAKE-ON ?auto_14998 ?auto_14999 )
      ( MAKE-ON-VERIFY ?auto_14998 ?auto_14999 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15020 - SURFACE
      ?auto_15021 - SURFACE
    )
    :vars
    (
      ?auto_15036 - HOIST
      ?auto_15026 - PLACE
      ?auto_15025 - PLACE
      ?auto_15034 - HOIST
      ?auto_15035 - SURFACE
      ?auto_15030 - SURFACE
      ?auto_15029 - PLACE
      ?auto_15024 - HOIST
      ?auto_15033 - SURFACE
      ?auto_15031 - SURFACE
      ?auto_15027 - PLACE
      ?auto_15037 - HOIST
      ?auto_15039 - SURFACE
      ?auto_15028 - SURFACE
      ?auto_15040 - SURFACE
      ?auto_15022 - SURFACE
      ?auto_15041 - SURFACE
      ?auto_15032 - SURFACE
      ?auto_15023 - TRUCK
      ?auto_15038 - PLACE
      ?auto_15042 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15036 ?auto_15026 ) ( IS-CRATE ?auto_15020 ) ( not ( = ?auto_15020 ?auto_15021 ) ) ( not ( = ?auto_15025 ?auto_15026 ) ) ( HOIST-AT ?auto_15034 ?auto_15025 ) ( not ( = ?auto_15036 ?auto_15034 ) ) ( SURFACE-AT ?auto_15020 ?auto_15025 ) ( ON ?auto_15020 ?auto_15035 ) ( CLEAR ?auto_15020 ) ( not ( = ?auto_15020 ?auto_15035 ) ) ( not ( = ?auto_15021 ?auto_15035 ) ) ( IS-CRATE ?auto_15021 ) ( not ( = ?auto_15020 ?auto_15030 ) ) ( not ( = ?auto_15021 ?auto_15030 ) ) ( not ( = ?auto_15035 ?auto_15030 ) ) ( not ( = ?auto_15029 ?auto_15026 ) ) ( not ( = ?auto_15025 ?auto_15029 ) ) ( HOIST-AT ?auto_15024 ?auto_15029 ) ( not ( = ?auto_15036 ?auto_15024 ) ) ( not ( = ?auto_15034 ?auto_15024 ) ) ( SURFACE-AT ?auto_15021 ?auto_15029 ) ( ON ?auto_15021 ?auto_15033 ) ( CLEAR ?auto_15021 ) ( not ( = ?auto_15020 ?auto_15033 ) ) ( not ( = ?auto_15021 ?auto_15033 ) ) ( not ( = ?auto_15035 ?auto_15033 ) ) ( not ( = ?auto_15030 ?auto_15033 ) ) ( IS-CRATE ?auto_15030 ) ( not ( = ?auto_15020 ?auto_15031 ) ) ( not ( = ?auto_15021 ?auto_15031 ) ) ( not ( = ?auto_15035 ?auto_15031 ) ) ( not ( = ?auto_15030 ?auto_15031 ) ) ( not ( = ?auto_15033 ?auto_15031 ) ) ( not ( = ?auto_15027 ?auto_15026 ) ) ( not ( = ?auto_15025 ?auto_15027 ) ) ( not ( = ?auto_15029 ?auto_15027 ) ) ( HOIST-AT ?auto_15037 ?auto_15027 ) ( not ( = ?auto_15036 ?auto_15037 ) ) ( not ( = ?auto_15034 ?auto_15037 ) ) ( not ( = ?auto_15024 ?auto_15037 ) ) ( AVAILABLE ?auto_15037 ) ( SURFACE-AT ?auto_15030 ?auto_15027 ) ( ON ?auto_15030 ?auto_15039 ) ( CLEAR ?auto_15030 ) ( not ( = ?auto_15020 ?auto_15039 ) ) ( not ( = ?auto_15021 ?auto_15039 ) ) ( not ( = ?auto_15035 ?auto_15039 ) ) ( not ( = ?auto_15030 ?auto_15039 ) ) ( not ( = ?auto_15033 ?auto_15039 ) ) ( not ( = ?auto_15031 ?auto_15039 ) ) ( IS-CRATE ?auto_15031 ) ( not ( = ?auto_15020 ?auto_15028 ) ) ( not ( = ?auto_15021 ?auto_15028 ) ) ( not ( = ?auto_15035 ?auto_15028 ) ) ( not ( = ?auto_15030 ?auto_15028 ) ) ( not ( = ?auto_15033 ?auto_15028 ) ) ( not ( = ?auto_15031 ?auto_15028 ) ) ( not ( = ?auto_15039 ?auto_15028 ) ) ( AVAILABLE ?auto_15034 ) ( SURFACE-AT ?auto_15031 ?auto_15025 ) ( ON ?auto_15031 ?auto_15040 ) ( CLEAR ?auto_15031 ) ( not ( = ?auto_15020 ?auto_15040 ) ) ( not ( = ?auto_15021 ?auto_15040 ) ) ( not ( = ?auto_15035 ?auto_15040 ) ) ( not ( = ?auto_15030 ?auto_15040 ) ) ( not ( = ?auto_15033 ?auto_15040 ) ) ( not ( = ?auto_15031 ?auto_15040 ) ) ( not ( = ?auto_15039 ?auto_15040 ) ) ( not ( = ?auto_15028 ?auto_15040 ) ) ( IS-CRATE ?auto_15028 ) ( not ( = ?auto_15020 ?auto_15022 ) ) ( not ( = ?auto_15021 ?auto_15022 ) ) ( not ( = ?auto_15035 ?auto_15022 ) ) ( not ( = ?auto_15030 ?auto_15022 ) ) ( not ( = ?auto_15033 ?auto_15022 ) ) ( not ( = ?auto_15031 ?auto_15022 ) ) ( not ( = ?auto_15039 ?auto_15022 ) ) ( not ( = ?auto_15028 ?auto_15022 ) ) ( not ( = ?auto_15040 ?auto_15022 ) ) ( AVAILABLE ?auto_15024 ) ( SURFACE-AT ?auto_15028 ?auto_15029 ) ( ON ?auto_15028 ?auto_15041 ) ( CLEAR ?auto_15028 ) ( not ( = ?auto_15020 ?auto_15041 ) ) ( not ( = ?auto_15021 ?auto_15041 ) ) ( not ( = ?auto_15035 ?auto_15041 ) ) ( not ( = ?auto_15030 ?auto_15041 ) ) ( not ( = ?auto_15033 ?auto_15041 ) ) ( not ( = ?auto_15031 ?auto_15041 ) ) ( not ( = ?auto_15039 ?auto_15041 ) ) ( not ( = ?auto_15028 ?auto_15041 ) ) ( not ( = ?auto_15040 ?auto_15041 ) ) ( not ( = ?auto_15022 ?auto_15041 ) ) ( SURFACE-AT ?auto_15032 ?auto_15026 ) ( CLEAR ?auto_15032 ) ( IS-CRATE ?auto_15022 ) ( not ( = ?auto_15020 ?auto_15032 ) ) ( not ( = ?auto_15021 ?auto_15032 ) ) ( not ( = ?auto_15035 ?auto_15032 ) ) ( not ( = ?auto_15030 ?auto_15032 ) ) ( not ( = ?auto_15033 ?auto_15032 ) ) ( not ( = ?auto_15031 ?auto_15032 ) ) ( not ( = ?auto_15039 ?auto_15032 ) ) ( not ( = ?auto_15028 ?auto_15032 ) ) ( not ( = ?auto_15040 ?auto_15032 ) ) ( not ( = ?auto_15022 ?auto_15032 ) ) ( not ( = ?auto_15041 ?auto_15032 ) ) ( AVAILABLE ?auto_15036 ) ( TRUCK-AT ?auto_15023 ?auto_15038 ) ( not ( = ?auto_15038 ?auto_15026 ) ) ( not ( = ?auto_15025 ?auto_15038 ) ) ( not ( = ?auto_15029 ?auto_15038 ) ) ( not ( = ?auto_15027 ?auto_15038 ) ) ( HOIST-AT ?auto_15042 ?auto_15038 ) ( LIFTING ?auto_15042 ?auto_15022 ) ( not ( = ?auto_15036 ?auto_15042 ) ) ( not ( = ?auto_15034 ?auto_15042 ) ) ( not ( = ?auto_15024 ?auto_15042 ) ) ( not ( = ?auto_15037 ?auto_15042 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15042 ?auto_15022 ?auto_15023 ?auto_15038 )
      ( MAKE-ON ?auto_15020 ?auto_15021 )
      ( MAKE-ON-VERIFY ?auto_15020 ?auto_15021 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15043 - SURFACE
      ?auto_15044 - SURFACE
    )
    :vars
    (
      ?auto_15063 - HOIST
      ?auto_15065 - PLACE
      ?auto_15055 - PLACE
      ?auto_15060 - HOIST
      ?auto_15047 - SURFACE
      ?auto_15054 - SURFACE
      ?auto_15049 - PLACE
      ?auto_15050 - HOIST
      ?auto_15059 - SURFACE
      ?auto_15045 - SURFACE
      ?auto_15056 - PLACE
      ?auto_15057 - HOIST
      ?auto_15053 - SURFACE
      ?auto_15046 - SURFACE
      ?auto_15052 - SURFACE
      ?auto_15062 - SURFACE
      ?auto_15051 - SURFACE
      ?auto_15058 - SURFACE
      ?auto_15064 - TRUCK
      ?auto_15048 - PLACE
      ?auto_15061 - HOIST
      ?auto_15066 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15063 ?auto_15065 ) ( IS-CRATE ?auto_15043 ) ( not ( = ?auto_15043 ?auto_15044 ) ) ( not ( = ?auto_15055 ?auto_15065 ) ) ( HOIST-AT ?auto_15060 ?auto_15055 ) ( not ( = ?auto_15063 ?auto_15060 ) ) ( SURFACE-AT ?auto_15043 ?auto_15055 ) ( ON ?auto_15043 ?auto_15047 ) ( CLEAR ?auto_15043 ) ( not ( = ?auto_15043 ?auto_15047 ) ) ( not ( = ?auto_15044 ?auto_15047 ) ) ( IS-CRATE ?auto_15044 ) ( not ( = ?auto_15043 ?auto_15054 ) ) ( not ( = ?auto_15044 ?auto_15054 ) ) ( not ( = ?auto_15047 ?auto_15054 ) ) ( not ( = ?auto_15049 ?auto_15065 ) ) ( not ( = ?auto_15055 ?auto_15049 ) ) ( HOIST-AT ?auto_15050 ?auto_15049 ) ( not ( = ?auto_15063 ?auto_15050 ) ) ( not ( = ?auto_15060 ?auto_15050 ) ) ( SURFACE-AT ?auto_15044 ?auto_15049 ) ( ON ?auto_15044 ?auto_15059 ) ( CLEAR ?auto_15044 ) ( not ( = ?auto_15043 ?auto_15059 ) ) ( not ( = ?auto_15044 ?auto_15059 ) ) ( not ( = ?auto_15047 ?auto_15059 ) ) ( not ( = ?auto_15054 ?auto_15059 ) ) ( IS-CRATE ?auto_15054 ) ( not ( = ?auto_15043 ?auto_15045 ) ) ( not ( = ?auto_15044 ?auto_15045 ) ) ( not ( = ?auto_15047 ?auto_15045 ) ) ( not ( = ?auto_15054 ?auto_15045 ) ) ( not ( = ?auto_15059 ?auto_15045 ) ) ( not ( = ?auto_15056 ?auto_15065 ) ) ( not ( = ?auto_15055 ?auto_15056 ) ) ( not ( = ?auto_15049 ?auto_15056 ) ) ( HOIST-AT ?auto_15057 ?auto_15056 ) ( not ( = ?auto_15063 ?auto_15057 ) ) ( not ( = ?auto_15060 ?auto_15057 ) ) ( not ( = ?auto_15050 ?auto_15057 ) ) ( AVAILABLE ?auto_15057 ) ( SURFACE-AT ?auto_15054 ?auto_15056 ) ( ON ?auto_15054 ?auto_15053 ) ( CLEAR ?auto_15054 ) ( not ( = ?auto_15043 ?auto_15053 ) ) ( not ( = ?auto_15044 ?auto_15053 ) ) ( not ( = ?auto_15047 ?auto_15053 ) ) ( not ( = ?auto_15054 ?auto_15053 ) ) ( not ( = ?auto_15059 ?auto_15053 ) ) ( not ( = ?auto_15045 ?auto_15053 ) ) ( IS-CRATE ?auto_15045 ) ( not ( = ?auto_15043 ?auto_15046 ) ) ( not ( = ?auto_15044 ?auto_15046 ) ) ( not ( = ?auto_15047 ?auto_15046 ) ) ( not ( = ?auto_15054 ?auto_15046 ) ) ( not ( = ?auto_15059 ?auto_15046 ) ) ( not ( = ?auto_15045 ?auto_15046 ) ) ( not ( = ?auto_15053 ?auto_15046 ) ) ( AVAILABLE ?auto_15060 ) ( SURFACE-AT ?auto_15045 ?auto_15055 ) ( ON ?auto_15045 ?auto_15052 ) ( CLEAR ?auto_15045 ) ( not ( = ?auto_15043 ?auto_15052 ) ) ( not ( = ?auto_15044 ?auto_15052 ) ) ( not ( = ?auto_15047 ?auto_15052 ) ) ( not ( = ?auto_15054 ?auto_15052 ) ) ( not ( = ?auto_15059 ?auto_15052 ) ) ( not ( = ?auto_15045 ?auto_15052 ) ) ( not ( = ?auto_15053 ?auto_15052 ) ) ( not ( = ?auto_15046 ?auto_15052 ) ) ( IS-CRATE ?auto_15046 ) ( not ( = ?auto_15043 ?auto_15062 ) ) ( not ( = ?auto_15044 ?auto_15062 ) ) ( not ( = ?auto_15047 ?auto_15062 ) ) ( not ( = ?auto_15054 ?auto_15062 ) ) ( not ( = ?auto_15059 ?auto_15062 ) ) ( not ( = ?auto_15045 ?auto_15062 ) ) ( not ( = ?auto_15053 ?auto_15062 ) ) ( not ( = ?auto_15046 ?auto_15062 ) ) ( not ( = ?auto_15052 ?auto_15062 ) ) ( AVAILABLE ?auto_15050 ) ( SURFACE-AT ?auto_15046 ?auto_15049 ) ( ON ?auto_15046 ?auto_15051 ) ( CLEAR ?auto_15046 ) ( not ( = ?auto_15043 ?auto_15051 ) ) ( not ( = ?auto_15044 ?auto_15051 ) ) ( not ( = ?auto_15047 ?auto_15051 ) ) ( not ( = ?auto_15054 ?auto_15051 ) ) ( not ( = ?auto_15059 ?auto_15051 ) ) ( not ( = ?auto_15045 ?auto_15051 ) ) ( not ( = ?auto_15053 ?auto_15051 ) ) ( not ( = ?auto_15046 ?auto_15051 ) ) ( not ( = ?auto_15052 ?auto_15051 ) ) ( not ( = ?auto_15062 ?auto_15051 ) ) ( SURFACE-AT ?auto_15058 ?auto_15065 ) ( CLEAR ?auto_15058 ) ( IS-CRATE ?auto_15062 ) ( not ( = ?auto_15043 ?auto_15058 ) ) ( not ( = ?auto_15044 ?auto_15058 ) ) ( not ( = ?auto_15047 ?auto_15058 ) ) ( not ( = ?auto_15054 ?auto_15058 ) ) ( not ( = ?auto_15059 ?auto_15058 ) ) ( not ( = ?auto_15045 ?auto_15058 ) ) ( not ( = ?auto_15053 ?auto_15058 ) ) ( not ( = ?auto_15046 ?auto_15058 ) ) ( not ( = ?auto_15052 ?auto_15058 ) ) ( not ( = ?auto_15062 ?auto_15058 ) ) ( not ( = ?auto_15051 ?auto_15058 ) ) ( AVAILABLE ?auto_15063 ) ( TRUCK-AT ?auto_15064 ?auto_15048 ) ( not ( = ?auto_15048 ?auto_15065 ) ) ( not ( = ?auto_15055 ?auto_15048 ) ) ( not ( = ?auto_15049 ?auto_15048 ) ) ( not ( = ?auto_15056 ?auto_15048 ) ) ( HOIST-AT ?auto_15061 ?auto_15048 ) ( not ( = ?auto_15063 ?auto_15061 ) ) ( not ( = ?auto_15060 ?auto_15061 ) ) ( not ( = ?auto_15050 ?auto_15061 ) ) ( not ( = ?auto_15057 ?auto_15061 ) ) ( AVAILABLE ?auto_15061 ) ( SURFACE-AT ?auto_15062 ?auto_15048 ) ( ON ?auto_15062 ?auto_15066 ) ( CLEAR ?auto_15062 ) ( not ( = ?auto_15043 ?auto_15066 ) ) ( not ( = ?auto_15044 ?auto_15066 ) ) ( not ( = ?auto_15047 ?auto_15066 ) ) ( not ( = ?auto_15054 ?auto_15066 ) ) ( not ( = ?auto_15059 ?auto_15066 ) ) ( not ( = ?auto_15045 ?auto_15066 ) ) ( not ( = ?auto_15053 ?auto_15066 ) ) ( not ( = ?auto_15046 ?auto_15066 ) ) ( not ( = ?auto_15052 ?auto_15066 ) ) ( not ( = ?auto_15062 ?auto_15066 ) ) ( not ( = ?auto_15051 ?auto_15066 ) ) ( not ( = ?auto_15058 ?auto_15066 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15061 ?auto_15062 ?auto_15066 ?auto_15048 )
      ( MAKE-ON ?auto_15043 ?auto_15044 )
      ( MAKE-ON-VERIFY ?auto_15043 ?auto_15044 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_15067 - SURFACE
      ?auto_15068 - SURFACE
    )
    :vars
    (
      ?auto_15076 - HOIST
      ?auto_15069 - PLACE
      ?auto_15071 - PLACE
      ?auto_15083 - HOIST
      ?auto_15085 - SURFACE
      ?auto_15072 - SURFACE
      ?auto_15086 - PLACE
      ?auto_15077 - HOIST
      ?auto_15089 - SURFACE
      ?auto_15084 - SURFACE
      ?auto_15074 - PLACE
      ?auto_15073 - HOIST
      ?auto_15082 - SURFACE
      ?auto_15081 - SURFACE
      ?auto_15080 - SURFACE
      ?auto_15078 - SURFACE
      ?auto_15090 - SURFACE
      ?auto_15079 - SURFACE
      ?auto_15087 - PLACE
      ?auto_15075 - HOIST
      ?auto_15088 - SURFACE
      ?auto_15070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15076 ?auto_15069 ) ( IS-CRATE ?auto_15067 ) ( not ( = ?auto_15067 ?auto_15068 ) ) ( not ( = ?auto_15071 ?auto_15069 ) ) ( HOIST-AT ?auto_15083 ?auto_15071 ) ( not ( = ?auto_15076 ?auto_15083 ) ) ( SURFACE-AT ?auto_15067 ?auto_15071 ) ( ON ?auto_15067 ?auto_15085 ) ( CLEAR ?auto_15067 ) ( not ( = ?auto_15067 ?auto_15085 ) ) ( not ( = ?auto_15068 ?auto_15085 ) ) ( IS-CRATE ?auto_15068 ) ( not ( = ?auto_15067 ?auto_15072 ) ) ( not ( = ?auto_15068 ?auto_15072 ) ) ( not ( = ?auto_15085 ?auto_15072 ) ) ( not ( = ?auto_15086 ?auto_15069 ) ) ( not ( = ?auto_15071 ?auto_15086 ) ) ( HOIST-AT ?auto_15077 ?auto_15086 ) ( not ( = ?auto_15076 ?auto_15077 ) ) ( not ( = ?auto_15083 ?auto_15077 ) ) ( SURFACE-AT ?auto_15068 ?auto_15086 ) ( ON ?auto_15068 ?auto_15089 ) ( CLEAR ?auto_15068 ) ( not ( = ?auto_15067 ?auto_15089 ) ) ( not ( = ?auto_15068 ?auto_15089 ) ) ( not ( = ?auto_15085 ?auto_15089 ) ) ( not ( = ?auto_15072 ?auto_15089 ) ) ( IS-CRATE ?auto_15072 ) ( not ( = ?auto_15067 ?auto_15084 ) ) ( not ( = ?auto_15068 ?auto_15084 ) ) ( not ( = ?auto_15085 ?auto_15084 ) ) ( not ( = ?auto_15072 ?auto_15084 ) ) ( not ( = ?auto_15089 ?auto_15084 ) ) ( not ( = ?auto_15074 ?auto_15069 ) ) ( not ( = ?auto_15071 ?auto_15074 ) ) ( not ( = ?auto_15086 ?auto_15074 ) ) ( HOIST-AT ?auto_15073 ?auto_15074 ) ( not ( = ?auto_15076 ?auto_15073 ) ) ( not ( = ?auto_15083 ?auto_15073 ) ) ( not ( = ?auto_15077 ?auto_15073 ) ) ( AVAILABLE ?auto_15073 ) ( SURFACE-AT ?auto_15072 ?auto_15074 ) ( ON ?auto_15072 ?auto_15082 ) ( CLEAR ?auto_15072 ) ( not ( = ?auto_15067 ?auto_15082 ) ) ( not ( = ?auto_15068 ?auto_15082 ) ) ( not ( = ?auto_15085 ?auto_15082 ) ) ( not ( = ?auto_15072 ?auto_15082 ) ) ( not ( = ?auto_15089 ?auto_15082 ) ) ( not ( = ?auto_15084 ?auto_15082 ) ) ( IS-CRATE ?auto_15084 ) ( not ( = ?auto_15067 ?auto_15081 ) ) ( not ( = ?auto_15068 ?auto_15081 ) ) ( not ( = ?auto_15085 ?auto_15081 ) ) ( not ( = ?auto_15072 ?auto_15081 ) ) ( not ( = ?auto_15089 ?auto_15081 ) ) ( not ( = ?auto_15084 ?auto_15081 ) ) ( not ( = ?auto_15082 ?auto_15081 ) ) ( AVAILABLE ?auto_15083 ) ( SURFACE-AT ?auto_15084 ?auto_15071 ) ( ON ?auto_15084 ?auto_15080 ) ( CLEAR ?auto_15084 ) ( not ( = ?auto_15067 ?auto_15080 ) ) ( not ( = ?auto_15068 ?auto_15080 ) ) ( not ( = ?auto_15085 ?auto_15080 ) ) ( not ( = ?auto_15072 ?auto_15080 ) ) ( not ( = ?auto_15089 ?auto_15080 ) ) ( not ( = ?auto_15084 ?auto_15080 ) ) ( not ( = ?auto_15082 ?auto_15080 ) ) ( not ( = ?auto_15081 ?auto_15080 ) ) ( IS-CRATE ?auto_15081 ) ( not ( = ?auto_15067 ?auto_15078 ) ) ( not ( = ?auto_15068 ?auto_15078 ) ) ( not ( = ?auto_15085 ?auto_15078 ) ) ( not ( = ?auto_15072 ?auto_15078 ) ) ( not ( = ?auto_15089 ?auto_15078 ) ) ( not ( = ?auto_15084 ?auto_15078 ) ) ( not ( = ?auto_15082 ?auto_15078 ) ) ( not ( = ?auto_15081 ?auto_15078 ) ) ( not ( = ?auto_15080 ?auto_15078 ) ) ( AVAILABLE ?auto_15077 ) ( SURFACE-AT ?auto_15081 ?auto_15086 ) ( ON ?auto_15081 ?auto_15090 ) ( CLEAR ?auto_15081 ) ( not ( = ?auto_15067 ?auto_15090 ) ) ( not ( = ?auto_15068 ?auto_15090 ) ) ( not ( = ?auto_15085 ?auto_15090 ) ) ( not ( = ?auto_15072 ?auto_15090 ) ) ( not ( = ?auto_15089 ?auto_15090 ) ) ( not ( = ?auto_15084 ?auto_15090 ) ) ( not ( = ?auto_15082 ?auto_15090 ) ) ( not ( = ?auto_15081 ?auto_15090 ) ) ( not ( = ?auto_15080 ?auto_15090 ) ) ( not ( = ?auto_15078 ?auto_15090 ) ) ( SURFACE-AT ?auto_15079 ?auto_15069 ) ( CLEAR ?auto_15079 ) ( IS-CRATE ?auto_15078 ) ( not ( = ?auto_15067 ?auto_15079 ) ) ( not ( = ?auto_15068 ?auto_15079 ) ) ( not ( = ?auto_15085 ?auto_15079 ) ) ( not ( = ?auto_15072 ?auto_15079 ) ) ( not ( = ?auto_15089 ?auto_15079 ) ) ( not ( = ?auto_15084 ?auto_15079 ) ) ( not ( = ?auto_15082 ?auto_15079 ) ) ( not ( = ?auto_15081 ?auto_15079 ) ) ( not ( = ?auto_15080 ?auto_15079 ) ) ( not ( = ?auto_15078 ?auto_15079 ) ) ( not ( = ?auto_15090 ?auto_15079 ) ) ( AVAILABLE ?auto_15076 ) ( not ( = ?auto_15087 ?auto_15069 ) ) ( not ( = ?auto_15071 ?auto_15087 ) ) ( not ( = ?auto_15086 ?auto_15087 ) ) ( not ( = ?auto_15074 ?auto_15087 ) ) ( HOIST-AT ?auto_15075 ?auto_15087 ) ( not ( = ?auto_15076 ?auto_15075 ) ) ( not ( = ?auto_15083 ?auto_15075 ) ) ( not ( = ?auto_15077 ?auto_15075 ) ) ( not ( = ?auto_15073 ?auto_15075 ) ) ( AVAILABLE ?auto_15075 ) ( SURFACE-AT ?auto_15078 ?auto_15087 ) ( ON ?auto_15078 ?auto_15088 ) ( CLEAR ?auto_15078 ) ( not ( = ?auto_15067 ?auto_15088 ) ) ( not ( = ?auto_15068 ?auto_15088 ) ) ( not ( = ?auto_15085 ?auto_15088 ) ) ( not ( = ?auto_15072 ?auto_15088 ) ) ( not ( = ?auto_15089 ?auto_15088 ) ) ( not ( = ?auto_15084 ?auto_15088 ) ) ( not ( = ?auto_15082 ?auto_15088 ) ) ( not ( = ?auto_15081 ?auto_15088 ) ) ( not ( = ?auto_15080 ?auto_15088 ) ) ( not ( = ?auto_15078 ?auto_15088 ) ) ( not ( = ?auto_15090 ?auto_15088 ) ) ( not ( = ?auto_15079 ?auto_15088 ) ) ( TRUCK-AT ?auto_15070 ?auto_15069 ) )
    :subtasks
    ( ( !DRIVE ?auto_15070 ?auto_15069 ?auto_15087 )
      ( MAKE-ON ?auto_15067 ?auto_15068 )
      ( MAKE-ON-VERIFY ?auto_15067 ?auto_15068 ) )
  )

)

