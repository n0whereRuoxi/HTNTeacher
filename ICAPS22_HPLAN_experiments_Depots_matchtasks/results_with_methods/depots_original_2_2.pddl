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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_516 - SURFACE
      ?auto_517 - SURFACE
    )
    :vars
    (
      ?auto_518 - HOIST
      ?auto_519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_518 ?auto_519 ) ( SURFACE-AT ?auto_516 ?auto_519 ) ( CLEAR ?auto_516 ) ( LIFTING ?auto_518 ?auto_517 ) ( IS-CRATE ?auto_517 ) ( not ( = ?auto_516 ?auto_517 ) ) )
    :subtasks
    ( ( !DROP ?auto_518 ?auto_517 ?auto_516 ?auto_519 )
      ( MAKE-1CRATE-VERIFY ?auto_516 ?auto_517 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_520 - SURFACE
      ?auto_521 - SURFACE
    )
    :vars
    (
      ?auto_522 - HOIST
      ?auto_523 - PLACE
      ?auto_524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_522 ?auto_523 ) ( SURFACE-AT ?auto_520 ?auto_523 ) ( CLEAR ?auto_520 ) ( IS-CRATE ?auto_521 ) ( not ( = ?auto_520 ?auto_521 ) ) ( TRUCK-AT ?auto_524 ?auto_523 ) ( AVAILABLE ?auto_522 ) ( IN ?auto_521 ?auto_524 ) )
    :subtasks
    ( ( !UNLOAD ?auto_522 ?auto_521 ?auto_524 ?auto_523 )
      ( MAKE-1CRATE ?auto_520 ?auto_521 )
      ( MAKE-1CRATE-VERIFY ?auto_520 ?auto_521 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_525 - SURFACE
      ?auto_526 - SURFACE
    )
    :vars
    (
      ?auto_528 - HOIST
      ?auto_527 - PLACE
      ?auto_529 - TRUCK
      ?auto_530 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_528 ?auto_527 ) ( SURFACE-AT ?auto_525 ?auto_527 ) ( CLEAR ?auto_525 ) ( IS-CRATE ?auto_526 ) ( not ( = ?auto_525 ?auto_526 ) ) ( AVAILABLE ?auto_528 ) ( IN ?auto_526 ?auto_529 ) ( TRUCK-AT ?auto_529 ?auto_530 ) ( not ( = ?auto_530 ?auto_527 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_529 ?auto_530 ?auto_527 )
      ( MAKE-1CRATE ?auto_525 ?auto_526 )
      ( MAKE-1CRATE-VERIFY ?auto_525 ?auto_526 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_531 - SURFACE
      ?auto_532 - SURFACE
    )
    :vars
    (
      ?auto_535 - HOIST
      ?auto_533 - PLACE
      ?auto_536 - TRUCK
      ?auto_534 - PLACE
      ?auto_537 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_535 ?auto_533 ) ( SURFACE-AT ?auto_531 ?auto_533 ) ( CLEAR ?auto_531 ) ( IS-CRATE ?auto_532 ) ( not ( = ?auto_531 ?auto_532 ) ) ( AVAILABLE ?auto_535 ) ( TRUCK-AT ?auto_536 ?auto_534 ) ( not ( = ?auto_534 ?auto_533 ) ) ( HOIST-AT ?auto_537 ?auto_534 ) ( LIFTING ?auto_537 ?auto_532 ) ( not ( = ?auto_535 ?auto_537 ) ) )
    :subtasks
    ( ( !LOAD ?auto_537 ?auto_532 ?auto_536 ?auto_534 )
      ( MAKE-1CRATE ?auto_531 ?auto_532 )
      ( MAKE-1CRATE-VERIFY ?auto_531 ?auto_532 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_538 - SURFACE
      ?auto_539 - SURFACE
    )
    :vars
    (
      ?auto_543 - HOIST
      ?auto_542 - PLACE
      ?auto_541 - TRUCK
      ?auto_544 - PLACE
      ?auto_540 - HOIST
      ?auto_545 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_543 ?auto_542 ) ( SURFACE-AT ?auto_538 ?auto_542 ) ( CLEAR ?auto_538 ) ( IS-CRATE ?auto_539 ) ( not ( = ?auto_538 ?auto_539 ) ) ( AVAILABLE ?auto_543 ) ( TRUCK-AT ?auto_541 ?auto_544 ) ( not ( = ?auto_544 ?auto_542 ) ) ( HOIST-AT ?auto_540 ?auto_544 ) ( not ( = ?auto_543 ?auto_540 ) ) ( AVAILABLE ?auto_540 ) ( SURFACE-AT ?auto_539 ?auto_544 ) ( ON ?auto_539 ?auto_545 ) ( CLEAR ?auto_539 ) ( not ( = ?auto_538 ?auto_545 ) ) ( not ( = ?auto_539 ?auto_545 ) ) )
    :subtasks
    ( ( !LIFT ?auto_540 ?auto_539 ?auto_545 ?auto_544 )
      ( MAKE-1CRATE ?auto_538 ?auto_539 )
      ( MAKE-1CRATE-VERIFY ?auto_538 ?auto_539 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_546 - SURFACE
      ?auto_547 - SURFACE
    )
    :vars
    (
      ?auto_553 - HOIST
      ?auto_550 - PLACE
      ?auto_551 - PLACE
      ?auto_552 - HOIST
      ?auto_549 - SURFACE
      ?auto_548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_553 ?auto_550 ) ( SURFACE-AT ?auto_546 ?auto_550 ) ( CLEAR ?auto_546 ) ( IS-CRATE ?auto_547 ) ( not ( = ?auto_546 ?auto_547 ) ) ( AVAILABLE ?auto_553 ) ( not ( = ?auto_551 ?auto_550 ) ) ( HOIST-AT ?auto_552 ?auto_551 ) ( not ( = ?auto_553 ?auto_552 ) ) ( AVAILABLE ?auto_552 ) ( SURFACE-AT ?auto_547 ?auto_551 ) ( ON ?auto_547 ?auto_549 ) ( CLEAR ?auto_547 ) ( not ( = ?auto_546 ?auto_549 ) ) ( not ( = ?auto_547 ?auto_549 ) ) ( TRUCK-AT ?auto_548 ?auto_550 ) )
    :subtasks
    ( ( !DRIVE ?auto_548 ?auto_550 ?auto_551 )
      ( MAKE-1CRATE ?auto_546 ?auto_547 )
      ( MAKE-1CRATE-VERIFY ?auto_546 ?auto_547 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_559 - SURFACE
      ?auto_560 - SURFACE
    )
    :vars
    (
      ?auto_561 - HOIST
      ?auto_562 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_561 ?auto_562 ) ( SURFACE-AT ?auto_559 ?auto_562 ) ( CLEAR ?auto_559 ) ( LIFTING ?auto_561 ?auto_560 ) ( IS-CRATE ?auto_560 ) ( not ( = ?auto_559 ?auto_560 ) ) )
    :subtasks
    ( ( !DROP ?auto_561 ?auto_560 ?auto_559 ?auto_562 )
      ( MAKE-1CRATE-VERIFY ?auto_559 ?auto_560 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_563 - SURFACE
      ?auto_564 - SURFACE
      ?auto_565 - SURFACE
    )
    :vars
    (
      ?auto_566 - HOIST
      ?auto_567 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_566 ?auto_567 ) ( SURFACE-AT ?auto_564 ?auto_567 ) ( CLEAR ?auto_564 ) ( LIFTING ?auto_566 ?auto_565 ) ( IS-CRATE ?auto_565 ) ( not ( = ?auto_564 ?auto_565 ) ) ( ON ?auto_564 ?auto_563 ) ( not ( = ?auto_563 ?auto_564 ) ) ( not ( = ?auto_563 ?auto_565 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_564 ?auto_565 )
      ( MAKE-2CRATE-VERIFY ?auto_563 ?auto_564 ?auto_565 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_568 - SURFACE
      ?auto_569 - SURFACE
    )
    :vars
    (
      ?auto_570 - HOIST
      ?auto_571 - PLACE
      ?auto_572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_570 ?auto_571 ) ( SURFACE-AT ?auto_568 ?auto_571 ) ( CLEAR ?auto_568 ) ( IS-CRATE ?auto_569 ) ( not ( = ?auto_568 ?auto_569 ) ) ( TRUCK-AT ?auto_572 ?auto_571 ) ( AVAILABLE ?auto_570 ) ( IN ?auto_569 ?auto_572 ) )
    :subtasks
    ( ( !UNLOAD ?auto_570 ?auto_569 ?auto_572 ?auto_571 )
      ( MAKE-1CRATE ?auto_568 ?auto_569 )
      ( MAKE-1CRATE-VERIFY ?auto_568 ?auto_569 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_573 - SURFACE
      ?auto_574 - SURFACE
      ?auto_575 - SURFACE
    )
    :vars
    (
      ?auto_576 - HOIST
      ?auto_577 - PLACE
      ?auto_578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_576 ?auto_577 ) ( SURFACE-AT ?auto_574 ?auto_577 ) ( CLEAR ?auto_574 ) ( IS-CRATE ?auto_575 ) ( not ( = ?auto_574 ?auto_575 ) ) ( TRUCK-AT ?auto_578 ?auto_577 ) ( AVAILABLE ?auto_576 ) ( IN ?auto_575 ?auto_578 ) ( ON ?auto_574 ?auto_573 ) ( not ( = ?auto_573 ?auto_574 ) ) ( not ( = ?auto_573 ?auto_575 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_574 ?auto_575 )
      ( MAKE-2CRATE-VERIFY ?auto_573 ?auto_574 ?auto_575 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_579 - SURFACE
      ?auto_580 - SURFACE
    )
    :vars
    (
      ?auto_584 - HOIST
      ?auto_581 - PLACE
      ?auto_583 - TRUCK
      ?auto_582 - SURFACE
      ?auto_585 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_584 ?auto_581 ) ( SURFACE-AT ?auto_579 ?auto_581 ) ( CLEAR ?auto_579 ) ( IS-CRATE ?auto_580 ) ( not ( = ?auto_579 ?auto_580 ) ) ( AVAILABLE ?auto_584 ) ( IN ?auto_580 ?auto_583 ) ( ON ?auto_579 ?auto_582 ) ( not ( = ?auto_582 ?auto_579 ) ) ( not ( = ?auto_582 ?auto_580 ) ) ( TRUCK-AT ?auto_583 ?auto_585 ) ( not ( = ?auto_585 ?auto_581 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_583 ?auto_585 ?auto_581 )
      ( MAKE-2CRATE ?auto_582 ?auto_579 ?auto_580 )
      ( MAKE-1CRATE-VERIFY ?auto_579 ?auto_580 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_586 - SURFACE
      ?auto_587 - SURFACE
      ?auto_588 - SURFACE
    )
    :vars
    (
      ?auto_590 - HOIST
      ?auto_591 - PLACE
      ?auto_592 - TRUCK
      ?auto_589 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_590 ?auto_591 ) ( SURFACE-AT ?auto_587 ?auto_591 ) ( CLEAR ?auto_587 ) ( IS-CRATE ?auto_588 ) ( not ( = ?auto_587 ?auto_588 ) ) ( AVAILABLE ?auto_590 ) ( IN ?auto_588 ?auto_592 ) ( ON ?auto_587 ?auto_586 ) ( not ( = ?auto_586 ?auto_587 ) ) ( not ( = ?auto_586 ?auto_588 ) ) ( TRUCK-AT ?auto_592 ?auto_589 ) ( not ( = ?auto_589 ?auto_591 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_587 ?auto_588 )
      ( MAKE-2CRATE-VERIFY ?auto_586 ?auto_587 ?auto_588 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593 - SURFACE
      ?auto_594 - SURFACE
    )
    :vars
    (
      ?auto_598 - HOIST
      ?auto_595 - PLACE
      ?auto_599 - SURFACE
      ?auto_596 - TRUCK
      ?auto_597 - PLACE
      ?auto_600 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_598 ?auto_595 ) ( SURFACE-AT ?auto_593 ?auto_595 ) ( CLEAR ?auto_593 ) ( IS-CRATE ?auto_594 ) ( not ( = ?auto_593 ?auto_594 ) ) ( AVAILABLE ?auto_598 ) ( ON ?auto_593 ?auto_599 ) ( not ( = ?auto_599 ?auto_593 ) ) ( not ( = ?auto_599 ?auto_594 ) ) ( TRUCK-AT ?auto_596 ?auto_597 ) ( not ( = ?auto_597 ?auto_595 ) ) ( HOIST-AT ?auto_600 ?auto_597 ) ( LIFTING ?auto_600 ?auto_594 ) ( not ( = ?auto_598 ?auto_600 ) ) )
    :subtasks
    ( ( !LOAD ?auto_600 ?auto_594 ?auto_596 ?auto_597 )
      ( MAKE-2CRATE ?auto_599 ?auto_593 ?auto_594 )
      ( MAKE-1CRATE-VERIFY ?auto_593 ?auto_594 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_601 - SURFACE
      ?auto_602 - SURFACE
      ?auto_603 - SURFACE
    )
    :vars
    (
      ?auto_608 - HOIST
      ?auto_604 - PLACE
      ?auto_605 - TRUCK
      ?auto_606 - PLACE
      ?auto_607 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_608 ?auto_604 ) ( SURFACE-AT ?auto_602 ?auto_604 ) ( CLEAR ?auto_602 ) ( IS-CRATE ?auto_603 ) ( not ( = ?auto_602 ?auto_603 ) ) ( AVAILABLE ?auto_608 ) ( ON ?auto_602 ?auto_601 ) ( not ( = ?auto_601 ?auto_602 ) ) ( not ( = ?auto_601 ?auto_603 ) ) ( TRUCK-AT ?auto_605 ?auto_606 ) ( not ( = ?auto_606 ?auto_604 ) ) ( HOIST-AT ?auto_607 ?auto_606 ) ( LIFTING ?auto_607 ?auto_603 ) ( not ( = ?auto_608 ?auto_607 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_602 ?auto_603 )
      ( MAKE-2CRATE-VERIFY ?auto_601 ?auto_602 ?auto_603 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_609 - SURFACE
      ?auto_610 - SURFACE
    )
    :vars
    (
      ?auto_615 - HOIST
      ?auto_613 - PLACE
      ?auto_611 - SURFACE
      ?auto_616 - TRUCK
      ?auto_612 - PLACE
      ?auto_614 - HOIST
      ?auto_617 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_615 ?auto_613 ) ( SURFACE-AT ?auto_609 ?auto_613 ) ( CLEAR ?auto_609 ) ( IS-CRATE ?auto_610 ) ( not ( = ?auto_609 ?auto_610 ) ) ( AVAILABLE ?auto_615 ) ( ON ?auto_609 ?auto_611 ) ( not ( = ?auto_611 ?auto_609 ) ) ( not ( = ?auto_611 ?auto_610 ) ) ( TRUCK-AT ?auto_616 ?auto_612 ) ( not ( = ?auto_612 ?auto_613 ) ) ( HOIST-AT ?auto_614 ?auto_612 ) ( not ( = ?auto_615 ?auto_614 ) ) ( AVAILABLE ?auto_614 ) ( SURFACE-AT ?auto_610 ?auto_612 ) ( ON ?auto_610 ?auto_617 ) ( CLEAR ?auto_610 ) ( not ( = ?auto_609 ?auto_617 ) ) ( not ( = ?auto_610 ?auto_617 ) ) ( not ( = ?auto_611 ?auto_617 ) ) )
    :subtasks
    ( ( !LIFT ?auto_614 ?auto_610 ?auto_617 ?auto_612 )
      ( MAKE-2CRATE ?auto_611 ?auto_609 ?auto_610 )
      ( MAKE-1CRATE-VERIFY ?auto_609 ?auto_610 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_618 - SURFACE
      ?auto_619 - SURFACE
      ?auto_620 - SURFACE
    )
    :vars
    (
      ?auto_625 - HOIST
      ?auto_626 - PLACE
      ?auto_621 - TRUCK
      ?auto_624 - PLACE
      ?auto_623 - HOIST
      ?auto_622 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_625 ?auto_626 ) ( SURFACE-AT ?auto_619 ?auto_626 ) ( CLEAR ?auto_619 ) ( IS-CRATE ?auto_620 ) ( not ( = ?auto_619 ?auto_620 ) ) ( AVAILABLE ?auto_625 ) ( ON ?auto_619 ?auto_618 ) ( not ( = ?auto_618 ?auto_619 ) ) ( not ( = ?auto_618 ?auto_620 ) ) ( TRUCK-AT ?auto_621 ?auto_624 ) ( not ( = ?auto_624 ?auto_626 ) ) ( HOIST-AT ?auto_623 ?auto_624 ) ( not ( = ?auto_625 ?auto_623 ) ) ( AVAILABLE ?auto_623 ) ( SURFACE-AT ?auto_620 ?auto_624 ) ( ON ?auto_620 ?auto_622 ) ( CLEAR ?auto_620 ) ( not ( = ?auto_619 ?auto_622 ) ) ( not ( = ?auto_620 ?auto_622 ) ) ( not ( = ?auto_618 ?auto_622 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_619 ?auto_620 )
      ( MAKE-2CRATE-VERIFY ?auto_618 ?auto_619 ?auto_620 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_627 - SURFACE
      ?auto_628 - SURFACE
    )
    :vars
    (
      ?auto_630 - HOIST
      ?auto_629 - PLACE
      ?auto_633 - SURFACE
      ?auto_634 - PLACE
      ?auto_635 - HOIST
      ?auto_631 - SURFACE
      ?auto_632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_630 ?auto_629 ) ( SURFACE-AT ?auto_627 ?auto_629 ) ( CLEAR ?auto_627 ) ( IS-CRATE ?auto_628 ) ( not ( = ?auto_627 ?auto_628 ) ) ( AVAILABLE ?auto_630 ) ( ON ?auto_627 ?auto_633 ) ( not ( = ?auto_633 ?auto_627 ) ) ( not ( = ?auto_633 ?auto_628 ) ) ( not ( = ?auto_634 ?auto_629 ) ) ( HOIST-AT ?auto_635 ?auto_634 ) ( not ( = ?auto_630 ?auto_635 ) ) ( AVAILABLE ?auto_635 ) ( SURFACE-AT ?auto_628 ?auto_634 ) ( ON ?auto_628 ?auto_631 ) ( CLEAR ?auto_628 ) ( not ( = ?auto_627 ?auto_631 ) ) ( not ( = ?auto_628 ?auto_631 ) ) ( not ( = ?auto_633 ?auto_631 ) ) ( TRUCK-AT ?auto_632 ?auto_629 ) )
    :subtasks
    ( ( !DRIVE ?auto_632 ?auto_629 ?auto_634 )
      ( MAKE-2CRATE ?auto_633 ?auto_627 ?auto_628 )
      ( MAKE-1CRATE-VERIFY ?auto_627 ?auto_628 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_636 - SURFACE
      ?auto_637 - SURFACE
      ?auto_638 - SURFACE
    )
    :vars
    (
      ?auto_639 - HOIST
      ?auto_641 - PLACE
      ?auto_643 - PLACE
      ?auto_642 - HOIST
      ?auto_644 - SURFACE
      ?auto_640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_639 ?auto_641 ) ( SURFACE-AT ?auto_637 ?auto_641 ) ( CLEAR ?auto_637 ) ( IS-CRATE ?auto_638 ) ( not ( = ?auto_637 ?auto_638 ) ) ( AVAILABLE ?auto_639 ) ( ON ?auto_637 ?auto_636 ) ( not ( = ?auto_636 ?auto_637 ) ) ( not ( = ?auto_636 ?auto_638 ) ) ( not ( = ?auto_643 ?auto_641 ) ) ( HOIST-AT ?auto_642 ?auto_643 ) ( not ( = ?auto_639 ?auto_642 ) ) ( AVAILABLE ?auto_642 ) ( SURFACE-AT ?auto_638 ?auto_643 ) ( ON ?auto_638 ?auto_644 ) ( CLEAR ?auto_638 ) ( not ( = ?auto_637 ?auto_644 ) ) ( not ( = ?auto_638 ?auto_644 ) ) ( not ( = ?auto_636 ?auto_644 ) ) ( TRUCK-AT ?auto_640 ?auto_641 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_637 ?auto_638 )
      ( MAKE-2CRATE-VERIFY ?auto_636 ?auto_637 ?auto_638 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_645 - SURFACE
      ?auto_646 - SURFACE
    )
    :vars
    (
      ?auto_651 - HOIST
      ?auto_648 - PLACE
      ?auto_647 - SURFACE
      ?auto_653 - PLACE
      ?auto_649 - HOIST
      ?auto_652 - SURFACE
      ?auto_650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_651 ?auto_648 ) ( IS-CRATE ?auto_646 ) ( not ( = ?auto_645 ?auto_646 ) ) ( not ( = ?auto_647 ?auto_645 ) ) ( not ( = ?auto_647 ?auto_646 ) ) ( not ( = ?auto_653 ?auto_648 ) ) ( HOIST-AT ?auto_649 ?auto_653 ) ( not ( = ?auto_651 ?auto_649 ) ) ( AVAILABLE ?auto_649 ) ( SURFACE-AT ?auto_646 ?auto_653 ) ( ON ?auto_646 ?auto_652 ) ( CLEAR ?auto_646 ) ( not ( = ?auto_645 ?auto_652 ) ) ( not ( = ?auto_646 ?auto_652 ) ) ( not ( = ?auto_647 ?auto_652 ) ) ( TRUCK-AT ?auto_650 ?auto_648 ) ( SURFACE-AT ?auto_647 ?auto_648 ) ( CLEAR ?auto_647 ) ( LIFTING ?auto_651 ?auto_645 ) ( IS-CRATE ?auto_645 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_647 ?auto_645 )
      ( MAKE-2CRATE ?auto_647 ?auto_645 ?auto_646 )
      ( MAKE-1CRATE-VERIFY ?auto_645 ?auto_646 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_654 - SURFACE
      ?auto_655 - SURFACE
      ?auto_656 - SURFACE
    )
    :vars
    (
      ?auto_658 - HOIST
      ?auto_660 - PLACE
      ?auto_657 - PLACE
      ?auto_659 - HOIST
      ?auto_662 - SURFACE
      ?auto_661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_658 ?auto_660 ) ( IS-CRATE ?auto_656 ) ( not ( = ?auto_655 ?auto_656 ) ) ( not ( = ?auto_654 ?auto_655 ) ) ( not ( = ?auto_654 ?auto_656 ) ) ( not ( = ?auto_657 ?auto_660 ) ) ( HOIST-AT ?auto_659 ?auto_657 ) ( not ( = ?auto_658 ?auto_659 ) ) ( AVAILABLE ?auto_659 ) ( SURFACE-AT ?auto_656 ?auto_657 ) ( ON ?auto_656 ?auto_662 ) ( CLEAR ?auto_656 ) ( not ( = ?auto_655 ?auto_662 ) ) ( not ( = ?auto_656 ?auto_662 ) ) ( not ( = ?auto_654 ?auto_662 ) ) ( TRUCK-AT ?auto_661 ?auto_660 ) ( SURFACE-AT ?auto_654 ?auto_660 ) ( CLEAR ?auto_654 ) ( LIFTING ?auto_658 ?auto_655 ) ( IS-CRATE ?auto_655 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_655 ?auto_656 )
      ( MAKE-2CRATE-VERIFY ?auto_654 ?auto_655 ?auto_656 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_663 - SURFACE
      ?auto_664 - SURFACE
    )
    :vars
    (
      ?auto_669 - HOIST
      ?auto_668 - PLACE
      ?auto_666 - SURFACE
      ?auto_670 - PLACE
      ?auto_665 - HOIST
      ?auto_671 - SURFACE
      ?auto_667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_669 ?auto_668 ) ( IS-CRATE ?auto_664 ) ( not ( = ?auto_663 ?auto_664 ) ) ( not ( = ?auto_666 ?auto_663 ) ) ( not ( = ?auto_666 ?auto_664 ) ) ( not ( = ?auto_670 ?auto_668 ) ) ( HOIST-AT ?auto_665 ?auto_670 ) ( not ( = ?auto_669 ?auto_665 ) ) ( AVAILABLE ?auto_665 ) ( SURFACE-AT ?auto_664 ?auto_670 ) ( ON ?auto_664 ?auto_671 ) ( CLEAR ?auto_664 ) ( not ( = ?auto_663 ?auto_671 ) ) ( not ( = ?auto_664 ?auto_671 ) ) ( not ( = ?auto_666 ?auto_671 ) ) ( TRUCK-AT ?auto_667 ?auto_668 ) ( SURFACE-AT ?auto_666 ?auto_668 ) ( CLEAR ?auto_666 ) ( IS-CRATE ?auto_663 ) ( AVAILABLE ?auto_669 ) ( IN ?auto_663 ?auto_667 ) )
    :subtasks
    ( ( !UNLOAD ?auto_669 ?auto_663 ?auto_667 ?auto_668 )
      ( MAKE-2CRATE ?auto_666 ?auto_663 ?auto_664 )
      ( MAKE-1CRATE-VERIFY ?auto_663 ?auto_664 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_672 - SURFACE
      ?auto_673 - SURFACE
      ?auto_674 - SURFACE
    )
    :vars
    (
      ?auto_680 - HOIST
      ?auto_678 - PLACE
      ?auto_679 - PLACE
      ?auto_677 - HOIST
      ?auto_675 - SURFACE
      ?auto_676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_680 ?auto_678 ) ( IS-CRATE ?auto_674 ) ( not ( = ?auto_673 ?auto_674 ) ) ( not ( = ?auto_672 ?auto_673 ) ) ( not ( = ?auto_672 ?auto_674 ) ) ( not ( = ?auto_679 ?auto_678 ) ) ( HOIST-AT ?auto_677 ?auto_679 ) ( not ( = ?auto_680 ?auto_677 ) ) ( AVAILABLE ?auto_677 ) ( SURFACE-AT ?auto_674 ?auto_679 ) ( ON ?auto_674 ?auto_675 ) ( CLEAR ?auto_674 ) ( not ( = ?auto_673 ?auto_675 ) ) ( not ( = ?auto_674 ?auto_675 ) ) ( not ( = ?auto_672 ?auto_675 ) ) ( TRUCK-AT ?auto_676 ?auto_678 ) ( SURFACE-AT ?auto_672 ?auto_678 ) ( CLEAR ?auto_672 ) ( IS-CRATE ?auto_673 ) ( AVAILABLE ?auto_680 ) ( IN ?auto_673 ?auto_676 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_673 ?auto_674 )
      ( MAKE-2CRATE-VERIFY ?auto_672 ?auto_673 ?auto_674 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_681 - SURFACE
      ?auto_682 - SURFACE
    )
    :vars
    (
      ?auto_687 - HOIST
      ?auto_689 - PLACE
      ?auto_683 - SURFACE
      ?auto_684 - PLACE
      ?auto_688 - HOIST
      ?auto_685 - SURFACE
      ?auto_686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_687 ?auto_689 ) ( IS-CRATE ?auto_682 ) ( not ( = ?auto_681 ?auto_682 ) ) ( not ( = ?auto_683 ?auto_681 ) ) ( not ( = ?auto_683 ?auto_682 ) ) ( not ( = ?auto_684 ?auto_689 ) ) ( HOIST-AT ?auto_688 ?auto_684 ) ( not ( = ?auto_687 ?auto_688 ) ) ( AVAILABLE ?auto_688 ) ( SURFACE-AT ?auto_682 ?auto_684 ) ( ON ?auto_682 ?auto_685 ) ( CLEAR ?auto_682 ) ( not ( = ?auto_681 ?auto_685 ) ) ( not ( = ?auto_682 ?auto_685 ) ) ( not ( = ?auto_683 ?auto_685 ) ) ( SURFACE-AT ?auto_683 ?auto_689 ) ( CLEAR ?auto_683 ) ( IS-CRATE ?auto_681 ) ( AVAILABLE ?auto_687 ) ( IN ?auto_681 ?auto_686 ) ( TRUCK-AT ?auto_686 ?auto_684 ) )
    :subtasks
    ( ( !DRIVE ?auto_686 ?auto_684 ?auto_689 )
      ( MAKE-2CRATE ?auto_683 ?auto_681 ?auto_682 )
      ( MAKE-1CRATE-VERIFY ?auto_681 ?auto_682 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_690 - SURFACE
      ?auto_691 - SURFACE
      ?auto_692 - SURFACE
    )
    :vars
    (
      ?auto_694 - HOIST
      ?auto_697 - PLACE
      ?auto_695 - PLACE
      ?auto_696 - HOIST
      ?auto_698 - SURFACE
      ?auto_693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694 ?auto_697 ) ( IS-CRATE ?auto_692 ) ( not ( = ?auto_691 ?auto_692 ) ) ( not ( = ?auto_690 ?auto_691 ) ) ( not ( = ?auto_690 ?auto_692 ) ) ( not ( = ?auto_695 ?auto_697 ) ) ( HOIST-AT ?auto_696 ?auto_695 ) ( not ( = ?auto_694 ?auto_696 ) ) ( AVAILABLE ?auto_696 ) ( SURFACE-AT ?auto_692 ?auto_695 ) ( ON ?auto_692 ?auto_698 ) ( CLEAR ?auto_692 ) ( not ( = ?auto_691 ?auto_698 ) ) ( not ( = ?auto_692 ?auto_698 ) ) ( not ( = ?auto_690 ?auto_698 ) ) ( SURFACE-AT ?auto_690 ?auto_697 ) ( CLEAR ?auto_690 ) ( IS-CRATE ?auto_691 ) ( AVAILABLE ?auto_694 ) ( IN ?auto_691 ?auto_693 ) ( TRUCK-AT ?auto_693 ?auto_695 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_691 ?auto_692 )
      ( MAKE-2CRATE-VERIFY ?auto_690 ?auto_691 ?auto_692 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_699 - SURFACE
      ?auto_700 - SURFACE
    )
    :vars
    (
      ?auto_702 - HOIST
      ?auto_706 - PLACE
      ?auto_704 - SURFACE
      ?auto_703 - PLACE
      ?auto_707 - HOIST
      ?auto_701 - SURFACE
      ?auto_705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_702 ?auto_706 ) ( IS-CRATE ?auto_700 ) ( not ( = ?auto_699 ?auto_700 ) ) ( not ( = ?auto_704 ?auto_699 ) ) ( not ( = ?auto_704 ?auto_700 ) ) ( not ( = ?auto_703 ?auto_706 ) ) ( HOIST-AT ?auto_707 ?auto_703 ) ( not ( = ?auto_702 ?auto_707 ) ) ( SURFACE-AT ?auto_700 ?auto_703 ) ( ON ?auto_700 ?auto_701 ) ( CLEAR ?auto_700 ) ( not ( = ?auto_699 ?auto_701 ) ) ( not ( = ?auto_700 ?auto_701 ) ) ( not ( = ?auto_704 ?auto_701 ) ) ( SURFACE-AT ?auto_704 ?auto_706 ) ( CLEAR ?auto_704 ) ( IS-CRATE ?auto_699 ) ( AVAILABLE ?auto_702 ) ( TRUCK-AT ?auto_705 ?auto_703 ) ( LIFTING ?auto_707 ?auto_699 ) )
    :subtasks
    ( ( !LOAD ?auto_707 ?auto_699 ?auto_705 ?auto_703 )
      ( MAKE-2CRATE ?auto_704 ?auto_699 ?auto_700 )
      ( MAKE-1CRATE-VERIFY ?auto_699 ?auto_700 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_708 - SURFACE
      ?auto_709 - SURFACE
      ?auto_710 - SURFACE
    )
    :vars
    (
      ?auto_715 - HOIST
      ?auto_712 - PLACE
      ?auto_713 - PLACE
      ?auto_711 - HOIST
      ?auto_716 - SURFACE
      ?auto_714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_715 ?auto_712 ) ( IS-CRATE ?auto_710 ) ( not ( = ?auto_709 ?auto_710 ) ) ( not ( = ?auto_708 ?auto_709 ) ) ( not ( = ?auto_708 ?auto_710 ) ) ( not ( = ?auto_713 ?auto_712 ) ) ( HOIST-AT ?auto_711 ?auto_713 ) ( not ( = ?auto_715 ?auto_711 ) ) ( SURFACE-AT ?auto_710 ?auto_713 ) ( ON ?auto_710 ?auto_716 ) ( CLEAR ?auto_710 ) ( not ( = ?auto_709 ?auto_716 ) ) ( not ( = ?auto_710 ?auto_716 ) ) ( not ( = ?auto_708 ?auto_716 ) ) ( SURFACE-AT ?auto_708 ?auto_712 ) ( CLEAR ?auto_708 ) ( IS-CRATE ?auto_709 ) ( AVAILABLE ?auto_715 ) ( TRUCK-AT ?auto_714 ?auto_713 ) ( LIFTING ?auto_711 ?auto_709 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_709 ?auto_710 )
      ( MAKE-2CRATE-VERIFY ?auto_708 ?auto_709 ?auto_710 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_717 - SURFACE
      ?auto_718 - SURFACE
    )
    :vars
    (
      ?auto_723 - HOIST
      ?auto_719 - PLACE
      ?auto_725 - SURFACE
      ?auto_724 - PLACE
      ?auto_721 - HOIST
      ?auto_722 - SURFACE
      ?auto_720 - TRUCK
      ?auto_726 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_723 ?auto_719 ) ( IS-CRATE ?auto_718 ) ( not ( = ?auto_717 ?auto_718 ) ) ( not ( = ?auto_725 ?auto_717 ) ) ( not ( = ?auto_725 ?auto_718 ) ) ( not ( = ?auto_724 ?auto_719 ) ) ( HOIST-AT ?auto_721 ?auto_724 ) ( not ( = ?auto_723 ?auto_721 ) ) ( SURFACE-AT ?auto_718 ?auto_724 ) ( ON ?auto_718 ?auto_722 ) ( CLEAR ?auto_718 ) ( not ( = ?auto_717 ?auto_722 ) ) ( not ( = ?auto_718 ?auto_722 ) ) ( not ( = ?auto_725 ?auto_722 ) ) ( SURFACE-AT ?auto_725 ?auto_719 ) ( CLEAR ?auto_725 ) ( IS-CRATE ?auto_717 ) ( AVAILABLE ?auto_723 ) ( TRUCK-AT ?auto_720 ?auto_724 ) ( AVAILABLE ?auto_721 ) ( SURFACE-AT ?auto_717 ?auto_724 ) ( ON ?auto_717 ?auto_726 ) ( CLEAR ?auto_717 ) ( not ( = ?auto_717 ?auto_726 ) ) ( not ( = ?auto_718 ?auto_726 ) ) ( not ( = ?auto_725 ?auto_726 ) ) ( not ( = ?auto_722 ?auto_726 ) ) )
    :subtasks
    ( ( !LIFT ?auto_721 ?auto_717 ?auto_726 ?auto_724 )
      ( MAKE-2CRATE ?auto_725 ?auto_717 ?auto_718 )
      ( MAKE-1CRATE-VERIFY ?auto_717 ?auto_718 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_727 - SURFACE
      ?auto_728 - SURFACE
      ?auto_729 - SURFACE
    )
    :vars
    (
      ?auto_730 - HOIST
      ?auto_732 - PLACE
      ?auto_733 - PLACE
      ?auto_734 - HOIST
      ?auto_736 - SURFACE
      ?auto_731 - TRUCK
      ?auto_735 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_730 ?auto_732 ) ( IS-CRATE ?auto_729 ) ( not ( = ?auto_728 ?auto_729 ) ) ( not ( = ?auto_727 ?auto_728 ) ) ( not ( = ?auto_727 ?auto_729 ) ) ( not ( = ?auto_733 ?auto_732 ) ) ( HOIST-AT ?auto_734 ?auto_733 ) ( not ( = ?auto_730 ?auto_734 ) ) ( SURFACE-AT ?auto_729 ?auto_733 ) ( ON ?auto_729 ?auto_736 ) ( CLEAR ?auto_729 ) ( not ( = ?auto_728 ?auto_736 ) ) ( not ( = ?auto_729 ?auto_736 ) ) ( not ( = ?auto_727 ?auto_736 ) ) ( SURFACE-AT ?auto_727 ?auto_732 ) ( CLEAR ?auto_727 ) ( IS-CRATE ?auto_728 ) ( AVAILABLE ?auto_730 ) ( TRUCK-AT ?auto_731 ?auto_733 ) ( AVAILABLE ?auto_734 ) ( SURFACE-AT ?auto_728 ?auto_733 ) ( ON ?auto_728 ?auto_735 ) ( CLEAR ?auto_728 ) ( not ( = ?auto_728 ?auto_735 ) ) ( not ( = ?auto_729 ?auto_735 ) ) ( not ( = ?auto_727 ?auto_735 ) ) ( not ( = ?auto_736 ?auto_735 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_728 ?auto_729 )
      ( MAKE-2CRATE-VERIFY ?auto_727 ?auto_728 ?auto_729 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_737 - SURFACE
      ?auto_738 - SURFACE
    )
    :vars
    (
      ?auto_745 - HOIST
      ?auto_746 - PLACE
      ?auto_744 - SURFACE
      ?auto_742 - PLACE
      ?auto_741 - HOIST
      ?auto_739 - SURFACE
      ?auto_740 - SURFACE
      ?auto_743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_745 ?auto_746 ) ( IS-CRATE ?auto_738 ) ( not ( = ?auto_737 ?auto_738 ) ) ( not ( = ?auto_744 ?auto_737 ) ) ( not ( = ?auto_744 ?auto_738 ) ) ( not ( = ?auto_742 ?auto_746 ) ) ( HOIST-AT ?auto_741 ?auto_742 ) ( not ( = ?auto_745 ?auto_741 ) ) ( SURFACE-AT ?auto_738 ?auto_742 ) ( ON ?auto_738 ?auto_739 ) ( CLEAR ?auto_738 ) ( not ( = ?auto_737 ?auto_739 ) ) ( not ( = ?auto_738 ?auto_739 ) ) ( not ( = ?auto_744 ?auto_739 ) ) ( SURFACE-AT ?auto_744 ?auto_746 ) ( CLEAR ?auto_744 ) ( IS-CRATE ?auto_737 ) ( AVAILABLE ?auto_745 ) ( AVAILABLE ?auto_741 ) ( SURFACE-AT ?auto_737 ?auto_742 ) ( ON ?auto_737 ?auto_740 ) ( CLEAR ?auto_737 ) ( not ( = ?auto_737 ?auto_740 ) ) ( not ( = ?auto_738 ?auto_740 ) ) ( not ( = ?auto_744 ?auto_740 ) ) ( not ( = ?auto_739 ?auto_740 ) ) ( TRUCK-AT ?auto_743 ?auto_746 ) )
    :subtasks
    ( ( !DRIVE ?auto_743 ?auto_746 ?auto_742 )
      ( MAKE-2CRATE ?auto_744 ?auto_737 ?auto_738 )
      ( MAKE-1CRATE-VERIFY ?auto_737 ?auto_738 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_747 - SURFACE
      ?auto_748 - SURFACE
      ?auto_749 - SURFACE
    )
    :vars
    (
      ?auto_753 - HOIST
      ?auto_752 - PLACE
      ?auto_754 - PLACE
      ?auto_755 - HOIST
      ?auto_751 - SURFACE
      ?auto_756 - SURFACE
      ?auto_750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_753 ?auto_752 ) ( IS-CRATE ?auto_749 ) ( not ( = ?auto_748 ?auto_749 ) ) ( not ( = ?auto_747 ?auto_748 ) ) ( not ( = ?auto_747 ?auto_749 ) ) ( not ( = ?auto_754 ?auto_752 ) ) ( HOIST-AT ?auto_755 ?auto_754 ) ( not ( = ?auto_753 ?auto_755 ) ) ( SURFACE-AT ?auto_749 ?auto_754 ) ( ON ?auto_749 ?auto_751 ) ( CLEAR ?auto_749 ) ( not ( = ?auto_748 ?auto_751 ) ) ( not ( = ?auto_749 ?auto_751 ) ) ( not ( = ?auto_747 ?auto_751 ) ) ( SURFACE-AT ?auto_747 ?auto_752 ) ( CLEAR ?auto_747 ) ( IS-CRATE ?auto_748 ) ( AVAILABLE ?auto_753 ) ( AVAILABLE ?auto_755 ) ( SURFACE-AT ?auto_748 ?auto_754 ) ( ON ?auto_748 ?auto_756 ) ( CLEAR ?auto_748 ) ( not ( = ?auto_748 ?auto_756 ) ) ( not ( = ?auto_749 ?auto_756 ) ) ( not ( = ?auto_747 ?auto_756 ) ) ( not ( = ?auto_751 ?auto_756 ) ) ( TRUCK-AT ?auto_750 ?auto_752 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_748 ?auto_749 )
      ( MAKE-2CRATE-VERIFY ?auto_747 ?auto_748 ?auto_749 ) )
  )

)

