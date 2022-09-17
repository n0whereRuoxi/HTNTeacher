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
      ?auto_23533 - SURFACE
      ?auto_23534 - SURFACE
    )
    :vars
    (
      ?auto_23535 - HOIST
      ?auto_23536 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23535 ?auto_23536 ) ( SURFACE-AT ?auto_23534 ?auto_23536 ) ( CLEAR ?auto_23534 ) ( LIFTING ?auto_23535 ?auto_23533 ) ( IS-CRATE ?auto_23533 ) ( not ( = ?auto_23533 ?auto_23534 ) ) )
    :subtasks
    ( ( !DROP ?auto_23535 ?auto_23533 ?auto_23534 ?auto_23536 )
      ( MAKE-ON-VERIFY ?auto_23533 ?auto_23534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23537 - SURFACE
      ?auto_23538 - SURFACE
    )
    :vars
    (
      ?auto_23539 - HOIST
      ?auto_23540 - PLACE
      ?auto_23541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23539 ?auto_23540 ) ( SURFACE-AT ?auto_23538 ?auto_23540 ) ( CLEAR ?auto_23538 ) ( IS-CRATE ?auto_23537 ) ( not ( = ?auto_23537 ?auto_23538 ) ) ( TRUCK-AT ?auto_23541 ?auto_23540 ) ( AVAILABLE ?auto_23539 ) ( IN ?auto_23537 ?auto_23541 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23539 ?auto_23537 ?auto_23541 ?auto_23540 )
      ( MAKE-ON ?auto_23537 ?auto_23538 )
      ( MAKE-ON-VERIFY ?auto_23537 ?auto_23538 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23542 - SURFACE
      ?auto_23543 - SURFACE
    )
    :vars
    (
      ?auto_23545 - HOIST
      ?auto_23544 - PLACE
      ?auto_23546 - TRUCK
      ?auto_23547 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23545 ?auto_23544 ) ( SURFACE-AT ?auto_23543 ?auto_23544 ) ( CLEAR ?auto_23543 ) ( IS-CRATE ?auto_23542 ) ( not ( = ?auto_23542 ?auto_23543 ) ) ( AVAILABLE ?auto_23545 ) ( IN ?auto_23542 ?auto_23546 ) ( TRUCK-AT ?auto_23546 ?auto_23547 ) ( not ( = ?auto_23547 ?auto_23544 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23546 ?auto_23547 ?auto_23544 )
      ( MAKE-ON ?auto_23542 ?auto_23543 )
      ( MAKE-ON-VERIFY ?auto_23542 ?auto_23543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23548 - SURFACE
      ?auto_23549 - SURFACE
    )
    :vars
    (
      ?auto_23552 - HOIST
      ?auto_23553 - PLACE
      ?auto_23551 - TRUCK
      ?auto_23550 - PLACE
      ?auto_23554 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23552 ?auto_23553 ) ( SURFACE-AT ?auto_23549 ?auto_23553 ) ( CLEAR ?auto_23549 ) ( IS-CRATE ?auto_23548 ) ( not ( = ?auto_23548 ?auto_23549 ) ) ( AVAILABLE ?auto_23552 ) ( TRUCK-AT ?auto_23551 ?auto_23550 ) ( not ( = ?auto_23550 ?auto_23553 ) ) ( HOIST-AT ?auto_23554 ?auto_23550 ) ( LIFTING ?auto_23554 ?auto_23548 ) ( not ( = ?auto_23552 ?auto_23554 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23554 ?auto_23548 ?auto_23551 ?auto_23550 )
      ( MAKE-ON ?auto_23548 ?auto_23549 )
      ( MAKE-ON-VERIFY ?auto_23548 ?auto_23549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23555 - SURFACE
      ?auto_23556 - SURFACE
    )
    :vars
    (
      ?auto_23561 - HOIST
      ?auto_23558 - PLACE
      ?auto_23559 - TRUCK
      ?auto_23560 - PLACE
      ?auto_23557 - HOIST
      ?auto_23562 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23561 ?auto_23558 ) ( SURFACE-AT ?auto_23556 ?auto_23558 ) ( CLEAR ?auto_23556 ) ( IS-CRATE ?auto_23555 ) ( not ( = ?auto_23555 ?auto_23556 ) ) ( AVAILABLE ?auto_23561 ) ( TRUCK-AT ?auto_23559 ?auto_23560 ) ( not ( = ?auto_23560 ?auto_23558 ) ) ( HOIST-AT ?auto_23557 ?auto_23560 ) ( not ( = ?auto_23561 ?auto_23557 ) ) ( AVAILABLE ?auto_23557 ) ( SURFACE-AT ?auto_23555 ?auto_23560 ) ( ON ?auto_23555 ?auto_23562 ) ( CLEAR ?auto_23555 ) ( not ( = ?auto_23555 ?auto_23562 ) ) ( not ( = ?auto_23556 ?auto_23562 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23557 ?auto_23555 ?auto_23562 ?auto_23560 )
      ( MAKE-ON ?auto_23555 ?auto_23556 )
      ( MAKE-ON-VERIFY ?auto_23555 ?auto_23556 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23563 - SURFACE
      ?auto_23564 - SURFACE
    )
    :vars
    (
      ?auto_23566 - HOIST
      ?auto_23568 - PLACE
      ?auto_23569 - PLACE
      ?auto_23570 - HOIST
      ?auto_23567 - SURFACE
      ?auto_23565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23566 ?auto_23568 ) ( SURFACE-AT ?auto_23564 ?auto_23568 ) ( CLEAR ?auto_23564 ) ( IS-CRATE ?auto_23563 ) ( not ( = ?auto_23563 ?auto_23564 ) ) ( AVAILABLE ?auto_23566 ) ( not ( = ?auto_23569 ?auto_23568 ) ) ( HOIST-AT ?auto_23570 ?auto_23569 ) ( not ( = ?auto_23566 ?auto_23570 ) ) ( AVAILABLE ?auto_23570 ) ( SURFACE-AT ?auto_23563 ?auto_23569 ) ( ON ?auto_23563 ?auto_23567 ) ( CLEAR ?auto_23563 ) ( not ( = ?auto_23563 ?auto_23567 ) ) ( not ( = ?auto_23564 ?auto_23567 ) ) ( TRUCK-AT ?auto_23565 ?auto_23568 ) )
    :subtasks
    ( ( !DRIVE ?auto_23565 ?auto_23568 ?auto_23569 )
      ( MAKE-ON ?auto_23563 ?auto_23564 )
      ( MAKE-ON-VERIFY ?auto_23563 ?auto_23564 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23611 - SURFACE
      ?auto_23612 - SURFACE
    )
    :vars
    (
      ?auto_23615 - HOIST
      ?auto_23617 - PLACE
      ?auto_23613 - PLACE
      ?auto_23618 - HOIST
      ?auto_23616 - SURFACE
      ?auto_23614 - TRUCK
      ?auto_23619 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23615 ?auto_23617 ) ( IS-CRATE ?auto_23611 ) ( not ( = ?auto_23611 ?auto_23612 ) ) ( not ( = ?auto_23613 ?auto_23617 ) ) ( HOIST-AT ?auto_23618 ?auto_23613 ) ( not ( = ?auto_23615 ?auto_23618 ) ) ( AVAILABLE ?auto_23618 ) ( SURFACE-AT ?auto_23611 ?auto_23613 ) ( ON ?auto_23611 ?auto_23616 ) ( CLEAR ?auto_23611 ) ( not ( = ?auto_23611 ?auto_23616 ) ) ( not ( = ?auto_23612 ?auto_23616 ) ) ( TRUCK-AT ?auto_23614 ?auto_23617 ) ( SURFACE-AT ?auto_23619 ?auto_23617 ) ( CLEAR ?auto_23619 ) ( LIFTING ?auto_23615 ?auto_23612 ) ( IS-CRATE ?auto_23612 ) ( not ( = ?auto_23611 ?auto_23619 ) ) ( not ( = ?auto_23612 ?auto_23619 ) ) ( not ( = ?auto_23616 ?auto_23619 ) ) )
    :subtasks
    ( ( !DROP ?auto_23615 ?auto_23612 ?auto_23619 ?auto_23617 )
      ( MAKE-ON ?auto_23611 ?auto_23612 )
      ( MAKE-ON-VERIFY ?auto_23611 ?auto_23612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23620 - SURFACE
      ?auto_23621 - SURFACE
    )
    :vars
    (
      ?auto_23626 - HOIST
      ?auto_23623 - PLACE
      ?auto_23628 - PLACE
      ?auto_23625 - HOIST
      ?auto_23624 - SURFACE
      ?auto_23627 - TRUCK
      ?auto_23622 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23626 ?auto_23623 ) ( IS-CRATE ?auto_23620 ) ( not ( = ?auto_23620 ?auto_23621 ) ) ( not ( = ?auto_23628 ?auto_23623 ) ) ( HOIST-AT ?auto_23625 ?auto_23628 ) ( not ( = ?auto_23626 ?auto_23625 ) ) ( AVAILABLE ?auto_23625 ) ( SURFACE-AT ?auto_23620 ?auto_23628 ) ( ON ?auto_23620 ?auto_23624 ) ( CLEAR ?auto_23620 ) ( not ( = ?auto_23620 ?auto_23624 ) ) ( not ( = ?auto_23621 ?auto_23624 ) ) ( TRUCK-AT ?auto_23627 ?auto_23623 ) ( SURFACE-AT ?auto_23622 ?auto_23623 ) ( CLEAR ?auto_23622 ) ( IS-CRATE ?auto_23621 ) ( not ( = ?auto_23620 ?auto_23622 ) ) ( not ( = ?auto_23621 ?auto_23622 ) ) ( not ( = ?auto_23624 ?auto_23622 ) ) ( AVAILABLE ?auto_23626 ) ( IN ?auto_23621 ?auto_23627 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23626 ?auto_23621 ?auto_23627 ?auto_23623 )
      ( MAKE-ON ?auto_23620 ?auto_23621 )
      ( MAKE-ON-VERIFY ?auto_23620 ?auto_23621 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23629 - SURFACE
      ?auto_23630 - SURFACE
    )
    :vars
    (
      ?auto_23636 - HOIST
      ?auto_23635 - PLACE
      ?auto_23632 - PLACE
      ?auto_23631 - HOIST
      ?auto_23637 - SURFACE
      ?auto_23633 - SURFACE
      ?auto_23634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23636 ?auto_23635 ) ( IS-CRATE ?auto_23629 ) ( not ( = ?auto_23629 ?auto_23630 ) ) ( not ( = ?auto_23632 ?auto_23635 ) ) ( HOIST-AT ?auto_23631 ?auto_23632 ) ( not ( = ?auto_23636 ?auto_23631 ) ) ( AVAILABLE ?auto_23631 ) ( SURFACE-AT ?auto_23629 ?auto_23632 ) ( ON ?auto_23629 ?auto_23637 ) ( CLEAR ?auto_23629 ) ( not ( = ?auto_23629 ?auto_23637 ) ) ( not ( = ?auto_23630 ?auto_23637 ) ) ( SURFACE-AT ?auto_23633 ?auto_23635 ) ( CLEAR ?auto_23633 ) ( IS-CRATE ?auto_23630 ) ( not ( = ?auto_23629 ?auto_23633 ) ) ( not ( = ?auto_23630 ?auto_23633 ) ) ( not ( = ?auto_23637 ?auto_23633 ) ) ( AVAILABLE ?auto_23636 ) ( IN ?auto_23630 ?auto_23634 ) ( TRUCK-AT ?auto_23634 ?auto_23632 ) )
    :subtasks
    ( ( !DRIVE ?auto_23634 ?auto_23632 ?auto_23635 )
      ( MAKE-ON ?auto_23629 ?auto_23630 )
      ( MAKE-ON-VERIFY ?auto_23629 ?auto_23630 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23638 - SURFACE
      ?auto_23639 - SURFACE
    )
    :vars
    (
      ?auto_23640 - HOIST
      ?auto_23643 - PLACE
      ?auto_23641 - PLACE
      ?auto_23646 - HOIST
      ?auto_23642 - SURFACE
      ?auto_23645 - SURFACE
      ?auto_23644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23640 ?auto_23643 ) ( IS-CRATE ?auto_23638 ) ( not ( = ?auto_23638 ?auto_23639 ) ) ( not ( = ?auto_23641 ?auto_23643 ) ) ( HOIST-AT ?auto_23646 ?auto_23641 ) ( not ( = ?auto_23640 ?auto_23646 ) ) ( SURFACE-AT ?auto_23638 ?auto_23641 ) ( ON ?auto_23638 ?auto_23642 ) ( CLEAR ?auto_23638 ) ( not ( = ?auto_23638 ?auto_23642 ) ) ( not ( = ?auto_23639 ?auto_23642 ) ) ( SURFACE-AT ?auto_23645 ?auto_23643 ) ( CLEAR ?auto_23645 ) ( IS-CRATE ?auto_23639 ) ( not ( = ?auto_23638 ?auto_23645 ) ) ( not ( = ?auto_23639 ?auto_23645 ) ) ( not ( = ?auto_23642 ?auto_23645 ) ) ( AVAILABLE ?auto_23640 ) ( TRUCK-AT ?auto_23644 ?auto_23641 ) ( LIFTING ?auto_23646 ?auto_23639 ) )
    :subtasks
    ( ( !LOAD ?auto_23646 ?auto_23639 ?auto_23644 ?auto_23641 )
      ( MAKE-ON ?auto_23638 ?auto_23639 )
      ( MAKE-ON-VERIFY ?auto_23638 ?auto_23639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23647 - SURFACE
      ?auto_23648 - SURFACE
    )
    :vars
    (
      ?auto_23654 - HOIST
      ?auto_23651 - PLACE
      ?auto_23649 - PLACE
      ?auto_23650 - HOIST
      ?auto_23653 - SURFACE
      ?auto_23655 - SURFACE
      ?auto_23652 - TRUCK
      ?auto_23656 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23654 ?auto_23651 ) ( IS-CRATE ?auto_23647 ) ( not ( = ?auto_23647 ?auto_23648 ) ) ( not ( = ?auto_23649 ?auto_23651 ) ) ( HOIST-AT ?auto_23650 ?auto_23649 ) ( not ( = ?auto_23654 ?auto_23650 ) ) ( SURFACE-AT ?auto_23647 ?auto_23649 ) ( ON ?auto_23647 ?auto_23653 ) ( CLEAR ?auto_23647 ) ( not ( = ?auto_23647 ?auto_23653 ) ) ( not ( = ?auto_23648 ?auto_23653 ) ) ( SURFACE-AT ?auto_23655 ?auto_23651 ) ( CLEAR ?auto_23655 ) ( IS-CRATE ?auto_23648 ) ( not ( = ?auto_23647 ?auto_23655 ) ) ( not ( = ?auto_23648 ?auto_23655 ) ) ( not ( = ?auto_23653 ?auto_23655 ) ) ( AVAILABLE ?auto_23654 ) ( TRUCK-AT ?auto_23652 ?auto_23649 ) ( AVAILABLE ?auto_23650 ) ( SURFACE-AT ?auto_23648 ?auto_23649 ) ( ON ?auto_23648 ?auto_23656 ) ( CLEAR ?auto_23648 ) ( not ( = ?auto_23647 ?auto_23656 ) ) ( not ( = ?auto_23648 ?auto_23656 ) ) ( not ( = ?auto_23653 ?auto_23656 ) ) ( not ( = ?auto_23655 ?auto_23656 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23650 ?auto_23648 ?auto_23656 ?auto_23649 )
      ( MAKE-ON ?auto_23647 ?auto_23648 )
      ( MAKE-ON-VERIFY ?auto_23647 ?auto_23648 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23657 - SURFACE
      ?auto_23658 - SURFACE
    )
    :vars
    (
      ?auto_23663 - HOIST
      ?auto_23665 - PLACE
      ?auto_23662 - PLACE
      ?auto_23666 - HOIST
      ?auto_23659 - SURFACE
      ?auto_23660 - SURFACE
      ?auto_23661 - SURFACE
      ?auto_23664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23663 ?auto_23665 ) ( IS-CRATE ?auto_23657 ) ( not ( = ?auto_23657 ?auto_23658 ) ) ( not ( = ?auto_23662 ?auto_23665 ) ) ( HOIST-AT ?auto_23666 ?auto_23662 ) ( not ( = ?auto_23663 ?auto_23666 ) ) ( SURFACE-AT ?auto_23657 ?auto_23662 ) ( ON ?auto_23657 ?auto_23659 ) ( CLEAR ?auto_23657 ) ( not ( = ?auto_23657 ?auto_23659 ) ) ( not ( = ?auto_23658 ?auto_23659 ) ) ( SURFACE-AT ?auto_23660 ?auto_23665 ) ( CLEAR ?auto_23660 ) ( IS-CRATE ?auto_23658 ) ( not ( = ?auto_23657 ?auto_23660 ) ) ( not ( = ?auto_23658 ?auto_23660 ) ) ( not ( = ?auto_23659 ?auto_23660 ) ) ( AVAILABLE ?auto_23663 ) ( AVAILABLE ?auto_23666 ) ( SURFACE-AT ?auto_23658 ?auto_23662 ) ( ON ?auto_23658 ?auto_23661 ) ( CLEAR ?auto_23658 ) ( not ( = ?auto_23657 ?auto_23661 ) ) ( not ( = ?auto_23658 ?auto_23661 ) ) ( not ( = ?auto_23659 ?auto_23661 ) ) ( not ( = ?auto_23660 ?auto_23661 ) ) ( TRUCK-AT ?auto_23664 ?auto_23665 ) )
    :subtasks
    ( ( !DRIVE ?auto_23664 ?auto_23665 ?auto_23662 )
      ( MAKE-ON ?auto_23657 ?auto_23658 )
      ( MAKE-ON-VERIFY ?auto_23657 ?auto_23658 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23763 - SURFACE
      ?auto_23764 - SURFACE
    )
    :vars
    (
      ?auto_23766 - HOIST
      ?auto_23768 - PLACE
      ?auto_23765 - PLACE
      ?auto_23770 - HOIST
      ?auto_23769 - SURFACE
      ?auto_23772 - SURFACE
      ?auto_23771 - SURFACE
      ?auto_23767 - TRUCK
      ?auto_23773 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23766 ?auto_23768 ) ( IS-CRATE ?auto_23763 ) ( not ( = ?auto_23763 ?auto_23764 ) ) ( not ( = ?auto_23765 ?auto_23768 ) ) ( HOIST-AT ?auto_23770 ?auto_23765 ) ( not ( = ?auto_23766 ?auto_23770 ) ) ( SURFACE-AT ?auto_23763 ?auto_23765 ) ( ON ?auto_23763 ?auto_23769 ) ( CLEAR ?auto_23763 ) ( not ( = ?auto_23763 ?auto_23769 ) ) ( not ( = ?auto_23764 ?auto_23769 ) ) ( IS-CRATE ?auto_23764 ) ( not ( = ?auto_23763 ?auto_23772 ) ) ( not ( = ?auto_23764 ?auto_23772 ) ) ( not ( = ?auto_23769 ?auto_23772 ) ) ( AVAILABLE ?auto_23770 ) ( SURFACE-AT ?auto_23764 ?auto_23765 ) ( ON ?auto_23764 ?auto_23771 ) ( CLEAR ?auto_23764 ) ( not ( = ?auto_23763 ?auto_23771 ) ) ( not ( = ?auto_23764 ?auto_23771 ) ) ( not ( = ?auto_23769 ?auto_23771 ) ) ( not ( = ?auto_23772 ?auto_23771 ) ) ( TRUCK-AT ?auto_23767 ?auto_23768 ) ( SURFACE-AT ?auto_23773 ?auto_23768 ) ( CLEAR ?auto_23773 ) ( LIFTING ?auto_23766 ?auto_23772 ) ( IS-CRATE ?auto_23772 ) ( not ( = ?auto_23763 ?auto_23773 ) ) ( not ( = ?auto_23764 ?auto_23773 ) ) ( not ( = ?auto_23769 ?auto_23773 ) ) ( not ( = ?auto_23772 ?auto_23773 ) ) ( not ( = ?auto_23771 ?auto_23773 ) ) )
    :subtasks
    ( ( !DROP ?auto_23766 ?auto_23772 ?auto_23773 ?auto_23768 )
      ( MAKE-ON ?auto_23763 ?auto_23764 )
      ( MAKE-ON-VERIFY ?auto_23763 ?auto_23764 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23778 - SURFACE
      ?auto_23779 - SURFACE
    )
    :vars
    (
      ?auto_23784 - HOIST
      ?auto_23781 - PLACE
      ?auto_23787 - PLACE
      ?auto_23786 - HOIST
      ?auto_23780 - SURFACE
      ?auto_23785 - SURFACE
      ?auto_23782 - TRUCK
      ?auto_23783 - SURFACE
      ?auto_23788 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23784 ?auto_23781 ) ( IS-CRATE ?auto_23778 ) ( not ( = ?auto_23778 ?auto_23779 ) ) ( not ( = ?auto_23787 ?auto_23781 ) ) ( HOIST-AT ?auto_23786 ?auto_23787 ) ( not ( = ?auto_23784 ?auto_23786 ) ) ( SURFACE-AT ?auto_23778 ?auto_23787 ) ( ON ?auto_23778 ?auto_23780 ) ( CLEAR ?auto_23778 ) ( not ( = ?auto_23778 ?auto_23780 ) ) ( not ( = ?auto_23779 ?auto_23780 ) ) ( SURFACE-AT ?auto_23785 ?auto_23781 ) ( CLEAR ?auto_23785 ) ( IS-CRATE ?auto_23779 ) ( not ( = ?auto_23778 ?auto_23785 ) ) ( not ( = ?auto_23779 ?auto_23785 ) ) ( not ( = ?auto_23780 ?auto_23785 ) ) ( AVAILABLE ?auto_23784 ) ( TRUCK-AT ?auto_23782 ?auto_23787 ) ( SURFACE-AT ?auto_23779 ?auto_23787 ) ( ON ?auto_23779 ?auto_23783 ) ( CLEAR ?auto_23779 ) ( not ( = ?auto_23778 ?auto_23783 ) ) ( not ( = ?auto_23779 ?auto_23783 ) ) ( not ( = ?auto_23780 ?auto_23783 ) ) ( not ( = ?auto_23785 ?auto_23783 ) ) ( LIFTING ?auto_23786 ?auto_23788 ) ( IS-CRATE ?auto_23788 ) ( not ( = ?auto_23778 ?auto_23788 ) ) ( not ( = ?auto_23779 ?auto_23788 ) ) ( not ( = ?auto_23780 ?auto_23788 ) ) ( not ( = ?auto_23785 ?auto_23788 ) ) ( not ( = ?auto_23783 ?auto_23788 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23786 ?auto_23788 ?auto_23782 ?auto_23787 )
      ( MAKE-ON ?auto_23778 ?auto_23779 )
      ( MAKE-ON-VERIFY ?auto_23778 ?auto_23779 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23857 - SURFACE
      ?auto_23858 - SURFACE
    )
    :vars
    (
      ?auto_23863 - HOIST
      ?auto_23864 - PLACE
      ?auto_23862 - PLACE
      ?auto_23861 - HOIST
      ?auto_23860 - SURFACE
      ?auto_23859 - TRUCK
      ?auto_23865 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23863 ?auto_23864 ) ( SURFACE-AT ?auto_23858 ?auto_23864 ) ( CLEAR ?auto_23858 ) ( IS-CRATE ?auto_23857 ) ( not ( = ?auto_23857 ?auto_23858 ) ) ( AVAILABLE ?auto_23863 ) ( not ( = ?auto_23862 ?auto_23864 ) ) ( HOIST-AT ?auto_23861 ?auto_23862 ) ( not ( = ?auto_23863 ?auto_23861 ) ) ( AVAILABLE ?auto_23861 ) ( SURFACE-AT ?auto_23857 ?auto_23862 ) ( ON ?auto_23857 ?auto_23860 ) ( CLEAR ?auto_23857 ) ( not ( = ?auto_23857 ?auto_23860 ) ) ( not ( = ?auto_23858 ?auto_23860 ) ) ( TRUCK-AT ?auto_23859 ?auto_23865 ) ( not ( = ?auto_23865 ?auto_23864 ) ) ( not ( = ?auto_23862 ?auto_23865 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23859 ?auto_23865 ?auto_23864 )
      ( MAKE-ON ?auto_23857 ?auto_23858 )
      ( MAKE-ON-VERIFY ?auto_23857 ?auto_23858 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23872 - SURFACE
      ?auto_23873 - SURFACE
    )
    :vars
    (
      ?auto_23877 - HOIST
      ?auto_23879 - PLACE
      ?auto_23876 - PLACE
      ?auto_23874 - HOIST
      ?auto_23878 - SURFACE
      ?auto_23875 - TRUCK
      ?auto_23880 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23877 ?auto_23879 ) ( SURFACE-AT ?auto_23873 ?auto_23879 ) ( CLEAR ?auto_23873 ) ( IS-CRATE ?auto_23872 ) ( not ( = ?auto_23872 ?auto_23873 ) ) ( not ( = ?auto_23876 ?auto_23879 ) ) ( HOIST-AT ?auto_23874 ?auto_23876 ) ( not ( = ?auto_23877 ?auto_23874 ) ) ( AVAILABLE ?auto_23874 ) ( SURFACE-AT ?auto_23872 ?auto_23876 ) ( ON ?auto_23872 ?auto_23878 ) ( CLEAR ?auto_23872 ) ( not ( = ?auto_23872 ?auto_23878 ) ) ( not ( = ?auto_23873 ?auto_23878 ) ) ( TRUCK-AT ?auto_23875 ?auto_23879 ) ( LIFTING ?auto_23877 ?auto_23880 ) ( IS-CRATE ?auto_23880 ) ( not ( = ?auto_23872 ?auto_23880 ) ) ( not ( = ?auto_23873 ?auto_23880 ) ) ( not ( = ?auto_23878 ?auto_23880 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23877 ?auto_23880 ?auto_23875 ?auto_23879 )
      ( MAKE-ON ?auto_23872 ?auto_23873 )
      ( MAKE-ON-VERIFY ?auto_23872 ?auto_23873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24375 - SURFACE
      ?auto_24376 - SURFACE
    )
    :vars
    (
      ?auto_24380 - HOIST
      ?auto_24377 - PLACE
      ?auto_24381 - TRUCK
      ?auto_24379 - PLACE
      ?auto_24378 - HOIST
      ?auto_24382 - SURFACE
      ?auto_24383 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24380 ?auto_24377 ) ( SURFACE-AT ?auto_24376 ?auto_24377 ) ( CLEAR ?auto_24376 ) ( IS-CRATE ?auto_24375 ) ( not ( = ?auto_24375 ?auto_24376 ) ) ( AVAILABLE ?auto_24380 ) ( TRUCK-AT ?auto_24381 ?auto_24379 ) ( not ( = ?auto_24379 ?auto_24377 ) ) ( HOIST-AT ?auto_24378 ?auto_24379 ) ( not ( = ?auto_24380 ?auto_24378 ) ) ( SURFACE-AT ?auto_24375 ?auto_24379 ) ( ON ?auto_24375 ?auto_24382 ) ( CLEAR ?auto_24375 ) ( not ( = ?auto_24375 ?auto_24382 ) ) ( not ( = ?auto_24376 ?auto_24382 ) ) ( LIFTING ?auto_24378 ?auto_24383 ) ( IS-CRATE ?auto_24383 ) ( not ( = ?auto_24375 ?auto_24383 ) ) ( not ( = ?auto_24376 ?auto_24383 ) ) ( not ( = ?auto_24382 ?auto_24383 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24378 ?auto_24383 ?auto_24381 ?auto_24379 )
      ( MAKE-ON ?auto_24375 ?auto_24376 )
      ( MAKE-ON-VERIFY ?auto_24375 ?auto_24376 ) )
  )

)

