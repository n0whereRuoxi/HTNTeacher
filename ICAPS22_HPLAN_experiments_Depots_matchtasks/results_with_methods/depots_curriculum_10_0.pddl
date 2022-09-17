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

  ( :method MAKE-8CRATE-VERIFY
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
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
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
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
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
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6588 - SURFACE
      ?auto_6589 - SURFACE
    )
    :vars
    (
      ?auto_6590 - HOIST
      ?auto_6591 - PLACE
      ?auto_6593 - PLACE
      ?auto_6594 - HOIST
      ?auto_6595 - SURFACE
      ?auto_6592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6590 ?auto_6591 ) ( SURFACE-AT ?auto_6588 ?auto_6591 ) ( CLEAR ?auto_6588 ) ( IS-CRATE ?auto_6589 ) ( AVAILABLE ?auto_6590 ) ( not ( = ?auto_6593 ?auto_6591 ) ) ( HOIST-AT ?auto_6594 ?auto_6593 ) ( AVAILABLE ?auto_6594 ) ( SURFACE-AT ?auto_6589 ?auto_6593 ) ( ON ?auto_6589 ?auto_6595 ) ( CLEAR ?auto_6589 ) ( TRUCK-AT ?auto_6592 ?auto_6591 ) ( not ( = ?auto_6588 ?auto_6589 ) ) ( not ( = ?auto_6588 ?auto_6595 ) ) ( not ( = ?auto_6589 ?auto_6595 ) ) ( not ( = ?auto_6590 ?auto_6594 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6592 ?auto_6591 ?auto_6593 )
      ( !LIFT ?auto_6594 ?auto_6589 ?auto_6595 ?auto_6593 )
      ( !LOAD ?auto_6594 ?auto_6589 ?auto_6592 ?auto_6593 )
      ( !DRIVE ?auto_6592 ?auto_6593 ?auto_6591 )
      ( !UNLOAD ?auto_6590 ?auto_6589 ?auto_6592 ?auto_6591 )
      ( !DROP ?auto_6590 ?auto_6589 ?auto_6588 ?auto_6591 )
      ( MAKE-1CRATE-VERIFY ?auto_6588 ?auto_6589 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6598 - SURFACE
      ?auto_6599 - SURFACE
    )
    :vars
    (
      ?auto_6600 - HOIST
      ?auto_6601 - PLACE
      ?auto_6603 - PLACE
      ?auto_6604 - HOIST
      ?auto_6605 - SURFACE
      ?auto_6602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6600 ?auto_6601 ) ( SURFACE-AT ?auto_6598 ?auto_6601 ) ( CLEAR ?auto_6598 ) ( IS-CRATE ?auto_6599 ) ( AVAILABLE ?auto_6600 ) ( not ( = ?auto_6603 ?auto_6601 ) ) ( HOIST-AT ?auto_6604 ?auto_6603 ) ( AVAILABLE ?auto_6604 ) ( SURFACE-AT ?auto_6599 ?auto_6603 ) ( ON ?auto_6599 ?auto_6605 ) ( CLEAR ?auto_6599 ) ( TRUCK-AT ?auto_6602 ?auto_6601 ) ( not ( = ?auto_6598 ?auto_6599 ) ) ( not ( = ?auto_6598 ?auto_6605 ) ) ( not ( = ?auto_6599 ?auto_6605 ) ) ( not ( = ?auto_6600 ?auto_6604 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6602 ?auto_6601 ?auto_6603 )
      ( !LIFT ?auto_6604 ?auto_6599 ?auto_6605 ?auto_6603 )
      ( !LOAD ?auto_6604 ?auto_6599 ?auto_6602 ?auto_6603 )
      ( !DRIVE ?auto_6602 ?auto_6603 ?auto_6601 )
      ( !UNLOAD ?auto_6600 ?auto_6599 ?auto_6602 ?auto_6601 )
      ( !DROP ?auto_6600 ?auto_6599 ?auto_6598 ?auto_6601 )
      ( MAKE-1CRATE-VERIFY ?auto_6598 ?auto_6599 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6609 - SURFACE
      ?auto_6610 - SURFACE
      ?auto_6611 - SURFACE
    )
    :vars
    (
      ?auto_6616 - HOIST
      ?auto_6615 - PLACE
      ?auto_6617 - PLACE
      ?auto_6613 - HOIST
      ?auto_6614 - SURFACE
      ?auto_6618 - PLACE
      ?auto_6620 - HOIST
      ?auto_6619 - SURFACE
      ?auto_6612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6616 ?auto_6615 ) ( IS-CRATE ?auto_6611 ) ( not ( = ?auto_6617 ?auto_6615 ) ) ( HOIST-AT ?auto_6613 ?auto_6617 ) ( AVAILABLE ?auto_6613 ) ( SURFACE-AT ?auto_6611 ?auto_6617 ) ( ON ?auto_6611 ?auto_6614 ) ( CLEAR ?auto_6611 ) ( not ( = ?auto_6610 ?auto_6611 ) ) ( not ( = ?auto_6610 ?auto_6614 ) ) ( not ( = ?auto_6611 ?auto_6614 ) ) ( not ( = ?auto_6616 ?auto_6613 ) ) ( SURFACE-AT ?auto_6609 ?auto_6615 ) ( CLEAR ?auto_6609 ) ( IS-CRATE ?auto_6610 ) ( AVAILABLE ?auto_6616 ) ( not ( = ?auto_6618 ?auto_6615 ) ) ( HOIST-AT ?auto_6620 ?auto_6618 ) ( AVAILABLE ?auto_6620 ) ( SURFACE-AT ?auto_6610 ?auto_6618 ) ( ON ?auto_6610 ?auto_6619 ) ( CLEAR ?auto_6610 ) ( TRUCK-AT ?auto_6612 ?auto_6615 ) ( not ( = ?auto_6609 ?auto_6610 ) ) ( not ( = ?auto_6609 ?auto_6619 ) ) ( not ( = ?auto_6610 ?auto_6619 ) ) ( not ( = ?auto_6616 ?auto_6620 ) ) ( not ( = ?auto_6609 ?auto_6611 ) ) ( not ( = ?auto_6609 ?auto_6614 ) ) ( not ( = ?auto_6611 ?auto_6619 ) ) ( not ( = ?auto_6617 ?auto_6618 ) ) ( not ( = ?auto_6613 ?auto_6620 ) ) ( not ( = ?auto_6614 ?auto_6619 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6609 ?auto_6610 )
      ( MAKE-1CRATE ?auto_6610 ?auto_6611 )
      ( MAKE-2CRATE-VERIFY ?auto_6609 ?auto_6610 ?auto_6611 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6623 - SURFACE
      ?auto_6624 - SURFACE
    )
    :vars
    (
      ?auto_6625 - HOIST
      ?auto_6626 - PLACE
      ?auto_6628 - PLACE
      ?auto_6629 - HOIST
      ?auto_6630 - SURFACE
      ?auto_6627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6625 ?auto_6626 ) ( SURFACE-AT ?auto_6623 ?auto_6626 ) ( CLEAR ?auto_6623 ) ( IS-CRATE ?auto_6624 ) ( AVAILABLE ?auto_6625 ) ( not ( = ?auto_6628 ?auto_6626 ) ) ( HOIST-AT ?auto_6629 ?auto_6628 ) ( AVAILABLE ?auto_6629 ) ( SURFACE-AT ?auto_6624 ?auto_6628 ) ( ON ?auto_6624 ?auto_6630 ) ( CLEAR ?auto_6624 ) ( TRUCK-AT ?auto_6627 ?auto_6626 ) ( not ( = ?auto_6623 ?auto_6624 ) ) ( not ( = ?auto_6623 ?auto_6630 ) ) ( not ( = ?auto_6624 ?auto_6630 ) ) ( not ( = ?auto_6625 ?auto_6629 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6627 ?auto_6626 ?auto_6628 )
      ( !LIFT ?auto_6629 ?auto_6624 ?auto_6630 ?auto_6628 )
      ( !LOAD ?auto_6629 ?auto_6624 ?auto_6627 ?auto_6628 )
      ( !DRIVE ?auto_6627 ?auto_6628 ?auto_6626 )
      ( !UNLOAD ?auto_6625 ?auto_6624 ?auto_6627 ?auto_6626 )
      ( !DROP ?auto_6625 ?auto_6624 ?auto_6623 ?auto_6626 )
      ( MAKE-1CRATE-VERIFY ?auto_6623 ?auto_6624 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6635 - SURFACE
      ?auto_6636 - SURFACE
      ?auto_6637 - SURFACE
      ?auto_6638 - SURFACE
    )
    :vars
    (
      ?auto_6640 - HOIST
      ?auto_6639 - PLACE
      ?auto_6643 - PLACE
      ?auto_6644 - HOIST
      ?auto_6642 - SURFACE
      ?auto_6648 - PLACE
      ?auto_6645 - HOIST
      ?auto_6647 - SURFACE
      ?auto_6646 - SURFACE
      ?auto_6641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6640 ?auto_6639 ) ( IS-CRATE ?auto_6638 ) ( not ( = ?auto_6643 ?auto_6639 ) ) ( HOIST-AT ?auto_6644 ?auto_6643 ) ( SURFACE-AT ?auto_6638 ?auto_6643 ) ( ON ?auto_6638 ?auto_6642 ) ( CLEAR ?auto_6638 ) ( not ( = ?auto_6637 ?auto_6638 ) ) ( not ( = ?auto_6637 ?auto_6642 ) ) ( not ( = ?auto_6638 ?auto_6642 ) ) ( not ( = ?auto_6640 ?auto_6644 ) ) ( IS-CRATE ?auto_6637 ) ( not ( = ?auto_6648 ?auto_6639 ) ) ( HOIST-AT ?auto_6645 ?auto_6648 ) ( AVAILABLE ?auto_6645 ) ( SURFACE-AT ?auto_6637 ?auto_6648 ) ( ON ?auto_6637 ?auto_6647 ) ( CLEAR ?auto_6637 ) ( not ( = ?auto_6636 ?auto_6637 ) ) ( not ( = ?auto_6636 ?auto_6647 ) ) ( not ( = ?auto_6637 ?auto_6647 ) ) ( not ( = ?auto_6640 ?auto_6645 ) ) ( SURFACE-AT ?auto_6635 ?auto_6639 ) ( CLEAR ?auto_6635 ) ( IS-CRATE ?auto_6636 ) ( AVAILABLE ?auto_6640 ) ( AVAILABLE ?auto_6644 ) ( SURFACE-AT ?auto_6636 ?auto_6643 ) ( ON ?auto_6636 ?auto_6646 ) ( CLEAR ?auto_6636 ) ( TRUCK-AT ?auto_6641 ?auto_6639 ) ( not ( = ?auto_6635 ?auto_6636 ) ) ( not ( = ?auto_6635 ?auto_6646 ) ) ( not ( = ?auto_6636 ?auto_6646 ) ) ( not ( = ?auto_6635 ?auto_6637 ) ) ( not ( = ?auto_6635 ?auto_6647 ) ) ( not ( = ?auto_6637 ?auto_6646 ) ) ( not ( = ?auto_6648 ?auto_6643 ) ) ( not ( = ?auto_6645 ?auto_6644 ) ) ( not ( = ?auto_6647 ?auto_6646 ) ) ( not ( = ?auto_6635 ?auto_6638 ) ) ( not ( = ?auto_6635 ?auto_6642 ) ) ( not ( = ?auto_6636 ?auto_6638 ) ) ( not ( = ?auto_6636 ?auto_6642 ) ) ( not ( = ?auto_6638 ?auto_6647 ) ) ( not ( = ?auto_6638 ?auto_6646 ) ) ( not ( = ?auto_6642 ?auto_6647 ) ) ( not ( = ?auto_6642 ?auto_6646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6635 ?auto_6636 ?auto_6637 )
      ( MAKE-1CRATE ?auto_6637 ?auto_6638 )
      ( MAKE-3CRATE-VERIFY ?auto_6635 ?auto_6636 ?auto_6637 ?auto_6638 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6651 - SURFACE
      ?auto_6652 - SURFACE
    )
    :vars
    (
      ?auto_6653 - HOIST
      ?auto_6654 - PLACE
      ?auto_6656 - PLACE
      ?auto_6657 - HOIST
      ?auto_6658 - SURFACE
      ?auto_6655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6653 ?auto_6654 ) ( SURFACE-AT ?auto_6651 ?auto_6654 ) ( CLEAR ?auto_6651 ) ( IS-CRATE ?auto_6652 ) ( AVAILABLE ?auto_6653 ) ( not ( = ?auto_6656 ?auto_6654 ) ) ( HOIST-AT ?auto_6657 ?auto_6656 ) ( AVAILABLE ?auto_6657 ) ( SURFACE-AT ?auto_6652 ?auto_6656 ) ( ON ?auto_6652 ?auto_6658 ) ( CLEAR ?auto_6652 ) ( TRUCK-AT ?auto_6655 ?auto_6654 ) ( not ( = ?auto_6651 ?auto_6652 ) ) ( not ( = ?auto_6651 ?auto_6658 ) ) ( not ( = ?auto_6652 ?auto_6658 ) ) ( not ( = ?auto_6653 ?auto_6657 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6655 ?auto_6654 ?auto_6656 )
      ( !LIFT ?auto_6657 ?auto_6652 ?auto_6658 ?auto_6656 )
      ( !LOAD ?auto_6657 ?auto_6652 ?auto_6655 ?auto_6656 )
      ( !DRIVE ?auto_6655 ?auto_6656 ?auto_6654 )
      ( !UNLOAD ?auto_6653 ?auto_6652 ?auto_6655 ?auto_6654 )
      ( !DROP ?auto_6653 ?auto_6652 ?auto_6651 ?auto_6654 )
      ( MAKE-1CRATE-VERIFY ?auto_6651 ?auto_6652 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6664 - SURFACE
      ?auto_6665 - SURFACE
      ?auto_6666 - SURFACE
      ?auto_6667 - SURFACE
      ?auto_6668 - SURFACE
    )
    :vars
    (
      ?auto_6671 - HOIST
      ?auto_6670 - PLACE
      ?auto_6672 - PLACE
      ?auto_6673 - HOIST
      ?auto_6674 - SURFACE
      ?auto_6679 - PLACE
      ?auto_6675 - HOIST
      ?auto_6680 - SURFACE
      ?auto_6676 - PLACE
      ?auto_6677 - HOIST
      ?auto_6678 - SURFACE
      ?auto_6681 - SURFACE
      ?auto_6669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6671 ?auto_6670 ) ( IS-CRATE ?auto_6668 ) ( not ( = ?auto_6672 ?auto_6670 ) ) ( HOIST-AT ?auto_6673 ?auto_6672 ) ( AVAILABLE ?auto_6673 ) ( SURFACE-AT ?auto_6668 ?auto_6672 ) ( ON ?auto_6668 ?auto_6674 ) ( CLEAR ?auto_6668 ) ( not ( = ?auto_6667 ?auto_6668 ) ) ( not ( = ?auto_6667 ?auto_6674 ) ) ( not ( = ?auto_6668 ?auto_6674 ) ) ( not ( = ?auto_6671 ?auto_6673 ) ) ( IS-CRATE ?auto_6667 ) ( not ( = ?auto_6679 ?auto_6670 ) ) ( HOIST-AT ?auto_6675 ?auto_6679 ) ( SURFACE-AT ?auto_6667 ?auto_6679 ) ( ON ?auto_6667 ?auto_6680 ) ( CLEAR ?auto_6667 ) ( not ( = ?auto_6666 ?auto_6667 ) ) ( not ( = ?auto_6666 ?auto_6680 ) ) ( not ( = ?auto_6667 ?auto_6680 ) ) ( not ( = ?auto_6671 ?auto_6675 ) ) ( IS-CRATE ?auto_6666 ) ( not ( = ?auto_6676 ?auto_6670 ) ) ( HOIST-AT ?auto_6677 ?auto_6676 ) ( AVAILABLE ?auto_6677 ) ( SURFACE-AT ?auto_6666 ?auto_6676 ) ( ON ?auto_6666 ?auto_6678 ) ( CLEAR ?auto_6666 ) ( not ( = ?auto_6665 ?auto_6666 ) ) ( not ( = ?auto_6665 ?auto_6678 ) ) ( not ( = ?auto_6666 ?auto_6678 ) ) ( not ( = ?auto_6671 ?auto_6677 ) ) ( SURFACE-AT ?auto_6664 ?auto_6670 ) ( CLEAR ?auto_6664 ) ( IS-CRATE ?auto_6665 ) ( AVAILABLE ?auto_6671 ) ( AVAILABLE ?auto_6675 ) ( SURFACE-AT ?auto_6665 ?auto_6679 ) ( ON ?auto_6665 ?auto_6681 ) ( CLEAR ?auto_6665 ) ( TRUCK-AT ?auto_6669 ?auto_6670 ) ( not ( = ?auto_6664 ?auto_6665 ) ) ( not ( = ?auto_6664 ?auto_6681 ) ) ( not ( = ?auto_6665 ?auto_6681 ) ) ( not ( = ?auto_6664 ?auto_6666 ) ) ( not ( = ?auto_6664 ?auto_6678 ) ) ( not ( = ?auto_6666 ?auto_6681 ) ) ( not ( = ?auto_6676 ?auto_6679 ) ) ( not ( = ?auto_6677 ?auto_6675 ) ) ( not ( = ?auto_6678 ?auto_6681 ) ) ( not ( = ?auto_6664 ?auto_6667 ) ) ( not ( = ?auto_6664 ?auto_6680 ) ) ( not ( = ?auto_6665 ?auto_6667 ) ) ( not ( = ?auto_6665 ?auto_6680 ) ) ( not ( = ?auto_6667 ?auto_6678 ) ) ( not ( = ?auto_6667 ?auto_6681 ) ) ( not ( = ?auto_6680 ?auto_6678 ) ) ( not ( = ?auto_6680 ?auto_6681 ) ) ( not ( = ?auto_6664 ?auto_6668 ) ) ( not ( = ?auto_6664 ?auto_6674 ) ) ( not ( = ?auto_6665 ?auto_6668 ) ) ( not ( = ?auto_6665 ?auto_6674 ) ) ( not ( = ?auto_6666 ?auto_6668 ) ) ( not ( = ?auto_6666 ?auto_6674 ) ) ( not ( = ?auto_6668 ?auto_6680 ) ) ( not ( = ?auto_6668 ?auto_6678 ) ) ( not ( = ?auto_6668 ?auto_6681 ) ) ( not ( = ?auto_6672 ?auto_6679 ) ) ( not ( = ?auto_6672 ?auto_6676 ) ) ( not ( = ?auto_6673 ?auto_6675 ) ) ( not ( = ?auto_6673 ?auto_6677 ) ) ( not ( = ?auto_6674 ?auto_6680 ) ) ( not ( = ?auto_6674 ?auto_6678 ) ) ( not ( = ?auto_6674 ?auto_6681 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6664 ?auto_6665 ?auto_6666 ?auto_6667 )
      ( MAKE-1CRATE ?auto_6667 ?auto_6668 )
      ( MAKE-4CRATE-VERIFY ?auto_6664 ?auto_6665 ?auto_6666 ?auto_6667 ?auto_6668 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6684 - SURFACE
      ?auto_6685 - SURFACE
    )
    :vars
    (
      ?auto_6686 - HOIST
      ?auto_6687 - PLACE
      ?auto_6689 - PLACE
      ?auto_6690 - HOIST
      ?auto_6691 - SURFACE
      ?auto_6688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6686 ?auto_6687 ) ( SURFACE-AT ?auto_6684 ?auto_6687 ) ( CLEAR ?auto_6684 ) ( IS-CRATE ?auto_6685 ) ( AVAILABLE ?auto_6686 ) ( not ( = ?auto_6689 ?auto_6687 ) ) ( HOIST-AT ?auto_6690 ?auto_6689 ) ( AVAILABLE ?auto_6690 ) ( SURFACE-AT ?auto_6685 ?auto_6689 ) ( ON ?auto_6685 ?auto_6691 ) ( CLEAR ?auto_6685 ) ( TRUCK-AT ?auto_6688 ?auto_6687 ) ( not ( = ?auto_6684 ?auto_6685 ) ) ( not ( = ?auto_6684 ?auto_6691 ) ) ( not ( = ?auto_6685 ?auto_6691 ) ) ( not ( = ?auto_6686 ?auto_6690 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6688 ?auto_6687 ?auto_6689 )
      ( !LIFT ?auto_6690 ?auto_6685 ?auto_6691 ?auto_6689 )
      ( !LOAD ?auto_6690 ?auto_6685 ?auto_6688 ?auto_6689 )
      ( !DRIVE ?auto_6688 ?auto_6689 ?auto_6687 )
      ( !UNLOAD ?auto_6686 ?auto_6685 ?auto_6688 ?auto_6687 )
      ( !DROP ?auto_6686 ?auto_6685 ?auto_6684 ?auto_6687 )
      ( MAKE-1CRATE-VERIFY ?auto_6684 ?auto_6685 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_6698 - SURFACE
      ?auto_6699 - SURFACE
      ?auto_6700 - SURFACE
      ?auto_6701 - SURFACE
      ?auto_6702 - SURFACE
      ?auto_6703 - SURFACE
    )
    :vars
    (
      ?auto_6705 - HOIST
      ?auto_6708 - PLACE
      ?auto_6709 - PLACE
      ?auto_6707 - HOIST
      ?auto_6706 - SURFACE
      ?auto_6712 - PLACE
      ?auto_6717 - HOIST
      ?auto_6711 - SURFACE
      ?auto_6714 - PLACE
      ?auto_6718 - HOIST
      ?auto_6713 - SURFACE
      ?auto_6719 - PLACE
      ?auto_6715 - HOIST
      ?auto_6710 - SURFACE
      ?auto_6716 - SURFACE
      ?auto_6704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6705 ?auto_6708 ) ( IS-CRATE ?auto_6703 ) ( not ( = ?auto_6709 ?auto_6708 ) ) ( HOIST-AT ?auto_6707 ?auto_6709 ) ( AVAILABLE ?auto_6707 ) ( SURFACE-AT ?auto_6703 ?auto_6709 ) ( ON ?auto_6703 ?auto_6706 ) ( CLEAR ?auto_6703 ) ( not ( = ?auto_6702 ?auto_6703 ) ) ( not ( = ?auto_6702 ?auto_6706 ) ) ( not ( = ?auto_6703 ?auto_6706 ) ) ( not ( = ?auto_6705 ?auto_6707 ) ) ( IS-CRATE ?auto_6702 ) ( not ( = ?auto_6712 ?auto_6708 ) ) ( HOIST-AT ?auto_6717 ?auto_6712 ) ( AVAILABLE ?auto_6717 ) ( SURFACE-AT ?auto_6702 ?auto_6712 ) ( ON ?auto_6702 ?auto_6711 ) ( CLEAR ?auto_6702 ) ( not ( = ?auto_6701 ?auto_6702 ) ) ( not ( = ?auto_6701 ?auto_6711 ) ) ( not ( = ?auto_6702 ?auto_6711 ) ) ( not ( = ?auto_6705 ?auto_6717 ) ) ( IS-CRATE ?auto_6701 ) ( not ( = ?auto_6714 ?auto_6708 ) ) ( HOIST-AT ?auto_6718 ?auto_6714 ) ( SURFACE-AT ?auto_6701 ?auto_6714 ) ( ON ?auto_6701 ?auto_6713 ) ( CLEAR ?auto_6701 ) ( not ( = ?auto_6700 ?auto_6701 ) ) ( not ( = ?auto_6700 ?auto_6713 ) ) ( not ( = ?auto_6701 ?auto_6713 ) ) ( not ( = ?auto_6705 ?auto_6718 ) ) ( IS-CRATE ?auto_6700 ) ( not ( = ?auto_6719 ?auto_6708 ) ) ( HOIST-AT ?auto_6715 ?auto_6719 ) ( AVAILABLE ?auto_6715 ) ( SURFACE-AT ?auto_6700 ?auto_6719 ) ( ON ?auto_6700 ?auto_6710 ) ( CLEAR ?auto_6700 ) ( not ( = ?auto_6699 ?auto_6700 ) ) ( not ( = ?auto_6699 ?auto_6710 ) ) ( not ( = ?auto_6700 ?auto_6710 ) ) ( not ( = ?auto_6705 ?auto_6715 ) ) ( SURFACE-AT ?auto_6698 ?auto_6708 ) ( CLEAR ?auto_6698 ) ( IS-CRATE ?auto_6699 ) ( AVAILABLE ?auto_6705 ) ( AVAILABLE ?auto_6718 ) ( SURFACE-AT ?auto_6699 ?auto_6714 ) ( ON ?auto_6699 ?auto_6716 ) ( CLEAR ?auto_6699 ) ( TRUCK-AT ?auto_6704 ?auto_6708 ) ( not ( = ?auto_6698 ?auto_6699 ) ) ( not ( = ?auto_6698 ?auto_6716 ) ) ( not ( = ?auto_6699 ?auto_6716 ) ) ( not ( = ?auto_6698 ?auto_6700 ) ) ( not ( = ?auto_6698 ?auto_6710 ) ) ( not ( = ?auto_6700 ?auto_6716 ) ) ( not ( = ?auto_6719 ?auto_6714 ) ) ( not ( = ?auto_6715 ?auto_6718 ) ) ( not ( = ?auto_6710 ?auto_6716 ) ) ( not ( = ?auto_6698 ?auto_6701 ) ) ( not ( = ?auto_6698 ?auto_6713 ) ) ( not ( = ?auto_6699 ?auto_6701 ) ) ( not ( = ?auto_6699 ?auto_6713 ) ) ( not ( = ?auto_6701 ?auto_6710 ) ) ( not ( = ?auto_6701 ?auto_6716 ) ) ( not ( = ?auto_6713 ?auto_6710 ) ) ( not ( = ?auto_6713 ?auto_6716 ) ) ( not ( = ?auto_6698 ?auto_6702 ) ) ( not ( = ?auto_6698 ?auto_6711 ) ) ( not ( = ?auto_6699 ?auto_6702 ) ) ( not ( = ?auto_6699 ?auto_6711 ) ) ( not ( = ?auto_6700 ?auto_6702 ) ) ( not ( = ?auto_6700 ?auto_6711 ) ) ( not ( = ?auto_6702 ?auto_6713 ) ) ( not ( = ?auto_6702 ?auto_6710 ) ) ( not ( = ?auto_6702 ?auto_6716 ) ) ( not ( = ?auto_6712 ?auto_6714 ) ) ( not ( = ?auto_6712 ?auto_6719 ) ) ( not ( = ?auto_6717 ?auto_6718 ) ) ( not ( = ?auto_6717 ?auto_6715 ) ) ( not ( = ?auto_6711 ?auto_6713 ) ) ( not ( = ?auto_6711 ?auto_6710 ) ) ( not ( = ?auto_6711 ?auto_6716 ) ) ( not ( = ?auto_6698 ?auto_6703 ) ) ( not ( = ?auto_6698 ?auto_6706 ) ) ( not ( = ?auto_6699 ?auto_6703 ) ) ( not ( = ?auto_6699 ?auto_6706 ) ) ( not ( = ?auto_6700 ?auto_6703 ) ) ( not ( = ?auto_6700 ?auto_6706 ) ) ( not ( = ?auto_6701 ?auto_6703 ) ) ( not ( = ?auto_6701 ?auto_6706 ) ) ( not ( = ?auto_6703 ?auto_6711 ) ) ( not ( = ?auto_6703 ?auto_6713 ) ) ( not ( = ?auto_6703 ?auto_6710 ) ) ( not ( = ?auto_6703 ?auto_6716 ) ) ( not ( = ?auto_6709 ?auto_6712 ) ) ( not ( = ?auto_6709 ?auto_6714 ) ) ( not ( = ?auto_6709 ?auto_6719 ) ) ( not ( = ?auto_6707 ?auto_6717 ) ) ( not ( = ?auto_6707 ?auto_6718 ) ) ( not ( = ?auto_6707 ?auto_6715 ) ) ( not ( = ?auto_6706 ?auto_6711 ) ) ( not ( = ?auto_6706 ?auto_6713 ) ) ( not ( = ?auto_6706 ?auto_6710 ) ) ( not ( = ?auto_6706 ?auto_6716 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6698 ?auto_6699 ?auto_6700 ?auto_6701 ?auto_6702 )
      ( MAKE-1CRATE ?auto_6702 ?auto_6703 )
      ( MAKE-5CRATE-VERIFY ?auto_6698 ?auto_6699 ?auto_6700 ?auto_6701 ?auto_6702 ?auto_6703 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6722 - SURFACE
      ?auto_6723 - SURFACE
    )
    :vars
    (
      ?auto_6724 - HOIST
      ?auto_6725 - PLACE
      ?auto_6727 - PLACE
      ?auto_6728 - HOIST
      ?auto_6729 - SURFACE
      ?auto_6726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6724 ?auto_6725 ) ( SURFACE-AT ?auto_6722 ?auto_6725 ) ( CLEAR ?auto_6722 ) ( IS-CRATE ?auto_6723 ) ( AVAILABLE ?auto_6724 ) ( not ( = ?auto_6727 ?auto_6725 ) ) ( HOIST-AT ?auto_6728 ?auto_6727 ) ( AVAILABLE ?auto_6728 ) ( SURFACE-AT ?auto_6723 ?auto_6727 ) ( ON ?auto_6723 ?auto_6729 ) ( CLEAR ?auto_6723 ) ( TRUCK-AT ?auto_6726 ?auto_6725 ) ( not ( = ?auto_6722 ?auto_6723 ) ) ( not ( = ?auto_6722 ?auto_6729 ) ) ( not ( = ?auto_6723 ?auto_6729 ) ) ( not ( = ?auto_6724 ?auto_6728 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6726 ?auto_6725 ?auto_6727 )
      ( !LIFT ?auto_6728 ?auto_6723 ?auto_6729 ?auto_6727 )
      ( !LOAD ?auto_6728 ?auto_6723 ?auto_6726 ?auto_6727 )
      ( !DRIVE ?auto_6726 ?auto_6727 ?auto_6725 )
      ( !UNLOAD ?auto_6724 ?auto_6723 ?auto_6726 ?auto_6725 )
      ( !DROP ?auto_6724 ?auto_6723 ?auto_6722 ?auto_6725 )
      ( MAKE-1CRATE-VERIFY ?auto_6722 ?auto_6723 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_6737 - SURFACE
      ?auto_6738 - SURFACE
      ?auto_6739 - SURFACE
      ?auto_6740 - SURFACE
      ?auto_6741 - SURFACE
      ?auto_6743 - SURFACE
      ?auto_6742 - SURFACE
    )
    :vars
    (
      ?auto_6748 - HOIST
      ?auto_6744 - PLACE
      ?auto_6746 - PLACE
      ?auto_6747 - HOIST
      ?auto_6745 - SURFACE
      ?auto_6759 - PLACE
      ?auto_6756 - HOIST
      ?auto_6755 - SURFACE
      ?auto_6751 - SURFACE
      ?auto_6753 - PLACE
      ?auto_6758 - HOIST
      ?auto_6757 - SURFACE
      ?auto_6760 - PLACE
      ?auto_6754 - HOIST
      ?auto_6752 - SURFACE
      ?auto_6750 - SURFACE
      ?auto_6749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6748 ?auto_6744 ) ( IS-CRATE ?auto_6742 ) ( not ( = ?auto_6746 ?auto_6744 ) ) ( HOIST-AT ?auto_6747 ?auto_6746 ) ( SURFACE-AT ?auto_6742 ?auto_6746 ) ( ON ?auto_6742 ?auto_6745 ) ( CLEAR ?auto_6742 ) ( not ( = ?auto_6743 ?auto_6742 ) ) ( not ( = ?auto_6743 ?auto_6745 ) ) ( not ( = ?auto_6742 ?auto_6745 ) ) ( not ( = ?auto_6748 ?auto_6747 ) ) ( IS-CRATE ?auto_6743 ) ( not ( = ?auto_6759 ?auto_6744 ) ) ( HOIST-AT ?auto_6756 ?auto_6759 ) ( AVAILABLE ?auto_6756 ) ( SURFACE-AT ?auto_6743 ?auto_6759 ) ( ON ?auto_6743 ?auto_6755 ) ( CLEAR ?auto_6743 ) ( not ( = ?auto_6741 ?auto_6743 ) ) ( not ( = ?auto_6741 ?auto_6755 ) ) ( not ( = ?auto_6743 ?auto_6755 ) ) ( not ( = ?auto_6748 ?auto_6756 ) ) ( IS-CRATE ?auto_6741 ) ( AVAILABLE ?auto_6747 ) ( SURFACE-AT ?auto_6741 ?auto_6746 ) ( ON ?auto_6741 ?auto_6751 ) ( CLEAR ?auto_6741 ) ( not ( = ?auto_6740 ?auto_6741 ) ) ( not ( = ?auto_6740 ?auto_6751 ) ) ( not ( = ?auto_6741 ?auto_6751 ) ) ( IS-CRATE ?auto_6740 ) ( not ( = ?auto_6753 ?auto_6744 ) ) ( HOIST-AT ?auto_6758 ?auto_6753 ) ( SURFACE-AT ?auto_6740 ?auto_6753 ) ( ON ?auto_6740 ?auto_6757 ) ( CLEAR ?auto_6740 ) ( not ( = ?auto_6739 ?auto_6740 ) ) ( not ( = ?auto_6739 ?auto_6757 ) ) ( not ( = ?auto_6740 ?auto_6757 ) ) ( not ( = ?auto_6748 ?auto_6758 ) ) ( IS-CRATE ?auto_6739 ) ( not ( = ?auto_6760 ?auto_6744 ) ) ( HOIST-AT ?auto_6754 ?auto_6760 ) ( AVAILABLE ?auto_6754 ) ( SURFACE-AT ?auto_6739 ?auto_6760 ) ( ON ?auto_6739 ?auto_6752 ) ( CLEAR ?auto_6739 ) ( not ( = ?auto_6738 ?auto_6739 ) ) ( not ( = ?auto_6738 ?auto_6752 ) ) ( not ( = ?auto_6739 ?auto_6752 ) ) ( not ( = ?auto_6748 ?auto_6754 ) ) ( SURFACE-AT ?auto_6737 ?auto_6744 ) ( CLEAR ?auto_6737 ) ( IS-CRATE ?auto_6738 ) ( AVAILABLE ?auto_6748 ) ( AVAILABLE ?auto_6758 ) ( SURFACE-AT ?auto_6738 ?auto_6753 ) ( ON ?auto_6738 ?auto_6750 ) ( CLEAR ?auto_6738 ) ( TRUCK-AT ?auto_6749 ?auto_6744 ) ( not ( = ?auto_6737 ?auto_6738 ) ) ( not ( = ?auto_6737 ?auto_6750 ) ) ( not ( = ?auto_6738 ?auto_6750 ) ) ( not ( = ?auto_6737 ?auto_6739 ) ) ( not ( = ?auto_6737 ?auto_6752 ) ) ( not ( = ?auto_6739 ?auto_6750 ) ) ( not ( = ?auto_6760 ?auto_6753 ) ) ( not ( = ?auto_6754 ?auto_6758 ) ) ( not ( = ?auto_6752 ?auto_6750 ) ) ( not ( = ?auto_6737 ?auto_6740 ) ) ( not ( = ?auto_6737 ?auto_6757 ) ) ( not ( = ?auto_6738 ?auto_6740 ) ) ( not ( = ?auto_6738 ?auto_6757 ) ) ( not ( = ?auto_6740 ?auto_6752 ) ) ( not ( = ?auto_6740 ?auto_6750 ) ) ( not ( = ?auto_6757 ?auto_6752 ) ) ( not ( = ?auto_6757 ?auto_6750 ) ) ( not ( = ?auto_6737 ?auto_6741 ) ) ( not ( = ?auto_6737 ?auto_6751 ) ) ( not ( = ?auto_6738 ?auto_6741 ) ) ( not ( = ?auto_6738 ?auto_6751 ) ) ( not ( = ?auto_6739 ?auto_6741 ) ) ( not ( = ?auto_6739 ?auto_6751 ) ) ( not ( = ?auto_6741 ?auto_6757 ) ) ( not ( = ?auto_6741 ?auto_6752 ) ) ( not ( = ?auto_6741 ?auto_6750 ) ) ( not ( = ?auto_6746 ?auto_6753 ) ) ( not ( = ?auto_6746 ?auto_6760 ) ) ( not ( = ?auto_6747 ?auto_6758 ) ) ( not ( = ?auto_6747 ?auto_6754 ) ) ( not ( = ?auto_6751 ?auto_6757 ) ) ( not ( = ?auto_6751 ?auto_6752 ) ) ( not ( = ?auto_6751 ?auto_6750 ) ) ( not ( = ?auto_6737 ?auto_6743 ) ) ( not ( = ?auto_6737 ?auto_6755 ) ) ( not ( = ?auto_6738 ?auto_6743 ) ) ( not ( = ?auto_6738 ?auto_6755 ) ) ( not ( = ?auto_6739 ?auto_6743 ) ) ( not ( = ?auto_6739 ?auto_6755 ) ) ( not ( = ?auto_6740 ?auto_6743 ) ) ( not ( = ?auto_6740 ?auto_6755 ) ) ( not ( = ?auto_6743 ?auto_6751 ) ) ( not ( = ?auto_6743 ?auto_6757 ) ) ( not ( = ?auto_6743 ?auto_6752 ) ) ( not ( = ?auto_6743 ?auto_6750 ) ) ( not ( = ?auto_6759 ?auto_6746 ) ) ( not ( = ?auto_6759 ?auto_6753 ) ) ( not ( = ?auto_6759 ?auto_6760 ) ) ( not ( = ?auto_6756 ?auto_6747 ) ) ( not ( = ?auto_6756 ?auto_6758 ) ) ( not ( = ?auto_6756 ?auto_6754 ) ) ( not ( = ?auto_6755 ?auto_6751 ) ) ( not ( = ?auto_6755 ?auto_6757 ) ) ( not ( = ?auto_6755 ?auto_6752 ) ) ( not ( = ?auto_6755 ?auto_6750 ) ) ( not ( = ?auto_6737 ?auto_6742 ) ) ( not ( = ?auto_6737 ?auto_6745 ) ) ( not ( = ?auto_6738 ?auto_6742 ) ) ( not ( = ?auto_6738 ?auto_6745 ) ) ( not ( = ?auto_6739 ?auto_6742 ) ) ( not ( = ?auto_6739 ?auto_6745 ) ) ( not ( = ?auto_6740 ?auto_6742 ) ) ( not ( = ?auto_6740 ?auto_6745 ) ) ( not ( = ?auto_6741 ?auto_6742 ) ) ( not ( = ?auto_6741 ?auto_6745 ) ) ( not ( = ?auto_6742 ?auto_6755 ) ) ( not ( = ?auto_6742 ?auto_6751 ) ) ( not ( = ?auto_6742 ?auto_6757 ) ) ( not ( = ?auto_6742 ?auto_6752 ) ) ( not ( = ?auto_6742 ?auto_6750 ) ) ( not ( = ?auto_6745 ?auto_6755 ) ) ( not ( = ?auto_6745 ?auto_6751 ) ) ( not ( = ?auto_6745 ?auto_6757 ) ) ( not ( = ?auto_6745 ?auto_6752 ) ) ( not ( = ?auto_6745 ?auto_6750 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6737 ?auto_6738 ?auto_6739 ?auto_6740 ?auto_6741 ?auto_6743 )
      ( MAKE-1CRATE ?auto_6743 ?auto_6742 )
      ( MAKE-6CRATE-VERIFY ?auto_6737 ?auto_6738 ?auto_6739 ?auto_6740 ?auto_6741 ?auto_6743 ?auto_6742 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6763 - SURFACE
      ?auto_6764 - SURFACE
    )
    :vars
    (
      ?auto_6765 - HOIST
      ?auto_6766 - PLACE
      ?auto_6768 - PLACE
      ?auto_6769 - HOIST
      ?auto_6770 - SURFACE
      ?auto_6767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6765 ?auto_6766 ) ( SURFACE-AT ?auto_6763 ?auto_6766 ) ( CLEAR ?auto_6763 ) ( IS-CRATE ?auto_6764 ) ( AVAILABLE ?auto_6765 ) ( not ( = ?auto_6768 ?auto_6766 ) ) ( HOIST-AT ?auto_6769 ?auto_6768 ) ( AVAILABLE ?auto_6769 ) ( SURFACE-AT ?auto_6764 ?auto_6768 ) ( ON ?auto_6764 ?auto_6770 ) ( CLEAR ?auto_6764 ) ( TRUCK-AT ?auto_6767 ?auto_6766 ) ( not ( = ?auto_6763 ?auto_6764 ) ) ( not ( = ?auto_6763 ?auto_6770 ) ) ( not ( = ?auto_6764 ?auto_6770 ) ) ( not ( = ?auto_6765 ?auto_6769 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6767 ?auto_6766 ?auto_6768 )
      ( !LIFT ?auto_6769 ?auto_6764 ?auto_6770 ?auto_6768 )
      ( !LOAD ?auto_6769 ?auto_6764 ?auto_6767 ?auto_6768 )
      ( !DRIVE ?auto_6767 ?auto_6768 ?auto_6766 )
      ( !UNLOAD ?auto_6765 ?auto_6764 ?auto_6767 ?auto_6766 )
      ( !DROP ?auto_6765 ?auto_6764 ?auto_6763 ?auto_6766 )
      ( MAKE-1CRATE-VERIFY ?auto_6763 ?auto_6764 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_6779 - SURFACE
      ?auto_6780 - SURFACE
      ?auto_6781 - SURFACE
      ?auto_6782 - SURFACE
      ?auto_6783 - SURFACE
      ?auto_6785 - SURFACE
      ?auto_6784 - SURFACE
      ?auto_6786 - SURFACE
    )
    :vars
    (
      ?auto_6792 - HOIST
      ?auto_6787 - PLACE
      ?auto_6791 - PLACE
      ?auto_6789 - HOIST
      ?auto_6788 - SURFACE
      ?auto_6802 - PLACE
      ?auto_6801 - HOIST
      ?auto_6797 - SURFACE
      ?auto_6806 - PLACE
      ?auto_6793 - HOIST
      ?auto_6798 - SURFACE
      ?auto_6795 - SURFACE
      ?auto_6800 - PLACE
      ?auto_6803 - HOIST
      ?auto_6804 - SURFACE
      ?auto_6805 - PLACE
      ?auto_6799 - HOIST
      ?auto_6796 - SURFACE
      ?auto_6794 - SURFACE
      ?auto_6790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6792 ?auto_6787 ) ( IS-CRATE ?auto_6786 ) ( not ( = ?auto_6791 ?auto_6787 ) ) ( HOIST-AT ?auto_6789 ?auto_6791 ) ( AVAILABLE ?auto_6789 ) ( SURFACE-AT ?auto_6786 ?auto_6791 ) ( ON ?auto_6786 ?auto_6788 ) ( CLEAR ?auto_6786 ) ( not ( = ?auto_6784 ?auto_6786 ) ) ( not ( = ?auto_6784 ?auto_6788 ) ) ( not ( = ?auto_6786 ?auto_6788 ) ) ( not ( = ?auto_6792 ?auto_6789 ) ) ( IS-CRATE ?auto_6784 ) ( not ( = ?auto_6802 ?auto_6787 ) ) ( HOIST-AT ?auto_6801 ?auto_6802 ) ( SURFACE-AT ?auto_6784 ?auto_6802 ) ( ON ?auto_6784 ?auto_6797 ) ( CLEAR ?auto_6784 ) ( not ( = ?auto_6785 ?auto_6784 ) ) ( not ( = ?auto_6785 ?auto_6797 ) ) ( not ( = ?auto_6784 ?auto_6797 ) ) ( not ( = ?auto_6792 ?auto_6801 ) ) ( IS-CRATE ?auto_6785 ) ( not ( = ?auto_6806 ?auto_6787 ) ) ( HOIST-AT ?auto_6793 ?auto_6806 ) ( AVAILABLE ?auto_6793 ) ( SURFACE-AT ?auto_6785 ?auto_6806 ) ( ON ?auto_6785 ?auto_6798 ) ( CLEAR ?auto_6785 ) ( not ( = ?auto_6783 ?auto_6785 ) ) ( not ( = ?auto_6783 ?auto_6798 ) ) ( not ( = ?auto_6785 ?auto_6798 ) ) ( not ( = ?auto_6792 ?auto_6793 ) ) ( IS-CRATE ?auto_6783 ) ( AVAILABLE ?auto_6801 ) ( SURFACE-AT ?auto_6783 ?auto_6802 ) ( ON ?auto_6783 ?auto_6795 ) ( CLEAR ?auto_6783 ) ( not ( = ?auto_6782 ?auto_6783 ) ) ( not ( = ?auto_6782 ?auto_6795 ) ) ( not ( = ?auto_6783 ?auto_6795 ) ) ( IS-CRATE ?auto_6782 ) ( not ( = ?auto_6800 ?auto_6787 ) ) ( HOIST-AT ?auto_6803 ?auto_6800 ) ( SURFACE-AT ?auto_6782 ?auto_6800 ) ( ON ?auto_6782 ?auto_6804 ) ( CLEAR ?auto_6782 ) ( not ( = ?auto_6781 ?auto_6782 ) ) ( not ( = ?auto_6781 ?auto_6804 ) ) ( not ( = ?auto_6782 ?auto_6804 ) ) ( not ( = ?auto_6792 ?auto_6803 ) ) ( IS-CRATE ?auto_6781 ) ( not ( = ?auto_6805 ?auto_6787 ) ) ( HOIST-AT ?auto_6799 ?auto_6805 ) ( AVAILABLE ?auto_6799 ) ( SURFACE-AT ?auto_6781 ?auto_6805 ) ( ON ?auto_6781 ?auto_6796 ) ( CLEAR ?auto_6781 ) ( not ( = ?auto_6780 ?auto_6781 ) ) ( not ( = ?auto_6780 ?auto_6796 ) ) ( not ( = ?auto_6781 ?auto_6796 ) ) ( not ( = ?auto_6792 ?auto_6799 ) ) ( SURFACE-AT ?auto_6779 ?auto_6787 ) ( CLEAR ?auto_6779 ) ( IS-CRATE ?auto_6780 ) ( AVAILABLE ?auto_6792 ) ( AVAILABLE ?auto_6803 ) ( SURFACE-AT ?auto_6780 ?auto_6800 ) ( ON ?auto_6780 ?auto_6794 ) ( CLEAR ?auto_6780 ) ( TRUCK-AT ?auto_6790 ?auto_6787 ) ( not ( = ?auto_6779 ?auto_6780 ) ) ( not ( = ?auto_6779 ?auto_6794 ) ) ( not ( = ?auto_6780 ?auto_6794 ) ) ( not ( = ?auto_6779 ?auto_6781 ) ) ( not ( = ?auto_6779 ?auto_6796 ) ) ( not ( = ?auto_6781 ?auto_6794 ) ) ( not ( = ?auto_6805 ?auto_6800 ) ) ( not ( = ?auto_6799 ?auto_6803 ) ) ( not ( = ?auto_6796 ?auto_6794 ) ) ( not ( = ?auto_6779 ?auto_6782 ) ) ( not ( = ?auto_6779 ?auto_6804 ) ) ( not ( = ?auto_6780 ?auto_6782 ) ) ( not ( = ?auto_6780 ?auto_6804 ) ) ( not ( = ?auto_6782 ?auto_6796 ) ) ( not ( = ?auto_6782 ?auto_6794 ) ) ( not ( = ?auto_6804 ?auto_6796 ) ) ( not ( = ?auto_6804 ?auto_6794 ) ) ( not ( = ?auto_6779 ?auto_6783 ) ) ( not ( = ?auto_6779 ?auto_6795 ) ) ( not ( = ?auto_6780 ?auto_6783 ) ) ( not ( = ?auto_6780 ?auto_6795 ) ) ( not ( = ?auto_6781 ?auto_6783 ) ) ( not ( = ?auto_6781 ?auto_6795 ) ) ( not ( = ?auto_6783 ?auto_6804 ) ) ( not ( = ?auto_6783 ?auto_6796 ) ) ( not ( = ?auto_6783 ?auto_6794 ) ) ( not ( = ?auto_6802 ?auto_6800 ) ) ( not ( = ?auto_6802 ?auto_6805 ) ) ( not ( = ?auto_6801 ?auto_6803 ) ) ( not ( = ?auto_6801 ?auto_6799 ) ) ( not ( = ?auto_6795 ?auto_6804 ) ) ( not ( = ?auto_6795 ?auto_6796 ) ) ( not ( = ?auto_6795 ?auto_6794 ) ) ( not ( = ?auto_6779 ?auto_6785 ) ) ( not ( = ?auto_6779 ?auto_6798 ) ) ( not ( = ?auto_6780 ?auto_6785 ) ) ( not ( = ?auto_6780 ?auto_6798 ) ) ( not ( = ?auto_6781 ?auto_6785 ) ) ( not ( = ?auto_6781 ?auto_6798 ) ) ( not ( = ?auto_6782 ?auto_6785 ) ) ( not ( = ?auto_6782 ?auto_6798 ) ) ( not ( = ?auto_6785 ?auto_6795 ) ) ( not ( = ?auto_6785 ?auto_6804 ) ) ( not ( = ?auto_6785 ?auto_6796 ) ) ( not ( = ?auto_6785 ?auto_6794 ) ) ( not ( = ?auto_6806 ?auto_6802 ) ) ( not ( = ?auto_6806 ?auto_6800 ) ) ( not ( = ?auto_6806 ?auto_6805 ) ) ( not ( = ?auto_6793 ?auto_6801 ) ) ( not ( = ?auto_6793 ?auto_6803 ) ) ( not ( = ?auto_6793 ?auto_6799 ) ) ( not ( = ?auto_6798 ?auto_6795 ) ) ( not ( = ?auto_6798 ?auto_6804 ) ) ( not ( = ?auto_6798 ?auto_6796 ) ) ( not ( = ?auto_6798 ?auto_6794 ) ) ( not ( = ?auto_6779 ?auto_6784 ) ) ( not ( = ?auto_6779 ?auto_6797 ) ) ( not ( = ?auto_6780 ?auto_6784 ) ) ( not ( = ?auto_6780 ?auto_6797 ) ) ( not ( = ?auto_6781 ?auto_6784 ) ) ( not ( = ?auto_6781 ?auto_6797 ) ) ( not ( = ?auto_6782 ?auto_6784 ) ) ( not ( = ?auto_6782 ?auto_6797 ) ) ( not ( = ?auto_6783 ?auto_6784 ) ) ( not ( = ?auto_6783 ?auto_6797 ) ) ( not ( = ?auto_6784 ?auto_6798 ) ) ( not ( = ?auto_6784 ?auto_6795 ) ) ( not ( = ?auto_6784 ?auto_6804 ) ) ( not ( = ?auto_6784 ?auto_6796 ) ) ( not ( = ?auto_6784 ?auto_6794 ) ) ( not ( = ?auto_6797 ?auto_6798 ) ) ( not ( = ?auto_6797 ?auto_6795 ) ) ( not ( = ?auto_6797 ?auto_6804 ) ) ( not ( = ?auto_6797 ?auto_6796 ) ) ( not ( = ?auto_6797 ?auto_6794 ) ) ( not ( = ?auto_6779 ?auto_6786 ) ) ( not ( = ?auto_6779 ?auto_6788 ) ) ( not ( = ?auto_6780 ?auto_6786 ) ) ( not ( = ?auto_6780 ?auto_6788 ) ) ( not ( = ?auto_6781 ?auto_6786 ) ) ( not ( = ?auto_6781 ?auto_6788 ) ) ( not ( = ?auto_6782 ?auto_6786 ) ) ( not ( = ?auto_6782 ?auto_6788 ) ) ( not ( = ?auto_6783 ?auto_6786 ) ) ( not ( = ?auto_6783 ?auto_6788 ) ) ( not ( = ?auto_6785 ?auto_6786 ) ) ( not ( = ?auto_6785 ?auto_6788 ) ) ( not ( = ?auto_6786 ?auto_6797 ) ) ( not ( = ?auto_6786 ?auto_6798 ) ) ( not ( = ?auto_6786 ?auto_6795 ) ) ( not ( = ?auto_6786 ?auto_6804 ) ) ( not ( = ?auto_6786 ?auto_6796 ) ) ( not ( = ?auto_6786 ?auto_6794 ) ) ( not ( = ?auto_6791 ?auto_6802 ) ) ( not ( = ?auto_6791 ?auto_6806 ) ) ( not ( = ?auto_6791 ?auto_6800 ) ) ( not ( = ?auto_6791 ?auto_6805 ) ) ( not ( = ?auto_6789 ?auto_6801 ) ) ( not ( = ?auto_6789 ?auto_6793 ) ) ( not ( = ?auto_6789 ?auto_6803 ) ) ( not ( = ?auto_6789 ?auto_6799 ) ) ( not ( = ?auto_6788 ?auto_6797 ) ) ( not ( = ?auto_6788 ?auto_6798 ) ) ( not ( = ?auto_6788 ?auto_6795 ) ) ( not ( = ?auto_6788 ?auto_6804 ) ) ( not ( = ?auto_6788 ?auto_6796 ) ) ( not ( = ?auto_6788 ?auto_6794 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6779 ?auto_6780 ?auto_6781 ?auto_6782 ?auto_6783 ?auto_6785 ?auto_6784 )
      ( MAKE-1CRATE ?auto_6784 ?auto_6786 )
      ( MAKE-7CRATE-VERIFY ?auto_6779 ?auto_6780 ?auto_6781 ?auto_6782 ?auto_6783 ?auto_6785 ?auto_6784 ?auto_6786 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6809 - SURFACE
      ?auto_6810 - SURFACE
    )
    :vars
    (
      ?auto_6811 - HOIST
      ?auto_6812 - PLACE
      ?auto_6814 - PLACE
      ?auto_6815 - HOIST
      ?auto_6816 - SURFACE
      ?auto_6813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6811 ?auto_6812 ) ( SURFACE-AT ?auto_6809 ?auto_6812 ) ( CLEAR ?auto_6809 ) ( IS-CRATE ?auto_6810 ) ( AVAILABLE ?auto_6811 ) ( not ( = ?auto_6814 ?auto_6812 ) ) ( HOIST-AT ?auto_6815 ?auto_6814 ) ( AVAILABLE ?auto_6815 ) ( SURFACE-AT ?auto_6810 ?auto_6814 ) ( ON ?auto_6810 ?auto_6816 ) ( CLEAR ?auto_6810 ) ( TRUCK-AT ?auto_6813 ?auto_6812 ) ( not ( = ?auto_6809 ?auto_6810 ) ) ( not ( = ?auto_6809 ?auto_6816 ) ) ( not ( = ?auto_6810 ?auto_6816 ) ) ( not ( = ?auto_6811 ?auto_6815 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6813 ?auto_6812 ?auto_6814 )
      ( !LIFT ?auto_6815 ?auto_6810 ?auto_6816 ?auto_6814 )
      ( !LOAD ?auto_6815 ?auto_6810 ?auto_6813 ?auto_6814 )
      ( !DRIVE ?auto_6813 ?auto_6814 ?auto_6812 )
      ( !UNLOAD ?auto_6811 ?auto_6810 ?auto_6813 ?auto_6812 )
      ( !DROP ?auto_6811 ?auto_6810 ?auto_6809 ?auto_6812 )
      ( MAKE-1CRATE-VERIFY ?auto_6809 ?auto_6810 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_6826 - SURFACE
      ?auto_6827 - SURFACE
      ?auto_6828 - SURFACE
      ?auto_6829 - SURFACE
      ?auto_6830 - SURFACE
      ?auto_6832 - SURFACE
      ?auto_6831 - SURFACE
      ?auto_6834 - SURFACE
      ?auto_6833 - SURFACE
    )
    :vars
    (
      ?auto_6835 - HOIST
      ?auto_6837 - PLACE
      ?auto_6838 - PLACE
      ?auto_6839 - HOIST
      ?auto_6840 - SURFACE
      ?auto_6843 - PLACE
      ?auto_6856 - HOIST
      ?auto_6855 - SURFACE
      ?auto_6847 - PLACE
      ?auto_6845 - HOIST
      ?auto_6854 - SURFACE
      ?auto_6850 - PLACE
      ?auto_6844 - HOIST
      ?auto_6853 - SURFACE
      ?auto_6841 - SURFACE
      ?auto_6851 - PLACE
      ?auto_6846 - HOIST
      ?auto_6848 - SURFACE
      ?auto_6849 - PLACE
      ?auto_6852 - HOIST
      ?auto_6842 - SURFACE
      ?auto_6857 - SURFACE
      ?auto_6836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6835 ?auto_6837 ) ( IS-CRATE ?auto_6833 ) ( not ( = ?auto_6838 ?auto_6837 ) ) ( HOIST-AT ?auto_6839 ?auto_6838 ) ( AVAILABLE ?auto_6839 ) ( SURFACE-AT ?auto_6833 ?auto_6838 ) ( ON ?auto_6833 ?auto_6840 ) ( CLEAR ?auto_6833 ) ( not ( = ?auto_6834 ?auto_6833 ) ) ( not ( = ?auto_6834 ?auto_6840 ) ) ( not ( = ?auto_6833 ?auto_6840 ) ) ( not ( = ?auto_6835 ?auto_6839 ) ) ( IS-CRATE ?auto_6834 ) ( not ( = ?auto_6843 ?auto_6837 ) ) ( HOIST-AT ?auto_6856 ?auto_6843 ) ( AVAILABLE ?auto_6856 ) ( SURFACE-AT ?auto_6834 ?auto_6843 ) ( ON ?auto_6834 ?auto_6855 ) ( CLEAR ?auto_6834 ) ( not ( = ?auto_6831 ?auto_6834 ) ) ( not ( = ?auto_6831 ?auto_6855 ) ) ( not ( = ?auto_6834 ?auto_6855 ) ) ( not ( = ?auto_6835 ?auto_6856 ) ) ( IS-CRATE ?auto_6831 ) ( not ( = ?auto_6847 ?auto_6837 ) ) ( HOIST-AT ?auto_6845 ?auto_6847 ) ( SURFACE-AT ?auto_6831 ?auto_6847 ) ( ON ?auto_6831 ?auto_6854 ) ( CLEAR ?auto_6831 ) ( not ( = ?auto_6832 ?auto_6831 ) ) ( not ( = ?auto_6832 ?auto_6854 ) ) ( not ( = ?auto_6831 ?auto_6854 ) ) ( not ( = ?auto_6835 ?auto_6845 ) ) ( IS-CRATE ?auto_6832 ) ( not ( = ?auto_6850 ?auto_6837 ) ) ( HOIST-AT ?auto_6844 ?auto_6850 ) ( AVAILABLE ?auto_6844 ) ( SURFACE-AT ?auto_6832 ?auto_6850 ) ( ON ?auto_6832 ?auto_6853 ) ( CLEAR ?auto_6832 ) ( not ( = ?auto_6830 ?auto_6832 ) ) ( not ( = ?auto_6830 ?auto_6853 ) ) ( not ( = ?auto_6832 ?auto_6853 ) ) ( not ( = ?auto_6835 ?auto_6844 ) ) ( IS-CRATE ?auto_6830 ) ( AVAILABLE ?auto_6845 ) ( SURFACE-AT ?auto_6830 ?auto_6847 ) ( ON ?auto_6830 ?auto_6841 ) ( CLEAR ?auto_6830 ) ( not ( = ?auto_6829 ?auto_6830 ) ) ( not ( = ?auto_6829 ?auto_6841 ) ) ( not ( = ?auto_6830 ?auto_6841 ) ) ( IS-CRATE ?auto_6829 ) ( not ( = ?auto_6851 ?auto_6837 ) ) ( HOIST-AT ?auto_6846 ?auto_6851 ) ( SURFACE-AT ?auto_6829 ?auto_6851 ) ( ON ?auto_6829 ?auto_6848 ) ( CLEAR ?auto_6829 ) ( not ( = ?auto_6828 ?auto_6829 ) ) ( not ( = ?auto_6828 ?auto_6848 ) ) ( not ( = ?auto_6829 ?auto_6848 ) ) ( not ( = ?auto_6835 ?auto_6846 ) ) ( IS-CRATE ?auto_6828 ) ( not ( = ?auto_6849 ?auto_6837 ) ) ( HOIST-AT ?auto_6852 ?auto_6849 ) ( AVAILABLE ?auto_6852 ) ( SURFACE-AT ?auto_6828 ?auto_6849 ) ( ON ?auto_6828 ?auto_6842 ) ( CLEAR ?auto_6828 ) ( not ( = ?auto_6827 ?auto_6828 ) ) ( not ( = ?auto_6827 ?auto_6842 ) ) ( not ( = ?auto_6828 ?auto_6842 ) ) ( not ( = ?auto_6835 ?auto_6852 ) ) ( SURFACE-AT ?auto_6826 ?auto_6837 ) ( CLEAR ?auto_6826 ) ( IS-CRATE ?auto_6827 ) ( AVAILABLE ?auto_6835 ) ( AVAILABLE ?auto_6846 ) ( SURFACE-AT ?auto_6827 ?auto_6851 ) ( ON ?auto_6827 ?auto_6857 ) ( CLEAR ?auto_6827 ) ( TRUCK-AT ?auto_6836 ?auto_6837 ) ( not ( = ?auto_6826 ?auto_6827 ) ) ( not ( = ?auto_6826 ?auto_6857 ) ) ( not ( = ?auto_6827 ?auto_6857 ) ) ( not ( = ?auto_6826 ?auto_6828 ) ) ( not ( = ?auto_6826 ?auto_6842 ) ) ( not ( = ?auto_6828 ?auto_6857 ) ) ( not ( = ?auto_6849 ?auto_6851 ) ) ( not ( = ?auto_6852 ?auto_6846 ) ) ( not ( = ?auto_6842 ?auto_6857 ) ) ( not ( = ?auto_6826 ?auto_6829 ) ) ( not ( = ?auto_6826 ?auto_6848 ) ) ( not ( = ?auto_6827 ?auto_6829 ) ) ( not ( = ?auto_6827 ?auto_6848 ) ) ( not ( = ?auto_6829 ?auto_6842 ) ) ( not ( = ?auto_6829 ?auto_6857 ) ) ( not ( = ?auto_6848 ?auto_6842 ) ) ( not ( = ?auto_6848 ?auto_6857 ) ) ( not ( = ?auto_6826 ?auto_6830 ) ) ( not ( = ?auto_6826 ?auto_6841 ) ) ( not ( = ?auto_6827 ?auto_6830 ) ) ( not ( = ?auto_6827 ?auto_6841 ) ) ( not ( = ?auto_6828 ?auto_6830 ) ) ( not ( = ?auto_6828 ?auto_6841 ) ) ( not ( = ?auto_6830 ?auto_6848 ) ) ( not ( = ?auto_6830 ?auto_6842 ) ) ( not ( = ?auto_6830 ?auto_6857 ) ) ( not ( = ?auto_6847 ?auto_6851 ) ) ( not ( = ?auto_6847 ?auto_6849 ) ) ( not ( = ?auto_6845 ?auto_6846 ) ) ( not ( = ?auto_6845 ?auto_6852 ) ) ( not ( = ?auto_6841 ?auto_6848 ) ) ( not ( = ?auto_6841 ?auto_6842 ) ) ( not ( = ?auto_6841 ?auto_6857 ) ) ( not ( = ?auto_6826 ?auto_6832 ) ) ( not ( = ?auto_6826 ?auto_6853 ) ) ( not ( = ?auto_6827 ?auto_6832 ) ) ( not ( = ?auto_6827 ?auto_6853 ) ) ( not ( = ?auto_6828 ?auto_6832 ) ) ( not ( = ?auto_6828 ?auto_6853 ) ) ( not ( = ?auto_6829 ?auto_6832 ) ) ( not ( = ?auto_6829 ?auto_6853 ) ) ( not ( = ?auto_6832 ?auto_6841 ) ) ( not ( = ?auto_6832 ?auto_6848 ) ) ( not ( = ?auto_6832 ?auto_6842 ) ) ( not ( = ?auto_6832 ?auto_6857 ) ) ( not ( = ?auto_6850 ?auto_6847 ) ) ( not ( = ?auto_6850 ?auto_6851 ) ) ( not ( = ?auto_6850 ?auto_6849 ) ) ( not ( = ?auto_6844 ?auto_6845 ) ) ( not ( = ?auto_6844 ?auto_6846 ) ) ( not ( = ?auto_6844 ?auto_6852 ) ) ( not ( = ?auto_6853 ?auto_6841 ) ) ( not ( = ?auto_6853 ?auto_6848 ) ) ( not ( = ?auto_6853 ?auto_6842 ) ) ( not ( = ?auto_6853 ?auto_6857 ) ) ( not ( = ?auto_6826 ?auto_6831 ) ) ( not ( = ?auto_6826 ?auto_6854 ) ) ( not ( = ?auto_6827 ?auto_6831 ) ) ( not ( = ?auto_6827 ?auto_6854 ) ) ( not ( = ?auto_6828 ?auto_6831 ) ) ( not ( = ?auto_6828 ?auto_6854 ) ) ( not ( = ?auto_6829 ?auto_6831 ) ) ( not ( = ?auto_6829 ?auto_6854 ) ) ( not ( = ?auto_6830 ?auto_6831 ) ) ( not ( = ?auto_6830 ?auto_6854 ) ) ( not ( = ?auto_6831 ?auto_6853 ) ) ( not ( = ?auto_6831 ?auto_6841 ) ) ( not ( = ?auto_6831 ?auto_6848 ) ) ( not ( = ?auto_6831 ?auto_6842 ) ) ( not ( = ?auto_6831 ?auto_6857 ) ) ( not ( = ?auto_6854 ?auto_6853 ) ) ( not ( = ?auto_6854 ?auto_6841 ) ) ( not ( = ?auto_6854 ?auto_6848 ) ) ( not ( = ?auto_6854 ?auto_6842 ) ) ( not ( = ?auto_6854 ?auto_6857 ) ) ( not ( = ?auto_6826 ?auto_6834 ) ) ( not ( = ?auto_6826 ?auto_6855 ) ) ( not ( = ?auto_6827 ?auto_6834 ) ) ( not ( = ?auto_6827 ?auto_6855 ) ) ( not ( = ?auto_6828 ?auto_6834 ) ) ( not ( = ?auto_6828 ?auto_6855 ) ) ( not ( = ?auto_6829 ?auto_6834 ) ) ( not ( = ?auto_6829 ?auto_6855 ) ) ( not ( = ?auto_6830 ?auto_6834 ) ) ( not ( = ?auto_6830 ?auto_6855 ) ) ( not ( = ?auto_6832 ?auto_6834 ) ) ( not ( = ?auto_6832 ?auto_6855 ) ) ( not ( = ?auto_6834 ?auto_6854 ) ) ( not ( = ?auto_6834 ?auto_6853 ) ) ( not ( = ?auto_6834 ?auto_6841 ) ) ( not ( = ?auto_6834 ?auto_6848 ) ) ( not ( = ?auto_6834 ?auto_6842 ) ) ( not ( = ?auto_6834 ?auto_6857 ) ) ( not ( = ?auto_6843 ?auto_6847 ) ) ( not ( = ?auto_6843 ?auto_6850 ) ) ( not ( = ?auto_6843 ?auto_6851 ) ) ( not ( = ?auto_6843 ?auto_6849 ) ) ( not ( = ?auto_6856 ?auto_6845 ) ) ( not ( = ?auto_6856 ?auto_6844 ) ) ( not ( = ?auto_6856 ?auto_6846 ) ) ( not ( = ?auto_6856 ?auto_6852 ) ) ( not ( = ?auto_6855 ?auto_6854 ) ) ( not ( = ?auto_6855 ?auto_6853 ) ) ( not ( = ?auto_6855 ?auto_6841 ) ) ( not ( = ?auto_6855 ?auto_6848 ) ) ( not ( = ?auto_6855 ?auto_6842 ) ) ( not ( = ?auto_6855 ?auto_6857 ) ) ( not ( = ?auto_6826 ?auto_6833 ) ) ( not ( = ?auto_6826 ?auto_6840 ) ) ( not ( = ?auto_6827 ?auto_6833 ) ) ( not ( = ?auto_6827 ?auto_6840 ) ) ( not ( = ?auto_6828 ?auto_6833 ) ) ( not ( = ?auto_6828 ?auto_6840 ) ) ( not ( = ?auto_6829 ?auto_6833 ) ) ( not ( = ?auto_6829 ?auto_6840 ) ) ( not ( = ?auto_6830 ?auto_6833 ) ) ( not ( = ?auto_6830 ?auto_6840 ) ) ( not ( = ?auto_6832 ?auto_6833 ) ) ( not ( = ?auto_6832 ?auto_6840 ) ) ( not ( = ?auto_6831 ?auto_6833 ) ) ( not ( = ?auto_6831 ?auto_6840 ) ) ( not ( = ?auto_6833 ?auto_6855 ) ) ( not ( = ?auto_6833 ?auto_6854 ) ) ( not ( = ?auto_6833 ?auto_6853 ) ) ( not ( = ?auto_6833 ?auto_6841 ) ) ( not ( = ?auto_6833 ?auto_6848 ) ) ( not ( = ?auto_6833 ?auto_6842 ) ) ( not ( = ?auto_6833 ?auto_6857 ) ) ( not ( = ?auto_6838 ?auto_6843 ) ) ( not ( = ?auto_6838 ?auto_6847 ) ) ( not ( = ?auto_6838 ?auto_6850 ) ) ( not ( = ?auto_6838 ?auto_6851 ) ) ( not ( = ?auto_6838 ?auto_6849 ) ) ( not ( = ?auto_6839 ?auto_6856 ) ) ( not ( = ?auto_6839 ?auto_6845 ) ) ( not ( = ?auto_6839 ?auto_6844 ) ) ( not ( = ?auto_6839 ?auto_6846 ) ) ( not ( = ?auto_6839 ?auto_6852 ) ) ( not ( = ?auto_6840 ?auto_6855 ) ) ( not ( = ?auto_6840 ?auto_6854 ) ) ( not ( = ?auto_6840 ?auto_6853 ) ) ( not ( = ?auto_6840 ?auto_6841 ) ) ( not ( = ?auto_6840 ?auto_6848 ) ) ( not ( = ?auto_6840 ?auto_6842 ) ) ( not ( = ?auto_6840 ?auto_6857 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6826 ?auto_6827 ?auto_6828 ?auto_6829 ?auto_6830 ?auto_6832 ?auto_6831 ?auto_6834 )
      ( MAKE-1CRATE ?auto_6834 ?auto_6833 )
      ( MAKE-8CRATE-VERIFY ?auto_6826 ?auto_6827 ?auto_6828 ?auto_6829 ?auto_6830 ?auto_6832 ?auto_6831 ?auto_6834 ?auto_6833 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6860 - SURFACE
      ?auto_6861 - SURFACE
    )
    :vars
    (
      ?auto_6862 - HOIST
      ?auto_6863 - PLACE
      ?auto_6865 - PLACE
      ?auto_6866 - HOIST
      ?auto_6867 - SURFACE
      ?auto_6864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6862 ?auto_6863 ) ( SURFACE-AT ?auto_6860 ?auto_6863 ) ( CLEAR ?auto_6860 ) ( IS-CRATE ?auto_6861 ) ( AVAILABLE ?auto_6862 ) ( not ( = ?auto_6865 ?auto_6863 ) ) ( HOIST-AT ?auto_6866 ?auto_6865 ) ( AVAILABLE ?auto_6866 ) ( SURFACE-AT ?auto_6861 ?auto_6865 ) ( ON ?auto_6861 ?auto_6867 ) ( CLEAR ?auto_6861 ) ( TRUCK-AT ?auto_6864 ?auto_6863 ) ( not ( = ?auto_6860 ?auto_6861 ) ) ( not ( = ?auto_6860 ?auto_6867 ) ) ( not ( = ?auto_6861 ?auto_6867 ) ) ( not ( = ?auto_6862 ?auto_6866 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6864 ?auto_6863 ?auto_6865 )
      ( !LIFT ?auto_6866 ?auto_6861 ?auto_6867 ?auto_6865 )
      ( !LOAD ?auto_6866 ?auto_6861 ?auto_6864 ?auto_6865 )
      ( !DRIVE ?auto_6864 ?auto_6865 ?auto_6863 )
      ( !UNLOAD ?auto_6862 ?auto_6861 ?auto_6864 ?auto_6863 )
      ( !DROP ?auto_6862 ?auto_6861 ?auto_6860 ?auto_6863 )
      ( MAKE-1CRATE-VERIFY ?auto_6860 ?auto_6861 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_6878 - SURFACE
      ?auto_6879 - SURFACE
      ?auto_6880 - SURFACE
      ?auto_6881 - SURFACE
      ?auto_6882 - SURFACE
      ?auto_6885 - SURFACE
      ?auto_6883 - SURFACE
      ?auto_6887 - SURFACE
      ?auto_6886 - SURFACE
      ?auto_6884 - SURFACE
    )
    :vars
    (
      ?auto_6893 - HOIST
      ?auto_6889 - PLACE
      ?auto_6888 - PLACE
      ?auto_6890 - HOIST
      ?auto_6892 - SURFACE
      ?auto_6902 - PLACE
      ?auto_6908 - HOIST
      ?auto_6907 - SURFACE
      ?auto_6905 - PLACE
      ?auto_6911 - HOIST
      ?auto_6903 - SURFACE
      ?auto_6899 - PLACE
      ?auto_6901 - HOIST
      ?auto_6897 - SURFACE
      ?auto_6896 - PLACE
      ?auto_6906 - HOIST
      ?auto_6909 - SURFACE
      ?auto_6913 - SURFACE
      ?auto_6894 - PLACE
      ?auto_6900 - HOIST
      ?auto_6898 - SURFACE
      ?auto_6910 - PLACE
      ?auto_6895 - HOIST
      ?auto_6904 - SURFACE
      ?auto_6912 - SURFACE
      ?auto_6891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6893 ?auto_6889 ) ( IS-CRATE ?auto_6884 ) ( not ( = ?auto_6888 ?auto_6889 ) ) ( HOIST-AT ?auto_6890 ?auto_6888 ) ( AVAILABLE ?auto_6890 ) ( SURFACE-AT ?auto_6884 ?auto_6888 ) ( ON ?auto_6884 ?auto_6892 ) ( CLEAR ?auto_6884 ) ( not ( = ?auto_6886 ?auto_6884 ) ) ( not ( = ?auto_6886 ?auto_6892 ) ) ( not ( = ?auto_6884 ?auto_6892 ) ) ( not ( = ?auto_6893 ?auto_6890 ) ) ( IS-CRATE ?auto_6886 ) ( not ( = ?auto_6902 ?auto_6889 ) ) ( HOIST-AT ?auto_6908 ?auto_6902 ) ( AVAILABLE ?auto_6908 ) ( SURFACE-AT ?auto_6886 ?auto_6902 ) ( ON ?auto_6886 ?auto_6907 ) ( CLEAR ?auto_6886 ) ( not ( = ?auto_6887 ?auto_6886 ) ) ( not ( = ?auto_6887 ?auto_6907 ) ) ( not ( = ?auto_6886 ?auto_6907 ) ) ( not ( = ?auto_6893 ?auto_6908 ) ) ( IS-CRATE ?auto_6887 ) ( not ( = ?auto_6905 ?auto_6889 ) ) ( HOIST-AT ?auto_6911 ?auto_6905 ) ( AVAILABLE ?auto_6911 ) ( SURFACE-AT ?auto_6887 ?auto_6905 ) ( ON ?auto_6887 ?auto_6903 ) ( CLEAR ?auto_6887 ) ( not ( = ?auto_6883 ?auto_6887 ) ) ( not ( = ?auto_6883 ?auto_6903 ) ) ( not ( = ?auto_6887 ?auto_6903 ) ) ( not ( = ?auto_6893 ?auto_6911 ) ) ( IS-CRATE ?auto_6883 ) ( not ( = ?auto_6899 ?auto_6889 ) ) ( HOIST-AT ?auto_6901 ?auto_6899 ) ( SURFACE-AT ?auto_6883 ?auto_6899 ) ( ON ?auto_6883 ?auto_6897 ) ( CLEAR ?auto_6883 ) ( not ( = ?auto_6885 ?auto_6883 ) ) ( not ( = ?auto_6885 ?auto_6897 ) ) ( not ( = ?auto_6883 ?auto_6897 ) ) ( not ( = ?auto_6893 ?auto_6901 ) ) ( IS-CRATE ?auto_6885 ) ( not ( = ?auto_6896 ?auto_6889 ) ) ( HOIST-AT ?auto_6906 ?auto_6896 ) ( AVAILABLE ?auto_6906 ) ( SURFACE-AT ?auto_6885 ?auto_6896 ) ( ON ?auto_6885 ?auto_6909 ) ( CLEAR ?auto_6885 ) ( not ( = ?auto_6882 ?auto_6885 ) ) ( not ( = ?auto_6882 ?auto_6909 ) ) ( not ( = ?auto_6885 ?auto_6909 ) ) ( not ( = ?auto_6893 ?auto_6906 ) ) ( IS-CRATE ?auto_6882 ) ( AVAILABLE ?auto_6901 ) ( SURFACE-AT ?auto_6882 ?auto_6899 ) ( ON ?auto_6882 ?auto_6913 ) ( CLEAR ?auto_6882 ) ( not ( = ?auto_6881 ?auto_6882 ) ) ( not ( = ?auto_6881 ?auto_6913 ) ) ( not ( = ?auto_6882 ?auto_6913 ) ) ( IS-CRATE ?auto_6881 ) ( not ( = ?auto_6894 ?auto_6889 ) ) ( HOIST-AT ?auto_6900 ?auto_6894 ) ( SURFACE-AT ?auto_6881 ?auto_6894 ) ( ON ?auto_6881 ?auto_6898 ) ( CLEAR ?auto_6881 ) ( not ( = ?auto_6880 ?auto_6881 ) ) ( not ( = ?auto_6880 ?auto_6898 ) ) ( not ( = ?auto_6881 ?auto_6898 ) ) ( not ( = ?auto_6893 ?auto_6900 ) ) ( IS-CRATE ?auto_6880 ) ( not ( = ?auto_6910 ?auto_6889 ) ) ( HOIST-AT ?auto_6895 ?auto_6910 ) ( AVAILABLE ?auto_6895 ) ( SURFACE-AT ?auto_6880 ?auto_6910 ) ( ON ?auto_6880 ?auto_6904 ) ( CLEAR ?auto_6880 ) ( not ( = ?auto_6879 ?auto_6880 ) ) ( not ( = ?auto_6879 ?auto_6904 ) ) ( not ( = ?auto_6880 ?auto_6904 ) ) ( not ( = ?auto_6893 ?auto_6895 ) ) ( SURFACE-AT ?auto_6878 ?auto_6889 ) ( CLEAR ?auto_6878 ) ( IS-CRATE ?auto_6879 ) ( AVAILABLE ?auto_6893 ) ( AVAILABLE ?auto_6900 ) ( SURFACE-AT ?auto_6879 ?auto_6894 ) ( ON ?auto_6879 ?auto_6912 ) ( CLEAR ?auto_6879 ) ( TRUCK-AT ?auto_6891 ?auto_6889 ) ( not ( = ?auto_6878 ?auto_6879 ) ) ( not ( = ?auto_6878 ?auto_6912 ) ) ( not ( = ?auto_6879 ?auto_6912 ) ) ( not ( = ?auto_6878 ?auto_6880 ) ) ( not ( = ?auto_6878 ?auto_6904 ) ) ( not ( = ?auto_6880 ?auto_6912 ) ) ( not ( = ?auto_6910 ?auto_6894 ) ) ( not ( = ?auto_6895 ?auto_6900 ) ) ( not ( = ?auto_6904 ?auto_6912 ) ) ( not ( = ?auto_6878 ?auto_6881 ) ) ( not ( = ?auto_6878 ?auto_6898 ) ) ( not ( = ?auto_6879 ?auto_6881 ) ) ( not ( = ?auto_6879 ?auto_6898 ) ) ( not ( = ?auto_6881 ?auto_6904 ) ) ( not ( = ?auto_6881 ?auto_6912 ) ) ( not ( = ?auto_6898 ?auto_6904 ) ) ( not ( = ?auto_6898 ?auto_6912 ) ) ( not ( = ?auto_6878 ?auto_6882 ) ) ( not ( = ?auto_6878 ?auto_6913 ) ) ( not ( = ?auto_6879 ?auto_6882 ) ) ( not ( = ?auto_6879 ?auto_6913 ) ) ( not ( = ?auto_6880 ?auto_6882 ) ) ( not ( = ?auto_6880 ?auto_6913 ) ) ( not ( = ?auto_6882 ?auto_6898 ) ) ( not ( = ?auto_6882 ?auto_6904 ) ) ( not ( = ?auto_6882 ?auto_6912 ) ) ( not ( = ?auto_6899 ?auto_6894 ) ) ( not ( = ?auto_6899 ?auto_6910 ) ) ( not ( = ?auto_6901 ?auto_6900 ) ) ( not ( = ?auto_6901 ?auto_6895 ) ) ( not ( = ?auto_6913 ?auto_6898 ) ) ( not ( = ?auto_6913 ?auto_6904 ) ) ( not ( = ?auto_6913 ?auto_6912 ) ) ( not ( = ?auto_6878 ?auto_6885 ) ) ( not ( = ?auto_6878 ?auto_6909 ) ) ( not ( = ?auto_6879 ?auto_6885 ) ) ( not ( = ?auto_6879 ?auto_6909 ) ) ( not ( = ?auto_6880 ?auto_6885 ) ) ( not ( = ?auto_6880 ?auto_6909 ) ) ( not ( = ?auto_6881 ?auto_6885 ) ) ( not ( = ?auto_6881 ?auto_6909 ) ) ( not ( = ?auto_6885 ?auto_6913 ) ) ( not ( = ?auto_6885 ?auto_6898 ) ) ( not ( = ?auto_6885 ?auto_6904 ) ) ( not ( = ?auto_6885 ?auto_6912 ) ) ( not ( = ?auto_6896 ?auto_6899 ) ) ( not ( = ?auto_6896 ?auto_6894 ) ) ( not ( = ?auto_6896 ?auto_6910 ) ) ( not ( = ?auto_6906 ?auto_6901 ) ) ( not ( = ?auto_6906 ?auto_6900 ) ) ( not ( = ?auto_6906 ?auto_6895 ) ) ( not ( = ?auto_6909 ?auto_6913 ) ) ( not ( = ?auto_6909 ?auto_6898 ) ) ( not ( = ?auto_6909 ?auto_6904 ) ) ( not ( = ?auto_6909 ?auto_6912 ) ) ( not ( = ?auto_6878 ?auto_6883 ) ) ( not ( = ?auto_6878 ?auto_6897 ) ) ( not ( = ?auto_6879 ?auto_6883 ) ) ( not ( = ?auto_6879 ?auto_6897 ) ) ( not ( = ?auto_6880 ?auto_6883 ) ) ( not ( = ?auto_6880 ?auto_6897 ) ) ( not ( = ?auto_6881 ?auto_6883 ) ) ( not ( = ?auto_6881 ?auto_6897 ) ) ( not ( = ?auto_6882 ?auto_6883 ) ) ( not ( = ?auto_6882 ?auto_6897 ) ) ( not ( = ?auto_6883 ?auto_6909 ) ) ( not ( = ?auto_6883 ?auto_6913 ) ) ( not ( = ?auto_6883 ?auto_6898 ) ) ( not ( = ?auto_6883 ?auto_6904 ) ) ( not ( = ?auto_6883 ?auto_6912 ) ) ( not ( = ?auto_6897 ?auto_6909 ) ) ( not ( = ?auto_6897 ?auto_6913 ) ) ( not ( = ?auto_6897 ?auto_6898 ) ) ( not ( = ?auto_6897 ?auto_6904 ) ) ( not ( = ?auto_6897 ?auto_6912 ) ) ( not ( = ?auto_6878 ?auto_6887 ) ) ( not ( = ?auto_6878 ?auto_6903 ) ) ( not ( = ?auto_6879 ?auto_6887 ) ) ( not ( = ?auto_6879 ?auto_6903 ) ) ( not ( = ?auto_6880 ?auto_6887 ) ) ( not ( = ?auto_6880 ?auto_6903 ) ) ( not ( = ?auto_6881 ?auto_6887 ) ) ( not ( = ?auto_6881 ?auto_6903 ) ) ( not ( = ?auto_6882 ?auto_6887 ) ) ( not ( = ?auto_6882 ?auto_6903 ) ) ( not ( = ?auto_6885 ?auto_6887 ) ) ( not ( = ?auto_6885 ?auto_6903 ) ) ( not ( = ?auto_6887 ?auto_6897 ) ) ( not ( = ?auto_6887 ?auto_6909 ) ) ( not ( = ?auto_6887 ?auto_6913 ) ) ( not ( = ?auto_6887 ?auto_6898 ) ) ( not ( = ?auto_6887 ?auto_6904 ) ) ( not ( = ?auto_6887 ?auto_6912 ) ) ( not ( = ?auto_6905 ?auto_6899 ) ) ( not ( = ?auto_6905 ?auto_6896 ) ) ( not ( = ?auto_6905 ?auto_6894 ) ) ( not ( = ?auto_6905 ?auto_6910 ) ) ( not ( = ?auto_6911 ?auto_6901 ) ) ( not ( = ?auto_6911 ?auto_6906 ) ) ( not ( = ?auto_6911 ?auto_6900 ) ) ( not ( = ?auto_6911 ?auto_6895 ) ) ( not ( = ?auto_6903 ?auto_6897 ) ) ( not ( = ?auto_6903 ?auto_6909 ) ) ( not ( = ?auto_6903 ?auto_6913 ) ) ( not ( = ?auto_6903 ?auto_6898 ) ) ( not ( = ?auto_6903 ?auto_6904 ) ) ( not ( = ?auto_6903 ?auto_6912 ) ) ( not ( = ?auto_6878 ?auto_6886 ) ) ( not ( = ?auto_6878 ?auto_6907 ) ) ( not ( = ?auto_6879 ?auto_6886 ) ) ( not ( = ?auto_6879 ?auto_6907 ) ) ( not ( = ?auto_6880 ?auto_6886 ) ) ( not ( = ?auto_6880 ?auto_6907 ) ) ( not ( = ?auto_6881 ?auto_6886 ) ) ( not ( = ?auto_6881 ?auto_6907 ) ) ( not ( = ?auto_6882 ?auto_6886 ) ) ( not ( = ?auto_6882 ?auto_6907 ) ) ( not ( = ?auto_6885 ?auto_6886 ) ) ( not ( = ?auto_6885 ?auto_6907 ) ) ( not ( = ?auto_6883 ?auto_6886 ) ) ( not ( = ?auto_6883 ?auto_6907 ) ) ( not ( = ?auto_6886 ?auto_6903 ) ) ( not ( = ?auto_6886 ?auto_6897 ) ) ( not ( = ?auto_6886 ?auto_6909 ) ) ( not ( = ?auto_6886 ?auto_6913 ) ) ( not ( = ?auto_6886 ?auto_6898 ) ) ( not ( = ?auto_6886 ?auto_6904 ) ) ( not ( = ?auto_6886 ?auto_6912 ) ) ( not ( = ?auto_6902 ?auto_6905 ) ) ( not ( = ?auto_6902 ?auto_6899 ) ) ( not ( = ?auto_6902 ?auto_6896 ) ) ( not ( = ?auto_6902 ?auto_6894 ) ) ( not ( = ?auto_6902 ?auto_6910 ) ) ( not ( = ?auto_6908 ?auto_6911 ) ) ( not ( = ?auto_6908 ?auto_6901 ) ) ( not ( = ?auto_6908 ?auto_6906 ) ) ( not ( = ?auto_6908 ?auto_6900 ) ) ( not ( = ?auto_6908 ?auto_6895 ) ) ( not ( = ?auto_6907 ?auto_6903 ) ) ( not ( = ?auto_6907 ?auto_6897 ) ) ( not ( = ?auto_6907 ?auto_6909 ) ) ( not ( = ?auto_6907 ?auto_6913 ) ) ( not ( = ?auto_6907 ?auto_6898 ) ) ( not ( = ?auto_6907 ?auto_6904 ) ) ( not ( = ?auto_6907 ?auto_6912 ) ) ( not ( = ?auto_6878 ?auto_6884 ) ) ( not ( = ?auto_6878 ?auto_6892 ) ) ( not ( = ?auto_6879 ?auto_6884 ) ) ( not ( = ?auto_6879 ?auto_6892 ) ) ( not ( = ?auto_6880 ?auto_6884 ) ) ( not ( = ?auto_6880 ?auto_6892 ) ) ( not ( = ?auto_6881 ?auto_6884 ) ) ( not ( = ?auto_6881 ?auto_6892 ) ) ( not ( = ?auto_6882 ?auto_6884 ) ) ( not ( = ?auto_6882 ?auto_6892 ) ) ( not ( = ?auto_6885 ?auto_6884 ) ) ( not ( = ?auto_6885 ?auto_6892 ) ) ( not ( = ?auto_6883 ?auto_6884 ) ) ( not ( = ?auto_6883 ?auto_6892 ) ) ( not ( = ?auto_6887 ?auto_6884 ) ) ( not ( = ?auto_6887 ?auto_6892 ) ) ( not ( = ?auto_6884 ?auto_6907 ) ) ( not ( = ?auto_6884 ?auto_6903 ) ) ( not ( = ?auto_6884 ?auto_6897 ) ) ( not ( = ?auto_6884 ?auto_6909 ) ) ( not ( = ?auto_6884 ?auto_6913 ) ) ( not ( = ?auto_6884 ?auto_6898 ) ) ( not ( = ?auto_6884 ?auto_6904 ) ) ( not ( = ?auto_6884 ?auto_6912 ) ) ( not ( = ?auto_6888 ?auto_6902 ) ) ( not ( = ?auto_6888 ?auto_6905 ) ) ( not ( = ?auto_6888 ?auto_6899 ) ) ( not ( = ?auto_6888 ?auto_6896 ) ) ( not ( = ?auto_6888 ?auto_6894 ) ) ( not ( = ?auto_6888 ?auto_6910 ) ) ( not ( = ?auto_6890 ?auto_6908 ) ) ( not ( = ?auto_6890 ?auto_6911 ) ) ( not ( = ?auto_6890 ?auto_6901 ) ) ( not ( = ?auto_6890 ?auto_6906 ) ) ( not ( = ?auto_6890 ?auto_6900 ) ) ( not ( = ?auto_6890 ?auto_6895 ) ) ( not ( = ?auto_6892 ?auto_6907 ) ) ( not ( = ?auto_6892 ?auto_6903 ) ) ( not ( = ?auto_6892 ?auto_6897 ) ) ( not ( = ?auto_6892 ?auto_6909 ) ) ( not ( = ?auto_6892 ?auto_6913 ) ) ( not ( = ?auto_6892 ?auto_6898 ) ) ( not ( = ?auto_6892 ?auto_6904 ) ) ( not ( = ?auto_6892 ?auto_6912 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6878 ?auto_6879 ?auto_6880 ?auto_6881 ?auto_6882 ?auto_6885 ?auto_6883 ?auto_6887 ?auto_6886 )
      ( MAKE-1CRATE ?auto_6886 ?auto_6884 )
      ( MAKE-9CRATE-VERIFY ?auto_6878 ?auto_6879 ?auto_6880 ?auto_6881 ?auto_6882 ?auto_6885 ?auto_6883 ?auto_6887 ?auto_6886 ?auto_6884 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6916 - SURFACE
      ?auto_6917 - SURFACE
    )
    :vars
    (
      ?auto_6918 - HOIST
      ?auto_6919 - PLACE
      ?auto_6921 - PLACE
      ?auto_6922 - HOIST
      ?auto_6923 - SURFACE
      ?auto_6920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6918 ?auto_6919 ) ( SURFACE-AT ?auto_6916 ?auto_6919 ) ( CLEAR ?auto_6916 ) ( IS-CRATE ?auto_6917 ) ( AVAILABLE ?auto_6918 ) ( not ( = ?auto_6921 ?auto_6919 ) ) ( HOIST-AT ?auto_6922 ?auto_6921 ) ( AVAILABLE ?auto_6922 ) ( SURFACE-AT ?auto_6917 ?auto_6921 ) ( ON ?auto_6917 ?auto_6923 ) ( CLEAR ?auto_6917 ) ( TRUCK-AT ?auto_6920 ?auto_6919 ) ( not ( = ?auto_6916 ?auto_6917 ) ) ( not ( = ?auto_6916 ?auto_6923 ) ) ( not ( = ?auto_6917 ?auto_6923 ) ) ( not ( = ?auto_6918 ?auto_6922 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6920 ?auto_6919 ?auto_6921 )
      ( !LIFT ?auto_6922 ?auto_6917 ?auto_6923 ?auto_6921 )
      ( !LOAD ?auto_6922 ?auto_6917 ?auto_6920 ?auto_6921 )
      ( !DRIVE ?auto_6920 ?auto_6921 ?auto_6919 )
      ( !UNLOAD ?auto_6918 ?auto_6917 ?auto_6920 ?auto_6919 )
      ( !DROP ?auto_6918 ?auto_6917 ?auto_6916 ?auto_6919 )
      ( MAKE-1CRATE-VERIFY ?auto_6916 ?auto_6917 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_6935 - SURFACE
      ?auto_6936 - SURFACE
      ?auto_6937 - SURFACE
      ?auto_6938 - SURFACE
      ?auto_6939 - SURFACE
      ?auto_6942 - SURFACE
      ?auto_6940 - SURFACE
      ?auto_6944 - SURFACE
      ?auto_6943 - SURFACE
      ?auto_6941 - SURFACE
      ?auto_6945 - SURFACE
    )
    :vars
    (
      ?auto_6948 - HOIST
      ?auto_6949 - PLACE
      ?auto_6950 - PLACE
      ?auto_6947 - HOIST
      ?auto_6951 - SURFACE
      ?auto_6962 - PLACE
      ?auto_6971 - HOIST
      ?auto_6959 - SURFACE
      ?auto_6963 - PLACE
      ?auto_6972 - HOIST
      ?auto_6965 - SURFACE
      ?auto_6967 - PLACE
      ?auto_6969 - HOIST
      ?auto_6964 - SURFACE
      ?auto_6954 - PLACE
      ?auto_6966 - HOIST
      ?auto_6970 - SURFACE
      ?auto_6958 - PLACE
      ?auto_6960 - HOIST
      ?auto_6968 - SURFACE
      ?auto_6956 - SURFACE
      ?auto_6973 - PLACE
      ?auto_6953 - HOIST
      ?auto_6955 - SURFACE
      ?auto_6957 - PLACE
      ?auto_6974 - HOIST
      ?auto_6961 - SURFACE
      ?auto_6952 - SURFACE
      ?auto_6946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6948 ?auto_6949 ) ( IS-CRATE ?auto_6945 ) ( not ( = ?auto_6950 ?auto_6949 ) ) ( HOIST-AT ?auto_6947 ?auto_6950 ) ( AVAILABLE ?auto_6947 ) ( SURFACE-AT ?auto_6945 ?auto_6950 ) ( ON ?auto_6945 ?auto_6951 ) ( CLEAR ?auto_6945 ) ( not ( = ?auto_6941 ?auto_6945 ) ) ( not ( = ?auto_6941 ?auto_6951 ) ) ( not ( = ?auto_6945 ?auto_6951 ) ) ( not ( = ?auto_6948 ?auto_6947 ) ) ( IS-CRATE ?auto_6941 ) ( not ( = ?auto_6962 ?auto_6949 ) ) ( HOIST-AT ?auto_6971 ?auto_6962 ) ( AVAILABLE ?auto_6971 ) ( SURFACE-AT ?auto_6941 ?auto_6962 ) ( ON ?auto_6941 ?auto_6959 ) ( CLEAR ?auto_6941 ) ( not ( = ?auto_6943 ?auto_6941 ) ) ( not ( = ?auto_6943 ?auto_6959 ) ) ( not ( = ?auto_6941 ?auto_6959 ) ) ( not ( = ?auto_6948 ?auto_6971 ) ) ( IS-CRATE ?auto_6943 ) ( not ( = ?auto_6963 ?auto_6949 ) ) ( HOIST-AT ?auto_6972 ?auto_6963 ) ( AVAILABLE ?auto_6972 ) ( SURFACE-AT ?auto_6943 ?auto_6963 ) ( ON ?auto_6943 ?auto_6965 ) ( CLEAR ?auto_6943 ) ( not ( = ?auto_6944 ?auto_6943 ) ) ( not ( = ?auto_6944 ?auto_6965 ) ) ( not ( = ?auto_6943 ?auto_6965 ) ) ( not ( = ?auto_6948 ?auto_6972 ) ) ( IS-CRATE ?auto_6944 ) ( not ( = ?auto_6967 ?auto_6949 ) ) ( HOIST-AT ?auto_6969 ?auto_6967 ) ( AVAILABLE ?auto_6969 ) ( SURFACE-AT ?auto_6944 ?auto_6967 ) ( ON ?auto_6944 ?auto_6964 ) ( CLEAR ?auto_6944 ) ( not ( = ?auto_6940 ?auto_6944 ) ) ( not ( = ?auto_6940 ?auto_6964 ) ) ( not ( = ?auto_6944 ?auto_6964 ) ) ( not ( = ?auto_6948 ?auto_6969 ) ) ( IS-CRATE ?auto_6940 ) ( not ( = ?auto_6954 ?auto_6949 ) ) ( HOIST-AT ?auto_6966 ?auto_6954 ) ( SURFACE-AT ?auto_6940 ?auto_6954 ) ( ON ?auto_6940 ?auto_6970 ) ( CLEAR ?auto_6940 ) ( not ( = ?auto_6942 ?auto_6940 ) ) ( not ( = ?auto_6942 ?auto_6970 ) ) ( not ( = ?auto_6940 ?auto_6970 ) ) ( not ( = ?auto_6948 ?auto_6966 ) ) ( IS-CRATE ?auto_6942 ) ( not ( = ?auto_6958 ?auto_6949 ) ) ( HOIST-AT ?auto_6960 ?auto_6958 ) ( AVAILABLE ?auto_6960 ) ( SURFACE-AT ?auto_6942 ?auto_6958 ) ( ON ?auto_6942 ?auto_6968 ) ( CLEAR ?auto_6942 ) ( not ( = ?auto_6939 ?auto_6942 ) ) ( not ( = ?auto_6939 ?auto_6968 ) ) ( not ( = ?auto_6942 ?auto_6968 ) ) ( not ( = ?auto_6948 ?auto_6960 ) ) ( IS-CRATE ?auto_6939 ) ( AVAILABLE ?auto_6966 ) ( SURFACE-AT ?auto_6939 ?auto_6954 ) ( ON ?auto_6939 ?auto_6956 ) ( CLEAR ?auto_6939 ) ( not ( = ?auto_6938 ?auto_6939 ) ) ( not ( = ?auto_6938 ?auto_6956 ) ) ( not ( = ?auto_6939 ?auto_6956 ) ) ( IS-CRATE ?auto_6938 ) ( not ( = ?auto_6973 ?auto_6949 ) ) ( HOIST-AT ?auto_6953 ?auto_6973 ) ( SURFACE-AT ?auto_6938 ?auto_6973 ) ( ON ?auto_6938 ?auto_6955 ) ( CLEAR ?auto_6938 ) ( not ( = ?auto_6937 ?auto_6938 ) ) ( not ( = ?auto_6937 ?auto_6955 ) ) ( not ( = ?auto_6938 ?auto_6955 ) ) ( not ( = ?auto_6948 ?auto_6953 ) ) ( IS-CRATE ?auto_6937 ) ( not ( = ?auto_6957 ?auto_6949 ) ) ( HOIST-AT ?auto_6974 ?auto_6957 ) ( AVAILABLE ?auto_6974 ) ( SURFACE-AT ?auto_6937 ?auto_6957 ) ( ON ?auto_6937 ?auto_6961 ) ( CLEAR ?auto_6937 ) ( not ( = ?auto_6936 ?auto_6937 ) ) ( not ( = ?auto_6936 ?auto_6961 ) ) ( not ( = ?auto_6937 ?auto_6961 ) ) ( not ( = ?auto_6948 ?auto_6974 ) ) ( SURFACE-AT ?auto_6935 ?auto_6949 ) ( CLEAR ?auto_6935 ) ( IS-CRATE ?auto_6936 ) ( AVAILABLE ?auto_6948 ) ( AVAILABLE ?auto_6953 ) ( SURFACE-AT ?auto_6936 ?auto_6973 ) ( ON ?auto_6936 ?auto_6952 ) ( CLEAR ?auto_6936 ) ( TRUCK-AT ?auto_6946 ?auto_6949 ) ( not ( = ?auto_6935 ?auto_6936 ) ) ( not ( = ?auto_6935 ?auto_6952 ) ) ( not ( = ?auto_6936 ?auto_6952 ) ) ( not ( = ?auto_6935 ?auto_6937 ) ) ( not ( = ?auto_6935 ?auto_6961 ) ) ( not ( = ?auto_6937 ?auto_6952 ) ) ( not ( = ?auto_6957 ?auto_6973 ) ) ( not ( = ?auto_6974 ?auto_6953 ) ) ( not ( = ?auto_6961 ?auto_6952 ) ) ( not ( = ?auto_6935 ?auto_6938 ) ) ( not ( = ?auto_6935 ?auto_6955 ) ) ( not ( = ?auto_6936 ?auto_6938 ) ) ( not ( = ?auto_6936 ?auto_6955 ) ) ( not ( = ?auto_6938 ?auto_6961 ) ) ( not ( = ?auto_6938 ?auto_6952 ) ) ( not ( = ?auto_6955 ?auto_6961 ) ) ( not ( = ?auto_6955 ?auto_6952 ) ) ( not ( = ?auto_6935 ?auto_6939 ) ) ( not ( = ?auto_6935 ?auto_6956 ) ) ( not ( = ?auto_6936 ?auto_6939 ) ) ( not ( = ?auto_6936 ?auto_6956 ) ) ( not ( = ?auto_6937 ?auto_6939 ) ) ( not ( = ?auto_6937 ?auto_6956 ) ) ( not ( = ?auto_6939 ?auto_6955 ) ) ( not ( = ?auto_6939 ?auto_6961 ) ) ( not ( = ?auto_6939 ?auto_6952 ) ) ( not ( = ?auto_6954 ?auto_6973 ) ) ( not ( = ?auto_6954 ?auto_6957 ) ) ( not ( = ?auto_6966 ?auto_6953 ) ) ( not ( = ?auto_6966 ?auto_6974 ) ) ( not ( = ?auto_6956 ?auto_6955 ) ) ( not ( = ?auto_6956 ?auto_6961 ) ) ( not ( = ?auto_6956 ?auto_6952 ) ) ( not ( = ?auto_6935 ?auto_6942 ) ) ( not ( = ?auto_6935 ?auto_6968 ) ) ( not ( = ?auto_6936 ?auto_6942 ) ) ( not ( = ?auto_6936 ?auto_6968 ) ) ( not ( = ?auto_6937 ?auto_6942 ) ) ( not ( = ?auto_6937 ?auto_6968 ) ) ( not ( = ?auto_6938 ?auto_6942 ) ) ( not ( = ?auto_6938 ?auto_6968 ) ) ( not ( = ?auto_6942 ?auto_6956 ) ) ( not ( = ?auto_6942 ?auto_6955 ) ) ( not ( = ?auto_6942 ?auto_6961 ) ) ( not ( = ?auto_6942 ?auto_6952 ) ) ( not ( = ?auto_6958 ?auto_6954 ) ) ( not ( = ?auto_6958 ?auto_6973 ) ) ( not ( = ?auto_6958 ?auto_6957 ) ) ( not ( = ?auto_6960 ?auto_6966 ) ) ( not ( = ?auto_6960 ?auto_6953 ) ) ( not ( = ?auto_6960 ?auto_6974 ) ) ( not ( = ?auto_6968 ?auto_6956 ) ) ( not ( = ?auto_6968 ?auto_6955 ) ) ( not ( = ?auto_6968 ?auto_6961 ) ) ( not ( = ?auto_6968 ?auto_6952 ) ) ( not ( = ?auto_6935 ?auto_6940 ) ) ( not ( = ?auto_6935 ?auto_6970 ) ) ( not ( = ?auto_6936 ?auto_6940 ) ) ( not ( = ?auto_6936 ?auto_6970 ) ) ( not ( = ?auto_6937 ?auto_6940 ) ) ( not ( = ?auto_6937 ?auto_6970 ) ) ( not ( = ?auto_6938 ?auto_6940 ) ) ( not ( = ?auto_6938 ?auto_6970 ) ) ( not ( = ?auto_6939 ?auto_6940 ) ) ( not ( = ?auto_6939 ?auto_6970 ) ) ( not ( = ?auto_6940 ?auto_6968 ) ) ( not ( = ?auto_6940 ?auto_6956 ) ) ( not ( = ?auto_6940 ?auto_6955 ) ) ( not ( = ?auto_6940 ?auto_6961 ) ) ( not ( = ?auto_6940 ?auto_6952 ) ) ( not ( = ?auto_6970 ?auto_6968 ) ) ( not ( = ?auto_6970 ?auto_6956 ) ) ( not ( = ?auto_6970 ?auto_6955 ) ) ( not ( = ?auto_6970 ?auto_6961 ) ) ( not ( = ?auto_6970 ?auto_6952 ) ) ( not ( = ?auto_6935 ?auto_6944 ) ) ( not ( = ?auto_6935 ?auto_6964 ) ) ( not ( = ?auto_6936 ?auto_6944 ) ) ( not ( = ?auto_6936 ?auto_6964 ) ) ( not ( = ?auto_6937 ?auto_6944 ) ) ( not ( = ?auto_6937 ?auto_6964 ) ) ( not ( = ?auto_6938 ?auto_6944 ) ) ( not ( = ?auto_6938 ?auto_6964 ) ) ( not ( = ?auto_6939 ?auto_6944 ) ) ( not ( = ?auto_6939 ?auto_6964 ) ) ( not ( = ?auto_6942 ?auto_6944 ) ) ( not ( = ?auto_6942 ?auto_6964 ) ) ( not ( = ?auto_6944 ?auto_6970 ) ) ( not ( = ?auto_6944 ?auto_6968 ) ) ( not ( = ?auto_6944 ?auto_6956 ) ) ( not ( = ?auto_6944 ?auto_6955 ) ) ( not ( = ?auto_6944 ?auto_6961 ) ) ( not ( = ?auto_6944 ?auto_6952 ) ) ( not ( = ?auto_6967 ?auto_6954 ) ) ( not ( = ?auto_6967 ?auto_6958 ) ) ( not ( = ?auto_6967 ?auto_6973 ) ) ( not ( = ?auto_6967 ?auto_6957 ) ) ( not ( = ?auto_6969 ?auto_6966 ) ) ( not ( = ?auto_6969 ?auto_6960 ) ) ( not ( = ?auto_6969 ?auto_6953 ) ) ( not ( = ?auto_6969 ?auto_6974 ) ) ( not ( = ?auto_6964 ?auto_6970 ) ) ( not ( = ?auto_6964 ?auto_6968 ) ) ( not ( = ?auto_6964 ?auto_6956 ) ) ( not ( = ?auto_6964 ?auto_6955 ) ) ( not ( = ?auto_6964 ?auto_6961 ) ) ( not ( = ?auto_6964 ?auto_6952 ) ) ( not ( = ?auto_6935 ?auto_6943 ) ) ( not ( = ?auto_6935 ?auto_6965 ) ) ( not ( = ?auto_6936 ?auto_6943 ) ) ( not ( = ?auto_6936 ?auto_6965 ) ) ( not ( = ?auto_6937 ?auto_6943 ) ) ( not ( = ?auto_6937 ?auto_6965 ) ) ( not ( = ?auto_6938 ?auto_6943 ) ) ( not ( = ?auto_6938 ?auto_6965 ) ) ( not ( = ?auto_6939 ?auto_6943 ) ) ( not ( = ?auto_6939 ?auto_6965 ) ) ( not ( = ?auto_6942 ?auto_6943 ) ) ( not ( = ?auto_6942 ?auto_6965 ) ) ( not ( = ?auto_6940 ?auto_6943 ) ) ( not ( = ?auto_6940 ?auto_6965 ) ) ( not ( = ?auto_6943 ?auto_6964 ) ) ( not ( = ?auto_6943 ?auto_6970 ) ) ( not ( = ?auto_6943 ?auto_6968 ) ) ( not ( = ?auto_6943 ?auto_6956 ) ) ( not ( = ?auto_6943 ?auto_6955 ) ) ( not ( = ?auto_6943 ?auto_6961 ) ) ( not ( = ?auto_6943 ?auto_6952 ) ) ( not ( = ?auto_6963 ?auto_6967 ) ) ( not ( = ?auto_6963 ?auto_6954 ) ) ( not ( = ?auto_6963 ?auto_6958 ) ) ( not ( = ?auto_6963 ?auto_6973 ) ) ( not ( = ?auto_6963 ?auto_6957 ) ) ( not ( = ?auto_6972 ?auto_6969 ) ) ( not ( = ?auto_6972 ?auto_6966 ) ) ( not ( = ?auto_6972 ?auto_6960 ) ) ( not ( = ?auto_6972 ?auto_6953 ) ) ( not ( = ?auto_6972 ?auto_6974 ) ) ( not ( = ?auto_6965 ?auto_6964 ) ) ( not ( = ?auto_6965 ?auto_6970 ) ) ( not ( = ?auto_6965 ?auto_6968 ) ) ( not ( = ?auto_6965 ?auto_6956 ) ) ( not ( = ?auto_6965 ?auto_6955 ) ) ( not ( = ?auto_6965 ?auto_6961 ) ) ( not ( = ?auto_6965 ?auto_6952 ) ) ( not ( = ?auto_6935 ?auto_6941 ) ) ( not ( = ?auto_6935 ?auto_6959 ) ) ( not ( = ?auto_6936 ?auto_6941 ) ) ( not ( = ?auto_6936 ?auto_6959 ) ) ( not ( = ?auto_6937 ?auto_6941 ) ) ( not ( = ?auto_6937 ?auto_6959 ) ) ( not ( = ?auto_6938 ?auto_6941 ) ) ( not ( = ?auto_6938 ?auto_6959 ) ) ( not ( = ?auto_6939 ?auto_6941 ) ) ( not ( = ?auto_6939 ?auto_6959 ) ) ( not ( = ?auto_6942 ?auto_6941 ) ) ( not ( = ?auto_6942 ?auto_6959 ) ) ( not ( = ?auto_6940 ?auto_6941 ) ) ( not ( = ?auto_6940 ?auto_6959 ) ) ( not ( = ?auto_6944 ?auto_6941 ) ) ( not ( = ?auto_6944 ?auto_6959 ) ) ( not ( = ?auto_6941 ?auto_6965 ) ) ( not ( = ?auto_6941 ?auto_6964 ) ) ( not ( = ?auto_6941 ?auto_6970 ) ) ( not ( = ?auto_6941 ?auto_6968 ) ) ( not ( = ?auto_6941 ?auto_6956 ) ) ( not ( = ?auto_6941 ?auto_6955 ) ) ( not ( = ?auto_6941 ?auto_6961 ) ) ( not ( = ?auto_6941 ?auto_6952 ) ) ( not ( = ?auto_6962 ?auto_6963 ) ) ( not ( = ?auto_6962 ?auto_6967 ) ) ( not ( = ?auto_6962 ?auto_6954 ) ) ( not ( = ?auto_6962 ?auto_6958 ) ) ( not ( = ?auto_6962 ?auto_6973 ) ) ( not ( = ?auto_6962 ?auto_6957 ) ) ( not ( = ?auto_6971 ?auto_6972 ) ) ( not ( = ?auto_6971 ?auto_6969 ) ) ( not ( = ?auto_6971 ?auto_6966 ) ) ( not ( = ?auto_6971 ?auto_6960 ) ) ( not ( = ?auto_6971 ?auto_6953 ) ) ( not ( = ?auto_6971 ?auto_6974 ) ) ( not ( = ?auto_6959 ?auto_6965 ) ) ( not ( = ?auto_6959 ?auto_6964 ) ) ( not ( = ?auto_6959 ?auto_6970 ) ) ( not ( = ?auto_6959 ?auto_6968 ) ) ( not ( = ?auto_6959 ?auto_6956 ) ) ( not ( = ?auto_6959 ?auto_6955 ) ) ( not ( = ?auto_6959 ?auto_6961 ) ) ( not ( = ?auto_6959 ?auto_6952 ) ) ( not ( = ?auto_6935 ?auto_6945 ) ) ( not ( = ?auto_6935 ?auto_6951 ) ) ( not ( = ?auto_6936 ?auto_6945 ) ) ( not ( = ?auto_6936 ?auto_6951 ) ) ( not ( = ?auto_6937 ?auto_6945 ) ) ( not ( = ?auto_6937 ?auto_6951 ) ) ( not ( = ?auto_6938 ?auto_6945 ) ) ( not ( = ?auto_6938 ?auto_6951 ) ) ( not ( = ?auto_6939 ?auto_6945 ) ) ( not ( = ?auto_6939 ?auto_6951 ) ) ( not ( = ?auto_6942 ?auto_6945 ) ) ( not ( = ?auto_6942 ?auto_6951 ) ) ( not ( = ?auto_6940 ?auto_6945 ) ) ( not ( = ?auto_6940 ?auto_6951 ) ) ( not ( = ?auto_6944 ?auto_6945 ) ) ( not ( = ?auto_6944 ?auto_6951 ) ) ( not ( = ?auto_6943 ?auto_6945 ) ) ( not ( = ?auto_6943 ?auto_6951 ) ) ( not ( = ?auto_6945 ?auto_6959 ) ) ( not ( = ?auto_6945 ?auto_6965 ) ) ( not ( = ?auto_6945 ?auto_6964 ) ) ( not ( = ?auto_6945 ?auto_6970 ) ) ( not ( = ?auto_6945 ?auto_6968 ) ) ( not ( = ?auto_6945 ?auto_6956 ) ) ( not ( = ?auto_6945 ?auto_6955 ) ) ( not ( = ?auto_6945 ?auto_6961 ) ) ( not ( = ?auto_6945 ?auto_6952 ) ) ( not ( = ?auto_6950 ?auto_6962 ) ) ( not ( = ?auto_6950 ?auto_6963 ) ) ( not ( = ?auto_6950 ?auto_6967 ) ) ( not ( = ?auto_6950 ?auto_6954 ) ) ( not ( = ?auto_6950 ?auto_6958 ) ) ( not ( = ?auto_6950 ?auto_6973 ) ) ( not ( = ?auto_6950 ?auto_6957 ) ) ( not ( = ?auto_6947 ?auto_6971 ) ) ( not ( = ?auto_6947 ?auto_6972 ) ) ( not ( = ?auto_6947 ?auto_6969 ) ) ( not ( = ?auto_6947 ?auto_6966 ) ) ( not ( = ?auto_6947 ?auto_6960 ) ) ( not ( = ?auto_6947 ?auto_6953 ) ) ( not ( = ?auto_6947 ?auto_6974 ) ) ( not ( = ?auto_6951 ?auto_6959 ) ) ( not ( = ?auto_6951 ?auto_6965 ) ) ( not ( = ?auto_6951 ?auto_6964 ) ) ( not ( = ?auto_6951 ?auto_6970 ) ) ( not ( = ?auto_6951 ?auto_6968 ) ) ( not ( = ?auto_6951 ?auto_6956 ) ) ( not ( = ?auto_6951 ?auto_6955 ) ) ( not ( = ?auto_6951 ?auto_6961 ) ) ( not ( = ?auto_6951 ?auto_6952 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_6935 ?auto_6936 ?auto_6937 ?auto_6938 ?auto_6939 ?auto_6942 ?auto_6940 ?auto_6944 ?auto_6943 ?auto_6941 )
      ( MAKE-1CRATE ?auto_6941 ?auto_6945 )
      ( MAKE-10CRATE-VERIFY ?auto_6935 ?auto_6936 ?auto_6937 ?auto_6938 ?auto_6939 ?auto_6942 ?auto_6940 ?auto_6944 ?auto_6943 ?auto_6941 ?auto_6945 ) )
  )

)

