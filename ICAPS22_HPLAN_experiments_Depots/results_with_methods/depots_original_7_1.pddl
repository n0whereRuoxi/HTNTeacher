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
      ?auto_20524 - SURFACE
      ?auto_20525 - SURFACE
    )
    :vars
    (
      ?auto_20526 - HOIST
      ?auto_20527 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20526 ?auto_20527 ) ( SURFACE-AT ?auto_20525 ?auto_20527 ) ( CLEAR ?auto_20525 ) ( LIFTING ?auto_20526 ?auto_20524 ) ( IS-CRATE ?auto_20524 ) ( not ( = ?auto_20524 ?auto_20525 ) ) )
    :subtasks
    ( ( !DROP ?auto_20526 ?auto_20524 ?auto_20525 ?auto_20527 )
      ( MAKE-ON-VERIFY ?auto_20524 ?auto_20525 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20528 - SURFACE
      ?auto_20529 - SURFACE
    )
    :vars
    (
      ?auto_20530 - HOIST
      ?auto_20531 - PLACE
      ?auto_20532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20530 ?auto_20531 ) ( SURFACE-AT ?auto_20529 ?auto_20531 ) ( CLEAR ?auto_20529 ) ( IS-CRATE ?auto_20528 ) ( not ( = ?auto_20528 ?auto_20529 ) ) ( TRUCK-AT ?auto_20532 ?auto_20531 ) ( AVAILABLE ?auto_20530 ) ( IN ?auto_20528 ?auto_20532 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20530 ?auto_20528 ?auto_20532 ?auto_20531 )
      ( MAKE-ON ?auto_20528 ?auto_20529 )
      ( MAKE-ON-VERIFY ?auto_20528 ?auto_20529 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20533 - SURFACE
      ?auto_20534 - SURFACE
    )
    :vars
    (
      ?auto_20535 - HOIST
      ?auto_20536 - PLACE
      ?auto_20537 - TRUCK
      ?auto_20538 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20535 ?auto_20536 ) ( SURFACE-AT ?auto_20534 ?auto_20536 ) ( CLEAR ?auto_20534 ) ( IS-CRATE ?auto_20533 ) ( not ( = ?auto_20533 ?auto_20534 ) ) ( AVAILABLE ?auto_20535 ) ( IN ?auto_20533 ?auto_20537 ) ( TRUCK-AT ?auto_20537 ?auto_20538 ) ( not ( = ?auto_20538 ?auto_20536 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20537 ?auto_20538 ?auto_20536 )
      ( MAKE-ON ?auto_20533 ?auto_20534 )
      ( MAKE-ON-VERIFY ?auto_20533 ?auto_20534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20539 - SURFACE
      ?auto_20540 - SURFACE
    )
    :vars
    (
      ?auto_20544 - HOIST
      ?auto_20541 - PLACE
      ?auto_20542 - TRUCK
      ?auto_20543 - PLACE
      ?auto_20545 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20544 ?auto_20541 ) ( SURFACE-AT ?auto_20540 ?auto_20541 ) ( CLEAR ?auto_20540 ) ( IS-CRATE ?auto_20539 ) ( not ( = ?auto_20539 ?auto_20540 ) ) ( AVAILABLE ?auto_20544 ) ( TRUCK-AT ?auto_20542 ?auto_20543 ) ( not ( = ?auto_20543 ?auto_20541 ) ) ( HOIST-AT ?auto_20545 ?auto_20543 ) ( LIFTING ?auto_20545 ?auto_20539 ) ( not ( = ?auto_20544 ?auto_20545 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20545 ?auto_20539 ?auto_20542 ?auto_20543 )
      ( MAKE-ON ?auto_20539 ?auto_20540 )
      ( MAKE-ON-VERIFY ?auto_20539 ?auto_20540 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20546 - SURFACE
      ?auto_20547 - SURFACE
    )
    :vars
    (
      ?auto_20551 - HOIST
      ?auto_20549 - PLACE
      ?auto_20550 - TRUCK
      ?auto_20552 - PLACE
      ?auto_20548 - HOIST
      ?auto_20553 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20551 ?auto_20549 ) ( SURFACE-AT ?auto_20547 ?auto_20549 ) ( CLEAR ?auto_20547 ) ( IS-CRATE ?auto_20546 ) ( not ( = ?auto_20546 ?auto_20547 ) ) ( AVAILABLE ?auto_20551 ) ( TRUCK-AT ?auto_20550 ?auto_20552 ) ( not ( = ?auto_20552 ?auto_20549 ) ) ( HOIST-AT ?auto_20548 ?auto_20552 ) ( not ( = ?auto_20551 ?auto_20548 ) ) ( AVAILABLE ?auto_20548 ) ( SURFACE-AT ?auto_20546 ?auto_20552 ) ( ON ?auto_20546 ?auto_20553 ) ( CLEAR ?auto_20546 ) ( not ( = ?auto_20546 ?auto_20553 ) ) ( not ( = ?auto_20547 ?auto_20553 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20548 ?auto_20546 ?auto_20553 ?auto_20552 )
      ( MAKE-ON ?auto_20546 ?auto_20547 )
      ( MAKE-ON-VERIFY ?auto_20546 ?auto_20547 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20554 - SURFACE
      ?auto_20555 - SURFACE
    )
    :vars
    (
      ?auto_20560 - HOIST
      ?auto_20558 - PLACE
      ?auto_20556 - PLACE
      ?auto_20557 - HOIST
      ?auto_20561 - SURFACE
      ?auto_20559 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20560 ?auto_20558 ) ( SURFACE-AT ?auto_20555 ?auto_20558 ) ( CLEAR ?auto_20555 ) ( IS-CRATE ?auto_20554 ) ( not ( = ?auto_20554 ?auto_20555 ) ) ( AVAILABLE ?auto_20560 ) ( not ( = ?auto_20556 ?auto_20558 ) ) ( HOIST-AT ?auto_20557 ?auto_20556 ) ( not ( = ?auto_20560 ?auto_20557 ) ) ( AVAILABLE ?auto_20557 ) ( SURFACE-AT ?auto_20554 ?auto_20556 ) ( ON ?auto_20554 ?auto_20561 ) ( CLEAR ?auto_20554 ) ( not ( = ?auto_20554 ?auto_20561 ) ) ( not ( = ?auto_20555 ?auto_20561 ) ) ( TRUCK-AT ?auto_20559 ?auto_20558 ) )
    :subtasks
    ( ( !DRIVE ?auto_20559 ?auto_20558 ?auto_20556 )
      ( MAKE-ON ?auto_20554 ?auto_20555 )
      ( MAKE-ON-VERIFY ?auto_20554 ?auto_20555 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20564 - SURFACE
      ?auto_20565 - SURFACE
    )
    :vars
    (
      ?auto_20566 - HOIST
      ?auto_20567 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20566 ?auto_20567 ) ( SURFACE-AT ?auto_20565 ?auto_20567 ) ( CLEAR ?auto_20565 ) ( LIFTING ?auto_20566 ?auto_20564 ) ( IS-CRATE ?auto_20564 ) ( not ( = ?auto_20564 ?auto_20565 ) ) )
    :subtasks
    ( ( !DROP ?auto_20566 ?auto_20564 ?auto_20565 ?auto_20567 )
      ( MAKE-ON-VERIFY ?auto_20564 ?auto_20565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20568 - SURFACE
      ?auto_20569 - SURFACE
    )
    :vars
    (
      ?auto_20571 - HOIST
      ?auto_20570 - PLACE
      ?auto_20572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20571 ?auto_20570 ) ( SURFACE-AT ?auto_20569 ?auto_20570 ) ( CLEAR ?auto_20569 ) ( IS-CRATE ?auto_20568 ) ( not ( = ?auto_20568 ?auto_20569 ) ) ( TRUCK-AT ?auto_20572 ?auto_20570 ) ( AVAILABLE ?auto_20571 ) ( IN ?auto_20568 ?auto_20572 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20571 ?auto_20568 ?auto_20572 ?auto_20570 )
      ( MAKE-ON ?auto_20568 ?auto_20569 )
      ( MAKE-ON-VERIFY ?auto_20568 ?auto_20569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20573 - SURFACE
      ?auto_20574 - SURFACE
    )
    :vars
    (
      ?auto_20576 - HOIST
      ?auto_20575 - PLACE
      ?auto_20577 - TRUCK
      ?auto_20578 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20576 ?auto_20575 ) ( SURFACE-AT ?auto_20574 ?auto_20575 ) ( CLEAR ?auto_20574 ) ( IS-CRATE ?auto_20573 ) ( not ( = ?auto_20573 ?auto_20574 ) ) ( AVAILABLE ?auto_20576 ) ( IN ?auto_20573 ?auto_20577 ) ( TRUCK-AT ?auto_20577 ?auto_20578 ) ( not ( = ?auto_20578 ?auto_20575 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20577 ?auto_20578 ?auto_20575 )
      ( MAKE-ON ?auto_20573 ?auto_20574 )
      ( MAKE-ON-VERIFY ?auto_20573 ?auto_20574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20579 - SURFACE
      ?auto_20580 - SURFACE
    )
    :vars
    (
      ?auto_20581 - HOIST
      ?auto_20584 - PLACE
      ?auto_20582 - TRUCK
      ?auto_20583 - PLACE
      ?auto_20585 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20581 ?auto_20584 ) ( SURFACE-AT ?auto_20580 ?auto_20584 ) ( CLEAR ?auto_20580 ) ( IS-CRATE ?auto_20579 ) ( not ( = ?auto_20579 ?auto_20580 ) ) ( AVAILABLE ?auto_20581 ) ( TRUCK-AT ?auto_20582 ?auto_20583 ) ( not ( = ?auto_20583 ?auto_20584 ) ) ( HOIST-AT ?auto_20585 ?auto_20583 ) ( LIFTING ?auto_20585 ?auto_20579 ) ( not ( = ?auto_20581 ?auto_20585 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20585 ?auto_20579 ?auto_20582 ?auto_20583 )
      ( MAKE-ON ?auto_20579 ?auto_20580 )
      ( MAKE-ON-VERIFY ?auto_20579 ?auto_20580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20586 - SURFACE
      ?auto_20587 - SURFACE
    )
    :vars
    (
      ?auto_20592 - HOIST
      ?auto_20590 - PLACE
      ?auto_20591 - TRUCK
      ?auto_20588 - PLACE
      ?auto_20589 - HOIST
      ?auto_20593 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20592 ?auto_20590 ) ( SURFACE-AT ?auto_20587 ?auto_20590 ) ( CLEAR ?auto_20587 ) ( IS-CRATE ?auto_20586 ) ( not ( = ?auto_20586 ?auto_20587 ) ) ( AVAILABLE ?auto_20592 ) ( TRUCK-AT ?auto_20591 ?auto_20588 ) ( not ( = ?auto_20588 ?auto_20590 ) ) ( HOIST-AT ?auto_20589 ?auto_20588 ) ( not ( = ?auto_20592 ?auto_20589 ) ) ( AVAILABLE ?auto_20589 ) ( SURFACE-AT ?auto_20586 ?auto_20588 ) ( ON ?auto_20586 ?auto_20593 ) ( CLEAR ?auto_20586 ) ( not ( = ?auto_20586 ?auto_20593 ) ) ( not ( = ?auto_20587 ?auto_20593 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20589 ?auto_20586 ?auto_20593 ?auto_20588 )
      ( MAKE-ON ?auto_20586 ?auto_20587 )
      ( MAKE-ON-VERIFY ?auto_20586 ?auto_20587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20594 - SURFACE
      ?auto_20595 - SURFACE
    )
    :vars
    (
      ?auto_20598 - HOIST
      ?auto_20601 - PLACE
      ?auto_20600 - PLACE
      ?auto_20599 - HOIST
      ?auto_20597 - SURFACE
      ?auto_20596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20598 ?auto_20601 ) ( SURFACE-AT ?auto_20595 ?auto_20601 ) ( CLEAR ?auto_20595 ) ( IS-CRATE ?auto_20594 ) ( not ( = ?auto_20594 ?auto_20595 ) ) ( AVAILABLE ?auto_20598 ) ( not ( = ?auto_20600 ?auto_20601 ) ) ( HOIST-AT ?auto_20599 ?auto_20600 ) ( not ( = ?auto_20598 ?auto_20599 ) ) ( AVAILABLE ?auto_20599 ) ( SURFACE-AT ?auto_20594 ?auto_20600 ) ( ON ?auto_20594 ?auto_20597 ) ( CLEAR ?auto_20594 ) ( not ( = ?auto_20594 ?auto_20597 ) ) ( not ( = ?auto_20595 ?auto_20597 ) ) ( TRUCK-AT ?auto_20596 ?auto_20601 ) )
    :subtasks
    ( ( !DRIVE ?auto_20596 ?auto_20601 ?auto_20600 )
      ( MAKE-ON ?auto_20594 ?auto_20595 )
      ( MAKE-ON-VERIFY ?auto_20594 ?auto_20595 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20602 - SURFACE
      ?auto_20603 - SURFACE
    )
    :vars
    (
      ?auto_20607 - HOIST
      ?auto_20609 - PLACE
      ?auto_20606 - PLACE
      ?auto_20605 - HOIST
      ?auto_20608 - SURFACE
      ?auto_20604 - TRUCK
      ?auto_20610 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20607 ?auto_20609 ) ( IS-CRATE ?auto_20602 ) ( not ( = ?auto_20602 ?auto_20603 ) ) ( not ( = ?auto_20606 ?auto_20609 ) ) ( HOIST-AT ?auto_20605 ?auto_20606 ) ( not ( = ?auto_20607 ?auto_20605 ) ) ( AVAILABLE ?auto_20605 ) ( SURFACE-AT ?auto_20602 ?auto_20606 ) ( ON ?auto_20602 ?auto_20608 ) ( CLEAR ?auto_20602 ) ( not ( = ?auto_20602 ?auto_20608 ) ) ( not ( = ?auto_20603 ?auto_20608 ) ) ( TRUCK-AT ?auto_20604 ?auto_20609 ) ( SURFACE-AT ?auto_20610 ?auto_20609 ) ( CLEAR ?auto_20610 ) ( LIFTING ?auto_20607 ?auto_20603 ) ( IS-CRATE ?auto_20603 ) ( not ( = ?auto_20602 ?auto_20610 ) ) ( not ( = ?auto_20603 ?auto_20610 ) ) ( not ( = ?auto_20608 ?auto_20610 ) ) )
    :subtasks
    ( ( !DROP ?auto_20607 ?auto_20603 ?auto_20610 ?auto_20609 )
      ( MAKE-ON ?auto_20602 ?auto_20603 )
      ( MAKE-ON-VERIFY ?auto_20602 ?auto_20603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20611 - SURFACE
      ?auto_20612 - SURFACE
    )
    :vars
    (
      ?auto_20618 - HOIST
      ?auto_20613 - PLACE
      ?auto_20614 - PLACE
      ?auto_20617 - HOIST
      ?auto_20615 - SURFACE
      ?auto_20619 - TRUCK
      ?auto_20616 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20618 ?auto_20613 ) ( IS-CRATE ?auto_20611 ) ( not ( = ?auto_20611 ?auto_20612 ) ) ( not ( = ?auto_20614 ?auto_20613 ) ) ( HOIST-AT ?auto_20617 ?auto_20614 ) ( not ( = ?auto_20618 ?auto_20617 ) ) ( AVAILABLE ?auto_20617 ) ( SURFACE-AT ?auto_20611 ?auto_20614 ) ( ON ?auto_20611 ?auto_20615 ) ( CLEAR ?auto_20611 ) ( not ( = ?auto_20611 ?auto_20615 ) ) ( not ( = ?auto_20612 ?auto_20615 ) ) ( TRUCK-AT ?auto_20619 ?auto_20613 ) ( SURFACE-AT ?auto_20616 ?auto_20613 ) ( CLEAR ?auto_20616 ) ( IS-CRATE ?auto_20612 ) ( not ( = ?auto_20611 ?auto_20616 ) ) ( not ( = ?auto_20612 ?auto_20616 ) ) ( not ( = ?auto_20615 ?auto_20616 ) ) ( AVAILABLE ?auto_20618 ) ( IN ?auto_20612 ?auto_20619 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20618 ?auto_20612 ?auto_20619 ?auto_20613 )
      ( MAKE-ON ?auto_20611 ?auto_20612 )
      ( MAKE-ON-VERIFY ?auto_20611 ?auto_20612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20620 - SURFACE
      ?auto_20621 - SURFACE
    )
    :vars
    (
      ?auto_20628 - HOIST
      ?auto_20627 - PLACE
      ?auto_20626 - PLACE
      ?auto_20622 - HOIST
      ?auto_20623 - SURFACE
      ?auto_20625 - SURFACE
      ?auto_20624 - TRUCK
      ?auto_20629 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20628 ?auto_20627 ) ( IS-CRATE ?auto_20620 ) ( not ( = ?auto_20620 ?auto_20621 ) ) ( not ( = ?auto_20626 ?auto_20627 ) ) ( HOIST-AT ?auto_20622 ?auto_20626 ) ( not ( = ?auto_20628 ?auto_20622 ) ) ( AVAILABLE ?auto_20622 ) ( SURFACE-AT ?auto_20620 ?auto_20626 ) ( ON ?auto_20620 ?auto_20623 ) ( CLEAR ?auto_20620 ) ( not ( = ?auto_20620 ?auto_20623 ) ) ( not ( = ?auto_20621 ?auto_20623 ) ) ( SURFACE-AT ?auto_20625 ?auto_20627 ) ( CLEAR ?auto_20625 ) ( IS-CRATE ?auto_20621 ) ( not ( = ?auto_20620 ?auto_20625 ) ) ( not ( = ?auto_20621 ?auto_20625 ) ) ( not ( = ?auto_20623 ?auto_20625 ) ) ( AVAILABLE ?auto_20628 ) ( IN ?auto_20621 ?auto_20624 ) ( TRUCK-AT ?auto_20624 ?auto_20629 ) ( not ( = ?auto_20629 ?auto_20627 ) ) ( not ( = ?auto_20626 ?auto_20629 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20624 ?auto_20629 ?auto_20627 )
      ( MAKE-ON ?auto_20620 ?auto_20621 )
      ( MAKE-ON-VERIFY ?auto_20620 ?auto_20621 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20630 - SURFACE
      ?auto_20631 - SURFACE
    )
    :vars
    (
      ?auto_20636 - HOIST
      ?auto_20633 - PLACE
      ?auto_20637 - PLACE
      ?auto_20632 - HOIST
      ?auto_20638 - SURFACE
      ?auto_20635 - SURFACE
      ?auto_20639 - TRUCK
      ?auto_20634 - PLACE
      ?auto_20640 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20636 ?auto_20633 ) ( IS-CRATE ?auto_20630 ) ( not ( = ?auto_20630 ?auto_20631 ) ) ( not ( = ?auto_20637 ?auto_20633 ) ) ( HOIST-AT ?auto_20632 ?auto_20637 ) ( not ( = ?auto_20636 ?auto_20632 ) ) ( AVAILABLE ?auto_20632 ) ( SURFACE-AT ?auto_20630 ?auto_20637 ) ( ON ?auto_20630 ?auto_20638 ) ( CLEAR ?auto_20630 ) ( not ( = ?auto_20630 ?auto_20638 ) ) ( not ( = ?auto_20631 ?auto_20638 ) ) ( SURFACE-AT ?auto_20635 ?auto_20633 ) ( CLEAR ?auto_20635 ) ( IS-CRATE ?auto_20631 ) ( not ( = ?auto_20630 ?auto_20635 ) ) ( not ( = ?auto_20631 ?auto_20635 ) ) ( not ( = ?auto_20638 ?auto_20635 ) ) ( AVAILABLE ?auto_20636 ) ( TRUCK-AT ?auto_20639 ?auto_20634 ) ( not ( = ?auto_20634 ?auto_20633 ) ) ( not ( = ?auto_20637 ?auto_20634 ) ) ( HOIST-AT ?auto_20640 ?auto_20634 ) ( LIFTING ?auto_20640 ?auto_20631 ) ( not ( = ?auto_20636 ?auto_20640 ) ) ( not ( = ?auto_20632 ?auto_20640 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20640 ?auto_20631 ?auto_20639 ?auto_20634 )
      ( MAKE-ON ?auto_20630 ?auto_20631 )
      ( MAKE-ON-VERIFY ?auto_20630 ?auto_20631 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20641 - SURFACE
      ?auto_20642 - SURFACE
    )
    :vars
    (
      ?auto_20646 - HOIST
      ?auto_20650 - PLACE
      ?auto_20647 - PLACE
      ?auto_20651 - HOIST
      ?auto_20643 - SURFACE
      ?auto_20645 - SURFACE
      ?auto_20648 - TRUCK
      ?auto_20649 - PLACE
      ?auto_20644 - HOIST
      ?auto_20652 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20646 ?auto_20650 ) ( IS-CRATE ?auto_20641 ) ( not ( = ?auto_20641 ?auto_20642 ) ) ( not ( = ?auto_20647 ?auto_20650 ) ) ( HOIST-AT ?auto_20651 ?auto_20647 ) ( not ( = ?auto_20646 ?auto_20651 ) ) ( AVAILABLE ?auto_20651 ) ( SURFACE-AT ?auto_20641 ?auto_20647 ) ( ON ?auto_20641 ?auto_20643 ) ( CLEAR ?auto_20641 ) ( not ( = ?auto_20641 ?auto_20643 ) ) ( not ( = ?auto_20642 ?auto_20643 ) ) ( SURFACE-AT ?auto_20645 ?auto_20650 ) ( CLEAR ?auto_20645 ) ( IS-CRATE ?auto_20642 ) ( not ( = ?auto_20641 ?auto_20645 ) ) ( not ( = ?auto_20642 ?auto_20645 ) ) ( not ( = ?auto_20643 ?auto_20645 ) ) ( AVAILABLE ?auto_20646 ) ( TRUCK-AT ?auto_20648 ?auto_20649 ) ( not ( = ?auto_20649 ?auto_20650 ) ) ( not ( = ?auto_20647 ?auto_20649 ) ) ( HOIST-AT ?auto_20644 ?auto_20649 ) ( not ( = ?auto_20646 ?auto_20644 ) ) ( not ( = ?auto_20651 ?auto_20644 ) ) ( AVAILABLE ?auto_20644 ) ( SURFACE-AT ?auto_20642 ?auto_20649 ) ( ON ?auto_20642 ?auto_20652 ) ( CLEAR ?auto_20642 ) ( not ( = ?auto_20641 ?auto_20652 ) ) ( not ( = ?auto_20642 ?auto_20652 ) ) ( not ( = ?auto_20643 ?auto_20652 ) ) ( not ( = ?auto_20645 ?auto_20652 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20644 ?auto_20642 ?auto_20652 ?auto_20649 )
      ( MAKE-ON ?auto_20641 ?auto_20642 )
      ( MAKE-ON-VERIFY ?auto_20641 ?auto_20642 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20653 - SURFACE
      ?auto_20654 - SURFACE
    )
    :vars
    (
      ?auto_20661 - HOIST
      ?auto_20664 - PLACE
      ?auto_20662 - PLACE
      ?auto_20659 - HOIST
      ?auto_20658 - SURFACE
      ?auto_20663 - SURFACE
      ?auto_20656 - PLACE
      ?auto_20655 - HOIST
      ?auto_20657 - SURFACE
      ?auto_20660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20661 ?auto_20664 ) ( IS-CRATE ?auto_20653 ) ( not ( = ?auto_20653 ?auto_20654 ) ) ( not ( = ?auto_20662 ?auto_20664 ) ) ( HOIST-AT ?auto_20659 ?auto_20662 ) ( not ( = ?auto_20661 ?auto_20659 ) ) ( AVAILABLE ?auto_20659 ) ( SURFACE-AT ?auto_20653 ?auto_20662 ) ( ON ?auto_20653 ?auto_20658 ) ( CLEAR ?auto_20653 ) ( not ( = ?auto_20653 ?auto_20658 ) ) ( not ( = ?auto_20654 ?auto_20658 ) ) ( SURFACE-AT ?auto_20663 ?auto_20664 ) ( CLEAR ?auto_20663 ) ( IS-CRATE ?auto_20654 ) ( not ( = ?auto_20653 ?auto_20663 ) ) ( not ( = ?auto_20654 ?auto_20663 ) ) ( not ( = ?auto_20658 ?auto_20663 ) ) ( AVAILABLE ?auto_20661 ) ( not ( = ?auto_20656 ?auto_20664 ) ) ( not ( = ?auto_20662 ?auto_20656 ) ) ( HOIST-AT ?auto_20655 ?auto_20656 ) ( not ( = ?auto_20661 ?auto_20655 ) ) ( not ( = ?auto_20659 ?auto_20655 ) ) ( AVAILABLE ?auto_20655 ) ( SURFACE-AT ?auto_20654 ?auto_20656 ) ( ON ?auto_20654 ?auto_20657 ) ( CLEAR ?auto_20654 ) ( not ( = ?auto_20653 ?auto_20657 ) ) ( not ( = ?auto_20654 ?auto_20657 ) ) ( not ( = ?auto_20658 ?auto_20657 ) ) ( not ( = ?auto_20663 ?auto_20657 ) ) ( TRUCK-AT ?auto_20660 ?auto_20664 ) )
    :subtasks
    ( ( !DRIVE ?auto_20660 ?auto_20664 ?auto_20656 )
      ( MAKE-ON ?auto_20653 ?auto_20654 )
      ( MAKE-ON-VERIFY ?auto_20653 ?auto_20654 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20667 - SURFACE
      ?auto_20668 - SURFACE
    )
    :vars
    (
      ?auto_20669 - HOIST
      ?auto_20670 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20669 ?auto_20670 ) ( SURFACE-AT ?auto_20668 ?auto_20670 ) ( CLEAR ?auto_20668 ) ( LIFTING ?auto_20669 ?auto_20667 ) ( IS-CRATE ?auto_20667 ) ( not ( = ?auto_20667 ?auto_20668 ) ) )
    :subtasks
    ( ( !DROP ?auto_20669 ?auto_20667 ?auto_20668 ?auto_20670 )
      ( MAKE-ON-VERIFY ?auto_20667 ?auto_20668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20671 - SURFACE
      ?auto_20672 - SURFACE
    )
    :vars
    (
      ?auto_20674 - HOIST
      ?auto_20673 - PLACE
      ?auto_20675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20674 ?auto_20673 ) ( SURFACE-AT ?auto_20672 ?auto_20673 ) ( CLEAR ?auto_20672 ) ( IS-CRATE ?auto_20671 ) ( not ( = ?auto_20671 ?auto_20672 ) ) ( TRUCK-AT ?auto_20675 ?auto_20673 ) ( AVAILABLE ?auto_20674 ) ( IN ?auto_20671 ?auto_20675 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20674 ?auto_20671 ?auto_20675 ?auto_20673 )
      ( MAKE-ON ?auto_20671 ?auto_20672 )
      ( MAKE-ON-VERIFY ?auto_20671 ?auto_20672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20676 - SURFACE
      ?auto_20677 - SURFACE
    )
    :vars
    (
      ?auto_20678 - HOIST
      ?auto_20679 - PLACE
      ?auto_20680 - TRUCK
      ?auto_20681 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20678 ?auto_20679 ) ( SURFACE-AT ?auto_20677 ?auto_20679 ) ( CLEAR ?auto_20677 ) ( IS-CRATE ?auto_20676 ) ( not ( = ?auto_20676 ?auto_20677 ) ) ( AVAILABLE ?auto_20678 ) ( IN ?auto_20676 ?auto_20680 ) ( TRUCK-AT ?auto_20680 ?auto_20681 ) ( not ( = ?auto_20681 ?auto_20679 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20680 ?auto_20681 ?auto_20679 )
      ( MAKE-ON ?auto_20676 ?auto_20677 )
      ( MAKE-ON-VERIFY ?auto_20676 ?auto_20677 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20682 - SURFACE
      ?auto_20683 - SURFACE
    )
    :vars
    (
      ?auto_20684 - HOIST
      ?auto_20686 - PLACE
      ?auto_20687 - TRUCK
      ?auto_20685 - PLACE
      ?auto_20688 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20684 ?auto_20686 ) ( SURFACE-AT ?auto_20683 ?auto_20686 ) ( CLEAR ?auto_20683 ) ( IS-CRATE ?auto_20682 ) ( not ( = ?auto_20682 ?auto_20683 ) ) ( AVAILABLE ?auto_20684 ) ( TRUCK-AT ?auto_20687 ?auto_20685 ) ( not ( = ?auto_20685 ?auto_20686 ) ) ( HOIST-AT ?auto_20688 ?auto_20685 ) ( LIFTING ?auto_20688 ?auto_20682 ) ( not ( = ?auto_20684 ?auto_20688 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20688 ?auto_20682 ?auto_20687 ?auto_20685 )
      ( MAKE-ON ?auto_20682 ?auto_20683 )
      ( MAKE-ON-VERIFY ?auto_20682 ?auto_20683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20689 - SURFACE
      ?auto_20690 - SURFACE
    )
    :vars
    (
      ?auto_20693 - HOIST
      ?auto_20692 - PLACE
      ?auto_20694 - TRUCK
      ?auto_20691 - PLACE
      ?auto_20695 - HOIST
      ?auto_20696 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20693 ?auto_20692 ) ( SURFACE-AT ?auto_20690 ?auto_20692 ) ( CLEAR ?auto_20690 ) ( IS-CRATE ?auto_20689 ) ( not ( = ?auto_20689 ?auto_20690 ) ) ( AVAILABLE ?auto_20693 ) ( TRUCK-AT ?auto_20694 ?auto_20691 ) ( not ( = ?auto_20691 ?auto_20692 ) ) ( HOIST-AT ?auto_20695 ?auto_20691 ) ( not ( = ?auto_20693 ?auto_20695 ) ) ( AVAILABLE ?auto_20695 ) ( SURFACE-AT ?auto_20689 ?auto_20691 ) ( ON ?auto_20689 ?auto_20696 ) ( CLEAR ?auto_20689 ) ( not ( = ?auto_20689 ?auto_20696 ) ) ( not ( = ?auto_20690 ?auto_20696 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20695 ?auto_20689 ?auto_20696 ?auto_20691 )
      ( MAKE-ON ?auto_20689 ?auto_20690 )
      ( MAKE-ON-VERIFY ?auto_20689 ?auto_20690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20697 - SURFACE
      ?auto_20698 - SURFACE
    )
    :vars
    (
      ?auto_20699 - HOIST
      ?auto_20701 - PLACE
      ?auto_20702 - PLACE
      ?auto_20704 - HOIST
      ?auto_20703 - SURFACE
      ?auto_20700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20699 ?auto_20701 ) ( SURFACE-AT ?auto_20698 ?auto_20701 ) ( CLEAR ?auto_20698 ) ( IS-CRATE ?auto_20697 ) ( not ( = ?auto_20697 ?auto_20698 ) ) ( AVAILABLE ?auto_20699 ) ( not ( = ?auto_20702 ?auto_20701 ) ) ( HOIST-AT ?auto_20704 ?auto_20702 ) ( not ( = ?auto_20699 ?auto_20704 ) ) ( AVAILABLE ?auto_20704 ) ( SURFACE-AT ?auto_20697 ?auto_20702 ) ( ON ?auto_20697 ?auto_20703 ) ( CLEAR ?auto_20697 ) ( not ( = ?auto_20697 ?auto_20703 ) ) ( not ( = ?auto_20698 ?auto_20703 ) ) ( TRUCK-AT ?auto_20700 ?auto_20701 ) )
    :subtasks
    ( ( !DRIVE ?auto_20700 ?auto_20701 ?auto_20702 )
      ( MAKE-ON ?auto_20697 ?auto_20698 )
      ( MAKE-ON-VERIFY ?auto_20697 ?auto_20698 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20705 - SURFACE
      ?auto_20706 - SURFACE
    )
    :vars
    (
      ?auto_20712 - HOIST
      ?auto_20707 - PLACE
      ?auto_20708 - PLACE
      ?auto_20710 - HOIST
      ?auto_20711 - SURFACE
      ?auto_20709 - TRUCK
      ?auto_20713 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20712 ?auto_20707 ) ( IS-CRATE ?auto_20705 ) ( not ( = ?auto_20705 ?auto_20706 ) ) ( not ( = ?auto_20708 ?auto_20707 ) ) ( HOIST-AT ?auto_20710 ?auto_20708 ) ( not ( = ?auto_20712 ?auto_20710 ) ) ( AVAILABLE ?auto_20710 ) ( SURFACE-AT ?auto_20705 ?auto_20708 ) ( ON ?auto_20705 ?auto_20711 ) ( CLEAR ?auto_20705 ) ( not ( = ?auto_20705 ?auto_20711 ) ) ( not ( = ?auto_20706 ?auto_20711 ) ) ( TRUCK-AT ?auto_20709 ?auto_20707 ) ( SURFACE-AT ?auto_20713 ?auto_20707 ) ( CLEAR ?auto_20713 ) ( LIFTING ?auto_20712 ?auto_20706 ) ( IS-CRATE ?auto_20706 ) ( not ( = ?auto_20705 ?auto_20713 ) ) ( not ( = ?auto_20706 ?auto_20713 ) ) ( not ( = ?auto_20711 ?auto_20713 ) ) )
    :subtasks
    ( ( !DROP ?auto_20712 ?auto_20706 ?auto_20713 ?auto_20707 )
      ( MAKE-ON ?auto_20705 ?auto_20706 )
      ( MAKE-ON-VERIFY ?auto_20705 ?auto_20706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20714 - SURFACE
      ?auto_20715 - SURFACE
    )
    :vars
    (
      ?auto_20722 - HOIST
      ?auto_20721 - PLACE
      ?auto_20720 - PLACE
      ?auto_20718 - HOIST
      ?auto_20717 - SURFACE
      ?auto_20719 - TRUCK
      ?auto_20716 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20722 ?auto_20721 ) ( IS-CRATE ?auto_20714 ) ( not ( = ?auto_20714 ?auto_20715 ) ) ( not ( = ?auto_20720 ?auto_20721 ) ) ( HOIST-AT ?auto_20718 ?auto_20720 ) ( not ( = ?auto_20722 ?auto_20718 ) ) ( AVAILABLE ?auto_20718 ) ( SURFACE-AT ?auto_20714 ?auto_20720 ) ( ON ?auto_20714 ?auto_20717 ) ( CLEAR ?auto_20714 ) ( not ( = ?auto_20714 ?auto_20717 ) ) ( not ( = ?auto_20715 ?auto_20717 ) ) ( TRUCK-AT ?auto_20719 ?auto_20721 ) ( SURFACE-AT ?auto_20716 ?auto_20721 ) ( CLEAR ?auto_20716 ) ( IS-CRATE ?auto_20715 ) ( not ( = ?auto_20714 ?auto_20716 ) ) ( not ( = ?auto_20715 ?auto_20716 ) ) ( not ( = ?auto_20717 ?auto_20716 ) ) ( AVAILABLE ?auto_20722 ) ( IN ?auto_20715 ?auto_20719 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20722 ?auto_20715 ?auto_20719 ?auto_20721 )
      ( MAKE-ON ?auto_20714 ?auto_20715 )
      ( MAKE-ON-VERIFY ?auto_20714 ?auto_20715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20723 - SURFACE
      ?auto_20724 - SURFACE
    )
    :vars
    (
      ?auto_20726 - HOIST
      ?auto_20728 - PLACE
      ?auto_20731 - PLACE
      ?auto_20725 - HOIST
      ?auto_20727 - SURFACE
      ?auto_20730 - SURFACE
      ?auto_20729 - TRUCK
      ?auto_20732 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20726 ?auto_20728 ) ( IS-CRATE ?auto_20723 ) ( not ( = ?auto_20723 ?auto_20724 ) ) ( not ( = ?auto_20731 ?auto_20728 ) ) ( HOIST-AT ?auto_20725 ?auto_20731 ) ( not ( = ?auto_20726 ?auto_20725 ) ) ( AVAILABLE ?auto_20725 ) ( SURFACE-AT ?auto_20723 ?auto_20731 ) ( ON ?auto_20723 ?auto_20727 ) ( CLEAR ?auto_20723 ) ( not ( = ?auto_20723 ?auto_20727 ) ) ( not ( = ?auto_20724 ?auto_20727 ) ) ( SURFACE-AT ?auto_20730 ?auto_20728 ) ( CLEAR ?auto_20730 ) ( IS-CRATE ?auto_20724 ) ( not ( = ?auto_20723 ?auto_20730 ) ) ( not ( = ?auto_20724 ?auto_20730 ) ) ( not ( = ?auto_20727 ?auto_20730 ) ) ( AVAILABLE ?auto_20726 ) ( IN ?auto_20724 ?auto_20729 ) ( TRUCK-AT ?auto_20729 ?auto_20732 ) ( not ( = ?auto_20732 ?auto_20728 ) ) ( not ( = ?auto_20731 ?auto_20732 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20729 ?auto_20732 ?auto_20728 )
      ( MAKE-ON ?auto_20723 ?auto_20724 )
      ( MAKE-ON-VERIFY ?auto_20723 ?auto_20724 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20733 - SURFACE
      ?auto_20734 - SURFACE
    )
    :vars
    (
      ?auto_20740 - HOIST
      ?auto_20737 - PLACE
      ?auto_20739 - PLACE
      ?auto_20742 - HOIST
      ?auto_20736 - SURFACE
      ?auto_20738 - SURFACE
      ?auto_20741 - TRUCK
      ?auto_20735 - PLACE
      ?auto_20743 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20740 ?auto_20737 ) ( IS-CRATE ?auto_20733 ) ( not ( = ?auto_20733 ?auto_20734 ) ) ( not ( = ?auto_20739 ?auto_20737 ) ) ( HOIST-AT ?auto_20742 ?auto_20739 ) ( not ( = ?auto_20740 ?auto_20742 ) ) ( AVAILABLE ?auto_20742 ) ( SURFACE-AT ?auto_20733 ?auto_20739 ) ( ON ?auto_20733 ?auto_20736 ) ( CLEAR ?auto_20733 ) ( not ( = ?auto_20733 ?auto_20736 ) ) ( not ( = ?auto_20734 ?auto_20736 ) ) ( SURFACE-AT ?auto_20738 ?auto_20737 ) ( CLEAR ?auto_20738 ) ( IS-CRATE ?auto_20734 ) ( not ( = ?auto_20733 ?auto_20738 ) ) ( not ( = ?auto_20734 ?auto_20738 ) ) ( not ( = ?auto_20736 ?auto_20738 ) ) ( AVAILABLE ?auto_20740 ) ( TRUCK-AT ?auto_20741 ?auto_20735 ) ( not ( = ?auto_20735 ?auto_20737 ) ) ( not ( = ?auto_20739 ?auto_20735 ) ) ( HOIST-AT ?auto_20743 ?auto_20735 ) ( LIFTING ?auto_20743 ?auto_20734 ) ( not ( = ?auto_20740 ?auto_20743 ) ) ( not ( = ?auto_20742 ?auto_20743 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20743 ?auto_20734 ?auto_20741 ?auto_20735 )
      ( MAKE-ON ?auto_20733 ?auto_20734 )
      ( MAKE-ON-VERIFY ?auto_20733 ?auto_20734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20744 - SURFACE
      ?auto_20745 - SURFACE
    )
    :vars
    (
      ?auto_20753 - HOIST
      ?auto_20748 - PLACE
      ?auto_20754 - PLACE
      ?auto_20746 - HOIST
      ?auto_20749 - SURFACE
      ?auto_20750 - SURFACE
      ?auto_20747 - TRUCK
      ?auto_20752 - PLACE
      ?auto_20751 - HOIST
      ?auto_20755 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20753 ?auto_20748 ) ( IS-CRATE ?auto_20744 ) ( not ( = ?auto_20744 ?auto_20745 ) ) ( not ( = ?auto_20754 ?auto_20748 ) ) ( HOIST-AT ?auto_20746 ?auto_20754 ) ( not ( = ?auto_20753 ?auto_20746 ) ) ( AVAILABLE ?auto_20746 ) ( SURFACE-AT ?auto_20744 ?auto_20754 ) ( ON ?auto_20744 ?auto_20749 ) ( CLEAR ?auto_20744 ) ( not ( = ?auto_20744 ?auto_20749 ) ) ( not ( = ?auto_20745 ?auto_20749 ) ) ( SURFACE-AT ?auto_20750 ?auto_20748 ) ( CLEAR ?auto_20750 ) ( IS-CRATE ?auto_20745 ) ( not ( = ?auto_20744 ?auto_20750 ) ) ( not ( = ?auto_20745 ?auto_20750 ) ) ( not ( = ?auto_20749 ?auto_20750 ) ) ( AVAILABLE ?auto_20753 ) ( TRUCK-AT ?auto_20747 ?auto_20752 ) ( not ( = ?auto_20752 ?auto_20748 ) ) ( not ( = ?auto_20754 ?auto_20752 ) ) ( HOIST-AT ?auto_20751 ?auto_20752 ) ( not ( = ?auto_20753 ?auto_20751 ) ) ( not ( = ?auto_20746 ?auto_20751 ) ) ( AVAILABLE ?auto_20751 ) ( SURFACE-AT ?auto_20745 ?auto_20752 ) ( ON ?auto_20745 ?auto_20755 ) ( CLEAR ?auto_20745 ) ( not ( = ?auto_20744 ?auto_20755 ) ) ( not ( = ?auto_20745 ?auto_20755 ) ) ( not ( = ?auto_20749 ?auto_20755 ) ) ( not ( = ?auto_20750 ?auto_20755 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20751 ?auto_20745 ?auto_20755 ?auto_20752 )
      ( MAKE-ON ?auto_20744 ?auto_20745 )
      ( MAKE-ON-VERIFY ?auto_20744 ?auto_20745 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20756 - SURFACE
      ?auto_20757 - SURFACE
    )
    :vars
    (
      ?auto_20764 - HOIST
      ?auto_20760 - PLACE
      ?auto_20767 - PLACE
      ?auto_20763 - HOIST
      ?auto_20762 - SURFACE
      ?auto_20766 - SURFACE
      ?auto_20765 - PLACE
      ?auto_20758 - HOIST
      ?auto_20761 - SURFACE
      ?auto_20759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20764 ?auto_20760 ) ( IS-CRATE ?auto_20756 ) ( not ( = ?auto_20756 ?auto_20757 ) ) ( not ( = ?auto_20767 ?auto_20760 ) ) ( HOIST-AT ?auto_20763 ?auto_20767 ) ( not ( = ?auto_20764 ?auto_20763 ) ) ( AVAILABLE ?auto_20763 ) ( SURFACE-AT ?auto_20756 ?auto_20767 ) ( ON ?auto_20756 ?auto_20762 ) ( CLEAR ?auto_20756 ) ( not ( = ?auto_20756 ?auto_20762 ) ) ( not ( = ?auto_20757 ?auto_20762 ) ) ( SURFACE-AT ?auto_20766 ?auto_20760 ) ( CLEAR ?auto_20766 ) ( IS-CRATE ?auto_20757 ) ( not ( = ?auto_20756 ?auto_20766 ) ) ( not ( = ?auto_20757 ?auto_20766 ) ) ( not ( = ?auto_20762 ?auto_20766 ) ) ( AVAILABLE ?auto_20764 ) ( not ( = ?auto_20765 ?auto_20760 ) ) ( not ( = ?auto_20767 ?auto_20765 ) ) ( HOIST-AT ?auto_20758 ?auto_20765 ) ( not ( = ?auto_20764 ?auto_20758 ) ) ( not ( = ?auto_20763 ?auto_20758 ) ) ( AVAILABLE ?auto_20758 ) ( SURFACE-AT ?auto_20757 ?auto_20765 ) ( ON ?auto_20757 ?auto_20761 ) ( CLEAR ?auto_20757 ) ( not ( = ?auto_20756 ?auto_20761 ) ) ( not ( = ?auto_20757 ?auto_20761 ) ) ( not ( = ?auto_20762 ?auto_20761 ) ) ( not ( = ?auto_20766 ?auto_20761 ) ) ( TRUCK-AT ?auto_20759 ?auto_20760 ) )
    :subtasks
    ( ( !DRIVE ?auto_20759 ?auto_20760 ?auto_20765 )
      ( MAKE-ON ?auto_20756 ?auto_20757 )
      ( MAKE-ON-VERIFY ?auto_20756 ?auto_20757 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20768 - SURFACE
      ?auto_20769 - SURFACE
    )
    :vars
    (
      ?auto_20774 - HOIST
      ?auto_20770 - PLACE
      ?auto_20777 - PLACE
      ?auto_20771 - HOIST
      ?auto_20776 - SURFACE
      ?auto_20779 - SURFACE
      ?auto_20778 - PLACE
      ?auto_20772 - HOIST
      ?auto_20773 - SURFACE
      ?auto_20775 - TRUCK
      ?auto_20780 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20774 ?auto_20770 ) ( IS-CRATE ?auto_20768 ) ( not ( = ?auto_20768 ?auto_20769 ) ) ( not ( = ?auto_20777 ?auto_20770 ) ) ( HOIST-AT ?auto_20771 ?auto_20777 ) ( not ( = ?auto_20774 ?auto_20771 ) ) ( AVAILABLE ?auto_20771 ) ( SURFACE-AT ?auto_20768 ?auto_20777 ) ( ON ?auto_20768 ?auto_20776 ) ( CLEAR ?auto_20768 ) ( not ( = ?auto_20768 ?auto_20776 ) ) ( not ( = ?auto_20769 ?auto_20776 ) ) ( IS-CRATE ?auto_20769 ) ( not ( = ?auto_20768 ?auto_20779 ) ) ( not ( = ?auto_20769 ?auto_20779 ) ) ( not ( = ?auto_20776 ?auto_20779 ) ) ( not ( = ?auto_20778 ?auto_20770 ) ) ( not ( = ?auto_20777 ?auto_20778 ) ) ( HOIST-AT ?auto_20772 ?auto_20778 ) ( not ( = ?auto_20774 ?auto_20772 ) ) ( not ( = ?auto_20771 ?auto_20772 ) ) ( AVAILABLE ?auto_20772 ) ( SURFACE-AT ?auto_20769 ?auto_20778 ) ( ON ?auto_20769 ?auto_20773 ) ( CLEAR ?auto_20769 ) ( not ( = ?auto_20768 ?auto_20773 ) ) ( not ( = ?auto_20769 ?auto_20773 ) ) ( not ( = ?auto_20776 ?auto_20773 ) ) ( not ( = ?auto_20779 ?auto_20773 ) ) ( TRUCK-AT ?auto_20775 ?auto_20770 ) ( SURFACE-AT ?auto_20780 ?auto_20770 ) ( CLEAR ?auto_20780 ) ( LIFTING ?auto_20774 ?auto_20779 ) ( IS-CRATE ?auto_20779 ) ( not ( = ?auto_20768 ?auto_20780 ) ) ( not ( = ?auto_20769 ?auto_20780 ) ) ( not ( = ?auto_20776 ?auto_20780 ) ) ( not ( = ?auto_20779 ?auto_20780 ) ) ( not ( = ?auto_20773 ?auto_20780 ) ) )
    :subtasks
    ( ( !DROP ?auto_20774 ?auto_20779 ?auto_20780 ?auto_20770 )
      ( MAKE-ON ?auto_20768 ?auto_20769 )
      ( MAKE-ON-VERIFY ?auto_20768 ?auto_20769 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20781 - SURFACE
      ?auto_20782 - SURFACE
    )
    :vars
    (
      ?auto_20784 - HOIST
      ?auto_20788 - PLACE
      ?auto_20793 - PLACE
      ?auto_20783 - HOIST
      ?auto_20786 - SURFACE
      ?auto_20785 - SURFACE
      ?auto_20791 - PLACE
      ?auto_20790 - HOIST
      ?auto_20787 - SURFACE
      ?auto_20792 - TRUCK
      ?auto_20789 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20784 ?auto_20788 ) ( IS-CRATE ?auto_20781 ) ( not ( = ?auto_20781 ?auto_20782 ) ) ( not ( = ?auto_20793 ?auto_20788 ) ) ( HOIST-AT ?auto_20783 ?auto_20793 ) ( not ( = ?auto_20784 ?auto_20783 ) ) ( AVAILABLE ?auto_20783 ) ( SURFACE-AT ?auto_20781 ?auto_20793 ) ( ON ?auto_20781 ?auto_20786 ) ( CLEAR ?auto_20781 ) ( not ( = ?auto_20781 ?auto_20786 ) ) ( not ( = ?auto_20782 ?auto_20786 ) ) ( IS-CRATE ?auto_20782 ) ( not ( = ?auto_20781 ?auto_20785 ) ) ( not ( = ?auto_20782 ?auto_20785 ) ) ( not ( = ?auto_20786 ?auto_20785 ) ) ( not ( = ?auto_20791 ?auto_20788 ) ) ( not ( = ?auto_20793 ?auto_20791 ) ) ( HOIST-AT ?auto_20790 ?auto_20791 ) ( not ( = ?auto_20784 ?auto_20790 ) ) ( not ( = ?auto_20783 ?auto_20790 ) ) ( AVAILABLE ?auto_20790 ) ( SURFACE-AT ?auto_20782 ?auto_20791 ) ( ON ?auto_20782 ?auto_20787 ) ( CLEAR ?auto_20782 ) ( not ( = ?auto_20781 ?auto_20787 ) ) ( not ( = ?auto_20782 ?auto_20787 ) ) ( not ( = ?auto_20786 ?auto_20787 ) ) ( not ( = ?auto_20785 ?auto_20787 ) ) ( TRUCK-AT ?auto_20792 ?auto_20788 ) ( SURFACE-AT ?auto_20789 ?auto_20788 ) ( CLEAR ?auto_20789 ) ( IS-CRATE ?auto_20785 ) ( not ( = ?auto_20781 ?auto_20789 ) ) ( not ( = ?auto_20782 ?auto_20789 ) ) ( not ( = ?auto_20786 ?auto_20789 ) ) ( not ( = ?auto_20785 ?auto_20789 ) ) ( not ( = ?auto_20787 ?auto_20789 ) ) ( AVAILABLE ?auto_20784 ) ( IN ?auto_20785 ?auto_20792 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20784 ?auto_20785 ?auto_20792 ?auto_20788 )
      ( MAKE-ON ?auto_20781 ?auto_20782 )
      ( MAKE-ON-VERIFY ?auto_20781 ?auto_20782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20794 - SURFACE
      ?auto_20795 - SURFACE
    )
    :vars
    (
      ?auto_20803 - HOIST
      ?auto_20798 - PLACE
      ?auto_20801 - PLACE
      ?auto_20806 - HOIST
      ?auto_20797 - SURFACE
      ?auto_20799 - SURFACE
      ?auto_20802 - PLACE
      ?auto_20796 - HOIST
      ?auto_20800 - SURFACE
      ?auto_20804 - SURFACE
      ?auto_20805 - TRUCK
      ?auto_20807 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20803 ?auto_20798 ) ( IS-CRATE ?auto_20794 ) ( not ( = ?auto_20794 ?auto_20795 ) ) ( not ( = ?auto_20801 ?auto_20798 ) ) ( HOIST-AT ?auto_20806 ?auto_20801 ) ( not ( = ?auto_20803 ?auto_20806 ) ) ( AVAILABLE ?auto_20806 ) ( SURFACE-AT ?auto_20794 ?auto_20801 ) ( ON ?auto_20794 ?auto_20797 ) ( CLEAR ?auto_20794 ) ( not ( = ?auto_20794 ?auto_20797 ) ) ( not ( = ?auto_20795 ?auto_20797 ) ) ( IS-CRATE ?auto_20795 ) ( not ( = ?auto_20794 ?auto_20799 ) ) ( not ( = ?auto_20795 ?auto_20799 ) ) ( not ( = ?auto_20797 ?auto_20799 ) ) ( not ( = ?auto_20802 ?auto_20798 ) ) ( not ( = ?auto_20801 ?auto_20802 ) ) ( HOIST-AT ?auto_20796 ?auto_20802 ) ( not ( = ?auto_20803 ?auto_20796 ) ) ( not ( = ?auto_20806 ?auto_20796 ) ) ( AVAILABLE ?auto_20796 ) ( SURFACE-AT ?auto_20795 ?auto_20802 ) ( ON ?auto_20795 ?auto_20800 ) ( CLEAR ?auto_20795 ) ( not ( = ?auto_20794 ?auto_20800 ) ) ( not ( = ?auto_20795 ?auto_20800 ) ) ( not ( = ?auto_20797 ?auto_20800 ) ) ( not ( = ?auto_20799 ?auto_20800 ) ) ( SURFACE-AT ?auto_20804 ?auto_20798 ) ( CLEAR ?auto_20804 ) ( IS-CRATE ?auto_20799 ) ( not ( = ?auto_20794 ?auto_20804 ) ) ( not ( = ?auto_20795 ?auto_20804 ) ) ( not ( = ?auto_20797 ?auto_20804 ) ) ( not ( = ?auto_20799 ?auto_20804 ) ) ( not ( = ?auto_20800 ?auto_20804 ) ) ( AVAILABLE ?auto_20803 ) ( IN ?auto_20799 ?auto_20805 ) ( TRUCK-AT ?auto_20805 ?auto_20807 ) ( not ( = ?auto_20807 ?auto_20798 ) ) ( not ( = ?auto_20801 ?auto_20807 ) ) ( not ( = ?auto_20802 ?auto_20807 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20805 ?auto_20807 ?auto_20798 )
      ( MAKE-ON ?auto_20794 ?auto_20795 )
      ( MAKE-ON-VERIFY ?auto_20794 ?auto_20795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20808 - SURFACE
      ?auto_20809 - SURFACE
    )
    :vars
    (
      ?auto_20819 - HOIST
      ?auto_20818 - PLACE
      ?auto_20817 - PLACE
      ?auto_20810 - HOIST
      ?auto_20812 - SURFACE
      ?auto_20821 - SURFACE
      ?auto_20811 - PLACE
      ?auto_20815 - HOIST
      ?auto_20814 - SURFACE
      ?auto_20816 - SURFACE
      ?auto_20820 - TRUCK
      ?auto_20813 - PLACE
      ?auto_20822 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20819 ?auto_20818 ) ( IS-CRATE ?auto_20808 ) ( not ( = ?auto_20808 ?auto_20809 ) ) ( not ( = ?auto_20817 ?auto_20818 ) ) ( HOIST-AT ?auto_20810 ?auto_20817 ) ( not ( = ?auto_20819 ?auto_20810 ) ) ( AVAILABLE ?auto_20810 ) ( SURFACE-AT ?auto_20808 ?auto_20817 ) ( ON ?auto_20808 ?auto_20812 ) ( CLEAR ?auto_20808 ) ( not ( = ?auto_20808 ?auto_20812 ) ) ( not ( = ?auto_20809 ?auto_20812 ) ) ( IS-CRATE ?auto_20809 ) ( not ( = ?auto_20808 ?auto_20821 ) ) ( not ( = ?auto_20809 ?auto_20821 ) ) ( not ( = ?auto_20812 ?auto_20821 ) ) ( not ( = ?auto_20811 ?auto_20818 ) ) ( not ( = ?auto_20817 ?auto_20811 ) ) ( HOIST-AT ?auto_20815 ?auto_20811 ) ( not ( = ?auto_20819 ?auto_20815 ) ) ( not ( = ?auto_20810 ?auto_20815 ) ) ( AVAILABLE ?auto_20815 ) ( SURFACE-AT ?auto_20809 ?auto_20811 ) ( ON ?auto_20809 ?auto_20814 ) ( CLEAR ?auto_20809 ) ( not ( = ?auto_20808 ?auto_20814 ) ) ( not ( = ?auto_20809 ?auto_20814 ) ) ( not ( = ?auto_20812 ?auto_20814 ) ) ( not ( = ?auto_20821 ?auto_20814 ) ) ( SURFACE-AT ?auto_20816 ?auto_20818 ) ( CLEAR ?auto_20816 ) ( IS-CRATE ?auto_20821 ) ( not ( = ?auto_20808 ?auto_20816 ) ) ( not ( = ?auto_20809 ?auto_20816 ) ) ( not ( = ?auto_20812 ?auto_20816 ) ) ( not ( = ?auto_20821 ?auto_20816 ) ) ( not ( = ?auto_20814 ?auto_20816 ) ) ( AVAILABLE ?auto_20819 ) ( TRUCK-AT ?auto_20820 ?auto_20813 ) ( not ( = ?auto_20813 ?auto_20818 ) ) ( not ( = ?auto_20817 ?auto_20813 ) ) ( not ( = ?auto_20811 ?auto_20813 ) ) ( HOIST-AT ?auto_20822 ?auto_20813 ) ( LIFTING ?auto_20822 ?auto_20821 ) ( not ( = ?auto_20819 ?auto_20822 ) ) ( not ( = ?auto_20810 ?auto_20822 ) ) ( not ( = ?auto_20815 ?auto_20822 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20822 ?auto_20821 ?auto_20820 ?auto_20813 )
      ( MAKE-ON ?auto_20808 ?auto_20809 )
      ( MAKE-ON-VERIFY ?auto_20808 ?auto_20809 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20823 - SURFACE
      ?auto_20824 - SURFACE
    )
    :vars
    (
      ?auto_20825 - HOIST
      ?auto_20826 - PLACE
      ?auto_20833 - PLACE
      ?auto_20834 - HOIST
      ?auto_20835 - SURFACE
      ?auto_20830 - SURFACE
      ?auto_20831 - PLACE
      ?auto_20827 - HOIST
      ?auto_20829 - SURFACE
      ?auto_20837 - SURFACE
      ?auto_20828 - TRUCK
      ?auto_20832 - PLACE
      ?auto_20836 - HOIST
      ?auto_20838 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20825 ?auto_20826 ) ( IS-CRATE ?auto_20823 ) ( not ( = ?auto_20823 ?auto_20824 ) ) ( not ( = ?auto_20833 ?auto_20826 ) ) ( HOIST-AT ?auto_20834 ?auto_20833 ) ( not ( = ?auto_20825 ?auto_20834 ) ) ( AVAILABLE ?auto_20834 ) ( SURFACE-AT ?auto_20823 ?auto_20833 ) ( ON ?auto_20823 ?auto_20835 ) ( CLEAR ?auto_20823 ) ( not ( = ?auto_20823 ?auto_20835 ) ) ( not ( = ?auto_20824 ?auto_20835 ) ) ( IS-CRATE ?auto_20824 ) ( not ( = ?auto_20823 ?auto_20830 ) ) ( not ( = ?auto_20824 ?auto_20830 ) ) ( not ( = ?auto_20835 ?auto_20830 ) ) ( not ( = ?auto_20831 ?auto_20826 ) ) ( not ( = ?auto_20833 ?auto_20831 ) ) ( HOIST-AT ?auto_20827 ?auto_20831 ) ( not ( = ?auto_20825 ?auto_20827 ) ) ( not ( = ?auto_20834 ?auto_20827 ) ) ( AVAILABLE ?auto_20827 ) ( SURFACE-AT ?auto_20824 ?auto_20831 ) ( ON ?auto_20824 ?auto_20829 ) ( CLEAR ?auto_20824 ) ( not ( = ?auto_20823 ?auto_20829 ) ) ( not ( = ?auto_20824 ?auto_20829 ) ) ( not ( = ?auto_20835 ?auto_20829 ) ) ( not ( = ?auto_20830 ?auto_20829 ) ) ( SURFACE-AT ?auto_20837 ?auto_20826 ) ( CLEAR ?auto_20837 ) ( IS-CRATE ?auto_20830 ) ( not ( = ?auto_20823 ?auto_20837 ) ) ( not ( = ?auto_20824 ?auto_20837 ) ) ( not ( = ?auto_20835 ?auto_20837 ) ) ( not ( = ?auto_20830 ?auto_20837 ) ) ( not ( = ?auto_20829 ?auto_20837 ) ) ( AVAILABLE ?auto_20825 ) ( TRUCK-AT ?auto_20828 ?auto_20832 ) ( not ( = ?auto_20832 ?auto_20826 ) ) ( not ( = ?auto_20833 ?auto_20832 ) ) ( not ( = ?auto_20831 ?auto_20832 ) ) ( HOIST-AT ?auto_20836 ?auto_20832 ) ( not ( = ?auto_20825 ?auto_20836 ) ) ( not ( = ?auto_20834 ?auto_20836 ) ) ( not ( = ?auto_20827 ?auto_20836 ) ) ( AVAILABLE ?auto_20836 ) ( SURFACE-AT ?auto_20830 ?auto_20832 ) ( ON ?auto_20830 ?auto_20838 ) ( CLEAR ?auto_20830 ) ( not ( = ?auto_20823 ?auto_20838 ) ) ( not ( = ?auto_20824 ?auto_20838 ) ) ( not ( = ?auto_20835 ?auto_20838 ) ) ( not ( = ?auto_20830 ?auto_20838 ) ) ( not ( = ?auto_20829 ?auto_20838 ) ) ( not ( = ?auto_20837 ?auto_20838 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20836 ?auto_20830 ?auto_20838 ?auto_20832 )
      ( MAKE-ON ?auto_20823 ?auto_20824 )
      ( MAKE-ON-VERIFY ?auto_20823 ?auto_20824 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20839 - SURFACE
      ?auto_20840 - SURFACE
    )
    :vars
    (
      ?auto_20845 - HOIST
      ?auto_20841 - PLACE
      ?auto_20843 - PLACE
      ?auto_20853 - HOIST
      ?auto_20848 - SURFACE
      ?auto_20851 - SURFACE
      ?auto_20842 - PLACE
      ?auto_20844 - HOIST
      ?auto_20852 - SURFACE
      ?auto_20847 - SURFACE
      ?auto_20854 - PLACE
      ?auto_20846 - HOIST
      ?auto_20849 - SURFACE
      ?auto_20850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20845 ?auto_20841 ) ( IS-CRATE ?auto_20839 ) ( not ( = ?auto_20839 ?auto_20840 ) ) ( not ( = ?auto_20843 ?auto_20841 ) ) ( HOIST-AT ?auto_20853 ?auto_20843 ) ( not ( = ?auto_20845 ?auto_20853 ) ) ( AVAILABLE ?auto_20853 ) ( SURFACE-AT ?auto_20839 ?auto_20843 ) ( ON ?auto_20839 ?auto_20848 ) ( CLEAR ?auto_20839 ) ( not ( = ?auto_20839 ?auto_20848 ) ) ( not ( = ?auto_20840 ?auto_20848 ) ) ( IS-CRATE ?auto_20840 ) ( not ( = ?auto_20839 ?auto_20851 ) ) ( not ( = ?auto_20840 ?auto_20851 ) ) ( not ( = ?auto_20848 ?auto_20851 ) ) ( not ( = ?auto_20842 ?auto_20841 ) ) ( not ( = ?auto_20843 ?auto_20842 ) ) ( HOIST-AT ?auto_20844 ?auto_20842 ) ( not ( = ?auto_20845 ?auto_20844 ) ) ( not ( = ?auto_20853 ?auto_20844 ) ) ( AVAILABLE ?auto_20844 ) ( SURFACE-AT ?auto_20840 ?auto_20842 ) ( ON ?auto_20840 ?auto_20852 ) ( CLEAR ?auto_20840 ) ( not ( = ?auto_20839 ?auto_20852 ) ) ( not ( = ?auto_20840 ?auto_20852 ) ) ( not ( = ?auto_20848 ?auto_20852 ) ) ( not ( = ?auto_20851 ?auto_20852 ) ) ( SURFACE-AT ?auto_20847 ?auto_20841 ) ( CLEAR ?auto_20847 ) ( IS-CRATE ?auto_20851 ) ( not ( = ?auto_20839 ?auto_20847 ) ) ( not ( = ?auto_20840 ?auto_20847 ) ) ( not ( = ?auto_20848 ?auto_20847 ) ) ( not ( = ?auto_20851 ?auto_20847 ) ) ( not ( = ?auto_20852 ?auto_20847 ) ) ( AVAILABLE ?auto_20845 ) ( not ( = ?auto_20854 ?auto_20841 ) ) ( not ( = ?auto_20843 ?auto_20854 ) ) ( not ( = ?auto_20842 ?auto_20854 ) ) ( HOIST-AT ?auto_20846 ?auto_20854 ) ( not ( = ?auto_20845 ?auto_20846 ) ) ( not ( = ?auto_20853 ?auto_20846 ) ) ( not ( = ?auto_20844 ?auto_20846 ) ) ( AVAILABLE ?auto_20846 ) ( SURFACE-AT ?auto_20851 ?auto_20854 ) ( ON ?auto_20851 ?auto_20849 ) ( CLEAR ?auto_20851 ) ( not ( = ?auto_20839 ?auto_20849 ) ) ( not ( = ?auto_20840 ?auto_20849 ) ) ( not ( = ?auto_20848 ?auto_20849 ) ) ( not ( = ?auto_20851 ?auto_20849 ) ) ( not ( = ?auto_20852 ?auto_20849 ) ) ( not ( = ?auto_20847 ?auto_20849 ) ) ( TRUCK-AT ?auto_20850 ?auto_20841 ) )
    :subtasks
    ( ( !DRIVE ?auto_20850 ?auto_20841 ?auto_20854 )
      ( MAKE-ON ?auto_20839 ?auto_20840 )
      ( MAKE-ON-VERIFY ?auto_20839 ?auto_20840 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20857 - SURFACE
      ?auto_20858 - SURFACE
    )
    :vars
    (
      ?auto_20859 - HOIST
      ?auto_20860 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20859 ?auto_20860 ) ( SURFACE-AT ?auto_20858 ?auto_20860 ) ( CLEAR ?auto_20858 ) ( LIFTING ?auto_20859 ?auto_20857 ) ( IS-CRATE ?auto_20857 ) ( not ( = ?auto_20857 ?auto_20858 ) ) )
    :subtasks
    ( ( !DROP ?auto_20859 ?auto_20857 ?auto_20858 ?auto_20860 )
      ( MAKE-ON-VERIFY ?auto_20857 ?auto_20858 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20861 - SURFACE
      ?auto_20862 - SURFACE
    )
    :vars
    (
      ?auto_20864 - HOIST
      ?auto_20863 - PLACE
      ?auto_20865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20864 ?auto_20863 ) ( SURFACE-AT ?auto_20862 ?auto_20863 ) ( CLEAR ?auto_20862 ) ( IS-CRATE ?auto_20861 ) ( not ( = ?auto_20861 ?auto_20862 ) ) ( TRUCK-AT ?auto_20865 ?auto_20863 ) ( AVAILABLE ?auto_20864 ) ( IN ?auto_20861 ?auto_20865 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20864 ?auto_20861 ?auto_20865 ?auto_20863 )
      ( MAKE-ON ?auto_20861 ?auto_20862 )
      ( MAKE-ON-VERIFY ?auto_20861 ?auto_20862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20866 - SURFACE
      ?auto_20867 - SURFACE
    )
    :vars
    (
      ?auto_20869 - HOIST
      ?auto_20868 - PLACE
      ?auto_20870 - TRUCK
      ?auto_20871 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20869 ?auto_20868 ) ( SURFACE-AT ?auto_20867 ?auto_20868 ) ( CLEAR ?auto_20867 ) ( IS-CRATE ?auto_20866 ) ( not ( = ?auto_20866 ?auto_20867 ) ) ( AVAILABLE ?auto_20869 ) ( IN ?auto_20866 ?auto_20870 ) ( TRUCK-AT ?auto_20870 ?auto_20871 ) ( not ( = ?auto_20871 ?auto_20868 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20870 ?auto_20871 ?auto_20868 )
      ( MAKE-ON ?auto_20866 ?auto_20867 )
      ( MAKE-ON-VERIFY ?auto_20866 ?auto_20867 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20872 - SURFACE
      ?auto_20873 - SURFACE
    )
    :vars
    (
      ?auto_20877 - HOIST
      ?auto_20876 - PLACE
      ?auto_20875 - TRUCK
      ?auto_20874 - PLACE
      ?auto_20878 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20877 ?auto_20876 ) ( SURFACE-AT ?auto_20873 ?auto_20876 ) ( CLEAR ?auto_20873 ) ( IS-CRATE ?auto_20872 ) ( not ( = ?auto_20872 ?auto_20873 ) ) ( AVAILABLE ?auto_20877 ) ( TRUCK-AT ?auto_20875 ?auto_20874 ) ( not ( = ?auto_20874 ?auto_20876 ) ) ( HOIST-AT ?auto_20878 ?auto_20874 ) ( LIFTING ?auto_20878 ?auto_20872 ) ( not ( = ?auto_20877 ?auto_20878 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20878 ?auto_20872 ?auto_20875 ?auto_20874 )
      ( MAKE-ON ?auto_20872 ?auto_20873 )
      ( MAKE-ON-VERIFY ?auto_20872 ?auto_20873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20879 - SURFACE
      ?auto_20880 - SURFACE
    )
    :vars
    (
      ?auto_20881 - HOIST
      ?auto_20883 - PLACE
      ?auto_20884 - TRUCK
      ?auto_20885 - PLACE
      ?auto_20882 - HOIST
      ?auto_20886 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20881 ?auto_20883 ) ( SURFACE-AT ?auto_20880 ?auto_20883 ) ( CLEAR ?auto_20880 ) ( IS-CRATE ?auto_20879 ) ( not ( = ?auto_20879 ?auto_20880 ) ) ( AVAILABLE ?auto_20881 ) ( TRUCK-AT ?auto_20884 ?auto_20885 ) ( not ( = ?auto_20885 ?auto_20883 ) ) ( HOIST-AT ?auto_20882 ?auto_20885 ) ( not ( = ?auto_20881 ?auto_20882 ) ) ( AVAILABLE ?auto_20882 ) ( SURFACE-AT ?auto_20879 ?auto_20885 ) ( ON ?auto_20879 ?auto_20886 ) ( CLEAR ?auto_20879 ) ( not ( = ?auto_20879 ?auto_20886 ) ) ( not ( = ?auto_20880 ?auto_20886 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20882 ?auto_20879 ?auto_20886 ?auto_20885 )
      ( MAKE-ON ?auto_20879 ?auto_20880 )
      ( MAKE-ON-VERIFY ?auto_20879 ?auto_20880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20887 - SURFACE
      ?auto_20888 - SURFACE
    )
    :vars
    (
      ?auto_20894 - HOIST
      ?auto_20889 - PLACE
      ?auto_20890 - PLACE
      ?auto_20891 - HOIST
      ?auto_20893 - SURFACE
      ?auto_20892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20894 ?auto_20889 ) ( SURFACE-AT ?auto_20888 ?auto_20889 ) ( CLEAR ?auto_20888 ) ( IS-CRATE ?auto_20887 ) ( not ( = ?auto_20887 ?auto_20888 ) ) ( AVAILABLE ?auto_20894 ) ( not ( = ?auto_20890 ?auto_20889 ) ) ( HOIST-AT ?auto_20891 ?auto_20890 ) ( not ( = ?auto_20894 ?auto_20891 ) ) ( AVAILABLE ?auto_20891 ) ( SURFACE-AT ?auto_20887 ?auto_20890 ) ( ON ?auto_20887 ?auto_20893 ) ( CLEAR ?auto_20887 ) ( not ( = ?auto_20887 ?auto_20893 ) ) ( not ( = ?auto_20888 ?auto_20893 ) ) ( TRUCK-AT ?auto_20892 ?auto_20889 ) )
    :subtasks
    ( ( !DRIVE ?auto_20892 ?auto_20889 ?auto_20890 )
      ( MAKE-ON ?auto_20887 ?auto_20888 )
      ( MAKE-ON-VERIFY ?auto_20887 ?auto_20888 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20895 - SURFACE
      ?auto_20896 - SURFACE
    )
    :vars
    (
      ?auto_20901 - HOIST
      ?auto_20902 - PLACE
      ?auto_20898 - PLACE
      ?auto_20897 - HOIST
      ?auto_20900 - SURFACE
      ?auto_20899 - TRUCK
      ?auto_20903 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20901 ?auto_20902 ) ( IS-CRATE ?auto_20895 ) ( not ( = ?auto_20895 ?auto_20896 ) ) ( not ( = ?auto_20898 ?auto_20902 ) ) ( HOIST-AT ?auto_20897 ?auto_20898 ) ( not ( = ?auto_20901 ?auto_20897 ) ) ( AVAILABLE ?auto_20897 ) ( SURFACE-AT ?auto_20895 ?auto_20898 ) ( ON ?auto_20895 ?auto_20900 ) ( CLEAR ?auto_20895 ) ( not ( = ?auto_20895 ?auto_20900 ) ) ( not ( = ?auto_20896 ?auto_20900 ) ) ( TRUCK-AT ?auto_20899 ?auto_20902 ) ( SURFACE-AT ?auto_20903 ?auto_20902 ) ( CLEAR ?auto_20903 ) ( LIFTING ?auto_20901 ?auto_20896 ) ( IS-CRATE ?auto_20896 ) ( not ( = ?auto_20895 ?auto_20903 ) ) ( not ( = ?auto_20896 ?auto_20903 ) ) ( not ( = ?auto_20900 ?auto_20903 ) ) )
    :subtasks
    ( ( !DROP ?auto_20901 ?auto_20896 ?auto_20903 ?auto_20902 )
      ( MAKE-ON ?auto_20895 ?auto_20896 )
      ( MAKE-ON-VERIFY ?auto_20895 ?auto_20896 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20904 - SURFACE
      ?auto_20905 - SURFACE
    )
    :vars
    (
      ?auto_20911 - HOIST
      ?auto_20910 - PLACE
      ?auto_20909 - PLACE
      ?auto_20912 - HOIST
      ?auto_20907 - SURFACE
      ?auto_20906 - TRUCK
      ?auto_20908 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20911 ?auto_20910 ) ( IS-CRATE ?auto_20904 ) ( not ( = ?auto_20904 ?auto_20905 ) ) ( not ( = ?auto_20909 ?auto_20910 ) ) ( HOIST-AT ?auto_20912 ?auto_20909 ) ( not ( = ?auto_20911 ?auto_20912 ) ) ( AVAILABLE ?auto_20912 ) ( SURFACE-AT ?auto_20904 ?auto_20909 ) ( ON ?auto_20904 ?auto_20907 ) ( CLEAR ?auto_20904 ) ( not ( = ?auto_20904 ?auto_20907 ) ) ( not ( = ?auto_20905 ?auto_20907 ) ) ( TRUCK-AT ?auto_20906 ?auto_20910 ) ( SURFACE-AT ?auto_20908 ?auto_20910 ) ( CLEAR ?auto_20908 ) ( IS-CRATE ?auto_20905 ) ( not ( = ?auto_20904 ?auto_20908 ) ) ( not ( = ?auto_20905 ?auto_20908 ) ) ( not ( = ?auto_20907 ?auto_20908 ) ) ( AVAILABLE ?auto_20911 ) ( IN ?auto_20905 ?auto_20906 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20911 ?auto_20905 ?auto_20906 ?auto_20910 )
      ( MAKE-ON ?auto_20904 ?auto_20905 )
      ( MAKE-ON-VERIFY ?auto_20904 ?auto_20905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20913 - SURFACE
      ?auto_20914 - SURFACE
    )
    :vars
    (
      ?auto_20919 - HOIST
      ?auto_20915 - PLACE
      ?auto_20921 - PLACE
      ?auto_20920 - HOIST
      ?auto_20918 - SURFACE
      ?auto_20917 - SURFACE
      ?auto_20916 - TRUCK
      ?auto_20922 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20919 ?auto_20915 ) ( IS-CRATE ?auto_20913 ) ( not ( = ?auto_20913 ?auto_20914 ) ) ( not ( = ?auto_20921 ?auto_20915 ) ) ( HOIST-AT ?auto_20920 ?auto_20921 ) ( not ( = ?auto_20919 ?auto_20920 ) ) ( AVAILABLE ?auto_20920 ) ( SURFACE-AT ?auto_20913 ?auto_20921 ) ( ON ?auto_20913 ?auto_20918 ) ( CLEAR ?auto_20913 ) ( not ( = ?auto_20913 ?auto_20918 ) ) ( not ( = ?auto_20914 ?auto_20918 ) ) ( SURFACE-AT ?auto_20917 ?auto_20915 ) ( CLEAR ?auto_20917 ) ( IS-CRATE ?auto_20914 ) ( not ( = ?auto_20913 ?auto_20917 ) ) ( not ( = ?auto_20914 ?auto_20917 ) ) ( not ( = ?auto_20918 ?auto_20917 ) ) ( AVAILABLE ?auto_20919 ) ( IN ?auto_20914 ?auto_20916 ) ( TRUCK-AT ?auto_20916 ?auto_20922 ) ( not ( = ?auto_20922 ?auto_20915 ) ) ( not ( = ?auto_20921 ?auto_20922 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20916 ?auto_20922 ?auto_20915 )
      ( MAKE-ON ?auto_20913 ?auto_20914 )
      ( MAKE-ON-VERIFY ?auto_20913 ?auto_20914 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20923 - SURFACE
      ?auto_20924 - SURFACE
    )
    :vars
    (
      ?auto_20926 - HOIST
      ?auto_20929 - PLACE
      ?auto_20931 - PLACE
      ?auto_20928 - HOIST
      ?auto_20932 - SURFACE
      ?auto_20925 - SURFACE
      ?auto_20927 - TRUCK
      ?auto_20930 - PLACE
      ?auto_20933 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20926 ?auto_20929 ) ( IS-CRATE ?auto_20923 ) ( not ( = ?auto_20923 ?auto_20924 ) ) ( not ( = ?auto_20931 ?auto_20929 ) ) ( HOIST-AT ?auto_20928 ?auto_20931 ) ( not ( = ?auto_20926 ?auto_20928 ) ) ( AVAILABLE ?auto_20928 ) ( SURFACE-AT ?auto_20923 ?auto_20931 ) ( ON ?auto_20923 ?auto_20932 ) ( CLEAR ?auto_20923 ) ( not ( = ?auto_20923 ?auto_20932 ) ) ( not ( = ?auto_20924 ?auto_20932 ) ) ( SURFACE-AT ?auto_20925 ?auto_20929 ) ( CLEAR ?auto_20925 ) ( IS-CRATE ?auto_20924 ) ( not ( = ?auto_20923 ?auto_20925 ) ) ( not ( = ?auto_20924 ?auto_20925 ) ) ( not ( = ?auto_20932 ?auto_20925 ) ) ( AVAILABLE ?auto_20926 ) ( TRUCK-AT ?auto_20927 ?auto_20930 ) ( not ( = ?auto_20930 ?auto_20929 ) ) ( not ( = ?auto_20931 ?auto_20930 ) ) ( HOIST-AT ?auto_20933 ?auto_20930 ) ( LIFTING ?auto_20933 ?auto_20924 ) ( not ( = ?auto_20926 ?auto_20933 ) ) ( not ( = ?auto_20928 ?auto_20933 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20933 ?auto_20924 ?auto_20927 ?auto_20930 )
      ( MAKE-ON ?auto_20923 ?auto_20924 )
      ( MAKE-ON-VERIFY ?auto_20923 ?auto_20924 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20934 - SURFACE
      ?auto_20935 - SURFACE
    )
    :vars
    (
      ?auto_20940 - HOIST
      ?auto_20936 - PLACE
      ?auto_20941 - PLACE
      ?auto_20937 - HOIST
      ?auto_20938 - SURFACE
      ?auto_20943 - SURFACE
      ?auto_20944 - TRUCK
      ?auto_20942 - PLACE
      ?auto_20939 - HOIST
      ?auto_20945 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20940 ?auto_20936 ) ( IS-CRATE ?auto_20934 ) ( not ( = ?auto_20934 ?auto_20935 ) ) ( not ( = ?auto_20941 ?auto_20936 ) ) ( HOIST-AT ?auto_20937 ?auto_20941 ) ( not ( = ?auto_20940 ?auto_20937 ) ) ( AVAILABLE ?auto_20937 ) ( SURFACE-AT ?auto_20934 ?auto_20941 ) ( ON ?auto_20934 ?auto_20938 ) ( CLEAR ?auto_20934 ) ( not ( = ?auto_20934 ?auto_20938 ) ) ( not ( = ?auto_20935 ?auto_20938 ) ) ( SURFACE-AT ?auto_20943 ?auto_20936 ) ( CLEAR ?auto_20943 ) ( IS-CRATE ?auto_20935 ) ( not ( = ?auto_20934 ?auto_20943 ) ) ( not ( = ?auto_20935 ?auto_20943 ) ) ( not ( = ?auto_20938 ?auto_20943 ) ) ( AVAILABLE ?auto_20940 ) ( TRUCK-AT ?auto_20944 ?auto_20942 ) ( not ( = ?auto_20942 ?auto_20936 ) ) ( not ( = ?auto_20941 ?auto_20942 ) ) ( HOIST-AT ?auto_20939 ?auto_20942 ) ( not ( = ?auto_20940 ?auto_20939 ) ) ( not ( = ?auto_20937 ?auto_20939 ) ) ( AVAILABLE ?auto_20939 ) ( SURFACE-AT ?auto_20935 ?auto_20942 ) ( ON ?auto_20935 ?auto_20945 ) ( CLEAR ?auto_20935 ) ( not ( = ?auto_20934 ?auto_20945 ) ) ( not ( = ?auto_20935 ?auto_20945 ) ) ( not ( = ?auto_20938 ?auto_20945 ) ) ( not ( = ?auto_20943 ?auto_20945 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20939 ?auto_20935 ?auto_20945 ?auto_20942 )
      ( MAKE-ON ?auto_20934 ?auto_20935 )
      ( MAKE-ON-VERIFY ?auto_20934 ?auto_20935 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20946 - SURFACE
      ?auto_20947 - SURFACE
    )
    :vars
    (
      ?auto_20949 - HOIST
      ?auto_20953 - PLACE
      ?auto_20951 - PLACE
      ?auto_20956 - HOIST
      ?auto_20948 - SURFACE
      ?auto_20952 - SURFACE
      ?auto_20955 - PLACE
      ?auto_20957 - HOIST
      ?auto_20950 - SURFACE
      ?auto_20954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20949 ?auto_20953 ) ( IS-CRATE ?auto_20946 ) ( not ( = ?auto_20946 ?auto_20947 ) ) ( not ( = ?auto_20951 ?auto_20953 ) ) ( HOIST-AT ?auto_20956 ?auto_20951 ) ( not ( = ?auto_20949 ?auto_20956 ) ) ( AVAILABLE ?auto_20956 ) ( SURFACE-AT ?auto_20946 ?auto_20951 ) ( ON ?auto_20946 ?auto_20948 ) ( CLEAR ?auto_20946 ) ( not ( = ?auto_20946 ?auto_20948 ) ) ( not ( = ?auto_20947 ?auto_20948 ) ) ( SURFACE-AT ?auto_20952 ?auto_20953 ) ( CLEAR ?auto_20952 ) ( IS-CRATE ?auto_20947 ) ( not ( = ?auto_20946 ?auto_20952 ) ) ( not ( = ?auto_20947 ?auto_20952 ) ) ( not ( = ?auto_20948 ?auto_20952 ) ) ( AVAILABLE ?auto_20949 ) ( not ( = ?auto_20955 ?auto_20953 ) ) ( not ( = ?auto_20951 ?auto_20955 ) ) ( HOIST-AT ?auto_20957 ?auto_20955 ) ( not ( = ?auto_20949 ?auto_20957 ) ) ( not ( = ?auto_20956 ?auto_20957 ) ) ( AVAILABLE ?auto_20957 ) ( SURFACE-AT ?auto_20947 ?auto_20955 ) ( ON ?auto_20947 ?auto_20950 ) ( CLEAR ?auto_20947 ) ( not ( = ?auto_20946 ?auto_20950 ) ) ( not ( = ?auto_20947 ?auto_20950 ) ) ( not ( = ?auto_20948 ?auto_20950 ) ) ( not ( = ?auto_20952 ?auto_20950 ) ) ( TRUCK-AT ?auto_20954 ?auto_20953 ) )
    :subtasks
    ( ( !DRIVE ?auto_20954 ?auto_20953 ?auto_20955 )
      ( MAKE-ON ?auto_20946 ?auto_20947 )
      ( MAKE-ON-VERIFY ?auto_20946 ?auto_20947 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20958 - SURFACE
      ?auto_20959 - SURFACE
    )
    :vars
    (
      ?auto_20967 - HOIST
      ?auto_20964 - PLACE
      ?auto_20961 - PLACE
      ?auto_20966 - HOIST
      ?auto_20969 - SURFACE
      ?auto_20960 - SURFACE
      ?auto_20962 - PLACE
      ?auto_20965 - HOIST
      ?auto_20963 - SURFACE
      ?auto_20968 - TRUCK
      ?auto_20970 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20967 ?auto_20964 ) ( IS-CRATE ?auto_20958 ) ( not ( = ?auto_20958 ?auto_20959 ) ) ( not ( = ?auto_20961 ?auto_20964 ) ) ( HOIST-AT ?auto_20966 ?auto_20961 ) ( not ( = ?auto_20967 ?auto_20966 ) ) ( AVAILABLE ?auto_20966 ) ( SURFACE-AT ?auto_20958 ?auto_20961 ) ( ON ?auto_20958 ?auto_20969 ) ( CLEAR ?auto_20958 ) ( not ( = ?auto_20958 ?auto_20969 ) ) ( not ( = ?auto_20959 ?auto_20969 ) ) ( IS-CRATE ?auto_20959 ) ( not ( = ?auto_20958 ?auto_20960 ) ) ( not ( = ?auto_20959 ?auto_20960 ) ) ( not ( = ?auto_20969 ?auto_20960 ) ) ( not ( = ?auto_20962 ?auto_20964 ) ) ( not ( = ?auto_20961 ?auto_20962 ) ) ( HOIST-AT ?auto_20965 ?auto_20962 ) ( not ( = ?auto_20967 ?auto_20965 ) ) ( not ( = ?auto_20966 ?auto_20965 ) ) ( AVAILABLE ?auto_20965 ) ( SURFACE-AT ?auto_20959 ?auto_20962 ) ( ON ?auto_20959 ?auto_20963 ) ( CLEAR ?auto_20959 ) ( not ( = ?auto_20958 ?auto_20963 ) ) ( not ( = ?auto_20959 ?auto_20963 ) ) ( not ( = ?auto_20969 ?auto_20963 ) ) ( not ( = ?auto_20960 ?auto_20963 ) ) ( TRUCK-AT ?auto_20968 ?auto_20964 ) ( SURFACE-AT ?auto_20970 ?auto_20964 ) ( CLEAR ?auto_20970 ) ( LIFTING ?auto_20967 ?auto_20960 ) ( IS-CRATE ?auto_20960 ) ( not ( = ?auto_20958 ?auto_20970 ) ) ( not ( = ?auto_20959 ?auto_20970 ) ) ( not ( = ?auto_20969 ?auto_20970 ) ) ( not ( = ?auto_20960 ?auto_20970 ) ) ( not ( = ?auto_20963 ?auto_20970 ) ) )
    :subtasks
    ( ( !DROP ?auto_20967 ?auto_20960 ?auto_20970 ?auto_20964 )
      ( MAKE-ON ?auto_20958 ?auto_20959 )
      ( MAKE-ON-VERIFY ?auto_20958 ?auto_20959 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20971 - SURFACE
      ?auto_20972 - SURFACE
    )
    :vars
    (
      ?auto_20980 - HOIST
      ?auto_20976 - PLACE
      ?auto_20982 - PLACE
      ?auto_20974 - HOIST
      ?auto_20977 - SURFACE
      ?auto_20978 - SURFACE
      ?auto_20981 - PLACE
      ?auto_20975 - HOIST
      ?auto_20973 - SURFACE
      ?auto_20983 - TRUCK
      ?auto_20979 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20980 ?auto_20976 ) ( IS-CRATE ?auto_20971 ) ( not ( = ?auto_20971 ?auto_20972 ) ) ( not ( = ?auto_20982 ?auto_20976 ) ) ( HOIST-AT ?auto_20974 ?auto_20982 ) ( not ( = ?auto_20980 ?auto_20974 ) ) ( AVAILABLE ?auto_20974 ) ( SURFACE-AT ?auto_20971 ?auto_20982 ) ( ON ?auto_20971 ?auto_20977 ) ( CLEAR ?auto_20971 ) ( not ( = ?auto_20971 ?auto_20977 ) ) ( not ( = ?auto_20972 ?auto_20977 ) ) ( IS-CRATE ?auto_20972 ) ( not ( = ?auto_20971 ?auto_20978 ) ) ( not ( = ?auto_20972 ?auto_20978 ) ) ( not ( = ?auto_20977 ?auto_20978 ) ) ( not ( = ?auto_20981 ?auto_20976 ) ) ( not ( = ?auto_20982 ?auto_20981 ) ) ( HOIST-AT ?auto_20975 ?auto_20981 ) ( not ( = ?auto_20980 ?auto_20975 ) ) ( not ( = ?auto_20974 ?auto_20975 ) ) ( AVAILABLE ?auto_20975 ) ( SURFACE-AT ?auto_20972 ?auto_20981 ) ( ON ?auto_20972 ?auto_20973 ) ( CLEAR ?auto_20972 ) ( not ( = ?auto_20971 ?auto_20973 ) ) ( not ( = ?auto_20972 ?auto_20973 ) ) ( not ( = ?auto_20977 ?auto_20973 ) ) ( not ( = ?auto_20978 ?auto_20973 ) ) ( TRUCK-AT ?auto_20983 ?auto_20976 ) ( SURFACE-AT ?auto_20979 ?auto_20976 ) ( CLEAR ?auto_20979 ) ( IS-CRATE ?auto_20978 ) ( not ( = ?auto_20971 ?auto_20979 ) ) ( not ( = ?auto_20972 ?auto_20979 ) ) ( not ( = ?auto_20977 ?auto_20979 ) ) ( not ( = ?auto_20978 ?auto_20979 ) ) ( not ( = ?auto_20973 ?auto_20979 ) ) ( AVAILABLE ?auto_20980 ) ( IN ?auto_20978 ?auto_20983 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20980 ?auto_20978 ?auto_20983 ?auto_20976 )
      ( MAKE-ON ?auto_20971 ?auto_20972 )
      ( MAKE-ON-VERIFY ?auto_20971 ?auto_20972 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20984 - SURFACE
      ?auto_20985 - SURFACE
    )
    :vars
    (
      ?auto_20996 - HOIST
      ?auto_20992 - PLACE
      ?auto_20995 - PLACE
      ?auto_20989 - HOIST
      ?auto_20986 - SURFACE
      ?auto_20987 - SURFACE
      ?auto_20988 - PLACE
      ?auto_20991 - HOIST
      ?auto_20990 - SURFACE
      ?auto_20994 - SURFACE
      ?auto_20993 - TRUCK
      ?auto_20997 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20996 ?auto_20992 ) ( IS-CRATE ?auto_20984 ) ( not ( = ?auto_20984 ?auto_20985 ) ) ( not ( = ?auto_20995 ?auto_20992 ) ) ( HOIST-AT ?auto_20989 ?auto_20995 ) ( not ( = ?auto_20996 ?auto_20989 ) ) ( AVAILABLE ?auto_20989 ) ( SURFACE-AT ?auto_20984 ?auto_20995 ) ( ON ?auto_20984 ?auto_20986 ) ( CLEAR ?auto_20984 ) ( not ( = ?auto_20984 ?auto_20986 ) ) ( not ( = ?auto_20985 ?auto_20986 ) ) ( IS-CRATE ?auto_20985 ) ( not ( = ?auto_20984 ?auto_20987 ) ) ( not ( = ?auto_20985 ?auto_20987 ) ) ( not ( = ?auto_20986 ?auto_20987 ) ) ( not ( = ?auto_20988 ?auto_20992 ) ) ( not ( = ?auto_20995 ?auto_20988 ) ) ( HOIST-AT ?auto_20991 ?auto_20988 ) ( not ( = ?auto_20996 ?auto_20991 ) ) ( not ( = ?auto_20989 ?auto_20991 ) ) ( AVAILABLE ?auto_20991 ) ( SURFACE-AT ?auto_20985 ?auto_20988 ) ( ON ?auto_20985 ?auto_20990 ) ( CLEAR ?auto_20985 ) ( not ( = ?auto_20984 ?auto_20990 ) ) ( not ( = ?auto_20985 ?auto_20990 ) ) ( not ( = ?auto_20986 ?auto_20990 ) ) ( not ( = ?auto_20987 ?auto_20990 ) ) ( SURFACE-AT ?auto_20994 ?auto_20992 ) ( CLEAR ?auto_20994 ) ( IS-CRATE ?auto_20987 ) ( not ( = ?auto_20984 ?auto_20994 ) ) ( not ( = ?auto_20985 ?auto_20994 ) ) ( not ( = ?auto_20986 ?auto_20994 ) ) ( not ( = ?auto_20987 ?auto_20994 ) ) ( not ( = ?auto_20990 ?auto_20994 ) ) ( AVAILABLE ?auto_20996 ) ( IN ?auto_20987 ?auto_20993 ) ( TRUCK-AT ?auto_20993 ?auto_20997 ) ( not ( = ?auto_20997 ?auto_20992 ) ) ( not ( = ?auto_20995 ?auto_20997 ) ) ( not ( = ?auto_20988 ?auto_20997 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20993 ?auto_20997 ?auto_20992 )
      ( MAKE-ON ?auto_20984 ?auto_20985 )
      ( MAKE-ON-VERIFY ?auto_20984 ?auto_20985 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20998 - SURFACE
      ?auto_20999 - SURFACE
    )
    :vars
    (
      ?auto_21002 - HOIST
      ?auto_21005 - PLACE
      ?auto_21011 - PLACE
      ?auto_21010 - HOIST
      ?auto_21007 - SURFACE
      ?auto_21009 - SURFACE
      ?auto_21006 - PLACE
      ?auto_21003 - HOIST
      ?auto_21001 - SURFACE
      ?auto_21008 - SURFACE
      ?auto_21000 - TRUCK
      ?auto_21004 - PLACE
      ?auto_21012 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21002 ?auto_21005 ) ( IS-CRATE ?auto_20998 ) ( not ( = ?auto_20998 ?auto_20999 ) ) ( not ( = ?auto_21011 ?auto_21005 ) ) ( HOIST-AT ?auto_21010 ?auto_21011 ) ( not ( = ?auto_21002 ?auto_21010 ) ) ( AVAILABLE ?auto_21010 ) ( SURFACE-AT ?auto_20998 ?auto_21011 ) ( ON ?auto_20998 ?auto_21007 ) ( CLEAR ?auto_20998 ) ( not ( = ?auto_20998 ?auto_21007 ) ) ( not ( = ?auto_20999 ?auto_21007 ) ) ( IS-CRATE ?auto_20999 ) ( not ( = ?auto_20998 ?auto_21009 ) ) ( not ( = ?auto_20999 ?auto_21009 ) ) ( not ( = ?auto_21007 ?auto_21009 ) ) ( not ( = ?auto_21006 ?auto_21005 ) ) ( not ( = ?auto_21011 ?auto_21006 ) ) ( HOIST-AT ?auto_21003 ?auto_21006 ) ( not ( = ?auto_21002 ?auto_21003 ) ) ( not ( = ?auto_21010 ?auto_21003 ) ) ( AVAILABLE ?auto_21003 ) ( SURFACE-AT ?auto_20999 ?auto_21006 ) ( ON ?auto_20999 ?auto_21001 ) ( CLEAR ?auto_20999 ) ( not ( = ?auto_20998 ?auto_21001 ) ) ( not ( = ?auto_20999 ?auto_21001 ) ) ( not ( = ?auto_21007 ?auto_21001 ) ) ( not ( = ?auto_21009 ?auto_21001 ) ) ( SURFACE-AT ?auto_21008 ?auto_21005 ) ( CLEAR ?auto_21008 ) ( IS-CRATE ?auto_21009 ) ( not ( = ?auto_20998 ?auto_21008 ) ) ( not ( = ?auto_20999 ?auto_21008 ) ) ( not ( = ?auto_21007 ?auto_21008 ) ) ( not ( = ?auto_21009 ?auto_21008 ) ) ( not ( = ?auto_21001 ?auto_21008 ) ) ( AVAILABLE ?auto_21002 ) ( TRUCK-AT ?auto_21000 ?auto_21004 ) ( not ( = ?auto_21004 ?auto_21005 ) ) ( not ( = ?auto_21011 ?auto_21004 ) ) ( not ( = ?auto_21006 ?auto_21004 ) ) ( HOIST-AT ?auto_21012 ?auto_21004 ) ( LIFTING ?auto_21012 ?auto_21009 ) ( not ( = ?auto_21002 ?auto_21012 ) ) ( not ( = ?auto_21010 ?auto_21012 ) ) ( not ( = ?auto_21003 ?auto_21012 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21012 ?auto_21009 ?auto_21000 ?auto_21004 )
      ( MAKE-ON ?auto_20998 ?auto_20999 )
      ( MAKE-ON-VERIFY ?auto_20998 ?auto_20999 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21013 - SURFACE
      ?auto_21014 - SURFACE
    )
    :vars
    (
      ?auto_21023 - HOIST
      ?auto_21024 - PLACE
      ?auto_21018 - PLACE
      ?auto_21016 - HOIST
      ?auto_21025 - SURFACE
      ?auto_21022 - SURFACE
      ?auto_21020 - PLACE
      ?auto_21015 - HOIST
      ?auto_21027 - SURFACE
      ?auto_21019 - SURFACE
      ?auto_21026 - TRUCK
      ?auto_21017 - PLACE
      ?auto_21021 - HOIST
      ?auto_21028 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21023 ?auto_21024 ) ( IS-CRATE ?auto_21013 ) ( not ( = ?auto_21013 ?auto_21014 ) ) ( not ( = ?auto_21018 ?auto_21024 ) ) ( HOIST-AT ?auto_21016 ?auto_21018 ) ( not ( = ?auto_21023 ?auto_21016 ) ) ( AVAILABLE ?auto_21016 ) ( SURFACE-AT ?auto_21013 ?auto_21018 ) ( ON ?auto_21013 ?auto_21025 ) ( CLEAR ?auto_21013 ) ( not ( = ?auto_21013 ?auto_21025 ) ) ( not ( = ?auto_21014 ?auto_21025 ) ) ( IS-CRATE ?auto_21014 ) ( not ( = ?auto_21013 ?auto_21022 ) ) ( not ( = ?auto_21014 ?auto_21022 ) ) ( not ( = ?auto_21025 ?auto_21022 ) ) ( not ( = ?auto_21020 ?auto_21024 ) ) ( not ( = ?auto_21018 ?auto_21020 ) ) ( HOIST-AT ?auto_21015 ?auto_21020 ) ( not ( = ?auto_21023 ?auto_21015 ) ) ( not ( = ?auto_21016 ?auto_21015 ) ) ( AVAILABLE ?auto_21015 ) ( SURFACE-AT ?auto_21014 ?auto_21020 ) ( ON ?auto_21014 ?auto_21027 ) ( CLEAR ?auto_21014 ) ( not ( = ?auto_21013 ?auto_21027 ) ) ( not ( = ?auto_21014 ?auto_21027 ) ) ( not ( = ?auto_21025 ?auto_21027 ) ) ( not ( = ?auto_21022 ?auto_21027 ) ) ( SURFACE-AT ?auto_21019 ?auto_21024 ) ( CLEAR ?auto_21019 ) ( IS-CRATE ?auto_21022 ) ( not ( = ?auto_21013 ?auto_21019 ) ) ( not ( = ?auto_21014 ?auto_21019 ) ) ( not ( = ?auto_21025 ?auto_21019 ) ) ( not ( = ?auto_21022 ?auto_21019 ) ) ( not ( = ?auto_21027 ?auto_21019 ) ) ( AVAILABLE ?auto_21023 ) ( TRUCK-AT ?auto_21026 ?auto_21017 ) ( not ( = ?auto_21017 ?auto_21024 ) ) ( not ( = ?auto_21018 ?auto_21017 ) ) ( not ( = ?auto_21020 ?auto_21017 ) ) ( HOIST-AT ?auto_21021 ?auto_21017 ) ( not ( = ?auto_21023 ?auto_21021 ) ) ( not ( = ?auto_21016 ?auto_21021 ) ) ( not ( = ?auto_21015 ?auto_21021 ) ) ( AVAILABLE ?auto_21021 ) ( SURFACE-AT ?auto_21022 ?auto_21017 ) ( ON ?auto_21022 ?auto_21028 ) ( CLEAR ?auto_21022 ) ( not ( = ?auto_21013 ?auto_21028 ) ) ( not ( = ?auto_21014 ?auto_21028 ) ) ( not ( = ?auto_21025 ?auto_21028 ) ) ( not ( = ?auto_21022 ?auto_21028 ) ) ( not ( = ?auto_21027 ?auto_21028 ) ) ( not ( = ?auto_21019 ?auto_21028 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21021 ?auto_21022 ?auto_21028 ?auto_21017 )
      ( MAKE-ON ?auto_21013 ?auto_21014 )
      ( MAKE-ON-VERIFY ?auto_21013 ?auto_21014 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21029 - SURFACE
      ?auto_21030 - SURFACE
    )
    :vars
    (
      ?auto_21033 - HOIST
      ?auto_21034 - PLACE
      ?auto_21044 - PLACE
      ?auto_21042 - HOIST
      ?auto_21037 - SURFACE
      ?auto_21031 - SURFACE
      ?auto_21039 - PLACE
      ?auto_21036 - HOIST
      ?auto_21032 - SURFACE
      ?auto_21040 - SURFACE
      ?auto_21035 - PLACE
      ?auto_21043 - HOIST
      ?auto_21041 - SURFACE
      ?auto_21038 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21033 ?auto_21034 ) ( IS-CRATE ?auto_21029 ) ( not ( = ?auto_21029 ?auto_21030 ) ) ( not ( = ?auto_21044 ?auto_21034 ) ) ( HOIST-AT ?auto_21042 ?auto_21044 ) ( not ( = ?auto_21033 ?auto_21042 ) ) ( AVAILABLE ?auto_21042 ) ( SURFACE-AT ?auto_21029 ?auto_21044 ) ( ON ?auto_21029 ?auto_21037 ) ( CLEAR ?auto_21029 ) ( not ( = ?auto_21029 ?auto_21037 ) ) ( not ( = ?auto_21030 ?auto_21037 ) ) ( IS-CRATE ?auto_21030 ) ( not ( = ?auto_21029 ?auto_21031 ) ) ( not ( = ?auto_21030 ?auto_21031 ) ) ( not ( = ?auto_21037 ?auto_21031 ) ) ( not ( = ?auto_21039 ?auto_21034 ) ) ( not ( = ?auto_21044 ?auto_21039 ) ) ( HOIST-AT ?auto_21036 ?auto_21039 ) ( not ( = ?auto_21033 ?auto_21036 ) ) ( not ( = ?auto_21042 ?auto_21036 ) ) ( AVAILABLE ?auto_21036 ) ( SURFACE-AT ?auto_21030 ?auto_21039 ) ( ON ?auto_21030 ?auto_21032 ) ( CLEAR ?auto_21030 ) ( not ( = ?auto_21029 ?auto_21032 ) ) ( not ( = ?auto_21030 ?auto_21032 ) ) ( not ( = ?auto_21037 ?auto_21032 ) ) ( not ( = ?auto_21031 ?auto_21032 ) ) ( SURFACE-AT ?auto_21040 ?auto_21034 ) ( CLEAR ?auto_21040 ) ( IS-CRATE ?auto_21031 ) ( not ( = ?auto_21029 ?auto_21040 ) ) ( not ( = ?auto_21030 ?auto_21040 ) ) ( not ( = ?auto_21037 ?auto_21040 ) ) ( not ( = ?auto_21031 ?auto_21040 ) ) ( not ( = ?auto_21032 ?auto_21040 ) ) ( AVAILABLE ?auto_21033 ) ( not ( = ?auto_21035 ?auto_21034 ) ) ( not ( = ?auto_21044 ?auto_21035 ) ) ( not ( = ?auto_21039 ?auto_21035 ) ) ( HOIST-AT ?auto_21043 ?auto_21035 ) ( not ( = ?auto_21033 ?auto_21043 ) ) ( not ( = ?auto_21042 ?auto_21043 ) ) ( not ( = ?auto_21036 ?auto_21043 ) ) ( AVAILABLE ?auto_21043 ) ( SURFACE-AT ?auto_21031 ?auto_21035 ) ( ON ?auto_21031 ?auto_21041 ) ( CLEAR ?auto_21031 ) ( not ( = ?auto_21029 ?auto_21041 ) ) ( not ( = ?auto_21030 ?auto_21041 ) ) ( not ( = ?auto_21037 ?auto_21041 ) ) ( not ( = ?auto_21031 ?auto_21041 ) ) ( not ( = ?auto_21032 ?auto_21041 ) ) ( not ( = ?auto_21040 ?auto_21041 ) ) ( TRUCK-AT ?auto_21038 ?auto_21034 ) )
    :subtasks
    ( ( !DRIVE ?auto_21038 ?auto_21034 ?auto_21035 )
      ( MAKE-ON ?auto_21029 ?auto_21030 )
      ( MAKE-ON-VERIFY ?auto_21029 ?auto_21030 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21045 - SURFACE
      ?auto_21046 - SURFACE
    )
    :vars
    (
      ?auto_21054 - HOIST
      ?auto_21057 - PLACE
      ?auto_21060 - PLACE
      ?auto_21058 - HOIST
      ?auto_21053 - SURFACE
      ?auto_21052 - SURFACE
      ?auto_21049 - PLACE
      ?auto_21056 - HOIST
      ?auto_21048 - SURFACE
      ?auto_21051 - SURFACE
      ?auto_21059 - PLACE
      ?auto_21050 - HOIST
      ?auto_21055 - SURFACE
      ?auto_21047 - TRUCK
      ?auto_21061 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21054 ?auto_21057 ) ( IS-CRATE ?auto_21045 ) ( not ( = ?auto_21045 ?auto_21046 ) ) ( not ( = ?auto_21060 ?auto_21057 ) ) ( HOIST-AT ?auto_21058 ?auto_21060 ) ( not ( = ?auto_21054 ?auto_21058 ) ) ( AVAILABLE ?auto_21058 ) ( SURFACE-AT ?auto_21045 ?auto_21060 ) ( ON ?auto_21045 ?auto_21053 ) ( CLEAR ?auto_21045 ) ( not ( = ?auto_21045 ?auto_21053 ) ) ( not ( = ?auto_21046 ?auto_21053 ) ) ( IS-CRATE ?auto_21046 ) ( not ( = ?auto_21045 ?auto_21052 ) ) ( not ( = ?auto_21046 ?auto_21052 ) ) ( not ( = ?auto_21053 ?auto_21052 ) ) ( not ( = ?auto_21049 ?auto_21057 ) ) ( not ( = ?auto_21060 ?auto_21049 ) ) ( HOIST-AT ?auto_21056 ?auto_21049 ) ( not ( = ?auto_21054 ?auto_21056 ) ) ( not ( = ?auto_21058 ?auto_21056 ) ) ( AVAILABLE ?auto_21056 ) ( SURFACE-AT ?auto_21046 ?auto_21049 ) ( ON ?auto_21046 ?auto_21048 ) ( CLEAR ?auto_21046 ) ( not ( = ?auto_21045 ?auto_21048 ) ) ( not ( = ?auto_21046 ?auto_21048 ) ) ( not ( = ?auto_21053 ?auto_21048 ) ) ( not ( = ?auto_21052 ?auto_21048 ) ) ( IS-CRATE ?auto_21052 ) ( not ( = ?auto_21045 ?auto_21051 ) ) ( not ( = ?auto_21046 ?auto_21051 ) ) ( not ( = ?auto_21053 ?auto_21051 ) ) ( not ( = ?auto_21052 ?auto_21051 ) ) ( not ( = ?auto_21048 ?auto_21051 ) ) ( not ( = ?auto_21059 ?auto_21057 ) ) ( not ( = ?auto_21060 ?auto_21059 ) ) ( not ( = ?auto_21049 ?auto_21059 ) ) ( HOIST-AT ?auto_21050 ?auto_21059 ) ( not ( = ?auto_21054 ?auto_21050 ) ) ( not ( = ?auto_21058 ?auto_21050 ) ) ( not ( = ?auto_21056 ?auto_21050 ) ) ( AVAILABLE ?auto_21050 ) ( SURFACE-AT ?auto_21052 ?auto_21059 ) ( ON ?auto_21052 ?auto_21055 ) ( CLEAR ?auto_21052 ) ( not ( = ?auto_21045 ?auto_21055 ) ) ( not ( = ?auto_21046 ?auto_21055 ) ) ( not ( = ?auto_21053 ?auto_21055 ) ) ( not ( = ?auto_21052 ?auto_21055 ) ) ( not ( = ?auto_21048 ?auto_21055 ) ) ( not ( = ?auto_21051 ?auto_21055 ) ) ( TRUCK-AT ?auto_21047 ?auto_21057 ) ( SURFACE-AT ?auto_21061 ?auto_21057 ) ( CLEAR ?auto_21061 ) ( LIFTING ?auto_21054 ?auto_21051 ) ( IS-CRATE ?auto_21051 ) ( not ( = ?auto_21045 ?auto_21061 ) ) ( not ( = ?auto_21046 ?auto_21061 ) ) ( not ( = ?auto_21053 ?auto_21061 ) ) ( not ( = ?auto_21052 ?auto_21061 ) ) ( not ( = ?auto_21048 ?auto_21061 ) ) ( not ( = ?auto_21051 ?auto_21061 ) ) ( not ( = ?auto_21055 ?auto_21061 ) ) )
    :subtasks
    ( ( !DROP ?auto_21054 ?auto_21051 ?auto_21061 ?auto_21057 )
      ( MAKE-ON ?auto_21045 ?auto_21046 )
      ( MAKE-ON-VERIFY ?auto_21045 ?auto_21046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21062 - SURFACE
      ?auto_21063 - SURFACE
    )
    :vars
    (
      ?auto_21078 - HOIST
      ?auto_21077 - PLACE
      ?auto_21064 - PLACE
      ?auto_21073 - HOIST
      ?auto_21076 - SURFACE
      ?auto_21075 - SURFACE
      ?auto_21068 - PLACE
      ?auto_21074 - HOIST
      ?auto_21072 - SURFACE
      ?auto_21071 - SURFACE
      ?auto_21065 - PLACE
      ?auto_21067 - HOIST
      ?auto_21070 - SURFACE
      ?auto_21066 - TRUCK
      ?auto_21069 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21078 ?auto_21077 ) ( IS-CRATE ?auto_21062 ) ( not ( = ?auto_21062 ?auto_21063 ) ) ( not ( = ?auto_21064 ?auto_21077 ) ) ( HOIST-AT ?auto_21073 ?auto_21064 ) ( not ( = ?auto_21078 ?auto_21073 ) ) ( AVAILABLE ?auto_21073 ) ( SURFACE-AT ?auto_21062 ?auto_21064 ) ( ON ?auto_21062 ?auto_21076 ) ( CLEAR ?auto_21062 ) ( not ( = ?auto_21062 ?auto_21076 ) ) ( not ( = ?auto_21063 ?auto_21076 ) ) ( IS-CRATE ?auto_21063 ) ( not ( = ?auto_21062 ?auto_21075 ) ) ( not ( = ?auto_21063 ?auto_21075 ) ) ( not ( = ?auto_21076 ?auto_21075 ) ) ( not ( = ?auto_21068 ?auto_21077 ) ) ( not ( = ?auto_21064 ?auto_21068 ) ) ( HOIST-AT ?auto_21074 ?auto_21068 ) ( not ( = ?auto_21078 ?auto_21074 ) ) ( not ( = ?auto_21073 ?auto_21074 ) ) ( AVAILABLE ?auto_21074 ) ( SURFACE-AT ?auto_21063 ?auto_21068 ) ( ON ?auto_21063 ?auto_21072 ) ( CLEAR ?auto_21063 ) ( not ( = ?auto_21062 ?auto_21072 ) ) ( not ( = ?auto_21063 ?auto_21072 ) ) ( not ( = ?auto_21076 ?auto_21072 ) ) ( not ( = ?auto_21075 ?auto_21072 ) ) ( IS-CRATE ?auto_21075 ) ( not ( = ?auto_21062 ?auto_21071 ) ) ( not ( = ?auto_21063 ?auto_21071 ) ) ( not ( = ?auto_21076 ?auto_21071 ) ) ( not ( = ?auto_21075 ?auto_21071 ) ) ( not ( = ?auto_21072 ?auto_21071 ) ) ( not ( = ?auto_21065 ?auto_21077 ) ) ( not ( = ?auto_21064 ?auto_21065 ) ) ( not ( = ?auto_21068 ?auto_21065 ) ) ( HOIST-AT ?auto_21067 ?auto_21065 ) ( not ( = ?auto_21078 ?auto_21067 ) ) ( not ( = ?auto_21073 ?auto_21067 ) ) ( not ( = ?auto_21074 ?auto_21067 ) ) ( AVAILABLE ?auto_21067 ) ( SURFACE-AT ?auto_21075 ?auto_21065 ) ( ON ?auto_21075 ?auto_21070 ) ( CLEAR ?auto_21075 ) ( not ( = ?auto_21062 ?auto_21070 ) ) ( not ( = ?auto_21063 ?auto_21070 ) ) ( not ( = ?auto_21076 ?auto_21070 ) ) ( not ( = ?auto_21075 ?auto_21070 ) ) ( not ( = ?auto_21072 ?auto_21070 ) ) ( not ( = ?auto_21071 ?auto_21070 ) ) ( TRUCK-AT ?auto_21066 ?auto_21077 ) ( SURFACE-AT ?auto_21069 ?auto_21077 ) ( CLEAR ?auto_21069 ) ( IS-CRATE ?auto_21071 ) ( not ( = ?auto_21062 ?auto_21069 ) ) ( not ( = ?auto_21063 ?auto_21069 ) ) ( not ( = ?auto_21076 ?auto_21069 ) ) ( not ( = ?auto_21075 ?auto_21069 ) ) ( not ( = ?auto_21072 ?auto_21069 ) ) ( not ( = ?auto_21071 ?auto_21069 ) ) ( not ( = ?auto_21070 ?auto_21069 ) ) ( AVAILABLE ?auto_21078 ) ( IN ?auto_21071 ?auto_21066 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21078 ?auto_21071 ?auto_21066 ?auto_21077 )
      ( MAKE-ON ?auto_21062 ?auto_21063 )
      ( MAKE-ON-VERIFY ?auto_21062 ?auto_21063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21079 - SURFACE
      ?auto_21080 - SURFACE
    )
    :vars
    (
      ?auto_21086 - HOIST
      ?auto_21088 - PLACE
      ?auto_21093 - PLACE
      ?auto_21081 - HOIST
      ?auto_21084 - SURFACE
      ?auto_21085 - SURFACE
      ?auto_21087 - PLACE
      ?auto_21083 - HOIST
      ?auto_21092 - SURFACE
      ?auto_21082 - SURFACE
      ?auto_21089 - PLACE
      ?auto_21094 - HOIST
      ?auto_21091 - SURFACE
      ?auto_21095 - SURFACE
      ?auto_21090 - TRUCK
      ?auto_21096 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21086 ?auto_21088 ) ( IS-CRATE ?auto_21079 ) ( not ( = ?auto_21079 ?auto_21080 ) ) ( not ( = ?auto_21093 ?auto_21088 ) ) ( HOIST-AT ?auto_21081 ?auto_21093 ) ( not ( = ?auto_21086 ?auto_21081 ) ) ( AVAILABLE ?auto_21081 ) ( SURFACE-AT ?auto_21079 ?auto_21093 ) ( ON ?auto_21079 ?auto_21084 ) ( CLEAR ?auto_21079 ) ( not ( = ?auto_21079 ?auto_21084 ) ) ( not ( = ?auto_21080 ?auto_21084 ) ) ( IS-CRATE ?auto_21080 ) ( not ( = ?auto_21079 ?auto_21085 ) ) ( not ( = ?auto_21080 ?auto_21085 ) ) ( not ( = ?auto_21084 ?auto_21085 ) ) ( not ( = ?auto_21087 ?auto_21088 ) ) ( not ( = ?auto_21093 ?auto_21087 ) ) ( HOIST-AT ?auto_21083 ?auto_21087 ) ( not ( = ?auto_21086 ?auto_21083 ) ) ( not ( = ?auto_21081 ?auto_21083 ) ) ( AVAILABLE ?auto_21083 ) ( SURFACE-AT ?auto_21080 ?auto_21087 ) ( ON ?auto_21080 ?auto_21092 ) ( CLEAR ?auto_21080 ) ( not ( = ?auto_21079 ?auto_21092 ) ) ( not ( = ?auto_21080 ?auto_21092 ) ) ( not ( = ?auto_21084 ?auto_21092 ) ) ( not ( = ?auto_21085 ?auto_21092 ) ) ( IS-CRATE ?auto_21085 ) ( not ( = ?auto_21079 ?auto_21082 ) ) ( not ( = ?auto_21080 ?auto_21082 ) ) ( not ( = ?auto_21084 ?auto_21082 ) ) ( not ( = ?auto_21085 ?auto_21082 ) ) ( not ( = ?auto_21092 ?auto_21082 ) ) ( not ( = ?auto_21089 ?auto_21088 ) ) ( not ( = ?auto_21093 ?auto_21089 ) ) ( not ( = ?auto_21087 ?auto_21089 ) ) ( HOIST-AT ?auto_21094 ?auto_21089 ) ( not ( = ?auto_21086 ?auto_21094 ) ) ( not ( = ?auto_21081 ?auto_21094 ) ) ( not ( = ?auto_21083 ?auto_21094 ) ) ( AVAILABLE ?auto_21094 ) ( SURFACE-AT ?auto_21085 ?auto_21089 ) ( ON ?auto_21085 ?auto_21091 ) ( CLEAR ?auto_21085 ) ( not ( = ?auto_21079 ?auto_21091 ) ) ( not ( = ?auto_21080 ?auto_21091 ) ) ( not ( = ?auto_21084 ?auto_21091 ) ) ( not ( = ?auto_21085 ?auto_21091 ) ) ( not ( = ?auto_21092 ?auto_21091 ) ) ( not ( = ?auto_21082 ?auto_21091 ) ) ( SURFACE-AT ?auto_21095 ?auto_21088 ) ( CLEAR ?auto_21095 ) ( IS-CRATE ?auto_21082 ) ( not ( = ?auto_21079 ?auto_21095 ) ) ( not ( = ?auto_21080 ?auto_21095 ) ) ( not ( = ?auto_21084 ?auto_21095 ) ) ( not ( = ?auto_21085 ?auto_21095 ) ) ( not ( = ?auto_21092 ?auto_21095 ) ) ( not ( = ?auto_21082 ?auto_21095 ) ) ( not ( = ?auto_21091 ?auto_21095 ) ) ( AVAILABLE ?auto_21086 ) ( IN ?auto_21082 ?auto_21090 ) ( TRUCK-AT ?auto_21090 ?auto_21096 ) ( not ( = ?auto_21096 ?auto_21088 ) ) ( not ( = ?auto_21093 ?auto_21096 ) ) ( not ( = ?auto_21087 ?auto_21096 ) ) ( not ( = ?auto_21089 ?auto_21096 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21090 ?auto_21096 ?auto_21088 )
      ( MAKE-ON ?auto_21079 ?auto_21080 )
      ( MAKE-ON-VERIFY ?auto_21079 ?auto_21080 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21097 - SURFACE
      ?auto_21098 - SURFACE
    )
    :vars
    (
      ?auto_21101 - HOIST
      ?auto_21104 - PLACE
      ?auto_21100 - PLACE
      ?auto_21114 - HOIST
      ?auto_21099 - SURFACE
      ?auto_21109 - SURFACE
      ?auto_21105 - PLACE
      ?auto_21102 - HOIST
      ?auto_21103 - SURFACE
      ?auto_21113 - SURFACE
      ?auto_21111 - PLACE
      ?auto_21107 - HOIST
      ?auto_21112 - SURFACE
      ?auto_21108 - SURFACE
      ?auto_21110 - TRUCK
      ?auto_21106 - PLACE
      ?auto_21115 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21101 ?auto_21104 ) ( IS-CRATE ?auto_21097 ) ( not ( = ?auto_21097 ?auto_21098 ) ) ( not ( = ?auto_21100 ?auto_21104 ) ) ( HOIST-AT ?auto_21114 ?auto_21100 ) ( not ( = ?auto_21101 ?auto_21114 ) ) ( AVAILABLE ?auto_21114 ) ( SURFACE-AT ?auto_21097 ?auto_21100 ) ( ON ?auto_21097 ?auto_21099 ) ( CLEAR ?auto_21097 ) ( not ( = ?auto_21097 ?auto_21099 ) ) ( not ( = ?auto_21098 ?auto_21099 ) ) ( IS-CRATE ?auto_21098 ) ( not ( = ?auto_21097 ?auto_21109 ) ) ( not ( = ?auto_21098 ?auto_21109 ) ) ( not ( = ?auto_21099 ?auto_21109 ) ) ( not ( = ?auto_21105 ?auto_21104 ) ) ( not ( = ?auto_21100 ?auto_21105 ) ) ( HOIST-AT ?auto_21102 ?auto_21105 ) ( not ( = ?auto_21101 ?auto_21102 ) ) ( not ( = ?auto_21114 ?auto_21102 ) ) ( AVAILABLE ?auto_21102 ) ( SURFACE-AT ?auto_21098 ?auto_21105 ) ( ON ?auto_21098 ?auto_21103 ) ( CLEAR ?auto_21098 ) ( not ( = ?auto_21097 ?auto_21103 ) ) ( not ( = ?auto_21098 ?auto_21103 ) ) ( not ( = ?auto_21099 ?auto_21103 ) ) ( not ( = ?auto_21109 ?auto_21103 ) ) ( IS-CRATE ?auto_21109 ) ( not ( = ?auto_21097 ?auto_21113 ) ) ( not ( = ?auto_21098 ?auto_21113 ) ) ( not ( = ?auto_21099 ?auto_21113 ) ) ( not ( = ?auto_21109 ?auto_21113 ) ) ( not ( = ?auto_21103 ?auto_21113 ) ) ( not ( = ?auto_21111 ?auto_21104 ) ) ( not ( = ?auto_21100 ?auto_21111 ) ) ( not ( = ?auto_21105 ?auto_21111 ) ) ( HOIST-AT ?auto_21107 ?auto_21111 ) ( not ( = ?auto_21101 ?auto_21107 ) ) ( not ( = ?auto_21114 ?auto_21107 ) ) ( not ( = ?auto_21102 ?auto_21107 ) ) ( AVAILABLE ?auto_21107 ) ( SURFACE-AT ?auto_21109 ?auto_21111 ) ( ON ?auto_21109 ?auto_21112 ) ( CLEAR ?auto_21109 ) ( not ( = ?auto_21097 ?auto_21112 ) ) ( not ( = ?auto_21098 ?auto_21112 ) ) ( not ( = ?auto_21099 ?auto_21112 ) ) ( not ( = ?auto_21109 ?auto_21112 ) ) ( not ( = ?auto_21103 ?auto_21112 ) ) ( not ( = ?auto_21113 ?auto_21112 ) ) ( SURFACE-AT ?auto_21108 ?auto_21104 ) ( CLEAR ?auto_21108 ) ( IS-CRATE ?auto_21113 ) ( not ( = ?auto_21097 ?auto_21108 ) ) ( not ( = ?auto_21098 ?auto_21108 ) ) ( not ( = ?auto_21099 ?auto_21108 ) ) ( not ( = ?auto_21109 ?auto_21108 ) ) ( not ( = ?auto_21103 ?auto_21108 ) ) ( not ( = ?auto_21113 ?auto_21108 ) ) ( not ( = ?auto_21112 ?auto_21108 ) ) ( AVAILABLE ?auto_21101 ) ( TRUCK-AT ?auto_21110 ?auto_21106 ) ( not ( = ?auto_21106 ?auto_21104 ) ) ( not ( = ?auto_21100 ?auto_21106 ) ) ( not ( = ?auto_21105 ?auto_21106 ) ) ( not ( = ?auto_21111 ?auto_21106 ) ) ( HOIST-AT ?auto_21115 ?auto_21106 ) ( LIFTING ?auto_21115 ?auto_21113 ) ( not ( = ?auto_21101 ?auto_21115 ) ) ( not ( = ?auto_21114 ?auto_21115 ) ) ( not ( = ?auto_21102 ?auto_21115 ) ) ( not ( = ?auto_21107 ?auto_21115 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21115 ?auto_21113 ?auto_21110 ?auto_21106 )
      ( MAKE-ON ?auto_21097 ?auto_21098 )
      ( MAKE-ON-VERIFY ?auto_21097 ?auto_21098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21116 - SURFACE
      ?auto_21117 - SURFACE
    )
    :vars
    (
      ?auto_21127 - HOIST
      ?auto_21134 - PLACE
      ?auto_21133 - PLACE
      ?auto_21125 - HOIST
      ?auto_21124 - SURFACE
      ?auto_21118 - SURFACE
      ?auto_21129 - PLACE
      ?auto_21130 - HOIST
      ?auto_21126 - SURFACE
      ?auto_21128 - SURFACE
      ?auto_21120 - PLACE
      ?auto_21123 - HOIST
      ?auto_21122 - SURFACE
      ?auto_21131 - SURFACE
      ?auto_21119 - TRUCK
      ?auto_21132 - PLACE
      ?auto_21121 - HOIST
      ?auto_21135 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21127 ?auto_21134 ) ( IS-CRATE ?auto_21116 ) ( not ( = ?auto_21116 ?auto_21117 ) ) ( not ( = ?auto_21133 ?auto_21134 ) ) ( HOIST-AT ?auto_21125 ?auto_21133 ) ( not ( = ?auto_21127 ?auto_21125 ) ) ( AVAILABLE ?auto_21125 ) ( SURFACE-AT ?auto_21116 ?auto_21133 ) ( ON ?auto_21116 ?auto_21124 ) ( CLEAR ?auto_21116 ) ( not ( = ?auto_21116 ?auto_21124 ) ) ( not ( = ?auto_21117 ?auto_21124 ) ) ( IS-CRATE ?auto_21117 ) ( not ( = ?auto_21116 ?auto_21118 ) ) ( not ( = ?auto_21117 ?auto_21118 ) ) ( not ( = ?auto_21124 ?auto_21118 ) ) ( not ( = ?auto_21129 ?auto_21134 ) ) ( not ( = ?auto_21133 ?auto_21129 ) ) ( HOIST-AT ?auto_21130 ?auto_21129 ) ( not ( = ?auto_21127 ?auto_21130 ) ) ( not ( = ?auto_21125 ?auto_21130 ) ) ( AVAILABLE ?auto_21130 ) ( SURFACE-AT ?auto_21117 ?auto_21129 ) ( ON ?auto_21117 ?auto_21126 ) ( CLEAR ?auto_21117 ) ( not ( = ?auto_21116 ?auto_21126 ) ) ( not ( = ?auto_21117 ?auto_21126 ) ) ( not ( = ?auto_21124 ?auto_21126 ) ) ( not ( = ?auto_21118 ?auto_21126 ) ) ( IS-CRATE ?auto_21118 ) ( not ( = ?auto_21116 ?auto_21128 ) ) ( not ( = ?auto_21117 ?auto_21128 ) ) ( not ( = ?auto_21124 ?auto_21128 ) ) ( not ( = ?auto_21118 ?auto_21128 ) ) ( not ( = ?auto_21126 ?auto_21128 ) ) ( not ( = ?auto_21120 ?auto_21134 ) ) ( not ( = ?auto_21133 ?auto_21120 ) ) ( not ( = ?auto_21129 ?auto_21120 ) ) ( HOIST-AT ?auto_21123 ?auto_21120 ) ( not ( = ?auto_21127 ?auto_21123 ) ) ( not ( = ?auto_21125 ?auto_21123 ) ) ( not ( = ?auto_21130 ?auto_21123 ) ) ( AVAILABLE ?auto_21123 ) ( SURFACE-AT ?auto_21118 ?auto_21120 ) ( ON ?auto_21118 ?auto_21122 ) ( CLEAR ?auto_21118 ) ( not ( = ?auto_21116 ?auto_21122 ) ) ( not ( = ?auto_21117 ?auto_21122 ) ) ( not ( = ?auto_21124 ?auto_21122 ) ) ( not ( = ?auto_21118 ?auto_21122 ) ) ( not ( = ?auto_21126 ?auto_21122 ) ) ( not ( = ?auto_21128 ?auto_21122 ) ) ( SURFACE-AT ?auto_21131 ?auto_21134 ) ( CLEAR ?auto_21131 ) ( IS-CRATE ?auto_21128 ) ( not ( = ?auto_21116 ?auto_21131 ) ) ( not ( = ?auto_21117 ?auto_21131 ) ) ( not ( = ?auto_21124 ?auto_21131 ) ) ( not ( = ?auto_21118 ?auto_21131 ) ) ( not ( = ?auto_21126 ?auto_21131 ) ) ( not ( = ?auto_21128 ?auto_21131 ) ) ( not ( = ?auto_21122 ?auto_21131 ) ) ( AVAILABLE ?auto_21127 ) ( TRUCK-AT ?auto_21119 ?auto_21132 ) ( not ( = ?auto_21132 ?auto_21134 ) ) ( not ( = ?auto_21133 ?auto_21132 ) ) ( not ( = ?auto_21129 ?auto_21132 ) ) ( not ( = ?auto_21120 ?auto_21132 ) ) ( HOIST-AT ?auto_21121 ?auto_21132 ) ( not ( = ?auto_21127 ?auto_21121 ) ) ( not ( = ?auto_21125 ?auto_21121 ) ) ( not ( = ?auto_21130 ?auto_21121 ) ) ( not ( = ?auto_21123 ?auto_21121 ) ) ( AVAILABLE ?auto_21121 ) ( SURFACE-AT ?auto_21128 ?auto_21132 ) ( ON ?auto_21128 ?auto_21135 ) ( CLEAR ?auto_21128 ) ( not ( = ?auto_21116 ?auto_21135 ) ) ( not ( = ?auto_21117 ?auto_21135 ) ) ( not ( = ?auto_21124 ?auto_21135 ) ) ( not ( = ?auto_21118 ?auto_21135 ) ) ( not ( = ?auto_21126 ?auto_21135 ) ) ( not ( = ?auto_21128 ?auto_21135 ) ) ( not ( = ?auto_21122 ?auto_21135 ) ) ( not ( = ?auto_21131 ?auto_21135 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21121 ?auto_21128 ?auto_21135 ?auto_21132 )
      ( MAKE-ON ?auto_21116 ?auto_21117 )
      ( MAKE-ON-VERIFY ?auto_21116 ?auto_21117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21136 - SURFACE
      ?auto_21137 - SURFACE
    )
    :vars
    (
      ?auto_21140 - HOIST
      ?auto_21148 - PLACE
      ?auto_21153 - PLACE
      ?auto_21149 - HOIST
      ?auto_21143 - SURFACE
      ?auto_21142 - SURFACE
      ?auto_21138 - PLACE
      ?auto_21154 - HOIST
      ?auto_21150 - SURFACE
      ?auto_21155 - SURFACE
      ?auto_21144 - PLACE
      ?auto_21141 - HOIST
      ?auto_21147 - SURFACE
      ?auto_21151 - SURFACE
      ?auto_21139 - PLACE
      ?auto_21146 - HOIST
      ?auto_21152 - SURFACE
      ?auto_21145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21140 ?auto_21148 ) ( IS-CRATE ?auto_21136 ) ( not ( = ?auto_21136 ?auto_21137 ) ) ( not ( = ?auto_21153 ?auto_21148 ) ) ( HOIST-AT ?auto_21149 ?auto_21153 ) ( not ( = ?auto_21140 ?auto_21149 ) ) ( AVAILABLE ?auto_21149 ) ( SURFACE-AT ?auto_21136 ?auto_21153 ) ( ON ?auto_21136 ?auto_21143 ) ( CLEAR ?auto_21136 ) ( not ( = ?auto_21136 ?auto_21143 ) ) ( not ( = ?auto_21137 ?auto_21143 ) ) ( IS-CRATE ?auto_21137 ) ( not ( = ?auto_21136 ?auto_21142 ) ) ( not ( = ?auto_21137 ?auto_21142 ) ) ( not ( = ?auto_21143 ?auto_21142 ) ) ( not ( = ?auto_21138 ?auto_21148 ) ) ( not ( = ?auto_21153 ?auto_21138 ) ) ( HOIST-AT ?auto_21154 ?auto_21138 ) ( not ( = ?auto_21140 ?auto_21154 ) ) ( not ( = ?auto_21149 ?auto_21154 ) ) ( AVAILABLE ?auto_21154 ) ( SURFACE-AT ?auto_21137 ?auto_21138 ) ( ON ?auto_21137 ?auto_21150 ) ( CLEAR ?auto_21137 ) ( not ( = ?auto_21136 ?auto_21150 ) ) ( not ( = ?auto_21137 ?auto_21150 ) ) ( not ( = ?auto_21143 ?auto_21150 ) ) ( not ( = ?auto_21142 ?auto_21150 ) ) ( IS-CRATE ?auto_21142 ) ( not ( = ?auto_21136 ?auto_21155 ) ) ( not ( = ?auto_21137 ?auto_21155 ) ) ( not ( = ?auto_21143 ?auto_21155 ) ) ( not ( = ?auto_21142 ?auto_21155 ) ) ( not ( = ?auto_21150 ?auto_21155 ) ) ( not ( = ?auto_21144 ?auto_21148 ) ) ( not ( = ?auto_21153 ?auto_21144 ) ) ( not ( = ?auto_21138 ?auto_21144 ) ) ( HOIST-AT ?auto_21141 ?auto_21144 ) ( not ( = ?auto_21140 ?auto_21141 ) ) ( not ( = ?auto_21149 ?auto_21141 ) ) ( not ( = ?auto_21154 ?auto_21141 ) ) ( AVAILABLE ?auto_21141 ) ( SURFACE-AT ?auto_21142 ?auto_21144 ) ( ON ?auto_21142 ?auto_21147 ) ( CLEAR ?auto_21142 ) ( not ( = ?auto_21136 ?auto_21147 ) ) ( not ( = ?auto_21137 ?auto_21147 ) ) ( not ( = ?auto_21143 ?auto_21147 ) ) ( not ( = ?auto_21142 ?auto_21147 ) ) ( not ( = ?auto_21150 ?auto_21147 ) ) ( not ( = ?auto_21155 ?auto_21147 ) ) ( SURFACE-AT ?auto_21151 ?auto_21148 ) ( CLEAR ?auto_21151 ) ( IS-CRATE ?auto_21155 ) ( not ( = ?auto_21136 ?auto_21151 ) ) ( not ( = ?auto_21137 ?auto_21151 ) ) ( not ( = ?auto_21143 ?auto_21151 ) ) ( not ( = ?auto_21142 ?auto_21151 ) ) ( not ( = ?auto_21150 ?auto_21151 ) ) ( not ( = ?auto_21155 ?auto_21151 ) ) ( not ( = ?auto_21147 ?auto_21151 ) ) ( AVAILABLE ?auto_21140 ) ( not ( = ?auto_21139 ?auto_21148 ) ) ( not ( = ?auto_21153 ?auto_21139 ) ) ( not ( = ?auto_21138 ?auto_21139 ) ) ( not ( = ?auto_21144 ?auto_21139 ) ) ( HOIST-AT ?auto_21146 ?auto_21139 ) ( not ( = ?auto_21140 ?auto_21146 ) ) ( not ( = ?auto_21149 ?auto_21146 ) ) ( not ( = ?auto_21154 ?auto_21146 ) ) ( not ( = ?auto_21141 ?auto_21146 ) ) ( AVAILABLE ?auto_21146 ) ( SURFACE-AT ?auto_21155 ?auto_21139 ) ( ON ?auto_21155 ?auto_21152 ) ( CLEAR ?auto_21155 ) ( not ( = ?auto_21136 ?auto_21152 ) ) ( not ( = ?auto_21137 ?auto_21152 ) ) ( not ( = ?auto_21143 ?auto_21152 ) ) ( not ( = ?auto_21142 ?auto_21152 ) ) ( not ( = ?auto_21150 ?auto_21152 ) ) ( not ( = ?auto_21155 ?auto_21152 ) ) ( not ( = ?auto_21147 ?auto_21152 ) ) ( not ( = ?auto_21151 ?auto_21152 ) ) ( TRUCK-AT ?auto_21145 ?auto_21148 ) )
    :subtasks
    ( ( !DRIVE ?auto_21145 ?auto_21148 ?auto_21139 )
      ( MAKE-ON ?auto_21136 ?auto_21137 )
      ( MAKE-ON-VERIFY ?auto_21136 ?auto_21137 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21158 - SURFACE
      ?auto_21159 - SURFACE
    )
    :vars
    (
      ?auto_21160 - HOIST
      ?auto_21161 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21160 ?auto_21161 ) ( SURFACE-AT ?auto_21159 ?auto_21161 ) ( CLEAR ?auto_21159 ) ( LIFTING ?auto_21160 ?auto_21158 ) ( IS-CRATE ?auto_21158 ) ( not ( = ?auto_21158 ?auto_21159 ) ) )
    :subtasks
    ( ( !DROP ?auto_21160 ?auto_21158 ?auto_21159 ?auto_21161 )
      ( MAKE-ON-VERIFY ?auto_21158 ?auto_21159 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21162 - SURFACE
      ?auto_21163 - SURFACE
    )
    :vars
    (
      ?auto_21164 - HOIST
      ?auto_21165 - PLACE
      ?auto_21166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21164 ?auto_21165 ) ( SURFACE-AT ?auto_21163 ?auto_21165 ) ( CLEAR ?auto_21163 ) ( IS-CRATE ?auto_21162 ) ( not ( = ?auto_21162 ?auto_21163 ) ) ( TRUCK-AT ?auto_21166 ?auto_21165 ) ( AVAILABLE ?auto_21164 ) ( IN ?auto_21162 ?auto_21166 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21164 ?auto_21162 ?auto_21166 ?auto_21165 )
      ( MAKE-ON ?auto_21162 ?auto_21163 )
      ( MAKE-ON-VERIFY ?auto_21162 ?auto_21163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21167 - SURFACE
      ?auto_21168 - SURFACE
    )
    :vars
    (
      ?auto_21169 - HOIST
      ?auto_21171 - PLACE
      ?auto_21170 - TRUCK
      ?auto_21172 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21169 ?auto_21171 ) ( SURFACE-AT ?auto_21168 ?auto_21171 ) ( CLEAR ?auto_21168 ) ( IS-CRATE ?auto_21167 ) ( not ( = ?auto_21167 ?auto_21168 ) ) ( AVAILABLE ?auto_21169 ) ( IN ?auto_21167 ?auto_21170 ) ( TRUCK-AT ?auto_21170 ?auto_21172 ) ( not ( = ?auto_21172 ?auto_21171 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21170 ?auto_21172 ?auto_21171 )
      ( MAKE-ON ?auto_21167 ?auto_21168 )
      ( MAKE-ON-VERIFY ?auto_21167 ?auto_21168 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21173 - SURFACE
      ?auto_21174 - SURFACE
    )
    :vars
    (
      ?auto_21175 - HOIST
      ?auto_21177 - PLACE
      ?auto_21176 - TRUCK
      ?auto_21178 - PLACE
      ?auto_21179 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21175 ?auto_21177 ) ( SURFACE-AT ?auto_21174 ?auto_21177 ) ( CLEAR ?auto_21174 ) ( IS-CRATE ?auto_21173 ) ( not ( = ?auto_21173 ?auto_21174 ) ) ( AVAILABLE ?auto_21175 ) ( TRUCK-AT ?auto_21176 ?auto_21178 ) ( not ( = ?auto_21178 ?auto_21177 ) ) ( HOIST-AT ?auto_21179 ?auto_21178 ) ( LIFTING ?auto_21179 ?auto_21173 ) ( not ( = ?auto_21175 ?auto_21179 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21179 ?auto_21173 ?auto_21176 ?auto_21178 )
      ( MAKE-ON ?auto_21173 ?auto_21174 )
      ( MAKE-ON-VERIFY ?auto_21173 ?auto_21174 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21180 - SURFACE
      ?auto_21181 - SURFACE
    )
    :vars
    (
      ?auto_21182 - HOIST
      ?auto_21185 - PLACE
      ?auto_21184 - TRUCK
      ?auto_21183 - PLACE
      ?auto_21186 - HOIST
      ?auto_21187 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21182 ?auto_21185 ) ( SURFACE-AT ?auto_21181 ?auto_21185 ) ( CLEAR ?auto_21181 ) ( IS-CRATE ?auto_21180 ) ( not ( = ?auto_21180 ?auto_21181 ) ) ( AVAILABLE ?auto_21182 ) ( TRUCK-AT ?auto_21184 ?auto_21183 ) ( not ( = ?auto_21183 ?auto_21185 ) ) ( HOIST-AT ?auto_21186 ?auto_21183 ) ( not ( = ?auto_21182 ?auto_21186 ) ) ( AVAILABLE ?auto_21186 ) ( SURFACE-AT ?auto_21180 ?auto_21183 ) ( ON ?auto_21180 ?auto_21187 ) ( CLEAR ?auto_21180 ) ( not ( = ?auto_21180 ?auto_21187 ) ) ( not ( = ?auto_21181 ?auto_21187 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21186 ?auto_21180 ?auto_21187 ?auto_21183 )
      ( MAKE-ON ?auto_21180 ?auto_21181 )
      ( MAKE-ON-VERIFY ?auto_21180 ?auto_21181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21188 - SURFACE
      ?auto_21189 - SURFACE
    )
    :vars
    (
      ?auto_21190 - HOIST
      ?auto_21193 - PLACE
      ?auto_21195 - PLACE
      ?auto_21194 - HOIST
      ?auto_21191 - SURFACE
      ?auto_21192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21190 ?auto_21193 ) ( SURFACE-AT ?auto_21189 ?auto_21193 ) ( CLEAR ?auto_21189 ) ( IS-CRATE ?auto_21188 ) ( not ( = ?auto_21188 ?auto_21189 ) ) ( AVAILABLE ?auto_21190 ) ( not ( = ?auto_21195 ?auto_21193 ) ) ( HOIST-AT ?auto_21194 ?auto_21195 ) ( not ( = ?auto_21190 ?auto_21194 ) ) ( AVAILABLE ?auto_21194 ) ( SURFACE-AT ?auto_21188 ?auto_21195 ) ( ON ?auto_21188 ?auto_21191 ) ( CLEAR ?auto_21188 ) ( not ( = ?auto_21188 ?auto_21191 ) ) ( not ( = ?auto_21189 ?auto_21191 ) ) ( TRUCK-AT ?auto_21192 ?auto_21193 ) )
    :subtasks
    ( ( !DRIVE ?auto_21192 ?auto_21193 ?auto_21195 )
      ( MAKE-ON ?auto_21188 ?auto_21189 )
      ( MAKE-ON-VERIFY ?auto_21188 ?auto_21189 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21196 - SURFACE
      ?auto_21197 - SURFACE
    )
    :vars
    (
      ?auto_21198 - HOIST
      ?auto_21201 - PLACE
      ?auto_21199 - PLACE
      ?auto_21203 - HOIST
      ?auto_21202 - SURFACE
      ?auto_21200 - TRUCK
      ?auto_21204 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21198 ?auto_21201 ) ( IS-CRATE ?auto_21196 ) ( not ( = ?auto_21196 ?auto_21197 ) ) ( not ( = ?auto_21199 ?auto_21201 ) ) ( HOIST-AT ?auto_21203 ?auto_21199 ) ( not ( = ?auto_21198 ?auto_21203 ) ) ( AVAILABLE ?auto_21203 ) ( SURFACE-AT ?auto_21196 ?auto_21199 ) ( ON ?auto_21196 ?auto_21202 ) ( CLEAR ?auto_21196 ) ( not ( = ?auto_21196 ?auto_21202 ) ) ( not ( = ?auto_21197 ?auto_21202 ) ) ( TRUCK-AT ?auto_21200 ?auto_21201 ) ( SURFACE-AT ?auto_21204 ?auto_21201 ) ( CLEAR ?auto_21204 ) ( LIFTING ?auto_21198 ?auto_21197 ) ( IS-CRATE ?auto_21197 ) ( not ( = ?auto_21196 ?auto_21204 ) ) ( not ( = ?auto_21197 ?auto_21204 ) ) ( not ( = ?auto_21202 ?auto_21204 ) ) )
    :subtasks
    ( ( !DROP ?auto_21198 ?auto_21197 ?auto_21204 ?auto_21201 )
      ( MAKE-ON ?auto_21196 ?auto_21197 )
      ( MAKE-ON-VERIFY ?auto_21196 ?auto_21197 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21205 - SURFACE
      ?auto_21206 - SURFACE
    )
    :vars
    (
      ?auto_21207 - HOIST
      ?auto_21212 - PLACE
      ?auto_21208 - PLACE
      ?auto_21211 - HOIST
      ?auto_21210 - SURFACE
      ?auto_21209 - TRUCK
      ?auto_21213 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21207 ?auto_21212 ) ( IS-CRATE ?auto_21205 ) ( not ( = ?auto_21205 ?auto_21206 ) ) ( not ( = ?auto_21208 ?auto_21212 ) ) ( HOIST-AT ?auto_21211 ?auto_21208 ) ( not ( = ?auto_21207 ?auto_21211 ) ) ( AVAILABLE ?auto_21211 ) ( SURFACE-AT ?auto_21205 ?auto_21208 ) ( ON ?auto_21205 ?auto_21210 ) ( CLEAR ?auto_21205 ) ( not ( = ?auto_21205 ?auto_21210 ) ) ( not ( = ?auto_21206 ?auto_21210 ) ) ( TRUCK-AT ?auto_21209 ?auto_21212 ) ( SURFACE-AT ?auto_21213 ?auto_21212 ) ( CLEAR ?auto_21213 ) ( IS-CRATE ?auto_21206 ) ( not ( = ?auto_21205 ?auto_21213 ) ) ( not ( = ?auto_21206 ?auto_21213 ) ) ( not ( = ?auto_21210 ?auto_21213 ) ) ( AVAILABLE ?auto_21207 ) ( IN ?auto_21206 ?auto_21209 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21207 ?auto_21206 ?auto_21209 ?auto_21212 )
      ( MAKE-ON ?auto_21205 ?auto_21206 )
      ( MAKE-ON-VERIFY ?auto_21205 ?auto_21206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21214 - SURFACE
      ?auto_21215 - SURFACE
    )
    :vars
    (
      ?auto_21220 - HOIST
      ?auto_21216 - PLACE
      ?auto_21217 - PLACE
      ?auto_21219 - HOIST
      ?auto_21218 - SURFACE
      ?auto_21221 - SURFACE
      ?auto_21222 - TRUCK
      ?auto_21223 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21220 ?auto_21216 ) ( IS-CRATE ?auto_21214 ) ( not ( = ?auto_21214 ?auto_21215 ) ) ( not ( = ?auto_21217 ?auto_21216 ) ) ( HOIST-AT ?auto_21219 ?auto_21217 ) ( not ( = ?auto_21220 ?auto_21219 ) ) ( AVAILABLE ?auto_21219 ) ( SURFACE-AT ?auto_21214 ?auto_21217 ) ( ON ?auto_21214 ?auto_21218 ) ( CLEAR ?auto_21214 ) ( not ( = ?auto_21214 ?auto_21218 ) ) ( not ( = ?auto_21215 ?auto_21218 ) ) ( SURFACE-AT ?auto_21221 ?auto_21216 ) ( CLEAR ?auto_21221 ) ( IS-CRATE ?auto_21215 ) ( not ( = ?auto_21214 ?auto_21221 ) ) ( not ( = ?auto_21215 ?auto_21221 ) ) ( not ( = ?auto_21218 ?auto_21221 ) ) ( AVAILABLE ?auto_21220 ) ( IN ?auto_21215 ?auto_21222 ) ( TRUCK-AT ?auto_21222 ?auto_21223 ) ( not ( = ?auto_21223 ?auto_21216 ) ) ( not ( = ?auto_21217 ?auto_21223 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21222 ?auto_21223 ?auto_21216 )
      ( MAKE-ON ?auto_21214 ?auto_21215 )
      ( MAKE-ON-VERIFY ?auto_21214 ?auto_21215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21224 - SURFACE
      ?auto_21225 - SURFACE
    )
    :vars
    (
      ?auto_21226 - HOIST
      ?auto_21229 - PLACE
      ?auto_21227 - PLACE
      ?auto_21231 - HOIST
      ?auto_21232 - SURFACE
      ?auto_21230 - SURFACE
      ?auto_21233 - TRUCK
      ?auto_21228 - PLACE
      ?auto_21234 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21226 ?auto_21229 ) ( IS-CRATE ?auto_21224 ) ( not ( = ?auto_21224 ?auto_21225 ) ) ( not ( = ?auto_21227 ?auto_21229 ) ) ( HOIST-AT ?auto_21231 ?auto_21227 ) ( not ( = ?auto_21226 ?auto_21231 ) ) ( AVAILABLE ?auto_21231 ) ( SURFACE-AT ?auto_21224 ?auto_21227 ) ( ON ?auto_21224 ?auto_21232 ) ( CLEAR ?auto_21224 ) ( not ( = ?auto_21224 ?auto_21232 ) ) ( not ( = ?auto_21225 ?auto_21232 ) ) ( SURFACE-AT ?auto_21230 ?auto_21229 ) ( CLEAR ?auto_21230 ) ( IS-CRATE ?auto_21225 ) ( not ( = ?auto_21224 ?auto_21230 ) ) ( not ( = ?auto_21225 ?auto_21230 ) ) ( not ( = ?auto_21232 ?auto_21230 ) ) ( AVAILABLE ?auto_21226 ) ( TRUCK-AT ?auto_21233 ?auto_21228 ) ( not ( = ?auto_21228 ?auto_21229 ) ) ( not ( = ?auto_21227 ?auto_21228 ) ) ( HOIST-AT ?auto_21234 ?auto_21228 ) ( LIFTING ?auto_21234 ?auto_21225 ) ( not ( = ?auto_21226 ?auto_21234 ) ) ( not ( = ?auto_21231 ?auto_21234 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21234 ?auto_21225 ?auto_21233 ?auto_21228 )
      ( MAKE-ON ?auto_21224 ?auto_21225 )
      ( MAKE-ON-VERIFY ?auto_21224 ?auto_21225 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21235 - SURFACE
      ?auto_21236 - SURFACE
    )
    :vars
    (
      ?auto_21237 - HOIST
      ?auto_21238 - PLACE
      ?auto_21241 - PLACE
      ?auto_21245 - HOIST
      ?auto_21239 - SURFACE
      ?auto_21243 - SURFACE
      ?auto_21240 - TRUCK
      ?auto_21244 - PLACE
      ?auto_21242 - HOIST
      ?auto_21246 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21237 ?auto_21238 ) ( IS-CRATE ?auto_21235 ) ( not ( = ?auto_21235 ?auto_21236 ) ) ( not ( = ?auto_21241 ?auto_21238 ) ) ( HOIST-AT ?auto_21245 ?auto_21241 ) ( not ( = ?auto_21237 ?auto_21245 ) ) ( AVAILABLE ?auto_21245 ) ( SURFACE-AT ?auto_21235 ?auto_21241 ) ( ON ?auto_21235 ?auto_21239 ) ( CLEAR ?auto_21235 ) ( not ( = ?auto_21235 ?auto_21239 ) ) ( not ( = ?auto_21236 ?auto_21239 ) ) ( SURFACE-AT ?auto_21243 ?auto_21238 ) ( CLEAR ?auto_21243 ) ( IS-CRATE ?auto_21236 ) ( not ( = ?auto_21235 ?auto_21243 ) ) ( not ( = ?auto_21236 ?auto_21243 ) ) ( not ( = ?auto_21239 ?auto_21243 ) ) ( AVAILABLE ?auto_21237 ) ( TRUCK-AT ?auto_21240 ?auto_21244 ) ( not ( = ?auto_21244 ?auto_21238 ) ) ( not ( = ?auto_21241 ?auto_21244 ) ) ( HOIST-AT ?auto_21242 ?auto_21244 ) ( not ( = ?auto_21237 ?auto_21242 ) ) ( not ( = ?auto_21245 ?auto_21242 ) ) ( AVAILABLE ?auto_21242 ) ( SURFACE-AT ?auto_21236 ?auto_21244 ) ( ON ?auto_21236 ?auto_21246 ) ( CLEAR ?auto_21236 ) ( not ( = ?auto_21235 ?auto_21246 ) ) ( not ( = ?auto_21236 ?auto_21246 ) ) ( not ( = ?auto_21239 ?auto_21246 ) ) ( not ( = ?auto_21243 ?auto_21246 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21242 ?auto_21236 ?auto_21246 ?auto_21244 )
      ( MAKE-ON ?auto_21235 ?auto_21236 )
      ( MAKE-ON-VERIFY ?auto_21235 ?auto_21236 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21247 - SURFACE
      ?auto_21248 - SURFACE
    )
    :vars
    (
      ?auto_21251 - HOIST
      ?auto_21255 - PLACE
      ?auto_21257 - PLACE
      ?auto_21252 - HOIST
      ?auto_21256 - SURFACE
      ?auto_21258 - SURFACE
      ?auto_21254 - PLACE
      ?auto_21253 - HOIST
      ?auto_21249 - SURFACE
      ?auto_21250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21251 ?auto_21255 ) ( IS-CRATE ?auto_21247 ) ( not ( = ?auto_21247 ?auto_21248 ) ) ( not ( = ?auto_21257 ?auto_21255 ) ) ( HOIST-AT ?auto_21252 ?auto_21257 ) ( not ( = ?auto_21251 ?auto_21252 ) ) ( AVAILABLE ?auto_21252 ) ( SURFACE-AT ?auto_21247 ?auto_21257 ) ( ON ?auto_21247 ?auto_21256 ) ( CLEAR ?auto_21247 ) ( not ( = ?auto_21247 ?auto_21256 ) ) ( not ( = ?auto_21248 ?auto_21256 ) ) ( SURFACE-AT ?auto_21258 ?auto_21255 ) ( CLEAR ?auto_21258 ) ( IS-CRATE ?auto_21248 ) ( not ( = ?auto_21247 ?auto_21258 ) ) ( not ( = ?auto_21248 ?auto_21258 ) ) ( not ( = ?auto_21256 ?auto_21258 ) ) ( AVAILABLE ?auto_21251 ) ( not ( = ?auto_21254 ?auto_21255 ) ) ( not ( = ?auto_21257 ?auto_21254 ) ) ( HOIST-AT ?auto_21253 ?auto_21254 ) ( not ( = ?auto_21251 ?auto_21253 ) ) ( not ( = ?auto_21252 ?auto_21253 ) ) ( AVAILABLE ?auto_21253 ) ( SURFACE-AT ?auto_21248 ?auto_21254 ) ( ON ?auto_21248 ?auto_21249 ) ( CLEAR ?auto_21248 ) ( not ( = ?auto_21247 ?auto_21249 ) ) ( not ( = ?auto_21248 ?auto_21249 ) ) ( not ( = ?auto_21256 ?auto_21249 ) ) ( not ( = ?auto_21258 ?auto_21249 ) ) ( TRUCK-AT ?auto_21250 ?auto_21255 ) )
    :subtasks
    ( ( !DRIVE ?auto_21250 ?auto_21255 ?auto_21254 )
      ( MAKE-ON ?auto_21247 ?auto_21248 )
      ( MAKE-ON-VERIFY ?auto_21247 ?auto_21248 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21259 - SURFACE
      ?auto_21260 - SURFACE
    )
    :vars
    (
      ?auto_21265 - HOIST
      ?auto_21262 - PLACE
      ?auto_21266 - PLACE
      ?auto_21261 - HOIST
      ?auto_21263 - SURFACE
      ?auto_21270 - SURFACE
      ?auto_21264 - PLACE
      ?auto_21268 - HOIST
      ?auto_21269 - SURFACE
      ?auto_21267 - TRUCK
      ?auto_21271 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21265 ?auto_21262 ) ( IS-CRATE ?auto_21259 ) ( not ( = ?auto_21259 ?auto_21260 ) ) ( not ( = ?auto_21266 ?auto_21262 ) ) ( HOIST-AT ?auto_21261 ?auto_21266 ) ( not ( = ?auto_21265 ?auto_21261 ) ) ( AVAILABLE ?auto_21261 ) ( SURFACE-AT ?auto_21259 ?auto_21266 ) ( ON ?auto_21259 ?auto_21263 ) ( CLEAR ?auto_21259 ) ( not ( = ?auto_21259 ?auto_21263 ) ) ( not ( = ?auto_21260 ?auto_21263 ) ) ( IS-CRATE ?auto_21260 ) ( not ( = ?auto_21259 ?auto_21270 ) ) ( not ( = ?auto_21260 ?auto_21270 ) ) ( not ( = ?auto_21263 ?auto_21270 ) ) ( not ( = ?auto_21264 ?auto_21262 ) ) ( not ( = ?auto_21266 ?auto_21264 ) ) ( HOIST-AT ?auto_21268 ?auto_21264 ) ( not ( = ?auto_21265 ?auto_21268 ) ) ( not ( = ?auto_21261 ?auto_21268 ) ) ( AVAILABLE ?auto_21268 ) ( SURFACE-AT ?auto_21260 ?auto_21264 ) ( ON ?auto_21260 ?auto_21269 ) ( CLEAR ?auto_21260 ) ( not ( = ?auto_21259 ?auto_21269 ) ) ( not ( = ?auto_21260 ?auto_21269 ) ) ( not ( = ?auto_21263 ?auto_21269 ) ) ( not ( = ?auto_21270 ?auto_21269 ) ) ( TRUCK-AT ?auto_21267 ?auto_21262 ) ( SURFACE-AT ?auto_21271 ?auto_21262 ) ( CLEAR ?auto_21271 ) ( LIFTING ?auto_21265 ?auto_21270 ) ( IS-CRATE ?auto_21270 ) ( not ( = ?auto_21259 ?auto_21271 ) ) ( not ( = ?auto_21260 ?auto_21271 ) ) ( not ( = ?auto_21263 ?auto_21271 ) ) ( not ( = ?auto_21270 ?auto_21271 ) ) ( not ( = ?auto_21269 ?auto_21271 ) ) )
    :subtasks
    ( ( !DROP ?auto_21265 ?auto_21270 ?auto_21271 ?auto_21262 )
      ( MAKE-ON ?auto_21259 ?auto_21260 )
      ( MAKE-ON-VERIFY ?auto_21259 ?auto_21260 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21272 - SURFACE
      ?auto_21273 - SURFACE
    )
    :vars
    (
      ?auto_21275 - HOIST
      ?auto_21274 - PLACE
      ?auto_21276 - PLACE
      ?auto_21281 - HOIST
      ?auto_21282 - SURFACE
      ?auto_21279 - SURFACE
      ?auto_21283 - PLACE
      ?auto_21278 - HOIST
      ?auto_21284 - SURFACE
      ?auto_21280 - TRUCK
      ?auto_21277 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21275 ?auto_21274 ) ( IS-CRATE ?auto_21272 ) ( not ( = ?auto_21272 ?auto_21273 ) ) ( not ( = ?auto_21276 ?auto_21274 ) ) ( HOIST-AT ?auto_21281 ?auto_21276 ) ( not ( = ?auto_21275 ?auto_21281 ) ) ( AVAILABLE ?auto_21281 ) ( SURFACE-AT ?auto_21272 ?auto_21276 ) ( ON ?auto_21272 ?auto_21282 ) ( CLEAR ?auto_21272 ) ( not ( = ?auto_21272 ?auto_21282 ) ) ( not ( = ?auto_21273 ?auto_21282 ) ) ( IS-CRATE ?auto_21273 ) ( not ( = ?auto_21272 ?auto_21279 ) ) ( not ( = ?auto_21273 ?auto_21279 ) ) ( not ( = ?auto_21282 ?auto_21279 ) ) ( not ( = ?auto_21283 ?auto_21274 ) ) ( not ( = ?auto_21276 ?auto_21283 ) ) ( HOIST-AT ?auto_21278 ?auto_21283 ) ( not ( = ?auto_21275 ?auto_21278 ) ) ( not ( = ?auto_21281 ?auto_21278 ) ) ( AVAILABLE ?auto_21278 ) ( SURFACE-AT ?auto_21273 ?auto_21283 ) ( ON ?auto_21273 ?auto_21284 ) ( CLEAR ?auto_21273 ) ( not ( = ?auto_21272 ?auto_21284 ) ) ( not ( = ?auto_21273 ?auto_21284 ) ) ( not ( = ?auto_21282 ?auto_21284 ) ) ( not ( = ?auto_21279 ?auto_21284 ) ) ( TRUCK-AT ?auto_21280 ?auto_21274 ) ( SURFACE-AT ?auto_21277 ?auto_21274 ) ( CLEAR ?auto_21277 ) ( IS-CRATE ?auto_21279 ) ( not ( = ?auto_21272 ?auto_21277 ) ) ( not ( = ?auto_21273 ?auto_21277 ) ) ( not ( = ?auto_21282 ?auto_21277 ) ) ( not ( = ?auto_21279 ?auto_21277 ) ) ( not ( = ?auto_21284 ?auto_21277 ) ) ( AVAILABLE ?auto_21275 ) ( IN ?auto_21279 ?auto_21280 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21275 ?auto_21279 ?auto_21280 ?auto_21274 )
      ( MAKE-ON ?auto_21272 ?auto_21273 )
      ( MAKE-ON-VERIFY ?auto_21272 ?auto_21273 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21285 - SURFACE
      ?auto_21286 - SURFACE
    )
    :vars
    (
      ?auto_21287 - HOIST
      ?auto_21295 - PLACE
      ?auto_21291 - PLACE
      ?auto_21296 - HOIST
      ?auto_21290 - SURFACE
      ?auto_21292 - SURFACE
      ?auto_21288 - PLACE
      ?auto_21297 - HOIST
      ?auto_21294 - SURFACE
      ?auto_21289 - SURFACE
      ?auto_21293 - TRUCK
      ?auto_21298 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21287 ?auto_21295 ) ( IS-CRATE ?auto_21285 ) ( not ( = ?auto_21285 ?auto_21286 ) ) ( not ( = ?auto_21291 ?auto_21295 ) ) ( HOIST-AT ?auto_21296 ?auto_21291 ) ( not ( = ?auto_21287 ?auto_21296 ) ) ( AVAILABLE ?auto_21296 ) ( SURFACE-AT ?auto_21285 ?auto_21291 ) ( ON ?auto_21285 ?auto_21290 ) ( CLEAR ?auto_21285 ) ( not ( = ?auto_21285 ?auto_21290 ) ) ( not ( = ?auto_21286 ?auto_21290 ) ) ( IS-CRATE ?auto_21286 ) ( not ( = ?auto_21285 ?auto_21292 ) ) ( not ( = ?auto_21286 ?auto_21292 ) ) ( not ( = ?auto_21290 ?auto_21292 ) ) ( not ( = ?auto_21288 ?auto_21295 ) ) ( not ( = ?auto_21291 ?auto_21288 ) ) ( HOIST-AT ?auto_21297 ?auto_21288 ) ( not ( = ?auto_21287 ?auto_21297 ) ) ( not ( = ?auto_21296 ?auto_21297 ) ) ( AVAILABLE ?auto_21297 ) ( SURFACE-AT ?auto_21286 ?auto_21288 ) ( ON ?auto_21286 ?auto_21294 ) ( CLEAR ?auto_21286 ) ( not ( = ?auto_21285 ?auto_21294 ) ) ( not ( = ?auto_21286 ?auto_21294 ) ) ( not ( = ?auto_21290 ?auto_21294 ) ) ( not ( = ?auto_21292 ?auto_21294 ) ) ( SURFACE-AT ?auto_21289 ?auto_21295 ) ( CLEAR ?auto_21289 ) ( IS-CRATE ?auto_21292 ) ( not ( = ?auto_21285 ?auto_21289 ) ) ( not ( = ?auto_21286 ?auto_21289 ) ) ( not ( = ?auto_21290 ?auto_21289 ) ) ( not ( = ?auto_21292 ?auto_21289 ) ) ( not ( = ?auto_21294 ?auto_21289 ) ) ( AVAILABLE ?auto_21287 ) ( IN ?auto_21292 ?auto_21293 ) ( TRUCK-AT ?auto_21293 ?auto_21298 ) ( not ( = ?auto_21298 ?auto_21295 ) ) ( not ( = ?auto_21291 ?auto_21298 ) ) ( not ( = ?auto_21288 ?auto_21298 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21293 ?auto_21298 ?auto_21295 )
      ( MAKE-ON ?auto_21285 ?auto_21286 )
      ( MAKE-ON-VERIFY ?auto_21285 ?auto_21286 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21299 - SURFACE
      ?auto_21300 - SURFACE
    )
    :vars
    (
      ?auto_21306 - HOIST
      ?auto_21303 - PLACE
      ?auto_21304 - PLACE
      ?auto_21302 - HOIST
      ?auto_21311 - SURFACE
      ?auto_21307 - SURFACE
      ?auto_21309 - PLACE
      ?auto_21310 - HOIST
      ?auto_21301 - SURFACE
      ?auto_21312 - SURFACE
      ?auto_21305 - TRUCK
      ?auto_21308 - PLACE
      ?auto_21313 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21306 ?auto_21303 ) ( IS-CRATE ?auto_21299 ) ( not ( = ?auto_21299 ?auto_21300 ) ) ( not ( = ?auto_21304 ?auto_21303 ) ) ( HOIST-AT ?auto_21302 ?auto_21304 ) ( not ( = ?auto_21306 ?auto_21302 ) ) ( AVAILABLE ?auto_21302 ) ( SURFACE-AT ?auto_21299 ?auto_21304 ) ( ON ?auto_21299 ?auto_21311 ) ( CLEAR ?auto_21299 ) ( not ( = ?auto_21299 ?auto_21311 ) ) ( not ( = ?auto_21300 ?auto_21311 ) ) ( IS-CRATE ?auto_21300 ) ( not ( = ?auto_21299 ?auto_21307 ) ) ( not ( = ?auto_21300 ?auto_21307 ) ) ( not ( = ?auto_21311 ?auto_21307 ) ) ( not ( = ?auto_21309 ?auto_21303 ) ) ( not ( = ?auto_21304 ?auto_21309 ) ) ( HOIST-AT ?auto_21310 ?auto_21309 ) ( not ( = ?auto_21306 ?auto_21310 ) ) ( not ( = ?auto_21302 ?auto_21310 ) ) ( AVAILABLE ?auto_21310 ) ( SURFACE-AT ?auto_21300 ?auto_21309 ) ( ON ?auto_21300 ?auto_21301 ) ( CLEAR ?auto_21300 ) ( not ( = ?auto_21299 ?auto_21301 ) ) ( not ( = ?auto_21300 ?auto_21301 ) ) ( not ( = ?auto_21311 ?auto_21301 ) ) ( not ( = ?auto_21307 ?auto_21301 ) ) ( SURFACE-AT ?auto_21312 ?auto_21303 ) ( CLEAR ?auto_21312 ) ( IS-CRATE ?auto_21307 ) ( not ( = ?auto_21299 ?auto_21312 ) ) ( not ( = ?auto_21300 ?auto_21312 ) ) ( not ( = ?auto_21311 ?auto_21312 ) ) ( not ( = ?auto_21307 ?auto_21312 ) ) ( not ( = ?auto_21301 ?auto_21312 ) ) ( AVAILABLE ?auto_21306 ) ( TRUCK-AT ?auto_21305 ?auto_21308 ) ( not ( = ?auto_21308 ?auto_21303 ) ) ( not ( = ?auto_21304 ?auto_21308 ) ) ( not ( = ?auto_21309 ?auto_21308 ) ) ( HOIST-AT ?auto_21313 ?auto_21308 ) ( LIFTING ?auto_21313 ?auto_21307 ) ( not ( = ?auto_21306 ?auto_21313 ) ) ( not ( = ?auto_21302 ?auto_21313 ) ) ( not ( = ?auto_21310 ?auto_21313 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21313 ?auto_21307 ?auto_21305 ?auto_21308 )
      ( MAKE-ON ?auto_21299 ?auto_21300 )
      ( MAKE-ON-VERIFY ?auto_21299 ?auto_21300 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21314 - SURFACE
      ?auto_21315 - SURFACE
    )
    :vars
    (
      ?auto_21328 - HOIST
      ?auto_21324 - PLACE
      ?auto_21318 - PLACE
      ?auto_21319 - HOIST
      ?auto_21317 - SURFACE
      ?auto_21326 - SURFACE
      ?auto_21327 - PLACE
      ?auto_21323 - HOIST
      ?auto_21320 - SURFACE
      ?auto_21321 - SURFACE
      ?auto_21316 - TRUCK
      ?auto_21322 - PLACE
      ?auto_21325 - HOIST
      ?auto_21329 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21328 ?auto_21324 ) ( IS-CRATE ?auto_21314 ) ( not ( = ?auto_21314 ?auto_21315 ) ) ( not ( = ?auto_21318 ?auto_21324 ) ) ( HOIST-AT ?auto_21319 ?auto_21318 ) ( not ( = ?auto_21328 ?auto_21319 ) ) ( AVAILABLE ?auto_21319 ) ( SURFACE-AT ?auto_21314 ?auto_21318 ) ( ON ?auto_21314 ?auto_21317 ) ( CLEAR ?auto_21314 ) ( not ( = ?auto_21314 ?auto_21317 ) ) ( not ( = ?auto_21315 ?auto_21317 ) ) ( IS-CRATE ?auto_21315 ) ( not ( = ?auto_21314 ?auto_21326 ) ) ( not ( = ?auto_21315 ?auto_21326 ) ) ( not ( = ?auto_21317 ?auto_21326 ) ) ( not ( = ?auto_21327 ?auto_21324 ) ) ( not ( = ?auto_21318 ?auto_21327 ) ) ( HOIST-AT ?auto_21323 ?auto_21327 ) ( not ( = ?auto_21328 ?auto_21323 ) ) ( not ( = ?auto_21319 ?auto_21323 ) ) ( AVAILABLE ?auto_21323 ) ( SURFACE-AT ?auto_21315 ?auto_21327 ) ( ON ?auto_21315 ?auto_21320 ) ( CLEAR ?auto_21315 ) ( not ( = ?auto_21314 ?auto_21320 ) ) ( not ( = ?auto_21315 ?auto_21320 ) ) ( not ( = ?auto_21317 ?auto_21320 ) ) ( not ( = ?auto_21326 ?auto_21320 ) ) ( SURFACE-AT ?auto_21321 ?auto_21324 ) ( CLEAR ?auto_21321 ) ( IS-CRATE ?auto_21326 ) ( not ( = ?auto_21314 ?auto_21321 ) ) ( not ( = ?auto_21315 ?auto_21321 ) ) ( not ( = ?auto_21317 ?auto_21321 ) ) ( not ( = ?auto_21326 ?auto_21321 ) ) ( not ( = ?auto_21320 ?auto_21321 ) ) ( AVAILABLE ?auto_21328 ) ( TRUCK-AT ?auto_21316 ?auto_21322 ) ( not ( = ?auto_21322 ?auto_21324 ) ) ( not ( = ?auto_21318 ?auto_21322 ) ) ( not ( = ?auto_21327 ?auto_21322 ) ) ( HOIST-AT ?auto_21325 ?auto_21322 ) ( not ( = ?auto_21328 ?auto_21325 ) ) ( not ( = ?auto_21319 ?auto_21325 ) ) ( not ( = ?auto_21323 ?auto_21325 ) ) ( AVAILABLE ?auto_21325 ) ( SURFACE-AT ?auto_21326 ?auto_21322 ) ( ON ?auto_21326 ?auto_21329 ) ( CLEAR ?auto_21326 ) ( not ( = ?auto_21314 ?auto_21329 ) ) ( not ( = ?auto_21315 ?auto_21329 ) ) ( not ( = ?auto_21317 ?auto_21329 ) ) ( not ( = ?auto_21326 ?auto_21329 ) ) ( not ( = ?auto_21320 ?auto_21329 ) ) ( not ( = ?auto_21321 ?auto_21329 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21325 ?auto_21326 ?auto_21329 ?auto_21322 )
      ( MAKE-ON ?auto_21314 ?auto_21315 )
      ( MAKE-ON-VERIFY ?auto_21314 ?auto_21315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21330 - SURFACE
      ?auto_21331 - SURFACE
    )
    :vars
    (
      ?auto_21334 - HOIST
      ?auto_21337 - PLACE
      ?auto_21342 - PLACE
      ?auto_21343 - HOIST
      ?auto_21332 - SURFACE
      ?auto_21344 - SURFACE
      ?auto_21339 - PLACE
      ?auto_21336 - HOIST
      ?auto_21345 - SURFACE
      ?auto_21333 - SURFACE
      ?auto_21335 - PLACE
      ?auto_21341 - HOIST
      ?auto_21338 - SURFACE
      ?auto_21340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21334 ?auto_21337 ) ( IS-CRATE ?auto_21330 ) ( not ( = ?auto_21330 ?auto_21331 ) ) ( not ( = ?auto_21342 ?auto_21337 ) ) ( HOIST-AT ?auto_21343 ?auto_21342 ) ( not ( = ?auto_21334 ?auto_21343 ) ) ( AVAILABLE ?auto_21343 ) ( SURFACE-AT ?auto_21330 ?auto_21342 ) ( ON ?auto_21330 ?auto_21332 ) ( CLEAR ?auto_21330 ) ( not ( = ?auto_21330 ?auto_21332 ) ) ( not ( = ?auto_21331 ?auto_21332 ) ) ( IS-CRATE ?auto_21331 ) ( not ( = ?auto_21330 ?auto_21344 ) ) ( not ( = ?auto_21331 ?auto_21344 ) ) ( not ( = ?auto_21332 ?auto_21344 ) ) ( not ( = ?auto_21339 ?auto_21337 ) ) ( not ( = ?auto_21342 ?auto_21339 ) ) ( HOIST-AT ?auto_21336 ?auto_21339 ) ( not ( = ?auto_21334 ?auto_21336 ) ) ( not ( = ?auto_21343 ?auto_21336 ) ) ( AVAILABLE ?auto_21336 ) ( SURFACE-AT ?auto_21331 ?auto_21339 ) ( ON ?auto_21331 ?auto_21345 ) ( CLEAR ?auto_21331 ) ( not ( = ?auto_21330 ?auto_21345 ) ) ( not ( = ?auto_21331 ?auto_21345 ) ) ( not ( = ?auto_21332 ?auto_21345 ) ) ( not ( = ?auto_21344 ?auto_21345 ) ) ( SURFACE-AT ?auto_21333 ?auto_21337 ) ( CLEAR ?auto_21333 ) ( IS-CRATE ?auto_21344 ) ( not ( = ?auto_21330 ?auto_21333 ) ) ( not ( = ?auto_21331 ?auto_21333 ) ) ( not ( = ?auto_21332 ?auto_21333 ) ) ( not ( = ?auto_21344 ?auto_21333 ) ) ( not ( = ?auto_21345 ?auto_21333 ) ) ( AVAILABLE ?auto_21334 ) ( not ( = ?auto_21335 ?auto_21337 ) ) ( not ( = ?auto_21342 ?auto_21335 ) ) ( not ( = ?auto_21339 ?auto_21335 ) ) ( HOIST-AT ?auto_21341 ?auto_21335 ) ( not ( = ?auto_21334 ?auto_21341 ) ) ( not ( = ?auto_21343 ?auto_21341 ) ) ( not ( = ?auto_21336 ?auto_21341 ) ) ( AVAILABLE ?auto_21341 ) ( SURFACE-AT ?auto_21344 ?auto_21335 ) ( ON ?auto_21344 ?auto_21338 ) ( CLEAR ?auto_21344 ) ( not ( = ?auto_21330 ?auto_21338 ) ) ( not ( = ?auto_21331 ?auto_21338 ) ) ( not ( = ?auto_21332 ?auto_21338 ) ) ( not ( = ?auto_21344 ?auto_21338 ) ) ( not ( = ?auto_21345 ?auto_21338 ) ) ( not ( = ?auto_21333 ?auto_21338 ) ) ( TRUCK-AT ?auto_21340 ?auto_21337 ) )
    :subtasks
    ( ( !DRIVE ?auto_21340 ?auto_21337 ?auto_21335 )
      ( MAKE-ON ?auto_21330 ?auto_21331 )
      ( MAKE-ON-VERIFY ?auto_21330 ?auto_21331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21346 - SURFACE
      ?auto_21347 - SURFACE
    )
    :vars
    (
      ?auto_21355 - HOIST
      ?auto_21348 - PLACE
      ?auto_21350 - PLACE
      ?auto_21356 - HOIST
      ?auto_21361 - SURFACE
      ?auto_21353 - SURFACE
      ?auto_21349 - PLACE
      ?auto_21352 - HOIST
      ?auto_21357 - SURFACE
      ?auto_21360 - SURFACE
      ?auto_21358 - PLACE
      ?auto_21351 - HOIST
      ?auto_21354 - SURFACE
      ?auto_21359 - TRUCK
      ?auto_21362 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21355 ?auto_21348 ) ( IS-CRATE ?auto_21346 ) ( not ( = ?auto_21346 ?auto_21347 ) ) ( not ( = ?auto_21350 ?auto_21348 ) ) ( HOIST-AT ?auto_21356 ?auto_21350 ) ( not ( = ?auto_21355 ?auto_21356 ) ) ( AVAILABLE ?auto_21356 ) ( SURFACE-AT ?auto_21346 ?auto_21350 ) ( ON ?auto_21346 ?auto_21361 ) ( CLEAR ?auto_21346 ) ( not ( = ?auto_21346 ?auto_21361 ) ) ( not ( = ?auto_21347 ?auto_21361 ) ) ( IS-CRATE ?auto_21347 ) ( not ( = ?auto_21346 ?auto_21353 ) ) ( not ( = ?auto_21347 ?auto_21353 ) ) ( not ( = ?auto_21361 ?auto_21353 ) ) ( not ( = ?auto_21349 ?auto_21348 ) ) ( not ( = ?auto_21350 ?auto_21349 ) ) ( HOIST-AT ?auto_21352 ?auto_21349 ) ( not ( = ?auto_21355 ?auto_21352 ) ) ( not ( = ?auto_21356 ?auto_21352 ) ) ( AVAILABLE ?auto_21352 ) ( SURFACE-AT ?auto_21347 ?auto_21349 ) ( ON ?auto_21347 ?auto_21357 ) ( CLEAR ?auto_21347 ) ( not ( = ?auto_21346 ?auto_21357 ) ) ( not ( = ?auto_21347 ?auto_21357 ) ) ( not ( = ?auto_21361 ?auto_21357 ) ) ( not ( = ?auto_21353 ?auto_21357 ) ) ( IS-CRATE ?auto_21353 ) ( not ( = ?auto_21346 ?auto_21360 ) ) ( not ( = ?auto_21347 ?auto_21360 ) ) ( not ( = ?auto_21361 ?auto_21360 ) ) ( not ( = ?auto_21353 ?auto_21360 ) ) ( not ( = ?auto_21357 ?auto_21360 ) ) ( not ( = ?auto_21358 ?auto_21348 ) ) ( not ( = ?auto_21350 ?auto_21358 ) ) ( not ( = ?auto_21349 ?auto_21358 ) ) ( HOIST-AT ?auto_21351 ?auto_21358 ) ( not ( = ?auto_21355 ?auto_21351 ) ) ( not ( = ?auto_21356 ?auto_21351 ) ) ( not ( = ?auto_21352 ?auto_21351 ) ) ( AVAILABLE ?auto_21351 ) ( SURFACE-AT ?auto_21353 ?auto_21358 ) ( ON ?auto_21353 ?auto_21354 ) ( CLEAR ?auto_21353 ) ( not ( = ?auto_21346 ?auto_21354 ) ) ( not ( = ?auto_21347 ?auto_21354 ) ) ( not ( = ?auto_21361 ?auto_21354 ) ) ( not ( = ?auto_21353 ?auto_21354 ) ) ( not ( = ?auto_21357 ?auto_21354 ) ) ( not ( = ?auto_21360 ?auto_21354 ) ) ( TRUCK-AT ?auto_21359 ?auto_21348 ) ( SURFACE-AT ?auto_21362 ?auto_21348 ) ( CLEAR ?auto_21362 ) ( LIFTING ?auto_21355 ?auto_21360 ) ( IS-CRATE ?auto_21360 ) ( not ( = ?auto_21346 ?auto_21362 ) ) ( not ( = ?auto_21347 ?auto_21362 ) ) ( not ( = ?auto_21361 ?auto_21362 ) ) ( not ( = ?auto_21353 ?auto_21362 ) ) ( not ( = ?auto_21357 ?auto_21362 ) ) ( not ( = ?auto_21360 ?auto_21362 ) ) ( not ( = ?auto_21354 ?auto_21362 ) ) )
    :subtasks
    ( ( !DROP ?auto_21355 ?auto_21360 ?auto_21362 ?auto_21348 )
      ( MAKE-ON ?auto_21346 ?auto_21347 )
      ( MAKE-ON-VERIFY ?auto_21346 ?auto_21347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21363 - SURFACE
      ?auto_21364 - SURFACE
    )
    :vars
    (
      ?auto_21371 - HOIST
      ?auto_21368 - PLACE
      ?auto_21367 - PLACE
      ?auto_21365 - HOIST
      ?auto_21377 - SURFACE
      ?auto_21372 - SURFACE
      ?auto_21378 - PLACE
      ?auto_21370 - HOIST
      ?auto_21369 - SURFACE
      ?auto_21376 - SURFACE
      ?auto_21375 - PLACE
      ?auto_21379 - HOIST
      ?auto_21373 - SURFACE
      ?auto_21366 - TRUCK
      ?auto_21374 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21371 ?auto_21368 ) ( IS-CRATE ?auto_21363 ) ( not ( = ?auto_21363 ?auto_21364 ) ) ( not ( = ?auto_21367 ?auto_21368 ) ) ( HOIST-AT ?auto_21365 ?auto_21367 ) ( not ( = ?auto_21371 ?auto_21365 ) ) ( AVAILABLE ?auto_21365 ) ( SURFACE-AT ?auto_21363 ?auto_21367 ) ( ON ?auto_21363 ?auto_21377 ) ( CLEAR ?auto_21363 ) ( not ( = ?auto_21363 ?auto_21377 ) ) ( not ( = ?auto_21364 ?auto_21377 ) ) ( IS-CRATE ?auto_21364 ) ( not ( = ?auto_21363 ?auto_21372 ) ) ( not ( = ?auto_21364 ?auto_21372 ) ) ( not ( = ?auto_21377 ?auto_21372 ) ) ( not ( = ?auto_21378 ?auto_21368 ) ) ( not ( = ?auto_21367 ?auto_21378 ) ) ( HOIST-AT ?auto_21370 ?auto_21378 ) ( not ( = ?auto_21371 ?auto_21370 ) ) ( not ( = ?auto_21365 ?auto_21370 ) ) ( AVAILABLE ?auto_21370 ) ( SURFACE-AT ?auto_21364 ?auto_21378 ) ( ON ?auto_21364 ?auto_21369 ) ( CLEAR ?auto_21364 ) ( not ( = ?auto_21363 ?auto_21369 ) ) ( not ( = ?auto_21364 ?auto_21369 ) ) ( not ( = ?auto_21377 ?auto_21369 ) ) ( not ( = ?auto_21372 ?auto_21369 ) ) ( IS-CRATE ?auto_21372 ) ( not ( = ?auto_21363 ?auto_21376 ) ) ( not ( = ?auto_21364 ?auto_21376 ) ) ( not ( = ?auto_21377 ?auto_21376 ) ) ( not ( = ?auto_21372 ?auto_21376 ) ) ( not ( = ?auto_21369 ?auto_21376 ) ) ( not ( = ?auto_21375 ?auto_21368 ) ) ( not ( = ?auto_21367 ?auto_21375 ) ) ( not ( = ?auto_21378 ?auto_21375 ) ) ( HOIST-AT ?auto_21379 ?auto_21375 ) ( not ( = ?auto_21371 ?auto_21379 ) ) ( not ( = ?auto_21365 ?auto_21379 ) ) ( not ( = ?auto_21370 ?auto_21379 ) ) ( AVAILABLE ?auto_21379 ) ( SURFACE-AT ?auto_21372 ?auto_21375 ) ( ON ?auto_21372 ?auto_21373 ) ( CLEAR ?auto_21372 ) ( not ( = ?auto_21363 ?auto_21373 ) ) ( not ( = ?auto_21364 ?auto_21373 ) ) ( not ( = ?auto_21377 ?auto_21373 ) ) ( not ( = ?auto_21372 ?auto_21373 ) ) ( not ( = ?auto_21369 ?auto_21373 ) ) ( not ( = ?auto_21376 ?auto_21373 ) ) ( TRUCK-AT ?auto_21366 ?auto_21368 ) ( SURFACE-AT ?auto_21374 ?auto_21368 ) ( CLEAR ?auto_21374 ) ( IS-CRATE ?auto_21376 ) ( not ( = ?auto_21363 ?auto_21374 ) ) ( not ( = ?auto_21364 ?auto_21374 ) ) ( not ( = ?auto_21377 ?auto_21374 ) ) ( not ( = ?auto_21372 ?auto_21374 ) ) ( not ( = ?auto_21369 ?auto_21374 ) ) ( not ( = ?auto_21376 ?auto_21374 ) ) ( not ( = ?auto_21373 ?auto_21374 ) ) ( AVAILABLE ?auto_21371 ) ( IN ?auto_21376 ?auto_21366 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21371 ?auto_21376 ?auto_21366 ?auto_21368 )
      ( MAKE-ON ?auto_21363 ?auto_21364 )
      ( MAKE-ON-VERIFY ?auto_21363 ?auto_21364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21380 - SURFACE
      ?auto_21381 - SURFACE
    )
    :vars
    (
      ?auto_21383 - HOIST
      ?auto_21388 - PLACE
      ?auto_21389 - PLACE
      ?auto_21387 - HOIST
      ?auto_21391 - SURFACE
      ?auto_21386 - SURFACE
      ?auto_21396 - PLACE
      ?auto_21390 - HOIST
      ?auto_21394 - SURFACE
      ?auto_21393 - SURFACE
      ?auto_21382 - PLACE
      ?auto_21392 - HOIST
      ?auto_21384 - SURFACE
      ?auto_21395 - SURFACE
      ?auto_21385 - TRUCK
      ?auto_21397 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21383 ?auto_21388 ) ( IS-CRATE ?auto_21380 ) ( not ( = ?auto_21380 ?auto_21381 ) ) ( not ( = ?auto_21389 ?auto_21388 ) ) ( HOIST-AT ?auto_21387 ?auto_21389 ) ( not ( = ?auto_21383 ?auto_21387 ) ) ( AVAILABLE ?auto_21387 ) ( SURFACE-AT ?auto_21380 ?auto_21389 ) ( ON ?auto_21380 ?auto_21391 ) ( CLEAR ?auto_21380 ) ( not ( = ?auto_21380 ?auto_21391 ) ) ( not ( = ?auto_21381 ?auto_21391 ) ) ( IS-CRATE ?auto_21381 ) ( not ( = ?auto_21380 ?auto_21386 ) ) ( not ( = ?auto_21381 ?auto_21386 ) ) ( not ( = ?auto_21391 ?auto_21386 ) ) ( not ( = ?auto_21396 ?auto_21388 ) ) ( not ( = ?auto_21389 ?auto_21396 ) ) ( HOIST-AT ?auto_21390 ?auto_21396 ) ( not ( = ?auto_21383 ?auto_21390 ) ) ( not ( = ?auto_21387 ?auto_21390 ) ) ( AVAILABLE ?auto_21390 ) ( SURFACE-AT ?auto_21381 ?auto_21396 ) ( ON ?auto_21381 ?auto_21394 ) ( CLEAR ?auto_21381 ) ( not ( = ?auto_21380 ?auto_21394 ) ) ( not ( = ?auto_21381 ?auto_21394 ) ) ( not ( = ?auto_21391 ?auto_21394 ) ) ( not ( = ?auto_21386 ?auto_21394 ) ) ( IS-CRATE ?auto_21386 ) ( not ( = ?auto_21380 ?auto_21393 ) ) ( not ( = ?auto_21381 ?auto_21393 ) ) ( not ( = ?auto_21391 ?auto_21393 ) ) ( not ( = ?auto_21386 ?auto_21393 ) ) ( not ( = ?auto_21394 ?auto_21393 ) ) ( not ( = ?auto_21382 ?auto_21388 ) ) ( not ( = ?auto_21389 ?auto_21382 ) ) ( not ( = ?auto_21396 ?auto_21382 ) ) ( HOIST-AT ?auto_21392 ?auto_21382 ) ( not ( = ?auto_21383 ?auto_21392 ) ) ( not ( = ?auto_21387 ?auto_21392 ) ) ( not ( = ?auto_21390 ?auto_21392 ) ) ( AVAILABLE ?auto_21392 ) ( SURFACE-AT ?auto_21386 ?auto_21382 ) ( ON ?auto_21386 ?auto_21384 ) ( CLEAR ?auto_21386 ) ( not ( = ?auto_21380 ?auto_21384 ) ) ( not ( = ?auto_21381 ?auto_21384 ) ) ( not ( = ?auto_21391 ?auto_21384 ) ) ( not ( = ?auto_21386 ?auto_21384 ) ) ( not ( = ?auto_21394 ?auto_21384 ) ) ( not ( = ?auto_21393 ?auto_21384 ) ) ( SURFACE-AT ?auto_21395 ?auto_21388 ) ( CLEAR ?auto_21395 ) ( IS-CRATE ?auto_21393 ) ( not ( = ?auto_21380 ?auto_21395 ) ) ( not ( = ?auto_21381 ?auto_21395 ) ) ( not ( = ?auto_21391 ?auto_21395 ) ) ( not ( = ?auto_21386 ?auto_21395 ) ) ( not ( = ?auto_21394 ?auto_21395 ) ) ( not ( = ?auto_21393 ?auto_21395 ) ) ( not ( = ?auto_21384 ?auto_21395 ) ) ( AVAILABLE ?auto_21383 ) ( IN ?auto_21393 ?auto_21385 ) ( TRUCK-AT ?auto_21385 ?auto_21397 ) ( not ( = ?auto_21397 ?auto_21388 ) ) ( not ( = ?auto_21389 ?auto_21397 ) ) ( not ( = ?auto_21396 ?auto_21397 ) ) ( not ( = ?auto_21382 ?auto_21397 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21385 ?auto_21397 ?auto_21388 )
      ( MAKE-ON ?auto_21380 ?auto_21381 )
      ( MAKE-ON-VERIFY ?auto_21380 ?auto_21381 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21398 - SURFACE
      ?auto_21399 - SURFACE
    )
    :vars
    (
      ?auto_21412 - HOIST
      ?auto_21408 - PLACE
      ?auto_21403 - PLACE
      ?auto_21404 - HOIST
      ?auto_21410 - SURFACE
      ?auto_21411 - SURFACE
      ?auto_21402 - PLACE
      ?auto_21415 - HOIST
      ?auto_21407 - SURFACE
      ?auto_21400 - SURFACE
      ?auto_21414 - PLACE
      ?auto_21406 - HOIST
      ?auto_21405 - SURFACE
      ?auto_21401 - SURFACE
      ?auto_21409 - TRUCK
      ?auto_21413 - PLACE
      ?auto_21416 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21412 ?auto_21408 ) ( IS-CRATE ?auto_21398 ) ( not ( = ?auto_21398 ?auto_21399 ) ) ( not ( = ?auto_21403 ?auto_21408 ) ) ( HOIST-AT ?auto_21404 ?auto_21403 ) ( not ( = ?auto_21412 ?auto_21404 ) ) ( AVAILABLE ?auto_21404 ) ( SURFACE-AT ?auto_21398 ?auto_21403 ) ( ON ?auto_21398 ?auto_21410 ) ( CLEAR ?auto_21398 ) ( not ( = ?auto_21398 ?auto_21410 ) ) ( not ( = ?auto_21399 ?auto_21410 ) ) ( IS-CRATE ?auto_21399 ) ( not ( = ?auto_21398 ?auto_21411 ) ) ( not ( = ?auto_21399 ?auto_21411 ) ) ( not ( = ?auto_21410 ?auto_21411 ) ) ( not ( = ?auto_21402 ?auto_21408 ) ) ( not ( = ?auto_21403 ?auto_21402 ) ) ( HOIST-AT ?auto_21415 ?auto_21402 ) ( not ( = ?auto_21412 ?auto_21415 ) ) ( not ( = ?auto_21404 ?auto_21415 ) ) ( AVAILABLE ?auto_21415 ) ( SURFACE-AT ?auto_21399 ?auto_21402 ) ( ON ?auto_21399 ?auto_21407 ) ( CLEAR ?auto_21399 ) ( not ( = ?auto_21398 ?auto_21407 ) ) ( not ( = ?auto_21399 ?auto_21407 ) ) ( not ( = ?auto_21410 ?auto_21407 ) ) ( not ( = ?auto_21411 ?auto_21407 ) ) ( IS-CRATE ?auto_21411 ) ( not ( = ?auto_21398 ?auto_21400 ) ) ( not ( = ?auto_21399 ?auto_21400 ) ) ( not ( = ?auto_21410 ?auto_21400 ) ) ( not ( = ?auto_21411 ?auto_21400 ) ) ( not ( = ?auto_21407 ?auto_21400 ) ) ( not ( = ?auto_21414 ?auto_21408 ) ) ( not ( = ?auto_21403 ?auto_21414 ) ) ( not ( = ?auto_21402 ?auto_21414 ) ) ( HOIST-AT ?auto_21406 ?auto_21414 ) ( not ( = ?auto_21412 ?auto_21406 ) ) ( not ( = ?auto_21404 ?auto_21406 ) ) ( not ( = ?auto_21415 ?auto_21406 ) ) ( AVAILABLE ?auto_21406 ) ( SURFACE-AT ?auto_21411 ?auto_21414 ) ( ON ?auto_21411 ?auto_21405 ) ( CLEAR ?auto_21411 ) ( not ( = ?auto_21398 ?auto_21405 ) ) ( not ( = ?auto_21399 ?auto_21405 ) ) ( not ( = ?auto_21410 ?auto_21405 ) ) ( not ( = ?auto_21411 ?auto_21405 ) ) ( not ( = ?auto_21407 ?auto_21405 ) ) ( not ( = ?auto_21400 ?auto_21405 ) ) ( SURFACE-AT ?auto_21401 ?auto_21408 ) ( CLEAR ?auto_21401 ) ( IS-CRATE ?auto_21400 ) ( not ( = ?auto_21398 ?auto_21401 ) ) ( not ( = ?auto_21399 ?auto_21401 ) ) ( not ( = ?auto_21410 ?auto_21401 ) ) ( not ( = ?auto_21411 ?auto_21401 ) ) ( not ( = ?auto_21407 ?auto_21401 ) ) ( not ( = ?auto_21400 ?auto_21401 ) ) ( not ( = ?auto_21405 ?auto_21401 ) ) ( AVAILABLE ?auto_21412 ) ( TRUCK-AT ?auto_21409 ?auto_21413 ) ( not ( = ?auto_21413 ?auto_21408 ) ) ( not ( = ?auto_21403 ?auto_21413 ) ) ( not ( = ?auto_21402 ?auto_21413 ) ) ( not ( = ?auto_21414 ?auto_21413 ) ) ( HOIST-AT ?auto_21416 ?auto_21413 ) ( LIFTING ?auto_21416 ?auto_21400 ) ( not ( = ?auto_21412 ?auto_21416 ) ) ( not ( = ?auto_21404 ?auto_21416 ) ) ( not ( = ?auto_21415 ?auto_21416 ) ) ( not ( = ?auto_21406 ?auto_21416 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21416 ?auto_21400 ?auto_21409 ?auto_21413 )
      ( MAKE-ON ?auto_21398 ?auto_21399 )
      ( MAKE-ON-VERIFY ?auto_21398 ?auto_21399 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21417 - SURFACE
      ?auto_21418 - SURFACE
    )
    :vars
    (
      ?auto_21421 - HOIST
      ?auto_21420 - PLACE
      ?auto_21427 - PLACE
      ?auto_21424 - HOIST
      ?auto_21425 - SURFACE
      ?auto_21422 - SURFACE
      ?auto_21428 - PLACE
      ?auto_21419 - HOIST
      ?auto_21429 - SURFACE
      ?auto_21432 - SURFACE
      ?auto_21433 - PLACE
      ?auto_21435 - HOIST
      ?auto_21431 - SURFACE
      ?auto_21430 - SURFACE
      ?auto_21423 - TRUCK
      ?auto_21434 - PLACE
      ?auto_21426 - HOIST
      ?auto_21436 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21421 ?auto_21420 ) ( IS-CRATE ?auto_21417 ) ( not ( = ?auto_21417 ?auto_21418 ) ) ( not ( = ?auto_21427 ?auto_21420 ) ) ( HOIST-AT ?auto_21424 ?auto_21427 ) ( not ( = ?auto_21421 ?auto_21424 ) ) ( AVAILABLE ?auto_21424 ) ( SURFACE-AT ?auto_21417 ?auto_21427 ) ( ON ?auto_21417 ?auto_21425 ) ( CLEAR ?auto_21417 ) ( not ( = ?auto_21417 ?auto_21425 ) ) ( not ( = ?auto_21418 ?auto_21425 ) ) ( IS-CRATE ?auto_21418 ) ( not ( = ?auto_21417 ?auto_21422 ) ) ( not ( = ?auto_21418 ?auto_21422 ) ) ( not ( = ?auto_21425 ?auto_21422 ) ) ( not ( = ?auto_21428 ?auto_21420 ) ) ( not ( = ?auto_21427 ?auto_21428 ) ) ( HOIST-AT ?auto_21419 ?auto_21428 ) ( not ( = ?auto_21421 ?auto_21419 ) ) ( not ( = ?auto_21424 ?auto_21419 ) ) ( AVAILABLE ?auto_21419 ) ( SURFACE-AT ?auto_21418 ?auto_21428 ) ( ON ?auto_21418 ?auto_21429 ) ( CLEAR ?auto_21418 ) ( not ( = ?auto_21417 ?auto_21429 ) ) ( not ( = ?auto_21418 ?auto_21429 ) ) ( not ( = ?auto_21425 ?auto_21429 ) ) ( not ( = ?auto_21422 ?auto_21429 ) ) ( IS-CRATE ?auto_21422 ) ( not ( = ?auto_21417 ?auto_21432 ) ) ( not ( = ?auto_21418 ?auto_21432 ) ) ( not ( = ?auto_21425 ?auto_21432 ) ) ( not ( = ?auto_21422 ?auto_21432 ) ) ( not ( = ?auto_21429 ?auto_21432 ) ) ( not ( = ?auto_21433 ?auto_21420 ) ) ( not ( = ?auto_21427 ?auto_21433 ) ) ( not ( = ?auto_21428 ?auto_21433 ) ) ( HOIST-AT ?auto_21435 ?auto_21433 ) ( not ( = ?auto_21421 ?auto_21435 ) ) ( not ( = ?auto_21424 ?auto_21435 ) ) ( not ( = ?auto_21419 ?auto_21435 ) ) ( AVAILABLE ?auto_21435 ) ( SURFACE-AT ?auto_21422 ?auto_21433 ) ( ON ?auto_21422 ?auto_21431 ) ( CLEAR ?auto_21422 ) ( not ( = ?auto_21417 ?auto_21431 ) ) ( not ( = ?auto_21418 ?auto_21431 ) ) ( not ( = ?auto_21425 ?auto_21431 ) ) ( not ( = ?auto_21422 ?auto_21431 ) ) ( not ( = ?auto_21429 ?auto_21431 ) ) ( not ( = ?auto_21432 ?auto_21431 ) ) ( SURFACE-AT ?auto_21430 ?auto_21420 ) ( CLEAR ?auto_21430 ) ( IS-CRATE ?auto_21432 ) ( not ( = ?auto_21417 ?auto_21430 ) ) ( not ( = ?auto_21418 ?auto_21430 ) ) ( not ( = ?auto_21425 ?auto_21430 ) ) ( not ( = ?auto_21422 ?auto_21430 ) ) ( not ( = ?auto_21429 ?auto_21430 ) ) ( not ( = ?auto_21432 ?auto_21430 ) ) ( not ( = ?auto_21431 ?auto_21430 ) ) ( AVAILABLE ?auto_21421 ) ( TRUCK-AT ?auto_21423 ?auto_21434 ) ( not ( = ?auto_21434 ?auto_21420 ) ) ( not ( = ?auto_21427 ?auto_21434 ) ) ( not ( = ?auto_21428 ?auto_21434 ) ) ( not ( = ?auto_21433 ?auto_21434 ) ) ( HOIST-AT ?auto_21426 ?auto_21434 ) ( not ( = ?auto_21421 ?auto_21426 ) ) ( not ( = ?auto_21424 ?auto_21426 ) ) ( not ( = ?auto_21419 ?auto_21426 ) ) ( not ( = ?auto_21435 ?auto_21426 ) ) ( AVAILABLE ?auto_21426 ) ( SURFACE-AT ?auto_21432 ?auto_21434 ) ( ON ?auto_21432 ?auto_21436 ) ( CLEAR ?auto_21432 ) ( not ( = ?auto_21417 ?auto_21436 ) ) ( not ( = ?auto_21418 ?auto_21436 ) ) ( not ( = ?auto_21425 ?auto_21436 ) ) ( not ( = ?auto_21422 ?auto_21436 ) ) ( not ( = ?auto_21429 ?auto_21436 ) ) ( not ( = ?auto_21432 ?auto_21436 ) ) ( not ( = ?auto_21431 ?auto_21436 ) ) ( not ( = ?auto_21430 ?auto_21436 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21426 ?auto_21432 ?auto_21436 ?auto_21434 )
      ( MAKE-ON ?auto_21417 ?auto_21418 )
      ( MAKE-ON-VERIFY ?auto_21417 ?auto_21418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21437 - SURFACE
      ?auto_21438 - SURFACE
    )
    :vars
    (
      ?auto_21439 - HOIST
      ?auto_21440 - PLACE
      ?auto_21443 - PLACE
      ?auto_21450 - HOIST
      ?auto_21447 - SURFACE
      ?auto_21454 - SURFACE
      ?auto_21442 - PLACE
      ?auto_21448 - HOIST
      ?auto_21455 - SURFACE
      ?auto_21444 - SURFACE
      ?auto_21451 - PLACE
      ?auto_21452 - HOIST
      ?auto_21446 - SURFACE
      ?auto_21456 - SURFACE
      ?auto_21441 - PLACE
      ?auto_21449 - HOIST
      ?auto_21445 - SURFACE
      ?auto_21453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21439 ?auto_21440 ) ( IS-CRATE ?auto_21437 ) ( not ( = ?auto_21437 ?auto_21438 ) ) ( not ( = ?auto_21443 ?auto_21440 ) ) ( HOIST-AT ?auto_21450 ?auto_21443 ) ( not ( = ?auto_21439 ?auto_21450 ) ) ( AVAILABLE ?auto_21450 ) ( SURFACE-AT ?auto_21437 ?auto_21443 ) ( ON ?auto_21437 ?auto_21447 ) ( CLEAR ?auto_21437 ) ( not ( = ?auto_21437 ?auto_21447 ) ) ( not ( = ?auto_21438 ?auto_21447 ) ) ( IS-CRATE ?auto_21438 ) ( not ( = ?auto_21437 ?auto_21454 ) ) ( not ( = ?auto_21438 ?auto_21454 ) ) ( not ( = ?auto_21447 ?auto_21454 ) ) ( not ( = ?auto_21442 ?auto_21440 ) ) ( not ( = ?auto_21443 ?auto_21442 ) ) ( HOIST-AT ?auto_21448 ?auto_21442 ) ( not ( = ?auto_21439 ?auto_21448 ) ) ( not ( = ?auto_21450 ?auto_21448 ) ) ( AVAILABLE ?auto_21448 ) ( SURFACE-AT ?auto_21438 ?auto_21442 ) ( ON ?auto_21438 ?auto_21455 ) ( CLEAR ?auto_21438 ) ( not ( = ?auto_21437 ?auto_21455 ) ) ( not ( = ?auto_21438 ?auto_21455 ) ) ( not ( = ?auto_21447 ?auto_21455 ) ) ( not ( = ?auto_21454 ?auto_21455 ) ) ( IS-CRATE ?auto_21454 ) ( not ( = ?auto_21437 ?auto_21444 ) ) ( not ( = ?auto_21438 ?auto_21444 ) ) ( not ( = ?auto_21447 ?auto_21444 ) ) ( not ( = ?auto_21454 ?auto_21444 ) ) ( not ( = ?auto_21455 ?auto_21444 ) ) ( not ( = ?auto_21451 ?auto_21440 ) ) ( not ( = ?auto_21443 ?auto_21451 ) ) ( not ( = ?auto_21442 ?auto_21451 ) ) ( HOIST-AT ?auto_21452 ?auto_21451 ) ( not ( = ?auto_21439 ?auto_21452 ) ) ( not ( = ?auto_21450 ?auto_21452 ) ) ( not ( = ?auto_21448 ?auto_21452 ) ) ( AVAILABLE ?auto_21452 ) ( SURFACE-AT ?auto_21454 ?auto_21451 ) ( ON ?auto_21454 ?auto_21446 ) ( CLEAR ?auto_21454 ) ( not ( = ?auto_21437 ?auto_21446 ) ) ( not ( = ?auto_21438 ?auto_21446 ) ) ( not ( = ?auto_21447 ?auto_21446 ) ) ( not ( = ?auto_21454 ?auto_21446 ) ) ( not ( = ?auto_21455 ?auto_21446 ) ) ( not ( = ?auto_21444 ?auto_21446 ) ) ( SURFACE-AT ?auto_21456 ?auto_21440 ) ( CLEAR ?auto_21456 ) ( IS-CRATE ?auto_21444 ) ( not ( = ?auto_21437 ?auto_21456 ) ) ( not ( = ?auto_21438 ?auto_21456 ) ) ( not ( = ?auto_21447 ?auto_21456 ) ) ( not ( = ?auto_21454 ?auto_21456 ) ) ( not ( = ?auto_21455 ?auto_21456 ) ) ( not ( = ?auto_21444 ?auto_21456 ) ) ( not ( = ?auto_21446 ?auto_21456 ) ) ( AVAILABLE ?auto_21439 ) ( not ( = ?auto_21441 ?auto_21440 ) ) ( not ( = ?auto_21443 ?auto_21441 ) ) ( not ( = ?auto_21442 ?auto_21441 ) ) ( not ( = ?auto_21451 ?auto_21441 ) ) ( HOIST-AT ?auto_21449 ?auto_21441 ) ( not ( = ?auto_21439 ?auto_21449 ) ) ( not ( = ?auto_21450 ?auto_21449 ) ) ( not ( = ?auto_21448 ?auto_21449 ) ) ( not ( = ?auto_21452 ?auto_21449 ) ) ( AVAILABLE ?auto_21449 ) ( SURFACE-AT ?auto_21444 ?auto_21441 ) ( ON ?auto_21444 ?auto_21445 ) ( CLEAR ?auto_21444 ) ( not ( = ?auto_21437 ?auto_21445 ) ) ( not ( = ?auto_21438 ?auto_21445 ) ) ( not ( = ?auto_21447 ?auto_21445 ) ) ( not ( = ?auto_21454 ?auto_21445 ) ) ( not ( = ?auto_21455 ?auto_21445 ) ) ( not ( = ?auto_21444 ?auto_21445 ) ) ( not ( = ?auto_21446 ?auto_21445 ) ) ( not ( = ?auto_21456 ?auto_21445 ) ) ( TRUCK-AT ?auto_21453 ?auto_21440 ) )
    :subtasks
    ( ( !DRIVE ?auto_21453 ?auto_21440 ?auto_21441 )
      ( MAKE-ON ?auto_21437 ?auto_21438 )
      ( MAKE-ON-VERIFY ?auto_21437 ?auto_21438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21457 - SURFACE
      ?auto_21458 - SURFACE
    )
    :vars
    (
      ?auto_21470 - HOIST
      ?auto_21471 - PLACE
      ?auto_21468 - PLACE
      ?auto_21463 - HOIST
      ?auto_21461 - SURFACE
      ?auto_21472 - SURFACE
      ?auto_21475 - PLACE
      ?auto_21474 - HOIST
      ?auto_21465 - SURFACE
      ?auto_21469 - SURFACE
      ?auto_21459 - PLACE
      ?auto_21464 - HOIST
      ?auto_21462 - SURFACE
      ?auto_21466 - SURFACE
      ?auto_21476 - PLACE
      ?auto_21460 - HOIST
      ?auto_21467 - SURFACE
      ?auto_21473 - TRUCK
      ?auto_21477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21470 ?auto_21471 ) ( IS-CRATE ?auto_21457 ) ( not ( = ?auto_21457 ?auto_21458 ) ) ( not ( = ?auto_21468 ?auto_21471 ) ) ( HOIST-AT ?auto_21463 ?auto_21468 ) ( not ( = ?auto_21470 ?auto_21463 ) ) ( AVAILABLE ?auto_21463 ) ( SURFACE-AT ?auto_21457 ?auto_21468 ) ( ON ?auto_21457 ?auto_21461 ) ( CLEAR ?auto_21457 ) ( not ( = ?auto_21457 ?auto_21461 ) ) ( not ( = ?auto_21458 ?auto_21461 ) ) ( IS-CRATE ?auto_21458 ) ( not ( = ?auto_21457 ?auto_21472 ) ) ( not ( = ?auto_21458 ?auto_21472 ) ) ( not ( = ?auto_21461 ?auto_21472 ) ) ( not ( = ?auto_21475 ?auto_21471 ) ) ( not ( = ?auto_21468 ?auto_21475 ) ) ( HOIST-AT ?auto_21474 ?auto_21475 ) ( not ( = ?auto_21470 ?auto_21474 ) ) ( not ( = ?auto_21463 ?auto_21474 ) ) ( AVAILABLE ?auto_21474 ) ( SURFACE-AT ?auto_21458 ?auto_21475 ) ( ON ?auto_21458 ?auto_21465 ) ( CLEAR ?auto_21458 ) ( not ( = ?auto_21457 ?auto_21465 ) ) ( not ( = ?auto_21458 ?auto_21465 ) ) ( not ( = ?auto_21461 ?auto_21465 ) ) ( not ( = ?auto_21472 ?auto_21465 ) ) ( IS-CRATE ?auto_21472 ) ( not ( = ?auto_21457 ?auto_21469 ) ) ( not ( = ?auto_21458 ?auto_21469 ) ) ( not ( = ?auto_21461 ?auto_21469 ) ) ( not ( = ?auto_21472 ?auto_21469 ) ) ( not ( = ?auto_21465 ?auto_21469 ) ) ( not ( = ?auto_21459 ?auto_21471 ) ) ( not ( = ?auto_21468 ?auto_21459 ) ) ( not ( = ?auto_21475 ?auto_21459 ) ) ( HOIST-AT ?auto_21464 ?auto_21459 ) ( not ( = ?auto_21470 ?auto_21464 ) ) ( not ( = ?auto_21463 ?auto_21464 ) ) ( not ( = ?auto_21474 ?auto_21464 ) ) ( AVAILABLE ?auto_21464 ) ( SURFACE-AT ?auto_21472 ?auto_21459 ) ( ON ?auto_21472 ?auto_21462 ) ( CLEAR ?auto_21472 ) ( not ( = ?auto_21457 ?auto_21462 ) ) ( not ( = ?auto_21458 ?auto_21462 ) ) ( not ( = ?auto_21461 ?auto_21462 ) ) ( not ( = ?auto_21472 ?auto_21462 ) ) ( not ( = ?auto_21465 ?auto_21462 ) ) ( not ( = ?auto_21469 ?auto_21462 ) ) ( IS-CRATE ?auto_21469 ) ( not ( = ?auto_21457 ?auto_21466 ) ) ( not ( = ?auto_21458 ?auto_21466 ) ) ( not ( = ?auto_21461 ?auto_21466 ) ) ( not ( = ?auto_21472 ?auto_21466 ) ) ( not ( = ?auto_21465 ?auto_21466 ) ) ( not ( = ?auto_21469 ?auto_21466 ) ) ( not ( = ?auto_21462 ?auto_21466 ) ) ( not ( = ?auto_21476 ?auto_21471 ) ) ( not ( = ?auto_21468 ?auto_21476 ) ) ( not ( = ?auto_21475 ?auto_21476 ) ) ( not ( = ?auto_21459 ?auto_21476 ) ) ( HOIST-AT ?auto_21460 ?auto_21476 ) ( not ( = ?auto_21470 ?auto_21460 ) ) ( not ( = ?auto_21463 ?auto_21460 ) ) ( not ( = ?auto_21474 ?auto_21460 ) ) ( not ( = ?auto_21464 ?auto_21460 ) ) ( AVAILABLE ?auto_21460 ) ( SURFACE-AT ?auto_21469 ?auto_21476 ) ( ON ?auto_21469 ?auto_21467 ) ( CLEAR ?auto_21469 ) ( not ( = ?auto_21457 ?auto_21467 ) ) ( not ( = ?auto_21458 ?auto_21467 ) ) ( not ( = ?auto_21461 ?auto_21467 ) ) ( not ( = ?auto_21472 ?auto_21467 ) ) ( not ( = ?auto_21465 ?auto_21467 ) ) ( not ( = ?auto_21469 ?auto_21467 ) ) ( not ( = ?auto_21462 ?auto_21467 ) ) ( not ( = ?auto_21466 ?auto_21467 ) ) ( TRUCK-AT ?auto_21473 ?auto_21471 ) ( SURFACE-AT ?auto_21477 ?auto_21471 ) ( CLEAR ?auto_21477 ) ( LIFTING ?auto_21470 ?auto_21466 ) ( IS-CRATE ?auto_21466 ) ( not ( = ?auto_21457 ?auto_21477 ) ) ( not ( = ?auto_21458 ?auto_21477 ) ) ( not ( = ?auto_21461 ?auto_21477 ) ) ( not ( = ?auto_21472 ?auto_21477 ) ) ( not ( = ?auto_21465 ?auto_21477 ) ) ( not ( = ?auto_21469 ?auto_21477 ) ) ( not ( = ?auto_21462 ?auto_21477 ) ) ( not ( = ?auto_21466 ?auto_21477 ) ) ( not ( = ?auto_21467 ?auto_21477 ) ) )
    :subtasks
    ( ( !DROP ?auto_21470 ?auto_21466 ?auto_21477 ?auto_21471 )
      ( MAKE-ON ?auto_21457 ?auto_21458 )
      ( MAKE-ON-VERIFY ?auto_21457 ?auto_21458 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21478 - SURFACE
      ?auto_21479 - SURFACE
    )
    :vars
    (
      ?auto_21484 - HOIST
      ?auto_21488 - PLACE
      ?auto_21490 - PLACE
      ?auto_21491 - HOIST
      ?auto_21486 - SURFACE
      ?auto_21481 - SURFACE
      ?auto_21493 - PLACE
      ?auto_21497 - HOIST
      ?auto_21498 - SURFACE
      ?auto_21482 - SURFACE
      ?auto_21496 - PLACE
      ?auto_21492 - HOIST
      ?auto_21487 - SURFACE
      ?auto_21480 - SURFACE
      ?auto_21494 - PLACE
      ?auto_21485 - HOIST
      ?auto_21495 - SURFACE
      ?auto_21489 - TRUCK
      ?auto_21483 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21484 ?auto_21488 ) ( IS-CRATE ?auto_21478 ) ( not ( = ?auto_21478 ?auto_21479 ) ) ( not ( = ?auto_21490 ?auto_21488 ) ) ( HOIST-AT ?auto_21491 ?auto_21490 ) ( not ( = ?auto_21484 ?auto_21491 ) ) ( AVAILABLE ?auto_21491 ) ( SURFACE-AT ?auto_21478 ?auto_21490 ) ( ON ?auto_21478 ?auto_21486 ) ( CLEAR ?auto_21478 ) ( not ( = ?auto_21478 ?auto_21486 ) ) ( not ( = ?auto_21479 ?auto_21486 ) ) ( IS-CRATE ?auto_21479 ) ( not ( = ?auto_21478 ?auto_21481 ) ) ( not ( = ?auto_21479 ?auto_21481 ) ) ( not ( = ?auto_21486 ?auto_21481 ) ) ( not ( = ?auto_21493 ?auto_21488 ) ) ( not ( = ?auto_21490 ?auto_21493 ) ) ( HOIST-AT ?auto_21497 ?auto_21493 ) ( not ( = ?auto_21484 ?auto_21497 ) ) ( not ( = ?auto_21491 ?auto_21497 ) ) ( AVAILABLE ?auto_21497 ) ( SURFACE-AT ?auto_21479 ?auto_21493 ) ( ON ?auto_21479 ?auto_21498 ) ( CLEAR ?auto_21479 ) ( not ( = ?auto_21478 ?auto_21498 ) ) ( not ( = ?auto_21479 ?auto_21498 ) ) ( not ( = ?auto_21486 ?auto_21498 ) ) ( not ( = ?auto_21481 ?auto_21498 ) ) ( IS-CRATE ?auto_21481 ) ( not ( = ?auto_21478 ?auto_21482 ) ) ( not ( = ?auto_21479 ?auto_21482 ) ) ( not ( = ?auto_21486 ?auto_21482 ) ) ( not ( = ?auto_21481 ?auto_21482 ) ) ( not ( = ?auto_21498 ?auto_21482 ) ) ( not ( = ?auto_21496 ?auto_21488 ) ) ( not ( = ?auto_21490 ?auto_21496 ) ) ( not ( = ?auto_21493 ?auto_21496 ) ) ( HOIST-AT ?auto_21492 ?auto_21496 ) ( not ( = ?auto_21484 ?auto_21492 ) ) ( not ( = ?auto_21491 ?auto_21492 ) ) ( not ( = ?auto_21497 ?auto_21492 ) ) ( AVAILABLE ?auto_21492 ) ( SURFACE-AT ?auto_21481 ?auto_21496 ) ( ON ?auto_21481 ?auto_21487 ) ( CLEAR ?auto_21481 ) ( not ( = ?auto_21478 ?auto_21487 ) ) ( not ( = ?auto_21479 ?auto_21487 ) ) ( not ( = ?auto_21486 ?auto_21487 ) ) ( not ( = ?auto_21481 ?auto_21487 ) ) ( not ( = ?auto_21498 ?auto_21487 ) ) ( not ( = ?auto_21482 ?auto_21487 ) ) ( IS-CRATE ?auto_21482 ) ( not ( = ?auto_21478 ?auto_21480 ) ) ( not ( = ?auto_21479 ?auto_21480 ) ) ( not ( = ?auto_21486 ?auto_21480 ) ) ( not ( = ?auto_21481 ?auto_21480 ) ) ( not ( = ?auto_21498 ?auto_21480 ) ) ( not ( = ?auto_21482 ?auto_21480 ) ) ( not ( = ?auto_21487 ?auto_21480 ) ) ( not ( = ?auto_21494 ?auto_21488 ) ) ( not ( = ?auto_21490 ?auto_21494 ) ) ( not ( = ?auto_21493 ?auto_21494 ) ) ( not ( = ?auto_21496 ?auto_21494 ) ) ( HOIST-AT ?auto_21485 ?auto_21494 ) ( not ( = ?auto_21484 ?auto_21485 ) ) ( not ( = ?auto_21491 ?auto_21485 ) ) ( not ( = ?auto_21497 ?auto_21485 ) ) ( not ( = ?auto_21492 ?auto_21485 ) ) ( AVAILABLE ?auto_21485 ) ( SURFACE-AT ?auto_21482 ?auto_21494 ) ( ON ?auto_21482 ?auto_21495 ) ( CLEAR ?auto_21482 ) ( not ( = ?auto_21478 ?auto_21495 ) ) ( not ( = ?auto_21479 ?auto_21495 ) ) ( not ( = ?auto_21486 ?auto_21495 ) ) ( not ( = ?auto_21481 ?auto_21495 ) ) ( not ( = ?auto_21498 ?auto_21495 ) ) ( not ( = ?auto_21482 ?auto_21495 ) ) ( not ( = ?auto_21487 ?auto_21495 ) ) ( not ( = ?auto_21480 ?auto_21495 ) ) ( TRUCK-AT ?auto_21489 ?auto_21488 ) ( SURFACE-AT ?auto_21483 ?auto_21488 ) ( CLEAR ?auto_21483 ) ( IS-CRATE ?auto_21480 ) ( not ( = ?auto_21478 ?auto_21483 ) ) ( not ( = ?auto_21479 ?auto_21483 ) ) ( not ( = ?auto_21486 ?auto_21483 ) ) ( not ( = ?auto_21481 ?auto_21483 ) ) ( not ( = ?auto_21498 ?auto_21483 ) ) ( not ( = ?auto_21482 ?auto_21483 ) ) ( not ( = ?auto_21487 ?auto_21483 ) ) ( not ( = ?auto_21480 ?auto_21483 ) ) ( not ( = ?auto_21495 ?auto_21483 ) ) ( AVAILABLE ?auto_21484 ) ( IN ?auto_21480 ?auto_21489 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21484 ?auto_21480 ?auto_21489 ?auto_21488 )
      ( MAKE-ON ?auto_21478 ?auto_21479 )
      ( MAKE-ON-VERIFY ?auto_21478 ?auto_21479 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21499 - SURFACE
      ?auto_21500 - SURFACE
    )
    :vars
    (
      ?auto_21504 - HOIST
      ?auto_21509 - PLACE
      ?auto_21510 - PLACE
      ?auto_21512 - HOIST
      ?auto_21516 - SURFACE
      ?auto_21503 - SURFACE
      ?auto_21511 - PLACE
      ?auto_21501 - HOIST
      ?auto_21502 - SURFACE
      ?auto_21508 - SURFACE
      ?auto_21519 - PLACE
      ?auto_21506 - HOIST
      ?auto_21515 - SURFACE
      ?auto_21517 - SURFACE
      ?auto_21518 - PLACE
      ?auto_21507 - HOIST
      ?auto_21513 - SURFACE
      ?auto_21514 - SURFACE
      ?auto_21505 - TRUCK
      ?auto_21520 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21504 ?auto_21509 ) ( IS-CRATE ?auto_21499 ) ( not ( = ?auto_21499 ?auto_21500 ) ) ( not ( = ?auto_21510 ?auto_21509 ) ) ( HOIST-AT ?auto_21512 ?auto_21510 ) ( not ( = ?auto_21504 ?auto_21512 ) ) ( AVAILABLE ?auto_21512 ) ( SURFACE-AT ?auto_21499 ?auto_21510 ) ( ON ?auto_21499 ?auto_21516 ) ( CLEAR ?auto_21499 ) ( not ( = ?auto_21499 ?auto_21516 ) ) ( not ( = ?auto_21500 ?auto_21516 ) ) ( IS-CRATE ?auto_21500 ) ( not ( = ?auto_21499 ?auto_21503 ) ) ( not ( = ?auto_21500 ?auto_21503 ) ) ( not ( = ?auto_21516 ?auto_21503 ) ) ( not ( = ?auto_21511 ?auto_21509 ) ) ( not ( = ?auto_21510 ?auto_21511 ) ) ( HOIST-AT ?auto_21501 ?auto_21511 ) ( not ( = ?auto_21504 ?auto_21501 ) ) ( not ( = ?auto_21512 ?auto_21501 ) ) ( AVAILABLE ?auto_21501 ) ( SURFACE-AT ?auto_21500 ?auto_21511 ) ( ON ?auto_21500 ?auto_21502 ) ( CLEAR ?auto_21500 ) ( not ( = ?auto_21499 ?auto_21502 ) ) ( not ( = ?auto_21500 ?auto_21502 ) ) ( not ( = ?auto_21516 ?auto_21502 ) ) ( not ( = ?auto_21503 ?auto_21502 ) ) ( IS-CRATE ?auto_21503 ) ( not ( = ?auto_21499 ?auto_21508 ) ) ( not ( = ?auto_21500 ?auto_21508 ) ) ( not ( = ?auto_21516 ?auto_21508 ) ) ( not ( = ?auto_21503 ?auto_21508 ) ) ( not ( = ?auto_21502 ?auto_21508 ) ) ( not ( = ?auto_21519 ?auto_21509 ) ) ( not ( = ?auto_21510 ?auto_21519 ) ) ( not ( = ?auto_21511 ?auto_21519 ) ) ( HOIST-AT ?auto_21506 ?auto_21519 ) ( not ( = ?auto_21504 ?auto_21506 ) ) ( not ( = ?auto_21512 ?auto_21506 ) ) ( not ( = ?auto_21501 ?auto_21506 ) ) ( AVAILABLE ?auto_21506 ) ( SURFACE-AT ?auto_21503 ?auto_21519 ) ( ON ?auto_21503 ?auto_21515 ) ( CLEAR ?auto_21503 ) ( not ( = ?auto_21499 ?auto_21515 ) ) ( not ( = ?auto_21500 ?auto_21515 ) ) ( not ( = ?auto_21516 ?auto_21515 ) ) ( not ( = ?auto_21503 ?auto_21515 ) ) ( not ( = ?auto_21502 ?auto_21515 ) ) ( not ( = ?auto_21508 ?auto_21515 ) ) ( IS-CRATE ?auto_21508 ) ( not ( = ?auto_21499 ?auto_21517 ) ) ( not ( = ?auto_21500 ?auto_21517 ) ) ( not ( = ?auto_21516 ?auto_21517 ) ) ( not ( = ?auto_21503 ?auto_21517 ) ) ( not ( = ?auto_21502 ?auto_21517 ) ) ( not ( = ?auto_21508 ?auto_21517 ) ) ( not ( = ?auto_21515 ?auto_21517 ) ) ( not ( = ?auto_21518 ?auto_21509 ) ) ( not ( = ?auto_21510 ?auto_21518 ) ) ( not ( = ?auto_21511 ?auto_21518 ) ) ( not ( = ?auto_21519 ?auto_21518 ) ) ( HOIST-AT ?auto_21507 ?auto_21518 ) ( not ( = ?auto_21504 ?auto_21507 ) ) ( not ( = ?auto_21512 ?auto_21507 ) ) ( not ( = ?auto_21501 ?auto_21507 ) ) ( not ( = ?auto_21506 ?auto_21507 ) ) ( AVAILABLE ?auto_21507 ) ( SURFACE-AT ?auto_21508 ?auto_21518 ) ( ON ?auto_21508 ?auto_21513 ) ( CLEAR ?auto_21508 ) ( not ( = ?auto_21499 ?auto_21513 ) ) ( not ( = ?auto_21500 ?auto_21513 ) ) ( not ( = ?auto_21516 ?auto_21513 ) ) ( not ( = ?auto_21503 ?auto_21513 ) ) ( not ( = ?auto_21502 ?auto_21513 ) ) ( not ( = ?auto_21508 ?auto_21513 ) ) ( not ( = ?auto_21515 ?auto_21513 ) ) ( not ( = ?auto_21517 ?auto_21513 ) ) ( SURFACE-AT ?auto_21514 ?auto_21509 ) ( CLEAR ?auto_21514 ) ( IS-CRATE ?auto_21517 ) ( not ( = ?auto_21499 ?auto_21514 ) ) ( not ( = ?auto_21500 ?auto_21514 ) ) ( not ( = ?auto_21516 ?auto_21514 ) ) ( not ( = ?auto_21503 ?auto_21514 ) ) ( not ( = ?auto_21502 ?auto_21514 ) ) ( not ( = ?auto_21508 ?auto_21514 ) ) ( not ( = ?auto_21515 ?auto_21514 ) ) ( not ( = ?auto_21517 ?auto_21514 ) ) ( not ( = ?auto_21513 ?auto_21514 ) ) ( AVAILABLE ?auto_21504 ) ( IN ?auto_21517 ?auto_21505 ) ( TRUCK-AT ?auto_21505 ?auto_21520 ) ( not ( = ?auto_21520 ?auto_21509 ) ) ( not ( = ?auto_21510 ?auto_21520 ) ) ( not ( = ?auto_21511 ?auto_21520 ) ) ( not ( = ?auto_21519 ?auto_21520 ) ) ( not ( = ?auto_21518 ?auto_21520 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21505 ?auto_21520 ?auto_21509 )
      ( MAKE-ON ?auto_21499 ?auto_21500 )
      ( MAKE-ON-VERIFY ?auto_21499 ?auto_21500 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21521 - SURFACE
      ?auto_21522 - SURFACE
    )
    :vars
    (
      ?auto_21542 - HOIST
      ?auto_21526 - PLACE
      ?auto_21524 - PLACE
      ?auto_21523 - HOIST
      ?auto_21541 - SURFACE
      ?auto_21525 - SURFACE
      ?auto_21530 - PLACE
      ?auto_21540 - HOIST
      ?auto_21531 - SURFACE
      ?auto_21535 - SURFACE
      ?auto_21533 - PLACE
      ?auto_21529 - HOIST
      ?auto_21528 - SURFACE
      ?auto_21534 - SURFACE
      ?auto_21532 - PLACE
      ?auto_21536 - HOIST
      ?auto_21538 - SURFACE
      ?auto_21527 - SURFACE
      ?auto_21539 - TRUCK
      ?auto_21537 - PLACE
      ?auto_21543 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21542 ?auto_21526 ) ( IS-CRATE ?auto_21521 ) ( not ( = ?auto_21521 ?auto_21522 ) ) ( not ( = ?auto_21524 ?auto_21526 ) ) ( HOIST-AT ?auto_21523 ?auto_21524 ) ( not ( = ?auto_21542 ?auto_21523 ) ) ( AVAILABLE ?auto_21523 ) ( SURFACE-AT ?auto_21521 ?auto_21524 ) ( ON ?auto_21521 ?auto_21541 ) ( CLEAR ?auto_21521 ) ( not ( = ?auto_21521 ?auto_21541 ) ) ( not ( = ?auto_21522 ?auto_21541 ) ) ( IS-CRATE ?auto_21522 ) ( not ( = ?auto_21521 ?auto_21525 ) ) ( not ( = ?auto_21522 ?auto_21525 ) ) ( not ( = ?auto_21541 ?auto_21525 ) ) ( not ( = ?auto_21530 ?auto_21526 ) ) ( not ( = ?auto_21524 ?auto_21530 ) ) ( HOIST-AT ?auto_21540 ?auto_21530 ) ( not ( = ?auto_21542 ?auto_21540 ) ) ( not ( = ?auto_21523 ?auto_21540 ) ) ( AVAILABLE ?auto_21540 ) ( SURFACE-AT ?auto_21522 ?auto_21530 ) ( ON ?auto_21522 ?auto_21531 ) ( CLEAR ?auto_21522 ) ( not ( = ?auto_21521 ?auto_21531 ) ) ( not ( = ?auto_21522 ?auto_21531 ) ) ( not ( = ?auto_21541 ?auto_21531 ) ) ( not ( = ?auto_21525 ?auto_21531 ) ) ( IS-CRATE ?auto_21525 ) ( not ( = ?auto_21521 ?auto_21535 ) ) ( not ( = ?auto_21522 ?auto_21535 ) ) ( not ( = ?auto_21541 ?auto_21535 ) ) ( not ( = ?auto_21525 ?auto_21535 ) ) ( not ( = ?auto_21531 ?auto_21535 ) ) ( not ( = ?auto_21533 ?auto_21526 ) ) ( not ( = ?auto_21524 ?auto_21533 ) ) ( not ( = ?auto_21530 ?auto_21533 ) ) ( HOIST-AT ?auto_21529 ?auto_21533 ) ( not ( = ?auto_21542 ?auto_21529 ) ) ( not ( = ?auto_21523 ?auto_21529 ) ) ( not ( = ?auto_21540 ?auto_21529 ) ) ( AVAILABLE ?auto_21529 ) ( SURFACE-AT ?auto_21525 ?auto_21533 ) ( ON ?auto_21525 ?auto_21528 ) ( CLEAR ?auto_21525 ) ( not ( = ?auto_21521 ?auto_21528 ) ) ( not ( = ?auto_21522 ?auto_21528 ) ) ( not ( = ?auto_21541 ?auto_21528 ) ) ( not ( = ?auto_21525 ?auto_21528 ) ) ( not ( = ?auto_21531 ?auto_21528 ) ) ( not ( = ?auto_21535 ?auto_21528 ) ) ( IS-CRATE ?auto_21535 ) ( not ( = ?auto_21521 ?auto_21534 ) ) ( not ( = ?auto_21522 ?auto_21534 ) ) ( not ( = ?auto_21541 ?auto_21534 ) ) ( not ( = ?auto_21525 ?auto_21534 ) ) ( not ( = ?auto_21531 ?auto_21534 ) ) ( not ( = ?auto_21535 ?auto_21534 ) ) ( not ( = ?auto_21528 ?auto_21534 ) ) ( not ( = ?auto_21532 ?auto_21526 ) ) ( not ( = ?auto_21524 ?auto_21532 ) ) ( not ( = ?auto_21530 ?auto_21532 ) ) ( not ( = ?auto_21533 ?auto_21532 ) ) ( HOIST-AT ?auto_21536 ?auto_21532 ) ( not ( = ?auto_21542 ?auto_21536 ) ) ( not ( = ?auto_21523 ?auto_21536 ) ) ( not ( = ?auto_21540 ?auto_21536 ) ) ( not ( = ?auto_21529 ?auto_21536 ) ) ( AVAILABLE ?auto_21536 ) ( SURFACE-AT ?auto_21535 ?auto_21532 ) ( ON ?auto_21535 ?auto_21538 ) ( CLEAR ?auto_21535 ) ( not ( = ?auto_21521 ?auto_21538 ) ) ( not ( = ?auto_21522 ?auto_21538 ) ) ( not ( = ?auto_21541 ?auto_21538 ) ) ( not ( = ?auto_21525 ?auto_21538 ) ) ( not ( = ?auto_21531 ?auto_21538 ) ) ( not ( = ?auto_21535 ?auto_21538 ) ) ( not ( = ?auto_21528 ?auto_21538 ) ) ( not ( = ?auto_21534 ?auto_21538 ) ) ( SURFACE-AT ?auto_21527 ?auto_21526 ) ( CLEAR ?auto_21527 ) ( IS-CRATE ?auto_21534 ) ( not ( = ?auto_21521 ?auto_21527 ) ) ( not ( = ?auto_21522 ?auto_21527 ) ) ( not ( = ?auto_21541 ?auto_21527 ) ) ( not ( = ?auto_21525 ?auto_21527 ) ) ( not ( = ?auto_21531 ?auto_21527 ) ) ( not ( = ?auto_21535 ?auto_21527 ) ) ( not ( = ?auto_21528 ?auto_21527 ) ) ( not ( = ?auto_21534 ?auto_21527 ) ) ( not ( = ?auto_21538 ?auto_21527 ) ) ( AVAILABLE ?auto_21542 ) ( TRUCK-AT ?auto_21539 ?auto_21537 ) ( not ( = ?auto_21537 ?auto_21526 ) ) ( not ( = ?auto_21524 ?auto_21537 ) ) ( not ( = ?auto_21530 ?auto_21537 ) ) ( not ( = ?auto_21533 ?auto_21537 ) ) ( not ( = ?auto_21532 ?auto_21537 ) ) ( HOIST-AT ?auto_21543 ?auto_21537 ) ( LIFTING ?auto_21543 ?auto_21534 ) ( not ( = ?auto_21542 ?auto_21543 ) ) ( not ( = ?auto_21523 ?auto_21543 ) ) ( not ( = ?auto_21540 ?auto_21543 ) ) ( not ( = ?auto_21529 ?auto_21543 ) ) ( not ( = ?auto_21536 ?auto_21543 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21543 ?auto_21534 ?auto_21539 ?auto_21537 )
      ( MAKE-ON ?auto_21521 ?auto_21522 )
      ( MAKE-ON-VERIFY ?auto_21521 ?auto_21522 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21544 - SURFACE
      ?auto_21545 - SURFACE
    )
    :vars
    (
      ?auto_21564 - HOIST
      ?auto_21563 - PLACE
      ?auto_21553 - PLACE
      ?auto_21565 - HOIST
      ?auto_21551 - SURFACE
      ?auto_21562 - SURFACE
      ?auto_21548 - PLACE
      ?auto_21558 - HOIST
      ?auto_21557 - SURFACE
      ?auto_21561 - SURFACE
      ?auto_21566 - PLACE
      ?auto_21556 - HOIST
      ?auto_21554 - SURFACE
      ?auto_21555 - SURFACE
      ?auto_21550 - PLACE
      ?auto_21549 - HOIST
      ?auto_21560 - SURFACE
      ?auto_21559 - SURFACE
      ?auto_21552 - TRUCK
      ?auto_21547 - PLACE
      ?auto_21546 - HOIST
      ?auto_21567 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21564 ?auto_21563 ) ( IS-CRATE ?auto_21544 ) ( not ( = ?auto_21544 ?auto_21545 ) ) ( not ( = ?auto_21553 ?auto_21563 ) ) ( HOIST-AT ?auto_21565 ?auto_21553 ) ( not ( = ?auto_21564 ?auto_21565 ) ) ( AVAILABLE ?auto_21565 ) ( SURFACE-AT ?auto_21544 ?auto_21553 ) ( ON ?auto_21544 ?auto_21551 ) ( CLEAR ?auto_21544 ) ( not ( = ?auto_21544 ?auto_21551 ) ) ( not ( = ?auto_21545 ?auto_21551 ) ) ( IS-CRATE ?auto_21545 ) ( not ( = ?auto_21544 ?auto_21562 ) ) ( not ( = ?auto_21545 ?auto_21562 ) ) ( not ( = ?auto_21551 ?auto_21562 ) ) ( not ( = ?auto_21548 ?auto_21563 ) ) ( not ( = ?auto_21553 ?auto_21548 ) ) ( HOIST-AT ?auto_21558 ?auto_21548 ) ( not ( = ?auto_21564 ?auto_21558 ) ) ( not ( = ?auto_21565 ?auto_21558 ) ) ( AVAILABLE ?auto_21558 ) ( SURFACE-AT ?auto_21545 ?auto_21548 ) ( ON ?auto_21545 ?auto_21557 ) ( CLEAR ?auto_21545 ) ( not ( = ?auto_21544 ?auto_21557 ) ) ( not ( = ?auto_21545 ?auto_21557 ) ) ( not ( = ?auto_21551 ?auto_21557 ) ) ( not ( = ?auto_21562 ?auto_21557 ) ) ( IS-CRATE ?auto_21562 ) ( not ( = ?auto_21544 ?auto_21561 ) ) ( not ( = ?auto_21545 ?auto_21561 ) ) ( not ( = ?auto_21551 ?auto_21561 ) ) ( not ( = ?auto_21562 ?auto_21561 ) ) ( not ( = ?auto_21557 ?auto_21561 ) ) ( not ( = ?auto_21566 ?auto_21563 ) ) ( not ( = ?auto_21553 ?auto_21566 ) ) ( not ( = ?auto_21548 ?auto_21566 ) ) ( HOIST-AT ?auto_21556 ?auto_21566 ) ( not ( = ?auto_21564 ?auto_21556 ) ) ( not ( = ?auto_21565 ?auto_21556 ) ) ( not ( = ?auto_21558 ?auto_21556 ) ) ( AVAILABLE ?auto_21556 ) ( SURFACE-AT ?auto_21562 ?auto_21566 ) ( ON ?auto_21562 ?auto_21554 ) ( CLEAR ?auto_21562 ) ( not ( = ?auto_21544 ?auto_21554 ) ) ( not ( = ?auto_21545 ?auto_21554 ) ) ( not ( = ?auto_21551 ?auto_21554 ) ) ( not ( = ?auto_21562 ?auto_21554 ) ) ( not ( = ?auto_21557 ?auto_21554 ) ) ( not ( = ?auto_21561 ?auto_21554 ) ) ( IS-CRATE ?auto_21561 ) ( not ( = ?auto_21544 ?auto_21555 ) ) ( not ( = ?auto_21545 ?auto_21555 ) ) ( not ( = ?auto_21551 ?auto_21555 ) ) ( not ( = ?auto_21562 ?auto_21555 ) ) ( not ( = ?auto_21557 ?auto_21555 ) ) ( not ( = ?auto_21561 ?auto_21555 ) ) ( not ( = ?auto_21554 ?auto_21555 ) ) ( not ( = ?auto_21550 ?auto_21563 ) ) ( not ( = ?auto_21553 ?auto_21550 ) ) ( not ( = ?auto_21548 ?auto_21550 ) ) ( not ( = ?auto_21566 ?auto_21550 ) ) ( HOIST-AT ?auto_21549 ?auto_21550 ) ( not ( = ?auto_21564 ?auto_21549 ) ) ( not ( = ?auto_21565 ?auto_21549 ) ) ( not ( = ?auto_21558 ?auto_21549 ) ) ( not ( = ?auto_21556 ?auto_21549 ) ) ( AVAILABLE ?auto_21549 ) ( SURFACE-AT ?auto_21561 ?auto_21550 ) ( ON ?auto_21561 ?auto_21560 ) ( CLEAR ?auto_21561 ) ( not ( = ?auto_21544 ?auto_21560 ) ) ( not ( = ?auto_21545 ?auto_21560 ) ) ( not ( = ?auto_21551 ?auto_21560 ) ) ( not ( = ?auto_21562 ?auto_21560 ) ) ( not ( = ?auto_21557 ?auto_21560 ) ) ( not ( = ?auto_21561 ?auto_21560 ) ) ( not ( = ?auto_21554 ?auto_21560 ) ) ( not ( = ?auto_21555 ?auto_21560 ) ) ( SURFACE-AT ?auto_21559 ?auto_21563 ) ( CLEAR ?auto_21559 ) ( IS-CRATE ?auto_21555 ) ( not ( = ?auto_21544 ?auto_21559 ) ) ( not ( = ?auto_21545 ?auto_21559 ) ) ( not ( = ?auto_21551 ?auto_21559 ) ) ( not ( = ?auto_21562 ?auto_21559 ) ) ( not ( = ?auto_21557 ?auto_21559 ) ) ( not ( = ?auto_21561 ?auto_21559 ) ) ( not ( = ?auto_21554 ?auto_21559 ) ) ( not ( = ?auto_21555 ?auto_21559 ) ) ( not ( = ?auto_21560 ?auto_21559 ) ) ( AVAILABLE ?auto_21564 ) ( TRUCK-AT ?auto_21552 ?auto_21547 ) ( not ( = ?auto_21547 ?auto_21563 ) ) ( not ( = ?auto_21553 ?auto_21547 ) ) ( not ( = ?auto_21548 ?auto_21547 ) ) ( not ( = ?auto_21566 ?auto_21547 ) ) ( not ( = ?auto_21550 ?auto_21547 ) ) ( HOIST-AT ?auto_21546 ?auto_21547 ) ( not ( = ?auto_21564 ?auto_21546 ) ) ( not ( = ?auto_21565 ?auto_21546 ) ) ( not ( = ?auto_21558 ?auto_21546 ) ) ( not ( = ?auto_21556 ?auto_21546 ) ) ( not ( = ?auto_21549 ?auto_21546 ) ) ( AVAILABLE ?auto_21546 ) ( SURFACE-AT ?auto_21555 ?auto_21547 ) ( ON ?auto_21555 ?auto_21567 ) ( CLEAR ?auto_21555 ) ( not ( = ?auto_21544 ?auto_21567 ) ) ( not ( = ?auto_21545 ?auto_21567 ) ) ( not ( = ?auto_21551 ?auto_21567 ) ) ( not ( = ?auto_21562 ?auto_21567 ) ) ( not ( = ?auto_21557 ?auto_21567 ) ) ( not ( = ?auto_21561 ?auto_21567 ) ) ( not ( = ?auto_21554 ?auto_21567 ) ) ( not ( = ?auto_21555 ?auto_21567 ) ) ( not ( = ?auto_21560 ?auto_21567 ) ) ( not ( = ?auto_21559 ?auto_21567 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21546 ?auto_21555 ?auto_21567 ?auto_21547 )
      ( MAKE-ON ?auto_21544 ?auto_21545 )
      ( MAKE-ON-VERIFY ?auto_21544 ?auto_21545 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21568 - SURFACE
      ?auto_21569 - SURFACE
    )
    :vars
    (
      ?auto_21575 - HOIST
      ?auto_21578 - PLACE
      ?auto_21584 - PLACE
      ?auto_21576 - HOIST
      ?auto_21590 - SURFACE
      ?auto_21577 - SURFACE
      ?auto_21586 - PLACE
      ?auto_21589 - HOIST
      ?auto_21572 - SURFACE
      ?auto_21587 - SURFACE
      ?auto_21579 - PLACE
      ?auto_21581 - HOIST
      ?auto_21580 - SURFACE
      ?auto_21582 - SURFACE
      ?auto_21573 - PLACE
      ?auto_21583 - HOIST
      ?auto_21585 - SURFACE
      ?auto_21574 - SURFACE
      ?auto_21570 - PLACE
      ?auto_21591 - HOIST
      ?auto_21571 - SURFACE
      ?auto_21588 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21575 ?auto_21578 ) ( IS-CRATE ?auto_21568 ) ( not ( = ?auto_21568 ?auto_21569 ) ) ( not ( = ?auto_21584 ?auto_21578 ) ) ( HOIST-AT ?auto_21576 ?auto_21584 ) ( not ( = ?auto_21575 ?auto_21576 ) ) ( AVAILABLE ?auto_21576 ) ( SURFACE-AT ?auto_21568 ?auto_21584 ) ( ON ?auto_21568 ?auto_21590 ) ( CLEAR ?auto_21568 ) ( not ( = ?auto_21568 ?auto_21590 ) ) ( not ( = ?auto_21569 ?auto_21590 ) ) ( IS-CRATE ?auto_21569 ) ( not ( = ?auto_21568 ?auto_21577 ) ) ( not ( = ?auto_21569 ?auto_21577 ) ) ( not ( = ?auto_21590 ?auto_21577 ) ) ( not ( = ?auto_21586 ?auto_21578 ) ) ( not ( = ?auto_21584 ?auto_21586 ) ) ( HOIST-AT ?auto_21589 ?auto_21586 ) ( not ( = ?auto_21575 ?auto_21589 ) ) ( not ( = ?auto_21576 ?auto_21589 ) ) ( AVAILABLE ?auto_21589 ) ( SURFACE-AT ?auto_21569 ?auto_21586 ) ( ON ?auto_21569 ?auto_21572 ) ( CLEAR ?auto_21569 ) ( not ( = ?auto_21568 ?auto_21572 ) ) ( not ( = ?auto_21569 ?auto_21572 ) ) ( not ( = ?auto_21590 ?auto_21572 ) ) ( not ( = ?auto_21577 ?auto_21572 ) ) ( IS-CRATE ?auto_21577 ) ( not ( = ?auto_21568 ?auto_21587 ) ) ( not ( = ?auto_21569 ?auto_21587 ) ) ( not ( = ?auto_21590 ?auto_21587 ) ) ( not ( = ?auto_21577 ?auto_21587 ) ) ( not ( = ?auto_21572 ?auto_21587 ) ) ( not ( = ?auto_21579 ?auto_21578 ) ) ( not ( = ?auto_21584 ?auto_21579 ) ) ( not ( = ?auto_21586 ?auto_21579 ) ) ( HOIST-AT ?auto_21581 ?auto_21579 ) ( not ( = ?auto_21575 ?auto_21581 ) ) ( not ( = ?auto_21576 ?auto_21581 ) ) ( not ( = ?auto_21589 ?auto_21581 ) ) ( AVAILABLE ?auto_21581 ) ( SURFACE-AT ?auto_21577 ?auto_21579 ) ( ON ?auto_21577 ?auto_21580 ) ( CLEAR ?auto_21577 ) ( not ( = ?auto_21568 ?auto_21580 ) ) ( not ( = ?auto_21569 ?auto_21580 ) ) ( not ( = ?auto_21590 ?auto_21580 ) ) ( not ( = ?auto_21577 ?auto_21580 ) ) ( not ( = ?auto_21572 ?auto_21580 ) ) ( not ( = ?auto_21587 ?auto_21580 ) ) ( IS-CRATE ?auto_21587 ) ( not ( = ?auto_21568 ?auto_21582 ) ) ( not ( = ?auto_21569 ?auto_21582 ) ) ( not ( = ?auto_21590 ?auto_21582 ) ) ( not ( = ?auto_21577 ?auto_21582 ) ) ( not ( = ?auto_21572 ?auto_21582 ) ) ( not ( = ?auto_21587 ?auto_21582 ) ) ( not ( = ?auto_21580 ?auto_21582 ) ) ( not ( = ?auto_21573 ?auto_21578 ) ) ( not ( = ?auto_21584 ?auto_21573 ) ) ( not ( = ?auto_21586 ?auto_21573 ) ) ( not ( = ?auto_21579 ?auto_21573 ) ) ( HOIST-AT ?auto_21583 ?auto_21573 ) ( not ( = ?auto_21575 ?auto_21583 ) ) ( not ( = ?auto_21576 ?auto_21583 ) ) ( not ( = ?auto_21589 ?auto_21583 ) ) ( not ( = ?auto_21581 ?auto_21583 ) ) ( AVAILABLE ?auto_21583 ) ( SURFACE-AT ?auto_21587 ?auto_21573 ) ( ON ?auto_21587 ?auto_21585 ) ( CLEAR ?auto_21587 ) ( not ( = ?auto_21568 ?auto_21585 ) ) ( not ( = ?auto_21569 ?auto_21585 ) ) ( not ( = ?auto_21590 ?auto_21585 ) ) ( not ( = ?auto_21577 ?auto_21585 ) ) ( not ( = ?auto_21572 ?auto_21585 ) ) ( not ( = ?auto_21587 ?auto_21585 ) ) ( not ( = ?auto_21580 ?auto_21585 ) ) ( not ( = ?auto_21582 ?auto_21585 ) ) ( SURFACE-AT ?auto_21574 ?auto_21578 ) ( CLEAR ?auto_21574 ) ( IS-CRATE ?auto_21582 ) ( not ( = ?auto_21568 ?auto_21574 ) ) ( not ( = ?auto_21569 ?auto_21574 ) ) ( not ( = ?auto_21590 ?auto_21574 ) ) ( not ( = ?auto_21577 ?auto_21574 ) ) ( not ( = ?auto_21572 ?auto_21574 ) ) ( not ( = ?auto_21587 ?auto_21574 ) ) ( not ( = ?auto_21580 ?auto_21574 ) ) ( not ( = ?auto_21582 ?auto_21574 ) ) ( not ( = ?auto_21585 ?auto_21574 ) ) ( AVAILABLE ?auto_21575 ) ( not ( = ?auto_21570 ?auto_21578 ) ) ( not ( = ?auto_21584 ?auto_21570 ) ) ( not ( = ?auto_21586 ?auto_21570 ) ) ( not ( = ?auto_21579 ?auto_21570 ) ) ( not ( = ?auto_21573 ?auto_21570 ) ) ( HOIST-AT ?auto_21591 ?auto_21570 ) ( not ( = ?auto_21575 ?auto_21591 ) ) ( not ( = ?auto_21576 ?auto_21591 ) ) ( not ( = ?auto_21589 ?auto_21591 ) ) ( not ( = ?auto_21581 ?auto_21591 ) ) ( not ( = ?auto_21583 ?auto_21591 ) ) ( AVAILABLE ?auto_21591 ) ( SURFACE-AT ?auto_21582 ?auto_21570 ) ( ON ?auto_21582 ?auto_21571 ) ( CLEAR ?auto_21582 ) ( not ( = ?auto_21568 ?auto_21571 ) ) ( not ( = ?auto_21569 ?auto_21571 ) ) ( not ( = ?auto_21590 ?auto_21571 ) ) ( not ( = ?auto_21577 ?auto_21571 ) ) ( not ( = ?auto_21572 ?auto_21571 ) ) ( not ( = ?auto_21587 ?auto_21571 ) ) ( not ( = ?auto_21580 ?auto_21571 ) ) ( not ( = ?auto_21582 ?auto_21571 ) ) ( not ( = ?auto_21585 ?auto_21571 ) ) ( not ( = ?auto_21574 ?auto_21571 ) ) ( TRUCK-AT ?auto_21588 ?auto_21578 ) )
    :subtasks
    ( ( !DRIVE ?auto_21588 ?auto_21578 ?auto_21570 )
      ( MAKE-ON ?auto_21568 ?auto_21569 )
      ( MAKE-ON-VERIFY ?auto_21568 ?auto_21569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21594 - SURFACE
      ?auto_21595 - SURFACE
    )
    :vars
    (
      ?auto_21596 - HOIST
      ?auto_21597 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21596 ?auto_21597 ) ( SURFACE-AT ?auto_21595 ?auto_21597 ) ( CLEAR ?auto_21595 ) ( LIFTING ?auto_21596 ?auto_21594 ) ( IS-CRATE ?auto_21594 ) ( not ( = ?auto_21594 ?auto_21595 ) ) )
    :subtasks
    ( ( !DROP ?auto_21596 ?auto_21594 ?auto_21595 ?auto_21597 )
      ( MAKE-ON-VERIFY ?auto_21594 ?auto_21595 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21598 - SURFACE
      ?auto_21599 - SURFACE
    )
    :vars
    (
      ?auto_21601 - HOIST
      ?auto_21600 - PLACE
      ?auto_21602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21601 ?auto_21600 ) ( SURFACE-AT ?auto_21599 ?auto_21600 ) ( CLEAR ?auto_21599 ) ( IS-CRATE ?auto_21598 ) ( not ( = ?auto_21598 ?auto_21599 ) ) ( TRUCK-AT ?auto_21602 ?auto_21600 ) ( AVAILABLE ?auto_21601 ) ( IN ?auto_21598 ?auto_21602 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21601 ?auto_21598 ?auto_21602 ?auto_21600 )
      ( MAKE-ON ?auto_21598 ?auto_21599 )
      ( MAKE-ON-VERIFY ?auto_21598 ?auto_21599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21603 - SURFACE
      ?auto_21604 - SURFACE
    )
    :vars
    (
      ?auto_21606 - HOIST
      ?auto_21607 - PLACE
      ?auto_21605 - TRUCK
      ?auto_21608 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21606 ?auto_21607 ) ( SURFACE-AT ?auto_21604 ?auto_21607 ) ( CLEAR ?auto_21604 ) ( IS-CRATE ?auto_21603 ) ( not ( = ?auto_21603 ?auto_21604 ) ) ( AVAILABLE ?auto_21606 ) ( IN ?auto_21603 ?auto_21605 ) ( TRUCK-AT ?auto_21605 ?auto_21608 ) ( not ( = ?auto_21608 ?auto_21607 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21605 ?auto_21608 ?auto_21607 )
      ( MAKE-ON ?auto_21603 ?auto_21604 )
      ( MAKE-ON-VERIFY ?auto_21603 ?auto_21604 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21609 - SURFACE
      ?auto_21610 - SURFACE
    )
    :vars
    (
      ?auto_21612 - HOIST
      ?auto_21614 - PLACE
      ?auto_21611 - TRUCK
      ?auto_21613 - PLACE
      ?auto_21615 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21612 ?auto_21614 ) ( SURFACE-AT ?auto_21610 ?auto_21614 ) ( CLEAR ?auto_21610 ) ( IS-CRATE ?auto_21609 ) ( not ( = ?auto_21609 ?auto_21610 ) ) ( AVAILABLE ?auto_21612 ) ( TRUCK-AT ?auto_21611 ?auto_21613 ) ( not ( = ?auto_21613 ?auto_21614 ) ) ( HOIST-AT ?auto_21615 ?auto_21613 ) ( LIFTING ?auto_21615 ?auto_21609 ) ( not ( = ?auto_21612 ?auto_21615 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21615 ?auto_21609 ?auto_21611 ?auto_21613 )
      ( MAKE-ON ?auto_21609 ?auto_21610 )
      ( MAKE-ON-VERIFY ?auto_21609 ?auto_21610 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21616 - SURFACE
      ?auto_21617 - SURFACE
    )
    :vars
    (
      ?auto_21619 - HOIST
      ?auto_21622 - PLACE
      ?auto_21618 - TRUCK
      ?auto_21620 - PLACE
      ?auto_21621 - HOIST
      ?auto_21623 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21619 ?auto_21622 ) ( SURFACE-AT ?auto_21617 ?auto_21622 ) ( CLEAR ?auto_21617 ) ( IS-CRATE ?auto_21616 ) ( not ( = ?auto_21616 ?auto_21617 ) ) ( AVAILABLE ?auto_21619 ) ( TRUCK-AT ?auto_21618 ?auto_21620 ) ( not ( = ?auto_21620 ?auto_21622 ) ) ( HOIST-AT ?auto_21621 ?auto_21620 ) ( not ( = ?auto_21619 ?auto_21621 ) ) ( AVAILABLE ?auto_21621 ) ( SURFACE-AT ?auto_21616 ?auto_21620 ) ( ON ?auto_21616 ?auto_21623 ) ( CLEAR ?auto_21616 ) ( not ( = ?auto_21616 ?auto_21623 ) ) ( not ( = ?auto_21617 ?auto_21623 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21621 ?auto_21616 ?auto_21623 ?auto_21620 )
      ( MAKE-ON ?auto_21616 ?auto_21617 )
      ( MAKE-ON-VERIFY ?auto_21616 ?auto_21617 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21624 - SURFACE
      ?auto_21625 - SURFACE
    )
    :vars
    (
      ?auto_21631 - HOIST
      ?auto_21627 - PLACE
      ?auto_21628 - PLACE
      ?auto_21629 - HOIST
      ?auto_21626 - SURFACE
      ?auto_21630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21631 ?auto_21627 ) ( SURFACE-AT ?auto_21625 ?auto_21627 ) ( CLEAR ?auto_21625 ) ( IS-CRATE ?auto_21624 ) ( not ( = ?auto_21624 ?auto_21625 ) ) ( AVAILABLE ?auto_21631 ) ( not ( = ?auto_21628 ?auto_21627 ) ) ( HOIST-AT ?auto_21629 ?auto_21628 ) ( not ( = ?auto_21631 ?auto_21629 ) ) ( AVAILABLE ?auto_21629 ) ( SURFACE-AT ?auto_21624 ?auto_21628 ) ( ON ?auto_21624 ?auto_21626 ) ( CLEAR ?auto_21624 ) ( not ( = ?auto_21624 ?auto_21626 ) ) ( not ( = ?auto_21625 ?auto_21626 ) ) ( TRUCK-AT ?auto_21630 ?auto_21627 ) )
    :subtasks
    ( ( !DRIVE ?auto_21630 ?auto_21627 ?auto_21628 )
      ( MAKE-ON ?auto_21624 ?auto_21625 )
      ( MAKE-ON-VERIFY ?auto_21624 ?auto_21625 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21632 - SURFACE
      ?auto_21633 - SURFACE
    )
    :vars
    (
      ?auto_21637 - HOIST
      ?auto_21635 - PLACE
      ?auto_21634 - PLACE
      ?auto_21636 - HOIST
      ?auto_21638 - SURFACE
      ?auto_21639 - TRUCK
      ?auto_21640 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21637 ?auto_21635 ) ( IS-CRATE ?auto_21632 ) ( not ( = ?auto_21632 ?auto_21633 ) ) ( not ( = ?auto_21634 ?auto_21635 ) ) ( HOIST-AT ?auto_21636 ?auto_21634 ) ( not ( = ?auto_21637 ?auto_21636 ) ) ( AVAILABLE ?auto_21636 ) ( SURFACE-AT ?auto_21632 ?auto_21634 ) ( ON ?auto_21632 ?auto_21638 ) ( CLEAR ?auto_21632 ) ( not ( = ?auto_21632 ?auto_21638 ) ) ( not ( = ?auto_21633 ?auto_21638 ) ) ( TRUCK-AT ?auto_21639 ?auto_21635 ) ( SURFACE-AT ?auto_21640 ?auto_21635 ) ( CLEAR ?auto_21640 ) ( LIFTING ?auto_21637 ?auto_21633 ) ( IS-CRATE ?auto_21633 ) ( not ( = ?auto_21632 ?auto_21640 ) ) ( not ( = ?auto_21633 ?auto_21640 ) ) ( not ( = ?auto_21638 ?auto_21640 ) ) )
    :subtasks
    ( ( !DROP ?auto_21637 ?auto_21633 ?auto_21640 ?auto_21635 )
      ( MAKE-ON ?auto_21632 ?auto_21633 )
      ( MAKE-ON-VERIFY ?auto_21632 ?auto_21633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21641 - SURFACE
      ?auto_21642 - SURFACE
    )
    :vars
    (
      ?auto_21643 - HOIST
      ?auto_21646 - PLACE
      ?auto_21648 - PLACE
      ?auto_21645 - HOIST
      ?auto_21649 - SURFACE
      ?auto_21647 - TRUCK
      ?auto_21644 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21643 ?auto_21646 ) ( IS-CRATE ?auto_21641 ) ( not ( = ?auto_21641 ?auto_21642 ) ) ( not ( = ?auto_21648 ?auto_21646 ) ) ( HOIST-AT ?auto_21645 ?auto_21648 ) ( not ( = ?auto_21643 ?auto_21645 ) ) ( AVAILABLE ?auto_21645 ) ( SURFACE-AT ?auto_21641 ?auto_21648 ) ( ON ?auto_21641 ?auto_21649 ) ( CLEAR ?auto_21641 ) ( not ( = ?auto_21641 ?auto_21649 ) ) ( not ( = ?auto_21642 ?auto_21649 ) ) ( TRUCK-AT ?auto_21647 ?auto_21646 ) ( SURFACE-AT ?auto_21644 ?auto_21646 ) ( CLEAR ?auto_21644 ) ( IS-CRATE ?auto_21642 ) ( not ( = ?auto_21641 ?auto_21644 ) ) ( not ( = ?auto_21642 ?auto_21644 ) ) ( not ( = ?auto_21649 ?auto_21644 ) ) ( AVAILABLE ?auto_21643 ) ( IN ?auto_21642 ?auto_21647 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21643 ?auto_21642 ?auto_21647 ?auto_21646 )
      ( MAKE-ON ?auto_21641 ?auto_21642 )
      ( MAKE-ON-VERIFY ?auto_21641 ?auto_21642 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21650 - SURFACE
      ?auto_21651 - SURFACE
    )
    :vars
    (
      ?auto_21656 - HOIST
      ?auto_21655 - PLACE
      ?auto_21657 - PLACE
      ?auto_21653 - HOIST
      ?auto_21652 - SURFACE
      ?auto_21658 - SURFACE
      ?auto_21654 - TRUCK
      ?auto_21659 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21656 ?auto_21655 ) ( IS-CRATE ?auto_21650 ) ( not ( = ?auto_21650 ?auto_21651 ) ) ( not ( = ?auto_21657 ?auto_21655 ) ) ( HOIST-AT ?auto_21653 ?auto_21657 ) ( not ( = ?auto_21656 ?auto_21653 ) ) ( AVAILABLE ?auto_21653 ) ( SURFACE-AT ?auto_21650 ?auto_21657 ) ( ON ?auto_21650 ?auto_21652 ) ( CLEAR ?auto_21650 ) ( not ( = ?auto_21650 ?auto_21652 ) ) ( not ( = ?auto_21651 ?auto_21652 ) ) ( SURFACE-AT ?auto_21658 ?auto_21655 ) ( CLEAR ?auto_21658 ) ( IS-CRATE ?auto_21651 ) ( not ( = ?auto_21650 ?auto_21658 ) ) ( not ( = ?auto_21651 ?auto_21658 ) ) ( not ( = ?auto_21652 ?auto_21658 ) ) ( AVAILABLE ?auto_21656 ) ( IN ?auto_21651 ?auto_21654 ) ( TRUCK-AT ?auto_21654 ?auto_21659 ) ( not ( = ?auto_21659 ?auto_21655 ) ) ( not ( = ?auto_21657 ?auto_21659 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21654 ?auto_21659 ?auto_21655 )
      ( MAKE-ON ?auto_21650 ?auto_21651 )
      ( MAKE-ON-VERIFY ?auto_21650 ?auto_21651 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21660 - SURFACE
      ?auto_21661 - SURFACE
    )
    :vars
    (
      ?auto_21665 - HOIST
      ?auto_21664 - PLACE
      ?auto_21667 - PLACE
      ?auto_21663 - HOIST
      ?auto_21669 - SURFACE
      ?auto_21668 - SURFACE
      ?auto_21662 - TRUCK
      ?auto_21666 - PLACE
      ?auto_21670 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21665 ?auto_21664 ) ( IS-CRATE ?auto_21660 ) ( not ( = ?auto_21660 ?auto_21661 ) ) ( not ( = ?auto_21667 ?auto_21664 ) ) ( HOIST-AT ?auto_21663 ?auto_21667 ) ( not ( = ?auto_21665 ?auto_21663 ) ) ( AVAILABLE ?auto_21663 ) ( SURFACE-AT ?auto_21660 ?auto_21667 ) ( ON ?auto_21660 ?auto_21669 ) ( CLEAR ?auto_21660 ) ( not ( = ?auto_21660 ?auto_21669 ) ) ( not ( = ?auto_21661 ?auto_21669 ) ) ( SURFACE-AT ?auto_21668 ?auto_21664 ) ( CLEAR ?auto_21668 ) ( IS-CRATE ?auto_21661 ) ( not ( = ?auto_21660 ?auto_21668 ) ) ( not ( = ?auto_21661 ?auto_21668 ) ) ( not ( = ?auto_21669 ?auto_21668 ) ) ( AVAILABLE ?auto_21665 ) ( TRUCK-AT ?auto_21662 ?auto_21666 ) ( not ( = ?auto_21666 ?auto_21664 ) ) ( not ( = ?auto_21667 ?auto_21666 ) ) ( HOIST-AT ?auto_21670 ?auto_21666 ) ( LIFTING ?auto_21670 ?auto_21661 ) ( not ( = ?auto_21665 ?auto_21670 ) ) ( not ( = ?auto_21663 ?auto_21670 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21670 ?auto_21661 ?auto_21662 ?auto_21666 )
      ( MAKE-ON ?auto_21660 ?auto_21661 )
      ( MAKE-ON-VERIFY ?auto_21660 ?auto_21661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21671 - SURFACE
      ?auto_21672 - SURFACE
    )
    :vars
    (
      ?auto_21676 - HOIST
      ?auto_21677 - PLACE
      ?auto_21674 - PLACE
      ?auto_21678 - HOIST
      ?auto_21680 - SURFACE
      ?auto_21675 - SURFACE
      ?auto_21681 - TRUCK
      ?auto_21673 - PLACE
      ?auto_21679 - HOIST
      ?auto_21682 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21676 ?auto_21677 ) ( IS-CRATE ?auto_21671 ) ( not ( = ?auto_21671 ?auto_21672 ) ) ( not ( = ?auto_21674 ?auto_21677 ) ) ( HOIST-AT ?auto_21678 ?auto_21674 ) ( not ( = ?auto_21676 ?auto_21678 ) ) ( AVAILABLE ?auto_21678 ) ( SURFACE-AT ?auto_21671 ?auto_21674 ) ( ON ?auto_21671 ?auto_21680 ) ( CLEAR ?auto_21671 ) ( not ( = ?auto_21671 ?auto_21680 ) ) ( not ( = ?auto_21672 ?auto_21680 ) ) ( SURFACE-AT ?auto_21675 ?auto_21677 ) ( CLEAR ?auto_21675 ) ( IS-CRATE ?auto_21672 ) ( not ( = ?auto_21671 ?auto_21675 ) ) ( not ( = ?auto_21672 ?auto_21675 ) ) ( not ( = ?auto_21680 ?auto_21675 ) ) ( AVAILABLE ?auto_21676 ) ( TRUCK-AT ?auto_21681 ?auto_21673 ) ( not ( = ?auto_21673 ?auto_21677 ) ) ( not ( = ?auto_21674 ?auto_21673 ) ) ( HOIST-AT ?auto_21679 ?auto_21673 ) ( not ( = ?auto_21676 ?auto_21679 ) ) ( not ( = ?auto_21678 ?auto_21679 ) ) ( AVAILABLE ?auto_21679 ) ( SURFACE-AT ?auto_21672 ?auto_21673 ) ( ON ?auto_21672 ?auto_21682 ) ( CLEAR ?auto_21672 ) ( not ( = ?auto_21671 ?auto_21682 ) ) ( not ( = ?auto_21672 ?auto_21682 ) ) ( not ( = ?auto_21680 ?auto_21682 ) ) ( not ( = ?auto_21675 ?auto_21682 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21679 ?auto_21672 ?auto_21682 ?auto_21673 )
      ( MAKE-ON ?auto_21671 ?auto_21672 )
      ( MAKE-ON-VERIFY ?auto_21671 ?auto_21672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21683 - SURFACE
      ?auto_21684 - SURFACE
    )
    :vars
    (
      ?auto_21690 - HOIST
      ?auto_21686 - PLACE
      ?auto_21693 - PLACE
      ?auto_21689 - HOIST
      ?auto_21692 - SURFACE
      ?auto_21694 - SURFACE
      ?auto_21688 - PLACE
      ?auto_21685 - HOIST
      ?auto_21691 - SURFACE
      ?auto_21687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21690 ?auto_21686 ) ( IS-CRATE ?auto_21683 ) ( not ( = ?auto_21683 ?auto_21684 ) ) ( not ( = ?auto_21693 ?auto_21686 ) ) ( HOIST-AT ?auto_21689 ?auto_21693 ) ( not ( = ?auto_21690 ?auto_21689 ) ) ( AVAILABLE ?auto_21689 ) ( SURFACE-AT ?auto_21683 ?auto_21693 ) ( ON ?auto_21683 ?auto_21692 ) ( CLEAR ?auto_21683 ) ( not ( = ?auto_21683 ?auto_21692 ) ) ( not ( = ?auto_21684 ?auto_21692 ) ) ( SURFACE-AT ?auto_21694 ?auto_21686 ) ( CLEAR ?auto_21694 ) ( IS-CRATE ?auto_21684 ) ( not ( = ?auto_21683 ?auto_21694 ) ) ( not ( = ?auto_21684 ?auto_21694 ) ) ( not ( = ?auto_21692 ?auto_21694 ) ) ( AVAILABLE ?auto_21690 ) ( not ( = ?auto_21688 ?auto_21686 ) ) ( not ( = ?auto_21693 ?auto_21688 ) ) ( HOIST-AT ?auto_21685 ?auto_21688 ) ( not ( = ?auto_21690 ?auto_21685 ) ) ( not ( = ?auto_21689 ?auto_21685 ) ) ( AVAILABLE ?auto_21685 ) ( SURFACE-AT ?auto_21684 ?auto_21688 ) ( ON ?auto_21684 ?auto_21691 ) ( CLEAR ?auto_21684 ) ( not ( = ?auto_21683 ?auto_21691 ) ) ( not ( = ?auto_21684 ?auto_21691 ) ) ( not ( = ?auto_21692 ?auto_21691 ) ) ( not ( = ?auto_21694 ?auto_21691 ) ) ( TRUCK-AT ?auto_21687 ?auto_21686 ) )
    :subtasks
    ( ( !DRIVE ?auto_21687 ?auto_21686 ?auto_21688 )
      ( MAKE-ON ?auto_21683 ?auto_21684 )
      ( MAKE-ON-VERIFY ?auto_21683 ?auto_21684 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21695 - SURFACE
      ?auto_21696 - SURFACE
    )
    :vars
    (
      ?auto_21705 - HOIST
      ?auto_21701 - PLACE
      ?auto_21697 - PLACE
      ?auto_21704 - HOIST
      ?auto_21698 - SURFACE
      ?auto_21702 - SURFACE
      ?auto_21703 - PLACE
      ?auto_21699 - HOIST
      ?auto_21700 - SURFACE
      ?auto_21706 - TRUCK
      ?auto_21707 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21705 ?auto_21701 ) ( IS-CRATE ?auto_21695 ) ( not ( = ?auto_21695 ?auto_21696 ) ) ( not ( = ?auto_21697 ?auto_21701 ) ) ( HOIST-AT ?auto_21704 ?auto_21697 ) ( not ( = ?auto_21705 ?auto_21704 ) ) ( AVAILABLE ?auto_21704 ) ( SURFACE-AT ?auto_21695 ?auto_21697 ) ( ON ?auto_21695 ?auto_21698 ) ( CLEAR ?auto_21695 ) ( not ( = ?auto_21695 ?auto_21698 ) ) ( not ( = ?auto_21696 ?auto_21698 ) ) ( IS-CRATE ?auto_21696 ) ( not ( = ?auto_21695 ?auto_21702 ) ) ( not ( = ?auto_21696 ?auto_21702 ) ) ( not ( = ?auto_21698 ?auto_21702 ) ) ( not ( = ?auto_21703 ?auto_21701 ) ) ( not ( = ?auto_21697 ?auto_21703 ) ) ( HOIST-AT ?auto_21699 ?auto_21703 ) ( not ( = ?auto_21705 ?auto_21699 ) ) ( not ( = ?auto_21704 ?auto_21699 ) ) ( AVAILABLE ?auto_21699 ) ( SURFACE-AT ?auto_21696 ?auto_21703 ) ( ON ?auto_21696 ?auto_21700 ) ( CLEAR ?auto_21696 ) ( not ( = ?auto_21695 ?auto_21700 ) ) ( not ( = ?auto_21696 ?auto_21700 ) ) ( not ( = ?auto_21698 ?auto_21700 ) ) ( not ( = ?auto_21702 ?auto_21700 ) ) ( TRUCK-AT ?auto_21706 ?auto_21701 ) ( SURFACE-AT ?auto_21707 ?auto_21701 ) ( CLEAR ?auto_21707 ) ( LIFTING ?auto_21705 ?auto_21702 ) ( IS-CRATE ?auto_21702 ) ( not ( = ?auto_21695 ?auto_21707 ) ) ( not ( = ?auto_21696 ?auto_21707 ) ) ( not ( = ?auto_21698 ?auto_21707 ) ) ( not ( = ?auto_21702 ?auto_21707 ) ) ( not ( = ?auto_21700 ?auto_21707 ) ) )
    :subtasks
    ( ( !DROP ?auto_21705 ?auto_21702 ?auto_21707 ?auto_21701 )
      ( MAKE-ON ?auto_21695 ?auto_21696 )
      ( MAKE-ON-VERIFY ?auto_21695 ?auto_21696 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21708 - SURFACE
      ?auto_21709 - SURFACE
    )
    :vars
    (
      ?auto_21717 - HOIST
      ?auto_21716 - PLACE
      ?auto_21710 - PLACE
      ?auto_21718 - HOIST
      ?auto_21715 - SURFACE
      ?auto_21713 - SURFACE
      ?auto_21720 - PLACE
      ?auto_21712 - HOIST
      ?auto_21714 - SURFACE
      ?auto_21719 - TRUCK
      ?auto_21711 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21717 ?auto_21716 ) ( IS-CRATE ?auto_21708 ) ( not ( = ?auto_21708 ?auto_21709 ) ) ( not ( = ?auto_21710 ?auto_21716 ) ) ( HOIST-AT ?auto_21718 ?auto_21710 ) ( not ( = ?auto_21717 ?auto_21718 ) ) ( AVAILABLE ?auto_21718 ) ( SURFACE-AT ?auto_21708 ?auto_21710 ) ( ON ?auto_21708 ?auto_21715 ) ( CLEAR ?auto_21708 ) ( not ( = ?auto_21708 ?auto_21715 ) ) ( not ( = ?auto_21709 ?auto_21715 ) ) ( IS-CRATE ?auto_21709 ) ( not ( = ?auto_21708 ?auto_21713 ) ) ( not ( = ?auto_21709 ?auto_21713 ) ) ( not ( = ?auto_21715 ?auto_21713 ) ) ( not ( = ?auto_21720 ?auto_21716 ) ) ( not ( = ?auto_21710 ?auto_21720 ) ) ( HOIST-AT ?auto_21712 ?auto_21720 ) ( not ( = ?auto_21717 ?auto_21712 ) ) ( not ( = ?auto_21718 ?auto_21712 ) ) ( AVAILABLE ?auto_21712 ) ( SURFACE-AT ?auto_21709 ?auto_21720 ) ( ON ?auto_21709 ?auto_21714 ) ( CLEAR ?auto_21709 ) ( not ( = ?auto_21708 ?auto_21714 ) ) ( not ( = ?auto_21709 ?auto_21714 ) ) ( not ( = ?auto_21715 ?auto_21714 ) ) ( not ( = ?auto_21713 ?auto_21714 ) ) ( TRUCK-AT ?auto_21719 ?auto_21716 ) ( SURFACE-AT ?auto_21711 ?auto_21716 ) ( CLEAR ?auto_21711 ) ( IS-CRATE ?auto_21713 ) ( not ( = ?auto_21708 ?auto_21711 ) ) ( not ( = ?auto_21709 ?auto_21711 ) ) ( not ( = ?auto_21715 ?auto_21711 ) ) ( not ( = ?auto_21713 ?auto_21711 ) ) ( not ( = ?auto_21714 ?auto_21711 ) ) ( AVAILABLE ?auto_21717 ) ( IN ?auto_21713 ?auto_21719 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21717 ?auto_21713 ?auto_21719 ?auto_21716 )
      ( MAKE-ON ?auto_21708 ?auto_21709 )
      ( MAKE-ON-VERIFY ?auto_21708 ?auto_21709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21721 - SURFACE
      ?auto_21722 - SURFACE
    )
    :vars
    (
      ?auto_21732 - HOIST
      ?auto_21730 - PLACE
      ?auto_21733 - PLACE
      ?auto_21729 - HOIST
      ?auto_21723 - SURFACE
      ?auto_21724 - SURFACE
      ?auto_21726 - PLACE
      ?auto_21727 - HOIST
      ?auto_21725 - SURFACE
      ?auto_21728 - SURFACE
      ?auto_21731 - TRUCK
      ?auto_21734 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21732 ?auto_21730 ) ( IS-CRATE ?auto_21721 ) ( not ( = ?auto_21721 ?auto_21722 ) ) ( not ( = ?auto_21733 ?auto_21730 ) ) ( HOIST-AT ?auto_21729 ?auto_21733 ) ( not ( = ?auto_21732 ?auto_21729 ) ) ( AVAILABLE ?auto_21729 ) ( SURFACE-AT ?auto_21721 ?auto_21733 ) ( ON ?auto_21721 ?auto_21723 ) ( CLEAR ?auto_21721 ) ( not ( = ?auto_21721 ?auto_21723 ) ) ( not ( = ?auto_21722 ?auto_21723 ) ) ( IS-CRATE ?auto_21722 ) ( not ( = ?auto_21721 ?auto_21724 ) ) ( not ( = ?auto_21722 ?auto_21724 ) ) ( not ( = ?auto_21723 ?auto_21724 ) ) ( not ( = ?auto_21726 ?auto_21730 ) ) ( not ( = ?auto_21733 ?auto_21726 ) ) ( HOIST-AT ?auto_21727 ?auto_21726 ) ( not ( = ?auto_21732 ?auto_21727 ) ) ( not ( = ?auto_21729 ?auto_21727 ) ) ( AVAILABLE ?auto_21727 ) ( SURFACE-AT ?auto_21722 ?auto_21726 ) ( ON ?auto_21722 ?auto_21725 ) ( CLEAR ?auto_21722 ) ( not ( = ?auto_21721 ?auto_21725 ) ) ( not ( = ?auto_21722 ?auto_21725 ) ) ( not ( = ?auto_21723 ?auto_21725 ) ) ( not ( = ?auto_21724 ?auto_21725 ) ) ( SURFACE-AT ?auto_21728 ?auto_21730 ) ( CLEAR ?auto_21728 ) ( IS-CRATE ?auto_21724 ) ( not ( = ?auto_21721 ?auto_21728 ) ) ( not ( = ?auto_21722 ?auto_21728 ) ) ( not ( = ?auto_21723 ?auto_21728 ) ) ( not ( = ?auto_21724 ?auto_21728 ) ) ( not ( = ?auto_21725 ?auto_21728 ) ) ( AVAILABLE ?auto_21732 ) ( IN ?auto_21724 ?auto_21731 ) ( TRUCK-AT ?auto_21731 ?auto_21734 ) ( not ( = ?auto_21734 ?auto_21730 ) ) ( not ( = ?auto_21733 ?auto_21734 ) ) ( not ( = ?auto_21726 ?auto_21734 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21731 ?auto_21734 ?auto_21730 )
      ( MAKE-ON ?auto_21721 ?auto_21722 )
      ( MAKE-ON-VERIFY ?auto_21721 ?auto_21722 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21735 - SURFACE
      ?auto_21736 - SURFACE
    )
    :vars
    (
      ?auto_21747 - HOIST
      ?auto_21746 - PLACE
      ?auto_21739 - PLACE
      ?auto_21737 - HOIST
      ?auto_21742 - SURFACE
      ?auto_21741 - SURFACE
      ?auto_21740 - PLACE
      ?auto_21744 - HOIST
      ?auto_21748 - SURFACE
      ?auto_21745 - SURFACE
      ?auto_21743 - TRUCK
      ?auto_21738 - PLACE
      ?auto_21749 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21747 ?auto_21746 ) ( IS-CRATE ?auto_21735 ) ( not ( = ?auto_21735 ?auto_21736 ) ) ( not ( = ?auto_21739 ?auto_21746 ) ) ( HOIST-AT ?auto_21737 ?auto_21739 ) ( not ( = ?auto_21747 ?auto_21737 ) ) ( AVAILABLE ?auto_21737 ) ( SURFACE-AT ?auto_21735 ?auto_21739 ) ( ON ?auto_21735 ?auto_21742 ) ( CLEAR ?auto_21735 ) ( not ( = ?auto_21735 ?auto_21742 ) ) ( not ( = ?auto_21736 ?auto_21742 ) ) ( IS-CRATE ?auto_21736 ) ( not ( = ?auto_21735 ?auto_21741 ) ) ( not ( = ?auto_21736 ?auto_21741 ) ) ( not ( = ?auto_21742 ?auto_21741 ) ) ( not ( = ?auto_21740 ?auto_21746 ) ) ( not ( = ?auto_21739 ?auto_21740 ) ) ( HOIST-AT ?auto_21744 ?auto_21740 ) ( not ( = ?auto_21747 ?auto_21744 ) ) ( not ( = ?auto_21737 ?auto_21744 ) ) ( AVAILABLE ?auto_21744 ) ( SURFACE-AT ?auto_21736 ?auto_21740 ) ( ON ?auto_21736 ?auto_21748 ) ( CLEAR ?auto_21736 ) ( not ( = ?auto_21735 ?auto_21748 ) ) ( not ( = ?auto_21736 ?auto_21748 ) ) ( not ( = ?auto_21742 ?auto_21748 ) ) ( not ( = ?auto_21741 ?auto_21748 ) ) ( SURFACE-AT ?auto_21745 ?auto_21746 ) ( CLEAR ?auto_21745 ) ( IS-CRATE ?auto_21741 ) ( not ( = ?auto_21735 ?auto_21745 ) ) ( not ( = ?auto_21736 ?auto_21745 ) ) ( not ( = ?auto_21742 ?auto_21745 ) ) ( not ( = ?auto_21741 ?auto_21745 ) ) ( not ( = ?auto_21748 ?auto_21745 ) ) ( AVAILABLE ?auto_21747 ) ( TRUCK-AT ?auto_21743 ?auto_21738 ) ( not ( = ?auto_21738 ?auto_21746 ) ) ( not ( = ?auto_21739 ?auto_21738 ) ) ( not ( = ?auto_21740 ?auto_21738 ) ) ( HOIST-AT ?auto_21749 ?auto_21738 ) ( LIFTING ?auto_21749 ?auto_21741 ) ( not ( = ?auto_21747 ?auto_21749 ) ) ( not ( = ?auto_21737 ?auto_21749 ) ) ( not ( = ?auto_21744 ?auto_21749 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21749 ?auto_21741 ?auto_21743 ?auto_21738 )
      ( MAKE-ON ?auto_21735 ?auto_21736 )
      ( MAKE-ON-VERIFY ?auto_21735 ?auto_21736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21750 - SURFACE
      ?auto_21751 - SURFACE
    )
    :vars
    (
      ?auto_21762 - HOIST
      ?auto_21758 - PLACE
      ?auto_21759 - PLACE
      ?auto_21760 - HOIST
      ?auto_21757 - SURFACE
      ?auto_21761 - SURFACE
      ?auto_21763 - PLACE
      ?auto_21756 - HOIST
      ?auto_21755 - SURFACE
      ?auto_21754 - SURFACE
      ?auto_21752 - TRUCK
      ?auto_21764 - PLACE
      ?auto_21753 - HOIST
      ?auto_21765 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21762 ?auto_21758 ) ( IS-CRATE ?auto_21750 ) ( not ( = ?auto_21750 ?auto_21751 ) ) ( not ( = ?auto_21759 ?auto_21758 ) ) ( HOIST-AT ?auto_21760 ?auto_21759 ) ( not ( = ?auto_21762 ?auto_21760 ) ) ( AVAILABLE ?auto_21760 ) ( SURFACE-AT ?auto_21750 ?auto_21759 ) ( ON ?auto_21750 ?auto_21757 ) ( CLEAR ?auto_21750 ) ( not ( = ?auto_21750 ?auto_21757 ) ) ( not ( = ?auto_21751 ?auto_21757 ) ) ( IS-CRATE ?auto_21751 ) ( not ( = ?auto_21750 ?auto_21761 ) ) ( not ( = ?auto_21751 ?auto_21761 ) ) ( not ( = ?auto_21757 ?auto_21761 ) ) ( not ( = ?auto_21763 ?auto_21758 ) ) ( not ( = ?auto_21759 ?auto_21763 ) ) ( HOIST-AT ?auto_21756 ?auto_21763 ) ( not ( = ?auto_21762 ?auto_21756 ) ) ( not ( = ?auto_21760 ?auto_21756 ) ) ( AVAILABLE ?auto_21756 ) ( SURFACE-AT ?auto_21751 ?auto_21763 ) ( ON ?auto_21751 ?auto_21755 ) ( CLEAR ?auto_21751 ) ( not ( = ?auto_21750 ?auto_21755 ) ) ( not ( = ?auto_21751 ?auto_21755 ) ) ( not ( = ?auto_21757 ?auto_21755 ) ) ( not ( = ?auto_21761 ?auto_21755 ) ) ( SURFACE-AT ?auto_21754 ?auto_21758 ) ( CLEAR ?auto_21754 ) ( IS-CRATE ?auto_21761 ) ( not ( = ?auto_21750 ?auto_21754 ) ) ( not ( = ?auto_21751 ?auto_21754 ) ) ( not ( = ?auto_21757 ?auto_21754 ) ) ( not ( = ?auto_21761 ?auto_21754 ) ) ( not ( = ?auto_21755 ?auto_21754 ) ) ( AVAILABLE ?auto_21762 ) ( TRUCK-AT ?auto_21752 ?auto_21764 ) ( not ( = ?auto_21764 ?auto_21758 ) ) ( not ( = ?auto_21759 ?auto_21764 ) ) ( not ( = ?auto_21763 ?auto_21764 ) ) ( HOIST-AT ?auto_21753 ?auto_21764 ) ( not ( = ?auto_21762 ?auto_21753 ) ) ( not ( = ?auto_21760 ?auto_21753 ) ) ( not ( = ?auto_21756 ?auto_21753 ) ) ( AVAILABLE ?auto_21753 ) ( SURFACE-AT ?auto_21761 ?auto_21764 ) ( ON ?auto_21761 ?auto_21765 ) ( CLEAR ?auto_21761 ) ( not ( = ?auto_21750 ?auto_21765 ) ) ( not ( = ?auto_21751 ?auto_21765 ) ) ( not ( = ?auto_21757 ?auto_21765 ) ) ( not ( = ?auto_21761 ?auto_21765 ) ) ( not ( = ?auto_21755 ?auto_21765 ) ) ( not ( = ?auto_21754 ?auto_21765 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21753 ?auto_21761 ?auto_21765 ?auto_21764 )
      ( MAKE-ON ?auto_21750 ?auto_21751 )
      ( MAKE-ON-VERIFY ?auto_21750 ?auto_21751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21766 - SURFACE
      ?auto_21767 - SURFACE
    )
    :vars
    (
      ?auto_21772 - HOIST
      ?auto_21775 - PLACE
      ?auto_21774 - PLACE
      ?auto_21770 - HOIST
      ?auto_21778 - SURFACE
      ?auto_21769 - SURFACE
      ?auto_21773 - PLACE
      ?auto_21779 - HOIST
      ?auto_21781 - SURFACE
      ?auto_21768 - SURFACE
      ?auto_21776 - PLACE
      ?auto_21780 - HOIST
      ?auto_21777 - SURFACE
      ?auto_21771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21772 ?auto_21775 ) ( IS-CRATE ?auto_21766 ) ( not ( = ?auto_21766 ?auto_21767 ) ) ( not ( = ?auto_21774 ?auto_21775 ) ) ( HOIST-AT ?auto_21770 ?auto_21774 ) ( not ( = ?auto_21772 ?auto_21770 ) ) ( AVAILABLE ?auto_21770 ) ( SURFACE-AT ?auto_21766 ?auto_21774 ) ( ON ?auto_21766 ?auto_21778 ) ( CLEAR ?auto_21766 ) ( not ( = ?auto_21766 ?auto_21778 ) ) ( not ( = ?auto_21767 ?auto_21778 ) ) ( IS-CRATE ?auto_21767 ) ( not ( = ?auto_21766 ?auto_21769 ) ) ( not ( = ?auto_21767 ?auto_21769 ) ) ( not ( = ?auto_21778 ?auto_21769 ) ) ( not ( = ?auto_21773 ?auto_21775 ) ) ( not ( = ?auto_21774 ?auto_21773 ) ) ( HOIST-AT ?auto_21779 ?auto_21773 ) ( not ( = ?auto_21772 ?auto_21779 ) ) ( not ( = ?auto_21770 ?auto_21779 ) ) ( AVAILABLE ?auto_21779 ) ( SURFACE-AT ?auto_21767 ?auto_21773 ) ( ON ?auto_21767 ?auto_21781 ) ( CLEAR ?auto_21767 ) ( not ( = ?auto_21766 ?auto_21781 ) ) ( not ( = ?auto_21767 ?auto_21781 ) ) ( not ( = ?auto_21778 ?auto_21781 ) ) ( not ( = ?auto_21769 ?auto_21781 ) ) ( SURFACE-AT ?auto_21768 ?auto_21775 ) ( CLEAR ?auto_21768 ) ( IS-CRATE ?auto_21769 ) ( not ( = ?auto_21766 ?auto_21768 ) ) ( not ( = ?auto_21767 ?auto_21768 ) ) ( not ( = ?auto_21778 ?auto_21768 ) ) ( not ( = ?auto_21769 ?auto_21768 ) ) ( not ( = ?auto_21781 ?auto_21768 ) ) ( AVAILABLE ?auto_21772 ) ( not ( = ?auto_21776 ?auto_21775 ) ) ( not ( = ?auto_21774 ?auto_21776 ) ) ( not ( = ?auto_21773 ?auto_21776 ) ) ( HOIST-AT ?auto_21780 ?auto_21776 ) ( not ( = ?auto_21772 ?auto_21780 ) ) ( not ( = ?auto_21770 ?auto_21780 ) ) ( not ( = ?auto_21779 ?auto_21780 ) ) ( AVAILABLE ?auto_21780 ) ( SURFACE-AT ?auto_21769 ?auto_21776 ) ( ON ?auto_21769 ?auto_21777 ) ( CLEAR ?auto_21769 ) ( not ( = ?auto_21766 ?auto_21777 ) ) ( not ( = ?auto_21767 ?auto_21777 ) ) ( not ( = ?auto_21778 ?auto_21777 ) ) ( not ( = ?auto_21769 ?auto_21777 ) ) ( not ( = ?auto_21781 ?auto_21777 ) ) ( not ( = ?auto_21768 ?auto_21777 ) ) ( TRUCK-AT ?auto_21771 ?auto_21775 ) )
    :subtasks
    ( ( !DRIVE ?auto_21771 ?auto_21775 ?auto_21776 )
      ( MAKE-ON ?auto_21766 ?auto_21767 )
      ( MAKE-ON-VERIFY ?auto_21766 ?auto_21767 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21782 - SURFACE
      ?auto_21783 - SURFACE
    )
    :vars
    (
      ?auto_21793 - HOIST
      ?auto_21786 - PLACE
      ?auto_21787 - PLACE
      ?auto_21788 - HOIST
      ?auto_21796 - SURFACE
      ?auto_21797 - SURFACE
      ?auto_21795 - PLACE
      ?auto_21785 - HOIST
      ?auto_21790 - SURFACE
      ?auto_21791 - SURFACE
      ?auto_21784 - PLACE
      ?auto_21792 - HOIST
      ?auto_21794 - SURFACE
      ?auto_21789 - TRUCK
      ?auto_21798 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21793 ?auto_21786 ) ( IS-CRATE ?auto_21782 ) ( not ( = ?auto_21782 ?auto_21783 ) ) ( not ( = ?auto_21787 ?auto_21786 ) ) ( HOIST-AT ?auto_21788 ?auto_21787 ) ( not ( = ?auto_21793 ?auto_21788 ) ) ( AVAILABLE ?auto_21788 ) ( SURFACE-AT ?auto_21782 ?auto_21787 ) ( ON ?auto_21782 ?auto_21796 ) ( CLEAR ?auto_21782 ) ( not ( = ?auto_21782 ?auto_21796 ) ) ( not ( = ?auto_21783 ?auto_21796 ) ) ( IS-CRATE ?auto_21783 ) ( not ( = ?auto_21782 ?auto_21797 ) ) ( not ( = ?auto_21783 ?auto_21797 ) ) ( not ( = ?auto_21796 ?auto_21797 ) ) ( not ( = ?auto_21795 ?auto_21786 ) ) ( not ( = ?auto_21787 ?auto_21795 ) ) ( HOIST-AT ?auto_21785 ?auto_21795 ) ( not ( = ?auto_21793 ?auto_21785 ) ) ( not ( = ?auto_21788 ?auto_21785 ) ) ( AVAILABLE ?auto_21785 ) ( SURFACE-AT ?auto_21783 ?auto_21795 ) ( ON ?auto_21783 ?auto_21790 ) ( CLEAR ?auto_21783 ) ( not ( = ?auto_21782 ?auto_21790 ) ) ( not ( = ?auto_21783 ?auto_21790 ) ) ( not ( = ?auto_21796 ?auto_21790 ) ) ( not ( = ?auto_21797 ?auto_21790 ) ) ( IS-CRATE ?auto_21797 ) ( not ( = ?auto_21782 ?auto_21791 ) ) ( not ( = ?auto_21783 ?auto_21791 ) ) ( not ( = ?auto_21796 ?auto_21791 ) ) ( not ( = ?auto_21797 ?auto_21791 ) ) ( not ( = ?auto_21790 ?auto_21791 ) ) ( not ( = ?auto_21784 ?auto_21786 ) ) ( not ( = ?auto_21787 ?auto_21784 ) ) ( not ( = ?auto_21795 ?auto_21784 ) ) ( HOIST-AT ?auto_21792 ?auto_21784 ) ( not ( = ?auto_21793 ?auto_21792 ) ) ( not ( = ?auto_21788 ?auto_21792 ) ) ( not ( = ?auto_21785 ?auto_21792 ) ) ( AVAILABLE ?auto_21792 ) ( SURFACE-AT ?auto_21797 ?auto_21784 ) ( ON ?auto_21797 ?auto_21794 ) ( CLEAR ?auto_21797 ) ( not ( = ?auto_21782 ?auto_21794 ) ) ( not ( = ?auto_21783 ?auto_21794 ) ) ( not ( = ?auto_21796 ?auto_21794 ) ) ( not ( = ?auto_21797 ?auto_21794 ) ) ( not ( = ?auto_21790 ?auto_21794 ) ) ( not ( = ?auto_21791 ?auto_21794 ) ) ( TRUCK-AT ?auto_21789 ?auto_21786 ) ( SURFACE-AT ?auto_21798 ?auto_21786 ) ( CLEAR ?auto_21798 ) ( LIFTING ?auto_21793 ?auto_21791 ) ( IS-CRATE ?auto_21791 ) ( not ( = ?auto_21782 ?auto_21798 ) ) ( not ( = ?auto_21783 ?auto_21798 ) ) ( not ( = ?auto_21796 ?auto_21798 ) ) ( not ( = ?auto_21797 ?auto_21798 ) ) ( not ( = ?auto_21790 ?auto_21798 ) ) ( not ( = ?auto_21791 ?auto_21798 ) ) ( not ( = ?auto_21794 ?auto_21798 ) ) )
    :subtasks
    ( ( !DROP ?auto_21793 ?auto_21791 ?auto_21798 ?auto_21786 )
      ( MAKE-ON ?auto_21782 ?auto_21783 )
      ( MAKE-ON-VERIFY ?auto_21782 ?auto_21783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21799 - SURFACE
      ?auto_21800 - SURFACE
    )
    :vars
    (
      ?auto_21810 - HOIST
      ?auto_21808 - PLACE
      ?auto_21806 - PLACE
      ?auto_21811 - HOIST
      ?auto_21807 - SURFACE
      ?auto_21804 - SURFACE
      ?auto_21813 - PLACE
      ?auto_21805 - HOIST
      ?auto_21814 - SURFACE
      ?auto_21802 - SURFACE
      ?auto_21809 - PLACE
      ?auto_21801 - HOIST
      ?auto_21812 - SURFACE
      ?auto_21803 - TRUCK
      ?auto_21815 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21810 ?auto_21808 ) ( IS-CRATE ?auto_21799 ) ( not ( = ?auto_21799 ?auto_21800 ) ) ( not ( = ?auto_21806 ?auto_21808 ) ) ( HOIST-AT ?auto_21811 ?auto_21806 ) ( not ( = ?auto_21810 ?auto_21811 ) ) ( AVAILABLE ?auto_21811 ) ( SURFACE-AT ?auto_21799 ?auto_21806 ) ( ON ?auto_21799 ?auto_21807 ) ( CLEAR ?auto_21799 ) ( not ( = ?auto_21799 ?auto_21807 ) ) ( not ( = ?auto_21800 ?auto_21807 ) ) ( IS-CRATE ?auto_21800 ) ( not ( = ?auto_21799 ?auto_21804 ) ) ( not ( = ?auto_21800 ?auto_21804 ) ) ( not ( = ?auto_21807 ?auto_21804 ) ) ( not ( = ?auto_21813 ?auto_21808 ) ) ( not ( = ?auto_21806 ?auto_21813 ) ) ( HOIST-AT ?auto_21805 ?auto_21813 ) ( not ( = ?auto_21810 ?auto_21805 ) ) ( not ( = ?auto_21811 ?auto_21805 ) ) ( AVAILABLE ?auto_21805 ) ( SURFACE-AT ?auto_21800 ?auto_21813 ) ( ON ?auto_21800 ?auto_21814 ) ( CLEAR ?auto_21800 ) ( not ( = ?auto_21799 ?auto_21814 ) ) ( not ( = ?auto_21800 ?auto_21814 ) ) ( not ( = ?auto_21807 ?auto_21814 ) ) ( not ( = ?auto_21804 ?auto_21814 ) ) ( IS-CRATE ?auto_21804 ) ( not ( = ?auto_21799 ?auto_21802 ) ) ( not ( = ?auto_21800 ?auto_21802 ) ) ( not ( = ?auto_21807 ?auto_21802 ) ) ( not ( = ?auto_21804 ?auto_21802 ) ) ( not ( = ?auto_21814 ?auto_21802 ) ) ( not ( = ?auto_21809 ?auto_21808 ) ) ( not ( = ?auto_21806 ?auto_21809 ) ) ( not ( = ?auto_21813 ?auto_21809 ) ) ( HOIST-AT ?auto_21801 ?auto_21809 ) ( not ( = ?auto_21810 ?auto_21801 ) ) ( not ( = ?auto_21811 ?auto_21801 ) ) ( not ( = ?auto_21805 ?auto_21801 ) ) ( AVAILABLE ?auto_21801 ) ( SURFACE-AT ?auto_21804 ?auto_21809 ) ( ON ?auto_21804 ?auto_21812 ) ( CLEAR ?auto_21804 ) ( not ( = ?auto_21799 ?auto_21812 ) ) ( not ( = ?auto_21800 ?auto_21812 ) ) ( not ( = ?auto_21807 ?auto_21812 ) ) ( not ( = ?auto_21804 ?auto_21812 ) ) ( not ( = ?auto_21814 ?auto_21812 ) ) ( not ( = ?auto_21802 ?auto_21812 ) ) ( TRUCK-AT ?auto_21803 ?auto_21808 ) ( SURFACE-AT ?auto_21815 ?auto_21808 ) ( CLEAR ?auto_21815 ) ( IS-CRATE ?auto_21802 ) ( not ( = ?auto_21799 ?auto_21815 ) ) ( not ( = ?auto_21800 ?auto_21815 ) ) ( not ( = ?auto_21807 ?auto_21815 ) ) ( not ( = ?auto_21804 ?auto_21815 ) ) ( not ( = ?auto_21814 ?auto_21815 ) ) ( not ( = ?auto_21802 ?auto_21815 ) ) ( not ( = ?auto_21812 ?auto_21815 ) ) ( AVAILABLE ?auto_21810 ) ( IN ?auto_21802 ?auto_21803 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21810 ?auto_21802 ?auto_21803 ?auto_21808 )
      ( MAKE-ON ?auto_21799 ?auto_21800 )
      ( MAKE-ON-VERIFY ?auto_21799 ?auto_21800 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21816 - SURFACE
      ?auto_21817 - SURFACE
    )
    :vars
    (
      ?auto_21823 - HOIST
      ?auto_21830 - PLACE
      ?auto_21829 - PLACE
      ?auto_21828 - HOIST
      ?auto_21819 - SURFACE
      ?auto_21827 - SURFACE
      ?auto_21824 - PLACE
      ?auto_21831 - HOIST
      ?auto_21822 - SURFACE
      ?auto_21825 - SURFACE
      ?auto_21820 - PLACE
      ?auto_21821 - HOIST
      ?auto_21832 - SURFACE
      ?auto_21818 - SURFACE
      ?auto_21826 - TRUCK
      ?auto_21833 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21823 ?auto_21830 ) ( IS-CRATE ?auto_21816 ) ( not ( = ?auto_21816 ?auto_21817 ) ) ( not ( = ?auto_21829 ?auto_21830 ) ) ( HOIST-AT ?auto_21828 ?auto_21829 ) ( not ( = ?auto_21823 ?auto_21828 ) ) ( AVAILABLE ?auto_21828 ) ( SURFACE-AT ?auto_21816 ?auto_21829 ) ( ON ?auto_21816 ?auto_21819 ) ( CLEAR ?auto_21816 ) ( not ( = ?auto_21816 ?auto_21819 ) ) ( not ( = ?auto_21817 ?auto_21819 ) ) ( IS-CRATE ?auto_21817 ) ( not ( = ?auto_21816 ?auto_21827 ) ) ( not ( = ?auto_21817 ?auto_21827 ) ) ( not ( = ?auto_21819 ?auto_21827 ) ) ( not ( = ?auto_21824 ?auto_21830 ) ) ( not ( = ?auto_21829 ?auto_21824 ) ) ( HOIST-AT ?auto_21831 ?auto_21824 ) ( not ( = ?auto_21823 ?auto_21831 ) ) ( not ( = ?auto_21828 ?auto_21831 ) ) ( AVAILABLE ?auto_21831 ) ( SURFACE-AT ?auto_21817 ?auto_21824 ) ( ON ?auto_21817 ?auto_21822 ) ( CLEAR ?auto_21817 ) ( not ( = ?auto_21816 ?auto_21822 ) ) ( not ( = ?auto_21817 ?auto_21822 ) ) ( not ( = ?auto_21819 ?auto_21822 ) ) ( not ( = ?auto_21827 ?auto_21822 ) ) ( IS-CRATE ?auto_21827 ) ( not ( = ?auto_21816 ?auto_21825 ) ) ( not ( = ?auto_21817 ?auto_21825 ) ) ( not ( = ?auto_21819 ?auto_21825 ) ) ( not ( = ?auto_21827 ?auto_21825 ) ) ( not ( = ?auto_21822 ?auto_21825 ) ) ( not ( = ?auto_21820 ?auto_21830 ) ) ( not ( = ?auto_21829 ?auto_21820 ) ) ( not ( = ?auto_21824 ?auto_21820 ) ) ( HOIST-AT ?auto_21821 ?auto_21820 ) ( not ( = ?auto_21823 ?auto_21821 ) ) ( not ( = ?auto_21828 ?auto_21821 ) ) ( not ( = ?auto_21831 ?auto_21821 ) ) ( AVAILABLE ?auto_21821 ) ( SURFACE-AT ?auto_21827 ?auto_21820 ) ( ON ?auto_21827 ?auto_21832 ) ( CLEAR ?auto_21827 ) ( not ( = ?auto_21816 ?auto_21832 ) ) ( not ( = ?auto_21817 ?auto_21832 ) ) ( not ( = ?auto_21819 ?auto_21832 ) ) ( not ( = ?auto_21827 ?auto_21832 ) ) ( not ( = ?auto_21822 ?auto_21832 ) ) ( not ( = ?auto_21825 ?auto_21832 ) ) ( SURFACE-AT ?auto_21818 ?auto_21830 ) ( CLEAR ?auto_21818 ) ( IS-CRATE ?auto_21825 ) ( not ( = ?auto_21816 ?auto_21818 ) ) ( not ( = ?auto_21817 ?auto_21818 ) ) ( not ( = ?auto_21819 ?auto_21818 ) ) ( not ( = ?auto_21827 ?auto_21818 ) ) ( not ( = ?auto_21822 ?auto_21818 ) ) ( not ( = ?auto_21825 ?auto_21818 ) ) ( not ( = ?auto_21832 ?auto_21818 ) ) ( AVAILABLE ?auto_21823 ) ( IN ?auto_21825 ?auto_21826 ) ( TRUCK-AT ?auto_21826 ?auto_21833 ) ( not ( = ?auto_21833 ?auto_21830 ) ) ( not ( = ?auto_21829 ?auto_21833 ) ) ( not ( = ?auto_21824 ?auto_21833 ) ) ( not ( = ?auto_21820 ?auto_21833 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21826 ?auto_21833 ?auto_21830 )
      ( MAKE-ON ?auto_21816 ?auto_21817 )
      ( MAKE-ON-VERIFY ?auto_21816 ?auto_21817 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21834 - SURFACE
      ?auto_21835 - SURFACE
    )
    :vars
    (
      ?auto_21842 - HOIST
      ?auto_21848 - PLACE
      ?auto_21850 - PLACE
      ?auto_21845 - HOIST
      ?auto_21843 - SURFACE
      ?auto_21849 - SURFACE
      ?auto_21847 - PLACE
      ?auto_21840 - HOIST
      ?auto_21851 - SURFACE
      ?auto_21841 - SURFACE
      ?auto_21844 - PLACE
      ?auto_21846 - HOIST
      ?auto_21839 - SURFACE
      ?auto_21837 - SURFACE
      ?auto_21836 - TRUCK
      ?auto_21838 - PLACE
      ?auto_21852 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21842 ?auto_21848 ) ( IS-CRATE ?auto_21834 ) ( not ( = ?auto_21834 ?auto_21835 ) ) ( not ( = ?auto_21850 ?auto_21848 ) ) ( HOIST-AT ?auto_21845 ?auto_21850 ) ( not ( = ?auto_21842 ?auto_21845 ) ) ( AVAILABLE ?auto_21845 ) ( SURFACE-AT ?auto_21834 ?auto_21850 ) ( ON ?auto_21834 ?auto_21843 ) ( CLEAR ?auto_21834 ) ( not ( = ?auto_21834 ?auto_21843 ) ) ( not ( = ?auto_21835 ?auto_21843 ) ) ( IS-CRATE ?auto_21835 ) ( not ( = ?auto_21834 ?auto_21849 ) ) ( not ( = ?auto_21835 ?auto_21849 ) ) ( not ( = ?auto_21843 ?auto_21849 ) ) ( not ( = ?auto_21847 ?auto_21848 ) ) ( not ( = ?auto_21850 ?auto_21847 ) ) ( HOIST-AT ?auto_21840 ?auto_21847 ) ( not ( = ?auto_21842 ?auto_21840 ) ) ( not ( = ?auto_21845 ?auto_21840 ) ) ( AVAILABLE ?auto_21840 ) ( SURFACE-AT ?auto_21835 ?auto_21847 ) ( ON ?auto_21835 ?auto_21851 ) ( CLEAR ?auto_21835 ) ( not ( = ?auto_21834 ?auto_21851 ) ) ( not ( = ?auto_21835 ?auto_21851 ) ) ( not ( = ?auto_21843 ?auto_21851 ) ) ( not ( = ?auto_21849 ?auto_21851 ) ) ( IS-CRATE ?auto_21849 ) ( not ( = ?auto_21834 ?auto_21841 ) ) ( not ( = ?auto_21835 ?auto_21841 ) ) ( not ( = ?auto_21843 ?auto_21841 ) ) ( not ( = ?auto_21849 ?auto_21841 ) ) ( not ( = ?auto_21851 ?auto_21841 ) ) ( not ( = ?auto_21844 ?auto_21848 ) ) ( not ( = ?auto_21850 ?auto_21844 ) ) ( not ( = ?auto_21847 ?auto_21844 ) ) ( HOIST-AT ?auto_21846 ?auto_21844 ) ( not ( = ?auto_21842 ?auto_21846 ) ) ( not ( = ?auto_21845 ?auto_21846 ) ) ( not ( = ?auto_21840 ?auto_21846 ) ) ( AVAILABLE ?auto_21846 ) ( SURFACE-AT ?auto_21849 ?auto_21844 ) ( ON ?auto_21849 ?auto_21839 ) ( CLEAR ?auto_21849 ) ( not ( = ?auto_21834 ?auto_21839 ) ) ( not ( = ?auto_21835 ?auto_21839 ) ) ( not ( = ?auto_21843 ?auto_21839 ) ) ( not ( = ?auto_21849 ?auto_21839 ) ) ( not ( = ?auto_21851 ?auto_21839 ) ) ( not ( = ?auto_21841 ?auto_21839 ) ) ( SURFACE-AT ?auto_21837 ?auto_21848 ) ( CLEAR ?auto_21837 ) ( IS-CRATE ?auto_21841 ) ( not ( = ?auto_21834 ?auto_21837 ) ) ( not ( = ?auto_21835 ?auto_21837 ) ) ( not ( = ?auto_21843 ?auto_21837 ) ) ( not ( = ?auto_21849 ?auto_21837 ) ) ( not ( = ?auto_21851 ?auto_21837 ) ) ( not ( = ?auto_21841 ?auto_21837 ) ) ( not ( = ?auto_21839 ?auto_21837 ) ) ( AVAILABLE ?auto_21842 ) ( TRUCK-AT ?auto_21836 ?auto_21838 ) ( not ( = ?auto_21838 ?auto_21848 ) ) ( not ( = ?auto_21850 ?auto_21838 ) ) ( not ( = ?auto_21847 ?auto_21838 ) ) ( not ( = ?auto_21844 ?auto_21838 ) ) ( HOIST-AT ?auto_21852 ?auto_21838 ) ( LIFTING ?auto_21852 ?auto_21841 ) ( not ( = ?auto_21842 ?auto_21852 ) ) ( not ( = ?auto_21845 ?auto_21852 ) ) ( not ( = ?auto_21840 ?auto_21852 ) ) ( not ( = ?auto_21846 ?auto_21852 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21852 ?auto_21841 ?auto_21836 ?auto_21838 )
      ( MAKE-ON ?auto_21834 ?auto_21835 )
      ( MAKE-ON-VERIFY ?auto_21834 ?auto_21835 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21853 - SURFACE
      ?auto_21854 - SURFACE
    )
    :vars
    (
      ?auto_21868 - HOIST
      ?auto_21863 - PLACE
      ?auto_21871 - PLACE
      ?auto_21861 - HOIST
      ?auto_21864 - SURFACE
      ?auto_21857 - SURFACE
      ?auto_21860 - PLACE
      ?auto_21858 - HOIST
      ?auto_21855 - SURFACE
      ?auto_21867 - SURFACE
      ?auto_21856 - PLACE
      ?auto_21859 - HOIST
      ?auto_21862 - SURFACE
      ?auto_21866 - SURFACE
      ?auto_21870 - TRUCK
      ?auto_21865 - PLACE
      ?auto_21869 - HOIST
      ?auto_21872 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21868 ?auto_21863 ) ( IS-CRATE ?auto_21853 ) ( not ( = ?auto_21853 ?auto_21854 ) ) ( not ( = ?auto_21871 ?auto_21863 ) ) ( HOIST-AT ?auto_21861 ?auto_21871 ) ( not ( = ?auto_21868 ?auto_21861 ) ) ( AVAILABLE ?auto_21861 ) ( SURFACE-AT ?auto_21853 ?auto_21871 ) ( ON ?auto_21853 ?auto_21864 ) ( CLEAR ?auto_21853 ) ( not ( = ?auto_21853 ?auto_21864 ) ) ( not ( = ?auto_21854 ?auto_21864 ) ) ( IS-CRATE ?auto_21854 ) ( not ( = ?auto_21853 ?auto_21857 ) ) ( not ( = ?auto_21854 ?auto_21857 ) ) ( not ( = ?auto_21864 ?auto_21857 ) ) ( not ( = ?auto_21860 ?auto_21863 ) ) ( not ( = ?auto_21871 ?auto_21860 ) ) ( HOIST-AT ?auto_21858 ?auto_21860 ) ( not ( = ?auto_21868 ?auto_21858 ) ) ( not ( = ?auto_21861 ?auto_21858 ) ) ( AVAILABLE ?auto_21858 ) ( SURFACE-AT ?auto_21854 ?auto_21860 ) ( ON ?auto_21854 ?auto_21855 ) ( CLEAR ?auto_21854 ) ( not ( = ?auto_21853 ?auto_21855 ) ) ( not ( = ?auto_21854 ?auto_21855 ) ) ( not ( = ?auto_21864 ?auto_21855 ) ) ( not ( = ?auto_21857 ?auto_21855 ) ) ( IS-CRATE ?auto_21857 ) ( not ( = ?auto_21853 ?auto_21867 ) ) ( not ( = ?auto_21854 ?auto_21867 ) ) ( not ( = ?auto_21864 ?auto_21867 ) ) ( not ( = ?auto_21857 ?auto_21867 ) ) ( not ( = ?auto_21855 ?auto_21867 ) ) ( not ( = ?auto_21856 ?auto_21863 ) ) ( not ( = ?auto_21871 ?auto_21856 ) ) ( not ( = ?auto_21860 ?auto_21856 ) ) ( HOIST-AT ?auto_21859 ?auto_21856 ) ( not ( = ?auto_21868 ?auto_21859 ) ) ( not ( = ?auto_21861 ?auto_21859 ) ) ( not ( = ?auto_21858 ?auto_21859 ) ) ( AVAILABLE ?auto_21859 ) ( SURFACE-AT ?auto_21857 ?auto_21856 ) ( ON ?auto_21857 ?auto_21862 ) ( CLEAR ?auto_21857 ) ( not ( = ?auto_21853 ?auto_21862 ) ) ( not ( = ?auto_21854 ?auto_21862 ) ) ( not ( = ?auto_21864 ?auto_21862 ) ) ( not ( = ?auto_21857 ?auto_21862 ) ) ( not ( = ?auto_21855 ?auto_21862 ) ) ( not ( = ?auto_21867 ?auto_21862 ) ) ( SURFACE-AT ?auto_21866 ?auto_21863 ) ( CLEAR ?auto_21866 ) ( IS-CRATE ?auto_21867 ) ( not ( = ?auto_21853 ?auto_21866 ) ) ( not ( = ?auto_21854 ?auto_21866 ) ) ( not ( = ?auto_21864 ?auto_21866 ) ) ( not ( = ?auto_21857 ?auto_21866 ) ) ( not ( = ?auto_21855 ?auto_21866 ) ) ( not ( = ?auto_21867 ?auto_21866 ) ) ( not ( = ?auto_21862 ?auto_21866 ) ) ( AVAILABLE ?auto_21868 ) ( TRUCK-AT ?auto_21870 ?auto_21865 ) ( not ( = ?auto_21865 ?auto_21863 ) ) ( not ( = ?auto_21871 ?auto_21865 ) ) ( not ( = ?auto_21860 ?auto_21865 ) ) ( not ( = ?auto_21856 ?auto_21865 ) ) ( HOIST-AT ?auto_21869 ?auto_21865 ) ( not ( = ?auto_21868 ?auto_21869 ) ) ( not ( = ?auto_21861 ?auto_21869 ) ) ( not ( = ?auto_21858 ?auto_21869 ) ) ( not ( = ?auto_21859 ?auto_21869 ) ) ( AVAILABLE ?auto_21869 ) ( SURFACE-AT ?auto_21867 ?auto_21865 ) ( ON ?auto_21867 ?auto_21872 ) ( CLEAR ?auto_21867 ) ( not ( = ?auto_21853 ?auto_21872 ) ) ( not ( = ?auto_21854 ?auto_21872 ) ) ( not ( = ?auto_21864 ?auto_21872 ) ) ( not ( = ?auto_21857 ?auto_21872 ) ) ( not ( = ?auto_21855 ?auto_21872 ) ) ( not ( = ?auto_21867 ?auto_21872 ) ) ( not ( = ?auto_21862 ?auto_21872 ) ) ( not ( = ?auto_21866 ?auto_21872 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21869 ?auto_21867 ?auto_21872 ?auto_21865 )
      ( MAKE-ON ?auto_21853 ?auto_21854 )
      ( MAKE-ON-VERIFY ?auto_21853 ?auto_21854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21873 - SURFACE
      ?auto_21874 - SURFACE
    )
    :vars
    (
      ?auto_21885 - HOIST
      ?auto_21887 - PLACE
      ?auto_21884 - PLACE
      ?auto_21878 - HOIST
      ?auto_21880 - SURFACE
      ?auto_21892 - SURFACE
      ?auto_21890 - PLACE
      ?auto_21882 - HOIST
      ?auto_21889 - SURFACE
      ?auto_21886 - SURFACE
      ?auto_21875 - PLACE
      ?auto_21881 - HOIST
      ?auto_21891 - SURFACE
      ?auto_21888 - SURFACE
      ?auto_21879 - PLACE
      ?auto_21877 - HOIST
      ?auto_21876 - SURFACE
      ?auto_21883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21885 ?auto_21887 ) ( IS-CRATE ?auto_21873 ) ( not ( = ?auto_21873 ?auto_21874 ) ) ( not ( = ?auto_21884 ?auto_21887 ) ) ( HOIST-AT ?auto_21878 ?auto_21884 ) ( not ( = ?auto_21885 ?auto_21878 ) ) ( AVAILABLE ?auto_21878 ) ( SURFACE-AT ?auto_21873 ?auto_21884 ) ( ON ?auto_21873 ?auto_21880 ) ( CLEAR ?auto_21873 ) ( not ( = ?auto_21873 ?auto_21880 ) ) ( not ( = ?auto_21874 ?auto_21880 ) ) ( IS-CRATE ?auto_21874 ) ( not ( = ?auto_21873 ?auto_21892 ) ) ( not ( = ?auto_21874 ?auto_21892 ) ) ( not ( = ?auto_21880 ?auto_21892 ) ) ( not ( = ?auto_21890 ?auto_21887 ) ) ( not ( = ?auto_21884 ?auto_21890 ) ) ( HOIST-AT ?auto_21882 ?auto_21890 ) ( not ( = ?auto_21885 ?auto_21882 ) ) ( not ( = ?auto_21878 ?auto_21882 ) ) ( AVAILABLE ?auto_21882 ) ( SURFACE-AT ?auto_21874 ?auto_21890 ) ( ON ?auto_21874 ?auto_21889 ) ( CLEAR ?auto_21874 ) ( not ( = ?auto_21873 ?auto_21889 ) ) ( not ( = ?auto_21874 ?auto_21889 ) ) ( not ( = ?auto_21880 ?auto_21889 ) ) ( not ( = ?auto_21892 ?auto_21889 ) ) ( IS-CRATE ?auto_21892 ) ( not ( = ?auto_21873 ?auto_21886 ) ) ( not ( = ?auto_21874 ?auto_21886 ) ) ( not ( = ?auto_21880 ?auto_21886 ) ) ( not ( = ?auto_21892 ?auto_21886 ) ) ( not ( = ?auto_21889 ?auto_21886 ) ) ( not ( = ?auto_21875 ?auto_21887 ) ) ( not ( = ?auto_21884 ?auto_21875 ) ) ( not ( = ?auto_21890 ?auto_21875 ) ) ( HOIST-AT ?auto_21881 ?auto_21875 ) ( not ( = ?auto_21885 ?auto_21881 ) ) ( not ( = ?auto_21878 ?auto_21881 ) ) ( not ( = ?auto_21882 ?auto_21881 ) ) ( AVAILABLE ?auto_21881 ) ( SURFACE-AT ?auto_21892 ?auto_21875 ) ( ON ?auto_21892 ?auto_21891 ) ( CLEAR ?auto_21892 ) ( not ( = ?auto_21873 ?auto_21891 ) ) ( not ( = ?auto_21874 ?auto_21891 ) ) ( not ( = ?auto_21880 ?auto_21891 ) ) ( not ( = ?auto_21892 ?auto_21891 ) ) ( not ( = ?auto_21889 ?auto_21891 ) ) ( not ( = ?auto_21886 ?auto_21891 ) ) ( SURFACE-AT ?auto_21888 ?auto_21887 ) ( CLEAR ?auto_21888 ) ( IS-CRATE ?auto_21886 ) ( not ( = ?auto_21873 ?auto_21888 ) ) ( not ( = ?auto_21874 ?auto_21888 ) ) ( not ( = ?auto_21880 ?auto_21888 ) ) ( not ( = ?auto_21892 ?auto_21888 ) ) ( not ( = ?auto_21889 ?auto_21888 ) ) ( not ( = ?auto_21886 ?auto_21888 ) ) ( not ( = ?auto_21891 ?auto_21888 ) ) ( AVAILABLE ?auto_21885 ) ( not ( = ?auto_21879 ?auto_21887 ) ) ( not ( = ?auto_21884 ?auto_21879 ) ) ( not ( = ?auto_21890 ?auto_21879 ) ) ( not ( = ?auto_21875 ?auto_21879 ) ) ( HOIST-AT ?auto_21877 ?auto_21879 ) ( not ( = ?auto_21885 ?auto_21877 ) ) ( not ( = ?auto_21878 ?auto_21877 ) ) ( not ( = ?auto_21882 ?auto_21877 ) ) ( not ( = ?auto_21881 ?auto_21877 ) ) ( AVAILABLE ?auto_21877 ) ( SURFACE-AT ?auto_21886 ?auto_21879 ) ( ON ?auto_21886 ?auto_21876 ) ( CLEAR ?auto_21886 ) ( not ( = ?auto_21873 ?auto_21876 ) ) ( not ( = ?auto_21874 ?auto_21876 ) ) ( not ( = ?auto_21880 ?auto_21876 ) ) ( not ( = ?auto_21892 ?auto_21876 ) ) ( not ( = ?auto_21889 ?auto_21876 ) ) ( not ( = ?auto_21886 ?auto_21876 ) ) ( not ( = ?auto_21891 ?auto_21876 ) ) ( not ( = ?auto_21888 ?auto_21876 ) ) ( TRUCK-AT ?auto_21883 ?auto_21887 ) )
    :subtasks
    ( ( !DRIVE ?auto_21883 ?auto_21887 ?auto_21879 )
      ( MAKE-ON ?auto_21873 ?auto_21874 )
      ( MAKE-ON-VERIFY ?auto_21873 ?auto_21874 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21893 - SURFACE
      ?auto_21894 - SURFACE
    )
    :vars
    (
      ?auto_21906 - HOIST
      ?auto_21907 - PLACE
      ?auto_21905 - PLACE
      ?auto_21897 - HOIST
      ?auto_21909 - SURFACE
      ?auto_21904 - SURFACE
      ?auto_21900 - PLACE
      ?auto_21898 - HOIST
      ?auto_21895 - SURFACE
      ?auto_21903 - SURFACE
      ?auto_21910 - PLACE
      ?auto_21912 - HOIST
      ?auto_21899 - SURFACE
      ?auto_21901 - SURFACE
      ?auto_21908 - PLACE
      ?auto_21902 - HOIST
      ?auto_21911 - SURFACE
      ?auto_21896 - TRUCK
      ?auto_21913 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21906 ?auto_21907 ) ( IS-CRATE ?auto_21893 ) ( not ( = ?auto_21893 ?auto_21894 ) ) ( not ( = ?auto_21905 ?auto_21907 ) ) ( HOIST-AT ?auto_21897 ?auto_21905 ) ( not ( = ?auto_21906 ?auto_21897 ) ) ( AVAILABLE ?auto_21897 ) ( SURFACE-AT ?auto_21893 ?auto_21905 ) ( ON ?auto_21893 ?auto_21909 ) ( CLEAR ?auto_21893 ) ( not ( = ?auto_21893 ?auto_21909 ) ) ( not ( = ?auto_21894 ?auto_21909 ) ) ( IS-CRATE ?auto_21894 ) ( not ( = ?auto_21893 ?auto_21904 ) ) ( not ( = ?auto_21894 ?auto_21904 ) ) ( not ( = ?auto_21909 ?auto_21904 ) ) ( not ( = ?auto_21900 ?auto_21907 ) ) ( not ( = ?auto_21905 ?auto_21900 ) ) ( HOIST-AT ?auto_21898 ?auto_21900 ) ( not ( = ?auto_21906 ?auto_21898 ) ) ( not ( = ?auto_21897 ?auto_21898 ) ) ( AVAILABLE ?auto_21898 ) ( SURFACE-AT ?auto_21894 ?auto_21900 ) ( ON ?auto_21894 ?auto_21895 ) ( CLEAR ?auto_21894 ) ( not ( = ?auto_21893 ?auto_21895 ) ) ( not ( = ?auto_21894 ?auto_21895 ) ) ( not ( = ?auto_21909 ?auto_21895 ) ) ( not ( = ?auto_21904 ?auto_21895 ) ) ( IS-CRATE ?auto_21904 ) ( not ( = ?auto_21893 ?auto_21903 ) ) ( not ( = ?auto_21894 ?auto_21903 ) ) ( not ( = ?auto_21909 ?auto_21903 ) ) ( not ( = ?auto_21904 ?auto_21903 ) ) ( not ( = ?auto_21895 ?auto_21903 ) ) ( not ( = ?auto_21910 ?auto_21907 ) ) ( not ( = ?auto_21905 ?auto_21910 ) ) ( not ( = ?auto_21900 ?auto_21910 ) ) ( HOIST-AT ?auto_21912 ?auto_21910 ) ( not ( = ?auto_21906 ?auto_21912 ) ) ( not ( = ?auto_21897 ?auto_21912 ) ) ( not ( = ?auto_21898 ?auto_21912 ) ) ( AVAILABLE ?auto_21912 ) ( SURFACE-AT ?auto_21904 ?auto_21910 ) ( ON ?auto_21904 ?auto_21899 ) ( CLEAR ?auto_21904 ) ( not ( = ?auto_21893 ?auto_21899 ) ) ( not ( = ?auto_21894 ?auto_21899 ) ) ( not ( = ?auto_21909 ?auto_21899 ) ) ( not ( = ?auto_21904 ?auto_21899 ) ) ( not ( = ?auto_21895 ?auto_21899 ) ) ( not ( = ?auto_21903 ?auto_21899 ) ) ( IS-CRATE ?auto_21903 ) ( not ( = ?auto_21893 ?auto_21901 ) ) ( not ( = ?auto_21894 ?auto_21901 ) ) ( not ( = ?auto_21909 ?auto_21901 ) ) ( not ( = ?auto_21904 ?auto_21901 ) ) ( not ( = ?auto_21895 ?auto_21901 ) ) ( not ( = ?auto_21903 ?auto_21901 ) ) ( not ( = ?auto_21899 ?auto_21901 ) ) ( not ( = ?auto_21908 ?auto_21907 ) ) ( not ( = ?auto_21905 ?auto_21908 ) ) ( not ( = ?auto_21900 ?auto_21908 ) ) ( not ( = ?auto_21910 ?auto_21908 ) ) ( HOIST-AT ?auto_21902 ?auto_21908 ) ( not ( = ?auto_21906 ?auto_21902 ) ) ( not ( = ?auto_21897 ?auto_21902 ) ) ( not ( = ?auto_21898 ?auto_21902 ) ) ( not ( = ?auto_21912 ?auto_21902 ) ) ( AVAILABLE ?auto_21902 ) ( SURFACE-AT ?auto_21903 ?auto_21908 ) ( ON ?auto_21903 ?auto_21911 ) ( CLEAR ?auto_21903 ) ( not ( = ?auto_21893 ?auto_21911 ) ) ( not ( = ?auto_21894 ?auto_21911 ) ) ( not ( = ?auto_21909 ?auto_21911 ) ) ( not ( = ?auto_21904 ?auto_21911 ) ) ( not ( = ?auto_21895 ?auto_21911 ) ) ( not ( = ?auto_21903 ?auto_21911 ) ) ( not ( = ?auto_21899 ?auto_21911 ) ) ( not ( = ?auto_21901 ?auto_21911 ) ) ( TRUCK-AT ?auto_21896 ?auto_21907 ) ( SURFACE-AT ?auto_21913 ?auto_21907 ) ( CLEAR ?auto_21913 ) ( LIFTING ?auto_21906 ?auto_21901 ) ( IS-CRATE ?auto_21901 ) ( not ( = ?auto_21893 ?auto_21913 ) ) ( not ( = ?auto_21894 ?auto_21913 ) ) ( not ( = ?auto_21909 ?auto_21913 ) ) ( not ( = ?auto_21904 ?auto_21913 ) ) ( not ( = ?auto_21895 ?auto_21913 ) ) ( not ( = ?auto_21903 ?auto_21913 ) ) ( not ( = ?auto_21899 ?auto_21913 ) ) ( not ( = ?auto_21901 ?auto_21913 ) ) ( not ( = ?auto_21911 ?auto_21913 ) ) )
    :subtasks
    ( ( !DROP ?auto_21906 ?auto_21901 ?auto_21913 ?auto_21907 )
      ( MAKE-ON ?auto_21893 ?auto_21894 )
      ( MAKE-ON-VERIFY ?auto_21893 ?auto_21894 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21914 - SURFACE
      ?auto_21915 - SURFACE
    )
    :vars
    (
      ?auto_21931 - HOIST
      ?auto_21932 - PLACE
      ?auto_21928 - PLACE
      ?auto_21924 - HOIST
      ?auto_21933 - SURFACE
      ?auto_21934 - SURFACE
      ?auto_21927 - PLACE
      ?auto_21925 - HOIST
      ?auto_21920 - SURFACE
      ?auto_21922 - SURFACE
      ?auto_21918 - PLACE
      ?auto_21919 - HOIST
      ?auto_21926 - SURFACE
      ?auto_21917 - SURFACE
      ?auto_21929 - PLACE
      ?auto_21930 - HOIST
      ?auto_21923 - SURFACE
      ?auto_21916 - TRUCK
      ?auto_21921 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21931 ?auto_21932 ) ( IS-CRATE ?auto_21914 ) ( not ( = ?auto_21914 ?auto_21915 ) ) ( not ( = ?auto_21928 ?auto_21932 ) ) ( HOIST-AT ?auto_21924 ?auto_21928 ) ( not ( = ?auto_21931 ?auto_21924 ) ) ( AVAILABLE ?auto_21924 ) ( SURFACE-AT ?auto_21914 ?auto_21928 ) ( ON ?auto_21914 ?auto_21933 ) ( CLEAR ?auto_21914 ) ( not ( = ?auto_21914 ?auto_21933 ) ) ( not ( = ?auto_21915 ?auto_21933 ) ) ( IS-CRATE ?auto_21915 ) ( not ( = ?auto_21914 ?auto_21934 ) ) ( not ( = ?auto_21915 ?auto_21934 ) ) ( not ( = ?auto_21933 ?auto_21934 ) ) ( not ( = ?auto_21927 ?auto_21932 ) ) ( not ( = ?auto_21928 ?auto_21927 ) ) ( HOIST-AT ?auto_21925 ?auto_21927 ) ( not ( = ?auto_21931 ?auto_21925 ) ) ( not ( = ?auto_21924 ?auto_21925 ) ) ( AVAILABLE ?auto_21925 ) ( SURFACE-AT ?auto_21915 ?auto_21927 ) ( ON ?auto_21915 ?auto_21920 ) ( CLEAR ?auto_21915 ) ( not ( = ?auto_21914 ?auto_21920 ) ) ( not ( = ?auto_21915 ?auto_21920 ) ) ( not ( = ?auto_21933 ?auto_21920 ) ) ( not ( = ?auto_21934 ?auto_21920 ) ) ( IS-CRATE ?auto_21934 ) ( not ( = ?auto_21914 ?auto_21922 ) ) ( not ( = ?auto_21915 ?auto_21922 ) ) ( not ( = ?auto_21933 ?auto_21922 ) ) ( not ( = ?auto_21934 ?auto_21922 ) ) ( not ( = ?auto_21920 ?auto_21922 ) ) ( not ( = ?auto_21918 ?auto_21932 ) ) ( not ( = ?auto_21928 ?auto_21918 ) ) ( not ( = ?auto_21927 ?auto_21918 ) ) ( HOIST-AT ?auto_21919 ?auto_21918 ) ( not ( = ?auto_21931 ?auto_21919 ) ) ( not ( = ?auto_21924 ?auto_21919 ) ) ( not ( = ?auto_21925 ?auto_21919 ) ) ( AVAILABLE ?auto_21919 ) ( SURFACE-AT ?auto_21934 ?auto_21918 ) ( ON ?auto_21934 ?auto_21926 ) ( CLEAR ?auto_21934 ) ( not ( = ?auto_21914 ?auto_21926 ) ) ( not ( = ?auto_21915 ?auto_21926 ) ) ( not ( = ?auto_21933 ?auto_21926 ) ) ( not ( = ?auto_21934 ?auto_21926 ) ) ( not ( = ?auto_21920 ?auto_21926 ) ) ( not ( = ?auto_21922 ?auto_21926 ) ) ( IS-CRATE ?auto_21922 ) ( not ( = ?auto_21914 ?auto_21917 ) ) ( not ( = ?auto_21915 ?auto_21917 ) ) ( not ( = ?auto_21933 ?auto_21917 ) ) ( not ( = ?auto_21934 ?auto_21917 ) ) ( not ( = ?auto_21920 ?auto_21917 ) ) ( not ( = ?auto_21922 ?auto_21917 ) ) ( not ( = ?auto_21926 ?auto_21917 ) ) ( not ( = ?auto_21929 ?auto_21932 ) ) ( not ( = ?auto_21928 ?auto_21929 ) ) ( not ( = ?auto_21927 ?auto_21929 ) ) ( not ( = ?auto_21918 ?auto_21929 ) ) ( HOIST-AT ?auto_21930 ?auto_21929 ) ( not ( = ?auto_21931 ?auto_21930 ) ) ( not ( = ?auto_21924 ?auto_21930 ) ) ( not ( = ?auto_21925 ?auto_21930 ) ) ( not ( = ?auto_21919 ?auto_21930 ) ) ( AVAILABLE ?auto_21930 ) ( SURFACE-AT ?auto_21922 ?auto_21929 ) ( ON ?auto_21922 ?auto_21923 ) ( CLEAR ?auto_21922 ) ( not ( = ?auto_21914 ?auto_21923 ) ) ( not ( = ?auto_21915 ?auto_21923 ) ) ( not ( = ?auto_21933 ?auto_21923 ) ) ( not ( = ?auto_21934 ?auto_21923 ) ) ( not ( = ?auto_21920 ?auto_21923 ) ) ( not ( = ?auto_21922 ?auto_21923 ) ) ( not ( = ?auto_21926 ?auto_21923 ) ) ( not ( = ?auto_21917 ?auto_21923 ) ) ( TRUCK-AT ?auto_21916 ?auto_21932 ) ( SURFACE-AT ?auto_21921 ?auto_21932 ) ( CLEAR ?auto_21921 ) ( IS-CRATE ?auto_21917 ) ( not ( = ?auto_21914 ?auto_21921 ) ) ( not ( = ?auto_21915 ?auto_21921 ) ) ( not ( = ?auto_21933 ?auto_21921 ) ) ( not ( = ?auto_21934 ?auto_21921 ) ) ( not ( = ?auto_21920 ?auto_21921 ) ) ( not ( = ?auto_21922 ?auto_21921 ) ) ( not ( = ?auto_21926 ?auto_21921 ) ) ( not ( = ?auto_21917 ?auto_21921 ) ) ( not ( = ?auto_21923 ?auto_21921 ) ) ( AVAILABLE ?auto_21931 ) ( IN ?auto_21917 ?auto_21916 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21931 ?auto_21917 ?auto_21916 ?auto_21932 )
      ( MAKE-ON ?auto_21914 ?auto_21915 )
      ( MAKE-ON-VERIFY ?auto_21914 ?auto_21915 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21935 - SURFACE
      ?auto_21936 - SURFACE
    )
    :vars
    (
      ?auto_21954 - HOIST
      ?auto_21951 - PLACE
      ?auto_21955 - PLACE
      ?auto_21950 - HOIST
      ?auto_21952 - SURFACE
      ?auto_21953 - SURFACE
      ?auto_21948 - PLACE
      ?auto_21946 - HOIST
      ?auto_21941 - SURFACE
      ?auto_21942 - SURFACE
      ?auto_21945 - PLACE
      ?auto_21937 - HOIST
      ?auto_21947 - SURFACE
      ?auto_21939 - SURFACE
      ?auto_21943 - PLACE
      ?auto_21938 - HOIST
      ?auto_21949 - SURFACE
      ?auto_21944 - SURFACE
      ?auto_21940 - TRUCK
      ?auto_21956 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21954 ?auto_21951 ) ( IS-CRATE ?auto_21935 ) ( not ( = ?auto_21935 ?auto_21936 ) ) ( not ( = ?auto_21955 ?auto_21951 ) ) ( HOIST-AT ?auto_21950 ?auto_21955 ) ( not ( = ?auto_21954 ?auto_21950 ) ) ( AVAILABLE ?auto_21950 ) ( SURFACE-AT ?auto_21935 ?auto_21955 ) ( ON ?auto_21935 ?auto_21952 ) ( CLEAR ?auto_21935 ) ( not ( = ?auto_21935 ?auto_21952 ) ) ( not ( = ?auto_21936 ?auto_21952 ) ) ( IS-CRATE ?auto_21936 ) ( not ( = ?auto_21935 ?auto_21953 ) ) ( not ( = ?auto_21936 ?auto_21953 ) ) ( not ( = ?auto_21952 ?auto_21953 ) ) ( not ( = ?auto_21948 ?auto_21951 ) ) ( not ( = ?auto_21955 ?auto_21948 ) ) ( HOIST-AT ?auto_21946 ?auto_21948 ) ( not ( = ?auto_21954 ?auto_21946 ) ) ( not ( = ?auto_21950 ?auto_21946 ) ) ( AVAILABLE ?auto_21946 ) ( SURFACE-AT ?auto_21936 ?auto_21948 ) ( ON ?auto_21936 ?auto_21941 ) ( CLEAR ?auto_21936 ) ( not ( = ?auto_21935 ?auto_21941 ) ) ( not ( = ?auto_21936 ?auto_21941 ) ) ( not ( = ?auto_21952 ?auto_21941 ) ) ( not ( = ?auto_21953 ?auto_21941 ) ) ( IS-CRATE ?auto_21953 ) ( not ( = ?auto_21935 ?auto_21942 ) ) ( not ( = ?auto_21936 ?auto_21942 ) ) ( not ( = ?auto_21952 ?auto_21942 ) ) ( not ( = ?auto_21953 ?auto_21942 ) ) ( not ( = ?auto_21941 ?auto_21942 ) ) ( not ( = ?auto_21945 ?auto_21951 ) ) ( not ( = ?auto_21955 ?auto_21945 ) ) ( not ( = ?auto_21948 ?auto_21945 ) ) ( HOIST-AT ?auto_21937 ?auto_21945 ) ( not ( = ?auto_21954 ?auto_21937 ) ) ( not ( = ?auto_21950 ?auto_21937 ) ) ( not ( = ?auto_21946 ?auto_21937 ) ) ( AVAILABLE ?auto_21937 ) ( SURFACE-AT ?auto_21953 ?auto_21945 ) ( ON ?auto_21953 ?auto_21947 ) ( CLEAR ?auto_21953 ) ( not ( = ?auto_21935 ?auto_21947 ) ) ( not ( = ?auto_21936 ?auto_21947 ) ) ( not ( = ?auto_21952 ?auto_21947 ) ) ( not ( = ?auto_21953 ?auto_21947 ) ) ( not ( = ?auto_21941 ?auto_21947 ) ) ( not ( = ?auto_21942 ?auto_21947 ) ) ( IS-CRATE ?auto_21942 ) ( not ( = ?auto_21935 ?auto_21939 ) ) ( not ( = ?auto_21936 ?auto_21939 ) ) ( not ( = ?auto_21952 ?auto_21939 ) ) ( not ( = ?auto_21953 ?auto_21939 ) ) ( not ( = ?auto_21941 ?auto_21939 ) ) ( not ( = ?auto_21942 ?auto_21939 ) ) ( not ( = ?auto_21947 ?auto_21939 ) ) ( not ( = ?auto_21943 ?auto_21951 ) ) ( not ( = ?auto_21955 ?auto_21943 ) ) ( not ( = ?auto_21948 ?auto_21943 ) ) ( not ( = ?auto_21945 ?auto_21943 ) ) ( HOIST-AT ?auto_21938 ?auto_21943 ) ( not ( = ?auto_21954 ?auto_21938 ) ) ( not ( = ?auto_21950 ?auto_21938 ) ) ( not ( = ?auto_21946 ?auto_21938 ) ) ( not ( = ?auto_21937 ?auto_21938 ) ) ( AVAILABLE ?auto_21938 ) ( SURFACE-AT ?auto_21942 ?auto_21943 ) ( ON ?auto_21942 ?auto_21949 ) ( CLEAR ?auto_21942 ) ( not ( = ?auto_21935 ?auto_21949 ) ) ( not ( = ?auto_21936 ?auto_21949 ) ) ( not ( = ?auto_21952 ?auto_21949 ) ) ( not ( = ?auto_21953 ?auto_21949 ) ) ( not ( = ?auto_21941 ?auto_21949 ) ) ( not ( = ?auto_21942 ?auto_21949 ) ) ( not ( = ?auto_21947 ?auto_21949 ) ) ( not ( = ?auto_21939 ?auto_21949 ) ) ( SURFACE-AT ?auto_21944 ?auto_21951 ) ( CLEAR ?auto_21944 ) ( IS-CRATE ?auto_21939 ) ( not ( = ?auto_21935 ?auto_21944 ) ) ( not ( = ?auto_21936 ?auto_21944 ) ) ( not ( = ?auto_21952 ?auto_21944 ) ) ( not ( = ?auto_21953 ?auto_21944 ) ) ( not ( = ?auto_21941 ?auto_21944 ) ) ( not ( = ?auto_21942 ?auto_21944 ) ) ( not ( = ?auto_21947 ?auto_21944 ) ) ( not ( = ?auto_21939 ?auto_21944 ) ) ( not ( = ?auto_21949 ?auto_21944 ) ) ( AVAILABLE ?auto_21954 ) ( IN ?auto_21939 ?auto_21940 ) ( TRUCK-AT ?auto_21940 ?auto_21956 ) ( not ( = ?auto_21956 ?auto_21951 ) ) ( not ( = ?auto_21955 ?auto_21956 ) ) ( not ( = ?auto_21948 ?auto_21956 ) ) ( not ( = ?auto_21945 ?auto_21956 ) ) ( not ( = ?auto_21943 ?auto_21956 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21940 ?auto_21956 ?auto_21951 )
      ( MAKE-ON ?auto_21935 ?auto_21936 )
      ( MAKE-ON-VERIFY ?auto_21935 ?auto_21936 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21957 - SURFACE
      ?auto_21958 - SURFACE
    )
    :vars
    (
      ?auto_21972 - HOIST
      ?auto_21978 - PLACE
      ?auto_21962 - PLACE
      ?auto_21966 - HOIST
      ?auto_21961 - SURFACE
      ?auto_21971 - SURFACE
      ?auto_21974 - PLACE
      ?auto_21975 - HOIST
      ?auto_21969 - SURFACE
      ?auto_21976 - SURFACE
      ?auto_21965 - PLACE
      ?auto_21970 - HOIST
      ?auto_21977 - SURFACE
      ?auto_21964 - SURFACE
      ?auto_21959 - PLACE
      ?auto_21973 - HOIST
      ?auto_21963 - SURFACE
      ?auto_21968 - SURFACE
      ?auto_21967 - TRUCK
      ?auto_21960 - PLACE
      ?auto_21979 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21972 ?auto_21978 ) ( IS-CRATE ?auto_21957 ) ( not ( = ?auto_21957 ?auto_21958 ) ) ( not ( = ?auto_21962 ?auto_21978 ) ) ( HOIST-AT ?auto_21966 ?auto_21962 ) ( not ( = ?auto_21972 ?auto_21966 ) ) ( AVAILABLE ?auto_21966 ) ( SURFACE-AT ?auto_21957 ?auto_21962 ) ( ON ?auto_21957 ?auto_21961 ) ( CLEAR ?auto_21957 ) ( not ( = ?auto_21957 ?auto_21961 ) ) ( not ( = ?auto_21958 ?auto_21961 ) ) ( IS-CRATE ?auto_21958 ) ( not ( = ?auto_21957 ?auto_21971 ) ) ( not ( = ?auto_21958 ?auto_21971 ) ) ( not ( = ?auto_21961 ?auto_21971 ) ) ( not ( = ?auto_21974 ?auto_21978 ) ) ( not ( = ?auto_21962 ?auto_21974 ) ) ( HOIST-AT ?auto_21975 ?auto_21974 ) ( not ( = ?auto_21972 ?auto_21975 ) ) ( not ( = ?auto_21966 ?auto_21975 ) ) ( AVAILABLE ?auto_21975 ) ( SURFACE-AT ?auto_21958 ?auto_21974 ) ( ON ?auto_21958 ?auto_21969 ) ( CLEAR ?auto_21958 ) ( not ( = ?auto_21957 ?auto_21969 ) ) ( not ( = ?auto_21958 ?auto_21969 ) ) ( not ( = ?auto_21961 ?auto_21969 ) ) ( not ( = ?auto_21971 ?auto_21969 ) ) ( IS-CRATE ?auto_21971 ) ( not ( = ?auto_21957 ?auto_21976 ) ) ( not ( = ?auto_21958 ?auto_21976 ) ) ( not ( = ?auto_21961 ?auto_21976 ) ) ( not ( = ?auto_21971 ?auto_21976 ) ) ( not ( = ?auto_21969 ?auto_21976 ) ) ( not ( = ?auto_21965 ?auto_21978 ) ) ( not ( = ?auto_21962 ?auto_21965 ) ) ( not ( = ?auto_21974 ?auto_21965 ) ) ( HOIST-AT ?auto_21970 ?auto_21965 ) ( not ( = ?auto_21972 ?auto_21970 ) ) ( not ( = ?auto_21966 ?auto_21970 ) ) ( not ( = ?auto_21975 ?auto_21970 ) ) ( AVAILABLE ?auto_21970 ) ( SURFACE-AT ?auto_21971 ?auto_21965 ) ( ON ?auto_21971 ?auto_21977 ) ( CLEAR ?auto_21971 ) ( not ( = ?auto_21957 ?auto_21977 ) ) ( not ( = ?auto_21958 ?auto_21977 ) ) ( not ( = ?auto_21961 ?auto_21977 ) ) ( not ( = ?auto_21971 ?auto_21977 ) ) ( not ( = ?auto_21969 ?auto_21977 ) ) ( not ( = ?auto_21976 ?auto_21977 ) ) ( IS-CRATE ?auto_21976 ) ( not ( = ?auto_21957 ?auto_21964 ) ) ( not ( = ?auto_21958 ?auto_21964 ) ) ( not ( = ?auto_21961 ?auto_21964 ) ) ( not ( = ?auto_21971 ?auto_21964 ) ) ( not ( = ?auto_21969 ?auto_21964 ) ) ( not ( = ?auto_21976 ?auto_21964 ) ) ( not ( = ?auto_21977 ?auto_21964 ) ) ( not ( = ?auto_21959 ?auto_21978 ) ) ( not ( = ?auto_21962 ?auto_21959 ) ) ( not ( = ?auto_21974 ?auto_21959 ) ) ( not ( = ?auto_21965 ?auto_21959 ) ) ( HOIST-AT ?auto_21973 ?auto_21959 ) ( not ( = ?auto_21972 ?auto_21973 ) ) ( not ( = ?auto_21966 ?auto_21973 ) ) ( not ( = ?auto_21975 ?auto_21973 ) ) ( not ( = ?auto_21970 ?auto_21973 ) ) ( AVAILABLE ?auto_21973 ) ( SURFACE-AT ?auto_21976 ?auto_21959 ) ( ON ?auto_21976 ?auto_21963 ) ( CLEAR ?auto_21976 ) ( not ( = ?auto_21957 ?auto_21963 ) ) ( not ( = ?auto_21958 ?auto_21963 ) ) ( not ( = ?auto_21961 ?auto_21963 ) ) ( not ( = ?auto_21971 ?auto_21963 ) ) ( not ( = ?auto_21969 ?auto_21963 ) ) ( not ( = ?auto_21976 ?auto_21963 ) ) ( not ( = ?auto_21977 ?auto_21963 ) ) ( not ( = ?auto_21964 ?auto_21963 ) ) ( SURFACE-AT ?auto_21968 ?auto_21978 ) ( CLEAR ?auto_21968 ) ( IS-CRATE ?auto_21964 ) ( not ( = ?auto_21957 ?auto_21968 ) ) ( not ( = ?auto_21958 ?auto_21968 ) ) ( not ( = ?auto_21961 ?auto_21968 ) ) ( not ( = ?auto_21971 ?auto_21968 ) ) ( not ( = ?auto_21969 ?auto_21968 ) ) ( not ( = ?auto_21976 ?auto_21968 ) ) ( not ( = ?auto_21977 ?auto_21968 ) ) ( not ( = ?auto_21964 ?auto_21968 ) ) ( not ( = ?auto_21963 ?auto_21968 ) ) ( AVAILABLE ?auto_21972 ) ( TRUCK-AT ?auto_21967 ?auto_21960 ) ( not ( = ?auto_21960 ?auto_21978 ) ) ( not ( = ?auto_21962 ?auto_21960 ) ) ( not ( = ?auto_21974 ?auto_21960 ) ) ( not ( = ?auto_21965 ?auto_21960 ) ) ( not ( = ?auto_21959 ?auto_21960 ) ) ( HOIST-AT ?auto_21979 ?auto_21960 ) ( LIFTING ?auto_21979 ?auto_21964 ) ( not ( = ?auto_21972 ?auto_21979 ) ) ( not ( = ?auto_21966 ?auto_21979 ) ) ( not ( = ?auto_21975 ?auto_21979 ) ) ( not ( = ?auto_21970 ?auto_21979 ) ) ( not ( = ?auto_21973 ?auto_21979 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21979 ?auto_21964 ?auto_21967 ?auto_21960 )
      ( MAKE-ON ?auto_21957 ?auto_21958 )
      ( MAKE-ON-VERIFY ?auto_21957 ?auto_21958 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_21980 - SURFACE
      ?auto_21981 - SURFACE
    )
    :vars
    (
      ?auto_21988 - HOIST
      ?auto_21997 - PLACE
      ?auto_21992 - PLACE
      ?auto_21987 - HOIST
      ?auto_21991 - SURFACE
      ?auto_21990 - SURFACE
      ?auto_21985 - PLACE
      ?auto_21982 - HOIST
      ?auto_21996 - SURFACE
      ?auto_21999 - SURFACE
      ?auto_22000 - PLACE
      ?auto_21993 - HOIST
      ?auto_21984 - SURFACE
      ?auto_21995 - SURFACE
      ?auto_22002 - PLACE
      ?auto_21986 - HOIST
      ?auto_21998 - SURFACE
      ?auto_21989 - SURFACE
      ?auto_22001 - TRUCK
      ?auto_21994 - PLACE
      ?auto_21983 - HOIST
      ?auto_22003 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21988 ?auto_21997 ) ( IS-CRATE ?auto_21980 ) ( not ( = ?auto_21980 ?auto_21981 ) ) ( not ( = ?auto_21992 ?auto_21997 ) ) ( HOIST-AT ?auto_21987 ?auto_21992 ) ( not ( = ?auto_21988 ?auto_21987 ) ) ( AVAILABLE ?auto_21987 ) ( SURFACE-AT ?auto_21980 ?auto_21992 ) ( ON ?auto_21980 ?auto_21991 ) ( CLEAR ?auto_21980 ) ( not ( = ?auto_21980 ?auto_21991 ) ) ( not ( = ?auto_21981 ?auto_21991 ) ) ( IS-CRATE ?auto_21981 ) ( not ( = ?auto_21980 ?auto_21990 ) ) ( not ( = ?auto_21981 ?auto_21990 ) ) ( not ( = ?auto_21991 ?auto_21990 ) ) ( not ( = ?auto_21985 ?auto_21997 ) ) ( not ( = ?auto_21992 ?auto_21985 ) ) ( HOIST-AT ?auto_21982 ?auto_21985 ) ( not ( = ?auto_21988 ?auto_21982 ) ) ( not ( = ?auto_21987 ?auto_21982 ) ) ( AVAILABLE ?auto_21982 ) ( SURFACE-AT ?auto_21981 ?auto_21985 ) ( ON ?auto_21981 ?auto_21996 ) ( CLEAR ?auto_21981 ) ( not ( = ?auto_21980 ?auto_21996 ) ) ( not ( = ?auto_21981 ?auto_21996 ) ) ( not ( = ?auto_21991 ?auto_21996 ) ) ( not ( = ?auto_21990 ?auto_21996 ) ) ( IS-CRATE ?auto_21990 ) ( not ( = ?auto_21980 ?auto_21999 ) ) ( not ( = ?auto_21981 ?auto_21999 ) ) ( not ( = ?auto_21991 ?auto_21999 ) ) ( not ( = ?auto_21990 ?auto_21999 ) ) ( not ( = ?auto_21996 ?auto_21999 ) ) ( not ( = ?auto_22000 ?auto_21997 ) ) ( not ( = ?auto_21992 ?auto_22000 ) ) ( not ( = ?auto_21985 ?auto_22000 ) ) ( HOIST-AT ?auto_21993 ?auto_22000 ) ( not ( = ?auto_21988 ?auto_21993 ) ) ( not ( = ?auto_21987 ?auto_21993 ) ) ( not ( = ?auto_21982 ?auto_21993 ) ) ( AVAILABLE ?auto_21993 ) ( SURFACE-AT ?auto_21990 ?auto_22000 ) ( ON ?auto_21990 ?auto_21984 ) ( CLEAR ?auto_21990 ) ( not ( = ?auto_21980 ?auto_21984 ) ) ( not ( = ?auto_21981 ?auto_21984 ) ) ( not ( = ?auto_21991 ?auto_21984 ) ) ( not ( = ?auto_21990 ?auto_21984 ) ) ( not ( = ?auto_21996 ?auto_21984 ) ) ( not ( = ?auto_21999 ?auto_21984 ) ) ( IS-CRATE ?auto_21999 ) ( not ( = ?auto_21980 ?auto_21995 ) ) ( not ( = ?auto_21981 ?auto_21995 ) ) ( not ( = ?auto_21991 ?auto_21995 ) ) ( not ( = ?auto_21990 ?auto_21995 ) ) ( not ( = ?auto_21996 ?auto_21995 ) ) ( not ( = ?auto_21999 ?auto_21995 ) ) ( not ( = ?auto_21984 ?auto_21995 ) ) ( not ( = ?auto_22002 ?auto_21997 ) ) ( not ( = ?auto_21992 ?auto_22002 ) ) ( not ( = ?auto_21985 ?auto_22002 ) ) ( not ( = ?auto_22000 ?auto_22002 ) ) ( HOIST-AT ?auto_21986 ?auto_22002 ) ( not ( = ?auto_21988 ?auto_21986 ) ) ( not ( = ?auto_21987 ?auto_21986 ) ) ( not ( = ?auto_21982 ?auto_21986 ) ) ( not ( = ?auto_21993 ?auto_21986 ) ) ( AVAILABLE ?auto_21986 ) ( SURFACE-AT ?auto_21999 ?auto_22002 ) ( ON ?auto_21999 ?auto_21998 ) ( CLEAR ?auto_21999 ) ( not ( = ?auto_21980 ?auto_21998 ) ) ( not ( = ?auto_21981 ?auto_21998 ) ) ( not ( = ?auto_21991 ?auto_21998 ) ) ( not ( = ?auto_21990 ?auto_21998 ) ) ( not ( = ?auto_21996 ?auto_21998 ) ) ( not ( = ?auto_21999 ?auto_21998 ) ) ( not ( = ?auto_21984 ?auto_21998 ) ) ( not ( = ?auto_21995 ?auto_21998 ) ) ( SURFACE-AT ?auto_21989 ?auto_21997 ) ( CLEAR ?auto_21989 ) ( IS-CRATE ?auto_21995 ) ( not ( = ?auto_21980 ?auto_21989 ) ) ( not ( = ?auto_21981 ?auto_21989 ) ) ( not ( = ?auto_21991 ?auto_21989 ) ) ( not ( = ?auto_21990 ?auto_21989 ) ) ( not ( = ?auto_21996 ?auto_21989 ) ) ( not ( = ?auto_21999 ?auto_21989 ) ) ( not ( = ?auto_21984 ?auto_21989 ) ) ( not ( = ?auto_21995 ?auto_21989 ) ) ( not ( = ?auto_21998 ?auto_21989 ) ) ( AVAILABLE ?auto_21988 ) ( TRUCK-AT ?auto_22001 ?auto_21994 ) ( not ( = ?auto_21994 ?auto_21997 ) ) ( not ( = ?auto_21992 ?auto_21994 ) ) ( not ( = ?auto_21985 ?auto_21994 ) ) ( not ( = ?auto_22000 ?auto_21994 ) ) ( not ( = ?auto_22002 ?auto_21994 ) ) ( HOIST-AT ?auto_21983 ?auto_21994 ) ( not ( = ?auto_21988 ?auto_21983 ) ) ( not ( = ?auto_21987 ?auto_21983 ) ) ( not ( = ?auto_21982 ?auto_21983 ) ) ( not ( = ?auto_21993 ?auto_21983 ) ) ( not ( = ?auto_21986 ?auto_21983 ) ) ( AVAILABLE ?auto_21983 ) ( SURFACE-AT ?auto_21995 ?auto_21994 ) ( ON ?auto_21995 ?auto_22003 ) ( CLEAR ?auto_21995 ) ( not ( = ?auto_21980 ?auto_22003 ) ) ( not ( = ?auto_21981 ?auto_22003 ) ) ( not ( = ?auto_21991 ?auto_22003 ) ) ( not ( = ?auto_21990 ?auto_22003 ) ) ( not ( = ?auto_21996 ?auto_22003 ) ) ( not ( = ?auto_21999 ?auto_22003 ) ) ( not ( = ?auto_21984 ?auto_22003 ) ) ( not ( = ?auto_21995 ?auto_22003 ) ) ( not ( = ?auto_21998 ?auto_22003 ) ) ( not ( = ?auto_21989 ?auto_22003 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21983 ?auto_21995 ?auto_22003 ?auto_21994 )
      ( MAKE-ON ?auto_21980 ?auto_21981 )
      ( MAKE-ON-VERIFY ?auto_21980 ?auto_21981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22004 - SURFACE
      ?auto_22005 - SURFACE
    )
    :vars
    (
      ?auto_22017 - HOIST
      ?auto_22016 - PLACE
      ?auto_22018 - PLACE
      ?auto_22019 - HOIST
      ?auto_22009 - SURFACE
      ?auto_22021 - SURFACE
      ?auto_22010 - PLACE
      ?auto_22022 - HOIST
      ?auto_22006 - SURFACE
      ?auto_22027 - SURFACE
      ?auto_22023 - PLACE
      ?auto_22014 - HOIST
      ?auto_22013 - SURFACE
      ?auto_22025 - SURFACE
      ?auto_22015 - PLACE
      ?auto_22012 - HOIST
      ?auto_22026 - SURFACE
      ?auto_22011 - SURFACE
      ?auto_22008 - PLACE
      ?auto_22020 - HOIST
      ?auto_22007 - SURFACE
      ?auto_22024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22017 ?auto_22016 ) ( IS-CRATE ?auto_22004 ) ( not ( = ?auto_22004 ?auto_22005 ) ) ( not ( = ?auto_22018 ?auto_22016 ) ) ( HOIST-AT ?auto_22019 ?auto_22018 ) ( not ( = ?auto_22017 ?auto_22019 ) ) ( AVAILABLE ?auto_22019 ) ( SURFACE-AT ?auto_22004 ?auto_22018 ) ( ON ?auto_22004 ?auto_22009 ) ( CLEAR ?auto_22004 ) ( not ( = ?auto_22004 ?auto_22009 ) ) ( not ( = ?auto_22005 ?auto_22009 ) ) ( IS-CRATE ?auto_22005 ) ( not ( = ?auto_22004 ?auto_22021 ) ) ( not ( = ?auto_22005 ?auto_22021 ) ) ( not ( = ?auto_22009 ?auto_22021 ) ) ( not ( = ?auto_22010 ?auto_22016 ) ) ( not ( = ?auto_22018 ?auto_22010 ) ) ( HOIST-AT ?auto_22022 ?auto_22010 ) ( not ( = ?auto_22017 ?auto_22022 ) ) ( not ( = ?auto_22019 ?auto_22022 ) ) ( AVAILABLE ?auto_22022 ) ( SURFACE-AT ?auto_22005 ?auto_22010 ) ( ON ?auto_22005 ?auto_22006 ) ( CLEAR ?auto_22005 ) ( not ( = ?auto_22004 ?auto_22006 ) ) ( not ( = ?auto_22005 ?auto_22006 ) ) ( not ( = ?auto_22009 ?auto_22006 ) ) ( not ( = ?auto_22021 ?auto_22006 ) ) ( IS-CRATE ?auto_22021 ) ( not ( = ?auto_22004 ?auto_22027 ) ) ( not ( = ?auto_22005 ?auto_22027 ) ) ( not ( = ?auto_22009 ?auto_22027 ) ) ( not ( = ?auto_22021 ?auto_22027 ) ) ( not ( = ?auto_22006 ?auto_22027 ) ) ( not ( = ?auto_22023 ?auto_22016 ) ) ( not ( = ?auto_22018 ?auto_22023 ) ) ( not ( = ?auto_22010 ?auto_22023 ) ) ( HOIST-AT ?auto_22014 ?auto_22023 ) ( not ( = ?auto_22017 ?auto_22014 ) ) ( not ( = ?auto_22019 ?auto_22014 ) ) ( not ( = ?auto_22022 ?auto_22014 ) ) ( AVAILABLE ?auto_22014 ) ( SURFACE-AT ?auto_22021 ?auto_22023 ) ( ON ?auto_22021 ?auto_22013 ) ( CLEAR ?auto_22021 ) ( not ( = ?auto_22004 ?auto_22013 ) ) ( not ( = ?auto_22005 ?auto_22013 ) ) ( not ( = ?auto_22009 ?auto_22013 ) ) ( not ( = ?auto_22021 ?auto_22013 ) ) ( not ( = ?auto_22006 ?auto_22013 ) ) ( not ( = ?auto_22027 ?auto_22013 ) ) ( IS-CRATE ?auto_22027 ) ( not ( = ?auto_22004 ?auto_22025 ) ) ( not ( = ?auto_22005 ?auto_22025 ) ) ( not ( = ?auto_22009 ?auto_22025 ) ) ( not ( = ?auto_22021 ?auto_22025 ) ) ( not ( = ?auto_22006 ?auto_22025 ) ) ( not ( = ?auto_22027 ?auto_22025 ) ) ( not ( = ?auto_22013 ?auto_22025 ) ) ( not ( = ?auto_22015 ?auto_22016 ) ) ( not ( = ?auto_22018 ?auto_22015 ) ) ( not ( = ?auto_22010 ?auto_22015 ) ) ( not ( = ?auto_22023 ?auto_22015 ) ) ( HOIST-AT ?auto_22012 ?auto_22015 ) ( not ( = ?auto_22017 ?auto_22012 ) ) ( not ( = ?auto_22019 ?auto_22012 ) ) ( not ( = ?auto_22022 ?auto_22012 ) ) ( not ( = ?auto_22014 ?auto_22012 ) ) ( AVAILABLE ?auto_22012 ) ( SURFACE-AT ?auto_22027 ?auto_22015 ) ( ON ?auto_22027 ?auto_22026 ) ( CLEAR ?auto_22027 ) ( not ( = ?auto_22004 ?auto_22026 ) ) ( not ( = ?auto_22005 ?auto_22026 ) ) ( not ( = ?auto_22009 ?auto_22026 ) ) ( not ( = ?auto_22021 ?auto_22026 ) ) ( not ( = ?auto_22006 ?auto_22026 ) ) ( not ( = ?auto_22027 ?auto_22026 ) ) ( not ( = ?auto_22013 ?auto_22026 ) ) ( not ( = ?auto_22025 ?auto_22026 ) ) ( SURFACE-AT ?auto_22011 ?auto_22016 ) ( CLEAR ?auto_22011 ) ( IS-CRATE ?auto_22025 ) ( not ( = ?auto_22004 ?auto_22011 ) ) ( not ( = ?auto_22005 ?auto_22011 ) ) ( not ( = ?auto_22009 ?auto_22011 ) ) ( not ( = ?auto_22021 ?auto_22011 ) ) ( not ( = ?auto_22006 ?auto_22011 ) ) ( not ( = ?auto_22027 ?auto_22011 ) ) ( not ( = ?auto_22013 ?auto_22011 ) ) ( not ( = ?auto_22025 ?auto_22011 ) ) ( not ( = ?auto_22026 ?auto_22011 ) ) ( AVAILABLE ?auto_22017 ) ( not ( = ?auto_22008 ?auto_22016 ) ) ( not ( = ?auto_22018 ?auto_22008 ) ) ( not ( = ?auto_22010 ?auto_22008 ) ) ( not ( = ?auto_22023 ?auto_22008 ) ) ( not ( = ?auto_22015 ?auto_22008 ) ) ( HOIST-AT ?auto_22020 ?auto_22008 ) ( not ( = ?auto_22017 ?auto_22020 ) ) ( not ( = ?auto_22019 ?auto_22020 ) ) ( not ( = ?auto_22022 ?auto_22020 ) ) ( not ( = ?auto_22014 ?auto_22020 ) ) ( not ( = ?auto_22012 ?auto_22020 ) ) ( AVAILABLE ?auto_22020 ) ( SURFACE-AT ?auto_22025 ?auto_22008 ) ( ON ?auto_22025 ?auto_22007 ) ( CLEAR ?auto_22025 ) ( not ( = ?auto_22004 ?auto_22007 ) ) ( not ( = ?auto_22005 ?auto_22007 ) ) ( not ( = ?auto_22009 ?auto_22007 ) ) ( not ( = ?auto_22021 ?auto_22007 ) ) ( not ( = ?auto_22006 ?auto_22007 ) ) ( not ( = ?auto_22027 ?auto_22007 ) ) ( not ( = ?auto_22013 ?auto_22007 ) ) ( not ( = ?auto_22025 ?auto_22007 ) ) ( not ( = ?auto_22026 ?auto_22007 ) ) ( not ( = ?auto_22011 ?auto_22007 ) ) ( TRUCK-AT ?auto_22024 ?auto_22016 ) )
    :subtasks
    ( ( !DRIVE ?auto_22024 ?auto_22016 ?auto_22008 )
      ( MAKE-ON ?auto_22004 ?auto_22005 )
      ( MAKE-ON-VERIFY ?auto_22004 ?auto_22005 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22028 - SURFACE
      ?auto_22029 - SURFACE
    )
    :vars
    (
      ?auto_22042 - HOIST
      ?auto_22040 - PLACE
      ?auto_22031 - PLACE
      ?auto_22039 - HOIST
      ?auto_22038 - SURFACE
      ?auto_22035 - SURFACE
      ?auto_22048 - PLACE
      ?auto_22051 - HOIST
      ?auto_22044 - SURFACE
      ?auto_22043 - SURFACE
      ?auto_22032 - PLACE
      ?auto_22034 - HOIST
      ?auto_22050 - SURFACE
      ?auto_22033 - SURFACE
      ?auto_22047 - PLACE
      ?auto_22041 - HOIST
      ?auto_22030 - SURFACE
      ?auto_22036 - SURFACE
      ?auto_22046 - PLACE
      ?auto_22045 - HOIST
      ?auto_22049 - SURFACE
      ?auto_22037 - TRUCK
      ?auto_22052 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22042 ?auto_22040 ) ( IS-CRATE ?auto_22028 ) ( not ( = ?auto_22028 ?auto_22029 ) ) ( not ( = ?auto_22031 ?auto_22040 ) ) ( HOIST-AT ?auto_22039 ?auto_22031 ) ( not ( = ?auto_22042 ?auto_22039 ) ) ( AVAILABLE ?auto_22039 ) ( SURFACE-AT ?auto_22028 ?auto_22031 ) ( ON ?auto_22028 ?auto_22038 ) ( CLEAR ?auto_22028 ) ( not ( = ?auto_22028 ?auto_22038 ) ) ( not ( = ?auto_22029 ?auto_22038 ) ) ( IS-CRATE ?auto_22029 ) ( not ( = ?auto_22028 ?auto_22035 ) ) ( not ( = ?auto_22029 ?auto_22035 ) ) ( not ( = ?auto_22038 ?auto_22035 ) ) ( not ( = ?auto_22048 ?auto_22040 ) ) ( not ( = ?auto_22031 ?auto_22048 ) ) ( HOIST-AT ?auto_22051 ?auto_22048 ) ( not ( = ?auto_22042 ?auto_22051 ) ) ( not ( = ?auto_22039 ?auto_22051 ) ) ( AVAILABLE ?auto_22051 ) ( SURFACE-AT ?auto_22029 ?auto_22048 ) ( ON ?auto_22029 ?auto_22044 ) ( CLEAR ?auto_22029 ) ( not ( = ?auto_22028 ?auto_22044 ) ) ( not ( = ?auto_22029 ?auto_22044 ) ) ( not ( = ?auto_22038 ?auto_22044 ) ) ( not ( = ?auto_22035 ?auto_22044 ) ) ( IS-CRATE ?auto_22035 ) ( not ( = ?auto_22028 ?auto_22043 ) ) ( not ( = ?auto_22029 ?auto_22043 ) ) ( not ( = ?auto_22038 ?auto_22043 ) ) ( not ( = ?auto_22035 ?auto_22043 ) ) ( not ( = ?auto_22044 ?auto_22043 ) ) ( not ( = ?auto_22032 ?auto_22040 ) ) ( not ( = ?auto_22031 ?auto_22032 ) ) ( not ( = ?auto_22048 ?auto_22032 ) ) ( HOIST-AT ?auto_22034 ?auto_22032 ) ( not ( = ?auto_22042 ?auto_22034 ) ) ( not ( = ?auto_22039 ?auto_22034 ) ) ( not ( = ?auto_22051 ?auto_22034 ) ) ( AVAILABLE ?auto_22034 ) ( SURFACE-AT ?auto_22035 ?auto_22032 ) ( ON ?auto_22035 ?auto_22050 ) ( CLEAR ?auto_22035 ) ( not ( = ?auto_22028 ?auto_22050 ) ) ( not ( = ?auto_22029 ?auto_22050 ) ) ( not ( = ?auto_22038 ?auto_22050 ) ) ( not ( = ?auto_22035 ?auto_22050 ) ) ( not ( = ?auto_22044 ?auto_22050 ) ) ( not ( = ?auto_22043 ?auto_22050 ) ) ( IS-CRATE ?auto_22043 ) ( not ( = ?auto_22028 ?auto_22033 ) ) ( not ( = ?auto_22029 ?auto_22033 ) ) ( not ( = ?auto_22038 ?auto_22033 ) ) ( not ( = ?auto_22035 ?auto_22033 ) ) ( not ( = ?auto_22044 ?auto_22033 ) ) ( not ( = ?auto_22043 ?auto_22033 ) ) ( not ( = ?auto_22050 ?auto_22033 ) ) ( not ( = ?auto_22047 ?auto_22040 ) ) ( not ( = ?auto_22031 ?auto_22047 ) ) ( not ( = ?auto_22048 ?auto_22047 ) ) ( not ( = ?auto_22032 ?auto_22047 ) ) ( HOIST-AT ?auto_22041 ?auto_22047 ) ( not ( = ?auto_22042 ?auto_22041 ) ) ( not ( = ?auto_22039 ?auto_22041 ) ) ( not ( = ?auto_22051 ?auto_22041 ) ) ( not ( = ?auto_22034 ?auto_22041 ) ) ( AVAILABLE ?auto_22041 ) ( SURFACE-AT ?auto_22043 ?auto_22047 ) ( ON ?auto_22043 ?auto_22030 ) ( CLEAR ?auto_22043 ) ( not ( = ?auto_22028 ?auto_22030 ) ) ( not ( = ?auto_22029 ?auto_22030 ) ) ( not ( = ?auto_22038 ?auto_22030 ) ) ( not ( = ?auto_22035 ?auto_22030 ) ) ( not ( = ?auto_22044 ?auto_22030 ) ) ( not ( = ?auto_22043 ?auto_22030 ) ) ( not ( = ?auto_22050 ?auto_22030 ) ) ( not ( = ?auto_22033 ?auto_22030 ) ) ( IS-CRATE ?auto_22033 ) ( not ( = ?auto_22028 ?auto_22036 ) ) ( not ( = ?auto_22029 ?auto_22036 ) ) ( not ( = ?auto_22038 ?auto_22036 ) ) ( not ( = ?auto_22035 ?auto_22036 ) ) ( not ( = ?auto_22044 ?auto_22036 ) ) ( not ( = ?auto_22043 ?auto_22036 ) ) ( not ( = ?auto_22050 ?auto_22036 ) ) ( not ( = ?auto_22033 ?auto_22036 ) ) ( not ( = ?auto_22030 ?auto_22036 ) ) ( not ( = ?auto_22046 ?auto_22040 ) ) ( not ( = ?auto_22031 ?auto_22046 ) ) ( not ( = ?auto_22048 ?auto_22046 ) ) ( not ( = ?auto_22032 ?auto_22046 ) ) ( not ( = ?auto_22047 ?auto_22046 ) ) ( HOIST-AT ?auto_22045 ?auto_22046 ) ( not ( = ?auto_22042 ?auto_22045 ) ) ( not ( = ?auto_22039 ?auto_22045 ) ) ( not ( = ?auto_22051 ?auto_22045 ) ) ( not ( = ?auto_22034 ?auto_22045 ) ) ( not ( = ?auto_22041 ?auto_22045 ) ) ( AVAILABLE ?auto_22045 ) ( SURFACE-AT ?auto_22033 ?auto_22046 ) ( ON ?auto_22033 ?auto_22049 ) ( CLEAR ?auto_22033 ) ( not ( = ?auto_22028 ?auto_22049 ) ) ( not ( = ?auto_22029 ?auto_22049 ) ) ( not ( = ?auto_22038 ?auto_22049 ) ) ( not ( = ?auto_22035 ?auto_22049 ) ) ( not ( = ?auto_22044 ?auto_22049 ) ) ( not ( = ?auto_22043 ?auto_22049 ) ) ( not ( = ?auto_22050 ?auto_22049 ) ) ( not ( = ?auto_22033 ?auto_22049 ) ) ( not ( = ?auto_22030 ?auto_22049 ) ) ( not ( = ?auto_22036 ?auto_22049 ) ) ( TRUCK-AT ?auto_22037 ?auto_22040 ) ( SURFACE-AT ?auto_22052 ?auto_22040 ) ( CLEAR ?auto_22052 ) ( LIFTING ?auto_22042 ?auto_22036 ) ( IS-CRATE ?auto_22036 ) ( not ( = ?auto_22028 ?auto_22052 ) ) ( not ( = ?auto_22029 ?auto_22052 ) ) ( not ( = ?auto_22038 ?auto_22052 ) ) ( not ( = ?auto_22035 ?auto_22052 ) ) ( not ( = ?auto_22044 ?auto_22052 ) ) ( not ( = ?auto_22043 ?auto_22052 ) ) ( not ( = ?auto_22050 ?auto_22052 ) ) ( not ( = ?auto_22033 ?auto_22052 ) ) ( not ( = ?auto_22030 ?auto_22052 ) ) ( not ( = ?auto_22036 ?auto_22052 ) ) ( not ( = ?auto_22049 ?auto_22052 ) ) )
    :subtasks
    ( ( !DROP ?auto_22042 ?auto_22036 ?auto_22052 ?auto_22040 )
      ( MAKE-ON ?auto_22028 ?auto_22029 )
      ( MAKE-ON-VERIFY ?auto_22028 ?auto_22029 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22053 - SURFACE
      ?auto_22054 - SURFACE
    )
    :vars
    (
      ?auto_22056 - HOIST
      ?auto_22058 - PLACE
      ?auto_22075 - PLACE
      ?auto_22062 - HOIST
      ?auto_22067 - SURFACE
      ?auto_22055 - SURFACE
      ?auto_22060 - PLACE
      ?auto_22063 - HOIST
      ?auto_22070 - SURFACE
      ?auto_22059 - SURFACE
      ?auto_22068 - PLACE
      ?auto_22076 - HOIST
      ?auto_22065 - SURFACE
      ?auto_22066 - SURFACE
      ?auto_22061 - PLACE
      ?auto_22074 - HOIST
      ?auto_22073 - SURFACE
      ?auto_22071 - SURFACE
      ?auto_22057 - PLACE
      ?auto_22072 - HOIST
      ?auto_22064 - SURFACE
      ?auto_22077 - TRUCK
      ?auto_22069 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22056 ?auto_22058 ) ( IS-CRATE ?auto_22053 ) ( not ( = ?auto_22053 ?auto_22054 ) ) ( not ( = ?auto_22075 ?auto_22058 ) ) ( HOIST-AT ?auto_22062 ?auto_22075 ) ( not ( = ?auto_22056 ?auto_22062 ) ) ( AVAILABLE ?auto_22062 ) ( SURFACE-AT ?auto_22053 ?auto_22075 ) ( ON ?auto_22053 ?auto_22067 ) ( CLEAR ?auto_22053 ) ( not ( = ?auto_22053 ?auto_22067 ) ) ( not ( = ?auto_22054 ?auto_22067 ) ) ( IS-CRATE ?auto_22054 ) ( not ( = ?auto_22053 ?auto_22055 ) ) ( not ( = ?auto_22054 ?auto_22055 ) ) ( not ( = ?auto_22067 ?auto_22055 ) ) ( not ( = ?auto_22060 ?auto_22058 ) ) ( not ( = ?auto_22075 ?auto_22060 ) ) ( HOIST-AT ?auto_22063 ?auto_22060 ) ( not ( = ?auto_22056 ?auto_22063 ) ) ( not ( = ?auto_22062 ?auto_22063 ) ) ( AVAILABLE ?auto_22063 ) ( SURFACE-AT ?auto_22054 ?auto_22060 ) ( ON ?auto_22054 ?auto_22070 ) ( CLEAR ?auto_22054 ) ( not ( = ?auto_22053 ?auto_22070 ) ) ( not ( = ?auto_22054 ?auto_22070 ) ) ( not ( = ?auto_22067 ?auto_22070 ) ) ( not ( = ?auto_22055 ?auto_22070 ) ) ( IS-CRATE ?auto_22055 ) ( not ( = ?auto_22053 ?auto_22059 ) ) ( not ( = ?auto_22054 ?auto_22059 ) ) ( not ( = ?auto_22067 ?auto_22059 ) ) ( not ( = ?auto_22055 ?auto_22059 ) ) ( not ( = ?auto_22070 ?auto_22059 ) ) ( not ( = ?auto_22068 ?auto_22058 ) ) ( not ( = ?auto_22075 ?auto_22068 ) ) ( not ( = ?auto_22060 ?auto_22068 ) ) ( HOIST-AT ?auto_22076 ?auto_22068 ) ( not ( = ?auto_22056 ?auto_22076 ) ) ( not ( = ?auto_22062 ?auto_22076 ) ) ( not ( = ?auto_22063 ?auto_22076 ) ) ( AVAILABLE ?auto_22076 ) ( SURFACE-AT ?auto_22055 ?auto_22068 ) ( ON ?auto_22055 ?auto_22065 ) ( CLEAR ?auto_22055 ) ( not ( = ?auto_22053 ?auto_22065 ) ) ( not ( = ?auto_22054 ?auto_22065 ) ) ( not ( = ?auto_22067 ?auto_22065 ) ) ( not ( = ?auto_22055 ?auto_22065 ) ) ( not ( = ?auto_22070 ?auto_22065 ) ) ( not ( = ?auto_22059 ?auto_22065 ) ) ( IS-CRATE ?auto_22059 ) ( not ( = ?auto_22053 ?auto_22066 ) ) ( not ( = ?auto_22054 ?auto_22066 ) ) ( not ( = ?auto_22067 ?auto_22066 ) ) ( not ( = ?auto_22055 ?auto_22066 ) ) ( not ( = ?auto_22070 ?auto_22066 ) ) ( not ( = ?auto_22059 ?auto_22066 ) ) ( not ( = ?auto_22065 ?auto_22066 ) ) ( not ( = ?auto_22061 ?auto_22058 ) ) ( not ( = ?auto_22075 ?auto_22061 ) ) ( not ( = ?auto_22060 ?auto_22061 ) ) ( not ( = ?auto_22068 ?auto_22061 ) ) ( HOIST-AT ?auto_22074 ?auto_22061 ) ( not ( = ?auto_22056 ?auto_22074 ) ) ( not ( = ?auto_22062 ?auto_22074 ) ) ( not ( = ?auto_22063 ?auto_22074 ) ) ( not ( = ?auto_22076 ?auto_22074 ) ) ( AVAILABLE ?auto_22074 ) ( SURFACE-AT ?auto_22059 ?auto_22061 ) ( ON ?auto_22059 ?auto_22073 ) ( CLEAR ?auto_22059 ) ( not ( = ?auto_22053 ?auto_22073 ) ) ( not ( = ?auto_22054 ?auto_22073 ) ) ( not ( = ?auto_22067 ?auto_22073 ) ) ( not ( = ?auto_22055 ?auto_22073 ) ) ( not ( = ?auto_22070 ?auto_22073 ) ) ( not ( = ?auto_22059 ?auto_22073 ) ) ( not ( = ?auto_22065 ?auto_22073 ) ) ( not ( = ?auto_22066 ?auto_22073 ) ) ( IS-CRATE ?auto_22066 ) ( not ( = ?auto_22053 ?auto_22071 ) ) ( not ( = ?auto_22054 ?auto_22071 ) ) ( not ( = ?auto_22067 ?auto_22071 ) ) ( not ( = ?auto_22055 ?auto_22071 ) ) ( not ( = ?auto_22070 ?auto_22071 ) ) ( not ( = ?auto_22059 ?auto_22071 ) ) ( not ( = ?auto_22065 ?auto_22071 ) ) ( not ( = ?auto_22066 ?auto_22071 ) ) ( not ( = ?auto_22073 ?auto_22071 ) ) ( not ( = ?auto_22057 ?auto_22058 ) ) ( not ( = ?auto_22075 ?auto_22057 ) ) ( not ( = ?auto_22060 ?auto_22057 ) ) ( not ( = ?auto_22068 ?auto_22057 ) ) ( not ( = ?auto_22061 ?auto_22057 ) ) ( HOIST-AT ?auto_22072 ?auto_22057 ) ( not ( = ?auto_22056 ?auto_22072 ) ) ( not ( = ?auto_22062 ?auto_22072 ) ) ( not ( = ?auto_22063 ?auto_22072 ) ) ( not ( = ?auto_22076 ?auto_22072 ) ) ( not ( = ?auto_22074 ?auto_22072 ) ) ( AVAILABLE ?auto_22072 ) ( SURFACE-AT ?auto_22066 ?auto_22057 ) ( ON ?auto_22066 ?auto_22064 ) ( CLEAR ?auto_22066 ) ( not ( = ?auto_22053 ?auto_22064 ) ) ( not ( = ?auto_22054 ?auto_22064 ) ) ( not ( = ?auto_22067 ?auto_22064 ) ) ( not ( = ?auto_22055 ?auto_22064 ) ) ( not ( = ?auto_22070 ?auto_22064 ) ) ( not ( = ?auto_22059 ?auto_22064 ) ) ( not ( = ?auto_22065 ?auto_22064 ) ) ( not ( = ?auto_22066 ?auto_22064 ) ) ( not ( = ?auto_22073 ?auto_22064 ) ) ( not ( = ?auto_22071 ?auto_22064 ) ) ( TRUCK-AT ?auto_22077 ?auto_22058 ) ( SURFACE-AT ?auto_22069 ?auto_22058 ) ( CLEAR ?auto_22069 ) ( IS-CRATE ?auto_22071 ) ( not ( = ?auto_22053 ?auto_22069 ) ) ( not ( = ?auto_22054 ?auto_22069 ) ) ( not ( = ?auto_22067 ?auto_22069 ) ) ( not ( = ?auto_22055 ?auto_22069 ) ) ( not ( = ?auto_22070 ?auto_22069 ) ) ( not ( = ?auto_22059 ?auto_22069 ) ) ( not ( = ?auto_22065 ?auto_22069 ) ) ( not ( = ?auto_22066 ?auto_22069 ) ) ( not ( = ?auto_22073 ?auto_22069 ) ) ( not ( = ?auto_22071 ?auto_22069 ) ) ( not ( = ?auto_22064 ?auto_22069 ) ) ( AVAILABLE ?auto_22056 ) ( IN ?auto_22071 ?auto_22077 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22056 ?auto_22071 ?auto_22077 ?auto_22058 )
      ( MAKE-ON ?auto_22053 ?auto_22054 )
      ( MAKE-ON-VERIFY ?auto_22053 ?auto_22054 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22078 - SURFACE
      ?auto_22079 - SURFACE
    )
    :vars
    (
      ?auto_22090 - HOIST
      ?auto_22080 - PLACE
      ?auto_22088 - PLACE
      ?auto_22098 - HOIST
      ?auto_22082 - SURFACE
      ?auto_22086 - SURFACE
      ?auto_22092 - PLACE
      ?auto_22096 - HOIST
      ?auto_22089 - SURFACE
      ?auto_22101 - SURFACE
      ?auto_22100 - PLACE
      ?auto_22085 - HOIST
      ?auto_22102 - SURFACE
      ?auto_22099 - SURFACE
      ?auto_22083 - PLACE
      ?auto_22097 - HOIST
      ?auto_22091 - SURFACE
      ?auto_22094 - SURFACE
      ?auto_22093 - PLACE
      ?auto_22087 - HOIST
      ?auto_22084 - SURFACE
      ?auto_22081 - SURFACE
      ?auto_22095 - TRUCK
      ?auto_22103 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22090 ?auto_22080 ) ( IS-CRATE ?auto_22078 ) ( not ( = ?auto_22078 ?auto_22079 ) ) ( not ( = ?auto_22088 ?auto_22080 ) ) ( HOIST-AT ?auto_22098 ?auto_22088 ) ( not ( = ?auto_22090 ?auto_22098 ) ) ( AVAILABLE ?auto_22098 ) ( SURFACE-AT ?auto_22078 ?auto_22088 ) ( ON ?auto_22078 ?auto_22082 ) ( CLEAR ?auto_22078 ) ( not ( = ?auto_22078 ?auto_22082 ) ) ( not ( = ?auto_22079 ?auto_22082 ) ) ( IS-CRATE ?auto_22079 ) ( not ( = ?auto_22078 ?auto_22086 ) ) ( not ( = ?auto_22079 ?auto_22086 ) ) ( not ( = ?auto_22082 ?auto_22086 ) ) ( not ( = ?auto_22092 ?auto_22080 ) ) ( not ( = ?auto_22088 ?auto_22092 ) ) ( HOIST-AT ?auto_22096 ?auto_22092 ) ( not ( = ?auto_22090 ?auto_22096 ) ) ( not ( = ?auto_22098 ?auto_22096 ) ) ( AVAILABLE ?auto_22096 ) ( SURFACE-AT ?auto_22079 ?auto_22092 ) ( ON ?auto_22079 ?auto_22089 ) ( CLEAR ?auto_22079 ) ( not ( = ?auto_22078 ?auto_22089 ) ) ( not ( = ?auto_22079 ?auto_22089 ) ) ( not ( = ?auto_22082 ?auto_22089 ) ) ( not ( = ?auto_22086 ?auto_22089 ) ) ( IS-CRATE ?auto_22086 ) ( not ( = ?auto_22078 ?auto_22101 ) ) ( not ( = ?auto_22079 ?auto_22101 ) ) ( not ( = ?auto_22082 ?auto_22101 ) ) ( not ( = ?auto_22086 ?auto_22101 ) ) ( not ( = ?auto_22089 ?auto_22101 ) ) ( not ( = ?auto_22100 ?auto_22080 ) ) ( not ( = ?auto_22088 ?auto_22100 ) ) ( not ( = ?auto_22092 ?auto_22100 ) ) ( HOIST-AT ?auto_22085 ?auto_22100 ) ( not ( = ?auto_22090 ?auto_22085 ) ) ( not ( = ?auto_22098 ?auto_22085 ) ) ( not ( = ?auto_22096 ?auto_22085 ) ) ( AVAILABLE ?auto_22085 ) ( SURFACE-AT ?auto_22086 ?auto_22100 ) ( ON ?auto_22086 ?auto_22102 ) ( CLEAR ?auto_22086 ) ( not ( = ?auto_22078 ?auto_22102 ) ) ( not ( = ?auto_22079 ?auto_22102 ) ) ( not ( = ?auto_22082 ?auto_22102 ) ) ( not ( = ?auto_22086 ?auto_22102 ) ) ( not ( = ?auto_22089 ?auto_22102 ) ) ( not ( = ?auto_22101 ?auto_22102 ) ) ( IS-CRATE ?auto_22101 ) ( not ( = ?auto_22078 ?auto_22099 ) ) ( not ( = ?auto_22079 ?auto_22099 ) ) ( not ( = ?auto_22082 ?auto_22099 ) ) ( not ( = ?auto_22086 ?auto_22099 ) ) ( not ( = ?auto_22089 ?auto_22099 ) ) ( not ( = ?auto_22101 ?auto_22099 ) ) ( not ( = ?auto_22102 ?auto_22099 ) ) ( not ( = ?auto_22083 ?auto_22080 ) ) ( not ( = ?auto_22088 ?auto_22083 ) ) ( not ( = ?auto_22092 ?auto_22083 ) ) ( not ( = ?auto_22100 ?auto_22083 ) ) ( HOIST-AT ?auto_22097 ?auto_22083 ) ( not ( = ?auto_22090 ?auto_22097 ) ) ( not ( = ?auto_22098 ?auto_22097 ) ) ( not ( = ?auto_22096 ?auto_22097 ) ) ( not ( = ?auto_22085 ?auto_22097 ) ) ( AVAILABLE ?auto_22097 ) ( SURFACE-AT ?auto_22101 ?auto_22083 ) ( ON ?auto_22101 ?auto_22091 ) ( CLEAR ?auto_22101 ) ( not ( = ?auto_22078 ?auto_22091 ) ) ( not ( = ?auto_22079 ?auto_22091 ) ) ( not ( = ?auto_22082 ?auto_22091 ) ) ( not ( = ?auto_22086 ?auto_22091 ) ) ( not ( = ?auto_22089 ?auto_22091 ) ) ( not ( = ?auto_22101 ?auto_22091 ) ) ( not ( = ?auto_22102 ?auto_22091 ) ) ( not ( = ?auto_22099 ?auto_22091 ) ) ( IS-CRATE ?auto_22099 ) ( not ( = ?auto_22078 ?auto_22094 ) ) ( not ( = ?auto_22079 ?auto_22094 ) ) ( not ( = ?auto_22082 ?auto_22094 ) ) ( not ( = ?auto_22086 ?auto_22094 ) ) ( not ( = ?auto_22089 ?auto_22094 ) ) ( not ( = ?auto_22101 ?auto_22094 ) ) ( not ( = ?auto_22102 ?auto_22094 ) ) ( not ( = ?auto_22099 ?auto_22094 ) ) ( not ( = ?auto_22091 ?auto_22094 ) ) ( not ( = ?auto_22093 ?auto_22080 ) ) ( not ( = ?auto_22088 ?auto_22093 ) ) ( not ( = ?auto_22092 ?auto_22093 ) ) ( not ( = ?auto_22100 ?auto_22093 ) ) ( not ( = ?auto_22083 ?auto_22093 ) ) ( HOIST-AT ?auto_22087 ?auto_22093 ) ( not ( = ?auto_22090 ?auto_22087 ) ) ( not ( = ?auto_22098 ?auto_22087 ) ) ( not ( = ?auto_22096 ?auto_22087 ) ) ( not ( = ?auto_22085 ?auto_22087 ) ) ( not ( = ?auto_22097 ?auto_22087 ) ) ( AVAILABLE ?auto_22087 ) ( SURFACE-AT ?auto_22099 ?auto_22093 ) ( ON ?auto_22099 ?auto_22084 ) ( CLEAR ?auto_22099 ) ( not ( = ?auto_22078 ?auto_22084 ) ) ( not ( = ?auto_22079 ?auto_22084 ) ) ( not ( = ?auto_22082 ?auto_22084 ) ) ( not ( = ?auto_22086 ?auto_22084 ) ) ( not ( = ?auto_22089 ?auto_22084 ) ) ( not ( = ?auto_22101 ?auto_22084 ) ) ( not ( = ?auto_22102 ?auto_22084 ) ) ( not ( = ?auto_22099 ?auto_22084 ) ) ( not ( = ?auto_22091 ?auto_22084 ) ) ( not ( = ?auto_22094 ?auto_22084 ) ) ( SURFACE-AT ?auto_22081 ?auto_22080 ) ( CLEAR ?auto_22081 ) ( IS-CRATE ?auto_22094 ) ( not ( = ?auto_22078 ?auto_22081 ) ) ( not ( = ?auto_22079 ?auto_22081 ) ) ( not ( = ?auto_22082 ?auto_22081 ) ) ( not ( = ?auto_22086 ?auto_22081 ) ) ( not ( = ?auto_22089 ?auto_22081 ) ) ( not ( = ?auto_22101 ?auto_22081 ) ) ( not ( = ?auto_22102 ?auto_22081 ) ) ( not ( = ?auto_22099 ?auto_22081 ) ) ( not ( = ?auto_22091 ?auto_22081 ) ) ( not ( = ?auto_22094 ?auto_22081 ) ) ( not ( = ?auto_22084 ?auto_22081 ) ) ( AVAILABLE ?auto_22090 ) ( IN ?auto_22094 ?auto_22095 ) ( TRUCK-AT ?auto_22095 ?auto_22103 ) ( not ( = ?auto_22103 ?auto_22080 ) ) ( not ( = ?auto_22088 ?auto_22103 ) ) ( not ( = ?auto_22092 ?auto_22103 ) ) ( not ( = ?auto_22100 ?auto_22103 ) ) ( not ( = ?auto_22083 ?auto_22103 ) ) ( not ( = ?auto_22093 ?auto_22103 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22095 ?auto_22103 ?auto_22080 )
      ( MAKE-ON ?auto_22078 ?auto_22079 )
      ( MAKE-ON-VERIFY ?auto_22078 ?auto_22079 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22104 - SURFACE
      ?auto_22105 - SURFACE
    )
    :vars
    (
      ?auto_22112 - HOIST
      ?auto_22122 - PLACE
      ?auto_22124 - PLACE
      ?auto_22118 - HOIST
      ?auto_22127 - SURFACE
      ?auto_22117 - SURFACE
      ?auto_22126 - PLACE
      ?auto_22128 - HOIST
      ?auto_22113 - SURFACE
      ?auto_22121 - SURFACE
      ?auto_22120 - PLACE
      ?auto_22109 - HOIST
      ?auto_22115 - SURFACE
      ?auto_22119 - SURFACE
      ?auto_22125 - PLACE
      ?auto_22129 - HOIST
      ?auto_22114 - SURFACE
      ?auto_22108 - SURFACE
      ?auto_22110 - PLACE
      ?auto_22106 - HOIST
      ?auto_22111 - SURFACE
      ?auto_22107 - SURFACE
      ?auto_22116 - TRUCK
      ?auto_22123 - PLACE
      ?auto_22130 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22112 ?auto_22122 ) ( IS-CRATE ?auto_22104 ) ( not ( = ?auto_22104 ?auto_22105 ) ) ( not ( = ?auto_22124 ?auto_22122 ) ) ( HOIST-AT ?auto_22118 ?auto_22124 ) ( not ( = ?auto_22112 ?auto_22118 ) ) ( AVAILABLE ?auto_22118 ) ( SURFACE-AT ?auto_22104 ?auto_22124 ) ( ON ?auto_22104 ?auto_22127 ) ( CLEAR ?auto_22104 ) ( not ( = ?auto_22104 ?auto_22127 ) ) ( not ( = ?auto_22105 ?auto_22127 ) ) ( IS-CRATE ?auto_22105 ) ( not ( = ?auto_22104 ?auto_22117 ) ) ( not ( = ?auto_22105 ?auto_22117 ) ) ( not ( = ?auto_22127 ?auto_22117 ) ) ( not ( = ?auto_22126 ?auto_22122 ) ) ( not ( = ?auto_22124 ?auto_22126 ) ) ( HOIST-AT ?auto_22128 ?auto_22126 ) ( not ( = ?auto_22112 ?auto_22128 ) ) ( not ( = ?auto_22118 ?auto_22128 ) ) ( AVAILABLE ?auto_22128 ) ( SURFACE-AT ?auto_22105 ?auto_22126 ) ( ON ?auto_22105 ?auto_22113 ) ( CLEAR ?auto_22105 ) ( not ( = ?auto_22104 ?auto_22113 ) ) ( not ( = ?auto_22105 ?auto_22113 ) ) ( not ( = ?auto_22127 ?auto_22113 ) ) ( not ( = ?auto_22117 ?auto_22113 ) ) ( IS-CRATE ?auto_22117 ) ( not ( = ?auto_22104 ?auto_22121 ) ) ( not ( = ?auto_22105 ?auto_22121 ) ) ( not ( = ?auto_22127 ?auto_22121 ) ) ( not ( = ?auto_22117 ?auto_22121 ) ) ( not ( = ?auto_22113 ?auto_22121 ) ) ( not ( = ?auto_22120 ?auto_22122 ) ) ( not ( = ?auto_22124 ?auto_22120 ) ) ( not ( = ?auto_22126 ?auto_22120 ) ) ( HOIST-AT ?auto_22109 ?auto_22120 ) ( not ( = ?auto_22112 ?auto_22109 ) ) ( not ( = ?auto_22118 ?auto_22109 ) ) ( not ( = ?auto_22128 ?auto_22109 ) ) ( AVAILABLE ?auto_22109 ) ( SURFACE-AT ?auto_22117 ?auto_22120 ) ( ON ?auto_22117 ?auto_22115 ) ( CLEAR ?auto_22117 ) ( not ( = ?auto_22104 ?auto_22115 ) ) ( not ( = ?auto_22105 ?auto_22115 ) ) ( not ( = ?auto_22127 ?auto_22115 ) ) ( not ( = ?auto_22117 ?auto_22115 ) ) ( not ( = ?auto_22113 ?auto_22115 ) ) ( not ( = ?auto_22121 ?auto_22115 ) ) ( IS-CRATE ?auto_22121 ) ( not ( = ?auto_22104 ?auto_22119 ) ) ( not ( = ?auto_22105 ?auto_22119 ) ) ( not ( = ?auto_22127 ?auto_22119 ) ) ( not ( = ?auto_22117 ?auto_22119 ) ) ( not ( = ?auto_22113 ?auto_22119 ) ) ( not ( = ?auto_22121 ?auto_22119 ) ) ( not ( = ?auto_22115 ?auto_22119 ) ) ( not ( = ?auto_22125 ?auto_22122 ) ) ( not ( = ?auto_22124 ?auto_22125 ) ) ( not ( = ?auto_22126 ?auto_22125 ) ) ( not ( = ?auto_22120 ?auto_22125 ) ) ( HOIST-AT ?auto_22129 ?auto_22125 ) ( not ( = ?auto_22112 ?auto_22129 ) ) ( not ( = ?auto_22118 ?auto_22129 ) ) ( not ( = ?auto_22128 ?auto_22129 ) ) ( not ( = ?auto_22109 ?auto_22129 ) ) ( AVAILABLE ?auto_22129 ) ( SURFACE-AT ?auto_22121 ?auto_22125 ) ( ON ?auto_22121 ?auto_22114 ) ( CLEAR ?auto_22121 ) ( not ( = ?auto_22104 ?auto_22114 ) ) ( not ( = ?auto_22105 ?auto_22114 ) ) ( not ( = ?auto_22127 ?auto_22114 ) ) ( not ( = ?auto_22117 ?auto_22114 ) ) ( not ( = ?auto_22113 ?auto_22114 ) ) ( not ( = ?auto_22121 ?auto_22114 ) ) ( not ( = ?auto_22115 ?auto_22114 ) ) ( not ( = ?auto_22119 ?auto_22114 ) ) ( IS-CRATE ?auto_22119 ) ( not ( = ?auto_22104 ?auto_22108 ) ) ( not ( = ?auto_22105 ?auto_22108 ) ) ( not ( = ?auto_22127 ?auto_22108 ) ) ( not ( = ?auto_22117 ?auto_22108 ) ) ( not ( = ?auto_22113 ?auto_22108 ) ) ( not ( = ?auto_22121 ?auto_22108 ) ) ( not ( = ?auto_22115 ?auto_22108 ) ) ( not ( = ?auto_22119 ?auto_22108 ) ) ( not ( = ?auto_22114 ?auto_22108 ) ) ( not ( = ?auto_22110 ?auto_22122 ) ) ( not ( = ?auto_22124 ?auto_22110 ) ) ( not ( = ?auto_22126 ?auto_22110 ) ) ( not ( = ?auto_22120 ?auto_22110 ) ) ( not ( = ?auto_22125 ?auto_22110 ) ) ( HOIST-AT ?auto_22106 ?auto_22110 ) ( not ( = ?auto_22112 ?auto_22106 ) ) ( not ( = ?auto_22118 ?auto_22106 ) ) ( not ( = ?auto_22128 ?auto_22106 ) ) ( not ( = ?auto_22109 ?auto_22106 ) ) ( not ( = ?auto_22129 ?auto_22106 ) ) ( AVAILABLE ?auto_22106 ) ( SURFACE-AT ?auto_22119 ?auto_22110 ) ( ON ?auto_22119 ?auto_22111 ) ( CLEAR ?auto_22119 ) ( not ( = ?auto_22104 ?auto_22111 ) ) ( not ( = ?auto_22105 ?auto_22111 ) ) ( not ( = ?auto_22127 ?auto_22111 ) ) ( not ( = ?auto_22117 ?auto_22111 ) ) ( not ( = ?auto_22113 ?auto_22111 ) ) ( not ( = ?auto_22121 ?auto_22111 ) ) ( not ( = ?auto_22115 ?auto_22111 ) ) ( not ( = ?auto_22119 ?auto_22111 ) ) ( not ( = ?auto_22114 ?auto_22111 ) ) ( not ( = ?auto_22108 ?auto_22111 ) ) ( SURFACE-AT ?auto_22107 ?auto_22122 ) ( CLEAR ?auto_22107 ) ( IS-CRATE ?auto_22108 ) ( not ( = ?auto_22104 ?auto_22107 ) ) ( not ( = ?auto_22105 ?auto_22107 ) ) ( not ( = ?auto_22127 ?auto_22107 ) ) ( not ( = ?auto_22117 ?auto_22107 ) ) ( not ( = ?auto_22113 ?auto_22107 ) ) ( not ( = ?auto_22121 ?auto_22107 ) ) ( not ( = ?auto_22115 ?auto_22107 ) ) ( not ( = ?auto_22119 ?auto_22107 ) ) ( not ( = ?auto_22114 ?auto_22107 ) ) ( not ( = ?auto_22108 ?auto_22107 ) ) ( not ( = ?auto_22111 ?auto_22107 ) ) ( AVAILABLE ?auto_22112 ) ( TRUCK-AT ?auto_22116 ?auto_22123 ) ( not ( = ?auto_22123 ?auto_22122 ) ) ( not ( = ?auto_22124 ?auto_22123 ) ) ( not ( = ?auto_22126 ?auto_22123 ) ) ( not ( = ?auto_22120 ?auto_22123 ) ) ( not ( = ?auto_22125 ?auto_22123 ) ) ( not ( = ?auto_22110 ?auto_22123 ) ) ( HOIST-AT ?auto_22130 ?auto_22123 ) ( LIFTING ?auto_22130 ?auto_22108 ) ( not ( = ?auto_22112 ?auto_22130 ) ) ( not ( = ?auto_22118 ?auto_22130 ) ) ( not ( = ?auto_22128 ?auto_22130 ) ) ( not ( = ?auto_22109 ?auto_22130 ) ) ( not ( = ?auto_22129 ?auto_22130 ) ) ( not ( = ?auto_22106 ?auto_22130 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22130 ?auto_22108 ?auto_22116 ?auto_22123 )
      ( MAKE-ON ?auto_22104 ?auto_22105 )
      ( MAKE-ON-VERIFY ?auto_22104 ?auto_22105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22131 - SURFACE
      ?auto_22132 - SURFACE
    )
    :vars
    (
      ?auto_22133 - HOIST
      ?auto_22134 - PLACE
      ?auto_22137 - PLACE
      ?auto_22152 - HOIST
      ?auto_22140 - SURFACE
      ?auto_22151 - SURFACE
      ?auto_22139 - PLACE
      ?auto_22141 - HOIST
      ?auto_22145 - SURFACE
      ?auto_22142 - SURFACE
      ?auto_22156 - PLACE
      ?auto_22147 - HOIST
      ?auto_22153 - SURFACE
      ?auto_22135 - SURFACE
      ?auto_22138 - PLACE
      ?auto_22136 - HOIST
      ?auto_22143 - SURFACE
      ?auto_22146 - SURFACE
      ?auto_22149 - PLACE
      ?auto_22155 - HOIST
      ?auto_22144 - SURFACE
      ?auto_22148 - SURFACE
      ?auto_22150 - TRUCK
      ?auto_22154 - PLACE
      ?auto_22157 - HOIST
      ?auto_22158 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22133 ?auto_22134 ) ( IS-CRATE ?auto_22131 ) ( not ( = ?auto_22131 ?auto_22132 ) ) ( not ( = ?auto_22137 ?auto_22134 ) ) ( HOIST-AT ?auto_22152 ?auto_22137 ) ( not ( = ?auto_22133 ?auto_22152 ) ) ( AVAILABLE ?auto_22152 ) ( SURFACE-AT ?auto_22131 ?auto_22137 ) ( ON ?auto_22131 ?auto_22140 ) ( CLEAR ?auto_22131 ) ( not ( = ?auto_22131 ?auto_22140 ) ) ( not ( = ?auto_22132 ?auto_22140 ) ) ( IS-CRATE ?auto_22132 ) ( not ( = ?auto_22131 ?auto_22151 ) ) ( not ( = ?auto_22132 ?auto_22151 ) ) ( not ( = ?auto_22140 ?auto_22151 ) ) ( not ( = ?auto_22139 ?auto_22134 ) ) ( not ( = ?auto_22137 ?auto_22139 ) ) ( HOIST-AT ?auto_22141 ?auto_22139 ) ( not ( = ?auto_22133 ?auto_22141 ) ) ( not ( = ?auto_22152 ?auto_22141 ) ) ( AVAILABLE ?auto_22141 ) ( SURFACE-AT ?auto_22132 ?auto_22139 ) ( ON ?auto_22132 ?auto_22145 ) ( CLEAR ?auto_22132 ) ( not ( = ?auto_22131 ?auto_22145 ) ) ( not ( = ?auto_22132 ?auto_22145 ) ) ( not ( = ?auto_22140 ?auto_22145 ) ) ( not ( = ?auto_22151 ?auto_22145 ) ) ( IS-CRATE ?auto_22151 ) ( not ( = ?auto_22131 ?auto_22142 ) ) ( not ( = ?auto_22132 ?auto_22142 ) ) ( not ( = ?auto_22140 ?auto_22142 ) ) ( not ( = ?auto_22151 ?auto_22142 ) ) ( not ( = ?auto_22145 ?auto_22142 ) ) ( not ( = ?auto_22156 ?auto_22134 ) ) ( not ( = ?auto_22137 ?auto_22156 ) ) ( not ( = ?auto_22139 ?auto_22156 ) ) ( HOIST-AT ?auto_22147 ?auto_22156 ) ( not ( = ?auto_22133 ?auto_22147 ) ) ( not ( = ?auto_22152 ?auto_22147 ) ) ( not ( = ?auto_22141 ?auto_22147 ) ) ( AVAILABLE ?auto_22147 ) ( SURFACE-AT ?auto_22151 ?auto_22156 ) ( ON ?auto_22151 ?auto_22153 ) ( CLEAR ?auto_22151 ) ( not ( = ?auto_22131 ?auto_22153 ) ) ( not ( = ?auto_22132 ?auto_22153 ) ) ( not ( = ?auto_22140 ?auto_22153 ) ) ( not ( = ?auto_22151 ?auto_22153 ) ) ( not ( = ?auto_22145 ?auto_22153 ) ) ( not ( = ?auto_22142 ?auto_22153 ) ) ( IS-CRATE ?auto_22142 ) ( not ( = ?auto_22131 ?auto_22135 ) ) ( not ( = ?auto_22132 ?auto_22135 ) ) ( not ( = ?auto_22140 ?auto_22135 ) ) ( not ( = ?auto_22151 ?auto_22135 ) ) ( not ( = ?auto_22145 ?auto_22135 ) ) ( not ( = ?auto_22142 ?auto_22135 ) ) ( not ( = ?auto_22153 ?auto_22135 ) ) ( not ( = ?auto_22138 ?auto_22134 ) ) ( not ( = ?auto_22137 ?auto_22138 ) ) ( not ( = ?auto_22139 ?auto_22138 ) ) ( not ( = ?auto_22156 ?auto_22138 ) ) ( HOIST-AT ?auto_22136 ?auto_22138 ) ( not ( = ?auto_22133 ?auto_22136 ) ) ( not ( = ?auto_22152 ?auto_22136 ) ) ( not ( = ?auto_22141 ?auto_22136 ) ) ( not ( = ?auto_22147 ?auto_22136 ) ) ( AVAILABLE ?auto_22136 ) ( SURFACE-AT ?auto_22142 ?auto_22138 ) ( ON ?auto_22142 ?auto_22143 ) ( CLEAR ?auto_22142 ) ( not ( = ?auto_22131 ?auto_22143 ) ) ( not ( = ?auto_22132 ?auto_22143 ) ) ( not ( = ?auto_22140 ?auto_22143 ) ) ( not ( = ?auto_22151 ?auto_22143 ) ) ( not ( = ?auto_22145 ?auto_22143 ) ) ( not ( = ?auto_22142 ?auto_22143 ) ) ( not ( = ?auto_22153 ?auto_22143 ) ) ( not ( = ?auto_22135 ?auto_22143 ) ) ( IS-CRATE ?auto_22135 ) ( not ( = ?auto_22131 ?auto_22146 ) ) ( not ( = ?auto_22132 ?auto_22146 ) ) ( not ( = ?auto_22140 ?auto_22146 ) ) ( not ( = ?auto_22151 ?auto_22146 ) ) ( not ( = ?auto_22145 ?auto_22146 ) ) ( not ( = ?auto_22142 ?auto_22146 ) ) ( not ( = ?auto_22153 ?auto_22146 ) ) ( not ( = ?auto_22135 ?auto_22146 ) ) ( not ( = ?auto_22143 ?auto_22146 ) ) ( not ( = ?auto_22149 ?auto_22134 ) ) ( not ( = ?auto_22137 ?auto_22149 ) ) ( not ( = ?auto_22139 ?auto_22149 ) ) ( not ( = ?auto_22156 ?auto_22149 ) ) ( not ( = ?auto_22138 ?auto_22149 ) ) ( HOIST-AT ?auto_22155 ?auto_22149 ) ( not ( = ?auto_22133 ?auto_22155 ) ) ( not ( = ?auto_22152 ?auto_22155 ) ) ( not ( = ?auto_22141 ?auto_22155 ) ) ( not ( = ?auto_22147 ?auto_22155 ) ) ( not ( = ?auto_22136 ?auto_22155 ) ) ( AVAILABLE ?auto_22155 ) ( SURFACE-AT ?auto_22135 ?auto_22149 ) ( ON ?auto_22135 ?auto_22144 ) ( CLEAR ?auto_22135 ) ( not ( = ?auto_22131 ?auto_22144 ) ) ( not ( = ?auto_22132 ?auto_22144 ) ) ( not ( = ?auto_22140 ?auto_22144 ) ) ( not ( = ?auto_22151 ?auto_22144 ) ) ( not ( = ?auto_22145 ?auto_22144 ) ) ( not ( = ?auto_22142 ?auto_22144 ) ) ( not ( = ?auto_22153 ?auto_22144 ) ) ( not ( = ?auto_22135 ?auto_22144 ) ) ( not ( = ?auto_22143 ?auto_22144 ) ) ( not ( = ?auto_22146 ?auto_22144 ) ) ( SURFACE-AT ?auto_22148 ?auto_22134 ) ( CLEAR ?auto_22148 ) ( IS-CRATE ?auto_22146 ) ( not ( = ?auto_22131 ?auto_22148 ) ) ( not ( = ?auto_22132 ?auto_22148 ) ) ( not ( = ?auto_22140 ?auto_22148 ) ) ( not ( = ?auto_22151 ?auto_22148 ) ) ( not ( = ?auto_22145 ?auto_22148 ) ) ( not ( = ?auto_22142 ?auto_22148 ) ) ( not ( = ?auto_22153 ?auto_22148 ) ) ( not ( = ?auto_22135 ?auto_22148 ) ) ( not ( = ?auto_22143 ?auto_22148 ) ) ( not ( = ?auto_22146 ?auto_22148 ) ) ( not ( = ?auto_22144 ?auto_22148 ) ) ( AVAILABLE ?auto_22133 ) ( TRUCK-AT ?auto_22150 ?auto_22154 ) ( not ( = ?auto_22154 ?auto_22134 ) ) ( not ( = ?auto_22137 ?auto_22154 ) ) ( not ( = ?auto_22139 ?auto_22154 ) ) ( not ( = ?auto_22156 ?auto_22154 ) ) ( not ( = ?auto_22138 ?auto_22154 ) ) ( not ( = ?auto_22149 ?auto_22154 ) ) ( HOIST-AT ?auto_22157 ?auto_22154 ) ( not ( = ?auto_22133 ?auto_22157 ) ) ( not ( = ?auto_22152 ?auto_22157 ) ) ( not ( = ?auto_22141 ?auto_22157 ) ) ( not ( = ?auto_22147 ?auto_22157 ) ) ( not ( = ?auto_22136 ?auto_22157 ) ) ( not ( = ?auto_22155 ?auto_22157 ) ) ( AVAILABLE ?auto_22157 ) ( SURFACE-AT ?auto_22146 ?auto_22154 ) ( ON ?auto_22146 ?auto_22158 ) ( CLEAR ?auto_22146 ) ( not ( = ?auto_22131 ?auto_22158 ) ) ( not ( = ?auto_22132 ?auto_22158 ) ) ( not ( = ?auto_22140 ?auto_22158 ) ) ( not ( = ?auto_22151 ?auto_22158 ) ) ( not ( = ?auto_22145 ?auto_22158 ) ) ( not ( = ?auto_22142 ?auto_22158 ) ) ( not ( = ?auto_22153 ?auto_22158 ) ) ( not ( = ?auto_22135 ?auto_22158 ) ) ( not ( = ?auto_22143 ?auto_22158 ) ) ( not ( = ?auto_22146 ?auto_22158 ) ) ( not ( = ?auto_22144 ?auto_22158 ) ) ( not ( = ?auto_22148 ?auto_22158 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22157 ?auto_22146 ?auto_22158 ?auto_22154 )
      ( MAKE-ON ?auto_22131 ?auto_22132 )
      ( MAKE-ON-VERIFY ?auto_22131 ?auto_22132 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22159 - SURFACE
      ?auto_22160 - SURFACE
    )
    :vars
    (
      ?auto_22180 - HOIST
      ?auto_22172 - PLACE
      ?auto_22183 - PLACE
      ?auto_22168 - HOIST
      ?auto_22162 - SURFACE
      ?auto_22166 - SURFACE
      ?auto_22176 - PLACE
      ?auto_22164 - HOIST
      ?auto_22170 - SURFACE
      ?auto_22181 - SURFACE
      ?auto_22169 - PLACE
      ?auto_22175 - HOIST
      ?auto_22173 - SURFACE
      ?auto_22182 - SURFACE
      ?auto_22163 - PLACE
      ?auto_22184 - HOIST
      ?auto_22178 - SURFACE
      ?auto_22171 - SURFACE
      ?auto_22161 - PLACE
      ?auto_22185 - HOIST
      ?auto_22179 - SURFACE
      ?auto_22186 - SURFACE
      ?auto_22174 - PLACE
      ?auto_22165 - HOIST
      ?auto_22177 - SURFACE
      ?auto_22167 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22180 ?auto_22172 ) ( IS-CRATE ?auto_22159 ) ( not ( = ?auto_22159 ?auto_22160 ) ) ( not ( = ?auto_22183 ?auto_22172 ) ) ( HOIST-AT ?auto_22168 ?auto_22183 ) ( not ( = ?auto_22180 ?auto_22168 ) ) ( AVAILABLE ?auto_22168 ) ( SURFACE-AT ?auto_22159 ?auto_22183 ) ( ON ?auto_22159 ?auto_22162 ) ( CLEAR ?auto_22159 ) ( not ( = ?auto_22159 ?auto_22162 ) ) ( not ( = ?auto_22160 ?auto_22162 ) ) ( IS-CRATE ?auto_22160 ) ( not ( = ?auto_22159 ?auto_22166 ) ) ( not ( = ?auto_22160 ?auto_22166 ) ) ( not ( = ?auto_22162 ?auto_22166 ) ) ( not ( = ?auto_22176 ?auto_22172 ) ) ( not ( = ?auto_22183 ?auto_22176 ) ) ( HOIST-AT ?auto_22164 ?auto_22176 ) ( not ( = ?auto_22180 ?auto_22164 ) ) ( not ( = ?auto_22168 ?auto_22164 ) ) ( AVAILABLE ?auto_22164 ) ( SURFACE-AT ?auto_22160 ?auto_22176 ) ( ON ?auto_22160 ?auto_22170 ) ( CLEAR ?auto_22160 ) ( not ( = ?auto_22159 ?auto_22170 ) ) ( not ( = ?auto_22160 ?auto_22170 ) ) ( not ( = ?auto_22162 ?auto_22170 ) ) ( not ( = ?auto_22166 ?auto_22170 ) ) ( IS-CRATE ?auto_22166 ) ( not ( = ?auto_22159 ?auto_22181 ) ) ( not ( = ?auto_22160 ?auto_22181 ) ) ( not ( = ?auto_22162 ?auto_22181 ) ) ( not ( = ?auto_22166 ?auto_22181 ) ) ( not ( = ?auto_22170 ?auto_22181 ) ) ( not ( = ?auto_22169 ?auto_22172 ) ) ( not ( = ?auto_22183 ?auto_22169 ) ) ( not ( = ?auto_22176 ?auto_22169 ) ) ( HOIST-AT ?auto_22175 ?auto_22169 ) ( not ( = ?auto_22180 ?auto_22175 ) ) ( not ( = ?auto_22168 ?auto_22175 ) ) ( not ( = ?auto_22164 ?auto_22175 ) ) ( AVAILABLE ?auto_22175 ) ( SURFACE-AT ?auto_22166 ?auto_22169 ) ( ON ?auto_22166 ?auto_22173 ) ( CLEAR ?auto_22166 ) ( not ( = ?auto_22159 ?auto_22173 ) ) ( not ( = ?auto_22160 ?auto_22173 ) ) ( not ( = ?auto_22162 ?auto_22173 ) ) ( not ( = ?auto_22166 ?auto_22173 ) ) ( not ( = ?auto_22170 ?auto_22173 ) ) ( not ( = ?auto_22181 ?auto_22173 ) ) ( IS-CRATE ?auto_22181 ) ( not ( = ?auto_22159 ?auto_22182 ) ) ( not ( = ?auto_22160 ?auto_22182 ) ) ( not ( = ?auto_22162 ?auto_22182 ) ) ( not ( = ?auto_22166 ?auto_22182 ) ) ( not ( = ?auto_22170 ?auto_22182 ) ) ( not ( = ?auto_22181 ?auto_22182 ) ) ( not ( = ?auto_22173 ?auto_22182 ) ) ( not ( = ?auto_22163 ?auto_22172 ) ) ( not ( = ?auto_22183 ?auto_22163 ) ) ( not ( = ?auto_22176 ?auto_22163 ) ) ( not ( = ?auto_22169 ?auto_22163 ) ) ( HOIST-AT ?auto_22184 ?auto_22163 ) ( not ( = ?auto_22180 ?auto_22184 ) ) ( not ( = ?auto_22168 ?auto_22184 ) ) ( not ( = ?auto_22164 ?auto_22184 ) ) ( not ( = ?auto_22175 ?auto_22184 ) ) ( AVAILABLE ?auto_22184 ) ( SURFACE-AT ?auto_22181 ?auto_22163 ) ( ON ?auto_22181 ?auto_22178 ) ( CLEAR ?auto_22181 ) ( not ( = ?auto_22159 ?auto_22178 ) ) ( not ( = ?auto_22160 ?auto_22178 ) ) ( not ( = ?auto_22162 ?auto_22178 ) ) ( not ( = ?auto_22166 ?auto_22178 ) ) ( not ( = ?auto_22170 ?auto_22178 ) ) ( not ( = ?auto_22181 ?auto_22178 ) ) ( not ( = ?auto_22173 ?auto_22178 ) ) ( not ( = ?auto_22182 ?auto_22178 ) ) ( IS-CRATE ?auto_22182 ) ( not ( = ?auto_22159 ?auto_22171 ) ) ( not ( = ?auto_22160 ?auto_22171 ) ) ( not ( = ?auto_22162 ?auto_22171 ) ) ( not ( = ?auto_22166 ?auto_22171 ) ) ( not ( = ?auto_22170 ?auto_22171 ) ) ( not ( = ?auto_22181 ?auto_22171 ) ) ( not ( = ?auto_22173 ?auto_22171 ) ) ( not ( = ?auto_22182 ?auto_22171 ) ) ( not ( = ?auto_22178 ?auto_22171 ) ) ( not ( = ?auto_22161 ?auto_22172 ) ) ( not ( = ?auto_22183 ?auto_22161 ) ) ( not ( = ?auto_22176 ?auto_22161 ) ) ( not ( = ?auto_22169 ?auto_22161 ) ) ( not ( = ?auto_22163 ?auto_22161 ) ) ( HOIST-AT ?auto_22185 ?auto_22161 ) ( not ( = ?auto_22180 ?auto_22185 ) ) ( not ( = ?auto_22168 ?auto_22185 ) ) ( not ( = ?auto_22164 ?auto_22185 ) ) ( not ( = ?auto_22175 ?auto_22185 ) ) ( not ( = ?auto_22184 ?auto_22185 ) ) ( AVAILABLE ?auto_22185 ) ( SURFACE-AT ?auto_22182 ?auto_22161 ) ( ON ?auto_22182 ?auto_22179 ) ( CLEAR ?auto_22182 ) ( not ( = ?auto_22159 ?auto_22179 ) ) ( not ( = ?auto_22160 ?auto_22179 ) ) ( not ( = ?auto_22162 ?auto_22179 ) ) ( not ( = ?auto_22166 ?auto_22179 ) ) ( not ( = ?auto_22170 ?auto_22179 ) ) ( not ( = ?auto_22181 ?auto_22179 ) ) ( not ( = ?auto_22173 ?auto_22179 ) ) ( not ( = ?auto_22182 ?auto_22179 ) ) ( not ( = ?auto_22178 ?auto_22179 ) ) ( not ( = ?auto_22171 ?auto_22179 ) ) ( SURFACE-AT ?auto_22186 ?auto_22172 ) ( CLEAR ?auto_22186 ) ( IS-CRATE ?auto_22171 ) ( not ( = ?auto_22159 ?auto_22186 ) ) ( not ( = ?auto_22160 ?auto_22186 ) ) ( not ( = ?auto_22162 ?auto_22186 ) ) ( not ( = ?auto_22166 ?auto_22186 ) ) ( not ( = ?auto_22170 ?auto_22186 ) ) ( not ( = ?auto_22181 ?auto_22186 ) ) ( not ( = ?auto_22173 ?auto_22186 ) ) ( not ( = ?auto_22182 ?auto_22186 ) ) ( not ( = ?auto_22178 ?auto_22186 ) ) ( not ( = ?auto_22171 ?auto_22186 ) ) ( not ( = ?auto_22179 ?auto_22186 ) ) ( AVAILABLE ?auto_22180 ) ( not ( = ?auto_22174 ?auto_22172 ) ) ( not ( = ?auto_22183 ?auto_22174 ) ) ( not ( = ?auto_22176 ?auto_22174 ) ) ( not ( = ?auto_22169 ?auto_22174 ) ) ( not ( = ?auto_22163 ?auto_22174 ) ) ( not ( = ?auto_22161 ?auto_22174 ) ) ( HOIST-AT ?auto_22165 ?auto_22174 ) ( not ( = ?auto_22180 ?auto_22165 ) ) ( not ( = ?auto_22168 ?auto_22165 ) ) ( not ( = ?auto_22164 ?auto_22165 ) ) ( not ( = ?auto_22175 ?auto_22165 ) ) ( not ( = ?auto_22184 ?auto_22165 ) ) ( not ( = ?auto_22185 ?auto_22165 ) ) ( AVAILABLE ?auto_22165 ) ( SURFACE-AT ?auto_22171 ?auto_22174 ) ( ON ?auto_22171 ?auto_22177 ) ( CLEAR ?auto_22171 ) ( not ( = ?auto_22159 ?auto_22177 ) ) ( not ( = ?auto_22160 ?auto_22177 ) ) ( not ( = ?auto_22162 ?auto_22177 ) ) ( not ( = ?auto_22166 ?auto_22177 ) ) ( not ( = ?auto_22170 ?auto_22177 ) ) ( not ( = ?auto_22181 ?auto_22177 ) ) ( not ( = ?auto_22173 ?auto_22177 ) ) ( not ( = ?auto_22182 ?auto_22177 ) ) ( not ( = ?auto_22178 ?auto_22177 ) ) ( not ( = ?auto_22171 ?auto_22177 ) ) ( not ( = ?auto_22179 ?auto_22177 ) ) ( not ( = ?auto_22186 ?auto_22177 ) ) ( TRUCK-AT ?auto_22167 ?auto_22172 ) )
    :subtasks
    ( ( !DRIVE ?auto_22167 ?auto_22172 ?auto_22174 )
      ( MAKE-ON ?auto_22159 ?auto_22160 )
      ( MAKE-ON-VERIFY ?auto_22159 ?auto_22160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22189 - SURFACE
      ?auto_22190 - SURFACE
    )
    :vars
    (
      ?auto_22191 - HOIST
      ?auto_22192 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22191 ?auto_22192 ) ( SURFACE-AT ?auto_22190 ?auto_22192 ) ( CLEAR ?auto_22190 ) ( LIFTING ?auto_22191 ?auto_22189 ) ( IS-CRATE ?auto_22189 ) ( not ( = ?auto_22189 ?auto_22190 ) ) )
    :subtasks
    ( ( !DROP ?auto_22191 ?auto_22189 ?auto_22190 ?auto_22192 )
      ( MAKE-ON-VERIFY ?auto_22189 ?auto_22190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22193 - SURFACE
      ?auto_22194 - SURFACE
    )
    :vars
    (
      ?auto_22196 - HOIST
      ?auto_22195 - PLACE
      ?auto_22197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22196 ?auto_22195 ) ( SURFACE-AT ?auto_22194 ?auto_22195 ) ( CLEAR ?auto_22194 ) ( IS-CRATE ?auto_22193 ) ( not ( = ?auto_22193 ?auto_22194 ) ) ( TRUCK-AT ?auto_22197 ?auto_22195 ) ( AVAILABLE ?auto_22196 ) ( IN ?auto_22193 ?auto_22197 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22196 ?auto_22193 ?auto_22197 ?auto_22195 )
      ( MAKE-ON ?auto_22193 ?auto_22194 )
      ( MAKE-ON-VERIFY ?auto_22193 ?auto_22194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22198 - SURFACE
      ?auto_22199 - SURFACE
    )
    :vars
    (
      ?auto_22201 - HOIST
      ?auto_22200 - PLACE
      ?auto_22202 - TRUCK
      ?auto_22203 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22201 ?auto_22200 ) ( SURFACE-AT ?auto_22199 ?auto_22200 ) ( CLEAR ?auto_22199 ) ( IS-CRATE ?auto_22198 ) ( not ( = ?auto_22198 ?auto_22199 ) ) ( AVAILABLE ?auto_22201 ) ( IN ?auto_22198 ?auto_22202 ) ( TRUCK-AT ?auto_22202 ?auto_22203 ) ( not ( = ?auto_22203 ?auto_22200 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22202 ?auto_22203 ?auto_22200 )
      ( MAKE-ON ?auto_22198 ?auto_22199 )
      ( MAKE-ON-VERIFY ?auto_22198 ?auto_22199 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22204 - SURFACE
      ?auto_22205 - SURFACE
    )
    :vars
    (
      ?auto_22208 - HOIST
      ?auto_22207 - PLACE
      ?auto_22209 - TRUCK
      ?auto_22206 - PLACE
      ?auto_22210 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22208 ?auto_22207 ) ( SURFACE-AT ?auto_22205 ?auto_22207 ) ( CLEAR ?auto_22205 ) ( IS-CRATE ?auto_22204 ) ( not ( = ?auto_22204 ?auto_22205 ) ) ( AVAILABLE ?auto_22208 ) ( TRUCK-AT ?auto_22209 ?auto_22206 ) ( not ( = ?auto_22206 ?auto_22207 ) ) ( HOIST-AT ?auto_22210 ?auto_22206 ) ( LIFTING ?auto_22210 ?auto_22204 ) ( not ( = ?auto_22208 ?auto_22210 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22210 ?auto_22204 ?auto_22209 ?auto_22206 )
      ( MAKE-ON ?auto_22204 ?auto_22205 )
      ( MAKE-ON-VERIFY ?auto_22204 ?auto_22205 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22211 - SURFACE
      ?auto_22212 - SURFACE
    )
    :vars
    (
      ?auto_22214 - HOIST
      ?auto_22213 - PLACE
      ?auto_22216 - TRUCK
      ?auto_22215 - PLACE
      ?auto_22217 - HOIST
      ?auto_22218 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22214 ?auto_22213 ) ( SURFACE-AT ?auto_22212 ?auto_22213 ) ( CLEAR ?auto_22212 ) ( IS-CRATE ?auto_22211 ) ( not ( = ?auto_22211 ?auto_22212 ) ) ( AVAILABLE ?auto_22214 ) ( TRUCK-AT ?auto_22216 ?auto_22215 ) ( not ( = ?auto_22215 ?auto_22213 ) ) ( HOIST-AT ?auto_22217 ?auto_22215 ) ( not ( = ?auto_22214 ?auto_22217 ) ) ( AVAILABLE ?auto_22217 ) ( SURFACE-AT ?auto_22211 ?auto_22215 ) ( ON ?auto_22211 ?auto_22218 ) ( CLEAR ?auto_22211 ) ( not ( = ?auto_22211 ?auto_22218 ) ) ( not ( = ?auto_22212 ?auto_22218 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22217 ?auto_22211 ?auto_22218 ?auto_22215 )
      ( MAKE-ON ?auto_22211 ?auto_22212 )
      ( MAKE-ON-VERIFY ?auto_22211 ?auto_22212 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22219 - SURFACE
      ?auto_22220 - SURFACE
    )
    :vars
    (
      ?auto_22223 - HOIST
      ?auto_22221 - PLACE
      ?auto_22226 - PLACE
      ?auto_22224 - HOIST
      ?auto_22222 - SURFACE
      ?auto_22225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22223 ?auto_22221 ) ( SURFACE-AT ?auto_22220 ?auto_22221 ) ( CLEAR ?auto_22220 ) ( IS-CRATE ?auto_22219 ) ( not ( = ?auto_22219 ?auto_22220 ) ) ( AVAILABLE ?auto_22223 ) ( not ( = ?auto_22226 ?auto_22221 ) ) ( HOIST-AT ?auto_22224 ?auto_22226 ) ( not ( = ?auto_22223 ?auto_22224 ) ) ( AVAILABLE ?auto_22224 ) ( SURFACE-AT ?auto_22219 ?auto_22226 ) ( ON ?auto_22219 ?auto_22222 ) ( CLEAR ?auto_22219 ) ( not ( = ?auto_22219 ?auto_22222 ) ) ( not ( = ?auto_22220 ?auto_22222 ) ) ( TRUCK-AT ?auto_22225 ?auto_22221 ) )
    :subtasks
    ( ( !DRIVE ?auto_22225 ?auto_22221 ?auto_22226 )
      ( MAKE-ON ?auto_22219 ?auto_22220 )
      ( MAKE-ON-VERIFY ?auto_22219 ?auto_22220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22227 - SURFACE
      ?auto_22228 - SURFACE
    )
    :vars
    (
      ?auto_22229 - HOIST
      ?auto_22231 - PLACE
      ?auto_22234 - PLACE
      ?auto_22232 - HOIST
      ?auto_22230 - SURFACE
      ?auto_22233 - TRUCK
      ?auto_22235 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22229 ?auto_22231 ) ( IS-CRATE ?auto_22227 ) ( not ( = ?auto_22227 ?auto_22228 ) ) ( not ( = ?auto_22234 ?auto_22231 ) ) ( HOIST-AT ?auto_22232 ?auto_22234 ) ( not ( = ?auto_22229 ?auto_22232 ) ) ( AVAILABLE ?auto_22232 ) ( SURFACE-AT ?auto_22227 ?auto_22234 ) ( ON ?auto_22227 ?auto_22230 ) ( CLEAR ?auto_22227 ) ( not ( = ?auto_22227 ?auto_22230 ) ) ( not ( = ?auto_22228 ?auto_22230 ) ) ( TRUCK-AT ?auto_22233 ?auto_22231 ) ( SURFACE-AT ?auto_22235 ?auto_22231 ) ( CLEAR ?auto_22235 ) ( LIFTING ?auto_22229 ?auto_22228 ) ( IS-CRATE ?auto_22228 ) ( not ( = ?auto_22227 ?auto_22235 ) ) ( not ( = ?auto_22228 ?auto_22235 ) ) ( not ( = ?auto_22230 ?auto_22235 ) ) )
    :subtasks
    ( ( !DROP ?auto_22229 ?auto_22228 ?auto_22235 ?auto_22231 )
      ( MAKE-ON ?auto_22227 ?auto_22228 )
      ( MAKE-ON-VERIFY ?auto_22227 ?auto_22228 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22236 - SURFACE
      ?auto_22237 - SURFACE
    )
    :vars
    (
      ?auto_22240 - HOIST
      ?auto_22239 - PLACE
      ?auto_22244 - PLACE
      ?auto_22243 - HOIST
      ?auto_22238 - SURFACE
      ?auto_22242 - TRUCK
      ?auto_22241 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22240 ?auto_22239 ) ( IS-CRATE ?auto_22236 ) ( not ( = ?auto_22236 ?auto_22237 ) ) ( not ( = ?auto_22244 ?auto_22239 ) ) ( HOIST-AT ?auto_22243 ?auto_22244 ) ( not ( = ?auto_22240 ?auto_22243 ) ) ( AVAILABLE ?auto_22243 ) ( SURFACE-AT ?auto_22236 ?auto_22244 ) ( ON ?auto_22236 ?auto_22238 ) ( CLEAR ?auto_22236 ) ( not ( = ?auto_22236 ?auto_22238 ) ) ( not ( = ?auto_22237 ?auto_22238 ) ) ( TRUCK-AT ?auto_22242 ?auto_22239 ) ( SURFACE-AT ?auto_22241 ?auto_22239 ) ( CLEAR ?auto_22241 ) ( IS-CRATE ?auto_22237 ) ( not ( = ?auto_22236 ?auto_22241 ) ) ( not ( = ?auto_22237 ?auto_22241 ) ) ( not ( = ?auto_22238 ?auto_22241 ) ) ( AVAILABLE ?auto_22240 ) ( IN ?auto_22237 ?auto_22242 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22240 ?auto_22237 ?auto_22242 ?auto_22239 )
      ( MAKE-ON ?auto_22236 ?auto_22237 )
      ( MAKE-ON-VERIFY ?auto_22236 ?auto_22237 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22245 - SURFACE
      ?auto_22246 - SURFACE
    )
    :vars
    (
      ?auto_22248 - HOIST
      ?auto_22247 - PLACE
      ?auto_22253 - PLACE
      ?auto_22251 - HOIST
      ?auto_22250 - SURFACE
      ?auto_22249 - SURFACE
      ?auto_22252 - TRUCK
      ?auto_22254 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22248 ?auto_22247 ) ( IS-CRATE ?auto_22245 ) ( not ( = ?auto_22245 ?auto_22246 ) ) ( not ( = ?auto_22253 ?auto_22247 ) ) ( HOIST-AT ?auto_22251 ?auto_22253 ) ( not ( = ?auto_22248 ?auto_22251 ) ) ( AVAILABLE ?auto_22251 ) ( SURFACE-AT ?auto_22245 ?auto_22253 ) ( ON ?auto_22245 ?auto_22250 ) ( CLEAR ?auto_22245 ) ( not ( = ?auto_22245 ?auto_22250 ) ) ( not ( = ?auto_22246 ?auto_22250 ) ) ( SURFACE-AT ?auto_22249 ?auto_22247 ) ( CLEAR ?auto_22249 ) ( IS-CRATE ?auto_22246 ) ( not ( = ?auto_22245 ?auto_22249 ) ) ( not ( = ?auto_22246 ?auto_22249 ) ) ( not ( = ?auto_22250 ?auto_22249 ) ) ( AVAILABLE ?auto_22248 ) ( IN ?auto_22246 ?auto_22252 ) ( TRUCK-AT ?auto_22252 ?auto_22254 ) ( not ( = ?auto_22254 ?auto_22247 ) ) ( not ( = ?auto_22253 ?auto_22254 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22252 ?auto_22254 ?auto_22247 )
      ( MAKE-ON ?auto_22245 ?auto_22246 )
      ( MAKE-ON-VERIFY ?auto_22245 ?auto_22246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22255 - SURFACE
      ?auto_22256 - SURFACE
    )
    :vars
    (
      ?auto_22263 - HOIST
      ?auto_22260 - PLACE
      ?auto_22261 - PLACE
      ?auto_22264 - HOIST
      ?auto_22259 - SURFACE
      ?auto_22258 - SURFACE
      ?auto_22262 - TRUCK
      ?auto_22257 - PLACE
      ?auto_22265 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22263 ?auto_22260 ) ( IS-CRATE ?auto_22255 ) ( not ( = ?auto_22255 ?auto_22256 ) ) ( not ( = ?auto_22261 ?auto_22260 ) ) ( HOIST-AT ?auto_22264 ?auto_22261 ) ( not ( = ?auto_22263 ?auto_22264 ) ) ( AVAILABLE ?auto_22264 ) ( SURFACE-AT ?auto_22255 ?auto_22261 ) ( ON ?auto_22255 ?auto_22259 ) ( CLEAR ?auto_22255 ) ( not ( = ?auto_22255 ?auto_22259 ) ) ( not ( = ?auto_22256 ?auto_22259 ) ) ( SURFACE-AT ?auto_22258 ?auto_22260 ) ( CLEAR ?auto_22258 ) ( IS-CRATE ?auto_22256 ) ( not ( = ?auto_22255 ?auto_22258 ) ) ( not ( = ?auto_22256 ?auto_22258 ) ) ( not ( = ?auto_22259 ?auto_22258 ) ) ( AVAILABLE ?auto_22263 ) ( TRUCK-AT ?auto_22262 ?auto_22257 ) ( not ( = ?auto_22257 ?auto_22260 ) ) ( not ( = ?auto_22261 ?auto_22257 ) ) ( HOIST-AT ?auto_22265 ?auto_22257 ) ( LIFTING ?auto_22265 ?auto_22256 ) ( not ( = ?auto_22263 ?auto_22265 ) ) ( not ( = ?auto_22264 ?auto_22265 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22265 ?auto_22256 ?auto_22262 ?auto_22257 )
      ( MAKE-ON ?auto_22255 ?auto_22256 )
      ( MAKE-ON-VERIFY ?auto_22255 ?auto_22256 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22266 - SURFACE
      ?auto_22267 - SURFACE
    )
    :vars
    (
      ?auto_22276 - HOIST
      ?auto_22273 - PLACE
      ?auto_22271 - PLACE
      ?auto_22270 - HOIST
      ?auto_22274 - SURFACE
      ?auto_22272 - SURFACE
      ?auto_22275 - TRUCK
      ?auto_22269 - PLACE
      ?auto_22268 - HOIST
      ?auto_22277 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22276 ?auto_22273 ) ( IS-CRATE ?auto_22266 ) ( not ( = ?auto_22266 ?auto_22267 ) ) ( not ( = ?auto_22271 ?auto_22273 ) ) ( HOIST-AT ?auto_22270 ?auto_22271 ) ( not ( = ?auto_22276 ?auto_22270 ) ) ( AVAILABLE ?auto_22270 ) ( SURFACE-AT ?auto_22266 ?auto_22271 ) ( ON ?auto_22266 ?auto_22274 ) ( CLEAR ?auto_22266 ) ( not ( = ?auto_22266 ?auto_22274 ) ) ( not ( = ?auto_22267 ?auto_22274 ) ) ( SURFACE-AT ?auto_22272 ?auto_22273 ) ( CLEAR ?auto_22272 ) ( IS-CRATE ?auto_22267 ) ( not ( = ?auto_22266 ?auto_22272 ) ) ( not ( = ?auto_22267 ?auto_22272 ) ) ( not ( = ?auto_22274 ?auto_22272 ) ) ( AVAILABLE ?auto_22276 ) ( TRUCK-AT ?auto_22275 ?auto_22269 ) ( not ( = ?auto_22269 ?auto_22273 ) ) ( not ( = ?auto_22271 ?auto_22269 ) ) ( HOIST-AT ?auto_22268 ?auto_22269 ) ( not ( = ?auto_22276 ?auto_22268 ) ) ( not ( = ?auto_22270 ?auto_22268 ) ) ( AVAILABLE ?auto_22268 ) ( SURFACE-AT ?auto_22267 ?auto_22269 ) ( ON ?auto_22267 ?auto_22277 ) ( CLEAR ?auto_22267 ) ( not ( = ?auto_22266 ?auto_22277 ) ) ( not ( = ?auto_22267 ?auto_22277 ) ) ( not ( = ?auto_22274 ?auto_22277 ) ) ( not ( = ?auto_22272 ?auto_22277 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22268 ?auto_22267 ?auto_22277 ?auto_22269 )
      ( MAKE-ON ?auto_22266 ?auto_22267 )
      ( MAKE-ON-VERIFY ?auto_22266 ?auto_22267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22278 - SURFACE
      ?auto_22279 - SURFACE
    )
    :vars
    (
      ?auto_22287 - HOIST
      ?auto_22285 - PLACE
      ?auto_22289 - PLACE
      ?auto_22283 - HOIST
      ?auto_22286 - SURFACE
      ?auto_22280 - SURFACE
      ?auto_22282 - PLACE
      ?auto_22288 - HOIST
      ?auto_22284 - SURFACE
      ?auto_22281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22287 ?auto_22285 ) ( IS-CRATE ?auto_22278 ) ( not ( = ?auto_22278 ?auto_22279 ) ) ( not ( = ?auto_22289 ?auto_22285 ) ) ( HOIST-AT ?auto_22283 ?auto_22289 ) ( not ( = ?auto_22287 ?auto_22283 ) ) ( AVAILABLE ?auto_22283 ) ( SURFACE-AT ?auto_22278 ?auto_22289 ) ( ON ?auto_22278 ?auto_22286 ) ( CLEAR ?auto_22278 ) ( not ( = ?auto_22278 ?auto_22286 ) ) ( not ( = ?auto_22279 ?auto_22286 ) ) ( SURFACE-AT ?auto_22280 ?auto_22285 ) ( CLEAR ?auto_22280 ) ( IS-CRATE ?auto_22279 ) ( not ( = ?auto_22278 ?auto_22280 ) ) ( not ( = ?auto_22279 ?auto_22280 ) ) ( not ( = ?auto_22286 ?auto_22280 ) ) ( AVAILABLE ?auto_22287 ) ( not ( = ?auto_22282 ?auto_22285 ) ) ( not ( = ?auto_22289 ?auto_22282 ) ) ( HOIST-AT ?auto_22288 ?auto_22282 ) ( not ( = ?auto_22287 ?auto_22288 ) ) ( not ( = ?auto_22283 ?auto_22288 ) ) ( AVAILABLE ?auto_22288 ) ( SURFACE-AT ?auto_22279 ?auto_22282 ) ( ON ?auto_22279 ?auto_22284 ) ( CLEAR ?auto_22279 ) ( not ( = ?auto_22278 ?auto_22284 ) ) ( not ( = ?auto_22279 ?auto_22284 ) ) ( not ( = ?auto_22286 ?auto_22284 ) ) ( not ( = ?auto_22280 ?auto_22284 ) ) ( TRUCK-AT ?auto_22281 ?auto_22285 ) )
    :subtasks
    ( ( !DRIVE ?auto_22281 ?auto_22285 ?auto_22282 )
      ( MAKE-ON ?auto_22278 ?auto_22279 )
      ( MAKE-ON-VERIFY ?auto_22278 ?auto_22279 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22290 - SURFACE
      ?auto_22291 - SURFACE
    )
    :vars
    (
      ?auto_22296 - HOIST
      ?auto_22293 - PLACE
      ?auto_22299 - PLACE
      ?auto_22295 - HOIST
      ?auto_22300 - SURFACE
      ?auto_22294 - SURFACE
      ?auto_22297 - PLACE
      ?auto_22301 - HOIST
      ?auto_22292 - SURFACE
      ?auto_22298 - TRUCK
      ?auto_22302 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22296 ?auto_22293 ) ( IS-CRATE ?auto_22290 ) ( not ( = ?auto_22290 ?auto_22291 ) ) ( not ( = ?auto_22299 ?auto_22293 ) ) ( HOIST-AT ?auto_22295 ?auto_22299 ) ( not ( = ?auto_22296 ?auto_22295 ) ) ( AVAILABLE ?auto_22295 ) ( SURFACE-AT ?auto_22290 ?auto_22299 ) ( ON ?auto_22290 ?auto_22300 ) ( CLEAR ?auto_22290 ) ( not ( = ?auto_22290 ?auto_22300 ) ) ( not ( = ?auto_22291 ?auto_22300 ) ) ( IS-CRATE ?auto_22291 ) ( not ( = ?auto_22290 ?auto_22294 ) ) ( not ( = ?auto_22291 ?auto_22294 ) ) ( not ( = ?auto_22300 ?auto_22294 ) ) ( not ( = ?auto_22297 ?auto_22293 ) ) ( not ( = ?auto_22299 ?auto_22297 ) ) ( HOIST-AT ?auto_22301 ?auto_22297 ) ( not ( = ?auto_22296 ?auto_22301 ) ) ( not ( = ?auto_22295 ?auto_22301 ) ) ( AVAILABLE ?auto_22301 ) ( SURFACE-AT ?auto_22291 ?auto_22297 ) ( ON ?auto_22291 ?auto_22292 ) ( CLEAR ?auto_22291 ) ( not ( = ?auto_22290 ?auto_22292 ) ) ( not ( = ?auto_22291 ?auto_22292 ) ) ( not ( = ?auto_22300 ?auto_22292 ) ) ( not ( = ?auto_22294 ?auto_22292 ) ) ( TRUCK-AT ?auto_22298 ?auto_22293 ) ( SURFACE-AT ?auto_22302 ?auto_22293 ) ( CLEAR ?auto_22302 ) ( LIFTING ?auto_22296 ?auto_22294 ) ( IS-CRATE ?auto_22294 ) ( not ( = ?auto_22290 ?auto_22302 ) ) ( not ( = ?auto_22291 ?auto_22302 ) ) ( not ( = ?auto_22300 ?auto_22302 ) ) ( not ( = ?auto_22294 ?auto_22302 ) ) ( not ( = ?auto_22292 ?auto_22302 ) ) )
    :subtasks
    ( ( !DROP ?auto_22296 ?auto_22294 ?auto_22302 ?auto_22293 )
      ( MAKE-ON ?auto_22290 ?auto_22291 )
      ( MAKE-ON-VERIFY ?auto_22290 ?auto_22291 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22303 - SURFACE
      ?auto_22304 - SURFACE
    )
    :vars
    (
      ?auto_22308 - HOIST
      ?auto_22306 - PLACE
      ?auto_22313 - PLACE
      ?auto_22307 - HOIST
      ?auto_22309 - SURFACE
      ?auto_22312 - SURFACE
      ?auto_22305 - PLACE
      ?auto_22314 - HOIST
      ?auto_22310 - SURFACE
      ?auto_22315 - TRUCK
      ?auto_22311 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22308 ?auto_22306 ) ( IS-CRATE ?auto_22303 ) ( not ( = ?auto_22303 ?auto_22304 ) ) ( not ( = ?auto_22313 ?auto_22306 ) ) ( HOIST-AT ?auto_22307 ?auto_22313 ) ( not ( = ?auto_22308 ?auto_22307 ) ) ( AVAILABLE ?auto_22307 ) ( SURFACE-AT ?auto_22303 ?auto_22313 ) ( ON ?auto_22303 ?auto_22309 ) ( CLEAR ?auto_22303 ) ( not ( = ?auto_22303 ?auto_22309 ) ) ( not ( = ?auto_22304 ?auto_22309 ) ) ( IS-CRATE ?auto_22304 ) ( not ( = ?auto_22303 ?auto_22312 ) ) ( not ( = ?auto_22304 ?auto_22312 ) ) ( not ( = ?auto_22309 ?auto_22312 ) ) ( not ( = ?auto_22305 ?auto_22306 ) ) ( not ( = ?auto_22313 ?auto_22305 ) ) ( HOIST-AT ?auto_22314 ?auto_22305 ) ( not ( = ?auto_22308 ?auto_22314 ) ) ( not ( = ?auto_22307 ?auto_22314 ) ) ( AVAILABLE ?auto_22314 ) ( SURFACE-AT ?auto_22304 ?auto_22305 ) ( ON ?auto_22304 ?auto_22310 ) ( CLEAR ?auto_22304 ) ( not ( = ?auto_22303 ?auto_22310 ) ) ( not ( = ?auto_22304 ?auto_22310 ) ) ( not ( = ?auto_22309 ?auto_22310 ) ) ( not ( = ?auto_22312 ?auto_22310 ) ) ( TRUCK-AT ?auto_22315 ?auto_22306 ) ( SURFACE-AT ?auto_22311 ?auto_22306 ) ( CLEAR ?auto_22311 ) ( IS-CRATE ?auto_22312 ) ( not ( = ?auto_22303 ?auto_22311 ) ) ( not ( = ?auto_22304 ?auto_22311 ) ) ( not ( = ?auto_22309 ?auto_22311 ) ) ( not ( = ?auto_22312 ?auto_22311 ) ) ( not ( = ?auto_22310 ?auto_22311 ) ) ( AVAILABLE ?auto_22308 ) ( IN ?auto_22312 ?auto_22315 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22308 ?auto_22312 ?auto_22315 ?auto_22306 )
      ( MAKE-ON ?auto_22303 ?auto_22304 )
      ( MAKE-ON-VERIFY ?auto_22303 ?auto_22304 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22316 - SURFACE
      ?auto_22317 - SURFACE
    )
    :vars
    (
      ?auto_22324 - HOIST
      ?auto_22326 - PLACE
      ?auto_22318 - PLACE
      ?auto_22323 - HOIST
      ?auto_22327 - SURFACE
      ?auto_22321 - SURFACE
      ?auto_22322 - PLACE
      ?auto_22320 - HOIST
      ?auto_22328 - SURFACE
      ?auto_22319 - SURFACE
      ?auto_22325 - TRUCK
      ?auto_22329 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22324 ?auto_22326 ) ( IS-CRATE ?auto_22316 ) ( not ( = ?auto_22316 ?auto_22317 ) ) ( not ( = ?auto_22318 ?auto_22326 ) ) ( HOIST-AT ?auto_22323 ?auto_22318 ) ( not ( = ?auto_22324 ?auto_22323 ) ) ( AVAILABLE ?auto_22323 ) ( SURFACE-AT ?auto_22316 ?auto_22318 ) ( ON ?auto_22316 ?auto_22327 ) ( CLEAR ?auto_22316 ) ( not ( = ?auto_22316 ?auto_22327 ) ) ( not ( = ?auto_22317 ?auto_22327 ) ) ( IS-CRATE ?auto_22317 ) ( not ( = ?auto_22316 ?auto_22321 ) ) ( not ( = ?auto_22317 ?auto_22321 ) ) ( not ( = ?auto_22327 ?auto_22321 ) ) ( not ( = ?auto_22322 ?auto_22326 ) ) ( not ( = ?auto_22318 ?auto_22322 ) ) ( HOIST-AT ?auto_22320 ?auto_22322 ) ( not ( = ?auto_22324 ?auto_22320 ) ) ( not ( = ?auto_22323 ?auto_22320 ) ) ( AVAILABLE ?auto_22320 ) ( SURFACE-AT ?auto_22317 ?auto_22322 ) ( ON ?auto_22317 ?auto_22328 ) ( CLEAR ?auto_22317 ) ( not ( = ?auto_22316 ?auto_22328 ) ) ( not ( = ?auto_22317 ?auto_22328 ) ) ( not ( = ?auto_22327 ?auto_22328 ) ) ( not ( = ?auto_22321 ?auto_22328 ) ) ( SURFACE-AT ?auto_22319 ?auto_22326 ) ( CLEAR ?auto_22319 ) ( IS-CRATE ?auto_22321 ) ( not ( = ?auto_22316 ?auto_22319 ) ) ( not ( = ?auto_22317 ?auto_22319 ) ) ( not ( = ?auto_22327 ?auto_22319 ) ) ( not ( = ?auto_22321 ?auto_22319 ) ) ( not ( = ?auto_22328 ?auto_22319 ) ) ( AVAILABLE ?auto_22324 ) ( IN ?auto_22321 ?auto_22325 ) ( TRUCK-AT ?auto_22325 ?auto_22329 ) ( not ( = ?auto_22329 ?auto_22326 ) ) ( not ( = ?auto_22318 ?auto_22329 ) ) ( not ( = ?auto_22322 ?auto_22329 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22325 ?auto_22329 ?auto_22326 )
      ( MAKE-ON ?auto_22316 ?auto_22317 )
      ( MAKE-ON-VERIFY ?auto_22316 ?auto_22317 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22330 - SURFACE
      ?auto_22331 - SURFACE
    )
    :vars
    (
      ?auto_22334 - HOIST
      ?auto_22339 - PLACE
      ?auto_22338 - PLACE
      ?auto_22341 - HOIST
      ?auto_22343 - SURFACE
      ?auto_22336 - SURFACE
      ?auto_22340 - PLACE
      ?auto_22333 - HOIST
      ?auto_22335 - SURFACE
      ?auto_22337 - SURFACE
      ?auto_22342 - TRUCK
      ?auto_22332 - PLACE
      ?auto_22344 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22334 ?auto_22339 ) ( IS-CRATE ?auto_22330 ) ( not ( = ?auto_22330 ?auto_22331 ) ) ( not ( = ?auto_22338 ?auto_22339 ) ) ( HOIST-AT ?auto_22341 ?auto_22338 ) ( not ( = ?auto_22334 ?auto_22341 ) ) ( AVAILABLE ?auto_22341 ) ( SURFACE-AT ?auto_22330 ?auto_22338 ) ( ON ?auto_22330 ?auto_22343 ) ( CLEAR ?auto_22330 ) ( not ( = ?auto_22330 ?auto_22343 ) ) ( not ( = ?auto_22331 ?auto_22343 ) ) ( IS-CRATE ?auto_22331 ) ( not ( = ?auto_22330 ?auto_22336 ) ) ( not ( = ?auto_22331 ?auto_22336 ) ) ( not ( = ?auto_22343 ?auto_22336 ) ) ( not ( = ?auto_22340 ?auto_22339 ) ) ( not ( = ?auto_22338 ?auto_22340 ) ) ( HOIST-AT ?auto_22333 ?auto_22340 ) ( not ( = ?auto_22334 ?auto_22333 ) ) ( not ( = ?auto_22341 ?auto_22333 ) ) ( AVAILABLE ?auto_22333 ) ( SURFACE-AT ?auto_22331 ?auto_22340 ) ( ON ?auto_22331 ?auto_22335 ) ( CLEAR ?auto_22331 ) ( not ( = ?auto_22330 ?auto_22335 ) ) ( not ( = ?auto_22331 ?auto_22335 ) ) ( not ( = ?auto_22343 ?auto_22335 ) ) ( not ( = ?auto_22336 ?auto_22335 ) ) ( SURFACE-AT ?auto_22337 ?auto_22339 ) ( CLEAR ?auto_22337 ) ( IS-CRATE ?auto_22336 ) ( not ( = ?auto_22330 ?auto_22337 ) ) ( not ( = ?auto_22331 ?auto_22337 ) ) ( not ( = ?auto_22343 ?auto_22337 ) ) ( not ( = ?auto_22336 ?auto_22337 ) ) ( not ( = ?auto_22335 ?auto_22337 ) ) ( AVAILABLE ?auto_22334 ) ( TRUCK-AT ?auto_22342 ?auto_22332 ) ( not ( = ?auto_22332 ?auto_22339 ) ) ( not ( = ?auto_22338 ?auto_22332 ) ) ( not ( = ?auto_22340 ?auto_22332 ) ) ( HOIST-AT ?auto_22344 ?auto_22332 ) ( LIFTING ?auto_22344 ?auto_22336 ) ( not ( = ?auto_22334 ?auto_22344 ) ) ( not ( = ?auto_22341 ?auto_22344 ) ) ( not ( = ?auto_22333 ?auto_22344 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22344 ?auto_22336 ?auto_22342 ?auto_22332 )
      ( MAKE-ON ?auto_22330 ?auto_22331 )
      ( MAKE-ON-VERIFY ?auto_22330 ?auto_22331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22345 - SURFACE
      ?auto_22346 - SURFACE
    )
    :vars
    (
      ?auto_22354 - HOIST
      ?auto_22355 - PLACE
      ?auto_22350 - PLACE
      ?auto_22353 - HOIST
      ?auto_22349 - SURFACE
      ?auto_22356 - SURFACE
      ?auto_22351 - PLACE
      ?auto_22359 - HOIST
      ?auto_22358 - SURFACE
      ?auto_22352 - SURFACE
      ?auto_22357 - TRUCK
      ?auto_22347 - PLACE
      ?auto_22348 - HOIST
      ?auto_22360 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22354 ?auto_22355 ) ( IS-CRATE ?auto_22345 ) ( not ( = ?auto_22345 ?auto_22346 ) ) ( not ( = ?auto_22350 ?auto_22355 ) ) ( HOIST-AT ?auto_22353 ?auto_22350 ) ( not ( = ?auto_22354 ?auto_22353 ) ) ( AVAILABLE ?auto_22353 ) ( SURFACE-AT ?auto_22345 ?auto_22350 ) ( ON ?auto_22345 ?auto_22349 ) ( CLEAR ?auto_22345 ) ( not ( = ?auto_22345 ?auto_22349 ) ) ( not ( = ?auto_22346 ?auto_22349 ) ) ( IS-CRATE ?auto_22346 ) ( not ( = ?auto_22345 ?auto_22356 ) ) ( not ( = ?auto_22346 ?auto_22356 ) ) ( not ( = ?auto_22349 ?auto_22356 ) ) ( not ( = ?auto_22351 ?auto_22355 ) ) ( not ( = ?auto_22350 ?auto_22351 ) ) ( HOIST-AT ?auto_22359 ?auto_22351 ) ( not ( = ?auto_22354 ?auto_22359 ) ) ( not ( = ?auto_22353 ?auto_22359 ) ) ( AVAILABLE ?auto_22359 ) ( SURFACE-AT ?auto_22346 ?auto_22351 ) ( ON ?auto_22346 ?auto_22358 ) ( CLEAR ?auto_22346 ) ( not ( = ?auto_22345 ?auto_22358 ) ) ( not ( = ?auto_22346 ?auto_22358 ) ) ( not ( = ?auto_22349 ?auto_22358 ) ) ( not ( = ?auto_22356 ?auto_22358 ) ) ( SURFACE-AT ?auto_22352 ?auto_22355 ) ( CLEAR ?auto_22352 ) ( IS-CRATE ?auto_22356 ) ( not ( = ?auto_22345 ?auto_22352 ) ) ( not ( = ?auto_22346 ?auto_22352 ) ) ( not ( = ?auto_22349 ?auto_22352 ) ) ( not ( = ?auto_22356 ?auto_22352 ) ) ( not ( = ?auto_22358 ?auto_22352 ) ) ( AVAILABLE ?auto_22354 ) ( TRUCK-AT ?auto_22357 ?auto_22347 ) ( not ( = ?auto_22347 ?auto_22355 ) ) ( not ( = ?auto_22350 ?auto_22347 ) ) ( not ( = ?auto_22351 ?auto_22347 ) ) ( HOIST-AT ?auto_22348 ?auto_22347 ) ( not ( = ?auto_22354 ?auto_22348 ) ) ( not ( = ?auto_22353 ?auto_22348 ) ) ( not ( = ?auto_22359 ?auto_22348 ) ) ( AVAILABLE ?auto_22348 ) ( SURFACE-AT ?auto_22356 ?auto_22347 ) ( ON ?auto_22356 ?auto_22360 ) ( CLEAR ?auto_22356 ) ( not ( = ?auto_22345 ?auto_22360 ) ) ( not ( = ?auto_22346 ?auto_22360 ) ) ( not ( = ?auto_22349 ?auto_22360 ) ) ( not ( = ?auto_22356 ?auto_22360 ) ) ( not ( = ?auto_22358 ?auto_22360 ) ) ( not ( = ?auto_22352 ?auto_22360 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22348 ?auto_22356 ?auto_22360 ?auto_22347 )
      ( MAKE-ON ?auto_22345 ?auto_22346 )
      ( MAKE-ON-VERIFY ?auto_22345 ?auto_22346 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22361 - SURFACE
      ?auto_22362 - SURFACE
    )
    :vars
    (
      ?auto_22367 - HOIST
      ?auto_22364 - PLACE
      ?auto_22375 - PLACE
      ?auto_22374 - HOIST
      ?auto_22376 - SURFACE
      ?auto_22363 - SURFACE
      ?auto_22369 - PLACE
      ?auto_22373 - HOIST
      ?auto_22372 - SURFACE
      ?auto_22370 - SURFACE
      ?auto_22365 - PLACE
      ?auto_22371 - HOIST
      ?auto_22366 - SURFACE
      ?auto_22368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22367 ?auto_22364 ) ( IS-CRATE ?auto_22361 ) ( not ( = ?auto_22361 ?auto_22362 ) ) ( not ( = ?auto_22375 ?auto_22364 ) ) ( HOIST-AT ?auto_22374 ?auto_22375 ) ( not ( = ?auto_22367 ?auto_22374 ) ) ( AVAILABLE ?auto_22374 ) ( SURFACE-AT ?auto_22361 ?auto_22375 ) ( ON ?auto_22361 ?auto_22376 ) ( CLEAR ?auto_22361 ) ( not ( = ?auto_22361 ?auto_22376 ) ) ( not ( = ?auto_22362 ?auto_22376 ) ) ( IS-CRATE ?auto_22362 ) ( not ( = ?auto_22361 ?auto_22363 ) ) ( not ( = ?auto_22362 ?auto_22363 ) ) ( not ( = ?auto_22376 ?auto_22363 ) ) ( not ( = ?auto_22369 ?auto_22364 ) ) ( not ( = ?auto_22375 ?auto_22369 ) ) ( HOIST-AT ?auto_22373 ?auto_22369 ) ( not ( = ?auto_22367 ?auto_22373 ) ) ( not ( = ?auto_22374 ?auto_22373 ) ) ( AVAILABLE ?auto_22373 ) ( SURFACE-AT ?auto_22362 ?auto_22369 ) ( ON ?auto_22362 ?auto_22372 ) ( CLEAR ?auto_22362 ) ( not ( = ?auto_22361 ?auto_22372 ) ) ( not ( = ?auto_22362 ?auto_22372 ) ) ( not ( = ?auto_22376 ?auto_22372 ) ) ( not ( = ?auto_22363 ?auto_22372 ) ) ( SURFACE-AT ?auto_22370 ?auto_22364 ) ( CLEAR ?auto_22370 ) ( IS-CRATE ?auto_22363 ) ( not ( = ?auto_22361 ?auto_22370 ) ) ( not ( = ?auto_22362 ?auto_22370 ) ) ( not ( = ?auto_22376 ?auto_22370 ) ) ( not ( = ?auto_22363 ?auto_22370 ) ) ( not ( = ?auto_22372 ?auto_22370 ) ) ( AVAILABLE ?auto_22367 ) ( not ( = ?auto_22365 ?auto_22364 ) ) ( not ( = ?auto_22375 ?auto_22365 ) ) ( not ( = ?auto_22369 ?auto_22365 ) ) ( HOIST-AT ?auto_22371 ?auto_22365 ) ( not ( = ?auto_22367 ?auto_22371 ) ) ( not ( = ?auto_22374 ?auto_22371 ) ) ( not ( = ?auto_22373 ?auto_22371 ) ) ( AVAILABLE ?auto_22371 ) ( SURFACE-AT ?auto_22363 ?auto_22365 ) ( ON ?auto_22363 ?auto_22366 ) ( CLEAR ?auto_22363 ) ( not ( = ?auto_22361 ?auto_22366 ) ) ( not ( = ?auto_22362 ?auto_22366 ) ) ( not ( = ?auto_22376 ?auto_22366 ) ) ( not ( = ?auto_22363 ?auto_22366 ) ) ( not ( = ?auto_22372 ?auto_22366 ) ) ( not ( = ?auto_22370 ?auto_22366 ) ) ( TRUCK-AT ?auto_22368 ?auto_22364 ) )
    :subtasks
    ( ( !DRIVE ?auto_22368 ?auto_22364 ?auto_22365 )
      ( MAKE-ON ?auto_22361 ?auto_22362 )
      ( MAKE-ON-VERIFY ?auto_22361 ?auto_22362 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22377 - SURFACE
      ?auto_22378 - SURFACE
    )
    :vars
    (
      ?auto_22382 - HOIST
      ?auto_22386 - PLACE
      ?auto_22383 - PLACE
      ?auto_22388 - HOIST
      ?auto_22389 - SURFACE
      ?auto_22392 - SURFACE
      ?auto_22384 - PLACE
      ?auto_22380 - HOIST
      ?auto_22381 - SURFACE
      ?auto_22379 - SURFACE
      ?auto_22385 - PLACE
      ?auto_22391 - HOIST
      ?auto_22390 - SURFACE
      ?auto_22387 - TRUCK
      ?auto_22393 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22382 ?auto_22386 ) ( IS-CRATE ?auto_22377 ) ( not ( = ?auto_22377 ?auto_22378 ) ) ( not ( = ?auto_22383 ?auto_22386 ) ) ( HOIST-AT ?auto_22388 ?auto_22383 ) ( not ( = ?auto_22382 ?auto_22388 ) ) ( AVAILABLE ?auto_22388 ) ( SURFACE-AT ?auto_22377 ?auto_22383 ) ( ON ?auto_22377 ?auto_22389 ) ( CLEAR ?auto_22377 ) ( not ( = ?auto_22377 ?auto_22389 ) ) ( not ( = ?auto_22378 ?auto_22389 ) ) ( IS-CRATE ?auto_22378 ) ( not ( = ?auto_22377 ?auto_22392 ) ) ( not ( = ?auto_22378 ?auto_22392 ) ) ( not ( = ?auto_22389 ?auto_22392 ) ) ( not ( = ?auto_22384 ?auto_22386 ) ) ( not ( = ?auto_22383 ?auto_22384 ) ) ( HOIST-AT ?auto_22380 ?auto_22384 ) ( not ( = ?auto_22382 ?auto_22380 ) ) ( not ( = ?auto_22388 ?auto_22380 ) ) ( AVAILABLE ?auto_22380 ) ( SURFACE-AT ?auto_22378 ?auto_22384 ) ( ON ?auto_22378 ?auto_22381 ) ( CLEAR ?auto_22378 ) ( not ( = ?auto_22377 ?auto_22381 ) ) ( not ( = ?auto_22378 ?auto_22381 ) ) ( not ( = ?auto_22389 ?auto_22381 ) ) ( not ( = ?auto_22392 ?auto_22381 ) ) ( IS-CRATE ?auto_22392 ) ( not ( = ?auto_22377 ?auto_22379 ) ) ( not ( = ?auto_22378 ?auto_22379 ) ) ( not ( = ?auto_22389 ?auto_22379 ) ) ( not ( = ?auto_22392 ?auto_22379 ) ) ( not ( = ?auto_22381 ?auto_22379 ) ) ( not ( = ?auto_22385 ?auto_22386 ) ) ( not ( = ?auto_22383 ?auto_22385 ) ) ( not ( = ?auto_22384 ?auto_22385 ) ) ( HOIST-AT ?auto_22391 ?auto_22385 ) ( not ( = ?auto_22382 ?auto_22391 ) ) ( not ( = ?auto_22388 ?auto_22391 ) ) ( not ( = ?auto_22380 ?auto_22391 ) ) ( AVAILABLE ?auto_22391 ) ( SURFACE-AT ?auto_22392 ?auto_22385 ) ( ON ?auto_22392 ?auto_22390 ) ( CLEAR ?auto_22392 ) ( not ( = ?auto_22377 ?auto_22390 ) ) ( not ( = ?auto_22378 ?auto_22390 ) ) ( not ( = ?auto_22389 ?auto_22390 ) ) ( not ( = ?auto_22392 ?auto_22390 ) ) ( not ( = ?auto_22381 ?auto_22390 ) ) ( not ( = ?auto_22379 ?auto_22390 ) ) ( TRUCK-AT ?auto_22387 ?auto_22386 ) ( SURFACE-AT ?auto_22393 ?auto_22386 ) ( CLEAR ?auto_22393 ) ( LIFTING ?auto_22382 ?auto_22379 ) ( IS-CRATE ?auto_22379 ) ( not ( = ?auto_22377 ?auto_22393 ) ) ( not ( = ?auto_22378 ?auto_22393 ) ) ( not ( = ?auto_22389 ?auto_22393 ) ) ( not ( = ?auto_22392 ?auto_22393 ) ) ( not ( = ?auto_22381 ?auto_22393 ) ) ( not ( = ?auto_22379 ?auto_22393 ) ) ( not ( = ?auto_22390 ?auto_22393 ) ) )
    :subtasks
    ( ( !DROP ?auto_22382 ?auto_22379 ?auto_22393 ?auto_22386 )
      ( MAKE-ON ?auto_22377 ?auto_22378 )
      ( MAKE-ON-VERIFY ?auto_22377 ?auto_22378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22394 - SURFACE
      ?auto_22395 - SURFACE
    )
    :vars
    (
      ?auto_22405 - HOIST
      ?auto_22401 - PLACE
      ?auto_22410 - PLACE
      ?auto_22409 - HOIST
      ?auto_22397 - SURFACE
      ?auto_22403 - SURFACE
      ?auto_22402 - PLACE
      ?auto_22404 - HOIST
      ?auto_22407 - SURFACE
      ?auto_22408 - SURFACE
      ?auto_22398 - PLACE
      ?auto_22406 - HOIST
      ?auto_22399 - SURFACE
      ?auto_22400 - TRUCK
      ?auto_22396 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22405 ?auto_22401 ) ( IS-CRATE ?auto_22394 ) ( not ( = ?auto_22394 ?auto_22395 ) ) ( not ( = ?auto_22410 ?auto_22401 ) ) ( HOIST-AT ?auto_22409 ?auto_22410 ) ( not ( = ?auto_22405 ?auto_22409 ) ) ( AVAILABLE ?auto_22409 ) ( SURFACE-AT ?auto_22394 ?auto_22410 ) ( ON ?auto_22394 ?auto_22397 ) ( CLEAR ?auto_22394 ) ( not ( = ?auto_22394 ?auto_22397 ) ) ( not ( = ?auto_22395 ?auto_22397 ) ) ( IS-CRATE ?auto_22395 ) ( not ( = ?auto_22394 ?auto_22403 ) ) ( not ( = ?auto_22395 ?auto_22403 ) ) ( not ( = ?auto_22397 ?auto_22403 ) ) ( not ( = ?auto_22402 ?auto_22401 ) ) ( not ( = ?auto_22410 ?auto_22402 ) ) ( HOIST-AT ?auto_22404 ?auto_22402 ) ( not ( = ?auto_22405 ?auto_22404 ) ) ( not ( = ?auto_22409 ?auto_22404 ) ) ( AVAILABLE ?auto_22404 ) ( SURFACE-AT ?auto_22395 ?auto_22402 ) ( ON ?auto_22395 ?auto_22407 ) ( CLEAR ?auto_22395 ) ( not ( = ?auto_22394 ?auto_22407 ) ) ( not ( = ?auto_22395 ?auto_22407 ) ) ( not ( = ?auto_22397 ?auto_22407 ) ) ( not ( = ?auto_22403 ?auto_22407 ) ) ( IS-CRATE ?auto_22403 ) ( not ( = ?auto_22394 ?auto_22408 ) ) ( not ( = ?auto_22395 ?auto_22408 ) ) ( not ( = ?auto_22397 ?auto_22408 ) ) ( not ( = ?auto_22403 ?auto_22408 ) ) ( not ( = ?auto_22407 ?auto_22408 ) ) ( not ( = ?auto_22398 ?auto_22401 ) ) ( not ( = ?auto_22410 ?auto_22398 ) ) ( not ( = ?auto_22402 ?auto_22398 ) ) ( HOIST-AT ?auto_22406 ?auto_22398 ) ( not ( = ?auto_22405 ?auto_22406 ) ) ( not ( = ?auto_22409 ?auto_22406 ) ) ( not ( = ?auto_22404 ?auto_22406 ) ) ( AVAILABLE ?auto_22406 ) ( SURFACE-AT ?auto_22403 ?auto_22398 ) ( ON ?auto_22403 ?auto_22399 ) ( CLEAR ?auto_22403 ) ( not ( = ?auto_22394 ?auto_22399 ) ) ( not ( = ?auto_22395 ?auto_22399 ) ) ( not ( = ?auto_22397 ?auto_22399 ) ) ( not ( = ?auto_22403 ?auto_22399 ) ) ( not ( = ?auto_22407 ?auto_22399 ) ) ( not ( = ?auto_22408 ?auto_22399 ) ) ( TRUCK-AT ?auto_22400 ?auto_22401 ) ( SURFACE-AT ?auto_22396 ?auto_22401 ) ( CLEAR ?auto_22396 ) ( IS-CRATE ?auto_22408 ) ( not ( = ?auto_22394 ?auto_22396 ) ) ( not ( = ?auto_22395 ?auto_22396 ) ) ( not ( = ?auto_22397 ?auto_22396 ) ) ( not ( = ?auto_22403 ?auto_22396 ) ) ( not ( = ?auto_22407 ?auto_22396 ) ) ( not ( = ?auto_22408 ?auto_22396 ) ) ( not ( = ?auto_22399 ?auto_22396 ) ) ( AVAILABLE ?auto_22405 ) ( IN ?auto_22408 ?auto_22400 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22405 ?auto_22408 ?auto_22400 ?auto_22401 )
      ( MAKE-ON ?auto_22394 ?auto_22395 )
      ( MAKE-ON-VERIFY ?auto_22394 ?auto_22395 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22411 - SURFACE
      ?auto_22412 - SURFACE
    )
    :vars
    (
      ?auto_22423 - HOIST
      ?auto_22420 - PLACE
      ?auto_22422 - PLACE
      ?auto_22424 - HOIST
      ?auto_22425 - SURFACE
      ?auto_22418 - SURFACE
      ?auto_22426 - PLACE
      ?auto_22427 - HOIST
      ?auto_22421 - SURFACE
      ?auto_22414 - SURFACE
      ?auto_22419 - PLACE
      ?auto_22417 - HOIST
      ?auto_22416 - SURFACE
      ?auto_22413 - SURFACE
      ?auto_22415 - TRUCK
      ?auto_22428 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22423 ?auto_22420 ) ( IS-CRATE ?auto_22411 ) ( not ( = ?auto_22411 ?auto_22412 ) ) ( not ( = ?auto_22422 ?auto_22420 ) ) ( HOIST-AT ?auto_22424 ?auto_22422 ) ( not ( = ?auto_22423 ?auto_22424 ) ) ( AVAILABLE ?auto_22424 ) ( SURFACE-AT ?auto_22411 ?auto_22422 ) ( ON ?auto_22411 ?auto_22425 ) ( CLEAR ?auto_22411 ) ( not ( = ?auto_22411 ?auto_22425 ) ) ( not ( = ?auto_22412 ?auto_22425 ) ) ( IS-CRATE ?auto_22412 ) ( not ( = ?auto_22411 ?auto_22418 ) ) ( not ( = ?auto_22412 ?auto_22418 ) ) ( not ( = ?auto_22425 ?auto_22418 ) ) ( not ( = ?auto_22426 ?auto_22420 ) ) ( not ( = ?auto_22422 ?auto_22426 ) ) ( HOIST-AT ?auto_22427 ?auto_22426 ) ( not ( = ?auto_22423 ?auto_22427 ) ) ( not ( = ?auto_22424 ?auto_22427 ) ) ( AVAILABLE ?auto_22427 ) ( SURFACE-AT ?auto_22412 ?auto_22426 ) ( ON ?auto_22412 ?auto_22421 ) ( CLEAR ?auto_22412 ) ( not ( = ?auto_22411 ?auto_22421 ) ) ( not ( = ?auto_22412 ?auto_22421 ) ) ( not ( = ?auto_22425 ?auto_22421 ) ) ( not ( = ?auto_22418 ?auto_22421 ) ) ( IS-CRATE ?auto_22418 ) ( not ( = ?auto_22411 ?auto_22414 ) ) ( not ( = ?auto_22412 ?auto_22414 ) ) ( not ( = ?auto_22425 ?auto_22414 ) ) ( not ( = ?auto_22418 ?auto_22414 ) ) ( not ( = ?auto_22421 ?auto_22414 ) ) ( not ( = ?auto_22419 ?auto_22420 ) ) ( not ( = ?auto_22422 ?auto_22419 ) ) ( not ( = ?auto_22426 ?auto_22419 ) ) ( HOIST-AT ?auto_22417 ?auto_22419 ) ( not ( = ?auto_22423 ?auto_22417 ) ) ( not ( = ?auto_22424 ?auto_22417 ) ) ( not ( = ?auto_22427 ?auto_22417 ) ) ( AVAILABLE ?auto_22417 ) ( SURFACE-AT ?auto_22418 ?auto_22419 ) ( ON ?auto_22418 ?auto_22416 ) ( CLEAR ?auto_22418 ) ( not ( = ?auto_22411 ?auto_22416 ) ) ( not ( = ?auto_22412 ?auto_22416 ) ) ( not ( = ?auto_22425 ?auto_22416 ) ) ( not ( = ?auto_22418 ?auto_22416 ) ) ( not ( = ?auto_22421 ?auto_22416 ) ) ( not ( = ?auto_22414 ?auto_22416 ) ) ( SURFACE-AT ?auto_22413 ?auto_22420 ) ( CLEAR ?auto_22413 ) ( IS-CRATE ?auto_22414 ) ( not ( = ?auto_22411 ?auto_22413 ) ) ( not ( = ?auto_22412 ?auto_22413 ) ) ( not ( = ?auto_22425 ?auto_22413 ) ) ( not ( = ?auto_22418 ?auto_22413 ) ) ( not ( = ?auto_22421 ?auto_22413 ) ) ( not ( = ?auto_22414 ?auto_22413 ) ) ( not ( = ?auto_22416 ?auto_22413 ) ) ( AVAILABLE ?auto_22423 ) ( IN ?auto_22414 ?auto_22415 ) ( TRUCK-AT ?auto_22415 ?auto_22428 ) ( not ( = ?auto_22428 ?auto_22420 ) ) ( not ( = ?auto_22422 ?auto_22428 ) ) ( not ( = ?auto_22426 ?auto_22428 ) ) ( not ( = ?auto_22419 ?auto_22428 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22415 ?auto_22428 ?auto_22420 )
      ( MAKE-ON ?auto_22411 ?auto_22412 )
      ( MAKE-ON-VERIFY ?auto_22411 ?auto_22412 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22429 - SURFACE
      ?auto_22430 - SURFACE
    )
    :vars
    (
      ?auto_22442 - HOIST
      ?auto_22438 - PLACE
      ?auto_22434 - PLACE
      ?auto_22431 - HOIST
      ?auto_22432 - SURFACE
      ?auto_22439 - SURFACE
      ?auto_22436 - PLACE
      ?auto_22437 - HOIST
      ?auto_22445 - SURFACE
      ?auto_22441 - SURFACE
      ?auto_22444 - PLACE
      ?auto_22433 - HOIST
      ?auto_22443 - SURFACE
      ?auto_22446 - SURFACE
      ?auto_22440 - TRUCK
      ?auto_22435 - PLACE
      ?auto_22447 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22442 ?auto_22438 ) ( IS-CRATE ?auto_22429 ) ( not ( = ?auto_22429 ?auto_22430 ) ) ( not ( = ?auto_22434 ?auto_22438 ) ) ( HOIST-AT ?auto_22431 ?auto_22434 ) ( not ( = ?auto_22442 ?auto_22431 ) ) ( AVAILABLE ?auto_22431 ) ( SURFACE-AT ?auto_22429 ?auto_22434 ) ( ON ?auto_22429 ?auto_22432 ) ( CLEAR ?auto_22429 ) ( not ( = ?auto_22429 ?auto_22432 ) ) ( not ( = ?auto_22430 ?auto_22432 ) ) ( IS-CRATE ?auto_22430 ) ( not ( = ?auto_22429 ?auto_22439 ) ) ( not ( = ?auto_22430 ?auto_22439 ) ) ( not ( = ?auto_22432 ?auto_22439 ) ) ( not ( = ?auto_22436 ?auto_22438 ) ) ( not ( = ?auto_22434 ?auto_22436 ) ) ( HOIST-AT ?auto_22437 ?auto_22436 ) ( not ( = ?auto_22442 ?auto_22437 ) ) ( not ( = ?auto_22431 ?auto_22437 ) ) ( AVAILABLE ?auto_22437 ) ( SURFACE-AT ?auto_22430 ?auto_22436 ) ( ON ?auto_22430 ?auto_22445 ) ( CLEAR ?auto_22430 ) ( not ( = ?auto_22429 ?auto_22445 ) ) ( not ( = ?auto_22430 ?auto_22445 ) ) ( not ( = ?auto_22432 ?auto_22445 ) ) ( not ( = ?auto_22439 ?auto_22445 ) ) ( IS-CRATE ?auto_22439 ) ( not ( = ?auto_22429 ?auto_22441 ) ) ( not ( = ?auto_22430 ?auto_22441 ) ) ( not ( = ?auto_22432 ?auto_22441 ) ) ( not ( = ?auto_22439 ?auto_22441 ) ) ( not ( = ?auto_22445 ?auto_22441 ) ) ( not ( = ?auto_22444 ?auto_22438 ) ) ( not ( = ?auto_22434 ?auto_22444 ) ) ( not ( = ?auto_22436 ?auto_22444 ) ) ( HOIST-AT ?auto_22433 ?auto_22444 ) ( not ( = ?auto_22442 ?auto_22433 ) ) ( not ( = ?auto_22431 ?auto_22433 ) ) ( not ( = ?auto_22437 ?auto_22433 ) ) ( AVAILABLE ?auto_22433 ) ( SURFACE-AT ?auto_22439 ?auto_22444 ) ( ON ?auto_22439 ?auto_22443 ) ( CLEAR ?auto_22439 ) ( not ( = ?auto_22429 ?auto_22443 ) ) ( not ( = ?auto_22430 ?auto_22443 ) ) ( not ( = ?auto_22432 ?auto_22443 ) ) ( not ( = ?auto_22439 ?auto_22443 ) ) ( not ( = ?auto_22445 ?auto_22443 ) ) ( not ( = ?auto_22441 ?auto_22443 ) ) ( SURFACE-AT ?auto_22446 ?auto_22438 ) ( CLEAR ?auto_22446 ) ( IS-CRATE ?auto_22441 ) ( not ( = ?auto_22429 ?auto_22446 ) ) ( not ( = ?auto_22430 ?auto_22446 ) ) ( not ( = ?auto_22432 ?auto_22446 ) ) ( not ( = ?auto_22439 ?auto_22446 ) ) ( not ( = ?auto_22445 ?auto_22446 ) ) ( not ( = ?auto_22441 ?auto_22446 ) ) ( not ( = ?auto_22443 ?auto_22446 ) ) ( AVAILABLE ?auto_22442 ) ( TRUCK-AT ?auto_22440 ?auto_22435 ) ( not ( = ?auto_22435 ?auto_22438 ) ) ( not ( = ?auto_22434 ?auto_22435 ) ) ( not ( = ?auto_22436 ?auto_22435 ) ) ( not ( = ?auto_22444 ?auto_22435 ) ) ( HOIST-AT ?auto_22447 ?auto_22435 ) ( LIFTING ?auto_22447 ?auto_22441 ) ( not ( = ?auto_22442 ?auto_22447 ) ) ( not ( = ?auto_22431 ?auto_22447 ) ) ( not ( = ?auto_22437 ?auto_22447 ) ) ( not ( = ?auto_22433 ?auto_22447 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22447 ?auto_22441 ?auto_22440 ?auto_22435 )
      ( MAKE-ON ?auto_22429 ?auto_22430 )
      ( MAKE-ON-VERIFY ?auto_22429 ?auto_22430 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22448 - SURFACE
      ?auto_22449 - SURFACE
    )
    :vars
    (
      ?auto_22455 - HOIST
      ?auto_22461 - PLACE
      ?auto_22453 - PLACE
      ?auto_22463 - HOIST
      ?auto_22462 - SURFACE
      ?auto_22466 - SURFACE
      ?auto_22458 - PLACE
      ?auto_22459 - HOIST
      ?auto_22464 - SURFACE
      ?auto_22454 - SURFACE
      ?auto_22452 - PLACE
      ?auto_22451 - HOIST
      ?auto_22457 - SURFACE
      ?auto_22465 - SURFACE
      ?auto_22456 - TRUCK
      ?auto_22450 - PLACE
      ?auto_22460 - HOIST
      ?auto_22467 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22455 ?auto_22461 ) ( IS-CRATE ?auto_22448 ) ( not ( = ?auto_22448 ?auto_22449 ) ) ( not ( = ?auto_22453 ?auto_22461 ) ) ( HOIST-AT ?auto_22463 ?auto_22453 ) ( not ( = ?auto_22455 ?auto_22463 ) ) ( AVAILABLE ?auto_22463 ) ( SURFACE-AT ?auto_22448 ?auto_22453 ) ( ON ?auto_22448 ?auto_22462 ) ( CLEAR ?auto_22448 ) ( not ( = ?auto_22448 ?auto_22462 ) ) ( not ( = ?auto_22449 ?auto_22462 ) ) ( IS-CRATE ?auto_22449 ) ( not ( = ?auto_22448 ?auto_22466 ) ) ( not ( = ?auto_22449 ?auto_22466 ) ) ( not ( = ?auto_22462 ?auto_22466 ) ) ( not ( = ?auto_22458 ?auto_22461 ) ) ( not ( = ?auto_22453 ?auto_22458 ) ) ( HOIST-AT ?auto_22459 ?auto_22458 ) ( not ( = ?auto_22455 ?auto_22459 ) ) ( not ( = ?auto_22463 ?auto_22459 ) ) ( AVAILABLE ?auto_22459 ) ( SURFACE-AT ?auto_22449 ?auto_22458 ) ( ON ?auto_22449 ?auto_22464 ) ( CLEAR ?auto_22449 ) ( not ( = ?auto_22448 ?auto_22464 ) ) ( not ( = ?auto_22449 ?auto_22464 ) ) ( not ( = ?auto_22462 ?auto_22464 ) ) ( not ( = ?auto_22466 ?auto_22464 ) ) ( IS-CRATE ?auto_22466 ) ( not ( = ?auto_22448 ?auto_22454 ) ) ( not ( = ?auto_22449 ?auto_22454 ) ) ( not ( = ?auto_22462 ?auto_22454 ) ) ( not ( = ?auto_22466 ?auto_22454 ) ) ( not ( = ?auto_22464 ?auto_22454 ) ) ( not ( = ?auto_22452 ?auto_22461 ) ) ( not ( = ?auto_22453 ?auto_22452 ) ) ( not ( = ?auto_22458 ?auto_22452 ) ) ( HOIST-AT ?auto_22451 ?auto_22452 ) ( not ( = ?auto_22455 ?auto_22451 ) ) ( not ( = ?auto_22463 ?auto_22451 ) ) ( not ( = ?auto_22459 ?auto_22451 ) ) ( AVAILABLE ?auto_22451 ) ( SURFACE-AT ?auto_22466 ?auto_22452 ) ( ON ?auto_22466 ?auto_22457 ) ( CLEAR ?auto_22466 ) ( not ( = ?auto_22448 ?auto_22457 ) ) ( not ( = ?auto_22449 ?auto_22457 ) ) ( not ( = ?auto_22462 ?auto_22457 ) ) ( not ( = ?auto_22466 ?auto_22457 ) ) ( not ( = ?auto_22464 ?auto_22457 ) ) ( not ( = ?auto_22454 ?auto_22457 ) ) ( SURFACE-AT ?auto_22465 ?auto_22461 ) ( CLEAR ?auto_22465 ) ( IS-CRATE ?auto_22454 ) ( not ( = ?auto_22448 ?auto_22465 ) ) ( not ( = ?auto_22449 ?auto_22465 ) ) ( not ( = ?auto_22462 ?auto_22465 ) ) ( not ( = ?auto_22466 ?auto_22465 ) ) ( not ( = ?auto_22464 ?auto_22465 ) ) ( not ( = ?auto_22454 ?auto_22465 ) ) ( not ( = ?auto_22457 ?auto_22465 ) ) ( AVAILABLE ?auto_22455 ) ( TRUCK-AT ?auto_22456 ?auto_22450 ) ( not ( = ?auto_22450 ?auto_22461 ) ) ( not ( = ?auto_22453 ?auto_22450 ) ) ( not ( = ?auto_22458 ?auto_22450 ) ) ( not ( = ?auto_22452 ?auto_22450 ) ) ( HOIST-AT ?auto_22460 ?auto_22450 ) ( not ( = ?auto_22455 ?auto_22460 ) ) ( not ( = ?auto_22463 ?auto_22460 ) ) ( not ( = ?auto_22459 ?auto_22460 ) ) ( not ( = ?auto_22451 ?auto_22460 ) ) ( AVAILABLE ?auto_22460 ) ( SURFACE-AT ?auto_22454 ?auto_22450 ) ( ON ?auto_22454 ?auto_22467 ) ( CLEAR ?auto_22454 ) ( not ( = ?auto_22448 ?auto_22467 ) ) ( not ( = ?auto_22449 ?auto_22467 ) ) ( not ( = ?auto_22462 ?auto_22467 ) ) ( not ( = ?auto_22466 ?auto_22467 ) ) ( not ( = ?auto_22464 ?auto_22467 ) ) ( not ( = ?auto_22454 ?auto_22467 ) ) ( not ( = ?auto_22457 ?auto_22467 ) ) ( not ( = ?auto_22465 ?auto_22467 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22460 ?auto_22454 ?auto_22467 ?auto_22450 )
      ( MAKE-ON ?auto_22448 ?auto_22449 )
      ( MAKE-ON-VERIFY ?auto_22448 ?auto_22449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22468 - SURFACE
      ?auto_22469 - SURFACE
    )
    :vars
    (
      ?auto_22478 - HOIST
      ?auto_22481 - PLACE
      ?auto_22475 - PLACE
      ?auto_22471 - HOIST
      ?auto_22479 - SURFACE
      ?auto_22486 - SURFACE
      ?auto_22472 - PLACE
      ?auto_22473 - HOIST
      ?auto_22484 - SURFACE
      ?auto_22474 - SURFACE
      ?auto_22477 - PLACE
      ?auto_22470 - HOIST
      ?auto_22476 - SURFACE
      ?auto_22482 - SURFACE
      ?auto_22483 - PLACE
      ?auto_22480 - HOIST
      ?auto_22487 - SURFACE
      ?auto_22485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22478 ?auto_22481 ) ( IS-CRATE ?auto_22468 ) ( not ( = ?auto_22468 ?auto_22469 ) ) ( not ( = ?auto_22475 ?auto_22481 ) ) ( HOIST-AT ?auto_22471 ?auto_22475 ) ( not ( = ?auto_22478 ?auto_22471 ) ) ( AVAILABLE ?auto_22471 ) ( SURFACE-AT ?auto_22468 ?auto_22475 ) ( ON ?auto_22468 ?auto_22479 ) ( CLEAR ?auto_22468 ) ( not ( = ?auto_22468 ?auto_22479 ) ) ( not ( = ?auto_22469 ?auto_22479 ) ) ( IS-CRATE ?auto_22469 ) ( not ( = ?auto_22468 ?auto_22486 ) ) ( not ( = ?auto_22469 ?auto_22486 ) ) ( not ( = ?auto_22479 ?auto_22486 ) ) ( not ( = ?auto_22472 ?auto_22481 ) ) ( not ( = ?auto_22475 ?auto_22472 ) ) ( HOIST-AT ?auto_22473 ?auto_22472 ) ( not ( = ?auto_22478 ?auto_22473 ) ) ( not ( = ?auto_22471 ?auto_22473 ) ) ( AVAILABLE ?auto_22473 ) ( SURFACE-AT ?auto_22469 ?auto_22472 ) ( ON ?auto_22469 ?auto_22484 ) ( CLEAR ?auto_22469 ) ( not ( = ?auto_22468 ?auto_22484 ) ) ( not ( = ?auto_22469 ?auto_22484 ) ) ( not ( = ?auto_22479 ?auto_22484 ) ) ( not ( = ?auto_22486 ?auto_22484 ) ) ( IS-CRATE ?auto_22486 ) ( not ( = ?auto_22468 ?auto_22474 ) ) ( not ( = ?auto_22469 ?auto_22474 ) ) ( not ( = ?auto_22479 ?auto_22474 ) ) ( not ( = ?auto_22486 ?auto_22474 ) ) ( not ( = ?auto_22484 ?auto_22474 ) ) ( not ( = ?auto_22477 ?auto_22481 ) ) ( not ( = ?auto_22475 ?auto_22477 ) ) ( not ( = ?auto_22472 ?auto_22477 ) ) ( HOIST-AT ?auto_22470 ?auto_22477 ) ( not ( = ?auto_22478 ?auto_22470 ) ) ( not ( = ?auto_22471 ?auto_22470 ) ) ( not ( = ?auto_22473 ?auto_22470 ) ) ( AVAILABLE ?auto_22470 ) ( SURFACE-AT ?auto_22486 ?auto_22477 ) ( ON ?auto_22486 ?auto_22476 ) ( CLEAR ?auto_22486 ) ( not ( = ?auto_22468 ?auto_22476 ) ) ( not ( = ?auto_22469 ?auto_22476 ) ) ( not ( = ?auto_22479 ?auto_22476 ) ) ( not ( = ?auto_22486 ?auto_22476 ) ) ( not ( = ?auto_22484 ?auto_22476 ) ) ( not ( = ?auto_22474 ?auto_22476 ) ) ( SURFACE-AT ?auto_22482 ?auto_22481 ) ( CLEAR ?auto_22482 ) ( IS-CRATE ?auto_22474 ) ( not ( = ?auto_22468 ?auto_22482 ) ) ( not ( = ?auto_22469 ?auto_22482 ) ) ( not ( = ?auto_22479 ?auto_22482 ) ) ( not ( = ?auto_22486 ?auto_22482 ) ) ( not ( = ?auto_22484 ?auto_22482 ) ) ( not ( = ?auto_22474 ?auto_22482 ) ) ( not ( = ?auto_22476 ?auto_22482 ) ) ( AVAILABLE ?auto_22478 ) ( not ( = ?auto_22483 ?auto_22481 ) ) ( not ( = ?auto_22475 ?auto_22483 ) ) ( not ( = ?auto_22472 ?auto_22483 ) ) ( not ( = ?auto_22477 ?auto_22483 ) ) ( HOIST-AT ?auto_22480 ?auto_22483 ) ( not ( = ?auto_22478 ?auto_22480 ) ) ( not ( = ?auto_22471 ?auto_22480 ) ) ( not ( = ?auto_22473 ?auto_22480 ) ) ( not ( = ?auto_22470 ?auto_22480 ) ) ( AVAILABLE ?auto_22480 ) ( SURFACE-AT ?auto_22474 ?auto_22483 ) ( ON ?auto_22474 ?auto_22487 ) ( CLEAR ?auto_22474 ) ( not ( = ?auto_22468 ?auto_22487 ) ) ( not ( = ?auto_22469 ?auto_22487 ) ) ( not ( = ?auto_22479 ?auto_22487 ) ) ( not ( = ?auto_22486 ?auto_22487 ) ) ( not ( = ?auto_22484 ?auto_22487 ) ) ( not ( = ?auto_22474 ?auto_22487 ) ) ( not ( = ?auto_22476 ?auto_22487 ) ) ( not ( = ?auto_22482 ?auto_22487 ) ) ( TRUCK-AT ?auto_22485 ?auto_22481 ) )
    :subtasks
    ( ( !DRIVE ?auto_22485 ?auto_22481 ?auto_22483 )
      ( MAKE-ON ?auto_22468 ?auto_22469 )
      ( MAKE-ON-VERIFY ?auto_22468 ?auto_22469 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22488 - SURFACE
      ?auto_22489 - SURFACE
    )
    :vars
    (
      ?auto_22503 - HOIST
      ?auto_22504 - PLACE
      ?auto_22490 - PLACE
      ?auto_22502 - HOIST
      ?auto_22498 - SURFACE
      ?auto_22494 - SURFACE
      ?auto_22492 - PLACE
      ?auto_22491 - HOIST
      ?auto_22499 - SURFACE
      ?auto_22507 - SURFACE
      ?auto_22505 - PLACE
      ?auto_22497 - HOIST
      ?auto_22501 - SURFACE
      ?auto_22506 - SURFACE
      ?auto_22493 - PLACE
      ?auto_22500 - HOIST
      ?auto_22495 - SURFACE
      ?auto_22496 - TRUCK
      ?auto_22508 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22503 ?auto_22504 ) ( IS-CRATE ?auto_22488 ) ( not ( = ?auto_22488 ?auto_22489 ) ) ( not ( = ?auto_22490 ?auto_22504 ) ) ( HOIST-AT ?auto_22502 ?auto_22490 ) ( not ( = ?auto_22503 ?auto_22502 ) ) ( AVAILABLE ?auto_22502 ) ( SURFACE-AT ?auto_22488 ?auto_22490 ) ( ON ?auto_22488 ?auto_22498 ) ( CLEAR ?auto_22488 ) ( not ( = ?auto_22488 ?auto_22498 ) ) ( not ( = ?auto_22489 ?auto_22498 ) ) ( IS-CRATE ?auto_22489 ) ( not ( = ?auto_22488 ?auto_22494 ) ) ( not ( = ?auto_22489 ?auto_22494 ) ) ( not ( = ?auto_22498 ?auto_22494 ) ) ( not ( = ?auto_22492 ?auto_22504 ) ) ( not ( = ?auto_22490 ?auto_22492 ) ) ( HOIST-AT ?auto_22491 ?auto_22492 ) ( not ( = ?auto_22503 ?auto_22491 ) ) ( not ( = ?auto_22502 ?auto_22491 ) ) ( AVAILABLE ?auto_22491 ) ( SURFACE-AT ?auto_22489 ?auto_22492 ) ( ON ?auto_22489 ?auto_22499 ) ( CLEAR ?auto_22489 ) ( not ( = ?auto_22488 ?auto_22499 ) ) ( not ( = ?auto_22489 ?auto_22499 ) ) ( not ( = ?auto_22498 ?auto_22499 ) ) ( not ( = ?auto_22494 ?auto_22499 ) ) ( IS-CRATE ?auto_22494 ) ( not ( = ?auto_22488 ?auto_22507 ) ) ( not ( = ?auto_22489 ?auto_22507 ) ) ( not ( = ?auto_22498 ?auto_22507 ) ) ( not ( = ?auto_22494 ?auto_22507 ) ) ( not ( = ?auto_22499 ?auto_22507 ) ) ( not ( = ?auto_22505 ?auto_22504 ) ) ( not ( = ?auto_22490 ?auto_22505 ) ) ( not ( = ?auto_22492 ?auto_22505 ) ) ( HOIST-AT ?auto_22497 ?auto_22505 ) ( not ( = ?auto_22503 ?auto_22497 ) ) ( not ( = ?auto_22502 ?auto_22497 ) ) ( not ( = ?auto_22491 ?auto_22497 ) ) ( AVAILABLE ?auto_22497 ) ( SURFACE-AT ?auto_22494 ?auto_22505 ) ( ON ?auto_22494 ?auto_22501 ) ( CLEAR ?auto_22494 ) ( not ( = ?auto_22488 ?auto_22501 ) ) ( not ( = ?auto_22489 ?auto_22501 ) ) ( not ( = ?auto_22498 ?auto_22501 ) ) ( not ( = ?auto_22494 ?auto_22501 ) ) ( not ( = ?auto_22499 ?auto_22501 ) ) ( not ( = ?auto_22507 ?auto_22501 ) ) ( IS-CRATE ?auto_22507 ) ( not ( = ?auto_22488 ?auto_22506 ) ) ( not ( = ?auto_22489 ?auto_22506 ) ) ( not ( = ?auto_22498 ?auto_22506 ) ) ( not ( = ?auto_22494 ?auto_22506 ) ) ( not ( = ?auto_22499 ?auto_22506 ) ) ( not ( = ?auto_22507 ?auto_22506 ) ) ( not ( = ?auto_22501 ?auto_22506 ) ) ( not ( = ?auto_22493 ?auto_22504 ) ) ( not ( = ?auto_22490 ?auto_22493 ) ) ( not ( = ?auto_22492 ?auto_22493 ) ) ( not ( = ?auto_22505 ?auto_22493 ) ) ( HOIST-AT ?auto_22500 ?auto_22493 ) ( not ( = ?auto_22503 ?auto_22500 ) ) ( not ( = ?auto_22502 ?auto_22500 ) ) ( not ( = ?auto_22491 ?auto_22500 ) ) ( not ( = ?auto_22497 ?auto_22500 ) ) ( AVAILABLE ?auto_22500 ) ( SURFACE-AT ?auto_22507 ?auto_22493 ) ( ON ?auto_22507 ?auto_22495 ) ( CLEAR ?auto_22507 ) ( not ( = ?auto_22488 ?auto_22495 ) ) ( not ( = ?auto_22489 ?auto_22495 ) ) ( not ( = ?auto_22498 ?auto_22495 ) ) ( not ( = ?auto_22494 ?auto_22495 ) ) ( not ( = ?auto_22499 ?auto_22495 ) ) ( not ( = ?auto_22507 ?auto_22495 ) ) ( not ( = ?auto_22501 ?auto_22495 ) ) ( not ( = ?auto_22506 ?auto_22495 ) ) ( TRUCK-AT ?auto_22496 ?auto_22504 ) ( SURFACE-AT ?auto_22508 ?auto_22504 ) ( CLEAR ?auto_22508 ) ( LIFTING ?auto_22503 ?auto_22506 ) ( IS-CRATE ?auto_22506 ) ( not ( = ?auto_22488 ?auto_22508 ) ) ( not ( = ?auto_22489 ?auto_22508 ) ) ( not ( = ?auto_22498 ?auto_22508 ) ) ( not ( = ?auto_22494 ?auto_22508 ) ) ( not ( = ?auto_22499 ?auto_22508 ) ) ( not ( = ?auto_22507 ?auto_22508 ) ) ( not ( = ?auto_22501 ?auto_22508 ) ) ( not ( = ?auto_22506 ?auto_22508 ) ) ( not ( = ?auto_22495 ?auto_22508 ) ) )
    :subtasks
    ( ( !DROP ?auto_22503 ?auto_22506 ?auto_22508 ?auto_22504 )
      ( MAKE-ON ?auto_22488 ?auto_22489 )
      ( MAKE-ON-VERIFY ?auto_22488 ?auto_22489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22509 - SURFACE
      ?auto_22510 - SURFACE
    )
    :vars
    (
      ?auto_22519 - HOIST
      ?auto_22528 - PLACE
      ?auto_22517 - PLACE
      ?auto_22527 - HOIST
      ?auto_22516 - SURFACE
      ?auto_22525 - SURFACE
      ?auto_22523 - PLACE
      ?auto_22522 - HOIST
      ?auto_22529 - SURFACE
      ?auto_22511 - SURFACE
      ?auto_22513 - PLACE
      ?auto_22520 - HOIST
      ?auto_22521 - SURFACE
      ?auto_22514 - SURFACE
      ?auto_22524 - PLACE
      ?auto_22518 - HOIST
      ?auto_22526 - SURFACE
      ?auto_22512 - TRUCK
      ?auto_22515 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22519 ?auto_22528 ) ( IS-CRATE ?auto_22509 ) ( not ( = ?auto_22509 ?auto_22510 ) ) ( not ( = ?auto_22517 ?auto_22528 ) ) ( HOIST-AT ?auto_22527 ?auto_22517 ) ( not ( = ?auto_22519 ?auto_22527 ) ) ( AVAILABLE ?auto_22527 ) ( SURFACE-AT ?auto_22509 ?auto_22517 ) ( ON ?auto_22509 ?auto_22516 ) ( CLEAR ?auto_22509 ) ( not ( = ?auto_22509 ?auto_22516 ) ) ( not ( = ?auto_22510 ?auto_22516 ) ) ( IS-CRATE ?auto_22510 ) ( not ( = ?auto_22509 ?auto_22525 ) ) ( not ( = ?auto_22510 ?auto_22525 ) ) ( not ( = ?auto_22516 ?auto_22525 ) ) ( not ( = ?auto_22523 ?auto_22528 ) ) ( not ( = ?auto_22517 ?auto_22523 ) ) ( HOIST-AT ?auto_22522 ?auto_22523 ) ( not ( = ?auto_22519 ?auto_22522 ) ) ( not ( = ?auto_22527 ?auto_22522 ) ) ( AVAILABLE ?auto_22522 ) ( SURFACE-AT ?auto_22510 ?auto_22523 ) ( ON ?auto_22510 ?auto_22529 ) ( CLEAR ?auto_22510 ) ( not ( = ?auto_22509 ?auto_22529 ) ) ( not ( = ?auto_22510 ?auto_22529 ) ) ( not ( = ?auto_22516 ?auto_22529 ) ) ( not ( = ?auto_22525 ?auto_22529 ) ) ( IS-CRATE ?auto_22525 ) ( not ( = ?auto_22509 ?auto_22511 ) ) ( not ( = ?auto_22510 ?auto_22511 ) ) ( not ( = ?auto_22516 ?auto_22511 ) ) ( not ( = ?auto_22525 ?auto_22511 ) ) ( not ( = ?auto_22529 ?auto_22511 ) ) ( not ( = ?auto_22513 ?auto_22528 ) ) ( not ( = ?auto_22517 ?auto_22513 ) ) ( not ( = ?auto_22523 ?auto_22513 ) ) ( HOIST-AT ?auto_22520 ?auto_22513 ) ( not ( = ?auto_22519 ?auto_22520 ) ) ( not ( = ?auto_22527 ?auto_22520 ) ) ( not ( = ?auto_22522 ?auto_22520 ) ) ( AVAILABLE ?auto_22520 ) ( SURFACE-AT ?auto_22525 ?auto_22513 ) ( ON ?auto_22525 ?auto_22521 ) ( CLEAR ?auto_22525 ) ( not ( = ?auto_22509 ?auto_22521 ) ) ( not ( = ?auto_22510 ?auto_22521 ) ) ( not ( = ?auto_22516 ?auto_22521 ) ) ( not ( = ?auto_22525 ?auto_22521 ) ) ( not ( = ?auto_22529 ?auto_22521 ) ) ( not ( = ?auto_22511 ?auto_22521 ) ) ( IS-CRATE ?auto_22511 ) ( not ( = ?auto_22509 ?auto_22514 ) ) ( not ( = ?auto_22510 ?auto_22514 ) ) ( not ( = ?auto_22516 ?auto_22514 ) ) ( not ( = ?auto_22525 ?auto_22514 ) ) ( not ( = ?auto_22529 ?auto_22514 ) ) ( not ( = ?auto_22511 ?auto_22514 ) ) ( not ( = ?auto_22521 ?auto_22514 ) ) ( not ( = ?auto_22524 ?auto_22528 ) ) ( not ( = ?auto_22517 ?auto_22524 ) ) ( not ( = ?auto_22523 ?auto_22524 ) ) ( not ( = ?auto_22513 ?auto_22524 ) ) ( HOIST-AT ?auto_22518 ?auto_22524 ) ( not ( = ?auto_22519 ?auto_22518 ) ) ( not ( = ?auto_22527 ?auto_22518 ) ) ( not ( = ?auto_22522 ?auto_22518 ) ) ( not ( = ?auto_22520 ?auto_22518 ) ) ( AVAILABLE ?auto_22518 ) ( SURFACE-AT ?auto_22511 ?auto_22524 ) ( ON ?auto_22511 ?auto_22526 ) ( CLEAR ?auto_22511 ) ( not ( = ?auto_22509 ?auto_22526 ) ) ( not ( = ?auto_22510 ?auto_22526 ) ) ( not ( = ?auto_22516 ?auto_22526 ) ) ( not ( = ?auto_22525 ?auto_22526 ) ) ( not ( = ?auto_22529 ?auto_22526 ) ) ( not ( = ?auto_22511 ?auto_22526 ) ) ( not ( = ?auto_22521 ?auto_22526 ) ) ( not ( = ?auto_22514 ?auto_22526 ) ) ( TRUCK-AT ?auto_22512 ?auto_22528 ) ( SURFACE-AT ?auto_22515 ?auto_22528 ) ( CLEAR ?auto_22515 ) ( IS-CRATE ?auto_22514 ) ( not ( = ?auto_22509 ?auto_22515 ) ) ( not ( = ?auto_22510 ?auto_22515 ) ) ( not ( = ?auto_22516 ?auto_22515 ) ) ( not ( = ?auto_22525 ?auto_22515 ) ) ( not ( = ?auto_22529 ?auto_22515 ) ) ( not ( = ?auto_22511 ?auto_22515 ) ) ( not ( = ?auto_22521 ?auto_22515 ) ) ( not ( = ?auto_22514 ?auto_22515 ) ) ( not ( = ?auto_22526 ?auto_22515 ) ) ( AVAILABLE ?auto_22519 ) ( IN ?auto_22514 ?auto_22512 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22519 ?auto_22514 ?auto_22512 ?auto_22528 )
      ( MAKE-ON ?auto_22509 ?auto_22510 )
      ( MAKE-ON-VERIFY ?auto_22509 ?auto_22510 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22530 - SURFACE
      ?auto_22531 - SURFACE
    )
    :vars
    (
      ?auto_22550 - HOIST
      ?auto_22546 - PLACE
      ?auto_22533 - PLACE
      ?auto_22545 - HOIST
      ?auto_22534 - SURFACE
      ?auto_22542 - SURFACE
      ?auto_22549 - PLACE
      ?auto_22543 - HOIST
      ?auto_22547 - SURFACE
      ?auto_22541 - SURFACE
      ?auto_22532 - PLACE
      ?auto_22535 - HOIST
      ?auto_22538 - SURFACE
      ?auto_22537 - SURFACE
      ?auto_22539 - PLACE
      ?auto_22536 - HOIST
      ?auto_22548 - SURFACE
      ?auto_22544 - SURFACE
      ?auto_22540 - TRUCK
      ?auto_22551 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22550 ?auto_22546 ) ( IS-CRATE ?auto_22530 ) ( not ( = ?auto_22530 ?auto_22531 ) ) ( not ( = ?auto_22533 ?auto_22546 ) ) ( HOIST-AT ?auto_22545 ?auto_22533 ) ( not ( = ?auto_22550 ?auto_22545 ) ) ( AVAILABLE ?auto_22545 ) ( SURFACE-AT ?auto_22530 ?auto_22533 ) ( ON ?auto_22530 ?auto_22534 ) ( CLEAR ?auto_22530 ) ( not ( = ?auto_22530 ?auto_22534 ) ) ( not ( = ?auto_22531 ?auto_22534 ) ) ( IS-CRATE ?auto_22531 ) ( not ( = ?auto_22530 ?auto_22542 ) ) ( not ( = ?auto_22531 ?auto_22542 ) ) ( not ( = ?auto_22534 ?auto_22542 ) ) ( not ( = ?auto_22549 ?auto_22546 ) ) ( not ( = ?auto_22533 ?auto_22549 ) ) ( HOIST-AT ?auto_22543 ?auto_22549 ) ( not ( = ?auto_22550 ?auto_22543 ) ) ( not ( = ?auto_22545 ?auto_22543 ) ) ( AVAILABLE ?auto_22543 ) ( SURFACE-AT ?auto_22531 ?auto_22549 ) ( ON ?auto_22531 ?auto_22547 ) ( CLEAR ?auto_22531 ) ( not ( = ?auto_22530 ?auto_22547 ) ) ( not ( = ?auto_22531 ?auto_22547 ) ) ( not ( = ?auto_22534 ?auto_22547 ) ) ( not ( = ?auto_22542 ?auto_22547 ) ) ( IS-CRATE ?auto_22542 ) ( not ( = ?auto_22530 ?auto_22541 ) ) ( not ( = ?auto_22531 ?auto_22541 ) ) ( not ( = ?auto_22534 ?auto_22541 ) ) ( not ( = ?auto_22542 ?auto_22541 ) ) ( not ( = ?auto_22547 ?auto_22541 ) ) ( not ( = ?auto_22532 ?auto_22546 ) ) ( not ( = ?auto_22533 ?auto_22532 ) ) ( not ( = ?auto_22549 ?auto_22532 ) ) ( HOIST-AT ?auto_22535 ?auto_22532 ) ( not ( = ?auto_22550 ?auto_22535 ) ) ( not ( = ?auto_22545 ?auto_22535 ) ) ( not ( = ?auto_22543 ?auto_22535 ) ) ( AVAILABLE ?auto_22535 ) ( SURFACE-AT ?auto_22542 ?auto_22532 ) ( ON ?auto_22542 ?auto_22538 ) ( CLEAR ?auto_22542 ) ( not ( = ?auto_22530 ?auto_22538 ) ) ( not ( = ?auto_22531 ?auto_22538 ) ) ( not ( = ?auto_22534 ?auto_22538 ) ) ( not ( = ?auto_22542 ?auto_22538 ) ) ( not ( = ?auto_22547 ?auto_22538 ) ) ( not ( = ?auto_22541 ?auto_22538 ) ) ( IS-CRATE ?auto_22541 ) ( not ( = ?auto_22530 ?auto_22537 ) ) ( not ( = ?auto_22531 ?auto_22537 ) ) ( not ( = ?auto_22534 ?auto_22537 ) ) ( not ( = ?auto_22542 ?auto_22537 ) ) ( not ( = ?auto_22547 ?auto_22537 ) ) ( not ( = ?auto_22541 ?auto_22537 ) ) ( not ( = ?auto_22538 ?auto_22537 ) ) ( not ( = ?auto_22539 ?auto_22546 ) ) ( not ( = ?auto_22533 ?auto_22539 ) ) ( not ( = ?auto_22549 ?auto_22539 ) ) ( not ( = ?auto_22532 ?auto_22539 ) ) ( HOIST-AT ?auto_22536 ?auto_22539 ) ( not ( = ?auto_22550 ?auto_22536 ) ) ( not ( = ?auto_22545 ?auto_22536 ) ) ( not ( = ?auto_22543 ?auto_22536 ) ) ( not ( = ?auto_22535 ?auto_22536 ) ) ( AVAILABLE ?auto_22536 ) ( SURFACE-AT ?auto_22541 ?auto_22539 ) ( ON ?auto_22541 ?auto_22548 ) ( CLEAR ?auto_22541 ) ( not ( = ?auto_22530 ?auto_22548 ) ) ( not ( = ?auto_22531 ?auto_22548 ) ) ( not ( = ?auto_22534 ?auto_22548 ) ) ( not ( = ?auto_22542 ?auto_22548 ) ) ( not ( = ?auto_22547 ?auto_22548 ) ) ( not ( = ?auto_22541 ?auto_22548 ) ) ( not ( = ?auto_22538 ?auto_22548 ) ) ( not ( = ?auto_22537 ?auto_22548 ) ) ( SURFACE-AT ?auto_22544 ?auto_22546 ) ( CLEAR ?auto_22544 ) ( IS-CRATE ?auto_22537 ) ( not ( = ?auto_22530 ?auto_22544 ) ) ( not ( = ?auto_22531 ?auto_22544 ) ) ( not ( = ?auto_22534 ?auto_22544 ) ) ( not ( = ?auto_22542 ?auto_22544 ) ) ( not ( = ?auto_22547 ?auto_22544 ) ) ( not ( = ?auto_22541 ?auto_22544 ) ) ( not ( = ?auto_22538 ?auto_22544 ) ) ( not ( = ?auto_22537 ?auto_22544 ) ) ( not ( = ?auto_22548 ?auto_22544 ) ) ( AVAILABLE ?auto_22550 ) ( IN ?auto_22537 ?auto_22540 ) ( TRUCK-AT ?auto_22540 ?auto_22551 ) ( not ( = ?auto_22551 ?auto_22546 ) ) ( not ( = ?auto_22533 ?auto_22551 ) ) ( not ( = ?auto_22549 ?auto_22551 ) ) ( not ( = ?auto_22532 ?auto_22551 ) ) ( not ( = ?auto_22539 ?auto_22551 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22540 ?auto_22551 ?auto_22546 )
      ( MAKE-ON ?auto_22530 ?auto_22531 )
      ( MAKE-ON-VERIFY ?auto_22530 ?auto_22531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22552 - SURFACE
      ?auto_22553 - SURFACE
    )
    :vars
    (
      ?auto_22554 - HOIST
      ?auto_22563 - PLACE
      ?auto_22558 - PLACE
      ?auto_22568 - HOIST
      ?auto_22566 - SURFACE
      ?auto_22562 - SURFACE
      ?auto_22573 - PLACE
      ?auto_22559 - HOIST
      ?auto_22556 - SURFACE
      ?auto_22560 - SURFACE
      ?auto_22569 - PLACE
      ?auto_22571 - HOIST
      ?auto_22564 - SURFACE
      ?auto_22561 - SURFACE
      ?auto_22557 - PLACE
      ?auto_22570 - HOIST
      ?auto_22572 - SURFACE
      ?auto_22555 - SURFACE
      ?auto_22567 - TRUCK
      ?auto_22565 - PLACE
      ?auto_22574 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22554 ?auto_22563 ) ( IS-CRATE ?auto_22552 ) ( not ( = ?auto_22552 ?auto_22553 ) ) ( not ( = ?auto_22558 ?auto_22563 ) ) ( HOIST-AT ?auto_22568 ?auto_22558 ) ( not ( = ?auto_22554 ?auto_22568 ) ) ( AVAILABLE ?auto_22568 ) ( SURFACE-AT ?auto_22552 ?auto_22558 ) ( ON ?auto_22552 ?auto_22566 ) ( CLEAR ?auto_22552 ) ( not ( = ?auto_22552 ?auto_22566 ) ) ( not ( = ?auto_22553 ?auto_22566 ) ) ( IS-CRATE ?auto_22553 ) ( not ( = ?auto_22552 ?auto_22562 ) ) ( not ( = ?auto_22553 ?auto_22562 ) ) ( not ( = ?auto_22566 ?auto_22562 ) ) ( not ( = ?auto_22573 ?auto_22563 ) ) ( not ( = ?auto_22558 ?auto_22573 ) ) ( HOIST-AT ?auto_22559 ?auto_22573 ) ( not ( = ?auto_22554 ?auto_22559 ) ) ( not ( = ?auto_22568 ?auto_22559 ) ) ( AVAILABLE ?auto_22559 ) ( SURFACE-AT ?auto_22553 ?auto_22573 ) ( ON ?auto_22553 ?auto_22556 ) ( CLEAR ?auto_22553 ) ( not ( = ?auto_22552 ?auto_22556 ) ) ( not ( = ?auto_22553 ?auto_22556 ) ) ( not ( = ?auto_22566 ?auto_22556 ) ) ( not ( = ?auto_22562 ?auto_22556 ) ) ( IS-CRATE ?auto_22562 ) ( not ( = ?auto_22552 ?auto_22560 ) ) ( not ( = ?auto_22553 ?auto_22560 ) ) ( not ( = ?auto_22566 ?auto_22560 ) ) ( not ( = ?auto_22562 ?auto_22560 ) ) ( not ( = ?auto_22556 ?auto_22560 ) ) ( not ( = ?auto_22569 ?auto_22563 ) ) ( not ( = ?auto_22558 ?auto_22569 ) ) ( not ( = ?auto_22573 ?auto_22569 ) ) ( HOIST-AT ?auto_22571 ?auto_22569 ) ( not ( = ?auto_22554 ?auto_22571 ) ) ( not ( = ?auto_22568 ?auto_22571 ) ) ( not ( = ?auto_22559 ?auto_22571 ) ) ( AVAILABLE ?auto_22571 ) ( SURFACE-AT ?auto_22562 ?auto_22569 ) ( ON ?auto_22562 ?auto_22564 ) ( CLEAR ?auto_22562 ) ( not ( = ?auto_22552 ?auto_22564 ) ) ( not ( = ?auto_22553 ?auto_22564 ) ) ( not ( = ?auto_22566 ?auto_22564 ) ) ( not ( = ?auto_22562 ?auto_22564 ) ) ( not ( = ?auto_22556 ?auto_22564 ) ) ( not ( = ?auto_22560 ?auto_22564 ) ) ( IS-CRATE ?auto_22560 ) ( not ( = ?auto_22552 ?auto_22561 ) ) ( not ( = ?auto_22553 ?auto_22561 ) ) ( not ( = ?auto_22566 ?auto_22561 ) ) ( not ( = ?auto_22562 ?auto_22561 ) ) ( not ( = ?auto_22556 ?auto_22561 ) ) ( not ( = ?auto_22560 ?auto_22561 ) ) ( not ( = ?auto_22564 ?auto_22561 ) ) ( not ( = ?auto_22557 ?auto_22563 ) ) ( not ( = ?auto_22558 ?auto_22557 ) ) ( not ( = ?auto_22573 ?auto_22557 ) ) ( not ( = ?auto_22569 ?auto_22557 ) ) ( HOIST-AT ?auto_22570 ?auto_22557 ) ( not ( = ?auto_22554 ?auto_22570 ) ) ( not ( = ?auto_22568 ?auto_22570 ) ) ( not ( = ?auto_22559 ?auto_22570 ) ) ( not ( = ?auto_22571 ?auto_22570 ) ) ( AVAILABLE ?auto_22570 ) ( SURFACE-AT ?auto_22560 ?auto_22557 ) ( ON ?auto_22560 ?auto_22572 ) ( CLEAR ?auto_22560 ) ( not ( = ?auto_22552 ?auto_22572 ) ) ( not ( = ?auto_22553 ?auto_22572 ) ) ( not ( = ?auto_22566 ?auto_22572 ) ) ( not ( = ?auto_22562 ?auto_22572 ) ) ( not ( = ?auto_22556 ?auto_22572 ) ) ( not ( = ?auto_22560 ?auto_22572 ) ) ( not ( = ?auto_22564 ?auto_22572 ) ) ( not ( = ?auto_22561 ?auto_22572 ) ) ( SURFACE-AT ?auto_22555 ?auto_22563 ) ( CLEAR ?auto_22555 ) ( IS-CRATE ?auto_22561 ) ( not ( = ?auto_22552 ?auto_22555 ) ) ( not ( = ?auto_22553 ?auto_22555 ) ) ( not ( = ?auto_22566 ?auto_22555 ) ) ( not ( = ?auto_22562 ?auto_22555 ) ) ( not ( = ?auto_22556 ?auto_22555 ) ) ( not ( = ?auto_22560 ?auto_22555 ) ) ( not ( = ?auto_22564 ?auto_22555 ) ) ( not ( = ?auto_22561 ?auto_22555 ) ) ( not ( = ?auto_22572 ?auto_22555 ) ) ( AVAILABLE ?auto_22554 ) ( TRUCK-AT ?auto_22567 ?auto_22565 ) ( not ( = ?auto_22565 ?auto_22563 ) ) ( not ( = ?auto_22558 ?auto_22565 ) ) ( not ( = ?auto_22573 ?auto_22565 ) ) ( not ( = ?auto_22569 ?auto_22565 ) ) ( not ( = ?auto_22557 ?auto_22565 ) ) ( HOIST-AT ?auto_22574 ?auto_22565 ) ( LIFTING ?auto_22574 ?auto_22561 ) ( not ( = ?auto_22554 ?auto_22574 ) ) ( not ( = ?auto_22568 ?auto_22574 ) ) ( not ( = ?auto_22559 ?auto_22574 ) ) ( not ( = ?auto_22571 ?auto_22574 ) ) ( not ( = ?auto_22570 ?auto_22574 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22574 ?auto_22561 ?auto_22567 ?auto_22565 )
      ( MAKE-ON ?auto_22552 ?auto_22553 )
      ( MAKE-ON-VERIFY ?auto_22552 ?auto_22553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22575 - SURFACE
      ?auto_22576 - SURFACE
    )
    :vars
    (
      ?auto_22592 - HOIST
      ?auto_22582 - PLACE
      ?auto_22588 - PLACE
      ?auto_22578 - HOIST
      ?auto_22583 - SURFACE
      ?auto_22587 - SURFACE
      ?auto_22590 - PLACE
      ?auto_22595 - HOIST
      ?auto_22584 - SURFACE
      ?auto_22586 - SURFACE
      ?auto_22577 - PLACE
      ?auto_22591 - HOIST
      ?auto_22593 - SURFACE
      ?auto_22580 - SURFACE
      ?auto_22585 - PLACE
      ?auto_22597 - HOIST
      ?auto_22589 - SURFACE
      ?auto_22594 - SURFACE
      ?auto_22581 - TRUCK
      ?auto_22596 - PLACE
      ?auto_22579 - HOIST
      ?auto_22598 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22592 ?auto_22582 ) ( IS-CRATE ?auto_22575 ) ( not ( = ?auto_22575 ?auto_22576 ) ) ( not ( = ?auto_22588 ?auto_22582 ) ) ( HOIST-AT ?auto_22578 ?auto_22588 ) ( not ( = ?auto_22592 ?auto_22578 ) ) ( AVAILABLE ?auto_22578 ) ( SURFACE-AT ?auto_22575 ?auto_22588 ) ( ON ?auto_22575 ?auto_22583 ) ( CLEAR ?auto_22575 ) ( not ( = ?auto_22575 ?auto_22583 ) ) ( not ( = ?auto_22576 ?auto_22583 ) ) ( IS-CRATE ?auto_22576 ) ( not ( = ?auto_22575 ?auto_22587 ) ) ( not ( = ?auto_22576 ?auto_22587 ) ) ( not ( = ?auto_22583 ?auto_22587 ) ) ( not ( = ?auto_22590 ?auto_22582 ) ) ( not ( = ?auto_22588 ?auto_22590 ) ) ( HOIST-AT ?auto_22595 ?auto_22590 ) ( not ( = ?auto_22592 ?auto_22595 ) ) ( not ( = ?auto_22578 ?auto_22595 ) ) ( AVAILABLE ?auto_22595 ) ( SURFACE-AT ?auto_22576 ?auto_22590 ) ( ON ?auto_22576 ?auto_22584 ) ( CLEAR ?auto_22576 ) ( not ( = ?auto_22575 ?auto_22584 ) ) ( not ( = ?auto_22576 ?auto_22584 ) ) ( not ( = ?auto_22583 ?auto_22584 ) ) ( not ( = ?auto_22587 ?auto_22584 ) ) ( IS-CRATE ?auto_22587 ) ( not ( = ?auto_22575 ?auto_22586 ) ) ( not ( = ?auto_22576 ?auto_22586 ) ) ( not ( = ?auto_22583 ?auto_22586 ) ) ( not ( = ?auto_22587 ?auto_22586 ) ) ( not ( = ?auto_22584 ?auto_22586 ) ) ( not ( = ?auto_22577 ?auto_22582 ) ) ( not ( = ?auto_22588 ?auto_22577 ) ) ( not ( = ?auto_22590 ?auto_22577 ) ) ( HOIST-AT ?auto_22591 ?auto_22577 ) ( not ( = ?auto_22592 ?auto_22591 ) ) ( not ( = ?auto_22578 ?auto_22591 ) ) ( not ( = ?auto_22595 ?auto_22591 ) ) ( AVAILABLE ?auto_22591 ) ( SURFACE-AT ?auto_22587 ?auto_22577 ) ( ON ?auto_22587 ?auto_22593 ) ( CLEAR ?auto_22587 ) ( not ( = ?auto_22575 ?auto_22593 ) ) ( not ( = ?auto_22576 ?auto_22593 ) ) ( not ( = ?auto_22583 ?auto_22593 ) ) ( not ( = ?auto_22587 ?auto_22593 ) ) ( not ( = ?auto_22584 ?auto_22593 ) ) ( not ( = ?auto_22586 ?auto_22593 ) ) ( IS-CRATE ?auto_22586 ) ( not ( = ?auto_22575 ?auto_22580 ) ) ( not ( = ?auto_22576 ?auto_22580 ) ) ( not ( = ?auto_22583 ?auto_22580 ) ) ( not ( = ?auto_22587 ?auto_22580 ) ) ( not ( = ?auto_22584 ?auto_22580 ) ) ( not ( = ?auto_22586 ?auto_22580 ) ) ( not ( = ?auto_22593 ?auto_22580 ) ) ( not ( = ?auto_22585 ?auto_22582 ) ) ( not ( = ?auto_22588 ?auto_22585 ) ) ( not ( = ?auto_22590 ?auto_22585 ) ) ( not ( = ?auto_22577 ?auto_22585 ) ) ( HOIST-AT ?auto_22597 ?auto_22585 ) ( not ( = ?auto_22592 ?auto_22597 ) ) ( not ( = ?auto_22578 ?auto_22597 ) ) ( not ( = ?auto_22595 ?auto_22597 ) ) ( not ( = ?auto_22591 ?auto_22597 ) ) ( AVAILABLE ?auto_22597 ) ( SURFACE-AT ?auto_22586 ?auto_22585 ) ( ON ?auto_22586 ?auto_22589 ) ( CLEAR ?auto_22586 ) ( not ( = ?auto_22575 ?auto_22589 ) ) ( not ( = ?auto_22576 ?auto_22589 ) ) ( not ( = ?auto_22583 ?auto_22589 ) ) ( not ( = ?auto_22587 ?auto_22589 ) ) ( not ( = ?auto_22584 ?auto_22589 ) ) ( not ( = ?auto_22586 ?auto_22589 ) ) ( not ( = ?auto_22593 ?auto_22589 ) ) ( not ( = ?auto_22580 ?auto_22589 ) ) ( SURFACE-AT ?auto_22594 ?auto_22582 ) ( CLEAR ?auto_22594 ) ( IS-CRATE ?auto_22580 ) ( not ( = ?auto_22575 ?auto_22594 ) ) ( not ( = ?auto_22576 ?auto_22594 ) ) ( not ( = ?auto_22583 ?auto_22594 ) ) ( not ( = ?auto_22587 ?auto_22594 ) ) ( not ( = ?auto_22584 ?auto_22594 ) ) ( not ( = ?auto_22586 ?auto_22594 ) ) ( not ( = ?auto_22593 ?auto_22594 ) ) ( not ( = ?auto_22580 ?auto_22594 ) ) ( not ( = ?auto_22589 ?auto_22594 ) ) ( AVAILABLE ?auto_22592 ) ( TRUCK-AT ?auto_22581 ?auto_22596 ) ( not ( = ?auto_22596 ?auto_22582 ) ) ( not ( = ?auto_22588 ?auto_22596 ) ) ( not ( = ?auto_22590 ?auto_22596 ) ) ( not ( = ?auto_22577 ?auto_22596 ) ) ( not ( = ?auto_22585 ?auto_22596 ) ) ( HOIST-AT ?auto_22579 ?auto_22596 ) ( not ( = ?auto_22592 ?auto_22579 ) ) ( not ( = ?auto_22578 ?auto_22579 ) ) ( not ( = ?auto_22595 ?auto_22579 ) ) ( not ( = ?auto_22591 ?auto_22579 ) ) ( not ( = ?auto_22597 ?auto_22579 ) ) ( AVAILABLE ?auto_22579 ) ( SURFACE-AT ?auto_22580 ?auto_22596 ) ( ON ?auto_22580 ?auto_22598 ) ( CLEAR ?auto_22580 ) ( not ( = ?auto_22575 ?auto_22598 ) ) ( not ( = ?auto_22576 ?auto_22598 ) ) ( not ( = ?auto_22583 ?auto_22598 ) ) ( not ( = ?auto_22587 ?auto_22598 ) ) ( not ( = ?auto_22584 ?auto_22598 ) ) ( not ( = ?auto_22586 ?auto_22598 ) ) ( not ( = ?auto_22593 ?auto_22598 ) ) ( not ( = ?auto_22580 ?auto_22598 ) ) ( not ( = ?auto_22589 ?auto_22598 ) ) ( not ( = ?auto_22594 ?auto_22598 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22579 ?auto_22580 ?auto_22598 ?auto_22596 )
      ( MAKE-ON ?auto_22575 ?auto_22576 )
      ( MAKE-ON-VERIFY ?auto_22575 ?auto_22576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22599 - SURFACE
      ?auto_22600 - SURFACE
    )
    :vars
    (
      ?auto_22611 - HOIST
      ?auto_22612 - PLACE
      ?auto_22621 - PLACE
      ?auto_22613 - HOIST
      ?auto_22607 - SURFACE
      ?auto_22608 - SURFACE
      ?auto_22603 - PLACE
      ?auto_22602 - HOIST
      ?auto_22610 - SURFACE
      ?auto_22605 - SURFACE
      ?auto_22620 - PLACE
      ?auto_22617 - HOIST
      ?auto_22614 - SURFACE
      ?auto_22606 - SURFACE
      ?auto_22619 - PLACE
      ?auto_22601 - HOIST
      ?auto_22604 - SURFACE
      ?auto_22615 - SURFACE
      ?auto_22609 - PLACE
      ?auto_22616 - HOIST
      ?auto_22618 - SURFACE
      ?auto_22622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22611 ?auto_22612 ) ( IS-CRATE ?auto_22599 ) ( not ( = ?auto_22599 ?auto_22600 ) ) ( not ( = ?auto_22621 ?auto_22612 ) ) ( HOIST-AT ?auto_22613 ?auto_22621 ) ( not ( = ?auto_22611 ?auto_22613 ) ) ( AVAILABLE ?auto_22613 ) ( SURFACE-AT ?auto_22599 ?auto_22621 ) ( ON ?auto_22599 ?auto_22607 ) ( CLEAR ?auto_22599 ) ( not ( = ?auto_22599 ?auto_22607 ) ) ( not ( = ?auto_22600 ?auto_22607 ) ) ( IS-CRATE ?auto_22600 ) ( not ( = ?auto_22599 ?auto_22608 ) ) ( not ( = ?auto_22600 ?auto_22608 ) ) ( not ( = ?auto_22607 ?auto_22608 ) ) ( not ( = ?auto_22603 ?auto_22612 ) ) ( not ( = ?auto_22621 ?auto_22603 ) ) ( HOIST-AT ?auto_22602 ?auto_22603 ) ( not ( = ?auto_22611 ?auto_22602 ) ) ( not ( = ?auto_22613 ?auto_22602 ) ) ( AVAILABLE ?auto_22602 ) ( SURFACE-AT ?auto_22600 ?auto_22603 ) ( ON ?auto_22600 ?auto_22610 ) ( CLEAR ?auto_22600 ) ( not ( = ?auto_22599 ?auto_22610 ) ) ( not ( = ?auto_22600 ?auto_22610 ) ) ( not ( = ?auto_22607 ?auto_22610 ) ) ( not ( = ?auto_22608 ?auto_22610 ) ) ( IS-CRATE ?auto_22608 ) ( not ( = ?auto_22599 ?auto_22605 ) ) ( not ( = ?auto_22600 ?auto_22605 ) ) ( not ( = ?auto_22607 ?auto_22605 ) ) ( not ( = ?auto_22608 ?auto_22605 ) ) ( not ( = ?auto_22610 ?auto_22605 ) ) ( not ( = ?auto_22620 ?auto_22612 ) ) ( not ( = ?auto_22621 ?auto_22620 ) ) ( not ( = ?auto_22603 ?auto_22620 ) ) ( HOIST-AT ?auto_22617 ?auto_22620 ) ( not ( = ?auto_22611 ?auto_22617 ) ) ( not ( = ?auto_22613 ?auto_22617 ) ) ( not ( = ?auto_22602 ?auto_22617 ) ) ( AVAILABLE ?auto_22617 ) ( SURFACE-AT ?auto_22608 ?auto_22620 ) ( ON ?auto_22608 ?auto_22614 ) ( CLEAR ?auto_22608 ) ( not ( = ?auto_22599 ?auto_22614 ) ) ( not ( = ?auto_22600 ?auto_22614 ) ) ( not ( = ?auto_22607 ?auto_22614 ) ) ( not ( = ?auto_22608 ?auto_22614 ) ) ( not ( = ?auto_22610 ?auto_22614 ) ) ( not ( = ?auto_22605 ?auto_22614 ) ) ( IS-CRATE ?auto_22605 ) ( not ( = ?auto_22599 ?auto_22606 ) ) ( not ( = ?auto_22600 ?auto_22606 ) ) ( not ( = ?auto_22607 ?auto_22606 ) ) ( not ( = ?auto_22608 ?auto_22606 ) ) ( not ( = ?auto_22610 ?auto_22606 ) ) ( not ( = ?auto_22605 ?auto_22606 ) ) ( not ( = ?auto_22614 ?auto_22606 ) ) ( not ( = ?auto_22619 ?auto_22612 ) ) ( not ( = ?auto_22621 ?auto_22619 ) ) ( not ( = ?auto_22603 ?auto_22619 ) ) ( not ( = ?auto_22620 ?auto_22619 ) ) ( HOIST-AT ?auto_22601 ?auto_22619 ) ( not ( = ?auto_22611 ?auto_22601 ) ) ( not ( = ?auto_22613 ?auto_22601 ) ) ( not ( = ?auto_22602 ?auto_22601 ) ) ( not ( = ?auto_22617 ?auto_22601 ) ) ( AVAILABLE ?auto_22601 ) ( SURFACE-AT ?auto_22605 ?auto_22619 ) ( ON ?auto_22605 ?auto_22604 ) ( CLEAR ?auto_22605 ) ( not ( = ?auto_22599 ?auto_22604 ) ) ( not ( = ?auto_22600 ?auto_22604 ) ) ( not ( = ?auto_22607 ?auto_22604 ) ) ( not ( = ?auto_22608 ?auto_22604 ) ) ( not ( = ?auto_22610 ?auto_22604 ) ) ( not ( = ?auto_22605 ?auto_22604 ) ) ( not ( = ?auto_22614 ?auto_22604 ) ) ( not ( = ?auto_22606 ?auto_22604 ) ) ( SURFACE-AT ?auto_22615 ?auto_22612 ) ( CLEAR ?auto_22615 ) ( IS-CRATE ?auto_22606 ) ( not ( = ?auto_22599 ?auto_22615 ) ) ( not ( = ?auto_22600 ?auto_22615 ) ) ( not ( = ?auto_22607 ?auto_22615 ) ) ( not ( = ?auto_22608 ?auto_22615 ) ) ( not ( = ?auto_22610 ?auto_22615 ) ) ( not ( = ?auto_22605 ?auto_22615 ) ) ( not ( = ?auto_22614 ?auto_22615 ) ) ( not ( = ?auto_22606 ?auto_22615 ) ) ( not ( = ?auto_22604 ?auto_22615 ) ) ( AVAILABLE ?auto_22611 ) ( not ( = ?auto_22609 ?auto_22612 ) ) ( not ( = ?auto_22621 ?auto_22609 ) ) ( not ( = ?auto_22603 ?auto_22609 ) ) ( not ( = ?auto_22620 ?auto_22609 ) ) ( not ( = ?auto_22619 ?auto_22609 ) ) ( HOIST-AT ?auto_22616 ?auto_22609 ) ( not ( = ?auto_22611 ?auto_22616 ) ) ( not ( = ?auto_22613 ?auto_22616 ) ) ( not ( = ?auto_22602 ?auto_22616 ) ) ( not ( = ?auto_22617 ?auto_22616 ) ) ( not ( = ?auto_22601 ?auto_22616 ) ) ( AVAILABLE ?auto_22616 ) ( SURFACE-AT ?auto_22606 ?auto_22609 ) ( ON ?auto_22606 ?auto_22618 ) ( CLEAR ?auto_22606 ) ( not ( = ?auto_22599 ?auto_22618 ) ) ( not ( = ?auto_22600 ?auto_22618 ) ) ( not ( = ?auto_22607 ?auto_22618 ) ) ( not ( = ?auto_22608 ?auto_22618 ) ) ( not ( = ?auto_22610 ?auto_22618 ) ) ( not ( = ?auto_22605 ?auto_22618 ) ) ( not ( = ?auto_22614 ?auto_22618 ) ) ( not ( = ?auto_22606 ?auto_22618 ) ) ( not ( = ?auto_22604 ?auto_22618 ) ) ( not ( = ?auto_22615 ?auto_22618 ) ) ( TRUCK-AT ?auto_22622 ?auto_22612 ) )
    :subtasks
    ( ( !DRIVE ?auto_22622 ?auto_22612 ?auto_22609 )
      ( MAKE-ON ?auto_22599 ?auto_22600 )
      ( MAKE-ON-VERIFY ?auto_22599 ?auto_22600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22623 - SURFACE
      ?auto_22624 - SURFACE
    )
    :vars
    (
      ?auto_22636 - HOIST
      ?auto_22638 - PLACE
      ?auto_22632 - PLACE
      ?auto_22633 - HOIST
      ?auto_22637 - SURFACE
      ?auto_22643 - SURFACE
      ?auto_22630 - PLACE
      ?auto_22642 - HOIST
      ?auto_22629 - SURFACE
      ?auto_22641 - SURFACE
      ?auto_22627 - PLACE
      ?auto_22644 - HOIST
      ?auto_22635 - SURFACE
      ?auto_22631 - SURFACE
      ?auto_22646 - PLACE
      ?auto_22639 - HOIST
      ?auto_22634 - SURFACE
      ?auto_22640 - SURFACE
      ?auto_22625 - PLACE
      ?auto_22628 - HOIST
      ?auto_22645 - SURFACE
      ?auto_22626 - TRUCK
      ?auto_22647 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22636 ?auto_22638 ) ( IS-CRATE ?auto_22623 ) ( not ( = ?auto_22623 ?auto_22624 ) ) ( not ( = ?auto_22632 ?auto_22638 ) ) ( HOIST-AT ?auto_22633 ?auto_22632 ) ( not ( = ?auto_22636 ?auto_22633 ) ) ( AVAILABLE ?auto_22633 ) ( SURFACE-AT ?auto_22623 ?auto_22632 ) ( ON ?auto_22623 ?auto_22637 ) ( CLEAR ?auto_22623 ) ( not ( = ?auto_22623 ?auto_22637 ) ) ( not ( = ?auto_22624 ?auto_22637 ) ) ( IS-CRATE ?auto_22624 ) ( not ( = ?auto_22623 ?auto_22643 ) ) ( not ( = ?auto_22624 ?auto_22643 ) ) ( not ( = ?auto_22637 ?auto_22643 ) ) ( not ( = ?auto_22630 ?auto_22638 ) ) ( not ( = ?auto_22632 ?auto_22630 ) ) ( HOIST-AT ?auto_22642 ?auto_22630 ) ( not ( = ?auto_22636 ?auto_22642 ) ) ( not ( = ?auto_22633 ?auto_22642 ) ) ( AVAILABLE ?auto_22642 ) ( SURFACE-AT ?auto_22624 ?auto_22630 ) ( ON ?auto_22624 ?auto_22629 ) ( CLEAR ?auto_22624 ) ( not ( = ?auto_22623 ?auto_22629 ) ) ( not ( = ?auto_22624 ?auto_22629 ) ) ( not ( = ?auto_22637 ?auto_22629 ) ) ( not ( = ?auto_22643 ?auto_22629 ) ) ( IS-CRATE ?auto_22643 ) ( not ( = ?auto_22623 ?auto_22641 ) ) ( not ( = ?auto_22624 ?auto_22641 ) ) ( not ( = ?auto_22637 ?auto_22641 ) ) ( not ( = ?auto_22643 ?auto_22641 ) ) ( not ( = ?auto_22629 ?auto_22641 ) ) ( not ( = ?auto_22627 ?auto_22638 ) ) ( not ( = ?auto_22632 ?auto_22627 ) ) ( not ( = ?auto_22630 ?auto_22627 ) ) ( HOIST-AT ?auto_22644 ?auto_22627 ) ( not ( = ?auto_22636 ?auto_22644 ) ) ( not ( = ?auto_22633 ?auto_22644 ) ) ( not ( = ?auto_22642 ?auto_22644 ) ) ( AVAILABLE ?auto_22644 ) ( SURFACE-AT ?auto_22643 ?auto_22627 ) ( ON ?auto_22643 ?auto_22635 ) ( CLEAR ?auto_22643 ) ( not ( = ?auto_22623 ?auto_22635 ) ) ( not ( = ?auto_22624 ?auto_22635 ) ) ( not ( = ?auto_22637 ?auto_22635 ) ) ( not ( = ?auto_22643 ?auto_22635 ) ) ( not ( = ?auto_22629 ?auto_22635 ) ) ( not ( = ?auto_22641 ?auto_22635 ) ) ( IS-CRATE ?auto_22641 ) ( not ( = ?auto_22623 ?auto_22631 ) ) ( not ( = ?auto_22624 ?auto_22631 ) ) ( not ( = ?auto_22637 ?auto_22631 ) ) ( not ( = ?auto_22643 ?auto_22631 ) ) ( not ( = ?auto_22629 ?auto_22631 ) ) ( not ( = ?auto_22641 ?auto_22631 ) ) ( not ( = ?auto_22635 ?auto_22631 ) ) ( not ( = ?auto_22646 ?auto_22638 ) ) ( not ( = ?auto_22632 ?auto_22646 ) ) ( not ( = ?auto_22630 ?auto_22646 ) ) ( not ( = ?auto_22627 ?auto_22646 ) ) ( HOIST-AT ?auto_22639 ?auto_22646 ) ( not ( = ?auto_22636 ?auto_22639 ) ) ( not ( = ?auto_22633 ?auto_22639 ) ) ( not ( = ?auto_22642 ?auto_22639 ) ) ( not ( = ?auto_22644 ?auto_22639 ) ) ( AVAILABLE ?auto_22639 ) ( SURFACE-AT ?auto_22641 ?auto_22646 ) ( ON ?auto_22641 ?auto_22634 ) ( CLEAR ?auto_22641 ) ( not ( = ?auto_22623 ?auto_22634 ) ) ( not ( = ?auto_22624 ?auto_22634 ) ) ( not ( = ?auto_22637 ?auto_22634 ) ) ( not ( = ?auto_22643 ?auto_22634 ) ) ( not ( = ?auto_22629 ?auto_22634 ) ) ( not ( = ?auto_22641 ?auto_22634 ) ) ( not ( = ?auto_22635 ?auto_22634 ) ) ( not ( = ?auto_22631 ?auto_22634 ) ) ( IS-CRATE ?auto_22631 ) ( not ( = ?auto_22623 ?auto_22640 ) ) ( not ( = ?auto_22624 ?auto_22640 ) ) ( not ( = ?auto_22637 ?auto_22640 ) ) ( not ( = ?auto_22643 ?auto_22640 ) ) ( not ( = ?auto_22629 ?auto_22640 ) ) ( not ( = ?auto_22641 ?auto_22640 ) ) ( not ( = ?auto_22635 ?auto_22640 ) ) ( not ( = ?auto_22631 ?auto_22640 ) ) ( not ( = ?auto_22634 ?auto_22640 ) ) ( not ( = ?auto_22625 ?auto_22638 ) ) ( not ( = ?auto_22632 ?auto_22625 ) ) ( not ( = ?auto_22630 ?auto_22625 ) ) ( not ( = ?auto_22627 ?auto_22625 ) ) ( not ( = ?auto_22646 ?auto_22625 ) ) ( HOIST-AT ?auto_22628 ?auto_22625 ) ( not ( = ?auto_22636 ?auto_22628 ) ) ( not ( = ?auto_22633 ?auto_22628 ) ) ( not ( = ?auto_22642 ?auto_22628 ) ) ( not ( = ?auto_22644 ?auto_22628 ) ) ( not ( = ?auto_22639 ?auto_22628 ) ) ( AVAILABLE ?auto_22628 ) ( SURFACE-AT ?auto_22631 ?auto_22625 ) ( ON ?auto_22631 ?auto_22645 ) ( CLEAR ?auto_22631 ) ( not ( = ?auto_22623 ?auto_22645 ) ) ( not ( = ?auto_22624 ?auto_22645 ) ) ( not ( = ?auto_22637 ?auto_22645 ) ) ( not ( = ?auto_22643 ?auto_22645 ) ) ( not ( = ?auto_22629 ?auto_22645 ) ) ( not ( = ?auto_22641 ?auto_22645 ) ) ( not ( = ?auto_22635 ?auto_22645 ) ) ( not ( = ?auto_22631 ?auto_22645 ) ) ( not ( = ?auto_22634 ?auto_22645 ) ) ( not ( = ?auto_22640 ?auto_22645 ) ) ( TRUCK-AT ?auto_22626 ?auto_22638 ) ( SURFACE-AT ?auto_22647 ?auto_22638 ) ( CLEAR ?auto_22647 ) ( LIFTING ?auto_22636 ?auto_22640 ) ( IS-CRATE ?auto_22640 ) ( not ( = ?auto_22623 ?auto_22647 ) ) ( not ( = ?auto_22624 ?auto_22647 ) ) ( not ( = ?auto_22637 ?auto_22647 ) ) ( not ( = ?auto_22643 ?auto_22647 ) ) ( not ( = ?auto_22629 ?auto_22647 ) ) ( not ( = ?auto_22641 ?auto_22647 ) ) ( not ( = ?auto_22635 ?auto_22647 ) ) ( not ( = ?auto_22631 ?auto_22647 ) ) ( not ( = ?auto_22634 ?auto_22647 ) ) ( not ( = ?auto_22640 ?auto_22647 ) ) ( not ( = ?auto_22645 ?auto_22647 ) ) )
    :subtasks
    ( ( !DROP ?auto_22636 ?auto_22640 ?auto_22647 ?auto_22638 )
      ( MAKE-ON ?auto_22623 ?auto_22624 )
      ( MAKE-ON-VERIFY ?auto_22623 ?auto_22624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22648 - SURFACE
      ?auto_22649 - SURFACE
    )
    :vars
    (
      ?auto_22650 - HOIST
      ?auto_22656 - PLACE
      ?auto_22659 - PLACE
      ?auto_22665 - HOIST
      ?auto_22672 - SURFACE
      ?auto_22669 - SURFACE
      ?auto_22671 - PLACE
      ?auto_22652 - HOIST
      ?auto_22655 - SURFACE
      ?auto_22653 - SURFACE
      ?auto_22666 - PLACE
      ?auto_22670 - HOIST
      ?auto_22657 - SURFACE
      ?auto_22668 - SURFACE
      ?auto_22661 - PLACE
      ?auto_22667 - HOIST
      ?auto_22658 - SURFACE
      ?auto_22662 - SURFACE
      ?auto_22651 - PLACE
      ?auto_22664 - HOIST
      ?auto_22660 - SURFACE
      ?auto_22654 - TRUCK
      ?auto_22663 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22650 ?auto_22656 ) ( IS-CRATE ?auto_22648 ) ( not ( = ?auto_22648 ?auto_22649 ) ) ( not ( = ?auto_22659 ?auto_22656 ) ) ( HOIST-AT ?auto_22665 ?auto_22659 ) ( not ( = ?auto_22650 ?auto_22665 ) ) ( AVAILABLE ?auto_22665 ) ( SURFACE-AT ?auto_22648 ?auto_22659 ) ( ON ?auto_22648 ?auto_22672 ) ( CLEAR ?auto_22648 ) ( not ( = ?auto_22648 ?auto_22672 ) ) ( not ( = ?auto_22649 ?auto_22672 ) ) ( IS-CRATE ?auto_22649 ) ( not ( = ?auto_22648 ?auto_22669 ) ) ( not ( = ?auto_22649 ?auto_22669 ) ) ( not ( = ?auto_22672 ?auto_22669 ) ) ( not ( = ?auto_22671 ?auto_22656 ) ) ( not ( = ?auto_22659 ?auto_22671 ) ) ( HOIST-AT ?auto_22652 ?auto_22671 ) ( not ( = ?auto_22650 ?auto_22652 ) ) ( not ( = ?auto_22665 ?auto_22652 ) ) ( AVAILABLE ?auto_22652 ) ( SURFACE-AT ?auto_22649 ?auto_22671 ) ( ON ?auto_22649 ?auto_22655 ) ( CLEAR ?auto_22649 ) ( not ( = ?auto_22648 ?auto_22655 ) ) ( not ( = ?auto_22649 ?auto_22655 ) ) ( not ( = ?auto_22672 ?auto_22655 ) ) ( not ( = ?auto_22669 ?auto_22655 ) ) ( IS-CRATE ?auto_22669 ) ( not ( = ?auto_22648 ?auto_22653 ) ) ( not ( = ?auto_22649 ?auto_22653 ) ) ( not ( = ?auto_22672 ?auto_22653 ) ) ( not ( = ?auto_22669 ?auto_22653 ) ) ( not ( = ?auto_22655 ?auto_22653 ) ) ( not ( = ?auto_22666 ?auto_22656 ) ) ( not ( = ?auto_22659 ?auto_22666 ) ) ( not ( = ?auto_22671 ?auto_22666 ) ) ( HOIST-AT ?auto_22670 ?auto_22666 ) ( not ( = ?auto_22650 ?auto_22670 ) ) ( not ( = ?auto_22665 ?auto_22670 ) ) ( not ( = ?auto_22652 ?auto_22670 ) ) ( AVAILABLE ?auto_22670 ) ( SURFACE-AT ?auto_22669 ?auto_22666 ) ( ON ?auto_22669 ?auto_22657 ) ( CLEAR ?auto_22669 ) ( not ( = ?auto_22648 ?auto_22657 ) ) ( not ( = ?auto_22649 ?auto_22657 ) ) ( not ( = ?auto_22672 ?auto_22657 ) ) ( not ( = ?auto_22669 ?auto_22657 ) ) ( not ( = ?auto_22655 ?auto_22657 ) ) ( not ( = ?auto_22653 ?auto_22657 ) ) ( IS-CRATE ?auto_22653 ) ( not ( = ?auto_22648 ?auto_22668 ) ) ( not ( = ?auto_22649 ?auto_22668 ) ) ( not ( = ?auto_22672 ?auto_22668 ) ) ( not ( = ?auto_22669 ?auto_22668 ) ) ( not ( = ?auto_22655 ?auto_22668 ) ) ( not ( = ?auto_22653 ?auto_22668 ) ) ( not ( = ?auto_22657 ?auto_22668 ) ) ( not ( = ?auto_22661 ?auto_22656 ) ) ( not ( = ?auto_22659 ?auto_22661 ) ) ( not ( = ?auto_22671 ?auto_22661 ) ) ( not ( = ?auto_22666 ?auto_22661 ) ) ( HOIST-AT ?auto_22667 ?auto_22661 ) ( not ( = ?auto_22650 ?auto_22667 ) ) ( not ( = ?auto_22665 ?auto_22667 ) ) ( not ( = ?auto_22652 ?auto_22667 ) ) ( not ( = ?auto_22670 ?auto_22667 ) ) ( AVAILABLE ?auto_22667 ) ( SURFACE-AT ?auto_22653 ?auto_22661 ) ( ON ?auto_22653 ?auto_22658 ) ( CLEAR ?auto_22653 ) ( not ( = ?auto_22648 ?auto_22658 ) ) ( not ( = ?auto_22649 ?auto_22658 ) ) ( not ( = ?auto_22672 ?auto_22658 ) ) ( not ( = ?auto_22669 ?auto_22658 ) ) ( not ( = ?auto_22655 ?auto_22658 ) ) ( not ( = ?auto_22653 ?auto_22658 ) ) ( not ( = ?auto_22657 ?auto_22658 ) ) ( not ( = ?auto_22668 ?auto_22658 ) ) ( IS-CRATE ?auto_22668 ) ( not ( = ?auto_22648 ?auto_22662 ) ) ( not ( = ?auto_22649 ?auto_22662 ) ) ( not ( = ?auto_22672 ?auto_22662 ) ) ( not ( = ?auto_22669 ?auto_22662 ) ) ( not ( = ?auto_22655 ?auto_22662 ) ) ( not ( = ?auto_22653 ?auto_22662 ) ) ( not ( = ?auto_22657 ?auto_22662 ) ) ( not ( = ?auto_22668 ?auto_22662 ) ) ( not ( = ?auto_22658 ?auto_22662 ) ) ( not ( = ?auto_22651 ?auto_22656 ) ) ( not ( = ?auto_22659 ?auto_22651 ) ) ( not ( = ?auto_22671 ?auto_22651 ) ) ( not ( = ?auto_22666 ?auto_22651 ) ) ( not ( = ?auto_22661 ?auto_22651 ) ) ( HOIST-AT ?auto_22664 ?auto_22651 ) ( not ( = ?auto_22650 ?auto_22664 ) ) ( not ( = ?auto_22665 ?auto_22664 ) ) ( not ( = ?auto_22652 ?auto_22664 ) ) ( not ( = ?auto_22670 ?auto_22664 ) ) ( not ( = ?auto_22667 ?auto_22664 ) ) ( AVAILABLE ?auto_22664 ) ( SURFACE-AT ?auto_22668 ?auto_22651 ) ( ON ?auto_22668 ?auto_22660 ) ( CLEAR ?auto_22668 ) ( not ( = ?auto_22648 ?auto_22660 ) ) ( not ( = ?auto_22649 ?auto_22660 ) ) ( not ( = ?auto_22672 ?auto_22660 ) ) ( not ( = ?auto_22669 ?auto_22660 ) ) ( not ( = ?auto_22655 ?auto_22660 ) ) ( not ( = ?auto_22653 ?auto_22660 ) ) ( not ( = ?auto_22657 ?auto_22660 ) ) ( not ( = ?auto_22668 ?auto_22660 ) ) ( not ( = ?auto_22658 ?auto_22660 ) ) ( not ( = ?auto_22662 ?auto_22660 ) ) ( TRUCK-AT ?auto_22654 ?auto_22656 ) ( SURFACE-AT ?auto_22663 ?auto_22656 ) ( CLEAR ?auto_22663 ) ( IS-CRATE ?auto_22662 ) ( not ( = ?auto_22648 ?auto_22663 ) ) ( not ( = ?auto_22649 ?auto_22663 ) ) ( not ( = ?auto_22672 ?auto_22663 ) ) ( not ( = ?auto_22669 ?auto_22663 ) ) ( not ( = ?auto_22655 ?auto_22663 ) ) ( not ( = ?auto_22653 ?auto_22663 ) ) ( not ( = ?auto_22657 ?auto_22663 ) ) ( not ( = ?auto_22668 ?auto_22663 ) ) ( not ( = ?auto_22658 ?auto_22663 ) ) ( not ( = ?auto_22662 ?auto_22663 ) ) ( not ( = ?auto_22660 ?auto_22663 ) ) ( AVAILABLE ?auto_22650 ) ( IN ?auto_22662 ?auto_22654 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22650 ?auto_22662 ?auto_22654 ?auto_22656 )
      ( MAKE-ON ?auto_22648 ?auto_22649 )
      ( MAKE-ON-VERIFY ?auto_22648 ?auto_22649 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22673 - SURFACE
      ?auto_22674 - SURFACE
    )
    :vars
    (
      ?auto_22681 - HOIST
      ?auto_22697 - PLACE
      ?auto_22675 - PLACE
      ?auto_22693 - HOIST
      ?auto_22692 - SURFACE
      ?auto_22683 - SURFACE
      ?auto_22691 - PLACE
      ?auto_22679 - HOIST
      ?auto_22680 - SURFACE
      ?auto_22694 - SURFACE
      ?auto_22685 - PLACE
      ?auto_22690 - HOIST
      ?auto_22687 - SURFACE
      ?auto_22682 - SURFACE
      ?auto_22688 - PLACE
      ?auto_22684 - HOIST
      ?auto_22689 - SURFACE
      ?auto_22696 - SURFACE
      ?auto_22677 - PLACE
      ?auto_22695 - HOIST
      ?auto_22678 - SURFACE
      ?auto_22686 - SURFACE
      ?auto_22676 - TRUCK
      ?auto_22698 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22681 ?auto_22697 ) ( IS-CRATE ?auto_22673 ) ( not ( = ?auto_22673 ?auto_22674 ) ) ( not ( = ?auto_22675 ?auto_22697 ) ) ( HOIST-AT ?auto_22693 ?auto_22675 ) ( not ( = ?auto_22681 ?auto_22693 ) ) ( AVAILABLE ?auto_22693 ) ( SURFACE-AT ?auto_22673 ?auto_22675 ) ( ON ?auto_22673 ?auto_22692 ) ( CLEAR ?auto_22673 ) ( not ( = ?auto_22673 ?auto_22692 ) ) ( not ( = ?auto_22674 ?auto_22692 ) ) ( IS-CRATE ?auto_22674 ) ( not ( = ?auto_22673 ?auto_22683 ) ) ( not ( = ?auto_22674 ?auto_22683 ) ) ( not ( = ?auto_22692 ?auto_22683 ) ) ( not ( = ?auto_22691 ?auto_22697 ) ) ( not ( = ?auto_22675 ?auto_22691 ) ) ( HOIST-AT ?auto_22679 ?auto_22691 ) ( not ( = ?auto_22681 ?auto_22679 ) ) ( not ( = ?auto_22693 ?auto_22679 ) ) ( AVAILABLE ?auto_22679 ) ( SURFACE-AT ?auto_22674 ?auto_22691 ) ( ON ?auto_22674 ?auto_22680 ) ( CLEAR ?auto_22674 ) ( not ( = ?auto_22673 ?auto_22680 ) ) ( not ( = ?auto_22674 ?auto_22680 ) ) ( not ( = ?auto_22692 ?auto_22680 ) ) ( not ( = ?auto_22683 ?auto_22680 ) ) ( IS-CRATE ?auto_22683 ) ( not ( = ?auto_22673 ?auto_22694 ) ) ( not ( = ?auto_22674 ?auto_22694 ) ) ( not ( = ?auto_22692 ?auto_22694 ) ) ( not ( = ?auto_22683 ?auto_22694 ) ) ( not ( = ?auto_22680 ?auto_22694 ) ) ( not ( = ?auto_22685 ?auto_22697 ) ) ( not ( = ?auto_22675 ?auto_22685 ) ) ( not ( = ?auto_22691 ?auto_22685 ) ) ( HOIST-AT ?auto_22690 ?auto_22685 ) ( not ( = ?auto_22681 ?auto_22690 ) ) ( not ( = ?auto_22693 ?auto_22690 ) ) ( not ( = ?auto_22679 ?auto_22690 ) ) ( AVAILABLE ?auto_22690 ) ( SURFACE-AT ?auto_22683 ?auto_22685 ) ( ON ?auto_22683 ?auto_22687 ) ( CLEAR ?auto_22683 ) ( not ( = ?auto_22673 ?auto_22687 ) ) ( not ( = ?auto_22674 ?auto_22687 ) ) ( not ( = ?auto_22692 ?auto_22687 ) ) ( not ( = ?auto_22683 ?auto_22687 ) ) ( not ( = ?auto_22680 ?auto_22687 ) ) ( not ( = ?auto_22694 ?auto_22687 ) ) ( IS-CRATE ?auto_22694 ) ( not ( = ?auto_22673 ?auto_22682 ) ) ( not ( = ?auto_22674 ?auto_22682 ) ) ( not ( = ?auto_22692 ?auto_22682 ) ) ( not ( = ?auto_22683 ?auto_22682 ) ) ( not ( = ?auto_22680 ?auto_22682 ) ) ( not ( = ?auto_22694 ?auto_22682 ) ) ( not ( = ?auto_22687 ?auto_22682 ) ) ( not ( = ?auto_22688 ?auto_22697 ) ) ( not ( = ?auto_22675 ?auto_22688 ) ) ( not ( = ?auto_22691 ?auto_22688 ) ) ( not ( = ?auto_22685 ?auto_22688 ) ) ( HOIST-AT ?auto_22684 ?auto_22688 ) ( not ( = ?auto_22681 ?auto_22684 ) ) ( not ( = ?auto_22693 ?auto_22684 ) ) ( not ( = ?auto_22679 ?auto_22684 ) ) ( not ( = ?auto_22690 ?auto_22684 ) ) ( AVAILABLE ?auto_22684 ) ( SURFACE-AT ?auto_22694 ?auto_22688 ) ( ON ?auto_22694 ?auto_22689 ) ( CLEAR ?auto_22694 ) ( not ( = ?auto_22673 ?auto_22689 ) ) ( not ( = ?auto_22674 ?auto_22689 ) ) ( not ( = ?auto_22692 ?auto_22689 ) ) ( not ( = ?auto_22683 ?auto_22689 ) ) ( not ( = ?auto_22680 ?auto_22689 ) ) ( not ( = ?auto_22694 ?auto_22689 ) ) ( not ( = ?auto_22687 ?auto_22689 ) ) ( not ( = ?auto_22682 ?auto_22689 ) ) ( IS-CRATE ?auto_22682 ) ( not ( = ?auto_22673 ?auto_22696 ) ) ( not ( = ?auto_22674 ?auto_22696 ) ) ( not ( = ?auto_22692 ?auto_22696 ) ) ( not ( = ?auto_22683 ?auto_22696 ) ) ( not ( = ?auto_22680 ?auto_22696 ) ) ( not ( = ?auto_22694 ?auto_22696 ) ) ( not ( = ?auto_22687 ?auto_22696 ) ) ( not ( = ?auto_22682 ?auto_22696 ) ) ( not ( = ?auto_22689 ?auto_22696 ) ) ( not ( = ?auto_22677 ?auto_22697 ) ) ( not ( = ?auto_22675 ?auto_22677 ) ) ( not ( = ?auto_22691 ?auto_22677 ) ) ( not ( = ?auto_22685 ?auto_22677 ) ) ( not ( = ?auto_22688 ?auto_22677 ) ) ( HOIST-AT ?auto_22695 ?auto_22677 ) ( not ( = ?auto_22681 ?auto_22695 ) ) ( not ( = ?auto_22693 ?auto_22695 ) ) ( not ( = ?auto_22679 ?auto_22695 ) ) ( not ( = ?auto_22690 ?auto_22695 ) ) ( not ( = ?auto_22684 ?auto_22695 ) ) ( AVAILABLE ?auto_22695 ) ( SURFACE-AT ?auto_22682 ?auto_22677 ) ( ON ?auto_22682 ?auto_22678 ) ( CLEAR ?auto_22682 ) ( not ( = ?auto_22673 ?auto_22678 ) ) ( not ( = ?auto_22674 ?auto_22678 ) ) ( not ( = ?auto_22692 ?auto_22678 ) ) ( not ( = ?auto_22683 ?auto_22678 ) ) ( not ( = ?auto_22680 ?auto_22678 ) ) ( not ( = ?auto_22694 ?auto_22678 ) ) ( not ( = ?auto_22687 ?auto_22678 ) ) ( not ( = ?auto_22682 ?auto_22678 ) ) ( not ( = ?auto_22689 ?auto_22678 ) ) ( not ( = ?auto_22696 ?auto_22678 ) ) ( SURFACE-AT ?auto_22686 ?auto_22697 ) ( CLEAR ?auto_22686 ) ( IS-CRATE ?auto_22696 ) ( not ( = ?auto_22673 ?auto_22686 ) ) ( not ( = ?auto_22674 ?auto_22686 ) ) ( not ( = ?auto_22692 ?auto_22686 ) ) ( not ( = ?auto_22683 ?auto_22686 ) ) ( not ( = ?auto_22680 ?auto_22686 ) ) ( not ( = ?auto_22694 ?auto_22686 ) ) ( not ( = ?auto_22687 ?auto_22686 ) ) ( not ( = ?auto_22682 ?auto_22686 ) ) ( not ( = ?auto_22689 ?auto_22686 ) ) ( not ( = ?auto_22696 ?auto_22686 ) ) ( not ( = ?auto_22678 ?auto_22686 ) ) ( AVAILABLE ?auto_22681 ) ( IN ?auto_22696 ?auto_22676 ) ( TRUCK-AT ?auto_22676 ?auto_22698 ) ( not ( = ?auto_22698 ?auto_22697 ) ) ( not ( = ?auto_22675 ?auto_22698 ) ) ( not ( = ?auto_22691 ?auto_22698 ) ) ( not ( = ?auto_22685 ?auto_22698 ) ) ( not ( = ?auto_22688 ?auto_22698 ) ) ( not ( = ?auto_22677 ?auto_22698 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22676 ?auto_22698 ?auto_22697 )
      ( MAKE-ON ?auto_22673 ?auto_22674 )
      ( MAKE-ON-VERIFY ?auto_22673 ?auto_22674 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22699 - SURFACE
      ?auto_22700 - SURFACE
    )
    :vars
    (
      ?auto_22709 - HOIST
      ?auto_22707 - PLACE
      ?auto_22722 - PLACE
      ?auto_22715 - HOIST
      ?auto_22703 - SURFACE
      ?auto_22724 - SURFACE
      ?auto_22704 - PLACE
      ?auto_22711 - HOIST
      ?auto_22701 - SURFACE
      ?auto_22716 - SURFACE
      ?auto_22712 - PLACE
      ?auto_22708 - HOIST
      ?auto_22720 - SURFACE
      ?auto_22718 - SURFACE
      ?auto_22710 - PLACE
      ?auto_22713 - HOIST
      ?auto_22717 - SURFACE
      ?auto_22706 - SURFACE
      ?auto_22721 - PLACE
      ?auto_22705 - HOIST
      ?auto_22702 - SURFACE
      ?auto_22714 - SURFACE
      ?auto_22719 - TRUCK
      ?auto_22723 - PLACE
      ?auto_22725 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22709 ?auto_22707 ) ( IS-CRATE ?auto_22699 ) ( not ( = ?auto_22699 ?auto_22700 ) ) ( not ( = ?auto_22722 ?auto_22707 ) ) ( HOIST-AT ?auto_22715 ?auto_22722 ) ( not ( = ?auto_22709 ?auto_22715 ) ) ( AVAILABLE ?auto_22715 ) ( SURFACE-AT ?auto_22699 ?auto_22722 ) ( ON ?auto_22699 ?auto_22703 ) ( CLEAR ?auto_22699 ) ( not ( = ?auto_22699 ?auto_22703 ) ) ( not ( = ?auto_22700 ?auto_22703 ) ) ( IS-CRATE ?auto_22700 ) ( not ( = ?auto_22699 ?auto_22724 ) ) ( not ( = ?auto_22700 ?auto_22724 ) ) ( not ( = ?auto_22703 ?auto_22724 ) ) ( not ( = ?auto_22704 ?auto_22707 ) ) ( not ( = ?auto_22722 ?auto_22704 ) ) ( HOIST-AT ?auto_22711 ?auto_22704 ) ( not ( = ?auto_22709 ?auto_22711 ) ) ( not ( = ?auto_22715 ?auto_22711 ) ) ( AVAILABLE ?auto_22711 ) ( SURFACE-AT ?auto_22700 ?auto_22704 ) ( ON ?auto_22700 ?auto_22701 ) ( CLEAR ?auto_22700 ) ( not ( = ?auto_22699 ?auto_22701 ) ) ( not ( = ?auto_22700 ?auto_22701 ) ) ( not ( = ?auto_22703 ?auto_22701 ) ) ( not ( = ?auto_22724 ?auto_22701 ) ) ( IS-CRATE ?auto_22724 ) ( not ( = ?auto_22699 ?auto_22716 ) ) ( not ( = ?auto_22700 ?auto_22716 ) ) ( not ( = ?auto_22703 ?auto_22716 ) ) ( not ( = ?auto_22724 ?auto_22716 ) ) ( not ( = ?auto_22701 ?auto_22716 ) ) ( not ( = ?auto_22712 ?auto_22707 ) ) ( not ( = ?auto_22722 ?auto_22712 ) ) ( not ( = ?auto_22704 ?auto_22712 ) ) ( HOIST-AT ?auto_22708 ?auto_22712 ) ( not ( = ?auto_22709 ?auto_22708 ) ) ( not ( = ?auto_22715 ?auto_22708 ) ) ( not ( = ?auto_22711 ?auto_22708 ) ) ( AVAILABLE ?auto_22708 ) ( SURFACE-AT ?auto_22724 ?auto_22712 ) ( ON ?auto_22724 ?auto_22720 ) ( CLEAR ?auto_22724 ) ( not ( = ?auto_22699 ?auto_22720 ) ) ( not ( = ?auto_22700 ?auto_22720 ) ) ( not ( = ?auto_22703 ?auto_22720 ) ) ( not ( = ?auto_22724 ?auto_22720 ) ) ( not ( = ?auto_22701 ?auto_22720 ) ) ( not ( = ?auto_22716 ?auto_22720 ) ) ( IS-CRATE ?auto_22716 ) ( not ( = ?auto_22699 ?auto_22718 ) ) ( not ( = ?auto_22700 ?auto_22718 ) ) ( not ( = ?auto_22703 ?auto_22718 ) ) ( not ( = ?auto_22724 ?auto_22718 ) ) ( not ( = ?auto_22701 ?auto_22718 ) ) ( not ( = ?auto_22716 ?auto_22718 ) ) ( not ( = ?auto_22720 ?auto_22718 ) ) ( not ( = ?auto_22710 ?auto_22707 ) ) ( not ( = ?auto_22722 ?auto_22710 ) ) ( not ( = ?auto_22704 ?auto_22710 ) ) ( not ( = ?auto_22712 ?auto_22710 ) ) ( HOIST-AT ?auto_22713 ?auto_22710 ) ( not ( = ?auto_22709 ?auto_22713 ) ) ( not ( = ?auto_22715 ?auto_22713 ) ) ( not ( = ?auto_22711 ?auto_22713 ) ) ( not ( = ?auto_22708 ?auto_22713 ) ) ( AVAILABLE ?auto_22713 ) ( SURFACE-AT ?auto_22716 ?auto_22710 ) ( ON ?auto_22716 ?auto_22717 ) ( CLEAR ?auto_22716 ) ( not ( = ?auto_22699 ?auto_22717 ) ) ( not ( = ?auto_22700 ?auto_22717 ) ) ( not ( = ?auto_22703 ?auto_22717 ) ) ( not ( = ?auto_22724 ?auto_22717 ) ) ( not ( = ?auto_22701 ?auto_22717 ) ) ( not ( = ?auto_22716 ?auto_22717 ) ) ( not ( = ?auto_22720 ?auto_22717 ) ) ( not ( = ?auto_22718 ?auto_22717 ) ) ( IS-CRATE ?auto_22718 ) ( not ( = ?auto_22699 ?auto_22706 ) ) ( not ( = ?auto_22700 ?auto_22706 ) ) ( not ( = ?auto_22703 ?auto_22706 ) ) ( not ( = ?auto_22724 ?auto_22706 ) ) ( not ( = ?auto_22701 ?auto_22706 ) ) ( not ( = ?auto_22716 ?auto_22706 ) ) ( not ( = ?auto_22720 ?auto_22706 ) ) ( not ( = ?auto_22718 ?auto_22706 ) ) ( not ( = ?auto_22717 ?auto_22706 ) ) ( not ( = ?auto_22721 ?auto_22707 ) ) ( not ( = ?auto_22722 ?auto_22721 ) ) ( not ( = ?auto_22704 ?auto_22721 ) ) ( not ( = ?auto_22712 ?auto_22721 ) ) ( not ( = ?auto_22710 ?auto_22721 ) ) ( HOIST-AT ?auto_22705 ?auto_22721 ) ( not ( = ?auto_22709 ?auto_22705 ) ) ( not ( = ?auto_22715 ?auto_22705 ) ) ( not ( = ?auto_22711 ?auto_22705 ) ) ( not ( = ?auto_22708 ?auto_22705 ) ) ( not ( = ?auto_22713 ?auto_22705 ) ) ( AVAILABLE ?auto_22705 ) ( SURFACE-AT ?auto_22718 ?auto_22721 ) ( ON ?auto_22718 ?auto_22702 ) ( CLEAR ?auto_22718 ) ( not ( = ?auto_22699 ?auto_22702 ) ) ( not ( = ?auto_22700 ?auto_22702 ) ) ( not ( = ?auto_22703 ?auto_22702 ) ) ( not ( = ?auto_22724 ?auto_22702 ) ) ( not ( = ?auto_22701 ?auto_22702 ) ) ( not ( = ?auto_22716 ?auto_22702 ) ) ( not ( = ?auto_22720 ?auto_22702 ) ) ( not ( = ?auto_22718 ?auto_22702 ) ) ( not ( = ?auto_22717 ?auto_22702 ) ) ( not ( = ?auto_22706 ?auto_22702 ) ) ( SURFACE-AT ?auto_22714 ?auto_22707 ) ( CLEAR ?auto_22714 ) ( IS-CRATE ?auto_22706 ) ( not ( = ?auto_22699 ?auto_22714 ) ) ( not ( = ?auto_22700 ?auto_22714 ) ) ( not ( = ?auto_22703 ?auto_22714 ) ) ( not ( = ?auto_22724 ?auto_22714 ) ) ( not ( = ?auto_22701 ?auto_22714 ) ) ( not ( = ?auto_22716 ?auto_22714 ) ) ( not ( = ?auto_22720 ?auto_22714 ) ) ( not ( = ?auto_22718 ?auto_22714 ) ) ( not ( = ?auto_22717 ?auto_22714 ) ) ( not ( = ?auto_22706 ?auto_22714 ) ) ( not ( = ?auto_22702 ?auto_22714 ) ) ( AVAILABLE ?auto_22709 ) ( TRUCK-AT ?auto_22719 ?auto_22723 ) ( not ( = ?auto_22723 ?auto_22707 ) ) ( not ( = ?auto_22722 ?auto_22723 ) ) ( not ( = ?auto_22704 ?auto_22723 ) ) ( not ( = ?auto_22712 ?auto_22723 ) ) ( not ( = ?auto_22710 ?auto_22723 ) ) ( not ( = ?auto_22721 ?auto_22723 ) ) ( HOIST-AT ?auto_22725 ?auto_22723 ) ( LIFTING ?auto_22725 ?auto_22706 ) ( not ( = ?auto_22709 ?auto_22725 ) ) ( not ( = ?auto_22715 ?auto_22725 ) ) ( not ( = ?auto_22711 ?auto_22725 ) ) ( not ( = ?auto_22708 ?auto_22725 ) ) ( not ( = ?auto_22713 ?auto_22725 ) ) ( not ( = ?auto_22705 ?auto_22725 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22725 ?auto_22706 ?auto_22719 ?auto_22723 )
      ( MAKE-ON ?auto_22699 ?auto_22700 )
      ( MAKE-ON-VERIFY ?auto_22699 ?auto_22700 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22726 - SURFACE
      ?auto_22727 - SURFACE
    )
    :vars
    (
      ?auto_22740 - HOIST
      ?auto_22730 - PLACE
      ?auto_22737 - PLACE
      ?auto_22751 - HOIST
      ?auto_22743 - SURFACE
      ?auto_22731 - SURFACE
      ?auto_22744 - PLACE
      ?auto_22747 - HOIST
      ?auto_22750 - SURFACE
      ?auto_22739 - SURFACE
      ?auto_22748 - PLACE
      ?auto_22742 - HOIST
      ?auto_22735 - SURFACE
      ?auto_22733 - SURFACE
      ?auto_22729 - PLACE
      ?auto_22749 - HOIST
      ?auto_22732 - SURFACE
      ?auto_22741 - SURFACE
      ?auto_22736 - PLACE
      ?auto_22746 - HOIST
      ?auto_22745 - SURFACE
      ?auto_22728 - SURFACE
      ?auto_22734 - TRUCK
      ?auto_22738 - PLACE
      ?auto_22752 - HOIST
      ?auto_22753 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22740 ?auto_22730 ) ( IS-CRATE ?auto_22726 ) ( not ( = ?auto_22726 ?auto_22727 ) ) ( not ( = ?auto_22737 ?auto_22730 ) ) ( HOIST-AT ?auto_22751 ?auto_22737 ) ( not ( = ?auto_22740 ?auto_22751 ) ) ( AVAILABLE ?auto_22751 ) ( SURFACE-AT ?auto_22726 ?auto_22737 ) ( ON ?auto_22726 ?auto_22743 ) ( CLEAR ?auto_22726 ) ( not ( = ?auto_22726 ?auto_22743 ) ) ( not ( = ?auto_22727 ?auto_22743 ) ) ( IS-CRATE ?auto_22727 ) ( not ( = ?auto_22726 ?auto_22731 ) ) ( not ( = ?auto_22727 ?auto_22731 ) ) ( not ( = ?auto_22743 ?auto_22731 ) ) ( not ( = ?auto_22744 ?auto_22730 ) ) ( not ( = ?auto_22737 ?auto_22744 ) ) ( HOIST-AT ?auto_22747 ?auto_22744 ) ( not ( = ?auto_22740 ?auto_22747 ) ) ( not ( = ?auto_22751 ?auto_22747 ) ) ( AVAILABLE ?auto_22747 ) ( SURFACE-AT ?auto_22727 ?auto_22744 ) ( ON ?auto_22727 ?auto_22750 ) ( CLEAR ?auto_22727 ) ( not ( = ?auto_22726 ?auto_22750 ) ) ( not ( = ?auto_22727 ?auto_22750 ) ) ( not ( = ?auto_22743 ?auto_22750 ) ) ( not ( = ?auto_22731 ?auto_22750 ) ) ( IS-CRATE ?auto_22731 ) ( not ( = ?auto_22726 ?auto_22739 ) ) ( not ( = ?auto_22727 ?auto_22739 ) ) ( not ( = ?auto_22743 ?auto_22739 ) ) ( not ( = ?auto_22731 ?auto_22739 ) ) ( not ( = ?auto_22750 ?auto_22739 ) ) ( not ( = ?auto_22748 ?auto_22730 ) ) ( not ( = ?auto_22737 ?auto_22748 ) ) ( not ( = ?auto_22744 ?auto_22748 ) ) ( HOIST-AT ?auto_22742 ?auto_22748 ) ( not ( = ?auto_22740 ?auto_22742 ) ) ( not ( = ?auto_22751 ?auto_22742 ) ) ( not ( = ?auto_22747 ?auto_22742 ) ) ( AVAILABLE ?auto_22742 ) ( SURFACE-AT ?auto_22731 ?auto_22748 ) ( ON ?auto_22731 ?auto_22735 ) ( CLEAR ?auto_22731 ) ( not ( = ?auto_22726 ?auto_22735 ) ) ( not ( = ?auto_22727 ?auto_22735 ) ) ( not ( = ?auto_22743 ?auto_22735 ) ) ( not ( = ?auto_22731 ?auto_22735 ) ) ( not ( = ?auto_22750 ?auto_22735 ) ) ( not ( = ?auto_22739 ?auto_22735 ) ) ( IS-CRATE ?auto_22739 ) ( not ( = ?auto_22726 ?auto_22733 ) ) ( not ( = ?auto_22727 ?auto_22733 ) ) ( not ( = ?auto_22743 ?auto_22733 ) ) ( not ( = ?auto_22731 ?auto_22733 ) ) ( not ( = ?auto_22750 ?auto_22733 ) ) ( not ( = ?auto_22739 ?auto_22733 ) ) ( not ( = ?auto_22735 ?auto_22733 ) ) ( not ( = ?auto_22729 ?auto_22730 ) ) ( not ( = ?auto_22737 ?auto_22729 ) ) ( not ( = ?auto_22744 ?auto_22729 ) ) ( not ( = ?auto_22748 ?auto_22729 ) ) ( HOIST-AT ?auto_22749 ?auto_22729 ) ( not ( = ?auto_22740 ?auto_22749 ) ) ( not ( = ?auto_22751 ?auto_22749 ) ) ( not ( = ?auto_22747 ?auto_22749 ) ) ( not ( = ?auto_22742 ?auto_22749 ) ) ( AVAILABLE ?auto_22749 ) ( SURFACE-AT ?auto_22739 ?auto_22729 ) ( ON ?auto_22739 ?auto_22732 ) ( CLEAR ?auto_22739 ) ( not ( = ?auto_22726 ?auto_22732 ) ) ( not ( = ?auto_22727 ?auto_22732 ) ) ( not ( = ?auto_22743 ?auto_22732 ) ) ( not ( = ?auto_22731 ?auto_22732 ) ) ( not ( = ?auto_22750 ?auto_22732 ) ) ( not ( = ?auto_22739 ?auto_22732 ) ) ( not ( = ?auto_22735 ?auto_22732 ) ) ( not ( = ?auto_22733 ?auto_22732 ) ) ( IS-CRATE ?auto_22733 ) ( not ( = ?auto_22726 ?auto_22741 ) ) ( not ( = ?auto_22727 ?auto_22741 ) ) ( not ( = ?auto_22743 ?auto_22741 ) ) ( not ( = ?auto_22731 ?auto_22741 ) ) ( not ( = ?auto_22750 ?auto_22741 ) ) ( not ( = ?auto_22739 ?auto_22741 ) ) ( not ( = ?auto_22735 ?auto_22741 ) ) ( not ( = ?auto_22733 ?auto_22741 ) ) ( not ( = ?auto_22732 ?auto_22741 ) ) ( not ( = ?auto_22736 ?auto_22730 ) ) ( not ( = ?auto_22737 ?auto_22736 ) ) ( not ( = ?auto_22744 ?auto_22736 ) ) ( not ( = ?auto_22748 ?auto_22736 ) ) ( not ( = ?auto_22729 ?auto_22736 ) ) ( HOIST-AT ?auto_22746 ?auto_22736 ) ( not ( = ?auto_22740 ?auto_22746 ) ) ( not ( = ?auto_22751 ?auto_22746 ) ) ( not ( = ?auto_22747 ?auto_22746 ) ) ( not ( = ?auto_22742 ?auto_22746 ) ) ( not ( = ?auto_22749 ?auto_22746 ) ) ( AVAILABLE ?auto_22746 ) ( SURFACE-AT ?auto_22733 ?auto_22736 ) ( ON ?auto_22733 ?auto_22745 ) ( CLEAR ?auto_22733 ) ( not ( = ?auto_22726 ?auto_22745 ) ) ( not ( = ?auto_22727 ?auto_22745 ) ) ( not ( = ?auto_22743 ?auto_22745 ) ) ( not ( = ?auto_22731 ?auto_22745 ) ) ( not ( = ?auto_22750 ?auto_22745 ) ) ( not ( = ?auto_22739 ?auto_22745 ) ) ( not ( = ?auto_22735 ?auto_22745 ) ) ( not ( = ?auto_22733 ?auto_22745 ) ) ( not ( = ?auto_22732 ?auto_22745 ) ) ( not ( = ?auto_22741 ?auto_22745 ) ) ( SURFACE-AT ?auto_22728 ?auto_22730 ) ( CLEAR ?auto_22728 ) ( IS-CRATE ?auto_22741 ) ( not ( = ?auto_22726 ?auto_22728 ) ) ( not ( = ?auto_22727 ?auto_22728 ) ) ( not ( = ?auto_22743 ?auto_22728 ) ) ( not ( = ?auto_22731 ?auto_22728 ) ) ( not ( = ?auto_22750 ?auto_22728 ) ) ( not ( = ?auto_22739 ?auto_22728 ) ) ( not ( = ?auto_22735 ?auto_22728 ) ) ( not ( = ?auto_22733 ?auto_22728 ) ) ( not ( = ?auto_22732 ?auto_22728 ) ) ( not ( = ?auto_22741 ?auto_22728 ) ) ( not ( = ?auto_22745 ?auto_22728 ) ) ( AVAILABLE ?auto_22740 ) ( TRUCK-AT ?auto_22734 ?auto_22738 ) ( not ( = ?auto_22738 ?auto_22730 ) ) ( not ( = ?auto_22737 ?auto_22738 ) ) ( not ( = ?auto_22744 ?auto_22738 ) ) ( not ( = ?auto_22748 ?auto_22738 ) ) ( not ( = ?auto_22729 ?auto_22738 ) ) ( not ( = ?auto_22736 ?auto_22738 ) ) ( HOIST-AT ?auto_22752 ?auto_22738 ) ( not ( = ?auto_22740 ?auto_22752 ) ) ( not ( = ?auto_22751 ?auto_22752 ) ) ( not ( = ?auto_22747 ?auto_22752 ) ) ( not ( = ?auto_22742 ?auto_22752 ) ) ( not ( = ?auto_22749 ?auto_22752 ) ) ( not ( = ?auto_22746 ?auto_22752 ) ) ( AVAILABLE ?auto_22752 ) ( SURFACE-AT ?auto_22741 ?auto_22738 ) ( ON ?auto_22741 ?auto_22753 ) ( CLEAR ?auto_22741 ) ( not ( = ?auto_22726 ?auto_22753 ) ) ( not ( = ?auto_22727 ?auto_22753 ) ) ( not ( = ?auto_22743 ?auto_22753 ) ) ( not ( = ?auto_22731 ?auto_22753 ) ) ( not ( = ?auto_22750 ?auto_22753 ) ) ( not ( = ?auto_22739 ?auto_22753 ) ) ( not ( = ?auto_22735 ?auto_22753 ) ) ( not ( = ?auto_22733 ?auto_22753 ) ) ( not ( = ?auto_22732 ?auto_22753 ) ) ( not ( = ?auto_22741 ?auto_22753 ) ) ( not ( = ?auto_22745 ?auto_22753 ) ) ( not ( = ?auto_22728 ?auto_22753 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22752 ?auto_22741 ?auto_22753 ?auto_22738 )
      ( MAKE-ON ?auto_22726 ?auto_22727 )
      ( MAKE-ON-VERIFY ?auto_22726 ?auto_22727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22754 - SURFACE
      ?auto_22755 - SURFACE
    )
    :vars
    (
      ?auto_22756 - HOIST
      ?auto_22774 - PLACE
      ?auto_22768 - PLACE
      ?auto_22770 - HOIST
      ?auto_22766 - SURFACE
      ?auto_22776 - SURFACE
      ?auto_22771 - PLACE
      ?auto_22772 - HOIST
      ?auto_22764 - SURFACE
      ?auto_22757 - SURFACE
      ?auto_22773 - PLACE
      ?auto_22777 - HOIST
      ?auto_22761 - SURFACE
      ?auto_22765 - SURFACE
      ?auto_22759 - PLACE
      ?auto_22763 - HOIST
      ?auto_22775 - SURFACE
      ?auto_22762 - SURFACE
      ?auto_22758 - PLACE
      ?auto_22781 - HOIST
      ?auto_22780 - SURFACE
      ?auto_22767 - SURFACE
      ?auto_22769 - PLACE
      ?auto_22760 - HOIST
      ?auto_22779 - SURFACE
      ?auto_22778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22756 ?auto_22774 ) ( IS-CRATE ?auto_22754 ) ( not ( = ?auto_22754 ?auto_22755 ) ) ( not ( = ?auto_22768 ?auto_22774 ) ) ( HOIST-AT ?auto_22770 ?auto_22768 ) ( not ( = ?auto_22756 ?auto_22770 ) ) ( AVAILABLE ?auto_22770 ) ( SURFACE-AT ?auto_22754 ?auto_22768 ) ( ON ?auto_22754 ?auto_22766 ) ( CLEAR ?auto_22754 ) ( not ( = ?auto_22754 ?auto_22766 ) ) ( not ( = ?auto_22755 ?auto_22766 ) ) ( IS-CRATE ?auto_22755 ) ( not ( = ?auto_22754 ?auto_22776 ) ) ( not ( = ?auto_22755 ?auto_22776 ) ) ( not ( = ?auto_22766 ?auto_22776 ) ) ( not ( = ?auto_22771 ?auto_22774 ) ) ( not ( = ?auto_22768 ?auto_22771 ) ) ( HOIST-AT ?auto_22772 ?auto_22771 ) ( not ( = ?auto_22756 ?auto_22772 ) ) ( not ( = ?auto_22770 ?auto_22772 ) ) ( AVAILABLE ?auto_22772 ) ( SURFACE-AT ?auto_22755 ?auto_22771 ) ( ON ?auto_22755 ?auto_22764 ) ( CLEAR ?auto_22755 ) ( not ( = ?auto_22754 ?auto_22764 ) ) ( not ( = ?auto_22755 ?auto_22764 ) ) ( not ( = ?auto_22766 ?auto_22764 ) ) ( not ( = ?auto_22776 ?auto_22764 ) ) ( IS-CRATE ?auto_22776 ) ( not ( = ?auto_22754 ?auto_22757 ) ) ( not ( = ?auto_22755 ?auto_22757 ) ) ( not ( = ?auto_22766 ?auto_22757 ) ) ( not ( = ?auto_22776 ?auto_22757 ) ) ( not ( = ?auto_22764 ?auto_22757 ) ) ( not ( = ?auto_22773 ?auto_22774 ) ) ( not ( = ?auto_22768 ?auto_22773 ) ) ( not ( = ?auto_22771 ?auto_22773 ) ) ( HOIST-AT ?auto_22777 ?auto_22773 ) ( not ( = ?auto_22756 ?auto_22777 ) ) ( not ( = ?auto_22770 ?auto_22777 ) ) ( not ( = ?auto_22772 ?auto_22777 ) ) ( AVAILABLE ?auto_22777 ) ( SURFACE-AT ?auto_22776 ?auto_22773 ) ( ON ?auto_22776 ?auto_22761 ) ( CLEAR ?auto_22776 ) ( not ( = ?auto_22754 ?auto_22761 ) ) ( not ( = ?auto_22755 ?auto_22761 ) ) ( not ( = ?auto_22766 ?auto_22761 ) ) ( not ( = ?auto_22776 ?auto_22761 ) ) ( not ( = ?auto_22764 ?auto_22761 ) ) ( not ( = ?auto_22757 ?auto_22761 ) ) ( IS-CRATE ?auto_22757 ) ( not ( = ?auto_22754 ?auto_22765 ) ) ( not ( = ?auto_22755 ?auto_22765 ) ) ( not ( = ?auto_22766 ?auto_22765 ) ) ( not ( = ?auto_22776 ?auto_22765 ) ) ( not ( = ?auto_22764 ?auto_22765 ) ) ( not ( = ?auto_22757 ?auto_22765 ) ) ( not ( = ?auto_22761 ?auto_22765 ) ) ( not ( = ?auto_22759 ?auto_22774 ) ) ( not ( = ?auto_22768 ?auto_22759 ) ) ( not ( = ?auto_22771 ?auto_22759 ) ) ( not ( = ?auto_22773 ?auto_22759 ) ) ( HOIST-AT ?auto_22763 ?auto_22759 ) ( not ( = ?auto_22756 ?auto_22763 ) ) ( not ( = ?auto_22770 ?auto_22763 ) ) ( not ( = ?auto_22772 ?auto_22763 ) ) ( not ( = ?auto_22777 ?auto_22763 ) ) ( AVAILABLE ?auto_22763 ) ( SURFACE-AT ?auto_22757 ?auto_22759 ) ( ON ?auto_22757 ?auto_22775 ) ( CLEAR ?auto_22757 ) ( not ( = ?auto_22754 ?auto_22775 ) ) ( not ( = ?auto_22755 ?auto_22775 ) ) ( not ( = ?auto_22766 ?auto_22775 ) ) ( not ( = ?auto_22776 ?auto_22775 ) ) ( not ( = ?auto_22764 ?auto_22775 ) ) ( not ( = ?auto_22757 ?auto_22775 ) ) ( not ( = ?auto_22761 ?auto_22775 ) ) ( not ( = ?auto_22765 ?auto_22775 ) ) ( IS-CRATE ?auto_22765 ) ( not ( = ?auto_22754 ?auto_22762 ) ) ( not ( = ?auto_22755 ?auto_22762 ) ) ( not ( = ?auto_22766 ?auto_22762 ) ) ( not ( = ?auto_22776 ?auto_22762 ) ) ( not ( = ?auto_22764 ?auto_22762 ) ) ( not ( = ?auto_22757 ?auto_22762 ) ) ( not ( = ?auto_22761 ?auto_22762 ) ) ( not ( = ?auto_22765 ?auto_22762 ) ) ( not ( = ?auto_22775 ?auto_22762 ) ) ( not ( = ?auto_22758 ?auto_22774 ) ) ( not ( = ?auto_22768 ?auto_22758 ) ) ( not ( = ?auto_22771 ?auto_22758 ) ) ( not ( = ?auto_22773 ?auto_22758 ) ) ( not ( = ?auto_22759 ?auto_22758 ) ) ( HOIST-AT ?auto_22781 ?auto_22758 ) ( not ( = ?auto_22756 ?auto_22781 ) ) ( not ( = ?auto_22770 ?auto_22781 ) ) ( not ( = ?auto_22772 ?auto_22781 ) ) ( not ( = ?auto_22777 ?auto_22781 ) ) ( not ( = ?auto_22763 ?auto_22781 ) ) ( AVAILABLE ?auto_22781 ) ( SURFACE-AT ?auto_22765 ?auto_22758 ) ( ON ?auto_22765 ?auto_22780 ) ( CLEAR ?auto_22765 ) ( not ( = ?auto_22754 ?auto_22780 ) ) ( not ( = ?auto_22755 ?auto_22780 ) ) ( not ( = ?auto_22766 ?auto_22780 ) ) ( not ( = ?auto_22776 ?auto_22780 ) ) ( not ( = ?auto_22764 ?auto_22780 ) ) ( not ( = ?auto_22757 ?auto_22780 ) ) ( not ( = ?auto_22761 ?auto_22780 ) ) ( not ( = ?auto_22765 ?auto_22780 ) ) ( not ( = ?auto_22775 ?auto_22780 ) ) ( not ( = ?auto_22762 ?auto_22780 ) ) ( SURFACE-AT ?auto_22767 ?auto_22774 ) ( CLEAR ?auto_22767 ) ( IS-CRATE ?auto_22762 ) ( not ( = ?auto_22754 ?auto_22767 ) ) ( not ( = ?auto_22755 ?auto_22767 ) ) ( not ( = ?auto_22766 ?auto_22767 ) ) ( not ( = ?auto_22776 ?auto_22767 ) ) ( not ( = ?auto_22764 ?auto_22767 ) ) ( not ( = ?auto_22757 ?auto_22767 ) ) ( not ( = ?auto_22761 ?auto_22767 ) ) ( not ( = ?auto_22765 ?auto_22767 ) ) ( not ( = ?auto_22775 ?auto_22767 ) ) ( not ( = ?auto_22762 ?auto_22767 ) ) ( not ( = ?auto_22780 ?auto_22767 ) ) ( AVAILABLE ?auto_22756 ) ( not ( = ?auto_22769 ?auto_22774 ) ) ( not ( = ?auto_22768 ?auto_22769 ) ) ( not ( = ?auto_22771 ?auto_22769 ) ) ( not ( = ?auto_22773 ?auto_22769 ) ) ( not ( = ?auto_22759 ?auto_22769 ) ) ( not ( = ?auto_22758 ?auto_22769 ) ) ( HOIST-AT ?auto_22760 ?auto_22769 ) ( not ( = ?auto_22756 ?auto_22760 ) ) ( not ( = ?auto_22770 ?auto_22760 ) ) ( not ( = ?auto_22772 ?auto_22760 ) ) ( not ( = ?auto_22777 ?auto_22760 ) ) ( not ( = ?auto_22763 ?auto_22760 ) ) ( not ( = ?auto_22781 ?auto_22760 ) ) ( AVAILABLE ?auto_22760 ) ( SURFACE-AT ?auto_22762 ?auto_22769 ) ( ON ?auto_22762 ?auto_22779 ) ( CLEAR ?auto_22762 ) ( not ( = ?auto_22754 ?auto_22779 ) ) ( not ( = ?auto_22755 ?auto_22779 ) ) ( not ( = ?auto_22766 ?auto_22779 ) ) ( not ( = ?auto_22776 ?auto_22779 ) ) ( not ( = ?auto_22764 ?auto_22779 ) ) ( not ( = ?auto_22757 ?auto_22779 ) ) ( not ( = ?auto_22761 ?auto_22779 ) ) ( not ( = ?auto_22765 ?auto_22779 ) ) ( not ( = ?auto_22775 ?auto_22779 ) ) ( not ( = ?auto_22762 ?auto_22779 ) ) ( not ( = ?auto_22780 ?auto_22779 ) ) ( not ( = ?auto_22767 ?auto_22779 ) ) ( TRUCK-AT ?auto_22778 ?auto_22774 ) )
    :subtasks
    ( ( !DRIVE ?auto_22778 ?auto_22774 ?auto_22769 )
      ( MAKE-ON ?auto_22754 ?auto_22755 )
      ( MAKE-ON-VERIFY ?auto_22754 ?auto_22755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22782 - SURFACE
      ?auto_22783 - SURFACE
    )
    :vars
    (
      ?auto_22796 - HOIST
      ?auto_22788 - PLACE
      ?auto_22797 - PLACE
      ?auto_22801 - HOIST
      ?auto_22792 - SURFACE
      ?auto_22786 - SURFACE
      ?auto_22800 - PLACE
      ?auto_22808 - HOIST
      ?auto_22799 - SURFACE
      ?auto_22784 - SURFACE
      ?auto_22809 - PLACE
      ?auto_22785 - HOIST
      ?auto_22806 - SURFACE
      ?auto_22795 - SURFACE
      ?auto_22791 - PLACE
      ?auto_22794 - HOIST
      ?auto_22790 - SURFACE
      ?auto_22798 - SURFACE
      ?auto_22789 - PLACE
      ?auto_22803 - HOIST
      ?auto_22802 - SURFACE
      ?auto_22805 - SURFACE
      ?auto_22804 - PLACE
      ?auto_22793 - HOIST
      ?auto_22807 - SURFACE
      ?auto_22787 - TRUCK
      ?auto_22810 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22796 ?auto_22788 ) ( IS-CRATE ?auto_22782 ) ( not ( = ?auto_22782 ?auto_22783 ) ) ( not ( = ?auto_22797 ?auto_22788 ) ) ( HOIST-AT ?auto_22801 ?auto_22797 ) ( not ( = ?auto_22796 ?auto_22801 ) ) ( AVAILABLE ?auto_22801 ) ( SURFACE-AT ?auto_22782 ?auto_22797 ) ( ON ?auto_22782 ?auto_22792 ) ( CLEAR ?auto_22782 ) ( not ( = ?auto_22782 ?auto_22792 ) ) ( not ( = ?auto_22783 ?auto_22792 ) ) ( IS-CRATE ?auto_22783 ) ( not ( = ?auto_22782 ?auto_22786 ) ) ( not ( = ?auto_22783 ?auto_22786 ) ) ( not ( = ?auto_22792 ?auto_22786 ) ) ( not ( = ?auto_22800 ?auto_22788 ) ) ( not ( = ?auto_22797 ?auto_22800 ) ) ( HOIST-AT ?auto_22808 ?auto_22800 ) ( not ( = ?auto_22796 ?auto_22808 ) ) ( not ( = ?auto_22801 ?auto_22808 ) ) ( AVAILABLE ?auto_22808 ) ( SURFACE-AT ?auto_22783 ?auto_22800 ) ( ON ?auto_22783 ?auto_22799 ) ( CLEAR ?auto_22783 ) ( not ( = ?auto_22782 ?auto_22799 ) ) ( not ( = ?auto_22783 ?auto_22799 ) ) ( not ( = ?auto_22792 ?auto_22799 ) ) ( not ( = ?auto_22786 ?auto_22799 ) ) ( IS-CRATE ?auto_22786 ) ( not ( = ?auto_22782 ?auto_22784 ) ) ( not ( = ?auto_22783 ?auto_22784 ) ) ( not ( = ?auto_22792 ?auto_22784 ) ) ( not ( = ?auto_22786 ?auto_22784 ) ) ( not ( = ?auto_22799 ?auto_22784 ) ) ( not ( = ?auto_22809 ?auto_22788 ) ) ( not ( = ?auto_22797 ?auto_22809 ) ) ( not ( = ?auto_22800 ?auto_22809 ) ) ( HOIST-AT ?auto_22785 ?auto_22809 ) ( not ( = ?auto_22796 ?auto_22785 ) ) ( not ( = ?auto_22801 ?auto_22785 ) ) ( not ( = ?auto_22808 ?auto_22785 ) ) ( AVAILABLE ?auto_22785 ) ( SURFACE-AT ?auto_22786 ?auto_22809 ) ( ON ?auto_22786 ?auto_22806 ) ( CLEAR ?auto_22786 ) ( not ( = ?auto_22782 ?auto_22806 ) ) ( not ( = ?auto_22783 ?auto_22806 ) ) ( not ( = ?auto_22792 ?auto_22806 ) ) ( not ( = ?auto_22786 ?auto_22806 ) ) ( not ( = ?auto_22799 ?auto_22806 ) ) ( not ( = ?auto_22784 ?auto_22806 ) ) ( IS-CRATE ?auto_22784 ) ( not ( = ?auto_22782 ?auto_22795 ) ) ( not ( = ?auto_22783 ?auto_22795 ) ) ( not ( = ?auto_22792 ?auto_22795 ) ) ( not ( = ?auto_22786 ?auto_22795 ) ) ( not ( = ?auto_22799 ?auto_22795 ) ) ( not ( = ?auto_22784 ?auto_22795 ) ) ( not ( = ?auto_22806 ?auto_22795 ) ) ( not ( = ?auto_22791 ?auto_22788 ) ) ( not ( = ?auto_22797 ?auto_22791 ) ) ( not ( = ?auto_22800 ?auto_22791 ) ) ( not ( = ?auto_22809 ?auto_22791 ) ) ( HOIST-AT ?auto_22794 ?auto_22791 ) ( not ( = ?auto_22796 ?auto_22794 ) ) ( not ( = ?auto_22801 ?auto_22794 ) ) ( not ( = ?auto_22808 ?auto_22794 ) ) ( not ( = ?auto_22785 ?auto_22794 ) ) ( AVAILABLE ?auto_22794 ) ( SURFACE-AT ?auto_22784 ?auto_22791 ) ( ON ?auto_22784 ?auto_22790 ) ( CLEAR ?auto_22784 ) ( not ( = ?auto_22782 ?auto_22790 ) ) ( not ( = ?auto_22783 ?auto_22790 ) ) ( not ( = ?auto_22792 ?auto_22790 ) ) ( not ( = ?auto_22786 ?auto_22790 ) ) ( not ( = ?auto_22799 ?auto_22790 ) ) ( not ( = ?auto_22784 ?auto_22790 ) ) ( not ( = ?auto_22806 ?auto_22790 ) ) ( not ( = ?auto_22795 ?auto_22790 ) ) ( IS-CRATE ?auto_22795 ) ( not ( = ?auto_22782 ?auto_22798 ) ) ( not ( = ?auto_22783 ?auto_22798 ) ) ( not ( = ?auto_22792 ?auto_22798 ) ) ( not ( = ?auto_22786 ?auto_22798 ) ) ( not ( = ?auto_22799 ?auto_22798 ) ) ( not ( = ?auto_22784 ?auto_22798 ) ) ( not ( = ?auto_22806 ?auto_22798 ) ) ( not ( = ?auto_22795 ?auto_22798 ) ) ( not ( = ?auto_22790 ?auto_22798 ) ) ( not ( = ?auto_22789 ?auto_22788 ) ) ( not ( = ?auto_22797 ?auto_22789 ) ) ( not ( = ?auto_22800 ?auto_22789 ) ) ( not ( = ?auto_22809 ?auto_22789 ) ) ( not ( = ?auto_22791 ?auto_22789 ) ) ( HOIST-AT ?auto_22803 ?auto_22789 ) ( not ( = ?auto_22796 ?auto_22803 ) ) ( not ( = ?auto_22801 ?auto_22803 ) ) ( not ( = ?auto_22808 ?auto_22803 ) ) ( not ( = ?auto_22785 ?auto_22803 ) ) ( not ( = ?auto_22794 ?auto_22803 ) ) ( AVAILABLE ?auto_22803 ) ( SURFACE-AT ?auto_22795 ?auto_22789 ) ( ON ?auto_22795 ?auto_22802 ) ( CLEAR ?auto_22795 ) ( not ( = ?auto_22782 ?auto_22802 ) ) ( not ( = ?auto_22783 ?auto_22802 ) ) ( not ( = ?auto_22792 ?auto_22802 ) ) ( not ( = ?auto_22786 ?auto_22802 ) ) ( not ( = ?auto_22799 ?auto_22802 ) ) ( not ( = ?auto_22784 ?auto_22802 ) ) ( not ( = ?auto_22806 ?auto_22802 ) ) ( not ( = ?auto_22795 ?auto_22802 ) ) ( not ( = ?auto_22790 ?auto_22802 ) ) ( not ( = ?auto_22798 ?auto_22802 ) ) ( IS-CRATE ?auto_22798 ) ( not ( = ?auto_22782 ?auto_22805 ) ) ( not ( = ?auto_22783 ?auto_22805 ) ) ( not ( = ?auto_22792 ?auto_22805 ) ) ( not ( = ?auto_22786 ?auto_22805 ) ) ( not ( = ?auto_22799 ?auto_22805 ) ) ( not ( = ?auto_22784 ?auto_22805 ) ) ( not ( = ?auto_22806 ?auto_22805 ) ) ( not ( = ?auto_22795 ?auto_22805 ) ) ( not ( = ?auto_22790 ?auto_22805 ) ) ( not ( = ?auto_22798 ?auto_22805 ) ) ( not ( = ?auto_22802 ?auto_22805 ) ) ( not ( = ?auto_22804 ?auto_22788 ) ) ( not ( = ?auto_22797 ?auto_22804 ) ) ( not ( = ?auto_22800 ?auto_22804 ) ) ( not ( = ?auto_22809 ?auto_22804 ) ) ( not ( = ?auto_22791 ?auto_22804 ) ) ( not ( = ?auto_22789 ?auto_22804 ) ) ( HOIST-AT ?auto_22793 ?auto_22804 ) ( not ( = ?auto_22796 ?auto_22793 ) ) ( not ( = ?auto_22801 ?auto_22793 ) ) ( not ( = ?auto_22808 ?auto_22793 ) ) ( not ( = ?auto_22785 ?auto_22793 ) ) ( not ( = ?auto_22794 ?auto_22793 ) ) ( not ( = ?auto_22803 ?auto_22793 ) ) ( AVAILABLE ?auto_22793 ) ( SURFACE-AT ?auto_22798 ?auto_22804 ) ( ON ?auto_22798 ?auto_22807 ) ( CLEAR ?auto_22798 ) ( not ( = ?auto_22782 ?auto_22807 ) ) ( not ( = ?auto_22783 ?auto_22807 ) ) ( not ( = ?auto_22792 ?auto_22807 ) ) ( not ( = ?auto_22786 ?auto_22807 ) ) ( not ( = ?auto_22799 ?auto_22807 ) ) ( not ( = ?auto_22784 ?auto_22807 ) ) ( not ( = ?auto_22806 ?auto_22807 ) ) ( not ( = ?auto_22795 ?auto_22807 ) ) ( not ( = ?auto_22790 ?auto_22807 ) ) ( not ( = ?auto_22798 ?auto_22807 ) ) ( not ( = ?auto_22802 ?auto_22807 ) ) ( not ( = ?auto_22805 ?auto_22807 ) ) ( TRUCK-AT ?auto_22787 ?auto_22788 ) ( SURFACE-AT ?auto_22810 ?auto_22788 ) ( CLEAR ?auto_22810 ) ( LIFTING ?auto_22796 ?auto_22805 ) ( IS-CRATE ?auto_22805 ) ( not ( = ?auto_22782 ?auto_22810 ) ) ( not ( = ?auto_22783 ?auto_22810 ) ) ( not ( = ?auto_22792 ?auto_22810 ) ) ( not ( = ?auto_22786 ?auto_22810 ) ) ( not ( = ?auto_22799 ?auto_22810 ) ) ( not ( = ?auto_22784 ?auto_22810 ) ) ( not ( = ?auto_22806 ?auto_22810 ) ) ( not ( = ?auto_22795 ?auto_22810 ) ) ( not ( = ?auto_22790 ?auto_22810 ) ) ( not ( = ?auto_22798 ?auto_22810 ) ) ( not ( = ?auto_22802 ?auto_22810 ) ) ( not ( = ?auto_22805 ?auto_22810 ) ) ( not ( = ?auto_22807 ?auto_22810 ) ) )
    :subtasks
    ( ( !DROP ?auto_22796 ?auto_22805 ?auto_22810 ?auto_22788 )
      ( MAKE-ON ?auto_22782 ?auto_22783 )
      ( MAKE-ON-VERIFY ?auto_22782 ?auto_22783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22811 - SURFACE
      ?auto_22812 - SURFACE
    )
    :vars
    (
      ?auto_22832 - HOIST
      ?auto_22830 - PLACE
      ?auto_22834 - PLACE
      ?auto_22814 - HOIST
      ?auto_22837 - SURFACE
      ?auto_22824 - SURFACE
      ?auto_22815 - PLACE
      ?auto_22822 - HOIST
      ?auto_22821 - SURFACE
      ?auto_22838 - SURFACE
      ?auto_22823 - PLACE
      ?auto_22829 - HOIST
      ?auto_22820 - SURFACE
      ?auto_22833 - SURFACE
      ?auto_22835 - PLACE
      ?auto_22826 - HOIST
      ?auto_22831 - SURFACE
      ?auto_22828 - SURFACE
      ?auto_22825 - PLACE
      ?auto_22817 - HOIST
      ?auto_22813 - SURFACE
      ?auto_22819 - SURFACE
      ?auto_22818 - PLACE
      ?auto_22836 - HOIST
      ?auto_22816 - SURFACE
      ?auto_22827 - TRUCK
      ?auto_22839 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22832 ?auto_22830 ) ( IS-CRATE ?auto_22811 ) ( not ( = ?auto_22811 ?auto_22812 ) ) ( not ( = ?auto_22834 ?auto_22830 ) ) ( HOIST-AT ?auto_22814 ?auto_22834 ) ( not ( = ?auto_22832 ?auto_22814 ) ) ( AVAILABLE ?auto_22814 ) ( SURFACE-AT ?auto_22811 ?auto_22834 ) ( ON ?auto_22811 ?auto_22837 ) ( CLEAR ?auto_22811 ) ( not ( = ?auto_22811 ?auto_22837 ) ) ( not ( = ?auto_22812 ?auto_22837 ) ) ( IS-CRATE ?auto_22812 ) ( not ( = ?auto_22811 ?auto_22824 ) ) ( not ( = ?auto_22812 ?auto_22824 ) ) ( not ( = ?auto_22837 ?auto_22824 ) ) ( not ( = ?auto_22815 ?auto_22830 ) ) ( not ( = ?auto_22834 ?auto_22815 ) ) ( HOIST-AT ?auto_22822 ?auto_22815 ) ( not ( = ?auto_22832 ?auto_22822 ) ) ( not ( = ?auto_22814 ?auto_22822 ) ) ( AVAILABLE ?auto_22822 ) ( SURFACE-AT ?auto_22812 ?auto_22815 ) ( ON ?auto_22812 ?auto_22821 ) ( CLEAR ?auto_22812 ) ( not ( = ?auto_22811 ?auto_22821 ) ) ( not ( = ?auto_22812 ?auto_22821 ) ) ( not ( = ?auto_22837 ?auto_22821 ) ) ( not ( = ?auto_22824 ?auto_22821 ) ) ( IS-CRATE ?auto_22824 ) ( not ( = ?auto_22811 ?auto_22838 ) ) ( not ( = ?auto_22812 ?auto_22838 ) ) ( not ( = ?auto_22837 ?auto_22838 ) ) ( not ( = ?auto_22824 ?auto_22838 ) ) ( not ( = ?auto_22821 ?auto_22838 ) ) ( not ( = ?auto_22823 ?auto_22830 ) ) ( not ( = ?auto_22834 ?auto_22823 ) ) ( not ( = ?auto_22815 ?auto_22823 ) ) ( HOIST-AT ?auto_22829 ?auto_22823 ) ( not ( = ?auto_22832 ?auto_22829 ) ) ( not ( = ?auto_22814 ?auto_22829 ) ) ( not ( = ?auto_22822 ?auto_22829 ) ) ( AVAILABLE ?auto_22829 ) ( SURFACE-AT ?auto_22824 ?auto_22823 ) ( ON ?auto_22824 ?auto_22820 ) ( CLEAR ?auto_22824 ) ( not ( = ?auto_22811 ?auto_22820 ) ) ( not ( = ?auto_22812 ?auto_22820 ) ) ( not ( = ?auto_22837 ?auto_22820 ) ) ( not ( = ?auto_22824 ?auto_22820 ) ) ( not ( = ?auto_22821 ?auto_22820 ) ) ( not ( = ?auto_22838 ?auto_22820 ) ) ( IS-CRATE ?auto_22838 ) ( not ( = ?auto_22811 ?auto_22833 ) ) ( not ( = ?auto_22812 ?auto_22833 ) ) ( not ( = ?auto_22837 ?auto_22833 ) ) ( not ( = ?auto_22824 ?auto_22833 ) ) ( not ( = ?auto_22821 ?auto_22833 ) ) ( not ( = ?auto_22838 ?auto_22833 ) ) ( not ( = ?auto_22820 ?auto_22833 ) ) ( not ( = ?auto_22835 ?auto_22830 ) ) ( not ( = ?auto_22834 ?auto_22835 ) ) ( not ( = ?auto_22815 ?auto_22835 ) ) ( not ( = ?auto_22823 ?auto_22835 ) ) ( HOIST-AT ?auto_22826 ?auto_22835 ) ( not ( = ?auto_22832 ?auto_22826 ) ) ( not ( = ?auto_22814 ?auto_22826 ) ) ( not ( = ?auto_22822 ?auto_22826 ) ) ( not ( = ?auto_22829 ?auto_22826 ) ) ( AVAILABLE ?auto_22826 ) ( SURFACE-AT ?auto_22838 ?auto_22835 ) ( ON ?auto_22838 ?auto_22831 ) ( CLEAR ?auto_22838 ) ( not ( = ?auto_22811 ?auto_22831 ) ) ( not ( = ?auto_22812 ?auto_22831 ) ) ( not ( = ?auto_22837 ?auto_22831 ) ) ( not ( = ?auto_22824 ?auto_22831 ) ) ( not ( = ?auto_22821 ?auto_22831 ) ) ( not ( = ?auto_22838 ?auto_22831 ) ) ( not ( = ?auto_22820 ?auto_22831 ) ) ( not ( = ?auto_22833 ?auto_22831 ) ) ( IS-CRATE ?auto_22833 ) ( not ( = ?auto_22811 ?auto_22828 ) ) ( not ( = ?auto_22812 ?auto_22828 ) ) ( not ( = ?auto_22837 ?auto_22828 ) ) ( not ( = ?auto_22824 ?auto_22828 ) ) ( not ( = ?auto_22821 ?auto_22828 ) ) ( not ( = ?auto_22838 ?auto_22828 ) ) ( not ( = ?auto_22820 ?auto_22828 ) ) ( not ( = ?auto_22833 ?auto_22828 ) ) ( not ( = ?auto_22831 ?auto_22828 ) ) ( not ( = ?auto_22825 ?auto_22830 ) ) ( not ( = ?auto_22834 ?auto_22825 ) ) ( not ( = ?auto_22815 ?auto_22825 ) ) ( not ( = ?auto_22823 ?auto_22825 ) ) ( not ( = ?auto_22835 ?auto_22825 ) ) ( HOIST-AT ?auto_22817 ?auto_22825 ) ( not ( = ?auto_22832 ?auto_22817 ) ) ( not ( = ?auto_22814 ?auto_22817 ) ) ( not ( = ?auto_22822 ?auto_22817 ) ) ( not ( = ?auto_22829 ?auto_22817 ) ) ( not ( = ?auto_22826 ?auto_22817 ) ) ( AVAILABLE ?auto_22817 ) ( SURFACE-AT ?auto_22833 ?auto_22825 ) ( ON ?auto_22833 ?auto_22813 ) ( CLEAR ?auto_22833 ) ( not ( = ?auto_22811 ?auto_22813 ) ) ( not ( = ?auto_22812 ?auto_22813 ) ) ( not ( = ?auto_22837 ?auto_22813 ) ) ( not ( = ?auto_22824 ?auto_22813 ) ) ( not ( = ?auto_22821 ?auto_22813 ) ) ( not ( = ?auto_22838 ?auto_22813 ) ) ( not ( = ?auto_22820 ?auto_22813 ) ) ( not ( = ?auto_22833 ?auto_22813 ) ) ( not ( = ?auto_22831 ?auto_22813 ) ) ( not ( = ?auto_22828 ?auto_22813 ) ) ( IS-CRATE ?auto_22828 ) ( not ( = ?auto_22811 ?auto_22819 ) ) ( not ( = ?auto_22812 ?auto_22819 ) ) ( not ( = ?auto_22837 ?auto_22819 ) ) ( not ( = ?auto_22824 ?auto_22819 ) ) ( not ( = ?auto_22821 ?auto_22819 ) ) ( not ( = ?auto_22838 ?auto_22819 ) ) ( not ( = ?auto_22820 ?auto_22819 ) ) ( not ( = ?auto_22833 ?auto_22819 ) ) ( not ( = ?auto_22831 ?auto_22819 ) ) ( not ( = ?auto_22828 ?auto_22819 ) ) ( not ( = ?auto_22813 ?auto_22819 ) ) ( not ( = ?auto_22818 ?auto_22830 ) ) ( not ( = ?auto_22834 ?auto_22818 ) ) ( not ( = ?auto_22815 ?auto_22818 ) ) ( not ( = ?auto_22823 ?auto_22818 ) ) ( not ( = ?auto_22835 ?auto_22818 ) ) ( not ( = ?auto_22825 ?auto_22818 ) ) ( HOIST-AT ?auto_22836 ?auto_22818 ) ( not ( = ?auto_22832 ?auto_22836 ) ) ( not ( = ?auto_22814 ?auto_22836 ) ) ( not ( = ?auto_22822 ?auto_22836 ) ) ( not ( = ?auto_22829 ?auto_22836 ) ) ( not ( = ?auto_22826 ?auto_22836 ) ) ( not ( = ?auto_22817 ?auto_22836 ) ) ( AVAILABLE ?auto_22836 ) ( SURFACE-AT ?auto_22828 ?auto_22818 ) ( ON ?auto_22828 ?auto_22816 ) ( CLEAR ?auto_22828 ) ( not ( = ?auto_22811 ?auto_22816 ) ) ( not ( = ?auto_22812 ?auto_22816 ) ) ( not ( = ?auto_22837 ?auto_22816 ) ) ( not ( = ?auto_22824 ?auto_22816 ) ) ( not ( = ?auto_22821 ?auto_22816 ) ) ( not ( = ?auto_22838 ?auto_22816 ) ) ( not ( = ?auto_22820 ?auto_22816 ) ) ( not ( = ?auto_22833 ?auto_22816 ) ) ( not ( = ?auto_22831 ?auto_22816 ) ) ( not ( = ?auto_22828 ?auto_22816 ) ) ( not ( = ?auto_22813 ?auto_22816 ) ) ( not ( = ?auto_22819 ?auto_22816 ) ) ( TRUCK-AT ?auto_22827 ?auto_22830 ) ( SURFACE-AT ?auto_22839 ?auto_22830 ) ( CLEAR ?auto_22839 ) ( IS-CRATE ?auto_22819 ) ( not ( = ?auto_22811 ?auto_22839 ) ) ( not ( = ?auto_22812 ?auto_22839 ) ) ( not ( = ?auto_22837 ?auto_22839 ) ) ( not ( = ?auto_22824 ?auto_22839 ) ) ( not ( = ?auto_22821 ?auto_22839 ) ) ( not ( = ?auto_22838 ?auto_22839 ) ) ( not ( = ?auto_22820 ?auto_22839 ) ) ( not ( = ?auto_22833 ?auto_22839 ) ) ( not ( = ?auto_22831 ?auto_22839 ) ) ( not ( = ?auto_22828 ?auto_22839 ) ) ( not ( = ?auto_22813 ?auto_22839 ) ) ( not ( = ?auto_22819 ?auto_22839 ) ) ( not ( = ?auto_22816 ?auto_22839 ) ) ( AVAILABLE ?auto_22832 ) ( IN ?auto_22819 ?auto_22827 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22832 ?auto_22819 ?auto_22827 ?auto_22830 )
      ( MAKE-ON ?auto_22811 ?auto_22812 )
      ( MAKE-ON-VERIFY ?auto_22811 ?auto_22812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22840 - SURFACE
      ?auto_22841 - SURFACE
    )
    :vars
    (
      ?auto_22861 - HOIST
      ?auto_22859 - PLACE
      ?auto_22863 - PLACE
      ?auto_22845 - HOIST
      ?auto_22850 - SURFACE
      ?auto_22847 - SURFACE
      ?auto_22843 - PLACE
      ?auto_22846 - HOIST
      ?auto_22867 - SURFACE
      ?auto_22849 - SURFACE
      ?auto_22844 - PLACE
      ?auto_22858 - HOIST
      ?auto_22856 - SURFACE
      ?auto_22862 - SURFACE
      ?auto_22864 - PLACE
      ?auto_22842 - HOIST
      ?auto_22860 - SURFACE
      ?auto_22865 - SURFACE
      ?auto_22854 - PLACE
      ?auto_22866 - HOIST
      ?auto_22852 - SURFACE
      ?auto_22848 - SURFACE
      ?auto_22855 - PLACE
      ?auto_22857 - HOIST
      ?auto_22868 - SURFACE
      ?auto_22851 - SURFACE
      ?auto_22853 - TRUCK
      ?auto_22869 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22861 ?auto_22859 ) ( IS-CRATE ?auto_22840 ) ( not ( = ?auto_22840 ?auto_22841 ) ) ( not ( = ?auto_22863 ?auto_22859 ) ) ( HOIST-AT ?auto_22845 ?auto_22863 ) ( not ( = ?auto_22861 ?auto_22845 ) ) ( AVAILABLE ?auto_22845 ) ( SURFACE-AT ?auto_22840 ?auto_22863 ) ( ON ?auto_22840 ?auto_22850 ) ( CLEAR ?auto_22840 ) ( not ( = ?auto_22840 ?auto_22850 ) ) ( not ( = ?auto_22841 ?auto_22850 ) ) ( IS-CRATE ?auto_22841 ) ( not ( = ?auto_22840 ?auto_22847 ) ) ( not ( = ?auto_22841 ?auto_22847 ) ) ( not ( = ?auto_22850 ?auto_22847 ) ) ( not ( = ?auto_22843 ?auto_22859 ) ) ( not ( = ?auto_22863 ?auto_22843 ) ) ( HOIST-AT ?auto_22846 ?auto_22843 ) ( not ( = ?auto_22861 ?auto_22846 ) ) ( not ( = ?auto_22845 ?auto_22846 ) ) ( AVAILABLE ?auto_22846 ) ( SURFACE-AT ?auto_22841 ?auto_22843 ) ( ON ?auto_22841 ?auto_22867 ) ( CLEAR ?auto_22841 ) ( not ( = ?auto_22840 ?auto_22867 ) ) ( not ( = ?auto_22841 ?auto_22867 ) ) ( not ( = ?auto_22850 ?auto_22867 ) ) ( not ( = ?auto_22847 ?auto_22867 ) ) ( IS-CRATE ?auto_22847 ) ( not ( = ?auto_22840 ?auto_22849 ) ) ( not ( = ?auto_22841 ?auto_22849 ) ) ( not ( = ?auto_22850 ?auto_22849 ) ) ( not ( = ?auto_22847 ?auto_22849 ) ) ( not ( = ?auto_22867 ?auto_22849 ) ) ( not ( = ?auto_22844 ?auto_22859 ) ) ( not ( = ?auto_22863 ?auto_22844 ) ) ( not ( = ?auto_22843 ?auto_22844 ) ) ( HOIST-AT ?auto_22858 ?auto_22844 ) ( not ( = ?auto_22861 ?auto_22858 ) ) ( not ( = ?auto_22845 ?auto_22858 ) ) ( not ( = ?auto_22846 ?auto_22858 ) ) ( AVAILABLE ?auto_22858 ) ( SURFACE-AT ?auto_22847 ?auto_22844 ) ( ON ?auto_22847 ?auto_22856 ) ( CLEAR ?auto_22847 ) ( not ( = ?auto_22840 ?auto_22856 ) ) ( not ( = ?auto_22841 ?auto_22856 ) ) ( not ( = ?auto_22850 ?auto_22856 ) ) ( not ( = ?auto_22847 ?auto_22856 ) ) ( not ( = ?auto_22867 ?auto_22856 ) ) ( not ( = ?auto_22849 ?auto_22856 ) ) ( IS-CRATE ?auto_22849 ) ( not ( = ?auto_22840 ?auto_22862 ) ) ( not ( = ?auto_22841 ?auto_22862 ) ) ( not ( = ?auto_22850 ?auto_22862 ) ) ( not ( = ?auto_22847 ?auto_22862 ) ) ( not ( = ?auto_22867 ?auto_22862 ) ) ( not ( = ?auto_22849 ?auto_22862 ) ) ( not ( = ?auto_22856 ?auto_22862 ) ) ( not ( = ?auto_22864 ?auto_22859 ) ) ( not ( = ?auto_22863 ?auto_22864 ) ) ( not ( = ?auto_22843 ?auto_22864 ) ) ( not ( = ?auto_22844 ?auto_22864 ) ) ( HOIST-AT ?auto_22842 ?auto_22864 ) ( not ( = ?auto_22861 ?auto_22842 ) ) ( not ( = ?auto_22845 ?auto_22842 ) ) ( not ( = ?auto_22846 ?auto_22842 ) ) ( not ( = ?auto_22858 ?auto_22842 ) ) ( AVAILABLE ?auto_22842 ) ( SURFACE-AT ?auto_22849 ?auto_22864 ) ( ON ?auto_22849 ?auto_22860 ) ( CLEAR ?auto_22849 ) ( not ( = ?auto_22840 ?auto_22860 ) ) ( not ( = ?auto_22841 ?auto_22860 ) ) ( not ( = ?auto_22850 ?auto_22860 ) ) ( not ( = ?auto_22847 ?auto_22860 ) ) ( not ( = ?auto_22867 ?auto_22860 ) ) ( not ( = ?auto_22849 ?auto_22860 ) ) ( not ( = ?auto_22856 ?auto_22860 ) ) ( not ( = ?auto_22862 ?auto_22860 ) ) ( IS-CRATE ?auto_22862 ) ( not ( = ?auto_22840 ?auto_22865 ) ) ( not ( = ?auto_22841 ?auto_22865 ) ) ( not ( = ?auto_22850 ?auto_22865 ) ) ( not ( = ?auto_22847 ?auto_22865 ) ) ( not ( = ?auto_22867 ?auto_22865 ) ) ( not ( = ?auto_22849 ?auto_22865 ) ) ( not ( = ?auto_22856 ?auto_22865 ) ) ( not ( = ?auto_22862 ?auto_22865 ) ) ( not ( = ?auto_22860 ?auto_22865 ) ) ( not ( = ?auto_22854 ?auto_22859 ) ) ( not ( = ?auto_22863 ?auto_22854 ) ) ( not ( = ?auto_22843 ?auto_22854 ) ) ( not ( = ?auto_22844 ?auto_22854 ) ) ( not ( = ?auto_22864 ?auto_22854 ) ) ( HOIST-AT ?auto_22866 ?auto_22854 ) ( not ( = ?auto_22861 ?auto_22866 ) ) ( not ( = ?auto_22845 ?auto_22866 ) ) ( not ( = ?auto_22846 ?auto_22866 ) ) ( not ( = ?auto_22858 ?auto_22866 ) ) ( not ( = ?auto_22842 ?auto_22866 ) ) ( AVAILABLE ?auto_22866 ) ( SURFACE-AT ?auto_22862 ?auto_22854 ) ( ON ?auto_22862 ?auto_22852 ) ( CLEAR ?auto_22862 ) ( not ( = ?auto_22840 ?auto_22852 ) ) ( not ( = ?auto_22841 ?auto_22852 ) ) ( not ( = ?auto_22850 ?auto_22852 ) ) ( not ( = ?auto_22847 ?auto_22852 ) ) ( not ( = ?auto_22867 ?auto_22852 ) ) ( not ( = ?auto_22849 ?auto_22852 ) ) ( not ( = ?auto_22856 ?auto_22852 ) ) ( not ( = ?auto_22862 ?auto_22852 ) ) ( not ( = ?auto_22860 ?auto_22852 ) ) ( not ( = ?auto_22865 ?auto_22852 ) ) ( IS-CRATE ?auto_22865 ) ( not ( = ?auto_22840 ?auto_22848 ) ) ( not ( = ?auto_22841 ?auto_22848 ) ) ( not ( = ?auto_22850 ?auto_22848 ) ) ( not ( = ?auto_22847 ?auto_22848 ) ) ( not ( = ?auto_22867 ?auto_22848 ) ) ( not ( = ?auto_22849 ?auto_22848 ) ) ( not ( = ?auto_22856 ?auto_22848 ) ) ( not ( = ?auto_22862 ?auto_22848 ) ) ( not ( = ?auto_22860 ?auto_22848 ) ) ( not ( = ?auto_22865 ?auto_22848 ) ) ( not ( = ?auto_22852 ?auto_22848 ) ) ( not ( = ?auto_22855 ?auto_22859 ) ) ( not ( = ?auto_22863 ?auto_22855 ) ) ( not ( = ?auto_22843 ?auto_22855 ) ) ( not ( = ?auto_22844 ?auto_22855 ) ) ( not ( = ?auto_22864 ?auto_22855 ) ) ( not ( = ?auto_22854 ?auto_22855 ) ) ( HOIST-AT ?auto_22857 ?auto_22855 ) ( not ( = ?auto_22861 ?auto_22857 ) ) ( not ( = ?auto_22845 ?auto_22857 ) ) ( not ( = ?auto_22846 ?auto_22857 ) ) ( not ( = ?auto_22858 ?auto_22857 ) ) ( not ( = ?auto_22842 ?auto_22857 ) ) ( not ( = ?auto_22866 ?auto_22857 ) ) ( AVAILABLE ?auto_22857 ) ( SURFACE-AT ?auto_22865 ?auto_22855 ) ( ON ?auto_22865 ?auto_22868 ) ( CLEAR ?auto_22865 ) ( not ( = ?auto_22840 ?auto_22868 ) ) ( not ( = ?auto_22841 ?auto_22868 ) ) ( not ( = ?auto_22850 ?auto_22868 ) ) ( not ( = ?auto_22847 ?auto_22868 ) ) ( not ( = ?auto_22867 ?auto_22868 ) ) ( not ( = ?auto_22849 ?auto_22868 ) ) ( not ( = ?auto_22856 ?auto_22868 ) ) ( not ( = ?auto_22862 ?auto_22868 ) ) ( not ( = ?auto_22860 ?auto_22868 ) ) ( not ( = ?auto_22865 ?auto_22868 ) ) ( not ( = ?auto_22852 ?auto_22868 ) ) ( not ( = ?auto_22848 ?auto_22868 ) ) ( SURFACE-AT ?auto_22851 ?auto_22859 ) ( CLEAR ?auto_22851 ) ( IS-CRATE ?auto_22848 ) ( not ( = ?auto_22840 ?auto_22851 ) ) ( not ( = ?auto_22841 ?auto_22851 ) ) ( not ( = ?auto_22850 ?auto_22851 ) ) ( not ( = ?auto_22847 ?auto_22851 ) ) ( not ( = ?auto_22867 ?auto_22851 ) ) ( not ( = ?auto_22849 ?auto_22851 ) ) ( not ( = ?auto_22856 ?auto_22851 ) ) ( not ( = ?auto_22862 ?auto_22851 ) ) ( not ( = ?auto_22860 ?auto_22851 ) ) ( not ( = ?auto_22865 ?auto_22851 ) ) ( not ( = ?auto_22852 ?auto_22851 ) ) ( not ( = ?auto_22848 ?auto_22851 ) ) ( not ( = ?auto_22868 ?auto_22851 ) ) ( AVAILABLE ?auto_22861 ) ( IN ?auto_22848 ?auto_22853 ) ( TRUCK-AT ?auto_22853 ?auto_22869 ) ( not ( = ?auto_22869 ?auto_22859 ) ) ( not ( = ?auto_22863 ?auto_22869 ) ) ( not ( = ?auto_22843 ?auto_22869 ) ) ( not ( = ?auto_22844 ?auto_22869 ) ) ( not ( = ?auto_22864 ?auto_22869 ) ) ( not ( = ?auto_22854 ?auto_22869 ) ) ( not ( = ?auto_22855 ?auto_22869 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22853 ?auto_22869 ?auto_22859 )
      ( MAKE-ON ?auto_22840 ?auto_22841 )
      ( MAKE-ON-VERIFY ?auto_22840 ?auto_22841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22870 - SURFACE
      ?auto_22871 - SURFACE
    )
    :vars
    (
      ?auto_22892 - HOIST
      ?auto_22890 - PLACE
      ?auto_22894 - PLACE
      ?auto_22879 - HOIST
      ?auto_22882 - SURFACE
      ?auto_22875 - SURFACE
      ?auto_22896 - PLACE
      ?auto_22884 - HOIST
      ?auto_22886 - SURFACE
      ?auto_22873 - SURFACE
      ?auto_22881 - PLACE
      ?auto_22889 - HOIST
      ?auto_22898 - SURFACE
      ?auto_22893 - SURFACE
      ?auto_22895 - PLACE
      ?auto_22876 - HOIST
      ?auto_22891 - SURFACE
      ?auto_22888 - SURFACE
      ?auto_22880 - PLACE
      ?auto_22885 - HOIST
      ?auto_22883 - SURFACE
      ?auto_22899 - SURFACE
      ?auto_22877 - PLACE
      ?auto_22872 - HOIST
      ?auto_22887 - SURFACE
      ?auto_22878 - SURFACE
      ?auto_22874 - TRUCK
      ?auto_22897 - PLACE
      ?auto_22900 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22892 ?auto_22890 ) ( IS-CRATE ?auto_22870 ) ( not ( = ?auto_22870 ?auto_22871 ) ) ( not ( = ?auto_22894 ?auto_22890 ) ) ( HOIST-AT ?auto_22879 ?auto_22894 ) ( not ( = ?auto_22892 ?auto_22879 ) ) ( AVAILABLE ?auto_22879 ) ( SURFACE-AT ?auto_22870 ?auto_22894 ) ( ON ?auto_22870 ?auto_22882 ) ( CLEAR ?auto_22870 ) ( not ( = ?auto_22870 ?auto_22882 ) ) ( not ( = ?auto_22871 ?auto_22882 ) ) ( IS-CRATE ?auto_22871 ) ( not ( = ?auto_22870 ?auto_22875 ) ) ( not ( = ?auto_22871 ?auto_22875 ) ) ( not ( = ?auto_22882 ?auto_22875 ) ) ( not ( = ?auto_22896 ?auto_22890 ) ) ( not ( = ?auto_22894 ?auto_22896 ) ) ( HOIST-AT ?auto_22884 ?auto_22896 ) ( not ( = ?auto_22892 ?auto_22884 ) ) ( not ( = ?auto_22879 ?auto_22884 ) ) ( AVAILABLE ?auto_22884 ) ( SURFACE-AT ?auto_22871 ?auto_22896 ) ( ON ?auto_22871 ?auto_22886 ) ( CLEAR ?auto_22871 ) ( not ( = ?auto_22870 ?auto_22886 ) ) ( not ( = ?auto_22871 ?auto_22886 ) ) ( not ( = ?auto_22882 ?auto_22886 ) ) ( not ( = ?auto_22875 ?auto_22886 ) ) ( IS-CRATE ?auto_22875 ) ( not ( = ?auto_22870 ?auto_22873 ) ) ( not ( = ?auto_22871 ?auto_22873 ) ) ( not ( = ?auto_22882 ?auto_22873 ) ) ( not ( = ?auto_22875 ?auto_22873 ) ) ( not ( = ?auto_22886 ?auto_22873 ) ) ( not ( = ?auto_22881 ?auto_22890 ) ) ( not ( = ?auto_22894 ?auto_22881 ) ) ( not ( = ?auto_22896 ?auto_22881 ) ) ( HOIST-AT ?auto_22889 ?auto_22881 ) ( not ( = ?auto_22892 ?auto_22889 ) ) ( not ( = ?auto_22879 ?auto_22889 ) ) ( not ( = ?auto_22884 ?auto_22889 ) ) ( AVAILABLE ?auto_22889 ) ( SURFACE-AT ?auto_22875 ?auto_22881 ) ( ON ?auto_22875 ?auto_22898 ) ( CLEAR ?auto_22875 ) ( not ( = ?auto_22870 ?auto_22898 ) ) ( not ( = ?auto_22871 ?auto_22898 ) ) ( not ( = ?auto_22882 ?auto_22898 ) ) ( not ( = ?auto_22875 ?auto_22898 ) ) ( not ( = ?auto_22886 ?auto_22898 ) ) ( not ( = ?auto_22873 ?auto_22898 ) ) ( IS-CRATE ?auto_22873 ) ( not ( = ?auto_22870 ?auto_22893 ) ) ( not ( = ?auto_22871 ?auto_22893 ) ) ( not ( = ?auto_22882 ?auto_22893 ) ) ( not ( = ?auto_22875 ?auto_22893 ) ) ( not ( = ?auto_22886 ?auto_22893 ) ) ( not ( = ?auto_22873 ?auto_22893 ) ) ( not ( = ?auto_22898 ?auto_22893 ) ) ( not ( = ?auto_22895 ?auto_22890 ) ) ( not ( = ?auto_22894 ?auto_22895 ) ) ( not ( = ?auto_22896 ?auto_22895 ) ) ( not ( = ?auto_22881 ?auto_22895 ) ) ( HOIST-AT ?auto_22876 ?auto_22895 ) ( not ( = ?auto_22892 ?auto_22876 ) ) ( not ( = ?auto_22879 ?auto_22876 ) ) ( not ( = ?auto_22884 ?auto_22876 ) ) ( not ( = ?auto_22889 ?auto_22876 ) ) ( AVAILABLE ?auto_22876 ) ( SURFACE-AT ?auto_22873 ?auto_22895 ) ( ON ?auto_22873 ?auto_22891 ) ( CLEAR ?auto_22873 ) ( not ( = ?auto_22870 ?auto_22891 ) ) ( not ( = ?auto_22871 ?auto_22891 ) ) ( not ( = ?auto_22882 ?auto_22891 ) ) ( not ( = ?auto_22875 ?auto_22891 ) ) ( not ( = ?auto_22886 ?auto_22891 ) ) ( not ( = ?auto_22873 ?auto_22891 ) ) ( not ( = ?auto_22898 ?auto_22891 ) ) ( not ( = ?auto_22893 ?auto_22891 ) ) ( IS-CRATE ?auto_22893 ) ( not ( = ?auto_22870 ?auto_22888 ) ) ( not ( = ?auto_22871 ?auto_22888 ) ) ( not ( = ?auto_22882 ?auto_22888 ) ) ( not ( = ?auto_22875 ?auto_22888 ) ) ( not ( = ?auto_22886 ?auto_22888 ) ) ( not ( = ?auto_22873 ?auto_22888 ) ) ( not ( = ?auto_22898 ?auto_22888 ) ) ( not ( = ?auto_22893 ?auto_22888 ) ) ( not ( = ?auto_22891 ?auto_22888 ) ) ( not ( = ?auto_22880 ?auto_22890 ) ) ( not ( = ?auto_22894 ?auto_22880 ) ) ( not ( = ?auto_22896 ?auto_22880 ) ) ( not ( = ?auto_22881 ?auto_22880 ) ) ( not ( = ?auto_22895 ?auto_22880 ) ) ( HOIST-AT ?auto_22885 ?auto_22880 ) ( not ( = ?auto_22892 ?auto_22885 ) ) ( not ( = ?auto_22879 ?auto_22885 ) ) ( not ( = ?auto_22884 ?auto_22885 ) ) ( not ( = ?auto_22889 ?auto_22885 ) ) ( not ( = ?auto_22876 ?auto_22885 ) ) ( AVAILABLE ?auto_22885 ) ( SURFACE-AT ?auto_22893 ?auto_22880 ) ( ON ?auto_22893 ?auto_22883 ) ( CLEAR ?auto_22893 ) ( not ( = ?auto_22870 ?auto_22883 ) ) ( not ( = ?auto_22871 ?auto_22883 ) ) ( not ( = ?auto_22882 ?auto_22883 ) ) ( not ( = ?auto_22875 ?auto_22883 ) ) ( not ( = ?auto_22886 ?auto_22883 ) ) ( not ( = ?auto_22873 ?auto_22883 ) ) ( not ( = ?auto_22898 ?auto_22883 ) ) ( not ( = ?auto_22893 ?auto_22883 ) ) ( not ( = ?auto_22891 ?auto_22883 ) ) ( not ( = ?auto_22888 ?auto_22883 ) ) ( IS-CRATE ?auto_22888 ) ( not ( = ?auto_22870 ?auto_22899 ) ) ( not ( = ?auto_22871 ?auto_22899 ) ) ( not ( = ?auto_22882 ?auto_22899 ) ) ( not ( = ?auto_22875 ?auto_22899 ) ) ( not ( = ?auto_22886 ?auto_22899 ) ) ( not ( = ?auto_22873 ?auto_22899 ) ) ( not ( = ?auto_22898 ?auto_22899 ) ) ( not ( = ?auto_22893 ?auto_22899 ) ) ( not ( = ?auto_22891 ?auto_22899 ) ) ( not ( = ?auto_22888 ?auto_22899 ) ) ( not ( = ?auto_22883 ?auto_22899 ) ) ( not ( = ?auto_22877 ?auto_22890 ) ) ( not ( = ?auto_22894 ?auto_22877 ) ) ( not ( = ?auto_22896 ?auto_22877 ) ) ( not ( = ?auto_22881 ?auto_22877 ) ) ( not ( = ?auto_22895 ?auto_22877 ) ) ( not ( = ?auto_22880 ?auto_22877 ) ) ( HOIST-AT ?auto_22872 ?auto_22877 ) ( not ( = ?auto_22892 ?auto_22872 ) ) ( not ( = ?auto_22879 ?auto_22872 ) ) ( not ( = ?auto_22884 ?auto_22872 ) ) ( not ( = ?auto_22889 ?auto_22872 ) ) ( not ( = ?auto_22876 ?auto_22872 ) ) ( not ( = ?auto_22885 ?auto_22872 ) ) ( AVAILABLE ?auto_22872 ) ( SURFACE-AT ?auto_22888 ?auto_22877 ) ( ON ?auto_22888 ?auto_22887 ) ( CLEAR ?auto_22888 ) ( not ( = ?auto_22870 ?auto_22887 ) ) ( not ( = ?auto_22871 ?auto_22887 ) ) ( not ( = ?auto_22882 ?auto_22887 ) ) ( not ( = ?auto_22875 ?auto_22887 ) ) ( not ( = ?auto_22886 ?auto_22887 ) ) ( not ( = ?auto_22873 ?auto_22887 ) ) ( not ( = ?auto_22898 ?auto_22887 ) ) ( not ( = ?auto_22893 ?auto_22887 ) ) ( not ( = ?auto_22891 ?auto_22887 ) ) ( not ( = ?auto_22888 ?auto_22887 ) ) ( not ( = ?auto_22883 ?auto_22887 ) ) ( not ( = ?auto_22899 ?auto_22887 ) ) ( SURFACE-AT ?auto_22878 ?auto_22890 ) ( CLEAR ?auto_22878 ) ( IS-CRATE ?auto_22899 ) ( not ( = ?auto_22870 ?auto_22878 ) ) ( not ( = ?auto_22871 ?auto_22878 ) ) ( not ( = ?auto_22882 ?auto_22878 ) ) ( not ( = ?auto_22875 ?auto_22878 ) ) ( not ( = ?auto_22886 ?auto_22878 ) ) ( not ( = ?auto_22873 ?auto_22878 ) ) ( not ( = ?auto_22898 ?auto_22878 ) ) ( not ( = ?auto_22893 ?auto_22878 ) ) ( not ( = ?auto_22891 ?auto_22878 ) ) ( not ( = ?auto_22888 ?auto_22878 ) ) ( not ( = ?auto_22883 ?auto_22878 ) ) ( not ( = ?auto_22899 ?auto_22878 ) ) ( not ( = ?auto_22887 ?auto_22878 ) ) ( AVAILABLE ?auto_22892 ) ( TRUCK-AT ?auto_22874 ?auto_22897 ) ( not ( = ?auto_22897 ?auto_22890 ) ) ( not ( = ?auto_22894 ?auto_22897 ) ) ( not ( = ?auto_22896 ?auto_22897 ) ) ( not ( = ?auto_22881 ?auto_22897 ) ) ( not ( = ?auto_22895 ?auto_22897 ) ) ( not ( = ?auto_22880 ?auto_22897 ) ) ( not ( = ?auto_22877 ?auto_22897 ) ) ( HOIST-AT ?auto_22900 ?auto_22897 ) ( LIFTING ?auto_22900 ?auto_22899 ) ( not ( = ?auto_22892 ?auto_22900 ) ) ( not ( = ?auto_22879 ?auto_22900 ) ) ( not ( = ?auto_22884 ?auto_22900 ) ) ( not ( = ?auto_22889 ?auto_22900 ) ) ( not ( = ?auto_22876 ?auto_22900 ) ) ( not ( = ?auto_22885 ?auto_22900 ) ) ( not ( = ?auto_22872 ?auto_22900 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22900 ?auto_22899 ?auto_22874 ?auto_22897 )
      ( MAKE-ON ?auto_22870 ?auto_22871 )
      ( MAKE-ON-VERIFY ?auto_22870 ?auto_22871 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22901 - SURFACE
      ?auto_22902 - SURFACE
    )
    :vars
    (
      ?auto_22921 - HOIST
      ?auto_22919 - PLACE
      ?auto_22923 - PLACE
      ?auto_22909 - HOIST
      ?auto_22926 - SURFACE
      ?auto_22913 - SURFACE
      ?auto_22904 - PLACE
      ?auto_22912 - HOIST
      ?auto_22925 - SURFACE
      ?auto_22928 - SURFACE
      ?auto_22911 - PLACE
      ?auto_22918 - HOIST
      ?auto_22906 - SURFACE
      ?auto_22922 - SURFACE
      ?auto_22910 - PLACE
      ?auto_22929 - HOIST
      ?auto_22920 - SURFACE
      ?auto_22917 - SURFACE
      ?auto_22915 - PLACE
      ?auto_22931 - HOIST
      ?auto_22930 - SURFACE
      ?auto_22907 - SURFACE
      ?auto_22927 - PLACE
      ?auto_22908 - HOIST
      ?auto_22924 - SURFACE
      ?auto_22914 - SURFACE
      ?auto_22905 - TRUCK
      ?auto_22903 - PLACE
      ?auto_22916 - HOIST
      ?auto_22932 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22921 ?auto_22919 ) ( IS-CRATE ?auto_22901 ) ( not ( = ?auto_22901 ?auto_22902 ) ) ( not ( = ?auto_22923 ?auto_22919 ) ) ( HOIST-AT ?auto_22909 ?auto_22923 ) ( not ( = ?auto_22921 ?auto_22909 ) ) ( AVAILABLE ?auto_22909 ) ( SURFACE-AT ?auto_22901 ?auto_22923 ) ( ON ?auto_22901 ?auto_22926 ) ( CLEAR ?auto_22901 ) ( not ( = ?auto_22901 ?auto_22926 ) ) ( not ( = ?auto_22902 ?auto_22926 ) ) ( IS-CRATE ?auto_22902 ) ( not ( = ?auto_22901 ?auto_22913 ) ) ( not ( = ?auto_22902 ?auto_22913 ) ) ( not ( = ?auto_22926 ?auto_22913 ) ) ( not ( = ?auto_22904 ?auto_22919 ) ) ( not ( = ?auto_22923 ?auto_22904 ) ) ( HOIST-AT ?auto_22912 ?auto_22904 ) ( not ( = ?auto_22921 ?auto_22912 ) ) ( not ( = ?auto_22909 ?auto_22912 ) ) ( AVAILABLE ?auto_22912 ) ( SURFACE-AT ?auto_22902 ?auto_22904 ) ( ON ?auto_22902 ?auto_22925 ) ( CLEAR ?auto_22902 ) ( not ( = ?auto_22901 ?auto_22925 ) ) ( not ( = ?auto_22902 ?auto_22925 ) ) ( not ( = ?auto_22926 ?auto_22925 ) ) ( not ( = ?auto_22913 ?auto_22925 ) ) ( IS-CRATE ?auto_22913 ) ( not ( = ?auto_22901 ?auto_22928 ) ) ( not ( = ?auto_22902 ?auto_22928 ) ) ( not ( = ?auto_22926 ?auto_22928 ) ) ( not ( = ?auto_22913 ?auto_22928 ) ) ( not ( = ?auto_22925 ?auto_22928 ) ) ( not ( = ?auto_22911 ?auto_22919 ) ) ( not ( = ?auto_22923 ?auto_22911 ) ) ( not ( = ?auto_22904 ?auto_22911 ) ) ( HOIST-AT ?auto_22918 ?auto_22911 ) ( not ( = ?auto_22921 ?auto_22918 ) ) ( not ( = ?auto_22909 ?auto_22918 ) ) ( not ( = ?auto_22912 ?auto_22918 ) ) ( AVAILABLE ?auto_22918 ) ( SURFACE-AT ?auto_22913 ?auto_22911 ) ( ON ?auto_22913 ?auto_22906 ) ( CLEAR ?auto_22913 ) ( not ( = ?auto_22901 ?auto_22906 ) ) ( not ( = ?auto_22902 ?auto_22906 ) ) ( not ( = ?auto_22926 ?auto_22906 ) ) ( not ( = ?auto_22913 ?auto_22906 ) ) ( not ( = ?auto_22925 ?auto_22906 ) ) ( not ( = ?auto_22928 ?auto_22906 ) ) ( IS-CRATE ?auto_22928 ) ( not ( = ?auto_22901 ?auto_22922 ) ) ( not ( = ?auto_22902 ?auto_22922 ) ) ( not ( = ?auto_22926 ?auto_22922 ) ) ( not ( = ?auto_22913 ?auto_22922 ) ) ( not ( = ?auto_22925 ?auto_22922 ) ) ( not ( = ?auto_22928 ?auto_22922 ) ) ( not ( = ?auto_22906 ?auto_22922 ) ) ( not ( = ?auto_22910 ?auto_22919 ) ) ( not ( = ?auto_22923 ?auto_22910 ) ) ( not ( = ?auto_22904 ?auto_22910 ) ) ( not ( = ?auto_22911 ?auto_22910 ) ) ( HOIST-AT ?auto_22929 ?auto_22910 ) ( not ( = ?auto_22921 ?auto_22929 ) ) ( not ( = ?auto_22909 ?auto_22929 ) ) ( not ( = ?auto_22912 ?auto_22929 ) ) ( not ( = ?auto_22918 ?auto_22929 ) ) ( AVAILABLE ?auto_22929 ) ( SURFACE-AT ?auto_22928 ?auto_22910 ) ( ON ?auto_22928 ?auto_22920 ) ( CLEAR ?auto_22928 ) ( not ( = ?auto_22901 ?auto_22920 ) ) ( not ( = ?auto_22902 ?auto_22920 ) ) ( not ( = ?auto_22926 ?auto_22920 ) ) ( not ( = ?auto_22913 ?auto_22920 ) ) ( not ( = ?auto_22925 ?auto_22920 ) ) ( not ( = ?auto_22928 ?auto_22920 ) ) ( not ( = ?auto_22906 ?auto_22920 ) ) ( not ( = ?auto_22922 ?auto_22920 ) ) ( IS-CRATE ?auto_22922 ) ( not ( = ?auto_22901 ?auto_22917 ) ) ( not ( = ?auto_22902 ?auto_22917 ) ) ( not ( = ?auto_22926 ?auto_22917 ) ) ( not ( = ?auto_22913 ?auto_22917 ) ) ( not ( = ?auto_22925 ?auto_22917 ) ) ( not ( = ?auto_22928 ?auto_22917 ) ) ( not ( = ?auto_22906 ?auto_22917 ) ) ( not ( = ?auto_22922 ?auto_22917 ) ) ( not ( = ?auto_22920 ?auto_22917 ) ) ( not ( = ?auto_22915 ?auto_22919 ) ) ( not ( = ?auto_22923 ?auto_22915 ) ) ( not ( = ?auto_22904 ?auto_22915 ) ) ( not ( = ?auto_22911 ?auto_22915 ) ) ( not ( = ?auto_22910 ?auto_22915 ) ) ( HOIST-AT ?auto_22931 ?auto_22915 ) ( not ( = ?auto_22921 ?auto_22931 ) ) ( not ( = ?auto_22909 ?auto_22931 ) ) ( not ( = ?auto_22912 ?auto_22931 ) ) ( not ( = ?auto_22918 ?auto_22931 ) ) ( not ( = ?auto_22929 ?auto_22931 ) ) ( AVAILABLE ?auto_22931 ) ( SURFACE-AT ?auto_22922 ?auto_22915 ) ( ON ?auto_22922 ?auto_22930 ) ( CLEAR ?auto_22922 ) ( not ( = ?auto_22901 ?auto_22930 ) ) ( not ( = ?auto_22902 ?auto_22930 ) ) ( not ( = ?auto_22926 ?auto_22930 ) ) ( not ( = ?auto_22913 ?auto_22930 ) ) ( not ( = ?auto_22925 ?auto_22930 ) ) ( not ( = ?auto_22928 ?auto_22930 ) ) ( not ( = ?auto_22906 ?auto_22930 ) ) ( not ( = ?auto_22922 ?auto_22930 ) ) ( not ( = ?auto_22920 ?auto_22930 ) ) ( not ( = ?auto_22917 ?auto_22930 ) ) ( IS-CRATE ?auto_22917 ) ( not ( = ?auto_22901 ?auto_22907 ) ) ( not ( = ?auto_22902 ?auto_22907 ) ) ( not ( = ?auto_22926 ?auto_22907 ) ) ( not ( = ?auto_22913 ?auto_22907 ) ) ( not ( = ?auto_22925 ?auto_22907 ) ) ( not ( = ?auto_22928 ?auto_22907 ) ) ( not ( = ?auto_22906 ?auto_22907 ) ) ( not ( = ?auto_22922 ?auto_22907 ) ) ( not ( = ?auto_22920 ?auto_22907 ) ) ( not ( = ?auto_22917 ?auto_22907 ) ) ( not ( = ?auto_22930 ?auto_22907 ) ) ( not ( = ?auto_22927 ?auto_22919 ) ) ( not ( = ?auto_22923 ?auto_22927 ) ) ( not ( = ?auto_22904 ?auto_22927 ) ) ( not ( = ?auto_22911 ?auto_22927 ) ) ( not ( = ?auto_22910 ?auto_22927 ) ) ( not ( = ?auto_22915 ?auto_22927 ) ) ( HOIST-AT ?auto_22908 ?auto_22927 ) ( not ( = ?auto_22921 ?auto_22908 ) ) ( not ( = ?auto_22909 ?auto_22908 ) ) ( not ( = ?auto_22912 ?auto_22908 ) ) ( not ( = ?auto_22918 ?auto_22908 ) ) ( not ( = ?auto_22929 ?auto_22908 ) ) ( not ( = ?auto_22931 ?auto_22908 ) ) ( AVAILABLE ?auto_22908 ) ( SURFACE-AT ?auto_22917 ?auto_22927 ) ( ON ?auto_22917 ?auto_22924 ) ( CLEAR ?auto_22917 ) ( not ( = ?auto_22901 ?auto_22924 ) ) ( not ( = ?auto_22902 ?auto_22924 ) ) ( not ( = ?auto_22926 ?auto_22924 ) ) ( not ( = ?auto_22913 ?auto_22924 ) ) ( not ( = ?auto_22925 ?auto_22924 ) ) ( not ( = ?auto_22928 ?auto_22924 ) ) ( not ( = ?auto_22906 ?auto_22924 ) ) ( not ( = ?auto_22922 ?auto_22924 ) ) ( not ( = ?auto_22920 ?auto_22924 ) ) ( not ( = ?auto_22917 ?auto_22924 ) ) ( not ( = ?auto_22930 ?auto_22924 ) ) ( not ( = ?auto_22907 ?auto_22924 ) ) ( SURFACE-AT ?auto_22914 ?auto_22919 ) ( CLEAR ?auto_22914 ) ( IS-CRATE ?auto_22907 ) ( not ( = ?auto_22901 ?auto_22914 ) ) ( not ( = ?auto_22902 ?auto_22914 ) ) ( not ( = ?auto_22926 ?auto_22914 ) ) ( not ( = ?auto_22913 ?auto_22914 ) ) ( not ( = ?auto_22925 ?auto_22914 ) ) ( not ( = ?auto_22928 ?auto_22914 ) ) ( not ( = ?auto_22906 ?auto_22914 ) ) ( not ( = ?auto_22922 ?auto_22914 ) ) ( not ( = ?auto_22920 ?auto_22914 ) ) ( not ( = ?auto_22917 ?auto_22914 ) ) ( not ( = ?auto_22930 ?auto_22914 ) ) ( not ( = ?auto_22907 ?auto_22914 ) ) ( not ( = ?auto_22924 ?auto_22914 ) ) ( AVAILABLE ?auto_22921 ) ( TRUCK-AT ?auto_22905 ?auto_22903 ) ( not ( = ?auto_22903 ?auto_22919 ) ) ( not ( = ?auto_22923 ?auto_22903 ) ) ( not ( = ?auto_22904 ?auto_22903 ) ) ( not ( = ?auto_22911 ?auto_22903 ) ) ( not ( = ?auto_22910 ?auto_22903 ) ) ( not ( = ?auto_22915 ?auto_22903 ) ) ( not ( = ?auto_22927 ?auto_22903 ) ) ( HOIST-AT ?auto_22916 ?auto_22903 ) ( not ( = ?auto_22921 ?auto_22916 ) ) ( not ( = ?auto_22909 ?auto_22916 ) ) ( not ( = ?auto_22912 ?auto_22916 ) ) ( not ( = ?auto_22918 ?auto_22916 ) ) ( not ( = ?auto_22929 ?auto_22916 ) ) ( not ( = ?auto_22931 ?auto_22916 ) ) ( not ( = ?auto_22908 ?auto_22916 ) ) ( AVAILABLE ?auto_22916 ) ( SURFACE-AT ?auto_22907 ?auto_22903 ) ( ON ?auto_22907 ?auto_22932 ) ( CLEAR ?auto_22907 ) ( not ( = ?auto_22901 ?auto_22932 ) ) ( not ( = ?auto_22902 ?auto_22932 ) ) ( not ( = ?auto_22926 ?auto_22932 ) ) ( not ( = ?auto_22913 ?auto_22932 ) ) ( not ( = ?auto_22925 ?auto_22932 ) ) ( not ( = ?auto_22928 ?auto_22932 ) ) ( not ( = ?auto_22906 ?auto_22932 ) ) ( not ( = ?auto_22922 ?auto_22932 ) ) ( not ( = ?auto_22920 ?auto_22932 ) ) ( not ( = ?auto_22917 ?auto_22932 ) ) ( not ( = ?auto_22930 ?auto_22932 ) ) ( not ( = ?auto_22907 ?auto_22932 ) ) ( not ( = ?auto_22924 ?auto_22932 ) ) ( not ( = ?auto_22914 ?auto_22932 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22916 ?auto_22907 ?auto_22932 ?auto_22903 )
      ( MAKE-ON ?auto_22901 ?auto_22902 )
      ( MAKE-ON-VERIFY ?auto_22901 ?auto_22902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22933 - SURFACE
      ?auto_22934 - SURFACE
    )
    :vars
    (
      ?auto_22946 - HOIST
      ?auto_22944 - PLACE
      ?auto_22954 - PLACE
      ?auto_22958 - HOIST
      ?auto_22943 - SURFACE
      ?auto_22937 - SURFACE
      ?auto_22947 - PLACE
      ?auto_22960 - HOIST
      ?auto_22956 - SURFACE
      ?auto_22935 - SURFACE
      ?auto_22950 - PLACE
      ?auto_22957 - HOIST
      ?auto_22962 - SURFACE
      ?auto_22953 - SURFACE
      ?auto_22963 - PLACE
      ?auto_22941 - HOIST
      ?auto_22945 - SURFACE
      ?auto_22938 - SURFACE
      ?auto_22961 - PLACE
      ?auto_22942 - HOIST
      ?auto_22940 - SURFACE
      ?auto_22949 - SURFACE
      ?auto_22936 - PLACE
      ?auto_22964 - HOIST
      ?auto_22955 - SURFACE
      ?auto_22939 - SURFACE
      ?auto_22951 - PLACE
      ?auto_22948 - HOIST
      ?auto_22952 - SURFACE
      ?auto_22959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22946 ?auto_22944 ) ( IS-CRATE ?auto_22933 ) ( not ( = ?auto_22933 ?auto_22934 ) ) ( not ( = ?auto_22954 ?auto_22944 ) ) ( HOIST-AT ?auto_22958 ?auto_22954 ) ( not ( = ?auto_22946 ?auto_22958 ) ) ( AVAILABLE ?auto_22958 ) ( SURFACE-AT ?auto_22933 ?auto_22954 ) ( ON ?auto_22933 ?auto_22943 ) ( CLEAR ?auto_22933 ) ( not ( = ?auto_22933 ?auto_22943 ) ) ( not ( = ?auto_22934 ?auto_22943 ) ) ( IS-CRATE ?auto_22934 ) ( not ( = ?auto_22933 ?auto_22937 ) ) ( not ( = ?auto_22934 ?auto_22937 ) ) ( not ( = ?auto_22943 ?auto_22937 ) ) ( not ( = ?auto_22947 ?auto_22944 ) ) ( not ( = ?auto_22954 ?auto_22947 ) ) ( HOIST-AT ?auto_22960 ?auto_22947 ) ( not ( = ?auto_22946 ?auto_22960 ) ) ( not ( = ?auto_22958 ?auto_22960 ) ) ( AVAILABLE ?auto_22960 ) ( SURFACE-AT ?auto_22934 ?auto_22947 ) ( ON ?auto_22934 ?auto_22956 ) ( CLEAR ?auto_22934 ) ( not ( = ?auto_22933 ?auto_22956 ) ) ( not ( = ?auto_22934 ?auto_22956 ) ) ( not ( = ?auto_22943 ?auto_22956 ) ) ( not ( = ?auto_22937 ?auto_22956 ) ) ( IS-CRATE ?auto_22937 ) ( not ( = ?auto_22933 ?auto_22935 ) ) ( not ( = ?auto_22934 ?auto_22935 ) ) ( not ( = ?auto_22943 ?auto_22935 ) ) ( not ( = ?auto_22937 ?auto_22935 ) ) ( not ( = ?auto_22956 ?auto_22935 ) ) ( not ( = ?auto_22950 ?auto_22944 ) ) ( not ( = ?auto_22954 ?auto_22950 ) ) ( not ( = ?auto_22947 ?auto_22950 ) ) ( HOIST-AT ?auto_22957 ?auto_22950 ) ( not ( = ?auto_22946 ?auto_22957 ) ) ( not ( = ?auto_22958 ?auto_22957 ) ) ( not ( = ?auto_22960 ?auto_22957 ) ) ( AVAILABLE ?auto_22957 ) ( SURFACE-AT ?auto_22937 ?auto_22950 ) ( ON ?auto_22937 ?auto_22962 ) ( CLEAR ?auto_22937 ) ( not ( = ?auto_22933 ?auto_22962 ) ) ( not ( = ?auto_22934 ?auto_22962 ) ) ( not ( = ?auto_22943 ?auto_22962 ) ) ( not ( = ?auto_22937 ?auto_22962 ) ) ( not ( = ?auto_22956 ?auto_22962 ) ) ( not ( = ?auto_22935 ?auto_22962 ) ) ( IS-CRATE ?auto_22935 ) ( not ( = ?auto_22933 ?auto_22953 ) ) ( not ( = ?auto_22934 ?auto_22953 ) ) ( not ( = ?auto_22943 ?auto_22953 ) ) ( not ( = ?auto_22937 ?auto_22953 ) ) ( not ( = ?auto_22956 ?auto_22953 ) ) ( not ( = ?auto_22935 ?auto_22953 ) ) ( not ( = ?auto_22962 ?auto_22953 ) ) ( not ( = ?auto_22963 ?auto_22944 ) ) ( not ( = ?auto_22954 ?auto_22963 ) ) ( not ( = ?auto_22947 ?auto_22963 ) ) ( not ( = ?auto_22950 ?auto_22963 ) ) ( HOIST-AT ?auto_22941 ?auto_22963 ) ( not ( = ?auto_22946 ?auto_22941 ) ) ( not ( = ?auto_22958 ?auto_22941 ) ) ( not ( = ?auto_22960 ?auto_22941 ) ) ( not ( = ?auto_22957 ?auto_22941 ) ) ( AVAILABLE ?auto_22941 ) ( SURFACE-AT ?auto_22935 ?auto_22963 ) ( ON ?auto_22935 ?auto_22945 ) ( CLEAR ?auto_22935 ) ( not ( = ?auto_22933 ?auto_22945 ) ) ( not ( = ?auto_22934 ?auto_22945 ) ) ( not ( = ?auto_22943 ?auto_22945 ) ) ( not ( = ?auto_22937 ?auto_22945 ) ) ( not ( = ?auto_22956 ?auto_22945 ) ) ( not ( = ?auto_22935 ?auto_22945 ) ) ( not ( = ?auto_22962 ?auto_22945 ) ) ( not ( = ?auto_22953 ?auto_22945 ) ) ( IS-CRATE ?auto_22953 ) ( not ( = ?auto_22933 ?auto_22938 ) ) ( not ( = ?auto_22934 ?auto_22938 ) ) ( not ( = ?auto_22943 ?auto_22938 ) ) ( not ( = ?auto_22937 ?auto_22938 ) ) ( not ( = ?auto_22956 ?auto_22938 ) ) ( not ( = ?auto_22935 ?auto_22938 ) ) ( not ( = ?auto_22962 ?auto_22938 ) ) ( not ( = ?auto_22953 ?auto_22938 ) ) ( not ( = ?auto_22945 ?auto_22938 ) ) ( not ( = ?auto_22961 ?auto_22944 ) ) ( not ( = ?auto_22954 ?auto_22961 ) ) ( not ( = ?auto_22947 ?auto_22961 ) ) ( not ( = ?auto_22950 ?auto_22961 ) ) ( not ( = ?auto_22963 ?auto_22961 ) ) ( HOIST-AT ?auto_22942 ?auto_22961 ) ( not ( = ?auto_22946 ?auto_22942 ) ) ( not ( = ?auto_22958 ?auto_22942 ) ) ( not ( = ?auto_22960 ?auto_22942 ) ) ( not ( = ?auto_22957 ?auto_22942 ) ) ( not ( = ?auto_22941 ?auto_22942 ) ) ( AVAILABLE ?auto_22942 ) ( SURFACE-AT ?auto_22953 ?auto_22961 ) ( ON ?auto_22953 ?auto_22940 ) ( CLEAR ?auto_22953 ) ( not ( = ?auto_22933 ?auto_22940 ) ) ( not ( = ?auto_22934 ?auto_22940 ) ) ( not ( = ?auto_22943 ?auto_22940 ) ) ( not ( = ?auto_22937 ?auto_22940 ) ) ( not ( = ?auto_22956 ?auto_22940 ) ) ( not ( = ?auto_22935 ?auto_22940 ) ) ( not ( = ?auto_22962 ?auto_22940 ) ) ( not ( = ?auto_22953 ?auto_22940 ) ) ( not ( = ?auto_22945 ?auto_22940 ) ) ( not ( = ?auto_22938 ?auto_22940 ) ) ( IS-CRATE ?auto_22938 ) ( not ( = ?auto_22933 ?auto_22949 ) ) ( not ( = ?auto_22934 ?auto_22949 ) ) ( not ( = ?auto_22943 ?auto_22949 ) ) ( not ( = ?auto_22937 ?auto_22949 ) ) ( not ( = ?auto_22956 ?auto_22949 ) ) ( not ( = ?auto_22935 ?auto_22949 ) ) ( not ( = ?auto_22962 ?auto_22949 ) ) ( not ( = ?auto_22953 ?auto_22949 ) ) ( not ( = ?auto_22945 ?auto_22949 ) ) ( not ( = ?auto_22938 ?auto_22949 ) ) ( not ( = ?auto_22940 ?auto_22949 ) ) ( not ( = ?auto_22936 ?auto_22944 ) ) ( not ( = ?auto_22954 ?auto_22936 ) ) ( not ( = ?auto_22947 ?auto_22936 ) ) ( not ( = ?auto_22950 ?auto_22936 ) ) ( not ( = ?auto_22963 ?auto_22936 ) ) ( not ( = ?auto_22961 ?auto_22936 ) ) ( HOIST-AT ?auto_22964 ?auto_22936 ) ( not ( = ?auto_22946 ?auto_22964 ) ) ( not ( = ?auto_22958 ?auto_22964 ) ) ( not ( = ?auto_22960 ?auto_22964 ) ) ( not ( = ?auto_22957 ?auto_22964 ) ) ( not ( = ?auto_22941 ?auto_22964 ) ) ( not ( = ?auto_22942 ?auto_22964 ) ) ( AVAILABLE ?auto_22964 ) ( SURFACE-AT ?auto_22938 ?auto_22936 ) ( ON ?auto_22938 ?auto_22955 ) ( CLEAR ?auto_22938 ) ( not ( = ?auto_22933 ?auto_22955 ) ) ( not ( = ?auto_22934 ?auto_22955 ) ) ( not ( = ?auto_22943 ?auto_22955 ) ) ( not ( = ?auto_22937 ?auto_22955 ) ) ( not ( = ?auto_22956 ?auto_22955 ) ) ( not ( = ?auto_22935 ?auto_22955 ) ) ( not ( = ?auto_22962 ?auto_22955 ) ) ( not ( = ?auto_22953 ?auto_22955 ) ) ( not ( = ?auto_22945 ?auto_22955 ) ) ( not ( = ?auto_22938 ?auto_22955 ) ) ( not ( = ?auto_22940 ?auto_22955 ) ) ( not ( = ?auto_22949 ?auto_22955 ) ) ( SURFACE-AT ?auto_22939 ?auto_22944 ) ( CLEAR ?auto_22939 ) ( IS-CRATE ?auto_22949 ) ( not ( = ?auto_22933 ?auto_22939 ) ) ( not ( = ?auto_22934 ?auto_22939 ) ) ( not ( = ?auto_22943 ?auto_22939 ) ) ( not ( = ?auto_22937 ?auto_22939 ) ) ( not ( = ?auto_22956 ?auto_22939 ) ) ( not ( = ?auto_22935 ?auto_22939 ) ) ( not ( = ?auto_22962 ?auto_22939 ) ) ( not ( = ?auto_22953 ?auto_22939 ) ) ( not ( = ?auto_22945 ?auto_22939 ) ) ( not ( = ?auto_22938 ?auto_22939 ) ) ( not ( = ?auto_22940 ?auto_22939 ) ) ( not ( = ?auto_22949 ?auto_22939 ) ) ( not ( = ?auto_22955 ?auto_22939 ) ) ( AVAILABLE ?auto_22946 ) ( not ( = ?auto_22951 ?auto_22944 ) ) ( not ( = ?auto_22954 ?auto_22951 ) ) ( not ( = ?auto_22947 ?auto_22951 ) ) ( not ( = ?auto_22950 ?auto_22951 ) ) ( not ( = ?auto_22963 ?auto_22951 ) ) ( not ( = ?auto_22961 ?auto_22951 ) ) ( not ( = ?auto_22936 ?auto_22951 ) ) ( HOIST-AT ?auto_22948 ?auto_22951 ) ( not ( = ?auto_22946 ?auto_22948 ) ) ( not ( = ?auto_22958 ?auto_22948 ) ) ( not ( = ?auto_22960 ?auto_22948 ) ) ( not ( = ?auto_22957 ?auto_22948 ) ) ( not ( = ?auto_22941 ?auto_22948 ) ) ( not ( = ?auto_22942 ?auto_22948 ) ) ( not ( = ?auto_22964 ?auto_22948 ) ) ( AVAILABLE ?auto_22948 ) ( SURFACE-AT ?auto_22949 ?auto_22951 ) ( ON ?auto_22949 ?auto_22952 ) ( CLEAR ?auto_22949 ) ( not ( = ?auto_22933 ?auto_22952 ) ) ( not ( = ?auto_22934 ?auto_22952 ) ) ( not ( = ?auto_22943 ?auto_22952 ) ) ( not ( = ?auto_22937 ?auto_22952 ) ) ( not ( = ?auto_22956 ?auto_22952 ) ) ( not ( = ?auto_22935 ?auto_22952 ) ) ( not ( = ?auto_22962 ?auto_22952 ) ) ( not ( = ?auto_22953 ?auto_22952 ) ) ( not ( = ?auto_22945 ?auto_22952 ) ) ( not ( = ?auto_22938 ?auto_22952 ) ) ( not ( = ?auto_22940 ?auto_22952 ) ) ( not ( = ?auto_22949 ?auto_22952 ) ) ( not ( = ?auto_22955 ?auto_22952 ) ) ( not ( = ?auto_22939 ?auto_22952 ) ) ( TRUCK-AT ?auto_22959 ?auto_22944 ) )
    :subtasks
    ( ( !DRIVE ?auto_22959 ?auto_22944 ?auto_22951 )
      ( MAKE-ON ?auto_22933 ?auto_22934 )
      ( MAKE-ON-VERIFY ?auto_22933 ?auto_22934 ) )
  )

)

