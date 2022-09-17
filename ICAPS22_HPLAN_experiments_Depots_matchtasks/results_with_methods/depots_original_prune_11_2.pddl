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

  ( :method MAKE-11CRATE-VERIFY
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
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479577 - SURFACE
      ?auto_479578 - SURFACE
    )
    :vars
    (
      ?auto_479579 - HOIST
      ?auto_479580 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479579 ?auto_479580 ) ( SURFACE-AT ?auto_479577 ?auto_479580 ) ( CLEAR ?auto_479577 ) ( LIFTING ?auto_479579 ?auto_479578 ) ( IS-CRATE ?auto_479578 ) ( not ( = ?auto_479577 ?auto_479578 ) ) )
    :subtasks
    ( ( !DROP ?auto_479579 ?auto_479578 ?auto_479577 ?auto_479580 )
      ( MAKE-1CRATE-VERIFY ?auto_479577 ?auto_479578 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479581 - SURFACE
      ?auto_479582 - SURFACE
    )
    :vars
    (
      ?auto_479584 - HOIST
      ?auto_479583 - PLACE
      ?auto_479585 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479584 ?auto_479583 ) ( SURFACE-AT ?auto_479581 ?auto_479583 ) ( CLEAR ?auto_479581 ) ( IS-CRATE ?auto_479582 ) ( not ( = ?auto_479581 ?auto_479582 ) ) ( TRUCK-AT ?auto_479585 ?auto_479583 ) ( AVAILABLE ?auto_479584 ) ( IN ?auto_479582 ?auto_479585 ) )
    :subtasks
    ( ( !UNLOAD ?auto_479584 ?auto_479582 ?auto_479585 ?auto_479583 )
      ( MAKE-1CRATE ?auto_479581 ?auto_479582 )
      ( MAKE-1CRATE-VERIFY ?auto_479581 ?auto_479582 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479586 - SURFACE
      ?auto_479587 - SURFACE
    )
    :vars
    (
      ?auto_479590 - HOIST
      ?auto_479589 - PLACE
      ?auto_479588 - TRUCK
      ?auto_479591 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479590 ?auto_479589 ) ( SURFACE-AT ?auto_479586 ?auto_479589 ) ( CLEAR ?auto_479586 ) ( IS-CRATE ?auto_479587 ) ( not ( = ?auto_479586 ?auto_479587 ) ) ( AVAILABLE ?auto_479590 ) ( IN ?auto_479587 ?auto_479588 ) ( TRUCK-AT ?auto_479588 ?auto_479591 ) ( not ( = ?auto_479591 ?auto_479589 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_479588 ?auto_479591 ?auto_479589 )
      ( MAKE-1CRATE ?auto_479586 ?auto_479587 )
      ( MAKE-1CRATE-VERIFY ?auto_479586 ?auto_479587 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479592 - SURFACE
      ?auto_479593 - SURFACE
    )
    :vars
    (
      ?auto_479595 - HOIST
      ?auto_479594 - PLACE
      ?auto_479597 - TRUCK
      ?auto_479596 - PLACE
      ?auto_479598 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_479595 ?auto_479594 ) ( SURFACE-AT ?auto_479592 ?auto_479594 ) ( CLEAR ?auto_479592 ) ( IS-CRATE ?auto_479593 ) ( not ( = ?auto_479592 ?auto_479593 ) ) ( AVAILABLE ?auto_479595 ) ( TRUCK-AT ?auto_479597 ?auto_479596 ) ( not ( = ?auto_479596 ?auto_479594 ) ) ( HOIST-AT ?auto_479598 ?auto_479596 ) ( LIFTING ?auto_479598 ?auto_479593 ) ( not ( = ?auto_479595 ?auto_479598 ) ) )
    :subtasks
    ( ( !LOAD ?auto_479598 ?auto_479593 ?auto_479597 ?auto_479596 )
      ( MAKE-1CRATE ?auto_479592 ?auto_479593 )
      ( MAKE-1CRATE-VERIFY ?auto_479592 ?auto_479593 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479599 - SURFACE
      ?auto_479600 - SURFACE
    )
    :vars
    (
      ?auto_479601 - HOIST
      ?auto_479605 - PLACE
      ?auto_479602 - TRUCK
      ?auto_479603 - PLACE
      ?auto_479604 - HOIST
      ?auto_479606 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479601 ?auto_479605 ) ( SURFACE-AT ?auto_479599 ?auto_479605 ) ( CLEAR ?auto_479599 ) ( IS-CRATE ?auto_479600 ) ( not ( = ?auto_479599 ?auto_479600 ) ) ( AVAILABLE ?auto_479601 ) ( TRUCK-AT ?auto_479602 ?auto_479603 ) ( not ( = ?auto_479603 ?auto_479605 ) ) ( HOIST-AT ?auto_479604 ?auto_479603 ) ( not ( = ?auto_479601 ?auto_479604 ) ) ( AVAILABLE ?auto_479604 ) ( SURFACE-AT ?auto_479600 ?auto_479603 ) ( ON ?auto_479600 ?auto_479606 ) ( CLEAR ?auto_479600 ) ( not ( = ?auto_479599 ?auto_479606 ) ) ( not ( = ?auto_479600 ?auto_479606 ) ) )
    :subtasks
    ( ( !LIFT ?auto_479604 ?auto_479600 ?auto_479606 ?auto_479603 )
      ( MAKE-1CRATE ?auto_479599 ?auto_479600 )
      ( MAKE-1CRATE-VERIFY ?auto_479599 ?auto_479600 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479607 - SURFACE
      ?auto_479608 - SURFACE
    )
    :vars
    (
      ?auto_479613 - HOIST
      ?auto_479614 - PLACE
      ?auto_479609 - PLACE
      ?auto_479611 - HOIST
      ?auto_479610 - SURFACE
      ?auto_479612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479613 ?auto_479614 ) ( SURFACE-AT ?auto_479607 ?auto_479614 ) ( CLEAR ?auto_479607 ) ( IS-CRATE ?auto_479608 ) ( not ( = ?auto_479607 ?auto_479608 ) ) ( AVAILABLE ?auto_479613 ) ( not ( = ?auto_479609 ?auto_479614 ) ) ( HOIST-AT ?auto_479611 ?auto_479609 ) ( not ( = ?auto_479613 ?auto_479611 ) ) ( AVAILABLE ?auto_479611 ) ( SURFACE-AT ?auto_479608 ?auto_479609 ) ( ON ?auto_479608 ?auto_479610 ) ( CLEAR ?auto_479608 ) ( not ( = ?auto_479607 ?auto_479610 ) ) ( not ( = ?auto_479608 ?auto_479610 ) ) ( TRUCK-AT ?auto_479612 ?auto_479614 ) )
    :subtasks
    ( ( !DRIVE ?auto_479612 ?auto_479614 ?auto_479609 )
      ( MAKE-1CRATE ?auto_479607 ?auto_479608 )
      ( MAKE-1CRATE-VERIFY ?auto_479607 ?auto_479608 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_479624 - SURFACE
      ?auto_479625 - SURFACE
      ?auto_479626 - SURFACE
    )
    :vars
    (
      ?auto_479627 - HOIST
      ?auto_479628 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479627 ?auto_479628 ) ( SURFACE-AT ?auto_479625 ?auto_479628 ) ( CLEAR ?auto_479625 ) ( LIFTING ?auto_479627 ?auto_479626 ) ( IS-CRATE ?auto_479626 ) ( not ( = ?auto_479625 ?auto_479626 ) ) ( ON ?auto_479625 ?auto_479624 ) ( not ( = ?auto_479624 ?auto_479625 ) ) ( not ( = ?auto_479624 ?auto_479626 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479625 ?auto_479626 )
      ( MAKE-2CRATE-VERIFY ?auto_479624 ?auto_479625 ?auto_479626 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_479634 - SURFACE
      ?auto_479635 - SURFACE
      ?auto_479636 - SURFACE
    )
    :vars
    (
      ?auto_479639 - HOIST
      ?auto_479638 - PLACE
      ?auto_479637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479639 ?auto_479638 ) ( SURFACE-AT ?auto_479635 ?auto_479638 ) ( CLEAR ?auto_479635 ) ( IS-CRATE ?auto_479636 ) ( not ( = ?auto_479635 ?auto_479636 ) ) ( TRUCK-AT ?auto_479637 ?auto_479638 ) ( AVAILABLE ?auto_479639 ) ( IN ?auto_479636 ?auto_479637 ) ( ON ?auto_479635 ?auto_479634 ) ( not ( = ?auto_479634 ?auto_479635 ) ) ( not ( = ?auto_479634 ?auto_479636 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479635 ?auto_479636 )
      ( MAKE-2CRATE-VERIFY ?auto_479634 ?auto_479635 ?auto_479636 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479640 - SURFACE
      ?auto_479641 - SURFACE
    )
    :vars
    (
      ?auto_479642 - HOIST
      ?auto_479644 - PLACE
      ?auto_479645 - TRUCK
      ?auto_479643 - SURFACE
      ?auto_479646 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479642 ?auto_479644 ) ( SURFACE-AT ?auto_479640 ?auto_479644 ) ( CLEAR ?auto_479640 ) ( IS-CRATE ?auto_479641 ) ( not ( = ?auto_479640 ?auto_479641 ) ) ( AVAILABLE ?auto_479642 ) ( IN ?auto_479641 ?auto_479645 ) ( ON ?auto_479640 ?auto_479643 ) ( not ( = ?auto_479643 ?auto_479640 ) ) ( not ( = ?auto_479643 ?auto_479641 ) ) ( TRUCK-AT ?auto_479645 ?auto_479646 ) ( not ( = ?auto_479646 ?auto_479644 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_479645 ?auto_479646 ?auto_479644 )
      ( MAKE-2CRATE ?auto_479643 ?auto_479640 ?auto_479641 )
      ( MAKE-1CRATE-VERIFY ?auto_479640 ?auto_479641 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_479647 - SURFACE
      ?auto_479648 - SURFACE
      ?auto_479649 - SURFACE
    )
    :vars
    (
      ?auto_479653 - HOIST
      ?auto_479652 - PLACE
      ?auto_479650 - TRUCK
      ?auto_479651 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479653 ?auto_479652 ) ( SURFACE-AT ?auto_479648 ?auto_479652 ) ( CLEAR ?auto_479648 ) ( IS-CRATE ?auto_479649 ) ( not ( = ?auto_479648 ?auto_479649 ) ) ( AVAILABLE ?auto_479653 ) ( IN ?auto_479649 ?auto_479650 ) ( ON ?auto_479648 ?auto_479647 ) ( not ( = ?auto_479647 ?auto_479648 ) ) ( not ( = ?auto_479647 ?auto_479649 ) ) ( TRUCK-AT ?auto_479650 ?auto_479651 ) ( not ( = ?auto_479651 ?auto_479652 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479648 ?auto_479649 )
      ( MAKE-2CRATE-VERIFY ?auto_479647 ?auto_479648 ?auto_479649 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479654 - SURFACE
      ?auto_479655 - SURFACE
    )
    :vars
    (
      ?auto_479658 - HOIST
      ?auto_479660 - PLACE
      ?auto_479659 - SURFACE
      ?auto_479656 - TRUCK
      ?auto_479657 - PLACE
      ?auto_479661 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_479658 ?auto_479660 ) ( SURFACE-AT ?auto_479654 ?auto_479660 ) ( CLEAR ?auto_479654 ) ( IS-CRATE ?auto_479655 ) ( not ( = ?auto_479654 ?auto_479655 ) ) ( AVAILABLE ?auto_479658 ) ( ON ?auto_479654 ?auto_479659 ) ( not ( = ?auto_479659 ?auto_479654 ) ) ( not ( = ?auto_479659 ?auto_479655 ) ) ( TRUCK-AT ?auto_479656 ?auto_479657 ) ( not ( = ?auto_479657 ?auto_479660 ) ) ( HOIST-AT ?auto_479661 ?auto_479657 ) ( LIFTING ?auto_479661 ?auto_479655 ) ( not ( = ?auto_479658 ?auto_479661 ) ) )
    :subtasks
    ( ( !LOAD ?auto_479661 ?auto_479655 ?auto_479656 ?auto_479657 )
      ( MAKE-2CRATE ?auto_479659 ?auto_479654 ?auto_479655 )
      ( MAKE-1CRATE-VERIFY ?auto_479654 ?auto_479655 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_479662 - SURFACE
      ?auto_479663 - SURFACE
      ?auto_479664 - SURFACE
    )
    :vars
    (
      ?auto_479669 - HOIST
      ?auto_479667 - PLACE
      ?auto_479666 - TRUCK
      ?auto_479668 - PLACE
      ?auto_479665 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_479669 ?auto_479667 ) ( SURFACE-AT ?auto_479663 ?auto_479667 ) ( CLEAR ?auto_479663 ) ( IS-CRATE ?auto_479664 ) ( not ( = ?auto_479663 ?auto_479664 ) ) ( AVAILABLE ?auto_479669 ) ( ON ?auto_479663 ?auto_479662 ) ( not ( = ?auto_479662 ?auto_479663 ) ) ( not ( = ?auto_479662 ?auto_479664 ) ) ( TRUCK-AT ?auto_479666 ?auto_479668 ) ( not ( = ?auto_479668 ?auto_479667 ) ) ( HOIST-AT ?auto_479665 ?auto_479668 ) ( LIFTING ?auto_479665 ?auto_479664 ) ( not ( = ?auto_479669 ?auto_479665 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479663 ?auto_479664 )
      ( MAKE-2CRATE-VERIFY ?auto_479662 ?auto_479663 ?auto_479664 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479670 - SURFACE
      ?auto_479671 - SURFACE
    )
    :vars
    (
      ?auto_479674 - HOIST
      ?auto_479677 - PLACE
      ?auto_479675 - SURFACE
      ?auto_479673 - TRUCK
      ?auto_479676 - PLACE
      ?auto_479672 - HOIST
      ?auto_479678 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479674 ?auto_479677 ) ( SURFACE-AT ?auto_479670 ?auto_479677 ) ( CLEAR ?auto_479670 ) ( IS-CRATE ?auto_479671 ) ( not ( = ?auto_479670 ?auto_479671 ) ) ( AVAILABLE ?auto_479674 ) ( ON ?auto_479670 ?auto_479675 ) ( not ( = ?auto_479675 ?auto_479670 ) ) ( not ( = ?auto_479675 ?auto_479671 ) ) ( TRUCK-AT ?auto_479673 ?auto_479676 ) ( not ( = ?auto_479676 ?auto_479677 ) ) ( HOIST-AT ?auto_479672 ?auto_479676 ) ( not ( = ?auto_479674 ?auto_479672 ) ) ( AVAILABLE ?auto_479672 ) ( SURFACE-AT ?auto_479671 ?auto_479676 ) ( ON ?auto_479671 ?auto_479678 ) ( CLEAR ?auto_479671 ) ( not ( = ?auto_479670 ?auto_479678 ) ) ( not ( = ?auto_479671 ?auto_479678 ) ) ( not ( = ?auto_479675 ?auto_479678 ) ) )
    :subtasks
    ( ( !LIFT ?auto_479672 ?auto_479671 ?auto_479678 ?auto_479676 )
      ( MAKE-2CRATE ?auto_479675 ?auto_479670 ?auto_479671 )
      ( MAKE-1CRATE-VERIFY ?auto_479670 ?auto_479671 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_479679 - SURFACE
      ?auto_479680 - SURFACE
      ?auto_479681 - SURFACE
    )
    :vars
    (
      ?auto_479687 - HOIST
      ?auto_479686 - PLACE
      ?auto_479685 - TRUCK
      ?auto_479683 - PLACE
      ?auto_479682 - HOIST
      ?auto_479684 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479687 ?auto_479686 ) ( SURFACE-AT ?auto_479680 ?auto_479686 ) ( CLEAR ?auto_479680 ) ( IS-CRATE ?auto_479681 ) ( not ( = ?auto_479680 ?auto_479681 ) ) ( AVAILABLE ?auto_479687 ) ( ON ?auto_479680 ?auto_479679 ) ( not ( = ?auto_479679 ?auto_479680 ) ) ( not ( = ?auto_479679 ?auto_479681 ) ) ( TRUCK-AT ?auto_479685 ?auto_479683 ) ( not ( = ?auto_479683 ?auto_479686 ) ) ( HOIST-AT ?auto_479682 ?auto_479683 ) ( not ( = ?auto_479687 ?auto_479682 ) ) ( AVAILABLE ?auto_479682 ) ( SURFACE-AT ?auto_479681 ?auto_479683 ) ( ON ?auto_479681 ?auto_479684 ) ( CLEAR ?auto_479681 ) ( not ( = ?auto_479680 ?auto_479684 ) ) ( not ( = ?auto_479681 ?auto_479684 ) ) ( not ( = ?auto_479679 ?auto_479684 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479680 ?auto_479681 )
      ( MAKE-2CRATE-VERIFY ?auto_479679 ?auto_479680 ?auto_479681 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479688 - SURFACE
      ?auto_479689 - SURFACE
    )
    :vars
    (
      ?auto_479693 - HOIST
      ?auto_479692 - PLACE
      ?auto_479695 - SURFACE
      ?auto_479694 - PLACE
      ?auto_479696 - HOIST
      ?auto_479691 - SURFACE
      ?auto_479690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479693 ?auto_479692 ) ( SURFACE-AT ?auto_479688 ?auto_479692 ) ( CLEAR ?auto_479688 ) ( IS-CRATE ?auto_479689 ) ( not ( = ?auto_479688 ?auto_479689 ) ) ( AVAILABLE ?auto_479693 ) ( ON ?auto_479688 ?auto_479695 ) ( not ( = ?auto_479695 ?auto_479688 ) ) ( not ( = ?auto_479695 ?auto_479689 ) ) ( not ( = ?auto_479694 ?auto_479692 ) ) ( HOIST-AT ?auto_479696 ?auto_479694 ) ( not ( = ?auto_479693 ?auto_479696 ) ) ( AVAILABLE ?auto_479696 ) ( SURFACE-AT ?auto_479689 ?auto_479694 ) ( ON ?auto_479689 ?auto_479691 ) ( CLEAR ?auto_479689 ) ( not ( = ?auto_479688 ?auto_479691 ) ) ( not ( = ?auto_479689 ?auto_479691 ) ) ( not ( = ?auto_479695 ?auto_479691 ) ) ( TRUCK-AT ?auto_479690 ?auto_479692 ) )
    :subtasks
    ( ( !DRIVE ?auto_479690 ?auto_479692 ?auto_479694 )
      ( MAKE-2CRATE ?auto_479695 ?auto_479688 ?auto_479689 )
      ( MAKE-1CRATE-VERIFY ?auto_479688 ?auto_479689 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_479697 - SURFACE
      ?auto_479698 - SURFACE
      ?auto_479699 - SURFACE
    )
    :vars
    (
      ?auto_479704 - HOIST
      ?auto_479700 - PLACE
      ?auto_479705 - PLACE
      ?auto_479701 - HOIST
      ?auto_479703 - SURFACE
      ?auto_479702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479704 ?auto_479700 ) ( SURFACE-AT ?auto_479698 ?auto_479700 ) ( CLEAR ?auto_479698 ) ( IS-CRATE ?auto_479699 ) ( not ( = ?auto_479698 ?auto_479699 ) ) ( AVAILABLE ?auto_479704 ) ( ON ?auto_479698 ?auto_479697 ) ( not ( = ?auto_479697 ?auto_479698 ) ) ( not ( = ?auto_479697 ?auto_479699 ) ) ( not ( = ?auto_479705 ?auto_479700 ) ) ( HOIST-AT ?auto_479701 ?auto_479705 ) ( not ( = ?auto_479704 ?auto_479701 ) ) ( AVAILABLE ?auto_479701 ) ( SURFACE-AT ?auto_479699 ?auto_479705 ) ( ON ?auto_479699 ?auto_479703 ) ( CLEAR ?auto_479699 ) ( not ( = ?auto_479698 ?auto_479703 ) ) ( not ( = ?auto_479699 ?auto_479703 ) ) ( not ( = ?auto_479697 ?auto_479703 ) ) ( TRUCK-AT ?auto_479702 ?auto_479700 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479698 ?auto_479699 )
      ( MAKE-2CRATE-VERIFY ?auto_479697 ?auto_479698 ?auto_479699 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479706 - SURFACE
      ?auto_479707 - SURFACE
    )
    :vars
    (
      ?auto_479710 - HOIST
      ?auto_479709 - PLACE
      ?auto_479711 - SURFACE
      ?auto_479713 - PLACE
      ?auto_479714 - HOIST
      ?auto_479708 - SURFACE
      ?auto_479712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479710 ?auto_479709 ) ( IS-CRATE ?auto_479707 ) ( not ( = ?auto_479706 ?auto_479707 ) ) ( not ( = ?auto_479711 ?auto_479706 ) ) ( not ( = ?auto_479711 ?auto_479707 ) ) ( not ( = ?auto_479713 ?auto_479709 ) ) ( HOIST-AT ?auto_479714 ?auto_479713 ) ( not ( = ?auto_479710 ?auto_479714 ) ) ( AVAILABLE ?auto_479714 ) ( SURFACE-AT ?auto_479707 ?auto_479713 ) ( ON ?auto_479707 ?auto_479708 ) ( CLEAR ?auto_479707 ) ( not ( = ?auto_479706 ?auto_479708 ) ) ( not ( = ?auto_479707 ?auto_479708 ) ) ( not ( = ?auto_479711 ?auto_479708 ) ) ( TRUCK-AT ?auto_479712 ?auto_479709 ) ( SURFACE-AT ?auto_479711 ?auto_479709 ) ( CLEAR ?auto_479711 ) ( LIFTING ?auto_479710 ?auto_479706 ) ( IS-CRATE ?auto_479706 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479711 ?auto_479706 )
      ( MAKE-2CRATE ?auto_479711 ?auto_479706 ?auto_479707 )
      ( MAKE-1CRATE-VERIFY ?auto_479706 ?auto_479707 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_479715 - SURFACE
      ?auto_479716 - SURFACE
      ?auto_479717 - SURFACE
    )
    :vars
    (
      ?auto_479720 - HOIST
      ?auto_479722 - PLACE
      ?auto_479723 - PLACE
      ?auto_479718 - HOIST
      ?auto_479721 - SURFACE
      ?auto_479719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479720 ?auto_479722 ) ( IS-CRATE ?auto_479717 ) ( not ( = ?auto_479716 ?auto_479717 ) ) ( not ( = ?auto_479715 ?auto_479716 ) ) ( not ( = ?auto_479715 ?auto_479717 ) ) ( not ( = ?auto_479723 ?auto_479722 ) ) ( HOIST-AT ?auto_479718 ?auto_479723 ) ( not ( = ?auto_479720 ?auto_479718 ) ) ( AVAILABLE ?auto_479718 ) ( SURFACE-AT ?auto_479717 ?auto_479723 ) ( ON ?auto_479717 ?auto_479721 ) ( CLEAR ?auto_479717 ) ( not ( = ?auto_479716 ?auto_479721 ) ) ( not ( = ?auto_479717 ?auto_479721 ) ) ( not ( = ?auto_479715 ?auto_479721 ) ) ( TRUCK-AT ?auto_479719 ?auto_479722 ) ( SURFACE-AT ?auto_479715 ?auto_479722 ) ( CLEAR ?auto_479715 ) ( LIFTING ?auto_479720 ?auto_479716 ) ( IS-CRATE ?auto_479716 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479716 ?auto_479717 )
      ( MAKE-2CRATE-VERIFY ?auto_479715 ?auto_479716 ?auto_479717 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479724 - SURFACE
      ?auto_479725 - SURFACE
    )
    :vars
    (
      ?auto_479727 - HOIST
      ?auto_479731 - PLACE
      ?auto_479726 - SURFACE
      ?auto_479728 - PLACE
      ?auto_479732 - HOIST
      ?auto_479729 - SURFACE
      ?auto_479730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479727 ?auto_479731 ) ( IS-CRATE ?auto_479725 ) ( not ( = ?auto_479724 ?auto_479725 ) ) ( not ( = ?auto_479726 ?auto_479724 ) ) ( not ( = ?auto_479726 ?auto_479725 ) ) ( not ( = ?auto_479728 ?auto_479731 ) ) ( HOIST-AT ?auto_479732 ?auto_479728 ) ( not ( = ?auto_479727 ?auto_479732 ) ) ( AVAILABLE ?auto_479732 ) ( SURFACE-AT ?auto_479725 ?auto_479728 ) ( ON ?auto_479725 ?auto_479729 ) ( CLEAR ?auto_479725 ) ( not ( = ?auto_479724 ?auto_479729 ) ) ( not ( = ?auto_479725 ?auto_479729 ) ) ( not ( = ?auto_479726 ?auto_479729 ) ) ( TRUCK-AT ?auto_479730 ?auto_479731 ) ( SURFACE-AT ?auto_479726 ?auto_479731 ) ( CLEAR ?auto_479726 ) ( IS-CRATE ?auto_479724 ) ( AVAILABLE ?auto_479727 ) ( IN ?auto_479724 ?auto_479730 ) )
    :subtasks
    ( ( !UNLOAD ?auto_479727 ?auto_479724 ?auto_479730 ?auto_479731 )
      ( MAKE-2CRATE ?auto_479726 ?auto_479724 ?auto_479725 )
      ( MAKE-1CRATE-VERIFY ?auto_479724 ?auto_479725 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_479733 - SURFACE
      ?auto_479734 - SURFACE
      ?auto_479735 - SURFACE
    )
    :vars
    (
      ?auto_479736 - HOIST
      ?auto_479740 - PLACE
      ?auto_479737 - PLACE
      ?auto_479738 - HOIST
      ?auto_479741 - SURFACE
      ?auto_479739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479736 ?auto_479740 ) ( IS-CRATE ?auto_479735 ) ( not ( = ?auto_479734 ?auto_479735 ) ) ( not ( = ?auto_479733 ?auto_479734 ) ) ( not ( = ?auto_479733 ?auto_479735 ) ) ( not ( = ?auto_479737 ?auto_479740 ) ) ( HOIST-AT ?auto_479738 ?auto_479737 ) ( not ( = ?auto_479736 ?auto_479738 ) ) ( AVAILABLE ?auto_479738 ) ( SURFACE-AT ?auto_479735 ?auto_479737 ) ( ON ?auto_479735 ?auto_479741 ) ( CLEAR ?auto_479735 ) ( not ( = ?auto_479734 ?auto_479741 ) ) ( not ( = ?auto_479735 ?auto_479741 ) ) ( not ( = ?auto_479733 ?auto_479741 ) ) ( TRUCK-AT ?auto_479739 ?auto_479740 ) ( SURFACE-AT ?auto_479733 ?auto_479740 ) ( CLEAR ?auto_479733 ) ( IS-CRATE ?auto_479734 ) ( AVAILABLE ?auto_479736 ) ( IN ?auto_479734 ?auto_479739 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479734 ?auto_479735 )
      ( MAKE-2CRATE-VERIFY ?auto_479733 ?auto_479734 ?auto_479735 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_479778 - SURFACE
      ?auto_479779 - SURFACE
    )
    :vars
    (
      ?auto_479786 - HOIST
      ?auto_479781 - PLACE
      ?auto_479783 - SURFACE
      ?auto_479785 - PLACE
      ?auto_479780 - HOIST
      ?auto_479784 - SURFACE
      ?auto_479782 - TRUCK
      ?auto_479787 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479786 ?auto_479781 ) ( SURFACE-AT ?auto_479778 ?auto_479781 ) ( CLEAR ?auto_479778 ) ( IS-CRATE ?auto_479779 ) ( not ( = ?auto_479778 ?auto_479779 ) ) ( AVAILABLE ?auto_479786 ) ( ON ?auto_479778 ?auto_479783 ) ( not ( = ?auto_479783 ?auto_479778 ) ) ( not ( = ?auto_479783 ?auto_479779 ) ) ( not ( = ?auto_479785 ?auto_479781 ) ) ( HOIST-AT ?auto_479780 ?auto_479785 ) ( not ( = ?auto_479786 ?auto_479780 ) ) ( AVAILABLE ?auto_479780 ) ( SURFACE-AT ?auto_479779 ?auto_479785 ) ( ON ?auto_479779 ?auto_479784 ) ( CLEAR ?auto_479779 ) ( not ( = ?auto_479778 ?auto_479784 ) ) ( not ( = ?auto_479779 ?auto_479784 ) ) ( not ( = ?auto_479783 ?auto_479784 ) ) ( TRUCK-AT ?auto_479782 ?auto_479787 ) ( not ( = ?auto_479787 ?auto_479781 ) ) ( not ( = ?auto_479785 ?auto_479787 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_479782 ?auto_479787 ?auto_479781 )
      ( MAKE-1CRATE ?auto_479778 ?auto_479779 )
      ( MAKE-1CRATE-VERIFY ?auto_479778 ?auto_479779 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_479818 - SURFACE
      ?auto_479819 - SURFACE
      ?auto_479820 - SURFACE
      ?auto_479817 - SURFACE
    )
    :vars
    (
      ?auto_479821 - HOIST
      ?auto_479822 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479821 ?auto_479822 ) ( SURFACE-AT ?auto_479820 ?auto_479822 ) ( CLEAR ?auto_479820 ) ( LIFTING ?auto_479821 ?auto_479817 ) ( IS-CRATE ?auto_479817 ) ( not ( = ?auto_479820 ?auto_479817 ) ) ( ON ?auto_479819 ?auto_479818 ) ( ON ?auto_479820 ?auto_479819 ) ( not ( = ?auto_479818 ?auto_479819 ) ) ( not ( = ?auto_479818 ?auto_479820 ) ) ( not ( = ?auto_479818 ?auto_479817 ) ) ( not ( = ?auto_479819 ?auto_479820 ) ) ( not ( = ?auto_479819 ?auto_479817 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479820 ?auto_479817 )
      ( MAKE-3CRATE-VERIFY ?auto_479818 ?auto_479819 ?auto_479820 ?auto_479817 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_479835 - SURFACE
      ?auto_479836 - SURFACE
      ?auto_479837 - SURFACE
      ?auto_479834 - SURFACE
    )
    :vars
    (
      ?auto_479840 - HOIST
      ?auto_479838 - PLACE
      ?auto_479839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479840 ?auto_479838 ) ( SURFACE-AT ?auto_479837 ?auto_479838 ) ( CLEAR ?auto_479837 ) ( IS-CRATE ?auto_479834 ) ( not ( = ?auto_479837 ?auto_479834 ) ) ( TRUCK-AT ?auto_479839 ?auto_479838 ) ( AVAILABLE ?auto_479840 ) ( IN ?auto_479834 ?auto_479839 ) ( ON ?auto_479837 ?auto_479836 ) ( not ( = ?auto_479836 ?auto_479837 ) ) ( not ( = ?auto_479836 ?auto_479834 ) ) ( ON ?auto_479836 ?auto_479835 ) ( not ( = ?auto_479835 ?auto_479836 ) ) ( not ( = ?auto_479835 ?auto_479837 ) ) ( not ( = ?auto_479835 ?auto_479834 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479836 ?auto_479837 ?auto_479834 )
      ( MAKE-3CRATE-VERIFY ?auto_479835 ?auto_479836 ?auto_479837 ?auto_479834 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_479856 - SURFACE
      ?auto_479857 - SURFACE
      ?auto_479858 - SURFACE
      ?auto_479855 - SURFACE
    )
    :vars
    (
      ?auto_479860 - HOIST
      ?auto_479861 - PLACE
      ?auto_479862 - TRUCK
      ?auto_479859 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479860 ?auto_479861 ) ( SURFACE-AT ?auto_479858 ?auto_479861 ) ( CLEAR ?auto_479858 ) ( IS-CRATE ?auto_479855 ) ( not ( = ?auto_479858 ?auto_479855 ) ) ( AVAILABLE ?auto_479860 ) ( IN ?auto_479855 ?auto_479862 ) ( ON ?auto_479858 ?auto_479857 ) ( not ( = ?auto_479857 ?auto_479858 ) ) ( not ( = ?auto_479857 ?auto_479855 ) ) ( TRUCK-AT ?auto_479862 ?auto_479859 ) ( not ( = ?auto_479859 ?auto_479861 ) ) ( ON ?auto_479857 ?auto_479856 ) ( not ( = ?auto_479856 ?auto_479857 ) ) ( not ( = ?auto_479856 ?auto_479858 ) ) ( not ( = ?auto_479856 ?auto_479855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479857 ?auto_479858 ?auto_479855 )
      ( MAKE-3CRATE-VERIFY ?auto_479856 ?auto_479857 ?auto_479858 ?auto_479855 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_479880 - SURFACE
      ?auto_479881 - SURFACE
      ?auto_479882 - SURFACE
      ?auto_479879 - SURFACE
    )
    :vars
    (
      ?auto_479887 - HOIST
      ?auto_479883 - PLACE
      ?auto_479886 - TRUCK
      ?auto_479884 - PLACE
      ?auto_479885 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_479887 ?auto_479883 ) ( SURFACE-AT ?auto_479882 ?auto_479883 ) ( CLEAR ?auto_479882 ) ( IS-CRATE ?auto_479879 ) ( not ( = ?auto_479882 ?auto_479879 ) ) ( AVAILABLE ?auto_479887 ) ( ON ?auto_479882 ?auto_479881 ) ( not ( = ?auto_479881 ?auto_479882 ) ) ( not ( = ?auto_479881 ?auto_479879 ) ) ( TRUCK-AT ?auto_479886 ?auto_479884 ) ( not ( = ?auto_479884 ?auto_479883 ) ) ( HOIST-AT ?auto_479885 ?auto_479884 ) ( LIFTING ?auto_479885 ?auto_479879 ) ( not ( = ?auto_479887 ?auto_479885 ) ) ( ON ?auto_479881 ?auto_479880 ) ( not ( = ?auto_479880 ?auto_479881 ) ) ( not ( = ?auto_479880 ?auto_479882 ) ) ( not ( = ?auto_479880 ?auto_479879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479881 ?auto_479882 ?auto_479879 )
      ( MAKE-3CRATE-VERIFY ?auto_479880 ?auto_479881 ?auto_479882 ?auto_479879 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_479907 - SURFACE
      ?auto_479908 - SURFACE
      ?auto_479909 - SURFACE
      ?auto_479906 - SURFACE
    )
    :vars
    (
      ?auto_479915 - HOIST
      ?auto_479911 - PLACE
      ?auto_479913 - TRUCK
      ?auto_479912 - PLACE
      ?auto_479910 - HOIST
      ?auto_479914 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479915 ?auto_479911 ) ( SURFACE-AT ?auto_479909 ?auto_479911 ) ( CLEAR ?auto_479909 ) ( IS-CRATE ?auto_479906 ) ( not ( = ?auto_479909 ?auto_479906 ) ) ( AVAILABLE ?auto_479915 ) ( ON ?auto_479909 ?auto_479908 ) ( not ( = ?auto_479908 ?auto_479909 ) ) ( not ( = ?auto_479908 ?auto_479906 ) ) ( TRUCK-AT ?auto_479913 ?auto_479912 ) ( not ( = ?auto_479912 ?auto_479911 ) ) ( HOIST-AT ?auto_479910 ?auto_479912 ) ( not ( = ?auto_479915 ?auto_479910 ) ) ( AVAILABLE ?auto_479910 ) ( SURFACE-AT ?auto_479906 ?auto_479912 ) ( ON ?auto_479906 ?auto_479914 ) ( CLEAR ?auto_479906 ) ( not ( = ?auto_479909 ?auto_479914 ) ) ( not ( = ?auto_479906 ?auto_479914 ) ) ( not ( = ?auto_479908 ?auto_479914 ) ) ( ON ?auto_479908 ?auto_479907 ) ( not ( = ?auto_479907 ?auto_479908 ) ) ( not ( = ?auto_479907 ?auto_479909 ) ) ( not ( = ?auto_479907 ?auto_479906 ) ) ( not ( = ?auto_479907 ?auto_479914 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479908 ?auto_479909 ?auto_479906 )
      ( MAKE-3CRATE-VERIFY ?auto_479907 ?auto_479908 ?auto_479909 ?auto_479906 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_479935 - SURFACE
      ?auto_479936 - SURFACE
      ?auto_479937 - SURFACE
      ?auto_479934 - SURFACE
    )
    :vars
    (
      ?auto_479938 - HOIST
      ?auto_479943 - PLACE
      ?auto_479940 - PLACE
      ?auto_479941 - HOIST
      ?auto_479942 - SURFACE
      ?auto_479939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479938 ?auto_479943 ) ( SURFACE-AT ?auto_479937 ?auto_479943 ) ( CLEAR ?auto_479937 ) ( IS-CRATE ?auto_479934 ) ( not ( = ?auto_479937 ?auto_479934 ) ) ( AVAILABLE ?auto_479938 ) ( ON ?auto_479937 ?auto_479936 ) ( not ( = ?auto_479936 ?auto_479937 ) ) ( not ( = ?auto_479936 ?auto_479934 ) ) ( not ( = ?auto_479940 ?auto_479943 ) ) ( HOIST-AT ?auto_479941 ?auto_479940 ) ( not ( = ?auto_479938 ?auto_479941 ) ) ( AVAILABLE ?auto_479941 ) ( SURFACE-AT ?auto_479934 ?auto_479940 ) ( ON ?auto_479934 ?auto_479942 ) ( CLEAR ?auto_479934 ) ( not ( = ?auto_479937 ?auto_479942 ) ) ( not ( = ?auto_479934 ?auto_479942 ) ) ( not ( = ?auto_479936 ?auto_479942 ) ) ( TRUCK-AT ?auto_479939 ?auto_479943 ) ( ON ?auto_479936 ?auto_479935 ) ( not ( = ?auto_479935 ?auto_479936 ) ) ( not ( = ?auto_479935 ?auto_479937 ) ) ( not ( = ?auto_479935 ?auto_479934 ) ) ( not ( = ?auto_479935 ?auto_479942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479936 ?auto_479937 ?auto_479934 )
      ( MAKE-3CRATE-VERIFY ?auto_479935 ?auto_479936 ?auto_479937 ?auto_479934 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_479963 - SURFACE
      ?auto_479964 - SURFACE
      ?auto_479965 - SURFACE
      ?auto_479962 - SURFACE
    )
    :vars
    (
      ?auto_479970 - HOIST
      ?auto_479966 - PLACE
      ?auto_479971 - PLACE
      ?auto_479967 - HOIST
      ?auto_479968 - SURFACE
      ?auto_479969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479970 ?auto_479966 ) ( IS-CRATE ?auto_479962 ) ( not ( = ?auto_479965 ?auto_479962 ) ) ( not ( = ?auto_479964 ?auto_479965 ) ) ( not ( = ?auto_479964 ?auto_479962 ) ) ( not ( = ?auto_479971 ?auto_479966 ) ) ( HOIST-AT ?auto_479967 ?auto_479971 ) ( not ( = ?auto_479970 ?auto_479967 ) ) ( AVAILABLE ?auto_479967 ) ( SURFACE-AT ?auto_479962 ?auto_479971 ) ( ON ?auto_479962 ?auto_479968 ) ( CLEAR ?auto_479962 ) ( not ( = ?auto_479965 ?auto_479968 ) ) ( not ( = ?auto_479962 ?auto_479968 ) ) ( not ( = ?auto_479964 ?auto_479968 ) ) ( TRUCK-AT ?auto_479969 ?auto_479966 ) ( SURFACE-AT ?auto_479964 ?auto_479966 ) ( CLEAR ?auto_479964 ) ( LIFTING ?auto_479970 ?auto_479965 ) ( IS-CRATE ?auto_479965 ) ( ON ?auto_479964 ?auto_479963 ) ( not ( = ?auto_479963 ?auto_479964 ) ) ( not ( = ?auto_479963 ?auto_479965 ) ) ( not ( = ?auto_479963 ?auto_479962 ) ) ( not ( = ?auto_479963 ?auto_479968 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479964 ?auto_479965 ?auto_479962 )
      ( MAKE-3CRATE-VERIFY ?auto_479963 ?auto_479964 ?auto_479965 ?auto_479962 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_479991 - SURFACE
      ?auto_479992 - SURFACE
      ?auto_479993 - SURFACE
      ?auto_479990 - SURFACE
    )
    :vars
    (
      ?auto_479994 - HOIST
      ?auto_479997 - PLACE
      ?auto_479996 - PLACE
      ?auto_479998 - HOIST
      ?auto_479999 - SURFACE
      ?auto_479995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479994 ?auto_479997 ) ( IS-CRATE ?auto_479990 ) ( not ( = ?auto_479993 ?auto_479990 ) ) ( not ( = ?auto_479992 ?auto_479993 ) ) ( not ( = ?auto_479992 ?auto_479990 ) ) ( not ( = ?auto_479996 ?auto_479997 ) ) ( HOIST-AT ?auto_479998 ?auto_479996 ) ( not ( = ?auto_479994 ?auto_479998 ) ) ( AVAILABLE ?auto_479998 ) ( SURFACE-AT ?auto_479990 ?auto_479996 ) ( ON ?auto_479990 ?auto_479999 ) ( CLEAR ?auto_479990 ) ( not ( = ?auto_479993 ?auto_479999 ) ) ( not ( = ?auto_479990 ?auto_479999 ) ) ( not ( = ?auto_479992 ?auto_479999 ) ) ( TRUCK-AT ?auto_479995 ?auto_479997 ) ( SURFACE-AT ?auto_479992 ?auto_479997 ) ( CLEAR ?auto_479992 ) ( IS-CRATE ?auto_479993 ) ( AVAILABLE ?auto_479994 ) ( IN ?auto_479993 ?auto_479995 ) ( ON ?auto_479992 ?auto_479991 ) ( not ( = ?auto_479991 ?auto_479992 ) ) ( not ( = ?auto_479991 ?auto_479993 ) ) ( not ( = ?auto_479991 ?auto_479990 ) ) ( not ( = ?auto_479991 ?auto_479999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479992 ?auto_479993 ?auto_479990 )
      ( MAKE-3CRATE-VERIFY ?auto_479991 ?auto_479992 ?auto_479993 ?auto_479990 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_480282 - SURFACE
      ?auto_480283 - SURFACE
      ?auto_480284 - SURFACE
      ?auto_480281 - SURFACE
      ?auto_480285 - SURFACE
    )
    :vars
    (
      ?auto_480287 - HOIST
      ?auto_480286 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_480287 ?auto_480286 ) ( SURFACE-AT ?auto_480281 ?auto_480286 ) ( CLEAR ?auto_480281 ) ( LIFTING ?auto_480287 ?auto_480285 ) ( IS-CRATE ?auto_480285 ) ( not ( = ?auto_480281 ?auto_480285 ) ) ( ON ?auto_480283 ?auto_480282 ) ( ON ?auto_480284 ?auto_480283 ) ( ON ?auto_480281 ?auto_480284 ) ( not ( = ?auto_480282 ?auto_480283 ) ) ( not ( = ?auto_480282 ?auto_480284 ) ) ( not ( = ?auto_480282 ?auto_480281 ) ) ( not ( = ?auto_480282 ?auto_480285 ) ) ( not ( = ?auto_480283 ?auto_480284 ) ) ( not ( = ?auto_480283 ?auto_480281 ) ) ( not ( = ?auto_480283 ?auto_480285 ) ) ( not ( = ?auto_480284 ?auto_480281 ) ) ( not ( = ?auto_480284 ?auto_480285 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_480281 ?auto_480285 )
      ( MAKE-4CRATE-VERIFY ?auto_480282 ?auto_480283 ?auto_480284 ?auto_480281 ?auto_480285 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_480307 - SURFACE
      ?auto_480308 - SURFACE
      ?auto_480309 - SURFACE
      ?auto_480306 - SURFACE
      ?auto_480310 - SURFACE
    )
    :vars
    (
      ?auto_480311 - HOIST
      ?auto_480312 - PLACE
      ?auto_480313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_480311 ?auto_480312 ) ( SURFACE-AT ?auto_480306 ?auto_480312 ) ( CLEAR ?auto_480306 ) ( IS-CRATE ?auto_480310 ) ( not ( = ?auto_480306 ?auto_480310 ) ) ( TRUCK-AT ?auto_480313 ?auto_480312 ) ( AVAILABLE ?auto_480311 ) ( IN ?auto_480310 ?auto_480313 ) ( ON ?auto_480306 ?auto_480309 ) ( not ( = ?auto_480309 ?auto_480306 ) ) ( not ( = ?auto_480309 ?auto_480310 ) ) ( ON ?auto_480308 ?auto_480307 ) ( ON ?auto_480309 ?auto_480308 ) ( not ( = ?auto_480307 ?auto_480308 ) ) ( not ( = ?auto_480307 ?auto_480309 ) ) ( not ( = ?auto_480307 ?auto_480306 ) ) ( not ( = ?auto_480307 ?auto_480310 ) ) ( not ( = ?auto_480308 ?auto_480309 ) ) ( not ( = ?auto_480308 ?auto_480306 ) ) ( not ( = ?auto_480308 ?auto_480310 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480309 ?auto_480306 ?auto_480310 )
      ( MAKE-4CRATE-VERIFY ?auto_480307 ?auto_480308 ?auto_480309 ?auto_480306 ?auto_480310 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_480337 - SURFACE
      ?auto_480338 - SURFACE
      ?auto_480339 - SURFACE
      ?auto_480336 - SURFACE
      ?auto_480340 - SURFACE
    )
    :vars
    (
      ?auto_480341 - HOIST
      ?auto_480344 - PLACE
      ?auto_480342 - TRUCK
      ?auto_480343 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_480341 ?auto_480344 ) ( SURFACE-AT ?auto_480336 ?auto_480344 ) ( CLEAR ?auto_480336 ) ( IS-CRATE ?auto_480340 ) ( not ( = ?auto_480336 ?auto_480340 ) ) ( AVAILABLE ?auto_480341 ) ( IN ?auto_480340 ?auto_480342 ) ( ON ?auto_480336 ?auto_480339 ) ( not ( = ?auto_480339 ?auto_480336 ) ) ( not ( = ?auto_480339 ?auto_480340 ) ) ( TRUCK-AT ?auto_480342 ?auto_480343 ) ( not ( = ?auto_480343 ?auto_480344 ) ) ( ON ?auto_480338 ?auto_480337 ) ( ON ?auto_480339 ?auto_480338 ) ( not ( = ?auto_480337 ?auto_480338 ) ) ( not ( = ?auto_480337 ?auto_480339 ) ) ( not ( = ?auto_480337 ?auto_480336 ) ) ( not ( = ?auto_480337 ?auto_480340 ) ) ( not ( = ?auto_480338 ?auto_480339 ) ) ( not ( = ?auto_480338 ?auto_480336 ) ) ( not ( = ?auto_480338 ?auto_480340 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480339 ?auto_480336 ?auto_480340 )
      ( MAKE-4CRATE-VERIFY ?auto_480337 ?auto_480338 ?auto_480339 ?auto_480336 ?auto_480340 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_480371 - SURFACE
      ?auto_480372 - SURFACE
      ?auto_480373 - SURFACE
      ?auto_480370 - SURFACE
      ?auto_480374 - SURFACE
    )
    :vars
    (
      ?auto_480378 - HOIST
      ?auto_480376 - PLACE
      ?auto_480375 - TRUCK
      ?auto_480377 - PLACE
      ?auto_480379 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_480378 ?auto_480376 ) ( SURFACE-AT ?auto_480370 ?auto_480376 ) ( CLEAR ?auto_480370 ) ( IS-CRATE ?auto_480374 ) ( not ( = ?auto_480370 ?auto_480374 ) ) ( AVAILABLE ?auto_480378 ) ( ON ?auto_480370 ?auto_480373 ) ( not ( = ?auto_480373 ?auto_480370 ) ) ( not ( = ?auto_480373 ?auto_480374 ) ) ( TRUCK-AT ?auto_480375 ?auto_480377 ) ( not ( = ?auto_480377 ?auto_480376 ) ) ( HOIST-AT ?auto_480379 ?auto_480377 ) ( LIFTING ?auto_480379 ?auto_480374 ) ( not ( = ?auto_480378 ?auto_480379 ) ) ( ON ?auto_480372 ?auto_480371 ) ( ON ?auto_480373 ?auto_480372 ) ( not ( = ?auto_480371 ?auto_480372 ) ) ( not ( = ?auto_480371 ?auto_480373 ) ) ( not ( = ?auto_480371 ?auto_480370 ) ) ( not ( = ?auto_480371 ?auto_480374 ) ) ( not ( = ?auto_480372 ?auto_480373 ) ) ( not ( = ?auto_480372 ?auto_480370 ) ) ( not ( = ?auto_480372 ?auto_480374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480373 ?auto_480370 ?auto_480374 )
      ( MAKE-4CRATE-VERIFY ?auto_480371 ?auto_480372 ?auto_480373 ?auto_480370 ?auto_480374 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_480409 - SURFACE
      ?auto_480410 - SURFACE
      ?auto_480411 - SURFACE
      ?auto_480408 - SURFACE
      ?auto_480412 - SURFACE
    )
    :vars
    (
      ?auto_480418 - HOIST
      ?auto_480417 - PLACE
      ?auto_480415 - TRUCK
      ?auto_480416 - PLACE
      ?auto_480413 - HOIST
      ?auto_480414 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_480418 ?auto_480417 ) ( SURFACE-AT ?auto_480408 ?auto_480417 ) ( CLEAR ?auto_480408 ) ( IS-CRATE ?auto_480412 ) ( not ( = ?auto_480408 ?auto_480412 ) ) ( AVAILABLE ?auto_480418 ) ( ON ?auto_480408 ?auto_480411 ) ( not ( = ?auto_480411 ?auto_480408 ) ) ( not ( = ?auto_480411 ?auto_480412 ) ) ( TRUCK-AT ?auto_480415 ?auto_480416 ) ( not ( = ?auto_480416 ?auto_480417 ) ) ( HOIST-AT ?auto_480413 ?auto_480416 ) ( not ( = ?auto_480418 ?auto_480413 ) ) ( AVAILABLE ?auto_480413 ) ( SURFACE-AT ?auto_480412 ?auto_480416 ) ( ON ?auto_480412 ?auto_480414 ) ( CLEAR ?auto_480412 ) ( not ( = ?auto_480408 ?auto_480414 ) ) ( not ( = ?auto_480412 ?auto_480414 ) ) ( not ( = ?auto_480411 ?auto_480414 ) ) ( ON ?auto_480410 ?auto_480409 ) ( ON ?auto_480411 ?auto_480410 ) ( not ( = ?auto_480409 ?auto_480410 ) ) ( not ( = ?auto_480409 ?auto_480411 ) ) ( not ( = ?auto_480409 ?auto_480408 ) ) ( not ( = ?auto_480409 ?auto_480412 ) ) ( not ( = ?auto_480409 ?auto_480414 ) ) ( not ( = ?auto_480410 ?auto_480411 ) ) ( not ( = ?auto_480410 ?auto_480408 ) ) ( not ( = ?auto_480410 ?auto_480412 ) ) ( not ( = ?auto_480410 ?auto_480414 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480411 ?auto_480408 ?auto_480412 )
      ( MAKE-4CRATE-VERIFY ?auto_480409 ?auto_480410 ?auto_480411 ?auto_480408 ?auto_480412 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_480448 - SURFACE
      ?auto_480449 - SURFACE
      ?auto_480450 - SURFACE
      ?auto_480447 - SURFACE
      ?auto_480451 - SURFACE
    )
    :vars
    (
      ?auto_480452 - HOIST
      ?auto_480457 - PLACE
      ?auto_480454 - PLACE
      ?auto_480453 - HOIST
      ?auto_480456 - SURFACE
      ?auto_480455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_480452 ?auto_480457 ) ( SURFACE-AT ?auto_480447 ?auto_480457 ) ( CLEAR ?auto_480447 ) ( IS-CRATE ?auto_480451 ) ( not ( = ?auto_480447 ?auto_480451 ) ) ( AVAILABLE ?auto_480452 ) ( ON ?auto_480447 ?auto_480450 ) ( not ( = ?auto_480450 ?auto_480447 ) ) ( not ( = ?auto_480450 ?auto_480451 ) ) ( not ( = ?auto_480454 ?auto_480457 ) ) ( HOIST-AT ?auto_480453 ?auto_480454 ) ( not ( = ?auto_480452 ?auto_480453 ) ) ( AVAILABLE ?auto_480453 ) ( SURFACE-AT ?auto_480451 ?auto_480454 ) ( ON ?auto_480451 ?auto_480456 ) ( CLEAR ?auto_480451 ) ( not ( = ?auto_480447 ?auto_480456 ) ) ( not ( = ?auto_480451 ?auto_480456 ) ) ( not ( = ?auto_480450 ?auto_480456 ) ) ( TRUCK-AT ?auto_480455 ?auto_480457 ) ( ON ?auto_480449 ?auto_480448 ) ( ON ?auto_480450 ?auto_480449 ) ( not ( = ?auto_480448 ?auto_480449 ) ) ( not ( = ?auto_480448 ?auto_480450 ) ) ( not ( = ?auto_480448 ?auto_480447 ) ) ( not ( = ?auto_480448 ?auto_480451 ) ) ( not ( = ?auto_480448 ?auto_480456 ) ) ( not ( = ?auto_480449 ?auto_480450 ) ) ( not ( = ?auto_480449 ?auto_480447 ) ) ( not ( = ?auto_480449 ?auto_480451 ) ) ( not ( = ?auto_480449 ?auto_480456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480450 ?auto_480447 ?auto_480451 )
      ( MAKE-4CRATE-VERIFY ?auto_480448 ?auto_480449 ?auto_480450 ?auto_480447 ?auto_480451 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_480487 - SURFACE
      ?auto_480488 - SURFACE
      ?auto_480489 - SURFACE
      ?auto_480486 - SURFACE
      ?auto_480490 - SURFACE
    )
    :vars
    (
      ?auto_480491 - HOIST
      ?auto_480496 - PLACE
      ?auto_480493 - PLACE
      ?auto_480495 - HOIST
      ?auto_480492 - SURFACE
      ?auto_480494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_480491 ?auto_480496 ) ( IS-CRATE ?auto_480490 ) ( not ( = ?auto_480486 ?auto_480490 ) ) ( not ( = ?auto_480489 ?auto_480486 ) ) ( not ( = ?auto_480489 ?auto_480490 ) ) ( not ( = ?auto_480493 ?auto_480496 ) ) ( HOIST-AT ?auto_480495 ?auto_480493 ) ( not ( = ?auto_480491 ?auto_480495 ) ) ( AVAILABLE ?auto_480495 ) ( SURFACE-AT ?auto_480490 ?auto_480493 ) ( ON ?auto_480490 ?auto_480492 ) ( CLEAR ?auto_480490 ) ( not ( = ?auto_480486 ?auto_480492 ) ) ( not ( = ?auto_480490 ?auto_480492 ) ) ( not ( = ?auto_480489 ?auto_480492 ) ) ( TRUCK-AT ?auto_480494 ?auto_480496 ) ( SURFACE-AT ?auto_480489 ?auto_480496 ) ( CLEAR ?auto_480489 ) ( LIFTING ?auto_480491 ?auto_480486 ) ( IS-CRATE ?auto_480486 ) ( ON ?auto_480488 ?auto_480487 ) ( ON ?auto_480489 ?auto_480488 ) ( not ( = ?auto_480487 ?auto_480488 ) ) ( not ( = ?auto_480487 ?auto_480489 ) ) ( not ( = ?auto_480487 ?auto_480486 ) ) ( not ( = ?auto_480487 ?auto_480490 ) ) ( not ( = ?auto_480487 ?auto_480492 ) ) ( not ( = ?auto_480488 ?auto_480489 ) ) ( not ( = ?auto_480488 ?auto_480486 ) ) ( not ( = ?auto_480488 ?auto_480490 ) ) ( not ( = ?auto_480488 ?auto_480492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480489 ?auto_480486 ?auto_480490 )
      ( MAKE-4CRATE-VERIFY ?auto_480487 ?auto_480488 ?auto_480489 ?auto_480486 ?auto_480490 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_480526 - SURFACE
      ?auto_480527 - SURFACE
      ?auto_480528 - SURFACE
      ?auto_480525 - SURFACE
      ?auto_480529 - SURFACE
    )
    :vars
    (
      ?auto_480535 - HOIST
      ?auto_480533 - PLACE
      ?auto_480531 - PLACE
      ?auto_480530 - HOIST
      ?auto_480532 - SURFACE
      ?auto_480534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_480535 ?auto_480533 ) ( IS-CRATE ?auto_480529 ) ( not ( = ?auto_480525 ?auto_480529 ) ) ( not ( = ?auto_480528 ?auto_480525 ) ) ( not ( = ?auto_480528 ?auto_480529 ) ) ( not ( = ?auto_480531 ?auto_480533 ) ) ( HOIST-AT ?auto_480530 ?auto_480531 ) ( not ( = ?auto_480535 ?auto_480530 ) ) ( AVAILABLE ?auto_480530 ) ( SURFACE-AT ?auto_480529 ?auto_480531 ) ( ON ?auto_480529 ?auto_480532 ) ( CLEAR ?auto_480529 ) ( not ( = ?auto_480525 ?auto_480532 ) ) ( not ( = ?auto_480529 ?auto_480532 ) ) ( not ( = ?auto_480528 ?auto_480532 ) ) ( TRUCK-AT ?auto_480534 ?auto_480533 ) ( SURFACE-AT ?auto_480528 ?auto_480533 ) ( CLEAR ?auto_480528 ) ( IS-CRATE ?auto_480525 ) ( AVAILABLE ?auto_480535 ) ( IN ?auto_480525 ?auto_480534 ) ( ON ?auto_480527 ?auto_480526 ) ( ON ?auto_480528 ?auto_480527 ) ( not ( = ?auto_480526 ?auto_480527 ) ) ( not ( = ?auto_480526 ?auto_480528 ) ) ( not ( = ?auto_480526 ?auto_480525 ) ) ( not ( = ?auto_480526 ?auto_480529 ) ) ( not ( = ?auto_480526 ?auto_480532 ) ) ( not ( = ?auto_480527 ?auto_480528 ) ) ( not ( = ?auto_480527 ?auto_480525 ) ) ( not ( = ?auto_480527 ?auto_480529 ) ) ( not ( = ?auto_480527 ?auto_480532 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480528 ?auto_480525 ?auto_480529 )
      ( MAKE-4CRATE-VERIFY ?auto_480526 ?auto_480527 ?auto_480528 ?auto_480525 ?auto_480529 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_481026 - SURFACE
      ?auto_481027 - SURFACE
    )
    :vars
    (
      ?auto_481034 - HOIST
      ?auto_481033 - PLACE
      ?auto_481032 - SURFACE
      ?auto_481028 - TRUCK
      ?auto_481031 - PLACE
      ?auto_481030 - HOIST
      ?auto_481029 - SURFACE
      ?auto_481035 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_481034 ?auto_481033 ) ( SURFACE-AT ?auto_481026 ?auto_481033 ) ( CLEAR ?auto_481026 ) ( IS-CRATE ?auto_481027 ) ( not ( = ?auto_481026 ?auto_481027 ) ) ( AVAILABLE ?auto_481034 ) ( ON ?auto_481026 ?auto_481032 ) ( not ( = ?auto_481032 ?auto_481026 ) ) ( not ( = ?auto_481032 ?auto_481027 ) ) ( TRUCK-AT ?auto_481028 ?auto_481031 ) ( not ( = ?auto_481031 ?auto_481033 ) ) ( HOIST-AT ?auto_481030 ?auto_481031 ) ( not ( = ?auto_481034 ?auto_481030 ) ) ( SURFACE-AT ?auto_481027 ?auto_481031 ) ( ON ?auto_481027 ?auto_481029 ) ( CLEAR ?auto_481027 ) ( not ( = ?auto_481026 ?auto_481029 ) ) ( not ( = ?auto_481027 ?auto_481029 ) ) ( not ( = ?auto_481032 ?auto_481029 ) ) ( LIFTING ?auto_481030 ?auto_481035 ) ( IS-CRATE ?auto_481035 ) ( not ( = ?auto_481026 ?auto_481035 ) ) ( not ( = ?auto_481027 ?auto_481035 ) ) ( not ( = ?auto_481032 ?auto_481035 ) ) ( not ( = ?auto_481029 ?auto_481035 ) ) )
    :subtasks
    ( ( !LOAD ?auto_481030 ?auto_481035 ?auto_481028 ?auto_481031 )
      ( MAKE-1CRATE ?auto_481026 ?auto_481027 )
      ( MAKE-1CRATE-VERIFY ?auto_481026 ?auto_481027 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_481186 - SURFACE
      ?auto_481187 - SURFACE
      ?auto_481188 - SURFACE
      ?auto_481185 - SURFACE
      ?auto_481189 - SURFACE
      ?auto_481190 - SURFACE
    )
    :vars
    (
      ?auto_481191 - HOIST
      ?auto_481192 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_481191 ?auto_481192 ) ( SURFACE-AT ?auto_481189 ?auto_481192 ) ( CLEAR ?auto_481189 ) ( LIFTING ?auto_481191 ?auto_481190 ) ( IS-CRATE ?auto_481190 ) ( not ( = ?auto_481189 ?auto_481190 ) ) ( ON ?auto_481187 ?auto_481186 ) ( ON ?auto_481188 ?auto_481187 ) ( ON ?auto_481185 ?auto_481188 ) ( ON ?auto_481189 ?auto_481185 ) ( not ( = ?auto_481186 ?auto_481187 ) ) ( not ( = ?auto_481186 ?auto_481188 ) ) ( not ( = ?auto_481186 ?auto_481185 ) ) ( not ( = ?auto_481186 ?auto_481189 ) ) ( not ( = ?auto_481186 ?auto_481190 ) ) ( not ( = ?auto_481187 ?auto_481188 ) ) ( not ( = ?auto_481187 ?auto_481185 ) ) ( not ( = ?auto_481187 ?auto_481189 ) ) ( not ( = ?auto_481187 ?auto_481190 ) ) ( not ( = ?auto_481188 ?auto_481185 ) ) ( not ( = ?auto_481188 ?auto_481189 ) ) ( not ( = ?auto_481188 ?auto_481190 ) ) ( not ( = ?auto_481185 ?auto_481189 ) ) ( not ( = ?auto_481185 ?auto_481190 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_481189 ?auto_481190 )
      ( MAKE-5CRATE-VERIFY ?auto_481186 ?auto_481187 ?auto_481188 ?auto_481185 ?auto_481189 ?auto_481190 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_481220 - SURFACE
      ?auto_481221 - SURFACE
      ?auto_481222 - SURFACE
      ?auto_481219 - SURFACE
      ?auto_481223 - SURFACE
      ?auto_481224 - SURFACE
    )
    :vars
    (
      ?auto_481227 - HOIST
      ?auto_481225 - PLACE
      ?auto_481226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_481227 ?auto_481225 ) ( SURFACE-AT ?auto_481223 ?auto_481225 ) ( CLEAR ?auto_481223 ) ( IS-CRATE ?auto_481224 ) ( not ( = ?auto_481223 ?auto_481224 ) ) ( TRUCK-AT ?auto_481226 ?auto_481225 ) ( AVAILABLE ?auto_481227 ) ( IN ?auto_481224 ?auto_481226 ) ( ON ?auto_481223 ?auto_481219 ) ( not ( = ?auto_481219 ?auto_481223 ) ) ( not ( = ?auto_481219 ?auto_481224 ) ) ( ON ?auto_481221 ?auto_481220 ) ( ON ?auto_481222 ?auto_481221 ) ( ON ?auto_481219 ?auto_481222 ) ( not ( = ?auto_481220 ?auto_481221 ) ) ( not ( = ?auto_481220 ?auto_481222 ) ) ( not ( = ?auto_481220 ?auto_481219 ) ) ( not ( = ?auto_481220 ?auto_481223 ) ) ( not ( = ?auto_481220 ?auto_481224 ) ) ( not ( = ?auto_481221 ?auto_481222 ) ) ( not ( = ?auto_481221 ?auto_481219 ) ) ( not ( = ?auto_481221 ?auto_481223 ) ) ( not ( = ?auto_481221 ?auto_481224 ) ) ( not ( = ?auto_481222 ?auto_481219 ) ) ( not ( = ?auto_481222 ?auto_481223 ) ) ( not ( = ?auto_481222 ?auto_481224 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_481219 ?auto_481223 ?auto_481224 )
      ( MAKE-5CRATE-VERIFY ?auto_481220 ?auto_481221 ?auto_481222 ?auto_481219 ?auto_481223 ?auto_481224 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_481260 - SURFACE
      ?auto_481261 - SURFACE
      ?auto_481262 - SURFACE
      ?auto_481259 - SURFACE
      ?auto_481263 - SURFACE
      ?auto_481264 - SURFACE
    )
    :vars
    (
      ?auto_481268 - HOIST
      ?auto_481265 - PLACE
      ?auto_481267 - TRUCK
      ?auto_481266 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_481268 ?auto_481265 ) ( SURFACE-AT ?auto_481263 ?auto_481265 ) ( CLEAR ?auto_481263 ) ( IS-CRATE ?auto_481264 ) ( not ( = ?auto_481263 ?auto_481264 ) ) ( AVAILABLE ?auto_481268 ) ( IN ?auto_481264 ?auto_481267 ) ( ON ?auto_481263 ?auto_481259 ) ( not ( = ?auto_481259 ?auto_481263 ) ) ( not ( = ?auto_481259 ?auto_481264 ) ) ( TRUCK-AT ?auto_481267 ?auto_481266 ) ( not ( = ?auto_481266 ?auto_481265 ) ) ( ON ?auto_481261 ?auto_481260 ) ( ON ?auto_481262 ?auto_481261 ) ( ON ?auto_481259 ?auto_481262 ) ( not ( = ?auto_481260 ?auto_481261 ) ) ( not ( = ?auto_481260 ?auto_481262 ) ) ( not ( = ?auto_481260 ?auto_481259 ) ) ( not ( = ?auto_481260 ?auto_481263 ) ) ( not ( = ?auto_481260 ?auto_481264 ) ) ( not ( = ?auto_481261 ?auto_481262 ) ) ( not ( = ?auto_481261 ?auto_481259 ) ) ( not ( = ?auto_481261 ?auto_481263 ) ) ( not ( = ?auto_481261 ?auto_481264 ) ) ( not ( = ?auto_481262 ?auto_481259 ) ) ( not ( = ?auto_481262 ?auto_481263 ) ) ( not ( = ?auto_481262 ?auto_481264 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_481259 ?auto_481263 ?auto_481264 )
      ( MAKE-5CRATE-VERIFY ?auto_481260 ?auto_481261 ?auto_481262 ?auto_481259 ?auto_481263 ?auto_481264 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_481305 - SURFACE
      ?auto_481306 - SURFACE
      ?auto_481307 - SURFACE
      ?auto_481304 - SURFACE
      ?auto_481308 - SURFACE
      ?auto_481309 - SURFACE
    )
    :vars
    (
      ?auto_481310 - HOIST
      ?auto_481313 - PLACE
      ?auto_481311 - TRUCK
      ?auto_481312 - PLACE
      ?auto_481314 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_481310 ?auto_481313 ) ( SURFACE-AT ?auto_481308 ?auto_481313 ) ( CLEAR ?auto_481308 ) ( IS-CRATE ?auto_481309 ) ( not ( = ?auto_481308 ?auto_481309 ) ) ( AVAILABLE ?auto_481310 ) ( ON ?auto_481308 ?auto_481304 ) ( not ( = ?auto_481304 ?auto_481308 ) ) ( not ( = ?auto_481304 ?auto_481309 ) ) ( TRUCK-AT ?auto_481311 ?auto_481312 ) ( not ( = ?auto_481312 ?auto_481313 ) ) ( HOIST-AT ?auto_481314 ?auto_481312 ) ( LIFTING ?auto_481314 ?auto_481309 ) ( not ( = ?auto_481310 ?auto_481314 ) ) ( ON ?auto_481306 ?auto_481305 ) ( ON ?auto_481307 ?auto_481306 ) ( ON ?auto_481304 ?auto_481307 ) ( not ( = ?auto_481305 ?auto_481306 ) ) ( not ( = ?auto_481305 ?auto_481307 ) ) ( not ( = ?auto_481305 ?auto_481304 ) ) ( not ( = ?auto_481305 ?auto_481308 ) ) ( not ( = ?auto_481305 ?auto_481309 ) ) ( not ( = ?auto_481306 ?auto_481307 ) ) ( not ( = ?auto_481306 ?auto_481304 ) ) ( not ( = ?auto_481306 ?auto_481308 ) ) ( not ( = ?auto_481306 ?auto_481309 ) ) ( not ( = ?auto_481307 ?auto_481304 ) ) ( not ( = ?auto_481307 ?auto_481308 ) ) ( not ( = ?auto_481307 ?auto_481309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_481304 ?auto_481308 ?auto_481309 )
      ( MAKE-5CRATE-VERIFY ?auto_481305 ?auto_481306 ?auto_481307 ?auto_481304 ?auto_481308 ?auto_481309 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_481355 - SURFACE
      ?auto_481356 - SURFACE
      ?auto_481357 - SURFACE
      ?auto_481354 - SURFACE
      ?auto_481358 - SURFACE
      ?auto_481359 - SURFACE
    )
    :vars
    (
      ?auto_481363 - HOIST
      ?auto_481365 - PLACE
      ?auto_481361 - TRUCK
      ?auto_481360 - PLACE
      ?auto_481364 - HOIST
      ?auto_481362 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_481363 ?auto_481365 ) ( SURFACE-AT ?auto_481358 ?auto_481365 ) ( CLEAR ?auto_481358 ) ( IS-CRATE ?auto_481359 ) ( not ( = ?auto_481358 ?auto_481359 ) ) ( AVAILABLE ?auto_481363 ) ( ON ?auto_481358 ?auto_481354 ) ( not ( = ?auto_481354 ?auto_481358 ) ) ( not ( = ?auto_481354 ?auto_481359 ) ) ( TRUCK-AT ?auto_481361 ?auto_481360 ) ( not ( = ?auto_481360 ?auto_481365 ) ) ( HOIST-AT ?auto_481364 ?auto_481360 ) ( not ( = ?auto_481363 ?auto_481364 ) ) ( AVAILABLE ?auto_481364 ) ( SURFACE-AT ?auto_481359 ?auto_481360 ) ( ON ?auto_481359 ?auto_481362 ) ( CLEAR ?auto_481359 ) ( not ( = ?auto_481358 ?auto_481362 ) ) ( not ( = ?auto_481359 ?auto_481362 ) ) ( not ( = ?auto_481354 ?auto_481362 ) ) ( ON ?auto_481356 ?auto_481355 ) ( ON ?auto_481357 ?auto_481356 ) ( ON ?auto_481354 ?auto_481357 ) ( not ( = ?auto_481355 ?auto_481356 ) ) ( not ( = ?auto_481355 ?auto_481357 ) ) ( not ( = ?auto_481355 ?auto_481354 ) ) ( not ( = ?auto_481355 ?auto_481358 ) ) ( not ( = ?auto_481355 ?auto_481359 ) ) ( not ( = ?auto_481355 ?auto_481362 ) ) ( not ( = ?auto_481356 ?auto_481357 ) ) ( not ( = ?auto_481356 ?auto_481354 ) ) ( not ( = ?auto_481356 ?auto_481358 ) ) ( not ( = ?auto_481356 ?auto_481359 ) ) ( not ( = ?auto_481356 ?auto_481362 ) ) ( not ( = ?auto_481357 ?auto_481354 ) ) ( not ( = ?auto_481357 ?auto_481358 ) ) ( not ( = ?auto_481357 ?auto_481359 ) ) ( not ( = ?auto_481357 ?auto_481362 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_481354 ?auto_481358 ?auto_481359 )
      ( MAKE-5CRATE-VERIFY ?auto_481355 ?auto_481356 ?auto_481357 ?auto_481354 ?auto_481358 ?auto_481359 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_481406 - SURFACE
      ?auto_481407 - SURFACE
      ?auto_481408 - SURFACE
      ?auto_481405 - SURFACE
      ?auto_481409 - SURFACE
      ?auto_481410 - SURFACE
    )
    :vars
    (
      ?auto_481411 - HOIST
      ?auto_481415 - PLACE
      ?auto_481412 - PLACE
      ?auto_481416 - HOIST
      ?auto_481414 - SURFACE
      ?auto_481413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_481411 ?auto_481415 ) ( SURFACE-AT ?auto_481409 ?auto_481415 ) ( CLEAR ?auto_481409 ) ( IS-CRATE ?auto_481410 ) ( not ( = ?auto_481409 ?auto_481410 ) ) ( AVAILABLE ?auto_481411 ) ( ON ?auto_481409 ?auto_481405 ) ( not ( = ?auto_481405 ?auto_481409 ) ) ( not ( = ?auto_481405 ?auto_481410 ) ) ( not ( = ?auto_481412 ?auto_481415 ) ) ( HOIST-AT ?auto_481416 ?auto_481412 ) ( not ( = ?auto_481411 ?auto_481416 ) ) ( AVAILABLE ?auto_481416 ) ( SURFACE-AT ?auto_481410 ?auto_481412 ) ( ON ?auto_481410 ?auto_481414 ) ( CLEAR ?auto_481410 ) ( not ( = ?auto_481409 ?auto_481414 ) ) ( not ( = ?auto_481410 ?auto_481414 ) ) ( not ( = ?auto_481405 ?auto_481414 ) ) ( TRUCK-AT ?auto_481413 ?auto_481415 ) ( ON ?auto_481407 ?auto_481406 ) ( ON ?auto_481408 ?auto_481407 ) ( ON ?auto_481405 ?auto_481408 ) ( not ( = ?auto_481406 ?auto_481407 ) ) ( not ( = ?auto_481406 ?auto_481408 ) ) ( not ( = ?auto_481406 ?auto_481405 ) ) ( not ( = ?auto_481406 ?auto_481409 ) ) ( not ( = ?auto_481406 ?auto_481410 ) ) ( not ( = ?auto_481406 ?auto_481414 ) ) ( not ( = ?auto_481407 ?auto_481408 ) ) ( not ( = ?auto_481407 ?auto_481405 ) ) ( not ( = ?auto_481407 ?auto_481409 ) ) ( not ( = ?auto_481407 ?auto_481410 ) ) ( not ( = ?auto_481407 ?auto_481414 ) ) ( not ( = ?auto_481408 ?auto_481405 ) ) ( not ( = ?auto_481408 ?auto_481409 ) ) ( not ( = ?auto_481408 ?auto_481410 ) ) ( not ( = ?auto_481408 ?auto_481414 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_481405 ?auto_481409 ?auto_481410 )
      ( MAKE-5CRATE-VERIFY ?auto_481406 ?auto_481407 ?auto_481408 ?auto_481405 ?auto_481409 ?auto_481410 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_481457 - SURFACE
      ?auto_481458 - SURFACE
      ?auto_481459 - SURFACE
      ?auto_481456 - SURFACE
      ?auto_481460 - SURFACE
      ?auto_481461 - SURFACE
    )
    :vars
    (
      ?auto_481465 - HOIST
      ?auto_481466 - PLACE
      ?auto_481464 - PLACE
      ?auto_481467 - HOIST
      ?auto_481463 - SURFACE
      ?auto_481462 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_481465 ?auto_481466 ) ( IS-CRATE ?auto_481461 ) ( not ( = ?auto_481460 ?auto_481461 ) ) ( not ( = ?auto_481456 ?auto_481460 ) ) ( not ( = ?auto_481456 ?auto_481461 ) ) ( not ( = ?auto_481464 ?auto_481466 ) ) ( HOIST-AT ?auto_481467 ?auto_481464 ) ( not ( = ?auto_481465 ?auto_481467 ) ) ( AVAILABLE ?auto_481467 ) ( SURFACE-AT ?auto_481461 ?auto_481464 ) ( ON ?auto_481461 ?auto_481463 ) ( CLEAR ?auto_481461 ) ( not ( = ?auto_481460 ?auto_481463 ) ) ( not ( = ?auto_481461 ?auto_481463 ) ) ( not ( = ?auto_481456 ?auto_481463 ) ) ( TRUCK-AT ?auto_481462 ?auto_481466 ) ( SURFACE-AT ?auto_481456 ?auto_481466 ) ( CLEAR ?auto_481456 ) ( LIFTING ?auto_481465 ?auto_481460 ) ( IS-CRATE ?auto_481460 ) ( ON ?auto_481458 ?auto_481457 ) ( ON ?auto_481459 ?auto_481458 ) ( ON ?auto_481456 ?auto_481459 ) ( not ( = ?auto_481457 ?auto_481458 ) ) ( not ( = ?auto_481457 ?auto_481459 ) ) ( not ( = ?auto_481457 ?auto_481456 ) ) ( not ( = ?auto_481457 ?auto_481460 ) ) ( not ( = ?auto_481457 ?auto_481461 ) ) ( not ( = ?auto_481457 ?auto_481463 ) ) ( not ( = ?auto_481458 ?auto_481459 ) ) ( not ( = ?auto_481458 ?auto_481456 ) ) ( not ( = ?auto_481458 ?auto_481460 ) ) ( not ( = ?auto_481458 ?auto_481461 ) ) ( not ( = ?auto_481458 ?auto_481463 ) ) ( not ( = ?auto_481459 ?auto_481456 ) ) ( not ( = ?auto_481459 ?auto_481460 ) ) ( not ( = ?auto_481459 ?auto_481461 ) ) ( not ( = ?auto_481459 ?auto_481463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_481456 ?auto_481460 ?auto_481461 )
      ( MAKE-5CRATE-VERIFY ?auto_481457 ?auto_481458 ?auto_481459 ?auto_481456 ?auto_481460 ?auto_481461 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_481508 - SURFACE
      ?auto_481509 - SURFACE
      ?auto_481510 - SURFACE
      ?auto_481507 - SURFACE
      ?auto_481511 - SURFACE
      ?auto_481512 - SURFACE
    )
    :vars
    (
      ?auto_481514 - HOIST
      ?auto_481516 - PLACE
      ?auto_481518 - PLACE
      ?auto_481517 - HOIST
      ?auto_481515 - SURFACE
      ?auto_481513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_481514 ?auto_481516 ) ( IS-CRATE ?auto_481512 ) ( not ( = ?auto_481511 ?auto_481512 ) ) ( not ( = ?auto_481507 ?auto_481511 ) ) ( not ( = ?auto_481507 ?auto_481512 ) ) ( not ( = ?auto_481518 ?auto_481516 ) ) ( HOIST-AT ?auto_481517 ?auto_481518 ) ( not ( = ?auto_481514 ?auto_481517 ) ) ( AVAILABLE ?auto_481517 ) ( SURFACE-AT ?auto_481512 ?auto_481518 ) ( ON ?auto_481512 ?auto_481515 ) ( CLEAR ?auto_481512 ) ( not ( = ?auto_481511 ?auto_481515 ) ) ( not ( = ?auto_481512 ?auto_481515 ) ) ( not ( = ?auto_481507 ?auto_481515 ) ) ( TRUCK-AT ?auto_481513 ?auto_481516 ) ( SURFACE-AT ?auto_481507 ?auto_481516 ) ( CLEAR ?auto_481507 ) ( IS-CRATE ?auto_481511 ) ( AVAILABLE ?auto_481514 ) ( IN ?auto_481511 ?auto_481513 ) ( ON ?auto_481509 ?auto_481508 ) ( ON ?auto_481510 ?auto_481509 ) ( ON ?auto_481507 ?auto_481510 ) ( not ( = ?auto_481508 ?auto_481509 ) ) ( not ( = ?auto_481508 ?auto_481510 ) ) ( not ( = ?auto_481508 ?auto_481507 ) ) ( not ( = ?auto_481508 ?auto_481511 ) ) ( not ( = ?auto_481508 ?auto_481512 ) ) ( not ( = ?auto_481508 ?auto_481515 ) ) ( not ( = ?auto_481509 ?auto_481510 ) ) ( not ( = ?auto_481509 ?auto_481507 ) ) ( not ( = ?auto_481509 ?auto_481511 ) ) ( not ( = ?auto_481509 ?auto_481512 ) ) ( not ( = ?auto_481509 ?auto_481515 ) ) ( not ( = ?auto_481510 ?auto_481507 ) ) ( not ( = ?auto_481510 ?auto_481511 ) ) ( not ( = ?auto_481510 ?auto_481512 ) ) ( not ( = ?auto_481510 ?auto_481515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_481507 ?auto_481511 ?auto_481512 )
      ( MAKE-5CRATE-VERIFY ?auto_481508 ?auto_481509 ?auto_481510 ?auto_481507 ?auto_481511 ?auto_481512 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_482495 - SURFACE
      ?auto_482496 - SURFACE
    )
    :vars
    (
      ?auto_482498 - HOIST
      ?auto_482502 - PLACE
      ?auto_482497 - SURFACE
      ?auto_482500 - PLACE
      ?auto_482503 - HOIST
      ?auto_482501 - SURFACE
      ?auto_482499 - TRUCK
      ?auto_482504 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_482498 ?auto_482502 ) ( SURFACE-AT ?auto_482495 ?auto_482502 ) ( CLEAR ?auto_482495 ) ( IS-CRATE ?auto_482496 ) ( not ( = ?auto_482495 ?auto_482496 ) ) ( ON ?auto_482495 ?auto_482497 ) ( not ( = ?auto_482497 ?auto_482495 ) ) ( not ( = ?auto_482497 ?auto_482496 ) ) ( not ( = ?auto_482500 ?auto_482502 ) ) ( HOIST-AT ?auto_482503 ?auto_482500 ) ( not ( = ?auto_482498 ?auto_482503 ) ) ( AVAILABLE ?auto_482503 ) ( SURFACE-AT ?auto_482496 ?auto_482500 ) ( ON ?auto_482496 ?auto_482501 ) ( CLEAR ?auto_482496 ) ( not ( = ?auto_482495 ?auto_482501 ) ) ( not ( = ?auto_482496 ?auto_482501 ) ) ( not ( = ?auto_482497 ?auto_482501 ) ) ( TRUCK-AT ?auto_482499 ?auto_482502 ) ( LIFTING ?auto_482498 ?auto_482504 ) ( IS-CRATE ?auto_482504 ) ( not ( = ?auto_482495 ?auto_482504 ) ) ( not ( = ?auto_482496 ?auto_482504 ) ) ( not ( = ?auto_482497 ?auto_482504 ) ) ( not ( = ?auto_482501 ?auto_482504 ) ) )
    :subtasks
    ( ( !LOAD ?auto_482498 ?auto_482504 ?auto_482499 ?auto_482502 )
      ( MAKE-1CRATE ?auto_482495 ?auto_482496 )
      ( MAKE-1CRATE-VERIFY ?auto_482495 ?auto_482496 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_482711 - SURFACE
      ?auto_482712 - SURFACE
      ?auto_482713 - SURFACE
      ?auto_482710 - SURFACE
      ?auto_482714 - SURFACE
      ?auto_482716 - SURFACE
      ?auto_482715 - SURFACE
    )
    :vars
    (
      ?auto_482718 - HOIST
      ?auto_482717 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_482718 ?auto_482717 ) ( SURFACE-AT ?auto_482716 ?auto_482717 ) ( CLEAR ?auto_482716 ) ( LIFTING ?auto_482718 ?auto_482715 ) ( IS-CRATE ?auto_482715 ) ( not ( = ?auto_482716 ?auto_482715 ) ) ( ON ?auto_482712 ?auto_482711 ) ( ON ?auto_482713 ?auto_482712 ) ( ON ?auto_482710 ?auto_482713 ) ( ON ?auto_482714 ?auto_482710 ) ( ON ?auto_482716 ?auto_482714 ) ( not ( = ?auto_482711 ?auto_482712 ) ) ( not ( = ?auto_482711 ?auto_482713 ) ) ( not ( = ?auto_482711 ?auto_482710 ) ) ( not ( = ?auto_482711 ?auto_482714 ) ) ( not ( = ?auto_482711 ?auto_482716 ) ) ( not ( = ?auto_482711 ?auto_482715 ) ) ( not ( = ?auto_482712 ?auto_482713 ) ) ( not ( = ?auto_482712 ?auto_482710 ) ) ( not ( = ?auto_482712 ?auto_482714 ) ) ( not ( = ?auto_482712 ?auto_482716 ) ) ( not ( = ?auto_482712 ?auto_482715 ) ) ( not ( = ?auto_482713 ?auto_482710 ) ) ( not ( = ?auto_482713 ?auto_482714 ) ) ( not ( = ?auto_482713 ?auto_482716 ) ) ( not ( = ?auto_482713 ?auto_482715 ) ) ( not ( = ?auto_482710 ?auto_482714 ) ) ( not ( = ?auto_482710 ?auto_482716 ) ) ( not ( = ?auto_482710 ?auto_482715 ) ) ( not ( = ?auto_482714 ?auto_482716 ) ) ( not ( = ?auto_482714 ?auto_482715 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_482716 ?auto_482715 )
      ( MAKE-6CRATE-VERIFY ?auto_482711 ?auto_482712 ?auto_482713 ?auto_482710 ?auto_482714 ?auto_482716 ?auto_482715 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_482755 - SURFACE
      ?auto_482756 - SURFACE
      ?auto_482757 - SURFACE
      ?auto_482754 - SURFACE
      ?auto_482758 - SURFACE
      ?auto_482760 - SURFACE
      ?auto_482759 - SURFACE
    )
    :vars
    (
      ?auto_482763 - HOIST
      ?auto_482762 - PLACE
      ?auto_482761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_482763 ?auto_482762 ) ( SURFACE-AT ?auto_482760 ?auto_482762 ) ( CLEAR ?auto_482760 ) ( IS-CRATE ?auto_482759 ) ( not ( = ?auto_482760 ?auto_482759 ) ) ( TRUCK-AT ?auto_482761 ?auto_482762 ) ( AVAILABLE ?auto_482763 ) ( IN ?auto_482759 ?auto_482761 ) ( ON ?auto_482760 ?auto_482758 ) ( not ( = ?auto_482758 ?auto_482760 ) ) ( not ( = ?auto_482758 ?auto_482759 ) ) ( ON ?auto_482756 ?auto_482755 ) ( ON ?auto_482757 ?auto_482756 ) ( ON ?auto_482754 ?auto_482757 ) ( ON ?auto_482758 ?auto_482754 ) ( not ( = ?auto_482755 ?auto_482756 ) ) ( not ( = ?auto_482755 ?auto_482757 ) ) ( not ( = ?auto_482755 ?auto_482754 ) ) ( not ( = ?auto_482755 ?auto_482758 ) ) ( not ( = ?auto_482755 ?auto_482760 ) ) ( not ( = ?auto_482755 ?auto_482759 ) ) ( not ( = ?auto_482756 ?auto_482757 ) ) ( not ( = ?auto_482756 ?auto_482754 ) ) ( not ( = ?auto_482756 ?auto_482758 ) ) ( not ( = ?auto_482756 ?auto_482760 ) ) ( not ( = ?auto_482756 ?auto_482759 ) ) ( not ( = ?auto_482757 ?auto_482754 ) ) ( not ( = ?auto_482757 ?auto_482758 ) ) ( not ( = ?auto_482757 ?auto_482760 ) ) ( not ( = ?auto_482757 ?auto_482759 ) ) ( not ( = ?auto_482754 ?auto_482758 ) ) ( not ( = ?auto_482754 ?auto_482760 ) ) ( not ( = ?auto_482754 ?auto_482759 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_482758 ?auto_482760 ?auto_482759 )
      ( MAKE-6CRATE-VERIFY ?auto_482755 ?auto_482756 ?auto_482757 ?auto_482754 ?auto_482758 ?auto_482760 ?auto_482759 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_482806 - SURFACE
      ?auto_482807 - SURFACE
      ?auto_482808 - SURFACE
      ?auto_482805 - SURFACE
      ?auto_482809 - SURFACE
      ?auto_482811 - SURFACE
      ?auto_482810 - SURFACE
    )
    :vars
    (
      ?auto_482814 - HOIST
      ?auto_482815 - PLACE
      ?auto_482812 - TRUCK
      ?auto_482813 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_482814 ?auto_482815 ) ( SURFACE-AT ?auto_482811 ?auto_482815 ) ( CLEAR ?auto_482811 ) ( IS-CRATE ?auto_482810 ) ( not ( = ?auto_482811 ?auto_482810 ) ) ( AVAILABLE ?auto_482814 ) ( IN ?auto_482810 ?auto_482812 ) ( ON ?auto_482811 ?auto_482809 ) ( not ( = ?auto_482809 ?auto_482811 ) ) ( not ( = ?auto_482809 ?auto_482810 ) ) ( TRUCK-AT ?auto_482812 ?auto_482813 ) ( not ( = ?auto_482813 ?auto_482815 ) ) ( ON ?auto_482807 ?auto_482806 ) ( ON ?auto_482808 ?auto_482807 ) ( ON ?auto_482805 ?auto_482808 ) ( ON ?auto_482809 ?auto_482805 ) ( not ( = ?auto_482806 ?auto_482807 ) ) ( not ( = ?auto_482806 ?auto_482808 ) ) ( not ( = ?auto_482806 ?auto_482805 ) ) ( not ( = ?auto_482806 ?auto_482809 ) ) ( not ( = ?auto_482806 ?auto_482811 ) ) ( not ( = ?auto_482806 ?auto_482810 ) ) ( not ( = ?auto_482807 ?auto_482808 ) ) ( not ( = ?auto_482807 ?auto_482805 ) ) ( not ( = ?auto_482807 ?auto_482809 ) ) ( not ( = ?auto_482807 ?auto_482811 ) ) ( not ( = ?auto_482807 ?auto_482810 ) ) ( not ( = ?auto_482808 ?auto_482805 ) ) ( not ( = ?auto_482808 ?auto_482809 ) ) ( not ( = ?auto_482808 ?auto_482811 ) ) ( not ( = ?auto_482808 ?auto_482810 ) ) ( not ( = ?auto_482805 ?auto_482809 ) ) ( not ( = ?auto_482805 ?auto_482811 ) ) ( not ( = ?auto_482805 ?auto_482810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_482809 ?auto_482811 ?auto_482810 )
      ( MAKE-6CRATE-VERIFY ?auto_482806 ?auto_482807 ?auto_482808 ?auto_482805 ?auto_482809 ?auto_482811 ?auto_482810 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_482863 - SURFACE
      ?auto_482864 - SURFACE
      ?auto_482865 - SURFACE
      ?auto_482862 - SURFACE
      ?auto_482866 - SURFACE
      ?auto_482868 - SURFACE
      ?auto_482867 - SURFACE
    )
    :vars
    (
      ?auto_482871 - HOIST
      ?auto_482872 - PLACE
      ?auto_482869 - TRUCK
      ?auto_482873 - PLACE
      ?auto_482870 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_482871 ?auto_482872 ) ( SURFACE-AT ?auto_482868 ?auto_482872 ) ( CLEAR ?auto_482868 ) ( IS-CRATE ?auto_482867 ) ( not ( = ?auto_482868 ?auto_482867 ) ) ( AVAILABLE ?auto_482871 ) ( ON ?auto_482868 ?auto_482866 ) ( not ( = ?auto_482866 ?auto_482868 ) ) ( not ( = ?auto_482866 ?auto_482867 ) ) ( TRUCK-AT ?auto_482869 ?auto_482873 ) ( not ( = ?auto_482873 ?auto_482872 ) ) ( HOIST-AT ?auto_482870 ?auto_482873 ) ( LIFTING ?auto_482870 ?auto_482867 ) ( not ( = ?auto_482871 ?auto_482870 ) ) ( ON ?auto_482864 ?auto_482863 ) ( ON ?auto_482865 ?auto_482864 ) ( ON ?auto_482862 ?auto_482865 ) ( ON ?auto_482866 ?auto_482862 ) ( not ( = ?auto_482863 ?auto_482864 ) ) ( not ( = ?auto_482863 ?auto_482865 ) ) ( not ( = ?auto_482863 ?auto_482862 ) ) ( not ( = ?auto_482863 ?auto_482866 ) ) ( not ( = ?auto_482863 ?auto_482868 ) ) ( not ( = ?auto_482863 ?auto_482867 ) ) ( not ( = ?auto_482864 ?auto_482865 ) ) ( not ( = ?auto_482864 ?auto_482862 ) ) ( not ( = ?auto_482864 ?auto_482866 ) ) ( not ( = ?auto_482864 ?auto_482868 ) ) ( not ( = ?auto_482864 ?auto_482867 ) ) ( not ( = ?auto_482865 ?auto_482862 ) ) ( not ( = ?auto_482865 ?auto_482866 ) ) ( not ( = ?auto_482865 ?auto_482868 ) ) ( not ( = ?auto_482865 ?auto_482867 ) ) ( not ( = ?auto_482862 ?auto_482866 ) ) ( not ( = ?auto_482862 ?auto_482868 ) ) ( not ( = ?auto_482862 ?auto_482867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_482866 ?auto_482868 ?auto_482867 )
      ( MAKE-6CRATE-VERIFY ?auto_482863 ?auto_482864 ?auto_482865 ?auto_482862 ?auto_482866 ?auto_482868 ?auto_482867 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_482926 - SURFACE
      ?auto_482927 - SURFACE
      ?auto_482928 - SURFACE
      ?auto_482925 - SURFACE
      ?auto_482929 - SURFACE
      ?auto_482931 - SURFACE
      ?auto_482930 - SURFACE
    )
    :vars
    (
      ?auto_482937 - HOIST
      ?auto_482936 - PLACE
      ?auto_482934 - TRUCK
      ?auto_482933 - PLACE
      ?auto_482932 - HOIST
      ?auto_482935 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_482937 ?auto_482936 ) ( SURFACE-AT ?auto_482931 ?auto_482936 ) ( CLEAR ?auto_482931 ) ( IS-CRATE ?auto_482930 ) ( not ( = ?auto_482931 ?auto_482930 ) ) ( AVAILABLE ?auto_482937 ) ( ON ?auto_482931 ?auto_482929 ) ( not ( = ?auto_482929 ?auto_482931 ) ) ( not ( = ?auto_482929 ?auto_482930 ) ) ( TRUCK-AT ?auto_482934 ?auto_482933 ) ( not ( = ?auto_482933 ?auto_482936 ) ) ( HOIST-AT ?auto_482932 ?auto_482933 ) ( not ( = ?auto_482937 ?auto_482932 ) ) ( AVAILABLE ?auto_482932 ) ( SURFACE-AT ?auto_482930 ?auto_482933 ) ( ON ?auto_482930 ?auto_482935 ) ( CLEAR ?auto_482930 ) ( not ( = ?auto_482931 ?auto_482935 ) ) ( not ( = ?auto_482930 ?auto_482935 ) ) ( not ( = ?auto_482929 ?auto_482935 ) ) ( ON ?auto_482927 ?auto_482926 ) ( ON ?auto_482928 ?auto_482927 ) ( ON ?auto_482925 ?auto_482928 ) ( ON ?auto_482929 ?auto_482925 ) ( not ( = ?auto_482926 ?auto_482927 ) ) ( not ( = ?auto_482926 ?auto_482928 ) ) ( not ( = ?auto_482926 ?auto_482925 ) ) ( not ( = ?auto_482926 ?auto_482929 ) ) ( not ( = ?auto_482926 ?auto_482931 ) ) ( not ( = ?auto_482926 ?auto_482930 ) ) ( not ( = ?auto_482926 ?auto_482935 ) ) ( not ( = ?auto_482927 ?auto_482928 ) ) ( not ( = ?auto_482927 ?auto_482925 ) ) ( not ( = ?auto_482927 ?auto_482929 ) ) ( not ( = ?auto_482927 ?auto_482931 ) ) ( not ( = ?auto_482927 ?auto_482930 ) ) ( not ( = ?auto_482927 ?auto_482935 ) ) ( not ( = ?auto_482928 ?auto_482925 ) ) ( not ( = ?auto_482928 ?auto_482929 ) ) ( not ( = ?auto_482928 ?auto_482931 ) ) ( not ( = ?auto_482928 ?auto_482930 ) ) ( not ( = ?auto_482928 ?auto_482935 ) ) ( not ( = ?auto_482925 ?auto_482929 ) ) ( not ( = ?auto_482925 ?auto_482931 ) ) ( not ( = ?auto_482925 ?auto_482930 ) ) ( not ( = ?auto_482925 ?auto_482935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_482929 ?auto_482931 ?auto_482930 )
      ( MAKE-6CRATE-VERIFY ?auto_482926 ?auto_482927 ?auto_482928 ?auto_482925 ?auto_482929 ?auto_482931 ?auto_482930 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_482990 - SURFACE
      ?auto_482991 - SURFACE
      ?auto_482992 - SURFACE
      ?auto_482989 - SURFACE
      ?auto_482993 - SURFACE
      ?auto_482995 - SURFACE
      ?auto_482994 - SURFACE
    )
    :vars
    (
      ?auto_482997 - HOIST
      ?auto_482999 - PLACE
      ?auto_482996 - PLACE
      ?auto_483001 - HOIST
      ?auto_482998 - SURFACE
      ?auto_483000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_482997 ?auto_482999 ) ( SURFACE-AT ?auto_482995 ?auto_482999 ) ( CLEAR ?auto_482995 ) ( IS-CRATE ?auto_482994 ) ( not ( = ?auto_482995 ?auto_482994 ) ) ( AVAILABLE ?auto_482997 ) ( ON ?auto_482995 ?auto_482993 ) ( not ( = ?auto_482993 ?auto_482995 ) ) ( not ( = ?auto_482993 ?auto_482994 ) ) ( not ( = ?auto_482996 ?auto_482999 ) ) ( HOIST-AT ?auto_483001 ?auto_482996 ) ( not ( = ?auto_482997 ?auto_483001 ) ) ( AVAILABLE ?auto_483001 ) ( SURFACE-AT ?auto_482994 ?auto_482996 ) ( ON ?auto_482994 ?auto_482998 ) ( CLEAR ?auto_482994 ) ( not ( = ?auto_482995 ?auto_482998 ) ) ( not ( = ?auto_482994 ?auto_482998 ) ) ( not ( = ?auto_482993 ?auto_482998 ) ) ( TRUCK-AT ?auto_483000 ?auto_482999 ) ( ON ?auto_482991 ?auto_482990 ) ( ON ?auto_482992 ?auto_482991 ) ( ON ?auto_482989 ?auto_482992 ) ( ON ?auto_482993 ?auto_482989 ) ( not ( = ?auto_482990 ?auto_482991 ) ) ( not ( = ?auto_482990 ?auto_482992 ) ) ( not ( = ?auto_482990 ?auto_482989 ) ) ( not ( = ?auto_482990 ?auto_482993 ) ) ( not ( = ?auto_482990 ?auto_482995 ) ) ( not ( = ?auto_482990 ?auto_482994 ) ) ( not ( = ?auto_482990 ?auto_482998 ) ) ( not ( = ?auto_482991 ?auto_482992 ) ) ( not ( = ?auto_482991 ?auto_482989 ) ) ( not ( = ?auto_482991 ?auto_482993 ) ) ( not ( = ?auto_482991 ?auto_482995 ) ) ( not ( = ?auto_482991 ?auto_482994 ) ) ( not ( = ?auto_482991 ?auto_482998 ) ) ( not ( = ?auto_482992 ?auto_482989 ) ) ( not ( = ?auto_482992 ?auto_482993 ) ) ( not ( = ?auto_482992 ?auto_482995 ) ) ( not ( = ?auto_482992 ?auto_482994 ) ) ( not ( = ?auto_482992 ?auto_482998 ) ) ( not ( = ?auto_482989 ?auto_482993 ) ) ( not ( = ?auto_482989 ?auto_482995 ) ) ( not ( = ?auto_482989 ?auto_482994 ) ) ( not ( = ?auto_482989 ?auto_482998 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_482993 ?auto_482995 ?auto_482994 )
      ( MAKE-6CRATE-VERIFY ?auto_482990 ?auto_482991 ?auto_482992 ?auto_482989 ?auto_482993 ?auto_482995 ?auto_482994 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_483054 - SURFACE
      ?auto_483055 - SURFACE
      ?auto_483056 - SURFACE
      ?auto_483053 - SURFACE
      ?auto_483057 - SURFACE
      ?auto_483059 - SURFACE
      ?auto_483058 - SURFACE
    )
    :vars
    (
      ?auto_483060 - HOIST
      ?auto_483062 - PLACE
      ?auto_483064 - PLACE
      ?auto_483065 - HOIST
      ?auto_483061 - SURFACE
      ?auto_483063 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_483060 ?auto_483062 ) ( IS-CRATE ?auto_483058 ) ( not ( = ?auto_483059 ?auto_483058 ) ) ( not ( = ?auto_483057 ?auto_483059 ) ) ( not ( = ?auto_483057 ?auto_483058 ) ) ( not ( = ?auto_483064 ?auto_483062 ) ) ( HOIST-AT ?auto_483065 ?auto_483064 ) ( not ( = ?auto_483060 ?auto_483065 ) ) ( AVAILABLE ?auto_483065 ) ( SURFACE-AT ?auto_483058 ?auto_483064 ) ( ON ?auto_483058 ?auto_483061 ) ( CLEAR ?auto_483058 ) ( not ( = ?auto_483059 ?auto_483061 ) ) ( not ( = ?auto_483058 ?auto_483061 ) ) ( not ( = ?auto_483057 ?auto_483061 ) ) ( TRUCK-AT ?auto_483063 ?auto_483062 ) ( SURFACE-AT ?auto_483057 ?auto_483062 ) ( CLEAR ?auto_483057 ) ( LIFTING ?auto_483060 ?auto_483059 ) ( IS-CRATE ?auto_483059 ) ( ON ?auto_483055 ?auto_483054 ) ( ON ?auto_483056 ?auto_483055 ) ( ON ?auto_483053 ?auto_483056 ) ( ON ?auto_483057 ?auto_483053 ) ( not ( = ?auto_483054 ?auto_483055 ) ) ( not ( = ?auto_483054 ?auto_483056 ) ) ( not ( = ?auto_483054 ?auto_483053 ) ) ( not ( = ?auto_483054 ?auto_483057 ) ) ( not ( = ?auto_483054 ?auto_483059 ) ) ( not ( = ?auto_483054 ?auto_483058 ) ) ( not ( = ?auto_483054 ?auto_483061 ) ) ( not ( = ?auto_483055 ?auto_483056 ) ) ( not ( = ?auto_483055 ?auto_483053 ) ) ( not ( = ?auto_483055 ?auto_483057 ) ) ( not ( = ?auto_483055 ?auto_483059 ) ) ( not ( = ?auto_483055 ?auto_483058 ) ) ( not ( = ?auto_483055 ?auto_483061 ) ) ( not ( = ?auto_483056 ?auto_483053 ) ) ( not ( = ?auto_483056 ?auto_483057 ) ) ( not ( = ?auto_483056 ?auto_483059 ) ) ( not ( = ?auto_483056 ?auto_483058 ) ) ( not ( = ?auto_483056 ?auto_483061 ) ) ( not ( = ?auto_483053 ?auto_483057 ) ) ( not ( = ?auto_483053 ?auto_483059 ) ) ( not ( = ?auto_483053 ?auto_483058 ) ) ( not ( = ?auto_483053 ?auto_483061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_483057 ?auto_483059 ?auto_483058 )
      ( MAKE-6CRATE-VERIFY ?auto_483054 ?auto_483055 ?auto_483056 ?auto_483053 ?auto_483057 ?auto_483059 ?auto_483058 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_483118 - SURFACE
      ?auto_483119 - SURFACE
      ?auto_483120 - SURFACE
      ?auto_483117 - SURFACE
      ?auto_483121 - SURFACE
      ?auto_483123 - SURFACE
      ?auto_483122 - SURFACE
    )
    :vars
    (
      ?auto_483128 - HOIST
      ?auto_483124 - PLACE
      ?auto_483129 - PLACE
      ?auto_483127 - HOIST
      ?auto_483125 - SURFACE
      ?auto_483126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_483128 ?auto_483124 ) ( IS-CRATE ?auto_483122 ) ( not ( = ?auto_483123 ?auto_483122 ) ) ( not ( = ?auto_483121 ?auto_483123 ) ) ( not ( = ?auto_483121 ?auto_483122 ) ) ( not ( = ?auto_483129 ?auto_483124 ) ) ( HOIST-AT ?auto_483127 ?auto_483129 ) ( not ( = ?auto_483128 ?auto_483127 ) ) ( AVAILABLE ?auto_483127 ) ( SURFACE-AT ?auto_483122 ?auto_483129 ) ( ON ?auto_483122 ?auto_483125 ) ( CLEAR ?auto_483122 ) ( not ( = ?auto_483123 ?auto_483125 ) ) ( not ( = ?auto_483122 ?auto_483125 ) ) ( not ( = ?auto_483121 ?auto_483125 ) ) ( TRUCK-AT ?auto_483126 ?auto_483124 ) ( SURFACE-AT ?auto_483121 ?auto_483124 ) ( CLEAR ?auto_483121 ) ( IS-CRATE ?auto_483123 ) ( AVAILABLE ?auto_483128 ) ( IN ?auto_483123 ?auto_483126 ) ( ON ?auto_483119 ?auto_483118 ) ( ON ?auto_483120 ?auto_483119 ) ( ON ?auto_483117 ?auto_483120 ) ( ON ?auto_483121 ?auto_483117 ) ( not ( = ?auto_483118 ?auto_483119 ) ) ( not ( = ?auto_483118 ?auto_483120 ) ) ( not ( = ?auto_483118 ?auto_483117 ) ) ( not ( = ?auto_483118 ?auto_483121 ) ) ( not ( = ?auto_483118 ?auto_483123 ) ) ( not ( = ?auto_483118 ?auto_483122 ) ) ( not ( = ?auto_483118 ?auto_483125 ) ) ( not ( = ?auto_483119 ?auto_483120 ) ) ( not ( = ?auto_483119 ?auto_483117 ) ) ( not ( = ?auto_483119 ?auto_483121 ) ) ( not ( = ?auto_483119 ?auto_483123 ) ) ( not ( = ?auto_483119 ?auto_483122 ) ) ( not ( = ?auto_483119 ?auto_483125 ) ) ( not ( = ?auto_483120 ?auto_483117 ) ) ( not ( = ?auto_483120 ?auto_483121 ) ) ( not ( = ?auto_483120 ?auto_483123 ) ) ( not ( = ?auto_483120 ?auto_483122 ) ) ( not ( = ?auto_483120 ?auto_483125 ) ) ( not ( = ?auto_483117 ?auto_483121 ) ) ( not ( = ?auto_483117 ?auto_483123 ) ) ( not ( = ?auto_483117 ?auto_483122 ) ) ( not ( = ?auto_483117 ?auto_483125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_483121 ?auto_483123 ?auto_483122 )
      ( MAKE-6CRATE-VERIFY ?auto_483118 ?auto_483119 ?auto_483120 ?auto_483117 ?auto_483121 ?auto_483123 ?auto_483122 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_485068 - SURFACE
      ?auto_485069 - SURFACE
      ?auto_485070 - SURFACE
      ?auto_485067 - SURFACE
      ?auto_485071 - SURFACE
      ?auto_485073 - SURFACE
      ?auto_485072 - SURFACE
      ?auto_485074 - SURFACE
    )
    :vars
    (
      ?auto_485075 - HOIST
      ?auto_485076 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_485075 ?auto_485076 ) ( SURFACE-AT ?auto_485072 ?auto_485076 ) ( CLEAR ?auto_485072 ) ( LIFTING ?auto_485075 ?auto_485074 ) ( IS-CRATE ?auto_485074 ) ( not ( = ?auto_485072 ?auto_485074 ) ) ( ON ?auto_485069 ?auto_485068 ) ( ON ?auto_485070 ?auto_485069 ) ( ON ?auto_485067 ?auto_485070 ) ( ON ?auto_485071 ?auto_485067 ) ( ON ?auto_485073 ?auto_485071 ) ( ON ?auto_485072 ?auto_485073 ) ( not ( = ?auto_485068 ?auto_485069 ) ) ( not ( = ?auto_485068 ?auto_485070 ) ) ( not ( = ?auto_485068 ?auto_485067 ) ) ( not ( = ?auto_485068 ?auto_485071 ) ) ( not ( = ?auto_485068 ?auto_485073 ) ) ( not ( = ?auto_485068 ?auto_485072 ) ) ( not ( = ?auto_485068 ?auto_485074 ) ) ( not ( = ?auto_485069 ?auto_485070 ) ) ( not ( = ?auto_485069 ?auto_485067 ) ) ( not ( = ?auto_485069 ?auto_485071 ) ) ( not ( = ?auto_485069 ?auto_485073 ) ) ( not ( = ?auto_485069 ?auto_485072 ) ) ( not ( = ?auto_485069 ?auto_485074 ) ) ( not ( = ?auto_485070 ?auto_485067 ) ) ( not ( = ?auto_485070 ?auto_485071 ) ) ( not ( = ?auto_485070 ?auto_485073 ) ) ( not ( = ?auto_485070 ?auto_485072 ) ) ( not ( = ?auto_485070 ?auto_485074 ) ) ( not ( = ?auto_485067 ?auto_485071 ) ) ( not ( = ?auto_485067 ?auto_485073 ) ) ( not ( = ?auto_485067 ?auto_485072 ) ) ( not ( = ?auto_485067 ?auto_485074 ) ) ( not ( = ?auto_485071 ?auto_485073 ) ) ( not ( = ?auto_485071 ?auto_485072 ) ) ( not ( = ?auto_485071 ?auto_485074 ) ) ( not ( = ?auto_485073 ?auto_485072 ) ) ( not ( = ?auto_485073 ?auto_485074 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_485072 ?auto_485074 )
      ( MAKE-7CRATE-VERIFY ?auto_485068 ?auto_485069 ?auto_485070 ?auto_485067 ?auto_485071 ?auto_485073 ?auto_485072 ?auto_485074 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_485123 - SURFACE
      ?auto_485124 - SURFACE
      ?auto_485125 - SURFACE
      ?auto_485122 - SURFACE
      ?auto_485126 - SURFACE
      ?auto_485128 - SURFACE
      ?auto_485127 - SURFACE
      ?auto_485129 - SURFACE
    )
    :vars
    (
      ?auto_485130 - HOIST
      ?auto_485131 - PLACE
      ?auto_485132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_485130 ?auto_485131 ) ( SURFACE-AT ?auto_485127 ?auto_485131 ) ( CLEAR ?auto_485127 ) ( IS-CRATE ?auto_485129 ) ( not ( = ?auto_485127 ?auto_485129 ) ) ( TRUCK-AT ?auto_485132 ?auto_485131 ) ( AVAILABLE ?auto_485130 ) ( IN ?auto_485129 ?auto_485132 ) ( ON ?auto_485127 ?auto_485128 ) ( not ( = ?auto_485128 ?auto_485127 ) ) ( not ( = ?auto_485128 ?auto_485129 ) ) ( ON ?auto_485124 ?auto_485123 ) ( ON ?auto_485125 ?auto_485124 ) ( ON ?auto_485122 ?auto_485125 ) ( ON ?auto_485126 ?auto_485122 ) ( ON ?auto_485128 ?auto_485126 ) ( not ( = ?auto_485123 ?auto_485124 ) ) ( not ( = ?auto_485123 ?auto_485125 ) ) ( not ( = ?auto_485123 ?auto_485122 ) ) ( not ( = ?auto_485123 ?auto_485126 ) ) ( not ( = ?auto_485123 ?auto_485128 ) ) ( not ( = ?auto_485123 ?auto_485127 ) ) ( not ( = ?auto_485123 ?auto_485129 ) ) ( not ( = ?auto_485124 ?auto_485125 ) ) ( not ( = ?auto_485124 ?auto_485122 ) ) ( not ( = ?auto_485124 ?auto_485126 ) ) ( not ( = ?auto_485124 ?auto_485128 ) ) ( not ( = ?auto_485124 ?auto_485127 ) ) ( not ( = ?auto_485124 ?auto_485129 ) ) ( not ( = ?auto_485125 ?auto_485122 ) ) ( not ( = ?auto_485125 ?auto_485126 ) ) ( not ( = ?auto_485125 ?auto_485128 ) ) ( not ( = ?auto_485125 ?auto_485127 ) ) ( not ( = ?auto_485125 ?auto_485129 ) ) ( not ( = ?auto_485122 ?auto_485126 ) ) ( not ( = ?auto_485122 ?auto_485128 ) ) ( not ( = ?auto_485122 ?auto_485127 ) ) ( not ( = ?auto_485122 ?auto_485129 ) ) ( not ( = ?auto_485126 ?auto_485128 ) ) ( not ( = ?auto_485126 ?auto_485127 ) ) ( not ( = ?auto_485126 ?auto_485129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_485128 ?auto_485127 ?auto_485129 )
      ( MAKE-7CRATE-VERIFY ?auto_485123 ?auto_485124 ?auto_485125 ?auto_485122 ?auto_485126 ?auto_485128 ?auto_485127 ?auto_485129 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_485186 - SURFACE
      ?auto_485187 - SURFACE
      ?auto_485188 - SURFACE
      ?auto_485185 - SURFACE
      ?auto_485189 - SURFACE
      ?auto_485191 - SURFACE
      ?auto_485190 - SURFACE
      ?auto_485192 - SURFACE
    )
    :vars
    (
      ?auto_485196 - HOIST
      ?auto_485193 - PLACE
      ?auto_485194 - TRUCK
      ?auto_485195 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_485196 ?auto_485193 ) ( SURFACE-AT ?auto_485190 ?auto_485193 ) ( CLEAR ?auto_485190 ) ( IS-CRATE ?auto_485192 ) ( not ( = ?auto_485190 ?auto_485192 ) ) ( AVAILABLE ?auto_485196 ) ( IN ?auto_485192 ?auto_485194 ) ( ON ?auto_485190 ?auto_485191 ) ( not ( = ?auto_485191 ?auto_485190 ) ) ( not ( = ?auto_485191 ?auto_485192 ) ) ( TRUCK-AT ?auto_485194 ?auto_485195 ) ( not ( = ?auto_485195 ?auto_485193 ) ) ( ON ?auto_485187 ?auto_485186 ) ( ON ?auto_485188 ?auto_485187 ) ( ON ?auto_485185 ?auto_485188 ) ( ON ?auto_485189 ?auto_485185 ) ( ON ?auto_485191 ?auto_485189 ) ( not ( = ?auto_485186 ?auto_485187 ) ) ( not ( = ?auto_485186 ?auto_485188 ) ) ( not ( = ?auto_485186 ?auto_485185 ) ) ( not ( = ?auto_485186 ?auto_485189 ) ) ( not ( = ?auto_485186 ?auto_485191 ) ) ( not ( = ?auto_485186 ?auto_485190 ) ) ( not ( = ?auto_485186 ?auto_485192 ) ) ( not ( = ?auto_485187 ?auto_485188 ) ) ( not ( = ?auto_485187 ?auto_485185 ) ) ( not ( = ?auto_485187 ?auto_485189 ) ) ( not ( = ?auto_485187 ?auto_485191 ) ) ( not ( = ?auto_485187 ?auto_485190 ) ) ( not ( = ?auto_485187 ?auto_485192 ) ) ( not ( = ?auto_485188 ?auto_485185 ) ) ( not ( = ?auto_485188 ?auto_485189 ) ) ( not ( = ?auto_485188 ?auto_485191 ) ) ( not ( = ?auto_485188 ?auto_485190 ) ) ( not ( = ?auto_485188 ?auto_485192 ) ) ( not ( = ?auto_485185 ?auto_485189 ) ) ( not ( = ?auto_485185 ?auto_485191 ) ) ( not ( = ?auto_485185 ?auto_485190 ) ) ( not ( = ?auto_485185 ?auto_485192 ) ) ( not ( = ?auto_485189 ?auto_485191 ) ) ( not ( = ?auto_485189 ?auto_485190 ) ) ( not ( = ?auto_485189 ?auto_485192 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_485191 ?auto_485190 ?auto_485192 )
      ( MAKE-7CRATE-VERIFY ?auto_485186 ?auto_485187 ?auto_485188 ?auto_485185 ?auto_485189 ?auto_485191 ?auto_485190 ?auto_485192 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_485256 - SURFACE
      ?auto_485257 - SURFACE
      ?auto_485258 - SURFACE
      ?auto_485255 - SURFACE
      ?auto_485259 - SURFACE
      ?auto_485261 - SURFACE
      ?auto_485260 - SURFACE
      ?auto_485262 - SURFACE
    )
    :vars
    (
      ?auto_485264 - HOIST
      ?auto_485263 - PLACE
      ?auto_485265 - TRUCK
      ?auto_485266 - PLACE
      ?auto_485267 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_485264 ?auto_485263 ) ( SURFACE-AT ?auto_485260 ?auto_485263 ) ( CLEAR ?auto_485260 ) ( IS-CRATE ?auto_485262 ) ( not ( = ?auto_485260 ?auto_485262 ) ) ( AVAILABLE ?auto_485264 ) ( ON ?auto_485260 ?auto_485261 ) ( not ( = ?auto_485261 ?auto_485260 ) ) ( not ( = ?auto_485261 ?auto_485262 ) ) ( TRUCK-AT ?auto_485265 ?auto_485266 ) ( not ( = ?auto_485266 ?auto_485263 ) ) ( HOIST-AT ?auto_485267 ?auto_485266 ) ( LIFTING ?auto_485267 ?auto_485262 ) ( not ( = ?auto_485264 ?auto_485267 ) ) ( ON ?auto_485257 ?auto_485256 ) ( ON ?auto_485258 ?auto_485257 ) ( ON ?auto_485255 ?auto_485258 ) ( ON ?auto_485259 ?auto_485255 ) ( ON ?auto_485261 ?auto_485259 ) ( not ( = ?auto_485256 ?auto_485257 ) ) ( not ( = ?auto_485256 ?auto_485258 ) ) ( not ( = ?auto_485256 ?auto_485255 ) ) ( not ( = ?auto_485256 ?auto_485259 ) ) ( not ( = ?auto_485256 ?auto_485261 ) ) ( not ( = ?auto_485256 ?auto_485260 ) ) ( not ( = ?auto_485256 ?auto_485262 ) ) ( not ( = ?auto_485257 ?auto_485258 ) ) ( not ( = ?auto_485257 ?auto_485255 ) ) ( not ( = ?auto_485257 ?auto_485259 ) ) ( not ( = ?auto_485257 ?auto_485261 ) ) ( not ( = ?auto_485257 ?auto_485260 ) ) ( not ( = ?auto_485257 ?auto_485262 ) ) ( not ( = ?auto_485258 ?auto_485255 ) ) ( not ( = ?auto_485258 ?auto_485259 ) ) ( not ( = ?auto_485258 ?auto_485261 ) ) ( not ( = ?auto_485258 ?auto_485260 ) ) ( not ( = ?auto_485258 ?auto_485262 ) ) ( not ( = ?auto_485255 ?auto_485259 ) ) ( not ( = ?auto_485255 ?auto_485261 ) ) ( not ( = ?auto_485255 ?auto_485260 ) ) ( not ( = ?auto_485255 ?auto_485262 ) ) ( not ( = ?auto_485259 ?auto_485261 ) ) ( not ( = ?auto_485259 ?auto_485260 ) ) ( not ( = ?auto_485259 ?auto_485262 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_485261 ?auto_485260 ?auto_485262 )
      ( MAKE-7CRATE-VERIFY ?auto_485256 ?auto_485257 ?auto_485258 ?auto_485255 ?auto_485259 ?auto_485261 ?auto_485260 ?auto_485262 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_485333 - SURFACE
      ?auto_485334 - SURFACE
      ?auto_485335 - SURFACE
      ?auto_485332 - SURFACE
      ?auto_485336 - SURFACE
      ?auto_485338 - SURFACE
      ?auto_485337 - SURFACE
      ?auto_485339 - SURFACE
    )
    :vars
    (
      ?auto_485340 - HOIST
      ?auto_485341 - PLACE
      ?auto_485345 - TRUCK
      ?auto_485343 - PLACE
      ?auto_485342 - HOIST
      ?auto_485344 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_485340 ?auto_485341 ) ( SURFACE-AT ?auto_485337 ?auto_485341 ) ( CLEAR ?auto_485337 ) ( IS-CRATE ?auto_485339 ) ( not ( = ?auto_485337 ?auto_485339 ) ) ( AVAILABLE ?auto_485340 ) ( ON ?auto_485337 ?auto_485338 ) ( not ( = ?auto_485338 ?auto_485337 ) ) ( not ( = ?auto_485338 ?auto_485339 ) ) ( TRUCK-AT ?auto_485345 ?auto_485343 ) ( not ( = ?auto_485343 ?auto_485341 ) ) ( HOIST-AT ?auto_485342 ?auto_485343 ) ( not ( = ?auto_485340 ?auto_485342 ) ) ( AVAILABLE ?auto_485342 ) ( SURFACE-AT ?auto_485339 ?auto_485343 ) ( ON ?auto_485339 ?auto_485344 ) ( CLEAR ?auto_485339 ) ( not ( = ?auto_485337 ?auto_485344 ) ) ( not ( = ?auto_485339 ?auto_485344 ) ) ( not ( = ?auto_485338 ?auto_485344 ) ) ( ON ?auto_485334 ?auto_485333 ) ( ON ?auto_485335 ?auto_485334 ) ( ON ?auto_485332 ?auto_485335 ) ( ON ?auto_485336 ?auto_485332 ) ( ON ?auto_485338 ?auto_485336 ) ( not ( = ?auto_485333 ?auto_485334 ) ) ( not ( = ?auto_485333 ?auto_485335 ) ) ( not ( = ?auto_485333 ?auto_485332 ) ) ( not ( = ?auto_485333 ?auto_485336 ) ) ( not ( = ?auto_485333 ?auto_485338 ) ) ( not ( = ?auto_485333 ?auto_485337 ) ) ( not ( = ?auto_485333 ?auto_485339 ) ) ( not ( = ?auto_485333 ?auto_485344 ) ) ( not ( = ?auto_485334 ?auto_485335 ) ) ( not ( = ?auto_485334 ?auto_485332 ) ) ( not ( = ?auto_485334 ?auto_485336 ) ) ( not ( = ?auto_485334 ?auto_485338 ) ) ( not ( = ?auto_485334 ?auto_485337 ) ) ( not ( = ?auto_485334 ?auto_485339 ) ) ( not ( = ?auto_485334 ?auto_485344 ) ) ( not ( = ?auto_485335 ?auto_485332 ) ) ( not ( = ?auto_485335 ?auto_485336 ) ) ( not ( = ?auto_485335 ?auto_485338 ) ) ( not ( = ?auto_485335 ?auto_485337 ) ) ( not ( = ?auto_485335 ?auto_485339 ) ) ( not ( = ?auto_485335 ?auto_485344 ) ) ( not ( = ?auto_485332 ?auto_485336 ) ) ( not ( = ?auto_485332 ?auto_485338 ) ) ( not ( = ?auto_485332 ?auto_485337 ) ) ( not ( = ?auto_485332 ?auto_485339 ) ) ( not ( = ?auto_485332 ?auto_485344 ) ) ( not ( = ?auto_485336 ?auto_485338 ) ) ( not ( = ?auto_485336 ?auto_485337 ) ) ( not ( = ?auto_485336 ?auto_485339 ) ) ( not ( = ?auto_485336 ?auto_485344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_485338 ?auto_485337 ?auto_485339 )
      ( MAKE-7CRATE-VERIFY ?auto_485333 ?auto_485334 ?auto_485335 ?auto_485332 ?auto_485336 ?auto_485338 ?auto_485337 ?auto_485339 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_485411 - SURFACE
      ?auto_485412 - SURFACE
      ?auto_485413 - SURFACE
      ?auto_485410 - SURFACE
      ?auto_485414 - SURFACE
      ?auto_485416 - SURFACE
      ?auto_485415 - SURFACE
      ?auto_485417 - SURFACE
    )
    :vars
    (
      ?auto_485421 - HOIST
      ?auto_485420 - PLACE
      ?auto_485419 - PLACE
      ?auto_485418 - HOIST
      ?auto_485423 - SURFACE
      ?auto_485422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_485421 ?auto_485420 ) ( SURFACE-AT ?auto_485415 ?auto_485420 ) ( CLEAR ?auto_485415 ) ( IS-CRATE ?auto_485417 ) ( not ( = ?auto_485415 ?auto_485417 ) ) ( AVAILABLE ?auto_485421 ) ( ON ?auto_485415 ?auto_485416 ) ( not ( = ?auto_485416 ?auto_485415 ) ) ( not ( = ?auto_485416 ?auto_485417 ) ) ( not ( = ?auto_485419 ?auto_485420 ) ) ( HOIST-AT ?auto_485418 ?auto_485419 ) ( not ( = ?auto_485421 ?auto_485418 ) ) ( AVAILABLE ?auto_485418 ) ( SURFACE-AT ?auto_485417 ?auto_485419 ) ( ON ?auto_485417 ?auto_485423 ) ( CLEAR ?auto_485417 ) ( not ( = ?auto_485415 ?auto_485423 ) ) ( not ( = ?auto_485417 ?auto_485423 ) ) ( not ( = ?auto_485416 ?auto_485423 ) ) ( TRUCK-AT ?auto_485422 ?auto_485420 ) ( ON ?auto_485412 ?auto_485411 ) ( ON ?auto_485413 ?auto_485412 ) ( ON ?auto_485410 ?auto_485413 ) ( ON ?auto_485414 ?auto_485410 ) ( ON ?auto_485416 ?auto_485414 ) ( not ( = ?auto_485411 ?auto_485412 ) ) ( not ( = ?auto_485411 ?auto_485413 ) ) ( not ( = ?auto_485411 ?auto_485410 ) ) ( not ( = ?auto_485411 ?auto_485414 ) ) ( not ( = ?auto_485411 ?auto_485416 ) ) ( not ( = ?auto_485411 ?auto_485415 ) ) ( not ( = ?auto_485411 ?auto_485417 ) ) ( not ( = ?auto_485411 ?auto_485423 ) ) ( not ( = ?auto_485412 ?auto_485413 ) ) ( not ( = ?auto_485412 ?auto_485410 ) ) ( not ( = ?auto_485412 ?auto_485414 ) ) ( not ( = ?auto_485412 ?auto_485416 ) ) ( not ( = ?auto_485412 ?auto_485415 ) ) ( not ( = ?auto_485412 ?auto_485417 ) ) ( not ( = ?auto_485412 ?auto_485423 ) ) ( not ( = ?auto_485413 ?auto_485410 ) ) ( not ( = ?auto_485413 ?auto_485414 ) ) ( not ( = ?auto_485413 ?auto_485416 ) ) ( not ( = ?auto_485413 ?auto_485415 ) ) ( not ( = ?auto_485413 ?auto_485417 ) ) ( not ( = ?auto_485413 ?auto_485423 ) ) ( not ( = ?auto_485410 ?auto_485414 ) ) ( not ( = ?auto_485410 ?auto_485416 ) ) ( not ( = ?auto_485410 ?auto_485415 ) ) ( not ( = ?auto_485410 ?auto_485417 ) ) ( not ( = ?auto_485410 ?auto_485423 ) ) ( not ( = ?auto_485414 ?auto_485416 ) ) ( not ( = ?auto_485414 ?auto_485415 ) ) ( not ( = ?auto_485414 ?auto_485417 ) ) ( not ( = ?auto_485414 ?auto_485423 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_485416 ?auto_485415 ?auto_485417 )
      ( MAKE-7CRATE-VERIFY ?auto_485411 ?auto_485412 ?auto_485413 ?auto_485410 ?auto_485414 ?auto_485416 ?auto_485415 ?auto_485417 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_485489 - SURFACE
      ?auto_485490 - SURFACE
      ?auto_485491 - SURFACE
      ?auto_485488 - SURFACE
      ?auto_485492 - SURFACE
      ?auto_485494 - SURFACE
      ?auto_485493 - SURFACE
      ?auto_485495 - SURFACE
    )
    :vars
    (
      ?auto_485499 - HOIST
      ?auto_485496 - PLACE
      ?auto_485498 - PLACE
      ?auto_485500 - HOIST
      ?auto_485501 - SURFACE
      ?auto_485497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_485499 ?auto_485496 ) ( IS-CRATE ?auto_485495 ) ( not ( = ?auto_485493 ?auto_485495 ) ) ( not ( = ?auto_485494 ?auto_485493 ) ) ( not ( = ?auto_485494 ?auto_485495 ) ) ( not ( = ?auto_485498 ?auto_485496 ) ) ( HOIST-AT ?auto_485500 ?auto_485498 ) ( not ( = ?auto_485499 ?auto_485500 ) ) ( AVAILABLE ?auto_485500 ) ( SURFACE-AT ?auto_485495 ?auto_485498 ) ( ON ?auto_485495 ?auto_485501 ) ( CLEAR ?auto_485495 ) ( not ( = ?auto_485493 ?auto_485501 ) ) ( not ( = ?auto_485495 ?auto_485501 ) ) ( not ( = ?auto_485494 ?auto_485501 ) ) ( TRUCK-AT ?auto_485497 ?auto_485496 ) ( SURFACE-AT ?auto_485494 ?auto_485496 ) ( CLEAR ?auto_485494 ) ( LIFTING ?auto_485499 ?auto_485493 ) ( IS-CRATE ?auto_485493 ) ( ON ?auto_485490 ?auto_485489 ) ( ON ?auto_485491 ?auto_485490 ) ( ON ?auto_485488 ?auto_485491 ) ( ON ?auto_485492 ?auto_485488 ) ( ON ?auto_485494 ?auto_485492 ) ( not ( = ?auto_485489 ?auto_485490 ) ) ( not ( = ?auto_485489 ?auto_485491 ) ) ( not ( = ?auto_485489 ?auto_485488 ) ) ( not ( = ?auto_485489 ?auto_485492 ) ) ( not ( = ?auto_485489 ?auto_485494 ) ) ( not ( = ?auto_485489 ?auto_485493 ) ) ( not ( = ?auto_485489 ?auto_485495 ) ) ( not ( = ?auto_485489 ?auto_485501 ) ) ( not ( = ?auto_485490 ?auto_485491 ) ) ( not ( = ?auto_485490 ?auto_485488 ) ) ( not ( = ?auto_485490 ?auto_485492 ) ) ( not ( = ?auto_485490 ?auto_485494 ) ) ( not ( = ?auto_485490 ?auto_485493 ) ) ( not ( = ?auto_485490 ?auto_485495 ) ) ( not ( = ?auto_485490 ?auto_485501 ) ) ( not ( = ?auto_485491 ?auto_485488 ) ) ( not ( = ?auto_485491 ?auto_485492 ) ) ( not ( = ?auto_485491 ?auto_485494 ) ) ( not ( = ?auto_485491 ?auto_485493 ) ) ( not ( = ?auto_485491 ?auto_485495 ) ) ( not ( = ?auto_485491 ?auto_485501 ) ) ( not ( = ?auto_485488 ?auto_485492 ) ) ( not ( = ?auto_485488 ?auto_485494 ) ) ( not ( = ?auto_485488 ?auto_485493 ) ) ( not ( = ?auto_485488 ?auto_485495 ) ) ( not ( = ?auto_485488 ?auto_485501 ) ) ( not ( = ?auto_485492 ?auto_485494 ) ) ( not ( = ?auto_485492 ?auto_485493 ) ) ( not ( = ?auto_485492 ?auto_485495 ) ) ( not ( = ?auto_485492 ?auto_485501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_485494 ?auto_485493 ?auto_485495 )
      ( MAKE-7CRATE-VERIFY ?auto_485489 ?auto_485490 ?auto_485491 ?auto_485488 ?auto_485492 ?auto_485494 ?auto_485493 ?auto_485495 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_485567 - SURFACE
      ?auto_485568 - SURFACE
      ?auto_485569 - SURFACE
      ?auto_485566 - SURFACE
      ?auto_485570 - SURFACE
      ?auto_485572 - SURFACE
      ?auto_485571 - SURFACE
      ?auto_485573 - SURFACE
    )
    :vars
    (
      ?auto_485575 - HOIST
      ?auto_485576 - PLACE
      ?auto_485574 - PLACE
      ?auto_485578 - HOIST
      ?auto_485579 - SURFACE
      ?auto_485577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_485575 ?auto_485576 ) ( IS-CRATE ?auto_485573 ) ( not ( = ?auto_485571 ?auto_485573 ) ) ( not ( = ?auto_485572 ?auto_485571 ) ) ( not ( = ?auto_485572 ?auto_485573 ) ) ( not ( = ?auto_485574 ?auto_485576 ) ) ( HOIST-AT ?auto_485578 ?auto_485574 ) ( not ( = ?auto_485575 ?auto_485578 ) ) ( AVAILABLE ?auto_485578 ) ( SURFACE-AT ?auto_485573 ?auto_485574 ) ( ON ?auto_485573 ?auto_485579 ) ( CLEAR ?auto_485573 ) ( not ( = ?auto_485571 ?auto_485579 ) ) ( not ( = ?auto_485573 ?auto_485579 ) ) ( not ( = ?auto_485572 ?auto_485579 ) ) ( TRUCK-AT ?auto_485577 ?auto_485576 ) ( SURFACE-AT ?auto_485572 ?auto_485576 ) ( CLEAR ?auto_485572 ) ( IS-CRATE ?auto_485571 ) ( AVAILABLE ?auto_485575 ) ( IN ?auto_485571 ?auto_485577 ) ( ON ?auto_485568 ?auto_485567 ) ( ON ?auto_485569 ?auto_485568 ) ( ON ?auto_485566 ?auto_485569 ) ( ON ?auto_485570 ?auto_485566 ) ( ON ?auto_485572 ?auto_485570 ) ( not ( = ?auto_485567 ?auto_485568 ) ) ( not ( = ?auto_485567 ?auto_485569 ) ) ( not ( = ?auto_485567 ?auto_485566 ) ) ( not ( = ?auto_485567 ?auto_485570 ) ) ( not ( = ?auto_485567 ?auto_485572 ) ) ( not ( = ?auto_485567 ?auto_485571 ) ) ( not ( = ?auto_485567 ?auto_485573 ) ) ( not ( = ?auto_485567 ?auto_485579 ) ) ( not ( = ?auto_485568 ?auto_485569 ) ) ( not ( = ?auto_485568 ?auto_485566 ) ) ( not ( = ?auto_485568 ?auto_485570 ) ) ( not ( = ?auto_485568 ?auto_485572 ) ) ( not ( = ?auto_485568 ?auto_485571 ) ) ( not ( = ?auto_485568 ?auto_485573 ) ) ( not ( = ?auto_485568 ?auto_485579 ) ) ( not ( = ?auto_485569 ?auto_485566 ) ) ( not ( = ?auto_485569 ?auto_485570 ) ) ( not ( = ?auto_485569 ?auto_485572 ) ) ( not ( = ?auto_485569 ?auto_485571 ) ) ( not ( = ?auto_485569 ?auto_485573 ) ) ( not ( = ?auto_485569 ?auto_485579 ) ) ( not ( = ?auto_485566 ?auto_485570 ) ) ( not ( = ?auto_485566 ?auto_485572 ) ) ( not ( = ?auto_485566 ?auto_485571 ) ) ( not ( = ?auto_485566 ?auto_485573 ) ) ( not ( = ?auto_485566 ?auto_485579 ) ) ( not ( = ?auto_485570 ?auto_485572 ) ) ( not ( = ?auto_485570 ?auto_485571 ) ) ( not ( = ?auto_485570 ?auto_485573 ) ) ( not ( = ?auto_485570 ?auto_485579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_485572 ?auto_485571 ?auto_485573 )
      ( MAKE-7CRATE-VERIFY ?auto_485567 ?auto_485568 ?auto_485569 ?auto_485566 ?auto_485570 ?auto_485572 ?auto_485571 ?auto_485573 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_488471 - SURFACE
      ?auto_488472 - SURFACE
      ?auto_488473 - SURFACE
      ?auto_488470 - SURFACE
      ?auto_488474 - SURFACE
      ?auto_488476 - SURFACE
      ?auto_488475 - SURFACE
      ?auto_488477 - SURFACE
      ?auto_488478 - SURFACE
    )
    :vars
    (
      ?auto_488480 - HOIST
      ?auto_488479 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_488480 ?auto_488479 ) ( SURFACE-AT ?auto_488477 ?auto_488479 ) ( CLEAR ?auto_488477 ) ( LIFTING ?auto_488480 ?auto_488478 ) ( IS-CRATE ?auto_488478 ) ( not ( = ?auto_488477 ?auto_488478 ) ) ( ON ?auto_488472 ?auto_488471 ) ( ON ?auto_488473 ?auto_488472 ) ( ON ?auto_488470 ?auto_488473 ) ( ON ?auto_488474 ?auto_488470 ) ( ON ?auto_488476 ?auto_488474 ) ( ON ?auto_488475 ?auto_488476 ) ( ON ?auto_488477 ?auto_488475 ) ( not ( = ?auto_488471 ?auto_488472 ) ) ( not ( = ?auto_488471 ?auto_488473 ) ) ( not ( = ?auto_488471 ?auto_488470 ) ) ( not ( = ?auto_488471 ?auto_488474 ) ) ( not ( = ?auto_488471 ?auto_488476 ) ) ( not ( = ?auto_488471 ?auto_488475 ) ) ( not ( = ?auto_488471 ?auto_488477 ) ) ( not ( = ?auto_488471 ?auto_488478 ) ) ( not ( = ?auto_488472 ?auto_488473 ) ) ( not ( = ?auto_488472 ?auto_488470 ) ) ( not ( = ?auto_488472 ?auto_488474 ) ) ( not ( = ?auto_488472 ?auto_488476 ) ) ( not ( = ?auto_488472 ?auto_488475 ) ) ( not ( = ?auto_488472 ?auto_488477 ) ) ( not ( = ?auto_488472 ?auto_488478 ) ) ( not ( = ?auto_488473 ?auto_488470 ) ) ( not ( = ?auto_488473 ?auto_488474 ) ) ( not ( = ?auto_488473 ?auto_488476 ) ) ( not ( = ?auto_488473 ?auto_488475 ) ) ( not ( = ?auto_488473 ?auto_488477 ) ) ( not ( = ?auto_488473 ?auto_488478 ) ) ( not ( = ?auto_488470 ?auto_488474 ) ) ( not ( = ?auto_488470 ?auto_488476 ) ) ( not ( = ?auto_488470 ?auto_488475 ) ) ( not ( = ?auto_488470 ?auto_488477 ) ) ( not ( = ?auto_488470 ?auto_488478 ) ) ( not ( = ?auto_488474 ?auto_488476 ) ) ( not ( = ?auto_488474 ?auto_488475 ) ) ( not ( = ?auto_488474 ?auto_488477 ) ) ( not ( = ?auto_488474 ?auto_488478 ) ) ( not ( = ?auto_488476 ?auto_488475 ) ) ( not ( = ?auto_488476 ?auto_488477 ) ) ( not ( = ?auto_488476 ?auto_488478 ) ) ( not ( = ?auto_488475 ?auto_488477 ) ) ( not ( = ?auto_488475 ?auto_488478 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_488477 ?auto_488478 )
      ( MAKE-8CRATE-VERIFY ?auto_488471 ?auto_488472 ?auto_488473 ?auto_488470 ?auto_488474 ?auto_488476 ?auto_488475 ?auto_488477 ?auto_488478 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_488538 - SURFACE
      ?auto_488539 - SURFACE
      ?auto_488540 - SURFACE
      ?auto_488537 - SURFACE
      ?auto_488541 - SURFACE
      ?auto_488543 - SURFACE
      ?auto_488542 - SURFACE
      ?auto_488544 - SURFACE
      ?auto_488545 - SURFACE
    )
    :vars
    (
      ?auto_488547 - HOIST
      ?auto_488546 - PLACE
      ?auto_488548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_488547 ?auto_488546 ) ( SURFACE-AT ?auto_488544 ?auto_488546 ) ( CLEAR ?auto_488544 ) ( IS-CRATE ?auto_488545 ) ( not ( = ?auto_488544 ?auto_488545 ) ) ( TRUCK-AT ?auto_488548 ?auto_488546 ) ( AVAILABLE ?auto_488547 ) ( IN ?auto_488545 ?auto_488548 ) ( ON ?auto_488544 ?auto_488542 ) ( not ( = ?auto_488542 ?auto_488544 ) ) ( not ( = ?auto_488542 ?auto_488545 ) ) ( ON ?auto_488539 ?auto_488538 ) ( ON ?auto_488540 ?auto_488539 ) ( ON ?auto_488537 ?auto_488540 ) ( ON ?auto_488541 ?auto_488537 ) ( ON ?auto_488543 ?auto_488541 ) ( ON ?auto_488542 ?auto_488543 ) ( not ( = ?auto_488538 ?auto_488539 ) ) ( not ( = ?auto_488538 ?auto_488540 ) ) ( not ( = ?auto_488538 ?auto_488537 ) ) ( not ( = ?auto_488538 ?auto_488541 ) ) ( not ( = ?auto_488538 ?auto_488543 ) ) ( not ( = ?auto_488538 ?auto_488542 ) ) ( not ( = ?auto_488538 ?auto_488544 ) ) ( not ( = ?auto_488538 ?auto_488545 ) ) ( not ( = ?auto_488539 ?auto_488540 ) ) ( not ( = ?auto_488539 ?auto_488537 ) ) ( not ( = ?auto_488539 ?auto_488541 ) ) ( not ( = ?auto_488539 ?auto_488543 ) ) ( not ( = ?auto_488539 ?auto_488542 ) ) ( not ( = ?auto_488539 ?auto_488544 ) ) ( not ( = ?auto_488539 ?auto_488545 ) ) ( not ( = ?auto_488540 ?auto_488537 ) ) ( not ( = ?auto_488540 ?auto_488541 ) ) ( not ( = ?auto_488540 ?auto_488543 ) ) ( not ( = ?auto_488540 ?auto_488542 ) ) ( not ( = ?auto_488540 ?auto_488544 ) ) ( not ( = ?auto_488540 ?auto_488545 ) ) ( not ( = ?auto_488537 ?auto_488541 ) ) ( not ( = ?auto_488537 ?auto_488543 ) ) ( not ( = ?auto_488537 ?auto_488542 ) ) ( not ( = ?auto_488537 ?auto_488544 ) ) ( not ( = ?auto_488537 ?auto_488545 ) ) ( not ( = ?auto_488541 ?auto_488543 ) ) ( not ( = ?auto_488541 ?auto_488542 ) ) ( not ( = ?auto_488541 ?auto_488544 ) ) ( not ( = ?auto_488541 ?auto_488545 ) ) ( not ( = ?auto_488543 ?auto_488542 ) ) ( not ( = ?auto_488543 ?auto_488544 ) ) ( not ( = ?auto_488543 ?auto_488545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_488542 ?auto_488544 ?auto_488545 )
      ( MAKE-8CRATE-VERIFY ?auto_488538 ?auto_488539 ?auto_488540 ?auto_488537 ?auto_488541 ?auto_488543 ?auto_488542 ?auto_488544 ?auto_488545 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_488614 - SURFACE
      ?auto_488615 - SURFACE
      ?auto_488616 - SURFACE
      ?auto_488613 - SURFACE
      ?auto_488617 - SURFACE
      ?auto_488619 - SURFACE
      ?auto_488618 - SURFACE
      ?auto_488620 - SURFACE
      ?auto_488621 - SURFACE
    )
    :vars
    (
      ?auto_488622 - HOIST
      ?auto_488624 - PLACE
      ?auto_488625 - TRUCK
      ?auto_488623 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_488622 ?auto_488624 ) ( SURFACE-AT ?auto_488620 ?auto_488624 ) ( CLEAR ?auto_488620 ) ( IS-CRATE ?auto_488621 ) ( not ( = ?auto_488620 ?auto_488621 ) ) ( AVAILABLE ?auto_488622 ) ( IN ?auto_488621 ?auto_488625 ) ( ON ?auto_488620 ?auto_488618 ) ( not ( = ?auto_488618 ?auto_488620 ) ) ( not ( = ?auto_488618 ?auto_488621 ) ) ( TRUCK-AT ?auto_488625 ?auto_488623 ) ( not ( = ?auto_488623 ?auto_488624 ) ) ( ON ?auto_488615 ?auto_488614 ) ( ON ?auto_488616 ?auto_488615 ) ( ON ?auto_488613 ?auto_488616 ) ( ON ?auto_488617 ?auto_488613 ) ( ON ?auto_488619 ?auto_488617 ) ( ON ?auto_488618 ?auto_488619 ) ( not ( = ?auto_488614 ?auto_488615 ) ) ( not ( = ?auto_488614 ?auto_488616 ) ) ( not ( = ?auto_488614 ?auto_488613 ) ) ( not ( = ?auto_488614 ?auto_488617 ) ) ( not ( = ?auto_488614 ?auto_488619 ) ) ( not ( = ?auto_488614 ?auto_488618 ) ) ( not ( = ?auto_488614 ?auto_488620 ) ) ( not ( = ?auto_488614 ?auto_488621 ) ) ( not ( = ?auto_488615 ?auto_488616 ) ) ( not ( = ?auto_488615 ?auto_488613 ) ) ( not ( = ?auto_488615 ?auto_488617 ) ) ( not ( = ?auto_488615 ?auto_488619 ) ) ( not ( = ?auto_488615 ?auto_488618 ) ) ( not ( = ?auto_488615 ?auto_488620 ) ) ( not ( = ?auto_488615 ?auto_488621 ) ) ( not ( = ?auto_488616 ?auto_488613 ) ) ( not ( = ?auto_488616 ?auto_488617 ) ) ( not ( = ?auto_488616 ?auto_488619 ) ) ( not ( = ?auto_488616 ?auto_488618 ) ) ( not ( = ?auto_488616 ?auto_488620 ) ) ( not ( = ?auto_488616 ?auto_488621 ) ) ( not ( = ?auto_488613 ?auto_488617 ) ) ( not ( = ?auto_488613 ?auto_488619 ) ) ( not ( = ?auto_488613 ?auto_488618 ) ) ( not ( = ?auto_488613 ?auto_488620 ) ) ( not ( = ?auto_488613 ?auto_488621 ) ) ( not ( = ?auto_488617 ?auto_488619 ) ) ( not ( = ?auto_488617 ?auto_488618 ) ) ( not ( = ?auto_488617 ?auto_488620 ) ) ( not ( = ?auto_488617 ?auto_488621 ) ) ( not ( = ?auto_488619 ?auto_488618 ) ) ( not ( = ?auto_488619 ?auto_488620 ) ) ( not ( = ?auto_488619 ?auto_488621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_488618 ?auto_488620 ?auto_488621 )
      ( MAKE-8CRATE-VERIFY ?auto_488614 ?auto_488615 ?auto_488616 ?auto_488613 ?auto_488617 ?auto_488619 ?auto_488618 ?auto_488620 ?auto_488621 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_488698 - SURFACE
      ?auto_488699 - SURFACE
      ?auto_488700 - SURFACE
      ?auto_488697 - SURFACE
      ?auto_488701 - SURFACE
      ?auto_488703 - SURFACE
      ?auto_488702 - SURFACE
      ?auto_488704 - SURFACE
      ?auto_488705 - SURFACE
    )
    :vars
    (
      ?auto_488706 - HOIST
      ?auto_488709 - PLACE
      ?auto_488708 - TRUCK
      ?auto_488707 - PLACE
      ?auto_488710 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_488706 ?auto_488709 ) ( SURFACE-AT ?auto_488704 ?auto_488709 ) ( CLEAR ?auto_488704 ) ( IS-CRATE ?auto_488705 ) ( not ( = ?auto_488704 ?auto_488705 ) ) ( AVAILABLE ?auto_488706 ) ( ON ?auto_488704 ?auto_488702 ) ( not ( = ?auto_488702 ?auto_488704 ) ) ( not ( = ?auto_488702 ?auto_488705 ) ) ( TRUCK-AT ?auto_488708 ?auto_488707 ) ( not ( = ?auto_488707 ?auto_488709 ) ) ( HOIST-AT ?auto_488710 ?auto_488707 ) ( LIFTING ?auto_488710 ?auto_488705 ) ( not ( = ?auto_488706 ?auto_488710 ) ) ( ON ?auto_488699 ?auto_488698 ) ( ON ?auto_488700 ?auto_488699 ) ( ON ?auto_488697 ?auto_488700 ) ( ON ?auto_488701 ?auto_488697 ) ( ON ?auto_488703 ?auto_488701 ) ( ON ?auto_488702 ?auto_488703 ) ( not ( = ?auto_488698 ?auto_488699 ) ) ( not ( = ?auto_488698 ?auto_488700 ) ) ( not ( = ?auto_488698 ?auto_488697 ) ) ( not ( = ?auto_488698 ?auto_488701 ) ) ( not ( = ?auto_488698 ?auto_488703 ) ) ( not ( = ?auto_488698 ?auto_488702 ) ) ( not ( = ?auto_488698 ?auto_488704 ) ) ( not ( = ?auto_488698 ?auto_488705 ) ) ( not ( = ?auto_488699 ?auto_488700 ) ) ( not ( = ?auto_488699 ?auto_488697 ) ) ( not ( = ?auto_488699 ?auto_488701 ) ) ( not ( = ?auto_488699 ?auto_488703 ) ) ( not ( = ?auto_488699 ?auto_488702 ) ) ( not ( = ?auto_488699 ?auto_488704 ) ) ( not ( = ?auto_488699 ?auto_488705 ) ) ( not ( = ?auto_488700 ?auto_488697 ) ) ( not ( = ?auto_488700 ?auto_488701 ) ) ( not ( = ?auto_488700 ?auto_488703 ) ) ( not ( = ?auto_488700 ?auto_488702 ) ) ( not ( = ?auto_488700 ?auto_488704 ) ) ( not ( = ?auto_488700 ?auto_488705 ) ) ( not ( = ?auto_488697 ?auto_488701 ) ) ( not ( = ?auto_488697 ?auto_488703 ) ) ( not ( = ?auto_488697 ?auto_488702 ) ) ( not ( = ?auto_488697 ?auto_488704 ) ) ( not ( = ?auto_488697 ?auto_488705 ) ) ( not ( = ?auto_488701 ?auto_488703 ) ) ( not ( = ?auto_488701 ?auto_488702 ) ) ( not ( = ?auto_488701 ?auto_488704 ) ) ( not ( = ?auto_488701 ?auto_488705 ) ) ( not ( = ?auto_488703 ?auto_488702 ) ) ( not ( = ?auto_488703 ?auto_488704 ) ) ( not ( = ?auto_488703 ?auto_488705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_488702 ?auto_488704 ?auto_488705 )
      ( MAKE-8CRATE-VERIFY ?auto_488698 ?auto_488699 ?auto_488700 ?auto_488697 ?auto_488701 ?auto_488703 ?auto_488702 ?auto_488704 ?auto_488705 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_488790 - SURFACE
      ?auto_488791 - SURFACE
      ?auto_488792 - SURFACE
      ?auto_488789 - SURFACE
      ?auto_488793 - SURFACE
      ?auto_488795 - SURFACE
      ?auto_488794 - SURFACE
      ?auto_488796 - SURFACE
      ?auto_488797 - SURFACE
    )
    :vars
    (
      ?auto_488802 - HOIST
      ?auto_488800 - PLACE
      ?auto_488801 - TRUCK
      ?auto_488798 - PLACE
      ?auto_488803 - HOIST
      ?auto_488799 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_488802 ?auto_488800 ) ( SURFACE-AT ?auto_488796 ?auto_488800 ) ( CLEAR ?auto_488796 ) ( IS-CRATE ?auto_488797 ) ( not ( = ?auto_488796 ?auto_488797 ) ) ( AVAILABLE ?auto_488802 ) ( ON ?auto_488796 ?auto_488794 ) ( not ( = ?auto_488794 ?auto_488796 ) ) ( not ( = ?auto_488794 ?auto_488797 ) ) ( TRUCK-AT ?auto_488801 ?auto_488798 ) ( not ( = ?auto_488798 ?auto_488800 ) ) ( HOIST-AT ?auto_488803 ?auto_488798 ) ( not ( = ?auto_488802 ?auto_488803 ) ) ( AVAILABLE ?auto_488803 ) ( SURFACE-AT ?auto_488797 ?auto_488798 ) ( ON ?auto_488797 ?auto_488799 ) ( CLEAR ?auto_488797 ) ( not ( = ?auto_488796 ?auto_488799 ) ) ( not ( = ?auto_488797 ?auto_488799 ) ) ( not ( = ?auto_488794 ?auto_488799 ) ) ( ON ?auto_488791 ?auto_488790 ) ( ON ?auto_488792 ?auto_488791 ) ( ON ?auto_488789 ?auto_488792 ) ( ON ?auto_488793 ?auto_488789 ) ( ON ?auto_488795 ?auto_488793 ) ( ON ?auto_488794 ?auto_488795 ) ( not ( = ?auto_488790 ?auto_488791 ) ) ( not ( = ?auto_488790 ?auto_488792 ) ) ( not ( = ?auto_488790 ?auto_488789 ) ) ( not ( = ?auto_488790 ?auto_488793 ) ) ( not ( = ?auto_488790 ?auto_488795 ) ) ( not ( = ?auto_488790 ?auto_488794 ) ) ( not ( = ?auto_488790 ?auto_488796 ) ) ( not ( = ?auto_488790 ?auto_488797 ) ) ( not ( = ?auto_488790 ?auto_488799 ) ) ( not ( = ?auto_488791 ?auto_488792 ) ) ( not ( = ?auto_488791 ?auto_488789 ) ) ( not ( = ?auto_488791 ?auto_488793 ) ) ( not ( = ?auto_488791 ?auto_488795 ) ) ( not ( = ?auto_488791 ?auto_488794 ) ) ( not ( = ?auto_488791 ?auto_488796 ) ) ( not ( = ?auto_488791 ?auto_488797 ) ) ( not ( = ?auto_488791 ?auto_488799 ) ) ( not ( = ?auto_488792 ?auto_488789 ) ) ( not ( = ?auto_488792 ?auto_488793 ) ) ( not ( = ?auto_488792 ?auto_488795 ) ) ( not ( = ?auto_488792 ?auto_488794 ) ) ( not ( = ?auto_488792 ?auto_488796 ) ) ( not ( = ?auto_488792 ?auto_488797 ) ) ( not ( = ?auto_488792 ?auto_488799 ) ) ( not ( = ?auto_488789 ?auto_488793 ) ) ( not ( = ?auto_488789 ?auto_488795 ) ) ( not ( = ?auto_488789 ?auto_488794 ) ) ( not ( = ?auto_488789 ?auto_488796 ) ) ( not ( = ?auto_488789 ?auto_488797 ) ) ( not ( = ?auto_488789 ?auto_488799 ) ) ( not ( = ?auto_488793 ?auto_488795 ) ) ( not ( = ?auto_488793 ?auto_488794 ) ) ( not ( = ?auto_488793 ?auto_488796 ) ) ( not ( = ?auto_488793 ?auto_488797 ) ) ( not ( = ?auto_488793 ?auto_488799 ) ) ( not ( = ?auto_488795 ?auto_488794 ) ) ( not ( = ?auto_488795 ?auto_488796 ) ) ( not ( = ?auto_488795 ?auto_488797 ) ) ( not ( = ?auto_488795 ?auto_488799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_488794 ?auto_488796 ?auto_488797 )
      ( MAKE-8CRATE-VERIFY ?auto_488790 ?auto_488791 ?auto_488792 ?auto_488789 ?auto_488793 ?auto_488795 ?auto_488794 ?auto_488796 ?auto_488797 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_488883 - SURFACE
      ?auto_488884 - SURFACE
      ?auto_488885 - SURFACE
      ?auto_488882 - SURFACE
      ?auto_488886 - SURFACE
      ?auto_488888 - SURFACE
      ?auto_488887 - SURFACE
      ?auto_488889 - SURFACE
      ?auto_488890 - SURFACE
    )
    :vars
    (
      ?auto_488891 - HOIST
      ?auto_488896 - PLACE
      ?auto_488895 - PLACE
      ?auto_488892 - HOIST
      ?auto_488893 - SURFACE
      ?auto_488894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_488891 ?auto_488896 ) ( SURFACE-AT ?auto_488889 ?auto_488896 ) ( CLEAR ?auto_488889 ) ( IS-CRATE ?auto_488890 ) ( not ( = ?auto_488889 ?auto_488890 ) ) ( AVAILABLE ?auto_488891 ) ( ON ?auto_488889 ?auto_488887 ) ( not ( = ?auto_488887 ?auto_488889 ) ) ( not ( = ?auto_488887 ?auto_488890 ) ) ( not ( = ?auto_488895 ?auto_488896 ) ) ( HOIST-AT ?auto_488892 ?auto_488895 ) ( not ( = ?auto_488891 ?auto_488892 ) ) ( AVAILABLE ?auto_488892 ) ( SURFACE-AT ?auto_488890 ?auto_488895 ) ( ON ?auto_488890 ?auto_488893 ) ( CLEAR ?auto_488890 ) ( not ( = ?auto_488889 ?auto_488893 ) ) ( not ( = ?auto_488890 ?auto_488893 ) ) ( not ( = ?auto_488887 ?auto_488893 ) ) ( TRUCK-AT ?auto_488894 ?auto_488896 ) ( ON ?auto_488884 ?auto_488883 ) ( ON ?auto_488885 ?auto_488884 ) ( ON ?auto_488882 ?auto_488885 ) ( ON ?auto_488886 ?auto_488882 ) ( ON ?auto_488888 ?auto_488886 ) ( ON ?auto_488887 ?auto_488888 ) ( not ( = ?auto_488883 ?auto_488884 ) ) ( not ( = ?auto_488883 ?auto_488885 ) ) ( not ( = ?auto_488883 ?auto_488882 ) ) ( not ( = ?auto_488883 ?auto_488886 ) ) ( not ( = ?auto_488883 ?auto_488888 ) ) ( not ( = ?auto_488883 ?auto_488887 ) ) ( not ( = ?auto_488883 ?auto_488889 ) ) ( not ( = ?auto_488883 ?auto_488890 ) ) ( not ( = ?auto_488883 ?auto_488893 ) ) ( not ( = ?auto_488884 ?auto_488885 ) ) ( not ( = ?auto_488884 ?auto_488882 ) ) ( not ( = ?auto_488884 ?auto_488886 ) ) ( not ( = ?auto_488884 ?auto_488888 ) ) ( not ( = ?auto_488884 ?auto_488887 ) ) ( not ( = ?auto_488884 ?auto_488889 ) ) ( not ( = ?auto_488884 ?auto_488890 ) ) ( not ( = ?auto_488884 ?auto_488893 ) ) ( not ( = ?auto_488885 ?auto_488882 ) ) ( not ( = ?auto_488885 ?auto_488886 ) ) ( not ( = ?auto_488885 ?auto_488888 ) ) ( not ( = ?auto_488885 ?auto_488887 ) ) ( not ( = ?auto_488885 ?auto_488889 ) ) ( not ( = ?auto_488885 ?auto_488890 ) ) ( not ( = ?auto_488885 ?auto_488893 ) ) ( not ( = ?auto_488882 ?auto_488886 ) ) ( not ( = ?auto_488882 ?auto_488888 ) ) ( not ( = ?auto_488882 ?auto_488887 ) ) ( not ( = ?auto_488882 ?auto_488889 ) ) ( not ( = ?auto_488882 ?auto_488890 ) ) ( not ( = ?auto_488882 ?auto_488893 ) ) ( not ( = ?auto_488886 ?auto_488888 ) ) ( not ( = ?auto_488886 ?auto_488887 ) ) ( not ( = ?auto_488886 ?auto_488889 ) ) ( not ( = ?auto_488886 ?auto_488890 ) ) ( not ( = ?auto_488886 ?auto_488893 ) ) ( not ( = ?auto_488888 ?auto_488887 ) ) ( not ( = ?auto_488888 ?auto_488889 ) ) ( not ( = ?auto_488888 ?auto_488890 ) ) ( not ( = ?auto_488888 ?auto_488893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_488887 ?auto_488889 ?auto_488890 )
      ( MAKE-8CRATE-VERIFY ?auto_488883 ?auto_488884 ?auto_488885 ?auto_488882 ?auto_488886 ?auto_488888 ?auto_488887 ?auto_488889 ?auto_488890 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_488976 - SURFACE
      ?auto_488977 - SURFACE
      ?auto_488978 - SURFACE
      ?auto_488975 - SURFACE
      ?auto_488979 - SURFACE
      ?auto_488981 - SURFACE
      ?auto_488980 - SURFACE
      ?auto_488982 - SURFACE
      ?auto_488983 - SURFACE
    )
    :vars
    (
      ?auto_488989 - HOIST
      ?auto_488987 - PLACE
      ?auto_488986 - PLACE
      ?auto_488988 - HOIST
      ?auto_488985 - SURFACE
      ?auto_488984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_488989 ?auto_488987 ) ( IS-CRATE ?auto_488983 ) ( not ( = ?auto_488982 ?auto_488983 ) ) ( not ( = ?auto_488980 ?auto_488982 ) ) ( not ( = ?auto_488980 ?auto_488983 ) ) ( not ( = ?auto_488986 ?auto_488987 ) ) ( HOIST-AT ?auto_488988 ?auto_488986 ) ( not ( = ?auto_488989 ?auto_488988 ) ) ( AVAILABLE ?auto_488988 ) ( SURFACE-AT ?auto_488983 ?auto_488986 ) ( ON ?auto_488983 ?auto_488985 ) ( CLEAR ?auto_488983 ) ( not ( = ?auto_488982 ?auto_488985 ) ) ( not ( = ?auto_488983 ?auto_488985 ) ) ( not ( = ?auto_488980 ?auto_488985 ) ) ( TRUCK-AT ?auto_488984 ?auto_488987 ) ( SURFACE-AT ?auto_488980 ?auto_488987 ) ( CLEAR ?auto_488980 ) ( LIFTING ?auto_488989 ?auto_488982 ) ( IS-CRATE ?auto_488982 ) ( ON ?auto_488977 ?auto_488976 ) ( ON ?auto_488978 ?auto_488977 ) ( ON ?auto_488975 ?auto_488978 ) ( ON ?auto_488979 ?auto_488975 ) ( ON ?auto_488981 ?auto_488979 ) ( ON ?auto_488980 ?auto_488981 ) ( not ( = ?auto_488976 ?auto_488977 ) ) ( not ( = ?auto_488976 ?auto_488978 ) ) ( not ( = ?auto_488976 ?auto_488975 ) ) ( not ( = ?auto_488976 ?auto_488979 ) ) ( not ( = ?auto_488976 ?auto_488981 ) ) ( not ( = ?auto_488976 ?auto_488980 ) ) ( not ( = ?auto_488976 ?auto_488982 ) ) ( not ( = ?auto_488976 ?auto_488983 ) ) ( not ( = ?auto_488976 ?auto_488985 ) ) ( not ( = ?auto_488977 ?auto_488978 ) ) ( not ( = ?auto_488977 ?auto_488975 ) ) ( not ( = ?auto_488977 ?auto_488979 ) ) ( not ( = ?auto_488977 ?auto_488981 ) ) ( not ( = ?auto_488977 ?auto_488980 ) ) ( not ( = ?auto_488977 ?auto_488982 ) ) ( not ( = ?auto_488977 ?auto_488983 ) ) ( not ( = ?auto_488977 ?auto_488985 ) ) ( not ( = ?auto_488978 ?auto_488975 ) ) ( not ( = ?auto_488978 ?auto_488979 ) ) ( not ( = ?auto_488978 ?auto_488981 ) ) ( not ( = ?auto_488978 ?auto_488980 ) ) ( not ( = ?auto_488978 ?auto_488982 ) ) ( not ( = ?auto_488978 ?auto_488983 ) ) ( not ( = ?auto_488978 ?auto_488985 ) ) ( not ( = ?auto_488975 ?auto_488979 ) ) ( not ( = ?auto_488975 ?auto_488981 ) ) ( not ( = ?auto_488975 ?auto_488980 ) ) ( not ( = ?auto_488975 ?auto_488982 ) ) ( not ( = ?auto_488975 ?auto_488983 ) ) ( not ( = ?auto_488975 ?auto_488985 ) ) ( not ( = ?auto_488979 ?auto_488981 ) ) ( not ( = ?auto_488979 ?auto_488980 ) ) ( not ( = ?auto_488979 ?auto_488982 ) ) ( not ( = ?auto_488979 ?auto_488983 ) ) ( not ( = ?auto_488979 ?auto_488985 ) ) ( not ( = ?auto_488981 ?auto_488980 ) ) ( not ( = ?auto_488981 ?auto_488982 ) ) ( not ( = ?auto_488981 ?auto_488983 ) ) ( not ( = ?auto_488981 ?auto_488985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_488980 ?auto_488982 ?auto_488983 )
      ( MAKE-8CRATE-VERIFY ?auto_488976 ?auto_488977 ?auto_488978 ?auto_488975 ?auto_488979 ?auto_488981 ?auto_488980 ?auto_488982 ?auto_488983 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_489069 - SURFACE
      ?auto_489070 - SURFACE
      ?auto_489071 - SURFACE
      ?auto_489068 - SURFACE
      ?auto_489072 - SURFACE
      ?auto_489074 - SURFACE
      ?auto_489073 - SURFACE
      ?auto_489075 - SURFACE
      ?auto_489076 - SURFACE
    )
    :vars
    (
      ?auto_489080 - HOIST
      ?auto_489081 - PLACE
      ?auto_489079 - PLACE
      ?auto_489078 - HOIST
      ?auto_489082 - SURFACE
      ?auto_489077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_489080 ?auto_489081 ) ( IS-CRATE ?auto_489076 ) ( not ( = ?auto_489075 ?auto_489076 ) ) ( not ( = ?auto_489073 ?auto_489075 ) ) ( not ( = ?auto_489073 ?auto_489076 ) ) ( not ( = ?auto_489079 ?auto_489081 ) ) ( HOIST-AT ?auto_489078 ?auto_489079 ) ( not ( = ?auto_489080 ?auto_489078 ) ) ( AVAILABLE ?auto_489078 ) ( SURFACE-AT ?auto_489076 ?auto_489079 ) ( ON ?auto_489076 ?auto_489082 ) ( CLEAR ?auto_489076 ) ( not ( = ?auto_489075 ?auto_489082 ) ) ( not ( = ?auto_489076 ?auto_489082 ) ) ( not ( = ?auto_489073 ?auto_489082 ) ) ( TRUCK-AT ?auto_489077 ?auto_489081 ) ( SURFACE-AT ?auto_489073 ?auto_489081 ) ( CLEAR ?auto_489073 ) ( IS-CRATE ?auto_489075 ) ( AVAILABLE ?auto_489080 ) ( IN ?auto_489075 ?auto_489077 ) ( ON ?auto_489070 ?auto_489069 ) ( ON ?auto_489071 ?auto_489070 ) ( ON ?auto_489068 ?auto_489071 ) ( ON ?auto_489072 ?auto_489068 ) ( ON ?auto_489074 ?auto_489072 ) ( ON ?auto_489073 ?auto_489074 ) ( not ( = ?auto_489069 ?auto_489070 ) ) ( not ( = ?auto_489069 ?auto_489071 ) ) ( not ( = ?auto_489069 ?auto_489068 ) ) ( not ( = ?auto_489069 ?auto_489072 ) ) ( not ( = ?auto_489069 ?auto_489074 ) ) ( not ( = ?auto_489069 ?auto_489073 ) ) ( not ( = ?auto_489069 ?auto_489075 ) ) ( not ( = ?auto_489069 ?auto_489076 ) ) ( not ( = ?auto_489069 ?auto_489082 ) ) ( not ( = ?auto_489070 ?auto_489071 ) ) ( not ( = ?auto_489070 ?auto_489068 ) ) ( not ( = ?auto_489070 ?auto_489072 ) ) ( not ( = ?auto_489070 ?auto_489074 ) ) ( not ( = ?auto_489070 ?auto_489073 ) ) ( not ( = ?auto_489070 ?auto_489075 ) ) ( not ( = ?auto_489070 ?auto_489076 ) ) ( not ( = ?auto_489070 ?auto_489082 ) ) ( not ( = ?auto_489071 ?auto_489068 ) ) ( not ( = ?auto_489071 ?auto_489072 ) ) ( not ( = ?auto_489071 ?auto_489074 ) ) ( not ( = ?auto_489071 ?auto_489073 ) ) ( not ( = ?auto_489071 ?auto_489075 ) ) ( not ( = ?auto_489071 ?auto_489076 ) ) ( not ( = ?auto_489071 ?auto_489082 ) ) ( not ( = ?auto_489068 ?auto_489072 ) ) ( not ( = ?auto_489068 ?auto_489074 ) ) ( not ( = ?auto_489068 ?auto_489073 ) ) ( not ( = ?auto_489068 ?auto_489075 ) ) ( not ( = ?auto_489068 ?auto_489076 ) ) ( not ( = ?auto_489068 ?auto_489082 ) ) ( not ( = ?auto_489072 ?auto_489074 ) ) ( not ( = ?auto_489072 ?auto_489073 ) ) ( not ( = ?auto_489072 ?auto_489075 ) ) ( not ( = ?auto_489072 ?auto_489076 ) ) ( not ( = ?auto_489072 ?auto_489082 ) ) ( not ( = ?auto_489074 ?auto_489073 ) ) ( not ( = ?auto_489074 ?auto_489075 ) ) ( not ( = ?auto_489074 ?auto_489076 ) ) ( not ( = ?auto_489074 ?auto_489082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_489073 ?auto_489075 ?auto_489076 )
      ( MAKE-8CRATE-VERIFY ?auto_489069 ?auto_489070 ?auto_489071 ?auto_489068 ?auto_489072 ?auto_489074 ?auto_489073 ?auto_489075 ?auto_489076 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_493141 - SURFACE
      ?auto_493142 - SURFACE
      ?auto_493143 - SURFACE
      ?auto_493140 - SURFACE
      ?auto_493144 - SURFACE
      ?auto_493146 - SURFACE
      ?auto_493145 - SURFACE
      ?auto_493147 - SURFACE
      ?auto_493148 - SURFACE
      ?auto_493149 - SURFACE
    )
    :vars
    (
      ?auto_493151 - HOIST
      ?auto_493150 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_493151 ?auto_493150 ) ( SURFACE-AT ?auto_493148 ?auto_493150 ) ( CLEAR ?auto_493148 ) ( LIFTING ?auto_493151 ?auto_493149 ) ( IS-CRATE ?auto_493149 ) ( not ( = ?auto_493148 ?auto_493149 ) ) ( ON ?auto_493142 ?auto_493141 ) ( ON ?auto_493143 ?auto_493142 ) ( ON ?auto_493140 ?auto_493143 ) ( ON ?auto_493144 ?auto_493140 ) ( ON ?auto_493146 ?auto_493144 ) ( ON ?auto_493145 ?auto_493146 ) ( ON ?auto_493147 ?auto_493145 ) ( ON ?auto_493148 ?auto_493147 ) ( not ( = ?auto_493141 ?auto_493142 ) ) ( not ( = ?auto_493141 ?auto_493143 ) ) ( not ( = ?auto_493141 ?auto_493140 ) ) ( not ( = ?auto_493141 ?auto_493144 ) ) ( not ( = ?auto_493141 ?auto_493146 ) ) ( not ( = ?auto_493141 ?auto_493145 ) ) ( not ( = ?auto_493141 ?auto_493147 ) ) ( not ( = ?auto_493141 ?auto_493148 ) ) ( not ( = ?auto_493141 ?auto_493149 ) ) ( not ( = ?auto_493142 ?auto_493143 ) ) ( not ( = ?auto_493142 ?auto_493140 ) ) ( not ( = ?auto_493142 ?auto_493144 ) ) ( not ( = ?auto_493142 ?auto_493146 ) ) ( not ( = ?auto_493142 ?auto_493145 ) ) ( not ( = ?auto_493142 ?auto_493147 ) ) ( not ( = ?auto_493142 ?auto_493148 ) ) ( not ( = ?auto_493142 ?auto_493149 ) ) ( not ( = ?auto_493143 ?auto_493140 ) ) ( not ( = ?auto_493143 ?auto_493144 ) ) ( not ( = ?auto_493143 ?auto_493146 ) ) ( not ( = ?auto_493143 ?auto_493145 ) ) ( not ( = ?auto_493143 ?auto_493147 ) ) ( not ( = ?auto_493143 ?auto_493148 ) ) ( not ( = ?auto_493143 ?auto_493149 ) ) ( not ( = ?auto_493140 ?auto_493144 ) ) ( not ( = ?auto_493140 ?auto_493146 ) ) ( not ( = ?auto_493140 ?auto_493145 ) ) ( not ( = ?auto_493140 ?auto_493147 ) ) ( not ( = ?auto_493140 ?auto_493148 ) ) ( not ( = ?auto_493140 ?auto_493149 ) ) ( not ( = ?auto_493144 ?auto_493146 ) ) ( not ( = ?auto_493144 ?auto_493145 ) ) ( not ( = ?auto_493144 ?auto_493147 ) ) ( not ( = ?auto_493144 ?auto_493148 ) ) ( not ( = ?auto_493144 ?auto_493149 ) ) ( not ( = ?auto_493146 ?auto_493145 ) ) ( not ( = ?auto_493146 ?auto_493147 ) ) ( not ( = ?auto_493146 ?auto_493148 ) ) ( not ( = ?auto_493146 ?auto_493149 ) ) ( not ( = ?auto_493145 ?auto_493147 ) ) ( not ( = ?auto_493145 ?auto_493148 ) ) ( not ( = ?auto_493145 ?auto_493149 ) ) ( not ( = ?auto_493147 ?auto_493148 ) ) ( not ( = ?auto_493147 ?auto_493149 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_493148 ?auto_493149 )
      ( MAKE-9CRATE-VERIFY ?auto_493141 ?auto_493142 ?auto_493143 ?auto_493140 ?auto_493144 ?auto_493146 ?auto_493145 ?auto_493147 ?auto_493148 ?auto_493149 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_493221 - SURFACE
      ?auto_493222 - SURFACE
      ?auto_493223 - SURFACE
      ?auto_493220 - SURFACE
      ?auto_493224 - SURFACE
      ?auto_493226 - SURFACE
      ?auto_493225 - SURFACE
      ?auto_493227 - SURFACE
      ?auto_493228 - SURFACE
      ?auto_493229 - SURFACE
    )
    :vars
    (
      ?auto_493232 - HOIST
      ?auto_493231 - PLACE
      ?auto_493230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_493232 ?auto_493231 ) ( SURFACE-AT ?auto_493228 ?auto_493231 ) ( CLEAR ?auto_493228 ) ( IS-CRATE ?auto_493229 ) ( not ( = ?auto_493228 ?auto_493229 ) ) ( TRUCK-AT ?auto_493230 ?auto_493231 ) ( AVAILABLE ?auto_493232 ) ( IN ?auto_493229 ?auto_493230 ) ( ON ?auto_493228 ?auto_493227 ) ( not ( = ?auto_493227 ?auto_493228 ) ) ( not ( = ?auto_493227 ?auto_493229 ) ) ( ON ?auto_493222 ?auto_493221 ) ( ON ?auto_493223 ?auto_493222 ) ( ON ?auto_493220 ?auto_493223 ) ( ON ?auto_493224 ?auto_493220 ) ( ON ?auto_493226 ?auto_493224 ) ( ON ?auto_493225 ?auto_493226 ) ( ON ?auto_493227 ?auto_493225 ) ( not ( = ?auto_493221 ?auto_493222 ) ) ( not ( = ?auto_493221 ?auto_493223 ) ) ( not ( = ?auto_493221 ?auto_493220 ) ) ( not ( = ?auto_493221 ?auto_493224 ) ) ( not ( = ?auto_493221 ?auto_493226 ) ) ( not ( = ?auto_493221 ?auto_493225 ) ) ( not ( = ?auto_493221 ?auto_493227 ) ) ( not ( = ?auto_493221 ?auto_493228 ) ) ( not ( = ?auto_493221 ?auto_493229 ) ) ( not ( = ?auto_493222 ?auto_493223 ) ) ( not ( = ?auto_493222 ?auto_493220 ) ) ( not ( = ?auto_493222 ?auto_493224 ) ) ( not ( = ?auto_493222 ?auto_493226 ) ) ( not ( = ?auto_493222 ?auto_493225 ) ) ( not ( = ?auto_493222 ?auto_493227 ) ) ( not ( = ?auto_493222 ?auto_493228 ) ) ( not ( = ?auto_493222 ?auto_493229 ) ) ( not ( = ?auto_493223 ?auto_493220 ) ) ( not ( = ?auto_493223 ?auto_493224 ) ) ( not ( = ?auto_493223 ?auto_493226 ) ) ( not ( = ?auto_493223 ?auto_493225 ) ) ( not ( = ?auto_493223 ?auto_493227 ) ) ( not ( = ?auto_493223 ?auto_493228 ) ) ( not ( = ?auto_493223 ?auto_493229 ) ) ( not ( = ?auto_493220 ?auto_493224 ) ) ( not ( = ?auto_493220 ?auto_493226 ) ) ( not ( = ?auto_493220 ?auto_493225 ) ) ( not ( = ?auto_493220 ?auto_493227 ) ) ( not ( = ?auto_493220 ?auto_493228 ) ) ( not ( = ?auto_493220 ?auto_493229 ) ) ( not ( = ?auto_493224 ?auto_493226 ) ) ( not ( = ?auto_493224 ?auto_493225 ) ) ( not ( = ?auto_493224 ?auto_493227 ) ) ( not ( = ?auto_493224 ?auto_493228 ) ) ( not ( = ?auto_493224 ?auto_493229 ) ) ( not ( = ?auto_493226 ?auto_493225 ) ) ( not ( = ?auto_493226 ?auto_493227 ) ) ( not ( = ?auto_493226 ?auto_493228 ) ) ( not ( = ?auto_493226 ?auto_493229 ) ) ( not ( = ?auto_493225 ?auto_493227 ) ) ( not ( = ?auto_493225 ?auto_493228 ) ) ( not ( = ?auto_493225 ?auto_493229 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_493227 ?auto_493228 ?auto_493229 )
      ( MAKE-9CRATE-VERIFY ?auto_493221 ?auto_493222 ?auto_493223 ?auto_493220 ?auto_493224 ?auto_493226 ?auto_493225 ?auto_493227 ?auto_493228 ?auto_493229 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_493311 - SURFACE
      ?auto_493312 - SURFACE
      ?auto_493313 - SURFACE
      ?auto_493310 - SURFACE
      ?auto_493314 - SURFACE
      ?auto_493316 - SURFACE
      ?auto_493315 - SURFACE
      ?auto_493317 - SURFACE
      ?auto_493318 - SURFACE
      ?auto_493319 - SURFACE
    )
    :vars
    (
      ?auto_493322 - HOIST
      ?auto_493323 - PLACE
      ?auto_493321 - TRUCK
      ?auto_493320 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_493322 ?auto_493323 ) ( SURFACE-AT ?auto_493318 ?auto_493323 ) ( CLEAR ?auto_493318 ) ( IS-CRATE ?auto_493319 ) ( not ( = ?auto_493318 ?auto_493319 ) ) ( AVAILABLE ?auto_493322 ) ( IN ?auto_493319 ?auto_493321 ) ( ON ?auto_493318 ?auto_493317 ) ( not ( = ?auto_493317 ?auto_493318 ) ) ( not ( = ?auto_493317 ?auto_493319 ) ) ( TRUCK-AT ?auto_493321 ?auto_493320 ) ( not ( = ?auto_493320 ?auto_493323 ) ) ( ON ?auto_493312 ?auto_493311 ) ( ON ?auto_493313 ?auto_493312 ) ( ON ?auto_493310 ?auto_493313 ) ( ON ?auto_493314 ?auto_493310 ) ( ON ?auto_493316 ?auto_493314 ) ( ON ?auto_493315 ?auto_493316 ) ( ON ?auto_493317 ?auto_493315 ) ( not ( = ?auto_493311 ?auto_493312 ) ) ( not ( = ?auto_493311 ?auto_493313 ) ) ( not ( = ?auto_493311 ?auto_493310 ) ) ( not ( = ?auto_493311 ?auto_493314 ) ) ( not ( = ?auto_493311 ?auto_493316 ) ) ( not ( = ?auto_493311 ?auto_493315 ) ) ( not ( = ?auto_493311 ?auto_493317 ) ) ( not ( = ?auto_493311 ?auto_493318 ) ) ( not ( = ?auto_493311 ?auto_493319 ) ) ( not ( = ?auto_493312 ?auto_493313 ) ) ( not ( = ?auto_493312 ?auto_493310 ) ) ( not ( = ?auto_493312 ?auto_493314 ) ) ( not ( = ?auto_493312 ?auto_493316 ) ) ( not ( = ?auto_493312 ?auto_493315 ) ) ( not ( = ?auto_493312 ?auto_493317 ) ) ( not ( = ?auto_493312 ?auto_493318 ) ) ( not ( = ?auto_493312 ?auto_493319 ) ) ( not ( = ?auto_493313 ?auto_493310 ) ) ( not ( = ?auto_493313 ?auto_493314 ) ) ( not ( = ?auto_493313 ?auto_493316 ) ) ( not ( = ?auto_493313 ?auto_493315 ) ) ( not ( = ?auto_493313 ?auto_493317 ) ) ( not ( = ?auto_493313 ?auto_493318 ) ) ( not ( = ?auto_493313 ?auto_493319 ) ) ( not ( = ?auto_493310 ?auto_493314 ) ) ( not ( = ?auto_493310 ?auto_493316 ) ) ( not ( = ?auto_493310 ?auto_493315 ) ) ( not ( = ?auto_493310 ?auto_493317 ) ) ( not ( = ?auto_493310 ?auto_493318 ) ) ( not ( = ?auto_493310 ?auto_493319 ) ) ( not ( = ?auto_493314 ?auto_493316 ) ) ( not ( = ?auto_493314 ?auto_493315 ) ) ( not ( = ?auto_493314 ?auto_493317 ) ) ( not ( = ?auto_493314 ?auto_493318 ) ) ( not ( = ?auto_493314 ?auto_493319 ) ) ( not ( = ?auto_493316 ?auto_493315 ) ) ( not ( = ?auto_493316 ?auto_493317 ) ) ( not ( = ?auto_493316 ?auto_493318 ) ) ( not ( = ?auto_493316 ?auto_493319 ) ) ( not ( = ?auto_493315 ?auto_493317 ) ) ( not ( = ?auto_493315 ?auto_493318 ) ) ( not ( = ?auto_493315 ?auto_493319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_493317 ?auto_493318 ?auto_493319 )
      ( MAKE-9CRATE-VERIFY ?auto_493311 ?auto_493312 ?auto_493313 ?auto_493310 ?auto_493314 ?auto_493316 ?auto_493315 ?auto_493317 ?auto_493318 ?auto_493319 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_493410 - SURFACE
      ?auto_493411 - SURFACE
      ?auto_493412 - SURFACE
      ?auto_493409 - SURFACE
      ?auto_493413 - SURFACE
      ?auto_493415 - SURFACE
      ?auto_493414 - SURFACE
      ?auto_493416 - SURFACE
      ?auto_493417 - SURFACE
      ?auto_493418 - SURFACE
    )
    :vars
    (
      ?auto_493422 - HOIST
      ?auto_493419 - PLACE
      ?auto_493423 - TRUCK
      ?auto_493421 - PLACE
      ?auto_493420 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_493422 ?auto_493419 ) ( SURFACE-AT ?auto_493417 ?auto_493419 ) ( CLEAR ?auto_493417 ) ( IS-CRATE ?auto_493418 ) ( not ( = ?auto_493417 ?auto_493418 ) ) ( AVAILABLE ?auto_493422 ) ( ON ?auto_493417 ?auto_493416 ) ( not ( = ?auto_493416 ?auto_493417 ) ) ( not ( = ?auto_493416 ?auto_493418 ) ) ( TRUCK-AT ?auto_493423 ?auto_493421 ) ( not ( = ?auto_493421 ?auto_493419 ) ) ( HOIST-AT ?auto_493420 ?auto_493421 ) ( LIFTING ?auto_493420 ?auto_493418 ) ( not ( = ?auto_493422 ?auto_493420 ) ) ( ON ?auto_493411 ?auto_493410 ) ( ON ?auto_493412 ?auto_493411 ) ( ON ?auto_493409 ?auto_493412 ) ( ON ?auto_493413 ?auto_493409 ) ( ON ?auto_493415 ?auto_493413 ) ( ON ?auto_493414 ?auto_493415 ) ( ON ?auto_493416 ?auto_493414 ) ( not ( = ?auto_493410 ?auto_493411 ) ) ( not ( = ?auto_493410 ?auto_493412 ) ) ( not ( = ?auto_493410 ?auto_493409 ) ) ( not ( = ?auto_493410 ?auto_493413 ) ) ( not ( = ?auto_493410 ?auto_493415 ) ) ( not ( = ?auto_493410 ?auto_493414 ) ) ( not ( = ?auto_493410 ?auto_493416 ) ) ( not ( = ?auto_493410 ?auto_493417 ) ) ( not ( = ?auto_493410 ?auto_493418 ) ) ( not ( = ?auto_493411 ?auto_493412 ) ) ( not ( = ?auto_493411 ?auto_493409 ) ) ( not ( = ?auto_493411 ?auto_493413 ) ) ( not ( = ?auto_493411 ?auto_493415 ) ) ( not ( = ?auto_493411 ?auto_493414 ) ) ( not ( = ?auto_493411 ?auto_493416 ) ) ( not ( = ?auto_493411 ?auto_493417 ) ) ( not ( = ?auto_493411 ?auto_493418 ) ) ( not ( = ?auto_493412 ?auto_493409 ) ) ( not ( = ?auto_493412 ?auto_493413 ) ) ( not ( = ?auto_493412 ?auto_493415 ) ) ( not ( = ?auto_493412 ?auto_493414 ) ) ( not ( = ?auto_493412 ?auto_493416 ) ) ( not ( = ?auto_493412 ?auto_493417 ) ) ( not ( = ?auto_493412 ?auto_493418 ) ) ( not ( = ?auto_493409 ?auto_493413 ) ) ( not ( = ?auto_493409 ?auto_493415 ) ) ( not ( = ?auto_493409 ?auto_493414 ) ) ( not ( = ?auto_493409 ?auto_493416 ) ) ( not ( = ?auto_493409 ?auto_493417 ) ) ( not ( = ?auto_493409 ?auto_493418 ) ) ( not ( = ?auto_493413 ?auto_493415 ) ) ( not ( = ?auto_493413 ?auto_493414 ) ) ( not ( = ?auto_493413 ?auto_493416 ) ) ( not ( = ?auto_493413 ?auto_493417 ) ) ( not ( = ?auto_493413 ?auto_493418 ) ) ( not ( = ?auto_493415 ?auto_493414 ) ) ( not ( = ?auto_493415 ?auto_493416 ) ) ( not ( = ?auto_493415 ?auto_493417 ) ) ( not ( = ?auto_493415 ?auto_493418 ) ) ( not ( = ?auto_493414 ?auto_493416 ) ) ( not ( = ?auto_493414 ?auto_493417 ) ) ( not ( = ?auto_493414 ?auto_493418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_493416 ?auto_493417 ?auto_493418 )
      ( MAKE-9CRATE-VERIFY ?auto_493410 ?auto_493411 ?auto_493412 ?auto_493409 ?auto_493413 ?auto_493415 ?auto_493414 ?auto_493416 ?auto_493417 ?auto_493418 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_493518 - SURFACE
      ?auto_493519 - SURFACE
      ?auto_493520 - SURFACE
      ?auto_493517 - SURFACE
      ?auto_493521 - SURFACE
      ?auto_493523 - SURFACE
      ?auto_493522 - SURFACE
      ?auto_493524 - SURFACE
      ?auto_493525 - SURFACE
      ?auto_493526 - SURFACE
    )
    :vars
    (
      ?auto_493528 - HOIST
      ?auto_493530 - PLACE
      ?auto_493532 - TRUCK
      ?auto_493527 - PLACE
      ?auto_493529 - HOIST
      ?auto_493531 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_493528 ?auto_493530 ) ( SURFACE-AT ?auto_493525 ?auto_493530 ) ( CLEAR ?auto_493525 ) ( IS-CRATE ?auto_493526 ) ( not ( = ?auto_493525 ?auto_493526 ) ) ( AVAILABLE ?auto_493528 ) ( ON ?auto_493525 ?auto_493524 ) ( not ( = ?auto_493524 ?auto_493525 ) ) ( not ( = ?auto_493524 ?auto_493526 ) ) ( TRUCK-AT ?auto_493532 ?auto_493527 ) ( not ( = ?auto_493527 ?auto_493530 ) ) ( HOIST-AT ?auto_493529 ?auto_493527 ) ( not ( = ?auto_493528 ?auto_493529 ) ) ( AVAILABLE ?auto_493529 ) ( SURFACE-AT ?auto_493526 ?auto_493527 ) ( ON ?auto_493526 ?auto_493531 ) ( CLEAR ?auto_493526 ) ( not ( = ?auto_493525 ?auto_493531 ) ) ( not ( = ?auto_493526 ?auto_493531 ) ) ( not ( = ?auto_493524 ?auto_493531 ) ) ( ON ?auto_493519 ?auto_493518 ) ( ON ?auto_493520 ?auto_493519 ) ( ON ?auto_493517 ?auto_493520 ) ( ON ?auto_493521 ?auto_493517 ) ( ON ?auto_493523 ?auto_493521 ) ( ON ?auto_493522 ?auto_493523 ) ( ON ?auto_493524 ?auto_493522 ) ( not ( = ?auto_493518 ?auto_493519 ) ) ( not ( = ?auto_493518 ?auto_493520 ) ) ( not ( = ?auto_493518 ?auto_493517 ) ) ( not ( = ?auto_493518 ?auto_493521 ) ) ( not ( = ?auto_493518 ?auto_493523 ) ) ( not ( = ?auto_493518 ?auto_493522 ) ) ( not ( = ?auto_493518 ?auto_493524 ) ) ( not ( = ?auto_493518 ?auto_493525 ) ) ( not ( = ?auto_493518 ?auto_493526 ) ) ( not ( = ?auto_493518 ?auto_493531 ) ) ( not ( = ?auto_493519 ?auto_493520 ) ) ( not ( = ?auto_493519 ?auto_493517 ) ) ( not ( = ?auto_493519 ?auto_493521 ) ) ( not ( = ?auto_493519 ?auto_493523 ) ) ( not ( = ?auto_493519 ?auto_493522 ) ) ( not ( = ?auto_493519 ?auto_493524 ) ) ( not ( = ?auto_493519 ?auto_493525 ) ) ( not ( = ?auto_493519 ?auto_493526 ) ) ( not ( = ?auto_493519 ?auto_493531 ) ) ( not ( = ?auto_493520 ?auto_493517 ) ) ( not ( = ?auto_493520 ?auto_493521 ) ) ( not ( = ?auto_493520 ?auto_493523 ) ) ( not ( = ?auto_493520 ?auto_493522 ) ) ( not ( = ?auto_493520 ?auto_493524 ) ) ( not ( = ?auto_493520 ?auto_493525 ) ) ( not ( = ?auto_493520 ?auto_493526 ) ) ( not ( = ?auto_493520 ?auto_493531 ) ) ( not ( = ?auto_493517 ?auto_493521 ) ) ( not ( = ?auto_493517 ?auto_493523 ) ) ( not ( = ?auto_493517 ?auto_493522 ) ) ( not ( = ?auto_493517 ?auto_493524 ) ) ( not ( = ?auto_493517 ?auto_493525 ) ) ( not ( = ?auto_493517 ?auto_493526 ) ) ( not ( = ?auto_493517 ?auto_493531 ) ) ( not ( = ?auto_493521 ?auto_493523 ) ) ( not ( = ?auto_493521 ?auto_493522 ) ) ( not ( = ?auto_493521 ?auto_493524 ) ) ( not ( = ?auto_493521 ?auto_493525 ) ) ( not ( = ?auto_493521 ?auto_493526 ) ) ( not ( = ?auto_493521 ?auto_493531 ) ) ( not ( = ?auto_493523 ?auto_493522 ) ) ( not ( = ?auto_493523 ?auto_493524 ) ) ( not ( = ?auto_493523 ?auto_493525 ) ) ( not ( = ?auto_493523 ?auto_493526 ) ) ( not ( = ?auto_493523 ?auto_493531 ) ) ( not ( = ?auto_493522 ?auto_493524 ) ) ( not ( = ?auto_493522 ?auto_493525 ) ) ( not ( = ?auto_493522 ?auto_493526 ) ) ( not ( = ?auto_493522 ?auto_493531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_493524 ?auto_493525 ?auto_493526 )
      ( MAKE-9CRATE-VERIFY ?auto_493518 ?auto_493519 ?auto_493520 ?auto_493517 ?auto_493521 ?auto_493523 ?auto_493522 ?auto_493524 ?auto_493525 ?auto_493526 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_493627 - SURFACE
      ?auto_493628 - SURFACE
      ?auto_493629 - SURFACE
      ?auto_493626 - SURFACE
      ?auto_493630 - SURFACE
      ?auto_493632 - SURFACE
      ?auto_493631 - SURFACE
      ?auto_493633 - SURFACE
      ?auto_493634 - SURFACE
      ?auto_493635 - SURFACE
    )
    :vars
    (
      ?auto_493639 - HOIST
      ?auto_493640 - PLACE
      ?auto_493641 - PLACE
      ?auto_493636 - HOIST
      ?auto_493637 - SURFACE
      ?auto_493638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_493639 ?auto_493640 ) ( SURFACE-AT ?auto_493634 ?auto_493640 ) ( CLEAR ?auto_493634 ) ( IS-CRATE ?auto_493635 ) ( not ( = ?auto_493634 ?auto_493635 ) ) ( AVAILABLE ?auto_493639 ) ( ON ?auto_493634 ?auto_493633 ) ( not ( = ?auto_493633 ?auto_493634 ) ) ( not ( = ?auto_493633 ?auto_493635 ) ) ( not ( = ?auto_493641 ?auto_493640 ) ) ( HOIST-AT ?auto_493636 ?auto_493641 ) ( not ( = ?auto_493639 ?auto_493636 ) ) ( AVAILABLE ?auto_493636 ) ( SURFACE-AT ?auto_493635 ?auto_493641 ) ( ON ?auto_493635 ?auto_493637 ) ( CLEAR ?auto_493635 ) ( not ( = ?auto_493634 ?auto_493637 ) ) ( not ( = ?auto_493635 ?auto_493637 ) ) ( not ( = ?auto_493633 ?auto_493637 ) ) ( TRUCK-AT ?auto_493638 ?auto_493640 ) ( ON ?auto_493628 ?auto_493627 ) ( ON ?auto_493629 ?auto_493628 ) ( ON ?auto_493626 ?auto_493629 ) ( ON ?auto_493630 ?auto_493626 ) ( ON ?auto_493632 ?auto_493630 ) ( ON ?auto_493631 ?auto_493632 ) ( ON ?auto_493633 ?auto_493631 ) ( not ( = ?auto_493627 ?auto_493628 ) ) ( not ( = ?auto_493627 ?auto_493629 ) ) ( not ( = ?auto_493627 ?auto_493626 ) ) ( not ( = ?auto_493627 ?auto_493630 ) ) ( not ( = ?auto_493627 ?auto_493632 ) ) ( not ( = ?auto_493627 ?auto_493631 ) ) ( not ( = ?auto_493627 ?auto_493633 ) ) ( not ( = ?auto_493627 ?auto_493634 ) ) ( not ( = ?auto_493627 ?auto_493635 ) ) ( not ( = ?auto_493627 ?auto_493637 ) ) ( not ( = ?auto_493628 ?auto_493629 ) ) ( not ( = ?auto_493628 ?auto_493626 ) ) ( not ( = ?auto_493628 ?auto_493630 ) ) ( not ( = ?auto_493628 ?auto_493632 ) ) ( not ( = ?auto_493628 ?auto_493631 ) ) ( not ( = ?auto_493628 ?auto_493633 ) ) ( not ( = ?auto_493628 ?auto_493634 ) ) ( not ( = ?auto_493628 ?auto_493635 ) ) ( not ( = ?auto_493628 ?auto_493637 ) ) ( not ( = ?auto_493629 ?auto_493626 ) ) ( not ( = ?auto_493629 ?auto_493630 ) ) ( not ( = ?auto_493629 ?auto_493632 ) ) ( not ( = ?auto_493629 ?auto_493631 ) ) ( not ( = ?auto_493629 ?auto_493633 ) ) ( not ( = ?auto_493629 ?auto_493634 ) ) ( not ( = ?auto_493629 ?auto_493635 ) ) ( not ( = ?auto_493629 ?auto_493637 ) ) ( not ( = ?auto_493626 ?auto_493630 ) ) ( not ( = ?auto_493626 ?auto_493632 ) ) ( not ( = ?auto_493626 ?auto_493631 ) ) ( not ( = ?auto_493626 ?auto_493633 ) ) ( not ( = ?auto_493626 ?auto_493634 ) ) ( not ( = ?auto_493626 ?auto_493635 ) ) ( not ( = ?auto_493626 ?auto_493637 ) ) ( not ( = ?auto_493630 ?auto_493632 ) ) ( not ( = ?auto_493630 ?auto_493631 ) ) ( not ( = ?auto_493630 ?auto_493633 ) ) ( not ( = ?auto_493630 ?auto_493634 ) ) ( not ( = ?auto_493630 ?auto_493635 ) ) ( not ( = ?auto_493630 ?auto_493637 ) ) ( not ( = ?auto_493632 ?auto_493631 ) ) ( not ( = ?auto_493632 ?auto_493633 ) ) ( not ( = ?auto_493632 ?auto_493634 ) ) ( not ( = ?auto_493632 ?auto_493635 ) ) ( not ( = ?auto_493632 ?auto_493637 ) ) ( not ( = ?auto_493631 ?auto_493633 ) ) ( not ( = ?auto_493631 ?auto_493634 ) ) ( not ( = ?auto_493631 ?auto_493635 ) ) ( not ( = ?auto_493631 ?auto_493637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_493633 ?auto_493634 ?auto_493635 )
      ( MAKE-9CRATE-VERIFY ?auto_493627 ?auto_493628 ?auto_493629 ?auto_493626 ?auto_493630 ?auto_493632 ?auto_493631 ?auto_493633 ?auto_493634 ?auto_493635 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_493736 - SURFACE
      ?auto_493737 - SURFACE
      ?auto_493738 - SURFACE
      ?auto_493735 - SURFACE
      ?auto_493739 - SURFACE
      ?auto_493741 - SURFACE
      ?auto_493740 - SURFACE
      ?auto_493742 - SURFACE
      ?auto_493743 - SURFACE
      ?auto_493744 - SURFACE
    )
    :vars
    (
      ?auto_493746 - HOIST
      ?auto_493749 - PLACE
      ?auto_493750 - PLACE
      ?auto_493747 - HOIST
      ?auto_493745 - SURFACE
      ?auto_493748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_493746 ?auto_493749 ) ( IS-CRATE ?auto_493744 ) ( not ( = ?auto_493743 ?auto_493744 ) ) ( not ( = ?auto_493742 ?auto_493743 ) ) ( not ( = ?auto_493742 ?auto_493744 ) ) ( not ( = ?auto_493750 ?auto_493749 ) ) ( HOIST-AT ?auto_493747 ?auto_493750 ) ( not ( = ?auto_493746 ?auto_493747 ) ) ( AVAILABLE ?auto_493747 ) ( SURFACE-AT ?auto_493744 ?auto_493750 ) ( ON ?auto_493744 ?auto_493745 ) ( CLEAR ?auto_493744 ) ( not ( = ?auto_493743 ?auto_493745 ) ) ( not ( = ?auto_493744 ?auto_493745 ) ) ( not ( = ?auto_493742 ?auto_493745 ) ) ( TRUCK-AT ?auto_493748 ?auto_493749 ) ( SURFACE-AT ?auto_493742 ?auto_493749 ) ( CLEAR ?auto_493742 ) ( LIFTING ?auto_493746 ?auto_493743 ) ( IS-CRATE ?auto_493743 ) ( ON ?auto_493737 ?auto_493736 ) ( ON ?auto_493738 ?auto_493737 ) ( ON ?auto_493735 ?auto_493738 ) ( ON ?auto_493739 ?auto_493735 ) ( ON ?auto_493741 ?auto_493739 ) ( ON ?auto_493740 ?auto_493741 ) ( ON ?auto_493742 ?auto_493740 ) ( not ( = ?auto_493736 ?auto_493737 ) ) ( not ( = ?auto_493736 ?auto_493738 ) ) ( not ( = ?auto_493736 ?auto_493735 ) ) ( not ( = ?auto_493736 ?auto_493739 ) ) ( not ( = ?auto_493736 ?auto_493741 ) ) ( not ( = ?auto_493736 ?auto_493740 ) ) ( not ( = ?auto_493736 ?auto_493742 ) ) ( not ( = ?auto_493736 ?auto_493743 ) ) ( not ( = ?auto_493736 ?auto_493744 ) ) ( not ( = ?auto_493736 ?auto_493745 ) ) ( not ( = ?auto_493737 ?auto_493738 ) ) ( not ( = ?auto_493737 ?auto_493735 ) ) ( not ( = ?auto_493737 ?auto_493739 ) ) ( not ( = ?auto_493737 ?auto_493741 ) ) ( not ( = ?auto_493737 ?auto_493740 ) ) ( not ( = ?auto_493737 ?auto_493742 ) ) ( not ( = ?auto_493737 ?auto_493743 ) ) ( not ( = ?auto_493737 ?auto_493744 ) ) ( not ( = ?auto_493737 ?auto_493745 ) ) ( not ( = ?auto_493738 ?auto_493735 ) ) ( not ( = ?auto_493738 ?auto_493739 ) ) ( not ( = ?auto_493738 ?auto_493741 ) ) ( not ( = ?auto_493738 ?auto_493740 ) ) ( not ( = ?auto_493738 ?auto_493742 ) ) ( not ( = ?auto_493738 ?auto_493743 ) ) ( not ( = ?auto_493738 ?auto_493744 ) ) ( not ( = ?auto_493738 ?auto_493745 ) ) ( not ( = ?auto_493735 ?auto_493739 ) ) ( not ( = ?auto_493735 ?auto_493741 ) ) ( not ( = ?auto_493735 ?auto_493740 ) ) ( not ( = ?auto_493735 ?auto_493742 ) ) ( not ( = ?auto_493735 ?auto_493743 ) ) ( not ( = ?auto_493735 ?auto_493744 ) ) ( not ( = ?auto_493735 ?auto_493745 ) ) ( not ( = ?auto_493739 ?auto_493741 ) ) ( not ( = ?auto_493739 ?auto_493740 ) ) ( not ( = ?auto_493739 ?auto_493742 ) ) ( not ( = ?auto_493739 ?auto_493743 ) ) ( not ( = ?auto_493739 ?auto_493744 ) ) ( not ( = ?auto_493739 ?auto_493745 ) ) ( not ( = ?auto_493741 ?auto_493740 ) ) ( not ( = ?auto_493741 ?auto_493742 ) ) ( not ( = ?auto_493741 ?auto_493743 ) ) ( not ( = ?auto_493741 ?auto_493744 ) ) ( not ( = ?auto_493741 ?auto_493745 ) ) ( not ( = ?auto_493740 ?auto_493742 ) ) ( not ( = ?auto_493740 ?auto_493743 ) ) ( not ( = ?auto_493740 ?auto_493744 ) ) ( not ( = ?auto_493740 ?auto_493745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_493742 ?auto_493743 ?auto_493744 )
      ( MAKE-9CRATE-VERIFY ?auto_493736 ?auto_493737 ?auto_493738 ?auto_493735 ?auto_493739 ?auto_493741 ?auto_493740 ?auto_493742 ?auto_493743 ?auto_493744 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_493845 - SURFACE
      ?auto_493846 - SURFACE
      ?auto_493847 - SURFACE
      ?auto_493844 - SURFACE
      ?auto_493848 - SURFACE
      ?auto_493850 - SURFACE
      ?auto_493849 - SURFACE
      ?auto_493851 - SURFACE
      ?auto_493852 - SURFACE
      ?auto_493853 - SURFACE
    )
    :vars
    (
      ?auto_493859 - HOIST
      ?auto_493856 - PLACE
      ?auto_493857 - PLACE
      ?auto_493858 - HOIST
      ?auto_493855 - SURFACE
      ?auto_493854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_493859 ?auto_493856 ) ( IS-CRATE ?auto_493853 ) ( not ( = ?auto_493852 ?auto_493853 ) ) ( not ( = ?auto_493851 ?auto_493852 ) ) ( not ( = ?auto_493851 ?auto_493853 ) ) ( not ( = ?auto_493857 ?auto_493856 ) ) ( HOIST-AT ?auto_493858 ?auto_493857 ) ( not ( = ?auto_493859 ?auto_493858 ) ) ( AVAILABLE ?auto_493858 ) ( SURFACE-AT ?auto_493853 ?auto_493857 ) ( ON ?auto_493853 ?auto_493855 ) ( CLEAR ?auto_493853 ) ( not ( = ?auto_493852 ?auto_493855 ) ) ( not ( = ?auto_493853 ?auto_493855 ) ) ( not ( = ?auto_493851 ?auto_493855 ) ) ( TRUCK-AT ?auto_493854 ?auto_493856 ) ( SURFACE-AT ?auto_493851 ?auto_493856 ) ( CLEAR ?auto_493851 ) ( IS-CRATE ?auto_493852 ) ( AVAILABLE ?auto_493859 ) ( IN ?auto_493852 ?auto_493854 ) ( ON ?auto_493846 ?auto_493845 ) ( ON ?auto_493847 ?auto_493846 ) ( ON ?auto_493844 ?auto_493847 ) ( ON ?auto_493848 ?auto_493844 ) ( ON ?auto_493850 ?auto_493848 ) ( ON ?auto_493849 ?auto_493850 ) ( ON ?auto_493851 ?auto_493849 ) ( not ( = ?auto_493845 ?auto_493846 ) ) ( not ( = ?auto_493845 ?auto_493847 ) ) ( not ( = ?auto_493845 ?auto_493844 ) ) ( not ( = ?auto_493845 ?auto_493848 ) ) ( not ( = ?auto_493845 ?auto_493850 ) ) ( not ( = ?auto_493845 ?auto_493849 ) ) ( not ( = ?auto_493845 ?auto_493851 ) ) ( not ( = ?auto_493845 ?auto_493852 ) ) ( not ( = ?auto_493845 ?auto_493853 ) ) ( not ( = ?auto_493845 ?auto_493855 ) ) ( not ( = ?auto_493846 ?auto_493847 ) ) ( not ( = ?auto_493846 ?auto_493844 ) ) ( not ( = ?auto_493846 ?auto_493848 ) ) ( not ( = ?auto_493846 ?auto_493850 ) ) ( not ( = ?auto_493846 ?auto_493849 ) ) ( not ( = ?auto_493846 ?auto_493851 ) ) ( not ( = ?auto_493846 ?auto_493852 ) ) ( not ( = ?auto_493846 ?auto_493853 ) ) ( not ( = ?auto_493846 ?auto_493855 ) ) ( not ( = ?auto_493847 ?auto_493844 ) ) ( not ( = ?auto_493847 ?auto_493848 ) ) ( not ( = ?auto_493847 ?auto_493850 ) ) ( not ( = ?auto_493847 ?auto_493849 ) ) ( not ( = ?auto_493847 ?auto_493851 ) ) ( not ( = ?auto_493847 ?auto_493852 ) ) ( not ( = ?auto_493847 ?auto_493853 ) ) ( not ( = ?auto_493847 ?auto_493855 ) ) ( not ( = ?auto_493844 ?auto_493848 ) ) ( not ( = ?auto_493844 ?auto_493850 ) ) ( not ( = ?auto_493844 ?auto_493849 ) ) ( not ( = ?auto_493844 ?auto_493851 ) ) ( not ( = ?auto_493844 ?auto_493852 ) ) ( not ( = ?auto_493844 ?auto_493853 ) ) ( not ( = ?auto_493844 ?auto_493855 ) ) ( not ( = ?auto_493848 ?auto_493850 ) ) ( not ( = ?auto_493848 ?auto_493849 ) ) ( not ( = ?auto_493848 ?auto_493851 ) ) ( not ( = ?auto_493848 ?auto_493852 ) ) ( not ( = ?auto_493848 ?auto_493853 ) ) ( not ( = ?auto_493848 ?auto_493855 ) ) ( not ( = ?auto_493850 ?auto_493849 ) ) ( not ( = ?auto_493850 ?auto_493851 ) ) ( not ( = ?auto_493850 ?auto_493852 ) ) ( not ( = ?auto_493850 ?auto_493853 ) ) ( not ( = ?auto_493850 ?auto_493855 ) ) ( not ( = ?auto_493849 ?auto_493851 ) ) ( not ( = ?auto_493849 ?auto_493852 ) ) ( not ( = ?auto_493849 ?auto_493853 ) ) ( not ( = ?auto_493849 ?auto_493855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_493851 ?auto_493852 ?auto_493853 )
      ( MAKE-9CRATE-VERIFY ?auto_493845 ?auto_493846 ?auto_493847 ?auto_493844 ?auto_493848 ?auto_493850 ?auto_493849 ?auto_493851 ?auto_493852 ?auto_493853 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_499345 - SURFACE
      ?auto_499346 - SURFACE
      ?auto_499347 - SURFACE
      ?auto_499344 - SURFACE
      ?auto_499348 - SURFACE
      ?auto_499350 - SURFACE
      ?auto_499349 - SURFACE
      ?auto_499351 - SURFACE
      ?auto_499352 - SURFACE
      ?auto_499353 - SURFACE
      ?auto_499354 - SURFACE
    )
    :vars
    (
      ?auto_499356 - HOIST
      ?auto_499355 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_499356 ?auto_499355 ) ( SURFACE-AT ?auto_499353 ?auto_499355 ) ( CLEAR ?auto_499353 ) ( LIFTING ?auto_499356 ?auto_499354 ) ( IS-CRATE ?auto_499354 ) ( not ( = ?auto_499353 ?auto_499354 ) ) ( ON ?auto_499346 ?auto_499345 ) ( ON ?auto_499347 ?auto_499346 ) ( ON ?auto_499344 ?auto_499347 ) ( ON ?auto_499348 ?auto_499344 ) ( ON ?auto_499350 ?auto_499348 ) ( ON ?auto_499349 ?auto_499350 ) ( ON ?auto_499351 ?auto_499349 ) ( ON ?auto_499352 ?auto_499351 ) ( ON ?auto_499353 ?auto_499352 ) ( not ( = ?auto_499345 ?auto_499346 ) ) ( not ( = ?auto_499345 ?auto_499347 ) ) ( not ( = ?auto_499345 ?auto_499344 ) ) ( not ( = ?auto_499345 ?auto_499348 ) ) ( not ( = ?auto_499345 ?auto_499350 ) ) ( not ( = ?auto_499345 ?auto_499349 ) ) ( not ( = ?auto_499345 ?auto_499351 ) ) ( not ( = ?auto_499345 ?auto_499352 ) ) ( not ( = ?auto_499345 ?auto_499353 ) ) ( not ( = ?auto_499345 ?auto_499354 ) ) ( not ( = ?auto_499346 ?auto_499347 ) ) ( not ( = ?auto_499346 ?auto_499344 ) ) ( not ( = ?auto_499346 ?auto_499348 ) ) ( not ( = ?auto_499346 ?auto_499350 ) ) ( not ( = ?auto_499346 ?auto_499349 ) ) ( not ( = ?auto_499346 ?auto_499351 ) ) ( not ( = ?auto_499346 ?auto_499352 ) ) ( not ( = ?auto_499346 ?auto_499353 ) ) ( not ( = ?auto_499346 ?auto_499354 ) ) ( not ( = ?auto_499347 ?auto_499344 ) ) ( not ( = ?auto_499347 ?auto_499348 ) ) ( not ( = ?auto_499347 ?auto_499350 ) ) ( not ( = ?auto_499347 ?auto_499349 ) ) ( not ( = ?auto_499347 ?auto_499351 ) ) ( not ( = ?auto_499347 ?auto_499352 ) ) ( not ( = ?auto_499347 ?auto_499353 ) ) ( not ( = ?auto_499347 ?auto_499354 ) ) ( not ( = ?auto_499344 ?auto_499348 ) ) ( not ( = ?auto_499344 ?auto_499350 ) ) ( not ( = ?auto_499344 ?auto_499349 ) ) ( not ( = ?auto_499344 ?auto_499351 ) ) ( not ( = ?auto_499344 ?auto_499352 ) ) ( not ( = ?auto_499344 ?auto_499353 ) ) ( not ( = ?auto_499344 ?auto_499354 ) ) ( not ( = ?auto_499348 ?auto_499350 ) ) ( not ( = ?auto_499348 ?auto_499349 ) ) ( not ( = ?auto_499348 ?auto_499351 ) ) ( not ( = ?auto_499348 ?auto_499352 ) ) ( not ( = ?auto_499348 ?auto_499353 ) ) ( not ( = ?auto_499348 ?auto_499354 ) ) ( not ( = ?auto_499350 ?auto_499349 ) ) ( not ( = ?auto_499350 ?auto_499351 ) ) ( not ( = ?auto_499350 ?auto_499352 ) ) ( not ( = ?auto_499350 ?auto_499353 ) ) ( not ( = ?auto_499350 ?auto_499354 ) ) ( not ( = ?auto_499349 ?auto_499351 ) ) ( not ( = ?auto_499349 ?auto_499352 ) ) ( not ( = ?auto_499349 ?auto_499353 ) ) ( not ( = ?auto_499349 ?auto_499354 ) ) ( not ( = ?auto_499351 ?auto_499352 ) ) ( not ( = ?auto_499351 ?auto_499353 ) ) ( not ( = ?auto_499351 ?auto_499354 ) ) ( not ( = ?auto_499352 ?auto_499353 ) ) ( not ( = ?auto_499352 ?auto_499354 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_499353 ?auto_499354 )
      ( MAKE-10CRATE-VERIFY ?auto_499345 ?auto_499346 ?auto_499347 ?auto_499344 ?auto_499348 ?auto_499350 ?auto_499349 ?auto_499351 ?auto_499352 ?auto_499353 ?auto_499354 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_499439 - SURFACE
      ?auto_499440 - SURFACE
      ?auto_499441 - SURFACE
      ?auto_499438 - SURFACE
      ?auto_499442 - SURFACE
      ?auto_499444 - SURFACE
      ?auto_499443 - SURFACE
      ?auto_499445 - SURFACE
      ?auto_499446 - SURFACE
      ?auto_499447 - SURFACE
      ?auto_499448 - SURFACE
    )
    :vars
    (
      ?auto_499449 - HOIST
      ?auto_499451 - PLACE
      ?auto_499450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_499449 ?auto_499451 ) ( SURFACE-AT ?auto_499447 ?auto_499451 ) ( CLEAR ?auto_499447 ) ( IS-CRATE ?auto_499448 ) ( not ( = ?auto_499447 ?auto_499448 ) ) ( TRUCK-AT ?auto_499450 ?auto_499451 ) ( AVAILABLE ?auto_499449 ) ( IN ?auto_499448 ?auto_499450 ) ( ON ?auto_499447 ?auto_499446 ) ( not ( = ?auto_499446 ?auto_499447 ) ) ( not ( = ?auto_499446 ?auto_499448 ) ) ( ON ?auto_499440 ?auto_499439 ) ( ON ?auto_499441 ?auto_499440 ) ( ON ?auto_499438 ?auto_499441 ) ( ON ?auto_499442 ?auto_499438 ) ( ON ?auto_499444 ?auto_499442 ) ( ON ?auto_499443 ?auto_499444 ) ( ON ?auto_499445 ?auto_499443 ) ( ON ?auto_499446 ?auto_499445 ) ( not ( = ?auto_499439 ?auto_499440 ) ) ( not ( = ?auto_499439 ?auto_499441 ) ) ( not ( = ?auto_499439 ?auto_499438 ) ) ( not ( = ?auto_499439 ?auto_499442 ) ) ( not ( = ?auto_499439 ?auto_499444 ) ) ( not ( = ?auto_499439 ?auto_499443 ) ) ( not ( = ?auto_499439 ?auto_499445 ) ) ( not ( = ?auto_499439 ?auto_499446 ) ) ( not ( = ?auto_499439 ?auto_499447 ) ) ( not ( = ?auto_499439 ?auto_499448 ) ) ( not ( = ?auto_499440 ?auto_499441 ) ) ( not ( = ?auto_499440 ?auto_499438 ) ) ( not ( = ?auto_499440 ?auto_499442 ) ) ( not ( = ?auto_499440 ?auto_499444 ) ) ( not ( = ?auto_499440 ?auto_499443 ) ) ( not ( = ?auto_499440 ?auto_499445 ) ) ( not ( = ?auto_499440 ?auto_499446 ) ) ( not ( = ?auto_499440 ?auto_499447 ) ) ( not ( = ?auto_499440 ?auto_499448 ) ) ( not ( = ?auto_499441 ?auto_499438 ) ) ( not ( = ?auto_499441 ?auto_499442 ) ) ( not ( = ?auto_499441 ?auto_499444 ) ) ( not ( = ?auto_499441 ?auto_499443 ) ) ( not ( = ?auto_499441 ?auto_499445 ) ) ( not ( = ?auto_499441 ?auto_499446 ) ) ( not ( = ?auto_499441 ?auto_499447 ) ) ( not ( = ?auto_499441 ?auto_499448 ) ) ( not ( = ?auto_499438 ?auto_499442 ) ) ( not ( = ?auto_499438 ?auto_499444 ) ) ( not ( = ?auto_499438 ?auto_499443 ) ) ( not ( = ?auto_499438 ?auto_499445 ) ) ( not ( = ?auto_499438 ?auto_499446 ) ) ( not ( = ?auto_499438 ?auto_499447 ) ) ( not ( = ?auto_499438 ?auto_499448 ) ) ( not ( = ?auto_499442 ?auto_499444 ) ) ( not ( = ?auto_499442 ?auto_499443 ) ) ( not ( = ?auto_499442 ?auto_499445 ) ) ( not ( = ?auto_499442 ?auto_499446 ) ) ( not ( = ?auto_499442 ?auto_499447 ) ) ( not ( = ?auto_499442 ?auto_499448 ) ) ( not ( = ?auto_499444 ?auto_499443 ) ) ( not ( = ?auto_499444 ?auto_499445 ) ) ( not ( = ?auto_499444 ?auto_499446 ) ) ( not ( = ?auto_499444 ?auto_499447 ) ) ( not ( = ?auto_499444 ?auto_499448 ) ) ( not ( = ?auto_499443 ?auto_499445 ) ) ( not ( = ?auto_499443 ?auto_499446 ) ) ( not ( = ?auto_499443 ?auto_499447 ) ) ( not ( = ?auto_499443 ?auto_499448 ) ) ( not ( = ?auto_499445 ?auto_499446 ) ) ( not ( = ?auto_499445 ?auto_499447 ) ) ( not ( = ?auto_499445 ?auto_499448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_499446 ?auto_499447 ?auto_499448 )
      ( MAKE-10CRATE-VERIFY ?auto_499439 ?auto_499440 ?auto_499441 ?auto_499438 ?auto_499442 ?auto_499444 ?auto_499443 ?auto_499445 ?auto_499446 ?auto_499447 ?auto_499448 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_499544 - SURFACE
      ?auto_499545 - SURFACE
      ?auto_499546 - SURFACE
      ?auto_499543 - SURFACE
      ?auto_499547 - SURFACE
      ?auto_499549 - SURFACE
      ?auto_499548 - SURFACE
      ?auto_499550 - SURFACE
      ?auto_499551 - SURFACE
      ?auto_499552 - SURFACE
      ?auto_499553 - SURFACE
    )
    :vars
    (
      ?auto_499554 - HOIST
      ?auto_499557 - PLACE
      ?auto_499556 - TRUCK
      ?auto_499555 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_499554 ?auto_499557 ) ( SURFACE-AT ?auto_499552 ?auto_499557 ) ( CLEAR ?auto_499552 ) ( IS-CRATE ?auto_499553 ) ( not ( = ?auto_499552 ?auto_499553 ) ) ( AVAILABLE ?auto_499554 ) ( IN ?auto_499553 ?auto_499556 ) ( ON ?auto_499552 ?auto_499551 ) ( not ( = ?auto_499551 ?auto_499552 ) ) ( not ( = ?auto_499551 ?auto_499553 ) ) ( TRUCK-AT ?auto_499556 ?auto_499555 ) ( not ( = ?auto_499555 ?auto_499557 ) ) ( ON ?auto_499545 ?auto_499544 ) ( ON ?auto_499546 ?auto_499545 ) ( ON ?auto_499543 ?auto_499546 ) ( ON ?auto_499547 ?auto_499543 ) ( ON ?auto_499549 ?auto_499547 ) ( ON ?auto_499548 ?auto_499549 ) ( ON ?auto_499550 ?auto_499548 ) ( ON ?auto_499551 ?auto_499550 ) ( not ( = ?auto_499544 ?auto_499545 ) ) ( not ( = ?auto_499544 ?auto_499546 ) ) ( not ( = ?auto_499544 ?auto_499543 ) ) ( not ( = ?auto_499544 ?auto_499547 ) ) ( not ( = ?auto_499544 ?auto_499549 ) ) ( not ( = ?auto_499544 ?auto_499548 ) ) ( not ( = ?auto_499544 ?auto_499550 ) ) ( not ( = ?auto_499544 ?auto_499551 ) ) ( not ( = ?auto_499544 ?auto_499552 ) ) ( not ( = ?auto_499544 ?auto_499553 ) ) ( not ( = ?auto_499545 ?auto_499546 ) ) ( not ( = ?auto_499545 ?auto_499543 ) ) ( not ( = ?auto_499545 ?auto_499547 ) ) ( not ( = ?auto_499545 ?auto_499549 ) ) ( not ( = ?auto_499545 ?auto_499548 ) ) ( not ( = ?auto_499545 ?auto_499550 ) ) ( not ( = ?auto_499545 ?auto_499551 ) ) ( not ( = ?auto_499545 ?auto_499552 ) ) ( not ( = ?auto_499545 ?auto_499553 ) ) ( not ( = ?auto_499546 ?auto_499543 ) ) ( not ( = ?auto_499546 ?auto_499547 ) ) ( not ( = ?auto_499546 ?auto_499549 ) ) ( not ( = ?auto_499546 ?auto_499548 ) ) ( not ( = ?auto_499546 ?auto_499550 ) ) ( not ( = ?auto_499546 ?auto_499551 ) ) ( not ( = ?auto_499546 ?auto_499552 ) ) ( not ( = ?auto_499546 ?auto_499553 ) ) ( not ( = ?auto_499543 ?auto_499547 ) ) ( not ( = ?auto_499543 ?auto_499549 ) ) ( not ( = ?auto_499543 ?auto_499548 ) ) ( not ( = ?auto_499543 ?auto_499550 ) ) ( not ( = ?auto_499543 ?auto_499551 ) ) ( not ( = ?auto_499543 ?auto_499552 ) ) ( not ( = ?auto_499543 ?auto_499553 ) ) ( not ( = ?auto_499547 ?auto_499549 ) ) ( not ( = ?auto_499547 ?auto_499548 ) ) ( not ( = ?auto_499547 ?auto_499550 ) ) ( not ( = ?auto_499547 ?auto_499551 ) ) ( not ( = ?auto_499547 ?auto_499552 ) ) ( not ( = ?auto_499547 ?auto_499553 ) ) ( not ( = ?auto_499549 ?auto_499548 ) ) ( not ( = ?auto_499549 ?auto_499550 ) ) ( not ( = ?auto_499549 ?auto_499551 ) ) ( not ( = ?auto_499549 ?auto_499552 ) ) ( not ( = ?auto_499549 ?auto_499553 ) ) ( not ( = ?auto_499548 ?auto_499550 ) ) ( not ( = ?auto_499548 ?auto_499551 ) ) ( not ( = ?auto_499548 ?auto_499552 ) ) ( not ( = ?auto_499548 ?auto_499553 ) ) ( not ( = ?auto_499550 ?auto_499551 ) ) ( not ( = ?auto_499550 ?auto_499552 ) ) ( not ( = ?auto_499550 ?auto_499553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_499551 ?auto_499552 ?auto_499553 )
      ( MAKE-10CRATE-VERIFY ?auto_499544 ?auto_499545 ?auto_499546 ?auto_499543 ?auto_499547 ?auto_499549 ?auto_499548 ?auto_499550 ?auto_499551 ?auto_499552 ?auto_499553 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_499659 - SURFACE
      ?auto_499660 - SURFACE
      ?auto_499661 - SURFACE
      ?auto_499658 - SURFACE
      ?auto_499662 - SURFACE
      ?auto_499664 - SURFACE
      ?auto_499663 - SURFACE
      ?auto_499665 - SURFACE
      ?auto_499666 - SURFACE
      ?auto_499667 - SURFACE
      ?auto_499668 - SURFACE
    )
    :vars
    (
      ?auto_499670 - HOIST
      ?auto_499672 - PLACE
      ?auto_499671 - TRUCK
      ?auto_499673 - PLACE
      ?auto_499669 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_499670 ?auto_499672 ) ( SURFACE-AT ?auto_499667 ?auto_499672 ) ( CLEAR ?auto_499667 ) ( IS-CRATE ?auto_499668 ) ( not ( = ?auto_499667 ?auto_499668 ) ) ( AVAILABLE ?auto_499670 ) ( ON ?auto_499667 ?auto_499666 ) ( not ( = ?auto_499666 ?auto_499667 ) ) ( not ( = ?auto_499666 ?auto_499668 ) ) ( TRUCK-AT ?auto_499671 ?auto_499673 ) ( not ( = ?auto_499673 ?auto_499672 ) ) ( HOIST-AT ?auto_499669 ?auto_499673 ) ( LIFTING ?auto_499669 ?auto_499668 ) ( not ( = ?auto_499670 ?auto_499669 ) ) ( ON ?auto_499660 ?auto_499659 ) ( ON ?auto_499661 ?auto_499660 ) ( ON ?auto_499658 ?auto_499661 ) ( ON ?auto_499662 ?auto_499658 ) ( ON ?auto_499664 ?auto_499662 ) ( ON ?auto_499663 ?auto_499664 ) ( ON ?auto_499665 ?auto_499663 ) ( ON ?auto_499666 ?auto_499665 ) ( not ( = ?auto_499659 ?auto_499660 ) ) ( not ( = ?auto_499659 ?auto_499661 ) ) ( not ( = ?auto_499659 ?auto_499658 ) ) ( not ( = ?auto_499659 ?auto_499662 ) ) ( not ( = ?auto_499659 ?auto_499664 ) ) ( not ( = ?auto_499659 ?auto_499663 ) ) ( not ( = ?auto_499659 ?auto_499665 ) ) ( not ( = ?auto_499659 ?auto_499666 ) ) ( not ( = ?auto_499659 ?auto_499667 ) ) ( not ( = ?auto_499659 ?auto_499668 ) ) ( not ( = ?auto_499660 ?auto_499661 ) ) ( not ( = ?auto_499660 ?auto_499658 ) ) ( not ( = ?auto_499660 ?auto_499662 ) ) ( not ( = ?auto_499660 ?auto_499664 ) ) ( not ( = ?auto_499660 ?auto_499663 ) ) ( not ( = ?auto_499660 ?auto_499665 ) ) ( not ( = ?auto_499660 ?auto_499666 ) ) ( not ( = ?auto_499660 ?auto_499667 ) ) ( not ( = ?auto_499660 ?auto_499668 ) ) ( not ( = ?auto_499661 ?auto_499658 ) ) ( not ( = ?auto_499661 ?auto_499662 ) ) ( not ( = ?auto_499661 ?auto_499664 ) ) ( not ( = ?auto_499661 ?auto_499663 ) ) ( not ( = ?auto_499661 ?auto_499665 ) ) ( not ( = ?auto_499661 ?auto_499666 ) ) ( not ( = ?auto_499661 ?auto_499667 ) ) ( not ( = ?auto_499661 ?auto_499668 ) ) ( not ( = ?auto_499658 ?auto_499662 ) ) ( not ( = ?auto_499658 ?auto_499664 ) ) ( not ( = ?auto_499658 ?auto_499663 ) ) ( not ( = ?auto_499658 ?auto_499665 ) ) ( not ( = ?auto_499658 ?auto_499666 ) ) ( not ( = ?auto_499658 ?auto_499667 ) ) ( not ( = ?auto_499658 ?auto_499668 ) ) ( not ( = ?auto_499662 ?auto_499664 ) ) ( not ( = ?auto_499662 ?auto_499663 ) ) ( not ( = ?auto_499662 ?auto_499665 ) ) ( not ( = ?auto_499662 ?auto_499666 ) ) ( not ( = ?auto_499662 ?auto_499667 ) ) ( not ( = ?auto_499662 ?auto_499668 ) ) ( not ( = ?auto_499664 ?auto_499663 ) ) ( not ( = ?auto_499664 ?auto_499665 ) ) ( not ( = ?auto_499664 ?auto_499666 ) ) ( not ( = ?auto_499664 ?auto_499667 ) ) ( not ( = ?auto_499664 ?auto_499668 ) ) ( not ( = ?auto_499663 ?auto_499665 ) ) ( not ( = ?auto_499663 ?auto_499666 ) ) ( not ( = ?auto_499663 ?auto_499667 ) ) ( not ( = ?auto_499663 ?auto_499668 ) ) ( not ( = ?auto_499665 ?auto_499666 ) ) ( not ( = ?auto_499665 ?auto_499667 ) ) ( not ( = ?auto_499665 ?auto_499668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_499666 ?auto_499667 ?auto_499668 )
      ( MAKE-10CRATE-VERIFY ?auto_499659 ?auto_499660 ?auto_499661 ?auto_499658 ?auto_499662 ?auto_499664 ?auto_499663 ?auto_499665 ?auto_499666 ?auto_499667 ?auto_499668 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_499784 - SURFACE
      ?auto_499785 - SURFACE
      ?auto_499786 - SURFACE
      ?auto_499783 - SURFACE
      ?auto_499787 - SURFACE
      ?auto_499789 - SURFACE
      ?auto_499788 - SURFACE
      ?auto_499790 - SURFACE
      ?auto_499791 - SURFACE
      ?auto_499792 - SURFACE
      ?auto_499793 - SURFACE
    )
    :vars
    (
      ?auto_499797 - HOIST
      ?auto_499799 - PLACE
      ?auto_499796 - TRUCK
      ?auto_499795 - PLACE
      ?auto_499798 - HOIST
      ?auto_499794 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_499797 ?auto_499799 ) ( SURFACE-AT ?auto_499792 ?auto_499799 ) ( CLEAR ?auto_499792 ) ( IS-CRATE ?auto_499793 ) ( not ( = ?auto_499792 ?auto_499793 ) ) ( AVAILABLE ?auto_499797 ) ( ON ?auto_499792 ?auto_499791 ) ( not ( = ?auto_499791 ?auto_499792 ) ) ( not ( = ?auto_499791 ?auto_499793 ) ) ( TRUCK-AT ?auto_499796 ?auto_499795 ) ( not ( = ?auto_499795 ?auto_499799 ) ) ( HOIST-AT ?auto_499798 ?auto_499795 ) ( not ( = ?auto_499797 ?auto_499798 ) ) ( AVAILABLE ?auto_499798 ) ( SURFACE-AT ?auto_499793 ?auto_499795 ) ( ON ?auto_499793 ?auto_499794 ) ( CLEAR ?auto_499793 ) ( not ( = ?auto_499792 ?auto_499794 ) ) ( not ( = ?auto_499793 ?auto_499794 ) ) ( not ( = ?auto_499791 ?auto_499794 ) ) ( ON ?auto_499785 ?auto_499784 ) ( ON ?auto_499786 ?auto_499785 ) ( ON ?auto_499783 ?auto_499786 ) ( ON ?auto_499787 ?auto_499783 ) ( ON ?auto_499789 ?auto_499787 ) ( ON ?auto_499788 ?auto_499789 ) ( ON ?auto_499790 ?auto_499788 ) ( ON ?auto_499791 ?auto_499790 ) ( not ( = ?auto_499784 ?auto_499785 ) ) ( not ( = ?auto_499784 ?auto_499786 ) ) ( not ( = ?auto_499784 ?auto_499783 ) ) ( not ( = ?auto_499784 ?auto_499787 ) ) ( not ( = ?auto_499784 ?auto_499789 ) ) ( not ( = ?auto_499784 ?auto_499788 ) ) ( not ( = ?auto_499784 ?auto_499790 ) ) ( not ( = ?auto_499784 ?auto_499791 ) ) ( not ( = ?auto_499784 ?auto_499792 ) ) ( not ( = ?auto_499784 ?auto_499793 ) ) ( not ( = ?auto_499784 ?auto_499794 ) ) ( not ( = ?auto_499785 ?auto_499786 ) ) ( not ( = ?auto_499785 ?auto_499783 ) ) ( not ( = ?auto_499785 ?auto_499787 ) ) ( not ( = ?auto_499785 ?auto_499789 ) ) ( not ( = ?auto_499785 ?auto_499788 ) ) ( not ( = ?auto_499785 ?auto_499790 ) ) ( not ( = ?auto_499785 ?auto_499791 ) ) ( not ( = ?auto_499785 ?auto_499792 ) ) ( not ( = ?auto_499785 ?auto_499793 ) ) ( not ( = ?auto_499785 ?auto_499794 ) ) ( not ( = ?auto_499786 ?auto_499783 ) ) ( not ( = ?auto_499786 ?auto_499787 ) ) ( not ( = ?auto_499786 ?auto_499789 ) ) ( not ( = ?auto_499786 ?auto_499788 ) ) ( not ( = ?auto_499786 ?auto_499790 ) ) ( not ( = ?auto_499786 ?auto_499791 ) ) ( not ( = ?auto_499786 ?auto_499792 ) ) ( not ( = ?auto_499786 ?auto_499793 ) ) ( not ( = ?auto_499786 ?auto_499794 ) ) ( not ( = ?auto_499783 ?auto_499787 ) ) ( not ( = ?auto_499783 ?auto_499789 ) ) ( not ( = ?auto_499783 ?auto_499788 ) ) ( not ( = ?auto_499783 ?auto_499790 ) ) ( not ( = ?auto_499783 ?auto_499791 ) ) ( not ( = ?auto_499783 ?auto_499792 ) ) ( not ( = ?auto_499783 ?auto_499793 ) ) ( not ( = ?auto_499783 ?auto_499794 ) ) ( not ( = ?auto_499787 ?auto_499789 ) ) ( not ( = ?auto_499787 ?auto_499788 ) ) ( not ( = ?auto_499787 ?auto_499790 ) ) ( not ( = ?auto_499787 ?auto_499791 ) ) ( not ( = ?auto_499787 ?auto_499792 ) ) ( not ( = ?auto_499787 ?auto_499793 ) ) ( not ( = ?auto_499787 ?auto_499794 ) ) ( not ( = ?auto_499789 ?auto_499788 ) ) ( not ( = ?auto_499789 ?auto_499790 ) ) ( not ( = ?auto_499789 ?auto_499791 ) ) ( not ( = ?auto_499789 ?auto_499792 ) ) ( not ( = ?auto_499789 ?auto_499793 ) ) ( not ( = ?auto_499789 ?auto_499794 ) ) ( not ( = ?auto_499788 ?auto_499790 ) ) ( not ( = ?auto_499788 ?auto_499791 ) ) ( not ( = ?auto_499788 ?auto_499792 ) ) ( not ( = ?auto_499788 ?auto_499793 ) ) ( not ( = ?auto_499788 ?auto_499794 ) ) ( not ( = ?auto_499790 ?auto_499791 ) ) ( not ( = ?auto_499790 ?auto_499792 ) ) ( not ( = ?auto_499790 ?auto_499793 ) ) ( not ( = ?auto_499790 ?auto_499794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_499791 ?auto_499792 ?auto_499793 )
      ( MAKE-10CRATE-VERIFY ?auto_499784 ?auto_499785 ?auto_499786 ?auto_499783 ?auto_499787 ?auto_499789 ?auto_499788 ?auto_499790 ?auto_499791 ?auto_499792 ?auto_499793 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_499910 - SURFACE
      ?auto_499911 - SURFACE
      ?auto_499912 - SURFACE
      ?auto_499909 - SURFACE
      ?auto_499913 - SURFACE
      ?auto_499915 - SURFACE
      ?auto_499914 - SURFACE
      ?auto_499916 - SURFACE
      ?auto_499917 - SURFACE
      ?auto_499918 - SURFACE
      ?auto_499919 - SURFACE
    )
    :vars
    (
      ?auto_499921 - HOIST
      ?auto_499922 - PLACE
      ?auto_499923 - PLACE
      ?auto_499920 - HOIST
      ?auto_499924 - SURFACE
      ?auto_499925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_499921 ?auto_499922 ) ( SURFACE-AT ?auto_499918 ?auto_499922 ) ( CLEAR ?auto_499918 ) ( IS-CRATE ?auto_499919 ) ( not ( = ?auto_499918 ?auto_499919 ) ) ( AVAILABLE ?auto_499921 ) ( ON ?auto_499918 ?auto_499917 ) ( not ( = ?auto_499917 ?auto_499918 ) ) ( not ( = ?auto_499917 ?auto_499919 ) ) ( not ( = ?auto_499923 ?auto_499922 ) ) ( HOIST-AT ?auto_499920 ?auto_499923 ) ( not ( = ?auto_499921 ?auto_499920 ) ) ( AVAILABLE ?auto_499920 ) ( SURFACE-AT ?auto_499919 ?auto_499923 ) ( ON ?auto_499919 ?auto_499924 ) ( CLEAR ?auto_499919 ) ( not ( = ?auto_499918 ?auto_499924 ) ) ( not ( = ?auto_499919 ?auto_499924 ) ) ( not ( = ?auto_499917 ?auto_499924 ) ) ( TRUCK-AT ?auto_499925 ?auto_499922 ) ( ON ?auto_499911 ?auto_499910 ) ( ON ?auto_499912 ?auto_499911 ) ( ON ?auto_499909 ?auto_499912 ) ( ON ?auto_499913 ?auto_499909 ) ( ON ?auto_499915 ?auto_499913 ) ( ON ?auto_499914 ?auto_499915 ) ( ON ?auto_499916 ?auto_499914 ) ( ON ?auto_499917 ?auto_499916 ) ( not ( = ?auto_499910 ?auto_499911 ) ) ( not ( = ?auto_499910 ?auto_499912 ) ) ( not ( = ?auto_499910 ?auto_499909 ) ) ( not ( = ?auto_499910 ?auto_499913 ) ) ( not ( = ?auto_499910 ?auto_499915 ) ) ( not ( = ?auto_499910 ?auto_499914 ) ) ( not ( = ?auto_499910 ?auto_499916 ) ) ( not ( = ?auto_499910 ?auto_499917 ) ) ( not ( = ?auto_499910 ?auto_499918 ) ) ( not ( = ?auto_499910 ?auto_499919 ) ) ( not ( = ?auto_499910 ?auto_499924 ) ) ( not ( = ?auto_499911 ?auto_499912 ) ) ( not ( = ?auto_499911 ?auto_499909 ) ) ( not ( = ?auto_499911 ?auto_499913 ) ) ( not ( = ?auto_499911 ?auto_499915 ) ) ( not ( = ?auto_499911 ?auto_499914 ) ) ( not ( = ?auto_499911 ?auto_499916 ) ) ( not ( = ?auto_499911 ?auto_499917 ) ) ( not ( = ?auto_499911 ?auto_499918 ) ) ( not ( = ?auto_499911 ?auto_499919 ) ) ( not ( = ?auto_499911 ?auto_499924 ) ) ( not ( = ?auto_499912 ?auto_499909 ) ) ( not ( = ?auto_499912 ?auto_499913 ) ) ( not ( = ?auto_499912 ?auto_499915 ) ) ( not ( = ?auto_499912 ?auto_499914 ) ) ( not ( = ?auto_499912 ?auto_499916 ) ) ( not ( = ?auto_499912 ?auto_499917 ) ) ( not ( = ?auto_499912 ?auto_499918 ) ) ( not ( = ?auto_499912 ?auto_499919 ) ) ( not ( = ?auto_499912 ?auto_499924 ) ) ( not ( = ?auto_499909 ?auto_499913 ) ) ( not ( = ?auto_499909 ?auto_499915 ) ) ( not ( = ?auto_499909 ?auto_499914 ) ) ( not ( = ?auto_499909 ?auto_499916 ) ) ( not ( = ?auto_499909 ?auto_499917 ) ) ( not ( = ?auto_499909 ?auto_499918 ) ) ( not ( = ?auto_499909 ?auto_499919 ) ) ( not ( = ?auto_499909 ?auto_499924 ) ) ( not ( = ?auto_499913 ?auto_499915 ) ) ( not ( = ?auto_499913 ?auto_499914 ) ) ( not ( = ?auto_499913 ?auto_499916 ) ) ( not ( = ?auto_499913 ?auto_499917 ) ) ( not ( = ?auto_499913 ?auto_499918 ) ) ( not ( = ?auto_499913 ?auto_499919 ) ) ( not ( = ?auto_499913 ?auto_499924 ) ) ( not ( = ?auto_499915 ?auto_499914 ) ) ( not ( = ?auto_499915 ?auto_499916 ) ) ( not ( = ?auto_499915 ?auto_499917 ) ) ( not ( = ?auto_499915 ?auto_499918 ) ) ( not ( = ?auto_499915 ?auto_499919 ) ) ( not ( = ?auto_499915 ?auto_499924 ) ) ( not ( = ?auto_499914 ?auto_499916 ) ) ( not ( = ?auto_499914 ?auto_499917 ) ) ( not ( = ?auto_499914 ?auto_499918 ) ) ( not ( = ?auto_499914 ?auto_499919 ) ) ( not ( = ?auto_499914 ?auto_499924 ) ) ( not ( = ?auto_499916 ?auto_499917 ) ) ( not ( = ?auto_499916 ?auto_499918 ) ) ( not ( = ?auto_499916 ?auto_499919 ) ) ( not ( = ?auto_499916 ?auto_499924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_499917 ?auto_499918 ?auto_499919 )
      ( MAKE-10CRATE-VERIFY ?auto_499910 ?auto_499911 ?auto_499912 ?auto_499909 ?auto_499913 ?auto_499915 ?auto_499914 ?auto_499916 ?auto_499917 ?auto_499918 ?auto_499919 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_500036 - SURFACE
      ?auto_500037 - SURFACE
      ?auto_500038 - SURFACE
      ?auto_500035 - SURFACE
      ?auto_500039 - SURFACE
      ?auto_500041 - SURFACE
      ?auto_500040 - SURFACE
      ?auto_500042 - SURFACE
      ?auto_500043 - SURFACE
      ?auto_500044 - SURFACE
      ?auto_500045 - SURFACE
    )
    :vars
    (
      ?auto_500051 - HOIST
      ?auto_500050 - PLACE
      ?auto_500047 - PLACE
      ?auto_500046 - HOIST
      ?auto_500048 - SURFACE
      ?auto_500049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_500051 ?auto_500050 ) ( IS-CRATE ?auto_500045 ) ( not ( = ?auto_500044 ?auto_500045 ) ) ( not ( = ?auto_500043 ?auto_500044 ) ) ( not ( = ?auto_500043 ?auto_500045 ) ) ( not ( = ?auto_500047 ?auto_500050 ) ) ( HOIST-AT ?auto_500046 ?auto_500047 ) ( not ( = ?auto_500051 ?auto_500046 ) ) ( AVAILABLE ?auto_500046 ) ( SURFACE-AT ?auto_500045 ?auto_500047 ) ( ON ?auto_500045 ?auto_500048 ) ( CLEAR ?auto_500045 ) ( not ( = ?auto_500044 ?auto_500048 ) ) ( not ( = ?auto_500045 ?auto_500048 ) ) ( not ( = ?auto_500043 ?auto_500048 ) ) ( TRUCK-AT ?auto_500049 ?auto_500050 ) ( SURFACE-AT ?auto_500043 ?auto_500050 ) ( CLEAR ?auto_500043 ) ( LIFTING ?auto_500051 ?auto_500044 ) ( IS-CRATE ?auto_500044 ) ( ON ?auto_500037 ?auto_500036 ) ( ON ?auto_500038 ?auto_500037 ) ( ON ?auto_500035 ?auto_500038 ) ( ON ?auto_500039 ?auto_500035 ) ( ON ?auto_500041 ?auto_500039 ) ( ON ?auto_500040 ?auto_500041 ) ( ON ?auto_500042 ?auto_500040 ) ( ON ?auto_500043 ?auto_500042 ) ( not ( = ?auto_500036 ?auto_500037 ) ) ( not ( = ?auto_500036 ?auto_500038 ) ) ( not ( = ?auto_500036 ?auto_500035 ) ) ( not ( = ?auto_500036 ?auto_500039 ) ) ( not ( = ?auto_500036 ?auto_500041 ) ) ( not ( = ?auto_500036 ?auto_500040 ) ) ( not ( = ?auto_500036 ?auto_500042 ) ) ( not ( = ?auto_500036 ?auto_500043 ) ) ( not ( = ?auto_500036 ?auto_500044 ) ) ( not ( = ?auto_500036 ?auto_500045 ) ) ( not ( = ?auto_500036 ?auto_500048 ) ) ( not ( = ?auto_500037 ?auto_500038 ) ) ( not ( = ?auto_500037 ?auto_500035 ) ) ( not ( = ?auto_500037 ?auto_500039 ) ) ( not ( = ?auto_500037 ?auto_500041 ) ) ( not ( = ?auto_500037 ?auto_500040 ) ) ( not ( = ?auto_500037 ?auto_500042 ) ) ( not ( = ?auto_500037 ?auto_500043 ) ) ( not ( = ?auto_500037 ?auto_500044 ) ) ( not ( = ?auto_500037 ?auto_500045 ) ) ( not ( = ?auto_500037 ?auto_500048 ) ) ( not ( = ?auto_500038 ?auto_500035 ) ) ( not ( = ?auto_500038 ?auto_500039 ) ) ( not ( = ?auto_500038 ?auto_500041 ) ) ( not ( = ?auto_500038 ?auto_500040 ) ) ( not ( = ?auto_500038 ?auto_500042 ) ) ( not ( = ?auto_500038 ?auto_500043 ) ) ( not ( = ?auto_500038 ?auto_500044 ) ) ( not ( = ?auto_500038 ?auto_500045 ) ) ( not ( = ?auto_500038 ?auto_500048 ) ) ( not ( = ?auto_500035 ?auto_500039 ) ) ( not ( = ?auto_500035 ?auto_500041 ) ) ( not ( = ?auto_500035 ?auto_500040 ) ) ( not ( = ?auto_500035 ?auto_500042 ) ) ( not ( = ?auto_500035 ?auto_500043 ) ) ( not ( = ?auto_500035 ?auto_500044 ) ) ( not ( = ?auto_500035 ?auto_500045 ) ) ( not ( = ?auto_500035 ?auto_500048 ) ) ( not ( = ?auto_500039 ?auto_500041 ) ) ( not ( = ?auto_500039 ?auto_500040 ) ) ( not ( = ?auto_500039 ?auto_500042 ) ) ( not ( = ?auto_500039 ?auto_500043 ) ) ( not ( = ?auto_500039 ?auto_500044 ) ) ( not ( = ?auto_500039 ?auto_500045 ) ) ( not ( = ?auto_500039 ?auto_500048 ) ) ( not ( = ?auto_500041 ?auto_500040 ) ) ( not ( = ?auto_500041 ?auto_500042 ) ) ( not ( = ?auto_500041 ?auto_500043 ) ) ( not ( = ?auto_500041 ?auto_500044 ) ) ( not ( = ?auto_500041 ?auto_500045 ) ) ( not ( = ?auto_500041 ?auto_500048 ) ) ( not ( = ?auto_500040 ?auto_500042 ) ) ( not ( = ?auto_500040 ?auto_500043 ) ) ( not ( = ?auto_500040 ?auto_500044 ) ) ( not ( = ?auto_500040 ?auto_500045 ) ) ( not ( = ?auto_500040 ?auto_500048 ) ) ( not ( = ?auto_500042 ?auto_500043 ) ) ( not ( = ?auto_500042 ?auto_500044 ) ) ( not ( = ?auto_500042 ?auto_500045 ) ) ( not ( = ?auto_500042 ?auto_500048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_500043 ?auto_500044 ?auto_500045 )
      ( MAKE-10CRATE-VERIFY ?auto_500036 ?auto_500037 ?auto_500038 ?auto_500035 ?auto_500039 ?auto_500041 ?auto_500040 ?auto_500042 ?auto_500043 ?auto_500044 ?auto_500045 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_500162 - SURFACE
      ?auto_500163 - SURFACE
      ?auto_500164 - SURFACE
      ?auto_500161 - SURFACE
      ?auto_500165 - SURFACE
      ?auto_500167 - SURFACE
      ?auto_500166 - SURFACE
      ?auto_500168 - SURFACE
      ?auto_500169 - SURFACE
      ?auto_500170 - SURFACE
      ?auto_500171 - SURFACE
    )
    :vars
    (
      ?auto_500175 - HOIST
      ?auto_500176 - PLACE
      ?auto_500172 - PLACE
      ?auto_500174 - HOIST
      ?auto_500173 - SURFACE
      ?auto_500177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_500175 ?auto_500176 ) ( IS-CRATE ?auto_500171 ) ( not ( = ?auto_500170 ?auto_500171 ) ) ( not ( = ?auto_500169 ?auto_500170 ) ) ( not ( = ?auto_500169 ?auto_500171 ) ) ( not ( = ?auto_500172 ?auto_500176 ) ) ( HOIST-AT ?auto_500174 ?auto_500172 ) ( not ( = ?auto_500175 ?auto_500174 ) ) ( AVAILABLE ?auto_500174 ) ( SURFACE-AT ?auto_500171 ?auto_500172 ) ( ON ?auto_500171 ?auto_500173 ) ( CLEAR ?auto_500171 ) ( not ( = ?auto_500170 ?auto_500173 ) ) ( not ( = ?auto_500171 ?auto_500173 ) ) ( not ( = ?auto_500169 ?auto_500173 ) ) ( TRUCK-AT ?auto_500177 ?auto_500176 ) ( SURFACE-AT ?auto_500169 ?auto_500176 ) ( CLEAR ?auto_500169 ) ( IS-CRATE ?auto_500170 ) ( AVAILABLE ?auto_500175 ) ( IN ?auto_500170 ?auto_500177 ) ( ON ?auto_500163 ?auto_500162 ) ( ON ?auto_500164 ?auto_500163 ) ( ON ?auto_500161 ?auto_500164 ) ( ON ?auto_500165 ?auto_500161 ) ( ON ?auto_500167 ?auto_500165 ) ( ON ?auto_500166 ?auto_500167 ) ( ON ?auto_500168 ?auto_500166 ) ( ON ?auto_500169 ?auto_500168 ) ( not ( = ?auto_500162 ?auto_500163 ) ) ( not ( = ?auto_500162 ?auto_500164 ) ) ( not ( = ?auto_500162 ?auto_500161 ) ) ( not ( = ?auto_500162 ?auto_500165 ) ) ( not ( = ?auto_500162 ?auto_500167 ) ) ( not ( = ?auto_500162 ?auto_500166 ) ) ( not ( = ?auto_500162 ?auto_500168 ) ) ( not ( = ?auto_500162 ?auto_500169 ) ) ( not ( = ?auto_500162 ?auto_500170 ) ) ( not ( = ?auto_500162 ?auto_500171 ) ) ( not ( = ?auto_500162 ?auto_500173 ) ) ( not ( = ?auto_500163 ?auto_500164 ) ) ( not ( = ?auto_500163 ?auto_500161 ) ) ( not ( = ?auto_500163 ?auto_500165 ) ) ( not ( = ?auto_500163 ?auto_500167 ) ) ( not ( = ?auto_500163 ?auto_500166 ) ) ( not ( = ?auto_500163 ?auto_500168 ) ) ( not ( = ?auto_500163 ?auto_500169 ) ) ( not ( = ?auto_500163 ?auto_500170 ) ) ( not ( = ?auto_500163 ?auto_500171 ) ) ( not ( = ?auto_500163 ?auto_500173 ) ) ( not ( = ?auto_500164 ?auto_500161 ) ) ( not ( = ?auto_500164 ?auto_500165 ) ) ( not ( = ?auto_500164 ?auto_500167 ) ) ( not ( = ?auto_500164 ?auto_500166 ) ) ( not ( = ?auto_500164 ?auto_500168 ) ) ( not ( = ?auto_500164 ?auto_500169 ) ) ( not ( = ?auto_500164 ?auto_500170 ) ) ( not ( = ?auto_500164 ?auto_500171 ) ) ( not ( = ?auto_500164 ?auto_500173 ) ) ( not ( = ?auto_500161 ?auto_500165 ) ) ( not ( = ?auto_500161 ?auto_500167 ) ) ( not ( = ?auto_500161 ?auto_500166 ) ) ( not ( = ?auto_500161 ?auto_500168 ) ) ( not ( = ?auto_500161 ?auto_500169 ) ) ( not ( = ?auto_500161 ?auto_500170 ) ) ( not ( = ?auto_500161 ?auto_500171 ) ) ( not ( = ?auto_500161 ?auto_500173 ) ) ( not ( = ?auto_500165 ?auto_500167 ) ) ( not ( = ?auto_500165 ?auto_500166 ) ) ( not ( = ?auto_500165 ?auto_500168 ) ) ( not ( = ?auto_500165 ?auto_500169 ) ) ( not ( = ?auto_500165 ?auto_500170 ) ) ( not ( = ?auto_500165 ?auto_500171 ) ) ( not ( = ?auto_500165 ?auto_500173 ) ) ( not ( = ?auto_500167 ?auto_500166 ) ) ( not ( = ?auto_500167 ?auto_500168 ) ) ( not ( = ?auto_500167 ?auto_500169 ) ) ( not ( = ?auto_500167 ?auto_500170 ) ) ( not ( = ?auto_500167 ?auto_500171 ) ) ( not ( = ?auto_500167 ?auto_500173 ) ) ( not ( = ?auto_500166 ?auto_500168 ) ) ( not ( = ?auto_500166 ?auto_500169 ) ) ( not ( = ?auto_500166 ?auto_500170 ) ) ( not ( = ?auto_500166 ?auto_500171 ) ) ( not ( = ?auto_500166 ?auto_500173 ) ) ( not ( = ?auto_500168 ?auto_500169 ) ) ( not ( = ?auto_500168 ?auto_500170 ) ) ( not ( = ?auto_500168 ?auto_500171 ) ) ( not ( = ?auto_500168 ?auto_500173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_500169 ?auto_500170 ?auto_500171 )
      ( MAKE-10CRATE-VERIFY ?auto_500162 ?auto_500163 ?auto_500164 ?auto_500161 ?auto_500165 ?auto_500167 ?auto_500166 ?auto_500168 ?auto_500169 ?auto_500170 ?auto_500171 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507346 - SURFACE
      ?auto_507347 - SURFACE
      ?auto_507348 - SURFACE
      ?auto_507345 - SURFACE
      ?auto_507349 - SURFACE
      ?auto_507351 - SURFACE
      ?auto_507350 - SURFACE
      ?auto_507352 - SURFACE
      ?auto_507353 - SURFACE
      ?auto_507354 - SURFACE
      ?auto_507355 - SURFACE
      ?auto_507356 - SURFACE
    )
    :vars
    (
      ?auto_507357 - HOIST
      ?auto_507358 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_507357 ?auto_507358 ) ( SURFACE-AT ?auto_507355 ?auto_507358 ) ( CLEAR ?auto_507355 ) ( LIFTING ?auto_507357 ?auto_507356 ) ( IS-CRATE ?auto_507356 ) ( not ( = ?auto_507355 ?auto_507356 ) ) ( ON ?auto_507347 ?auto_507346 ) ( ON ?auto_507348 ?auto_507347 ) ( ON ?auto_507345 ?auto_507348 ) ( ON ?auto_507349 ?auto_507345 ) ( ON ?auto_507351 ?auto_507349 ) ( ON ?auto_507350 ?auto_507351 ) ( ON ?auto_507352 ?auto_507350 ) ( ON ?auto_507353 ?auto_507352 ) ( ON ?auto_507354 ?auto_507353 ) ( ON ?auto_507355 ?auto_507354 ) ( not ( = ?auto_507346 ?auto_507347 ) ) ( not ( = ?auto_507346 ?auto_507348 ) ) ( not ( = ?auto_507346 ?auto_507345 ) ) ( not ( = ?auto_507346 ?auto_507349 ) ) ( not ( = ?auto_507346 ?auto_507351 ) ) ( not ( = ?auto_507346 ?auto_507350 ) ) ( not ( = ?auto_507346 ?auto_507352 ) ) ( not ( = ?auto_507346 ?auto_507353 ) ) ( not ( = ?auto_507346 ?auto_507354 ) ) ( not ( = ?auto_507346 ?auto_507355 ) ) ( not ( = ?auto_507346 ?auto_507356 ) ) ( not ( = ?auto_507347 ?auto_507348 ) ) ( not ( = ?auto_507347 ?auto_507345 ) ) ( not ( = ?auto_507347 ?auto_507349 ) ) ( not ( = ?auto_507347 ?auto_507351 ) ) ( not ( = ?auto_507347 ?auto_507350 ) ) ( not ( = ?auto_507347 ?auto_507352 ) ) ( not ( = ?auto_507347 ?auto_507353 ) ) ( not ( = ?auto_507347 ?auto_507354 ) ) ( not ( = ?auto_507347 ?auto_507355 ) ) ( not ( = ?auto_507347 ?auto_507356 ) ) ( not ( = ?auto_507348 ?auto_507345 ) ) ( not ( = ?auto_507348 ?auto_507349 ) ) ( not ( = ?auto_507348 ?auto_507351 ) ) ( not ( = ?auto_507348 ?auto_507350 ) ) ( not ( = ?auto_507348 ?auto_507352 ) ) ( not ( = ?auto_507348 ?auto_507353 ) ) ( not ( = ?auto_507348 ?auto_507354 ) ) ( not ( = ?auto_507348 ?auto_507355 ) ) ( not ( = ?auto_507348 ?auto_507356 ) ) ( not ( = ?auto_507345 ?auto_507349 ) ) ( not ( = ?auto_507345 ?auto_507351 ) ) ( not ( = ?auto_507345 ?auto_507350 ) ) ( not ( = ?auto_507345 ?auto_507352 ) ) ( not ( = ?auto_507345 ?auto_507353 ) ) ( not ( = ?auto_507345 ?auto_507354 ) ) ( not ( = ?auto_507345 ?auto_507355 ) ) ( not ( = ?auto_507345 ?auto_507356 ) ) ( not ( = ?auto_507349 ?auto_507351 ) ) ( not ( = ?auto_507349 ?auto_507350 ) ) ( not ( = ?auto_507349 ?auto_507352 ) ) ( not ( = ?auto_507349 ?auto_507353 ) ) ( not ( = ?auto_507349 ?auto_507354 ) ) ( not ( = ?auto_507349 ?auto_507355 ) ) ( not ( = ?auto_507349 ?auto_507356 ) ) ( not ( = ?auto_507351 ?auto_507350 ) ) ( not ( = ?auto_507351 ?auto_507352 ) ) ( not ( = ?auto_507351 ?auto_507353 ) ) ( not ( = ?auto_507351 ?auto_507354 ) ) ( not ( = ?auto_507351 ?auto_507355 ) ) ( not ( = ?auto_507351 ?auto_507356 ) ) ( not ( = ?auto_507350 ?auto_507352 ) ) ( not ( = ?auto_507350 ?auto_507353 ) ) ( not ( = ?auto_507350 ?auto_507354 ) ) ( not ( = ?auto_507350 ?auto_507355 ) ) ( not ( = ?auto_507350 ?auto_507356 ) ) ( not ( = ?auto_507352 ?auto_507353 ) ) ( not ( = ?auto_507352 ?auto_507354 ) ) ( not ( = ?auto_507352 ?auto_507355 ) ) ( not ( = ?auto_507352 ?auto_507356 ) ) ( not ( = ?auto_507353 ?auto_507354 ) ) ( not ( = ?auto_507353 ?auto_507355 ) ) ( not ( = ?auto_507353 ?auto_507356 ) ) ( not ( = ?auto_507354 ?auto_507355 ) ) ( not ( = ?auto_507354 ?auto_507356 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_507355 ?auto_507356 )
      ( MAKE-11CRATE-VERIFY ?auto_507346 ?auto_507347 ?auto_507348 ?auto_507345 ?auto_507349 ?auto_507351 ?auto_507350 ?auto_507352 ?auto_507353 ?auto_507354 ?auto_507355 ?auto_507356 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507455 - SURFACE
      ?auto_507456 - SURFACE
      ?auto_507457 - SURFACE
      ?auto_507454 - SURFACE
      ?auto_507458 - SURFACE
      ?auto_507460 - SURFACE
      ?auto_507459 - SURFACE
      ?auto_507461 - SURFACE
      ?auto_507462 - SURFACE
      ?auto_507463 - SURFACE
      ?auto_507464 - SURFACE
      ?auto_507465 - SURFACE
    )
    :vars
    (
      ?auto_507467 - HOIST
      ?auto_507468 - PLACE
      ?auto_507466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_507467 ?auto_507468 ) ( SURFACE-AT ?auto_507464 ?auto_507468 ) ( CLEAR ?auto_507464 ) ( IS-CRATE ?auto_507465 ) ( not ( = ?auto_507464 ?auto_507465 ) ) ( TRUCK-AT ?auto_507466 ?auto_507468 ) ( AVAILABLE ?auto_507467 ) ( IN ?auto_507465 ?auto_507466 ) ( ON ?auto_507464 ?auto_507463 ) ( not ( = ?auto_507463 ?auto_507464 ) ) ( not ( = ?auto_507463 ?auto_507465 ) ) ( ON ?auto_507456 ?auto_507455 ) ( ON ?auto_507457 ?auto_507456 ) ( ON ?auto_507454 ?auto_507457 ) ( ON ?auto_507458 ?auto_507454 ) ( ON ?auto_507460 ?auto_507458 ) ( ON ?auto_507459 ?auto_507460 ) ( ON ?auto_507461 ?auto_507459 ) ( ON ?auto_507462 ?auto_507461 ) ( ON ?auto_507463 ?auto_507462 ) ( not ( = ?auto_507455 ?auto_507456 ) ) ( not ( = ?auto_507455 ?auto_507457 ) ) ( not ( = ?auto_507455 ?auto_507454 ) ) ( not ( = ?auto_507455 ?auto_507458 ) ) ( not ( = ?auto_507455 ?auto_507460 ) ) ( not ( = ?auto_507455 ?auto_507459 ) ) ( not ( = ?auto_507455 ?auto_507461 ) ) ( not ( = ?auto_507455 ?auto_507462 ) ) ( not ( = ?auto_507455 ?auto_507463 ) ) ( not ( = ?auto_507455 ?auto_507464 ) ) ( not ( = ?auto_507455 ?auto_507465 ) ) ( not ( = ?auto_507456 ?auto_507457 ) ) ( not ( = ?auto_507456 ?auto_507454 ) ) ( not ( = ?auto_507456 ?auto_507458 ) ) ( not ( = ?auto_507456 ?auto_507460 ) ) ( not ( = ?auto_507456 ?auto_507459 ) ) ( not ( = ?auto_507456 ?auto_507461 ) ) ( not ( = ?auto_507456 ?auto_507462 ) ) ( not ( = ?auto_507456 ?auto_507463 ) ) ( not ( = ?auto_507456 ?auto_507464 ) ) ( not ( = ?auto_507456 ?auto_507465 ) ) ( not ( = ?auto_507457 ?auto_507454 ) ) ( not ( = ?auto_507457 ?auto_507458 ) ) ( not ( = ?auto_507457 ?auto_507460 ) ) ( not ( = ?auto_507457 ?auto_507459 ) ) ( not ( = ?auto_507457 ?auto_507461 ) ) ( not ( = ?auto_507457 ?auto_507462 ) ) ( not ( = ?auto_507457 ?auto_507463 ) ) ( not ( = ?auto_507457 ?auto_507464 ) ) ( not ( = ?auto_507457 ?auto_507465 ) ) ( not ( = ?auto_507454 ?auto_507458 ) ) ( not ( = ?auto_507454 ?auto_507460 ) ) ( not ( = ?auto_507454 ?auto_507459 ) ) ( not ( = ?auto_507454 ?auto_507461 ) ) ( not ( = ?auto_507454 ?auto_507462 ) ) ( not ( = ?auto_507454 ?auto_507463 ) ) ( not ( = ?auto_507454 ?auto_507464 ) ) ( not ( = ?auto_507454 ?auto_507465 ) ) ( not ( = ?auto_507458 ?auto_507460 ) ) ( not ( = ?auto_507458 ?auto_507459 ) ) ( not ( = ?auto_507458 ?auto_507461 ) ) ( not ( = ?auto_507458 ?auto_507462 ) ) ( not ( = ?auto_507458 ?auto_507463 ) ) ( not ( = ?auto_507458 ?auto_507464 ) ) ( not ( = ?auto_507458 ?auto_507465 ) ) ( not ( = ?auto_507460 ?auto_507459 ) ) ( not ( = ?auto_507460 ?auto_507461 ) ) ( not ( = ?auto_507460 ?auto_507462 ) ) ( not ( = ?auto_507460 ?auto_507463 ) ) ( not ( = ?auto_507460 ?auto_507464 ) ) ( not ( = ?auto_507460 ?auto_507465 ) ) ( not ( = ?auto_507459 ?auto_507461 ) ) ( not ( = ?auto_507459 ?auto_507462 ) ) ( not ( = ?auto_507459 ?auto_507463 ) ) ( not ( = ?auto_507459 ?auto_507464 ) ) ( not ( = ?auto_507459 ?auto_507465 ) ) ( not ( = ?auto_507461 ?auto_507462 ) ) ( not ( = ?auto_507461 ?auto_507463 ) ) ( not ( = ?auto_507461 ?auto_507464 ) ) ( not ( = ?auto_507461 ?auto_507465 ) ) ( not ( = ?auto_507462 ?auto_507463 ) ) ( not ( = ?auto_507462 ?auto_507464 ) ) ( not ( = ?auto_507462 ?auto_507465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_507463 ?auto_507464 ?auto_507465 )
      ( MAKE-11CRATE-VERIFY ?auto_507455 ?auto_507456 ?auto_507457 ?auto_507454 ?auto_507458 ?auto_507460 ?auto_507459 ?auto_507461 ?auto_507462 ?auto_507463 ?auto_507464 ?auto_507465 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507576 - SURFACE
      ?auto_507577 - SURFACE
      ?auto_507578 - SURFACE
      ?auto_507575 - SURFACE
      ?auto_507579 - SURFACE
      ?auto_507581 - SURFACE
      ?auto_507580 - SURFACE
      ?auto_507582 - SURFACE
      ?auto_507583 - SURFACE
      ?auto_507584 - SURFACE
      ?auto_507585 - SURFACE
      ?auto_507586 - SURFACE
    )
    :vars
    (
      ?auto_507590 - HOIST
      ?auto_507589 - PLACE
      ?auto_507587 - TRUCK
      ?auto_507588 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_507590 ?auto_507589 ) ( SURFACE-AT ?auto_507585 ?auto_507589 ) ( CLEAR ?auto_507585 ) ( IS-CRATE ?auto_507586 ) ( not ( = ?auto_507585 ?auto_507586 ) ) ( AVAILABLE ?auto_507590 ) ( IN ?auto_507586 ?auto_507587 ) ( ON ?auto_507585 ?auto_507584 ) ( not ( = ?auto_507584 ?auto_507585 ) ) ( not ( = ?auto_507584 ?auto_507586 ) ) ( TRUCK-AT ?auto_507587 ?auto_507588 ) ( not ( = ?auto_507588 ?auto_507589 ) ) ( ON ?auto_507577 ?auto_507576 ) ( ON ?auto_507578 ?auto_507577 ) ( ON ?auto_507575 ?auto_507578 ) ( ON ?auto_507579 ?auto_507575 ) ( ON ?auto_507581 ?auto_507579 ) ( ON ?auto_507580 ?auto_507581 ) ( ON ?auto_507582 ?auto_507580 ) ( ON ?auto_507583 ?auto_507582 ) ( ON ?auto_507584 ?auto_507583 ) ( not ( = ?auto_507576 ?auto_507577 ) ) ( not ( = ?auto_507576 ?auto_507578 ) ) ( not ( = ?auto_507576 ?auto_507575 ) ) ( not ( = ?auto_507576 ?auto_507579 ) ) ( not ( = ?auto_507576 ?auto_507581 ) ) ( not ( = ?auto_507576 ?auto_507580 ) ) ( not ( = ?auto_507576 ?auto_507582 ) ) ( not ( = ?auto_507576 ?auto_507583 ) ) ( not ( = ?auto_507576 ?auto_507584 ) ) ( not ( = ?auto_507576 ?auto_507585 ) ) ( not ( = ?auto_507576 ?auto_507586 ) ) ( not ( = ?auto_507577 ?auto_507578 ) ) ( not ( = ?auto_507577 ?auto_507575 ) ) ( not ( = ?auto_507577 ?auto_507579 ) ) ( not ( = ?auto_507577 ?auto_507581 ) ) ( not ( = ?auto_507577 ?auto_507580 ) ) ( not ( = ?auto_507577 ?auto_507582 ) ) ( not ( = ?auto_507577 ?auto_507583 ) ) ( not ( = ?auto_507577 ?auto_507584 ) ) ( not ( = ?auto_507577 ?auto_507585 ) ) ( not ( = ?auto_507577 ?auto_507586 ) ) ( not ( = ?auto_507578 ?auto_507575 ) ) ( not ( = ?auto_507578 ?auto_507579 ) ) ( not ( = ?auto_507578 ?auto_507581 ) ) ( not ( = ?auto_507578 ?auto_507580 ) ) ( not ( = ?auto_507578 ?auto_507582 ) ) ( not ( = ?auto_507578 ?auto_507583 ) ) ( not ( = ?auto_507578 ?auto_507584 ) ) ( not ( = ?auto_507578 ?auto_507585 ) ) ( not ( = ?auto_507578 ?auto_507586 ) ) ( not ( = ?auto_507575 ?auto_507579 ) ) ( not ( = ?auto_507575 ?auto_507581 ) ) ( not ( = ?auto_507575 ?auto_507580 ) ) ( not ( = ?auto_507575 ?auto_507582 ) ) ( not ( = ?auto_507575 ?auto_507583 ) ) ( not ( = ?auto_507575 ?auto_507584 ) ) ( not ( = ?auto_507575 ?auto_507585 ) ) ( not ( = ?auto_507575 ?auto_507586 ) ) ( not ( = ?auto_507579 ?auto_507581 ) ) ( not ( = ?auto_507579 ?auto_507580 ) ) ( not ( = ?auto_507579 ?auto_507582 ) ) ( not ( = ?auto_507579 ?auto_507583 ) ) ( not ( = ?auto_507579 ?auto_507584 ) ) ( not ( = ?auto_507579 ?auto_507585 ) ) ( not ( = ?auto_507579 ?auto_507586 ) ) ( not ( = ?auto_507581 ?auto_507580 ) ) ( not ( = ?auto_507581 ?auto_507582 ) ) ( not ( = ?auto_507581 ?auto_507583 ) ) ( not ( = ?auto_507581 ?auto_507584 ) ) ( not ( = ?auto_507581 ?auto_507585 ) ) ( not ( = ?auto_507581 ?auto_507586 ) ) ( not ( = ?auto_507580 ?auto_507582 ) ) ( not ( = ?auto_507580 ?auto_507583 ) ) ( not ( = ?auto_507580 ?auto_507584 ) ) ( not ( = ?auto_507580 ?auto_507585 ) ) ( not ( = ?auto_507580 ?auto_507586 ) ) ( not ( = ?auto_507582 ?auto_507583 ) ) ( not ( = ?auto_507582 ?auto_507584 ) ) ( not ( = ?auto_507582 ?auto_507585 ) ) ( not ( = ?auto_507582 ?auto_507586 ) ) ( not ( = ?auto_507583 ?auto_507584 ) ) ( not ( = ?auto_507583 ?auto_507585 ) ) ( not ( = ?auto_507583 ?auto_507586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_507584 ?auto_507585 ?auto_507586 )
      ( MAKE-11CRATE-VERIFY ?auto_507576 ?auto_507577 ?auto_507578 ?auto_507575 ?auto_507579 ?auto_507581 ?auto_507580 ?auto_507582 ?auto_507583 ?auto_507584 ?auto_507585 ?auto_507586 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507708 - SURFACE
      ?auto_507709 - SURFACE
      ?auto_507710 - SURFACE
      ?auto_507707 - SURFACE
      ?auto_507711 - SURFACE
      ?auto_507713 - SURFACE
      ?auto_507712 - SURFACE
      ?auto_507714 - SURFACE
      ?auto_507715 - SURFACE
      ?auto_507716 - SURFACE
      ?auto_507717 - SURFACE
      ?auto_507718 - SURFACE
    )
    :vars
    (
      ?auto_507719 - HOIST
      ?auto_507722 - PLACE
      ?auto_507721 - TRUCK
      ?auto_507720 - PLACE
      ?auto_507723 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_507719 ?auto_507722 ) ( SURFACE-AT ?auto_507717 ?auto_507722 ) ( CLEAR ?auto_507717 ) ( IS-CRATE ?auto_507718 ) ( not ( = ?auto_507717 ?auto_507718 ) ) ( AVAILABLE ?auto_507719 ) ( ON ?auto_507717 ?auto_507716 ) ( not ( = ?auto_507716 ?auto_507717 ) ) ( not ( = ?auto_507716 ?auto_507718 ) ) ( TRUCK-AT ?auto_507721 ?auto_507720 ) ( not ( = ?auto_507720 ?auto_507722 ) ) ( HOIST-AT ?auto_507723 ?auto_507720 ) ( LIFTING ?auto_507723 ?auto_507718 ) ( not ( = ?auto_507719 ?auto_507723 ) ) ( ON ?auto_507709 ?auto_507708 ) ( ON ?auto_507710 ?auto_507709 ) ( ON ?auto_507707 ?auto_507710 ) ( ON ?auto_507711 ?auto_507707 ) ( ON ?auto_507713 ?auto_507711 ) ( ON ?auto_507712 ?auto_507713 ) ( ON ?auto_507714 ?auto_507712 ) ( ON ?auto_507715 ?auto_507714 ) ( ON ?auto_507716 ?auto_507715 ) ( not ( = ?auto_507708 ?auto_507709 ) ) ( not ( = ?auto_507708 ?auto_507710 ) ) ( not ( = ?auto_507708 ?auto_507707 ) ) ( not ( = ?auto_507708 ?auto_507711 ) ) ( not ( = ?auto_507708 ?auto_507713 ) ) ( not ( = ?auto_507708 ?auto_507712 ) ) ( not ( = ?auto_507708 ?auto_507714 ) ) ( not ( = ?auto_507708 ?auto_507715 ) ) ( not ( = ?auto_507708 ?auto_507716 ) ) ( not ( = ?auto_507708 ?auto_507717 ) ) ( not ( = ?auto_507708 ?auto_507718 ) ) ( not ( = ?auto_507709 ?auto_507710 ) ) ( not ( = ?auto_507709 ?auto_507707 ) ) ( not ( = ?auto_507709 ?auto_507711 ) ) ( not ( = ?auto_507709 ?auto_507713 ) ) ( not ( = ?auto_507709 ?auto_507712 ) ) ( not ( = ?auto_507709 ?auto_507714 ) ) ( not ( = ?auto_507709 ?auto_507715 ) ) ( not ( = ?auto_507709 ?auto_507716 ) ) ( not ( = ?auto_507709 ?auto_507717 ) ) ( not ( = ?auto_507709 ?auto_507718 ) ) ( not ( = ?auto_507710 ?auto_507707 ) ) ( not ( = ?auto_507710 ?auto_507711 ) ) ( not ( = ?auto_507710 ?auto_507713 ) ) ( not ( = ?auto_507710 ?auto_507712 ) ) ( not ( = ?auto_507710 ?auto_507714 ) ) ( not ( = ?auto_507710 ?auto_507715 ) ) ( not ( = ?auto_507710 ?auto_507716 ) ) ( not ( = ?auto_507710 ?auto_507717 ) ) ( not ( = ?auto_507710 ?auto_507718 ) ) ( not ( = ?auto_507707 ?auto_507711 ) ) ( not ( = ?auto_507707 ?auto_507713 ) ) ( not ( = ?auto_507707 ?auto_507712 ) ) ( not ( = ?auto_507707 ?auto_507714 ) ) ( not ( = ?auto_507707 ?auto_507715 ) ) ( not ( = ?auto_507707 ?auto_507716 ) ) ( not ( = ?auto_507707 ?auto_507717 ) ) ( not ( = ?auto_507707 ?auto_507718 ) ) ( not ( = ?auto_507711 ?auto_507713 ) ) ( not ( = ?auto_507711 ?auto_507712 ) ) ( not ( = ?auto_507711 ?auto_507714 ) ) ( not ( = ?auto_507711 ?auto_507715 ) ) ( not ( = ?auto_507711 ?auto_507716 ) ) ( not ( = ?auto_507711 ?auto_507717 ) ) ( not ( = ?auto_507711 ?auto_507718 ) ) ( not ( = ?auto_507713 ?auto_507712 ) ) ( not ( = ?auto_507713 ?auto_507714 ) ) ( not ( = ?auto_507713 ?auto_507715 ) ) ( not ( = ?auto_507713 ?auto_507716 ) ) ( not ( = ?auto_507713 ?auto_507717 ) ) ( not ( = ?auto_507713 ?auto_507718 ) ) ( not ( = ?auto_507712 ?auto_507714 ) ) ( not ( = ?auto_507712 ?auto_507715 ) ) ( not ( = ?auto_507712 ?auto_507716 ) ) ( not ( = ?auto_507712 ?auto_507717 ) ) ( not ( = ?auto_507712 ?auto_507718 ) ) ( not ( = ?auto_507714 ?auto_507715 ) ) ( not ( = ?auto_507714 ?auto_507716 ) ) ( not ( = ?auto_507714 ?auto_507717 ) ) ( not ( = ?auto_507714 ?auto_507718 ) ) ( not ( = ?auto_507715 ?auto_507716 ) ) ( not ( = ?auto_507715 ?auto_507717 ) ) ( not ( = ?auto_507715 ?auto_507718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_507716 ?auto_507717 ?auto_507718 )
      ( MAKE-11CRATE-VERIFY ?auto_507708 ?auto_507709 ?auto_507710 ?auto_507707 ?auto_507711 ?auto_507713 ?auto_507712 ?auto_507714 ?auto_507715 ?auto_507716 ?auto_507717 ?auto_507718 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507851 - SURFACE
      ?auto_507852 - SURFACE
      ?auto_507853 - SURFACE
      ?auto_507850 - SURFACE
      ?auto_507854 - SURFACE
      ?auto_507856 - SURFACE
      ?auto_507855 - SURFACE
      ?auto_507857 - SURFACE
      ?auto_507858 - SURFACE
      ?auto_507859 - SURFACE
      ?auto_507860 - SURFACE
      ?auto_507861 - SURFACE
    )
    :vars
    (
      ?auto_507867 - HOIST
      ?auto_507863 - PLACE
      ?auto_507862 - TRUCK
      ?auto_507865 - PLACE
      ?auto_507866 - HOIST
      ?auto_507864 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_507867 ?auto_507863 ) ( SURFACE-AT ?auto_507860 ?auto_507863 ) ( CLEAR ?auto_507860 ) ( IS-CRATE ?auto_507861 ) ( not ( = ?auto_507860 ?auto_507861 ) ) ( AVAILABLE ?auto_507867 ) ( ON ?auto_507860 ?auto_507859 ) ( not ( = ?auto_507859 ?auto_507860 ) ) ( not ( = ?auto_507859 ?auto_507861 ) ) ( TRUCK-AT ?auto_507862 ?auto_507865 ) ( not ( = ?auto_507865 ?auto_507863 ) ) ( HOIST-AT ?auto_507866 ?auto_507865 ) ( not ( = ?auto_507867 ?auto_507866 ) ) ( AVAILABLE ?auto_507866 ) ( SURFACE-AT ?auto_507861 ?auto_507865 ) ( ON ?auto_507861 ?auto_507864 ) ( CLEAR ?auto_507861 ) ( not ( = ?auto_507860 ?auto_507864 ) ) ( not ( = ?auto_507861 ?auto_507864 ) ) ( not ( = ?auto_507859 ?auto_507864 ) ) ( ON ?auto_507852 ?auto_507851 ) ( ON ?auto_507853 ?auto_507852 ) ( ON ?auto_507850 ?auto_507853 ) ( ON ?auto_507854 ?auto_507850 ) ( ON ?auto_507856 ?auto_507854 ) ( ON ?auto_507855 ?auto_507856 ) ( ON ?auto_507857 ?auto_507855 ) ( ON ?auto_507858 ?auto_507857 ) ( ON ?auto_507859 ?auto_507858 ) ( not ( = ?auto_507851 ?auto_507852 ) ) ( not ( = ?auto_507851 ?auto_507853 ) ) ( not ( = ?auto_507851 ?auto_507850 ) ) ( not ( = ?auto_507851 ?auto_507854 ) ) ( not ( = ?auto_507851 ?auto_507856 ) ) ( not ( = ?auto_507851 ?auto_507855 ) ) ( not ( = ?auto_507851 ?auto_507857 ) ) ( not ( = ?auto_507851 ?auto_507858 ) ) ( not ( = ?auto_507851 ?auto_507859 ) ) ( not ( = ?auto_507851 ?auto_507860 ) ) ( not ( = ?auto_507851 ?auto_507861 ) ) ( not ( = ?auto_507851 ?auto_507864 ) ) ( not ( = ?auto_507852 ?auto_507853 ) ) ( not ( = ?auto_507852 ?auto_507850 ) ) ( not ( = ?auto_507852 ?auto_507854 ) ) ( not ( = ?auto_507852 ?auto_507856 ) ) ( not ( = ?auto_507852 ?auto_507855 ) ) ( not ( = ?auto_507852 ?auto_507857 ) ) ( not ( = ?auto_507852 ?auto_507858 ) ) ( not ( = ?auto_507852 ?auto_507859 ) ) ( not ( = ?auto_507852 ?auto_507860 ) ) ( not ( = ?auto_507852 ?auto_507861 ) ) ( not ( = ?auto_507852 ?auto_507864 ) ) ( not ( = ?auto_507853 ?auto_507850 ) ) ( not ( = ?auto_507853 ?auto_507854 ) ) ( not ( = ?auto_507853 ?auto_507856 ) ) ( not ( = ?auto_507853 ?auto_507855 ) ) ( not ( = ?auto_507853 ?auto_507857 ) ) ( not ( = ?auto_507853 ?auto_507858 ) ) ( not ( = ?auto_507853 ?auto_507859 ) ) ( not ( = ?auto_507853 ?auto_507860 ) ) ( not ( = ?auto_507853 ?auto_507861 ) ) ( not ( = ?auto_507853 ?auto_507864 ) ) ( not ( = ?auto_507850 ?auto_507854 ) ) ( not ( = ?auto_507850 ?auto_507856 ) ) ( not ( = ?auto_507850 ?auto_507855 ) ) ( not ( = ?auto_507850 ?auto_507857 ) ) ( not ( = ?auto_507850 ?auto_507858 ) ) ( not ( = ?auto_507850 ?auto_507859 ) ) ( not ( = ?auto_507850 ?auto_507860 ) ) ( not ( = ?auto_507850 ?auto_507861 ) ) ( not ( = ?auto_507850 ?auto_507864 ) ) ( not ( = ?auto_507854 ?auto_507856 ) ) ( not ( = ?auto_507854 ?auto_507855 ) ) ( not ( = ?auto_507854 ?auto_507857 ) ) ( not ( = ?auto_507854 ?auto_507858 ) ) ( not ( = ?auto_507854 ?auto_507859 ) ) ( not ( = ?auto_507854 ?auto_507860 ) ) ( not ( = ?auto_507854 ?auto_507861 ) ) ( not ( = ?auto_507854 ?auto_507864 ) ) ( not ( = ?auto_507856 ?auto_507855 ) ) ( not ( = ?auto_507856 ?auto_507857 ) ) ( not ( = ?auto_507856 ?auto_507858 ) ) ( not ( = ?auto_507856 ?auto_507859 ) ) ( not ( = ?auto_507856 ?auto_507860 ) ) ( not ( = ?auto_507856 ?auto_507861 ) ) ( not ( = ?auto_507856 ?auto_507864 ) ) ( not ( = ?auto_507855 ?auto_507857 ) ) ( not ( = ?auto_507855 ?auto_507858 ) ) ( not ( = ?auto_507855 ?auto_507859 ) ) ( not ( = ?auto_507855 ?auto_507860 ) ) ( not ( = ?auto_507855 ?auto_507861 ) ) ( not ( = ?auto_507855 ?auto_507864 ) ) ( not ( = ?auto_507857 ?auto_507858 ) ) ( not ( = ?auto_507857 ?auto_507859 ) ) ( not ( = ?auto_507857 ?auto_507860 ) ) ( not ( = ?auto_507857 ?auto_507861 ) ) ( not ( = ?auto_507857 ?auto_507864 ) ) ( not ( = ?auto_507858 ?auto_507859 ) ) ( not ( = ?auto_507858 ?auto_507860 ) ) ( not ( = ?auto_507858 ?auto_507861 ) ) ( not ( = ?auto_507858 ?auto_507864 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_507859 ?auto_507860 ?auto_507861 )
      ( MAKE-11CRATE-VERIFY ?auto_507851 ?auto_507852 ?auto_507853 ?auto_507850 ?auto_507854 ?auto_507856 ?auto_507855 ?auto_507857 ?auto_507858 ?auto_507859 ?auto_507860 ?auto_507861 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507995 - SURFACE
      ?auto_507996 - SURFACE
      ?auto_507997 - SURFACE
      ?auto_507994 - SURFACE
      ?auto_507998 - SURFACE
      ?auto_508000 - SURFACE
      ?auto_507999 - SURFACE
      ?auto_508001 - SURFACE
      ?auto_508002 - SURFACE
      ?auto_508003 - SURFACE
      ?auto_508004 - SURFACE
      ?auto_508005 - SURFACE
    )
    :vars
    (
      ?auto_508009 - HOIST
      ?auto_508008 - PLACE
      ?auto_508006 - PLACE
      ?auto_508007 - HOIST
      ?auto_508011 - SURFACE
      ?auto_508010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_508009 ?auto_508008 ) ( SURFACE-AT ?auto_508004 ?auto_508008 ) ( CLEAR ?auto_508004 ) ( IS-CRATE ?auto_508005 ) ( not ( = ?auto_508004 ?auto_508005 ) ) ( AVAILABLE ?auto_508009 ) ( ON ?auto_508004 ?auto_508003 ) ( not ( = ?auto_508003 ?auto_508004 ) ) ( not ( = ?auto_508003 ?auto_508005 ) ) ( not ( = ?auto_508006 ?auto_508008 ) ) ( HOIST-AT ?auto_508007 ?auto_508006 ) ( not ( = ?auto_508009 ?auto_508007 ) ) ( AVAILABLE ?auto_508007 ) ( SURFACE-AT ?auto_508005 ?auto_508006 ) ( ON ?auto_508005 ?auto_508011 ) ( CLEAR ?auto_508005 ) ( not ( = ?auto_508004 ?auto_508011 ) ) ( not ( = ?auto_508005 ?auto_508011 ) ) ( not ( = ?auto_508003 ?auto_508011 ) ) ( TRUCK-AT ?auto_508010 ?auto_508008 ) ( ON ?auto_507996 ?auto_507995 ) ( ON ?auto_507997 ?auto_507996 ) ( ON ?auto_507994 ?auto_507997 ) ( ON ?auto_507998 ?auto_507994 ) ( ON ?auto_508000 ?auto_507998 ) ( ON ?auto_507999 ?auto_508000 ) ( ON ?auto_508001 ?auto_507999 ) ( ON ?auto_508002 ?auto_508001 ) ( ON ?auto_508003 ?auto_508002 ) ( not ( = ?auto_507995 ?auto_507996 ) ) ( not ( = ?auto_507995 ?auto_507997 ) ) ( not ( = ?auto_507995 ?auto_507994 ) ) ( not ( = ?auto_507995 ?auto_507998 ) ) ( not ( = ?auto_507995 ?auto_508000 ) ) ( not ( = ?auto_507995 ?auto_507999 ) ) ( not ( = ?auto_507995 ?auto_508001 ) ) ( not ( = ?auto_507995 ?auto_508002 ) ) ( not ( = ?auto_507995 ?auto_508003 ) ) ( not ( = ?auto_507995 ?auto_508004 ) ) ( not ( = ?auto_507995 ?auto_508005 ) ) ( not ( = ?auto_507995 ?auto_508011 ) ) ( not ( = ?auto_507996 ?auto_507997 ) ) ( not ( = ?auto_507996 ?auto_507994 ) ) ( not ( = ?auto_507996 ?auto_507998 ) ) ( not ( = ?auto_507996 ?auto_508000 ) ) ( not ( = ?auto_507996 ?auto_507999 ) ) ( not ( = ?auto_507996 ?auto_508001 ) ) ( not ( = ?auto_507996 ?auto_508002 ) ) ( not ( = ?auto_507996 ?auto_508003 ) ) ( not ( = ?auto_507996 ?auto_508004 ) ) ( not ( = ?auto_507996 ?auto_508005 ) ) ( not ( = ?auto_507996 ?auto_508011 ) ) ( not ( = ?auto_507997 ?auto_507994 ) ) ( not ( = ?auto_507997 ?auto_507998 ) ) ( not ( = ?auto_507997 ?auto_508000 ) ) ( not ( = ?auto_507997 ?auto_507999 ) ) ( not ( = ?auto_507997 ?auto_508001 ) ) ( not ( = ?auto_507997 ?auto_508002 ) ) ( not ( = ?auto_507997 ?auto_508003 ) ) ( not ( = ?auto_507997 ?auto_508004 ) ) ( not ( = ?auto_507997 ?auto_508005 ) ) ( not ( = ?auto_507997 ?auto_508011 ) ) ( not ( = ?auto_507994 ?auto_507998 ) ) ( not ( = ?auto_507994 ?auto_508000 ) ) ( not ( = ?auto_507994 ?auto_507999 ) ) ( not ( = ?auto_507994 ?auto_508001 ) ) ( not ( = ?auto_507994 ?auto_508002 ) ) ( not ( = ?auto_507994 ?auto_508003 ) ) ( not ( = ?auto_507994 ?auto_508004 ) ) ( not ( = ?auto_507994 ?auto_508005 ) ) ( not ( = ?auto_507994 ?auto_508011 ) ) ( not ( = ?auto_507998 ?auto_508000 ) ) ( not ( = ?auto_507998 ?auto_507999 ) ) ( not ( = ?auto_507998 ?auto_508001 ) ) ( not ( = ?auto_507998 ?auto_508002 ) ) ( not ( = ?auto_507998 ?auto_508003 ) ) ( not ( = ?auto_507998 ?auto_508004 ) ) ( not ( = ?auto_507998 ?auto_508005 ) ) ( not ( = ?auto_507998 ?auto_508011 ) ) ( not ( = ?auto_508000 ?auto_507999 ) ) ( not ( = ?auto_508000 ?auto_508001 ) ) ( not ( = ?auto_508000 ?auto_508002 ) ) ( not ( = ?auto_508000 ?auto_508003 ) ) ( not ( = ?auto_508000 ?auto_508004 ) ) ( not ( = ?auto_508000 ?auto_508005 ) ) ( not ( = ?auto_508000 ?auto_508011 ) ) ( not ( = ?auto_507999 ?auto_508001 ) ) ( not ( = ?auto_507999 ?auto_508002 ) ) ( not ( = ?auto_507999 ?auto_508003 ) ) ( not ( = ?auto_507999 ?auto_508004 ) ) ( not ( = ?auto_507999 ?auto_508005 ) ) ( not ( = ?auto_507999 ?auto_508011 ) ) ( not ( = ?auto_508001 ?auto_508002 ) ) ( not ( = ?auto_508001 ?auto_508003 ) ) ( not ( = ?auto_508001 ?auto_508004 ) ) ( not ( = ?auto_508001 ?auto_508005 ) ) ( not ( = ?auto_508001 ?auto_508011 ) ) ( not ( = ?auto_508002 ?auto_508003 ) ) ( not ( = ?auto_508002 ?auto_508004 ) ) ( not ( = ?auto_508002 ?auto_508005 ) ) ( not ( = ?auto_508002 ?auto_508011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_508003 ?auto_508004 ?auto_508005 )
      ( MAKE-11CRATE-VERIFY ?auto_507995 ?auto_507996 ?auto_507997 ?auto_507994 ?auto_507998 ?auto_508000 ?auto_507999 ?auto_508001 ?auto_508002 ?auto_508003 ?auto_508004 ?auto_508005 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_508139 - SURFACE
      ?auto_508140 - SURFACE
      ?auto_508141 - SURFACE
      ?auto_508138 - SURFACE
      ?auto_508142 - SURFACE
      ?auto_508144 - SURFACE
      ?auto_508143 - SURFACE
      ?auto_508145 - SURFACE
      ?auto_508146 - SURFACE
      ?auto_508147 - SURFACE
      ?auto_508148 - SURFACE
      ?auto_508149 - SURFACE
    )
    :vars
    (
      ?auto_508155 - HOIST
      ?auto_508154 - PLACE
      ?auto_508152 - PLACE
      ?auto_508150 - HOIST
      ?auto_508151 - SURFACE
      ?auto_508153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_508155 ?auto_508154 ) ( IS-CRATE ?auto_508149 ) ( not ( = ?auto_508148 ?auto_508149 ) ) ( not ( = ?auto_508147 ?auto_508148 ) ) ( not ( = ?auto_508147 ?auto_508149 ) ) ( not ( = ?auto_508152 ?auto_508154 ) ) ( HOIST-AT ?auto_508150 ?auto_508152 ) ( not ( = ?auto_508155 ?auto_508150 ) ) ( AVAILABLE ?auto_508150 ) ( SURFACE-AT ?auto_508149 ?auto_508152 ) ( ON ?auto_508149 ?auto_508151 ) ( CLEAR ?auto_508149 ) ( not ( = ?auto_508148 ?auto_508151 ) ) ( not ( = ?auto_508149 ?auto_508151 ) ) ( not ( = ?auto_508147 ?auto_508151 ) ) ( TRUCK-AT ?auto_508153 ?auto_508154 ) ( SURFACE-AT ?auto_508147 ?auto_508154 ) ( CLEAR ?auto_508147 ) ( LIFTING ?auto_508155 ?auto_508148 ) ( IS-CRATE ?auto_508148 ) ( ON ?auto_508140 ?auto_508139 ) ( ON ?auto_508141 ?auto_508140 ) ( ON ?auto_508138 ?auto_508141 ) ( ON ?auto_508142 ?auto_508138 ) ( ON ?auto_508144 ?auto_508142 ) ( ON ?auto_508143 ?auto_508144 ) ( ON ?auto_508145 ?auto_508143 ) ( ON ?auto_508146 ?auto_508145 ) ( ON ?auto_508147 ?auto_508146 ) ( not ( = ?auto_508139 ?auto_508140 ) ) ( not ( = ?auto_508139 ?auto_508141 ) ) ( not ( = ?auto_508139 ?auto_508138 ) ) ( not ( = ?auto_508139 ?auto_508142 ) ) ( not ( = ?auto_508139 ?auto_508144 ) ) ( not ( = ?auto_508139 ?auto_508143 ) ) ( not ( = ?auto_508139 ?auto_508145 ) ) ( not ( = ?auto_508139 ?auto_508146 ) ) ( not ( = ?auto_508139 ?auto_508147 ) ) ( not ( = ?auto_508139 ?auto_508148 ) ) ( not ( = ?auto_508139 ?auto_508149 ) ) ( not ( = ?auto_508139 ?auto_508151 ) ) ( not ( = ?auto_508140 ?auto_508141 ) ) ( not ( = ?auto_508140 ?auto_508138 ) ) ( not ( = ?auto_508140 ?auto_508142 ) ) ( not ( = ?auto_508140 ?auto_508144 ) ) ( not ( = ?auto_508140 ?auto_508143 ) ) ( not ( = ?auto_508140 ?auto_508145 ) ) ( not ( = ?auto_508140 ?auto_508146 ) ) ( not ( = ?auto_508140 ?auto_508147 ) ) ( not ( = ?auto_508140 ?auto_508148 ) ) ( not ( = ?auto_508140 ?auto_508149 ) ) ( not ( = ?auto_508140 ?auto_508151 ) ) ( not ( = ?auto_508141 ?auto_508138 ) ) ( not ( = ?auto_508141 ?auto_508142 ) ) ( not ( = ?auto_508141 ?auto_508144 ) ) ( not ( = ?auto_508141 ?auto_508143 ) ) ( not ( = ?auto_508141 ?auto_508145 ) ) ( not ( = ?auto_508141 ?auto_508146 ) ) ( not ( = ?auto_508141 ?auto_508147 ) ) ( not ( = ?auto_508141 ?auto_508148 ) ) ( not ( = ?auto_508141 ?auto_508149 ) ) ( not ( = ?auto_508141 ?auto_508151 ) ) ( not ( = ?auto_508138 ?auto_508142 ) ) ( not ( = ?auto_508138 ?auto_508144 ) ) ( not ( = ?auto_508138 ?auto_508143 ) ) ( not ( = ?auto_508138 ?auto_508145 ) ) ( not ( = ?auto_508138 ?auto_508146 ) ) ( not ( = ?auto_508138 ?auto_508147 ) ) ( not ( = ?auto_508138 ?auto_508148 ) ) ( not ( = ?auto_508138 ?auto_508149 ) ) ( not ( = ?auto_508138 ?auto_508151 ) ) ( not ( = ?auto_508142 ?auto_508144 ) ) ( not ( = ?auto_508142 ?auto_508143 ) ) ( not ( = ?auto_508142 ?auto_508145 ) ) ( not ( = ?auto_508142 ?auto_508146 ) ) ( not ( = ?auto_508142 ?auto_508147 ) ) ( not ( = ?auto_508142 ?auto_508148 ) ) ( not ( = ?auto_508142 ?auto_508149 ) ) ( not ( = ?auto_508142 ?auto_508151 ) ) ( not ( = ?auto_508144 ?auto_508143 ) ) ( not ( = ?auto_508144 ?auto_508145 ) ) ( not ( = ?auto_508144 ?auto_508146 ) ) ( not ( = ?auto_508144 ?auto_508147 ) ) ( not ( = ?auto_508144 ?auto_508148 ) ) ( not ( = ?auto_508144 ?auto_508149 ) ) ( not ( = ?auto_508144 ?auto_508151 ) ) ( not ( = ?auto_508143 ?auto_508145 ) ) ( not ( = ?auto_508143 ?auto_508146 ) ) ( not ( = ?auto_508143 ?auto_508147 ) ) ( not ( = ?auto_508143 ?auto_508148 ) ) ( not ( = ?auto_508143 ?auto_508149 ) ) ( not ( = ?auto_508143 ?auto_508151 ) ) ( not ( = ?auto_508145 ?auto_508146 ) ) ( not ( = ?auto_508145 ?auto_508147 ) ) ( not ( = ?auto_508145 ?auto_508148 ) ) ( not ( = ?auto_508145 ?auto_508149 ) ) ( not ( = ?auto_508145 ?auto_508151 ) ) ( not ( = ?auto_508146 ?auto_508147 ) ) ( not ( = ?auto_508146 ?auto_508148 ) ) ( not ( = ?auto_508146 ?auto_508149 ) ) ( not ( = ?auto_508146 ?auto_508151 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_508147 ?auto_508148 ?auto_508149 )
      ( MAKE-11CRATE-VERIFY ?auto_508139 ?auto_508140 ?auto_508141 ?auto_508138 ?auto_508142 ?auto_508144 ?auto_508143 ?auto_508145 ?auto_508146 ?auto_508147 ?auto_508148 ?auto_508149 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_508283 - SURFACE
      ?auto_508284 - SURFACE
      ?auto_508285 - SURFACE
      ?auto_508282 - SURFACE
      ?auto_508286 - SURFACE
      ?auto_508288 - SURFACE
      ?auto_508287 - SURFACE
      ?auto_508289 - SURFACE
      ?auto_508290 - SURFACE
      ?auto_508291 - SURFACE
      ?auto_508292 - SURFACE
      ?auto_508293 - SURFACE
    )
    :vars
    (
      ?auto_508296 - HOIST
      ?auto_508299 - PLACE
      ?auto_508298 - PLACE
      ?auto_508294 - HOIST
      ?auto_508295 - SURFACE
      ?auto_508297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_508296 ?auto_508299 ) ( IS-CRATE ?auto_508293 ) ( not ( = ?auto_508292 ?auto_508293 ) ) ( not ( = ?auto_508291 ?auto_508292 ) ) ( not ( = ?auto_508291 ?auto_508293 ) ) ( not ( = ?auto_508298 ?auto_508299 ) ) ( HOIST-AT ?auto_508294 ?auto_508298 ) ( not ( = ?auto_508296 ?auto_508294 ) ) ( AVAILABLE ?auto_508294 ) ( SURFACE-AT ?auto_508293 ?auto_508298 ) ( ON ?auto_508293 ?auto_508295 ) ( CLEAR ?auto_508293 ) ( not ( = ?auto_508292 ?auto_508295 ) ) ( not ( = ?auto_508293 ?auto_508295 ) ) ( not ( = ?auto_508291 ?auto_508295 ) ) ( TRUCK-AT ?auto_508297 ?auto_508299 ) ( SURFACE-AT ?auto_508291 ?auto_508299 ) ( CLEAR ?auto_508291 ) ( IS-CRATE ?auto_508292 ) ( AVAILABLE ?auto_508296 ) ( IN ?auto_508292 ?auto_508297 ) ( ON ?auto_508284 ?auto_508283 ) ( ON ?auto_508285 ?auto_508284 ) ( ON ?auto_508282 ?auto_508285 ) ( ON ?auto_508286 ?auto_508282 ) ( ON ?auto_508288 ?auto_508286 ) ( ON ?auto_508287 ?auto_508288 ) ( ON ?auto_508289 ?auto_508287 ) ( ON ?auto_508290 ?auto_508289 ) ( ON ?auto_508291 ?auto_508290 ) ( not ( = ?auto_508283 ?auto_508284 ) ) ( not ( = ?auto_508283 ?auto_508285 ) ) ( not ( = ?auto_508283 ?auto_508282 ) ) ( not ( = ?auto_508283 ?auto_508286 ) ) ( not ( = ?auto_508283 ?auto_508288 ) ) ( not ( = ?auto_508283 ?auto_508287 ) ) ( not ( = ?auto_508283 ?auto_508289 ) ) ( not ( = ?auto_508283 ?auto_508290 ) ) ( not ( = ?auto_508283 ?auto_508291 ) ) ( not ( = ?auto_508283 ?auto_508292 ) ) ( not ( = ?auto_508283 ?auto_508293 ) ) ( not ( = ?auto_508283 ?auto_508295 ) ) ( not ( = ?auto_508284 ?auto_508285 ) ) ( not ( = ?auto_508284 ?auto_508282 ) ) ( not ( = ?auto_508284 ?auto_508286 ) ) ( not ( = ?auto_508284 ?auto_508288 ) ) ( not ( = ?auto_508284 ?auto_508287 ) ) ( not ( = ?auto_508284 ?auto_508289 ) ) ( not ( = ?auto_508284 ?auto_508290 ) ) ( not ( = ?auto_508284 ?auto_508291 ) ) ( not ( = ?auto_508284 ?auto_508292 ) ) ( not ( = ?auto_508284 ?auto_508293 ) ) ( not ( = ?auto_508284 ?auto_508295 ) ) ( not ( = ?auto_508285 ?auto_508282 ) ) ( not ( = ?auto_508285 ?auto_508286 ) ) ( not ( = ?auto_508285 ?auto_508288 ) ) ( not ( = ?auto_508285 ?auto_508287 ) ) ( not ( = ?auto_508285 ?auto_508289 ) ) ( not ( = ?auto_508285 ?auto_508290 ) ) ( not ( = ?auto_508285 ?auto_508291 ) ) ( not ( = ?auto_508285 ?auto_508292 ) ) ( not ( = ?auto_508285 ?auto_508293 ) ) ( not ( = ?auto_508285 ?auto_508295 ) ) ( not ( = ?auto_508282 ?auto_508286 ) ) ( not ( = ?auto_508282 ?auto_508288 ) ) ( not ( = ?auto_508282 ?auto_508287 ) ) ( not ( = ?auto_508282 ?auto_508289 ) ) ( not ( = ?auto_508282 ?auto_508290 ) ) ( not ( = ?auto_508282 ?auto_508291 ) ) ( not ( = ?auto_508282 ?auto_508292 ) ) ( not ( = ?auto_508282 ?auto_508293 ) ) ( not ( = ?auto_508282 ?auto_508295 ) ) ( not ( = ?auto_508286 ?auto_508288 ) ) ( not ( = ?auto_508286 ?auto_508287 ) ) ( not ( = ?auto_508286 ?auto_508289 ) ) ( not ( = ?auto_508286 ?auto_508290 ) ) ( not ( = ?auto_508286 ?auto_508291 ) ) ( not ( = ?auto_508286 ?auto_508292 ) ) ( not ( = ?auto_508286 ?auto_508293 ) ) ( not ( = ?auto_508286 ?auto_508295 ) ) ( not ( = ?auto_508288 ?auto_508287 ) ) ( not ( = ?auto_508288 ?auto_508289 ) ) ( not ( = ?auto_508288 ?auto_508290 ) ) ( not ( = ?auto_508288 ?auto_508291 ) ) ( not ( = ?auto_508288 ?auto_508292 ) ) ( not ( = ?auto_508288 ?auto_508293 ) ) ( not ( = ?auto_508288 ?auto_508295 ) ) ( not ( = ?auto_508287 ?auto_508289 ) ) ( not ( = ?auto_508287 ?auto_508290 ) ) ( not ( = ?auto_508287 ?auto_508291 ) ) ( not ( = ?auto_508287 ?auto_508292 ) ) ( not ( = ?auto_508287 ?auto_508293 ) ) ( not ( = ?auto_508287 ?auto_508295 ) ) ( not ( = ?auto_508289 ?auto_508290 ) ) ( not ( = ?auto_508289 ?auto_508291 ) ) ( not ( = ?auto_508289 ?auto_508292 ) ) ( not ( = ?auto_508289 ?auto_508293 ) ) ( not ( = ?auto_508289 ?auto_508295 ) ) ( not ( = ?auto_508290 ?auto_508291 ) ) ( not ( = ?auto_508290 ?auto_508292 ) ) ( not ( = ?auto_508290 ?auto_508293 ) ) ( not ( = ?auto_508290 ?auto_508295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_508291 ?auto_508292 ?auto_508293 )
      ( MAKE-11CRATE-VERIFY ?auto_508283 ?auto_508284 ?auto_508285 ?auto_508282 ?auto_508286 ?auto_508288 ?auto_508287 ?auto_508289 ?auto_508290 ?auto_508291 ?auto_508292 ?auto_508293 ) )
  )

)

