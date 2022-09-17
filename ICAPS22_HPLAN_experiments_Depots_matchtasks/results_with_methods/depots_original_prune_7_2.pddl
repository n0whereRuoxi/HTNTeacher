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

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72515 - SURFACE
      ?auto_72516 - SURFACE
    )
    :vars
    (
      ?auto_72517 - HOIST
      ?auto_72518 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72517 ?auto_72518 ) ( SURFACE-AT ?auto_72515 ?auto_72518 ) ( CLEAR ?auto_72515 ) ( LIFTING ?auto_72517 ?auto_72516 ) ( IS-CRATE ?auto_72516 ) ( not ( = ?auto_72515 ?auto_72516 ) ) )
    :subtasks
    ( ( !DROP ?auto_72517 ?auto_72516 ?auto_72515 ?auto_72518 )
      ( MAKE-1CRATE-VERIFY ?auto_72515 ?auto_72516 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72519 - SURFACE
      ?auto_72520 - SURFACE
    )
    :vars
    (
      ?auto_72521 - HOIST
      ?auto_72522 - PLACE
      ?auto_72523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72521 ?auto_72522 ) ( SURFACE-AT ?auto_72519 ?auto_72522 ) ( CLEAR ?auto_72519 ) ( IS-CRATE ?auto_72520 ) ( not ( = ?auto_72519 ?auto_72520 ) ) ( TRUCK-AT ?auto_72523 ?auto_72522 ) ( AVAILABLE ?auto_72521 ) ( IN ?auto_72520 ?auto_72523 ) )
    :subtasks
    ( ( !UNLOAD ?auto_72521 ?auto_72520 ?auto_72523 ?auto_72522 )
      ( MAKE-1CRATE ?auto_72519 ?auto_72520 )
      ( MAKE-1CRATE-VERIFY ?auto_72519 ?auto_72520 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72524 - SURFACE
      ?auto_72525 - SURFACE
    )
    :vars
    (
      ?auto_72526 - HOIST
      ?auto_72528 - PLACE
      ?auto_72527 - TRUCK
      ?auto_72529 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72526 ?auto_72528 ) ( SURFACE-AT ?auto_72524 ?auto_72528 ) ( CLEAR ?auto_72524 ) ( IS-CRATE ?auto_72525 ) ( not ( = ?auto_72524 ?auto_72525 ) ) ( AVAILABLE ?auto_72526 ) ( IN ?auto_72525 ?auto_72527 ) ( TRUCK-AT ?auto_72527 ?auto_72529 ) ( not ( = ?auto_72529 ?auto_72528 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_72527 ?auto_72529 ?auto_72528 )
      ( MAKE-1CRATE ?auto_72524 ?auto_72525 )
      ( MAKE-1CRATE-VERIFY ?auto_72524 ?auto_72525 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72530 - SURFACE
      ?auto_72531 - SURFACE
    )
    :vars
    (
      ?auto_72532 - HOIST
      ?auto_72534 - PLACE
      ?auto_72533 - TRUCK
      ?auto_72535 - PLACE
      ?auto_72536 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_72532 ?auto_72534 ) ( SURFACE-AT ?auto_72530 ?auto_72534 ) ( CLEAR ?auto_72530 ) ( IS-CRATE ?auto_72531 ) ( not ( = ?auto_72530 ?auto_72531 ) ) ( AVAILABLE ?auto_72532 ) ( TRUCK-AT ?auto_72533 ?auto_72535 ) ( not ( = ?auto_72535 ?auto_72534 ) ) ( HOIST-AT ?auto_72536 ?auto_72535 ) ( LIFTING ?auto_72536 ?auto_72531 ) ( not ( = ?auto_72532 ?auto_72536 ) ) )
    :subtasks
    ( ( !LOAD ?auto_72536 ?auto_72531 ?auto_72533 ?auto_72535 )
      ( MAKE-1CRATE ?auto_72530 ?auto_72531 )
      ( MAKE-1CRATE-VERIFY ?auto_72530 ?auto_72531 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72537 - SURFACE
      ?auto_72538 - SURFACE
    )
    :vars
    (
      ?auto_72543 - HOIST
      ?auto_72540 - PLACE
      ?auto_72539 - TRUCK
      ?auto_72541 - PLACE
      ?auto_72542 - HOIST
      ?auto_72544 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72543 ?auto_72540 ) ( SURFACE-AT ?auto_72537 ?auto_72540 ) ( CLEAR ?auto_72537 ) ( IS-CRATE ?auto_72538 ) ( not ( = ?auto_72537 ?auto_72538 ) ) ( AVAILABLE ?auto_72543 ) ( TRUCK-AT ?auto_72539 ?auto_72541 ) ( not ( = ?auto_72541 ?auto_72540 ) ) ( HOIST-AT ?auto_72542 ?auto_72541 ) ( not ( = ?auto_72543 ?auto_72542 ) ) ( AVAILABLE ?auto_72542 ) ( SURFACE-AT ?auto_72538 ?auto_72541 ) ( ON ?auto_72538 ?auto_72544 ) ( CLEAR ?auto_72538 ) ( not ( = ?auto_72537 ?auto_72544 ) ) ( not ( = ?auto_72538 ?auto_72544 ) ) )
    :subtasks
    ( ( !LIFT ?auto_72542 ?auto_72538 ?auto_72544 ?auto_72541 )
      ( MAKE-1CRATE ?auto_72537 ?auto_72538 )
      ( MAKE-1CRATE-VERIFY ?auto_72537 ?auto_72538 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72545 - SURFACE
      ?auto_72546 - SURFACE
    )
    :vars
    (
      ?auto_72549 - HOIST
      ?auto_72551 - PLACE
      ?auto_72552 - PLACE
      ?auto_72550 - HOIST
      ?auto_72548 - SURFACE
      ?auto_72547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72549 ?auto_72551 ) ( SURFACE-AT ?auto_72545 ?auto_72551 ) ( CLEAR ?auto_72545 ) ( IS-CRATE ?auto_72546 ) ( not ( = ?auto_72545 ?auto_72546 ) ) ( AVAILABLE ?auto_72549 ) ( not ( = ?auto_72552 ?auto_72551 ) ) ( HOIST-AT ?auto_72550 ?auto_72552 ) ( not ( = ?auto_72549 ?auto_72550 ) ) ( AVAILABLE ?auto_72550 ) ( SURFACE-AT ?auto_72546 ?auto_72552 ) ( ON ?auto_72546 ?auto_72548 ) ( CLEAR ?auto_72546 ) ( not ( = ?auto_72545 ?auto_72548 ) ) ( not ( = ?auto_72546 ?auto_72548 ) ) ( TRUCK-AT ?auto_72547 ?auto_72551 ) )
    :subtasks
    ( ( !DRIVE ?auto_72547 ?auto_72551 ?auto_72552 )
      ( MAKE-1CRATE ?auto_72545 ?auto_72546 )
      ( MAKE-1CRATE-VERIFY ?auto_72545 ?auto_72546 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72562 - SURFACE
      ?auto_72563 - SURFACE
      ?auto_72564 - SURFACE
    )
    :vars
    (
      ?auto_72566 - HOIST
      ?auto_72565 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72566 ?auto_72565 ) ( SURFACE-AT ?auto_72563 ?auto_72565 ) ( CLEAR ?auto_72563 ) ( LIFTING ?auto_72566 ?auto_72564 ) ( IS-CRATE ?auto_72564 ) ( not ( = ?auto_72563 ?auto_72564 ) ) ( ON ?auto_72563 ?auto_72562 ) ( not ( = ?auto_72562 ?auto_72563 ) ) ( not ( = ?auto_72562 ?auto_72564 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72563 ?auto_72564 )
      ( MAKE-2CRATE-VERIFY ?auto_72562 ?auto_72563 ?auto_72564 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72572 - SURFACE
      ?auto_72573 - SURFACE
      ?auto_72574 - SURFACE
    )
    :vars
    (
      ?auto_72576 - HOIST
      ?auto_72575 - PLACE
      ?auto_72577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72576 ?auto_72575 ) ( SURFACE-AT ?auto_72573 ?auto_72575 ) ( CLEAR ?auto_72573 ) ( IS-CRATE ?auto_72574 ) ( not ( = ?auto_72573 ?auto_72574 ) ) ( TRUCK-AT ?auto_72577 ?auto_72575 ) ( AVAILABLE ?auto_72576 ) ( IN ?auto_72574 ?auto_72577 ) ( ON ?auto_72573 ?auto_72572 ) ( not ( = ?auto_72572 ?auto_72573 ) ) ( not ( = ?auto_72572 ?auto_72574 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72573 ?auto_72574 )
      ( MAKE-2CRATE-VERIFY ?auto_72572 ?auto_72573 ?auto_72574 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72578 - SURFACE
      ?auto_72579 - SURFACE
    )
    :vars
    (
      ?auto_72583 - HOIST
      ?auto_72581 - PLACE
      ?auto_72580 - TRUCK
      ?auto_72582 - SURFACE
      ?auto_72584 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72583 ?auto_72581 ) ( SURFACE-AT ?auto_72578 ?auto_72581 ) ( CLEAR ?auto_72578 ) ( IS-CRATE ?auto_72579 ) ( not ( = ?auto_72578 ?auto_72579 ) ) ( AVAILABLE ?auto_72583 ) ( IN ?auto_72579 ?auto_72580 ) ( ON ?auto_72578 ?auto_72582 ) ( not ( = ?auto_72582 ?auto_72578 ) ) ( not ( = ?auto_72582 ?auto_72579 ) ) ( TRUCK-AT ?auto_72580 ?auto_72584 ) ( not ( = ?auto_72584 ?auto_72581 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_72580 ?auto_72584 ?auto_72581 )
      ( MAKE-2CRATE ?auto_72582 ?auto_72578 ?auto_72579 )
      ( MAKE-1CRATE-VERIFY ?auto_72578 ?auto_72579 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72585 - SURFACE
      ?auto_72586 - SURFACE
      ?auto_72587 - SURFACE
    )
    :vars
    (
      ?auto_72591 - HOIST
      ?auto_72589 - PLACE
      ?auto_72590 - TRUCK
      ?auto_72588 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72591 ?auto_72589 ) ( SURFACE-AT ?auto_72586 ?auto_72589 ) ( CLEAR ?auto_72586 ) ( IS-CRATE ?auto_72587 ) ( not ( = ?auto_72586 ?auto_72587 ) ) ( AVAILABLE ?auto_72591 ) ( IN ?auto_72587 ?auto_72590 ) ( ON ?auto_72586 ?auto_72585 ) ( not ( = ?auto_72585 ?auto_72586 ) ) ( not ( = ?auto_72585 ?auto_72587 ) ) ( TRUCK-AT ?auto_72590 ?auto_72588 ) ( not ( = ?auto_72588 ?auto_72589 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72586 ?auto_72587 )
      ( MAKE-2CRATE-VERIFY ?auto_72585 ?auto_72586 ?auto_72587 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72592 - SURFACE
      ?auto_72593 - SURFACE
    )
    :vars
    (
      ?auto_72597 - HOIST
      ?auto_72596 - PLACE
      ?auto_72594 - SURFACE
      ?auto_72598 - TRUCK
      ?auto_72595 - PLACE
      ?auto_72599 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_72597 ?auto_72596 ) ( SURFACE-AT ?auto_72592 ?auto_72596 ) ( CLEAR ?auto_72592 ) ( IS-CRATE ?auto_72593 ) ( not ( = ?auto_72592 ?auto_72593 ) ) ( AVAILABLE ?auto_72597 ) ( ON ?auto_72592 ?auto_72594 ) ( not ( = ?auto_72594 ?auto_72592 ) ) ( not ( = ?auto_72594 ?auto_72593 ) ) ( TRUCK-AT ?auto_72598 ?auto_72595 ) ( not ( = ?auto_72595 ?auto_72596 ) ) ( HOIST-AT ?auto_72599 ?auto_72595 ) ( LIFTING ?auto_72599 ?auto_72593 ) ( not ( = ?auto_72597 ?auto_72599 ) ) )
    :subtasks
    ( ( !LOAD ?auto_72599 ?auto_72593 ?auto_72598 ?auto_72595 )
      ( MAKE-2CRATE ?auto_72594 ?auto_72592 ?auto_72593 )
      ( MAKE-1CRATE-VERIFY ?auto_72592 ?auto_72593 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72600 - SURFACE
      ?auto_72601 - SURFACE
      ?auto_72602 - SURFACE
    )
    :vars
    (
      ?auto_72607 - HOIST
      ?auto_72605 - PLACE
      ?auto_72604 - TRUCK
      ?auto_72606 - PLACE
      ?auto_72603 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_72607 ?auto_72605 ) ( SURFACE-AT ?auto_72601 ?auto_72605 ) ( CLEAR ?auto_72601 ) ( IS-CRATE ?auto_72602 ) ( not ( = ?auto_72601 ?auto_72602 ) ) ( AVAILABLE ?auto_72607 ) ( ON ?auto_72601 ?auto_72600 ) ( not ( = ?auto_72600 ?auto_72601 ) ) ( not ( = ?auto_72600 ?auto_72602 ) ) ( TRUCK-AT ?auto_72604 ?auto_72606 ) ( not ( = ?auto_72606 ?auto_72605 ) ) ( HOIST-AT ?auto_72603 ?auto_72606 ) ( LIFTING ?auto_72603 ?auto_72602 ) ( not ( = ?auto_72607 ?auto_72603 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72601 ?auto_72602 )
      ( MAKE-2CRATE-VERIFY ?auto_72600 ?auto_72601 ?auto_72602 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72608 - SURFACE
      ?auto_72609 - SURFACE
    )
    :vars
    (
      ?auto_72615 - HOIST
      ?auto_72612 - PLACE
      ?auto_72611 - SURFACE
      ?auto_72610 - TRUCK
      ?auto_72614 - PLACE
      ?auto_72613 - HOIST
      ?auto_72616 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72615 ?auto_72612 ) ( SURFACE-AT ?auto_72608 ?auto_72612 ) ( CLEAR ?auto_72608 ) ( IS-CRATE ?auto_72609 ) ( not ( = ?auto_72608 ?auto_72609 ) ) ( AVAILABLE ?auto_72615 ) ( ON ?auto_72608 ?auto_72611 ) ( not ( = ?auto_72611 ?auto_72608 ) ) ( not ( = ?auto_72611 ?auto_72609 ) ) ( TRUCK-AT ?auto_72610 ?auto_72614 ) ( not ( = ?auto_72614 ?auto_72612 ) ) ( HOIST-AT ?auto_72613 ?auto_72614 ) ( not ( = ?auto_72615 ?auto_72613 ) ) ( AVAILABLE ?auto_72613 ) ( SURFACE-AT ?auto_72609 ?auto_72614 ) ( ON ?auto_72609 ?auto_72616 ) ( CLEAR ?auto_72609 ) ( not ( = ?auto_72608 ?auto_72616 ) ) ( not ( = ?auto_72609 ?auto_72616 ) ) ( not ( = ?auto_72611 ?auto_72616 ) ) )
    :subtasks
    ( ( !LIFT ?auto_72613 ?auto_72609 ?auto_72616 ?auto_72614 )
      ( MAKE-2CRATE ?auto_72611 ?auto_72608 ?auto_72609 )
      ( MAKE-1CRATE-VERIFY ?auto_72608 ?auto_72609 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72617 - SURFACE
      ?auto_72618 - SURFACE
      ?auto_72619 - SURFACE
    )
    :vars
    (
      ?auto_72622 - HOIST
      ?auto_72624 - PLACE
      ?auto_72625 - TRUCK
      ?auto_72621 - PLACE
      ?auto_72620 - HOIST
      ?auto_72623 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72622 ?auto_72624 ) ( SURFACE-AT ?auto_72618 ?auto_72624 ) ( CLEAR ?auto_72618 ) ( IS-CRATE ?auto_72619 ) ( not ( = ?auto_72618 ?auto_72619 ) ) ( AVAILABLE ?auto_72622 ) ( ON ?auto_72618 ?auto_72617 ) ( not ( = ?auto_72617 ?auto_72618 ) ) ( not ( = ?auto_72617 ?auto_72619 ) ) ( TRUCK-AT ?auto_72625 ?auto_72621 ) ( not ( = ?auto_72621 ?auto_72624 ) ) ( HOIST-AT ?auto_72620 ?auto_72621 ) ( not ( = ?auto_72622 ?auto_72620 ) ) ( AVAILABLE ?auto_72620 ) ( SURFACE-AT ?auto_72619 ?auto_72621 ) ( ON ?auto_72619 ?auto_72623 ) ( CLEAR ?auto_72619 ) ( not ( = ?auto_72618 ?auto_72623 ) ) ( not ( = ?auto_72619 ?auto_72623 ) ) ( not ( = ?auto_72617 ?auto_72623 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72618 ?auto_72619 )
      ( MAKE-2CRATE-VERIFY ?auto_72617 ?auto_72618 ?auto_72619 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72626 - SURFACE
      ?auto_72627 - SURFACE
    )
    :vars
    (
      ?auto_72634 - HOIST
      ?auto_72628 - PLACE
      ?auto_72631 - SURFACE
      ?auto_72632 - PLACE
      ?auto_72630 - HOIST
      ?auto_72633 - SURFACE
      ?auto_72629 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72634 ?auto_72628 ) ( SURFACE-AT ?auto_72626 ?auto_72628 ) ( CLEAR ?auto_72626 ) ( IS-CRATE ?auto_72627 ) ( not ( = ?auto_72626 ?auto_72627 ) ) ( AVAILABLE ?auto_72634 ) ( ON ?auto_72626 ?auto_72631 ) ( not ( = ?auto_72631 ?auto_72626 ) ) ( not ( = ?auto_72631 ?auto_72627 ) ) ( not ( = ?auto_72632 ?auto_72628 ) ) ( HOIST-AT ?auto_72630 ?auto_72632 ) ( not ( = ?auto_72634 ?auto_72630 ) ) ( AVAILABLE ?auto_72630 ) ( SURFACE-AT ?auto_72627 ?auto_72632 ) ( ON ?auto_72627 ?auto_72633 ) ( CLEAR ?auto_72627 ) ( not ( = ?auto_72626 ?auto_72633 ) ) ( not ( = ?auto_72627 ?auto_72633 ) ) ( not ( = ?auto_72631 ?auto_72633 ) ) ( TRUCK-AT ?auto_72629 ?auto_72628 ) )
    :subtasks
    ( ( !DRIVE ?auto_72629 ?auto_72628 ?auto_72632 )
      ( MAKE-2CRATE ?auto_72631 ?auto_72626 ?auto_72627 )
      ( MAKE-1CRATE-VERIFY ?auto_72626 ?auto_72627 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72635 - SURFACE
      ?auto_72636 - SURFACE
      ?auto_72637 - SURFACE
    )
    :vars
    (
      ?auto_72643 - HOIST
      ?auto_72640 - PLACE
      ?auto_72642 - PLACE
      ?auto_72638 - HOIST
      ?auto_72641 - SURFACE
      ?auto_72639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72643 ?auto_72640 ) ( SURFACE-AT ?auto_72636 ?auto_72640 ) ( CLEAR ?auto_72636 ) ( IS-CRATE ?auto_72637 ) ( not ( = ?auto_72636 ?auto_72637 ) ) ( AVAILABLE ?auto_72643 ) ( ON ?auto_72636 ?auto_72635 ) ( not ( = ?auto_72635 ?auto_72636 ) ) ( not ( = ?auto_72635 ?auto_72637 ) ) ( not ( = ?auto_72642 ?auto_72640 ) ) ( HOIST-AT ?auto_72638 ?auto_72642 ) ( not ( = ?auto_72643 ?auto_72638 ) ) ( AVAILABLE ?auto_72638 ) ( SURFACE-AT ?auto_72637 ?auto_72642 ) ( ON ?auto_72637 ?auto_72641 ) ( CLEAR ?auto_72637 ) ( not ( = ?auto_72636 ?auto_72641 ) ) ( not ( = ?auto_72637 ?auto_72641 ) ) ( not ( = ?auto_72635 ?auto_72641 ) ) ( TRUCK-AT ?auto_72639 ?auto_72640 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72636 ?auto_72637 )
      ( MAKE-2CRATE-VERIFY ?auto_72635 ?auto_72636 ?auto_72637 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72644 - SURFACE
      ?auto_72645 - SURFACE
    )
    :vars
    (
      ?auto_72650 - HOIST
      ?auto_72652 - PLACE
      ?auto_72649 - SURFACE
      ?auto_72651 - PLACE
      ?auto_72648 - HOIST
      ?auto_72646 - SURFACE
      ?auto_72647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72650 ?auto_72652 ) ( IS-CRATE ?auto_72645 ) ( not ( = ?auto_72644 ?auto_72645 ) ) ( not ( = ?auto_72649 ?auto_72644 ) ) ( not ( = ?auto_72649 ?auto_72645 ) ) ( not ( = ?auto_72651 ?auto_72652 ) ) ( HOIST-AT ?auto_72648 ?auto_72651 ) ( not ( = ?auto_72650 ?auto_72648 ) ) ( AVAILABLE ?auto_72648 ) ( SURFACE-AT ?auto_72645 ?auto_72651 ) ( ON ?auto_72645 ?auto_72646 ) ( CLEAR ?auto_72645 ) ( not ( = ?auto_72644 ?auto_72646 ) ) ( not ( = ?auto_72645 ?auto_72646 ) ) ( not ( = ?auto_72649 ?auto_72646 ) ) ( TRUCK-AT ?auto_72647 ?auto_72652 ) ( SURFACE-AT ?auto_72649 ?auto_72652 ) ( CLEAR ?auto_72649 ) ( LIFTING ?auto_72650 ?auto_72644 ) ( IS-CRATE ?auto_72644 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72649 ?auto_72644 )
      ( MAKE-2CRATE ?auto_72649 ?auto_72644 ?auto_72645 )
      ( MAKE-1CRATE-VERIFY ?auto_72644 ?auto_72645 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72653 - SURFACE
      ?auto_72654 - SURFACE
      ?auto_72655 - SURFACE
    )
    :vars
    (
      ?auto_72660 - HOIST
      ?auto_72661 - PLACE
      ?auto_72657 - PLACE
      ?auto_72658 - HOIST
      ?auto_72656 - SURFACE
      ?auto_72659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72660 ?auto_72661 ) ( IS-CRATE ?auto_72655 ) ( not ( = ?auto_72654 ?auto_72655 ) ) ( not ( = ?auto_72653 ?auto_72654 ) ) ( not ( = ?auto_72653 ?auto_72655 ) ) ( not ( = ?auto_72657 ?auto_72661 ) ) ( HOIST-AT ?auto_72658 ?auto_72657 ) ( not ( = ?auto_72660 ?auto_72658 ) ) ( AVAILABLE ?auto_72658 ) ( SURFACE-AT ?auto_72655 ?auto_72657 ) ( ON ?auto_72655 ?auto_72656 ) ( CLEAR ?auto_72655 ) ( not ( = ?auto_72654 ?auto_72656 ) ) ( not ( = ?auto_72655 ?auto_72656 ) ) ( not ( = ?auto_72653 ?auto_72656 ) ) ( TRUCK-AT ?auto_72659 ?auto_72661 ) ( SURFACE-AT ?auto_72653 ?auto_72661 ) ( CLEAR ?auto_72653 ) ( LIFTING ?auto_72660 ?auto_72654 ) ( IS-CRATE ?auto_72654 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72654 ?auto_72655 )
      ( MAKE-2CRATE-VERIFY ?auto_72653 ?auto_72654 ?auto_72655 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72662 - SURFACE
      ?auto_72663 - SURFACE
    )
    :vars
    (
      ?auto_72666 - HOIST
      ?auto_72665 - PLACE
      ?auto_72670 - SURFACE
      ?auto_72668 - PLACE
      ?auto_72664 - HOIST
      ?auto_72669 - SURFACE
      ?auto_72667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72666 ?auto_72665 ) ( IS-CRATE ?auto_72663 ) ( not ( = ?auto_72662 ?auto_72663 ) ) ( not ( = ?auto_72670 ?auto_72662 ) ) ( not ( = ?auto_72670 ?auto_72663 ) ) ( not ( = ?auto_72668 ?auto_72665 ) ) ( HOIST-AT ?auto_72664 ?auto_72668 ) ( not ( = ?auto_72666 ?auto_72664 ) ) ( AVAILABLE ?auto_72664 ) ( SURFACE-AT ?auto_72663 ?auto_72668 ) ( ON ?auto_72663 ?auto_72669 ) ( CLEAR ?auto_72663 ) ( not ( = ?auto_72662 ?auto_72669 ) ) ( not ( = ?auto_72663 ?auto_72669 ) ) ( not ( = ?auto_72670 ?auto_72669 ) ) ( TRUCK-AT ?auto_72667 ?auto_72665 ) ( SURFACE-AT ?auto_72670 ?auto_72665 ) ( CLEAR ?auto_72670 ) ( IS-CRATE ?auto_72662 ) ( AVAILABLE ?auto_72666 ) ( IN ?auto_72662 ?auto_72667 ) )
    :subtasks
    ( ( !UNLOAD ?auto_72666 ?auto_72662 ?auto_72667 ?auto_72665 )
      ( MAKE-2CRATE ?auto_72670 ?auto_72662 ?auto_72663 )
      ( MAKE-1CRATE-VERIFY ?auto_72662 ?auto_72663 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72671 - SURFACE
      ?auto_72672 - SURFACE
      ?auto_72673 - SURFACE
    )
    :vars
    (
      ?auto_72679 - HOIST
      ?auto_72677 - PLACE
      ?auto_72676 - PLACE
      ?auto_72678 - HOIST
      ?auto_72675 - SURFACE
      ?auto_72674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72679 ?auto_72677 ) ( IS-CRATE ?auto_72673 ) ( not ( = ?auto_72672 ?auto_72673 ) ) ( not ( = ?auto_72671 ?auto_72672 ) ) ( not ( = ?auto_72671 ?auto_72673 ) ) ( not ( = ?auto_72676 ?auto_72677 ) ) ( HOIST-AT ?auto_72678 ?auto_72676 ) ( not ( = ?auto_72679 ?auto_72678 ) ) ( AVAILABLE ?auto_72678 ) ( SURFACE-AT ?auto_72673 ?auto_72676 ) ( ON ?auto_72673 ?auto_72675 ) ( CLEAR ?auto_72673 ) ( not ( = ?auto_72672 ?auto_72675 ) ) ( not ( = ?auto_72673 ?auto_72675 ) ) ( not ( = ?auto_72671 ?auto_72675 ) ) ( TRUCK-AT ?auto_72674 ?auto_72677 ) ( SURFACE-AT ?auto_72671 ?auto_72677 ) ( CLEAR ?auto_72671 ) ( IS-CRATE ?auto_72672 ) ( AVAILABLE ?auto_72679 ) ( IN ?auto_72672 ?auto_72674 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72672 ?auto_72673 )
      ( MAKE-2CRATE-VERIFY ?auto_72671 ?auto_72672 ?auto_72673 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72680 - SURFACE
      ?auto_72681 - SURFACE
    )
    :vars
    (
      ?auto_72686 - HOIST
      ?auto_72685 - PLACE
      ?auto_72687 - SURFACE
      ?auto_72683 - PLACE
      ?auto_72684 - HOIST
      ?auto_72682 - SURFACE
      ?auto_72688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72686 ?auto_72685 ) ( IS-CRATE ?auto_72681 ) ( not ( = ?auto_72680 ?auto_72681 ) ) ( not ( = ?auto_72687 ?auto_72680 ) ) ( not ( = ?auto_72687 ?auto_72681 ) ) ( not ( = ?auto_72683 ?auto_72685 ) ) ( HOIST-AT ?auto_72684 ?auto_72683 ) ( not ( = ?auto_72686 ?auto_72684 ) ) ( AVAILABLE ?auto_72684 ) ( SURFACE-AT ?auto_72681 ?auto_72683 ) ( ON ?auto_72681 ?auto_72682 ) ( CLEAR ?auto_72681 ) ( not ( = ?auto_72680 ?auto_72682 ) ) ( not ( = ?auto_72681 ?auto_72682 ) ) ( not ( = ?auto_72687 ?auto_72682 ) ) ( SURFACE-AT ?auto_72687 ?auto_72685 ) ( CLEAR ?auto_72687 ) ( IS-CRATE ?auto_72680 ) ( AVAILABLE ?auto_72686 ) ( IN ?auto_72680 ?auto_72688 ) ( TRUCK-AT ?auto_72688 ?auto_72683 ) )
    :subtasks
    ( ( !DRIVE ?auto_72688 ?auto_72683 ?auto_72685 )
      ( MAKE-2CRATE ?auto_72687 ?auto_72680 ?auto_72681 )
      ( MAKE-1CRATE-VERIFY ?auto_72680 ?auto_72681 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72689 - SURFACE
      ?auto_72690 - SURFACE
      ?auto_72691 - SURFACE
    )
    :vars
    (
      ?auto_72695 - HOIST
      ?auto_72694 - PLACE
      ?auto_72693 - PLACE
      ?auto_72697 - HOIST
      ?auto_72692 - SURFACE
      ?auto_72696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72695 ?auto_72694 ) ( IS-CRATE ?auto_72691 ) ( not ( = ?auto_72690 ?auto_72691 ) ) ( not ( = ?auto_72689 ?auto_72690 ) ) ( not ( = ?auto_72689 ?auto_72691 ) ) ( not ( = ?auto_72693 ?auto_72694 ) ) ( HOIST-AT ?auto_72697 ?auto_72693 ) ( not ( = ?auto_72695 ?auto_72697 ) ) ( AVAILABLE ?auto_72697 ) ( SURFACE-AT ?auto_72691 ?auto_72693 ) ( ON ?auto_72691 ?auto_72692 ) ( CLEAR ?auto_72691 ) ( not ( = ?auto_72690 ?auto_72692 ) ) ( not ( = ?auto_72691 ?auto_72692 ) ) ( not ( = ?auto_72689 ?auto_72692 ) ) ( SURFACE-AT ?auto_72689 ?auto_72694 ) ( CLEAR ?auto_72689 ) ( IS-CRATE ?auto_72690 ) ( AVAILABLE ?auto_72695 ) ( IN ?auto_72690 ?auto_72696 ) ( TRUCK-AT ?auto_72696 ?auto_72693 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72690 ?auto_72691 )
      ( MAKE-2CRATE-VERIFY ?auto_72689 ?auto_72690 ?auto_72691 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72698 - SURFACE
      ?auto_72699 - SURFACE
    )
    :vars
    (
      ?auto_72701 - HOIST
      ?auto_72706 - PLACE
      ?auto_72705 - SURFACE
      ?auto_72700 - PLACE
      ?auto_72702 - HOIST
      ?auto_72704 - SURFACE
      ?auto_72703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72701 ?auto_72706 ) ( IS-CRATE ?auto_72699 ) ( not ( = ?auto_72698 ?auto_72699 ) ) ( not ( = ?auto_72705 ?auto_72698 ) ) ( not ( = ?auto_72705 ?auto_72699 ) ) ( not ( = ?auto_72700 ?auto_72706 ) ) ( HOIST-AT ?auto_72702 ?auto_72700 ) ( not ( = ?auto_72701 ?auto_72702 ) ) ( SURFACE-AT ?auto_72699 ?auto_72700 ) ( ON ?auto_72699 ?auto_72704 ) ( CLEAR ?auto_72699 ) ( not ( = ?auto_72698 ?auto_72704 ) ) ( not ( = ?auto_72699 ?auto_72704 ) ) ( not ( = ?auto_72705 ?auto_72704 ) ) ( SURFACE-AT ?auto_72705 ?auto_72706 ) ( CLEAR ?auto_72705 ) ( IS-CRATE ?auto_72698 ) ( AVAILABLE ?auto_72701 ) ( TRUCK-AT ?auto_72703 ?auto_72700 ) ( LIFTING ?auto_72702 ?auto_72698 ) )
    :subtasks
    ( ( !LOAD ?auto_72702 ?auto_72698 ?auto_72703 ?auto_72700 )
      ( MAKE-2CRATE ?auto_72705 ?auto_72698 ?auto_72699 )
      ( MAKE-1CRATE-VERIFY ?auto_72698 ?auto_72699 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72707 - SURFACE
      ?auto_72708 - SURFACE
      ?auto_72709 - SURFACE
    )
    :vars
    (
      ?auto_72711 - HOIST
      ?auto_72710 - PLACE
      ?auto_72713 - PLACE
      ?auto_72715 - HOIST
      ?auto_72712 - SURFACE
      ?auto_72714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72711 ?auto_72710 ) ( IS-CRATE ?auto_72709 ) ( not ( = ?auto_72708 ?auto_72709 ) ) ( not ( = ?auto_72707 ?auto_72708 ) ) ( not ( = ?auto_72707 ?auto_72709 ) ) ( not ( = ?auto_72713 ?auto_72710 ) ) ( HOIST-AT ?auto_72715 ?auto_72713 ) ( not ( = ?auto_72711 ?auto_72715 ) ) ( SURFACE-AT ?auto_72709 ?auto_72713 ) ( ON ?auto_72709 ?auto_72712 ) ( CLEAR ?auto_72709 ) ( not ( = ?auto_72708 ?auto_72712 ) ) ( not ( = ?auto_72709 ?auto_72712 ) ) ( not ( = ?auto_72707 ?auto_72712 ) ) ( SURFACE-AT ?auto_72707 ?auto_72710 ) ( CLEAR ?auto_72707 ) ( IS-CRATE ?auto_72708 ) ( AVAILABLE ?auto_72711 ) ( TRUCK-AT ?auto_72714 ?auto_72713 ) ( LIFTING ?auto_72715 ?auto_72708 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72708 ?auto_72709 )
      ( MAKE-2CRATE-VERIFY ?auto_72707 ?auto_72708 ?auto_72709 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72716 - SURFACE
      ?auto_72717 - SURFACE
    )
    :vars
    (
      ?auto_72722 - HOIST
      ?auto_72721 - PLACE
      ?auto_72719 - SURFACE
      ?auto_72720 - PLACE
      ?auto_72723 - HOIST
      ?auto_72718 - SURFACE
      ?auto_72724 - TRUCK
      ?auto_72725 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72722 ?auto_72721 ) ( IS-CRATE ?auto_72717 ) ( not ( = ?auto_72716 ?auto_72717 ) ) ( not ( = ?auto_72719 ?auto_72716 ) ) ( not ( = ?auto_72719 ?auto_72717 ) ) ( not ( = ?auto_72720 ?auto_72721 ) ) ( HOIST-AT ?auto_72723 ?auto_72720 ) ( not ( = ?auto_72722 ?auto_72723 ) ) ( SURFACE-AT ?auto_72717 ?auto_72720 ) ( ON ?auto_72717 ?auto_72718 ) ( CLEAR ?auto_72717 ) ( not ( = ?auto_72716 ?auto_72718 ) ) ( not ( = ?auto_72717 ?auto_72718 ) ) ( not ( = ?auto_72719 ?auto_72718 ) ) ( SURFACE-AT ?auto_72719 ?auto_72721 ) ( CLEAR ?auto_72719 ) ( IS-CRATE ?auto_72716 ) ( AVAILABLE ?auto_72722 ) ( TRUCK-AT ?auto_72724 ?auto_72720 ) ( AVAILABLE ?auto_72723 ) ( SURFACE-AT ?auto_72716 ?auto_72720 ) ( ON ?auto_72716 ?auto_72725 ) ( CLEAR ?auto_72716 ) ( not ( = ?auto_72716 ?auto_72725 ) ) ( not ( = ?auto_72717 ?auto_72725 ) ) ( not ( = ?auto_72719 ?auto_72725 ) ) ( not ( = ?auto_72718 ?auto_72725 ) ) )
    :subtasks
    ( ( !LIFT ?auto_72723 ?auto_72716 ?auto_72725 ?auto_72720 )
      ( MAKE-2CRATE ?auto_72719 ?auto_72716 ?auto_72717 )
      ( MAKE-1CRATE-VERIFY ?auto_72716 ?auto_72717 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72726 - SURFACE
      ?auto_72727 - SURFACE
      ?auto_72728 - SURFACE
    )
    :vars
    (
      ?auto_72730 - HOIST
      ?auto_72733 - PLACE
      ?auto_72735 - PLACE
      ?auto_72729 - HOIST
      ?auto_72732 - SURFACE
      ?auto_72734 - TRUCK
      ?auto_72731 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72730 ?auto_72733 ) ( IS-CRATE ?auto_72728 ) ( not ( = ?auto_72727 ?auto_72728 ) ) ( not ( = ?auto_72726 ?auto_72727 ) ) ( not ( = ?auto_72726 ?auto_72728 ) ) ( not ( = ?auto_72735 ?auto_72733 ) ) ( HOIST-AT ?auto_72729 ?auto_72735 ) ( not ( = ?auto_72730 ?auto_72729 ) ) ( SURFACE-AT ?auto_72728 ?auto_72735 ) ( ON ?auto_72728 ?auto_72732 ) ( CLEAR ?auto_72728 ) ( not ( = ?auto_72727 ?auto_72732 ) ) ( not ( = ?auto_72728 ?auto_72732 ) ) ( not ( = ?auto_72726 ?auto_72732 ) ) ( SURFACE-AT ?auto_72726 ?auto_72733 ) ( CLEAR ?auto_72726 ) ( IS-CRATE ?auto_72727 ) ( AVAILABLE ?auto_72730 ) ( TRUCK-AT ?auto_72734 ?auto_72735 ) ( AVAILABLE ?auto_72729 ) ( SURFACE-AT ?auto_72727 ?auto_72735 ) ( ON ?auto_72727 ?auto_72731 ) ( CLEAR ?auto_72727 ) ( not ( = ?auto_72727 ?auto_72731 ) ) ( not ( = ?auto_72728 ?auto_72731 ) ) ( not ( = ?auto_72726 ?auto_72731 ) ) ( not ( = ?auto_72732 ?auto_72731 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72727 ?auto_72728 )
      ( MAKE-2CRATE-VERIFY ?auto_72726 ?auto_72727 ?auto_72728 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72736 - SURFACE
      ?auto_72737 - SURFACE
    )
    :vars
    (
      ?auto_72743 - HOIST
      ?auto_72739 - PLACE
      ?auto_72741 - SURFACE
      ?auto_72744 - PLACE
      ?auto_72742 - HOIST
      ?auto_72745 - SURFACE
      ?auto_72740 - SURFACE
      ?auto_72738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72743 ?auto_72739 ) ( IS-CRATE ?auto_72737 ) ( not ( = ?auto_72736 ?auto_72737 ) ) ( not ( = ?auto_72741 ?auto_72736 ) ) ( not ( = ?auto_72741 ?auto_72737 ) ) ( not ( = ?auto_72744 ?auto_72739 ) ) ( HOIST-AT ?auto_72742 ?auto_72744 ) ( not ( = ?auto_72743 ?auto_72742 ) ) ( SURFACE-AT ?auto_72737 ?auto_72744 ) ( ON ?auto_72737 ?auto_72745 ) ( CLEAR ?auto_72737 ) ( not ( = ?auto_72736 ?auto_72745 ) ) ( not ( = ?auto_72737 ?auto_72745 ) ) ( not ( = ?auto_72741 ?auto_72745 ) ) ( SURFACE-AT ?auto_72741 ?auto_72739 ) ( CLEAR ?auto_72741 ) ( IS-CRATE ?auto_72736 ) ( AVAILABLE ?auto_72743 ) ( AVAILABLE ?auto_72742 ) ( SURFACE-AT ?auto_72736 ?auto_72744 ) ( ON ?auto_72736 ?auto_72740 ) ( CLEAR ?auto_72736 ) ( not ( = ?auto_72736 ?auto_72740 ) ) ( not ( = ?auto_72737 ?auto_72740 ) ) ( not ( = ?auto_72741 ?auto_72740 ) ) ( not ( = ?auto_72745 ?auto_72740 ) ) ( TRUCK-AT ?auto_72738 ?auto_72739 ) )
    :subtasks
    ( ( !DRIVE ?auto_72738 ?auto_72739 ?auto_72744 )
      ( MAKE-2CRATE ?auto_72741 ?auto_72736 ?auto_72737 )
      ( MAKE-1CRATE-VERIFY ?auto_72736 ?auto_72737 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72746 - SURFACE
      ?auto_72747 - SURFACE
      ?auto_72748 - SURFACE
    )
    :vars
    (
      ?auto_72750 - HOIST
      ?auto_72751 - PLACE
      ?auto_72753 - PLACE
      ?auto_72749 - HOIST
      ?auto_72755 - SURFACE
      ?auto_72754 - SURFACE
      ?auto_72752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72750 ?auto_72751 ) ( IS-CRATE ?auto_72748 ) ( not ( = ?auto_72747 ?auto_72748 ) ) ( not ( = ?auto_72746 ?auto_72747 ) ) ( not ( = ?auto_72746 ?auto_72748 ) ) ( not ( = ?auto_72753 ?auto_72751 ) ) ( HOIST-AT ?auto_72749 ?auto_72753 ) ( not ( = ?auto_72750 ?auto_72749 ) ) ( SURFACE-AT ?auto_72748 ?auto_72753 ) ( ON ?auto_72748 ?auto_72755 ) ( CLEAR ?auto_72748 ) ( not ( = ?auto_72747 ?auto_72755 ) ) ( not ( = ?auto_72748 ?auto_72755 ) ) ( not ( = ?auto_72746 ?auto_72755 ) ) ( SURFACE-AT ?auto_72746 ?auto_72751 ) ( CLEAR ?auto_72746 ) ( IS-CRATE ?auto_72747 ) ( AVAILABLE ?auto_72750 ) ( AVAILABLE ?auto_72749 ) ( SURFACE-AT ?auto_72747 ?auto_72753 ) ( ON ?auto_72747 ?auto_72754 ) ( CLEAR ?auto_72747 ) ( not ( = ?auto_72747 ?auto_72754 ) ) ( not ( = ?auto_72748 ?auto_72754 ) ) ( not ( = ?auto_72746 ?auto_72754 ) ) ( not ( = ?auto_72755 ?auto_72754 ) ) ( TRUCK-AT ?auto_72752 ?auto_72751 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72747 ?auto_72748 )
      ( MAKE-2CRATE-VERIFY ?auto_72746 ?auto_72747 ?auto_72748 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72775 - SURFACE
      ?auto_72776 - SURFACE
      ?auto_72777 - SURFACE
      ?auto_72774 - SURFACE
    )
    :vars
    (
      ?auto_72779 - HOIST
      ?auto_72778 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72779 ?auto_72778 ) ( SURFACE-AT ?auto_72777 ?auto_72778 ) ( CLEAR ?auto_72777 ) ( LIFTING ?auto_72779 ?auto_72774 ) ( IS-CRATE ?auto_72774 ) ( not ( = ?auto_72777 ?auto_72774 ) ) ( ON ?auto_72776 ?auto_72775 ) ( ON ?auto_72777 ?auto_72776 ) ( not ( = ?auto_72775 ?auto_72776 ) ) ( not ( = ?auto_72775 ?auto_72777 ) ) ( not ( = ?auto_72775 ?auto_72774 ) ) ( not ( = ?auto_72776 ?auto_72777 ) ) ( not ( = ?auto_72776 ?auto_72774 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72777 ?auto_72774 )
      ( MAKE-3CRATE-VERIFY ?auto_72775 ?auto_72776 ?auto_72777 ?auto_72774 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72792 - SURFACE
      ?auto_72793 - SURFACE
      ?auto_72794 - SURFACE
      ?auto_72791 - SURFACE
    )
    :vars
    (
      ?auto_72797 - HOIST
      ?auto_72796 - PLACE
      ?auto_72795 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72797 ?auto_72796 ) ( SURFACE-AT ?auto_72794 ?auto_72796 ) ( CLEAR ?auto_72794 ) ( IS-CRATE ?auto_72791 ) ( not ( = ?auto_72794 ?auto_72791 ) ) ( TRUCK-AT ?auto_72795 ?auto_72796 ) ( AVAILABLE ?auto_72797 ) ( IN ?auto_72791 ?auto_72795 ) ( ON ?auto_72794 ?auto_72793 ) ( not ( = ?auto_72793 ?auto_72794 ) ) ( not ( = ?auto_72793 ?auto_72791 ) ) ( ON ?auto_72793 ?auto_72792 ) ( not ( = ?auto_72792 ?auto_72793 ) ) ( not ( = ?auto_72792 ?auto_72794 ) ) ( not ( = ?auto_72792 ?auto_72791 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72793 ?auto_72794 ?auto_72791 )
      ( MAKE-3CRATE-VERIFY ?auto_72792 ?auto_72793 ?auto_72794 ?auto_72791 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72813 - SURFACE
      ?auto_72814 - SURFACE
      ?auto_72815 - SURFACE
      ?auto_72812 - SURFACE
    )
    :vars
    (
      ?auto_72817 - HOIST
      ?auto_72819 - PLACE
      ?auto_72818 - TRUCK
      ?auto_72816 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72817 ?auto_72819 ) ( SURFACE-AT ?auto_72815 ?auto_72819 ) ( CLEAR ?auto_72815 ) ( IS-CRATE ?auto_72812 ) ( not ( = ?auto_72815 ?auto_72812 ) ) ( AVAILABLE ?auto_72817 ) ( IN ?auto_72812 ?auto_72818 ) ( ON ?auto_72815 ?auto_72814 ) ( not ( = ?auto_72814 ?auto_72815 ) ) ( not ( = ?auto_72814 ?auto_72812 ) ) ( TRUCK-AT ?auto_72818 ?auto_72816 ) ( not ( = ?auto_72816 ?auto_72819 ) ) ( ON ?auto_72814 ?auto_72813 ) ( not ( = ?auto_72813 ?auto_72814 ) ) ( not ( = ?auto_72813 ?auto_72815 ) ) ( not ( = ?auto_72813 ?auto_72812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72814 ?auto_72815 ?auto_72812 )
      ( MAKE-3CRATE-VERIFY ?auto_72813 ?auto_72814 ?auto_72815 ?auto_72812 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72837 - SURFACE
      ?auto_72838 - SURFACE
      ?auto_72839 - SURFACE
      ?auto_72836 - SURFACE
    )
    :vars
    (
      ?auto_72843 - HOIST
      ?auto_72841 - PLACE
      ?auto_72842 - TRUCK
      ?auto_72844 - PLACE
      ?auto_72840 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_72843 ?auto_72841 ) ( SURFACE-AT ?auto_72839 ?auto_72841 ) ( CLEAR ?auto_72839 ) ( IS-CRATE ?auto_72836 ) ( not ( = ?auto_72839 ?auto_72836 ) ) ( AVAILABLE ?auto_72843 ) ( ON ?auto_72839 ?auto_72838 ) ( not ( = ?auto_72838 ?auto_72839 ) ) ( not ( = ?auto_72838 ?auto_72836 ) ) ( TRUCK-AT ?auto_72842 ?auto_72844 ) ( not ( = ?auto_72844 ?auto_72841 ) ) ( HOIST-AT ?auto_72840 ?auto_72844 ) ( LIFTING ?auto_72840 ?auto_72836 ) ( not ( = ?auto_72843 ?auto_72840 ) ) ( ON ?auto_72838 ?auto_72837 ) ( not ( = ?auto_72837 ?auto_72838 ) ) ( not ( = ?auto_72837 ?auto_72839 ) ) ( not ( = ?auto_72837 ?auto_72836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72838 ?auto_72839 ?auto_72836 )
      ( MAKE-3CRATE-VERIFY ?auto_72837 ?auto_72838 ?auto_72839 ?auto_72836 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72864 - SURFACE
      ?auto_72865 - SURFACE
      ?auto_72866 - SURFACE
      ?auto_72863 - SURFACE
    )
    :vars
    (
      ?auto_72872 - HOIST
      ?auto_72868 - PLACE
      ?auto_72869 - TRUCK
      ?auto_72870 - PLACE
      ?auto_72871 - HOIST
      ?auto_72867 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72872 ?auto_72868 ) ( SURFACE-AT ?auto_72866 ?auto_72868 ) ( CLEAR ?auto_72866 ) ( IS-CRATE ?auto_72863 ) ( not ( = ?auto_72866 ?auto_72863 ) ) ( AVAILABLE ?auto_72872 ) ( ON ?auto_72866 ?auto_72865 ) ( not ( = ?auto_72865 ?auto_72866 ) ) ( not ( = ?auto_72865 ?auto_72863 ) ) ( TRUCK-AT ?auto_72869 ?auto_72870 ) ( not ( = ?auto_72870 ?auto_72868 ) ) ( HOIST-AT ?auto_72871 ?auto_72870 ) ( not ( = ?auto_72872 ?auto_72871 ) ) ( AVAILABLE ?auto_72871 ) ( SURFACE-AT ?auto_72863 ?auto_72870 ) ( ON ?auto_72863 ?auto_72867 ) ( CLEAR ?auto_72863 ) ( not ( = ?auto_72866 ?auto_72867 ) ) ( not ( = ?auto_72863 ?auto_72867 ) ) ( not ( = ?auto_72865 ?auto_72867 ) ) ( ON ?auto_72865 ?auto_72864 ) ( not ( = ?auto_72864 ?auto_72865 ) ) ( not ( = ?auto_72864 ?auto_72866 ) ) ( not ( = ?auto_72864 ?auto_72863 ) ) ( not ( = ?auto_72864 ?auto_72867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72865 ?auto_72866 ?auto_72863 )
      ( MAKE-3CRATE-VERIFY ?auto_72864 ?auto_72865 ?auto_72866 ?auto_72863 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72892 - SURFACE
      ?auto_72893 - SURFACE
      ?auto_72894 - SURFACE
      ?auto_72891 - SURFACE
    )
    :vars
    (
      ?auto_72896 - HOIST
      ?auto_72899 - PLACE
      ?auto_72900 - PLACE
      ?auto_72897 - HOIST
      ?auto_72898 - SURFACE
      ?auto_72895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72896 ?auto_72899 ) ( SURFACE-AT ?auto_72894 ?auto_72899 ) ( CLEAR ?auto_72894 ) ( IS-CRATE ?auto_72891 ) ( not ( = ?auto_72894 ?auto_72891 ) ) ( AVAILABLE ?auto_72896 ) ( ON ?auto_72894 ?auto_72893 ) ( not ( = ?auto_72893 ?auto_72894 ) ) ( not ( = ?auto_72893 ?auto_72891 ) ) ( not ( = ?auto_72900 ?auto_72899 ) ) ( HOIST-AT ?auto_72897 ?auto_72900 ) ( not ( = ?auto_72896 ?auto_72897 ) ) ( AVAILABLE ?auto_72897 ) ( SURFACE-AT ?auto_72891 ?auto_72900 ) ( ON ?auto_72891 ?auto_72898 ) ( CLEAR ?auto_72891 ) ( not ( = ?auto_72894 ?auto_72898 ) ) ( not ( = ?auto_72891 ?auto_72898 ) ) ( not ( = ?auto_72893 ?auto_72898 ) ) ( TRUCK-AT ?auto_72895 ?auto_72899 ) ( ON ?auto_72893 ?auto_72892 ) ( not ( = ?auto_72892 ?auto_72893 ) ) ( not ( = ?auto_72892 ?auto_72894 ) ) ( not ( = ?auto_72892 ?auto_72891 ) ) ( not ( = ?auto_72892 ?auto_72898 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72893 ?auto_72894 ?auto_72891 )
      ( MAKE-3CRATE-VERIFY ?auto_72892 ?auto_72893 ?auto_72894 ?auto_72891 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72920 - SURFACE
      ?auto_72921 - SURFACE
      ?auto_72922 - SURFACE
      ?auto_72919 - SURFACE
    )
    :vars
    (
      ?auto_72925 - HOIST
      ?auto_72927 - PLACE
      ?auto_72928 - PLACE
      ?auto_72926 - HOIST
      ?auto_72923 - SURFACE
      ?auto_72924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72925 ?auto_72927 ) ( IS-CRATE ?auto_72919 ) ( not ( = ?auto_72922 ?auto_72919 ) ) ( not ( = ?auto_72921 ?auto_72922 ) ) ( not ( = ?auto_72921 ?auto_72919 ) ) ( not ( = ?auto_72928 ?auto_72927 ) ) ( HOIST-AT ?auto_72926 ?auto_72928 ) ( not ( = ?auto_72925 ?auto_72926 ) ) ( AVAILABLE ?auto_72926 ) ( SURFACE-AT ?auto_72919 ?auto_72928 ) ( ON ?auto_72919 ?auto_72923 ) ( CLEAR ?auto_72919 ) ( not ( = ?auto_72922 ?auto_72923 ) ) ( not ( = ?auto_72919 ?auto_72923 ) ) ( not ( = ?auto_72921 ?auto_72923 ) ) ( TRUCK-AT ?auto_72924 ?auto_72927 ) ( SURFACE-AT ?auto_72921 ?auto_72927 ) ( CLEAR ?auto_72921 ) ( LIFTING ?auto_72925 ?auto_72922 ) ( IS-CRATE ?auto_72922 ) ( ON ?auto_72921 ?auto_72920 ) ( not ( = ?auto_72920 ?auto_72921 ) ) ( not ( = ?auto_72920 ?auto_72922 ) ) ( not ( = ?auto_72920 ?auto_72919 ) ) ( not ( = ?auto_72920 ?auto_72923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72921 ?auto_72922 ?auto_72919 )
      ( MAKE-3CRATE-VERIFY ?auto_72920 ?auto_72921 ?auto_72922 ?auto_72919 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72948 - SURFACE
      ?auto_72949 - SURFACE
      ?auto_72950 - SURFACE
      ?auto_72947 - SURFACE
    )
    :vars
    (
      ?auto_72954 - HOIST
      ?auto_72953 - PLACE
      ?auto_72951 - PLACE
      ?auto_72955 - HOIST
      ?auto_72956 - SURFACE
      ?auto_72952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72954 ?auto_72953 ) ( IS-CRATE ?auto_72947 ) ( not ( = ?auto_72950 ?auto_72947 ) ) ( not ( = ?auto_72949 ?auto_72950 ) ) ( not ( = ?auto_72949 ?auto_72947 ) ) ( not ( = ?auto_72951 ?auto_72953 ) ) ( HOIST-AT ?auto_72955 ?auto_72951 ) ( not ( = ?auto_72954 ?auto_72955 ) ) ( AVAILABLE ?auto_72955 ) ( SURFACE-AT ?auto_72947 ?auto_72951 ) ( ON ?auto_72947 ?auto_72956 ) ( CLEAR ?auto_72947 ) ( not ( = ?auto_72950 ?auto_72956 ) ) ( not ( = ?auto_72947 ?auto_72956 ) ) ( not ( = ?auto_72949 ?auto_72956 ) ) ( TRUCK-AT ?auto_72952 ?auto_72953 ) ( SURFACE-AT ?auto_72949 ?auto_72953 ) ( CLEAR ?auto_72949 ) ( IS-CRATE ?auto_72950 ) ( AVAILABLE ?auto_72954 ) ( IN ?auto_72950 ?auto_72952 ) ( ON ?auto_72949 ?auto_72948 ) ( not ( = ?auto_72948 ?auto_72949 ) ) ( not ( = ?auto_72948 ?auto_72950 ) ) ( not ( = ?auto_72948 ?auto_72947 ) ) ( not ( = ?auto_72948 ?auto_72956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72949 ?auto_72950 ?auto_72947 )
      ( MAKE-3CRATE-VERIFY ?auto_72948 ?auto_72949 ?auto_72950 ?auto_72947 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_73026 - SURFACE
      ?auto_73027 - SURFACE
    )
    :vars
    (
      ?auto_73029 - HOIST
      ?auto_73034 - PLACE
      ?auto_73028 - SURFACE
      ?auto_73033 - PLACE
      ?auto_73032 - HOIST
      ?auto_73030 - SURFACE
      ?auto_73031 - TRUCK
      ?auto_73035 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73029 ?auto_73034 ) ( SURFACE-AT ?auto_73026 ?auto_73034 ) ( CLEAR ?auto_73026 ) ( IS-CRATE ?auto_73027 ) ( not ( = ?auto_73026 ?auto_73027 ) ) ( AVAILABLE ?auto_73029 ) ( ON ?auto_73026 ?auto_73028 ) ( not ( = ?auto_73028 ?auto_73026 ) ) ( not ( = ?auto_73028 ?auto_73027 ) ) ( not ( = ?auto_73033 ?auto_73034 ) ) ( HOIST-AT ?auto_73032 ?auto_73033 ) ( not ( = ?auto_73029 ?auto_73032 ) ) ( AVAILABLE ?auto_73032 ) ( SURFACE-AT ?auto_73027 ?auto_73033 ) ( ON ?auto_73027 ?auto_73030 ) ( CLEAR ?auto_73027 ) ( not ( = ?auto_73026 ?auto_73030 ) ) ( not ( = ?auto_73027 ?auto_73030 ) ) ( not ( = ?auto_73028 ?auto_73030 ) ) ( TRUCK-AT ?auto_73031 ?auto_73035 ) ( not ( = ?auto_73035 ?auto_73034 ) ) ( not ( = ?auto_73033 ?auto_73035 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_73031 ?auto_73035 ?auto_73034 )
      ( MAKE-1CRATE ?auto_73026 ?auto_73027 )
      ( MAKE-1CRATE-VERIFY ?auto_73026 ?auto_73027 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_73132 - SURFACE
      ?auto_73133 - SURFACE
    )
    :vars
    (
      ?auto_73138 - HOIST
      ?auto_73134 - PLACE
      ?auto_73140 - SURFACE
      ?auto_73136 - PLACE
      ?auto_73139 - HOIST
      ?auto_73135 - SURFACE
      ?auto_73137 - TRUCK
      ?auto_73141 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73138 ?auto_73134 ) ( SURFACE-AT ?auto_73132 ?auto_73134 ) ( CLEAR ?auto_73132 ) ( IS-CRATE ?auto_73133 ) ( not ( = ?auto_73132 ?auto_73133 ) ) ( ON ?auto_73132 ?auto_73140 ) ( not ( = ?auto_73140 ?auto_73132 ) ) ( not ( = ?auto_73140 ?auto_73133 ) ) ( not ( = ?auto_73136 ?auto_73134 ) ) ( HOIST-AT ?auto_73139 ?auto_73136 ) ( not ( = ?auto_73138 ?auto_73139 ) ) ( AVAILABLE ?auto_73139 ) ( SURFACE-AT ?auto_73133 ?auto_73136 ) ( ON ?auto_73133 ?auto_73135 ) ( CLEAR ?auto_73133 ) ( not ( = ?auto_73132 ?auto_73135 ) ) ( not ( = ?auto_73133 ?auto_73135 ) ) ( not ( = ?auto_73140 ?auto_73135 ) ) ( TRUCK-AT ?auto_73137 ?auto_73134 ) ( LIFTING ?auto_73138 ?auto_73141 ) ( IS-CRATE ?auto_73141 ) ( not ( = ?auto_73132 ?auto_73141 ) ) ( not ( = ?auto_73133 ?auto_73141 ) ) ( not ( = ?auto_73140 ?auto_73141 ) ) ( not ( = ?auto_73135 ?auto_73141 ) ) )
    :subtasks
    ( ( !LOAD ?auto_73138 ?auto_73141 ?auto_73137 ?auto_73134 )
      ( MAKE-1CRATE ?auto_73132 ?auto_73133 )
      ( MAKE-1CRATE-VERIFY ?auto_73132 ?auto_73133 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73241 - SURFACE
      ?auto_73242 - SURFACE
      ?auto_73243 - SURFACE
      ?auto_73240 - SURFACE
      ?auto_73244 - SURFACE
    )
    :vars
    (
      ?auto_73246 - HOIST
      ?auto_73245 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73246 ?auto_73245 ) ( SURFACE-AT ?auto_73240 ?auto_73245 ) ( CLEAR ?auto_73240 ) ( LIFTING ?auto_73246 ?auto_73244 ) ( IS-CRATE ?auto_73244 ) ( not ( = ?auto_73240 ?auto_73244 ) ) ( ON ?auto_73242 ?auto_73241 ) ( ON ?auto_73243 ?auto_73242 ) ( ON ?auto_73240 ?auto_73243 ) ( not ( = ?auto_73241 ?auto_73242 ) ) ( not ( = ?auto_73241 ?auto_73243 ) ) ( not ( = ?auto_73241 ?auto_73240 ) ) ( not ( = ?auto_73241 ?auto_73244 ) ) ( not ( = ?auto_73242 ?auto_73243 ) ) ( not ( = ?auto_73242 ?auto_73240 ) ) ( not ( = ?auto_73242 ?auto_73244 ) ) ( not ( = ?auto_73243 ?auto_73240 ) ) ( not ( = ?auto_73243 ?auto_73244 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_73240 ?auto_73244 )
      ( MAKE-4CRATE-VERIFY ?auto_73241 ?auto_73242 ?auto_73243 ?auto_73240 ?auto_73244 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73266 - SURFACE
      ?auto_73267 - SURFACE
      ?auto_73268 - SURFACE
      ?auto_73265 - SURFACE
      ?auto_73269 - SURFACE
    )
    :vars
    (
      ?auto_73272 - HOIST
      ?auto_73271 - PLACE
      ?auto_73270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73272 ?auto_73271 ) ( SURFACE-AT ?auto_73265 ?auto_73271 ) ( CLEAR ?auto_73265 ) ( IS-CRATE ?auto_73269 ) ( not ( = ?auto_73265 ?auto_73269 ) ) ( TRUCK-AT ?auto_73270 ?auto_73271 ) ( AVAILABLE ?auto_73272 ) ( IN ?auto_73269 ?auto_73270 ) ( ON ?auto_73265 ?auto_73268 ) ( not ( = ?auto_73268 ?auto_73265 ) ) ( not ( = ?auto_73268 ?auto_73269 ) ) ( ON ?auto_73267 ?auto_73266 ) ( ON ?auto_73268 ?auto_73267 ) ( not ( = ?auto_73266 ?auto_73267 ) ) ( not ( = ?auto_73266 ?auto_73268 ) ) ( not ( = ?auto_73266 ?auto_73265 ) ) ( not ( = ?auto_73266 ?auto_73269 ) ) ( not ( = ?auto_73267 ?auto_73268 ) ) ( not ( = ?auto_73267 ?auto_73265 ) ) ( not ( = ?auto_73267 ?auto_73269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73268 ?auto_73265 ?auto_73269 )
      ( MAKE-4CRATE-VERIFY ?auto_73266 ?auto_73267 ?auto_73268 ?auto_73265 ?auto_73269 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73296 - SURFACE
      ?auto_73297 - SURFACE
      ?auto_73298 - SURFACE
      ?auto_73295 - SURFACE
      ?auto_73299 - SURFACE
    )
    :vars
    (
      ?auto_73302 - HOIST
      ?auto_73300 - PLACE
      ?auto_73303 - TRUCK
      ?auto_73301 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73302 ?auto_73300 ) ( SURFACE-AT ?auto_73295 ?auto_73300 ) ( CLEAR ?auto_73295 ) ( IS-CRATE ?auto_73299 ) ( not ( = ?auto_73295 ?auto_73299 ) ) ( AVAILABLE ?auto_73302 ) ( IN ?auto_73299 ?auto_73303 ) ( ON ?auto_73295 ?auto_73298 ) ( not ( = ?auto_73298 ?auto_73295 ) ) ( not ( = ?auto_73298 ?auto_73299 ) ) ( TRUCK-AT ?auto_73303 ?auto_73301 ) ( not ( = ?auto_73301 ?auto_73300 ) ) ( ON ?auto_73297 ?auto_73296 ) ( ON ?auto_73298 ?auto_73297 ) ( not ( = ?auto_73296 ?auto_73297 ) ) ( not ( = ?auto_73296 ?auto_73298 ) ) ( not ( = ?auto_73296 ?auto_73295 ) ) ( not ( = ?auto_73296 ?auto_73299 ) ) ( not ( = ?auto_73297 ?auto_73298 ) ) ( not ( = ?auto_73297 ?auto_73295 ) ) ( not ( = ?auto_73297 ?auto_73299 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73298 ?auto_73295 ?auto_73299 )
      ( MAKE-4CRATE-VERIFY ?auto_73296 ?auto_73297 ?auto_73298 ?auto_73295 ?auto_73299 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73330 - SURFACE
      ?auto_73331 - SURFACE
      ?auto_73332 - SURFACE
      ?auto_73329 - SURFACE
      ?auto_73333 - SURFACE
    )
    :vars
    (
      ?auto_73335 - HOIST
      ?auto_73334 - PLACE
      ?auto_73338 - TRUCK
      ?auto_73336 - PLACE
      ?auto_73337 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_73335 ?auto_73334 ) ( SURFACE-AT ?auto_73329 ?auto_73334 ) ( CLEAR ?auto_73329 ) ( IS-CRATE ?auto_73333 ) ( not ( = ?auto_73329 ?auto_73333 ) ) ( AVAILABLE ?auto_73335 ) ( ON ?auto_73329 ?auto_73332 ) ( not ( = ?auto_73332 ?auto_73329 ) ) ( not ( = ?auto_73332 ?auto_73333 ) ) ( TRUCK-AT ?auto_73338 ?auto_73336 ) ( not ( = ?auto_73336 ?auto_73334 ) ) ( HOIST-AT ?auto_73337 ?auto_73336 ) ( LIFTING ?auto_73337 ?auto_73333 ) ( not ( = ?auto_73335 ?auto_73337 ) ) ( ON ?auto_73331 ?auto_73330 ) ( ON ?auto_73332 ?auto_73331 ) ( not ( = ?auto_73330 ?auto_73331 ) ) ( not ( = ?auto_73330 ?auto_73332 ) ) ( not ( = ?auto_73330 ?auto_73329 ) ) ( not ( = ?auto_73330 ?auto_73333 ) ) ( not ( = ?auto_73331 ?auto_73332 ) ) ( not ( = ?auto_73331 ?auto_73329 ) ) ( not ( = ?auto_73331 ?auto_73333 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73332 ?auto_73329 ?auto_73333 )
      ( MAKE-4CRATE-VERIFY ?auto_73330 ?auto_73331 ?auto_73332 ?auto_73329 ?auto_73333 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73368 - SURFACE
      ?auto_73369 - SURFACE
      ?auto_73370 - SURFACE
      ?auto_73367 - SURFACE
      ?auto_73371 - SURFACE
    )
    :vars
    (
      ?auto_73373 - HOIST
      ?auto_73376 - PLACE
      ?auto_73374 - TRUCK
      ?auto_73375 - PLACE
      ?auto_73377 - HOIST
      ?auto_73372 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73373 ?auto_73376 ) ( SURFACE-AT ?auto_73367 ?auto_73376 ) ( CLEAR ?auto_73367 ) ( IS-CRATE ?auto_73371 ) ( not ( = ?auto_73367 ?auto_73371 ) ) ( AVAILABLE ?auto_73373 ) ( ON ?auto_73367 ?auto_73370 ) ( not ( = ?auto_73370 ?auto_73367 ) ) ( not ( = ?auto_73370 ?auto_73371 ) ) ( TRUCK-AT ?auto_73374 ?auto_73375 ) ( not ( = ?auto_73375 ?auto_73376 ) ) ( HOIST-AT ?auto_73377 ?auto_73375 ) ( not ( = ?auto_73373 ?auto_73377 ) ) ( AVAILABLE ?auto_73377 ) ( SURFACE-AT ?auto_73371 ?auto_73375 ) ( ON ?auto_73371 ?auto_73372 ) ( CLEAR ?auto_73371 ) ( not ( = ?auto_73367 ?auto_73372 ) ) ( not ( = ?auto_73371 ?auto_73372 ) ) ( not ( = ?auto_73370 ?auto_73372 ) ) ( ON ?auto_73369 ?auto_73368 ) ( ON ?auto_73370 ?auto_73369 ) ( not ( = ?auto_73368 ?auto_73369 ) ) ( not ( = ?auto_73368 ?auto_73370 ) ) ( not ( = ?auto_73368 ?auto_73367 ) ) ( not ( = ?auto_73368 ?auto_73371 ) ) ( not ( = ?auto_73368 ?auto_73372 ) ) ( not ( = ?auto_73369 ?auto_73370 ) ) ( not ( = ?auto_73369 ?auto_73367 ) ) ( not ( = ?auto_73369 ?auto_73371 ) ) ( not ( = ?auto_73369 ?auto_73372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73370 ?auto_73367 ?auto_73371 )
      ( MAKE-4CRATE-VERIFY ?auto_73368 ?auto_73369 ?auto_73370 ?auto_73367 ?auto_73371 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73407 - SURFACE
      ?auto_73408 - SURFACE
      ?auto_73409 - SURFACE
      ?auto_73406 - SURFACE
      ?auto_73410 - SURFACE
    )
    :vars
    (
      ?auto_73415 - HOIST
      ?auto_73413 - PLACE
      ?auto_73414 - PLACE
      ?auto_73412 - HOIST
      ?auto_73411 - SURFACE
      ?auto_73416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73415 ?auto_73413 ) ( SURFACE-AT ?auto_73406 ?auto_73413 ) ( CLEAR ?auto_73406 ) ( IS-CRATE ?auto_73410 ) ( not ( = ?auto_73406 ?auto_73410 ) ) ( AVAILABLE ?auto_73415 ) ( ON ?auto_73406 ?auto_73409 ) ( not ( = ?auto_73409 ?auto_73406 ) ) ( not ( = ?auto_73409 ?auto_73410 ) ) ( not ( = ?auto_73414 ?auto_73413 ) ) ( HOIST-AT ?auto_73412 ?auto_73414 ) ( not ( = ?auto_73415 ?auto_73412 ) ) ( AVAILABLE ?auto_73412 ) ( SURFACE-AT ?auto_73410 ?auto_73414 ) ( ON ?auto_73410 ?auto_73411 ) ( CLEAR ?auto_73410 ) ( not ( = ?auto_73406 ?auto_73411 ) ) ( not ( = ?auto_73410 ?auto_73411 ) ) ( not ( = ?auto_73409 ?auto_73411 ) ) ( TRUCK-AT ?auto_73416 ?auto_73413 ) ( ON ?auto_73408 ?auto_73407 ) ( ON ?auto_73409 ?auto_73408 ) ( not ( = ?auto_73407 ?auto_73408 ) ) ( not ( = ?auto_73407 ?auto_73409 ) ) ( not ( = ?auto_73407 ?auto_73406 ) ) ( not ( = ?auto_73407 ?auto_73410 ) ) ( not ( = ?auto_73407 ?auto_73411 ) ) ( not ( = ?auto_73408 ?auto_73409 ) ) ( not ( = ?auto_73408 ?auto_73406 ) ) ( not ( = ?auto_73408 ?auto_73410 ) ) ( not ( = ?auto_73408 ?auto_73411 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73409 ?auto_73406 ?auto_73410 )
      ( MAKE-4CRATE-VERIFY ?auto_73407 ?auto_73408 ?auto_73409 ?auto_73406 ?auto_73410 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73446 - SURFACE
      ?auto_73447 - SURFACE
      ?auto_73448 - SURFACE
      ?auto_73445 - SURFACE
      ?auto_73449 - SURFACE
    )
    :vars
    (
      ?auto_73453 - HOIST
      ?auto_73452 - PLACE
      ?auto_73455 - PLACE
      ?auto_73454 - HOIST
      ?auto_73451 - SURFACE
      ?auto_73450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73453 ?auto_73452 ) ( IS-CRATE ?auto_73449 ) ( not ( = ?auto_73445 ?auto_73449 ) ) ( not ( = ?auto_73448 ?auto_73445 ) ) ( not ( = ?auto_73448 ?auto_73449 ) ) ( not ( = ?auto_73455 ?auto_73452 ) ) ( HOIST-AT ?auto_73454 ?auto_73455 ) ( not ( = ?auto_73453 ?auto_73454 ) ) ( AVAILABLE ?auto_73454 ) ( SURFACE-AT ?auto_73449 ?auto_73455 ) ( ON ?auto_73449 ?auto_73451 ) ( CLEAR ?auto_73449 ) ( not ( = ?auto_73445 ?auto_73451 ) ) ( not ( = ?auto_73449 ?auto_73451 ) ) ( not ( = ?auto_73448 ?auto_73451 ) ) ( TRUCK-AT ?auto_73450 ?auto_73452 ) ( SURFACE-AT ?auto_73448 ?auto_73452 ) ( CLEAR ?auto_73448 ) ( LIFTING ?auto_73453 ?auto_73445 ) ( IS-CRATE ?auto_73445 ) ( ON ?auto_73447 ?auto_73446 ) ( ON ?auto_73448 ?auto_73447 ) ( not ( = ?auto_73446 ?auto_73447 ) ) ( not ( = ?auto_73446 ?auto_73448 ) ) ( not ( = ?auto_73446 ?auto_73445 ) ) ( not ( = ?auto_73446 ?auto_73449 ) ) ( not ( = ?auto_73446 ?auto_73451 ) ) ( not ( = ?auto_73447 ?auto_73448 ) ) ( not ( = ?auto_73447 ?auto_73445 ) ) ( not ( = ?auto_73447 ?auto_73449 ) ) ( not ( = ?auto_73447 ?auto_73451 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73448 ?auto_73445 ?auto_73449 )
      ( MAKE-4CRATE-VERIFY ?auto_73446 ?auto_73447 ?auto_73448 ?auto_73445 ?auto_73449 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73485 - SURFACE
      ?auto_73486 - SURFACE
      ?auto_73487 - SURFACE
      ?auto_73484 - SURFACE
      ?auto_73488 - SURFACE
    )
    :vars
    (
      ?auto_73494 - HOIST
      ?auto_73490 - PLACE
      ?auto_73493 - PLACE
      ?auto_73489 - HOIST
      ?auto_73492 - SURFACE
      ?auto_73491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73494 ?auto_73490 ) ( IS-CRATE ?auto_73488 ) ( not ( = ?auto_73484 ?auto_73488 ) ) ( not ( = ?auto_73487 ?auto_73484 ) ) ( not ( = ?auto_73487 ?auto_73488 ) ) ( not ( = ?auto_73493 ?auto_73490 ) ) ( HOIST-AT ?auto_73489 ?auto_73493 ) ( not ( = ?auto_73494 ?auto_73489 ) ) ( AVAILABLE ?auto_73489 ) ( SURFACE-AT ?auto_73488 ?auto_73493 ) ( ON ?auto_73488 ?auto_73492 ) ( CLEAR ?auto_73488 ) ( not ( = ?auto_73484 ?auto_73492 ) ) ( not ( = ?auto_73488 ?auto_73492 ) ) ( not ( = ?auto_73487 ?auto_73492 ) ) ( TRUCK-AT ?auto_73491 ?auto_73490 ) ( SURFACE-AT ?auto_73487 ?auto_73490 ) ( CLEAR ?auto_73487 ) ( IS-CRATE ?auto_73484 ) ( AVAILABLE ?auto_73494 ) ( IN ?auto_73484 ?auto_73491 ) ( ON ?auto_73486 ?auto_73485 ) ( ON ?auto_73487 ?auto_73486 ) ( not ( = ?auto_73485 ?auto_73486 ) ) ( not ( = ?auto_73485 ?auto_73487 ) ) ( not ( = ?auto_73485 ?auto_73484 ) ) ( not ( = ?auto_73485 ?auto_73488 ) ) ( not ( = ?auto_73485 ?auto_73492 ) ) ( not ( = ?auto_73486 ?auto_73487 ) ) ( not ( = ?auto_73486 ?auto_73484 ) ) ( not ( = ?auto_73486 ?auto_73488 ) ) ( not ( = ?auto_73486 ?auto_73492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73487 ?auto_73484 ?auto_73488 )
      ( MAKE-4CRATE-VERIFY ?auto_73485 ?auto_73486 ?auto_73487 ?auto_73484 ?auto_73488 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_73514 - SURFACE
      ?auto_73515 - SURFACE
      ?auto_73516 - SURFACE
      ?auto_73513 - SURFACE
    )
    :vars
    (
      ?auto_73518 - HOIST
      ?auto_73521 - PLACE
      ?auto_73520 - PLACE
      ?auto_73522 - HOIST
      ?auto_73519 - SURFACE
      ?auto_73517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73518 ?auto_73521 ) ( IS-CRATE ?auto_73513 ) ( not ( = ?auto_73516 ?auto_73513 ) ) ( not ( = ?auto_73515 ?auto_73516 ) ) ( not ( = ?auto_73515 ?auto_73513 ) ) ( not ( = ?auto_73520 ?auto_73521 ) ) ( HOIST-AT ?auto_73522 ?auto_73520 ) ( not ( = ?auto_73518 ?auto_73522 ) ) ( AVAILABLE ?auto_73522 ) ( SURFACE-AT ?auto_73513 ?auto_73520 ) ( ON ?auto_73513 ?auto_73519 ) ( CLEAR ?auto_73513 ) ( not ( = ?auto_73516 ?auto_73519 ) ) ( not ( = ?auto_73513 ?auto_73519 ) ) ( not ( = ?auto_73515 ?auto_73519 ) ) ( SURFACE-AT ?auto_73515 ?auto_73521 ) ( CLEAR ?auto_73515 ) ( IS-CRATE ?auto_73516 ) ( AVAILABLE ?auto_73518 ) ( IN ?auto_73516 ?auto_73517 ) ( TRUCK-AT ?auto_73517 ?auto_73520 ) ( ON ?auto_73515 ?auto_73514 ) ( not ( = ?auto_73514 ?auto_73515 ) ) ( not ( = ?auto_73514 ?auto_73516 ) ) ( not ( = ?auto_73514 ?auto_73513 ) ) ( not ( = ?auto_73514 ?auto_73519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73515 ?auto_73516 ?auto_73513 )
      ( MAKE-3CRATE-VERIFY ?auto_73514 ?auto_73515 ?auto_73516 ?auto_73513 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73524 - SURFACE
      ?auto_73525 - SURFACE
      ?auto_73526 - SURFACE
      ?auto_73523 - SURFACE
      ?auto_73527 - SURFACE
    )
    :vars
    (
      ?auto_73529 - HOIST
      ?auto_73532 - PLACE
      ?auto_73531 - PLACE
      ?auto_73533 - HOIST
      ?auto_73530 - SURFACE
      ?auto_73528 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73529 ?auto_73532 ) ( IS-CRATE ?auto_73527 ) ( not ( = ?auto_73523 ?auto_73527 ) ) ( not ( = ?auto_73526 ?auto_73523 ) ) ( not ( = ?auto_73526 ?auto_73527 ) ) ( not ( = ?auto_73531 ?auto_73532 ) ) ( HOIST-AT ?auto_73533 ?auto_73531 ) ( not ( = ?auto_73529 ?auto_73533 ) ) ( AVAILABLE ?auto_73533 ) ( SURFACE-AT ?auto_73527 ?auto_73531 ) ( ON ?auto_73527 ?auto_73530 ) ( CLEAR ?auto_73527 ) ( not ( = ?auto_73523 ?auto_73530 ) ) ( not ( = ?auto_73527 ?auto_73530 ) ) ( not ( = ?auto_73526 ?auto_73530 ) ) ( SURFACE-AT ?auto_73526 ?auto_73532 ) ( CLEAR ?auto_73526 ) ( IS-CRATE ?auto_73523 ) ( AVAILABLE ?auto_73529 ) ( IN ?auto_73523 ?auto_73528 ) ( TRUCK-AT ?auto_73528 ?auto_73531 ) ( ON ?auto_73525 ?auto_73524 ) ( ON ?auto_73526 ?auto_73525 ) ( not ( = ?auto_73524 ?auto_73525 ) ) ( not ( = ?auto_73524 ?auto_73526 ) ) ( not ( = ?auto_73524 ?auto_73523 ) ) ( not ( = ?auto_73524 ?auto_73527 ) ) ( not ( = ?auto_73524 ?auto_73530 ) ) ( not ( = ?auto_73525 ?auto_73526 ) ) ( not ( = ?auto_73525 ?auto_73523 ) ) ( not ( = ?auto_73525 ?auto_73527 ) ) ( not ( = ?auto_73525 ?auto_73530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73526 ?auto_73523 ?auto_73527 )
      ( MAKE-4CRATE-VERIFY ?auto_73524 ?auto_73525 ?auto_73526 ?auto_73523 ?auto_73527 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_73553 - SURFACE
      ?auto_73554 - SURFACE
      ?auto_73555 - SURFACE
      ?auto_73552 - SURFACE
    )
    :vars
    (
      ?auto_73558 - HOIST
      ?auto_73557 - PLACE
      ?auto_73559 - PLACE
      ?auto_73560 - HOIST
      ?auto_73556 - SURFACE
      ?auto_73561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73558 ?auto_73557 ) ( IS-CRATE ?auto_73552 ) ( not ( = ?auto_73555 ?auto_73552 ) ) ( not ( = ?auto_73554 ?auto_73555 ) ) ( not ( = ?auto_73554 ?auto_73552 ) ) ( not ( = ?auto_73559 ?auto_73557 ) ) ( HOIST-AT ?auto_73560 ?auto_73559 ) ( not ( = ?auto_73558 ?auto_73560 ) ) ( SURFACE-AT ?auto_73552 ?auto_73559 ) ( ON ?auto_73552 ?auto_73556 ) ( CLEAR ?auto_73552 ) ( not ( = ?auto_73555 ?auto_73556 ) ) ( not ( = ?auto_73552 ?auto_73556 ) ) ( not ( = ?auto_73554 ?auto_73556 ) ) ( SURFACE-AT ?auto_73554 ?auto_73557 ) ( CLEAR ?auto_73554 ) ( IS-CRATE ?auto_73555 ) ( AVAILABLE ?auto_73558 ) ( TRUCK-AT ?auto_73561 ?auto_73559 ) ( LIFTING ?auto_73560 ?auto_73555 ) ( ON ?auto_73554 ?auto_73553 ) ( not ( = ?auto_73553 ?auto_73554 ) ) ( not ( = ?auto_73553 ?auto_73555 ) ) ( not ( = ?auto_73553 ?auto_73552 ) ) ( not ( = ?auto_73553 ?auto_73556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73554 ?auto_73555 ?auto_73552 )
      ( MAKE-3CRATE-VERIFY ?auto_73553 ?auto_73554 ?auto_73555 ?auto_73552 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73563 - SURFACE
      ?auto_73564 - SURFACE
      ?auto_73565 - SURFACE
      ?auto_73562 - SURFACE
      ?auto_73566 - SURFACE
    )
    :vars
    (
      ?auto_73569 - HOIST
      ?auto_73568 - PLACE
      ?auto_73570 - PLACE
      ?auto_73571 - HOIST
      ?auto_73567 - SURFACE
      ?auto_73572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73569 ?auto_73568 ) ( IS-CRATE ?auto_73566 ) ( not ( = ?auto_73562 ?auto_73566 ) ) ( not ( = ?auto_73565 ?auto_73562 ) ) ( not ( = ?auto_73565 ?auto_73566 ) ) ( not ( = ?auto_73570 ?auto_73568 ) ) ( HOIST-AT ?auto_73571 ?auto_73570 ) ( not ( = ?auto_73569 ?auto_73571 ) ) ( SURFACE-AT ?auto_73566 ?auto_73570 ) ( ON ?auto_73566 ?auto_73567 ) ( CLEAR ?auto_73566 ) ( not ( = ?auto_73562 ?auto_73567 ) ) ( not ( = ?auto_73566 ?auto_73567 ) ) ( not ( = ?auto_73565 ?auto_73567 ) ) ( SURFACE-AT ?auto_73565 ?auto_73568 ) ( CLEAR ?auto_73565 ) ( IS-CRATE ?auto_73562 ) ( AVAILABLE ?auto_73569 ) ( TRUCK-AT ?auto_73572 ?auto_73570 ) ( LIFTING ?auto_73571 ?auto_73562 ) ( ON ?auto_73564 ?auto_73563 ) ( ON ?auto_73565 ?auto_73564 ) ( not ( = ?auto_73563 ?auto_73564 ) ) ( not ( = ?auto_73563 ?auto_73565 ) ) ( not ( = ?auto_73563 ?auto_73562 ) ) ( not ( = ?auto_73563 ?auto_73566 ) ) ( not ( = ?auto_73563 ?auto_73567 ) ) ( not ( = ?auto_73564 ?auto_73565 ) ) ( not ( = ?auto_73564 ?auto_73562 ) ) ( not ( = ?auto_73564 ?auto_73566 ) ) ( not ( = ?auto_73564 ?auto_73567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73565 ?auto_73562 ?auto_73566 )
      ( MAKE-4CRATE-VERIFY ?auto_73563 ?auto_73564 ?auto_73565 ?auto_73562 ?auto_73566 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_73594 - SURFACE
      ?auto_73595 - SURFACE
      ?auto_73596 - SURFACE
      ?auto_73593 - SURFACE
    )
    :vars
    (
      ?auto_73602 - HOIST
      ?auto_73600 - PLACE
      ?auto_73599 - PLACE
      ?auto_73598 - HOIST
      ?auto_73597 - SURFACE
      ?auto_73603 - TRUCK
      ?auto_73601 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73602 ?auto_73600 ) ( IS-CRATE ?auto_73593 ) ( not ( = ?auto_73596 ?auto_73593 ) ) ( not ( = ?auto_73595 ?auto_73596 ) ) ( not ( = ?auto_73595 ?auto_73593 ) ) ( not ( = ?auto_73599 ?auto_73600 ) ) ( HOIST-AT ?auto_73598 ?auto_73599 ) ( not ( = ?auto_73602 ?auto_73598 ) ) ( SURFACE-AT ?auto_73593 ?auto_73599 ) ( ON ?auto_73593 ?auto_73597 ) ( CLEAR ?auto_73593 ) ( not ( = ?auto_73596 ?auto_73597 ) ) ( not ( = ?auto_73593 ?auto_73597 ) ) ( not ( = ?auto_73595 ?auto_73597 ) ) ( SURFACE-AT ?auto_73595 ?auto_73600 ) ( CLEAR ?auto_73595 ) ( IS-CRATE ?auto_73596 ) ( AVAILABLE ?auto_73602 ) ( TRUCK-AT ?auto_73603 ?auto_73599 ) ( AVAILABLE ?auto_73598 ) ( SURFACE-AT ?auto_73596 ?auto_73599 ) ( ON ?auto_73596 ?auto_73601 ) ( CLEAR ?auto_73596 ) ( not ( = ?auto_73596 ?auto_73601 ) ) ( not ( = ?auto_73593 ?auto_73601 ) ) ( not ( = ?auto_73595 ?auto_73601 ) ) ( not ( = ?auto_73597 ?auto_73601 ) ) ( ON ?auto_73595 ?auto_73594 ) ( not ( = ?auto_73594 ?auto_73595 ) ) ( not ( = ?auto_73594 ?auto_73596 ) ) ( not ( = ?auto_73594 ?auto_73593 ) ) ( not ( = ?auto_73594 ?auto_73597 ) ) ( not ( = ?auto_73594 ?auto_73601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73595 ?auto_73596 ?auto_73593 )
      ( MAKE-3CRATE-VERIFY ?auto_73594 ?auto_73595 ?auto_73596 ?auto_73593 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73605 - SURFACE
      ?auto_73606 - SURFACE
      ?auto_73607 - SURFACE
      ?auto_73604 - SURFACE
      ?auto_73608 - SURFACE
    )
    :vars
    (
      ?auto_73614 - HOIST
      ?auto_73612 - PLACE
      ?auto_73611 - PLACE
      ?auto_73610 - HOIST
      ?auto_73609 - SURFACE
      ?auto_73615 - TRUCK
      ?auto_73613 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73614 ?auto_73612 ) ( IS-CRATE ?auto_73608 ) ( not ( = ?auto_73604 ?auto_73608 ) ) ( not ( = ?auto_73607 ?auto_73604 ) ) ( not ( = ?auto_73607 ?auto_73608 ) ) ( not ( = ?auto_73611 ?auto_73612 ) ) ( HOIST-AT ?auto_73610 ?auto_73611 ) ( not ( = ?auto_73614 ?auto_73610 ) ) ( SURFACE-AT ?auto_73608 ?auto_73611 ) ( ON ?auto_73608 ?auto_73609 ) ( CLEAR ?auto_73608 ) ( not ( = ?auto_73604 ?auto_73609 ) ) ( not ( = ?auto_73608 ?auto_73609 ) ) ( not ( = ?auto_73607 ?auto_73609 ) ) ( SURFACE-AT ?auto_73607 ?auto_73612 ) ( CLEAR ?auto_73607 ) ( IS-CRATE ?auto_73604 ) ( AVAILABLE ?auto_73614 ) ( TRUCK-AT ?auto_73615 ?auto_73611 ) ( AVAILABLE ?auto_73610 ) ( SURFACE-AT ?auto_73604 ?auto_73611 ) ( ON ?auto_73604 ?auto_73613 ) ( CLEAR ?auto_73604 ) ( not ( = ?auto_73604 ?auto_73613 ) ) ( not ( = ?auto_73608 ?auto_73613 ) ) ( not ( = ?auto_73607 ?auto_73613 ) ) ( not ( = ?auto_73609 ?auto_73613 ) ) ( ON ?auto_73606 ?auto_73605 ) ( ON ?auto_73607 ?auto_73606 ) ( not ( = ?auto_73605 ?auto_73606 ) ) ( not ( = ?auto_73605 ?auto_73607 ) ) ( not ( = ?auto_73605 ?auto_73604 ) ) ( not ( = ?auto_73605 ?auto_73608 ) ) ( not ( = ?auto_73605 ?auto_73609 ) ) ( not ( = ?auto_73605 ?auto_73613 ) ) ( not ( = ?auto_73606 ?auto_73607 ) ) ( not ( = ?auto_73606 ?auto_73604 ) ) ( not ( = ?auto_73606 ?auto_73608 ) ) ( not ( = ?auto_73606 ?auto_73609 ) ) ( not ( = ?auto_73606 ?auto_73613 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73607 ?auto_73604 ?auto_73608 )
      ( MAKE-4CRATE-VERIFY ?auto_73605 ?auto_73606 ?auto_73607 ?auto_73604 ?auto_73608 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_73637 - SURFACE
      ?auto_73638 - SURFACE
      ?auto_73639 - SURFACE
      ?auto_73636 - SURFACE
    )
    :vars
    (
      ?auto_73645 - HOIST
      ?auto_73642 - PLACE
      ?auto_73641 - PLACE
      ?auto_73646 - HOIST
      ?auto_73640 - SURFACE
      ?auto_73643 - SURFACE
      ?auto_73644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73645 ?auto_73642 ) ( IS-CRATE ?auto_73636 ) ( not ( = ?auto_73639 ?auto_73636 ) ) ( not ( = ?auto_73638 ?auto_73639 ) ) ( not ( = ?auto_73638 ?auto_73636 ) ) ( not ( = ?auto_73641 ?auto_73642 ) ) ( HOIST-AT ?auto_73646 ?auto_73641 ) ( not ( = ?auto_73645 ?auto_73646 ) ) ( SURFACE-AT ?auto_73636 ?auto_73641 ) ( ON ?auto_73636 ?auto_73640 ) ( CLEAR ?auto_73636 ) ( not ( = ?auto_73639 ?auto_73640 ) ) ( not ( = ?auto_73636 ?auto_73640 ) ) ( not ( = ?auto_73638 ?auto_73640 ) ) ( SURFACE-AT ?auto_73638 ?auto_73642 ) ( CLEAR ?auto_73638 ) ( IS-CRATE ?auto_73639 ) ( AVAILABLE ?auto_73645 ) ( AVAILABLE ?auto_73646 ) ( SURFACE-AT ?auto_73639 ?auto_73641 ) ( ON ?auto_73639 ?auto_73643 ) ( CLEAR ?auto_73639 ) ( not ( = ?auto_73639 ?auto_73643 ) ) ( not ( = ?auto_73636 ?auto_73643 ) ) ( not ( = ?auto_73638 ?auto_73643 ) ) ( not ( = ?auto_73640 ?auto_73643 ) ) ( TRUCK-AT ?auto_73644 ?auto_73642 ) ( ON ?auto_73638 ?auto_73637 ) ( not ( = ?auto_73637 ?auto_73638 ) ) ( not ( = ?auto_73637 ?auto_73639 ) ) ( not ( = ?auto_73637 ?auto_73636 ) ) ( not ( = ?auto_73637 ?auto_73640 ) ) ( not ( = ?auto_73637 ?auto_73643 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73638 ?auto_73639 ?auto_73636 )
      ( MAKE-3CRATE-VERIFY ?auto_73637 ?auto_73638 ?auto_73639 ?auto_73636 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73648 - SURFACE
      ?auto_73649 - SURFACE
      ?auto_73650 - SURFACE
      ?auto_73647 - SURFACE
      ?auto_73651 - SURFACE
    )
    :vars
    (
      ?auto_73657 - HOIST
      ?auto_73654 - PLACE
      ?auto_73653 - PLACE
      ?auto_73658 - HOIST
      ?auto_73652 - SURFACE
      ?auto_73655 - SURFACE
      ?auto_73656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73657 ?auto_73654 ) ( IS-CRATE ?auto_73651 ) ( not ( = ?auto_73647 ?auto_73651 ) ) ( not ( = ?auto_73650 ?auto_73647 ) ) ( not ( = ?auto_73650 ?auto_73651 ) ) ( not ( = ?auto_73653 ?auto_73654 ) ) ( HOIST-AT ?auto_73658 ?auto_73653 ) ( not ( = ?auto_73657 ?auto_73658 ) ) ( SURFACE-AT ?auto_73651 ?auto_73653 ) ( ON ?auto_73651 ?auto_73652 ) ( CLEAR ?auto_73651 ) ( not ( = ?auto_73647 ?auto_73652 ) ) ( not ( = ?auto_73651 ?auto_73652 ) ) ( not ( = ?auto_73650 ?auto_73652 ) ) ( SURFACE-AT ?auto_73650 ?auto_73654 ) ( CLEAR ?auto_73650 ) ( IS-CRATE ?auto_73647 ) ( AVAILABLE ?auto_73657 ) ( AVAILABLE ?auto_73658 ) ( SURFACE-AT ?auto_73647 ?auto_73653 ) ( ON ?auto_73647 ?auto_73655 ) ( CLEAR ?auto_73647 ) ( not ( = ?auto_73647 ?auto_73655 ) ) ( not ( = ?auto_73651 ?auto_73655 ) ) ( not ( = ?auto_73650 ?auto_73655 ) ) ( not ( = ?auto_73652 ?auto_73655 ) ) ( TRUCK-AT ?auto_73656 ?auto_73654 ) ( ON ?auto_73649 ?auto_73648 ) ( ON ?auto_73650 ?auto_73649 ) ( not ( = ?auto_73648 ?auto_73649 ) ) ( not ( = ?auto_73648 ?auto_73650 ) ) ( not ( = ?auto_73648 ?auto_73647 ) ) ( not ( = ?auto_73648 ?auto_73651 ) ) ( not ( = ?auto_73648 ?auto_73652 ) ) ( not ( = ?auto_73648 ?auto_73655 ) ) ( not ( = ?auto_73649 ?auto_73650 ) ) ( not ( = ?auto_73649 ?auto_73647 ) ) ( not ( = ?auto_73649 ?auto_73651 ) ) ( not ( = ?auto_73649 ?auto_73652 ) ) ( not ( = ?auto_73649 ?auto_73655 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73650 ?auto_73647 ?auto_73651 )
      ( MAKE-4CRATE-VERIFY ?auto_73648 ?auto_73649 ?auto_73650 ?auto_73647 ?auto_73651 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_73659 - SURFACE
      ?auto_73660 - SURFACE
    )
    :vars
    (
      ?auto_73667 - HOIST
      ?auto_73663 - PLACE
      ?auto_73665 - SURFACE
      ?auto_73662 - PLACE
      ?auto_73668 - HOIST
      ?auto_73661 - SURFACE
      ?auto_73664 - SURFACE
      ?auto_73666 - TRUCK
      ?auto_73669 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73667 ?auto_73663 ) ( IS-CRATE ?auto_73660 ) ( not ( = ?auto_73659 ?auto_73660 ) ) ( not ( = ?auto_73665 ?auto_73659 ) ) ( not ( = ?auto_73665 ?auto_73660 ) ) ( not ( = ?auto_73662 ?auto_73663 ) ) ( HOIST-AT ?auto_73668 ?auto_73662 ) ( not ( = ?auto_73667 ?auto_73668 ) ) ( SURFACE-AT ?auto_73660 ?auto_73662 ) ( ON ?auto_73660 ?auto_73661 ) ( CLEAR ?auto_73660 ) ( not ( = ?auto_73659 ?auto_73661 ) ) ( not ( = ?auto_73660 ?auto_73661 ) ) ( not ( = ?auto_73665 ?auto_73661 ) ) ( IS-CRATE ?auto_73659 ) ( AVAILABLE ?auto_73668 ) ( SURFACE-AT ?auto_73659 ?auto_73662 ) ( ON ?auto_73659 ?auto_73664 ) ( CLEAR ?auto_73659 ) ( not ( = ?auto_73659 ?auto_73664 ) ) ( not ( = ?auto_73660 ?auto_73664 ) ) ( not ( = ?auto_73665 ?auto_73664 ) ) ( not ( = ?auto_73661 ?auto_73664 ) ) ( TRUCK-AT ?auto_73666 ?auto_73663 ) ( SURFACE-AT ?auto_73669 ?auto_73663 ) ( CLEAR ?auto_73669 ) ( LIFTING ?auto_73667 ?auto_73665 ) ( IS-CRATE ?auto_73665 ) ( not ( = ?auto_73669 ?auto_73665 ) ) ( not ( = ?auto_73659 ?auto_73669 ) ) ( not ( = ?auto_73660 ?auto_73669 ) ) ( not ( = ?auto_73661 ?auto_73669 ) ) ( not ( = ?auto_73664 ?auto_73669 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_73669 ?auto_73665 )
      ( MAKE-2CRATE ?auto_73665 ?auto_73659 ?auto_73660 )
      ( MAKE-1CRATE-VERIFY ?auto_73659 ?auto_73660 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_73670 - SURFACE
      ?auto_73671 - SURFACE
      ?auto_73672 - SURFACE
    )
    :vars
    (
      ?auto_73680 - HOIST
      ?auto_73676 - PLACE
      ?auto_73675 - PLACE
      ?auto_73674 - HOIST
      ?auto_73678 - SURFACE
      ?auto_73677 - SURFACE
      ?auto_73679 - TRUCK
      ?auto_73673 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73680 ?auto_73676 ) ( IS-CRATE ?auto_73672 ) ( not ( = ?auto_73671 ?auto_73672 ) ) ( not ( = ?auto_73670 ?auto_73671 ) ) ( not ( = ?auto_73670 ?auto_73672 ) ) ( not ( = ?auto_73675 ?auto_73676 ) ) ( HOIST-AT ?auto_73674 ?auto_73675 ) ( not ( = ?auto_73680 ?auto_73674 ) ) ( SURFACE-AT ?auto_73672 ?auto_73675 ) ( ON ?auto_73672 ?auto_73678 ) ( CLEAR ?auto_73672 ) ( not ( = ?auto_73671 ?auto_73678 ) ) ( not ( = ?auto_73672 ?auto_73678 ) ) ( not ( = ?auto_73670 ?auto_73678 ) ) ( IS-CRATE ?auto_73671 ) ( AVAILABLE ?auto_73674 ) ( SURFACE-AT ?auto_73671 ?auto_73675 ) ( ON ?auto_73671 ?auto_73677 ) ( CLEAR ?auto_73671 ) ( not ( = ?auto_73671 ?auto_73677 ) ) ( not ( = ?auto_73672 ?auto_73677 ) ) ( not ( = ?auto_73670 ?auto_73677 ) ) ( not ( = ?auto_73678 ?auto_73677 ) ) ( TRUCK-AT ?auto_73679 ?auto_73676 ) ( SURFACE-AT ?auto_73673 ?auto_73676 ) ( CLEAR ?auto_73673 ) ( LIFTING ?auto_73680 ?auto_73670 ) ( IS-CRATE ?auto_73670 ) ( not ( = ?auto_73673 ?auto_73670 ) ) ( not ( = ?auto_73671 ?auto_73673 ) ) ( not ( = ?auto_73672 ?auto_73673 ) ) ( not ( = ?auto_73678 ?auto_73673 ) ) ( not ( = ?auto_73677 ?auto_73673 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_73671 ?auto_73672 )
      ( MAKE-2CRATE-VERIFY ?auto_73670 ?auto_73671 ?auto_73672 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_73682 - SURFACE
      ?auto_73683 - SURFACE
      ?auto_73684 - SURFACE
      ?auto_73681 - SURFACE
    )
    :vars
    (
      ?auto_73690 - HOIST
      ?auto_73688 - PLACE
      ?auto_73686 - PLACE
      ?auto_73685 - HOIST
      ?auto_73687 - SURFACE
      ?auto_73691 - SURFACE
      ?auto_73689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73690 ?auto_73688 ) ( IS-CRATE ?auto_73681 ) ( not ( = ?auto_73684 ?auto_73681 ) ) ( not ( = ?auto_73683 ?auto_73684 ) ) ( not ( = ?auto_73683 ?auto_73681 ) ) ( not ( = ?auto_73686 ?auto_73688 ) ) ( HOIST-AT ?auto_73685 ?auto_73686 ) ( not ( = ?auto_73690 ?auto_73685 ) ) ( SURFACE-AT ?auto_73681 ?auto_73686 ) ( ON ?auto_73681 ?auto_73687 ) ( CLEAR ?auto_73681 ) ( not ( = ?auto_73684 ?auto_73687 ) ) ( not ( = ?auto_73681 ?auto_73687 ) ) ( not ( = ?auto_73683 ?auto_73687 ) ) ( IS-CRATE ?auto_73684 ) ( AVAILABLE ?auto_73685 ) ( SURFACE-AT ?auto_73684 ?auto_73686 ) ( ON ?auto_73684 ?auto_73691 ) ( CLEAR ?auto_73684 ) ( not ( = ?auto_73684 ?auto_73691 ) ) ( not ( = ?auto_73681 ?auto_73691 ) ) ( not ( = ?auto_73683 ?auto_73691 ) ) ( not ( = ?auto_73687 ?auto_73691 ) ) ( TRUCK-AT ?auto_73689 ?auto_73688 ) ( SURFACE-AT ?auto_73682 ?auto_73688 ) ( CLEAR ?auto_73682 ) ( LIFTING ?auto_73690 ?auto_73683 ) ( IS-CRATE ?auto_73683 ) ( not ( = ?auto_73682 ?auto_73683 ) ) ( not ( = ?auto_73684 ?auto_73682 ) ) ( not ( = ?auto_73681 ?auto_73682 ) ) ( not ( = ?auto_73687 ?auto_73682 ) ) ( not ( = ?auto_73691 ?auto_73682 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73683 ?auto_73684 ?auto_73681 )
      ( MAKE-3CRATE-VERIFY ?auto_73682 ?auto_73683 ?auto_73684 ?auto_73681 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73693 - SURFACE
      ?auto_73694 - SURFACE
      ?auto_73695 - SURFACE
      ?auto_73692 - SURFACE
      ?auto_73696 - SURFACE
    )
    :vars
    (
      ?auto_73702 - HOIST
      ?auto_73700 - PLACE
      ?auto_73698 - PLACE
      ?auto_73697 - HOIST
      ?auto_73699 - SURFACE
      ?auto_73703 - SURFACE
      ?auto_73701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73702 ?auto_73700 ) ( IS-CRATE ?auto_73696 ) ( not ( = ?auto_73692 ?auto_73696 ) ) ( not ( = ?auto_73695 ?auto_73692 ) ) ( not ( = ?auto_73695 ?auto_73696 ) ) ( not ( = ?auto_73698 ?auto_73700 ) ) ( HOIST-AT ?auto_73697 ?auto_73698 ) ( not ( = ?auto_73702 ?auto_73697 ) ) ( SURFACE-AT ?auto_73696 ?auto_73698 ) ( ON ?auto_73696 ?auto_73699 ) ( CLEAR ?auto_73696 ) ( not ( = ?auto_73692 ?auto_73699 ) ) ( not ( = ?auto_73696 ?auto_73699 ) ) ( not ( = ?auto_73695 ?auto_73699 ) ) ( IS-CRATE ?auto_73692 ) ( AVAILABLE ?auto_73697 ) ( SURFACE-AT ?auto_73692 ?auto_73698 ) ( ON ?auto_73692 ?auto_73703 ) ( CLEAR ?auto_73692 ) ( not ( = ?auto_73692 ?auto_73703 ) ) ( not ( = ?auto_73696 ?auto_73703 ) ) ( not ( = ?auto_73695 ?auto_73703 ) ) ( not ( = ?auto_73699 ?auto_73703 ) ) ( TRUCK-AT ?auto_73701 ?auto_73700 ) ( SURFACE-AT ?auto_73694 ?auto_73700 ) ( CLEAR ?auto_73694 ) ( LIFTING ?auto_73702 ?auto_73695 ) ( IS-CRATE ?auto_73695 ) ( not ( = ?auto_73694 ?auto_73695 ) ) ( not ( = ?auto_73692 ?auto_73694 ) ) ( not ( = ?auto_73696 ?auto_73694 ) ) ( not ( = ?auto_73699 ?auto_73694 ) ) ( not ( = ?auto_73703 ?auto_73694 ) ) ( ON ?auto_73694 ?auto_73693 ) ( not ( = ?auto_73693 ?auto_73694 ) ) ( not ( = ?auto_73693 ?auto_73695 ) ) ( not ( = ?auto_73693 ?auto_73692 ) ) ( not ( = ?auto_73693 ?auto_73696 ) ) ( not ( = ?auto_73693 ?auto_73699 ) ) ( not ( = ?auto_73693 ?auto_73703 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73695 ?auto_73692 ?auto_73696 )
      ( MAKE-4CRATE-VERIFY ?auto_73693 ?auto_73694 ?auto_73695 ?auto_73692 ?auto_73696 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74122 - SURFACE
      ?auto_74123 - SURFACE
      ?auto_74124 - SURFACE
      ?auto_74121 - SURFACE
      ?auto_74125 - SURFACE
      ?auto_74126 - SURFACE
    )
    :vars
    (
      ?auto_74128 - HOIST
      ?auto_74127 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_74128 ?auto_74127 ) ( SURFACE-AT ?auto_74125 ?auto_74127 ) ( CLEAR ?auto_74125 ) ( LIFTING ?auto_74128 ?auto_74126 ) ( IS-CRATE ?auto_74126 ) ( not ( = ?auto_74125 ?auto_74126 ) ) ( ON ?auto_74123 ?auto_74122 ) ( ON ?auto_74124 ?auto_74123 ) ( ON ?auto_74121 ?auto_74124 ) ( ON ?auto_74125 ?auto_74121 ) ( not ( = ?auto_74122 ?auto_74123 ) ) ( not ( = ?auto_74122 ?auto_74124 ) ) ( not ( = ?auto_74122 ?auto_74121 ) ) ( not ( = ?auto_74122 ?auto_74125 ) ) ( not ( = ?auto_74122 ?auto_74126 ) ) ( not ( = ?auto_74123 ?auto_74124 ) ) ( not ( = ?auto_74123 ?auto_74121 ) ) ( not ( = ?auto_74123 ?auto_74125 ) ) ( not ( = ?auto_74123 ?auto_74126 ) ) ( not ( = ?auto_74124 ?auto_74121 ) ) ( not ( = ?auto_74124 ?auto_74125 ) ) ( not ( = ?auto_74124 ?auto_74126 ) ) ( not ( = ?auto_74121 ?auto_74125 ) ) ( not ( = ?auto_74121 ?auto_74126 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_74125 ?auto_74126 )
      ( MAKE-5CRATE-VERIFY ?auto_74122 ?auto_74123 ?auto_74124 ?auto_74121 ?auto_74125 ?auto_74126 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74156 - SURFACE
      ?auto_74157 - SURFACE
      ?auto_74158 - SURFACE
      ?auto_74155 - SURFACE
      ?auto_74159 - SURFACE
      ?auto_74160 - SURFACE
    )
    :vars
    (
      ?auto_74162 - HOIST
      ?auto_74163 - PLACE
      ?auto_74161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74162 ?auto_74163 ) ( SURFACE-AT ?auto_74159 ?auto_74163 ) ( CLEAR ?auto_74159 ) ( IS-CRATE ?auto_74160 ) ( not ( = ?auto_74159 ?auto_74160 ) ) ( TRUCK-AT ?auto_74161 ?auto_74163 ) ( AVAILABLE ?auto_74162 ) ( IN ?auto_74160 ?auto_74161 ) ( ON ?auto_74159 ?auto_74155 ) ( not ( = ?auto_74155 ?auto_74159 ) ) ( not ( = ?auto_74155 ?auto_74160 ) ) ( ON ?auto_74157 ?auto_74156 ) ( ON ?auto_74158 ?auto_74157 ) ( ON ?auto_74155 ?auto_74158 ) ( not ( = ?auto_74156 ?auto_74157 ) ) ( not ( = ?auto_74156 ?auto_74158 ) ) ( not ( = ?auto_74156 ?auto_74155 ) ) ( not ( = ?auto_74156 ?auto_74159 ) ) ( not ( = ?auto_74156 ?auto_74160 ) ) ( not ( = ?auto_74157 ?auto_74158 ) ) ( not ( = ?auto_74157 ?auto_74155 ) ) ( not ( = ?auto_74157 ?auto_74159 ) ) ( not ( = ?auto_74157 ?auto_74160 ) ) ( not ( = ?auto_74158 ?auto_74155 ) ) ( not ( = ?auto_74158 ?auto_74159 ) ) ( not ( = ?auto_74158 ?auto_74160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74155 ?auto_74159 ?auto_74160 )
      ( MAKE-5CRATE-VERIFY ?auto_74156 ?auto_74157 ?auto_74158 ?auto_74155 ?auto_74159 ?auto_74160 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74196 - SURFACE
      ?auto_74197 - SURFACE
      ?auto_74198 - SURFACE
      ?auto_74195 - SURFACE
      ?auto_74199 - SURFACE
      ?auto_74200 - SURFACE
    )
    :vars
    (
      ?auto_74204 - HOIST
      ?auto_74201 - PLACE
      ?auto_74203 - TRUCK
      ?auto_74202 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_74204 ?auto_74201 ) ( SURFACE-AT ?auto_74199 ?auto_74201 ) ( CLEAR ?auto_74199 ) ( IS-CRATE ?auto_74200 ) ( not ( = ?auto_74199 ?auto_74200 ) ) ( AVAILABLE ?auto_74204 ) ( IN ?auto_74200 ?auto_74203 ) ( ON ?auto_74199 ?auto_74195 ) ( not ( = ?auto_74195 ?auto_74199 ) ) ( not ( = ?auto_74195 ?auto_74200 ) ) ( TRUCK-AT ?auto_74203 ?auto_74202 ) ( not ( = ?auto_74202 ?auto_74201 ) ) ( ON ?auto_74197 ?auto_74196 ) ( ON ?auto_74198 ?auto_74197 ) ( ON ?auto_74195 ?auto_74198 ) ( not ( = ?auto_74196 ?auto_74197 ) ) ( not ( = ?auto_74196 ?auto_74198 ) ) ( not ( = ?auto_74196 ?auto_74195 ) ) ( not ( = ?auto_74196 ?auto_74199 ) ) ( not ( = ?auto_74196 ?auto_74200 ) ) ( not ( = ?auto_74197 ?auto_74198 ) ) ( not ( = ?auto_74197 ?auto_74195 ) ) ( not ( = ?auto_74197 ?auto_74199 ) ) ( not ( = ?auto_74197 ?auto_74200 ) ) ( not ( = ?auto_74198 ?auto_74195 ) ) ( not ( = ?auto_74198 ?auto_74199 ) ) ( not ( = ?auto_74198 ?auto_74200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74195 ?auto_74199 ?auto_74200 )
      ( MAKE-5CRATE-VERIFY ?auto_74196 ?auto_74197 ?auto_74198 ?auto_74195 ?auto_74199 ?auto_74200 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74241 - SURFACE
      ?auto_74242 - SURFACE
      ?auto_74243 - SURFACE
      ?auto_74240 - SURFACE
      ?auto_74244 - SURFACE
      ?auto_74245 - SURFACE
    )
    :vars
    (
      ?auto_74249 - HOIST
      ?auto_74250 - PLACE
      ?auto_74247 - TRUCK
      ?auto_74248 - PLACE
      ?auto_74246 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_74249 ?auto_74250 ) ( SURFACE-AT ?auto_74244 ?auto_74250 ) ( CLEAR ?auto_74244 ) ( IS-CRATE ?auto_74245 ) ( not ( = ?auto_74244 ?auto_74245 ) ) ( AVAILABLE ?auto_74249 ) ( ON ?auto_74244 ?auto_74240 ) ( not ( = ?auto_74240 ?auto_74244 ) ) ( not ( = ?auto_74240 ?auto_74245 ) ) ( TRUCK-AT ?auto_74247 ?auto_74248 ) ( not ( = ?auto_74248 ?auto_74250 ) ) ( HOIST-AT ?auto_74246 ?auto_74248 ) ( LIFTING ?auto_74246 ?auto_74245 ) ( not ( = ?auto_74249 ?auto_74246 ) ) ( ON ?auto_74242 ?auto_74241 ) ( ON ?auto_74243 ?auto_74242 ) ( ON ?auto_74240 ?auto_74243 ) ( not ( = ?auto_74241 ?auto_74242 ) ) ( not ( = ?auto_74241 ?auto_74243 ) ) ( not ( = ?auto_74241 ?auto_74240 ) ) ( not ( = ?auto_74241 ?auto_74244 ) ) ( not ( = ?auto_74241 ?auto_74245 ) ) ( not ( = ?auto_74242 ?auto_74243 ) ) ( not ( = ?auto_74242 ?auto_74240 ) ) ( not ( = ?auto_74242 ?auto_74244 ) ) ( not ( = ?auto_74242 ?auto_74245 ) ) ( not ( = ?auto_74243 ?auto_74240 ) ) ( not ( = ?auto_74243 ?auto_74244 ) ) ( not ( = ?auto_74243 ?auto_74245 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74240 ?auto_74244 ?auto_74245 )
      ( MAKE-5CRATE-VERIFY ?auto_74241 ?auto_74242 ?auto_74243 ?auto_74240 ?auto_74244 ?auto_74245 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74291 - SURFACE
      ?auto_74292 - SURFACE
      ?auto_74293 - SURFACE
      ?auto_74290 - SURFACE
      ?auto_74294 - SURFACE
      ?auto_74295 - SURFACE
    )
    :vars
    (
      ?auto_74297 - HOIST
      ?auto_74296 - PLACE
      ?auto_74299 - TRUCK
      ?auto_74298 - PLACE
      ?auto_74301 - HOIST
      ?auto_74300 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_74297 ?auto_74296 ) ( SURFACE-AT ?auto_74294 ?auto_74296 ) ( CLEAR ?auto_74294 ) ( IS-CRATE ?auto_74295 ) ( not ( = ?auto_74294 ?auto_74295 ) ) ( AVAILABLE ?auto_74297 ) ( ON ?auto_74294 ?auto_74290 ) ( not ( = ?auto_74290 ?auto_74294 ) ) ( not ( = ?auto_74290 ?auto_74295 ) ) ( TRUCK-AT ?auto_74299 ?auto_74298 ) ( not ( = ?auto_74298 ?auto_74296 ) ) ( HOIST-AT ?auto_74301 ?auto_74298 ) ( not ( = ?auto_74297 ?auto_74301 ) ) ( AVAILABLE ?auto_74301 ) ( SURFACE-AT ?auto_74295 ?auto_74298 ) ( ON ?auto_74295 ?auto_74300 ) ( CLEAR ?auto_74295 ) ( not ( = ?auto_74294 ?auto_74300 ) ) ( not ( = ?auto_74295 ?auto_74300 ) ) ( not ( = ?auto_74290 ?auto_74300 ) ) ( ON ?auto_74292 ?auto_74291 ) ( ON ?auto_74293 ?auto_74292 ) ( ON ?auto_74290 ?auto_74293 ) ( not ( = ?auto_74291 ?auto_74292 ) ) ( not ( = ?auto_74291 ?auto_74293 ) ) ( not ( = ?auto_74291 ?auto_74290 ) ) ( not ( = ?auto_74291 ?auto_74294 ) ) ( not ( = ?auto_74291 ?auto_74295 ) ) ( not ( = ?auto_74291 ?auto_74300 ) ) ( not ( = ?auto_74292 ?auto_74293 ) ) ( not ( = ?auto_74292 ?auto_74290 ) ) ( not ( = ?auto_74292 ?auto_74294 ) ) ( not ( = ?auto_74292 ?auto_74295 ) ) ( not ( = ?auto_74292 ?auto_74300 ) ) ( not ( = ?auto_74293 ?auto_74290 ) ) ( not ( = ?auto_74293 ?auto_74294 ) ) ( not ( = ?auto_74293 ?auto_74295 ) ) ( not ( = ?auto_74293 ?auto_74300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74290 ?auto_74294 ?auto_74295 )
      ( MAKE-5CRATE-VERIFY ?auto_74291 ?auto_74292 ?auto_74293 ?auto_74290 ?auto_74294 ?auto_74295 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74342 - SURFACE
      ?auto_74343 - SURFACE
      ?auto_74344 - SURFACE
      ?auto_74341 - SURFACE
      ?auto_74345 - SURFACE
      ?auto_74346 - SURFACE
    )
    :vars
    (
      ?auto_74351 - HOIST
      ?auto_74347 - PLACE
      ?auto_74348 - PLACE
      ?auto_74350 - HOIST
      ?auto_74352 - SURFACE
      ?auto_74349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74351 ?auto_74347 ) ( SURFACE-AT ?auto_74345 ?auto_74347 ) ( CLEAR ?auto_74345 ) ( IS-CRATE ?auto_74346 ) ( not ( = ?auto_74345 ?auto_74346 ) ) ( AVAILABLE ?auto_74351 ) ( ON ?auto_74345 ?auto_74341 ) ( not ( = ?auto_74341 ?auto_74345 ) ) ( not ( = ?auto_74341 ?auto_74346 ) ) ( not ( = ?auto_74348 ?auto_74347 ) ) ( HOIST-AT ?auto_74350 ?auto_74348 ) ( not ( = ?auto_74351 ?auto_74350 ) ) ( AVAILABLE ?auto_74350 ) ( SURFACE-AT ?auto_74346 ?auto_74348 ) ( ON ?auto_74346 ?auto_74352 ) ( CLEAR ?auto_74346 ) ( not ( = ?auto_74345 ?auto_74352 ) ) ( not ( = ?auto_74346 ?auto_74352 ) ) ( not ( = ?auto_74341 ?auto_74352 ) ) ( TRUCK-AT ?auto_74349 ?auto_74347 ) ( ON ?auto_74343 ?auto_74342 ) ( ON ?auto_74344 ?auto_74343 ) ( ON ?auto_74341 ?auto_74344 ) ( not ( = ?auto_74342 ?auto_74343 ) ) ( not ( = ?auto_74342 ?auto_74344 ) ) ( not ( = ?auto_74342 ?auto_74341 ) ) ( not ( = ?auto_74342 ?auto_74345 ) ) ( not ( = ?auto_74342 ?auto_74346 ) ) ( not ( = ?auto_74342 ?auto_74352 ) ) ( not ( = ?auto_74343 ?auto_74344 ) ) ( not ( = ?auto_74343 ?auto_74341 ) ) ( not ( = ?auto_74343 ?auto_74345 ) ) ( not ( = ?auto_74343 ?auto_74346 ) ) ( not ( = ?auto_74343 ?auto_74352 ) ) ( not ( = ?auto_74344 ?auto_74341 ) ) ( not ( = ?auto_74344 ?auto_74345 ) ) ( not ( = ?auto_74344 ?auto_74346 ) ) ( not ( = ?auto_74344 ?auto_74352 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74341 ?auto_74345 ?auto_74346 )
      ( MAKE-5CRATE-VERIFY ?auto_74342 ?auto_74343 ?auto_74344 ?auto_74341 ?auto_74345 ?auto_74346 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74393 - SURFACE
      ?auto_74394 - SURFACE
      ?auto_74395 - SURFACE
      ?auto_74392 - SURFACE
      ?auto_74396 - SURFACE
      ?auto_74397 - SURFACE
    )
    :vars
    (
      ?auto_74401 - HOIST
      ?auto_74403 - PLACE
      ?auto_74400 - PLACE
      ?auto_74398 - HOIST
      ?auto_74399 - SURFACE
      ?auto_74402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74401 ?auto_74403 ) ( IS-CRATE ?auto_74397 ) ( not ( = ?auto_74396 ?auto_74397 ) ) ( not ( = ?auto_74392 ?auto_74396 ) ) ( not ( = ?auto_74392 ?auto_74397 ) ) ( not ( = ?auto_74400 ?auto_74403 ) ) ( HOIST-AT ?auto_74398 ?auto_74400 ) ( not ( = ?auto_74401 ?auto_74398 ) ) ( AVAILABLE ?auto_74398 ) ( SURFACE-AT ?auto_74397 ?auto_74400 ) ( ON ?auto_74397 ?auto_74399 ) ( CLEAR ?auto_74397 ) ( not ( = ?auto_74396 ?auto_74399 ) ) ( not ( = ?auto_74397 ?auto_74399 ) ) ( not ( = ?auto_74392 ?auto_74399 ) ) ( TRUCK-AT ?auto_74402 ?auto_74403 ) ( SURFACE-AT ?auto_74392 ?auto_74403 ) ( CLEAR ?auto_74392 ) ( LIFTING ?auto_74401 ?auto_74396 ) ( IS-CRATE ?auto_74396 ) ( ON ?auto_74394 ?auto_74393 ) ( ON ?auto_74395 ?auto_74394 ) ( ON ?auto_74392 ?auto_74395 ) ( not ( = ?auto_74393 ?auto_74394 ) ) ( not ( = ?auto_74393 ?auto_74395 ) ) ( not ( = ?auto_74393 ?auto_74392 ) ) ( not ( = ?auto_74393 ?auto_74396 ) ) ( not ( = ?auto_74393 ?auto_74397 ) ) ( not ( = ?auto_74393 ?auto_74399 ) ) ( not ( = ?auto_74394 ?auto_74395 ) ) ( not ( = ?auto_74394 ?auto_74392 ) ) ( not ( = ?auto_74394 ?auto_74396 ) ) ( not ( = ?auto_74394 ?auto_74397 ) ) ( not ( = ?auto_74394 ?auto_74399 ) ) ( not ( = ?auto_74395 ?auto_74392 ) ) ( not ( = ?auto_74395 ?auto_74396 ) ) ( not ( = ?auto_74395 ?auto_74397 ) ) ( not ( = ?auto_74395 ?auto_74399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74392 ?auto_74396 ?auto_74397 )
      ( MAKE-5CRATE-VERIFY ?auto_74393 ?auto_74394 ?auto_74395 ?auto_74392 ?auto_74396 ?auto_74397 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74444 - SURFACE
      ?auto_74445 - SURFACE
      ?auto_74446 - SURFACE
      ?auto_74443 - SURFACE
      ?auto_74447 - SURFACE
      ?auto_74448 - SURFACE
    )
    :vars
    (
      ?auto_74452 - HOIST
      ?auto_74450 - PLACE
      ?auto_74451 - PLACE
      ?auto_74453 - HOIST
      ?auto_74449 - SURFACE
      ?auto_74454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74452 ?auto_74450 ) ( IS-CRATE ?auto_74448 ) ( not ( = ?auto_74447 ?auto_74448 ) ) ( not ( = ?auto_74443 ?auto_74447 ) ) ( not ( = ?auto_74443 ?auto_74448 ) ) ( not ( = ?auto_74451 ?auto_74450 ) ) ( HOIST-AT ?auto_74453 ?auto_74451 ) ( not ( = ?auto_74452 ?auto_74453 ) ) ( AVAILABLE ?auto_74453 ) ( SURFACE-AT ?auto_74448 ?auto_74451 ) ( ON ?auto_74448 ?auto_74449 ) ( CLEAR ?auto_74448 ) ( not ( = ?auto_74447 ?auto_74449 ) ) ( not ( = ?auto_74448 ?auto_74449 ) ) ( not ( = ?auto_74443 ?auto_74449 ) ) ( TRUCK-AT ?auto_74454 ?auto_74450 ) ( SURFACE-AT ?auto_74443 ?auto_74450 ) ( CLEAR ?auto_74443 ) ( IS-CRATE ?auto_74447 ) ( AVAILABLE ?auto_74452 ) ( IN ?auto_74447 ?auto_74454 ) ( ON ?auto_74445 ?auto_74444 ) ( ON ?auto_74446 ?auto_74445 ) ( ON ?auto_74443 ?auto_74446 ) ( not ( = ?auto_74444 ?auto_74445 ) ) ( not ( = ?auto_74444 ?auto_74446 ) ) ( not ( = ?auto_74444 ?auto_74443 ) ) ( not ( = ?auto_74444 ?auto_74447 ) ) ( not ( = ?auto_74444 ?auto_74448 ) ) ( not ( = ?auto_74444 ?auto_74449 ) ) ( not ( = ?auto_74445 ?auto_74446 ) ) ( not ( = ?auto_74445 ?auto_74443 ) ) ( not ( = ?auto_74445 ?auto_74447 ) ) ( not ( = ?auto_74445 ?auto_74448 ) ) ( not ( = ?auto_74445 ?auto_74449 ) ) ( not ( = ?auto_74446 ?auto_74443 ) ) ( not ( = ?auto_74446 ?auto_74447 ) ) ( not ( = ?auto_74446 ?auto_74448 ) ) ( not ( = ?auto_74446 ?auto_74449 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74443 ?auto_74447 ?auto_74448 )
      ( MAKE-5CRATE-VERIFY ?auto_74444 ?auto_74445 ?auto_74446 ?auto_74443 ?auto_74447 ?auto_74448 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_75119 - SURFACE
      ?auto_75120 - SURFACE
    )
    :vars
    (
      ?auto_75123 - HOIST
      ?auto_75122 - PLACE
      ?auto_75125 - SURFACE
      ?auto_75124 - TRUCK
      ?auto_75126 - PLACE
      ?auto_75121 - HOIST
      ?auto_75127 - SURFACE
      ?auto_75128 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_75123 ?auto_75122 ) ( SURFACE-AT ?auto_75119 ?auto_75122 ) ( CLEAR ?auto_75119 ) ( IS-CRATE ?auto_75120 ) ( not ( = ?auto_75119 ?auto_75120 ) ) ( AVAILABLE ?auto_75123 ) ( ON ?auto_75119 ?auto_75125 ) ( not ( = ?auto_75125 ?auto_75119 ) ) ( not ( = ?auto_75125 ?auto_75120 ) ) ( TRUCK-AT ?auto_75124 ?auto_75126 ) ( not ( = ?auto_75126 ?auto_75122 ) ) ( HOIST-AT ?auto_75121 ?auto_75126 ) ( not ( = ?auto_75123 ?auto_75121 ) ) ( SURFACE-AT ?auto_75120 ?auto_75126 ) ( ON ?auto_75120 ?auto_75127 ) ( CLEAR ?auto_75120 ) ( not ( = ?auto_75119 ?auto_75127 ) ) ( not ( = ?auto_75120 ?auto_75127 ) ) ( not ( = ?auto_75125 ?auto_75127 ) ) ( LIFTING ?auto_75121 ?auto_75128 ) ( IS-CRATE ?auto_75128 ) ( not ( = ?auto_75119 ?auto_75128 ) ) ( not ( = ?auto_75120 ?auto_75128 ) ) ( not ( = ?auto_75125 ?auto_75128 ) ) ( not ( = ?auto_75127 ?auto_75128 ) ) )
    :subtasks
    ( ( !LOAD ?auto_75121 ?auto_75128 ?auto_75124 ?auto_75126 )
      ( MAKE-1CRATE ?auto_75119 ?auto_75120 )
      ( MAKE-1CRATE-VERIFY ?auto_75119 ?auto_75120 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75636 - SURFACE
      ?auto_75637 - SURFACE
      ?auto_75638 - SURFACE
      ?auto_75635 - SURFACE
      ?auto_75639 - SURFACE
      ?auto_75641 - SURFACE
      ?auto_75640 - SURFACE
    )
    :vars
    (
      ?auto_75643 - HOIST
      ?auto_75642 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_75643 ?auto_75642 ) ( SURFACE-AT ?auto_75641 ?auto_75642 ) ( CLEAR ?auto_75641 ) ( LIFTING ?auto_75643 ?auto_75640 ) ( IS-CRATE ?auto_75640 ) ( not ( = ?auto_75641 ?auto_75640 ) ) ( ON ?auto_75637 ?auto_75636 ) ( ON ?auto_75638 ?auto_75637 ) ( ON ?auto_75635 ?auto_75638 ) ( ON ?auto_75639 ?auto_75635 ) ( ON ?auto_75641 ?auto_75639 ) ( not ( = ?auto_75636 ?auto_75637 ) ) ( not ( = ?auto_75636 ?auto_75638 ) ) ( not ( = ?auto_75636 ?auto_75635 ) ) ( not ( = ?auto_75636 ?auto_75639 ) ) ( not ( = ?auto_75636 ?auto_75641 ) ) ( not ( = ?auto_75636 ?auto_75640 ) ) ( not ( = ?auto_75637 ?auto_75638 ) ) ( not ( = ?auto_75637 ?auto_75635 ) ) ( not ( = ?auto_75637 ?auto_75639 ) ) ( not ( = ?auto_75637 ?auto_75641 ) ) ( not ( = ?auto_75637 ?auto_75640 ) ) ( not ( = ?auto_75638 ?auto_75635 ) ) ( not ( = ?auto_75638 ?auto_75639 ) ) ( not ( = ?auto_75638 ?auto_75641 ) ) ( not ( = ?auto_75638 ?auto_75640 ) ) ( not ( = ?auto_75635 ?auto_75639 ) ) ( not ( = ?auto_75635 ?auto_75641 ) ) ( not ( = ?auto_75635 ?auto_75640 ) ) ( not ( = ?auto_75639 ?auto_75641 ) ) ( not ( = ?auto_75639 ?auto_75640 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_75641 ?auto_75640 )
      ( MAKE-6CRATE-VERIFY ?auto_75636 ?auto_75637 ?auto_75638 ?auto_75635 ?auto_75639 ?auto_75641 ?auto_75640 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75680 - SURFACE
      ?auto_75681 - SURFACE
      ?auto_75682 - SURFACE
      ?auto_75679 - SURFACE
      ?auto_75683 - SURFACE
      ?auto_75685 - SURFACE
      ?auto_75684 - SURFACE
    )
    :vars
    (
      ?auto_75688 - HOIST
      ?auto_75687 - PLACE
      ?auto_75686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_75688 ?auto_75687 ) ( SURFACE-AT ?auto_75685 ?auto_75687 ) ( CLEAR ?auto_75685 ) ( IS-CRATE ?auto_75684 ) ( not ( = ?auto_75685 ?auto_75684 ) ) ( TRUCK-AT ?auto_75686 ?auto_75687 ) ( AVAILABLE ?auto_75688 ) ( IN ?auto_75684 ?auto_75686 ) ( ON ?auto_75685 ?auto_75683 ) ( not ( = ?auto_75683 ?auto_75685 ) ) ( not ( = ?auto_75683 ?auto_75684 ) ) ( ON ?auto_75681 ?auto_75680 ) ( ON ?auto_75682 ?auto_75681 ) ( ON ?auto_75679 ?auto_75682 ) ( ON ?auto_75683 ?auto_75679 ) ( not ( = ?auto_75680 ?auto_75681 ) ) ( not ( = ?auto_75680 ?auto_75682 ) ) ( not ( = ?auto_75680 ?auto_75679 ) ) ( not ( = ?auto_75680 ?auto_75683 ) ) ( not ( = ?auto_75680 ?auto_75685 ) ) ( not ( = ?auto_75680 ?auto_75684 ) ) ( not ( = ?auto_75681 ?auto_75682 ) ) ( not ( = ?auto_75681 ?auto_75679 ) ) ( not ( = ?auto_75681 ?auto_75683 ) ) ( not ( = ?auto_75681 ?auto_75685 ) ) ( not ( = ?auto_75681 ?auto_75684 ) ) ( not ( = ?auto_75682 ?auto_75679 ) ) ( not ( = ?auto_75682 ?auto_75683 ) ) ( not ( = ?auto_75682 ?auto_75685 ) ) ( not ( = ?auto_75682 ?auto_75684 ) ) ( not ( = ?auto_75679 ?auto_75683 ) ) ( not ( = ?auto_75679 ?auto_75685 ) ) ( not ( = ?auto_75679 ?auto_75684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75683 ?auto_75685 ?auto_75684 )
      ( MAKE-6CRATE-VERIFY ?auto_75680 ?auto_75681 ?auto_75682 ?auto_75679 ?auto_75683 ?auto_75685 ?auto_75684 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75731 - SURFACE
      ?auto_75732 - SURFACE
      ?auto_75733 - SURFACE
      ?auto_75730 - SURFACE
      ?auto_75734 - SURFACE
      ?auto_75736 - SURFACE
      ?auto_75735 - SURFACE
    )
    :vars
    (
      ?auto_75739 - HOIST
      ?auto_75737 - PLACE
      ?auto_75740 - TRUCK
      ?auto_75738 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_75739 ?auto_75737 ) ( SURFACE-AT ?auto_75736 ?auto_75737 ) ( CLEAR ?auto_75736 ) ( IS-CRATE ?auto_75735 ) ( not ( = ?auto_75736 ?auto_75735 ) ) ( AVAILABLE ?auto_75739 ) ( IN ?auto_75735 ?auto_75740 ) ( ON ?auto_75736 ?auto_75734 ) ( not ( = ?auto_75734 ?auto_75736 ) ) ( not ( = ?auto_75734 ?auto_75735 ) ) ( TRUCK-AT ?auto_75740 ?auto_75738 ) ( not ( = ?auto_75738 ?auto_75737 ) ) ( ON ?auto_75732 ?auto_75731 ) ( ON ?auto_75733 ?auto_75732 ) ( ON ?auto_75730 ?auto_75733 ) ( ON ?auto_75734 ?auto_75730 ) ( not ( = ?auto_75731 ?auto_75732 ) ) ( not ( = ?auto_75731 ?auto_75733 ) ) ( not ( = ?auto_75731 ?auto_75730 ) ) ( not ( = ?auto_75731 ?auto_75734 ) ) ( not ( = ?auto_75731 ?auto_75736 ) ) ( not ( = ?auto_75731 ?auto_75735 ) ) ( not ( = ?auto_75732 ?auto_75733 ) ) ( not ( = ?auto_75732 ?auto_75730 ) ) ( not ( = ?auto_75732 ?auto_75734 ) ) ( not ( = ?auto_75732 ?auto_75736 ) ) ( not ( = ?auto_75732 ?auto_75735 ) ) ( not ( = ?auto_75733 ?auto_75730 ) ) ( not ( = ?auto_75733 ?auto_75734 ) ) ( not ( = ?auto_75733 ?auto_75736 ) ) ( not ( = ?auto_75733 ?auto_75735 ) ) ( not ( = ?auto_75730 ?auto_75734 ) ) ( not ( = ?auto_75730 ?auto_75736 ) ) ( not ( = ?auto_75730 ?auto_75735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75734 ?auto_75736 ?auto_75735 )
      ( MAKE-6CRATE-VERIFY ?auto_75731 ?auto_75732 ?auto_75733 ?auto_75730 ?auto_75734 ?auto_75736 ?auto_75735 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75788 - SURFACE
      ?auto_75789 - SURFACE
      ?auto_75790 - SURFACE
      ?auto_75787 - SURFACE
      ?auto_75791 - SURFACE
      ?auto_75793 - SURFACE
      ?auto_75792 - SURFACE
    )
    :vars
    (
      ?auto_75794 - HOIST
      ?auto_75795 - PLACE
      ?auto_75796 - TRUCK
      ?auto_75797 - PLACE
      ?auto_75798 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_75794 ?auto_75795 ) ( SURFACE-AT ?auto_75793 ?auto_75795 ) ( CLEAR ?auto_75793 ) ( IS-CRATE ?auto_75792 ) ( not ( = ?auto_75793 ?auto_75792 ) ) ( AVAILABLE ?auto_75794 ) ( ON ?auto_75793 ?auto_75791 ) ( not ( = ?auto_75791 ?auto_75793 ) ) ( not ( = ?auto_75791 ?auto_75792 ) ) ( TRUCK-AT ?auto_75796 ?auto_75797 ) ( not ( = ?auto_75797 ?auto_75795 ) ) ( HOIST-AT ?auto_75798 ?auto_75797 ) ( LIFTING ?auto_75798 ?auto_75792 ) ( not ( = ?auto_75794 ?auto_75798 ) ) ( ON ?auto_75789 ?auto_75788 ) ( ON ?auto_75790 ?auto_75789 ) ( ON ?auto_75787 ?auto_75790 ) ( ON ?auto_75791 ?auto_75787 ) ( not ( = ?auto_75788 ?auto_75789 ) ) ( not ( = ?auto_75788 ?auto_75790 ) ) ( not ( = ?auto_75788 ?auto_75787 ) ) ( not ( = ?auto_75788 ?auto_75791 ) ) ( not ( = ?auto_75788 ?auto_75793 ) ) ( not ( = ?auto_75788 ?auto_75792 ) ) ( not ( = ?auto_75789 ?auto_75790 ) ) ( not ( = ?auto_75789 ?auto_75787 ) ) ( not ( = ?auto_75789 ?auto_75791 ) ) ( not ( = ?auto_75789 ?auto_75793 ) ) ( not ( = ?auto_75789 ?auto_75792 ) ) ( not ( = ?auto_75790 ?auto_75787 ) ) ( not ( = ?auto_75790 ?auto_75791 ) ) ( not ( = ?auto_75790 ?auto_75793 ) ) ( not ( = ?auto_75790 ?auto_75792 ) ) ( not ( = ?auto_75787 ?auto_75791 ) ) ( not ( = ?auto_75787 ?auto_75793 ) ) ( not ( = ?auto_75787 ?auto_75792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75791 ?auto_75793 ?auto_75792 )
      ( MAKE-6CRATE-VERIFY ?auto_75788 ?auto_75789 ?auto_75790 ?auto_75787 ?auto_75791 ?auto_75793 ?auto_75792 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75851 - SURFACE
      ?auto_75852 - SURFACE
      ?auto_75853 - SURFACE
      ?auto_75850 - SURFACE
      ?auto_75854 - SURFACE
      ?auto_75856 - SURFACE
      ?auto_75855 - SURFACE
    )
    :vars
    (
      ?auto_75858 - HOIST
      ?auto_75861 - PLACE
      ?auto_75862 - TRUCK
      ?auto_75857 - PLACE
      ?auto_75859 - HOIST
      ?auto_75860 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_75858 ?auto_75861 ) ( SURFACE-AT ?auto_75856 ?auto_75861 ) ( CLEAR ?auto_75856 ) ( IS-CRATE ?auto_75855 ) ( not ( = ?auto_75856 ?auto_75855 ) ) ( AVAILABLE ?auto_75858 ) ( ON ?auto_75856 ?auto_75854 ) ( not ( = ?auto_75854 ?auto_75856 ) ) ( not ( = ?auto_75854 ?auto_75855 ) ) ( TRUCK-AT ?auto_75862 ?auto_75857 ) ( not ( = ?auto_75857 ?auto_75861 ) ) ( HOIST-AT ?auto_75859 ?auto_75857 ) ( not ( = ?auto_75858 ?auto_75859 ) ) ( AVAILABLE ?auto_75859 ) ( SURFACE-AT ?auto_75855 ?auto_75857 ) ( ON ?auto_75855 ?auto_75860 ) ( CLEAR ?auto_75855 ) ( not ( = ?auto_75856 ?auto_75860 ) ) ( not ( = ?auto_75855 ?auto_75860 ) ) ( not ( = ?auto_75854 ?auto_75860 ) ) ( ON ?auto_75852 ?auto_75851 ) ( ON ?auto_75853 ?auto_75852 ) ( ON ?auto_75850 ?auto_75853 ) ( ON ?auto_75854 ?auto_75850 ) ( not ( = ?auto_75851 ?auto_75852 ) ) ( not ( = ?auto_75851 ?auto_75853 ) ) ( not ( = ?auto_75851 ?auto_75850 ) ) ( not ( = ?auto_75851 ?auto_75854 ) ) ( not ( = ?auto_75851 ?auto_75856 ) ) ( not ( = ?auto_75851 ?auto_75855 ) ) ( not ( = ?auto_75851 ?auto_75860 ) ) ( not ( = ?auto_75852 ?auto_75853 ) ) ( not ( = ?auto_75852 ?auto_75850 ) ) ( not ( = ?auto_75852 ?auto_75854 ) ) ( not ( = ?auto_75852 ?auto_75856 ) ) ( not ( = ?auto_75852 ?auto_75855 ) ) ( not ( = ?auto_75852 ?auto_75860 ) ) ( not ( = ?auto_75853 ?auto_75850 ) ) ( not ( = ?auto_75853 ?auto_75854 ) ) ( not ( = ?auto_75853 ?auto_75856 ) ) ( not ( = ?auto_75853 ?auto_75855 ) ) ( not ( = ?auto_75853 ?auto_75860 ) ) ( not ( = ?auto_75850 ?auto_75854 ) ) ( not ( = ?auto_75850 ?auto_75856 ) ) ( not ( = ?auto_75850 ?auto_75855 ) ) ( not ( = ?auto_75850 ?auto_75860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75854 ?auto_75856 ?auto_75855 )
      ( MAKE-6CRATE-VERIFY ?auto_75851 ?auto_75852 ?auto_75853 ?auto_75850 ?auto_75854 ?auto_75856 ?auto_75855 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75915 - SURFACE
      ?auto_75916 - SURFACE
      ?auto_75917 - SURFACE
      ?auto_75914 - SURFACE
      ?auto_75918 - SURFACE
      ?auto_75920 - SURFACE
      ?auto_75919 - SURFACE
    )
    :vars
    (
      ?auto_75922 - HOIST
      ?auto_75926 - PLACE
      ?auto_75921 - PLACE
      ?auto_75925 - HOIST
      ?auto_75923 - SURFACE
      ?auto_75924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_75922 ?auto_75926 ) ( SURFACE-AT ?auto_75920 ?auto_75926 ) ( CLEAR ?auto_75920 ) ( IS-CRATE ?auto_75919 ) ( not ( = ?auto_75920 ?auto_75919 ) ) ( AVAILABLE ?auto_75922 ) ( ON ?auto_75920 ?auto_75918 ) ( not ( = ?auto_75918 ?auto_75920 ) ) ( not ( = ?auto_75918 ?auto_75919 ) ) ( not ( = ?auto_75921 ?auto_75926 ) ) ( HOIST-AT ?auto_75925 ?auto_75921 ) ( not ( = ?auto_75922 ?auto_75925 ) ) ( AVAILABLE ?auto_75925 ) ( SURFACE-AT ?auto_75919 ?auto_75921 ) ( ON ?auto_75919 ?auto_75923 ) ( CLEAR ?auto_75919 ) ( not ( = ?auto_75920 ?auto_75923 ) ) ( not ( = ?auto_75919 ?auto_75923 ) ) ( not ( = ?auto_75918 ?auto_75923 ) ) ( TRUCK-AT ?auto_75924 ?auto_75926 ) ( ON ?auto_75916 ?auto_75915 ) ( ON ?auto_75917 ?auto_75916 ) ( ON ?auto_75914 ?auto_75917 ) ( ON ?auto_75918 ?auto_75914 ) ( not ( = ?auto_75915 ?auto_75916 ) ) ( not ( = ?auto_75915 ?auto_75917 ) ) ( not ( = ?auto_75915 ?auto_75914 ) ) ( not ( = ?auto_75915 ?auto_75918 ) ) ( not ( = ?auto_75915 ?auto_75920 ) ) ( not ( = ?auto_75915 ?auto_75919 ) ) ( not ( = ?auto_75915 ?auto_75923 ) ) ( not ( = ?auto_75916 ?auto_75917 ) ) ( not ( = ?auto_75916 ?auto_75914 ) ) ( not ( = ?auto_75916 ?auto_75918 ) ) ( not ( = ?auto_75916 ?auto_75920 ) ) ( not ( = ?auto_75916 ?auto_75919 ) ) ( not ( = ?auto_75916 ?auto_75923 ) ) ( not ( = ?auto_75917 ?auto_75914 ) ) ( not ( = ?auto_75917 ?auto_75918 ) ) ( not ( = ?auto_75917 ?auto_75920 ) ) ( not ( = ?auto_75917 ?auto_75919 ) ) ( not ( = ?auto_75917 ?auto_75923 ) ) ( not ( = ?auto_75914 ?auto_75918 ) ) ( not ( = ?auto_75914 ?auto_75920 ) ) ( not ( = ?auto_75914 ?auto_75919 ) ) ( not ( = ?auto_75914 ?auto_75923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75918 ?auto_75920 ?auto_75919 )
      ( MAKE-6CRATE-VERIFY ?auto_75915 ?auto_75916 ?auto_75917 ?auto_75914 ?auto_75918 ?auto_75920 ?auto_75919 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75979 - SURFACE
      ?auto_75980 - SURFACE
      ?auto_75981 - SURFACE
      ?auto_75978 - SURFACE
      ?auto_75982 - SURFACE
      ?auto_75984 - SURFACE
      ?auto_75983 - SURFACE
    )
    :vars
    (
      ?auto_75990 - HOIST
      ?auto_75989 - PLACE
      ?auto_75987 - PLACE
      ?auto_75988 - HOIST
      ?auto_75985 - SURFACE
      ?auto_75986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_75990 ?auto_75989 ) ( IS-CRATE ?auto_75983 ) ( not ( = ?auto_75984 ?auto_75983 ) ) ( not ( = ?auto_75982 ?auto_75984 ) ) ( not ( = ?auto_75982 ?auto_75983 ) ) ( not ( = ?auto_75987 ?auto_75989 ) ) ( HOIST-AT ?auto_75988 ?auto_75987 ) ( not ( = ?auto_75990 ?auto_75988 ) ) ( AVAILABLE ?auto_75988 ) ( SURFACE-AT ?auto_75983 ?auto_75987 ) ( ON ?auto_75983 ?auto_75985 ) ( CLEAR ?auto_75983 ) ( not ( = ?auto_75984 ?auto_75985 ) ) ( not ( = ?auto_75983 ?auto_75985 ) ) ( not ( = ?auto_75982 ?auto_75985 ) ) ( TRUCK-AT ?auto_75986 ?auto_75989 ) ( SURFACE-AT ?auto_75982 ?auto_75989 ) ( CLEAR ?auto_75982 ) ( LIFTING ?auto_75990 ?auto_75984 ) ( IS-CRATE ?auto_75984 ) ( ON ?auto_75980 ?auto_75979 ) ( ON ?auto_75981 ?auto_75980 ) ( ON ?auto_75978 ?auto_75981 ) ( ON ?auto_75982 ?auto_75978 ) ( not ( = ?auto_75979 ?auto_75980 ) ) ( not ( = ?auto_75979 ?auto_75981 ) ) ( not ( = ?auto_75979 ?auto_75978 ) ) ( not ( = ?auto_75979 ?auto_75982 ) ) ( not ( = ?auto_75979 ?auto_75984 ) ) ( not ( = ?auto_75979 ?auto_75983 ) ) ( not ( = ?auto_75979 ?auto_75985 ) ) ( not ( = ?auto_75980 ?auto_75981 ) ) ( not ( = ?auto_75980 ?auto_75978 ) ) ( not ( = ?auto_75980 ?auto_75982 ) ) ( not ( = ?auto_75980 ?auto_75984 ) ) ( not ( = ?auto_75980 ?auto_75983 ) ) ( not ( = ?auto_75980 ?auto_75985 ) ) ( not ( = ?auto_75981 ?auto_75978 ) ) ( not ( = ?auto_75981 ?auto_75982 ) ) ( not ( = ?auto_75981 ?auto_75984 ) ) ( not ( = ?auto_75981 ?auto_75983 ) ) ( not ( = ?auto_75981 ?auto_75985 ) ) ( not ( = ?auto_75978 ?auto_75982 ) ) ( not ( = ?auto_75978 ?auto_75984 ) ) ( not ( = ?auto_75978 ?auto_75983 ) ) ( not ( = ?auto_75978 ?auto_75985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75982 ?auto_75984 ?auto_75983 )
      ( MAKE-6CRATE-VERIFY ?auto_75979 ?auto_75980 ?auto_75981 ?auto_75978 ?auto_75982 ?auto_75984 ?auto_75983 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_76043 - SURFACE
      ?auto_76044 - SURFACE
      ?auto_76045 - SURFACE
      ?auto_76042 - SURFACE
      ?auto_76046 - SURFACE
      ?auto_76048 - SURFACE
      ?auto_76047 - SURFACE
    )
    :vars
    (
      ?auto_76053 - HOIST
      ?auto_76051 - PLACE
      ?auto_76049 - PLACE
      ?auto_76050 - HOIST
      ?auto_76054 - SURFACE
      ?auto_76052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_76053 ?auto_76051 ) ( IS-CRATE ?auto_76047 ) ( not ( = ?auto_76048 ?auto_76047 ) ) ( not ( = ?auto_76046 ?auto_76048 ) ) ( not ( = ?auto_76046 ?auto_76047 ) ) ( not ( = ?auto_76049 ?auto_76051 ) ) ( HOIST-AT ?auto_76050 ?auto_76049 ) ( not ( = ?auto_76053 ?auto_76050 ) ) ( AVAILABLE ?auto_76050 ) ( SURFACE-AT ?auto_76047 ?auto_76049 ) ( ON ?auto_76047 ?auto_76054 ) ( CLEAR ?auto_76047 ) ( not ( = ?auto_76048 ?auto_76054 ) ) ( not ( = ?auto_76047 ?auto_76054 ) ) ( not ( = ?auto_76046 ?auto_76054 ) ) ( TRUCK-AT ?auto_76052 ?auto_76051 ) ( SURFACE-AT ?auto_76046 ?auto_76051 ) ( CLEAR ?auto_76046 ) ( IS-CRATE ?auto_76048 ) ( AVAILABLE ?auto_76053 ) ( IN ?auto_76048 ?auto_76052 ) ( ON ?auto_76044 ?auto_76043 ) ( ON ?auto_76045 ?auto_76044 ) ( ON ?auto_76042 ?auto_76045 ) ( ON ?auto_76046 ?auto_76042 ) ( not ( = ?auto_76043 ?auto_76044 ) ) ( not ( = ?auto_76043 ?auto_76045 ) ) ( not ( = ?auto_76043 ?auto_76042 ) ) ( not ( = ?auto_76043 ?auto_76046 ) ) ( not ( = ?auto_76043 ?auto_76048 ) ) ( not ( = ?auto_76043 ?auto_76047 ) ) ( not ( = ?auto_76043 ?auto_76054 ) ) ( not ( = ?auto_76044 ?auto_76045 ) ) ( not ( = ?auto_76044 ?auto_76042 ) ) ( not ( = ?auto_76044 ?auto_76046 ) ) ( not ( = ?auto_76044 ?auto_76048 ) ) ( not ( = ?auto_76044 ?auto_76047 ) ) ( not ( = ?auto_76044 ?auto_76054 ) ) ( not ( = ?auto_76045 ?auto_76042 ) ) ( not ( = ?auto_76045 ?auto_76046 ) ) ( not ( = ?auto_76045 ?auto_76048 ) ) ( not ( = ?auto_76045 ?auto_76047 ) ) ( not ( = ?auto_76045 ?auto_76054 ) ) ( not ( = ?auto_76042 ?auto_76046 ) ) ( not ( = ?auto_76042 ?auto_76048 ) ) ( not ( = ?auto_76042 ?auto_76047 ) ) ( not ( = ?auto_76042 ?auto_76054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_76046 ?auto_76048 ?auto_76047 )
      ( MAKE-6CRATE-VERIFY ?auto_76043 ?auto_76044 ?auto_76045 ?auto_76042 ?auto_76046 ?auto_76048 ?auto_76047 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_77974 - SURFACE
      ?auto_77975 - SURFACE
      ?auto_77976 - SURFACE
      ?auto_77973 - SURFACE
      ?auto_77977 - SURFACE
      ?auto_77979 - SURFACE
      ?auto_77978 - SURFACE
      ?auto_77980 - SURFACE
    )
    :vars
    (
      ?auto_77982 - HOIST
      ?auto_77981 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_77982 ?auto_77981 ) ( SURFACE-AT ?auto_77978 ?auto_77981 ) ( CLEAR ?auto_77978 ) ( LIFTING ?auto_77982 ?auto_77980 ) ( IS-CRATE ?auto_77980 ) ( not ( = ?auto_77978 ?auto_77980 ) ) ( ON ?auto_77975 ?auto_77974 ) ( ON ?auto_77976 ?auto_77975 ) ( ON ?auto_77973 ?auto_77976 ) ( ON ?auto_77977 ?auto_77973 ) ( ON ?auto_77979 ?auto_77977 ) ( ON ?auto_77978 ?auto_77979 ) ( not ( = ?auto_77974 ?auto_77975 ) ) ( not ( = ?auto_77974 ?auto_77976 ) ) ( not ( = ?auto_77974 ?auto_77973 ) ) ( not ( = ?auto_77974 ?auto_77977 ) ) ( not ( = ?auto_77974 ?auto_77979 ) ) ( not ( = ?auto_77974 ?auto_77978 ) ) ( not ( = ?auto_77974 ?auto_77980 ) ) ( not ( = ?auto_77975 ?auto_77976 ) ) ( not ( = ?auto_77975 ?auto_77973 ) ) ( not ( = ?auto_77975 ?auto_77977 ) ) ( not ( = ?auto_77975 ?auto_77979 ) ) ( not ( = ?auto_77975 ?auto_77978 ) ) ( not ( = ?auto_77975 ?auto_77980 ) ) ( not ( = ?auto_77976 ?auto_77973 ) ) ( not ( = ?auto_77976 ?auto_77977 ) ) ( not ( = ?auto_77976 ?auto_77979 ) ) ( not ( = ?auto_77976 ?auto_77978 ) ) ( not ( = ?auto_77976 ?auto_77980 ) ) ( not ( = ?auto_77973 ?auto_77977 ) ) ( not ( = ?auto_77973 ?auto_77979 ) ) ( not ( = ?auto_77973 ?auto_77978 ) ) ( not ( = ?auto_77973 ?auto_77980 ) ) ( not ( = ?auto_77977 ?auto_77979 ) ) ( not ( = ?auto_77977 ?auto_77978 ) ) ( not ( = ?auto_77977 ?auto_77980 ) ) ( not ( = ?auto_77979 ?auto_77978 ) ) ( not ( = ?auto_77979 ?auto_77980 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_77978 ?auto_77980 )
      ( MAKE-7CRATE-VERIFY ?auto_77974 ?auto_77975 ?auto_77976 ?auto_77973 ?auto_77977 ?auto_77979 ?auto_77978 ?auto_77980 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78029 - SURFACE
      ?auto_78030 - SURFACE
      ?auto_78031 - SURFACE
      ?auto_78028 - SURFACE
      ?auto_78032 - SURFACE
      ?auto_78034 - SURFACE
      ?auto_78033 - SURFACE
      ?auto_78035 - SURFACE
    )
    :vars
    (
      ?auto_78037 - HOIST
      ?auto_78038 - PLACE
      ?auto_78036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_78037 ?auto_78038 ) ( SURFACE-AT ?auto_78033 ?auto_78038 ) ( CLEAR ?auto_78033 ) ( IS-CRATE ?auto_78035 ) ( not ( = ?auto_78033 ?auto_78035 ) ) ( TRUCK-AT ?auto_78036 ?auto_78038 ) ( AVAILABLE ?auto_78037 ) ( IN ?auto_78035 ?auto_78036 ) ( ON ?auto_78033 ?auto_78034 ) ( not ( = ?auto_78034 ?auto_78033 ) ) ( not ( = ?auto_78034 ?auto_78035 ) ) ( ON ?auto_78030 ?auto_78029 ) ( ON ?auto_78031 ?auto_78030 ) ( ON ?auto_78028 ?auto_78031 ) ( ON ?auto_78032 ?auto_78028 ) ( ON ?auto_78034 ?auto_78032 ) ( not ( = ?auto_78029 ?auto_78030 ) ) ( not ( = ?auto_78029 ?auto_78031 ) ) ( not ( = ?auto_78029 ?auto_78028 ) ) ( not ( = ?auto_78029 ?auto_78032 ) ) ( not ( = ?auto_78029 ?auto_78034 ) ) ( not ( = ?auto_78029 ?auto_78033 ) ) ( not ( = ?auto_78029 ?auto_78035 ) ) ( not ( = ?auto_78030 ?auto_78031 ) ) ( not ( = ?auto_78030 ?auto_78028 ) ) ( not ( = ?auto_78030 ?auto_78032 ) ) ( not ( = ?auto_78030 ?auto_78034 ) ) ( not ( = ?auto_78030 ?auto_78033 ) ) ( not ( = ?auto_78030 ?auto_78035 ) ) ( not ( = ?auto_78031 ?auto_78028 ) ) ( not ( = ?auto_78031 ?auto_78032 ) ) ( not ( = ?auto_78031 ?auto_78034 ) ) ( not ( = ?auto_78031 ?auto_78033 ) ) ( not ( = ?auto_78031 ?auto_78035 ) ) ( not ( = ?auto_78028 ?auto_78032 ) ) ( not ( = ?auto_78028 ?auto_78034 ) ) ( not ( = ?auto_78028 ?auto_78033 ) ) ( not ( = ?auto_78028 ?auto_78035 ) ) ( not ( = ?auto_78032 ?auto_78034 ) ) ( not ( = ?auto_78032 ?auto_78033 ) ) ( not ( = ?auto_78032 ?auto_78035 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78034 ?auto_78033 ?auto_78035 )
      ( MAKE-7CRATE-VERIFY ?auto_78029 ?auto_78030 ?auto_78031 ?auto_78028 ?auto_78032 ?auto_78034 ?auto_78033 ?auto_78035 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78092 - SURFACE
      ?auto_78093 - SURFACE
      ?auto_78094 - SURFACE
      ?auto_78091 - SURFACE
      ?auto_78095 - SURFACE
      ?auto_78097 - SURFACE
      ?auto_78096 - SURFACE
      ?auto_78098 - SURFACE
    )
    :vars
    (
      ?auto_78102 - HOIST
      ?auto_78100 - PLACE
      ?auto_78101 - TRUCK
      ?auto_78099 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_78102 ?auto_78100 ) ( SURFACE-AT ?auto_78096 ?auto_78100 ) ( CLEAR ?auto_78096 ) ( IS-CRATE ?auto_78098 ) ( not ( = ?auto_78096 ?auto_78098 ) ) ( AVAILABLE ?auto_78102 ) ( IN ?auto_78098 ?auto_78101 ) ( ON ?auto_78096 ?auto_78097 ) ( not ( = ?auto_78097 ?auto_78096 ) ) ( not ( = ?auto_78097 ?auto_78098 ) ) ( TRUCK-AT ?auto_78101 ?auto_78099 ) ( not ( = ?auto_78099 ?auto_78100 ) ) ( ON ?auto_78093 ?auto_78092 ) ( ON ?auto_78094 ?auto_78093 ) ( ON ?auto_78091 ?auto_78094 ) ( ON ?auto_78095 ?auto_78091 ) ( ON ?auto_78097 ?auto_78095 ) ( not ( = ?auto_78092 ?auto_78093 ) ) ( not ( = ?auto_78092 ?auto_78094 ) ) ( not ( = ?auto_78092 ?auto_78091 ) ) ( not ( = ?auto_78092 ?auto_78095 ) ) ( not ( = ?auto_78092 ?auto_78097 ) ) ( not ( = ?auto_78092 ?auto_78096 ) ) ( not ( = ?auto_78092 ?auto_78098 ) ) ( not ( = ?auto_78093 ?auto_78094 ) ) ( not ( = ?auto_78093 ?auto_78091 ) ) ( not ( = ?auto_78093 ?auto_78095 ) ) ( not ( = ?auto_78093 ?auto_78097 ) ) ( not ( = ?auto_78093 ?auto_78096 ) ) ( not ( = ?auto_78093 ?auto_78098 ) ) ( not ( = ?auto_78094 ?auto_78091 ) ) ( not ( = ?auto_78094 ?auto_78095 ) ) ( not ( = ?auto_78094 ?auto_78097 ) ) ( not ( = ?auto_78094 ?auto_78096 ) ) ( not ( = ?auto_78094 ?auto_78098 ) ) ( not ( = ?auto_78091 ?auto_78095 ) ) ( not ( = ?auto_78091 ?auto_78097 ) ) ( not ( = ?auto_78091 ?auto_78096 ) ) ( not ( = ?auto_78091 ?auto_78098 ) ) ( not ( = ?auto_78095 ?auto_78097 ) ) ( not ( = ?auto_78095 ?auto_78096 ) ) ( not ( = ?auto_78095 ?auto_78098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78097 ?auto_78096 ?auto_78098 )
      ( MAKE-7CRATE-VERIFY ?auto_78092 ?auto_78093 ?auto_78094 ?auto_78091 ?auto_78095 ?auto_78097 ?auto_78096 ?auto_78098 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78162 - SURFACE
      ?auto_78163 - SURFACE
      ?auto_78164 - SURFACE
      ?auto_78161 - SURFACE
      ?auto_78165 - SURFACE
      ?auto_78167 - SURFACE
      ?auto_78166 - SURFACE
      ?auto_78168 - SURFACE
    )
    :vars
    (
      ?auto_78171 - HOIST
      ?auto_78172 - PLACE
      ?auto_78169 - TRUCK
      ?auto_78173 - PLACE
      ?auto_78170 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_78171 ?auto_78172 ) ( SURFACE-AT ?auto_78166 ?auto_78172 ) ( CLEAR ?auto_78166 ) ( IS-CRATE ?auto_78168 ) ( not ( = ?auto_78166 ?auto_78168 ) ) ( AVAILABLE ?auto_78171 ) ( ON ?auto_78166 ?auto_78167 ) ( not ( = ?auto_78167 ?auto_78166 ) ) ( not ( = ?auto_78167 ?auto_78168 ) ) ( TRUCK-AT ?auto_78169 ?auto_78173 ) ( not ( = ?auto_78173 ?auto_78172 ) ) ( HOIST-AT ?auto_78170 ?auto_78173 ) ( LIFTING ?auto_78170 ?auto_78168 ) ( not ( = ?auto_78171 ?auto_78170 ) ) ( ON ?auto_78163 ?auto_78162 ) ( ON ?auto_78164 ?auto_78163 ) ( ON ?auto_78161 ?auto_78164 ) ( ON ?auto_78165 ?auto_78161 ) ( ON ?auto_78167 ?auto_78165 ) ( not ( = ?auto_78162 ?auto_78163 ) ) ( not ( = ?auto_78162 ?auto_78164 ) ) ( not ( = ?auto_78162 ?auto_78161 ) ) ( not ( = ?auto_78162 ?auto_78165 ) ) ( not ( = ?auto_78162 ?auto_78167 ) ) ( not ( = ?auto_78162 ?auto_78166 ) ) ( not ( = ?auto_78162 ?auto_78168 ) ) ( not ( = ?auto_78163 ?auto_78164 ) ) ( not ( = ?auto_78163 ?auto_78161 ) ) ( not ( = ?auto_78163 ?auto_78165 ) ) ( not ( = ?auto_78163 ?auto_78167 ) ) ( not ( = ?auto_78163 ?auto_78166 ) ) ( not ( = ?auto_78163 ?auto_78168 ) ) ( not ( = ?auto_78164 ?auto_78161 ) ) ( not ( = ?auto_78164 ?auto_78165 ) ) ( not ( = ?auto_78164 ?auto_78167 ) ) ( not ( = ?auto_78164 ?auto_78166 ) ) ( not ( = ?auto_78164 ?auto_78168 ) ) ( not ( = ?auto_78161 ?auto_78165 ) ) ( not ( = ?auto_78161 ?auto_78167 ) ) ( not ( = ?auto_78161 ?auto_78166 ) ) ( not ( = ?auto_78161 ?auto_78168 ) ) ( not ( = ?auto_78165 ?auto_78167 ) ) ( not ( = ?auto_78165 ?auto_78166 ) ) ( not ( = ?auto_78165 ?auto_78168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78167 ?auto_78166 ?auto_78168 )
      ( MAKE-7CRATE-VERIFY ?auto_78162 ?auto_78163 ?auto_78164 ?auto_78161 ?auto_78165 ?auto_78167 ?auto_78166 ?auto_78168 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78239 - SURFACE
      ?auto_78240 - SURFACE
      ?auto_78241 - SURFACE
      ?auto_78238 - SURFACE
      ?auto_78242 - SURFACE
      ?auto_78244 - SURFACE
      ?auto_78243 - SURFACE
      ?auto_78245 - SURFACE
    )
    :vars
    (
      ?auto_78248 - HOIST
      ?auto_78247 - PLACE
      ?auto_78251 - TRUCK
      ?auto_78249 - PLACE
      ?auto_78250 - HOIST
      ?auto_78246 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_78248 ?auto_78247 ) ( SURFACE-AT ?auto_78243 ?auto_78247 ) ( CLEAR ?auto_78243 ) ( IS-CRATE ?auto_78245 ) ( not ( = ?auto_78243 ?auto_78245 ) ) ( AVAILABLE ?auto_78248 ) ( ON ?auto_78243 ?auto_78244 ) ( not ( = ?auto_78244 ?auto_78243 ) ) ( not ( = ?auto_78244 ?auto_78245 ) ) ( TRUCK-AT ?auto_78251 ?auto_78249 ) ( not ( = ?auto_78249 ?auto_78247 ) ) ( HOIST-AT ?auto_78250 ?auto_78249 ) ( not ( = ?auto_78248 ?auto_78250 ) ) ( AVAILABLE ?auto_78250 ) ( SURFACE-AT ?auto_78245 ?auto_78249 ) ( ON ?auto_78245 ?auto_78246 ) ( CLEAR ?auto_78245 ) ( not ( = ?auto_78243 ?auto_78246 ) ) ( not ( = ?auto_78245 ?auto_78246 ) ) ( not ( = ?auto_78244 ?auto_78246 ) ) ( ON ?auto_78240 ?auto_78239 ) ( ON ?auto_78241 ?auto_78240 ) ( ON ?auto_78238 ?auto_78241 ) ( ON ?auto_78242 ?auto_78238 ) ( ON ?auto_78244 ?auto_78242 ) ( not ( = ?auto_78239 ?auto_78240 ) ) ( not ( = ?auto_78239 ?auto_78241 ) ) ( not ( = ?auto_78239 ?auto_78238 ) ) ( not ( = ?auto_78239 ?auto_78242 ) ) ( not ( = ?auto_78239 ?auto_78244 ) ) ( not ( = ?auto_78239 ?auto_78243 ) ) ( not ( = ?auto_78239 ?auto_78245 ) ) ( not ( = ?auto_78239 ?auto_78246 ) ) ( not ( = ?auto_78240 ?auto_78241 ) ) ( not ( = ?auto_78240 ?auto_78238 ) ) ( not ( = ?auto_78240 ?auto_78242 ) ) ( not ( = ?auto_78240 ?auto_78244 ) ) ( not ( = ?auto_78240 ?auto_78243 ) ) ( not ( = ?auto_78240 ?auto_78245 ) ) ( not ( = ?auto_78240 ?auto_78246 ) ) ( not ( = ?auto_78241 ?auto_78238 ) ) ( not ( = ?auto_78241 ?auto_78242 ) ) ( not ( = ?auto_78241 ?auto_78244 ) ) ( not ( = ?auto_78241 ?auto_78243 ) ) ( not ( = ?auto_78241 ?auto_78245 ) ) ( not ( = ?auto_78241 ?auto_78246 ) ) ( not ( = ?auto_78238 ?auto_78242 ) ) ( not ( = ?auto_78238 ?auto_78244 ) ) ( not ( = ?auto_78238 ?auto_78243 ) ) ( not ( = ?auto_78238 ?auto_78245 ) ) ( not ( = ?auto_78238 ?auto_78246 ) ) ( not ( = ?auto_78242 ?auto_78244 ) ) ( not ( = ?auto_78242 ?auto_78243 ) ) ( not ( = ?auto_78242 ?auto_78245 ) ) ( not ( = ?auto_78242 ?auto_78246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78244 ?auto_78243 ?auto_78245 )
      ( MAKE-7CRATE-VERIFY ?auto_78239 ?auto_78240 ?auto_78241 ?auto_78238 ?auto_78242 ?auto_78244 ?auto_78243 ?auto_78245 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78317 - SURFACE
      ?auto_78318 - SURFACE
      ?auto_78319 - SURFACE
      ?auto_78316 - SURFACE
      ?auto_78320 - SURFACE
      ?auto_78322 - SURFACE
      ?auto_78321 - SURFACE
      ?auto_78323 - SURFACE
    )
    :vars
    (
      ?auto_78329 - HOIST
      ?auto_78328 - PLACE
      ?auto_78327 - PLACE
      ?auto_78325 - HOIST
      ?auto_78324 - SURFACE
      ?auto_78326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_78329 ?auto_78328 ) ( SURFACE-AT ?auto_78321 ?auto_78328 ) ( CLEAR ?auto_78321 ) ( IS-CRATE ?auto_78323 ) ( not ( = ?auto_78321 ?auto_78323 ) ) ( AVAILABLE ?auto_78329 ) ( ON ?auto_78321 ?auto_78322 ) ( not ( = ?auto_78322 ?auto_78321 ) ) ( not ( = ?auto_78322 ?auto_78323 ) ) ( not ( = ?auto_78327 ?auto_78328 ) ) ( HOIST-AT ?auto_78325 ?auto_78327 ) ( not ( = ?auto_78329 ?auto_78325 ) ) ( AVAILABLE ?auto_78325 ) ( SURFACE-AT ?auto_78323 ?auto_78327 ) ( ON ?auto_78323 ?auto_78324 ) ( CLEAR ?auto_78323 ) ( not ( = ?auto_78321 ?auto_78324 ) ) ( not ( = ?auto_78323 ?auto_78324 ) ) ( not ( = ?auto_78322 ?auto_78324 ) ) ( TRUCK-AT ?auto_78326 ?auto_78328 ) ( ON ?auto_78318 ?auto_78317 ) ( ON ?auto_78319 ?auto_78318 ) ( ON ?auto_78316 ?auto_78319 ) ( ON ?auto_78320 ?auto_78316 ) ( ON ?auto_78322 ?auto_78320 ) ( not ( = ?auto_78317 ?auto_78318 ) ) ( not ( = ?auto_78317 ?auto_78319 ) ) ( not ( = ?auto_78317 ?auto_78316 ) ) ( not ( = ?auto_78317 ?auto_78320 ) ) ( not ( = ?auto_78317 ?auto_78322 ) ) ( not ( = ?auto_78317 ?auto_78321 ) ) ( not ( = ?auto_78317 ?auto_78323 ) ) ( not ( = ?auto_78317 ?auto_78324 ) ) ( not ( = ?auto_78318 ?auto_78319 ) ) ( not ( = ?auto_78318 ?auto_78316 ) ) ( not ( = ?auto_78318 ?auto_78320 ) ) ( not ( = ?auto_78318 ?auto_78322 ) ) ( not ( = ?auto_78318 ?auto_78321 ) ) ( not ( = ?auto_78318 ?auto_78323 ) ) ( not ( = ?auto_78318 ?auto_78324 ) ) ( not ( = ?auto_78319 ?auto_78316 ) ) ( not ( = ?auto_78319 ?auto_78320 ) ) ( not ( = ?auto_78319 ?auto_78322 ) ) ( not ( = ?auto_78319 ?auto_78321 ) ) ( not ( = ?auto_78319 ?auto_78323 ) ) ( not ( = ?auto_78319 ?auto_78324 ) ) ( not ( = ?auto_78316 ?auto_78320 ) ) ( not ( = ?auto_78316 ?auto_78322 ) ) ( not ( = ?auto_78316 ?auto_78321 ) ) ( not ( = ?auto_78316 ?auto_78323 ) ) ( not ( = ?auto_78316 ?auto_78324 ) ) ( not ( = ?auto_78320 ?auto_78322 ) ) ( not ( = ?auto_78320 ?auto_78321 ) ) ( not ( = ?auto_78320 ?auto_78323 ) ) ( not ( = ?auto_78320 ?auto_78324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78322 ?auto_78321 ?auto_78323 )
      ( MAKE-7CRATE-VERIFY ?auto_78317 ?auto_78318 ?auto_78319 ?auto_78316 ?auto_78320 ?auto_78322 ?auto_78321 ?auto_78323 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78395 - SURFACE
      ?auto_78396 - SURFACE
      ?auto_78397 - SURFACE
      ?auto_78394 - SURFACE
      ?auto_78398 - SURFACE
      ?auto_78400 - SURFACE
      ?auto_78399 - SURFACE
      ?auto_78401 - SURFACE
    )
    :vars
    (
      ?auto_78402 - HOIST
      ?auto_78403 - PLACE
      ?auto_78405 - PLACE
      ?auto_78406 - HOIST
      ?auto_78404 - SURFACE
      ?auto_78407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_78402 ?auto_78403 ) ( IS-CRATE ?auto_78401 ) ( not ( = ?auto_78399 ?auto_78401 ) ) ( not ( = ?auto_78400 ?auto_78399 ) ) ( not ( = ?auto_78400 ?auto_78401 ) ) ( not ( = ?auto_78405 ?auto_78403 ) ) ( HOIST-AT ?auto_78406 ?auto_78405 ) ( not ( = ?auto_78402 ?auto_78406 ) ) ( AVAILABLE ?auto_78406 ) ( SURFACE-AT ?auto_78401 ?auto_78405 ) ( ON ?auto_78401 ?auto_78404 ) ( CLEAR ?auto_78401 ) ( not ( = ?auto_78399 ?auto_78404 ) ) ( not ( = ?auto_78401 ?auto_78404 ) ) ( not ( = ?auto_78400 ?auto_78404 ) ) ( TRUCK-AT ?auto_78407 ?auto_78403 ) ( SURFACE-AT ?auto_78400 ?auto_78403 ) ( CLEAR ?auto_78400 ) ( LIFTING ?auto_78402 ?auto_78399 ) ( IS-CRATE ?auto_78399 ) ( ON ?auto_78396 ?auto_78395 ) ( ON ?auto_78397 ?auto_78396 ) ( ON ?auto_78394 ?auto_78397 ) ( ON ?auto_78398 ?auto_78394 ) ( ON ?auto_78400 ?auto_78398 ) ( not ( = ?auto_78395 ?auto_78396 ) ) ( not ( = ?auto_78395 ?auto_78397 ) ) ( not ( = ?auto_78395 ?auto_78394 ) ) ( not ( = ?auto_78395 ?auto_78398 ) ) ( not ( = ?auto_78395 ?auto_78400 ) ) ( not ( = ?auto_78395 ?auto_78399 ) ) ( not ( = ?auto_78395 ?auto_78401 ) ) ( not ( = ?auto_78395 ?auto_78404 ) ) ( not ( = ?auto_78396 ?auto_78397 ) ) ( not ( = ?auto_78396 ?auto_78394 ) ) ( not ( = ?auto_78396 ?auto_78398 ) ) ( not ( = ?auto_78396 ?auto_78400 ) ) ( not ( = ?auto_78396 ?auto_78399 ) ) ( not ( = ?auto_78396 ?auto_78401 ) ) ( not ( = ?auto_78396 ?auto_78404 ) ) ( not ( = ?auto_78397 ?auto_78394 ) ) ( not ( = ?auto_78397 ?auto_78398 ) ) ( not ( = ?auto_78397 ?auto_78400 ) ) ( not ( = ?auto_78397 ?auto_78399 ) ) ( not ( = ?auto_78397 ?auto_78401 ) ) ( not ( = ?auto_78397 ?auto_78404 ) ) ( not ( = ?auto_78394 ?auto_78398 ) ) ( not ( = ?auto_78394 ?auto_78400 ) ) ( not ( = ?auto_78394 ?auto_78399 ) ) ( not ( = ?auto_78394 ?auto_78401 ) ) ( not ( = ?auto_78394 ?auto_78404 ) ) ( not ( = ?auto_78398 ?auto_78400 ) ) ( not ( = ?auto_78398 ?auto_78399 ) ) ( not ( = ?auto_78398 ?auto_78401 ) ) ( not ( = ?auto_78398 ?auto_78404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78400 ?auto_78399 ?auto_78401 )
      ( MAKE-7CRATE-VERIFY ?auto_78395 ?auto_78396 ?auto_78397 ?auto_78394 ?auto_78398 ?auto_78400 ?auto_78399 ?auto_78401 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78473 - SURFACE
      ?auto_78474 - SURFACE
      ?auto_78475 - SURFACE
      ?auto_78472 - SURFACE
      ?auto_78476 - SURFACE
      ?auto_78478 - SURFACE
      ?auto_78477 - SURFACE
      ?auto_78479 - SURFACE
    )
    :vars
    (
      ?auto_78484 - HOIST
      ?auto_78482 - PLACE
      ?auto_78480 - PLACE
      ?auto_78485 - HOIST
      ?auto_78483 - SURFACE
      ?auto_78481 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_78484 ?auto_78482 ) ( IS-CRATE ?auto_78479 ) ( not ( = ?auto_78477 ?auto_78479 ) ) ( not ( = ?auto_78478 ?auto_78477 ) ) ( not ( = ?auto_78478 ?auto_78479 ) ) ( not ( = ?auto_78480 ?auto_78482 ) ) ( HOIST-AT ?auto_78485 ?auto_78480 ) ( not ( = ?auto_78484 ?auto_78485 ) ) ( AVAILABLE ?auto_78485 ) ( SURFACE-AT ?auto_78479 ?auto_78480 ) ( ON ?auto_78479 ?auto_78483 ) ( CLEAR ?auto_78479 ) ( not ( = ?auto_78477 ?auto_78483 ) ) ( not ( = ?auto_78479 ?auto_78483 ) ) ( not ( = ?auto_78478 ?auto_78483 ) ) ( TRUCK-AT ?auto_78481 ?auto_78482 ) ( SURFACE-AT ?auto_78478 ?auto_78482 ) ( CLEAR ?auto_78478 ) ( IS-CRATE ?auto_78477 ) ( AVAILABLE ?auto_78484 ) ( IN ?auto_78477 ?auto_78481 ) ( ON ?auto_78474 ?auto_78473 ) ( ON ?auto_78475 ?auto_78474 ) ( ON ?auto_78472 ?auto_78475 ) ( ON ?auto_78476 ?auto_78472 ) ( ON ?auto_78478 ?auto_78476 ) ( not ( = ?auto_78473 ?auto_78474 ) ) ( not ( = ?auto_78473 ?auto_78475 ) ) ( not ( = ?auto_78473 ?auto_78472 ) ) ( not ( = ?auto_78473 ?auto_78476 ) ) ( not ( = ?auto_78473 ?auto_78478 ) ) ( not ( = ?auto_78473 ?auto_78477 ) ) ( not ( = ?auto_78473 ?auto_78479 ) ) ( not ( = ?auto_78473 ?auto_78483 ) ) ( not ( = ?auto_78474 ?auto_78475 ) ) ( not ( = ?auto_78474 ?auto_78472 ) ) ( not ( = ?auto_78474 ?auto_78476 ) ) ( not ( = ?auto_78474 ?auto_78478 ) ) ( not ( = ?auto_78474 ?auto_78477 ) ) ( not ( = ?auto_78474 ?auto_78479 ) ) ( not ( = ?auto_78474 ?auto_78483 ) ) ( not ( = ?auto_78475 ?auto_78472 ) ) ( not ( = ?auto_78475 ?auto_78476 ) ) ( not ( = ?auto_78475 ?auto_78478 ) ) ( not ( = ?auto_78475 ?auto_78477 ) ) ( not ( = ?auto_78475 ?auto_78479 ) ) ( not ( = ?auto_78475 ?auto_78483 ) ) ( not ( = ?auto_78472 ?auto_78476 ) ) ( not ( = ?auto_78472 ?auto_78478 ) ) ( not ( = ?auto_78472 ?auto_78477 ) ) ( not ( = ?auto_78472 ?auto_78479 ) ) ( not ( = ?auto_78472 ?auto_78483 ) ) ( not ( = ?auto_78476 ?auto_78478 ) ) ( not ( = ?auto_78476 ?auto_78477 ) ) ( not ( = ?auto_78476 ?auto_78479 ) ) ( not ( = ?auto_78476 ?auto_78483 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78478 ?auto_78477 ?auto_78479 )
      ( MAKE-7CRATE-VERIFY ?auto_78473 ?auto_78474 ?auto_78475 ?auto_78472 ?auto_78476 ?auto_78478 ?auto_78477 ?auto_78479 ) )
  )

)

