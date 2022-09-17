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

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49495 - SURFACE
      ?auto_49496 - SURFACE
    )
    :vars
    (
      ?auto_49497 - HOIST
      ?auto_49498 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49497 ?auto_49498 ) ( SURFACE-AT ?auto_49495 ?auto_49498 ) ( CLEAR ?auto_49495 ) ( LIFTING ?auto_49497 ?auto_49496 ) ( IS-CRATE ?auto_49496 ) ( not ( = ?auto_49495 ?auto_49496 ) ) )
    :subtasks
    ( ( !DROP ?auto_49497 ?auto_49496 ?auto_49495 ?auto_49498 )
      ( MAKE-1CRATE-VERIFY ?auto_49495 ?auto_49496 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49499 - SURFACE
      ?auto_49500 - SURFACE
    )
    :vars
    (
      ?auto_49501 - HOIST
      ?auto_49502 - PLACE
      ?auto_49503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49501 ?auto_49502 ) ( SURFACE-AT ?auto_49499 ?auto_49502 ) ( CLEAR ?auto_49499 ) ( IS-CRATE ?auto_49500 ) ( not ( = ?auto_49499 ?auto_49500 ) ) ( TRUCK-AT ?auto_49503 ?auto_49502 ) ( AVAILABLE ?auto_49501 ) ( IN ?auto_49500 ?auto_49503 ) )
    :subtasks
    ( ( !UNLOAD ?auto_49501 ?auto_49500 ?auto_49503 ?auto_49502 )
      ( MAKE-1CRATE ?auto_49499 ?auto_49500 )
      ( MAKE-1CRATE-VERIFY ?auto_49499 ?auto_49500 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49504 - SURFACE
      ?auto_49505 - SURFACE
    )
    :vars
    (
      ?auto_49508 - HOIST
      ?auto_49506 - PLACE
      ?auto_49507 - TRUCK
      ?auto_49509 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49508 ?auto_49506 ) ( SURFACE-AT ?auto_49504 ?auto_49506 ) ( CLEAR ?auto_49504 ) ( IS-CRATE ?auto_49505 ) ( not ( = ?auto_49504 ?auto_49505 ) ) ( AVAILABLE ?auto_49508 ) ( IN ?auto_49505 ?auto_49507 ) ( TRUCK-AT ?auto_49507 ?auto_49509 ) ( not ( = ?auto_49509 ?auto_49506 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49507 ?auto_49509 ?auto_49506 )
      ( MAKE-1CRATE ?auto_49504 ?auto_49505 )
      ( MAKE-1CRATE-VERIFY ?auto_49504 ?auto_49505 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49510 - SURFACE
      ?auto_49511 - SURFACE
    )
    :vars
    (
      ?auto_49513 - HOIST
      ?auto_49515 - PLACE
      ?auto_49512 - TRUCK
      ?auto_49514 - PLACE
      ?auto_49516 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49513 ?auto_49515 ) ( SURFACE-AT ?auto_49510 ?auto_49515 ) ( CLEAR ?auto_49510 ) ( IS-CRATE ?auto_49511 ) ( not ( = ?auto_49510 ?auto_49511 ) ) ( AVAILABLE ?auto_49513 ) ( TRUCK-AT ?auto_49512 ?auto_49514 ) ( not ( = ?auto_49514 ?auto_49515 ) ) ( HOIST-AT ?auto_49516 ?auto_49514 ) ( LIFTING ?auto_49516 ?auto_49511 ) ( not ( = ?auto_49513 ?auto_49516 ) ) )
    :subtasks
    ( ( !LOAD ?auto_49516 ?auto_49511 ?auto_49512 ?auto_49514 )
      ( MAKE-1CRATE ?auto_49510 ?auto_49511 )
      ( MAKE-1CRATE-VERIFY ?auto_49510 ?auto_49511 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49517 - SURFACE
      ?auto_49518 - SURFACE
    )
    :vars
    (
      ?auto_49523 - HOIST
      ?auto_49522 - PLACE
      ?auto_49521 - TRUCK
      ?auto_49519 - PLACE
      ?auto_49520 - HOIST
      ?auto_49524 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49523 ?auto_49522 ) ( SURFACE-AT ?auto_49517 ?auto_49522 ) ( CLEAR ?auto_49517 ) ( IS-CRATE ?auto_49518 ) ( not ( = ?auto_49517 ?auto_49518 ) ) ( AVAILABLE ?auto_49523 ) ( TRUCK-AT ?auto_49521 ?auto_49519 ) ( not ( = ?auto_49519 ?auto_49522 ) ) ( HOIST-AT ?auto_49520 ?auto_49519 ) ( not ( = ?auto_49523 ?auto_49520 ) ) ( AVAILABLE ?auto_49520 ) ( SURFACE-AT ?auto_49518 ?auto_49519 ) ( ON ?auto_49518 ?auto_49524 ) ( CLEAR ?auto_49518 ) ( not ( = ?auto_49517 ?auto_49524 ) ) ( not ( = ?auto_49518 ?auto_49524 ) ) )
    :subtasks
    ( ( !LIFT ?auto_49520 ?auto_49518 ?auto_49524 ?auto_49519 )
      ( MAKE-1CRATE ?auto_49517 ?auto_49518 )
      ( MAKE-1CRATE-VERIFY ?auto_49517 ?auto_49518 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49525 - SURFACE
      ?auto_49526 - SURFACE
    )
    :vars
    (
      ?auto_49532 - HOIST
      ?auto_49527 - PLACE
      ?auto_49531 - PLACE
      ?auto_49528 - HOIST
      ?auto_49529 - SURFACE
      ?auto_49530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49532 ?auto_49527 ) ( SURFACE-AT ?auto_49525 ?auto_49527 ) ( CLEAR ?auto_49525 ) ( IS-CRATE ?auto_49526 ) ( not ( = ?auto_49525 ?auto_49526 ) ) ( AVAILABLE ?auto_49532 ) ( not ( = ?auto_49531 ?auto_49527 ) ) ( HOIST-AT ?auto_49528 ?auto_49531 ) ( not ( = ?auto_49532 ?auto_49528 ) ) ( AVAILABLE ?auto_49528 ) ( SURFACE-AT ?auto_49526 ?auto_49531 ) ( ON ?auto_49526 ?auto_49529 ) ( CLEAR ?auto_49526 ) ( not ( = ?auto_49525 ?auto_49529 ) ) ( not ( = ?auto_49526 ?auto_49529 ) ) ( TRUCK-AT ?auto_49530 ?auto_49527 ) )
    :subtasks
    ( ( !DRIVE ?auto_49530 ?auto_49527 ?auto_49531 )
      ( MAKE-1CRATE ?auto_49525 ?auto_49526 )
      ( MAKE-1CRATE-VERIFY ?auto_49525 ?auto_49526 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49542 - SURFACE
      ?auto_49543 - SURFACE
      ?auto_49544 - SURFACE
    )
    :vars
    (
      ?auto_49545 - HOIST
      ?auto_49546 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49545 ?auto_49546 ) ( SURFACE-AT ?auto_49543 ?auto_49546 ) ( CLEAR ?auto_49543 ) ( LIFTING ?auto_49545 ?auto_49544 ) ( IS-CRATE ?auto_49544 ) ( not ( = ?auto_49543 ?auto_49544 ) ) ( ON ?auto_49543 ?auto_49542 ) ( not ( = ?auto_49542 ?auto_49543 ) ) ( not ( = ?auto_49542 ?auto_49544 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49543 ?auto_49544 )
      ( MAKE-2CRATE-VERIFY ?auto_49542 ?auto_49543 ?auto_49544 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49552 - SURFACE
      ?auto_49553 - SURFACE
      ?auto_49554 - SURFACE
    )
    :vars
    (
      ?auto_49557 - HOIST
      ?auto_49556 - PLACE
      ?auto_49555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49557 ?auto_49556 ) ( SURFACE-AT ?auto_49553 ?auto_49556 ) ( CLEAR ?auto_49553 ) ( IS-CRATE ?auto_49554 ) ( not ( = ?auto_49553 ?auto_49554 ) ) ( TRUCK-AT ?auto_49555 ?auto_49556 ) ( AVAILABLE ?auto_49557 ) ( IN ?auto_49554 ?auto_49555 ) ( ON ?auto_49553 ?auto_49552 ) ( not ( = ?auto_49552 ?auto_49553 ) ) ( not ( = ?auto_49552 ?auto_49554 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49553 ?auto_49554 )
      ( MAKE-2CRATE-VERIFY ?auto_49552 ?auto_49553 ?auto_49554 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49558 - SURFACE
      ?auto_49559 - SURFACE
    )
    :vars
    (
      ?auto_49563 - HOIST
      ?auto_49560 - PLACE
      ?auto_49562 - TRUCK
      ?auto_49561 - SURFACE
      ?auto_49564 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49563 ?auto_49560 ) ( SURFACE-AT ?auto_49558 ?auto_49560 ) ( CLEAR ?auto_49558 ) ( IS-CRATE ?auto_49559 ) ( not ( = ?auto_49558 ?auto_49559 ) ) ( AVAILABLE ?auto_49563 ) ( IN ?auto_49559 ?auto_49562 ) ( ON ?auto_49558 ?auto_49561 ) ( not ( = ?auto_49561 ?auto_49558 ) ) ( not ( = ?auto_49561 ?auto_49559 ) ) ( TRUCK-AT ?auto_49562 ?auto_49564 ) ( not ( = ?auto_49564 ?auto_49560 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49562 ?auto_49564 ?auto_49560 )
      ( MAKE-2CRATE ?auto_49561 ?auto_49558 ?auto_49559 )
      ( MAKE-1CRATE-VERIFY ?auto_49558 ?auto_49559 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49565 - SURFACE
      ?auto_49566 - SURFACE
      ?auto_49567 - SURFACE
    )
    :vars
    (
      ?auto_49571 - HOIST
      ?auto_49570 - PLACE
      ?auto_49568 - TRUCK
      ?auto_49569 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49571 ?auto_49570 ) ( SURFACE-AT ?auto_49566 ?auto_49570 ) ( CLEAR ?auto_49566 ) ( IS-CRATE ?auto_49567 ) ( not ( = ?auto_49566 ?auto_49567 ) ) ( AVAILABLE ?auto_49571 ) ( IN ?auto_49567 ?auto_49568 ) ( ON ?auto_49566 ?auto_49565 ) ( not ( = ?auto_49565 ?auto_49566 ) ) ( not ( = ?auto_49565 ?auto_49567 ) ) ( TRUCK-AT ?auto_49568 ?auto_49569 ) ( not ( = ?auto_49569 ?auto_49570 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49566 ?auto_49567 )
      ( MAKE-2CRATE-VERIFY ?auto_49565 ?auto_49566 ?auto_49567 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49572 - SURFACE
      ?auto_49573 - SURFACE
    )
    :vars
    (
      ?auto_49577 - HOIST
      ?auto_49575 - PLACE
      ?auto_49578 - SURFACE
      ?auto_49574 - TRUCK
      ?auto_49576 - PLACE
      ?auto_49579 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49577 ?auto_49575 ) ( SURFACE-AT ?auto_49572 ?auto_49575 ) ( CLEAR ?auto_49572 ) ( IS-CRATE ?auto_49573 ) ( not ( = ?auto_49572 ?auto_49573 ) ) ( AVAILABLE ?auto_49577 ) ( ON ?auto_49572 ?auto_49578 ) ( not ( = ?auto_49578 ?auto_49572 ) ) ( not ( = ?auto_49578 ?auto_49573 ) ) ( TRUCK-AT ?auto_49574 ?auto_49576 ) ( not ( = ?auto_49576 ?auto_49575 ) ) ( HOIST-AT ?auto_49579 ?auto_49576 ) ( LIFTING ?auto_49579 ?auto_49573 ) ( not ( = ?auto_49577 ?auto_49579 ) ) )
    :subtasks
    ( ( !LOAD ?auto_49579 ?auto_49573 ?auto_49574 ?auto_49576 )
      ( MAKE-2CRATE ?auto_49578 ?auto_49572 ?auto_49573 )
      ( MAKE-1CRATE-VERIFY ?auto_49572 ?auto_49573 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49580 - SURFACE
      ?auto_49581 - SURFACE
      ?auto_49582 - SURFACE
    )
    :vars
    (
      ?auto_49586 - HOIST
      ?auto_49584 - PLACE
      ?auto_49583 - TRUCK
      ?auto_49585 - PLACE
      ?auto_49587 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49586 ?auto_49584 ) ( SURFACE-AT ?auto_49581 ?auto_49584 ) ( CLEAR ?auto_49581 ) ( IS-CRATE ?auto_49582 ) ( not ( = ?auto_49581 ?auto_49582 ) ) ( AVAILABLE ?auto_49586 ) ( ON ?auto_49581 ?auto_49580 ) ( not ( = ?auto_49580 ?auto_49581 ) ) ( not ( = ?auto_49580 ?auto_49582 ) ) ( TRUCK-AT ?auto_49583 ?auto_49585 ) ( not ( = ?auto_49585 ?auto_49584 ) ) ( HOIST-AT ?auto_49587 ?auto_49585 ) ( LIFTING ?auto_49587 ?auto_49582 ) ( not ( = ?auto_49586 ?auto_49587 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49581 ?auto_49582 )
      ( MAKE-2CRATE-VERIFY ?auto_49580 ?auto_49581 ?auto_49582 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49588 - SURFACE
      ?auto_49589 - SURFACE
    )
    :vars
    (
      ?auto_49592 - HOIST
      ?auto_49590 - PLACE
      ?auto_49591 - SURFACE
      ?auto_49595 - TRUCK
      ?auto_49594 - PLACE
      ?auto_49593 - HOIST
      ?auto_49596 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49592 ?auto_49590 ) ( SURFACE-AT ?auto_49588 ?auto_49590 ) ( CLEAR ?auto_49588 ) ( IS-CRATE ?auto_49589 ) ( not ( = ?auto_49588 ?auto_49589 ) ) ( AVAILABLE ?auto_49592 ) ( ON ?auto_49588 ?auto_49591 ) ( not ( = ?auto_49591 ?auto_49588 ) ) ( not ( = ?auto_49591 ?auto_49589 ) ) ( TRUCK-AT ?auto_49595 ?auto_49594 ) ( not ( = ?auto_49594 ?auto_49590 ) ) ( HOIST-AT ?auto_49593 ?auto_49594 ) ( not ( = ?auto_49592 ?auto_49593 ) ) ( AVAILABLE ?auto_49593 ) ( SURFACE-AT ?auto_49589 ?auto_49594 ) ( ON ?auto_49589 ?auto_49596 ) ( CLEAR ?auto_49589 ) ( not ( = ?auto_49588 ?auto_49596 ) ) ( not ( = ?auto_49589 ?auto_49596 ) ) ( not ( = ?auto_49591 ?auto_49596 ) ) )
    :subtasks
    ( ( !LIFT ?auto_49593 ?auto_49589 ?auto_49596 ?auto_49594 )
      ( MAKE-2CRATE ?auto_49591 ?auto_49588 ?auto_49589 )
      ( MAKE-1CRATE-VERIFY ?auto_49588 ?auto_49589 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49597 - SURFACE
      ?auto_49598 - SURFACE
      ?auto_49599 - SURFACE
    )
    :vars
    (
      ?auto_49605 - HOIST
      ?auto_49601 - PLACE
      ?auto_49600 - TRUCK
      ?auto_49604 - PLACE
      ?auto_49602 - HOIST
      ?auto_49603 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49605 ?auto_49601 ) ( SURFACE-AT ?auto_49598 ?auto_49601 ) ( CLEAR ?auto_49598 ) ( IS-CRATE ?auto_49599 ) ( not ( = ?auto_49598 ?auto_49599 ) ) ( AVAILABLE ?auto_49605 ) ( ON ?auto_49598 ?auto_49597 ) ( not ( = ?auto_49597 ?auto_49598 ) ) ( not ( = ?auto_49597 ?auto_49599 ) ) ( TRUCK-AT ?auto_49600 ?auto_49604 ) ( not ( = ?auto_49604 ?auto_49601 ) ) ( HOIST-AT ?auto_49602 ?auto_49604 ) ( not ( = ?auto_49605 ?auto_49602 ) ) ( AVAILABLE ?auto_49602 ) ( SURFACE-AT ?auto_49599 ?auto_49604 ) ( ON ?auto_49599 ?auto_49603 ) ( CLEAR ?auto_49599 ) ( not ( = ?auto_49598 ?auto_49603 ) ) ( not ( = ?auto_49599 ?auto_49603 ) ) ( not ( = ?auto_49597 ?auto_49603 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49598 ?auto_49599 )
      ( MAKE-2CRATE-VERIFY ?auto_49597 ?auto_49598 ?auto_49599 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49606 - SURFACE
      ?auto_49607 - SURFACE
    )
    :vars
    (
      ?auto_49612 - HOIST
      ?auto_49610 - PLACE
      ?auto_49609 - SURFACE
      ?auto_49614 - PLACE
      ?auto_49613 - HOIST
      ?auto_49608 - SURFACE
      ?auto_49611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49612 ?auto_49610 ) ( SURFACE-AT ?auto_49606 ?auto_49610 ) ( CLEAR ?auto_49606 ) ( IS-CRATE ?auto_49607 ) ( not ( = ?auto_49606 ?auto_49607 ) ) ( AVAILABLE ?auto_49612 ) ( ON ?auto_49606 ?auto_49609 ) ( not ( = ?auto_49609 ?auto_49606 ) ) ( not ( = ?auto_49609 ?auto_49607 ) ) ( not ( = ?auto_49614 ?auto_49610 ) ) ( HOIST-AT ?auto_49613 ?auto_49614 ) ( not ( = ?auto_49612 ?auto_49613 ) ) ( AVAILABLE ?auto_49613 ) ( SURFACE-AT ?auto_49607 ?auto_49614 ) ( ON ?auto_49607 ?auto_49608 ) ( CLEAR ?auto_49607 ) ( not ( = ?auto_49606 ?auto_49608 ) ) ( not ( = ?auto_49607 ?auto_49608 ) ) ( not ( = ?auto_49609 ?auto_49608 ) ) ( TRUCK-AT ?auto_49611 ?auto_49610 ) )
    :subtasks
    ( ( !DRIVE ?auto_49611 ?auto_49610 ?auto_49614 )
      ( MAKE-2CRATE ?auto_49609 ?auto_49606 ?auto_49607 )
      ( MAKE-1CRATE-VERIFY ?auto_49606 ?auto_49607 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49615 - SURFACE
      ?auto_49616 - SURFACE
      ?auto_49617 - SURFACE
    )
    :vars
    (
      ?auto_49621 - HOIST
      ?auto_49618 - PLACE
      ?auto_49623 - PLACE
      ?auto_49620 - HOIST
      ?auto_49619 - SURFACE
      ?auto_49622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49621 ?auto_49618 ) ( SURFACE-AT ?auto_49616 ?auto_49618 ) ( CLEAR ?auto_49616 ) ( IS-CRATE ?auto_49617 ) ( not ( = ?auto_49616 ?auto_49617 ) ) ( AVAILABLE ?auto_49621 ) ( ON ?auto_49616 ?auto_49615 ) ( not ( = ?auto_49615 ?auto_49616 ) ) ( not ( = ?auto_49615 ?auto_49617 ) ) ( not ( = ?auto_49623 ?auto_49618 ) ) ( HOIST-AT ?auto_49620 ?auto_49623 ) ( not ( = ?auto_49621 ?auto_49620 ) ) ( AVAILABLE ?auto_49620 ) ( SURFACE-AT ?auto_49617 ?auto_49623 ) ( ON ?auto_49617 ?auto_49619 ) ( CLEAR ?auto_49617 ) ( not ( = ?auto_49616 ?auto_49619 ) ) ( not ( = ?auto_49617 ?auto_49619 ) ) ( not ( = ?auto_49615 ?auto_49619 ) ) ( TRUCK-AT ?auto_49622 ?auto_49618 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49616 ?auto_49617 )
      ( MAKE-2CRATE-VERIFY ?auto_49615 ?auto_49616 ?auto_49617 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49624 - SURFACE
      ?auto_49625 - SURFACE
    )
    :vars
    (
      ?auto_49628 - HOIST
      ?auto_49627 - PLACE
      ?auto_49629 - SURFACE
      ?auto_49631 - PLACE
      ?auto_49626 - HOIST
      ?auto_49632 - SURFACE
      ?auto_49630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49628 ?auto_49627 ) ( IS-CRATE ?auto_49625 ) ( not ( = ?auto_49624 ?auto_49625 ) ) ( not ( = ?auto_49629 ?auto_49624 ) ) ( not ( = ?auto_49629 ?auto_49625 ) ) ( not ( = ?auto_49631 ?auto_49627 ) ) ( HOIST-AT ?auto_49626 ?auto_49631 ) ( not ( = ?auto_49628 ?auto_49626 ) ) ( AVAILABLE ?auto_49626 ) ( SURFACE-AT ?auto_49625 ?auto_49631 ) ( ON ?auto_49625 ?auto_49632 ) ( CLEAR ?auto_49625 ) ( not ( = ?auto_49624 ?auto_49632 ) ) ( not ( = ?auto_49625 ?auto_49632 ) ) ( not ( = ?auto_49629 ?auto_49632 ) ) ( TRUCK-AT ?auto_49630 ?auto_49627 ) ( SURFACE-AT ?auto_49629 ?auto_49627 ) ( CLEAR ?auto_49629 ) ( LIFTING ?auto_49628 ?auto_49624 ) ( IS-CRATE ?auto_49624 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49629 ?auto_49624 )
      ( MAKE-2CRATE ?auto_49629 ?auto_49624 ?auto_49625 )
      ( MAKE-1CRATE-VERIFY ?auto_49624 ?auto_49625 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49633 - SURFACE
      ?auto_49634 - SURFACE
      ?auto_49635 - SURFACE
    )
    :vars
    (
      ?auto_49639 - HOIST
      ?auto_49637 - PLACE
      ?auto_49640 - PLACE
      ?auto_49641 - HOIST
      ?auto_49638 - SURFACE
      ?auto_49636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49639 ?auto_49637 ) ( IS-CRATE ?auto_49635 ) ( not ( = ?auto_49634 ?auto_49635 ) ) ( not ( = ?auto_49633 ?auto_49634 ) ) ( not ( = ?auto_49633 ?auto_49635 ) ) ( not ( = ?auto_49640 ?auto_49637 ) ) ( HOIST-AT ?auto_49641 ?auto_49640 ) ( not ( = ?auto_49639 ?auto_49641 ) ) ( AVAILABLE ?auto_49641 ) ( SURFACE-AT ?auto_49635 ?auto_49640 ) ( ON ?auto_49635 ?auto_49638 ) ( CLEAR ?auto_49635 ) ( not ( = ?auto_49634 ?auto_49638 ) ) ( not ( = ?auto_49635 ?auto_49638 ) ) ( not ( = ?auto_49633 ?auto_49638 ) ) ( TRUCK-AT ?auto_49636 ?auto_49637 ) ( SURFACE-AT ?auto_49633 ?auto_49637 ) ( CLEAR ?auto_49633 ) ( LIFTING ?auto_49639 ?auto_49634 ) ( IS-CRATE ?auto_49634 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49634 ?auto_49635 )
      ( MAKE-2CRATE-VERIFY ?auto_49633 ?auto_49634 ?auto_49635 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49642 - SURFACE
      ?auto_49643 - SURFACE
    )
    :vars
    (
      ?auto_49650 - HOIST
      ?auto_49649 - PLACE
      ?auto_49644 - SURFACE
      ?auto_49645 - PLACE
      ?auto_49646 - HOIST
      ?auto_49648 - SURFACE
      ?auto_49647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49650 ?auto_49649 ) ( IS-CRATE ?auto_49643 ) ( not ( = ?auto_49642 ?auto_49643 ) ) ( not ( = ?auto_49644 ?auto_49642 ) ) ( not ( = ?auto_49644 ?auto_49643 ) ) ( not ( = ?auto_49645 ?auto_49649 ) ) ( HOIST-AT ?auto_49646 ?auto_49645 ) ( not ( = ?auto_49650 ?auto_49646 ) ) ( AVAILABLE ?auto_49646 ) ( SURFACE-AT ?auto_49643 ?auto_49645 ) ( ON ?auto_49643 ?auto_49648 ) ( CLEAR ?auto_49643 ) ( not ( = ?auto_49642 ?auto_49648 ) ) ( not ( = ?auto_49643 ?auto_49648 ) ) ( not ( = ?auto_49644 ?auto_49648 ) ) ( TRUCK-AT ?auto_49647 ?auto_49649 ) ( SURFACE-AT ?auto_49644 ?auto_49649 ) ( CLEAR ?auto_49644 ) ( IS-CRATE ?auto_49642 ) ( AVAILABLE ?auto_49650 ) ( IN ?auto_49642 ?auto_49647 ) )
    :subtasks
    ( ( !UNLOAD ?auto_49650 ?auto_49642 ?auto_49647 ?auto_49649 )
      ( MAKE-2CRATE ?auto_49644 ?auto_49642 ?auto_49643 )
      ( MAKE-1CRATE-VERIFY ?auto_49642 ?auto_49643 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49651 - SURFACE
      ?auto_49652 - SURFACE
      ?auto_49653 - SURFACE
    )
    :vars
    (
      ?auto_49659 - HOIST
      ?auto_49654 - PLACE
      ?auto_49657 - PLACE
      ?auto_49656 - HOIST
      ?auto_49658 - SURFACE
      ?auto_49655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49659 ?auto_49654 ) ( IS-CRATE ?auto_49653 ) ( not ( = ?auto_49652 ?auto_49653 ) ) ( not ( = ?auto_49651 ?auto_49652 ) ) ( not ( = ?auto_49651 ?auto_49653 ) ) ( not ( = ?auto_49657 ?auto_49654 ) ) ( HOIST-AT ?auto_49656 ?auto_49657 ) ( not ( = ?auto_49659 ?auto_49656 ) ) ( AVAILABLE ?auto_49656 ) ( SURFACE-AT ?auto_49653 ?auto_49657 ) ( ON ?auto_49653 ?auto_49658 ) ( CLEAR ?auto_49653 ) ( not ( = ?auto_49652 ?auto_49658 ) ) ( not ( = ?auto_49653 ?auto_49658 ) ) ( not ( = ?auto_49651 ?auto_49658 ) ) ( TRUCK-AT ?auto_49655 ?auto_49654 ) ( SURFACE-AT ?auto_49651 ?auto_49654 ) ( CLEAR ?auto_49651 ) ( IS-CRATE ?auto_49652 ) ( AVAILABLE ?auto_49659 ) ( IN ?auto_49652 ?auto_49655 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49652 ?auto_49653 )
      ( MAKE-2CRATE-VERIFY ?auto_49651 ?auto_49652 ?auto_49653 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49696 - SURFACE
      ?auto_49697 - SURFACE
    )
    :vars
    (
      ?auto_49698 - HOIST
      ?auto_49703 - PLACE
      ?auto_49701 - SURFACE
      ?auto_49704 - PLACE
      ?auto_49699 - HOIST
      ?auto_49700 - SURFACE
      ?auto_49702 - TRUCK
      ?auto_49705 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49698 ?auto_49703 ) ( SURFACE-AT ?auto_49696 ?auto_49703 ) ( CLEAR ?auto_49696 ) ( IS-CRATE ?auto_49697 ) ( not ( = ?auto_49696 ?auto_49697 ) ) ( AVAILABLE ?auto_49698 ) ( ON ?auto_49696 ?auto_49701 ) ( not ( = ?auto_49701 ?auto_49696 ) ) ( not ( = ?auto_49701 ?auto_49697 ) ) ( not ( = ?auto_49704 ?auto_49703 ) ) ( HOIST-AT ?auto_49699 ?auto_49704 ) ( not ( = ?auto_49698 ?auto_49699 ) ) ( AVAILABLE ?auto_49699 ) ( SURFACE-AT ?auto_49697 ?auto_49704 ) ( ON ?auto_49697 ?auto_49700 ) ( CLEAR ?auto_49697 ) ( not ( = ?auto_49696 ?auto_49700 ) ) ( not ( = ?auto_49697 ?auto_49700 ) ) ( not ( = ?auto_49701 ?auto_49700 ) ) ( TRUCK-AT ?auto_49702 ?auto_49705 ) ( not ( = ?auto_49705 ?auto_49703 ) ) ( not ( = ?auto_49704 ?auto_49705 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49702 ?auto_49705 ?auto_49703 )
      ( MAKE-1CRATE ?auto_49696 ?auto_49697 )
      ( MAKE-1CRATE-VERIFY ?auto_49696 ?auto_49697 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49736 - SURFACE
      ?auto_49737 - SURFACE
      ?auto_49738 - SURFACE
      ?auto_49735 - SURFACE
    )
    :vars
    (
      ?auto_49739 - HOIST
      ?auto_49740 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49739 ?auto_49740 ) ( SURFACE-AT ?auto_49738 ?auto_49740 ) ( CLEAR ?auto_49738 ) ( LIFTING ?auto_49739 ?auto_49735 ) ( IS-CRATE ?auto_49735 ) ( not ( = ?auto_49738 ?auto_49735 ) ) ( ON ?auto_49737 ?auto_49736 ) ( ON ?auto_49738 ?auto_49737 ) ( not ( = ?auto_49736 ?auto_49737 ) ) ( not ( = ?auto_49736 ?auto_49738 ) ) ( not ( = ?auto_49736 ?auto_49735 ) ) ( not ( = ?auto_49737 ?auto_49738 ) ) ( not ( = ?auto_49737 ?auto_49735 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49738 ?auto_49735 )
      ( MAKE-3CRATE-VERIFY ?auto_49736 ?auto_49737 ?auto_49738 ?auto_49735 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49753 - SURFACE
      ?auto_49754 - SURFACE
      ?auto_49755 - SURFACE
      ?auto_49752 - SURFACE
    )
    :vars
    (
      ?auto_49757 - HOIST
      ?auto_49758 - PLACE
      ?auto_49756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49757 ?auto_49758 ) ( SURFACE-AT ?auto_49755 ?auto_49758 ) ( CLEAR ?auto_49755 ) ( IS-CRATE ?auto_49752 ) ( not ( = ?auto_49755 ?auto_49752 ) ) ( TRUCK-AT ?auto_49756 ?auto_49758 ) ( AVAILABLE ?auto_49757 ) ( IN ?auto_49752 ?auto_49756 ) ( ON ?auto_49755 ?auto_49754 ) ( not ( = ?auto_49754 ?auto_49755 ) ) ( not ( = ?auto_49754 ?auto_49752 ) ) ( ON ?auto_49754 ?auto_49753 ) ( not ( = ?auto_49753 ?auto_49754 ) ) ( not ( = ?auto_49753 ?auto_49755 ) ) ( not ( = ?auto_49753 ?auto_49752 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49754 ?auto_49755 ?auto_49752 )
      ( MAKE-3CRATE-VERIFY ?auto_49753 ?auto_49754 ?auto_49755 ?auto_49752 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49774 - SURFACE
      ?auto_49775 - SURFACE
      ?auto_49776 - SURFACE
      ?auto_49773 - SURFACE
    )
    :vars
    (
      ?auto_49779 - HOIST
      ?auto_49780 - PLACE
      ?auto_49777 - TRUCK
      ?auto_49778 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49779 ?auto_49780 ) ( SURFACE-AT ?auto_49776 ?auto_49780 ) ( CLEAR ?auto_49776 ) ( IS-CRATE ?auto_49773 ) ( not ( = ?auto_49776 ?auto_49773 ) ) ( AVAILABLE ?auto_49779 ) ( IN ?auto_49773 ?auto_49777 ) ( ON ?auto_49776 ?auto_49775 ) ( not ( = ?auto_49775 ?auto_49776 ) ) ( not ( = ?auto_49775 ?auto_49773 ) ) ( TRUCK-AT ?auto_49777 ?auto_49778 ) ( not ( = ?auto_49778 ?auto_49780 ) ) ( ON ?auto_49775 ?auto_49774 ) ( not ( = ?auto_49774 ?auto_49775 ) ) ( not ( = ?auto_49774 ?auto_49776 ) ) ( not ( = ?auto_49774 ?auto_49773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49775 ?auto_49776 ?auto_49773 )
      ( MAKE-3CRATE-VERIFY ?auto_49774 ?auto_49775 ?auto_49776 ?auto_49773 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49798 - SURFACE
      ?auto_49799 - SURFACE
      ?auto_49800 - SURFACE
      ?auto_49797 - SURFACE
    )
    :vars
    (
      ?auto_49803 - HOIST
      ?auto_49804 - PLACE
      ?auto_49801 - TRUCK
      ?auto_49802 - PLACE
      ?auto_49805 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49803 ?auto_49804 ) ( SURFACE-AT ?auto_49800 ?auto_49804 ) ( CLEAR ?auto_49800 ) ( IS-CRATE ?auto_49797 ) ( not ( = ?auto_49800 ?auto_49797 ) ) ( AVAILABLE ?auto_49803 ) ( ON ?auto_49800 ?auto_49799 ) ( not ( = ?auto_49799 ?auto_49800 ) ) ( not ( = ?auto_49799 ?auto_49797 ) ) ( TRUCK-AT ?auto_49801 ?auto_49802 ) ( not ( = ?auto_49802 ?auto_49804 ) ) ( HOIST-AT ?auto_49805 ?auto_49802 ) ( LIFTING ?auto_49805 ?auto_49797 ) ( not ( = ?auto_49803 ?auto_49805 ) ) ( ON ?auto_49799 ?auto_49798 ) ( not ( = ?auto_49798 ?auto_49799 ) ) ( not ( = ?auto_49798 ?auto_49800 ) ) ( not ( = ?auto_49798 ?auto_49797 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49799 ?auto_49800 ?auto_49797 )
      ( MAKE-3CRATE-VERIFY ?auto_49798 ?auto_49799 ?auto_49800 ?auto_49797 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49825 - SURFACE
      ?auto_49826 - SURFACE
      ?auto_49827 - SURFACE
      ?auto_49824 - SURFACE
    )
    :vars
    (
      ?auto_49830 - HOIST
      ?auto_49829 - PLACE
      ?auto_49831 - TRUCK
      ?auto_49828 - PLACE
      ?auto_49833 - HOIST
      ?auto_49832 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49830 ?auto_49829 ) ( SURFACE-AT ?auto_49827 ?auto_49829 ) ( CLEAR ?auto_49827 ) ( IS-CRATE ?auto_49824 ) ( not ( = ?auto_49827 ?auto_49824 ) ) ( AVAILABLE ?auto_49830 ) ( ON ?auto_49827 ?auto_49826 ) ( not ( = ?auto_49826 ?auto_49827 ) ) ( not ( = ?auto_49826 ?auto_49824 ) ) ( TRUCK-AT ?auto_49831 ?auto_49828 ) ( not ( = ?auto_49828 ?auto_49829 ) ) ( HOIST-AT ?auto_49833 ?auto_49828 ) ( not ( = ?auto_49830 ?auto_49833 ) ) ( AVAILABLE ?auto_49833 ) ( SURFACE-AT ?auto_49824 ?auto_49828 ) ( ON ?auto_49824 ?auto_49832 ) ( CLEAR ?auto_49824 ) ( not ( = ?auto_49827 ?auto_49832 ) ) ( not ( = ?auto_49824 ?auto_49832 ) ) ( not ( = ?auto_49826 ?auto_49832 ) ) ( ON ?auto_49826 ?auto_49825 ) ( not ( = ?auto_49825 ?auto_49826 ) ) ( not ( = ?auto_49825 ?auto_49827 ) ) ( not ( = ?auto_49825 ?auto_49824 ) ) ( not ( = ?auto_49825 ?auto_49832 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49826 ?auto_49827 ?auto_49824 )
      ( MAKE-3CRATE-VERIFY ?auto_49825 ?auto_49826 ?auto_49827 ?auto_49824 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49853 - SURFACE
      ?auto_49854 - SURFACE
      ?auto_49855 - SURFACE
      ?auto_49852 - SURFACE
    )
    :vars
    (
      ?auto_49857 - HOIST
      ?auto_49856 - PLACE
      ?auto_49861 - PLACE
      ?auto_49858 - HOIST
      ?auto_49859 - SURFACE
      ?auto_49860 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49857 ?auto_49856 ) ( SURFACE-AT ?auto_49855 ?auto_49856 ) ( CLEAR ?auto_49855 ) ( IS-CRATE ?auto_49852 ) ( not ( = ?auto_49855 ?auto_49852 ) ) ( AVAILABLE ?auto_49857 ) ( ON ?auto_49855 ?auto_49854 ) ( not ( = ?auto_49854 ?auto_49855 ) ) ( not ( = ?auto_49854 ?auto_49852 ) ) ( not ( = ?auto_49861 ?auto_49856 ) ) ( HOIST-AT ?auto_49858 ?auto_49861 ) ( not ( = ?auto_49857 ?auto_49858 ) ) ( AVAILABLE ?auto_49858 ) ( SURFACE-AT ?auto_49852 ?auto_49861 ) ( ON ?auto_49852 ?auto_49859 ) ( CLEAR ?auto_49852 ) ( not ( = ?auto_49855 ?auto_49859 ) ) ( not ( = ?auto_49852 ?auto_49859 ) ) ( not ( = ?auto_49854 ?auto_49859 ) ) ( TRUCK-AT ?auto_49860 ?auto_49856 ) ( ON ?auto_49854 ?auto_49853 ) ( not ( = ?auto_49853 ?auto_49854 ) ) ( not ( = ?auto_49853 ?auto_49855 ) ) ( not ( = ?auto_49853 ?auto_49852 ) ) ( not ( = ?auto_49853 ?auto_49859 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49854 ?auto_49855 ?auto_49852 )
      ( MAKE-3CRATE-VERIFY ?auto_49853 ?auto_49854 ?auto_49855 ?auto_49852 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49881 - SURFACE
      ?auto_49882 - SURFACE
      ?auto_49883 - SURFACE
      ?auto_49880 - SURFACE
    )
    :vars
    (
      ?auto_49887 - HOIST
      ?auto_49885 - PLACE
      ?auto_49886 - PLACE
      ?auto_49884 - HOIST
      ?auto_49888 - SURFACE
      ?auto_49889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49887 ?auto_49885 ) ( IS-CRATE ?auto_49880 ) ( not ( = ?auto_49883 ?auto_49880 ) ) ( not ( = ?auto_49882 ?auto_49883 ) ) ( not ( = ?auto_49882 ?auto_49880 ) ) ( not ( = ?auto_49886 ?auto_49885 ) ) ( HOIST-AT ?auto_49884 ?auto_49886 ) ( not ( = ?auto_49887 ?auto_49884 ) ) ( AVAILABLE ?auto_49884 ) ( SURFACE-AT ?auto_49880 ?auto_49886 ) ( ON ?auto_49880 ?auto_49888 ) ( CLEAR ?auto_49880 ) ( not ( = ?auto_49883 ?auto_49888 ) ) ( not ( = ?auto_49880 ?auto_49888 ) ) ( not ( = ?auto_49882 ?auto_49888 ) ) ( TRUCK-AT ?auto_49889 ?auto_49885 ) ( SURFACE-AT ?auto_49882 ?auto_49885 ) ( CLEAR ?auto_49882 ) ( LIFTING ?auto_49887 ?auto_49883 ) ( IS-CRATE ?auto_49883 ) ( ON ?auto_49882 ?auto_49881 ) ( not ( = ?auto_49881 ?auto_49882 ) ) ( not ( = ?auto_49881 ?auto_49883 ) ) ( not ( = ?auto_49881 ?auto_49880 ) ) ( not ( = ?auto_49881 ?auto_49888 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49882 ?auto_49883 ?auto_49880 )
      ( MAKE-3CRATE-VERIFY ?auto_49881 ?auto_49882 ?auto_49883 ?auto_49880 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49909 - SURFACE
      ?auto_49910 - SURFACE
      ?auto_49911 - SURFACE
      ?auto_49908 - SURFACE
    )
    :vars
    (
      ?auto_49913 - HOIST
      ?auto_49915 - PLACE
      ?auto_49912 - PLACE
      ?auto_49917 - HOIST
      ?auto_49914 - SURFACE
      ?auto_49916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49913 ?auto_49915 ) ( IS-CRATE ?auto_49908 ) ( not ( = ?auto_49911 ?auto_49908 ) ) ( not ( = ?auto_49910 ?auto_49911 ) ) ( not ( = ?auto_49910 ?auto_49908 ) ) ( not ( = ?auto_49912 ?auto_49915 ) ) ( HOIST-AT ?auto_49917 ?auto_49912 ) ( not ( = ?auto_49913 ?auto_49917 ) ) ( AVAILABLE ?auto_49917 ) ( SURFACE-AT ?auto_49908 ?auto_49912 ) ( ON ?auto_49908 ?auto_49914 ) ( CLEAR ?auto_49908 ) ( not ( = ?auto_49911 ?auto_49914 ) ) ( not ( = ?auto_49908 ?auto_49914 ) ) ( not ( = ?auto_49910 ?auto_49914 ) ) ( TRUCK-AT ?auto_49916 ?auto_49915 ) ( SURFACE-AT ?auto_49910 ?auto_49915 ) ( CLEAR ?auto_49910 ) ( IS-CRATE ?auto_49911 ) ( AVAILABLE ?auto_49913 ) ( IN ?auto_49911 ?auto_49916 ) ( ON ?auto_49910 ?auto_49909 ) ( not ( = ?auto_49909 ?auto_49910 ) ) ( not ( = ?auto_49909 ?auto_49911 ) ) ( not ( = ?auto_49909 ?auto_49908 ) ) ( not ( = ?auto_49909 ?auto_49914 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49910 ?auto_49911 ?auto_49908 )
      ( MAKE-3CRATE-VERIFY ?auto_49909 ?auto_49910 ?auto_49911 ?auto_49908 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_50093 - SURFACE
      ?auto_50094 - SURFACE
    )
    :vars
    (
      ?auto_50099 - HOIST
      ?auto_50097 - PLACE
      ?auto_50100 - SURFACE
      ?auto_50098 - TRUCK
      ?auto_50101 - PLACE
      ?auto_50096 - HOIST
      ?auto_50095 - SURFACE
      ?auto_50102 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50099 ?auto_50097 ) ( SURFACE-AT ?auto_50093 ?auto_50097 ) ( CLEAR ?auto_50093 ) ( IS-CRATE ?auto_50094 ) ( not ( = ?auto_50093 ?auto_50094 ) ) ( AVAILABLE ?auto_50099 ) ( ON ?auto_50093 ?auto_50100 ) ( not ( = ?auto_50100 ?auto_50093 ) ) ( not ( = ?auto_50100 ?auto_50094 ) ) ( TRUCK-AT ?auto_50098 ?auto_50101 ) ( not ( = ?auto_50101 ?auto_50097 ) ) ( HOIST-AT ?auto_50096 ?auto_50101 ) ( not ( = ?auto_50099 ?auto_50096 ) ) ( SURFACE-AT ?auto_50094 ?auto_50101 ) ( ON ?auto_50094 ?auto_50095 ) ( CLEAR ?auto_50094 ) ( not ( = ?auto_50093 ?auto_50095 ) ) ( not ( = ?auto_50094 ?auto_50095 ) ) ( not ( = ?auto_50100 ?auto_50095 ) ) ( LIFTING ?auto_50096 ?auto_50102 ) ( IS-CRATE ?auto_50102 ) ( not ( = ?auto_50093 ?auto_50102 ) ) ( not ( = ?auto_50094 ?auto_50102 ) ) ( not ( = ?auto_50100 ?auto_50102 ) ) ( not ( = ?auto_50095 ?auto_50102 ) ) )
    :subtasks
    ( ( !LOAD ?auto_50096 ?auto_50102 ?auto_50098 ?auto_50101 )
      ( MAKE-1CRATE ?auto_50093 ?auto_50094 )
      ( MAKE-1CRATE-VERIFY ?auto_50093 ?auto_50094 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50202 - SURFACE
      ?auto_50203 - SURFACE
      ?auto_50204 - SURFACE
      ?auto_50201 - SURFACE
      ?auto_50205 - SURFACE
    )
    :vars
    (
      ?auto_50206 - HOIST
      ?auto_50207 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50206 ?auto_50207 ) ( SURFACE-AT ?auto_50201 ?auto_50207 ) ( CLEAR ?auto_50201 ) ( LIFTING ?auto_50206 ?auto_50205 ) ( IS-CRATE ?auto_50205 ) ( not ( = ?auto_50201 ?auto_50205 ) ) ( ON ?auto_50203 ?auto_50202 ) ( ON ?auto_50204 ?auto_50203 ) ( ON ?auto_50201 ?auto_50204 ) ( not ( = ?auto_50202 ?auto_50203 ) ) ( not ( = ?auto_50202 ?auto_50204 ) ) ( not ( = ?auto_50202 ?auto_50201 ) ) ( not ( = ?auto_50202 ?auto_50205 ) ) ( not ( = ?auto_50203 ?auto_50204 ) ) ( not ( = ?auto_50203 ?auto_50201 ) ) ( not ( = ?auto_50203 ?auto_50205 ) ) ( not ( = ?auto_50204 ?auto_50201 ) ) ( not ( = ?auto_50204 ?auto_50205 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_50201 ?auto_50205 )
      ( MAKE-4CRATE-VERIFY ?auto_50202 ?auto_50203 ?auto_50204 ?auto_50201 ?auto_50205 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50227 - SURFACE
      ?auto_50228 - SURFACE
      ?auto_50229 - SURFACE
      ?auto_50226 - SURFACE
      ?auto_50230 - SURFACE
    )
    :vars
    (
      ?auto_50232 - HOIST
      ?auto_50233 - PLACE
      ?auto_50231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50232 ?auto_50233 ) ( SURFACE-AT ?auto_50226 ?auto_50233 ) ( CLEAR ?auto_50226 ) ( IS-CRATE ?auto_50230 ) ( not ( = ?auto_50226 ?auto_50230 ) ) ( TRUCK-AT ?auto_50231 ?auto_50233 ) ( AVAILABLE ?auto_50232 ) ( IN ?auto_50230 ?auto_50231 ) ( ON ?auto_50226 ?auto_50229 ) ( not ( = ?auto_50229 ?auto_50226 ) ) ( not ( = ?auto_50229 ?auto_50230 ) ) ( ON ?auto_50228 ?auto_50227 ) ( ON ?auto_50229 ?auto_50228 ) ( not ( = ?auto_50227 ?auto_50228 ) ) ( not ( = ?auto_50227 ?auto_50229 ) ) ( not ( = ?auto_50227 ?auto_50226 ) ) ( not ( = ?auto_50227 ?auto_50230 ) ) ( not ( = ?auto_50228 ?auto_50229 ) ) ( not ( = ?auto_50228 ?auto_50226 ) ) ( not ( = ?auto_50228 ?auto_50230 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50229 ?auto_50226 ?auto_50230 )
      ( MAKE-4CRATE-VERIFY ?auto_50227 ?auto_50228 ?auto_50229 ?auto_50226 ?auto_50230 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50257 - SURFACE
      ?auto_50258 - SURFACE
      ?auto_50259 - SURFACE
      ?auto_50256 - SURFACE
      ?auto_50260 - SURFACE
    )
    :vars
    (
      ?auto_50262 - HOIST
      ?auto_50264 - PLACE
      ?auto_50261 - TRUCK
      ?auto_50263 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50262 ?auto_50264 ) ( SURFACE-AT ?auto_50256 ?auto_50264 ) ( CLEAR ?auto_50256 ) ( IS-CRATE ?auto_50260 ) ( not ( = ?auto_50256 ?auto_50260 ) ) ( AVAILABLE ?auto_50262 ) ( IN ?auto_50260 ?auto_50261 ) ( ON ?auto_50256 ?auto_50259 ) ( not ( = ?auto_50259 ?auto_50256 ) ) ( not ( = ?auto_50259 ?auto_50260 ) ) ( TRUCK-AT ?auto_50261 ?auto_50263 ) ( not ( = ?auto_50263 ?auto_50264 ) ) ( ON ?auto_50258 ?auto_50257 ) ( ON ?auto_50259 ?auto_50258 ) ( not ( = ?auto_50257 ?auto_50258 ) ) ( not ( = ?auto_50257 ?auto_50259 ) ) ( not ( = ?auto_50257 ?auto_50256 ) ) ( not ( = ?auto_50257 ?auto_50260 ) ) ( not ( = ?auto_50258 ?auto_50259 ) ) ( not ( = ?auto_50258 ?auto_50256 ) ) ( not ( = ?auto_50258 ?auto_50260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50259 ?auto_50256 ?auto_50260 )
      ( MAKE-4CRATE-VERIFY ?auto_50257 ?auto_50258 ?auto_50259 ?auto_50256 ?auto_50260 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50291 - SURFACE
      ?auto_50292 - SURFACE
      ?auto_50293 - SURFACE
      ?auto_50290 - SURFACE
      ?auto_50294 - SURFACE
    )
    :vars
    (
      ?auto_50299 - HOIST
      ?auto_50296 - PLACE
      ?auto_50297 - TRUCK
      ?auto_50298 - PLACE
      ?auto_50295 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_50299 ?auto_50296 ) ( SURFACE-AT ?auto_50290 ?auto_50296 ) ( CLEAR ?auto_50290 ) ( IS-CRATE ?auto_50294 ) ( not ( = ?auto_50290 ?auto_50294 ) ) ( AVAILABLE ?auto_50299 ) ( ON ?auto_50290 ?auto_50293 ) ( not ( = ?auto_50293 ?auto_50290 ) ) ( not ( = ?auto_50293 ?auto_50294 ) ) ( TRUCK-AT ?auto_50297 ?auto_50298 ) ( not ( = ?auto_50298 ?auto_50296 ) ) ( HOIST-AT ?auto_50295 ?auto_50298 ) ( LIFTING ?auto_50295 ?auto_50294 ) ( not ( = ?auto_50299 ?auto_50295 ) ) ( ON ?auto_50292 ?auto_50291 ) ( ON ?auto_50293 ?auto_50292 ) ( not ( = ?auto_50291 ?auto_50292 ) ) ( not ( = ?auto_50291 ?auto_50293 ) ) ( not ( = ?auto_50291 ?auto_50290 ) ) ( not ( = ?auto_50291 ?auto_50294 ) ) ( not ( = ?auto_50292 ?auto_50293 ) ) ( not ( = ?auto_50292 ?auto_50290 ) ) ( not ( = ?auto_50292 ?auto_50294 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50293 ?auto_50290 ?auto_50294 )
      ( MAKE-4CRATE-VERIFY ?auto_50291 ?auto_50292 ?auto_50293 ?auto_50290 ?auto_50294 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50329 - SURFACE
      ?auto_50330 - SURFACE
      ?auto_50331 - SURFACE
      ?auto_50328 - SURFACE
      ?auto_50332 - SURFACE
    )
    :vars
    (
      ?auto_50333 - HOIST
      ?auto_50338 - PLACE
      ?auto_50336 - TRUCK
      ?auto_50334 - PLACE
      ?auto_50335 - HOIST
      ?auto_50337 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50333 ?auto_50338 ) ( SURFACE-AT ?auto_50328 ?auto_50338 ) ( CLEAR ?auto_50328 ) ( IS-CRATE ?auto_50332 ) ( not ( = ?auto_50328 ?auto_50332 ) ) ( AVAILABLE ?auto_50333 ) ( ON ?auto_50328 ?auto_50331 ) ( not ( = ?auto_50331 ?auto_50328 ) ) ( not ( = ?auto_50331 ?auto_50332 ) ) ( TRUCK-AT ?auto_50336 ?auto_50334 ) ( not ( = ?auto_50334 ?auto_50338 ) ) ( HOIST-AT ?auto_50335 ?auto_50334 ) ( not ( = ?auto_50333 ?auto_50335 ) ) ( AVAILABLE ?auto_50335 ) ( SURFACE-AT ?auto_50332 ?auto_50334 ) ( ON ?auto_50332 ?auto_50337 ) ( CLEAR ?auto_50332 ) ( not ( = ?auto_50328 ?auto_50337 ) ) ( not ( = ?auto_50332 ?auto_50337 ) ) ( not ( = ?auto_50331 ?auto_50337 ) ) ( ON ?auto_50330 ?auto_50329 ) ( ON ?auto_50331 ?auto_50330 ) ( not ( = ?auto_50329 ?auto_50330 ) ) ( not ( = ?auto_50329 ?auto_50331 ) ) ( not ( = ?auto_50329 ?auto_50328 ) ) ( not ( = ?auto_50329 ?auto_50332 ) ) ( not ( = ?auto_50329 ?auto_50337 ) ) ( not ( = ?auto_50330 ?auto_50331 ) ) ( not ( = ?auto_50330 ?auto_50328 ) ) ( not ( = ?auto_50330 ?auto_50332 ) ) ( not ( = ?auto_50330 ?auto_50337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50331 ?auto_50328 ?auto_50332 )
      ( MAKE-4CRATE-VERIFY ?auto_50329 ?auto_50330 ?auto_50331 ?auto_50328 ?auto_50332 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50368 - SURFACE
      ?auto_50369 - SURFACE
      ?auto_50370 - SURFACE
      ?auto_50367 - SURFACE
      ?auto_50371 - SURFACE
    )
    :vars
    (
      ?auto_50376 - HOIST
      ?auto_50374 - PLACE
      ?auto_50373 - PLACE
      ?auto_50372 - HOIST
      ?auto_50375 - SURFACE
      ?auto_50377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50376 ?auto_50374 ) ( SURFACE-AT ?auto_50367 ?auto_50374 ) ( CLEAR ?auto_50367 ) ( IS-CRATE ?auto_50371 ) ( not ( = ?auto_50367 ?auto_50371 ) ) ( AVAILABLE ?auto_50376 ) ( ON ?auto_50367 ?auto_50370 ) ( not ( = ?auto_50370 ?auto_50367 ) ) ( not ( = ?auto_50370 ?auto_50371 ) ) ( not ( = ?auto_50373 ?auto_50374 ) ) ( HOIST-AT ?auto_50372 ?auto_50373 ) ( not ( = ?auto_50376 ?auto_50372 ) ) ( AVAILABLE ?auto_50372 ) ( SURFACE-AT ?auto_50371 ?auto_50373 ) ( ON ?auto_50371 ?auto_50375 ) ( CLEAR ?auto_50371 ) ( not ( = ?auto_50367 ?auto_50375 ) ) ( not ( = ?auto_50371 ?auto_50375 ) ) ( not ( = ?auto_50370 ?auto_50375 ) ) ( TRUCK-AT ?auto_50377 ?auto_50374 ) ( ON ?auto_50369 ?auto_50368 ) ( ON ?auto_50370 ?auto_50369 ) ( not ( = ?auto_50368 ?auto_50369 ) ) ( not ( = ?auto_50368 ?auto_50370 ) ) ( not ( = ?auto_50368 ?auto_50367 ) ) ( not ( = ?auto_50368 ?auto_50371 ) ) ( not ( = ?auto_50368 ?auto_50375 ) ) ( not ( = ?auto_50369 ?auto_50370 ) ) ( not ( = ?auto_50369 ?auto_50367 ) ) ( not ( = ?auto_50369 ?auto_50371 ) ) ( not ( = ?auto_50369 ?auto_50375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50370 ?auto_50367 ?auto_50371 )
      ( MAKE-4CRATE-VERIFY ?auto_50368 ?auto_50369 ?auto_50370 ?auto_50367 ?auto_50371 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50407 - SURFACE
      ?auto_50408 - SURFACE
      ?auto_50409 - SURFACE
      ?auto_50406 - SURFACE
      ?auto_50410 - SURFACE
    )
    :vars
    (
      ?auto_50411 - HOIST
      ?auto_50412 - PLACE
      ?auto_50414 - PLACE
      ?auto_50415 - HOIST
      ?auto_50413 - SURFACE
      ?auto_50416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50411 ?auto_50412 ) ( IS-CRATE ?auto_50410 ) ( not ( = ?auto_50406 ?auto_50410 ) ) ( not ( = ?auto_50409 ?auto_50406 ) ) ( not ( = ?auto_50409 ?auto_50410 ) ) ( not ( = ?auto_50414 ?auto_50412 ) ) ( HOIST-AT ?auto_50415 ?auto_50414 ) ( not ( = ?auto_50411 ?auto_50415 ) ) ( AVAILABLE ?auto_50415 ) ( SURFACE-AT ?auto_50410 ?auto_50414 ) ( ON ?auto_50410 ?auto_50413 ) ( CLEAR ?auto_50410 ) ( not ( = ?auto_50406 ?auto_50413 ) ) ( not ( = ?auto_50410 ?auto_50413 ) ) ( not ( = ?auto_50409 ?auto_50413 ) ) ( TRUCK-AT ?auto_50416 ?auto_50412 ) ( SURFACE-AT ?auto_50409 ?auto_50412 ) ( CLEAR ?auto_50409 ) ( LIFTING ?auto_50411 ?auto_50406 ) ( IS-CRATE ?auto_50406 ) ( ON ?auto_50408 ?auto_50407 ) ( ON ?auto_50409 ?auto_50408 ) ( not ( = ?auto_50407 ?auto_50408 ) ) ( not ( = ?auto_50407 ?auto_50409 ) ) ( not ( = ?auto_50407 ?auto_50406 ) ) ( not ( = ?auto_50407 ?auto_50410 ) ) ( not ( = ?auto_50407 ?auto_50413 ) ) ( not ( = ?auto_50408 ?auto_50409 ) ) ( not ( = ?auto_50408 ?auto_50406 ) ) ( not ( = ?auto_50408 ?auto_50410 ) ) ( not ( = ?auto_50408 ?auto_50413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50409 ?auto_50406 ?auto_50410 )
      ( MAKE-4CRATE-VERIFY ?auto_50407 ?auto_50408 ?auto_50409 ?auto_50406 ?auto_50410 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50446 - SURFACE
      ?auto_50447 - SURFACE
      ?auto_50448 - SURFACE
      ?auto_50445 - SURFACE
      ?auto_50449 - SURFACE
    )
    :vars
    (
      ?auto_50450 - HOIST
      ?auto_50454 - PLACE
      ?auto_50452 - PLACE
      ?auto_50455 - HOIST
      ?auto_50453 - SURFACE
      ?auto_50451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50450 ?auto_50454 ) ( IS-CRATE ?auto_50449 ) ( not ( = ?auto_50445 ?auto_50449 ) ) ( not ( = ?auto_50448 ?auto_50445 ) ) ( not ( = ?auto_50448 ?auto_50449 ) ) ( not ( = ?auto_50452 ?auto_50454 ) ) ( HOIST-AT ?auto_50455 ?auto_50452 ) ( not ( = ?auto_50450 ?auto_50455 ) ) ( AVAILABLE ?auto_50455 ) ( SURFACE-AT ?auto_50449 ?auto_50452 ) ( ON ?auto_50449 ?auto_50453 ) ( CLEAR ?auto_50449 ) ( not ( = ?auto_50445 ?auto_50453 ) ) ( not ( = ?auto_50449 ?auto_50453 ) ) ( not ( = ?auto_50448 ?auto_50453 ) ) ( TRUCK-AT ?auto_50451 ?auto_50454 ) ( SURFACE-AT ?auto_50448 ?auto_50454 ) ( CLEAR ?auto_50448 ) ( IS-CRATE ?auto_50445 ) ( AVAILABLE ?auto_50450 ) ( IN ?auto_50445 ?auto_50451 ) ( ON ?auto_50447 ?auto_50446 ) ( ON ?auto_50448 ?auto_50447 ) ( not ( = ?auto_50446 ?auto_50447 ) ) ( not ( = ?auto_50446 ?auto_50448 ) ) ( not ( = ?auto_50446 ?auto_50445 ) ) ( not ( = ?auto_50446 ?auto_50449 ) ) ( not ( = ?auto_50446 ?auto_50453 ) ) ( not ( = ?auto_50447 ?auto_50448 ) ) ( not ( = ?auto_50447 ?auto_50445 ) ) ( not ( = ?auto_50447 ?auto_50449 ) ) ( not ( = ?auto_50447 ?auto_50453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50448 ?auto_50445 ?auto_50449 )
      ( MAKE-4CRATE-VERIFY ?auto_50446 ?auto_50447 ?auto_50448 ?auto_50445 ?auto_50449 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_50946 - SURFACE
      ?auto_50947 - SURFACE
    )
    :vars
    (
      ?auto_50948 - HOIST
      ?auto_50949 - PLACE
      ?auto_50950 - SURFACE
      ?auto_50953 - PLACE
      ?auto_50954 - HOIST
      ?auto_50952 - SURFACE
      ?auto_50951 - TRUCK
      ?auto_50955 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50948 ?auto_50949 ) ( SURFACE-AT ?auto_50946 ?auto_50949 ) ( CLEAR ?auto_50946 ) ( IS-CRATE ?auto_50947 ) ( not ( = ?auto_50946 ?auto_50947 ) ) ( ON ?auto_50946 ?auto_50950 ) ( not ( = ?auto_50950 ?auto_50946 ) ) ( not ( = ?auto_50950 ?auto_50947 ) ) ( not ( = ?auto_50953 ?auto_50949 ) ) ( HOIST-AT ?auto_50954 ?auto_50953 ) ( not ( = ?auto_50948 ?auto_50954 ) ) ( AVAILABLE ?auto_50954 ) ( SURFACE-AT ?auto_50947 ?auto_50953 ) ( ON ?auto_50947 ?auto_50952 ) ( CLEAR ?auto_50947 ) ( not ( = ?auto_50946 ?auto_50952 ) ) ( not ( = ?auto_50947 ?auto_50952 ) ) ( not ( = ?auto_50950 ?auto_50952 ) ) ( TRUCK-AT ?auto_50951 ?auto_50949 ) ( LIFTING ?auto_50948 ?auto_50955 ) ( IS-CRATE ?auto_50955 ) ( not ( = ?auto_50946 ?auto_50955 ) ) ( not ( = ?auto_50947 ?auto_50955 ) ) ( not ( = ?auto_50950 ?auto_50955 ) ) ( not ( = ?auto_50952 ?auto_50955 ) ) )
    :subtasks
    ( ( !LOAD ?auto_50948 ?auto_50955 ?auto_50951 ?auto_50949 )
      ( MAKE-1CRATE ?auto_50946 ?auto_50947 )
      ( MAKE-1CRATE-VERIFY ?auto_50946 ?auto_50947 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51106 - SURFACE
      ?auto_51107 - SURFACE
      ?auto_51108 - SURFACE
      ?auto_51105 - SURFACE
      ?auto_51109 - SURFACE
      ?auto_51110 - SURFACE
    )
    :vars
    (
      ?auto_51111 - HOIST
      ?auto_51112 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51111 ?auto_51112 ) ( SURFACE-AT ?auto_51109 ?auto_51112 ) ( CLEAR ?auto_51109 ) ( LIFTING ?auto_51111 ?auto_51110 ) ( IS-CRATE ?auto_51110 ) ( not ( = ?auto_51109 ?auto_51110 ) ) ( ON ?auto_51107 ?auto_51106 ) ( ON ?auto_51108 ?auto_51107 ) ( ON ?auto_51105 ?auto_51108 ) ( ON ?auto_51109 ?auto_51105 ) ( not ( = ?auto_51106 ?auto_51107 ) ) ( not ( = ?auto_51106 ?auto_51108 ) ) ( not ( = ?auto_51106 ?auto_51105 ) ) ( not ( = ?auto_51106 ?auto_51109 ) ) ( not ( = ?auto_51106 ?auto_51110 ) ) ( not ( = ?auto_51107 ?auto_51108 ) ) ( not ( = ?auto_51107 ?auto_51105 ) ) ( not ( = ?auto_51107 ?auto_51109 ) ) ( not ( = ?auto_51107 ?auto_51110 ) ) ( not ( = ?auto_51108 ?auto_51105 ) ) ( not ( = ?auto_51108 ?auto_51109 ) ) ( not ( = ?auto_51108 ?auto_51110 ) ) ( not ( = ?auto_51105 ?auto_51109 ) ) ( not ( = ?auto_51105 ?auto_51110 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_51109 ?auto_51110 )
      ( MAKE-5CRATE-VERIFY ?auto_51106 ?auto_51107 ?auto_51108 ?auto_51105 ?auto_51109 ?auto_51110 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51140 - SURFACE
      ?auto_51141 - SURFACE
      ?auto_51142 - SURFACE
      ?auto_51139 - SURFACE
      ?auto_51143 - SURFACE
      ?auto_51144 - SURFACE
    )
    :vars
    (
      ?auto_51147 - HOIST
      ?auto_51146 - PLACE
      ?auto_51145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51147 ?auto_51146 ) ( SURFACE-AT ?auto_51143 ?auto_51146 ) ( CLEAR ?auto_51143 ) ( IS-CRATE ?auto_51144 ) ( not ( = ?auto_51143 ?auto_51144 ) ) ( TRUCK-AT ?auto_51145 ?auto_51146 ) ( AVAILABLE ?auto_51147 ) ( IN ?auto_51144 ?auto_51145 ) ( ON ?auto_51143 ?auto_51139 ) ( not ( = ?auto_51139 ?auto_51143 ) ) ( not ( = ?auto_51139 ?auto_51144 ) ) ( ON ?auto_51141 ?auto_51140 ) ( ON ?auto_51142 ?auto_51141 ) ( ON ?auto_51139 ?auto_51142 ) ( not ( = ?auto_51140 ?auto_51141 ) ) ( not ( = ?auto_51140 ?auto_51142 ) ) ( not ( = ?auto_51140 ?auto_51139 ) ) ( not ( = ?auto_51140 ?auto_51143 ) ) ( not ( = ?auto_51140 ?auto_51144 ) ) ( not ( = ?auto_51141 ?auto_51142 ) ) ( not ( = ?auto_51141 ?auto_51139 ) ) ( not ( = ?auto_51141 ?auto_51143 ) ) ( not ( = ?auto_51141 ?auto_51144 ) ) ( not ( = ?auto_51142 ?auto_51139 ) ) ( not ( = ?auto_51142 ?auto_51143 ) ) ( not ( = ?auto_51142 ?auto_51144 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51139 ?auto_51143 ?auto_51144 )
      ( MAKE-5CRATE-VERIFY ?auto_51140 ?auto_51141 ?auto_51142 ?auto_51139 ?auto_51143 ?auto_51144 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51180 - SURFACE
      ?auto_51181 - SURFACE
      ?auto_51182 - SURFACE
      ?auto_51179 - SURFACE
      ?auto_51183 - SURFACE
      ?auto_51184 - SURFACE
    )
    :vars
    (
      ?auto_51186 - HOIST
      ?auto_51188 - PLACE
      ?auto_51187 - TRUCK
      ?auto_51185 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51186 ?auto_51188 ) ( SURFACE-AT ?auto_51183 ?auto_51188 ) ( CLEAR ?auto_51183 ) ( IS-CRATE ?auto_51184 ) ( not ( = ?auto_51183 ?auto_51184 ) ) ( AVAILABLE ?auto_51186 ) ( IN ?auto_51184 ?auto_51187 ) ( ON ?auto_51183 ?auto_51179 ) ( not ( = ?auto_51179 ?auto_51183 ) ) ( not ( = ?auto_51179 ?auto_51184 ) ) ( TRUCK-AT ?auto_51187 ?auto_51185 ) ( not ( = ?auto_51185 ?auto_51188 ) ) ( ON ?auto_51181 ?auto_51180 ) ( ON ?auto_51182 ?auto_51181 ) ( ON ?auto_51179 ?auto_51182 ) ( not ( = ?auto_51180 ?auto_51181 ) ) ( not ( = ?auto_51180 ?auto_51182 ) ) ( not ( = ?auto_51180 ?auto_51179 ) ) ( not ( = ?auto_51180 ?auto_51183 ) ) ( not ( = ?auto_51180 ?auto_51184 ) ) ( not ( = ?auto_51181 ?auto_51182 ) ) ( not ( = ?auto_51181 ?auto_51179 ) ) ( not ( = ?auto_51181 ?auto_51183 ) ) ( not ( = ?auto_51181 ?auto_51184 ) ) ( not ( = ?auto_51182 ?auto_51179 ) ) ( not ( = ?auto_51182 ?auto_51183 ) ) ( not ( = ?auto_51182 ?auto_51184 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51179 ?auto_51183 ?auto_51184 )
      ( MAKE-5CRATE-VERIFY ?auto_51180 ?auto_51181 ?auto_51182 ?auto_51179 ?auto_51183 ?auto_51184 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51225 - SURFACE
      ?auto_51226 - SURFACE
      ?auto_51227 - SURFACE
      ?auto_51224 - SURFACE
      ?auto_51228 - SURFACE
      ?auto_51229 - SURFACE
    )
    :vars
    (
      ?auto_51233 - HOIST
      ?auto_51232 - PLACE
      ?auto_51231 - TRUCK
      ?auto_51234 - PLACE
      ?auto_51230 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_51233 ?auto_51232 ) ( SURFACE-AT ?auto_51228 ?auto_51232 ) ( CLEAR ?auto_51228 ) ( IS-CRATE ?auto_51229 ) ( not ( = ?auto_51228 ?auto_51229 ) ) ( AVAILABLE ?auto_51233 ) ( ON ?auto_51228 ?auto_51224 ) ( not ( = ?auto_51224 ?auto_51228 ) ) ( not ( = ?auto_51224 ?auto_51229 ) ) ( TRUCK-AT ?auto_51231 ?auto_51234 ) ( not ( = ?auto_51234 ?auto_51232 ) ) ( HOIST-AT ?auto_51230 ?auto_51234 ) ( LIFTING ?auto_51230 ?auto_51229 ) ( not ( = ?auto_51233 ?auto_51230 ) ) ( ON ?auto_51226 ?auto_51225 ) ( ON ?auto_51227 ?auto_51226 ) ( ON ?auto_51224 ?auto_51227 ) ( not ( = ?auto_51225 ?auto_51226 ) ) ( not ( = ?auto_51225 ?auto_51227 ) ) ( not ( = ?auto_51225 ?auto_51224 ) ) ( not ( = ?auto_51225 ?auto_51228 ) ) ( not ( = ?auto_51225 ?auto_51229 ) ) ( not ( = ?auto_51226 ?auto_51227 ) ) ( not ( = ?auto_51226 ?auto_51224 ) ) ( not ( = ?auto_51226 ?auto_51228 ) ) ( not ( = ?auto_51226 ?auto_51229 ) ) ( not ( = ?auto_51227 ?auto_51224 ) ) ( not ( = ?auto_51227 ?auto_51228 ) ) ( not ( = ?auto_51227 ?auto_51229 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51224 ?auto_51228 ?auto_51229 )
      ( MAKE-5CRATE-VERIFY ?auto_51225 ?auto_51226 ?auto_51227 ?auto_51224 ?auto_51228 ?auto_51229 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51275 - SURFACE
      ?auto_51276 - SURFACE
      ?auto_51277 - SURFACE
      ?auto_51274 - SURFACE
      ?auto_51278 - SURFACE
      ?auto_51279 - SURFACE
    )
    :vars
    (
      ?auto_51284 - HOIST
      ?auto_51280 - PLACE
      ?auto_51282 - TRUCK
      ?auto_51283 - PLACE
      ?auto_51281 - HOIST
      ?auto_51285 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51284 ?auto_51280 ) ( SURFACE-AT ?auto_51278 ?auto_51280 ) ( CLEAR ?auto_51278 ) ( IS-CRATE ?auto_51279 ) ( not ( = ?auto_51278 ?auto_51279 ) ) ( AVAILABLE ?auto_51284 ) ( ON ?auto_51278 ?auto_51274 ) ( not ( = ?auto_51274 ?auto_51278 ) ) ( not ( = ?auto_51274 ?auto_51279 ) ) ( TRUCK-AT ?auto_51282 ?auto_51283 ) ( not ( = ?auto_51283 ?auto_51280 ) ) ( HOIST-AT ?auto_51281 ?auto_51283 ) ( not ( = ?auto_51284 ?auto_51281 ) ) ( AVAILABLE ?auto_51281 ) ( SURFACE-AT ?auto_51279 ?auto_51283 ) ( ON ?auto_51279 ?auto_51285 ) ( CLEAR ?auto_51279 ) ( not ( = ?auto_51278 ?auto_51285 ) ) ( not ( = ?auto_51279 ?auto_51285 ) ) ( not ( = ?auto_51274 ?auto_51285 ) ) ( ON ?auto_51276 ?auto_51275 ) ( ON ?auto_51277 ?auto_51276 ) ( ON ?auto_51274 ?auto_51277 ) ( not ( = ?auto_51275 ?auto_51276 ) ) ( not ( = ?auto_51275 ?auto_51277 ) ) ( not ( = ?auto_51275 ?auto_51274 ) ) ( not ( = ?auto_51275 ?auto_51278 ) ) ( not ( = ?auto_51275 ?auto_51279 ) ) ( not ( = ?auto_51275 ?auto_51285 ) ) ( not ( = ?auto_51276 ?auto_51277 ) ) ( not ( = ?auto_51276 ?auto_51274 ) ) ( not ( = ?auto_51276 ?auto_51278 ) ) ( not ( = ?auto_51276 ?auto_51279 ) ) ( not ( = ?auto_51276 ?auto_51285 ) ) ( not ( = ?auto_51277 ?auto_51274 ) ) ( not ( = ?auto_51277 ?auto_51278 ) ) ( not ( = ?auto_51277 ?auto_51279 ) ) ( not ( = ?auto_51277 ?auto_51285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51274 ?auto_51278 ?auto_51279 )
      ( MAKE-5CRATE-VERIFY ?auto_51275 ?auto_51276 ?auto_51277 ?auto_51274 ?auto_51278 ?auto_51279 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51326 - SURFACE
      ?auto_51327 - SURFACE
      ?auto_51328 - SURFACE
      ?auto_51325 - SURFACE
      ?auto_51329 - SURFACE
      ?auto_51330 - SURFACE
    )
    :vars
    (
      ?auto_51334 - HOIST
      ?auto_51331 - PLACE
      ?auto_51336 - PLACE
      ?auto_51332 - HOIST
      ?auto_51333 - SURFACE
      ?auto_51335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51334 ?auto_51331 ) ( SURFACE-AT ?auto_51329 ?auto_51331 ) ( CLEAR ?auto_51329 ) ( IS-CRATE ?auto_51330 ) ( not ( = ?auto_51329 ?auto_51330 ) ) ( AVAILABLE ?auto_51334 ) ( ON ?auto_51329 ?auto_51325 ) ( not ( = ?auto_51325 ?auto_51329 ) ) ( not ( = ?auto_51325 ?auto_51330 ) ) ( not ( = ?auto_51336 ?auto_51331 ) ) ( HOIST-AT ?auto_51332 ?auto_51336 ) ( not ( = ?auto_51334 ?auto_51332 ) ) ( AVAILABLE ?auto_51332 ) ( SURFACE-AT ?auto_51330 ?auto_51336 ) ( ON ?auto_51330 ?auto_51333 ) ( CLEAR ?auto_51330 ) ( not ( = ?auto_51329 ?auto_51333 ) ) ( not ( = ?auto_51330 ?auto_51333 ) ) ( not ( = ?auto_51325 ?auto_51333 ) ) ( TRUCK-AT ?auto_51335 ?auto_51331 ) ( ON ?auto_51327 ?auto_51326 ) ( ON ?auto_51328 ?auto_51327 ) ( ON ?auto_51325 ?auto_51328 ) ( not ( = ?auto_51326 ?auto_51327 ) ) ( not ( = ?auto_51326 ?auto_51328 ) ) ( not ( = ?auto_51326 ?auto_51325 ) ) ( not ( = ?auto_51326 ?auto_51329 ) ) ( not ( = ?auto_51326 ?auto_51330 ) ) ( not ( = ?auto_51326 ?auto_51333 ) ) ( not ( = ?auto_51327 ?auto_51328 ) ) ( not ( = ?auto_51327 ?auto_51325 ) ) ( not ( = ?auto_51327 ?auto_51329 ) ) ( not ( = ?auto_51327 ?auto_51330 ) ) ( not ( = ?auto_51327 ?auto_51333 ) ) ( not ( = ?auto_51328 ?auto_51325 ) ) ( not ( = ?auto_51328 ?auto_51329 ) ) ( not ( = ?auto_51328 ?auto_51330 ) ) ( not ( = ?auto_51328 ?auto_51333 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51325 ?auto_51329 ?auto_51330 )
      ( MAKE-5CRATE-VERIFY ?auto_51326 ?auto_51327 ?auto_51328 ?auto_51325 ?auto_51329 ?auto_51330 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51377 - SURFACE
      ?auto_51378 - SURFACE
      ?auto_51379 - SURFACE
      ?auto_51376 - SURFACE
      ?auto_51380 - SURFACE
      ?auto_51381 - SURFACE
    )
    :vars
    (
      ?auto_51383 - HOIST
      ?auto_51387 - PLACE
      ?auto_51386 - PLACE
      ?auto_51385 - HOIST
      ?auto_51382 - SURFACE
      ?auto_51384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51383 ?auto_51387 ) ( IS-CRATE ?auto_51381 ) ( not ( = ?auto_51380 ?auto_51381 ) ) ( not ( = ?auto_51376 ?auto_51380 ) ) ( not ( = ?auto_51376 ?auto_51381 ) ) ( not ( = ?auto_51386 ?auto_51387 ) ) ( HOIST-AT ?auto_51385 ?auto_51386 ) ( not ( = ?auto_51383 ?auto_51385 ) ) ( AVAILABLE ?auto_51385 ) ( SURFACE-AT ?auto_51381 ?auto_51386 ) ( ON ?auto_51381 ?auto_51382 ) ( CLEAR ?auto_51381 ) ( not ( = ?auto_51380 ?auto_51382 ) ) ( not ( = ?auto_51381 ?auto_51382 ) ) ( not ( = ?auto_51376 ?auto_51382 ) ) ( TRUCK-AT ?auto_51384 ?auto_51387 ) ( SURFACE-AT ?auto_51376 ?auto_51387 ) ( CLEAR ?auto_51376 ) ( LIFTING ?auto_51383 ?auto_51380 ) ( IS-CRATE ?auto_51380 ) ( ON ?auto_51378 ?auto_51377 ) ( ON ?auto_51379 ?auto_51378 ) ( ON ?auto_51376 ?auto_51379 ) ( not ( = ?auto_51377 ?auto_51378 ) ) ( not ( = ?auto_51377 ?auto_51379 ) ) ( not ( = ?auto_51377 ?auto_51376 ) ) ( not ( = ?auto_51377 ?auto_51380 ) ) ( not ( = ?auto_51377 ?auto_51381 ) ) ( not ( = ?auto_51377 ?auto_51382 ) ) ( not ( = ?auto_51378 ?auto_51379 ) ) ( not ( = ?auto_51378 ?auto_51376 ) ) ( not ( = ?auto_51378 ?auto_51380 ) ) ( not ( = ?auto_51378 ?auto_51381 ) ) ( not ( = ?auto_51378 ?auto_51382 ) ) ( not ( = ?auto_51379 ?auto_51376 ) ) ( not ( = ?auto_51379 ?auto_51380 ) ) ( not ( = ?auto_51379 ?auto_51381 ) ) ( not ( = ?auto_51379 ?auto_51382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51376 ?auto_51380 ?auto_51381 )
      ( MAKE-5CRATE-VERIFY ?auto_51377 ?auto_51378 ?auto_51379 ?auto_51376 ?auto_51380 ?auto_51381 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51428 - SURFACE
      ?auto_51429 - SURFACE
      ?auto_51430 - SURFACE
      ?auto_51427 - SURFACE
      ?auto_51431 - SURFACE
      ?auto_51432 - SURFACE
    )
    :vars
    (
      ?auto_51437 - HOIST
      ?auto_51433 - PLACE
      ?auto_51438 - PLACE
      ?auto_51434 - HOIST
      ?auto_51436 - SURFACE
      ?auto_51435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51437 ?auto_51433 ) ( IS-CRATE ?auto_51432 ) ( not ( = ?auto_51431 ?auto_51432 ) ) ( not ( = ?auto_51427 ?auto_51431 ) ) ( not ( = ?auto_51427 ?auto_51432 ) ) ( not ( = ?auto_51438 ?auto_51433 ) ) ( HOIST-AT ?auto_51434 ?auto_51438 ) ( not ( = ?auto_51437 ?auto_51434 ) ) ( AVAILABLE ?auto_51434 ) ( SURFACE-AT ?auto_51432 ?auto_51438 ) ( ON ?auto_51432 ?auto_51436 ) ( CLEAR ?auto_51432 ) ( not ( = ?auto_51431 ?auto_51436 ) ) ( not ( = ?auto_51432 ?auto_51436 ) ) ( not ( = ?auto_51427 ?auto_51436 ) ) ( TRUCK-AT ?auto_51435 ?auto_51433 ) ( SURFACE-AT ?auto_51427 ?auto_51433 ) ( CLEAR ?auto_51427 ) ( IS-CRATE ?auto_51431 ) ( AVAILABLE ?auto_51437 ) ( IN ?auto_51431 ?auto_51435 ) ( ON ?auto_51429 ?auto_51428 ) ( ON ?auto_51430 ?auto_51429 ) ( ON ?auto_51427 ?auto_51430 ) ( not ( = ?auto_51428 ?auto_51429 ) ) ( not ( = ?auto_51428 ?auto_51430 ) ) ( not ( = ?auto_51428 ?auto_51427 ) ) ( not ( = ?auto_51428 ?auto_51431 ) ) ( not ( = ?auto_51428 ?auto_51432 ) ) ( not ( = ?auto_51428 ?auto_51436 ) ) ( not ( = ?auto_51429 ?auto_51430 ) ) ( not ( = ?auto_51429 ?auto_51427 ) ) ( not ( = ?auto_51429 ?auto_51431 ) ) ( not ( = ?auto_51429 ?auto_51432 ) ) ( not ( = ?auto_51429 ?auto_51436 ) ) ( not ( = ?auto_51430 ?auto_51427 ) ) ( not ( = ?auto_51430 ?auto_51431 ) ) ( not ( = ?auto_51430 ?auto_51432 ) ) ( not ( = ?auto_51430 ?auto_51436 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51427 ?auto_51431 ?auto_51432 )
      ( MAKE-5CRATE-VERIFY ?auto_51428 ?auto_51429 ?auto_51430 ?auto_51427 ?auto_51431 ?auto_51432 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52637 - SURFACE
      ?auto_52638 - SURFACE
      ?auto_52639 - SURFACE
      ?auto_52636 - SURFACE
      ?auto_52640 - SURFACE
      ?auto_52642 - SURFACE
      ?auto_52641 - SURFACE
    )
    :vars
    (
      ?auto_52643 - HOIST
      ?auto_52644 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52643 ?auto_52644 ) ( SURFACE-AT ?auto_52642 ?auto_52644 ) ( CLEAR ?auto_52642 ) ( LIFTING ?auto_52643 ?auto_52641 ) ( IS-CRATE ?auto_52641 ) ( not ( = ?auto_52642 ?auto_52641 ) ) ( ON ?auto_52638 ?auto_52637 ) ( ON ?auto_52639 ?auto_52638 ) ( ON ?auto_52636 ?auto_52639 ) ( ON ?auto_52640 ?auto_52636 ) ( ON ?auto_52642 ?auto_52640 ) ( not ( = ?auto_52637 ?auto_52638 ) ) ( not ( = ?auto_52637 ?auto_52639 ) ) ( not ( = ?auto_52637 ?auto_52636 ) ) ( not ( = ?auto_52637 ?auto_52640 ) ) ( not ( = ?auto_52637 ?auto_52642 ) ) ( not ( = ?auto_52637 ?auto_52641 ) ) ( not ( = ?auto_52638 ?auto_52639 ) ) ( not ( = ?auto_52638 ?auto_52636 ) ) ( not ( = ?auto_52638 ?auto_52640 ) ) ( not ( = ?auto_52638 ?auto_52642 ) ) ( not ( = ?auto_52638 ?auto_52641 ) ) ( not ( = ?auto_52639 ?auto_52636 ) ) ( not ( = ?auto_52639 ?auto_52640 ) ) ( not ( = ?auto_52639 ?auto_52642 ) ) ( not ( = ?auto_52639 ?auto_52641 ) ) ( not ( = ?auto_52636 ?auto_52640 ) ) ( not ( = ?auto_52636 ?auto_52642 ) ) ( not ( = ?auto_52636 ?auto_52641 ) ) ( not ( = ?auto_52640 ?auto_52642 ) ) ( not ( = ?auto_52640 ?auto_52641 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_52642 ?auto_52641 )
      ( MAKE-6CRATE-VERIFY ?auto_52637 ?auto_52638 ?auto_52639 ?auto_52636 ?auto_52640 ?auto_52642 ?auto_52641 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52681 - SURFACE
      ?auto_52682 - SURFACE
      ?auto_52683 - SURFACE
      ?auto_52680 - SURFACE
      ?auto_52684 - SURFACE
      ?auto_52686 - SURFACE
      ?auto_52685 - SURFACE
    )
    :vars
    (
      ?auto_52689 - HOIST
      ?auto_52688 - PLACE
      ?auto_52687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52689 ?auto_52688 ) ( SURFACE-AT ?auto_52686 ?auto_52688 ) ( CLEAR ?auto_52686 ) ( IS-CRATE ?auto_52685 ) ( not ( = ?auto_52686 ?auto_52685 ) ) ( TRUCK-AT ?auto_52687 ?auto_52688 ) ( AVAILABLE ?auto_52689 ) ( IN ?auto_52685 ?auto_52687 ) ( ON ?auto_52686 ?auto_52684 ) ( not ( = ?auto_52684 ?auto_52686 ) ) ( not ( = ?auto_52684 ?auto_52685 ) ) ( ON ?auto_52682 ?auto_52681 ) ( ON ?auto_52683 ?auto_52682 ) ( ON ?auto_52680 ?auto_52683 ) ( ON ?auto_52684 ?auto_52680 ) ( not ( = ?auto_52681 ?auto_52682 ) ) ( not ( = ?auto_52681 ?auto_52683 ) ) ( not ( = ?auto_52681 ?auto_52680 ) ) ( not ( = ?auto_52681 ?auto_52684 ) ) ( not ( = ?auto_52681 ?auto_52686 ) ) ( not ( = ?auto_52681 ?auto_52685 ) ) ( not ( = ?auto_52682 ?auto_52683 ) ) ( not ( = ?auto_52682 ?auto_52680 ) ) ( not ( = ?auto_52682 ?auto_52684 ) ) ( not ( = ?auto_52682 ?auto_52686 ) ) ( not ( = ?auto_52682 ?auto_52685 ) ) ( not ( = ?auto_52683 ?auto_52680 ) ) ( not ( = ?auto_52683 ?auto_52684 ) ) ( not ( = ?auto_52683 ?auto_52686 ) ) ( not ( = ?auto_52683 ?auto_52685 ) ) ( not ( = ?auto_52680 ?auto_52684 ) ) ( not ( = ?auto_52680 ?auto_52686 ) ) ( not ( = ?auto_52680 ?auto_52685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52684 ?auto_52686 ?auto_52685 )
      ( MAKE-6CRATE-VERIFY ?auto_52681 ?auto_52682 ?auto_52683 ?auto_52680 ?auto_52684 ?auto_52686 ?auto_52685 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52732 - SURFACE
      ?auto_52733 - SURFACE
      ?auto_52734 - SURFACE
      ?auto_52731 - SURFACE
      ?auto_52735 - SURFACE
      ?auto_52737 - SURFACE
      ?auto_52736 - SURFACE
    )
    :vars
    (
      ?auto_52738 - HOIST
      ?auto_52739 - PLACE
      ?auto_52741 - TRUCK
      ?auto_52740 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52738 ?auto_52739 ) ( SURFACE-AT ?auto_52737 ?auto_52739 ) ( CLEAR ?auto_52737 ) ( IS-CRATE ?auto_52736 ) ( not ( = ?auto_52737 ?auto_52736 ) ) ( AVAILABLE ?auto_52738 ) ( IN ?auto_52736 ?auto_52741 ) ( ON ?auto_52737 ?auto_52735 ) ( not ( = ?auto_52735 ?auto_52737 ) ) ( not ( = ?auto_52735 ?auto_52736 ) ) ( TRUCK-AT ?auto_52741 ?auto_52740 ) ( not ( = ?auto_52740 ?auto_52739 ) ) ( ON ?auto_52733 ?auto_52732 ) ( ON ?auto_52734 ?auto_52733 ) ( ON ?auto_52731 ?auto_52734 ) ( ON ?auto_52735 ?auto_52731 ) ( not ( = ?auto_52732 ?auto_52733 ) ) ( not ( = ?auto_52732 ?auto_52734 ) ) ( not ( = ?auto_52732 ?auto_52731 ) ) ( not ( = ?auto_52732 ?auto_52735 ) ) ( not ( = ?auto_52732 ?auto_52737 ) ) ( not ( = ?auto_52732 ?auto_52736 ) ) ( not ( = ?auto_52733 ?auto_52734 ) ) ( not ( = ?auto_52733 ?auto_52731 ) ) ( not ( = ?auto_52733 ?auto_52735 ) ) ( not ( = ?auto_52733 ?auto_52737 ) ) ( not ( = ?auto_52733 ?auto_52736 ) ) ( not ( = ?auto_52734 ?auto_52731 ) ) ( not ( = ?auto_52734 ?auto_52735 ) ) ( not ( = ?auto_52734 ?auto_52737 ) ) ( not ( = ?auto_52734 ?auto_52736 ) ) ( not ( = ?auto_52731 ?auto_52735 ) ) ( not ( = ?auto_52731 ?auto_52737 ) ) ( not ( = ?auto_52731 ?auto_52736 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52735 ?auto_52737 ?auto_52736 )
      ( MAKE-6CRATE-VERIFY ?auto_52732 ?auto_52733 ?auto_52734 ?auto_52731 ?auto_52735 ?auto_52737 ?auto_52736 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52789 - SURFACE
      ?auto_52790 - SURFACE
      ?auto_52791 - SURFACE
      ?auto_52788 - SURFACE
      ?auto_52792 - SURFACE
      ?auto_52794 - SURFACE
      ?auto_52793 - SURFACE
    )
    :vars
    (
      ?auto_52796 - HOIST
      ?auto_52795 - PLACE
      ?auto_52797 - TRUCK
      ?auto_52798 - PLACE
      ?auto_52799 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_52796 ?auto_52795 ) ( SURFACE-AT ?auto_52794 ?auto_52795 ) ( CLEAR ?auto_52794 ) ( IS-CRATE ?auto_52793 ) ( not ( = ?auto_52794 ?auto_52793 ) ) ( AVAILABLE ?auto_52796 ) ( ON ?auto_52794 ?auto_52792 ) ( not ( = ?auto_52792 ?auto_52794 ) ) ( not ( = ?auto_52792 ?auto_52793 ) ) ( TRUCK-AT ?auto_52797 ?auto_52798 ) ( not ( = ?auto_52798 ?auto_52795 ) ) ( HOIST-AT ?auto_52799 ?auto_52798 ) ( LIFTING ?auto_52799 ?auto_52793 ) ( not ( = ?auto_52796 ?auto_52799 ) ) ( ON ?auto_52790 ?auto_52789 ) ( ON ?auto_52791 ?auto_52790 ) ( ON ?auto_52788 ?auto_52791 ) ( ON ?auto_52792 ?auto_52788 ) ( not ( = ?auto_52789 ?auto_52790 ) ) ( not ( = ?auto_52789 ?auto_52791 ) ) ( not ( = ?auto_52789 ?auto_52788 ) ) ( not ( = ?auto_52789 ?auto_52792 ) ) ( not ( = ?auto_52789 ?auto_52794 ) ) ( not ( = ?auto_52789 ?auto_52793 ) ) ( not ( = ?auto_52790 ?auto_52791 ) ) ( not ( = ?auto_52790 ?auto_52788 ) ) ( not ( = ?auto_52790 ?auto_52792 ) ) ( not ( = ?auto_52790 ?auto_52794 ) ) ( not ( = ?auto_52790 ?auto_52793 ) ) ( not ( = ?auto_52791 ?auto_52788 ) ) ( not ( = ?auto_52791 ?auto_52792 ) ) ( not ( = ?auto_52791 ?auto_52794 ) ) ( not ( = ?auto_52791 ?auto_52793 ) ) ( not ( = ?auto_52788 ?auto_52792 ) ) ( not ( = ?auto_52788 ?auto_52794 ) ) ( not ( = ?auto_52788 ?auto_52793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52792 ?auto_52794 ?auto_52793 )
      ( MAKE-6CRATE-VERIFY ?auto_52789 ?auto_52790 ?auto_52791 ?auto_52788 ?auto_52792 ?auto_52794 ?auto_52793 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52852 - SURFACE
      ?auto_52853 - SURFACE
      ?auto_52854 - SURFACE
      ?auto_52851 - SURFACE
      ?auto_52855 - SURFACE
      ?auto_52857 - SURFACE
      ?auto_52856 - SURFACE
    )
    :vars
    (
      ?auto_52861 - HOIST
      ?auto_52859 - PLACE
      ?auto_52862 - TRUCK
      ?auto_52863 - PLACE
      ?auto_52858 - HOIST
      ?auto_52860 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52861 ?auto_52859 ) ( SURFACE-AT ?auto_52857 ?auto_52859 ) ( CLEAR ?auto_52857 ) ( IS-CRATE ?auto_52856 ) ( not ( = ?auto_52857 ?auto_52856 ) ) ( AVAILABLE ?auto_52861 ) ( ON ?auto_52857 ?auto_52855 ) ( not ( = ?auto_52855 ?auto_52857 ) ) ( not ( = ?auto_52855 ?auto_52856 ) ) ( TRUCK-AT ?auto_52862 ?auto_52863 ) ( not ( = ?auto_52863 ?auto_52859 ) ) ( HOIST-AT ?auto_52858 ?auto_52863 ) ( not ( = ?auto_52861 ?auto_52858 ) ) ( AVAILABLE ?auto_52858 ) ( SURFACE-AT ?auto_52856 ?auto_52863 ) ( ON ?auto_52856 ?auto_52860 ) ( CLEAR ?auto_52856 ) ( not ( = ?auto_52857 ?auto_52860 ) ) ( not ( = ?auto_52856 ?auto_52860 ) ) ( not ( = ?auto_52855 ?auto_52860 ) ) ( ON ?auto_52853 ?auto_52852 ) ( ON ?auto_52854 ?auto_52853 ) ( ON ?auto_52851 ?auto_52854 ) ( ON ?auto_52855 ?auto_52851 ) ( not ( = ?auto_52852 ?auto_52853 ) ) ( not ( = ?auto_52852 ?auto_52854 ) ) ( not ( = ?auto_52852 ?auto_52851 ) ) ( not ( = ?auto_52852 ?auto_52855 ) ) ( not ( = ?auto_52852 ?auto_52857 ) ) ( not ( = ?auto_52852 ?auto_52856 ) ) ( not ( = ?auto_52852 ?auto_52860 ) ) ( not ( = ?auto_52853 ?auto_52854 ) ) ( not ( = ?auto_52853 ?auto_52851 ) ) ( not ( = ?auto_52853 ?auto_52855 ) ) ( not ( = ?auto_52853 ?auto_52857 ) ) ( not ( = ?auto_52853 ?auto_52856 ) ) ( not ( = ?auto_52853 ?auto_52860 ) ) ( not ( = ?auto_52854 ?auto_52851 ) ) ( not ( = ?auto_52854 ?auto_52855 ) ) ( not ( = ?auto_52854 ?auto_52857 ) ) ( not ( = ?auto_52854 ?auto_52856 ) ) ( not ( = ?auto_52854 ?auto_52860 ) ) ( not ( = ?auto_52851 ?auto_52855 ) ) ( not ( = ?auto_52851 ?auto_52857 ) ) ( not ( = ?auto_52851 ?auto_52856 ) ) ( not ( = ?auto_52851 ?auto_52860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52855 ?auto_52857 ?auto_52856 )
      ( MAKE-6CRATE-VERIFY ?auto_52852 ?auto_52853 ?auto_52854 ?auto_52851 ?auto_52855 ?auto_52857 ?auto_52856 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52916 - SURFACE
      ?auto_52917 - SURFACE
      ?auto_52918 - SURFACE
      ?auto_52915 - SURFACE
      ?auto_52919 - SURFACE
      ?auto_52921 - SURFACE
      ?auto_52920 - SURFACE
    )
    :vars
    (
      ?auto_52927 - HOIST
      ?auto_52924 - PLACE
      ?auto_52922 - PLACE
      ?auto_52923 - HOIST
      ?auto_52925 - SURFACE
      ?auto_52926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52927 ?auto_52924 ) ( SURFACE-AT ?auto_52921 ?auto_52924 ) ( CLEAR ?auto_52921 ) ( IS-CRATE ?auto_52920 ) ( not ( = ?auto_52921 ?auto_52920 ) ) ( AVAILABLE ?auto_52927 ) ( ON ?auto_52921 ?auto_52919 ) ( not ( = ?auto_52919 ?auto_52921 ) ) ( not ( = ?auto_52919 ?auto_52920 ) ) ( not ( = ?auto_52922 ?auto_52924 ) ) ( HOIST-AT ?auto_52923 ?auto_52922 ) ( not ( = ?auto_52927 ?auto_52923 ) ) ( AVAILABLE ?auto_52923 ) ( SURFACE-AT ?auto_52920 ?auto_52922 ) ( ON ?auto_52920 ?auto_52925 ) ( CLEAR ?auto_52920 ) ( not ( = ?auto_52921 ?auto_52925 ) ) ( not ( = ?auto_52920 ?auto_52925 ) ) ( not ( = ?auto_52919 ?auto_52925 ) ) ( TRUCK-AT ?auto_52926 ?auto_52924 ) ( ON ?auto_52917 ?auto_52916 ) ( ON ?auto_52918 ?auto_52917 ) ( ON ?auto_52915 ?auto_52918 ) ( ON ?auto_52919 ?auto_52915 ) ( not ( = ?auto_52916 ?auto_52917 ) ) ( not ( = ?auto_52916 ?auto_52918 ) ) ( not ( = ?auto_52916 ?auto_52915 ) ) ( not ( = ?auto_52916 ?auto_52919 ) ) ( not ( = ?auto_52916 ?auto_52921 ) ) ( not ( = ?auto_52916 ?auto_52920 ) ) ( not ( = ?auto_52916 ?auto_52925 ) ) ( not ( = ?auto_52917 ?auto_52918 ) ) ( not ( = ?auto_52917 ?auto_52915 ) ) ( not ( = ?auto_52917 ?auto_52919 ) ) ( not ( = ?auto_52917 ?auto_52921 ) ) ( not ( = ?auto_52917 ?auto_52920 ) ) ( not ( = ?auto_52917 ?auto_52925 ) ) ( not ( = ?auto_52918 ?auto_52915 ) ) ( not ( = ?auto_52918 ?auto_52919 ) ) ( not ( = ?auto_52918 ?auto_52921 ) ) ( not ( = ?auto_52918 ?auto_52920 ) ) ( not ( = ?auto_52918 ?auto_52925 ) ) ( not ( = ?auto_52915 ?auto_52919 ) ) ( not ( = ?auto_52915 ?auto_52921 ) ) ( not ( = ?auto_52915 ?auto_52920 ) ) ( not ( = ?auto_52915 ?auto_52925 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52919 ?auto_52921 ?auto_52920 )
      ( MAKE-6CRATE-VERIFY ?auto_52916 ?auto_52917 ?auto_52918 ?auto_52915 ?auto_52919 ?auto_52921 ?auto_52920 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52980 - SURFACE
      ?auto_52981 - SURFACE
      ?auto_52982 - SURFACE
      ?auto_52979 - SURFACE
      ?auto_52983 - SURFACE
      ?auto_52985 - SURFACE
      ?auto_52984 - SURFACE
    )
    :vars
    (
      ?auto_52989 - HOIST
      ?auto_52986 - PLACE
      ?auto_52990 - PLACE
      ?auto_52987 - HOIST
      ?auto_52988 - SURFACE
      ?auto_52991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52989 ?auto_52986 ) ( IS-CRATE ?auto_52984 ) ( not ( = ?auto_52985 ?auto_52984 ) ) ( not ( = ?auto_52983 ?auto_52985 ) ) ( not ( = ?auto_52983 ?auto_52984 ) ) ( not ( = ?auto_52990 ?auto_52986 ) ) ( HOIST-AT ?auto_52987 ?auto_52990 ) ( not ( = ?auto_52989 ?auto_52987 ) ) ( AVAILABLE ?auto_52987 ) ( SURFACE-AT ?auto_52984 ?auto_52990 ) ( ON ?auto_52984 ?auto_52988 ) ( CLEAR ?auto_52984 ) ( not ( = ?auto_52985 ?auto_52988 ) ) ( not ( = ?auto_52984 ?auto_52988 ) ) ( not ( = ?auto_52983 ?auto_52988 ) ) ( TRUCK-AT ?auto_52991 ?auto_52986 ) ( SURFACE-AT ?auto_52983 ?auto_52986 ) ( CLEAR ?auto_52983 ) ( LIFTING ?auto_52989 ?auto_52985 ) ( IS-CRATE ?auto_52985 ) ( ON ?auto_52981 ?auto_52980 ) ( ON ?auto_52982 ?auto_52981 ) ( ON ?auto_52979 ?auto_52982 ) ( ON ?auto_52983 ?auto_52979 ) ( not ( = ?auto_52980 ?auto_52981 ) ) ( not ( = ?auto_52980 ?auto_52982 ) ) ( not ( = ?auto_52980 ?auto_52979 ) ) ( not ( = ?auto_52980 ?auto_52983 ) ) ( not ( = ?auto_52980 ?auto_52985 ) ) ( not ( = ?auto_52980 ?auto_52984 ) ) ( not ( = ?auto_52980 ?auto_52988 ) ) ( not ( = ?auto_52981 ?auto_52982 ) ) ( not ( = ?auto_52981 ?auto_52979 ) ) ( not ( = ?auto_52981 ?auto_52983 ) ) ( not ( = ?auto_52981 ?auto_52985 ) ) ( not ( = ?auto_52981 ?auto_52984 ) ) ( not ( = ?auto_52981 ?auto_52988 ) ) ( not ( = ?auto_52982 ?auto_52979 ) ) ( not ( = ?auto_52982 ?auto_52983 ) ) ( not ( = ?auto_52982 ?auto_52985 ) ) ( not ( = ?auto_52982 ?auto_52984 ) ) ( not ( = ?auto_52982 ?auto_52988 ) ) ( not ( = ?auto_52979 ?auto_52983 ) ) ( not ( = ?auto_52979 ?auto_52985 ) ) ( not ( = ?auto_52979 ?auto_52984 ) ) ( not ( = ?auto_52979 ?auto_52988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52983 ?auto_52985 ?auto_52984 )
      ( MAKE-6CRATE-VERIFY ?auto_52980 ?auto_52981 ?auto_52982 ?auto_52979 ?auto_52983 ?auto_52985 ?auto_52984 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_53044 - SURFACE
      ?auto_53045 - SURFACE
      ?auto_53046 - SURFACE
      ?auto_53043 - SURFACE
      ?auto_53047 - SURFACE
      ?auto_53049 - SURFACE
      ?auto_53048 - SURFACE
    )
    :vars
    (
      ?auto_53050 - HOIST
      ?auto_53052 - PLACE
      ?auto_53054 - PLACE
      ?auto_53053 - HOIST
      ?auto_53051 - SURFACE
      ?auto_53055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53050 ?auto_53052 ) ( IS-CRATE ?auto_53048 ) ( not ( = ?auto_53049 ?auto_53048 ) ) ( not ( = ?auto_53047 ?auto_53049 ) ) ( not ( = ?auto_53047 ?auto_53048 ) ) ( not ( = ?auto_53054 ?auto_53052 ) ) ( HOIST-AT ?auto_53053 ?auto_53054 ) ( not ( = ?auto_53050 ?auto_53053 ) ) ( AVAILABLE ?auto_53053 ) ( SURFACE-AT ?auto_53048 ?auto_53054 ) ( ON ?auto_53048 ?auto_53051 ) ( CLEAR ?auto_53048 ) ( not ( = ?auto_53049 ?auto_53051 ) ) ( not ( = ?auto_53048 ?auto_53051 ) ) ( not ( = ?auto_53047 ?auto_53051 ) ) ( TRUCK-AT ?auto_53055 ?auto_53052 ) ( SURFACE-AT ?auto_53047 ?auto_53052 ) ( CLEAR ?auto_53047 ) ( IS-CRATE ?auto_53049 ) ( AVAILABLE ?auto_53050 ) ( IN ?auto_53049 ?auto_53055 ) ( ON ?auto_53045 ?auto_53044 ) ( ON ?auto_53046 ?auto_53045 ) ( ON ?auto_53043 ?auto_53046 ) ( ON ?auto_53047 ?auto_53043 ) ( not ( = ?auto_53044 ?auto_53045 ) ) ( not ( = ?auto_53044 ?auto_53046 ) ) ( not ( = ?auto_53044 ?auto_53043 ) ) ( not ( = ?auto_53044 ?auto_53047 ) ) ( not ( = ?auto_53044 ?auto_53049 ) ) ( not ( = ?auto_53044 ?auto_53048 ) ) ( not ( = ?auto_53044 ?auto_53051 ) ) ( not ( = ?auto_53045 ?auto_53046 ) ) ( not ( = ?auto_53045 ?auto_53043 ) ) ( not ( = ?auto_53045 ?auto_53047 ) ) ( not ( = ?auto_53045 ?auto_53049 ) ) ( not ( = ?auto_53045 ?auto_53048 ) ) ( not ( = ?auto_53045 ?auto_53051 ) ) ( not ( = ?auto_53046 ?auto_53043 ) ) ( not ( = ?auto_53046 ?auto_53047 ) ) ( not ( = ?auto_53046 ?auto_53049 ) ) ( not ( = ?auto_53046 ?auto_53048 ) ) ( not ( = ?auto_53046 ?auto_53051 ) ) ( not ( = ?auto_53043 ?auto_53047 ) ) ( not ( = ?auto_53043 ?auto_53049 ) ) ( not ( = ?auto_53043 ?auto_53048 ) ) ( not ( = ?auto_53043 ?auto_53051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53047 ?auto_53049 ?auto_53048 )
      ( MAKE-6CRATE-VERIFY ?auto_53044 ?auto_53045 ?auto_53046 ?auto_53043 ?auto_53047 ?auto_53049 ?auto_53048 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_53056 - SURFACE
      ?auto_53057 - SURFACE
    )
    :vars
    (
      ?auto_53058 - HOIST
      ?auto_53060 - PLACE
      ?auto_53064 - SURFACE
      ?auto_53062 - PLACE
      ?auto_53061 - HOIST
      ?auto_53059 - SURFACE
      ?auto_53063 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53058 ?auto_53060 ) ( IS-CRATE ?auto_53057 ) ( not ( = ?auto_53056 ?auto_53057 ) ) ( not ( = ?auto_53064 ?auto_53056 ) ) ( not ( = ?auto_53064 ?auto_53057 ) ) ( not ( = ?auto_53062 ?auto_53060 ) ) ( HOIST-AT ?auto_53061 ?auto_53062 ) ( not ( = ?auto_53058 ?auto_53061 ) ) ( AVAILABLE ?auto_53061 ) ( SURFACE-AT ?auto_53057 ?auto_53062 ) ( ON ?auto_53057 ?auto_53059 ) ( CLEAR ?auto_53057 ) ( not ( = ?auto_53056 ?auto_53059 ) ) ( not ( = ?auto_53057 ?auto_53059 ) ) ( not ( = ?auto_53064 ?auto_53059 ) ) ( SURFACE-AT ?auto_53064 ?auto_53060 ) ( CLEAR ?auto_53064 ) ( IS-CRATE ?auto_53056 ) ( AVAILABLE ?auto_53058 ) ( IN ?auto_53056 ?auto_53063 ) ( TRUCK-AT ?auto_53063 ?auto_53062 ) )
    :subtasks
    ( ( !DRIVE ?auto_53063 ?auto_53062 ?auto_53060 )
      ( MAKE-2CRATE ?auto_53064 ?auto_53056 ?auto_53057 )
      ( MAKE-1CRATE-VERIFY ?auto_53056 ?auto_53057 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_53065 - SURFACE
      ?auto_53066 - SURFACE
      ?auto_53067 - SURFACE
    )
    :vars
    (
      ?auto_53073 - HOIST
      ?auto_53070 - PLACE
      ?auto_53068 - PLACE
      ?auto_53071 - HOIST
      ?auto_53069 - SURFACE
      ?auto_53072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53073 ?auto_53070 ) ( IS-CRATE ?auto_53067 ) ( not ( = ?auto_53066 ?auto_53067 ) ) ( not ( = ?auto_53065 ?auto_53066 ) ) ( not ( = ?auto_53065 ?auto_53067 ) ) ( not ( = ?auto_53068 ?auto_53070 ) ) ( HOIST-AT ?auto_53071 ?auto_53068 ) ( not ( = ?auto_53073 ?auto_53071 ) ) ( AVAILABLE ?auto_53071 ) ( SURFACE-AT ?auto_53067 ?auto_53068 ) ( ON ?auto_53067 ?auto_53069 ) ( CLEAR ?auto_53067 ) ( not ( = ?auto_53066 ?auto_53069 ) ) ( not ( = ?auto_53067 ?auto_53069 ) ) ( not ( = ?auto_53065 ?auto_53069 ) ) ( SURFACE-AT ?auto_53065 ?auto_53070 ) ( CLEAR ?auto_53065 ) ( IS-CRATE ?auto_53066 ) ( AVAILABLE ?auto_53073 ) ( IN ?auto_53066 ?auto_53072 ) ( TRUCK-AT ?auto_53072 ?auto_53068 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_53066 ?auto_53067 )
      ( MAKE-2CRATE-VERIFY ?auto_53065 ?auto_53066 ?auto_53067 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_53075 - SURFACE
      ?auto_53076 - SURFACE
      ?auto_53077 - SURFACE
      ?auto_53074 - SURFACE
    )
    :vars
    (
      ?auto_53082 - HOIST
      ?auto_53078 - PLACE
      ?auto_53080 - PLACE
      ?auto_53079 - HOIST
      ?auto_53081 - SURFACE
      ?auto_53083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53082 ?auto_53078 ) ( IS-CRATE ?auto_53074 ) ( not ( = ?auto_53077 ?auto_53074 ) ) ( not ( = ?auto_53076 ?auto_53077 ) ) ( not ( = ?auto_53076 ?auto_53074 ) ) ( not ( = ?auto_53080 ?auto_53078 ) ) ( HOIST-AT ?auto_53079 ?auto_53080 ) ( not ( = ?auto_53082 ?auto_53079 ) ) ( AVAILABLE ?auto_53079 ) ( SURFACE-AT ?auto_53074 ?auto_53080 ) ( ON ?auto_53074 ?auto_53081 ) ( CLEAR ?auto_53074 ) ( not ( = ?auto_53077 ?auto_53081 ) ) ( not ( = ?auto_53074 ?auto_53081 ) ) ( not ( = ?auto_53076 ?auto_53081 ) ) ( SURFACE-AT ?auto_53076 ?auto_53078 ) ( CLEAR ?auto_53076 ) ( IS-CRATE ?auto_53077 ) ( AVAILABLE ?auto_53082 ) ( IN ?auto_53077 ?auto_53083 ) ( TRUCK-AT ?auto_53083 ?auto_53080 ) ( ON ?auto_53076 ?auto_53075 ) ( not ( = ?auto_53075 ?auto_53076 ) ) ( not ( = ?auto_53075 ?auto_53077 ) ) ( not ( = ?auto_53075 ?auto_53074 ) ) ( not ( = ?auto_53075 ?auto_53081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53076 ?auto_53077 ?auto_53074 )
      ( MAKE-3CRATE-VERIFY ?auto_53075 ?auto_53076 ?auto_53077 ?auto_53074 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_53085 - SURFACE
      ?auto_53086 - SURFACE
      ?auto_53087 - SURFACE
      ?auto_53084 - SURFACE
      ?auto_53088 - SURFACE
    )
    :vars
    (
      ?auto_53093 - HOIST
      ?auto_53089 - PLACE
      ?auto_53091 - PLACE
      ?auto_53090 - HOIST
      ?auto_53092 - SURFACE
      ?auto_53094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53093 ?auto_53089 ) ( IS-CRATE ?auto_53088 ) ( not ( = ?auto_53084 ?auto_53088 ) ) ( not ( = ?auto_53087 ?auto_53084 ) ) ( not ( = ?auto_53087 ?auto_53088 ) ) ( not ( = ?auto_53091 ?auto_53089 ) ) ( HOIST-AT ?auto_53090 ?auto_53091 ) ( not ( = ?auto_53093 ?auto_53090 ) ) ( AVAILABLE ?auto_53090 ) ( SURFACE-AT ?auto_53088 ?auto_53091 ) ( ON ?auto_53088 ?auto_53092 ) ( CLEAR ?auto_53088 ) ( not ( = ?auto_53084 ?auto_53092 ) ) ( not ( = ?auto_53088 ?auto_53092 ) ) ( not ( = ?auto_53087 ?auto_53092 ) ) ( SURFACE-AT ?auto_53087 ?auto_53089 ) ( CLEAR ?auto_53087 ) ( IS-CRATE ?auto_53084 ) ( AVAILABLE ?auto_53093 ) ( IN ?auto_53084 ?auto_53094 ) ( TRUCK-AT ?auto_53094 ?auto_53091 ) ( ON ?auto_53086 ?auto_53085 ) ( ON ?auto_53087 ?auto_53086 ) ( not ( = ?auto_53085 ?auto_53086 ) ) ( not ( = ?auto_53085 ?auto_53087 ) ) ( not ( = ?auto_53085 ?auto_53084 ) ) ( not ( = ?auto_53085 ?auto_53088 ) ) ( not ( = ?auto_53085 ?auto_53092 ) ) ( not ( = ?auto_53086 ?auto_53087 ) ) ( not ( = ?auto_53086 ?auto_53084 ) ) ( not ( = ?auto_53086 ?auto_53088 ) ) ( not ( = ?auto_53086 ?auto_53092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53087 ?auto_53084 ?auto_53088 )
      ( MAKE-4CRATE-VERIFY ?auto_53085 ?auto_53086 ?auto_53087 ?auto_53084 ?auto_53088 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_53096 - SURFACE
      ?auto_53097 - SURFACE
      ?auto_53098 - SURFACE
      ?auto_53095 - SURFACE
      ?auto_53099 - SURFACE
      ?auto_53100 - SURFACE
    )
    :vars
    (
      ?auto_53105 - HOIST
      ?auto_53101 - PLACE
      ?auto_53103 - PLACE
      ?auto_53102 - HOIST
      ?auto_53104 - SURFACE
      ?auto_53106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53105 ?auto_53101 ) ( IS-CRATE ?auto_53100 ) ( not ( = ?auto_53099 ?auto_53100 ) ) ( not ( = ?auto_53095 ?auto_53099 ) ) ( not ( = ?auto_53095 ?auto_53100 ) ) ( not ( = ?auto_53103 ?auto_53101 ) ) ( HOIST-AT ?auto_53102 ?auto_53103 ) ( not ( = ?auto_53105 ?auto_53102 ) ) ( AVAILABLE ?auto_53102 ) ( SURFACE-AT ?auto_53100 ?auto_53103 ) ( ON ?auto_53100 ?auto_53104 ) ( CLEAR ?auto_53100 ) ( not ( = ?auto_53099 ?auto_53104 ) ) ( not ( = ?auto_53100 ?auto_53104 ) ) ( not ( = ?auto_53095 ?auto_53104 ) ) ( SURFACE-AT ?auto_53095 ?auto_53101 ) ( CLEAR ?auto_53095 ) ( IS-CRATE ?auto_53099 ) ( AVAILABLE ?auto_53105 ) ( IN ?auto_53099 ?auto_53106 ) ( TRUCK-AT ?auto_53106 ?auto_53103 ) ( ON ?auto_53097 ?auto_53096 ) ( ON ?auto_53098 ?auto_53097 ) ( ON ?auto_53095 ?auto_53098 ) ( not ( = ?auto_53096 ?auto_53097 ) ) ( not ( = ?auto_53096 ?auto_53098 ) ) ( not ( = ?auto_53096 ?auto_53095 ) ) ( not ( = ?auto_53096 ?auto_53099 ) ) ( not ( = ?auto_53096 ?auto_53100 ) ) ( not ( = ?auto_53096 ?auto_53104 ) ) ( not ( = ?auto_53097 ?auto_53098 ) ) ( not ( = ?auto_53097 ?auto_53095 ) ) ( not ( = ?auto_53097 ?auto_53099 ) ) ( not ( = ?auto_53097 ?auto_53100 ) ) ( not ( = ?auto_53097 ?auto_53104 ) ) ( not ( = ?auto_53098 ?auto_53095 ) ) ( not ( = ?auto_53098 ?auto_53099 ) ) ( not ( = ?auto_53098 ?auto_53100 ) ) ( not ( = ?auto_53098 ?auto_53104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53095 ?auto_53099 ?auto_53100 )
      ( MAKE-5CRATE-VERIFY ?auto_53096 ?auto_53097 ?auto_53098 ?auto_53095 ?auto_53099 ?auto_53100 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_53108 - SURFACE
      ?auto_53109 - SURFACE
      ?auto_53110 - SURFACE
      ?auto_53107 - SURFACE
      ?auto_53111 - SURFACE
      ?auto_53113 - SURFACE
      ?auto_53112 - SURFACE
    )
    :vars
    (
      ?auto_53118 - HOIST
      ?auto_53114 - PLACE
      ?auto_53116 - PLACE
      ?auto_53115 - HOIST
      ?auto_53117 - SURFACE
      ?auto_53119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53118 ?auto_53114 ) ( IS-CRATE ?auto_53112 ) ( not ( = ?auto_53113 ?auto_53112 ) ) ( not ( = ?auto_53111 ?auto_53113 ) ) ( not ( = ?auto_53111 ?auto_53112 ) ) ( not ( = ?auto_53116 ?auto_53114 ) ) ( HOIST-AT ?auto_53115 ?auto_53116 ) ( not ( = ?auto_53118 ?auto_53115 ) ) ( AVAILABLE ?auto_53115 ) ( SURFACE-AT ?auto_53112 ?auto_53116 ) ( ON ?auto_53112 ?auto_53117 ) ( CLEAR ?auto_53112 ) ( not ( = ?auto_53113 ?auto_53117 ) ) ( not ( = ?auto_53112 ?auto_53117 ) ) ( not ( = ?auto_53111 ?auto_53117 ) ) ( SURFACE-AT ?auto_53111 ?auto_53114 ) ( CLEAR ?auto_53111 ) ( IS-CRATE ?auto_53113 ) ( AVAILABLE ?auto_53118 ) ( IN ?auto_53113 ?auto_53119 ) ( TRUCK-AT ?auto_53119 ?auto_53116 ) ( ON ?auto_53109 ?auto_53108 ) ( ON ?auto_53110 ?auto_53109 ) ( ON ?auto_53107 ?auto_53110 ) ( ON ?auto_53111 ?auto_53107 ) ( not ( = ?auto_53108 ?auto_53109 ) ) ( not ( = ?auto_53108 ?auto_53110 ) ) ( not ( = ?auto_53108 ?auto_53107 ) ) ( not ( = ?auto_53108 ?auto_53111 ) ) ( not ( = ?auto_53108 ?auto_53113 ) ) ( not ( = ?auto_53108 ?auto_53112 ) ) ( not ( = ?auto_53108 ?auto_53117 ) ) ( not ( = ?auto_53109 ?auto_53110 ) ) ( not ( = ?auto_53109 ?auto_53107 ) ) ( not ( = ?auto_53109 ?auto_53111 ) ) ( not ( = ?auto_53109 ?auto_53113 ) ) ( not ( = ?auto_53109 ?auto_53112 ) ) ( not ( = ?auto_53109 ?auto_53117 ) ) ( not ( = ?auto_53110 ?auto_53107 ) ) ( not ( = ?auto_53110 ?auto_53111 ) ) ( not ( = ?auto_53110 ?auto_53113 ) ) ( not ( = ?auto_53110 ?auto_53112 ) ) ( not ( = ?auto_53110 ?auto_53117 ) ) ( not ( = ?auto_53107 ?auto_53111 ) ) ( not ( = ?auto_53107 ?auto_53113 ) ) ( not ( = ?auto_53107 ?auto_53112 ) ) ( not ( = ?auto_53107 ?auto_53117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53111 ?auto_53113 ?auto_53112 )
      ( MAKE-6CRATE-VERIFY ?auto_53108 ?auto_53109 ?auto_53110 ?auto_53107 ?auto_53111 ?auto_53113 ?auto_53112 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_53120 - SURFACE
      ?auto_53121 - SURFACE
    )
    :vars
    (
      ?auto_53127 - HOIST
      ?auto_53122 - PLACE
      ?auto_53123 - SURFACE
      ?auto_53125 - PLACE
      ?auto_53124 - HOIST
      ?auto_53126 - SURFACE
      ?auto_53128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53127 ?auto_53122 ) ( IS-CRATE ?auto_53121 ) ( not ( = ?auto_53120 ?auto_53121 ) ) ( not ( = ?auto_53123 ?auto_53120 ) ) ( not ( = ?auto_53123 ?auto_53121 ) ) ( not ( = ?auto_53125 ?auto_53122 ) ) ( HOIST-AT ?auto_53124 ?auto_53125 ) ( not ( = ?auto_53127 ?auto_53124 ) ) ( SURFACE-AT ?auto_53121 ?auto_53125 ) ( ON ?auto_53121 ?auto_53126 ) ( CLEAR ?auto_53121 ) ( not ( = ?auto_53120 ?auto_53126 ) ) ( not ( = ?auto_53121 ?auto_53126 ) ) ( not ( = ?auto_53123 ?auto_53126 ) ) ( SURFACE-AT ?auto_53123 ?auto_53122 ) ( CLEAR ?auto_53123 ) ( IS-CRATE ?auto_53120 ) ( AVAILABLE ?auto_53127 ) ( TRUCK-AT ?auto_53128 ?auto_53125 ) ( LIFTING ?auto_53124 ?auto_53120 ) )
    :subtasks
    ( ( !LOAD ?auto_53124 ?auto_53120 ?auto_53128 ?auto_53125 )
      ( MAKE-2CRATE ?auto_53123 ?auto_53120 ?auto_53121 )
      ( MAKE-1CRATE-VERIFY ?auto_53120 ?auto_53121 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_53129 - SURFACE
      ?auto_53130 - SURFACE
      ?auto_53131 - SURFACE
    )
    :vars
    (
      ?auto_53132 - HOIST
      ?auto_53134 - PLACE
      ?auto_53137 - PLACE
      ?auto_53136 - HOIST
      ?auto_53135 - SURFACE
      ?auto_53133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53132 ?auto_53134 ) ( IS-CRATE ?auto_53131 ) ( not ( = ?auto_53130 ?auto_53131 ) ) ( not ( = ?auto_53129 ?auto_53130 ) ) ( not ( = ?auto_53129 ?auto_53131 ) ) ( not ( = ?auto_53137 ?auto_53134 ) ) ( HOIST-AT ?auto_53136 ?auto_53137 ) ( not ( = ?auto_53132 ?auto_53136 ) ) ( SURFACE-AT ?auto_53131 ?auto_53137 ) ( ON ?auto_53131 ?auto_53135 ) ( CLEAR ?auto_53131 ) ( not ( = ?auto_53130 ?auto_53135 ) ) ( not ( = ?auto_53131 ?auto_53135 ) ) ( not ( = ?auto_53129 ?auto_53135 ) ) ( SURFACE-AT ?auto_53129 ?auto_53134 ) ( CLEAR ?auto_53129 ) ( IS-CRATE ?auto_53130 ) ( AVAILABLE ?auto_53132 ) ( TRUCK-AT ?auto_53133 ?auto_53137 ) ( LIFTING ?auto_53136 ?auto_53130 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_53130 ?auto_53131 )
      ( MAKE-2CRATE-VERIFY ?auto_53129 ?auto_53130 ?auto_53131 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_53139 - SURFACE
      ?auto_53140 - SURFACE
      ?auto_53141 - SURFACE
      ?auto_53138 - SURFACE
    )
    :vars
    (
      ?auto_53143 - HOIST
      ?auto_53147 - PLACE
      ?auto_53142 - PLACE
      ?auto_53146 - HOIST
      ?auto_53144 - SURFACE
      ?auto_53145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53143 ?auto_53147 ) ( IS-CRATE ?auto_53138 ) ( not ( = ?auto_53141 ?auto_53138 ) ) ( not ( = ?auto_53140 ?auto_53141 ) ) ( not ( = ?auto_53140 ?auto_53138 ) ) ( not ( = ?auto_53142 ?auto_53147 ) ) ( HOIST-AT ?auto_53146 ?auto_53142 ) ( not ( = ?auto_53143 ?auto_53146 ) ) ( SURFACE-AT ?auto_53138 ?auto_53142 ) ( ON ?auto_53138 ?auto_53144 ) ( CLEAR ?auto_53138 ) ( not ( = ?auto_53141 ?auto_53144 ) ) ( not ( = ?auto_53138 ?auto_53144 ) ) ( not ( = ?auto_53140 ?auto_53144 ) ) ( SURFACE-AT ?auto_53140 ?auto_53147 ) ( CLEAR ?auto_53140 ) ( IS-CRATE ?auto_53141 ) ( AVAILABLE ?auto_53143 ) ( TRUCK-AT ?auto_53145 ?auto_53142 ) ( LIFTING ?auto_53146 ?auto_53141 ) ( ON ?auto_53140 ?auto_53139 ) ( not ( = ?auto_53139 ?auto_53140 ) ) ( not ( = ?auto_53139 ?auto_53141 ) ) ( not ( = ?auto_53139 ?auto_53138 ) ) ( not ( = ?auto_53139 ?auto_53144 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53140 ?auto_53141 ?auto_53138 )
      ( MAKE-3CRATE-VERIFY ?auto_53139 ?auto_53140 ?auto_53141 ?auto_53138 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_53149 - SURFACE
      ?auto_53150 - SURFACE
      ?auto_53151 - SURFACE
      ?auto_53148 - SURFACE
      ?auto_53152 - SURFACE
    )
    :vars
    (
      ?auto_53154 - HOIST
      ?auto_53158 - PLACE
      ?auto_53153 - PLACE
      ?auto_53157 - HOIST
      ?auto_53155 - SURFACE
      ?auto_53156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53154 ?auto_53158 ) ( IS-CRATE ?auto_53152 ) ( not ( = ?auto_53148 ?auto_53152 ) ) ( not ( = ?auto_53151 ?auto_53148 ) ) ( not ( = ?auto_53151 ?auto_53152 ) ) ( not ( = ?auto_53153 ?auto_53158 ) ) ( HOIST-AT ?auto_53157 ?auto_53153 ) ( not ( = ?auto_53154 ?auto_53157 ) ) ( SURFACE-AT ?auto_53152 ?auto_53153 ) ( ON ?auto_53152 ?auto_53155 ) ( CLEAR ?auto_53152 ) ( not ( = ?auto_53148 ?auto_53155 ) ) ( not ( = ?auto_53152 ?auto_53155 ) ) ( not ( = ?auto_53151 ?auto_53155 ) ) ( SURFACE-AT ?auto_53151 ?auto_53158 ) ( CLEAR ?auto_53151 ) ( IS-CRATE ?auto_53148 ) ( AVAILABLE ?auto_53154 ) ( TRUCK-AT ?auto_53156 ?auto_53153 ) ( LIFTING ?auto_53157 ?auto_53148 ) ( ON ?auto_53150 ?auto_53149 ) ( ON ?auto_53151 ?auto_53150 ) ( not ( = ?auto_53149 ?auto_53150 ) ) ( not ( = ?auto_53149 ?auto_53151 ) ) ( not ( = ?auto_53149 ?auto_53148 ) ) ( not ( = ?auto_53149 ?auto_53152 ) ) ( not ( = ?auto_53149 ?auto_53155 ) ) ( not ( = ?auto_53150 ?auto_53151 ) ) ( not ( = ?auto_53150 ?auto_53148 ) ) ( not ( = ?auto_53150 ?auto_53152 ) ) ( not ( = ?auto_53150 ?auto_53155 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53151 ?auto_53148 ?auto_53152 )
      ( MAKE-4CRATE-VERIFY ?auto_53149 ?auto_53150 ?auto_53151 ?auto_53148 ?auto_53152 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_53160 - SURFACE
      ?auto_53161 - SURFACE
      ?auto_53162 - SURFACE
      ?auto_53159 - SURFACE
      ?auto_53163 - SURFACE
      ?auto_53164 - SURFACE
    )
    :vars
    (
      ?auto_53166 - HOIST
      ?auto_53170 - PLACE
      ?auto_53165 - PLACE
      ?auto_53169 - HOIST
      ?auto_53167 - SURFACE
      ?auto_53168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53166 ?auto_53170 ) ( IS-CRATE ?auto_53164 ) ( not ( = ?auto_53163 ?auto_53164 ) ) ( not ( = ?auto_53159 ?auto_53163 ) ) ( not ( = ?auto_53159 ?auto_53164 ) ) ( not ( = ?auto_53165 ?auto_53170 ) ) ( HOIST-AT ?auto_53169 ?auto_53165 ) ( not ( = ?auto_53166 ?auto_53169 ) ) ( SURFACE-AT ?auto_53164 ?auto_53165 ) ( ON ?auto_53164 ?auto_53167 ) ( CLEAR ?auto_53164 ) ( not ( = ?auto_53163 ?auto_53167 ) ) ( not ( = ?auto_53164 ?auto_53167 ) ) ( not ( = ?auto_53159 ?auto_53167 ) ) ( SURFACE-AT ?auto_53159 ?auto_53170 ) ( CLEAR ?auto_53159 ) ( IS-CRATE ?auto_53163 ) ( AVAILABLE ?auto_53166 ) ( TRUCK-AT ?auto_53168 ?auto_53165 ) ( LIFTING ?auto_53169 ?auto_53163 ) ( ON ?auto_53161 ?auto_53160 ) ( ON ?auto_53162 ?auto_53161 ) ( ON ?auto_53159 ?auto_53162 ) ( not ( = ?auto_53160 ?auto_53161 ) ) ( not ( = ?auto_53160 ?auto_53162 ) ) ( not ( = ?auto_53160 ?auto_53159 ) ) ( not ( = ?auto_53160 ?auto_53163 ) ) ( not ( = ?auto_53160 ?auto_53164 ) ) ( not ( = ?auto_53160 ?auto_53167 ) ) ( not ( = ?auto_53161 ?auto_53162 ) ) ( not ( = ?auto_53161 ?auto_53159 ) ) ( not ( = ?auto_53161 ?auto_53163 ) ) ( not ( = ?auto_53161 ?auto_53164 ) ) ( not ( = ?auto_53161 ?auto_53167 ) ) ( not ( = ?auto_53162 ?auto_53159 ) ) ( not ( = ?auto_53162 ?auto_53163 ) ) ( not ( = ?auto_53162 ?auto_53164 ) ) ( not ( = ?auto_53162 ?auto_53167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53159 ?auto_53163 ?auto_53164 )
      ( MAKE-5CRATE-VERIFY ?auto_53160 ?auto_53161 ?auto_53162 ?auto_53159 ?auto_53163 ?auto_53164 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_53172 - SURFACE
      ?auto_53173 - SURFACE
      ?auto_53174 - SURFACE
      ?auto_53171 - SURFACE
      ?auto_53175 - SURFACE
      ?auto_53177 - SURFACE
      ?auto_53176 - SURFACE
    )
    :vars
    (
      ?auto_53179 - HOIST
      ?auto_53183 - PLACE
      ?auto_53178 - PLACE
      ?auto_53182 - HOIST
      ?auto_53180 - SURFACE
      ?auto_53181 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53179 ?auto_53183 ) ( IS-CRATE ?auto_53176 ) ( not ( = ?auto_53177 ?auto_53176 ) ) ( not ( = ?auto_53175 ?auto_53177 ) ) ( not ( = ?auto_53175 ?auto_53176 ) ) ( not ( = ?auto_53178 ?auto_53183 ) ) ( HOIST-AT ?auto_53182 ?auto_53178 ) ( not ( = ?auto_53179 ?auto_53182 ) ) ( SURFACE-AT ?auto_53176 ?auto_53178 ) ( ON ?auto_53176 ?auto_53180 ) ( CLEAR ?auto_53176 ) ( not ( = ?auto_53177 ?auto_53180 ) ) ( not ( = ?auto_53176 ?auto_53180 ) ) ( not ( = ?auto_53175 ?auto_53180 ) ) ( SURFACE-AT ?auto_53175 ?auto_53183 ) ( CLEAR ?auto_53175 ) ( IS-CRATE ?auto_53177 ) ( AVAILABLE ?auto_53179 ) ( TRUCK-AT ?auto_53181 ?auto_53178 ) ( LIFTING ?auto_53182 ?auto_53177 ) ( ON ?auto_53173 ?auto_53172 ) ( ON ?auto_53174 ?auto_53173 ) ( ON ?auto_53171 ?auto_53174 ) ( ON ?auto_53175 ?auto_53171 ) ( not ( = ?auto_53172 ?auto_53173 ) ) ( not ( = ?auto_53172 ?auto_53174 ) ) ( not ( = ?auto_53172 ?auto_53171 ) ) ( not ( = ?auto_53172 ?auto_53175 ) ) ( not ( = ?auto_53172 ?auto_53177 ) ) ( not ( = ?auto_53172 ?auto_53176 ) ) ( not ( = ?auto_53172 ?auto_53180 ) ) ( not ( = ?auto_53173 ?auto_53174 ) ) ( not ( = ?auto_53173 ?auto_53171 ) ) ( not ( = ?auto_53173 ?auto_53175 ) ) ( not ( = ?auto_53173 ?auto_53177 ) ) ( not ( = ?auto_53173 ?auto_53176 ) ) ( not ( = ?auto_53173 ?auto_53180 ) ) ( not ( = ?auto_53174 ?auto_53171 ) ) ( not ( = ?auto_53174 ?auto_53175 ) ) ( not ( = ?auto_53174 ?auto_53177 ) ) ( not ( = ?auto_53174 ?auto_53176 ) ) ( not ( = ?auto_53174 ?auto_53180 ) ) ( not ( = ?auto_53171 ?auto_53175 ) ) ( not ( = ?auto_53171 ?auto_53177 ) ) ( not ( = ?auto_53171 ?auto_53176 ) ) ( not ( = ?auto_53171 ?auto_53180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53175 ?auto_53177 ?auto_53176 )
      ( MAKE-6CRATE-VERIFY ?auto_53172 ?auto_53173 ?auto_53174 ?auto_53171 ?auto_53175 ?auto_53177 ?auto_53176 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_53184 - SURFACE
      ?auto_53185 - SURFACE
    )
    :vars
    (
      ?auto_53187 - HOIST
      ?auto_53191 - PLACE
      ?auto_53192 - SURFACE
      ?auto_53186 - PLACE
      ?auto_53190 - HOIST
      ?auto_53188 - SURFACE
      ?auto_53189 - TRUCK
      ?auto_53193 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53187 ?auto_53191 ) ( IS-CRATE ?auto_53185 ) ( not ( = ?auto_53184 ?auto_53185 ) ) ( not ( = ?auto_53192 ?auto_53184 ) ) ( not ( = ?auto_53192 ?auto_53185 ) ) ( not ( = ?auto_53186 ?auto_53191 ) ) ( HOIST-AT ?auto_53190 ?auto_53186 ) ( not ( = ?auto_53187 ?auto_53190 ) ) ( SURFACE-AT ?auto_53185 ?auto_53186 ) ( ON ?auto_53185 ?auto_53188 ) ( CLEAR ?auto_53185 ) ( not ( = ?auto_53184 ?auto_53188 ) ) ( not ( = ?auto_53185 ?auto_53188 ) ) ( not ( = ?auto_53192 ?auto_53188 ) ) ( SURFACE-AT ?auto_53192 ?auto_53191 ) ( CLEAR ?auto_53192 ) ( IS-CRATE ?auto_53184 ) ( AVAILABLE ?auto_53187 ) ( TRUCK-AT ?auto_53189 ?auto_53186 ) ( AVAILABLE ?auto_53190 ) ( SURFACE-AT ?auto_53184 ?auto_53186 ) ( ON ?auto_53184 ?auto_53193 ) ( CLEAR ?auto_53184 ) ( not ( = ?auto_53184 ?auto_53193 ) ) ( not ( = ?auto_53185 ?auto_53193 ) ) ( not ( = ?auto_53192 ?auto_53193 ) ) ( not ( = ?auto_53188 ?auto_53193 ) ) )
    :subtasks
    ( ( !LIFT ?auto_53190 ?auto_53184 ?auto_53193 ?auto_53186 )
      ( MAKE-2CRATE ?auto_53192 ?auto_53184 ?auto_53185 )
      ( MAKE-1CRATE-VERIFY ?auto_53184 ?auto_53185 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_53194 - SURFACE
      ?auto_53195 - SURFACE
      ?auto_53196 - SURFACE
    )
    :vars
    (
      ?auto_53198 - HOIST
      ?auto_53200 - PLACE
      ?auto_53197 - PLACE
      ?auto_53202 - HOIST
      ?auto_53203 - SURFACE
      ?auto_53199 - TRUCK
      ?auto_53201 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53198 ?auto_53200 ) ( IS-CRATE ?auto_53196 ) ( not ( = ?auto_53195 ?auto_53196 ) ) ( not ( = ?auto_53194 ?auto_53195 ) ) ( not ( = ?auto_53194 ?auto_53196 ) ) ( not ( = ?auto_53197 ?auto_53200 ) ) ( HOIST-AT ?auto_53202 ?auto_53197 ) ( not ( = ?auto_53198 ?auto_53202 ) ) ( SURFACE-AT ?auto_53196 ?auto_53197 ) ( ON ?auto_53196 ?auto_53203 ) ( CLEAR ?auto_53196 ) ( not ( = ?auto_53195 ?auto_53203 ) ) ( not ( = ?auto_53196 ?auto_53203 ) ) ( not ( = ?auto_53194 ?auto_53203 ) ) ( SURFACE-AT ?auto_53194 ?auto_53200 ) ( CLEAR ?auto_53194 ) ( IS-CRATE ?auto_53195 ) ( AVAILABLE ?auto_53198 ) ( TRUCK-AT ?auto_53199 ?auto_53197 ) ( AVAILABLE ?auto_53202 ) ( SURFACE-AT ?auto_53195 ?auto_53197 ) ( ON ?auto_53195 ?auto_53201 ) ( CLEAR ?auto_53195 ) ( not ( = ?auto_53195 ?auto_53201 ) ) ( not ( = ?auto_53196 ?auto_53201 ) ) ( not ( = ?auto_53194 ?auto_53201 ) ) ( not ( = ?auto_53203 ?auto_53201 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_53195 ?auto_53196 )
      ( MAKE-2CRATE-VERIFY ?auto_53194 ?auto_53195 ?auto_53196 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_53205 - SURFACE
      ?auto_53206 - SURFACE
      ?auto_53207 - SURFACE
      ?auto_53204 - SURFACE
    )
    :vars
    (
      ?auto_53212 - HOIST
      ?auto_53211 - PLACE
      ?auto_53213 - PLACE
      ?auto_53209 - HOIST
      ?auto_53210 - SURFACE
      ?auto_53214 - TRUCK
      ?auto_53208 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53212 ?auto_53211 ) ( IS-CRATE ?auto_53204 ) ( not ( = ?auto_53207 ?auto_53204 ) ) ( not ( = ?auto_53206 ?auto_53207 ) ) ( not ( = ?auto_53206 ?auto_53204 ) ) ( not ( = ?auto_53213 ?auto_53211 ) ) ( HOIST-AT ?auto_53209 ?auto_53213 ) ( not ( = ?auto_53212 ?auto_53209 ) ) ( SURFACE-AT ?auto_53204 ?auto_53213 ) ( ON ?auto_53204 ?auto_53210 ) ( CLEAR ?auto_53204 ) ( not ( = ?auto_53207 ?auto_53210 ) ) ( not ( = ?auto_53204 ?auto_53210 ) ) ( not ( = ?auto_53206 ?auto_53210 ) ) ( SURFACE-AT ?auto_53206 ?auto_53211 ) ( CLEAR ?auto_53206 ) ( IS-CRATE ?auto_53207 ) ( AVAILABLE ?auto_53212 ) ( TRUCK-AT ?auto_53214 ?auto_53213 ) ( AVAILABLE ?auto_53209 ) ( SURFACE-AT ?auto_53207 ?auto_53213 ) ( ON ?auto_53207 ?auto_53208 ) ( CLEAR ?auto_53207 ) ( not ( = ?auto_53207 ?auto_53208 ) ) ( not ( = ?auto_53204 ?auto_53208 ) ) ( not ( = ?auto_53206 ?auto_53208 ) ) ( not ( = ?auto_53210 ?auto_53208 ) ) ( ON ?auto_53206 ?auto_53205 ) ( not ( = ?auto_53205 ?auto_53206 ) ) ( not ( = ?auto_53205 ?auto_53207 ) ) ( not ( = ?auto_53205 ?auto_53204 ) ) ( not ( = ?auto_53205 ?auto_53210 ) ) ( not ( = ?auto_53205 ?auto_53208 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53206 ?auto_53207 ?auto_53204 )
      ( MAKE-3CRATE-VERIFY ?auto_53205 ?auto_53206 ?auto_53207 ?auto_53204 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_53216 - SURFACE
      ?auto_53217 - SURFACE
      ?auto_53218 - SURFACE
      ?auto_53215 - SURFACE
      ?auto_53219 - SURFACE
    )
    :vars
    (
      ?auto_53224 - HOIST
      ?auto_53223 - PLACE
      ?auto_53225 - PLACE
      ?auto_53221 - HOIST
      ?auto_53222 - SURFACE
      ?auto_53226 - TRUCK
      ?auto_53220 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53224 ?auto_53223 ) ( IS-CRATE ?auto_53219 ) ( not ( = ?auto_53215 ?auto_53219 ) ) ( not ( = ?auto_53218 ?auto_53215 ) ) ( not ( = ?auto_53218 ?auto_53219 ) ) ( not ( = ?auto_53225 ?auto_53223 ) ) ( HOIST-AT ?auto_53221 ?auto_53225 ) ( not ( = ?auto_53224 ?auto_53221 ) ) ( SURFACE-AT ?auto_53219 ?auto_53225 ) ( ON ?auto_53219 ?auto_53222 ) ( CLEAR ?auto_53219 ) ( not ( = ?auto_53215 ?auto_53222 ) ) ( not ( = ?auto_53219 ?auto_53222 ) ) ( not ( = ?auto_53218 ?auto_53222 ) ) ( SURFACE-AT ?auto_53218 ?auto_53223 ) ( CLEAR ?auto_53218 ) ( IS-CRATE ?auto_53215 ) ( AVAILABLE ?auto_53224 ) ( TRUCK-AT ?auto_53226 ?auto_53225 ) ( AVAILABLE ?auto_53221 ) ( SURFACE-AT ?auto_53215 ?auto_53225 ) ( ON ?auto_53215 ?auto_53220 ) ( CLEAR ?auto_53215 ) ( not ( = ?auto_53215 ?auto_53220 ) ) ( not ( = ?auto_53219 ?auto_53220 ) ) ( not ( = ?auto_53218 ?auto_53220 ) ) ( not ( = ?auto_53222 ?auto_53220 ) ) ( ON ?auto_53217 ?auto_53216 ) ( ON ?auto_53218 ?auto_53217 ) ( not ( = ?auto_53216 ?auto_53217 ) ) ( not ( = ?auto_53216 ?auto_53218 ) ) ( not ( = ?auto_53216 ?auto_53215 ) ) ( not ( = ?auto_53216 ?auto_53219 ) ) ( not ( = ?auto_53216 ?auto_53222 ) ) ( not ( = ?auto_53216 ?auto_53220 ) ) ( not ( = ?auto_53217 ?auto_53218 ) ) ( not ( = ?auto_53217 ?auto_53215 ) ) ( not ( = ?auto_53217 ?auto_53219 ) ) ( not ( = ?auto_53217 ?auto_53222 ) ) ( not ( = ?auto_53217 ?auto_53220 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53218 ?auto_53215 ?auto_53219 )
      ( MAKE-4CRATE-VERIFY ?auto_53216 ?auto_53217 ?auto_53218 ?auto_53215 ?auto_53219 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_53228 - SURFACE
      ?auto_53229 - SURFACE
      ?auto_53230 - SURFACE
      ?auto_53227 - SURFACE
      ?auto_53231 - SURFACE
      ?auto_53232 - SURFACE
    )
    :vars
    (
      ?auto_53237 - HOIST
      ?auto_53236 - PLACE
      ?auto_53238 - PLACE
      ?auto_53234 - HOIST
      ?auto_53235 - SURFACE
      ?auto_53239 - TRUCK
      ?auto_53233 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53237 ?auto_53236 ) ( IS-CRATE ?auto_53232 ) ( not ( = ?auto_53231 ?auto_53232 ) ) ( not ( = ?auto_53227 ?auto_53231 ) ) ( not ( = ?auto_53227 ?auto_53232 ) ) ( not ( = ?auto_53238 ?auto_53236 ) ) ( HOIST-AT ?auto_53234 ?auto_53238 ) ( not ( = ?auto_53237 ?auto_53234 ) ) ( SURFACE-AT ?auto_53232 ?auto_53238 ) ( ON ?auto_53232 ?auto_53235 ) ( CLEAR ?auto_53232 ) ( not ( = ?auto_53231 ?auto_53235 ) ) ( not ( = ?auto_53232 ?auto_53235 ) ) ( not ( = ?auto_53227 ?auto_53235 ) ) ( SURFACE-AT ?auto_53227 ?auto_53236 ) ( CLEAR ?auto_53227 ) ( IS-CRATE ?auto_53231 ) ( AVAILABLE ?auto_53237 ) ( TRUCK-AT ?auto_53239 ?auto_53238 ) ( AVAILABLE ?auto_53234 ) ( SURFACE-AT ?auto_53231 ?auto_53238 ) ( ON ?auto_53231 ?auto_53233 ) ( CLEAR ?auto_53231 ) ( not ( = ?auto_53231 ?auto_53233 ) ) ( not ( = ?auto_53232 ?auto_53233 ) ) ( not ( = ?auto_53227 ?auto_53233 ) ) ( not ( = ?auto_53235 ?auto_53233 ) ) ( ON ?auto_53229 ?auto_53228 ) ( ON ?auto_53230 ?auto_53229 ) ( ON ?auto_53227 ?auto_53230 ) ( not ( = ?auto_53228 ?auto_53229 ) ) ( not ( = ?auto_53228 ?auto_53230 ) ) ( not ( = ?auto_53228 ?auto_53227 ) ) ( not ( = ?auto_53228 ?auto_53231 ) ) ( not ( = ?auto_53228 ?auto_53232 ) ) ( not ( = ?auto_53228 ?auto_53235 ) ) ( not ( = ?auto_53228 ?auto_53233 ) ) ( not ( = ?auto_53229 ?auto_53230 ) ) ( not ( = ?auto_53229 ?auto_53227 ) ) ( not ( = ?auto_53229 ?auto_53231 ) ) ( not ( = ?auto_53229 ?auto_53232 ) ) ( not ( = ?auto_53229 ?auto_53235 ) ) ( not ( = ?auto_53229 ?auto_53233 ) ) ( not ( = ?auto_53230 ?auto_53227 ) ) ( not ( = ?auto_53230 ?auto_53231 ) ) ( not ( = ?auto_53230 ?auto_53232 ) ) ( not ( = ?auto_53230 ?auto_53235 ) ) ( not ( = ?auto_53230 ?auto_53233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53227 ?auto_53231 ?auto_53232 )
      ( MAKE-5CRATE-VERIFY ?auto_53228 ?auto_53229 ?auto_53230 ?auto_53227 ?auto_53231 ?auto_53232 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_53241 - SURFACE
      ?auto_53242 - SURFACE
      ?auto_53243 - SURFACE
      ?auto_53240 - SURFACE
      ?auto_53244 - SURFACE
      ?auto_53246 - SURFACE
      ?auto_53245 - SURFACE
    )
    :vars
    (
      ?auto_53251 - HOIST
      ?auto_53250 - PLACE
      ?auto_53252 - PLACE
      ?auto_53248 - HOIST
      ?auto_53249 - SURFACE
      ?auto_53253 - TRUCK
      ?auto_53247 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53251 ?auto_53250 ) ( IS-CRATE ?auto_53245 ) ( not ( = ?auto_53246 ?auto_53245 ) ) ( not ( = ?auto_53244 ?auto_53246 ) ) ( not ( = ?auto_53244 ?auto_53245 ) ) ( not ( = ?auto_53252 ?auto_53250 ) ) ( HOIST-AT ?auto_53248 ?auto_53252 ) ( not ( = ?auto_53251 ?auto_53248 ) ) ( SURFACE-AT ?auto_53245 ?auto_53252 ) ( ON ?auto_53245 ?auto_53249 ) ( CLEAR ?auto_53245 ) ( not ( = ?auto_53246 ?auto_53249 ) ) ( not ( = ?auto_53245 ?auto_53249 ) ) ( not ( = ?auto_53244 ?auto_53249 ) ) ( SURFACE-AT ?auto_53244 ?auto_53250 ) ( CLEAR ?auto_53244 ) ( IS-CRATE ?auto_53246 ) ( AVAILABLE ?auto_53251 ) ( TRUCK-AT ?auto_53253 ?auto_53252 ) ( AVAILABLE ?auto_53248 ) ( SURFACE-AT ?auto_53246 ?auto_53252 ) ( ON ?auto_53246 ?auto_53247 ) ( CLEAR ?auto_53246 ) ( not ( = ?auto_53246 ?auto_53247 ) ) ( not ( = ?auto_53245 ?auto_53247 ) ) ( not ( = ?auto_53244 ?auto_53247 ) ) ( not ( = ?auto_53249 ?auto_53247 ) ) ( ON ?auto_53242 ?auto_53241 ) ( ON ?auto_53243 ?auto_53242 ) ( ON ?auto_53240 ?auto_53243 ) ( ON ?auto_53244 ?auto_53240 ) ( not ( = ?auto_53241 ?auto_53242 ) ) ( not ( = ?auto_53241 ?auto_53243 ) ) ( not ( = ?auto_53241 ?auto_53240 ) ) ( not ( = ?auto_53241 ?auto_53244 ) ) ( not ( = ?auto_53241 ?auto_53246 ) ) ( not ( = ?auto_53241 ?auto_53245 ) ) ( not ( = ?auto_53241 ?auto_53249 ) ) ( not ( = ?auto_53241 ?auto_53247 ) ) ( not ( = ?auto_53242 ?auto_53243 ) ) ( not ( = ?auto_53242 ?auto_53240 ) ) ( not ( = ?auto_53242 ?auto_53244 ) ) ( not ( = ?auto_53242 ?auto_53246 ) ) ( not ( = ?auto_53242 ?auto_53245 ) ) ( not ( = ?auto_53242 ?auto_53249 ) ) ( not ( = ?auto_53242 ?auto_53247 ) ) ( not ( = ?auto_53243 ?auto_53240 ) ) ( not ( = ?auto_53243 ?auto_53244 ) ) ( not ( = ?auto_53243 ?auto_53246 ) ) ( not ( = ?auto_53243 ?auto_53245 ) ) ( not ( = ?auto_53243 ?auto_53249 ) ) ( not ( = ?auto_53243 ?auto_53247 ) ) ( not ( = ?auto_53240 ?auto_53244 ) ) ( not ( = ?auto_53240 ?auto_53246 ) ) ( not ( = ?auto_53240 ?auto_53245 ) ) ( not ( = ?auto_53240 ?auto_53249 ) ) ( not ( = ?auto_53240 ?auto_53247 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53244 ?auto_53246 ?auto_53245 )
      ( MAKE-6CRATE-VERIFY ?auto_53241 ?auto_53242 ?auto_53243 ?auto_53240 ?auto_53244 ?auto_53246 ?auto_53245 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_53254 - SURFACE
      ?auto_53255 - SURFACE
    )
    :vars
    (
      ?auto_53260 - HOIST
      ?auto_53259 - PLACE
      ?auto_53263 - SURFACE
      ?auto_53261 - PLACE
      ?auto_53257 - HOIST
      ?auto_53258 - SURFACE
      ?auto_53256 - SURFACE
      ?auto_53262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53260 ?auto_53259 ) ( IS-CRATE ?auto_53255 ) ( not ( = ?auto_53254 ?auto_53255 ) ) ( not ( = ?auto_53263 ?auto_53254 ) ) ( not ( = ?auto_53263 ?auto_53255 ) ) ( not ( = ?auto_53261 ?auto_53259 ) ) ( HOIST-AT ?auto_53257 ?auto_53261 ) ( not ( = ?auto_53260 ?auto_53257 ) ) ( SURFACE-AT ?auto_53255 ?auto_53261 ) ( ON ?auto_53255 ?auto_53258 ) ( CLEAR ?auto_53255 ) ( not ( = ?auto_53254 ?auto_53258 ) ) ( not ( = ?auto_53255 ?auto_53258 ) ) ( not ( = ?auto_53263 ?auto_53258 ) ) ( SURFACE-AT ?auto_53263 ?auto_53259 ) ( CLEAR ?auto_53263 ) ( IS-CRATE ?auto_53254 ) ( AVAILABLE ?auto_53260 ) ( AVAILABLE ?auto_53257 ) ( SURFACE-AT ?auto_53254 ?auto_53261 ) ( ON ?auto_53254 ?auto_53256 ) ( CLEAR ?auto_53254 ) ( not ( = ?auto_53254 ?auto_53256 ) ) ( not ( = ?auto_53255 ?auto_53256 ) ) ( not ( = ?auto_53263 ?auto_53256 ) ) ( not ( = ?auto_53258 ?auto_53256 ) ) ( TRUCK-AT ?auto_53262 ?auto_53259 ) )
    :subtasks
    ( ( !DRIVE ?auto_53262 ?auto_53259 ?auto_53261 )
      ( MAKE-2CRATE ?auto_53263 ?auto_53254 ?auto_53255 )
      ( MAKE-1CRATE-VERIFY ?auto_53254 ?auto_53255 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_53264 - SURFACE
      ?auto_53265 - SURFACE
      ?auto_53266 - SURFACE
    )
    :vars
    (
      ?auto_53273 - HOIST
      ?auto_53271 - PLACE
      ?auto_53267 - PLACE
      ?auto_53268 - HOIST
      ?auto_53269 - SURFACE
      ?auto_53270 - SURFACE
      ?auto_53272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53273 ?auto_53271 ) ( IS-CRATE ?auto_53266 ) ( not ( = ?auto_53265 ?auto_53266 ) ) ( not ( = ?auto_53264 ?auto_53265 ) ) ( not ( = ?auto_53264 ?auto_53266 ) ) ( not ( = ?auto_53267 ?auto_53271 ) ) ( HOIST-AT ?auto_53268 ?auto_53267 ) ( not ( = ?auto_53273 ?auto_53268 ) ) ( SURFACE-AT ?auto_53266 ?auto_53267 ) ( ON ?auto_53266 ?auto_53269 ) ( CLEAR ?auto_53266 ) ( not ( = ?auto_53265 ?auto_53269 ) ) ( not ( = ?auto_53266 ?auto_53269 ) ) ( not ( = ?auto_53264 ?auto_53269 ) ) ( SURFACE-AT ?auto_53264 ?auto_53271 ) ( CLEAR ?auto_53264 ) ( IS-CRATE ?auto_53265 ) ( AVAILABLE ?auto_53273 ) ( AVAILABLE ?auto_53268 ) ( SURFACE-AT ?auto_53265 ?auto_53267 ) ( ON ?auto_53265 ?auto_53270 ) ( CLEAR ?auto_53265 ) ( not ( = ?auto_53265 ?auto_53270 ) ) ( not ( = ?auto_53266 ?auto_53270 ) ) ( not ( = ?auto_53264 ?auto_53270 ) ) ( not ( = ?auto_53269 ?auto_53270 ) ) ( TRUCK-AT ?auto_53272 ?auto_53271 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_53265 ?auto_53266 )
      ( MAKE-2CRATE-VERIFY ?auto_53264 ?auto_53265 ?auto_53266 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_53275 - SURFACE
      ?auto_53276 - SURFACE
      ?auto_53277 - SURFACE
      ?auto_53274 - SURFACE
    )
    :vars
    (
      ?auto_53279 - HOIST
      ?auto_53278 - PLACE
      ?auto_53284 - PLACE
      ?auto_53283 - HOIST
      ?auto_53280 - SURFACE
      ?auto_53281 - SURFACE
      ?auto_53282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53279 ?auto_53278 ) ( IS-CRATE ?auto_53274 ) ( not ( = ?auto_53277 ?auto_53274 ) ) ( not ( = ?auto_53276 ?auto_53277 ) ) ( not ( = ?auto_53276 ?auto_53274 ) ) ( not ( = ?auto_53284 ?auto_53278 ) ) ( HOIST-AT ?auto_53283 ?auto_53284 ) ( not ( = ?auto_53279 ?auto_53283 ) ) ( SURFACE-AT ?auto_53274 ?auto_53284 ) ( ON ?auto_53274 ?auto_53280 ) ( CLEAR ?auto_53274 ) ( not ( = ?auto_53277 ?auto_53280 ) ) ( not ( = ?auto_53274 ?auto_53280 ) ) ( not ( = ?auto_53276 ?auto_53280 ) ) ( SURFACE-AT ?auto_53276 ?auto_53278 ) ( CLEAR ?auto_53276 ) ( IS-CRATE ?auto_53277 ) ( AVAILABLE ?auto_53279 ) ( AVAILABLE ?auto_53283 ) ( SURFACE-AT ?auto_53277 ?auto_53284 ) ( ON ?auto_53277 ?auto_53281 ) ( CLEAR ?auto_53277 ) ( not ( = ?auto_53277 ?auto_53281 ) ) ( not ( = ?auto_53274 ?auto_53281 ) ) ( not ( = ?auto_53276 ?auto_53281 ) ) ( not ( = ?auto_53280 ?auto_53281 ) ) ( TRUCK-AT ?auto_53282 ?auto_53278 ) ( ON ?auto_53276 ?auto_53275 ) ( not ( = ?auto_53275 ?auto_53276 ) ) ( not ( = ?auto_53275 ?auto_53277 ) ) ( not ( = ?auto_53275 ?auto_53274 ) ) ( not ( = ?auto_53275 ?auto_53280 ) ) ( not ( = ?auto_53275 ?auto_53281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53276 ?auto_53277 ?auto_53274 )
      ( MAKE-3CRATE-VERIFY ?auto_53275 ?auto_53276 ?auto_53277 ?auto_53274 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_53286 - SURFACE
      ?auto_53287 - SURFACE
      ?auto_53288 - SURFACE
      ?auto_53285 - SURFACE
      ?auto_53289 - SURFACE
    )
    :vars
    (
      ?auto_53291 - HOIST
      ?auto_53290 - PLACE
      ?auto_53296 - PLACE
      ?auto_53295 - HOIST
      ?auto_53292 - SURFACE
      ?auto_53293 - SURFACE
      ?auto_53294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53291 ?auto_53290 ) ( IS-CRATE ?auto_53289 ) ( not ( = ?auto_53285 ?auto_53289 ) ) ( not ( = ?auto_53288 ?auto_53285 ) ) ( not ( = ?auto_53288 ?auto_53289 ) ) ( not ( = ?auto_53296 ?auto_53290 ) ) ( HOIST-AT ?auto_53295 ?auto_53296 ) ( not ( = ?auto_53291 ?auto_53295 ) ) ( SURFACE-AT ?auto_53289 ?auto_53296 ) ( ON ?auto_53289 ?auto_53292 ) ( CLEAR ?auto_53289 ) ( not ( = ?auto_53285 ?auto_53292 ) ) ( not ( = ?auto_53289 ?auto_53292 ) ) ( not ( = ?auto_53288 ?auto_53292 ) ) ( SURFACE-AT ?auto_53288 ?auto_53290 ) ( CLEAR ?auto_53288 ) ( IS-CRATE ?auto_53285 ) ( AVAILABLE ?auto_53291 ) ( AVAILABLE ?auto_53295 ) ( SURFACE-AT ?auto_53285 ?auto_53296 ) ( ON ?auto_53285 ?auto_53293 ) ( CLEAR ?auto_53285 ) ( not ( = ?auto_53285 ?auto_53293 ) ) ( not ( = ?auto_53289 ?auto_53293 ) ) ( not ( = ?auto_53288 ?auto_53293 ) ) ( not ( = ?auto_53292 ?auto_53293 ) ) ( TRUCK-AT ?auto_53294 ?auto_53290 ) ( ON ?auto_53287 ?auto_53286 ) ( ON ?auto_53288 ?auto_53287 ) ( not ( = ?auto_53286 ?auto_53287 ) ) ( not ( = ?auto_53286 ?auto_53288 ) ) ( not ( = ?auto_53286 ?auto_53285 ) ) ( not ( = ?auto_53286 ?auto_53289 ) ) ( not ( = ?auto_53286 ?auto_53292 ) ) ( not ( = ?auto_53286 ?auto_53293 ) ) ( not ( = ?auto_53287 ?auto_53288 ) ) ( not ( = ?auto_53287 ?auto_53285 ) ) ( not ( = ?auto_53287 ?auto_53289 ) ) ( not ( = ?auto_53287 ?auto_53292 ) ) ( not ( = ?auto_53287 ?auto_53293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53288 ?auto_53285 ?auto_53289 )
      ( MAKE-4CRATE-VERIFY ?auto_53286 ?auto_53287 ?auto_53288 ?auto_53285 ?auto_53289 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_53298 - SURFACE
      ?auto_53299 - SURFACE
      ?auto_53300 - SURFACE
      ?auto_53297 - SURFACE
      ?auto_53301 - SURFACE
      ?auto_53302 - SURFACE
    )
    :vars
    (
      ?auto_53304 - HOIST
      ?auto_53303 - PLACE
      ?auto_53309 - PLACE
      ?auto_53308 - HOIST
      ?auto_53305 - SURFACE
      ?auto_53306 - SURFACE
      ?auto_53307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53304 ?auto_53303 ) ( IS-CRATE ?auto_53302 ) ( not ( = ?auto_53301 ?auto_53302 ) ) ( not ( = ?auto_53297 ?auto_53301 ) ) ( not ( = ?auto_53297 ?auto_53302 ) ) ( not ( = ?auto_53309 ?auto_53303 ) ) ( HOIST-AT ?auto_53308 ?auto_53309 ) ( not ( = ?auto_53304 ?auto_53308 ) ) ( SURFACE-AT ?auto_53302 ?auto_53309 ) ( ON ?auto_53302 ?auto_53305 ) ( CLEAR ?auto_53302 ) ( not ( = ?auto_53301 ?auto_53305 ) ) ( not ( = ?auto_53302 ?auto_53305 ) ) ( not ( = ?auto_53297 ?auto_53305 ) ) ( SURFACE-AT ?auto_53297 ?auto_53303 ) ( CLEAR ?auto_53297 ) ( IS-CRATE ?auto_53301 ) ( AVAILABLE ?auto_53304 ) ( AVAILABLE ?auto_53308 ) ( SURFACE-AT ?auto_53301 ?auto_53309 ) ( ON ?auto_53301 ?auto_53306 ) ( CLEAR ?auto_53301 ) ( not ( = ?auto_53301 ?auto_53306 ) ) ( not ( = ?auto_53302 ?auto_53306 ) ) ( not ( = ?auto_53297 ?auto_53306 ) ) ( not ( = ?auto_53305 ?auto_53306 ) ) ( TRUCK-AT ?auto_53307 ?auto_53303 ) ( ON ?auto_53299 ?auto_53298 ) ( ON ?auto_53300 ?auto_53299 ) ( ON ?auto_53297 ?auto_53300 ) ( not ( = ?auto_53298 ?auto_53299 ) ) ( not ( = ?auto_53298 ?auto_53300 ) ) ( not ( = ?auto_53298 ?auto_53297 ) ) ( not ( = ?auto_53298 ?auto_53301 ) ) ( not ( = ?auto_53298 ?auto_53302 ) ) ( not ( = ?auto_53298 ?auto_53305 ) ) ( not ( = ?auto_53298 ?auto_53306 ) ) ( not ( = ?auto_53299 ?auto_53300 ) ) ( not ( = ?auto_53299 ?auto_53297 ) ) ( not ( = ?auto_53299 ?auto_53301 ) ) ( not ( = ?auto_53299 ?auto_53302 ) ) ( not ( = ?auto_53299 ?auto_53305 ) ) ( not ( = ?auto_53299 ?auto_53306 ) ) ( not ( = ?auto_53300 ?auto_53297 ) ) ( not ( = ?auto_53300 ?auto_53301 ) ) ( not ( = ?auto_53300 ?auto_53302 ) ) ( not ( = ?auto_53300 ?auto_53305 ) ) ( not ( = ?auto_53300 ?auto_53306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53297 ?auto_53301 ?auto_53302 )
      ( MAKE-5CRATE-VERIFY ?auto_53298 ?auto_53299 ?auto_53300 ?auto_53297 ?auto_53301 ?auto_53302 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_53311 - SURFACE
      ?auto_53312 - SURFACE
      ?auto_53313 - SURFACE
      ?auto_53310 - SURFACE
      ?auto_53314 - SURFACE
      ?auto_53316 - SURFACE
      ?auto_53315 - SURFACE
    )
    :vars
    (
      ?auto_53318 - HOIST
      ?auto_53317 - PLACE
      ?auto_53323 - PLACE
      ?auto_53322 - HOIST
      ?auto_53319 - SURFACE
      ?auto_53320 - SURFACE
      ?auto_53321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53318 ?auto_53317 ) ( IS-CRATE ?auto_53315 ) ( not ( = ?auto_53316 ?auto_53315 ) ) ( not ( = ?auto_53314 ?auto_53316 ) ) ( not ( = ?auto_53314 ?auto_53315 ) ) ( not ( = ?auto_53323 ?auto_53317 ) ) ( HOIST-AT ?auto_53322 ?auto_53323 ) ( not ( = ?auto_53318 ?auto_53322 ) ) ( SURFACE-AT ?auto_53315 ?auto_53323 ) ( ON ?auto_53315 ?auto_53319 ) ( CLEAR ?auto_53315 ) ( not ( = ?auto_53316 ?auto_53319 ) ) ( not ( = ?auto_53315 ?auto_53319 ) ) ( not ( = ?auto_53314 ?auto_53319 ) ) ( SURFACE-AT ?auto_53314 ?auto_53317 ) ( CLEAR ?auto_53314 ) ( IS-CRATE ?auto_53316 ) ( AVAILABLE ?auto_53318 ) ( AVAILABLE ?auto_53322 ) ( SURFACE-AT ?auto_53316 ?auto_53323 ) ( ON ?auto_53316 ?auto_53320 ) ( CLEAR ?auto_53316 ) ( not ( = ?auto_53316 ?auto_53320 ) ) ( not ( = ?auto_53315 ?auto_53320 ) ) ( not ( = ?auto_53314 ?auto_53320 ) ) ( not ( = ?auto_53319 ?auto_53320 ) ) ( TRUCK-AT ?auto_53321 ?auto_53317 ) ( ON ?auto_53312 ?auto_53311 ) ( ON ?auto_53313 ?auto_53312 ) ( ON ?auto_53310 ?auto_53313 ) ( ON ?auto_53314 ?auto_53310 ) ( not ( = ?auto_53311 ?auto_53312 ) ) ( not ( = ?auto_53311 ?auto_53313 ) ) ( not ( = ?auto_53311 ?auto_53310 ) ) ( not ( = ?auto_53311 ?auto_53314 ) ) ( not ( = ?auto_53311 ?auto_53316 ) ) ( not ( = ?auto_53311 ?auto_53315 ) ) ( not ( = ?auto_53311 ?auto_53319 ) ) ( not ( = ?auto_53311 ?auto_53320 ) ) ( not ( = ?auto_53312 ?auto_53313 ) ) ( not ( = ?auto_53312 ?auto_53310 ) ) ( not ( = ?auto_53312 ?auto_53314 ) ) ( not ( = ?auto_53312 ?auto_53316 ) ) ( not ( = ?auto_53312 ?auto_53315 ) ) ( not ( = ?auto_53312 ?auto_53319 ) ) ( not ( = ?auto_53312 ?auto_53320 ) ) ( not ( = ?auto_53313 ?auto_53310 ) ) ( not ( = ?auto_53313 ?auto_53314 ) ) ( not ( = ?auto_53313 ?auto_53316 ) ) ( not ( = ?auto_53313 ?auto_53315 ) ) ( not ( = ?auto_53313 ?auto_53319 ) ) ( not ( = ?auto_53313 ?auto_53320 ) ) ( not ( = ?auto_53310 ?auto_53314 ) ) ( not ( = ?auto_53310 ?auto_53316 ) ) ( not ( = ?auto_53310 ?auto_53315 ) ) ( not ( = ?auto_53310 ?auto_53319 ) ) ( not ( = ?auto_53310 ?auto_53320 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53314 ?auto_53316 ?auto_53315 )
      ( MAKE-6CRATE-VERIFY ?auto_53311 ?auto_53312 ?auto_53313 ?auto_53310 ?auto_53314 ?auto_53316 ?auto_53315 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_53324 - SURFACE
      ?auto_53325 - SURFACE
    )
    :vars
    (
      ?auto_53327 - HOIST
      ?auto_53326 - PLACE
      ?auto_53332 - SURFACE
      ?auto_53333 - PLACE
      ?auto_53331 - HOIST
      ?auto_53328 - SURFACE
      ?auto_53329 - SURFACE
      ?auto_53330 - TRUCK
      ?auto_53334 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53327 ?auto_53326 ) ( IS-CRATE ?auto_53325 ) ( not ( = ?auto_53324 ?auto_53325 ) ) ( not ( = ?auto_53332 ?auto_53324 ) ) ( not ( = ?auto_53332 ?auto_53325 ) ) ( not ( = ?auto_53333 ?auto_53326 ) ) ( HOIST-AT ?auto_53331 ?auto_53333 ) ( not ( = ?auto_53327 ?auto_53331 ) ) ( SURFACE-AT ?auto_53325 ?auto_53333 ) ( ON ?auto_53325 ?auto_53328 ) ( CLEAR ?auto_53325 ) ( not ( = ?auto_53324 ?auto_53328 ) ) ( not ( = ?auto_53325 ?auto_53328 ) ) ( not ( = ?auto_53332 ?auto_53328 ) ) ( IS-CRATE ?auto_53324 ) ( AVAILABLE ?auto_53331 ) ( SURFACE-AT ?auto_53324 ?auto_53333 ) ( ON ?auto_53324 ?auto_53329 ) ( CLEAR ?auto_53324 ) ( not ( = ?auto_53324 ?auto_53329 ) ) ( not ( = ?auto_53325 ?auto_53329 ) ) ( not ( = ?auto_53332 ?auto_53329 ) ) ( not ( = ?auto_53328 ?auto_53329 ) ) ( TRUCK-AT ?auto_53330 ?auto_53326 ) ( SURFACE-AT ?auto_53334 ?auto_53326 ) ( CLEAR ?auto_53334 ) ( LIFTING ?auto_53327 ?auto_53332 ) ( IS-CRATE ?auto_53332 ) ( not ( = ?auto_53334 ?auto_53332 ) ) ( not ( = ?auto_53324 ?auto_53334 ) ) ( not ( = ?auto_53325 ?auto_53334 ) ) ( not ( = ?auto_53328 ?auto_53334 ) ) ( not ( = ?auto_53329 ?auto_53334 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_53334 ?auto_53332 )
      ( MAKE-2CRATE ?auto_53332 ?auto_53324 ?auto_53325 )
      ( MAKE-1CRATE-VERIFY ?auto_53324 ?auto_53325 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_53335 - SURFACE
      ?auto_53336 - SURFACE
      ?auto_53337 - SURFACE
    )
    :vars
    (
      ?auto_53342 - HOIST
      ?auto_53344 - PLACE
      ?auto_53341 - PLACE
      ?auto_53343 - HOIST
      ?auto_53345 - SURFACE
      ?auto_53338 - SURFACE
      ?auto_53339 - TRUCK
      ?auto_53340 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53342 ?auto_53344 ) ( IS-CRATE ?auto_53337 ) ( not ( = ?auto_53336 ?auto_53337 ) ) ( not ( = ?auto_53335 ?auto_53336 ) ) ( not ( = ?auto_53335 ?auto_53337 ) ) ( not ( = ?auto_53341 ?auto_53344 ) ) ( HOIST-AT ?auto_53343 ?auto_53341 ) ( not ( = ?auto_53342 ?auto_53343 ) ) ( SURFACE-AT ?auto_53337 ?auto_53341 ) ( ON ?auto_53337 ?auto_53345 ) ( CLEAR ?auto_53337 ) ( not ( = ?auto_53336 ?auto_53345 ) ) ( not ( = ?auto_53337 ?auto_53345 ) ) ( not ( = ?auto_53335 ?auto_53345 ) ) ( IS-CRATE ?auto_53336 ) ( AVAILABLE ?auto_53343 ) ( SURFACE-AT ?auto_53336 ?auto_53341 ) ( ON ?auto_53336 ?auto_53338 ) ( CLEAR ?auto_53336 ) ( not ( = ?auto_53336 ?auto_53338 ) ) ( not ( = ?auto_53337 ?auto_53338 ) ) ( not ( = ?auto_53335 ?auto_53338 ) ) ( not ( = ?auto_53345 ?auto_53338 ) ) ( TRUCK-AT ?auto_53339 ?auto_53344 ) ( SURFACE-AT ?auto_53340 ?auto_53344 ) ( CLEAR ?auto_53340 ) ( LIFTING ?auto_53342 ?auto_53335 ) ( IS-CRATE ?auto_53335 ) ( not ( = ?auto_53340 ?auto_53335 ) ) ( not ( = ?auto_53336 ?auto_53340 ) ) ( not ( = ?auto_53337 ?auto_53340 ) ) ( not ( = ?auto_53345 ?auto_53340 ) ) ( not ( = ?auto_53338 ?auto_53340 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_53336 ?auto_53337 )
      ( MAKE-2CRATE-VERIFY ?auto_53335 ?auto_53336 ?auto_53337 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_53347 - SURFACE
      ?auto_53348 - SURFACE
      ?auto_53349 - SURFACE
      ?auto_53346 - SURFACE
    )
    :vars
    (
      ?auto_53355 - HOIST
      ?auto_53351 - PLACE
      ?auto_53353 - PLACE
      ?auto_53356 - HOIST
      ?auto_53354 - SURFACE
      ?auto_53352 - SURFACE
      ?auto_53350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53355 ?auto_53351 ) ( IS-CRATE ?auto_53346 ) ( not ( = ?auto_53349 ?auto_53346 ) ) ( not ( = ?auto_53348 ?auto_53349 ) ) ( not ( = ?auto_53348 ?auto_53346 ) ) ( not ( = ?auto_53353 ?auto_53351 ) ) ( HOIST-AT ?auto_53356 ?auto_53353 ) ( not ( = ?auto_53355 ?auto_53356 ) ) ( SURFACE-AT ?auto_53346 ?auto_53353 ) ( ON ?auto_53346 ?auto_53354 ) ( CLEAR ?auto_53346 ) ( not ( = ?auto_53349 ?auto_53354 ) ) ( not ( = ?auto_53346 ?auto_53354 ) ) ( not ( = ?auto_53348 ?auto_53354 ) ) ( IS-CRATE ?auto_53349 ) ( AVAILABLE ?auto_53356 ) ( SURFACE-AT ?auto_53349 ?auto_53353 ) ( ON ?auto_53349 ?auto_53352 ) ( CLEAR ?auto_53349 ) ( not ( = ?auto_53349 ?auto_53352 ) ) ( not ( = ?auto_53346 ?auto_53352 ) ) ( not ( = ?auto_53348 ?auto_53352 ) ) ( not ( = ?auto_53354 ?auto_53352 ) ) ( TRUCK-AT ?auto_53350 ?auto_53351 ) ( SURFACE-AT ?auto_53347 ?auto_53351 ) ( CLEAR ?auto_53347 ) ( LIFTING ?auto_53355 ?auto_53348 ) ( IS-CRATE ?auto_53348 ) ( not ( = ?auto_53347 ?auto_53348 ) ) ( not ( = ?auto_53349 ?auto_53347 ) ) ( not ( = ?auto_53346 ?auto_53347 ) ) ( not ( = ?auto_53354 ?auto_53347 ) ) ( not ( = ?auto_53352 ?auto_53347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53348 ?auto_53349 ?auto_53346 )
      ( MAKE-3CRATE-VERIFY ?auto_53347 ?auto_53348 ?auto_53349 ?auto_53346 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_53358 - SURFACE
      ?auto_53359 - SURFACE
      ?auto_53360 - SURFACE
      ?auto_53357 - SURFACE
      ?auto_53361 - SURFACE
    )
    :vars
    (
      ?auto_53367 - HOIST
      ?auto_53363 - PLACE
      ?auto_53365 - PLACE
      ?auto_53368 - HOIST
      ?auto_53366 - SURFACE
      ?auto_53364 - SURFACE
      ?auto_53362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53367 ?auto_53363 ) ( IS-CRATE ?auto_53361 ) ( not ( = ?auto_53357 ?auto_53361 ) ) ( not ( = ?auto_53360 ?auto_53357 ) ) ( not ( = ?auto_53360 ?auto_53361 ) ) ( not ( = ?auto_53365 ?auto_53363 ) ) ( HOIST-AT ?auto_53368 ?auto_53365 ) ( not ( = ?auto_53367 ?auto_53368 ) ) ( SURFACE-AT ?auto_53361 ?auto_53365 ) ( ON ?auto_53361 ?auto_53366 ) ( CLEAR ?auto_53361 ) ( not ( = ?auto_53357 ?auto_53366 ) ) ( not ( = ?auto_53361 ?auto_53366 ) ) ( not ( = ?auto_53360 ?auto_53366 ) ) ( IS-CRATE ?auto_53357 ) ( AVAILABLE ?auto_53368 ) ( SURFACE-AT ?auto_53357 ?auto_53365 ) ( ON ?auto_53357 ?auto_53364 ) ( CLEAR ?auto_53357 ) ( not ( = ?auto_53357 ?auto_53364 ) ) ( not ( = ?auto_53361 ?auto_53364 ) ) ( not ( = ?auto_53360 ?auto_53364 ) ) ( not ( = ?auto_53366 ?auto_53364 ) ) ( TRUCK-AT ?auto_53362 ?auto_53363 ) ( SURFACE-AT ?auto_53359 ?auto_53363 ) ( CLEAR ?auto_53359 ) ( LIFTING ?auto_53367 ?auto_53360 ) ( IS-CRATE ?auto_53360 ) ( not ( = ?auto_53359 ?auto_53360 ) ) ( not ( = ?auto_53357 ?auto_53359 ) ) ( not ( = ?auto_53361 ?auto_53359 ) ) ( not ( = ?auto_53366 ?auto_53359 ) ) ( not ( = ?auto_53364 ?auto_53359 ) ) ( ON ?auto_53359 ?auto_53358 ) ( not ( = ?auto_53358 ?auto_53359 ) ) ( not ( = ?auto_53358 ?auto_53360 ) ) ( not ( = ?auto_53358 ?auto_53357 ) ) ( not ( = ?auto_53358 ?auto_53361 ) ) ( not ( = ?auto_53358 ?auto_53366 ) ) ( not ( = ?auto_53358 ?auto_53364 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53360 ?auto_53357 ?auto_53361 )
      ( MAKE-4CRATE-VERIFY ?auto_53358 ?auto_53359 ?auto_53360 ?auto_53357 ?auto_53361 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_53370 - SURFACE
      ?auto_53371 - SURFACE
      ?auto_53372 - SURFACE
      ?auto_53369 - SURFACE
      ?auto_53373 - SURFACE
      ?auto_53374 - SURFACE
    )
    :vars
    (
      ?auto_53380 - HOIST
      ?auto_53376 - PLACE
      ?auto_53378 - PLACE
      ?auto_53381 - HOIST
      ?auto_53379 - SURFACE
      ?auto_53377 - SURFACE
      ?auto_53375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53380 ?auto_53376 ) ( IS-CRATE ?auto_53374 ) ( not ( = ?auto_53373 ?auto_53374 ) ) ( not ( = ?auto_53369 ?auto_53373 ) ) ( not ( = ?auto_53369 ?auto_53374 ) ) ( not ( = ?auto_53378 ?auto_53376 ) ) ( HOIST-AT ?auto_53381 ?auto_53378 ) ( not ( = ?auto_53380 ?auto_53381 ) ) ( SURFACE-AT ?auto_53374 ?auto_53378 ) ( ON ?auto_53374 ?auto_53379 ) ( CLEAR ?auto_53374 ) ( not ( = ?auto_53373 ?auto_53379 ) ) ( not ( = ?auto_53374 ?auto_53379 ) ) ( not ( = ?auto_53369 ?auto_53379 ) ) ( IS-CRATE ?auto_53373 ) ( AVAILABLE ?auto_53381 ) ( SURFACE-AT ?auto_53373 ?auto_53378 ) ( ON ?auto_53373 ?auto_53377 ) ( CLEAR ?auto_53373 ) ( not ( = ?auto_53373 ?auto_53377 ) ) ( not ( = ?auto_53374 ?auto_53377 ) ) ( not ( = ?auto_53369 ?auto_53377 ) ) ( not ( = ?auto_53379 ?auto_53377 ) ) ( TRUCK-AT ?auto_53375 ?auto_53376 ) ( SURFACE-AT ?auto_53372 ?auto_53376 ) ( CLEAR ?auto_53372 ) ( LIFTING ?auto_53380 ?auto_53369 ) ( IS-CRATE ?auto_53369 ) ( not ( = ?auto_53372 ?auto_53369 ) ) ( not ( = ?auto_53373 ?auto_53372 ) ) ( not ( = ?auto_53374 ?auto_53372 ) ) ( not ( = ?auto_53379 ?auto_53372 ) ) ( not ( = ?auto_53377 ?auto_53372 ) ) ( ON ?auto_53371 ?auto_53370 ) ( ON ?auto_53372 ?auto_53371 ) ( not ( = ?auto_53370 ?auto_53371 ) ) ( not ( = ?auto_53370 ?auto_53372 ) ) ( not ( = ?auto_53370 ?auto_53369 ) ) ( not ( = ?auto_53370 ?auto_53373 ) ) ( not ( = ?auto_53370 ?auto_53374 ) ) ( not ( = ?auto_53370 ?auto_53379 ) ) ( not ( = ?auto_53370 ?auto_53377 ) ) ( not ( = ?auto_53371 ?auto_53372 ) ) ( not ( = ?auto_53371 ?auto_53369 ) ) ( not ( = ?auto_53371 ?auto_53373 ) ) ( not ( = ?auto_53371 ?auto_53374 ) ) ( not ( = ?auto_53371 ?auto_53379 ) ) ( not ( = ?auto_53371 ?auto_53377 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53369 ?auto_53373 ?auto_53374 )
      ( MAKE-5CRATE-VERIFY ?auto_53370 ?auto_53371 ?auto_53372 ?auto_53369 ?auto_53373 ?auto_53374 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_53383 - SURFACE
      ?auto_53384 - SURFACE
      ?auto_53385 - SURFACE
      ?auto_53382 - SURFACE
      ?auto_53386 - SURFACE
      ?auto_53388 - SURFACE
      ?auto_53387 - SURFACE
    )
    :vars
    (
      ?auto_53394 - HOIST
      ?auto_53390 - PLACE
      ?auto_53392 - PLACE
      ?auto_53395 - HOIST
      ?auto_53393 - SURFACE
      ?auto_53391 - SURFACE
      ?auto_53389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53394 ?auto_53390 ) ( IS-CRATE ?auto_53387 ) ( not ( = ?auto_53388 ?auto_53387 ) ) ( not ( = ?auto_53386 ?auto_53388 ) ) ( not ( = ?auto_53386 ?auto_53387 ) ) ( not ( = ?auto_53392 ?auto_53390 ) ) ( HOIST-AT ?auto_53395 ?auto_53392 ) ( not ( = ?auto_53394 ?auto_53395 ) ) ( SURFACE-AT ?auto_53387 ?auto_53392 ) ( ON ?auto_53387 ?auto_53393 ) ( CLEAR ?auto_53387 ) ( not ( = ?auto_53388 ?auto_53393 ) ) ( not ( = ?auto_53387 ?auto_53393 ) ) ( not ( = ?auto_53386 ?auto_53393 ) ) ( IS-CRATE ?auto_53388 ) ( AVAILABLE ?auto_53395 ) ( SURFACE-AT ?auto_53388 ?auto_53392 ) ( ON ?auto_53388 ?auto_53391 ) ( CLEAR ?auto_53388 ) ( not ( = ?auto_53388 ?auto_53391 ) ) ( not ( = ?auto_53387 ?auto_53391 ) ) ( not ( = ?auto_53386 ?auto_53391 ) ) ( not ( = ?auto_53393 ?auto_53391 ) ) ( TRUCK-AT ?auto_53389 ?auto_53390 ) ( SURFACE-AT ?auto_53382 ?auto_53390 ) ( CLEAR ?auto_53382 ) ( LIFTING ?auto_53394 ?auto_53386 ) ( IS-CRATE ?auto_53386 ) ( not ( = ?auto_53382 ?auto_53386 ) ) ( not ( = ?auto_53388 ?auto_53382 ) ) ( not ( = ?auto_53387 ?auto_53382 ) ) ( not ( = ?auto_53393 ?auto_53382 ) ) ( not ( = ?auto_53391 ?auto_53382 ) ) ( ON ?auto_53384 ?auto_53383 ) ( ON ?auto_53385 ?auto_53384 ) ( ON ?auto_53382 ?auto_53385 ) ( not ( = ?auto_53383 ?auto_53384 ) ) ( not ( = ?auto_53383 ?auto_53385 ) ) ( not ( = ?auto_53383 ?auto_53382 ) ) ( not ( = ?auto_53383 ?auto_53386 ) ) ( not ( = ?auto_53383 ?auto_53388 ) ) ( not ( = ?auto_53383 ?auto_53387 ) ) ( not ( = ?auto_53383 ?auto_53393 ) ) ( not ( = ?auto_53383 ?auto_53391 ) ) ( not ( = ?auto_53384 ?auto_53385 ) ) ( not ( = ?auto_53384 ?auto_53382 ) ) ( not ( = ?auto_53384 ?auto_53386 ) ) ( not ( = ?auto_53384 ?auto_53388 ) ) ( not ( = ?auto_53384 ?auto_53387 ) ) ( not ( = ?auto_53384 ?auto_53393 ) ) ( not ( = ?auto_53384 ?auto_53391 ) ) ( not ( = ?auto_53385 ?auto_53382 ) ) ( not ( = ?auto_53385 ?auto_53386 ) ) ( not ( = ?auto_53385 ?auto_53388 ) ) ( not ( = ?auto_53385 ?auto_53387 ) ) ( not ( = ?auto_53385 ?auto_53393 ) ) ( not ( = ?auto_53385 ?auto_53391 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53386 ?auto_53388 ?auto_53387 )
      ( MAKE-6CRATE-VERIFY ?auto_53383 ?auto_53384 ?auto_53385 ?auto_53382 ?auto_53386 ?auto_53388 ?auto_53387 ) )
  )

)

