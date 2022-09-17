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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15488 - SURFACE
      ?auto_15489 - SURFACE
    )
    :vars
    (
      ?auto_15490 - HOIST
      ?auto_15491 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15490 ?auto_15491 ) ( SURFACE-AT ?auto_15488 ?auto_15491 ) ( CLEAR ?auto_15488 ) ( LIFTING ?auto_15490 ?auto_15489 ) ( IS-CRATE ?auto_15489 ) ( not ( = ?auto_15488 ?auto_15489 ) ) )
    :subtasks
    ( ( !DROP ?auto_15490 ?auto_15489 ?auto_15488 ?auto_15491 )
      ( MAKE-1CRATE-VERIFY ?auto_15488 ?auto_15489 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15492 - SURFACE
      ?auto_15493 - SURFACE
    )
    :vars
    (
      ?auto_15494 - HOIST
      ?auto_15495 - PLACE
      ?auto_15496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15494 ?auto_15495 ) ( SURFACE-AT ?auto_15492 ?auto_15495 ) ( CLEAR ?auto_15492 ) ( IS-CRATE ?auto_15493 ) ( not ( = ?auto_15492 ?auto_15493 ) ) ( TRUCK-AT ?auto_15496 ?auto_15495 ) ( AVAILABLE ?auto_15494 ) ( IN ?auto_15493 ?auto_15496 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15494 ?auto_15493 ?auto_15496 ?auto_15495 )
      ( MAKE-1CRATE ?auto_15492 ?auto_15493 )
      ( MAKE-1CRATE-VERIFY ?auto_15492 ?auto_15493 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15497 - SURFACE
      ?auto_15498 - SURFACE
    )
    :vars
    (
      ?auto_15499 - HOIST
      ?auto_15500 - PLACE
      ?auto_15501 - TRUCK
      ?auto_15502 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15499 ?auto_15500 ) ( SURFACE-AT ?auto_15497 ?auto_15500 ) ( CLEAR ?auto_15497 ) ( IS-CRATE ?auto_15498 ) ( not ( = ?auto_15497 ?auto_15498 ) ) ( AVAILABLE ?auto_15499 ) ( IN ?auto_15498 ?auto_15501 ) ( TRUCK-AT ?auto_15501 ?auto_15502 ) ( not ( = ?auto_15502 ?auto_15500 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15501 ?auto_15502 ?auto_15500 )
      ( MAKE-1CRATE ?auto_15497 ?auto_15498 )
      ( MAKE-1CRATE-VERIFY ?auto_15497 ?auto_15498 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15503 - SURFACE
      ?auto_15504 - SURFACE
    )
    :vars
    (
      ?auto_15505 - HOIST
      ?auto_15508 - PLACE
      ?auto_15506 - TRUCK
      ?auto_15507 - PLACE
      ?auto_15509 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15505 ?auto_15508 ) ( SURFACE-AT ?auto_15503 ?auto_15508 ) ( CLEAR ?auto_15503 ) ( IS-CRATE ?auto_15504 ) ( not ( = ?auto_15503 ?auto_15504 ) ) ( AVAILABLE ?auto_15505 ) ( TRUCK-AT ?auto_15506 ?auto_15507 ) ( not ( = ?auto_15507 ?auto_15508 ) ) ( HOIST-AT ?auto_15509 ?auto_15507 ) ( LIFTING ?auto_15509 ?auto_15504 ) ( not ( = ?auto_15505 ?auto_15509 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15509 ?auto_15504 ?auto_15506 ?auto_15507 )
      ( MAKE-1CRATE ?auto_15503 ?auto_15504 )
      ( MAKE-1CRATE-VERIFY ?auto_15503 ?auto_15504 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15510 - SURFACE
      ?auto_15511 - SURFACE
    )
    :vars
    (
      ?auto_15514 - HOIST
      ?auto_15515 - PLACE
      ?auto_15512 - TRUCK
      ?auto_15513 - PLACE
      ?auto_15516 - HOIST
      ?auto_15517 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15514 ?auto_15515 ) ( SURFACE-AT ?auto_15510 ?auto_15515 ) ( CLEAR ?auto_15510 ) ( IS-CRATE ?auto_15511 ) ( not ( = ?auto_15510 ?auto_15511 ) ) ( AVAILABLE ?auto_15514 ) ( TRUCK-AT ?auto_15512 ?auto_15513 ) ( not ( = ?auto_15513 ?auto_15515 ) ) ( HOIST-AT ?auto_15516 ?auto_15513 ) ( not ( = ?auto_15514 ?auto_15516 ) ) ( AVAILABLE ?auto_15516 ) ( SURFACE-AT ?auto_15511 ?auto_15513 ) ( ON ?auto_15511 ?auto_15517 ) ( CLEAR ?auto_15511 ) ( not ( = ?auto_15510 ?auto_15517 ) ) ( not ( = ?auto_15511 ?auto_15517 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15516 ?auto_15511 ?auto_15517 ?auto_15513 )
      ( MAKE-1CRATE ?auto_15510 ?auto_15511 )
      ( MAKE-1CRATE-VERIFY ?auto_15510 ?auto_15511 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15518 - SURFACE
      ?auto_15519 - SURFACE
    )
    :vars
    (
      ?auto_15525 - HOIST
      ?auto_15523 - PLACE
      ?auto_15524 - PLACE
      ?auto_15522 - HOIST
      ?auto_15521 - SURFACE
      ?auto_15520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15525 ?auto_15523 ) ( SURFACE-AT ?auto_15518 ?auto_15523 ) ( CLEAR ?auto_15518 ) ( IS-CRATE ?auto_15519 ) ( not ( = ?auto_15518 ?auto_15519 ) ) ( AVAILABLE ?auto_15525 ) ( not ( = ?auto_15524 ?auto_15523 ) ) ( HOIST-AT ?auto_15522 ?auto_15524 ) ( not ( = ?auto_15525 ?auto_15522 ) ) ( AVAILABLE ?auto_15522 ) ( SURFACE-AT ?auto_15519 ?auto_15524 ) ( ON ?auto_15519 ?auto_15521 ) ( CLEAR ?auto_15519 ) ( not ( = ?auto_15518 ?auto_15521 ) ) ( not ( = ?auto_15519 ?auto_15521 ) ) ( TRUCK-AT ?auto_15520 ?auto_15523 ) )
    :subtasks
    ( ( !DRIVE ?auto_15520 ?auto_15523 ?auto_15524 )
      ( MAKE-1CRATE ?auto_15518 ?auto_15519 )
      ( MAKE-1CRATE-VERIFY ?auto_15518 ?auto_15519 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15535 - SURFACE
      ?auto_15536 - SURFACE
      ?auto_15537 - SURFACE
    )
    :vars
    (
      ?auto_15538 - HOIST
      ?auto_15539 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15538 ?auto_15539 ) ( SURFACE-AT ?auto_15536 ?auto_15539 ) ( CLEAR ?auto_15536 ) ( LIFTING ?auto_15538 ?auto_15537 ) ( IS-CRATE ?auto_15537 ) ( not ( = ?auto_15536 ?auto_15537 ) ) ( ON ?auto_15536 ?auto_15535 ) ( not ( = ?auto_15535 ?auto_15536 ) ) ( not ( = ?auto_15535 ?auto_15537 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15536 ?auto_15537 )
      ( MAKE-2CRATE-VERIFY ?auto_15535 ?auto_15536 ?auto_15537 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15545 - SURFACE
      ?auto_15546 - SURFACE
      ?auto_15547 - SURFACE
    )
    :vars
    (
      ?auto_15548 - HOIST
      ?auto_15549 - PLACE
      ?auto_15550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15548 ?auto_15549 ) ( SURFACE-AT ?auto_15546 ?auto_15549 ) ( CLEAR ?auto_15546 ) ( IS-CRATE ?auto_15547 ) ( not ( = ?auto_15546 ?auto_15547 ) ) ( TRUCK-AT ?auto_15550 ?auto_15549 ) ( AVAILABLE ?auto_15548 ) ( IN ?auto_15547 ?auto_15550 ) ( ON ?auto_15546 ?auto_15545 ) ( not ( = ?auto_15545 ?auto_15546 ) ) ( not ( = ?auto_15545 ?auto_15547 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15546 ?auto_15547 )
      ( MAKE-2CRATE-VERIFY ?auto_15545 ?auto_15546 ?auto_15547 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15551 - SURFACE
      ?auto_15552 - SURFACE
    )
    :vars
    (
      ?auto_15556 - HOIST
      ?auto_15553 - PLACE
      ?auto_15555 - TRUCK
      ?auto_15554 - SURFACE
      ?auto_15557 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15556 ?auto_15553 ) ( SURFACE-AT ?auto_15551 ?auto_15553 ) ( CLEAR ?auto_15551 ) ( IS-CRATE ?auto_15552 ) ( not ( = ?auto_15551 ?auto_15552 ) ) ( AVAILABLE ?auto_15556 ) ( IN ?auto_15552 ?auto_15555 ) ( ON ?auto_15551 ?auto_15554 ) ( not ( = ?auto_15554 ?auto_15551 ) ) ( not ( = ?auto_15554 ?auto_15552 ) ) ( TRUCK-AT ?auto_15555 ?auto_15557 ) ( not ( = ?auto_15557 ?auto_15553 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15555 ?auto_15557 ?auto_15553 )
      ( MAKE-2CRATE ?auto_15554 ?auto_15551 ?auto_15552 )
      ( MAKE-1CRATE-VERIFY ?auto_15551 ?auto_15552 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15558 - SURFACE
      ?auto_15559 - SURFACE
      ?auto_15560 - SURFACE
    )
    :vars
    (
      ?auto_15563 - HOIST
      ?auto_15561 - PLACE
      ?auto_15564 - TRUCK
      ?auto_15562 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15563 ?auto_15561 ) ( SURFACE-AT ?auto_15559 ?auto_15561 ) ( CLEAR ?auto_15559 ) ( IS-CRATE ?auto_15560 ) ( not ( = ?auto_15559 ?auto_15560 ) ) ( AVAILABLE ?auto_15563 ) ( IN ?auto_15560 ?auto_15564 ) ( ON ?auto_15559 ?auto_15558 ) ( not ( = ?auto_15558 ?auto_15559 ) ) ( not ( = ?auto_15558 ?auto_15560 ) ) ( TRUCK-AT ?auto_15564 ?auto_15562 ) ( not ( = ?auto_15562 ?auto_15561 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15559 ?auto_15560 )
      ( MAKE-2CRATE-VERIFY ?auto_15558 ?auto_15559 ?auto_15560 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15565 - SURFACE
      ?auto_15566 - SURFACE
    )
    :vars
    (
      ?auto_15567 - HOIST
      ?auto_15570 - PLACE
      ?auto_15568 - SURFACE
      ?auto_15569 - TRUCK
      ?auto_15571 - PLACE
      ?auto_15572 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15567 ?auto_15570 ) ( SURFACE-AT ?auto_15565 ?auto_15570 ) ( CLEAR ?auto_15565 ) ( IS-CRATE ?auto_15566 ) ( not ( = ?auto_15565 ?auto_15566 ) ) ( AVAILABLE ?auto_15567 ) ( ON ?auto_15565 ?auto_15568 ) ( not ( = ?auto_15568 ?auto_15565 ) ) ( not ( = ?auto_15568 ?auto_15566 ) ) ( TRUCK-AT ?auto_15569 ?auto_15571 ) ( not ( = ?auto_15571 ?auto_15570 ) ) ( HOIST-AT ?auto_15572 ?auto_15571 ) ( LIFTING ?auto_15572 ?auto_15566 ) ( not ( = ?auto_15567 ?auto_15572 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15572 ?auto_15566 ?auto_15569 ?auto_15571 )
      ( MAKE-2CRATE ?auto_15568 ?auto_15565 ?auto_15566 )
      ( MAKE-1CRATE-VERIFY ?auto_15565 ?auto_15566 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15573 - SURFACE
      ?auto_15574 - SURFACE
      ?auto_15575 - SURFACE
    )
    :vars
    (
      ?auto_15580 - HOIST
      ?auto_15578 - PLACE
      ?auto_15579 - TRUCK
      ?auto_15577 - PLACE
      ?auto_15576 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15580 ?auto_15578 ) ( SURFACE-AT ?auto_15574 ?auto_15578 ) ( CLEAR ?auto_15574 ) ( IS-CRATE ?auto_15575 ) ( not ( = ?auto_15574 ?auto_15575 ) ) ( AVAILABLE ?auto_15580 ) ( ON ?auto_15574 ?auto_15573 ) ( not ( = ?auto_15573 ?auto_15574 ) ) ( not ( = ?auto_15573 ?auto_15575 ) ) ( TRUCK-AT ?auto_15579 ?auto_15577 ) ( not ( = ?auto_15577 ?auto_15578 ) ) ( HOIST-AT ?auto_15576 ?auto_15577 ) ( LIFTING ?auto_15576 ?auto_15575 ) ( not ( = ?auto_15580 ?auto_15576 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15574 ?auto_15575 )
      ( MAKE-2CRATE-VERIFY ?auto_15573 ?auto_15574 ?auto_15575 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15581 - SURFACE
      ?auto_15582 - SURFACE
    )
    :vars
    (
      ?auto_15584 - HOIST
      ?auto_15588 - PLACE
      ?auto_15583 - SURFACE
      ?auto_15586 - TRUCK
      ?auto_15587 - PLACE
      ?auto_15585 - HOIST
      ?auto_15589 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15584 ?auto_15588 ) ( SURFACE-AT ?auto_15581 ?auto_15588 ) ( CLEAR ?auto_15581 ) ( IS-CRATE ?auto_15582 ) ( not ( = ?auto_15581 ?auto_15582 ) ) ( AVAILABLE ?auto_15584 ) ( ON ?auto_15581 ?auto_15583 ) ( not ( = ?auto_15583 ?auto_15581 ) ) ( not ( = ?auto_15583 ?auto_15582 ) ) ( TRUCK-AT ?auto_15586 ?auto_15587 ) ( not ( = ?auto_15587 ?auto_15588 ) ) ( HOIST-AT ?auto_15585 ?auto_15587 ) ( not ( = ?auto_15584 ?auto_15585 ) ) ( AVAILABLE ?auto_15585 ) ( SURFACE-AT ?auto_15582 ?auto_15587 ) ( ON ?auto_15582 ?auto_15589 ) ( CLEAR ?auto_15582 ) ( not ( = ?auto_15581 ?auto_15589 ) ) ( not ( = ?auto_15582 ?auto_15589 ) ) ( not ( = ?auto_15583 ?auto_15589 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15585 ?auto_15582 ?auto_15589 ?auto_15587 )
      ( MAKE-2CRATE ?auto_15583 ?auto_15581 ?auto_15582 )
      ( MAKE-1CRATE-VERIFY ?auto_15581 ?auto_15582 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15590 - SURFACE
      ?auto_15591 - SURFACE
      ?auto_15592 - SURFACE
    )
    :vars
    (
      ?auto_15597 - HOIST
      ?auto_15593 - PLACE
      ?auto_15598 - TRUCK
      ?auto_15595 - PLACE
      ?auto_15596 - HOIST
      ?auto_15594 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15597 ?auto_15593 ) ( SURFACE-AT ?auto_15591 ?auto_15593 ) ( CLEAR ?auto_15591 ) ( IS-CRATE ?auto_15592 ) ( not ( = ?auto_15591 ?auto_15592 ) ) ( AVAILABLE ?auto_15597 ) ( ON ?auto_15591 ?auto_15590 ) ( not ( = ?auto_15590 ?auto_15591 ) ) ( not ( = ?auto_15590 ?auto_15592 ) ) ( TRUCK-AT ?auto_15598 ?auto_15595 ) ( not ( = ?auto_15595 ?auto_15593 ) ) ( HOIST-AT ?auto_15596 ?auto_15595 ) ( not ( = ?auto_15597 ?auto_15596 ) ) ( AVAILABLE ?auto_15596 ) ( SURFACE-AT ?auto_15592 ?auto_15595 ) ( ON ?auto_15592 ?auto_15594 ) ( CLEAR ?auto_15592 ) ( not ( = ?auto_15591 ?auto_15594 ) ) ( not ( = ?auto_15592 ?auto_15594 ) ) ( not ( = ?auto_15590 ?auto_15594 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15591 ?auto_15592 )
      ( MAKE-2CRATE-VERIFY ?auto_15590 ?auto_15591 ?auto_15592 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15599 - SURFACE
      ?auto_15600 - SURFACE
    )
    :vars
    (
      ?auto_15606 - HOIST
      ?auto_15605 - PLACE
      ?auto_15601 - SURFACE
      ?auto_15607 - PLACE
      ?auto_15602 - HOIST
      ?auto_15603 - SURFACE
      ?auto_15604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15606 ?auto_15605 ) ( SURFACE-AT ?auto_15599 ?auto_15605 ) ( CLEAR ?auto_15599 ) ( IS-CRATE ?auto_15600 ) ( not ( = ?auto_15599 ?auto_15600 ) ) ( AVAILABLE ?auto_15606 ) ( ON ?auto_15599 ?auto_15601 ) ( not ( = ?auto_15601 ?auto_15599 ) ) ( not ( = ?auto_15601 ?auto_15600 ) ) ( not ( = ?auto_15607 ?auto_15605 ) ) ( HOIST-AT ?auto_15602 ?auto_15607 ) ( not ( = ?auto_15606 ?auto_15602 ) ) ( AVAILABLE ?auto_15602 ) ( SURFACE-AT ?auto_15600 ?auto_15607 ) ( ON ?auto_15600 ?auto_15603 ) ( CLEAR ?auto_15600 ) ( not ( = ?auto_15599 ?auto_15603 ) ) ( not ( = ?auto_15600 ?auto_15603 ) ) ( not ( = ?auto_15601 ?auto_15603 ) ) ( TRUCK-AT ?auto_15604 ?auto_15605 ) )
    :subtasks
    ( ( !DRIVE ?auto_15604 ?auto_15605 ?auto_15607 )
      ( MAKE-2CRATE ?auto_15601 ?auto_15599 ?auto_15600 )
      ( MAKE-1CRATE-VERIFY ?auto_15599 ?auto_15600 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15608 - SURFACE
      ?auto_15609 - SURFACE
      ?auto_15610 - SURFACE
    )
    :vars
    (
      ?auto_15615 - HOIST
      ?auto_15613 - PLACE
      ?auto_15616 - PLACE
      ?auto_15614 - HOIST
      ?auto_15612 - SURFACE
      ?auto_15611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15615 ?auto_15613 ) ( SURFACE-AT ?auto_15609 ?auto_15613 ) ( CLEAR ?auto_15609 ) ( IS-CRATE ?auto_15610 ) ( not ( = ?auto_15609 ?auto_15610 ) ) ( AVAILABLE ?auto_15615 ) ( ON ?auto_15609 ?auto_15608 ) ( not ( = ?auto_15608 ?auto_15609 ) ) ( not ( = ?auto_15608 ?auto_15610 ) ) ( not ( = ?auto_15616 ?auto_15613 ) ) ( HOIST-AT ?auto_15614 ?auto_15616 ) ( not ( = ?auto_15615 ?auto_15614 ) ) ( AVAILABLE ?auto_15614 ) ( SURFACE-AT ?auto_15610 ?auto_15616 ) ( ON ?auto_15610 ?auto_15612 ) ( CLEAR ?auto_15610 ) ( not ( = ?auto_15609 ?auto_15612 ) ) ( not ( = ?auto_15610 ?auto_15612 ) ) ( not ( = ?auto_15608 ?auto_15612 ) ) ( TRUCK-AT ?auto_15611 ?auto_15613 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15609 ?auto_15610 )
      ( MAKE-2CRATE-VERIFY ?auto_15608 ?auto_15609 ?auto_15610 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15617 - SURFACE
      ?auto_15618 - SURFACE
    )
    :vars
    (
      ?auto_15623 - HOIST
      ?auto_15625 - PLACE
      ?auto_15621 - SURFACE
      ?auto_15619 - PLACE
      ?auto_15620 - HOIST
      ?auto_15624 - SURFACE
      ?auto_15622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15623 ?auto_15625 ) ( IS-CRATE ?auto_15618 ) ( not ( = ?auto_15617 ?auto_15618 ) ) ( not ( = ?auto_15621 ?auto_15617 ) ) ( not ( = ?auto_15621 ?auto_15618 ) ) ( not ( = ?auto_15619 ?auto_15625 ) ) ( HOIST-AT ?auto_15620 ?auto_15619 ) ( not ( = ?auto_15623 ?auto_15620 ) ) ( AVAILABLE ?auto_15620 ) ( SURFACE-AT ?auto_15618 ?auto_15619 ) ( ON ?auto_15618 ?auto_15624 ) ( CLEAR ?auto_15618 ) ( not ( = ?auto_15617 ?auto_15624 ) ) ( not ( = ?auto_15618 ?auto_15624 ) ) ( not ( = ?auto_15621 ?auto_15624 ) ) ( TRUCK-AT ?auto_15622 ?auto_15625 ) ( SURFACE-AT ?auto_15621 ?auto_15625 ) ( CLEAR ?auto_15621 ) ( LIFTING ?auto_15623 ?auto_15617 ) ( IS-CRATE ?auto_15617 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15621 ?auto_15617 )
      ( MAKE-2CRATE ?auto_15621 ?auto_15617 ?auto_15618 )
      ( MAKE-1CRATE-VERIFY ?auto_15617 ?auto_15618 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15626 - SURFACE
      ?auto_15627 - SURFACE
      ?auto_15628 - SURFACE
    )
    :vars
    (
      ?auto_15629 - HOIST
      ?auto_15634 - PLACE
      ?auto_15633 - PLACE
      ?auto_15632 - HOIST
      ?auto_15631 - SURFACE
      ?auto_15630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15629 ?auto_15634 ) ( IS-CRATE ?auto_15628 ) ( not ( = ?auto_15627 ?auto_15628 ) ) ( not ( = ?auto_15626 ?auto_15627 ) ) ( not ( = ?auto_15626 ?auto_15628 ) ) ( not ( = ?auto_15633 ?auto_15634 ) ) ( HOIST-AT ?auto_15632 ?auto_15633 ) ( not ( = ?auto_15629 ?auto_15632 ) ) ( AVAILABLE ?auto_15632 ) ( SURFACE-AT ?auto_15628 ?auto_15633 ) ( ON ?auto_15628 ?auto_15631 ) ( CLEAR ?auto_15628 ) ( not ( = ?auto_15627 ?auto_15631 ) ) ( not ( = ?auto_15628 ?auto_15631 ) ) ( not ( = ?auto_15626 ?auto_15631 ) ) ( TRUCK-AT ?auto_15630 ?auto_15634 ) ( SURFACE-AT ?auto_15626 ?auto_15634 ) ( CLEAR ?auto_15626 ) ( LIFTING ?auto_15629 ?auto_15627 ) ( IS-CRATE ?auto_15627 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15627 ?auto_15628 )
      ( MAKE-2CRATE-VERIFY ?auto_15626 ?auto_15627 ?auto_15628 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15635 - SURFACE
      ?auto_15636 - SURFACE
    )
    :vars
    (
      ?auto_15640 - HOIST
      ?auto_15638 - PLACE
      ?auto_15643 - SURFACE
      ?auto_15639 - PLACE
      ?auto_15642 - HOIST
      ?auto_15637 - SURFACE
      ?auto_15641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15640 ?auto_15638 ) ( IS-CRATE ?auto_15636 ) ( not ( = ?auto_15635 ?auto_15636 ) ) ( not ( = ?auto_15643 ?auto_15635 ) ) ( not ( = ?auto_15643 ?auto_15636 ) ) ( not ( = ?auto_15639 ?auto_15638 ) ) ( HOIST-AT ?auto_15642 ?auto_15639 ) ( not ( = ?auto_15640 ?auto_15642 ) ) ( AVAILABLE ?auto_15642 ) ( SURFACE-AT ?auto_15636 ?auto_15639 ) ( ON ?auto_15636 ?auto_15637 ) ( CLEAR ?auto_15636 ) ( not ( = ?auto_15635 ?auto_15637 ) ) ( not ( = ?auto_15636 ?auto_15637 ) ) ( not ( = ?auto_15643 ?auto_15637 ) ) ( TRUCK-AT ?auto_15641 ?auto_15638 ) ( SURFACE-AT ?auto_15643 ?auto_15638 ) ( CLEAR ?auto_15643 ) ( IS-CRATE ?auto_15635 ) ( AVAILABLE ?auto_15640 ) ( IN ?auto_15635 ?auto_15641 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15640 ?auto_15635 ?auto_15641 ?auto_15638 )
      ( MAKE-2CRATE ?auto_15643 ?auto_15635 ?auto_15636 )
      ( MAKE-1CRATE-VERIFY ?auto_15635 ?auto_15636 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15644 - SURFACE
      ?auto_15645 - SURFACE
      ?auto_15646 - SURFACE
    )
    :vars
    (
      ?auto_15647 - HOIST
      ?auto_15651 - PLACE
      ?auto_15649 - PLACE
      ?auto_15650 - HOIST
      ?auto_15648 - SURFACE
      ?auto_15652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15647 ?auto_15651 ) ( IS-CRATE ?auto_15646 ) ( not ( = ?auto_15645 ?auto_15646 ) ) ( not ( = ?auto_15644 ?auto_15645 ) ) ( not ( = ?auto_15644 ?auto_15646 ) ) ( not ( = ?auto_15649 ?auto_15651 ) ) ( HOIST-AT ?auto_15650 ?auto_15649 ) ( not ( = ?auto_15647 ?auto_15650 ) ) ( AVAILABLE ?auto_15650 ) ( SURFACE-AT ?auto_15646 ?auto_15649 ) ( ON ?auto_15646 ?auto_15648 ) ( CLEAR ?auto_15646 ) ( not ( = ?auto_15645 ?auto_15648 ) ) ( not ( = ?auto_15646 ?auto_15648 ) ) ( not ( = ?auto_15644 ?auto_15648 ) ) ( TRUCK-AT ?auto_15652 ?auto_15651 ) ( SURFACE-AT ?auto_15644 ?auto_15651 ) ( CLEAR ?auto_15644 ) ( IS-CRATE ?auto_15645 ) ( AVAILABLE ?auto_15647 ) ( IN ?auto_15645 ?auto_15652 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15645 ?auto_15646 )
      ( MAKE-2CRATE-VERIFY ?auto_15644 ?auto_15645 ?auto_15646 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15689 - SURFACE
      ?auto_15690 - SURFACE
    )
    :vars
    (
      ?auto_15691 - HOIST
      ?auto_15696 - PLACE
      ?auto_15697 - SURFACE
      ?auto_15693 - PLACE
      ?auto_15694 - HOIST
      ?auto_15695 - SURFACE
      ?auto_15692 - TRUCK
      ?auto_15698 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15691 ?auto_15696 ) ( SURFACE-AT ?auto_15689 ?auto_15696 ) ( CLEAR ?auto_15689 ) ( IS-CRATE ?auto_15690 ) ( not ( = ?auto_15689 ?auto_15690 ) ) ( AVAILABLE ?auto_15691 ) ( ON ?auto_15689 ?auto_15697 ) ( not ( = ?auto_15697 ?auto_15689 ) ) ( not ( = ?auto_15697 ?auto_15690 ) ) ( not ( = ?auto_15693 ?auto_15696 ) ) ( HOIST-AT ?auto_15694 ?auto_15693 ) ( not ( = ?auto_15691 ?auto_15694 ) ) ( AVAILABLE ?auto_15694 ) ( SURFACE-AT ?auto_15690 ?auto_15693 ) ( ON ?auto_15690 ?auto_15695 ) ( CLEAR ?auto_15690 ) ( not ( = ?auto_15689 ?auto_15695 ) ) ( not ( = ?auto_15690 ?auto_15695 ) ) ( not ( = ?auto_15697 ?auto_15695 ) ) ( TRUCK-AT ?auto_15692 ?auto_15698 ) ( not ( = ?auto_15698 ?auto_15696 ) ) ( not ( = ?auto_15693 ?auto_15698 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15692 ?auto_15698 ?auto_15696 )
      ( MAKE-1CRATE ?auto_15689 ?auto_15690 )
      ( MAKE-1CRATE-VERIFY ?auto_15689 ?auto_15690 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15729 - SURFACE
      ?auto_15730 - SURFACE
      ?auto_15731 - SURFACE
      ?auto_15728 - SURFACE
    )
    :vars
    (
      ?auto_15733 - HOIST
      ?auto_15732 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15733 ?auto_15732 ) ( SURFACE-AT ?auto_15731 ?auto_15732 ) ( CLEAR ?auto_15731 ) ( LIFTING ?auto_15733 ?auto_15728 ) ( IS-CRATE ?auto_15728 ) ( not ( = ?auto_15731 ?auto_15728 ) ) ( ON ?auto_15730 ?auto_15729 ) ( ON ?auto_15731 ?auto_15730 ) ( not ( = ?auto_15729 ?auto_15730 ) ) ( not ( = ?auto_15729 ?auto_15731 ) ) ( not ( = ?auto_15729 ?auto_15728 ) ) ( not ( = ?auto_15730 ?auto_15731 ) ) ( not ( = ?auto_15730 ?auto_15728 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15731 ?auto_15728 )
      ( MAKE-3CRATE-VERIFY ?auto_15729 ?auto_15730 ?auto_15731 ?auto_15728 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15746 - SURFACE
      ?auto_15747 - SURFACE
      ?auto_15748 - SURFACE
      ?auto_15745 - SURFACE
    )
    :vars
    (
      ?auto_15749 - HOIST
      ?auto_15750 - PLACE
      ?auto_15751 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15749 ?auto_15750 ) ( SURFACE-AT ?auto_15748 ?auto_15750 ) ( CLEAR ?auto_15748 ) ( IS-CRATE ?auto_15745 ) ( not ( = ?auto_15748 ?auto_15745 ) ) ( TRUCK-AT ?auto_15751 ?auto_15750 ) ( AVAILABLE ?auto_15749 ) ( IN ?auto_15745 ?auto_15751 ) ( ON ?auto_15748 ?auto_15747 ) ( not ( = ?auto_15747 ?auto_15748 ) ) ( not ( = ?auto_15747 ?auto_15745 ) ) ( ON ?auto_15747 ?auto_15746 ) ( not ( = ?auto_15746 ?auto_15747 ) ) ( not ( = ?auto_15746 ?auto_15748 ) ) ( not ( = ?auto_15746 ?auto_15745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15747 ?auto_15748 ?auto_15745 )
      ( MAKE-3CRATE-VERIFY ?auto_15746 ?auto_15747 ?auto_15748 ?auto_15745 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15767 - SURFACE
      ?auto_15768 - SURFACE
      ?auto_15769 - SURFACE
      ?auto_15766 - SURFACE
    )
    :vars
    (
      ?auto_15770 - HOIST
      ?auto_15773 - PLACE
      ?auto_15771 - TRUCK
      ?auto_15772 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15770 ?auto_15773 ) ( SURFACE-AT ?auto_15769 ?auto_15773 ) ( CLEAR ?auto_15769 ) ( IS-CRATE ?auto_15766 ) ( not ( = ?auto_15769 ?auto_15766 ) ) ( AVAILABLE ?auto_15770 ) ( IN ?auto_15766 ?auto_15771 ) ( ON ?auto_15769 ?auto_15768 ) ( not ( = ?auto_15768 ?auto_15769 ) ) ( not ( = ?auto_15768 ?auto_15766 ) ) ( TRUCK-AT ?auto_15771 ?auto_15772 ) ( not ( = ?auto_15772 ?auto_15773 ) ) ( ON ?auto_15768 ?auto_15767 ) ( not ( = ?auto_15767 ?auto_15768 ) ) ( not ( = ?auto_15767 ?auto_15769 ) ) ( not ( = ?auto_15767 ?auto_15766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15768 ?auto_15769 ?auto_15766 )
      ( MAKE-3CRATE-VERIFY ?auto_15767 ?auto_15768 ?auto_15769 ?auto_15766 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15791 - SURFACE
      ?auto_15792 - SURFACE
      ?auto_15793 - SURFACE
      ?auto_15790 - SURFACE
    )
    :vars
    (
      ?auto_15797 - HOIST
      ?auto_15798 - PLACE
      ?auto_15795 - TRUCK
      ?auto_15794 - PLACE
      ?auto_15796 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15797 ?auto_15798 ) ( SURFACE-AT ?auto_15793 ?auto_15798 ) ( CLEAR ?auto_15793 ) ( IS-CRATE ?auto_15790 ) ( not ( = ?auto_15793 ?auto_15790 ) ) ( AVAILABLE ?auto_15797 ) ( ON ?auto_15793 ?auto_15792 ) ( not ( = ?auto_15792 ?auto_15793 ) ) ( not ( = ?auto_15792 ?auto_15790 ) ) ( TRUCK-AT ?auto_15795 ?auto_15794 ) ( not ( = ?auto_15794 ?auto_15798 ) ) ( HOIST-AT ?auto_15796 ?auto_15794 ) ( LIFTING ?auto_15796 ?auto_15790 ) ( not ( = ?auto_15797 ?auto_15796 ) ) ( ON ?auto_15792 ?auto_15791 ) ( not ( = ?auto_15791 ?auto_15792 ) ) ( not ( = ?auto_15791 ?auto_15793 ) ) ( not ( = ?auto_15791 ?auto_15790 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15792 ?auto_15793 ?auto_15790 )
      ( MAKE-3CRATE-VERIFY ?auto_15791 ?auto_15792 ?auto_15793 ?auto_15790 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15818 - SURFACE
      ?auto_15819 - SURFACE
      ?auto_15820 - SURFACE
      ?auto_15817 - SURFACE
    )
    :vars
    (
      ?auto_15826 - HOIST
      ?auto_15824 - PLACE
      ?auto_15825 - TRUCK
      ?auto_15822 - PLACE
      ?auto_15821 - HOIST
      ?auto_15823 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15826 ?auto_15824 ) ( SURFACE-AT ?auto_15820 ?auto_15824 ) ( CLEAR ?auto_15820 ) ( IS-CRATE ?auto_15817 ) ( not ( = ?auto_15820 ?auto_15817 ) ) ( AVAILABLE ?auto_15826 ) ( ON ?auto_15820 ?auto_15819 ) ( not ( = ?auto_15819 ?auto_15820 ) ) ( not ( = ?auto_15819 ?auto_15817 ) ) ( TRUCK-AT ?auto_15825 ?auto_15822 ) ( not ( = ?auto_15822 ?auto_15824 ) ) ( HOIST-AT ?auto_15821 ?auto_15822 ) ( not ( = ?auto_15826 ?auto_15821 ) ) ( AVAILABLE ?auto_15821 ) ( SURFACE-AT ?auto_15817 ?auto_15822 ) ( ON ?auto_15817 ?auto_15823 ) ( CLEAR ?auto_15817 ) ( not ( = ?auto_15820 ?auto_15823 ) ) ( not ( = ?auto_15817 ?auto_15823 ) ) ( not ( = ?auto_15819 ?auto_15823 ) ) ( ON ?auto_15819 ?auto_15818 ) ( not ( = ?auto_15818 ?auto_15819 ) ) ( not ( = ?auto_15818 ?auto_15820 ) ) ( not ( = ?auto_15818 ?auto_15817 ) ) ( not ( = ?auto_15818 ?auto_15823 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15819 ?auto_15820 ?auto_15817 )
      ( MAKE-3CRATE-VERIFY ?auto_15818 ?auto_15819 ?auto_15820 ?auto_15817 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15846 - SURFACE
      ?auto_15847 - SURFACE
      ?auto_15848 - SURFACE
      ?auto_15845 - SURFACE
    )
    :vars
    (
      ?auto_15850 - HOIST
      ?auto_15854 - PLACE
      ?auto_15851 - PLACE
      ?auto_15849 - HOIST
      ?auto_15852 - SURFACE
      ?auto_15853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15850 ?auto_15854 ) ( SURFACE-AT ?auto_15848 ?auto_15854 ) ( CLEAR ?auto_15848 ) ( IS-CRATE ?auto_15845 ) ( not ( = ?auto_15848 ?auto_15845 ) ) ( AVAILABLE ?auto_15850 ) ( ON ?auto_15848 ?auto_15847 ) ( not ( = ?auto_15847 ?auto_15848 ) ) ( not ( = ?auto_15847 ?auto_15845 ) ) ( not ( = ?auto_15851 ?auto_15854 ) ) ( HOIST-AT ?auto_15849 ?auto_15851 ) ( not ( = ?auto_15850 ?auto_15849 ) ) ( AVAILABLE ?auto_15849 ) ( SURFACE-AT ?auto_15845 ?auto_15851 ) ( ON ?auto_15845 ?auto_15852 ) ( CLEAR ?auto_15845 ) ( not ( = ?auto_15848 ?auto_15852 ) ) ( not ( = ?auto_15845 ?auto_15852 ) ) ( not ( = ?auto_15847 ?auto_15852 ) ) ( TRUCK-AT ?auto_15853 ?auto_15854 ) ( ON ?auto_15847 ?auto_15846 ) ( not ( = ?auto_15846 ?auto_15847 ) ) ( not ( = ?auto_15846 ?auto_15848 ) ) ( not ( = ?auto_15846 ?auto_15845 ) ) ( not ( = ?auto_15846 ?auto_15852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15847 ?auto_15848 ?auto_15845 )
      ( MAKE-3CRATE-VERIFY ?auto_15846 ?auto_15847 ?auto_15848 ?auto_15845 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15874 - SURFACE
      ?auto_15875 - SURFACE
      ?auto_15876 - SURFACE
      ?auto_15873 - SURFACE
    )
    :vars
    (
      ?auto_15881 - HOIST
      ?auto_15877 - PLACE
      ?auto_15880 - PLACE
      ?auto_15882 - HOIST
      ?auto_15879 - SURFACE
      ?auto_15878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15881 ?auto_15877 ) ( IS-CRATE ?auto_15873 ) ( not ( = ?auto_15876 ?auto_15873 ) ) ( not ( = ?auto_15875 ?auto_15876 ) ) ( not ( = ?auto_15875 ?auto_15873 ) ) ( not ( = ?auto_15880 ?auto_15877 ) ) ( HOIST-AT ?auto_15882 ?auto_15880 ) ( not ( = ?auto_15881 ?auto_15882 ) ) ( AVAILABLE ?auto_15882 ) ( SURFACE-AT ?auto_15873 ?auto_15880 ) ( ON ?auto_15873 ?auto_15879 ) ( CLEAR ?auto_15873 ) ( not ( = ?auto_15876 ?auto_15879 ) ) ( not ( = ?auto_15873 ?auto_15879 ) ) ( not ( = ?auto_15875 ?auto_15879 ) ) ( TRUCK-AT ?auto_15878 ?auto_15877 ) ( SURFACE-AT ?auto_15875 ?auto_15877 ) ( CLEAR ?auto_15875 ) ( LIFTING ?auto_15881 ?auto_15876 ) ( IS-CRATE ?auto_15876 ) ( ON ?auto_15875 ?auto_15874 ) ( not ( = ?auto_15874 ?auto_15875 ) ) ( not ( = ?auto_15874 ?auto_15876 ) ) ( not ( = ?auto_15874 ?auto_15873 ) ) ( not ( = ?auto_15874 ?auto_15879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15875 ?auto_15876 ?auto_15873 )
      ( MAKE-3CRATE-VERIFY ?auto_15874 ?auto_15875 ?auto_15876 ?auto_15873 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15902 - SURFACE
      ?auto_15903 - SURFACE
      ?auto_15904 - SURFACE
      ?auto_15901 - SURFACE
    )
    :vars
    (
      ?auto_15907 - HOIST
      ?auto_15906 - PLACE
      ?auto_15909 - PLACE
      ?auto_15908 - HOIST
      ?auto_15905 - SURFACE
      ?auto_15910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15907 ?auto_15906 ) ( IS-CRATE ?auto_15901 ) ( not ( = ?auto_15904 ?auto_15901 ) ) ( not ( = ?auto_15903 ?auto_15904 ) ) ( not ( = ?auto_15903 ?auto_15901 ) ) ( not ( = ?auto_15909 ?auto_15906 ) ) ( HOIST-AT ?auto_15908 ?auto_15909 ) ( not ( = ?auto_15907 ?auto_15908 ) ) ( AVAILABLE ?auto_15908 ) ( SURFACE-AT ?auto_15901 ?auto_15909 ) ( ON ?auto_15901 ?auto_15905 ) ( CLEAR ?auto_15901 ) ( not ( = ?auto_15904 ?auto_15905 ) ) ( not ( = ?auto_15901 ?auto_15905 ) ) ( not ( = ?auto_15903 ?auto_15905 ) ) ( TRUCK-AT ?auto_15910 ?auto_15906 ) ( SURFACE-AT ?auto_15903 ?auto_15906 ) ( CLEAR ?auto_15903 ) ( IS-CRATE ?auto_15904 ) ( AVAILABLE ?auto_15907 ) ( IN ?auto_15904 ?auto_15910 ) ( ON ?auto_15903 ?auto_15902 ) ( not ( = ?auto_15902 ?auto_15903 ) ) ( not ( = ?auto_15902 ?auto_15904 ) ) ( not ( = ?auto_15902 ?auto_15901 ) ) ( not ( = ?auto_15902 ?auto_15905 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15903 ?auto_15904 ?auto_15901 )
      ( MAKE-3CRATE-VERIFY ?auto_15902 ?auto_15903 ?auto_15904 ?auto_15901 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16193 - SURFACE
      ?auto_16194 - SURFACE
      ?auto_16195 - SURFACE
      ?auto_16192 - SURFACE
      ?auto_16196 - SURFACE
    )
    :vars
    (
      ?auto_16197 - HOIST
      ?auto_16198 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16197 ?auto_16198 ) ( SURFACE-AT ?auto_16192 ?auto_16198 ) ( CLEAR ?auto_16192 ) ( LIFTING ?auto_16197 ?auto_16196 ) ( IS-CRATE ?auto_16196 ) ( not ( = ?auto_16192 ?auto_16196 ) ) ( ON ?auto_16194 ?auto_16193 ) ( ON ?auto_16195 ?auto_16194 ) ( ON ?auto_16192 ?auto_16195 ) ( not ( = ?auto_16193 ?auto_16194 ) ) ( not ( = ?auto_16193 ?auto_16195 ) ) ( not ( = ?auto_16193 ?auto_16192 ) ) ( not ( = ?auto_16193 ?auto_16196 ) ) ( not ( = ?auto_16194 ?auto_16195 ) ) ( not ( = ?auto_16194 ?auto_16192 ) ) ( not ( = ?auto_16194 ?auto_16196 ) ) ( not ( = ?auto_16195 ?auto_16192 ) ) ( not ( = ?auto_16195 ?auto_16196 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16192 ?auto_16196 )
      ( MAKE-4CRATE-VERIFY ?auto_16193 ?auto_16194 ?auto_16195 ?auto_16192 ?auto_16196 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16218 - SURFACE
      ?auto_16219 - SURFACE
      ?auto_16220 - SURFACE
      ?auto_16217 - SURFACE
      ?auto_16221 - SURFACE
    )
    :vars
    (
      ?auto_16224 - HOIST
      ?auto_16223 - PLACE
      ?auto_16222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16224 ?auto_16223 ) ( SURFACE-AT ?auto_16217 ?auto_16223 ) ( CLEAR ?auto_16217 ) ( IS-CRATE ?auto_16221 ) ( not ( = ?auto_16217 ?auto_16221 ) ) ( TRUCK-AT ?auto_16222 ?auto_16223 ) ( AVAILABLE ?auto_16224 ) ( IN ?auto_16221 ?auto_16222 ) ( ON ?auto_16217 ?auto_16220 ) ( not ( = ?auto_16220 ?auto_16217 ) ) ( not ( = ?auto_16220 ?auto_16221 ) ) ( ON ?auto_16219 ?auto_16218 ) ( ON ?auto_16220 ?auto_16219 ) ( not ( = ?auto_16218 ?auto_16219 ) ) ( not ( = ?auto_16218 ?auto_16220 ) ) ( not ( = ?auto_16218 ?auto_16217 ) ) ( not ( = ?auto_16218 ?auto_16221 ) ) ( not ( = ?auto_16219 ?auto_16220 ) ) ( not ( = ?auto_16219 ?auto_16217 ) ) ( not ( = ?auto_16219 ?auto_16221 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16220 ?auto_16217 ?auto_16221 )
      ( MAKE-4CRATE-VERIFY ?auto_16218 ?auto_16219 ?auto_16220 ?auto_16217 ?auto_16221 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16248 - SURFACE
      ?auto_16249 - SURFACE
      ?auto_16250 - SURFACE
      ?auto_16247 - SURFACE
      ?auto_16251 - SURFACE
    )
    :vars
    (
      ?auto_16254 - HOIST
      ?auto_16255 - PLACE
      ?auto_16253 - TRUCK
      ?auto_16252 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16254 ?auto_16255 ) ( SURFACE-AT ?auto_16247 ?auto_16255 ) ( CLEAR ?auto_16247 ) ( IS-CRATE ?auto_16251 ) ( not ( = ?auto_16247 ?auto_16251 ) ) ( AVAILABLE ?auto_16254 ) ( IN ?auto_16251 ?auto_16253 ) ( ON ?auto_16247 ?auto_16250 ) ( not ( = ?auto_16250 ?auto_16247 ) ) ( not ( = ?auto_16250 ?auto_16251 ) ) ( TRUCK-AT ?auto_16253 ?auto_16252 ) ( not ( = ?auto_16252 ?auto_16255 ) ) ( ON ?auto_16249 ?auto_16248 ) ( ON ?auto_16250 ?auto_16249 ) ( not ( = ?auto_16248 ?auto_16249 ) ) ( not ( = ?auto_16248 ?auto_16250 ) ) ( not ( = ?auto_16248 ?auto_16247 ) ) ( not ( = ?auto_16248 ?auto_16251 ) ) ( not ( = ?auto_16249 ?auto_16250 ) ) ( not ( = ?auto_16249 ?auto_16247 ) ) ( not ( = ?auto_16249 ?auto_16251 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16250 ?auto_16247 ?auto_16251 )
      ( MAKE-4CRATE-VERIFY ?auto_16248 ?auto_16249 ?auto_16250 ?auto_16247 ?auto_16251 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16282 - SURFACE
      ?auto_16283 - SURFACE
      ?auto_16284 - SURFACE
      ?auto_16281 - SURFACE
      ?auto_16285 - SURFACE
    )
    :vars
    (
      ?auto_16289 - HOIST
      ?auto_16286 - PLACE
      ?auto_16287 - TRUCK
      ?auto_16288 - PLACE
      ?auto_16290 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16289 ?auto_16286 ) ( SURFACE-AT ?auto_16281 ?auto_16286 ) ( CLEAR ?auto_16281 ) ( IS-CRATE ?auto_16285 ) ( not ( = ?auto_16281 ?auto_16285 ) ) ( AVAILABLE ?auto_16289 ) ( ON ?auto_16281 ?auto_16284 ) ( not ( = ?auto_16284 ?auto_16281 ) ) ( not ( = ?auto_16284 ?auto_16285 ) ) ( TRUCK-AT ?auto_16287 ?auto_16288 ) ( not ( = ?auto_16288 ?auto_16286 ) ) ( HOIST-AT ?auto_16290 ?auto_16288 ) ( LIFTING ?auto_16290 ?auto_16285 ) ( not ( = ?auto_16289 ?auto_16290 ) ) ( ON ?auto_16283 ?auto_16282 ) ( ON ?auto_16284 ?auto_16283 ) ( not ( = ?auto_16282 ?auto_16283 ) ) ( not ( = ?auto_16282 ?auto_16284 ) ) ( not ( = ?auto_16282 ?auto_16281 ) ) ( not ( = ?auto_16282 ?auto_16285 ) ) ( not ( = ?auto_16283 ?auto_16284 ) ) ( not ( = ?auto_16283 ?auto_16281 ) ) ( not ( = ?auto_16283 ?auto_16285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16284 ?auto_16281 ?auto_16285 )
      ( MAKE-4CRATE-VERIFY ?auto_16282 ?auto_16283 ?auto_16284 ?auto_16281 ?auto_16285 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16320 - SURFACE
      ?auto_16321 - SURFACE
      ?auto_16322 - SURFACE
      ?auto_16319 - SURFACE
      ?auto_16323 - SURFACE
    )
    :vars
    (
      ?auto_16327 - HOIST
      ?auto_16324 - PLACE
      ?auto_16329 - TRUCK
      ?auto_16328 - PLACE
      ?auto_16325 - HOIST
      ?auto_16326 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16327 ?auto_16324 ) ( SURFACE-AT ?auto_16319 ?auto_16324 ) ( CLEAR ?auto_16319 ) ( IS-CRATE ?auto_16323 ) ( not ( = ?auto_16319 ?auto_16323 ) ) ( AVAILABLE ?auto_16327 ) ( ON ?auto_16319 ?auto_16322 ) ( not ( = ?auto_16322 ?auto_16319 ) ) ( not ( = ?auto_16322 ?auto_16323 ) ) ( TRUCK-AT ?auto_16329 ?auto_16328 ) ( not ( = ?auto_16328 ?auto_16324 ) ) ( HOIST-AT ?auto_16325 ?auto_16328 ) ( not ( = ?auto_16327 ?auto_16325 ) ) ( AVAILABLE ?auto_16325 ) ( SURFACE-AT ?auto_16323 ?auto_16328 ) ( ON ?auto_16323 ?auto_16326 ) ( CLEAR ?auto_16323 ) ( not ( = ?auto_16319 ?auto_16326 ) ) ( not ( = ?auto_16323 ?auto_16326 ) ) ( not ( = ?auto_16322 ?auto_16326 ) ) ( ON ?auto_16321 ?auto_16320 ) ( ON ?auto_16322 ?auto_16321 ) ( not ( = ?auto_16320 ?auto_16321 ) ) ( not ( = ?auto_16320 ?auto_16322 ) ) ( not ( = ?auto_16320 ?auto_16319 ) ) ( not ( = ?auto_16320 ?auto_16323 ) ) ( not ( = ?auto_16320 ?auto_16326 ) ) ( not ( = ?auto_16321 ?auto_16322 ) ) ( not ( = ?auto_16321 ?auto_16319 ) ) ( not ( = ?auto_16321 ?auto_16323 ) ) ( not ( = ?auto_16321 ?auto_16326 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16322 ?auto_16319 ?auto_16323 )
      ( MAKE-4CRATE-VERIFY ?auto_16320 ?auto_16321 ?auto_16322 ?auto_16319 ?auto_16323 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16359 - SURFACE
      ?auto_16360 - SURFACE
      ?auto_16361 - SURFACE
      ?auto_16358 - SURFACE
      ?auto_16362 - SURFACE
    )
    :vars
    (
      ?auto_16366 - HOIST
      ?auto_16368 - PLACE
      ?auto_16364 - PLACE
      ?auto_16365 - HOIST
      ?auto_16363 - SURFACE
      ?auto_16367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16366 ?auto_16368 ) ( SURFACE-AT ?auto_16358 ?auto_16368 ) ( CLEAR ?auto_16358 ) ( IS-CRATE ?auto_16362 ) ( not ( = ?auto_16358 ?auto_16362 ) ) ( AVAILABLE ?auto_16366 ) ( ON ?auto_16358 ?auto_16361 ) ( not ( = ?auto_16361 ?auto_16358 ) ) ( not ( = ?auto_16361 ?auto_16362 ) ) ( not ( = ?auto_16364 ?auto_16368 ) ) ( HOIST-AT ?auto_16365 ?auto_16364 ) ( not ( = ?auto_16366 ?auto_16365 ) ) ( AVAILABLE ?auto_16365 ) ( SURFACE-AT ?auto_16362 ?auto_16364 ) ( ON ?auto_16362 ?auto_16363 ) ( CLEAR ?auto_16362 ) ( not ( = ?auto_16358 ?auto_16363 ) ) ( not ( = ?auto_16362 ?auto_16363 ) ) ( not ( = ?auto_16361 ?auto_16363 ) ) ( TRUCK-AT ?auto_16367 ?auto_16368 ) ( ON ?auto_16360 ?auto_16359 ) ( ON ?auto_16361 ?auto_16360 ) ( not ( = ?auto_16359 ?auto_16360 ) ) ( not ( = ?auto_16359 ?auto_16361 ) ) ( not ( = ?auto_16359 ?auto_16358 ) ) ( not ( = ?auto_16359 ?auto_16362 ) ) ( not ( = ?auto_16359 ?auto_16363 ) ) ( not ( = ?auto_16360 ?auto_16361 ) ) ( not ( = ?auto_16360 ?auto_16358 ) ) ( not ( = ?auto_16360 ?auto_16362 ) ) ( not ( = ?auto_16360 ?auto_16363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16361 ?auto_16358 ?auto_16362 )
      ( MAKE-4CRATE-VERIFY ?auto_16359 ?auto_16360 ?auto_16361 ?auto_16358 ?auto_16362 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16398 - SURFACE
      ?auto_16399 - SURFACE
      ?auto_16400 - SURFACE
      ?auto_16397 - SURFACE
      ?auto_16401 - SURFACE
    )
    :vars
    (
      ?auto_16407 - HOIST
      ?auto_16405 - PLACE
      ?auto_16402 - PLACE
      ?auto_16404 - HOIST
      ?auto_16403 - SURFACE
      ?auto_16406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16407 ?auto_16405 ) ( IS-CRATE ?auto_16401 ) ( not ( = ?auto_16397 ?auto_16401 ) ) ( not ( = ?auto_16400 ?auto_16397 ) ) ( not ( = ?auto_16400 ?auto_16401 ) ) ( not ( = ?auto_16402 ?auto_16405 ) ) ( HOIST-AT ?auto_16404 ?auto_16402 ) ( not ( = ?auto_16407 ?auto_16404 ) ) ( AVAILABLE ?auto_16404 ) ( SURFACE-AT ?auto_16401 ?auto_16402 ) ( ON ?auto_16401 ?auto_16403 ) ( CLEAR ?auto_16401 ) ( not ( = ?auto_16397 ?auto_16403 ) ) ( not ( = ?auto_16401 ?auto_16403 ) ) ( not ( = ?auto_16400 ?auto_16403 ) ) ( TRUCK-AT ?auto_16406 ?auto_16405 ) ( SURFACE-AT ?auto_16400 ?auto_16405 ) ( CLEAR ?auto_16400 ) ( LIFTING ?auto_16407 ?auto_16397 ) ( IS-CRATE ?auto_16397 ) ( ON ?auto_16399 ?auto_16398 ) ( ON ?auto_16400 ?auto_16399 ) ( not ( = ?auto_16398 ?auto_16399 ) ) ( not ( = ?auto_16398 ?auto_16400 ) ) ( not ( = ?auto_16398 ?auto_16397 ) ) ( not ( = ?auto_16398 ?auto_16401 ) ) ( not ( = ?auto_16398 ?auto_16403 ) ) ( not ( = ?auto_16399 ?auto_16400 ) ) ( not ( = ?auto_16399 ?auto_16397 ) ) ( not ( = ?auto_16399 ?auto_16401 ) ) ( not ( = ?auto_16399 ?auto_16403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16400 ?auto_16397 ?auto_16401 )
      ( MAKE-4CRATE-VERIFY ?auto_16398 ?auto_16399 ?auto_16400 ?auto_16397 ?auto_16401 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16437 - SURFACE
      ?auto_16438 - SURFACE
      ?auto_16439 - SURFACE
      ?auto_16436 - SURFACE
      ?auto_16440 - SURFACE
    )
    :vars
    (
      ?auto_16444 - HOIST
      ?auto_16445 - PLACE
      ?auto_16443 - PLACE
      ?auto_16441 - HOIST
      ?auto_16446 - SURFACE
      ?auto_16442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16444 ?auto_16445 ) ( IS-CRATE ?auto_16440 ) ( not ( = ?auto_16436 ?auto_16440 ) ) ( not ( = ?auto_16439 ?auto_16436 ) ) ( not ( = ?auto_16439 ?auto_16440 ) ) ( not ( = ?auto_16443 ?auto_16445 ) ) ( HOIST-AT ?auto_16441 ?auto_16443 ) ( not ( = ?auto_16444 ?auto_16441 ) ) ( AVAILABLE ?auto_16441 ) ( SURFACE-AT ?auto_16440 ?auto_16443 ) ( ON ?auto_16440 ?auto_16446 ) ( CLEAR ?auto_16440 ) ( not ( = ?auto_16436 ?auto_16446 ) ) ( not ( = ?auto_16440 ?auto_16446 ) ) ( not ( = ?auto_16439 ?auto_16446 ) ) ( TRUCK-AT ?auto_16442 ?auto_16445 ) ( SURFACE-AT ?auto_16439 ?auto_16445 ) ( CLEAR ?auto_16439 ) ( IS-CRATE ?auto_16436 ) ( AVAILABLE ?auto_16444 ) ( IN ?auto_16436 ?auto_16442 ) ( ON ?auto_16438 ?auto_16437 ) ( ON ?auto_16439 ?auto_16438 ) ( not ( = ?auto_16437 ?auto_16438 ) ) ( not ( = ?auto_16437 ?auto_16439 ) ) ( not ( = ?auto_16437 ?auto_16436 ) ) ( not ( = ?auto_16437 ?auto_16440 ) ) ( not ( = ?auto_16437 ?auto_16446 ) ) ( not ( = ?auto_16438 ?auto_16439 ) ) ( not ( = ?auto_16438 ?auto_16436 ) ) ( not ( = ?auto_16438 ?auto_16440 ) ) ( not ( = ?auto_16438 ?auto_16446 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16439 ?auto_16436 ?auto_16440 )
      ( MAKE-4CRATE-VERIFY ?auto_16437 ?auto_16438 ?auto_16439 ?auto_16436 ?auto_16440 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16447 - SURFACE
      ?auto_16448 - SURFACE
    )
    :vars
    (
      ?auto_16452 - HOIST
      ?auto_16453 - PLACE
      ?auto_16455 - SURFACE
      ?auto_16451 - PLACE
      ?auto_16449 - HOIST
      ?auto_16454 - SURFACE
      ?auto_16450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16452 ?auto_16453 ) ( IS-CRATE ?auto_16448 ) ( not ( = ?auto_16447 ?auto_16448 ) ) ( not ( = ?auto_16455 ?auto_16447 ) ) ( not ( = ?auto_16455 ?auto_16448 ) ) ( not ( = ?auto_16451 ?auto_16453 ) ) ( HOIST-AT ?auto_16449 ?auto_16451 ) ( not ( = ?auto_16452 ?auto_16449 ) ) ( AVAILABLE ?auto_16449 ) ( SURFACE-AT ?auto_16448 ?auto_16451 ) ( ON ?auto_16448 ?auto_16454 ) ( CLEAR ?auto_16448 ) ( not ( = ?auto_16447 ?auto_16454 ) ) ( not ( = ?auto_16448 ?auto_16454 ) ) ( not ( = ?auto_16455 ?auto_16454 ) ) ( SURFACE-AT ?auto_16455 ?auto_16453 ) ( CLEAR ?auto_16455 ) ( IS-CRATE ?auto_16447 ) ( AVAILABLE ?auto_16452 ) ( IN ?auto_16447 ?auto_16450 ) ( TRUCK-AT ?auto_16450 ?auto_16451 ) )
    :subtasks
    ( ( !DRIVE ?auto_16450 ?auto_16451 ?auto_16453 )
      ( MAKE-2CRATE ?auto_16455 ?auto_16447 ?auto_16448 )
      ( MAKE-1CRATE-VERIFY ?auto_16447 ?auto_16448 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16456 - SURFACE
      ?auto_16457 - SURFACE
      ?auto_16458 - SURFACE
    )
    :vars
    (
      ?auto_16462 - HOIST
      ?auto_16461 - PLACE
      ?auto_16464 - PLACE
      ?auto_16460 - HOIST
      ?auto_16459 - SURFACE
      ?auto_16463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16462 ?auto_16461 ) ( IS-CRATE ?auto_16458 ) ( not ( = ?auto_16457 ?auto_16458 ) ) ( not ( = ?auto_16456 ?auto_16457 ) ) ( not ( = ?auto_16456 ?auto_16458 ) ) ( not ( = ?auto_16464 ?auto_16461 ) ) ( HOIST-AT ?auto_16460 ?auto_16464 ) ( not ( = ?auto_16462 ?auto_16460 ) ) ( AVAILABLE ?auto_16460 ) ( SURFACE-AT ?auto_16458 ?auto_16464 ) ( ON ?auto_16458 ?auto_16459 ) ( CLEAR ?auto_16458 ) ( not ( = ?auto_16457 ?auto_16459 ) ) ( not ( = ?auto_16458 ?auto_16459 ) ) ( not ( = ?auto_16456 ?auto_16459 ) ) ( SURFACE-AT ?auto_16456 ?auto_16461 ) ( CLEAR ?auto_16456 ) ( IS-CRATE ?auto_16457 ) ( AVAILABLE ?auto_16462 ) ( IN ?auto_16457 ?auto_16463 ) ( TRUCK-AT ?auto_16463 ?auto_16464 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16457 ?auto_16458 )
      ( MAKE-2CRATE-VERIFY ?auto_16456 ?auto_16457 ?auto_16458 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16466 - SURFACE
      ?auto_16467 - SURFACE
      ?auto_16468 - SURFACE
      ?auto_16465 - SURFACE
    )
    :vars
    (
      ?auto_16474 - HOIST
      ?auto_16472 - PLACE
      ?auto_16470 - PLACE
      ?auto_16469 - HOIST
      ?auto_16473 - SURFACE
      ?auto_16471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16474 ?auto_16472 ) ( IS-CRATE ?auto_16465 ) ( not ( = ?auto_16468 ?auto_16465 ) ) ( not ( = ?auto_16467 ?auto_16468 ) ) ( not ( = ?auto_16467 ?auto_16465 ) ) ( not ( = ?auto_16470 ?auto_16472 ) ) ( HOIST-AT ?auto_16469 ?auto_16470 ) ( not ( = ?auto_16474 ?auto_16469 ) ) ( AVAILABLE ?auto_16469 ) ( SURFACE-AT ?auto_16465 ?auto_16470 ) ( ON ?auto_16465 ?auto_16473 ) ( CLEAR ?auto_16465 ) ( not ( = ?auto_16468 ?auto_16473 ) ) ( not ( = ?auto_16465 ?auto_16473 ) ) ( not ( = ?auto_16467 ?auto_16473 ) ) ( SURFACE-AT ?auto_16467 ?auto_16472 ) ( CLEAR ?auto_16467 ) ( IS-CRATE ?auto_16468 ) ( AVAILABLE ?auto_16474 ) ( IN ?auto_16468 ?auto_16471 ) ( TRUCK-AT ?auto_16471 ?auto_16470 ) ( ON ?auto_16467 ?auto_16466 ) ( not ( = ?auto_16466 ?auto_16467 ) ) ( not ( = ?auto_16466 ?auto_16468 ) ) ( not ( = ?auto_16466 ?auto_16465 ) ) ( not ( = ?auto_16466 ?auto_16473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16467 ?auto_16468 ?auto_16465 )
      ( MAKE-3CRATE-VERIFY ?auto_16466 ?auto_16467 ?auto_16468 ?auto_16465 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16476 - SURFACE
      ?auto_16477 - SURFACE
      ?auto_16478 - SURFACE
      ?auto_16475 - SURFACE
      ?auto_16479 - SURFACE
    )
    :vars
    (
      ?auto_16485 - HOIST
      ?auto_16483 - PLACE
      ?auto_16481 - PLACE
      ?auto_16480 - HOIST
      ?auto_16484 - SURFACE
      ?auto_16482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16485 ?auto_16483 ) ( IS-CRATE ?auto_16479 ) ( not ( = ?auto_16475 ?auto_16479 ) ) ( not ( = ?auto_16478 ?auto_16475 ) ) ( not ( = ?auto_16478 ?auto_16479 ) ) ( not ( = ?auto_16481 ?auto_16483 ) ) ( HOIST-AT ?auto_16480 ?auto_16481 ) ( not ( = ?auto_16485 ?auto_16480 ) ) ( AVAILABLE ?auto_16480 ) ( SURFACE-AT ?auto_16479 ?auto_16481 ) ( ON ?auto_16479 ?auto_16484 ) ( CLEAR ?auto_16479 ) ( not ( = ?auto_16475 ?auto_16484 ) ) ( not ( = ?auto_16479 ?auto_16484 ) ) ( not ( = ?auto_16478 ?auto_16484 ) ) ( SURFACE-AT ?auto_16478 ?auto_16483 ) ( CLEAR ?auto_16478 ) ( IS-CRATE ?auto_16475 ) ( AVAILABLE ?auto_16485 ) ( IN ?auto_16475 ?auto_16482 ) ( TRUCK-AT ?auto_16482 ?auto_16481 ) ( ON ?auto_16477 ?auto_16476 ) ( ON ?auto_16478 ?auto_16477 ) ( not ( = ?auto_16476 ?auto_16477 ) ) ( not ( = ?auto_16476 ?auto_16478 ) ) ( not ( = ?auto_16476 ?auto_16475 ) ) ( not ( = ?auto_16476 ?auto_16479 ) ) ( not ( = ?auto_16476 ?auto_16484 ) ) ( not ( = ?auto_16477 ?auto_16478 ) ) ( not ( = ?auto_16477 ?auto_16475 ) ) ( not ( = ?auto_16477 ?auto_16479 ) ) ( not ( = ?auto_16477 ?auto_16484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16478 ?auto_16475 ?auto_16479 )
      ( MAKE-4CRATE-VERIFY ?auto_16476 ?auto_16477 ?auto_16478 ?auto_16475 ?auto_16479 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16486 - SURFACE
      ?auto_16487 - SURFACE
    )
    :vars
    (
      ?auto_16494 - HOIST
      ?auto_16492 - PLACE
      ?auto_16488 - SURFACE
      ?auto_16490 - PLACE
      ?auto_16489 - HOIST
      ?auto_16493 - SURFACE
      ?auto_16491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16494 ?auto_16492 ) ( IS-CRATE ?auto_16487 ) ( not ( = ?auto_16486 ?auto_16487 ) ) ( not ( = ?auto_16488 ?auto_16486 ) ) ( not ( = ?auto_16488 ?auto_16487 ) ) ( not ( = ?auto_16490 ?auto_16492 ) ) ( HOIST-AT ?auto_16489 ?auto_16490 ) ( not ( = ?auto_16494 ?auto_16489 ) ) ( SURFACE-AT ?auto_16487 ?auto_16490 ) ( ON ?auto_16487 ?auto_16493 ) ( CLEAR ?auto_16487 ) ( not ( = ?auto_16486 ?auto_16493 ) ) ( not ( = ?auto_16487 ?auto_16493 ) ) ( not ( = ?auto_16488 ?auto_16493 ) ) ( SURFACE-AT ?auto_16488 ?auto_16492 ) ( CLEAR ?auto_16488 ) ( IS-CRATE ?auto_16486 ) ( AVAILABLE ?auto_16494 ) ( TRUCK-AT ?auto_16491 ?auto_16490 ) ( LIFTING ?auto_16489 ?auto_16486 ) )
    :subtasks
    ( ( !LOAD ?auto_16489 ?auto_16486 ?auto_16491 ?auto_16490 )
      ( MAKE-2CRATE ?auto_16488 ?auto_16486 ?auto_16487 )
      ( MAKE-1CRATE-VERIFY ?auto_16486 ?auto_16487 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16495 - SURFACE
      ?auto_16496 - SURFACE
      ?auto_16497 - SURFACE
    )
    :vars
    (
      ?auto_16503 - HOIST
      ?auto_16498 - PLACE
      ?auto_16502 - PLACE
      ?auto_16500 - HOIST
      ?auto_16501 - SURFACE
      ?auto_16499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16503 ?auto_16498 ) ( IS-CRATE ?auto_16497 ) ( not ( = ?auto_16496 ?auto_16497 ) ) ( not ( = ?auto_16495 ?auto_16496 ) ) ( not ( = ?auto_16495 ?auto_16497 ) ) ( not ( = ?auto_16502 ?auto_16498 ) ) ( HOIST-AT ?auto_16500 ?auto_16502 ) ( not ( = ?auto_16503 ?auto_16500 ) ) ( SURFACE-AT ?auto_16497 ?auto_16502 ) ( ON ?auto_16497 ?auto_16501 ) ( CLEAR ?auto_16497 ) ( not ( = ?auto_16496 ?auto_16501 ) ) ( not ( = ?auto_16497 ?auto_16501 ) ) ( not ( = ?auto_16495 ?auto_16501 ) ) ( SURFACE-AT ?auto_16495 ?auto_16498 ) ( CLEAR ?auto_16495 ) ( IS-CRATE ?auto_16496 ) ( AVAILABLE ?auto_16503 ) ( TRUCK-AT ?auto_16499 ?auto_16502 ) ( LIFTING ?auto_16500 ?auto_16496 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16496 ?auto_16497 )
      ( MAKE-2CRATE-VERIFY ?auto_16495 ?auto_16496 ?auto_16497 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16505 - SURFACE
      ?auto_16506 - SURFACE
      ?auto_16507 - SURFACE
      ?auto_16504 - SURFACE
    )
    :vars
    (
      ?auto_16509 - HOIST
      ?auto_16513 - PLACE
      ?auto_16510 - PLACE
      ?auto_16511 - HOIST
      ?auto_16512 - SURFACE
      ?auto_16508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16509 ?auto_16513 ) ( IS-CRATE ?auto_16504 ) ( not ( = ?auto_16507 ?auto_16504 ) ) ( not ( = ?auto_16506 ?auto_16507 ) ) ( not ( = ?auto_16506 ?auto_16504 ) ) ( not ( = ?auto_16510 ?auto_16513 ) ) ( HOIST-AT ?auto_16511 ?auto_16510 ) ( not ( = ?auto_16509 ?auto_16511 ) ) ( SURFACE-AT ?auto_16504 ?auto_16510 ) ( ON ?auto_16504 ?auto_16512 ) ( CLEAR ?auto_16504 ) ( not ( = ?auto_16507 ?auto_16512 ) ) ( not ( = ?auto_16504 ?auto_16512 ) ) ( not ( = ?auto_16506 ?auto_16512 ) ) ( SURFACE-AT ?auto_16506 ?auto_16513 ) ( CLEAR ?auto_16506 ) ( IS-CRATE ?auto_16507 ) ( AVAILABLE ?auto_16509 ) ( TRUCK-AT ?auto_16508 ?auto_16510 ) ( LIFTING ?auto_16511 ?auto_16507 ) ( ON ?auto_16506 ?auto_16505 ) ( not ( = ?auto_16505 ?auto_16506 ) ) ( not ( = ?auto_16505 ?auto_16507 ) ) ( not ( = ?auto_16505 ?auto_16504 ) ) ( not ( = ?auto_16505 ?auto_16512 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16506 ?auto_16507 ?auto_16504 )
      ( MAKE-3CRATE-VERIFY ?auto_16505 ?auto_16506 ?auto_16507 ?auto_16504 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16515 - SURFACE
      ?auto_16516 - SURFACE
      ?auto_16517 - SURFACE
      ?auto_16514 - SURFACE
      ?auto_16518 - SURFACE
    )
    :vars
    (
      ?auto_16520 - HOIST
      ?auto_16524 - PLACE
      ?auto_16521 - PLACE
      ?auto_16522 - HOIST
      ?auto_16523 - SURFACE
      ?auto_16519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16520 ?auto_16524 ) ( IS-CRATE ?auto_16518 ) ( not ( = ?auto_16514 ?auto_16518 ) ) ( not ( = ?auto_16517 ?auto_16514 ) ) ( not ( = ?auto_16517 ?auto_16518 ) ) ( not ( = ?auto_16521 ?auto_16524 ) ) ( HOIST-AT ?auto_16522 ?auto_16521 ) ( not ( = ?auto_16520 ?auto_16522 ) ) ( SURFACE-AT ?auto_16518 ?auto_16521 ) ( ON ?auto_16518 ?auto_16523 ) ( CLEAR ?auto_16518 ) ( not ( = ?auto_16514 ?auto_16523 ) ) ( not ( = ?auto_16518 ?auto_16523 ) ) ( not ( = ?auto_16517 ?auto_16523 ) ) ( SURFACE-AT ?auto_16517 ?auto_16524 ) ( CLEAR ?auto_16517 ) ( IS-CRATE ?auto_16514 ) ( AVAILABLE ?auto_16520 ) ( TRUCK-AT ?auto_16519 ?auto_16521 ) ( LIFTING ?auto_16522 ?auto_16514 ) ( ON ?auto_16516 ?auto_16515 ) ( ON ?auto_16517 ?auto_16516 ) ( not ( = ?auto_16515 ?auto_16516 ) ) ( not ( = ?auto_16515 ?auto_16517 ) ) ( not ( = ?auto_16515 ?auto_16514 ) ) ( not ( = ?auto_16515 ?auto_16518 ) ) ( not ( = ?auto_16515 ?auto_16523 ) ) ( not ( = ?auto_16516 ?auto_16517 ) ) ( not ( = ?auto_16516 ?auto_16514 ) ) ( not ( = ?auto_16516 ?auto_16518 ) ) ( not ( = ?auto_16516 ?auto_16523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16517 ?auto_16514 ?auto_16518 )
      ( MAKE-4CRATE-VERIFY ?auto_16515 ?auto_16516 ?auto_16517 ?auto_16514 ?auto_16518 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16525 - SURFACE
      ?auto_16526 - SURFACE
    )
    :vars
    (
      ?auto_16528 - HOIST
      ?auto_16533 - PLACE
      ?auto_16532 - SURFACE
      ?auto_16529 - PLACE
      ?auto_16530 - HOIST
      ?auto_16531 - SURFACE
      ?auto_16527 - TRUCK
      ?auto_16534 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16528 ?auto_16533 ) ( IS-CRATE ?auto_16526 ) ( not ( = ?auto_16525 ?auto_16526 ) ) ( not ( = ?auto_16532 ?auto_16525 ) ) ( not ( = ?auto_16532 ?auto_16526 ) ) ( not ( = ?auto_16529 ?auto_16533 ) ) ( HOIST-AT ?auto_16530 ?auto_16529 ) ( not ( = ?auto_16528 ?auto_16530 ) ) ( SURFACE-AT ?auto_16526 ?auto_16529 ) ( ON ?auto_16526 ?auto_16531 ) ( CLEAR ?auto_16526 ) ( not ( = ?auto_16525 ?auto_16531 ) ) ( not ( = ?auto_16526 ?auto_16531 ) ) ( not ( = ?auto_16532 ?auto_16531 ) ) ( SURFACE-AT ?auto_16532 ?auto_16533 ) ( CLEAR ?auto_16532 ) ( IS-CRATE ?auto_16525 ) ( AVAILABLE ?auto_16528 ) ( TRUCK-AT ?auto_16527 ?auto_16529 ) ( AVAILABLE ?auto_16530 ) ( SURFACE-AT ?auto_16525 ?auto_16529 ) ( ON ?auto_16525 ?auto_16534 ) ( CLEAR ?auto_16525 ) ( not ( = ?auto_16525 ?auto_16534 ) ) ( not ( = ?auto_16526 ?auto_16534 ) ) ( not ( = ?auto_16532 ?auto_16534 ) ) ( not ( = ?auto_16531 ?auto_16534 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16530 ?auto_16525 ?auto_16534 ?auto_16529 )
      ( MAKE-2CRATE ?auto_16532 ?auto_16525 ?auto_16526 )
      ( MAKE-1CRATE-VERIFY ?auto_16525 ?auto_16526 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16535 - SURFACE
      ?auto_16536 - SURFACE
      ?auto_16537 - SURFACE
    )
    :vars
    (
      ?auto_16543 - HOIST
      ?auto_16544 - PLACE
      ?auto_16542 - PLACE
      ?auto_16541 - HOIST
      ?auto_16540 - SURFACE
      ?auto_16539 - TRUCK
      ?auto_16538 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16543 ?auto_16544 ) ( IS-CRATE ?auto_16537 ) ( not ( = ?auto_16536 ?auto_16537 ) ) ( not ( = ?auto_16535 ?auto_16536 ) ) ( not ( = ?auto_16535 ?auto_16537 ) ) ( not ( = ?auto_16542 ?auto_16544 ) ) ( HOIST-AT ?auto_16541 ?auto_16542 ) ( not ( = ?auto_16543 ?auto_16541 ) ) ( SURFACE-AT ?auto_16537 ?auto_16542 ) ( ON ?auto_16537 ?auto_16540 ) ( CLEAR ?auto_16537 ) ( not ( = ?auto_16536 ?auto_16540 ) ) ( not ( = ?auto_16537 ?auto_16540 ) ) ( not ( = ?auto_16535 ?auto_16540 ) ) ( SURFACE-AT ?auto_16535 ?auto_16544 ) ( CLEAR ?auto_16535 ) ( IS-CRATE ?auto_16536 ) ( AVAILABLE ?auto_16543 ) ( TRUCK-AT ?auto_16539 ?auto_16542 ) ( AVAILABLE ?auto_16541 ) ( SURFACE-AT ?auto_16536 ?auto_16542 ) ( ON ?auto_16536 ?auto_16538 ) ( CLEAR ?auto_16536 ) ( not ( = ?auto_16536 ?auto_16538 ) ) ( not ( = ?auto_16537 ?auto_16538 ) ) ( not ( = ?auto_16535 ?auto_16538 ) ) ( not ( = ?auto_16540 ?auto_16538 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16536 ?auto_16537 )
      ( MAKE-2CRATE-VERIFY ?auto_16535 ?auto_16536 ?auto_16537 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16546 - SURFACE
      ?auto_16547 - SURFACE
      ?auto_16548 - SURFACE
      ?auto_16545 - SURFACE
    )
    :vars
    (
      ?auto_16555 - HOIST
      ?auto_16554 - PLACE
      ?auto_16552 - PLACE
      ?auto_16550 - HOIST
      ?auto_16553 - SURFACE
      ?auto_16551 - TRUCK
      ?auto_16549 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16555 ?auto_16554 ) ( IS-CRATE ?auto_16545 ) ( not ( = ?auto_16548 ?auto_16545 ) ) ( not ( = ?auto_16547 ?auto_16548 ) ) ( not ( = ?auto_16547 ?auto_16545 ) ) ( not ( = ?auto_16552 ?auto_16554 ) ) ( HOIST-AT ?auto_16550 ?auto_16552 ) ( not ( = ?auto_16555 ?auto_16550 ) ) ( SURFACE-AT ?auto_16545 ?auto_16552 ) ( ON ?auto_16545 ?auto_16553 ) ( CLEAR ?auto_16545 ) ( not ( = ?auto_16548 ?auto_16553 ) ) ( not ( = ?auto_16545 ?auto_16553 ) ) ( not ( = ?auto_16547 ?auto_16553 ) ) ( SURFACE-AT ?auto_16547 ?auto_16554 ) ( CLEAR ?auto_16547 ) ( IS-CRATE ?auto_16548 ) ( AVAILABLE ?auto_16555 ) ( TRUCK-AT ?auto_16551 ?auto_16552 ) ( AVAILABLE ?auto_16550 ) ( SURFACE-AT ?auto_16548 ?auto_16552 ) ( ON ?auto_16548 ?auto_16549 ) ( CLEAR ?auto_16548 ) ( not ( = ?auto_16548 ?auto_16549 ) ) ( not ( = ?auto_16545 ?auto_16549 ) ) ( not ( = ?auto_16547 ?auto_16549 ) ) ( not ( = ?auto_16553 ?auto_16549 ) ) ( ON ?auto_16547 ?auto_16546 ) ( not ( = ?auto_16546 ?auto_16547 ) ) ( not ( = ?auto_16546 ?auto_16548 ) ) ( not ( = ?auto_16546 ?auto_16545 ) ) ( not ( = ?auto_16546 ?auto_16553 ) ) ( not ( = ?auto_16546 ?auto_16549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16547 ?auto_16548 ?auto_16545 )
      ( MAKE-3CRATE-VERIFY ?auto_16546 ?auto_16547 ?auto_16548 ?auto_16545 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16557 - SURFACE
      ?auto_16558 - SURFACE
      ?auto_16559 - SURFACE
      ?auto_16556 - SURFACE
      ?auto_16560 - SURFACE
    )
    :vars
    (
      ?auto_16567 - HOIST
      ?auto_16566 - PLACE
      ?auto_16564 - PLACE
      ?auto_16562 - HOIST
      ?auto_16565 - SURFACE
      ?auto_16563 - TRUCK
      ?auto_16561 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16567 ?auto_16566 ) ( IS-CRATE ?auto_16560 ) ( not ( = ?auto_16556 ?auto_16560 ) ) ( not ( = ?auto_16559 ?auto_16556 ) ) ( not ( = ?auto_16559 ?auto_16560 ) ) ( not ( = ?auto_16564 ?auto_16566 ) ) ( HOIST-AT ?auto_16562 ?auto_16564 ) ( not ( = ?auto_16567 ?auto_16562 ) ) ( SURFACE-AT ?auto_16560 ?auto_16564 ) ( ON ?auto_16560 ?auto_16565 ) ( CLEAR ?auto_16560 ) ( not ( = ?auto_16556 ?auto_16565 ) ) ( not ( = ?auto_16560 ?auto_16565 ) ) ( not ( = ?auto_16559 ?auto_16565 ) ) ( SURFACE-AT ?auto_16559 ?auto_16566 ) ( CLEAR ?auto_16559 ) ( IS-CRATE ?auto_16556 ) ( AVAILABLE ?auto_16567 ) ( TRUCK-AT ?auto_16563 ?auto_16564 ) ( AVAILABLE ?auto_16562 ) ( SURFACE-AT ?auto_16556 ?auto_16564 ) ( ON ?auto_16556 ?auto_16561 ) ( CLEAR ?auto_16556 ) ( not ( = ?auto_16556 ?auto_16561 ) ) ( not ( = ?auto_16560 ?auto_16561 ) ) ( not ( = ?auto_16559 ?auto_16561 ) ) ( not ( = ?auto_16565 ?auto_16561 ) ) ( ON ?auto_16558 ?auto_16557 ) ( ON ?auto_16559 ?auto_16558 ) ( not ( = ?auto_16557 ?auto_16558 ) ) ( not ( = ?auto_16557 ?auto_16559 ) ) ( not ( = ?auto_16557 ?auto_16556 ) ) ( not ( = ?auto_16557 ?auto_16560 ) ) ( not ( = ?auto_16557 ?auto_16565 ) ) ( not ( = ?auto_16557 ?auto_16561 ) ) ( not ( = ?auto_16558 ?auto_16559 ) ) ( not ( = ?auto_16558 ?auto_16556 ) ) ( not ( = ?auto_16558 ?auto_16560 ) ) ( not ( = ?auto_16558 ?auto_16565 ) ) ( not ( = ?auto_16558 ?auto_16561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16559 ?auto_16556 ?auto_16560 )
      ( MAKE-4CRATE-VERIFY ?auto_16557 ?auto_16558 ?auto_16559 ?auto_16556 ?auto_16560 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16568 - SURFACE
      ?auto_16569 - SURFACE
    )
    :vars
    (
      ?auto_16576 - HOIST
      ?auto_16575 - PLACE
      ?auto_16577 - SURFACE
      ?auto_16573 - PLACE
      ?auto_16571 - HOIST
      ?auto_16574 - SURFACE
      ?auto_16570 - SURFACE
      ?auto_16572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16576 ?auto_16575 ) ( IS-CRATE ?auto_16569 ) ( not ( = ?auto_16568 ?auto_16569 ) ) ( not ( = ?auto_16577 ?auto_16568 ) ) ( not ( = ?auto_16577 ?auto_16569 ) ) ( not ( = ?auto_16573 ?auto_16575 ) ) ( HOIST-AT ?auto_16571 ?auto_16573 ) ( not ( = ?auto_16576 ?auto_16571 ) ) ( SURFACE-AT ?auto_16569 ?auto_16573 ) ( ON ?auto_16569 ?auto_16574 ) ( CLEAR ?auto_16569 ) ( not ( = ?auto_16568 ?auto_16574 ) ) ( not ( = ?auto_16569 ?auto_16574 ) ) ( not ( = ?auto_16577 ?auto_16574 ) ) ( SURFACE-AT ?auto_16577 ?auto_16575 ) ( CLEAR ?auto_16577 ) ( IS-CRATE ?auto_16568 ) ( AVAILABLE ?auto_16576 ) ( AVAILABLE ?auto_16571 ) ( SURFACE-AT ?auto_16568 ?auto_16573 ) ( ON ?auto_16568 ?auto_16570 ) ( CLEAR ?auto_16568 ) ( not ( = ?auto_16568 ?auto_16570 ) ) ( not ( = ?auto_16569 ?auto_16570 ) ) ( not ( = ?auto_16577 ?auto_16570 ) ) ( not ( = ?auto_16574 ?auto_16570 ) ) ( TRUCK-AT ?auto_16572 ?auto_16575 ) )
    :subtasks
    ( ( !DRIVE ?auto_16572 ?auto_16575 ?auto_16573 )
      ( MAKE-2CRATE ?auto_16577 ?auto_16568 ?auto_16569 )
      ( MAKE-1CRATE-VERIFY ?auto_16568 ?auto_16569 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16578 - SURFACE
      ?auto_16579 - SURFACE
      ?auto_16580 - SURFACE
    )
    :vars
    (
      ?auto_16586 - HOIST
      ?auto_16582 - PLACE
      ?auto_16581 - PLACE
      ?auto_16585 - HOIST
      ?auto_16587 - SURFACE
      ?auto_16583 - SURFACE
      ?auto_16584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16586 ?auto_16582 ) ( IS-CRATE ?auto_16580 ) ( not ( = ?auto_16579 ?auto_16580 ) ) ( not ( = ?auto_16578 ?auto_16579 ) ) ( not ( = ?auto_16578 ?auto_16580 ) ) ( not ( = ?auto_16581 ?auto_16582 ) ) ( HOIST-AT ?auto_16585 ?auto_16581 ) ( not ( = ?auto_16586 ?auto_16585 ) ) ( SURFACE-AT ?auto_16580 ?auto_16581 ) ( ON ?auto_16580 ?auto_16587 ) ( CLEAR ?auto_16580 ) ( not ( = ?auto_16579 ?auto_16587 ) ) ( not ( = ?auto_16580 ?auto_16587 ) ) ( not ( = ?auto_16578 ?auto_16587 ) ) ( SURFACE-AT ?auto_16578 ?auto_16582 ) ( CLEAR ?auto_16578 ) ( IS-CRATE ?auto_16579 ) ( AVAILABLE ?auto_16586 ) ( AVAILABLE ?auto_16585 ) ( SURFACE-AT ?auto_16579 ?auto_16581 ) ( ON ?auto_16579 ?auto_16583 ) ( CLEAR ?auto_16579 ) ( not ( = ?auto_16579 ?auto_16583 ) ) ( not ( = ?auto_16580 ?auto_16583 ) ) ( not ( = ?auto_16578 ?auto_16583 ) ) ( not ( = ?auto_16587 ?auto_16583 ) ) ( TRUCK-AT ?auto_16584 ?auto_16582 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16579 ?auto_16580 )
      ( MAKE-2CRATE-VERIFY ?auto_16578 ?auto_16579 ?auto_16580 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16589 - SURFACE
      ?auto_16590 - SURFACE
      ?auto_16591 - SURFACE
      ?auto_16588 - SURFACE
    )
    :vars
    (
      ?auto_16593 - HOIST
      ?auto_16598 - PLACE
      ?auto_16596 - PLACE
      ?auto_16597 - HOIST
      ?auto_16592 - SURFACE
      ?auto_16594 - SURFACE
      ?auto_16595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16593 ?auto_16598 ) ( IS-CRATE ?auto_16588 ) ( not ( = ?auto_16591 ?auto_16588 ) ) ( not ( = ?auto_16590 ?auto_16591 ) ) ( not ( = ?auto_16590 ?auto_16588 ) ) ( not ( = ?auto_16596 ?auto_16598 ) ) ( HOIST-AT ?auto_16597 ?auto_16596 ) ( not ( = ?auto_16593 ?auto_16597 ) ) ( SURFACE-AT ?auto_16588 ?auto_16596 ) ( ON ?auto_16588 ?auto_16592 ) ( CLEAR ?auto_16588 ) ( not ( = ?auto_16591 ?auto_16592 ) ) ( not ( = ?auto_16588 ?auto_16592 ) ) ( not ( = ?auto_16590 ?auto_16592 ) ) ( SURFACE-AT ?auto_16590 ?auto_16598 ) ( CLEAR ?auto_16590 ) ( IS-CRATE ?auto_16591 ) ( AVAILABLE ?auto_16593 ) ( AVAILABLE ?auto_16597 ) ( SURFACE-AT ?auto_16591 ?auto_16596 ) ( ON ?auto_16591 ?auto_16594 ) ( CLEAR ?auto_16591 ) ( not ( = ?auto_16591 ?auto_16594 ) ) ( not ( = ?auto_16588 ?auto_16594 ) ) ( not ( = ?auto_16590 ?auto_16594 ) ) ( not ( = ?auto_16592 ?auto_16594 ) ) ( TRUCK-AT ?auto_16595 ?auto_16598 ) ( ON ?auto_16590 ?auto_16589 ) ( not ( = ?auto_16589 ?auto_16590 ) ) ( not ( = ?auto_16589 ?auto_16591 ) ) ( not ( = ?auto_16589 ?auto_16588 ) ) ( not ( = ?auto_16589 ?auto_16592 ) ) ( not ( = ?auto_16589 ?auto_16594 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16590 ?auto_16591 ?auto_16588 )
      ( MAKE-3CRATE-VERIFY ?auto_16589 ?auto_16590 ?auto_16591 ?auto_16588 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16600 - SURFACE
      ?auto_16601 - SURFACE
      ?auto_16602 - SURFACE
      ?auto_16599 - SURFACE
      ?auto_16603 - SURFACE
    )
    :vars
    (
      ?auto_16605 - HOIST
      ?auto_16610 - PLACE
      ?auto_16608 - PLACE
      ?auto_16609 - HOIST
      ?auto_16604 - SURFACE
      ?auto_16606 - SURFACE
      ?auto_16607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16605 ?auto_16610 ) ( IS-CRATE ?auto_16603 ) ( not ( = ?auto_16599 ?auto_16603 ) ) ( not ( = ?auto_16602 ?auto_16599 ) ) ( not ( = ?auto_16602 ?auto_16603 ) ) ( not ( = ?auto_16608 ?auto_16610 ) ) ( HOIST-AT ?auto_16609 ?auto_16608 ) ( not ( = ?auto_16605 ?auto_16609 ) ) ( SURFACE-AT ?auto_16603 ?auto_16608 ) ( ON ?auto_16603 ?auto_16604 ) ( CLEAR ?auto_16603 ) ( not ( = ?auto_16599 ?auto_16604 ) ) ( not ( = ?auto_16603 ?auto_16604 ) ) ( not ( = ?auto_16602 ?auto_16604 ) ) ( SURFACE-AT ?auto_16602 ?auto_16610 ) ( CLEAR ?auto_16602 ) ( IS-CRATE ?auto_16599 ) ( AVAILABLE ?auto_16605 ) ( AVAILABLE ?auto_16609 ) ( SURFACE-AT ?auto_16599 ?auto_16608 ) ( ON ?auto_16599 ?auto_16606 ) ( CLEAR ?auto_16599 ) ( not ( = ?auto_16599 ?auto_16606 ) ) ( not ( = ?auto_16603 ?auto_16606 ) ) ( not ( = ?auto_16602 ?auto_16606 ) ) ( not ( = ?auto_16604 ?auto_16606 ) ) ( TRUCK-AT ?auto_16607 ?auto_16610 ) ( ON ?auto_16601 ?auto_16600 ) ( ON ?auto_16602 ?auto_16601 ) ( not ( = ?auto_16600 ?auto_16601 ) ) ( not ( = ?auto_16600 ?auto_16602 ) ) ( not ( = ?auto_16600 ?auto_16599 ) ) ( not ( = ?auto_16600 ?auto_16603 ) ) ( not ( = ?auto_16600 ?auto_16604 ) ) ( not ( = ?auto_16600 ?auto_16606 ) ) ( not ( = ?auto_16601 ?auto_16602 ) ) ( not ( = ?auto_16601 ?auto_16599 ) ) ( not ( = ?auto_16601 ?auto_16603 ) ) ( not ( = ?auto_16601 ?auto_16604 ) ) ( not ( = ?auto_16601 ?auto_16606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16602 ?auto_16599 ?auto_16603 )
      ( MAKE-4CRATE-VERIFY ?auto_16600 ?auto_16601 ?auto_16602 ?auto_16599 ?auto_16603 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16611 - SURFACE
      ?auto_16612 - SURFACE
    )
    :vars
    (
      ?auto_16614 - HOIST
      ?auto_16619 - PLACE
      ?auto_16620 - SURFACE
      ?auto_16617 - PLACE
      ?auto_16618 - HOIST
      ?auto_16613 - SURFACE
      ?auto_16615 - SURFACE
      ?auto_16616 - TRUCK
      ?auto_16621 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16614 ?auto_16619 ) ( IS-CRATE ?auto_16612 ) ( not ( = ?auto_16611 ?auto_16612 ) ) ( not ( = ?auto_16620 ?auto_16611 ) ) ( not ( = ?auto_16620 ?auto_16612 ) ) ( not ( = ?auto_16617 ?auto_16619 ) ) ( HOIST-AT ?auto_16618 ?auto_16617 ) ( not ( = ?auto_16614 ?auto_16618 ) ) ( SURFACE-AT ?auto_16612 ?auto_16617 ) ( ON ?auto_16612 ?auto_16613 ) ( CLEAR ?auto_16612 ) ( not ( = ?auto_16611 ?auto_16613 ) ) ( not ( = ?auto_16612 ?auto_16613 ) ) ( not ( = ?auto_16620 ?auto_16613 ) ) ( IS-CRATE ?auto_16611 ) ( AVAILABLE ?auto_16618 ) ( SURFACE-AT ?auto_16611 ?auto_16617 ) ( ON ?auto_16611 ?auto_16615 ) ( CLEAR ?auto_16611 ) ( not ( = ?auto_16611 ?auto_16615 ) ) ( not ( = ?auto_16612 ?auto_16615 ) ) ( not ( = ?auto_16620 ?auto_16615 ) ) ( not ( = ?auto_16613 ?auto_16615 ) ) ( TRUCK-AT ?auto_16616 ?auto_16619 ) ( SURFACE-AT ?auto_16621 ?auto_16619 ) ( CLEAR ?auto_16621 ) ( LIFTING ?auto_16614 ?auto_16620 ) ( IS-CRATE ?auto_16620 ) ( not ( = ?auto_16621 ?auto_16620 ) ) ( not ( = ?auto_16611 ?auto_16621 ) ) ( not ( = ?auto_16612 ?auto_16621 ) ) ( not ( = ?auto_16613 ?auto_16621 ) ) ( not ( = ?auto_16615 ?auto_16621 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16621 ?auto_16620 )
      ( MAKE-2CRATE ?auto_16620 ?auto_16611 ?auto_16612 )
      ( MAKE-1CRATE-VERIFY ?auto_16611 ?auto_16612 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16622 - SURFACE
      ?auto_16623 - SURFACE
      ?auto_16624 - SURFACE
    )
    :vars
    (
      ?auto_16632 - HOIST
      ?auto_16625 - PLACE
      ?auto_16631 - PLACE
      ?auto_16629 - HOIST
      ?auto_16628 - SURFACE
      ?auto_16627 - SURFACE
      ?auto_16626 - TRUCK
      ?auto_16630 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16632 ?auto_16625 ) ( IS-CRATE ?auto_16624 ) ( not ( = ?auto_16623 ?auto_16624 ) ) ( not ( = ?auto_16622 ?auto_16623 ) ) ( not ( = ?auto_16622 ?auto_16624 ) ) ( not ( = ?auto_16631 ?auto_16625 ) ) ( HOIST-AT ?auto_16629 ?auto_16631 ) ( not ( = ?auto_16632 ?auto_16629 ) ) ( SURFACE-AT ?auto_16624 ?auto_16631 ) ( ON ?auto_16624 ?auto_16628 ) ( CLEAR ?auto_16624 ) ( not ( = ?auto_16623 ?auto_16628 ) ) ( not ( = ?auto_16624 ?auto_16628 ) ) ( not ( = ?auto_16622 ?auto_16628 ) ) ( IS-CRATE ?auto_16623 ) ( AVAILABLE ?auto_16629 ) ( SURFACE-AT ?auto_16623 ?auto_16631 ) ( ON ?auto_16623 ?auto_16627 ) ( CLEAR ?auto_16623 ) ( not ( = ?auto_16623 ?auto_16627 ) ) ( not ( = ?auto_16624 ?auto_16627 ) ) ( not ( = ?auto_16622 ?auto_16627 ) ) ( not ( = ?auto_16628 ?auto_16627 ) ) ( TRUCK-AT ?auto_16626 ?auto_16625 ) ( SURFACE-AT ?auto_16630 ?auto_16625 ) ( CLEAR ?auto_16630 ) ( LIFTING ?auto_16632 ?auto_16622 ) ( IS-CRATE ?auto_16622 ) ( not ( = ?auto_16630 ?auto_16622 ) ) ( not ( = ?auto_16623 ?auto_16630 ) ) ( not ( = ?auto_16624 ?auto_16630 ) ) ( not ( = ?auto_16628 ?auto_16630 ) ) ( not ( = ?auto_16627 ?auto_16630 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16623 ?auto_16624 )
      ( MAKE-2CRATE-VERIFY ?auto_16622 ?auto_16623 ?auto_16624 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16634 - SURFACE
      ?auto_16635 - SURFACE
      ?auto_16636 - SURFACE
      ?auto_16633 - SURFACE
    )
    :vars
    (
      ?auto_16641 - HOIST
      ?auto_16638 - PLACE
      ?auto_16643 - PLACE
      ?auto_16642 - HOIST
      ?auto_16640 - SURFACE
      ?auto_16639 - SURFACE
      ?auto_16637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16641 ?auto_16638 ) ( IS-CRATE ?auto_16633 ) ( not ( = ?auto_16636 ?auto_16633 ) ) ( not ( = ?auto_16635 ?auto_16636 ) ) ( not ( = ?auto_16635 ?auto_16633 ) ) ( not ( = ?auto_16643 ?auto_16638 ) ) ( HOIST-AT ?auto_16642 ?auto_16643 ) ( not ( = ?auto_16641 ?auto_16642 ) ) ( SURFACE-AT ?auto_16633 ?auto_16643 ) ( ON ?auto_16633 ?auto_16640 ) ( CLEAR ?auto_16633 ) ( not ( = ?auto_16636 ?auto_16640 ) ) ( not ( = ?auto_16633 ?auto_16640 ) ) ( not ( = ?auto_16635 ?auto_16640 ) ) ( IS-CRATE ?auto_16636 ) ( AVAILABLE ?auto_16642 ) ( SURFACE-AT ?auto_16636 ?auto_16643 ) ( ON ?auto_16636 ?auto_16639 ) ( CLEAR ?auto_16636 ) ( not ( = ?auto_16636 ?auto_16639 ) ) ( not ( = ?auto_16633 ?auto_16639 ) ) ( not ( = ?auto_16635 ?auto_16639 ) ) ( not ( = ?auto_16640 ?auto_16639 ) ) ( TRUCK-AT ?auto_16637 ?auto_16638 ) ( SURFACE-AT ?auto_16634 ?auto_16638 ) ( CLEAR ?auto_16634 ) ( LIFTING ?auto_16641 ?auto_16635 ) ( IS-CRATE ?auto_16635 ) ( not ( = ?auto_16634 ?auto_16635 ) ) ( not ( = ?auto_16636 ?auto_16634 ) ) ( not ( = ?auto_16633 ?auto_16634 ) ) ( not ( = ?auto_16640 ?auto_16634 ) ) ( not ( = ?auto_16639 ?auto_16634 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16635 ?auto_16636 ?auto_16633 )
      ( MAKE-3CRATE-VERIFY ?auto_16634 ?auto_16635 ?auto_16636 ?auto_16633 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16645 - SURFACE
      ?auto_16646 - SURFACE
      ?auto_16647 - SURFACE
      ?auto_16644 - SURFACE
      ?auto_16648 - SURFACE
    )
    :vars
    (
      ?auto_16653 - HOIST
      ?auto_16650 - PLACE
      ?auto_16655 - PLACE
      ?auto_16654 - HOIST
      ?auto_16652 - SURFACE
      ?auto_16651 - SURFACE
      ?auto_16649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16653 ?auto_16650 ) ( IS-CRATE ?auto_16648 ) ( not ( = ?auto_16644 ?auto_16648 ) ) ( not ( = ?auto_16647 ?auto_16644 ) ) ( not ( = ?auto_16647 ?auto_16648 ) ) ( not ( = ?auto_16655 ?auto_16650 ) ) ( HOIST-AT ?auto_16654 ?auto_16655 ) ( not ( = ?auto_16653 ?auto_16654 ) ) ( SURFACE-AT ?auto_16648 ?auto_16655 ) ( ON ?auto_16648 ?auto_16652 ) ( CLEAR ?auto_16648 ) ( not ( = ?auto_16644 ?auto_16652 ) ) ( not ( = ?auto_16648 ?auto_16652 ) ) ( not ( = ?auto_16647 ?auto_16652 ) ) ( IS-CRATE ?auto_16644 ) ( AVAILABLE ?auto_16654 ) ( SURFACE-AT ?auto_16644 ?auto_16655 ) ( ON ?auto_16644 ?auto_16651 ) ( CLEAR ?auto_16644 ) ( not ( = ?auto_16644 ?auto_16651 ) ) ( not ( = ?auto_16648 ?auto_16651 ) ) ( not ( = ?auto_16647 ?auto_16651 ) ) ( not ( = ?auto_16652 ?auto_16651 ) ) ( TRUCK-AT ?auto_16649 ?auto_16650 ) ( SURFACE-AT ?auto_16646 ?auto_16650 ) ( CLEAR ?auto_16646 ) ( LIFTING ?auto_16653 ?auto_16647 ) ( IS-CRATE ?auto_16647 ) ( not ( = ?auto_16646 ?auto_16647 ) ) ( not ( = ?auto_16644 ?auto_16646 ) ) ( not ( = ?auto_16648 ?auto_16646 ) ) ( not ( = ?auto_16652 ?auto_16646 ) ) ( not ( = ?auto_16651 ?auto_16646 ) ) ( ON ?auto_16646 ?auto_16645 ) ( not ( = ?auto_16645 ?auto_16646 ) ) ( not ( = ?auto_16645 ?auto_16647 ) ) ( not ( = ?auto_16645 ?auto_16644 ) ) ( not ( = ?auto_16645 ?auto_16648 ) ) ( not ( = ?auto_16645 ?auto_16652 ) ) ( not ( = ?auto_16645 ?auto_16651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16647 ?auto_16644 ?auto_16648 )
      ( MAKE-4CRATE-VERIFY ?auto_16645 ?auto_16646 ?auto_16647 ?auto_16644 ?auto_16648 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17092 - SURFACE
      ?auto_17093 - SURFACE
      ?auto_17094 - SURFACE
      ?auto_17091 - SURFACE
      ?auto_17095 - SURFACE
      ?auto_17096 - SURFACE
    )
    :vars
    (
      ?auto_17098 - HOIST
      ?auto_17097 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17098 ?auto_17097 ) ( SURFACE-AT ?auto_17095 ?auto_17097 ) ( CLEAR ?auto_17095 ) ( LIFTING ?auto_17098 ?auto_17096 ) ( IS-CRATE ?auto_17096 ) ( not ( = ?auto_17095 ?auto_17096 ) ) ( ON ?auto_17093 ?auto_17092 ) ( ON ?auto_17094 ?auto_17093 ) ( ON ?auto_17091 ?auto_17094 ) ( ON ?auto_17095 ?auto_17091 ) ( not ( = ?auto_17092 ?auto_17093 ) ) ( not ( = ?auto_17092 ?auto_17094 ) ) ( not ( = ?auto_17092 ?auto_17091 ) ) ( not ( = ?auto_17092 ?auto_17095 ) ) ( not ( = ?auto_17092 ?auto_17096 ) ) ( not ( = ?auto_17093 ?auto_17094 ) ) ( not ( = ?auto_17093 ?auto_17091 ) ) ( not ( = ?auto_17093 ?auto_17095 ) ) ( not ( = ?auto_17093 ?auto_17096 ) ) ( not ( = ?auto_17094 ?auto_17091 ) ) ( not ( = ?auto_17094 ?auto_17095 ) ) ( not ( = ?auto_17094 ?auto_17096 ) ) ( not ( = ?auto_17091 ?auto_17095 ) ) ( not ( = ?auto_17091 ?auto_17096 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17095 ?auto_17096 )
      ( MAKE-5CRATE-VERIFY ?auto_17092 ?auto_17093 ?auto_17094 ?auto_17091 ?auto_17095 ?auto_17096 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17126 - SURFACE
      ?auto_17127 - SURFACE
      ?auto_17128 - SURFACE
      ?auto_17125 - SURFACE
      ?auto_17129 - SURFACE
      ?auto_17130 - SURFACE
    )
    :vars
    (
      ?auto_17132 - HOIST
      ?auto_17133 - PLACE
      ?auto_17131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17132 ?auto_17133 ) ( SURFACE-AT ?auto_17129 ?auto_17133 ) ( CLEAR ?auto_17129 ) ( IS-CRATE ?auto_17130 ) ( not ( = ?auto_17129 ?auto_17130 ) ) ( TRUCK-AT ?auto_17131 ?auto_17133 ) ( AVAILABLE ?auto_17132 ) ( IN ?auto_17130 ?auto_17131 ) ( ON ?auto_17129 ?auto_17125 ) ( not ( = ?auto_17125 ?auto_17129 ) ) ( not ( = ?auto_17125 ?auto_17130 ) ) ( ON ?auto_17127 ?auto_17126 ) ( ON ?auto_17128 ?auto_17127 ) ( ON ?auto_17125 ?auto_17128 ) ( not ( = ?auto_17126 ?auto_17127 ) ) ( not ( = ?auto_17126 ?auto_17128 ) ) ( not ( = ?auto_17126 ?auto_17125 ) ) ( not ( = ?auto_17126 ?auto_17129 ) ) ( not ( = ?auto_17126 ?auto_17130 ) ) ( not ( = ?auto_17127 ?auto_17128 ) ) ( not ( = ?auto_17127 ?auto_17125 ) ) ( not ( = ?auto_17127 ?auto_17129 ) ) ( not ( = ?auto_17127 ?auto_17130 ) ) ( not ( = ?auto_17128 ?auto_17125 ) ) ( not ( = ?auto_17128 ?auto_17129 ) ) ( not ( = ?auto_17128 ?auto_17130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17125 ?auto_17129 ?auto_17130 )
      ( MAKE-5CRATE-VERIFY ?auto_17126 ?auto_17127 ?auto_17128 ?auto_17125 ?auto_17129 ?auto_17130 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17166 - SURFACE
      ?auto_17167 - SURFACE
      ?auto_17168 - SURFACE
      ?auto_17165 - SURFACE
      ?auto_17169 - SURFACE
      ?auto_17170 - SURFACE
    )
    :vars
    (
      ?auto_17173 - HOIST
      ?auto_17172 - PLACE
      ?auto_17171 - TRUCK
      ?auto_17174 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17173 ?auto_17172 ) ( SURFACE-AT ?auto_17169 ?auto_17172 ) ( CLEAR ?auto_17169 ) ( IS-CRATE ?auto_17170 ) ( not ( = ?auto_17169 ?auto_17170 ) ) ( AVAILABLE ?auto_17173 ) ( IN ?auto_17170 ?auto_17171 ) ( ON ?auto_17169 ?auto_17165 ) ( not ( = ?auto_17165 ?auto_17169 ) ) ( not ( = ?auto_17165 ?auto_17170 ) ) ( TRUCK-AT ?auto_17171 ?auto_17174 ) ( not ( = ?auto_17174 ?auto_17172 ) ) ( ON ?auto_17167 ?auto_17166 ) ( ON ?auto_17168 ?auto_17167 ) ( ON ?auto_17165 ?auto_17168 ) ( not ( = ?auto_17166 ?auto_17167 ) ) ( not ( = ?auto_17166 ?auto_17168 ) ) ( not ( = ?auto_17166 ?auto_17165 ) ) ( not ( = ?auto_17166 ?auto_17169 ) ) ( not ( = ?auto_17166 ?auto_17170 ) ) ( not ( = ?auto_17167 ?auto_17168 ) ) ( not ( = ?auto_17167 ?auto_17165 ) ) ( not ( = ?auto_17167 ?auto_17169 ) ) ( not ( = ?auto_17167 ?auto_17170 ) ) ( not ( = ?auto_17168 ?auto_17165 ) ) ( not ( = ?auto_17168 ?auto_17169 ) ) ( not ( = ?auto_17168 ?auto_17170 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17165 ?auto_17169 ?auto_17170 )
      ( MAKE-5CRATE-VERIFY ?auto_17166 ?auto_17167 ?auto_17168 ?auto_17165 ?auto_17169 ?auto_17170 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17211 - SURFACE
      ?auto_17212 - SURFACE
      ?auto_17213 - SURFACE
      ?auto_17210 - SURFACE
      ?auto_17214 - SURFACE
      ?auto_17215 - SURFACE
    )
    :vars
    (
      ?auto_17218 - HOIST
      ?auto_17219 - PLACE
      ?auto_17217 - TRUCK
      ?auto_17220 - PLACE
      ?auto_17216 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17218 ?auto_17219 ) ( SURFACE-AT ?auto_17214 ?auto_17219 ) ( CLEAR ?auto_17214 ) ( IS-CRATE ?auto_17215 ) ( not ( = ?auto_17214 ?auto_17215 ) ) ( AVAILABLE ?auto_17218 ) ( ON ?auto_17214 ?auto_17210 ) ( not ( = ?auto_17210 ?auto_17214 ) ) ( not ( = ?auto_17210 ?auto_17215 ) ) ( TRUCK-AT ?auto_17217 ?auto_17220 ) ( not ( = ?auto_17220 ?auto_17219 ) ) ( HOIST-AT ?auto_17216 ?auto_17220 ) ( LIFTING ?auto_17216 ?auto_17215 ) ( not ( = ?auto_17218 ?auto_17216 ) ) ( ON ?auto_17212 ?auto_17211 ) ( ON ?auto_17213 ?auto_17212 ) ( ON ?auto_17210 ?auto_17213 ) ( not ( = ?auto_17211 ?auto_17212 ) ) ( not ( = ?auto_17211 ?auto_17213 ) ) ( not ( = ?auto_17211 ?auto_17210 ) ) ( not ( = ?auto_17211 ?auto_17214 ) ) ( not ( = ?auto_17211 ?auto_17215 ) ) ( not ( = ?auto_17212 ?auto_17213 ) ) ( not ( = ?auto_17212 ?auto_17210 ) ) ( not ( = ?auto_17212 ?auto_17214 ) ) ( not ( = ?auto_17212 ?auto_17215 ) ) ( not ( = ?auto_17213 ?auto_17210 ) ) ( not ( = ?auto_17213 ?auto_17214 ) ) ( not ( = ?auto_17213 ?auto_17215 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17210 ?auto_17214 ?auto_17215 )
      ( MAKE-5CRATE-VERIFY ?auto_17211 ?auto_17212 ?auto_17213 ?auto_17210 ?auto_17214 ?auto_17215 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17261 - SURFACE
      ?auto_17262 - SURFACE
      ?auto_17263 - SURFACE
      ?auto_17260 - SURFACE
      ?auto_17264 - SURFACE
      ?auto_17265 - SURFACE
    )
    :vars
    (
      ?auto_17268 - HOIST
      ?auto_17266 - PLACE
      ?auto_17271 - TRUCK
      ?auto_17269 - PLACE
      ?auto_17267 - HOIST
      ?auto_17270 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17268 ?auto_17266 ) ( SURFACE-AT ?auto_17264 ?auto_17266 ) ( CLEAR ?auto_17264 ) ( IS-CRATE ?auto_17265 ) ( not ( = ?auto_17264 ?auto_17265 ) ) ( AVAILABLE ?auto_17268 ) ( ON ?auto_17264 ?auto_17260 ) ( not ( = ?auto_17260 ?auto_17264 ) ) ( not ( = ?auto_17260 ?auto_17265 ) ) ( TRUCK-AT ?auto_17271 ?auto_17269 ) ( not ( = ?auto_17269 ?auto_17266 ) ) ( HOIST-AT ?auto_17267 ?auto_17269 ) ( not ( = ?auto_17268 ?auto_17267 ) ) ( AVAILABLE ?auto_17267 ) ( SURFACE-AT ?auto_17265 ?auto_17269 ) ( ON ?auto_17265 ?auto_17270 ) ( CLEAR ?auto_17265 ) ( not ( = ?auto_17264 ?auto_17270 ) ) ( not ( = ?auto_17265 ?auto_17270 ) ) ( not ( = ?auto_17260 ?auto_17270 ) ) ( ON ?auto_17262 ?auto_17261 ) ( ON ?auto_17263 ?auto_17262 ) ( ON ?auto_17260 ?auto_17263 ) ( not ( = ?auto_17261 ?auto_17262 ) ) ( not ( = ?auto_17261 ?auto_17263 ) ) ( not ( = ?auto_17261 ?auto_17260 ) ) ( not ( = ?auto_17261 ?auto_17264 ) ) ( not ( = ?auto_17261 ?auto_17265 ) ) ( not ( = ?auto_17261 ?auto_17270 ) ) ( not ( = ?auto_17262 ?auto_17263 ) ) ( not ( = ?auto_17262 ?auto_17260 ) ) ( not ( = ?auto_17262 ?auto_17264 ) ) ( not ( = ?auto_17262 ?auto_17265 ) ) ( not ( = ?auto_17262 ?auto_17270 ) ) ( not ( = ?auto_17263 ?auto_17260 ) ) ( not ( = ?auto_17263 ?auto_17264 ) ) ( not ( = ?auto_17263 ?auto_17265 ) ) ( not ( = ?auto_17263 ?auto_17270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17260 ?auto_17264 ?auto_17265 )
      ( MAKE-5CRATE-VERIFY ?auto_17261 ?auto_17262 ?auto_17263 ?auto_17260 ?auto_17264 ?auto_17265 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17312 - SURFACE
      ?auto_17313 - SURFACE
      ?auto_17314 - SURFACE
      ?auto_17311 - SURFACE
      ?auto_17315 - SURFACE
      ?auto_17316 - SURFACE
    )
    :vars
    (
      ?auto_17319 - HOIST
      ?auto_17320 - PLACE
      ?auto_17321 - PLACE
      ?auto_17318 - HOIST
      ?auto_17322 - SURFACE
      ?auto_17317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17319 ?auto_17320 ) ( SURFACE-AT ?auto_17315 ?auto_17320 ) ( CLEAR ?auto_17315 ) ( IS-CRATE ?auto_17316 ) ( not ( = ?auto_17315 ?auto_17316 ) ) ( AVAILABLE ?auto_17319 ) ( ON ?auto_17315 ?auto_17311 ) ( not ( = ?auto_17311 ?auto_17315 ) ) ( not ( = ?auto_17311 ?auto_17316 ) ) ( not ( = ?auto_17321 ?auto_17320 ) ) ( HOIST-AT ?auto_17318 ?auto_17321 ) ( not ( = ?auto_17319 ?auto_17318 ) ) ( AVAILABLE ?auto_17318 ) ( SURFACE-AT ?auto_17316 ?auto_17321 ) ( ON ?auto_17316 ?auto_17322 ) ( CLEAR ?auto_17316 ) ( not ( = ?auto_17315 ?auto_17322 ) ) ( not ( = ?auto_17316 ?auto_17322 ) ) ( not ( = ?auto_17311 ?auto_17322 ) ) ( TRUCK-AT ?auto_17317 ?auto_17320 ) ( ON ?auto_17313 ?auto_17312 ) ( ON ?auto_17314 ?auto_17313 ) ( ON ?auto_17311 ?auto_17314 ) ( not ( = ?auto_17312 ?auto_17313 ) ) ( not ( = ?auto_17312 ?auto_17314 ) ) ( not ( = ?auto_17312 ?auto_17311 ) ) ( not ( = ?auto_17312 ?auto_17315 ) ) ( not ( = ?auto_17312 ?auto_17316 ) ) ( not ( = ?auto_17312 ?auto_17322 ) ) ( not ( = ?auto_17313 ?auto_17314 ) ) ( not ( = ?auto_17313 ?auto_17311 ) ) ( not ( = ?auto_17313 ?auto_17315 ) ) ( not ( = ?auto_17313 ?auto_17316 ) ) ( not ( = ?auto_17313 ?auto_17322 ) ) ( not ( = ?auto_17314 ?auto_17311 ) ) ( not ( = ?auto_17314 ?auto_17315 ) ) ( not ( = ?auto_17314 ?auto_17316 ) ) ( not ( = ?auto_17314 ?auto_17322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17311 ?auto_17315 ?auto_17316 )
      ( MAKE-5CRATE-VERIFY ?auto_17312 ?auto_17313 ?auto_17314 ?auto_17311 ?auto_17315 ?auto_17316 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17363 - SURFACE
      ?auto_17364 - SURFACE
      ?auto_17365 - SURFACE
      ?auto_17362 - SURFACE
      ?auto_17366 - SURFACE
      ?auto_17367 - SURFACE
    )
    :vars
    (
      ?auto_17372 - HOIST
      ?auto_17371 - PLACE
      ?auto_17369 - PLACE
      ?auto_17370 - HOIST
      ?auto_17368 - SURFACE
      ?auto_17373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17372 ?auto_17371 ) ( IS-CRATE ?auto_17367 ) ( not ( = ?auto_17366 ?auto_17367 ) ) ( not ( = ?auto_17362 ?auto_17366 ) ) ( not ( = ?auto_17362 ?auto_17367 ) ) ( not ( = ?auto_17369 ?auto_17371 ) ) ( HOIST-AT ?auto_17370 ?auto_17369 ) ( not ( = ?auto_17372 ?auto_17370 ) ) ( AVAILABLE ?auto_17370 ) ( SURFACE-AT ?auto_17367 ?auto_17369 ) ( ON ?auto_17367 ?auto_17368 ) ( CLEAR ?auto_17367 ) ( not ( = ?auto_17366 ?auto_17368 ) ) ( not ( = ?auto_17367 ?auto_17368 ) ) ( not ( = ?auto_17362 ?auto_17368 ) ) ( TRUCK-AT ?auto_17373 ?auto_17371 ) ( SURFACE-AT ?auto_17362 ?auto_17371 ) ( CLEAR ?auto_17362 ) ( LIFTING ?auto_17372 ?auto_17366 ) ( IS-CRATE ?auto_17366 ) ( ON ?auto_17364 ?auto_17363 ) ( ON ?auto_17365 ?auto_17364 ) ( ON ?auto_17362 ?auto_17365 ) ( not ( = ?auto_17363 ?auto_17364 ) ) ( not ( = ?auto_17363 ?auto_17365 ) ) ( not ( = ?auto_17363 ?auto_17362 ) ) ( not ( = ?auto_17363 ?auto_17366 ) ) ( not ( = ?auto_17363 ?auto_17367 ) ) ( not ( = ?auto_17363 ?auto_17368 ) ) ( not ( = ?auto_17364 ?auto_17365 ) ) ( not ( = ?auto_17364 ?auto_17362 ) ) ( not ( = ?auto_17364 ?auto_17366 ) ) ( not ( = ?auto_17364 ?auto_17367 ) ) ( not ( = ?auto_17364 ?auto_17368 ) ) ( not ( = ?auto_17365 ?auto_17362 ) ) ( not ( = ?auto_17365 ?auto_17366 ) ) ( not ( = ?auto_17365 ?auto_17367 ) ) ( not ( = ?auto_17365 ?auto_17368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17362 ?auto_17366 ?auto_17367 )
      ( MAKE-5CRATE-VERIFY ?auto_17363 ?auto_17364 ?auto_17365 ?auto_17362 ?auto_17366 ?auto_17367 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17414 - SURFACE
      ?auto_17415 - SURFACE
      ?auto_17416 - SURFACE
      ?auto_17413 - SURFACE
      ?auto_17417 - SURFACE
      ?auto_17418 - SURFACE
    )
    :vars
    (
      ?auto_17423 - HOIST
      ?auto_17422 - PLACE
      ?auto_17424 - PLACE
      ?auto_17419 - HOIST
      ?auto_17421 - SURFACE
      ?auto_17420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17423 ?auto_17422 ) ( IS-CRATE ?auto_17418 ) ( not ( = ?auto_17417 ?auto_17418 ) ) ( not ( = ?auto_17413 ?auto_17417 ) ) ( not ( = ?auto_17413 ?auto_17418 ) ) ( not ( = ?auto_17424 ?auto_17422 ) ) ( HOIST-AT ?auto_17419 ?auto_17424 ) ( not ( = ?auto_17423 ?auto_17419 ) ) ( AVAILABLE ?auto_17419 ) ( SURFACE-AT ?auto_17418 ?auto_17424 ) ( ON ?auto_17418 ?auto_17421 ) ( CLEAR ?auto_17418 ) ( not ( = ?auto_17417 ?auto_17421 ) ) ( not ( = ?auto_17418 ?auto_17421 ) ) ( not ( = ?auto_17413 ?auto_17421 ) ) ( TRUCK-AT ?auto_17420 ?auto_17422 ) ( SURFACE-AT ?auto_17413 ?auto_17422 ) ( CLEAR ?auto_17413 ) ( IS-CRATE ?auto_17417 ) ( AVAILABLE ?auto_17423 ) ( IN ?auto_17417 ?auto_17420 ) ( ON ?auto_17415 ?auto_17414 ) ( ON ?auto_17416 ?auto_17415 ) ( ON ?auto_17413 ?auto_17416 ) ( not ( = ?auto_17414 ?auto_17415 ) ) ( not ( = ?auto_17414 ?auto_17416 ) ) ( not ( = ?auto_17414 ?auto_17413 ) ) ( not ( = ?auto_17414 ?auto_17417 ) ) ( not ( = ?auto_17414 ?auto_17418 ) ) ( not ( = ?auto_17414 ?auto_17421 ) ) ( not ( = ?auto_17415 ?auto_17416 ) ) ( not ( = ?auto_17415 ?auto_17413 ) ) ( not ( = ?auto_17415 ?auto_17417 ) ) ( not ( = ?auto_17415 ?auto_17418 ) ) ( not ( = ?auto_17415 ?auto_17421 ) ) ( not ( = ?auto_17416 ?auto_17413 ) ) ( not ( = ?auto_17416 ?auto_17417 ) ) ( not ( = ?auto_17416 ?auto_17418 ) ) ( not ( = ?auto_17416 ?auto_17421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17413 ?auto_17417 ?auto_17418 )
      ( MAKE-5CRATE-VERIFY ?auto_17414 ?auto_17415 ?auto_17416 ?auto_17413 ?auto_17417 ?auto_17418 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17781 - SURFACE
      ?auto_17782 - SURFACE
    )
    :vars
    (
      ?auto_17788 - HOIST
      ?auto_17784 - PLACE
      ?auto_17789 - SURFACE
      ?auto_17785 - PLACE
      ?auto_17786 - HOIST
      ?auto_17787 - SURFACE
      ?auto_17783 - TRUCK
      ?auto_17790 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17788 ?auto_17784 ) ( SURFACE-AT ?auto_17781 ?auto_17784 ) ( CLEAR ?auto_17781 ) ( IS-CRATE ?auto_17782 ) ( not ( = ?auto_17781 ?auto_17782 ) ) ( ON ?auto_17781 ?auto_17789 ) ( not ( = ?auto_17789 ?auto_17781 ) ) ( not ( = ?auto_17789 ?auto_17782 ) ) ( not ( = ?auto_17785 ?auto_17784 ) ) ( HOIST-AT ?auto_17786 ?auto_17785 ) ( not ( = ?auto_17788 ?auto_17786 ) ) ( AVAILABLE ?auto_17786 ) ( SURFACE-AT ?auto_17782 ?auto_17785 ) ( ON ?auto_17782 ?auto_17787 ) ( CLEAR ?auto_17782 ) ( not ( = ?auto_17781 ?auto_17787 ) ) ( not ( = ?auto_17782 ?auto_17787 ) ) ( not ( = ?auto_17789 ?auto_17787 ) ) ( TRUCK-AT ?auto_17783 ?auto_17784 ) ( LIFTING ?auto_17788 ?auto_17790 ) ( IS-CRATE ?auto_17790 ) ( not ( = ?auto_17781 ?auto_17790 ) ) ( not ( = ?auto_17782 ?auto_17790 ) ) ( not ( = ?auto_17789 ?auto_17790 ) ) ( not ( = ?auto_17787 ?auto_17790 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17788 ?auto_17790 ?auto_17783 ?auto_17784 )
      ( MAKE-1CRATE ?auto_17781 ?auto_17782 )
      ( MAKE-1CRATE-VERIFY ?auto_17781 ?auto_17782 ) )
  )

)

