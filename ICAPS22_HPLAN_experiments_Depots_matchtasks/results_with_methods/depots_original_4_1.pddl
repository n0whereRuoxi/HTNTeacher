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
      ?auto_7484 - SURFACE
      ?auto_7485 - SURFACE
    )
    :vars
    (
      ?auto_7486 - HOIST
      ?auto_7487 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7486 ?auto_7487 ) ( SURFACE-AT ?auto_7484 ?auto_7487 ) ( CLEAR ?auto_7484 ) ( LIFTING ?auto_7486 ?auto_7485 ) ( IS-CRATE ?auto_7485 ) ( not ( = ?auto_7484 ?auto_7485 ) ) )
    :subtasks
    ( ( !DROP ?auto_7486 ?auto_7485 ?auto_7484 ?auto_7487 )
      ( MAKE-1CRATE-VERIFY ?auto_7484 ?auto_7485 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7488 - SURFACE
      ?auto_7489 - SURFACE
    )
    :vars
    (
      ?auto_7490 - HOIST
      ?auto_7491 - PLACE
      ?auto_7492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7490 ?auto_7491 ) ( SURFACE-AT ?auto_7488 ?auto_7491 ) ( CLEAR ?auto_7488 ) ( IS-CRATE ?auto_7489 ) ( not ( = ?auto_7488 ?auto_7489 ) ) ( TRUCK-AT ?auto_7492 ?auto_7491 ) ( AVAILABLE ?auto_7490 ) ( IN ?auto_7489 ?auto_7492 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7490 ?auto_7489 ?auto_7492 ?auto_7491 )
      ( MAKE-1CRATE ?auto_7488 ?auto_7489 )
      ( MAKE-1CRATE-VERIFY ?auto_7488 ?auto_7489 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7493 - SURFACE
      ?auto_7494 - SURFACE
    )
    :vars
    (
      ?auto_7496 - HOIST
      ?auto_7497 - PLACE
      ?auto_7495 - TRUCK
      ?auto_7498 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7496 ?auto_7497 ) ( SURFACE-AT ?auto_7493 ?auto_7497 ) ( CLEAR ?auto_7493 ) ( IS-CRATE ?auto_7494 ) ( not ( = ?auto_7493 ?auto_7494 ) ) ( AVAILABLE ?auto_7496 ) ( IN ?auto_7494 ?auto_7495 ) ( TRUCK-AT ?auto_7495 ?auto_7498 ) ( not ( = ?auto_7498 ?auto_7497 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7495 ?auto_7498 ?auto_7497 )
      ( MAKE-1CRATE ?auto_7493 ?auto_7494 )
      ( MAKE-1CRATE-VERIFY ?auto_7493 ?auto_7494 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7499 - SURFACE
      ?auto_7500 - SURFACE
    )
    :vars
    (
      ?auto_7504 - HOIST
      ?auto_7502 - PLACE
      ?auto_7503 - TRUCK
      ?auto_7501 - PLACE
      ?auto_7505 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7504 ?auto_7502 ) ( SURFACE-AT ?auto_7499 ?auto_7502 ) ( CLEAR ?auto_7499 ) ( IS-CRATE ?auto_7500 ) ( not ( = ?auto_7499 ?auto_7500 ) ) ( AVAILABLE ?auto_7504 ) ( TRUCK-AT ?auto_7503 ?auto_7501 ) ( not ( = ?auto_7501 ?auto_7502 ) ) ( HOIST-AT ?auto_7505 ?auto_7501 ) ( LIFTING ?auto_7505 ?auto_7500 ) ( not ( = ?auto_7504 ?auto_7505 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7505 ?auto_7500 ?auto_7503 ?auto_7501 )
      ( MAKE-1CRATE ?auto_7499 ?auto_7500 )
      ( MAKE-1CRATE-VERIFY ?auto_7499 ?auto_7500 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7506 - SURFACE
      ?auto_7507 - SURFACE
    )
    :vars
    (
      ?auto_7510 - HOIST
      ?auto_7512 - PLACE
      ?auto_7511 - TRUCK
      ?auto_7509 - PLACE
      ?auto_7508 - HOIST
      ?auto_7513 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7510 ?auto_7512 ) ( SURFACE-AT ?auto_7506 ?auto_7512 ) ( CLEAR ?auto_7506 ) ( IS-CRATE ?auto_7507 ) ( not ( = ?auto_7506 ?auto_7507 ) ) ( AVAILABLE ?auto_7510 ) ( TRUCK-AT ?auto_7511 ?auto_7509 ) ( not ( = ?auto_7509 ?auto_7512 ) ) ( HOIST-AT ?auto_7508 ?auto_7509 ) ( not ( = ?auto_7510 ?auto_7508 ) ) ( AVAILABLE ?auto_7508 ) ( SURFACE-AT ?auto_7507 ?auto_7509 ) ( ON ?auto_7507 ?auto_7513 ) ( CLEAR ?auto_7507 ) ( not ( = ?auto_7506 ?auto_7513 ) ) ( not ( = ?auto_7507 ?auto_7513 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7508 ?auto_7507 ?auto_7513 ?auto_7509 )
      ( MAKE-1CRATE ?auto_7506 ?auto_7507 )
      ( MAKE-1CRATE-VERIFY ?auto_7506 ?auto_7507 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7514 - SURFACE
      ?auto_7515 - SURFACE
    )
    :vars
    (
      ?auto_7519 - HOIST
      ?auto_7517 - PLACE
      ?auto_7520 - PLACE
      ?auto_7516 - HOIST
      ?auto_7518 - SURFACE
      ?auto_7521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7519 ?auto_7517 ) ( SURFACE-AT ?auto_7514 ?auto_7517 ) ( CLEAR ?auto_7514 ) ( IS-CRATE ?auto_7515 ) ( not ( = ?auto_7514 ?auto_7515 ) ) ( AVAILABLE ?auto_7519 ) ( not ( = ?auto_7520 ?auto_7517 ) ) ( HOIST-AT ?auto_7516 ?auto_7520 ) ( not ( = ?auto_7519 ?auto_7516 ) ) ( AVAILABLE ?auto_7516 ) ( SURFACE-AT ?auto_7515 ?auto_7520 ) ( ON ?auto_7515 ?auto_7518 ) ( CLEAR ?auto_7515 ) ( not ( = ?auto_7514 ?auto_7518 ) ) ( not ( = ?auto_7515 ?auto_7518 ) ) ( TRUCK-AT ?auto_7521 ?auto_7517 ) )
    :subtasks
    ( ( !DRIVE ?auto_7521 ?auto_7517 ?auto_7520 )
      ( MAKE-1CRATE ?auto_7514 ?auto_7515 )
      ( MAKE-1CRATE-VERIFY ?auto_7514 ?auto_7515 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7527 - SURFACE
      ?auto_7528 - SURFACE
    )
    :vars
    (
      ?auto_7529 - HOIST
      ?auto_7530 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7529 ?auto_7530 ) ( SURFACE-AT ?auto_7527 ?auto_7530 ) ( CLEAR ?auto_7527 ) ( LIFTING ?auto_7529 ?auto_7528 ) ( IS-CRATE ?auto_7528 ) ( not ( = ?auto_7527 ?auto_7528 ) ) )
    :subtasks
    ( ( !DROP ?auto_7529 ?auto_7528 ?auto_7527 ?auto_7530 )
      ( MAKE-1CRATE-VERIFY ?auto_7527 ?auto_7528 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7531 - SURFACE
      ?auto_7532 - SURFACE
      ?auto_7533 - SURFACE
    )
    :vars
    (
      ?auto_7535 - HOIST
      ?auto_7534 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7535 ?auto_7534 ) ( SURFACE-AT ?auto_7532 ?auto_7534 ) ( CLEAR ?auto_7532 ) ( LIFTING ?auto_7535 ?auto_7533 ) ( IS-CRATE ?auto_7533 ) ( not ( = ?auto_7532 ?auto_7533 ) ) ( ON ?auto_7532 ?auto_7531 ) ( not ( = ?auto_7531 ?auto_7532 ) ) ( not ( = ?auto_7531 ?auto_7533 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7532 ?auto_7533 )
      ( MAKE-2CRATE-VERIFY ?auto_7531 ?auto_7532 ?auto_7533 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7536 - SURFACE
      ?auto_7537 - SURFACE
    )
    :vars
    (
      ?auto_7539 - HOIST
      ?auto_7538 - PLACE
      ?auto_7540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7539 ?auto_7538 ) ( SURFACE-AT ?auto_7536 ?auto_7538 ) ( CLEAR ?auto_7536 ) ( IS-CRATE ?auto_7537 ) ( not ( = ?auto_7536 ?auto_7537 ) ) ( TRUCK-AT ?auto_7540 ?auto_7538 ) ( AVAILABLE ?auto_7539 ) ( IN ?auto_7537 ?auto_7540 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7539 ?auto_7537 ?auto_7540 ?auto_7538 )
      ( MAKE-1CRATE ?auto_7536 ?auto_7537 )
      ( MAKE-1CRATE-VERIFY ?auto_7536 ?auto_7537 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7541 - SURFACE
      ?auto_7542 - SURFACE
      ?auto_7543 - SURFACE
    )
    :vars
    (
      ?auto_7545 - HOIST
      ?auto_7544 - PLACE
      ?auto_7546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7545 ?auto_7544 ) ( SURFACE-AT ?auto_7542 ?auto_7544 ) ( CLEAR ?auto_7542 ) ( IS-CRATE ?auto_7543 ) ( not ( = ?auto_7542 ?auto_7543 ) ) ( TRUCK-AT ?auto_7546 ?auto_7544 ) ( AVAILABLE ?auto_7545 ) ( IN ?auto_7543 ?auto_7546 ) ( ON ?auto_7542 ?auto_7541 ) ( not ( = ?auto_7541 ?auto_7542 ) ) ( not ( = ?auto_7541 ?auto_7543 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7542 ?auto_7543 )
      ( MAKE-2CRATE-VERIFY ?auto_7541 ?auto_7542 ?auto_7543 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7547 - SURFACE
      ?auto_7548 - SURFACE
    )
    :vars
    (
      ?auto_7552 - HOIST
      ?auto_7551 - PLACE
      ?auto_7549 - TRUCK
      ?auto_7550 - SURFACE
      ?auto_7553 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7552 ?auto_7551 ) ( SURFACE-AT ?auto_7547 ?auto_7551 ) ( CLEAR ?auto_7547 ) ( IS-CRATE ?auto_7548 ) ( not ( = ?auto_7547 ?auto_7548 ) ) ( AVAILABLE ?auto_7552 ) ( IN ?auto_7548 ?auto_7549 ) ( ON ?auto_7547 ?auto_7550 ) ( not ( = ?auto_7550 ?auto_7547 ) ) ( not ( = ?auto_7550 ?auto_7548 ) ) ( TRUCK-AT ?auto_7549 ?auto_7553 ) ( not ( = ?auto_7553 ?auto_7551 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7549 ?auto_7553 ?auto_7551 )
      ( MAKE-2CRATE ?auto_7550 ?auto_7547 ?auto_7548 )
      ( MAKE-1CRATE-VERIFY ?auto_7547 ?auto_7548 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7554 - SURFACE
      ?auto_7555 - SURFACE
      ?auto_7556 - SURFACE
    )
    :vars
    (
      ?auto_7559 - HOIST
      ?auto_7558 - PLACE
      ?auto_7557 - TRUCK
      ?auto_7560 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7559 ?auto_7558 ) ( SURFACE-AT ?auto_7555 ?auto_7558 ) ( CLEAR ?auto_7555 ) ( IS-CRATE ?auto_7556 ) ( not ( = ?auto_7555 ?auto_7556 ) ) ( AVAILABLE ?auto_7559 ) ( IN ?auto_7556 ?auto_7557 ) ( ON ?auto_7555 ?auto_7554 ) ( not ( = ?auto_7554 ?auto_7555 ) ) ( not ( = ?auto_7554 ?auto_7556 ) ) ( TRUCK-AT ?auto_7557 ?auto_7560 ) ( not ( = ?auto_7560 ?auto_7558 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7555 ?auto_7556 )
      ( MAKE-2CRATE-VERIFY ?auto_7554 ?auto_7555 ?auto_7556 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7561 - SURFACE
      ?auto_7562 - SURFACE
    )
    :vars
    (
      ?auto_7564 - HOIST
      ?auto_7563 - PLACE
      ?auto_7567 - SURFACE
      ?auto_7565 - TRUCK
      ?auto_7566 - PLACE
      ?auto_7568 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7564 ?auto_7563 ) ( SURFACE-AT ?auto_7561 ?auto_7563 ) ( CLEAR ?auto_7561 ) ( IS-CRATE ?auto_7562 ) ( not ( = ?auto_7561 ?auto_7562 ) ) ( AVAILABLE ?auto_7564 ) ( ON ?auto_7561 ?auto_7567 ) ( not ( = ?auto_7567 ?auto_7561 ) ) ( not ( = ?auto_7567 ?auto_7562 ) ) ( TRUCK-AT ?auto_7565 ?auto_7566 ) ( not ( = ?auto_7566 ?auto_7563 ) ) ( HOIST-AT ?auto_7568 ?auto_7566 ) ( LIFTING ?auto_7568 ?auto_7562 ) ( not ( = ?auto_7564 ?auto_7568 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7568 ?auto_7562 ?auto_7565 ?auto_7566 )
      ( MAKE-2CRATE ?auto_7567 ?auto_7561 ?auto_7562 )
      ( MAKE-1CRATE-VERIFY ?auto_7561 ?auto_7562 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7569 - SURFACE
      ?auto_7570 - SURFACE
      ?auto_7571 - SURFACE
    )
    :vars
    (
      ?auto_7575 - HOIST
      ?auto_7576 - PLACE
      ?auto_7573 - TRUCK
      ?auto_7572 - PLACE
      ?auto_7574 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7575 ?auto_7576 ) ( SURFACE-AT ?auto_7570 ?auto_7576 ) ( CLEAR ?auto_7570 ) ( IS-CRATE ?auto_7571 ) ( not ( = ?auto_7570 ?auto_7571 ) ) ( AVAILABLE ?auto_7575 ) ( ON ?auto_7570 ?auto_7569 ) ( not ( = ?auto_7569 ?auto_7570 ) ) ( not ( = ?auto_7569 ?auto_7571 ) ) ( TRUCK-AT ?auto_7573 ?auto_7572 ) ( not ( = ?auto_7572 ?auto_7576 ) ) ( HOIST-AT ?auto_7574 ?auto_7572 ) ( LIFTING ?auto_7574 ?auto_7571 ) ( not ( = ?auto_7575 ?auto_7574 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7570 ?auto_7571 )
      ( MAKE-2CRATE-VERIFY ?auto_7569 ?auto_7570 ?auto_7571 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7577 - SURFACE
      ?auto_7578 - SURFACE
    )
    :vars
    (
      ?auto_7584 - HOIST
      ?auto_7582 - PLACE
      ?auto_7580 - SURFACE
      ?auto_7579 - TRUCK
      ?auto_7581 - PLACE
      ?auto_7583 - HOIST
      ?auto_7585 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7584 ?auto_7582 ) ( SURFACE-AT ?auto_7577 ?auto_7582 ) ( CLEAR ?auto_7577 ) ( IS-CRATE ?auto_7578 ) ( not ( = ?auto_7577 ?auto_7578 ) ) ( AVAILABLE ?auto_7584 ) ( ON ?auto_7577 ?auto_7580 ) ( not ( = ?auto_7580 ?auto_7577 ) ) ( not ( = ?auto_7580 ?auto_7578 ) ) ( TRUCK-AT ?auto_7579 ?auto_7581 ) ( not ( = ?auto_7581 ?auto_7582 ) ) ( HOIST-AT ?auto_7583 ?auto_7581 ) ( not ( = ?auto_7584 ?auto_7583 ) ) ( AVAILABLE ?auto_7583 ) ( SURFACE-AT ?auto_7578 ?auto_7581 ) ( ON ?auto_7578 ?auto_7585 ) ( CLEAR ?auto_7578 ) ( not ( = ?auto_7577 ?auto_7585 ) ) ( not ( = ?auto_7578 ?auto_7585 ) ) ( not ( = ?auto_7580 ?auto_7585 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7583 ?auto_7578 ?auto_7585 ?auto_7581 )
      ( MAKE-2CRATE ?auto_7580 ?auto_7577 ?auto_7578 )
      ( MAKE-1CRATE-VERIFY ?auto_7577 ?auto_7578 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7586 - SURFACE
      ?auto_7587 - SURFACE
      ?auto_7588 - SURFACE
    )
    :vars
    (
      ?auto_7594 - HOIST
      ?auto_7592 - PLACE
      ?auto_7589 - TRUCK
      ?auto_7591 - PLACE
      ?auto_7590 - HOIST
      ?auto_7593 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7594 ?auto_7592 ) ( SURFACE-AT ?auto_7587 ?auto_7592 ) ( CLEAR ?auto_7587 ) ( IS-CRATE ?auto_7588 ) ( not ( = ?auto_7587 ?auto_7588 ) ) ( AVAILABLE ?auto_7594 ) ( ON ?auto_7587 ?auto_7586 ) ( not ( = ?auto_7586 ?auto_7587 ) ) ( not ( = ?auto_7586 ?auto_7588 ) ) ( TRUCK-AT ?auto_7589 ?auto_7591 ) ( not ( = ?auto_7591 ?auto_7592 ) ) ( HOIST-AT ?auto_7590 ?auto_7591 ) ( not ( = ?auto_7594 ?auto_7590 ) ) ( AVAILABLE ?auto_7590 ) ( SURFACE-AT ?auto_7588 ?auto_7591 ) ( ON ?auto_7588 ?auto_7593 ) ( CLEAR ?auto_7588 ) ( not ( = ?auto_7587 ?auto_7593 ) ) ( not ( = ?auto_7588 ?auto_7593 ) ) ( not ( = ?auto_7586 ?auto_7593 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7587 ?auto_7588 )
      ( MAKE-2CRATE-VERIFY ?auto_7586 ?auto_7587 ?auto_7588 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7595 - SURFACE
      ?auto_7596 - SURFACE
    )
    :vars
    (
      ?auto_7602 - HOIST
      ?auto_7601 - PLACE
      ?auto_7603 - SURFACE
      ?auto_7598 - PLACE
      ?auto_7597 - HOIST
      ?auto_7600 - SURFACE
      ?auto_7599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7602 ?auto_7601 ) ( SURFACE-AT ?auto_7595 ?auto_7601 ) ( CLEAR ?auto_7595 ) ( IS-CRATE ?auto_7596 ) ( not ( = ?auto_7595 ?auto_7596 ) ) ( AVAILABLE ?auto_7602 ) ( ON ?auto_7595 ?auto_7603 ) ( not ( = ?auto_7603 ?auto_7595 ) ) ( not ( = ?auto_7603 ?auto_7596 ) ) ( not ( = ?auto_7598 ?auto_7601 ) ) ( HOIST-AT ?auto_7597 ?auto_7598 ) ( not ( = ?auto_7602 ?auto_7597 ) ) ( AVAILABLE ?auto_7597 ) ( SURFACE-AT ?auto_7596 ?auto_7598 ) ( ON ?auto_7596 ?auto_7600 ) ( CLEAR ?auto_7596 ) ( not ( = ?auto_7595 ?auto_7600 ) ) ( not ( = ?auto_7596 ?auto_7600 ) ) ( not ( = ?auto_7603 ?auto_7600 ) ) ( TRUCK-AT ?auto_7599 ?auto_7601 ) )
    :subtasks
    ( ( !DRIVE ?auto_7599 ?auto_7601 ?auto_7598 )
      ( MAKE-2CRATE ?auto_7603 ?auto_7595 ?auto_7596 )
      ( MAKE-1CRATE-VERIFY ?auto_7595 ?auto_7596 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7604 - SURFACE
      ?auto_7605 - SURFACE
      ?auto_7606 - SURFACE
    )
    :vars
    (
      ?auto_7608 - HOIST
      ?auto_7609 - PLACE
      ?auto_7612 - PLACE
      ?auto_7611 - HOIST
      ?auto_7610 - SURFACE
      ?auto_7607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7608 ?auto_7609 ) ( SURFACE-AT ?auto_7605 ?auto_7609 ) ( CLEAR ?auto_7605 ) ( IS-CRATE ?auto_7606 ) ( not ( = ?auto_7605 ?auto_7606 ) ) ( AVAILABLE ?auto_7608 ) ( ON ?auto_7605 ?auto_7604 ) ( not ( = ?auto_7604 ?auto_7605 ) ) ( not ( = ?auto_7604 ?auto_7606 ) ) ( not ( = ?auto_7612 ?auto_7609 ) ) ( HOIST-AT ?auto_7611 ?auto_7612 ) ( not ( = ?auto_7608 ?auto_7611 ) ) ( AVAILABLE ?auto_7611 ) ( SURFACE-AT ?auto_7606 ?auto_7612 ) ( ON ?auto_7606 ?auto_7610 ) ( CLEAR ?auto_7606 ) ( not ( = ?auto_7605 ?auto_7610 ) ) ( not ( = ?auto_7606 ?auto_7610 ) ) ( not ( = ?auto_7604 ?auto_7610 ) ) ( TRUCK-AT ?auto_7607 ?auto_7609 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7605 ?auto_7606 )
      ( MAKE-2CRATE-VERIFY ?auto_7604 ?auto_7605 ?auto_7606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7613 - SURFACE
      ?auto_7614 - SURFACE
    )
    :vars
    (
      ?auto_7621 - HOIST
      ?auto_7620 - PLACE
      ?auto_7617 - SURFACE
      ?auto_7618 - PLACE
      ?auto_7615 - HOIST
      ?auto_7619 - SURFACE
      ?auto_7616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7621 ?auto_7620 ) ( IS-CRATE ?auto_7614 ) ( not ( = ?auto_7613 ?auto_7614 ) ) ( not ( = ?auto_7617 ?auto_7613 ) ) ( not ( = ?auto_7617 ?auto_7614 ) ) ( not ( = ?auto_7618 ?auto_7620 ) ) ( HOIST-AT ?auto_7615 ?auto_7618 ) ( not ( = ?auto_7621 ?auto_7615 ) ) ( AVAILABLE ?auto_7615 ) ( SURFACE-AT ?auto_7614 ?auto_7618 ) ( ON ?auto_7614 ?auto_7619 ) ( CLEAR ?auto_7614 ) ( not ( = ?auto_7613 ?auto_7619 ) ) ( not ( = ?auto_7614 ?auto_7619 ) ) ( not ( = ?auto_7617 ?auto_7619 ) ) ( TRUCK-AT ?auto_7616 ?auto_7620 ) ( SURFACE-AT ?auto_7617 ?auto_7620 ) ( CLEAR ?auto_7617 ) ( LIFTING ?auto_7621 ?auto_7613 ) ( IS-CRATE ?auto_7613 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7617 ?auto_7613 )
      ( MAKE-2CRATE ?auto_7617 ?auto_7613 ?auto_7614 )
      ( MAKE-1CRATE-VERIFY ?auto_7613 ?auto_7614 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7622 - SURFACE
      ?auto_7623 - SURFACE
      ?auto_7624 - SURFACE
    )
    :vars
    (
      ?auto_7628 - HOIST
      ?auto_7625 - PLACE
      ?auto_7629 - PLACE
      ?auto_7626 - HOIST
      ?auto_7627 - SURFACE
      ?auto_7630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7628 ?auto_7625 ) ( IS-CRATE ?auto_7624 ) ( not ( = ?auto_7623 ?auto_7624 ) ) ( not ( = ?auto_7622 ?auto_7623 ) ) ( not ( = ?auto_7622 ?auto_7624 ) ) ( not ( = ?auto_7629 ?auto_7625 ) ) ( HOIST-AT ?auto_7626 ?auto_7629 ) ( not ( = ?auto_7628 ?auto_7626 ) ) ( AVAILABLE ?auto_7626 ) ( SURFACE-AT ?auto_7624 ?auto_7629 ) ( ON ?auto_7624 ?auto_7627 ) ( CLEAR ?auto_7624 ) ( not ( = ?auto_7623 ?auto_7627 ) ) ( not ( = ?auto_7624 ?auto_7627 ) ) ( not ( = ?auto_7622 ?auto_7627 ) ) ( TRUCK-AT ?auto_7630 ?auto_7625 ) ( SURFACE-AT ?auto_7622 ?auto_7625 ) ( CLEAR ?auto_7622 ) ( LIFTING ?auto_7628 ?auto_7623 ) ( IS-CRATE ?auto_7623 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7623 ?auto_7624 )
      ( MAKE-2CRATE-VERIFY ?auto_7622 ?auto_7623 ?auto_7624 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7631 - SURFACE
      ?auto_7632 - SURFACE
    )
    :vars
    (
      ?auto_7635 - HOIST
      ?auto_7634 - PLACE
      ?auto_7633 - SURFACE
      ?auto_7636 - PLACE
      ?auto_7637 - HOIST
      ?auto_7638 - SURFACE
      ?auto_7639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7635 ?auto_7634 ) ( IS-CRATE ?auto_7632 ) ( not ( = ?auto_7631 ?auto_7632 ) ) ( not ( = ?auto_7633 ?auto_7631 ) ) ( not ( = ?auto_7633 ?auto_7632 ) ) ( not ( = ?auto_7636 ?auto_7634 ) ) ( HOIST-AT ?auto_7637 ?auto_7636 ) ( not ( = ?auto_7635 ?auto_7637 ) ) ( AVAILABLE ?auto_7637 ) ( SURFACE-AT ?auto_7632 ?auto_7636 ) ( ON ?auto_7632 ?auto_7638 ) ( CLEAR ?auto_7632 ) ( not ( = ?auto_7631 ?auto_7638 ) ) ( not ( = ?auto_7632 ?auto_7638 ) ) ( not ( = ?auto_7633 ?auto_7638 ) ) ( TRUCK-AT ?auto_7639 ?auto_7634 ) ( SURFACE-AT ?auto_7633 ?auto_7634 ) ( CLEAR ?auto_7633 ) ( IS-CRATE ?auto_7631 ) ( AVAILABLE ?auto_7635 ) ( IN ?auto_7631 ?auto_7639 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7635 ?auto_7631 ?auto_7639 ?auto_7634 )
      ( MAKE-2CRATE ?auto_7633 ?auto_7631 ?auto_7632 )
      ( MAKE-1CRATE-VERIFY ?auto_7631 ?auto_7632 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7640 - SURFACE
      ?auto_7641 - SURFACE
      ?auto_7642 - SURFACE
    )
    :vars
    (
      ?auto_7643 - HOIST
      ?auto_7646 - PLACE
      ?auto_7648 - PLACE
      ?auto_7645 - HOIST
      ?auto_7647 - SURFACE
      ?auto_7644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7643 ?auto_7646 ) ( IS-CRATE ?auto_7642 ) ( not ( = ?auto_7641 ?auto_7642 ) ) ( not ( = ?auto_7640 ?auto_7641 ) ) ( not ( = ?auto_7640 ?auto_7642 ) ) ( not ( = ?auto_7648 ?auto_7646 ) ) ( HOIST-AT ?auto_7645 ?auto_7648 ) ( not ( = ?auto_7643 ?auto_7645 ) ) ( AVAILABLE ?auto_7645 ) ( SURFACE-AT ?auto_7642 ?auto_7648 ) ( ON ?auto_7642 ?auto_7647 ) ( CLEAR ?auto_7642 ) ( not ( = ?auto_7641 ?auto_7647 ) ) ( not ( = ?auto_7642 ?auto_7647 ) ) ( not ( = ?auto_7640 ?auto_7647 ) ) ( TRUCK-AT ?auto_7644 ?auto_7646 ) ( SURFACE-AT ?auto_7640 ?auto_7646 ) ( CLEAR ?auto_7640 ) ( IS-CRATE ?auto_7641 ) ( AVAILABLE ?auto_7643 ) ( IN ?auto_7641 ?auto_7644 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7641 ?auto_7642 )
      ( MAKE-2CRATE-VERIFY ?auto_7640 ?auto_7641 ?auto_7642 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7649 - SURFACE
      ?auto_7650 - SURFACE
    )
    :vars
    (
      ?auto_7652 - HOIST
      ?auto_7657 - PLACE
      ?auto_7654 - SURFACE
      ?auto_7653 - PLACE
      ?auto_7655 - HOIST
      ?auto_7656 - SURFACE
      ?auto_7651 - TRUCK
      ?auto_7658 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7652 ?auto_7657 ) ( IS-CRATE ?auto_7650 ) ( not ( = ?auto_7649 ?auto_7650 ) ) ( not ( = ?auto_7654 ?auto_7649 ) ) ( not ( = ?auto_7654 ?auto_7650 ) ) ( not ( = ?auto_7653 ?auto_7657 ) ) ( HOIST-AT ?auto_7655 ?auto_7653 ) ( not ( = ?auto_7652 ?auto_7655 ) ) ( AVAILABLE ?auto_7655 ) ( SURFACE-AT ?auto_7650 ?auto_7653 ) ( ON ?auto_7650 ?auto_7656 ) ( CLEAR ?auto_7650 ) ( not ( = ?auto_7649 ?auto_7656 ) ) ( not ( = ?auto_7650 ?auto_7656 ) ) ( not ( = ?auto_7654 ?auto_7656 ) ) ( SURFACE-AT ?auto_7654 ?auto_7657 ) ( CLEAR ?auto_7654 ) ( IS-CRATE ?auto_7649 ) ( AVAILABLE ?auto_7652 ) ( IN ?auto_7649 ?auto_7651 ) ( TRUCK-AT ?auto_7651 ?auto_7658 ) ( not ( = ?auto_7658 ?auto_7657 ) ) ( not ( = ?auto_7653 ?auto_7658 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7651 ?auto_7658 ?auto_7657 )
      ( MAKE-2CRATE ?auto_7654 ?auto_7649 ?auto_7650 )
      ( MAKE-1CRATE-VERIFY ?auto_7649 ?auto_7650 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7659 - SURFACE
      ?auto_7660 - SURFACE
      ?auto_7661 - SURFACE
    )
    :vars
    (
      ?auto_7662 - HOIST
      ?auto_7668 - PLACE
      ?auto_7667 - PLACE
      ?auto_7665 - HOIST
      ?auto_7663 - SURFACE
      ?auto_7664 - TRUCK
      ?auto_7666 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7662 ?auto_7668 ) ( IS-CRATE ?auto_7661 ) ( not ( = ?auto_7660 ?auto_7661 ) ) ( not ( = ?auto_7659 ?auto_7660 ) ) ( not ( = ?auto_7659 ?auto_7661 ) ) ( not ( = ?auto_7667 ?auto_7668 ) ) ( HOIST-AT ?auto_7665 ?auto_7667 ) ( not ( = ?auto_7662 ?auto_7665 ) ) ( AVAILABLE ?auto_7665 ) ( SURFACE-AT ?auto_7661 ?auto_7667 ) ( ON ?auto_7661 ?auto_7663 ) ( CLEAR ?auto_7661 ) ( not ( = ?auto_7660 ?auto_7663 ) ) ( not ( = ?auto_7661 ?auto_7663 ) ) ( not ( = ?auto_7659 ?auto_7663 ) ) ( SURFACE-AT ?auto_7659 ?auto_7668 ) ( CLEAR ?auto_7659 ) ( IS-CRATE ?auto_7660 ) ( AVAILABLE ?auto_7662 ) ( IN ?auto_7660 ?auto_7664 ) ( TRUCK-AT ?auto_7664 ?auto_7666 ) ( not ( = ?auto_7666 ?auto_7668 ) ) ( not ( = ?auto_7667 ?auto_7666 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7660 ?auto_7661 )
      ( MAKE-2CRATE-VERIFY ?auto_7659 ?auto_7660 ?auto_7661 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7669 - SURFACE
      ?auto_7670 - SURFACE
    )
    :vars
    (
      ?auto_7675 - HOIST
      ?auto_7673 - PLACE
      ?auto_7677 - SURFACE
      ?auto_7676 - PLACE
      ?auto_7678 - HOIST
      ?auto_7671 - SURFACE
      ?auto_7672 - TRUCK
      ?auto_7674 - PLACE
      ?auto_7679 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7675 ?auto_7673 ) ( IS-CRATE ?auto_7670 ) ( not ( = ?auto_7669 ?auto_7670 ) ) ( not ( = ?auto_7677 ?auto_7669 ) ) ( not ( = ?auto_7677 ?auto_7670 ) ) ( not ( = ?auto_7676 ?auto_7673 ) ) ( HOIST-AT ?auto_7678 ?auto_7676 ) ( not ( = ?auto_7675 ?auto_7678 ) ) ( AVAILABLE ?auto_7678 ) ( SURFACE-AT ?auto_7670 ?auto_7676 ) ( ON ?auto_7670 ?auto_7671 ) ( CLEAR ?auto_7670 ) ( not ( = ?auto_7669 ?auto_7671 ) ) ( not ( = ?auto_7670 ?auto_7671 ) ) ( not ( = ?auto_7677 ?auto_7671 ) ) ( SURFACE-AT ?auto_7677 ?auto_7673 ) ( CLEAR ?auto_7677 ) ( IS-CRATE ?auto_7669 ) ( AVAILABLE ?auto_7675 ) ( TRUCK-AT ?auto_7672 ?auto_7674 ) ( not ( = ?auto_7674 ?auto_7673 ) ) ( not ( = ?auto_7676 ?auto_7674 ) ) ( HOIST-AT ?auto_7679 ?auto_7674 ) ( LIFTING ?auto_7679 ?auto_7669 ) ( not ( = ?auto_7675 ?auto_7679 ) ) ( not ( = ?auto_7678 ?auto_7679 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7679 ?auto_7669 ?auto_7672 ?auto_7674 )
      ( MAKE-2CRATE ?auto_7677 ?auto_7669 ?auto_7670 )
      ( MAKE-1CRATE-VERIFY ?auto_7669 ?auto_7670 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7680 - SURFACE
      ?auto_7681 - SURFACE
      ?auto_7682 - SURFACE
    )
    :vars
    (
      ?auto_7689 - HOIST
      ?auto_7688 - PLACE
      ?auto_7684 - PLACE
      ?auto_7686 - HOIST
      ?auto_7683 - SURFACE
      ?auto_7690 - TRUCK
      ?auto_7685 - PLACE
      ?auto_7687 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7689 ?auto_7688 ) ( IS-CRATE ?auto_7682 ) ( not ( = ?auto_7681 ?auto_7682 ) ) ( not ( = ?auto_7680 ?auto_7681 ) ) ( not ( = ?auto_7680 ?auto_7682 ) ) ( not ( = ?auto_7684 ?auto_7688 ) ) ( HOIST-AT ?auto_7686 ?auto_7684 ) ( not ( = ?auto_7689 ?auto_7686 ) ) ( AVAILABLE ?auto_7686 ) ( SURFACE-AT ?auto_7682 ?auto_7684 ) ( ON ?auto_7682 ?auto_7683 ) ( CLEAR ?auto_7682 ) ( not ( = ?auto_7681 ?auto_7683 ) ) ( not ( = ?auto_7682 ?auto_7683 ) ) ( not ( = ?auto_7680 ?auto_7683 ) ) ( SURFACE-AT ?auto_7680 ?auto_7688 ) ( CLEAR ?auto_7680 ) ( IS-CRATE ?auto_7681 ) ( AVAILABLE ?auto_7689 ) ( TRUCK-AT ?auto_7690 ?auto_7685 ) ( not ( = ?auto_7685 ?auto_7688 ) ) ( not ( = ?auto_7684 ?auto_7685 ) ) ( HOIST-AT ?auto_7687 ?auto_7685 ) ( LIFTING ?auto_7687 ?auto_7681 ) ( not ( = ?auto_7689 ?auto_7687 ) ) ( not ( = ?auto_7686 ?auto_7687 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7681 ?auto_7682 )
      ( MAKE-2CRATE-VERIFY ?auto_7680 ?auto_7681 ?auto_7682 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7691 - SURFACE
      ?auto_7692 - SURFACE
    )
    :vars
    (
      ?auto_7697 - HOIST
      ?auto_7700 - PLACE
      ?auto_7693 - SURFACE
      ?auto_7695 - PLACE
      ?auto_7696 - HOIST
      ?auto_7694 - SURFACE
      ?auto_7699 - TRUCK
      ?auto_7701 - PLACE
      ?auto_7698 - HOIST
      ?auto_7702 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7697 ?auto_7700 ) ( IS-CRATE ?auto_7692 ) ( not ( = ?auto_7691 ?auto_7692 ) ) ( not ( = ?auto_7693 ?auto_7691 ) ) ( not ( = ?auto_7693 ?auto_7692 ) ) ( not ( = ?auto_7695 ?auto_7700 ) ) ( HOIST-AT ?auto_7696 ?auto_7695 ) ( not ( = ?auto_7697 ?auto_7696 ) ) ( AVAILABLE ?auto_7696 ) ( SURFACE-AT ?auto_7692 ?auto_7695 ) ( ON ?auto_7692 ?auto_7694 ) ( CLEAR ?auto_7692 ) ( not ( = ?auto_7691 ?auto_7694 ) ) ( not ( = ?auto_7692 ?auto_7694 ) ) ( not ( = ?auto_7693 ?auto_7694 ) ) ( SURFACE-AT ?auto_7693 ?auto_7700 ) ( CLEAR ?auto_7693 ) ( IS-CRATE ?auto_7691 ) ( AVAILABLE ?auto_7697 ) ( TRUCK-AT ?auto_7699 ?auto_7701 ) ( not ( = ?auto_7701 ?auto_7700 ) ) ( not ( = ?auto_7695 ?auto_7701 ) ) ( HOIST-AT ?auto_7698 ?auto_7701 ) ( not ( = ?auto_7697 ?auto_7698 ) ) ( not ( = ?auto_7696 ?auto_7698 ) ) ( AVAILABLE ?auto_7698 ) ( SURFACE-AT ?auto_7691 ?auto_7701 ) ( ON ?auto_7691 ?auto_7702 ) ( CLEAR ?auto_7691 ) ( not ( = ?auto_7691 ?auto_7702 ) ) ( not ( = ?auto_7692 ?auto_7702 ) ) ( not ( = ?auto_7693 ?auto_7702 ) ) ( not ( = ?auto_7694 ?auto_7702 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7698 ?auto_7691 ?auto_7702 ?auto_7701 )
      ( MAKE-2CRATE ?auto_7693 ?auto_7691 ?auto_7692 )
      ( MAKE-1CRATE-VERIFY ?auto_7691 ?auto_7692 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7703 - SURFACE
      ?auto_7704 - SURFACE
      ?auto_7705 - SURFACE
    )
    :vars
    (
      ?auto_7709 - HOIST
      ?auto_7710 - PLACE
      ?auto_7711 - PLACE
      ?auto_7706 - HOIST
      ?auto_7713 - SURFACE
      ?auto_7714 - TRUCK
      ?auto_7707 - PLACE
      ?auto_7712 - HOIST
      ?auto_7708 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7709 ?auto_7710 ) ( IS-CRATE ?auto_7705 ) ( not ( = ?auto_7704 ?auto_7705 ) ) ( not ( = ?auto_7703 ?auto_7704 ) ) ( not ( = ?auto_7703 ?auto_7705 ) ) ( not ( = ?auto_7711 ?auto_7710 ) ) ( HOIST-AT ?auto_7706 ?auto_7711 ) ( not ( = ?auto_7709 ?auto_7706 ) ) ( AVAILABLE ?auto_7706 ) ( SURFACE-AT ?auto_7705 ?auto_7711 ) ( ON ?auto_7705 ?auto_7713 ) ( CLEAR ?auto_7705 ) ( not ( = ?auto_7704 ?auto_7713 ) ) ( not ( = ?auto_7705 ?auto_7713 ) ) ( not ( = ?auto_7703 ?auto_7713 ) ) ( SURFACE-AT ?auto_7703 ?auto_7710 ) ( CLEAR ?auto_7703 ) ( IS-CRATE ?auto_7704 ) ( AVAILABLE ?auto_7709 ) ( TRUCK-AT ?auto_7714 ?auto_7707 ) ( not ( = ?auto_7707 ?auto_7710 ) ) ( not ( = ?auto_7711 ?auto_7707 ) ) ( HOIST-AT ?auto_7712 ?auto_7707 ) ( not ( = ?auto_7709 ?auto_7712 ) ) ( not ( = ?auto_7706 ?auto_7712 ) ) ( AVAILABLE ?auto_7712 ) ( SURFACE-AT ?auto_7704 ?auto_7707 ) ( ON ?auto_7704 ?auto_7708 ) ( CLEAR ?auto_7704 ) ( not ( = ?auto_7704 ?auto_7708 ) ) ( not ( = ?auto_7705 ?auto_7708 ) ) ( not ( = ?auto_7703 ?auto_7708 ) ) ( not ( = ?auto_7713 ?auto_7708 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7704 ?auto_7705 )
      ( MAKE-2CRATE-VERIFY ?auto_7703 ?auto_7704 ?auto_7705 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7715 - SURFACE
      ?auto_7716 - SURFACE
    )
    :vars
    (
      ?auto_7721 - HOIST
      ?auto_7722 - PLACE
      ?auto_7720 - SURFACE
      ?auto_7718 - PLACE
      ?auto_7725 - HOIST
      ?auto_7726 - SURFACE
      ?auto_7717 - PLACE
      ?auto_7724 - HOIST
      ?auto_7719 - SURFACE
      ?auto_7723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7721 ?auto_7722 ) ( IS-CRATE ?auto_7716 ) ( not ( = ?auto_7715 ?auto_7716 ) ) ( not ( = ?auto_7720 ?auto_7715 ) ) ( not ( = ?auto_7720 ?auto_7716 ) ) ( not ( = ?auto_7718 ?auto_7722 ) ) ( HOIST-AT ?auto_7725 ?auto_7718 ) ( not ( = ?auto_7721 ?auto_7725 ) ) ( AVAILABLE ?auto_7725 ) ( SURFACE-AT ?auto_7716 ?auto_7718 ) ( ON ?auto_7716 ?auto_7726 ) ( CLEAR ?auto_7716 ) ( not ( = ?auto_7715 ?auto_7726 ) ) ( not ( = ?auto_7716 ?auto_7726 ) ) ( not ( = ?auto_7720 ?auto_7726 ) ) ( SURFACE-AT ?auto_7720 ?auto_7722 ) ( CLEAR ?auto_7720 ) ( IS-CRATE ?auto_7715 ) ( AVAILABLE ?auto_7721 ) ( not ( = ?auto_7717 ?auto_7722 ) ) ( not ( = ?auto_7718 ?auto_7717 ) ) ( HOIST-AT ?auto_7724 ?auto_7717 ) ( not ( = ?auto_7721 ?auto_7724 ) ) ( not ( = ?auto_7725 ?auto_7724 ) ) ( AVAILABLE ?auto_7724 ) ( SURFACE-AT ?auto_7715 ?auto_7717 ) ( ON ?auto_7715 ?auto_7719 ) ( CLEAR ?auto_7715 ) ( not ( = ?auto_7715 ?auto_7719 ) ) ( not ( = ?auto_7716 ?auto_7719 ) ) ( not ( = ?auto_7720 ?auto_7719 ) ) ( not ( = ?auto_7726 ?auto_7719 ) ) ( TRUCK-AT ?auto_7723 ?auto_7722 ) )
    :subtasks
    ( ( !DRIVE ?auto_7723 ?auto_7722 ?auto_7717 )
      ( MAKE-2CRATE ?auto_7720 ?auto_7715 ?auto_7716 )
      ( MAKE-1CRATE-VERIFY ?auto_7715 ?auto_7716 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7727 - SURFACE
      ?auto_7728 - SURFACE
      ?auto_7729 - SURFACE
    )
    :vars
    (
      ?auto_7735 - HOIST
      ?auto_7734 - PLACE
      ?auto_7736 - PLACE
      ?auto_7733 - HOIST
      ?auto_7731 - SURFACE
      ?auto_7730 - PLACE
      ?auto_7732 - HOIST
      ?auto_7737 - SURFACE
      ?auto_7738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7735 ?auto_7734 ) ( IS-CRATE ?auto_7729 ) ( not ( = ?auto_7728 ?auto_7729 ) ) ( not ( = ?auto_7727 ?auto_7728 ) ) ( not ( = ?auto_7727 ?auto_7729 ) ) ( not ( = ?auto_7736 ?auto_7734 ) ) ( HOIST-AT ?auto_7733 ?auto_7736 ) ( not ( = ?auto_7735 ?auto_7733 ) ) ( AVAILABLE ?auto_7733 ) ( SURFACE-AT ?auto_7729 ?auto_7736 ) ( ON ?auto_7729 ?auto_7731 ) ( CLEAR ?auto_7729 ) ( not ( = ?auto_7728 ?auto_7731 ) ) ( not ( = ?auto_7729 ?auto_7731 ) ) ( not ( = ?auto_7727 ?auto_7731 ) ) ( SURFACE-AT ?auto_7727 ?auto_7734 ) ( CLEAR ?auto_7727 ) ( IS-CRATE ?auto_7728 ) ( AVAILABLE ?auto_7735 ) ( not ( = ?auto_7730 ?auto_7734 ) ) ( not ( = ?auto_7736 ?auto_7730 ) ) ( HOIST-AT ?auto_7732 ?auto_7730 ) ( not ( = ?auto_7735 ?auto_7732 ) ) ( not ( = ?auto_7733 ?auto_7732 ) ) ( AVAILABLE ?auto_7732 ) ( SURFACE-AT ?auto_7728 ?auto_7730 ) ( ON ?auto_7728 ?auto_7737 ) ( CLEAR ?auto_7728 ) ( not ( = ?auto_7728 ?auto_7737 ) ) ( not ( = ?auto_7729 ?auto_7737 ) ) ( not ( = ?auto_7727 ?auto_7737 ) ) ( not ( = ?auto_7731 ?auto_7737 ) ) ( TRUCK-AT ?auto_7738 ?auto_7734 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7728 ?auto_7729 )
      ( MAKE-2CRATE-VERIFY ?auto_7727 ?auto_7728 ?auto_7729 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7748 - SURFACE
      ?auto_7749 - SURFACE
    )
    :vars
    (
      ?auto_7750 - HOIST
      ?auto_7751 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7750 ?auto_7751 ) ( SURFACE-AT ?auto_7748 ?auto_7751 ) ( CLEAR ?auto_7748 ) ( LIFTING ?auto_7750 ?auto_7749 ) ( IS-CRATE ?auto_7749 ) ( not ( = ?auto_7748 ?auto_7749 ) ) )
    :subtasks
    ( ( !DROP ?auto_7750 ?auto_7749 ?auto_7748 ?auto_7751 )
      ( MAKE-1CRATE-VERIFY ?auto_7748 ?auto_7749 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7752 - SURFACE
      ?auto_7753 - SURFACE
      ?auto_7754 - SURFACE
    )
    :vars
    (
      ?auto_7756 - HOIST
      ?auto_7755 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7756 ?auto_7755 ) ( SURFACE-AT ?auto_7753 ?auto_7755 ) ( CLEAR ?auto_7753 ) ( LIFTING ?auto_7756 ?auto_7754 ) ( IS-CRATE ?auto_7754 ) ( not ( = ?auto_7753 ?auto_7754 ) ) ( ON ?auto_7753 ?auto_7752 ) ( not ( = ?auto_7752 ?auto_7753 ) ) ( not ( = ?auto_7752 ?auto_7754 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7753 ?auto_7754 )
      ( MAKE-2CRATE-VERIFY ?auto_7752 ?auto_7753 ?auto_7754 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7757 - SURFACE
      ?auto_7758 - SURFACE
      ?auto_7759 - SURFACE
      ?auto_7760 - SURFACE
    )
    :vars
    (
      ?auto_7762 - HOIST
      ?auto_7761 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7762 ?auto_7761 ) ( SURFACE-AT ?auto_7759 ?auto_7761 ) ( CLEAR ?auto_7759 ) ( LIFTING ?auto_7762 ?auto_7760 ) ( IS-CRATE ?auto_7760 ) ( not ( = ?auto_7759 ?auto_7760 ) ) ( ON ?auto_7758 ?auto_7757 ) ( ON ?auto_7759 ?auto_7758 ) ( not ( = ?auto_7757 ?auto_7758 ) ) ( not ( = ?auto_7757 ?auto_7759 ) ) ( not ( = ?auto_7757 ?auto_7760 ) ) ( not ( = ?auto_7758 ?auto_7759 ) ) ( not ( = ?auto_7758 ?auto_7760 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7759 ?auto_7760 )
      ( MAKE-3CRATE-VERIFY ?auto_7757 ?auto_7758 ?auto_7759 ?auto_7760 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7763 - SURFACE
      ?auto_7764 - SURFACE
    )
    :vars
    (
      ?auto_7766 - HOIST
      ?auto_7765 - PLACE
      ?auto_7767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7766 ?auto_7765 ) ( SURFACE-AT ?auto_7763 ?auto_7765 ) ( CLEAR ?auto_7763 ) ( IS-CRATE ?auto_7764 ) ( not ( = ?auto_7763 ?auto_7764 ) ) ( TRUCK-AT ?auto_7767 ?auto_7765 ) ( AVAILABLE ?auto_7766 ) ( IN ?auto_7764 ?auto_7767 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7766 ?auto_7764 ?auto_7767 ?auto_7765 )
      ( MAKE-1CRATE ?auto_7763 ?auto_7764 )
      ( MAKE-1CRATE-VERIFY ?auto_7763 ?auto_7764 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7768 - SURFACE
      ?auto_7769 - SURFACE
      ?auto_7770 - SURFACE
    )
    :vars
    (
      ?auto_7773 - HOIST
      ?auto_7772 - PLACE
      ?auto_7771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7773 ?auto_7772 ) ( SURFACE-AT ?auto_7769 ?auto_7772 ) ( CLEAR ?auto_7769 ) ( IS-CRATE ?auto_7770 ) ( not ( = ?auto_7769 ?auto_7770 ) ) ( TRUCK-AT ?auto_7771 ?auto_7772 ) ( AVAILABLE ?auto_7773 ) ( IN ?auto_7770 ?auto_7771 ) ( ON ?auto_7769 ?auto_7768 ) ( not ( = ?auto_7768 ?auto_7769 ) ) ( not ( = ?auto_7768 ?auto_7770 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7769 ?auto_7770 )
      ( MAKE-2CRATE-VERIFY ?auto_7768 ?auto_7769 ?auto_7770 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7774 - SURFACE
      ?auto_7775 - SURFACE
      ?auto_7776 - SURFACE
      ?auto_7777 - SURFACE
    )
    :vars
    (
      ?auto_7779 - HOIST
      ?auto_7780 - PLACE
      ?auto_7778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7779 ?auto_7780 ) ( SURFACE-AT ?auto_7776 ?auto_7780 ) ( CLEAR ?auto_7776 ) ( IS-CRATE ?auto_7777 ) ( not ( = ?auto_7776 ?auto_7777 ) ) ( TRUCK-AT ?auto_7778 ?auto_7780 ) ( AVAILABLE ?auto_7779 ) ( IN ?auto_7777 ?auto_7778 ) ( ON ?auto_7776 ?auto_7775 ) ( not ( = ?auto_7775 ?auto_7776 ) ) ( not ( = ?auto_7775 ?auto_7777 ) ) ( ON ?auto_7775 ?auto_7774 ) ( not ( = ?auto_7774 ?auto_7775 ) ) ( not ( = ?auto_7774 ?auto_7776 ) ) ( not ( = ?auto_7774 ?auto_7777 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7775 ?auto_7776 ?auto_7777 )
      ( MAKE-3CRATE-VERIFY ?auto_7774 ?auto_7775 ?auto_7776 ?auto_7777 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7781 - SURFACE
      ?auto_7782 - SURFACE
    )
    :vars
    (
      ?auto_7785 - HOIST
      ?auto_7786 - PLACE
      ?auto_7784 - TRUCK
      ?auto_7783 - SURFACE
      ?auto_7787 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7785 ?auto_7786 ) ( SURFACE-AT ?auto_7781 ?auto_7786 ) ( CLEAR ?auto_7781 ) ( IS-CRATE ?auto_7782 ) ( not ( = ?auto_7781 ?auto_7782 ) ) ( AVAILABLE ?auto_7785 ) ( IN ?auto_7782 ?auto_7784 ) ( ON ?auto_7781 ?auto_7783 ) ( not ( = ?auto_7783 ?auto_7781 ) ) ( not ( = ?auto_7783 ?auto_7782 ) ) ( TRUCK-AT ?auto_7784 ?auto_7787 ) ( not ( = ?auto_7787 ?auto_7786 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7784 ?auto_7787 ?auto_7786 )
      ( MAKE-2CRATE ?auto_7783 ?auto_7781 ?auto_7782 )
      ( MAKE-1CRATE-VERIFY ?auto_7781 ?auto_7782 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7788 - SURFACE
      ?auto_7789 - SURFACE
      ?auto_7790 - SURFACE
    )
    :vars
    (
      ?auto_7794 - HOIST
      ?auto_7793 - PLACE
      ?auto_7791 - TRUCK
      ?auto_7792 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7794 ?auto_7793 ) ( SURFACE-AT ?auto_7789 ?auto_7793 ) ( CLEAR ?auto_7789 ) ( IS-CRATE ?auto_7790 ) ( not ( = ?auto_7789 ?auto_7790 ) ) ( AVAILABLE ?auto_7794 ) ( IN ?auto_7790 ?auto_7791 ) ( ON ?auto_7789 ?auto_7788 ) ( not ( = ?auto_7788 ?auto_7789 ) ) ( not ( = ?auto_7788 ?auto_7790 ) ) ( TRUCK-AT ?auto_7791 ?auto_7792 ) ( not ( = ?auto_7792 ?auto_7793 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7789 ?auto_7790 )
      ( MAKE-2CRATE-VERIFY ?auto_7788 ?auto_7789 ?auto_7790 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7795 - SURFACE
      ?auto_7796 - SURFACE
      ?auto_7797 - SURFACE
      ?auto_7798 - SURFACE
    )
    :vars
    (
      ?auto_7799 - HOIST
      ?auto_7801 - PLACE
      ?auto_7802 - TRUCK
      ?auto_7800 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7799 ?auto_7801 ) ( SURFACE-AT ?auto_7797 ?auto_7801 ) ( CLEAR ?auto_7797 ) ( IS-CRATE ?auto_7798 ) ( not ( = ?auto_7797 ?auto_7798 ) ) ( AVAILABLE ?auto_7799 ) ( IN ?auto_7798 ?auto_7802 ) ( ON ?auto_7797 ?auto_7796 ) ( not ( = ?auto_7796 ?auto_7797 ) ) ( not ( = ?auto_7796 ?auto_7798 ) ) ( TRUCK-AT ?auto_7802 ?auto_7800 ) ( not ( = ?auto_7800 ?auto_7801 ) ) ( ON ?auto_7796 ?auto_7795 ) ( not ( = ?auto_7795 ?auto_7796 ) ) ( not ( = ?auto_7795 ?auto_7797 ) ) ( not ( = ?auto_7795 ?auto_7798 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7796 ?auto_7797 ?auto_7798 )
      ( MAKE-3CRATE-VERIFY ?auto_7795 ?auto_7796 ?auto_7797 ?auto_7798 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7803 - SURFACE
      ?auto_7804 - SURFACE
    )
    :vars
    (
      ?auto_7805 - HOIST
      ?auto_7807 - PLACE
      ?auto_7808 - SURFACE
      ?auto_7809 - TRUCK
      ?auto_7806 - PLACE
      ?auto_7810 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7805 ?auto_7807 ) ( SURFACE-AT ?auto_7803 ?auto_7807 ) ( CLEAR ?auto_7803 ) ( IS-CRATE ?auto_7804 ) ( not ( = ?auto_7803 ?auto_7804 ) ) ( AVAILABLE ?auto_7805 ) ( ON ?auto_7803 ?auto_7808 ) ( not ( = ?auto_7808 ?auto_7803 ) ) ( not ( = ?auto_7808 ?auto_7804 ) ) ( TRUCK-AT ?auto_7809 ?auto_7806 ) ( not ( = ?auto_7806 ?auto_7807 ) ) ( HOIST-AT ?auto_7810 ?auto_7806 ) ( LIFTING ?auto_7810 ?auto_7804 ) ( not ( = ?auto_7805 ?auto_7810 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7810 ?auto_7804 ?auto_7809 ?auto_7806 )
      ( MAKE-2CRATE ?auto_7808 ?auto_7803 ?auto_7804 )
      ( MAKE-1CRATE-VERIFY ?auto_7803 ?auto_7804 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7811 - SURFACE
      ?auto_7812 - SURFACE
      ?auto_7813 - SURFACE
    )
    :vars
    (
      ?auto_7817 - HOIST
      ?auto_7818 - PLACE
      ?auto_7815 - TRUCK
      ?auto_7814 - PLACE
      ?auto_7816 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7817 ?auto_7818 ) ( SURFACE-AT ?auto_7812 ?auto_7818 ) ( CLEAR ?auto_7812 ) ( IS-CRATE ?auto_7813 ) ( not ( = ?auto_7812 ?auto_7813 ) ) ( AVAILABLE ?auto_7817 ) ( ON ?auto_7812 ?auto_7811 ) ( not ( = ?auto_7811 ?auto_7812 ) ) ( not ( = ?auto_7811 ?auto_7813 ) ) ( TRUCK-AT ?auto_7815 ?auto_7814 ) ( not ( = ?auto_7814 ?auto_7818 ) ) ( HOIST-AT ?auto_7816 ?auto_7814 ) ( LIFTING ?auto_7816 ?auto_7813 ) ( not ( = ?auto_7817 ?auto_7816 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7812 ?auto_7813 )
      ( MAKE-2CRATE-VERIFY ?auto_7811 ?auto_7812 ?auto_7813 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7819 - SURFACE
      ?auto_7820 - SURFACE
      ?auto_7821 - SURFACE
      ?auto_7822 - SURFACE
    )
    :vars
    (
      ?auto_7824 - HOIST
      ?auto_7826 - PLACE
      ?auto_7823 - TRUCK
      ?auto_7825 - PLACE
      ?auto_7827 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7824 ?auto_7826 ) ( SURFACE-AT ?auto_7821 ?auto_7826 ) ( CLEAR ?auto_7821 ) ( IS-CRATE ?auto_7822 ) ( not ( = ?auto_7821 ?auto_7822 ) ) ( AVAILABLE ?auto_7824 ) ( ON ?auto_7821 ?auto_7820 ) ( not ( = ?auto_7820 ?auto_7821 ) ) ( not ( = ?auto_7820 ?auto_7822 ) ) ( TRUCK-AT ?auto_7823 ?auto_7825 ) ( not ( = ?auto_7825 ?auto_7826 ) ) ( HOIST-AT ?auto_7827 ?auto_7825 ) ( LIFTING ?auto_7827 ?auto_7822 ) ( not ( = ?auto_7824 ?auto_7827 ) ) ( ON ?auto_7820 ?auto_7819 ) ( not ( = ?auto_7819 ?auto_7820 ) ) ( not ( = ?auto_7819 ?auto_7821 ) ) ( not ( = ?auto_7819 ?auto_7822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7820 ?auto_7821 ?auto_7822 )
      ( MAKE-3CRATE-VERIFY ?auto_7819 ?auto_7820 ?auto_7821 ?auto_7822 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7828 - SURFACE
      ?auto_7829 - SURFACE
    )
    :vars
    (
      ?auto_7831 - HOIST
      ?auto_7834 - PLACE
      ?auto_7832 - SURFACE
      ?auto_7830 - TRUCK
      ?auto_7833 - PLACE
      ?auto_7835 - HOIST
      ?auto_7836 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7831 ?auto_7834 ) ( SURFACE-AT ?auto_7828 ?auto_7834 ) ( CLEAR ?auto_7828 ) ( IS-CRATE ?auto_7829 ) ( not ( = ?auto_7828 ?auto_7829 ) ) ( AVAILABLE ?auto_7831 ) ( ON ?auto_7828 ?auto_7832 ) ( not ( = ?auto_7832 ?auto_7828 ) ) ( not ( = ?auto_7832 ?auto_7829 ) ) ( TRUCK-AT ?auto_7830 ?auto_7833 ) ( not ( = ?auto_7833 ?auto_7834 ) ) ( HOIST-AT ?auto_7835 ?auto_7833 ) ( not ( = ?auto_7831 ?auto_7835 ) ) ( AVAILABLE ?auto_7835 ) ( SURFACE-AT ?auto_7829 ?auto_7833 ) ( ON ?auto_7829 ?auto_7836 ) ( CLEAR ?auto_7829 ) ( not ( = ?auto_7828 ?auto_7836 ) ) ( not ( = ?auto_7829 ?auto_7836 ) ) ( not ( = ?auto_7832 ?auto_7836 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7835 ?auto_7829 ?auto_7836 ?auto_7833 )
      ( MAKE-2CRATE ?auto_7832 ?auto_7828 ?auto_7829 )
      ( MAKE-1CRATE-VERIFY ?auto_7828 ?auto_7829 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7837 - SURFACE
      ?auto_7838 - SURFACE
      ?auto_7839 - SURFACE
    )
    :vars
    (
      ?auto_7841 - HOIST
      ?auto_7840 - PLACE
      ?auto_7843 - TRUCK
      ?auto_7842 - PLACE
      ?auto_7844 - HOIST
      ?auto_7845 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7841 ?auto_7840 ) ( SURFACE-AT ?auto_7838 ?auto_7840 ) ( CLEAR ?auto_7838 ) ( IS-CRATE ?auto_7839 ) ( not ( = ?auto_7838 ?auto_7839 ) ) ( AVAILABLE ?auto_7841 ) ( ON ?auto_7838 ?auto_7837 ) ( not ( = ?auto_7837 ?auto_7838 ) ) ( not ( = ?auto_7837 ?auto_7839 ) ) ( TRUCK-AT ?auto_7843 ?auto_7842 ) ( not ( = ?auto_7842 ?auto_7840 ) ) ( HOIST-AT ?auto_7844 ?auto_7842 ) ( not ( = ?auto_7841 ?auto_7844 ) ) ( AVAILABLE ?auto_7844 ) ( SURFACE-AT ?auto_7839 ?auto_7842 ) ( ON ?auto_7839 ?auto_7845 ) ( CLEAR ?auto_7839 ) ( not ( = ?auto_7838 ?auto_7845 ) ) ( not ( = ?auto_7839 ?auto_7845 ) ) ( not ( = ?auto_7837 ?auto_7845 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7838 ?auto_7839 )
      ( MAKE-2CRATE-VERIFY ?auto_7837 ?auto_7838 ?auto_7839 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7846 - SURFACE
      ?auto_7847 - SURFACE
      ?auto_7848 - SURFACE
      ?auto_7849 - SURFACE
    )
    :vars
    (
      ?auto_7852 - HOIST
      ?auto_7855 - PLACE
      ?auto_7851 - TRUCK
      ?auto_7854 - PLACE
      ?auto_7853 - HOIST
      ?auto_7850 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7852 ?auto_7855 ) ( SURFACE-AT ?auto_7848 ?auto_7855 ) ( CLEAR ?auto_7848 ) ( IS-CRATE ?auto_7849 ) ( not ( = ?auto_7848 ?auto_7849 ) ) ( AVAILABLE ?auto_7852 ) ( ON ?auto_7848 ?auto_7847 ) ( not ( = ?auto_7847 ?auto_7848 ) ) ( not ( = ?auto_7847 ?auto_7849 ) ) ( TRUCK-AT ?auto_7851 ?auto_7854 ) ( not ( = ?auto_7854 ?auto_7855 ) ) ( HOIST-AT ?auto_7853 ?auto_7854 ) ( not ( = ?auto_7852 ?auto_7853 ) ) ( AVAILABLE ?auto_7853 ) ( SURFACE-AT ?auto_7849 ?auto_7854 ) ( ON ?auto_7849 ?auto_7850 ) ( CLEAR ?auto_7849 ) ( not ( = ?auto_7848 ?auto_7850 ) ) ( not ( = ?auto_7849 ?auto_7850 ) ) ( not ( = ?auto_7847 ?auto_7850 ) ) ( ON ?auto_7847 ?auto_7846 ) ( not ( = ?auto_7846 ?auto_7847 ) ) ( not ( = ?auto_7846 ?auto_7848 ) ) ( not ( = ?auto_7846 ?auto_7849 ) ) ( not ( = ?auto_7846 ?auto_7850 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7847 ?auto_7848 ?auto_7849 )
      ( MAKE-3CRATE-VERIFY ?auto_7846 ?auto_7847 ?auto_7848 ?auto_7849 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7856 - SURFACE
      ?auto_7857 - SURFACE
    )
    :vars
    (
      ?auto_7860 - HOIST
      ?auto_7863 - PLACE
      ?auto_7864 - SURFACE
      ?auto_7862 - PLACE
      ?auto_7861 - HOIST
      ?auto_7858 - SURFACE
      ?auto_7859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7860 ?auto_7863 ) ( SURFACE-AT ?auto_7856 ?auto_7863 ) ( CLEAR ?auto_7856 ) ( IS-CRATE ?auto_7857 ) ( not ( = ?auto_7856 ?auto_7857 ) ) ( AVAILABLE ?auto_7860 ) ( ON ?auto_7856 ?auto_7864 ) ( not ( = ?auto_7864 ?auto_7856 ) ) ( not ( = ?auto_7864 ?auto_7857 ) ) ( not ( = ?auto_7862 ?auto_7863 ) ) ( HOIST-AT ?auto_7861 ?auto_7862 ) ( not ( = ?auto_7860 ?auto_7861 ) ) ( AVAILABLE ?auto_7861 ) ( SURFACE-AT ?auto_7857 ?auto_7862 ) ( ON ?auto_7857 ?auto_7858 ) ( CLEAR ?auto_7857 ) ( not ( = ?auto_7856 ?auto_7858 ) ) ( not ( = ?auto_7857 ?auto_7858 ) ) ( not ( = ?auto_7864 ?auto_7858 ) ) ( TRUCK-AT ?auto_7859 ?auto_7863 ) )
    :subtasks
    ( ( !DRIVE ?auto_7859 ?auto_7863 ?auto_7862 )
      ( MAKE-2CRATE ?auto_7864 ?auto_7856 ?auto_7857 )
      ( MAKE-1CRATE-VERIFY ?auto_7856 ?auto_7857 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7865 - SURFACE
      ?auto_7866 - SURFACE
      ?auto_7867 - SURFACE
    )
    :vars
    (
      ?auto_7870 - HOIST
      ?auto_7873 - PLACE
      ?auto_7868 - PLACE
      ?auto_7872 - HOIST
      ?auto_7869 - SURFACE
      ?auto_7871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7870 ?auto_7873 ) ( SURFACE-AT ?auto_7866 ?auto_7873 ) ( CLEAR ?auto_7866 ) ( IS-CRATE ?auto_7867 ) ( not ( = ?auto_7866 ?auto_7867 ) ) ( AVAILABLE ?auto_7870 ) ( ON ?auto_7866 ?auto_7865 ) ( not ( = ?auto_7865 ?auto_7866 ) ) ( not ( = ?auto_7865 ?auto_7867 ) ) ( not ( = ?auto_7868 ?auto_7873 ) ) ( HOIST-AT ?auto_7872 ?auto_7868 ) ( not ( = ?auto_7870 ?auto_7872 ) ) ( AVAILABLE ?auto_7872 ) ( SURFACE-AT ?auto_7867 ?auto_7868 ) ( ON ?auto_7867 ?auto_7869 ) ( CLEAR ?auto_7867 ) ( not ( = ?auto_7866 ?auto_7869 ) ) ( not ( = ?auto_7867 ?auto_7869 ) ) ( not ( = ?auto_7865 ?auto_7869 ) ) ( TRUCK-AT ?auto_7871 ?auto_7873 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7866 ?auto_7867 )
      ( MAKE-2CRATE-VERIFY ?auto_7865 ?auto_7866 ?auto_7867 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7874 - SURFACE
      ?auto_7875 - SURFACE
      ?auto_7876 - SURFACE
      ?auto_7877 - SURFACE
    )
    :vars
    (
      ?auto_7880 - HOIST
      ?auto_7883 - PLACE
      ?auto_7878 - PLACE
      ?auto_7881 - HOIST
      ?auto_7882 - SURFACE
      ?auto_7879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7880 ?auto_7883 ) ( SURFACE-AT ?auto_7876 ?auto_7883 ) ( CLEAR ?auto_7876 ) ( IS-CRATE ?auto_7877 ) ( not ( = ?auto_7876 ?auto_7877 ) ) ( AVAILABLE ?auto_7880 ) ( ON ?auto_7876 ?auto_7875 ) ( not ( = ?auto_7875 ?auto_7876 ) ) ( not ( = ?auto_7875 ?auto_7877 ) ) ( not ( = ?auto_7878 ?auto_7883 ) ) ( HOIST-AT ?auto_7881 ?auto_7878 ) ( not ( = ?auto_7880 ?auto_7881 ) ) ( AVAILABLE ?auto_7881 ) ( SURFACE-AT ?auto_7877 ?auto_7878 ) ( ON ?auto_7877 ?auto_7882 ) ( CLEAR ?auto_7877 ) ( not ( = ?auto_7876 ?auto_7882 ) ) ( not ( = ?auto_7877 ?auto_7882 ) ) ( not ( = ?auto_7875 ?auto_7882 ) ) ( TRUCK-AT ?auto_7879 ?auto_7883 ) ( ON ?auto_7875 ?auto_7874 ) ( not ( = ?auto_7874 ?auto_7875 ) ) ( not ( = ?auto_7874 ?auto_7876 ) ) ( not ( = ?auto_7874 ?auto_7877 ) ) ( not ( = ?auto_7874 ?auto_7882 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7875 ?auto_7876 ?auto_7877 )
      ( MAKE-3CRATE-VERIFY ?auto_7874 ?auto_7875 ?auto_7876 ?auto_7877 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7884 - SURFACE
      ?auto_7885 - SURFACE
    )
    :vars
    (
      ?auto_7888 - HOIST
      ?auto_7891 - PLACE
      ?auto_7892 - SURFACE
      ?auto_7886 - PLACE
      ?auto_7889 - HOIST
      ?auto_7890 - SURFACE
      ?auto_7887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7888 ?auto_7891 ) ( IS-CRATE ?auto_7885 ) ( not ( = ?auto_7884 ?auto_7885 ) ) ( not ( = ?auto_7892 ?auto_7884 ) ) ( not ( = ?auto_7892 ?auto_7885 ) ) ( not ( = ?auto_7886 ?auto_7891 ) ) ( HOIST-AT ?auto_7889 ?auto_7886 ) ( not ( = ?auto_7888 ?auto_7889 ) ) ( AVAILABLE ?auto_7889 ) ( SURFACE-AT ?auto_7885 ?auto_7886 ) ( ON ?auto_7885 ?auto_7890 ) ( CLEAR ?auto_7885 ) ( not ( = ?auto_7884 ?auto_7890 ) ) ( not ( = ?auto_7885 ?auto_7890 ) ) ( not ( = ?auto_7892 ?auto_7890 ) ) ( TRUCK-AT ?auto_7887 ?auto_7891 ) ( SURFACE-AT ?auto_7892 ?auto_7891 ) ( CLEAR ?auto_7892 ) ( LIFTING ?auto_7888 ?auto_7884 ) ( IS-CRATE ?auto_7884 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7892 ?auto_7884 )
      ( MAKE-2CRATE ?auto_7892 ?auto_7884 ?auto_7885 )
      ( MAKE-1CRATE-VERIFY ?auto_7884 ?auto_7885 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7893 - SURFACE
      ?auto_7894 - SURFACE
      ?auto_7895 - SURFACE
    )
    :vars
    (
      ?auto_7898 - HOIST
      ?auto_7896 - PLACE
      ?auto_7897 - PLACE
      ?auto_7901 - HOIST
      ?auto_7899 - SURFACE
      ?auto_7900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7898 ?auto_7896 ) ( IS-CRATE ?auto_7895 ) ( not ( = ?auto_7894 ?auto_7895 ) ) ( not ( = ?auto_7893 ?auto_7894 ) ) ( not ( = ?auto_7893 ?auto_7895 ) ) ( not ( = ?auto_7897 ?auto_7896 ) ) ( HOIST-AT ?auto_7901 ?auto_7897 ) ( not ( = ?auto_7898 ?auto_7901 ) ) ( AVAILABLE ?auto_7901 ) ( SURFACE-AT ?auto_7895 ?auto_7897 ) ( ON ?auto_7895 ?auto_7899 ) ( CLEAR ?auto_7895 ) ( not ( = ?auto_7894 ?auto_7899 ) ) ( not ( = ?auto_7895 ?auto_7899 ) ) ( not ( = ?auto_7893 ?auto_7899 ) ) ( TRUCK-AT ?auto_7900 ?auto_7896 ) ( SURFACE-AT ?auto_7893 ?auto_7896 ) ( CLEAR ?auto_7893 ) ( LIFTING ?auto_7898 ?auto_7894 ) ( IS-CRATE ?auto_7894 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7894 ?auto_7895 )
      ( MAKE-2CRATE-VERIFY ?auto_7893 ?auto_7894 ?auto_7895 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7902 - SURFACE
      ?auto_7903 - SURFACE
      ?auto_7904 - SURFACE
      ?auto_7905 - SURFACE
    )
    :vars
    (
      ?auto_7907 - HOIST
      ?auto_7910 - PLACE
      ?auto_7906 - PLACE
      ?auto_7911 - HOIST
      ?auto_7909 - SURFACE
      ?auto_7908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7907 ?auto_7910 ) ( IS-CRATE ?auto_7905 ) ( not ( = ?auto_7904 ?auto_7905 ) ) ( not ( = ?auto_7903 ?auto_7904 ) ) ( not ( = ?auto_7903 ?auto_7905 ) ) ( not ( = ?auto_7906 ?auto_7910 ) ) ( HOIST-AT ?auto_7911 ?auto_7906 ) ( not ( = ?auto_7907 ?auto_7911 ) ) ( AVAILABLE ?auto_7911 ) ( SURFACE-AT ?auto_7905 ?auto_7906 ) ( ON ?auto_7905 ?auto_7909 ) ( CLEAR ?auto_7905 ) ( not ( = ?auto_7904 ?auto_7909 ) ) ( not ( = ?auto_7905 ?auto_7909 ) ) ( not ( = ?auto_7903 ?auto_7909 ) ) ( TRUCK-AT ?auto_7908 ?auto_7910 ) ( SURFACE-AT ?auto_7903 ?auto_7910 ) ( CLEAR ?auto_7903 ) ( LIFTING ?auto_7907 ?auto_7904 ) ( IS-CRATE ?auto_7904 ) ( ON ?auto_7903 ?auto_7902 ) ( not ( = ?auto_7902 ?auto_7903 ) ) ( not ( = ?auto_7902 ?auto_7904 ) ) ( not ( = ?auto_7902 ?auto_7905 ) ) ( not ( = ?auto_7902 ?auto_7909 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7903 ?auto_7904 ?auto_7905 )
      ( MAKE-3CRATE-VERIFY ?auto_7902 ?auto_7903 ?auto_7904 ?auto_7905 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7912 - SURFACE
      ?auto_7913 - SURFACE
    )
    :vars
    (
      ?auto_7915 - HOIST
      ?auto_7919 - PLACE
      ?auto_7918 - SURFACE
      ?auto_7914 - PLACE
      ?auto_7920 - HOIST
      ?auto_7917 - SURFACE
      ?auto_7916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7915 ?auto_7919 ) ( IS-CRATE ?auto_7913 ) ( not ( = ?auto_7912 ?auto_7913 ) ) ( not ( = ?auto_7918 ?auto_7912 ) ) ( not ( = ?auto_7918 ?auto_7913 ) ) ( not ( = ?auto_7914 ?auto_7919 ) ) ( HOIST-AT ?auto_7920 ?auto_7914 ) ( not ( = ?auto_7915 ?auto_7920 ) ) ( AVAILABLE ?auto_7920 ) ( SURFACE-AT ?auto_7913 ?auto_7914 ) ( ON ?auto_7913 ?auto_7917 ) ( CLEAR ?auto_7913 ) ( not ( = ?auto_7912 ?auto_7917 ) ) ( not ( = ?auto_7913 ?auto_7917 ) ) ( not ( = ?auto_7918 ?auto_7917 ) ) ( TRUCK-AT ?auto_7916 ?auto_7919 ) ( SURFACE-AT ?auto_7918 ?auto_7919 ) ( CLEAR ?auto_7918 ) ( IS-CRATE ?auto_7912 ) ( AVAILABLE ?auto_7915 ) ( IN ?auto_7912 ?auto_7916 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7915 ?auto_7912 ?auto_7916 ?auto_7919 )
      ( MAKE-2CRATE ?auto_7918 ?auto_7912 ?auto_7913 )
      ( MAKE-1CRATE-VERIFY ?auto_7912 ?auto_7913 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7921 - SURFACE
      ?auto_7922 - SURFACE
      ?auto_7923 - SURFACE
    )
    :vars
    (
      ?auto_7925 - HOIST
      ?auto_7928 - PLACE
      ?auto_7927 - PLACE
      ?auto_7924 - HOIST
      ?auto_7929 - SURFACE
      ?auto_7926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7925 ?auto_7928 ) ( IS-CRATE ?auto_7923 ) ( not ( = ?auto_7922 ?auto_7923 ) ) ( not ( = ?auto_7921 ?auto_7922 ) ) ( not ( = ?auto_7921 ?auto_7923 ) ) ( not ( = ?auto_7927 ?auto_7928 ) ) ( HOIST-AT ?auto_7924 ?auto_7927 ) ( not ( = ?auto_7925 ?auto_7924 ) ) ( AVAILABLE ?auto_7924 ) ( SURFACE-AT ?auto_7923 ?auto_7927 ) ( ON ?auto_7923 ?auto_7929 ) ( CLEAR ?auto_7923 ) ( not ( = ?auto_7922 ?auto_7929 ) ) ( not ( = ?auto_7923 ?auto_7929 ) ) ( not ( = ?auto_7921 ?auto_7929 ) ) ( TRUCK-AT ?auto_7926 ?auto_7928 ) ( SURFACE-AT ?auto_7921 ?auto_7928 ) ( CLEAR ?auto_7921 ) ( IS-CRATE ?auto_7922 ) ( AVAILABLE ?auto_7925 ) ( IN ?auto_7922 ?auto_7926 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7922 ?auto_7923 )
      ( MAKE-2CRATE-VERIFY ?auto_7921 ?auto_7922 ?auto_7923 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7930 - SURFACE
      ?auto_7931 - SURFACE
      ?auto_7932 - SURFACE
      ?auto_7933 - SURFACE
    )
    :vars
    (
      ?auto_7936 - HOIST
      ?auto_7937 - PLACE
      ?auto_7938 - PLACE
      ?auto_7934 - HOIST
      ?auto_7935 - SURFACE
      ?auto_7939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7936 ?auto_7937 ) ( IS-CRATE ?auto_7933 ) ( not ( = ?auto_7932 ?auto_7933 ) ) ( not ( = ?auto_7931 ?auto_7932 ) ) ( not ( = ?auto_7931 ?auto_7933 ) ) ( not ( = ?auto_7938 ?auto_7937 ) ) ( HOIST-AT ?auto_7934 ?auto_7938 ) ( not ( = ?auto_7936 ?auto_7934 ) ) ( AVAILABLE ?auto_7934 ) ( SURFACE-AT ?auto_7933 ?auto_7938 ) ( ON ?auto_7933 ?auto_7935 ) ( CLEAR ?auto_7933 ) ( not ( = ?auto_7932 ?auto_7935 ) ) ( not ( = ?auto_7933 ?auto_7935 ) ) ( not ( = ?auto_7931 ?auto_7935 ) ) ( TRUCK-AT ?auto_7939 ?auto_7937 ) ( SURFACE-AT ?auto_7931 ?auto_7937 ) ( CLEAR ?auto_7931 ) ( IS-CRATE ?auto_7932 ) ( AVAILABLE ?auto_7936 ) ( IN ?auto_7932 ?auto_7939 ) ( ON ?auto_7931 ?auto_7930 ) ( not ( = ?auto_7930 ?auto_7931 ) ) ( not ( = ?auto_7930 ?auto_7932 ) ) ( not ( = ?auto_7930 ?auto_7933 ) ) ( not ( = ?auto_7930 ?auto_7935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7931 ?auto_7932 ?auto_7933 )
      ( MAKE-3CRATE-VERIFY ?auto_7930 ?auto_7931 ?auto_7932 ?auto_7933 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7940 - SURFACE
      ?auto_7941 - SURFACE
    )
    :vars
    (
      ?auto_7945 - HOIST
      ?auto_7946 - PLACE
      ?auto_7943 - SURFACE
      ?auto_7947 - PLACE
      ?auto_7942 - HOIST
      ?auto_7944 - SURFACE
      ?auto_7948 - TRUCK
      ?auto_7949 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7945 ?auto_7946 ) ( IS-CRATE ?auto_7941 ) ( not ( = ?auto_7940 ?auto_7941 ) ) ( not ( = ?auto_7943 ?auto_7940 ) ) ( not ( = ?auto_7943 ?auto_7941 ) ) ( not ( = ?auto_7947 ?auto_7946 ) ) ( HOIST-AT ?auto_7942 ?auto_7947 ) ( not ( = ?auto_7945 ?auto_7942 ) ) ( AVAILABLE ?auto_7942 ) ( SURFACE-AT ?auto_7941 ?auto_7947 ) ( ON ?auto_7941 ?auto_7944 ) ( CLEAR ?auto_7941 ) ( not ( = ?auto_7940 ?auto_7944 ) ) ( not ( = ?auto_7941 ?auto_7944 ) ) ( not ( = ?auto_7943 ?auto_7944 ) ) ( SURFACE-AT ?auto_7943 ?auto_7946 ) ( CLEAR ?auto_7943 ) ( IS-CRATE ?auto_7940 ) ( AVAILABLE ?auto_7945 ) ( IN ?auto_7940 ?auto_7948 ) ( TRUCK-AT ?auto_7948 ?auto_7949 ) ( not ( = ?auto_7949 ?auto_7946 ) ) ( not ( = ?auto_7947 ?auto_7949 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7948 ?auto_7949 ?auto_7946 )
      ( MAKE-2CRATE ?auto_7943 ?auto_7940 ?auto_7941 )
      ( MAKE-1CRATE-VERIFY ?auto_7940 ?auto_7941 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7950 - SURFACE
      ?auto_7951 - SURFACE
      ?auto_7952 - SURFACE
    )
    :vars
    (
      ?auto_7954 - HOIST
      ?auto_7955 - PLACE
      ?auto_7957 - PLACE
      ?auto_7959 - HOIST
      ?auto_7953 - SURFACE
      ?auto_7958 - TRUCK
      ?auto_7956 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7954 ?auto_7955 ) ( IS-CRATE ?auto_7952 ) ( not ( = ?auto_7951 ?auto_7952 ) ) ( not ( = ?auto_7950 ?auto_7951 ) ) ( not ( = ?auto_7950 ?auto_7952 ) ) ( not ( = ?auto_7957 ?auto_7955 ) ) ( HOIST-AT ?auto_7959 ?auto_7957 ) ( not ( = ?auto_7954 ?auto_7959 ) ) ( AVAILABLE ?auto_7959 ) ( SURFACE-AT ?auto_7952 ?auto_7957 ) ( ON ?auto_7952 ?auto_7953 ) ( CLEAR ?auto_7952 ) ( not ( = ?auto_7951 ?auto_7953 ) ) ( not ( = ?auto_7952 ?auto_7953 ) ) ( not ( = ?auto_7950 ?auto_7953 ) ) ( SURFACE-AT ?auto_7950 ?auto_7955 ) ( CLEAR ?auto_7950 ) ( IS-CRATE ?auto_7951 ) ( AVAILABLE ?auto_7954 ) ( IN ?auto_7951 ?auto_7958 ) ( TRUCK-AT ?auto_7958 ?auto_7956 ) ( not ( = ?auto_7956 ?auto_7955 ) ) ( not ( = ?auto_7957 ?auto_7956 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7951 ?auto_7952 )
      ( MAKE-2CRATE-VERIFY ?auto_7950 ?auto_7951 ?auto_7952 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7960 - SURFACE
      ?auto_7961 - SURFACE
      ?auto_7962 - SURFACE
      ?auto_7963 - SURFACE
    )
    :vars
    (
      ?auto_7964 - HOIST
      ?auto_7966 - PLACE
      ?auto_7967 - PLACE
      ?auto_7969 - HOIST
      ?auto_7970 - SURFACE
      ?auto_7965 - TRUCK
      ?auto_7968 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7964 ?auto_7966 ) ( IS-CRATE ?auto_7963 ) ( not ( = ?auto_7962 ?auto_7963 ) ) ( not ( = ?auto_7961 ?auto_7962 ) ) ( not ( = ?auto_7961 ?auto_7963 ) ) ( not ( = ?auto_7967 ?auto_7966 ) ) ( HOIST-AT ?auto_7969 ?auto_7967 ) ( not ( = ?auto_7964 ?auto_7969 ) ) ( AVAILABLE ?auto_7969 ) ( SURFACE-AT ?auto_7963 ?auto_7967 ) ( ON ?auto_7963 ?auto_7970 ) ( CLEAR ?auto_7963 ) ( not ( = ?auto_7962 ?auto_7970 ) ) ( not ( = ?auto_7963 ?auto_7970 ) ) ( not ( = ?auto_7961 ?auto_7970 ) ) ( SURFACE-AT ?auto_7961 ?auto_7966 ) ( CLEAR ?auto_7961 ) ( IS-CRATE ?auto_7962 ) ( AVAILABLE ?auto_7964 ) ( IN ?auto_7962 ?auto_7965 ) ( TRUCK-AT ?auto_7965 ?auto_7968 ) ( not ( = ?auto_7968 ?auto_7966 ) ) ( not ( = ?auto_7967 ?auto_7968 ) ) ( ON ?auto_7961 ?auto_7960 ) ( not ( = ?auto_7960 ?auto_7961 ) ) ( not ( = ?auto_7960 ?auto_7962 ) ) ( not ( = ?auto_7960 ?auto_7963 ) ) ( not ( = ?auto_7960 ?auto_7970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7961 ?auto_7962 ?auto_7963 )
      ( MAKE-3CRATE-VERIFY ?auto_7960 ?auto_7961 ?auto_7962 ?auto_7963 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7971 - SURFACE
      ?auto_7972 - SURFACE
    )
    :vars
    (
      ?auto_7973 - HOIST
      ?auto_7975 - PLACE
      ?auto_7976 - SURFACE
      ?auto_7977 - PLACE
      ?auto_7979 - HOIST
      ?auto_7980 - SURFACE
      ?auto_7974 - TRUCK
      ?auto_7978 - PLACE
      ?auto_7981 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7973 ?auto_7975 ) ( IS-CRATE ?auto_7972 ) ( not ( = ?auto_7971 ?auto_7972 ) ) ( not ( = ?auto_7976 ?auto_7971 ) ) ( not ( = ?auto_7976 ?auto_7972 ) ) ( not ( = ?auto_7977 ?auto_7975 ) ) ( HOIST-AT ?auto_7979 ?auto_7977 ) ( not ( = ?auto_7973 ?auto_7979 ) ) ( AVAILABLE ?auto_7979 ) ( SURFACE-AT ?auto_7972 ?auto_7977 ) ( ON ?auto_7972 ?auto_7980 ) ( CLEAR ?auto_7972 ) ( not ( = ?auto_7971 ?auto_7980 ) ) ( not ( = ?auto_7972 ?auto_7980 ) ) ( not ( = ?auto_7976 ?auto_7980 ) ) ( SURFACE-AT ?auto_7976 ?auto_7975 ) ( CLEAR ?auto_7976 ) ( IS-CRATE ?auto_7971 ) ( AVAILABLE ?auto_7973 ) ( TRUCK-AT ?auto_7974 ?auto_7978 ) ( not ( = ?auto_7978 ?auto_7975 ) ) ( not ( = ?auto_7977 ?auto_7978 ) ) ( HOIST-AT ?auto_7981 ?auto_7978 ) ( LIFTING ?auto_7981 ?auto_7971 ) ( not ( = ?auto_7973 ?auto_7981 ) ) ( not ( = ?auto_7979 ?auto_7981 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7981 ?auto_7971 ?auto_7974 ?auto_7978 )
      ( MAKE-2CRATE ?auto_7976 ?auto_7971 ?auto_7972 )
      ( MAKE-1CRATE-VERIFY ?auto_7971 ?auto_7972 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7982 - SURFACE
      ?auto_7983 - SURFACE
      ?auto_7984 - SURFACE
    )
    :vars
    (
      ?auto_7988 - HOIST
      ?auto_7986 - PLACE
      ?auto_7991 - PLACE
      ?auto_7987 - HOIST
      ?auto_7992 - SURFACE
      ?auto_7985 - TRUCK
      ?auto_7990 - PLACE
      ?auto_7989 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7988 ?auto_7986 ) ( IS-CRATE ?auto_7984 ) ( not ( = ?auto_7983 ?auto_7984 ) ) ( not ( = ?auto_7982 ?auto_7983 ) ) ( not ( = ?auto_7982 ?auto_7984 ) ) ( not ( = ?auto_7991 ?auto_7986 ) ) ( HOIST-AT ?auto_7987 ?auto_7991 ) ( not ( = ?auto_7988 ?auto_7987 ) ) ( AVAILABLE ?auto_7987 ) ( SURFACE-AT ?auto_7984 ?auto_7991 ) ( ON ?auto_7984 ?auto_7992 ) ( CLEAR ?auto_7984 ) ( not ( = ?auto_7983 ?auto_7992 ) ) ( not ( = ?auto_7984 ?auto_7992 ) ) ( not ( = ?auto_7982 ?auto_7992 ) ) ( SURFACE-AT ?auto_7982 ?auto_7986 ) ( CLEAR ?auto_7982 ) ( IS-CRATE ?auto_7983 ) ( AVAILABLE ?auto_7988 ) ( TRUCK-AT ?auto_7985 ?auto_7990 ) ( not ( = ?auto_7990 ?auto_7986 ) ) ( not ( = ?auto_7991 ?auto_7990 ) ) ( HOIST-AT ?auto_7989 ?auto_7990 ) ( LIFTING ?auto_7989 ?auto_7983 ) ( not ( = ?auto_7988 ?auto_7989 ) ) ( not ( = ?auto_7987 ?auto_7989 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7983 ?auto_7984 )
      ( MAKE-2CRATE-VERIFY ?auto_7982 ?auto_7983 ?auto_7984 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7993 - SURFACE
      ?auto_7994 - SURFACE
      ?auto_7995 - SURFACE
      ?auto_7996 - SURFACE
    )
    :vars
    (
      ?auto_7997 - HOIST
      ?auto_7999 - PLACE
      ?auto_8001 - PLACE
      ?auto_8003 - HOIST
      ?auto_8000 - SURFACE
      ?auto_8004 - TRUCK
      ?auto_7998 - PLACE
      ?auto_8002 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7997 ?auto_7999 ) ( IS-CRATE ?auto_7996 ) ( not ( = ?auto_7995 ?auto_7996 ) ) ( not ( = ?auto_7994 ?auto_7995 ) ) ( not ( = ?auto_7994 ?auto_7996 ) ) ( not ( = ?auto_8001 ?auto_7999 ) ) ( HOIST-AT ?auto_8003 ?auto_8001 ) ( not ( = ?auto_7997 ?auto_8003 ) ) ( AVAILABLE ?auto_8003 ) ( SURFACE-AT ?auto_7996 ?auto_8001 ) ( ON ?auto_7996 ?auto_8000 ) ( CLEAR ?auto_7996 ) ( not ( = ?auto_7995 ?auto_8000 ) ) ( not ( = ?auto_7996 ?auto_8000 ) ) ( not ( = ?auto_7994 ?auto_8000 ) ) ( SURFACE-AT ?auto_7994 ?auto_7999 ) ( CLEAR ?auto_7994 ) ( IS-CRATE ?auto_7995 ) ( AVAILABLE ?auto_7997 ) ( TRUCK-AT ?auto_8004 ?auto_7998 ) ( not ( = ?auto_7998 ?auto_7999 ) ) ( not ( = ?auto_8001 ?auto_7998 ) ) ( HOIST-AT ?auto_8002 ?auto_7998 ) ( LIFTING ?auto_8002 ?auto_7995 ) ( not ( = ?auto_7997 ?auto_8002 ) ) ( not ( = ?auto_8003 ?auto_8002 ) ) ( ON ?auto_7994 ?auto_7993 ) ( not ( = ?auto_7993 ?auto_7994 ) ) ( not ( = ?auto_7993 ?auto_7995 ) ) ( not ( = ?auto_7993 ?auto_7996 ) ) ( not ( = ?auto_7993 ?auto_8000 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7994 ?auto_7995 ?auto_7996 )
      ( MAKE-3CRATE-VERIFY ?auto_7993 ?auto_7994 ?auto_7995 ?auto_7996 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8005 - SURFACE
      ?auto_8006 - SURFACE
    )
    :vars
    (
      ?auto_8007 - HOIST
      ?auto_8009 - PLACE
      ?auto_8012 - SURFACE
      ?auto_8011 - PLACE
      ?auto_8014 - HOIST
      ?auto_8010 - SURFACE
      ?auto_8015 - TRUCK
      ?auto_8008 - PLACE
      ?auto_8013 - HOIST
      ?auto_8016 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8007 ?auto_8009 ) ( IS-CRATE ?auto_8006 ) ( not ( = ?auto_8005 ?auto_8006 ) ) ( not ( = ?auto_8012 ?auto_8005 ) ) ( not ( = ?auto_8012 ?auto_8006 ) ) ( not ( = ?auto_8011 ?auto_8009 ) ) ( HOIST-AT ?auto_8014 ?auto_8011 ) ( not ( = ?auto_8007 ?auto_8014 ) ) ( AVAILABLE ?auto_8014 ) ( SURFACE-AT ?auto_8006 ?auto_8011 ) ( ON ?auto_8006 ?auto_8010 ) ( CLEAR ?auto_8006 ) ( not ( = ?auto_8005 ?auto_8010 ) ) ( not ( = ?auto_8006 ?auto_8010 ) ) ( not ( = ?auto_8012 ?auto_8010 ) ) ( SURFACE-AT ?auto_8012 ?auto_8009 ) ( CLEAR ?auto_8012 ) ( IS-CRATE ?auto_8005 ) ( AVAILABLE ?auto_8007 ) ( TRUCK-AT ?auto_8015 ?auto_8008 ) ( not ( = ?auto_8008 ?auto_8009 ) ) ( not ( = ?auto_8011 ?auto_8008 ) ) ( HOIST-AT ?auto_8013 ?auto_8008 ) ( not ( = ?auto_8007 ?auto_8013 ) ) ( not ( = ?auto_8014 ?auto_8013 ) ) ( AVAILABLE ?auto_8013 ) ( SURFACE-AT ?auto_8005 ?auto_8008 ) ( ON ?auto_8005 ?auto_8016 ) ( CLEAR ?auto_8005 ) ( not ( = ?auto_8005 ?auto_8016 ) ) ( not ( = ?auto_8006 ?auto_8016 ) ) ( not ( = ?auto_8012 ?auto_8016 ) ) ( not ( = ?auto_8010 ?auto_8016 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8013 ?auto_8005 ?auto_8016 ?auto_8008 )
      ( MAKE-2CRATE ?auto_8012 ?auto_8005 ?auto_8006 )
      ( MAKE-1CRATE-VERIFY ?auto_8005 ?auto_8006 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8017 - SURFACE
      ?auto_8018 - SURFACE
      ?auto_8019 - SURFACE
    )
    :vars
    (
      ?auto_8028 - HOIST
      ?auto_8026 - PLACE
      ?auto_8027 - PLACE
      ?auto_8021 - HOIST
      ?auto_8024 - SURFACE
      ?auto_8020 - TRUCK
      ?auto_8022 - PLACE
      ?auto_8025 - HOIST
      ?auto_8023 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8028 ?auto_8026 ) ( IS-CRATE ?auto_8019 ) ( not ( = ?auto_8018 ?auto_8019 ) ) ( not ( = ?auto_8017 ?auto_8018 ) ) ( not ( = ?auto_8017 ?auto_8019 ) ) ( not ( = ?auto_8027 ?auto_8026 ) ) ( HOIST-AT ?auto_8021 ?auto_8027 ) ( not ( = ?auto_8028 ?auto_8021 ) ) ( AVAILABLE ?auto_8021 ) ( SURFACE-AT ?auto_8019 ?auto_8027 ) ( ON ?auto_8019 ?auto_8024 ) ( CLEAR ?auto_8019 ) ( not ( = ?auto_8018 ?auto_8024 ) ) ( not ( = ?auto_8019 ?auto_8024 ) ) ( not ( = ?auto_8017 ?auto_8024 ) ) ( SURFACE-AT ?auto_8017 ?auto_8026 ) ( CLEAR ?auto_8017 ) ( IS-CRATE ?auto_8018 ) ( AVAILABLE ?auto_8028 ) ( TRUCK-AT ?auto_8020 ?auto_8022 ) ( not ( = ?auto_8022 ?auto_8026 ) ) ( not ( = ?auto_8027 ?auto_8022 ) ) ( HOIST-AT ?auto_8025 ?auto_8022 ) ( not ( = ?auto_8028 ?auto_8025 ) ) ( not ( = ?auto_8021 ?auto_8025 ) ) ( AVAILABLE ?auto_8025 ) ( SURFACE-AT ?auto_8018 ?auto_8022 ) ( ON ?auto_8018 ?auto_8023 ) ( CLEAR ?auto_8018 ) ( not ( = ?auto_8018 ?auto_8023 ) ) ( not ( = ?auto_8019 ?auto_8023 ) ) ( not ( = ?auto_8017 ?auto_8023 ) ) ( not ( = ?auto_8024 ?auto_8023 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8018 ?auto_8019 )
      ( MAKE-2CRATE-VERIFY ?auto_8017 ?auto_8018 ?auto_8019 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8029 - SURFACE
      ?auto_8030 - SURFACE
      ?auto_8031 - SURFACE
      ?auto_8032 - SURFACE
    )
    :vars
    (
      ?auto_8037 - HOIST
      ?auto_8034 - PLACE
      ?auto_8036 - PLACE
      ?auto_8038 - HOIST
      ?auto_8035 - SURFACE
      ?auto_8033 - TRUCK
      ?auto_8040 - PLACE
      ?auto_8039 - HOIST
      ?auto_8041 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8037 ?auto_8034 ) ( IS-CRATE ?auto_8032 ) ( not ( = ?auto_8031 ?auto_8032 ) ) ( not ( = ?auto_8030 ?auto_8031 ) ) ( not ( = ?auto_8030 ?auto_8032 ) ) ( not ( = ?auto_8036 ?auto_8034 ) ) ( HOIST-AT ?auto_8038 ?auto_8036 ) ( not ( = ?auto_8037 ?auto_8038 ) ) ( AVAILABLE ?auto_8038 ) ( SURFACE-AT ?auto_8032 ?auto_8036 ) ( ON ?auto_8032 ?auto_8035 ) ( CLEAR ?auto_8032 ) ( not ( = ?auto_8031 ?auto_8035 ) ) ( not ( = ?auto_8032 ?auto_8035 ) ) ( not ( = ?auto_8030 ?auto_8035 ) ) ( SURFACE-AT ?auto_8030 ?auto_8034 ) ( CLEAR ?auto_8030 ) ( IS-CRATE ?auto_8031 ) ( AVAILABLE ?auto_8037 ) ( TRUCK-AT ?auto_8033 ?auto_8040 ) ( not ( = ?auto_8040 ?auto_8034 ) ) ( not ( = ?auto_8036 ?auto_8040 ) ) ( HOIST-AT ?auto_8039 ?auto_8040 ) ( not ( = ?auto_8037 ?auto_8039 ) ) ( not ( = ?auto_8038 ?auto_8039 ) ) ( AVAILABLE ?auto_8039 ) ( SURFACE-AT ?auto_8031 ?auto_8040 ) ( ON ?auto_8031 ?auto_8041 ) ( CLEAR ?auto_8031 ) ( not ( = ?auto_8031 ?auto_8041 ) ) ( not ( = ?auto_8032 ?auto_8041 ) ) ( not ( = ?auto_8030 ?auto_8041 ) ) ( not ( = ?auto_8035 ?auto_8041 ) ) ( ON ?auto_8030 ?auto_8029 ) ( not ( = ?auto_8029 ?auto_8030 ) ) ( not ( = ?auto_8029 ?auto_8031 ) ) ( not ( = ?auto_8029 ?auto_8032 ) ) ( not ( = ?auto_8029 ?auto_8035 ) ) ( not ( = ?auto_8029 ?auto_8041 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8030 ?auto_8031 ?auto_8032 )
      ( MAKE-3CRATE-VERIFY ?auto_8029 ?auto_8030 ?auto_8031 ?auto_8032 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8042 - SURFACE
      ?auto_8043 - SURFACE
    )
    :vars
    (
      ?auto_8049 - HOIST
      ?auto_8046 - PLACE
      ?auto_8044 - SURFACE
      ?auto_8048 - PLACE
      ?auto_8050 - HOIST
      ?auto_8047 - SURFACE
      ?auto_8052 - PLACE
      ?auto_8051 - HOIST
      ?auto_8053 - SURFACE
      ?auto_8045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8049 ?auto_8046 ) ( IS-CRATE ?auto_8043 ) ( not ( = ?auto_8042 ?auto_8043 ) ) ( not ( = ?auto_8044 ?auto_8042 ) ) ( not ( = ?auto_8044 ?auto_8043 ) ) ( not ( = ?auto_8048 ?auto_8046 ) ) ( HOIST-AT ?auto_8050 ?auto_8048 ) ( not ( = ?auto_8049 ?auto_8050 ) ) ( AVAILABLE ?auto_8050 ) ( SURFACE-AT ?auto_8043 ?auto_8048 ) ( ON ?auto_8043 ?auto_8047 ) ( CLEAR ?auto_8043 ) ( not ( = ?auto_8042 ?auto_8047 ) ) ( not ( = ?auto_8043 ?auto_8047 ) ) ( not ( = ?auto_8044 ?auto_8047 ) ) ( SURFACE-AT ?auto_8044 ?auto_8046 ) ( CLEAR ?auto_8044 ) ( IS-CRATE ?auto_8042 ) ( AVAILABLE ?auto_8049 ) ( not ( = ?auto_8052 ?auto_8046 ) ) ( not ( = ?auto_8048 ?auto_8052 ) ) ( HOIST-AT ?auto_8051 ?auto_8052 ) ( not ( = ?auto_8049 ?auto_8051 ) ) ( not ( = ?auto_8050 ?auto_8051 ) ) ( AVAILABLE ?auto_8051 ) ( SURFACE-AT ?auto_8042 ?auto_8052 ) ( ON ?auto_8042 ?auto_8053 ) ( CLEAR ?auto_8042 ) ( not ( = ?auto_8042 ?auto_8053 ) ) ( not ( = ?auto_8043 ?auto_8053 ) ) ( not ( = ?auto_8044 ?auto_8053 ) ) ( not ( = ?auto_8047 ?auto_8053 ) ) ( TRUCK-AT ?auto_8045 ?auto_8046 ) )
    :subtasks
    ( ( !DRIVE ?auto_8045 ?auto_8046 ?auto_8052 )
      ( MAKE-2CRATE ?auto_8044 ?auto_8042 ?auto_8043 )
      ( MAKE-1CRATE-VERIFY ?auto_8042 ?auto_8043 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8054 - SURFACE
      ?auto_8055 - SURFACE
      ?auto_8056 - SURFACE
    )
    :vars
    (
      ?auto_8062 - HOIST
      ?auto_8057 - PLACE
      ?auto_8059 - PLACE
      ?auto_8063 - HOIST
      ?auto_8060 - SURFACE
      ?auto_8061 - PLACE
      ?auto_8058 - HOIST
      ?auto_8065 - SURFACE
      ?auto_8064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8062 ?auto_8057 ) ( IS-CRATE ?auto_8056 ) ( not ( = ?auto_8055 ?auto_8056 ) ) ( not ( = ?auto_8054 ?auto_8055 ) ) ( not ( = ?auto_8054 ?auto_8056 ) ) ( not ( = ?auto_8059 ?auto_8057 ) ) ( HOIST-AT ?auto_8063 ?auto_8059 ) ( not ( = ?auto_8062 ?auto_8063 ) ) ( AVAILABLE ?auto_8063 ) ( SURFACE-AT ?auto_8056 ?auto_8059 ) ( ON ?auto_8056 ?auto_8060 ) ( CLEAR ?auto_8056 ) ( not ( = ?auto_8055 ?auto_8060 ) ) ( not ( = ?auto_8056 ?auto_8060 ) ) ( not ( = ?auto_8054 ?auto_8060 ) ) ( SURFACE-AT ?auto_8054 ?auto_8057 ) ( CLEAR ?auto_8054 ) ( IS-CRATE ?auto_8055 ) ( AVAILABLE ?auto_8062 ) ( not ( = ?auto_8061 ?auto_8057 ) ) ( not ( = ?auto_8059 ?auto_8061 ) ) ( HOIST-AT ?auto_8058 ?auto_8061 ) ( not ( = ?auto_8062 ?auto_8058 ) ) ( not ( = ?auto_8063 ?auto_8058 ) ) ( AVAILABLE ?auto_8058 ) ( SURFACE-AT ?auto_8055 ?auto_8061 ) ( ON ?auto_8055 ?auto_8065 ) ( CLEAR ?auto_8055 ) ( not ( = ?auto_8055 ?auto_8065 ) ) ( not ( = ?auto_8056 ?auto_8065 ) ) ( not ( = ?auto_8054 ?auto_8065 ) ) ( not ( = ?auto_8060 ?auto_8065 ) ) ( TRUCK-AT ?auto_8064 ?auto_8057 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8055 ?auto_8056 )
      ( MAKE-2CRATE-VERIFY ?auto_8054 ?auto_8055 ?auto_8056 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8066 - SURFACE
      ?auto_8067 - SURFACE
      ?auto_8068 - SURFACE
      ?auto_8069 - SURFACE
    )
    :vars
    (
      ?auto_8074 - HOIST
      ?auto_8078 - PLACE
      ?auto_8071 - PLACE
      ?auto_8076 - HOIST
      ?auto_8077 - SURFACE
      ?auto_8073 - PLACE
      ?auto_8072 - HOIST
      ?auto_8075 - SURFACE
      ?auto_8070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8074 ?auto_8078 ) ( IS-CRATE ?auto_8069 ) ( not ( = ?auto_8068 ?auto_8069 ) ) ( not ( = ?auto_8067 ?auto_8068 ) ) ( not ( = ?auto_8067 ?auto_8069 ) ) ( not ( = ?auto_8071 ?auto_8078 ) ) ( HOIST-AT ?auto_8076 ?auto_8071 ) ( not ( = ?auto_8074 ?auto_8076 ) ) ( AVAILABLE ?auto_8076 ) ( SURFACE-AT ?auto_8069 ?auto_8071 ) ( ON ?auto_8069 ?auto_8077 ) ( CLEAR ?auto_8069 ) ( not ( = ?auto_8068 ?auto_8077 ) ) ( not ( = ?auto_8069 ?auto_8077 ) ) ( not ( = ?auto_8067 ?auto_8077 ) ) ( SURFACE-AT ?auto_8067 ?auto_8078 ) ( CLEAR ?auto_8067 ) ( IS-CRATE ?auto_8068 ) ( AVAILABLE ?auto_8074 ) ( not ( = ?auto_8073 ?auto_8078 ) ) ( not ( = ?auto_8071 ?auto_8073 ) ) ( HOIST-AT ?auto_8072 ?auto_8073 ) ( not ( = ?auto_8074 ?auto_8072 ) ) ( not ( = ?auto_8076 ?auto_8072 ) ) ( AVAILABLE ?auto_8072 ) ( SURFACE-AT ?auto_8068 ?auto_8073 ) ( ON ?auto_8068 ?auto_8075 ) ( CLEAR ?auto_8068 ) ( not ( = ?auto_8068 ?auto_8075 ) ) ( not ( = ?auto_8069 ?auto_8075 ) ) ( not ( = ?auto_8067 ?auto_8075 ) ) ( not ( = ?auto_8077 ?auto_8075 ) ) ( TRUCK-AT ?auto_8070 ?auto_8078 ) ( ON ?auto_8067 ?auto_8066 ) ( not ( = ?auto_8066 ?auto_8067 ) ) ( not ( = ?auto_8066 ?auto_8068 ) ) ( not ( = ?auto_8066 ?auto_8069 ) ) ( not ( = ?auto_8066 ?auto_8077 ) ) ( not ( = ?auto_8066 ?auto_8075 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8067 ?auto_8068 ?auto_8069 )
      ( MAKE-3CRATE-VERIFY ?auto_8066 ?auto_8067 ?auto_8068 ?auto_8069 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8079 - SURFACE
      ?auto_8080 - SURFACE
    )
    :vars
    (
      ?auto_8086 - HOIST
      ?auto_8090 - PLACE
      ?auto_8083 - SURFACE
      ?auto_8082 - PLACE
      ?auto_8088 - HOIST
      ?auto_8089 - SURFACE
      ?auto_8085 - PLACE
      ?auto_8084 - HOIST
      ?auto_8087 - SURFACE
      ?auto_8081 - TRUCK
      ?auto_8091 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8086 ?auto_8090 ) ( IS-CRATE ?auto_8080 ) ( not ( = ?auto_8079 ?auto_8080 ) ) ( not ( = ?auto_8083 ?auto_8079 ) ) ( not ( = ?auto_8083 ?auto_8080 ) ) ( not ( = ?auto_8082 ?auto_8090 ) ) ( HOIST-AT ?auto_8088 ?auto_8082 ) ( not ( = ?auto_8086 ?auto_8088 ) ) ( AVAILABLE ?auto_8088 ) ( SURFACE-AT ?auto_8080 ?auto_8082 ) ( ON ?auto_8080 ?auto_8089 ) ( CLEAR ?auto_8080 ) ( not ( = ?auto_8079 ?auto_8089 ) ) ( not ( = ?auto_8080 ?auto_8089 ) ) ( not ( = ?auto_8083 ?auto_8089 ) ) ( IS-CRATE ?auto_8079 ) ( not ( = ?auto_8085 ?auto_8090 ) ) ( not ( = ?auto_8082 ?auto_8085 ) ) ( HOIST-AT ?auto_8084 ?auto_8085 ) ( not ( = ?auto_8086 ?auto_8084 ) ) ( not ( = ?auto_8088 ?auto_8084 ) ) ( AVAILABLE ?auto_8084 ) ( SURFACE-AT ?auto_8079 ?auto_8085 ) ( ON ?auto_8079 ?auto_8087 ) ( CLEAR ?auto_8079 ) ( not ( = ?auto_8079 ?auto_8087 ) ) ( not ( = ?auto_8080 ?auto_8087 ) ) ( not ( = ?auto_8083 ?auto_8087 ) ) ( not ( = ?auto_8089 ?auto_8087 ) ) ( TRUCK-AT ?auto_8081 ?auto_8090 ) ( SURFACE-AT ?auto_8091 ?auto_8090 ) ( CLEAR ?auto_8091 ) ( LIFTING ?auto_8086 ?auto_8083 ) ( IS-CRATE ?auto_8083 ) ( not ( = ?auto_8091 ?auto_8083 ) ) ( not ( = ?auto_8079 ?auto_8091 ) ) ( not ( = ?auto_8080 ?auto_8091 ) ) ( not ( = ?auto_8089 ?auto_8091 ) ) ( not ( = ?auto_8087 ?auto_8091 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8091 ?auto_8083 )
      ( MAKE-2CRATE ?auto_8083 ?auto_8079 ?auto_8080 )
      ( MAKE-1CRATE-VERIFY ?auto_8079 ?auto_8080 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8092 - SURFACE
      ?auto_8093 - SURFACE
      ?auto_8094 - SURFACE
    )
    :vars
    (
      ?auto_8095 - HOIST
      ?auto_8104 - PLACE
      ?auto_8103 - PLACE
      ?auto_8100 - HOIST
      ?auto_8097 - SURFACE
      ?auto_8102 - PLACE
      ?auto_8101 - HOIST
      ?auto_8096 - SURFACE
      ?auto_8098 - TRUCK
      ?auto_8099 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8095 ?auto_8104 ) ( IS-CRATE ?auto_8094 ) ( not ( = ?auto_8093 ?auto_8094 ) ) ( not ( = ?auto_8092 ?auto_8093 ) ) ( not ( = ?auto_8092 ?auto_8094 ) ) ( not ( = ?auto_8103 ?auto_8104 ) ) ( HOIST-AT ?auto_8100 ?auto_8103 ) ( not ( = ?auto_8095 ?auto_8100 ) ) ( AVAILABLE ?auto_8100 ) ( SURFACE-AT ?auto_8094 ?auto_8103 ) ( ON ?auto_8094 ?auto_8097 ) ( CLEAR ?auto_8094 ) ( not ( = ?auto_8093 ?auto_8097 ) ) ( not ( = ?auto_8094 ?auto_8097 ) ) ( not ( = ?auto_8092 ?auto_8097 ) ) ( IS-CRATE ?auto_8093 ) ( not ( = ?auto_8102 ?auto_8104 ) ) ( not ( = ?auto_8103 ?auto_8102 ) ) ( HOIST-AT ?auto_8101 ?auto_8102 ) ( not ( = ?auto_8095 ?auto_8101 ) ) ( not ( = ?auto_8100 ?auto_8101 ) ) ( AVAILABLE ?auto_8101 ) ( SURFACE-AT ?auto_8093 ?auto_8102 ) ( ON ?auto_8093 ?auto_8096 ) ( CLEAR ?auto_8093 ) ( not ( = ?auto_8093 ?auto_8096 ) ) ( not ( = ?auto_8094 ?auto_8096 ) ) ( not ( = ?auto_8092 ?auto_8096 ) ) ( not ( = ?auto_8097 ?auto_8096 ) ) ( TRUCK-AT ?auto_8098 ?auto_8104 ) ( SURFACE-AT ?auto_8099 ?auto_8104 ) ( CLEAR ?auto_8099 ) ( LIFTING ?auto_8095 ?auto_8092 ) ( IS-CRATE ?auto_8092 ) ( not ( = ?auto_8099 ?auto_8092 ) ) ( not ( = ?auto_8093 ?auto_8099 ) ) ( not ( = ?auto_8094 ?auto_8099 ) ) ( not ( = ?auto_8097 ?auto_8099 ) ) ( not ( = ?auto_8096 ?auto_8099 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8093 ?auto_8094 )
      ( MAKE-2CRATE-VERIFY ?auto_8092 ?auto_8093 ?auto_8094 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8105 - SURFACE
      ?auto_8106 - SURFACE
      ?auto_8107 - SURFACE
      ?auto_8108 - SURFACE
    )
    :vars
    (
      ?auto_8116 - HOIST
      ?auto_8113 - PLACE
      ?auto_8115 - PLACE
      ?auto_8109 - HOIST
      ?auto_8111 - SURFACE
      ?auto_8114 - PLACE
      ?auto_8112 - HOIST
      ?auto_8110 - SURFACE
      ?auto_8117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8116 ?auto_8113 ) ( IS-CRATE ?auto_8108 ) ( not ( = ?auto_8107 ?auto_8108 ) ) ( not ( = ?auto_8106 ?auto_8107 ) ) ( not ( = ?auto_8106 ?auto_8108 ) ) ( not ( = ?auto_8115 ?auto_8113 ) ) ( HOIST-AT ?auto_8109 ?auto_8115 ) ( not ( = ?auto_8116 ?auto_8109 ) ) ( AVAILABLE ?auto_8109 ) ( SURFACE-AT ?auto_8108 ?auto_8115 ) ( ON ?auto_8108 ?auto_8111 ) ( CLEAR ?auto_8108 ) ( not ( = ?auto_8107 ?auto_8111 ) ) ( not ( = ?auto_8108 ?auto_8111 ) ) ( not ( = ?auto_8106 ?auto_8111 ) ) ( IS-CRATE ?auto_8107 ) ( not ( = ?auto_8114 ?auto_8113 ) ) ( not ( = ?auto_8115 ?auto_8114 ) ) ( HOIST-AT ?auto_8112 ?auto_8114 ) ( not ( = ?auto_8116 ?auto_8112 ) ) ( not ( = ?auto_8109 ?auto_8112 ) ) ( AVAILABLE ?auto_8112 ) ( SURFACE-AT ?auto_8107 ?auto_8114 ) ( ON ?auto_8107 ?auto_8110 ) ( CLEAR ?auto_8107 ) ( not ( = ?auto_8107 ?auto_8110 ) ) ( not ( = ?auto_8108 ?auto_8110 ) ) ( not ( = ?auto_8106 ?auto_8110 ) ) ( not ( = ?auto_8111 ?auto_8110 ) ) ( TRUCK-AT ?auto_8117 ?auto_8113 ) ( SURFACE-AT ?auto_8105 ?auto_8113 ) ( CLEAR ?auto_8105 ) ( LIFTING ?auto_8116 ?auto_8106 ) ( IS-CRATE ?auto_8106 ) ( not ( = ?auto_8105 ?auto_8106 ) ) ( not ( = ?auto_8107 ?auto_8105 ) ) ( not ( = ?auto_8108 ?auto_8105 ) ) ( not ( = ?auto_8111 ?auto_8105 ) ) ( not ( = ?auto_8110 ?auto_8105 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8106 ?auto_8107 ?auto_8108 )
      ( MAKE-3CRATE-VERIFY ?auto_8105 ?auto_8106 ?auto_8107 ?auto_8108 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8118 - SURFACE
      ?auto_8119 - SURFACE
    )
    :vars
    (
      ?auto_8129 - HOIST
      ?auto_8125 - PLACE
      ?auto_8126 - SURFACE
      ?auto_8128 - PLACE
      ?auto_8120 - HOIST
      ?auto_8123 - SURFACE
      ?auto_8127 - PLACE
      ?auto_8124 - HOIST
      ?auto_8122 - SURFACE
      ?auto_8130 - TRUCK
      ?auto_8121 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8129 ?auto_8125 ) ( IS-CRATE ?auto_8119 ) ( not ( = ?auto_8118 ?auto_8119 ) ) ( not ( = ?auto_8126 ?auto_8118 ) ) ( not ( = ?auto_8126 ?auto_8119 ) ) ( not ( = ?auto_8128 ?auto_8125 ) ) ( HOIST-AT ?auto_8120 ?auto_8128 ) ( not ( = ?auto_8129 ?auto_8120 ) ) ( AVAILABLE ?auto_8120 ) ( SURFACE-AT ?auto_8119 ?auto_8128 ) ( ON ?auto_8119 ?auto_8123 ) ( CLEAR ?auto_8119 ) ( not ( = ?auto_8118 ?auto_8123 ) ) ( not ( = ?auto_8119 ?auto_8123 ) ) ( not ( = ?auto_8126 ?auto_8123 ) ) ( IS-CRATE ?auto_8118 ) ( not ( = ?auto_8127 ?auto_8125 ) ) ( not ( = ?auto_8128 ?auto_8127 ) ) ( HOIST-AT ?auto_8124 ?auto_8127 ) ( not ( = ?auto_8129 ?auto_8124 ) ) ( not ( = ?auto_8120 ?auto_8124 ) ) ( AVAILABLE ?auto_8124 ) ( SURFACE-AT ?auto_8118 ?auto_8127 ) ( ON ?auto_8118 ?auto_8122 ) ( CLEAR ?auto_8118 ) ( not ( = ?auto_8118 ?auto_8122 ) ) ( not ( = ?auto_8119 ?auto_8122 ) ) ( not ( = ?auto_8126 ?auto_8122 ) ) ( not ( = ?auto_8123 ?auto_8122 ) ) ( TRUCK-AT ?auto_8130 ?auto_8125 ) ( SURFACE-AT ?auto_8121 ?auto_8125 ) ( CLEAR ?auto_8121 ) ( IS-CRATE ?auto_8126 ) ( not ( = ?auto_8121 ?auto_8126 ) ) ( not ( = ?auto_8118 ?auto_8121 ) ) ( not ( = ?auto_8119 ?auto_8121 ) ) ( not ( = ?auto_8123 ?auto_8121 ) ) ( not ( = ?auto_8122 ?auto_8121 ) ) ( AVAILABLE ?auto_8129 ) ( IN ?auto_8126 ?auto_8130 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8129 ?auto_8126 ?auto_8130 ?auto_8125 )
      ( MAKE-2CRATE ?auto_8126 ?auto_8118 ?auto_8119 )
      ( MAKE-1CRATE-VERIFY ?auto_8118 ?auto_8119 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8131 - SURFACE
      ?auto_8132 - SURFACE
      ?auto_8133 - SURFACE
    )
    :vars
    (
      ?auto_8139 - HOIST
      ?auto_8143 - PLACE
      ?auto_8140 - PLACE
      ?auto_8142 - HOIST
      ?auto_8135 - SURFACE
      ?auto_8136 - PLACE
      ?auto_8138 - HOIST
      ?auto_8137 - SURFACE
      ?auto_8141 - TRUCK
      ?auto_8134 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8139 ?auto_8143 ) ( IS-CRATE ?auto_8133 ) ( not ( = ?auto_8132 ?auto_8133 ) ) ( not ( = ?auto_8131 ?auto_8132 ) ) ( not ( = ?auto_8131 ?auto_8133 ) ) ( not ( = ?auto_8140 ?auto_8143 ) ) ( HOIST-AT ?auto_8142 ?auto_8140 ) ( not ( = ?auto_8139 ?auto_8142 ) ) ( AVAILABLE ?auto_8142 ) ( SURFACE-AT ?auto_8133 ?auto_8140 ) ( ON ?auto_8133 ?auto_8135 ) ( CLEAR ?auto_8133 ) ( not ( = ?auto_8132 ?auto_8135 ) ) ( not ( = ?auto_8133 ?auto_8135 ) ) ( not ( = ?auto_8131 ?auto_8135 ) ) ( IS-CRATE ?auto_8132 ) ( not ( = ?auto_8136 ?auto_8143 ) ) ( not ( = ?auto_8140 ?auto_8136 ) ) ( HOIST-AT ?auto_8138 ?auto_8136 ) ( not ( = ?auto_8139 ?auto_8138 ) ) ( not ( = ?auto_8142 ?auto_8138 ) ) ( AVAILABLE ?auto_8138 ) ( SURFACE-AT ?auto_8132 ?auto_8136 ) ( ON ?auto_8132 ?auto_8137 ) ( CLEAR ?auto_8132 ) ( not ( = ?auto_8132 ?auto_8137 ) ) ( not ( = ?auto_8133 ?auto_8137 ) ) ( not ( = ?auto_8131 ?auto_8137 ) ) ( not ( = ?auto_8135 ?auto_8137 ) ) ( TRUCK-AT ?auto_8141 ?auto_8143 ) ( SURFACE-AT ?auto_8134 ?auto_8143 ) ( CLEAR ?auto_8134 ) ( IS-CRATE ?auto_8131 ) ( not ( = ?auto_8134 ?auto_8131 ) ) ( not ( = ?auto_8132 ?auto_8134 ) ) ( not ( = ?auto_8133 ?auto_8134 ) ) ( not ( = ?auto_8135 ?auto_8134 ) ) ( not ( = ?auto_8137 ?auto_8134 ) ) ( AVAILABLE ?auto_8139 ) ( IN ?auto_8131 ?auto_8141 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8132 ?auto_8133 )
      ( MAKE-2CRATE-VERIFY ?auto_8131 ?auto_8132 ?auto_8133 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8144 - SURFACE
      ?auto_8145 - SURFACE
      ?auto_8146 - SURFACE
      ?auto_8147 - SURFACE
    )
    :vars
    (
      ?auto_8153 - HOIST
      ?auto_8154 - PLACE
      ?auto_8156 - PLACE
      ?auto_8149 - HOIST
      ?auto_8152 - SURFACE
      ?auto_8148 - PLACE
      ?auto_8155 - HOIST
      ?auto_8150 - SURFACE
      ?auto_8151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8153 ?auto_8154 ) ( IS-CRATE ?auto_8147 ) ( not ( = ?auto_8146 ?auto_8147 ) ) ( not ( = ?auto_8145 ?auto_8146 ) ) ( not ( = ?auto_8145 ?auto_8147 ) ) ( not ( = ?auto_8156 ?auto_8154 ) ) ( HOIST-AT ?auto_8149 ?auto_8156 ) ( not ( = ?auto_8153 ?auto_8149 ) ) ( AVAILABLE ?auto_8149 ) ( SURFACE-AT ?auto_8147 ?auto_8156 ) ( ON ?auto_8147 ?auto_8152 ) ( CLEAR ?auto_8147 ) ( not ( = ?auto_8146 ?auto_8152 ) ) ( not ( = ?auto_8147 ?auto_8152 ) ) ( not ( = ?auto_8145 ?auto_8152 ) ) ( IS-CRATE ?auto_8146 ) ( not ( = ?auto_8148 ?auto_8154 ) ) ( not ( = ?auto_8156 ?auto_8148 ) ) ( HOIST-AT ?auto_8155 ?auto_8148 ) ( not ( = ?auto_8153 ?auto_8155 ) ) ( not ( = ?auto_8149 ?auto_8155 ) ) ( AVAILABLE ?auto_8155 ) ( SURFACE-AT ?auto_8146 ?auto_8148 ) ( ON ?auto_8146 ?auto_8150 ) ( CLEAR ?auto_8146 ) ( not ( = ?auto_8146 ?auto_8150 ) ) ( not ( = ?auto_8147 ?auto_8150 ) ) ( not ( = ?auto_8145 ?auto_8150 ) ) ( not ( = ?auto_8152 ?auto_8150 ) ) ( TRUCK-AT ?auto_8151 ?auto_8154 ) ( SURFACE-AT ?auto_8144 ?auto_8154 ) ( CLEAR ?auto_8144 ) ( IS-CRATE ?auto_8145 ) ( not ( = ?auto_8144 ?auto_8145 ) ) ( not ( = ?auto_8146 ?auto_8144 ) ) ( not ( = ?auto_8147 ?auto_8144 ) ) ( not ( = ?auto_8152 ?auto_8144 ) ) ( not ( = ?auto_8150 ?auto_8144 ) ) ( AVAILABLE ?auto_8153 ) ( IN ?auto_8145 ?auto_8151 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8145 ?auto_8146 ?auto_8147 )
      ( MAKE-3CRATE-VERIFY ?auto_8144 ?auto_8145 ?auto_8146 ?auto_8147 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8157 - SURFACE
      ?auto_8158 - SURFACE
    )
    :vars
    (
      ?auto_8165 - HOIST
      ?auto_8166 - PLACE
      ?auto_8164 - SURFACE
      ?auto_8169 - PLACE
      ?auto_8160 - HOIST
      ?auto_8163 - SURFACE
      ?auto_8159 - PLACE
      ?auto_8167 - HOIST
      ?auto_8161 - SURFACE
      ?auto_8168 - SURFACE
      ?auto_8162 - TRUCK
      ?auto_8170 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8165 ?auto_8166 ) ( IS-CRATE ?auto_8158 ) ( not ( = ?auto_8157 ?auto_8158 ) ) ( not ( = ?auto_8164 ?auto_8157 ) ) ( not ( = ?auto_8164 ?auto_8158 ) ) ( not ( = ?auto_8169 ?auto_8166 ) ) ( HOIST-AT ?auto_8160 ?auto_8169 ) ( not ( = ?auto_8165 ?auto_8160 ) ) ( AVAILABLE ?auto_8160 ) ( SURFACE-AT ?auto_8158 ?auto_8169 ) ( ON ?auto_8158 ?auto_8163 ) ( CLEAR ?auto_8158 ) ( not ( = ?auto_8157 ?auto_8163 ) ) ( not ( = ?auto_8158 ?auto_8163 ) ) ( not ( = ?auto_8164 ?auto_8163 ) ) ( IS-CRATE ?auto_8157 ) ( not ( = ?auto_8159 ?auto_8166 ) ) ( not ( = ?auto_8169 ?auto_8159 ) ) ( HOIST-AT ?auto_8167 ?auto_8159 ) ( not ( = ?auto_8165 ?auto_8167 ) ) ( not ( = ?auto_8160 ?auto_8167 ) ) ( AVAILABLE ?auto_8167 ) ( SURFACE-AT ?auto_8157 ?auto_8159 ) ( ON ?auto_8157 ?auto_8161 ) ( CLEAR ?auto_8157 ) ( not ( = ?auto_8157 ?auto_8161 ) ) ( not ( = ?auto_8158 ?auto_8161 ) ) ( not ( = ?auto_8164 ?auto_8161 ) ) ( not ( = ?auto_8163 ?auto_8161 ) ) ( SURFACE-AT ?auto_8168 ?auto_8166 ) ( CLEAR ?auto_8168 ) ( IS-CRATE ?auto_8164 ) ( not ( = ?auto_8168 ?auto_8164 ) ) ( not ( = ?auto_8157 ?auto_8168 ) ) ( not ( = ?auto_8158 ?auto_8168 ) ) ( not ( = ?auto_8163 ?auto_8168 ) ) ( not ( = ?auto_8161 ?auto_8168 ) ) ( AVAILABLE ?auto_8165 ) ( IN ?auto_8164 ?auto_8162 ) ( TRUCK-AT ?auto_8162 ?auto_8170 ) ( not ( = ?auto_8170 ?auto_8166 ) ) ( not ( = ?auto_8169 ?auto_8170 ) ) ( not ( = ?auto_8159 ?auto_8170 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8162 ?auto_8170 ?auto_8166 )
      ( MAKE-2CRATE ?auto_8164 ?auto_8157 ?auto_8158 )
      ( MAKE-1CRATE-VERIFY ?auto_8157 ?auto_8158 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8171 - SURFACE
      ?auto_8172 - SURFACE
      ?auto_8173 - SURFACE
    )
    :vars
    (
      ?auto_8181 - HOIST
      ?auto_8180 - PLACE
      ?auto_8184 - PLACE
      ?auto_8174 - HOIST
      ?auto_8178 - SURFACE
      ?auto_8176 - PLACE
      ?auto_8177 - HOIST
      ?auto_8179 - SURFACE
      ?auto_8183 - SURFACE
      ?auto_8182 - TRUCK
      ?auto_8175 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8181 ?auto_8180 ) ( IS-CRATE ?auto_8173 ) ( not ( = ?auto_8172 ?auto_8173 ) ) ( not ( = ?auto_8171 ?auto_8172 ) ) ( not ( = ?auto_8171 ?auto_8173 ) ) ( not ( = ?auto_8184 ?auto_8180 ) ) ( HOIST-AT ?auto_8174 ?auto_8184 ) ( not ( = ?auto_8181 ?auto_8174 ) ) ( AVAILABLE ?auto_8174 ) ( SURFACE-AT ?auto_8173 ?auto_8184 ) ( ON ?auto_8173 ?auto_8178 ) ( CLEAR ?auto_8173 ) ( not ( = ?auto_8172 ?auto_8178 ) ) ( not ( = ?auto_8173 ?auto_8178 ) ) ( not ( = ?auto_8171 ?auto_8178 ) ) ( IS-CRATE ?auto_8172 ) ( not ( = ?auto_8176 ?auto_8180 ) ) ( not ( = ?auto_8184 ?auto_8176 ) ) ( HOIST-AT ?auto_8177 ?auto_8176 ) ( not ( = ?auto_8181 ?auto_8177 ) ) ( not ( = ?auto_8174 ?auto_8177 ) ) ( AVAILABLE ?auto_8177 ) ( SURFACE-AT ?auto_8172 ?auto_8176 ) ( ON ?auto_8172 ?auto_8179 ) ( CLEAR ?auto_8172 ) ( not ( = ?auto_8172 ?auto_8179 ) ) ( not ( = ?auto_8173 ?auto_8179 ) ) ( not ( = ?auto_8171 ?auto_8179 ) ) ( not ( = ?auto_8178 ?auto_8179 ) ) ( SURFACE-AT ?auto_8183 ?auto_8180 ) ( CLEAR ?auto_8183 ) ( IS-CRATE ?auto_8171 ) ( not ( = ?auto_8183 ?auto_8171 ) ) ( not ( = ?auto_8172 ?auto_8183 ) ) ( not ( = ?auto_8173 ?auto_8183 ) ) ( not ( = ?auto_8178 ?auto_8183 ) ) ( not ( = ?auto_8179 ?auto_8183 ) ) ( AVAILABLE ?auto_8181 ) ( IN ?auto_8171 ?auto_8182 ) ( TRUCK-AT ?auto_8182 ?auto_8175 ) ( not ( = ?auto_8175 ?auto_8180 ) ) ( not ( = ?auto_8184 ?auto_8175 ) ) ( not ( = ?auto_8176 ?auto_8175 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8172 ?auto_8173 )
      ( MAKE-2CRATE-VERIFY ?auto_8171 ?auto_8172 ?auto_8173 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8185 - SURFACE
      ?auto_8186 - SURFACE
      ?auto_8187 - SURFACE
      ?auto_8188 - SURFACE
    )
    :vars
    (
      ?auto_8192 - HOIST
      ?auto_8198 - PLACE
      ?auto_8193 - PLACE
      ?auto_8194 - HOIST
      ?auto_8191 - SURFACE
      ?auto_8190 - PLACE
      ?auto_8196 - HOIST
      ?auto_8195 - SURFACE
      ?auto_8197 - TRUCK
      ?auto_8189 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8192 ?auto_8198 ) ( IS-CRATE ?auto_8188 ) ( not ( = ?auto_8187 ?auto_8188 ) ) ( not ( = ?auto_8186 ?auto_8187 ) ) ( not ( = ?auto_8186 ?auto_8188 ) ) ( not ( = ?auto_8193 ?auto_8198 ) ) ( HOIST-AT ?auto_8194 ?auto_8193 ) ( not ( = ?auto_8192 ?auto_8194 ) ) ( AVAILABLE ?auto_8194 ) ( SURFACE-AT ?auto_8188 ?auto_8193 ) ( ON ?auto_8188 ?auto_8191 ) ( CLEAR ?auto_8188 ) ( not ( = ?auto_8187 ?auto_8191 ) ) ( not ( = ?auto_8188 ?auto_8191 ) ) ( not ( = ?auto_8186 ?auto_8191 ) ) ( IS-CRATE ?auto_8187 ) ( not ( = ?auto_8190 ?auto_8198 ) ) ( not ( = ?auto_8193 ?auto_8190 ) ) ( HOIST-AT ?auto_8196 ?auto_8190 ) ( not ( = ?auto_8192 ?auto_8196 ) ) ( not ( = ?auto_8194 ?auto_8196 ) ) ( AVAILABLE ?auto_8196 ) ( SURFACE-AT ?auto_8187 ?auto_8190 ) ( ON ?auto_8187 ?auto_8195 ) ( CLEAR ?auto_8187 ) ( not ( = ?auto_8187 ?auto_8195 ) ) ( not ( = ?auto_8188 ?auto_8195 ) ) ( not ( = ?auto_8186 ?auto_8195 ) ) ( not ( = ?auto_8191 ?auto_8195 ) ) ( SURFACE-AT ?auto_8185 ?auto_8198 ) ( CLEAR ?auto_8185 ) ( IS-CRATE ?auto_8186 ) ( not ( = ?auto_8185 ?auto_8186 ) ) ( not ( = ?auto_8187 ?auto_8185 ) ) ( not ( = ?auto_8188 ?auto_8185 ) ) ( not ( = ?auto_8191 ?auto_8185 ) ) ( not ( = ?auto_8195 ?auto_8185 ) ) ( AVAILABLE ?auto_8192 ) ( IN ?auto_8186 ?auto_8197 ) ( TRUCK-AT ?auto_8197 ?auto_8189 ) ( not ( = ?auto_8189 ?auto_8198 ) ) ( not ( = ?auto_8193 ?auto_8189 ) ) ( not ( = ?auto_8190 ?auto_8189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8186 ?auto_8187 ?auto_8188 )
      ( MAKE-3CRATE-VERIFY ?auto_8185 ?auto_8186 ?auto_8187 ?auto_8188 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8199 - SURFACE
      ?auto_8200 - SURFACE
    )
    :vars
    (
      ?auto_8204 - HOIST
      ?auto_8212 - PLACE
      ?auto_8210 - SURFACE
      ?auto_8206 - PLACE
      ?auto_8207 - HOIST
      ?auto_8203 - SURFACE
      ?auto_8202 - PLACE
      ?auto_8209 - HOIST
      ?auto_8208 - SURFACE
      ?auto_8205 - SURFACE
      ?auto_8211 - TRUCK
      ?auto_8201 - PLACE
      ?auto_8213 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8204 ?auto_8212 ) ( IS-CRATE ?auto_8200 ) ( not ( = ?auto_8199 ?auto_8200 ) ) ( not ( = ?auto_8210 ?auto_8199 ) ) ( not ( = ?auto_8210 ?auto_8200 ) ) ( not ( = ?auto_8206 ?auto_8212 ) ) ( HOIST-AT ?auto_8207 ?auto_8206 ) ( not ( = ?auto_8204 ?auto_8207 ) ) ( AVAILABLE ?auto_8207 ) ( SURFACE-AT ?auto_8200 ?auto_8206 ) ( ON ?auto_8200 ?auto_8203 ) ( CLEAR ?auto_8200 ) ( not ( = ?auto_8199 ?auto_8203 ) ) ( not ( = ?auto_8200 ?auto_8203 ) ) ( not ( = ?auto_8210 ?auto_8203 ) ) ( IS-CRATE ?auto_8199 ) ( not ( = ?auto_8202 ?auto_8212 ) ) ( not ( = ?auto_8206 ?auto_8202 ) ) ( HOIST-AT ?auto_8209 ?auto_8202 ) ( not ( = ?auto_8204 ?auto_8209 ) ) ( not ( = ?auto_8207 ?auto_8209 ) ) ( AVAILABLE ?auto_8209 ) ( SURFACE-AT ?auto_8199 ?auto_8202 ) ( ON ?auto_8199 ?auto_8208 ) ( CLEAR ?auto_8199 ) ( not ( = ?auto_8199 ?auto_8208 ) ) ( not ( = ?auto_8200 ?auto_8208 ) ) ( not ( = ?auto_8210 ?auto_8208 ) ) ( not ( = ?auto_8203 ?auto_8208 ) ) ( SURFACE-AT ?auto_8205 ?auto_8212 ) ( CLEAR ?auto_8205 ) ( IS-CRATE ?auto_8210 ) ( not ( = ?auto_8205 ?auto_8210 ) ) ( not ( = ?auto_8199 ?auto_8205 ) ) ( not ( = ?auto_8200 ?auto_8205 ) ) ( not ( = ?auto_8203 ?auto_8205 ) ) ( not ( = ?auto_8208 ?auto_8205 ) ) ( AVAILABLE ?auto_8204 ) ( TRUCK-AT ?auto_8211 ?auto_8201 ) ( not ( = ?auto_8201 ?auto_8212 ) ) ( not ( = ?auto_8206 ?auto_8201 ) ) ( not ( = ?auto_8202 ?auto_8201 ) ) ( HOIST-AT ?auto_8213 ?auto_8201 ) ( LIFTING ?auto_8213 ?auto_8210 ) ( not ( = ?auto_8204 ?auto_8213 ) ) ( not ( = ?auto_8207 ?auto_8213 ) ) ( not ( = ?auto_8209 ?auto_8213 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8213 ?auto_8210 ?auto_8211 ?auto_8201 )
      ( MAKE-2CRATE ?auto_8210 ?auto_8199 ?auto_8200 )
      ( MAKE-1CRATE-VERIFY ?auto_8199 ?auto_8200 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8214 - SURFACE
      ?auto_8215 - SURFACE
      ?auto_8216 - SURFACE
    )
    :vars
    (
      ?auto_8218 - HOIST
      ?auto_8228 - PLACE
      ?auto_8223 - PLACE
      ?auto_8227 - HOIST
      ?auto_8221 - SURFACE
      ?auto_8226 - PLACE
      ?auto_8224 - HOIST
      ?auto_8225 - SURFACE
      ?auto_8222 - SURFACE
      ?auto_8217 - TRUCK
      ?auto_8220 - PLACE
      ?auto_8219 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8218 ?auto_8228 ) ( IS-CRATE ?auto_8216 ) ( not ( = ?auto_8215 ?auto_8216 ) ) ( not ( = ?auto_8214 ?auto_8215 ) ) ( not ( = ?auto_8214 ?auto_8216 ) ) ( not ( = ?auto_8223 ?auto_8228 ) ) ( HOIST-AT ?auto_8227 ?auto_8223 ) ( not ( = ?auto_8218 ?auto_8227 ) ) ( AVAILABLE ?auto_8227 ) ( SURFACE-AT ?auto_8216 ?auto_8223 ) ( ON ?auto_8216 ?auto_8221 ) ( CLEAR ?auto_8216 ) ( not ( = ?auto_8215 ?auto_8221 ) ) ( not ( = ?auto_8216 ?auto_8221 ) ) ( not ( = ?auto_8214 ?auto_8221 ) ) ( IS-CRATE ?auto_8215 ) ( not ( = ?auto_8226 ?auto_8228 ) ) ( not ( = ?auto_8223 ?auto_8226 ) ) ( HOIST-AT ?auto_8224 ?auto_8226 ) ( not ( = ?auto_8218 ?auto_8224 ) ) ( not ( = ?auto_8227 ?auto_8224 ) ) ( AVAILABLE ?auto_8224 ) ( SURFACE-AT ?auto_8215 ?auto_8226 ) ( ON ?auto_8215 ?auto_8225 ) ( CLEAR ?auto_8215 ) ( not ( = ?auto_8215 ?auto_8225 ) ) ( not ( = ?auto_8216 ?auto_8225 ) ) ( not ( = ?auto_8214 ?auto_8225 ) ) ( not ( = ?auto_8221 ?auto_8225 ) ) ( SURFACE-AT ?auto_8222 ?auto_8228 ) ( CLEAR ?auto_8222 ) ( IS-CRATE ?auto_8214 ) ( not ( = ?auto_8222 ?auto_8214 ) ) ( not ( = ?auto_8215 ?auto_8222 ) ) ( not ( = ?auto_8216 ?auto_8222 ) ) ( not ( = ?auto_8221 ?auto_8222 ) ) ( not ( = ?auto_8225 ?auto_8222 ) ) ( AVAILABLE ?auto_8218 ) ( TRUCK-AT ?auto_8217 ?auto_8220 ) ( not ( = ?auto_8220 ?auto_8228 ) ) ( not ( = ?auto_8223 ?auto_8220 ) ) ( not ( = ?auto_8226 ?auto_8220 ) ) ( HOIST-AT ?auto_8219 ?auto_8220 ) ( LIFTING ?auto_8219 ?auto_8214 ) ( not ( = ?auto_8218 ?auto_8219 ) ) ( not ( = ?auto_8227 ?auto_8219 ) ) ( not ( = ?auto_8224 ?auto_8219 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8215 ?auto_8216 )
      ( MAKE-2CRATE-VERIFY ?auto_8214 ?auto_8215 ?auto_8216 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8229 - SURFACE
      ?auto_8230 - SURFACE
      ?auto_8231 - SURFACE
      ?auto_8232 - SURFACE
    )
    :vars
    (
      ?auto_8235 - HOIST
      ?auto_8242 - PLACE
      ?auto_8240 - PLACE
      ?auto_8238 - HOIST
      ?auto_8243 - SURFACE
      ?auto_8239 - PLACE
      ?auto_8233 - HOIST
      ?auto_8241 - SURFACE
      ?auto_8237 - TRUCK
      ?auto_8234 - PLACE
      ?auto_8236 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8235 ?auto_8242 ) ( IS-CRATE ?auto_8232 ) ( not ( = ?auto_8231 ?auto_8232 ) ) ( not ( = ?auto_8230 ?auto_8231 ) ) ( not ( = ?auto_8230 ?auto_8232 ) ) ( not ( = ?auto_8240 ?auto_8242 ) ) ( HOIST-AT ?auto_8238 ?auto_8240 ) ( not ( = ?auto_8235 ?auto_8238 ) ) ( AVAILABLE ?auto_8238 ) ( SURFACE-AT ?auto_8232 ?auto_8240 ) ( ON ?auto_8232 ?auto_8243 ) ( CLEAR ?auto_8232 ) ( not ( = ?auto_8231 ?auto_8243 ) ) ( not ( = ?auto_8232 ?auto_8243 ) ) ( not ( = ?auto_8230 ?auto_8243 ) ) ( IS-CRATE ?auto_8231 ) ( not ( = ?auto_8239 ?auto_8242 ) ) ( not ( = ?auto_8240 ?auto_8239 ) ) ( HOIST-AT ?auto_8233 ?auto_8239 ) ( not ( = ?auto_8235 ?auto_8233 ) ) ( not ( = ?auto_8238 ?auto_8233 ) ) ( AVAILABLE ?auto_8233 ) ( SURFACE-AT ?auto_8231 ?auto_8239 ) ( ON ?auto_8231 ?auto_8241 ) ( CLEAR ?auto_8231 ) ( not ( = ?auto_8231 ?auto_8241 ) ) ( not ( = ?auto_8232 ?auto_8241 ) ) ( not ( = ?auto_8230 ?auto_8241 ) ) ( not ( = ?auto_8243 ?auto_8241 ) ) ( SURFACE-AT ?auto_8229 ?auto_8242 ) ( CLEAR ?auto_8229 ) ( IS-CRATE ?auto_8230 ) ( not ( = ?auto_8229 ?auto_8230 ) ) ( not ( = ?auto_8231 ?auto_8229 ) ) ( not ( = ?auto_8232 ?auto_8229 ) ) ( not ( = ?auto_8243 ?auto_8229 ) ) ( not ( = ?auto_8241 ?auto_8229 ) ) ( AVAILABLE ?auto_8235 ) ( TRUCK-AT ?auto_8237 ?auto_8234 ) ( not ( = ?auto_8234 ?auto_8242 ) ) ( not ( = ?auto_8240 ?auto_8234 ) ) ( not ( = ?auto_8239 ?auto_8234 ) ) ( HOIST-AT ?auto_8236 ?auto_8234 ) ( LIFTING ?auto_8236 ?auto_8230 ) ( not ( = ?auto_8235 ?auto_8236 ) ) ( not ( = ?auto_8238 ?auto_8236 ) ) ( not ( = ?auto_8233 ?auto_8236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8230 ?auto_8231 ?auto_8232 )
      ( MAKE-3CRATE-VERIFY ?auto_8229 ?auto_8230 ?auto_8231 ?auto_8232 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8244 - SURFACE
      ?auto_8245 - SURFACE
    )
    :vars
    (
      ?auto_8248 - HOIST
      ?auto_8257 - PLACE
      ?auto_8255 - SURFACE
      ?auto_8253 - PLACE
      ?auto_8251 - HOIST
      ?auto_8258 - SURFACE
      ?auto_8252 - PLACE
      ?auto_8246 - HOIST
      ?auto_8254 - SURFACE
      ?auto_8256 - SURFACE
      ?auto_8250 - TRUCK
      ?auto_8247 - PLACE
      ?auto_8249 - HOIST
      ?auto_8259 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8248 ?auto_8257 ) ( IS-CRATE ?auto_8245 ) ( not ( = ?auto_8244 ?auto_8245 ) ) ( not ( = ?auto_8255 ?auto_8244 ) ) ( not ( = ?auto_8255 ?auto_8245 ) ) ( not ( = ?auto_8253 ?auto_8257 ) ) ( HOIST-AT ?auto_8251 ?auto_8253 ) ( not ( = ?auto_8248 ?auto_8251 ) ) ( AVAILABLE ?auto_8251 ) ( SURFACE-AT ?auto_8245 ?auto_8253 ) ( ON ?auto_8245 ?auto_8258 ) ( CLEAR ?auto_8245 ) ( not ( = ?auto_8244 ?auto_8258 ) ) ( not ( = ?auto_8245 ?auto_8258 ) ) ( not ( = ?auto_8255 ?auto_8258 ) ) ( IS-CRATE ?auto_8244 ) ( not ( = ?auto_8252 ?auto_8257 ) ) ( not ( = ?auto_8253 ?auto_8252 ) ) ( HOIST-AT ?auto_8246 ?auto_8252 ) ( not ( = ?auto_8248 ?auto_8246 ) ) ( not ( = ?auto_8251 ?auto_8246 ) ) ( AVAILABLE ?auto_8246 ) ( SURFACE-AT ?auto_8244 ?auto_8252 ) ( ON ?auto_8244 ?auto_8254 ) ( CLEAR ?auto_8244 ) ( not ( = ?auto_8244 ?auto_8254 ) ) ( not ( = ?auto_8245 ?auto_8254 ) ) ( not ( = ?auto_8255 ?auto_8254 ) ) ( not ( = ?auto_8258 ?auto_8254 ) ) ( SURFACE-AT ?auto_8256 ?auto_8257 ) ( CLEAR ?auto_8256 ) ( IS-CRATE ?auto_8255 ) ( not ( = ?auto_8256 ?auto_8255 ) ) ( not ( = ?auto_8244 ?auto_8256 ) ) ( not ( = ?auto_8245 ?auto_8256 ) ) ( not ( = ?auto_8258 ?auto_8256 ) ) ( not ( = ?auto_8254 ?auto_8256 ) ) ( AVAILABLE ?auto_8248 ) ( TRUCK-AT ?auto_8250 ?auto_8247 ) ( not ( = ?auto_8247 ?auto_8257 ) ) ( not ( = ?auto_8253 ?auto_8247 ) ) ( not ( = ?auto_8252 ?auto_8247 ) ) ( HOIST-AT ?auto_8249 ?auto_8247 ) ( not ( = ?auto_8248 ?auto_8249 ) ) ( not ( = ?auto_8251 ?auto_8249 ) ) ( not ( = ?auto_8246 ?auto_8249 ) ) ( AVAILABLE ?auto_8249 ) ( SURFACE-AT ?auto_8255 ?auto_8247 ) ( ON ?auto_8255 ?auto_8259 ) ( CLEAR ?auto_8255 ) ( not ( = ?auto_8244 ?auto_8259 ) ) ( not ( = ?auto_8245 ?auto_8259 ) ) ( not ( = ?auto_8255 ?auto_8259 ) ) ( not ( = ?auto_8258 ?auto_8259 ) ) ( not ( = ?auto_8254 ?auto_8259 ) ) ( not ( = ?auto_8256 ?auto_8259 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8249 ?auto_8255 ?auto_8259 ?auto_8247 )
      ( MAKE-2CRATE ?auto_8255 ?auto_8244 ?auto_8245 )
      ( MAKE-1CRATE-VERIFY ?auto_8244 ?auto_8245 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8260 - SURFACE
      ?auto_8261 - SURFACE
      ?auto_8262 - SURFACE
    )
    :vars
    (
      ?auto_8274 - HOIST
      ?auto_8269 - PLACE
      ?auto_8263 - PLACE
      ?auto_8273 - HOIST
      ?auto_8264 - SURFACE
      ?auto_8272 - PLACE
      ?auto_8265 - HOIST
      ?auto_8268 - SURFACE
      ?auto_8267 - SURFACE
      ?auto_8275 - TRUCK
      ?auto_8271 - PLACE
      ?auto_8270 - HOIST
      ?auto_8266 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8274 ?auto_8269 ) ( IS-CRATE ?auto_8262 ) ( not ( = ?auto_8261 ?auto_8262 ) ) ( not ( = ?auto_8260 ?auto_8261 ) ) ( not ( = ?auto_8260 ?auto_8262 ) ) ( not ( = ?auto_8263 ?auto_8269 ) ) ( HOIST-AT ?auto_8273 ?auto_8263 ) ( not ( = ?auto_8274 ?auto_8273 ) ) ( AVAILABLE ?auto_8273 ) ( SURFACE-AT ?auto_8262 ?auto_8263 ) ( ON ?auto_8262 ?auto_8264 ) ( CLEAR ?auto_8262 ) ( not ( = ?auto_8261 ?auto_8264 ) ) ( not ( = ?auto_8262 ?auto_8264 ) ) ( not ( = ?auto_8260 ?auto_8264 ) ) ( IS-CRATE ?auto_8261 ) ( not ( = ?auto_8272 ?auto_8269 ) ) ( not ( = ?auto_8263 ?auto_8272 ) ) ( HOIST-AT ?auto_8265 ?auto_8272 ) ( not ( = ?auto_8274 ?auto_8265 ) ) ( not ( = ?auto_8273 ?auto_8265 ) ) ( AVAILABLE ?auto_8265 ) ( SURFACE-AT ?auto_8261 ?auto_8272 ) ( ON ?auto_8261 ?auto_8268 ) ( CLEAR ?auto_8261 ) ( not ( = ?auto_8261 ?auto_8268 ) ) ( not ( = ?auto_8262 ?auto_8268 ) ) ( not ( = ?auto_8260 ?auto_8268 ) ) ( not ( = ?auto_8264 ?auto_8268 ) ) ( SURFACE-AT ?auto_8267 ?auto_8269 ) ( CLEAR ?auto_8267 ) ( IS-CRATE ?auto_8260 ) ( not ( = ?auto_8267 ?auto_8260 ) ) ( not ( = ?auto_8261 ?auto_8267 ) ) ( not ( = ?auto_8262 ?auto_8267 ) ) ( not ( = ?auto_8264 ?auto_8267 ) ) ( not ( = ?auto_8268 ?auto_8267 ) ) ( AVAILABLE ?auto_8274 ) ( TRUCK-AT ?auto_8275 ?auto_8271 ) ( not ( = ?auto_8271 ?auto_8269 ) ) ( not ( = ?auto_8263 ?auto_8271 ) ) ( not ( = ?auto_8272 ?auto_8271 ) ) ( HOIST-AT ?auto_8270 ?auto_8271 ) ( not ( = ?auto_8274 ?auto_8270 ) ) ( not ( = ?auto_8273 ?auto_8270 ) ) ( not ( = ?auto_8265 ?auto_8270 ) ) ( AVAILABLE ?auto_8270 ) ( SURFACE-AT ?auto_8260 ?auto_8271 ) ( ON ?auto_8260 ?auto_8266 ) ( CLEAR ?auto_8260 ) ( not ( = ?auto_8261 ?auto_8266 ) ) ( not ( = ?auto_8262 ?auto_8266 ) ) ( not ( = ?auto_8260 ?auto_8266 ) ) ( not ( = ?auto_8264 ?auto_8266 ) ) ( not ( = ?auto_8268 ?auto_8266 ) ) ( not ( = ?auto_8267 ?auto_8266 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8261 ?auto_8262 )
      ( MAKE-2CRATE-VERIFY ?auto_8260 ?auto_8261 ?auto_8262 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8276 - SURFACE
      ?auto_8277 - SURFACE
      ?auto_8278 - SURFACE
      ?auto_8279 - SURFACE
    )
    :vars
    (
      ?auto_8291 - HOIST
      ?auto_8284 - PLACE
      ?auto_8281 - PLACE
      ?auto_8289 - HOIST
      ?auto_8280 - SURFACE
      ?auto_8290 - PLACE
      ?auto_8286 - HOIST
      ?auto_8283 - SURFACE
      ?auto_8287 - TRUCK
      ?auto_8285 - PLACE
      ?auto_8288 - HOIST
      ?auto_8282 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8291 ?auto_8284 ) ( IS-CRATE ?auto_8279 ) ( not ( = ?auto_8278 ?auto_8279 ) ) ( not ( = ?auto_8277 ?auto_8278 ) ) ( not ( = ?auto_8277 ?auto_8279 ) ) ( not ( = ?auto_8281 ?auto_8284 ) ) ( HOIST-AT ?auto_8289 ?auto_8281 ) ( not ( = ?auto_8291 ?auto_8289 ) ) ( AVAILABLE ?auto_8289 ) ( SURFACE-AT ?auto_8279 ?auto_8281 ) ( ON ?auto_8279 ?auto_8280 ) ( CLEAR ?auto_8279 ) ( not ( = ?auto_8278 ?auto_8280 ) ) ( not ( = ?auto_8279 ?auto_8280 ) ) ( not ( = ?auto_8277 ?auto_8280 ) ) ( IS-CRATE ?auto_8278 ) ( not ( = ?auto_8290 ?auto_8284 ) ) ( not ( = ?auto_8281 ?auto_8290 ) ) ( HOIST-AT ?auto_8286 ?auto_8290 ) ( not ( = ?auto_8291 ?auto_8286 ) ) ( not ( = ?auto_8289 ?auto_8286 ) ) ( AVAILABLE ?auto_8286 ) ( SURFACE-AT ?auto_8278 ?auto_8290 ) ( ON ?auto_8278 ?auto_8283 ) ( CLEAR ?auto_8278 ) ( not ( = ?auto_8278 ?auto_8283 ) ) ( not ( = ?auto_8279 ?auto_8283 ) ) ( not ( = ?auto_8277 ?auto_8283 ) ) ( not ( = ?auto_8280 ?auto_8283 ) ) ( SURFACE-AT ?auto_8276 ?auto_8284 ) ( CLEAR ?auto_8276 ) ( IS-CRATE ?auto_8277 ) ( not ( = ?auto_8276 ?auto_8277 ) ) ( not ( = ?auto_8278 ?auto_8276 ) ) ( not ( = ?auto_8279 ?auto_8276 ) ) ( not ( = ?auto_8280 ?auto_8276 ) ) ( not ( = ?auto_8283 ?auto_8276 ) ) ( AVAILABLE ?auto_8291 ) ( TRUCK-AT ?auto_8287 ?auto_8285 ) ( not ( = ?auto_8285 ?auto_8284 ) ) ( not ( = ?auto_8281 ?auto_8285 ) ) ( not ( = ?auto_8290 ?auto_8285 ) ) ( HOIST-AT ?auto_8288 ?auto_8285 ) ( not ( = ?auto_8291 ?auto_8288 ) ) ( not ( = ?auto_8289 ?auto_8288 ) ) ( not ( = ?auto_8286 ?auto_8288 ) ) ( AVAILABLE ?auto_8288 ) ( SURFACE-AT ?auto_8277 ?auto_8285 ) ( ON ?auto_8277 ?auto_8282 ) ( CLEAR ?auto_8277 ) ( not ( = ?auto_8278 ?auto_8282 ) ) ( not ( = ?auto_8279 ?auto_8282 ) ) ( not ( = ?auto_8277 ?auto_8282 ) ) ( not ( = ?auto_8280 ?auto_8282 ) ) ( not ( = ?auto_8283 ?auto_8282 ) ) ( not ( = ?auto_8276 ?auto_8282 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8277 ?auto_8278 ?auto_8279 )
      ( MAKE-3CRATE-VERIFY ?auto_8276 ?auto_8277 ?auto_8278 ?auto_8279 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8292 - SURFACE
      ?auto_8293 - SURFACE
    )
    :vars
    (
      ?auto_8307 - HOIST
      ?auto_8300 - PLACE
      ?auto_8294 - SURFACE
      ?auto_8297 - PLACE
      ?auto_8305 - HOIST
      ?auto_8296 - SURFACE
      ?auto_8306 - PLACE
      ?auto_8302 - HOIST
      ?auto_8299 - SURFACE
      ?auto_8295 - SURFACE
      ?auto_8301 - PLACE
      ?auto_8304 - HOIST
      ?auto_8298 - SURFACE
      ?auto_8303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8307 ?auto_8300 ) ( IS-CRATE ?auto_8293 ) ( not ( = ?auto_8292 ?auto_8293 ) ) ( not ( = ?auto_8294 ?auto_8292 ) ) ( not ( = ?auto_8294 ?auto_8293 ) ) ( not ( = ?auto_8297 ?auto_8300 ) ) ( HOIST-AT ?auto_8305 ?auto_8297 ) ( not ( = ?auto_8307 ?auto_8305 ) ) ( AVAILABLE ?auto_8305 ) ( SURFACE-AT ?auto_8293 ?auto_8297 ) ( ON ?auto_8293 ?auto_8296 ) ( CLEAR ?auto_8293 ) ( not ( = ?auto_8292 ?auto_8296 ) ) ( not ( = ?auto_8293 ?auto_8296 ) ) ( not ( = ?auto_8294 ?auto_8296 ) ) ( IS-CRATE ?auto_8292 ) ( not ( = ?auto_8306 ?auto_8300 ) ) ( not ( = ?auto_8297 ?auto_8306 ) ) ( HOIST-AT ?auto_8302 ?auto_8306 ) ( not ( = ?auto_8307 ?auto_8302 ) ) ( not ( = ?auto_8305 ?auto_8302 ) ) ( AVAILABLE ?auto_8302 ) ( SURFACE-AT ?auto_8292 ?auto_8306 ) ( ON ?auto_8292 ?auto_8299 ) ( CLEAR ?auto_8292 ) ( not ( = ?auto_8292 ?auto_8299 ) ) ( not ( = ?auto_8293 ?auto_8299 ) ) ( not ( = ?auto_8294 ?auto_8299 ) ) ( not ( = ?auto_8296 ?auto_8299 ) ) ( SURFACE-AT ?auto_8295 ?auto_8300 ) ( CLEAR ?auto_8295 ) ( IS-CRATE ?auto_8294 ) ( not ( = ?auto_8295 ?auto_8294 ) ) ( not ( = ?auto_8292 ?auto_8295 ) ) ( not ( = ?auto_8293 ?auto_8295 ) ) ( not ( = ?auto_8296 ?auto_8295 ) ) ( not ( = ?auto_8299 ?auto_8295 ) ) ( AVAILABLE ?auto_8307 ) ( not ( = ?auto_8301 ?auto_8300 ) ) ( not ( = ?auto_8297 ?auto_8301 ) ) ( not ( = ?auto_8306 ?auto_8301 ) ) ( HOIST-AT ?auto_8304 ?auto_8301 ) ( not ( = ?auto_8307 ?auto_8304 ) ) ( not ( = ?auto_8305 ?auto_8304 ) ) ( not ( = ?auto_8302 ?auto_8304 ) ) ( AVAILABLE ?auto_8304 ) ( SURFACE-AT ?auto_8294 ?auto_8301 ) ( ON ?auto_8294 ?auto_8298 ) ( CLEAR ?auto_8294 ) ( not ( = ?auto_8292 ?auto_8298 ) ) ( not ( = ?auto_8293 ?auto_8298 ) ) ( not ( = ?auto_8294 ?auto_8298 ) ) ( not ( = ?auto_8296 ?auto_8298 ) ) ( not ( = ?auto_8299 ?auto_8298 ) ) ( not ( = ?auto_8295 ?auto_8298 ) ) ( TRUCK-AT ?auto_8303 ?auto_8300 ) )
    :subtasks
    ( ( !DRIVE ?auto_8303 ?auto_8300 ?auto_8301 )
      ( MAKE-2CRATE ?auto_8294 ?auto_8292 ?auto_8293 )
      ( MAKE-1CRATE-VERIFY ?auto_8292 ?auto_8293 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8308 - SURFACE
      ?auto_8309 - SURFACE
      ?auto_8310 - SURFACE
    )
    :vars
    (
      ?auto_8322 - HOIST
      ?auto_8313 - PLACE
      ?auto_8314 - PLACE
      ?auto_8323 - HOIST
      ?auto_8311 - SURFACE
      ?auto_8319 - PLACE
      ?auto_8316 - HOIST
      ?auto_8315 - SURFACE
      ?auto_8320 - SURFACE
      ?auto_8312 - PLACE
      ?auto_8318 - HOIST
      ?auto_8321 - SURFACE
      ?auto_8317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8322 ?auto_8313 ) ( IS-CRATE ?auto_8310 ) ( not ( = ?auto_8309 ?auto_8310 ) ) ( not ( = ?auto_8308 ?auto_8309 ) ) ( not ( = ?auto_8308 ?auto_8310 ) ) ( not ( = ?auto_8314 ?auto_8313 ) ) ( HOIST-AT ?auto_8323 ?auto_8314 ) ( not ( = ?auto_8322 ?auto_8323 ) ) ( AVAILABLE ?auto_8323 ) ( SURFACE-AT ?auto_8310 ?auto_8314 ) ( ON ?auto_8310 ?auto_8311 ) ( CLEAR ?auto_8310 ) ( not ( = ?auto_8309 ?auto_8311 ) ) ( not ( = ?auto_8310 ?auto_8311 ) ) ( not ( = ?auto_8308 ?auto_8311 ) ) ( IS-CRATE ?auto_8309 ) ( not ( = ?auto_8319 ?auto_8313 ) ) ( not ( = ?auto_8314 ?auto_8319 ) ) ( HOIST-AT ?auto_8316 ?auto_8319 ) ( not ( = ?auto_8322 ?auto_8316 ) ) ( not ( = ?auto_8323 ?auto_8316 ) ) ( AVAILABLE ?auto_8316 ) ( SURFACE-AT ?auto_8309 ?auto_8319 ) ( ON ?auto_8309 ?auto_8315 ) ( CLEAR ?auto_8309 ) ( not ( = ?auto_8309 ?auto_8315 ) ) ( not ( = ?auto_8310 ?auto_8315 ) ) ( not ( = ?auto_8308 ?auto_8315 ) ) ( not ( = ?auto_8311 ?auto_8315 ) ) ( SURFACE-AT ?auto_8320 ?auto_8313 ) ( CLEAR ?auto_8320 ) ( IS-CRATE ?auto_8308 ) ( not ( = ?auto_8320 ?auto_8308 ) ) ( not ( = ?auto_8309 ?auto_8320 ) ) ( not ( = ?auto_8310 ?auto_8320 ) ) ( not ( = ?auto_8311 ?auto_8320 ) ) ( not ( = ?auto_8315 ?auto_8320 ) ) ( AVAILABLE ?auto_8322 ) ( not ( = ?auto_8312 ?auto_8313 ) ) ( not ( = ?auto_8314 ?auto_8312 ) ) ( not ( = ?auto_8319 ?auto_8312 ) ) ( HOIST-AT ?auto_8318 ?auto_8312 ) ( not ( = ?auto_8322 ?auto_8318 ) ) ( not ( = ?auto_8323 ?auto_8318 ) ) ( not ( = ?auto_8316 ?auto_8318 ) ) ( AVAILABLE ?auto_8318 ) ( SURFACE-AT ?auto_8308 ?auto_8312 ) ( ON ?auto_8308 ?auto_8321 ) ( CLEAR ?auto_8308 ) ( not ( = ?auto_8309 ?auto_8321 ) ) ( not ( = ?auto_8310 ?auto_8321 ) ) ( not ( = ?auto_8308 ?auto_8321 ) ) ( not ( = ?auto_8311 ?auto_8321 ) ) ( not ( = ?auto_8315 ?auto_8321 ) ) ( not ( = ?auto_8320 ?auto_8321 ) ) ( TRUCK-AT ?auto_8317 ?auto_8313 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8309 ?auto_8310 )
      ( MAKE-2CRATE-VERIFY ?auto_8308 ?auto_8309 ?auto_8310 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8324 - SURFACE
      ?auto_8325 - SURFACE
      ?auto_8326 - SURFACE
      ?auto_8327 - SURFACE
    )
    :vars
    (
      ?auto_8329 - HOIST
      ?auto_8336 - PLACE
      ?auto_8331 - PLACE
      ?auto_8328 - HOIST
      ?auto_8332 - SURFACE
      ?auto_8337 - PLACE
      ?auto_8339 - HOIST
      ?auto_8330 - SURFACE
      ?auto_8334 - PLACE
      ?auto_8335 - HOIST
      ?auto_8338 - SURFACE
      ?auto_8333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8329 ?auto_8336 ) ( IS-CRATE ?auto_8327 ) ( not ( = ?auto_8326 ?auto_8327 ) ) ( not ( = ?auto_8325 ?auto_8326 ) ) ( not ( = ?auto_8325 ?auto_8327 ) ) ( not ( = ?auto_8331 ?auto_8336 ) ) ( HOIST-AT ?auto_8328 ?auto_8331 ) ( not ( = ?auto_8329 ?auto_8328 ) ) ( AVAILABLE ?auto_8328 ) ( SURFACE-AT ?auto_8327 ?auto_8331 ) ( ON ?auto_8327 ?auto_8332 ) ( CLEAR ?auto_8327 ) ( not ( = ?auto_8326 ?auto_8332 ) ) ( not ( = ?auto_8327 ?auto_8332 ) ) ( not ( = ?auto_8325 ?auto_8332 ) ) ( IS-CRATE ?auto_8326 ) ( not ( = ?auto_8337 ?auto_8336 ) ) ( not ( = ?auto_8331 ?auto_8337 ) ) ( HOIST-AT ?auto_8339 ?auto_8337 ) ( not ( = ?auto_8329 ?auto_8339 ) ) ( not ( = ?auto_8328 ?auto_8339 ) ) ( AVAILABLE ?auto_8339 ) ( SURFACE-AT ?auto_8326 ?auto_8337 ) ( ON ?auto_8326 ?auto_8330 ) ( CLEAR ?auto_8326 ) ( not ( = ?auto_8326 ?auto_8330 ) ) ( not ( = ?auto_8327 ?auto_8330 ) ) ( not ( = ?auto_8325 ?auto_8330 ) ) ( not ( = ?auto_8332 ?auto_8330 ) ) ( SURFACE-AT ?auto_8324 ?auto_8336 ) ( CLEAR ?auto_8324 ) ( IS-CRATE ?auto_8325 ) ( not ( = ?auto_8324 ?auto_8325 ) ) ( not ( = ?auto_8326 ?auto_8324 ) ) ( not ( = ?auto_8327 ?auto_8324 ) ) ( not ( = ?auto_8332 ?auto_8324 ) ) ( not ( = ?auto_8330 ?auto_8324 ) ) ( AVAILABLE ?auto_8329 ) ( not ( = ?auto_8334 ?auto_8336 ) ) ( not ( = ?auto_8331 ?auto_8334 ) ) ( not ( = ?auto_8337 ?auto_8334 ) ) ( HOIST-AT ?auto_8335 ?auto_8334 ) ( not ( = ?auto_8329 ?auto_8335 ) ) ( not ( = ?auto_8328 ?auto_8335 ) ) ( not ( = ?auto_8339 ?auto_8335 ) ) ( AVAILABLE ?auto_8335 ) ( SURFACE-AT ?auto_8325 ?auto_8334 ) ( ON ?auto_8325 ?auto_8338 ) ( CLEAR ?auto_8325 ) ( not ( = ?auto_8326 ?auto_8338 ) ) ( not ( = ?auto_8327 ?auto_8338 ) ) ( not ( = ?auto_8325 ?auto_8338 ) ) ( not ( = ?auto_8332 ?auto_8338 ) ) ( not ( = ?auto_8330 ?auto_8338 ) ) ( not ( = ?auto_8324 ?auto_8338 ) ) ( TRUCK-AT ?auto_8333 ?auto_8336 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8325 ?auto_8326 ?auto_8327 )
      ( MAKE-3CRATE-VERIFY ?auto_8324 ?auto_8325 ?auto_8326 ?auto_8327 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8354 - SURFACE
      ?auto_8355 - SURFACE
    )
    :vars
    (
      ?auto_8356 - HOIST
      ?auto_8357 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8356 ?auto_8357 ) ( SURFACE-AT ?auto_8354 ?auto_8357 ) ( CLEAR ?auto_8354 ) ( LIFTING ?auto_8356 ?auto_8355 ) ( IS-CRATE ?auto_8355 ) ( not ( = ?auto_8354 ?auto_8355 ) ) )
    :subtasks
    ( ( !DROP ?auto_8356 ?auto_8355 ?auto_8354 ?auto_8357 )
      ( MAKE-1CRATE-VERIFY ?auto_8354 ?auto_8355 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8358 - SURFACE
      ?auto_8359 - SURFACE
      ?auto_8360 - SURFACE
    )
    :vars
    (
      ?auto_8361 - HOIST
      ?auto_8362 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8361 ?auto_8362 ) ( SURFACE-AT ?auto_8359 ?auto_8362 ) ( CLEAR ?auto_8359 ) ( LIFTING ?auto_8361 ?auto_8360 ) ( IS-CRATE ?auto_8360 ) ( not ( = ?auto_8359 ?auto_8360 ) ) ( ON ?auto_8359 ?auto_8358 ) ( not ( = ?auto_8358 ?auto_8359 ) ) ( not ( = ?auto_8358 ?auto_8360 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8359 ?auto_8360 )
      ( MAKE-2CRATE-VERIFY ?auto_8358 ?auto_8359 ?auto_8360 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8363 - SURFACE
      ?auto_8364 - SURFACE
      ?auto_8365 - SURFACE
      ?auto_8366 - SURFACE
    )
    :vars
    (
      ?auto_8367 - HOIST
      ?auto_8368 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8367 ?auto_8368 ) ( SURFACE-AT ?auto_8365 ?auto_8368 ) ( CLEAR ?auto_8365 ) ( LIFTING ?auto_8367 ?auto_8366 ) ( IS-CRATE ?auto_8366 ) ( not ( = ?auto_8365 ?auto_8366 ) ) ( ON ?auto_8364 ?auto_8363 ) ( ON ?auto_8365 ?auto_8364 ) ( not ( = ?auto_8363 ?auto_8364 ) ) ( not ( = ?auto_8363 ?auto_8365 ) ) ( not ( = ?auto_8363 ?auto_8366 ) ) ( not ( = ?auto_8364 ?auto_8365 ) ) ( not ( = ?auto_8364 ?auto_8366 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8365 ?auto_8366 )
      ( MAKE-3CRATE-VERIFY ?auto_8363 ?auto_8364 ?auto_8365 ?auto_8366 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8369 - SURFACE
      ?auto_8370 - SURFACE
      ?auto_8371 - SURFACE
      ?auto_8372 - SURFACE
      ?auto_8373 - SURFACE
    )
    :vars
    (
      ?auto_8374 - HOIST
      ?auto_8375 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8374 ?auto_8375 ) ( SURFACE-AT ?auto_8372 ?auto_8375 ) ( CLEAR ?auto_8372 ) ( LIFTING ?auto_8374 ?auto_8373 ) ( IS-CRATE ?auto_8373 ) ( not ( = ?auto_8372 ?auto_8373 ) ) ( ON ?auto_8370 ?auto_8369 ) ( ON ?auto_8371 ?auto_8370 ) ( ON ?auto_8372 ?auto_8371 ) ( not ( = ?auto_8369 ?auto_8370 ) ) ( not ( = ?auto_8369 ?auto_8371 ) ) ( not ( = ?auto_8369 ?auto_8372 ) ) ( not ( = ?auto_8369 ?auto_8373 ) ) ( not ( = ?auto_8370 ?auto_8371 ) ) ( not ( = ?auto_8370 ?auto_8372 ) ) ( not ( = ?auto_8370 ?auto_8373 ) ) ( not ( = ?auto_8371 ?auto_8372 ) ) ( not ( = ?auto_8371 ?auto_8373 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8372 ?auto_8373 )
      ( MAKE-4CRATE-VERIFY ?auto_8369 ?auto_8370 ?auto_8371 ?auto_8372 ?auto_8373 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8376 - SURFACE
      ?auto_8377 - SURFACE
    )
    :vars
    (
      ?auto_8378 - HOIST
      ?auto_8379 - PLACE
      ?auto_8380 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8378 ?auto_8379 ) ( SURFACE-AT ?auto_8376 ?auto_8379 ) ( CLEAR ?auto_8376 ) ( IS-CRATE ?auto_8377 ) ( not ( = ?auto_8376 ?auto_8377 ) ) ( TRUCK-AT ?auto_8380 ?auto_8379 ) ( AVAILABLE ?auto_8378 ) ( IN ?auto_8377 ?auto_8380 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8378 ?auto_8377 ?auto_8380 ?auto_8379 )
      ( MAKE-1CRATE ?auto_8376 ?auto_8377 )
      ( MAKE-1CRATE-VERIFY ?auto_8376 ?auto_8377 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8381 - SURFACE
      ?auto_8382 - SURFACE
      ?auto_8383 - SURFACE
    )
    :vars
    (
      ?auto_8385 - HOIST
      ?auto_8386 - PLACE
      ?auto_8384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8385 ?auto_8386 ) ( SURFACE-AT ?auto_8382 ?auto_8386 ) ( CLEAR ?auto_8382 ) ( IS-CRATE ?auto_8383 ) ( not ( = ?auto_8382 ?auto_8383 ) ) ( TRUCK-AT ?auto_8384 ?auto_8386 ) ( AVAILABLE ?auto_8385 ) ( IN ?auto_8383 ?auto_8384 ) ( ON ?auto_8382 ?auto_8381 ) ( not ( = ?auto_8381 ?auto_8382 ) ) ( not ( = ?auto_8381 ?auto_8383 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8382 ?auto_8383 )
      ( MAKE-2CRATE-VERIFY ?auto_8381 ?auto_8382 ?auto_8383 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8387 - SURFACE
      ?auto_8388 - SURFACE
      ?auto_8389 - SURFACE
      ?auto_8390 - SURFACE
    )
    :vars
    (
      ?auto_8393 - HOIST
      ?auto_8391 - PLACE
      ?auto_8392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8393 ?auto_8391 ) ( SURFACE-AT ?auto_8389 ?auto_8391 ) ( CLEAR ?auto_8389 ) ( IS-CRATE ?auto_8390 ) ( not ( = ?auto_8389 ?auto_8390 ) ) ( TRUCK-AT ?auto_8392 ?auto_8391 ) ( AVAILABLE ?auto_8393 ) ( IN ?auto_8390 ?auto_8392 ) ( ON ?auto_8389 ?auto_8388 ) ( not ( = ?auto_8388 ?auto_8389 ) ) ( not ( = ?auto_8388 ?auto_8390 ) ) ( ON ?auto_8388 ?auto_8387 ) ( not ( = ?auto_8387 ?auto_8388 ) ) ( not ( = ?auto_8387 ?auto_8389 ) ) ( not ( = ?auto_8387 ?auto_8390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8388 ?auto_8389 ?auto_8390 )
      ( MAKE-3CRATE-VERIFY ?auto_8387 ?auto_8388 ?auto_8389 ?auto_8390 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8394 - SURFACE
      ?auto_8395 - SURFACE
      ?auto_8396 - SURFACE
      ?auto_8397 - SURFACE
      ?auto_8398 - SURFACE
    )
    :vars
    (
      ?auto_8401 - HOIST
      ?auto_8399 - PLACE
      ?auto_8400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8401 ?auto_8399 ) ( SURFACE-AT ?auto_8397 ?auto_8399 ) ( CLEAR ?auto_8397 ) ( IS-CRATE ?auto_8398 ) ( not ( = ?auto_8397 ?auto_8398 ) ) ( TRUCK-AT ?auto_8400 ?auto_8399 ) ( AVAILABLE ?auto_8401 ) ( IN ?auto_8398 ?auto_8400 ) ( ON ?auto_8397 ?auto_8396 ) ( not ( = ?auto_8396 ?auto_8397 ) ) ( not ( = ?auto_8396 ?auto_8398 ) ) ( ON ?auto_8395 ?auto_8394 ) ( ON ?auto_8396 ?auto_8395 ) ( not ( = ?auto_8394 ?auto_8395 ) ) ( not ( = ?auto_8394 ?auto_8396 ) ) ( not ( = ?auto_8394 ?auto_8397 ) ) ( not ( = ?auto_8394 ?auto_8398 ) ) ( not ( = ?auto_8395 ?auto_8396 ) ) ( not ( = ?auto_8395 ?auto_8397 ) ) ( not ( = ?auto_8395 ?auto_8398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8396 ?auto_8397 ?auto_8398 )
      ( MAKE-4CRATE-VERIFY ?auto_8394 ?auto_8395 ?auto_8396 ?auto_8397 ?auto_8398 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8402 - SURFACE
      ?auto_8403 - SURFACE
    )
    :vars
    (
      ?auto_8407 - HOIST
      ?auto_8404 - PLACE
      ?auto_8406 - TRUCK
      ?auto_8405 - SURFACE
      ?auto_8408 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8407 ?auto_8404 ) ( SURFACE-AT ?auto_8402 ?auto_8404 ) ( CLEAR ?auto_8402 ) ( IS-CRATE ?auto_8403 ) ( not ( = ?auto_8402 ?auto_8403 ) ) ( AVAILABLE ?auto_8407 ) ( IN ?auto_8403 ?auto_8406 ) ( ON ?auto_8402 ?auto_8405 ) ( not ( = ?auto_8405 ?auto_8402 ) ) ( not ( = ?auto_8405 ?auto_8403 ) ) ( TRUCK-AT ?auto_8406 ?auto_8408 ) ( not ( = ?auto_8408 ?auto_8404 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8406 ?auto_8408 ?auto_8404 )
      ( MAKE-2CRATE ?auto_8405 ?auto_8402 ?auto_8403 )
      ( MAKE-1CRATE-VERIFY ?auto_8402 ?auto_8403 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8409 - SURFACE
      ?auto_8410 - SURFACE
      ?auto_8411 - SURFACE
    )
    :vars
    (
      ?auto_8412 - HOIST
      ?auto_8415 - PLACE
      ?auto_8413 - TRUCK
      ?auto_8414 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8412 ?auto_8415 ) ( SURFACE-AT ?auto_8410 ?auto_8415 ) ( CLEAR ?auto_8410 ) ( IS-CRATE ?auto_8411 ) ( not ( = ?auto_8410 ?auto_8411 ) ) ( AVAILABLE ?auto_8412 ) ( IN ?auto_8411 ?auto_8413 ) ( ON ?auto_8410 ?auto_8409 ) ( not ( = ?auto_8409 ?auto_8410 ) ) ( not ( = ?auto_8409 ?auto_8411 ) ) ( TRUCK-AT ?auto_8413 ?auto_8414 ) ( not ( = ?auto_8414 ?auto_8415 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8410 ?auto_8411 )
      ( MAKE-2CRATE-VERIFY ?auto_8409 ?auto_8410 ?auto_8411 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8416 - SURFACE
      ?auto_8417 - SURFACE
      ?auto_8418 - SURFACE
      ?auto_8419 - SURFACE
    )
    :vars
    (
      ?auto_8420 - HOIST
      ?auto_8421 - PLACE
      ?auto_8422 - TRUCK
      ?auto_8423 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8420 ?auto_8421 ) ( SURFACE-AT ?auto_8418 ?auto_8421 ) ( CLEAR ?auto_8418 ) ( IS-CRATE ?auto_8419 ) ( not ( = ?auto_8418 ?auto_8419 ) ) ( AVAILABLE ?auto_8420 ) ( IN ?auto_8419 ?auto_8422 ) ( ON ?auto_8418 ?auto_8417 ) ( not ( = ?auto_8417 ?auto_8418 ) ) ( not ( = ?auto_8417 ?auto_8419 ) ) ( TRUCK-AT ?auto_8422 ?auto_8423 ) ( not ( = ?auto_8423 ?auto_8421 ) ) ( ON ?auto_8417 ?auto_8416 ) ( not ( = ?auto_8416 ?auto_8417 ) ) ( not ( = ?auto_8416 ?auto_8418 ) ) ( not ( = ?auto_8416 ?auto_8419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8417 ?auto_8418 ?auto_8419 )
      ( MAKE-3CRATE-VERIFY ?auto_8416 ?auto_8417 ?auto_8418 ?auto_8419 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8424 - SURFACE
      ?auto_8425 - SURFACE
      ?auto_8426 - SURFACE
      ?auto_8427 - SURFACE
      ?auto_8428 - SURFACE
    )
    :vars
    (
      ?auto_8429 - HOIST
      ?auto_8430 - PLACE
      ?auto_8431 - TRUCK
      ?auto_8432 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8429 ?auto_8430 ) ( SURFACE-AT ?auto_8427 ?auto_8430 ) ( CLEAR ?auto_8427 ) ( IS-CRATE ?auto_8428 ) ( not ( = ?auto_8427 ?auto_8428 ) ) ( AVAILABLE ?auto_8429 ) ( IN ?auto_8428 ?auto_8431 ) ( ON ?auto_8427 ?auto_8426 ) ( not ( = ?auto_8426 ?auto_8427 ) ) ( not ( = ?auto_8426 ?auto_8428 ) ) ( TRUCK-AT ?auto_8431 ?auto_8432 ) ( not ( = ?auto_8432 ?auto_8430 ) ) ( ON ?auto_8425 ?auto_8424 ) ( ON ?auto_8426 ?auto_8425 ) ( not ( = ?auto_8424 ?auto_8425 ) ) ( not ( = ?auto_8424 ?auto_8426 ) ) ( not ( = ?auto_8424 ?auto_8427 ) ) ( not ( = ?auto_8424 ?auto_8428 ) ) ( not ( = ?auto_8425 ?auto_8426 ) ) ( not ( = ?auto_8425 ?auto_8427 ) ) ( not ( = ?auto_8425 ?auto_8428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8426 ?auto_8427 ?auto_8428 )
      ( MAKE-4CRATE-VERIFY ?auto_8424 ?auto_8425 ?auto_8426 ?auto_8427 ?auto_8428 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8433 - SURFACE
      ?auto_8434 - SURFACE
    )
    :vars
    (
      ?auto_8435 - HOIST
      ?auto_8436 - PLACE
      ?auto_8439 - SURFACE
      ?auto_8437 - TRUCK
      ?auto_8438 - PLACE
      ?auto_8440 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8435 ?auto_8436 ) ( SURFACE-AT ?auto_8433 ?auto_8436 ) ( CLEAR ?auto_8433 ) ( IS-CRATE ?auto_8434 ) ( not ( = ?auto_8433 ?auto_8434 ) ) ( AVAILABLE ?auto_8435 ) ( ON ?auto_8433 ?auto_8439 ) ( not ( = ?auto_8439 ?auto_8433 ) ) ( not ( = ?auto_8439 ?auto_8434 ) ) ( TRUCK-AT ?auto_8437 ?auto_8438 ) ( not ( = ?auto_8438 ?auto_8436 ) ) ( HOIST-AT ?auto_8440 ?auto_8438 ) ( LIFTING ?auto_8440 ?auto_8434 ) ( not ( = ?auto_8435 ?auto_8440 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8440 ?auto_8434 ?auto_8437 ?auto_8438 )
      ( MAKE-2CRATE ?auto_8439 ?auto_8433 ?auto_8434 )
      ( MAKE-1CRATE-VERIFY ?auto_8433 ?auto_8434 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8441 - SURFACE
      ?auto_8442 - SURFACE
      ?auto_8443 - SURFACE
    )
    :vars
    (
      ?auto_8444 - HOIST
      ?auto_8448 - PLACE
      ?auto_8446 - TRUCK
      ?auto_8445 - PLACE
      ?auto_8447 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8444 ?auto_8448 ) ( SURFACE-AT ?auto_8442 ?auto_8448 ) ( CLEAR ?auto_8442 ) ( IS-CRATE ?auto_8443 ) ( not ( = ?auto_8442 ?auto_8443 ) ) ( AVAILABLE ?auto_8444 ) ( ON ?auto_8442 ?auto_8441 ) ( not ( = ?auto_8441 ?auto_8442 ) ) ( not ( = ?auto_8441 ?auto_8443 ) ) ( TRUCK-AT ?auto_8446 ?auto_8445 ) ( not ( = ?auto_8445 ?auto_8448 ) ) ( HOIST-AT ?auto_8447 ?auto_8445 ) ( LIFTING ?auto_8447 ?auto_8443 ) ( not ( = ?auto_8444 ?auto_8447 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8442 ?auto_8443 )
      ( MAKE-2CRATE-VERIFY ?auto_8441 ?auto_8442 ?auto_8443 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8449 - SURFACE
      ?auto_8450 - SURFACE
      ?auto_8451 - SURFACE
      ?auto_8452 - SURFACE
    )
    :vars
    (
      ?auto_8456 - HOIST
      ?auto_8455 - PLACE
      ?auto_8457 - TRUCK
      ?auto_8454 - PLACE
      ?auto_8453 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8456 ?auto_8455 ) ( SURFACE-AT ?auto_8451 ?auto_8455 ) ( CLEAR ?auto_8451 ) ( IS-CRATE ?auto_8452 ) ( not ( = ?auto_8451 ?auto_8452 ) ) ( AVAILABLE ?auto_8456 ) ( ON ?auto_8451 ?auto_8450 ) ( not ( = ?auto_8450 ?auto_8451 ) ) ( not ( = ?auto_8450 ?auto_8452 ) ) ( TRUCK-AT ?auto_8457 ?auto_8454 ) ( not ( = ?auto_8454 ?auto_8455 ) ) ( HOIST-AT ?auto_8453 ?auto_8454 ) ( LIFTING ?auto_8453 ?auto_8452 ) ( not ( = ?auto_8456 ?auto_8453 ) ) ( ON ?auto_8450 ?auto_8449 ) ( not ( = ?auto_8449 ?auto_8450 ) ) ( not ( = ?auto_8449 ?auto_8451 ) ) ( not ( = ?auto_8449 ?auto_8452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8450 ?auto_8451 ?auto_8452 )
      ( MAKE-3CRATE-VERIFY ?auto_8449 ?auto_8450 ?auto_8451 ?auto_8452 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8458 - SURFACE
      ?auto_8459 - SURFACE
      ?auto_8460 - SURFACE
      ?auto_8461 - SURFACE
      ?auto_8462 - SURFACE
    )
    :vars
    (
      ?auto_8466 - HOIST
      ?auto_8465 - PLACE
      ?auto_8467 - TRUCK
      ?auto_8464 - PLACE
      ?auto_8463 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8466 ?auto_8465 ) ( SURFACE-AT ?auto_8461 ?auto_8465 ) ( CLEAR ?auto_8461 ) ( IS-CRATE ?auto_8462 ) ( not ( = ?auto_8461 ?auto_8462 ) ) ( AVAILABLE ?auto_8466 ) ( ON ?auto_8461 ?auto_8460 ) ( not ( = ?auto_8460 ?auto_8461 ) ) ( not ( = ?auto_8460 ?auto_8462 ) ) ( TRUCK-AT ?auto_8467 ?auto_8464 ) ( not ( = ?auto_8464 ?auto_8465 ) ) ( HOIST-AT ?auto_8463 ?auto_8464 ) ( LIFTING ?auto_8463 ?auto_8462 ) ( not ( = ?auto_8466 ?auto_8463 ) ) ( ON ?auto_8459 ?auto_8458 ) ( ON ?auto_8460 ?auto_8459 ) ( not ( = ?auto_8458 ?auto_8459 ) ) ( not ( = ?auto_8458 ?auto_8460 ) ) ( not ( = ?auto_8458 ?auto_8461 ) ) ( not ( = ?auto_8458 ?auto_8462 ) ) ( not ( = ?auto_8459 ?auto_8460 ) ) ( not ( = ?auto_8459 ?auto_8461 ) ) ( not ( = ?auto_8459 ?auto_8462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8460 ?auto_8461 ?auto_8462 )
      ( MAKE-4CRATE-VERIFY ?auto_8458 ?auto_8459 ?auto_8460 ?auto_8461 ?auto_8462 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8468 - SURFACE
      ?auto_8469 - SURFACE
    )
    :vars
    (
      ?auto_8474 - HOIST
      ?auto_8473 - PLACE
      ?auto_8472 - SURFACE
      ?auto_8475 - TRUCK
      ?auto_8471 - PLACE
      ?auto_8470 - HOIST
      ?auto_8476 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8474 ?auto_8473 ) ( SURFACE-AT ?auto_8468 ?auto_8473 ) ( CLEAR ?auto_8468 ) ( IS-CRATE ?auto_8469 ) ( not ( = ?auto_8468 ?auto_8469 ) ) ( AVAILABLE ?auto_8474 ) ( ON ?auto_8468 ?auto_8472 ) ( not ( = ?auto_8472 ?auto_8468 ) ) ( not ( = ?auto_8472 ?auto_8469 ) ) ( TRUCK-AT ?auto_8475 ?auto_8471 ) ( not ( = ?auto_8471 ?auto_8473 ) ) ( HOIST-AT ?auto_8470 ?auto_8471 ) ( not ( = ?auto_8474 ?auto_8470 ) ) ( AVAILABLE ?auto_8470 ) ( SURFACE-AT ?auto_8469 ?auto_8471 ) ( ON ?auto_8469 ?auto_8476 ) ( CLEAR ?auto_8469 ) ( not ( = ?auto_8468 ?auto_8476 ) ) ( not ( = ?auto_8469 ?auto_8476 ) ) ( not ( = ?auto_8472 ?auto_8476 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8470 ?auto_8469 ?auto_8476 ?auto_8471 )
      ( MAKE-2CRATE ?auto_8472 ?auto_8468 ?auto_8469 )
      ( MAKE-1CRATE-VERIFY ?auto_8468 ?auto_8469 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8477 - SURFACE
      ?auto_8478 - SURFACE
      ?auto_8479 - SURFACE
    )
    :vars
    (
      ?auto_8484 - HOIST
      ?auto_8483 - PLACE
      ?auto_8481 - TRUCK
      ?auto_8482 - PLACE
      ?auto_8480 - HOIST
      ?auto_8485 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8484 ?auto_8483 ) ( SURFACE-AT ?auto_8478 ?auto_8483 ) ( CLEAR ?auto_8478 ) ( IS-CRATE ?auto_8479 ) ( not ( = ?auto_8478 ?auto_8479 ) ) ( AVAILABLE ?auto_8484 ) ( ON ?auto_8478 ?auto_8477 ) ( not ( = ?auto_8477 ?auto_8478 ) ) ( not ( = ?auto_8477 ?auto_8479 ) ) ( TRUCK-AT ?auto_8481 ?auto_8482 ) ( not ( = ?auto_8482 ?auto_8483 ) ) ( HOIST-AT ?auto_8480 ?auto_8482 ) ( not ( = ?auto_8484 ?auto_8480 ) ) ( AVAILABLE ?auto_8480 ) ( SURFACE-AT ?auto_8479 ?auto_8482 ) ( ON ?auto_8479 ?auto_8485 ) ( CLEAR ?auto_8479 ) ( not ( = ?auto_8478 ?auto_8485 ) ) ( not ( = ?auto_8479 ?auto_8485 ) ) ( not ( = ?auto_8477 ?auto_8485 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8478 ?auto_8479 )
      ( MAKE-2CRATE-VERIFY ?auto_8477 ?auto_8478 ?auto_8479 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8486 - SURFACE
      ?auto_8487 - SURFACE
      ?auto_8488 - SURFACE
      ?auto_8489 - SURFACE
    )
    :vars
    (
      ?auto_8492 - HOIST
      ?auto_8493 - PLACE
      ?auto_8494 - TRUCK
      ?auto_8495 - PLACE
      ?auto_8491 - HOIST
      ?auto_8490 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8492 ?auto_8493 ) ( SURFACE-AT ?auto_8488 ?auto_8493 ) ( CLEAR ?auto_8488 ) ( IS-CRATE ?auto_8489 ) ( not ( = ?auto_8488 ?auto_8489 ) ) ( AVAILABLE ?auto_8492 ) ( ON ?auto_8488 ?auto_8487 ) ( not ( = ?auto_8487 ?auto_8488 ) ) ( not ( = ?auto_8487 ?auto_8489 ) ) ( TRUCK-AT ?auto_8494 ?auto_8495 ) ( not ( = ?auto_8495 ?auto_8493 ) ) ( HOIST-AT ?auto_8491 ?auto_8495 ) ( not ( = ?auto_8492 ?auto_8491 ) ) ( AVAILABLE ?auto_8491 ) ( SURFACE-AT ?auto_8489 ?auto_8495 ) ( ON ?auto_8489 ?auto_8490 ) ( CLEAR ?auto_8489 ) ( not ( = ?auto_8488 ?auto_8490 ) ) ( not ( = ?auto_8489 ?auto_8490 ) ) ( not ( = ?auto_8487 ?auto_8490 ) ) ( ON ?auto_8487 ?auto_8486 ) ( not ( = ?auto_8486 ?auto_8487 ) ) ( not ( = ?auto_8486 ?auto_8488 ) ) ( not ( = ?auto_8486 ?auto_8489 ) ) ( not ( = ?auto_8486 ?auto_8490 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8487 ?auto_8488 ?auto_8489 )
      ( MAKE-3CRATE-VERIFY ?auto_8486 ?auto_8487 ?auto_8488 ?auto_8489 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8496 - SURFACE
      ?auto_8497 - SURFACE
      ?auto_8498 - SURFACE
      ?auto_8499 - SURFACE
      ?auto_8500 - SURFACE
    )
    :vars
    (
      ?auto_8503 - HOIST
      ?auto_8504 - PLACE
      ?auto_8505 - TRUCK
      ?auto_8506 - PLACE
      ?auto_8502 - HOIST
      ?auto_8501 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8503 ?auto_8504 ) ( SURFACE-AT ?auto_8499 ?auto_8504 ) ( CLEAR ?auto_8499 ) ( IS-CRATE ?auto_8500 ) ( not ( = ?auto_8499 ?auto_8500 ) ) ( AVAILABLE ?auto_8503 ) ( ON ?auto_8499 ?auto_8498 ) ( not ( = ?auto_8498 ?auto_8499 ) ) ( not ( = ?auto_8498 ?auto_8500 ) ) ( TRUCK-AT ?auto_8505 ?auto_8506 ) ( not ( = ?auto_8506 ?auto_8504 ) ) ( HOIST-AT ?auto_8502 ?auto_8506 ) ( not ( = ?auto_8503 ?auto_8502 ) ) ( AVAILABLE ?auto_8502 ) ( SURFACE-AT ?auto_8500 ?auto_8506 ) ( ON ?auto_8500 ?auto_8501 ) ( CLEAR ?auto_8500 ) ( not ( = ?auto_8499 ?auto_8501 ) ) ( not ( = ?auto_8500 ?auto_8501 ) ) ( not ( = ?auto_8498 ?auto_8501 ) ) ( ON ?auto_8497 ?auto_8496 ) ( ON ?auto_8498 ?auto_8497 ) ( not ( = ?auto_8496 ?auto_8497 ) ) ( not ( = ?auto_8496 ?auto_8498 ) ) ( not ( = ?auto_8496 ?auto_8499 ) ) ( not ( = ?auto_8496 ?auto_8500 ) ) ( not ( = ?auto_8496 ?auto_8501 ) ) ( not ( = ?auto_8497 ?auto_8498 ) ) ( not ( = ?auto_8497 ?auto_8499 ) ) ( not ( = ?auto_8497 ?auto_8500 ) ) ( not ( = ?auto_8497 ?auto_8501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8498 ?auto_8499 ?auto_8500 )
      ( MAKE-4CRATE-VERIFY ?auto_8496 ?auto_8497 ?auto_8498 ?auto_8499 ?auto_8500 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8507 - SURFACE
      ?auto_8508 - SURFACE
    )
    :vars
    (
      ?auto_8511 - HOIST
      ?auto_8512 - PLACE
      ?auto_8513 - SURFACE
      ?auto_8515 - PLACE
      ?auto_8510 - HOIST
      ?auto_8509 - SURFACE
      ?auto_8514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8511 ?auto_8512 ) ( SURFACE-AT ?auto_8507 ?auto_8512 ) ( CLEAR ?auto_8507 ) ( IS-CRATE ?auto_8508 ) ( not ( = ?auto_8507 ?auto_8508 ) ) ( AVAILABLE ?auto_8511 ) ( ON ?auto_8507 ?auto_8513 ) ( not ( = ?auto_8513 ?auto_8507 ) ) ( not ( = ?auto_8513 ?auto_8508 ) ) ( not ( = ?auto_8515 ?auto_8512 ) ) ( HOIST-AT ?auto_8510 ?auto_8515 ) ( not ( = ?auto_8511 ?auto_8510 ) ) ( AVAILABLE ?auto_8510 ) ( SURFACE-AT ?auto_8508 ?auto_8515 ) ( ON ?auto_8508 ?auto_8509 ) ( CLEAR ?auto_8508 ) ( not ( = ?auto_8507 ?auto_8509 ) ) ( not ( = ?auto_8508 ?auto_8509 ) ) ( not ( = ?auto_8513 ?auto_8509 ) ) ( TRUCK-AT ?auto_8514 ?auto_8512 ) )
    :subtasks
    ( ( !DRIVE ?auto_8514 ?auto_8512 ?auto_8515 )
      ( MAKE-2CRATE ?auto_8513 ?auto_8507 ?auto_8508 )
      ( MAKE-1CRATE-VERIFY ?auto_8507 ?auto_8508 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8516 - SURFACE
      ?auto_8517 - SURFACE
      ?auto_8518 - SURFACE
    )
    :vars
    (
      ?auto_8522 - HOIST
      ?auto_8520 - PLACE
      ?auto_8521 - PLACE
      ?auto_8519 - HOIST
      ?auto_8524 - SURFACE
      ?auto_8523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8522 ?auto_8520 ) ( SURFACE-AT ?auto_8517 ?auto_8520 ) ( CLEAR ?auto_8517 ) ( IS-CRATE ?auto_8518 ) ( not ( = ?auto_8517 ?auto_8518 ) ) ( AVAILABLE ?auto_8522 ) ( ON ?auto_8517 ?auto_8516 ) ( not ( = ?auto_8516 ?auto_8517 ) ) ( not ( = ?auto_8516 ?auto_8518 ) ) ( not ( = ?auto_8521 ?auto_8520 ) ) ( HOIST-AT ?auto_8519 ?auto_8521 ) ( not ( = ?auto_8522 ?auto_8519 ) ) ( AVAILABLE ?auto_8519 ) ( SURFACE-AT ?auto_8518 ?auto_8521 ) ( ON ?auto_8518 ?auto_8524 ) ( CLEAR ?auto_8518 ) ( not ( = ?auto_8517 ?auto_8524 ) ) ( not ( = ?auto_8518 ?auto_8524 ) ) ( not ( = ?auto_8516 ?auto_8524 ) ) ( TRUCK-AT ?auto_8523 ?auto_8520 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8517 ?auto_8518 )
      ( MAKE-2CRATE-VERIFY ?auto_8516 ?auto_8517 ?auto_8518 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8525 - SURFACE
      ?auto_8526 - SURFACE
      ?auto_8527 - SURFACE
      ?auto_8528 - SURFACE
    )
    :vars
    (
      ?auto_8530 - HOIST
      ?auto_8532 - PLACE
      ?auto_8534 - PLACE
      ?auto_8529 - HOIST
      ?auto_8533 - SURFACE
      ?auto_8531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8530 ?auto_8532 ) ( SURFACE-AT ?auto_8527 ?auto_8532 ) ( CLEAR ?auto_8527 ) ( IS-CRATE ?auto_8528 ) ( not ( = ?auto_8527 ?auto_8528 ) ) ( AVAILABLE ?auto_8530 ) ( ON ?auto_8527 ?auto_8526 ) ( not ( = ?auto_8526 ?auto_8527 ) ) ( not ( = ?auto_8526 ?auto_8528 ) ) ( not ( = ?auto_8534 ?auto_8532 ) ) ( HOIST-AT ?auto_8529 ?auto_8534 ) ( not ( = ?auto_8530 ?auto_8529 ) ) ( AVAILABLE ?auto_8529 ) ( SURFACE-AT ?auto_8528 ?auto_8534 ) ( ON ?auto_8528 ?auto_8533 ) ( CLEAR ?auto_8528 ) ( not ( = ?auto_8527 ?auto_8533 ) ) ( not ( = ?auto_8528 ?auto_8533 ) ) ( not ( = ?auto_8526 ?auto_8533 ) ) ( TRUCK-AT ?auto_8531 ?auto_8532 ) ( ON ?auto_8526 ?auto_8525 ) ( not ( = ?auto_8525 ?auto_8526 ) ) ( not ( = ?auto_8525 ?auto_8527 ) ) ( not ( = ?auto_8525 ?auto_8528 ) ) ( not ( = ?auto_8525 ?auto_8533 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8526 ?auto_8527 ?auto_8528 )
      ( MAKE-3CRATE-VERIFY ?auto_8525 ?auto_8526 ?auto_8527 ?auto_8528 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8535 - SURFACE
      ?auto_8536 - SURFACE
      ?auto_8537 - SURFACE
      ?auto_8538 - SURFACE
      ?auto_8539 - SURFACE
    )
    :vars
    (
      ?auto_8541 - HOIST
      ?auto_8543 - PLACE
      ?auto_8545 - PLACE
      ?auto_8540 - HOIST
      ?auto_8544 - SURFACE
      ?auto_8542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8541 ?auto_8543 ) ( SURFACE-AT ?auto_8538 ?auto_8543 ) ( CLEAR ?auto_8538 ) ( IS-CRATE ?auto_8539 ) ( not ( = ?auto_8538 ?auto_8539 ) ) ( AVAILABLE ?auto_8541 ) ( ON ?auto_8538 ?auto_8537 ) ( not ( = ?auto_8537 ?auto_8538 ) ) ( not ( = ?auto_8537 ?auto_8539 ) ) ( not ( = ?auto_8545 ?auto_8543 ) ) ( HOIST-AT ?auto_8540 ?auto_8545 ) ( not ( = ?auto_8541 ?auto_8540 ) ) ( AVAILABLE ?auto_8540 ) ( SURFACE-AT ?auto_8539 ?auto_8545 ) ( ON ?auto_8539 ?auto_8544 ) ( CLEAR ?auto_8539 ) ( not ( = ?auto_8538 ?auto_8544 ) ) ( not ( = ?auto_8539 ?auto_8544 ) ) ( not ( = ?auto_8537 ?auto_8544 ) ) ( TRUCK-AT ?auto_8542 ?auto_8543 ) ( ON ?auto_8536 ?auto_8535 ) ( ON ?auto_8537 ?auto_8536 ) ( not ( = ?auto_8535 ?auto_8536 ) ) ( not ( = ?auto_8535 ?auto_8537 ) ) ( not ( = ?auto_8535 ?auto_8538 ) ) ( not ( = ?auto_8535 ?auto_8539 ) ) ( not ( = ?auto_8535 ?auto_8544 ) ) ( not ( = ?auto_8536 ?auto_8537 ) ) ( not ( = ?auto_8536 ?auto_8538 ) ) ( not ( = ?auto_8536 ?auto_8539 ) ) ( not ( = ?auto_8536 ?auto_8544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8537 ?auto_8538 ?auto_8539 )
      ( MAKE-4CRATE-VERIFY ?auto_8535 ?auto_8536 ?auto_8537 ?auto_8538 ?auto_8539 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8546 - SURFACE
      ?auto_8547 - SURFACE
    )
    :vars
    (
      ?auto_8549 - HOIST
      ?auto_8552 - PLACE
      ?auto_8551 - SURFACE
      ?auto_8554 - PLACE
      ?auto_8548 - HOIST
      ?auto_8553 - SURFACE
      ?auto_8550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8549 ?auto_8552 ) ( IS-CRATE ?auto_8547 ) ( not ( = ?auto_8546 ?auto_8547 ) ) ( not ( = ?auto_8551 ?auto_8546 ) ) ( not ( = ?auto_8551 ?auto_8547 ) ) ( not ( = ?auto_8554 ?auto_8552 ) ) ( HOIST-AT ?auto_8548 ?auto_8554 ) ( not ( = ?auto_8549 ?auto_8548 ) ) ( AVAILABLE ?auto_8548 ) ( SURFACE-AT ?auto_8547 ?auto_8554 ) ( ON ?auto_8547 ?auto_8553 ) ( CLEAR ?auto_8547 ) ( not ( = ?auto_8546 ?auto_8553 ) ) ( not ( = ?auto_8547 ?auto_8553 ) ) ( not ( = ?auto_8551 ?auto_8553 ) ) ( TRUCK-AT ?auto_8550 ?auto_8552 ) ( SURFACE-AT ?auto_8551 ?auto_8552 ) ( CLEAR ?auto_8551 ) ( LIFTING ?auto_8549 ?auto_8546 ) ( IS-CRATE ?auto_8546 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8551 ?auto_8546 )
      ( MAKE-2CRATE ?auto_8551 ?auto_8546 ?auto_8547 )
      ( MAKE-1CRATE-VERIFY ?auto_8546 ?auto_8547 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8555 - SURFACE
      ?auto_8556 - SURFACE
      ?auto_8557 - SURFACE
    )
    :vars
    (
      ?auto_8558 - HOIST
      ?auto_8563 - PLACE
      ?auto_8559 - PLACE
      ?auto_8561 - HOIST
      ?auto_8560 - SURFACE
      ?auto_8562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8558 ?auto_8563 ) ( IS-CRATE ?auto_8557 ) ( not ( = ?auto_8556 ?auto_8557 ) ) ( not ( = ?auto_8555 ?auto_8556 ) ) ( not ( = ?auto_8555 ?auto_8557 ) ) ( not ( = ?auto_8559 ?auto_8563 ) ) ( HOIST-AT ?auto_8561 ?auto_8559 ) ( not ( = ?auto_8558 ?auto_8561 ) ) ( AVAILABLE ?auto_8561 ) ( SURFACE-AT ?auto_8557 ?auto_8559 ) ( ON ?auto_8557 ?auto_8560 ) ( CLEAR ?auto_8557 ) ( not ( = ?auto_8556 ?auto_8560 ) ) ( not ( = ?auto_8557 ?auto_8560 ) ) ( not ( = ?auto_8555 ?auto_8560 ) ) ( TRUCK-AT ?auto_8562 ?auto_8563 ) ( SURFACE-AT ?auto_8555 ?auto_8563 ) ( CLEAR ?auto_8555 ) ( LIFTING ?auto_8558 ?auto_8556 ) ( IS-CRATE ?auto_8556 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8556 ?auto_8557 )
      ( MAKE-2CRATE-VERIFY ?auto_8555 ?auto_8556 ?auto_8557 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8564 - SURFACE
      ?auto_8565 - SURFACE
      ?auto_8566 - SURFACE
      ?auto_8567 - SURFACE
    )
    :vars
    (
      ?auto_8570 - HOIST
      ?auto_8572 - PLACE
      ?auto_8573 - PLACE
      ?auto_8569 - HOIST
      ?auto_8571 - SURFACE
      ?auto_8568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8570 ?auto_8572 ) ( IS-CRATE ?auto_8567 ) ( not ( = ?auto_8566 ?auto_8567 ) ) ( not ( = ?auto_8565 ?auto_8566 ) ) ( not ( = ?auto_8565 ?auto_8567 ) ) ( not ( = ?auto_8573 ?auto_8572 ) ) ( HOIST-AT ?auto_8569 ?auto_8573 ) ( not ( = ?auto_8570 ?auto_8569 ) ) ( AVAILABLE ?auto_8569 ) ( SURFACE-AT ?auto_8567 ?auto_8573 ) ( ON ?auto_8567 ?auto_8571 ) ( CLEAR ?auto_8567 ) ( not ( = ?auto_8566 ?auto_8571 ) ) ( not ( = ?auto_8567 ?auto_8571 ) ) ( not ( = ?auto_8565 ?auto_8571 ) ) ( TRUCK-AT ?auto_8568 ?auto_8572 ) ( SURFACE-AT ?auto_8565 ?auto_8572 ) ( CLEAR ?auto_8565 ) ( LIFTING ?auto_8570 ?auto_8566 ) ( IS-CRATE ?auto_8566 ) ( ON ?auto_8565 ?auto_8564 ) ( not ( = ?auto_8564 ?auto_8565 ) ) ( not ( = ?auto_8564 ?auto_8566 ) ) ( not ( = ?auto_8564 ?auto_8567 ) ) ( not ( = ?auto_8564 ?auto_8571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8565 ?auto_8566 ?auto_8567 )
      ( MAKE-3CRATE-VERIFY ?auto_8564 ?auto_8565 ?auto_8566 ?auto_8567 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8574 - SURFACE
      ?auto_8575 - SURFACE
      ?auto_8576 - SURFACE
      ?auto_8577 - SURFACE
      ?auto_8578 - SURFACE
    )
    :vars
    (
      ?auto_8581 - HOIST
      ?auto_8583 - PLACE
      ?auto_8584 - PLACE
      ?auto_8580 - HOIST
      ?auto_8582 - SURFACE
      ?auto_8579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8581 ?auto_8583 ) ( IS-CRATE ?auto_8578 ) ( not ( = ?auto_8577 ?auto_8578 ) ) ( not ( = ?auto_8576 ?auto_8577 ) ) ( not ( = ?auto_8576 ?auto_8578 ) ) ( not ( = ?auto_8584 ?auto_8583 ) ) ( HOIST-AT ?auto_8580 ?auto_8584 ) ( not ( = ?auto_8581 ?auto_8580 ) ) ( AVAILABLE ?auto_8580 ) ( SURFACE-AT ?auto_8578 ?auto_8584 ) ( ON ?auto_8578 ?auto_8582 ) ( CLEAR ?auto_8578 ) ( not ( = ?auto_8577 ?auto_8582 ) ) ( not ( = ?auto_8578 ?auto_8582 ) ) ( not ( = ?auto_8576 ?auto_8582 ) ) ( TRUCK-AT ?auto_8579 ?auto_8583 ) ( SURFACE-AT ?auto_8576 ?auto_8583 ) ( CLEAR ?auto_8576 ) ( LIFTING ?auto_8581 ?auto_8577 ) ( IS-CRATE ?auto_8577 ) ( ON ?auto_8575 ?auto_8574 ) ( ON ?auto_8576 ?auto_8575 ) ( not ( = ?auto_8574 ?auto_8575 ) ) ( not ( = ?auto_8574 ?auto_8576 ) ) ( not ( = ?auto_8574 ?auto_8577 ) ) ( not ( = ?auto_8574 ?auto_8578 ) ) ( not ( = ?auto_8574 ?auto_8582 ) ) ( not ( = ?auto_8575 ?auto_8576 ) ) ( not ( = ?auto_8575 ?auto_8577 ) ) ( not ( = ?auto_8575 ?auto_8578 ) ) ( not ( = ?auto_8575 ?auto_8582 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8576 ?auto_8577 ?auto_8578 )
      ( MAKE-4CRATE-VERIFY ?auto_8574 ?auto_8575 ?auto_8576 ?auto_8577 ?auto_8578 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8585 - SURFACE
      ?auto_8586 - SURFACE
    )
    :vars
    (
      ?auto_8589 - HOIST
      ?auto_8592 - PLACE
      ?auto_8591 - SURFACE
      ?auto_8593 - PLACE
      ?auto_8588 - HOIST
      ?auto_8590 - SURFACE
      ?auto_8587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8589 ?auto_8592 ) ( IS-CRATE ?auto_8586 ) ( not ( = ?auto_8585 ?auto_8586 ) ) ( not ( = ?auto_8591 ?auto_8585 ) ) ( not ( = ?auto_8591 ?auto_8586 ) ) ( not ( = ?auto_8593 ?auto_8592 ) ) ( HOIST-AT ?auto_8588 ?auto_8593 ) ( not ( = ?auto_8589 ?auto_8588 ) ) ( AVAILABLE ?auto_8588 ) ( SURFACE-AT ?auto_8586 ?auto_8593 ) ( ON ?auto_8586 ?auto_8590 ) ( CLEAR ?auto_8586 ) ( not ( = ?auto_8585 ?auto_8590 ) ) ( not ( = ?auto_8586 ?auto_8590 ) ) ( not ( = ?auto_8591 ?auto_8590 ) ) ( TRUCK-AT ?auto_8587 ?auto_8592 ) ( SURFACE-AT ?auto_8591 ?auto_8592 ) ( CLEAR ?auto_8591 ) ( IS-CRATE ?auto_8585 ) ( AVAILABLE ?auto_8589 ) ( IN ?auto_8585 ?auto_8587 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8589 ?auto_8585 ?auto_8587 ?auto_8592 )
      ( MAKE-2CRATE ?auto_8591 ?auto_8585 ?auto_8586 )
      ( MAKE-1CRATE-VERIFY ?auto_8585 ?auto_8586 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8594 - SURFACE
      ?auto_8595 - SURFACE
      ?auto_8596 - SURFACE
    )
    :vars
    (
      ?auto_8597 - HOIST
      ?auto_8601 - PLACE
      ?auto_8602 - PLACE
      ?auto_8599 - HOIST
      ?auto_8598 - SURFACE
      ?auto_8600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8597 ?auto_8601 ) ( IS-CRATE ?auto_8596 ) ( not ( = ?auto_8595 ?auto_8596 ) ) ( not ( = ?auto_8594 ?auto_8595 ) ) ( not ( = ?auto_8594 ?auto_8596 ) ) ( not ( = ?auto_8602 ?auto_8601 ) ) ( HOIST-AT ?auto_8599 ?auto_8602 ) ( not ( = ?auto_8597 ?auto_8599 ) ) ( AVAILABLE ?auto_8599 ) ( SURFACE-AT ?auto_8596 ?auto_8602 ) ( ON ?auto_8596 ?auto_8598 ) ( CLEAR ?auto_8596 ) ( not ( = ?auto_8595 ?auto_8598 ) ) ( not ( = ?auto_8596 ?auto_8598 ) ) ( not ( = ?auto_8594 ?auto_8598 ) ) ( TRUCK-AT ?auto_8600 ?auto_8601 ) ( SURFACE-AT ?auto_8594 ?auto_8601 ) ( CLEAR ?auto_8594 ) ( IS-CRATE ?auto_8595 ) ( AVAILABLE ?auto_8597 ) ( IN ?auto_8595 ?auto_8600 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8595 ?auto_8596 )
      ( MAKE-2CRATE-VERIFY ?auto_8594 ?auto_8595 ?auto_8596 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8603 - SURFACE
      ?auto_8604 - SURFACE
      ?auto_8605 - SURFACE
      ?auto_8606 - SURFACE
    )
    :vars
    (
      ?auto_8608 - HOIST
      ?auto_8607 - PLACE
      ?auto_8610 - PLACE
      ?auto_8611 - HOIST
      ?auto_8609 - SURFACE
      ?auto_8612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8608 ?auto_8607 ) ( IS-CRATE ?auto_8606 ) ( not ( = ?auto_8605 ?auto_8606 ) ) ( not ( = ?auto_8604 ?auto_8605 ) ) ( not ( = ?auto_8604 ?auto_8606 ) ) ( not ( = ?auto_8610 ?auto_8607 ) ) ( HOIST-AT ?auto_8611 ?auto_8610 ) ( not ( = ?auto_8608 ?auto_8611 ) ) ( AVAILABLE ?auto_8611 ) ( SURFACE-AT ?auto_8606 ?auto_8610 ) ( ON ?auto_8606 ?auto_8609 ) ( CLEAR ?auto_8606 ) ( not ( = ?auto_8605 ?auto_8609 ) ) ( not ( = ?auto_8606 ?auto_8609 ) ) ( not ( = ?auto_8604 ?auto_8609 ) ) ( TRUCK-AT ?auto_8612 ?auto_8607 ) ( SURFACE-AT ?auto_8604 ?auto_8607 ) ( CLEAR ?auto_8604 ) ( IS-CRATE ?auto_8605 ) ( AVAILABLE ?auto_8608 ) ( IN ?auto_8605 ?auto_8612 ) ( ON ?auto_8604 ?auto_8603 ) ( not ( = ?auto_8603 ?auto_8604 ) ) ( not ( = ?auto_8603 ?auto_8605 ) ) ( not ( = ?auto_8603 ?auto_8606 ) ) ( not ( = ?auto_8603 ?auto_8609 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8604 ?auto_8605 ?auto_8606 )
      ( MAKE-3CRATE-VERIFY ?auto_8603 ?auto_8604 ?auto_8605 ?auto_8606 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8613 - SURFACE
      ?auto_8614 - SURFACE
      ?auto_8615 - SURFACE
      ?auto_8616 - SURFACE
      ?auto_8617 - SURFACE
    )
    :vars
    (
      ?auto_8619 - HOIST
      ?auto_8618 - PLACE
      ?auto_8621 - PLACE
      ?auto_8622 - HOIST
      ?auto_8620 - SURFACE
      ?auto_8623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8619 ?auto_8618 ) ( IS-CRATE ?auto_8617 ) ( not ( = ?auto_8616 ?auto_8617 ) ) ( not ( = ?auto_8615 ?auto_8616 ) ) ( not ( = ?auto_8615 ?auto_8617 ) ) ( not ( = ?auto_8621 ?auto_8618 ) ) ( HOIST-AT ?auto_8622 ?auto_8621 ) ( not ( = ?auto_8619 ?auto_8622 ) ) ( AVAILABLE ?auto_8622 ) ( SURFACE-AT ?auto_8617 ?auto_8621 ) ( ON ?auto_8617 ?auto_8620 ) ( CLEAR ?auto_8617 ) ( not ( = ?auto_8616 ?auto_8620 ) ) ( not ( = ?auto_8617 ?auto_8620 ) ) ( not ( = ?auto_8615 ?auto_8620 ) ) ( TRUCK-AT ?auto_8623 ?auto_8618 ) ( SURFACE-AT ?auto_8615 ?auto_8618 ) ( CLEAR ?auto_8615 ) ( IS-CRATE ?auto_8616 ) ( AVAILABLE ?auto_8619 ) ( IN ?auto_8616 ?auto_8623 ) ( ON ?auto_8614 ?auto_8613 ) ( ON ?auto_8615 ?auto_8614 ) ( not ( = ?auto_8613 ?auto_8614 ) ) ( not ( = ?auto_8613 ?auto_8615 ) ) ( not ( = ?auto_8613 ?auto_8616 ) ) ( not ( = ?auto_8613 ?auto_8617 ) ) ( not ( = ?auto_8613 ?auto_8620 ) ) ( not ( = ?auto_8614 ?auto_8615 ) ) ( not ( = ?auto_8614 ?auto_8616 ) ) ( not ( = ?auto_8614 ?auto_8617 ) ) ( not ( = ?auto_8614 ?auto_8620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8615 ?auto_8616 ?auto_8617 )
      ( MAKE-4CRATE-VERIFY ?auto_8613 ?auto_8614 ?auto_8615 ?auto_8616 ?auto_8617 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8624 - SURFACE
      ?auto_8625 - SURFACE
    )
    :vars
    (
      ?auto_8627 - HOIST
      ?auto_8626 - PLACE
      ?auto_8629 - SURFACE
      ?auto_8630 - PLACE
      ?auto_8631 - HOIST
      ?auto_8628 - SURFACE
      ?auto_8632 - TRUCK
      ?auto_8633 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8627 ?auto_8626 ) ( IS-CRATE ?auto_8625 ) ( not ( = ?auto_8624 ?auto_8625 ) ) ( not ( = ?auto_8629 ?auto_8624 ) ) ( not ( = ?auto_8629 ?auto_8625 ) ) ( not ( = ?auto_8630 ?auto_8626 ) ) ( HOIST-AT ?auto_8631 ?auto_8630 ) ( not ( = ?auto_8627 ?auto_8631 ) ) ( AVAILABLE ?auto_8631 ) ( SURFACE-AT ?auto_8625 ?auto_8630 ) ( ON ?auto_8625 ?auto_8628 ) ( CLEAR ?auto_8625 ) ( not ( = ?auto_8624 ?auto_8628 ) ) ( not ( = ?auto_8625 ?auto_8628 ) ) ( not ( = ?auto_8629 ?auto_8628 ) ) ( SURFACE-AT ?auto_8629 ?auto_8626 ) ( CLEAR ?auto_8629 ) ( IS-CRATE ?auto_8624 ) ( AVAILABLE ?auto_8627 ) ( IN ?auto_8624 ?auto_8632 ) ( TRUCK-AT ?auto_8632 ?auto_8633 ) ( not ( = ?auto_8633 ?auto_8626 ) ) ( not ( = ?auto_8630 ?auto_8633 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8632 ?auto_8633 ?auto_8626 )
      ( MAKE-2CRATE ?auto_8629 ?auto_8624 ?auto_8625 )
      ( MAKE-1CRATE-VERIFY ?auto_8624 ?auto_8625 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8634 - SURFACE
      ?auto_8635 - SURFACE
      ?auto_8636 - SURFACE
    )
    :vars
    (
      ?auto_8641 - HOIST
      ?auto_8639 - PLACE
      ?auto_8640 - PLACE
      ?auto_8643 - HOIST
      ?auto_8642 - SURFACE
      ?auto_8637 - TRUCK
      ?auto_8638 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8641 ?auto_8639 ) ( IS-CRATE ?auto_8636 ) ( not ( = ?auto_8635 ?auto_8636 ) ) ( not ( = ?auto_8634 ?auto_8635 ) ) ( not ( = ?auto_8634 ?auto_8636 ) ) ( not ( = ?auto_8640 ?auto_8639 ) ) ( HOIST-AT ?auto_8643 ?auto_8640 ) ( not ( = ?auto_8641 ?auto_8643 ) ) ( AVAILABLE ?auto_8643 ) ( SURFACE-AT ?auto_8636 ?auto_8640 ) ( ON ?auto_8636 ?auto_8642 ) ( CLEAR ?auto_8636 ) ( not ( = ?auto_8635 ?auto_8642 ) ) ( not ( = ?auto_8636 ?auto_8642 ) ) ( not ( = ?auto_8634 ?auto_8642 ) ) ( SURFACE-AT ?auto_8634 ?auto_8639 ) ( CLEAR ?auto_8634 ) ( IS-CRATE ?auto_8635 ) ( AVAILABLE ?auto_8641 ) ( IN ?auto_8635 ?auto_8637 ) ( TRUCK-AT ?auto_8637 ?auto_8638 ) ( not ( = ?auto_8638 ?auto_8639 ) ) ( not ( = ?auto_8640 ?auto_8638 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8635 ?auto_8636 )
      ( MAKE-2CRATE-VERIFY ?auto_8634 ?auto_8635 ?auto_8636 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8644 - SURFACE
      ?auto_8645 - SURFACE
      ?auto_8646 - SURFACE
      ?auto_8647 - SURFACE
    )
    :vars
    (
      ?auto_8654 - HOIST
      ?auto_8653 - PLACE
      ?auto_8650 - PLACE
      ?auto_8652 - HOIST
      ?auto_8649 - SURFACE
      ?auto_8651 - TRUCK
      ?auto_8648 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8654 ?auto_8653 ) ( IS-CRATE ?auto_8647 ) ( not ( = ?auto_8646 ?auto_8647 ) ) ( not ( = ?auto_8645 ?auto_8646 ) ) ( not ( = ?auto_8645 ?auto_8647 ) ) ( not ( = ?auto_8650 ?auto_8653 ) ) ( HOIST-AT ?auto_8652 ?auto_8650 ) ( not ( = ?auto_8654 ?auto_8652 ) ) ( AVAILABLE ?auto_8652 ) ( SURFACE-AT ?auto_8647 ?auto_8650 ) ( ON ?auto_8647 ?auto_8649 ) ( CLEAR ?auto_8647 ) ( not ( = ?auto_8646 ?auto_8649 ) ) ( not ( = ?auto_8647 ?auto_8649 ) ) ( not ( = ?auto_8645 ?auto_8649 ) ) ( SURFACE-AT ?auto_8645 ?auto_8653 ) ( CLEAR ?auto_8645 ) ( IS-CRATE ?auto_8646 ) ( AVAILABLE ?auto_8654 ) ( IN ?auto_8646 ?auto_8651 ) ( TRUCK-AT ?auto_8651 ?auto_8648 ) ( not ( = ?auto_8648 ?auto_8653 ) ) ( not ( = ?auto_8650 ?auto_8648 ) ) ( ON ?auto_8645 ?auto_8644 ) ( not ( = ?auto_8644 ?auto_8645 ) ) ( not ( = ?auto_8644 ?auto_8646 ) ) ( not ( = ?auto_8644 ?auto_8647 ) ) ( not ( = ?auto_8644 ?auto_8649 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8645 ?auto_8646 ?auto_8647 )
      ( MAKE-3CRATE-VERIFY ?auto_8644 ?auto_8645 ?auto_8646 ?auto_8647 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8655 - SURFACE
      ?auto_8656 - SURFACE
      ?auto_8657 - SURFACE
      ?auto_8658 - SURFACE
      ?auto_8659 - SURFACE
    )
    :vars
    (
      ?auto_8666 - HOIST
      ?auto_8665 - PLACE
      ?auto_8662 - PLACE
      ?auto_8664 - HOIST
      ?auto_8661 - SURFACE
      ?auto_8663 - TRUCK
      ?auto_8660 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8666 ?auto_8665 ) ( IS-CRATE ?auto_8659 ) ( not ( = ?auto_8658 ?auto_8659 ) ) ( not ( = ?auto_8657 ?auto_8658 ) ) ( not ( = ?auto_8657 ?auto_8659 ) ) ( not ( = ?auto_8662 ?auto_8665 ) ) ( HOIST-AT ?auto_8664 ?auto_8662 ) ( not ( = ?auto_8666 ?auto_8664 ) ) ( AVAILABLE ?auto_8664 ) ( SURFACE-AT ?auto_8659 ?auto_8662 ) ( ON ?auto_8659 ?auto_8661 ) ( CLEAR ?auto_8659 ) ( not ( = ?auto_8658 ?auto_8661 ) ) ( not ( = ?auto_8659 ?auto_8661 ) ) ( not ( = ?auto_8657 ?auto_8661 ) ) ( SURFACE-AT ?auto_8657 ?auto_8665 ) ( CLEAR ?auto_8657 ) ( IS-CRATE ?auto_8658 ) ( AVAILABLE ?auto_8666 ) ( IN ?auto_8658 ?auto_8663 ) ( TRUCK-AT ?auto_8663 ?auto_8660 ) ( not ( = ?auto_8660 ?auto_8665 ) ) ( not ( = ?auto_8662 ?auto_8660 ) ) ( ON ?auto_8656 ?auto_8655 ) ( ON ?auto_8657 ?auto_8656 ) ( not ( = ?auto_8655 ?auto_8656 ) ) ( not ( = ?auto_8655 ?auto_8657 ) ) ( not ( = ?auto_8655 ?auto_8658 ) ) ( not ( = ?auto_8655 ?auto_8659 ) ) ( not ( = ?auto_8655 ?auto_8661 ) ) ( not ( = ?auto_8656 ?auto_8657 ) ) ( not ( = ?auto_8656 ?auto_8658 ) ) ( not ( = ?auto_8656 ?auto_8659 ) ) ( not ( = ?auto_8656 ?auto_8661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8657 ?auto_8658 ?auto_8659 )
      ( MAKE-4CRATE-VERIFY ?auto_8655 ?auto_8656 ?auto_8657 ?auto_8658 ?auto_8659 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8667 - SURFACE
      ?auto_8668 - SURFACE
    )
    :vars
    (
      ?auto_8676 - HOIST
      ?auto_8675 - PLACE
      ?auto_8669 - SURFACE
      ?auto_8672 - PLACE
      ?auto_8674 - HOIST
      ?auto_8671 - SURFACE
      ?auto_8673 - TRUCK
      ?auto_8670 - PLACE
      ?auto_8677 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8676 ?auto_8675 ) ( IS-CRATE ?auto_8668 ) ( not ( = ?auto_8667 ?auto_8668 ) ) ( not ( = ?auto_8669 ?auto_8667 ) ) ( not ( = ?auto_8669 ?auto_8668 ) ) ( not ( = ?auto_8672 ?auto_8675 ) ) ( HOIST-AT ?auto_8674 ?auto_8672 ) ( not ( = ?auto_8676 ?auto_8674 ) ) ( AVAILABLE ?auto_8674 ) ( SURFACE-AT ?auto_8668 ?auto_8672 ) ( ON ?auto_8668 ?auto_8671 ) ( CLEAR ?auto_8668 ) ( not ( = ?auto_8667 ?auto_8671 ) ) ( not ( = ?auto_8668 ?auto_8671 ) ) ( not ( = ?auto_8669 ?auto_8671 ) ) ( SURFACE-AT ?auto_8669 ?auto_8675 ) ( CLEAR ?auto_8669 ) ( IS-CRATE ?auto_8667 ) ( AVAILABLE ?auto_8676 ) ( TRUCK-AT ?auto_8673 ?auto_8670 ) ( not ( = ?auto_8670 ?auto_8675 ) ) ( not ( = ?auto_8672 ?auto_8670 ) ) ( HOIST-AT ?auto_8677 ?auto_8670 ) ( LIFTING ?auto_8677 ?auto_8667 ) ( not ( = ?auto_8676 ?auto_8677 ) ) ( not ( = ?auto_8674 ?auto_8677 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8677 ?auto_8667 ?auto_8673 ?auto_8670 )
      ( MAKE-2CRATE ?auto_8669 ?auto_8667 ?auto_8668 )
      ( MAKE-1CRATE-VERIFY ?auto_8667 ?auto_8668 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8678 - SURFACE
      ?auto_8679 - SURFACE
      ?auto_8680 - SURFACE
    )
    :vars
    (
      ?auto_8684 - HOIST
      ?auto_8688 - PLACE
      ?auto_8685 - PLACE
      ?auto_8682 - HOIST
      ?auto_8681 - SURFACE
      ?auto_8683 - TRUCK
      ?auto_8687 - PLACE
      ?auto_8686 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8684 ?auto_8688 ) ( IS-CRATE ?auto_8680 ) ( not ( = ?auto_8679 ?auto_8680 ) ) ( not ( = ?auto_8678 ?auto_8679 ) ) ( not ( = ?auto_8678 ?auto_8680 ) ) ( not ( = ?auto_8685 ?auto_8688 ) ) ( HOIST-AT ?auto_8682 ?auto_8685 ) ( not ( = ?auto_8684 ?auto_8682 ) ) ( AVAILABLE ?auto_8682 ) ( SURFACE-AT ?auto_8680 ?auto_8685 ) ( ON ?auto_8680 ?auto_8681 ) ( CLEAR ?auto_8680 ) ( not ( = ?auto_8679 ?auto_8681 ) ) ( not ( = ?auto_8680 ?auto_8681 ) ) ( not ( = ?auto_8678 ?auto_8681 ) ) ( SURFACE-AT ?auto_8678 ?auto_8688 ) ( CLEAR ?auto_8678 ) ( IS-CRATE ?auto_8679 ) ( AVAILABLE ?auto_8684 ) ( TRUCK-AT ?auto_8683 ?auto_8687 ) ( not ( = ?auto_8687 ?auto_8688 ) ) ( not ( = ?auto_8685 ?auto_8687 ) ) ( HOIST-AT ?auto_8686 ?auto_8687 ) ( LIFTING ?auto_8686 ?auto_8679 ) ( not ( = ?auto_8684 ?auto_8686 ) ) ( not ( = ?auto_8682 ?auto_8686 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8679 ?auto_8680 )
      ( MAKE-2CRATE-VERIFY ?auto_8678 ?auto_8679 ?auto_8680 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8689 - SURFACE
      ?auto_8690 - SURFACE
      ?auto_8691 - SURFACE
      ?auto_8692 - SURFACE
    )
    :vars
    (
      ?auto_8693 - HOIST
      ?auto_8699 - PLACE
      ?auto_8700 - PLACE
      ?auto_8695 - HOIST
      ?auto_8694 - SURFACE
      ?auto_8698 - TRUCK
      ?auto_8697 - PLACE
      ?auto_8696 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8693 ?auto_8699 ) ( IS-CRATE ?auto_8692 ) ( not ( = ?auto_8691 ?auto_8692 ) ) ( not ( = ?auto_8690 ?auto_8691 ) ) ( not ( = ?auto_8690 ?auto_8692 ) ) ( not ( = ?auto_8700 ?auto_8699 ) ) ( HOIST-AT ?auto_8695 ?auto_8700 ) ( not ( = ?auto_8693 ?auto_8695 ) ) ( AVAILABLE ?auto_8695 ) ( SURFACE-AT ?auto_8692 ?auto_8700 ) ( ON ?auto_8692 ?auto_8694 ) ( CLEAR ?auto_8692 ) ( not ( = ?auto_8691 ?auto_8694 ) ) ( not ( = ?auto_8692 ?auto_8694 ) ) ( not ( = ?auto_8690 ?auto_8694 ) ) ( SURFACE-AT ?auto_8690 ?auto_8699 ) ( CLEAR ?auto_8690 ) ( IS-CRATE ?auto_8691 ) ( AVAILABLE ?auto_8693 ) ( TRUCK-AT ?auto_8698 ?auto_8697 ) ( not ( = ?auto_8697 ?auto_8699 ) ) ( not ( = ?auto_8700 ?auto_8697 ) ) ( HOIST-AT ?auto_8696 ?auto_8697 ) ( LIFTING ?auto_8696 ?auto_8691 ) ( not ( = ?auto_8693 ?auto_8696 ) ) ( not ( = ?auto_8695 ?auto_8696 ) ) ( ON ?auto_8690 ?auto_8689 ) ( not ( = ?auto_8689 ?auto_8690 ) ) ( not ( = ?auto_8689 ?auto_8691 ) ) ( not ( = ?auto_8689 ?auto_8692 ) ) ( not ( = ?auto_8689 ?auto_8694 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8690 ?auto_8691 ?auto_8692 )
      ( MAKE-3CRATE-VERIFY ?auto_8689 ?auto_8690 ?auto_8691 ?auto_8692 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8701 - SURFACE
      ?auto_8702 - SURFACE
      ?auto_8703 - SURFACE
      ?auto_8704 - SURFACE
      ?auto_8705 - SURFACE
    )
    :vars
    (
      ?auto_8706 - HOIST
      ?auto_8712 - PLACE
      ?auto_8713 - PLACE
      ?auto_8708 - HOIST
      ?auto_8707 - SURFACE
      ?auto_8711 - TRUCK
      ?auto_8710 - PLACE
      ?auto_8709 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8706 ?auto_8712 ) ( IS-CRATE ?auto_8705 ) ( not ( = ?auto_8704 ?auto_8705 ) ) ( not ( = ?auto_8703 ?auto_8704 ) ) ( not ( = ?auto_8703 ?auto_8705 ) ) ( not ( = ?auto_8713 ?auto_8712 ) ) ( HOIST-AT ?auto_8708 ?auto_8713 ) ( not ( = ?auto_8706 ?auto_8708 ) ) ( AVAILABLE ?auto_8708 ) ( SURFACE-AT ?auto_8705 ?auto_8713 ) ( ON ?auto_8705 ?auto_8707 ) ( CLEAR ?auto_8705 ) ( not ( = ?auto_8704 ?auto_8707 ) ) ( not ( = ?auto_8705 ?auto_8707 ) ) ( not ( = ?auto_8703 ?auto_8707 ) ) ( SURFACE-AT ?auto_8703 ?auto_8712 ) ( CLEAR ?auto_8703 ) ( IS-CRATE ?auto_8704 ) ( AVAILABLE ?auto_8706 ) ( TRUCK-AT ?auto_8711 ?auto_8710 ) ( not ( = ?auto_8710 ?auto_8712 ) ) ( not ( = ?auto_8713 ?auto_8710 ) ) ( HOIST-AT ?auto_8709 ?auto_8710 ) ( LIFTING ?auto_8709 ?auto_8704 ) ( not ( = ?auto_8706 ?auto_8709 ) ) ( not ( = ?auto_8708 ?auto_8709 ) ) ( ON ?auto_8702 ?auto_8701 ) ( ON ?auto_8703 ?auto_8702 ) ( not ( = ?auto_8701 ?auto_8702 ) ) ( not ( = ?auto_8701 ?auto_8703 ) ) ( not ( = ?auto_8701 ?auto_8704 ) ) ( not ( = ?auto_8701 ?auto_8705 ) ) ( not ( = ?auto_8701 ?auto_8707 ) ) ( not ( = ?auto_8702 ?auto_8703 ) ) ( not ( = ?auto_8702 ?auto_8704 ) ) ( not ( = ?auto_8702 ?auto_8705 ) ) ( not ( = ?auto_8702 ?auto_8707 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8703 ?auto_8704 ?auto_8705 )
      ( MAKE-4CRATE-VERIFY ?auto_8701 ?auto_8702 ?auto_8703 ?auto_8704 ?auto_8705 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8714 - SURFACE
      ?auto_8715 - SURFACE
    )
    :vars
    (
      ?auto_8716 - HOIST
      ?auto_8722 - PLACE
      ?auto_8723 - SURFACE
      ?auto_8724 - PLACE
      ?auto_8718 - HOIST
      ?auto_8717 - SURFACE
      ?auto_8721 - TRUCK
      ?auto_8720 - PLACE
      ?auto_8719 - HOIST
      ?auto_8725 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8716 ?auto_8722 ) ( IS-CRATE ?auto_8715 ) ( not ( = ?auto_8714 ?auto_8715 ) ) ( not ( = ?auto_8723 ?auto_8714 ) ) ( not ( = ?auto_8723 ?auto_8715 ) ) ( not ( = ?auto_8724 ?auto_8722 ) ) ( HOIST-AT ?auto_8718 ?auto_8724 ) ( not ( = ?auto_8716 ?auto_8718 ) ) ( AVAILABLE ?auto_8718 ) ( SURFACE-AT ?auto_8715 ?auto_8724 ) ( ON ?auto_8715 ?auto_8717 ) ( CLEAR ?auto_8715 ) ( not ( = ?auto_8714 ?auto_8717 ) ) ( not ( = ?auto_8715 ?auto_8717 ) ) ( not ( = ?auto_8723 ?auto_8717 ) ) ( SURFACE-AT ?auto_8723 ?auto_8722 ) ( CLEAR ?auto_8723 ) ( IS-CRATE ?auto_8714 ) ( AVAILABLE ?auto_8716 ) ( TRUCK-AT ?auto_8721 ?auto_8720 ) ( not ( = ?auto_8720 ?auto_8722 ) ) ( not ( = ?auto_8724 ?auto_8720 ) ) ( HOIST-AT ?auto_8719 ?auto_8720 ) ( not ( = ?auto_8716 ?auto_8719 ) ) ( not ( = ?auto_8718 ?auto_8719 ) ) ( AVAILABLE ?auto_8719 ) ( SURFACE-AT ?auto_8714 ?auto_8720 ) ( ON ?auto_8714 ?auto_8725 ) ( CLEAR ?auto_8714 ) ( not ( = ?auto_8714 ?auto_8725 ) ) ( not ( = ?auto_8715 ?auto_8725 ) ) ( not ( = ?auto_8723 ?auto_8725 ) ) ( not ( = ?auto_8717 ?auto_8725 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8719 ?auto_8714 ?auto_8725 ?auto_8720 )
      ( MAKE-2CRATE ?auto_8723 ?auto_8714 ?auto_8715 )
      ( MAKE-1CRATE-VERIFY ?auto_8714 ?auto_8715 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8726 - SURFACE
      ?auto_8727 - SURFACE
      ?auto_8728 - SURFACE
    )
    :vars
    (
      ?auto_8731 - HOIST
      ?auto_8736 - PLACE
      ?auto_8732 - PLACE
      ?auto_8733 - HOIST
      ?auto_8734 - SURFACE
      ?auto_8735 - TRUCK
      ?auto_8737 - PLACE
      ?auto_8730 - HOIST
      ?auto_8729 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8731 ?auto_8736 ) ( IS-CRATE ?auto_8728 ) ( not ( = ?auto_8727 ?auto_8728 ) ) ( not ( = ?auto_8726 ?auto_8727 ) ) ( not ( = ?auto_8726 ?auto_8728 ) ) ( not ( = ?auto_8732 ?auto_8736 ) ) ( HOIST-AT ?auto_8733 ?auto_8732 ) ( not ( = ?auto_8731 ?auto_8733 ) ) ( AVAILABLE ?auto_8733 ) ( SURFACE-AT ?auto_8728 ?auto_8732 ) ( ON ?auto_8728 ?auto_8734 ) ( CLEAR ?auto_8728 ) ( not ( = ?auto_8727 ?auto_8734 ) ) ( not ( = ?auto_8728 ?auto_8734 ) ) ( not ( = ?auto_8726 ?auto_8734 ) ) ( SURFACE-AT ?auto_8726 ?auto_8736 ) ( CLEAR ?auto_8726 ) ( IS-CRATE ?auto_8727 ) ( AVAILABLE ?auto_8731 ) ( TRUCK-AT ?auto_8735 ?auto_8737 ) ( not ( = ?auto_8737 ?auto_8736 ) ) ( not ( = ?auto_8732 ?auto_8737 ) ) ( HOIST-AT ?auto_8730 ?auto_8737 ) ( not ( = ?auto_8731 ?auto_8730 ) ) ( not ( = ?auto_8733 ?auto_8730 ) ) ( AVAILABLE ?auto_8730 ) ( SURFACE-AT ?auto_8727 ?auto_8737 ) ( ON ?auto_8727 ?auto_8729 ) ( CLEAR ?auto_8727 ) ( not ( = ?auto_8727 ?auto_8729 ) ) ( not ( = ?auto_8728 ?auto_8729 ) ) ( not ( = ?auto_8726 ?auto_8729 ) ) ( not ( = ?auto_8734 ?auto_8729 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8727 ?auto_8728 )
      ( MAKE-2CRATE-VERIFY ?auto_8726 ?auto_8727 ?auto_8728 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8738 - SURFACE
      ?auto_8739 - SURFACE
      ?auto_8740 - SURFACE
      ?auto_8741 - SURFACE
    )
    :vars
    (
      ?auto_8750 - HOIST
      ?auto_8748 - PLACE
      ?auto_8743 - PLACE
      ?auto_8744 - HOIST
      ?auto_8749 - SURFACE
      ?auto_8747 - TRUCK
      ?auto_8742 - PLACE
      ?auto_8745 - HOIST
      ?auto_8746 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8750 ?auto_8748 ) ( IS-CRATE ?auto_8741 ) ( not ( = ?auto_8740 ?auto_8741 ) ) ( not ( = ?auto_8739 ?auto_8740 ) ) ( not ( = ?auto_8739 ?auto_8741 ) ) ( not ( = ?auto_8743 ?auto_8748 ) ) ( HOIST-AT ?auto_8744 ?auto_8743 ) ( not ( = ?auto_8750 ?auto_8744 ) ) ( AVAILABLE ?auto_8744 ) ( SURFACE-AT ?auto_8741 ?auto_8743 ) ( ON ?auto_8741 ?auto_8749 ) ( CLEAR ?auto_8741 ) ( not ( = ?auto_8740 ?auto_8749 ) ) ( not ( = ?auto_8741 ?auto_8749 ) ) ( not ( = ?auto_8739 ?auto_8749 ) ) ( SURFACE-AT ?auto_8739 ?auto_8748 ) ( CLEAR ?auto_8739 ) ( IS-CRATE ?auto_8740 ) ( AVAILABLE ?auto_8750 ) ( TRUCK-AT ?auto_8747 ?auto_8742 ) ( not ( = ?auto_8742 ?auto_8748 ) ) ( not ( = ?auto_8743 ?auto_8742 ) ) ( HOIST-AT ?auto_8745 ?auto_8742 ) ( not ( = ?auto_8750 ?auto_8745 ) ) ( not ( = ?auto_8744 ?auto_8745 ) ) ( AVAILABLE ?auto_8745 ) ( SURFACE-AT ?auto_8740 ?auto_8742 ) ( ON ?auto_8740 ?auto_8746 ) ( CLEAR ?auto_8740 ) ( not ( = ?auto_8740 ?auto_8746 ) ) ( not ( = ?auto_8741 ?auto_8746 ) ) ( not ( = ?auto_8739 ?auto_8746 ) ) ( not ( = ?auto_8749 ?auto_8746 ) ) ( ON ?auto_8739 ?auto_8738 ) ( not ( = ?auto_8738 ?auto_8739 ) ) ( not ( = ?auto_8738 ?auto_8740 ) ) ( not ( = ?auto_8738 ?auto_8741 ) ) ( not ( = ?auto_8738 ?auto_8749 ) ) ( not ( = ?auto_8738 ?auto_8746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8739 ?auto_8740 ?auto_8741 )
      ( MAKE-3CRATE-VERIFY ?auto_8738 ?auto_8739 ?auto_8740 ?auto_8741 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8751 - SURFACE
      ?auto_8752 - SURFACE
      ?auto_8753 - SURFACE
      ?auto_8754 - SURFACE
      ?auto_8755 - SURFACE
    )
    :vars
    (
      ?auto_8764 - HOIST
      ?auto_8762 - PLACE
      ?auto_8757 - PLACE
      ?auto_8758 - HOIST
      ?auto_8763 - SURFACE
      ?auto_8761 - TRUCK
      ?auto_8756 - PLACE
      ?auto_8759 - HOIST
      ?auto_8760 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8764 ?auto_8762 ) ( IS-CRATE ?auto_8755 ) ( not ( = ?auto_8754 ?auto_8755 ) ) ( not ( = ?auto_8753 ?auto_8754 ) ) ( not ( = ?auto_8753 ?auto_8755 ) ) ( not ( = ?auto_8757 ?auto_8762 ) ) ( HOIST-AT ?auto_8758 ?auto_8757 ) ( not ( = ?auto_8764 ?auto_8758 ) ) ( AVAILABLE ?auto_8758 ) ( SURFACE-AT ?auto_8755 ?auto_8757 ) ( ON ?auto_8755 ?auto_8763 ) ( CLEAR ?auto_8755 ) ( not ( = ?auto_8754 ?auto_8763 ) ) ( not ( = ?auto_8755 ?auto_8763 ) ) ( not ( = ?auto_8753 ?auto_8763 ) ) ( SURFACE-AT ?auto_8753 ?auto_8762 ) ( CLEAR ?auto_8753 ) ( IS-CRATE ?auto_8754 ) ( AVAILABLE ?auto_8764 ) ( TRUCK-AT ?auto_8761 ?auto_8756 ) ( not ( = ?auto_8756 ?auto_8762 ) ) ( not ( = ?auto_8757 ?auto_8756 ) ) ( HOIST-AT ?auto_8759 ?auto_8756 ) ( not ( = ?auto_8764 ?auto_8759 ) ) ( not ( = ?auto_8758 ?auto_8759 ) ) ( AVAILABLE ?auto_8759 ) ( SURFACE-AT ?auto_8754 ?auto_8756 ) ( ON ?auto_8754 ?auto_8760 ) ( CLEAR ?auto_8754 ) ( not ( = ?auto_8754 ?auto_8760 ) ) ( not ( = ?auto_8755 ?auto_8760 ) ) ( not ( = ?auto_8753 ?auto_8760 ) ) ( not ( = ?auto_8763 ?auto_8760 ) ) ( ON ?auto_8752 ?auto_8751 ) ( ON ?auto_8753 ?auto_8752 ) ( not ( = ?auto_8751 ?auto_8752 ) ) ( not ( = ?auto_8751 ?auto_8753 ) ) ( not ( = ?auto_8751 ?auto_8754 ) ) ( not ( = ?auto_8751 ?auto_8755 ) ) ( not ( = ?auto_8751 ?auto_8763 ) ) ( not ( = ?auto_8751 ?auto_8760 ) ) ( not ( = ?auto_8752 ?auto_8753 ) ) ( not ( = ?auto_8752 ?auto_8754 ) ) ( not ( = ?auto_8752 ?auto_8755 ) ) ( not ( = ?auto_8752 ?auto_8763 ) ) ( not ( = ?auto_8752 ?auto_8760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8753 ?auto_8754 ?auto_8755 )
      ( MAKE-4CRATE-VERIFY ?auto_8751 ?auto_8752 ?auto_8753 ?auto_8754 ?auto_8755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8765 - SURFACE
      ?auto_8766 - SURFACE
    )
    :vars
    (
      ?auto_8776 - HOIST
      ?auto_8774 - PLACE
      ?auto_8767 - SURFACE
      ?auto_8769 - PLACE
      ?auto_8770 - HOIST
      ?auto_8775 - SURFACE
      ?auto_8768 - PLACE
      ?auto_8771 - HOIST
      ?auto_8772 - SURFACE
      ?auto_8773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8776 ?auto_8774 ) ( IS-CRATE ?auto_8766 ) ( not ( = ?auto_8765 ?auto_8766 ) ) ( not ( = ?auto_8767 ?auto_8765 ) ) ( not ( = ?auto_8767 ?auto_8766 ) ) ( not ( = ?auto_8769 ?auto_8774 ) ) ( HOIST-AT ?auto_8770 ?auto_8769 ) ( not ( = ?auto_8776 ?auto_8770 ) ) ( AVAILABLE ?auto_8770 ) ( SURFACE-AT ?auto_8766 ?auto_8769 ) ( ON ?auto_8766 ?auto_8775 ) ( CLEAR ?auto_8766 ) ( not ( = ?auto_8765 ?auto_8775 ) ) ( not ( = ?auto_8766 ?auto_8775 ) ) ( not ( = ?auto_8767 ?auto_8775 ) ) ( SURFACE-AT ?auto_8767 ?auto_8774 ) ( CLEAR ?auto_8767 ) ( IS-CRATE ?auto_8765 ) ( AVAILABLE ?auto_8776 ) ( not ( = ?auto_8768 ?auto_8774 ) ) ( not ( = ?auto_8769 ?auto_8768 ) ) ( HOIST-AT ?auto_8771 ?auto_8768 ) ( not ( = ?auto_8776 ?auto_8771 ) ) ( not ( = ?auto_8770 ?auto_8771 ) ) ( AVAILABLE ?auto_8771 ) ( SURFACE-AT ?auto_8765 ?auto_8768 ) ( ON ?auto_8765 ?auto_8772 ) ( CLEAR ?auto_8765 ) ( not ( = ?auto_8765 ?auto_8772 ) ) ( not ( = ?auto_8766 ?auto_8772 ) ) ( not ( = ?auto_8767 ?auto_8772 ) ) ( not ( = ?auto_8775 ?auto_8772 ) ) ( TRUCK-AT ?auto_8773 ?auto_8774 ) )
    :subtasks
    ( ( !DRIVE ?auto_8773 ?auto_8774 ?auto_8768 )
      ( MAKE-2CRATE ?auto_8767 ?auto_8765 ?auto_8766 )
      ( MAKE-1CRATE-VERIFY ?auto_8765 ?auto_8766 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8777 - SURFACE
      ?auto_8778 - SURFACE
      ?auto_8779 - SURFACE
    )
    :vars
    (
      ?auto_8782 - HOIST
      ?auto_8788 - PLACE
      ?auto_8780 - PLACE
      ?auto_8787 - HOIST
      ?auto_8784 - SURFACE
      ?auto_8781 - PLACE
      ?auto_8785 - HOIST
      ?auto_8786 - SURFACE
      ?auto_8783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8782 ?auto_8788 ) ( IS-CRATE ?auto_8779 ) ( not ( = ?auto_8778 ?auto_8779 ) ) ( not ( = ?auto_8777 ?auto_8778 ) ) ( not ( = ?auto_8777 ?auto_8779 ) ) ( not ( = ?auto_8780 ?auto_8788 ) ) ( HOIST-AT ?auto_8787 ?auto_8780 ) ( not ( = ?auto_8782 ?auto_8787 ) ) ( AVAILABLE ?auto_8787 ) ( SURFACE-AT ?auto_8779 ?auto_8780 ) ( ON ?auto_8779 ?auto_8784 ) ( CLEAR ?auto_8779 ) ( not ( = ?auto_8778 ?auto_8784 ) ) ( not ( = ?auto_8779 ?auto_8784 ) ) ( not ( = ?auto_8777 ?auto_8784 ) ) ( SURFACE-AT ?auto_8777 ?auto_8788 ) ( CLEAR ?auto_8777 ) ( IS-CRATE ?auto_8778 ) ( AVAILABLE ?auto_8782 ) ( not ( = ?auto_8781 ?auto_8788 ) ) ( not ( = ?auto_8780 ?auto_8781 ) ) ( HOIST-AT ?auto_8785 ?auto_8781 ) ( not ( = ?auto_8782 ?auto_8785 ) ) ( not ( = ?auto_8787 ?auto_8785 ) ) ( AVAILABLE ?auto_8785 ) ( SURFACE-AT ?auto_8778 ?auto_8781 ) ( ON ?auto_8778 ?auto_8786 ) ( CLEAR ?auto_8778 ) ( not ( = ?auto_8778 ?auto_8786 ) ) ( not ( = ?auto_8779 ?auto_8786 ) ) ( not ( = ?auto_8777 ?auto_8786 ) ) ( not ( = ?auto_8784 ?auto_8786 ) ) ( TRUCK-AT ?auto_8783 ?auto_8788 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8778 ?auto_8779 )
      ( MAKE-2CRATE-VERIFY ?auto_8777 ?auto_8778 ?auto_8779 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8789 - SURFACE
      ?auto_8790 - SURFACE
      ?auto_8791 - SURFACE
      ?auto_8792 - SURFACE
    )
    :vars
    (
      ?auto_8800 - HOIST
      ?auto_8798 - PLACE
      ?auto_8794 - PLACE
      ?auto_8799 - HOIST
      ?auto_8796 - SURFACE
      ?auto_8795 - PLACE
      ?auto_8801 - HOIST
      ?auto_8793 - SURFACE
      ?auto_8797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8800 ?auto_8798 ) ( IS-CRATE ?auto_8792 ) ( not ( = ?auto_8791 ?auto_8792 ) ) ( not ( = ?auto_8790 ?auto_8791 ) ) ( not ( = ?auto_8790 ?auto_8792 ) ) ( not ( = ?auto_8794 ?auto_8798 ) ) ( HOIST-AT ?auto_8799 ?auto_8794 ) ( not ( = ?auto_8800 ?auto_8799 ) ) ( AVAILABLE ?auto_8799 ) ( SURFACE-AT ?auto_8792 ?auto_8794 ) ( ON ?auto_8792 ?auto_8796 ) ( CLEAR ?auto_8792 ) ( not ( = ?auto_8791 ?auto_8796 ) ) ( not ( = ?auto_8792 ?auto_8796 ) ) ( not ( = ?auto_8790 ?auto_8796 ) ) ( SURFACE-AT ?auto_8790 ?auto_8798 ) ( CLEAR ?auto_8790 ) ( IS-CRATE ?auto_8791 ) ( AVAILABLE ?auto_8800 ) ( not ( = ?auto_8795 ?auto_8798 ) ) ( not ( = ?auto_8794 ?auto_8795 ) ) ( HOIST-AT ?auto_8801 ?auto_8795 ) ( not ( = ?auto_8800 ?auto_8801 ) ) ( not ( = ?auto_8799 ?auto_8801 ) ) ( AVAILABLE ?auto_8801 ) ( SURFACE-AT ?auto_8791 ?auto_8795 ) ( ON ?auto_8791 ?auto_8793 ) ( CLEAR ?auto_8791 ) ( not ( = ?auto_8791 ?auto_8793 ) ) ( not ( = ?auto_8792 ?auto_8793 ) ) ( not ( = ?auto_8790 ?auto_8793 ) ) ( not ( = ?auto_8796 ?auto_8793 ) ) ( TRUCK-AT ?auto_8797 ?auto_8798 ) ( ON ?auto_8790 ?auto_8789 ) ( not ( = ?auto_8789 ?auto_8790 ) ) ( not ( = ?auto_8789 ?auto_8791 ) ) ( not ( = ?auto_8789 ?auto_8792 ) ) ( not ( = ?auto_8789 ?auto_8796 ) ) ( not ( = ?auto_8789 ?auto_8793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8790 ?auto_8791 ?auto_8792 )
      ( MAKE-3CRATE-VERIFY ?auto_8789 ?auto_8790 ?auto_8791 ?auto_8792 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8802 - SURFACE
      ?auto_8803 - SURFACE
      ?auto_8804 - SURFACE
      ?auto_8805 - SURFACE
      ?auto_8806 - SURFACE
    )
    :vars
    (
      ?auto_8814 - HOIST
      ?auto_8812 - PLACE
      ?auto_8808 - PLACE
      ?auto_8813 - HOIST
      ?auto_8810 - SURFACE
      ?auto_8809 - PLACE
      ?auto_8815 - HOIST
      ?auto_8807 - SURFACE
      ?auto_8811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8814 ?auto_8812 ) ( IS-CRATE ?auto_8806 ) ( not ( = ?auto_8805 ?auto_8806 ) ) ( not ( = ?auto_8804 ?auto_8805 ) ) ( not ( = ?auto_8804 ?auto_8806 ) ) ( not ( = ?auto_8808 ?auto_8812 ) ) ( HOIST-AT ?auto_8813 ?auto_8808 ) ( not ( = ?auto_8814 ?auto_8813 ) ) ( AVAILABLE ?auto_8813 ) ( SURFACE-AT ?auto_8806 ?auto_8808 ) ( ON ?auto_8806 ?auto_8810 ) ( CLEAR ?auto_8806 ) ( not ( = ?auto_8805 ?auto_8810 ) ) ( not ( = ?auto_8806 ?auto_8810 ) ) ( not ( = ?auto_8804 ?auto_8810 ) ) ( SURFACE-AT ?auto_8804 ?auto_8812 ) ( CLEAR ?auto_8804 ) ( IS-CRATE ?auto_8805 ) ( AVAILABLE ?auto_8814 ) ( not ( = ?auto_8809 ?auto_8812 ) ) ( not ( = ?auto_8808 ?auto_8809 ) ) ( HOIST-AT ?auto_8815 ?auto_8809 ) ( not ( = ?auto_8814 ?auto_8815 ) ) ( not ( = ?auto_8813 ?auto_8815 ) ) ( AVAILABLE ?auto_8815 ) ( SURFACE-AT ?auto_8805 ?auto_8809 ) ( ON ?auto_8805 ?auto_8807 ) ( CLEAR ?auto_8805 ) ( not ( = ?auto_8805 ?auto_8807 ) ) ( not ( = ?auto_8806 ?auto_8807 ) ) ( not ( = ?auto_8804 ?auto_8807 ) ) ( not ( = ?auto_8810 ?auto_8807 ) ) ( TRUCK-AT ?auto_8811 ?auto_8812 ) ( ON ?auto_8803 ?auto_8802 ) ( ON ?auto_8804 ?auto_8803 ) ( not ( = ?auto_8802 ?auto_8803 ) ) ( not ( = ?auto_8802 ?auto_8804 ) ) ( not ( = ?auto_8802 ?auto_8805 ) ) ( not ( = ?auto_8802 ?auto_8806 ) ) ( not ( = ?auto_8802 ?auto_8810 ) ) ( not ( = ?auto_8802 ?auto_8807 ) ) ( not ( = ?auto_8803 ?auto_8804 ) ) ( not ( = ?auto_8803 ?auto_8805 ) ) ( not ( = ?auto_8803 ?auto_8806 ) ) ( not ( = ?auto_8803 ?auto_8810 ) ) ( not ( = ?auto_8803 ?auto_8807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8804 ?auto_8805 ?auto_8806 )
      ( MAKE-4CRATE-VERIFY ?auto_8802 ?auto_8803 ?auto_8804 ?auto_8805 ?auto_8806 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8816 - SURFACE
      ?auto_8817 - SURFACE
    )
    :vars
    (
      ?auto_8825 - HOIST
      ?auto_8823 - PLACE
      ?auto_8826 - SURFACE
      ?auto_8819 - PLACE
      ?auto_8824 - HOIST
      ?auto_8821 - SURFACE
      ?auto_8820 - PLACE
      ?auto_8827 - HOIST
      ?auto_8818 - SURFACE
      ?auto_8822 - TRUCK
      ?auto_8828 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8825 ?auto_8823 ) ( IS-CRATE ?auto_8817 ) ( not ( = ?auto_8816 ?auto_8817 ) ) ( not ( = ?auto_8826 ?auto_8816 ) ) ( not ( = ?auto_8826 ?auto_8817 ) ) ( not ( = ?auto_8819 ?auto_8823 ) ) ( HOIST-AT ?auto_8824 ?auto_8819 ) ( not ( = ?auto_8825 ?auto_8824 ) ) ( AVAILABLE ?auto_8824 ) ( SURFACE-AT ?auto_8817 ?auto_8819 ) ( ON ?auto_8817 ?auto_8821 ) ( CLEAR ?auto_8817 ) ( not ( = ?auto_8816 ?auto_8821 ) ) ( not ( = ?auto_8817 ?auto_8821 ) ) ( not ( = ?auto_8826 ?auto_8821 ) ) ( IS-CRATE ?auto_8816 ) ( not ( = ?auto_8820 ?auto_8823 ) ) ( not ( = ?auto_8819 ?auto_8820 ) ) ( HOIST-AT ?auto_8827 ?auto_8820 ) ( not ( = ?auto_8825 ?auto_8827 ) ) ( not ( = ?auto_8824 ?auto_8827 ) ) ( AVAILABLE ?auto_8827 ) ( SURFACE-AT ?auto_8816 ?auto_8820 ) ( ON ?auto_8816 ?auto_8818 ) ( CLEAR ?auto_8816 ) ( not ( = ?auto_8816 ?auto_8818 ) ) ( not ( = ?auto_8817 ?auto_8818 ) ) ( not ( = ?auto_8826 ?auto_8818 ) ) ( not ( = ?auto_8821 ?auto_8818 ) ) ( TRUCK-AT ?auto_8822 ?auto_8823 ) ( SURFACE-AT ?auto_8828 ?auto_8823 ) ( CLEAR ?auto_8828 ) ( LIFTING ?auto_8825 ?auto_8826 ) ( IS-CRATE ?auto_8826 ) ( not ( = ?auto_8828 ?auto_8826 ) ) ( not ( = ?auto_8816 ?auto_8828 ) ) ( not ( = ?auto_8817 ?auto_8828 ) ) ( not ( = ?auto_8821 ?auto_8828 ) ) ( not ( = ?auto_8818 ?auto_8828 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8828 ?auto_8826 )
      ( MAKE-2CRATE ?auto_8826 ?auto_8816 ?auto_8817 )
      ( MAKE-1CRATE-VERIFY ?auto_8816 ?auto_8817 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8829 - SURFACE
      ?auto_8830 - SURFACE
      ?auto_8831 - SURFACE
    )
    :vars
    (
      ?auto_8834 - HOIST
      ?auto_8833 - PLACE
      ?auto_8840 - PLACE
      ?auto_8836 - HOIST
      ?auto_8839 - SURFACE
      ?auto_8838 - PLACE
      ?auto_8835 - HOIST
      ?auto_8841 - SURFACE
      ?auto_8837 - TRUCK
      ?auto_8832 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8834 ?auto_8833 ) ( IS-CRATE ?auto_8831 ) ( not ( = ?auto_8830 ?auto_8831 ) ) ( not ( = ?auto_8829 ?auto_8830 ) ) ( not ( = ?auto_8829 ?auto_8831 ) ) ( not ( = ?auto_8840 ?auto_8833 ) ) ( HOIST-AT ?auto_8836 ?auto_8840 ) ( not ( = ?auto_8834 ?auto_8836 ) ) ( AVAILABLE ?auto_8836 ) ( SURFACE-AT ?auto_8831 ?auto_8840 ) ( ON ?auto_8831 ?auto_8839 ) ( CLEAR ?auto_8831 ) ( not ( = ?auto_8830 ?auto_8839 ) ) ( not ( = ?auto_8831 ?auto_8839 ) ) ( not ( = ?auto_8829 ?auto_8839 ) ) ( IS-CRATE ?auto_8830 ) ( not ( = ?auto_8838 ?auto_8833 ) ) ( not ( = ?auto_8840 ?auto_8838 ) ) ( HOIST-AT ?auto_8835 ?auto_8838 ) ( not ( = ?auto_8834 ?auto_8835 ) ) ( not ( = ?auto_8836 ?auto_8835 ) ) ( AVAILABLE ?auto_8835 ) ( SURFACE-AT ?auto_8830 ?auto_8838 ) ( ON ?auto_8830 ?auto_8841 ) ( CLEAR ?auto_8830 ) ( not ( = ?auto_8830 ?auto_8841 ) ) ( not ( = ?auto_8831 ?auto_8841 ) ) ( not ( = ?auto_8829 ?auto_8841 ) ) ( not ( = ?auto_8839 ?auto_8841 ) ) ( TRUCK-AT ?auto_8837 ?auto_8833 ) ( SURFACE-AT ?auto_8832 ?auto_8833 ) ( CLEAR ?auto_8832 ) ( LIFTING ?auto_8834 ?auto_8829 ) ( IS-CRATE ?auto_8829 ) ( not ( = ?auto_8832 ?auto_8829 ) ) ( not ( = ?auto_8830 ?auto_8832 ) ) ( not ( = ?auto_8831 ?auto_8832 ) ) ( not ( = ?auto_8839 ?auto_8832 ) ) ( not ( = ?auto_8841 ?auto_8832 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8830 ?auto_8831 )
      ( MAKE-2CRATE-VERIFY ?auto_8829 ?auto_8830 ?auto_8831 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8842 - SURFACE
      ?auto_8843 - SURFACE
      ?auto_8844 - SURFACE
      ?auto_8845 - SURFACE
    )
    :vars
    (
      ?auto_8854 - HOIST
      ?auto_8850 - PLACE
      ?auto_8847 - PLACE
      ?auto_8851 - HOIST
      ?auto_8853 - SURFACE
      ?auto_8852 - PLACE
      ?auto_8848 - HOIST
      ?auto_8846 - SURFACE
      ?auto_8849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8854 ?auto_8850 ) ( IS-CRATE ?auto_8845 ) ( not ( = ?auto_8844 ?auto_8845 ) ) ( not ( = ?auto_8843 ?auto_8844 ) ) ( not ( = ?auto_8843 ?auto_8845 ) ) ( not ( = ?auto_8847 ?auto_8850 ) ) ( HOIST-AT ?auto_8851 ?auto_8847 ) ( not ( = ?auto_8854 ?auto_8851 ) ) ( AVAILABLE ?auto_8851 ) ( SURFACE-AT ?auto_8845 ?auto_8847 ) ( ON ?auto_8845 ?auto_8853 ) ( CLEAR ?auto_8845 ) ( not ( = ?auto_8844 ?auto_8853 ) ) ( not ( = ?auto_8845 ?auto_8853 ) ) ( not ( = ?auto_8843 ?auto_8853 ) ) ( IS-CRATE ?auto_8844 ) ( not ( = ?auto_8852 ?auto_8850 ) ) ( not ( = ?auto_8847 ?auto_8852 ) ) ( HOIST-AT ?auto_8848 ?auto_8852 ) ( not ( = ?auto_8854 ?auto_8848 ) ) ( not ( = ?auto_8851 ?auto_8848 ) ) ( AVAILABLE ?auto_8848 ) ( SURFACE-AT ?auto_8844 ?auto_8852 ) ( ON ?auto_8844 ?auto_8846 ) ( CLEAR ?auto_8844 ) ( not ( = ?auto_8844 ?auto_8846 ) ) ( not ( = ?auto_8845 ?auto_8846 ) ) ( not ( = ?auto_8843 ?auto_8846 ) ) ( not ( = ?auto_8853 ?auto_8846 ) ) ( TRUCK-AT ?auto_8849 ?auto_8850 ) ( SURFACE-AT ?auto_8842 ?auto_8850 ) ( CLEAR ?auto_8842 ) ( LIFTING ?auto_8854 ?auto_8843 ) ( IS-CRATE ?auto_8843 ) ( not ( = ?auto_8842 ?auto_8843 ) ) ( not ( = ?auto_8844 ?auto_8842 ) ) ( not ( = ?auto_8845 ?auto_8842 ) ) ( not ( = ?auto_8853 ?auto_8842 ) ) ( not ( = ?auto_8846 ?auto_8842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8843 ?auto_8844 ?auto_8845 )
      ( MAKE-3CRATE-VERIFY ?auto_8842 ?auto_8843 ?auto_8844 ?auto_8845 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8855 - SURFACE
      ?auto_8856 - SURFACE
      ?auto_8857 - SURFACE
      ?auto_8858 - SURFACE
      ?auto_8859 - SURFACE
    )
    :vars
    (
      ?auto_8868 - HOIST
      ?auto_8864 - PLACE
      ?auto_8861 - PLACE
      ?auto_8865 - HOIST
      ?auto_8867 - SURFACE
      ?auto_8866 - PLACE
      ?auto_8862 - HOIST
      ?auto_8860 - SURFACE
      ?auto_8863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8868 ?auto_8864 ) ( IS-CRATE ?auto_8859 ) ( not ( = ?auto_8858 ?auto_8859 ) ) ( not ( = ?auto_8857 ?auto_8858 ) ) ( not ( = ?auto_8857 ?auto_8859 ) ) ( not ( = ?auto_8861 ?auto_8864 ) ) ( HOIST-AT ?auto_8865 ?auto_8861 ) ( not ( = ?auto_8868 ?auto_8865 ) ) ( AVAILABLE ?auto_8865 ) ( SURFACE-AT ?auto_8859 ?auto_8861 ) ( ON ?auto_8859 ?auto_8867 ) ( CLEAR ?auto_8859 ) ( not ( = ?auto_8858 ?auto_8867 ) ) ( not ( = ?auto_8859 ?auto_8867 ) ) ( not ( = ?auto_8857 ?auto_8867 ) ) ( IS-CRATE ?auto_8858 ) ( not ( = ?auto_8866 ?auto_8864 ) ) ( not ( = ?auto_8861 ?auto_8866 ) ) ( HOIST-AT ?auto_8862 ?auto_8866 ) ( not ( = ?auto_8868 ?auto_8862 ) ) ( not ( = ?auto_8865 ?auto_8862 ) ) ( AVAILABLE ?auto_8862 ) ( SURFACE-AT ?auto_8858 ?auto_8866 ) ( ON ?auto_8858 ?auto_8860 ) ( CLEAR ?auto_8858 ) ( not ( = ?auto_8858 ?auto_8860 ) ) ( not ( = ?auto_8859 ?auto_8860 ) ) ( not ( = ?auto_8857 ?auto_8860 ) ) ( not ( = ?auto_8867 ?auto_8860 ) ) ( TRUCK-AT ?auto_8863 ?auto_8864 ) ( SURFACE-AT ?auto_8856 ?auto_8864 ) ( CLEAR ?auto_8856 ) ( LIFTING ?auto_8868 ?auto_8857 ) ( IS-CRATE ?auto_8857 ) ( not ( = ?auto_8856 ?auto_8857 ) ) ( not ( = ?auto_8858 ?auto_8856 ) ) ( not ( = ?auto_8859 ?auto_8856 ) ) ( not ( = ?auto_8867 ?auto_8856 ) ) ( not ( = ?auto_8860 ?auto_8856 ) ) ( ON ?auto_8856 ?auto_8855 ) ( not ( = ?auto_8855 ?auto_8856 ) ) ( not ( = ?auto_8855 ?auto_8857 ) ) ( not ( = ?auto_8855 ?auto_8858 ) ) ( not ( = ?auto_8855 ?auto_8859 ) ) ( not ( = ?auto_8855 ?auto_8867 ) ) ( not ( = ?auto_8855 ?auto_8860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8857 ?auto_8858 ?auto_8859 )
      ( MAKE-4CRATE-VERIFY ?auto_8855 ?auto_8856 ?auto_8857 ?auto_8858 ?auto_8859 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8869 - SURFACE
      ?auto_8870 - SURFACE
    )
    :vars
    (
      ?auto_8881 - HOIST
      ?auto_8877 - PLACE
      ?auto_8871 - SURFACE
      ?auto_8873 - PLACE
      ?auto_8878 - HOIST
      ?auto_8880 - SURFACE
      ?auto_8879 - PLACE
      ?auto_8875 - HOIST
      ?auto_8872 - SURFACE
      ?auto_8876 - TRUCK
      ?auto_8874 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8881 ?auto_8877 ) ( IS-CRATE ?auto_8870 ) ( not ( = ?auto_8869 ?auto_8870 ) ) ( not ( = ?auto_8871 ?auto_8869 ) ) ( not ( = ?auto_8871 ?auto_8870 ) ) ( not ( = ?auto_8873 ?auto_8877 ) ) ( HOIST-AT ?auto_8878 ?auto_8873 ) ( not ( = ?auto_8881 ?auto_8878 ) ) ( AVAILABLE ?auto_8878 ) ( SURFACE-AT ?auto_8870 ?auto_8873 ) ( ON ?auto_8870 ?auto_8880 ) ( CLEAR ?auto_8870 ) ( not ( = ?auto_8869 ?auto_8880 ) ) ( not ( = ?auto_8870 ?auto_8880 ) ) ( not ( = ?auto_8871 ?auto_8880 ) ) ( IS-CRATE ?auto_8869 ) ( not ( = ?auto_8879 ?auto_8877 ) ) ( not ( = ?auto_8873 ?auto_8879 ) ) ( HOIST-AT ?auto_8875 ?auto_8879 ) ( not ( = ?auto_8881 ?auto_8875 ) ) ( not ( = ?auto_8878 ?auto_8875 ) ) ( AVAILABLE ?auto_8875 ) ( SURFACE-AT ?auto_8869 ?auto_8879 ) ( ON ?auto_8869 ?auto_8872 ) ( CLEAR ?auto_8869 ) ( not ( = ?auto_8869 ?auto_8872 ) ) ( not ( = ?auto_8870 ?auto_8872 ) ) ( not ( = ?auto_8871 ?auto_8872 ) ) ( not ( = ?auto_8880 ?auto_8872 ) ) ( TRUCK-AT ?auto_8876 ?auto_8877 ) ( SURFACE-AT ?auto_8874 ?auto_8877 ) ( CLEAR ?auto_8874 ) ( IS-CRATE ?auto_8871 ) ( not ( = ?auto_8874 ?auto_8871 ) ) ( not ( = ?auto_8869 ?auto_8874 ) ) ( not ( = ?auto_8870 ?auto_8874 ) ) ( not ( = ?auto_8880 ?auto_8874 ) ) ( not ( = ?auto_8872 ?auto_8874 ) ) ( AVAILABLE ?auto_8881 ) ( IN ?auto_8871 ?auto_8876 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8881 ?auto_8871 ?auto_8876 ?auto_8877 )
      ( MAKE-2CRATE ?auto_8871 ?auto_8869 ?auto_8870 )
      ( MAKE-1CRATE-VERIFY ?auto_8869 ?auto_8870 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8882 - SURFACE
      ?auto_8883 - SURFACE
      ?auto_8884 - SURFACE
    )
    :vars
    (
      ?auto_8887 - HOIST
      ?auto_8893 - PLACE
      ?auto_8890 - PLACE
      ?auto_8886 - HOIST
      ?auto_8894 - SURFACE
      ?auto_8891 - PLACE
      ?auto_8889 - HOIST
      ?auto_8885 - SURFACE
      ?auto_8888 - TRUCK
      ?auto_8892 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8887 ?auto_8893 ) ( IS-CRATE ?auto_8884 ) ( not ( = ?auto_8883 ?auto_8884 ) ) ( not ( = ?auto_8882 ?auto_8883 ) ) ( not ( = ?auto_8882 ?auto_8884 ) ) ( not ( = ?auto_8890 ?auto_8893 ) ) ( HOIST-AT ?auto_8886 ?auto_8890 ) ( not ( = ?auto_8887 ?auto_8886 ) ) ( AVAILABLE ?auto_8886 ) ( SURFACE-AT ?auto_8884 ?auto_8890 ) ( ON ?auto_8884 ?auto_8894 ) ( CLEAR ?auto_8884 ) ( not ( = ?auto_8883 ?auto_8894 ) ) ( not ( = ?auto_8884 ?auto_8894 ) ) ( not ( = ?auto_8882 ?auto_8894 ) ) ( IS-CRATE ?auto_8883 ) ( not ( = ?auto_8891 ?auto_8893 ) ) ( not ( = ?auto_8890 ?auto_8891 ) ) ( HOIST-AT ?auto_8889 ?auto_8891 ) ( not ( = ?auto_8887 ?auto_8889 ) ) ( not ( = ?auto_8886 ?auto_8889 ) ) ( AVAILABLE ?auto_8889 ) ( SURFACE-AT ?auto_8883 ?auto_8891 ) ( ON ?auto_8883 ?auto_8885 ) ( CLEAR ?auto_8883 ) ( not ( = ?auto_8883 ?auto_8885 ) ) ( not ( = ?auto_8884 ?auto_8885 ) ) ( not ( = ?auto_8882 ?auto_8885 ) ) ( not ( = ?auto_8894 ?auto_8885 ) ) ( TRUCK-AT ?auto_8888 ?auto_8893 ) ( SURFACE-AT ?auto_8892 ?auto_8893 ) ( CLEAR ?auto_8892 ) ( IS-CRATE ?auto_8882 ) ( not ( = ?auto_8892 ?auto_8882 ) ) ( not ( = ?auto_8883 ?auto_8892 ) ) ( not ( = ?auto_8884 ?auto_8892 ) ) ( not ( = ?auto_8894 ?auto_8892 ) ) ( not ( = ?auto_8885 ?auto_8892 ) ) ( AVAILABLE ?auto_8887 ) ( IN ?auto_8882 ?auto_8888 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8883 ?auto_8884 )
      ( MAKE-2CRATE-VERIFY ?auto_8882 ?auto_8883 ?auto_8884 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8895 - SURFACE
      ?auto_8896 - SURFACE
      ?auto_8897 - SURFACE
      ?auto_8898 - SURFACE
    )
    :vars
    (
      ?auto_8902 - HOIST
      ?auto_8901 - PLACE
      ?auto_8905 - PLACE
      ?auto_8906 - HOIST
      ?auto_8907 - SURFACE
      ?auto_8904 - PLACE
      ?auto_8900 - HOIST
      ?auto_8899 - SURFACE
      ?auto_8903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8902 ?auto_8901 ) ( IS-CRATE ?auto_8898 ) ( not ( = ?auto_8897 ?auto_8898 ) ) ( not ( = ?auto_8896 ?auto_8897 ) ) ( not ( = ?auto_8896 ?auto_8898 ) ) ( not ( = ?auto_8905 ?auto_8901 ) ) ( HOIST-AT ?auto_8906 ?auto_8905 ) ( not ( = ?auto_8902 ?auto_8906 ) ) ( AVAILABLE ?auto_8906 ) ( SURFACE-AT ?auto_8898 ?auto_8905 ) ( ON ?auto_8898 ?auto_8907 ) ( CLEAR ?auto_8898 ) ( not ( = ?auto_8897 ?auto_8907 ) ) ( not ( = ?auto_8898 ?auto_8907 ) ) ( not ( = ?auto_8896 ?auto_8907 ) ) ( IS-CRATE ?auto_8897 ) ( not ( = ?auto_8904 ?auto_8901 ) ) ( not ( = ?auto_8905 ?auto_8904 ) ) ( HOIST-AT ?auto_8900 ?auto_8904 ) ( not ( = ?auto_8902 ?auto_8900 ) ) ( not ( = ?auto_8906 ?auto_8900 ) ) ( AVAILABLE ?auto_8900 ) ( SURFACE-AT ?auto_8897 ?auto_8904 ) ( ON ?auto_8897 ?auto_8899 ) ( CLEAR ?auto_8897 ) ( not ( = ?auto_8897 ?auto_8899 ) ) ( not ( = ?auto_8898 ?auto_8899 ) ) ( not ( = ?auto_8896 ?auto_8899 ) ) ( not ( = ?auto_8907 ?auto_8899 ) ) ( TRUCK-AT ?auto_8903 ?auto_8901 ) ( SURFACE-AT ?auto_8895 ?auto_8901 ) ( CLEAR ?auto_8895 ) ( IS-CRATE ?auto_8896 ) ( not ( = ?auto_8895 ?auto_8896 ) ) ( not ( = ?auto_8897 ?auto_8895 ) ) ( not ( = ?auto_8898 ?auto_8895 ) ) ( not ( = ?auto_8907 ?auto_8895 ) ) ( not ( = ?auto_8899 ?auto_8895 ) ) ( AVAILABLE ?auto_8902 ) ( IN ?auto_8896 ?auto_8903 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8896 ?auto_8897 ?auto_8898 )
      ( MAKE-3CRATE-VERIFY ?auto_8895 ?auto_8896 ?auto_8897 ?auto_8898 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8908 - SURFACE
      ?auto_8909 - SURFACE
      ?auto_8910 - SURFACE
      ?auto_8911 - SURFACE
      ?auto_8912 - SURFACE
    )
    :vars
    (
      ?auto_8916 - HOIST
      ?auto_8915 - PLACE
      ?auto_8919 - PLACE
      ?auto_8920 - HOIST
      ?auto_8921 - SURFACE
      ?auto_8918 - PLACE
      ?auto_8914 - HOIST
      ?auto_8913 - SURFACE
      ?auto_8917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8916 ?auto_8915 ) ( IS-CRATE ?auto_8912 ) ( not ( = ?auto_8911 ?auto_8912 ) ) ( not ( = ?auto_8910 ?auto_8911 ) ) ( not ( = ?auto_8910 ?auto_8912 ) ) ( not ( = ?auto_8919 ?auto_8915 ) ) ( HOIST-AT ?auto_8920 ?auto_8919 ) ( not ( = ?auto_8916 ?auto_8920 ) ) ( AVAILABLE ?auto_8920 ) ( SURFACE-AT ?auto_8912 ?auto_8919 ) ( ON ?auto_8912 ?auto_8921 ) ( CLEAR ?auto_8912 ) ( not ( = ?auto_8911 ?auto_8921 ) ) ( not ( = ?auto_8912 ?auto_8921 ) ) ( not ( = ?auto_8910 ?auto_8921 ) ) ( IS-CRATE ?auto_8911 ) ( not ( = ?auto_8918 ?auto_8915 ) ) ( not ( = ?auto_8919 ?auto_8918 ) ) ( HOIST-AT ?auto_8914 ?auto_8918 ) ( not ( = ?auto_8916 ?auto_8914 ) ) ( not ( = ?auto_8920 ?auto_8914 ) ) ( AVAILABLE ?auto_8914 ) ( SURFACE-AT ?auto_8911 ?auto_8918 ) ( ON ?auto_8911 ?auto_8913 ) ( CLEAR ?auto_8911 ) ( not ( = ?auto_8911 ?auto_8913 ) ) ( not ( = ?auto_8912 ?auto_8913 ) ) ( not ( = ?auto_8910 ?auto_8913 ) ) ( not ( = ?auto_8921 ?auto_8913 ) ) ( TRUCK-AT ?auto_8917 ?auto_8915 ) ( SURFACE-AT ?auto_8909 ?auto_8915 ) ( CLEAR ?auto_8909 ) ( IS-CRATE ?auto_8910 ) ( not ( = ?auto_8909 ?auto_8910 ) ) ( not ( = ?auto_8911 ?auto_8909 ) ) ( not ( = ?auto_8912 ?auto_8909 ) ) ( not ( = ?auto_8921 ?auto_8909 ) ) ( not ( = ?auto_8913 ?auto_8909 ) ) ( AVAILABLE ?auto_8916 ) ( IN ?auto_8910 ?auto_8917 ) ( ON ?auto_8909 ?auto_8908 ) ( not ( = ?auto_8908 ?auto_8909 ) ) ( not ( = ?auto_8908 ?auto_8910 ) ) ( not ( = ?auto_8908 ?auto_8911 ) ) ( not ( = ?auto_8908 ?auto_8912 ) ) ( not ( = ?auto_8908 ?auto_8921 ) ) ( not ( = ?auto_8908 ?auto_8913 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8910 ?auto_8911 ?auto_8912 )
      ( MAKE-4CRATE-VERIFY ?auto_8908 ?auto_8909 ?auto_8910 ?auto_8911 ?auto_8912 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8922 - SURFACE
      ?auto_8923 - SURFACE
    )
    :vars
    (
      ?auto_8929 - HOIST
      ?auto_8928 - PLACE
      ?auto_8926 - SURFACE
      ?auto_8932 - PLACE
      ?auto_8933 - HOIST
      ?auto_8934 - SURFACE
      ?auto_8931 - PLACE
      ?auto_8927 - HOIST
      ?auto_8924 - SURFACE
      ?auto_8925 - SURFACE
      ?auto_8930 - TRUCK
      ?auto_8935 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8929 ?auto_8928 ) ( IS-CRATE ?auto_8923 ) ( not ( = ?auto_8922 ?auto_8923 ) ) ( not ( = ?auto_8926 ?auto_8922 ) ) ( not ( = ?auto_8926 ?auto_8923 ) ) ( not ( = ?auto_8932 ?auto_8928 ) ) ( HOIST-AT ?auto_8933 ?auto_8932 ) ( not ( = ?auto_8929 ?auto_8933 ) ) ( AVAILABLE ?auto_8933 ) ( SURFACE-AT ?auto_8923 ?auto_8932 ) ( ON ?auto_8923 ?auto_8934 ) ( CLEAR ?auto_8923 ) ( not ( = ?auto_8922 ?auto_8934 ) ) ( not ( = ?auto_8923 ?auto_8934 ) ) ( not ( = ?auto_8926 ?auto_8934 ) ) ( IS-CRATE ?auto_8922 ) ( not ( = ?auto_8931 ?auto_8928 ) ) ( not ( = ?auto_8932 ?auto_8931 ) ) ( HOIST-AT ?auto_8927 ?auto_8931 ) ( not ( = ?auto_8929 ?auto_8927 ) ) ( not ( = ?auto_8933 ?auto_8927 ) ) ( AVAILABLE ?auto_8927 ) ( SURFACE-AT ?auto_8922 ?auto_8931 ) ( ON ?auto_8922 ?auto_8924 ) ( CLEAR ?auto_8922 ) ( not ( = ?auto_8922 ?auto_8924 ) ) ( not ( = ?auto_8923 ?auto_8924 ) ) ( not ( = ?auto_8926 ?auto_8924 ) ) ( not ( = ?auto_8934 ?auto_8924 ) ) ( SURFACE-AT ?auto_8925 ?auto_8928 ) ( CLEAR ?auto_8925 ) ( IS-CRATE ?auto_8926 ) ( not ( = ?auto_8925 ?auto_8926 ) ) ( not ( = ?auto_8922 ?auto_8925 ) ) ( not ( = ?auto_8923 ?auto_8925 ) ) ( not ( = ?auto_8934 ?auto_8925 ) ) ( not ( = ?auto_8924 ?auto_8925 ) ) ( AVAILABLE ?auto_8929 ) ( IN ?auto_8926 ?auto_8930 ) ( TRUCK-AT ?auto_8930 ?auto_8935 ) ( not ( = ?auto_8935 ?auto_8928 ) ) ( not ( = ?auto_8932 ?auto_8935 ) ) ( not ( = ?auto_8931 ?auto_8935 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8930 ?auto_8935 ?auto_8928 )
      ( MAKE-2CRATE ?auto_8926 ?auto_8922 ?auto_8923 )
      ( MAKE-1CRATE-VERIFY ?auto_8922 ?auto_8923 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8936 - SURFACE
      ?auto_8937 - SURFACE
      ?auto_8938 - SURFACE
    )
    :vars
    (
      ?auto_8943 - HOIST
      ?auto_8946 - PLACE
      ?auto_8947 - PLACE
      ?auto_8945 - HOIST
      ?auto_8939 - SURFACE
      ?auto_8942 - PLACE
      ?auto_8941 - HOIST
      ?auto_8940 - SURFACE
      ?auto_8948 - SURFACE
      ?auto_8944 - TRUCK
      ?auto_8949 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8943 ?auto_8946 ) ( IS-CRATE ?auto_8938 ) ( not ( = ?auto_8937 ?auto_8938 ) ) ( not ( = ?auto_8936 ?auto_8937 ) ) ( not ( = ?auto_8936 ?auto_8938 ) ) ( not ( = ?auto_8947 ?auto_8946 ) ) ( HOIST-AT ?auto_8945 ?auto_8947 ) ( not ( = ?auto_8943 ?auto_8945 ) ) ( AVAILABLE ?auto_8945 ) ( SURFACE-AT ?auto_8938 ?auto_8947 ) ( ON ?auto_8938 ?auto_8939 ) ( CLEAR ?auto_8938 ) ( not ( = ?auto_8937 ?auto_8939 ) ) ( not ( = ?auto_8938 ?auto_8939 ) ) ( not ( = ?auto_8936 ?auto_8939 ) ) ( IS-CRATE ?auto_8937 ) ( not ( = ?auto_8942 ?auto_8946 ) ) ( not ( = ?auto_8947 ?auto_8942 ) ) ( HOIST-AT ?auto_8941 ?auto_8942 ) ( not ( = ?auto_8943 ?auto_8941 ) ) ( not ( = ?auto_8945 ?auto_8941 ) ) ( AVAILABLE ?auto_8941 ) ( SURFACE-AT ?auto_8937 ?auto_8942 ) ( ON ?auto_8937 ?auto_8940 ) ( CLEAR ?auto_8937 ) ( not ( = ?auto_8937 ?auto_8940 ) ) ( not ( = ?auto_8938 ?auto_8940 ) ) ( not ( = ?auto_8936 ?auto_8940 ) ) ( not ( = ?auto_8939 ?auto_8940 ) ) ( SURFACE-AT ?auto_8948 ?auto_8946 ) ( CLEAR ?auto_8948 ) ( IS-CRATE ?auto_8936 ) ( not ( = ?auto_8948 ?auto_8936 ) ) ( not ( = ?auto_8937 ?auto_8948 ) ) ( not ( = ?auto_8938 ?auto_8948 ) ) ( not ( = ?auto_8939 ?auto_8948 ) ) ( not ( = ?auto_8940 ?auto_8948 ) ) ( AVAILABLE ?auto_8943 ) ( IN ?auto_8936 ?auto_8944 ) ( TRUCK-AT ?auto_8944 ?auto_8949 ) ( not ( = ?auto_8949 ?auto_8946 ) ) ( not ( = ?auto_8947 ?auto_8949 ) ) ( not ( = ?auto_8942 ?auto_8949 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8937 ?auto_8938 )
      ( MAKE-2CRATE-VERIFY ?auto_8936 ?auto_8937 ?auto_8938 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8950 - SURFACE
      ?auto_8951 - SURFACE
      ?auto_8952 - SURFACE
      ?auto_8953 - SURFACE
    )
    :vars
    (
      ?auto_8957 - HOIST
      ?auto_8962 - PLACE
      ?auto_8954 - PLACE
      ?auto_8958 - HOIST
      ?auto_8961 - SURFACE
      ?auto_8956 - PLACE
      ?auto_8963 - HOIST
      ?auto_8960 - SURFACE
      ?auto_8959 - TRUCK
      ?auto_8955 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8957 ?auto_8962 ) ( IS-CRATE ?auto_8953 ) ( not ( = ?auto_8952 ?auto_8953 ) ) ( not ( = ?auto_8951 ?auto_8952 ) ) ( not ( = ?auto_8951 ?auto_8953 ) ) ( not ( = ?auto_8954 ?auto_8962 ) ) ( HOIST-AT ?auto_8958 ?auto_8954 ) ( not ( = ?auto_8957 ?auto_8958 ) ) ( AVAILABLE ?auto_8958 ) ( SURFACE-AT ?auto_8953 ?auto_8954 ) ( ON ?auto_8953 ?auto_8961 ) ( CLEAR ?auto_8953 ) ( not ( = ?auto_8952 ?auto_8961 ) ) ( not ( = ?auto_8953 ?auto_8961 ) ) ( not ( = ?auto_8951 ?auto_8961 ) ) ( IS-CRATE ?auto_8952 ) ( not ( = ?auto_8956 ?auto_8962 ) ) ( not ( = ?auto_8954 ?auto_8956 ) ) ( HOIST-AT ?auto_8963 ?auto_8956 ) ( not ( = ?auto_8957 ?auto_8963 ) ) ( not ( = ?auto_8958 ?auto_8963 ) ) ( AVAILABLE ?auto_8963 ) ( SURFACE-AT ?auto_8952 ?auto_8956 ) ( ON ?auto_8952 ?auto_8960 ) ( CLEAR ?auto_8952 ) ( not ( = ?auto_8952 ?auto_8960 ) ) ( not ( = ?auto_8953 ?auto_8960 ) ) ( not ( = ?auto_8951 ?auto_8960 ) ) ( not ( = ?auto_8961 ?auto_8960 ) ) ( SURFACE-AT ?auto_8950 ?auto_8962 ) ( CLEAR ?auto_8950 ) ( IS-CRATE ?auto_8951 ) ( not ( = ?auto_8950 ?auto_8951 ) ) ( not ( = ?auto_8952 ?auto_8950 ) ) ( not ( = ?auto_8953 ?auto_8950 ) ) ( not ( = ?auto_8961 ?auto_8950 ) ) ( not ( = ?auto_8960 ?auto_8950 ) ) ( AVAILABLE ?auto_8957 ) ( IN ?auto_8951 ?auto_8959 ) ( TRUCK-AT ?auto_8959 ?auto_8955 ) ( not ( = ?auto_8955 ?auto_8962 ) ) ( not ( = ?auto_8954 ?auto_8955 ) ) ( not ( = ?auto_8956 ?auto_8955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8951 ?auto_8952 ?auto_8953 )
      ( MAKE-3CRATE-VERIFY ?auto_8950 ?auto_8951 ?auto_8952 ?auto_8953 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8964 - SURFACE
      ?auto_8965 - SURFACE
      ?auto_8966 - SURFACE
      ?auto_8967 - SURFACE
      ?auto_8968 - SURFACE
    )
    :vars
    (
      ?auto_8972 - HOIST
      ?auto_8977 - PLACE
      ?auto_8969 - PLACE
      ?auto_8973 - HOIST
      ?auto_8976 - SURFACE
      ?auto_8971 - PLACE
      ?auto_8978 - HOIST
      ?auto_8975 - SURFACE
      ?auto_8974 - TRUCK
      ?auto_8970 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8972 ?auto_8977 ) ( IS-CRATE ?auto_8968 ) ( not ( = ?auto_8967 ?auto_8968 ) ) ( not ( = ?auto_8966 ?auto_8967 ) ) ( not ( = ?auto_8966 ?auto_8968 ) ) ( not ( = ?auto_8969 ?auto_8977 ) ) ( HOIST-AT ?auto_8973 ?auto_8969 ) ( not ( = ?auto_8972 ?auto_8973 ) ) ( AVAILABLE ?auto_8973 ) ( SURFACE-AT ?auto_8968 ?auto_8969 ) ( ON ?auto_8968 ?auto_8976 ) ( CLEAR ?auto_8968 ) ( not ( = ?auto_8967 ?auto_8976 ) ) ( not ( = ?auto_8968 ?auto_8976 ) ) ( not ( = ?auto_8966 ?auto_8976 ) ) ( IS-CRATE ?auto_8967 ) ( not ( = ?auto_8971 ?auto_8977 ) ) ( not ( = ?auto_8969 ?auto_8971 ) ) ( HOIST-AT ?auto_8978 ?auto_8971 ) ( not ( = ?auto_8972 ?auto_8978 ) ) ( not ( = ?auto_8973 ?auto_8978 ) ) ( AVAILABLE ?auto_8978 ) ( SURFACE-AT ?auto_8967 ?auto_8971 ) ( ON ?auto_8967 ?auto_8975 ) ( CLEAR ?auto_8967 ) ( not ( = ?auto_8967 ?auto_8975 ) ) ( not ( = ?auto_8968 ?auto_8975 ) ) ( not ( = ?auto_8966 ?auto_8975 ) ) ( not ( = ?auto_8976 ?auto_8975 ) ) ( SURFACE-AT ?auto_8965 ?auto_8977 ) ( CLEAR ?auto_8965 ) ( IS-CRATE ?auto_8966 ) ( not ( = ?auto_8965 ?auto_8966 ) ) ( not ( = ?auto_8967 ?auto_8965 ) ) ( not ( = ?auto_8968 ?auto_8965 ) ) ( not ( = ?auto_8976 ?auto_8965 ) ) ( not ( = ?auto_8975 ?auto_8965 ) ) ( AVAILABLE ?auto_8972 ) ( IN ?auto_8966 ?auto_8974 ) ( TRUCK-AT ?auto_8974 ?auto_8970 ) ( not ( = ?auto_8970 ?auto_8977 ) ) ( not ( = ?auto_8969 ?auto_8970 ) ) ( not ( = ?auto_8971 ?auto_8970 ) ) ( ON ?auto_8965 ?auto_8964 ) ( not ( = ?auto_8964 ?auto_8965 ) ) ( not ( = ?auto_8964 ?auto_8966 ) ) ( not ( = ?auto_8964 ?auto_8967 ) ) ( not ( = ?auto_8964 ?auto_8968 ) ) ( not ( = ?auto_8964 ?auto_8976 ) ) ( not ( = ?auto_8964 ?auto_8975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8966 ?auto_8967 ?auto_8968 )
      ( MAKE-4CRATE-VERIFY ?auto_8964 ?auto_8965 ?auto_8966 ?auto_8967 ?auto_8968 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8979 - SURFACE
      ?auto_8980 - SURFACE
    )
    :vars
    (
      ?auto_8984 - HOIST
      ?auto_8989 - PLACE
      ?auto_8991 - SURFACE
      ?auto_8981 - PLACE
      ?auto_8985 - HOIST
      ?auto_8988 - SURFACE
      ?auto_8983 - PLACE
      ?auto_8990 - HOIST
      ?auto_8987 - SURFACE
      ?auto_8992 - SURFACE
      ?auto_8986 - TRUCK
      ?auto_8982 - PLACE
      ?auto_8993 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8984 ?auto_8989 ) ( IS-CRATE ?auto_8980 ) ( not ( = ?auto_8979 ?auto_8980 ) ) ( not ( = ?auto_8991 ?auto_8979 ) ) ( not ( = ?auto_8991 ?auto_8980 ) ) ( not ( = ?auto_8981 ?auto_8989 ) ) ( HOIST-AT ?auto_8985 ?auto_8981 ) ( not ( = ?auto_8984 ?auto_8985 ) ) ( AVAILABLE ?auto_8985 ) ( SURFACE-AT ?auto_8980 ?auto_8981 ) ( ON ?auto_8980 ?auto_8988 ) ( CLEAR ?auto_8980 ) ( not ( = ?auto_8979 ?auto_8988 ) ) ( not ( = ?auto_8980 ?auto_8988 ) ) ( not ( = ?auto_8991 ?auto_8988 ) ) ( IS-CRATE ?auto_8979 ) ( not ( = ?auto_8983 ?auto_8989 ) ) ( not ( = ?auto_8981 ?auto_8983 ) ) ( HOIST-AT ?auto_8990 ?auto_8983 ) ( not ( = ?auto_8984 ?auto_8990 ) ) ( not ( = ?auto_8985 ?auto_8990 ) ) ( AVAILABLE ?auto_8990 ) ( SURFACE-AT ?auto_8979 ?auto_8983 ) ( ON ?auto_8979 ?auto_8987 ) ( CLEAR ?auto_8979 ) ( not ( = ?auto_8979 ?auto_8987 ) ) ( not ( = ?auto_8980 ?auto_8987 ) ) ( not ( = ?auto_8991 ?auto_8987 ) ) ( not ( = ?auto_8988 ?auto_8987 ) ) ( SURFACE-AT ?auto_8992 ?auto_8989 ) ( CLEAR ?auto_8992 ) ( IS-CRATE ?auto_8991 ) ( not ( = ?auto_8992 ?auto_8991 ) ) ( not ( = ?auto_8979 ?auto_8992 ) ) ( not ( = ?auto_8980 ?auto_8992 ) ) ( not ( = ?auto_8988 ?auto_8992 ) ) ( not ( = ?auto_8987 ?auto_8992 ) ) ( AVAILABLE ?auto_8984 ) ( TRUCK-AT ?auto_8986 ?auto_8982 ) ( not ( = ?auto_8982 ?auto_8989 ) ) ( not ( = ?auto_8981 ?auto_8982 ) ) ( not ( = ?auto_8983 ?auto_8982 ) ) ( HOIST-AT ?auto_8993 ?auto_8982 ) ( LIFTING ?auto_8993 ?auto_8991 ) ( not ( = ?auto_8984 ?auto_8993 ) ) ( not ( = ?auto_8985 ?auto_8993 ) ) ( not ( = ?auto_8990 ?auto_8993 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8993 ?auto_8991 ?auto_8986 ?auto_8982 )
      ( MAKE-2CRATE ?auto_8991 ?auto_8979 ?auto_8980 )
      ( MAKE-1CRATE-VERIFY ?auto_8979 ?auto_8980 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8994 - SURFACE
      ?auto_8995 - SURFACE
      ?auto_8996 - SURFACE
    )
    :vars
    (
      ?auto_9007 - HOIST
      ?auto_9005 - PLACE
      ?auto_9000 - PLACE
      ?auto_9001 - HOIST
      ?auto_9002 - SURFACE
      ?auto_8999 - PLACE
      ?auto_9004 - HOIST
      ?auto_9008 - SURFACE
      ?auto_9003 - SURFACE
      ?auto_9006 - TRUCK
      ?auto_8997 - PLACE
      ?auto_8998 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9007 ?auto_9005 ) ( IS-CRATE ?auto_8996 ) ( not ( = ?auto_8995 ?auto_8996 ) ) ( not ( = ?auto_8994 ?auto_8995 ) ) ( not ( = ?auto_8994 ?auto_8996 ) ) ( not ( = ?auto_9000 ?auto_9005 ) ) ( HOIST-AT ?auto_9001 ?auto_9000 ) ( not ( = ?auto_9007 ?auto_9001 ) ) ( AVAILABLE ?auto_9001 ) ( SURFACE-AT ?auto_8996 ?auto_9000 ) ( ON ?auto_8996 ?auto_9002 ) ( CLEAR ?auto_8996 ) ( not ( = ?auto_8995 ?auto_9002 ) ) ( not ( = ?auto_8996 ?auto_9002 ) ) ( not ( = ?auto_8994 ?auto_9002 ) ) ( IS-CRATE ?auto_8995 ) ( not ( = ?auto_8999 ?auto_9005 ) ) ( not ( = ?auto_9000 ?auto_8999 ) ) ( HOIST-AT ?auto_9004 ?auto_8999 ) ( not ( = ?auto_9007 ?auto_9004 ) ) ( not ( = ?auto_9001 ?auto_9004 ) ) ( AVAILABLE ?auto_9004 ) ( SURFACE-AT ?auto_8995 ?auto_8999 ) ( ON ?auto_8995 ?auto_9008 ) ( CLEAR ?auto_8995 ) ( not ( = ?auto_8995 ?auto_9008 ) ) ( not ( = ?auto_8996 ?auto_9008 ) ) ( not ( = ?auto_8994 ?auto_9008 ) ) ( not ( = ?auto_9002 ?auto_9008 ) ) ( SURFACE-AT ?auto_9003 ?auto_9005 ) ( CLEAR ?auto_9003 ) ( IS-CRATE ?auto_8994 ) ( not ( = ?auto_9003 ?auto_8994 ) ) ( not ( = ?auto_8995 ?auto_9003 ) ) ( not ( = ?auto_8996 ?auto_9003 ) ) ( not ( = ?auto_9002 ?auto_9003 ) ) ( not ( = ?auto_9008 ?auto_9003 ) ) ( AVAILABLE ?auto_9007 ) ( TRUCK-AT ?auto_9006 ?auto_8997 ) ( not ( = ?auto_8997 ?auto_9005 ) ) ( not ( = ?auto_9000 ?auto_8997 ) ) ( not ( = ?auto_8999 ?auto_8997 ) ) ( HOIST-AT ?auto_8998 ?auto_8997 ) ( LIFTING ?auto_8998 ?auto_8994 ) ( not ( = ?auto_9007 ?auto_8998 ) ) ( not ( = ?auto_9001 ?auto_8998 ) ) ( not ( = ?auto_9004 ?auto_8998 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8995 ?auto_8996 )
      ( MAKE-2CRATE-VERIFY ?auto_8994 ?auto_8995 ?auto_8996 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9009 - SURFACE
      ?auto_9010 - SURFACE
      ?auto_9011 - SURFACE
      ?auto_9012 - SURFACE
    )
    :vars
    (
      ?auto_9019 - HOIST
      ?auto_9013 - PLACE
      ?auto_9022 - PLACE
      ?auto_9020 - HOIST
      ?auto_9021 - SURFACE
      ?auto_9014 - PLACE
      ?auto_9017 - HOIST
      ?auto_9018 - SURFACE
      ?auto_9015 - TRUCK
      ?auto_9016 - PLACE
      ?auto_9023 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9019 ?auto_9013 ) ( IS-CRATE ?auto_9012 ) ( not ( = ?auto_9011 ?auto_9012 ) ) ( not ( = ?auto_9010 ?auto_9011 ) ) ( not ( = ?auto_9010 ?auto_9012 ) ) ( not ( = ?auto_9022 ?auto_9013 ) ) ( HOIST-AT ?auto_9020 ?auto_9022 ) ( not ( = ?auto_9019 ?auto_9020 ) ) ( AVAILABLE ?auto_9020 ) ( SURFACE-AT ?auto_9012 ?auto_9022 ) ( ON ?auto_9012 ?auto_9021 ) ( CLEAR ?auto_9012 ) ( not ( = ?auto_9011 ?auto_9021 ) ) ( not ( = ?auto_9012 ?auto_9021 ) ) ( not ( = ?auto_9010 ?auto_9021 ) ) ( IS-CRATE ?auto_9011 ) ( not ( = ?auto_9014 ?auto_9013 ) ) ( not ( = ?auto_9022 ?auto_9014 ) ) ( HOIST-AT ?auto_9017 ?auto_9014 ) ( not ( = ?auto_9019 ?auto_9017 ) ) ( not ( = ?auto_9020 ?auto_9017 ) ) ( AVAILABLE ?auto_9017 ) ( SURFACE-AT ?auto_9011 ?auto_9014 ) ( ON ?auto_9011 ?auto_9018 ) ( CLEAR ?auto_9011 ) ( not ( = ?auto_9011 ?auto_9018 ) ) ( not ( = ?auto_9012 ?auto_9018 ) ) ( not ( = ?auto_9010 ?auto_9018 ) ) ( not ( = ?auto_9021 ?auto_9018 ) ) ( SURFACE-AT ?auto_9009 ?auto_9013 ) ( CLEAR ?auto_9009 ) ( IS-CRATE ?auto_9010 ) ( not ( = ?auto_9009 ?auto_9010 ) ) ( not ( = ?auto_9011 ?auto_9009 ) ) ( not ( = ?auto_9012 ?auto_9009 ) ) ( not ( = ?auto_9021 ?auto_9009 ) ) ( not ( = ?auto_9018 ?auto_9009 ) ) ( AVAILABLE ?auto_9019 ) ( TRUCK-AT ?auto_9015 ?auto_9016 ) ( not ( = ?auto_9016 ?auto_9013 ) ) ( not ( = ?auto_9022 ?auto_9016 ) ) ( not ( = ?auto_9014 ?auto_9016 ) ) ( HOIST-AT ?auto_9023 ?auto_9016 ) ( LIFTING ?auto_9023 ?auto_9010 ) ( not ( = ?auto_9019 ?auto_9023 ) ) ( not ( = ?auto_9020 ?auto_9023 ) ) ( not ( = ?auto_9017 ?auto_9023 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9010 ?auto_9011 ?auto_9012 )
      ( MAKE-3CRATE-VERIFY ?auto_9009 ?auto_9010 ?auto_9011 ?auto_9012 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9024 - SURFACE
      ?auto_9025 - SURFACE
      ?auto_9026 - SURFACE
      ?auto_9027 - SURFACE
      ?auto_9028 - SURFACE
    )
    :vars
    (
      ?auto_9035 - HOIST
      ?auto_9029 - PLACE
      ?auto_9038 - PLACE
      ?auto_9036 - HOIST
      ?auto_9037 - SURFACE
      ?auto_9030 - PLACE
      ?auto_9033 - HOIST
      ?auto_9034 - SURFACE
      ?auto_9031 - TRUCK
      ?auto_9032 - PLACE
      ?auto_9039 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9035 ?auto_9029 ) ( IS-CRATE ?auto_9028 ) ( not ( = ?auto_9027 ?auto_9028 ) ) ( not ( = ?auto_9026 ?auto_9027 ) ) ( not ( = ?auto_9026 ?auto_9028 ) ) ( not ( = ?auto_9038 ?auto_9029 ) ) ( HOIST-AT ?auto_9036 ?auto_9038 ) ( not ( = ?auto_9035 ?auto_9036 ) ) ( AVAILABLE ?auto_9036 ) ( SURFACE-AT ?auto_9028 ?auto_9038 ) ( ON ?auto_9028 ?auto_9037 ) ( CLEAR ?auto_9028 ) ( not ( = ?auto_9027 ?auto_9037 ) ) ( not ( = ?auto_9028 ?auto_9037 ) ) ( not ( = ?auto_9026 ?auto_9037 ) ) ( IS-CRATE ?auto_9027 ) ( not ( = ?auto_9030 ?auto_9029 ) ) ( not ( = ?auto_9038 ?auto_9030 ) ) ( HOIST-AT ?auto_9033 ?auto_9030 ) ( not ( = ?auto_9035 ?auto_9033 ) ) ( not ( = ?auto_9036 ?auto_9033 ) ) ( AVAILABLE ?auto_9033 ) ( SURFACE-AT ?auto_9027 ?auto_9030 ) ( ON ?auto_9027 ?auto_9034 ) ( CLEAR ?auto_9027 ) ( not ( = ?auto_9027 ?auto_9034 ) ) ( not ( = ?auto_9028 ?auto_9034 ) ) ( not ( = ?auto_9026 ?auto_9034 ) ) ( not ( = ?auto_9037 ?auto_9034 ) ) ( SURFACE-AT ?auto_9025 ?auto_9029 ) ( CLEAR ?auto_9025 ) ( IS-CRATE ?auto_9026 ) ( not ( = ?auto_9025 ?auto_9026 ) ) ( not ( = ?auto_9027 ?auto_9025 ) ) ( not ( = ?auto_9028 ?auto_9025 ) ) ( not ( = ?auto_9037 ?auto_9025 ) ) ( not ( = ?auto_9034 ?auto_9025 ) ) ( AVAILABLE ?auto_9035 ) ( TRUCK-AT ?auto_9031 ?auto_9032 ) ( not ( = ?auto_9032 ?auto_9029 ) ) ( not ( = ?auto_9038 ?auto_9032 ) ) ( not ( = ?auto_9030 ?auto_9032 ) ) ( HOIST-AT ?auto_9039 ?auto_9032 ) ( LIFTING ?auto_9039 ?auto_9026 ) ( not ( = ?auto_9035 ?auto_9039 ) ) ( not ( = ?auto_9036 ?auto_9039 ) ) ( not ( = ?auto_9033 ?auto_9039 ) ) ( ON ?auto_9025 ?auto_9024 ) ( not ( = ?auto_9024 ?auto_9025 ) ) ( not ( = ?auto_9024 ?auto_9026 ) ) ( not ( = ?auto_9024 ?auto_9027 ) ) ( not ( = ?auto_9024 ?auto_9028 ) ) ( not ( = ?auto_9024 ?auto_9037 ) ) ( not ( = ?auto_9024 ?auto_9034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9026 ?auto_9027 ?auto_9028 )
      ( MAKE-4CRATE-VERIFY ?auto_9024 ?auto_9025 ?auto_9026 ?auto_9027 ?auto_9028 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9040 - SURFACE
      ?auto_9041 - SURFACE
    )
    :vars
    (
      ?auto_9048 - HOIST
      ?auto_9042 - PLACE
      ?auto_9052 - SURFACE
      ?auto_9053 - PLACE
      ?auto_9049 - HOIST
      ?auto_9050 - SURFACE
      ?auto_9043 - PLACE
      ?auto_9046 - HOIST
      ?auto_9047 - SURFACE
      ?auto_9051 - SURFACE
      ?auto_9044 - TRUCK
      ?auto_9045 - PLACE
      ?auto_9054 - HOIST
      ?auto_9055 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9048 ?auto_9042 ) ( IS-CRATE ?auto_9041 ) ( not ( = ?auto_9040 ?auto_9041 ) ) ( not ( = ?auto_9052 ?auto_9040 ) ) ( not ( = ?auto_9052 ?auto_9041 ) ) ( not ( = ?auto_9053 ?auto_9042 ) ) ( HOIST-AT ?auto_9049 ?auto_9053 ) ( not ( = ?auto_9048 ?auto_9049 ) ) ( AVAILABLE ?auto_9049 ) ( SURFACE-AT ?auto_9041 ?auto_9053 ) ( ON ?auto_9041 ?auto_9050 ) ( CLEAR ?auto_9041 ) ( not ( = ?auto_9040 ?auto_9050 ) ) ( not ( = ?auto_9041 ?auto_9050 ) ) ( not ( = ?auto_9052 ?auto_9050 ) ) ( IS-CRATE ?auto_9040 ) ( not ( = ?auto_9043 ?auto_9042 ) ) ( not ( = ?auto_9053 ?auto_9043 ) ) ( HOIST-AT ?auto_9046 ?auto_9043 ) ( not ( = ?auto_9048 ?auto_9046 ) ) ( not ( = ?auto_9049 ?auto_9046 ) ) ( AVAILABLE ?auto_9046 ) ( SURFACE-AT ?auto_9040 ?auto_9043 ) ( ON ?auto_9040 ?auto_9047 ) ( CLEAR ?auto_9040 ) ( not ( = ?auto_9040 ?auto_9047 ) ) ( not ( = ?auto_9041 ?auto_9047 ) ) ( not ( = ?auto_9052 ?auto_9047 ) ) ( not ( = ?auto_9050 ?auto_9047 ) ) ( SURFACE-AT ?auto_9051 ?auto_9042 ) ( CLEAR ?auto_9051 ) ( IS-CRATE ?auto_9052 ) ( not ( = ?auto_9051 ?auto_9052 ) ) ( not ( = ?auto_9040 ?auto_9051 ) ) ( not ( = ?auto_9041 ?auto_9051 ) ) ( not ( = ?auto_9050 ?auto_9051 ) ) ( not ( = ?auto_9047 ?auto_9051 ) ) ( AVAILABLE ?auto_9048 ) ( TRUCK-AT ?auto_9044 ?auto_9045 ) ( not ( = ?auto_9045 ?auto_9042 ) ) ( not ( = ?auto_9053 ?auto_9045 ) ) ( not ( = ?auto_9043 ?auto_9045 ) ) ( HOIST-AT ?auto_9054 ?auto_9045 ) ( not ( = ?auto_9048 ?auto_9054 ) ) ( not ( = ?auto_9049 ?auto_9054 ) ) ( not ( = ?auto_9046 ?auto_9054 ) ) ( AVAILABLE ?auto_9054 ) ( SURFACE-AT ?auto_9052 ?auto_9045 ) ( ON ?auto_9052 ?auto_9055 ) ( CLEAR ?auto_9052 ) ( not ( = ?auto_9040 ?auto_9055 ) ) ( not ( = ?auto_9041 ?auto_9055 ) ) ( not ( = ?auto_9052 ?auto_9055 ) ) ( not ( = ?auto_9050 ?auto_9055 ) ) ( not ( = ?auto_9047 ?auto_9055 ) ) ( not ( = ?auto_9051 ?auto_9055 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9054 ?auto_9052 ?auto_9055 ?auto_9045 )
      ( MAKE-2CRATE ?auto_9052 ?auto_9040 ?auto_9041 )
      ( MAKE-1CRATE-VERIFY ?auto_9040 ?auto_9041 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9056 - SURFACE
      ?auto_9057 - SURFACE
      ?auto_9058 - SURFACE
    )
    :vars
    (
      ?auto_9071 - HOIST
      ?auto_9064 - PLACE
      ?auto_9068 - PLACE
      ?auto_9069 - HOIST
      ?auto_9065 - SURFACE
      ?auto_9067 - PLACE
      ?auto_9062 - HOIST
      ?auto_9070 - SURFACE
      ?auto_9061 - SURFACE
      ?auto_9059 - TRUCK
      ?auto_9066 - PLACE
      ?auto_9063 - HOIST
      ?auto_9060 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9071 ?auto_9064 ) ( IS-CRATE ?auto_9058 ) ( not ( = ?auto_9057 ?auto_9058 ) ) ( not ( = ?auto_9056 ?auto_9057 ) ) ( not ( = ?auto_9056 ?auto_9058 ) ) ( not ( = ?auto_9068 ?auto_9064 ) ) ( HOIST-AT ?auto_9069 ?auto_9068 ) ( not ( = ?auto_9071 ?auto_9069 ) ) ( AVAILABLE ?auto_9069 ) ( SURFACE-AT ?auto_9058 ?auto_9068 ) ( ON ?auto_9058 ?auto_9065 ) ( CLEAR ?auto_9058 ) ( not ( = ?auto_9057 ?auto_9065 ) ) ( not ( = ?auto_9058 ?auto_9065 ) ) ( not ( = ?auto_9056 ?auto_9065 ) ) ( IS-CRATE ?auto_9057 ) ( not ( = ?auto_9067 ?auto_9064 ) ) ( not ( = ?auto_9068 ?auto_9067 ) ) ( HOIST-AT ?auto_9062 ?auto_9067 ) ( not ( = ?auto_9071 ?auto_9062 ) ) ( not ( = ?auto_9069 ?auto_9062 ) ) ( AVAILABLE ?auto_9062 ) ( SURFACE-AT ?auto_9057 ?auto_9067 ) ( ON ?auto_9057 ?auto_9070 ) ( CLEAR ?auto_9057 ) ( not ( = ?auto_9057 ?auto_9070 ) ) ( not ( = ?auto_9058 ?auto_9070 ) ) ( not ( = ?auto_9056 ?auto_9070 ) ) ( not ( = ?auto_9065 ?auto_9070 ) ) ( SURFACE-AT ?auto_9061 ?auto_9064 ) ( CLEAR ?auto_9061 ) ( IS-CRATE ?auto_9056 ) ( not ( = ?auto_9061 ?auto_9056 ) ) ( not ( = ?auto_9057 ?auto_9061 ) ) ( not ( = ?auto_9058 ?auto_9061 ) ) ( not ( = ?auto_9065 ?auto_9061 ) ) ( not ( = ?auto_9070 ?auto_9061 ) ) ( AVAILABLE ?auto_9071 ) ( TRUCK-AT ?auto_9059 ?auto_9066 ) ( not ( = ?auto_9066 ?auto_9064 ) ) ( not ( = ?auto_9068 ?auto_9066 ) ) ( not ( = ?auto_9067 ?auto_9066 ) ) ( HOIST-AT ?auto_9063 ?auto_9066 ) ( not ( = ?auto_9071 ?auto_9063 ) ) ( not ( = ?auto_9069 ?auto_9063 ) ) ( not ( = ?auto_9062 ?auto_9063 ) ) ( AVAILABLE ?auto_9063 ) ( SURFACE-AT ?auto_9056 ?auto_9066 ) ( ON ?auto_9056 ?auto_9060 ) ( CLEAR ?auto_9056 ) ( not ( = ?auto_9057 ?auto_9060 ) ) ( not ( = ?auto_9058 ?auto_9060 ) ) ( not ( = ?auto_9056 ?auto_9060 ) ) ( not ( = ?auto_9065 ?auto_9060 ) ) ( not ( = ?auto_9070 ?auto_9060 ) ) ( not ( = ?auto_9061 ?auto_9060 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9057 ?auto_9058 )
      ( MAKE-2CRATE-VERIFY ?auto_9056 ?auto_9057 ?auto_9058 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9072 - SURFACE
      ?auto_9073 - SURFACE
      ?auto_9074 - SURFACE
      ?auto_9075 - SURFACE
    )
    :vars
    (
      ?auto_9087 - HOIST
      ?auto_9080 - PLACE
      ?auto_9083 - PLACE
      ?auto_9084 - HOIST
      ?auto_9086 - SURFACE
      ?auto_9082 - PLACE
      ?auto_9079 - HOIST
      ?auto_9076 - SURFACE
      ?auto_9085 - TRUCK
      ?auto_9078 - PLACE
      ?auto_9077 - HOIST
      ?auto_9081 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9087 ?auto_9080 ) ( IS-CRATE ?auto_9075 ) ( not ( = ?auto_9074 ?auto_9075 ) ) ( not ( = ?auto_9073 ?auto_9074 ) ) ( not ( = ?auto_9073 ?auto_9075 ) ) ( not ( = ?auto_9083 ?auto_9080 ) ) ( HOIST-AT ?auto_9084 ?auto_9083 ) ( not ( = ?auto_9087 ?auto_9084 ) ) ( AVAILABLE ?auto_9084 ) ( SURFACE-AT ?auto_9075 ?auto_9083 ) ( ON ?auto_9075 ?auto_9086 ) ( CLEAR ?auto_9075 ) ( not ( = ?auto_9074 ?auto_9086 ) ) ( not ( = ?auto_9075 ?auto_9086 ) ) ( not ( = ?auto_9073 ?auto_9086 ) ) ( IS-CRATE ?auto_9074 ) ( not ( = ?auto_9082 ?auto_9080 ) ) ( not ( = ?auto_9083 ?auto_9082 ) ) ( HOIST-AT ?auto_9079 ?auto_9082 ) ( not ( = ?auto_9087 ?auto_9079 ) ) ( not ( = ?auto_9084 ?auto_9079 ) ) ( AVAILABLE ?auto_9079 ) ( SURFACE-AT ?auto_9074 ?auto_9082 ) ( ON ?auto_9074 ?auto_9076 ) ( CLEAR ?auto_9074 ) ( not ( = ?auto_9074 ?auto_9076 ) ) ( not ( = ?auto_9075 ?auto_9076 ) ) ( not ( = ?auto_9073 ?auto_9076 ) ) ( not ( = ?auto_9086 ?auto_9076 ) ) ( SURFACE-AT ?auto_9072 ?auto_9080 ) ( CLEAR ?auto_9072 ) ( IS-CRATE ?auto_9073 ) ( not ( = ?auto_9072 ?auto_9073 ) ) ( not ( = ?auto_9074 ?auto_9072 ) ) ( not ( = ?auto_9075 ?auto_9072 ) ) ( not ( = ?auto_9086 ?auto_9072 ) ) ( not ( = ?auto_9076 ?auto_9072 ) ) ( AVAILABLE ?auto_9087 ) ( TRUCK-AT ?auto_9085 ?auto_9078 ) ( not ( = ?auto_9078 ?auto_9080 ) ) ( not ( = ?auto_9083 ?auto_9078 ) ) ( not ( = ?auto_9082 ?auto_9078 ) ) ( HOIST-AT ?auto_9077 ?auto_9078 ) ( not ( = ?auto_9087 ?auto_9077 ) ) ( not ( = ?auto_9084 ?auto_9077 ) ) ( not ( = ?auto_9079 ?auto_9077 ) ) ( AVAILABLE ?auto_9077 ) ( SURFACE-AT ?auto_9073 ?auto_9078 ) ( ON ?auto_9073 ?auto_9081 ) ( CLEAR ?auto_9073 ) ( not ( = ?auto_9074 ?auto_9081 ) ) ( not ( = ?auto_9075 ?auto_9081 ) ) ( not ( = ?auto_9073 ?auto_9081 ) ) ( not ( = ?auto_9086 ?auto_9081 ) ) ( not ( = ?auto_9076 ?auto_9081 ) ) ( not ( = ?auto_9072 ?auto_9081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9073 ?auto_9074 ?auto_9075 )
      ( MAKE-3CRATE-VERIFY ?auto_9072 ?auto_9073 ?auto_9074 ?auto_9075 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9088 - SURFACE
      ?auto_9089 - SURFACE
      ?auto_9090 - SURFACE
      ?auto_9091 - SURFACE
      ?auto_9092 - SURFACE
    )
    :vars
    (
      ?auto_9104 - HOIST
      ?auto_9097 - PLACE
      ?auto_9100 - PLACE
      ?auto_9101 - HOIST
      ?auto_9103 - SURFACE
      ?auto_9099 - PLACE
      ?auto_9096 - HOIST
      ?auto_9093 - SURFACE
      ?auto_9102 - TRUCK
      ?auto_9095 - PLACE
      ?auto_9094 - HOIST
      ?auto_9098 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9104 ?auto_9097 ) ( IS-CRATE ?auto_9092 ) ( not ( = ?auto_9091 ?auto_9092 ) ) ( not ( = ?auto_9090 ?auto_9091 ) ) ( not ( = ?auto_9090 ?auto_9092 ) ) ( not ( = ?auto_9100 ?auto_9097 ) ) ( HOIST-AT ?auto_9101 ?auto_9100 ) ( not ( = ?auto_9104 ?auto_9101 ) ) ( AVAILABLE ?auto_9101 ) ( SURFACE-AT ?auto_9092 ?auto_9100 ) ( ON ?auto_9092 ?auto_9103 ) ( CLEAR ?auto_9092 ) ( not ( = ?auto_9091 ?auto_9103 ) ) ( not ( = ?auto_9092 ?auto_9103 ) ) ( not ( = ?auto_9090 ?auto_9103 ) ) ( IS-CRATE ?auto_9091 ) ( not ( = ?auto_9099 ?auto_9097 ) ) ( not ( = ?auto_9100 ?auto_9099 ) ) ( HOIST-AT ?auto_9096 ?auto_9099 ) ( not ( = ?auto_9104 ?auto_9096 ) ) ( not ( = ?auto_9101 ?auto_9096 ) ) ( AVAILABLE ?auto_9096 ) ( SURFACE-AT ?auto_9091 ?auto_9099 ) ( ON ?auto_9091 ?auto_9093 ) ( CLEAR ?auto_9091 ) ( not ( = ?auto_9091 ?auto_9093 ) ) ( not ( = ?auto_9092 ?auto_9093 ) ) ( not ( = ?auto_9090 ?auto_9093 ) ) ( not ( = ?auto_9103 ?auto_9093 ) ) ( SURFACE-AT ?auto_9089 ?auto_9097 ) ( CLEAR ?auto_9089 ) ( IS-CRATE ?auto_9090 ) ( not ( = ?auto_9089 ?auto_9090 ) ) ( not ( = ?auto_9091 ?auto_9089 ) ) ( not ( = ?auto_9092 ?auto_9089 ) ) ( not ( = ?auto_9103 ?auto_9089 ) ) ( not ( = ?auto_9093 ?auto_9089 ) ) ( AVAILABLE ?auto_9104 ) ( TRUCK-AT ?auto_9102 ?auto_9095 ) ( not ( = ?auto_9095 ?auto_9097 ) ) ( not ( = ?auto_9100 ?auto_9095 ) ) ( not ( = ?auto_9099 ?auto_9095 ) ) ( HOIST-AT ?auto_9094 ?auto_9095 ) ( not ( = ?auto_9104 ?auto_9094 ) ) ( not ( = ?auto_9101 ?auto_9094 ) ) ( not ( = ?auto_9096 ?auto_9094 ) ) ( AVAILABLE ?auto_9094 ) ( SURFACE-AT ?auto_9090 ?auto_9095 ) ( ON ?auto_9090 ?auto_9098 ) ( CLEAR ?auto_9090 ) ( not ( = ?auto_9091 ?auto_9098 ) ) ( not ( = ?auto_9092 ?auto_9098 ) ) ( not ( = ?auto_9090 ?auto_9098 ) ) ( not ( = ?auto_9103 ?auto_9098 ) ) ( not ( = ?auto_9093 ?auto_9098 ) ) ( not ( = ?auto_9089 ?auto_9098 ) ) ( ON ?auto_9089 ?auto_9088 ) ( not ( = ?auto_9088 ?auto_9089 ) ) ( not ( = ?auto_9088 ?auto_9090 ) ) ( not ( = ?auto_9088 ?auto_9091 ) ) ( not ( = ?auto_9088 ?auto_9092 ) ) ( not ( = ?auto_9088 ?auto_9103 ) ) ( not ( = ?auto_9088 ?auto_9093 ) ) ( not ( = ?auto_9088 ?auto_9098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9090 ?auto_9091 ?auto_9092 )
      ( MAKE-4CRATE-VERIFY ?auto_9088 ?auto_9089 ?auto_9090 ?auto_9091 ?auto_9092 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9105 - SURFACE
      ?auto_9106 - SURFACE
    )
    :vars
    (
      ?auto_9119 - HOIST
      ?auto_9111 - PLACE
      ?auto_9120 - SURFACE
      ?auto_9115 - PLACE
      ?auto_9116 - HOIST
      ?auto_9118 - SURFACE
      ?auto_9113 - PLACE
      ?auto_9110 - HOIST
      ?auto_9107 - SURFACE
      ?auto_9114 - SURFACE
      ?auto_9109 - PLACE
      ?auto_9108 - HOIST
      ?auto_9112 - SURFACE
      ?auto_9117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9119 ?auto_9111 ) ( IS-CRATE ?auto_9106 ) ( not ( = ?auto_9105 ?auto_9106 ) ) ( not ( = ?auto_9120 ?auto_9105 ) ) ( not ( = ?auto_9120 ?auto_9106 ) ) ( not ( = ?auto_9115 ?auto_9111 ) ) ( HOIST-AT ?auto_9116 ?auto_9115 ) ( not ( = ?auto_9119 ?auto_9116 ) ) ( AVAILABLE ?auto_9116 ) ( SURFACE-AT ?auto_9106 ?auto_9115 ) ( ON ?auto_9106 ?auto_9118 ) ( CLEAR ?auto_9106 ) ( not ( = ?auto_9105 ?auto_9118 ) ) ( not ( = ?auto_9106 ?auto_9118 ) ) ( not ( = ?auto_9120 ?auto_9118 ) ) ( IS-CRATE ?auto_9105 ) ( not ( = ?auto_9113 ?auto_9111 ) ) ( not ( = ?auto_9115 ?auto_9113 ) ) ( HOIST-AT ?auto_9110 ?auto_9113 ) ( not ( = ?auto_9119 ?auto_9110 ) ) ( not ( = ?auto_9116 ?auto_9110 ) ) ( AVAILABLE ?auto_9110 ) ( SURFACE-AT ?auto_9105 ?auto_9113 ) ( ON ?auto_9105 ?auto_9107 ) ( CLEAR ?auto_9105 ) ( not ( = ?auto_9105 ?auto_9107 ) ) ( not ( = ?auto_9106 ?auto_9107 ) ) ( not ( = ?auto_9120 ?auto_9107 ) ) ( not ( = ?auto_9118 ?auto_9107 ) ) ( SURFACE-AT ?auto_9114 ?auto_9111 ) ( CLEAR ?auto_9114 ) ( IS-CRATE ?auto_9120 ) ( not ( = ?auto_9114 ?auto_9120 ) ) ( not ( = ?auto_9105 ?auto_9114 ) ) ( not ( = ?auto_9106 ?auto_9114 ) ) ( not ( = ?auto_9118 ?auto_9114 ) ) ( not ( = ?auto_9107 ?auto_9114 ) ) ( AVAILABLE ?auto_9119 ) ( not ( = ?auto_9109 ?auto_9111 ) ) ( not ( = ?auto_9115 ?auto_9109 ) ) ( not ( = ?auto_9113 ?auto_9109 ) ) ( HOIST-AT ?auto_9108 ?auto_9109 ) ( not ( = ?auto_9119 ?auto_9108 ) ) ( not ( = ?auto_9116 ?auto_9108 ) ) ( not ( = ?auto_9110 ?auto_9108 ) ) ( AVAILABLE ?auto_9108 ) ( SURFACE-AT ?auto_9120 ?auto_9109 ) ( ON ?auto_9120 ?auto_9112 ) ( CLEAR ?auto_9120 ) ( not ( = ?auto_9105 ?auto_9112 ) ) ( not ( = ?auto_9106 ?auto_9112 ) ) ( not ( = ?auto_9120 ?auto_9112 ) ) ( not ( = ?auto_9118 ?auto_9112 ) ) ( not ( = ?auto_9107 ?auto_9112 ) ) ( not ( = ?auto_9114 ?auto_9112 ) ) ( TRUCK-AT ?auto_9117 ?auto_9111 ) )
    :subtasks
    ( ( !DRIVE ?auto_9117 ?auto_9111 ?auto_9109 )
      ( MAKE-2CRATE ?auto_9120 ?auto_9105 ?auto_9106 )
      ( MAKE-1CRATE-VERIFY ?auto_9105 ?auto_9106 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9121 - SURFACE
      ?auto_9122 - SURFACE
      ?auto_9123 - SURFACE
    )
    :vars
    (
      ?auto_9136 - HOIST
      ?auto_9134 - PLACE
      ?auto_9124 - PLACE
      ?auto_9130 - HOIST
      ?auto_9132 - SURFACE
      ?auto_9129 - PLACE
      ?auto_9128 - HOIST
      ?auto_9135 - SURFACE
      ?auto_9131 - SURFACE
      ?auto_9133 - PLACE
      ?auto_9127 - HOIST
      ?auto_9125 - SURFACE
      ?auto_9126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9136 ?auto_9134 ) ( IS-CRATE ?auto_9123 ) ( not ( = ?auto_9122 ?auto_9123 ) ) ( not ( = ?auto_9121 ?auto_9122 ) ) ( not ( = ?auto_9121 ?auto_9123 ) ) ( not ( = ?auto_9124 ?auto_9134 ) ) ( HOIST-AT ?auto_9130 ?auto_9124 ) ( not ( = ?auto_9136 ?auto_9130 ) ) ( AVAILABLE ?auto_9130 ) ( SURFACE-AT ?auto_9123 ?auto_9124 ) ( ON ?auto_9123 ?auto_9132 ) ( CLEAR ?auto_9123 ) ( not ( = ?auto_9122 ?auto_9132 ) ) ( not ( = ?auto_9123 ?auto_9132 ) ) ( not ( = ?auto_9121 ?auto_9132 ) ) ( IS-CRATE ?auto_9122 ) ( not ( = ?auto_9129 ?auto_9134 ) ) ( not ( = ?auto_9124 ?auto_9129 ) ) ( HOIST-AT ?auto_9128 ?auto_9129 ) ( not ( = ?auto_9136 ?auto_9128 ) ) ( not ( = ?auto_9130 ?auto_9128 ) ) ( AVAILABLE ?auto_9128 ) ( SURFACE-AT ?auto_9122 ?auto_9129 ) ( ON ?auto_9122 ?auto_9135 ) ( CLEAR ?auto_9122 ) ( not ( = ?auto_9122 ?auto_9135 ) ) ( not ( = ?auto_9123 ?auto_9135 ) ) ( not ( = ?auto_9121 ?auto_9135 ) ) ( not ( = ?auto_9132 ?auto_9135 ) ) ( SURFACE-AT ?auto_9131 ?auto_9134 ) ( CLEAR ?auto_9131 ) ( IS-CRATE ?auto_9121 ) ( not ( = ?auto_9131 ?auto_9121 ) ) ( not ( = ?auto_9122 ?auto_9131 ) ) ( not ( = ?auto_9123 ?auto_9131 ) ) ( not ( = ?auto_9132 ?auto_9131 ) ) ( not ( = ?auto_9135 ?auto_9131 ) ) ( AVAILABLE ?auto_9136 ) ( not ( = ?auto_9133 ?auto_9134 ) ) ( not ( = ?auto_9124 ?auto_9133 ) ) ( not ( = ?auto_9129 ?auto_9133 ) ) ( HOIST-AT ?auto_9127 ?auto_9133 ) ( not ( = ?auto_9136 ?auto_9127 ) ) ( not ( = ?auto_9130 ?auto_9127 ) ) ( not ( = ?auto_9128 ?auto_9127 ) ) ( AVAILABLE ?auto_9127 ) ( SURFACE-AT ?auto_9121 ?auto_9133 ) ( ON ?auto_9121 ?auto_9125 ) ( CLEAR ?auto_9121 ) ( not ( = ?auto_9122 ?auto_9125 ) ) ( not ( = ?auto_9123 ?auto_9125 ) ) ( not ( = ?auto_9121 ?auto_9125 ) ) ( not ( = ?auto_9132 ?auto_9125 ) ) ( not ( = ?auto_9135 ?auto_9125 ) ) ( not ( = ?auto_9131 ?auto_9125 ) ) ( TRUCK-AT ?auto_9126 ?auto_9134 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9122 ?auto_9123 )
      ( MAKE-2CRATE-VERIFY ?auto_9121 ?auto_9122 ?auto_9123 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9137 - SURFACE
      ?auto_9138 - SURFACE
      ?auto_9139 - SURFACE
      ?auto_9140 - SURFACE
    )
    :vars
    (
      ?auto_9148 - HOIST
      ?auto_9150 - PLACE
      ?auto_9143 - PLACE
      ?auto_9145 - HOIST
      ?auto_9152 - SURFACE
      ?auto_9149 - PLACE
      ?auto_9146 - HOIST
      ?auto_9144 - SURFACE
      ?auto_9141 - PLACE
      ?auto_9142 - HOIST
      ?auto_9147 - SURFACE
      ?auto_9151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9148 ?auto_9150 ) ( IS-CRATE ?auto_9140 ) ( not ( = ?auto_9139 ?auto_9140 ) ) ( not ( = ?auto_9138 ?auto_9139 ) ) ( not ( = ?auto_9138 ?auto_9140 ) ) ( not ( = ?auto_9143 ?auto_9150 ) ) ( HOIST-AT ?auto_9145 ?auto_9143 ) ( not ( = ?auto_9148 ?auto_9145 ) ) ( AVAILABLE ?auto_9145 ) ( SURFACE-AT ?auto_9140 ?auto_9143 ) ( ON ?auto_9140 ?auto_9152 ) ( CLEAR ?auto_9140 ) ( not ( = ?auto_9139 ?auto_9152 ) ) ( not ( = ?auto_9140 ?auto_9152 ) ) ( not ( = ?auto_9138 ?auto_9152 ) ) ( IS-CRATE ?auto_9139 ) ( not ( = ?auto_9149 ?auto_9150 ) ) ( not ( = ?auto_9143 ?auto_9149 ) ) ( HOIST-AT ?auto_9146 ?auto_9149 ) ( not ( = ?auto_9148 ?auto_9146 ) ) ( not ( = ?auto_9145 ?auto_9146 ) ) ( AVAILABLE ?auto_9146 ) ( SURFACE-AT ?auto_9139 ?auto_9149 ) ( ON ?auto_9139 ?auto_9144 ) ( CLEAR ?auto_9139 ) ( not ( = ?auto_9139 ?auto_9144 ) ) ( not ( = ?auto_9140 ?auto_9144 ) ) ( not ( = ?auto_9138 ?auto_9144 ) ) ( not ( = ?auto_9152 ?auto_9144 ) ) ( SURFACE-AT ?auto_9137 ?auto_9150 ) ( CLEAR ?auto_9137 ) ( IS-CRATE ?auto_9138 ) ( not ( = ?auto_9137 ?auto_9138 ) ) ( not ( = ?auto_9139 ?auto_9137 ) ) ( not ( = ?auto_9140 ?auto_9137 ) ) ( not ( = ?auto_9152 ?auto_9137 ) ) ( not ( = ?auto_9144 ?auto_9137 ) ) ( AVAILABLE ?auto_9148 ) ( not ( = ?auto_9141 ?auto_9150 ) ) ( not ( = ?auto_9143 ?auto_9141 ) ) ( not ( = ?auto_9149 ?auto_9141 ) ) ( HOIST-AT ?auto_9142 ?auto_9141 ) ( not ( = ?auto_9148 ?auto_9142 ) ) ( not ( = ?auto_9145 ?auto_9142 ) ) ( not ( = ?auto_9146 ?auto_9142 ) ) ( AVAILABLE ?auto_9142 ) ( SURFACE-AT ?auto_9138 ?auto_9141 ) ( ON ?auto_9138 ?auto_9147 ) ( CLEAR ?auto_9138 ) ( not ( = ?auto_9139 ?auto_9147 ) ) ( not ( = ?auto_9140 ?auto_9147 ) ) ( not ( = ?auto_9138 ?auto_9147 ) ) ( not ( = ?auto_9152 ?auto_9147 ) ) ( not ( = ?auto_9144 ?auto_9147 ) ) ( not ( = ?auto_9137 ?auto_9147 ) ) ( TRUCK-AT ?auto_9151 ?auto_9150 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9138 ?auto_9139 ?auto_9140 )
      ( MAKE-3CRATE-VERIFY ?auto_9137 ?auto_9138 ?auto_9139 ?auto_9140 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9153 - SURFACE
      ?auto_9154 - SURFACE
      ?auto_9155 - SURFACE
      ?auto_9156 - SURFACE
      ?auto_9157 - SURFACE
    )
    :vars
    (
      ?auto_9165 - HOIST
      ?auto_9167 - PLACE
      ?auto_9160 - PLACE
      ?auto_9162 - HOIST
      ?auto_9169 - SURFACE
      ?auto_9166 - PLACE
      ?auto_9163 - HOIST
      ?auto_9161 - SURFACE
      ?auto_9158 - PLACE
      ?auto_9159 - HOIST
      ?auto_9164 - SURFACE
      ?auto_9168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9165 ?auto_9167 ) ( IS-CRATE ?auto_9157 ) ( not ( = ?auto_9156 ?auto_9157 ) ) ( not ( = ?auto_9155 ?auto_9156 ) ) ( not ( = ?auto_9155 ?auto_9157 ) ) ( not ( = ?auto_9160 ?auto_9167 ) ) ( HOIST-AT ?auto_9162 ?auto_9160 ) ( not ( = ?auto_9165 ?auto_9162 ) ) ( AVAILABLE ?auto_9162 ) ( SURFACE-AT ?auto_9157 ?auto_9160 ) ( ON ?auto_9157 ?auto_9169 ) ( CLEAR ?auto_9157 ) ( not ( = ?auto_9156 ?auto_9169 ) ) ( not ( = ?auto_9157 ?auto_9169 ) ) ( not ( = ?auto_9155 ?auto_9169 ) ) ( IS-CRATE ?auto_9156 ) ( not ( = ?auto_9166 ?auto_9167 ) ) ( not ( = ?auto_9160 ?auto_9166 ) ) ( HOIST-AT ?auto_9163 ?auto_9166 ) ( not ( = ?auto_9165 ?auto_9163 ) ) ( not ( = ?auto_9162 ?auto_9163 ) ) ( AVAILABLE ?auto_9163 ) ( SURFACE-AT ?auto_9156 ?auto_9166 ) ( ON ?auto_9156 ?auto_9161 ) ( CLEAR ?auto_9156 ) ( not ( = ?auto_9156 ?auto_9161 ) ) ( not ( = ?auto_9157 ?auto_9161 ) ) ( not ( = ?auto_9155 ?auto_9161 ) ) ( not ( = ?auto_9169 ?auto_9161 ) ) ( SURFACE-AT ?auto_9154 ?auto_9167 ) ( CLEAR ?auto_9154 ) ( IS-CRATE ?auto_9155 ) ( not ( = ?auto_9154 ?auto_9155 ) ) ( not ( = ?auto_9156 ?auto_9154 ) ) ( not ( = ?auto_9157 ?auto_9154 ) ) ( not ( = ?auto_9169 ?auto_9154 ) ) ( not ( = ?auto_9161 ?auto_9154 ) ) ( AVAILABLE ?auto_9165 ) ( not ( = ?auto_9158 ?auto_9167 ) ) ( not ( = ?auto_9160 ?auto_9158 ) ) ( not ( = ?auto_9166 ?auto_9158 ) ) ( HOIST-AT ?auto_9159 ?auto_9158 ) ( not ( = ?auto_9165 ?auto_9159 ) ) ( not ( = ?auto_9162 ?auto_9159 ) ) ( not ( = ?auto_9163 ?auto_9159 ) ) ( AVAILABLE ?auto_9159 ) ( SURFACE-AT ?auto_9155 ?auto_9158 ) ( ON ?auto_9155 ?auto_9164 ) ( CLEAR ?auto_9155 ) ( not ( = ?auto_9156 ?auto_9164 ) ) ( not ( = ?auto_9157 ?auto_9164 ) ) ( not ( = ?auto_9155 ?auto_9164 ) ) ( not ( = ?auto_9169 ?auto_9164 ) ) ( not ( = ?auto_9161 ?auto_9164 ) ) ( not ( = ?auto_9154 ?auto_9164 ) ) ( TRUCK-AT ?auto_9168 ?auto_9167 ) ( ON ?auto_9154 ?auto_9153 ) ( not ( = ?auto_9153 ?auto_9154 ) ) ( not ( = ?auto_9153 ?auto_9155 ) ) ( not ( = ?auto_9153 ?auto_9156 ) ) ( not ( = ?auto_9153 ?auto_9157 ) ) ( not ( = ?auto_9153 ?auto_9169 ) ) ( not ( = ?auto_9153 ?auto_9161 ) ) ( not ( = ?auto_9153 ?auto_9164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9155 ?auto_9156 ?auto_9157 )
      ( MAKE-4CRATE-VERIFY ?auto_9153 ?auto_9154 ?auto_9155 ?auto_9156 ?auto_9157 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9170 - SURFACE
      ?auto_9171 - SURFACE
    )
    :vars
    (
      ?auto_9181 - HOIST
      ?auto_9183 - PLACE
      ?auto_9177 - SURFACE
      ?auto_9174 - PLACE
      ?auto_9178 - HOIST
      ?auto_9185 - SURFACE
      ?auto_9182 - PLACE
      ?auto_9179 - HOIST
      ?auto_9175 - SURFACE
      ?auto_9176 - SURFACE
      ?auto_9172 - PLACE
      ?auto_9173 - HOIST
      ?auto_9180 - SURFACE
      ?auto_9184 - TRUCK
      ?auto_9186 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9181 ?auto_9183 ) ( IS-CRATE ?auto_9171 ) ( not ( = ?auto_9170 ?auto_9171 ) ) ( not ( = ?auto_9177 ?auto_9170 ) ) ( not ( = ?auto_9177 ?auto_9171 ) ) ( not ( = ?auto_9174 ?auto_9183 ) ) ( HOIST-AT ?auto_9178 ?auto_9174 ) ( not ( = ?auto_9181 ?auto_9178 ) ) ( AVAILABLE ?auto_9178 ) ( SURFACE-AT ?auto_9171 ?auto_9174 ) ( ON ?auto_9171 ?auto_9185 ) ( CLEAR ?auto_9171 ) ( not ( = ?auto_9170 ?auto_9185 ) ) ( not ( = ?auto_9171 ?auto_9185 ) ) ( not ( = ?auto_9177 ?auto_9185 ) ) ( IS-CRATE ?auto_9170 ) ( not ( = ?auto_9182 ?auto_9183 ) ) ( not ( = ?auto_9174 ?auto_9182 ) ) ( HOIST-AT ?auto_9179 ?auto_9182 ) ( not ( = ?auto_9181 ?auto_9179 ) ) ( not ( = ?auto_9178 ?auto_9179 ) ) ( AVAILABLE ?auto_9179 ) ( SURFACE-AT ?auto_9170 ?auto_9182 ) ( ON ?auto_9170 ?auto_9175 ) ( CLEAR ?auto_9170 ) ( not ( = ?auto_9170 ?auto_9175 ) ) ( not ( = ?auto_9171 ?auto_9175 ) ) ( not ( = ?auto_9177 ?auto_9175 ) ) ( not ( = ?auto_9185 ?auto_9175 ) ) ( IS-CRATE ?auto_9177 ) ( not ( = ?auto_9176 ?auto_9177 ) ) ( not ( = ?auto_9170 ?auto_9176 ) ) ( not ( = ?auto_9171 ?auto_9176 ) ) ( not ( = ?auto_9185 ?auto_9176 ) ) ( not ( = ?auto_9175 ?auto_9176 ) ) ( not ( = ?auto_9172 ?auto_9183 ) ) ( not ( = ?auto_9174 ?auto_9172 ) ) ( not ( = ?auto_9182 ?auto_9172 ) ) ( HOIST-AT ?auto_9173 ?auto_9172 ) ( not ( = ?auto_9181 ?auto_9173 ) ) ( not ( = ?auto_9178 ?auto_9173 ) ) ( not ( = ?auto_9179 ?auto_9173 ) ) ( AVAILABLE ?auto_9173 ) ( SURFACE-AT ?auto_9177 ?auto_9172 ) ( ON ?auto_9177 ?auto_9180 ) ( CLEAR ?auto_9177 ) ( not ( = ?auto_9170 ?auto_9180 ) ) ( not ( = ?auto_9171 ?auto_9180 ) ) ( not ( = ?auto_9177 ?auto_9180 ) ) ( not ( = ?auto_9185 ?auto_9180 ) ) ( not ( = ?auto_9175 ?auto_9180 ) ) ( not ( = ?auto_9176 ?auto_9180 ) ) ( TRUCK-AT ?auto_9184 ?auto_9183 ) ( SURFACE-AT ?auto_9186 ?auto_9183 ) ( CLEAR ?auto_9186 ) ( LIFTING ?auto_9181 ?auto_9176 ) ( IS-CRATE ?auto_9176 ) ( not ( = ?auto_9186 ?auto_9176 ) ) ( not ( = ?auto_9170 ?auto_9186 ) ) ( not ( = ?auto_9171 ?auto_9186 ) ) ( not ( = ?auto_9177 ?auto_9186 ) ) ( not ( = ?auto_9185 ?auto_9186 ) ) ( not ( = ?auto_9175 ?auto_9186 ) ) ( not ( = ?auto_9180 ?auto_9186 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9186 ?auto_9176 )
      ( MAKE-2CRATE ?auto_9177 ?auto_9170 ?auto_9171 )
      ( MAKE-1CRATE-VERIFY ?auto_9170 ?auto_9171 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9187 - SURFACE
      ?auto_9188 - SURFACE
      ?auto_9189 - SURFACE
    )
    :vars
    (
      ?auto_9195 - HOIST
      ?auto_9193 - PLACE
      ?auto_9197 - PLACE
      ?auto_9200 - HOIST
      ?auto_9199 - SURFACE
      ?auto_9191 - PLACE
      ?auto_9190 - HOIST
      ?auto_9198 - SURFACE
      ?auto_9194 - SURFACE
      ?auto_9203 - PLACE
      ?auto_9202 - HOIST
      ?auto_9192 - SURFACE
      ?auto_9196 - TRUCK
      ?auto_9201 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9195 ?auto_9193 ) ( IS-CRATE ?auto_9189 ) ( not ( = ?auto_9188 ?auto_9189 ) ) ( not ( = ?auto_9187 ?auto_9188 ) ) ( not ( = ?auto_9187 ?auto_9189 ) ) ( not ( = ?auto_9197 ?auto_9193 ) ) ( HOIST-AT ?auto_9200 ?auto_9197 ) ( not ( = ?auto_9195 ?auto_9200 ) ) ( AVAILABLE ?auto_9200 ) ( SURFACE-AT ?auto_9189 ?auto_9197 ) ( ON ?auto_9189 ?auto_9199 ) ( CLEAR ?auto_9189 ) ( not ( = ?auto_9188 ?auto_9199 ) ) ( not ( = ?auto_9189 ?auto_9199 ) ) ( not ( = ?auto_9187 ?auto_9199 ) ) ( IS-CRATE ?auto_9188 ) ( not ( = ?auto_9191 ?auto_9193 ) ) ( not ( = ?auto_9197 ?auto_9191 ) ) ( HOIST-AT ?auto_9190 ?auto_9191 ) ( not ( = ?auto_9195 ?auto_9190 ) ) ( not ( = ?auto_9200 ?auto_9190 ) ) ( AVAILABLE ?auto_9190 ) ( SURFACE-AT ?auto_9188 ?auto_9191 ) ( ON ?auto_9188 ?auto_9198 ) ( CLEAR ?auto_9188 ) ( not ( = ?auto_9188 ?auto_9198 ) ) ( not ( = ?auto_9189 ?auto_9198 ) ) ( not ( = ?auto_9187 ?auto_9198 ) ) ( not ( = ?auto_9199 ?auto_9198 ) ) ( IS-CRATE ?auto_9187 ) ( not ( = ?auto_9194 ?auto_9187 ) ) ( not ( = ?auto_9188 ?auto_9194 ) ) ( not ( = ?auto_9189 ?auto_9194 ) ) ( not ( = ?auto_9199 ?auto_9194 ) ) ( not ( = ?auto_9198 ?auto_9194 ) ) ( not ( = ?auto_9203 ?auto_9193 ) ) ( not ( = ?auto_9197 ?auto_9203 ) ) ( not ( = ?auto_9191 ?auto_9203 ) ) ( HOIST-AT ?auto_9202 ?auto_9203 ) ( not ( = ?auto_9195 ?auto_9202 ) ) ( not ( = ?auto_9200 ?auto_9202 ) ) ( not ( = ?auto_9190 ?auto_9202 ) ) ( AVAILABLE ?auto_9202 ) ( SURFACE-AT ?auto_9187 ?auto_9203 ) ( ON ?auto_9187 ?auto_9192 ) ( CLEAR ?auto_9187 ) ( not ( = ?auto_9188 ?auto_9192 ) ) ( not ( = ?auto_9189 ?auto_9192 ) ) ( not ( = ?auto_9187 ?auto_9192 ) ) ( not ( = ?auto_9199 ?auto_9192 ) ) ( not ( = ?auto_9198 ?auto_9192 ) ) ( not ( = ?auto_9194 ?auto_9192 ) ) ( TRUCK-AT ?auto_9196 ?auto_9193 ) ( SURFACE-AT ?auto_9201 ?auto_9193 ) ( CLEAR ?auto_9201 ) ( LIFTING ?auto_9195 ?auto_9194 ) ( IS-CRATE ?auto_9194 ) ( not ( = ?auto_9201 ?auto_9194 ) ) ( not ( = ?auto_9188 ?auto_9201 ) ) ( not ( = ?auto_9189 ?auto_9201 ) ) ( not ( = ?auto_9187 ?auto_9201 ) ) ( not ( = ?auto_9199 ?auto_9201 ) ) ( not ( = ?auto_9198 ?auto_9201 ) ) ( not ( = ?auto_9192 ?auto_9201 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9188 ?auto_9189 )
      ( MAKE-2CRATE-VERIFY ?auto_9187 ?auto_9188 ?auto_9189 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9204 - SURFACE
      ?auto_9205 - SURFACE
      ?auto_9206 - SURFACE
      ?auto_9207 - SURFACE
    )
    :vars
    (
      ?auto_9212 - HOIST
      ?auto_9209 - PLACE
      ?auto_9208 - PLACE
      ?auto_9211 - HOIST
      ?auto_9213 - SURFACE
      ?auto_9218 - PLACE
      ?auto_9217 - HOIST
      ?auto_9216 - SURFACE
      ?auto_9219 - PLACE
      ?auto_9210 - HOIST
      ?auto_9214 - SURFACE
      ?auto_9215 - TRUCK
      ?auto_9220 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9212 ?auto_9209 ) ( IS-CRATE ?auto_9207 ) ( not ( = ?auto_9206 ?auto_9207 ) ) ( not ( = ?auto_9205 ?auto_9206 ) ) ( not ( = ?auto_9205 ?auto_9207 ) ) ( not ( = ?auto_9208 ?auto_9209 ) ) ( HOIST-AT ?auto_9211 ?auto_9208 ) ( not ( = ?auto_9212 ?auto_9211 ) ) ( AVAILABLE ?auto_9211 ) ( SURFACE-AT ?auto_9207 ?auto_9208 ) ( ON ?auto_9207 ?auto_9213 ) ( CLEAR ?auto_9207 ) ( not ( = ?auto_9206 ?auto_9213 ) ) ( not ( = ?auto_9207 ?auto_9213 ) ) ( not ( = ?auto_9205 ?auto_9213 ) ) ( IS-CRATE ?auto_9206 ) ( not ( = ?auto_9218 ?auto_9209 ) ) ( not ( = ?auto_9208 ?auto_9218 ) ) ( HOIST-AT ?auto_9217 ?auto_9218 ) ( not ( = ?auto_9212 ?auto_9217 ) ) ( not ( = ?auto_9211 ?auto_9217 ) ) ( AVAILABLE ?auto_9217 ) ( SURFACE-AT ?auto_9206 ?auto_9218 ) ( ON ?auto_9206 ?auto_9216 ) ( CLEAR ?auto_9206 ) ( not ( = ?auto_9206 ?auto_9216 ) ) ( not ( = ?auto_9207 ?auto_9216 ) ) ( not ( = ?auto_9205 ?auto_9216 ) ) ( not ( = ?auto_9213 ?auto_9216 ) ) ( IS-CRATE ?auto_9205 ) ( not ( = ?auto_9204 ?auto_9205 ) ) ( not ( = ?auto_9206 ?auto_9204 ) ) ( not ( = ?auto_9207 ?auto_9204 ) ) ( not ( = ?auto_9213 ?auto_9204 ) ) ( not ( = ?auto_9216 ?auto_9204 ) ) ( not ( = ?auto_9219 ?auto_9209 ) ) ( not ( = ?auto_9208 ?auto_9219 ) ) ( not ( = ?auto_9218 ?auto_9219 ) ) ( HOIST-AT ?auto_9210 ?auto_9219 ) ( not ( = ?auto_9212 ?auto_9210 ) ) ( not ( = ?auto_9211 ?auto_9210 ) ) ( not ( = ?auto_9217 ?auto_9210 ) ) ( AVAILABLE ?auto_9210 ) ( SURFACE-AT ?auto_9205 ?auto_9219 ) ( ON ?auto_9205 ?auto_9214 ) ( CLEAR ?auto_9205 ) ( not ( = ?auto_9206 ?auto_9214 ) ) ( not ( = ?auto_9207 ?auto_9214 ) ) ( not ( = ?auto_9205 ?auto_9214 ) ) ( not ( = ?auto_9213 ?auto_9214 ) ) ( not ( = ?auto_9216 ?auto_9214 ) ) ( not ( = ?auto_9204 ?auto_9214 ) ) ( TRUCK-AT ?auto_9215 ?auto_9209 ) ( SURFACE-AT ?auto_9220 ?auto_9209 ) ( CLEAR ?auto_9220 ) ( LIFTING ?auto_9212 ?auto_9204 ) ( IS-CRATE ?auto_9204 ) ( not ( = ?auto_9220 ?auto_9204 ) ) ( not ( = ?auto_9206 ?auto_9220 ) ) ( not ( = ?auto_9207 ?auto_9220 ) ) ( not ( = ?auto_9205 ?auto_9220 ) ) ( not ( = ?auto_9213 ?auto_9220 ) ) ( not ( = ?auto_9216 ?auto_9220 ) ) ( not ( = ?auto_9214 ?auto_9220 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9205 ?auto_9206 ?auto_9207 )
      ( MAKE-3CRATE-VERIFY ?auto_9204 ?auto_9205 ?auto_9206 ?auto_9207 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9221 - SURFACE
      ?auto_9222 - SURFACE
      ?auto_9223 - SURFACE
      ?auto_9224 - SURFACE
      ?auto_9225 - SURFACE
    )
    :vars
    (
      ?auto_9230 - HOIST
      ?auto_9227 - PLACE
      ?auto_9226 - PLACE
      ?auto_9229 - HOIST
      ?auto_9231 - SURFACE
      ?auto_9236 - PLACE
      ?auto_9235 - HOIST
      ?auto_9234 - SURFACE
      ?auto_9237 - PLACE
      ?auto_9228 - HOIST
      ?auto_9232 - SURFACE
      ?auto_9233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9230 ?auto_9227 ) ( IS-CRATE ?auto_9225 ) ( not ( = ?auto_9224 ?auto_9225 ) ) ( not ( = ?auto_9223 ?auto_9224 ) ) ( not ( = ?auto_9223 ?auto_9225 ) ) ( not ( = ?auto_9226 ?auto_9227 ) ) ( HOIST-AT ?auto_9229 ?auto_9226 ) ( not ( = ?auto_9230 ?auto_9229 ) ) ( AVAILABLE ?auto_9229 ) ( SURFACE-AT ?auto_9225 ?auto_9226 ) ( ON ?auto_9225 ?auto_9231 ) ( CLEAR ?auto_9225 ) ( not ( = ?auto_9224 ?auto_9231 ) ) ( not ( = ?auto_9225 ?auto_9231 ) ) ( not ( = ?auto_9223 ?auto_9231 ) ) ( IS-CRATE ?auto_9224 ) ( not ( = ?auto_9236 ?auto_9227 ) ) ( not ( = ?auto_9226 ?auto_9236 ) ) ( HOIST-AT ?auto_9235 ?auto_9236 ) ( not ( = ?auto_9230 ?auto_9235 ) ) ( not ( = ?auto_9229 ?auto_9235 ) ) ( AVAILABLE ?auto_9235 ) ( SURFACE-AT ?auto_9224 ?auto_9236 ) ( ON ?auto_9224 ?auto_9234 ) ( CLEAR ?auto_9224 ) ( not ( = ?auto_9224 ?auto_9234 ) ) ( not ( = ?auto_9225 ?auto_9234 ) ) ( not ( = ?auto_9223 ?auto_9234 ) ) ( not ( = ?auto_9231 ?auto_9234 ) ) ( IS-CRATE ?auto_9223 ) ( not ( = ?auto_9222 ?auto_9223 ) ) ( not ( = ?auto_9224 ?auto_9222 ) ) ( not ( = ?auto_9225 ?auto_9222 ) ) ( not ( = ?auto_9231 ?auto_9222 ) ) ( not ( = ?auto_9234 ?auto_9222 ) ) ( not ( = ?auto_9237 ?auto_9227 ) ) ( not ( = ?auto_9226 ?auto_9237 ) ) ( not ( = ?auto_9236 ?auto_9237 ) ) ( HOIST-AT ?auto_9228 ?auto_9237 ) ( not ( = ?auto_9230 ?auto_9228 ) ) ( not ( = ?auto_9229 ?auto_9228 ) ) ( not ( = ?auto_9235 ?auto_9228 ) ) ( AVAILABLE ?auto_9228 ) ( SURFACE-AT ?auto_9223 ?auto_9237 ) ( ON ?auto_9223 ?auto_9232 ) ( CLEAR ?auto_9223 ) ( not ( = ?auto_9224 ?auto_9232 ) ) ( not ( = ?auto_9225 ?auto_9232 ) ) ( not ( = ?auto_9223 ?auto_9232 ) ) ( not ( = ?auto_9231 ?auto_9232 ) ) ( not ( = ?auto_9234 ?auto_9232 ) ) ( not ( = ?auto_9222 ?auto_9232 ) ) ( TRUCK-AT ?auto_9233 ?auto_9227 ) ( SURFACE-AT ?auto_9221 ?auto_9227 ) ( CLEAR ?auto_9221 ) ( LIFTING ?auto_9230 ?auto_9222 ) ( IS-CRATE ?auto_9222 ) ( not ( = ?auto_9221 ?auto_9222 ) ) ( not ( = ?auto_9224 ?auto_9221 ) ) ( not ( = ?auto_9225 ?auto_9221 ) ) ( not ( = ?auto_9223 ?auto_9221 ) ) ( not ( = ?auto_9231 ?auto_9221 ) ) ( not ( = ?auto_9234 ?auto_9221 ) ) ( not ( = ?auto_9232 ?auto_9221 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9223 ?auto_9224 ?auto_9225 )
      ( MAKE-4CRATE-VERIFY ?auto_9221 ?auto_9222 ?auto_9223 ?auto_9224 ?auto_9225 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9238 - SURFACE
      ?auto_9239 - SURFACE
    )
    :vars
    (
      ?auto_9245 - HOIST
      ?auto_9242 - PLACE
      ?auto_9240 - SURFACE
      ?auto_9241 - PLACE
      ?auto_9244 - HOIST
      ?auto_9246 - SURFACE
      ?auto_9252 - PLACE
      ?auto_9251 - HOIST
      ?auto_9250 - SURFACE
      ?auto_9249 - SURFACE
      ?auto_9253 - PLACE
      ?auto_9243 - HOIST
      ?auto_9247 - SURFACE
      ?auto_9248 - TRUCK
      ?auto_9254 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9245 ?auto_9242 ) ( IS-CRATE ?auto_9239 ) ( not ( = ?auto_9238 ?auto_9239 ) ) ( not ( = ?auto_9240 ?auto_9238 ) ) ( not ( = ?auto_9240 ?auto_9239 ) ) ( not ( = ?auto_9241 ?auto_9242 ) ) ( HOIST-AT ?auto_9244 ?auto_9241 ) ( not ( = ?auto_9245 ?auto_9244 ) ) ( AVAILABLE ?auto_9244 ) ( SURFACE-AT ?auto_9239 ?auto_9241 ) ( ON ?auto_9239 ?auto_9246 ) ( CLEAR ?auto_9239 ) ( not ( = ?auto_9238 ?auto_9246 ) ) ( not ( = ?auto_9239 ?auto_9246 ) ) ( not ( = ?auto_9240 ?auto_9246 ) ) ( IS-CRATE ?auto_9238 ) ( not ( = ?auto_9252 ?auto_9242 ) ) ( not ( = ?auto_9241 ?auto_9252 ) ) ( HOIST-AT ?auto_9251 ?auto_9252 ) ( not ( = ?auto_9245 ?auto_9251 ) ) ( not ( = ?auto_9244 ?auto_9251 ) ) ( AVAILABLE ?auto_9251 ) ( SURFACE-AT ?auto_9238 ?auto_9252 ) ( ON ?auto_9238 ?auto_9250 ) ( CLEAR ?auto_9238 ) ( not ( = ?auto_9238 ?auto_9250 ) ) ( not ( = ?auto_9239 ?auto_9250 ) ) ( not ( = ?auto_9240 ?auto_9250 ) ) ( not ( = ?auto_9246 ?auto_9250 ) ) ( IS-CRATE ?auto_9240 ) ( not ( = ?auto_9249 ?auto_9240 ) ) ( not ( = ?auto_9238 ?auto_9249 ) ) ( not ( = ?auto_9239 ?auto_9249 ) ) ( not ( = ?auto_9246 ?auto_9249 ) ) ( not ( = ?auto_9250 ?auto_9249 ) ) ( not ( = ?auto_9253 ?auto_9242 ) ) ( not ( = ?auto_9241 ?auto_9253 ) ) ( not ( = ?auto_9252 ?auto_9253 ) ) ( HOIST-AT ?auto_9243 ?auto_9253 ) ( not ( = ?auto_9245 ?auto_9243 ) ) ( not ( = ?auto_9244 ?auto_9243 ) ) ( not ( = ?auto_9251 ?auto_9243 ) ) ( AVAILABLE ?auto_9243 ) ( SURFACE-AT ?auto_9240 ?auto_9253 ) ( ON ?auto_9240 ?auto_9247 ) ( CLEAR ?auto_9240 ) ( not ( = ?auto_9238 ?auto_9247 ) ) ( not ( = ?auto_9239 ?auto_9247 ) ) ( not ( = ?auto_9240 ?auto_9247 ) ) ( not ( = ?auto_9246 ?auto_9247 ) ) ( not ( = ?auto_9250 ?auto_9247 ) ) ( not ( = ?auto_9249 ?auto_9247 ) ) ( TRUCK-AT ?auto_9248 ?auto_9242 ) ( SURFACE-AT ?auto_9254 ?auto_9242 ) ( CLEAR ?auto_9254 ) ( IS-CRATE ?auto_9249 ) ( not ( = ?auto_9254 ?auto_9249 ) ) ( not ( = ?auto_9238 ?auto_9254 ) ) ( not ( = ?auto_9239 ?auto_9254 ) ) ( not ( = ?auto_9240 ?auto_9254 ) ) ( not ( = ?auto_9246 ?auto_9254 ) ) ( not ( = ?auto_9250 ?auto_9254 ) ) ( not ( = ?auto_9247 ?auto_9254 ) ) ( AVAILABLE ?auto_9245 ) ( IN ?auto_9249 ?auto_9248 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9245 ?auto_9249 ?auto_9248 ?auto_9242 )
      ( MAKE-2CRATE ?auto_9240 ?auto_9238 ?auto_9239 )
      ( MAKE-1CRATE-VERIFY ?auto_9238 ?auto_9239 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9255 - SURFACE
      ?auto_9256 - SURFACE
      ?auto_9257 - SURFACE
    )
    :vars
    (
      ?auto_9265 - HOIST
      ?auto_9260 - PLACE
      ?auto_9263 - PLACE
      ?auto_9264 - HOIST
      ?auto_9266 - SURFACE
      ?auto_9261 - PLACE
      ?auto_9262 - HOIST
      ?auto_9270 - SURFACE
      ?auto_9259 - SURFACE
      ?auto_9269 - PLACE
      ?auto_9267 - HOIST
      ?auto_9258 - SURFACE
      ?auto_9268 - TRUCK
      ?auto_9271 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9265 ?auto_9260 ) ( IS-CRATE ?auto_9257 ) ( not ( = ?auto_9256 ?auto_9257 ) ) ( not ( = ?auto_9255 ?auto_9256 ) ) ( not ( = ?auto_9255 ?auto_9257 ) ) ( not ( = ?auto_9263 ?auto_9260 ) ) ( HOIST-AT ?auto_9264 ?auto_9263 ) ( not ( = ?auto_9265 ?auto_9264 ) ) ( AVAILABLE ?auto_9264 ) ( SURFACE-AT ?auto_9257 ?auto_9263 ) ( ON ?auto_9257 ?auto_9266 ) ( CLEAR ?auto_9257 ) ( not ( = ?auto_9256 ?auto_9266 ) ) ( not ( = ?auto_9257 ?auto_9266 ) ) ( not ( = ?auto_9255 ?auto_9266 ) ) ( IS-CRATE ?auto_9256 ) ( not ( = ?auto_9261 ?auto_9260 ) ) ( not ( = ?auto_9263 ?auto_9261 ) ) ( HOIST-AT ?auto_9262 ?auto_9261 ) ( not ( = ?auto_9265 ?auto_9262 ) ) ( not ( = ?auto_9264 ?auto_9262 ) ) ( AVAILABLE ?auto_9262 ) ( SURFACE-AT ?auto_9256 ?auto_9261 ) ( ON ?auto_9256 ?auto_9270 ) ( CLEAR ?auto_9256 ) ( not ( = ?auto_9256 ?auto_9270 ) ) ( not ( = ?auto_9257 ?auto_9270 ) ) ( not ( = ?auto_9255 ?auto_9270 ) ) ( not ( = ?auto_9266 ?auto_9270 ) ) ( IS-CRATE ?auto_9255 ) ( not ( = ?auto_9259 ?auto_9255 ) ) ( not ( = ?auto_9256 ?auto_9259 ) ) ( not ( = ?auto_9257 ?auto_9259 ) ) ( not ( = ?auto_9266 ?auto_9259 ) ) ( not ( = ?auto_9270 ?auto_9259 ) ) ( not ( = ?auto_9269 ?auto_9260 ) ) ( not ( = ?auto_9263 ?auto_9269 ) ) ( not ( = ?auto_9261 ?auto_9269 ) ) ( HOIST-AT ?auto_9267 ?auto_9269 ) ( not ( = ?auto_9265 ?auto_9267 ) ) ( not ( = ?auto_9264 ?auto_9267 ) ) ( not ( = ?auto_9262 ?auto_9267 ) ) ( AVAILABLE ?auto_9267 ) ( SURFACE-AT ?auto_9255 ?auto_9269 ) ( ON ?auto_9255 ?auto_9258 ) ( CLEAR ?auto_9255 ) ( not ( = ?auto_9256 ?auto_9258 ) ) ( not ( = ?auto_9257 ?auto_9258 ) ) ( not ( = ?auto_9255 ?auto_9258 ) ) ( not ( = ?auto_9266 ?auto_9258 ) ) ( not ( = ?auto_9270 ?auto_9258 ) ) ( not ( = ?auto_9259 ?auto_9258 ) ) ( TRUCK-AT ?auto_9268 ?auto_9260 ) ( SURFACE-AT ?auto_9271 ?auto_9260 ) ( CLEAR ?auto_9271 ) ( IS-CRATE ?auto_9259 ) ( not ( = ?auto_9271 ?auto_9259 ) ) ( not ( = ?auto_9256 ?auto_9271 ) ) ( not ( = ?auto_9257 ?auto_9271 ) ) ( not ( = ?auto_9255 ?auto_9271 ) ) ( not ( = ?auto_9266 ?auto_9271 ) ) ( not ( = ?auto_9270 ?auto_9271 ) ) ( not ( = ?auto_9258 ?auto_9271 ) ) ( AVAILABLE ?auto_9265 ) ( IN ?auto_9259 ?auto_9268 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9256 ?auto_9257 )
      ( MAKE-2CRATE-VERIFY ?auto_9255 ?auto_9256 ?auto_9257 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9272 - SURFACE
      ?auto_9273 - SURFACE
      ?auto_9274 - SURFACE
      ?auto_9275 - SURFACE
    )
    :vars
    (
      ?auto_9279 - HOIST
      ?auto_9278 - PLACE
      ?auto_9287 - PLACE
      ?auto_9276 - HOIST
      ?auto_9277 - SURFACE
      ?auto_9280 - PLACE
      ?auto_9286 - HOIST
      ?auto_9284 - SURFACE
      ?auto_9285 - PLACE
      ?auto_9288 - HOIST
      ?auto_9281 - SURFACE
      ?auto_9282 - TRUCK
      ?auto_9283 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9279 ?auto_9278 ) ( IS-CRATE ?auto_9275 ) ( not ( = ?auto_9274 ?auto_9275 ) ) ( not ( = ?auto_9273 ?auto_9274 ) ) ( not ( = ?auto_9273 ?auto_9275 ) ) ( not ( = ?auto_9287 ?auto_9278 ) ) ( HOIST-AT ?auto_9276 ?auto_9287 ) ( not ( = ?auto_9279 ?auto_9276 ) ) ( AVAILABLE ?auto_9276 ) ( SURFACE-AT ?auto_9275 ?auto_9287 ) ( ON ?auto_9275 ?auto_9277 ) ( CLEAR ?auto_9275 ) ( not ( = ?auto_9274 ?auto_9277 ) ) ( not ( = ?auto_9275 ?auto_9277 ) ) ( not ( = ?auto_9273 ?auto_9277 ) ) ( IS-CRATE ?auto_9274 ) ( not ( = ?auto_9280 ?auto_9278 ) ) ( not ( = ?auto_9287 ?auto_9280 ) ) ( HOIST-AT ?auto_9286 ?auto_9280 ) ( not ( = ?auto_9279 ?auto_9286 ) ) ( not ( = ?auto_9276 ?auto_9286 ) ) ( AVAILABLE ?auto_9286 ) ( SURFACE-AT ?auto_9274 ?auto_9280 ) ( ON ?auto_9274 ?auto_9284 ) ( CLEAR ?auto_9274 ) ( not ( = ?auto_9274 ?auto_9284 ) ) ( not ( = ?auto_9275 ?auto_9284 ) ) ( not ( = ?auto_9273 ?auto_9284 ) ) ( not ( = ?auto_9277 ?auto_9284 ) ) ( IS-CRATE ?auto_9273 ) ( not ( = ?auto_9272 ?auto_9273 ) ) ( not ( = ?auto_9274 ?auto_9272 ) ) ( not ( = ?auto_9275 ?auto_9272 ) ) ( not ( = ?auto_9277 ?auto_9272 ) ) ( not ( = ?auto_9284 ?auto_9272 ) ) ( not ( = ?auto_9285 ?auto_9278 ) ) ( not ( = ?auto_9287 ?auto_9285 ) ) ( not ( = ?auto_9280 ?auto_9285 ) ) ( HOIST-AT ?auto_9288 ?auto_9285 ) ( not ( = ?auto_9279 ?auto_9288 ) ) ( not ( = ?auto_9276 ?auto_9288 ) ) ( not ( = ?auto_9286 ?auto_9288 ) ) ( AVAILABLE ?auto_9288 ) ( SURFACE-AT ?auto_9273 ?auto_9285 ) ( ON ?auto_9273 ?auto_9281 ) ( CLEAR ?auto_9273 ) ( not ( = ?auto_9274 ?auto_9281 ) ) ( not ( = ?auto_9275 ?auto_9281 ) ) ( not ( = ?auto_9273 ?auto_9281 ) ) ( not ( = ?auto_9277 ?auto_9281 ) ) ( not ( = ?auto_9284 ?auto_9281 ) ) ( not ( = ?auto_9272 ?auto_9281 ) ) ( TRUCK-AT ?auto_9282 ?auto_9278 ) ( SURFACE-AT ?auto_9283 ?auto_9278 ) ( CLEAR ?auto_9283 ) ( IS-CRATE ?auto_9272 ) ( not ( = ?auto_9283 ?auto_9272 ) ) ( not ( = ?auto_9274 ?auto_9283 ) ) ( not ( = ?auto_9275 ?auto_9283 ) ) ( not ( = ?auto_9273 ?auto_9283 ) ) ( not ( = ?auto_9277 ?auto_9283 ) ) ( not ( = ?auto_9284 ?auto_9283 ) ) ( not ( = ?auto_9281 ?auto_9283 ) ) ( AVAILABLE ?auto_9279 ) ( IN ?auto_9272 ?auto_9282 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9273 ?auto_9274 ?auto_9275 )
      ( MAKE-3CRATE-VERIFY ?auto_9272 ?auto_9273 ?auto_9274 ?auto_9275 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9289 - SURFACE
      ?auto_9290 - SURFACE
      ?auto_9291 - SURFACE
      ?auto_9292 - SURFACE
      ?auto_9293 - SURFACE
    )
    :vars
    (
      ?auto_9297 - HOIST
      ?auto_9296 - PLACE
      ?auto_9304 - PLACE
      ?auto_9294 - HOIST
      ?auto_9295 - SURFACE
      ?auto_9298 - PLACE
      ?auto_9303 - HOIST
      ?auto_9301 - SURFACE
      ?auto_9302 - PLACE
      ?auto_9305 - HOIST
      ?auto_9299 - SURFACE
      ?auto_9300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9297 ?auto_9296 ) ( IS-CRATE ?auto_9293 ) ( not ( = ?auto_9292 ?auto_9293 ) ) ( not ( = ?auto_9291 ?auto_9292 ) ) ( not ( = ?auto_9291 ?auto_9293 ) ) ( not ( = ?auto_9304 ?auto_9296 ) ) ( HOIST-AT ?auto_9294 ?auto_9304 ) ( not ( = ?auto_9297 ?auto_9294 ) ) ( AVAILABLE ?auto_9294 ) ( SURFACE-AT ?auto_9293 ?auto_9304 ) ( ON ?auto_9293 ?auto_9295 ) ( CLEAR ?auto_9293 ) ( not ( = ?auto_9292 ?auto_9295 ) ) ( not ( = ?auto_9293 ?auto_9295 ) ) ( not ( = ?auto_9291 ?auto_9295 ) ) ( IS-CRATE ?auto_9292 ) ( not ( = ?auto_9298 ?auto_9296 ) ) ( not ( = ?auto_9304 ?auto_9298 ) ) ( HOIST-AT ?auto_9303 ?auto_9298 ) ( not ( = ?auto_9297 ?auto_9303 ) ) ( not ( = ?auto_9294 ?auto_9303 ) ) ( AVAILABLE ?auto_9303 ) ( SURFACE-AT ?auto_9292 ?auto_9298 ) ( ON ?auto_9292 ?auto_9301 ) ( CLEAR ?auto_9292 ) ( not ( = ?auto_9292 ?auto_9301 ) ) ( not ( = ?auto_9293 ?auto_9301 ) ) ( not ( = ?auto_9291 ?auto_9301 ) ) ( not ( = ?auto_9295 ?auto_9301 ) ) ( IS-CRATE ?auto_9291 ) ( not ( = ?auto_9290 ?auto_9291 ) ) ( not ( = ?auto_9292 ?auto_9290 ) ) ( not ( = ?auto_9293 ?auto_9290 ) ) ( not ( = ?auto_9295 ?auto_9290 ) ) ( not ( = ?auto_9301 ?auto_9290 ) ) ( not ( = ?auto_9302 ?auto_9296 ) ) ( not ( = ?auto_9304 ?auto_9302 ) ) ( not ( = ?auto_9298 ?auto_9302 ) ) ( HOIST-AT ?auto_9305 ?auto_9302 ) ( not ( = ?auto_9297 ?auto_9305 ) ) ( not ( = ?auto_9294 ?auto_9305 ) ) ( not ( = ?auto_9303 ?auto_9305 ) ) ( AVAILABLE ?auto_9305 ) ( SURFACE-AT ?auto_9291 ?auto_9302 ) ( ON ?auto_9291 ?auto_9299 ) ( CLEAR ?auto_9291 ) ( not ( = ?auto_9292 ?auto_9299 ) ) ( not ( = ?auto_9293 ?auto_9299 ) ) ( not ( = ?auto_9291 ?auto_9299 ) ) ( not ( = ?auto_9295 ?auto_9299 ) ) ( not ( = ?auto_9301 ?auto_9299 ) ) ( not ( = ?auto_9290 ?auto_9299 ) ) ( TRUCK-AT ?auto_9300 ?auto_9296 ) ( SURFACE-AT ?auto_9289 ?auto_9296 ) ( CLEAR ?auto_9289 ) ( IS-CRATE ?auto_9290 ) ( not ( = ?auto_9289 ?auto_9290 ) ) ( not ( = ?auto_9292 ?auto_9289 ) ) ( not ( = ?auto_9293 ?auto_9289 ) ) ( not ( = ?auto_9291 ?auto_9289 ) ) ( not ( = ?auto_9295 ?auto_9289 ) ) ( not ( = ?auto_9301 ?auto_9289 ) ) ( not ( = ?auto_9299 ?auto_9289 ) ) ( AVAILABLE ?auto_9297 ) ( IN ?auto_9290 ?auto_9300 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9291 ?auto_9292 ?auto_9293 )
      ( MAKE-4CRATE-VERIFY ?auto_9289 ?auto_9290 ?auto_9291 ?auto_9292 ?auto_9293 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9306 - SURFACE
      ?auto_9307 - SURFACE
    )
    :vars
    (
      ?auto_9311 - HOIST
      ?auto_9310 - PLACE
      ?auto_9321 - SURFACE
      ?auto_9320 - PLACE
      ?auto_9308 - HOIST
      ?auto_9309 - SURFACE
      ?auto_9312 - PLACE
      ?auto_9319 - HOIST
      ?auto_9317 - SURFACE
      ?auto_9313 - SURFACE
      ?auto_9318 - PLACE
      ?auto_9322 - HOIST
      ?auto_9314 - SURFACE
      ?auto_9316 - SURFACE
      ?auto_9315 - TRUCK
      ?auto_9323 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9311 ?auto_9310 ) ( IS-CRATE ?auto_9307 ) ( not ( = ?auto_9306 ?auto_9307 ) ) ( not ( = ?auto_9321 ?auto_9306 ) ) ( not ( = ?auto_9321 ?auto_9307 ) ) ( not ( = ?auto_9320 ?auto_9310 ) ) ( HOIST-AT ?auto_9308 ?auto_9320 ) ( not ( = ?auto_9311 ?auto_9308 ) ) ( AVAILABLE ?auto_9308 ) ( SURFACE-AT ?auto_9307 ?auto_9320 ) ( ON ?auto_9307 ?auto_9309 ) ( CLEAR ?auto_9307 ) ( not ( = ?auto_9306 ?auto_9309 ) ) ( not ( = ?auto_9307 ?auto_9309 ) ) ( not ( = ?auto_9321 ?auto_9309 ) ) ( IS-CRATE ?auto_9306 ) ( not ( = ?auto_9312 ?auto_9310 ) ) ( not ( = ?auto_9320 ?auto_9312 ) ) ( HOIST-AT ?auto_9319 ?auto_9312 ) ( not ( = ?auto_9311 ?auto_9319 ) ) ( not ( = ?auto_9308 ?auto_9319 ) ) ( AVAILABLE ?auto_9319 ) ( SURFACE-AT ?auto_9306 ?auto_9312 ) ( ON ?auto_9306 ?auto_9317 ) ( CLEAR ?auto_9306 ) ( not ( = ?auto_9306 ?auto_9317 ) ) ( not ( = ?auto_9307 ?auto_9317 ) ) ( not ( = ?auto_9321 ?auto_9317 ) ) ( not ( = ?auto_9309 ?auto_9317 ) ) ( IS-CRATE ?auto_9321 ) ( not ( = ?auto_9313 ?auto_9321 ) ) ( not ( = ?auto_9306 ?auto_9313 ) ) ( not ( = ?auto_9307 ?auto_9313 ) ) ( not ( = ?auto_9309 ?auto_9313 ) ) ( not ( = ?auto_9317 ?auto_9313 ) ) ( not ( = ?auto_9318 ?auto_9310 ) ) ( not ( = ?auto_9320 ?auto_9318 ) ) ( not ( = ?auto_9312 ?auto_9318 ) ) ( HOIST-AT ?auto_9322 ?auto_9318 ) ( not ( = ?auto_9311 ?auto_9322 ) ) ( not ( = ?auto_9308 ?auto_9322 ) ) ( not ( = ?auto_9319 ?auto_9322 ) ) ( AVAILABLE ?auto_9322 ) ( SURFACE-AT ?auto_9321 ?auto_9318 ) ( ON ?auto_9321 ?auto_9314 ) ( CLEAR ?auto_9321 ) ( not ( = ?auto_9306 ?auto_9314 ) ) ( not ( = ?auto_9307 ?auto_9314 ) ) ( not ( = ?auto_9321 ?auto_9314 ) ) ( not ( = ?auto_9309 ?auto_9314 ) ) ( not ( = ?auto_9317 ?auto_9314 ) ) ( not ( = ?auto_9313 ?auto_9314 ) ) ( SURFACE-AT ?auto_9316 ?auto_9310 ) ( CLEAR ?auto_9316 ) ( IS-CRATE ?auto_9313 ) ( not ( = ?auto_9316 ?auto_9313 ) ) ( not ( = ?auto_9306 ?auto_9316 ) ) ( not ( = ?auto_9307 ?auto_9316 ) ) ( not ( = ?auto_9321 ?auto_9316 ) ) ( not ( = ?auto_9309 ?auto_9316 ) ) ( not ( = ?auto_9317 ?auto_9316 ) ) ( not ( = ?auto_9314 ?auto_9316 ) ) ( AVAILABLE ?auto_9311 ) ( IN ?auto_9313 ?auto_9315 ) ( TRUCK-AT ?auto_9315 ?auto_9323 ) ( not ( = ?auto_9323 ?auto_9310 ) ) ( not ( = ?auto_9320 ?auto_9323 ) ) ( not ( = ?auto_9312 ?auto_9323 ) ) ( not ( = ?auto_9318 ?auto_9323 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9315 ?auto_9323 ?auto_9310 )
      ( MAKE-2CRATE ?auto_9321 ?auto_9306 ?auto_9307 )
      ( MAKE-1CRATE-VERIFY ?auto_9306 ?auto_9307 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9324 - SURFACE
      ?auto_9325 - SURFACE
      ?auto_9326 - SURFACE
    )
    :vars
    (
      ?auto_9337 - HOIST
      ?auto_9333 - PLACE
      ?auto_9334 - PLACE
      ?auto_9327 - HOIST
      ?auto_9336 - SURFACE
      ?auto_9330 - PLACE
      ?auto_9340 - HOIST
      ?auto_9331 - SURFACE
      ?auto_9335 - SURFACE
      ?auto_9328 - PLACE
      ?auto_9332 - HOIST
      ?auto_9339 - SURFACE
      ?auto_9338 - SURFACE
      ?auto_9341 - TRUCK
      ?auto_9329 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9337 ?auto_9333 ) ( IS-CRATE ?auto_9326 ) ( not ( = ?auto_9325 ?auto_9326 ) ) ( not ( = ?auto_9324 ?auto_9325 ) ) ( not ( = ?auto_9324 ?auto_9326 ) ) ( not ( = ?auto_9334 ?auto_9333 ) ) ( HOIST-AT ?auto_9327 ?auto_9334 ) ( not ( = ?auto_9337 ?auto_9327 ) ) ( AVAILABLE ?auto_9327 ) ( SURFACE-AT ?auto_9326 ?auto_9334 ) ( ON ?auto_9326 ?auto_9336 ) ( CLEAR ?auto_9326 ) ( not ( = ?auto_9325 ?auto_9336 ) ) ( not ( = ?auto_9326 ?auto_9336 ) ) ( not ( = ?auto_9324 ?auto_9336 ) ) ( IS-CRATE ?auto_9325 ) ( not ( = ?auto_9330 ?auto_9333 ) ) ( not ( = ?auto_9334 ?auto_9330 ) ) ( HOIST-AT ?auto_9340 ?auto_9330 ) ( not ( = ?auto_9337 ?auto_9340 ) ) ( not ( = ?auto_9327 ?auto_9340 ) ) ( AVAILABLE ?auto_9340 ) ( SURFACE-AT ?auto_9325 ?auto_9330 ) ( ON ?auto_9325 ?auto_9331 ) ( CLEAR ?auto_9325 ) ( not ( = ?auto_9325 ?auto_9331 ) ) ( not ( = ?auto_9326 ?auto_9331 ) ) ( not ( = ?auto_9324 ?auto_9331 ) ) ( not ( = ?auto_9336 ?auto_9331 ) ) ( IS-CRATE ?auto_9324 ) ( not ( = ?auto_9335 ?auto_9324 ) ) ( not ( = ?auto_9325 ?auto_9335 ) ) ( not ( = ?auto_9326 ?auto_9335 ) ) ( not ( = ?auto_9336 ?auto_9335 ) ) ( not ( = ?auto_9331 ?auto_9335 ) ) ( not ( = ?auto_9328 ?auto_9333 ) ) ( not ( = ?auto_9334 ?auto_9328 ) ) ( not ( = ?auto_9330 ?auto_9328 ) ) ( HOIST-AT ?auto_9332 ?auto_9328 ) ( not ( = ?auto_9337 ?auto_9332 ) ) ( not ( = ?auto_9327 ?auto_9332 ) ) ( not ( = ?auto_9340 ?auto_9332 ) ) ( AVAILABLE ?auto_9332 ) ( SURFACE-AT ?auto_9324 ?auto_9328 ) ( ON ?auto_9324 ?auto_9339 ) ( CLEAR ?auto_9324 ) ( not ( = ?auto_9325 ?auto_9339 ) ) ( not ( = ?auto_9326 ?auto_9339 ) ) ( not ( = ?auto_9324 ?auto_9339 ) ) ( not ( = ?auto_9336 ?auto_9339 ) ) ( not ( = ?auto_9331 ?auto_9339 ) ) ( not ( = ?auto_9335 ?auto_9339 ) ) ( SURFACE-AT ?auto_9338 ?auto_9333 ) ( CLEAR ?auto_9338 ) ( IS-CRATE ?auto_9335 ) ( not ( = ?auto_9338 ?auto_9335 ) ) ( not ( = ?auto_9325 ?auto_9338 ) ) ( not ( = ?auto_9326 ?auto_9338 ) ) ( not ( = ?auto_9324 ?auto_9338 ) ) ( not ( = ?auto_9336 ?auto_9338 ) ) ( not ( = ?auto_9331 ?auto_9338 ) ) ( not ( = ?auto_9339 ?auto_9338 ) ) ( AVAILABLE ?auto_9337 ) ( IN ?auto_9335 ?auto_9341 ) ( TRUCK-AT ?auto_9341 ?auto_9329 ) ( not ( = ?auto_9329 ?auto_9333 ) ) ( not ( = ?auto_9334 ?auto_9329 ) ) ( not ( = ?auto_9330 ?auto_9329 ) ) ( not ( = ?auto_9328 ?auto_9329 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9325 ?auto_9326 )
      ( MAKE-2CRATE-VERIFY ?auto_9324 ?auto_9325 ?auto_9326 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9342 - SURFACE
      ?auto_9343 - SURFACE
      ?auto_9344 - SURFACE
      ?auto_9345 - SURFACE
    )
    :vars
    (
      ?auto_9351 - HOIST
      ?auto_9350 - PLACE
      ?auto_9356 - PLACE
      ?auto_9353 - HOIST
      ?auto_9349 - SURFACE
      ?auto_9354 - PLACE
      ?auto_9355 - HOIST
      ?auto_9358 - SURFACE
      ?auto_9348 - PLACE
      ?auto_9347 - HOIST
      ?auto_9352 - SURFACE
      ?auto_9357 - SURFACE
      ?auto_9346 - TRUCK
      ?auto_9359 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9351 ?auto_9350 ) ( IS-CRATE ?auto_9345 ) ( not ( = ?auto_9344 ?auto_9345 ) ) ( not ( = ?auto_9343 ?auto_9344 ) ) ( not ( = ?auto_9343 ?auto_9345 ) ) ( not ( = ?auto_9356 ?auto_9350 ) ) ( HOIST-AT ?auto_9353 ?auto_9356 ) ( not ( = ?auto_9351 ?auto_9353 ) ) ( AVAILABLE ?auto_9353 ) ( SURFACE-AT ?auto_9345 ?auto_9356 ) ( ON ?auto_9345 ?auto_9349 ) ( CLEAR ?auto_9345 ) ( not ( = ?auto_9344 ?auto_9349 ) ) ( not ( = ?auto_9345 ?auto_9349 ) ) ( not ( = ?auto_9343 ?auto_9349 ) ) ( IS-CRATE ?auto_9344 ) ( not ( = ?auto_9354 ?auto_9350 ) ) ( not ( = ?auto_9356 ?auto_9354 ) ) ( HOIST-AT ?auto_9355 ?auto_9354 ) ( not ( = ?auto_9351 ?auto_9355 ) ) ( not ( = ?auto_9353 ?auto_9355 ) ) ( AVAILABLE ?auto_9355 ) ( SURFACE-AT ?auto_9344 ?auto_9354 ) ( ON ?auto_9344 ?auto_9358 ) ( CLEAR ?auto_9344 ) ( not ( = ?auto_9344 ?auto_9358 ) ) ( not ( = ?auto_9345 ?auto_9358 ) ) ( not ( = ?auto_9343 ?auto_9358 ) ) ( not ( = ?auto_9349 ?auto_9358 ) ) ( IS-CRATE ?auto_9343 ) ( not ( = ?auto_9342 ?auto_9343 ) ) ( not ( = ?auto_9344 ?auto_9342 ) ) ( not ( = ?auto_9345 ?auto_9342 ) ) ( not ( = ?auto_9349 ?auto_9342 ) ) ( not ( = ?auto_9358 ?auto_9342 ) ) ( not ( = ?auto_9348 ?auto_9350 ) ) ( not ( = ?auto_9356 ?auto_9348 ) ) ( not ( = ?auto_9354 ?auto_9348 ) ) ( HOIST-AT ?auto_9347 ?auto_9348 ) ( not ( = ?auto_9351 ?auto_9347 ) ) ( not ( = ?auto_9353 ?auto_9347 ) ) ( not ( = ?auto_9355 ?auto_9347 ) ) ( AVAILABLE ?auto_9347 ) ( SURFACE-AT ?auto_9343 ?auto_9348 ) ( ON ?auto_9343 ?auto_9352 ) ( CLEAR ?auto_9343 ) ( not ( = ?auto_9344 ?auto_9352 ) ) ( not ( = ?auto_9345 ?auto_9352 ) ) ( not ( = ?auto_9343 ?auto_9352 ) ) ( not ( = ?auto_9349 ?auto_9352 ) ) ( not ( = ?auto_9358 ?auto_9352 ) ) ( not ( = ?auto_9342 ?auto_9352 ) ) ( SURFACE-AT ?auto_9357 ?auto_9350 ) ( CLEAR ?auto_9357 ) ( IS-CRATE ?auto_9342 ) ( not ( = ?auto_9357 ?auto_9342 ) ) ( not ( = ?auto_9344 ?auto_9357 ) ) ( not ( = ?auto_9345 ?auto_9357 ) ) ( not ( = ?auto_9343 ?auto_9357 ) ) ( not ( = ?auto_9349 ?auto_9357 ) ) ( not ( = ?auto_9358 ?auto_9357 ) ) ( not ( = ?auto_9352 ?auto_9357 ) ) ( AVAILABLE ?auto_9351 ) ( IN ?auto_9342 ?auto_9346 ) ( TRUCK-AT ?auto_9346 ?auto_9359 ) ( not ( = ?auto_9359 ?auto_9350 ) ) ( not ( = ?auto_9356 ?auto_9359 ) ) ( not ( = ?auto_9354 ?auto_9359 ) ) ( not ( = ?auto_9348 ?auto_9359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9343 ?auto_9344 ?auto_9345 )
      ( MAKE-3CRATE-VERIFY ?auto_9342 ?auto_9343 ?auto_9344 ?auto_9345 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9360 - SURFACE
      ?auto_9361 - SURFACE
      ?auto_9362 - SURFACE
      ?auto_9363 - SURFACE
      ?auto_9364 - SURFACE
    )
    :vars
    (
      ?auto_9370 - HOIST
      ?auto_9369 - PLACE
      ?auto_9375 - PLACE
      ?auto_9372 - HOIST
      ?auto_9368 - SURFACE
      ?auto_9373 - PLACE
      ?auto_9374 - HOIST
      ?auto_9376 - SURFACE
      ?auto_9367 - PLACE
      ?auto_9366 - HOIST
      ?auto_9371 - SURFACE
      ?auto_9365 - TRUCK
      ?auto_9377 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9370 ?auto_9369 ) ( IS-CRATE ?auto_9364 ) ( not ( = ?auto_9363 ?auto_9364 ) ) ( not ( = ?auto_9362 ?auto_9363 ) ) ( not ( = ?auto_9362 ?auto_9364 ) ) ( not ( = ?auto_9375 ?auto_9369 ) ) ( HOIST-AT ?auto_9372 ?auto_9375 ) ( not ( = ?auto_9370 ?auto_9372 ) ) ( AVAILABLE ?auto_9372 ) ( SURFACE-AT ?auto_9364 ?auto_9375 ) ( ON ?auto_9364 ?auto_9368 ) ( CLEAR ?auto_9364 ) ( not ( = ?auto_9363 ?auto_9368 ) ) ( not ( = ?auto_9364 ?auto_9368 ) ) ( not ( = ?auto_9362 ?auto_9368 ) ) ( IS-CRATE ?auto_9363 ) ( not ( = ?auto_9373 ?auto_9369 ) ) ( not ( = ?auto_9375 ?auto_9373 ) ) ( HOIST-AT ?auto_9374 ?auto_9373 ) ( not ( = ?auto_9370 ?auto_9374 ) ) ( not ( = ?auto_9372 ?auto_9374 ) ) ( AVAILABLE ?auto_9374 ) ( SURFACE-AT ?auto_9363 ?auto_9373 ) ( ON ?auto_9363 ?auto_9376 ) ( CLEAR ?auto_9363 ) ( not ( = ?auto_9363 ?auto_9376 ) ) ( not ( = ?auto_9364 ?auto_9376 ) ) ( not ( = ?auto_9362 ?auto_9376 ) ) ( not ( = ?auto_9368 ?auto_9376 ) ) ( IS-CRATE ?auto_9362 ) ( not ( = ?auto_9361 ?auto_9362 ) ) ( not ( = ?auto_9363 ?auto_9361 ) ) ( not ( = ?auto_9364 ?auto_9361 ) ) ( not ( = ?auto_9368 ?auto_9361 ) ) ( not ( = ?auto_9376 ?auto_9361 ) ) ( not ( = ?auto_9367 ?auto_9369 ) ) ( not ( = ?auto_9375 ?auto_9367 ) ) ( not ( = ?auto_9373 ?auto_9367 ) ) ( HOIST-AT ?auto_9366 ?auto_9367 ) ( not ( = ?auto_9370 ?auto_9366 ) ) ( not ( = ?auto_9372 ?auto_9366 ) ) ( not ( = ?auto_9374 ?auto_9366 ) ) ( AVAILABLE ?auto_9366 ) ( SURFACE-AT ?auto_9362 ?auto_9367 ) ( ON ?auto_9362 ?auto_9371 ) ( CLEAR ?auto_9362 ) ( not ( = ?auto_9363 ?auto_9371 ) ) ( not ( = ?auto_9364 ?auto_9371 ) ) ( not ( = ?auto_9362 ?auto_9371 ) ) ( not ( = ?auto_9368 ?auto_9371 ) ) ( not ( = ?auto_9376 ?auto_9371 ) ) ( not ( = ?auto_9361 ?auto_9371 ) ) ( SURFACE-AT ?auto_9360 ?auto_9369 ) ( CLEAR ?auto_9360 ) ( IS-CRATE ?auto_9361 ) ( not ( = ?auto_9360 ?auto_9361 ) ) ( not ( = ?auto_9363 ?auto_9360 ) ) ( not ( = ?auto_9364 ?auto_9360 ) ) ( not ( = ?auto_9362 ?auto_9360 ) ) ( not ( = ?auto_9368 ?auto_9360 ) ) ( not ( = ?auto_9376 ?auto_9360 ) ) ( not ( = ?auto_9371 ?auto_9360 ) ) ( AVAILABLE ?auto_9370 ) ( IN ?auto_9361 ?auto_9365 ) ( TRUCK-AT ?auto_9365 ?auto_9377 ) ( not ( = ?auto_9377 ?auto_9369 ) ) ( not ( = ?auto_9375 ?auto_9377 ) ) ( not ( = ?auto_9373 ?auto_9377 ) ) ( not ( = ?auto_9367 ?auto_9377 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9362 ?auto_9363 ?auto_9364 )
      ( MAKE-4CRATE-VERIFY ?auto_9360 ?auto_9361 ?auto_9362 ?auto_9363 ?auto_9364 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9378 - SURFACE
      ?auto_9379 - SURFACE
    )
    :vars
    (
      ?auto_9387 - HOIST
      ?auto_9386 - PLACE
      ?auto_9380 - SURFACE
      ?auto_9392 - PLACE
      ?auto_9389 - HOIST
      ?auto_9385 - SURFACE
      ?auto_9390 - PLACE
      ?auto_9391 - HOIST
      ?auto_9394 - SURFACE
      ?auto_9384 - SURFACE
      ?auto_9383 - PLACE
      ?auto_9382 - HOIST
      ?auto_9388 - SURFACE
      ?auto_9393 - SURFACE
      ?auto_9381 - TRUCK
      ?auto_9395 - PLACE
      ?auto_9396 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9387 ?auto_9386 ) ( IS-CRATE ?auto_9379 ) ( not ( = ?auto_9378 ?auto_9379 ) ) ( not ( = ?auto_9380 ?auto_9378 ) ) ( not ( = ?auto_9380 ?auto_9379 ) ) ( not ( = ?auto_9392 ?auto_9386 ) ) ( HOIST-AT ?auto_9389 ?auto_9392 ) ( not ( = ?auto_9387 ?auto_9389 ) ) ( AVAILABLE ?auto_9389 ) ( SURFACE-AT ?auto_9379 ?auto_9392 ) ( ON ?auto_9379 ?auto_9385 ) ( CLEAR ?auto_9379 ) ( not ( = ?auto_9378 ?auto_9385 ) ) ( not ( = ?auto_9379 ?auto_9385 ) ) ( not ( = ?auto_9380 ?auto_9385 ) ) ( IS-CRATE ?auto_9378 ) ( not ( = ?auto_9390 ?auto_9386 ) ) ( not ( = ?auto_9392 ?auto_9390 ) ) ( HOIST-AT ?auto_9391 ?auto_9390 ) ( not ( = ?auto_9387 ?auto_9391 ) ) ( not ( = ?auto_9389 ?auto_9391 ) ) ( AVAILABLE ?auto_9391 ) ( SURFACE-AT ?auto_9378 ?auto_9390 ) ( ON ?auto_9378 ?auto_9394 ) ( CLEAR ?auto_9378 ) ( not ( = ?auto_9378 ?auto_9394 ) ) ( not ( = ?auto_9379 ?auto_9394 ) ) ( not ( = ?auto_9380 ?auto_9394 ) ) ( not ( = ?auto_9385 ?auto_9394 ) ) ( IS-CRATE ?auto_9380 ) ( not ( = ?auto_9384 ?auto_9380 ) ) ( not ( = ?auto_9378 ?auto_9384 ) ) ( not ( = ?auto_9379 ?auto_9384 ) ) ( not ( = ?auto_9385 ?auto_9384 ) ) ( not ( = ?auto_9394 ?auto_9384 ) ) ( not ( = ?auto_9383 ?auto_9386 ) ) ( not ( = ?auto_9392 ?auto_9383 ) ) ( not ( = ?auto_9390 ?auto_9383 ) ) ( HOIST-AT ?auto_9382 ?auto_9383 ) ( not ( = ?auto_9387 ?auto_9382 ) ) ( not ( = ?auto_9389 ?auto_9382 ) ) ( not ( = ?auto_9391 ?auto_9382 ) ) ( AVAILABLE ?auto_9382 ) ( SURFACE-AT ?auto_9380 ?auto_9383 ) ( ON ?auto_9380 ?auto_9388 ) ( CLEAR ?auto_9380 ) ( not ( = ?auto_9378 ?auto_9388 ) ) ( not ( = ?auto_9379 ?auto_9388 ) ) ( not ( = ?auto_9380 ?auto_9388 ) ) ( not ( = ?auto_9385 ?auto_9388 ) ) ( not ( = ?auto_9394 ?auto_9388 ) ) ( not ( = ?auto_9384 ?auto_9388 ) ) ( SURFACE-AT ?auto_9393 ?auto_9386 ) ( CLEAR ?auto_9393 ) ( IS-CRATE ?auto_9384 ) ( not ( = ?auto_9393 ?auto_9384 ) ) ( not ( = ?auto_9378 ?auto_9393 ) ) ( not ( = ?auto_9379 ?auto_9393 ) ) ( not ( = ?auto_9380 ?auto_9393 ) ) ( not ( = ?auto_9385 ?auto_9393 ) ) ( not ( = ?auto_9394 ?auto_9393 ) ) ( not ( = ?auto_9388 ?auto_9393 ) ) ( AVAILABLE ?auto_9387 ) ( TRUCK-AT ?auto_9381 ?auto_9395 ) ( not ( = ?auto_9395 ?auto_9386 ) ) ( not ( = ?auto_9392 ?auto_9395 ) ) ( not ( = ?auto_9390 ?auto_9395 ) ) ( not ( = ?auto_9383 ?auto_9395 ) ) ( HOIST-AT ?auto_9396 ?auto_9395 ) ( LIFTING ?auto_9396 ?auto_9384 ) ( not ( = ?auto_9387 ?auto_9396 ) ) ( not ( = ?auto_9389 ?auto_9396 ) ) ( not ( = ?auto_9391 ?auto_9396 ) ) ( not ( = ?auto_9382 ?auto_9396 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9396 ?auto_9384 ?auto_9381 ?auto_9395 )
      ( MAKE-2CRATE ?auto_9380 ?auto_9378 ?auto_9379 )
      ( MAKE-1CRATE-VERIFY ?auto_9378 ?auto_9379 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9397 - SURFACE
      ?auto_9398 - SURFACE
      ?auto_9399 - SURFACE
    )
    :vars
    (
      ?auto_9402 - HOIST
      ?auto_9412 - PLACE
      ?auto_9406 - PLACE
      ?auto_9408 - HOIST
      ?auto_9410 - SURFACE
      ?auto_9400 - PLACE
      ?auto_9404 - HOIST
      ?auto_9407 - SURFACE
      ?auto_9401 - SURFACE
      ?auto_9411 - PLACE
      ?auto_9409 - HOIST
      ?auto_9403 - SURFACE
      ?auto_9405 - SURFACE
      ?auto_9413 - TRUCK
      ?auto_9414 - PLACE
      ?auto_9415 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9402 ?auto_9412 ) ( IS-CRATE ?auto_9399 ) ( not ( = ?auto_9398 ?auto_9399 ) ) ( not ( = ?auto_9397 ?auto_9398 ) ) ( not ( = ?auto_9397 ?auto_9399 ) ) ( not ( = ?auto_9406 ?auto_9412 ) ) ( HOIST-AT ?auto_9408 ?auto_9406 ) ( not ( = ?auto_9402 ?auto_9408 ) ) ( AVAILABLE ?auto_9408 ) ( SURFACE-AT ?auto_9399 ?auto_9406 ) ( ON ?auto_9399 ?auto_9410 ) ( CLEAR ?auto_9399 ) ( not ( = ?auto_9398 ?auto_9410 ) ) ( not ( = ?auto_9399 ?auto_9410 ) ) ( not ( = ?auto_9397 ?auto_9410 ) ) ( IS-CRATE ?auto_9398 ) ( not ( = ?auto_9400 ?auto_9412 ) ) ( not ( = ?auto_9406 ?auto_9400 ) ) ( HOIST-AT ?auto_9404 ?auto_9400 ) ( not ( = ?auto_9402 ?auto_9404 ) ) ( not ( = ?auto_9408 ?auto_9404 ) ) ( AVAILABLE ?auto_9404 ) ( SURFACE-AT ?auto_9398 ?auto_9400 ) ( ON ?auto_9398 ?auto_9407 ) ( CLEAR ?auto_9398 ) ( not ( = ?auto_9398 ?auto_9407 ) ) ( not ( = ?auto_9399 ?auto_9407 ) ) ( not ( = ?auto_9397 ?auto_9407 ) ) ( not ( = ?auto_9410 ?auto_9407 ) ) ( IS-CRATE ?auto_9397 ) ( not ( = ?auto_9401 ?auto_9397 ) ) ( not ( = ?auto_9398 ?auto_9401 ) ) ( not ( = ?auto_9399 ?auto_9401 ) ) ( not ( = ?auto_9410 ?auto_9401 ) ) ( not ( = ?auto_9407 ?auto_9401 ) ) ( not ( = ?auto_9411 ?auto_9412 ) ) ( not ( = ?auto_9406 ?auto_9411 ) ) ( not ( = ?auto_9400 ?auto_9411 ) ) ( HOIST-AT ?auto_9409 ?auto_9411 ) ( not ( = ?auto_9402 ?auto_9409 ) ) ( not ( = ?auto_9408 ?auto_9409 ) ) ( not ( = ?auto_9404 ?auto_9409 ) ) ( AVAILABLE ?auto_9409 ) ( SURFACE-AT ?auto_9397 ?auto_9411 ) ( ON ?auto_9397 ?auto_9403 ) ( CLEAR ?auto_9397 ) ( not ( = ?auto_9398 ?auto_9403 ) ) ( not ( = ?auto_9399 ?auto_9403 ) ) ( not ( = ?auto_9397 ?auto_9403 ) ) ( not ( = ?auto_9410 ?auto_9403 ) ) ( not ( = ?auto_9407 ?auto_9403 ) ) ( not ( = ?auto_9401 ?auto_9403 ) ) ( SURFACE-AT ?auto_9405 ?auto_9412 ) ( CLEAR ?auto_9405 ) ( IS-CRATE ?auto_9401 ) ( not ( = ?auto_9405 ?auto_9401 ) ) ( not ( = ?auto_9398 ?auto_9405 ) ) ( not ( = ?auto_9399 ?auto_9405 ) ) ( not ( = ?auto_9397 ?auto_9405 ) ) ( not ( = ?auto_9410 ?auto_9405 ) ) ( not ( = ?auto_9407 ?auto_9405 ) ) ( not ( = ?auto_9403 ?auto_9405 ) ) ( AVAILABLE ?auto_9402 ) ( TRUCK-AT ?auto_9413 ?auto_9414 ) ( not ( = ?auto_9414 ?auto_9412 ) ) ( not ( = ?auto_9406 ?auto_9414 ) ) ( not ( = ?auto_9400 ?auto_9414 ) ) ( not ( = ?auto_9411 ?auto_9414 ) ) ( HOIST-AT ?auto_9415 ?auto_9414 ) ( LIFTING ?auto_9415 ?auto_9401 ) ( not ( = ?auto_9402 ?auto_9415 ) ) ( not ( = ?auto_9408 ?auto_9415 ) ) ( not ( = ?auto_9404 ?auto_9415 ) ) ( not ( = ?auto_9409 ?auto_9415 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9398 ?auto_9399 )
      ( MAKE-2CRATE-VERIFY ?auto_9397 ?auto_9398 ?auto_9399 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9416 - SURFACE
      ?auto_9417 - SURFACE
      ?auto_9418 - SURFACE
      ?auto_9419 - SURFACE
    )
    :vars
    (
      ?auto_9433 - HOIST
      ?auto_9428 - PLACE
      ?auto_9427 - PLACE
      ?auto_9422 - HOIST
      ?auto_9429 - SURFACE
      ?auto_9420 - PLACE
      ?auto_9425 - HOIST
      ?auto_9434 - SURFACE
      ?auto_9424 - PLACE
      ?auto_9432 - HOIST
      ?auto_9431 - SURFACE
      ?auto_9423 - SURFACE
      ?auto_9430 - TRUCK
      ?auto_9421 - PLACE
      ?auto_9426 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9433 ?auto_9428 ) ( IS-CRATE ?auto_9419 ) ( not ( = ?auto_9418 ?auto_9419 ) ) ( not ( = ?auto_9417 ?auto_9418 ) ) ( not ( = ?auto_9417 ?auto_9419 ) ) ( not ( = ?auto_9427 ?auto_9428 ) ) ( HOIST-AT ?auto_9422 ?auto_9427 ) ( not ( = ?auto_9433 ?auto_9422 ) ) ( AVAILABLE ?auto_9422 ) ( SURFACE-AT ?auto_9419 ?auto_9427 ) ( ON ?auto_9419 ?auto_9429 ) ( CLEAR ?auto_9419 ) ( not ( = ?auto_9418 ?auto_9429 ) ) ( not ( = ?auto_9419 ?auto_9429 ) ) ( not ( = ?auto_9417 ?auto_9429 ) ) ( IS-CRATE ?auto_9418 ) ( not ( = ?auto_9420 ?auto_9428 ) ) ( not ( = ?auto_9427 ?auto_9420 ) ) ( HOIST-AT ?auto_9425 ?auto_9420 ) ( not ( = ?auto_9433 ?auto_9425 ) ) ( not ( = ?auto_9422 ?auto_9425 ) ) ( AVAILABLE ?auto_9425 ) ( SURFACE-AT ?auto_9418 ?auto_9420 ) ( ON ?auto_9418 ?auto_9434 ) ( CLEAR ?auto_9418 ) ( not ( = ?auto_9418 ?auto_9434 ) ) ( not ( = ?auto_9419 ?auto_9434 ) ) ( not ( = ?auto_9417 ?auto_9434 ) ) ( not ( = ?auto_9429 ?auto_9434 ) ) ( IS-CRATE ?auto_9417 ) ( not ( = ?auto_9416 ?auto_9417 ) ) ( not ( = ?auto_9418 ?auto_9416 ) ) ( not ( = ?auto_9419 ?auto_9416 ) ) ( not ( = ?auto_9429 ?auto_9416 ) ) ( not ( = ?auto_9434 ?auto_9416 ) ) ( not ( = ?auto_9424 ?auto_9428 ) ) ( not ( = ?auto_9427 ?auto_9424 ) ) ( not ( = ?auto_9420 ?auto_9424 ) ) ( HOIST-AT ?auto_9432 ?auto_9424 ) ( not ( = ?auto_9433 ?auto_9432 ) ) ( not ( = ?auto_9422 ?auto_9432 ) ) ( not ( = ?auto_9425 ?auto_9432 ) ) ( AVAILABLE ?auto_9432 ) ( SURFACE-AT ?auto_9417 ?auto_9424 ) ( ON ?auto_9417 ?auto_9431 ) ( CLEAR ?auto_9417 ) ( not ( = ?auto_9418 ?auto_9431 ) ) ( not ( = ?auto_9419 ?auto_9431 ) ) ( not ( = ?auto_9417 ?auto_9431 ) ) ( not ( = ?auto_9429 ?auto_9431 ) ) ( not ( = ?auto_9434 ?auto_9431 ) ) ( not ( = ?auto_9416 ?auto_9431 ) ) ( SURFACE-AT ?auto_9423 ?auto_9428 ) ( CLEAR ?auto_9423 ) ( IS-CRATE ?auto_9416 ) ( not ( = ?auto_9423 ?auto_9416 ) ) ( not ( = ?auto_9418 ?auto_9423 ) ) ( not ( = ?auto_9419 ?auto_9423 ) ) ( not ( = ?auto_9417 ?auto_9423 ) ) ( not ( = ?auto_9429 ?auto_9423 ) ) ( not ( = ?auto_9434 ?auto_9423 ) ) ( not ( = ?auto_9431 ?auto_9423 ) ) ( AVAILABLE ?auto_9433 ) ( TRUCK-AT ?auto_9430 ?auto_9421 ) ( not ( = ?auto_9421 ?auto_9428 ) ) ( not ( = ?auto_9427 ?auto_9421 ) ) ( not ( = ?auto_9420 ?auto_9421 ) ) ( not ( = ?auto_9424 ?auto_9421 ) ) ( HOIST-AT ?auto_9426 ?auto_9421 ) ( LIFTING ?auto_9426 ?auto_9416 ) ( not ( = ?auto_9433 ?auto_9426 ) ) ( not ( = ?auto_9422 ?auto_9426 ) ) ( not ( = ?auto_9425 ?auto_9426 ) ) ( not ( = ?auto_9432 ?auto_9426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9417 ?auto_9418 ?auto_9419 )
      ( MAKE-3CRATE-VERIFY ?auto_9416 ?auto_9417 ?auto_9418 ?auto_9419 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9435 - SURFACE
      ?auto_9436 - SURFACE
      ?auto_9437 - SURFACE
      ?auto_9438 - SURFACE
      ?auto_9439 - SURFACE
    )
    :vars
    (
      ?auto_9452 - HOIST
      ?auto_9447 - PLACE
      ?auto_9446 - PLACE
      ?auto_9442 - HOIST
      ?auto_9448 - SURFACE
      ?auto_9440 - PLACE
      ?auto_9444 - HOIST
      ?auto_9453 - SURFACE
      ?auto_9443 - PLACE
      ?auto_9451 - HOIST
      ?auto_9450 - SURFACE
      ?auto_9449 - TRUCK
      ?auto_9441 - PLACE
      ?auto_9445 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9452 ?auto_9447 ) ( IS-CRATE ?auto_9439 ) ( not ( = ?auto_9438 ?auto_9439 ) ) ( not ( = ?auto_9437 ?auto_9438 ) ) ( not ( = ?auto_9437 ?auto_9439 ) ) ( not ( = ?auto_9446 ?auto_9447 ) ) ( HOIST-AT ?auto_9442 ?auto_9446 ) ( not ( = ?auto_9452 ?auto_9442 ) ) ( AVAILABLE ?auto_9442 ) ( SURFACE-AT ?auto_9439 ?auto_9446 ) ( ON ?auto_9439 ?auto_9448 ) ( CLEAR ?auto_9439 ) ( not ( = ?auto_9438 ?auto_9448 ) ) ( not ( = ?auto_9439 ?auto_9448 ) ) ( not ( = ?auto_9437 ?auto_9448 ) ) ( IS-CRATE ?auto_9438 ) ( not ( = ?auto_9440 ?auto_9447 ) ) ( not ( = ?auto_9446 ?auto_9440 ) ) ( HOIST-AT ?auto_9444 ?auto_9440 ) ( not ( = ?auto_9452 ?auto_9444 ) ) ( not ( = ?auto_9442 ?auto_9444 ) ) ( AVAILABLE ?auto_9444 ) ( SURFACE-AT ?auto_9438 ?auto_9440 ) ( ON ?auto_9438 ?auto_9453 ) ( CLEAR ?auto_9438 ) ( not ( = ?auto_9438 ?auto_9453 ) ) ( not ( = ?auto_9439 ?auto_9453 ) ) ( not ( = ?auto_9437 ?auto_9453 ) ) ( not ( = ?auto_9448 ?auto_9453 ) ) ( IS-CRATE ?auto_9437 ) ( not ( = ?auto_9436 ?auto_9437 ) ) ( not ( = ?auto_9438 ?auto_9436 ) ) ( not ( = ?auto_9439 ?auto_9436 ) ) ( not ( = ?auto_9448 ?auto_9436 ) ) ( not ( = ?auto_9453 ?auto_9436 ) ) ( not ( = ?auto_9443 ?auto_9447 ) ) ( not ( = ?auto_9446 ?auto_9443 ) ) ( not ( = ?auto_9440 ?auto_9443 ) ) ( HOIST-AT ?auto_9451 ?auto_9443 ) ( not ( = ?auto_9452 ?auto_9451 ) ) ( not ( = ?auto_9442 ?auto_9451 ) ) ( not ( = ?auto_9444 ?auto_9451 ) ) ( AVAILABLE ?auto_9451 ) ( SURFACE-AT ?auto_9437 ?auto_9443 ) ( ON ?auto_9437 ?auto_9450 ) ( CLEAR ?auto_9437 ) ( not ( = ?auto_9438 ?auto_9450 ) ) ( not ( = ?auto_9439 ?auto_9450 ) ) ( not ( = ?auto_9437 ?auto_9450 ) ) ( not ( = ?auto_9448 ?auto_9450 ) ) ( not ( = ?auto_9453 ?auto_9450 ) ) ( not ( = ?auto_9436 ?auto_9450 ) ) ( SURFACE-AT ?auto_9435 ?auto_9447 ) ( CLEAR ?auto_9435 ) ( IS-CRATE ?auto_9436 ) ( not ( = ?auto_9435 ?auto_9436 ) ) ( not ( = ?auto_9438 ?auto_9435 ) ) ( not ( = ?auto_9439 ?auto_9435 ) ) ( not ( = ?auto_9437 ?auto_9435 ) ) ( not ( = ?auto_9448 ?auto_9435 ) ) ( not ( = ?auto_9453 ?auto_9435 ) ) ( not ( = ?auto_9450 ?auto_9435 ) ) ( AVAILABLE ?auto_9452 ) ( TRUCK-AT ?auto_9449 ?auto_9441 ) ( not ( = ?auto_9441 ?auto_9447 ) ) ( not ( = ?auto_9446 ?auto_9441 ) ) ( not ( = ?auto_9440 ?auto_9441 ) ) ( not ( = ?auto_9443 ?auto_9441 ) ) ( HOIST-AT ?auto_9445 ?auto_9441 ) ( LIFTING ?auto_9445 ?auto_9436 ) ( not ( = ?auto_9452 ?auto_9445 ) ) ( not ( = ?auto_9442 ?auto_9445 ) ) ( not ( = ?auto_9444 ?auto_9445 ) ) ( not ( = ?auto_9451 ?auto_9445 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9437 ?auto_9438 ?auto_9439 )
      ( MAKE-4CRATE-VERIFY ?auto_9435 ?auto_9436 ?auto_9437 ?auto_9438 ?auto_9439 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9454 - SURFACE
      ?auto_9455 - SURFACE
    )
    :vars
    (
      ?auto_9471 - HOIST
      ?auto_9466 - PLACE
      ?auto_9464 - SURFACE
      ?auto_9465 - PLACE
      ?auto_9458 - HOIST
      ?auto_9467 - SURFACE
      ?auto_9456 - PLACE
      ?auto_9462 - HOIST
      ?auto_9472 - SURFACE
      ?auto_9459 - SURFACE
      ?auto_9461 - PLACE
      ?auto_9470 - HOIST
      ?auto_9469 - SURFACE
      ?auto_9460 - SURFACE
      ?auto_9468 - TRUCK
      ?auto_9457 - PLACE
      ?auto_9463 - HOIST
      ?auto_9473 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9471 ?auto_9466 ) ( IS-CRATE ?auto_9455 ) ( not ( = ?auto_9454 ?auto_9455 ) ) ( not ( = ?auto_9464 ?auto_9454 ) ) ( not ( = ?auto_9464 ?auto_9455 ) ) ( not ( = ?auto_9465 ?auto_9466 ) ) ( HOIST-AT ?auto_9458 ?auto_9465 ) ( not ( = ?auto_9471 ?auto_9458 ) ) ( AVAILABLE ?auto_9458 ) ( SURFACE-AT ?auto_9455 ?auto_9465 ) ( ON ?auto_9455 ?auto_9467 ) ( CLEAR ?auto_9455 ) ( not ( = ?auto_9454 ?auto_9467 ) ) ( not ( = ?auto_9455 ?auto_9467 ) ) ( not ( = ?auto_9464 ?auto_9467 ) ) ( IS-CRATE ?auto_9454 ) ( not ( = ?auto_9456 ?auto_9466 ) ) ( not ( = ?auto_9465 ?auto_9456 ) ) ( HOIST-AT ?auto_9462 ?auto_9456 ) ( not ( = ?auto_9471 ?auto_9462 ) ) ( not ( = ?auto_9458 ?auto_9462 ) ) ( AVAILABLE ?auto_9462 ) ( SURFACE-AT ?auto_9454 ?auto_9456 ) ( ON ?auto_9454 ?auto_9472 ) ( CLEAR ?auto_9454 ) ( not ( = ?auto_9454 ?auto_9472 ) ) ( not ( = ?auto_9455 ?auto_9472 ) ) ( not ( = ?auto_9464 ?auto_9472 ) ) ( not ( = ?auto_9467 ?auto_9472 ) ) ( IS-CRATE ?auto_9464 ) ( not ( = ?auto_9459 ?auto_9464 ) ) ( not ( = ?auto_9454 ?auto_9459 ) ) ( not ( = ?auto_9455 ?auto_9459 ) ) ( not ( = ?auto_9467 ?auto_9459 ) ) ( not ( = ?auto_9472 ?auto_9459 ) ) ( not ( = ?auto_9461 ?auto_9466 ) ) ( not ( = ?auto_9465 ?auto_9461 ) ) ( not ( = ?auto_9456 ?auto_9461 ) ) ( HOIST-AT ?auto_9470 ?auto_9461 ) ( not ( = ?auto_9471 ?auto_9470 ) ) ( not ( = ?auto_9458 ?auto_9470 ) ) ( not ( = ?auto_9462 ?auto_9470 ) ) ( AVAILABLE ?auto_9470 ) ( SURFACE-AT ?auto_9464 ?auto_9461 ) ( ON ?auto_9464 ?auto_9469 ) ( CLEAR ?auto_9464 ) ( not ( = ?auto_9454 ?auto_9469 ) ) ( not ( = ?auto_9455 ?auto_9469 ) ) ( not ( = ?auto_9464 ?auto_9469 ) ) ( not ( = ?auto_9467 ?auto_9469 ) ) ( not ( = ?auto_9472 ?auto_9469 ) ) ( not ( = ?auto_9459 ?auto_9469 ) ) ( SURFACE-AT ?auto_9460 ?auto_9466 ) ( CLEAR ?auto_9460 ) ( IS-CRATE ?auto_9459 ) ( not ( = ?auto_9460 ?auto_9459 ) ) ( not ( = ?auto_9454 ?auto_9460 ) ) ( not ( = ?auto_9455 ?auto_9460 ) ) ( not ( = ?auto_9464 ?auto_9460 ) ) ( not ( = ?auto_9467 ?auto_9460 ) ) ( not ( = ?auto_9472 ?auto_9460 ) ) ( not ( = ?auto_9469 ?auto_9460 ) ) ( AVAILABLE ?auto_9471 ) ( TRUCK-AT ?auto_9468 ?auto_9457 ) ( not ( = ?auto_9457 ?auto_9466 ) ) ( not ( = ?auto_9465 ?auto_9457 ) ) ( not ( = ?auto_9456 ?auto_9457 ) ) ( not ( = ?auto_9461 ?auto_9457 ) ) ( HOIST-AT ?auto_9463 ?auto_9457 ) ( not ( = ?auto_9471 ?auto_9463 ) ) ( not ( = ?auto_9458 ?auto_9463 ) ) ( not ( = ?auto_9462 ?auto_9463 ) ) ( not ( = ?auto_9470 ?auto_9463 ) ) ( AVAILABLE ?auto_9463 ) ( SURFACE-AT ?auto_9459 ?auto_9457 ) ( ON ?auto_9459 ?auto_9473 ) ( CLEAR ?auto_9459 ) ( not ( = ?auto_9454 ?auto_9473 ) ) ( not ( = ?auto_9455 ?auto_9473 ) ) ( not ( = ?auto_9464 ?auto_9473 ) ) ( not ( = ?auto_9467 ?auto_9473 ) ) ( not ( = ?auto_9472 ?auto_9473 ) ) ( not ( = ?auto_9459 ?auto_9473 ) ) ( not ( = ?auto_9469 ?auto_9473 ) ) ( not ( = ?auto_9460 ?auto_9473 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9463 ?auto_9459 ?auto_9473 ?auto_9457 )
      ( MAKE-2CRATE ?auto_9464 ?auto_9454 ?auto_9455 )
      ( MAKE-1CRATE-VERIFY ?auto_9454 ?auto_9455 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9474 - SURFACE
      ?auto_9475 - SURFACE
      ?auto_9476 - SURFACE
    )
    :vars
    (
      ?auto_9477 - HOIST
      ?auto_9488 - PLACE
      ?auto_9484 - PLACE
      ?auto_9492 - HOIST
      ?auto_9482 - SURFACE
      ?auto_9493 - PLACE
      ?auto_9481 - HOIST
      ?auto_9490 - SURFACE
      ?auto_9489 - SURFACE
      ?auto_9491 - PLACE
      ?auto_9487 - HOIST
      ?auto_9483 - SURFACE
      ?auto_9486 - SURFACE
      ?auto_9480 - TRUCK
      ?auto_9479 - PLACE
      ?auto_9478 - HOIST
      ?auto_9485 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9477 ?auto_9488 ) ( IS-CRATE ?auto_9476 ) ( not ( = ?auto_9475 ?auto_9476 ) ) ( not ( = ?auto_9474 ?auto_9475 ) ) ( not ( = ?auto_9474 ?auto_9476 ) ) ( not ( = ?auto_9484 ?auto_9488 ) ) ( HOIST-AT ?auto_9492 ?auto_9484 ) ( not ( = ?auto_9477 ?auto_9492 ) ) ( AVAILABLE ?auto_9492 ) ( SURFACE-AT ?auto_9476 ?auto_9484 ) ( ON ?auto_9476 ?auto_9482 ) ( CLEAR ?auto_9476 ) ( not ( = ?auto_9475 ?auto_9482 ) ) ( not ( = ?auto_9476 ?auto_9482 ) ) ( not ( = ?auto_9474 ?auto_9482 ) ) ( IS-CRATE ?auto_9475 ) ( not ( = ?auto_9493 ?auto_9488 ) ) ( not ( = ?auto_9484 ?auto_9493 ) ) ( HOIST-AT ?auto_9481 ?auto_9493 ) ( not ( = ?auto_9477 ?auto_9481 ) ) ( not ( = ?auto_9492 ?auto_9481 ) ) ( AVAILABLE ?auto_9481 ) ( SURFACE-AT ?auto_9475 ?auto_9493 ) ( ON ?auto_9475 ?auto_9490 ) ( CLEAR ?auto_9475 ) ( not ( = ?auto_9475 ?auto_9490 ) ) ( not ( = ?auto_9476 ?auto_9490 ) ) ( not ( = ?auto_9474 ?auto_9490 ) ) ( not ( = ?auto_9482 ?auto_9490 ) ) ( IS-CRATE ?auto_9474 ) ( not ( = ?auto_9489 ?auto_9474 ) ) ( not ( = ?auto_9475 ?auto_9489 ) ) ( not ( = ?auto_9476 ?auto_9489 ) ) ( not ( = ?auto_9482 ?auto_9489 ) ) ( not ( = ?auto_9490 ?auto_9489 ) ) ( not ( = ?auto_9491 ?auto_9488 ) ) ( not ( = ?auto_9484 ?auto_9491 ) ) ( not ( = ?auto_9493 ?auto_9491 ) ) ( HOIST-AT ?auto_9487 ?auto_9491 ) ( not ( = ?auto_9477 ?auto_9487 ) ) ( not ( = ?auto_9492 ?auto_9487 ) ) ( not ( = ?auto_9481 ?auto_9487 ) ) ( AVAILABLE ?auto_9487 ) ( SURFACE-AT ?auto_9474 ?auto_9491 ) ( ON ?auto_9474 ?auto_9483 ) ( CLEAR ?auto_9474 ) ( not ( = ?auto_9475 ?auto_9483 ) ) ( not ( = ?auto_9476 ?auto_9483 ) ) ( not ( = ?auto_9474 ?auto_9483 ) ) ( not ( = ?auto_9482 ?auto_9483 ) ) ( not ( = ?auto_9490 ?auto_9483 ) ) ( not ( = ?auto_9489 ?auto_9483 ) ) ( SURFACE-AT ?auto_9486 ?auto_9488 ) ( CLEAR ?auto_9486 ) ( IS-CRATE ?auto_9489 ) ( not ( = ?auto_9486 ?auto_9489 ) ) ( not ( = ?auto_9475 ?auto_9486 ) ) ( not ( = ?auto_9476 ?auto_9486 ) ) ( not ( = ?auto_9474 ?auto_9486 ) ) ( not ( = ?auto_9482 ?auto_9486 ) ) ( not ( = ?auto_9490 ?auto_9486 ) ) ( not ( = ?auto_9483 ?auto_9486 ) ) ( AVAILABLE ?auto_9477 ) ( TRUCK-AT ?auto_9480 ?auto_9479 ) ( not ( = ?auto_9479 ?auto_9488 ) ) ( not ( = ?auto_9484 ?auto_9479 ) ) ( not ( = ?auto_9493 ?auto_9479 ) ) ( not ( = ?auto_9491 ?auto_9479 ) ) ( HOIST-AT ?auto_9478 ?auto_9479 ) ( not ( = ?auto_9477 ?auto_9478 ) ) ( not ( = ?auto_9492 ?auto_9478 ) ) ( not ( = ?auto_9481 ?auto_9478 ) ) ( not ( = ?auto_9487 ?auto_9478 ) ) ( AVAILABLE ?auto_9478 ) ( SURFACE-AT ?auto_9489 ?auto_9479 ) ( ON ?auto_9489 ?auto_9485 ) ( CLEAR ?auto_9489 ) ( not ( = ?auto_9475 ?auto_9485 ) ) ( not ( = ?auto_9476 ?auto_9485 ) ) ( not ( = ?auto_9474 ?auto_9485 ) ) ( not ( = ?auto_9482 ?auto_9485 ) ) ( not ( = ?auto_9490 ?auto_9485 ) ) ( not ( = ?auto_9489 ?auto_9485 ) ) ( not ( = ?auto_9483 ?auto_9485 ) ) ( not ( = ?auto_9486 ?auto_9485 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9475 ?auto_9476 )
      ( MAKE-2CRATE-VERIFY ?auto_9474 ?auto_9475 ?auto_9476 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9494 - SURFACE
      ?auto_9495 - SURFACE
      ?auto_9496 - SURFACE
      ?auto_9497 - SURFACE
    )
    :vars
    (
      ?auto_9507 - HOIST
      ?auto_9513 - PLACE
      ?auto_9500 - PLACE
      ?auto_9506 - HOIST
      ?auto_9504 - SURFACE
      ?auto_9503 - PLACE
      ?auto_9508 - HOIST
      ?auto_9510 - SURFACE
      ?auto_9498 - PLACE
      ?auto_9509 - HOIST
      ?auto_9501 - SURFACE
      ?auto_9499 - SURFACE
      ?auto_9502 - TRUCK
      ?auto_9511 - PLACE
      ?auto_9505 - HOIST
      ?auto_9512 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9507 ?auto_9513 ) ( IS-CRATE ?auto_9497 ) ( not ( = ?auto_9496 ?auto_9497 ) ) ( not ( = ?auto_9495 ?auto_9496 ) ) ( not ( = ?auto_9495 ?auto_9497 ) ) ( not ( = ?auto_9500 ?auto_9513 ) ) ( HOIST-AT ?auto_9506 ?auto_9500 ) ( not ( = ?auto_9507 ?auto_9506 ) ) ( AVAILABLE ?auto_9506 ) ( SURFACE-AT ?auto_9497 ?auto_9500 ) ( ON ?auto_9497 ?auto_9504 ) ( CLEAR ?auto_9497 ) ( not ( = ?auto_9496 ?auto_9504 ) ) ( not ( = ?auto_9497 ?auto_9504 ) ) ( not ( = ?auto_9495 ?auto_9504 ) ) ( IS-CRATE ?auto_9496 ) ( not ( = ?auto_9503 ?auto_9513 ) ) ( not ( = ?auto_9500 ?auto_9503 ) ) ( HOIST-AT ?auto_9508 ?auto_9503 ) ( not ( = ?auto_9507 ?auto_9508 ) ) ( not ( = ?auto_9506 ?auto_9508 ) ) ( AVAILABLE ?auto_9508 ) ( SURFACE-AT ?auto_9496 ?auto_9503 ) ( ON ?auto_9496 ?auto_9510 ) ( CLEAR ?auto_9496 ) ( not ( = ?auto_9496 ?auto_9510 ) ) ( not ( = ?auto_9497 ?auto_9510 ) ) ( not ( = ?auto_9495 ?auto_9510 ) ) ( not ( = ?auto_9504 ?auto_9510 ) ) ( IS-CRATE ?auto_9495 ) ( not ( = ?auto_9494 ?auto_9495 ) ) ( not ( = ?auto_9496 ?auto_9494 ) ) ( not ( = ?auto_9497 ?auto_9494 ) ) ( not ( = ?auto_9504 ?auto_9494 ) ) ( not ( = ?auto_9510 ?auto_9494 ) ) ( not ( = ?auto_9498 ?auto_9513 ) ) ( not ( = ?auto_9500 ?auto_9498 ) ) ( not ( = ?auto_9503 ?auto_9498 ) ) ( HOIST-AT ?auto_9509 ?auto_9498 ) ( not ( = ?auto_9507 ?auto_9509 ) ) ( not ( = ?auto_9506 ?auto_9509 ) ) ( not ( = ?auto_9508 ?auto_9509 ) ) ( AVAILABLE ?auto_9509 ) ( SURFACE-AT ?auto_9495 ?auto_9498 ) ( ON ?auto_9495 ?auto_9501 ) ( CLEAR ?auto_9495 ) ( not ( = ?auto_9496 ?auto_9501 ) ) ( not ( = ?auto_9497 ?auto_9501 ) ) ( not ( = ?auto_9495 ?auto_9501 ) ) ( not ( = ?auto_9504 ?auto_9501 ) ) ( not ( = ?auto_9510 ?auto_9501 ) ) ( not ( = ?auto_9494 ?auto_9501 ) ) ( SURFACE-AT ?auto_9499 ?auto_9513 ) ( CLEAR ?auto_9499 ) ( IS-CRATE ?auto_9494 ) ( not ( = ?auto_9499 ?auto_9494 ) ) ( not ( = ?auto_9496 ?auto_9499 ) ) ( not ( = ?auto_9497 ?auto_9499 ) ) ( not ( = ?auto_9495 ?auto_9499 ) ) ( not ( = ?auto_9504 ?auto_9499 ) ) ( not ( = ?auto_9510 ?auto_9499 ) ) ( not ( = ?auto_9501 ?auto_9499 ) ) ( AVAILABLE ?auto_9507 ) ( TRUCK-AT ?auto_9502 ?auto_9511 ) ( not ( = ?auto_9511 ?auto_9513 ) ) ( not ( = ?auto_9500 ?auto_9511 ) ) ( not ( = ?auto_9503 ?auto_9511 ) ) ( not ( = ?auto_9498 ?auto_9511 ) ) ( HOIST-AT ?auto_9505 ?auto_9511 ) ( not ( = ?auto_9507 ?auto_9505 ) ) ( not ( = ?auto_9506 ?auto_9505 ) ) ( not ( = ?auto_9508 ?auto_9505 ) ) ( not ( = ?auto_9509 ?auto_9505 ) ) ( AVAILABLE ?auto_9505 ) ( SURFACE-AT ?auto_9494 ?auto_9511 ) ( ON ?auto_9494 ?auto_9512 ) ( CLEAR ?auto_9494 ) ( not ( = ?auto_9496 ?auto_9512 ) ) ( not ( = ?auto_9497 ?auto_9512 ) ) ( not ( = ?auto_9495 ?auto_9512 ) ) ( not ( = ?auto_9504 ?auto_9512 ) ) ( not ( = ?auto_9510 ?auto_9512 ) ) ( not ( = ?auto_9494 ?auto_9512 ) ) ( not ( = ?auto_9501 ?auto_9512 ) ) ( not ( = ?auto_9499 ?auto_9512 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9495 ?auto_9496 ?auto_9497 )
      ( MAKE-3CRATE-VERIFY ?auto_9494 ?auto_9495 ?auto_9496 ?auto_9497 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9514 - SURFACE
      ?auto_9515 - SURFACE
      ?auto_9516 - SURFACE
      ?auto_9517 - SURFACE
      ?auto_9518 - SURFACE
    )
    :vars
    (
      ?auto_9527 - HOIST
      ?auto_9533 - PLACE
      ?auto_9520 - PLACE
      ?auto_9526 - HOIST
      ?auto_9524 - SURFACE
      ?auto_9523 - PLACE
      ?auto_9528 - HOIST
      ?auto_9530 - SURFACE
      ?auto_9519 - PLACE
      ?auto_9529 - HOIST
      ?auto_9521 - SURFACE
      ?auto_9522 - TRUCK
      ?auto_9531 - PLACE
      ?auto_9525 - HOIST
      ?auto_9532 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9527 ?auto_9533 ) ( IS-CRATE ?auto_9518 ) ( not ( = ?auto_9517 ?auto_9518 ) ) ( not ( = ?auto_9516 ?auto_9517 ) ) ( not ( = ?auto_9516 ?auto_9518 ) ) ( not ( = ?auto_9520 ?auto_9533 ) ) ( HOIST-AT ?auto_9526 ?auto_9520 ) ( not ( = ?auto_9527 ?auto_9526 ) ) ( AVAILABLE ?auto_9526 ) ( SURFACE-AT ?auto_9518 ?auto_9520 ) ( ON ?auto_9518 ?auto_9524 ) ( CLEAR ?auto_9518 ) ( not ( = ?auto_9517 ?auto_9524 ) ) ( not ( = ?auto_9518 ?auto_9524 ) ) ( not ( = ?auto_9516 ?auto_9524 ) ) ( IS-CRATE ?auto_9517 ) ( not ( = ?auto_9523 ?auto_9533 ) ) ( not ( = ?auto_9520 ?auto_9523 ) ) ( HOIST-AT ?auto_9528 ?auto_9523 ) ( not ( = ?auto_9527 ?auto_9528 ) ) ( not ( = ?auto_9526 ?auto_9528 ) ) ( AVAILABLE ?auto_9528 ) ( SURFACE-AT ?auto_9517 ?auto_9523 ) ( ON ?auto_9517 ?auto_9530 ) ( CLEAR ?auto_9517 ) ( not ( = ?auto_9517 ?auto_9530 ) ) ( not ( = ?auto_9518 ?auto_9530 ) ) ( not ( = ?auto_9516 ?auto_9530 ) ) ( not ( = ?auto_9524 ?auto_9530 ) ) ( IS-CRATE ?auto_9516 ) ( not ( = ?auto_9515 ?auto_9516 ) ) ( not ( = ?auto_9517 ?auto_9515 ) ) ( not ( = ?auto_9518 ?auto_9515 ) ) ( not ( = ?auto_9524 ?auto_9515 ) ) ( not ( = ?auto_9530 ?auto_9515 ) ) ( not ( = ?auto_9519 ?auto_9533 ) ) ( not ( = ?auto_9520 ?auto_9519 ) ) ( not ( = ?auto_9523 ?auto_9519 ) ) ( HOIST-AT ?auto_9529 ?auto_9519 ) ( not ( = ?auto_9527 ?auto_9529 ) ) ( not ( = ?auto_9526 ?auto_9529 ) ) ( not ( = ?auto_9528 ?auto_9529 ) ) ( AVAILABLE ?auto_9529 ) ( SURFACE-AT ?auto_9516 ?auto_9519 ) ( ON ?auto_9516 ?auto_9521 ) ( CLEAR ?auto_9516 ) ( not ( = ?auto_9517 ?auto_9521 ) ) ( not ( = ?auto_9518 ?auto_9521 ) ) ( not ( = ?auto_9516 ?auto_9521 ) ) ( not ( = ?auto_9524 ?auto_9521 ) ) ( not ( = ?auto_9530 ?auto_9521 ) ) ( not ( = ?auto_9515 ?auto_9521 ) ) ( SURFACE-AT ?auto_9514 ?auto_9533 ) ( CLEAR ?auto_9514 ) ( IS-CRATE ?auto_9515 ) ( not ( = ?auto_9514 ?auto_9515 ) ) ( not ( = ?auto_9517 ?auto_9514 ) ) ( not ( = ?auto_9518 ?auto_9514 ) ) ( not ( = ?auto_9516 ?auto_9514 ) ) ( not ( = ?auto_9524 ?auto_9514 ) ) ( not ( = ?auto_9530 ?auto_9514 ) ) ( not ( = ?auto_9521 ?auto_9514 ) ) ( AVAILABLE ?auto_9527 ) ( TRUCK-AT ?auto_9522 ?auto_9531 ) ( not ( = ?auto_9531 ?auto_9533 ) ) ( not ( = ?auto_9520 ?auto_9531 ) ) ( not ( = ?auto_9523 ?auto_9531 ) ) ( not ( = ?auto_9519 ?auto_9531 ) ) ( HOIST-AT ?auto_9525 ?auto_9531 ) ( not ( = ?auto_9527 ?auto_9525 ) ) ( not ( = ?auto_9526 ?auto_9525 ) ) ( not ( = ?auto_9528 ?auto_9525 ) ) ( not ( = ?auto_9529 ?auto_9525 ) ) ( AVAILABLE ?auto_9525 ) ( SURFACE-AT ?auto_9515 ?auto_9531 ) ( ON ?auto_9515 ?auto_9532 ) ( CLEAR ?auto_9515 ) ( not ( = ?auto_9517 ?auto_9532 ) ) ( not ( = ?auto_9518 ?auto_9532 ) ) ( not ( = ?auto_9516 ?auto_9532 ) ) ( not ( = ?auto_9524 ?auto_9532 ) ) ( not ( = ?auto_9530 ?auto_9532 ) ) ( not ( = ?auto_9515 ?auto_9532 ) ) ( not ( = ?auto_9521 ?auto_9532 ) ) ( not ( = ?auto_9514 ?auto_9532 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9516 ?auto_9517 ?auto_9518 )
      ( MAKE-4CRATE-VERIFY ?auto_9514 ?auto_9515 ?auto_9516 ?auto_9517 ?auto_9518 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9534 - SURFACE
      ?auto_9535 - SURFACE
    )
    :vars
    (
      ?auto_9546 - HOIST
      ?auto_9553 - PLACE
      ?auto_9540 - SURFACE
      ?auto_9538 - PLACE
      ?auto_9545 - HOIST
      ?auto_9543 - SURFACE
      ?auto_9542 - PLACE
      ?auto_9547 - HOIST
      ?auto_9550 - SURFACE
      ?auto_9549 - SURFACE
      ?auto_9536 - PLACE
      ?auto_9548 - HOIST
      ?auto_9539 - SURFACE
      ?auto_9537 - SURFACE
      ?auto_9551 - PLACE
      ?auto_9544 - HOIST
      ?auto_9552 - SURFACE
      ?auto_9541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9546 ?auto_9553 ) ( IS-CRATE ?auto_9535 ) ( not ( = ?auto_9534 ?auto_9535 ) ) ( not ( = ?auto_9540 ?auto_9534 ) ) ( not ( = ?auto_9540 ?auto_9535 ) ) ( not ( = ?auto_9538 ?auto_9553 ) ) ( HOIST-AT ?auto_9545 ?auto_9538 ) ( not ( = ?auto_9546 ?auto_9545 ) ) ( AVAILABLE ?auto_9545 ) ( SURFACE-AT ?auto_9535 ?auto_9538 ) ( ON ?auto_9535 ?auto_9543 ) ( CLEAR ?auto_9535 ) ( not ( = ?auto_9534 ?auto_9543 ) ) ( not ( = ?auto_9535 ?auto_9543 ) ) ( not ( = ?auto_9540 ?auto_9543 ) ) ( IS-CRATE ?auto_9534 ) ( not ( = ?auto_9542 ?auto_9553 ) ) ( not ( = ?auto_9538 ?auto_9542 ) ) ( HOIST-AT ?auto_9547 ?auto_9542 ) ( not ( = ?auto_9546 ?auto_9547 ) ) ( not ( = ?auto_9545 ?auto_9547 ) ) ( AVAILABLE ?auto_9547 ) ( SURFACE-AT ?auto_9534 ?auto_9542 ) ( ON ?auto_9534 ?auto_9550 ) ( CLEAR ?auto_9534 ) ( not ( = ?auto_9534 ?auto_9550 ) ) ( not ( = ?auto_9535 ?auto_9550 ) ) ( not ( = ?auto_9540 ?auto_9550 ) ) ( not ( = ?auto_9543 ?auto_9550 ) ) ( IS-CRATE ?auto_9540 ) ( not ( = ?auto_9549 ?auto_9540 ) ) ( not ( = ?auto_9534 ?auto_9549 ) ) ( not ( = ?auto_9535 ?auto_9549 ) ) ( not ( = ?auto_9543 ?auto_9549 ) ) ( not ( = ?auto_9550 ?auto_9549 ) ) ( not ( = ?auto_9536 ?auto_9553 ) ) ( not ( = ?auto_9538 ?auto_9536 ) ) ( not ( = ?auto_9542 ?auto_9536 ) ) ( HOIST-AT ?auto_9548 ?auto_9536 ) ( not ( = ?auto_9546 ?auto_9548 ) ) ( not ( = ?auto_9545 ?auto_9548 ) ) ( not ( = ?auto_9547 ?auto_9548 ) ) ( AVAILABLE ?auto_9548 ) ( SURFACE-AT ?auto_9540 ?auto_9536 ) ( ON ?auto_9540 ?auto_9539 ) ( CLEAR ?auto_9540 ) ( not ( = ?auto_9534 ?auto_9539 ) ) ( not ( = ?auto_9535 ?auto_9539 ) ) ( not ( = ?auto_9540 ?auto_9539 ) ) ( not ( = ?auto_9543 ?auto_9539 ) ) ( not ( = ?auto_9550 ?auto_9539 ) ) ( not ( = ?auto_9549 ?auto_9539 ) ) ( SURFACE-AT ?auto_9537 ?auto_9553 ) ( CLEAR ?auto_9537 ) ( IS-CRATE ?auto_9549 ) ( not ( = ?auto_9537 ?auto_9549 ) ) ( not ( = ?auto_9534 ?auto_9537 ) ) ( not ( = ?auto_9535 ?auto_9537 ) ) ( not ( = ?auto_9540 ?auto_9537 ) ) ( not ( = ?auto_9543 ?auto_9537 ) ) ( not ( = ?auto_9550 ?auto_9537 ) ) ( not ( = ?auto_9539 ?auto_9537 ) ) ( AVAILABLE ?auto_9546 ) ( not ( = ?auto_9551 ?auto_9553 ) ) ( not ( = ?auto_9538 ?auto_9551 ) ) ( not ( = ?auto_9542 ?auto_9551 ) ) ( not ( = ?auto_9536 ?auto_9551 ) ) ( HOIST-AT ?auto_9544 ?auto_9551 ) ( not ( = ?auto_9546 ?auto_9544 ) ) ( not ( = ?auto_9545 ?auto_9544 ) ) ( not ( = ?auto_9547 ?auto_9544 ) ) ( not ( = ?auto_9548 ?auto_9544 ) ) ( AVAILABLE ?auto_9544 ) ( SURFACE-AT ?auto_9549 ?auto_9551 ) ( ON ?auto_9549 ?auto_9552 ) ( CLEAR ?auto_9549 ) ( not ( = ?auto_9534 ?auto_9552 ) ) ( not ( = ?auto_9535 ?auto_9552 ) ) ( not ( = ?auto_9540 ?auto_9552 ) ) ( not ( = ?auto_9543 ?auto_9552 ) ) ( not ( = ?auto_9550 ?auto_9552 ) ) ( not ( = ?auto_9549 ?auto_9552 ) ) ( not ( = ?auto_9539 ?auto_9552 ) ) ( not ( = ?auto_9537 ?auto_9552 ) ) ( TRUCK-AT ?auto_9541 ?auto_9553 ) )
    :subtasks
    ( ( !DRIVE ?auto_9541 ?auto_9553 ?auto_9551 )
      ( MAKE-2CRATE ?auto_9540 ?auto_9534 ?auto_9535 )
      ( MAKE-1CRATE-VERIFY ?auto_9534 ?auto_9535 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9554 - SURFACE
      ?auto_9555 - SURFACE
      ?auto_9556 - SURFACE
    )
    :vars
    (
      ?auto_9572 - HOIST
      ?auto_9564 - PLACE
      ?auto_9568 - PLACE
      ?auto_9569 - HOIST
      ?auto_9570 - SURFACE
      ?auto_9561 - PLACE
      ?auto_9565 - HOIST
      ?auto_9557 - SURFACE
      ?auto_9563 - SURFACE
      ?auto_9566 - PLACE
      ?auto_9571 - HOIST
      ?auto_9562 - SURFACE
      ?auto_9559 - SURFACE
      ?auto_9573 - PLACE
      ?auto_9558 - HOIST
      ?auto_9567 - SURFACE
      ?auto_9560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9572 ?auto_9564 ) ( IS-CRATE ?auto_9556 ) ( not ( = ?auto_9555 ?auto_9556 ) ) ( not ( = ?auto_9554 ?auto_9555 ) ) ( not ( = ?auto_9554 ?auto_9556 ) ) ( not ( = ?auto_9568 ?auto_9564 ) ) ( HOIST-AT ?auto_9569 ?auto_9568 ) ( not ( = ?auto_9572 ?auto_9569 ) ) ( AVAILABLE ?auto_9569 ) ( SURFACE-AT ?auto_9556 ?auto_9568 ) ( ON ?auto_9556 ?auto_9570 ) ( CLEAR ?auto_9556 ) ( not ( = ?auto_9555 ?auto_9570 ) ) ( not ( = ?auto_9556 ?auto_9570 ) ) ( not ( = ?auto_9554 ?auto_9570 ) ) ( IS-CRATE ?auto_9555 ) ( not ( = ?auto_9561 ?auto_9564 ) ) ( not ( = ?auto_9568 ?auto_9561 ) ) ( HOIST-AT ?auto_9565 ?auto_9561 ) ( not ( = ?auto_9572 ?auto_9565 ) ) ( not ( = ?auto_9569 ?auto_9565 ) ) ( AVAILABLE ?auto_9565 ) ( SURFACE-AT ?auto_9555 ?auto_9561 ) ( ON ?auto_9555 ?auto_9557 ) ( CLEAR ?auto_9555 ) ( not ( = ?auto_9555 ?auto_9557 ) ) ( not ( = ?auto_9556 ?auto_9557 ) ) ( not ( = ?auto_9554 ?auto_9557 ) ) ( not ( = ?auto_9570 ?auto_9557 ) ) ( IS-CRATE ?auto_9554 ) ( not ( = ?auto_9563 ?auto_9554 ) ) ( not ( = ?auto_9555 ?auto_9563 ) ) ( not ( = ?auto_9556 ?auto_9563 ) ) ( not ( = ?auto_9570 ?auto_9563 ) ) ( not ( = ?auto_9557 ?auto_9563 ) ) ( not ( = ?auto_9566 ?auto_9564 ) ) ( not ( = ?auto_9568 ?auto_9566 ) ) ( not ( = ?auto_9561 ?auto_9566 ) ) ( HOIST-AT ?auto_9571 ?auto_9566 ) ( not ( = ?auto_9572 ?auto_9571 ) ) ( not ( = ?auto_9569 ?auto_9571 ) ) ( not ( = ?auto_9565 ?auto_9571 ) ) ( AVAILABLE ?auto_9571 ) ( SURFACE-AT ?auto_9554 ?auto_9566 ) ( ON ?auto_9554 ?auto_9562 ) ( CLEAR ?auto_9554 ) ( not ( = ?auto_9555 ?auto_9562 ) ) ( not ( = ?auto_9556 ?auto_9562 ) ) ( not ( = ?auto_9554 ?auto_9562 ) ) ( not ( = ?auto_9570 ?auto_9562 ) ) ( not ( = ?auto_9557 ?auto_9562 ) ) ( not ( = ?auto_9563 ?auto_9562 ) ) ( SURFACE-AT ?auto_9559 ?auto_9564 ) ( CLEAR ?auto_9559 ) ( IS-CRATE ?auto_9563 ) ( not ( = ?auto_9559 ?auto_9563 ) ) ( not ( = ?auto_9555 ?auto_9559 ) ) ( not ( = ?auto_9556 ?auto_9559 ) ) ( not ( = ?auto_9554 ?auto_9559 ) ) ( not ( = ?auto_9570 ?auto_9559 ) ) ( not ( = ?auto_9557 ?auto_9559 ) ) ( not ( = ?auto_9562 ?auto_9559 ) ) ( AVAILABLE ?auto_9572 ) ( not ( = ?auto_9573 ?auto_9564 ) ) ( not ( = ?auto_9568 ?auto_9573 ) ) ( not ( = ?auto_9561 ?auto_9573 ) ) ( not ( = ?auto_9566 ?auto_9573 ) ) ( HOIST-AT ?auto_9558 ?auto_9573 ) ( not ( = ?auto_9572 ?auto_9558 ) ) ( not ( = ?auto_9569 ?auto_9558 ) ) ( not ( = ?auto_9565 ?auto_9558 ) ) ( not ( = ?auto_9571 ?auto_9558 ) ) ( AVAILABLE ?auto_9558 ) ( SURFACE-AT ?auto_9563 ?auto_9573 ) ( ON ?auto_9563 ?auto_9567 ) ( CLEAR ?auto_9563 ) ( not ( = ?auto_9555 ?auto_9567 ) ) ( not ( = ?auto_9556 ?auto_9567 ) ) ( not ( = ?auto_9554 ?auto_9567 ) ) ( not ( = ?auto_9570 ?auto_9567 ) ) ( not ( = ?auto_9557 ?auto_9567 ) ) ( not ( = ?auto_9563 ?auto_9567 ) ) ( not ( = ?auto_9562 ?auto_9567 ) ) ( not ( = ?auto_9559 ?auto_9567 ) ) ( TRUCK-AT ?auto_9560 ?auto_9564 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9555 ?auto_9556 )
      ( MAKE-2CRATE-VERIFY ?auto_9554 ?auto_9555 ?auto_9556 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9574 - SURFACE
      ?auto_9575 - SURFACE
      ?auto_9576 - SURFACE
      ?auto_9577 - SURFACE
    )
    :vars
    (
      ?auto_9578 - HOIST
      ?auto_9591 - PLACE
      ?auto_9589 - PLACE
      ?auto_9586 - HOIST
      ?auto_9588 - SURFACE
      ?auto_9581 - PLACE
      ?auto_9580 - HOIST
      ?auto_9585 - SURFACE
      ?auto_9584 - PLACE
      ?auto_9583 - HOIST
      ?auto_9582 - SURFACE
      ?auto_9593 - SURFACE
      ?auto_9592 - PLACE
      ?auto_9590 - HOIST
      ?auto_9587 - SURFACE
      ?auto_9579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9578 ?auto_9591 ) ( IS-CRATE ?auto_9577 ) ( not ( = ?auto_9576 ?auto_9577 ) ) ( not ( = ?auto_9575 ?auto_9576 ) ) ( not ( = ?auto_9575 ?auto_9577 ) ) ( not ( = ?auto_9589 ?auto_9591 ) ) ( HOIST-AT ?auto_9586 ?auto_9589 ) ( not ( = ?auto_9578 ?auto_9586 ) ) ( AVAILABLE ?auto_9586 ) ( SURFACE-AT ?auto_9577 ?auto_9589 ) ( ON ?auto_9577 ?auto_9588 ) ( CLEAR ?auto_9577 ) ( not ( = ?auto_9576 ?auto_9588 ) ) ( not ( = ?auto_9577 ?auto_9588 ) ) ( not ( = ?auto_9575 ?auto_9588 ) ) ( IS-CRATE ?auto_9576 ) ( not ( = ?auto_9581 ?auto_9591 ) ) ( not ( = ?auto_9589 ?auto_9581 ) ) ( HOIST-AT ?auto_9580 ?auto_9581 ) ( not ( = ?auto_9578 ?auto_9580 ) ) ( not ( = ?auto_9586 ?auto_9580 ) ) ( AVAILABLE ?auto_9580 ) ( SURFACE-AT ?auto_9576 ?auto_9581 ) ( ON ?auto_9576 ?auto_9585 ) ( CLEAR ?auto_9576 ) ( not ( = ?auto_9576 ?auto_9585 ) ) ( not ( = ?auto_9577 ?auto_9585 ) ) ( not ( = ?auto_9575 ?auto_9585 ) ) ( not ( = ?auto_9588 ?auto_9585 ) ) ( IS-CRATE ?auto_9575 ) ( not ( = ?auto_9574 ?auto_9575 ) ) ( not ( = ?auto_9576 ?auto_9574 ) ) ( not ( = ?auto_9577 ?auto_9574 ) ) ( not ( = ?auto_9588 ?auto_9574 ) ) ( not ( = ?auto_9585 ?auto_9574 ) ) ( not ( = ?auto_9584 ?auto_9591 ) ) ( not ( = ?auto_9589 ?auto_9584 ) ) ( not ( = ?auto_9581 ?auto_9584 ) ) ( HOIST-AT ?auto_9583 ?auto_9584 ) ( not ( = ?auto_9578 ?auto_9583 ) ) ( not ( = ?auto_9586 ?auto_9583 ) ) ( not ( = ?auto_9580 ?auto_9583 ) ) ( AVAILABLE ?auto_9583 ) ( SURFACE-AT ?auto_9575 ?auto_9584 ) ( ON ?auto_9575 ?auto_9582 ) ( CLEAR ?auto_9575 ) ( not ( = ?auto_9576 ?auto_9582 ) ) ( not ( = ?auto_9577 ?auto_9582 ) ) ( not ( = ?auto_9575 ?auto_9582 ) ) ( not ( = ?auto_9588 ?auto_9582 ) ) ( not ( = ?auto_9585 ?auto_9582 ) ) ( not ( = ?auto_9574 ?auto_9582 ) ) ( SURFACE-AT ?auto_9593 ?auto_9591 ) ( CLEAR ?auto_9593 ) ( IS-CRATE ?auto_9574 ) ( not ( = ?auto_9593 ?auto_9574 ) ) ( not ( = ?auto_9576 ?auto_9593 ) ) ( not ( = ?auto_9577 ?auto_9593 ) ) ( not ( = ?auto_9575 ?auto_9593 ) ) ( not ( = ?auto_9588 ?auto_9593 ) ) ( not ( = ?auto_9585 ?auto_9593 ) ) ( not ( = ?auto_9582 ?auto_9593 ) ) ( AVAILABLE ?auto_9578 ) ( not ( = ?auto_9592 ?auto_9591 ) ) ( not ( = ?auto_9589 ?auto_9592 ) ) ( not ( = ?auto_9581 ?auto_9592 ) ) ( not ( = ?auto_9584 ?auto_9592 ) ) ( HOIST-AT ?auto_9590 ?auto_9592 ) ( not ( = ?auto_9578 ?auto_9590 ) ) ( not ( = ?auto_9586 ?auto_9590 ) ) ( not ( = ?auto_9580 ?auto_9590 ) ) ( not ( = ?auto_9583 ?auto_9590 ) ) ( AVAILABLE ?auto_9590 ) ( SURFACE-AT ?auto_9574 ?auto_9592 ) ( ON ?auto_9574 ?auto_9587 ) ( CLEAR ?auto_9574 ) ( not ( = ?auto_9576 ?auto_9587 ) ) ( not ( = ?auto_9577 ?auto_9587 ) ) ( not ( = ?auto_9575 ?auto_9587 ) ) ( not ( = ?auto_9588 ?auto_9587 ) ) ( not ( = ?auto_9585 ?auto_9587 ) ) ( not ( = ?auto_9574 ?auto_9587 ) ) ( not ( = ?auto_9582 ?auto_9587 ) ) ( not ( = ?auto_9593 ?auto_9587 ) ) ( TRUCK-AT ?auto_9579 ?auto_9591 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9575 ?auto_9576 ?auto_9577 )
      ( MAKE-3CRATE-VERIFY ?auto_9574 ?auto_9575 ?auto_9576 ?auto_9577 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9594 - SURFACE
      ?auto_9595 - SURFACE
      ?auto_9596 - SURFACE
      ?auto_9597 - SURFACE
      ?auto_9598 - SURFACE
    )
    :vars
    (
      ?auto_9599 - HOIST
      ?auto_9612 - PLACE
      ?auto_9610 - PLACE
      ?auto_9607 - HOIST
      ?auto_9609 - SURFACE
      ?auto_9602 - PLACE
      ?auto_9601 - HOIST
      ?auto_9606 - SURFACE
      ?auto_9605 - PLACE
      ?auto_9604 - HOIST
      ?auto_9603 - SURFACE
      ?auto_9613 - PLACE
      ?auto_9611 - HOIST
      ?auto_9608 - SURFACE
      ?auto_9600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9599 ?auto_9612 ) ( IS-CRATE ?auto_9598 ) ( not ( = ?auto_9597 ?auto_9598 ) ) ( not ( = ?auto_9596 ?auto_9597 ) ) ( not ( = ?auto_9596 ?auto_9598 ) ) ( not ( = ?auto_9610 ?auto_9612 ) ) ( HOIST-AT ?auto_9607 ?auto_9610 ) ( not ( = ?auto_9599 ?auto_9607 ) ) ( AVAILABLE ?auto_9607 ) ( SURFACE-AT ?auto_9598 ?auto_9610 ) ( ON ?auto_9598 ?auto_9609 ) ( CLEAR ?auto_9598 ) ( not ( = ?auto_9597 ?auto_9609 ) ) ( not ( = ?auto_9598 ?auto_9609 ) ) ( not ( = ?auto_9596 ?auto_9609 ) ) ( IS-CRATE ?auto_9597 ) ( not ( = ?auto_9602 ?auto_9612 ) ) ( not ( = ?auto_9610 ?auto_9602 ) ) ( HOIST-AT ?auto_9601 ?auto_9602 ) ( not ( = ?auto_9599 ?auto_9601 ) ) ( not ( = ?auto_9607 ?auto_9601 ) ) ( AVAILABLE ?auto_9601 ) ( SURFACE-AT ?auto_9597 ?auto_9602 ) ( ON ?auto_9597 ?auto_9606 ) ( CLEAR ?auto_9597 ) ( not ( = ?auto_9597 ?auto_9606 ) ) ( not ( = ?auto_9598 ?auto_9606 ) ) ( not ( = ?auto_9596 ?auto_9606 ) ) ( not ( = ?auto_9609 ?auto_9606 ) ) ( IS-CRATE ?auto_9596 ) ( not ( = ?auto_9595 ?auto_9596 ) ) ( not ( = ?auto_9597 ?auto_9595 ) ) ( not ( = ?auto_9598 ?auto_9595 ) ) ( not ( = ?auto_9609 ?auto_9595 ) ) ( not ( = ?auto_9606 ?auto_9595 ) ) ( not ( = ?auto_9605 ?auto_9612 ) ) ( not ( = ?auto_9610 ?auto_9605 ) ) ( not ( = ?auto_9602 ?auto_9605 ) ) ( HOIST-AT ?auto_9604 ?auto_9605 ) ( not ( = ?auto_9599 ?auto_9604 ) ) ( not ( = ?auto_9607 ?auto_9604 ) ) ( not ( = ?auto_9601 ?auto_9604 ) ) ( AVAILABLE ?auto_9604 ) ( SURFACE-AT ?auto_9596 ?auto_9605 ) ( ON ?auto_9596 ?auto_9603 ) ( CLEAR ?auto_9596 ) ( not ( = ?auto_9597 ?auto_9603 ) ) ( not ( = ?auto_9598 ?auto_9603 ) ) ( not ( = ?auto_9596 ?auto_9603 ) ) ( not ( = ?auto_9609 ?auto_9603 ) ) ( not ( = ?auto_9606 ?auto_9603 ) ) ( not ( = ?auto_9595 ?auto_9603 ) ) ( SURFACE-AT ?auto_9594 ?auto_9612 ) ( CLEAR ?auto_9594 ) ( IS-CRATE ?auto_9595 ) ( not ( = ?auto_9594 ?auto_9595 ) ) ( not ( = ?auto_9597 ?auto_9594 ) ) ( not ( = ?auto_9598 ?auto_9594 ) ) ( not ( = ?auto_9596 ?auto_9594 ) ) ( not ( = ?auto_9609 ?auto_9594 ) ) ( not ( = ?auto_9606 ?auto_9594 ) ) ( not ( = ?auto_9603 ?auto_9594 ) ) ( AVAILABLE ?auto_9599 ) ( not ( = ?auto_9613 ?auto_9612 ) ) ( not ( = ?auto_9610 ?auto_9613 ) ) ( not ( = ?auto_9602 ?auto_9613 ) ) ( not ( = ?auto_9605 ?auto_9613 ) ) ( HOIST-AT ?auto_9611 ?auto_9613 ) ( not ( = ?auto_9599 ?auto_9611 ) ) ( not ( = ?auto_9607 ?auto_9611 ) ) ( not ( = ?auto_9601 ?auto_9611 ) ) ( not ( = ?auto_9604 ?auto_9611 ) ) ( AVAILABLE ?auto_9611 ) ( SURFACE-AT ?auto_9595 ?auto_9613 ) ( ON ?auto_9595 ?auto_9608 ) ( CLEAR ?auto_9595 ) ( not ( = ?auto_9597 ?auto_9608 ) ) ( not ( = ?auto_9598 ?auto_9608 ) ) ( not ( = ?auto_9596 ?auto_9608 ) ) ( not ( = ?auto_9609 ?auto_9608 ) ) ( not ( = ?auto_9606 ?auto_9608 ) ) ( not ( = ?auto_9595 ?auto_9608 ) ) ( not ( = ?auto_9603 ?auto_9608 ) ) ( not ( = ?auto_9594 ?auto_9608 ) ) ( TRUCK-AT ?auto_9600 ?auto_9612 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9596 ?auto_9597 ?auto_9598 )
      ( MAKE-4CRATE-VERIFY ?auto_9594 ?auto_9595 ?auto_9596 ?auto_9597 ?auto_9598 ) )
  )

)

