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
      ?auto_523 - SURFACE
      ?auto_524 - SURFACE
    )
    :vars
    (
      ?auto_525 - HOIST
      ?auto_526 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_525 ?auto_526 ) ( SURFACE-AT ?auto_524 ?auto_526 ) ( CLEAR ?auto_524 ) ( LIFTING ?auto_525 ?auto_523 ) ( IS-CRATE ?auto_523 ) ( not ( = ?auto_523 ?auto_524 ) ) )
    :subtasks
    ( ( !DROP ?auto_525 ?auto_523 ?auto_524 ?auto_526 )
      ( MAKE-ON-VERIFY ?auto_523 ?auto_524 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_527 - SURFACE
      ?auto_528 - SURFACE
    )
    :vars
    (
      ?auto_530 - HOIST
      ?auto_529 - PLACE
      ?auto_531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_530 ?auto_529 ) ( SURFACE-AT ?auto_528 ?auto_529 ) ( CLEAR ?auto_528 ) ( IS-CRATE ?auto_527 ) ( not ( = ?auto_527 ?auto_528 ) ) ( TRUCK-AT ?auto_531 ?auto_529 ) ( AVAILABLE ?auto_530 ) ( IN ?auto_527 ?auto_531 ) )
    :subtasks
    ( ( !UNLOAD ?auto_530 ?auto_527 ?auto_531 ?auto_529 )
      ( MAKE-ON ?auto_527 ?auto_528 )
      ( MAKE-ON-VERIFY ?auto_527 ?auto_528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_532 - SURFACE
      ?auto_533 - SURFACE
    )
    :vars
    (
      ?auto_535 - HOIST
      ?auto_534 - PLACE
      ?auto_536 - TRUCK
      ?auto_537 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_535 ?auto_534 ) ( SURFACE-AT ?auto_533 ?auto_534 ) ( CLEAR ?auto_533 ) ( IS-CRATE ?auto_532 ) ( not ( = ?auto_532 ?auto_533 ) ) ( AVAILABLE ?auto_535 ) ( IN ?auto_532 ?auto_536 ) ( TRUCK-AT ?auto_536 ?auto_537 ) ( not ( = ?auto_537 ?auto_534 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_536 ?auto_537 ?auto_534 )
      ( MAKE-ON ?auto_532 ?auto_533 )
      ( MAKE-ON-VERIFY ?auto_532 ?auto_533 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_538 - SURFACE
      ?auto_539 - SURFACE
    )
    :vars
    (
      ?auto_542 - HOIST
      ?auto_540 - PLACE
      ?auto_541 - TRUCK
      ?auto_543 - PLACE
      ?auto_544 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_542 ?auto_540 ) ( SURFACE-AT ?auto_539 ?auto_540 ) ( CLEAR ?auto_539 ) ( IS-CRATE ?auto_538 ) ( not ( = ?auto_538 ?auto_539 ) ) ( AVAILABLE ?auto_542 ) ( TRUCK-AT ?auto_541 ?auto_543 ) ( not ( = ?auto_543 ?auto_540 ) ) ( HOIST-AT ?auto_544 ?auto_543 ) ( LIFTING ?auto_544 ?auto_538 ) ( not ( = ?auto_542 ?auto_544 ) ) )
    :subtasks
    ( ( !LOAD ?auto_544 ?auto_538 ?auto_541 ?auto_543 )
      ( MAKE-ON ?auto_538 ?auto_539 )
      ( MAKE-ON-VERIFY ?auto_538 ?auto_539 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_545 - SURFACE
      ?auto_546 - SURFACE
    )
    :vars
    (
      ?auto_549 - HOIST
      ?auto_551 - PLACE
      ?auto_550 - TRUCK
      ?auto_547 - PLACE
      ?auto_548 - HOIST
      ?auto_552 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_549 ?auto_551 ) ( SURFACE-AT ?auto_546 ?auto_551 ) ( CLEAR ?auto_546 ) ( IS-CRATE ?auto_545 ) ( not ( = ?auto_545 ?auto_546 ) ) ( AVAILABLE ?auto_549 ) ( TRUCK-AT ?auto_550 ?auto_547 ) ( not ( = ?auto_547 ?auto_551 ) ) ( HOIST-AT ?auto_548 ?auto_547 ) ( not ( = ?auto_549 ?auto_548 ) ) ( AVAILABLE ?auto_548 ) ( SURFACE-AT ?auto_545 ?auto_547 ) ( ON ?auto_545 ?auto_552 ) ( CLEAR ?auto_545 ) ( not ( = ?auto_545 ?auto_552 ) ) ( not ( = ?auto_546 ?auto_552 ) ) )
    :subtasks
    ( ( !LIFT ?auto_548 ?auto_545 ?auto_552 ?auto_547 )
      ( MAKE-ON ?auto_545 ?auto_546 )
      ( MAKE-ON-VERIFY ?auto_545 ?auto_546 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_553 - SURFACE
      ?auto_554 - SURFACE
    )
    :vars
    (
      ?auto_556 - HOIST
      ?auto_560 - PLACE
      ?auto_558 - PLACE
      ?auto_557 - HOIST
      ?auto_555 - SURFACE
      ?auto_559 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556 ?auto_560 ) ( SURFACE-AT ?auto_554 ?auto_560 ) ( CLEAR ?auto_554 ) ( IS-CRATE ?auto_553 ) ( not ( = ?auto_553 ?auto_554 ) ) ( AVAILABLE ?auto_556 ) ( not ( = ?auto_558 ?auto_560 ) ) ( HOIST-AT ?auto_557 ?auto_558 ) ( not ( = ?auto_556 ?auto_557 ) ) ( AVAILABLE ?auto_557 ) ( SURFACE-AT ?auto_553 ?auto_558 ) ( ON ?auto_553 ?auto_555 ) ( CLEAR ?auto_553 ) ( not ( = ?auto_553 ?auto_555 ) ) ( not ( = ?auto_554 ?auto_555 ) ) ( TRUCK-AT ?auto_559 ?auto_560 ) )
    :subtasks
    ( ( !DRIVE ?auto_559 ?auto_560 ?auto_558 )
      ( MAKE-ON ?auto_553 ?auto_554 )
      ( MAKE-ON-VERIFY ?auto_553 ?auto_554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_601 - SURFACE
      ?auto_602 - SURFACE
    )
    :vars
    (
      ?auto_605 - HOIST
      ?auto_603 - PLACE
      ?auto_607 - PLACE
      ?auto_604 - HOIST
      ?auto_606 - SURFACE
      ?auto_608 - TRUCK
      ?auto_609 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_605 ?auto_603 ) ( IS-CRATE ?auto_601 ) ( not ( = ?auto_601 ?auto_602 ) ) ( not ( = ?auto_607 ?auto_603 ) ) ( HOIST-AT ?auto_604 ?auto_607 ) ( not ( = ?auto_605 ?auto_604 ) ) ( AVAILABLE ?auto_604 ) ( SURFACE-AT ?auto_601 ?auto_607 ) ( ON ?auto_601 ?auto_606 ) ( CLEAR ?auto_601 ) ( not ( = ?auto_601 ?auto_606 ) ) ( not ( = ?auto_602 ?auto_606 ) ) ( TRUCK-AT ?auto_608 ?auto_603 ) ( SURFACE-AT ?auto_609 ?auto_603 ) ( CLEAR ?auto_609 ) ( LIFTING ?auto_605 ?auto_602 ) ( IS-CRATE ?auto_602 ) ( not ( = ?auto_601 ?auto_609 ) ) ( not ( = ?auto_602 ?auto_609 ) ) ( not ( = ?auto_606 ?auto_609 ) ) )
    :subtasks
    ( ( !DROP ?auto_605 ?auto_602 ?auto_609 ?auto_603 )
      ( MAKE-ON ?auto_601 ?auto_602 )
      ( MAKE-ON-VERIFY ?auto_601 ?auto_602 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_610 - SURFACE
      ?auto_611 - SURFACE
    )
    :vars
    (
      ?auto_618 - HOIST
      ?auto_612 - PLACE
      ?auto_616 - PLACE
      ?auto_617 - HOIST
      ?auto_613 - SURFACE
      ?auto_615 - TRUCK
      ?auto_614 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_618 ?auto_612 ) ( IS-CRATE ?auto_610 ) ( not ( = ?auto_610 ?auto_611 ) ) ( not ( = ?auto_616 ?auto_612 ) ) ( HOIST-AT ?auto_617 ?auto_616 ) ( not ( = ?auto_618 ?auto_617 ) ) ( AVAILABLE ?auto_617 ) ( SURFACE-AT ?auto_610 ?auto_616 ) ( ON ?auto_610 ?auto_613 ) ( CLEAR ?auto_610 ) ( not ( = ?auto_610 ?auto_613 ) ) ( not ( = ?auto_611 ?auto_613 ) ) ( TRUCK-AT ?auto_615 ?auto_612 ) ( SURFACE-AT ?auto_614 ?auto_612 ) ( CLEAR ?auto_614 ) ( IS-CRATE ?auto_611 ) ( not ( = ?auto_610 ?auto_614 ) ) ( not ( = ?auto_611 ?auto_614 ) ) ( not ( = ?auto_613 ?auto_614 ) ) ( AVAILABLE ?auto_618 ) ( IN ?auto_611 ?auto_615 ) )
    :subtasks
    ( ( !UNLOAD ?auto_618 ?auto_611 ?auto_615 ?auto_612 )
      ( MAKE-ON ?auto_610 ?auto_611 )
      ( MAKE-ON-VERIFY ?auto_610 ?auto_611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_625 - SURFACE
      ?auto_626 - SURFACE
    )
    :vars
    (
      ?auto_630 - HOIST
      ?auto_631 - PLACE
      ?auto_632 - PLACE
      ?auto_629 - HOIST
      ?auto_628 - SURFACE
      ?auto_627 - TRUCK
      ?auto_633 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_630 ?auto_631 ) ( SURFACE-AT ?auto_626 ?auto_631 ) ( CLEAR ?auto_626 ) ( IS-CRATE ?auto_625 ) ( not ( = ?auto_625 ?auto_626 ) ) ( AVAILABLE ?auto_630 ) ( not ( = ?auto_632 ?auto_631 ) ) ( HOIST-AT ?auto_629 ?auto_632 ) ( not ( = ?auto_630 ?auto_629 ) ) ( AVAILABLE ?auto_629 ) ( SURFACE-AT ?auto_625 ?auto_632 ) ( ON ?auto_625 ?auto_628 ) ( CLEAR ?auto_625 ) ( not ( = ?auto_625 ?auto_628 ) ) ( not ( = ?auto_626 ?auto_628 ) ) ( TRUCK-AT ?auto_627 ?auto_633 ) ( not ( = ?auto_633 ?auto_631 ) ) ( not ( = ?auto_632 ?auto_633 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_627 ?auto_633 ?auto_631 )
      ( MAKE-ON ?auto_625 ?auto_626 )
      ( MAKE-ON-VERIFY ?auto_625 ?auto_626 ) )
  )

)

