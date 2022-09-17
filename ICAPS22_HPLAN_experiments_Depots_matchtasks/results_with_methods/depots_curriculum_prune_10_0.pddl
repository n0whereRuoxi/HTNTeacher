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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6609 - SURFACE
      ?auto_6610 - SURFACE
      ?auto_6611 - SURFACE
    )
    :vars
    (
      ?auto_6617 - HOIST
      ?auto_6616 - PLACE
      ?auto_6615 - PLACE
      ?auto_6613 - HOIST
      ?auto_6612 - SURFACE
      ?auto_6619 - PLACE
      ?auto_6620 - HOIST
      ?auto_6618 - SURFACE
      ?auto_6614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6617 ?auto_6616 ) ( IS-CRATE ?auto_6611 ) ( not ( = ?auto_6615 ?auto_6616 ) ) ( HOIST-AT ?auto_6613 ?auto_6615 ) ( AVAILABLE ?auto_6613 ) ( SURFACE-AT ?auto_6611 ?auto_6615 ) ( ON ?auto_6611 ?auto_6612 ) ( CLEAR ?auto_6611 ) ( not ( = ?auto_6610 ?auto_6611 ) ) ( not ( = ?auto_6610 ?auto_6612 ) ) ( not ( = ?auto_6611 ?auto_6612 ) ) ( not ( = ?auto_6617 ?auto_6613 ) ) ( SURFACE-AT ?auto_6609 ?auto_6616 ) ( CLEAR ?auto_6609 ) ( IS-CRATE ?auto_6610 ) ( AVAILABLE ?auto_6617 ) ( not ( = ?auto_6619 ?auto_6616 ) ) ( HOIST-AT ?auto_6620 ?auto_6619 ) ( AVAILABLE ?auto_6620 ) ( SURFACE-AT ?auto_6610 ?auto_6619 ) ( ON ?auto_6610 ?auto_6618 ) ( CLEAR ?auto_6610 ) ( TRUCK-AT ?auto_6614 ?auto_6616 ) ( not ( = ?auto_6609 ?auto_6610 ) ) ( not ( = ?auto_6609 ?auto_6618 ) ) ( not ( = ?auto_6610 ?auto_6618 ) ) ( not ( = ?auto_6617 ?auto_6620 ) ) ( not ( = ?auto_6609 ?auto_6611 ) ) ( not ( = ?auto_6609 ?auto_6612 ) ) ( not ( = ?auto_6611 ?auto_6618 ) ) ( not ( = ?auto_6615 ?auto_6619 ) ) ( not ( = ?auto_6613 ?auto_6620 ) ) ( not ( = ?auto_6612 ?auto_6618 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6609 ?auto_6610 )
      ( MAKE-1CRATE ?auto_6610 ?auto_6611 )
      ( MAKE-2CRATE-VERIFY ?auto_6609 ?auto_6610 ?auto_6611 ) )
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
      ?auto_6641 - PLACE
      ?auto_6639 - PLACE
      ?auto_6644 - HOIST
      ?auto_6643 - SURFACE
      ?auto_6648 - PLACE
      ?auto_6646 - HOIST
      ?auto_6645 - SURFACE
      ?auto_6647 - SURFACE
      ?auto_6642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6640 ?auto_6641 ) ( IS-CRATE ?auto_6638 ) ( not ( = ?auto_6639 ?auto_6641 ) ) ( HOIST-AT ?auto_6644 ?auto_6639 ) ( SURFACE-AT ?auto_6638 ?auto_6639 ) ( ON ?auto_6638 ?auto_6643 ) ( CLEAR ?auto_6638 ) ( not ( = ?auto_6637 ?auto_6638 ) ) ( not ( = ?auto_6637 ?auto_6643 ) ) ( not ( = ?auto_6638 ?auto_6643 ) ) ( not ( = ?auto_6640 ?auto_6644 ) ) ( IS-CRATE ?auto_6637 ) ( not ( = ?auto_6648 ?auto_6641 ) ) ( HOIST-AT ?auto_6646 ?auto_6648 ) ( AVAILABLE ?auto_6646 ) ( SURFACE-AT ?auto_6637 ?auto_6648 ) ( ON ?auto_6637 ?auto_6645 ) ( CLEAR ?auto_6637 ) ( not ( = ?auto_6636 ?auto_6637 ) ) ( not ( = ?auto_6636 ?auto_6645 ) ) ( not ( = ?auto_6637 ?auto_6645 ) ) ( not ( = ?auto_6640 ?auto_6646 ) ) ( SURFACE-AT ?auto_6635 ?auto_6641 ) ( CLEAR ?auto_6635 ) ( IS-CRATE ?auto_6636 ) ( AVAILABLE ?auto_6640 ) ( AVAILABLE ?auto_6644 ) ( SURFACE-AT ?auto_6636 ?auto_6639 ) ( ON ?auto_6636 ?auto_6647 ) ( CLEAR ?auto_6636 ) ( TRUCK-AT ?auto_6642 ?auto_6641 ) ( not ( = ?auto_6635 ?auto_6636 ) ) ( not ( = ?auto_6635 ?auto_6647 ) ) ( not ( = ?auto_6636 ?auto_6647 ) ) ( not ( = ?auto_6635 ?auto_6637 ) ) ( not ( = ?auto_6635 ?auto_6645 ) ) ( not ( = ?auto_6637 ?auto_6647 ) ) ( not ( = ?auto_6648 ?auto_6639 ) ) ( not ( = ?auto_6646 ?auto_6644 ) ) ( not ( = ?auto_6645 ?auto_6647 ) ) ( not ( = ?auto_6635 ?auto_6638 ) ) ( not ( = ?auto_6635 ?auto_6643 ) ) ( not ( = ?auto_6636 ?auto_6638 ) ) ( not ( = ?auto_6636 ?auto_6643 ) ) ( not ( = ?auto_6638 ?auto_6645 ) ) ( not ( = ?auto_6638 ?auto_6647 ) ) ( not ( = ?auto_6643 ?auto_6645 ) ) ( not ( = ?auto_6643 ?auto_6647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6635 ?auto_6636 ?auto_6637 )
      ( MAKE-1CRATE ?auto_6637 ?auto_6638 )
      ( MAKE-3CRATE-VERIFY ?auto_6635 ?auto_6636 ?auto_6637 ?auto_6638 ) )
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
      ?auto_6674 - HOIST
      ?auto_6673 - PLACE
      ?auto_6670 - PLACE
      ?auto_6669 - HOIST
      ?auto_6671 - SURFACE
      ?auto_6680 - PLACE
      ?auto_6675 - HOIST
      ?auto_6677 - SURFACE
      ?auto_6678 - PLACE
      ?auto_6676 - HOIST
      ?auto_6681 - SURFACE
      ?auto_6679 - SURFACE
      ?auto_6672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6674 ?auto_6673 ) ( IS-CRATE ?auto_6668 ) ( not ( = ?auto_6670 ?auto_6673 ) ) ( HOIST-AT ?auto_6669 ?auto_6670 ) ( AVAILABLE ?auto_6669 ) ( SURFACE-AT ?auto_6668 ?auto_6670 ) ( ON ?auto_6668 ?auto_6671 ) ( CLEAR ?auto_6668 ) ( not ( = ?auto_6667 ?auto_6668 ) ) ( not ( = ?auto_6667 ?auto_6671 ) ) ( not ( = ?auto_6668 ?auto_6671 ) ) ( not ( = ?auto_6674 ?auto_6669 ) ) ( IS-CRATE ?auto_6667 ) ( not ( = ?auto_6680 ?auto_6673 ) ) ( HOIST-AT ?auto_6675 ?auto_6680 ) ( SURFACE-AT ?auto_6667 ?auto_6680 ) ( ON ?auto_6667 ?auto_6677 ) ( CLEAR ?auto_6667 ) ( not ( = ?auto_6666 ?auto_6667 ) ) ( not ( = ?auto_6666 ?auto_6677 ) ) ( not ( = ?auto_6667 ?auto_6677 ) ) ( not ( = ?auto_6674 ?auto_6675 ) ) ( IS-CRATE ?auto_6666 ) ( not ( = ?auto_6678 ?auto_6673 ) ) ( HOIST-AT ?auto_6676 ?auto_6678 ) ( AVAILABLE ?auto_6676 ) ( SURFACE-AT ?auto_6666 ?auto_6678 ) ( ON ?auto_6666 ?auto_6681 ) ( CLEAR ?auto_6666 ) ( not ( = ?auto_6665 ?auto_6666 ) ) ( not ( = ?auto_6665 ?auto_6681 ) ) ( not ( = ?auto_6666 ?auto_6681 ) ) ( not ( = ?auto_6674 ?auto_6676 ) ) ( SURFACE-AT ?auto_6664 ?auto_6673 ) ( CLEAR ?auto_6664 ) ( IS-CRATE ?auto_6665 ) ( AVAILABLE ?auto_6674 ) ( AVAILABLE ?auto_6675 ) ( SURFACE-AT ?auto_6665 ?auto_6680 ) ( ON ?auto_6665 ?auto_6679 ) ( CLEAR ?auto_6665 ) ( TRUCK-AT ?auto_6672 ?auto_6673 ) ( not ( = ?auto_6664 ?auto_6665 ) ) ( not ( = ?auto_6664 ?auto_6679 ) ) ( not ( = ?auto_6665 ?auto_6679 ) ) ( not ( = ?auto_6664 ?auto_6666 ) ) ( not ( = ?auto_6664 ?auto_6681 ) ) ( not ( = ?auto_6666 ?auto_6679 ) ) ( not ( = ?auto_6678 ?auto_6680 ) ) ( not ( = ?auto_6676 ?auto_6675 ) ) ( not ( = ?auto_6681 ?auto_6679 ) ) ( not ( = ?auto_6664 ?auto_6667 ) ) ( not ( = ?auto_6664 ?auto_6677 ) ) ( not ( = ?auto_6665 ?auto_6667 ) ) ( not ( = ?auto_6665 ?auto_6677 ) ) ( not ( = ?auto_6667 ?auto_6681 ) ) ( not ( = ?auto_6667 ?auto_6679 ) ) ( not ( = ?auto_6677 ?auto_6681 ) ) ( not ( = ?auto_6677 ?auto_6679 ) ) ( not ( = ?auto_6664 ?auto_6668 ) ) ( not ( = ?auto_6664 ?auto_6671 ) ) ( not ( = ?auto_6665 ?auto_6668 ) ) ( not ( = ?auto_6665 ?auto_6671 ) ) ( not ( = ?auto_6666 ?auto_6668 ) ) ( not ( = ?auto_6666 ?auto_6671 ) ) ( not ( = ?auto_6668 ?auto_6677 ) ) ( not ( = ?auto_6668 ?auto_6681 ) ) ( not ( = ?auto_6668 ?auto_6679 ) ) ( not ( = ?auto_6670 ?auto_6680 ) ) ( not ( = ?auto_6670 ?auto_6678 ) ) ( not ( = ?auto_6669 ?auto_6675 ) ) ( not ( = ?auto_6669 ?auto_6676 ) ) ( not ( = ?auto_6671 ?auto_6677 ) ) ( not ( = ?auto_6671 ?auto_6681 ) ) ( not ( = ?auto_6671 ?auto_6679 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6664 ?auto_6665 ?auto_6666 ?auto_6667 )
      ( MAKE-1CRATE ?auto_6667 ?auto_6668 )
      ( MAKE-4CRATE-VERIFY ?auto_6664 ?auto_6665 ?auto_6666 ?auto_6667 ?auto_6668 ) )
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
      ?auto_6704 - HOIST
      ?auto_6709 - PLACE
      ?auto_6708 - PLACE
      ?auto_6707 - HOIST
      ?auto_6706 - SURFACE
      ?auto_6714 - PLACE
      ?auto_6717 - HOIST
      ?auto_6718 - SURFACE
      ?auto_6711 - PLACE
      ?auto_6712 - HOIST
      ?auto_6713 - SURFACE
      ?auto_6716 - PLACE
      ?auto_6715 - HOIST
      ?auto_6719 - SURFACE
      ?auto_6710 - SURFACE
      ?auto_6705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6704 ?auto_6709 ) ( IS-CRATE ?auto_6703 ) ( not ( = ?auto_6708 ?auto_6709 ) ) ( HOIST-AT ?auto_6707 ?auto_6708 ) ( AVAILABLE ?auto_6707 ) ( SURFACE-AT ?auto_6703 ?auto_6708 ) ( ON ?auto_6703 ?auto_6706 ) ( CLEAR ?auto_6703 ) ( not ( = ?auto_6702 ?auto_6703 ) ) ( not ( = ?auto_6702 ?auto_6706 ) ) ( not ( = ?auto_6703 ?auto_6706 ) ) ( not ( = ?auto_6704 ?auto_6707 ) ) ( IS-CRATE ?auto_6702 ) ( not ( = ?auto_6714 ?auto_6709 ) ) ( HOIST-AT ?auto_6717 ?auto_6714 ) ( AVAILABLE ?auto_6717 ) ( SURFACE-AT ?auto_6702 ?auto_6714 ) ( ON ?auto_6702 ?auto_6718 ) ( CLEAR ?auto_6702 ) ( not ( = ?auto_6701 ?auto_6702 ) ) ( not ( = ?auto_6701 ?auto_6718 ) ) ( not ( = ?auto_6702 ?auto_6718 ) ) ( not ( = ?auto_6704 ?auto_6717 ) ) ( IS-CRATE ?auto_6701 ) ( not ( = ?auto_6711 ?auto_6709 ) ) ( HOIST-AT ?auto_6712 ?auto_6711 ) ( SURFACE-AT ?auto_6701 ?auto_6711 ) ( ON ?auto_6701 ?auto_6713 ) ( CLEAR ?auto_6701 ) ( not ( = ?auto_6700 ?auto_6701 ) ) ( not ( = ?auto_6700 ?auto_6713 ) ) ( not ( = ?auto_6701 ?auto_6713 ) ) ( not ( = ?auto_6704 ?auto_6712 ) ) ( IS-CRATE ?auto_6700 ) ( not ( = ?auto_6716 ?auto_6709 ) ) ( HOIST-AT ?auto_6715 ?auto_6716 ) ( AVAILABLE ?auto_6715 ) ( SURFACE-AT ?auto_6700 ?auto_6716 ) ( ON ?auto_6700 ?auto_6719 ) ( CLEAR ?auto_6700 ) ( not ( = ?auto_6699 ?auto_6700 ) ) ( not ( = ?auto_6699 ?auto_6719 ) ) ( not ( = ?auto_6700 ?auto_6719 ) ) ( not ( = ?auto_6704 ?auto_6715 ) ) ( SURFACE-AT ?auto_6698 ?auto_6709 ) ( CLEAR ?auto_6698 ) ( IS-CRATE ?auto_6699 ) ( AVAILABLE ?auto_6704 ) ( AVAILABLE ?auto_6712 ) ( SURFACE-AT ?auto_6699 ?auto_6711 ) ( ON ?auto_6699 ?auto_6710 ) ( CLEAR ?auto_6699 ) ( TRUCK-AT ?auto_6705 ?auto_6709 ) ( not ( = ?auto_6698 ?auto_6699 ) ) ( not ( = ?auto_6698 ?auto_6710 ) ) ( not ( = ?auto_6699 ?auto_6710 ) ) ( not ( = ?auto_6698 ?auto_6700 ) ) ( not ( = ?auto_6698 ?auto_6719 ) ) ( not ( = ?auto_6700 ?auto_6710 ) ) ( not ( = ?auto_6716 ?auto_6711 ) ) ( not ( = ?auto_6715 ?auto_6712 ) ) ( not ( = ?auto_6719 ?auto_6710 ) ) ( not ( = ?auto_6698 ?auto_6701 ) ) ( not ( = ?auto_6698 ?auto_6713 ) ) ( not ( = ?auto_6699 ?auto_6701 ) ) ( not ( = ?auto_6699 ?auto_6713 ) ) ( not ( = ?auto_6701 ?auto_6719 ) ) ( not ( = ?auto_6701 ?auto_6710 ) ) ( not ( = ?auto_6713 ?auto_6719 ) ) ( not ( = ?auto_6713 ?auto_6710 ) ) ( not ( = ?auto_6698 ?auto_6702 ) ) ( not ( = ?auto_6698 ?auto_6718 ) ) ( not ( = ?auto_6699 ?auto_6702 ) ) ( not ( = ?auto_6699 ?auto_6718 ) ) ( not ( = ?auto_6700 ?auto_6702 ) ) ( not ( = ?auto_6700 ?auto_6718 ) ) ( not ( = ?auto_6702 ?auto_6713 ) ) ( not ( = ?auto_6702 ?auto_6719 ) ) ( not ( = ?auto_6702 ?auto_6710 ) ) ( not ( = ?auto_6714 ?auto_6711 ) ) ( not ( = ?auto_6714 ?auto_6716 ) ) ( not ( = ?auto_6717 ?auto_6712 ) ) ( not ( = ?auto_6717 ?auto_6715 ) ) ( not ( = ?auto_6718 ?auto_6713 ) ) ( not ( = ?auto_6718 ?auto_6719 ) ) ( not ( = ?auto_6718 ?auto_6710 ) ) ( not ( = ?auto_6698 ?auto_6703 ) ) ( not ( = ?auto_6698 ?auto_6706 ) ) ( not ( = ?auto_6699 ?auto_6703 ) ) ( not ( = ?auto_6699 ?auto_6706 ) ) ( not ( = ?auto_6700 ?auto_6703 ) ) ( not ( = ?auto_6700 ?auto_6706 ) ) ( not ( = ?auto_6701 ?auto_6703 ) ) ( not ( = ?auto_6701 ?auto_6706 ) ) ( not ( = ?auto_6703 ?auto_6718 ) ) ( not ( = ?auto_6703 ?auto_6713 ) ) ( not ( = ?auto_6703 ?auto_6719 ) ) ( not ( = ?auto_6703 ?auto_6710 ) ) ( not ( = ?auto_6708 ?auto_6714 ) ) ( not ( = ?auto_6708 ?auto_6711 ) ) ( not ( = ?auto_6708 ?auto_6716 ) ) ( not ( = ?auto_6707 ?auto_6717 ) ) ( not ( = ?auto_6707 ?auto_6712 ) ) ( not ( = ?auto_6707 ?auto_6715 ) ) ( not ( = ?auto_6706 ?auto_6718 ) ) ( not ( = ?auto_6706 ?auto_6713 ) ) ( not ( = ?auto_6706 ?auto_6719 ) ) ( not ( = ?auto_6706 ?auto_6710 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6698 ?auto_6699 ?auto_6700 ?auto_6701 ?auto_6702 )
      ( MAKE-1CRATE ?auto_6702 ?auto_6703 )
      ( MAKE-5CRATE-VERIFY ?auto_6698 ?auto_6699 ?auto_6700 ?auto_6701 ?auto_6702 ?auto_6703 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_6737 - SURFACE
      ?auto_6738 - SURFACE
      ?auto_6739 - SURFACE
      ?auto_6740 - SURFACE
      ?auto_6741 - SURFACE
      ?auto_6742 - SURFACE
      ?auto_6743 - SURFACE
    )
    :vars
    (
      ?auto_6746 - HOIST
      ?auto_6745 - PLACE
      ?auto_6747 - PLACE
      ?auto_6744 - HOIST
      ?auto_6749 - SURFACE
      ?auto_6752 - PLACE
      ?auto_6753 - HOIST
      ?auto_6755 - SURFACE
      ?auto_6756 - SURFACE
      ?auto_6757 - PLACE
      ?auto_6754 - HOIST
      ?auto_6759 - SURFACE
      ?auto_6760 - PLACE
      ?auto_6758 - HOIST
      ?auto_6751 - SURFACE
      ?auto_6750 - SURFACE
      ?auto_6748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6746 ?auto_6745 ) ( IS-CRATE ?auto_6743 ) ( not ( = ?auto_6747 ?auto_6745 ) ) ( HOIST-AT ?auto_6744 ?auto_6747 ) ( SURFACE-AT ?auto_6743 ?auto_6747 ) ( ON ?auto_6743 ?auto_6749 ) ( CLEAR ?auto_6743 ) ( not ( = ?auto_6742 ?auto_6743 ) ) ( not ( = ?auto_6742 ?auto_6749 ) ) ( not ( = ?auto_6743 ?auto_6749 ) ) ( not ( = ?auto_6746 ?auto_6744 ) ) ( IS-CRATE ?auto_6742 ) ( not ( = ?auto_6752 ?auto_6745 ) ) ( HOIST-AT ?auto_6753 ?auto_6752 ) ( AVAILABLE ?auto_6753 ) ( SURFACE-AT ?auto_6742 ?auto_6752 ) ( ON ?auto_6742 ?auto_6755 ) ( CLEAR ?auto_6742 ) ( not ( = ?auto_6741 ?auto_6742 ) ) ( not ( = ?auto_6741 ?auto_6755 ) ) ( not ( = ?auto_6742 ?auto_6755 ) ) ( not ( = ?auto_6746 ?auto_6753 ) ) ( IS-CRATE ?auto_6741 ) ( AVAILABLE ?auto_6744 ) ( SURFACE-AT ?auto_6741 ?auto_6747 ) ( ON ?auto_6741 ?auto_6756 ) ( CLEAR ?auto_6741 ) ( not ( = ?auto_6740 ?auto_6741 ) ) ( not ( = ?auto_6740 ?auto_6756 ) ) ( not ( = ?auto_6741 ?auto_6756 ) ) ( IS-CRATE ?auto_6740 ) ( not ( = ?auto_6757 ?auto_6745 ) ) ( HOIST-AT ?auto_6754 ?auto_6757 ) ( SURFACE-AT ?auto_6740 ?auto_6757 ) ( ON ?auto_6740 ?auto_6759 ) ( CLEAR ?auto_6740 ) ( not ( = ?auto_6739 ?auto_6740 ) ) ( not ( = ?auto_6739 ?auto_6759 ) ) ( not ( = ?auto_6740 ?auto_6759 ) ) ( not ( = ?auto_6746 ?auto_6754 ) ) ( IS-CRATE ?auto_6739 ) ( not ( = ?auto_6760 ?auto_6745 ) ) ( HOIST-AT ?auto_6758 ?auto_6760 ) ( AVAILABLE ?auto_6758 ) ( SURFACE-AT ?auto_6739 ?auto_6760 ) ( ON ?auto_6739 ?auto_6751 ) ( CLEAR ?auto_6739 ) ( not ( = ?auto_6738 ?auto_6739 ) ) ( not ( = ?auto_6738 ?auto_6751 ) ) ( not ( = ?auto_6739 ?auto_6751 ) ) ( not ( = ?auto_6746 ?auto_6758 ) ) ( SURFACE-AT ?auto_6737 ?auto_6745 ) ( CLEAR ?auto_6737 ) ( IS-CRATE ?auto_6738 ) ( AVAILABLE ?auto_6746 ) ( AVAILABLE ?auto_6754 ) ( SURFACE-AT ?auto_6738 ?auto_6757 ) ( ON ?auto_6738 ?auto_6750 ) ( CLEAR ?auto_6738 ) ( TRUCK-AT ?auto_6748 ?auto_6745 ) ( not ( = ?auto_6737 ?auto_6738 ) ) ( not ( = ?auto_6737 ?auto_6750 ) ) ( not ( = ?auto_6738 ?auto_6750 ) ) ( not ( = ?auto_6737 ?auto_6739 ) ) ( not ( = ?auto_6737 ?auto_6751 ) ) ( not ( = ?auto_6739 ?auto_6750 ) ) ( not ( = ?auto_6760 ?auto_6757 ) ) ( not ( = ?auto_6758 ?auto_6754 ) ) ( not ( = ?auto_6751 ?auto_6750 ) ) ( not ( = ?auto_6737 ?auto_6740 ) ) ( not ( = ?auto_6737 ?auto_6759 ) ) ( not ( = ?auto_6738 ?auto_6740 ) ) ( not ( = ?auto_6738 ?auto_6759 ) ) ( not ( = ?auto_6740 ?auto_6751 ) ) ( not ( = ?auto_6740 ?auto_6750 ) ) ( not ( = ?auto_6759 ?auto_6751 ) ) ( not ( = ?auto_6759 ?auto_6750 ) ) ( not ( = ?auto_6737 ?auto_6741 ) ) ( not ( = ?auto_6737 ?auto_6756 ) ) ( not ( = ?auto_6738 ?auto_6741 ) ) ( not ( = ?auto_6738 ?auto_6756 ) ) ( not ( = ?auto_6739 ?auto_6741 ) ) ( not ( = ?auto_6739 ?auto_6756 ) ) ( not ( = ?auto_6741 ?auto_6759 ) ) ( not ( = ?auto_6741 ?auto_6751 ) ) ( not ( = ?auto_6741 ?auto_6750 ) ) ( not ( = ?auto_6747 ?auto_6757 ) ) ( not ( = ?auto_6747 ?auto_6760 ) ) ( not ( = ?auto_6744 ?auto_6754 ) ) ( not ( = ?auto_6744 ?auto_6758 ) ) ( not ( = ?auto_6756 ?auto_6759 ) ) ( not ( = ?auto_6756 ?auto_6751 ) ) ( not ( = ?auto_6756 ?auto_6750 ) ) ( not ( = ?auto_6737 ?auto_6742 ) ) ( not ( = ?auto_6737 ?auto_6755 ) ) ( not ( = ?auto_6738 ?auto_6742 ) ) ( not ( = ?auto_6738 ?auto_6755 ) ) ( not ( = ?auto_6739 ?auto_6742 ) ) ( not ( = ?auto_6739 ?auto_6755 ) ) ( not ( = ?auto_6740 ?auto_6742 ) ) ( not ( = ?auto_6740 ?auto_6755 ) ) ( not ( = ?auto_6742 ?auto_6756 ) ) ( not ( = ?auto_6742 ?auto_6759 ) ) ( not ( = ?auto_6742 ?auto_6751 ) ) ( not ( = ?auto_6742 ?auto_6750 ) ) ( not ( = ?auto_6752 ?auto_6747 ) ) ( not ( = ?auto_6752 ?auto_6757 ) ) ( not ( = ?auto_6752 ?auto_6760 ) ) ( not ( = ?auto_6753 ?auto_6744 ) ) ( not ( = ?auto_6753 ?auto_6754 ) ) ( not ( = ?auto_6753 ?auto_6758 ) ) ( not ( = ?auto_6755 ?auto_6756 ) ) ( not ( = ?auto_6755 ?auto_6759 ) ) ( not ( = ?auto_6755 ?auto_6751 ) ) ( not ( = ?auto_6755 ?auto_6750 ) ) ( not ( = ?auto_6737 ?auto_6743 ) ) ( not ( = ?auto_6737 ?auto_6749 ) ) ( not ( = ?auto_6738 ?auto_6743 ) ) ( not ( = ?auto_6738 ?auto_6749 ) ) ( not ( = ?auto_6739 ?auto_6743 ) ) ( not ( = ?auto_6739 ?auto_6749 ) ) ( not ( = ?auto_6740 ?auto_6743 ) ) ( not ( = ?auto_6740 ?auto_6749 ) ) ( not ( = ?auto_6741 ?auto_6743 ) ) ( not ( = ?auto_6741 ?auto_6749 ) ) ( not ( = ?auto_6743 ?auto_6755 ) ) ( not ( = ?auto_6743 ?auto_6756 ) ) ( not ( = ?auto_6743 ?auto_6759 ) ) ( not ( = ?auto_6743 ?auto_6751 ) ) ( not ( = ?auto_6743 ?auto_6750 ) ) ( not ( = ?auto_6749 ?auto_6755 ) ) ( not ( = ?auto_6749 ?auto_6756 ) ) ( not ( = ?auto_6749 ?auto_6759 ) ) ( not ( = ?auto_6749 ?auto_6751 ) ) ( not ( = ?auto_6749 ?auto_6750 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6737 ?auto_6738 ?auto_6739 ?auto_6740 ?auto_6741 ?auto_6742 )
      ( MAKE-1CRATE ?auto_6742 ?auto_6743 )
      ( MAKE-6CRATE-VERIFY ?auto_6737 ?auto_6738 ?auto_6739 ?auto_6740 ?auto_6741 ?auto_6742 ?auto_6743 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_6779 - SURFACE
      ?auto_6780 - SURFACE
      ?auto_6781 - SURFACE
      ?auto_6782 - SURFACE
      ?auto_6783 - SURFACE
      ?auto_6784 - SURFACE
      ?auto_6785 - SURFACE
      ?auto_6786 - SURFACE
    )
    :vars
    (
      ?auto_6791 - HOIST
      ?auto_6788 - PLACE
      ?auto_6789 - PLACE
      ?auto_6790 - HOIST
      ?auto_6792 - SURFACE
      ?auto_6794 - PLACE
      ?auto_6797 - HOIST
      ?auto_6793 - SURFACE
      ?auto_6796 - PLACE
      ?auto_6801 - HOIST
      ?auto_6806 - SURFACE
      ?auto_6805 - SURFACE
      ?auto_6804 - PLACE
      ?auto_6795 - HOIST
      ?auto_6798 - SURFACE
      ?auto_6802 - PLACE
      ?auto_6803 - HOIST
      ?auto_6799 - SURFACE
      ?auto_6800 - SURFACE
      ?auto_6787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6791 ?auto_6788 ) ( IS-CRATE ?auto_6786 ) ( not ( = ?auto_6789 ?auto_6788 ) ) ( HOIST-AT ?auto_6790 ?auto_6789 ) ( AVAILABLE ?auto_6790 ) ( SURFACE-AT ?auto_6786 ?auto_6789 ) ( ON ?auto_6786 ?auto_6792 ) ( CLEAR ?auto_6786 ) ( not ( = ?auto_6785 ?auto_6786 ) ) ( not ( = ?auto_6785 ?auto_6792 ) ) ( not ( = ?auto_6786 ?auto_6792 ) ) ( not ( = ?auto_6791 ?auto_6790 ) ) ( IS-CRATE ?auto_6785 ) ( not ( = ?auto_6794 ?auto_6788 ) ) ( HOIST-AT ?auto_6797 ?auto_6794 ) ( SURFACE-AT ?auto_6785 ?auto_6794 ) ( ON ?auto_6785 ?auto_6793 ) ( CLEAR ?auto_6785 ) ( not ( = ?auto_6784 ?auto_6785 ) ) ( not ( = ?auto_6784 ?auto_6793 ) ) ( not ( = ?auto_6785 ?auto_6793 ) ) ( not ( = ?auto_6791 ?auto_6797 ) ) ( IS-CRATE ?auto_6784 ) ( not ( = ?auto_6796 ?auto_6788 ) ) ( HOIST-AT ?auto_6801 ?auto_6796 ) ( AVAILABLE ?auto_6801 ) ( SURFACE-AT ?auto_6784 ?auto_6796 ) ( ON ?auto_6784 ?auto_6806 ) ( CLEAR ?auto_6784 ) ( not ( = ?auto_6783 ?auto_6784 ) ) ( not ( = ?auto_6783 ?auto_6806 ) ) ( not ( = ?auto_6784 ?auto_6806 ) ) ( not ( = ?auto_6791 ?auto_6801 ) ) ( IS-CRATE ?auto_6783 ) ( AVAILABLE ?auto_6797 ) ( SURFACE-AT ?auto_6783 ?auto_6794 ) ( ON ?auto_6783 ?auto_6805 ) ( CLEAR ?auto_6783 ) ( not ( = ?auto_6782 ?auto_6783 ) ) ( not ( = ?auto_6782 ?auto_6805 ) ) ( not ( = ?auto_6783 ?auto_6805 ) ) ( IS-CRATE ?auto_6782 ) ( not ( = ?auto_6804 ?auto_6788 ) ) ( HOIST-AT ?auto_6795 ?auto_6804 ) ( SURFACE-AT ?auto_6782 ?auto_6804 ) ( ON ?auto_6782 ?auto_6798 ) ( CLEAR ?auto_6782 ) ( not ( = ?auto_6781 ?auto_6782 ) ) ( not ( = ?auto_6781 ?auto_6798 ) ) ( not ( = ?auto_6782 ?auto_6798 ) ) ( not ( = ?auto_6791 ?auto_6795 ) ) ( IS-CRATE ?auto_6781 ) ( not ( = ?auto_6802 ?auto_6788 ) ) ( HOIST-AT ?auto_6803 ?auto_6802 ) ( AVAILABLE ?auto_6803 ) ( SURFACE-AT ?auto_6781 ?auto_6802 ) ( ON ?auto_6781 ?auto_6799 ) ( CLEAR ?auto_6781 ) ( not ( = ?auto_6780 ?auto_6781 ) ) ( not ( = ?auto_6780 ?auto_6799 ) ) ( not ( = ?auto_6781 ?auto_6799 ) ) ( not ( = ?auto_6791 ?auto_6803 ) ) ( SURFACE-AT ?auto_6779 ?auto_6788 ) ( CLEAR ?auto_6779 ) ( IS-CRATE ?auto_6780 ) ( AVAILABLE ?auto_6791 ) ( AVAILABLE ?auto_6795 ) ( SURFACE-AT ?auto_6780 ?auto_6804 ) ( ON ?auto_6780 ?auto_6800 ) ( CLEAR ?auto_6780 ) ( TRUCK-AT ?auto_6787 ?auto_6788 ) ( not ( = ?auto_6779 ?auto_6780 ) ) ( not ( = ?auto_6779 ?auto_6800 ) ) ( not ( = ?auto_6780 ?auto_6800 ) ) ( not ( = ?auto_6779 ?auto_6781 ) ) ( not ( = ?auto_6779 ?auto_6799 ) ) ( not ( = ?auto_6781 ?auto_6800 ) ) ( not ( = ?auto_6802 ?auto_6804 ) ) ( not ( = ?auto_6803 ?auto_6795 ) ) ( not ( = ?auto_6799 ?auto_6800 ) ) ( not ( = ?auto_6779 ?auto_6782 ) ) ( not ( = ?auto_6779 ?auto_6798 ) ) ( not ( = ?auto_6780 ?auto_6782 ) ) ( not ( = ?auto_6780 ?auto_6798 ) ) ( not ( = ?auto_6782 ?auto_6799 ) ) ( not ( = ?auto_6782 ?auto_6800 ) ) ( not ( = ?auto_6798 ?auto_6799 ) ) ( not ( = ?auto_6798 ?auto_6800 ) ) ( not ( = ?auto_6779 ?auto_6783 ) ) ( not ( = ?auto_6779 ?auto_6805 ) ) ( not ( = ?auto_6780 ?auto_6783 ) ) ( not ( = ?auto_6780 ?auto_6805 ) ) ( not ( = ?auto_6781 ?auto_6783 ) ) ( not ( = ?auto_6781 ?auto_6805 ) ) ( not ( = ?auto_6783 ?auto_6798 ) ) ( not ( = ?auto_6783 ?auto_6799 ) ) ( not ( = ?auto_6783 ?auto_6800 ) ) ( not ( = ?auto_6794 ?auto_6804 ) ) ( not ( = ?auto_6794 ?auto_6802 ) ) ( not ( = ?auto_6797 ?auto_6795 ) ) ( not ( = ?auto_6797 ?auto_6803 ) ) ( not ( = ?auto_6805 ?auto_6798 ) ) ( not ( = ?auto_6805 ?auto_6799 ) ) ( not ( = ?auto_6805 ?auto_6800 ) ) ( not ( = ?auto_6779 ?auto_6784 ) ) ( not ( = ?auto_6779 ?auto_6806 ) ) ( not ( = ?auto_6780 ?auto_6784 ) ) ( not ( = ?auto_6780 ?auto_6806 ) ) ( not ( = ?auto_6781 ?auto_6784 ) ) ( not ( = ?auto_6781 ?auto_6806 ) ) ( not ( = ?auto_6782 ?auto_6784 ) ) ( not ( = ?auto_6782 ?auto_6806 ) ) ( not ( = ?auto_6784 ?auto_6805 ) ) ( not ( = ?auto_6784 ?auto_6798 ) ) ( not ( = ?auto_6784 ?auto_6799 ) ) ( not ( = ?auto_6784 ?auto_6800 ) ) ( not ( = ?auto_6796 ?auto_6794 ) ) ( not ( = ?auto_6796 ?auto_6804 ) ) ( not ( = ?auto_6796 ?auto_6802 ) ) ( not ( = ?auto_6801 ?auto_6797 ) ) ( not ( = ?auto_6801 ?auto_6795 ) ) ( not ( = ?auto_6801 ?auto_6803 ) ) ( not ( = ?auto_6806 ?auto_6805 ) ) ( not ( = ?auto_6806 ?auto_6798 ) ) ( not ( = ?auto_6806 ?auto_6799 ) ) ( not ( = ?auto_6806 ?auto_6800 ) ) ( not ( = ?auto_6779 ?auto_6785 ) ) ( not ( = ?auto_6779 ?auto_6793 ) ) ( not ( = ?auto_6780 ?auto_6785 ) ) ( not ( = ?auto_6780 ?auto_6793 ) ) ( not ( = ?auto_6781 ?auto_6785 ) ) ( not ( = ?auto_6781 ?auto_6793 ) ) ( not ( = ?auto_6782 ?auto_6785 ) ) ( not ( = ?auto_6782 ?auto_6793 ) ) ( not ( = ?auto_6783 ?auto_6785 ) ) ( not ( = ?auto_6783 ?auto_6793 ) ) ( not ( = ?auto_6785 ?auto_6806 ) ) ( not ( = ?auto_6785 ?auto_6805 ) ) ( not ( = ?auto_6785 ?auto_6798 ) ) ( not ( = ?auto_6785 ?auto_6799 ) ) ( not ( = ?auto_6785 ?auto_6800 ) ) ( not ( = ?auto_6793 ?auto_6806 ) ) ( not ( = ?auto_6793 ?auto_6805 ) ) ( not ( = ?auto_6793 ?auto_6798 ) ) ( not ( = ?auto_6793 ?auto_6799 ) ) ( not ( = ?auto_6793 ?auto_6800 ) ) ( not ( = ?auto_6779 ?auto_6786 ) ) ( not ( = ?auto_6779 ?auto_6792 ) ) ( not ( = ?auto_6780 ?auto_6786 ) ) ( not ( = ?auto_6780 ?auto_6792 ) ) ( not ( = ?auto_6781 ?auto_6786 ) ) ( not ( = ?auto_6781 ?auto_6792 ) ) ( not ( = ?auto_6782 ?auto_6786 ) ) ( not ( = ?auto_6782 ?auto_6792 ) ) ( not ( = ?auto_6783 ?auto_6786 ) ) ( not ( = ?auto_6783 ?auto_6792 ) ) ( not ( = ?auto_6784 ?auto_6786 ) ) ( not ( = ?auto_6784 ?auto_6792 ) ) ( not ( = ?auto_6786 ?auto_6793 ) ) ( not ( = ?auto_6786 ?auto_6806 ) ) ( not ( = ?auto_6786 ?auto_6805 ) ) ( not ( = ?auto_6786 ?auto_6798 ) ) ( not ( = ?auto_6786 ?auto_6799 ) ) ( not ( = ?auto_6786 ?auto_6800 ) ) ( not ( = ?auto_6789 ?auto_6794 ) ) ( not ( = ?auto_6789 ?auto_6796 ) ) ( not ( = ?auto_6789 ?auto_6804 ) ) ( not ( = ?auto_6789 ?auto_6802 ) ) ( not ( = ?auto_6790 ?auto_6797 ) ) ( not ( = ?auto_6790 ?auto_6801 ) ) ( not ( = ?auto_6790 ?auto_6795 ) ) ( not ( = ?auto_6790 ?auto_6803 ) ) ( not ( = ?auto_6792 ?auto_6793 ) ) ( not ( = ?auto_6792 ?auto_6806 ) ) ( not ( = ?auto_6792 ?auto_6805 ) ) ( not ( = ?auto_6792 ?auto_6798 ) ) ( not ( = ?auto_6792 ?auto_6799 ) ) ( not ( = ?auto_6792 ?auto_6800 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6779 ?auto_6780 ?auto_6781 ?auto_6782 ?auto_6783 ?auto_6784 ?auto_6785 )
      ( MAKE-1CRATE ?auto_6785 ?auto_6786 )
      ( MAKE-7CRATE-VERIFY ?auto_6779 ?auto_6780 ?auto_6781 ?auto_6782 ?auto_6783 ?auto_6784 ?auto_6785 ?auto_6786 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_6826 - SURFACE
      ?auto_6827 - SURFACE
      ?auto_6828 - SURFACE
      ?auto_6829 - SURFACE
      ?auto_6830 - SURFACE
      ?auto_6831 - SURFACE
      ?auto_6832 - SURFACE
      ?auto_6833 - SURFACE
      ?auto_6834 - SURFACE
    )
    :vars
    (
      ?auto_6837 - HOIST
      ?auto_6836 - PLACE
      ?auto_6840 - PLACE
      ?auto_6838 - HOIST
      ?auto_6839 - SURFACE
      ?auto_6841 - PLACE
      ?auto_6851 - HOIST
      ?auto_6852 - SURFACE
      ?auto_6842 - PLACE
      ?auto_6845 - HOIST
      ?auto_6848 - SURFACE
      ?auto_6853 - PLACE
      ?auto_6846 - HOIST
      ?auto_6850 - SURFACE
      ?auto_6847 - SURFACE
      ?auto_6856 - PLACE
      ?auto_6855 - HOIST
      ?auto_6857 - SURFACE
      ?auto_6844 - PLACE
      ?auto_6843 - HOIST
      ?auto_6849 - SURFACE
      ?auto_6854 - SURFACE
      ?auto_6835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6837 ?auto_6836 ) ( IS-CRATE ?auto_6834 ) ( not ( = ?auto_6840 ?auto_6836 ) ) ( HOIST-AT ?auto_6838 ?auto_6840 ) ( AVAILABLE ?auto_6838 ) ( SURFACE-AT ?auto_6834 ?auto_6840 ) ( ON ?auto_6834 ?auto_6839 ) ( CLEAR ?auto_6834 ) ( not ( = ?auto_6833 ?auto_6834 ) ) ( not ( = ?auto_6833 ?auto_6839 ) ) ( not ( = ?auto_6834 ?auto_6839 ) ) ( not ( = ?auto_6837 ?auto_6838 ) ) ( IS-CRATE ?auto_6833 ) ( not ( = ?auto_6841 ?auto_6836 ) ) ( HOIST-AT ?auto_6851 ?auto_6841 ) ( AVAILABLE ?auto_6851 ) ( SURFACE-AT ?auto_6833 ?auto_6841 ) ( ON ?auto_6833 ?auto_6852 ) ( CLEAR ?auto_6833 ) ( not ( = ?auto_6832 ?auto_6833 ) ) ( not ( = ?auto_6832 ?auto_6852 ) ) ( not ( = ?auto_6833 ?auto_6852 ) ) ( not ( = ?auto_6837 ?auto_6851 ) ) ( IS-CRATE ?auto_6832 ) ( not ( = ?auto_6842 ?auto_6836 ) ) ( HOIST-AT ?auto_6845 ?auto_6842 ) ( SURFACE-AT ?auto_6832 ?auto_6842 ) ( ON ?auto_6832 ?auto_6848 ) ( CLEAR ?auto_6832 ) ( not ( = ?auto_6831 ?auto_6832 ) ) ( not ( = ?auto_6831 ?auto_6848 ) ) ( not ( = ?auto_6832 ?auto_6848 ) ) ( not ( = ?auto_6837 ?auto_6845 ) ) ( IS-CRATE ?auto_6831 ) ( not ( = ?auto_6853 ?auto_6836 ) ) ( HOIST-AT ?auto_6846 ?auto_6853 ) ( AVAILABLE ?auto_6846 ) ( SURFACE-AT ?auto_6831 ?auto_6853 ) ( ON ?auto_6831 ?auto_6850 ) ( CLEAR ?auto_6831 ) ( not ( = ?auto_6830 ?auto_6831 ) ) ( not ( = ?auto_6830 ?auto_6850 ) ) ( not ( = ?auto_6831 ?auto_6850 ) ) ( not ( = ?auto_6837 ?auto_6846 ) ) ( IS-CRATE ?auto_6830 ) ( AVAILABLE ?auto_6845 ) ( SURFACE-AT ?auto_6830 ?auto_6842 ) ( ON ?auto_6830 ?auto_6847 ) ( CLEAR ?auto_6830 ) ( not ( = ?auto_6829 ?auto_6830 ) ) ( not ( = ?auto_6829 ?auto_6847 ) ) ( not ( = ?auto_6830 ?auto_6847 ) ) ( IS-CRATE ?auto_6829 ) ( not ( = ?auto_6856 ?auto_6836 ) ) ( HOIST-AT ?auto_6855 ?auto_6856 ) ( SURFACE-AT ?auto_6829 ?auto_6856 ) ( ON ?auto_6829 ?auto_6857 ) ( CLEAR ?auto_6829 ) ( not ( = ?auto_6828 ?auto_6829 ) ) ( not ( = ?auto_6828 ?auto_6857 ) ) ( not ( = ?auto_6829 ?auto_6857 ) ) ( not ( = ?auto_6837 ?auto_6855 ) ) ( IS-CRATE ?auto_6828 ) ( not ( = ?auto_6844 ?auto_6836 ) ) ( HOIST-AT ?auto_6843 ?auto_6844 ) ( AVAILABLE ?auto_6843 ) ( SURFACE-AT ?auto_6828 ?auto_6844 ) ( ON ?auto_6828 ?auto_6849 ) ( CLEAR ?auto_6828 ) ( not ( = ?auto_6827 ?auto_6828 ) ) ( not ( = ?auto_6827 ?auto_6849 ) ) ( not ( = ?auto_6828 ?auto_6849 ) ) ( not ( = ?auto_6837 ?auto_6843 ) ) ( SURFACE-AT ?auto_6826 ?auto_6836 ) ( CLEAR ?auto_6826 ) ( IS-CRATE ?auto_6827 ) ( AVAILABLE ?auto_6837 ) ( AVAILABLE ?auto_6855 ) ( SURFACE-AT ?auto_6827 ?auto_6856 ) ( ON ?auto_6827 ?auto_6854 ) ( CLEAR ?auto_6827 ) ( TRUCK-AT ?auto_6835 ?auto_6836 ) ( not ( = ?auto_6826 ?auto_6827 ) ) ( not ( = ?auto_6826 ?auto_6854 ) ) ( not ( = ?auto_6827 ?auto_6854 ) ) ( not ( = ?auto_6826 ?auto_6828 ) ) ( not ( = ?auto_6826 ?auto_6849 ) ) ( not ( = ?auto_6828 ?auto_6854 ) ) ( not ( = ?auto_6844 ?auto_6856 ) ) ( not ( = ?auto_6843 ?auto_6855 ) ) ( not ( = ?auto_6849 ?auto_6854 ) ) ( not ( = ?auto_6826 ?auto_6829 ) ) ( not ( = ?auto_6826 ?auto_6857 ) ) ( not ( = ?auto_6827 ?auto_6829 ) ) ( not ( = ?auto_6827 ?auto_6857 ) ) ( not ( = ?auto_6829 ?auto_6849 ) ) ( not ( = ?auto_6829 ?auto_6854 ) ) ( not ( = ?auto_6857 ?auto_6849 ) ) ( not ( = ?auto_6857 ?auto_6854 ) ) ( not ( = ?auto_6826 ?auto_6830 ) ) ( not ( = ?auto_6826 ?auto_6847 ) ) ( not ( = ?auto_6827 ?auto_6830 ) ) ( not ( = ?auto_6827 ?auto_6847 ) ) ( not ( = ?auto_6828 ?auto_6830 ) ) ( not ( = ?auto_6828 ?auto_6847 ) ) ( not ( = ?auto_6830 ?auto_6857 ) ) ( not ( = ?auto_6830 ?auto_6849 ) ) ( not ( = ?auto_6830 ?auto_6854 ) ) ( not ( = ?auto_6842 ?auto_6856 ) ) ( not ( = ?auto_6842 ?auto_6844 ) ) ( not ( = ?auto_6845 ?auto_6855 ) ) ( not ( = ?auto_6845 ?auto_6843 ) ) ( not ( = ?auto_6847 ?auto_6857 ) ) ( not ( = ?auto_6847 ?auto_6849 ) ) ( not ( = ?auto_6847 ?auto_6854 ) ) ( not ( = ?auto_6826 ?auto_6831 ) ) ( not ( = ?auto_6826 ?auto_6850 ) ) ( not ( = ?auto_6827 ?auto_6831 ) ) ( not ( = ?auto_6827 ?auto_6850 ) ) ( not ( = ?auto_6828 ?auto_6831 ) ) ( not ( = ?auto_6828 ?auto_6850 ) ) ( not ( = ?auto_6829 ?auto_6831 ) ) ( not ( = ?auto_6829 ?auto_6850 ) ) ( not ( = ?auto_6831 ?auto_6847 ) ) ( not ( = ?auto_6831 ?auto_6857 ) ) ( not ( = ?auto_6831 ?auto_6849 ) ) ( not ( = ?auto_6831 ?auto_6854 ) ) ( not ( = ?auto_6853 ?auto_6842 ) ) ( not ( = ?auto_6853 ?auto_6856 ) ) ( not ( = ?auto_6853 ?auto_6844 ) ) ( not ( = ?auto_6846 ?auto_6845 ) ) ( not ( = ?auto_6846 ?auto_6855 ) ) ( not ( = ?auto_6846 ?auto_6843 ) ) ( not ( = ?auto_6850 ?auto_6847 ) ) ( not ( = ?auto_6850 ?auto_6857 ) ) ( not ( = ?auto_6850 ?auto_6849 ) ) ( not ( = ?auto_6850 ?auto_6854 ) ) ( not ( = ?auto_6826 ?auto_6832 ) ) ( not ( = ?auto_6826 ?auto_6848 ) ) ( not ( = ?auto_6827 ?auto_6832 ) ) ( not ( = ?auto_6827 ?auto_6848 ) ) ( not ( = ?auto_6828 ?auto_6832 ) ) ( not ( = ?auto_6828 ?auto_6848 ) ) ( not ( = ?auto_6829 ?auto_6832 ) ) ( not ( = ?auto_6829 ?auto_6848 ) ) ( not ( = ?auto_6830 ?auto_6832 ) ) ( not ( = ?auto_6830 ?auto_6848 ) ) ( not ( = ?auto_6832 ?auto_6850 ) ) ( not ( = ?auto_6832 ?auto_6847 ) ) ( not ( = ?auto_6832 ?auto_6857 ) ) ( not ( = ?auto_6832 ?auto_6849 ) ) ( not ( = ?auto_6832 ?auto_6854 ) ) ( not ( = ?auto_6848 ?auto_6850 ) ) ( not ( = ?auto_6848 ?auto_6847 ) ) ( not ( = ?auto_6848 ?auto_6857 ) ) ( not ( = ?auto_6848 ?auto_6849 ) ) ( not ( = ?auto_6848 ?auto_6854 ) ) ( not ( = ?auto_6826 ?auto_6833 ) ) ( not ( = ?auto_6826 ?auto_6852 ) ) ( not ( = ?auto_6827 ?auto_6833 ) ) ( not ( = ?auto_6827 ?auto_6852 ) ) ( not ( = ?auto_6828 ?auto_6833 ) ) ( not ( = ?auto_6828 ?auto_6852 ) ) ( not ( = ?auto_6829 ?auto_6833 ) ) ( not ( = ?auto_6829 ?auto_6852 ) ) ( not ( = ?auto_6830 ?auto_6833 ) ) ( not ( = ?auto_6830 ?auto_6852 ) ) ( not ( = ?auto_6831 ?auto_6833 ) ) ( not ( = ?auto_6831 ?auto_6852 ) ) ( not ( = ?auto_6833 ?auto_6848 ) ) ( not ( = ?auto_6833 ?auto_6850 ) ) ( not ( = ?auto_6833 ?auto_6847 ) ) ( not ( = ?auto_6833 ?auto_6857 ) ) ( not ( = ?auto_6833 ?auto_6849 ) ) ( not ( = ?auto_6833 ?auto_6854 ) ) ( not ( = ?auto_6841 ?auto_6842 ) ) ( not ( = ?auto_6841 ?auto_6853 ) ) ( not ( = ?auto_6841 ?auto_6856 ) ) ( not ( = ?auto_6841 ?auto_6844 ) ) ( not ( = ?auto_6851 ?auto_6845 ) ) ( not ( = ?auto_6851 ?auto_6846 ) ) ( not ( = ?auto_6851 ?auto_6855 ) ) ( not ( = ?auto_6851 ?auto_6843 ) ) ( not ( = ?auto_6852 ?auto_6848 ) ) ( not ( = ?auto_6852 ?auto_6850 ) ) ( not ( = ?auto_6852 ?auto_6847 ) ) ( not ( = ?auto_6852 ?auto_6857 ) ) ( not ( = ?auto_6852 ?auto_6849 ) ) ( not ( = ?auto_6852 ?auto_6854 ) ) ( not ( = ?auto_6826 ?auto_6834 ) ) ( not ( = ?auto_6826 ?auto_6839 ) ) ( not ( = ?auto_6827 ?auto_6834 ) ) ( not ( = ?auto_6827 ?auto_6839 ) ) ( not ( = ?auto_6828 ?auto_6834 ) ) ( not ( = ?auto_6828 ?auto_6839 ) ) ( not ( = ?auto_6829 ?auto_6834 ) ) ( not ( = ?auto_6829 ?auto_6839 ) ) ( not ( = ?auto_6830 ?auto_6834 ) ) ( not ( = ?auto_6830 ?auto_6839 ) ) ( not ( = ?auto_6831 ?auto_6834 ) ) ( not ( = ?auto_6831 ?auto_6839 ) ) ( not ( = ?auto_6832 ?auto_6834 ) ) ( not ( = ?auto_6832 ?auto_6839 ) ) ( not ( = ?auto_6834 ?auto_6852 ) ) ( not ( = ?auto_6834 ?auto_6848 ) ) ( not ( = ?auto_6834 ?auto_6850 ) ) ( not ( = ?auto_6834 ?auto_6847 ) ) ( not ( = ?auto_6834 ?auto_6857 ) ) ( not ( = ?auto_6834 ?auto_6849 ) ) ( not ( = ?auto_6834 ?auto_6854 ) ) ( not ( = ?auto_6840 ?auto_6841 ) ) ( not ( = ?auto_6840 ?auto_6842 ) ) ( not ( = ?auto_6840 ?auto_6853 ) ) ( not ( = ?auto_6840 ?auto_6856 ) ) ( not ( = ?auto_6840 ?auto_6844 ) ) ( not ( = ?auto_6838 ?auto_6851 ) ) ( not ( = ?auto_6838 ?auto_6845 ) ) ( not ( = ?auto_6838 ?auto_6846 ) ) ( not ( = ?auto_6838 ?auto_6855 ) ) ( not ( = ?auto_6838 ?auto_6843 ) ) ( not ( = ?auto_6839 ?auto_6852 ) ) ( not ( = ?auto_6839 ?auto_6848 ) ) ( not ( = ?auto_6839 ?auto_6850 ) ) ( not ( = ?auto_6839 ?auto_6847 ) ) ( not ( = ?auto_6839 ?auto_6857 ) ) ( not ( = ?auto_6839 ?auto_6849 ) ) ( not ( = ?auto_6839 ?auto_6854 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6826 ?auto_6827 ?auto_6828 ?auto_6829 ?auto_6830 ?auto_6831 ?auto_6832 ?auto_6833 )
      ( MAKE-1CRATE ?auto_6833 ?auto_6834 )
      ( MAKE-8CRATE-VERIFY ?auto_6826 ?auto_6827 ?auto_6828 ?auto_6829 ?auto_6830 ?auto_6831 ?auto_6832 ?auto_6833 ?auto_6834 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_6878 - SURFACE
      ?auto_6879 - SURFACE
      ?auto_6880 - SURFACE
      ?auto_6881 - SURFACE
      ?auto_6882 - SURFACE
      ?auto_6883 - SURFACE
      ?auto_6884 - SURFACE
      ?auto_6885 - SURFACE
      ?auto_6886 - SURFACE
      ?auto_6887 - SURFACE
    )
    :vars
    (
      ?auto_6891 - HOIST
      ?auto_6893 - PLACE
      ?auto_6892 - PLACE
      ?auto_6888 - HOIST
      ?auto_6890 - SURFACE
      ?auto_6909 - PLACE
      ?auto_6910 - HOIST
      ?auto_6911 - SURFACE
      ?auto_6904 - PLACE
      ?auto_6900 - HOIST
      ?auto_6902 - SURFACE
      ?auto_6901 - PLACE
      ?auto_6908 - HOIST
      ?auto_6903 - SURFACE
      ?auto_6895 - PLACE
      ?auto_6898 - HOIST
      ?auto_6894 - SURFACE
      ?auto_6899 - SURFACE
      ?auto_6906 - PLACE
      ?auto_6896 - HOIST
      ?auto_6905 - SURFACE
      ?auto_6913 - PLACE
      ?auto_6912 - HOIST
      ?auto_6907 - SURFACE
      ?auto_6897 - SURFACE
      ?auto_6889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6891 ?auto_6893 ) ( IS-CRATE ?auto_6887 ) ( not ( = ?auto_6892 ?auto_6893 ) ) ( HOIST-AT ?auto_6888 ?auto_6892 ) ( AVAILABLE ?auto_6888 ) ( SURFACE-AT ?auto_6887 ?auto_6892 ) ( ON ?auto_6887 ?auto_6890 ) ( CLEAR ?auto_6887 ) ( not ( = ?auto_6886 ?auto_6887 ) ) ( not ( = ?auto_6886 ?auto_6890 ) ) ( not ( = ?auto_6887 ?auto_6890 ) ) ( not ( = ?auto_6891 ?auto_6888 ) ) ( IS-CRATE ?auto_6886 ) ( not ( = ?auto_6909 ?auto_6893 ) ) ( HOIST-AT ?auto_6910 ?auto_6909 ) ( AVAILABLE ?auto_6910 ) ( SURFACE-AT ?auto_6886 ?auto_6909 ) ( ON ?auto_6886 ?auto_6911 ) ( CLEAR ?auto_6886 ) ( not ( = ?auto_6885 ?auto_6886 ) ) ( not ( = ?auto_6885 ?auto_6911 ) ) ( not ( = ?auto_6886 ?auto_6911 ) ) ( not ( = ?auto_6891 ?auto_6910 ) ) ( IS-CRATE ?auto_6885 ) ( not ( = ?auto_6904 ?auto_6893 ) ) ( HOIST-AT ?auto_6900 ?auto_6904 ) ( AVAILABLE ?auto_6900 ) ( SURFACE-AT ?auto_6885 ?auto_6904 ) ( ON ?auto_6885 ?auto_6902 ) ( CLEAR ?auto_6885 ) ( not ( = ?auto_6884 ?auto_6885 ) ) ( not ( = ?auto_6884 ?auto_6902 ) ) ( not ( = ?auto_6885 ?auto_6902 ) ) ( not ( = ?auto_6891 ?auto_6900 ) ) ( IS-CRATE ?auto_6884 ) ( not ( = ?auto_6901 ?auto_6893 ) ) ( HOIST-AT ?auto_6908 ?auto_6901 ) ( SURFACE-AT ?auto_6884 ?auto_6901 ) ( ON ?auto_6884 ?auto_6903 ) ( CLEAR ?auto_6884 ) ( not ( = ?auto_6883 ?auto_6884 ) ) ( not ( = ?auto_6883 ?auto_6903 ) ) ( not ( = ?auto_6884 ?auto_6903 ) ) ( not ( = ?auto_6891 ?auto_6908 ) ) ( IS-CRATE ?auto_6883 ) ( not ( = ?auto_6895 ?auto_6893 ) ) ( HOIST-AT ?auto_6898 ?auto_6895 ) ( AVAILABLE ?auto_6898 ) ( SURFACE-AT ?auto_6883 ?auto_6895 ) ( ON ?auto_6883 ?auto_6894 ) ( CLEAR ?auto_6883 ) ( not ( = ?auto_6882 ?auto_6883 ) ) ( not ( = ?auto_6882 ?auto_6894 ) ) ( not ( = ?auto_6883 ?auto_6894 ) ) ( not ( = ?auto_6891 ?auto_6898 ) ) ( IS-CRATE ?auto_6882 ) ( AVAILABLE ?auto_6908 ) ( SURFACE-AT ?auto_6882 ?auto_6901 ) ( ON ?auto_6882 ?auto_6899 ) ( CLEAR ?auto_6882 ) ( not ( = ?auto_6881 ?auto_6882 ) ) ( not ( = ?auto_6881 ?auto_6899 ) ) ( not ( = ?auto_6882 ?auto_6899 ) ) ( IS-CRATE ?auto_6881 ) ( not ( = ?auto_6906 ?auto_6893 ) ) ( HOIST-AT ?auto_6896 ?auto_6906 ) ( SURFACE-AT ?auto_6881 ?auto_6906 ) ( ON ?auto_6881 ?auto_6905 ) ( CLEAR ?auto_6881 ) ( not ( = ?auto_6880 ?auto_6881 ) ) ( not ( = ?auto_6880 ?auto_6905 ) ) ( not ( = ?auto_6881 ?auto_6905 ) ) ( not ( = ?auto_6891 ?auto_6896 ) ) ( IS-CRATE ?auto_6880 ) ( not ( = ?auto_6913 ?auto_6893 ) ) ( HOIST-AT ?auto_6912 ?auto_6913 ) ( AVAILABLE ?auto_6912 ) ( SURFACE-AT ?auto_6880 ?auto_6913 ) ( ON ?auto_6880 ?auto_6907 ) ( CLEAR ?auto_6880 ) ( not ( = ?auto_6879 ?auto_6880 ) ) ( not ( = ?auto_6879 ?auto_6907 ) ) ( not ( = ?auto_6880 ?auto_6907 ) ) ( not ( = ?auto_6891 ?auto_6912 ) ) ( SURFACE-AT ?auto_6878 ?auto_6893 ) ( CLEAR ?auto_6878 ) ( IS-CRATE ?auto_6879 ) ( AVAILABLE ?auto_6891 ) ( AVAILABLE ?auto_6896 ) ( SURFACE-AT ?auto_6879 ?auto_6906 ) ( ON ?auto_6879 ?auto_6897 ) ( CLEAR ?auto_6879 ) ( TRUCK-AT ?auto_6889 ?auto_6893 ) ( not ( = ?auto_6878 ?auto_6879 ) ) ( not ( = ?auto_6878 ?auto_6897 ) ) ( not ( = ?auto_6879 ?auto_6897 ) ) ( not ( = ?auto_6878 ?auto_6880 ) ) ( not ( = ?auto_6878 ?auto_6907 ) ) ( not ( = ?auto_6880 ?auto_6897 ) ) ( not ( = ?auto_6913 ?auto_6906 ) ) ( not ( = ?auto_6912 ?auto_6896 ) ) ( not ( = ?auto_6907 ?auto_6897 ) ) ( not ( = ?auto_6878 ?auto_6881 ) ) ( not ( = ?auto_6878 ?auto_6905 ) ) ( not ( = ?auto_6879 ?auto_6881 ) ) ( not ( = ?auto_6879 ?auto_6905 ) ) ( not ( = ?auto_6881 ?auto_6907 ) ) ( not ( = ?auto_6881 ?auto_6897 ) ) ( not ( = ?auto_6905 ?auto_6907 ) ) ( not ( = ?auto_6905 ?auto_6897 ) ) ( not ( = ?auto_6878 ?auto_6882 ) ) ( not ( = ?auto_6878 ?auto_6899 ) ) ( not ( = ?auto_6879 ?auto_6882 ) ) ( not ( = ?auto_6879 ?auto_6899 ) ) ( not ( = ?auto_6880 ?auto_6882 ) ) ( not ( = ?auto_6880 ?auto_6899 ) ) ( not ( = ?auto_6882 ?auto_6905 ) ) ( not ( = ?auto_6882 ?auto_6907 ) ) ( not ( = ?auto_6882 ?auto_6897 ) ) ( not ( = ?auto_6901 ?auto_6906 ) ) ( not ( = ?auto_6901 ?auto_6913 ) ) ( not ( = ?auto_6908 ?auto_6896 ) ) ( not ( = ?auto_6908 ?auto_6912 ) ) ( not ( = ?auto_6899 ?auto_6905 ) ) ( not ( = ?auto_6899 ?auto_6907 ) ) ( not ( = ?auto_6899 ?auto_6897 ) ) ( not ( = ?auto_6878 ?auto_6883 ) ) ( not ( = ?auto_6878 ?auto_6894 ) ) ( not ( = ?auto_6879 ?auto_6883 ) ) ( not ( = ?auto_6879 ?auto_6894 ) ) ( not ( = ?auto_6880 ?auto_6883 ) ) ( not ( = ?auto_6880 ?auto_6894 ) ) ( not ( = ?auto_6881 ?auto_6883 ) ) ( not ( = ?auto_6881 ?auto_6894 ) ) ( not ( = ?auto_6883 ?auto_6899 ) ) ( not ( = ?auto_6883 ?auto_6905 ) ) ( not ( = ?auto_6883 ?auto_6907 ) ) ( not ( = ?auto_6883 ?auto_6897 ) ) ( not ( = ?auto_6895 ?auto_6901 ) ) ( not ( = ?auto_6895 ?auto_6906 ) ) ( not ( = ?auto_6895 ?auto_6913 ) ) ( not ( = ?auto_6898 ?auto_6908 ) ) ( not ( = ?auto_6898 ?auto_6896 ) ) ( not ( = ?auto_6898 ?auto_6912 ) ) ( not ( = ?auto_6894 ?auto_6899 ) ) ( not ( = ?auto_6894 ?auto_6905 ) ) ( not ( = ?auto_6894 ?auto_6907 ) ) ( not ( = ?auto_6894 ?auto_6897 ) ) ( not ( = ?auto_6878 ?auto_6884 ) ) ( not ( = ?auto_6878 ?auto_6903 ) ) ( not ( = ?auto_6879 ?auto_6884 ) ) ( not ( = ?auto_6879 ?auto_6903 ) ) ( not ( = ?auto_6880 ?auto_6884 ) ) ( not ( = ?auto_6880 ?auto_6903 ) ) ( not ( = ?auto_6881 ?auto_6884 ) ) ( not ( = ?auto_6881 ?auto_6903 ) ) ( not ( = ?auto_6882 ?auto_6884 ) ) ( not ( = ?auto_6882 ?auto_6903 ) ) ( not ( = ?auto_6884 ?auto_6894 ) ) ( not ( = ?auto_6884 ?auto_6899 ) ) ( not ( = ?auto_6884 ?auto_6905 ) ) ( not ( = ?auto_6884 ?auto_6907 ) ) ( not ( = ?auto_6884 ?auto_6897 ) ) ( not ( = ?auto_6903 ?auto_6894 ) ) ( not ( = ?auto_6903 ?auto_6899 ) ) ( not ( = ?auto_6903 ?auto_6905 ) ) ( not ( = ?auto_6903 ?auto_6907 ) ) ( not ( = ?auto_6903 ?auto_6897 ) ) ( not ( = ?auto_6878 ?auto_6885 ) ) ( not ( = ?auto_6878 ?auto_6902 ) ) ( not ( = ?auto_6879 ?auto_6885 ) ) ( not ( = ?auto_6879 ?auto_6902 ) ) ( not ( = ?auto_6880 ?auto_6885 ) ) ( not ( = ?auto_6880 ?auto_6902 ) ) ( not ( = ?auto_6881 ?auto_6885 ) ) ( not ( = ?auto_6881 ?auto_6902 ) ) ( not ( = ?auto_6882 ?auto_6885 ) ) ( not ( = ?auto_6882 ?auto_6902 ) ) ( not ( = ?auto_6883 ?auto_6885 ) ) ( not ( = ?auto_6883 ?auto_6902 ) ) ( not ( = ?auto_6885 ?auto_6903 ) ) ( not ( = ?auto_6885 ?auto_6894 ) ) ( not ( = ?auto_6885 ?auto_6899 ) ) ( not ( = ?auto_6885 ?auto_6905 ) ) ( not ( = ?auto_6885 ?auto_6907 ) ) ( not ( = ?auto_6885 ?auto_6897 ) ) ( not ( = ?auto_6904 ?auto_6901 ) ) ( not ( = ?auto_6904 ?auto_6895 ) ) ( not ( = ?auto_6904 ?auto_6906 ) ) ( not ( = ?auto_6904 ?auto_6913 ) ) ( not ( = ?auto_6900 ?auto_6908 ) ) ( not ( = ?auto_6900 ?auto_6898 ) ) ( not ( = ?auto_6900 ?auto_6896 ) ) ( not ( = ?auto_6900 ?auto_6912 ) ) ( not ( = ?auto_6902 ?auto_6903 ) ) ( not ( = ?auto_6902 ?auto_6894 ) ) ( not ( = ?auto_6902 ?auto_6899 ) ) ( not ( = ?auto_6902 ?auto_6905 ) ) ( not ( = ?auto_6902 ?auto_6907 ) ) ( not ( = ?auto_6902 ?auto_6897 ) ) ( not ( = ?auto_6878 ?auto_6886 ) ) ( not ( = ?auto_6878 ?auto_6911 ) ) ( not ( = ?auto_6879 ?auto_6886 ) ) ( not ( = ?auto_6879 ?auto_6911 ) ) ( not ( = ?auto_6880 ?auto_6886 ) ) ( not ( = ?auto_6880 ?auto_6911 ) ) ( not ( = ?auto_6881 ?auto_6886 ) ) ( not ( = ?auto_6881 ?auto_6911 ) ) ( not ( = ?auto_6882 ?auto_6886 ) ) ( not ( = ?auto_6882 ?auto_6911 ) ) ( not ( = ?auto_6883 ?auto_6886 ) ) ( not ( = ?auto_6883 ?auto_6911 ) ) ( not ( = ?auto_6884 ?auto_6886 ) ) ( not ( = ?auto_6884 ?auto_6911 ) ) ( not ( = ?auto_6886 ?auto_6902 ) ) ( not ( = ?auto_6886 ?auto_6903 ) ) ( not ( = ?auto_6886 ?auto_6894 ) ) ( not ( = ?auto_6886 ?auto_6899 ) ) ( not ( = ?auto_6886 ?auto_6905 ) ) ( not ( = ?auto_6886 ?auto_6907 ) ) ( not ( = ?auto_6886 ?auto_6897 ) ) ( not ( = ?auto_6909 ?auto_6904 ) ) ( not ( = ?auto_6909 ?auto_6901 ) ) ( not ( = ?auto_6909 ?auto_6895 ) ) ( not ( = ?auto_6909 ?auto_6906 ) ) ( not ( = ?auto_6909 ?auto_6913 ) ) ( not ( = ?auto_6910 ?auto_6900 ) ) ( not ( = ?auto_6910 ?auto_6908 ) ) ( not ( = ?auto_6910 ?auto_6898 ) ) ( not ( = ?auto_6910 ?auto_6896 ) ) ( not ( = ?auto_6910 ?auto_6912 ) ) ( not ( = ?auto_6911 ?auto_6902 ) ) ( not ( = ?auto_6911 ?auto_6903 ) ) ( not ( = ?auto_6911 ?auto_6894 ) ) ( not ( = ?auto_6911 ?auto_6899 ) ) ( not ( = ?auto_6911 ?auto_6905 ) ) ( not ( = ?auto_6911 ?auto_6907 ) ) ( not ( = ?auto_6911 ?auto_6897 ) ) ( not ( = ?auto_6878 ?auto_6887 ) ) ( not ( = ?auto_6878 ?auto_6890 ) ) ( not ( = ?auto_6879 ?auto_6887 ) ) ( not ( = ?auto_6879 ?auto_6890 ) ) ( not ( = ?auto_6880 ?auto_6887 ) ) ( not ( = ?auto_6880 ?auto_6890 ) ) ( not ( = ?auto_6881 ?auto_6887 ) ) ( not ( = ?auto_6881 ?auto_6890 ) ) ( not ( = ?auto_6882 ?auto_6887 ) ) ( not ( = ?auto_6882 ?auto_6890 ) ) ( not ( = ?auto_6883 ?auto_6887 ) ) ( not ( = ?auto_6883 ?auto_6890 ) ) ( not ( = ?auto_6884 ?auto_6887 ) ) ( not ( = ?auto_6884 ?auto_6890 ) ) ( not ( = ?auto_6885 ?auto_6887 ) ) ( not ( = ?auto_6885 ?auto_6890 ) ) ( not ( = ?auto_6887 ?auto_6911 ) ) ( not ( = ?auto_6887 ?auto_6902 ) ) ( not ( = ?auto_6887 ?auto_6903 ) ) ( not ( = ?auto_6887 ?auto_6894 ) ) ( not ( = ?auto_6887 ?auto_6899 ) ) ( not ( = ?auto_6887 ?auto_6905 ) ) ( not ( = ?auto_6887 ?auto_6907 ) ) ( not ( = ?auto_6887 ?auto_6897 ) ) ( not ( = ?auto_6892 ?auto_6909 ) ) ( not ( = ?auto_6892 ?auto_6904 ) ) ( not ( = ?auto_6892 ?auto_6901 ) ) ( not ( = ?auto_6892 ?auto_6895 ) ) ( not ( = ?auto_6892 ?auto_6906 ) ) ( not ( = ?auto_6892 ?auto_6913 ) ) ( not ( = ?auto_6888 ?auto_6910 ) ) ( not ( = ?auto_6888 ?auto_6900 ) ) ( not ( = ?auto_6888 ?auto_6908 ) ) ( not ( = ?auto_6888 ?auto_6898 ) ) ( not ( = ?auto_6888 ?auto_6896 ) ) ( not ( = ?auto_6888 ?auto_6912 ) ) ( not ( = ?auto_6890 ?auto_6911 ) ) ( not ( = ?auto_6890 ?auto_6902 ) ) ( not ( = ?auto_6890 ?auto_6903 ) ) ( not ( = ?auto_6890 ?auto_6894 ) ) ( not ( = ?auto_6890 ?auto_6899 ) ) ( not ( = ?auto_6890 ?auto_6905 ) ) ( not ( = ?auto_6890 ?auto_6907 ) ) ( not ( = ?auto_6890 ?auto_6897 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6878 ?auto_6879 ?auto_6880 ?auto_6881 ?auto_6882 ?auto_6883 ?auto_6884 ?auto_6885 ?auto_6886 )
      ( MAKE-1CRATE ?auto_6886 ?auto_6887 )
      ( MAKE-9CRATE-VERIFY ?auto_6878 ?auto_6879 ?auto_6880 ?auto_6881 ?auto_6882 ?auto_6883 ?auto_6884 ?auto_6885 ?auto_6886 ?auto_6887 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_6935 - SURFACE
      ?auto_6936 - SURFACE
      ?auto_6937 - SURFACE
      ?auto_6938 - SURFACE
      ?auto_6939 - SURFACE
      ?auto_6940 - SURFACE
      ?auto_6941 - SURFACE
      ?auto_6942 - SURFACE
      ?auto_6943 - SURFACE
      ?auto_6944 - SURFACE
      ?auto_6945 - SURFACE
    )
    :vars
    (
      ?auto_6947 - HOIST
      ?auto_6946 - PLACE
      ?auto_6949 - PLACE
      ?auto_6951 - HOIST
      ?auto_6950 - SURFACE
      ?auto_6953 - PLACE
      ?auto_6970 - HOIST
      ?auto_6961 - SURFACE
      ?auto_6952 - PLACE
      ?auto_6959 - HOIST
      ?auto_6969 - SURFACE
      ?auto_6957 - PLACE
      ?auto_6963 - HOIST
      ?auto_6960 - SURFACE
      ?auto_6971 - PLACE
      ?auto_6958 - HOIST
      ?auto_6962 - SURFACE
      ?auto_6974 - PLACE
      ?auto_6965 - HOIST
      ?auto_6973 - SURFACE
      ?auto_6964 - SURFACE
      ?auto_6954 - PLACE
      ?auto_6955 - HOIST
      ?auto_6956 - SURFACE
      ?auto_6972 - PLACE
      ?auto_6968 - HOIST
      ?auto_6966 - SURFACE
      ?auto_6967 - SURFACE
      ?auto_6948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6947 ?auto_6946 ) ( IS-CRATE ?auto_6945 ) ( not ( = ?auto_6949 ?auto_6946 ) ) ( HOIST-AT ?auto_6951 ?auto_6949 ) ( AVAILABLE ?auto_6951 ) ( SURFACE-AT ?auto_6945 ?auto_6949 ) ( ON ?auto_6945 ?auto_6950 ) ( CLEAR ?auto_6945 ) ( not ( = ?auto_6944 ?auto_6945 ) ) ( not ( = ?auto_6944 ?auto_6950 ) ) ( not ( = ?auto_6945 ?auto_6950 ) ) ( not ( = ?auto_6947 ?auto_6951 ) ) ( IS-CRATE ?auto_6944 ) ( not ( = ?auto_6953 ?auto_6946 ) ) ( HOIST-AT ?auto_6970 ?auto_6953 ) ( AVAILABLE ?auto_6970 ) ( SURFACE-AT ?auto_6944 ?auto_6953 ) ( ON ?auto_6944 ?auto_6961 ) ( CLEAR ?auto_6944 ) ( not ( = ?auto_6943 ?auto_6944 ) ) ( not ( = ?auto_6943 ?auto_6961 ) ) ( not ( = ?auto_6944 ?auto_6961 ) ) ( not ( = ?auto_6947 ?auto_6970 ) ) ( IS-CRATE ?auto_6943 ) ( not ( = ?auto_6952 ?auto_6946 ) ) ( HOIST-AT ?auto_6959 ?auto_6952 ) ( AVAILABLE ?auto_6959 ) ( SURFACE-AT ?auto_6943 ?auto_6952 ) ( ON ?auto_6943 ?auto_6969 ) ( CLEAR ?auto_6943 ) ( not ( = ?auto_6942 ?auto_6943 ) ) ( not ( = ?auto_6942 ?auto_6969 ) ) ( not ( = ?auto_6943 ?auto_6969 ) ) ( not ( = ?auto_6947 ?auto_6959 ) ) ( IS-CRATE ?auto_6942 ) ( not ( = ?auto_6957 ?auto_6946 ) ) ( HOIST-AT ?auto_6963 ?auto_6957 ) ( AVAILABLE ?auto_6963 ) ( SURFACE-AT ?auto_6942 ?auto_6957 ) ( ON ?auto_6942 ?auto_6960 ) ( CLEAR ?auto_6942 ) ( not ( = ?auto_6941 ?auto_6942 ) ) ( not ( = ?auto_6941 ?auto_6960 ) ) ( not ( = ?auto_6942 ?auto_6960 ) ) ( not ( = ?auto_6947 ?auto_6963 ) ) ( IS-CRATE ?auto_6941 ) ( not ( = ?auto_6971 ?auto_6946 ) ) ( HOIST-AT ?auto_6958 ?auto_6971 ) ( SURFACE-AT ?auto_6941 ?auto_6971 ) ( ON ?auto_6941 ?auto_6962 ) ( CLEAR ?auto_6941 ) ( not ( = ?auto_6940 ?auto_6941 ) ) ( not ( = ?auto_6940 ?auto_6962 ) ) ( not ( = ?auto_6941 ?auto_6962 ) ) ( not ( = ?auto_6947 ?auto_6958 ) ) ( IS-CRATE ?auto_6940 ) ( not ( = ?auto_6974 ?auto_6946 ) ) ( HOIST-AT ?auto_6965 ?auto_6974 ) ( AVAILABLE ?auto_6965 ) ( SURFACE-AT ?auto_6940 ?auto_6974 ) ( ON ?auto_6940 ?auto_6973 ) ( CLEAR ?auto_6940 ) ( not ( = ?auto_6939 ?auto_6940 ) ) ( not ( = ?auto_6939 ?auto_6973 ) ) ( not ( = ?auto_6940 ?auto_6973 ) ) ( not ( = ?auto_6947 ?auto_6965 ) ) ( IS-CRATE ?auto_6939 ) ( AVAILABLE ?auto_6958 ) ( SURFACE-AT ?auto_6939 ?auto_6971 ) ( ON ?auto_6939 ?auto_6964 ) ( CLEAR ?auto_6939 ) ( not ( = ?auto_6938 ?auto_6939 ) ) ( not ( = ?auto_6938 ?auto_6964 ) ) ( not ( = ?auto_6939 ?auto_6964 ) ) ( IS-CRATE ?auto_6938 ) ( not ( = ?auto_6954 ?auto_6946 ) ) ( HOIST-AT ?auto_6955 ?auto_6954 ) ( SURFACE-AT ?auto_6938 ?auto_6954 ) ( ON ?auto_6938 ?auto_6956 ) ( CLEAR ?auto_6938 ) ( not ( = ?auto_6937 ?auto_6938 ) ) ( not ( = ?auto_6937 ?auto_6956 ) ) ( not ( = ?auto_6938 ?auto_6956 ) ) ( not ( = ?auto_6947 ?auto_6955 ) ) ( IS-CRATE ?auto_6937 ) ( not ( = ?auto_6972 ?auto_6946 ) ) ( HOIST-AT ?auto_6968 ?auto_6972 ) ( AVAILABLE ?auto_6968 ) ( SURFACE-AT ?auto_6937 ?auto_6972 ) ( ON ?auto_6937 ?auto_6966 ) ( CLEAR ?auto_6937 ) ( not ( = ?auto_6936 ?auto_6937 ) ) ( not ( = ?auto_6936 ?auto_6966 ) ) ( not ( = ?auto_6937 ?auto_6966 ) ) ( not ( = ?auto_6947 ?auto_6968 ) ) ( SURFACE-AT ?auto_6935 ?auto_6946 ) ( CLEAR ?auto_6935 ) ( IS-CRATE ?auto_6936 ) ( AVAILABLE ?auto_6947 ) ( AVAILABLE ?auto_6955 ) ( SURFACE-AT ?auto_6936 ?auto_6954 ) ( ON ?auto_6936 ?auto_6967 ) ( CLEAR ?auto_6936 ) ( TRUCK-AT ?auto_6948 ?auto_6946 ) ( not ( = ?auto_6935 ?auto_6936 ) ) ( not ( = ?auto_6935 ?auto_6967 ) ) ( not ( = ?auto_6936 ?auto_6967 ) ) ( not ( = ?auto_6935 ?auto_6937 ) ) ( not ( = ?auto_6935 ?auto_6966 ) ) ( not ( = ?auto_6937 ?auto_6967 ) ) ( not ( = ?auto_6972 ?auto_6954 ) ) ( not ( = ?auto_6968 ?auto_6955 ) ) ( not ( = ?auto_6966 ?auto_6967 ) ) ( not ( = ?auto_6935 ?auto_6938 ) ) ( not ( = ?auto_6935 ?auto_6956 ) ) ( not ( = ?auto_6936 ?auto_6938 ) ) ( not ( = ?auto_6936 ?auto_6956 ) ) ( not ( = ?auto_6938 ?auto_6966 ) ) ( not ( = ?auto_6938 ?auto_6967 ) ) ( not ( = ?auto_6956 ?auto_6966 ) ) ( not ( = ?auto_6956 ?auto_6967 ) ) ( not ( = ?auto_6935 ?auto_6939 ) ) ( not ( = ?auto_6935 ?auto_6964 ) ) ( not ( = ?auto_6936 ?auto_6939 ) ) ( not ( = ?auto_6936 ?auto_6964 ) ) ( not ( = ?auto_6937 ?auto_6939 ) ) ( not ( = ?auto_6937 ?auto_6964 ) ) ( not ( = ?auto_6939 ?auto_6956 ) ) ( not ( = ?auto_6939 ?auto_6966 ) ) ( not ( = ?auto_6939 ?auto_6967 ) ) ( not ( = ?auto_6971 ?auto_6954 ) ) ( not ( = ?auto_6971 ?auto_6972 ) ) ( not ( = ?auto_6958 ?auto_6955 ) ) ( not ( = ?auto_6958 ?auto_6968 ) ) ( not ( = ?auto_6964 ?auto_6956 ) ) ( not ( = ?auto_6964 ?auto_6966 ) ) ( not ( = ?auto_6964 ?auto_6967 ) ) ( not ( = ?auto_6935 ?auto_6940 ) ) ( not ( = ?auto_6935 ?auto_6973 ) ) ( not ( = ?auto_6936 ?auto_6940 ) ) ( not ( = ?auto_6936 ?auto_6973 ) ) ( not ( = ?auto_6937 ?auto_6940 ) ) ( not ( = ?auto_6937 ?auto_6973 ) ) ( not ( = ?auto_6938 ?auto_6940 ) ) ( not ( = ?auto_6938 ?auto_6973 ) ) ( not ( = ?auto_6940 ?auto_6964 ) ) ( not ( = ?auto_6940 ?auto_6956 ) ) ( not ( = ?auto_6940 ?auto_6966 ) ) ( not ( = ?auto_6940 ?auto_6967 ) ) ( not ( = ?auto_6974 ?auto_6971 ) ) ( not ( = ?auto_6974 ?auto_6954 ) ) ( not ( = ?auto_6974 ?auto_6972 ) ) ( not ( = ?auto_6965 ?auto_6958 ) ) ( not ( = ?auto_6965 ?auto_6955 ) ) ( not ( = ?auto_6965 ?auto_6968 ) ) ( not ( = ?auto_6973 ?auto_6964 ) ) ( not ( = ?auto_6973 ?auto_6956 ) ) ( not ( = ?auto_6973 ?auto_6966 ) ) ( not ( = ?auto_6973 ?auto_6967 ) ) ( not ( = ?auto_6935 ?auto_6941 ) ) ( not ( = ?auto_6935 ?auto_6962 ) ) ( not ( = ?auto_6936 ?auto_6941 ) ) ( not ( = ?auto_6936 ?auto_6962 ) ) ( not ( = ?auto_6937 ?auto_6941 ) ) ( not ( = ?auto_6937 ?auto_6962 ) ) ( not ( = ?auto_6938 ?auto_6941 ) ) ( not ( = ?auto_6938 ?auto_6962 ) ) ( not ( = ?auto_6939 ?auto_6941 ) ) ( not ( = ?auto_6939 ?auto_6962 ) ) ( not ( = ?auto_6941 ?auto_6973 ) ) ( not ( = ?auto_6941 ?auto_6964 ) ) ( not ( = ?auto_6941 ?auto_6956 ) ) ( not ( = ?auto_6941 ?auto_6966 ) ) ( not ( = ?auto_6941 ?auto_6967 ) ) ( not ( = ?auto_6962 ?auto_6973 ) ) ( not ( = ?auto_6962 ?auto_6964 ) ) ( not ( = ?auto_6962 ?auto_6956 ) ) ( not ( = ?auto_6962 ?auto_6966 ) ) ( not ( = ?auto_6962 ?auto_6967 ) ) ( not ( = ?auto_6935 ?auto_6942 ) ) ( not ( = ?auto_6935 ?auto_6960 ) ) ( not ( = ?auto_6936 ?auto_6942 ) ) ( not ( = ?auto_6936 ?auto_6960 ) ) ( not ( = ?auto_6937 ?auto_6942 ) ) ( not ( = ?auto_6937 ?auto_6960 ) ) ( not ( = ?auto_6938 ?auto_6942 ) ) ( not ( = ?auto_6938 ?auto_6960 ) ) ( not ( = ?auto_6939 ?auto_6942 ) ) ( not ( = ?auto_6939 ?auto_6960 ) ) ( not ( = ?auto_6940 ?auto_6942 ) ) ( not ( = ?auto_6940 ?auto_6960 ) ) ( not ( = ?auto_6942 ?auto_6962 ) ) ( not ( = ?auto_6942 ?auto_6973 ) ) ( not ( = ?auto_6942 ?auto_6964 ) ) ( not ( = ?auto_6942 ?auto_6956 ) ) ( not ( = ?auto_6942 ?auto_6966 ) ) ( not ( = ?auto_6942 ?auto_6967 ) ) ( not ( = ?auto_6957 ?auto_6971 ) ) ( not ( = ?auto_6957 ?auto_6974 ) ) ( not ( = ?auto_6957 ?auto_6954 ) ) ( not ( = ?auto_6957 ?auto_6972 ) ) ( not ( = ?auto_6963 ?auto_6958 ) ) ( not ( = ?auto_6963 ?auto_6965 ) ) ( not ( = ?auto_6963 ?auto_6955 ) ) ( not ( = ?auto_6963 ?auto_6968 ) ) ( not ( = ?auto_6960 ?auto_6962 ) ) ( not ( = ?auto_6960 ?auto_6973 ) ) ( not ( = ?auto_6960 ?auto_6964 ) ) ( not ( = ?auto_6960 ?auto_6956 ) ) ( not ( = ?auto_6960 ?auto_6966 ) ) ( not ( = ?auto_6960 ?auto_6967 ) ) ( not ( = ?auto_6935 ?auto_6943 ) ) ( not ( = ?auto_6935 ?auto_6969 ) ) ( not ( = ?auto_6936 ?auto_6943 ) ) ( not ( = ?auto_6936 ?auto_6969 ) ) ( not ( = ?auto_6937 ?auto_6943 ) ) ( not ( = ?auto_6937 ?auto_6969 ) ) ( not ( = ?auto_6938 ?auto_6943 ) ) ( not ( = ?auto_6938 ?auto_6969 ) ) ( not ( = ?auto_6939 ?auto_6943 ) ) ( not ( = ?auto_6939 ?auto_6969 ) ) ( not ( = ?auto_6940 ?auto_6943 ) ) ( not ( = ?auto_6940 ?auto_6969 ) ) ( not ( = ?auto_6941 ?auto_6943 ) ) ( not ( = ?auto_6941 ?auto_6969 ) ) ( not ( = ?auto_6943 ?auto_6960 ) ) ( not ( = ?auto_6943 ?auto_6962 ) ) ( not ( = ?auto_6943 ?auto_6973 ) ) ( not ( = ?auto_6943 ?auto_6964 ) ) ( not ( = ?auto_6943 ?auto_6956 ) ) ( not ( = ?auto_6943 ?auto_6966 ) ) ( not ( = ?auto_6943 ?auto_6967 ) ) ( not ( = ?auto_6952 ?auto_6957 ) ) ( not ( = ?auto_6952 ?auto_6971 ) ) ( not ( = ?auto_6952 ?auto_6974 ) ) ( not ( = ?auto_6952 ?auto_6954 ) ) ( not ( = ?auto_6952 ?auto_6972 ) ) ( not ( = ?auto_6959 ?auto_6963 ) ) ( not ( = ?auto_6959 ?auto_6958 ) ) ( not ( = ?auto_6959 ?auto_6965 ) ) ( not ( = ?auto_6959 ?auto_6955 ) ) ( not ( = ?auto_6959 ?auto_6968 ) ) ( not ( = ?auto_6969 ?auto_6960 ) ) ( not ( = ?auto_6969 ?auto_6962 ) ) ( not ( = ?auto_6969 ?auto_6973 ) ) ( not ( = ?auto_6969 ?auto_6964 ) ) ( not ( = ?auto_6969 ?auto_6956 ) ) ( not ( = ?auto_6969 ?auto_6966 ) ) ( not ( = ?auto_6969 ?auto_6967 ) ) ( not ( = ?auto_6935 ?auto_6944 ) ) ( not ( = ?auto_6935 ?auto_6961 ) ) ( not ( = ?auto_6936 ?auto_6944 ) ) ( not ( = ?auto_6936 ?auto_6961 ) ) ( not ( = ?auto_6937 ?auto_6944 ) ) ( not ( = ?auto_6937 ?auto_6961 ) ) ( not ( = ?auto_6938 ?auto_6944 ) ) ( not ( = ?auto_6938 ?auto_6961 ) ) ( not ( = ?auto_6939 ?auto_6944 ) ) ( not ( = ?auto_6939 ?auto_6961 ) ) ( not ( = ?auto_6940 ?auto_6944 ) ) ( not ( = ?auto_6940 ?auto_6961 ) ) ( not ( = ?auto_6941 ?auto_6944 ) ) ( not ( = ?auto_6941 ?auto_6961 ) ) ( not ( = ?auto_6942 ?auto_6944 ) ) ( not ( = ?auto_6942 ?auto_6961 ) ) ( not ( = ?auto_6944 ?auto_6969 ) ) ( not ( = ?auto_6944 ?auto_6960 ) ) ( not ( = ?auto_6944 ?auto_6962 ) ) ( not ( = ?auto_6944 ?auto_6973 ) ) ( not ( = ?auto_6944 ?auto_6964 ) ) ( not ( = ?auto_6944 ?auto_6956 ) ) ( not ( = ?auto_6944 ?auto_6966 ) ) ( not ( = ?auto_6944 ?auto_6967 ) ) ( not ( = ?auto_6953 ?auto_6952 ) ) ( not ( = ?auto_6953 ?auto_6957 ) ) ( not ( = ?auto_6953 ?auto_6971 ) ) ( not ( = ?auto_6953 ?auto_6974 ) ) ( not ( = ?auto_6953 ?auto_6954 ) ) ( not ( = ?auto_6953 ?auto_6972 ) ) ( not ( = ?auto_6970 ?auto_6959 ) ) ( not ( = ?auto_6970 ?auto_6963 ) ) ( not ( = ?auto_6970 ?auto_6958 ) ) ( not ( = ?auto_6970 ?auto_6965 ) ) ( not ( = ?auto_6970 ?auto_6955 ) ) ( not ( = ?auto_6970 ?auto_6968 ) ) ( not ( = ?auto_6961 ?auto_6969 ) ) ( not ( = ?auto_6961 ?auto_6960 ) ) ( not ( = ?auto_6961 ?auto_6962 ) ) ( not ( = ?auto_6961 ?auto_6973 ) ) ( not ( = ?auto_6961 ?auto_6964 ) ) ( not ( = ?auto_6961 ?auto_6956 ) ) ( not ( = ?auto_6961 ?auto_6966 ) ) ( not ( = ?auto_6961 ?auto_6967 ) ) ( not ( = ?auto_6935 ?auto_6945 ) ) ( not ( = ?auto_6935 ?auto_6950 ) ) ( not ( = ?auto_6936 ?auto_6945 ) ) ( not ( = ?auto_6936 ?auto_6950 ) ) ( not ( = ?auto_6937 ?auto_6945 ) ) ( not ( = ?auto_6937 ?auto_6950 ) ) ( not ( = ?auto_6938 ?auto_6945 ) ) ( not ( = ?auto_6938 ?auto_6950 ) ) ( not ( = ?auto_6939 ?auto_6945 ) ) ( not ( = ?auto_6939 ?auto_6950 ) ) ( not ( = ?auto_6940 ?auto_6945 ) ) ( not ( = ?auto_6940 ?auto_6950 ) ) ( not ( = ?auto_6941 ?auto_6945 ) ) ( not ( = ?auto_6941 ?auto_6950 ) ) ( not ( = ?auto_6942 ?auto_6945 ) ) ( not ( = ?auto_6942 ?auto_6950 ) ) ( not ( = ?auto_6943 ?auto_6945 ) ) ( not ( = ?auto_6943 ?auto_6950 ) ) ( not ( = ?auto_6945 ?auto_6961 ) ) ( not ( = ?auto_6945 ?auto_6969 ) ) ( not ( = ?auto_6945 ?auto_6960 ) ) ( not ( = ?auto_6945 ?auto_6962 ) ) ( not ( = ?auto_6945 ?auto_6973 ) ) ( not ( = ?auto_6945 ?auto_6964 ) ) ( not ( = ?auto_6945 ?auto_6956 ) ) ( not ( = ?auto_6945 ?auto_6966 ) ) ( not ( = ?auto_6945 ?auto_6967 ) ) ( not ( = ?auto_6949 ?auto_6953 ) ) ( not ( = ?auto_6949 ?auto_6952 ) ) ( not ( = ?auto_6949 ?auto_6957 ) ) ( not ( = ?auto_6949 ?auto_6971 ) ) ( not ( = ?auto_6949 ?auto_6974 ) ) ( not ( = ?auto_6949 ?auto_6954 ) ) ( not ( = ?auto_6949 ?auto_6972 ) ) ( not ( = ?auto_6951 ?auto_6970 ) ) ( not ( = ?auto_6951 ?auto_6959 ) ) ( not ( = ?auto_6951 ?auto_6963 ) ) ( not ( = ?auto_6951 ?auto_6958 ) ) ( not ( = ?auto_6951 ?auto_6965 ) ) ( not ( = ?auto_6951 ?auto_6955 ) ) ( not ( = ?auto_6951 ?auto_6968 ) ) ( not ( = ?auto_6950 ?auto_6961 ) ) ( not ( = ?auto_6950 ?auto_6969 ) ) ( not ( = ?auto_6950 ?auto_6960 ) ) ( not ( = ?auto_6950 ?auto_6962 ) ) ( not ( = ?auto_6950 ?auto_6973 ) ) ( not ( = ?auto_6950 ?auto_6964 ) ) ( not ( = ?auto_6950 ?auto_6956 ) ) ( not ( = ?auto_6950 ?auto_6966 ) ) ( not ( = ?auto_6950 ?auto_6967 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_6935 ?auto_6936 ?auto_6937 ?auto_6938 ?auto_6939 ?auto_6940 ?auto_6941 ?auto_6942 ?auto_6943 ?auto_6944 )
      ( MAKE-1CRATE ?auto_6944 ?auto_6945 )
      ( MAKE-10CRATE-VERIFY ?auto_6935 ?auto_6936 ?auto_6937 ?auto_6938 ?auto_6939 ?auto_6940 ?auto_6941 ?auto_6942 ?auto_6943 ?auto_6944 ?auto_6945 ) )
  )

)

