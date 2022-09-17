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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13534 - SURFACE
      ?auto_13535 - SURFACE
    )
    :vars
    (
      ?auto_13536 - HOIST
      ?auto_13537 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13536 ?auto_13537 ) ( SURFACE-AT ?auto_13534 ?auto_13537 ) ( CLEAR ?auto_13534 ) ( LIFTING ?auto_13536 ?auto_13535 ) ( IS-CRATE ?auto_13535 ) ( not ( = ?auto_13534 ?auto_13535 ) ) )
    :subtasks
    ( ( !DROP ?auto_13536 ?auto_13535 ?auto_13534 ?auto_13537 )
      ( MAKE-1CRATE-VERIFY ?auto_13534 ?auto_13535 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13538 - SURFACE
      ?auto_13539 - SURFACE
    )
    :vars
    (
      ?auto_13540 - HOIST
      ?auto_13541 - PLACE
      ?auto_13542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13540 ?auto_13541 ) ( SURFACE-AT ?auto_13538 ?auto_13541 ) ( CLEAR ?auto_13538 ) ( IS-CRATE ?auto_13539 ) ( not ( = ?auto_13538 ?auto_13539 ) ) ( TRUCK-AT ?auto_13542 ?auto_13541 ) ( AVAILABLE ?auto_13540 ) ( IN ?auto_13539 ?auto_13542 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13540 ?auto_13539 ?auto_13542 ?auto_13541 )
      ( MAKE-1CRATE ?auto_13538 ?auto_13539 )
      ( MAKE-1CRATE-VERIFY ?auto_13538 ?auto_13539 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13543 - SURFACE
      ?auto_13544 - SURFACE
    )
    :vars
    (
      ?auto_13547 - HOIST
      ?auto_13546 - PLACE
      ?auto_13545 - TRUCK
      ?auto_13548 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13547 ?auto_13546 ) ( SURFACE-AT ?auto_13543 ?auto_13546 ) ( CLEAR ?auto_13543 ) ( IS-CRATE ?auto_13544 ) ( not ( = ?auto_13543 ?auto_13544 ) ) ( AVAILABLE ?auto_13547 ) ( IN ?auto_13544 ?auto_13545 ) ( TRUCK-AT ?auto_13545 ?auto_13548 ) ( not ( = ?auto_13548 ?auto_13546 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13545 ?auto_13548 ?auto_13546 )
      ( MAKE-1CRATE ?auto_13543 ?auto_13544 )
      ( MAKE-1CRATE-VERIFY ?auto_13543 ?auto_13544 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13549 - SURFACE
      ?auto_13550 - SURFACE
    )
    :vars
    (
      ?auto_13551 - HOIST
      ?auto_13554 - PLACE
      ?auto_13552 - TRUCK
      ?auto_13553 - PLACE
      ?auto_13555 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13551 ?auto_13554 ) ( SURFACE-AT ?auto_13549 ?auto_13554 ) ( CLEAR ?auto_13549 ) ( IS-CRATE ?auto_13550 ) ( not ( = ?auto_13549 ?auto_13550 ) ) ( AVAILABLE ?auto_13551 ) ( TRUCK-AT ?auto_13552 ?auto_13553 ) ( not ( = ?auto_13553 ?auto_13554 ) ) ( HOIST-AT ?auto_13555 ?auto_13553 ) ( LIFTING ?auto_13555 ?auto_13550 ) ( not ( = ?auto_13551 ?auto_13555 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13555 ?auto_13550 ?auto_13552 ?auto_13553 )
      ( MAKE-1CRATE ?auto_13549 ?auto_13550 )
      ( MAKE-1CRATE-VERIFY ?auto_13549 ?auto_13550 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13556 - SURFACE
      ?auto_13557 - SURFACE
    )
    :vars
    (
      ?auto_13562 - HOIST
      ?auto_13558 - PLACE
      ?auto_13559 - TRUCK
      ?auto_13560 - PLACE
      ?auto_13561 - HOIST
      ?auto_13563 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13562 ?auto_13558 ) ( SURFACE-AT ?auto_13556 ?auto_13558 ) ( CLEAR ?auto_13556 ) ( IS-CRATE ?auto_13557 ) ( not ( = ?auto_13556 ?auto_13557 ) ) ( AVAILABLE ?auto_13562 ) ( TRUCK-AT ?auto_13559 ?auto_13560 ) ( not ( = ?auto_13560 ?auto_13558 ) ) ( HOIST-AT ?auto_13561 ?auto_13560 ) ( not ( = ?auto_13562 ?auto_13561 ) ) ( AVAILABLE ?auto_13561 ) ( SURFACE-AT ?auto_13557 ?auto_13560 ) ( ON ?auto_13557 ?auto_13563 ) ( CLEAR ?auto_13557 ) ( not ( = ?auto_13556 ?auto_13563 ) ) ( not ( = ?auto_13557 ?auto_13563 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13561 ?auto_13557 ?auto_13563 ?auto_13560 )
      ( MAKE-1CRATE ?auto_13556 ?auto_13557 )
      ( MAKE-1CRATE-VERIFY ?auto_13556 ?auto_13557 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13564 - SURFACE
      ?auto_13565 - SURFACE
    )
    :vars
    (
      ?auto_13571 - HOIST
      ?auto_13569 - PLACE
      ?auto_13566 - PLACE
      ?auto_13567 - HOIST
      ?auto_13570 - SURFACE
      ?auto_13568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13571 ?auto_13569 ) ( SURFACE-AT ?auto_13564 ?auto_13569 ) ( CLEAR ?auto_13564 ) ( IS-CRATE ?auto_13565 ) ( not ( = ?auto_13564 ?auto_13565 ) ) ( AVAILABLE ?auto_13571 ) ( not ( = ?auto_13566 ?auto_13569 ) ) ( HOIST-AT ?auto_13567 ?auto_13566 ) ( not ( = ?auto_13571 ?auto_13567 ) ) ( AVAILABLE ?auto_13567 ) ( SURFACE-AT ?auto_13565 ?auto_13566 ) ( ON ?auto_13565 ?auto_13570 ) ( CLEAR ?auto_13565 ) ( not ( = ?auto_13564 ?auto_13570 ) ) ( not ( = ?auto_13565 ?auto_13570 ) ) ( TRUCK-AT ?auto_13568 ?auto_13569 ) )
    :subtasks
    ( ( !DRIVE ?auto_13568 ?auto_13569 ?auto_13566 )
      ( MAKE-1CRATE ?auto_13564 ?auto_13565 )
      ( MAKE-1CRATE-VERIFY ?auto_13564 ?auto_13565 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13577 - SURFACE
      ?auto_13578 - SURFACE
    )
    :vars
    (
      ?auto_13579 - HOIST
      ?auto_13580 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13579 ?auto_13580 ) ( SURFACE-AT ?auto_13577 ?auto_13580 ) ( CLEAR ?auto_13577 ) ( LIFTING ?auto_13579 ?auto_13578 ) ( IS-CRATE ?auto_13578 ) ( not ( = ?auto_13577 ?auto_13578 ) ) )
    :subtasks
    ( ( !DROP ?auto_13579 ?auto_13578 ?auto_13577 ?auto_13580 )
      ( MAKE-1CRATE-VERIFY ?auto_13577 ?auto_13578 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13581 - SURFACE
      ?auto_13582 - SURFACE
      ?auto_13583 - SURFACE
    )
    :vars
    (
      ?auto_13585 - HOIST
      ?auto_13584 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13585 ?auto_13584 ) ( SURFACE-AT ?auto_13582 ?auto_13584 ) ( CLEAR ?auto_13582 ) ( LIFTING ?auto_13585 ?auto_13583 ) ( IS-CRATE ?auto_13583 ) ( not ( = ?auto_13582 ?auto_13583 ) ) ( ON ?auto_13582 ?auto_13581 ) ( not ( = ?auto_13581 ?auto_13582 ) ) ( not ( = ?auto_13581 ?auto_13583 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13582 ?auto_13583 )
      ( MAKE-2CRATE-VERIFY ?auto_13581 ?auto_13582 ?auto_13583 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13586 - SURFACE
      ?auto_13587 - SURFACE
    )
    :vars
    (
      ?auto_13589 - HOIST
      ?auto_13588 - PLACE
      ?auto_13590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13589 ?auto_13588 ) ( SURFACE-AT ?auto_13586 ?auto_13588 ) ( CLEAR ?auto_13586 ) ( IS-CRATE ?auto_13587 ) ( not ( = ?auto_13586 ?auto_13587 ) ) ( TRUCK-AT ?auto_13590 ?auto_13588 ) ( AVAILABLE ?auto_13589 ) ( IN ?auto_13587 ?auto_13590 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13589 ?auto_13587 ?auto_13590 ?auto_13588 )
      ( MAKE-1CRATE ?auto_13586 ?auto_13587 )
      ( MAKE-1CRATE-VERIFY ?auto_13586 ?auto_13587 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13591 - SURFACE
      ?auto_13592 - SURFACE
      ?auto_13593 - SURFACE
    )
    :vars
    (
      ?auto_13595 - HOIST
      ?auto_13594 - PLACE
      ?auto_13596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13595 ?auto_13594 ) ( SURFACE-AT ?auto_13592 ?auto_13594 ) ( CLEAR ?auto_13592 ) ( IS-CRATE ?auto_13593 ) ( not ( = ?auto_13592 ?auto_13593 ) ) ( TRUCK-AT ?auto_13596 ?auto_13594 ) ( AVAILABLE ?auto_13595 ) ( IN ?auto_13593 ?auto_13596 ) ( ON ?auto_13592 ?auto_13591 ) ( not ( = ?auto_13591 ?auto_13592 ) ) ( not ( = ?auto_13591 ?auto_13593 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13592 ?auto_13593 )
      ( MAKE-2CRATE-VERIFY ?auto_13591 ?auto_13592 ?auto_13593 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13597 - SURFACE
      ?auto_13598 - SURFACE
    )
    :vars
    (
      ?auto_13602 - HOIST
      ?auto_13599 - PLACE
      ?auto_13600 - TRUCK
      ?auto_13601 - SURFACE
      ?auto_13603 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13602 ?auto_13599 ) ( SURFACE-AT ?auto_13597 ?auto_13599 ) ( CLEAR ?auto_13597 ) ( IS-CRATE ?auto_13598 ) ( not ( = ?auto_13597 ?auto_13598 ) ) ( AVAILABLE ?auto_13602 ) ( IN ?auto_13598 ?auto_13600 ) ( ON ?auto_13597 ?auto_13601 ) ( not ( = ?auto_13601 ?auto_13597 ) ) ( not ( = ?auto_13601 ?auto_13598 ) ) ( TRUCK-AT ?auto_13600 ?auto_13603 ) ( not ( = ?auto_13603 ?auto_13599 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13600 ?auto_13603 ?auto_13599 )
      ( MAKE-2CRATE ?auto_13601 ?auto_13597 ?auto_13598 )
      ( MAKE-1CRATE-VERIFY ?auto_13597 ?auto_13598 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13604 - SURFACE
      ?auto_13605 - SURFACE
      ?auto_13606 - SURFACE
    )
    :vars
    (
      ?auto_13607 - HOIST
      ?auto_13609 - PLACE
      ?auto_13608 - TRUCK
      ?auto_13610 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13607 ?auto_13609 ) ( SURFACE-AT ?auto_13605 ?auto_13609 ) ( CLEAR ?auto_13605 ) ( IS-CRATE ?auto_13606 ) ( not ( = ?auto_13605 ?auto_13606 ) ) ( AVAILABLE ?auto_13607 ) ( IN ?auto_13606 ?auto_13608 ) ( ON ?auto_13605 ?auto_13604 ) ( not ( = ?auto_13604 ?auto_13605 ) ) ( not ( = ?auto_13604 ?auto_13606 ) ) ( TRUCK-AT ?auto_13608 ?auto_13610 ) ( not ( = ?auto_13610 ?auto_13609 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13605 ?auto_13606 )
      ( MAKE-2CRATE-VERIFY ?auto_13604 ?auto_13605 ?auto_13606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13611 - SURFACE
      ?auto_13612 - SURFACE
    )
    :vars
    (
      ?auto_13616 - HOIST
      ?auto_13617 - PLACE
      ?auto_13614 - SURFACE
      ?auto_13615 - TRUCK
      ?auto_13613 - PLACE
      ?auto_13618 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13616 ?auto_13617 ) ( SURFACE-AT ?auto_13611 ?auto_13617 ) ( CLEAR ?auto_13611 ) ( IS-CRATE ?auto_13612 ) ( not ( = ?auto_13611 ?auto_13612 ) ) ( AVAILABLE ?auto_13616 ) ( ON ?auto_13611 ?auto_13614 ) ( not ( = ?auto_13614 ?auto_13611 ) ) ( not ( = ?auto_13614 ?auto_13612 ) ) ( TRUCK-AT ?auto_13615 ?auto_13613 ) ( not ( = ?auto_13613 ?auto_13617 ) ) ( HOIST-AT ?auto_13618 ?auto_13613 ) ( LIFTING ?auto_13618 ?auto_13612 ) ( not ( = ?auto_13616 ?auto_13618 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13618 ?auto_13612 ?auto_13615 ?auto_13613 )
      ( MAKE-2CRATE ?auto_13614 ?auto_13611 ?auto_13612 )
      ( MAKE-1CRATE-VERIFY ?auto_13611 ?auto_13612 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13619 - SURFACE
      ?auto_13620 - SURFACE
      ?auto_13621 - SURFACE
    )
    :vars
    (
      ?auto_13625 - HOIST
      ?auto_13623 - PLACE
      ?auto_13626 - TRUCK
      ?auto_13624 - PLACE
      ?auto_13622 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13625 ?auto_13623 ) ( SURFACE-AT ?auto_13620 ?auto_13623 ) ( CLEAR ?auto_13620 ) ( IS-CRATE ?auto_13621 ) ( not ( = ?auto_13620 ?auto_13621 ) ) ( AVAILABLE ?auto_13625 ) ( ON ?auto_13620 ?auto_13619 ) ( not ( = ?auto_13619 ?auto_13620 ) ) ( not ( = ?auto_13619 ?auto_13621 ) ) ( TRUCK-AT ?auto_13626 ?auto_13624 ) ( not ( = ?auto_13624 ?auto_13623 ) ) ( HOIST-AT ?auto_13622 ?auto_13624 ) ( LIFTING ?auto_13622 ?auto_13621 ) ( not ( = ?auto_13625 ?auto_13622 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13620 ?auto_13621 )
      ( MAKE-2CRATE-VERIFY ?auto_13619 ?auto_13620 ?auto_13621 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13627 - SURFACE
      ?auto_13628 - SURFACE
    )
    :vars
    (
      ?auto_13631 - HOIST
      ?auto_13632 - PLACE
      ?auto_13629 - SURFACE
      ?auto_13633 - TRUCK
      ?auto_13630 - PLACE
      ?auto_13634 - HOIST
      ?auto_13635 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13631 ?auto_13632 ) ( SURFACE-AT ?auto_13627 ?auto_13632 ) ( CLEAR ?auto_13627 ) ( IS-CRATE ?auto_13628 ) ( not ( = ?auto_13627 ?auto_13628 ) ) ( AVAILABLE ?auto_13631 ) ( ON ?auto_13627 ?auto_13629 ) ( not ( = ?auto_13629 ?auto_13627 ) ) ( not ( = ?auto_13629 ?auto_13628 ) ) ( TRUCK-AT ?auto_13633 ?auto_13630 ) ( not ( = ?auto_13630 ?auto_13632 ) ) ( HOIST-AT ?auto_13634 ?auto_13630 ) ( not ( = ?auto_13631 ?auto_13634 ) ) ( AVAILABLE ?auto_13634 ) ( SURFACE-AT ?auto_13628 ?auto_13630 ) ( ON ?auto_13628 ?auto_13635 ) ( CLEAR ?auto_13628 ) ( not ( = ?auto_13627 ?auto_13635 ) ) ( not ( = ?auto_13628 ?auto_13635 ) ) ( not ( = ?auto_13629 ?auto_13635 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13634 ?auto_13628 ?auto_13635 ?auto_13630 )
      ( MAKE-2CRATE ?auto_13629 ?auto_13627 ?auto_13628 )
      ( MAKE-1CRATE-VERIFY ?auto_13627 ?auto_13628 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13636 - SURFACE
      ?auto_13637 - SURFACE
      ?auto_13638 - SURFACE
    )
    :vars
    (
      ?auto_13640 - HOIST
      ?auto_13643 - PLACE
      ?auto_13641 - TRUCK
      ?auto_13639 - PLACE
      ?auto_13642 - HOIST
      ?auto_13644 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13640 ?auto_13643 ) ( SURFACE-AT ?auto_13637 ?auto_13643 ) ( CLEAR ?auto_13637 ) ( IS-CRATE ?auto_13638 ) ( not ( = ?auto_13637 ?auto_13638 ) ) ( AVAILABLE ?auto_13640 ) ( ON ?auto_13637 ?auto_13636 ) ( not ( = ?auto_13636 ?auto_13637 ) ) ( not ( = ?auto_13636 ?auto_13638 ) ) ( TRUCK-AT ?auto_13641 ?auto_13639 ) ( not ( = ?auto_13639 ?auto_13643 ) ) ( HOIST-AT ?auto_13642 ?auto_13639 ) ( not ( = ?auto_13640 ?auto_13642 ) ) ( AVAILABLE ?auto_13642 ) ( SURFACE-AT ?auto_13638 ?auto_13639 ) ( ON ?auto_13638 ?auto_13644 ) ( CLEAR ?auto_13638 ) ( not ( = ?auto_13637 ?auto_13644 ) ) ( not ( = ?auto_13638 ?auto_13644 ) ) ( not ( = ?auto_13636 ?auto_13644 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13637 ?auto_13638 )
      ( MAKE-2CRATE-VERIFY ?auto_13636 ?auto_13637 ?auto_13638 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13645 - SURFACE
      ?auto_13646 - SURFACE
    )
    :vars
    (
      ?auto_13649 - HOIST
      ?auto_13651 - PLACE
      ?auto_13650 - SURFACE
      ?auto_13647 - PLACE
      ?auto_13652 - HOIST
      ?auto_13648 - SURFACE
      ?auto_13653 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13649 ?auto_13651 ) ( SURFACE-AT ?auto_13645 ?auto_13651 ) ( CLEAR ?auto_13645 ) ( IS-CRATE ?auto_13646 ) ( not ( = ?auto_13645 ?auto_13646 ) ) ( AVAILABLE ?auto_13649 ) ( ON ?auto_13645 ?auto_13650 ) ( not ( = ?auto_13650 ?auto_13645 ) ) ( not ( = ?auto_13650 ?auto_13646 ) ) ( not ( = ?auto_13647 ?auto_13651 ) ) ( HOIST-AT ?auto_13652 ?auto_13647 ) ( not ( = ?auto_13649 ?auto_13652 ) ) ( AVAILABLE ?auto_13652 ) ( SURFACE-AT ?auto_13646 ?auto_13647 ) ( ON ?auto_13646 ?auto_13648 ) ( CLEAR ?auto_13646 ) ( not ( = ?auto_13645 ?auto_13648 ) ) ( not ( = ?auto_13646 ?auto_13648 ) ) ( not ( = ?auto_13650 ?auto_13648 ) ) ( TRUCK-AT ?auto_13653 ?auto_13651 ) )
    :subtasks
    ( ( !DRIVE ?auto_13653 ?auto_13651 ?auto_13647 )
      ( MAKE-2CRATE ?auto_13650 ?auto_13645 ?auto_13646 )
      ( MAKE-1CRATE-VERIFY ?auto_13645 ?auto_13646 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13654 - SURFACE
      ?auto_13655 - SURFACE
      ?auto_13656 - SURFACE
    )
    :vars
    (
      ?auto_13659 - HOIST
      ?auto_13660 - PLACE
      ?auto_13657 - PLACE
      ?auto_13662 - HOIST
      ?auto_13661 - SURFACE
      ?auto_13658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13659 ?auto_13660 ) ( SURFACE-AT ?auto_13655 ?auto_13660 ) ( CLEAR ?auto_13655 ) ( IS-CRATE ?auto_13656 ) ( not ( = ?auto_13655 ?auto_13656 ) ) ( AVAILABLE ?auto_13659 ) ( ON ?auto_13655 ?auto_13654 ) ( not ( = ?auto_13654 ?auto_13655 ) ) ( not ( = ?auto_13654 ?auto_13656 ) ) ( not ( = ?auto_13657 ?auto_13660 ) ) ( HOIST-AT ?auto_13662 ?auto_13657 ) ( not ( = ?auto_13659 ?auto_13662 ) ) ( AVAILABLE ?auto_13662 ) ( SURFACE-AT ?auto_13656 ?auto_13657 ) ( ON ?auto_13656 ?auto_13661 ) ( CLEAR ?auto_13656 ) ( not ( = ?auto_13655 ?auto_13661 ) ) ( not ( = ?auto_13656 ?auto_13661 ) ) ( not ( = ?auto_13654 ?auto_13661 ) ) ( TRUCK-AT ?auto_13658 ?auto_13660 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13655 ?auto_13656 )
      ( MAKE-2CRATE-VERIFY ?auto_13654 ?auto_13655 ?auto_13656 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13663 - SURFACE
      ?auto_13664 - SURFACE
    )
    :vars
    (
      ?auto_13671 - HOIST
      ?auto_13666 - PLACE
      ?auto_13667 - SURFACE
      ?auto_13668 - PLACE
      ?auto_13669 - HOIST
      ?auto_13665 - SURFACE
      ?auto_13670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13671 ?auto_13666 ) ( IS-CRATE ?auto_13664 ) ( not ( = ?auto_13663 ?auto_13664 ) ) ( not ( = ?auto_13667 ?auto_13663 ) ) ( not ( = ?auto_13667 ?auto_13664 ) ) ( not ( = ?auto_13668 ?auto_13666 ) ) ( HOIST-AT ?auto_13669 ?auto_13668 ) ( not ( = ?auto_13671 ?auto_13669 ) ) ( AVAILABLE ?auto_13669 ) ( SURFACE-AT ?auto_13664 ?auto_13668 ) ( ON ?auto_13664 ?auto_13665 ) ( CLEAR ?auto_13664 ) ( not ( = ?auto_13663 ?auto_13665 ) ) ( not ( = ?auto_13664 ?auto_13665 ) ) ( not ( = ?auto_13667 ?auto_13665 ) ) ( TRUCK-AT ?auto_13670 ?auto_13666 ) ( SURFACE-AT ?auto_13667 ?auto_13666 ) ( CLEAR ?auto_13667 ) ( LIFTING ?auto_13671 ?auto_13663 ) ( IS-CRATE ?auto_13663 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13667 ?auto_13663 )
      ( MAKE-2CRATE ?auto_13667 ?auto_13663 ?auto_13664 )
      ( MAKE-1CRATE-VERIFY ?auto_13663 ?auto_13664 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13672 - SURFACE
      ?auto_13673 - SURFACE
      ?auto_13674 - SURFACE
    )
    :vars
    (
      ?auto_13675 - HOIST
      ?auto_13678 - PLACE
      ?auto_13676 - PLACE
      ?auto_13679 - HOIST
      ?auto_13677 - SURFACE
      ?auto_13680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13675 ?auto_13678 ) ( IS-CRATE ?auto_13674 ) ( not ( = ?auto_13673 ?auto_13674 ) ) ( not ( = ?auto_13672 ?auto_13673 ) ) ( not ( = ?auto_13672 ?auto_13674 ) ) ( not ( = ?auto_13676 ?auto_13678 ) ) ( HOIST-AT ?auto_13679 ?auto_13676 ) ( not ( = ?auto_13675 ?auto_13679 ) ) ( AVAILABLE ?auto_13679 ) ( SURFACE-AT ?auto_13674 ?auto_13676 ) ( ON ?auto_13674 ?auto_13677 ) ( CLEAR ?auto_13674 ) ( not ( = ?auto_13673 ?auto_13677 ) ) ( not ( = ?auto_13674 ?auto_13677 ) ) ( not ( = ?auto_13672 ?auto_13677 ) ) ( TRUCK-AT ?auto_13680 ?auto_13678 ) ( SURFACE-AT ?auto_13672 ?auto_13678 ) ( CLEAR ?auto_13672 ) ( LIFTING ?auto_13675 ?auto_13673 ) ( IS-CRATE ?auto_13673 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13673 ?auto_13674 )
      ( MAKE-2CRATE-VERIFY ?auto_13672 ?auto_13673 ?auto_13674 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13681 - SURFACE
      ?auto_13682 - SURFACE
    )
    :vars
    (
      ?auto_13689 - HOIST
      ?auto_13687 - PLACE
      ?auto_13684 - SURFACE
      ?auto_13688 - PLACE
      ?auto_13683 - HOIST
      ?auto_13686 - SURFACE
      ?auto_13685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13689 ?auto_13687 ) ( IS-CRATE ?auto_13682 ) ( not ( = ?auto_13681 ?auto_13682 ) ) ( not ( = ?auto_13684 ?auto_13681 ) ) ( not ( = ?auto_13684 ?auto_13682 ) ) ( not ( = ?auto_13688 ?auto_13687 ) ) ( HOIST-AT ?auto_13683 ?auto_13688 ) ( not ( = ?auto_13689 ?auto_13683 ) ) ( AVAILABLE ?auto_13683 ) ( SURFACE-AT ?auto_13682 ?auto_13688 ) ( ON ?auto_13682 ?auto_13686 ) ( CLEAR ?auto_13682 ) ( not ( = ?auto_13681 ?auto_13686 ) ) ( not ( = ?auto_13682 ?auto_13686 ) ) ( not ( = ?auto_13684 ?auto_13686 ) ) ( TRUCK-AT ?auto_13685 ?auto_13687 ) ( SURFACE-AT ?auto_13684 ?auto_13687 ) ( CLEAR ?auto_13684 ) ( IS-CRATE ?auto_13681 ) ( AVAILABLE ?auto_13689 ) ( IN ?auto_13681 ?auto_13685 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13689 ?auto_13681 ?auto_13685 ?auto_13687 )
      ( MAKE-2CRATE ?auto_13684 ?auto_13681 ?auto_13682 )
      ( MAKE-1CRATE-VERIFY ?auto_13681 ?auto_13682 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13690 - SURFACE
      ?auto_13691 - SURFACE
      ?auto_13692 - SURFACE
    )
    :vars
    (
      ?auto_13694 - HOIST
      ?auto_13696 - PLACE
      ?auto_13697 - PLACE
      ?auto_13693 - HOIST
      ?auto_13695 - SURFACE
      ?auto_13698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13694 ?auto_13696 ) ( IS-CRATE ?auto_13692 ) ( not ( = ?auto_13691 ?auto_13692 ) ) ( not ( = ?auto_13690 ?auto_13691 ) ) ( not ( = ?auto_13690 ?auto_13692 ) ) ( not ( = ?auto_13697 ?auto_13696 ) ) ( HOIST-AT ?auto_13693 ?auto_13697 ) ( not ( = ?auto_13694 ?auto_13693 ) ) ( AVAILABLE ?auto_13693 ) ( SURFACE-AT ?auto_13692 ?auto_13697 ) ( ON ?auto_13692 ?auto_13695 ) ( CLEAR ?auto_13692 ) ( not ( = ?auto_13691 ?auto_13695 ) ) ( not ( = ?auto_13692 ?auto_13695 ) ) ( not ( = ?auto_13690 ?auto_13695 ) ) ( TRUCK-AT ?auto_13698 ?auto_13696 ) ( SURFACE-AT ?auto_13690 ?auto_13696 ) ( CLEAR ?auto_13690 ) ( IS-CRATE ?auto_13691 ) ( AVAILABLE ?auto_13694 ) ( IN ?auto_13691 ?auto_13698 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13691 ?auto_13692 )
      ( MAKE-2CRATE-VERIFY ?auto_13690 ?auto_13691 ?auto_13692 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13699 - SURFACE
      ?auto_13700 - SURFACE
    )
    :vars
    (
      ?auto_13701 - HOIST
      ?auto_13707 - PLACE
      ?auto_13702 - SURFACE
      ?auto_13703 - PLACE
      ?auto_13704 - HOIST
      ?auto_13705 - SURFACE
      ?auto_13706 - TRUCK
      ?auto_13708 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13701 ?auto_13707 ) ( IS-CRATE ?auto_13700 ) ( not ( = ?auto_13699 ?auto_13700 ) ) ( not ( = ?auto_13702 ?auto_13699 ) ) ( not ( = ?auto_13702 ?auto_13700 ) ) ( not ( = ?auto_13703 ?auto_13707 ) ) ( HOIST-AT ?auto_13704 ?auto_13703 ) ( not ( = ?auto_13701 ?auto_13704 ) ) ( AVAILABLE ?auto_13704 ) ( SURFACE-AT ?auto_13700 ?auto_13703 ) ( ON ?auto_13700 ?auto_13705 ) ( CLEAR ?auto_13700 ) ( not ( = ?auto_13699 ?auto_13705 ) ) ( not ( = ?auto_13700 ?auto_13705 ) ) ( not ( = ?auto_13702 ?auto_13705 ) ) ( SURFACE-AT ?auto_13702 ?auto_13707 ) ( CLEAR ?auto_13702 ) ( IS-CRATE ?auto_13699 ) ( AVAILABLE ?auto_13701 ) ( IN ?auto_13699 ?auto_13706 ) ( TRUCK-AT ?auto_13706 ?auto_13708 ) ( not ( = ?auto_13708 ?auto_13707 ) ) ( not ( = ?auto_13703 ?auto_13708 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13706 ?auto_13708 ?auto_13707 )
      ( MAKE-2CRATE ?auto_13702 ?auto_13699 ?auto_13700 )
      ( MAKE-1CRATE-VERIFY ?auto_13699 ?auto_13700 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13709 - SURFACE
      ?auto_13710 - SURFACE
      ?auto_13711 - SURFACE
    )
    :vars
    (
      ?auto_13718 - HOIST
      ?auto_13716 - PLACE
      ?auto_13713 - PLACE
      ?auto_13712 - HOIST
      ?auto_13714 - SURFACE
      ?auto_13717 - TRUCK
      ?auto_13715 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13718 ?auto_13716 ) ( IS-CRATE ?auto_13711 ) ( not ( = ?auto_13710 ?auto_13711 ) ) ( not ( = ?auto_13709 ?auto_13710 ) ) ( not ( = ?auto_13709 ?auto_13711 ) ) ( not ( = ?auto_13713 ?auto_13716 ) ) ( HOIST-AT ?auto_13712 ?auto_13713 ) ( not ( = ?auto_13718 ?auto_13712 ) ) ( AVAILABLE ?auto_13712 ) ( SURFACE-AT ?auto_13711 ?auto_13713 ) ( ON ?auto_13711 ?auto_13714 ) ( CLEAR ?auto_13711 ) ( not ( = ?auto_13710 ?auto_13714 ) ) ( not ( = ?auto_13711 ?auto_13714 ) ) ( not ( = ?auto_13709 ?auto_13714 ) ) ( SURFACE-AT ?auto_13709 ?auto_13716 ) ( CLEAR ?auto_13709 ) ( IS-CRATE ?auto_13710 ) ( AVAILABLE ?auto_13718 ) ( IN ?auto_13710 ?auto_13717 ) ( TRUCK-AT ?auto_13717 ?auto_13715 ) ( not ( = ?auto_13715 ?auto_13716 ) ) ( not ( = ?auto_13713 ?auto_13715 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13710 ?auto_13711 )
      ( MAKE-2CRATE-VERIFY ?auto_13709 ?auto_13710 ?auto_13711 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13719 - SURFACE
      ?auto_13720 - SURFACE
    )
    :vars
    (
      ?auto_13722 - HOIST
      ?auto_13724 - PLACE
      ?auto_13727 - SURFACE
      ?auto_13726 - PLACE
      ?auto_13728 - HOIST
      ?auto_13723 - SURFACE
      ?auto_13721 - TRUCK
      ?auto_13725 - PLACE
      ?auto_13729 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13722 ?auto_13724 ) ( IS-CRATE ?auto_13720 ) ( not ( = ?auto_13719 ?auto_13720 ) ) ( not ( = ?auto_13727 ?auto_13719 ) ) ( not ( = ?auto_13727 ?auto_13720 ) ) ( not ( = ?auto_13726 ?auto_13724 ) ) ( HOIST-AT ?auto_13728 ?auto_13726 ) ( not ( = ?auto_13722 ?auto_13728 ) ) ( AVAILABLE ?auto_13728 ) ( SURFACE-AT ?auto_13720 ?auto_13726 ) ( ON ?auto_13720 ?auto_13723 ) ( CLEAR ?auto_13720 ) ( not ( = ?auto_13719 ?auto_13723 ) ) ( not ( = ?auto_13720 ?auto_13723 ) ) ( not ( = ?auto_13727 ?auto_13723 ) ) ( SURFACE-AT ?auto_13727 ?auto_13724 ) ( CLEAR ?auto_13727 ) ( IS-CRATE ?auto_13719 ) ( AVAILABLE ?auto_13722 ) ( TRUCK-AT ?auto_13721 ?auto_13725 ) ( not ( = ?auto_13725 ?auto_13724 ) ) ( not ( = ?auto_13726 ?auto_13725 ) ) ( HOIST-AT ?auto_13729 ?auto_13725 ) ( LIFTING ?auto_13729 ?auto_13719 ) ( not ( = ?auto_13722 ?auto_13729 ) ) ( not ( = ?auto_13728 ?auto_13729 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13729 ?auto_13719 ?auto_13721 ?auto_13725 )
      ( MAKE-2CRATE ?auto_13727 ?auto_13719 ?auto_13720 )
      ( MAKE-1CRATE-VERIFY ?auto_13719 ?auto_13720 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13730 - SURFACE
      ?auto_13731 - SURFACE
      ?auto_13732 - SURFACE
    )
    :vars
    (
      ?auto_13735 - HOIST
      ?auto_13736 - PLACE
      ?auto_13740 - PLACE
      ?auto_13733 - HOIST
      ?auto_13737 - SURFACE
      ?auto_13738 - TRUCK
      ?auto_13734 - PLACE
      ?auto_13739 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13735 ?auto_13736 ) ( IS-CRATE ?auto_13732 ) ( not ( = ?auto_13731 ?auto_13732 ) ) ( not ( = ?auto_13730 ?auto_13731 ) ) ( not ( = ?auto_13730 ?auto_13732 ) ) ( not ( = ?auto_13740 ?auto_13736 ) ) ( HOIST-AT ?auto_13733 ?auto_13740 ) ( not ( = ?auto_13735 ?auto_13733 ) ) ( AVAILABLE ?auto_13733 ) ( SURFACE-AT ?auto_13732 ?auto_13740 ) ( ON ?auto_13732 ?auto_13737 ) ( CLEAR ?auto_13732 ) ( not ( = ?auto_13731 ?auto_13737 ) ) ( not ( = ?auto_13732 ?auto_13737 ) ) ( not ( = ?auto_13730 ?auto_13737 ) ) ( SURFACE-AT ?auto_13730 ?auto_13736 ) ( CLEAR ?auto_13730 ) ( IS-CRATE ?auto_13731 ) ( AVAILABLE ?auto_13735 ) ( TRUCK-AT ?auto_13738 ?auto_13734 ) ( not ( = ?auto_13734 ?auto_13736 ) ) ( not ( = ?auto_13740 ?auto_13734 ) ) ( HOIST-AT ?auto_13739 ?auto_13734 ) ( LIFTING ?auto_13739 ?auto_13731 ) ( not ( = ?auto_13735 ?auto_13739 ) ) ( not ( = ?auto_13733 ?auto_13739 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13731 ?auto_13732 )
      ( MAKE-2CRATE-VERIFY ?auto_13730 ?auto_13731 ?auto_13732 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13741 - SURFACE
      ?auto_13742 - SURFACE
    )
    :vars
    (
      ?auto_13747 - HOIST
      ?auto_13750 - PLACE
      ?auto_13748 - SURFACE
      ?auto_13743 - PLACE
      ?auto_13745 - HOIST
      ?auto_13746 - SURFACE
      ?auto_13744 - TRUCK
      ?auto_13751 - PLACE
      ?auto_13749 - HOIST
      ?auto_13752 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13747 ?auto_13750 ) ( IS-CRATE ?auto_13742 ) ( not ( = ?auto_13741 ?auto_13742 ) ) ( not ( = ?auto_13748 ?auto_13741 ) ) ( not ( = ?auto_13748 ?auto_13742 ) ) ( not ( = ?auto_13743 ?auto_13750 ) ) ( HOIST-AT ?auto_13745 ?auto_13743 ) ( not ( = ?auto_13747 ?auto_13745 ) ) ( AVAILABLE ?auto_13745 ) ( SURFACE-AT ?auto_13742 ?auto_13743 ) ( ON ?auto_13742 ?auto_13746 ) ( CLEAR ?auto_13742 ) ( not ( = ?auto_13741 ?auto_13746 ) ) ( not ( = ?auto_13742 ?auto_13746 ) ) ( not ( = ?auto_13748 ?auto_13746 ) ) ( SURFACE-AT ?auto_13748 ?auto_13750 ) ( CLEAR ?auto_13748 ) ( IS-CRATE ?auto_13741 ) ( AVAILABLE ?auto_13747 ) ( TRUCK-AT ?auto_13744 ?auto_13751 ) ( not ( = ?auto_13751 ?auto_13750 ) ) ( not ( = ?auto_13743 ?auto_13751 ) ) ( HOIST-AT ?auto_13749 ?auto_13751 ) ( not ( = ?auto_13747 ?auto_13749 ) ) ( not ( = ?auto_13745 ?auto_13749 ) ) ( AVAILABLE ?auto_13749 ) ( SURFACE-AT ?auto_13741 ?auto_13751 ) ( ON ?auto_13741 ?auto_13752 ) ( CLEAR ?auto_13741 ) ( not ( = ?auto_13741 ?auto_13752 ) ) ( not ( = ?auto_13742 ?auto_13752 ) ) ( not ( = ?auto_13748 ?auto_13752 ) ) ( not ( = ?auto_13746 ?auto_13752 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13749 ?auto_13741 ?auto_13752 ?auto_13751 )
      ( MAKE-2CRATE ?auto_13748 ?auto_13741 ?auto_13742 )
      ( MAKE-1CRATE-VERIFY ?auto_13741 ?auto_13742 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13753 - SURFACE
      ?auto_13754 - SURFACE
      ?auto_13755 - SURFACE
    )
    :vars
    (
      ?auto_13763 - HOIST
      ?auto_13764 - PLACE
      ?auto_13760 - PLACE
      ?auto_13757 - HOIST
      ?auto_13762 - SURFACE
      ?auto_13756 - TRUCK
      ?auto_13761 - PLACE
      ?auto_13758 - HOIST
      ?auto_13759 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13763 ?auto_13764 ) ( IS-CRATE ?auto_13755 ) ( not ( = ?auto_13754 ?auto_13755 ) ) ( not ( = ?auto_13753 ?auto_13754 ) ) ( not ( = ?auto_13753 ?auto_13755 ) ) ( not ( = ?auto_13760 ?auto_13764 ) ) ( HOIST-AT ?auto_13757 ?auto_13760 ) ( not ( = ?auto_13763 ?auto_13757 ) ) ( AVAILABLE ?auto_13757 ) ( SURFACE-AT ?auto_13755 ?auto_13760 ) ( ON ?auto_13755 ?auto_13762 ) ( CLEAR ?auto_13755 ) ( not ( = ?auto_13754 ?auto_13762 ) ) ( not ( = ?auto_13755 ?auto_13762 ) ) ( not ( = ?auto_13753 ?auto_13762 ) ) ( SURFACE-AT ?auto_13753 ?auto_13764 ) ( CLEAR ?auto_13753 ) ( IS-CRATE ?auto_13754 ) ( AVAILABLE ?auto_13763 ) ( TRUCK-AT ?auto_13756 ?auto_13761 ) ( not ( = ?auto_13761 ?auto_13764 ) ) ( not ( = ?auto_13760 ?auto_13761 ) ) ( HOIST-AT ?auto_13758 ?auto_13761 ) ( not ( = ?auto_13763 ?auto_13758 ) ) ( not ( = ?auto_13757 ?auto_13758 ) ) ( AVAILABLE ?auto_13758 ) ( SURFACE-AT ?auto_13754 ?auto_13761 ) ( ON ?auto_13754 ?auto_13759 ) ( CLEAR ?auto_13754 ) ( not ( = ?auto_13754 ?auto_13759 ) ) ( not ( = ?auto_13755 ?auto_13759 ) ) ( not ( = ?auto_13753 ?auto_13759 ) ) ( not ( = ?auto_13762 ?auto_13759 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13754 ?auto_13755 )
      ( MAKE-2CRATE-VERIFY ?auto_13753 ?auto_13754 ?auto_13755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13765 - SURFACE
      ?auto_13766 - SURFACE
    )
    :vars
    (
      ?auto_13771 - HOIST
      ?auto_13767 - PLACE
      ?auto_13774 - SURFACE
      ?auto_13769 - PLACE
      ?auto_13770 - HOIST
      ?auto_13776 - SURFACE
      ?auto_13772 - PLACE
      ?auto_13773 - HOIST
      ?auto_13775 - SURFACE
      ?auto_13768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13771 ?auto_13767 ) ( IS-CRATE ?auto_13766 ) ( not ( = ?auto_13765 ?auto_13766 ) ) ( not ( = ?auto_13774 ?auto_13765 ) ) ( not ( = ?auto_13774 ?auto_13766 ) ) ( not ( = ?auto_13769 ?auto_13767 ) ) ( HOIST-AT ?auto_13770 ?auto_13769 ) ( not ( = ?auto_13771 ?auto_13770 ) ) ( AVAILABLE ?auto_13770 ) ( SURFACE-AT ?auto_13766 ?auto_13769 ) ( ON ?auto_13766 ?auto_13776 ) ( CLEAR ?auto_13766 ) ( not ( = ?auto_13765 ?auto_13776 ) ) ( not ( = ?auto_13766 ?auto_13776 ) ) ( not ( = ?auto_13774 ?auto_13776 ) ) ( SURFACE-AT ?auto_13774 ?auto_13767 ) ( CLEAR ?auto_13774 ) ( IS-CRATE ?auto_13765 ) ( AVAILABLE ?auto_13771 ) ( not ( = ?auto_13772 ?auto_13767 ) ) ( not ( = ?auto_13769 ?auto_13772 ) ) ( HOIST-AT ?auto_13773 ?auto_13772 ) ( not ( = ?auto_13771 ?auto_13773 ) ) ( not ( = ?auto_13770 ?auto_13773 ) ) ( AVAILABLE ?auto_13773 ) ( SURFACE-AT ?auto_13765 ?auto_13772 ) ( ON ?auto_13765 ?auto_13775 ) ( CLEAR ?auto_13765 ) ( not ( = ?auto_13765 ?auto_13775 ) ) ( not ( = ?auto_13766 ?auto_13775 ) ) ( not ( = ?auto_13774 ?auto_13775 ) ) ( not ( = ?auto_13776 ?auto_13775 ) ) ( TRUCK-AT ?auto_13768 ?auto_13767 ) )
    :subtasks
    ( ( !DRIVE ?auto_13768 ?auto_13767 ?auto_13772 )
      ( MAKE-2CRATE ?auto_13774 ?auto_13765 ?auto_13766 )
      ( MAKE-1CRATE-VERIFY ?auto_13765 ?auto_13766 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13777 - SURFACE
      ?auto_13778 - SURFACE
      ?auto_13779 - SURFACE
    )
    :vars
    (
      ?auto_13783 - HOIST
      ?auto_13782 - PLACE
      ?auto_13787 - PLACE
      ?auto_13786 - HOIST
      ?auto_13784 - SURFACE
      ?auto_13785 - PLACE
      ?auto_13788 - HOIST
      ?auto_13781 - SURFACE
      ?auto_13780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13783 ?auto_13782 ) ( IS-CRATE ?auto_13779 ) ( not ( = ?auto_13778 ?auto_13779 ) ) ( not ( = ?auto_13777 ?auto_13778 ) ) ( not ( = ?auto_13777 ?auto_13779 ) ) ( not ( = ?auto_13787 ?auto_13782 ) ) ( HOIST-AT ?auto_13786 ?auto_13787 ) ( not ( = ?auto_13783 ?auto_13786 ) ) ( AVAILABLE ?auto_13786 ) ( SURFACE-AT ?auto_13779 ?auto_13787 ) ( ON ?auto_13779 ?auto_13784 ) ( CLEAR ?auto_13779 ) ( not ( = ?auto_13778 ?auto_13784 ) ) ( not ( = ?auto_13779 ?auto_13784 ) ) ( not ( = ?auto_13777 ?auto_13784 ) ) ( SURFACE-AT ?auto_13777 ?auto_13782 ) ( CLEAR ?auto_13777 ) ( IS-CRATE ?auto_13778 ) ( AVAILABLE ?auto_13783 ) ( not ( = ?auto_13785 ?auto_13782 ) ) ( not ( = ?auto_13787 ?auto_13785 ) ) ( HOIST-AT ?auto_13788 ?auto_13785 ) ( not ( = ?auto_13783 ?auto_13788 ) ) ( not ( = ?auto_13786 ?auto_13788 ) ) ( AVAILABLE ?auto_13788 ) ( SURFACE-AT ?auto_13778 ?auto_13785 ) ( ON ?auto_13778 ?auto_13781 ) ( CLEAR ?auto_13778 ) ( not ( = ?auto_13778 ?auto_13781 ) ) ( not ( = ?auto_13779 ?auto_13781 ) ) ( not ( = ?auto_13777 ?auto_13781 ) ) ( not ( = ?auto_13784 ?auto_13781 ) ) ( TRUCK-AT ?auto_13780 ?auto_13782 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13778 ?auto_13779 )
      ( MAKE-2CRATE-VERIFY ?auto_13777 ?auto_13778 ?auto_13779 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13798 - SURFACE
      ?auto_13799 - SURFACE
    )
    :vars
    (
      ?auto_13800 - HOIST
      ?auto_13801 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13800 ?auto_13801 ) ( SURFACE-AT ?auto_13798 ?auto_13801 ) ( CLEAR ?auto_13798 ) ( LIFTING ?auto_13800 ?auto_13799 ) ( IS-CRATE ?auto_13799 ) ( not ( = ?auto_13798 ?auto_13799 ) ) )
    :subtasks
    ( ( !DROP ?auto_13800 ?auto_13799 ?auto_13798 ?auto_13801 )
      ( MAKE-1CRATE-VERIFY ?auto_13798 ?auto_13799 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13802 - SURFACE
      ?auto_13803 - SURFACE
      ?auto_13804 - SURFACE
    )
    :vars
    (
      ?auto_13806 - HOIST
      ?auto_13805 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13806 ?auto_13805 ) ( SURFACE-AT ?auto_13803 ?auto_13805 ) ( CLEAR ?auto_13803 ) ( LIFTING ?auto_13806 ?auto_13804 ) ( IS-CRATE ?auto_13804 ) ( not ( = ?auto_13803 ?auto_13804 ) ) ( ON ?auto_13803 ?auto_13802 ) ( not ( = ?auto_13802 ?auto_13803 ) ) ( not ( = ?auto_13802 ?auto_13804 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13803 ?auto_13804 )
      ( MAKE-2CRATE-VERIFY ?auto_13802 ?auto_13803 ?auto_13804 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13807 - SURFACE
      ?auto_13808 - SURFACE
      ?auto_13809 - SURFACE
      ?auto_13810 - SURFACE
    )
    :vars
    (
      ?auto_13812 - HOIST
      ?auto_13811 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13812 ?auto_13811 ) ( SURFACE-AT ?auto_13809 ?auto_13811 ) ( CLEAR ?auto_13809 ) ( LIFTING ?auto_13812 ?auto_13810 ) ( IS-CRATE ?auto_13810 ) ( not ( = ?auto_13809 ?auto_13810 ) ) ( ON ?auto_13808 ?auto_13807 ) ( ON ?auto_13809 ?auto_13808 ) ( not ( = ?auto_13807 ?auto_13808 ) ) ( not ( = ?auto_13807 ?auto_13809 ) ) ( not ( = ?auto_13807 ?auto_13810 ) ) ( not ( = ?auto_13808 ?auto_13809 ) ) ( not ( = ?auto_13808 ?auto_13810 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13809 ?auto_13810 )
      ( MAKE-3CRATE-VERIFY ?auto_13807 ?auto_13808 ?auto_13809 ?auto_13810 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13813 - SURFACE
      ?auto_13814 - SURFACE
    )
    :vars
    (
      ?auto_13816 - HOIST
      ?auto_13815 - PLACE
      ?auto_13817 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13816 ?auto_13815 ) ( SURFACE-AT ?auto_13813 ?auto_13815 ) ( CLEAR ?auto_13813 ) ( IS-CRATE ?auto_13814 ) ( not ( = ?auto_13813 ?auto_13814 ) ) ( TRUCK-AT ?auto_13817 ?auto_13815 ) ( AVAILABLE ?auto_13816 ) ( IN ?auto_13814 ?auto_13817 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13816 ?auto_13814 ?auto_13817 ?auto_13815 )
      ( MAKE-1CRATE ?auto_13813 ?auto_13814 )
      ( MAKE-1CRATE-VERIFY ?auto_13813 ?auto_13814 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13818 - SURFACE
      ?auto_13819 - SURFACE
      ?auto_13820 - SURFACE
    )
    :vars
    (
      ?auto_13821 - HOIST
      ?auto_13822 - PLACE
      ?auto_13823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13821 ?auto_13822 ) ( SURFACE-AT ?auto_13819 ?auto_13822 ) ( CLEAR ?auto_13819 ) ( IS-CRATE ?auto_13820 ) ( not ( = ?auto_13819 ?auto_13820 ) ) ( TRUCK-AT ?auto_13823 ?auto_13822 ) ( AVAILABLE ?auto_13821 ) ( IN ?auto_13820 ?auto_13823 ) ( ON ?auto_13819 ?auto_13818 ) ( not ( = ?auto_13818 ?auto_13819 ) ) ( not ( = ?auto_13818 ?auto_13820 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13819 ?auto_13820 )
      ( MAKE-2CRATE-VERIFY ?auto_13818 ?auto_13819 ?auto_13820 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13824 - SURFACE
      ?auto_13825 - SURFACE
      ?auto_13826 - SURFACE
      ?auto_13827 - SURFACE
    )
    :vars
    (
      ?auto_13829 - HOIST
      ?auto_13828 - PLACE
      ?auto_13830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13829 ?auto_13828 ) ( SURFACE-AT ?auto_13826 ?auto_13828 ) ( CLEAR ?auto_13826 ) ( IS-CRATE ?auto_13827 ) ( not ( = ?auto_13826 ?auto_13827 ) ) ( TRUCK-AT ?auto_13830 ?auto_13828 ) ( AVAILABLE ?auto_13829 ) ( IN ?auto_13827 ?auto_13830 ) ( ON ?auto_13826 ?auto_13825 ) ( not ( = ?auto_13825 ?auto_13826 ) ) ( not ( = ?auto_13825 ?auto_13827 ) ) ( ON ?auto_13825 ?auto_13824 ) ( not ( = ?auto_13824 ?auto_13825 ) ) ( not ( = ?auto_13824 ?auto_13826 ) ) ( not ( = ?auto_13824 ?auto_13827 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13825 ?auto_13826 ?auto_13827 )
      ( MAKE-3CRATE-VERIFY ?auto_13824 ?auto_13825 ?auto_13826 ?auto_13827 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13831 - SURFACE
      ?auto_13832 - SURFACE
    )
    :vars
    (
      ?auto_13834 - HOIST
      ?auto_13833 - PLACE
      ?auto_13835 - TRUCK
      ?auto_13836 - SURFACE
      ?auto_13837 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13834 ?auto_13833 ) ( SURFACE-AT ?auto_13831 ?auto_13833 ) ( CLEAR ?auto_13831 ) ( IS-CRATE ?auto_13832 ) ( not ( = ?auto_13831 ?auto_13832 ) ) ( AVAILABLE ?auto_13834 ) ( IN ?auto_13832 ?auto_13835 ) ( ON ?auto_13831 ?auto_13836 ) ( not ( = ?auto_13836 ?auto_13831 ) ) ( not ( = ?auto_13836 ?auto_13832 ) ) ( TRUCK-AT ?auto_13835 ?auto_13837 ) ( not ( = ?auto_13837 ?auto_13833 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13835 ?auto_13837 ?auto_13833 )
      ( MAKE-2CRATE ?auto_13836 ?auto_13831 ?auto_13832 )
      ( MAKE-1CRATE-VERIFY ?auto_13831 ?auto_13832 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13838 - SURFACE
      ?auto_13839 - SURFACE
      ?auto_13840 - SURFACE
    )
    :vars
    (
      ?auto_13841 - HOIST
      ?auto_13842 - PLACE
      ?auto_13843 - TRUCK
      ?auto_13844 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13841 ?auto_13842 ) ( SURFACE-AT ?auto_13839 ?auto_13842 ) ( CLEAR ?auto_13839 ) ( IS-CRATE ?auto_13840 ) ( not ( = ?auto_13839 ?auto_13840 ) ) ( AVAILABLE ?auto_13841 ) ( IN ?auto_13840 ?auto_13843 ) ( ON ?auto_13839 ?auto_13838 ) ( not ( = ?auto_13838 ?auto_13839 ) ) ( not ( = ?auto_13838 ?auto_13840 ) ) ( TRUCK-AT ?auto_13843 ?auto_13844 ) ( not ( = ?auto_13844 ?auto_13842 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13839 ?auto_13840 )
      ( MAKE-2CRATE-VERIFY ?auto_13838 ?auto_13839 ?auto_13840 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13845 - SURFACE
      ?auto_13846 - SURFACE
      ?auto_13847 - SURFACE
      ?auto_13848 - SURFACE
    )
    :vars
    (
      ?auto_13850 - HOIST
      ?auto_13851 - PLACE
      ?auto_13852 - TRUCK
      ?auto_13849 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13850 ?auto_13851 ) ( SURFACE-AT ?auto_13847 ?auto_13851 ) ( CLEAR ?auto_13847 ) ( IS-CRATE ?auto_13848 ) ( not ( = ?auto_13847 ?auto_13848 ) ) ( AVAILABLE ?auto_13850 ) ( IN ?auto_13848 ?auto_13852 ) ( ON ?auto_13847 ?auto_13846 ) ( not ( = ?auto_13846 ?auto_13847 ) ) ( not ( = ?auto_13846 ?auto_13848 ) ) ( TRUCK-AT ?auto_13852 ?auto_13849 ) ( not ( = ?auto_13849 ?auto_13851 ) ) ( ON ?auto_13846 ?auto_13845 ) ( not ( = ?auto_13845 ?auto_13846 ) ) ( not ( = ?auto_13845 ?auto_13847 ) ) ( not ( = ?auto_13845 ?auto_13848 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13846 ?auto_13847 ?auto_13848 )
      ( MAKE-3CRATE-VERIFY ?auto_13845 ?auto_13846 ?auto_13847 ?auto_13848 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13853 - SURFACE
      ?auto_13854 - SURFACE
    )
    :vars
    (
      ?auto_13856 - HOIST
      ?auto_13857 - PLACE
      ?auto_13859 - SURFACE
      ?auto_13858 - TRUCK
      ?auto_13855 - PLACE
      ?auto_13860 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13856 ?auto_13857 ) ( SURFACE-AT ?auto_13853 ?auto_13857 ) ( CLEAR ?auto_13853 ) ( IS-CRATE ?auto_13854 ) ( not ( = ?auto_13853 ?auto_13854 ) ) ( AVAILABLE ?auto_13856 ) ( ON ?auto_13853 ?auto_13859 ) ( not ( = ?auto_13859 ?auto_13853 ) ) ( not ( = ?auto_13859 ?auto_13854 ) ) ( TRUCK-AT ?auto_13858 ?auto_13855 ) ( not ( = ?auto_13855 ?auto_13857 ) ) ( HOIST-AT ?auto_13860 ?auto_13855 ) ( LIFTING ?auto_13860 ?auto_13854 ) ( not ( = ?auto_13856 ?auto_13860 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13860 ?auto_13854 ?auto_13858 ?auto_13855 )
      ( MAKE-2CRATE ?auto_13859 ?auto_13853 ?auto_13854 )
      ( MAKE-1CRATE-VERIFY ?auto_13853 ?auto_13854 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13861 - SURFACE
      ?auto_13862 - SURFACE
      ?auto_13863 - SURFACE
    )
    :vars
    (
      ?auto_13866 - HOIST
      ?auto_13867 - PLACE
      ?auto_13865 - TRUCK
      ?auto_13868 - PLACE
      ?auto_13864 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13866 ?auto_13867 ) ( SURFACE-AT ?auto_13862 ?auto_13867 ) ( CLEAR ?auto_13862 ) ( IS-CRATE ?auto_13863 ) ( not ( = ?auto_13862 ?auto_13863 ) ) ( AVAILABLE ?auto_13866 ) ( ON ?auto_13862 ?auto_13861 ) ( not ( = ?auto_13861 ?auto_13862 ) ) ( not ( = ?auto_13861 ?auto_13863 ) ) ( TRUCK-AT ?auto_13865 ?auto_13868 ) ( not ( = ?auto_13868 ?auto_13867 ) ) ( HOIST-AT ?auto_13864 ?auto_13868 ) ( LIFTING ?auto_13864 ?auto_13863 ) ( not ( = ?auto_13866 ?auto_13864 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13862 ?auto_13863 )
      ( MAKE-2CRATE-VERIFY ?auto_13861 ?auto_13862 ?auto_13863 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13869 - SURFACE
      ?auto_13870 - SURFACE
      ?auto_13871 - SURFACE
      ?auto_13872 - SURFACE
    )
    :vars
    (
      ?auto_13877 - HOIST
      ?auto_13876 - PLACE
      ?auto_13874 - TRUCK
      ?auto_13875 - PLACE
      ?auto_13873 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13877 ?auto_13876 ) ( SURFACE-AT ?auto_13871 ?auto_13876 ) ( CLEAR ?auto_13871 ) ( IS-CRATE ?auto_13872 ) ( not ( = ?auto_13871 ?auto_13872 ) ) ( AVAILABLE ?auto_13877 ) ( ON ?auto_13871 ?auto_13870 ) ( not ( = ?auto_13870 ?auto_13871 ) ) ( not ( = ?auto_13870 ?auto_13872 ) ) ( TRUCK-AT ?auto_13874 ?auto_13875 ) ( not ( = ?auto_13875 ?auto_13876 ) ) ( HOIST-AT ?auto_13873 ?auto_13875 ) ( LIFTING ?auto_13873 ?auto_13872 ) ( not ( = ?auto_13877 ?auto_13873 ) ) ( ON ?auto_13870 ?auto_13869 ) ( not ( = ?auto_13869 ?auto_13870 ) ) ( not ( = ?auto_13869 ?auto_13871 ) ) ( not ( = ?auto_13869 ?auto_13872 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13870 ?auto_13871 ?auto_13872 )
      ( MAKE-3CRATE-VERIFY ?auto_13869 ?auto_13870 ?auto_13871 ?auto_13872 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13878 - SURFACE
      ?auto_13879 - SURFACE
    )
    :vars
    (
      ?auto_13884 - HOIST
      ?auto_13883 - PLACE
      ?auto_13885 - SURFACE
      ?auto_13881 - TRUCK
      ?auto_13882 - PLACE
      ?auto_13880 - HOIST
      ?auto_13886 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13884 ?auto_13883 ) ( SURFACE-AT ?auto_13878 ?auto_13883 ) ( CLEAR ?auto_13878 ) ( IS-CRATE ?auto_13879 ) ( not ( = ?auto_13878 ?auto_13879 ) ) ( AVAILABLE ?auto_13884 ) ( ON ?auto_13878 ?auto_13885 ) ( not ( = ?auto_13885 ?auto_13878 ) ) ( not ( = ?auto_13885 ?auto_13879 ) ) ( TRUCK-AT ?auto_13881 ?auto_13882 ) ( not ( = ?auto_13882 ?auto_13883 ) ) ( HOIST-AT ?auto_13880 ?auto_13882 ) ( not ( = ?auto_13884 ?auto_13880 ) ) ( AVAILABLE ?auto_13880 ) ( SURFACE-AT ?auto_13879 ?auto_13882 ) ( ON ?auto_13879 ?auto_13886 ) ( CLEAR ?auto_13879 ) ( not ( = ?auto_13878 ?auto_13886 ) ) ( not ( = ?auto_13879 ?auto_13886 ) ) ( not ( = ?auto_13885 ?auto_13886 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13880 ?auto_13879 ?auto_13886 ?auto_13882 )
      ( MAKE-2CRATE ?auto_13885 ?auto_13878 ?auto_13879 )
      ( MAKE-1CRATE-VERIFY ?auto_13878 ?auto_13879 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13887 - SURFACE
      ?auto_13888 - SURFACE
      ?auto_13889 - SURFACE
    )
    :vars
    (
      ?auto_13891 - HOIST
      ?auto_13892 - PLACE
      ?auto_13895 - TRUCK
      ?auto_13893 - PLACE
      ?auto_13894 - HOIST
      ?auto_13890 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13891 ?auto_13892 ) ( SURFACE-AT ?auto_13888 ?auto_13892 ) ( CLEAR ?auto_13888 ) ( IS-CRATE ?auto_13889 ) ( not ( = ?auto_13888 ?auto_13889 ) ) ( AVAILABLE ?auto_13891 ) ( ON ?auto_13888 ?auto_13887 ) ( not ( = ?auto_13887 ?auto_13888 ) ) ( not ( = ?auto_13887 ?auto_13889 ) ) ( TRUCK-AT ?auto_13895 ?auto_13893 ) ( not ( = ?auto_13893 ?auto_13892 ) ) ( HOIST-AT ?auto_13894 ?auto_13893 ) ( not ( = ?auto_13891 ?auto_13894 ) ) ( AVAILABLE ?auto_13894 ) ( SURFACE-AT ?auto_13889 ?auto_13893 ) ( ON ?auto_13889 ?auto_13890 ) ( CLEAR ?auto_13889 ) ( not ( = ?auto_13888 ?auto_13890 ) ) ( not ( = ?auto_13889 ?auto_13890 ) ) ( not ( = ?auto_13887 ?auto_13890 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13888 ?auto_13889 )
      ( MAKE-2CRATE-VERIFY ?auto_13887 ?auto_13888 ?auto_13889 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13896 - SURFACE
      ?auto_13897 - SURFACE
      ?auto_13898 - SURFACE
      ?auto_13899 - SURFACE
    )
    :vars
    (
      ?auto_13902 - HOIST
      ?auto_13901 - PLACE
      ?auto_13903 - TRUCK
      ?auto_13905 - PLACE
      ?auto_13904 - HOIST
      ?auto_13900 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13902 ?auto_13901 ) ( SURFACE-AT ?auto_13898 ?auto_13901 ) ( CLEAR ?auto_13898 ) ( IS-CRATE ?auto_13899 ) ( not ( = ?auto_13898 ?auto_13899 ) ) ( AVAILABLE ?auto_13902 ) ( ON ?auto_13898 ?auto_13897 ) ( not ( = ?auto_13897 ?auto_13898 ) ) ( not ( = ?auto_13897 ?auto_13899 ) ) ( TRUCK-AT ?auto_13903 ?auto_13905 ) ( not ( = ?auto_13905 ?auto_13901 ) ) ( HOIST-AT ?auto_13904 ?auto_13905 ) ( not ( = ?auto_13902 ?auto_13904 ) ) ( AVAILABLE ?auto_13904 ) ( SURFACE-AT ?auto_13899 ?auto_13905 ) ( ON ?auto_13899 ?auto_13900 ) ( CLEAR ?auto_13899 ) ( not ( = ?auto_13898 ?auto_13900 ) ) ( not ( = ?auto_13899 ?auto_13900 ) ) ( not ( = ?auto_13897 ?auto_13900 ) ) ( ON ?auto_13897 ?auto_13896 ) ( not ( = ?auto_13896 ?auto_13897 ) ) ( not ( = ?auto_13896 ?auto_13898 ) ) ( not ( = ?auto_13896 ?auto_13899 ) ) ( not ( = ?auto_13896 ?auto_13900 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13897 ?auto_13898 ?auto_13899 )
      ( MAKE-3CRATE-VERIFY ?auto_13896 ?auto_13897 ?auto_13898 ?auto_13899 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13906 - SURFACE
      ?auto_13907 - SURFACE
    )
    :vars
    (
      ?auto_13911 - HOIST
      ?auto_13910 - PLACE
      ?auto_13908 - SURFACE
      ?auto_13914 - PLACE
      ?auto_13913 - HOIST
      ?auto_13909 - SURFACE
      ?auto_13912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13911 ?auto_13910 ) ( SURFACE-AT ?auto_13906 ?auto_13910 ) ( CLEAR ?auto_13906 ) ( IS-CRATE ?auto_13907 ) ( not ( = ?auto_13906 ?auto_13907 ) ) ( AVAILABLE ?auto_13911 ) ( ON ?auto_13906 ?auto_13908 ) ( not ( = ?auto_13908 ?auto_13906 ) ) ( not ( = ?auto_13908 ?auto_13907 ) ) ( not ( = ?auto_13914 ?auto_13910 ) ) ( HOIST-AT ?auto_13913 ?auto_13914 ) ( not ( = ?auto_13911 ?auto_13913 ) ) ( AVAILABLE ?auto_13913 ) ( SURFACE-AT ?auto_13907 ?auto_13914 ) ( ON ?auto_13907 ?auto_13909 ) ( CLEAR ?auto_13907 ) ( not ( = ?auto_13906 ?auto_13909 ) ) ( not ( = ?auto_13907 ?auto_13909 ) ) ( not ( = ?auto_13908 ?auto_13909 ) ) ( TRUCK-AT ?auto_13912 ?auto_13910 ) )
    :subtasks
    ( ( !DRIVE ?auto_13912 ?auto_13910 ?auto_13914 )
      ( MAKE-2CRATE ?auto_13908 ?auto_13906 ?auto_13907 )
      ( MAKE-1CRATE-VERIFY ?auto_13906 ?auto_13907 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13915 - SURFACE
      ?auto_13916 - SURFACE
      ?auto_13917 - SURFACE
    )
    :vars
    (
      ?auto_13918 - HOIST
      ?auto_13923 - PLACE
      ?auto_13922 - PLACE
      ?auto_13919 - HOIST
      ?auto_13921 - SURFACE
      ?auto_13920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13918 ?auto_13923 ) ( SURFACE-AT ?auto_13916 ?auto_13923 ) ( CLEAR ?auto_13916 ) ( IS-CRATE ?auto_13917 ) ( not ( = ?auto_13916 ?auto_13917 ) ) ( AVAILABLE ?auto_13918 ) ( ON ?auto_13916 ?auto_13915 ) ( not ( = ?auto_13915 ?auto_13916 ) ) ( not ( = ?auto_13915 ?auto_13917 ) ) ( not ( = ?auto_13922 ?auto_13923 ) ) ( HOIST-AT ?auto_13919 ?auto_13922 ) ( not ( = ?auto_13918 ?auto_13919 ) ) ( AVAILABLE ?auto_13919 ) ( SURFACE-AT ?auto_13917 ?auto_13922 ) ( ON ?auto_13917 ?auto_13921 ) ( CLEAR ?auto_13917 ) ( not ( = ?auto_13916 ?auto_13921 ) ) ( not ( = ?auto_13917 ?auto_13921 ) ) ( not ( = ?auto_13915 ?auto_13921 ) ) ( TRUCK-AT ?auto_13920 ?auto_13923 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13916 ?auto_13917 )
      ( MAKE-2CRATE-VERIFY ?auto_13915 ?auto_13916 ?auto_13917 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13924 - SURFACE
      ?auto_13925 - SURFACE
      ?auto_13926 - SURFACE
      ?auto_13927 - SURFACE
    )
    :vars
    (
      ?auto_13930 - HOIST
      ?auto_13933 - PLACE
      ?auto_13928 - PLACE
      ?auto_13929 - HOIST
      ?auto_13932 - SURFACE
      ?auto_13931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13930 ?auto_13933 ) ( SURFACE-AT ?auto_13926 ?auto_13933 ) ( CLEAR ?auto_13926 ) ( IS-CRATE ?auto_13927 ) ( not ( = ?auto_13926 ?auto_13927 ) ) ( AVAILABLE ?auto_13930 ) ( ON ?auto_13926 ?auto_13925 ) ( not ( = ?auto_13925 ?auto_13926 ) ) ( not ( = ?auto_13925 ?auto_13927 ) ) ( not ( = ?auto_13928 ?auto_13933 ) ) ( HOIST-AT ?auto_13929 ?auto_13928 ) ( not ( = ?auto_13930 ?auto_13929 ) ) ( AVAILABLE ?auto_13929 ) ( SURFACE-AT ?auto_13927 ?auto_13928 ) ( ON ?auto_13927 ?auto_13932 ) ( CLEAR ?auto_13927 ) ( not ( = ?auto_13926 ?auto_13932 ) ) ( not ( = ?auto_13927 ?auto_13932 ) ) ( not ( = ?auto_13925 ?auto_13932 ) ) ( TRUCK-AT ?auto_13931 ?auto_13933 ) ( ON ?auto_13925 ?auto_13924 ) ( not ( = ?auto_13924 ?auto_13925 ) ) ( not ( = ?auto_13924 ?auto_13926 ) ) ( not ( = ?auto_13924 ?auto_13927 ) ) ( not ( = ?auto_13924 ?auto_13932 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13925 ?auto_13926 ?auto_13927 )
      ( MAKE-3CRATE-VERIFY ?auto_13924 ?auto_13925 ?auto_13926 ?auto_13927 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13934 - SURFACE
      ?auto_13935 - SURFACE
    )
    :vars
    (
      ?auto_13938 - HOIST
      ?auto_13942 - PLACE
      ?auto_13941 - SURFACE
      ?auto_13936 - PLACE
      ?auto_13937 - HOIST
      ?auto_13940 - SURFACE
      ?auto_13939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13938 ?auto_13942 ) ( IS-CRATE ?auto_13935 ) ( not ( = ?auto_13934 ?auto_13935 ) ) ( not ( = ?auto_13941 ?auto_13934 ) ) ( not ( = ?auto_13941 ?auto_13935 ) ) ( not ( = ?auto_13936 ?auto_13942 ) ) ( HOIST-AT ?auto_13937 ?auto_13936 ) ( not ( = ?auto_13938 ?auto_13937 ) ) ( AVAILABLE ?auto_13937 ) ( SURFACE-AT ?auto_13935 ?auto_13936 ) ( ON ?auto_13935 ?auto_13940 ) ( CLEAR ?auto_13935 ) ( not ( = ?auto_13934 ?auto_13940 ) ) ( not ( = ?auto_13935 ?auto_13940 ) ) ( not ( = ?auto_13941 ?auto_13940 ) ) ( TRUCK-AT ?auto_13939 ?auto_13942 ) ( SURFACE-AT ?auto_13941 ?auto_13942 ) ( CLEAR ?auto_13941 ) ( LIFTING ?auto_13938 ?auto_13934 ) ( IS-CRATE ?auto_13934 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13941 ?auto_13934 )
      ( MAKE-2CRATE ?auto_13941 ?auto_13934 ?auto_13935 )
      ( MAKE-1CRATE-VERIFY ?auto_13934 ?auto_13935 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13943 - SURFACE
      ?auto_13944 - SURFACE
      ?auto_13945 - SURFACE
    )
    :vars
    (
      ?auto_13947 - HOIST
      ?auto_13951 - PLACE
      ?auto_13946 - PLACE
      ?auto_13948 - HOIST
      ?auto_13950 - SURFACE
      ?auto_13949 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13947 ?auto_13951 ) ( IS-CRATE ?auto_13945 ) ( not ( = ?auto_13944 ?auto_13945 ) ) ( not ( = ?auto_13943 ?auto_13944 ) ) ( not ( = ?auto_13943 ?auto_13945 ) ) ( not ( = ?auto_13946 ?auto_13951 ) ) ( HOIST-AT ?auto_13948 ?auto_13946 ) ( not ( = ?auto_13947 ?auto_13948 ) ) ( AVAILABLE ?auto_13948 ) ( SURFACE-AT ?auto_13945 ?auto_13946 ) ( ON ?auto_13945 ?auto_13950 ) ( CLEAR ?auto_13945 ) ( not ( = ?auto_13944 ?auto_13950 ) ) ( not ( = ?auto_13945 ?auto_13950 ) ) ( not ( = ?auto_13943 ?auto_13950 ) ) ( TRUCK-AT ?auto_13949 ?auto_13951 ) ( SURFACE-AT ?auto_13943 ?auto_13951 ) ( CLEAR ?auto_13943 ) ( LIFTING ?auto_13947 ?auto_13944 ) ( IS-CRATE ?auto_13944 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13944 ?auto_13945 )
      ( MAKE-2CRATE-VERIFY ?auto_13943 ?auto_13944 ?auto_13945 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13952 - SURFACE
      ?auto_13953 - SURFACE
      ?auto_13954 - SURFACE
      ?auto_13955 - SURFACE
    )
    :vars
    (
      ?auto_13958 - HOIST
      ?auto_13961 - PLACE
      ?auto_13959 - PLACE
      ?auto_13957 - HOIST
      ?auto_13960 - SURFACE
      ?auto_13956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13958 ?auto_13961 ) ( IS-CRATE ?auto_13955 ) ( not ( = ?auto_13954 ?auto_13955 ) ) ( not ( = ?auto_13953 ?auto_13954 ) ) ( not ( = ?auto_13953 ?auto_13955 ) ) ( not ( = ?auto_13959 ?auto_13961 ) ) ( HOIST-AT ?auto_13957 ?auto_13959 ) ( not ( = ?auto_13958 ?auto_13957 ) ) ( AVAILABLE ?auto_13957 ) ( SURFACE-AT ?auto_13955 ?auto_13959 ) ( ON ?auto_13955 ?auto_13960 ) ( CLEAR ?auto_13955 ) ( not ( = ?auto_13954 ?auto_13960 ) ) ( not ( = ?auto_13955 ?auto_13960 ) ) ( not ( = ?auto_13953 ?auto_13960 ) ) ( TRUCK-AT ?auto_13956 ?auto_13961 ) ( SURFACE-AT ?auto_13953 ?auto_13961 ) ( CLEAR ?auto_13953 ) ( LIFTING ?auto_13958 ?auto_13954 ) ( IS-CRATE ?auto_13954 ) ( ON ?auto_13953 ?auto_13952 ) ( not ( = ?auto_13952 ?auto_13953 ) ) ( not ( = ?auto_13952 ?auto_13954 ) ) ( not ( = ?auto_13952 ?auto_13955 ) ) ( not ( = ?auto_13952 ?auto_13960 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13953 ?auto_13954 ?auto_13955 )
      ( MAKE-3CRATE-VERIFY ?auto_13952 ?auto_13953 ?auto_13954 ?auto_13955 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13962 - SURFACE
      ?auto_13963 - SURFACE
    )
    :vars
    (
      ?auto_13966 - HOIST
      ?auto_13970 - PLACE
      ?auto_13968 - SURFACE
      ?auto_13967 - PLACE
      ?auto_13965 - HOIST
      ?auto_13969 - SURFACE
      ?auto_13964 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13966 ?auto_13970 ) ( IS-CRATE ?auto_13963 ) ( not ( = ?auto_13962 ?auto_13963 ) ) ( not ( = ?auto_13968 ?auto_13962 ) ) ( not ( = ?auto_13968 ?auto_13963 ) ) ( not ( = ?auto_13967 ?auto_13970 ) ) ( HOIST-AT ?auto_13965 ?auto_13967 ) ( not ( = ?auto_13966 ?auto_13965 ) ) ( AVAILABLE ?auto_13965 ) ( SURFACE-AT ?auto_13963 ?auto_13967 ) ( ON ?auto_13963 ?auto_13969 ) ( CLEAR ?auto_13963 ) ( not ( = ?auto_13962 ?auto_13969 ) ) ( not ( = ?auto_13963 ?auto_13969 ) ) ( not ( = ?auto_13968 ?auto_13969 ) ) ( TRUCK-AT ?auto_13964 ?auto_13970 ) ( SURFACE-AT ?auto_13968 ?auto_13970 ) ( CLEAR ?auto_13968 ) ( IS-CRATE ?auto_13962 ) ( AVAILABLE ?auto_13966 ) ( IN ?auto_13962 ?auto_13964 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13966 ?auto_13962 ?auto_13964 ?auto_13970 )
      ( MAKE-2CRATE ?auto_13968 ?auto_13962 ?auto_13963 )
      ( MAKE-1CRATE-VERIFY ?auto_13962 ?auto_13963 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13971 - SURFACE
      ?auto_13972 - SURFACE
      ?auto_13973 - SURFACE
    )
    :vars
    (
      ?auto_13974 - HOIST
      ?auto_13979 - PLACE
      ?auto_13976 - PLACE
      ?auto_13978 - HOIST
      ?auto_13977 - SURFACE
      ?auto_13975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13974 ?auto_13979 ) ( IS-CRATE ?auto_13973 ) ( not ( = ?auto_13972 ?auto_13973 ) ) ( not ( = ?auto_13971 ?auto_13972 ) ) ( not ( = ?auto_13971 ?auto_13973 ) ) ( not ( = ?auto_13976 ?auto_13979 ) ) ( HOIST-AT ?auto_13978 ?auto_13976 ) ( not ( = ?auto_13974 ?auto_13978 ) ) ( AVAILABLE ?auto_13978 ) ( SURFACE-AT ?auto_13973 ?auto_13976 ) ( ON ?auto_13973 ?auto_13977 ) ( CLEAR ?auto_13973 ) ( not ( = ?auto_13972 ?auto_13977 ) ) ( not ( = ?auto_13973 ?auto_13977 ) ) ( not ( = ?auto_13971 ?auto_13977 ) ) ( TRUCK-AT ?auto_13975 ?auto_13979 ) ( SURFACE-AT ?auto_13971 ?auto_13979 ) ( CLEAR ?auto_13971 ) ( IS-CRATE ?auto_13972 ) ( AVAILABLE ?auto_13974 ) ( IN ?auto_13972 ?auto_13975 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13972 ?auto_13973 )
      ( MAKE-2CRATE-VERIFY ?auto_13971 ?auto_13972 ?auto_13973 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13980 - SURFACE
      ?auto_13981 - SURFACE
      ?auto_13982 - SURFACE
      ?auto_13983 - SURFACE
    )
    :vars
    (
      ?auto_13988 - HOIST
      ?auto_13985 - PLACE
      ?auto_13987 - PLACE
      ?auto_13986 - HOIST
      ?auto_13984 - SURFACE
      ?auto_13989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13988 ?auto_13985 ) ( IS-CRATE ?auto_13983 ) ( not ( = ?auto_13982 ?auto_13983 ) ) ( not ( = ?auto_13981 ?auto_13982 ) ) ( not ( = ?auto_13981 ?auto_13983 ) ) ( not ( = ?auto_13987 ?auto_13985 ) ) ( HOIST-AT ?auto_13986 ?auto_13987 ) ( not ( = ?auto_13988 ?auto_13986 ) ) ( AVAILABLE ?auto_13986 ) ( SURFACE-AT ?auto_13983 ?auto_13987 ) ( ON ?auto_13983 ?auto_13984 ) ( CLEAR ?auto_13983 ) ( not ( = ?auto_13982 ?auto_13984 ) ) ( not ( = ?auto_13983 ?auto_13984 ) ) ( not ( = ?auto_13981 ?auto_13984 ) ) ( TRUCK-AT ?auto_13989 ?auto_13985 ) ( SURFACE-AT ?auto_13981 ?auto_13985 ) ( CLEAR ?auto_13981 ) ( IS-CRATE ?auto_13982 ) ( AVAILABLE ?auto_13988 ) ( IN ?auto_13982 ?auto_13989 ) ( ON ?auto_13981 ?auto_13980 ) ( not ( = ?auto_13980 ?auto_13981 ) ) ( not ( = ?auto_13980 ?auto_13982 ) ) ( not ( = ?auto_13980 ?auto_13983 ) ) ( not ( = ?auto_13980 ?auto_13984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13981 ?auto_13982 ?auto_13983 )
      ( MAKE-3CRATE-VERIFY ?auto_13980 ?auto_13981 ?auto_13982 ?auto_13983 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13990 - SURFACE
      ?auto_13991 - SURFACE
    )
    :vars
    (
      ?auto_13997 - HOIST
      ?auto_13993 - PLACE
      ?auto_13996 - SURFACE
      ?auto_13995 - PLACE
      ?auto_13994 - HOIST
      ?auto_13992 - SURFACE
      ?auto_13998 - TRUCK
      ?auto_13999 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13997 ?auto_13993 ) ( IS-CRATE ?auto_13991 ) ( not ( = ?auto_13990 ?auto_13991 ) ) ( not ( = ?auto_13996 ?auto_13990 ) ) ( not ( = ?auto_13996 ?auto_13991 ) ) ( not ( = ?auto_13995 ?auto_13993 ) ) ( HOIST-AT ?auto_13994 ?auto_13995 ) ( not ( = ?auto_13997 ?auto_13994 ) ) ( AVAILABLE ?auto_13994 ) ( SURFACE-AT ?auto_13991 ?auto_13995 ) ( ON ?auto_13991 ?auto_13992 ) ( CLEAR ?auto_13991 ) ( not ( = ?auto_13990 ?auto_13992 ) ) ( not ( = ?auto_13991 ?auto_13992 ) ) ( not ( = ?auto_13996 ?auto_13992 ) ) ( SURFACE-AT ?auto_13996 ?auto_13993 ) ( CLEAR ?auto_13996 ) ( IS-CRATE ?auto_13990 ) ( AVAILABLE ?auto_13997 ) ( IN ?auto_13990 ?auto_13998 ) ( TRUCK-AT ?auto_13998 ?auto_13999 ) ( not ( = ?auto_13999 ?auto_13993 ) ) ( not ( = ?auto_13995 ?auto_13999 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13998 ?auto_13999 ?auto_13993 )
      ( MAKE-2CRATE ?auto_13996 ?auto_13990 ?auto_13991 )
      ( MAKE-1CRATE-VERIFY ?auto_13990 ?auto_13991 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14000 - SURFACE
      ?auto_14001 - SURFACE
      ?auto_14002 - SURFACE
    )
    :vars
    (
      ?auto_14008 - HOIST
      ?auto_14006 - PLACE
      ?auto_14004 - PLACE
      ?auto_14003 - HOIST
      ?auto_14007 - SURFACE
      ?auto_14009 - TRUCK
      ?auto_14005 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14008 ?auto_14006 ) ( IS-CRATE ?auto_14002 ) ( not ( = ?auto_14001 ?auto_14002 ) ) ( not ( = ?auto_14000 ?auto_14001 ) ) ( not ( = ?auto_14000 ?auto_14002 ) ) ( not ( = ?auto_14004 ?auto_14006 ) ) ( HOIST-AT ?auto_14003 ?auto_14004 ) ( not ( = ?auto_14008 ?auto_14003 ) ) ( AVAILABLE ?auto_14003 ) ( SURFACE-AT ?auto_14002 ?auto_14004 ) ( ON ?auto_14002 ?auto_14007 ) ( CLEAR ?auto_14002 ) ( not ( = ?auto_14001 ?auto_14007 ) ) ( not ( = ?auto_14002 ?auto_14007 ) ) ( not ( = ?auto_14000 ?auto_14007 ) ) ( SURFACE-AT ?auto_14000 ?auto_14006 ) ( CLEAR ?auto_14000 ) ( IS-CRATE ?auto_14001 ) ( AVAILABLE ?auto_14008 ) ( IN ?auto_14001 ?auto_14009 ) ( TRUCK-AT ?auto_14009 ?auto_14005 ) ( not ( = ?auto_14005 ?auto_14006 ) ) ( not ( = ?auto_14004 ?auto_14005 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14001 ?auto_14002 )
      ( MAKE-2CRATE-VERIFY ?auto_14000 ?auto_14001 ?auto_14002 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14010 - SURFACE
      ?auto_14011 - SURFACE
      ?auto_14012 - SURFACE
      ?auto_14013 - SURFACE
    )
    :vars
    (
      ?auto_14016 - HOIST
      ?auto_14014 - PLACE
      ?auto_14017 - PLACE
      ?auto_14019 - HOIST
      ?auto_14015 - SURFACE
      ?auto_14018 - TRUCK
      ?auto_14020 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14016 ?auto_14014 ) ( IS-CRATE ?auto_14013 ) ( not ( = ?auto_14012 ?auto_14013 ) ) ( not ( = ?auto_14011 ?auto_14012 ) ) ( not ( = ?auto_14011 ?auto_14013 ) ) ( not ( = ?auto_14017 ?auto_14014 ) ) ( HOIST-AT ?auto_14019 ?auto_14017 ) ( not ( = ?auto_14016 ?auto_14019 ) ) ( AVAILABLE ?auto_14019 ) ( SURFACE-AT ?auto_14013 ?auto_14017 ) ( ON ?auto_14013 ?auto_14015 ) ( CLEAR ?auto_14013 ) ( not ( = ?auto_14012 ?auto_14015 ) ) ( not ( = ?auto_14013 ?auto_14015 ) ) ( not ( = ?auto_14011 ?auto_14015 ) ) ( SURFACE-AT ?auto_14011 ?auto_14014 ) ( CLEAR ?auto_14011 ) ( IS-CRATE ?auto_14012 ) ( AVAILABLE ?auto_14016 ) ( IN ?auto_14012 ?auto_14018 ) ( TRUCK-AT ?auto_14018 ?auto_14020 ) ( not ( = ?auto_14020 ?auto_14014 ) ) ( not ( = ?auto_14017 ?auto_14020 ) ) ( ON ?auto_14011 ?auto_14010 ) ( not ( = ?auto_14010 ?auto_14011 ) ) ( not ( = ?auto_14010 ?auto_14012 ) ) ( not ( = ?auto_14010 ?auto_14013 ) ) ( not ( = ?auto_14010 ?auto_14015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14011 ?auto_14012 ?auto_14013 )
      ( MAKE-3CRATE-VERIFY ?auto_14010 ?auto_14011 ?auto_14012 ?auto_14013 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14021 - SURFACE
      ?auto_14022 - SURFACE
    )
    :vars
    (
      ?auto_14026 - HOIST
      ?auto_14023 - PLACE
      ?auto_14024 - SURFACE
      ?auto_14027 - PLACE
      ?auto_14029 - HOIST
      ?auto_14025 - SURFACE
      ?auto_14028 - TRUCK
      ?auto_14030 - PLACE
      ?auto_14031 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14026 ?auto_14023 ) ( IS-CRATE ?auto_14022 ) ( not ( = ?auto_14021 ?auto_14022 ) ) ( not ( = ?auto_14024 ?auto_14021 ) ) ( not ( = ?auto_14024 ?auto_14022 ) ) ( not ( = ?auto_14027 ?auto_14023 ) ) ( HOIST-AT ?auto_14029 ?auto_14027 ) ( not ( = ?auto_14026 ?auto_14029 ) ) ( AVAILABLE ?auto_14029 ) ( SURFACE-AT ?auto_14022 ?auto_14027 ) ( ON ?auto_14022 ?auto_14025 ) ( CLEAR ?auto_14022 ) ( not ( = ?auto_14021 ?auto_14025 ) ) ( not ( = ?auto_14022 ?auto_14025 ) ) ( not ( = ?auto_14024 ?auto_14025 ) ) ( SURFACE-AT ?auto_14024 ?auto_14023 ) ( CLEAR ?auto_14024 ) ( IS-CRATE ?auto_14021 ) ( AVAILABLE ?auto_14026 ) ( TRUCK-AT ?auto_14028 ?auto_14030 ) ( not ( = ?auto_14030 ?auto_14023 ) ) ( not ( = ?auto_14027 ?auto_14030 ) ) ( HOIST-AT ?auto_14031 ?auto_14030 ) ( LIFTING ?auto_14031 ?auto_14021 ) ( not ( = ?auto_14026 ?auto_14031 ) ) ( not ( = ?auto_14029 ?auto_14031 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14031 ?auto_14021 ?auto_14028 ?auto_14030 )
      ( MAKE-2CRATE ?auto_14024 ?auto_14021 ?auto_14022 )
      ( MAKE-1CRATE-VERIFY ?auto_14021 ?auto_14022 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14032 - SURFACE
      ?auto_14033 - SURFACE
      ?auto_14034 - SURFACE
    )
    :vars
    (
      ?auto_14037 - HOIST
      ?auto_14038 - PLACE
      ?auto_14036 - PLACE
      ?auto_14035 - HOIST
      ?auto_14042 - SURFACE
      ?auto_14041 - TRUCK
      ?auto_14039 - PLACE
      ?auto_14040 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14037 ?auto_14038 ) ( IS-CRATE ?auto_14034 ) ( not ( = ?auto_14033 ?auto_14034 ) ) ( not ( = ?auto_14032 ?auto_14033 ) ) ( not ( = ?auto_14032 ?auto_14034 ) ) ( not ( = ?auto_14036 ?auto_14038 ) ) ( HOIST-AT ?auto_14035 ?auto_14036 ) ( not ( = ?auto_14037 ?auto_14035 ) ) ( AVAILABLE ?auto_14035 ) ( SURFACE-AT ?auto_14034 ?auto_14036 ) ( ON ?auto_14034 ?auto_14042 ) ( CLEAR ?auto_14034 ) ( not ( = ?auto_14033 ?auto_14042 ) ) ( not ( = ?auto_14034 ?auto_14042 ) ) ( not ( = ?auto_14032 ?auto_14042 ) ) ( SURFACE-AT ?auto_14032 ?auto_14038 ) ( CLEAR ?auto_14032 ) ( IS-CRATE ?auto_14033 ) ( AVAILABLE ?auto_14037 ) ( TRUCK-AT ?auto_14041 ?auto_14039 ) ( not ( = ?auto_14039 ?auto_14038 ) ) ( not ( = ?auto_14036 ?auto_14039 ) ) ( HOIST-AT ?auto_14040 ?auto_14039 ) ( LIFTING ?auto_14040 ?auto_14033 ) ( not ( = ?auto_14037 ?auto_14040 ) ) ( not ( = ?auto_14035 ?auto_14040 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14033 ?auto_14034 )
      ( MAKE-2CRATE-VERIFY ?auto_14032 ?auto_14033 ?auto_14034 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14043 - SURFACE
      ?auto_14044 - SURFACE
      ?auto_14045 - SURFACE
      ?auto_14046 - SURFACE
    )
    :vars
    (
      ?auto_14047 - HOIST
      ?auto_14054 - PLACE
      ?auto_14052 - PLACE
      ?auto_14051 - HOIST
      ?auto_14053 - SURFACE
      ?auto_14050 - TRUCK
      ?auto_14048 - PLACE
      ?auto_14049 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14047 ?auto_14054 ) ( IS-CRATE ?auto_14046 ) ( not ( = ?auto_14045 ?auto_14046 ) ) ( not ( = ?auto_14044 ?auto_14045 ) ) ( not ( = ?auto_14044 ?auto_14046 ) ) ( not ( = ?auto_14052 ?auto_14054 ) ) ( HOIST-AT ?auto_14051 ?auto_14052 ) ( not ( = ?auto_14047 ?auto_14051 ) ) ( AVAILABLE ?auto_14051 ) ( SURFACE-AT ?auto_14046 ?auto_14052 ) ( ON ?auto_14046 ?auto_14053 ) ( CLEAR ?auto_14046 ) ( not ( = ?auto_14045 ?auto_14053 ) ) ( not ( = ?auto_14046 ?auto_14053 ) ) ( not ( = ?auto_14044 ?auto_14053 ) ) ( SURFACE-AT ?auto_14044 ?auto_14054 ) ( CLEAR ?auto_14044 ) ( IS-CRATE ?auto_14045 ) ( AVAILABLE ?auto_14047 ) ( TRUCK-AT ?auto_14050 ?auto_14048 ) ( not ( = ?auto_14048 ?auto_14054 ) ) ( not ( = ?auto_14052 ?auto_14048 ) ) ( HOIST-AT ?auto_14049 ?auto_14048 ) ( LIFTING ?auto_14049 ?auto_14045 ) ( not ( = ?auto_14047 ?auto_14049 ) ) ( not ( = ?auto_14051 ?auto_14049 ) ) ( ON ?auto_14044 ?auto_14043 ) ( not ( = ?auto_14043 ?auto_14044 ) ) ( not ( = ?auto_14043 ?auto_14045 ) ) ( not ( = ?auto_14043 ?auto_14046 ) ) ( not ( = ?auto_14043 ?auto_14053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14044 ?auto_14045 ?auto_14046 )
      ( MAKE-3CRATE-VERIFY ?auto_14043 ?auto_14044 ?auto_14045 ?auto_14046 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14055 - SURFACE
      ?auto_14056 - SURFACE
    )
    :vars
    (
      ?auto_14057 - HOIST
      ?auto_14065 - PLACE
      ?auto_14062 - SURFACE
      ?auto_14063 - PLACE
      ?auto_14061 - HOIST
      ?auto_14064 - SURFACE
      ?auto_14060 - TRUCK
      ?auto_14058 - PLACE
      ?auto_14059 - HOIST
      ?auto_14066 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14057 ?auto_14065 ) ( IS-CRATE ?auto_14056 ) ( not ( = ?auto_14055 ?auto_14056 ) ) ( not ( = ?auto_14062 ?auto_14055 ) ) ( not ( = ?auto_14062 ?auto_14056 ) ) ( not ( = ?auto_14063 ?auto_14065 ) ) ( HOIST-AT ?auto_14061 ?auto_14063 ) ( not ( = ?auto_14057 ?auto_14061 ) ) ( AVAILABLE ?auto_14061 ) ( SURFACE-AT ?auto_14056 ?auto_14063 ) ( ON ?auto_14056 ?auto_14064 ) ( CLEAR ?auto_14056 ) ( not ( = ?auto_14055 ?auto_14064 ) ) ( not ( = ?auto_14056 ?auto_14064 ) ) ( not ( = ?auto_14062 ?auto_14064 ) ) ( SURFACE-AT ?auto_14062 ?auto_14065 ) ( CLEAR ?auto_14062 ) ( IS-CRATE ?auto_14055 ) ( AVAILABLE ?auto_14057 ) ( TRUCK-AT ?auto_14060 ?auto_14058 ) ( not ( = ?auto_14058 ?auto_14065 ) ) ( not ( = ?auto_14063 ?auto_14058 ) ) ( HOIST-AT ?auto_14059 ?auto_14058 ) ( not ( = ?auto_14057 ?auto_14059 ) ) ( not ( = ?auto_14061 ?auto_14059 ) ) ( AVAILABLE ?auto_14059 ) ( SURFACE-AT ?auto_14055 ?auto_14058 ) ( ON ?auto_14055 ?auto_14066 ) ( CLEAR ?auto_14055 ) ( not ( = ?auto_14055 ?auto_14066 ) ) ( not ( = ?auto_14056 ?auto_14066 ) ) ( not ( = ?auto_14062 ?auto_14066 ) ) ( not ( = ?auto_14064 ?auto_14066 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14059 ?auto_14055 ?auto_14066 ?auto_14058 )
      ( MAKE-2CRATE ?auto_14062 ?auto_14055 ?auto_14056 )
      ( MAKE-1CRATE-VERIFY ?auto_14055 ?auto_14056 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14067 - SURFACE
      ?auto_14068 - SURFACE
      ?auto_14069 - SURFACE
    )
    :vars
    (
      ?auto_14076 - HOIST
      ?auto_14077 - PLACE
      ?auto_14072 - PLACE
      ?auto_14078 - HOIST
      ?auto_14070 - SURFACE
      ?auto_14073 - TRUCK
      ?auto_14071 - PLACE
      ?auto_14074 - HOIST
      ?auto_14075 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14076 ?auto_14077 ) ( IS-CRATE ?auto_14069 ) ( not ( = ?auto_14068 ?auto_14069 ) ) ( not ( = ?auto_14067 ?auto_14068 ) ) ( not ( = ?auto_14067 ?auto_14069 ) ) ( not ( = ?auto_14072 ?auto_14077 ) ) ( HOIST-AT ?auto_14078 ?auto_14072 ) ( not ( = ?auto_14076 ?auto_14078 ) ) ( AVAILABLE ?auto_14078 ) ( SURFACE-AT ?auto_14069 ?auto_14072 ) ( ON ?auto_14069 ?auto_14070 ) ( CLEAR ?auto_14069 ) ( not ( = ?auto_14068 ?auto_14070 ) ) ( not ( = ?auto_14069 ?auto_14070 ) ) ( not ( = ?auto_14067 ?auto_14070 ) ) ( SURFACE-AT ?auto_14067 ?auto_14077 ) ( CLEAR ?auto_14067 ) ( IS-CRATE ?auto_14068 ) ( AVAILABLE ?auto_14076 ) ( TRUCK-AT ?auto_14073 ?auto_14071 ) ( not ( = ?auto_14071 ?auto_14077 ) ) ( not ( = ?auto_14072 ?auto_14071 ) ) ( HOIST-AT ?auto_14074 ?auto_14071 ) ( not ( = ?auto_14076 ?auto_14074 ) ) ( not ( = ?auto_14078 ?auto_14074 ) ) ( AVAILABLE ?auto_14074 ) ( SURFACE-AT ?auto_14068 ?auto_14071 ) ( ON ?auto_14068 ?auto_14075 ) ( CLEAR ?auto_14068 ) ( not ( = ?auto_14068 ?auto_14075 ) ) ( not ( = ?auto_14069 ?auto_14075 ) ) ( not ( = ?auto_14067 ?auto_14075 ) ) ( not ( = ?auto_14070 ?auto_14075 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14068 ?auto_14069 )
      ( MAKE-2CRATE-VERIFY ?auto_14067 ?auto_14068 ?auto_14069 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14079 - SURFACE
      ?auto_14080 - SURFACE
      ?auto_14081 - SURFACE
      ?auto_14082 - SURFACE
    )
    :vars
    (
      ?auto_14087 - HOIST
      ?auto_14084 - PLACE
      ?auto_14090 - PLACE
      ?auto_14088 - HOIST
      ?auto_14091 - SURFACE
      ?auto_14083 - TRUCK
      ?auto_14089 - PLACE
      ?auto_14085 - HOIST
      ?auto_14086 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14087 ?auto_14084 ) ( IS-CRATE ?auto_14082 ) ( not ( = ?auto_14081 ?auto_14082 ) ) ( not ( = ?auto_14080 ?auto_14081 ) ) ( not ( = ?auto_14080 ?auto_14082 ) ) ( not ( = ?auto_14090 ?auto_14084 ) ) ( HOIST-AT ?auto_14088 ?auto_14090 ) ( not ( = ?auto_14087 ?auto_14088 ) ) ( AVAILABLE ?auto_14088 ) ( SURFACE-AT ?auto_14082 ?auto_14090 ) ( ON ?auto_14082 ?auto_14091 ) ( CLEAR ?auto_14082 ) ( not ( = ?auto_14081 ?auto_14091 ) ) ( not ( = ?auto_14082 ?auto_14091 ) ) ( not ( = ?auto_14080 ?auto_14091 ) ) ( SURFACE-AT ?auto_14080 ?auto_14084 ) ( CLEAR ?auto_14080 ) ( IS-CRATE ?auto_14081 ) ( AVAILABLE ?auto_14087 ) ( TRUCK-AT ?auto_14083 ?auto_14089 ) ( not ( = ?auto_14089 ?auto_14084 ) ) ( not ( = ?auto_14090 ?auto_14089 ) ) ( HOIST-AT ?auto_14085 ?auto_14089 ) ( not ( = ?auto_14087 ?auto_14085 ) ) ( not ( = ?auto_14088 ?auto_14085 ) ) ( AVAILABLE ?auto_14085 ) ( SURFACE-AT ?auto_14081 ?auto_14089 ) ( ON ?auto_14081 ?auto_14086 ) ( CLEAR ?auto_14081 ) ( not ( = ?auto_14081 ?auto_14086 ) ) ( not ( = ?auto_14082 ?auto_14086 ) ) ( not ( = ?auto_14080 ?auto_14086 ) ) ( not ( = ?auto_14091 ?auto_14086 ) ) ( ON ?auto_14080 ?auto_14079 ) ( not ( = ?auto_14079 ?auto_14080 ) ) ( not ( = ?auto_14079 ?auto_14081 ) ) ( not ( = ?auto_14079 ?auto_14082 ) ) ( not ( = ?auto_14079 ?auto_14091 ) ) ( not ( = ?auto_14079 ?auto_14086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14080 ?auto_14081 ?auto_14082 )
      ( MAKE-3CRATE-VERIFY ?auto_14079 ?auto_14080 ?auto_14081 ?auto_14082 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14092 - SURFACE
      ?auto_14093 - SURFACE
    )
    :vars
    (
      ?auto_14099 - HOIST
      ?auto_14095 - PLACE
      ?auto_14097 - SURFACE
      ?auto_14102 - PLACE
      ?auto_14100 - HOIST
      ?auto_14103 - SURFACE
      ?auto_14101 - PLACE
      ?auto_14096 - HOIST
      ?auto_14098 - SURFACE
      ?auto_14094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14099 ?auto_14095 ) ( IS-CRATE ?auto_14093 ) ( not ( = ?auto_14092 ?auto_14093 ) ) ( not ( = ?auto_14097 ?auto_14092 ) ) ( not ( = ?auto_14097 ?auto_14093 ) ) ( not ( = ?auto_14102 ?auto_14095 ) ) ( HOIST-AT ?auto_14100 ?auto_14102 ) ( not ( = ?auto_14099 ?auto_14100 ) ) ( AVAILABLE ?auto_14100 ) ( SURFACE-AT ?auto_14093 ?auto_14102 ) ( ON ?auto_14093 ?auto_14103 ) ( CLEAR ?auto_14093 ) ( not ( = ?auto_14092 ?auto_14103 ) ) ( not ( = ?auto_14093 ?auto_14103 ) ) ( not ( = ?auto_14097 ?auto_14103 ) ) ( SURFACE-AT ?auto_14097 ?auto_14095 ) ( CLEAR ?auto_14097 ) ( IS-CRATE ?auto_14092 ) ( AVAILABLE ?auto_14099 ) ( not ( = ?auto_14101 ?auto_14095 ) ) ( not ( = ?auto_14102 ?auto_14101 ) ) ( HOIST-AT ?auto_14096 ?auto_14101 ) ( not ( = ?auto_14099 ?auto_14096 ) ) ( not ( = ?auto_14100 ?auto_14096 ) ) ( AVAILABLE ?auto_14096 ) ( SURFACE-AT ?auto_14092 ?auto_14101 ) ( ON ?auto_14092 ?auto_14098 ) ( CLEAR ?auto_14092 ) ( not ( = ?auto_14092 ?auto_14098 ) ) ( not ( = ?auto_14093 ?auto_14098 ) ) ( not ( = ?auto_14097 ?auto_14098 ) ) ( not ( = ?auto_14103 ?auto_14098 ) ) ( TRUCK-AT ?auto_14094 ?auto_14095 ) )
    :subtasks
    ( ( !DRIVE ?auto_14094 ?auto_14095 ?auto_14101 )
      ( MAKE-2CRATE ?auto_14097 ?auto_14092 ?auto_14093 )
      ( MAKE-1CRATE-VERIFY ?auto_14092 ?auto_14093 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14104 - SURFACE
      ?auto_14105 - SURFACE
      ?auto_14106 - SURFACE
    )
    :vars
    (
      ?auto_14114 - HOIST
      ?auto_14107 - PLACE
      ?auto_14110 - PLACE
      ?auto_14115 - HOIST
      ?auto_14108 - SURFACE
      ?auto_14109 - PLACE
      ?auto_14113 - HOIST
      ?auto_14112 - SURFACE
      ?auto_14111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14114 ?auto_14107 ) ( IS-CRATE ?auto_14106 ) ( not ( = ?auto_14105 ?auto_14106 ) ) ( not ( = ?auto_14104 ?auto_14105 ) ) ( not ( = ?auto_14104 ?auto_14106 ) ) ( not ( = ?auto_14110 ?auto_14107 ) ) ( HOIST-AT ?auto_14115 ?auto_14110 ) ( not ( = ?auto_14114 ?auto_14115 ) ) ( AVAILABLE ?auto_14115 ) ( SURFACE-AT ?auto_14106 ?auto_14110 ) ( ON ?auto_14106 ?auto_14108 ) ( CLEAR ?auto_14106 ) ( not ( = ?auto_14105 ?auto_14108 ) ) ( not ( = ?auto_14106 ?auto_14108 ) ) ( not ( = ?auto_14104 ?auto_14108 ) ) ( SURFACE-AT ?auto_14104 ?auto_14107 ) ( CLEAR ?auto_14104 ) ( IS-CRATE ?auto_14105 ) ( AVAILABLE ?auto_14114 ) ( not ( = ?auto_14109 ?auto_14107 ) ) ( not ( = ?auto_14110 ?auto_14109 ) ) ( HOIST-AT ?auto_14113 ?auto_14109 ) ( not ( = ?auto_14114 ?auto_14113 ) ) ( not ( = ?auto_14115 ?auto_14113 ) ) ( AVAILABLE ?auto_14113 ) ( SURFACE-AT ?auto_14105 ?auto_14109 ) ( ON ?auto_14105 ?auto_14112 ) ( CLEAR ?auto_14105 ) ( not ( = ?auto_14105 ?auto_14112 ) ) ( not ( = ?auto_14106 ?auto_14112 ) ) ( not ( = ?auto_14104 ?auto_14112 ) ) ( not ( = ?auto_14108 ?auto_14112 ) ) ( TRUCK-AT ?auto_14111 ?auto_14107 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14105 ?auto_14106 )
      ( MAKE-2CRATE-VERIFY ?auto_14104 ?auto_14105 ?auto_14106 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14116 - SURFACE
      ?auto_14117 - SURFACE
      ?auto_14118 - SURFACE
      ?auto_14119 - SURFACE
    )
    :vars
    (
      ?auto_14124 - HOIST
      ?auto_14128 - PLACE
      ?auto_14122 - PLACE
      ?auto_14120 - HOIST
      ?auto_14126 - SURFACE
      ?auto_14125 - PLACE
      ?auto_14127 - HOIST
      ?auto_14121 - SURFACE
      ?auto_14123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14124 ?auto_14128 ) ( IS-CRATE ?auto_14119 ) ( not ( = ?auto_14118 ?auto_14119 ) ) ( not ( = ?auto_14117 ?auto_14118 ) ) ( not ( = ?auto_14117 ?auto_14119 ) ) ( not ( = ?auto_14122 ?auto_14128 ) ) ( HOIST-AT ?auto_14120 ?auto_14122 ) ( not ( = ?auto_14124 ?auto_14120 ) ) ( AVAILABLE ?auto_14120 ) ( SURFACE-AT ?auto_14119 ?auto_14122 ) ( ON ?auto_14119 ?auto_14126 ) ( CLEAR ?auto_14119 ) ( not ( = ?auto_14118 ?auto_14126 ) ) ( not ( = ?auto_14119 ?auto_14126 ) ) ( not ( = ?auto_14117 ?auto_14126 ) ) ( SURFACE-AT ?auto_14117 ?auto_14128 ) ( CLEAR ?auto_14117 ) ( IS-CRATE ?auto_14118 ) ( AVAILABLE ?auto_14124 ) ( not ( = ?auto_14125 ?auto_14128 ) ) ( not ( = ?auto_14122 ?auto_14125 ) ) ( HOIST-AT ?auto_14127 ?auto_14125 ) ( not ( = ?auto_14124 ?auto_14127 ) ) ( not ( = ?auto_14120 ?auto_14127 ) ) ( AVAILABLE ?auto_14127 ) ( SURFACE-AT ?auto_14118 ?auto_14125 ) ( ON ?auto_14118 ?auto_14121 ) ( CLEAR ?auto_14118 ) ( not ( = ?auto_14118 ?auto_14121 ) ) ( not ( = ?auto_14119 ?auto_14121 ) ) ( not ( = ?auto_14117 ?auto_14121 ) ) ( not ( = ?auto_14126 ?auto_14121 ) ) ( TRUCK-AT ?auto_14123 ?auto_14128 ) ( ON ?auto_14117 ?auto_14116 ) ( not ( = ?auto_14116 ?auto_14117 ) ) ( not ( = ?auto_14116 ?auto_14118 ) ) ( not ( = ?auto_14116 ?auto_14119 ) ) ( not ( = ?auto_14116 ?auto_14126 ) ) ( not ( = ?auto_14116 ?auto_14121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14117 ?auto_14118 ?auto_14119 )
      ( MAKE-3CRATE-VERIFY ?auto_14116 ?auto_14117 ?auto_14118 ?auto_14119 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14129 - SURFACE
      ?auto_14130 - SURFACE
    )
    :vars
    (
      ?auto_14135 - HOIST
      ?auto_14140 - PLACE
      ?auto_14137 - SURFACE
      ?auto_14133 - PLACE
      ?auto_14131 - HOIST
      ?auto_14138 - SURFACE
      ?auto_14136 - PLACE
      ?auto_14139 - HOIST
      ?auto_14132 - SURFACE
      ?auto_14134 - TRUCK
      ?auto_14141 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14135 ?auto_14140 ) ( IS-CRATE ?auto_14130 ) ( not ( = ?auto_14129 ?auto_14130 ) ) ( not ( = ?auto_14137 ?auto_14129 ) ) ( not ( = ?auto_14137 ?auto_14130 ) ) ( not ( = ?auto_14133 ?auto_14140 ) ) ( HOIST-AT ?auto_14131 ?auto_14133 ) ( not ( = ?auto_14135 ?auto_14131 ) ) ( AVAILABLE ?auto_14131 ) ( SURFACE-AT ?auto_14130 ?auto_14133 ) ( ON ?auto_14130 ?auto_14138 ) ( CLEAR ?auto_14130 ) ( not ( = ?auto_14129 ?auto_14138 ) ) ( not ( = ?auto_14130 ?auto_14138 ) ) ( not ( = ?auto_14137 ?auto_14138 ) ) ( IS-CRATE ?auto_14129 ) ( not ( = ?auto_14136 ?auto_14140 ) ) ( not ( = ?auto_14133 ?auto_14136 ) ) ( HOIST-AT ?auto_14139 ?auto_14136 ) ( not ( = ?auto_14135 ?auto_14139 ) ) ( not ( = ?auto_14131 ?auto_14139 ) ) ( AVAILABLE ?auto_14139 ) ( SURFACE-AT ?auto_14129 ?auto_14136 ) ( ON ?auto_14129 ?auto_14132 ) ( CLEAR ?auto_14129 ) ( not ( = ?auto_14129 ?auto_14132 ) ) ( not ( = ?auto_14130 ?auto_14132 ) ) ( not ( = ?auto_14137 ?auto_14132 ) ) ( not ( = ?auto_14138 ?auto_14132 ) ) ( TRUCK-AT ?auto_14134 ?auto_14140 ) ( SURFACE-AT ?auto_14141 ?auto_14140 ) ( CLEAR ?auto_14141 ) ( LIFTING ?auto_14135 ?auto_14137 ) ( IS-CRATE ?auto_14137 ) ( not ( = ?auto_14141 ?auto_14137 ) ) ( not ( = ?auto_14129 ?auto_14141 ) ) ( not ( = ?auto_14130 ?auto_14141 ) ) ( not ( = ?auto_14138 ?auto_14141 ) ) ( not ( = ?auto_14132 ?auto_14141 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14141 ?auto_14137 )
      ( MAKE-2CRATE ?auto_14137 ?auto_14129 ?auto_14130 )
      ( MAKE-1CRATE-VERIFY ?auto_14129 ?auto_14130 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14142 - SURFACE
      ?auto_14143 - SURFACE
      ?auto_14144 - SURFACE
    )
    :vars
    (
      ?auto_14147 - HOIST
      ?auto_14146 - PLACE
      ?auto_14152 - PLACE
      ?auto_14153 - HOIST
      ?auto_14150 - SURFACE
      ?auto_14148 - PLACE
      ?auto_14154 - HOIST
      ?auto_14149 - SURFACE
      ?auto_14145 - TRUCK
      ?auto_14151 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14147 ?auto_14146 ) ( IS-CRATE ?auto_14144 ) ( not ( = ?auto_14143 ?auto_14144 ) ) ( not ( = ?auto_14142 ?auto_14143 ) ) ( not ( = ?auto_14142 ?auto_14144 ) ) ( not ( = ?auto_14152 ?auto_14146 ) ) ( HOIST-AT ?auto_14153 ?auto_14152 ) ( not ( = ?auto_14147 ?auto_14153 ) ) ( AVAILABLE ?auto_14153 ) ( SURFACE-AT ?auto_14144 ?auto_14152 ) ( ON ?auto_14144 ?auto_14150 ) ( CLEAR ?auto_14144 ) ( not ( = ?auto_14143 ?auto_14150 ) ) ( not ( = ?auto_14144 ?auto_14150 ) ) ( not ( = ?auto_14142 ?auto_14150 ) ) ( IS-CRATE ?auto_14143 ) ( not ( = ?auto_14148 ?auto_14146 ) ) ( not ( = ?auto_14152 ?auto_14148 ) ) ( HOIST-AT ?auto_14154 ?auto_14148 ) ( not ( = ?auto_14147 ?auto_14154 ) ) ( not ( = ?auto_14153 ?auto_14154 ) ) ( AVAILABLE ?auto_14154 ) ( SURFACE-AT ?auto_14143 ?auto_14148 ) ( ON ?auto_14143 ?auto_14149 ) ( CLEAR ?auto_14143 ) ( not ( = ?auto_14143 ?auto_14149 ) ) ( not ( = ?auto_14144 ?auto_14149 ) ) ( not ( = ?auto_14142 ?auto_14149 ) ) ( not ( = ?auto_14150 ?auto_14149 ) ) ( TRUCK-AT ?auto_14145 ?auto_14146 ) ( SURFACE-AT ?auto_14151 ?auto_14146 ) ( CLEAR ?auto_14151 ) ( LIFTING ?auto_14147 ?auto_14142 ) ( IS-CRATE ?auto_14142 ) ( not ( = ?auto_14151 ?auto_14142 ) ) ( not ( = ?auto_14143 ?auto_14151 ) ) ( not ( = ?auto_14144 ?auto_14151 ) ) ( not ( = ?auto_14150 ?auto_14151 ) ) ( not ( = ?auto_14149 ?auto_14151 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14143 ?auto_14144 )
      ( MAKE-2CRATE-VERIFY ?auto_14142 ?auto_14143 ?auto_14144 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14155 - SURFACE
      ?auto_14156 - SURFACE
      ?auto_14157 - SURFACE
      ?auto_14158 - SURFACE
    )
    :vars
    (
      ?auto_14159 - HOIST
      ?auto_14161 - PLACE
      ?auto_14165 - PLACE
      ?auto_14163 - HOIST
      ?auto_14166 - SURFACE
      ?auto_14164 - PLACE
      ?auto_14160 - HOIST
      ?auto_14167 - SURFACE
      ?auto_14162 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14159 ?auto_14161 ) ( IS-CRATE ?auto_14158 ) ( not ( = ?auto_14157 ?auto_14158 ) ) ( not ( = ?auto_14156 ?auto_14157 ) ) ( not ( = ?auto_14156 ?auto_14158 ) ) ( not ( = ?auto_14165 ?auto_14161 ) ) ( HOIST-AT ?auto_14163 ?auto_14165 ) ( not ( = ?auto_14159 ?auto_14163 ) ) ( AVAILABLE ?auto_14163 ) ( SURFACE-AT ?auto_14158 ?auto_14165 ) ( ON ?auto_14158 ?auto_14166 ) ( CLEAR ?auto_14158 ) ( not ( = ?auto_14157 ?auto_14166 ) ) ( not ( = ?auto_14158 ?auto_14166 ) ) ( not ( = ?auto_14156 ?auto_14166 ) ) ( IS-CRATE ?auto_14157 ) ( not ( = ?auto_14164 ?auto_14161 ) ) ( not ( = ?auto_14165 ?auto_14164 ) ) ( HOIST-AT ?auto_14160 ?auto_14164 ) ( not ( = ?auto_14159 ?auto_14160 ) ) ( not ( = ?auto_14163 ?auto_14160 ) ) ( AVAILABLE ?auto_14160 ) ( SURFACE-AT ?auto_14157 ?auto_14164 ) ( ON ?auto_14157 ?auto_14167 ) ( CLEAR ?auto_14157 ) ( not ( = ?auto_14157 ?auto_14167 ) ) ( not ( = ?auto_14158 ?auto_14167 ) ) ( not ( = ?auto_14156 ?auto_14167 ) ) ( not ( = ?auto_14166 ?auto_14167 ) ) ( TRUCK-AT ?auto_14162 ?auto_14161 ) ( SURFACE-AT ?auto_14155 ?auto_14161 ) ( CLEAR ?auto_14155 ) ( LIFTING ?auto_14159 ?auto_14156 ) ( IS-CRATE ?auto_14156 ) ( not ( = ?auto_14155 ?auto_14156 ) ) ( not ( = ?auto_14157 ?auto_14155 ) ) ( not ( = ?auto_14158 ?auto_14155 ) ) ( not ( = ?auto_14166 ?auto_14155 ) ) ( not ( = ?auto_14167 ?auto_14155 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14156 ?auto_14157 ?auto_14158 )
      ( MAKE-3CRATE-VERIFY ?auto_14155 ?auto_14156 ?auto_14157 ?auto_14158 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14168 - SURFACE
      ?auto_14169 - SURFACE
    )
    :vars
    (
      ?auto_14171 - HOIST
      ?auto_14173 - PLACE
      ?auto_14177 - SURFACE
      ?auto_14178 - PLACE
      ?auto_14175 - HOIST
      ?auto_14179 - SURFACE
      ?auto_14176 - PLACE
      ?auto_14172 - HOIST
      ?auto_14180 - SURFACE
      ?auto_14174 - TRUCK
      ?auto_14170 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14171 ?auto_14173 ) ( IS-CRATE ?auto_14169 ) ( not ( = ?auto_14168 ?auto_14169 ) ) ( not ( = ?auto_14177 ?auto_14168 ) ) ( not ( = ?auto_14177 ?auto_14169 ) ) ( not ( = ?auto_14178 ?auto_14173 ) ) ( HOIST-AT ?auto_14175 ?auto_14178 ) ( not ( = ?auto_14171 ?auto_14175 ) ) ( AVAILABLE ?auto_14175 ) ( SURFACE-AT ?auto_14169 ?auto_14178 ) ( ON ?auto_14169 ?auto_14179 ) ( CLEAR ?auto_14169 ) ( not ( = ?auto_14168 ?auto_14179 ) ) ( not ( = ?auto_14169 ?auto_14179 ) ) ( not ( = ?auto_14177 ?auto_14179 ) ) ( IS-CRATE ?auto_14168 ) ( not ( = ?auto_14176 ?auto_14173 ) ) ( not ( = ?auto_14178 ?auto_14176 ) ) ( HOIST-AT ?auto_14172 ?auto_14176 ) ( not ( = ?auto_14171 ?auto_14172 ) ) ( not ( = ?auto_14175 ?auto_14172 ) ) ( AVAILABLE ?auto_14172 ) ( SURFACE-AT ?auto_14168 ?auto_14176 ) ( ON ?auto_14168 ?auto_14180 ) ( CLEAR ?auto_14168 ) ( not ( = ?auto_14168 ?auto_14180 ) ) ( not ( = ?auto_14169 ?auto_14180 ) ) ( not ( = ?auto_14177 ?auto_14180 ) ) ( not ( = ?auto_14179 ?auto_14180 ) ) ( TRUCK-AT ?auto_14174 ?auto_14173 ) ( SURFACE-AT ?auto_14170 ?auto_14173 ) ( CLEAR ?auto_14170 ) ( IS-CRATE ?auto_14177 ) ( not ( = ?auto_14170 ?auto_14177 ) ) ( not ( = ?auto_14168 ?auto_14170 ) ) ( not ( = ?auto_14169 ?auto_14170 ) ) ( not ( = ?auto_14179 ?auto_14170 ) ) ( not ( = ?auto_14180 ?auto_14170 ) ) ( AVAILABLE ?auto_14171 ) ( IN ?auto_14177 ?auto_14174 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14171 ?auto_14177 ?auto_14174 ?auto_14173 )
      ( MAKE-2CRATE ?auto_14177 ?auto_14168 ?auto_14169 )
      ( MAKE-1CRATE-VERIFY ?auto_14168 ?auto_14169 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14181 - SURFACE
      ?auto_14182 - SURFACE
      ?auto_14183 - SURFACE
    )
    :vars
    (
      ?auto_14191 - HOIST
      ?auto_14193 - PLACE
      ?auto_14185 - PLACE
      ?auto_14187 - HOIST
      ?auto_14188 - SURFACE
      ?auto_14192 - PLACE
      ?auto_14189 - HOIST
      ?auto_14186 - SURFACE
      ?auto_14190 - TRUCK
      ?auto_14184 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14191 ?auto_14193 ) ( IS-CRATE ?auto_14183 ) ( not ( = ?auto_14182 ?auto_14183 ) ) ( not ( = ?auto_14181 ?auto_14182 ) ) ( not ( = ?auto_14181 ?auto_14183 ) ) ( not ( = ?auto_14185 ?auto_14193 ) ) ( HOIST-AT ?auto_14187 ?auto_14185 ) ( not ( = ?auto_14191 ?auto_14187 ) ) ( AVAILABLE ?auto_14187 ) ( SURFACE-AT ?auto_14183 ?auto_14185 ) ( ON ?auto_14183 ?auto_14188 ) ( CLEAR ?auto_14183 ) ( not ( = ?auto_14182 ?auto_14188 ) ) ( not ( = ?auto_14183 ?auto_14188 ) ) ( not ( = ?auto_14181 ?auto_14188 ) ) ( IS-CRATE ?auto_14182 ) ( not ( = ?auto_14192 ?auto_14193 ) ) ( not ( = ?auto_14185 ?auto_14192 ) ) ( HOIST-AT ?auto_14189 ?auto_14192 ) ( not ( = ?auto_14191 ?auto_14189 ) ) ( not ( = ?auto_14187 ?auto_14189 ) ) ( AVAILABLE ?auto_14189 ) ( SURFACE-AT ?auto_14182 ?auto_14192 ) ( ON ?auto_14182 ?auto_14186 ) ( CLEAR ?auto_14182 ) ( not ( = ?auto_14182 ?auto_14186 ) ) ( not ( = ?auto_14183 ?auto_14186 ) ) ( not ( = ?auto_14181 ?auto_14186 ) ) ( not ( = ?auto_14188 ?auto_14186 ) ) ( TRUCK-AT ?auto_14190 ?auto_14193 ) ( SURFACE-AT ?auto_14184 ?auto_14193 ) ( CLEAR ?auto_14184 ) ( IS-CRATE ?auto_14181 ) ( not ( = ?auto_14184 ?auto_14181 ) ) ( not ( = ?auto_14182 ?auto_14184 ) ) ( not ( = ?auto_14183 ?auto_14184 ) ) ( not ( = ?auto_14188 ?auto_14184 ) ) ( not ( = ?auto_14186 ?auto_14184 ) ) ( AVAILABLE ?auto_14191 ) ( IN ?auto_14181 ?auto_14190 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14182 ?auto_14183 )
      ( MAKE-2CRATE-VERIFY ?auto_14181 ?auto_14182 ?auto_14183 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14194 - SURFACE
      ?auto_14195 - SURFACE
      ?auto_14196 - SURFACE
      ?auto_14197 - SURFACE
    )
    :vars
    (
      ?auto_14205 - HOIST
      ?auto_14206 - PLACE
      ?auto_14198 - PLACE
      ?auto_14203 - HOIST
      ?auto_14200 - SURFACE
      ?auto_14202 - PLACE
      ?auto_14199 - HOIST
      ?auto_14201 - SURFACE
      ?auto_14204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14205 ?auto_14206 ) ( IS-CRATE ?auto_14197 ) ( not ( = ?auto_14196 ?auto_14197 ) ) ( not ( = ?auto_14195 ?auto_14196 ) ) ( not ( = ?auto_14195 ?auto_14197 ) ) ( not ( = ?auto_14198 ?auto_14206 ) ) ( HOIST-AT ?auto_14203 ?auto_14198 ) ( not ( = ?auto_14205 ?auto_14203 ) ) ( AVAILABLE ?auto_14203 ) ( SURFACE-AT ?auto_14197 ?auto_14198 ) ( ON ?auto_14197 ?auto_14200 ) ( CLEAR ?auto_14197 ) ( not ( = ?auto_14196 ?auto_14200 ) ) ( not ( = ?auto_14197 ?auto_14200 ) ) ( not ( = ?auto_14195 ?auto_14200 ) ) ( IS-CRATE ?auto_14196 ) ( not ( = ?auto_14202 ?auto_14206 ) ) ( not ( = ?auto_14198 ?auto_14202 ) ) ( HOIST-AT ?auto_14199 ?auto_14202 ) ( not ( = ?auto_14205 ?auto_14199 ) ) ( not ( = ?auto_14203 ?auto_14199 ) ) ( AVAILABLE ?auto_14199 ) ( SURFACE-AT ?auto_14196 ?auto_14202 ) ( ON ?auto_14196 ?auto_14201 ) ( CLEAR ?auto_14196 ) ( not ( = ?auto_14196 ?auto_14201 ) ) ( not ( = ?auto_14197 ?auto_14201 ) ) ( not ( = ?auto_14195 ?auto_14201 ) ) ( not ( = ?auto_14200 ?auto_14201 ) ) ( TRUCK-AT ?auto_14204 ?auto_14206 ) ( SURFACE-AT ?auto_14194 ?auto_14206 ) ( CLEAR ?auto_14194 ) ( IS-CRATE ?auto_14195 ) ( not ( = ?auto_14194 ?auto_14195 ) ) ( not ( = ?auto_14196 ?auto_14194 ) ) ( not ( = ?auto_14197 ?auto_14194 ) ) ( not ( = ?auto_14200 ?auto_14194 ) ) ( not ( = ?auto_14201 ?auto_14194 ) ) ( AVAILABLE ?auto_14205 ) ( IN ?auto_14195 ?auto_14204 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14195 ?auto_14196 ?auto_14197 )
      ( MAKE-3CRATE-VERIFY ?auto_14194 ?auto_14195 ?auto_14196 ?auto_14197 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14207 - SURFACE
      ?auto_14208 - SURFACE
    )
    :vars
    (
      ?auto_14216 - HOIST
      ?auto_14218 - PLACE
      ?auto_14217 - SURFACE
      ?auto_14209 - PLACE
      ?auto_14214 - HOIST
      ?auto_14211 - SURFACE
      ?auto_14213 - PLACE
      ?auto_14210 - HOIST
      ?auto_14212 - SURFACE
      ?auto_14219 - SURFACE
      ?auto_14215 - TRUCK
      ?auto_14220 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14216 ?auto_14218 ) ( IS-CRATE ?auto_14208 ) ( not ( = ?auto_14207 ?auto_14208 ) ) ( not ( = ?auto_14217 ?auto_14207 ) ) ( not ( = ?auto_14217 ?auto_14208 ) ) ( not ( = ?auto_14209 ?auto_14218 ) ) ( HOIST-AT ?auto_14214 ?auto_14209 ) ( not ( = ?auto_14216 ?auto_14214 ) ) ( AVAILABLE ?auto_14214 ) ( SURFACE-AT ?auto_14208 ?auto_14209 ) ( ON ?auto_14208 ?auto_14211 ) ( CLEAR ?auto_14208 ) ( not ( = ?auto_14207 ?auto_14211 ) ) ( not ( = ?auto_14208 ?auto_14211 ) ) ( not ( = ?auto_14217 ?auto_14211 ) ) ( IS-CRATE ?auto_14207 ) ( not ( = ?auto_14213 ?auto_14218 ) ) ( not ( = ?auto_14209 ?auto_14213 ) ) ( HOIST-AT ?auto_14210 ?auto_14213 ) ( not ( = ?auto_14216 ?auto_14210 ) ) ( not ( = ?auto_14214 ?auto_14210 ) ) ( AVAILABLE ?auto_14210 ) ( SURFACE-AT ?auto_14207 ?auto_14213 ) ( ON ?auto_14207 ?auto_14212 ) ( CLEAR ?auto_14207 ) ( not ( = ?auto_14207 ?auto_14212 ) ) ( not ( = ?auto_14208 ?auto_14212 ) ) ( not ( = ?auto_14217 ?auto_14212 ) ) ( not ( = ?auto_14211 ?auto_14212 ) ) ( SURFACE-AT ?auto_14219 ?auto_14218 ) ( CLEAR ?auto_14219 ) ( IS-CRATE ?auto_14217 ) ( not ( = ?auto_14219 ?auto_14217 ) ) ( not ( = ?auto_14207 ?auto_14219 ) ) ( not ( = ?auto_14208 ?auto_14219 ) ) ( not ( = ?auto_14211 ?auto_14219 ) ) ( not ( = ?auto_14212 ?auto_14219 ) ) ( AVAILABLE ?auto_14216 ) ( IN ?auto_14217 ?auto_14215 ) ( TRUCK-AT ?auto_14215 ?auto_14220 ) ( not ( = ?auto_14220 ?auto_14218 ) ) ( not ( = ?auto_14209 ?auto_14220 ) ) ( not ( = ?auto_14213 ?auto_14220 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14215 ?auto_14220 ?auto_14218 )
      ( MAKE-2CRATE ?auto_14217 ?auto_14207 ?auto_14208 )
      ( MAKE-1CRATE-VERIFY ?auto_14207 ?auto_14208 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14221 - SURFACE
      ?auto_14222 - SURFACE
      ?auto_14223 - SURFACE
    )
    :vars
    (
      ?auto_14224 - HOIST
      ?auto_14230 - PLACE
      ?auto_14226 - PLACE
      ?auto_14229 - HOIST
      ?auto_14232 - SURFACE
      ?auto_14225 - PLACE
      ?auto_14227 - HOIST
      ?auto_14233 - SURFACE
      ?auto_14228 - SURFACE
      ?auto_14231 - TRUCK
      ?auto_14234 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14224 ?auto_14230 ) ( IS-CRATE ?auto_14223 ) ( not ( = ?auto_14222 ?auto_14223 ) ) ( not ( = ?auto_14221 ?auto_14222 ) ) ( not ( = ?auto_14221 ?auto_14223 ) ) ( not ( = ?auto_14226 ?auto_14230 ) ) ( HOIST-AT ?auto_14229 ?auto_14226 ) ( not ( = ?auto_14224 ?auto_14229 ) ) ( AVAILABLE ?auto_14229 ) ( SURFACE-AT ?auto_14223 ?auto_14226 ) ( ON ?auto_14223 ?auto_14232 ) ( CLEAR ?auto_14223 ) ( not ( = ?auto_14222 ?auto_14232 ) ) ( not ( = ?auto_14223 ?auto_14232 ) ) ( not ( = ?auto_14221 ?auto_14232 ) ) ( IS-CRATE ?auto_14222 ) ( not ( = ?auto_14225 ?auto_14230 ) ) ( not ( = ?auto_14226 ?auto_14225 ) ) ( HOIST-AT ?auto_14227 ?auto_14225 ) ( not ( = ?auto_14224 ?auto_14227 ) ) ( not ( = ?auto_14229 ?auto_14227 ) ) ( AVAILABLE ?auto_14227 ) ( SURFACE-AT ?auto_14222 ?auto_14225 ) ( ON ?auto_14222 ?auto_14233 ) ( CLEAR ?auto_14222 ) ( not ( = ?auto_14222 ?auto_14233 ) ) ( not ( = ?auto_14223 ?auto_14233 ) ) ( not ( = ?auto_14221 ?auto_14233 ) ) ( not ( = ?auto_14232 ?auto_14233 ) ) ( SURFACE-AT ?auto_14228 ?auto_14230 ) ( CLEAR ?auto_14228 ) ( IS-CRATE ?auto_14221 ) ( not ( = ?auto_14228 ?auto_14221 ) ) ( not ( = ?auto_14222 ?auto_14228 ) ) ( not ( = ?auto_14223 ?auto_14228 ) ) ( not ( = ?auto_14232 ?auto_14228 ) ) ( not ( = ?auto_14233 ?auto_14228 ) ) ( AVAILABLE ?auto_14224 ) ( IN ?auto_14221 ?auto_14231 ) ( TRUCK-AT ?auto_14231 ?auto_14234 ) ( not ( = ?auto_14234 ?auto_14230 ) ) ( not ( = ?auto_14226 ?auto_14234 ) ) ( not ( = ?auto_14225 ?auto_14234 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14222 ?auto_14223 )
      ( MAKE-2CRATE-VERIFY ?auto_14221 ?auto_14222 ?auto_14223 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14235 - SURFACE
      ?auto_14236 - SURFACE
      ?auto_14237 - SURFACE
      ?auto_14238 - SURFACE
    )
    :vars
    (
      ?auto_14245 - HOIST
      ?auto_14243 - PLACE
      ?auto_14246 - PLACE
      ?auto_14241 - HOIST
      ?auto_14242 - SURFACE
      ?auto_14239 - PLACE
      ?auto_14240 - HOIST
      ?auto_14247 - SURFACE
      ?auto_14248 - TRUCK
      ?auto_14244 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14245 ?auto_14243 ) ( IS-CRATE ?auto_14238 ) ( not ( = ?auto_14237 ?auto_14238 ) ) ( not ( = ?auto_14236 ?auto_14237 ) ) ( not ( = ?auto_14236 ?auto_14238 ) ) ( not ( = ?auto_14246 ?auto_14243 ) ) ( HOIST-AT ?auto_14241 ?auto_14246 ) ( not ( = ?auto_14245 ?auto_14241 ) ) ( AVAILABLE ?auto_14241 ) ( SURFACE-AT ?auto_14238 ?auto_14246 ) ( ON ?auto_14238 ?auto_14242 ) ( CLEAR ?auto_14238 ) ( not ( = ?auto_14237 ?auto_14242 ) ) ( not ( = ?auto_14238 ?auto_14242 ) ) ( not ( = ?auto_14236 ?auto_14242 ) ) ( IS-CRATE ?auto_14237 ) ( not ( = ?auto_14239 ?auto_14243 ) ) ( not ( = ?auto_14246 ?auto_14239 ) ) ( HOIST-AT ?auto_14240 ?auto_14239 ) ( not ( = ?auto_14245 ?auto_14240 ) ) ( not ( = ?auto_14241 ?auto_14240 ) ) ( AVAILABLE ?auto_14240 ) ( SURFACE-AT ?auto_14237 ?auto_14239 ) ( ON ?auto_14237 ?auto_14247 ) ( CLEAR ?auto_14237 ) ( not ( = ?auto_14237 ?auto_14247 ) ) ( not ( = ?auto_14238 ?auto_14247 ) ) ( not ( = ?auto_14236 ?auto_14247 ) ) ( not ( = ?auto_14242 ?auto_14247 ) ) ( SURFACE-AT ?auto_14235 ?auto_14243 ) ( CLEAR ?auto_14235 ) ( IS-CRATE ?auto_14236 ) ( not ( = ?auto_14235 ?auto_14236 ) ) ( not ( = ?auto_14237 ?auto_14235 ) ) ( not ( = ?auto_14238 ?auto_14235 ) ) ( not ( = ?auto_14242 ?auto_14235 ) ) ( not ( = ?auto_14247 ?auto_14235 ) ) ( AVAILABLE ?auto_14245 ) ( IN ?auto_14236 ?auto_14248 ) ( TRUCK-AT ?auto_14248 ?auto_14244 ) ( not ( = ?auto_14244 ?auto_14243 ) ) ( not ( = ?auto_14246 ?auto_14244 ) ) ( not ( = ?auto_14239 ?auto_14244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14236 ?auto_14237 ?auto_14238 )
      ( MAKE-3CRATE-VERIFY ?auto_14235 ?auto_14236 ?auto_14237 ?auto_14238 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14249 - SURFACE
      ?auto_14250 - SURFACE
    )
    :vars
    (
      ?auto_14257 - HOIST
      ?auto_14255 - PLACE
      ?auto_14260 - SURFACE
      ?auto_14258 - PLACE
      ?auto_14253 - HOIST
      ?auto_14254 - SURFACE
      ?auto_14251 - PLACE
      ?auto_14252 - HOIST
      ?auto_14261 - SURFACE
      ?auto_14259 - SURFACE
      ?auto_14262 - TRUCK
      ?auto_14256 - PLACE
      ?auto_14263 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14257 ?auto_14255 ) ( IS-CRATE ?auto_14250 ) ( not ( = ?auto_14249 ?auto_14250 ) ) ( not ( = ?auto_14260 ?auto_14249 ) ) ( not ( = ?auto_14260 ?auto_14250 ) ) ( not ( = ?auto_14258 ?auto_14255 ) ) ( HOIST-AT ?auto_14253 ?auto_14258 ) ( not ( = ?auto_14257 ?auto_14253 ) ) ( AVAILABLE ?auto_14253 ) ( SURFACE-AT ?auto_14250 ?auto_14258 ) ( ON ?auto_14250 ?auto_14254 ) ( CLEAR ?auto_14250 ) ( not ( = ?auto_14249 ?auto_14254 ) ) ( not ( = ?auto_14250 ?auto_14254 ) ) ( not ( = ?auto_14260 ?auto_14254 ) ) ( IS-CRATE ?auto_14249 ) ( not ( = ?auto_14251 ?auto_14255 ) ) ( not ( = ?auto_14258 ?auto_14251 ) ) ( HOIST-AT ?auto_14252 ?auto_14251 ) ( not ( = ?auto_14257 ?auto_14252 ) ) ( not ( = ?auto_14253 ?auto_14252 ) ) ( AVAILABLE ?auto_14252 ) ( SURFACE-AT ?auto_14249 ?auto_14251 ) ( ON ?auto_14249 ?auto_14261 ) ( CLEAR ?auto_14249 ) ( not ( = ?auto_14249 ?auto_14261 ) ) ( not ( = ?auto_14250 ?auto_14261 ) ) ( not ( = ?auto_14260 ?auto_14261 ) ) ( not ( = ?auto_14254 ?auto_14261 ) ) ( SURFACE-AT ?auto_14259 ?auto_14255 ) ( CLEAR ?auto_14259 ) ( IS-CRATE ?auto_14260 ) ( not ( = ?auto_14259 ?auto_14260 ) ) ( not ( = ?auto_14249 ?auto_14259 ) ) ( not ( = ?auto_14250 ?auto_14259 ) ) ( not ( = ?auto_14254 ?auto_14259 ) ) ( not ( = ?auto_14261 ?auto_14259 ) ) ( AVAILABLE ?auto_14257 ) ( TRUCK-AT ?auto_14262 ?auto_14256 ) ( not ( = ?auto_14256 ?auto_14255 ) ) ( not ( = ?auto_14258 ?auto_14256 ) ) ( not ( = ?auto_14251 ?auto_14256 ) ) ( HOIST-AT ?auto_14263 ?auto_14256 ) ( LIFTING ?auto_14263 ?auto_14260 ) ( not ( = ?auto_14257 ?auto_14263 ) ) ( not ( = ?auto_14253 ?auto_14263 ) ) ( not ( = ?auto_14252 ?auto_14263 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14263 ?auto_14260 ?auto_14262 ?auto_14256 )
      ( MAKE-2CRATE ?auto_14260 ?auto_14249 ?auto_14250 )
      ( MAKE-1CRATE-VERIFY ?auto_14249 ?auto_14250 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14264 - SURFACE
      ?auto_14265 - SURFACE
      ?auto_14266 - SURFACE
    )
    :vars
    (
      ?auto_14276 - HOIST
      ?auto_14275 - PLACE
      ?auto_14269 - PLACE
      ?auto_14267 - HOIST
      ?auto_14272 - SURFACE
      ?auto_14278 - PLACE
      ?auto_14270 - HOIST
      ?auto_14271 - SURFACE
      ?auto_14274 - SURFACE
      ?auto_14277 - TRUCK
      ?auto_14273 - PLACE
      ?auto_14268 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14276 ?auto_14275 ) ( IS-CRATE ?auto_14266 ) ( not ( = ?auto_14265 ?auto_14266 ) ) ( not ( = ?auto_14264 ?auto_14265 ) ) ( not ( = ?auto_14264 ?auto_14266 ) ) ( not ( = ?auto_14269 ?auto_14275 ) ) ( HOIST-AT ?auto_14267 ?auto_14269 ) ( not ( = ?auto_14276 ?auto_14267 ) ) ( AVAILABLE ?auto_14267 ) ( SURFACE-AT ?auto_14266 ?auto_14269 ) ( ON ?auto_14266 ?auto_14272 ) ( CLEAR ?auto_14266 ) ( not ( = ?auto_14265 ?auto_14272 ) ) ( not ( = ?auto_14266 ?auto_14272 ) ) ( not ( = ?auto_14264 ?auto_14272 ) ) ( IS-CRATE ?auto_14265 ) ( not ( = ?auto_14278 ?auto_14275 ) ) ( not ( = ?auto_14269 ?auto_14278 ) ) ( HOIST-AT ?auto_14270 ?auto_14278 ) ( not ( = ?auto_14276 ?auto_14270 ) ) ( not ( = ?auto_14267 ?auto_14270 ) ) ( AVAILABLE ?auto_14270 ) ( SURFACE-AT ?auto_14265 ?auto_14278 ) ( ON ?auto_14265 ?auto_14271 ) ( CLEAR ?auto_14265 ) ( not ( = ?auto_14265 ?auto_14271 ) ) ( not ( = ?auto_14266 ?auto_14271 ) ) ( not ( = ?auto_14264 ?auto_14271 ) ) ( not ( = ?auto_14272 ?auto_14271 ) ) ( SURFACE-AT ?auto_14274 ?auto_14275 ) ( CLEAR ?auto_14274 ) ( IS-CRATE ?auto_14264 ) ( not ( = ?auto_14274 ?auto_14264 ) ) ( not ( = ?auto_14265 ?auto_14274 ) ) ( not ( = ?auto_14266 ?auto_14274 ) ) ( not ( = ?auto_14272 ?auto_14274 ) ) ( not ( = ?auto_14271 ?auto_14274 ) ) ( AVAILABLE ?auto_14276 ) ( TRUCK-AT ?auto_14277 ?auto_14273 ) ( not ( = ?auto_14273 ?auto_14275 ) ) ( not ( = ?auto_14269 ?auto_14273 ) ) ( not ( = ?auto_14278 ?auto_14273 ) ) ( HOIST-AT ?auto_14268 ?auto_14273 ) ( LIFTING ?auto_14268 ?auto_14264 ) ( not ( = ?auto_14276 ?auto_14268 ) ) ( not ( = ?auto_14267 ?auto_14268 ) ) ( not ( = ?auto_14270 ?auto_14268 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14265 ?auto_14266 )
      ( MAKE-2CRATE-VERIFY ?auto_14264 ?auto_14265 ?auto_14266 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14279 - SURFACE
      ?auto_14280 - SURFACE
      ?auto_14281 - SURFACE
      ?auto_14282 - SURFACE
    )
    :vars
    (
      ?auto_14285 - HOIST
      ?auto_14287 - PLACE
      ?auto_14286 - PLACE
      ?auto_14292 - HOIST
      ?auto_14288 - SURFACE
      ?auto_14289 - PLACE
      ?auto_14291 - HOIST
      ?auto_14290 - SURFACE
      ?auto_14284 - TRUCK
      ?auto_14283 - PLACE
      ?auto_14293 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14285 ?auto_14287 ) ( IS-CRATE ?auto_14282 ) ( not ( = ?auto_14281 ?auto_14282 ) ) ( not ( = ?auto_14280 ?auto_14281 ) ) ( not ( = ?auto_14280 ?auto_14282 ) ) ( not ( = ?auto_14286 ?auto_14287 ) ) ( HOIST-AT ?auto_14292 ?auto_14286 ) ( not ( = ?auto_14285 ?auto_14292 ) ) ( AVAILABLE ?auto_14292 ) ( SURFACE-AT ?auto_14282 ?auto_14286 ) ( ON ?auto_14282 ?auto_14288 ) ( CLEAR ?auto_14282 ) ( not ( = ?auto_14281 ?auto_14288 ) ) ( not ( = ?auto_14282 ?auto_14288 ) ) ( not ( = ?auto_14280 ?auto_14288 ) ) ( IS-CRATE ?auto_14281 ) ( not ( = ?auto_14289 ?auto_14287 ) ) ( not ( = ?auto_14286 ?auto_14289 ) ) ( HOIST-AT ?auto_14291 ?auto_14289 ) ( not ( = ?auto_14285 ?auto_14291 ) ) ( not ( = ?auto_14292 ?auto_14291 ) ) ( AVAILABLE ?auto_14291 ) ( SURFACE-AT ?auto_14281 ?auto_14289 ) ( ON ?auto_14281 ?auto_14290 ) ( CLEAR ?auto_14281 ) ( not ( = ?auto_14281 ?auto_14290 ) ) ( not ( = ?auto_14282 ?auto_14290 ) ) ( not ( = ?auto_14280 ?auto_14290 ) ) ( not ( = ?auto_14288 ?auto_14290 ) ) ( SURFACE-AT ?auto_14279 ?auto_14287 ) ( CLEAR ?auto_14279 ) ( IS-CRATE ?auto_14280 ) ( not ( = ?auto_14279 ?auto_14280 ) ) ( not ( = ?auto_14281 ?auto_14279 ) ) ( not ( = ?auto_14282 ?auto_14279 ) ) ( not ( = ?auto_14288 ?auto_14279 ) ) ( not ( = ?auto_14290 ?auto_14279 ) ) ( AVAILABLE ?auto_14285 ) ( TRUCK-AT ?auto_14284 ?auto_14283 ) ( not ( = ?auto_14283 ?auto_14287 ) ) ( not ( = ?auto_14286 ?auto_14283 ) ) ( not ( = ?auto_14289 ?auto_14283 ) ) ( HOIST-AT ?auto_14293 ?auto_14283 ) ( LIFTING ?auto_14293 ?auto_14280 ) ( not ( = ?auto_14285 ?auto_14293 ) ) ( not ( = ?auto_14292 ?auto_14293 ) ) ( not ( = ?auto_14291 ?auto_14293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14280 ?auto_14281 ?auto_14282 )
      ( MAKE-3CRATE-VERIFY ?auto_14279 ?auto_14280 ?auto_14281 ?auto_14282 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14294 - SURFACE
      ?auto_14295 - SURFACE
    )
    :vars
    (
      ?auto_14299 - HOIST
      ?auto_14302 - PLACE
      ?auto_14296 - SURFACE
      ?auto_14301 - PLACE
      ?auto_14307 - HOIST
      ?auto_14303 - SURFACE
      ?auto_14304 - PLACE
      ?auto_14306 - HOIST
      ?auto_14305 - SURFACE
      ?auto_14300 - SURFACE
      ?auto_14298 - TRUCK
      ?auto_14297 - PLACE
      ?auto_14308 - HOIST
      ?auto_14309 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14299 ?auto_14302 ) ( IS-CRATE ?auto_14295 ) ( not ( = ?auto_14294 ?auto_14295 ) ) ( not ( = ?auto_14296 ?auto_14294 ) ) ( not ( = ?auto_14296 ?auto_14295 ) ) ( not ( = ?auto_14301 ?auto_14302 ) ) ( HOIST-AT ?auto_14307 ?auto_14301 ) ( not ( = ?auto_14299 ?auto_14307 ) ) ( AVAILABLE ?auto_14307 ) ( SURFACE-AT ?auto_14295 ?auto_14301 ) ( ON ?auto_14295 ?auto_14303 ) ( CLEAR ?auto_14295 ) ( not ( = ?auto_14294 ?auto_14303 ) ) ( not ( = ?auto_14295 ?auto_14303 ) ) ( not ( = ?auto_14296 ?auto_14303 ) ) ( IS-CRATE ?auto_14294 ) ( not ( = ?auto_14304 ?auto_14302 ) ) ( not ( = ?auto_14301 ?auto_14304 ) ) ( HOIST-AT ?auto_14306 ?auto_14304 ) ( not ( = ?auto_14299 ?auto_14306 ) ) ( not ( = ?auto_14307 ?auto_14306 ) ) ( AVAILABLE ?auto_14306 ) ( SURFACE-AT ?auto_14294 ?auto_14304 ) ( ON ?auto_14294 ?auto_14305 ) ( CLEAR ?auto_14294 ) ( not ( = ?auto_14294 ?auto_14305 ) ) ( not ( = ?auto_14295 ?auto_14305 ) ) ( not ( = ?auto_14296 ?auto_14305 ) ) ( not ( = ?auto_14303 ?auto_14305 ) ) ( SURFACE-AT ?auto_14300 ?auto_14302 ) ( CLEAR ?auto_14300 ) ( IS-CRATE ?auto_14296 ) ( not ( = ?auto_14300 ?auto_14296 ) ) ( not ( = ?auto_14294 ?auto_14300 ) ) ( not ( = ?auto_14295 ?auto_14300 ) ) ( not ( = ?auto_14303 ?auto_14300 ) ) ( not ( = ?auto_14305 ?auto_14300 ) ) ( AVAILABLE ?auto_14299 ) ( TRUCK-AT ?auto_14298 ?auto_14297 ) ( not ( = ?auto_14297 ?auto_14302 ) ) ( not ( = ?auto_14301 ?auto_14297 ) ) ( not ( = ?auto_14304 ?auto_14297 ) ) ( HOIST-AT ?auto_14308 ?auto_14297 ) ( not ( = ?auto_14299 ?auto_14308 ) ) ( not ( = ?auto_14307 ?auto_14308 ) ) ( not ( = ?auto_14306 ?auto_14308 ) ) ( AVAILABLE ?auto_14308 ) ( SURFACE-AT ?auto_14296 ?auto_14297 ) ( ON ?auto_14296 ?auto_14309 ) ( CLEAR ?auto_14296 ) ( not ( = ?auto_14294 ?auto_14309 ) ) ( not ( = ?auto_14295 ?auto_14309 ) ) ( not ( = ?auto_14296 ?auto_14309 ) ) ( not ( = ?auto_14303 ?auto_14309 ) ) ( not ( = ?auto_14305 ?auto_14309 ) ) ( not ( = ?auto_14300 ?auto_14309 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14308 ?auto_14296 ?auto_14309 ?auto_14297 )
      ( MAKE-2CRATE ?auto_14296 ?auto_14294 ?auto_14295 )
      ( MAKE-1CRATE-VERIFY ?auto_14294 ?auto_14295 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14310 - SURFACE
      ?auto_14311 - SURFACE
      ?auto_14312 - SURFACE
    )
    :vars
    (
      ?auto_14325 - HOIST
      ?auto_14321 - PLACE
      ?auto_14322 - PLACE
      ?auto_14323 - HOIST
      ?auto_14320 - SURFACE
      ?auto_14317 - PLACE
      ?auto_14314 - HOIST
      ?auto_14315 - SURFACE
      ?auto_14318 - SURFACE
      ?auto_14319 - TRUCK
      ?auto_14316 - PLACE
      ?auto_14313 - HOIST
      ?auto_14324 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14325 ?auto_14321 ) ( IS-CRATE ?auto_14312 ) ( not ( = ?auto_14311 ?auto_14312 ) ) ( not ( = ?auto_14310 ?auto_14311 ) ) ( not ( = ?auto_14310 ?auto_14312 ) ) ( not ( = ?auto_14322 ?auto_14321 ) ) ( HOIST-AT ?auto_14323 ?auto_14322 ) ( not ( = ?auto_14325 ?auto_14323 ) ) ( AVAILABLE ?auto_14323 ) ( SURFACE-AT ?auto_14312 ?auto_14322 ) ( ON ?auto_14312 ?auto_14320 ) ( CLEAR ?auto_14312 ) ( not ( = ?auto_14311 ?auto_14320 ) ) ( not ( = ?auto_14312 ?auto_14320 ) ) ( not ( = ?auto_14310 ?auto_14320 ) ) ( IS-CRATE ?auto_14311 ) ( not ( = ?auto_14317 ?auto_14321 ) ) ( not ( = ?auto_14322 ?auto_14317 ) ) ( HOIST-AT ?auto_14314 ?auto_14317 ) ( not ( = ?auto_14325 ?auto_14314 ) ) ( not ( = ?auto_14323 ?auto_14314 ) ) ( AVAILABLE ?auto_14314 ) ( SURFACE-AT ?auto_14311 ?auto_14317 ) ( ON ?auto_14311 ?auto_14315 ) ( CLEAR ?auto_14311 ) ( not ( = ?auto_14311 ?auto_14315 ) ) ( not ( = ?auto_14312 ?auto_14315 ) ) ( not ( = ?auto_14310 ?auto_14315 ) ) ( not ( = ?auto_14320 ?auto_14315 ) ) ( SURFACE-AT ?auto_14318 ?auto_14321 ) ( CLEAR ?auto_14318 ) ( IS-CRATE ?auto_14310 ) ( not ( = ?auto_14318 ?auto_14310 ) ) ( not ( = ?auto_14311 ?auto_14318 ) ) ( not ( = ?auto_14312 ?auto_14318 ) ) ( not ( = ?auto_14320 ?auto_14318 ) ) ( not ( = ?auto_14315 ?auto_14318 ) ) ( AVAILABLE ?auto_14325 ) ( TRUCK-AT ?auto_14319 ?auto_14316 ) ( not ( = ?auto_14316 ?auto_14321 ) ) ( not ( = ?auto_14322 ?auto_14316 ) ) ( not ( = ?auto_14317 ?auto_14316 ) ) ( HOIST-AT ?auto_14313 ?auto_14316 ) ( not ( = ?auto_14325 ?auto_14313 ) ) ( not ( = ?auto_14323 ?auto_14313 ) ) ( not ( = ?auto_14314 ?auto_14313 ) ) ( AVAILABLE ?auto_14313 ) ( SURFACE-AT ?auto_14310 ?auto_14316 ) ( ON ?auto_14310 ?auto_14324 ) ( CLEAR ?auto_14310 ) ( not ( = ?auto_14311 ?auto_14324 ) ) ( not ( = ?auto_14312 ?auto_14324 ) ) ( not ( = ?auto_14310 ?auto_14324 ) ) ( not ( = ?auto_14320 ?auto_14324 ) ) ( not ( = ?auto_14315 ?auto_14324 ) ) ( not ( = ?auto_14318 ?auto_14324 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14311 ?auto_14312 )
      ( MAKE-2CRATE-VERIFY ?auto_14310 ?auto_14311 ?auto_14312 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14326 - SURFACE
      ?auto_14327 - SURFACE
      ?auto_14328 - SURFACE
      ?auto_14329 - SURFACE
    )
    :vars
    (
      ?auto_14341 - HOIST
      ?auto_14331 - PLACE
      ?auto_14338 - PLACE
      ?auto_14334 - HOIST
      ?auto_14333 - SURFACE
      ?auto_14340 - PLACE
      ?auto_14335 - HOIST
      ?auto_14332 - SURFACE
      ?auto_14339 - TRUCK
      ?auto_14337 - PLACE
      ?auto_14336 - HOIST
      ?auto_14330 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14341 ?auto_14331 ) ( IS-CRATE ?auto_14329 ) ( not ( = ?auto_14328 ?auto_14329 ) ) ( not ( = ?auto_14327 ?auto_14328 ) ) ( not ( = ?auto_14327 ?auto_14329 ) ) ( not ( = ?auto_14338 ?auto_14331 ) ) ( HOIST-AT ?auto_14334 ?auto_14338 ) ( not ( = ?auto_14341 ?auto_14334 ) ) ( AVAILABLE ?auto_14334 ) ( SURFACE-AT ?auto_14329 ?auto_14338 ) ( ON ?auto_14329 ?auto_14333 ) ( CLEAR ?auto_14329 ) ( not ( = ?auto_14328 ?auto_14333 ) ) ( not ( = ?auto_14329 ?auto_14333 ) ) ( not ( = ?auto_14327 ?auto_14333 ) ) ( IS-CRATE ?auto_14328 ) ( not ( = ?auto_14340 ?auto_14331 ) ) ( not ( = ?auto_14338 ?auto_14340 ) ) ( HOIST-AT ?auto_14335 ?auto_14340 ) ( not ( = ?auto_14341 ?auto_14335 ) ) ( not ( = ?auto_14334 ?auto_14335 ) ) ( AVAILABLE ?auto_14335 ) ( SURFACE-AT ?auto_14328 ?auto_14340 ) ( ON ?auto_14328 ?auto_14332 ) ( CLEAR ?auto_14328 ) ( not ( = ?auto_14328 ?auto_14332 ) ) ( not ( = ?auto_14329 ?auto_14332 ) ) ( not ( = ?auto_14327 ?auto_14332 ) ) ( not ( = ?auto_14333 ?auto_14332 ) ) ( SURFACE-AT ?auto_14326 ?auto_14331 ) ( CLEAR ?auto_14326 ) ( IS-CRATE ?auto_14327 ) ( not ( = ?auto_14326 ?auto_14327 ) ) ( not ( = ?auto_14328 ?auto_14326 ) ) ( not ( = ?auto_14329 ?auto_14326 ) ) ( not ( = ?auto_14333 ?auto_14326 ) ) ( not ( = ?auto_14332 ?auto_14326 ) ) ( AVAILABLE ?auto_14341 ) ( TRUCK-AT ?auto_14339 ?auto_14337 ) ( not ( = ?auto_14337 ?auto_14331 ) ) ( not ( = ?auto_14338 ?auto_14337 ) ) ( not ( = ?auto_14340 ?auto_14337 ) ) ( HOIST-AT ?auto_14336 ?auto_14337 ) ( not ( = ?auto_14341 ?auto_14336 ) ) ( not ( = ?auto_14334 ?auto_14336 ) ) ( not ( = ?auto_14335 ?auto_14336 ) ) ( AVAILABLE ?auto_14336 ) ( SURFACE-AT ?auto_14327 ?auto_14337 ) ( ON ?auto_14327 ?auto_14330 ) ( CLEAR ?auto_14327 ) ( not ( = ?auto_14328 ?auto_14330 ) ) ( not ( = ?auto_14329 ?auto_14330 ) ) ( not ( = ?auto_14327 ?auto_14330 ) ) ( not ( = ?auto_14333 ?auto_14330 ) ) ( not ( = ?auto_14332 ?auto_14330 ) ) ( not ( = ?auto_14326 ?auto_14330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14327 ?auto_14328 ?auto_14329 )
      ( MAKE-3CRATE-VERIFY ?auto_14326 ?auto_14327 ?auto_14328 ?auto_14329 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14342 - SURFACE
      ?auto_14343 - SURFACE
    )
    :vars
    (
      ?auto_14357 - HOIST
      ?auto_14346 - PLACE
      ?auto_14347 - SURFACE
      ?auto_14354 - PLACE
      ?auto_14350 - HOIST
      ?auto_14349 - SURFACE
      ?auto_14356 - PLACE
      ?auto_14351 - HOIST
      ?auto_14348 - SURFACE
      ?auto_14345 - SURFACE
      ?auto_14353 - PLACE
      ?auto_14352 - HOIST
      ?auto_14344 - SURFACE
      ?auto_14355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14357 ?auto_14346 ) ( IS-CRATE ?auto_14343 ) ( not ( = ?auto_14342 ?auto_14343 ) ) ( not ( = ?auto_14347 ?auto_14342 ) ) ( not ( = ?auto_14347 ?auto_14343 ) ) ( not ( = ?auto_14354 ?auto_14346 ) ) ( HOIST-AT ?auto_14350 ?auto_14354 ) ( not ( = ?auto_14357 ?auto_14350 ) ) ( AVAILABLE ?auto_14350 ) ( SURFACE-AT ?auto_14343 ?auto_14354 ) ( ON ?auto_14343 ?auto_14349 ) ( CLEAR ?auto_14343 ) ( not ( = ?auto_14342 ?auto_14349 ) ) ( not ( = ?auto_14343 ?auto_14349 ) ) ( not ( = ?auto_14347 ?auto_14349 ) ) ( IS-CRATE ?auto_14342 ) ( not ( = ?auto_14356 ?auto_14346 ) ) ( not ( = ?auto_14354 ?auto_14356 ) ) ( HOIST-AT ?auto_14351 ?auto_14356 ) ( not ( = ?auto_14357 ?auto_14351 ) ) ( not ( = ?auto_14350 ?auto_14351 ) ) ( AVAILABLE ?auto_14351 ) ( SURFACE-AT ?auto_14342 ?auto_14356 ) ( ON ?auto_14342 ?auto_14348 ) ( CLEAR ?auto_14342 ) ( not ( = ?auto_14342 ?auto_14348 ) ) ( not ( = ?auto_14343 ?auto_14348 ) ) ( not ( = ?auto_14347 ?auto_14348 ) ) ( not ( = ?auto_14349 ?auto_14348 ) ) ( SURFACE-AT ?auto_14345 ?auto_14346 ) ( CLEAR ?auto_14345 ) ( IS-CRATE ?auto_14347 ) ( not ( = ?auto_14345 ?auto_14347 ) ) ( not ( = ?auto_14342 ?auto_14345 ) ) ( not ( = ?auto_14343 ?auto_14345 ) ) ( not ( = ?auto_14349 ?auto_14345 ) ) ( not ( = ?auto_14348 ?auto_14345 ) ) ( AVAILABLE ?auto_14357 ) ( not ( = ?auto_14353 ?auto_14346 ) ) ( not ( = ?auto_14354 ?auto_14353 ) ) ( not ( = ?auto_14356 ?auto_14353 ) ) ( HOIST-AT ?auto_14352 ?auto_14353 ) ( not ( = ?auto_14357 ?auto_14352 ) ) ( not ( = ?auto_14350 ?auto_14352 ) ) ( not ( = ?auto_14351 ?auto_14352 ) ) ( AVAILABLE ?auto_14352 ) ( SURFACE-AT ?auto_14347 ?auto_14353 ) ( ON ?auto_14347 ?auto_14344 ) ( CLEAR ?auto_14347 ) ( not ( = ?auto_14342 ?auto_14344 ) ) ( not ( = ?auto_14343 ?auto_14344 ) ) ( not ( = ?auto_14347 ?auto_14344 ) ) ( not ( = ?auto_14349 ?auto_14344 ) ) ( not ( = ?auto_14348 ?auto_14344 ) ) ( not ( = ?auto_14345 ?auto_14344 ) ) ( TRUCK-AT ?auto_14355 ?auto_14346 ) )
    :subtasks
    ( ( !DRIVE ?auto_14355 ?auto_14346 ?auto_14353 )
      ( MAKE-2CRATE ?auto_14347 ?auto_14342 ?auto_14343 )
      ( MAKE-1CRATE-VERIFY ?auto_14342 ?auto_14343 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14358 - SURFACE
      ?auto_14359 - SURFACE
      ?auto_14360 - SURFACE
    )
    :vars
    (
      ?auto_14371 - HOIST
      ?auto_14368 - PLACE
      ?auto_14370 - PLACE
      ?auto_14372 - HOIST
      ?auto_14364 - SURFACE
      ?auto_14362 - PLACE
      ?auto_14369 - HOIST
      ?auto_14361 - SURFACE
      ?auto_14373 - SURFACE
      ?auto_14365 - PLACE
      ?auto_14367 - HOIST
      ?auto_14363 - SURFACE
      ?auto_14366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14371 ?auto_14368 ) ( IS-CRATE ?auto_14360 ) ( not ( = ?auto_14359 ?auto_14360 ) ) ( not ( = ?auto_14358 ?auto_14359 ) ) ( not ( = ?auto_14358 ?auto_14360 ) ) ( not ( = ?auto_14370 ?auto_14368 ) ) ( HOIST-AT ?auto_14372 ?auto_14370 ) ( not ( = ?auto_14371 ?auto_14372 ) ) ( AVAILABLE ?auto_14372 ) ( SURFACE-AT ?auto_14360 ?auto_14370 ) ( ON ?auto_14360 ?auto_14364 ) ( CLEAR ?auto_14360 ) ( not ( = ?auto_14359 ?auto_14364 ) ) ( not ( = ?auto_14360 ?auto_14364 ) ) ( not ( = ?auto_14358 ?auto_14364 ) ) ( IS-CRATE ?auto_14359 ) ( not ( = ?auto_14362 ?auto_14368 ) ) ( not ( = ?auto_14370 ?auto_14362 ) ) ( HOIST-AT ?auto_14369 ?auto_14362 ) ( not ( = ?auto_14371 ?auto_14369 ) ) ( not ( = ?auto_14372 ?auto_14369 ) ) ( AVAILABLE ?auto_14369 ) ( SURFACE-AT ?auto_14359 ?auto_14362 ) ( ON ?auto_14359 ?auto_14361 ) ( CLEAR ?auto_14359 ) ( not ( = ?auto_14359 ?auto_14361 ) ) ( not ( = ?auto_14360 ?auto_14361 ) ) ( not ( = ?auto_14358 ?auto_14361 ) ) ( not ( = ?auto_14364 ?auto_14361 ) ) ( SURFACE-AT ?auto_14373 ?auto_14368 ) ( CLEAR ?auto_14373 ) ( IS-CRATE ?auto_14358 ) ( not ( = ?auto_14373 ?auto_14358 ) ) ( not ( = ?auto_14359 ?auto_14373 ) ) ( not ( = ?auto_14360 ?auto_14373 ) ) ( not ( = ?auto_14364 ?auto_14373 ) ) ( not ( = ?auto_14361 ?auto_14373 ) ) ( AVAILABLE ?auto_14371 ) ( not ( = ?auto_14365 ?auto_14368 ) ) ( not ( = ?auto_14370 ?auto_14365 ) ) ( not ( = ?auto_14362 ?auto_14365 ) ) ( HOIST-AT ?auto_14367 ?auto_14365 ) ( not ( = ?auto_14371 ?auto_14367 ) ) ( not ( = ?auto_14372 ?auto_14367 ) ) ( not ( = ?auto_14369 ?auto_14367 ) ) ( AVAILABLE ?auto_14367 ) ( SURFACE-AT ?auto_14358 ?auto_14365 ) ( ON ?auto_14358 ?auto_14363 ) ( CLEAR ?auto_14358 ) ( not ( = ?auto_14359 ?auto_14363 ) ) ( not ( = ?auto_14360 ?auto_14363 ) ) ( not ( = ?auto_14358 ?auto_14363 ) ) ( not ( = ?auto_14364 ?auto_14363 ) ) ( not ( = ?auto_14361 ?auto_14363 ) ) ( not ( = ?auto_14373 ?auto_14363 ) ) ( TRUCK-AT ?auto_14366 ?auto_14368 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14359 ?auto_14360 )
      ( MAKE-2CRATE-VERIFY ?auto_14358 ?auto_14359 ?auto_14360 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14374 - SURFACE
      ?auto_14375 - SURFACE
      ?auto_14376 - SURFACE
      ?auto_14377 - SURFACE
    )
    :vars
    (
      ?auto_14389 - HOIST
      ?auto_14380 - PLACE
      ?auto_14387 - PLACE
      ?auto_14388 - HOIST
      ?auto_14385 - SURFACE
      ?auto_14383 - PLACE
      ?auto_14379 - HOIST
      ?auto_14384 - SURFACE
      ?auto_14381 - PLACE
      ?auto_14382 - HOIST
      ?auto_14378 - SURFACE
      ?auto_14386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14389 ?auto_14380 ) ( IS-CRATE ?auto_14377 ) ( not ( = ?auto_14376 ?auto_14377 ) ) ( not ( = ?auto_14375 ?auto_14376 ) ) ( not ( = ?auto_14375 ?auto_14377 ) ) ( not ( = ?auto_14387 ?auto_14380 ) ) ( HOIST-AT ?auto_14388 ?auto_14387 ) ( not ( = ?auto_14389 ?auto_14388 ) ) ( AVAILABLE ?auto_14388 ) ( SURFACE-AT ?auto_14377 ?auto_14387 ) ( ON ?auto_14377 ?auto_14385 ) ( CLEAR ?auto_14377 ) ( not ( = ?auto_14376 ?auto_14385 ) ) ( not ( = ?auto_14377 ?auto_14385 ) ) ( not ( = ?auto_14375 ?auto_14385 ) ) ( IS-CRATE ?auto_14376 ) ( not ( = ?auto_14383 ?auto_14380 ) ) ( not ( = ?auto_14387 ?auto_14383 ) ) ( HOIST-AT ?auto_14379 ?auto_14383 ) ( not ( = ?auto_14389 ?auto_14379 ) ) ( not ( = ?auto_14388 ?auto_14379 ) ) ( AVAILABLE ?auto_14379 ) ( SURFACE-AT ?auto_14376 ?auto_14383 ) ( ON ?auto_14376 ?auto_14384 ) ( CLEAR ?auto_14376 ) ( not ( = ?auto_14376 ?auto_14384 ) ) ( not ( = ?auto_14377 ?auto_14384 ) ) ( not ( = ?auto_14375 ?auto_14384 ) ) ( not ( = ?auto_14385 ?auto_14384 ) ) ( SURFACE-AT ?auto_14374 ?auto_14380 ) ( CLEAR ?auto_14374 ) ( IS-CRATE ?auto_14375 ) ( not ( = ?auto_14374 ?auto_14375 ) ) ( not ( = ?auto_14376 ?auto_14374 ) ) ( not ( = ?auto_14377 ?auto_14374 ) ) ( not ( = ?auto_14385 ?auto_14374 ) ) ( not ( = ?auto_14384 ?auto_14374 ) ) ( AVAILABLE ?auto_14389 ) ( not ( = ?auto_14381 ?auto_14380 ) ) ( not ( = ?auto_14387 ?auto_14381 ) ) ( not ( = ?auto_14383 ?auto_14381 ) ) ( HOIST-AT ?auto_14382 ?auto_14381 ) ( not ( = ?auto_14389 ?auto_14382 ) ) ( not ( = ?auto_14388 ?auto_14382 ) ) ( not ( = ?auto_14379 ?auto_14382 ) ) ( AVAILABLE ?auto_14382 ) ( SURFACE-AT ?auto_14375 ?auto_14381 ) ( ON ?auto_14375 ?auto_14378 ) ( CLEAR ?auto_14375 ) ( not ( = ?auto_14376 ?auto_14378 ) ) ( not ( = ?auto_14377 ?auto_14378 ) ) ( not ( = ?auto_14375 ?auto_14378 ) ) ( not ( = ?auto_14385 ?auto_14378 ) ) ( not ( = ?auto_14384 ?auto_14378 ) ) ( not ( = ?auto_14374 ?auto_14378 ) ) ( TRUCK-AT ?auto_14386 ?auto_14380 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14375 ?auto_14376 ?auto_14377 )
      ( MAKE-3CRATE-VERIFY ?auto_14374 ?auto_14375 ?auto_14376 ?auto_14377 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14404 - SURFACE
      ?auto_14405 - SURFACE
    )
    :vars
    (
      ?auto_14406 - HOIST
      ?auto_14407 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14406 ?auto_14407 ) ( SURFACE-AT ?auto_14404 ?auto_14407 ) ( CLEAR ?auto_14404 ) ( LIFTING ?auto_14406 ?auto_14405 ) ( IS-CRATE ?auto_14405 ) ( not ( = ?auto_14404 ?auto_14405 ) ) )
    :subtasks
    ( ( !DROP ?auto_14406 ?auto_14405 ?auto_14404 ?auto_14407 )
      ( MAKE-1CRATE-VERIFY ?auto_14404 ?auto_14405 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14408 - SURFACE
      ?auto_14409 - SURFACE
      ?auto_14410 - SURFACE
    )
    :vars
    (
      ?auto_14411 - HOIST
      ?auto_14412 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14411 ?auto_14412 ) ( SURFACE-AT ?auto_14409 ?auto_14412 ) ( CLEAR ?auto_14409 ) ( LIFTING ?auto_14411 ?auto_14410 ) ( IS-CRATE ?auto_14410 ) ( not ( = ?auto_14409 ?auto_14410 ) ) ( ON ?auto_14409 ?auto_14408 ) ( not ( = ?auto_14408 ?auto_14409 ) ) ( not ( = ?auto_14408 ?auto_14410 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14409 ?auto_14410 )
      ( MAKE-2CRATE-VERIFY ?auto_14408 ?auto_14409 ?auto_14410 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14413 - SURFACE
      ?auto_14414 - SURFACE
      ?auto_14415 - SURFACE
      ?auto_14416 - SURFACE
    )
    :vars
    (
      ?auto_14417 - HOIST
      ?auto_14418 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14417 ?auto_14418 ) ( SURFACE-AT ?auto_14415 ?auto_14418 ) ( CLEAR ?auto_14415 ) ( LIFTING ?auto_14417 ?auto_14416 ) ( IS-CRATE ?auto_14416 ) ( not ( = ?auto_14415 ?auto_14416 ) ) ( ON ?auto_14414 ?auto_14413 ) ( ON ?auto_14415 ?auto_14414 ) ( not ( = ?auto_14413 ?auto_14414 ) ) ( not ( = ?auto_14413 ?auto_14415 ) ) ( not ( = ?auto_14413 ?auto_14416 ) ) ( not ( = ?auto_14414 ?auto_14415 ) ) ( not ( = ?auto_14414 ?auto_14416 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14415 ?auto_14416 )
      ( MAKE-3CRATE-VERIFY ?auto_14413 ?auto_14414 ?auto_14415 ?auto_14416 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14419 - SURFACE
      ?auto_14420 - SURFACE
      ?auto_14421 - SURFACE
      ?auto_14422 - SURFACE
      ?auto_14423 - SURFACE
    )
    :vars
    (
      ?auto_14424 - HOIST
      ?auto_14425 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14424 ?auto_14425 ) ( SURFACE-AT ?auto_14422 ?auto_14425 ) ( CLEAR ?auto_14422 ) ( LIFTING ?auto_14424 ?auto_14423 ) ( IS-CRATE ?auto_14423 ) ( not ( = ?auto_14422 ?auto_14423 ) ) ( ON ?auto_14420 ?auto_14419 ) ( ON ?auto_14421 ?auto_14420 ) ( ON ?auto_14422 ?auto_14421 ) ( not ( = ?auto_14419 ?auto_14420 ) ) ( not ( = ?auto_14419 ?auto_14421 ) ) ( not ( = ?auto_14419 ?auto_14422 ) ) ( not ( = ?auto_14419 ?auto_14423 ) ) ( not ( = ?auto_14420 ?auto_14421 ) ) ( not ( = ?auto_14420 ?auto_14422 ) ) ( not ( = ?auto_14420 ?auto_14423 ) ) ( not ( = ?auto_14421 ?auto_14422 ) ) ( not ( = ?auto_14421 ?auto_14423 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14422 ?auto_14423 )
      ( MAKE-4CRATE-VERIFY ?auto_14419 ?auto_14420 ?auto_14421 ?auto_14422 ?auto_14423 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14426 - SURFACE
      ?auto_14427 - SURFACE
    )
    :vars
    (
      ?auto_14428 - HOIST
      ?auto_14429 - PLACE
      ?auto_14430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14428 ?auto_14429 ) ( SURFACE-AT ?auto_14426 ?auto_14429 ) ( CLEAR ?auto_14426 ) ( IS-CRATE ?auto_14427 ) ( not ( = ?auto_14426 ?auto_14427 ) ) ( TRUCK-AT ?auto_14430 ?auto_14429 ) ( AVAILABLE ?auto_14428 ) ( IN ?auto_14427 ?auto_14430 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14428 ?auto_14427 ?auto_14430 ?auto_14429 )
      ( MAKE-1CRATE ?auto_14426 ?auto_14427 )
      ( MAKE-1CRATE-VERIFY ?auto_14426 ?auto_14427 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14431 - SURFACE
      ?auto_14432 - SURFACE
      ?auto_14433 - SURFACE
    )
    :vars
    (
      ?auto_14435 - HOIST
      ?auto_14436 - PLACE
      ?auto_14434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14435 ?auto_14436 ) ( SURFACE-AT ?auto_14432 ?auto_14436 ) ( CLEAR ?auto_14432 ) ( IS-CRATE ?auto_14433 ) ( not ( = ?auto_14432 ?auto_14433 ) ) ( TRUCK-AT ?auto_14434 ?auto_14436 ) ( AVAILABLE ?auto_14435 ) ( IN ?auto_14433 ?auto_14434 ) ( ON ?auto_14432 ?auto_14431 ) ( not ( = ?auto_14431 ?auto_14432 ) ) ( not ( = ?auto_14431 ?auto_14433 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14432 ?auto_14433 )
      ( MAKE-2CRATE-VERIFY ?auto_14431 ?auto_14432 ?auto_14433 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14437 - SURFACE
      ?auto_14438 - SURFACE
      ?auto_14439 - SURFACE
      ?auto_14440 - SURFACE
    )
    :vars
    (
      ?auto_14441 - HOIST
      ?auto_14443 - PLACE
      ?auto_14442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14441 ?auto_14443 ) ( SURFACE-AT ?auto_14439 ?auto_14443 ) ( CLEAR ?auto_14439 ) ( IS-CRATE ?auto_14440 ) ( not ( = ?auto_14439 ?auto_14440 ) ) ( TRUCK-AT ?auto_14442 ?auto_14443 ) ( AVAILABLE ?auto_14441 ) ( IN ?auto_14440 ?auto_14442 ) ( ON ?auto_14439 ?auto_14438 ) ( not ( = ?auto_14438 ?auto_14439 ) ) ( not ( = ?auto_14438 ?auto_14440 ) ) ( ON ?auto_14438 ?auto_14437 ) ( not ( = ?auto_14437 ?auto_14438 ) ) ( not ( = ?auto_14437 ?auto_14439 ) ) ( not ( = ?auto_14437 ?auto_14440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14438 ?auto_14439 ?auto_14440 )
      ( MAKE-3CRATE-VERIFY ?auto_14437 ?auto_14438 ?auto_14439 ?auto_14440 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14444 - SURFACE
      ?auto_14445 - SURFACE
      ?auto_14446 - SURFACE
      ?auto_14447 - SURFACE
      ?auto_14448 - SURFACE
    )
    :vars
    (
      ?auto_14449 - HOIST
      ?auto_14451 - PLACE
      ?auto_14450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14449 ?auto_14451 ) ( SURFACE-AT ?auto_14447 ?auto_14451 ) ( CLEAR ?auto_14447 ) ( IS-CRATE ?auto_14448 ) ( not ( = ?auto_14447 ?auto_14448 ) ) ( TRUCK-AT ?auto_14450 ?auto_14451 ) ( AVAILABLE ?auto_14449 ) ( IN ?auto_14448 ?auto_14450 ) ( ON ?auto_14447 ?auto_14446 ) ( not ( = ?auto_14446 ?auto_14447 ) ) ( not ( = ?auto_14446 ?auto_14448 ) ) ( ON ?auto_14445 ?auto_14444 ) ( ON ?auto_14446 ?auto_14445 ) ( not ( = ?auto_14444 ?auto_14445 ) ) ( not ( = ?auto_14444 ?auto_14446 ) ) ( not ( = ?auto_14444 ?auto_14447 ) ) ( not ( = ?auto_14444 ?auto_14448 ) ) ( not ( = ?auto_14445 ?auto_14446 ) ) ( not ( = ?auto_14445 ?auto_14447 ) ) ( not ( = ?auto_14445 ?auto_14448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14446 ?auto_14447 ?auto_14448 )
      ( MAKE-4CRATE-VERIFY ?auto_14444 ?auto_14445 ?auto_14446 ?auto_14447 ?auto_14448 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14452 - SURFACE
      ?auto_14453 - SURFACE
    )
    :vars
    (
      ?auto_14454 - HOIST
      ?auto_14457 - PLACE
      ?auto_14455 - TRUCK
      ?auto_14456 - SURFACE
      ?auto_14458 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14454 ?auto_14457 ) ( SURFACE-AT ?auto_14452 ?auto_14457 ) ( CLEAR ?auto_14452 ) ( IS-CRATE ?auto_14453 ) ( not ( = ?auto_14452 ?auto_14453 ) ) ( AVAILABLE ?auto_14454 ) ( IN ?auto_14453 ?auto_14455 ) ( ON ?auto_14452 ?auto_14456 ) ( not ( = ?auto_14456 ?auto_14452 ) ) ( not ( = ?auto_14456 ?auto_14453 ) ) ( TRUCK-AT ?auto_14455 ?auto_14458 ) ( not ( = ?auto_14458 ?auto_14457 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14455 ?auto_14458 ?auto_14457 )
      ( MAKE-2CRATE ?auto_14456 ?auto_14452 ?auto_14453 )
      ( MAKE-1CRATE-VERIFY ?auto_14452 ?auto_14453 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14459 - SURFACE
      ?auto_14460 - SURFACE
      ?auto_14461 - SURFACE
    )
    :vars
    (
      ?auto_14465 - HOIST
      ?auto_14464 - PLACE
      ?auto_14463 - TRUCK
      ?auto_14462 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14465 ?auto_14464 ) ( SURFACE-AT ?auto_14460 ?auto_14464 ) ( CLEAR ?auto_14460 ) ( IS-CRATE ?auto_14461 ) ( not ( = ?auto_14460 ?auto_14461 ) ) ( AVAILABLE ?auto_14465 ) ( IN ?auto_14461 ?auto_14463 ) ( ON ?auto_14460 ?auto_14459 ) ( not ( = ?auto_14459 ?auto_14460 ) ) ( not ( = ?auto_14459 ?auto_14461 ) ) ( TRUCK-AT ?auto_14463 ?auto_14462 ) ( not ( = ?auto_14462 ?auto_14464 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14460 ?auto_14461 )
      ( MAKE-2CRATE-VERIFY ?auto_14459 ?auto_14460 ?auto_14461 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14466 - SURFACE
      ?auto_14467 - SURFACE
      ?auto_14468 - SURFACE
      ?auto_14469 - SURFACE
    )
    :vars
    (
      ?auto_14471 - HOIST
      ?auto_14473 - PLACE
      ?auto_14472 - TRUCK
      ?auto_14470 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14471 ?auto_14473 ) ( SURFACE-AT ?auto_14468 ?auto_14473 ) ( CLEAR ?auto_14468 ) ( IS-CRATE ?auto_14469 ) ( not ( = ?auto_14468 ?auto_14469 ) ) ( AVAILABLE ?auto_14471 ) ( IN ?auto_14469 ?auto_14472 ) ( ON ?auto_14468 ?auto_14467 ) ( not ( = ?auto_14467 ?auto_14468 ) ) ( not ( = ?auto_14467 ?auto_14469 ) ) ( TRUCK-AT ?auto_14472 ?auto_14470 ) ( not ( = ?auto_14470 ?auto_14473 ) ) ( ON ?auto_14467 ?auto_14466 ) ( not ( = ?auto_14466 ?auto_14467 ) ) ( not ( = ?auto_14466 ?auto_14468 ) ) ( not ( = ?auto_14466 ?auto_14469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14467 ?auto_14468 ?auto_14469 )
      ( MAKE-3CRATE-VERIFY ?auto_14466 ?auto_14467 ?auto_14468 ?auto_14469 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14474 - SURFACE
      ?auto_14475 - SURFACE
      ?auto_14476 - SURFACE
      ?auto_14477 - SURFACE
      ?auto_14478 - SURFACE
    )
    :vars
    (
      ?auto_14480 - HOIST
      ?auto_14482 - PLACE
      ?auto_14481 - TRUCK
      ?auto_14479 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14480 ?auto_14482 ) ( SURFACE-AT ?auto_14477 ?auto_14482 ) ( CLEAR ?auto_14477 ) ( IS-CRATE ?auto_14478 ) ( not ( = ?auto_14477 ?auto_14478 ) ) ( AVAILABLE ?auto_14480 ) ( IN ?auto_14478 ?auto_14481 ) ( ON ?auto_14477 ?auto_14476 ) ( not ( = ?auto_14476 ?auto_14477 ) ) ( not ( = ?auto_14476 ?auto_14478 ) ) ( TRUCK-AT ?auto_14481 ?auto_14479 ) ( not ( = ?auto_14479 ?auto_14482 ) ) ( ON ?auto_14475 ?auto_14474 ) ( ON ?auto_14476 ?auto_14475 ) ( not ( = ?auto_14474 ?auto_14475 ) ) ( not ( = ?auto_14474 ?auto_14476 ) ) ( not ( = ?auto_14474 ?auto_14477 ) ) ( not ( = ?auto_14474 ?auto_14478 ) ) ( not ( = ?auto_14475 ?auto_14476 ) ) ( not ( = ?auto_14475 ?auto_14477 ) ) ( not ( = ?auto_14475 ?auto_14478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14476 ?auto_14477 ?auto_14478 )
      ( MAKE-4CRATE-VERIFY ?auto_14474 ?auto_14475 ?auto_14476 ?auto_14477 ?auto_14478 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14483 - SURFACE
      ?auto_14484 - SURFACE
    )
    :vars
    (
      ?auto_14487 - HOIST
      ?auto_14489 - PLACE
      ?auto_14485 - SURFACE
      ?auto_14488 - TRUCK
      ?auto_14486 - PLACE
      ?auto_14490 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14487 ?auto_14489 ) ( SURFACE-AT ?auto_14483 ?auto_14489 ) ( CLEAR ?auto_14483 ) ( IS-CRATE ?auto_14484 ) ( not ( = ?auto_14483 ?auto_14484 ) ) ( AVAILABLE ?auto_14487 ) ( ON ?auto_14483 ?auto_14485 ) ( not ( = ?auto_14485 ?auto_14483 ) ) ( not ( = ?auto_14485 ?auto_14484 ) ) ( TRUCK-AT ?auto_14488 ?auto_14486 ) ( not ( = ?auto_14486 ?auto_14489 ) ) ( HOIST-AT ?auto_14490 ?auto_14486 ) ( LIFTING ?auto_14490 ?auto_14484 ) ( not ( = ?auto_14487 ?auto_14490 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14490 ?auto_14484 ?auto_14488 ?auto_14486 )
      ( MAKE-2CRATE ?auto_14485 ?auto_14483 ?auto_14484 )
      ( MAKE-1CRATE-VERIFY ?auto_14483 ?auto_14484 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14491 - SURFACE
      ?auto_14492 - SURFACE
      ?auto_14493 - SURFACE
    )
    :vars
    (
      ?auto_14497 - HOIST
      ?auto_14496 - PLACE
      ?auto_14498 - TRUCK
      ?auto_14494 - PLACE
      ?auto_14495 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14497 ?auto_14496 ) ( SURFACE-AT ?auto_14492 ?auto_14496 ) ( CLEAR ?auto_14492 ) ( IS-CRATE ?auto_14493 ) ( not ( = ?auto_14492 ?auto_14493 ) ) ( AVAILABLE ?auto_14497 ) ( ON ?auto_14492 ?auto_14491 ) ( not ( = ?auto_14491 ?auto_14492 ) ) ( not ( = ?auto_14491 ?auto_14493 ) ) ( TRUCK-AT ?auto_14498 ?auto_14494 ) ( not ( = ?auto_14494 ?auto_14496 ) ) ( HOIST-AT ?auto_14495 ?auto_14494 ) ( LIFTING ?auto_14495 ?auto_14493 ) ( not ( = ?auto_14497 ?auto_14495 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14492 ?auto_14493 )
      ( MAKE-2CRATE-VERIFY ?auto_14491 ?auto_14492 ?auto_14493 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14499 - SURFACE
      ?auto_14500 - SURFACE
      ?auto_14501 - SURFACE
      ?auto_14502 - SURFACE
    )
    :vars
    (
      ?auto_14504 - HOIST
      ?auto_14506 - PLACE
      ?auto_14503 - TRUCK
      ?auto_14507 - PLACE
      ?auto_14505 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14504 ?auto_14506 ) ( SURFACE-AT ?auto_14501 ?auto_14506 ) ( CLEAR ?auto_14501 ) ( IS-CRATE ?auto_14502 ) ( not ( = ?auto_14501 ?auto_14502 ) ) ( AVAILABLE ?auto_14504 ) ( ON ?auto_14501 ?auto_14500 ) ( not ( = ?auto_14500 ?auto_14501 ) ) ( not ( = ?auto_14500 ?auto_14502 ) ) ( TRUCK-AT ?auto_14503 ?auto_14507 ) ( not ( = ?auto_14507 ?auto_14506 ) ) ( HOIST-AT ?auto_14505 ?auto_14507 ) ( LIFTING ?auto_14505 ?auto_14502 ) ( not ( = ?auto_14504 ?auto_14505 ) ) ( ON ?auto_14500 ?auto_14499 ) ( not ( = ?auto_14499 ?auto_14500 ) ) ( not ( = ?auto_14499 ?auto_14501 ) ) ( not ( = ?auto_14499 ?auto_14502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14500 ?auto_14501 ?auto_14502 )
      ( MAKE-3CRATE-VERIFY ?auto_14499 ?auto_14500 ?auto_14501 ?auto_14502 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14508 - SURFACE
      ?auto_14509 - SURFACE
      ?auto_14510 - SURFACE
      ?auto_14511 - SURFACE
      ?auto_14512 - SURFACE
    )
    :vars
    (
      ?auto_14514 - HOIST
      ?auto_14516 - PLACE
      ?auto_14513 - TRUCK
      ?auto_14517 - PLACE
      ?auto_14515 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14514 ?auto_14516 ) ( SURFACE-AT ?auto_14511 ?auto_14516 ) ( CLEAR ?auto_14511 ) ( IS-CRATE ?auto_14512 ) ( not ( = ?auto_14511 ?auto_14512 ) ) ( AVAILABLE ?auto_14514 ) ( ON ?auto_14511 ?auto_14510 ) ( not ( = ?auto_14510 ?auto_14511 ) ) ( not ( = ?auto_14510 ?auto_14512 ) ) ( TRUCK-AT ?auto_14513 ?auto_14517 ) ( not ( = ?auto_14517 ?auto_14516 ) ) ( HOIST-AT ?auto_14515 ?auto_14517 ) ( LIFTING ?auto_14515 ?auto_14512 ) ( not ( = ?auto_14514 ?auto_14515 ) ) ( ON ?auto_14509 ?auto_14508 ) ( ON ?auto_14510 ?auto_14509 ) ( not ( = ?auto_14508 ?auto_14509 ) ) ( not ( = ?auto_14508 ?auto_14510 ) ) ( not ( = ?auto_14508 ?auto_14511 ) ) ( not ( = ?auto_14508 ?auto_14512 ) ) ( not ( = ?auto_14509 ?auto_14510 ) ) ( not ( = ?auto_14509 ?auto_14511 ) ) ( not ( = ?auto_14509 ?auto_14512 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14510 ?auto_14511 ?auto_14512 )
      ( MAKE-4CRATE-VERIFY ?auto_14508 ?auto_14509 ?auto_14510 ?auto_14511 ?auto_14512 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14518 - SURFACE
      ?auto_14519 - SURFACE
    )
    :vars
    (
      ?auto_14522 - HOIST
      ?auto_14524 - PLACE
      ?auto_14521 - SURFACE
      ?auto_14520 - TRUCK
      ?auto_14525 - PLACE
      ?auto_14523 - HOIST
      ?auto_14526 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14522 ?auto_14524 ) ( SURFACE-AT ?auto_14518 ?auto_14524 ) ( CLEAR ?auto_14518 ) ( IS-CRATE ?auto_14519 ) ( not ( = ?auto_14518 ?auto_14519 ) ) ( AVAILABLE ?auto_14522 ) ( ON ?auto_14518 ?auto_14521 ) ( not ( = ?auto_14521 ?auto_14518 ) ) ( not ( = ?auto_14521 ?auto_14519 ) ) ( TRUCK-AT ?auto_14520 ?auto_14525 ) ( not ( = ?auto_14525 ?auto_14524 ) ) ( HOIST-AT ?auto_14523 ?auto_14525 ) ( not ( = ?auto_14522 ?auto_14523 ) ) ( AVAILABLE ?auto_14523 ) ( SURFACE-AT ?auto_14519 ?auto_14525 ) ( ON ?auto_14519 ?auto_14526 ) ( CLEAR ?auto_14519 ) ( not ( = ?auto_14518 ?auto_14526 ) ) ( not ( = ?auto_14519 ?auto_14526 ) ) ( not ( = ?auto_14521 ?auto_14526 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14523 ?auto_14519 ?auto_14526 ?auto_14525 )
      ( MAKE-2CRATE ?auto_14521 ?auto_14518 ?auto_14519 )
      ( MAKE-1CRATE-VERIFY ?auto_14518 ?auto_14519 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14527 - SURFACE
      ?auto_14528 - SURFACE
      ?auto_14529 - SURFACE
    )
    :vars
    (
      ?auto_14532 - HOIST
      ?auto_14533 - PLACE
      ?auto_14531 - TRUCK
      ?auto_14534 - PLACE
      ?auto_14530 - HOIST
      ?auto_14535 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14532 ?auto_14533 ) ( SURFACE-AT ?auto_14528 ?auto_14533 ) ( CLEAR ?auto_14528 ) ( IS-CRATE ?auto_14529 ) ( not ( = ?auto_14528 ?auto_14529 ) ) ( AVAILABLE ?auto_14532 ) ( ON ?auto_14528 ?auto_14527 ) ( not ( = ?auto_14527 ?auto_14528 ) ) ( not ( = ?auto_14527 ?auto_14529 ) ) ( TRUCK-AT ?auto_14531 ?auto_14534 ) ( not ( = ?auto_14534 ?auto_14533 ) ) ( HOIST-AT ?auto_14530 ?auto_14534 ) ( not ( = ?auto_14532 ?auto_14530 ) ) ( AVAILABLE ?auto_14530 ) ( SURFACE-AT ?auto_14529 ?auto_14534 ) ( ON ?auto_14529 ?auto_14535 ) ( CLEAR ?auto_14529 ) ( not ( = ?auto_14528 ?auto_14535 ) ) ( not ( = ?auto_14529 ?auto_14535 ) ) ( not ( = ?auto_14527 ?auto_14535 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14528 ?auto_14529 )
      ( MAKE-2CRATE-VERIFY ?auto_14527 ?auto_14528 ?auto_14529 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14536 - SURFACE
      ?auto_14537 - SURFACE
      ?auto_14538 - SURFACE
      ?auto_14539 - SURFACE
    )
    :vars
    (
      ?auto_14544 - HOIST
      ?auto_14541 - PLACE
      ?auto_14543 - TRUCK
      ?auto_14540 - PLACE
      ?auto_14542 - HOIST
      ?auto_14545 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14544 ?auto_14541 ) ( SURFACE-AT ?auto_14538 ?auto_14541 ) ( CLEAR ?auto_14538 ) ( IS-CRATE ?auto_14539 ) ( not ( = ?auto_14538 ?auto_14539 ) ) ( AVAILABLE ?auto_14544 ) ( ON ?auto_14538 ?auto_14537 ) ( not ( = ?auto_14537 ?auto_14538 ) ) ( not ( = ?auto_14537 ?auto_14539 ) ) ( TRUCK-AT ?auto_14543 ?auto_14540 ) ( not ( = ?auto_14540 ?auto_14541 ) ) ( HOIST-AT ?auto_14542 ?auto_14540 ) ( not ( = ?auto_14544 ?auto_14542 ) ) ( AVAILABLE ?auto_14542 ) ( SURFACE-AT ?auto_14539 ?auto_14540 ) ( ON ?auto_14539 ?auto_14545 ) ( CLEAR ?auto_14539 ) ( not ( = ?auto_14538 ?auto_14545 ) ) ( not ( = ?auto_14539 ?auto_14545 ) ) ( not ( = ?auto_14537 ?auto_14545 ) ) ( ON ?auto_14537 ?auto_14536 ) ( not ( = ?auto_14536 ?auto_14537 ) ) ( not ( = ?auto_14536 ?auto_14538 ) ) ( not ( = ?auto_14536 ?auto_14539 ) ) ( not ( = ?auto_14536 ?auto_14545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14537 ?auto_14538 ?auto_14539 )
      ( MAKE-3CRATE-VERIFY ?auto_14536 ?auto_14537 ?auto_14538 ?auto_14539 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14546 - SURFACE
      ?auto_14547 - SURFACE
      ?auto_14548 - SURFACE
      ?auto_14549 - SURFACE
      ?auto_14550 - SURFACE
    )
    :vars
    (
      ?auto_14555 - HOIST
      ?auto_14552 - PLACE
      ?auto_14554 - TRUCK
      ?auto_14551 - PLACE
      ?auto_14553 - HOIST
      ?auto_14556 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14555 ?auto_14552 ) ( SURFACE-AT ?auto_14549 ?auto_14552 ) ( CLEAR ?auto_14549 ) ( IS-CRATE ?auto_14550 ) ( not ( = ?auto_14549 ?auto_14550 ) ) ( AVAILABLE ?auto_14555 ) ( ON ?auto_14549 ?auto_14548 ) ( not ( = ?auto_14548 ?auto_14549 ) ) ( not ( = ?auto_14548 ?auto_14550 ) ) ( TRUCK-AT ?auto_14554 ?auto_14551 ) ( not ( = ?auto_14551 ?auto_14552 ) ) ( HOIST-AT ?auto_14553 ?auto_14551 ) ( not ( = ?auto_14555 ?auto_14553 ) ) ( AVAILABLE ?auto_14553 ) ( SURFACE-AT ?auto_14550 ?auto_14551 ) ( ON ?auto_14550 ?auto_14556 ) ( CLEAR ?auto_14550 ) ( not ( = ?auto_14549 ?auto_14556 ) ) ( not ( = ?auto_14550 ?auto_14556 ) ) ( not ( = ?auto_14548 ?auto_14556 ) ) ( ON ?auto_14547 ?auto_14546 ) ( ON ?auto_14548 ?auto_14547 ) ( not ( = ?auto_14546 ?auto_14547 ) ) ( not ( = ?auto_14546 ?auto_14548 ) ) ( not ( = ?auto_14546 ?auto_14549 ) ) ( not ( = ?auto_14546 ?auto_14550 ) ) ( not ( = ?auto_14546 ?auto_14556 ) ) ( not ( = ?auto_14547 ?auto_14548 ) ) ( not ( = ?auto_14547 ?auto_14549 ) ) ( not ( = ?auto_14547 ?auto_14550 ) ) ( not ( = ?auto_14547 ?auto_14556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14548 ?auto_14549 ?auto_14550 )
      ( MAKE-4CRATE-VERIFY ?auto_14546 ?auto_14547 ?auto_14548 ?auto_14549 ?auto_14550 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14557 - SURFACE
      ?auto_14558 - SURFACE
    )
    :vars
    (
      ?auto_14564 - HOIST
      ?auto_14560 - PLACE
      ?auto_14562 - SURFACE
      ?auto_14559 - PLACE
      ?auto_14561 - HOIST
      ?auto_14565 - SURFACE
      ?auto_14563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14564 ?auto_14560 ) ( SURFACE-AT ?auto_14557 ?auto_14560 ) ( CLEAR ?auto_14557 ) ( IS-CRATE ?auto_14558 ) ( not ( = ?auto_14557 ?auto_14558 ) ) ( AVAILABLE ?auto_14564 ) ( ON ?auto_14557 ?auto_14562 ) ( not ( = ?auto_14562 ?auto_14557 ) ) ( not ( = ?auto_14562 ?auto_14558 ) ) ( not ( = ?auto_14559 ?auto_14560 ) ) ( HOIST-AT ?auto_14561 ?auto_14559 ) ( not ( = ?auto_14564 ?auto_14561 ) ) ( AVAILABLE ?auto_14561 ) ( SURFACE-AT ?auto_14558 ?auto_14559 ) ( ON ?auto_14558 ?auto_14565 ) ( CLEAR ?auto_14558 ) ( not ( = ?auto_14557 ?auto_14565 ) ) ( not ( = ?auto_14558 ?auto_14565 ) ) ( not ( = ?auto_14562 ?auto_14565 ) ) ( TRUCK-AT ?auto_14563 ?auto_14560 ) )
    :subtasks
    ( ( !DRIVE ?auto_14563 ?auto_14560 ?auto_14559 )
      ( MAKE-2CRATE ?auto_14562 ?auto_14557 ?auto_14558 )
      ( MAKE-1CRATE-VERIFY ?auto_14557 ?auto_14558 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14566 - SURFACE
      ?auto_14567 - SURFACE
      ?auto_14568 - SURFACE
    )
    :vars
    (
      ?auto_14570 - HOIST
      ?auto_14574 - PLACE
      ?auto_14569 - PLACE
      ?auto_14573 - HOIST
      ?auto_14571 - SURFACE
      ?auto_14572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14570 ?auto_14574 ) ( SURFACE-AT ?auto_14567 ?auto_14574 ) ( CLEAR ?auto_14567 ) ( IS-CRATE ?auto_14568 ) ( not ( = ?auto_14567 ?auto_14568 ) ) ( AVAILABLE ?auto_14570 ) ( ON ?auto_14567 ?auto_14566 ) ( not ( = ?auto_14566 ?auto_14567 ) ) ( not ( = ?auto_14566 ?auto_14568 ) ) ( not ( = ?auto_14569 ?auto_14574 ) ) ( HOIST-AT ?auto_14573 ?auto_14569 ) ( not ( = ?auto_14570 ?auto_14573 ) ) ( AVAILABLE ?auto_14573 ) ( SURFACE-AT ?auto_14568 ?auto_14569 ) ( ON ?auto_14568 ?auto_14571 ) ( CLEAR ?auto_14568 ) ( not ( = ?auto_14567 ?auto_14571 ) ) ( not ( = ?auto_14568 ?auto_14571 ) ) ( not ( = ?auto_14566 ?auto_14571 ) ) ( TRUCK-AT ?auto_14572 ?auto_14574 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14567 ?auto_14568 )
      ( MAKE-2CRATE-VERIFY ?auto_14566 ?auto_14567 ?auto_14568 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14575 - SURFACE
      ?auto_14576 - SURFACE
      ?auto_14577 - SURFACE
      ?auto_14578 - SURFACE
    )
    :vars
    (
      ?auto_14582 - HOIST
      ?auto_14583 - PLACE
      ?auto_14579 - PLACE
      ?auto_14580 - HOIST
      ?auto_14581 - SURFACE
      ?auto_14584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14582 ?auto_14583 ) ( SURFACE-AT ?auto_14577 ?auto_14583 ) ( CLEAR ?auto_14577 ) ( IS-CRATE ?auto_14578 ) ( not ( = ?auto_14577 ?auto_14578 ) ) ( AVAILABLE ?auto_14582 ) ( ON ?auto_14577 ?auto_14576 ) ( not ( = ?auto_14576 ?auto_14577 ) ) ( not ( = ?auto_14576 ?auto_14578 ) ) ( not ( = ?auto_14579 ?auto_14583 ) ) ( HOIST-AT ?auto_14580 ?auto_14579 ) ( not ( = ?auto_14582 ?auto_14580 ) ) ( AVAILABLE ?auto_14580 ) ( SURFACE-AT ?auto_14578 ?auto_14579 ) ( ON ?auto_14578 ?auto_14581 ) ( CLEAR ?auto_14578 ) ( not ( = ?auto_14577 ?auto_14581 ) ) ( not ( = ?auto_14578 ?auto_14581 ) ) ( not ( = ?auto_14576 ?auto_14581 ) ) ( TRUCK-AT ?auto_14584 ?auto_14583 ) ( ON ?auto_14576 ?auto_14575 ) ( not ( = ?auto_14575 ?auto_14576 ) ) ( not ( = ?auto_14575 ?auto_14577 ) ) ( not ( = ?auto_14575 ?auto_14578 ) ) ( not ( = ?auto_14575 ?auto_14581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14576 ?auto_14577 ?auto_14578 )
      ( MAKE-3CRATE-VERIFY ?auto_14575 ?auto_14576 ?auto_14577 ?auto_14578 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14585 - SURFACE
      ?auto_14586 - SURFACE
      ?auto_14587 - SURFACE
      ?auto_14588 - SURFACE
      ?auto_14589 - SURFACE
    )
    :vars
    (
      ?auto_14593 - HOIST
      ?auto_14594 - PLACE
      ?auto_14590 - PLACE
      ?auto_14591 - HOIST
      ?auto_14592 - SURFACE
      ?auto_14595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14593 ?auto_14594 ) ( SURFACE-AT ?auto_14588 ?auto_14594 ) ( CLEAR ?auto_14588 ) ( IS-CRATE ?auto_14589 ) ( not ( = ?auto_14588 ?auto_14589 ) ) ( AVAILABLE ?auto_14593 ) ( ON ?auto_14588 ?auto_14587 ) ( not ( = ?auto_14587 ?auto_14588 ) ) ( not ( = ?auto_14587 ?auto_14589 ) ) ( not ( = ?auto_14590 ?auto_14594 ) ) ( HOIST-AT ?auto_14591 ?auto_14590 ) ( not ( = ?auto_14593 ?auto_14591 ) ) ( AVAILABLE ?auto_14591 ) ( SURFACE-AT ?auto_14589 ?auto_14590 ) ( ON ?auto_14589 ?auto_14592 ) ( CLEAR ?auto_14589 ) ( not ( = ?auto_14588 ?auto_14592 ) ) ( not ( = ?auto_14589 ?auto_14592 ) ) ( not ( = ?auto_14587 ?auto_14592 ) ) ( TRUCK-AT ?auto_14595 ?auto_14594 ) ( ON ?auto_14586 ?auto_14585 ) ( ON ?auto_14587 ?auto_14586 ) ( not ( = ?auto_14585 ?auto_14586 ) ) ( not ( = ?auto_14585 ?auto_14587 ) ) ( not ( = ?auto_14585 ?auto_14588 ) ) ( not ( = ?auto_14585 ?auto_14589 ) ) ( not ( = ?auto_14585 ?auto_14592 ) ) ( not ( = ?auto_14586 ?auto_14587 ) ) ( not ( = ?auto_14586 ?auto_14588 ) ) ( not ( = ?auto_14586 ?auto_14589 ) ) ( not ( = ?auto_14586 ?auto_14592 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14587 ?auto_14588 ?auto_14589 )
      ( MAKE-4CRATE-VERIFY ?auto_14585 ?auto_14586 ?auto_14587 ?auto_14588 ?auto_14589 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14596 - SURFACE
      ?auto_14597 - SURFACE
    )
    :vars
    (
      ?auto_14602 - HOIST
      ?auto_14603 - PLACE
      ?auto_14599 - SURFACE
      ?auto_14598 - PLACE
      ?auto_14600 - HOIST
      ?auto_14601 - SURFACE
      ?auto_14604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14602 ?auto_14603 ) ( IS-CRATE ?auto_14597 ) ( not ( = ?auto_14596 ?auto_14597 ) ) ( not ( = ?auto_14599 ?auto_14596 ) ) ( not ( = ?auto_14599 ?auto_14597 ) ) ( not ( = ?auto_14598 ?auto_14603 ) ) ( HOIST-AT ?auto_14600 ?auto_14598 ) ( not ( = ?auto_14602 ?auto_14600 ) ) ( AVAILABLE ?auto_14600 ) ( SURFACE-AT ?auto_14597 ?auto_14598 ) ( ON ?auto_14597 ?auto_14601 ) ( CLEAR ?auto_14597 ) ( not ( = ?auto_14596 ?auto_14601 ) ) ( not ( = ?auto_14597 ?auto_14601 ) ) ( not ( = ?auto_14599 ?auto_14601 ) ) ( TRUCK-AT ?auto_14604 ?auto_14603 ) ( SURFACE-AT ?auto_14599 ?auto_14603 ) ( CLEAR ?auto_14599 ) ( LIFTING ?auto_14602 ?auto_14596 ) ( IS-CRATE ?auto_14596 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14599 ?auto_14596 )
      ( MAKE-2CRATE ?auto_14599 ?auto_14596 ?auto_14597 )
      ( MAKE-1CRATE-VERIFY ?auto_14596 ?auto_14597 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14605 - SURFACE
      ?auto_14606 - SURFACE
      ?auto_14607 - SURFACE
    )
    :vars
    (
      ?auto_14612 - HOIST
      ?auto_14613 - PLACE
      ?auto_14608 - PLACE
      ?auto_14611 - HOIST
      ?auto_14610 - SURFACE
      ?auto_14609 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14612 ?auto_14613 ) ( IS-CRATE ?auto_14607 ) ( not ( = ?auto_14606 ?auto_14607 ) ) ( not ( = ?auto_14605 ?auto_14606 ) ) ( not ( = ?auto_14605 ?auto_14607 ) ) ( not ( = ?auto_14608 ?auto_14613 ) ) ( HOIST-AT ?auto_14611 ?auto_14608 ) ( not ( = ?auto_14612 ?auto_14611 ) ) ( AVAILABLE ?auto_14611 ) ( SURFACE-AT ?auto_14607 ?auto_14608 ) ( ON ?auto_14607 ?auto_14610 ) ( CLEAR ?auto_14607 ) ( not ( = ?auto_14606 ?auto_14610 ) ) ( not ( = ?auto_14607 ?auto_14610 ) ) ( not ( = ?auto_14605 ?auto_14610 ) ) ( TRUCK-AT ?auto_14609 ?auto_14613 ) ( SURFACE-AT ?auto_14605 ?auto_14613 ) ( CLEAR ?auto_14605 ) ( LIFTING ?auto_14612 ?auto_14606 ) ( IS-CRATE ?auto_14606 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14606 ?auto_14607 )
      ( MAKE-2CRATE-VERIFY ?auto_14605 ?auto_14606 ?auto_14607 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14614 - SURFACE
      ?auto_14615 - SURFACE
      ?auto_14616 - SURFACE
      ?auto_14617 - SURFACE
    )
    :vars
    (
      ?auto_14620 - HOIST
      ?auto_14619 - PLACE
      ?auto_14622 - PLACE
      ?auto_14621 - HOIST
      ?auto_14623 - SURFACE
      ?auto_14618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14620 ?auto_14619 ) ( IS-CRATE ?auto_14617 ) ( not ( = ?auto_14616 ?auto_14617 ) ) ( not ( = ?auto_14615 ?auto_14616 ) ) ( not ( = ?auto_14615 ?auto_14617 ) ) ( not ( = ?auto_14622 ?auto_14619 ) ) ( HOIST-AT ?auto_14621 ?auto_14622 ) ( not ( = ?auto_14620 ?auto_14621 ) ) ( AVAILABLE ?auto_14621 ) ( SURFACE-AT ?auto_14617 ?auto_14622 ) ( ON ?auto_14617 ?auto_14623 ) ( CLEAR ?auto_14617 ) ( not ( = ?auto_14616 ?auto_14623 ) ) ( not ( = ?auto_14617 ?auto_14623 ) ) ( not ( = ?auto_14615 ?auto_14623 ) ) ( TRUCK-AT ?auto_14618 ?auto_14619 ) ( SURFACE-AT ?auto_14615 ?auto_14619 ) ( CLEAR ?auto_14615 ) ( LIFTING ?auto_14620 ?auto_14616 ) ( IS-CRATE ?auto_14616 ) ( ON ?auto_14615 ?auto_14614 ) ( not ( = ?auto_14614 ?auto_14615 ) ) ( not ( = ?auto_14614 ?auto_14616 ) ) ( not ( = ?auto_14614 ?auto_14617 ) ) ( not ( = ?auto_14614 ?auto_14623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14615 ?auto_14616 ?auto_14617 )
      ( MAKE-3CRATE-VERIFY ?auto_14614 ?auto_14615 ?auto_14616 ?auto_14617 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14624 - SURFACE
      ?auto_14625 - SURFACE
      ?auto_14626 - SURFACE
      ?auto_14627 - SURFACE
      ?auto_14628 - SURFACE
    )
    :vars
    (
      ?auto_14631 - HOIST
      ?auto_14630 - PLACE
      ?auto_14633 - PLACE
      ?auto_14632 - HOIST
      ?auto_14634 - SURFACE
      ?auto_14629 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14631 ?auto_14630 ) ( IS-CRATE ?auto_14628 ) ( not ( = ?auto_14627 ?auto_14628 ) ) ( not ( = ?auto_14626 ?auto_14627 ) ) ( not ( = ?auto_14626 ?auto_14628 ) ) ( not ( = ?auto_14633 ?auto_14630 ) ) ( HOIST-AT ?auto_14632 ?auto_14633 ) ( not ( = ?auto_14631 ?auto_14632 ) ) ( AVAILABLE ?auto_14632 ) ( SURFACE-AT ?auto_14628 ?auto_14633 ) ( ON ?auto_14628 ?auto_14634 ) ( CLEAR ?auto_14628 ) ( not ( = ?auto_14627 ?auto_14634 ) ) ( not ( = ?auto_14628 ?auto_14634 ) ) ( not ( = ?auto_14626 ?auto_14634 ) ) ( TRUCK-AT ?auto_14629 ?auto_14630 ) ( SURFACE-AT ?auto_14626 ?auto_14630 ) ( CLEAR ?auto_14626 ) ( LIFTING ?auto_14631 ?auto_14627 ) ( IS-CRATE ?auto_14627 ) ( ON ?auto_14625 ?auto_14624 ) ( ON ?auto_14626 ?auto_14625 ) ( not ( = ?auto_14624 ?auto_14625 ) ) ( not ( = ?auto_14624 ?auto_14626 ) ) ( not ( = ?auto_14624 ?auto_14627 ) ) ( not ( = ?auto_14624 ?auto_14628 ) ) ( not ( = ?auto_14624 ?auto_14634 ) ) ( not ( = ?auto_14625 ?auto_14626 ) ) ( not ( = ?auto_14625 ?auto_14627 ) ) ( not ( = ?auto_14625 ?auto_14628 ) ) ( not ( = ?auto_14625 ?auto_14634 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14626 ?auto_14627 ?auto_14628 )
      ( MAKE-4CRATE-VERIFY ?auto_14624 ?auto_14625 ?auto_14626 ?auto_14627 ?auto_14628 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14635 - SURFACE
      ?auto_14636 - SURFACE
    )
    :vars
    (
      ?auto_14640 - HOIST
      ?auto_14639 - PLACE
      ?auto_14638 - SURFACE
      ?auto_14642 - PLACE
      ?auto_14641 - HOIST
      ?auto_14643 - SURFACE
      ?auto_14637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14640 ?auto_14639 ) ( IS-CRATE ?auto_14636 ) ( not ( = ?auto_14635 ?auto_14636 ) ) ( not ( = ?auto_14638 ?auto_14635 ) ) ( not ( = ?auto_14638 ?auto_14636 ) ) ( not ( = ?auto_14642 ?auto_14639 ) ) ( HOIST-AT ?auto_14641 ?auto_14642 ) ( not ( = ?auto_14640 ?auto_14641 ) ) ( AVAILABLE ?auto_14641 ) ( SURFACE-AT ?auto_14636 ?auto_14642 ) ( ON ?auto_14636 ?auto_14643 ) ( CLEAR ?auto_14636 ) ( not ( = ?auto_14635 ?auto_14643 ) ) ( not ( = ?auto_14636 ?auto_14643 ) ) ( not ( = ?auto_14638 ?auto_14643 ) ) ( TRUCK-AT ?auto_14637 ?auto_14639 ) ( SURFACE-AT ?auto_14638 ?auto_14639 ) ( CLEAR ?auto_14638 ) ( IS-CRATE ?auto_14635 ) ( AVAILABLE ?auto_14640 ) ( IN ?auto_14635 ?auto_14637 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14640 ?auto_14635 ?auto_14637 ?auto_14639 )
      ( MAKE-2CRATE ?auto_14638 ?auto_14635 ?auto_14636 )
      ( MAKE-1CRATE-VERIFY ?auto_14635 ?auto_14636 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14644 - SURFACE
      ?auto_14645 - SURFACE
      ?auto_14646 - SURFACE
    )
    :vars
    (
      ?auto_14649 - HOIST
      ?auto_14648 - PLACE
      ?auto_14652 - PLACE
      ?auto_14651 - HOIST
      ?auto_14647 - SURFACE
      ?auto_14650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14649 ?auto_14648 ) ( IS-CRATE ?auto_14646 ) ( not ( = ?auto_14645 ?auto_14646 ) ) ( not ( = ?auto_14644 ?auto_14645 ) ) ( not ( = ?auto_14644 ?auto_14646 ) ) ( not ( = ?auto_14652 ?auto_14648 ) ) ( HOIST-AT ?auto_14651 ?auto_14652 ) ( not ( = ?auto_14649 ?auto_14651 ) ) ( AVAILABLE ?auto_14651 ) ( SURFACE-AT ?auto_14646 ?auto_14652 ) ( ON ?auto_14646 ?auto_14647 ) ( CLEAR ?auto_14646 ) ( not ( = ?auto_14645 ?auto_14647 ) ) ( not ( = ?auto_14646 ?auto_14647 ) ) ( not ( = ?auto_14644 ?auto_14647 ) ) ( TRUCK-AT ?auto_14650 ?auto_14648 ) ( SURFACE-AT ?auto_14644 ?auto_14648 ) ( CLEAR ?auto_14644 ) ( IS-CRATE ?auto_14645 ) ( AVAILABLE ?auto_14649 ) ( IN ?auto_14645 ?auto_14650 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14645 ?auto_14646 )
      ( MAKE-2CRATE-VERIFY ?auto_14644 ?auto_14645 ?auto_14646 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14653 - SURFACE
      ?auto_14654 - SURFACE
      ?auto_14655 - SURFACE
      ?auto_14656 - SURFACE
    )
    :vars
    (
      ?auto_14658 - HOIST
      ?auto_14657 - PLACE
      ?auto_14659 - PLACE
      ?auto_14661 - HOIST
      ?auto_14662 - SURFACE
      ?auto_14660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14658 ?auto_14657 ) ( IS-CRATE ?auto_14656 ) ( not ( = ?auto_14655 ?auto_14656 ) ) ( not ( = ?auto_14654 ?auto_14655 ) ) ( not ( = ?auto_14654 ?auto_14656 ) ) ( not ( = ?auto_14659 ?auto_14657 ) ) ( HOIST-AT ?auto_14661 ?auto_14659 ) ( not ( = ?auto_14658 ?auto_14661 ) ) ( AVAILABLE ?auto_14661 ) ( SURFACE-AT ?auto_14656 ?auto_14659 ) ( ON ?auto_14656 ?auto_14662 ) ( CLEAR ?auto_14656 ) ( not ( = ?auto_14655 ?auto_14662 ) ) ( not ( = ?auto_14656 ?auto_14662 ) ) ( not ( = ?auto_14654 ?auto_14662 ) ) ( TRUCK-AT ?auto_14660 ?auto_14657 ) ( SURFACE-AT ?auto_14654 ?auto_14657 ) ( CLEAR ?auto_14654 ) ( IS-CRATE ?auto_14655 ) ( AVAILABLE ?auto_14658 ) ( IN ?auto_14655 ?auto_14660 ) ( ON ?auto_14654 ?auto_14653 ) ( not ( = ?auto_14653 ?auto_14654 ) ) ( not ( = ?auto_14653 ?auto_14655 ) ) ( not ( = ?auto_14653 ?auto_14656 ) ) ( not ( = ?auto_14653 ?auto_14662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14654 ?auto_14655 ?auto_14656 )
      ( MAKE-3CRATE-VERIFY ?auto_14653 ?auto_14654 ?auto_14655 ?auto_14656 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14663 - SURFACE
      ?auto_14664 - SURFACE
      ?auto_14665 - SURFACE
      ?auto_14666 - SURFACE
      ?auto_14667 - SURFACE
    )
    :vars
    (
      ?auto_14669 - HOIST
      ?auto_14668 - PLACE
      ?auto_14670 - PLACE
      ?auto_14672 - HOIST
      ?auto_14673 - SURFACE
      ?auto_14671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14669 ?auto_14668 ) ( IS-CRATE ?auto_14667 ) ( not ( = ?auto_14666 ?auto_14667 ) ) ( not ( = ?auto_14665 ?auto_14666 ) ) ( not ( = ?auto_14665 ?auto_14667 ) ) ( not ( = ?auto_14670 ?auto_14668 ) ) ( HOIST-AT ?auto_14672 ?auto_14670 ) ( not ( = ?auto_14669 ?auto_14672 ) ) ( AVAILABLE ?auto_14672 ) ( SURFACE-AT ?auto_14667 ?auto_14670 ) ( ON ?auto_14667 ?auto_14673 ) ( CLEAR ?auto_14667 ) ( not ( = ?auto_14666 ?auto_14673 ) ) ( not ( = ?auto_14667 ?auto_14673 ) ) ( not ( = ?auto_14665 ?auto_14673 ) ) ( TRUCK-AT ?auto_14671 ?auto_14668 ) ( SURFACE-AT ?auto_14665 ?auto_14668 ) ( CLEAR ?auto_14665 ) ( IS-CRATE ?auto_14666 ) ( AVAILABLE ?auto_14669 ) ( IN ?auto_14666 ?auto_14671 ) ( ON ?auto_14664 ?auto_14663 ) ( ON ?auto_14665 ?auto_14664 ) ( not ( = ?auto_14663 ?auto_14664 ) ) ( not ( = ?auto_14663 ?auto_14665 ) ) ( not ( = ?auto_14663 ?auto_14666 ) ) ( not ( = ?auto_14663 ?auto_14667 ) ) ( not ( = ?auto_14663 ?auto_14673 ) ) ( not ( = ?auto_14664 ?auto_14665 ) ) ( not ( = ?auto_14664 ?auto_14666 ) ) ( not ( = ?auto_14664 ?auto_14667 ) ) ( not ( = ?auto_14664 ?auto_14673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14665 ?auto_14666 ?auto_14667 )
      ( MAKE-4CRATE-VERIFY ?auto_14663 ?auto_14664 ?auto_14665 ?auto_14666 ?auto_14667 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14674 - SURFACE
      ?auto_14675 - SURFACE
    )
    :vars
    (
      ?auto_14678 - HOIST
      ?auto_14676 - PLACE
      ?auto_14677 - SURFACE
      ?auto_14679 - PLACE
      ?auto_14681 - HOIST
      ?auto_14682 - SURFACE
      ?auto_14680 - TRUCK
      ?auto_14683 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14678 ?auto_14676 ) ( IS-CRATE ?auto_14675 ) ( not ( = ?auto_14674 ?auto_14675 ) ) ( not ( = ?auto_14677 ?auto_14674 ) ) ( not ( = ?auto_14677 ?auto_14675 ) ) ( not ( = ?auto_14679 ?auto_14676 ) ) ( HOIST-AT ?auto_14681 ?auto_14679 ) ( not ( = ?auto_14678 ?auto_14681 ) ) ( AVAILABLE ?auto_14681 ) ( SURFACE-AT ?auto_14675 ?auto_14679 ) ( ON ?auto_14675 ?auto_14682 ) ( CLEAR ?auto_14675 ) ( not ( = ?auto_14674 ?auto_14682 ) ) ( not ( = ?auto_14675 ?auto_14682 ) ) ( not ( = ?auto_14677 ?auto_14682 ) ) ( SURFACE-AT ?auto_14677 ?auto_14676 ) ( CLEAR ?auto_14677 ) ( IS-CRATE ?auto_14674 ) ( AVAILABLE ?auto_14678 ) ( IN ?auto_14674 ?auto_14680 ) ( TRUCK-AT ?auto_14680 ?auto_14683 ) ( not ( = ?auto_14683 ?auto_14676 ) ) ( not ( = ?auto_14679 ?auto_14683 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14680 ?auto_14683 ?auto_14676 )
      ( MAKE-2CRATE ?auto_14677 ?auto_14674 ?auto_14675 )
      ( MAKE-1CRATE-VERIFY ?auto_14674 ?auto_14675 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14684 - SURFACE
      ?auto_14685 - SURFACE
      ?auto_14686 - SURFACE
    )
    :vars
    (
      ?auto_14693 - HOIST
      ?auto_14692 - PLACE
      ?auto_14687 - PLACE
      ?auto_14690 - HOIST
      ?auto_14691 - SURFACE
      ?auto_14688 - TRUCK
      ?auto_14689 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14693 ?auto_14692 ) ( IS-CRATE ?auto_14686 ) ( not ( = ?auto_14685 ?auto_14686 ) ) ( not ( = ?auto_14684 ?auto_14685 ) ) ( not ( = ?auto_14684 ?auto_14686 ) ) ( not ( = ?auto_14687 ?auto_14692 ) ) ( HOIST-AT ?auto_14690 ?auto_14687 ) ( not ( = ?auto_14693 ?auto_14690 ) ) ( AVAILABLE ?auto_14690 ) ( SURFACE-AT ?auto_14686 ?auto_14687 ) ( ON ?auto_14686 ?auto_14691 ) ( CLEAR ?auto_14686 ) ( not ( = ?auto_14685 ?auto_14691 ) ) ( not ( = ?auto_14686 ?auto_14691 ) ) ( not ( = ?auto_14684 ?auto_14691 ) ) ( SURFACE-AT ?auto_14684 ?auto_14692 ) ( CLEAR ?auto_14684 ) ( IS-CRATE ?auto_14685 ) ( AVAILABLE ?auto_14693 ) ( IN ?auto_14685 ?auto_14688 ) ( TRUCK-AT ?auto_14688 ?auto_14689 ) ( not ( = ?auto_14689 ?auto_14692 ) ) ( not ( = ?auto_14687 ?auto_14689 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14685 ?auto_14686 )
      ( MAKE-2CRATE-VERIFY ?auto_14684 ?auto_14685 ?auto_14686 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14694 - SURFACE
      ?auto_14695 - SURFACE
      ?auto_14696 - SURFACE
      ?auto_14697 - SURFACE
    )
    :vars
    (
      ?auto_14701 - HOIST
      ?auto_14704 - PLACE
      ?auto_14702 - PLACE
      ?auto_14698 - HOIST
      ?auto_14700 - SURFACE
      ?auto_14703 - TRUCK
      ?auto_14699 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14701 ?auto_14704 ) ( IS-CRATE ?auto_14697 ) ( not ( = ?auto_14696 ?auto_14697 ) ) ( not ( = ?auto_14695 ?auto_14696 ) ) ( not ( = ?auto_14695 ?auto_14697 ) ) ( not ( = ?auto_14702 ?auto_14704 ) ) ( HOIST-AT ?auto_14698 ?auto_14702 ) ( not ( = ?auto_14701 ?auto_14698 ) ) ( AVAILABLE ?auto_14698 ) ( SURFACE-AT ?auto_14697 ?auto_14702 ) ( ON ?auto_14697 ?auto_14700 ) ( CLEAR ?auto_14697 ) ( not ( = ?auto_14696 ?auto_14700 ) ) ( not ( = ?auto_14697 ?auto_14700 ) ) ( not ( = ?auto_14695 ?auto_14700 ) ) ( SURFACE-AT ?auto_14695 ?auto_14704 ) ( CLEAR ?auto_14695 ) ( IS-CRATE ?auto_14696 ) ( AVAILABLE ?auto_14701 ) ( IN ?auto_14696 ?auto_14703 ) ( TRUCK-AT ?auto_14703 ?auto_14699 ) ( not ( = ?auto_14699 ?auto_14704 ) ) ( not ( = ?auto_14702 ?auto_14699 ) ) ( ON ?auto_14695 ?auto_14694 ) ( not ( = ?auto_14694 ?auto_14695 ) ) ( not ( = ?auto_14694 ?auto_14696 ) ) ( not ( = ?auto_14694 ?auto_14697 ) ) ( not ( = ?auto_14694 ?auto_14700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14695 ?auto_14696 ?auto_14697 )
      ( MAKE-3CRATE-VERIFY ?auto_14694 ?auto_14695 ?auto_14696 ?auto_14697 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14705 - SURFACE
      ?auto_14706 - SURFACE
      ?auto_14707 - SURFACE
      ?auto_14708 - SURFACE
      ?auto_14709 - SURFACE
    )
    :vars
    (
      ?auto_14713 - HOIST
      ?auto_14716 - PLACE
      ?auto_14714 - PLACE
      ?auto_14710 - HOIST
      ?auto_14712 - SURFACE
      ?auto_14715 - TRUCK
      ?auto_14711 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14713 ?auto_14716 ) ( IS-CRATE ?auto_14709 ) ( not ( = ?auto_14708 ?auto_14709 ) ) ( not ( = ?auto_14707 ?auto_14708 ) ) ( not ( = ?auto_14707 ?auto_14709 ) ) ( not ( = ?auto_14714 ?auto_14716 ) ) ( HOIST-AT ?auto_14710 ?auto_14714 ) ( not ( = ?auto_14713 ?auto_14710 ) ) ( AVAILABLE ?auto_14710 ) ( SURFACE-AT ?auto_14709 ?auto_14714 ) ( ON ?auto_14709 ?auto_14712 ) ( CLEAR ?auto_14709 ) ( not ( = ?auto_14708 ?auto_14712 ) ) ( not ( = ?auto_14709 ?auto_14712 ) ) ( not ( = ?auto_14707 ?auto_14712 ) ) ( SURFACE-AT ?auto_14707 ?auto_14716 ) ( CLEAR ?auto_14707 ) ( IS-CRATE ?auto_14708 ) ( AVAILABLE ?auto_14713 ) ( IN ?auto_14708 ?auto_14715 ) ( TRUCK-AT ?auto_14715 ?auto_14711 ) ( not ( = ?auto_14711 ?auto_14716 ) ) ( not ( = ?auto_14714 ?auto_14711 ) ) ( ON ?auto_14706 ?auto_14705 ) ( ON ?auto_14707 ?auto_14706 ) ( not ( = ?auto_14705 ?auto_14706 ) ) ( not ( = ?auto_14705 ?auto_14707 ) ) ( not ( = ?auto_14705 ?auto_14708 ) ) ( not ( = ?auto_14705 ?auto_14709 ) ) ( not ( = ?auto_14705 ?auto_14712 ) ) ( not ( = ?auto_14706 ?auto_14707 ) ) ( not ( = ?auto_14706 ?auto_14708 ) ) ( not ( = ?auto_14706 ?auto_14709 ) ) ( not ( = ?auto_14706 ?auto_14712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14707 ?auto_14708 ?auto_14709 )
      ( MAKE-4CRATE-VERIFY ?auto_14705 ?auto_14706 ?auto_14707 ?auto_14708 ?auto_14709 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14717 - SURFACE
      ?auto_14718 - SURFACE
    )
    :vars
    (
      ?auto_14723 - HOIST
      ?auto_14726 - PLACE
      ?auto_14719 - SURFACE
      ?auto_14724 - PLACE
      ?auto_14720 - HOIST
      ?auto_14722 - SURFACE
      ?auto_14725 - TRUCK
      ?auto_14721 - PLACE
      ?auto_14727 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14723 ?auto_14726 ) ( IS-CRATE ?auto_14718 ) ( not ( = ?auto_14717 ?auto_14718 ) ) ( not ( = ?auto_14719 ?auto_14717 ) ) ( not ( = ?auto_14719 ?auto_14718 ) ) ( not ( = ?auto_14724 ?auto_14726 ) ) ( HOIST-AT ?auto_14720 ?auto_14724 ) ( not ( = ?auto_14723 ?auto_14720 ) ) ( AVAILABLE ?auto_14720 ) ( SURFACE-AT ?auto_14718 ?auto_14724 ) ( ON ?auto_14718 ?auto_14722 ) ( CLEAR ?auto_14718 ) ( not ( = ?auto_14717 ?auto_14722 ) ) ( not ( = ?auto_14718 ?auto_14722 ) ) ( not ( = ?auto_14719 ?auto_14722 ) ) ( SURFACE-AT ?auto_14719 ?auto_14726 ) ( CLEAR ?auto_14719 ) ( IS-CRATE ?auto_14717 ) ( AVAILABLE ?auto_14723 ) ( TRUCK-AT ?auto_14725 ?auto_14721 ) ( not ( = ?auto_14721 ?auto_14726 ) ) ( not ( = ?auto_14724 ?auto_14721 ) ) ( HOIST-AT ?auto_14727 ?auto_14721 ) ( LIFTING ?auto_14727 ?auto_14717 ) ( not ( = ?auto_14723 ?auto_14727 ) ) ( not ( = ?auto_14720 ?auto_14727 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14727 ?auto_14717 ?auto_14725 ?auto_14721 )
      ( MAKE-2CRATE ?auto_14719 ?auto_14717 ?auto_14718 )
      ( MAKE-1CRATE-VERIFY ?auto_14717 ?auto_14718 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14728 - SURFACE
      ?auto_14729 - SURFACE
      ?auto_14730 - SURFACE
    )
    :vars
    (
      ?auto_14735 - HOIST
      ?auto_14738 - PLACE
      ?auto_14737 - PLACE
      ?auto_14731 - HOIST
      ?auto_14732 - SURFACE
      ?auto_14734 - TRUCK
      ?auto_14736 - PLACE
      ?auto_14733 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14735 ?auto_14738 ) ( IS-CRATE ?auto_14730 ) ( not ( = ?auto_14729 ?auto_14730 ) ) ( not ( = ?auto_14728 ?auto_14729 ) ) ( not ( = ?auto_14728 ?auto_14730 ) ) ( not ( = ?auto_14737 ?auto_14738 ) ) ( HOIST-AT ?auto_14731 ?auto_14737 ) ( not ( = ?auto_14735 ?auto_14731 ) ) ( AVAILABLE ?auto_14731 ) ( SURFACE-AT ?auto_14730 ?auto_14737 ) ( ON ?auto_14730 ?auto_14732 ) ( CLEAR ?auto_14730 ) ( not ( = ?auto_14729 ?auto_14732 ) ) ( not ( = ?auto_14730 ?auto_14732 ) ) ( not ( = ?auto_14728 ?auto_14732 ) ) ( SURFACE-AT ?auto_14728 ?auto_14738 ) ( CLEAR ?auto_14728 ) ( IS-CRATE ?auto_14729 ) ( AVAILABLE ?auto_14735 ) ( TRUCK-AT ?auto_14734 ?auto_14736 ) ( not ( = ?auto_14736 ?auto_14738 ) ) ( not ( = ?auto_14737 ?auto_14736 ) ) ( HOIST-AT ?auto_14733 ?auto_14736 ) ( LIFTING ?auto_14733 ?auto_14729 ) ( not ( = ?auto_14735 ?auto_14733 ) ) ( not ( = ?auto_14731 ?auto_14733 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14729 ?auto_14730 )
      ( MAKE-2CRATE-VERIFY ?auto_14728 ?auto_14729 ?auto_14730 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14739 - SURFACE
      ?auto_14740 - SURFACE
      ?auto_14741 - SURFACE
      ?auto_14742 - SURFACE
    )
    :vars
    (
      ?auto_14743 - HOIST
      ?auto_14744 - PLACE
      ?auto_14746 - PLACE
      ?auto_14749 - HOIST
      ?auto_14750 - SURFACE
      ?auto_14748 - TRUCK
      ?auto_14745 - PLACE
      ?auto_14747 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14743 ?auto_14744 ) ( IS-CRATE ?auto_14742 ) ( not ( = ?auto_14741 ?auto_14742 ) ) ( not ( = ?auto_14740 ?auto_14741 ) ) ( not ( = ?auto_14740 ?auto_14742 ) ) ( not ( = ?auto_14746 ?auto_14744 ) ) ( HOIST-AT ?auto_14749 ?auto_14746 ) ( not ( = ?auto_14743 ?auto_14749 ) ) ( AVAILABLE ?auto_14749 ) ( SURFACE-AT ?auto_14742 ?auto_14746 ) ( ON ?auto_14742 ?auto_14750 ) ( CLEAR ?auto_14742 ) ( not ( = ?auto_14741 ?auto_14750 ) ) ( not ( = ?auto_14742 ?auto_14750 ) ) ( not ( = ?auto_14740 ?auto_14750 ) ) ( SURFACE-AT ?auto_14740 ?auto_14744 ) ( CLEAR ?auto_14740 ) ( IS-CRATE ?auto_14741 ) ( AVAILABLE ?auto_14743 ) ( TRUCK-AT ?auto_14748 ?auto_14745 ) ( not ( = ?auto_14745 ?auto_14744 ) ) ( not ( = ?auto_14746 ?auto_14745 ) ) ( HOIST-AT ?auto_14747 ?auto_14745 ) ( LIFTING ?auto_14747 ?auto_14741 ) ( not ( = ?auto_14743 ?auto_14747 ) ) ( not ( = ?auto_14749 ?auto_14747 ) ) ( ON ?auto_14740 ?auto_14739 ) ( not ( = ?auto_14739 ?auto_14740 ) ) ( not ( = ?auto_14739 ?auto_14741 ) ) ( not ( = ?auto_14739 ?auto_14742 ) ) ( not ( = ?auto_14739 ?auto_14750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14740 ?auto_14741 ?auto_14742 )
      ( MAKE-3CRATE-VERIFY ?auto_14739 ?auto_14740 ?auto_14741 ?auto_14742 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14751 - SURFACE
      ?auto_14752 - SURFACE
      ?auto_14753 - SURFACE
      ?auto_14754 - SURFACE
      ?auto_14755 - SURFACE
    )
    :vars
    (
      ?auto_14756 - HOIST
      ?auto_14757 - PLACE
      ?auto_14759 - PLACE
      ?auto_14762 - HOIST
      ?auto_14763 - SURFACE
      ?auto_14761 - TRUCK
      ?auto_14758 - PLACE
      ?auto_14760 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14756 ?auto_14757 ) ( IS-CRATE ?auto_14755 ) ( not ( = ?auto_14754 ?auto_14755 ) ) ( not ( = ?auto_14753 ?auto_14754 ) ) ( not ( = ?auto_14753 ?auto_14755 ) ) ( not ( = ?auto_14759 ?auto_14757 ) ) ( HOIST-AT ?auto_14762 ?auto_14759 ) ( not ( = ?auto_14756 ?auto_14762 ) ) ( AVAILABLE ?auto_14762 ) ( SURFACE-AT ?auto_14755 ?auto_14759 ) ( ON ?auto_14755 ?auto_14763 ) ( CLEAR ?auto_14755 ) ( not ( = ?auto_14754 ?auto_14763 ) ) ( not ( = ?auto_14755 ?auto_14763 ) ) ( not ( = ?auto_14753 ?auto_14763 ) ) ( SURFACE-AT ?auto_14753 ?auto_14757 ) ( CLEAR ?auto_14753 ) ( IS-CRATE ?auto_14754 ) ( AVAILABLE ?auto_14756 ) ( TRUCK-AT ?auto_14761 ?auto_14758 ) ( not ( = ?auto_14758 ?auto_14757 ) ) ( not ( = ?auto_14759 ?auto_14758 ) ) ( HOIST-AT ?auto_14760 ?auto_14758 ) ( LIFTING ?auto_14760 ?auto_14754 ) ( not ( = ?auto_14756 ?auto_14760 ) ) ( not ( = ?auto_14762 ?auto_14760 ) ) ( ON ?auto_14752 ?auto_14751 ) ( ON ?auto_14753 ?auto_14752 ) ( not ( = ?auto_14751 ?auto_14752 ) ) ( not ( = ?auto_14751 ?auto_14753 ) ) ( not ( = ?auto_14751 ?auto_14754 ) ) ( not ( = ?auto_14751 ?auto_14755 ) ) ( not ( = ?auto_14751 ?auto_14763 ) ) ( not ( = ?auto_14752 ?auto_14753 ) ) ( not ( = ?auto_14752 ?auto_14754 ) ) ( not ( = ?auto_14752 ?auto_14755 ) ) ( not ( = ?auto_14752 ?auto_14763 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14753 ?auto_14754 ?auto_14755 )
      ( MAKE-4CRATE-VERIFY ?auto_14751 ?auto_14752 ?auto_14753 ?auto_14754 ?auto_14755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14764 - SURFACE
      ?auto_14765 - SURFACE
    )
    :vars
    (
      ?auto_14767 - HOIST
      ?auto_14768 - PLACE
      ?auto_14766 - SURFACE
      ?auto_14770 - PLACE
      ?auto_14773 - HOIST
      ?auto_14774 - SURFACE
      ?auto_14772 - TRUCK
      ?auto_14769 - PLACE
      ?auto_14771 - HOIST
      ?auto_14775 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14767 ?auto_14768 ) ( IS-CRATE ?auto_14765 ) ( not ( = ?auto_14764 ?auto_14765 ) ) ( not ( = ?auto_14766 ?auto_14764 ) ) ( not ( = ?auto_14766 ?auto_14765 ) ) ( not ( = ?auto_14770 ?auto_14768 ) ) ( HOIST-AT ?auto_14773 ?auto_14770 ) ( not ( = ?auto_14767 ?auto_14773 ) ) ( AVAILABLE ?auto_14773 ) ( SURFACE-AT ?auto_14765 ?auto_14770 ) ( ON ?auto_14765 ?auto_14774 ) ( CLEAR ?auto_14765 ) ( not ( = ?auto_14764 ?auto_14774 ) ) ( not ( = ?auto_14765 ?auto_14774 ) ) ( not ( = ?auto_14766 ?auto_14774 ) ) ( SURFACE-AT ?auto_14766 ?auto_14768 ) ( CLEAR ?auto_14766 ) ( IS-CRATE ?auto_14764 ) ( AVAILABLE ?auto_14767 ) ( TRUCK-AT ?auto_14772 ?auto_14769 ) ( not ( = ?auto_14769 ?auto_14768 ) ) ( not ( = ?auto_14770 ?auto_14769 ) ) ( HOIST-AT ?auto_14771 ?auto_14769 ) ( not ( = ?auto_14767 ?auto_14771 ) ) ( not ( = ?auto_14773 ?auto_14771 ) ) ( AVAILABLE ?auto_14771 ) ( SURFACE-AT ?auto_14764 ?auto_14769 ) ( ON ?auto_14764 ?auto_14775 ) ( CLEAR ?auto_14764 ) ( not ( = ?auto_14764 ?auto_14775 ) ) ( not ( = ?auto_14765 ?auto_14775 ) ) ( not ( = ?auto_14766 ?auto_14775 ) ) ( not ( = ?auto_14774 ?auto_14775 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14771 ?auto_14764 ?auto_14775 ?auto_14769 )
      ( MAKE-2CRATE ?auto_14766 ?auto_14764 ?auto_14765 )
      ( MAKE-1CRATE-VERIFY ?auto_14764 ?auto_14765 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14776 - SURFACE
      ?auto_14777 - SURFACE
      ?auto_14778 - SURFACE
    )
    :vars
    (
      ?auto_14781 - HOIST
      ?auto_14786 - PLACE
      ?auto_14779 - PLACE
      ?auto_14784 - HOIST
      ?auto_14783 - SURFACE
      ?auto_14780 - TRUCK
      ?auto_14785 - PLACE
      ?auto_14782 - HOIST
      ?auto_14787 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14781 ?auto_14786 ) ( IS-CRATE ?auto_14778 ) ( not ( = ?auto_14777 ?auto_14778 ) ) ( not ( = ?auto_14776 ?auto_14777 ) ) ( not ( = ?auto_14776 ?auto_14778 ) ) ( not ( = ?auto_14779 ?auto_14786 ) ) ( HOIST-AT ?auto_14784 ?auto_14779 ) ( not ( = ?auto_14781 ?auto_14784 ) ) ( AVAILABLE ?auto_14784 ) ( SURFACE-AT ?auto_14778 ?auto_14779 ) ( ON ?auto_14778 ?auto_14783 ) ( CLEAR ?auto_14778 ) ( not ( = ?auto_14777 ?auto_14783 ) ) ( not ( = ?auto_14778 ?auto_14783 ) ) ( not ( = ?auto_14776 ?auto_14783 ) ) ( SURFACE-AT ?auto_14776 ?auto_14786 ) ( CLEAR ?auto_14776 ) ( IS-CRATE ?auto_14777 ) ( AVAILABLE ?auto_14781 ) ( TRUCK-AT ?auto_14780 ?auto_14785 ) ( not ( = ?auto_14785 ?auto_14786 ) ) ( not ( = ?auto_14779 ?auto_14785 ) ) ( HOIST-AT ?auto_14782 ?auto_14785 ) ( not ( = ?auto_14781 ?auto_14782 ) ) ( not ( = ?auto_14784 ?auto_14782 ) ) ( AVAILABLE ?auto_14782 ) ( SURFACE-AT ?auto_14777 ?auto_14785 ) ( ON ?auto_14777 ?auto_14787 ) ( CLEAR ?auto_14777 ) ( not ( = ?auto_14777 ?auto_14787 ) ) ( not ( = ?auto_14778 ?auto_14787 ) ) ( not ( = ?auto_14776 ?auto_14787 ) ) ( not ( = ?auto_14783 ?auto_14787 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14777 ?auto_14778 )
      ( MAKE-2CRATE-VERIFY ?auto_14776 ?auto_14777 ?auto_14778 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14788 - SURFACE
      ?auto_14789 - SURFACE
      ?auto_14790 - SURFACE
      ?auto_14791 - SURFACE
    )
    :vars
    (
      ?auto_14793 - HOIST
      ?auto_14800 - PLACE
      ?auto_14792 - PLACE
      ?auto_14795 - HOIST
      ?auto_14797 - SURFACE
      ?auto_14798 - TRUCK
      ?auto_14799 - PLACE
      ?auto_14796 - HOIST
      ?auto_14794 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14793 ?auto_14800 ) ( IS-CRATE ?auto_14791 ) ( not ( = ?auto_14790 ?auto_14791 ) ) ( not ( = ?auto_14789 ?auto_14790 ) ) ( not ( = ?auto_14789 ?auto_14791 ) ) ( not ( = ?auto_14792 ?auto_14800 ) ) ( HOIST-AT ?auto_14795 ?auto_14792 ) ( not ( = ?auto_14793 ?auto_14795 ) ) ( AVAILABLE ?auto_14795 ) ( SURFACE-AT ?auto_14791 ?auto_14792 ) ( ON ?auto_14791 ?auto_14797 ) ( CLEAR ?auto_14791 ) ( not ( = ?auto_14790 ?auto_14797 ) ) ( not ( = ?auto_14791 ?auto_14797 ) ) ( not ( = ?auto_14789 ?auto_14797 ) ) ( SURFACE-AT ?auto_14789 ?auto_14800 ) ( CLEAR ?auto_14789 ) ( IS-CRATE ?auto_14790 ) ( AVAILABLE ?auto_14793 ) ( TRUCK-AT ?auto_14798 ?auto_14799 ) ( not ( = ?auto_14799 ?auto_14800 ) ) ( not ( = ?auto_14792 ?auto_14799 ) ) ( HOIST-AT ?auto_14796 ?auto_14799 ) ( not ( = ?auto_14793 ?auto_14796 ) ) ( not ( = ?auto_14795 ?auto_14796 ) ) ( AVAILABLE ?auto_14796 ) ( SURFACE-AT ?auto_14790 ?auto_14799 ) ( ON ?auto_14790 ?auto_14794 ) ( CLEAR ?auto_14790 ) ( not ( = ?auto_14790 ?auto_14794 ) ) ( not ( = ?auto_14791 ?auto_14794 ) ) ( not ( = ?auto_14789 ?auto_14794 ) ) ( not ( = ?auto_14797 ?auto_14794 ) ) ( ON ?auto_14789 ?auto_14788 ) ( not ( = ?auto_14788 ?auto_14789 ) ) ( not ( = ?auto_14788 ?auto_14790 ) ) ( not ( = ?auto_14788 ?auto_14791 ) ) ( not ( = ?auto_14788 ?auto_14797 ) ) ( not ( = ?auto_14788 ?auto_14794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14789 ?auto_14790 ?auto_14791 )
      ( MAKE-3CRATE-VERIFY ?auto_14788 ?auto_14789 ?auto_14790 ?auto_14791 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14801 - SURFACE
      ?auto_14802 - SURFACE
      ?auto_14803 - SURFACE
      ?auto_14804 - SURFACE
      ?auto_14805 - SURFACE
    )
    :vars
    (
      ?auto_14807 - HOIST
      ?auto_14814 - PLACE
      ?auto_14806 - PLACE
      ?auto_14809 - HOIST
      ?auto_14811 - SURFACE
      ?auto_14812 - TRUCK
      ?auto_14813 - PLACE
      ?auto_14810 - HOIST
      ?auto_14808 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14807 ?auto_14814 ) ( IS-CRATE ?auto_14805 ) ( not ( = ?auto_14804 ?auto_14805 ) ) ( not ( = ?auto_14803 ?auto_14804 ) ) ( not ( = ?auto_14803 ?auto_14805 ) ) ( not ( = ?auto_14806 ?auto_14814 ) ) ( HOIST-AT ?auto_14809 ?auto_14806 ) ( not ( = ?auto_14807 ?auto_14809 ) ) ( AVAILABLE ?auto_14809 ) ( SURFACE-AT ?auto_14805 ?auto_14806 ) ( ON ?auto_14805 ?auto_14811 ) ( CLEAR ?auto_14805 ) ( not ( = ?auto_14804 ?auto_14811 ) ) ( not ( = ?auto_14805 ?auto_14811 ) ) ( not ( = ?auto_14803 ?auto_14811 ) ) ( SURFACE-AT ?auto_14803 ?auto_14814 ) ( CLEAR ?auto_14803 ) ( IS-CRATE ?auto_14804 ) ( AVAILABLE ?auto_14807 ) ( TRUCK-AT ?auto_14812 ?auto_14813 ) ( not ( = ?auto_14813 ?auto_14814 ) ) ( not ( = ?auto_14806 ?auto_14813 ) ) ( HOIST-AT ?auto_14810 ?auto_14813 ) ( not ( = ?auto_14807 ?auto_14810 ) ) ( not ( = ?auto_14809 ?auto_14810 ) ) ( AVAILABLE ?auto_14810 ) ( SURFACE-AT ?auto_14804 ?auto_14813 ) ( ON ?auto_14804 ?auto_14808 ) ( CLEAR ?auto_14804 ) ( not ( = ?auto_14804 ?auto_14808 ) ) ( not ( = ?auto_14805 ?auto_14808 ) ) ( not ( = ?auto_14803 ?auto_14808 ) ) ( not ( = ?auto_14811 ?auto_14808 ) ) ( ON ?auto_14802 ?auto_14801 ) ( ON ?auto_14803 ?auto_14802 ) ( not ( = ?auto_14801 ?auto_14802 ) ) ( not ( = ?auto_14801 ?auto_14803 ) ) ( not ( = ?auto_14801 ?auto_14804 ) ) ( not ( = ?auto_14801 ?auto_14805 ) ) ( not ( = ?auto_14801 ?auto_14811 ) ) ( not ( = ?auto_14801 ?auto_14808 ) ) ( not ( = ?auto_14802 ?auto_14803 ) ) ( not ( = ?auto_14802 ?auto_14804 ) ) ( not ( = ?auto_14802 ?auto_14805 ) ) ( not ( = ?auto_14802 ?auto_14811 ) ) ( not ( = ?auto_14802 ?auto_14808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14803 ?auto_14804 ?auto_14805 )
      ( MAKE-4CRATE-VERIFY ?auto_14801 ?auto_14802 ?auto_14803 ?auto_14804 ?auto_14805 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14815 - SURFACE
      ?auto_14816 - SURFACE
    )
    :vars
    (
      ?auto_14818 - HOIST
      ?auto_14826 - PLACE
      ?auto_14821 - SURFACE
      ?auto_14817 - PLACE
      ?auto_14820 - HOIST
      ?auto_14823 - SURFACE
      ?auto_14825 - PLACE
      ?auto_14822 - HOIST
      ?auto_14819 - SURFACE
      ?auto_14824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14818 ?auto_14826 ) ( IS-CRATE ?auto_14816 ) ( not ( = ?auto_14815 ?auto_14816 ) ) ( not ( = ?auto_14821 ?auto_14815 ) ) ( not ( = ?auto_14821 ?auto_14816 ) ) ( not ( = ?auto_14817 ?auto_14826 ) ) ( HOIST-AT ?auto_14820 ?auto_14817 ) ( not ( = ?auto_14818 ?auto_14820 ) ) ( AVAILABLE ?auto_14820 ) ( SURFACE-AT ?auto_14816 ?auto_14817 ) ( ON ?auto_14816 ?auto_14823 ) ( CLEAR ?auto_14816 ) ( not ( = ?auto_14815 ?auto_14823 ) ) ( not ( = ?auto_14816 ?auto_14823 ) ) ( not ( = ?auto_14821 ?auto_14823 ) ) ( SURFACE-AT ?auto_14821 ?auto_14826 ) ( CLEAR ?auto_14821 ) ( IS-CRATE ?auto_14815 ) ( AVAILABLE ?auto_14818 ) ( not ( = ?auto_14825 ?auto_14826 ) ) ( not ( = ?auto_14817 ?auto_14825 ) ) ( HOIST-AT ?auto_14822 ?auto_14825 ) ( not ( = ?auto_14818 ?auto_14822 ) ) ( not ( = ?auto_14820 ?auto_14822 ) ) ( AVAILABLE ?auto_14822 ) ( SURFACE-AT ?auto_14815 ?auto_14825 ) ( ON ?auto_14815 ?auto_14819 ) ( CLEAR ?auto_14815 ) ( not ( = ?auto_14815 ?auto_14819 ) ) ( not ( = ?auto_14816 ?auto_14819 ) ) ( not ( = ?auto_14821 ?auto_14819 ) ) ( not ( = ?auto_14823 ?auto_14819 ) ) ( TRUCK-AT ?auto_14824 ?auto_14826 ) )
    :subtasks
    ( ( !DRIVE ?auto_14824 ?auto_14826 ?auto_14825 )
      ( MAKE-2CRATE ?auto_14821 ?auto_14815 ?auto_14816 )
      ( MAKE-1CRATE-VERIFY ?auto_14815 ?auto_14816 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14827 - SURFACE
      ?auto_14828 - SURFACE
      ?auto_14829 - SURFACE
    )
    :vars
    (
      ?auto_14832 - HOIST
      ?auto_14837 - PLACE
      ?auto_14838 - PLACE
      ?auto_14831 - HOIST
      ?auto_14836 - SURFACE
      ?auto_14835 - PLACE
      ?auto_14830 - HOIST
      ?auto_14833 - SURFACE
      ?auto_14834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14832 ?auto_14837 ) ( IS-CRATE ?auto_14829 ) ( not ( = ?auto_14828 ?auto_14829 ) ) ( not ( = ?auto_14827 ?auto_14828 ) ) ( not ( = ?auto_14827 ?auto_14829 ) ) ( not ( = ?auto_14838 ?auto_14837 ) ) ( HOIST-AT ?auto_14831 ?auto_14838 ) ( not ( = ?auto_14832 ?auto_14831 ) ) ( AVAILABLE ?auto_14831 ) ( SURFACE-AT ?auto_14829 ?auto_14838 ) ( ON ?auto_14829 ?auto_14836 ) ( CLEAR ?auto_14829 ) ( not ( = ?auto_14828 ?auto_14836 ) ) ( not ( = ?auto_14829 ?auto_14836 ) ) ( not ( = ?auto_14827 ?auto_14836 ) ) ( SURFACE-AT ?auto_14827 ?auto_14837 ) ( CLEAR ?auto_14827 ) ( IS-CRATE ?auto_14828 ) ( AVAILABLE ?auto_14832 ) ( not ( = ?auto_14835 ?auto_14837 ) ) ( not ( = ?auto_14838 ?auto_14835 ) ) ( HOIST-AT ?auto_14830 ?auto_14835 ) ( not ( = ?auto_14832 ?auto_14830 ) ) ( not ( = ?auto_14831 ?auto_14830 ) ) ( AVAILABLE ?auto_14830 ) ( SURFACE-AT ?auto_14828 ?auto_14835 ) ( ON ?auto_14828 ?auto_14833 ) ( CLEAR ?auto_14828 ) ( not ( = ?auto_14828 ?auto_14833 ) ) ( not ( = ?auto_14829 ?auto_14833 ) ) ( not ( = ?auto_14827 ?auto_14833 ) ) ( not ( = ?auto_14836 ?auto_14833 ) ) ( TRUCK-AT ?auto_14834 ?auto_14837 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14828 ?auto_14829 )
      ( MAKE-2CRATE-VERIFY ?auto_14827 ?auto_14828 ?auto_14829 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14839 - SURFACE
      ?auto_14840 - SURFACE
      ?auto_14841 - SURFACE
      ?auto_14842 - SURFACE
    )
    :vars
    (
      ?auto_14845 - HOIST
      ?auto_14844 - PLACE
      ?auto_14847 - PLACE
      ?auto_14846 - HOIST
      ?auto_14848 - SURFACE
      ?auto_14851 - PLACE
      ?auto_14849 - HOIST
      ?auto_14843 - SURFACE
      ?auto_14850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14845 ?auto_14844 ) ( IS-CRATE ?auto_14842 ) ( not ( = ?auto_14841 ?auto_14842 ) ) ( not ( = ?auto_14840 ?auto_14841 ) ) ( not ( = ?auto_14840 ?auto_14842 ) ) ( not ( = ?auto_14847 ?auto_14844 ) ) ( HOIST-AT ?auto_14846 ?auto_14847 ) ( not ( = ?auto_14845 ?auto_14846 ) ) ( AVAILABLE ?auto_14846 ) ( SURFACE-AT ?auto_14842 ?auto_14847 ) ( ON ?auto_14842 ?auto_14848 ) ( CLEAR ?auto_14842 ) ( not ( = ?auto_14841 ?auto_14848 ) ) ( not ( = ?auto_14842 ?auto_14848 ) ) ( not ( = ?auto_14840 ?auto_14848 ) ) ( SURFACE-AT ?auto_14840 ?auto_14844 ) ( CLEAR ?auto_14840 ) ( IS-CRATE ?auto_14841 ) ( AVAILABLE ?auto_14845 ) ( not ( = ?auto_14851 ?auto_14844 ) ) ( not ( = ?auto_14847 ?auto_14851 ) ) ( HOIST-AT ?auto_14849 ?auto_14851 ) ( not ( = ?auto_14845 ?auto_14849 ) ) ( not ( = ?auto_14846 ?auto_14849 ) ) ( AVAILABLE ?auto_14849 ) ( SURFACE-AT ?auto_14841 ?auto_14851 ) ( ON ?auto_14841 ?auto_14843 ) ( CLEAR ?auto_14841 ) ( not ( = ?auto_14841 ?auto_14843 ) ) ( not ( = ?auto_14842 ?auto_14843 ) ) ( not ( = ?auto_14840 ?auto_14843 ) ) ( not ( = ?auto_14848 ?auto_14843 ) ) ( TRUCK-AT ?auto_14850 ?auto_14844 ) ( ON ?auto_14840 ?auto_14839 ) ( not ( = ?auto_14839 ?auto_14840 ) ) ( not ( = ?auto_14839 ?auto_14841 ) ) ( not ( = ?auto_14839 ?auto_14842 ) ) ( not ( = ?auto_14839 ?auto_14848 ) ) ( not ( = ?auto_14839 ?auto_14843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14840 ?auto_14841 ?auto_14842 )
      ( MAKE-3CRATE-VERIFY ?auto_14839 ?auto_14840 ?auto_14841 ?auto_14842 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14852 - SURFACE
      ?auto_14853 - SURFACE
      ?auto_14854 - SURFACE
      ?auto_14855 - SURFACE
      ?auto_14856 - SURFACE
    )
    :vars
    (
      ?auto_14859 - HOIST
      ?auto_14858 - PLACE
      ?auto_14861 - PLACE
      ?auto_14860 - HOIST
      ?auto_14862 - SURFACE
      ?auto_14865 - PLACE
      ?auto_14863 - HOIST
      ?auto_14857 - SURFACE
      ?auto_14864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14859 ?auto_14858 ) ( IS-CRATE ?auto_14856 ) ( not ( = ?auto_14855 ?auto_14856 ) ) ( not ( = ?auto_14854 ?auto_14855 ) ) ( not ( = ?auto_14854 ?auto_14856 ) ) ( not ( = ?auto_14861 ?auto_14858 ) ) ( HOIST-AT ?auto_14860 ?auto_14861 ) ( not ( = ?auto_14859 ?auto_14860 ) ) ( AVAILABLE ?auto_14860 ) ( SURFACE-AT ?auto_14856 ?auto_14861 ) ( ON ?auto_14856 ?auto_14862 ) ( CLEAR ?auto_14856 ) ( not ( = ?auto_14855 ?auto_14862 ) ) ( not ( = ?auto_14856 ?auto_14862 ) ) ( not ( = ?auto_14854 ?auto_14862 ) ) ( SURFACE-AT ?auto_14854 ?auto_14858 ) ( CLEAR ?auto_14854 ) ( IS-CRATE ?auto_14855 ) ( AVAILABLE ?auto_14859 ) ( not ( = ?auto_14865 ?auto_14858 ) ) ( not ( = ?auto_14861 ?auto_14865 ) ) ( HOIST-AT ?auto_14863 ?auto_14865 ) ( not ( = ?auto_14859 ?auto_14863 ) ) ( not ( = ?auto_14860 ?auto_14863 ) ) ( AVAILABLE ?auto_14863 ) ( SURFACE-AT ?auto_14855 ?auto_14865 ) ( ON ?auto_14855 ?auto_14857 ) ( CLEAR ?auto_14855 ) ( not ( = ?auto_14855 ?auto_14857 ) ) ( not ( = ?auto_14856 ?auto_14857 ) ) ( not ( = ?auto_14854 ?auto_14857 ) ) ( not ( = ?auto_14862 ?auto_14857 ) ) ( TRUCK-AT ?auto_14864 ?auto_14858 ) ( ON ?auto_14853 ?auto_14852 ) ( ON ?auto_14854 ?auto_14853 ) ( not ( = ?auto_14852 ?auto_14853 ) ) ( not ( = ?auto_14852 ?auto_14854 ) ) ( not ( = ?auto_14852 ?auto_14855 ) ) ( not ( = ?auto_14852 ?auto_14856 ) ) ( not ( = ?auto_14852 ?auto_14862 ) ) ( not ( = ?auto_14852 ?auto_14857 ) ) ( not ( = ?auto_14853 ?auto_14854 ) ) ( not ( = ?auto_14853 ?auto_14855 ) ) ( not ( = ?auto_14853 ?auto_14856 ) ) ( not ( = ?auto_14853 ?auto_14862 ) ) ( not ( = ?auto_14853 ?auto_14857 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14854 ?auto_14855 ?auto_14856 )
      ( MAKE-4CRATE-VERIFY ?auto_14852 ?auto_14853 ?auto_14854 ?auto_14855 ?auto_14856 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14866 - SURFACE
      ?auto_14867 - SURFACE
    )
    :vars
    (
      ?auto_14870 - HOIST
      ?auto_14869 - PLACE
      ?auto_14872 - SURFACE
      ?auto_14873 - PLACE
      ?auto_14871 - HOIST
      ?auto_14874 - SURFACE
      ?auto_14877 - PLACE
      ?auto_14875 - HOIST
      ?auto_14868 - SURFACE
      ?auto_14876 - TRUCK
      ?auto_14878 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14870 ?auto_14869 ) ( IS-CRATE ?auto_14867 ) ( not ( = ?auto_14866 ?auto_14867 ) ) ( not ( = ?auto_14872 ?auto_14866 ) ) ( not ( = ?auto_14872 ?auto_14867 ) ) ( not ( = ?auto_14873 ?auto_14869 ) ) ( HOIST-AT ?auto_14871 ?auto_14873 ) ( not ( = ?auto_14870 ?auto_14871 ) ) ( AVAILABLE ?auto_14871 ) ( SURFACE-AT ?auto_14867 ?auto_14873 ) ( ON ?auto_14867 ?auto_14874 ) ( CLEAR ?auto_14867 ) ( not ( = ?auto_14866 ?auto_14874 ) ) ( not ( = ?auto_14867 ?auto_14874 ) ) ( not ( = ?auto_14872 ?auto_14874 ) ) ( IS-CRATE ?auto_14866 ) ( not ( = ?auto_14877 ?auto_14869 ) ) ( not ( = ?auto_14873 ?auto_14877 ) ) ( HOIST-AT ?auto_14875 ?auto_14877 ) ( not ( = ?auto_14870 ?auto_14875 ) ) ( not ( = ?auto_14871 ?auto_14875 ) ) ( AVAILABLE ?auto_14875 ) ( SURFACE-AT ?auto_14866 ?auto_14877 ) ( ON ?auto_14866 ?auto_14868 ) ( CLEAR ?auto_14866 ) ( not ( = ?auto_14866 ?auto_14868 ) ) ( not ( = ?auto_14867 ?auto_14868 ) ) ( not ( = ?auto_14872 ?auto_14868 ) ) ( not ( = ?auto_14874 ?auto_14868 ) ) ( TRUCK-AT ?auto_14876 ?auto_14869 ) ( SURFACE-AT ?auto_14878 ?auto_14869 ) ( CLEAR ?auto_14878 ) ( LIFTING ?auto_14870 ?auto_14872 ) ( IS-CRATE ?auto_14872 ) ( not ( = ?auto_14878 ?auto_14872 ) ) ( not ( = ?auto_14866 ?auto_14878 ) ) ( not ( = ?auto_14867 ?auto_14878 ) ) ( not ( = ?auto_14874 ?auto_14878 ) ) ( not ( = ?auto_14868 ?auto_14878 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14878 ?auto_14872 )
      ( MAKE-2CRATE ?auto_14872 ?auto_14866 ?auto_14867 )
      ( MAKE-1CRATE-VERIFY ?auto_14866 ?auto_14867 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14879 - SURFACE
      ?auto_14880 - SURFACE
      ?auto_14881 - SURFACE
    )
    :vars
    (
      ?auto_14890 - HOIST
      ?auto_14885 - PLACE
      ?auto_14883 - PLACE
      ?auto_14891 - HOIST
      ?auto_14888 - SURFACE
      ?auto_14882 - PLACE
      ?auto_14884 - HOIST
      ?auto_14886 - SURFACE
      ?auto_14887 - TRUCK
      ?auto_14889 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14890 ?auto_14885 ) ( IS-CRATE ?auto_14881 ) ( not ( = ?auto_14880 ?auto_14881 ) ) ( not ( = ?auto_14879 ?auto_14880 ) ) ( not ( = ?auto_14879 ?auto_14881 ) ) ( not ( = ?auto_14883 ?auto_14885 ) ) ( HOIST-AT ?auto_14891 ?auto_14883 ) ( not ( = ?auto_14890 ?auto_14891 ) ) ( AVAILABLE ?auto_14891 ) ( SURFACE-AT ?auto_14881 ?auto_14883 ) ( ON ?auto_14881 ?auto_14888 ) ( CLEAR ?auto_14881 ) ( not ( = ?auto_14880 ?auto_14888 ) ) ( not ( = ?auto_14881 ?auto_14888 ) ) ( not ( = ?auto_14879 ?auto_14888 ) ) ( IS-CRATE ?auto_14880 ) ( not ( = ?auto_14882 ?auto_14885 ) ) ( not ( = ?auto_14883 ?auto_14882 ) ) ( HOIST-AT ?auto_14884 ?auto_14882 ) ( not ( = ?auto_14890 ?auto_14884 ) ) ( not ( = ?auto_14891 ?auto_14884 ) ) ( AVAILABLE ?auto_14884 ) ( SURFACE-AT ?auto_14880 ?auto_14882 ) ( ON ?auto_14880 ?auto_14886 ) ( CLEAR ?auto_14880 ) ( not ( = ?auto_14880 ?auto_14886 ) ) ( not ( = ?auto_14881 ?auto_14886 ) ) ( not ( = ?auto_14879 ?auto_14886 ) ) ( not ( = ?auto_14888 ?auto_14886 ) ) ( TRUCK-AT ?auto_14887 ?auto_14885 ) ( SURFACE-AT ?auto_14889 ?auto_14885 ) ( CLEAR ?auto_14889 ) ( LIFTING ?auto_14890 ?auto_14879 ) ( IS-CRATE ?auto_14879 ) ( not ( = ?auto_14889 ?auto_14879 ) ) ( not ( = ?auto_14880 ?auto_14889 ) ) ( not ( = ?auto_14881 ?auto_14889 ) ) ( not ( = ?auto_14888 ?auto_14889 ) ) ( not ( = ?auto_14886 ?auto_14889 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14880 ?auto_14881 )
      ( MAKE-2CRATE-VERIFY ?auto_14879 ?auto_14880 ?auto_14881 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14892 - SURFACE
      ?auto_14893 - SURFACE
      ?auto_14894 - SURFACE
      ?auto_14895 - SURFACE
    )
    :vars
    (
      ?auto_14897 - HOIST
      ?auto_14903 - PLACE
      ?auto_14899 - PLACE
      ?auto_14904 - HOIST
      ?auto_14901 - SURFACE
      ?auto_14898 - PLACE
      ?auto_14902 - HOIST
      ?auto_14900 - SURFACE
      ?auto_14896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14897 ?auto_14903 ) ( IS-CRATE ?auto_14895 ) ( not ( = ?auto_14894 ?auto_14895 ) ) ( not ( = ?auto_14893 ?auto_14894 ) ) ( not ( = ?auto_14893 ?auto_14895 ) ) ( not ( = ?auto_14899 ?auto_14903 ) ) ( HOIST-AT ?auto_14904 ?auto_14899 ) ( not ( = ?auto_14897 ?auto_14904 ) ) ( AVAILABLE ?auto_14904 ) ( SURFACE-AT ?auto_14895 ?auto_14899 ) ( ON ?auto_14895 ?auto_14901 ) ( CLEAR ?auto_14895 ) ( not ( = ?auto_14894 ?auto_14901 ) ) ( not ( = ?auto_14895 ?auto_14901 ) ) ( not ( = ?auto_14893 ?auto_14901 ) ) ( IS-CRATE ?auto_14894 ) ( not ( = ?auto_14898 ?auto_14903 ) ) ( not ( = ?auto_14899 ?auto_14898 ) ) ( HOIST-AT ?auto_14902 ?auto_14898 ) ( not ( = ?auto_14897 ?auto_14902 ) ) ( not ( = ?auto_14904 ?auto_14902 ) ) ( AVAILABLE ?auto_14902 ) ( SURFACE-AT ?auto_14894 ?auto_14898 ) ( ON ?auto_14894 ?auto_14900 ) ( CLEAR ?auto_14894 ) ( not ( = ?auto_14894 ?auto_14900 ) ) ( not ( = ?auto_14895 ?auto_14900 ) ) ( not ( = ?auto_14893 ?auto_14900 ) ) ( not ( = ?auto_14901 ?auto_14900 ) ) ( TRUCK-AT ?auto_14896 ?auto_14903 ) ( SURFACE-AT ?auto_14892 ?auto_14903 ) ( CLEAR ?auto_14892 ) ( LIFTING ?auto_14897 ?auto_14893 ) ( IS-CRATE ?auto_14893 ) ( not ( = ?auto_14892 ?auto_14893 ) ) ( not ( = ?auto_14894 ?auto_14892 ) ) ( not ( = ?auto_14895 ?auto_14892 ) ) ( not ( = ?auto_14901 ?auto_14892 ) ) ( not ( = ?auto_14900 ?auto_14892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14893 ?auto_14894 ?auto_14895 )
      ( MAKE-3CRATE-VERIFY ?auto_14892 ?auto_14893 ?auto_14894 ?auto_14895 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14905 - SURFACE
      ?auto_14906 - SURFACE
      ?auto_14907 - SURFACE
      ?auto_14908 - SURFACE
      ?auto_14909 - SURFACE
    )
    :vars
    (
      ?auto_14911 - HOIST
      ?auto_14917 - PLACE
      ?auto_14913 - PLACE
      ?auto_14918 - HOIST
      ?auto_14915 - SURFACE
      ?auto_14912 - PLACE
      ?auto_14916 - HOIST
      ?auto_14914 - SURFACE
      ?auto_14910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14911 ?auto_14917 ) ( IS-CRATE ?auto_14909 ) ( not ( = ?auto_14908 ?auto_14909 ) ) ( not ( = ?auto_14907 ?auto_14908 ) ) ( not ( = ?auto_14907 ?auto_14909 ) ) ( not ( = ?auto_14913 ?auto_14917 ) ) ( HOIST-AT ?auto_14918 ?auto_14913 ) ( not ( = ?auto_14911 ?auto_14918 ) ) ( AVAILABLE ?auto_14918 ) ( SURFACE-AT ?auto_14909 ?auto_14913 ) ( ON ?auto_14909 ?auto_14915 ) ( CLEAR ?auto_14909 ) ( not ( = ?auto_14908 ?auto_14915 ) ) ( not ( = ?auto_14909 ?auto_14915 ) ) ( not ( = ?auto_14907 ?auto_14915 ) ) ( IS-CRATE ?auto_14908 ) ( not ( = ?auto_14912 ?auto_14917 ) ) ( not ( = ?auto_14913 ?auto_14912 ) ) ( HOIST-AT ?auto_14916 ?auto_14912 ) ( not ( = ?auto_14911 ?auto_14916 ) ) ( not ( = ?auto_14918 ?auto_14916 ) ) ( AVAILABLE ?auto_14916 ) ( SURFACE-AT ?auto_14908 ?auto_14912 ) ( ON ?auto_14908 ?auto_14914 ) ( CLEAR ?auto_14908 ) ( not ( = ?auto_14908 ?auto_14914 ) ) ( not ( = ?auto_14909 ?auto_14914 ) ) ( not ( = ?auto_14907 ?auto_14914 ) ) ( not ( = ?auto_14915 ?auto_14914 ) ) ( TRUCK-AT ?auto_14910 ?auto_14917 ) ( SURFACE-AT ?auto_14906 ?auto_14917 ) ( CLEAR ?auto_14906 ) ( LIFTING ?auto_14911 ?auto_14907 ) ( IS-CRATE ?auto_14907 ) ( not ( = ?auto_14906 ?auto_14907 ) ) ( not ( = ?auto_14908 ?auto_14906 ) ) ( not ( = ?auto_14909 ?auto_14906 ) ) ( not ( = ?auto_14915 ?auto_14906 ) ) ( not ( = ?auto_14914 ?auto_14906 ) ) ( ON ?auto_14906 ?auto_14905 ) ( not ( = ?auto_14905 ?auto_14906 ) ) ( not ( = ?auto_14905 ?auto_14907 ) ) ( not ( = ?auto_14905 ?auto_14908 ) ) ( not ( = ?auto_14905 ?auto_14909 ) ) ( not ( = ?auto_14905 ?auto_14915 ) ) ( not ( = ?auto_14905 ?auto_14914 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14907 ?auto_14908 ?auto_14909 )
      ( MAKE-4CRATE-VERIFY ?auto_14905 ?auto_14906 ?auto_14907 ?auto_14908 ?auto_14909 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14919 - SURFACE
      ?auto_14920 - SURFACE
    )
    :vars
    (
      ?auto_14923 - HOIST
      ?auto_14930 - PLACE
      ?auto_14921 - SURFACE
      ?auto_14926 - PLACE
      ?auto_14931 - HOIST
      ?auto_14928 - SURFACE
      ?auto_14924 - PLACE
      ?auto_14929 - HOIST
      ?auto_14927 - SURFACE
      ?auto_14922 - TRUCK
      ?auto_14925 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14923 ?auto_14930 ) ( IS-CRATE ?auto_14920 ) ( not ( = ?auto_14919 ?auto_14920 ) ) ( not ( = ?auto_14921 ?auto_14919 ) ) ( not ( = ?auto_14921 ?auto_14920 ) ) ( not ( = ?auto_14926 ?auto_14930 ) ) ( HOIST-AT ?auto_14931 ?auto_14926 ) ( not ( = ?auto_14923 ?auto_14931 ) ) ( AVAILABLE ?auto_14931 ) ( SURFACE-AT ?auto_14920 ?auto_14926 ) ( ON ?auto_14920 ?auto_14928 ) ( CLEAR ?auto_14920 ) ( not ( = ?auto_14919 ?auto_14928 ) ) ( not ( = ?auto_14920 ?auto_14928 ) ) ( not ( = ?auto_14921 ?auto_14928 ) ) ( IS-CRATE ?auto_14919 ) ( not ( = ?auto_14924 ?auto_14930 ) ) ( not ( = ?auto_14926 ?auto_14924 ) ) ( HOIST-AT ?auto_14929 ?auto_14924 ) ( not ( = ?auto_14923 ?auto_14929 ) ) ( not ( = ?auto_14931 ?auto_14929 ) ) ( AVAILABLE ?auto_14929 ) ( SURFACE-AT ?auto_14919 ?auto_14924 ) ( ON ?auto_14919 ?auto_14927 ) ( CLEAR ?auto_14919 ) ( not ( = ?auto_14919 ?auto_14927 ) ) ( not ( = ?auto_14920 ?auto_14927 ) ) ( not ( = ?auto_14921 ?auto_14927 ) ) ( not ( = ?auto_14928 ?auto_14927 ) ) ( TRUCK-AT ?auto_14922 ?auto_14930 ) ( SURFACE-AT ?auto_14925 ?auto_14930 ) ( CLEAR ?auto_14925 ) ( IS-CRATE ?auto_14921 ) ( not ( = ?auto_14925 ?auto_14921 ) ) ( not ( = ?auto_14919 ?auto_14925 ) ) ( not ( = ?auto_14920 ?auto_14925 ) ) ( not ( = ?auto_14928 ?auto_14925 ) ) ( not ( = ?auto_14927 ?auto_14925 ) ) ( AVAILABLE ?auto_14923 ) ( IN ?auto_14921 ?auto_14922 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14923 ?auto_14921 ?auto_14922 ?auto_14930 )
      ( MAKE-2CRATE ?auto_14921 ?auto_14919 ?auto_14920 )
      ( MAKE-1CRATE-VERIFY ?auto_14919 ?auto_14920 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14932 - SURFACE
      ?auto_14933 - SURFACE
      ?auto_14934 - SURFACE
    )
    :vars
    (
      ?auto_14944 - HOIST
      ?auto_14935 - PLACE
      ?auto_14939 - PLACE
      ?auto_14940 - HOIST
      ?auto_14941 - SURFACE
      ?auto_14942 - PLACE
      ?auto_14936 - HOIST
      ?auto_14943 - SURFACE
      ?auto_14938 - TRUCK
      ?auto_14937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14944 ?auto_14935 ) ( IS-CRATE ?auto_14934 ) ( not ( = ?auto_14933 ?auto_14934 ) ) ( not ( = ?auto_14932 ?auto_14933 ) ) ( not ( = ?auto_14932 ?auto_14934 ) ) ( not ( = ?auto_14939 ?auto_14935 ) ) ( HOIST-AT ?auto_14940 ?auto_14939 ) ( not ( = ?auto_14944 ?auto_14940 ) ) ( AVAILABLE ?auto_14940 ) ( SURFACE-AT ?auto_14934 ?auto_14939 ) ( ON ?auto_14934 ?auto_14941 ) ( CLEAR ?auto_14934 ) ( not ( = ?auto_14933 ?auto_14941 ) ) ( not ( = ?auto_14934 ?auto_14941 ) ) ( not ( = ?auto_14932 ?auto_14941 ) ) ( IS-CRATE ?auto_14933 ) ( not ( = ?auto_14942 ?auto_14935 ) ) ( not ( = ?auto_14939 ?auto_14942 ) ) ( HOIST-AT ?auto_14936 ?auto_14942 ) ( not ( = ?auto_14944 ?auto_14936 ) ) ( not ( = ?auto_14940 ?auto_14936 ) ) ( AVAILABLE ?auto_14936 ) ( SURFACE-AT ?auto_14933 ?auto_14942 ) ( ON ?auto_14933 ?auto_14943 ) ( CLEAR ?auto_14933 ) ( not ( = ?auto_14933 ?auto_14943 ) ) ( not ( = ?auto_14934 ?auto_14943 ) ) ( not ( = ?auto_14932 ?auto_14943 ) ) ( not ( = ?auto_14941 ?auto_14943 ) ) ( TRUCK-AT ?auto_14938 ?auto_14935 ) ( SURFACE-AT ?auto_14937 ?auto_14935 ) ( CLEAR ?auto_14937 ) ( IS-CRATE ?auto_14932 ) ( not ( = ?auto_14937 ?auto_14932 ) ) ( not ( = ?auto_14933 ?auto_14937 ) ) ( not ( = ?auto_14934 ?auto_14937 ) ) ( not ( = ?auto_14941 ?auto_14937 ) ) ( not ( = ?auto_14943 ?auto_14937 ) ) ( AVAILABLE ?auto_14944 ) ( IN ?auto_14932 ?auto_14938 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14933 ?auto_14934 )
      ( MAKE-2CRATE-VERIFY ?auto_14932 ?auto_14933 ?auto_14934 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14945 - SURFACE
      ?auto_14946 - SURFACE
      ?auto_14947 - SURFACE
      ?auto_14948 - SURFACE
    )
    :vars
    (
      ?auto_14954 - HOIST
      ?auto_14956 - PLACE
      ?auto_14949 - PLACE
      ?auto_14952 - HOIST
      ?auto_14951 - SURFACE
      ?auto_14957 - PLACE
      ?auto_14953 - HOIST
      ?auto_14955 - SURFACE
      ?auto_14950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14954 ?auto_14956 ) ( IS-CRATE ?auto_14948 ) ( not ( = ?auto_14947 ?auto_14948 ) ) ( not ( = ?auto_14946 ?auto_14947 ) ) ( not ( = ?auto_14946 ?auto_14948 ) ) ( not ( = ?auto_14949 ?auto_14956 ) ) ( HOIST-AT ?auto_14952 ?auto_14949 ) ( not ( = ?auto_14954 ?auto_14952 ) ) ( AVAILABLE ?auto_14952 ) ( SURFACE-AT ?auto_14948 ?auto_14949 ) ( ON ?auto_14948 ?auto_14951 ) ( CLEAR ?auto_14948 ) ( not ( = ?auto_14947 ?auto_14951 ) ) ( not ( = ?auto_14948 ?auto_14951 ) ) ( not ( = ?auto_14946 ?auto_14951 ) ) ( IS-CRATE ?auto_14947 ) ( not ( = ?auto_14957 ?auto_14956 ) ) ( not ( = ?auto_14949 ?auto_14957 ) ) ( HOIST-AT ?auto_14953 ?auto_14957 ) ( not ( = ?auto_14954 ?auto_14953 ) ) ( not ( = ?auto_14952 ?auto_14953 ) ) ( AVAILABLE ?auto_14953 ) ( SURFACE-AT ?auto_14947 ?auto_14957 ) ( ON ?auto_14947 ?auto_14955 ) ( CLEAR ?auto_14947 ) ( not ( = ?auto_14947 ?auto_14955 ) ) ( not ( = ?auto_14948 ?auto_14955 ) ) ( not ( = ?auto_14946 ?auto_14955 ) ) ( not ( = ?auto_14951 ?auto_14955 ) ) ( TRUCK-AT ?auto_14950 ?auto_14956 ) ( SURFACE-AT ?auto_14945 ?auto_14956 ) ( CLEAR ?auto_14945 ) ( IS-CRATE ?auto_14946 ) ( not ( = ?auto_14945 ?auto_14946 ) ) ( not ( = ?auto_14947 ?auto_14945 ) ) ( not ( = ?auto_14948 ?auto_14945 ) ) ( not ( = ?auto_14951 ?auto_14945 ) ) ( not ( = ?auto_14955 ?auto_14945 ) ) ( AVAILABLE ?auto_14954 ) ( IN ?auto_14946 ?auto_14950 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14946 ?auto_14947 ?auto_14948 )
      ( MAKE-3CRATE-VERIFY ?auto_14945 ?auto_14946 ?auto_14947 ?auto_14948 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14958 - SURFACE
      ?auto_14959 - SURFACE
      ?auto_14960 - SURFACE
      ?auto_14961 - SURFACE
      ?auto_14962 - SURFACE
    )
    :vars
    (
      ?auto_14968 - HOIST
      ?auto_14970 - PLACE
      ?auto_14963 - PLACE
      ?auto_14966 - HOIST
      ?auto_14965 - SURFACE
      ?auto_14971 - PLACE
      ?auto_14967 - HOIST
      ?auto_14969 - SURFACE
      ?auto_14964 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14968 ?auto_14970 ) ( IS-CRATE ?auto_14962 ) ( not ( = ?auto_14961 ?auto_14962 ) ) ( not ( = ?auto_14960 ?auto_14961 ) ) ( not ( = ?auto_14960 ?auto_14962 ) ) ( not ( = ?auto_14963 ?auto_14970 ) ) ( HOIST-AT ?auto_14966 ?auto_14963 ) ( not ( = ?auto_14968 ?auto_14966 ) ) ( AVAILABLE ?auto_14966 ) ( SURFACE-AT ?auto_14962 ?auto_14963 ) ( ON ?auto_14962 ?auto_14965 ) ( CLEAR ?auto_14962 ) ( not ( = ?auto_14961 ?auto_14965 ) ) ( not ( = ?auto_14962 ?auto_14965 ) ) ( not ( = ?auto_14960 ?auto_14965 ) ) ( IS-CRATE ?auto_14961 ) ( not ( = ?auto_14971 ?auto_14970 ) ) ( not ( = ?auto_14963 ?auto_14971 ) ) ( HOIST-AT ?auto_14967 ?auto_14971 ) ( not ( = ?auto_14968 ?auto_14967 ) ) ( not ( = ?auto_14966 ?auto_14967 ) ) ( AVAILABLE ?auto_14967 ) ( SURFACE-AT ?auto_14961 ?auto_14971 ) ( ON ?auto_14961 ?auto_14969 ) ( CLEAR ?auto_14961 ) ( not ( = ?auto_14961 ?auto_14969 ) ) ( not ( = ?auto_14962 ?auto_14969 ) ) ( not ( = ?auto_14960 ?auto_14969 ) ) ( not ( = ?auto_14965 ?auto_14969 ) ) ( TRUCK-AT ?auto_14964 ?auto_14970 ) ( SURFACE-AT ?auto_14959 ?auto_14970 ) ( CLEAR ?auto_14959 ) ( IS-CRATE ?auto_14960 ) ( not ( = ?auto_14959 ?auto_14960 ) ) ( not ( = ?auto_14961 ?auto_14959 ) ) ( not ( = ?auto_14962 ?auto_14959 ) ) ( not ( = ?auto_14965 ?auto_14959 ) ) ( not ( = ?auto_14969 ?auto_14959 ) ) ( AVAILABLE ?auto_14968 ) ( IN ?auto_14960 ?auto_14964 ) ( ON ?auto_14959 ?auto_14958 ) ( not ( = ?auto_14958 ?auto_14959 ) ) ( not ( = ?auto_14958 ?auto_14960 ) ) ( not ( = ?auto_14958 ?auto_14961 ) ) ( not ( = ?auto_14958 ?auto_14962 ) ) ( not ( = ?auto_14958 ?auto_14965 ) ) ( not ( = ?auto_14958 ?auto_14969 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14960 ?auto_14961 ?auto_14962 )
      ( MAKE-4CRATE-VERIFY ?auto_14958 ?auto_14959 ?auto_14960 ?auto_14961 ?auto_14962 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14972 - SURFACE
      ?auto_14973 - SURFACE
    )
    :vars
    (
      ?auto_14980 - HOIST
      ?auto_14983 - PLACE
      ?auto_14982 - SURFACE
      ?auto_14974 - PLACE
      ?auto_14977 - HOIST
      ?auto_14976 - SURFACE
      ?auto_14984 - PLACE
      ?auto_14979 - HOIST
      ?auto_14981 - SURFACE
      ?auto_14978 - SURFACE
      ?auto_14975 - TRUCK
      ?auto_14985 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14980 ?auto_14983 ) ( IS-CRATE ?auto_14973 ) ( not ( = ?auto_14972 ?auto_14973 ) ) ( not ( = ?auto_14982 ?auto_14972 ) ) ( not ( = ?auto_14982 ?auto_14973 ) ) ( not ( = ?auto_14974 ?auto_14983 ) ) ( HOIST-AT ?auto_14977 ?auto_14974 ) ( not ( = ?auto_14980 ?auto_14977 ) ) ( AVAILABLE ?auto_14977 ) ( SURFACE-AT ?auto_14973 ?auto_14974 ) ( ON ?auto_14973 ?auto_14976 ) ( CLEAR ?auto_14973 ) ( not ( = ?auto_14972 ?auto_14976 ) ) ( not ( = ?auto_14973 ?auto_14976 ) ) ( not ( = ?auto_14982 ?auto_14976 ) ) ( IS-CRATE ?auto_14972 ) ( not ( = ?auto_14984 ?auto_14983 ) ) ( not ( = ?auto_14974 ?auto_14984 ) ) ( HOIST-AT ?auto_14979 ?auto_14984 ) ( not ( = ?auto_14980 ?auto_14979 ) ) ( not ( = ?auto_14977 ?auto_14979 ) ) ( AVAILABLE ?auto_14979 ) ( SURFACE-AT ?auto_14972 ?auto_14984 ) ( ON ?auto_14972 ?auto_14981 ) ( CLEAR ?auto_14972 ) ( not ( = ?auto_14972 ?auto_14981 ) ) ( not ( = ?auto_14973 ?auto_14981 ) ) ( not ( = ?auto_14982 ?auto_14981 ) ) ( not ( = ?auto_14976 ?auto_14981 ) ) ( SURFACE-AT ?auto_14978 ?auto_14983 ) ( CLEAR ?auto_14978 ) ( IS-CRATE ?auto_14982 ) ( not ( = ?auto_14978 ?auto_14982 ) ) ( not ( = ?auto_14972 ?auto_14978 ) ) ( not ( = ?auto_14973 ?auto_14978 ) ) ( not ( = ?auto_14976 ?auto_14978 ) ) ( not ( = ?auto_14981 ?auto_14978 ) ) ( AVAILABLE ?auto_14980 ) ( IN ?auto_14982 ?auto_14975 ) ( TRUCK-AT ?auto_14975 ?auto_14985 ) ( not ( = ?auto_14985 ?auto_14983 ) ) ( not ( = ?auto_14974 ?auto_14985 ) ) ( not ( = ?auto_14984 ?auto_14985 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14975 ?auto_14985 ?auto_14983 )
      ( MAKE-2CRATE ?auto_14982 ?auto_14972 ?auto_14973 )
      ( MAKE-1CRATE-VERIFY ?auto_14972 ?auto_14973 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14986 - SURFACE
      ?auto_14987 - SURFACE
      ?auto_14988 - SURFACE
    )
    :vars
    (
      ?auto_14997 - HOIST
      ?auto_14995 - PLACE
      ?auto_14991 - PLACE
      ?auto_14993 - HOIST
      ?auto_14999 - SURFACE
      ?auto_14990 - PLACE
      ?auto_14996 - HOIST
      ?auto_14994 - SURFACE
      ?auto_14998 - SURFACE
      ?auto_14989 - TRUCK
      ?auto_14992 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14997 ?auto_14995 ) ( IS-CRATE ?auto_14988 ) ( not ( = ?auto_14987 ?auto_14988 ) ) ( not ( = ?auto_14986 ?auto_14987 ) ) ( not ( = ?auto_14986 ?auto_14988 ) ) ( not ( = ?auto_14991 ?auto_14995 ) ) ( HOIST-AT ?auto_14993 ?auto_14991 ) ( not ( = ?auto_14997 ?auto_14993 ) ) ( AVAILABLE ?auto_14993 ) ( SURFACE-AT ?auto_14988 ?auto_14991 ) ( ON ?auto_14988 ?auto_14999 ) ( CLEAR ?auto_14988 ) ( not ( = ?auto_14987 ?auto_14999 ) ) ( not ( = ?auto_14988 ?auto_14999 ) ) ( not ( = ?auto_14986 ?auto_14999 ) ) ( IS-CRATE ?auto_14987 ) ( not ( = ?auto_14990 ?auto_14995 ) ) ( not ( = ?auto_14991 ?auto_14990 ) ) ( HOIST-AT ?auto_14996 ?auto_14990 ) ( not ( = ?auto_14997 ?auto_14996 ) ) ( not ( = ?auto_14993 ?auto_14996 ) ) ( AVAILABLE ?auto_14996 ) ( SURFACE-AT ?auto_14987 ?auto_14990 ) ( ON ?auto_14987 ?auto_14994 ) ( CLEAR ?auto_14987 ) ( not ( = ?auto_14987 ?auto_14994 ) ) ( not ( = ?auto_14988 ?auto_14994 ) ) ( not ( = ?auto_14986 ?auto_14994 ) ) ( not ( = ?auto_14999 ?auto_14994 ) ) ( SURFACE-AT ?auto_14998 ?auto_14995 ) ( CLEAR ?auto_14998 ) ( IS-CRATE ?auto_14986 ) ( not ( = ?auto_14998 ?auto_14986 ) ) ( not ( = ?auto_14987 ?auto_14998 ) ) ( not ( = ?auto_14988 ?auto_14998 ) ) ( not ( = ?auto_14999 ?auto_14998 ) ) ( not ( = ?auto_14994 ?auto_14998 ) ) ( AVAILABLE ?auto_14997 ) ( IN ?auto_14986 ?auto_14989 ) ( TRUCK-AT ?auto_14989 ?auto_14992 ) ( not ( = ?auto_14992 ?auto_14995 ) ) ( not ( = ?auto_14991 ?auto_14992 ) ) ( not ( = ?auto_14990 ?auto_14992 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14987 ?auto_14988 )
      ( MAKE-2CRATE-VERIFY ?auto_14986 ?auto_14987 ?auto_14988 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15000 - SURFACE
      ?auto_15001 - SURFACE
      ?auto_15002 - SURFACE
      ?auto_15003 - SURFACE
    )
    :vars
    (
      ?auto_15008 - HOIST
      ?auto_15004 - PLACE
      ?auto_15012 - PLACE
      ?auto_15013 - HOIST
      ?auto_15009 - SURFACE
      ?auto_15007 - PLACE
      ?auto_15006 - HOIST
      ?auto_15005 - SURFACE
      ?auto_15011 - TRUCK
      ?auto_15010 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15008 ?auto_15004 ) ( IS-CRATE ?auto_15003 ) ( not ( = ?auto_15002 ?auto_15003 ) ) ( not ( = ?auto_15001 ?auto_15002 ) ) ( not ( = ?auto_15001 ?auto_15003 ) ) ( not ( = ?auto_15012 ?auto_15004 ) ) ( HOIST-AT ?auto_15013 ?auto_15012 ) ( not ( = ?auto_15008 ?auto_15013 ) ) ( AVAILABLE ?auto_15013 ) ( SURFACE-AT ?auto_15003 ?auto_15012 ) ( ON ?auto_15003 ?auto_15009 ) ( CLEAR ?auto_15003 ) ( not ( = ?auto_15002 ?auto_15009 ) ) ( not ( = ?auto_15003 ?auto_15009 ) ) ( not ( = ?auto_15001 ?auto_15009 ) ) ( IS-CRATE ?auto_15002 ) ( not ( = ?auto_15007 ?auto_15004 ) ) ( not ( = ?auto_15012 ?auto_15007 ) ) ( HOIST-AT ?auto_15006 ?auto_15007 ) ( not ( = ?auto_15008 ?auto_15006 ) ) ( not ( = ?auto_15013 ?auto_15006 ) ) ( AVAILABLE ?auto_15006 ) ( SURFACE-AT ?auto_15002 ?auto_15007 ) ( ON ?auto_15002 ?auto_15005 ) ( CLEAR ?auto_15002 ) ( not ( = ?auto_15002 ?auto_15005 ) ) ( not ( = ?auto_15003 ?auto_15005 ) ) ( not ( = ?auto_15001 ?auto_15005 ) ) ( not ( = ?auto_15009 ?auto_15005 ) ) ( SURFACE-AT ?auto_15000 ?auto_15004 ) ( CLEAR ?auto_15000 ) ( IS-CRATE ?auto_15001 ) ( not ( = ?auto_15000 ?auto_15001 ) ) ( not ( = ?auto_15002 ?auto_15000 ) ) ( not ( = ?auto_15003 ?auto_15000 ) ) ( not ( = ?auto_15009 ?auto_15000 ) ) ( not ( = ?auto_15005 ?auto_15000 ) ) ( AVAILABLE ?auto_15008 ) ( IN ?auto_15001 ?auto_15011 ) ( TRUCK-AT ?auto_15011 ?auto_15010 ) ( not ( = ?auto_15010 ?auto_15004 ) ) ( not ( = ?auto_15012 ?auto_15010 ) ) ( not ( = ?auto_15007 ?auto_15010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15001 ?auto_15002 ?auto_15003 )
      ( MAKE-3CRATE-VERIFY ?auto_15000 ?auto_15001 ?auto_15002 ?auto_15003 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15014 - SURFACE
      ?auto_15015 - SURFACE
      ?auto_15016 - SURFACE
      ?auto_15017 - SURFACE
      ?auto_15018 - SURFACE
    )
    :vars
    (
      ?auto_15023 - HOIST
      ?auto_15019 - PLACE
      ?auto_15027 - PLACE
      ?auto_15028 - HOIST
      ?auto_15024 - SURFACE
      ?auto_15022 - PLACE
      ?auto_15021 - HOIST
      ?auto_15020 - SURFACE
      ?auto_15026 - TRUCK
      ?auto_15025 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15023 ?auto_15019 ) ( IS-CRATE ?auto_15018 ) ( not ( = ?auto_15017 ?auto_15018 ) ) ( not ( = ?auto_15016 ?auto_15017 ) ) ( not ( = ?auto_15016 ?auto_15018 ) ) ( not ( = ?auto_15027 ?auto_15019 ) ) ( HOIST-AT ?auto_15028 ?auto_15027 ) ( not ( = ?auto_15023 ?auto_15028 ) ) ( AVAILABLE ?auto_15028 ) ( SURFACE-AT ?auto_15018 ?auto_15027 ) ( ON ?auto_15018 ?auto_15024 ) ( CLEAR ?auto_15018 ) ( not ( = ?auto_15017 ?auto_15024 ) ) ( not ( = ?auto_15018 ?auto_15024 ) ) ( not ( = ?auto_15016 ?auto_15024 ) ) ( IS-CRATE ?auto_15017 ) ( not ( = ?auto_15022 ?auto_15019 ) ) ( not ( = ?auto_15027 ?auto_15022 ) ) ( HOIST-AT ?auto_15021 ?auto_15022 ) ( not ( = ?auto_15023 ?auto_15021 ) ) ( not ( = ?auto_15028 ?auto_15021 ) ) ( AVAILABLE ?auto_15021 ) ( SURFACE-AT ?auto_15017 ?auto_15022 ) ( ON ?auto_15017 ?auto_15020 ) ( CLEAR ?auto_15017 ) ( not ( = ?auto_15017 ?auto_15020 ) ) ( not ( = ?auto_15018 ?auto_15020 ) ) ( not ( = ?auto_15016 ?auto_15020 ) ) ( not ( = ?auto_15024 ?auto_15020 ) ) ( SURFACE-AT ?auto_15015 ?auto_15019 ) ( CLEAR ?auto_15015 ) ( IS-CRATE ?auto_15016 ) ( not ( = ?auto_15015 ?auto_15016 ) ) ( not ( = ?auto_15017 ?auto_15015 ) ) ( not ( = ?auto_15018 ?auto_15015 ) ) ( not ( = ?auto_15024 ?auto_15015 ) ) ( not ( = ?auto_15020 ?auto_15015 ) ) ( AVAILABLE ?auto_15023 ) ( IN ?auto_15016 ?auto_15026 ) ( TRUCK-AT ?auto_15026 ?auto_15025 ) ( not ( = ?auto_15025 ?auto_15019 ) ) ( not ( = ?auto_15027 ?auto_15025 ) ) ( not ( = ?auto_15022 ?auto_15025 ) ) ( ON ?auto_15015 ?auto_15014 ) ( not ( = ?auto_15014 ?auto_15015 ) ) ( not ( = ?auto_15014 ?auto_15016 ) ) ( not ( = ?auto_15014 ?auto_15017 ) ) ( not ( = ?auto_15014 ?auto_15018 ) ) ( not ( = ?auto_15014 ?auto_15024 ) ) ( not ( = ?auto_15014 ?auto_15020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15016 ?auto_15017 ?auto_15018 )
      ( MAKE-4CRATE-VERIFY ?auto_15014 ?auto_15015 ?auto_15016 ?auto_15017 ?auto_15018 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15029 - SURFACE
      ?auto_15030 - SURFACE
    )
    :vars
    (
      ?auto_15036 - HOIST
      ?auto_15031 - PLACE
      ?auto_15040 - SURFACE
      ?auto_15041 - PLACE
      ?auto_15042 - HOIST
      ?auto_15037 - SURFACE
      ?auto_15034 - PLACE
      ?auto_15033 - HOIST
      ?auto_15032 - SURFACE
      ?auto_15035 - SURFACE
      ?auto_15039 - TRUCK
      ?auto_15038 - PLACE
      ?auto_15043 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15036 ?auto_15031 ) ( IS-CRATE ?auto_15030 ) ( not ( = ?auto_15029 ?auto_15030 ) ) ( not ( = ?auto_15040 ?auto_15029 ) ) ( not ( = ?auto_15040 ?auto_15030 ) ) ( not ( = ?auto_15041 ?auto_15031 ) ) ( HOIST-AT ?auto_15042 ?auto_15041 ) ( not ( = ?auto_15036 ?auto_15042 ) ) ( AVAILABLE ?auto_15042 ) ( SURFACE-AT ?auto_15030 ?auto_15041 ) ( ON ?auto_15030 ?auto_15037 ) ( CLEAR ?auto_15030 ) ( not ( = ?auto_15029 ?auto_15037 ) ) ( not ( = ?auto_15030 ?auto_15037 ) ) ( not ( = ?auto_15040 ?auto_15037 ) ) ( IS-CRATE ?auto_15029 ) ( not ( = ?auto_15034 ?auto_15031 ) ) ( not ( = ?auto_15041 ?auto_15034 ) ) ( HOIST-AT ?auto_15033 ?auto_15034 ) ( not ( = ?auto_15036 ?auto_15033 ) ) ( not ( = ?auto_15042 ?auto_15033 ) ) ( AVAILABLE ?auto_15033 ) ( SURFACE-AT ?auto_15029 ?auto_15034 ) ( ON ?auto_15029 ?auto_15032 ) ( CLEAR ?auto_15029 ) ( not ( = ?auto_15029 ?auto_15032 ) ) ( not ( = ?auto_15030 ?auto_15032 ) ) ( not ( = ?auto_15040 ?auto_15032 ) ) ( not ( = ?auto_15037 ?auto_15032 ) ) ( SURFACE-AT ?auto_15035 ?auto_15031 ) ( CLEAR ?auto_15035 ) ( IS-CRATE ?auto_15040 ) ( not ( = ?auto_15035 ?auto_15040 ) ) ( not ( = ?auto_15029 ?auto_15035 ) ) ( not ( = ?auto_15030 ?auto_15035 ) ) ( not ( = ?auto_15037 ?auto_15035 ) ) ( not ( = ?auto_15032 ?auto_15035 ) ) ( AVAILABLE ?auto_15036 ) ( TRUCK-AT ?auto_15039 ?auto_15038 ) ( not ( = ?auto_15038 ?auto_15031 ) ) ( not ( = ?auto_15041 ?auto_15038 ) ) ( not ( = ?auto_15034 ?auto_15038 ) ) ( HOIST-AT ?auto_15043 ?auto_15038 ) ( LIFTING ?auto_15043 ?auto_15040 ) ( not ( = ?auto_15036 ?auto_15043 ) ) ( not ( = ?auto_15042 ?auto_15043 ) ) ( not ( = ?auto_15033 ?auto_15043 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15043 ?auto_15040 ?auto_15039 ?auto_15038 )
      ( MAKE-2CRATE ?auto_15040 ?auto_15029 ?auto_15030 )
      ( MAKE-1CRATE-VERIFY ?auto_15029 ?auto_15030 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15044 - SURFACE
      ?auto_15045 - SURFACE
      ?auto_15046 - SURFACE
    )
    :vars
    (
      ?auto_15056 - HOIST
      ?auto_15047 - PLACE
      ?auto_15050 - PLACE
      ?auto_15054 - HOIST
      ?auto_15058 - SURFACE
      ?auto_15057 - PLACE
      ?auto_15049 - HOIST
      ?auto_15053 - SURFACE
      ?auto_15048 - SURFACE
      ?auto_15055 - TRUCK
      ?auto_15051 - PLACE
      ?auto_15052 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15056 ?auto_15047 ) ( IS-CRATE ?auto_15046 ) ( not ( = ?auto_15045 ?auto_15046 ) ) ( not ( = ?auto_15044 ?auto_15045 ) ) ( not ( = ?auto_15044 ?auto_15046 ) ) ( not ( = ?auto_15050 ?auto_15047 ) ) ( HOIST-AT ?auto_15054 ?auto_15050 ) ( not ( = ?auto_15056 ?auto_15054 ) ) ( AVAILABLE ?auto_15054 ) ( SURFACE-AT ?auto_15046 ?auto_15050 ) ( ON ?auto_15046 ?auto_15058 ) ( CLEAR ?auto_15046 ) ( not ( = ?auto_15045 ?auto_15058 ) ) ( not ( = ?auto_15046 ?auto_15058 ) ) ( not ( = ?auto_15044 ?auto_15058 ) ) ( IS-CRATE ?auto_15045 ) ( not ( = ?auto_15057 ?auto_15047 ) ) ( not ( = ?auto_15050 ?auto_15057 ) ) ( HOIST-AT ?auto_15049 ?auto_15057 ) ( not ( = ?auto_15056 ?auto_15049 ) ) ( not ( = ?auto_15054 ?auto_15049 ) ) ( AVAILABLE ?auto_15049 ) ( SURFACE-AT ?auto_15045 ?auto_15057 ) ( ON ?auto_15045 ?auto_15053 ) ( CLEAR ?auto_15045 ) ( not ( = ?auto_15045 ?auto_15053 ) ) ( not ( = ?auto_15046 ?auto_15053 ) ) ( not ( = ?auto_15044 ?auto_15053 ) ) ( not ( = ?auto_15058 ?auto_15053 ) ) ( SURFACE-AT ?auto_15048 ?auto_15047 ) ( CLEAR ?auto_15048 ) ( IS-CRATE ?auto_15044 ) ( not ( = ?auto_15048 ?auto_15044 ) ) ( not ( = ?auto_15045 ?auto_15048 ) ) ( not ( = ?auto_15046 ?auto_15048 ) ) ( not ( = ?auto_15058 ?auto_15048 ) ) ( not ( = ?auto_15053 ?auto_15048 ) ) ( AVAILABLE ?auto_15056 ) ( TRUCK-AT ?auto_15055 ?auto_15051 ) ( not ( = ?auto_15051 ?auto_15047 ) ) ( not ( = ?auto_15050 ?auto_15051 ) ) ( not ( = ?auto_15057 ?auto_15051 ) ) ( HOIST-AT ?auto_15052 ?auto_15051 ) ( LIFTING ?auto_15052 ?auto_15044 ) ( not ( = ?auto_15056 ?auto_15052 ) ) ( not ( = ?auto_15054 ?auto_15052 ) ) ( not ( = ?auto_15049 ?auto_15052 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15045 ?auto_15046 )
      ( MAKE-2CRATE-VERIFY ?auto_15044 ?auto_15045 ?auto_15046 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15059 - SURFACE
      ?auto_15060 - SURFACE
      ?auto_15061 - SURFACE
      ?auto_15062 - SURFACE
    )
    :vars
    (
      ?auto_15068 - HOIST
      ?auto_15069 - PLACE
      ?auto_15070 - PLACE
      ?auto_15071 - HOIST
      ?auto_15072 - SURFACE
      ?auto_15067 - PLACE
      ?auto_15066 - HOIST
      ?auto_15063 - SURFACE
      ?auto_15065 - TRUCK
      ?auto_15073 - PLACE
      ?auto_15064 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15068 ?auto_15069 ) ( IS-CRATE ?auto_15062 ) ( not ( = ?auto_15061 ?auto_15062 ) ) ( not ( = ?auto_15060 ?auto_15061 ) ) ( not ( = ?auto_15060 ?auto_15062 ) ) ( not ( = ?auto_15070 ?auto_15069 ) ) ( HOIST-AT ?auto_15071 ?auto_15070 ) ( not ( = ?auto_15068 ?auto_15071 ) ) ( AVAILABLE ?auto_15071 ) ( SURFACE-AT ?auto_15062 ?auto_15070 ) ( ON ?auto_15062 ?auto_15072 ) ( CLEAR ?auto_15062 ) ( not ( = ?auto_15061 ?auto_15072 ) ) ( not ( = ?auto_15062 ?auto_15072 ) ) ( not ( = ?auto_15060 ?auto_15072 ) ) ( IS-CRATE ?auto_15061 ) ( not ( = ?auto_15067 ?auto_15069 ) ) ( not ( = ?auto_15070 ?auto_15067 ) ) ( HOIST-AT ?auto_15066 ?auto_15067 ) ( not ( = ?auto_15068 ?auto_15066 ) ) ( not ( = ?auto_15071 ?auto_15066 ) ) ( AVAILABLE ?auto_15066 ) ( SURFACE-AT ?auto_15061 ?auto_15067 ) ( ON ?auto_15061 ?auto_15063 ) ( CLEAR ?auto_15061 ) ( not ( = ?auto_15061 ?auto_15063 ) ) ( not ( = ?auto_15062 ?auto_15063 ) ) ( not ( = ?auto_15060 ?auto_15063 ) ) ( not ( = ?auto_15072 ?auto_15063 ) ) ( SURFACE-AT ?auto_15059 ?auto_15069 ) ( CLEAR ?auto_15059 ) ( IS-CRATE ?auto_15060 ) ( not ( = ?auto_15059 ?auto_15060 ) ) ( not ( = ?auto_15061 ?auto_15059 ) ) ( not ( = ?auto_15062 ?auto_15059 ) ) ( not ( = ?auto_15072 ?auto_15059 ) ) ( not ( = ?auto_15063 ?auto_15059 ) ) ( AVAILABLE ?auto_15068 ) ( TRUCK-AT ?auto_15065 ?auto_15073 ) ( not ( = ?auto_15073 ?auto_15069 ) ) ( not ( = ?auto_15070 ?auto_15073 ) ) ( not ( = ?auto_15067 ?auto_15073 ) ) ( HOIST-AT ?auto_15064 ?auto_15073 ) ( LIFTING ?auto_15064 ?auto_15060 ) ( not ( = ?auto_15068 ?auto_15064 ) ) ( not ( = ?auto_15071 ?auto_15064 ) ) ( not ( = ?auto_15066 ?auto_15064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15060 ?auto_15061 ?auto_15062 )
      ( MAKE-3CRATE-VERIFY ?auto_15059 ?auto_15060 ?auto_15061 ?auto_15062 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15074 - SURFACE
      ?auto_15075 - SURFACE
      ?auto_15076 - SURFACE
      ?auto_15077 - SURFACE
      ?auto_15078 - SURFACE
    )
    :vars
    (
      ?auto_15084 - HOIST
      ?auto_15085 - PLACE
      ?auto_15086 - PLACE
      ?auto_15087 - HOIST
      ?auto_15088 - SURFACE
      ?auto_15083 - PLACE
      ?auto_15082 - HOIST
      ?auto_15079 - SURFACE
      ?auto_15081 - TRUCK
      ?auto_15089 - PLACE
      ?auto_15080 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15084 ?auto_15085 ) ( IS-CRATE ?auto_15078 ) ( not ( = ?auto_15077 ?auto_15078 ) ) ( not ( = ?auto_15076 ?auto_15077 ) ) ( not ( = ?auto_15076 ?auto_15078 ) ) ( not ( = ?auto_15086 ?auto_15085 ) ) ( HOIST-AT ?auto_15087 ?auto_15086 ) ( not ( = ?auto_15084 ?auto_15087 ) ) ( AVAILABLE ?auto_15087 ) ( SURFACE-AT ?auto_15078 ?auto_15086 ) ( ON ?auto_15078 ?auto_15088 ) ( CLEAR ?auto_15078 ) ( not ( = ?auto_15077 ?auto_15088 ) ) ( not ( = ?auto_15078 ?auto_15088 ) ) ( not ( = ?auto_15076 ?auto_15088 ) ) ( IS-CRATE ?auto_15077 ) ( not ( = ?auto_15083 ?auto_15085 ) ) ( not ( = ?auto_15086 ?auto_15083 ) ) ( HOIST-AT ?auto_15082 ?auto_15083 ) ( not ( = ?auto_15084 ?auto_15082 ) ) ( not ( = ?auto_15087 ?auto_15082 ) ) ( AVAILABLE ?auto_15082 ) ( SURFACE-AT ?auto_15077 ?auto_15083 ) ( ON ?auto_15077 ?auto_15079 ) ( CLEAR ?auto_15077 ) ( not ( = ?auto_15077 ?auto_15079 ) ) ( not ( = ?auto_15078 ?auto_15079 ) ) ( not ( = ?auto_15076 ?auto_15079 ) ) ( not ( = ?auto_15088 ?auto_15079 ) ) ( SURFACE-AT ?auto_15075 ?auto_15085 ) ( CLEAR ?auto_15075 ) ( IS-CRATE ?auto_15076 ) ( not ( = ?auto_15075 ?auto_15076 ) ) ( not ( = ?auto_15077 ?auto_15075 ) ) ( not ( = ?auto_15078 ?auto_15075 ) ) ( not ( = ?auto_15088 ?auto_15075 ) ) ( not ( = ?auto_15079 ?auto_15075 ) ) ( AVAILABLE ?auto_15084 ) ( TRUCK-AT ?auto_15081 ?auto_15089 ) ( not ( = ?auto_15089 ?auto_15085 ) ) ( not ( = ?auto_15086 ?auto_15089 ) ) ( not ( = ?auto_15083 ?auto_15089 ) ) ( HOIST-AT ?auto_15080 ?auto_15089 ) ( LIFTING ?auto_15080 ?auto_15076 ) ( not ( = ?auto_15084 ?auto_15080 ) ) ( not ( = ?auto_15087 ?auto_15080 ) ) ( not ( = ?auto_15082 ?auto_15080 ) ) ( ON ?auto_15075 ?auto_15074 ) ( not ( = ?auto_15074 ?auto_15075 ) ) ( not ( = ?auto_15074 ?auto_15076 ) ) ( not ( = ?auto_15074 ?auto_15077 ) ) ( not ( = ?auto_15074 ?auto_15078 ) ) ( not ( = ?auto_15074 ?auto_15088 ) ) ( not ( = ?auto_15074 ?auto_15079 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15076 ?auto_15077 ?auto_15078 )
      ( MAKE-4CRATE-VERIFY ?auto_15074 ?auto_15075 ?auto_15076 ?auto_15077 ?auto_15078 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15090 - SURFACE
      ?auto_15091 - SURFACE
    )
    :vars
    (
      ?auto_15097 - HOIST
      ?auto_15098 - PLACE
      ?auto_15101 - SURFACE
      ?auto_15099 - PLACE
      ?auto_15102 - HOIST
      ?auto_15103 - SURFACE
      ?auto_15096 - PLACE
      ?auto_15095 - HOIST
      ?auto_15092 - SURFACE
      ?auto_15100 - SURFACE
      ?auto_15094 - TRUCK
      ?auto_15104 - PLACE
      ?auto_15093 - HOIST
      ?auto_15105 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15097 ?auto_15098 ) ( IS-CRATE ?auto_15091 ) ( not ( = ?auto_15090 ?auto_15091 ) ) ( not ( = ?auto_15101 ?auto_15090 ) ) ( not ( = ?auto_15101 ?auto_15091 ) ) ( not ( = ?auto_15099 ?auto_15098 ) ) ( HOIST-AT ?auto_15102 ?auto_15099 ) ( not ( = ?auto_15097 ?auto_15102 ) ) ( AVAILABLE ?auto_15102 ) ( SURFACE-AT ?auto_15091 ?auto_15099 ) ( ON ?auto_15091 ?auto_15103 ) ( CLEAR ?auto_15091 ) ( not ( = ?auto_15090 ?auto_15103 ) ) ( not ( = ?auto_15091 ?auto_15103 ) ) ( not ( = ?auto_15101 ?auto_15103 ) ) ( IS-CRATE ?auto_15090 ) ( not ( = ?auto_15096 ?auto_15098 ) ) ( not ( = ?auto_15099 ?auto_15096 ) ) ( HOIST-AT ?auto_15095 ?auto_15096 ) ( not ( = ?auto_15097 ?auto_15095 ) ) ( not ( = ?auto_15102 ?auto_15095 ) ) ( AVAILABLE ?auto_15095 ) ( SURFACE-AT ?auto_15090 ?auto_15096 ) ( ON ?auto_15090 ?auto_15092 ) ( CLEAR ?auto_15090 ) ( not ( = ?auto_15090 ?auto_15092 ) ) ( not ( = ?auto_15091 ?auto_15092 ) ) ( not ( = ?auto_15101 ?auto_15092 ) ) ( not ( = ?auto_15103 ?auto_15092 ) ) ( SURFACE-AT ?auto_15100 ?auto_15098 ) ( CLEAR ?auto_15100 ) ( IS-CRATE ?auto_15101 ) ( not ( = ?auto_15100 ?auto_15101 ) ) ( not ( = ?auto_15090 ?auto_15100 ) ) ( not ( = ?auto_15091 ?auto_15100 ) ) ( not ( = ?auto_15103 ?auto_15100 ) ) ( not ( = ?auto_15092 ?auto_15100 ) ) ( AVAILABLE ?auto_15097 ) ( TRUCK-AT ?auto_15094 ?auto_15104 ) ( not ( = ?auto_15104 ?auto_15098 ) ) ( not ( = ?auto_15099 ?auto_15104 ) ) ( not ( = ?auto_15096 ?auto_15104 ) ) ( HOIST-AT ?auto_15093 ?auto_15104 ) ( not ( = ?auto_15097 ?auto_15093 ) ) ( not ( = ?auto_15102 ?auto_15093 ) ) ( not ( = ?auto_15095 ?auto_15093 ) ) ( AVAILABLE ?auto_15093 ) ( SURFACE-AT ?auto_15101 ?auto_15104 ) ( ON ?auto_15101 ?auto_15105 ) ( CLEAR ?auto_15101 ) ( not ( = ?auto_15090 ?auto_15105 ) ) ( not ( = ?auto_15091 ?auto_15105 ) ) ( not ( = ?auto_15101 ?auto_15105 ) ) ( not ( = ?auto_15103 ?auto_15105 ) ) ( not ( = ?auto_15092 ?auto_15105 ) ) ( not ( = ?auto_15100 ?auto_15105 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15093 ?auto_15101 ?auto_15105 ?auto_15104 )
      ( MAKE-2CRATE ?auto_15101 ?auto_15090 ?auto_15091 )
      ( MAKE-1CRATE-VERIFY ?auto_15090 ?auto_15091 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15106 - SURFACE
      ?auto_15107 - SURFACE
      ?auto_15108 - SURFACE
    )
    :vars
    (
      ?auto_15109 - HOIST
      ?auto_15118 - PLACE
      ?auto_15116 - PLACE
      ?auto_15112 - HOIST
      ?auto_15115 - SURFACE
      ?auto_15114 - PLACE
      ?auto_15110 - HOIST
      ?auto_15121 - SURFACE
      ?auto_15111 - SURFACE
      ?auto_15120 - TRUCK
      ?auto_15113 - PLACE
      ?auto_15117 - HOIST
      ?auto_15119 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15109 ?auto_15118 ) ( IS-CRATE ?auto_15108 ) ( not ( = ?auto_15107 ?auto_15108 ) ) ( not ( = ?auto_15106 ?auto_15107 ) ) ( not ( = ?auto_15106 ?auto_15108 ) ) ( not ( = ?auto_15116 ?auto_15118 ) ) ( HOIST-AT ?auto_15112 ?auto_15116 ) ( not ( = ?auto_15109 ?auto_15112 ) ) ( AVAILABLE ?auto_15112 ) ( SURFACE-AT ?auto_15108 ?auto_15116 ) ( ON ?auto_15108 ?auto_15115 ) ( CLEAR ?auto_15108 ) ( not ( = ?auto_15107 ?auto_15115 ) ) ( not ( = ?auto_15108 ?auto_15115 ) ) ( not ( = ?auto_15106 ?auto_15115 ) ) ( IS-CRATE ?auto_15107 ) ( not ( = ?auto_15114 ?auto_15118 ) ) ( not ( = ?auto_15116 ?auto_15114 ) ) ( HOIST-AT ?auto_15110 ?auto_15114 ) ( not ( = ?auto_15109 ?auto_15110 ) ) ( not ( = ?auto_15112 ?auto_15110 ) ) ( AVAILABLE ?auto_15110 ) ( SURFACE-AT ?auto_15107 ?auto_15114 ) ( ON ?auto_15107 ?auto_15121 ) ( CLEAR ?auto_15107 ) ( not ( = ?auto_15107 ?auto_15121 ) ) ( not ( = ?auto_15108 ?auto_15121 ) ) ( not ( = ?auto_15106 ?auto_15121 ) ) ( not ( = ?auto_15115 ?auto_15121 ) ) ( SURFACE-AT ?auto_15111 ?auto_15118 ) ( CLEAR ?auto_15111 ) ( IS-CRATE ?auto_15106 ) ( not ( = ?auto_15111 ?auto_15106 ) ) ( not ( = ?auto_15107 ?auto_15111 ) ) ( not ( = ?auto_15108 ?auto_15111 ) ) ( not ( = ?auto_15115 ?auto_15111 ) ) ( not ( = ?auto_15121 ?auto_15111 ) ) ( AVAILABLE ?auto_15109 ) ( TRUCK-AT ?auto_15120 ?auto_15113 ) ( not ( = ?auto_15113 ?auto_15118 ) ) ( not ( = ?auto_15116 ?auto_15113 ) ) ( not ( = ?auto_15114 ?auto_15113 ) ) ( HOIST-AT ?auto_15117 ?auto_15113 ) ( not ( = ?auto_15109 ?auto_15117 ) ) ( not ( = ?auto_15112 ?auto_15117 ) ) ( not ( = ?auto_15110 ?auto_15117 ) ) ( AVAILABLE ?auto_15117 ) ( SURFACE-AT ?auto_15106 ?auto_15113 ) ( ON ?auto_15106 ?auto_15119 ) ( CLEAR ?auto_15106 ) ( not ( = ?auto_15107 ?auto_15119 ) ) ( not ( = ?auto_15108 ?auto_15119 ) ) ( not ( = ?auto_15106 ?auto_15119 ) ) ( not ( = ?auto_15115 ?auto_15119 ) ) ( not ( = ?auto_15121 ?auto_15119 ) ) ( not ( = ?auto_15111 ?auto_15119 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15107 ?auto_15108 )
      ( MAKE-2CRATE-VERIFY ?auto_15106 ?auto_15107 ?auto_15108 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15122 - SURFACE
      ?auto_15123 - SURFACE
      ?auto_15124 - SURFACE
      ?auto_15125 - SURFACE
    )
    :vars
    (
      ?auto_15129 - HOIST
      ?auto_15127 - PLACE
      ?auto_15133 - PLACE
      ?auto_15134 - HOIST
      ?auto_15126 - SURFACE
      ?auto_15137 - PLACE
      ?auto_15135 - HOIST
      ?auto_15130 - SURFACE
      ?auto_15132 - TRUCK
      ?auto_15131 - PLACE
      ?auto_15136 - HOIST
      ?auto_15128 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15129 ?auto_15127 ) ( IS-CRATE ?auto_15125 ) ( not ( = ?auto_15124 ?auto_15125 ) ) ( not ( = ?auto_15123 ?auto_15124 ) ) ( not ( = ?auto_15123 ?auto_15125 ) ) ( not ( = ?auto_15133 ?auto_15127 ) ) ( HOIST-AT ?auto_15134 ?auto_15133 ) ( not ( = ?auto_15129 ?auto_15134 ) ) ( AVAILABLE ?auto_15134 ) ( SURFACE-AT ?auto_15125 ?auto_15133 ) ( ON ?auto_15125 ?auto_15126 ) ( CLEAR ?auto_15125 ) ( not ( = ?auto_15124 ?auto_15126 ) ) ( not ( = ?auto_15125 ?auto_15126 ) ) ( not ( = ?auto_15123 ?auto_15126 ) ) ( IS-CRATE ?auto_15124 ) ( not ( = ?auto_15137 ?auto_15127 ) ) ( not ( = ?auto_15133 ?auto_15137 ) ) ( HOIST-AT ?auto_15135 ?auto_15137 ) ( not ( = ?auto_15129 ?auto_15135 ) ) ( not ( = ?auto_15134 ?auto_15135 ) ) ( AVAILABLE ?auto_15135 ) ( SURFACE-AT ?auto_15124 ?auto_15137 ) ( ON ?auto_15124 ?auto_15130 ) ( CLEAR ?auto_15124 ) ( not ( = ?auto_15124 ?auto_15130 ) ) ( not ( = ?auto_15125 ?auto_15130 ) ) ( not ( = ?auto_15123 ?auto_15130 ) ) ( not ( = ?auto_15126 ?auto_15130 ) ) ( SURFACE-AT ?auto_15122 ?auto_15127 ) ( CLEAR ?auto_15122 ) ( IS-CRATE ?auto_15123 ) ( not ( = ?auto_15122 ?auto_15123 ) ) ( not ( = ?auto_15124 ?auto_15122 ) ) ( not ( = ?auto_15125 ?auto_15122 ) ) ( not ( = ?auto_15126 ?auto_15122 ) ) ( not ( = ?auto_15130 ?auto_15122 ) ) ( AVAILABLE ?auto_15129 ) ( TRUCK-AT ?auto_15132 ?auto_15131 ) ( not ( = ?auto_15131 ?auto_15127 ) ) ( not ( = ?auto_15133 ?auto_15131 ) ) ( not ( = ?auto_15137 ?auto_15131 ) ) ( HOIST-AT ?auto_15136 ?auto_15131 ) ( not ( = ?auto_15129 ?auto_15136 ) ) ( not ( = ?auto_15134 ?auto_15136 ) ) ( not ( = ?auto_15135 ?auto_15136 ) ) ( AVAILABLE ?auto_15136 ) ( SURFACE-AT ?auto_15123 ?auto_15131 ) ( ON ?auto_15123 ?auto_15128 ) ( CLEAR ?auto_15123 ) ( not ( = ?auto_15124 ?auto_15128 ) ) ( not ( = ?auto_15125 ?auto_15128 ) ) ( not ( = ?auto_15123 ?auto_15128 ) ) ( not ( = ?auto_15126 ?auto_15128 ) ) ( not ( = ?auto_15130 ?auto_15128 ) ) ( not ( = ?auto_15122 ?auto_15128 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15123 ?auto_15124 ?auto_15125 )
      ( MAKE-3CRATE-VERIFY ?auto_15122 ?auto_15123 ?auto_15124 ?auto_15125 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15138 - SURFACE
      ?auto_15139 - SURFACE
      ?auto_15140 - SURFACE
      ?auto_15141 - SURFACE
      ?auto_15142 - SURFACE
    )
    :vars
    (
      ?auto_15146 - HOIST
      ?auto_15144 - PLACE
      ?auto_15150 - PLACE
      ?auto_15151 - HOIST
      ?auto_15143 - SURFACE
      ?auto_15154 - PLACE
      ?auto_15152 - HOIST
      ?auto_15147 - SURFACE
      ?auto_15149 - TRUCK
      ?auto_15148 - PLACE
      ?auto_15153 - HOIST
      ?auto_15145 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15146 ?auto_15144 ) ( IS-CRATE ?auto_15142 ) ( not ( = ?auto_15141 ?auto_15142 ) ) ( not ( = ?auto_15140 ?auto_15141 ) ) ( not ( = ?auto_15140 ?auto_15142 ) ) ( not ( = ?auto_15150 ?auto_15144 ) ) ( HOIST-AT ?auto_15151 ?auto_15150 ) ( not ( = ?auto_15146 ?auto_15151 ) ) ( AVAILABLE ?auto_15151 ) ( SURFACE-AT ?auto_15142 ?auto_15150 ) ( ON ?auto_15142 ?auto_15143 ) ( CLEAR ?auto_15142 ) ( not ( = ?auto_15141 ?auto_15143 ) ) ( not ( = ?auto_15142 ?auto_15143 ) ) ( not ( = ?auto_15140 ?auto_15143 ) ) ( IS-CRATE ?auto_15141 ) ( not ( = ?auto_15154 ?auto_15144 ) ) ( not ( = ?auto_15150 ?auto_15154 ) ) ( HOIST-AT ?auto_15152 ?auto_15154 ) ( not ( = ?auto_15146 ?auto_15152 ) ) ( not ( = ?auto_15151 ?auto_15152 ) ) ( AVAILABLE ?auto_15152 ) ( SURFACE-AT ?auto_15141 ?auto_15154 ) ( ON ?auto_15141 ?auto_15147 ) ( CLEAR ?auto_15141 ) ( not ( = ?auto_15141 ?auto_15147 ) ) ( not ( = ?auto_15142 ?auto_15147 ) ) ( not ( = ?auto_15140 ?auto_15147 ) ) ( not ( = ?auto_15143 ?auto_15147 ) ) ( SURFACE-AT ?auto_15139 ?auto_15144 ) ( CLEAR ?auto_15139 ) ( IS-CRATE ?auto_15140 ) ( not ( = ?auto_15139 ?auto_15140 ) ) ( not ( = ?auto_15141 ?auto_15139 ) ) ( not ( = ?auto_15142 ?auto_15139 ) ) ( not ( = ?auto_15143 ?auto_15139 ) ) ( not ( = ?auto_15147 ?auto_15139 ) ) ( AVAILABLE ?auto_15146 ) ( TRUCK-AT ?auto_15149 ?auto_15148 ) ( not ( = ?auto_15148 ?auto_15144 ) ) ( not ( = ?auto_15150 ?auto_15148 ) ) ( not ( = ?auto_15154 ?auto_15148 ) ) ( HOIST-AT ?auto_15153 ?auto_15148 ) ( not ( = ?auto_15146 ?auto_15153 ) ) ( not ( = ?auto_15151 ?auto_15153 ) ) ( not ( = ?auto_15152 ?auto_15153 ) ) ( AVAILABLE ?auto_15153 ) ( SURFACE-AT ?auto_15140 ?auto_15148 ) ( ON ?auto_15140 ?auto_15145 ) ( CLEAR ?auto_15140 ) ( not ( = ?auto_15141 ?auto_15145 ) ) ( not ( = ?auto_15142 ?auto_15145 ) ) ( not ( = ?auto_15140 ?auto_15145 ) ) ( not ( = ?auto_15143 ?auto_15145 ) ) ( not ( = ?auto_15147 ?auto_15145 ) ) ( not ( = ?auto_15139 ?auto_15145 ) ) ( ON ?auto_15139 ?auto_15138 ) ( not ( = ?auto_15138 ?auto_15139 ) ) ( not ( = ?auto_15138 ?auto_15140 ) ) ( not ( = ?auto_15138 ?auto_15141 ) ) ( not ( = ?auto_15138 ?auto_15142 ) ) ( not ( = ?auto_15138 ?auto_15143 ) ) ( not ( = ?auto_15138 ?auto_15147 ) ) ( not ( = ?auto_15138 ?auto_15145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15140 ?auto_15141 ?auto_15142 )
      ( MAKE-4CRATE-VERIFY ?auto_15138 ?auto_15139 ?auto_15140 ?auto_15141 ?auto_15142 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15155 - SURFACE
      ?auto_15156 - SURFACE
    )
    :vars
    (
      ?auto_15162 - HOIST
      ?auto_15158 - PLACE
      ?auto_15161 - SURFACE
      ?auto_15166 - PLACE
      ?auto_15167 - HOIST
      ?auto_15157 - SURFACE
      ?auto_15170 - PLACE
      ?auto_15168 - HOIST
      ?auto_15163 - SURFACE
      ?auto_15160 - SURFACE
      ?auto_15164 - PLACE
      ?auto_15169 - HOIST
      ?auto_15159 - SURFACE
      ?auto_15165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15162 ?auto_15158 ) ( IS-CRATE ?auto_15156 ) ( not ( = ?auto_15155 ?auto_15156 ) ) ( not ( = ?auto_15161 ?auto_15155 ) ) ( not ( = ?auto_15161 ?auto_15156 ) ) ( not ( = ?auto_15166 ?auto_15158 ) ) ( HOIST-AT ?auto_15167 ?auto_15166 ) ( not ( = ?auto_15162 ?auto_15167 ) ) ( AVAILABLE ?auto_15167 ) ( SURFACE-AT ?auto_15156 ?auto_15166 ) ( ON ?auto_15156 ?auto_15157 ) ( CLEAR ?auto_15156 ) ( not ( = ?auto_15155 ?auto_15157 ) ) ( not ( = ?auto_15156 ?auto_15157 ) ) ( not ( = ?auto_15161 ?auto_15157 ) ) ( IS-CRATE ?auto_15155 ) ( not ( = ?auto_15170 ?auto_15158 ) ) ( not ( = ?auto_15166 ?auto_15170 ) ) ( HOIST-AT ?auto_15168 ?auto_15170 ) ( not ( = ?auto_15162 ?auto_15168 ) ) ( not ( = ?auto_15167 ?auto_15168 ) ) ( AVAILABLE ?auto_15168 ) ( SURFACE-AT ?auto_15155 ?auto_15170 ) ( ON ?auto_15155 ?auto_15163 ) ( CLEAR ?auto_15155 ) ( not ( = ?auto_15155 ?auto_15163 ) ) ( not ( = ?auto_15156 ?auto_15163 ) ) ( not ( = ?auto_15161 ?auto_15163 ) ) ( not ( = ?auto_15157 ?auto_15163 ) ) ( SURFACE-AT ?auto_15160 ?auto_15158 ) ( CLEAR ?auto_15160 ) ( IS-CRATE ?auto_15161 ) ( not ( = ?auto_15160 ?auto_15161 ) ) ( not ( = ?auto_15155 ?auto_15160 ) ) ( not ( = ?auto_15156 ?auto_15160 ) ) ( not ( = ?auto_15157 ?auto_15160 ) ) ( not ( = ?auto_15163 ?auto_15160 ) ) ( AVAILABLE ?auto_15162 ) ( not ( = ?auto_15164 ?auto_15158 ) ) ( not ( = ?auto_15166 ?auto_15164 ) ) ( not ( = ?auto_15170 ?auto_15164 ) ) ( HOIST-AT ?auto_15169 ?auto_15164 ) ( not ( = ?auto_15162 ?auto_15169 ) ) ( not ( = ?auto_15167 ?auto_15169 ) ) ( not ( = ?auto_15168 ?auto_15169 ) ) ( AVAILABLE ?auto_15169 ) ( SURFACE-AT ?auto_15161 ?auto_15164 ) ( ON ?auto_15161 ?auto_15159 ) ( CLEAR ?auto_15161 ) ( not ( = ?auto_15155 ?auto_15159 ) ) ( not ( = ?auto_15156 ?auto_15159 ) ) ( not ( = ?auto_15161 ?auto_15159 ) ) ( not ( = ?auto_15157 ?auto_15159 ) ) ( not ( = ?auto_15163 ?auto_15159 ) ) ( not ( = ?auto_15160 ?auto_15159 ) ) ( TRUCK-AT ?auto_15165 ?auto_15158 ) )
    :subtasks
    ( ( !DRIVE ?auto_15165 ?auto_15158 ?auto_15164 )
      ( MAKE-2CRATE ?auto_15161 ?auto_15155 ?auto_15156 )
      ( MAKE-1CRATE-VERIFY ?auto_15155 ?auto_15156 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15171 - SURFACE
      ?auto_15172 - SURFACE
      ?auto_15173 - SURFACE
    )
    :vars
    (
      ?auto_15177 - HOIST
      ?auto_15176 - PLACE
      ?auto_15183 - PLACE
      ?auto_15185 - HOIST
      ?auto_15184 - SURFACE
      ?auto_15186 - PLACE
      ?auto_15181 - HOIST
      ?auto_15179 - SURFACE
      ?auto_15180 - SURFACE
      ?auto_15174 - PLACE
      ?auto_15178 - HOIST
      ?auto_15182 - SURFACE
      ?auto_15175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15177 ?auto_15176 ) ( IS-CRATE ?auto_15173 ) ( not ( = ?auto_15172 ?auto_15173 ) ) ( not ( = ?auto_15171 ?auto_15172 ) ) ( not ( = ?auto_15171 ?auto_15173 ) ) ( not ( = ?auto_15183 ?auto_15176 ) ) ( HOIST-AT ?auto_15185 ?auto_15183 ) ( not ( = ?auto_15177 ?auto_15185 ) ) ( AVAILABLE ?auto_15185 ) ( SURFACE-AT ?auto_15173 ?auto_15183 ) ( ON ?auto_15173 ?auto_15184 ) ( CLEAR ?auto_15173 ) ( not ( = ?auto_15172 ?auto_15184 ) ) ( not ( = ?auto_15173 ?auto_15184 ) ) ( not ( = ?auto_15171 ?auto_15184 ) ) ( IS-CRATE ?auto_15172 ) ( not ( = ?auto_15186 ?auto_15176 ) ) ( not ( = ?auto_15183 ?auto_15186 ) ) ( HOIST-AT ?auto_15181 ?auto_15186 ) ( not ( = ?auto_15177 ?auto_15181 ) ) ( not ( = ?auto_15185 ?auto_15181 ) ) ( AVAILABLE ?auto_15181 ) ( SURFACE-AT ?auto_15172 ?auto_15186 ) ( ON ?auto_15172 ?auto_15179 ) ( CLEAR ?auto_15172 ) ( not ( = ?auto_15172 ?auto_15179 ) ) ( not ( = ?auto_15173 ?auto_15179 ) ) ( not ( = ?auto_15171 ?auto_15179 ) ) ( not ( = ?auto_15184 ?auto_15179 ) ) ( SURFACE-AT ?auto_15180 ?auto_15176 ) ( CLEAR ?auto_15180 ) ( IS-CRATE ?auto_15171 ) ( not ( = ?auto_15180 ?auto_15171 ) ) ( not ( = ?auto_15172 ?auto_15180 ) ) ( not ( = ?auto_15173 ?auto_15180 ) ) ( not ( = ?auto_15184 ?auto_15180 ) ) ( not ( = ?auto_15179 ?auto_15180 ) ) ( AVAILABLE ?auto_15177 ) ( not ( = ?auto_15174 ?auto_15176 ) ) ( not ( = ?auto_15183 ?auto_15174 ) ) ( not ( = ?auto_15186 ?auto_15174 ) ) ( HOIST-AT ?auto_15178 ?auto_15174 ) ( not ( = ?auto_15177 ?auto_15178 ) ) ( not ( = ?auto_15185 ?auto_15178 ) ) ( not ( = ?auto_15181 ?auto_15178 ) ) ( AVAILABLE ?auto_15178 ) ( SURFACE-AT ?auto_15171 ?auto_15174 ) ( ON ?auto_15171 ?auto_15182 ) ( CLEAR ?auto_15171 ) ( not ( = ?auto_15172 ?auto_15182 ) ) ( not ( = ?auto_15173 ?auto_15182 ) ) ( not ( = ?auto_15171 ?auto_15182 ) ) ( not ( = ?auto_15184 ?auto_15182 ) ) ( not ( = ?auto_15179 ?auto_15182 ) ) ( not ( = ?auto_15180 ?auto_15182 ) ) ( TRUCK-AT ?auto_15175 ?auto_15176 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15172 ?auto_15173 )
      ( MAKE-2CRATE-VERIFY ?auto_15171 ?auto_15172 ?auto_15173 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15187 - SURFACE
      ?auto_15188 - SURFACE
      ?auto_15189 - SURFACE
      ?auto_15190 - SURFACE
    )
    :vars
    (
      ?auto_15200 - HOIST
      ?auto_15197 - PLACE
      ?auto_15199 - PLACE
      ?auto_15191 - HOIST
      ?auto_15196 - SURFACE
      ?auto_15193 - PLACE
      ?auto_15202 - HOIST
      ?auto_15195 - SURFACE
      ?auto_15201 - PLACE
      ?auto_15198 - HOIST
      ?auto_15194 - SURFACE
      ?auto_15192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15200 ?auto_15197 ) ( IS-CRATE ?auto_15190 ) ( not ( = ?auto_15189 ?auto_15190 ) ) ( not ( = ?auto_15188 ?auto_15189 ) ) ( not ( = ?auto_15188 ?auto_15190 ) ) ( not ( = ?auto_15199 ?auto_15197 ) ) ( HOIST-AT ?auto_15191 ?auto_15199 ) ( not ( = ?auto_15200 ?auto_15191 ) ) ( AVAILABLE ?auto_15191 ) ( SURFACE-AT ?auto_15190 ?auto_15199 ) ( ON ?auto_15190 ?auto_15196 ) ( CLEAR ?auto_15190 ) ( not ( = ?auto_15189 ?auto_15196 ) ) ( not ( = ?auto_15190 ?auto_15196 ) ) ( not ( = ?auto_15188 ?auto_15196 ) ) ( IS-CRATE ?auto_15189 ) ( not ( = ?auto_15193 ?auto_15197 ) ) ( not ( = ?auto_15199 ?auto_15193 ) ) ( HOIST-AT ?auto_15202 ?auto_15193 ) ( not ( = ?auto_15200 ?auto_15202 ) ) ( not ( = ?auto_15191 ?auto_15202 ) ) ( AVAILABLE ?auto_15202 ) ( SURFACE-AT ?auto_15189 ?auto_15193 ) ( ON ?auto_15189 ?auto_15195 ) ( CLEAR ?auto_15189 ) ( not ( = ?auto_15189 ?auto_15195 ) ) ( not ( = ?auto_15190 ?auto_15195 ) ) ( not ( = ?auto_15188 ?auto_15195 ) ) ( not ( = ?auto_15196 ?auto_15195 ) ) ( SURFACE-AT ?auto_15187 ?auto_15197 ) ( CLEAR ?auto_15187 ) ( IS-CRATE ?auto_15188 ) ( not ( = ?auto_15187 ?auto_15188 ) ) ( not ( = ?auto_15189 ?auto_15187 ) ) ( not ( = ?auto_15190 ?auto_15187 ) ) ( not ( = ?auto_15196 ?auto_15187 ) ) ( not ( = ?auto_15195 ?auto_15187 ) ) ( AVAILABLE ?auto_15200 ) ( not ( = ?auto_15201 ?auto_15197 ) ) ( not ( = ?auto_15199 ?auto_15201 ) ) ( not ( = ?auto_15193 ?auto_15201 ) ) ( HOIST-AT ?auto_15198 ?auto_15201 ) ( not ( = ?auto_15200 ?auto_15198 ) ) ( not ( = ?auto_15191 ?auto_15198 ) ) ( not ( = ?auto_15202 ?auto_15198 ) ) ( AVAILABLE ?auto_15198 ) ( SURFACE-AT ?auto_15188 ?auto_15201 ) ( ON ?auto_15188 ?auto_15194 ) ( CLEAR ?auto_15188 ) ( not ( = ?auto_15189 ?auto_15194 ) ) ( not ( = ?auto_15190 ?auto_15194 ) ) ( not ( = ?auto_15188 ?auto_15194 ) ) ( not ( = ?auto_15196 ?auto_15194 ) ) ( not ( = ?auto_15195 ?auto_15194 ) ) ( not ( = ?auto_15187 ?auto_15194 ) ) ( TRUCK-AT ?auto_15192 ?auto_15197 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15188 ?auto_15189 ?auto_15190 )
      ( MAKE-3CRATE-VERIFY ?auto_15187 ?auto_15188 ?auto_15189 ?auto_15190 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15203 - SURFACE
      ?auto_15204 - SURFACE
      ?auto_15205 - SURFACE
      ?auto_15206 - SURFACE
      ?auto_15207 - SURFACE
    )
    :vars
    (
      ?auto_15217 - HOIST
      ?auto_15214 - PLACE
      ?auto_15216 - PLACE
      ?auto_15208 - HOIST
      ?auto_15213 - SURFACE
      ?auto_15210 - PLACE
      ?auto_15219 - HOIST
      ?auto_15212 - SURFACE
      ?auto_15218 - PLACE
      ?auto_15215 - HOIST
      ?auto_15211 - SURFACE
      ?auto_15209 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15217 ?auto_15214 ) ( IS-CRATE ?auto_15207 ) ( not ( = ?auto_15206 ?auto_15207 ) ) ( not ( = ?auto_15205 ?auto_15206 ) ) ( not ( = ?auto_15205 ?auto_15207 ) ) ( not ( = ?auto_15216 ?auto_15214 ) ) ( HOIST-AT ?auto_15208 ?auto_15216 ) ( not ( = ?auto_15217 ?auto_15208 ) ) ( AVAILABLE ?auto_15208 ) ( SURFACE-AT ?auto_15207 ?auto_15216 ) ( ON ?auto_15207 ?auto_15213 ) ( CLEAR ?auto_15207 ) ( not ( = ?auto_15206 ?auto_15213 ) ) ( not ( = ?auto_15207 ?auto_15213 ) ) ( not ( = ?auto_15205 ?auto_15213 ) ) ( IS-CRATE ?auto_15206 ) ( not ( = ?auto_15210 ?auto_15214 ) ) ( not ( = ?auto_15216 ?auto_15210 ) ) ( HOIST-AT ?auto_15219 ?auto_15210 ) ( not ( = ?auto_15217 ?auto_15219 ) ) ( not ( = ?auto_15208 ?auto_15219 ) ) ( AVAILABLE ?auto_15219 ) ( SURFACE-AT ?auto_15206 ?auto_15210 ) ( ON ?auto_15206 ?auto_15212 ) ( CLEAR ?auto_15206 ) ( not ( = ?auto_15206 ?auto_15212 ) ) ( not ( = ?auto_15207 ?auto_15212 ) ) ( not ( = ?auto_15205 ?auto_15212 ) ) ( not ( = ?auto_15213 ?auto_15212 ) ) ( SURFACE-AT ?auto_15204 ?auto_15214 ) ( CLEAR ?auto_15204 ) ( IS-CRATE ?auto_15205 ) ( not ( = ?auto_15204 ?auto_15205 ) ) ( not ( = ?auto_15206 ?auto_15204 ) ) ( not ( = ?auto_15207 ?auto_15204 ) ) ( not ( = ?auto_15213 ?auto_15204 ) ) ( not ( = ?auto_15212 ?auto_15204 ) ) ( AVAILABLE ?auto_15217 ) ( not ( = ?auto_15218 ?auto_15214 ) ) ( not ( = ?auto_15216 ?auto_15218 ) ) ( not ( = ?auto_15210 ?auto_15218 ) ) ( HOIST-AT ?auto_15215 ?auto_15218 ) ( not ( = ?auto_15217 ?auto_15215 ) ) ( not ( = ?auto_15208 ?auto_15215 ) ) ( not ( = ?auto_15219 ?auto_15215 ) ) ( AVAILABLE ?auto_15215 ) ( SURFACE-AT ?auto_15205 ?auto_15218 ) ( ON ?auto_15205 ?auto_15211 ) ( CLEAR ?auto_15205 ) ( not ( = ?auto_15206 ?auto_15211 ) ) ( not ( = ?auto_15207 ?auto_15211 ) ) ( not ( = ?auto_15205 ?auto_15211 ) ) ( not ( = ?auto_15213 ?auto_15211 ) ) ( not ( = ?auto_15212 ?auto_15211 ) ) ( not ( = ?auto_15204 ?auto_15211 ) ) ( TRUCK-AT ?auto_15209 ?auto_15214 ) ( ON ?auto_15204 ?auto_15203 ) ( not ( = ?auto_15203 ?auto_15204 ) ) ( not ( = ?auto_15203 ?auto_15205 ) ) ( not ( = ?auto_15203 ?auto_15206 ) ) ( not ( = ?auto_15203 ?auto_15207 ) ) ( not ( = ?auto_15203 ?auto_15213 ) ) ( not ( = ?auto_15203 ?auto_15212 ) ) ( not ( = ?auto_15203 ?auto_15211 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15205 ?auto_15206 ?auto_15207 )
      ( MAKE-4CRATE-VERIFY ?auto_15203 ?auto_15204 ?auto_15205 ?auto_15206 ?auto_15207 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15220 - SURFACE
      ?auto_15221 - SURFACE
    )
    :vars
    (
      ?auto_15233 - HOIST
      ?auto_15229 - PLACE
      ?auto_15232 - SURFACE
      ?auto_15231 - PLACE
      ?auto_15222 - HOIST
      ?auto_15228 - SURFACE
      ?auto_15225 - PLACE
      ?auto_15235 - HOIST
      ?auto_15227 - SURFACE
      ?auto_15223 - SURFACE
      ?auto_15234 - PLACE
      ?auto_15230 - HOIST
      ?auto_15226 - SURFACE
      ?auto_15224 - TRUCK
      ?auto_15236 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15233 ?auto_15229 ) ( IS-CRATE ?auto_15221 ) ( not ( = ?auto_15220 ?auto_15221 ) ) ( not ( = ?auto_15232 ?auto_15220 ) ) ( not ( = ?auto_15232 ?auto_15221 ) ) ( not ( = ?auto_15231 ?auto_15229 ) ) ( HOIST-AT ?auto_15222 ?auto_15231 ) ( not ( = ?auto_15233 ?auto_15222 ) ) ( AVAILABLE ?auto_15222 ) ( SURFACE-AT ?auto_15221 ?auto_15231 ) ( ON ?auto_15221 ?auto_15228 ) ( CLEAR ?auto_15221 ) ( not ( = ?auto_15220 ?auto_15228 ) ) ( not ( = ?auto_15221 ?auto_15228 ) ) ( not ( = ?auto_15232 ?auto_15228 ) ) ( IS-CRATE ?auto_15220 ) ( not ( = ?auto_15225 ?auto_15229 ) ) ( not ( = ?auto_15231 ?auto_15225 ) ) ( HOIST-AT ?auto_15235 ?auto_15225 ) ( not ( = ?auto_15233 ?auto_15235 ) ) ( not ( = ?auto_15222 ?auto_15235 ) ) ( AVAILABLE ?auto_15235 ) ( SURFACE-AT ?auto_15220 ?auto_15225 ) ( ON ?auto_15220 ?auto_15227 ) ( CLEAR ?auto_15220 ) ( not ( = ?auto_15220 ?auto_15227 ) ) ( not ( = ?auto_15221 ?auto_15227 ) ) ( not ( = ?auto_15232 ?auto_15227 ) ) ( not ( = ?auto_15228 ?auto_15227 ) ) ( IS-CRATE ?auto_15232 ) ( not ( = ?auto_15223 ?auto_15232 ) ) ( not ( = ?auto_15220 ?auto_15223 ) ) ( not ( = ?auto_15221 ?auto_15223 ) ) ( not ( = ?auto_15228 ?auto_15223 ) ) ( not ( = ?auto_15227 ?auto_15223 ) ) ( not ( = ?auto_15234 ?auto_15229 ) ) ( not ( = ?auto_15231 ?auto_15234 ) ) ( not ( = ?auto_15225 ?auto_15234 ) ) ( HOIST-AT ?auto_15230 ?auto_15234 ) ( not ( = ?auto_15233 ?auto_15230 ) ) ( not ( = ?auto_15222 ?auto_15230 ) ) ( not ( = ?auto_15235 ?auto_15230 ) ) ( AVAILABLE ?auto_15230 ) ( SURFACE-AT ?auto_15232 ?auto_15234 ) ( ON ?auto_15232 ?auto_15226 ) ( CLEAR ?auto_15232 ) ( not ( = ?auto_15220 ?auto_15226 ) ) ( not ( = ?auto_15221 ?auto_15226 ) ) ( not ( = ?auto_15232 ?auto_15226 ) ) ( not ( = ?auto_15228 ?auto_15226 ) ) ( not ( = ?auto_15227 ?auto_15226 ) ) ( not ( = ?auto_15223 ?auto_15226 ) ) ( TRUCK-AT ?auto_15224 ?auto_15229 ) ( SURFACE-AT ?auto_15236 ?auto_15229 ) ( CLEAR ?auto_15236 ) ( LIFTING ?auto_15233 ?auto_15223 ) ( IS-CRATE ?auto_15223 ) ( not ( = ?auto_15236 ?auto_15223 ) ) ( not ( = ?auto_15220 ?auto_15236 ) ) ( not ( = ?auto_15221 ?auto_15236 ) ) ( not ( = ?auto_15232 ?auto_15236 ) ) ( not ( = ?auto_15228 ?auto_15236 ) ) ( not ( = ?auto_15227 ?auto_15236 ) ) ( not ( = ?auto_15226 ?auto_15236 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15236 ?auto_15223 )
      ( MAKE-2CRATE ?auto_15232 ?auto_15220 ?auto_15221 )
      ( MAKE-1CRATE-VERIFY ?auto_15220 ?auto_15221 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15237 - SURFACE
      ?auto_15238 - SURFACE
      ?auto_15239 - SURFACE
    )
    :vars
    (
      ?auto_15242 - HOIST
      ?auto_15240 - PLACE
      ?auto_15253 - PLACE
      ?auto_15250 - HOIST
      ?auto_15247 - SURFACE
      ?auto_15244 - PLACE
      ?auto_15245 - HOIST
      ?auto_15246 - SURFACE
      ?auto_15249 - SURFACE
      ?auto_15251 - PLACE
      ?auto_15241 - HOIST
      ?auto_15252 - SURFACE
      ?auto_15243 - TRUCK
      ?auto_15248 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15242 ?auto_15240 ) ( IS-CRATE ?auto_15239 ) ( not ( = ?auto_15238 ?auto_15239 ) ) ( not ( = ?auto_15237 ?auto_15238 ) ) ( not ( = ?auto_15237 ?auto_15239 ) ) ( not ( = ?auto_15253 ?auto_15240 ) ) ( HOIST-AT ?auto_15250 ?auto_15253 ) ( not ( = ?auto_15242 ?auto_15250 ) ) ( AVAILABLE ?auto_15250 ) ( SURFACE-AT ?auto_15239 ?auto_15253 ) ( ON ?auto_15239 ?auto_15247 ) ( CLEAR ?auto_15239 ) ( not ( = ?auto_15238 ?auto_15247 ) ) ( not ( = ?auto_15239 ?auto_15247 ) ) ( not ( = ?auto_15237 ?auto_15247 ) ) ( IS-CRATE ?auto_15238 ) ( not ( = ?auto_15244 ?auto_15240 ) ) ( not ( = ?auto_15253 ?auto_15244 ) ) ( HOIST-AT ?auto_15245 ?auto_15244 ) ( not ( = ?auto_15242 ?auto_15245 ) ) ( not ( = ?auto_15250 ?auto_15245 ) ) ( AVAILABLE ?auto_15245 ) ( SURFACE-AT ?auto_15238 ?auto_15244 ) ( ON ?auto_15238 ?auto_15246 ) ( CLEAR ?auto_15238 ) ( not ( = ?auto_15238 ?auto_15246 ) ) ( not ( = ?auto_15239 ?auto_15246 ) ) ( not ( = ?auto_15237 ?auto_15246 ) ) ( not ( = ?auto_15247 ?auto_15246 ) ) ( IS-CRATE ?auto_15237 ) ( not ( = ?auto_15249 ?auto_15237 ) ) ( not ( = ?auto_15238 ?auto_15249 ) ) ( not ( = ?auto_15239 ?auto_15249 ) ) ( not ( = ?auto_15247 ?auto_15249 ) ) ( not ( = ?auto_15246 ?auto_15249 ) ) ( not ( = ?auto_15251 ?auto_15240 ) ) ( not ( = ?auto_15253 ?auto_15251 ) ) ( not ( = ?auto_15244 ?auto_15251 ) ) ( HOIST-AT ?auto_15241 ?auto_15251 ) ( not ( = ?auto_15242 ?auto_15241 ) ) ( not ( = ?auto_15250 ?auto_15241 ) ) ( not ( = ?auto_15245 ?auto_15241 ) ) ( AVAILABLE ?auto_15241 ) ( SURFACE-AT ?auto_15237 ?auto_15251 ) ( ON ?auto_15237 ?auto_15252 ) ( CLEAR ?auto_15237 ) ( not ( = ?auto_15238 ?auto_15252 ) ) ( not ( = ?auto_15239 ?auto_15252 ) ) ( not ( = ?auto_15237 ?auto_15252 ) ) ( not ( = ?auto_15247 ?auto_15252 ) ) ( not ( = ?auto_15246 ?auto_15252 ) ) ( not ( = ?auto_15249 ?auto_15252 ) ) ( TRUCK-AT ?auto_15243 ?auto_15240 ) ( SURFACE-AT ?auto_15248 ?auto_15240 ) ( CLEAR ?auto_15248 ) ( LIFTING ?auto_15242 ?auto_15249 ) ( IS-CRATE ?auto_15249 ) ( not ( = ?auto_15248 ?auto_15249 ) ) ( not ( = ?auto_15238 ?auto_15248 ) ) ( not ( = ?auto_15239 ?auto_15248 ) ) ( not ( = ?auto_15237 ?auto_15248 ) ) ( not ( = ?auto_15247 ?auto_15248 ) ) ( not ( = ?auto_15246 ?auto_15248 ) ) ( not ( = ?auto_15252 ?auto_15248 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15238 ?auto_15239 )
      ( MAKE-2CRATE-VERIFY ?auto_15237 ?auto_15238 ?auto_15239 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15254 - SURFACE
      ?auto_15255 - SURFACE
      ?auto_15256 - SURFACE
      ?auto_15257 - SURFACE
    )
    :vars
    (
      ?auto_15262 - HOIST
      ?auto_15270 - PLACE
      ?auto_15264 - PLACE
      ?auto_15267 - HOIST
      ?auto_15258 - SURFACE
      ?auto_15260 - PLACE
      ?auto_15268 - HOIST
      ?auto_15259 - SURFACE
      ?auto_15261 - PLACE
      ?auto_15263 - HOIST
      ?auto_15266 - SURFACE
      ?auto_15265 - TRUCK
      ?auto_15269 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15262 ?auto_15270 ) ( IS-CRATE ?auto_15257 ) ( not ( = ?auto_15256 ?auto_15257 ) ) ( not ( = ?auto_15255 ?auto_15256 ) ) ( not ( = ?auto_15255 ?auto_15257 ) ) ( not ( = ?auto_15264 ?auto_15270 ) ) ( HOIST-AT ?auto_15267 ?auto_15264 ) ( not ( = ?auto_15262 ?auto_15267 ) ) ( AVAILABLE ?auto_15267 ) ( SURFACE-AT ?auto_15257 ?auto_15264 ) ( ON ?auto_15257 ?auto_15258 ) ( CLEAR ?auto_15257 ) ( not ( = ?auto_15256 ?auto_15258 ) ) ( not ( = ?auto_15257 ?auto_15258 ) ) ( not ( = ?auto_15255 ?auto_15258 ) ) ( IS-CRATE ?auto_15256 ) ( not ( = ?auto_15260 ?auto_15270 ) ) ( not ( = ?auto_15264 ?auto_15260 ) ) ( HOIST-AT ?auto_15268 ?auto_15260 ) ( not ( = ?auto_15262 ?auto_15268 ) ) ( not ( = ?auto_15267 ?auto_15268 ) ) ( AVAILABLE ?auto_15268 ) ( SURFACE-AT ?auto_15256 ?auto_15260 ) ( ON ?auto_15256 ?auto_15259 ) ( CLEAR ?auto_15256 ) ( not ( = ?auto_15256 ?auto_15259 ) ) ( not ( = ?auto_15257 ?auto_15259 ) ) ( not ( = ?auto_15255 ?auto_15259 ) ) ( not ( = ?auto_15258 ?auto_15259 ) ) ( IS-CRATE ?auto_15255 ) ( not ( = ?auto_15254 ?auto_15255 ) ) ( not ( = ?auto_15256 ?auto_15254 ) ) ( not ( = ?auto_15257 ?auto_15254 ) ) ( not ( = ?auto_15258 ?auto_15254 ) ) ( not ( = ?auto_15259 ?auto_15254 ) ) ( not ( = ?auto_15261 ?auto_15270 ) ) ( not ( = ?auto_15264 ?auto_15261 ) ) ( not ( = ?auto_15260 ?auto_15261 ) ) ( HOIST-AT ?auto_15263 ?auto_15261 ) ( not ( = ?auto_15262 ?auto_15263 ) ) ( not ( = ?auto_15267 ?auto_15263 ) ) ( not ( = ?auto_15268 ?auto_15263 ) ) ( AVAILABLE ?auto_15263 ) ( SURFACE-AT ?auto_15255 ?auto_15261 ) ( ON ?auto_15255 ?auto_15266 ) ( CLEAR ?auto_15255 ) ( not ( = ?auto_15256 ?auto_15266 ) ) ( not ( = ?auto_15257 ?auto_15266 ) ) ( not ( = ?auto_15255 ?auto_15266 ) ) ( not ( = ?auto_15258 ?auto_15266 ) ) ( not ( = ?auto_15259 ?auto_15266 ) ) ( not ( = ?auto_15254 ?auto_15266 ) ) ( TRUCK-AT ?auto_15265 ?auto_15270 ) ( SURFACE-AT ?auto_15269 ?auto_15270 ) ( CLEAR ?auto_15269 ) ( LIFTING ?auto_15262 ?auto_15254 ) ( IS-CRATE ?auto_15254 ) ( not ( = ?auto_15269 ?auto_15254 ) ) ( not ( = ?auto_15256 ?auto_15269 ) ) ( not ( = ?auto_15257 ?auto_15269 ) ) ( not ( = ?auto_15255 ?auto_15269 ) ) ( not ( = ?auto_15258 ?auto_15269 ) ) ( not ( = ?auto_15259 ?auto_15269 ) ) ( not ( = ?auto_15266 ?auto_15269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15255 ?auto_15256 ?auto_15257 )
      ( MAKE-3CRATE-VERIFY ?auto_15254 ?auto_15255 ?auto_15256 ?auto_15257 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15271 - SURFACE
      ?auto_15272 - SURFACE
      ?auto_15273 - SURFACE
      ?auto_15274 - SURFACE
      ?auto_15275 - SURFACE
    )
    :vars
    (
      ?auto_15280 - HOIST
      ?auto_15287 - PLACE
      ?auto_15282 - PLACE
      ?auto_15285 - HOIST
      ?auto_15276 - SURFACE
      ?auto_15278 - PLACE
      ?auto_15286 - HOIST
      ?auto_15277 - SURFACE
      ?auto_15279 - PLACE
      ?auto_15281 - HOIST
      ?auto_15284 - SURFACE
      ?auto_15283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15280 ?auto_15287 ) ( IS-CRATE ?auto_15275 ) ( not ( = ?auto_15274 ?auto_15275 ) ) ( not ( = ?auto_15273 ?auto_15274 ) ) ( not ( = ?auto_15273 ?auto_15275 ) ) ( not ( = ?auto_15282 ?auto_15287 ) ) ( HOIST-AT ?auto_15285 ?auto_15282 ) ( not ( = ?auto_15280 ?auto_15285 ) ) ( AVAILABLE ?auto_15285 ) ( SURFACE-AT ?auto_15275 ?auto_15282 ) ( ON ?auto_15275 ?auto_15276 ) ( CLEAR ?auto_15275 ) ( not ( = ?auto_15274 ?auto_15276 ) ) ( not ( = ?auto_15275 ?auto_15276 ) ) ( not ( = ?auto_15273 ?auto_15276 ) ) ( IS-CRATE ?auto_15274 ) ( not ( = ?auto_15278 ?auto_15287 ) ) ( not ( = ?auto_15282 ?auto_15278 ) ) ( HOIST-AT ?auto_15286 ?auto_15278 ) ( not ( = ?auto_15280 ?auto_15286 ) ) ( not ( = ?auto_15285 ?auto_15286 ) ) ( AVAILABLE ?auto_15286 ) ( SURFACE-AT ?auto_15274 ?auto_15278 ) ( ON ?auto_15274 ?auto_15277 ) ( CLEAR ?auto_15274 ) ( not ( = ?auto_15274 ?auto_15277 ) ) ( not ( = ?auto_15275 ?auto_15277 ) ) ( not ( = ?auto_15273 ?auto_15277 ) ) ( not ( = ?auto_15276 ?auto_15277 ) ) ( IS-CRATE ?auto_15273 ) ( not ( = ?auto_15272 ?auto_15273 ) ) ( not ( = ?auto_15274 ?auto_15272 ) ) ( not ( = ?auto_15275 ?auto_15272 ) ) ( not ( = ?auto_15276 ?auto_15272 ) ) ( not ( = ?auto_15277 ?auto_15272 ) ) ( not ( = ?auto_15279 ?auto_15287 ) ) ( not ( = ?auto_15282 ?auto_15279 ) ) ( not ( = ?auto_15278 ?auto_15279 ) ) ( HOIST-AT ?auto_15281 ?auto_15279 ) ( not ( = ?auto_15280 ?auto_15281 ) ) ( not ( = ?auto_15285 ?auto_15281 ) ) ( not ( = ?auto_15286 ?auto_15281 ) ) ( AVAILABLE ?auto_15281 ) ( SURFACE-AT ?auto_15273 ?auto_15279 ) ( ON ?auto_15273 ?auto_15284 ) ( CLEAR ?auto_15273 ) ( not ( = ?auto_15274 ?auto_15284 ) ) ( not ( = ?auto_15275 ?auto_15284 ) ) ( not ( = ?auto_15273 ?auto_15284 ) ) ( not ( = ?auto_15276 ?auto_15284 ) ) ( not ( = ?auto_15277 ?auto_15284 ) ) ( not ( = ?auto_15272 ?auto_15284 ) ) ( TRUCK-AT ?auto_15283 ?auto_15287 ) ( SURFACE-AT ?auto_15271 ?auto_15287 ) ( CLEAR ?auto_15271 ) ( LIFTING ?auto_15280 ?auto_15272 ) ( IS-CRATE ?auto_15272 ) ( not ( = ?auto_15271 ?auto_15272 ) ) ( not ( = ?auto_15274 ?auto_15271 ) ) ( not ( = ?auto_15275 ?auto_15271 ) ) ( not ( = ?auto_15273 ?auto_15271 ) ) ( not ( = ?auto_15276 ?auto_15271 ) ) ( not ( = ?auto_15277 ?auto_15271 ) ) ( not ( = ?auto_15284 ?auto_15271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15273 ?auto_15274 ?auto_15275 )
      ( MAKE-4CRATE-VERIFY ?auto_15271 ?auto_15272 ?auto_15273 ?auto_15274 ?auto_15275 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15288 - SURFACE
      ?auto_15289 - SURFACE
    )
    :vars
    (
      ?auto_15294 - HOIST
      ?auto_15304 - PLACE
      ?auto_15302 - SURFACE
      ?auto_15296 - PLACE
      ?auto_15300 - HOIST
      ?auto_15290 - SURFACE
      ?auto_15292 - PLACE
      ?auto_15301 - HOIST
      ?auto_15291 - SURFACE
      ?auto_15297 - SURFACE
      ?auto_15293 - PLACE
      ?auto_15295 - HOIST
      ?auto_15299 - SURFACE
      ?auto_15298 - TRUCK
      ?auto_15303 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15294 ?auto_15304 ) ( IS-CRATE ?auto_15289 ) ( not ( = ?auto_15288 ?auto_15289 ) ) ( not ( = ?auto_15302 ?auto_15288 ) ) ( not ( = ?auto_15302 ?auto_15289 ) ) ( not ( = ?auto_15296 ?auto_15304 ) ) ( HOIST-AT ?auto_15300 ?auto_15296 ) ( not ( = ?auto_15294 ?auto_15300 ) ) ( AVAILABLE ?auto_15300 ) ( SURFACE-AT ?auto_15289 ?auto_15296 ) ( ON ?auto_15289 ?auto_15290 ) ( CLEAR ?auto_15289 ) ( not ( = ?auto_15288 ?auto_15290 ) ) ( not ( = ?auto_15289 ?auto_15290 ) ) ( not ( = ?auto_15302 ?auto_15290 ) ) ( IS-CRATE ?auto_15288 ) ( not ( = ?auto_15292 ?auto_15304 ) ) ( not ( = ?auto_15296 ?auto_15292 ) ) ( HOIST-AT ?auto_15301 ?auto_15292 ) ( not ( = ?auto_15294 ?auto_15301 ) ) ( not ( = ?auto_15300 ?auto_15301 ) ) ( AVAILABLE ?auto_15301 ) ( SURFACE-AT ?auto_15288 ?auto_15292 ) ( ON ?auto_15288 ?auto_15291 ) ( CLEAR ?auto_15288 ) ( not ( = ?auto_15288 ?auto_15291 ) ) ( not ( = ?auto_15289 ?auto_15291 ) ) ( not ( = ?auto_15302 ?auto_15291 ) ) ( not ( = ?auto_15290 ?auto_15291 ) ) ( IS-CRATE ?auto_15302 ) ( not ( = ?auto_15297 ?auto_15302 ) ) ( not ( = ?auto_15288 ?auto_15297 ) ) ( not ( = ?auto_15289 ?auto_15297 ) ) ( not ( = ?auto_15290 ?auto_15297 ) ) ( not ( = ?auto_15291 ?auto_15297 ) ) ( not ( = ?auto_15293 ?auto_15304 ) ) ( not ( = ?auto_15296 ?auto_15293 ) ) ( not ( = ?auto_15292 ?auto_15293 ) ) ( HOIST-AT ?auto_15295 ?auto_15293 ) ( not ( = ?auto_15294 ?auto_15295 ) ) ( not ( = ?auto_15300 ?auto_15295 ) ) ( not ( = ?auto_15301 ?auto_15295 ) ) ( AVAILABLE ?auto_15295 ) ( SURFACE-AT ?auto_15302 ?auto_15293 ) ( ON ?auto_15302 ?auto_15299 ) ( CLEAR ?auto_15302 ) ( not ( = ?auto_15288 ?auto_15299 ) ) ( not ( = ?auto_15289 ?auto_15299 ) ) ( not ( = ?auto_15302 ?auto_15299 ) ) ( not ( = ?auto_15290 ?auto_15299 ) ) ( not ( = ?auto_15291 ?auto_15299 ) ) ( not ( = ?auto_15297 ?auto_15299 ) ) ( TRUCK-AT ?auto_15298 ?auto_15304 ) ( SURFACE-AT ?auto_15303 ?auto_15304 ) ( CLEAR ?auto_15303 ) ( IS-CRATE ?auto_15297 ) ( not ( = ?auto_15303 ?auto_15297 ) ) ( not ( = ?auto_15288 ?auto_15303 ) ) ( not ( = ?auto_15289 ?auto_15303 ) ) ( not ( = ?auto_15302 ?auto_15303 ) ) ( not ( = ?auto_15290 ?auto_15303 ) ) ( not ( = ?auto_15291 ?auto_15303 ) ) ( not ( = ?auto_15299 ?auto_15303 ) ) ( AVAILABLE ?auto_15294 ) ( IN ?auto_15297 ?auto_15298 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15294 ?auto_15297 ?auto_15298 ?auto_15304 )
      ( MAKE-2CRATE ?auto_15302 ?auto_15288 ?auto_15289 )
      ( MAKE-1CRATE-VERIFY ?auto_15288 ?auto_15289 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15305 - SURFACE
      ?auto_15306 - SURFACE
      ?auto_15307 - SURFACE
    )
    :vars
    (
      ?auto_15308 - HOIST
      ?auto_15315 - PLACE
      ?auto_15317 - PLACE
      ?auto_15314 - HOIST
      ?auto_15311 - SURFACE
      ?auto_15321 - PLACE
      ?auto_15312 - HOIST
      ?auto_15309 - SURFACE
      ?auto_15313 - SURFACE
      ?auto_15318 - PLACE
      ?auto_15316 - HOIST
      ?auto_15310 - SURFACE
      ?auto_15319 - TRUCK
      ?auto_15320 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15308 ?auto_15315 ) ( IS-CRATE ?auto_15307 ) ( not ( = ?auto_15306 ?auto_15307 ) ) ( not ( = ?auto_15305 ?auto_15306 ) ) ( not ( = ?auto_15305 ?auto_15307 ) ) ( not ( = ?auto_15317 ?auto_15315 ) ) ( HOIST-AT ?auto_15314 ?auto_15317 ) ( not ( = ?auto_15308 ?auto_15314 ) ) ( AVAILABLE ?auto_15314 ) ( SURFACE-AT ?auto_15307 ?auto_15317 ) ( ON ?auto_15307 ?auto_15311 ) ( CLEAR ?auto_15307 ) ( not ( = ?auto_15306 ?auto_15311 ) ) ( not ( = ?auto_15307 ?auto_15311 ) ) ( not ( = ?auto_15305 ?auto_15311 ) ) ( IS-CRATE ?auto_15306 ) ( not ( = ?auto_15321 ?auto_15315 ) ) ( not ( = ?auto_15317 ?auto_15321 ) ) ( HOIST-AT ?auto_15312 ?auto_15321 ) ( not ( = ?auto_15308 ?auto_15312 ) ) ( not ( = ?auto_15314 ?auto_15312 ) ) ( AVAILABLE ?auto_15312 ) ( SURFACE-AT ?auto_15306 ?auto_15321 ) ( ON ?auto_15306 ?auto_15309 ) ( CLEAR ?auto_15306 ) ( not ( = ?auto_15306 ?auto_15309 ) ) ( not ( = ?auto_15307 ?auto_15309 ) ) ( not ( = ?auto_15305 ?auto_15309 ) ) ( not ( = ?auto_15311 ?auto_15309 ) ) ( IS-CRATE ?auto_15305 ) ( not ( = ?auto_15313 ?auto_15305 ) ) ( not ( = ?auto_15306 ?auto_15313 ) ) ( not ( = ?auto_15307 ?auto_15313 ) ) ( not ( = ?auto_15311 ?auto_15313 ) ) ( not ( = ?auto_15309 ?auto_15313 ) ) ( not ( = ?auto_15318 ?auto_15315 ) ) ( not ( = ?auto_15317 ?auto_15318 ) ) ( not ( = ?auto_15321 ?auto_15318 ) ) ( HOIST-AT ?auto_15316 ?auto_15318 ) ( not ( = ?auto_15308 ?auto_15316 ) ) ( not ( = ?auto_15314 ?auto_15316 ) ) ( not ( = ?auto_15312 ?auto_15316 ) ) ( AVAILABLE ?auto_15316 ) ( SURFACE-AT ?auto_15305 ?auto_15318 ) ( ON ?auto_15305 ?auto_15310 ) ( CLEAR ?auto_15305 ) ( not ( = ?auto_15306 ?auto_15310 ) ) ( not ( = ?auto_15307 ?auto_15310 ) ) ( not ( = ?auto_15305 ?auto_15310 ) ) ( not ( = ?auto_15311 ?auto_15310 ) ) ( not ( = ?auto_15309 ?auto_15310 ) ) ( not ( = ?auto_15313 ?auto_15310 ) ) ( TRUCK-AT ?auto_15319 ?auto_15315 ) ( SURFACE-AT ?auto_15320 ?auto_15315 ) ( CLEAR ?auto_15320 ) ( IS-CRATE ?auto_15313 ) ( not ( = ?auto_15320 ?auto_15313 ) ) ( not ( = ?auto_15306 ?auto_15320 ) ) ( not ( = ?auto_15307 ?auto_15320 ) ) ( not ( = ?auto_15305 ?auto_15320 ) ) ( not ( = ?auto_15311 ?auto_15320 ) ) ( not ( = ?auto_15309 ?auto_15320 ) ) ( not ( = ?auto_15310 ?auto_15320 ) ) ( AVAILABLE ?auto_15308 ) ( IN ?auto_15313 ?auto_15319 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15306 ?auto_15307 )
      ( MAKE-2CRATE-VERIFY ?auto_15305 ?auto_15306 ?auto_15307 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15322 - SURFACE
      ?auto_15323 - SURFACE
      ?auto_15324 - SURFACE
      ?auto_15325 - SURFACE
    )
    :vars
    (
      ?auto_15328 - HOIST
      ?auto_15337 - PLACE
      ?auto_15326 - PLACE
      ?auto_15329 - HOIST
      ?auto_15338 - SURFACE
      ?auto_15332 - PLACE
      ?auto_15335 - HOIST
      ?auto_15327 - SURFACE
      ?auto_15331 - PLACE
      ?auto_15330 - HOIST
      ?auto_15336 - SURFACE
      ?auto_15334 - TRUCK
      ?auto_15333 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15328 ?auto_15337 ) ( IS-CRATE ?auto_15325 ) ( not ( = ?auto_15324 ?auto_15325 ) ) ( not ( = ?auto_15323 ?auto_15324 ) ) ( not ( = ?auto_15323 ?auto_15325 ) ) ( not ( = ?auto_15326 ?auto_15337 ) ) ( HOIST-AT ?auto_15329 ?auto_15326 ) ( not ( = ?auto_15328 ?auto_15329 ) ) ( AVAILABLE ?auto_15329 ) ( SURFACE-AT ?auto_15325 ?auto_15326 ) ( ON ?auto_15325 ?auto_15338 ) ( CLEAR ?auto_15325 ) ( not ( = ?auto_15324 ?auto_15338 ) ) ( not ( = ?auto_15325 ?auto_15338 ) ) ( not ( = ?auto_15323 ?auto_15338 ) ) ( IS-CRATE ?auto_15324 ) ( not ( = ?auto_15332 ?auto_15337 ) ) ( not ( = ?auto_15326 ?auto_15332 ) ) ( HOIST-AT ?auto_15335 ?auto_15332 ) ( not ( = ?auto_15328 ?auto_15335 ) ) ( not ( = ?auto_15329 ?auto_15335 ) ) ( AVAILABLE ?auto_15335 ) ( SURFACE-AT ?auto_15324 ?auto_15332 ) ( ON ?auto_15324 ?auto_15327 ) ( CLEAR ?auto_15324 ) ( not ( = ?auto_15324 ?auto_15327 ) ) ( not ( = ?auto_15325 ?auto_15327 ) ) ( not ( = ?auto_15323 ?auto_15327 ) ) ( not ( = ?auto_15338 ?auto_15327 ) ) ( IS-CRATE ?auto_15323 ) ( not ( = ?auto_15322 ?auto_15323 ) ) ( not ( = ?auto_15324 ?auto_15322 ) ) ( not ( = ?auto_15325 ?auto_15322 ) ) ( not ( = ?auto_15338 ?auto_15322 ) ) ( not ( = ?auto_15327 ?auto_15322 ) ) ( not ( = ?auto_15331 ?auto_15337 ) ) ( not ( = ?auto_15326 ?auto_15331 ) ) ( not ( = ?auto_15332 ?auto_15331 ) ) ( HOIST-AT ?auto_15330 ?auto_15331 ) ( not ( = ?auto_15328 ?auto_15330 ) ) ( not ( = ?auto_15329 ?auto_15330 ) ) ( not ( = ?auto_15335 ?auto_15330 ) ) ( AVAILABLE ?auto_15330 ) ( SURFACE-AT ?auto_15323 ?auto_15331 ) ( ON ?auto_15323 ?auto_15336 ) ( CLEAR ?auto_15323 ) ( not ( = ?auto_15324 ?auto_15336 ) ) ( not ( = ?auto_15325 ?auto_15336 ) ) ( not ( = ?auto_15323 ?auto_15336 ) ) ( not ( = ?auto_15338 ?auto_15336 ) ) ( not ( = ?auto_15327 ?auto_15336 ) ) ( not ( = ?auto_15322 ?auto_15336 ) ) ( TRUCK-AT ?auto_15334 ?auto_15337 ) ( SURFACE-AT ?auto_15333 ?auto_15337 ) ( CLEAR ?auto_15333 ) ( IS-CRATE ?auto_15322 ) ( not ( = ?auto_15333 ?auto_15322 ) ) ( not ( = ?auto_15324 ?auto_15333 ) ) ( not ( = ?auto_15325 ?auto_15333 ) ) ( not ( = ?auto_15323 ?auto_15333 ) ) ( not ( = ?auto_15338 ?auto_15333 ) ) ( not ( = ?auto_15327 ?auto_15333 ) ) ( not ( = ?auto_15336 ?auto_15333 ) ) ( AVAILABLE ?auto_15328 ) ( IN ?auto_15322 ?auto_15334 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15323 ?auto_15324 ?auto_15325 )
      ( MAKE-3CRATE-VERIFY ?auto_15322 ?auto_15323 ?auto_15324 ?auto_15325 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15339 - SURFACE
      ?auto_15340 - SURFACE
      ?auto_15341 - SURFACE
      ?auto_15342 - SURFACE
      ?auto_15343 - SURFACE
    )
    :vars
    (
      ?auto_15346 - HOIST
      ?auto_15354 - PLACE
      ?auto_15344 - PLACE
      ?auto_15347 - HOIST
      ?auto_15355 - SURFACE
      ?auto_15350 - PLACE
      ?auto_15352 - HOIST
      ?auto_15345 - SURFACE
      ?auto_15349 - PLACE
      ?auto_15348 - HOIST
      ?auto_15353 - SURFACE
      ?auto_15351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15346 ?auto_15354 ) ( IS-CRATE ?auto_15343 ) ( not ( = ?auto_15342 ?auto_15343 ) ) ( not ( = ?auto_15341 ?auto_15342 ) ) ( not ( = ?auto_15341 ?auto_15343 ) ) ( not ( = ?auto_15344 ?auto_15354 ) ) ( HOIST-AT ?auto_15347 ?auto_15344 ) ( not ( = ?auto_15346 ?auto_15347 ) ) ( AVAILABLE ?auto_15347 ) ( SURFACE-AT ?auto_15343 ?auto_15344 ) ( ON ?auto_15343 ?auto_15355 ) ( CLEAR ?auto_15343 ) ( not ( = ?auto_15342 ?auto_15355 ) ) ( not ( = ?auto_15343 ?auto_15355 ) ) ( not ( = ?auto_15341 ?auto_15355 ) ) ( IS-CRATE ?auto_15342 ) ( not ( = ?auto_15350 ?auto_15354 ) ) ( not ( = ?auto_15344 ?auto_15350 ) ) ( HOIST-AT ?auto_15352 ?auto_15350 ) ( not ( = ?auto_15346 ?auto_15352 ) ) ( not ( = ?auto_15347 ?auto_15352 ) ) ( AVAILABLE ?auto_15352 ) ( SURFACE-AT ?auto_15342 ?auto_15350 ) ( ON ?auto_15342 ?auto_15345 ) ( CLEAR ?auto_15342 ) ( not ( = ?auto_15342 ?auto_15345 ) ) ( not ( = ?auto_15343 ?auto_15345 ) ) ( not ( = ?auto_15341 ?auto_15345 ) ) ( not ( = ?auto_15355 ?auto_15345 ) ) ( IS-CRATE ?auto_15341 ) ( not ( = ?auto_15340 ?auto_15341 ) ) ( not ( = ?auto_15342 ?auto_15340 ) ) ( not ( = ?auto_15343 ?auto_15340 ) ) ( not ( = ?auto_15355 ?auto_15340 ) ) ( not ( = ?auto_15345 ?auto_15340 ) ) ( not ( = ?auto_15349 ?auto_15354 ) ) ( not ( = ?auto_15344 ?auto_15349 ) ) ( not ( = ?auto_15350 ?auto_15349 ) ) ( HOIST-AT ?auto_15348 ?auto_15349 ) ( not ( = ?auto_15346 ?auto_15348 ) ) ( not ( = ?auto_15347 ?auto_15348 ) ) ( not ( = ?auto_15352 ?auto_15348 ) ) ( AVAILABLE ?auto_15348 ) ( SURFACE-AT ?auto_15341 ?auto_15349 ) ( ON ?auto_15341 ?auto_15353 ) ( CLEAR ?auto_15341 ) ( not ( = ?auto_15342 ?auto_15353 ) ) ( not ( = ?auto_15343 ?auto_15353 ) ) ( not ( = ?auto_15341 ?auto_15353 ) ) ( not ( = ?auto_15355 ?auto_15353 ) ) ( not ( = ?auto_15345 ?auto_15353 ) ) ( not ( = ?auto_15340 ?auto_15353 ) ) ( TRUCK-AT ?auto_15351 ?auto_15354 ) ( SURFACE-AT ?auto_15339 ?auto_15354 ) ( CLEAR ?auto_15339 ) ( IS-CRATE ?auto_15340 ) ( not ( = ?auto_15339 ?auto_15340 ) ) ( not ( = ?auto_15342 ?auto_15339 ) ) ( not ( = ?auto_15343 ?auto_15339 ) ) ( not ( = ?auto_15341 ?auto_15339 ) ) ( not ( = ?auto_15355 ?auto_15339 ) ) ( not ( = ?auto_15345 ?auto_15339 ) ) ( not ( = ?auto_15353 ?auto_15339 ) ) ( AVAILABLE ?auto_15346 ) ( IN ?auto_15340 ?auto_15351 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15341 ?auto_15342 ?auto_15343 )
      ( MAKE-4CRATE-VERIFY ?auto_15339 ?auto_15340 ?auto_15341 ?auto_15342 ?auto_15343 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15356 - SURFACE
      ?auto_15357 - SURFACE
    )
    :vars
    (
      ?auto_15360 - HOIST
      ?auto_15370 - PLACE
      ?auto_15372 - SURFACE
      ?auto_15358 - PLACE
      ?auto_15361 - HOIST
      ?auto_15371 - SURFACE
      ?auto_15364 - PLACE
      ?auto_15367 - HOIST
      ?auto_15359 - SURFACE
      ?auto_15368 - SURFACE
      ?auto_15363 - PLACE
      ?auto_15362 - HOIST
      ?auto_15369 - SURFACE
      ?auto_15365 - SURFACE
      ?auto_15366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15360 ?auto_15370 ) ( IS-CRATE ?auto_15357 ) ( not ( = ?auto_15356 ?auto_15357 ) ) ( not ( = ?auto_15372 ?auto_15356 ) ) ( not ( = ?auto_15372 ?auto_15357 ) ) ( not ( = ?auto_15358 ?auto_15370 ) ) ( HOIST-AT ?auto_15361 ?auto_15358 ) ( not ( = ?auto_15360 ?auto_15361 ) ) ( AVAILABLE ?auto_15361 ) ( SURFACE-AT ?auto_15357 ?auto_15358 ) ( ON ?auto_15357 ?auto_15371 ) ( CLEAR ?auto_15357 ) ( not ( = ?auto_15356 ?auto_15371 ) ) ( not ( = ?auto_15357 ?auto_15371 ) ) ( not ( = ?auto_15372 ?auto_15371 ) ) ( IS-CRATE ?auto_15356 ) ( not ( = ?auto_15364 ?auto_15370 ) ) ( not ( = ?auto_15358 ?auto_15364 ) ) ( HOIST-AT ?auto_15367 ?auto_15364 ) ( not ( = ?auto_15360 ?auto_15367 ) ) ( not ( = ?auto_15361 ?auto_15367 ) ) ( AVAILABLE ?auto_15367 ) ( SURFACE-AT ?auto_15356 ?auto_15364 ) ( ON ?auto_15356 ?auto_15359 ) ( CLEAR ?auto_15356 ) ( not ( = ?auto_15356 ?auto_15359 ) ) ( not ( = ?auto_15357 ?auto_15359 ) ) ( not ( = ?auto_15372 ?auto_15359 ) ) ( not ( = ?auto_15371 ?auto_15359 ) ) ( IS-CRATE ?auto_15372 ) ( not ( = ?auto_15368 ?auto_15372 ) ) ( not ( = ?auto_15356 ?auto_15368 ) ) ( not ( = ?auto_15357 ?auto_15368 ) ) ( not ( = ?auto_15371 ?auto_15368 ) ) ( not ( = ?auto_15359 ?auto_15368 ) ) ( not ( = ?auto_15363 ?auto_15370 ) ) ( not ( = ?auto_15358 ?auto_15363 ) ) ( not ( = ?auto_15364 ?auto_15363 ) ) ( HOIST-AT ?auto_15362 ?auto_15363 ) ( not ( = ?auto_15360 ?auto_15362 ) ) ( not ( = ?auto_15361 ?auto_15362 ) ) ( not ( = ?auto_15367 ?auto_15362 ) ) ( AVAILABLE ?auto_15362 ) ( SURFACE-AT ?auto_15372 ?auto_15363 ) ( ON ?auto_15372 ?auto_15369 ) ( CLEAR ?auto_15372 ) ( not ( = ?auto_15356 ?auto_15369 ) ) ( not ( = ?auto_15357 ?auto_15369 ) ) ( not ( = ?auto_15372 ?auto_15369 ) ) ( not ( = ?auto_15371 ?auto_15369 ) ) ( not ( = ?auto_15359 ?auto_15369 ) ) ( not ( = ?auto_15368 ?auto_15369 ) ) ( SURFACE-AT ?auto_15365 ?auto_15370 ) ( CLEAR ?auto_15365 ) ( IS-CRATE ?auto_15368 ) ( not ( = ?auto_15365 ?auto_15368 ) ) ( not ( = ?auto_15356 ?auto_15365 ) ) ( not ( = ?auto_15357 ?auto_15365 ) ) ( not ( = ?auto_15372 ?auto_15365 ) ) ( not ( = ?auto_15371 ?auto_15365 ) ) ( not ( = ?auto_15359 ?auto_15365 ) ) ( not ( = ?auto_15369 ?auto_15365 ) ) ( AVAILABLE ?auto_15360 ) ( IN ?auto_15368 ?auto_15366 ) ( TRUCK-AT ?auto_15366 ?auto_15358 ) )
    :subtasks
    ( ( !DRIVE ?auto_15366 ?auto_15358 ?auto_15370 )
      ( MAKE-2CRATE ?auto_15372 ?auto_15356 ?auto_15357 )
      ( MAKE-1CRATE-VERIFY ?auto_15356 ?auto_15357 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15373 - SURFACE
      ?auto_15374 - SURFACE
      ?auto_15375 - SURFACE
    )
    :vars
    (
      ?auto_15384 - HOIST
      ?auto_15385 - PLACE
      ?auto_15389 - PLACE
      ?auto_15381 - HOIST
      ?auto_15386 - SURFACE
      ?auto_15380 - PLACE
      ?auto_15382 - HOIST
      ?auto_15387 - SURFACE
      ?auto_15388 - SURFACE
      ?auto_15379 - PLACE
      ?auto_15377 - HOIST
      ?auto_15383 - SURFACE
      ?auto_15376 - SURFACE
      ?auto_15378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15384 ?auto_15385 ) ( IS-CRATE ?auto_15375 ) ( not ( = ?auto_15374 ?auto_15375 ) ) ( not ( = ?auto_15373 ?auto_15374 ) ) ( not ( = ?auto_15373 ?auto_15375 ) ) ( not ( = ?auto_15389 ?auto_15385 ) ) ( HOIST-AT ?auto_15381 ?auto_15389 ) ( not ( = ?auto_15384 ?auto_15381 ) ) ( AVAILABLE ?auto_15381 ) ( SURFACE-AT ?auto_15375 ?auto_15389 ) ( ON ?auto_15375 ?auto_15386 ) ( CLEAR ?auto_15375 ) ( not ( = ?auto_15374 ?auto_15386 ) ) ( not ( = ?auto_15375 ?auto_15386 ) ) ( not ( = ?auto_15373 ?auto_15386 ) ) ( IS-CRATE ?auto_15374 ) ( not ( = ?auto_15380 ?auto_15385 ) ) ( not ( = ?auto_15389 ?auto_15380 ) ) ( HOIST-AT ?auto_15382 ?auto_15380 ) ( not ( = ?auto_15384 ?auto_15382 ) ) ( not ( = ?auto_15381 ?auto_15382 ) ) ( AVAILABLE ?auto_15382 ) ( SURFACE-AT ?auto_15374 ?auto_15380 ) ( ON ?auto_15374 ?auto_15387 ) ( CLEAR ?auto_15374 ) ( not ( = ?auto_15374 ?auto_15387 ) ) ( not ( = ?auto_15375 ?auto_15387 ) ) ( not ( = ?auto_15373 ?auto_15387 ) ) ( not ( = ?auto_15386 ?auto_15387 ) ) ( IS-CRATE ?auto_15373 ) ( not ( = ?auto_15388 ?auto_15373 ) ) ( not ( = ?auto_15374 ?auto_15388 ) ) ( not ( = ?auto_15375 ?auto_15388 ) ) ( not ( = ?auto_15386 ?auto_15388 ) ) ( not ( = ?auto_15387 ?auto_15388 ) ) ( not ( = ?auto_15379 ?auto_15385 ) ) ( not ( = ?auto_15389 ?auto_15379 ) ) ( not ( = ?auto_15380 ?auto_15379 ) ) ( HOIST-AT ?auto_15377 ?auto_15379 ) ( not ( = ?auto_15384 ?auto_15377 ) ) ( not ( = ?auto_15381 ?auto_15377 ) ) ( not ( = ?auto_15382 ?auto_15377 ) ) ( AVAILABLE ?auto_15377 ) ( SURFACE-AT ?auto_15373 ?auto_15379 ) ( ON ?auto_15373 ?auto_15383 ) ( CLEAR ?auto_15373 ) ( not ( = ?auto_15374 ?auto_15383 ) ) ( not ( = ?auto_15375 ?auto_15383 ) ) ( not ( = ?auto_15373 ?auto_15383 ) ) ( not ( = ?auto_15386 ?auto_15383 ) ) ( not ( = ?auto_15387 ?auto_15383 ) ) ( not ( = ?auto_15388 ?auto_15383 ) ) ( SURFACE-AT ?auto_15376 ?auto_15385 ) ( CLEAR ?auto_15376 ) ( IS-CRATE ?auto_15388 ) ( not ( = ?auto_15376 ?auto_15388 ) ) ( not ( = ?auto_15374 ?auto_15376 ) ) ( not ( = ?auto_15375 ?auto_15376 ) ) ( not ( = ?auto_15373 ?auto_15376 ) ) ( not ( = ?auto_15386 ?auto_15376 ) ) ( not ( = ?auto_15387 ?auto_15376 ) ) ( not ( = ?auto_15383 ?auto_15376 ) ) ( AVAILABLE ?auto_15384 ) ( IN ?auto_15388 ?auto_15378 ) ( TRUCK-AT ?auto_15378 ?auto_15389 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15374 ?auto_15375 )
      ( MAKE-2CRATE-VERIFY ?auto_15373 ?auto_15374 ?auto_15375 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15390 - SURFACE
      ?auto_15391 - SURFACE
      ?auto_15392 - SURFACE
      ?auto_15393 - SURFACE
    )
    :vars
    (
      ?auto_15397 - HOIST
      ?auto_15400 - PLACE
      ?auto_15403 - PLACE
      ?auto_15394 - HOIST
      ?auto_15402 - SURFACE
      ?auto_15399 - PLACE
      ?auto_15401 - HOIST
      ?auto_15395 - SURFACE
      ?auto_15406 - PLACE
      ?auto_15396 - HOIST
      ?auto_15404 - SURFACE
      ?auto_15405 - SURFACE
      ?auto_15398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15397 ?auto_15400 ) ( IS-CRATE ?auto_15393 ) ( not ( = ?auto_15392 ?auto_15393 ) ) ( not ( = ?auto_15391 ?auto_15392 ) ) ( not ( = ?auto_15391 ?auto_15393 ) ) ( not ( = ?auto_15403 ?auto_15400 ) ) ( HOIST-AT ?auto_15394 ?auto_15403 ) ( not ( = ?auto_15397 ?auto_15394 ) ) ( AVAILABLE ?auto_15394 ) ( SURFACE-AT ?auto_15393 ?auto_15403 ) ( ON ?auto_15393 ?auto_15402 ) ( CLEAR ?auto_15393 ) ( not ( = ?auto_15392 ?auto_15402 ) ) ( not ( = ?auto_15393 ?auto_15402 ) ) ( not ( = ?auto_15391 ?auto_15402 ) ) ( IS-CRATE ?auto_15392 ) ( not ( = ?auto_15399 ?auto_15400 ) ) ( not ( = ?auto_15403 ?auto_15399 ) ) ( HOIST-AT ?auto_15401 ?auto_15399 ) ( not ( = ?auto_15397 ?auto_15401 ) ) ( not ( = ?auto_15394 ?auto_15401 ) ) ( AVAILABLE ?auto_15401 ) ( SURFACE-AT ?auto_15392 ?auto_15399 ) ( ON ?auto_15392 ?auto_15395 ) ( CLEAR ?auto_15392 ) ( not ( = ?auto_15392 ?auto_15395 ) ) ( not ( = ?auto_15393 ?auto_15395 ) ) ( not ( = ?auto_15391 ?auto_15395 ) ) ( not ( = ?auto_15402 ?auto_15395 ) ) ( IS-CRATE ?auto_15391 ) ( not ( = ?auto_15390 ?auto_15391 ) ) ( not ( = ?auto_15392 ?auto_15390 ) ) ( not ( = ?auto_15393 ?auto_15390 ) ) ( not ( = ?auto_15402 ?auto_15390 ) ) ( not ( = ?auto_15395 ?auto_15390 ) ) ( not ( = ?auto_15406 ?auto_15400 ) ) ( not ( = ?auto_15403 ?auto_15406 ) ) ( not ( = ?auto_15399 ?auto_15406 ) ) ( HOIST-AT ?auto_15396 ?auto_15406 ) ( not ( = ?auto_15397 ?auto_15396 ) ) ( not ( = ?auto_15394 ?auto_15396 ) ) ( not ( = ?auto_15401 ?auto_15396 ) ) ( AVAILABLE ?auto_15396 ) ( SURFACE-AT ?auto_15391 ?auto_15406 ) ( ON ?auto_15391 ?auto_15404 ) ( CLEAR ?auto_15391 ) ( not ( = ?auto_15392 ?auto_15404 ) ) ( not ( = ?auto_15393 ?auto_15404 ) ) ( not ( = ?auto_15391 ?auto_15404 ) ) ( not ( = ?auto_15402 ?auto_15404 ) ) ( not ( = ?auto_15395 ?auto_15404 ) ) ( not ( = ?auto_15390 ?auto_15404 ) ) ( SURFACE-AT ?auto_15405 ?auto_15400 ) ( CLEAR ?auto_15405 ) ( IS-CRATE ?auto_15390 ) ( not ( = ?auto_15405 ?auto_15390 ) ) ( not ( = ?auto_15392 ?auto_15405 ) ) ( not ( = ?auto_15393 ?auto_15405 ) ) ( not ( = ?auto_15391 ?auto_15405 ) ) ( not ( = ?auto_15402 ?auto_15405 ) ) ( not ( = ?auto_15395 ?auto_15405 ) ) ( not ( = ?auto_15404 ?auto_15405 ) ) ( AVAILABLE ?auto_15397 ) ( IN ?auto_15390 ?auto_15398 ) ( TRUCK-AT ?auto_15398 ?auto_15403 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15391 ?auto_15392 ?auto_15393 )
      ( MAKE-3CRATE-VERIFY ?auto_15390 ?auto_15391 ?auto_15392 ?auto_15393 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15407 - SURFACE
      ?auto_15408 - SURFACE
      ?auto_15409 - SURFACE
      ?auto_15410 - SURFACE
      ?auto_15411 - SURFACE
    )
    :vars
    (
      ?auto_15415 - HOIST
      ?auto_15418 - PLACE
      ?auto_15421 - PLACE
      ?auto_15412 - HOIST
      ?auto_15420 - SURFACE
      ?auto_15417 - PLACE
      ?auto_15419 - HOIST
      ?auto_15413 - SURFACE
      ?auto_15423 - PLACE
      ?auto_15414 - HOIST
      ?auto_15422 - SURFACE
      ?auto_15416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15415 ?auto_15418 ) ( IS-CRATE ?auto_15411 ) ( not ( = ?auto_15410 ?auto_15411 ) ) ( not ( = ?auto_15409 ?auto_15410 ) ) ( not ( = ?auto_15409 ?auto_15411 ) ) ( not ( = ?auto_15421 ?auto_15418 ) ) ( HOIST-AT ?auto_15412 ?auto_15421 ) ( not ( = ?auto_15415 ?auto_15412 ) ) ( AVAILABLE ?auto_15412 ) ( SURFACE-AT ?auto_15411 ?auto_15421 ) ( ON ?auto_15411 ?auto_15420 ) ( CLEAR ?auto_15411 ) ( not ( = ?auto_15410 ?auto_15420 ) ) ( not ( = ?auto_15411 ?auto_15420 ) ) ( not ( = ?auto_15409 ?auto_15420 ) ) ( IS-CRATE ?auto_15410 ) ( not ( = ?auto_15417 ?auto_15418 ) ) ( not ( = ?auto_15421 ?auto_15417 ) ) ( HOIST-AT ?auto_15419 ?auto_15417 ) ( not ( = ?auto_15415 ?auto_15419 ) ) ( not ( = ?auto_15412 ?auto_15419 ) ) ( AVAILABLE ?auto_15419 ) ( SURFACE-AT ?auto_15410 ?auto_15417 ) ( ON ?auto_15410 ?auto_15413 ) ( CLEAR ?auto_15410 ) ( not ( = ?auto_15410 ?auto_15413 ) ) ( not ( = ?auto_15411 ?auto_15413 ) ) ( not ( = ?auto_15409 ?auto_15413 ) ) ( not ( = ?auto_15420 ?auto_15413 ) ) ( IS-CRATE ?auto_15409 ) ( not ( = ?auto_15408 ?auto_15409 ) ) ( not ( = ?auto_15410 ?auto_15408 ) ) ( not ( = ?auto_15411 ?auto_15408 ) ) ( not ( = ?auto_15420 ?auto_15408 ) ) ( not ( = ?auto_15413 ?auto_15408 ) ) ( not ( = ?auto_15423 ?auto_15418 ) ) ( not ( = ?auto_15421 ?auto_15423 ) ) ( not ( = ?auto_15417 ?auto_15423 ) ) ( HOIST-AT ?auto_15414 ?auto_15423 ) ( not ( = ?auto_15415 ?auto_15414 ) ) ( not ( = ?auto_15412 ?auto_15414 ) ) ( not ( = ?auto_15419 ?auto_15414 ) ) ( AVAILABLE ?auto_15414 ) ( SURFACE-AT ?auto_15409 ?auto_15423 ) ( ON ?auto_15409 ?auto_15422 ) ( CLEAR ?auto_15409 ) ( not ( = ?auto_15410 ?auto_15422 ) ) ( not ( = ?auto_15411 ?auto_15422 ) ) ( not ( = ?auto_15409 ?auto_15422 ) ) ( not ( = ?auto_15420 ?auto_15422 ) ) ( not ( = ?auto_15413 ?auto_15422 ) ) ( not ( = ?auto_15408 ?auto_15422 ) ) ( SURFACE-AT ?auto_15407 ?auto_15418 ) ( CLEAR ?auto_15407 ) ( IS-CRATE ?auto_15408 ) ( not ( = ?auto_15407 ?auto_15408 ) ) ( not ( = ?auto_15410 ?auto_15407 ) ) ( not ( = ?auto_15411 ?auto_15407 ) ) ( not ( = ?auto_15409 ?auto_15407 ) ) ( not ( = ?auto_15420 ?auto_15407 ) ) ( not ( = ?auto_15413 ?auto_15407 ) ) ( not ( = ?auto_15422 ?auto_15407 ) ) ( AVAILABLE ?auto_15415 ) ( IN ?auto_15408 ?auto_15416 ) ( TRUCK-AT ?auto_15416 ?auto_15421 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15409 ?auto_15410 ?auto_15411 )
      ( MAKE-4CRATE-VERIFY ?auto_15407 ?auto_15408 ?auto_15409 ?auto_15410 ?auto_15411 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15424 - SURFACE
      ?auto_15425 - SURFACE
    )
    :vars
    (
      ?auto_15429 - HOIST
      ?auto_15433 - PLACE
      ?auto_15432 - SURFACE
      ?auto_15437 - PLACE
      ?auto_15426 - HOIST
      ?auto_15435 - SURFACE
      ?auto_15431 - PLACE
      ?auto_15434 - HOIST
      ?auto_15427 - SURFACE
      ?auto_15436 - SURFACE
      ?auto_15440 - PLACE
      ?auto_15428 - HOIST
      ?auto_15438 - SURFACE
      ?auto_15439 - SURFACE
      ?auto_15430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15429 ?auto_15433 ) ( IS-CRATE ?auto_15425 ) ( not ( = ?auto_15424 ?auto_15425 ) ) ( not ( = ?auto_15432 ?auto_15424 ) ) ( not ( = ?auto_15432 ?auto_15425 ) ) ( not ( = ?auto_15437 ?auto_15433 ) ) ( HOIST-AT ?auto_15426 ?auto_15437 ) ( not ( = ?auto_15429 ?auto_15426 ) ) ( SURFACE-AT ?auto_15425 ?auto_15437 ) ( ON ?auto_15425 ?auto_15435 ) ( CLEAR ?auto_15425 ) ( not ( = ?auto_15424 ?auto_15435 ) ) ( not ( = ?auto_15425 ?auto_15435 ) ) ( not ( = ?auto_15432 ?auto_15435 ) ) ( IS-CRATE ?auto_15424 ) ( not ( = ?auto_15431 ?auto_15433 ) ) ( not ( = ?auto_15437 ?auto_15431 ) ) ( HOIST-AT ?auto_15434 ?auto_15431 ) ( not ( = ?auto_15429 ?auto_15434 ) ) ( not ( = ?auto_15426 ?auto_15434 ) ) ( AVAILABLE ?auto_15434 ) ( SURFACE-AT ?auto_15424 ?auto_15431 ) ( ON ?auto_15424 ?auto_15427 ) ( CLEAR ?auto_15424 ) ( not ( = ?auto_15424 ?auto_15427 ) ) ( not ( = ?auto_15425 ?auto_15427 ) ) ( not ( = ?auto_15432 ?auto_15427 ) ) ( not ( = ?auto_15435 ?auto_15427 ) ) ( IS-CRATE ?auto_15432 ) ( not ( = ?auto_15436 ?auto_15432 ) ) ( not ( = ?auto_15424 ?auto_15436 ) ) ( not ( = ?auto_15425 ?auto_15436 ) ) ( not ( = ?auto_15435 ?auto_15436 ) ) ( not ( = ?auto_15427 ?auto_15436 ) ) ( not ( = ?auto_15440 ?auto_15433 ) ) ( not ( = ?auto_15437 ?auto_15440 ) ) ( not ( = ?auto_15431 ?auto_15440 ) ) ( HOIST-AT ?auto_15428 ?auto_15440 ) ( not ( = ?auto_15429 ?auto_15428 ) ) ( not ( = ?auto_15426 ?auto_15428 ) ) ( not ( = ?auto_15434 ?auto_15428 ) ) ( AVAILABLE ?auto_15428 ) ( SURFACE-AT ?auto_15432 ?auto_15440 ) ( ON ?auto_15432 ?auto_15438 ) ( CLEAR ?auto_15432 ) ( not ( = ?auto_15424 ?auto_15438 ) ) ( not ( = ?auto_15425 ?auto_15438 ) ) ( not ( = ?auto_15432 ?auto_15438 ) ) ( not ( = ?auto_15435 ?auto_15438 ) ) ( not ( = ?auto_15427 ?auto_15438 ) ) ( not ( = ?auto_15436 ?auto_15438 ) ) ( SURFACE-AT ?auto_15439 ?auto_15433 ) ( CLEAR ?auto_15439 ) ( IS-CRATE ?auto_15436 ) ( not ( = ?auto_15439 ?auto_15436 ) ) ( not ( = ?auto_15424 ?auto_15439 ) ) ( not ( = ?auto_15425 ?auto_15439 ) ) ( not ( = ?auto_15432 ?auto_15439 ) ) ( not ( = ?auto_15435 ?auto_15439 ) ) ( not ( = ?auto_15427 ?auto_15439 ) ) ( not ( = ?auto_15438 ?auto_15439 ) ) ( AVAILABLE ?auto_15429 ) ( TRUCK-AT ?auto_15430 ?auto_15437 ) ( LIFTING ?auto_15426 ?auto_15436 ) )
    :subtasks
    ( ( !LOAD ?auto_15426 ?auto_15436 ?auto_15430 ?auto_15437 )
      ( MAKE-2CRATE ?auto_15432 ?auto_15424 ?auto_15425 )
      ( MAKE-1CRATE-VERIFY ?auto_15424 ?auto_15425 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15441 - SURFACE
      ?auto_15442 - SURFACE
      ?auto_15443 - SURFACE
    )
    :vars
    (
      ?auto_15444 - HOIST
      ?auto_15449 - PLACE
      ?auto_15448 - PLACE
      ?auto_15456 - HOIST
      ?auto_15451 - SURFACE
      ?auto_15446 - PLACE
      ?auto_15457 - HOIST
      ?auto_15447 - SURFACE
      ?auto_15454 - SURFACE
      ?auto_15453 - PLACE
      ?auto_15445 - HOIST
      ?auto_15450 - SURFACE
      ?auto_15455 - SURFACE
      ?auto_15452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15444 ?auto_15449 ) ( IS-CRATE ?auto_15443 ) ( not ( = ?auto_15442 ?auto_15443 ) ) ( not ( = ?auto_15441 ?auto_15442 ) ) ( not ( = ?auto_15441 ?auto_15443 ) ) ( not ( = ?auto_15448 ?auto_15449 ) ) ( HOIST-AT ?auto_15456 ?auto_15448 ) ( not ( = ?auto_15444 ?auto_15456 ) ) ( SURFACE-AT ?auto_15443 ?auto_15448 ) ( ON ?auto_15443 ?auto_15451 ) ( CLEAR ?auto_15443 ) ( not ( = ?auto_15442 ?auto_15451 ) ) ( not ( = ?auto_15443 ?auto_15451 ) ) ( not ( = ?auto_15441 ?auto_15451 ) ) ( IS-CRATE ?auto_15442 ) ( not ( = ?auto_15446 ?auto_15449 ) ) ( not ( = ?auto_15448 ?auto_15446 ) ) ( HOIST-AT ?auto_15457 ?auto_15446 ) ( not ( = ?auto_15444 ?auto_15457 ) ) ( not ( = ?auto_15456 ?auto_15457 ) ) ( AVAILABLE ?auto_15457 ) ( SURFACE-AT ?auto_15442 ?auto_15446 ) ( ON ?auto_15442 ?auto_15447 ) ( CLEAR ?auto_15442 ) ( not ( = ?auto_15442 ?auto_15447 ) ) ( not ( = ?auto_15443 ?auto_15447 ) ) ( not ( = ?auto_15441 ?auto_15447 ) ) ( not ( = ?auto_15451 ?auto_15447 ) ) ( IS-CRATE ?auto_15441 ) ( not ( = ?auto_15454 ?auto_15441 ) ) ( not ( = ?auto_15442 ?auto_15454 ) ) ( not ( = ?auto_15443 ?auto_15454 ) ) ( not ( = ?auto_15451 ?auto_15454 ) ) ( not ( = ?auto_15447 ?auto_15454 ) ) ( not ( = ?auto_15453 ?auto_15449 ) ) ( not ( = ?auto_15448 ?auto_15453 ) ) ( not ( = ?auto_15446 ?auto_15453 ) ) ( HOIST-AT ?auto_15445 ?auto_15453 ) ( not ( = ?auto_15444 ?auto_15445 ) ) ( not ( = ?auto_15456 ?auto_15445 ) ) ( not ( = ?auto_15457 ?auto_15445 ) ) ( AVAILABLE ?auto_15445 ) ( SURFACE-AT ?auto_15441 ?auto_15453 ) ( ON ?auto_15441 ?auto_15450 ) ( CLEAR ?auto_15441 ) ( not ( = ?auto_15442 ?auto_15450 ) ) ( not ( = ?auto_15443 ?auto_15450 ) ) ( not ( = ?auto_15441 ?auto_15450 ) ) ( not ( = ?auto_15451 ?auto_15450 ) ) ( not ( = ?auto_15447 ?auto_15450 ) ) ( not ( = ?auto_15454 ?auto_15450 ) ) ( SURFACE-AT ?auto_15455 ?auto_15449 ) ( CLEAR ?auto_15455 ) ( IS-CRATE ?auto_15454 ) ( not ( = ?auto_15455 ?auto_15454 ) ) ( not ( = ?auto_15442 ?auto_15455 ) ) ( not ( = ?auto_15443 ?auto_15455 ) ) ( not ( = ?auto_15441 ?auto_15455 ) ) ( not ( = ?auto_15451 ?auto_15455 ) ) ( not ( = ?auto_15447 ?auto_15455 ) ) ( not ( = ?auto_15450 ?auto_15455 ) ) ( AVAILABLE ?auto_15444 ) ( TRUCK-AT ?auto_15452 ?auto_15448 ) ( LIFTING ?auto_15456 ?auto_15454 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15442 ?auto_15443 )
      ( MAKE-2CRATE-VERIFY ?auto_15441 ?auto_15442 ?auto_15443 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15458 - SURFACE
      ?auto_15459 - SURFACE
      ?auto_15460 - SURFACE
      ?auto_15461 - SURFACE
    )
    :vars
    (
      ?auto_15471 - HOIST
      ?auto_15462 - PLACE
      ?auto_15465 - PLACE
      ?auto_15470 - HOIST
      ?auto_15474 - SURFACE
      ?auto_15473 - PLACE
      ?auto_15467 - HOIST
      ?auto_15468 - SURFACE
      ?auto_15472 - PLACE
      ?auto_15463 - HOIST
      ?auto_15466 - SURFACE
      ?auto_15469 - SURFACE
      ?auto_15464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15471 ?auto_15462 ) ( IS-CRATE ?auto_15461 ) ( not ( = ?auto_15460 ?auto_15461 ) ) ( not ( = ?auto_15459 ?auto_15460 ) ) ( not ( = ?auto_15459 ?auto_15461 ) ) ( not ( = ?auto_15465 ?auto_15462 ) ) ( HOIST-AT ?auto_15470 ?auto_15465 ) ( not ( = ?auto_15471 ?auto_15470 ) ) ( SURFACE-AT ?auto_15461 ?auto_15465 ) ( ON ?auto_15461 ?auto_15474 ) ( CLEAR ?auto_15461 ) ( not ( = ?auto_15460 ?auto_15474 ) ) ( not ( = ?auto_15461 ?auto_15474 ) ) ( not ( = ?auto_15459 ?auto_15474 ) ) ( IS-CRATE ?auto_15460 ) ( not ( = ?auto_15473 ?auto_15462 ) ) ( not ( = ?auto_15465 ?auto_15473 ) ) ( HOIST-AT ?auto_15467 ?auto_15473 ) ( not ( = ?auto_15471 ?auto_15467 ) ) ( not ( = ?auto_15470 ?auto_15467 ) ) ( AVAILABLE ?auto_15467 ) ( SURFACE-AT ?auto_15460 ?auto_15473 ) ( ON ?auto_15460 ?auto_15468 ) ( CLEAR ?auto_15460 ) ( not ( = ?auto_15460 ?auto_15468 ) ) ( not ( = ?auto_15461 ?auto_15468 ) ) ( not ( = ?auto_15459 ?auto_15468 ) ) ( not ( = ?auto_15474 ?auto_15468 ) ) ( IS-CRATE ?auto_15459 ) ( not ( = ?auto_15458 ?auto_15459 ) ) ( not ( = ?auto_15460 ?auto_15458 ) ) ( not ( = ?auto_15461 ?auto_15458 ) ) ( not ( = ?auto_15474 ?auto_15458 ) ) ( not ( = ?auto_15468 ?auto_15458 ) ) ( not ( = ?auto_15472 ?auto_15462 ) ) ( not ( = ?auto_15465 ?auto_15472 ) ) ( not ( = ?auto_15473 ?auto_15472 ) ) ( HOIST-AT ?auto_15463 ?auto_15472 ) ( not ( = ?auto_15471 ?auto_15463 ) ) ( not ( = ?auto_15470 ?auto_15463 ) ) ( not ( = ?auto_15467 ?auto_15463 ) ) ( AVAILABLE ?auto_15463 ) ( SURFACE-AT ?auto_15459 ?auto_15472 ) ( ON ?auto_15459 ?auto_15466 ) ( CLEAR ?auto_15459 ) ( not ( = ?auto_15460 ?auto_15466 ) ) ( not ( = ?auto_15461 ?auto_15466 ) ) ( not ( = ?auto_15459 ?auto_15466 ) ) ( not ( = ?auto_15474 ?auto_15466 ) ) ( not ( = ?auto_15468 ?auto_15466 ) ) ( not ( = ?auto_15458 ?auto_15466 ) ) ( SURFACE-AT ?auto_15469 ?auto_15462 ) ( CLEAR ?auto_15469 ) ( IS-CRATE ?auto_15458 ) ( not ( = ?auto_15469 ?auto_15458 ) ) ( not ( = ?auto_15460 ?auto_15469 ) ) ( not ( = ?auto_15461 ?auto_15469 ) ) ( not ( = ?auto_15459 ?auto_15469 ) ) ( not ( = ?auto_15474 ?auto_15469 ) ) ( not ( = ?auto_15468 ?auto_15469 ) ) ( not ( = ?auto_15466 ?auto_15469 ) ) ( AVAILABLE ?auto_15471 ) ( TRUCK-AT ?auto_15464 ?auto_15465 ) ( LIFTING ?auto_15470 ?auto_15458 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15459 ?auto_15460 ?auto_15461 )
      ( MAKE-3CRATE-VERIFY ?auto_15458 ?auto_15459 ?auto_15460 ?auto_15461 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15475 - SURFACE
      ?auto_15476 - SURFACE
      ?auto_15477 - SURFACE
      ?auto_15478 - SURFACE
      ?auto_15479 - SURFACE
    )
    :vars
    (
      ?auto_15488 - HOIST
      ?auto_15480 - PLACE
      ?auto_15483 - PLACE
      ?auto_15487 - HOIST
      ?auto_15491 - SURFACE
      ?auto_15490 - PLACE
      ?auto_15485 - HOIST
      ?auto_15486 - SURFACE
      ?auto_15489 - PLACE
      ?auto_15481 - HOIST
      ?auto_15484 - SURFACE
      ?auto_15482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15488 ?auto_15480 ) ( IS-CRATE ?auto_15479 ) ( not ( = ?auto_15478 ?auto_15479 ) ) ( not ( = ?auto_15477 ?auto_15478 ) ) ( not ( = ?auto_15477 ?auto_15479 ) ) ( not ( = ?auto_15483 ?auto_15480 ) ) ( HOIST-AT ?auto_15487 ?auto_15483 ) ( not ( = ?auto_15488 ?auto_15487 ) ) ( SURFACE-AT ?auto_15479 ?auto_15483 ) ( ON ?auto_15479 ?auto_15491 ) ( CLEAR ?auto_15479 ) ( not ( = ?auto_15478 ?auto_15491 ) ) ( not ( = ?auto_15479 ?auto_15491 ) ) ( not ( = ?auto_15477 ?auto_15491 ) ) ( IS-CRATE ?auto_15478 ) ( not ( = ?auto_15490 ?auto_15480 ) ) ( not ( = ?auto_15483 ?auto_15490 ) ) ( HOIST-AT ?auto_15485 ?auto_15490 ) ( not ( = ?auto_15488 ?auto_15485 ) ) ( not ( = ?auto_15487 ?auto_15485 ) ) ( AVAILABLE ?auto_15485 ) ( SURFACE-AT ?auto_15478 ?auto_15490 ) ( ON ?auto_15478 ?auto_15486 ) ( CLEAR ?auto_15478 ) ( not ( = ?auto_15478 ?auto_15486 ) ) ( not ( = ?auto_15479 ?auto_15486 ) ) ( not ( = ?auto_15477 ?auto_15486 ) ) ( not ( = ?auto_15491 ?auto_15486 ) ) ( IS-CRATE ?auto_15477 ) ( not ( = ?auto_15476 ?auto_15477 ) ) ( not ( = ?auto_15478 ?auto_15476 ) ) ( not ( = ?auto_15479 ?auto_15476 ) ) ( not ( = ?auto_15491 ?auto_15476 ) ) ( not ( = ?auto_15486 ?auto_15476 ) ) ( not ( = ?auto_15489 ?auto_15480 ) ) ( not ( = ?auto_15483 ?auto_15489 ) ) ( not ( = ?auto_15490 ?auto_15489 ) ) ( HOIST-AT ?auto_15481 ?auto_15489 ) ( not ( = ?auto_15488 ?auto_15481 ) ) ( not ( = ?auto_15487 ?auto_15481 ) ) ( not ( = ?auto_15485 ?auto_15481 ) ) ( AVAILABLE ?auto_15481 ) ( SURFACE-AT ?auto_15477 ?auto_15489 ) ( ON ?auto_15477 ?auto_15484 ) ( CLEAR ?auto_15477 ) ( not ( = ?auto_15478 ?auto_15484 ) ) ( not ( = ?auto_15479 ?auto_15484 ) ) ( not ( = ?auto_15477 ?auto_15484 ) ) ( not ( = ?auto_15491 ?auto_15484 ) ) ( not ( = ?auto_15486 ?auto_15484 ) ) ( not ( = ?auto_15476 ?auto_15484 ) ) ( SURFACE-AT ?auto_15475 ?auto_15480 ) ( CLEAR ?auto_15475 ) ( IS-CRATE ?auto_15476 ) ( not ( = ?auto_15475 ?auto_15476 ) ) ( not ( = ?auto_15478 ?auto_15475 ) ) ( not ( = ?auto_15479 ?auto_15475 ) ) ( not ( = ?auto_15477 ?auto_15475 ) ) ( not ( = ?auto_15491 ?auto_15475 ) ) ( not ( = ?auto_15486 ?auto_15475 ) ) ( not ( = ?auto_15484 ?auto_15475 ) ) ( AVAILABLE ?auto_15488 ) ( TRUCK-AT ?auto_15482 ?auto_15483 ) ( LIFTING ?auto_15487 ?auto_15476 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15477 ?auto_15478 ?auto_15479 )
      ( MAKE-4CRATE-VERIFY ?auto_15475 ?auto_15476 ?auto_15477 ?auto_15478 ?auto_15479 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15492 - SURFACE
      ?auto_15493 - SURFACE
    )
    :vars
    (
      ?auto_15505 - HOIST
      ?auto_15495 - PLACE
      ?auto_15494 - SURFACE
      ?auto_15498 - PLACE
      ?auto_15503 - HOIST
      ?auto_15508 - SURFACE
      ?auto_15507 - PLACE
      ?auto_15500 - HOIST
      ?auto_15501 - SURFACE
      ?auto_15504 - SURFACE
      ?auto_15506 - PLACE
      ?auto_15496 - HOIST
      ?auto_15499 - SURFACE
      ?auto_15502 - SURFACE
      ?auto_15497 - TRUCK
      ?auto_15509 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15505 ?auto_15495 ) ( IS-CRATE ?auto_15493 ) ( not ( = ?auto_15492 ?auto_15493 ) ) ( not ( = ?auto_15494 ?auto_15492 ) ) ( not ( = ?auto_15494 ?auto_15493 ) ) ( not ( = ?auto_15498 ?auto_15495 ) ) ( HOIST-AT ?auto_15503 ?auto_15498 ) ( not ( = ?auto_15505 ?auto_15503 ) ) ( SURFACE-AT ?auto_15493 ?auto_15498 ) ( ON ?auto_15493 ?auto_15508 ) ( CLEAR ?auto_15493 ) ( not ( = ?auto_15492 ?auto_15508 ) ) ( not ( = ?auto_15493 ?auto_15508 ) ) ( not ( = ?auto_15494 ?auto_15508 ) ) ( IS-CRATE ?auto_15492 ) ( not ( = ?auto_15507 ?auto_15495 ) ) ( not ( = ?auto_15498 ?auto_15507 ) ) ( HOIST-AT ?auto_15500 ?auto_15507 ) ( not ( = ?auto_15505 ?auto_15500 ) ) ( not ( = ?auto_15503 ?auto_15500 ) ) ( AVAILABLE ?auto_15500 ) ( SURFACE-AT ?auto_15492 ?auto_15507 ) ( ON ?auto_15492 ?auto_15501 ) ( CLEAR ?auto_15492 ) ( not ( = ?auto_15492 ?auto_15501 ) ) ( not ( = ?auto_15493 ?auto_15501 ) ) ( not ( = ?auto_15494 ?auto_15501 ) ) ( not ( = ?auto_15508 ?auto_15501 ) ) ( IS-CRATE ?auto_15494 ) ( not ( = ?auto_15504 ?auto_15494 ) ) ( not ( = ?auto_15492 ?auto_15504 ) ) ( not ( = ?auto_15493 ?auto_15504 ) ) ( not ( = ?auto_15508 ?auto_15504 ) ) ( not ( = ?auto_15501 ?auto_15504 ) ) ( not ( = ?auto_15506 ?auto_15495 ) ) ( not ( = ?auto_15498 ?auto_15506 ) ) ( not ( = ?auto_15507 ?auto_15506 ) ) ( HOIST-AT ?auto_15496 ?auto_15506 ) ( not ( = ?auto_15505 ?auto_15496 ) ) ( not ( = ?auto_15503 ?auto_15496 ) ) ( not ( = ?auto_15500 ?auto_15496 ) ) ( AVAILABLE ?auto_15496 ) ( SURFACE-AT ?auto_15494 ?auto_15506 ) ( ON ?auto_15494 ?auto_15499 ) ( CLEAR ?auto_15494 ) ( not ( = ?auto_15492 ?auto_15499 ) ) ( not ( = ?auto_15493 ?auto_15499 ) ) ( not ( = ?auto_15494 ?auto_15499 ) ) ( not ( = ?auto_15508 ?auto_15499 ) ) ( not ( = ?auto_15501 ?auto_15499 ) ) ( not ( = ?auto_15504 ?auto_15499 ) ) ( SURFACE-AT ?auto_15502 ?auto_15495 ) ( CLEAR ?auto_15502 ) ( IS-CRATE ?auto_15504 ) ( not ( = ?auto_15502 ?auto_15504 ) ) ( not ( = ?auto_15492 ?auto_15502 ) ) ( not ( = ?auto_15493 ?auto_15502 ) ) ( not ( = ?auto_15494 ?auto_15502 ) ) ( not ( = ?auto_15508 ?auto_15502 ) ) ( not ( = ?auto_15501 ?auto_15502 ) ) ( not ( = ?auto_15499 ?auto_15502 ) ) ( AVAILABLE ?auto_15505 ) ( TRUCK-AT ?auto_15497 ?auto_15498 ) ( AVAILABLE ?auto_15503 ) ( SURFACE-AT ?auto_15504 ?auto_15498 ) ( ON ?auto_15504 ?auto_15509 ) ( CLEAR ?auto_15504 ) ( not ( = ?auto_15492 ?auto_15509 ) ) ( not ( = ?auto_15493 ?auto_15509 ) ) ( not ( = ?auto_15494 ?auto_15509 ) ) ( not ( = ?auto_15508 ?auto_15509 ) ) ( not ( = ?auto_15501 ?auto_15509 ) ) ( not ( = ?auto_15504 ?auto_15509 ) ) ( not ( = ?auto_15499 ?auto_15509 ) ) ( not ( = ?auto_15502 ?auto_15509 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15503 ?auto_15504 ?auto_15509 ?auto_15498 )
      ( MAKE-2CRATE ?auto_15494 ?auto_15492 ?auto_15493 )
      ( MAKE-1CRATE-VERIFY ?auto_15492 ?auto_15493 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15510 - SURFACE
      ?auto_15511 - SURFACE
      ?auto_15512 - SURFACE
    )
    :vars
    (
      ?auto_15527 - HOIST
      ?auto_15526 - PLACE
      ?auto_15520 - PLACE
      ?auto_15524 - HOIST
      ?auto_15513 - SURFACE
      ?auto_15517 - PLACE
      ?auto_15514 - HOIST
      ?auto_15518 - SURFACE
      ?auto_15516 - SURFACE
      ?auto_15521 - PLACE
      ?auto_15523 - HOIST
      ?auto_15515 - SURFACE
      ?auto_15525 - SURFACE
      ?auto_15519 - TRUCK
      ?auto_15522 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15527 ?auto_15526 ) ( IS-CRATE ?auto_15512 ) ( not ( = ?auto_15511 ?auto_15512 ) ) ( not ( = ?auto_15510 ?auto_15511 ) ) ( not ( = ?auto_15510 ?auto_15512 ) ) ( not ( = ?auto_15520 ?auto_15526 ) ) ( HOIST-AT ?auto_15524 ?auto_15520 ) ( not ( = ?auto_15527 ?auto_15524 ) ) ( SURFACE-AT ?auto_15512 ?auto_15520 ) ( ON ?auto_15512 ?auto_15513 ) ( CLEAR ?auto_15512 ) ( not ( = ?auto_15511 ?auto_15513 ) ) ( not ( = ?auto_15512 ?auto_15513 ) ) ( not ( = ?auto_15510 ?auto_15513 ) ) ( IS-CRATE ?auto_15511 ) ( not ( = ?auto_15517 ?auto_15526 ) ) ( not ( = ?auto_15520 ?auto_15517 ) ) ( HOIST-AT ?auto_15514 ?auto_15517 ) ( not ( = ?auto_15527 ?auto_15514 ) ) ( not ( = ?auto_15524 ?auto_15514 ) ) ( AVAILABLE ?auto_15514 ) ( SURFACE-AT ?auto_15511 ?auto_15517 ) ( ON ?auto_15511 ?auto_15518 ) ( CLEAR ?auto_15511 ) ( not ( = ?auto_15511 ?auto_15518 ) ) ( not ( = ?auto_15512 ?auto_15518 ) ) ( not ( = ?auto_15510 ?auto_15518 ) ) ( not ( = ?auto_15513 ?auto_15518 ) ) ( IS-CRATE ?auto_15510 ) ( not ( = ?auto_15516 ?auto_15510 ) ) ( not ( = ?auto_15511 ?auto_15516 ) ) ( not ( = ?auto_15512 ?auto_15516 ) ) ( not ( = ?auto_15513 ?auto_15516 ) ) ( not ( = ?auto_15518 ?auto_15516 ) ) ( not ( = ?auto_15521 ?auto_15526 ) ) ( not ( = ?auto_15520 ?auto_15521 ) ) ( not ( = ?auto_15517 ?auto_15521 ) ) ( HOIST-AT ?auto_15523 ?auto_15521 ) ( not ( = ?auto_15527 ?auto_15523 ) ) ( not ( = ?auto_15524 ?auto_15523 ) ) ( not ( = ?auto_15514 ?auto_15523 ) ) ( AVAILABLE ?auto_15523 ) ( SURFACE-AT ?auto_15510 ?auto_15521 ) ( ON ?auto_15510 ?auto_15515 ) ( CLEAR ?auto_15510 ) ( not ( = ?auto_15511 ?auto_15515 ) ) ( not ( = ?auto_15512 ?auto_15515 ) ) ( not ( = ?auto_15510 ?auto_15515 ) ) ( not ( = ?auto_15513 ?auto_15515 ) ) ( not ( = ?auto_15518 ?auto_15515 ) ) ( not ( = ?auto_15516 ?auto_15515 ) ) ( SURFACE-AT ?auto_15525 ?auto_15526 ) ( CLEAR ?auto_15525 ) ( IS-CRATE ?auto_15516 ) ( not ( = ?auto_15525 ?auto_15516 ) ) ( not ( = ?auto_15511 ?auto_15525 ) ) ( not ( = ?auto_15512 ?auto_15525 ) ) ( not ( = ?auto_15510 ?auto_15525 ) ) ( not ( = ?auto_15513 ?auto_15525 ) ) ( not ( = ?auto_15518 ?auto_15525 ) ) ( not ( = ?auto_15515 ?auto_15525 ) ) ( AVAILABLE ?auto_15527 ) ( TRUCK-AT ?auto_15519 ?auto_15520 ) ( AVAILABLE ?auto_15524 ) ( SURFACE-AT ?auto_15516 ?auto_15520 ) ( ON ?auto_15516 ?auto_15522 ) ( CLEAR ?auto_15516 ) ( not ( = ?auto_15511 ?auto_15522 ) ) ( not ( = ?auto_15512 ?auto_15522 ) ) ( not ( = ?auto_15510 ?auto_15522 ) ) ( not ( = ?auto_15513 ?auto_15522 ) ) ( not ( = ?auto_15518 ?auto_15522 ) ) ( not ( = ?auto_15516 ?auto_15522 ) ) ( not ( = ?auto_15515 ?auto_15522 ) ) ( not ( = ?auto_15525 ?auto_15522 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15511 ?auto_15512 )
      ( MAKE-2CRATE-VERIFY ?auto_15510 ?auto_15511 ?auto_15512 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15528 - SURFACE
      ?auto_15529 - SURFACE
      ?auto_15530 - SURFACE
      ?auto_15531 - SURFACE
    )
    :vars
    (
      ?auto_15541 - HOIST
      ?auto_15538 - PLACE
      ?auto_15544 - PLACE
      ?auto_15539 - HOIST
      ?auto_15534 - SURFACE
      ?auto_15532 - PLACE
      ?auto_15535 - HOIST
      ?auto_15536 - SURFACE
      ?auto_15542 - PLACE
      ?auto_15533 - HOIST
      ?auto_15540 - SURFACE
      ?auto_15537 - SURFACE
      ?auto_15545 - TRUCK
      ?auto_15543 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15541 ?auto_15538 ) ( IS-CRATE ?auto_15531 ) ( not ( = ?auto_15530 ?auto_15531 ) ) ( not ( = ?auto_15529 ?auto_15530 ) ) ( not ( = ?auto_15529 ?auto_15531 ) ) ( not ( = ?auto_15544 ?auto_15538 ) ) ( HOIST-AT ?auto_15539 ?auto_15544 ) ( not ( = ?auto_15541 ?auto_15539 ) ) ( SURFACE-AT ?auto_15531 ?auto_15544 ) ( ON ?auto_15531 ?auto_15534 ) ( CLEAR ?auto_15531 ) ( not ( = ?auto_15530 ?auto_15534 ) ) ( not ( = ?auto_15531 ?auto_15534 ) ) ( not ( = ?auto_15529 ?auto_15534 ) ) ( IS-CRATE ?auto_15530 ) ( not ( = ?auto_15532 ?auto_15538 ) ) ( not ( = ?auto_15544 ?auto_15532 ) ) ( HOIST-AT ?auto_15535 ?auto_15532 ) ( not ( = ?auto_15541 ?auto_15535 ) ) ( not ( = ?auto_15539 ?auto_15535 ) ) ( AVAILABLE ?auto_15535 ) ( SURFACE-AT ?auto_15530 ?auto_15532 ) ( ON ?auto_15530 ?auto_15536 ) ( CLEAR ?auto_15530 ) ( not ( = ?auto_15530 ?auto_15536 ) ) ( not ( = ?auto_15531 ?auto_15536 ) ) ( not ( = ?auto_15529 ?auto_15536 ) ) ( not ( = ?auto_15534 ?auto_15536 ) ) ( IS-CRATE ?auto_15529 ) ( not ( = ?auto_15528 ?auto_15529 ) ) ( not ( = ?auto_15530 ?auto_15528 ) ) ( not ( = ?auto_15531 ?auto_15528 ) ) ( not ( = ?auto_15534 ?auto_15528 ) ) ( not ( = ?auto_15536 ?auto_15528 ) ) ( not ( = ?auto_15542 ?auto_15538 ) ) ( not ( = ?auto_15544 ?auto_15542 ) ) ( not ( = ?auto_15532 ?auto_15542 ) ) ( HOIST-AT ?auto_15533 ?auto_15542 ) ( not ( = ?auto_15541 ?auto_15533 ) ) ( not ( = ?auto_15539 ?auto_15533 ) ) ( not ( = ?auto_15535 ?auto_15533 ) ) ( AVAILABLE ?auto_15533 ) ( SURFACE-AT ?auto_15529 ?auto_15542 ) ( ON ?auto_15529 ?auto_15540 ) ( CLEAR ?auto_15529 ) ( not ( = ?auto_15530 ?auto_15540 ) ) ( not ( = ?auto_15531 ?auto_15540 ) ) ( not ( = ?auto_15529 ?auto_15540 ) ) ( not ( = ?auto_15534 ?auto_15540 ) ) ( not ( = ?auto_15536 ?auto_15540 ) ) ( not ( = ?auto_15528 ?auto_15540 ) ) ( SURFACE-AT ?auto_15537 ?auto_15538 ) ( CLEAR ?auto_15537 ) ( IS-CRATE ?auto_15528 ) ( not ( = ?auto_15537 ?auto_15528 ) ) ( not ( = ?auto_15530 ?auto_15537 ) ) ( not ( = ?auto_15531 ?auto_15537 ) ) ( not ( = ?auto_15529 ?auto_15537 ) ) ( not ( = ?auto_15534 ?auto_15537 ) ) ( not ( = ?auto_15536 ?auto_15537 ) ) ( not ( = ?auto_15540 ?auto_15537 ) ) ( AVAILABLE ?auto_15541 ) ( TRUCK-AT ?auto_15545 ?auto_15544 ) ( AVAILABLE ?auto_15539 ) ( SURFACE-AT ?auto_15528 ?auto_15544 ) ( ON ?auto_15528 ?auto_15543 ) ( CLEAR ?auto_15528 ) ( not ( = ?auto_15530 ?auto_15543 ) ) ( not ( = ?auto_15531 ?auto_15543 ) ) ( not ( = ?auto_15529 ?auto_15543 ) ) ( not ( = ?auto_15534 ?auto_15543 ) ) ( not ( = ?auto_15536 ?auto_15543 ) ) ( not ( = ?auto_15528 ?auto_15543 ) ) ( not ( = ?auto_15540 ?auto_15543 ) ) ( not ( = ?auto_15537 ?auto_15543 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15529 ?auto_15530 ?auto_15531 )
      ( MAKE-3CRATE-VERIFY ?auto_15528 ?auto_15529 ?auto_15530 ?auto_15531 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15546 - SURFACE
      ?auto_15547 - SURFACE
      ?auto_15548 - SURFACE
      ?auto_15549 - SURFACE
      ?auto_15550 - SURFACE
    )
    :vars
    (
      ?auto_15559 - HOIST
      ?auto_15556 - PLACE
      ?auto_15562 - PLACE
      ?auto_15557 - HOIST
      ?auto_15553 - SURFACE
      ?auto_15551 - PLACE
      ?auto_15554 - HOIST
      ?auto_15555 - SURFACE
      ?auto_15560 - PLACE
      ?auto_15552 - HOIST
      ?auto_15558 - SURFACE
      ?auto_15563 - TRUCK
      ?auto_15561 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15559 ?auto_15556 ) ( IS-CRATE ?auto_15550 ) ( not ( = ?auto_15549 ?auto_15550 ) ) ( not ( = ?auto_15548 ?auto_15549 ) ) ( not ( = ?auto_15548 ?auto_15550 ) ) ( not ( = ?auto_15562 ?auto_15556 ) ) ( HOIST-AT ?auto_15557 ?auto_15562 ) ( not ( = ?auto_15559 ?auto_15557 ) ) ( SURFACE-AT ?auto_15550 ?auto_15562 ) ( ON ?auto_15550 ?auto_15553 ) ( CLEAR ?auto_15550 ) ( not ( = ?auto_15549 ?auto_15553 ) ) ( not ( = ?auto_15550 ?auto_15553 ) ) ( not ( = ?auto_15548 ?auto_15553 ) ) ( IS-CRATE ?auto_15549 ) ( not ( = ?auto_15551 ?auto_15556 ) ) ( not ( = ?auto_15562 ?auto_15551 ) ) ( HOIST-AT ?auto_15554 ?auto_15551 ) ( not ( = ?auto_15559 ?auto_15554 ) ) ( not ( = ?auto_15557 ?auto_15554 ) ) ( AVAILABLE ?auto_15554 ) ( SURFACE-AT ?auto_15549 ?auto_15551 ) ( ON ?auto_15549 ?auto_15555 ) ( CLEAR ?auto_15549 ) ( not ( = ?auto_15549 ?auto_15555 ) ) ( not ( = ?auto_15550 ?auto_15555 ) ) ( not ( = ?auto_15548 ?auto_15555 ) ) ( not ( = ?auto_15553 ?auto_15555 ) ) ( IS-CRATE ?auto_15548 ) ( not ( = ?auto_15547 ?auto_15548 ) ) ( not ( = ?auto_15549 ?auto_15547 ) ) ( not ( = ?auto_15550 ?auto_15547 ) ) ( not ( = ?auto_15553 ?auto_15547 ) ) ( not ( = ?auto_15555 ?auto_15547 ) ) ( not ( = ?auto_15560 ?auto_15556 ) ) ( not ( = ?auto_15562 ?auto_15560 ) ) ( not ( = ?auto_15551 ?auto_15560 ) ) ( HOIST-AT ?auto_15552 ?auto_15560 ) ( not ( = ?auto_15559 ?auto_15552 ) ) ( not ( = ?auto_15557 ?auto_15552 ) ) ( not ( = ?auto_15554 ?auto_15552 ) ) ( AVAILABLE ?auto_15552 ) ( SURFACE-AT ?auto_15548 ?auto_15560 ) ( ON ?auto_15548 ?auto_15558 ) ( CLEAR ?auto_15548 ) ( not ( = ?auto_15549 ?auto_15558 ) ) ( not ( = ?auto_15550 ?auto_15558 ) ) ( not ( = ?auto_15548 ?auto_15558 ) ) ( not ( = ?auto_15553 ?auto_15558 ) ) ( not ( = ?auto_15555 ?auto_15558 ) ) ( not ( = ?auto_15547 ?auto_15558 ) ) ( SURFACE-AT ?auto_15546 ?auto_15556 ) ( CLEAR ?auto_15546 ) ( IS-CRATE ?auto_15547 ) ( not ( = ?auto_15546 ?auto_15547 ) ) ( not ( = ?auto_15549 ?auto_15546 ) ) ( not ( = ?auto_15550 ?auto_15546 ) ) ( not ( = ?auto_15548 ?auto_15546 ) ) ( not ( = ?auto_15553 ?auto_15546 ) ) ( not ( = ?auto_15555 ?auto_15546 ) ) ( not ( = ?auto_15558 ?auto_15546 ) ) ( AVAILABLE ?auto_15559 ) ( TRUCK-AT ?auto_15563 ?auto_15562 ) ( AVAILABLE ?auto_15557 ) ( SURFACE-AT ?auto_15547 ?auto_15562 ) ( ON ?auto_15547 ?auto_15561 ) ( CLEAR ?auto_15547 ) ( not ( = ?auto_15549 ?auto_15561 ) ) ( not ( = ?auto_15550 ?auto_15561 ) ) ( not ( = ?auto_15548 ?auto_15561 ) ) ( not ( = ?auto_15553 ?auto_15561 ) ) ( not ( = ?auto_15555 ?auto_15561 ) ) ( not ( = ?auto_15547 ?auto_15561 ) ) ( not ( = ?auto_15558 ?auto_15561 ) ) ( not ( = ?auto_15546 ?auto_15561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15548 ?auto_15549 ?auto_15550 )
      ( MAKE-4CRATE-VERIFY ?auto_15546 ?auto_15547 ?auto_15548 ?auto_15549 ?auto_15550 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15564 - SURFACE
      ?auto_15565 - SURFACE
    )
    :vars
    (
      ?auto_15576 - HOIST
      ?auto_15572 - PLACE
      ?auto_15581 - SURFACE
      ?auto_15579 - PLACE
      ?auto_15574 - HOIST
      ?auto_15568 - SURFACE
      ?auto_15566 - PLACE
      ?auto_15569 - HOIST
      ?auto_15570 - SURFACE
      ?auto_15573 - SURFACE
      ?auto_15577 - PLACE
      ?auto_15567 - HOIST
      ?auto_15575 - SURFACE
      ?auto_15571 - SURFACE
      ?auto_15578 - SURFACE
      ?auto_15580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15576 ?auto_15572 ) ( IS-CRATE ?auto_15565 ) ( not ( = ?auto_15564 ?auto_15565 ) ) ( not ( = ?auto_15581 ?auto_15564 ) ) ( not ( = ?auto_15581 ?auto_15565 ) ) ( not ( = ?auto_15579 ?auto_15572 ) ) ( HOIST-AT ?auto_15574 ?auto_15579 ) ( not ( = ?auto_15576 ?auto_15574 ) ) ( SURFACE-AT ?auto_15565 ?auto_15579 ) ( ON ?auto_15565 ?auto_15568 ) ( CLEAR ?auto_15565 ) ( not ( = ?auto_15564 ?auto_15568 ) ) ( not ( = ?auto_15565 ?auto_15568 ) ) ( not ( = ?auto_15581 ?auto_15568 ) ) ( IS-CRATE ?auto_15564 ) ( not ( = ?auto_15566 ?auto_15572 ) ) ( not ( = ?auto_15579 ?auto_15566 ) ) ( HOIST-AT ?auto_15569 ?auto_15566 ) ( not ( = ?auto_15576 ?auto_15569 ) ) ( not ( = ?auto_15574 ?auto_15569 ) ) ( AVAILABLE ?auto_15569 ) ( SURFACE-AT ?auto_15564 ?auto_15566 ) ( ON ?auto_15564 ?auto_15570 ) ( CLEAR ?auto_15564 ) ( not ( = ?auto_15564 ?auto_15570 ) ) ( not ( = ?auto_15565 ?auto_15570 ) ) ( not ( = ?auto_15581 ?auto_15570 ) ) ( not ( = ?auto_15568 ?auto_15570 ) ) ( IS-CRATE ?auto_15581 ) ( not ( = ?auto_15573 ?auto_15581 ) ) ( not ( = ?auto_15564 ?auto_15573 ) ) ( not ( = ?auto_15565 ?auto_15573 ) ) ( not ( = ?auto_15568 ?auto_15573 ) ) ( not ( = ?auto_15570 ?auto_15573 ) ) ( not ( = ?auto_15577 ?auto_15572 ) ) ( not ( = ?auto_15579 ?auto_15577 ) ) ( not ( = ?auto_15566 ?auto_15577 ) ) ( HOIST-AT ?auto_15567 ?auto_15577 ) ( not ( = ?auto_15576 ?auto_15567 ) ) ( not ( = ?auto_15574 ?auto_15567 ) ) ( not ( = ?auto_15569 ?auto_15567 ) ) ( AVAILABLE ?auto_15567 ) ( SURFACE-AT ?auto_15581 ?auto_15577 ) ( ON ?auto_15581 ?auto_15575 ) ( CLEAR ?auto_15581 ) ( not ( = ?auto_15564 ?auto_15575 ) ) ( not ( = ?auto_15565 ?auto_15575 ) ) ( not ( = ?auto_15581 ?auto_15575 ) ) ( not ( = ?auto_15568 ?auto_15575 ) ) ( not ( = ?auto_15570 ?auto_15575 ) ) ( not ( = ?auto_15573 ?auto_15575 ) ) ( SURFACE-AT ?auto_15571 ?auto_15572 ) ( CLEAR ?auto_15571 ) ( IS-CRATE ?auto_15573 ) ( not ( = ?auto_15571 ?auto_15573 ) ) ( not ( = ?auto_15564 ?auto_15571 ) ) ( not ( = ?auto_15565 ?auto_15571 ) ) ( not ( = ?auto_15581 ?auto_15571 ) ) ( not ( = ?auto_15568 ?auto_15571 ) ) ( not ( = ?auto_15570 ?auto_15571 ) ) ( not ( = ?auto_15575 ?auto_15571 ) ) ( AVAILABLE ?auto_15576 ) ( AVAILABLE ?auto_15574 ) ( SURFACE-AT ?auto_15573 ?auto_15579 ) ( ON ?auto_15573 ?auto_15578 ) ( CLEAR ?auto_15573 ) ( not ( = ?auto_15564 ?auto_15578 ) ) ( not ( = ?auto_15565 ?auto_15578 ) ) ( not ( = ?auto_15581 ?auto_15578 ) ) ( not ( = ?auto_15568 ?auto_15578 ) ) ( not ( = ?auto_15570 ?auto_15578 ) ) ( not ( = ?auto_15573 ?auto_15578 ) ) ( not ( = ?auto_15575 ?auto_15578 ) ) ( not ( = ?auto_15571 ?auto_15578 ) ) ( TRUCK-AT ?auto_15580 ?auto_15572 ) )
    :subtasks
    ( ( !DRIVE ?auto_15580 ?auto_15572 ?auto_15579 )
      ( MAKE-2CRATE ?auto_15581 ?auto_15564 ?auto_15565 )
      ( MAKE-1CRATE-VERIFY ?auto_15564 ?auto_15565 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15582 - SURFACE
      ?auto_15583 - SURFACE
      ?auto_15584 - SURFACE
    )
    :vars
    (
      ?auto_15599 - HOIST
      ?auto_15588 - PLACE
      ?auto_15590 - PLACE
      ?auto_15592 - HOIST
      ?auto_15594 - SURFACE
      ?auto_15586 - PLACE
      ?auto_15589 - HOIST
      ?auto_15593 - SURFACE
      ?auto_15596 - SURFACE
      ?auto_15591 - PLACE
      ?auto_15598 - HOIST
      ?auto_15595 - SURFACE
      ?auto_15585 - SURFACE
      ?auto_15597 - SURFACE
      ?auto_15587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15599 ?auto_15588 ) ( IS-CRATE ?auto_15584 ) ( not ( = ?auto_15583 ?auto_15584 ) ) ( not ( = ?auto_15582 ?auto_15583 ) ) ( not ( = ?auto_15582 ?auto_15584 ) ) ( not ( = ?auto_15590 ?auto_15588 ) ) ( HOIST-AT ?auto_15592 ?auto_15590 ) ( not ( = ?auto_15599 ?auto_15592 ) ) ( SURFACE-AT ?auto_15584 ?auto_15590 ) ( ON ?auto_15584 ?auto_15594 ) ( CLEAR ?auto_15584 ) ( not ( = ?auto_15583 ?auto_15594 ) ) ( not ( = ?auto_15584 ?auto_15594 ) ) ( not ( = ?auto_15582 ?auto_15594 ) ) ( IS-CRATE ?auto_15583 ) ( not ( = ?auto_15586 ?auto_15588 ) ) ( not ( = ?auto_15590 ?auto_15586 ) ) ( HOIST-AT ?auto_15589 ?auto_15586 ) ( not ( = ?auto_15599 ?auto_15589 ) ) ( not ( = ?auto_15592 ?auto_15589 ) ) ( AVAILABLE ?auto_15589 ) ( SURFACE-AT ?auto_15583 ?auto_15586 ) ( ON ?auto_15583 ?auto_15593 ) ( CLEAR ?auto_15583 ) ( not ( = ?auto_15583 ?auto_15593 ) ) ( not ( = ?auto_15584 ?auto_15593 ) ) ( not ( = ?auto_15582 ?auto_15593 ) ) ( not ( = ?auto_15594 ?auto_15593 ) ) ( IS-CRATE ?auto_15582 ) ( not ( = ?auto_15596 ?auto_15582 ) ) ( not ( = ?auto_15583 ?auto_15596 ) ) ( not ( = ?auto_15584 ?auto_15596 ) ) ( not ( = ?auto_15594 ?auto_15596 ) ) ( not ( = ?auto_15593 ?auto_15596 ) ) ( not ( = ?auto_15591 ?auto_15588 ) ) ( not ( = ?auto_15590 ?auto_15591 ) ) ( not ( = ?auto_15586 ?auto_15591 ) ) ( HOIST-AT ?auto_15598 ?auto_15591 ) ( not ( = ?auto_15599 ?auto_15598 ) ) ( not ( = ?auto_15592 ?auto_15598 ) ) ( not ( = ?auto_15589 ?auto_15598 ) ) ( AVAILABLE ?auto_15598 ) ( SURFACE-AT ?auto_15582 ?auto_15591 ) ( ON ?auto_15582 ?auto_15595 ) ( CLEAR ?auto_15582 ) ( not ( = ?auto_15583 ?auto_15595 ) ) ( not ( = ?auto_15584 ?auto_15595 ) ) ( not ( = ?auto_15582 ?auto_15595 ) ) ( not ( = ?auto_15594 ?auto_15595 ) ) ( not ( = ?auto_15593 ?auto_15595 ) ) ( not ( = ?auto_15596 ?auto_15595 ) ) ( SURFACE-AT ?auto_15585 ?auto_15588 ) ( CLEAR ?auto_15585 ) ( IS-CRATE ?auto_15596 ) ( not ( = ?auto_15585 ?auto_15596 ) ) ( not ( = ?auto_15583 ?auto_15585 ) ) ( not ( = ?auto_15584 ?auto_15585 ) ) ( not ( = ?auto_15582 ?auto_15585 ) ) ( not ( = ?auto_15594 ?auto_15585 ) ) ( not ( = ?auto_15593 ?auto_15585 ) ) ( not ( = ?auto_15595 ?auto_15585 ) ) ( AVAILABLE ?auto_15599 ) ( AVAILABLE ?auto_15592 ) ( SURFACE-AT ?auto_15596 ?auto_15590 ) ( ON ?auto_15596 ?auto_15597 ) ( CLEAR ?auto_15596 ) ( not ( = ?auto_15583 ?auto_15597 ) ) ( not ( = ?auto_15584 ?auto_15597 ) ) ( not ( = ?auto_15582 ?auto_15597 ) ) ( not ( = ?auto_15594 ?auto_15597 ) ) ( not ( = ?auto_15593 ?auto_15597 ) ) ( not ( = ?auto_15596 ?auto_15597 ) ) ( not ( = ?auto_15595 ?auto_15597 ) ) ( not ( = ?auto_15585 ?auto_15597 ) ) ( TRUCK-AT ?auto_15587 ?auto_15588 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15583 ?auto_15584 )
      ( MAKE-2CRATE-VERIFY ?auto_15582 ?auto_15583 ?auto_15584 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15600 - SURFACE
      ?auto_15601 - SURFACE
      ?auto_15602 - SURFACE
      ?auto_15603 - SURFACE
    )
    :vars
    (
      ?auto_15605 - HOIST
      ?auto_15613 - PLACE
      ?auto_15604 - PLACE
      ?auto_15615 - HOIST
      ?auto_15608 - SURFACE
      ?auto_15614 - PLACE
      ?auto_15611 - HOIST
      ?auto_15612 - SURFACE
      ?auto_15616 - PLACE
      ?auto_15606 - HOIST
      ?auto_15607 - SURFACE
      ?auto_15609 - SURFACE
      ?auto_15610 - SURFACE
      ?auto_15617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15605 ?auto_15613 ) ( IS-CRATE ?auto_15603 ) ( not ( = ?auto_15602 ?auto_15603 ) ) ( not ( = ?auto_15601 ?auto_15602 ) ) ( not ( = ?auto_15601 ?auto_15603 ) ) ( not ( = ?auto_15604 ?auto_15613 ) ) ( HOIST-AT ?auto_15615 ?auto_15604 ) ( not ( = ?auto_15605 ?auto_15615 ) ) ( SURFACE-AT ?auto_15603 ?auto_15604 ) ( ON ?auto_15603 ?auto_15608 ) ( CLEAR ?auto_15603 ) ( not ( = ?auto_15602 ?auto_15608 ) ) ( not ( = ?auto_15603 ?auto_15608 ) ) ( not ( = ?auto_15601 ?auto_15608 ) ) ( IS-CRATE ?auto_15602 ) ( not ( = ?auto_15614 ?auto_15613 ) ) ( not ( = ?auto_15604 ?auto_15614 ) ) ( HOIST-AT ?auto_15611 ?auto_15614 ) ( not ( = ?auto_15605 ?auto_15611 ) ) ( not ( = ?auto_15615 ?auto_15611 ) ) ( AVAILABLE ?auto_15611 ) ( SURFACE-AT ?auto_15602 ?auto_15614 ) ( ON ?auto_15602 ?auto_15612 ) ( CLEAR ?auto_15602 ) ( not ( = ?auto_15602 ?auto_15612 ) ) ( not ( = ?auto_15603 ?auto_15612 ) ) ( not ( = ?auto_15601 ?auto_15612 ) ) ( not ( = ?auto_15608 ?auto_15612 ) ) ( IS-CRATE ?auto_15601 ) ( not ( = ?auto_15600 ?auto_15601 ) ) ( not ( = ?auto_15602 ?auto_15600 ) ) ( not ( = ?auto_15603 ?auto_15600 ) ) ( not ( = ?auto_15608 ?auto_15600 ) ) ( not ( = ?auto_15612 ?auto_15600 ) ) ( not ( = ?auto_15616 ?auto_15613 ) ) ( not ( = ?auto_15604 ?auto_15616 ) ) ( not ( = ?auto_15614 ?auto_15616 ) ) ( HOIST-AT ?auto_15606 ?auto_15616 ) ( not ( = ?auto_15605 ?auto_15606 ) ) ( not ( = ?auto_15615 ?auto_15606 ) ) ( not ( = ?auto_15611 ?auto_15606 ) ) ( AVAILABLE ?auto_15606 ) ( SURFACE-AT ?auto_15601 ?auto_15616 ) ( ON ?auto_15601 ?auto_15607 ) ( CLEAR ?auto_15601 ) ( not ( = ?auto_15602 ?auto_15607 ) ) ( not ( = ?auto_15603 ?auto_15607 ) ) ( not ( = ?auto_15601 ?auto_15607 ) ) ( not ( = ?auto_15608 ?auto_15607 ) ) ( not ( = ?auto_15612 ?auto_15607 ) ) ( not ( = ?auto_15600 ?auto_15607 ) ) ( SURFACE-AT ?auto_15609 ?auto_15613 ) ( CLEAR ?auto_15609 ) ( IS-CRATE ?auto_15600 ) ( not ( = ?auto_15609 ?auto_15600 ) ) ( not ( = ?auto_15602 ?auto_15609 ) ) ( not ( = ?auto_15603 ?auto_15609 ) ) ( not ( = ?auto_15601 ?auto_15609 ) ) ( not ( = ?auto_15608 ?auto_15609 ) ) ( not ( = ?auto_15612 ?auto_15609 ) ) ( not ( = ?auto_15607 ?auto_15609 ) ) ( AVAILABLE ?auto_15605 ) ( AVAILABLE ?auto_15615 ) ( SURFACE-AT ?auto_15600 ?auto_15604 ) ( ON ?auto_15600 ?auto_15610 ) ( CLEAR ?auto_15600 ) ( not ( = ?auto_15602 ?auto_15610 ) ) ( not ( = ?auto_15603 ?auto_15610 ) ) ( not ( = ?auto_15601 ?auto_15610 ) ) ( not ( = ?auto_15608 ?auto_15610 ) ) ( not ( = ?auto_15612 ?auto_15610 ) ) ( not ( = ?auto_15600 ?auto_15610 ) ) ( not ( = ?auto_15607 ?auto_15610 ) ) ( not ( = ?auto_15609 ?auto_15610 ) ) ( TRUCK-AT ?auto_15617 ?auto_15613 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15601 ?auto_15602 ?auto_15603 )
      ( MAKE-3CRATE-VERIFY ?auto_15600 ?auto_15601 ?auto_15602 ?auto_15603 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15618 - SURFACE
      ?auto_15619 - SURFACE
      ?auto_15620 - SURFACE
      ?auto_15621 - SURFACE
      ?auto_15622 - SURFACE
    )
    :vars
    (
      ?auto_15624 - HOIST
      ?auto_15631 - PLACE
      ?auto_15623 - PLACE
      ?auto_15633 - HOIST
      ?auto_15627 - SURFACE
      ?auto_15632 - PLACE
      ?auto_15629 - HOIST
      ?auto_15630 - SURFACE
      ?auto_15634 - PLACE
      ?auto_15625 - HOIST
      ?auto_15626 - SURFACE
      ?auto_15628 - SURFACE
      ?auto_15635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15624 ?auto_15631 ) ( IS-CRATE ?auto_15622 ) ( not ( = ?auto_15621 ?auto_15622 ) ) ( not ( = ?auto_15620 ?auto_15621 ) ) ( not ( = ?auto_15620 ?auto_15622 ) ) ( not ( = ?auto_15623 ?auto_15631 ) ) ( HOIST-AT ?auto_15633 ?auto_15623 ) ( not ( = ?auto_15624 ?auto_15633 ) ) ( SURFACE-AT ?auto_15622 ?auto_15623 ) ( ON ?auto_15622 ?auto_15627 ) ( CLEAR ?auto_15622 ) ( not ( = ?auto_15621 ?auto_15627 ) ) ( not ( = ?auto_15622 ?auto_15627 ) ) ( not ( = ?auto_15620 ?auto_15627 ) ) ( IS-CRATE ?auto_15621 ) ( not ( = ?auto_15632 ?auto_15631 ) ) ( not ( = ?auto_15623 ?auto_15632 ) ) ( HOIST-AT ?auto_15629 ?auto_15632 ) ( not ( = ?auto_15624 ?auto_15629 ) ) ( not ( = ?auto_15633 ?auto_15629 ) ) ( AVAILABLE ?auto_15629 ) ( SURFACE-AT ?auto_15621 ?auto_15632 ) ( ON ?auto_15621 ?auto_15630 ) ( CLEAR ?auto_15621 ) ( not ( = ?auto_15621 ?auto_15630 ) ) ( not ( = ?auto_15622 ?auto_15630 ) ) ( not ( = ?auto_15620 ?auto_15630 ) ) ( not ( = ?auto_15627 ?auto_15630 ) ) ( IS-CRATE ?auto_15620 ) ( not ( = ?auto_15619 ?auto_15620 ) ) ( not ( = ?auto_15621 ?auto_15619 ) ) ( not ( = ?auto_15622 ?auto_15619 ) ) ( not ( = ?auto_15627 ?auto_15619 ) ) ( not ( = ?auto_15630 ?auto_15619 ) ) ( not ( = ?auto_15634 ?auto_15631 ) ) ( not ( = ?auto_15623 ?auto_15634 ) ) ( not ( = ?auto_15632 ?auto_15634 ) ) ( HOIST-AT ?auto_15625 ?auto_15634 ) ( not ( = ?auto_15624 ?auto_15625 ) ) ( not ( = ?auto_15633 ?auto_15625 ) ) ( not ( = ?auto_15629 ?auto_15625 ) ) ( AVAILABLE ?auto_15625 ) ( SURFACE-AT ?auto_15620 ?auto_15634 ) ( ON ?auto_15620 ?auto_15626 ) ( CLEAR ?auto_15620 ) ( not ( = ?auto_15621 ?auto_15626 ) ) ( not ( = ?auto_15622 ?auto_15626 ) ) ( not ( = ?auto_15620 ?auto_15626 ) ) ( not ( = ?auto_15627 ?auto_15626 ) ) ( not ( = ?auto_15630 ?auto_15626 ) ) ( not ( = ?auto_15619 ?auto_15626 ) ) ( SURFACE-AT ?auto_15618 ?auto_15631 ) ( CLEAR ?auto_15618 ) ( IS-CRATE ?auto_15619 ) ( not ( = ?auto_15618 ?auto_15619 ) ) ( not ( = ?auto_15621 ?auto_15618 ) ) ( not ( = ?auto_15622 ?auto_15618 ) ) ( not ( = ?auto_15620 ?auto_15618 ) ) ( not ( = ?auto_15627 ?auto_15618 ) ) ( not ( = ?auto_15630 ?auto_15618 ) ) ( not ( = ?auto_15626 ?auto_15618 ) ) ( AVAILABLE ?auto_15624 ) ( AVAILABLE ?auto_15633 ) ( SURFACE-AT ?auto_15619 ?auto_15623 ) ( ON ?auto_15619 ?auto_15628 ) ( CLEAR ?auto_15619 ) ( not ( = ?auto_15621 ?auto_15628 ) ) ( not ( = ?auto_15622 ?auto_15628 ) ) ( not ( = ?auto_15620 ?auto_15628 ) ) ( not ( = ?auto_15627 ?auto_15628 ) ) ( not ( = ?auto_15630 ?auto_15628 ) ) ( not ( = ?auto_15619 ?auto_15628 ) ) ( not ( = ?auto_15626 ?auto_15628 ) ) ( not ( = ?auto_15618 ?auto_15628 ) ) ( TRUCK-AT ?auto_15635 ?auto_15631 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15620 ?auto_15621 ?auto_15622 )
      ( MAKE-4CRATE-VERIFY ?auto_15618 ?auto_15619 ?auto_15620 ?auto_15621 ?auto_15622 ) )
  )

)

