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
      ?auto_11575 - SURFACE
      ?auto_11576 - SURFACE
    )
    :vars
    (
      ?auto_11577 - HOIST
      ?auto_11578 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11577 ?auto_11578 ) ( SURFACE-AT ?auto_11575 ?auto_11578 ) ( CLEAR ?auto_11575 ) ( LIFTING ?auto_11577 ?auto_11576 ) ( IS-CRATE ?auto_11576 ) ( not ( = ?auto_11575 ?auto_11576 ) ) )
    :subtasks
    ( ( !DROP ?auto_11577 ?auto_11576 ?auto_11575 ?auto_11578 )
      ( MAKE-1CRATE-VERIFY ?auto_11575 ?auto_11576 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11579 - SURFACE
      ?auto_11580 - SURFACE
    )
    :vars
    (
      ?auto_11581 - HOIST
      ?auto_11582 - PLACE
      ?auto_11583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11581 ?auto_11582 ) ( SURFACE-AT ?auto_11579 ?auto_11582 ) ( CLEAR ?auto_11579 ) ( IS-CRATE ?auto_11580 ) ( not ( = ?auto_11579 ?auto_11580 ) ) ( TRUCK-AT ?auto_11583 ?auto_11582 ) ( AVAILABLE ?auto_11581 ) ( IN ?auto_11580 ?auto_11583 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11581 ?auto_11580 ?auto_11583 ?auto_11582 )
      ( MAKE-1CRATE ?auto_11579 ?auto_11580 )
      ( MAKE-1CRATE-VERIFY ?auto_11579 ?auto_11580 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11584 - SURFACE
      ?auto_11585 - SURFACE
    )
    :vars
    (
      ?auto_11588 - HOIST
      ?auto_11587 - PLACE
      ?auto_11586 - TRUCK
      ?auto_11589 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11588 ?auto_11587 ) ( SURFACE-AT ?auto_11584 ?auto_11587 ) ( CLEAR ?auto_11584 ) ( IS-CRATE ?auto_11585 ) ( not ( = ?auto_11584 ?auto_11585 ) ) ( AVAILABLE ?auto_11588 ) ( IN ?auto_11585 ?auto_11586 ) ( TRUCK-AT ?auto_11586 ?auto_11589 ) ( not ( = ?auto_11589 ?auto_11587 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11586 ?auto_11589 ?auto_11587 )
      ( MAKE-1CRATE ?auto_11584 ?auto_11585 )
      ( MAKE-1CRATE-VERIFY ?auto_11584 ?auto_11585 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11590 - SURFACE
      ?auto_11591 - SURFACE
    )
    :vars
    (
      ?auto_11594 - HOIST
      ?auto_11595 - PLACE
      ?auto_11592 - TRUCK
      ?auto_11593 - PLACE
      ?auto_11596 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11594 ?auto_11595 ) ( SURFACE-AT ?auto_11590 ?auto_11595 ) ( CLEAR ?auto_11590 ) ( IS-CRATE ?auto_11591 ) ( not ( = ?auto_11590 ?auto_11591 ) ) ( AVAILABLE ?auto_11594 ) ( TRUCK-AT ?auto_11592 ?auto_11593 ) ( not ( = ?auto_11593 ?auto_11595 ) ) ( HOIST-AT ?auto_11596 ?auto_11593 ) ( LIFTING ?auto_11596 ?auto_11591 ) ( not ( = ?auto_11594 ?auto_11596 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11596 ?auto_11591 ?auto_11592 ?auto_11593 )
      ( MAKE-1CRATE ?auto_11590 ?auto_11591 )
      ( MAKE-1CRATE-VERIFY ?auto_11590 ?auto_11591 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11597 - SURFACE
      ?auto_11598 - SURFACE
    )
    :vars
    (
      ?auto_11601 - HOIST
      ?auto_11599 - PLACE
      ?auto_11603 - TRUCK
      ?auto_11600 - PLACE
      ?auto_11602 - HOIST
      ?auto_11604 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11601 ?auto_11599 ) ( SURFACE-AT ?auto_11597 ?auto_11599 ) ( CLEAR ?auto_11597 ) ( IS-CRATE ?auto_11598 ) ( not ( = ?auto_11597 ?auto_11598 ) ) ( AVAILABLE ?auto_11601 ) ( TRUCK-AT ?auto_11603 ?auto_11600 ) ( not ( = ?auto_11600 ?auto_11599 ) ) ( HOIST-AT ?auto_11602 ?auto_11600 ) ( not ( = ?auto_11601 ?auto_11602 ) ) ( AVAILABLE ?auto_11602 ) ( SURFACE-AT ?auto_11598 ?auto_11600 ) ( ON ?auto_11598 ?auto_11604 ) ( CLEAR ?auto_11598 ) ( not ( = ?auto_11597 ?auto_11604 ) ) ( not ( = ?auto_11598 ?auto_11604 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11602 ?auto_11598 ?auto_11604 ?auto_11600 )
      ( MAKE-1CRATE ?auto_11597 ?auto_11598 )
      ( MAKE-1CRATE-VERIFY ?auto_11597 ?auto_11598 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11605 - SURFACE
      ?auto_11606 - SURFACE
    )
    :vars
    (
      ?auto_11607 - HOIST
      ?auto_11608 - PLACE
      ?auto_11612 - PLACE
      ?auto_11609 - HOIST
      ?auto_11611 - SURFACE
      ?auto_11610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11607 ?auto_11608 ) ( SURFACE-AT ?auto_11605 ?auto_11608 ) ( CLEAR ?auto_11605 ) ( IS-CRATE ?auto_11606 ) ( not ( = ?auto_11605 ?auto_11606 ) ) ( AVAILABLE ?auto_11607 ) ( not ( = ?auto_11612 ?auto_11608 ) ) ( HOIST-AT ?auto_11609 ?auto_11612 ) ( not ( = ?auto_11607 ?auto_11609 ) ) ( AVAILABLE ?auto_11609 ) ( SURFACE-AT ?auto_11606 ?auto_11612 ) ( ON ?auto_11606 ?auto_11611 ) ( CLEAR ?auto_11606 ) ( not ( = ?auto_11605 ?auto_11611 ) ) ( not ( = ?auto_11606 ?auto_11611 ) ) ( TRUCK-AT ?auto_11610 ?auto_11608 ) )
    :subtasks
    ( ( !DRIVE ?auto_11610 ?auto_11608 ?auto_11612 )
      ( MAKE-1CRATE ?auto_11605 ?auto_11606 )
      ( MAKE-1CRATE-VERIFY ?auto_11605 ?auto_11606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11618 - SURFACE
      ?auto_11619 - SURFACE
    )
    :vars
    (
      ?auto_11620 - HOIST
      ?auto_11621 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11620 ?auto_11621 ) ( SURFACE-AT ?auto_11618 ?auto_11621 ) ( CLEAR ?auto_11618 ) ( LIFTING ?auto_11620 ?auto_11619 ) ( IS-CRATE ?auto_11619 ) ( not ( = ?auto_11618 ?auto_11619 ) ) )
    :subtasks
    ( ( !DROP ?auto_11620 ?auto_11619 ?auto_11618 ?auto_11621 )
      ( MAKE-1CRATE-VERIFY ?auto_11618 ?auto_11619 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11622 - SURFACE
      ?auto_11623 - SURFACE
      ?auto_11624 - SURFACE
    )
    :vars
    (
      ?auto_11625 - HOIST
      ?auto_11626 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11625 ?auto_11626 ) ( SURFACE-AT ?auto_11623 ?auto_11626 ) ( CLEAR ?auto_11623 ) ( LIFTING ?auto_11625 ?auto_11624 ) ( IS-CRATE ?auto_11624 ) ( not ( = ?auto_11623 ?auto_11624 ) ) ( ON ?auto_11623 ?auto_11622 ) ( not ( = ?auto_11622 ?auto_11623 ) ) ( not ( = ?auto_11622 ?auto_11624 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11623 ?auto_11624 )
      ( MAKE-2CRATE-VERIFY ?auto_11622 ?auto_11623 ?auto_11624 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11627 - SURFACE
      ?auto_11628 - SURFACE
    )
    :vars
    (
      ?auto_11629 - HOIST
      ?auto_11630 - PLACE
      ?auto_11631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11629 ?auto_11630 ) ( SURFACE-AT ?auto_11627 ?auto_11630 ) ( CLEAR ?auto_11627 ) ( IS-CRATE ?auto_11628 ) ( not ( = ?auto_11627 ?auto_11628 ) ) ( TRUCK-AT ?auto_11631 ?auto_11630 ) ( AVAILABLE ?auto_11629 ) ( IN ?auto_11628 ?auto_11631 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11629 ?auto_11628 ?auto_11631 ?auto_11630 )
      ( MAKE-1CRATE ?auto_11627 ?auto_11628 )
      ( MAKE-1CRATE-VERIFY ?auto_11627 ?auto_11628 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11632 - SURFACE
      ?auto_11633 - SURFACE
      ?auto_11634 - SURFACE
    )
    :vars
    (
      ?auto_11636 - HOIST
      ?auto_11637 - PLACE
      ?auto_11635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11636 ?auto_11637 ) ( SURFACE-AT ?auto_11633 ?auto_11637 ) ( CLEAR ?auto_11633 ) ( IS-CRATE ?auto_11634 ) ( not ( = ?auto_11633 ?auto_11634 ) ) ( TRUCK-AT ?auto_11635 ?auto_11637 ) ( AVAILABLE ?auto_11636 ) ( IN ?auto_11634 ?auto_11635 ) ( ON ?auto_11633 ?auto_11632 ) ( not ( = ?auto_11632 ?auto_11633 ) ) ( not ( = ?auto_11632 ?auto_11634 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11633 ?auto_11634 )
      ( MAKE-2CRATE-VERIFY ?auto_11632 ?auto_11633 ?auto_11634 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11638 - SURFACE
      ?auto_11639 - SURFACE
    )
    :vars
    (
      ?auto_11640 - HOIST
      ?auto_11643 - PLACE
      ?auto_11641 - TRUCK
      ?auto_11642 - SURFACE
      ?auto_11644 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11640 ?auto_11643 ) ( SURFACE-AT ?auto_11638 ?auto_11643 ) ( CLEAR ?auto_11638 ) ( IS-CRATE ?auto_11639 ) ( not ( = ?auto_11638 ?auto_11639 ) ) ( AVAILABLE ?auto_11640 ) ( IN ?auto_11639 ?auto_11641 ) ( ON ?auto_11638 ?auto_11642 ) ( not ( = ?auto_11642 ?auto_11638 ) ) ( not ( = ?auto_11642 ?auto_11639 ) ) ( TRUCK-AT ?auto_11641 ?auto_11644 ) ( not ( = ?auto_11644 ?auto_11643 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11641 ?auto_11644 ?auto_11643 )
      ( MAKE-2CRATE ?auto_11642 ?auto_11638 ?auto_11639 )
      ( MAKE-1CRATE-VERIFY ?auto_11638 ?auto_11639 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11645 - SURFACE
      ?auto_11646 - SURFACE
      ?auto_11647 - SURFACE
    )
    :vars
    (
      ?auto_11650 - HOIST
      ?auto_11648 - PLACE
      ?auto_11651 - TRUCK
      ?auto_11649 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11650 ?auto_11648 ) ( SURFACE-AT ?auto_11646 ?auto_11648 ) ( CLEAR ?auto_11646 ) ( IS-CRATE ?auto_11647 ) ( not ( = ?auto_11646 ?auto_11647 ) ) ( AVAILABLE ?auto_11650 ) ( IN ?auto_11647 ?auto_11651 ) ( ON ?auto_11646 ?auto_11645 ) ( not ( = ?auto_11645 ?auto_11646 ) ) ( not ( = ?auto_11645 ?auto_11647 ) ) ( TRUCK-AT ?auto_11651 ?auto_11649 ) ( not ( = ?auto_11649 ?auto_11648 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11646 ?auto_11647 )
      ( MAKE-2CRATE-VERIFY ?auto_11645 ?auto_11646 ?auto_11647 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11652 - SURFACE
      ?auto_11653 - SURFACE
    )
    :vars
    (
      ?auto_11658 - HOIST
      ?auto_11654 - PLACE
      ?auto_11657 - SURFACE
      ?auto_11655 - TRUCK
      ?auto_11656 - PLACE
      ?auto_11659 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11658 ?auto_11654 ) ( SURFACE-AT ?auto_11652 ?auto_11654 ) ( CLEAR ?auto_11652 ) ( IS-CRATE ?auto_11653 ) ( not ( = ?auto_11652 ?auto_11653 ) ) ( AVAILABLE ?auto_11658 ) ( ON ?auto_11652 ?auto_11657 ) ( not ( = ?auto_11657 ?auto_11652 ) ) ( not ( = ?auto_11657 ?auto_11653 ) ) ( TRUCK-AT ?auto_11655 ?auto_11656 ) ( not ( = ?auto_11656 ?auto_11654 ) ) ( HOIST-AT ?auto_11659 ?auto_11656 ) ( LIFTING ?auto_11659 ?auto_11653 ) ( not ( = ?auto_11658 ?auto_11659 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11659 ?auto_11653 ?auto_11655 ?auto_11656 )
      ( MAKE-2CRATE ?auto_11657 ?auto_11652 ?auto_11653 )
      ( MAKE-1CRATE-VERIFY ?auto_11652 ?auto_11653 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11660 - SURFACE
      ?auto_11661 - SURFACE
      ?auto_11662 - SURFACE
    )
    :vars
    (
      ?auto_11665 - HOIST
      ?auto_11664 - PLACE
      ?auto_11667 - TRUCK
      ?auto_11663 - PLACE
      ?auto_11666 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11665 ?auto_11664 ) ( SURFACE-AT ?auto_11661 ?auto_11664 ) ( CLEAR ?auto_11661 ) ( IS-CRATE ?auto_11662 ) ( not ( = ?auto_11661 ?auto_11662 ) ) ( AVAILABLE ?auto_11665 ) ( ON ?auto_11661 ?auto_11660 ) ( not ( = ?auto_11660 ?auto_11661 ) ) ( not ( = ?auto_11660 ?auto_11662 ) ) ( TRUCK-AT ?auto_11667 ?auto_11663 ) ( not ( = ?auto_11663 ?auto_11664 ) ) ( HOIST-AT ?auto_11666 ?auto_11663 ) ( LIFTING ?auto_11666 ?auto_11662 ) ( not ( = ?auto_11665 ?auto_11666 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11661 ?auto_11662 )
      ( MAKE-2CRATE-VERIFY ?auto_11660 ?auto_11661 ?auto_11662 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11668 - SURFACE
      ?auto_11669 - SURFACE
    )
    :vars
    (
      ?auto_11673 - HOIST
      ?auto_11675 - PLACE
      ?auto_11674 - SURFACE
      ?auto_11672 - TRUCK
      ?auto_11671 - PLACE
      ?auto_11670 - HOIST
      ?auto_11676 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11673 ?auto_11675 ) ( SURFACE-AT ?auto_11668 ?auto_11675 ) ( CLEAR ?auto_11668 ) ( IS-CRATE ?auto_11669 ) ( not ( = ?auto_11668 ?auto_11669 ) ) ( AVAILABLE ?auto_11673 ) ( ON ?auto_11668 ?auto_11674 ) ( not ( = ?auto_11674 ?auto_11668 ) ) ( not ( = ?auto_11674 ?auto_11669 ) ) ( TRUCK-AT ?auto_11672 ?auto_11671 ) ( not ( = ?auto_11671 ?auto_11675 ) ) ( HOIST-AT ?auto_11670 ?auto_11671 ) ( not ( = ?auto_11673 ?auto_11670 ) ) ( AVAILABLE ?auto_11670 ) ( SURFACE-AT ?auto_11669 ?auto_11671 ) ( ON ?auto_11669 ?auto_11676 ) ( CLEAR ?auto_11669 ) ( not ( = ?auto_11668 ?auto_11676 ) ) ( not ( = ?auto_11669 ?auto_11676 ) ) ( not ( = ?auto_11674 ?auto_11676 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11670 ?auto_11669 ?auto_11676 ?auto_11671 )
      ( MAKE-2CRATE ?auto_11674 ?auto_11668 ?auto_11669 )
      ( MAKE-1CRATE-VERIFY ?auto_11668 ?auto_11669 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11677 - SURFACE
      ?auto_11678 - SURFACE
      ?auto_11679 - SURFACE
    )
    :vars
    (
      ?auto_11680 - HOIST
      ?auto_11682 - PLACE
      ?auto_11681 - TRUCK
      ?auto_11683 - PLACE
      ?auto_11685 - HOIST
      ?auto_11684 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11680 ?auto_11682 ) ( SURFACE-AT ?auto_11678 ?auto_11682 ) ( CLEAR ?auto_11678 ) ( IS-CRATE ?auto_11679 ) ( not ( = ?auto_11678 ?auto_11679 ) ) ( AVAILABLE ?auto_11680 ) ( ON ?auto_11678 ?auto_11677 ) ( not ( = ?auto_11677 ?auto_11678 ) ) ( not ( = ?auto_11677 ?auto_11679 ) ) ( TRUCK-AT ?auto_11681 ?auto_11683 ) ( not ( = ?auto_11683 ?auto_11682 ) ) ( HOIST-AT ?auto_11685 ?auto_11683 ) ( not ( = ?auto_11680 ?auto_11685 ) ) ( AVAILABLE ?auto_11685 ) ( SURFACE-AT ?auto_11679 ?auto_11683 ) ( ON ?auto_11679 ?auto_11684 ) ( CLEAR ?auto_11679 ) ( not ( = ?auto_11678 ?auto_11684 ) ) ( not ( = ?auto_11679 ?auto_11684 ) ) ( not ( = ?auto_11677 ?auto_11684 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11678 ?auto_11679 )
      ( MAKE-2CRATE-VERIFY ?auto_11677 ?auto_11678 ?auto_11679 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11686 - SURFACE
      ?auto_11687 - SURFACE
    )
    :vars
    (
      ?auto_11690 - HOIST
      ?auto_11691 - PLACE
      ?auto_11692 - SURFACE
      ?auto_11688 - PLACE
      ?auto_11689 - HOIST
      ?auto_11693 - SURFACE
      ?auto_11694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11690 ?auto_11691 ) ( SURFACE-AT ?auto_11686 ?auto_11691 ) ( CLEAR ?auto_11686 ) ( IS-CRATE ?auto_11687 ) ( not ( = ?auto_11686 ?auto_11687 ) ) ( AVAILABLE ?auto_11690 ) ( ON ?auto_11686 ?auto_11692 ) ( not ( = ?auto_11692 ?auto_11686 ) ) ( not ( = ?auto_11692 ?auto_11687 ) ) ( not ( = ?auto_11688 ?auto_11691 ) ) ( HOIST-AT ?auto_11689 ?auto_11688 ) ( not ( = ?auto_11690 ?auto_11689 ) ) ( AVAILABLE ?auto_11689 ) ( SURFACE-AT ?auto_11687 ?auto_11688 ) ( ON ?auto_11687 ?auto_11693 ) ( CLEAR ?auto_11687 ) ( not ( = ?auto_11686 ?auto_11693 ) ) ( not ( = ?auto_11687 ?auto_11693 ) ) ( not ( = ?auto_11692 ?auto_11693 ) ) ( TRUCK-AT ?auto_11694 ?auto_11691 ) )
    :subtasks
    ( ( !DRIVE ?auto_11694 ?auto_11691 ?auto_11688 )
      ( MAKE-2CRATE ?auto_11692 ?auto_11686 ?auto_11687 )
      ( MAKE-1CRATE-VERIFY ?auto_11686 ?auto_11687 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11695 - SURFACE
      ?auto_11696 - SURFACE
      ?auto_11697 - SURFACE
    )
    :vars
    (
      ?auto_11698 - HOIST
      ?auto_11701 - PLACE
      ?auto_11702 - PLACE
      ?auto_11700 - HOIST
      ?auto_11699 - SURFACE
      ?auto_11703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11698 ?auto_11701 ) ( SURFACE-AT ?auto_11696 ?auto_11701 ) ( CLEAR ?auto_11696 ) ( IS-CRATE ?auto_11697 ) ( not ( = ?auto_11696 ?auto_11697 ) ) ( AVAILABLE ?auto_11698 ) ( ON ?auto_11696 ?auto_11695 ) ( not ( = ?auto_11695 ?auto_11696 ) ) ( not ( = ?auto_11695 ?auto_11697 ) ) ( not ( = ?auto_11702 ?auto_11701 ) ) ( HOIST-AT ?auto_11700 ?auto_11702 ) ( not ( = ?auto_11698 ?auto_11700 ) ) ( AVAILABLE ?auto_11700 ) ( SURFACE-AT ?auto_11697 ?auto_11702 ) ( ON ?auto_11697 ?auto_11699 ) ( CLEAR ?auto_11697 ) ( not ( = ?auto_11696 ?auto_11699 ) ) ( not ( = ?auto_11697 ?auto_11699 ) ) ( not ( = ?auto_11695 ?auto_11699 ) ) ( TRUCK-AT ?auto_11703 ?auto_11701 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11696 ?auto_11697 )
      ( MAKE-2CRATE-VERIFY ?auto_11695 ?auto_11696 ?auto_11697 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11704 - SURFACE
      ?auto_11705 - SURFACE
    )
    :vars
    (
      ?auto_11709 - HOIST
      ?auto_11707 - PLACE
      ?auto_11711 - SURFACE
      ?auto_11710 - PLACE
      ?auto_11712 - HOIST
      ?auto_11708 - SURFACE
      ?auto_11706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11709 ?auto_11707 ) ( IS-CRATE ?auto_11705 ) ( not ( = ?auto_11704 ?auto_11705 ) ) ( not ( = ?auto_11711 ?auto_11704 ) ) ( not ( = ?auto_11711 ?auto_11705 ) ) ( not ( = ?auto_11710 ?auto_11707 ) ) ( HOIST-AT ?auto_11712 ?auto_11710 ) ( not ( = ?auto_11709 ?auto_11712 ) ) ( AVAILABLE ?auto_11712 ) ( SURFACE-AT ?auto_11705 ?auto_11710 ) ( ON ?auto_11705 ?auto_11708 ) ( CLEAR ?auto_11705 ) ( not ( = ?auto_11704 ?auto_11708 ) ) ( not ( = ?auto_11705 ?auto_11708 ) ) ( not ( = ?auto_11711 ?auto_11708 ) ) ( TRUCK-AT ?auto_11706 ?auto_11707 ) ( SURFACE-AT ?auto_11711 ?auto_11707 ) ( CLEAR ?auto_11711 ) ( LIFTING ?auto_11709 ?auto_11704 ) ( IS-CRATE ?auto_11704 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11711 ?auto_11704 )
      ( MAKE-2CRATE ?auto_11711 ?auto_11704 ?auto_11705 )
      ( MAKE-1CRATE-VERIFY ?auto_11704 ?auto_11705 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11713 - SURFACE
      ?auto_11714 - SURFACE
      ?auto_11715 - SURFACE
    )
    :vars
    (
      ?auto_11717 - HOIST
      ?auto_11718 - PLACE
      ?auto_11716 - PLACE
      ?auto_11719 - HOIST
      ?auto_11720 - SURFACE
      ?auto_11721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11717 ?auto_11718 ) ( IS-CRATE ?auto_11715 ) ( not ( = ?auto_11714 ?auto_11715 ) ) ( not ( = ?auto_11713 ?auto_11714 ) ) ( not ( = ?auto_11713 ?auto_11715 ) ) ( not ( = ?auto_11716 ?auto_11718 ) ) ( HOIST-AT ?auto_11719 ?auto_11716 ) ( not ( = ?auto_11717 ?auto_11719 ) ) ( AVAILABLE ?auto_11719 ) ( SURFACE-AT ?auto_11715 ?auto_11716 ) ( ON ?auto_11715 ?auto_11720 ) ( CLEAR ?auto_11715 ) ( not ( = ?auto_11714 ?auto_11720 ) ) ( not ( = ?auto_11715 ?auto_11720 ) ) ( not ( = ?auto_11713 ?auto_11720 ) ) ( TRUCK-AT ?auto_11721 ?auto_11718 ) ( SURFACE-AT ?auto_11713 ?auto_11718 ) ( CLEAR ?auto_11713 ) ( LIFTING ?auto_11717 ?auto_11714 ) ( IS-CRATE ?auto_11714 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11714 ?auto_11715 )
      ( MAKE-2CRATE-VERIFY ?auto_11713 ?auto_11714 ?auto_11715 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11722 - SURFACE
      ?auto_11723 - SURFACE
    )
    :vars
    (
      ?auto_11727 - HOIST
      ?auto_11728 - PLACE
      ?auto_11730 - SURFACE
      ?auto_11725 - PLACE
      ?auto_11729 - HOIST
      ?auto_11726 - SURFACE
      ?auto_11724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11727 ?auto_11728 ) ( IS-CRATE ?auto_11723 ) ( not ( = ?auto_11722 ?auto_11723 ) ) ( not ( = ?auto_11730 ?auto_11722 ) ) ( not ( = ?auto_11730 ?auto_11723 ) ) ( not ( = ?auto_11725 ?auto_11728 ) ) ( HOIST-AT ?auto_11729 ?auto_11725 ) ( not ( = ?auto_11727 ?auto_11729 ) ) ( AVAILABLE ?auto_11729 ) ( SURFACE-AT ?auto_11723 ?auto_11725 ) ( ON ?auto_11723 ?auto_11726 ) ( CLEAR ?auto_11723 ) ( not ( = ?auto_11722 ?auto_11726 ) ) ( not ( = ?auto_11723 ?auto_11726 ) ) ( not ( = ?auto_11730 ?auto_11726 ) ) ( TRUCK-AT ?auto_11724 ?auto_11728 ) ( SURFACE-AT ?auto_11730 ?auto_11728 ) ( CLEAR ?auto_11730 ) ( IS-CRATE ?auto_11722 ) ( AVAILABLE ?auto_11727 ) ( IN ?auto_11722 ?auto_11724 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11727 ?auto_11722 ?auto_11724 ?auto_11728 )
      ( MAKE-2CRATE ?auto_11730 ?auto_11722 ?auto_11723 )
      ( MAKE-1CRATE-VERIFY ?auto_11722 ?auto_11723 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11731 - SURFACE
      ?auto_11732 - SURFACE
      ?auto_11733 - SURFACE
    )
    :vars
    (
      ?auto_11737 - HOIST
      ?auto_11739 - PLACE
      ?auto_11738 - PLACE
      ?auto_11734 - HOIST
      ?auto_11736 - SURFACE
      ?auto_11735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11737 ?auto_11739 ) ( IS-CRATE ?auto_11733 ) ( not ( = ?auto_11732 ?auto_11733 ) ) ( not ( = ?auto_11731 ?auto_11732 ) ) ( not ( = ?auto_11731 ?auto_11733 ) ) ( not ( = ?auto_11738 ?auto_11739 ) ) ( HOIST-AT ?auto_11734 ?auto_11738 ) ( not ( = ?auto_11737 ?auto_11734 ) ) ( AVAILABLE ?auto_11734 ) ( SURFACE-AT ?auto_11733 ?auto_11738 ) ( ON ?auto_11733 ?auto_11736 ) ( CLEAR ?auto_11733 ) ( not ( = ?auto_11732 ?auto_11736 ) ) ( not ( = ?auto_11733 ?auto_11736 ) ) ( not ( = ?auto_11731 ?auto_11736 ) ) ( TRUCK-AT ?auto_11735 ?auto_11739 ) ( SURFACE-AT ?auto_11731 ?auto_11739 ) ( CLEAR ?auto_11731 ) ( IS-CRATE ?auto_11732 ) ( AVAILABLE ?auto_11737 ) ( IN ?auto_11732 ?auto_11735 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11732 ?auto_11733 )
      ( MAKE-2CRATE-VERIFY ?auto_11731 ?auto_11732 ?auto_11733 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11740 - SURFACE
      ?auto_11741 - SURFACE
    )
    :vars
    (
      ?auto_11743 - HOIST
      ?auto_11745 - PLACE
      ?auto_11748 - SURFACE
      ?auto_11744 - PLACE
      ?auto_11747 - HOIST
      ?auto_11746 - SURFACE
      ?auto_11742 - TRUCK
      ?auto_11749 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11743 ?auto_11745 ) ( IS-CRATE ?auto_11741 ) ( not ( = ?auto_11740 ?auto_11741 ) ) ( not ( = ?auto_11748 ?auto_11740 ) ) ( not ( = ?auto_11748 ?auto_11741 ) ) ( not ( = ?auto_11744 ?auto_11745 ) ) ( HOIST-AT ?auto_11747 ?auto_11744 ) ( not ( = ?auto_11743 ?auto_11747 ) ) ( AVAILABLE ?auto_11747 ) ( SURFACE-AT ?auto_11741 ?auto_11744 ) ( ON ?auto_11741 ?auto_11746 ) ( CLEAR ?auto_11741 ) ( not ( = ?auto_11740 ?auto_11746 ) ) ( not ( = ?auto_11741 ?auto_11746 ) ) ( not ( = ?auto_11748 ?auto_11746 ) ) ( SURFACE-AT ?auto_11748 ?auto_11745 ) ( CLEAR ?auto_11748 ) ( IS-CRATE ?auto_11740 ) ( AVAILABLE ?auto_11743 ) ( IN ?auto_11740 ?auto_11742 ) ( TRUCK-AT ?auto_11742 ?auto_11749 ) ( not ( = ?auto_11749 ?auto_11745 ) ) ( not ( = ?auto_11744 ?auto_11749 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11742 ?auto_11749 ?auto_11745 )
      ( MAKE-2CRATE ?auto_11748 ?auto_11740 ?auto_11741 )
      ( MAKE-1CRATE-VERIFY ?auto_11740 ?auto_11741 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11750 - SURFACE
      ?auto_11751 - SURFACE
      ?auto_11752 - SURFACE
    )
    :vars
    (
      ?auto_11757 - HOIST
      ?auto_11758 - PLACE
      ?auto_11754 - PLACE
      ?auto_11755 - HOIST
      ?auto_11753 - SURFACE
      ?auto_11756 - TRUCK
      ?auto_11759 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11757 ?auto_11758 ) ( IS-CRATE ?auto_11752 ) ( not ( = ?auto_11751 ?auto_11752 ) ) ( not ( = ?auto_11750 ?auto_11751 ) ) ( not ( = ?auto_11750 ?auto_11752 ) ) ( not ( = ?auto_11754 ?auto_11758 ) ) ( HOIST-AT ?auto_11755 ?auto_11754 ) ( not ( = ?auto_11757 ?auto_11755 ) ) ( AVAILABLE ?auto_11755 ) ( SURFACE-AT ?auto_11752 ?auto_11754 ) ( ON ?auto_11752 ?auto_11753 ) ( CLEAR ?auto_11752 ) ( not ( = ?auto_11751 ?auto_11753 ) ) ( not ( = ?auto_11752 ?auto_11753 ) ) ( not ( = ?auto_11750 ?auto_11753 ) ) ( SURFACE-AT ?auto_11750 ?auto_11758 ) ( CLEAR ?auto_11750 ) ( IS-CRATE ?auto_11751 ) ( AVAILABLE ?auto_11757 ) ( IN ?auto_11751 ?auto_11756 ) ( TRUCK-AT ?auto_11756 ?auto_11759 ) ( not ( = ?auto_11759 ?auto_11758 ) ) ( not ( = ?auto_11754 ?auto_11759 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11751 ?auto_11752 )
      ( MAKE-2CRATE-VERIFY ?auto_11750 ?auto_11751 ?auto_11752 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11760 - SURFACE
      ?auto_11761 - SURFACE
    )
    :vars
    (
      ?auto_11768 - HOIST
      ?auto_11762 - PLACE
      ?auto_11769 - SURFACE
      ?auto_11763 - PLACE
      ?auto_11767 - HOIST
      ?auto_11765 - SURFACE
      ?auto_11764 - TRUCK
      ?auto_11766 - PLACE
      ?auto_11770 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11768 ?auto_11762 ) ( IS-CRATE ?auto_11761 ) ( not ( = ?auto_11760 ?auto_11761 ) ) ( not ( = ?auto_11769 ?auto_11760 ) ) ( not ( = ?auto_11769 ?auto_11761 ) ) ( not ( = ?auto_11763 ?auto_11762 ) ) ( HOIST-AT ?auto_11767 ?auto_11763 ) ( not ( = ?auto_11768 ?auto_11767 ) ) ( AVAILABLE ?auto_11767 ) ( SURFACE-AT ?auto_11761 ?auto_11763 ) ( ON ?auto_11761 ?auto_11765 ) ( CLEAR ?auto_11761 ) ( not ( = ?auto_11760 ?auto_11765 ) ) ( not ( = ?auto_11761 ?auto_11765 ) ) ( not ( = ?auto_11769 ?auto_11765 ) ) ( SURFACE-AT ?auto_11769 ?auto_11762 ) ( CLEAR ?auto_11769 ) ( IS-CRATE ?auto_11760 ) ( AVAILABLE ?auto_11768 ) ( TRUCK-AT ?auto_11764 ?auto_11766 ) ( not ( = ?auto_11766 ?auto_11762 ) ) ( not ( = ?auto_11763 ?auto_11766 ) ) ( HOIST-AT ?auto_11770 ?auto_11766 ) ( LIFTING ?auto_11770 ?auto_11760 ) ( not ( = ?auto_11768 ?auto_11770 ) ) ( not ( = ?auto_11767 ?auto_11770 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11770 ?auto_11760 ?auto_11764 ?auto_11766 )
      ( MAKE-2CRATE ?auto_11769 ?auto_11760 ?auto_11761 )
      ( MAKE-1CRATE-VERIFY ?auto_11760 ?auto_11761 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11771 - SURFACE
      ?auto_11772 - SURFACE
      ?auto_11773 - SURFACE
    )
    :vars
    (
      ?auto_11779 - HOIST
      ?auto_11780 - PLACE
      ?auto_11777 - PLACE
      ?auto_11776 - HOIST
      ?auto_11775 - SURFACE
      ?auto_11774 - TRUCK
      ?auto_11778 - PLACE
      ?auto_11781 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11779 ?auto_11780 ) ( IS-CRATE ?auto_11773 ) ( not ( = ?auto_11772 ?auto_11773 ) ) ( not ( = ?auto_11771 ?auto_11772 ) ) ( not ( = ?auto_11771 ?auto_11773 ) ) ( not ( = ?auto_11777 ?auto_11780 ) ) ( HOIST-AT ?auto_11776 ?auto_11777 ) ( not ( = ?auto_11779 ?auto_11776 ) ) ( AVAILABLE ?auto_11776 ) ( SURFACE-AT ?auto_11773 ?auto_11777 ) ( ON ?auto_11773 ?auto_11775 ) ( CLEAR ?auto_11773 ) ( not ( = ?auto_11772 ?auto_11775 ) ) ( not ( = ?auto_11773 ?auto_11775 ) ) ( not ( = ?auto_11771 ?auto_11775 ) ) ( SURFACE-AT ?auto_11771 ?auto_11780 ) ( CLEAR ?auto_11771 ) ( IS-CRATE ?auto_11772 ) ( AVAILABLE ?auto_11779 ) ( TRUCK-AT ?auto_11774 ?auto_11778 ) ( not ( = ?auto_11778 ?auto_11780 ) ) ( not ( = ?auto_11777 ?auto_11778 ) ) ( HOIST-AT ?auto_11781 ?auto_11778 ) ( LIFTING ?auto_11781 ?auto_11772 ) ( not ( = ?auto_11779 ?auto_11781 ) ) ( not ( = ?auto_11776 ?auto_11781 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11772 ?auto_11773 )
      ( MAKE-2CRATE-VERIFY ?auto_11771 ?auto_11772 ?auto_11773 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11782 - SURFACE
      ?auto_11783 - SURFACE
    )
    :vars
    (
      ?auto_11790 - HOIST
      ?auto_11787 - PLACE
      ?auto_11789 - SURFACE
      ?auto_11786 - PLACE
      ?auto_11788 - HOIST
      ?auto_11791 - SURFACE
      ?auto_11785 - TRUCK
      ?auto_11792 - PLACE
      ?auto_11784 - HOIST
      ?auto_11793 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11790 ?auto_11787 ) ( IS-CRATE ?auto_11783 ) ( not ( = ?auto_11782 ?auto_11783 ) ) ( not ( = ?auto_11789 ?auto_11782 ) ) ( not ( = ?auto_11789 ?auto_11783 ) ) ( not ( = ?auto_11786 ?auto_11787 ) ) ( HOIST-AT ?auto_11788 ?auto_11786 ) ( not ( = ?auto_11790 ?auto_11788 ) ) ( AVAILABLE ?auto_11788 ) ( SURFACE-AT ?auto_11783 ?auto_11786 ) ( ON ?auto_11783 ?auto_11791 ) ( CLEAR ?auto_11783 ) ( not ( = ?auto_11782 ?auto_11791 ) ) ( not ( = ?auto_11783 ?auto_11791 ) ) ( not ( = ?auto_11789 ?auto_11791 ) ) ( SURFACE-AT ?auto_11789 ?auto_11787 ) ( CLEAR ?auto_11789 ) ( IS-CRATE ?auto_11782 ) ( AVAILABLE ?auto_11790 ) ( TRUCK-AT ?auto_11785 ?auto_11792 ) ( not ( = ?auto_11792 ?auto_11787 ) ) ( not ( = ?auto_11786 ?auto_11792 ) ) ( HOIST-AT ?auto_11784 ?auto_11792 ) ( not ( = ?auto_11790 ?auto_11784 ) ) ( not ( = ?auto_11788 ?auto_11784 ) ) ( AVAILABLE ?auto_11784 ) ( SURFACE-AT ?auto_11782 ?auto_11792 ) ( ON ?auto_11782 ?auto_11793 ) ( CLEAR ?auto_11782 ) ( not ( = ?auto_11782 ?auto_11793 ) ) ( not ( = ?auto_11783 ?auto_11793 ) ) ( not ( = ?auto_11789 ?auto_11793 ) ) ( not ( = ?auto_11791 ?auto_11793 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11784 ?auto_11782 ?auto_11793 ?auto_11792 )
      ( MAKE-2CRATE ?auto_11789 ?auto_11782 ?auto_11783 )
      ( MAKE-1CRATE-VERIFY ?auto_11782 ?auto_11783 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11794 - SURFACE
      ?auto_11795 - SURFACE
      ?auto_11796 - SURFACE
    )
    :vars
    (
      ?auto_11804 - HOIST
      ?auto_11798 - PLACE
      ?auto_11803 - PLACE
      ?auto_11797 - HOIST
      ?auto_11801 - SURFACE
      ?auto_11800 - TRUCK
      ?auto_11802 - PLACE
      ?auto_11799 - HOIST
      ?auto_11805 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11804 ?auto_11798 ) ( IS-CRATE ?auto_11796 ) ( not ( = ?auto_11795 ?auto_11796 ) ) ( not ( = ?auto_11794 ?auto_11795 ) ) ( not ( = ?auto_11794 ?auto_11796 ) ) ( not ( = ?auto_11803 ?auto_11798 ) ) ( HOIST-AT ?auto_11797 ?auto_11803 ) ( not ( = ?auto_11804 ?auto_11797 ) ) ( AVAILABLE ?auto_11797 ) ( SURFACE-AT ?auto_11796 ?auto_11803 ) ( ON ?auto_11796 ?auto_11801 ) ( CLEAR ?auto_11796 ) ( not ( = ?auto_11795 ?auto_11801 ) ) ( not ( = ?auto_11796 ?auto_11801 ) ) ( not ( = ?auto_11794 ?auto_11801 ) ) ( SURFACE-AT ?auto_11794 ?auto_11798 ) ( CLEAR ?auto_11794 ) ( IS-CRATE ?auto_11795 ) ( AVAILABLE ?auto_11804 ) ( TRUCK-AT ?auto_11800 ?auto_11802 ) ( not ( = ?auto_11802 ?auto_11798 ) ) ( not ( = ?auto_11803 ?auto_11802 ) ) ( HOIST-AT ?auto_11799 ?auto_11802 ) ( not ( = ?auto_11804 ?auto_11799 ) ) ( not ( = ?auto_11797 ?auto_11799 ) ) ( AVAILABLE ?auto_11799 ) ( SURFACE-AT ?auto_11795 ?auto_11802 ) ( ON ?auto_11795 ?auto_11805 ) ( CLEAR ?auto_11795 ) ( not ( = ?auto_11795 ?auto_11805 ) ) ( not ( = ?auto_11796 ?auto_11805 ) ) ( not ( = ?auto_11794 ?auto_11805 ) ) ( not ( = ?auto_11801 ?auto_11805 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11795 ?auto_11796 )
      ( MAKE-2CRATE-VERIFY ?auto_11794 ?auto_11795 ?auto_11796 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11806 - SURFACE
      ?auto_11807 - SURFACE
    )
    :vars
    (
      ?auto_11815 - HOIST
      ?auto_11813 - PLACE
      ?auto_11808 - SURFACE
      ?auto_11809 - PLACE
      ?auto_11814 - HOIST
      ?auto_11810 - SURFACE
      ?auto_11811 - PLACE
      ?auto_11817 - HOIST
      ?auto_11812 - SURFACE
      ?auto_11816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11815 ?auto_11813 ) ( IS-CRATE ?auto_11807 ) ( not ( = ?auto_11806 ?auto_11807 ) ) ( not ( = ?auto_11808 ?auto_11806 ) ) ( not ( = ?auto_11808 ?auto_11807 ) ) ( not ( = ?auto_11809 ?auto_11813 ) ) ( HOIST-AT ?auto_11814 ?auto_11809 ) ( not ( = ?auto_11815 ?auto_11814 ) ) ( AVAILABLE ?auto_11814 ) ( SURFACE-AT ?auto_11807 ?auto_11809 ) ( ON ?auto_11807 ?auto_11810 ) ( CLEAR ?auto_11807 ) ( not ( = ?auto_11806 ?auto_11810 ) ) ( not ( = ?auto_11807 ?auto_11810 ) ) ( not ( = ?auto_11808 ?auto_11810 ) ) ( SURFACE-AT ?auto_11808 ?auto_11813 ) ( CLEAR ?auto_11808 ) ( IS-CRATE ?auto_11806 ) ( AVAILABLE ?auto_11815 ) ( not ( = ?auto_11811 ?auto_11813 ) ) ( not ( = ?auto_11809 ?auto_11811 ) ) ( HOIST-AT ?auto_11817 ?auto_11811 ) ( not ( = ?auto_11815 ?auto_11817 ) ) ( not ( = ?auto_11814 ?auto_11817 ) ) ( AVAILABLE ?auto_11817 ) ( SURFACE-AT ?auto_11806 ?auto_11811 ) ( ON ?auto_11806 ?auto_11812 ) ( CLEAR ?auto_11806 ) ( not ( = ?auto_11806 ?auto_11812 ) ) ( not ( = ?auto_11807 ?auto_11812 ) ) ( not ( = ?auto_11808 ?auto_11812 ) ) ( not ( = ?auto_11810 ?auto_11812 ) ) ( TRUCK-AT ?auto_11816 ?auto_11813 ) )
    :subtasks
    ( ( !DRIVE ?auto_11816 ?auto_11813 ?auto_11811 )
      ( MAKE-2CRATE ?auto_11808 ?auto_11806 ?auto_11807 )
      ( MAKE-1CRATE-VERIFY ?auto_11806 ?auto_11807 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11818 - SURFACE
      ?auto_11819 - SURFACE
      ?auto_11820 - SURFACE
    )
    :vars
    (
      ?auto_11822 - HOIST
      ?auto_11823 - PLACE
      ?auto_11827 - PLACE
      ?auto_11821 - HOIST
      ?auto_11829 - SURFACE
      ?auto_11826 - PLACE
      ?auto_11824 - HOIST
      ?auto_11825 - SURFACE
      ?auto_11828 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11822 ?auto_11823 ) ( IS-CRATE ?auto_11820 ) ( not ( = ?auto_11819 ?auto_11820 ) ) ( not ( = ?auto_11818 ?auto_11819 ) ) ( not ( = ?auto_11818 ?auto_11820 ) ) ( not ( = ?auto_11827 ?auto_11823 ) ) ( HOIST-AT ?auto_11821 ?auto_11827 ) ( not ( = ?auto_11822 ?auto_11821 ) ) ( AVAILABLE ?auto_11821 ) ( SURFACE-AT ?auto_11820 ?auto_11827 ) ( ON ?auto_11820 ?auto_11829 ) ( CLEAR ?auto_11820 ) ( not ( = ?auto_11819 ?auto_11829 ) ) ( not ( = ?auto_11820 ?auto_11829 ) ) ( not ( = ?auto_11818 ?auto_11829 ) ) ( SURFACE-AT ?auto_11818 ?auto_11823 ) ( CLEAR ?auto_11818 ) ( IS-CRATE ?auto_11819 ) ( AVAILABLE ?auto_11822 ) ( not ( = ?auto_11826 ?auto_11823 ) ) ( not ( = ?auto_11827 ?auto_11826 ) ) ( HOIST-AT ?auto_11824 ?auto_11826 ) ( not ( = ?auto_11822 ?auto_11824 ) ) ( not ( = ?auto_11821 ?auto_11824 ) ) ( AVAILABLE ?auto_11824 ) ( SURFACE-AT ?auto_11819 ?auto_11826 ) ( ON ?auto_11819 ?auto_11825 ) ( CLEAR ?auto_11819 ) ( not ( = ?auto_11819 ?auto_11825 ) ) ( not ( = ?auto_11820 ?auto_11825 ) ) ( not ( = ?auto_11818 ?auto_11825 ) ) ( not ( = ?auto_11829 ?auto_11825 ) ) ( TRUCK-AT ?auto_11828 ?auto_11823 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11819 ?auto_11820 )
      ( MAKE-2CRATE-VERIFY ?auto_11818 ?auto_11819 ?auto_11820 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11839 - SURFACE
      ?auto_11840 - SURFACE
    )
    :vars
    (
      ?auto_11841 - HOIST
      ?auto_11842 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11841 ?auto_11842 ) ( SURFACE-AT ?auto_11839 ?auto_11842 ) ( CLEAR ?auto_11839 ) ( LIFTING ?auto_11841 ?auto_11840 ) ( IS-CRATE ?auto_11840 ) ( not ( = ?auto_11839 ?auto_11840 ) ) )
    :subtasks
    ( ( !DROP ?auto_11841 ?auto_11840 ?auto_11839 ?auto_11842 )
      ( MAKE-1CRATE-VERIFY ?auto_11839 ?auto_11840 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11843 - SURFACE
      ?auto_11844 - SURFACE
      ?auto_11845 - SURFACE
    )
    :vars
    (
      ?auto_11846 - HOIST
      ?auto_11847 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11846 ?auto_11847 ) ( SURFACE-AT ?auto_11844 ?auto_11847 ) ( CLEAR ?auto_11844 ) ( LIFTING ?auto_11846 ?auto_11845 ) ( IS-CRATE ?auto_11845 ) ( not ( = ?auto_11844 ?auto_11845 ) ) ( ON ?auto_11844 ?auto_11843 ) ( not ( = ?auto_11843 ?auto_11844 ) ) ( not ( = ?auto_11843 ?auto_11845 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11844 ?auto_11845 )
      ( MAKE-2CRATE-VERIFY ?auto_11843 ?auto_11844 ?auto_11845 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11848 - SURFACE
      ?auto_11849 - SURFACE
      ?auto_11850 - SURFACE
      ?auto_11851 - SURFACE
    )
    :vars
    (
      ?auto_11852 - HOIST
      ?auto_11853 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11852 ?auto_11853 ) ( SURFACE-AT ?auto_11850 ?auto_11853 ) ( CLEAR ?auto_11850 ) ( LIFTING ?auto_11852 ?auto_11851 ) ( IS-CRATE ?auto_11851 ) ( not ( = ?auto_11850 ?auto_11851 ) ) ( ON ?auto_11849 ?auto_11848 ) ( ON ?auto_11850 ?auto_11849 ) ( not ( = ?auto_11848 ?auto_11849 ) ) ( not ( = ?auto_11848 ?auto_11850 ) ) ( not ( = ?auto_11848 ?auto_11851 ) ) ( not ( = ?auto_11849 ?auto_11850 ) ) ( not ( = ?auto_11849 ?auto_11851 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11850 ?auto_11851 )
      ( MAKE-3CRATE-VERIFY ?auto_11848 ?auto_11849 ?auto_11850 ?auto_11851 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11854 - SURFACE
      ?auto_11855 - SURFACE
    )
    :vars
    (
      ?auto_11856 - HOIST
      ?auto_11857 - PLACE
      ?auto_11858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11856 ?auto_11857 ) ( SURFACE-AT ?auto_11854 ?auto_11857 ) ( CLEAR ?auto_11854 ) ( IS-CRATE ?auto_11855 ) ( not ( = ?auto_11854 ?auto_11855 ) ) ( TRUCK-AT ?auto_11858 ?auto_11857 ) ( AVAILABLE ?auto_11856 ) ( IN ?auto_11855 ?auto_11858 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11856 ?auto_11855 ?auto_11858 ?auto_11857 )
      ( MAKE-1CRATE ?auto_11854 ?auto_11855 )
      ( MAKE-1CRATE-VERIFY ?auto_11854 ?auto_11855 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11859 - SURFACE
      ?auto_11860 - SURFACE
      ?auto_11861 - SURFACE
    )
    :vars
    (
      ?auto_11863 - HOIST
      ?auto_11862 - PLACE
      ?auto_11864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11863 ?auto_11862 ) ( SURFACE-AT ?auto_11860 ?auto_11862 ) ( CLEAR ?auto_11860 ) ( IS-CRATE ?auto_11861 ) ( not ( = ?auto_11860 ?auto_11861 ) ) ( TRUCK-AT ?auto_11864 ?auto_11862 ) ( AVAILABLE ?auto_11863 ) ( IN ?auto_11861 ?auto_11864 ) ( ON ?auto_11860 ?auto_11859 ) ( not ( = ?auto_11859 ?auto_11860 ) ) ( not ( = ?auto_11859 ?auto_11861 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11860 ?auto_11861 )
      ( MAKE-2CRATE-VERIFY ?auto_11859 ?auto_11860 ?auto_11861 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11865 - SURFACE
      ?auto_11866 - SURFACE
      ?auto_11867 - SURFACE
      ?auto_11868 - SURFACE
    )
    :vars
    (
      ?auto_11869 - HOIST
      ?auto_11871 - PLACE
      ?auto_11870 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11869 ?auto_11871 ) ( SURFACE-AT ?auto_11867 ?auto_11871 ) ( CLEAR ?auto_11867 ) ( IS-CRATE ?auto_11868 ) ( not ( = ?auto_11867 ?auto_11868 ) ) ( TRUCK-AT ?auto_11870 ?auto_11871 ) ( AVAILABLE ?auto_11869 ) ( IN ?auto_11868 ?auto_11870 ) ( ON ?auto_11867 ?auto_11866 ) ( not ( = ?auto_11866 ?auto_11867 ) ) ( not ( = ?auto_11866 ?auto_11868 ) ) ( ON ?auto_11866 ?auto_11865 ) ( not ( = ?auto_11865 ?auto_11866 ) ) ( not ( = ?auto_11865 ?auto_11867 ) ) ( not ( = ?auto_11865 ?auto_11868 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11866 ?auto_11867 ?auto_11868 )
      ( MAKE-3CRATE-VERIFY ?auto_11865 ?auto_11866 ?auto_11867 ?auto_11868 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11872 - SURFACE
      ?auto_11873 - SURFACE
    )
    :vars
    (
      ?auto_11875 - HOIST
      ?auto_11877 - PLACE
      ?auto_11876 - TRUCK
      ?auto_11874 - SURFACE
      ?auto_11878 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11875 ?auto_11877 ) ( SURFACE-AT ?auto_11872 ?auto_11877 ) ( CLEAR ?auto_11872 ) ( IS-CRATE ?auto_11873 ) ( not ( = ?auto_11872 ?auto_11873 ) ) ( AVAILABLE ?auto_11875 ) ( IN ?auto_11873 ?auto_11876 ) ( ON ?auto_11872 ?auto_11874 ) ( not ( = ?auto_11874 ?auto_11872 ) ) ( not ( = ?auto_11874 ?auto_11873 ) ) ( TRUCK-AT ?auto_11876 ?auto_11878 ) ( not ( = ?auto_11878 ?auto_11877 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11876 ?auto_11878 ?auto_11877 )
      ( MAKE-2CRATE ?auto_11874 ?auto_11872 ?auto_11873 )
      ( MAKE-1CRATE-VERIFY ?auto_11872 ?auto_11873 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11879 - SURFACE
      ?auto_11880 - SURFACE
      ?auto_11881 - SURFACE
    )
    :vars
    (
      ?auto_11882 - HOIST
      ?auto_11885 - PLACE
      ?auto_11883 - TRUCK
      ?auto_11884 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11882 ?auto_11885 ) ( SURFACE-AT ?auto_11880 ?auto_11885 ) ( CLEAR ?auto_11880 ) ( IS-CRATE ?auto_11881 ) ( not ( = ?auto_11880 ?auto_11881 ) ) ( AVAILABLE ?auto_11882 ) ( IN ?auto_11881 ?auto_11883 ) ( ON ?auto_11880 ?auto_11879 ) ( not ( = ?auto_11879 ?auto_11880 ) ) ( not ( = ?auto_11879 ?auto_11881 ) ) ( TRUCK-AT ?auto_11883 ?auto_11884 ) ( not ( = ?auto_11884 ?auto_11885 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11880 ?auto_11881 )
      ( MAKE-2CRATE-VERIFY ?auto_11879 ?auto_11880 ?auto_11881 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11886 - SURFACE
      ?auto_11887 - SURFACE
      ?auto_11888 - SURFACE
      ?auto_11889 - SURFACE
    )
    :vars
    (
      ?auto_11893 - HOIST
      ?auto_11890 - PLACE
      ?auto_11892 - TRUCK
      ?auto_11891 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11893 ?auto_11890 ) ( SURFACE-AT ?auto_11888 ?auto_11890 ) ( CLEAR ?auto_11888 ) ( IS-CRATE ?auto_11889 ) ( not ( = ?auto_11888 ?auto_11889 ) ) ( AVAILABLE ?auto_11893 ) ( IN ?auto_11889 ?auto_11892 ) ( ON ?auto_11888 ?auto_11887 ) ( not ( = ?auto_11887 ?auto_11888 ) ) ( not ( = ?auto_11887 ?auto_11889 ) ) ( TRUCK-AT ?auto_11892 ?auto_11891 ) ( not ( = ?auto_11891 ?auto_11890 ) ) ( ON ?auto_11887 ?auto_11886 ) ( not ( = ?auto_11886 ?auto_11887 ) ) ( not ( = ?auto_11886 ?auto_11888 ) ) ( not ( = ?auto_11886 ?auto_11889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11887 ?auto_11888 ?auto_11889 )
      ( MAKE-3CRATE-VERIFY ?auto_11886 ?auto_11887 ?auto_11888 ?auto_11889 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11894 - SURFACE
      ?auto_11895 - SURFACE
    )
    :vars
    (
      ?auto_11900 - HOIST
      ?auto_11896 - PLACE
      ?auto_11899 - SURFACE
      ?auto_11898 - TRUCK
      ?auto_11897 - PLACE
      ?auto_11901 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11900 ?auto_11896 ) ( SURFACE-AT ?auto_11894 ?auto_11896 ) ( CLEAR ?auto_11894 ) ( IS-CRATE ?auto_11895 ) ( not ( = ?auto_11894 ?auto_11895 ) ) ( AVAILABLE ?auto_11900 ) ( ON ?auto_11894 ?auto_11899 ) ( not ( = ?auto_11899 ?auto_11894 ) ) ( not ( = ?auto_11899 ?auto_11895 ) ) ( TRUCK-AT ?auto_11898 ?auto_11897 ) ( not ( = ?auto_11897 ?auto_11896 ) ) ( HOIST-AT ?auto_11901 ?auto_11897 ) ( LIFTING ?auto_11901 ?auto_11895 ) ( not ( = ?auto_11900 ?auto_11901 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11901 ?auto_11895 ?auto_11898 ?auto_11897 )
      ( MAKE-2CRATE ?auto_11899 ?auto_11894 ?auto_11895 )
      ( MAKE-1CRATE-VERIFY ?auto_11894 ?auto_11895 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11902 - SURFACE
      ?auto_11903 - SURFACE
      ?auto_11904 - SURFACE
    )
    :vars
    (
      ?auto_11908 - HOIST
      ?auto_11907 - PLACE
      ?auto_11909 - TRUCK
      ?auto_11906 - PLACE
      ?auto_11905 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11908 ?auto_11907 ) ( SURFACE-AT ?auto_11903 ?auto_11907 ) ( CLEAR ?auto_11903 ) ( IS-CRATE ?auto_11904 ) ( not ( = ?auto_11903 ?auto_11904 ) ) ( AVAILABLE ?auto_11908 ) ( ON ?auto_11903 ?auto_11902 ) ( not ( = ?auto_11902 ?auto_11903 ) ) ( not ( = ?auto_11902 ?auto_11904 ) ) ( TRUCK-AT ?auto_11909 ?auto_11906 ) ( not ( = ?auto_11906 ?auto_11907 ) ) ( HOIST-AT ?auto_11905 ?auto_11906 ) ( LIFTING ?auto_11905 ?auto_11904 ) ( not ( = ?auto_11908 ?auto_11905 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11903 ?auto_11904 )
      ( MAKE-2CRATE-VERIFY ?auto_11902 ?auto_11903 ?auto_11904 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11910 - SURFACE
      ?auto_11911 - SURFACE
      ?auto_11912 - SURFACE
      ?auto_11913 - SURFACE
    )
    :vars
    (
      ?auto_11918 - HOIST
      ?auto_11914 - PLACE
      ?auto_11915 - TRUCK
      ?auto_11916 - PLACE
      ?auto_11917 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11918 ?auto_11914 ) ( SURFACE-AT ?auto_11912 ?auto_11914 ) ( CLEAR ?auto_11912 ) ( IS-CRATE ?auto_11913 ) ( not ( = ?auto_11912 ?auto_11913 ) ) ( AVAILABLE ?auto_11918 ) ( ON ?auto_11912 ?auto_11911 ) ( not ( = ?auto_11911 ?auto_11912 ) ) ( not ( = ?auto_11911 ?auto_11913 ) ) ( TRUCK-AT ?auto_11915 ?auto_11916 ) ( not ( = ?auto_11916 ?auto_11914 ) ) ( HOIST-AT ?auto_11917 ?auto_11916 ) ( LIFTING ?auto_11917 ?auto_11913 ) ( not ( = ?auto_11918 ?auto_11917 ) ) ( ON ?auto_11911 ?auto_11910 ) ( not ( = ?auto_11910 ?auto_11911 ) ) ( not ( = ?auto_11910 ?auto_11912 ) ) ( not ( = ?auto_11910 ?auto_11913 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11911 ?auto_11912 ?auto_11913 )
      ( MAKE-3CRATE-VERIFY ?auto_11910 ?auto_11911 ?auto_11912 ?auto_11913 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11919 - SURFACE
      ?auto_11920 - SURFACE
    )
    :vars
    (
      ?auto_11926 - HOIST
      ?auto_11921 - PLACE
      ?auto_11923 - SURFACE
      ?auto_11922 - TRUCK
      ?auto_11924 - PLACE
      ?auto_11925 - HOIST
      ?auto_11927 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11926 ?auto_11921 ) ( SURFACE-AT ?auto_11919 ?auto_11921 ) ( CLEAR ?auto_11919 ) ( IS-CRATE ?auto_11920 ) ( not ( = ?auto_11919 ?auto_11920 ) ) ( AVAILABLE ?auto_11926 ) ( ON ?auto_11919 ?auto_11923 ) ( not ( = ?auto_11923 ?auto_11919 ) ) ( not ( = ?auto_11923 ?auto_11920 ) ) ( TRUCK-AT ?auto_11922 ?auto_11924 ) ( not ( = ?auto_11924 ?auto_11921 ) ) ( HOIST-AT ?auto_11925 ?auto_11924 ) ( not ( = ?auto_11926 ?auto_11925 ) ) ( AVAILABLE ?auto_11925 ) ( SURFACE-AT ?auto_11920 ?auto_11924 ) ( ON ?auto_11920 ?auto_11927 ) ( CLEAR ?auto_11920 ) ( not ( = ?auto_11919 ?auto_11927 ) ) ( not ( = ?auto_11920 ?auto_11927 ) ) ( not ( = ?auto_11923 ?auto_11927 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11925 ?auto_11920 ?auto_11927 ?auto_11924 )
      ( MAKE-2CRATE ?auto_11923 ?auto_11919 ?auto_11920 )
      ( MAKE-1CRATE-VERIFY ?auto_11919 ?auto_11920 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11928 - SURFACE
      ?auto_11929 - SURFACE
      ?auto_11930 - SURFACE
    )
    :vars
    (
      ?auto_11931 - HOIST
      ?auto_11933 - PLACE
      ?auto_11934 - TRUCK
      ?auto_11935 - PLACE
      ?auto_11932 - HOIST
      ?auto_11936 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11931 ?auto_11933 ) ( SURFACE-AT ?auto_11929 ?auto_11933 ) ( CLEAR ?auto_11929 ) ( IS-CRATE ?auto_11930 ) ( not ( = ?auto_11929 ?auto_11930 ) ) ( AVAILABLE ?auto_11931 ) ( ON ?auto_11929 ?auto_11928 ) ( not ( = ?auto_11928 ?auto_11929 ) ) ( not ( = ?auto_11928 ?auto_11930 ) ) ( TRUCK-AT ?auto_11934 ?auto_11935 ) ( not ( = ?auto_11935 ?auto_11933 ) ) ( HOIST-AT ?auto_11932 ?auto_11935 ) ( not ( = ?auto_11931 ?auto_11932 ) ) ( AVAILABLE ?auto_11932 ) ( SURFACE-AT ?auto_11930 ?auto_11935 ) ( ON ?auto_11930 ?auto_11936 ) ( CLEAR ?auto_11930 ) ( not ( = ?auto_11929 ?auto_11936 ) ) ( not ( = ?auto_11930 ?auto_11936 ) ) ( not ( = ?auto_11928 ?auto_11936 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11929 ?auto_11930 )
      ( MAKE-2CRATE-VERIFY ?auto_11928 ?auto_11929 ?auto_11930 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11937 - SURFACE
      ?auto_11938 - SURFACE
      ?auto_11939 - SURFACE
      ?auto_11940 - SURFACE
    )
    :vars
    (
      ?auto_11945 - HOIST
      ?auto_11943 - PLACE
      ?auto_11946 - TRUCK
      ?auto_11942 - PLACE
      ?auto_11941 - HOIST
      ?auto_11944 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11945 ?auto_11943 ) ( SURFACE-AT ?auto_11939 ?auto_11943 ) ( CLEAR ?auto_11939 ) ( IS-CRATE ?auto_11940 ) ( not ( = ?auto_11939 ?auto_11940 ) ) ( AVAILABLE ?auto_11945 ) ( ON ?auto_11939 ?auto_11938 ) ( not ( = ?auto_11938 ?auto_11939 ) ) ( not ( = ?auto_11938 ?auto_11940 ) ) ( TRUCK-AT ?auto_11946 ?auto_11942 ) ( not ( = ?auto_11942 ?auto_11943 ) ) ( HOIST-AT ?auto_11941 ?auto_11942 ) ( not ( = ?auto_11945 ?auto_11941 ) ) ( AVAILABLE ?auto_11941 ) ( SURFACE-AT ?auto_11940 ?auto_11942 ) ( ON ?auto_11940 ?auto_11944 ) ( CLEAR ?auto_11940 ) ( not ( = ?auto_11939 ?auto_11944 ) ) ( not ( = ?auto_11940 ?auto_11944 ) ) ( not ( = ?auto_11938 ?auto_11944 ) ) ( ON ?auto_11938 ?auto_11937 ) ( not ( = ?auto_11937 ?auto_11938 ) ) ( not ( = ?auto_11937 ?auto_11939 ) ) ( not ( = ?auto_11937 ?auto_11940 ) ) ( not ( = ?auto_11937 ?auto_11944 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11938 ?auto_11939 ?auto_11940 )
      ( MAKE-3CRATE-VERIFY ?auto_11937 ?auto_11938 ?auto_11939 ?auto_11940 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11947 - SURFACE
      ?auto_11948 - SURFACE
    )
    :vars
    (
      ?auto_11954 - HOIST
      ?auto_11951 - PLACE
      ?auto_11952 - SURFACE
      ?auto_11950 - PLACE
      ?auto_11949 - HOIST
      ?auto_11953 - SURFACE
      ?auto_11955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11954 ?auto_11951 ) ( SURFACE-AT ?auto_11947 ?auto_11951 ) ( CLEAR ?auto_11947 ) ( IS-CRATE ?auto_11948 ) ( not ( = ?auto_11947 ?auto_11948 ) ) ( AVAILABLE ?auto_11954 ) ( ON ?auto_11947 ?auto_11952 ) ( not ( = ?auto_11952 ?auto_11947 ) ) ( not ( = ?auto_11952 ?auto_11948 ) ) ( not ( = ?auto_11950 ?auto_11951 ) ) ( HOIST-AT ?auto_11949 ?auto_11950 ) ( not ( = ?auto_11954 ?auto_11949 ) ) ( AVAILABLE ?auto_11949 ) ( SURFACE-AT ?auto_11948 ?auto_11950 ) ( ON ?auto_11948 ?auto_11953 ) ( CLEAR ?auto_11948 ) ( not ( = ?auto_11947 ?auto_11953 ) ) ( not ( = ?auto_11948 ?auto_11953 ) ) ( not ( = ?auto_11952 ?auto_11953 ) ) ( TRUCK-AT ?auto_11955 ?auto_11951 ) )
    :subtasks
    ( ( !DRIVE ?auto_11955 ?auto_11951 ?auto_11950 )
      ( MAKE-2CRATE ?auto_11952 ?auto_11947 ?auto_11948 )
      ( MAKE-1CRATE-VERIFY ?auto_11947 ?auto_11948 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11956 - SURFACE
      ?auto_11957 - SURFACE
      ?auto_11958 - SURFACE
    )
    :vars
    (
      ?auto_11962 - HOIST
      ?auto_11960 - PLACE
      ?auto_11961 - PLACE
      ?auto_11964 - HOIST
      ?auto_11959 - SURFACE
      ?auto_11963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11962 ?auto_11960 ) ( SURFACE-AT ?auto_11957 ?auto_11960 ) ( CLEAR ?auto_11957 ) ( IS-CRATE ?auto_11958 ) ( not ( = ?auto_11957 ?auto_11958 ) ) ( AVAILABLE ?auto_11962 ) ( ON ?auto_11957 ?auto_11956 ) ( not ( = ?auto_11956 ?auto_11957 ) ) ( not ( = ?auto_11956 ?auto_11958 ) ) ( not ( = ?auto_11961 ?auto_11960 ) ) ( HOIST-AT ?auto_11964 ?auto_11961 ) ( not ( = ?auto_11962 ?auto_11964 ) ) ( AVAILABLE ?auto_11964 ) ( SURFACE-AT ?auto_11958 ?auto_11961 ) ( ON ?auto_11958 ?auto_11959 ) ( CLEAR ?auto_11958 ) ( not ( = ?auto_11957 ?auto_11959 ) ) ( not ( = ?auto_11958 ?auto_11959 ) ) ( not ( = ?auto_11956 ?auto_11959 ) ) ( TRUCK-AT ?auto_11963 ?auto_11960 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11957 ?auto_11958 )
      ( MAKE-2CRATE-VERIFY ?auto_11956 ?auto_11957 ?auto_11958 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11965 - SURFACE
      ?auto_11966 - SURFACE
      ?auto_11967 - SURFACE
      ?auto_11968 - SURFACE
    )
    :vars
    (
      ?auto_11969 - HOIST
      ?auto_11973 - PLACE
      ?auto_11971 - PLACE
      ?auto_11972 - HOIST
      ?auto_11970 - SURFACE
      ?auto_11974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11969 ?auto_11973 ) ( SURFACE-AT ?auto_11967 ?auto_11973 ) ( CLEAR ?auto_11967 ) ( IS-CRATE ?auto_11968 ) ( not ( = ?auto_11967 ?auto_11968 ) ) ( AVAILABLE ?auto_11969 ) ( ON ?auto_11967 ?auto_11966 ) ( not ( = ?auto_11966 ?auto_11967 ) ) ( not ( = ?auto_11966 ?auto_11968 ) ) ( not ( = ?auto_11971 ?auto_11973 ) ) ( HOIST-AT ?auto_11972 ?auto_11971 ) ( not ( = ?auto_11969 ?auto_11972 ) ) ( AVAILABLE ?auto_11972 ) ( SURFACE-AT ?auto_11968 ?auto_11971 ) ( ON ?auto_11968 ?auto_11970 ) ( CLEAR ?auto_11968 ) ( not ( = ?auto_11967 ?auto_11970 ) ) ( not ( = ?auto_11968 ?auto_11970 ) ) ( not ( = ?auto_11966 ?auto_11970 ) ) ( TRUCK-AT ?auto_11974 ?auto_11973 ) ( ON ?auto_11966 ?auto_11965 ) ( not ( = ?auto_11965 ?auto_11966 ) ) ( not ( = ?auto_11965 ?auto_11967 ) ) ( not ( = ?auto_11965 ?auto_11968 ) ) ( not ( = ?auto_11965 ?auto_11970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11966 ?auto_11967 ?auto_11968 )
      ( MAKE-3CRATE-VERIFY ?auto_11965 ?auto_11966 ?auto_11967 ?auto_11968 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11975 - SURFACE
      ?auto_11976 - SURFACE
    )
    :vars
    (
      ?auto_11977 - HOIST
      ?auto_11982 - PLACE
      ?auto_11979 - SURFACE
      ?auto_11980 - PLACE
      ?auto_11981 - HOIST
      ?auto_11978 - SURFACE
      ?auto_11983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11977 ?auto_11982 ) ( IS-CRATE ?auto_11976 ) ( not ( = ?auto_11975 ?auto_11976 ) ) ( not ( = ?auto_11979 ?auto_11975 ) ) ( not ( = ?auto_11979 ?auto_11976 ) ) ( not ( = ?auto_11980 ?auto_11982 ) ) ( HOIST-AT ?auto_11981 ?auto_11980 ) ( not ( = ?auto_11977 ?auto_11981 ) ) ( AVAILABLE ?auto_11981 ) ( SURFACE-AT ?auto_11976 ?auto_11980 ) ( ON ?auto_11976 ?auto_11978 ) ( CLEAR ?auto_11976 ) ( not ( = ?auto_11975 ?auto_11978 ) ) ( not ( = ?auto_11976 ?auto_11978 ) ) ( not ( = ?auto_11979 ?auto_11978 ) ) ( TRUCK-AT ?auto_11983 ?auto_11982 ) ( SURFACE-AT ?auto_11979 ?auto_11982 ) ( CLEAR ?auto_11979 ) ( LIFTING ?auto_11977 ?auto_11975 ) ( IS-CRATE ?auto_11975 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11979 ?auto_11975 )
      ( MAKE-2CRATE ?auto_11979 ?auto_11975 ?auto_11976 )
      ( MAKE-1CRATE-VERIFY ?auto_11975 ?auto_11976 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11984 - SURFACE
      ?auto_11985 - SURFACE
      ?auto_11986 - SURFACE
    )
    :vars
    (
      ?auto_11991 - HOIST
      ?auto_11988 - PLACE
      ?auto_11990 - PLACE
      ?auto_11992 - HOIST
      ?auto_11987 - SURFACE
      ?auto_11989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11991 ?auto_11988 ) ( IS-CRATE ?auto_11986 ) ( not ( = ?auto_11985 ?auto_11986 ) ) ( not ( = ?auto_11984 ?auto_11985 ) ) ( not ( = ?auto_11984 ?auto_11986 ) ) ( not ( = ?auto_11990 ?auto_11988 ) ) ( HOIST-AT ?auto_11992 ?auto_11990 ) ( not ( = ?auto_11991 ?auto_11992 ) ) ( AVAILABLE ?auto_11992 ) ( SURFACE-AT ?auto_11986 ?auto_11990 ) ( ON ?auto_11986 ?auto_11987 ) ( CLEAR ?auto_11986 ) ( not ( = ?auto_11985 ?auto_11987 ) ) ( not ( = ?auto_11986 ?auto_11987 ) ) ( not ( = ?auto_11984 ?auto_11987 ) ) ( TRUCK-AT ?auto_11989 ?auto_11988 ) ( SURFACE-AT ?auto_11984 ?auto_11988 ) ( CLEAR ?auto_11984 ) ( LIFTING ?auto_11991 ?auto_11985 ) ( IS-CRATE ?auto_11985 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11985 ?auto_11986 )
      ( MAKE-2CRATE-VERIFY ?auto_11984 ?auto_11985 ?auto_11986 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11993 - SURFACE
      ?auto_11994 - SURFACE
      ?auto_11995 - SURFACE
      ?auto_11996 - SURFACE
    )
    :vars
    (
      ?auto_11998 - HOIST
      ?auto_11999 - PLACE
      ?auto_12000 - PLACE
      ?auto_12002 - HOIST
      ?auto_11997 - SURFACE
      ?auto_12001 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11998 ?auto_11999 ) ( IS-CRATE ?auto_11996 ) ( not ( = ?auto_11995 ?auto_11996 ) ) ( not ( = ?auto_11994 ?auto_11995 ) ) ( not ( = ?auto_11994 ?auto_11996 ) ) ( not ( = ?auto_12000 ?auto_11999 ) ) ( HOIST-AT ?auto_12002 ?auto_12000 ) ( not ( = ?auto_11998 ?auto_12002 ) ) ( AVAILABLE ?auto_12002 ) ( SURFACE-AT ?auto_11996 ?auto_12000 ) ( ON ?auto_11996 ?auto_11997 ) ( CLEAR ?auto_11996 ) ( not ( = ?auto_11995 ?auto_11997 ) ) ( not ( = ?auto_11996 ?auto_11997 ) ) ( not ( = ?auto_11994 ?auto_11997 ) ) ( TRUCK-AT ?auto_12001 ?auto_11999 ) ( SURFACE-AT ?auto_11994 ?auto_11999 ) ( CLEAR ?auto_11994 ) ( LIFTING ?auto_11998 ?auto_11995 ) ( IS-CRATE ?auto_11995 ) ( ON ?auto_11994 ?auto_11993 ) ( not ( = ?auto_11993 ?auto_11994 ) ) ( not ( = ?auto_11993 ?auto_11995 ) ) ( not ( = ?auto_11993 ?auto_11996 ) ) ( not ( = ?auto_11993 ?auto_11997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11994 ?auto_11995 ?auto_11996 )
      ( MAKE-3CRATE-VERIFY ?auto_11993 ?auto_11994 ?auto_11995 ?auto_11996 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12003 - SURFACE
      ?auto_12004 - SURFACE
    )
    :vars
    (
      ?auto_12006 - HOIST
      ?auto_12007 - PLACE
      ?auto_12010 - SURFACE
      ?auto_12008 - PLACE
      ?auto_12011 - HOIST
      ?auto_12005 - SURFACE
      ?auto_12009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12006 ?auto_12007 ) ( IS-CRATE ?auto_12004 ) ( not ( = ?auto_12003 ?auto_12004 ) ) ( not ( = ?auto_12010 ?auto_12003 ) ) ( not ( = ?auto_12010 ?auto_12004 ) ) ( not ( = ?auto_12008 ?auto_12007 ) ) ( HOIST-AT ?auto_12011 ?auto_12008 ) ( not ( = ?auto_12006 ?auto_12011 ) ) ( AVAILABLE ?auto_12011 ) ( SURFACE-AT ?auto_12004 ?auto_12008 ) ( ON ?auto_12004 ?auto_12005 ) ( CLEAR ?auto_12004 ) ( not ( = ?auto_12003 ?auto_12005 ) ) ( not ( = ?auto_12004 ?auto_12005 ) ) ( not ( = ?auto_12010 ?auto_12005 ) ) ( TRUCK-AT ?auto_12009 ?auto_12007 ) ( SURFACE-AT ?auto_12010 ?auto_12007 ) ( CLEAR ?auto_12010 ) ( IS-CRATE ?auto_12003 ) ( AVAILABLE ?auto_12006 ) ( IN ?auto_12003 ?auto_12009 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12006 ?auto_12003 ?auto_12009 ?auto_12007 )
      ( MAKE-2CRATE ?auto_12010 ?auto_12003 ?auto_12004 )
      ( MAKE-1CRATE-VERIFY ?auto_12003 ?auto_12004 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12012 - SURFACE
      ?auto_12013 - SURFACE
      ?auto_12014 - SURFACE
    )
    :vars
    (
      ?auto_12019 - HOIST
      ?auto_12020 - PLACE
      ?auto_12018 - PLACE
      ?auto_12016 - HOIST
      ?auto_12015 - SURFACE
      ?auto_12017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12019 ?auto_12020 ) ( IS-CRATE ?auto_12014 ) ( not ( = ?auto_12013 ?auto_12014 ) ) ( not ( = ?auto_12012 ?auto_12013 ) ) ( not ( = ?auto_12012 ?auto_12014 ) ) ( not ( = ?auto_12018 ?auto_12020 ) ) ( HOIST-AT ?auto_12016 ?auto_12018 ) ( not ( = ?auto_12019 ?auto_12016 ) ) ( AVAILABLE ?auto_12016 ) ( SURFACE-AT ?auto_12014 ?auto_12018 ) ( ON ?auto_12014 ?auto_12015 ) ( CLEAR ?auto_12014 ) ( not ( = ?auto_12013 ?auto_12015 ) ) ( not ( = ?auto_12014 ?auto_12015 ) ) ( not ( = ?auto_12012 ?auto_12015 ) ) ( TRUCK-AT ?auto_12017 ?auto_12020 ) ( SURFACE-AT ?auto_12012 ?auto_12020 ) ( CLEAR ?auto_12012 ) ( IS-CRATE ?auto_12013 ) ( AVAILABLE ?auto_12019 ) ( IN ?auto_12013 ?auto_12017 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12013 ?auto_12014 )
      ( MAKE-2CRATE-VERIFY ?auto_12012 ?auto_12013 ?auto_12014 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12021 - SURFACE
      ?auto_12022 - SURFACE
      ?auto_12023 - SURFACE
      ?auto_12024 - SURFACE
    )
    :vars
    (
      ?auto_12026 - HOIST
      ?auto_12027 - PLACE
      ?auto_12025 - PLACE
      ?auto_12029 - HOIST
      ?auto_12028 - SURFACE
      ?auto_12030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12026 ?auto_12027 ) ( IS-CRATE ?auto_12024 ) ( not ( = ?auto_12023 ?auto_12024 ) ) ( not ( = ?auto_12022 ?auto_12023 ) ) ( not ( = ?auto_12022 ?auto_12024 ) ) ( not ( = ?auto_12025 ?auto_12027 ) ) ( HOIST-AT ?auto_12029 ?auto_12025 ) ( not ( = ?auto_12026 ?auto_12029 ) ) ( AVAILABLE ?auto_12029 ) ( SURFACE-AT ?auto_12024 ?auto_12025 ) ( ON ?auto_12024 ?auto_12028 ) ( CLEAR ?auto_12024 ) ( not ( = ?auto_12023 ?auto_12028 ) ) ( not ( = ?auto_12024 ?auto_12028 ) ) ( not ( = ?auto_12022 ?auto_12028 ) ) ( TRUCK-AT ?auto_12030 ?auto_12027 ) ( SURFACE-AT ?auto_12022 ?auto_12027 ) ( CLEAR ?auto_12022 ) ( IS-CRATE ?auto_12023 ) ( AVAILABLE ?auto_12026 ) ( IN ?auto_12023 ?auto_12030 ) ( ON ?auto_12022 ?auto_12021 ) ( not ( = ?auto_12021 ?auto_12022 ) ) ( not ( = ?auto_12021 ?auto_12023 ) ) ( not ( = ?auto_12021 ?auto_12024 ) ) ( not ( = ?auto_12021 ?auto_12028 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12022 ?auto_12023 ?auto_12024 )
      ( MAKE-3CRATE-VERIFY ?auto_12021 ?auto_12022 ?auto_12023 ?auto_12024 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12031 - SURFACE
      ?auto_12032 - SURFACE
    )
    :vars
    (
      ?auto_12034 - HOIST
      ?auto_12036 - PLACE
      ?auto_12035 - SURFACE
      ?auto_12033 - PLACE
      ?auto_12038 - HOIST
      ?auto_12037 - SURFACE
      ?auto_12039 - TRUCK
      ?auto_12040 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12034 ?auto_12036 ) ( IS-CRATE ?auto_12032 ) ( not ( = ?auto_12031 ?auto_12032 ) ) ( not ( = ?auto_12035 ?auto_12031 ) ) ( not ( = ?auto_12035 ?auto_12032 ) ) ( not ( = ?auto_12033 ?auto_12036 ) ) ( HOIST-AT ?auto_12038 ?auto_12033 ) ( not ( = ?auto_12034 ?auto_12038 ) ) ( AVAILABLE ?auto_12038 ) ( SURFACE-AT ?auto_12032 ?auto_12033 ) ( ON ?auto_12032 ?auto_12037 ) ( CLEAR ?auto_12032 ) ( not ( = ?auto_12031 ?auto_12037 ) ) ( not ( = ?auto_12032 ?auto_12037 ) ) ( not ( = ?auto_12035 ?auto_12037 ) ) ( SURFACE-AT ?auto_12035 ?auto_12036 ) ( CLEAR ?auto_12035 ) ( IS-CRATE ?auto_12031 ) ( AVAILABLE ?auto_12034 ) ( IN ?auto_12031 ?auto_12039 ) ( TRUCK-AT ?auto_12039 ?auto_12040 ) ( not ( = ?auto_12040 ?auto_12036 ) ) ( not ( = ?auto_12033 ?auto_12040 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12039 ?auto_12040 ?auto_12036 )
      ( MAKE-2CRATE ?auto_12035 ?auto_12031 ?auto_12032 )
      ( MAKE-1CRATE-VERIFY ?auto_12031 ?auto_12032 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12041 - SURFACE
      ?auto_12042 - SURFACE
      ?auto_12043 - SURFACE
    )
    :vars
    (
      ?auto_12050 - HOIST
      ?auto_12049 - PLACE
      ?auto_12044 - PLACE
      ?auto_12048 - HOIST
      ?auto_12045 - SURFACE
      ?auto_12046 - TRUCK
      ?auto_12047 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12050 ?auto_12049 ) ( IS-CRATE ?auto_12043 ) ( not ( = ?auto_12042 ?auto_12043 ) ) ( not ( = ?auto_12041 ?auto_12042 ) ) ( not ( = ?auto_12041 ?auto_12043 ) ) ( not ( = ?auto_12044 ?auto_12049 ) ) ( HOIST-AT ?auto_12048 ?auto_12044 ) ( not ( = ?auto_12050 ?auto_12048 ) ) ( AVAILABLE ?auto_12048 ) ( SURFACE-AT ?auto_12043 ?auto_12044 ) ( ON ?auto_12043 ?auto_12045 ) ( CLEAR ?auto_12043 ) ( not ( = ?auto_12042 ?auto_12045 ) ) ( not ( = ?auto_12043 ?auto_12045 ) ) ( not ( = ?auto_12041 ?auto_12045 ) ) ( SURFACE-AT ?auto_12041 ?auto_12049 ) ( CLEAR ?auto_12041 ) ( IS-CRATE ?auto_12042 ) ( AVAILABLE ?auto_12050 ) ( IN ?auto_12042 ?auto_12046 ) ( TRUCK-AT ?auto_12046 ?auto_12047 ) ( not ( = ?auto_12047 ?auto_12049 ) ) ( not ( = ?auto_12044 ?auto_12047 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12042 ?auto_12043 )
      ( MAKE-2CRATE-VERIFY ?auto_12041 ?auto_12042 ?auto_12043 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12051 - SURFACE
      ?auto_12052 - SURFACE
      ?auto_12053 - SURFACE
      ?auto_12054 - SURFACE
    )
    :vars
    (
      ?auto_12057 - HOIST
      ?auto_12061 - PLACE
      ?auto_12058 - PLACE
      ?auto_12059 - HOIST
      ?auto_12056 - SURFACE
      ?auto_12060 - TRUCK
      ?auto_12055 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12057 ?auto_12061 ) ( IS-CRATE ?auto_12054 ) ( not ( = ?auto_12053 ?auto_12054 ) ) ( not ( = ?auto_12052 ?auto_12053 ) ) ( not ( = ?auto_12052 ?auto_12054 ) ) ( not ( = ?auto_12058 ?auto_12061 ) ) ( HOIST-AT ?auto_12059 ?auto_12058 ) ( not ( = ?auto_12057 ?auto_12059 ) ) ( AVAILABLE ?auto_12059 ) ( SURFACE-AT ?auto_12054 ?auto_12058 ) ( ON ?auto_12054 ?auto_12056 ) ( CLEAR ?auto_12054 ) ( not ( = ?auto_12053 ?auto_12056 ) ) ( not ( = ?auto_12054 ?auto_12056 ) ) ( not ( = ?auto_12052 ?auto_12056 ) ) ( SURFACE-AT ?auto_12052 ?auto_12061 ) ( CLEAR ?auto_12052 ) ( IS-CRATE ?auto_12053 ) ( AVAILABLE ?auto_12057 ) ( IN ?auto_12053 ?auto_12060 ) ( TRUCK-AT ?auto_12060 ?auto_12055 ) ( not ( = ?auto_12055 ?auto_12061 ) ) ( not ( = ?auto_12058 ?auto_12055 ) ) ( ON ?auto_12052 ?auto_12051 ) ( not ( = ?auto_12051 ?auto_12052 ) ) ( not ( = ?auto_12051 ?auto_12053 ) ) ( not ( = ?auto_12051 ?auto_12054 ) ) ( not ( = ?auto_12051 ?auto_12056 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12052 ?auto_12053 ?auto_12054 )
      ( MAKE-3CRATE-VERIFY ?auto_12051 ?auto_12052 ?auto_12053 ?auto_12054 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12062 - SURFACE
      ?auto_12063 - SURFACE
    )
    :vars
    (
      ?auto_12066 - HOIST
      ?auto_12071 - PLACE
      ?auto_12069 - SURFACE
      ?auto_12067 - PLACE
      ?auto_12068 - HOIST
      ?auto_12065 - SURFACE
      ?auto_12070 - TRUCK
      ?auto_12064 - PLACE
      ?auto_12072 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12066 ?auto_12071 ) ( IS-CRATE ?auto_12063 ) ( not ( = ?auto_12062 ?auto_12063 ) ) ( not ( = ?auto_12069 ?auto_12062 ) ) ( not ( = ?auto_12069 ?auto_12063 ) ) ( not ( = ?auto_12067 ?auto_12071 ) ) ( HOIST-AT ?auto_12068 ?auto_12067 ) ( not ( = ?auto_12066 ?auto_12068 ) ) ( AVAILABLE ?auto_12068 ) ( SURFACE-AT ?auto_12063 ?auto_12067 ) ( ON ?auto_12063 ?auto_12065 ) ( CLEAR ?auto_12063 ) ( not ( = ?auto_12062 ?auto_12065 ) ) ( not ( = ?auto_12063 ?auto_12065 ) ) ( not ( = ?auto_12069 ?auto_12065 ) ) ( SURFACE-AT ?auto_12069 ?auto_12071 ) ( CLEAR ?auto_12069 ) ( IS-CRATE ?auto_12062 ) ( AVAILABLE ?auto_12066 ) ( TRUCK-AT ?auto_12070 ?auto_12064 ) ( not ( = ?auto_12064 ?auto_12071 ) ) ( not ( = ?auto_12067 ?auto_12064 ) ) ( HOIST-AT ?auto_12072 ?auto_12064 ) ( LIFTING ?auto_12072 ?auto_12062 ) ( not ( = ?auto_12066 ?auto_12072 ) ) ( not ( = ?auto_12068 ?auto_12072 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12072 ?auto_12062 ?auto_12070 ?auto_12064 )
      ( MAKE-2CRATE ?auto_12069 ?auto_12062 ?auto_12063 )
      ( MAKE-1CRATE-VERIFY ?auto_12062 ?auto_12063 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12073 - SURFACE
      ?auto_12074 - SURFACE
      ?auto_12075 - SURFACE
    )
    :vars
    (
      ?auto_12080 - HOIST
      ?auto_12079 - PLACE
      ?auto_12077 - PLACE
      ?auto_12083 - HOIST
      ?auto_12076 - SURFACE
      ?auto_12078 - TRUCK
      ?auto_12082 - PLACE
      ?auto_12081 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12080 ?auto_12079 ) ( IS-CRATE ?auto_12075 ) ( not ( = ?auto_12074 ?auto_12075 ) ) ( not ( = ?auto_12073 ?auto_12074 ) ) ( not ( = ?auto_12073 ?auto_12075 ) ) ( not ( = ?auto_12077 ?auto_12079 ) ) ( HOIST-AT ?auto_12083 ?auto_12077 ) ( not ( = ?auto_12080 ?auto_12083 ) ) ( AVAILABLE ?auto_12083 ) ( SURFACE-AT ?auto_12075 ?auto_12077 ) ( ON ?auto_12075 ?auto_12076 ) ( CLEAR ?auto_12075 ) ( not ( = ?auto_12074 ?auto_12076 ) ) ( not ( = ?auto_12075 ?auto_12076 ) ) ( not ( = ?auto_12073 ?auto_12076 ) ) ( SURFACE-AT ?auto_12073 ?auto_12079 ) ( CLEAR ?auto_12073 ) ( IS-CRATE ?auto_12074 ) ( AVAILABLE ?auto_12080 ) ( TRUCK-AT ?auto_12078 ?auto_12082 ) ( not ( = ?auto_12082 ?auto_12079 ) ) ( not ( = ?auto_12077 ?auto_12082 ) ) ( HOIST-AT ?auto_12081 ?auto_12082 ) ( LIFTING ?auto_12081 ?auto_12074 ) ( not ( = ?auto_12080 ?auto_12081 ) ) ( not ( = ?auto_12083 ?auto_12081 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12074 ?auto_12075 )
      ( MAKE-2CRATE-VERIFY ?auto_12073 ?auto_12074 ?auto_12075 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12084 - SURFACE
      ?auto_12085 - SURFACE
      ?auto_12086 - SURFACE
      ?auto_12087 - SURFACE
    )
    :vars
    (
      ?auto_12092 - HOIST
      ?auto_12093 - PLACE
      ?auto_12094 - PLACE
      ?auto_12090 - HOIST
      ?auto_12088 - SURFACE
      ?auto_12089 - TRUCK
      ?auto_12091 - PLACE
      ?auto_12095 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12092 ?auto_12093 ) ( IS-CRATE ?auto_12087 ) ( not ( = ?auto_12086 ?auto_12087 ) ) ( not ( = ?auto_12085 ?auto_12086 ) ) ( not ( = ?auto_12085 ?auto_12087 ) ) ( not ( = ?auto_12094 ?auto_12093 ) ) ( HOIST-AT ?auto_12090 ?auto_12094 ) ( not ( = ?auto_12092 ?auto_12090 ) ) ( AVAILABLE ?auto_12090 ) ( SURFACE-AT ?auto_12087 ?auto_12094 ) ( ON ?auto_12087 ?auto_12088 ) ( CLEAR ?auto_12087 ) ( not ( = ?auto_12086 ?auto_12088 ) ) ( not ( = ?auto_12087 ?auto_12088 ) ) ( not ( = ?auto_12085 ?auto_12088 ) ) ( SURFACE-AT ?auto_12085 ?auto_12093 ) ( CLEAR ?auto_12085 ) ( IS-CRATE ?auto_12086 ) ( AVAILABLE ?auto_12092 ) ( TRUCK-AT ?auto_12089 ?auto_12091 ) ( not ( = ?auto_12091 ?auto_12093 ) ) ( not ( = ?auto_12094 ?auto_12091 ) ) ( HOIST-AT ?auto_12095 ?auto_12091 ) ( LIFTING ?auto_12095 ?auto_12086 ) ( not ( = ?auto_12092 ?auto_12095 ) ) ( not ( = ?auto_12090 ?auto_12095 ) ) ( ON ?auto_12085 ?auto_12084 ) ( not ( = ?auto_12084 ?auto_12085 ) ) ( not ( = ?auto_12084 ?auto_12086 ) ) ( not ( = ?auto_12084 ?auto_12087 ) ) ( not ( = ?auto_12084 ?auto_12088 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12085 ?auto_12086 ?auto_12087 )
      ( MAKE-3CRATE-VERIFY ?auto_12084 ?auto_12085 ?auto_12086 ?auto_12087 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12096 - SURFACE
      ?auto_12097 - SURFACE
    )
    :vars
    (
      ?auto_12102 - HOIST
      ?auto_12103 - PLACE
      ?auto_12105 - SURFACE
      ?auto_12104 - PLACE
      ?auto_12100 - HOIST
      ?auto_12098 - SURFACE
      ?auto_12099 - TRUCK
      ?auto_12101 - PLACE
      ?auto_12106 - HOIST
      ?auto_12107 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12102 ?auto_12103 ) ( IS-CRATE ?auto_12097 ) ( not ( = ?auto_12096 ?auto_12097 ) ) ( not ( = ?auto_12105 ?auto_12096 ) ) ( not ( = ?auto_12105 ?auto_12097 ) ) ( not ( = ?auto_12104 ?auto_12103 ) ) ( HOIST-AT ?auto_12100 ?auto_12104 ) ( not ( = ?auto_12102 ?auto_12100 ) ) ( AVAILABLE ?auto_12100 ) ( SURFACE-AT ?auto_12097 ?auto_12104 ) ( ON ?auto_12097 ?auto_12098 ) ( CLEAR ?auto_12097 ) ( not ( = ?auto_12096 ?auto_12098 ) ) ( not ( = ?auto_12097 ?auto_12098 ) ) ( not ( = ?auto_12105 ?auto_12098 ) ) ( SURFACE-AT ?auto_12105 ?auto_12103 ) ( CLEAR ?auto_12105 ) ( IS-CRATE ?auto_12096 ) ( AVAILABLE ?auto_12102 ) ( TRUCK-AT ?auto_12099 ?auto_12101 ) ( not ( = ?auto_12101 ?auto_12103 ) ) ( not ( = ?auto_12104 ?auto_12101 ) ) ( HOIST-AT ?auto_12106 ?auto_12101 ) ( not ( = ?auto_12102 ?auto_12106 ) ) ( not ( = ?auto_12100 ?auto_12106 ) ) ( AVAILABLE ?auto_12106 ) ( SURFACE-AT ?auto_12096 ?auto_12101 ) ( ON ?auto_12096 ?auto_12107 ) ( CLEAR ?auto_12096 ) ( not ( = ?auto_12096 ?auto_12107 ) ) ( not ( = ?auto_12097 ?auto_12107 ) ) ( not ( = ?auto_12105 ?auto_12107 ) ) ( not ( = ?auto_12098 ?auto_12107 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12106 ?auto_12096 ?auto_12107 ?auto_12101 )
      ( MAKE-2CRATE ?auto_12105 ?auto_12096 ?auto_12097 )
      ( MAKE-1CRATE-VERIFY ?auto_12096 ?auto_12097 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12108 - SURFACE
      ?auto_12109 - SURFACE
      ?auto_12110 - SURFACE
    )
    :vars
    (
      ?auto_12111 - HOIST
      ?auto_12118 - PLACE
      ?auto_12117 - PLACE
      ?auto_12119 - HOIST
      ?auto_12113 - SURFACE
      ?auto_12115 - TRUCK
      ?auto_12114 - PLACE
      ?auto_12112 - HOIST
      ?auto_12116 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12111 ?auto_12118 ) ( IS-CRATE ?auto_12110 ) ( not ( = ?auto_12109 ?auto_12110 ) ) ( not ( = ?auto_12108 ?auto_12109 ) ) ( not ( = ?auto_12108 ?auto_12110 ) ) ( not ( = ?auto_12117 ?auto_12118 ) ) ( HOIST-AT ?auto_12119 ?auto_12117 ) ( not ( = ?auto_12111 ?auto_12119 ) ) ( AVAILABLE ?auto_12119 ) ( SURFACE-AT ?auto_12110 ?auto_12117 ) ( ON ?auto_12110 ?auto_12113 ) ( CLEAR ?auto_12110 ) ( not ( = ?auto_12109 ?auto_12113 ) ) ( not ( = ?auto_12110 ?auto_12113 ) ) ( not ( = ?auto_12108 ?auto_12113 ) ) ( SURFACE-AT ?auto_12108 ?auto_12118 ) ( CLEAR ?auto_12108 ) ( IS-CRATE ?auto_12109 ) ( AVAILABLE ?auto_12111 ) ( TRUCK-AT ?auto_12115 ?auto_12114 ) ( not ( = ?auto_12114 ?auto_12118 ) ) ( not ( = ?auto_12117 ?auto_12114 ) ) ( HOIST-AT ?auto_12112 ?auto_12114 ) ( not ( = ?auto_12111 ?auto_12112 ) ) ( not ( = ?auto_12119 ?auto_12112 ) ) ( AVAILABLE ?auto_12112 ) ( SURFACE-AT ?auto_12109 ?auto_12114 ) ( ON ?auto_12109 ?auto_12116 ) ( CLEAR ?auto_12109 ) ( not ( = ?auto_12109 ?auto_12116 ) ) ( not ( = ?auto_12110 ?auto_12116 ) ) ( not ( = ?auto_12108 ?auto_12116 ) ) ( not ( = ?auto_12113 ?auto_12116 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12109 ?auto_12110 )
      ( MAKE-2CRATE-VERIFY ?auto_12108 ?auto_12109 ?auto_12110 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12120 - SURFACE
      ?auto_12121 - SURFACE
      ?auto_12122 - SURFACE
      ?auto_12123 - SURFACE
    )
    :vars
    (
      ?auto_12130 - HOIST
      ?auto_12129 - PLACE
      ?auto_12128 - PLACE
      ?auto_12125 - HOIST
      ?auto_12132 - SURFACE
      ?auto_12127 - TRUCK
      ?auto_12124 - PLACE
      ?auto_12126 - HOIST
      ?auto_12131 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12130 ?auto_12129 ) ( IS-CRATE ?auto_12123 ) ( not ( = ?auto_12122 ?auto_12123 ) ) ( not ( = ?auto_12121 ?auto_12122 ) ) ( not ( = ?auto_12121 ?auto_12123 ) ) ( not ( = ?auto_12128 ?auto_12129 ) ) ( HOIST-AT ?auto_12125 ?auto_12128 ) ( not ( = ?auto_12130 ?auto_12125 ) ) ( AVAILABLE ?auto_12125 ) ( SURFACE-AT ?auto_12123 ?auto_12128 ) ( ON ?auto_12123 ?auto_12132 ) ( CLEAR ?auto_12123 ) ( not ( = ?auto_12122 ?auto_12132 ) ) ( not ( = ?auto_12123 ?auto_12132 ) ) ( not ( = ?auto_12121 ?auto_12132 ) ) ( SURFACE-AT ?auto_12121 ?auto_12129 ) ( CLEAR ?auto_12121 ) ( IS-CRATE ?auto_12122 ) ( AVAILABLE ?auto_12130 ) ( TRUCK-AT ?auto_12127 ?auto_12124 ) ( not ( = ?auto_12124 ?auto_12129 ) ) ( not ( = ?auto_12128 ?auto_12124 ) ) ( HOIST-AT ?auto_12126 ?auto_12124 ) ( not ( = ?auto_12130 ?auto_12126 ) ) ( not ( = ?auto_12125 ?auto_12126 ) ) ( AVAILABLE ?auto_12126 ) ( SURFACE-AT ?auto_12122 ?auto_12124 ) ( ON ?auto_12122 ?auto_12131 ) ( CLEAR ?auto_12122 ) ( not ( = ?auto_12122 ?auto_12131 ) ) ( not ( = ?auto_12123 ?auto_12131 ) ) ( not ( = ?auto_12121 ?auto_12131 ) ) ( not ( = ?auto_12132 ?auto_12131 ) ) ( ON ?auto_12121 ?auto_12120 ) ( not ( = ?auto_12120 ?auto_12121 ) ) ( not ( = ?auto_12120 ?auto_12122 ) ) ( not ( = ?auto_12120 ?auto_12123 ) ) ( not ( = ?auto_12120 ?auto_12132 ) ) ( not ( = ?auto_12120 ?auto_12131 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12121 ?auto_12122 ?auto_12123 )
      ( MAKE-3CRATE-VERIFY ?auto_12120 ?auto_12121 ?auto_12122 ?auto_12123 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12133 - SURFACE
      ?auto_12134 - SURFACE
    )
    :vars
    (
      ?auto_12142 - HOIST
      ?auto_12141 - PLACE
      ?auto_12140 - SURFACE
      ?auto_12139 - PLACE
      ?auto_12136 - HOIST
      ?auto_12144 - SURFACE
      ?auto_12135 - PLACE
      ?auto_12137 - HOIST
      ?auto_12143 - SURFACE
      ?auto_12138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12142 ?auto_12141 ) ( IS-CRATE ?auto_12134 ) ( not ( = ?auto_12133 ?auto_12134 ) ) ( not ( = ?auto_12140 ?auto_12133 ) ) ( not ( = ?auto_12140 ?auto_12134 ) ) ( not ( = ?auto_12139 ?auto_12141 ) ) ( HOIST-AT ?auto_12136 ?auto_12139 ) ( not ( = ?auto_12142 ?auto_12136 ) ) ( AVAILABLE ?auto_12136 ) ( SURFACE-AT ?auto_12134 ?auto_12139 ) ( ON ?auto_12134 ?auto_12144 ) ( CLEAR ?auto_12134 ) ( not ( = ?auto_12133 ?auto_12144 ) ) ( not ( = ?auto_12134 ?auto_12144 ) ) ( not ( = ?auto_12140 ?auto_12144 ) ) ( SURFACE-AT ?auto_12140 ?auto_12141 ) ( CLEAR ?auto_12140 ) ( IS-CRATE ?auto_12133 ) ( AVAILABLE ?auto_12142 ) ( not ( = ?auto_12135 ?auto_12141 ) ) ( not ( = ?auto_12139 ?auto_12135 ) ) ( HOIST-AT ?auto_12137 ?auto_12135 ) ( not ( = ?auto_12142 ?auto_12137 ) ) ( not ( = ?auto_12136 ?auto_12137 ) ) ( AVAILABLE ?auto_12137 ) ( SURFACE-AT ?auto_12133 ?auto_12135 ) ( ON ?auto_12133 ?auto_12143 ) ( CLEAR ?auto_12133 ) ( not ( = ?auto_12133 ?auto_12143 ) ) ( not ( = ?auto_12134 ?auto_12143 ) ) ( not ( = ?auto_12140 ?auto_12143 ) ) ( not ( = ?auto_12144 ?auto_12143 ) ) ( TRUCK-AT ?auto_12138 ?auto_12141 ) )
    :subtasks
    ( ( !DRIVE ?auto_12138 ?auto_12141 ?auto_12135 )
      ( MAKE-2CRATE ?auto_12140 ?auto_12133 ?auto_12134 )
      ( MAKE-1CRATE-VERIFY ?auto_12133 ?auto_12134 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12145 - SURFACE
      ?auto_12146 - SURFACE
      ?auto_12147 - SURFACE
    )
    :vars
    (
      ?auto_12155 - HOIST
      ?auto_12156 - PLACE
      ?auto_12148 - PLACE
      ?auto_12151 - HOIST
      ?auto_12154 - SURFACE
      ?auto_12152 - PLACE
      ?auto_12149 - HOIST
      ?auto_12153 - SURFACE
      ?auto_12150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12155 ?auto_12156 ) ( IS-CRATE ?auto_12147 ) ( not ( = ?auto_12146 ?auto_12147 ) ) ( not ( = ?auto_12145 ?auto_12146 ) ) ( not ( = ?auto_12145 ?auto_12147 ) ) ( not ( = ?auto_12148 ?auto_12156 ) ) ( HOIST-AT ?auto_12151 ?auto_12148 ) ( not ( = ?auto_12155 ?auto_12151 ) ) ( AVAILABLE ?auto_12151 ) ( SURFACE-AT ?auto_12147 ?auto_12148 ) ( ON ?auto_12147 ?auto_12154 ) ( CLEAR ?auto_12147 ) ( not ( = ?auto_12146 ?auto_12154 ) ) ( not ( = ?auto_12147 ?auto_12154 ) ) ( not ( = ?auto_12145 ?auto_12154 ) ) ( SURFACE-AT ?auto_12145 ?auto_12156 ) ( CLEAR ?auto_12145 ) ( IS-CRATE ?auto_12146 ) ( AVAILABLE ?auto_12155 ) ( not ( = ?auto_12152 ?auto_12156 ) ) ( not ( = ?auto_12148 ?auto_12152 ) ) ( HOIST-AT ?auto_12149 ?auto_12152 ) ( not ( = ?auto_12155 ?auto_12149 ) ) ( not ( = ?auto_12151 ?auto_12149 ) ) ( AVAILABLE ?auto_12149 ) ( SURFACE-AT ?auto_12146 ?auto_12152 ) ( ON ?auto_12146 ?auto_12153 ) ( CLEAR ?auto_12146 ) ( not ( = ?auto_12146 ?auto_12153 ) ) ( not ( = ?auto_12147 ?auto_12153 ) ) ( not ( = ?auto_12145 ?auto_12153 ) ) ( not ( = ?auto_12154 ?auto_12153 ) ) ( TRUCK-AT ?auto_12150 ?auto_12156 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12146 ?auto_12147 )
      ( MAKE-2CRATE-VERIFY ?auto_12145 ?auto_12146 ?auto_12147 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12157 - SURFACE
      ?auto_12158 - SURFACE
      ?auto_12159 - SURFACE
      ?auto_12160 - SURFACE
    )
    :vars
    (
      ?auto_12165 - HOIST
      ?auto_12164 - PLACE
      ?auto_12169 - PLACE
      ?auto_12163 - HOIST
      ?auto_12166 - SURFACE
      ?auto_12168 - PLACE
      ?auto_12167 - HOIST
      ?auto_12162 - SURFACE
      ?auto_12161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12165 ?auto_12164 ) ( IS-CRATE ?auto_12160 ) ( not ( = ?auto_12159 ?auto_12160 ) ) ( not ( = ?auto_12158 ?auto_12159 ) ) ( not ( = ?auto_12158 ?auto_12160 ) ) ( not ( = ?auto_12169 ?auto_12164 ) ) ( HOIST-AT ?auto_12163 ?auto_12169 ) ( not ( = ?auto_12165 ?auto_12163 ) ) ( AVAILABLE ?auto_12163 ) ( SURFACE-AT ?auto_12160 ?auto_12169 ) ( ON ?auto_12160 ?auto_12166 ) ( CLEAR ?auto_12160 ) ( not ( = ?auto_12159 ?auto_12166 ) ) ( not ( = ?auto_12160 ?auto_12166 ) ) ( not ( = ?auto_12158 ?auto_12166 ) ) ( SURFACE-AT ?auto_12158 ?auto_12164 ) ( CLEAR ?auto_12158 ) ( IS-CRATE ?auto_12159 ) ( AVAILABLE ?auto_12165 ) ( not ( = ?auto_12168 ?auto_12164 ) ) ( not ( = ?auto_12169 ?auto_12168 ) ) ( HOIST-AT ?auto_12167 ?auto_12168 ) ( not ( = ?auto_12165 ?auto_12167 ) ) ( not ( = ?auto_12163 ?auto_12167 ) ) ( AVAILABLE ?auto_12167 ) ( SURFACE-AT ?auto_12159 ?auto_12168 ) ( ON ?auto_12159 ?auto_12162 ) ( CLEAR ?auto_12159 ) ( not ( = ?auto_12159 ?auto_12162 ) ) ( not ( = ?auto_12160 ?auto_12162 ) ) ( not ( = ?auto_12158 ?auto_12162 ) ) ( not ( = ?auto_12166 ?auto_12162 ) ) ( TRUCK-AT ?auto_12161 ?auto_12164 ) ( ON ?auto_12158 ?auto_12157 ) ( not ( = ?auto_12157 ?auto_12158 ) ) ( not ( = ?auto_12157 ?auto_12159 ) ) ( not ( = ?auto_12157 ?auto_12160 ) ) ( not ( = ?auto_12157 ?auto_12166 ) ) ( not ( = ?auto_12157 ?auto_12162 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12158 ?auto_12159 ?auto_12160 )
      ( MAKE-3CRATE-VERIFY ?auto_12157 ?auto_12158 ?auto_12159 ?auto_12160 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12170 - SURFACE
      ?auto_12171 - SURFACE
    )
    :vars
    (
      ?auto_12177 - HOIST
      ?auto_12175 - PLACE
      ?auto_12176 - SURFACE
      ?auto_12181 - PLACE
      ?auto_12174 - HOIST
      ?auto_12178 - SURFACE
      ?auto_12180 - PLACE
      ?auto_12179 - HOIST
      ?auto_12173 - SURFACE
      ?auto_12172 - TRUCK
      ?auto_12182 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12177 ?auto_12175 ) ( IS-CRATE ?auto_12171 ) ( not ( = ?auto_12170 ?auto_12171 ) ) ( not ( = ?auto_12176 ?auto_12170 ) ) ( not ( = ?auto_12176 ?auto_12171 ) ) ( not ( = ?auto_12181 ?auto_12175 ) ) ( HOIST-AT ?auto_12174 ?auto_12181 ) ( not ( = ?auto_12177 ?auto_12174 ) ) ( AVAILABLE ?auto_12174 ) ( SURFACE-AT ?auto_12171 ?auto_12181 ) ( ON ?auto_12171 ?auto_12178 ) ( CLEAR ?auto_12171 ) ( not ( = ?auto_12170 ?auto_12178 ) ) ( not ( = ?auto_12171 ?auto_12178 ) ) ( not ( = ?auto_12176 ?auto_12178 ) ) ( IS-CRATE ?auto_12170 ) ( not ( = ?auto_12180 ?auto_12175 ) ) ( not ( = ?auto_12181 ?auto_12180 ) ) ( HOIST-AT ?auto_12179 ?auto_12180 ) ( not ( = ?auto_12177 ?auto_12179 ) ) ( not ( = ?auto_12174 ?auto_12179 ) ) ( AVAILABLE ?auto_12179 ) ( SURFACE-AT ?auto_12170 ?auto_12180 ) ( ON ?auto_12170 ?auto_12173 ) ( CLEAR ?auto_12170 ) ( not ( = ?auto_12170 ?auto_12173 ) ) ( not ( = ?auto_12171 ?auto_12173 ) ) ( not ( = ?auto_12176 ?auto_12173 ) ) ( not ( = ?auto_12178 ?auto_12173 ) ) ( TRUCK-AT ?auto_12172 ?auto_12175 ) ( SURFACE-AT ?auto_12182 ?auto_12175 ) ( CLEAR ?auto_12182 ) ( LIFTING ?auto_12177 ?auto_12176 ) ( IS-CRATE ?auto_12176 ) ( not ( = ?auto_12182 ?auto_12176 ) ) ( not ( = ?auto_12170 ?auto_12182 ) ) ( not ( = ?auto_12171 ?auto_12182 ) ) ( not ( = ?auto_12178 ?auto_12182 ) ) ( not ( = ?auto_12173 ?auto_12182 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12182 ?auto_12176 )
      ( MAKE-2CRATE ?auto_12176 ?auto_12170 ?auto_12171 )
      ( MAKE-1CRATE-VERIFY ?auto_12170 ?auto_12171 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12183 - SURFACE
      ?auto_12184 - SURFACE
      ?auto_12185 - SURFACE
    )
    :vars
    (
      ?auto_12188 - HOIST
      ?auto_12191 - PLACE
      ?auto_12195 - PLACE
      ?auto_12189 - HOIST
      ?auto_12187 - SURFACE
      ?auto_12193 - PLACE
      ?auto_12190 - HOIST
      ?auto_12192 - SURFACE
      ?auto_12194 - TRUCK
      ?auto_12186 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12188 ?auto_12191 ) ( IS-CRATE ?auto_12185 ) ( not ( = ?auto_12184 ?auto_12185 ) ) ( not ( = ?auto_12183 ?auto_12184 ) ) ( not ( = ?auto_12183 ?auto_12185 ) ) ( not ( = ?auto_12195 ?auto_12191 ) ) ( HOIST-AT ?auto_12189 ?auto_12195 ) ( not ( = ?auto_12188 ?auto_12189 ) ) ( AVAILABLE ?auto_12189 ) ( SURFACE-AT ?auto_12185 ?auto_12195 ) ( ON ?auto_12185 ?auto_12187 ) ( CLEAR ?auto_12185 ) ( not ( = ?auto_12184 ?auto_12187 ) ) ( not ( = ?auto_12185 ?auto_12187 ) ) ( not ( = ?auto_12183 ?auto_12187 ) ) ( IS-CRATE ?auto_12184 ) ( not ( = ?auto_12193 ?auto_12191 ) ) ( not ( = ?auto_12195 ?auto_12193 ) ) ( HOIST-AT ?auto_12190 ?auto_12193 ) ( not ( = ?auto_12188 ?auto_12190 ) ) ( not ( = ?auto_12189 ?auto_12190 ) ) ( AVAILABLE ?auto_12190 ) ( SURFACE-AT ?auto_12184 ?auto_12193 ) ( ON ?auto_12184 ?auto_12192 ) ( CLEAR ?auto_12184 ) ( not ( = ?auto_12184 ?auto_12192 ) ) ( not ( = ?auto_12185 ?auto_12192 ) ) ( not ( = ?auto_12183 ?auto_12192 ) ) ( not ( = ?auto_12187 ?auto_12192 ) ) ( TRUCK-AT ?auto_12194 ?auto_12191 ) ( SURFACE-AT ?auto_12186 ?auto_12191 ) ( CLEAR ?auto_12186 ) ( LIFTING ?auto_12188 ?auto_12183 ) ( IS-CRATE ?auto_12183 ) ( not ( = ?auto_12186 ?auto_12183 ) ) ( not ( = ?auto_12184 ?auto_12186 ) ) ( not ( = ?auto_12185 ?auto_12186 ) ) ( not ( = ?auto_12187 ?auto_12186 ) ) ( not ( = ?auto_12192 ?auto_12186 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12184 ?auto_12185 )
      ( MAKE-2CRATE-VERIFY ?auto_12183 ?auto_12184 ?auto_12185 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12196 - SURFACE
      ?auto_12197 - SURFACE
      ?auto_12198 - SURFACE
      ?auto_12199 - SURFACE
    )
    :vars
    (
      ?auto_12204 - HOIST
      ?auto_12202 - PLACE
      ?auto_12201 - PLACE
      ?auto_12208 - HOIST
      ?auto_12203 - SURFACE
      ?auto_12207 - PLACE
      ?auto_12206 - HOIST
      ?auto_12205 - SURFACE
      ?auto_12200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12204 ?auto_12202 ) ( IS-CRATE ?auto_12199 ) ( not ( = ?auto_12198 ?auto_12199 ) ) ( not ( = ?auto_12197 ?auto_12198 ) ) ( not ( = ?auto_12197 ?auto_12199 ) ) ( not ( = ?auto_12201 ?auto_12202 ) ) ( HOIST-AT ?auto_12208 ?auto_12201 ) ( not ( = ?auto_12204 ?auto_12208 ) ) ( AVAILABLE ?auto_12208 ) ( SURFACE-AT ?auto_12199 ?auto_12201 ) ( ON ?auto_12199 ?auto_12203 ) ( CLEAR ?auto_12199 ) ( not ( = ?auto_12198 ?auto_12203 ) ) ( not ( = ?auto_12199 ?auto_12203 ) ) ( not ( = ?auto_12197 ?auto_12203 ) ) ( IS-CRATE ?auto_12198 ) ( not ( = ?auto_12207 ?auto_12202 ) ) ( not ( = ?auto_12201 ?auto_12207 ) ) ( HOIST-AT ?auto_12206 ?auto_12207 ) ( not ( = ?auto_12204 ?auto_12206 ) ) ( not ( = ?auto_12208 ?auto_12206 ) ) ( AVAILABLE ?auto_12206 ) ( SURFACE-AT ?auto_12198 ?auto_12207 ) ( ON ?auto_12198 ?auto_12205 ) ( CLEAR ?auto_12198 ) ( not ( = ?auto_12198 ?auto_12205 ) ) ( not ( = ?auto_12199 ?auto_12205 ) ) ( not ( = ?auto_12197 ?auto_12205 ) ) ( not ( = ?auto_12203 ?auto_12205 ) ) ( TRUCK-AT ?auto_12200 ?auto_12202 ) ( SURFACE-AT ?auto_12196 ?auto_12202 ) ( CLEAR ?auto_12196 ) ( LIFTING ?auto_12204 ?auto_12197 ) ( IS-CRATE ?auto_12197 ) ( not ( = ?auto_12196 ?auto_12197 ) ) ( not ( = ?auto_12198 ?auto_12196 ) ) ( not ( = ?auto_12199 ?auto_12196 ) ) ( not ( = ?auto_12203 ?auto_12196 ) ) ( not ( = ?auto_12205 ?auto_12196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12197 ?auto_12198 ?auto_12199 )
      ( MAKE-3CRATE-VERIFY ?auto_12196 ?auto_12197 ?auto_12198 ?auto_12199 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12209 - SURFACE
      ?auto_12210 - SURFACE
    )
    :vars
    (
      ?auto_12215 - HOIST
      ?auto_12213 - PLACE
      ?auto_12217 - SURFACE
      ?auto_12212 - PLACE
      ?auto_12220 - HOIST
      ?auto_12214 - SURFACE
      ?auto_12219 - PLACE
      ?auto_12218 - HOIST
      ?auto_12216 - SURFACE
      ?auto_12211 - TRUCK
      ?auto_12221 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12215 ?auto_12213 ) ( IS-CRATE ?auto_12210 ) ( not ( = ?auto_12209 ?auto_12210 ) ) ( not ( = ?auto_12217 ?auto_12209 ) ) ( not ( = ?auto_12217 ?auto_12210 ) ) ( not ( = ?auto_12212 ?auto_12213 ) ) ( HOIST-AT ?auto_12220 ?auto_12212 ) ( not ( = ?auto_12215 ?auto_12220 ) ) ( AVAILABLE ?auto_12220 ) ( SURFACE-AT ?auto_12210 ?auto_12212 ) ( ON ?auto_12210 ?auto_12214 ) ( CLEAR ?auto_12210 ) ( not ( = ?auto_12209 ?auto_12214 ) ) ( not ( = ?auto_12210 ?auto_12214 ) ) ( not ( = ?auto_12217 ?auto_12214 ) ) ( IS-CRATE ?auto_12209 ) ( not ( = ?auto_12219 ?auto_12213 ) ) ( not ( = ?auto_12212 ?auto_12219 ) ) ( HOIST-AT ?auto_12218 ?auto_12219 ) ( not ( = ?auto_12215 ?auto_12218 ) ) ( not ( = ?auto_12220 ?auto_12218 ) ) ( AVAILABLE ?auto_12218 ) ( SURFACE-AT ?auto_12209 ?auto_12219 ) ( ON ?auto_12209 ?auto_12216 ) ( CLEAR ?auto_12209 ) ( not ( = ?auto_12209 ?auto_12216 ) ) ( not ( = ?auto_12210 ?auto_12216 ) ) ( not ( = ?auto_12217 ?auto_12216 ) ) ( not ( = ?auto_12214 ?auto_12216 ) ) ( TRUCK-AT ?auto_12211 ?auto_12213 ) ( SURFACE-AT ?auto_12221 ?auto_12213 ) ( CLEAR ?auto_12221 ) ( IS-CRATE ?auto_12217 ) ( not ( = ?auto_12221 ?auto_12217 ) ) ( not ( = ?auto_12209 ?auto_12221 ) ) ( not ( = ?auto_12210 ?auto_12221 ) ) ( not ( = ?auto_12214 ?auto_12221 ) ) ( not ( = ?auto_12216 ?auto_12221 ) ) ( AVAILABLE ?auto_12215 ) ( IN ?auto_12217 ?auto_12211 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12215 ?auto_12217 ?auto_12211 ?auto_12213 )
      ( MAKE-2CRATE ?auto_12217 ?auto_12209 ?auto_12210 )
      ( MAKE-1CRATE-VERIFY ?auto_12209 ?auto_12210 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12222 - SURFACE
      ?auto_12223 - SURFACE
      ?auto_12224 - SURFACE
    )
    :vars
    (
      ?auto_12228 - HOIST
      ?auto_12230 - PLACE
      ?auto_12231 - PLACE
      ?auto_12225 - HOIST
      ?auto_12234 - SURFACE
      ?auto_12227 - PLACE
      ?auto_12232 - HOIST
      ?auto_12229 - SURFACE
      ?auto_12233 - TRUCK
      ?auto_12226 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12228 ?auto_12230 ) ( IS-CRATE ?auto_12224 ) ( not ( = ?auto_12223 ?auto_12224 ) ) ( not ( = ?auto_12222 ?auto_12223 ) ) ( not ( = ?auto_12222 ?auto_12224 ) ) ( not ( = ?auto_12231 ?auto_12230 ) ) ( HOIST-AT ?auto_12225 ?auto_12231 ) ( not ( = ?auto_12228 ?auto_12225 ) ) ( AVAILABLE ?auto_12225 ) ( SURFACE-AT ?auto_12224 ?auto_12231 ) ( ON ?auto_12224 ?auto_12234 ) ( CLEAR ?auto_12224 ) ( not ( = ?auto_12223 ?auto_12234 ) ) ( not ( = ?auto_12224 ?auto_12234 ) ) ( not ( = ?auto_12222 ?auto_12234 ) ) ( IS-CRATE ?auto_12223 ) ( not ( = ?auto_12227 ?auto_12230 ) ) ( not ( = ?auto_12231 ?auto_12227 ) ) ( HOIST-AT ?auto_12232 ?auto_12227 ) ( not ( = ?auto_12228 ?auto_12232 ) ) ( not ( = ?auto_12225 ?auto_12232 ) ) ( AVAILABLE ?auto_12232 ) ( SURFACE-AT ?auto_12223 ?auto_12227 ) ( ON ?auto_12223 ?auto_12229 ) ( CLEAR ?auto_12223 ) ( not ( = ?auto_12223 ?auto_12229 ) ) ( not ( = ?auto_12224 ?auto_12229 ) ) ( not ( = ?auto_12222 ?auto_12229 ) ) ( not ( = ?auto_12234 ?auto_12229 ) ) ( TRUCK-AT ?auto_12233 ?auto_12230 ) ( SURFACE-AT ?auto_12226 ?auto_12230 ) ( CLEAR ?auto_12226 ) ( IS-CRATE ?auto_12222 ) ( not ( = ?auto_12226 ?auto_12222 ) ) ( not ( = ?auto_12223 ?auto_12226 ) ) ( not ( = ?auto_12224 ?auto_12226 ) ) ( not ( = ?auto_12234 ?auto_12226 ) ) ( not ( = ?auto_12229 ?auto_12226 ) ) ( AVAILABLE ?auto_12228 ) ( IN ?auto_12222 ?auto_12233 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12223 ?auto_12224 )
      ( MAKE-2CRATE-VERIFY ?auto_12222 ?auto_12223 ?auto_12224 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12235 - SURFACE
      ?auto_12236 - SURFACE
      ?auto_12237 - SURFACE
      ?auto_12238 - SURFACE
    )
    :vars
    (
      ?auto_12243 - HOIST
      ?auto_12245 - PLACE
      ?auto_12240 - PLACE
      ?auto_12239 - HOIST
      ?auto_12244 - SURFACE
      ?auto_12247 - PLACE
      ?auto_12246 - HOIST
      ?auto_12242 - SURFACE
      ?auto_12241 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12243 ?auto_12245 ) ( IS-CRATE ?auto_12238 ) ( not ( = ?auto_12237 ?auto_12238 ) ) ( not ( = ?auto_12236 ?auto_12237 ) ) ( not ( = ?auto_12236 ?auto_12238 ) ) ( not ( = ?auto_12240 ?auto_12245 ) ) ( HOIST-AT ?auto_12239 ?auto_12240 ) ( not ( = ?auto_12243 ?auto_12239 ) ) ( AVAILABLE ?auto_12239 ) ( SURFACE-AT ?auto_12238 ?auto_12240 ) ( ON ?auto_12238 ?auto_12244 ) ( CLEAR ?auto_12238 ) ( not ( = ?auto_12237 ?auto_12244 ) ) ( not ( = ?auto_12238 ?auto_12244 ) ) ( not ( = ?auto_12236 ?auto_12244 ) ) ( IS-CRATE ?auto_12237 ) ( not ( = ?auto_12247 ?auto_12245 ) ) ( not ( = ?auto_12240 ?auto_12247 ) ) ( HOIST-AT ?auto_12246 ?auto_12247 ) ( not ( = ?auto_12243 ?auto_12246 ) ) ( not ( = ?auto_12239 ?auto_12246 ) ) ( AVAILABLE ?auto_12246 ) ( SURFACE-AT ?auto_12237 ?auto_12247 ) ( ON ?auto_12237 ?auto_12242 ) ( CLEAR ?auto_12237 ) ( not ( = ?auto_12237 ?auto_12242 ) ) ( not ( = ?auto_12238 ?auto_12242 ) ) ( not ( = ?auto_12236 ?auto_12242 ) ) ( not ( = ?auto_12244 ?auto_12242 ) ) ( TRUCK-AT ?auto_12241 ?auto_12245 ) ( SURFACE-AT ?auto_12235 ?auto_12245 ) ( CLEAR ?auto_12235 ) ( IS-CRATE ?auto_12236 ) ( not ( = ?auto_12235 ?auto_12236 ) ) ( not ( = ?auto_12237 ?auto_12235 ) ) ( not ( = ?auto_12238 ?auto_12235 ) ) ( not ( = ?auto_12244 ?auto_12235 ) ) ( not ( = ?auto_12242 ?auto_12235 ) ) ( AVAILABLE ?auto_12243 ) ( IN ?auto_12236 ?auto_12241 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12236 ?auto_12237 ?auto_12238 )
      ( MAKE-3CRATE-VERIFY ?auto_12235 ?auto_12236 ?auto_12237 ?auto_12238 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12248 - SURFACE
      ?auto_12249 - SURFACE
    )
    :vars
    (
      ?auto_12256 - HOIST
      ?auto_12258 - PLACE
      ?auto_12253 - SURFACE
      ?auto_12251 - PLACE
      ?auto_12250 - HOIST
      ?auto_12257 - SURFACE
      ?auto_12260 - PLACE
      ?auto_12259 - HOIST
      ?auto_12254 - SURFACE
      ?auto_12255 - SURFACE
      ?auto_12252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12256 ?auto_12258 ) ( IS-CRATE ?auto_12249 ) ( not ( = ?auto_12248 ?auto_12249 ) ) ( not ( = ?auto_12253 ?auto_12248 ) ) ( not ( = ?auto_12253 ?auto_12249 ) ) ( not ( = ?auto_12251 ?auto_12258 ) ) ( HOIST-AT ?auto_12250 ?auto_12251 ) ( not ( = ?auto_12256 ?auto_12250 ) ) ( AVAILABLE ?auto_12250 ) ( SURFACE-AT ?auto_12249 ?auto_12251 ) ( ON ?auto_12249 ?auto_12257 ) ( CLEAR ?auto_12249 ) ( not ( = ?auto_12248 ?auto_12257 ) ) ( not ( = ?auto_12249 ?auto_12257 ) ) ( not ( = ?auto_12253 ?auto_12257 ) ) ( IS-CRATE ?auto_12248 ) ( not ( = ?auto_12260 ?auto_12258 ) ) ( not ( = ?auto_12251 ?auto_12260 ) ) ( HOIST-AT ?auto_12259 ?auto_12260 ) ( not ( = ?auto_12256 ?auto_12259 ) ) ( not ( = ?auto_12250 ?auto_12259 ) ) ( AVAILABLE ?auto_12259 ) ( SURFACE-AT ?auto_12248 ?auto_12260 ) ( ON ?auto_12248 ?auto_12254 ) ( CLEAR ?auto_12248 ) ( not ( = ?auto_12248 ?auto_12254 ) ) ( not ( = ?auto_12249 ?auto_12254 ) ) ( not ( = ?auto_12253 ?auto_12254 ) ) ( not ( = ?auto_12257 ?auto_12254 ) ) ( SURFACE-AT ?auto_12255 ?auto_12258 ) ( CLEAR ?auto_12255 ) ( IS-CRATE ?auto_12253 ) ( not ( = ?auto_12255 ?auto_12253 ) ) ( not ( = ?auto_12248 ?auto_12255 ) ) ( not ( = ?auto_12249 ?auto_12255 ) ) ( not ( = ?auto_12257 ?auto_12255 ) ) ( not ( = ?auto_12254 ?auto_12255 ) ) ( AVAILABLE ?auto_12256 ) ( IN ?auto_12253 ?auto_12252 ) ( TRUCK-AT ?auto_12252 ?auto_12251 ) )
    :subtasks
    ( ( !DRIVE ?auto_12252 ?auto_12251 ?auto_12258 )
      ( MAKE-2CRATE ?auto_12253 ?auto_12248 ?auto_12249 )
      ( MAKE-1CRATE-VERIFY ?auto_12248 ?auto_12249 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12261 - SURFACE
      ?auto_12262 - SURFACE
      ?auto_12263 - SURFACE
    )
    :vars
    (
      ?auto_12271 - HOIST
      ?auto_12272 - PLACE
      ?auto_12267 - PLACE
      ?auto_12269 - HOIST
      ?auto_12265 - SURFACE
      ?auto_12268 - PLACE
      ?auto_12264 - HOIST
      ?auto_12270 - SURFACE
      ?auto_12273 - SURFACE
      ?auto_12266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12271 ?auto_12272 ) ( IS-CRATE ?auto_12263 ) ( not ( = ?auto_12262 ?auto_12263 ) ) ( not ( = ?auto_12261 ?auto_12262 ) ) ( not ( = ?auto_12261 ?auto_12263 ) ) ( not ( = ?auto_12267 ?auto_12272 ) ) ( HOIST-AT ?auto_12269 ?auto_12267 ) ( not ( = ?auto_12271 ?auto_12269 ) ) ( AVAILABLE ?auto_12269 ) ( SURFACE-AT ?auto_12263 ?auto_12267 ) ( ON ?auto_12263 ?auto_12265 ) ( CLEAR ?auto_12263 ) ( not ( = ?auto_12262 ?auto_12265 ) ) ( not ( = ?auto_12263 ?auto_12265 ) ) ( not ( = ?auto_12261 ?auto_12265 ) ) ( IS-CRATE ?auto_12262 ) ( not ( = ?auto_12268 ?auto_12272 ) ) ( not ( = ?auto_12267 ?auto_12268 ) ) ( HOIST-AT ?auto_12264 ?auto_12268 ) ( not ( = ?auto_12271 ?auto_12264 ) ) ( not ( = ?auto_12269 ?auto_12264 ) ) ( AVAILABLE ?auto_12264 ) ( SURFACE-AT ?auto_12262 ?auto_12268 ) ( ON ?auto_12262 ?auto_12270 ) ( CLEAR ?auto_12262 ) ( not ( = ?auto_12262 ?auto_12270 ) ) ( not ( = ?auto_12263 ?auto_12270 ) ) ( not ( = ?auto_12261 ?auto_12270 ) ) ( not ( = ?auto_12265 ?auto_12270 ) ) ( SURFACE-AT ?auto_12273 ?auto_12272 ) ( CLEAR ?auto_12273 ) ( IS-CRATE ?auto_12261 ) ( not ( = ?auto_12273 ?auto_12261 ) ) ( not ( = ?auto_12262 ?auto_12273 ) ) ( not ( = ?auto_12263 ?auto_12273 ) ) ( not ( = ?auto_12265 ?auto_12273 ) ) ( not ( = ?auto_12270 ?auto_12273 ) ) ( AVAILABLE ?auto_12271 ) ( IN ?auto_12261 ?auto_12266 ) ( TRUCK-AT ?auto_12266 ?auto_12267 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12262 ?auto_12263 )
      ( MAKE-2CRATE-VERIFY ?auto_12261 ?auto_12262 ?auto_12263 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12274 - SURFACE
      ?auto_12275 - SURFACE
      ?auto_12276 - SURFACE
      ?auto_12277 - SURFACE
    )
    :vars
    (
      ?auto_12283 - HOIST
      ?auto_12279 - PLACE
      ?auto_12285 - PLACE
      ?auto_12281 - HOIST
      ?auto_12284 - SURFACE
      ?auto_12286 - PLACE
      ?auto_12280 - HOIST
      ?auto_12278 - SURFACE
      ?auto_12282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12283 ?auto_12279 ) ( IS-CRATE ?auto_12277 ) ( not ( = ?auto_12276 ?auto_12277 ) ) ( not ( = ?auto_12275 ?auto_12276 ) ) ( not ( = ?auto_12275 ?auto_12277 ) ) ( not ( = ?auto_12285 ?auto_12279 ) ) ( HOIST-AT ?auto_12281 ?auto_12285 ) ( not ( = ?auto_12283 ?auto_12281 ) ) ( AVAILABLE ?auto_12281 ) ( SURFACE-AT ?auto_12277 ?auto_12285 ) ( ON ?auto_12277 ?auto_12284 ) ( CLEAR ?auto_12277 ) ( not ( = ?auto_12276 ?auto_12284 ) ) ( not ( = ?auto_12277 ?auto_12284 ) ) ( not ( = ?auto_12275 ?auto_12284 ) ) ( IS-CRATE ?auto_12276 ) ( not ( = ?auto_12286 ?auto_12279 ) ) ( not ( = ?auto_12285 ?auto_12286 ) ) ( HOIST-AT ?auto_12280 ?auto_12286 ) ( not ( = ?auto_12283 ?auto_12280 ) ) ( not ( = ?auto_12281 ?auto_12280 ) ) ( AVAILABLE ?auto_12280 ) ( SURFACE-AT ?auto_12276 ?auto_12286 ) ( ON ?auto_12276 ?auto_12278 ) ( CLEAR ?auto_12276 ) ( not ( = ?auto_12276 ?auto_12278 ) ) ( not ( = ?auto_12277 ?auto_12278 ) ) ( not ( = ?auto_12275 ?auto_12278 ) ) ( not ( = ?auto_12284 ?auto_12278 ) ) ( SURFACE-AT ?auto_12274 ?auto_12279 ) ( CLEAR ?auto_12274 ) ( IS-CRATE ?auto_12275 ) ( not ( = ?auto_12274 ?auto_12275 ) ) ( not ( = ?auto_12276 ?auto_12274 ) ) ( not ( = ?auto_12277 ?auto_12274 ) ) ( not ( = ?auto_12284 ?auto_12274 ) ) ( not ( = ?auto_12278 ?auto_12274 ) ) ( AVAILABLE ?auto_12283 ) ( IN ?auto_12275 ?auto_12282 ) ( TRUCK-AT ?auto_12282 ?auto_12285 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12275 ?auto_12276 ?auto_12277 )
      ( MAKE-3CRATE-VERIFY ?auto_12274 ?auto_12275 ?auto_12276 ?auto_12277 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12287 - SURFACE
      ?auto_12288 - SURFACE
    )
    :vars
    (
      ?auto_12294 - HOIST
      ?auto_12290 - PLACE
      ?auto_12299 - SURFACE
      ?auto_12296 - PLACE
      ?auto_12292 - HOIST
      ?auto_12295 - SURFACE
      ?auto_12298 - PLACE
      ?auto_12291 - HOIST
      ?auto_12289 - SURFACE
      ?auto_12297 - SURFACE
      ?auto_12293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12294 ?auto_12290 ) ( IS-CRATE ?auto_12288 ) ( not ( = ?auto_12287 ?auto_12288 ) ) ( not ( = ?auto_12299 ?auto_12287 ) ) ( not ( = ?auto_12299 ?auto_12288 ) ) ( not ( = ?auto_12296 ?auto_12290 ) ) ( HOIST-AT ?auto_12292 ?auto_12296 ) ( not ( = ?auto_12294 ?auto_12292 ) ) ( SURFACE-AT ?auto_12288 ?auto_12296 ) ( ON ?auto_12288 ?auto_12295 ) ( CLEAR ?auto_12288 ) ( not ( = ?auto_12287 ?auto_12295 ) ) ( not ( = ?auto_12288 ?auto_12295 ) ) ( not ( = ?auto_12299 ?auto_12295 ) ) ( IS-CRATE ?auto_12287 ) ( not ( = ?auto_12298 ?auto_12290 ) ) ( not ( = ?auto_12296 ?auto_12298 ) ) ( HOIST-AT ?auto_12291 ?auto_12298 ) ( not ( = ?auto_12294 ?auto_12291 ) ) ( not ( = ?auto_12292 ?auto_12291 ) ) ( AVAILABLE ?auto_12291 ) ( SURFACE-AT ?auto_12287 ?auto_12298 ) ( ON ?auto_12287 ?auto_12289 ) ( CLEAR ?auto_12287 ) ( not ( = ?auto_12287 ?auto_12289 ) ) ( not ( = ?auto_12288 ?auto_12289 ) ) ( not ( = ?auto_12299 ?auto_12289 ) ) ( not ( = ?auto_12295 ?auto_12289 ) ) ( SURFACE-AT ?auto_12297 ?auto_12290 ) ( CLEAR ?auto_12297 ) ( IS-CRATE ?auto_12299 ) ( not ( = ?auto_12297 ?auto_12299 ) ) ( not ( = ?auto_12287 ?auto_12297 ) ) ( not ( = ?auto_12288 ?auto_12297 ) ) ( not ( = ?auto_12295 ?auto_12297 ) ) ( not ( = ?auto_12289 ?auto_12297 ) ) ( AVAILABLE ?auto_12294 ) ( TRUCK-AT ?auto_12293 ?auto_12296 ) ( LIFTING ?auto_12292 ?auto_12299 ) )
    :subtasks
    ( ( !LOAD ?auto_12292 ?auto_12299 ?auto_12293 ?auto_12296 )
      ( MAKE-2CRATE ?auto_12299 ?auto_12287 ?auto_12288 )
      ( MAKE-1CRATE-VERIFY ?auto_12287 ?auto_12288 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12300 - SURFACE
      ?auto_12301 - SURFACE
      ?auto_12302 - SURFACE
    )
    :vars
    (
      ?auto_12310 - HOIST
      ?auto_12308 - PLACE
      ?auto_12305 - PLACE
      ?auto_12312 - HOIST
      ?auto_12303 - SURFACE
      ?auto_12309 - PLACE
      ?auto_12311 - HOIST
      ?auto_12304 - SURFACE
      ?auto_12306 - SURFACE
      ?auto_12307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12310 ?auto_12308 ) ( IS-CRATE ?auto_12302 ) ( not ( = ?auto_12301 ?auto_12302 ) ) ( not ( = ?auto_12300 ?auto_12301 ) ) ( not ( = ?auto_12300 ?auto_12302 ) ) ( not ( = ?auto_12305 ?auto_12308 ) ) ( HOIST-AT ?auto_12312 ?auto_12305 ) ( not ( = ?auto_12310 ?auto_12312 ) ) ( SURFACE-AT ?auto_12302 ?auto_12305 ) ( ON ?auto_12302 ?auto_12303 ) ( CLEAR ?auto_12302 ) ( not ( = ?auto_12301 ?auto_12303 ) ) ( not ( = ?auto_12302 ?auto_12303 ) ) ( not ( = ?auto_12300 ?auto_12303 ) ) ( IS-CRATE ?auto_12301 ) ( not ( = ?auto_12309 ?auto_12308 ) ) ( not ( = ?auto_12305 ?auto_12309 ) ) ( HOIST-AT ?auto_12311 ?auto_12309 ) ( not ( = ?auto_12310 ?auto_12311 ) ) ( not ( = ?auto_12312 ?auto_12311 ) ) ( AVAILABLE ?auto_12311 ) ( SURFACE-AT ?auto_12301 ?auto_12309 ) ( ON ?auto_12301 ?auto_12304 ) ( CLEAR ?auto_12301 ) ( not ( = ?auto_12301 ?auto_12304 ) ) ( not ( = ?auto_12302 ?auto_12304 ) ) ( not ( = ?auto_12300 ?auto_12304 ) ) ( not ( = ?auto_12303 ?auto_12304 ) ) ( SURFACE-AT ?auto_12306 ?auto_12308 ) ( CLEAR ?auto_12306 ) ( IS-CRATE ?auto_12300 ) ( not ( = ?auto_12306 ?auto_12300 ) ) ( not ( = ?auto_12301 ?auto_12306 ) ) ( not ( = ?auto_12302 ?auto_12306 ) ) ( not ( = ?auto_12303 ?auto_12306 ) ) ( not ( = ?auto_12304 ?auto_12306 ) ) ( AVAILABLE ?auto_12310 ) ( TRUCK-AT ?auto_12307 ?auto_12305 ) ( LIFTING ?auto_12312 ?auto_12300 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12301 ?auto_12302 )
      ( MAKE-2CRATE-VERIFY ?auto_12300 ?auto_12301 ?auto_12302 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12313 - SURFACE
      ?auto_12314 - SURFACE
      ?auto_12315 - SURFACE
      ?auto_12316 - SURFACE
    )
    :vars
    (
      ?auto_12317 - HOIST
      ?auto_12324 - PLACE
      ?auto_12322 - PLACE
      ?auto_12320 - HOIST
      ?auto_12319 - SURFACE
      ?auto_12321 - PLACE
      ?auto_12323 - HOIST
      ?auto_12318 - SURFACE
      ?auto_12325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12317 ?auto_12324 ) ( IS-CRATE ?auto_12316 ) ( not ( = ?auto_12315 ?auto_12316 ) ) ( not ( = ?auto_12314 ?auto_12315 ) ) ( not ( = ?auto_12314 ?auto_12316 ) ) ( not ( = ?auto_12322 ?auto_12324 ) ) ( HOIST-AT ?auto_12320 ?auto_12322 ) ( not ( = ?auto_12317 ?auto_12320 ) ) ( SURFACE-AT ?auto_12316 ?auto_12322 ) ( ON ?auto_12316 ?auto_12319 ) ( CLEAR ?auto_12316 ) ( not ( = ?auto_12315 ?auto_12319 ) ) ( not ( = ?auto_12316 ?auto_12319 ) ) ( not ( = ?auto_12314 ?auto_12319 ) ) ( IS-CRATE ?auto_12315 ) ( not ( = ?auto_12321 ?auto_12324 ) ) ( not ( = ?auto_12322 ?auto_12321 ) ) ( HOIST-AT ?auto_12323 ?auto_12321 ) ( not ( = ?auto_12317 ?auto_12323 ) ) ( not ( = ?auto_12320 ?auto_12323 ) ) ( AVAILABLE ?auto_12323 ) ( SURFACE-AT ?auto_12315 ?auto_12321 ) ( ON ?auto_12315 ?auto_12318 ) ( CLEAR ?auto_12315 ) ( not ( = ?auto_12315 ?auto_12318 ) ) ( not ( = ?auto_12316 ?auto_12318 ) ) ( not ( = ?auto_12314 ?auto_12318 ) ) ( not ( = ?auto_12319 ?auto_12318 ) ) ( SURFACE-AT ?auto_12313 ?auto_12324 ) ( CLEAR ?auto_12313 ) ( IS-CRATE ?auto_12314 ) ( not ( = ?auto_12313 ?auto_12314 ) ) ( not ( = ?auto_12315 ?auto_12313 ) ) ( not ( = ?auto_12316 ?auto_12313 ) ) ( not ( = ?auto_12319 ?auto_12313 ) ) ( not ( = ?auto_12318 ?auto_12313 ) ) ( AVAILABLE ?auto_12317 ) ( TRUCK-AT ?auto_12325 ?auto_12322 ) ( LIFTING ?auto_12320 ?auto_12314 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12314 ?auto_12315 ?auto_12316 )
      ( MAKE-3CRATE-VERIFY ?auto_12313 ?auto_12314 ?auto_12315 ?auto_12316 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12326 - SURFACE
      ?auto_12327 - SURFACE
    )
    :vars
    (
      ?auto_12328 - HOIST
      ?auto_12337 - PLACE
      ?auto_12332 - SURFACE
      ?auto_12335 - PLACE
      ?auto_12333 - HOIST
      ?auto_12330 - SURFACE
      ?auto_12334 - PLACE
      ?auto_12336 - HOIST
      ?auto_12329 - SURFACE
      ?auto_12331 - SURFACE
      ?auto_12338 - TRUCK
      ?auto_12339 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12328 ?auto_12337 ) ( IS-CRATE ?auto_12327 ) ( not ( = ?auto_12326 ?auto_12327 ) ) ( not ( = ?auto_12332 ?auto_12326 ) ) ( not ( = ?auto_12332 ?auto_12327 ) ) ( not ( = ?auto_12335 ?auto_12337 ) ) ( HOIST-AT ?auto_12333 ?auto_12335 ) ( not ( = ?auto_12328 ?auto_12333 ) ) ( SURFACE-AT ?auto_12327 ?auto_12335 ) ( ON ?auto_12327 ?auto_12330 ) ( CLEAR ?auto_12327 ) ( not ( = ?auto_12326 ?auto_12330 ) ) ( not ( = ?auto_12327 ?auto_12330 ) ) ( not ( = ?auto_12332 ?auto_12330 ) ) ( IS-CRATE ?auto_12326 ) ( not ( = ?auto_12334 ?auto_12337 ) ) ( not ( = ?auto_12335 ?auto_12334 ) ) ( HOIST-AT ?auto_12336 ?auto_12334 ) ( not ( = ?auto_12328 ?auto_12336 ) ) ( not ( = ?auto_12333 ?auto_12336 ) ) ( AVAILABLE ?auto_12336 ) ( SURFACE-AT ?auto_12326 ?auto_12334 ) ( ON ?auto_12326 ?auto_12329 ) ( CLEAR ?auto_12326 ) ( not ( = ?auto_12326 ?auto_12329 ) ) ( not ( = ?auto_12327 ?auto_12329 ) ) ( not ( = ?auto_12332 ?auto_12329 ) ) ( not ( = ?auto_12330 ?auto_12329 ) ) ( SURFACE-AT ?auto_12331 ?auto_12337 ) ( CLEAR ?auto_12331 ) ( IS-CRATE ?auto_12332 ) ( not ( = ?auto_12331 ?auto_12332 ) ) ( not ( = ?auto_12326 ?auto_12331 ) ) ( not ( = ?auto_12327 ?auto_12331 ) ) ( not ( = ?auto_12330 ?auto_12331 ) ) ( not ( = ?auto_12329 ?auto_12331 ) ) ( AVAILABLE ?auto_12328 ) ( TRUCK-AT ?auto_12338 ?auto_12335 ) ( AVAILABLE ?auto_12333 ) ( SURFACE-AT ?auto_12332 ?auto_12335 ) ( ON ?auto_12332 ?auto_12339 ) ( CLEAR ?auto_12332 ) ( not ( = ?auto_12326 ?auto_12339 ) ) ( not ( = ?auto_12327 ?auto_12339 ) ) ( not ( = ?auto_12332 ?auto_12339 ) ) ( not ( = ?auto_12330 ?auto_12339 ) ) ( not ( = ?auto_12329 ?auto_12339 ) ) ( not ( = ?auto_12331 ?auto_12339 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12333 ?auto_12332 ?auto_12339 ?auto_12335 )
      ( MAKE-2CRATE ?auto_12332 ?auto_12326 ?auto_12327 )
      ( MAKE-1CRATE-VERIFY ?auto_12326 ?auto_12327 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12340 - SURFACE
      ?auto_12341 - SURFACE
      ?auto_12342 - SURFACE
    )
    :vars
    (
      ?auto_12351 - HOIST
      ?auto_12349 - PLACE
      ?auto_12348 - PLACE
      ?auto_12350 - HOIST
      ?auto_12353 - SURFACE
      ?auto_12343 - PLACE
      ?auto_12344 - HOIST
      ?auto_12345 - SURFACE
      ?auto_12352 - SURFACE
      ?auto_12347 - TRUCK
      ?auto_12346 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12351 ?auto_12349 ) ( IS-CRATE ?auto_12342 ) ( not ( = ?auto_12341 ?auto_12342 ) ) ( not ( = ?auto_12340 ?auto_12341 ) ) ( not ( = ?auto_12340 ?auto_12342 ) ) ( not ( = ?auto_12348 ?auto_12349 ) ) ( HOIST-AT ?auto_12350 ?auto_12348 ) ( not ( = ?auto_12351 ?auto_12350 ) ) ( SURFACE-AT ?auto_12342 ?auto_12348 ) ( ON ?auto_12342 ?auto_12353 ) ( CLEAR ?auto_12342 ) ( not ( = ?auto_12341 ?auto_12353 ) ) ( not ( = ?auto_12342 ?auto_12353 ) ) ( not ( = ?auto_12340 ?auto_12353 ) ) ( IS-CRATE ?auto_12341 ) ( not ( = ?auto_12343 ?auto_12349 ) ) ( not ( = ?auto_12348 ?auto_12343 ) ) ( HOIST-AT ?auto_12344 ?auto_12343 ) ( not ( = ?auto_12351 ?auto_12344 ) ) ( not ( = ?auto_12350 ?auto_12344 ) ) ( AVAILABLE ?auto_12344 ) ( SURFACE-AT ?auto_12341 ?auto_12343 ) ( ON ?auto_12341 ?auto_12345 ) ( CLEAR ?auto_12341 ) ( not ( = ?auto_12341 ?auto_12345 ) ) ( not ( = ?auto_12342 ?auto_12345 ) ) ( not ( = ?auto_12340 ?auto_12345 ) ) ( not ( = ?auto_12353 ?auto_12345 ) ) ( SURFACE-AT ?auto_12352 ?auto_12349 ) ( CLEAR ?auto_12352 ) ( IS-CRATE ?auto_12340 ) ( not ( = ?auto_12352 ?auto_12340 ) ) ( not ( = ?auto_12341 ?auto_12352 ) ) ( not ( = ?auto_12342 ?auto_12352 ) ) ( not ( = ?auto_12353 ?auto_12352 ) ) ( not ( = ?auto_12345 ?auto_12352 ) ) ( AVAILABLE ?auto_12351 ) ( TRUCK-AT ?auto_12347 ?auto_12348 ) ( AVAILABLE ?auto_12350 ) ( SURFACE-AT ?auto_12340 ?auto_12348 ) ( ON ?auto_12340 ?auto_12346 ) ( CLEAR ?auto_12340 ) ( not ( = ?auto_12341 ?auto_12346 ) ) ( not ( = ?auto_12342 ?auto_12346 ) ) ( not ( = ?auto_12340 ?auto_12346 ) ) ( not ( = ?auto_12353 ?auto_12346 ) ) ( not ( = ?auto_12345 ?auto_12346 ) ) ( not ( = ?auto_12352 ?auto_12346 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12341 ?auto_12342 )
      ( MAKE-2CRATE-VERIFY ?auto_12340 ?auto_12341 ?auto_12342 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12354 - SURFACE
      ?auto_12355 - SURFACE
      ?auto_12356 - SURFACE
      ?auto_12357 - SURFACE
    )
    :vars
    (
      ?auto_12358 - HOIST
      ?auto_12367 - PLACE
      ?auto_12363 - PLACE
      ?auto_12365 - HOIST
      ?auto_12359 - SURFACE
      ?auto_12364 - PLACE
      ?auto_12360 - HOIST
      ?auto_12361 - SURFACE
      ?auto_12366 - TRUCK
      ?auto_12362 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12358 ?auto_12367 ) ( IS-CRATE ?auto_12357 ) ( not ( = ?auto_12356 ?auto_12357 ) ) ( not ( = ?auto_12355 ?auto_12356 ) ) ( not ( = ?auto_12355 ?auto_12357 ) ) ( not ( = ?auto_12363 ?auto_12367 ) ) ( HOIST-AT ?auto_12365 ?auto_12363 ) ( not ( = ?auto_12358 ?auto_12365 ) ) ( SURFACE-AT ?auto_12357 ?auto_12363 ) ( ON ?auto_12357 ?auto_12359 ) ( CLEAR ?auto_12357 ) ( not ( = ?auto_12356 ?auto_12359 ) ) ( not ( = ?auto_12357 ?auto_12359 ) ) ( not ( = ?auto_12355 ?auto_12359 ) ) ( IS-CRATE ?auto_12356 ) ( not ( = ?auto_12364 ?auto_12367 ) ) ( not ( = ?auto_12363 ?auto_12364 ) ) ( HOIST-AT ?auto_12360 ?auto_12364 ) ( not ( = ?auto_12358 ?auto_12360 ) ) ( not ( = ?auto_12365 ?auto_12360 ) ) ( AVAILABLE ?auto_12360 ) ( SURFACE-AT ?auto_12356 ?auto_12364 ) ( ON ?auto_12356 ?auto_12361 ) ( CLEAR ?auto_12356 ) ( not ( = ?auto_12356 ?auto_12361 ) ) ( not ( = ?auto_12357 ?auto_12361 ) ) ( not ( = ?auto_12355 ?auto_12361 ) ) ( not ( = ?auto_12359 ?auto_12361 ) ) ( SURFACE-AT ?auto_12354 ?auto_12367 ) ( CLEAR ?auto_12354 ) ( IS-CRATE ?auto_12355 ) ( not ( = ?auto_12354 ?auto_12355 ) ) ( not ( = ?auto_12356 ?auto_12354 ) ) ( not ( = ?auto_12357 ?auto_12354 ) ) ( not ( = ?auto_12359 ?auto_12354 ) ) ( not ( = ?auto_12361 ?auto_12354 ) ) ( AVAILABLE ?auto_12358 ) ( TRUCK-AT ?auto_12366 ?auto_12363 ) ( AVAILABLE ?auto_12365 ) ( SURFACE-AT ?auto_12355 ?auto_12363 ) ( ON ?auto_12355 ?auto_12362 ) ( CLEAR ?auto_12355 ) ( not ( = ?auto_12356 ?auto_12362 ) ) ( not ( = ?auto_12357 ?auto_12362 ) ) ( not ( = ?auto_12355 ?auto_12362 ) ) ( not ( = ?auto_12359 ?auto_12362 ) ) ( not ( = ?auto_12361 ?auto_12362 ) ) ( not ( = ?auto_12354 ?auto_12362 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12355 ?auto_12356 ?auto_12357 )
      ( MAKE-3CRATE-VERIFY ?auto_12354 ?auto_12355 ?auto_12356 ?auto_12357 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12368 - SURFACE
      ?auto_12369 - SURFACE
    )
    :vars
    (
      ?auto_12370 - HOIST
      ?auto_12381 - PLACE
      ?auto_12371 - SURFACE
      ?auto_12376 - PLACE
      ?auto_12378 - HOIST
      ?auto_12372 - SURFACE
      ?auto_12377 - PLACE
      ?auto_12373 - HOIST
      ?auto_12374 - SURFACE
      ?auto_12379 - SURFACE
      ?auto_12375 - SURFACE
      ?auto_12380 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12370 ?auto_12381 ) ( IS-CRATE ?auto_12369 ) ( not ( = ?auto_12368 ?auto_12369 ) ) ( not ( = ?auto_12371 ?auto_12368 ) ) ( not ( = ?auto_12371 ?auto_12369 ) ) ( not ( = ?auto_12376 ?auto_12381 ) ) ( HOIST-AT ?auto_12378 ?auto_12376 ) ( not ( = ?auto_12370 ?auto_12378 ) ) ( SURFACE-AT ?auto_12369 ?auto_12376 ) ( ON ?auto_12369 ?auto_12372 ) ( CLEAR ?auto_12369 ) ( not ( = ?auto_12368 ?auto_12372 ) ) ( not ( = ?auto_12369 ?auto_12372 ) ) ( not ( = ?auto_12371 ?auto_12372 ) ) ( IS-CRATE ?auto_12368 ) ( not ( = ?auto_12377 ?auto_12381 ) ) ( not ( = ?auto_12376 ?auto_12377 ) ) ( HOIST-AT ?auto_12373 ?auto_12377 ) ( not ( = ?auto_12370 ?auto_12373 ) ) ( not ( = ?auto_12378 ?auto_12373 ) ) ( AVAILABLE ?auto_12373 ) ( SURFACE-AT ?auto_12368 ?auto_12377 ) ( ON ?auto_12368 ?auto_12374 ) ( CLEAR ?auto_12368 ) ( not ( = ?auto_12368 ?auto_12374 ) ) ( not ( = ?auto_12369 ?auto_12374 ) ) ( not ( = ?auto_12371 ?auto_12374 ) ) ( not ( = ?auto_12372 ?auto_12374 ) ) ( SURFACE-AT ?auto_12379 ?auto_12381 ) ( CLEAR ?auto_12379 ) ( IS-CRATE ?auto_12371 ) ( not ( = ?auto_12379 ?auto_12371 ) ) ( not ( = ?auto_12368 ?auto_12379 ) ) ( not ( = ?auto_12369 ?auto_12379 ) ) ( not ( = ?auto_12372 ?auto_12379 ) ) ( not ( = ?auto_12374 ?auto_12379 ) ) ( AVAILABLE ?auto_12370 ) ( AVAILABLE ?auto_12378 ) ( SURFACE-AT ?auto_12371 ?auto_12376 ) ( ON ?auto_12371 ?auto_12375 ) ( CLEAR ?auto_12371 ) ( not ( = ?auto_12368 ?auto_12375 ) ) ( not ( = ?auto_12369 ?auto_12375 ) ) ( not ( = ?auto_12371 ?auto_12375 ) ) ( not ( = ?auto_12372 ?auto_12375 ) ) ( not ( = ?auto_12374 ?auto_12375 ) ) ( not ( = ?auto_12379 ?auto_12375 ) ) ( TRUCK-AT ?auto_12380 ?auto_12381 ) )
    :subtasks
    ( ( !DRIVE ?auto_12380 ?auto_12381 ?auto_12376 )
      ( MAKE-2CRATE ?auto_12371 ?auto_12368 ?auto_12369 )
      ( MAKE-1CRATE-VERIFY ?auto_12368 ?auto_12369 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12382 - SURFACE
      ?auto_12383 - SURFACE
      ?auto_12384 - SURFACE
    )
    :vars
    (
      ?auto_12390 - HOIST
      ?auto_12395 - PLACE
      ?auto_12392 - PLACE
      ?auto_12391 - HOIST
      ?auto_12388 - SURFACE
      ?auto_12387 - PLACE
      ?auto_12385 - HOIST
      ?auto_12386 - SURFACE
      ?auto_12394 - SURFACE
      ?auto_12393 - SURFACE
      ?auto_12389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12390 ?auto_12395 ) ( IS-CRATE ?auto_12384 ) ( not ( = ?auto_12383 ?auto_12384 ) ) ( not ( = ?auto_12382 ?auto_12383 ) ) ( not ( = ?auto_12382 ?auto_12384 ) ) ( not ( = ?auto_12392 ?auto_12395 ) ) ( HOIST-AT ?auto_12391 ?auto_12392 ) ( not ( = ?auto_12390 ?auto_12391 ) ) ( SURFACE-AT ?auto_12384 ?auto_12392 ) ( ON ?auto_12384 ?auto_12388 ) ( CLEAR ?auto_12384 ) ( not ( = ?auto_12383 ?auto_12388 ) ) ( not ( = ?auto_12384 ?auto_12388 ) ) ( not ( = ?auto_12382 ?auto_12388 ) ) ( IS-CRATE ?auto_12383 ) ( not ( = ?auto_12387 ?auto_12395 ) ) ( not ( = ?auto_12392 ?auto_12387 ) ) ( HOIST-AT ?auto_12385 ?auto_12387 ) ( not ( = ?auto_12390 ?auto_12385 ) ) ( not ( = ?auto_12391 ?auto_12385 ) ) ( AVAILABLE ?auto_12385 ) ( SURFACE-AT ?auto_12383 ?auto_12387 ) ( ON ?auto_12383 ?auto_12386 ) ( CLEAR ?auto_12383 ) ( not ( = ?auto_12383 ?auto_12386 ) ) ( not ( = ?auto_12384 ?auto_12386 ) ) ( not ( = ?auto_12382 ?auto_12386 ) ) ( not ( = ?auto_12388 ?auto_12386 ) ) ( SURFACE-AT ?auto_12394 ?auto_12395 ) ( CLEAR ?auto_12394 ) ( IS-CRATE ?auto_12382 ) ( not ( = ?auto_12394 ?auto_12382 ) ) ( not ( = ?auto_12383 ?auto_12394 ) ) ( not ( = ?auto_12384 ?auto_12394 ) ) ( not ( = ?auto_12388 ?auto_12394 ) ) ( not ( = ?auto_12386 ?auto_12394 ) ) ( AVAILABLE ?auto_12390 ) ( AVAILABLE ?auto_12391 ) ( SURFACE-AT ?auto_12382 ?auto_12392 ) ( ON ?auto_12382 ?auto_12393 ) ( CLEAR ?auto_12382 ) ( not ( = ?auto_12383 ?auto_12393 ) ) ( not ( = ?auto_12384 ?auto_12393 ) ) ( not ( = ?auto_12382 ?auto_12393 ) ) ( not ( = ?auto_12388 ?auto_12393 ) ) ( not ( = ?auto_12386 ?auto_12393 ) ) ( not ( = ?auto_12394 ?auto_12393 ) ) ( TRUCK-AT ?auto_12389 ?auto_12395 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12383 ?auto_12384 )
      ( MAKE-2CRATE-VERIFY ?auto_12382 ?auto_12383 ?auto_12384 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12396 - SURFACE
      ?auto_12397 - SURFACE
      ?auto_12398 - SURFACE
      ?auto_12399 - SURFACE
    )
    :vars
    (
      ?auto_12402 - HOIST
      ?auto_12406 - PLACE
      ?auto_12400 - PLACE
      ?auto_12409 - HOIST
      ?auto_12405 - SURFACE
      ?auto_12401 - PLACE
      ?auto_12404 - HOIST
      ?auto_12403 - SURFACE
      ?auto_12408 - SURFACE
      ?auto_12407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12402 ?auto_12406 ) ( IS-CRATE ?auto_12399 ) ( not ( = ?auto_12398 ?auto_12399 ) ) ( not ( = ?auto_12397 ?auto_12398 ) ) ( not ( = ?auto_12397 ?auto_12399 ) ) ( not ( = ?auto_12400 ?auto_12406 ) ) ( HOIST-AT ?auto_12409 ?auto_12400 ) ( not ( = ?auto_12402 ?auto_12409 ) ) ( SURFACE-AT ?auto_12399 ?auto_12400 ) ( ON ?auto_12399 ?auto_12405 ) ( CLEAR ?auto_12399 ) ( not ( = ?auto_12398 ?auto_12405 ) ) ( not ( = ?auto_12399 ?auto_12405 ) ) ( not ( = ?auto_12397 ?auto_12405 ) ) ( IS-CRATE ?auto_12398 ) ( not ( = ?auto_12401 ?auto_12406 ) ) ( not ( = ?auto_12400 ?auto_12401 ) ) ( HOIST-AT ?auto_12404 ?auto_12401 ) ( not ( = ?auto_12402 ?auto_12404 ) ) ( not ( = ?auto_12409 ?auto_12404 ) ) ( AVAILABLE ?auto_12404 ) ( SURFACE-AT ?auto_12398 ?auto_12401 ) ( ON ?auto_12398 ?auto_12403 ) ( CLEAR ?auto_12398 ) ( not ( = ?auto_12398 ?auto_12403 ) ) ( not ( = ?auto_12399 ?auto_12403 ) ) ( not ( = ?auto_12397 ?auto_12403 ) ) ( not ( = ?auto_12405 ?auto_12403 ) ) ( SURFACE-AT ?auto_12396 ?auto_12406 ) ( CLEAR ?auto_12396 ) ( IS-CRATE ?auto_12397 ) ( not ( = ?auto_12396 ?auto_12397 ) ) ( not ( = ?auto_12398 ?auto_12396 ) ) ( not ( = ?auto_12399 ?auto_12396 ) ) ( not ( = ?auto_12405 ?auto_12396 ) ) ( not ( = ?auto_12403 ?auto_12396 ) ) ( AVAILABLE ?auto_12402 ) ( AVAILABLE ?auto_12409 ) ( SURFACE-AT ?auto_12397 ?auto_12400 ) ( ON ?auto_12397 ?auto_12408 ) ( CLEAR ?auto_12397 ) ( not ( = ?auto_12398 ?auto_12408 ) ) ( not ( = ?auto_12399 ?auto_12408 ) ) ( not ( = ?auto_12397 ?auto_12408 ) ) ( not ( = ?auto_12405 ?auto_12408 ) ) ( not ( = ?auto_12403 ?auto_12408 ) ) ( not ( = ?auto_12396 ?auto_12408 ) ) ( TRUCK-AT ?auto_12407 ?auto_12406 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12397 ?auto_12398 ?auto_12399 )
      ( MAKE-3CRATE-VERIFY ?auto_12396 ?auto_12397 ?auto_12398 ?auto_12399 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12424 - SURFACE
      ?auto_12425 - SURFACE
    )
    :vars
    (
      ?auto_12426 - HOIST
      ?auto_12427 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12426 ?auto_12427 ) ( SURFACE-AT ?auto_12424 ?auto_12427 ) ( CLEAR ?auto_12424 ) ( LIFTING ?auto_12426 ?auto_12425 ) ( IS-CRATE ?auto_12425 ) ( not ( = ?auto_12424 ?auto_12425 ) ) )
    :subtasks
    ( ( !DROP ?auto_12426 ?auto_12425 ?auto_12424 ?auto_12427 )
      ( MAKE-1CRATE-VERIFY ?auto_12424 ?auto_12425 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12428 - SURFACE
      ?auto_12429 - SURFACE
      ?auto_12430 - SURFACE
    )
    :vars
    (
      ?auto_12432 - HOIST
      ?auto_12431 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12432 ?auto_12431 ) ( SURFACE-AT ?auto_12429 ?auto_12431 ) ( CLEAR ?auto_12429 ) ( LIFTING ?auto_12432 ?auto_12430 ) ( IS-CRATE ?auto_12430 ) ( not ( = ?auto_12429 ?auto_12430 ) ) ( ON ?auto_12429 ?auto_12428 ) ( not ( = ?auto_12428 ?auto_12429 ) ) ( not ( = ?auto_12428 ?auto_12430 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12429 ?auto_12430 )
      ( MAKE-2CRATE-VERIFY ?auto_12428 ?auto_12429 ?auto_12430 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12433 - SURFACE
      ?auto_12434 - SURFACE
      ?auto_12435 - SURFACE
      ?auto_12436 - SURFACE
    )
    :vars
    (
      ?auto_12438 - HOIST
      ?auto_12437 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12438 ?auto_12437 ) ( SURFACE-AT ?auto_12435 ?auto_12437 ) ( CLEAR ?auto_12435 ) ( LIFTING ?auto_12438 ?auto_12436 ) ( IS-CRATE ?auto_12436 ) ( not ( = ?auto_12435 ?auto_12436 ) ) ( ON ?auto_12434 ?auto_12433 ) ( ON ?auto_12435 ?auto_12434 ) ( not ( = ?auto_12433 ?auto_12434 ) ) ( not ( = ?auto_12433 ?auto_12435 ) ) ( not ( = ?auto_12433 ?auto_12436 ) ) ( not ( = ?auto_12434 ?auto_12435 ) ) ( not ( = ?auto_12434 ?auto_12436 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12435 ?auto_12436 )
      ( MAKE-3CRATE-VERIFY ?auto_12433 ?auto_12434 ?auto_12435 ?auto_12436 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12439 - SURFACE
      ?auto_12440 - SURFACE
      ?auto_12441 - SURFACE
      ?auto_12442 - SURFACE
      ?auto_12443 - SURFACE
    )
    :vars
    (
      ?auto_12445 - HOIST
      ?auto_12444 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12445 ?auto_12444 ) ( SURFACE-AT ?auto_12442 ?auto_12444 ) ( CLEAR ?auto_12442 ) ( LIFTING ?auto_12445 ?auto_12443 ) ( IS-CRATE ?auto_12443 ) ( not ( = ?auto_12442 ?auto_12443 ) ) ( ON ?auto_12440 ?auto_12439 ) ( ON ?auto_12441 ?auto_12440 ) ( ON ?auto_12442 ?auto_12441 ) ( not ( = ?auto_12439 ?auto_12440 ) ) ( not ( = ?auto_12439 ?auto_12441 ) ) ( not ( = ?auto_12439 ?auto_12442 ) ) ( not ( = ?auto_12439 ?auto_12443 ) ) ( not ( = ?auto_12440 ?auto_12441 ) ) ( not ( = ?auto_12440 ?auto_12442 ) ) ( not ( = ?auto_12440 ?auto_12443 ) ) ( not ( = ?auto_12441 ?auto_12442 ) ) ( not ( = ?auto_12441 ?auto_12443 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12442 ?auto_12443 )
      ( MAKE-4CRATE-VERIFY ?auto_12439 ?auto_12440 ?auto_12441 ?auto_12442 ?auto_12443 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12446 - SURFACE
      ?auto_12447 - SURFACE
    )
    :vars
    (
      ?auto_12449 - HOIST
      ?auto_12448 - PLACE
      ?auto_12450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12449 ?auto_12448 ) ( SURFACE-AT ?auto_12446 ?auto_12448 ) ( CLEAR ?auto_12446 ) ( IS-CRATE ?auto_12447 ) ( not ( = ?auto_12446 ?auto_12447 ) ) ( TRUCK-AT ?auto_12450 ?auto_12448 ) ( AVAILABLE ?auto_12449 ) ( IN ?auto_12447 ?auto_12450 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12449 ?auto_12447 ?auto_12450 ?auto_12448 )
      ( MAKE-1CRATE ?auto_12446 ?auto_12447 )
      ( MAKE-1CRATE-VERIFY ?auto_12446 ?auto_12447 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12451 - SURFACE
      ?auto_12452 - SURFACE
      ?auto_12453 - SURFACE
    )
    :vars
    (
      ?auto_12455 - HOIST
      ?auto_12454 - PLACE
      ?auto_12456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12455 ?auto_12454 ) ( SURFACE-AT ?auto_12452 ?auto_12454 ) ( CLEAR ?auto_12452 ) ( IS-CRATE ?auto_12453 ) ( not ( = ?auto_12452 ?auto_12453 ) ) ( TRUCK-AT ?auto_12456 ?auto_12454 ) ( AVAILABLE ?auto_12455 ) ( IN ?auto_12453 ?auto_12456 ) ( ON ?auto_12452 ?auto_12451 ) ( not ( = ?auto_12451 ?auto_12452 ) ) ( not ( = ?auto_12451 ?auto_12453 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12452 ?auto_12453 )
      ( MAKE-2CRATE-VERIFY ?auto_12451 ?auto_12452 ?auto_12453 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12457 - SURFACE
      ?auto_12458 - SURFACE
      ?auto_12459 - SURFACE
      ?auto_12460 - SURFACE
    )
    :vars
    (
      ?auto_12462 - HOIST
      ?auto_12461 - PLACE
      ?auto_12463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12462 ?auto_12461 ) ( SURFACE-AT ?auto_12459 ?auto_12461 ) ( CLEAR ?auto_12459 ) ( IS-CRATE ?auto_12460 ) ( not ( = ?auto_12459 ?auto_12460 ) ) ( TRUCK-AT ?auto_12463 ?auto_12461 ) ( AVAILABLE ?auto_12462 ) ( IN ?auto_12460 ?auto_12463 ) ( ON ?auto_12459 ?auto_12458 ) ( not ( = ?auto_12458 ?auto_12459 ) ) ( not ( = ?auto_12458 ?auto_12460 ) ) ( ON ?auto_12458 ?auto_12457 ) ( not ( = ?auto_12457 ?auto_12458 ) ) ( not ( = ?auto_12457 ?auto_12459 ) ) ( not ( = ?auto_12457 ?auto_12460 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12458 ?auto_12459 ?auto_12460 )
      ( MAKE-3CRATE-VERIFY ?auto_12457 ?auto_12458 ?auto_12459 ?auto_12460 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12464 - SURFACE
      ?auto_12465 - SURFACE
      ?auto_12466 - SURFACE
      ?auto_12467 - SURFACE
      ?auto_12468 - SURFACE
    )
    :vars
    (
      ?auto_12470 - HOIST
      ?auto_12469 - PLACE
      ?auto_12471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12470 ?auto_12469 ) ( SURFACE-AT ?auto_12467 ?auto_12469 ) ( CLEAR ?auto_12467 ) ( IS-CRATE ?auto_12468 ) ( not ( = ?auto_12467 ?auto_12468 ) ) ( TRUCK-AT ?auto_12471 ?auto_12469 ) ( AVAILABLE ?auto_12470 ) ( IN ?auto_12468 ?auto_12471 ) ( ON ?auto_12467 ?auto_12466 ) ( not ( = ?auto_12466 ?auto_12467 ) ) ( not ( = ?auto_12466 ?auto_12468 ) ) ( ON ?auto_12465 ?auto_12464 ) ( ON ?auto_12466 ?auto_12465 ) ( not ( = ?auto_12464 ?auto_12465 ) ) ( not ( = ?auto_12464 ?auto_12466 ) ) ( not ( = ?auto_12464 ?auto_12467 ) ) ( not ( = ?auto_12464 ?auto_12468 ) ) ( not ( = ?auto_12465 ?auto_12466 ) ) ( not ( = ?auto_12465 ?auto_12467 ) ) ( not ( = ?auto_12465 ?auto_12468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12466 ?auto_12467 ?auto_12468 )
      ( MAKE-4CRATE-VERIFY ?auto_12464 ?auto_12465 ?auto_12466 ?auto_12467 ?auto_12468 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12472 - SURFACE
      ?auto_12473 - SURFACE
    )
    :vars
    (
      ?auto_12476 - HOIST
      ?auto_12475 - PLACE
      ?auto_12477 - TRUCK
      ?auto_12474 - SURFACE
      ?auto_12478 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12476 ?auto_12475 ) ( SURFACE-AT ?auto_12472 ?auto_12475 ) ( CLEAR ?auto_12472 ) ( IS-CRATE ?auto_12473 ) ( not ( = ?auto_12472 ?auto_12473 ) ) ( AVAILABLE ?auto_12476 ) ( IN ?auto_12473 ?auto_12477 ) ( ON ?auto_12472 ?auto_12474 ) ( not ( = ?auto_12474 ?auto_12472 ) ) ( not ( = ?auto_12474 ?auto_12473 ) ) ( TRUCK-AT ?auto_12477 ?auto_12478 ) ( not ( = ?auto_12478 ?auto_12475 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12477 ?auto_12478 ?auto_12475 )
      ( MAKE-2CRATE ?auto_12474 ?auto_12472 ?auto_12473 )
      ( MAKE-1CRATE-VERIFY ?auto_12472 ?auto_12473 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12479 - SURFACE
      ?auto_12480 - SURFACE
      ?auto_12481 - SURFACE
    )
    :vars
    (
      ?auto_12485 - HOIST
      ?auto_12482 - PLACE
      ?auto_12483 - TRUCK
      ?auto_12484 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12485 ?auto_12482 ) ( SURFACE-AT ?auto_12480 ?auto_12482 ) ( CLEAR ?auto_12480 ) ( IS-CRATE ?auto_12481 ) ( not ( = ?auto_12480 ?auto_12481 ) ) ( AVAILABLE ?auto_12485 ) ( IN ?auto_12481 ?auto_12483 ) ( ON ?auto_12480 ?auto_12479 ) ( not ( = ?auto_12479 ?auto_12480 ) ) ( not ( = ?auto_12479 ?auto_12481 ) ) ( TRUCK-AT ?auto_12483 ?auto_12484 ) ( not ( = ?auto_12484 ?auto_12482 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12480 ?auto_12481 )
      ( MAKE-2CRATE-VERIFY ?auto_12479 ?auto_12480 ?auto_12481 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12486 - SURFACE
      ?auto_12487 - SURFACE
      ?auto_12488 - SURFACE
      ?auto_12489 - SURFACE
    )
    :vars
    (
      ?auto_12491 - HOIST
      ?auto_12490 - PLACE
      ?auto_12492 - TRUCK
      ?auto_12493 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12491 ?auto_12490 ) ( SURFACE-AT ?auto_12488 ?auto_12490 ) ( CLEAR ?auto_12488 ) ( IS-CRATE ?auto_12489 ) ( not ( = ?auto_12488 ?auto_12489 ) ) ( AVAILABLE ?auto_12491 ) ( IN ?auto_12489 ?auto_12492 ) ( ON ?auto_12488 ?auto_12487 ) ( not ( = ?auto_12487 ?auto_12488 ) ) ( not ( = ?auto_12487 ?auto_12489 ) ) ( TRUCK-AT ?auto_12492 ?auto_12493 ) ( not ( = ?auto_12493 ?auto_12490 ) ) ( ON ?auto_12487 ?auto_12486 ) ( not ( = ?auto_12486 ?auto_12487 ) ) ( not ( = ?auto_12486 ?auto_12488 ) ) ( not ( = ?auto_12486 ?auto_12489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12487 ?auto_12488 ?auto_12489 )
      ( MAKE-3CRATE-VERIFY ?auto_12486 ?auto_12487 ?auto_12488 ?auto_12489 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12494 - SURFACE
      ?auto_12495 - SURFACE
      ?auto_12496 - SURFACE
      ?auto_12497 - SURFACE
      ?auto_12498 - SURFACE
    )
    :vars
    (
      ?auto_12500 - HOIST
      ?auto_12499 - PLACE
      ?auto_12501 - TRUCK
      ?auto_12502 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12500 ?auto_12499 ) ( SURFACE-AT ?auto_12497 ?auto_12499 ) ( CLEAR ?auto_12497 ) ( IS-CRATE ?auto_12498 ) ( not ( = ?auto_12497 ?auto_12498 ) ) ( AVAILABLE ?auto_12500 ) ( IN ?auto_12498 ?auto_12501 ) ( ON ?auto_12497 ?auto_12496 ) ( not ( = ?auto_12496 ?auto_12497 ) ) ( not ( = ?auto_12496 ?auto_12498 ) ) ( TRUCK-AT ?auto_12501 ?auto_12502 ) ( not ( = ?auto_12502 ?auto_12499 ) ) ( ON ?auto_12495 ?auto_12494 ) ( ON ?auto_12496 ?auto_12495 ) ( not ( = ?auto_12494 ?auto_12495 ) ) ( not ( = ?auto_12494 ?auto_12496 ) ) ( not ( = ?auto_12494 ?auto_12497 ) ) ( not ( = ?auto_12494 ?auto_12498 ) ) ( not ( = ?auto_12495 ?auto_12496 ) ) ( not ( = ?auto_12495 ?auto_12497 ) ) ( not ( = ?auto_12495 ?auto_12498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12496 ?auto_12497 ?auto_12498 )
      ( MAKE-4CRATE-VERIFY ?auto_12494 ?auto_12495 ?auto_12496 ?auto_12497 ?auto_12498 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12503 - SURFACE
      ?auto_12504 - SURFACE
    )
    :vars
    (
      ?auto_12507 - HOIST
      ?auto_12506 - PLACE
      ?auto_12505 - SURFACE
      ?auto_12508 - TRUCK
      ?auto_12509 - PLACE
      ?auto_12510 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12507 ?auto_12506 ) ( SURFACE-AT ?auto_12503 ?auto_12506 ) ( CLEAR ?auto_12503 ) ( IS-CRATE ?auto_12504 ) ( not ( = ?auto_12503 ?auto_12504 ) ) ( AVAILABLE ?auto_12507 ) ( ON ?auto_12503 ?auto_12505 ) ( not ( = ?auto_12505 ?auto_12503 ) ) ( not ( = ?auto_12505 ?auto_12504 ) ) ( TRUCK-AT ?auto_12508 ?auto_12509 ) ( not ( = ?auto_12509 ?auto_12506 ) ) ( HOIST-AT ?auto_12510 ?auto_12509 ) ( LIFTING ?auto_12510 ?auto_12504 ) ( not ( = ?auto_12507 ?auto_12510 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12510 ?auto_12504 ?auto_12508 ?auto_12509 )
      ( MAKE-2CRATE ?auto_12505 ?auto_12503 ?auto_12504 )
      ( MAKE-1CRATE-VERIFY ?auto_12503 ?auto_12504 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12511 - SURFACE
      ?auto_12512 - SURFACE
      ?auto_12513 - SURFACE
    )
    :vars
    (
      ?auto_12516 - HOIST
      ?auto_12514 - PLACE
      ?auto_12515 - TRUCK
      ?auto_12517 - PLACE
      ?auto_12518 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12516 ?auto_12514 ) ( SURFACE-AT ?auto_12512 ?auto_12514 ) ( CLEAR ?auto_12512 ) ( IS-CRATE ?auto_12513 ) ( not ( = ?auto_12512 ?auto_12513 ) ) ( AVAILABLE ?auto_12516 ) ( ON ?auto_12512 ?auto_12511 ) ( not ( = ?auto_12511 ?auto_12512 ) ) ( not ( = ?auto_12511 ?auto_12513 ) ) ( TRUCK-AT ?auto_12515 ?auto_12517 ) ( not ( = ?auto_12517 ?auto_12514 ) ) ( HOIST-AT ?auto_12518 ?auto_12517 ) ( LIFTING ?auto_12518 ?auto_12513 ) ( not ( = ?auto_12516 ?auto_12518 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12512 ?auto_12513 )
      ( MAKE-2CRATE-VERIFY ?auto_12511 ?auto_12512 ?auto_12513 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12519 - SURFACE
      ?auto_12520 - SURFACE
      ?auto_12521 - SURFACE
      ?auto_12522 - SURFACE
    )
    :vars
    (
      ?auto_12527 - HOIST
      ?auto_12523 - PLACE
      ?auto_12526 - TRUCK
      ?auto_12525 - PLACE
      ?auto_12524 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12527 ?auto_12523 ) ( SURFACE-AT ?auto_12521 ?auto_12523 ) ( CLEAR ?auto_12521 ) ( IS-CRATE ?auto_12522 ) ( not ( = ?auto_12521 ?auto_12522 ) ) ( AVAILABLE ?auto_12527 ) ( ON ?auto_12521 ?auto_12520 ) ( not ( = ?auto_12520 ?auto_12521 ) ) ( not ( = ?auto_12520 ?auto_12522 ) ) ( TRUCK-AT ?auto_12526 ?auto_12525 ) ( not ( = ?auto_12525 ?auto_12523 ) ) ( HOIST-AT ?auto_12524 ?auto_12525 ) ( LIFTING ?auto_12524 ?auto_12522 ) ( not ( = ?auto_12527 ?auto_12524 ) ) ( ON ?auto_12520 ?auto_12519 ) ( not ( = ?auto_12519 ?auto_12520 ) ) ( not ( = ?auto_12519 ?auto_12521 ) ) ( not ( = ?auto_12519 ?auto_12522 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12520 ?auto_12521 ?auto_12522 )
      ( MAKE-3CRATE-VERIFY ?auto_12519 ?auto_12520 ?auto_12521 ?auto_12522 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12528 - SURFACE
      ?auto_12529 - SURFACE
      ?auto_12530 - SURFACE
      ?auto_12531 - SURFACE
      ?auto_12532 - SURFACE
    )
    :vars
    (
      ?auto_12537 - HOIST
      ?auto_12533 - PLACE
      ?auto_12536 - TRUCK
      ?auto_12535 - PLACE
      ?auto_12534 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12537 ?auto_12533 ) ( SURFACE-AT ?auto_12531 ?auto_12533 ) ( CLEAR ?auto_12531 ) ( IS-CRATE ?auto_12532 ) ( not ( = ?auto_12531 ?auto_12532 ) ) ( AVAILABLE ?auto_12537 ) ( ON ?auto_12531 ?auto_12530 ) ( not ( = ?auto_12530 ?auto_12531 ) ) ( not ( = ?auto_12530 ?auto_12532 ) ) ( TRUCK-AT ?auto_12536 ?auto_12535 ) ( not ( = ?auto_12535 ?auto_12533 ) ) ( HOIST-AT ?auto_12534 ?auto_12535 ) ( LIFTING ?auto_12534 ?auto_12532 ) ( not ( = ?auto_12537 ?auto_12534 ) ) ( ON ?auto_12529 ?auto_12528 ) ( ON ?auto_12530 ?auto_12529 ) ( not ( = ?auto_12528 ?auto_12529 ) ) ( not ( = ?auto_12528 ?auto_12530 ) ) ( not ( = ?auto_12528 ?auto_12531 ) ) ( not ( = ?auto_12528 ?auto_12532 ) ) ( not ( = ?auto_12529 ?auto_12530 ) ) ( not ( = ?auto_12529 ?auto_12531 ) ) ( not ( = ?auto_12529 ?auto_12532 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12530 ?auto_12531 ?auto_12532 )
      ( MAKE-4CRATE-VERIFY ?auto_12528 ?auto_12529 ?auto_12530 ?auto_12531 ?auto_12532 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12538 - SURFACE
      ?auto_12539 - SURFACE
    )
    :vars
    (
      ?auto_12545 - HOIST
      ?auto_12541 - PLACE
      ?auto_12540 - SURFACE
      ?auto_12544 - TRUCK
      ?auto_12543 - PLACE
      ?auto_12542 - HOIST
      ?auto_12546 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12545 ?auto_12541 ) ( SURFACE-AT ?auto_12538 ?auto_12541 ) ( CLEAR ?auto_12538 ) ( IS-CRATE ?auto_12539 ) ( not ( = ?auto_12538 ?auto_12539 ) ) ( AVAILABLE ?auto_12545 ) ( ON ?auto_12538 ?auto_12540 ) ( not ( = ?auto_12540 ?auto_12538 ) ) ( not ( = ?auto_12540 ?auto_12539 ) ) ( TRUCK-AT ?auto_12544 ?auto_12543 ) ( not ( = ?auto_12543 ?auto_12541 ) ) ( HOIST-AT ?auto_12542 ?auto_12543 ) ( not ( = ?auto_12545 ?auto_12542 ) ) ( AVAILABLE ?auto_12542 ) ( SURFACE-AT ?auto_12539 ?auto_12543 ) ( ON ?auto_12539 ?auto_12546 ) ( CLEAR ?auto_12539 ) ( not ( = ?auto_12538 ?auto_12546 ) ) ( not ( = ?auto_12539 ?auto_12546 ) ) ( not ( = ?auto_12540 ?auto_12546 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12542 ?auto_12539 ?auto_12546 ?auto_12543 )
      ( MAKE-2CRATE ?auto_12540 ?auto_12538 ?auto_12539 )
      ( MAKE-1CRATE-VERIFY ?auto_12538 ?auto_12539 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12547 - SURFACE
      ?auto_12548 - SURFACE
      ?auto_12549 - SURFACE
    )
    :vars
    (
      ?auto_12550 - HOIST
      ?auto_12554 - PLACE
      ?auto_12555 - TRUCK
      ?auto_12552 - PLACE
      ?auto_12551 - HOIST
      ?auto_12553 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12550 ?auto_12554 ) ( SURFACE-AT ?auto_12548 ?auto_12554 ) ( CLEAR ?auto_12548 ) ( IS-CRATE ?auto_12549 ) ( not ( = ?auto_12548 ?auto_12549 ) ) ( AVAILABLE ?auto_12550 ) ( ON ?auto_12548 ?auto_12547 ) ( not ( = ?auto_12547 ?auto_12548 ) ) ( not ( = ?auto_12547 ?auto_12549 ) ) ( TRUCK-AT ?auto_12555 ?auto_12552 ) ( not ( = ?auto_12552 ?auto_12554 ) ) ( HOIST-AT ?auto_12551 ?auto_12552 ) ( not ( = ?auto_12550 ?auto_12551 ) ) ( AVAILABLE ?auto_12551 ) ( SURFACE-AT ?auto_12549 ?auto_12552 ) ( ON ?auto_12549 ?auto_12553 ) ( CLEAR ?auto_12549 ) ( not ( = ?auto_12548 ?auto_12553 ) ) ( not ( = ?auto_12549 ?auto_12553 ) ) ( not ( = ?auto_12547 ?auto_12553 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12548 ?auto_12549 )
      ( MAKE-2CRATE-VERIFY ?auto_12547 ?auto_12548 ?auto_12549 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12556 - SURFACE
      ?auto_12557 - SURFACE
      ?auto_12558 - SURFACE
      ?auto_12559 - SURFACE
    )
    :vars
    (
      ?auto_12563 - HOIST
      ?auto_12560 - PLACE
      ?auto_12562 - TRUCK
      ?auto_12561 - PLACE
      ?auto_12564 - HOIST
      ?auto_12565 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12563 ?auto_12560 ) ( SURFACE-AT ?auto_12558 ?auto_12560 ) ( CLEAR ?auto_12558 ) ( IS-CRATE ?auto_12559 ) ( not ( = ?auto_12558 ?auto_12559 ) ) ( AVAILABLE ?auto_12563 ) ( ON ?auto_12558 ?auto_12557 ) ( not ( = ?auto_12557 ?auto_12558 ) ) ( not ( = ?auto_12557 ?auto_12559 ) ) ( TRUCK-AT ?auto_12562 ?auto_12561 ) ( not ( = ?auto_12561 ?auto_12560 ) ) ( HOIST-AT ?auto_12564 ?auto_12561 ) ( not ( = ?auto_12563 ?auto_12564 ) ) ( AVAILABLE ?auto_12564 ) ( SURFACE-AT ?auto_12559 ?auto_12561 ) ( ON ?auto_12559 ?auto_12565 ) ( CLEAR ?auto_12559 ) ( not ( = ?auto_12558 ?auto_12565 ) ) ( not ( = ?auto_12559 ?auto_12565 ) ) ( not ( = ?auto_12557 ?auto_12565 ) ) ( ON ?auto_12557 ?auto_12556 ) ( not ( = ?auto_12556 ?auto_12557 ) ) ( not ( = ?auto_12556 ?auto_12558 ) ) ( not ( = ?auto_12556 ?auto_12559 ) ) ( not ( = ?auto_12556 ?auto_12565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12557 ?auto_12558 ?auto_12559 )
      ( MAKE-3CRATE-VERIFY ?auto_12556 ?auto_12557 ?auto_12558 ?auto_12559 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12566 - SURFACE
      ?auto_12567 - SURFACE
      ?auto_12568 - SURFACE
      ?auto_12569 - SURFACE
      ?auto_12570 - SURFACE
    )
    :vars
    (
      ?auto_12574 - HOIST
      ?auto_12571 - PLACE
      ?auto_12573 - TRUCK
      ?auto_12572 - PLACE
      ?auto_12575 - HOIST
      ?auto_12576 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12574 ?auto_12571 ) ( SURFACE-AT ?auto_12569 ?auto_12571 ) ( CLEAR ?auto_12569 ) ( IS-CRATE ?auto_12570 ) ( not ( = ?auto_12569 ?auto_12570 ) ) ( AVAILABLE ?auto_12574 ) ( ON ?auto_12569 ?auto_12568 ) ( not ( = ?auto_12568 ?auto_12569 ) ) ( not ( = ?auto_12568 ?auto_12570 ) ) ( TRUCK-AT ?auto_12573 ?auto_12572 ) ( not ( = ?auto_12572 ?auto_12571 ) ) ( HOIST-AT ?auto_12575 ?auto_12572 ) ( not ( = ?auto_12574 ?auto_12575 ) ) ( AVAILABLE ?auto_12575 ) ( SURFACE-AT ?auto_12570 ?auto_12572 ) ( ON ?auto_12570 ?auto_12576 ) ( CLEAR ?auto_12570 ) ( not ( = ?auto_12569 ?auto_12576 ) ) ( not ( = ?auto_12570 ?auto_12576 ) ) ( not ( = ?auto_12568 ?auto_12576 ) ) ( ON ?auto_12567 ?auto_12566 ) ( ON ?auto_12568 ?auto_12567 ) ( not ( = ?auto_12566 ?auto_12567 ) ) ( not ( = ?auto_12566 ?auto_12568 ) ) ( not ( = ?auto_12566 ?auto_12569 ) ) ( not ( = ?auto_12566 ?auto_12570 ) ) ( not ( = ?auto_12566 ?auto_12576 ) ) ( not ( = ?auto_12567 ?auto_12568 ) ) ( not ( = ?auto_12567 ?auto_12569 ) ) ( not ( = ?auto_12567 ?auto_12570 ) ) ( not ( = ?auto_12567 ?auto_12576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12568 ?auto_12569 ?auto_12570 )
      ( MAKE-4CRATE-VERIFY ?auto_12566 ?auto_12567 ?auto_12568 ?auto_12569 ?auto_12570 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12577 - SURFACE
      ?auto_12578 - SURFACE
    )
    :vars
    (
      ?auto_12583 - HOIST
      ?auto_12579 - PLACE
      ?auto_12582 - SURFACE
      ?auto_12580 - PLACE
      ?auto_12584 - HOIST
      ?auto_12585 - SURFACE
      ?auto_12581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12583 ?auto_12579 ) ( SURFACE-AT ?auto_12577 ?auto_12579 ) ( CLEAR ?auto_12577 ) ( IS-CRATE ?auto_12578 ) ( not ( = ?auto_12577 ?auto_12578 ) ) ( AVAILABLE ?auto_12583 ) ( ON ?auto_12577 ?auto_12582 ) ( not ( = ?auto_12582 ?auto_12577 ) ) ( not ( = ?auto_12582 ?auto_12578 ) ) ( not ( = ?auto_12580 ?auto_12579 ) ) ( HOIST-AT ?auto_12584 ?auto_12580 ) ( not ( = ?auto_12583 ?auto_12584 ) ) ( AVAILABLE ?auto_12584 ) ( SURFACE-AT ?auto_12578 ?auto_12580 ) ( ON ?auto_12578 ?auto_12585 ) ( CLEAR ?auto_12578 ) ( not ( = ?auto_12577 ?auto_12585 ) ) ( not ( = ?auto_12578 ?auto_12585 ) ) ( not ( = ?auto_12582 ?auto_12585 ) ) ( TRUCK-AT ?auto_12581 ?auto_12579 ) )
    :subtasks
    ( ( !DRIVE ?auto_12581 ?auto_12579 ?auto_12580 )
      ( MAKE-2CRATE ?auto_12582 ?auto_12577 ?auto_12578 )
      ( MAKE-1CRATE-VERIFY ?auto_12577 ?auto_12578 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12586 - SURFACE
      ?auto_12587 - SURFACE
      ?auto_12588 - SURFACE
    )
    :vars
    (
      ?auto_12590 - HOIST
      ?auto_12591 - PLACE
      ?auto_12594 - PLACE
      ?auto_12589 - HOIST
      ?auto_12592 - SURFACE
      ?auto_12593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12590 ?auto_12591 ) ( SURFACE-AT ?auto_12587 ?auto_12591 ) ( CLEAR ?auto_12587 ) ( IS-CRATE ?auto_12588 ) ( not ( = ?auto_12587 ?auto_12588 ) ) ( AVAILABLE ?auto_12590 ) ( ON ?auto_12587 ?auto_12586 ) ( not ( = ?auto_12586 ?auto_12587 ) ) ( not ( = ?auto_12586 ?auto_12588 ) ) ( not ( = ?auto_12594 ?auto_12591 ) ) ( HOIST-AT ?auto_12589 ?auto_12594 ) ( not ( = ?auto_12590 ?auto_12589 ) ) ( AVAILABLE ?auto_12589 ) ( SURFACE-AT ?auto_12588 ?auto_12594 ) ( ON ?auto_12588 ?auto_12592 ) ( CLEAR ?auto_12588 ) ( not ( = ?auto_12587 ?auto_12592 ) ) ( not ( = ?auto_12588 ?auto_12592 ) ) ( not ( = ?auto_12586 ?auto_12592 ) ) ( TRUCK-AT ?auto_12593 ?auto_12591 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12587 ?auto_12588 )
      ( MAKE-2CRATE-VERIFY ?auto_12586 ?auto_12587 ?auto_12588 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12595 - SURFACE
      ?auto_12596 - SURFACE
      ?auto_12597 - SURFACE
      ?auto_12598 - SURFACE
    )
    :vars
    (
      ?auto_12603 - HOIST
      ?auto_12599 - PLACE
      ?auto_12604 - PLACE
      ?auto_12601 - HOIST
      ?auto_12600 - SURFACE
      ?auto_12602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12603 ?auto_12599 ) ( SURFACE-AT ?auto_12597 ?auto_12599 ) ( CLEAR ?auto_12597 ) ( IS-CRATE ?auto_12598 ) ( not ( = ?auto_12597 ?auto_12598 ) ) ( AVAILABLE ?auto_12603 ) ( ON ?auto_12597 ?auto_12596 ) ( not ( = ?auto_12596 ?auto_12597 ) ) ( not ( = ?auto_12596 ?auto_12598 ) ) ( not ( = ?auto_12604 ?auto_12599 ) ) ( HOIST-AT ?auto_12601 ?auto_12604 ) ( not ( = ?auto_12603 ?auto_12601 ) ) ( AVAILABLE ?auto_12601 ) ( SURFACE-AT ?auto_12598 ?auto_12604 ) ( ON ?auto_12598 ?auto_12600 ) ( CLEAR ?auto_12598 ) ( not ( = ?auto_12597 ?auto_12600 ) ) ( not ( = ?auto_12598 ?auto_12600 ) ) ( not ( = ?auto_12596 ?auto_12600 ) ) ( TRUCK-AT ?auto_12602 ?auto_12599 ) ( ON ?auto_12596 ?auto_12595 ) ( not ( = ?auto_12595 ?auto_12596 ) ) ( not ( = ?auto_12595 ?auto_12597 ) ) ( not ( = ?auto_12595 ?auto_12598 ) ) ( not ( = ?auto_12595 ?auto_12600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12596 ?auto_12597 ?auto_12598 )
      ( MAKE-3CRATE-VERIFY ?auto_12595 ?auto_12596 ?auto_12597 ?auto_12598 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12605 - SURFACE
      ?auto_12606 - SURFACE
      ?auto_12607 - SURFACE
      ?auto_12608 - SURFACE
      ?auto_12609 - SURFACE
    )
    :vars
    (
      ?auto_12614 - HOIST
      ?auto_12610 - PLACE
      ?auto_12615 - PLACE
      ?auto_12612 - HOIST
      ?auto_12611 - SURFACE
      ?auto_12613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12614 ?auto_12610 ) ( SURFACE-AT ?auto_12608 ?auto_12610 ) ( CLEAR ?auto_12608 ) ( IS-CRATE ?auto_12609 ) ( not ( = ?auto_12608 ?auto_12609 ) ) ( AVAILABLE ?auto_12614 ) ( ON ?auto_12608 ?auto_12607 ) ( not ( = ?auto_12607 ?auto_12608 ) ) ( not ( = ?auto_12607 ?auto_12609 ) ) ( not ( = ?auto_12615 ?auto_12610 ) ) ( HOIST-AT ?auto_12612 ?auto_12615 ) ( not ( = ?auto_12614 ?auto_12612 ) ) ( AVAILABLE ?auto_12612 ) ( SURFACE-AT ?auto_12609 ?auto_12615 ) ( ON ?auto_12609 ?auto_12611 ) ( CLEAR ?auto_12609 ) ( not ( = ?auto_12608 ?auto_12611 ) ) ( not ( = ?auto_12609 ?auto_12611 ) ) ( not ( = ?auto_12607 ?auto_12611 ) ) ( TRUCK-AT ?auto_12613 ?auto_12610 ) ( ON ?auto_12606 ?auto_12605 ) ( ON ?auto_12607 ?auto_12606 ) ( not ( = ?auto_12605 ?auto_12606 ) ) ( not ( = ?auto_12605 ?auto_12607 ) ) ( not ( = ?auto_12605 ?auto_12608 ) ) ( not ( = ?auto_12605 ?auto_12609 ) ) ( not ( = ?auto_12605 ?auto_12611 ) ) ( not ( = ?auto_12606 ?auto_12607 ) ) ( not ( = ?auto_12606 ?auto_12608 ) ) ( not ( = ?auto_12606 ?auto_12609 ) ) ( not ( = ?auto_12606 ?auto_12611 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12607 ?auto_12608 ?auto_12609 )
      ( MAKE-4CRATE-VERIFY ?auto_12605 ?auto_12606 ?auto_12607 ?auto_12608 ?auto_12609 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12616 - SURFACE
      ?auto_12617 - SURFACE
    )
    :vars
    (
      ?auto_12623 - HOIST
      ?auto_12619 - PLACE
      ?auto_12618 - SURFACE
      ?auto_12624 - PLACE
      ?auto_12621 - HOIST
      ?auto_12620 - SURFACE
      ?auto_12622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12623 ?auto_12619 ) ( IS-CRATE ?auto_12617 ) ( not ( = ?auto_12616 ?auto_12617 ) ) ( not ( = ?auto_12618 ?auto_12616 ) ) ( not ( = ?auto_12618 ?auto_12617 ) ) ( not ( = ?auto_12624 ?auto_12619 ) ) ( HOIST-AT ?auto_12621 ?auto_12624 ) ( not ( = ?auto_12623 ?auto_12621 ) ) ( AVAILABLE ?auto_12621 ) ( SURFACE-AT ?auto_12617 ?auto_12624 ) ( ON ?auto_12617 ?auto_12620 ) ( CLEAR ?auto_12617 ) ( not ( = ?auto_12616 ?auto_12620 ) ) ( not ( = ?auto_12617 ?auto_12620 ) ) ( not ( = ?auto_12618 ?auto_12620 ) ) ( TRUCK-AT ?auto_12622 ?auto_12619 ) ( SURFACE-AT ?auto_12618 ?auto_12619 ) ( CLEAR ?auto_12618 ) ( LIFTING ?auto_12623 ?auto_12616 ) ( IS-CRATE ?auto_12616 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12618 ?auto_12616 )
      ( MAKE-2CRATE ?auto_12618 ?auto_12616 ?auto_12617 )
      ( MAKE-1CRATE-VERIFY ?auto_12616 ?auto_12617 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12625 - SURFACE
      ?auto_12626 - SURFACE
      ?auto_12627 - SURFACE
    )
    :vars
    (
      ?auto_12628 - HOIST
      ?auto_12633 - PLACE
      ?auto_12632 - PLACE
      ?auto_12631 - HOIST
      ?auto_12629 - SURFACE
      ?auto_12630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12628 ?auto_12633 ) ( IS-CRATE ?auto_12627 ) ( not ( = ?auto_12626 ?auto_12627 ) ) ( not ( = ?auto_12625 ?auto_12626 ) ) ( not ( = ?auto_12625 ?auto_12627 ) ) ( not ( = ?auto_12632 ?auto_12633 ) ) ( HOIST-AT ?auto_12631 ?auto_12632 ) ( not ( = ?auto_12628 ?auto_12631 ) ) ( AVAILABLE ?auto_12631 ) ( SURFACE-AT ?auto_12627 ?auto_12632 ) ( ON ?auto_12627 ?auto_12629 ) ( CLEAR ?auto_12627 ) ( not ( = ?auto_12626 ?auto_12629 ) ) ( not ( = ?auto_12627 ?auto_12629 ) ) ( not ( = ?auto_12625 ?auto_12629 ) ) ( TRUCK-AT ?auto_12630 ?auto_12633 ) ( SURFACE-AT ?auto_12625 ?auto_12633 ) ( CLEAR ?auto_12625 ) ( LIFTING ?auto_12628 ?auto_12626 ) ( IS-CRATE ?auto_12626 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12626 ?auto_12627 )
      ( MAKE-2CRATE-VERIFY ?auto_12625 ?auto_12626 ?auto_12627 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12634 - SURFACE
      ?auto_12635 - SURFACE
      ?auto_12636 - SURFACE
      ?auto_12637 - SURFACE
    )
    :vars
    (
      ?auto_12638 - HOIST
      ?auto_12640 - PLACE
      ?auto_12639 - PLACE
      ?auto_12641 - HOIST
      ?auto_12643 - SURFACE
      ?auto_12642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12638 ?auto_12640 ) ( IS-CRATE ?auto_12637 ) ( not ( = ?auto_12636 ?auto_12637 ) ) ( not ( = ?auto_12635 ?auto_12636 ) ) ( not ( = ?auto_12635 ?auto_12637 ) ) ( not ( = ?auto_12639 ?auto_12640 ) ) ( HOIST-AT ?auto_12641 ?auto_12639 ) ( not ( = ?auto_12638 ?auto_12641 ) ) ( AVAILABLE ?auto_12641 ) ( SURFACE-AT ?auto_12637 ?auto_12639 ) ( ON ?auto_12637 ?auto_12643 ) ( CLEAR ?auto_12637 ) ( not ( = ?auto_12636 ?auto_12643 ) ) ( not ( = ?auto_12637 ?auto_12643 ) ) ( not ( = ?auto_12635 ?auto_12643 ) ) ( TRUCK-AT ?auto_12642 ?auto_12640 ) ( SURFACE-AT ?auto_12635 ?auto_12640 ) ( CLEAR ?auto_12635 ) ( LIFTING ?auto_12638 ?auto_12636 ) ( IS-CRATE ?auto_12636 ) ( ON ?auto_12635 ?auto_12634 ) ( not ( = ?auto_12634 ?auto_12635 ) ) ( not ( = ?auto_12634 ?auto_12636 ) ) ( not ( = ?auto_12634 ?auto_12637 ) ) ( not ( = ?auto_12634 ?auto_12643 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12635 ?auto_12636 ?auto_12637 )
      ( MAKE-3CRATE-VERIFY ?auto_12634 ?auto_12635 ?auto_12636 ?auto_12637 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12644 - SURFACE
      ?auto_12645 - SURFACE
      ?auto_12646 - SURFACE
      ?auto_12647 - SURFACE
      ?auto_12648 - SURFACE
    )
    :vars
    (
      ?auto_12649 - HOIST
      ?auto_12651 - PLACE
      ?auto_12650 - PLACE
      ?auto_12652 - HOIST
      ?auto_12654 - SURFACE
      ?auto_12653 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12649 ?auto_12651 ) ( IS-CRATE ?auto_12648 ) ( not ( = ?auto_12647 ?auto_12648 ) ) ( not ( = ?auto_12646 ?auto_12647 ) ) ( not ( = ?auto_12646 ?auto_12648 ) ) ( not ( = ?auto_12650 ?auto_12651 ) ) ( HOIST-AT ?auto_12652 ?auto_12650 ) ( not ( = ?auto_12649 ?auto_12652 ) ) ( AVAILABLE ?auto_12652 ) ( SURFACE-AT ?auto_12648 ?auto_12650 ) ( ON ?auto_12648 ?auto_12654 ) ( CLEAR ?auto_12648 ) ( not ( = ?auto_12647 ?auto_12654 ) ) ( not ( = ?auto_12648 ?auto_12654 ) ) ( not ( = ?auto_12646 ?auto_12654 ) ) ( TRUCK-AT ?auto_12653 ?auto_12651 ) ( SURFACE-AT ?auto_12646 ?auto_12651 ) ( CLEAR ?auto_12646 ) ( LIFTING ?auto_12649 ?auto_12647 ) ( IS-CRATE ?auto_12647 ) ( ON ?auto_12645 ?auto_12644 ) ( ON ?auto_12646 ?auto_12645 ) ( not ( = ?auto_12644 ?auto_12645 ) ) ( not ( = ?auto_12644 ?auto_12646 ) ) ( not ( = ?auto_12644 ?auto_12647 ) ) ( not ( = ?auto_12644 ?auto_12648 ) ) ( not ( = ?auto_12644 ?auto_12654 ) ) ( not ( = ?auto_12645 ?auto_12646 ) ) ( not ( = ?auto_12645 ?auto_12647 ) ) ( not ( = ?auto_12645 ?auto_12648 ) ) ( not ( = ?auto_12645 ?auto_12654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12646 ?auto_12647 ?auto_12648 )
      ( MAKE-4CRATE-VERIFY ?auto_12644 ?auto_12645 ?auto_12646 ?auto_12647 ?auto_12648 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12655 - SURFACE
      ?auto_12656 - SURFACE
    )
    :vars
    (
      ?auto_12657 - HOIST
      ?auto_12659 - PLACE
      ?auto_12661 - SURFACE
      ?auto_12658 - PLACE
      ?auto_12660 - HOIST
      ?auto_12663 - SURFACE
      ?auto_12662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12657 ?auto_12659 ) ( IS-CRATE ?auto_12656 ) ( not ( = ?auto_12655 ?auto_12656 ) ) ( not ( = ?auto_12661 ?auto_12655 ) ) ( not ( = ?auto_12661 ?auto_12656 ) ) ( not ( = ?auto_12658 ?auto_12659 ) ) ( HOIST-AT ?auto_12660 ?auto_12658 ) ( not ( = ?auto_12657 ?auto_12660 ) ) ( AVAILABLE ?auto_12660 ) ( SURFACE-AT ?auto_12656 ?auto_12658 ) ( ON ?auto_12656 ?auto_12663 ) ( CLEAR ?auto_12656 ) ( not ( = ?auto_12655 ?auto_12663 ) ) ( not ( = ?auto_12656 ?auto_12663 ) ) ( not ( = ?auto_12661 ?auto_12663 ) ) ( TRUCK-AT ?auto_12662 ?auto_12659 ) ( SURFACE-AT ?auto_12661 ?auto_12659 ) ( CLEAR ?auto_12661 ) ( IS-CRATE ?auto_12655 ) ( AVAILABLE ?auto_12657 ) ( IN ?auto_12655 ?auto_12662 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12657 ?auto_12655 ?auto_12662 ?auto_12659 )
      ( MAKE-2CRATE ?auto_12661 ?auto_12655 ?auto_12656 )
      ( MAKE-1CRATE-VERIFY ?auto_12655 ?auto_12656 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12664 - SURFACE
      ?auto_12665 - SURFACE
      ?auto_12666 - SURFACE
    )
    :vars
    (
      ?auto_12671 - HOIST
      ?auto_12667 - PLACE
      ?auto_12668 - PLACE
      ?auto_12669 - HOIST
      ?auto_12670 - SURFACE
      ?auto_12672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12671 ?auto_12667 ) ( IS-CRATE ?auto_12666 ) ( not ( = ?auto_12665 ?auto_12666 ) ) ( not ( = ?auto_12664 ?auto_12665 ) ) ( not ( = ?auto_12664 ?auto_12666 ) ) ( not ( = ?auto_12668 ?auto_12667 ) ) ( HOIST-AT ?auto_12669 ?auto_12668 ) ( not ( = ?auto_12671 ?auto_12669 ) ) ( AVAILABLE ?auto_12669 ) ( SURFACE-AT ?auto_12666 ?auto_12668 ) ( ON ?auto_12666 ?auto_12670 ) ( CLEAR ?auto_12666 ) ( not ( = ?auto_12665 ?auto_12670 ) ) ( not ( = ?auto_12666 ?auto_12670 ) ) ( not ( = ?auto_12664 ?auto_12670 ) ) ( TRUCK-AT ?auto_12672 ?auto_12667 ) ( SURFACE-AT ?auto_12664 ?auto_12667 ) ( CLEAR ?auto_12664 ) ( IS-CRATE ?auto_12665 ) ( AVAILABLE ?auto_12671 ) ( IN ?auto_12665 ?auto_12672 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12665 ?auto_12666 )
      ( MAKE-2CRATE-VERIFY ?auto_12664 ?auto_12665 ?auto_12666 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12673 - SURFACE
      ?auto_12674 - SURFACE
      ?auto_12675 - SURFACE
      ?auto_12676 - SURFACE
    )
    :vars
    (
      ?auto_12677 - HOIST
      ?auto_12682 - PLACE
      ?auto_12681 - PLACE
      ?auto_12679 - HOIST
      ?auto_12678 - SURFACE
      ?auto_12680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12677 ?auto_12682 ) ( IS-CRATE ?auto_12676 ) ( not ( = ?auto_12675 ?auto_12676 ) ) ( not ( = ?auto_12674 ?auto_12675 ) ) ( not ( = ?auto_12674 ?auto_12676 ) ) ( not ( = ?auto_12681 ?auto_12682 ) ) ( HOIST-AT ?auto_12679 ?auto_12681 ) ( not ( = ?auto_12677 ?auto_12679 ) ) ( AVAILABLE ?auto_12679 ) ( SURFACE-AT ?auto_12676 ?auto_12681 ) ( ON ?auto_12676 ?auto_12678 ) ( CLEAR ?auto_12676 ) ( not ( = ?auto_12675 ?auto_12678 ) ) ( not ( = ?auto_12676 ?auto_12678 ) ) ( not ( = ?auto_12674 ?auto_12678 ) ) ( TRUCK-AT ?auto_12680 ?auto_12682 ) ( SURFACE-AT ?auto_12674 ?auto_12682 ) ( CLEAR ?auto_12674 ) ( IS-CRATE ?auto_12675 ) ( AVAILABLE ?auto_12677 ) ( IN ?auto_12675 ?auto_12680 ) ( ON ?auto_12674 ?auto_12673 ) ( not ( = ?auto_12673 ?auto_12674 ) ) ( not ( = ?auto_12673 ?auto_12675 ) ) ( not ( = ?auto_12673 ?auto_12676 ) ) ( not ( = ?auto_12673 ?auto_12678 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12674 ?auto_12675 ?auto_12676 )
      ( MAKE-3CRATE-VERIFY ?auto_12673 ?auto_12674 ?auto_12675 ?auto_12676 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12683 - SURFACE
      ?auto_12684 - SURFACE
      ?auto_12685 - SURFACE
      ?auto_12686 - SURFACE
      ?auto_12687 - SURFACE
    )
    :vars
    (
      ?auto_12688 - HOIST
      ?auto_12693 - PLACE
      ?auto_12692 - PLACE
      ?auto_12690 - HOIST
      ?auto_12689 - SURFACE
      ?auto_12691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12688 ?auto_12693 ) ( IS-CRATE ?auto_12687 ) ( not ( = ?auto_12686 ?auto_12687 ) ) ( not ( = ?auto_12685 ?auto_12686 ) ) ( not ( = ?auto_12685 ?auto_12687 ) ) ( not ( = ?auto_12692 ?auto_12693 ) ) ( HOIST-AT ?auto_12690 ?auto_12692 ) ( not ( = ?auto_12688 ?auto_12690 ) ) ( AVAILABLE ?auto_12690 ) ( SURFACE-AT ?auto_12687 ?auto_12692 ) ( ON ?auto_12687 ?auto_12689 ) ( CLEAR ?auto_12687 ) ( not ( = ?auto_12686 ?auto_12689 ) ) ( not ( = ?auto_12687 ?auto_12689 ) ) ( not ( = ?auto_12685 ?auto_12689 ) ) ( TRUCK-AT ?auto_12691 ?auto_12693 ) ( SURFACE-AT ?auto_12685 ?auto_12693 ) ( CLEAR ?auto_12685 ) ( IS-CRATE ?auto_12686 ) ( AVAILABLE ?auto_12688 ) ( IN ?auto_12686 ?auto_12691 ) ( ON ?auto_12684 ?auto_12683 ) ( ON ?auto_12685 ?auto_12684 ) ( not ( = ?auto_12683 ?auto_12684 ) ) ( not ( = ?auto_12683 ?auto_12685 ) ) ( not ( = ?auto_12683 ?auto_12686 ) ) ( not ( = ?auto_12683 ?auto_12687 ) ) ( not ( = ?auto_12683 ?auto_12689 ) ) ( not ( = ?auto_12684 ?auto_12685 ) ) ( not ( = ?auto_12684 ?auto_12686 ) ) ( not ( = ?auto_12684 ?auto_12687 ) ) ( not ( = ?auto_12684 ?auto_12689 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12685 ?auto_12686 ?auto_12687 )
      ( MAKE-4CRATE-VERIFY ?auto_12683 ?auto_12684 ?auto_12685 ?auto_12686 ?auto_12687 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12694 - SURFACE
      ?auto_12695 - SURFACE
    )
    :vars
    (
      ?auto_12697 - HOIST
      ?auto_12702 - PLACE
      ?auto_12696 - SURFACE
      ?auto_12701 - PLACE
      ?auto_12699 - HOIST
      ?auto_12698 - SURFACE
      ?auto_12700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12697 ?auto_12702 ) ( IS-CRATE ?auto_12695 ) ( not ( = ?auto_12694 ?auto_12695 ) ) ( not ( = ?auto_12696 ?auto_12694 ) ) ( not ( = ?auto_12696 ?auto_12695 ) ) ( not ( = ?auto_12701 ?auto_12702 ) ) ( HOIST-AT ?auto_12699 ?auto_12701 ) ( not ( = ?auto_12697 ?auto_12699 ) ) ( AVAILABLE ?auto_12699 ) ( SURFACE-AT ?auto_12695 ?auto_12701 ) ( ON ?auto_12695 ?auto_12698 ) ( CLEAR ?auto_12695 ) ( not ( = ?auto_12694 ?auto_12698 ) ) ( not ( = ?auto_12695 ?auto_12698 ) ) ( not ( = ?auto_12696 ?auto_12698 ) ) ( SURFACE-AT ?auto_12696 ?auto_12702 ) ( CLEAR ?auto_12696 ) ( IS-CRATE ?auto_12694 ) ( AVAILABLE ?auto_12697 ) ( IN ?auto_12694 ?auto_12700 ) ( TRUCK-AT ?auto_12700 ?auto_12701 ) )
    :subtasks
    ( ( !DRIVE ?auto_12700 ?auto_12701 ?auto_12702 )
      ( MAKE-2CRATE ?auto_12696 ?auto_12694 ?auto_12695 )
      ( MAKE-1CRATE-VERIFY ?auto_12694 ?auto_12695 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12703 - SURFACE
      ?auto_12704 - SURFACE
      ?auto_12705 - SURFACE
    )
    :vars
    (
      ?auto_12709 - HOIST
      ?auto_12707 - PLACE
      ?auto_12708 - PLACE
      ?auto_12706 - HOIST
      ?auto_12710 - SURFACE
      ?auto_12711 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12709 ?auto_12707 ) ( IS-CRATE ?auto_12705 ) ( not ( = ?auto_12704 ?auto_12705 ) ) ( not ( = ?auto_12703 ?auto_12704 ) ) ( not ( = ?auto_12703 ?auto_12705 ) ) ( not ( = ?auto_12708 ?auto_12707 ) ) ( HOIST-AT ?auto_12706 ?auto_12708 ) ( not ( = ?auto_12709 ?auto_12706 ) ) ( AVAILABLE ?auto_12706 ) ( SURFACE-AT ?auto_12705 ?auto_12708 ) ( ON ?auto_12705 ?auto_12710 ) ( CLEAR ?auto_12705 ) ( not ( = ?auto_12704 ?auto_12710 ) ) ( not ( = ?auto_12705 ?auto_12710 ) ) ( not ( = ?auto_12703 ?auto_12710 ) ) ( SURFACE-AT ?auto_12703 ?auto_12707 ) ( CLEAR ?auto_12703 ) ( IS-CRATE ?auto_12704 ) ( AVAILABLE ?auto_12709 ) ( IN ?auto_12704 ?auto_12711 ) ( TRUCK-AT ?auto_12711 ?auto_12708 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12704 ?auto_12705 )
      ( MAKE-2CRATE-VERIFY ?auto_12703 ?auto_12704 ?auto_12705 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12712 - SURFACE
      ?auto_12713 - SURFACE
      ?auto_12714 - SURFACE
      ?auto_12715 - SURFACE
    )
    :vars
    (
      ?auto_12720 - HOIST
      ?auto_12718 - PLACE
      ?auto_12717 - PLACE
      ?auto_12716 - HOIST
      ?auto_12721 - SURFACE
      ?auto_12719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12720 ?auto_12718 ) ( IS-CRATE ?auto_12715 ) ( not ( = ?auto_12714 ?auto_12715 ) ) ( not ( = ?auto_12713 ?auto_12714 ) ) ( not ( = ?auto_12713 ?auto_12715 ) ) ( not ( = ?auto_12717 ?auto_12718 ) ) ( HOIST-AT ?auto_12716 ?auto_12717 ) ( not ( = ?auto_12720 ?auto_12716 ) ) ( AVAILABLE ?auto_12716 ) ( SURFACE-AT ?auto_12715 ?auto_12717 ) ( ON ?auto_12715 ?auto_12721 ) ( CLEAR ?auto_12715 ) ( not ( = ?auto_12714 ?auto_12721 ) ) ( not ( = ?auto_12715 ?auto_12721 ) ) ( not ( = ?auto_12713 ?auto_12721 ) ) ( SURFACE-AT ?auto_12713 ?auto_12718 ) ( CLEAR ?auto_12713 ) ( IS-CRATE ?auto_12714 ) ( AVAILABLE ?auto_12720 ) ( IN ?auto_12714 ?auto_12719 ) ( TRUCK-AT ?auto_12719 ?auto_12717 ) ( ON ?auto_12713 ?auto_12712 ) ( not ( = ?auto_12712 ?auto_12713 ) ) ( not ( = ?auto_12712 ?auto_12714 ) ) ( not ( = ?auto_12712 ?auto_12715 ) ) ( not ( = ?auto_12712 ?auto_12721 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12713 ?auto_12714 ?auto_12715 )
      ( MAKE-3CRATE-VERIFY ?auto_12712 ?auto_12713 ?auto_12714 ?auto_12715 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12722 - SURFACE
      ?auto_12723 - SURFACE
      ?auto_12724 - SURFACE
      ?auto_12725 - SURFACE
      ?auto_12726 - SURFACE
    )
    :vars
    (
      ?auto_12731 - HOIST
      ?auto_12729 - PLACE
      ?auto_12728 - PLACE
      ?auto_12727 - HOIST
      ?auto_12732 - SURFACE
      ?auto_12730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12731 ?auto_12729 ) ( IS-CRATE ?auto_12726 ) ( not ( = ?auto_12725 ?auto_12726 ) ) ( not ( = ?auto_12724 ?auto_12725 ) ) ( not ( = ?auto_12724 ?auto_12726 ) ) ( not ( = ?auto_12728 ?auto_12729 ) ) ( HOIST-AT ?auto_12727 ?auto_12728 ) ( not ( = ?auto_12731 ?auto_12727 ) ) ( AVAILABLE ?auto_12727 ) ( SURFACE-AT ?auto_12726 ?auto_12728 ) ( ON ?auto_12726 ?auto_12732 ) ( CLEAR ?auto_12726 ) ( not ( = ?auto_12725 ?auto_12732 ) ) ( not ( = ?auto_12726 ?auto_12732 ) ) ( not ( = ?auto_12724 ?auto_12732 ) ) ( SURFACE-AT ?auto_12724 ?auto_12729 ) ( CLEAR ?auto_12724 ) ( IS-CRATE ?auto_12725 ) ( AVAILABLE ?auto_12731 ) ( IN ?auto_12725 ?auto_12730 ) ( TRUCK-AT ?auto_12730 ?auto_12728 ) ( ON ?auto_12723 ?auto_12722 ) ( ON ?auto_12724 ?auto_12723 ) ( not ( = ?auto_12722 ?auto_12723 ) ) ( not ( = ?auto_12722 ?auto_12724 ) ) ( not ( = ?auto_12722 ?auto_12725 ) ) ( not ( = ?auto_12722 ?auto_12726 ) ) ( not ( = ?auto_12722 ?auto_12732 ) ) ( not ( = ?auto_12723 ?auto_12724 ) ) ( not ( = ?auto_12723 ?auto_12725 ) ) ( not ( = ?auto_12723 ?auto_12726 ) ) ( not ( = ?auto_12723 ?auto_12732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12724 ?auto_12725 ?auto_12726 )
      ( MAKE-4CRATE-VERIFY ?auto_12722 ?auto_12723 ?auto_12724 ?auto_12725 ?auto_12726 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12733 - SURFACE
      ?auto_12734 - SURFACE
    )
    :vars
    (
      ?auto_12740 - HOIST
      ?auto_12737 - PLACE
      ?auto_12739 - SURFACE
      ?auto_12736 - PLACE
      ?auto_12735 - HOIST
      ?auto_12741 - SURFACE
      ?auto_12738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12740 ?auto_12737 ) ( IS-CRATE ?auto_12734 ) ( not ( = ?auto_12733 ?auto_12734 ) ) ( not ( = ?auto_12739 ?auto_12733 ) ) ( not ( = ?auto_12739 ?auto_12734 ) ) ( not ( = ?auto_12736 ?auto_12737 ) ) ( HOIST-AT ?auto_12735 ?auto_12736 ) ( not ( = ?auto_12740 ?auto_12735 ) ) ( SURFACE-AT ?auto_12734 ?auto_12736 ) ( ON ?auto_12734 ?auto_12741 ) ( CLEAR ?auto_12734 ) ( not ( = ?auto_12733 ?auto_12741 ) ) ( not ( = ?auto_12734 ?auto_12741 ) ) ( not ( = ?auto_12739 ?auto_12741 ) ) ( SURFACE-AT ?auto_12739 ?auto_12737 ) ( CLEAR ?auto_12739 ) ( IS-CRATE ?auto_12733 ) ( AVAILABLE ?auto_12740 ) ( TRUCK-AT ?auto_12738 ?auto_12736 ) ( LIFTING ?auto_12735 ?auto_12733 ) )
    :subtasks
    ( ( !LOAD ?auto_12735 ?auto_12733 ?auto_12738 ?auto_12736 )
      ( MAKE-2CRATE ?auto_12739 ?auto_12733 ?auto_12734 )
      ( MAKE-1CRATE-VERIFY ?auto_12733 ?auto_12734 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12742 - SURFACE
      ?auto_12743 - SURFACE
      ?auto_12744 - SURFACE
    )
    :vars
    (
      ?auto_12750 - HOIST
      ?auto_12746 - PLACE
      ?auto_12745 - PLACE
      ?auto_12748 - HOIST
      ?auto_12749 - SURFACE
      ?auto_12747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12750 ?auto_12746 ) ( IS-CRATE ?auto_12744 ) ( not ( = ?auto_12743 ?auto_12744 ) ) ( not ( = ?auto_12742 ?auto_12743 ) ) ( not ( = ?auto_12742 ?auto_12744 ) ) ( not ( = ?auto_12745 ?auto_12746 ) ) ( HOIST-AT ?auto_12748 ?auto_12745 ) ( not ( = ?auto_12750 ?auto_12748 ) ) ( SURFACE-AT ?auto_12744 ?auto_12745 ) ( ON ?auto_12744 ?auto_12749 ) ( CLEAR ?auto_12744 ) ( not ( = ?auto_12743 ?auto_12749 ) ) ( not ( = ?auto_12744 ?auto_12749 ) ) ( not ( = ?auto_12742 ?auto_12749 ) ) ( SURFACE-AT ?auto_12742 ?auto_12746 ) ( CLEAR ?auto_12742 ) ( IS-CRATE ?auto_12743 ) ( AVAILABLE ?auto_12750 ) ( TRUCK-AT ?auto_12747 ?auto_12745 ) ( LIFTING ?auto_12748 ?auto_12743 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12743 ?auto_12744 )
      ( MAKE-2CRATE-VERIFY ?auto_12742 ?auto_12743 ?auto_12744 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12751 - SURFACE
      ?auto_12752 - SURFACE
      ?auto_12753 - SURFACE
      ?auto_12754 - SURFACE
    )
    :vars
    (
      ?auto_12756 - HOIST
      ?auto_12759 - PLACE
      ?auto_12760 - PLACE
      ?auto_12755 - HOIST
      ?auto_12758 - SURFACE
      ?auto_12757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12756 ?auto_12759 ) ( IS-CRATE ?auto_12754 ) ( not ( = ?auto_12753 ?auto_12754 ) ) ( not ( = ?auto_12752 ?auto_12753 ) ) ( not ( = ?auto_12752 ?auto_12754 ) ) ( not ( = ?auto_12760 ?auto_12759 ) ) ( HOIST-AT ?auto_12755 ?auto_12760 ) ( not ( = ?auto_12756 ?auto_12755 ) ) ( SURFACE-AT ?auto_12754 ?auto_12760 ) ( ON ?auto_12754 ?auto_12758 ) ( CLEAR ?auto_12754 ) ( not ( = ?auto_12753 ?auto_12758 ) ) ( not ( = ?auto_12754 ?auto_12758 ) ) ( not ( = ?auto_12752 ?auto_12758 ) ) ( SURFACE-AT ?auto_12752 ?auto_12759 ) ( CLEAR ?auto_12752 ) ( IS-CRATE ?auto_12753 ) ( AVAILABLE ?auto_12756 ) ( TRUCK-AT ?auto_12757 ?auto_12760 ) ( LIFTING ?auto_12755 ?auto_12753 ) ( ON ?auto_12752 ?auto_12751 ) ( not ( = ?auto_12751 ?auto_12752 ) ) ( not ( = ?auto_12751 ?auto_12753 ) ) ( not ( = ?auto_12751 ?auto_12754 ) ) ( not ( = ?auto_12751 ?auto_12758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12752 ?auto_12753 ?auto_12754 )
      ( MAKE-3CRATE-VERIFY ?auto_12751 ?auto_12752 ?auto_12753 ?auto_12754 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12761 - SURFACE
      ?auto_12762 - SURFACE
      ?auto_12763 - SURFACE
      ?auto_12764 - SURFACE
      ?auto_12765 - SURFACE
    )
    :vars
    (
      ?auto_12767 - HOIST
      ?auto_12770 - PLACE
      ?auto_12771 - PLACE
      ?auto_12766 - HOIST
      ?auto_12769 - SURFACE
      ?auto_12768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12767 ?auto_12770 ) ( IS-CRATE ?auto_12765 ) ( not ( = ?auto_12764 ?auto_12765 ) ) ( not ( = ?auto_12763 ?auto_12764 ) ) ( not ( = ?auto_12763 ?auto_12765 ) ) ( not ( = ?auto_12771 ?auto_12770 ) ) ( HOIST-AT ?auto_12766 ?auto_12771 ) ( not ( = ?auto_12767 ?auto_12766 ) ) ( SURFACE-AT ?auto_12765 ?auto_12771 ) ( ON ?auto_12765 ?auto_12769 ) ( CLEAR ?auto_12765 ) ( not ( = ?auto_12764 ?auto_12769 ) ) ( not ( = ?auto_12765 ?auto_12769 ) ) ( not ( = ?auto_12763 ?auto_12769 ) ) ( SURFACE-AT ?auto_12763 ?auto_12770 ) ( CLEAR ?auto_12763 ) ( IS-CRATE ?auto_12764 ) ( AVAILABLE ?auto_12767 ) ( TRUCK-AT ?auto_12768 ?auto_12771 ) ( LIFTING ?auto_12766 ?auto_12764 ) ( ON ?auto_12762 ?auto_12761 ) ( ON ?auto_12763 ?auto_12762 ) ( not ( = ?auto_12761 ?auto_12762 ) ) ( not ( = ?auto_12761 ?auto_12763 ) ) ( not ( = ?auto_12761 ?auto_12764 ) ) ( not ( = ?auto_12761 ?auto_12765 ) ) ( not ( = ?auto_12761 ?auto_12769 ) ) ( not ( = ?auto_12762 ?auto_12763 ) ) ( not ( = ?auto_12762 ?auto_12764 ) ) ( not ( = ?auto_12762 ?auto_12765 ) ) ( not ( = ?auto_12762 ?auto_12769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12763 ?auto_12764 ?auto_12765 )
      ( MAKE-4CRATE-VERIFY ?auto_12761 ?auto_12762 ?auto_12763 ?auto_12764 ?auto_12765 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12772 - SURFACE
      ?auto_12773 - SURFACE
    )
    :vars
    (
      ?auto_12775 - HOIST
      ?auto_12778 - PLACE
      ?auto_12780 - SURFACE
      ?auto_12779 - PLACE
      ?auto_12774 - HOIST
      ?auto_12777 - SURFACE
      ?auto_12776 - TRUCK
      ?auto_12781 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12775 ?auto_12778 ) ( IS-CRATE ?auto_12773 ) ( not ( = ?auto_12772 ?auto_12773 ) ) ( not ( = ?auto_12780 ?auto_12772 ) ) ( not ( = ?auto_12780 ?auto_12773 ) ) ( not ( = ?auto_12779 ?auto_12778 ) ) ( HOIST-AT ?auto_12774 ?auto_12779 ) ( not ( = ?auto_12775 ?auto_12774 ) ) ( SURFACE-AT ?auto_12773 ?auto_12779 ) ( ON ?auto_12773 ?auto_12777 ) ( CLEAR ?auto_12773 ) ( not ( = ?auto_12772 ?auto_12777 ) ) ( not ( = ?auto_12773 ?auto_12777 ) ) ( not ( = ?auto_12780 ?auto_12777 ) ) ( SURFACE-AT ?auto_12780 ?auto_12778 ) ( CLEAR ?auto_12780 ) ( IS-CRATE ?auto_12772 ) ( AVAILABLE ?auto_12775 ) ( TRUCK-AT ?auto_12776 ?auto_12779 ) ( AVAILABLE ?auto_12774 ) ( SURFACE-AT ?auto_12772 ?auto_12779 ) ( ON ?auto_12772 ?auto_12781 ) ( CLEAR ?auto_12772 ) ( not ( = ?auto_12772 ?auto_12781 ) ) ( not ( = ?auto_12773 ?auto_12781 ) ) ( not ( = ?auto_12780 ?auto_12781 ) ) ( not ( = ?auto_12777 ?auto_12781 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12774 ?auto_12772 ?auto_12781 ?auto_12779 )
      ( MAKE-2CRATE ?auto_12780 ?auto_12772 ?auto_12773 )
      ( MAKE-1CRATE-VERIFY ?auto_12772 ?auto_12773 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12782 - SURFACE
      ?auto_12783 - SURFACE
      ?auto_12784 - SURFACE
    )
    :vars
    (
      ?auto_12787 - HOIST
      ?auto_12788 - PLACE
      ?auto_12791 - PLACE
      ?auto_12785 - HOIST
      ?auto_12786 - SURFACE
      ?auto_12789 - TRUCK
      ?auto_12790 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12787 ?auto_12788 ) ( IS-CRATE ?auto_12784 ) ( not ( = ?auto_12783 ?auto_12784 ) ) ( not ( = ?auto_12782 ?auto_12783 ) ) ( not ( = ?auto_12782 ?auto_12784 ) ) ( not ( = ?auto_12791 ?auto_12788 ) ) ( HOIST-AT ?auto_12785 ?auto_12791 ) ( not ( = ?auto_12787 ?auto_12785 ) ) ( SURFACE-AT ?auto_12784 ?auto_12791 ) ( ON ?auto_12784 ?auto_12786 ) ( CLEAR ?auto_12784 ) ( not ( = ?auto_12783 ?auto_12786 ) ) ( not ( = ?auto_12784 ?auto_12786 ) ) ( not ( = ?auto_12782 ?auto_12786 ) ) ( SURFACE-AT ?auto_12782 ?auto_12788 ) ( CLEAR ?auto_12782 ) ( IS-CRATE ?auto_12783 ) ( AVAILABLE ?auto_12787 ) ( TRUCK-AT ?auto_12789 ?auto_12791 ) ( AVAILABLE ?auto_12785 ) ( SURFACE-AT ?auto_12783 ?auto_12791 ) ( ON ?auto_12783 ?auto_12790 ) ( CLEAR ?auto_12783 ) ( not ( = ?auto_12783 ?auto_12790 ) ) ( not ( = ?auto_12784 ?auto_12790 ) ) ( not ( = ?auto_12782 ?auto_12790 ) ) ( not ( = ?auto_12786 ?auto_12790 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12783 ?auto_12784 )
      ( MAKE-2CRATE-VERIFY ?auto_12782 ?auto_12783 ?auto_12784 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12792 - SURFACE
      ?auto_12793 - SURFACE
      ?auto_12794 - SURFACE
      ?auto_12795 - SURFACE
    )
    :vars
    (
      ?auto_12796 - HOIST
      ?auto_12802 - PLACE
      ?auto_12797 - PLACE
      ?auto_12799 - HOIST
      ?auto_12801 - SURFACE
      ?auto_12800 - TRUCK
      ?auto_12798 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12796 ?auto_12802 ) ( IS-CRATE ?auto_12795 ) ( not ( = ?auto_12794 ?auto_12795 ) ) ( not ( = ?auto_12793 ?auto_12794 ) ) ( not ( = ?auto_12793 ?auto_12795 ) ) ( not ( = ?auto_12797 ?auto_12802 ) ) ( HOIST-AT ?auto_12799 ?auto_12797 ) ( not ( = ?auto_12796 ?auto_12799 ) ) ( SURFACE-AT ?auto_12795 ?auto_12797 ) ( ON ?auto_12795 ?auto_12801 ) ( CLEAR ?auto_12795 ) ( not ( = ?auto_12794 ?auto_12801 ) ) ( not ( = ?auto_12795 ?auto_12801 ) ) ( not ( = ?auto_12793 ?auto_12801 ) ) ( SURFACE-AT ?auto_12793 ?auto_12802 ) ( CLEAR ?auto_12793 ) ( IS-CRATE ?auto_12794 ) ( AVAILABLE ?auto_12796 ) ( TRUCK-AT ?auto_12800 ?auto_12797 ) ( AVAILABLE ?auto_12799 ) ( SURFACE-AT ?auto_12794 ?auto_12797 ) ( ON ?auto_12794 ?auto_12798 ) ( CLEAR ?auto_12794 ) ( not ( = ?auto_12794 ?auto_12798 ) ) ( not ( = ?auto_12795 ?auto_12798 ) ) ( not ( = ?auto_12793 ?auto_12798 ) ) ( not ( = ?auto_12801 ?auto_12798 ) ) ( ON ?auto_12793 ?auto_12792 ) ( not ( = ?auto_12792 ?auto_12793 ) ) ( not ( = ?auto_12792 ?auto_12794 ) ) ( not ( = ?auto_12792 ?auto_12795 ) ) ( not ( = ?auto_12792 ?auto_12801 ) ) ( not ( = ?auto_12792 ?auto_12798 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12793 ?auto_12794 ?auto_12795 )
      ( MAKE-3CRATE-VERIFY ?auto_12792 ?auto_12793 ?auto_12794 ?auto_12795 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12803 - SURFACE
      ?auto_12804 - SURFACE
      ?auto_12805 - SURFACE
      ?auto_12806 - SURFACE
      ?auto_12807 - SURFACE
    )
    :vars
    (
      ?auto_12808 - HOIST
      ?auto_12814 - PLACE
      ?auto_12809 - PLACE
      ?auto_12811 - HOIST
      ?auto_12813 - SURFACE
      ?auto_12812 - TRUCK
      ?auto_12810 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12808 ?auto_12814 ) ( IS-CRATE ?auto_12807 ) ( not ( = ?auto_12806 ?auto_12807 ) ) ( not ( = ?auto_12805 ?auto_12806 ) ) ( not ( = ?auto_12805 ?auto_12807 ) ) ( not ( = ?auto_12809 ?auto_12814 ) ) ( HOIST-AT ?auto_12811 ?auto_12809 ) ( not ( = ?auto_12808 ?auto_12811 ) ) ( SURFACE-AT ?auto_12807 ?auto_12809 ) ( ON ?auto_12807 ?auto_12813 ) ( CLEAR ?auto_12807 ) ( not ( = ?auto_12806 ?auto_12813 ) ) ( not ( = ?auto_12807 ?auto_12813 ) ) ( not ( = ?auto_12805 ?auto_12813 ) ) ( SURFACE-AT ?auto_12805 ?auto_12814 ) ( CLEAR ?auto_12805 ) ( IS-CRATE ?auto_12806 ) ( AVAILABLE ?auto_12808 ) ( TRUCK-AT ?auto_12812 ?auto_12809 ) ( AVAILABLE ?auto_12811 ) ( SURFACE-AT ?auto_12806 ?auto_12809 ) ( ON ?auto_12806 ?auto_12810 ) ( CLEAR ?auto_12806 ) ( not ( = ?auto_12806 ?auto_12810 ) ) ( not ( = ?auto_12807 ?auto_12810 ) ) ( not ( = ?auto_12805 ?auto_12810 ) ) ( not ( = ?auto_12813 ?auto_12810 ) ) ( ON ?auto_12804 ?auto_12803 ) ( ON ?auto_12805 ?auto_12804 ) ( not ( = ?auto_12803 ?auto_12804 ) ) ( not ( = ?auto_12803 ?auto_12805 ) ) ( not ( = ?auto_12803 ?auto_12806 ) ) ( not ( = ?auto_12803 ?auto_12807 ) ) ( not ( = ?auto_12803 ?auto_12813 ) ) ( not ( = ?auto_12803 ?auto_12810 ) ) ( not ( = ?auto_12804 ?auto_12805 ) ) ( not ( = ?auto_12804 ?auto_12806 ) ) ( not ( = ?auto_12804 ?auto_12807 ) ) ( not ( = ?auto_12804 ?auto_12813 ) ) ( not ( = ?auto_12804 ?auto_12810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12805 ?auto_12806 ?auto_12807 )
      ( MAKE-4CRATE-VERIFY ?auto_12803 ?auto_12804 ?auto_12805 ?auto_12806 ?auto_12807 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12815 - SURFACE
      ?auto_12816 - SURFACE
    )
    :vars
    (
      ?auto_12817 - HOIST
      ?auto_12824 - PLACE
      ?auto_12820 - SURFACE
      ?auto_12818 - PLACE
      ?auto_12821 - HOIST
      ?auto_12823 - SURFACE
      ?auto_12819 - SURFACE
      ?auto_12822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12817 ?auto_12824 ) ( IS-CRATE ?auto_12816 ) ( not ( = ?auto_12815 ?auto_12816 ) ) ( not ( = ?auto_12820 ?auto_12815 ) ) ( not ( = ?auto_12820 ?auto_12816 ) ) ( not ( = ?auto_12818 ?auto_12824 ) ) ( HOIST-AT ?auto_12821 ?auto_12818 ) ( not ( = ?auto_12817 ?auto_12821 ) ) ( SURFACE-AT ?auto_12816 ?auto_12818 ) ( ON ?auto_12816 ?auto_12823 ) ( CLEAR ?auto_12816 ) ( not ( = ?auto_12815 ?auto_12823 ) ) ( not ( = ?auto_12816 ?auto_12823 ) ) ( not ( = ?auto_12820 ?auto_12823 ) ) ( SURFACE-AT ?auto_12820 ?auto_12824 ) ( CLEAR ?auto_12820 ) ( IS-CRATE ?auto_12815 ) ( AVAILABLE ?auto_12817 ) ( AVAILABLE ?auto_12821 ) ( SURFACE-AT ?auto_12815 ?auto_12818 ) ( ON ?auto_12815 ?auto_12819 ) ( CLEAR ?auto_12815 ) ( not ( = ?auto_12815 ?auto_12819 ) ) ( not ( = ?auto_12816 ?auto_12819 ) ) ( not ( = ?auto_12820 ?auto_12819 ) ) ( not ( = ?auto_12823 ?auto_12819 ) ) ( TRUCK-AT ?auto_12822 ?auto_12824 ) )
    :subtasks
    ( ( !DRIVE ?auto_12822 ?auto_12824 ?auto_12818 )
      ( MAKE-2CRATE ?auto_12820 ?auto_12815 ?auto_12816 )
      ( MAKE-1CRATE-VERIFY ?auto_12815 ?auto_12816 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12825 - SURFACE
      ?auto_12826 - SURFACE
      ?auto_12827 - SURFACE
    )
    :vars
    (
      ?auto_12828 - HOIST
      ?auto_12831 - PLACE
      ?auto_12830 - PLACE
      ?auto_12833 - HOIST
      ?auto_12834 - SURFACE
      ?auto_12832 - SURFACE
      ?auto_12829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12828 ?auto_12831 ) ( IS-CRATE ?auto_12827 ) ( not ( = ?auto_12826 ?auto_12827 ) ) ( not ( = ?auto_12825 ?auto_12826 ) ) ( not ( = ?auto_12825 ?auto_12827 ) ) ( not ( = ?auto_12830 ?auto_12831 ) ) ( HOIST-AT ?auto_12833 ?auto_12830 ) ( not ( = ?auto_12828 ?auto_12833 ) ) ( SURFACE-AT ?auto_12827 ?auto_12830 ) ( ON ?auto_12827 ?auto_12834 ) ( CLEAR ?auto_12827 ) ( not ( = ?auto_12826 ?auto_12834 ) ) ( not ( = ?auto_12827 ?auto_12834 ) ) ( not ( = ?auto_12825 ?auto_12834 ) ) ( SURFACE-AT ?auto_12825 ?auto_12831 ) ( CLEAR ?auto_12825 ) ( IS-CRATE ?auto_12826 ) ( AVAILABLE ?auto_12828 ) ( AVAILABLE ?auto_12833 ) ( SURFACE-AT ?auto_12826 ?auto_12830 ) ( ON ?auto_12826 ?auto_12832 ) ( CLEAR ?auto_12826 ) ( not ( = ?auto_12826 ?auto_12832 ) ) ( not ( = ?auto_12827 ?auto_12832 ) ) ( not ( = ?auto_12825 ?auto_12832 ) ) ( not ( = ?auto_12834 ?auto_12832 ) ) ( TRUCK-AT ?auto_12829 ?auto_12831 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12826 ?auto_12827 )
      ( MAKE-2CRATE-VERIFY ?auto_12825 ?auto_12826 ?auto_12827 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12835 - SURFACE
      ?auto_12836 - SURFACE
      ?auto_12837 - SURFACE
      ?auto_12838 - SURFACE
    )
    :vars
    (
      ?auto_12839 - HOIST
      ?auto_12843 - PLACE
      ?auto_12842 - PLACE
      ?auto_12844 - HOIST
      ?auto_12845 - SURFACE
      ?auto_12840 - SURFACE
      ?auto_12841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12839 ?auto_12843 ) ( IS-CRATE ?auto_12838 ) ( not ( = ?auto_12837 ?auto_12838 ) ) ( not ( = ?auto_12836 ?auto_12837 ) ) ( not ( = ?auto_12836 ?auto_12838 ) ) ( not ( = ?auto_12842 ?auto_12843 ) ) ( HOIST-AT ?auto_12844 ?auto_12842 ) ( not ( = ?auto_12839 ?auto_12844 ) ) ( SURFACE-AT ?auto_12838 ?auto_12842 ) ( ON ?auto_12838 ?auto_12845 ) ( CLEAR ?auto_12838 ) ( not ( = ?auto_12837 ?auto_12845 ) ) ( not ( = ?auto_12838 ?auto_12845 ) ) ( not ( = ?auto_12836 ?auto_12845 ) ) ( SURFACE-AT ?auto_12836 ?auto_12843 ) ( CLEAR ?auto_12836 ) ( IS-CRATE ?auto_12837 ) ( AVAILABLE ?auto_12839 ) ( AVAILABLE ?auto_12844 ) ( SURFACE-AT ?auto_12837 ?auto_12842 ) ( ON ?auto_12837 ?auto_12840 ) ( CLEAR ?auto_12837 ) ( not ( = ?auto_12837 ?auto_12840 ) ) ( not ( = ?auto_12838 ?auto_12840 ) ) ( not ( = ?auto_12836 ?auto_12840 ) ) ( not ( = ?auto_12845 ?auto_12840 ) ) ( TRUCK-AT ?auto_12841 ?auto_12843 ) ( ON ?auto_12836 ?auto_12835 ) ( not ( = ?auto_12835 ?auto_12836 ) ) ( not ( = ?auto_12835 ?auto_12837 ) ) ( not ( = ?auto_12835 ?auto_12838 ) ) ( not ( = ?auto_12835 ?auto_12845 ) ) ( not ( = ?auto_12835 ?auto_12840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12836 ?auto_12837 ?auto_12838 )
      ( MAKE-3CRATE-VERIFY ?auto_12835 ?auto_12836 ?auto_12837 ?auto_12838 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12846 - SURFACE
      ?auto_12847 - SURFACE
      ?auto_12848 - SURFACE
      ?auto_12849 - SURFACE
      ?auto_12850 - SURFACE
    )
    :vars
    (
      ?auto_12851 - HOIST
      ?auto_12855 - PLACE
      ?auto_12854 - PLACE
      ?auto_12856 - HOIST
      ?auto_12857 - SURFACE
      ?auto_12852 - SURFACE
      ?auto_12853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12851 ?auto_12855 ) ( IS-CRATE ?auto_12850 ) ( not ( = ?auto_12849 ?auto_12850 ) ) ( not ( = ?auto_12848 ?auto_12849 ) ) ( not ( = ?auto_12848 ?auto_12850 ) ) ( not ( = ?auto_12854 ?auto_12855 ) ) ( HOIST-AT ?auto_12856 ?auto_12854 ) ( not ( = ?auto_12851 ?auto_12856 ) ) ( SURFACE-AT ?auto_12850 ?auto_12854 ) ( ON ?auto_12850 ?auto_12857 ) ( CLEAR ?auto_12850 ) ( not ( = ?auto_12849 ?auto_12857 ) ) ( not ( = ?auto_12850 ?auto_12857 ) ) ( not ( = ?auto_12848 ?auto_12857 ) ) ( SURFACE-AT ?auto_12848 ?auto_12855 ) ( CLEAR ?auto_12848 ) ( IS-CRATE ?auto_12849 ) ( AVAILABLE ?auto_12851 ) ( AVAILABLE ?auto_12856 ) ( SURFACE-AT ?auto_12849 ?auto_12854 ) ( ON ?auto_12849 ?auto_12852 ) ( CLEAR ?auto_12849 ) ( not ( = ?auto_12849 ?auto_12852 ) ) ( not ( = ?auto_12850 ?auto_12852 ) ) ( not ( = ?auto_12848 ?auto_12852 ) ) ( not ( = ?auto_12857 ?auto_12852 ) ) ( TRUCK-AT ?auto_12853 ?auto_12855 ) ( ON ?auto_12847 ?auto_12846 ) ( ON ?auto_12848 ?auto_12847 ) ( not ( = ?auto_12846 ?auto_12847 ) ) ( not ( = ?auto_12846 ?auto_12848 ) ) ( not ( = ?auto_12846 ?auto_12849 ) ) ( not ( = ?auto_12846 ?auto_12850 ) ) ( not ( = ?auto_12846 ?auto_12857 ) ) ( not ( = ?auto_12846 ?auto_12852 ) ) ( not ( = ?auto_12847 ?auto_12848 ) ) ( not ( = ?auto_12847 ?auto_12849 ) ) ( not ( = ?auto_12847 ?auto_12850 ) ) ( not ( = ?auto_12847 ?auto_12857 ) ) ( not ( = ?auto_12847 ?auto_12852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12848 ?auto_12849 ?auto_12850 )
      ( MAKE-4CRATE-VERIFY ?auto_12846 ?auto_12847 ?auto_12848 ?auto_12849 ?auto_12850 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12858 - SURFACE
      ?auto_12859 - SURFACE
    )
    :vars
    (
      ?auto_12860 - HOIST
      ?auto_12864 - PLACE
      ?auto_12867 - SURFACE
      ?auto_12863 - PLACE
      ?auto_12865 - HOIST
      ?auto_12866 - SURFACE
      ?auto_12861 - SURFACE
      ?auto_12862 - TRUCK
      ?auto_12868 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12860 ?auto_12864 ) ( IS-CRATE ?auto_12859 ) ( not ( = ?auto_12858 ?auto_12859 ) ) ( not ( = ?auto_12867 ?auto_12858 ) ) ( not ( = ?auto_12867 ?auto_12859 ) ) ( not ( = ?auto_12863 ?auto_12864 ) ) ( HOIST-AT ?auto_12865 ?auto_12863 ) ( not ( = ?auto_12860 ?auto_12865 ) ) ( SURFACE-AT ?auto_12859 ?auto_12863 ) ( ON ?auto_12859 ?auto_12866 ) ( CLEAR ?auto_12859 ) ( not ( = ?auto_12858 ?auto_12866 ) ) ( not ( = ?auto_12859 ?auto_12866 ) ) ( not ( = ?auto_12867 ?auto_12866 ) ) ( IS-CRATE ?auto_12858 ) ( AVAILABLE ?auto_12865 ) ( SURFACE-AT ?auto_12858 ?auto_12863 ) ( ON ?auto_12858 ?auto_12861 ) ( CLEAR ?auto_12858 ) ( not ( = ?auto_12858 ?auto_12861 ) ) ( not ( = ?auto_12859 ?auto_12861 ) ) ( not ( = ?auto_12867 ?auto_12861 ) ) ( not ( = ?auto_12866 ?auto_12861 ) ) ( TRUCK-AT ?auto_12862 ?auto_12864 ) ( SURFACE-AT ?auto_12868 ?auto_12864 ) ( CLEAR ?auto_12868 ) ( LIFTING ?auto_12860 ?auto_12867 ) ( IS-CRATE ?auto_12867 ) ( not ( = ?auto_12868 ?auto_12867 ) ) ( not ( = ?auto_12858 ?auto_12868 ) ) ( not ( = ?auto_12859 ?auto_12868 ) ) ( not ( = ?auto_12866 ?auto_12868 ) ) ( not ( = ?auto_12861 ?auto_12868 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12868 ?auto_12867 )
      ( MAKE-2CRATE ?auto_12867 ?auto_12858 ?auto_12859 )
      ( MAKE-1CRATE-VERIFY ?auto_12858 ?auto_12859 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12869 - SURFACE
      ?auto_12870 - SURFACE
      ?auto_12871 - SURFACE
    )
    :vars
    (
      ?auto_12879 - HOIST
      ?auto_12873 - PLACE
      ?auto_12875 - PLACE
      ?auto_12878 - HOIST
      ?auto_12877 - SURFACE
      ?auto_12872 - SURFACE
      ?auto_12874 - TRUCK
      ?auto_12876 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12879 ?auto_12873 ) ( IS-CRATE ?auto_12871 ) ( not ( = ?auto_12870 ?auto_12871 ) ) ( not ( = ?auto_12869 ?auto_12870 ) ) ( not ( = ?auto_12869 ?auto_12871 ) ) ( not ( = ?auto_12875 ?auto_12873 ) ) ( HOIST-AT ?auto_12878 ?auto_12875 ) ( not ( = ?auto_12879 ?auto_12878 ) ) ( SURFACE-AT ?auto_12871 ?auto_12875 ) ( ON ?auto_12871 ?auto_12877 ) ( CLEAR ?auto_12871 ) ( not ( = ?auto_12870 ?auto_12877 ) ) ( not ( = ?auto_12871 ?auto_12877 ) ) ( not ( = ?auto_12869 ?auto_12877 ) ) ( IS-CRATE ?auto_12870 ) ( AVAILABLE ?auto_12878 ) ( SURFACE-AT ?auto_12870 ?auto_12875 ) ( ON ?auto_12870 ?auto_12872 ) ( CLEAR ?auto_12870 ) ( not ( = ?auto_12870 ?auto_12872 ) ) ( not ( = ?auto_12871 ?auto_12872 ) ) ( not ( = ?auto_12869 ?auto_12872 ) ) ( not ( = ?auto_12877 ?auto_12872 ) ) ( TRUCK-AT ?auto_12874 ?auto_12873 ) ( SURFACE-AT ?auto_12876 ?auto_12873 ) ( CLEAR ?auto_12876 ) ( LIFTING ?auto_12879 ?auto_12869 ) ( IS-CRATE ?auto_12869 ) ( not ( = ?auto_12876 ?auto_12869 ) ) ( not ( = ?auto_12870 ?auto_12876 ) ) ( not ( = ?auto_12871 ?auto_12876 ) ) ( not ( = ?auto_12877 ?auto_12876 ) ) ( not ( = ?auto_12872 ?auto_12876 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12870 ?auto_12871 )
      ( MAKE-2CRATE-VERIFY ?auto_12869 ?auto_12870 ?auto_12871 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12880 - SURFACE
      ?auto_12881 - SURFACE
      ?auto_12882 - SURFACE
      ?auto_12883 - SURFACE
    )
    :vars
    (
      ?auto_12884 - HOIST
      ?auto_12890 - PLACE
      ?auto_12885 - PLACE
      ?auto_12889 - HOIST
      ?auto_12888 - SURFACE
      ?auto_12886 - SURFACE
      ?auto_12887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12884 ?auto_12890 ) ( IS-CRATE ?auto_12883 ) ( not ( = ?auto_12882 ?auto_12883 ) ) ( not ( = ?auto_12881 ?auto_12882 ) ) ( not ( = ?auto_12881 ?auto_12883 ) ) ( not ( = ?auto_12885 ?auto_12890 ) ) ( HOIST-AT ?auto_12889 ?auto_12885 ) ( not ( = ?auto_12884 ?auto_12889 ) ) ( SURFACE-AT ?auto_12883 ?auto_12885 ) ( ON ?auto_12883 ?auto_12888 ) ( CLEAR ?auto_12883 ) ( not ( = ?auto_12882 ?auto_12888 ) ) ( not ( = ?auto_12883 ?auto_12888 ) ) ( not ( = ?auto_12881 ?auto_12888 ) ) ( IS-CRATE ?auto_12882 ) ( AVAILABLE ?auto_12889 ) ( SURFACE-AT ?auto_12882 ?auto_12885 ) ( ON ?auto_12882 ?auto_12886 ) ( CLEAR ?auto_12882 ) ( not ( = ?auto_12882 ?auto_12886 ) ) ( not ( = ?auto_12883 ?auto_12886 ) ) ( not ( = ?auto_12881 ?auto_12886 ) ) ( not ( = ?auto_12888 ?auto_12886 ) ) ( TRUCK-AT ?auto_12887 ?auto_12890 ) ( SURFACE-AT ?auto_12880 ?auto_12890 ) ( CLEAR ?auto_12880 ) ( LIFTING ?auto_12884 ?auto_12881 ) ( IS-CRATE ?auto_12881 ) ( not ( = ?auto_12880 ?auto_12881 ) ) ( not ( = ?auto_12882 ?auto_12880 ) ) ( not ( = ?auto_12883 ?auto_12880 ) ) ( not ( = ?auto_12888 ?auto_12880 ) ) ( not ( = ?auto_12886 ?auto_12880 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12881 ?auto_12882 ?auto_12883 )
      ( MAKE-3CRATE-VERIFY ?auto_12880 ?auto_12881 ?auto_12882 ?auto_12883 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12891 - SURFACE
      ?auto_12892 - SURFACE
      ?auto_12893 - SURFACE
      ?auto_12894 - SURFACE
      ?auto_12895 - SURFACE
    )
    :vars
    (
      ?auto_12896 - HOIST
      ?auto_12902 - PLACE
      ?auto_12897 - PLACE
      ?auto_12901 - HOIST
      ?auto_12900 - SURFACE
      ?auto_12898 - SURFACE
      ?auto_12899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12896 ?auto_12902 ) ( IS-CRATE ?auto_12895 ) ( not ( = ?auto_12894 ?auto_12895 ) ) ( not ( = ?auto_12893 ?auto_12894 ) ) ( not ( = ?auto_12893 ?auto_12895 ) ) ( not ( = ?auto_12897 ?auto_12902 ) ) ( HOIST-AT ?auto_12901 ?auto_12897 ) ( not ( = ?auto_12896 ?auto_12901 ) ) ( SURFACE-AT ?auto_12895 ?auto_12897 ) ( ON ?auto_12895 ?auto_12900 ) ( CLEAR ?auto_12895 ) ( not ( = ?auto_12894 ?auto_12900 ) ) ( not ( = ?auto_12895 ?auto_12900 ) ) ( not ( = ?auto_12893 ?auto_12900 ) ) ( IS-CRATE ?auto_12894 ) ( AVAILABLE ?auto_12901 ) ( SURFACE-AT ?auto_12894 ?auto_12897 ) ( ON ?auto_12894 ?auto_12898 ) ( CLEAR ?auto_12894 ) ( not ( = ?auto_12894 ?auto_12898 ) ) ( not ( = ?auto_12895 ?auto_12898 ) ) ( not ( = ?auto_12893 ?auto_12898 ) ) ( not ( = ?auto_12900 ?auto_12898 ) ) ( TRUCK-AT ?auto_12899 ?auto_12902 ) ( SURFACE-AT ?auto_12892 ?auto_12902 ) ( CLEAR ?auto_12892 ) ( LIFTING ?auto_12896 ?auto_12893 ) ( IS-CRATE ?auto_12893 ) ( not ( = ?auto_12892 ?auto_12893 ) ) ( not ( = ?auto_12894 ?auto_12892 ) ) ( not ( = ?auto_12895 ?auto_12892 ) ) ( not ( = ?auto_12900 ?auto_12892 ) ) ( not ( = ?auto_12898 ?auto_12892 ) ) ( ON ?auto_12892 ?auto_12891 ) ( not ( = ?auto_12891 ?auto_12892 ) ) ( not ( = ?auto_12891 ?auto_12893 ) ) ( not ( = ?auto_12891 ?auto_12894 ) ) ( not ( = ?auto_12891 ?auto_12895 ) ) ( not ( = ?auto_12891 ?auto_12900 ) ) ( not ( = ?auto_12891 ?auto_12898 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12893 ?auto_12894 ?auto_12895 )
      ( MAKE-4CRATE-VERIFY ?auto_12891 ?auto_12892 ?auto_12893 ?auto_12894 ?auto_12895 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12903 - SURFACE
      ?auto_12904 - SURFACE
    )
    :vars
    (
      ?auto_12905 - HOIST
      ?auto_12912 - PLACE
      ?auto_12907 - SURFACE
      ?auto_12906 - PLACE
      ?auto_12911 - HOIST
      ?auto_12910 - SURFACE
      ?auto_12908 - SURFACE
      ?auto_12909 - TRUCK
      ?auto_12913 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12905 ?auto_12912 ) ( IS-CRATE ?auto_12904 ) ( not ( = ?auto_12903 ?auto_12904 ) ) ( not ( = ?auto_12907 ?auto_12903 ) ) ( not ( = ?auto_12907 ?auto_12904 ) ) ( not ( = ?auto_12906 ?auto_12912 ) ) ( HOIST-AT ?auto_12911 ?auto_12906 ) ( not ( = ?auto_12905 ?auto_12911 ) ) ( SURFACE-AT ?auto_12904 ?auto_12906 ) ( ON ?auto_12904 ?auto_12910 ) ( CLEAR ?auto_12904 ) ( not ( = ?auto_12903 ?auto_12910 ) ) ( not ( = ?auto_12904 ?auto_12910 ) ) ( not ( = ?auto_12907 ?auto_12910 ) ) ( IS-CRATE ?auto_12903 ) ( AVAILABLE ?auto_12911 ) ( SURFACE-AT ?auto_12903 ?auto_12906 ) ( ON ?auto_12903 ?auto_12908 ) ( CLEAR ?auto_12903 ) ( not ( = ?auto_12903 ?auto_12908 ) ) ( not ( = ?auto_12904 ?auto_12908 ) ) ( not ( = ?auto_12907 ?auto_12908 ) ) ( not ( = ?auto_12910 ?auto_12908 ) ) ( TRUCK-AT ?auto_12909 ?auto_12912 ) ( SURFACE-AT ?auto_12913 ?auto_12912 ) ( CLEAR ?auto_12913 ) ( IS-CRATE ?auto_12907 ) ( not ( = ?auto_12913 ?auto_12907 ) ) ( not ( = ?auto_12903 ?auto_12913 ) ) ( not ( = ?auto_12904 ?auto_12913 ) ) ( not ( = ?auto_12910 ?auto_12913 ) ) ( not ( = ?auto_12908 ?auto_12913 ) ) ( AVAILABLE ?auto_12905 ) ( IN ?auto_12907 ?auto_12909 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12905 ?auto_12907 ?auto_12909 ?auto_12912 )
      ( MAKE-2CRATE ?auto_12907 ?auto_12903 ?auto_12904 )
      ( MAKE-1CRATE-VERIFY ?auto_12903 ?auto_12904 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12914 - SURFACE
      ?auto_12915 - SURFACE
      ?auto_12916 - SURFACE
    )
    :vars
    (
      ?auto_12918 - HOIST
      ?auto_12921 - PLACE
      ?auto_12919 - PLACE
      ?auto_12922 - HOIST
      ?auto_12924 - SURFACE
      ?auto_12923 - SURFACE
      ?auto_12917 - TRUCK
      ?auto_12920 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12918 ?auto_12921 ) ( IS-CRATE ?auto_12916 ) ( not ( = ?auto_12915 ?auto_12916 ) ) ( not ( = ?auto_12914 ?auto_12915 ) ) ( not ( = ?auto_12914 ?auto_12916 ) ) ( not ( = ?auto_12919 ?auto_12921 ) ) ( HOIST-AT ?auto_12922 ?auto_12919 ) ( not ( = ?auto_12918 ?auto_12922 ) ) ( SURFACE-AT ?auto_12916 ?auto_12919 ) ( ON ?auto_12916 ?auto_12924 ) ( CLEAR ?auto_12916 ) ( not ( = ?auto_12915 ?auto_12924 ) ) ( not ( = ?auto_12916 ?auto_12924 ) ) ( not ( = ?auto_12914 ?auto_12924 ) ) ( IS-CRATE ?auto_12915 ) ( AVAILABLE ?auto_12922 ) ( SURFACE-AT ?auto_12915 ?auto_12919 ) ( ON ?auto_12915 ?auto_12923 ) ( CLEAR ?auto_12915 ) ( not ( = ?auto_12915 ?auto_12923 ) ) ( not ( = ?auto_12916 ?auto_12923 ) ) ( not ( = ?auto_12914 ?auto_12923 ) ) ( not ( = ?auto_12924 ?auto_12923 ) ) ( TRUCK-AT ?auto_12917 ?auto_12921 ) ( SURFACE-AT ?auto_12920 ?auto_12921 ) ( CLEAR ?auto_12920 ) ( IS-CRATE ?auto_12914 ) ( not ( = ?auto_12920 ?auto_12914 ) ) ( not ( = ?auto_12915 ?auto_12920 ) ) ( not ( = ?auto_12916 ?auto_12920 ) ) ( not ( = ?auto_12924 ?auto_12920 ) ) ( not ( = ?auto_12923 ?auto_12920 ) ) ( AVAILABLE ?auto_12918 ) ( IN ?auto_12914 ?auto_12917 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12915 ?auto_12916 )
      ( MAKE-2CRATE-VERIFY ?auto_12914 ?auto_12915 ?auto_12916 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12925 - SURFACE
      ?auto_12926 - SURFACE
      ?auto_12927 - SURFACE
      ?auto_12928 - SURFACE
    )
    :vars
    (
      ?auto_12935 - HOIST
      ?auto_12931 - PLACE
      ?auto_12934 - PLACE
      ?auto_12933 - HOIST
      ?auto_12930 - SURFACE
      ?auto_12929 - SURFACE
      ?auto_12932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12935 ?auto_12931 ) ( IS-CRATE ?auto_12928 ) ( not ( = ?auto_12927 ?auto_12928 ) ) ( not ( = ?auto_12926 ?auto_12927 ) ) ( not ( = ?auto_12926 ?auto_12928 ) ) ( not ( = ?auto_12934 ?auto_12931 ) ) ( HOIST-AT ?auto_12933 ?auto_12934 ) ( not ( = ?auto_12935 ?auto_12933 ) ) ( SURFACE-AT ?auto_12928 ?auto_12934 ) ( ON ?auto_12928 ?auto_12930 ) ( CLEAR ?auto_12928 ) ( not ( = ?auto_12927 ?auto_12930 ) ) ( not ( = ?auto_12928 ?auto_12930 ) ) ( not ( = ?auto_12926 ?auto_12930 ) ) ( IS-CRATE ?auto_12927 ) ( AVAILABLE ?auto_12933 ) ( SURFACE-AT ?auto_12927 ?auto_12934 ) ( ON ?auto_12927 ?auto_12929 ) ( CLEAR ?auto_12927 ) ( not ( = ?auto_12927 ?auto_12929 ) ) ( not ( = ?auto_12928 ?auto_12929 ) ) ( not ( = ?auto_12926 ?auto_12929 ) ) ( not ( = ?auto_12930 ?auto_12929 ) ) ( TRUCK-AT ?auto_12932 ?auto_12931 ) ( SURFACE-AT ?auto_12925 ?auto_12931 ) ( CLEAR ?auto_12925 ) ( IS-CRATE ?auto_12926 ) ( not ( = ?auto_12925 ?auto_12926 ) ) ( not ( = ?auto_12927 ?auto_12925 ) ) ( not ( = ?auto_12928 ?auto_12925 ) ) ( not ( = ?auto_12930 ?auto_12925 ) ) ( not ( = ?auto_12929 ?auto_12925 ) ) ( AVAILABLE ?auto_12935 ) ( IN ?auto_12926 ?auto_12932 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12926 ?auto_12927 ?auto_12928 )
      ( MAKE-3CRATE-VERIFY ?auto_12925 ?auto_12926 ?auto_12927 ?auto_12928 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12936 - SURFACE
      ?auto_12937 - SURFACE
      ?auto_12938 - SURFACE
      ?auto_12939 - SURFACE
      ?auto_12940 - SURFACE
    )
    :vars
    (
      ?auto_12947 - HOIST
      ?auto_12943 - PLACE
      ?auto_12946 - PLACE
      ?auto_12945 - HOIST
      ?auto_12942 - SURFACE
      ?auto_12941 - SURFACE
      ?auto_12944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12947 ?auto_12943 ) ( IS-CRATE ?auto_12940 ) ( not ( = ?auto_12939 ?auto_12940 ) ) ( not ( = ?auto_12938 ?auto_12939 ) ) ( not ( = ?auto_12938 ?auto_12940 ) ) ( not ( = ?auto_12946 ?auto_12943 ) ) ( HOIST-AT ?auto_12945 ?auto_12946 ) ( not ( = ?auto_12947 ?auto_12945 ) ) ( SURFACE-AT ?auto_12940 ?auto_12946 ) ( ON ?auto_12940 ?auto_12942 ) ( CLEAR ?auto_12940 ) ( not ( = ?auto_12939 ?auto_12942 ) ) ( not ( = ?auto_12940 ?auto_12942 ) ) ( not ( = ?auto_12938 ?auto_12942 ) ) ( IS-CRATE ?auto_12939 ) ( AVAILABLE ?auto_12945 ) ( SURFACE-AT ?auto_12939 ?auto_12946 ) ( ON ?auto_12939 ?auto_12941 ) ( CLEAR ?auto_12939 ) ( not ( = ?auto_12939 ?auto_12941 ) ) ( not ( = ?auto_12940 ?auto_12941 ) ) ( not ( = ?auto_12938 ?auto_12941 ) ) ( not ( = ?auto_12942 ?auto_12941 ) ) ( TRUCK-AT ?auto_12944 ?auto_12943 ) ( SURFACE-AT ?auto_12937 ?auto_12943 ) ( CLEAR ?auto_12937 ) ( IS-CRATE ?auto_12938 ) ( not ( = ?auto_12937 ?auto_12938 ) ) ( not ( = ?auto_12939 ?auto_12937 ) ) ( not ( = ?auto_12940 ?auto_12937 ) ) ( not ( = ?auto_12942 ?auto_12937 ) ) ( not ( = ?auto_12941 ?auto_12937 ) ) ( AVAILABLE ?auto_12947 ) ( IN ?auto_12938 ?auto_12944 ) ( ON ?auto_12937 ?auto_12936 ) ( not ( = ?auto_12936 ?auto_12937 ) ) ( not ( = ?auto_12936 ?auto_12938 ) ) ( not ( = ?auto_12936 ?auto_12939 ) ) ( not ( = ?auto_12936 ?auto_12940 ) ) ( not ( = ?auto_12936 ?auto_12942 ) ) ( not ( = ?auto_12936 ?auto_12941 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12938 ?auto_12939 ?auto_12940 )
      ( MAKE-4CRATE-VERIFY ?auto_12936 ?auto_12937 ?auto_12938 ?auto_12939 ?auto_12940 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12948 - SURFACE
      ?auto_12949 - SURFACE
    )
    :vars
    (
      ?auto_12957 - HOIST
      ?auto_12953 - PLACE
      ?auto_12951 - SURFACE
      ?auto_12956 - PLACE
      ?auto_12955 - HOIST
      ?auto_12952 - SURFACE
      ?auto_12950 - SURFACE
      ?auto_12958 - SURFACE
      ?auto_12954 - TRUCK
      ?auto_12959 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12957 ?auto_12953 ) ( IS-CRATE ?auto_12949 ) ( not ( = ?auto_12948 ?auto_12949 ) ) ( not ( = ?auto_12951 ?auto_12948 ) ) ( not ( = ?auto_12951 ?auto_12949 ) ) ( not ( = ?auto_12956 ?auto_12953 ) ) ( HOIST-AT ?auto_12955 ?auto_12956 ) ( not ( = ?auto_12957 ?auto_12955 ) ) ( SURFACE-AT ?auto_12949 ?auto_12956 ) ( ON ?auto_12949 ?auto_12952 ) ( CLEAR ?auto_12949 ) ( not ( = ?auto_12948 ?auto_12952 ) ) ( not ( = ?auto_12949 ?auto_12952 ) ) ( not ( = ?auto_12951 ?auto_12952 ) ) ( IS-CRATE ?auto_12948 ) ( AVAILABLE ?auto_12955 ) ( SURFACE-AT ?auto_12948 ?auto_12956 ) ( ON ?auto_12948 ?auto_12950 ) ( CLEAR ?auto_12948 ) ( not ( = ?auto_12948 ?auto_12950 ) ) ( not ( = ?auto_12949 ?auto_12950 ) ) ( not ( = ?auto_12951 ?auto_12950 ) ) ( not ( = ?auto_12952 ?auto_12950 ) ) ( SURFACE-AT ?auto_12958 ?auto_12953 ) ( CLEAR ?auto_12958 ) ( IS-CRATE ?auto_12951 ) ( not ( = ?auto_12958 ?auto_12951 ) ) ( not ( = ?auto_12948 ?auto_12958 ) ) ( not ( = ?auto_12949 ?auto_12958 ) ) ( not ( = ?auto_12952 ?auto_12958 ) ) ( not ( = ?auto_12950 ?auto_12958 ) ) ( AVAILABLE ?auto_12957 ) ( IN ?auto_12951 ?auto_12954 ) ( TRUCK-AT ?auto_12954 ?auto_12959 ) ( not ( = ?auto_12959 ?auto_12953 ) ) ( not ( = ?auto_12956 ?auto_12959 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12954 ?auto_12959 ?auto_12953 )
      ( MAKE-2CRATE ?auto_12951 ?auto_12948 ?auto_12949 )
      ( MAKE-1CRATE-VERIFY ?auto_12948 ?auto_12949 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12960 - SURFACE
      ?auto_12961 - SURFACE
      ?auto_12962 - SURFACE
    )
    :vars
    (
      ?auto_12964 - HOIST
      ?auto_12963 - PLACE
      ?auto_12967 - PLACE
      ?auto_12966 - HOIST
      ?auto_12971 - SURFACE
      ?auto_12969 - SURFACE
      ?auto_12965 - SURFACE
      ?auto_12970 - TRUCK
      ?auto_12968 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12964 ?auto_12963 ) ( IS-CRATE ?auto_12962 ) ( not ( = ?auto_12961 ?auto_12962 ) ) ( not ( = ?auto_12960 ?auto_12961 ) ) ( not ( = ?auto_12960 ?auto_12962 ) ) ( not ( = ?auto_12967 ?auto_12963 ) ) ( HOIST-AT ?auto_12966 ?auto_12967 ) ( not ( = ?auto_12964 ?auto_12966 ) ) ( SURFACE-AT ?auto_12962 ?auto_12967 ) ( ON ?auto_12962 ?auto_12971 ) ( CLEAR ?auto_12962 ) ( not ( = ?auto_12961 ?auto_12971 ) ) ( not ( = ?auto_12962 ?auto_12971 ) ) ( not ( = ?auto_12960 ?auto_12971 ) ) ( IS-CRATE ?auto_12961 ) ( AVAILABLE ?auto_12966 ) ( SURFACE-AT ?auto_12961 ?auto_12967 ) ( ON ?auto_12961 ?auto_12969 ) ( CLEAR ?auto_12961 ) ( not ( = ?auto_12961 ?auto_12969 ) ) ( not ( = ?auto_12962 ?auto_12969 ) ) ( not ( = ?auto_12960 ?auto_12969 ) ) ( not ( = ?auto_12971 ?auto_12969 ) ) ( SURFACE-AT ?auto_12965 ?auto_12963 ) ( CLEAR ?auto_12965 ) ( IS-CRATE ?auto_12960 ) ( not ( = ?auto_12965 ?auto_12960 ) ) ( not ( = ?auto_12961 ?auto_12965 ) ) ( not ( = ?auto_12962 ?auto_12965 ) ) ( not ( = ?auto_12971 ?auto_12965 ) ) ( not ( = ?auto_12969 ?auto_12965 ) ) ( AVAILABLE ?auto_12964 ) ( IN ?auto_12960 ?auto_12970 ) ( TRUCK-AT ?auto_12970 ?auto_12968 ) ( not ( = ?auto_12968 ?auto_12963 ) ) ( not ( = ?auto_12967 ?auto_12968 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12961 ?auto_12962 )
      ( MAKE-2CRATE-VERIFY ?auto_12960 ?auto_12961 ?auto_12962 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12972 - SURFACE
      ?auto_12973 - SURFACE
      ?auto_12974 - SURFACE
      ?auto_12975 - SURFACE
    )
    :vars
    (
      ?auto_12980 - HOIST
      ?auto_12978 - PLACE
      ?auto_12981 - PLACE
      ?auto_12982 - HOIST
      ?auto_12977 - SURFACE
      ?auto_12979 - SURFACE
      ?auto_12976 - TRUCK
      ?auto_12983 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12980 ?auto_12978 ) ( IS-CRATE ?auto_12975 ) ( not ( = ?auto_12974 ?auto_12975 ) ) ( not ( = ?auto_12973 ?auto_12974 ) ) ( not ( = ?auto_12973 ?auto_12975 ) ) ( not ( = ?auto_12981 ?auto_12978 ) ) ( HOIST-AT ?auto_12982 ?auto_12981 ) ( not ( = ?auto_12980 ?auto_12982 ) ) ( SURFACE-AT ?auto_12975 ?auto_12981 ) ( ON ?auto_12975 ?auto_12977 ) ( CLEAR ?auto_12975 ) ( not ( = ?auto_12974 ?auto_12977 ) ) ( not ( = ?auto_12975 ?auto_12977 ) ) ( not ( = ?auto_12973 ?auto_12977 ) ) ( IS-CRATE ?auto_12974 ) ( AVAILABLE ?auto_12982 ) ( SURFACE-AT ?auto_12974 ?auto_12981 ) ( ON ?auto_12974 ?auto_12979 ) ( CLEAR ?auto_12974 ) ( not ( = ?auto_12974 ?auto_12979 ) ) ( not ( = ?auto_12975 ?auto_12979 ) ) ( not ( = ?auto_12973 ?auto_12979 ) ) ( not ( = ?auto_12977 ?auto_12979 ) ) ( SURFACE-AT ?auto_12972 ?auto_12978 ) ( CLEAR ?auto_12972 ) ( IS-CRATE ?auto_12973 ) ( not ( = ?auto_12972 ?auto_12973 ) ) ( not ( = ?auto_12974 ?auto_12972 ) ) ( not ( = ?auto_12975 ?auto_12972 ) ) ( not ( = ?auto_12977 ?auto_12972 ) ) ( not ( = ?auto_12979 ?auto_12972 ) ) ( AVAILABLE ?auto_12980 ) ( IN ?auto_12973 ?auto_12976 ) ( TRUCK-AT ?auto_12976 ?auto_12983 ) ( not ( = ?auto_12983 ?auto_12978 ) ) ( not ( = ?auto_12981 ?auto_12983 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12973 ?auto_12974 ?auto_12975 )
      ( MAKE-3CRATE-VERIFY ?auto_12972 ?auto_12973 ?auto_12974 ?auto_12975 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12984 - SURFACE
      ?auto_12985 - SURFACE
      ?auto_12986 - SURFACE
      ?auto_12987 - SURFACE
      ?auto_12988 - SURFACE
    )
    :vars
    (
      ?auto_12993 - HOIST
      ?auto_12991 - PLACE
      ?auto_12994 - PLACE
      ?auto_12995 - HOIST
      ?auto_12990 - SURFACE
      ?auto_12992 - SURFACE
      ?auto_12989 - TRUCK
      ?auto_12996 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12993 ?auto_12991 ) ( IS-CRATE ?auto_12988 ) ( not ( = ?auto_12987 ?auto_12988 ) ) ( not ( = ?auto_12986 ?auto_12987 ) ) ( not ( = ?auto_12986 ?auto_12988 ) ) ( not ( = ?auto_12994 ?auto_12991 ) ) ( HOIST-AT ?auto_12995 ?auto_12994 ) ( not ( = ?auto_12993 ?auto_12995 ) ) ( SURFACE-AT ?auto_12988 ?auto_12994 ) ( ON ?auto_12988 ?auto_12990 ) ( CLEAR ?auto_12988 ) ( not ( = ?auto_12987 ?auto_12990 ) ) ( not ( = ?auto_12988 ?auto_12990 ) ) ( not ( = ?auto_12986 ?auto_12990 ) ) ( IS-CRATE ?auto_12987 ) ( AVAILABLE ?auto_12995 ) ( SURFACE-AT ?auto_12987 ?auto_12994 ) ( ON ?auto_12987 ?auto_12992 ) ( CLEAR ?auto_12987 ) ( not ( = ?auto_12987 ?auto_12992 ) ) ( not ( = ?auto_12988 ?auto_12992 ) ) ( not ( = ?auto_12986 ?auto_12992 ) ) ( not ( = ?auto_12990 ?auto_12992 ) ) ( SURFACE-AT ?auto_12985 ?auto_12991 ) ( CLEAR ?auto_12985 ) ( IS-CRATE ?auto_12986 ) ( not ( = ?auto_12985 ?auto_12986 ) ) ( not ( = ?auto_12987 ?auto_12985 ) ) ( not ( = ?auto_12988 ?auto_12985 ) ) ( not ( = ?auto_12990 ?auto_12985 ) ) ( not ( = ?auto_12992 ?auto_12985 ) ) ( AVAILABLE ?auto_12993 ) ( IN ?auto_12986 ?auto_12989 ) ( TRUCK-AT ?auto_12989 ?auto_12996 ) ( not ( = ?auto_12996 ?auto_12991 ) ) ( not ( = ?auto_12994 ?auto_12996 ) ) ( ON ?auto_12985 ?auto_12984 ) ( not ( = ?auto_12984 ?auto_12985 ) ) ( not ( = ?auto_12984 ?auto_12986 ) ) ( not ( = ?auto_12984 ?auto_12987 ) ) ( not ( = ?auto_12984 ?auto_12988 ) ) ( not ( = ?auto_12984 ?auto_12990 ) ) ( not ( = ?auto_12984 ?auto_12992 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12986 ?auto_12987 ?auto_12988 )
      ( MAKE-4CRATE-VERIFY ?auto_12984 ?auto_12985 ?auto_12986 ?auto_12987 ?auto_12988 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12997 - SURFACE
      ?auto_12998 - SURFACE
    )
    :vars
    (
      ?auto_13005 - HOIST
      ?auto_13001 - PLACE
      ?auto_13003 - SURFACE
      ?auto_13006 - PLACE
      ?auto_13007 - HOIST
      ?auto_13000 - SURFACE
      ?auto_13004 - SURFACE
      ?auto_13002 - SURFACE
      ?auto_12999 - TRUCK
      ?auto_13008 - PLACE
      ?auto_13009 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13005 ?auto_13001 ) ( IS-CRATE ?auto_12998 ) ( not ( = ?auto_12997 ?auto_12998 ) ) ( not ( = ?auto_13003 ?auto_12997 ) ) ( not ( = ?auto_13003 ?auto_12998 ) ) ( not ( = ?auto_13006 ?auto_13001 ) ) ( HOIST-AT ?auto_13007 ?auto_13006 ) ( not ( = ?auto_13005 ?auto_13007 ) ) ( SURFACE-AT ?auto_12998 ?auto_13006 ) ( ON ?auto_12998 ?auto_13000 ) ( CLEAR ?auto_12998 ) ( not ( = ?auto_12997 ?auto_13000 ) ) ( not ( = ?auto_12998 ?auto_13000 ) ) ( not ( = ?auto_13003 ?auto_13000 ) ) ( IS-CRATE ?auto_12997 ) ( AVAILABLE ?auto_13007 ) ( SURFACE-AT ?auto_12997 ?auto_13006 ) ( ON ?auto_12997 ?auto_13004 ) ( CLEAR ?auto_12997 ) ( not ( = ?auto_12997 ?auto_13004 ) ) ( not ( = ?auto_12998 ?auto_13004 ) ) ( not ( = ?auto_13003 ?auto_13004 ) ) ( not ( = ?auto_13000 ?auto_13004 ) ) ( SURFACE-AT ?auto_13002 ?auto_13001 ) ( CLEAR ?auto_13002 ) ( IS-CRATE ?auto_13003 ) ( not ( = ?auto_13002 ?auto_13003 ) ) ( not ( = ?auto_12997 ?auto_13002 ) ) ( not ( = ?auto_12998 ?auto_13002 ) ) ( not ( = ?auto_13000 ?auto_13002 ) ) ( not ( = ?auto_13004 ?auto_13002 ) ) ( AVAILABLE ?auto_13005 ) ( TRUCK-AT ?auto_12999 ?auto_13008 ) ( not ( = ?auto_13008 ?auto_13001 ) ) ( not ( = ?auto_13006 ?auto_13008 ) ) ( HOIST-AT ?auto_13009 ?auto_13008 ) ( LIFTING ?auto_13009 ?auto_13003 ) ( not ( = ?auto_13005 ?auto_13009 ) ) ( not ( = ?auto_13007 ?auto_13009 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13009 ?auto_13003 ?auto_12999 ?auto_13008 )
      ( MAKE-2CRATE ?auto_13003 ?auto_12997 ?auto_12998 )
      ( MAKE-1CRATE-VERIFY ?auto_12997 ?auto_12998 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13010 - SURFACE
      ?auto_13011 - SURFACE
      ?auto_13012 - SURFACE
    )
    :vars
    (
      ?auto_13022 - HOIST
      ?auto_13019 - PLACE
      ?auto_13013 - PLACE
      ?auto_13016 - HOIST
      ?auto_13018 - SURFACE
      ?auto_13020 - SURFACE
      ?auto_13021 - SURFACE
      ?auto_13015 - TRUCK
      ?auto_13014 - PLACE
      ?auto_13017 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13022 ?auto_13019 ) ( IS-CRATE ?auto_13012 ) ( not ( = ?auto_13011 ?auto_13012 ) ) ( not ( = ?auto_13010 ?auto_13011 ) ) ( not ( = ?auto_13010 ?auto_13012 ) ) ( not ( = ?auto_13013 ?auto_13019 ) ) ( HOIST-AT ?auto_13016 ?auto_13013 ) ( not ( = ?auto_13022 ?auto_13016 ) ) ( SURFACE-AT ?auto_13012 ?auto_13013 ) ( ON ?auto_13012 ?auto_13018 ) ( CLEAR ?auto_13012 ) ( not ( = ?auto_13011 ?auto_13018 ) ) ( not ( = ?auto_13012 ?auto_13018 ) ) ( not ( = ?auto_13010 ?auto_13018 ) ) ( IS-CRATE ?auto_13011 ) ( AVAILABLE ?auto_13016 ) ( SURFACE-AT ?auto_13011 ?auto_13013 ) ( ON ?auto_13011 ?auto_13020 ) ( CLEAR ?auto_13011 ) ( not ( = ?auto_13011 ?auto_13020 ) ) ( not ( = ?auto_13012 ?auto_13020 ) ) ( not ( = ?auto_13010 ?auto_13020 ) ) ( not ( = ?auto_13018 ?auto_13020 ) ) ( SURFACE-AT ?auto_13021 ?auto_13019 ) ( CLEAR ?auto_13021 ) ( IS-CRATE ?auto_13010 ) ( not ( = ?auto_13021 ?auto_13010 ) ) ( not ( = ?auto_13011 ?auto_13021 ) ) ( not ( = ?auto_13012 ?auto_13021 ) ) ( not ( = ?auto_13018 ?auto_13021 ) ) ( not ( = ?auto_13020 ?auto_13021 ) ) ( AVAILABLE ?auto_13022 ) ( TRUCK-AT ?auto_13015 ?auto_13014 ) ( not ( = ?auto_13014 ?auto_13019 ) ) ( not ( = ?auto_13013 ?auto_13014 ) ) ( HOIST-AT ?auto_13017 ?auto_13014 ) ( LIFTING ?auto_13017 ?auto_13010 ) ( not ( = ?auto_13022 ?auto_13017 ) ) ( not ( = ?auto_13016 ?auto_13017 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13011 ?auto_13012 )
      ( MAKE-2CRATE-VERIFY ?auto_13010 ?auto_13011 ?auto_13012 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13023 - SURFACE
      ?auto_13024 - SURFACE
      ?auto_13025 - SURFACE
      ?auto_13026 - SURFACE
    )
    :vars
    (
      ?auto_13035 - HOIST
      ?auto_13027 - PLACE
      ?auto_13030 - PLACE
      ?auto_13033 - HOIST
      ?auto_13028 - SURFACE
      ?auto_13032 - SURFACE
      ?auto_13034 - TRUCK
      ?auto_13029 - PLACE
      ?auto_13031 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13035 ?auto_13027 ) ( IS-CRATE ?auto_13026 ) ( not ( = ?auto_13025 ?auto_13026 ) ) ( not ( = ?auto_13024 ?auto_13025 ) ) ( not ( = ?auto_13024 ?auto_13026 ) ) ( not ( = ?auto_13030 ?auto_13027 ) ) ( HOIST-AT ?auto_13033 ?auto_13030 ) ( not ( = ?auto_13035 ?auto_13033 ) ) ( SURFACE-AT ?auto_13026 ?auto_13030 ) ( ON ?auto_13026 ?auto_13028 ) ( CLEAR ?auto_13026 ) ( not ( = ?auto_13025 ?auto_13028 ) ) ( not ( = ?auto_13026 ?auto_13028 ) ) ( not ( = ?auto_13024 ?auto_13028 ) ) ( IS-CRATE ?auto_13025 ) ( AVAILABLE ?auto_13033 ) ( SURFACE-AT ?auto_13025 ?auto_13030 ) ( ON ?auto_13025 ?auto_13032 ) ( CLEAR ?auto_13025 ) ( not ( = ?auto_13025 ?auto_13032 ) ) ( not ( = ?auto_13026 ?auto_13032 ) ) ( not ( = ?auto_13024 ?auto_13032 ) ) ( not ( = ?auto_13028 ?auto_13032 ) ) ( SURFACE-AT ?auto_13023 ?auto_13027 ) ( CLEAR ?auto_13023 ) ( IS-CRATE ?auto_13024 ) ( not ( = ?auto_13023 ?auto_13024 ) ) ( not ( = ?auto_13025 ?auto_13023 ) ) ( not ( = ?auto_13026 ?auto_13023 ) ) ( not ( = ?auto_13028 ?auto_13023 ) ) ( not ( = ?auto_13032 ?auto_13023 ) ) ( AVAILABLE ?auto_13035 ) ( TRUCK-AT ?auto_13034 ?auto_13029 ) ( not ( = ?auto_13029 ?auto_13027 ) ) ( not ( = ?auto_13030 ?auto_13029 ) ) ( HOIST-AT ?auto_13031 ?auto_13029 ) ( LIFTING ?auto_13031 ?auto_13024 ) ( not ( = ?auto_13035 ?auto_13031 ) ) ( not ( = ?auto_13033 ?auto_13031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13024 ?auto_13025 ?auto_13026 )
      ( MAKE-3CRATE-VERIFY ?auto_13023 ?auto_13024 ?auto_13025 ?auto_13026 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13036 - SURFACE
      ?auto_13037 - SURFACE
      ?auto_13038 - SURFACE
      ?auto_13039 - SURFACE
      ?auto_13040 - SURFACE
    )
    :vars
    (
      ?auto_13049 - HOIST
      ?auto_13041 - PLACE
      ?auto_13044 - PLACE
      ?auto_13047 - HOIST
      ?auto_13042 - SURFACE
      ?auto_13046 - SURFACE
      ?auto_13048 - TRUCK
      ?auto_13043 - PLACE
      ?auto_13045 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13049 ?auto_13041 ) ( IS-CRATE ?auto_13040 ) ( not ( = ?auto_13039 ?auto_13040 ) ) ( not ( = ?auto_13038 ?auto_13039 ) ) ( not ( = ?auto_13038 ?auto_13040 ) ) ( not ( = ?auto_13044 ?auto_13041 ) ) ( HOIST-AT ?auto_13047 ?auto_13044 ) ( not ( = ?auto_13049 ?auto_13047 ) ) ( SURFACE-AT ?auto_13040 ?auto_13044 ) ( ON ?auto_13040 ?auto_13042 ) ( CLEAR ?auto_13040 ) ( not ( = ?auto_13039 ?auto_13042 ) ) ( not ( = ?auto_13040 ?auto_13042 ) ) ( not ( = ?auto_13038 ?auto_13042 ) ) ( IS-CRATE ?auto_13039 ) ( AVAILABLE ?auto_13047 ) ( SURFACE-AT ?auto_13039 ?auto_13044 ) ( ON ?auto_13039 ?auto_13046 ) ( CLEAR ?auto_13039 ) ( not ( = ?auto_13039 ?auto_13046 ) ) ( not ( = ?auto_13040 ?auto_13046 ) ) ( not ( = ?auto_13038 ?auto_13046 ) ) ( not ( = ?auto_13042 ?auto_13046 ) ) ( SURFACE-AT ?auto_13037 ?auto_13041 ) ( CLEAR ?auto_13037 ) ( IS-CRATE ?auto_13038 ) ( not ( = ?auto_13037 ?auto_13038 ) ) ( not ( = ?auto_13039 ?auto_13037 ) ) ( not ( = ?auto_13040 ?auto_13037 ) ) ( not ( = ?auto_13042 ?auto_13037 ) ) ( not ( = ?auto_13046 ?auto_13037 ) ) ( AVAILABLE ?auto_13049 ) ( TRUCK-AT ?auto_13048 ?auto_13043 ) ( not ( = ?auto_13043 ?auto_13041 ) ) ( not ( = ?auto_13044 ?auto_13043 ) ) ( HOIST-AT ?auto_13045 ?auto_13043 ) ( LIFTING ?auto_13045 ?auto_13038 ) ( not ( = ?auto_13049 ?auto_13045 ) ) ( not ( = ?auto_13047 ?auto_13045 ) ) ( ON ?auto_13037 ?auto_13036 ) ( not ( = ?auto_13036 ?auto_13037 ) ) ( not ( = ?auto_13036 ?auto_13038 ) ) ( not ( = ?auto_13036 ?auto_13039 ) ) ( not ( = ?auto_13036 ?auto_13040 ) ) ( not ( = ?auto_13036 ?auto_13042 ) ) ( not ( = ?auto_13036 ?auto_13046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13038 ?auto_13039 ?auto_13040 )
      ( MAKE-4CRATE-VERIFY ?auto_13036 ?auto_13037 ?auto_13038 ?auto_13039 ?auto_13040 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13050 - SURFACE
      ?auto_13051 - SURFACE
    )
    :vars
    (
      ?auto_13062 - HOIST
      ?auto_13052 - PLACE
      ?auto_13056 - SURFACE
      ?auto_13055 - PLACE
      ?auto_13059 - HOIST
      ?auto_13053 - SURFACE
      ?auto_13058 - SURFACE
      ?auto_13060 - SURFACE
      ?auto_13061 - TRUCK
      ?auto_13054 - PLACE
      ?auto_13057 - HOIST
      ?auto_13063 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13062 ?auto_13052 ) ( IS-CRATE ?auto_13051 ) ( not ( = ?auto_13050 ?auto_13051 ) ) ( not ( = ?auto_13056 ?auto_13050 ) ) ( not ( = ?auto_13056 ?auto_13051 ) ) ( not ( = ?auto_13055 ?auto_13052 ) ) ( HOIST-AT ?auto_13059 ?auto_13055 ) ( not ( = ?auto_13062 ?auto_13059 ) ) ( SURFACE-AT ?auto_13051 ?auto_13055 ) ( ON ?auto_13051 ?auto_13053 ) ( CLEAR ?auto_13051 ) ( not ( = ?auto_13050 ?auto_13053 ) ) ( not ( = ?auto_13051 ?auto_13053 ) ) ( not ( = ?auto_13056 ?auto_13053 ) ) ( IS-CRATE ?auto_13050 ) ( AVAILABLE ?auto_13059 ) ( SURFACE-AT ?auto_13050 ?auto_13055 ) ( ON ?auto_13050 ?auto_13058 ) ( CLEAR ?auto_13050 ) ( not ( = ?auto_13050 ?auto_13058 ) ) ( not ( = ?auto_13051 ?auto_13058 ) ) ( not ( = ?auto_13056 ?auto_13058 ) ) ( not ( = ?auto_13053 ?auto_13058 ) ) ( SURFACE-AT ?auto_13060 ?auto_13052 ) ( CLEAR ?auto_13060 ) ( IS-CRATE ?auto_13056 ) ( not ( = ?auto_13060 ?auto_13056 ) ) ( not ( = ?auto_13050 ?auto_13060 ) ) ( not ( = ?auto_13051 ?auto_13060 ) ) ( not ( = ?auto_13053 ?auto_13060 ) ) ( not ( = ?auto_13058 ?auto_13060 ) ) ( AVAILABLE ?auto_13062 ) ( TRUCK-AT ?auto_13061 ?auto_13054 ) ( not ( = ?auto_13054 ?auto_13052 ) ) ( not ( = ?auto_13055 ?auto_13054 ) ) ( HOIST-AT ?auto_13057 ?auto_13054 ) ( not ( = ?auto_13062 ?auto_13057 ) ) ( not ( = ?auto_13059 ?auto_13057 ) ) ( AVAILABLE ?auto_13057 ) ( SURFACE-AT ?auto_13056 ?auto_13054 ) ( ON ?auto_13056 ?auto_13063 ) ( CLEAR ?auto_13056 ) ( not ( = ?auto_13050 ?auto_13063 ) ) ( not ( = ?auto_13051 ?auto_13063 ) ) ( not ( = ?auto_13056 ?auto_13063 ) ) ( not ( = ?auto_13053 ?auto_13063 ) ) ( not ( = ?auto_13058 ?auto_13063 ) ) ( not ( = ?auto_13060 ?auto_13063 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13057 ?auto_13056 ?auto_13063 ?auto_13054 )
      ( MAKE-2CRATE ?auto_13056 ?auto_13050 ?auto_13051 )
      ( MAKE-1CRATE-VERIFY ?auto_13050 ?auto_13051 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13064 - SURFACE
      ?auto_13065 - SURFACE
      ?auto_13066 - SURFACE
    )
    :vars
    (
      ?auto_13071 - HOIST
      ?auto_13068 - PLACE
      ?auto_13072 - PLACE
      ?auto_13073 - HOIST
      ?auto_13074 - SURFACE
      ?auto_13076 - SURFACE
      ?auto_13077 - SURFACE
      ?auto_13069 - TRUCK
      ?auto_13067 - PLACE
      ?auto_13075 - HOIST
      ?auto_13070 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13071 ?auto_13068 ) ( IS-CRATE ?auto_13066 ) ( not ( = ?auto_13065 ?auto_13066 ) ) ( not ( = ?auto_13064 ?auto_13065 ) ) ( not ( = ?auto_13064 ?auto_13066 ) ) ( not ( = ?auto_13072 ?auto_13068 ) ) ( HOIST-AT ?auto_13073 ?auto_13072 ) ( not ( = ?auto_13071 ?auto_13073 ) ) ( SURFACE-AT ?auto_13066 ?auto_13072 ) ( ON ?auto_13066 ?auto_13074 ) ( CLEAR ?auto_13066 ) ( not ( = ?auto_13065 ?auto_13074 ) ) ( not ( = ?auto_13066 ?auto_13074 ) ) ( not ( = ?auto_13064 ?auto_13074 ) ) ( IS-CRATE ?auto_13065 ) ( AVAILABLE ?auto_13073 ) ( SURFACE-AT ?auto_13065 ?auto_13072 ) ( ON ?auto_13065 ?auto_13076 ) ( CLEAR ?auto_13065 ) ( not ( = ?auto_13065 ?auto_13076 ) ) ( not ( = ?auto_13066 ?auto_13076 ) ) ( not ( = ?auto_13064 ?auto_13076 ) ) ( not ( = ?auto_13074 ?auto_13076 ) ) ( SURFACE-AT ?auto_13077 ?auto_13068 ) ( CLEAR ?auto_13077 ) ( IS-CRATE ?auto_13064 ) ( not ( = ?auto_13077 ?auto_13064 ) ) ( not ( = ?auto_13065 ?auto_13077 ) ) ( not ( = ?auto_13066 ?auto_13077 ) ) ( not ( = ?auto_13074 ?auto_13077 ) ) ( not ( = ?auto_13076 ?auto_13077 ) ) ( AVAILABLE ?auto_13071 ) ( TRUCK-AT ?auto_13069 ?auto_13067 ) ( not ( = ?auto_13067 ?auto_13068 ) ) ( not ( = ?auto_13072 ?auto_13067 ) ) ( HOIST-AT ?auto_13075 ?auto_13067 ) ( not ( = ?auto_13071 ?auto_13075 ) ) ( not ( = ?auto_13073 ?auto_13075 ) ) ( AVAILABLE ?auto_13075 ) ( SURFACE-AT ?auto_13064 ?auto_13067 ) ( ON ?auto_13064 ?auto_13070 ) ( CLEAR ?auto_13064 ) ( not ( = ?auto_13065 ?auto_13070 ) ) ( not ( = ?auto_13066 ?auto_13070 ) ) ( not ( = ?auto_13064 ?auto_13070 ) ) ( not ( = ?auto_13074 ?auto_13070 ) ) ( not ( = ?auto_13076 ?auto_13070 ) ) ( not ( = ?auto_13077 ?auto_13070 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13065 ?auto_13066 )
      ( MAKE-2CRATE-VERIFY ?auto_13064 ?auto_13065 ?auto_13066 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13078 - SURFACE
      ?auto_13079 - SURFACE
      ?auto_13080 - SURFACE
      ?auto_13081 - SURFACE
    )
    :vars
    (
      ?auto_13089 - HOIST
      ?auto_13087 - PLACE
      ?auto_13085 - PLACE
      ?auto_13090 - HOIST
      ?auto_13083 - SURFACE
      ?auto_13088 - SURFACE
      ?auto_13086 - TRUCK
      ?auto_13091 - PLACE
      ?auto_13084 - HOIST
      ?auto_13082 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13089 ?auto_13087 ) ( IS-CRATE ?auto_13081 ) ( not ( = ?auto_13080 ?auto_13081 ) ) ( not ( = ?auto_13079 ?auto_13080 ) ) ( not ( = ?auto_13079 ?auto_13081 ) ) ( not ( = ?auto_13085 ?auto_13087 ) ) ( HOIST-AT ?auto_13090 ?auto_13085 ) ( not ( = ?auto_13089 ?auto_13090 ) ) ( SURFACE-AT ?auto_13081 ?auto_13085 ) ( ON ?auto_13081 ?auto_13083 ) ( CLEAR ?auto_13081 ) ( not ( = ?auto_13080 ?auto_13083 ) ) ( not ( = ?auto_13081 ?auto_13083 ) ) ( not ( = ?auto_13079 ?auto_13083 ) ) ( IS-CRATE ?auto_13080 ) ( AVAILABLE ?auto_13090 ) ( SURFACE-AT ?auto_13080 ?auto_13085 ) ( ON ?auto_13080 ?auto_13088 ) ( CLEAR ?auto_13080 ) ( not ( = ?auto_13080 ?auto_13088 ) ) ( not ( = ?auto_13081 ?auto_13088 ) ) ( not ( = ?auto_13079 ?auto_13088 ) ) ( not ( = ?auto_13083 ?auto_13088 ) ) ( SURFACE-AT ?auto_13078 ?auto_13087 ) ( CLEAR ?auto_13078 ) ( IS-CRATE ?auto_13079 ) ( not ( = ?auto_13078 ?auto_13079 ) ) ( not ( = ?auto_13080 ?auto_13078 ) ) ( not ( = ?auto_13081 ?auto_13078 ) ) ( not ( = ?auto_13083 ?auto_13078 ) ) ( not ( = ?auto_13088 ?auto_13078 ) ) ( AVAILABLE ?auto_13089 ) ( TRUCK-AT ?auto_13086 ?auto_13091 ) ( not ( = ?auto_13091 ?auto_13087 ) ) ( not ( = ?auto_13085 ?auto_13091 ) ) ( HOIST-AT ?auto_13084 ?auto_13091 ) ( not ( = ?auto_13089 ?auto_13084 ) ) ( not ( = ?auto_13090 ?auto_13084 ) ) ( AVAILABLE ?auto_13084 ) ( SURFACE-AT ?auto_13079 ?auto_13091 ) ( ON ?auto_13079 ?auto_13082 ) ( CLEAR ?auto_13079 ) ( not ( = ?auto_13080 ?auto_13082 ) ) ( not ( = ?auto_13081 ?auto_13082 ) ) ( not ( = ?auto_13079 ?auto_13082 ) ) ( not ( = ?auto_13083 ?auto_13082 ) ) ( not ( = ?auto_13088 ?auto_13082 ) ) ( not ( = ?auto_13078 ?auto_13082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13079 ?auto_13080 ?auto_13081 )
      ( MAKE-3CRATE-VERIFY ?auto_13078 ?auto_13079 ?auto_13080 ?auto_13081 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13092 - SURFACE
      ?auto_13093 - SURFACE
      ?auto_13094 - SURFACE
      ?auto_13095 - SURFACE
      ?auto_13096 - SURFACE
    )
    :vars
    (
      ?auto_13104 - HOIST
      ?auto_13102 - PLACE
      ?auto_13100 - PLACE
      ?auto_13105 - HOIST
      ?auto_13098 - SURFACE
      ?auto_13103 - SURFACE
      ?auto_13101 - TRUCK
      ?auto_13106 - PLACE
      ?auto_13099 - HOIST
      ?auto_13097 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13104 ?auto_13102 ) ( IS-CRATE ?auto_13096 ) ( not ( = ?auto_13095 ?auto_13096 ) ) ( not ( = ?auto_13094 ?auto_13095 ) ) ( not ( = ?auto_13094 ?auto_13096 ) ) ( not ( = ?auto_13100 ?auto_13102 ) ) ( HOIST-AT ?auto_13105 ?auto_13100 ) ( not ( = ?auto_13104 ?auto_13105 ) ) ( SURFACE-AT ?auto_13096 ?auto_13100 ) ( ON ?auto_13096 ?auto_13098 ) ( CLEAR ?auto_13096 ) ( not ( = ?auto_13095 ?auto_13098 ) ) ( not ( = ?auto_13096 ?auto_13098 ) ) ( not ( = ?auto_13094 ?auto_13098 ) ) ( IS-CRATE ?auto_13095 ) ( AVAILABLE ?auto_13105 ) ( SURFACE-AT ?auto_13095 ?auto_13100 ) ( ON ?auto_13095 ?auto_13103 ) ( CLEAR ?auto_13095 ) ( not ( = ?auto_13095 ?auto_13103 ) ) ( not ( = ?auto_13096 ?auto_13103 ) ) ( not ( = ?auto_13094 ?auto_13103 ) ) ( not ( = ?auto_13098 ?auto_13103 ) ) ( SURFACE-AT ?auto_13093 ?auto_13102 ) ( CLEAR ?auto_13093 ) ( IS-CRATE ?auto_13094 ) ( not ( = ?auto_13093 ?auto_13094 ) ) ( not ( = ?auto_13095 ?auto_13093 ) ) ( not ( = ?auto_13096 ?auto_13093 ) ) ( not ( = ?auto_13098 ?auto_13093 ) ) ( not ( = ?auto_13103 ?auto_13093 ) ) ( AVAILABLE ?auto_13104 ) ( TRUCK-AT ?auto_13101 ?auto_13106 ) ( not ( = ?auto_13106 ?auto_13102 ) ) ( not ( = ?auto_13100 ?auto_13106 ) ) ( HOIST-AT ?auto_13099 ?auto_13106 ) ( not ( = ?auto_13104 ?auto_13099 ) ) ( not ( = ?auto_13105 ?auto_13099 ) ) ( AVAILABLE ?auto_13099 ) ( SURFACE-AT ?auto_13094 ?auto_13106 ) ( ON ?auto_13094 ?auto_13097 ) ( CLEAR ?auto_13094 ) ( not ( = ?auto_13095 ?auto_13097 ) ) ( not ( = ?auto_13096 ?auto_13097 ) ) ( not ( = ?auto_13094 ?auto_13097 ) ) ( not ( = ?auto_13098 ?auto_13097 ) ) ( not ( = ?auto_13103 ?auto_13097 ) ) ( not ( = ?auto_13093 ?auto_13097 ) ) ( ON ?auto_13093 ?auto_13092 ) ( not ( = ?auto_13092 ?auto_13093 ) ) ( not ( = ?auto_13092 ?auto_13094 ) ) ( not ( = ?auto_13092 ?auto_13095 ) ) ( not ( = ?auto_13092 ?auto_13096 ) ) ( not ( = ?auto_13092 ?auto_13098 ) ) ( not ( = ?auto_13092 ?auto_13103 ) ) ( not ( = ?auto_13092 ?auto_13097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13094 ?auto_13095 ?auto_13096 )
      ( MAKE-4CRATE-VERIFY ?auto_13092 ?auto_13093 ?auto_13094 ?auto_13095 ?auto_13096 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13107 - SURFACE
      ?auto_13108 - SURFACE
    )
    :vars
    (
      ?auto_13117 - HOIST
      ?auto_13114 - PLACE
      ?auto_13116 - SURFACE
      ?auto_13112 - PLACE
      ?auto_13118 - HOIST
      ?auto_13110 - SURFACE
      ?auto_13115 - SURFACE
      ?auto_13120 - SURFACE
      ?auto_13119 - PLACE
      ?auto_13111 - HOIST
      ?auto_13109 - SURFACE
      ?auto_13113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13117 ?auto_13114 ) ( IS-CRATE ?auto_13108 ) ( not ( = ?auto_13107 ?auto_13108 ) ) ( not ( = ?auto_13116 ?auto_13107 ) ) ( not ( = ?auto_13116 ?auto_13108 ) ) ( not ( = ?auto_13112 ?auto_13114 ) ) ( HOIST-AT ?auto_13118 ?auto_13112 ) ( not ( = ?auto_13117 ?auto_13118 ) ) ( SURFACE-AT ?auto_13108 ?auto_13112 ) ( ON ?auto_13108 ?auto_13110 ) ( CLEAR ?auto_13108 ) ( not ( = ?auto_13107 ?auto_13110 ) ) ( not ( = ?auto_13108 ?auto_13110 ) ) ( not ( = ?auto_13116 ?auto_13110 ) ) ( IS-CRATE ?auto_13107 ) ( AVAILABLE ?auto_13118 ) ( SURFACE-AT ?auto_13107 ?auto_13112 ) ( ON ?auto_13107 ?auto_13115 ) ( CLEAR ?auto_13107 ) ( not ( = ?auto_13107 ?auto_13115 ) ) ( not ( = ?auto_13108 ?auto_13115 ) ) ( not ( = ?auto_13116 ?auto_13115 ) ) ( not ( = ?auto_13110 ?auto_13115 ) ) ( SURFACE-AT ?auto_13120 ?auto_13114 ) ( CLEAR ?auto_13120 ) ( IS-CRATE ?auto_13116 ) ( not ( = ?auto_13120 ?auto_13116 ) ) ( not ( = ?auto_13107 ?auto_13120 ) ) ( not ( = ?auto_13108 ?auto_13120 ) ) ( not ( = ?auto_13110 ?auto_13120 ) ) ( not ( = ?auto_13115 ?auto_13120 ) ) ( AVAILABLE ?auto_13117 ) ( not ( = ?auto_13119 ?auto_13114 ) ) ( not ( = ?auto_13112 ?auto_13119 ) ) ( HOIST-AT ?auto_13111 ?auto_13119 ) ( not ( = ?auto_13117 ?auto_13111 ) ) ( not ( = ?auto_13118 ?auto_13111 ) ) ( AVAILABLE ?auto_13111 ) ( SURFACE-AT ?auto_13116 ?auto_13119 ) ( ON ?auto_13116 ?auto_13109 ) ( CLEAR ?auto_13116 ) ( not ( = ?auto_13107 ?auto_13109 ) ) ( not ( = ?auto_13108 ?auto_13109 ) ) ( not ( = ?auto_13116 ?auto_13109 ) ) ( not ( = ?auto_13110 ?auto_13109 ) ) ( not ( = ?auto_13115 ?auto_13109 ) ) ( not ( = ?auto_13120 ?auto_13109 ) ) ( TRUCK-AT ?auto_13113 ?auto_13114 ) )
    :subtasks
    ( ( !DRIVE ?auto_13113 ?auto_13114 ?auto_13119 )
      ( MAKE-2CRATE ?auto_13116 ?auto_13107 ?auto_13108 )
      ( MAKE-1CRATE-VERIFY ?auto_13107 ?auto_13108 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13121 - SURFACE
      ?auto_13122 - SURFACE
      ?auto_13123 - SURFACE
    )
    :vars
    (
      ?auto_13132 - HOIST
      ?auto_13129 - PLACE
      ?auto_13125 - PLACE
      ?auto_13131 - HOIST
      ?auto_13126 - SURFACE
      ?auto_13130 - SURFACE
      ?auto_13133 - SURFACE
      ?auto_13127 - PLACE
      ?auto_13134 - HOIST
      ?auto_13128 - SURFACE
      ?auto_13124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13132 ?auto_13129 ) ( IS-CRATE ?auto_13123 ) ( not ( = ?auto_13122 ?auto_13123 ) ) ( not ( = ?auto_13121 ?auto_13122 ) ) ( not ( = ?auto_13121 ?auto_13123 ) ) ( not ( = ?auto_13125 ?auto_13129 ) ) ( HOIST-AT ?auto_13131 ?auto_13125 ) ( not ( = ?auto_13132 ?auto_13131 ) ) ( SURFACE-AT ?auto_13123 ?auto_13125 ) ( ON ?auto_13123 ?auto_13126 ) ( CLEAR ?auto_13123 ) ( not ( = ?auto_13122 ?auto_13126 ) ) ( not ( = ?auto_13123 ?auto_13126 ) ) ( not ( = ?auto_13121 ?auto_13126 ) ) ( IS-CRATE ?auto_13122 ) ( AVAILABLE ?auto_13131 ) ( SURFACE-AT ?auto_13122 ?auto_13125 ) ( ON ?auto_13122 ?auto_13130 ) ( CLEAR ?auto_13122 ) ( not ( = ?auto_13122 ?auto_13130 ) ) ( not ( = ?auto_13123 ?auto_13130 ) ) ( not ( = ?auto_13121 ?auto_13130 ) ) ( not ( = ?auto_13126 ?auto_13130 ) ) ( SURFACE-AT ?auto_13133 ?auto_13129 ) ( CLEAR ?auto_13133 ) ( IS-CRATE ?auto_13121 ) ( not ( = ?auto_13133 ?auto_13121 ) ) ( not ( = ?auto_13122 ?auto_13133 ) ) ( not ( = ?auto_13123 ?auto_13133 ) ) ( not ( = ?auto_13126 ?auto_13133 ) ) ( not ( = ?auto_13130 ?auto_13133 ) ) ( AVAILABLE ?auto_13132 ) ( not ( = ?auto_13127 ?auto_13129 ) ) ( not ( = ?auto_13125 ?auto_13127 ) ) ( HOIST-AT ?auto_13134 ?auto_13127 ) ( not ( = ?auto_13132 ?auto_13134 ) ) ( not ( = ?auto_13131 ?auto_13134 ) ) ( AVAILABLE ?auto_13134 ) ( SURFACE-AT ?auto_13121 ?auto_13127 ) ( ON ?auto_13121 ?auto_13128 ) ( CLEAR ?auto_13121 ) ( not ( = ?auto_13122 ?auto_13128 ) ) ( not ( = ?auto_13123 ?auto_13128 ) ) ( not ( = ?auto_13121 ?auto_13128 ) ) ( not ( = ?auto_13126 ?auto_13128 ) ) ( not ( = ?auto_13130 ?auto_13128 ) ) ( not ( = ?auto_13133 ?auto_13128 ) ) ( TRUCK-AT ?auto_13124 ?auto_13129 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13122 ?auto_13123 )
      ( MAKE-2CRATE-VERIFY ?auto_13121 ?auto_13122 ?auto_13123 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13135 - SURFACE
      ?auto_13136 - SURFACE
      ?auto_13137 - SURFACE
      ?auto_13138 - SURFACE
    )
    :vars
    (
      ?auto_13147 - HOIST
      ?auto_13143 - PLACE
      ?auto_13139 - PLACE
      ?auto_13140 - HOIST
      ?auto_13146 - SURFACE
      ?auto_13142 - SURFACE
      ?auto_13145 - PLACE
      ?auto_13148 - HOIST
      ?auto_13144 - SURFACE
      ?auto_13141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13147 ?auto_13143 ) ( IS-CRATE ?auto_13138 ) ( not ( = ?auto_13137 ?auto_13138 ) ) ( not ( = ?auto_13136 ?auto_13137 ) ) ( not ( = ?auto_13136 ?auto_13138 ) ) ( not ( = ?auto_13139 ?auto_13143 ) ) ( HOIST-AT ?auto_13140 ?auto_13139 ) ( not ( = ?auto_13147 ?auto_13140 ) ) ( SURFACE-AT ?auto_13138 ?auto_13139 ) ( ON ?auto_13138 ?auto_13146 ) ( CLEAR ?auto_13138 ) ( not ( = ?auto_13137 ?auto_13146 ) ) ( not ( = ?auto_13138 ?auto_13146 ) ) ( not ( = ?auto_13136 ?auto_13146 ) ) ( IS-CRATE ?auto_13137 ) ( AVAILABLE ?auto_13140 ) ( SURFACE-AT ?auto_13137 ?auto_13139 ) ( ON ?auto_13137 ?auto_13142 ) ( CLEAR ?auto_13137 ) ( not ( = ?auto_13137 ?auto_13142 ) ) ( not ( = ?auto_13138 ?auto_13142 ) ) ( not ( = ?auto_13136 ?auto_13142 ) ) ( not ( = ?auto_13146 ?auto_13142 ) ) ( SURFACE-AT ?auto_13135 ?auto_13143 ) ( CLEAR ?auto_13135 ) ( IS-CRATE ?auto_13136 ) ( not ( = ?auto_13135 ?auto_13136 ) ) ( not ( = ?auto_13137 ?auto_13135 ) ) ( not ( = ?auto_13138 ?auto_13135 ) ) ( not ( = ?auto_13146 ?auto_13135 ) ) ( not ( = ?auto_13142 ?auto_13135 ) ) ( AVAILABLE ?auto_13147 ) ( not ( = ?auto_13145 ?auto_13143 ) ) ( not ( = ?auto_13139 ?auto_13145 ) ) ( HOIST-AT ?auto_13148 ?auto_13145 ) ( not ( = ?auto_13147 ?auto_13148 ) ) ( not ( = ?auto_13140 ?auto_13148 ) ) ( AVAILABLE ?auto_13148 ) ( SURFACE-AT ?auto_13136 ?auto_13145 ) ( ON ?auto_13136 ?auto_13144 ) ( CLEAR ?auto_13136 ) ( not ( = ?auto_13137 ?auto_13144 ) ) ( not ( = ?auto_13138 ?auto_13144 ) ) ( not ( = ?auto_13136 ?auto_13144 ) ) ( not ( = ?auto_13146 ?auto_13144 ) ) ( not ( = ?auto_13142 ?auto_13144 ) ) ( not ( = ?auto_13135 ?auto_13144 ) ) ( TRUCK-AT ?auto_13141 ?auto_13143 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13136 ?auto_13137 ?auto_13138 )
      ( MAKE-3CRATE-VERIFY ?auto_13135 ?auto_13136 ?auto_13137 ?auto_13138 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13149 - SURFACE
      ?auto_13150 - SURFACE
      ?auto_13151 - SURFACE
      ?auto_13152 - SURFACE
      ?auto_13153 - SURFACE
    )
    :vars
    (
      ?auto_13162 - HOIST
      ?auto_13158 - PLACE
      ?auto_13154 - PLACE
      ?auto_13155 - HOIST
      ?auto_13161 - SURFACE
      ?auto_13157 - SURFACE
      ?auto_13160 - PLACE
      ?auto_13163 - HOIST
      ?auto_13159 - SURFACE
      ?auto_13156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13162 ?auto_13158 ) ( IS-CRATE ?auto_13153 ) ( not ( = ?auto_13152 ?auto_13153 ) ) ( not ( = ?auto_13151 ?auto_13152 ) ) ( not ( = ?auto_13151 ?auto_13153 ) ) ( not ( = ?auto_13154 ?auto_13158 ) ) ( HOIST-AT ?auto_13155 ?auto_13154 ) ( not ( = ?auto_13162 ?auto_13155 ) ) ( SURFACE-AT ?auto_13153 ?auto_13154 ) ( ON ?auto_13153 ?auto_13161 ) ( CLEAR ?auto_13153 ) ( not ( = ?auto_13152 ?auto_13161 ) ) ( not ( = ?auto_13153 ?auto_13161 ) ) ( not ( = ?auto_13151 ?auto_13161 ) ) ( IS-CRATE ?auto_13152 ) ( AVAILABLE ?auto_13155 ) ( SURFACE-AT ?auto_13152 ?auto_13154 ) ( ON ?auto_13152 ?auto_13157 ) ( CLEAR ?auto_13152 ) ( not ( = ?auto_13152 ?auto_13157 ) ) ( not ( = ?auto_13153 ?auto_13157 ) ) ( not ( = ?auto_13151 ?auto_13157 ) ) ( not ( = ?auto_13161 ?auto_13157 ) ) ( SURFACE-AT ?auto_13150 ?auto_13158 ) ( CLEAR ?auto_13150 ) ( IS-CRATE ?auto_13151 ) ( not ( = ?auto_13150 ?auto_13151 ) ) ( not ( = ?auto_13152 ?auto_13150 ) ) ( not ( = ?auto_13153 ?auto_13150 ) ) ( not ( = ?auto_13161 ?auto_13150 ) ) ( not ( = ?auto_13157 ?auto_13150 ) ) ( AVAILABLE ?auto_13162 ) ( not ( = ?auto_13160 ?auto_13158 ) ) ( not ( = ?auto_13154 ?auto_13160 ) ) ( HOIST-AT ?auto_13163 ?auto_13160 ) ( not ( = ?auto_13162 ?auto_13163 ) ) ( not ( = ?auto_13155 ?auto_13163 ) ) ( AVAILABLE ?auto_13163 ) ( SURFACE-AT ?auto_13151 ?auto_13160 ) ( ON ?auto_13151 ?auto_13159 ) ( CLEAR ?auto_13151 ) ( not ( = ?auto_13152 ?auto_13159 ) ) ( not ( = ?auto_13153 ?auto_13159 ) ) ( not ( = ?auto_13151 ?auto_13159 ) ) ( not ( = ?auto_13161 ?auto_13159 ) ) ( not ( = ?auto_13157 ?auto_13159 ) ) ( not ( = ?auto_13150 ?auto_13159 ) ) ( TRUCK-AT ?auto_13156 ?auto_13158 ) ( ON ?auto_13150 ?auto_13149 ) ( not ( = ?auto_13149 ?auto_13150 ) ) ( not ( = ?auto_13149 ?auto_13151 ) ) ( not ( = ?auto_13149 ?auto_13152 ) ) ( not ( = ?auto_13149 ?auto_13153 ) ) ( not ( = ?auto_13149 ?auto_13161 ) ) ( not ( = ?auto_13149 ?auto_13157 ) ) ( not ( = ?auto_13149 ?auto_13159 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13151 ?auto_13152 ?auto_13153 )
      ( MAKE-4CRATE-VERIFY ?auto_13149 ?auto_13150 ?auto_13151 ?auto_13152 ?auto_13153 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13164 - SURFACE
      ?auto_13165 - SURFACE
    )
    :vars
    (
      ?auto_13176 - HOIST
      ?auto_13172 - PLACE
      ?auto_13167 - SURFACE
      ?auto_13166 - PLACE
      ?auto_13168 - HOIST
      ?auto_13175 - SURFACE
      ?auto_13171 - SURFACE
      ?auto_13169 - SURFACE
      ?auto_13174 - PLACE
      ?auto_13177 - HOIST
      ?auto_13173 - SURFACE
      ?auto_13170 - TRUCK
      ?auto_13178 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13176 ?auto_13172 ) ( IS-CRATE ?auto_13165 ) ( not ( = ?auto_13164 ?auto_13165 ) ) ( not ( = ?auto_13167 ?auto_13164 ) ) ( not ( = ?auto_13167 ?auto_13165 ) ) ( not ( = ?auto_13166 ?auto_13172 ) ) ( HOIST-AT ?auto_13168 ?auto_13166 ) ( not ( = ?auto_13176 ?auto_13168 ) ) ( SURFACE-AT ?auto_13165 ?auto_13166 ) ( ON ?auto_13165 ?auto_13175 ) ( CLEAR ?auto_13165 ) ( not ( = ?auto_13164 ?auto_13175 ) ) ( not ( = ?auto_13165 ?auto_13175 ) ) ( not ( = ?auto_13167 ?auto_13175 ) ) ( IS-CRATE ?auto_13164 ) ( AVAILABLE ?auto_13168 ) ( SURFACE-AT ?auto_13164 ?auto_13166 ) ( ON ?auto_13164 ?auto_13171 ) ( CLEAR ?auto_13164 ) ( not ( = ?auto_13164 ?auto_13171 ) ) ( not ( = ?auto_13165 ?auto_13171 ) ) ( not ( = ?auto_13167 ?auto_13171 ) ) ( not ( = ?auto_13175 ?auto_13171 ) ) ( IS-CRATE ?auto_13167 ) ( not ( = ?auto_13169 ?auto_13167 ) ) ( not ( = ?auto_13164 ?auto_13169 ) ) ( not ( = ?auto_13165 ?auto_13169 ) ) ( not ( = ?auto_13175 ?auto_13169 ) ) ( not ( = ?auto_13171 ?auto_13169 ) ) ( not ( = ?auto_13174 ?auto_13172 ) ) ( not ( = ?auto_13166 ?auto_13174 ) ) ( HOIST-AT ?auto_13177 ?auto_13174 ) ( not ( = ?auto_13176 ?auto_13177 ) ) ( not ( = ?auto_13168 ?auto_13177 ) ) ( AVAILABLE ?auto_13177 ) ( SURFACE-AT ?auto_13167 ?auto_13174 ) ( ON ?auto_13167 ?auto_13173 ) ( CLEAR ?auto_13167 ) ( not ( = ?auto_13164 ?auto_13173 ) ) ( not ( = ?auto_13165 ?auto_13173 ) ) ( not ( = ?auto_13167 ?auto_13173 ) ) ( not ( = ?auto_13175 ?auto_13173 ) ) ( not ( = ?auto_13171 ?auto_13173 ) ) ( not ( = ?auto_13169 ?auto_13173 ) ) ( TRUCK-AT ?auto_13170 ?auto_13172 ) ( SURFACE-AT ?auto_13178 ?auto_13172 ) ( CLEAR ?auto_13178 ) ( LIFTING ?auto_13176 ?auto_13169 ) ( IS-CRATE ?auto_13169 ) ( not ( = ?auto_13178 ?auto_13169 ) ) ( not ( = ?auto_13164 ?auto_13178 ) ) ( not ( = ?auto_13165 ?auto_13178 ) ) ( not ( = ?auto_13167 ?auto_13178 ) ) ( not ( = ?auto_13175 ?auto_13178 ) ) ( not ( = ?auto_13171 ?auto_13178 ) ) ( not ( = ?auto_13173 ?auto_13178 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13178 ?auto_13169 )
      ( MAKE-2CRATE ?auto_13167 ?auto_13164 ?auto_13165 )
      ( MAKE-1CRATE-VERIFY ?auto_13164 ?auto_13165 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13179 - SURFACE
      ?auto_13180 - SURFACE
      ?auto_13181 - SURFACE
    )
    :vars
    (
      ?auto_13184 - HOIST
      ?auto_13186 - PLACE
      ?auto_13188 - PLACE
      ?auto_13193 - HOIST
      ?auto_13183 - SURFACE
      ?auto_13185 - SURFACE
      ?auto_13182 - SURFACE
      ?auto_13192 - PLACE
      ?auto_13191 - HOIST
      ?auto_13189 - SURFACE
      ?auto_13190 - TRUCK
      ?auto_13187 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13184 ?auto_13186 ) ( IS-CRATE ?auto_13181 ) ( not ( = ?auto_13180 ?auto_13181 ) ) ( not ( = ?auto_13179 ?auto_13180 ) ) ( not ( = ?auto_13179 ?auto_13181 ) ) ( not ( = ?auto_13188 ?auto_13186 ) ) ( HOIST-AT ?auto_13193 ?auto_13188 ) ( not ( = ?auto_13184 ?auto_13193 ) ) ( SURFACE-AT ?auto_13181 ?auto_13188 ) ( ON ?auto_13181 ?auto_13183 ) ( CLEAR ?auto_13181 ) ( not ( = ?auto_13180 ?auto_13183 ) ) ( not ( = ?auto_13181 ?auto_13183 ) ) ( not ( = ?auto_13179 ?auto_13183 ) ) ( IS-CRATE ?auto_13180 ) ( AVAILABLE ?auto_13193 ) ( SURFACE-AT ?auto_13180 ?auto_13188 ) ( ON ?auto_13180 ?auto_13185 ) ( CLEAR ?auto_13180 ) ( not ( = ?auto_13180 ?auto_13185 ) ) ( not ( = ?auto_13181 ?auto_13185 ) ) ( not ( = ?auto_13179 ?auto_13185 ) ) ( not ( = ?auto_13183 ?auto_13185 ) ) ( IS-CRATE ?auto_13179 ) ( not ( = ?auto_13182 ?auto_13179 ) ) ( not ( = ?auto_13180 ?auto_13182 ) ) ( not ( = ?auto_13181 ?auto_13182 ) ) ( not ( = ?auto_13183 ?auto_13182 ) ) ( not ( = ?auto_13185 ?auto_13182 ) ) ( not ( = ?auto_13192 ?auto_13186 ) ) ( not ( = ?auto_13188 ?auto_13192 ) ) ( HOIST-AT ?auto_13191 ?auto_13192 ) ( not ( = ?auto_13184 ?auto_13191 ) ) ( not ( = ?auto_13193 ?auto_13191 ) ) ( AVAILABLE ?auto_13191 ) ( SURFACE-AT ?auto_13179 ?auto_13192 ) ( ON ?auto_13179 ?auto_13189 ) ( CLEAR ?auto_13179 ) ( not ( = ?auto_13180 ?auto_13189 ) ) ( not ( = ?auto_13181 ?auto_13189 ) ) ( not ( = ?auto_13179 ?auto_13189 ) ) ( not ( = ?auto_13183 ?auto_13189 ) ) ( not ( = ?auto_13185 ?auto_13189 ) ) ( not ( = ?auto_13182 ?auto_13189 ) ) ( TRUCK-AT ?auto_13190 ?auto_13186 ) ( SURFACE-AT ?auto_13187 ?auto_13186 ) ( CLEAR ?auto_13187 ) ( LIFTING ?auto_13184 ?auto_13182 ) ( IS-CRATE ?auto_13182 ) ( not ( = ?auto_13187 ?auto_13182 ) ) ( not ( = ?auto_13180 ?auto_13187 ) ) ( not ( = ?auto_13181 ?auto_13187 ) ) ( not ( = ?auto_13179 ?auto_13187 ) ) ( not ( = ?auto_13183 ?auto_13187 ) ) ( not ( = ?auto_13185 ?auto_13187 ) ) ( not ( = ?auto_13189 ?auto_13187 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13180 ?auto_13181 )
      ( MAKE-2CRATE-VERIFY ?auto_13179 ?auto_13180 ?auto_13181 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13194 - SURFACE
      ?auto_13195 - SURFACE
      ?auto_13196 - SURFACE
      ?auto_13197 - SURFACE
    )
    :vars
    (
      ?auto_13207 - HOIST
      ?auto_13208 - PLACE
      ?auto_13202 - PLACE
      ?auto_13200 - HOIST
      ?auto_13203 - SURFACE
      ?auto_13206 - SURFACE
      ?auto_13204 - PLACE
      ?auto_13198 - HOIST
      ?auto_13201 - SURFACE
      ?auto_13199 - TRUCK
      ?auto_13205 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13207 ?auto_13208 ) ( IS-CRATE ?auto_13197 ) ( not ( = ?auto_13196 ?auto_13197 ) ) ( not ( = ?auto_13195 ?auto_13196 ) ) ( not ( = ?auto_13195 ?auto_13197 ) ) ( not ( = ?auto_13202 ?auto_13208 ) ) ( HOIST-AT ?auto_13200 ?auto_13202 ) ( not ( = ?auto_13207 ?auto_13200 ) ) ( SURFACE-AT ?auto_13197 ?auto_13202 ) ( ON ?auto_13197 ?auto_13203 ) ( CLEAR ?auto_13197 ) ( not ( = ?auto_13196 ?auto_13203 ) ) ( not ( = ?auto_13197 ?auto_13203 ) ) ( not ( = ?auto_13195 ?auto_13203 ) ) ( IS-CRATE ?auto_13196 ) ( AVAILABLE ?auto_13200 ) ( SURFACE-AT ?auto_13196 ?auto_13202 ) ( ON ?auto_13196 ?auto_13206 ) ( CLEAR ?auto_13196 ) ( not ( = ?auto_13196 ?auto_13206 ) ) ( not ( = ?auto_13197 ?auto_13206 ) ) ( not ( = ?auto_13195 ?auto_13206 ) ) ( not ( = ?auto_13203 ?auto_13206 ) ) ( IS-CRATE ?auto_13195 ) ( not ( = ?auto_13194 ?auto_13195 ) ) ( not ( = ?auto_13196 ?auto_13194 ) ) ( not ( = ?auto_13197 ?auto_13194 ) ) ( not ( = ?auto_13203 ?auto_13194 ) ) ( not ( = ?auto_13206 ?auto_13194 ) ) ( not ( = ?auto_13204 ?auto_13208 ) ) ( not ( = ?auto_13202 ?auto_13204 ) ) ( HOIST-AT ?auto_13198 ?auto_13204 ) ( not ( = ?auto_13207 ?auto_13198 ) ) ( not ( = ?auto_13200 ?auto_13198 ) ) ( AVAILABLE ?auto_13198 ) ( SURFACE-AT ?auto_13195 ?auto_13204 ) ( ON ?auto_13195 ?auto_13201 ) ( CLEAR ?auto_13195 ) ( not ( = ?auto_13196 ?auto_13201 ) ) ( not ( = ?auto_13197 ?auto_13201 ) ) ( not ( = ?auto_13195 ?auto_13201 ) ) ( not ( = ?auto_13203 ?auto_13201 ) ) ( not ( = ?auto_13206 ?auto_13201 ) ) ( not ( = ?auto_13194 ?auto_13201 ) ) ( TRUCK-AT ?auto_13199 ?auto_13208 ) ( SURFACE-AT ?auto_13205 ?auto_13208 ) ( CLEAR ?auto_13205 ) ( LIFTING ?auto_13207 ?auto_13194 ) ( IS-CRATE ?auto_13194 ) ( not ( = ?auto_13205 ?auto_13194 ) ) ( not ( = ?auto_13196 ?auto_13205 ) ) ( not ( = ?auto_13197 ?auto_13205 ) ) ( not ( = ?auto_13195 ?auto_13205 ) ) ( not ( = ?auto_13203 ?auto_13205 ) ) ( not ( = ?auto_13206 ?auto_13205 ) ) ( not ( = ?auto_13201 ?auto_13205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13195 ?auto_13196 ?auto_13197 )
      ( MAKE-3CRATE-VERIFY ?auto_13194 ?auto_13195 ?auto_13196 ?auto_13197 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13209 - SURFACE
      ?auto_13210 - SURFACE
      ?auto_13211 - SURFACE
      ?auto_13212 - SURFACE
      ?auto_13213 - SURFACE
    )
    :vars
    (
      ?auto_13222 - HOIST
      ?auto_13223 - PLACE
      ?auto_13218 - PLACE
      ?auto_13216 - HOIST
      ?auto_13219 - SURFACE
      ?auto_13221 - SURFACE
      ?auto_13220 - PLACE
      ?auto_13214 - HOIST
      ?auto_13217 - SURFACE
      ?auto_13215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13222 ?auto_13223 ) ( IS-CRATE ?auto_13213 ) ( not ( = ?auto_13212 ?auto_13213 ) ) ( not ( = ?auto_13211 ?auto_13212 ) ) ( not ( = ?auto_13211 ?auto_13213 ) ) ( not ( = ?auto_13218 ?auto_13223 ) ) ( HOIST-AT ?auto_13216 ?auto_13218 ) ( not ( = ?auto_13222 ?auto_13216 ) ) ( SURFACE-AT ?auto_13213 ?auto_13218 ) ( ON ?auto_13213 ?auto_13219 ) ( CLEAR ?auto_13213 ) ( not ( = ?auto_13212 ?auto_13219 ) ) ( not ( = ?auto_13213 ?auto_13219 ) ) ( not ( = ?auto_13211 ?auto_13219 ) ) ( IS-CRATE ?auto_13212 ) ( AVAILABLE ?auto_13216 ) ( SURFACE-AT ?auto_13212 ?auto_13218 ) ( ON ?auto_13212 ?auto_13221 ) ( CLEAR ?auto_13212 ) ( not ( = ?auto_13212 ?auto_13221 ) ) ( not ( = ?auto_13213 ?auto_13221 ) ) ( not ( = ?auto_13211 ?auto_13221 ) ) ( not ( = ?auto_13219 ?auto_13221 ) ) ( IS-CRATE ?auto_13211 ) ( not ( = ?auto_13210 ?auto_13211 ) ) ( not ( = ?auto_13212 ?auto_13210 ) ) ( not ( = ?auto_13213 ?auto_13210 ) ) ( not ( = ?auto_13219 ?auto_13210 ) ) ( not ( = ?auto_13221 ?auto_13210 ) ) ( not ( = ?auto_13220 ?auto_13223 ) ) ( not ( = ?auto_13218 ?auto_13220 ) ) ( HOIST-AT ?auto_13214 ?auto_13220 ) ( not ( = ?auto_13222 ?auto_13214 ) ) ( not ( = ?auto_13216 ?auto_13214 ) ) ( AVAILABLE ?auto_13214 ) ( SURFACE-AT ?auto_13211 ?auto_13220 ) ( ON ?auto_13211 ?auto_13217 ) ( CLEAR ?auto_13211 ) ( not ( = ?auto_13212 ?auto_13217 ) ) ( not ( = ?auto_13213 ?auto_13217 ) ) ( not ( = ?auto_13211 ?auto_13217 ) ) ( not ( = ?auto_13219 ?auto_13217 ) ) ( not ( = ?auto_13221 ?auto_13217 ) ) ( not ( = ?auto_13210 ?auto_13217 ) ) ( TRUCK-AT ?auto_13215 ?auto_13223 ) ( SURFACE-AT ?auto_13209 ?auto_13223 ) ( CLEAR ?auto_13209 ) ( LIFTING ?auto_13222 ?auto_13210 ) ( IS-CRATE ?auto_13210 ) ( not ( = ?auto_13209 ?auto_13210 ) ) ( not ( = ?auto_13212 ?auto_13209 ) ) ( not ( = ?auto_13213 ?auto_13209 ) ) ( not ( = ?auto_13211 ?auto_13209 ) ) ( not ( = ?auto_13219 ?auto_13209 ) ) ( not ( = ?auto_13221 ?auto_13209 ) ) ( not ( = ?auto_13217 ?auto_13209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13211 ?auto_13212 ?auto_13213 )
      ( MAKE-4CRATE-VERIFY ?auto_13209 ?auto_13210 ?auto_13211 ?auto_13212 ?auto_13213 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13224 - SURFACE
      ?auto_13225 - SURFACE
    )
    :vars
    (
      ?auto_13236 - HOIST
      ?auto_13238 - PLACE
      ?auto_13237 - SURFACE
      ?auto_13230 - PLACE
      ?auto_13228 - HOIST
      ?auto_13232 - SURFACE
      ?auto_13235 - SURFACE
      ?auto_13231 - SURFACE
      ?auto_13233 - PLACE
      ?auto_13226 - HOIST
      ?auto_13229 - SURFACE
      ?auto_13227 - TRUCK
      ?auto_13234 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13236 ?auto_13238 ) ( IS-CRATE ?auto_13225 ) ( not ( = ?auto_13224 ?auto_13225 ) ) ( not ( = ?auto_13237 ?auto_13224 ) ) ( not ( = ?auto_13237 ?auto_13225 ) ) ( not ( = ?auto_13230 ?auto_13238 ) ) ( HOIST-AT ?auto_13228 ?auto_13230 ) ( not ( = ?auto_13236 ?auto_13228 ) ) ( SURFACE-AT ?auto_13225 ?auto_13230 ) ( ON ?auto_13225 ?auto_13232 ) ( CLEAR ?auto_13225 ) ( not ( = ?auto_13224 ?auto_13232 ) ) ( not ( = ?auto_13225 ?auto_13232 ) ) ( not ( = ?auto_13237 ?auto_13232 ) ) ( IS-CRATE ?auto_13224 ) ( AVAILABLE ?auto_13228 ) ( SURFACE-AT ?auto_13224 ?auto_13230 ) ( ON ?auto_13224 ?auto_13235 ) ( CLEAR ?auto_13224 ) ( not ( = ?auto_13224 ?auto_13235 ) ) ( not ( = ?auto_13225 ?auto_13235 ) ) ( not ( = ?auto_13237 ?auto_13235 ) ) ( not ( = ?auto_13232 ?auto_13235 ) ) ( IS-CRATE ?auto_13237 ) ( not ( = ?auto_13231 ?auto_13237 ) ) ( not ( = ?auto_13224 ?auto_13231 ) ) ( not ( = ?auto_13225 ?auto_13231 ) ) ( not ( = ?auto_13232 ?auto_13231 ) ) ( not ( = ?auto_13235 ?auto_13231 ) ) ( not ( = ?auto_13233 ?auto_13238 ) ) ( not ( = ?auto_13230 ?auto_13233 ) ) ( HOIST-AT ?auto_13226 ?auto_13233 ) ( not ( = ?auto_13236 ?auto_13226 ) ) ( not ( = ?auto_13228 ?auto_13226 ) ) ( AVAILABLE ?auto_13226 ) ( SURFACE-AT ?auto_13237 ?auto_13233 ) ( ON ?auto_13237 ?auto_13229 ) ( CLEAR ?auto_13237 ) ( not ( = ?auto_13224 ?auto_13229 ) ) ( not ( = ?auto_13225 ?auto_13229 ) ) ( not ( = ?auto_13237 ?auto_13229 ) ) ( not ( = ?auto_13232 ?auto_13229 ) ) ( not ( = ?auto_13235 ?auto_13229 ) ) ( not ( = ?auto_13231 ?auto_13229 ) ) ( TRUCK-AT ?auto_13227 ?auto_13238 ) ( SURFACE-AT ?auto_13234 ?auto_13238 ) ( CLEAR ?auto_13234 ) ( IS-CRATE ?auto_13231 ) ( not ( = ?auto_13234 ?auto_13231 ) ) ( not ( = ?auto_13224 ?auto_13234 ) ) ( not ( = ?auto_13225 ?auto_13234 ) ) ( not ( = ?auto_13237 ?auto_13234 ) ) ( not ( = ?auto_13232 ?auto_13234 ) ) ( not ( = ?auto_13235 ?auto_13234 ) ) ( not ( = ?auto_13229 ?auto_13234 ) ) ( AVAILABLE ?auto_13236 ) ( IN ?auto_13231 ?auto_13227 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13236 ?auto_13231 ?auto_13227 ?auto_13238 )
      ( MAKE-2CRATE ?auto_13237 ?auto_13224 ?auto_13225 )
      ( MAKE-1CRATE-VERIFY ?auto_13224 ?auto_13225 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13239 - SURFACE
      ?auto_13240 - SURFACE
      ?auto_13241 - SURFACE
    )
    :vars
    (
      ?auto_13251 - HOIST
      ?auto_13247 - PLACE
      ?auto_13243 - PLACE
      ?auto_13250 - HOIST
      ?auto_13249 - SURFACE
      ?auto_13242 - SURFACE
      ?auto_13252 - SURFACE
      ?auto_13246 - PLACE
      ?auto_13244 - HOIST
      ?auto_13253 - SURFACE
      ?auto_13248 - TRUCK
      ?auto_13245 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13251 ?auto_13247 ) ( IS-CRATE ?auto_13241 ) ( not ( = ?auto_13240 ?auto_13241 ) ) ( not ( = ?auto_13239 ?auto_13240 ) ) ( not ( = ?auto_13239 ?auto_13241 ) ) ( not ( = ?auto_13243 ?auto_13247 ) ) ( HOIST-AT ?auto_13250 ?auto_13243 ) ( not ( = ?auto_13251 ?auto_13250 ) ) ( SURFACE-AT ?auto_13241 ?auto_13243 ) ( ON ?auto_13241 ?auto_13249 ) ( CLEAR ?auto_13241 ) ( not ( = ?auto_13240 ?auto_13249 ) ) ( not ( = ?auto_13241 ?auto_13249 ) ) ( not ( = ?auto_13239 ?auto_13249 ) ) ( IS-CRATE ?auto_13240 ) ( AVAILABLE ?auto_13250 ) ( SURFACE-AT ?auto_13240 ?auto_13243 ) ( ON ?auto_13240 ?auto_13242 ) ( CLEAR ?auto_13240 ) ( not ( = ?auto_13240 ?auto_13242 ) ) ( not ( = ?auto_13241 ?auto_13242 ) ) ( not ( = ?auto_13239 ?auto_13242 ) ) ( not ( = ?auto_13249 ?auto_13242 ) ) ( IS-CRATE ?auto_13239 ) ( not ( = ?auto_13252 ?auto_13239 ) ) ( not ( = ?auto_13240 ?auto_13252 ) ) ( not ( = ?auto_13241 ?auto_13252 ) ) ( not ( = ?auto_13249 ?auto_13252 ) ) ( not ( = ?auto_13242 ?auto_13252 ) ) ( not ( = ?auto_13246 ?auto_13247 ) ) ( not ( = ?auto_13243 ?auto_13246 ) ) ( HOIST-AT ?auto_13244 ?auto_13246 ) ( not ( = ?auto_13251 ?auto_13244 ) ) ( not ( = ?auto_13250 ?auto_13244 ) ) ( AVAILABLE ?auto_13244 ) ( SURFACE-AT ?auto_13239 ?auto_13246 ) ( ON ?auto_13239 ?auto_13253 ) ( CLEAR ?auto_13239 ) ( not ( = ?auto_13240 ?auto_13253 ) ) ( not ( = ?auto_13241 ?auto_13253 ) ) ( not ( = ?auto_13239 ?auto_13253 ) ) ( not ( = ?auto_13249 ?auto_13253 ) ) ( not ( = ?auto_13242 ?auto_13253 ) ) ( not ( = ?auto_13252 ?auto_13253 ) ) ( TRUCK-AT ?auto_13248 ?auto_13247 ) ( SURFACE-AT ?auto_13245 ?auto_13247 ) ( CLEAR ?auto_13245 ) ( IS-CRATE ?auto_13252 ) ( not ( = ?auto_13245 ?auto_13252 ) ) ( not ( = ?auto_13240 ?auto_13245 ) ) ( not ( = ?auto_13241 ?auto_13245 ) ) ( not ( = ?auto_13239 ?auto_13245 ) ) ( not ( = ?auto_13249 ?auto_13245 ) ) ( not ( = ?auto_13242 ?auto_13245 ) ) ( not ( = ?auto_13253 ?auto_13245 ) ) ( AVAILABLE ?auto_13251 ) ( IN ?auto_13252 ?auto_13248 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13240 ?auto_13241 )
      ( MAKE-2CRATE-VERIFY ?auto_13239 ?auto_13240 ?auto_13241 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13254 - SURFACE
      ?auto_13255 - SURFACE
      ?auto_13256 - SURFACE
      ?auto_13257 - SURFACE
    )
    :vars
    (
      ?auto_13263 - HOIST
      ?auto_13264 - PLACE
      ?auto_13259 - PLACE
      ?auto_13262 - HOIST
      ?auto_13265 - SURFACE
      ?auto_13261 - SURFACE
      ?auto_13268 - PLACE
      ?auto_13266 - HOIST
      ?auto_13258 - SURFACE
      ?auto_13260 - TRUCK
      ?auto_13267 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13263 ?auto_13264 ) ( IS-CRATE ?auto_13257 ) ( not ( = ?auto_13256 ?auto_13257 ) ) ( not ( = ?auto_13255 ?auto_13256 ) ) ( not ( = ?auto_13255 ?auto_13257 ) ) ( not ( = ?auto_13259 ?auto_13264 ) ) ( HOIST-AT ?auto_13262 ?auto_13259 ) ( not ( = ?auto_13263 ?auto_13262 ) ) ( SURFACE-AT ?auto_13257 ?auto_13259 ) ( ON ?auto_13257 ?auto_13265 ) ( CLEAR ?auto_13257 ) ( not ( = ?auto_13256 ?auto_13265 ) ) ( not ( = ?auto_13257 ?auto_13265 ) ) ( not ( = ?auto_13255 ?auto_13265 ) ) ( IS-CRATE ?auto_13256 ) ( AVAILABLE ?auto_13262 ) ( SURFACE-AT ?auto_13256 ?auto_13259 ) ( ON ?auto_13256 ?auto_13261 ) ( CLEAR ?auto_13256 ) ( not ( = ?auto_13256 ?auto_13261 ) ) ( not ( = ?auto_13257 ?auto_13261 ) ) ( not ( = ?auto_13255 ?auto_13261 ) ) ( not ( = ?auto_13265 ?auto_13261 ) ) ( IS-CRATE ?auto_13255 ) ( not ( = ?auto_13254 ?auto_13255 ) ) ( not ( = ?auto_13256 ?auto_13254 ) ) ( not ( = ?auto_13257 ?auto_13254 ) ) ( not ( = ?auto_13265 ?auto_13254 ) ) ( not ( = ?auto_13261 ?auto_13254 ) ) ( not ( = ?auto_13268 ?auto_13264 ) ) ( not ( = ?auto_13259 ?auto_13268 ) ) ( HOIST-AT ?auto_13266 ?auto_13268 ) ( not ( = ?auto_13263 ?auto_13266 ) ) ( not ( = ?auto_13262 ?auto_13266 ) ) ( AVAILABLE ?auto_13266 ) ( SURFACE-AT ?auto_13255 ?auto_13268 ) ( ON ?auto_13255 ?auto_13258 ) ( CLEAR ?auto_13255 ) ( not ( = ?auto_13256 ?auto_13258 ) ) ( not ( = ?auto_13257 ?auto_13258 ) ) ( not ( = ?auto_13255 ?auto_13258 ) ) ( not ( = ?auto_13265 ?auto_13258 ) ) ( not ( = ?auto_13261 ?auto_13258 ) ) ( not ( = ?auto_13254 ?auto_13258 ) ) ( TRUCK-AT ?auto_13260 ?auto_13264 ) ( SURFACE-AT ?auto_13267 ?auto_13264 ) ( CLEAR ?auto_13267 ) ( IS-CRATE ?auto_13254 ) ( not ( = ?auto_13267 ?auto_13254 ) ) ( not ( = ?auto_13256 ?auto_13267 ) ) ( not ( = ?auto_13257 ?auto_13267 ) ) ( not ( = ?auto_13255 ?auto_13267 ) ) ( not ( = ?auto_13265 ?auto_13267 ) ) ( not ( = ?auto_13261 ?auto_13267 ) ) ( not ( = ?auto_13258 ?auto_13267 ) ) ( AVAILABLE ?auto_13263 ) ( IN ?auto_13254 ?auto_13260 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13255 ?auto_13256 ?auto_13257 )
      ( MAKE-3CRATE-VERIFY ?auto_13254 ?auto_13255 ?auto_13256 ?auto_13257 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13269 - SURFACE
      ?auto_13270 - SURFACE
      ?auto_13271 - SURFACE
      ?auto_13272 - SURFACE
      ?auto_13273 - SURFACE
    )
    :vars
    (
      ?auto_13279 - HOIST
      ?auto_13280 - PLACE
      ?auto_13275 - PLACE
      ?auto_13278 - HOIST
      ?auto_13281 - SURFACE
      ?auto_13277 - SURFACE
      ?auto_13283 - PLACE
      ?auto_13282 - HOIST
      ?auto_13274 - SURFACE
      ?auto_13276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13279 ?auto_13280 ) ( IS-CRATE ?auto_13273 ) ( not ( = ?auto_13272 ?auto_13273 ) ) ( not ( = ?auto_13271 ?auto_13272 ) ) ( not ( = ?auto_13271 ?auto_13273 ) ) ( not ( = ?auto_13275 ?auto_13280 ) ) ( HOIST-AT ?auto_13278 ?auto_13275 ) ( not ( = ?auto_13279 ?auto_13278 ) ) ( SURFACE-AT ?auto_13273 ?auto_13275 ) ( ON ?auto_13273 ?auto_13281 ) ( CLEAR ?auto_13273 ) ( not ( = ?auto_13272 ?auto_13281 ) ) ( not ( = ?auto_13273 ?auto_13281 ) ) ( not ( = ?auto_13271 ?auto_13281 ) ) ( IS-CRATE ?auto_13272 ) ( AVAILABLE ?auto_13278 ) ( SURFACE-AT ?auto_13272 ?auto_13275 ) ( ON ?auto_13272 ?auto_13277 ) ( CLEAR ?auto_13272 ) ( not ( = ?auto_13272 ?auto_13277 ) ) ( not ( = ?auto_13273 ?auto_13277 ) ) ( not ( = ?auto_13271 ?auto_13277 ) ) ( not ( = ?auto_13281 ?auto_13277 ) ) ( IS-CRATE ?auto_13271 ) ( not ( = ?auto_13270 ?auto_13271 ) ) ( not ( = ?auto_13272 ?auto_13270 ) ) ( not ( = ?auto_13273 ?auto_13270 ) ) ( not ( = ?auto_13281 ?auto_13270 ) ) ( not ( = ?auto_13277 ?auto_13270 ) ) ( not ( = ?auto_13283 ?auto_13280 ) ) ( not ( = ?auto_13275 ?auto_13283 ) ) ( HOIST-AT ?auto_13282 ?auto_13283 ) ( not ( = ?auto_13279 ?auto_13282 ) ) ( not ( = ?auto_13278 ?auto_13282 ) ) ( AVAILABLE ?auto_13282 ) ( SURFACE-AT ?auto_13271 ?auto_13283 ) ( ON ?auto_13271 ?auto_13274 ) ( CLEAR ?auto_13271 ) ( not ( = ?auto_13272 ?auto_13274 ) ) ( not ( = ?auto_13273 ?auto_13274 ) ) ( not ( = ?auto_13271 ?auto_13274 ) ) ( not ( = ?auto_13281 ?auto_13274 ) ) ( not ( = ?auto_13277 ?auto_13274 ) ) ( not ( = ?auto_13270 ?auto_13274 ) ) ( TRUCK-AT ?auto_13276 ?auto_13280 ) ( SURFACE-AT ?auto_13269 ?auto_13280 ) ( CLEAR ?auto_13269 ) ( IS-CRATE ?auto_13270 ) ( not ( = ?auto_13269 ?auto_13270 ) ) ( not ( = ?auto_13272 ?auto_13269 ) ) ( not ( = ?auto_13273 ?auto_13269 ) ) ( not ( = ?auto_13271 ?auto_13269 ) ) ( not ( = ?auto_13281 ?auto_13269 ) ) ( not ( = ?auto_13277 ?auto_13269 ) ) ( not ( = ?auto_13274 ?auto_13269 ) ) ( AVAILABLE ?auto_13279 ) ( IN ?auto_13270 ?auto_13276 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13271 ?auto_13272 ?auto_13273 )
      ( MAKE-4CRATE-VERIFY ?auto_13269 ?auto_13270 ?auto_13271 ?auto_13272 ?auto_13273 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13284 - SURFACE
      ?auto_13285 - SURFACE
    )
    :vars
    (
      ?auto_13292 - HOIST
      ?auto_13293 - PLACE
      ?auto_13289 - SURFACE
      ?auto_13287 - PLACE
      ?auto_13291 - HOIST
      ?auto_13294 - SURFACE
      ?auto_13290 - SURFACE
      ?auto_13298 - SURFACE
      ?auto_13297 - PLACE
      ?auto_13295 - HOIST
      ?auto_13286 - SURFACE
      ?auto_13296 - SURFACE
      ?auto_13288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13292 ?auto_13293 ) ( IS-CRATE ?auto_13285 ) ( not ( = ?auto_13284 ?auto_13285 ) ) ( not ( = ?auto_13289 ?auto_13284 ) ) ( not ( = ?auto_13289 ?auto_13285 ) ) ( not ( = ?auto_13287 ?auto_13293 ) ) ( HOIST-AT ?auto_13291 ?auto_13287 ) ( not ( = ?auto_13292 ?auto_13291 ) ) ( SURFACE-AT ?auto_13285 ?auto_13287 ) ( ON ?auto_13285 ?auto_13294 ) ( CLEAR ?auto_13285 ) ( not ( = ?auto_13284 ?auto_13294 ) ) ( not ( = ?auto_13285 ?auto_13294 ) ) ( not ( = ?auto_13289 ?auto_13294 ) ) ( IS-CRATE ?auto_13284 ) ( AVAILABLE ?auto_13291 ) ( SURFACE-AT ?auto_13284 ?auto_13287 ) ( ON ?auto_13284 ?auto_13290 ) ( CLEAR ?auto_13284 ) ( not ( = ?auto_13284 ?auto_13290 ) ) ( not ( = ?auto_13285 ?auto_13290 ) ) ( not ( = ?auto_13289 ?auto_13290 ) ) ( not ( = ?auto_13294 ?auto_13290 ) ) ( IS-CRATE ?auto_13289 ) ( not ( = ?auto_13298 ?auto_13289 ) ) ( not ( = ?auto_13284 ?auto_13298 ) ) ( not ( = ?auto_13285 ?auto_13298 ) ) ( not ( = ?auto_13294 ?auto_13298 ) ) ( not ( = ?auto_13290 ?auto_13298 ) ) ( not ( = ?auto_13297 ?auto_13293 ) ) ( not ( = ?auto_13287 ?auto_13297 ) ) ( HOIST-AT ?auto_13295 ?auto_13297 ) ( not ( = ?auto_13292 ?auto_13295 ) ) ( not ( = ?auto_13291 ?auto_13295 ) ) ( AVAILABLE ?auto_13295 ) ( SURFACE-AT ?auto_13289 ?auto_13297 ) ( ON ?auto_13289 ?auto_13286 ) ( CLEAR ?auto_13289 ) ( not ( = ?auto_13284 ?auto_13286 ) ) ( not ( = ?auto_13285 ?auto_13286 ) ) ( not ( = ?auto_13289 ?auto_13286 ) ) ( not ( = ?auto_13294 ?auto_13286 ) ) ( not ( = ?auto_13290 ?auto_13286 ) ) ( not ( = ?auto_13298 ?auto_13286 ) ) ( SURFACE-AT ?auto_13296 ?auto_13293 ) ( CLEAR ?auto_13296 ) ( IS-CRATE ?auto_13298 ) ( not ( = ?auto_13296 ?auto_13298 ) ) ( not ( = ?auto_13284 ?auto_13296 ) ) ( not ( = ?auto_13285 ?auto_13296 ) ) ( not ( = ?auto_13289 ?auto_13296 ) ) ( not ( = ?auto_13294 ?auto_13296 ) ) ( not ( = ?auto_13290 ?auto_13296 ) ) ( not ( = ?auto_13286 ?auto_13296 ) ) ( AVAILABLE ?auto_13292 ) ( IN ?auto_13298 ?auto_13288 ) ( TRUCK-AT ?auto_13288 ?auto_13287 ) )
    :subtasks
    ( ( !DRIVE ?auto_13288 ?auto_13287 ?auto_13293 )
      ( MAKE-2CRATE ?auto_13289 ?auto_13284 ?auto_13285 )
      ( MAKE-1CRATE-VERIFY ?auto_13284 ?auto_13285 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13299 - SURFACE
      ?auto_13300 - SURFACE
      ?auto_13301 - SURFACE
    )
    :vars
    (
      ?auto_13304 - HOIST
      ?auto_13313 - PLACE
      ?auto_13306 - PLACE
      ?auto_13302 - HOIST
      ?auto_13311 - SURFACE
      ?auto_13307 - SURFACE
      ?auto_13305 - SURFACE
      ?auto_13309 - PLACE
      ?auto_13312 - HOIST
      ?auto_13308 - SURFACE
      ?auto_13303 - SURFACE
      ?auto_13310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13304 ?auto_13313 ) ( IS-CRATE ?auto_13301 ) ( not ( = ?auto_13300 ?auto_13301 ) ) ( not ( = ?auto_13299 ?auto_13300 ) ) ( not ( = ?auto_13299 ?auto_13301 ) ) ( not ( = ?auto_13306 ?auto_13313 ) ) ( HOIST-AT ?auto_13302 ?auto_13306 ) ( not ( = ?auto_13304 ?auto_13302 ) ) ( SURFACE-AT ?auto_13301 ?auto_13306 ) ( ON ?auto_13301 ?auto_13311 ) ( CLEAR ?auto_13301 ) ( not ( = ?auto_13300 ?auto_13311 ) ) ( not ( = ?auto_13301 ?auto_13311 ) ) ( not ( = ?auto_13299 ?auto_13311 ) ) ( IS-CRATE ?auto_13300 ) ( AVAILABLE ?auto_13302 ) ( SURFACE-AT ?auto_13300 ?auto_13306 ) ( ON ?auto_13300 ?auto_13307 ) ( CLEAR ?auto_13300 ) ( not ( = ?auto_13300 ?auto_13307 ) ) ( not ( = ?auto_13301 ?auto_13307 ) ) ( not ( = ?auto_13299 ?auto_13307 ) ) ( not ( = ?auto_13311 ?auto_13307 ) ) ( IS-CRATE ?auto_13299 ) ( not ( = ?auto_13305 ?auto_13299 ) ) ( not ( = ?auto_13300 ?auto_13305 ) ) ( not ( = ?auto_13301 ?auto_13305 ) ) ( not ( = ?auto_13311 ?auto_13305 ) ) ( not ( = ?auto_13307 ?auto_13305 ) ) ( not ( = ?auto_13309 ?auto_13313 ) ) ( not ( = ?auto_13306 ?auto_13309 ) ) ( HOIST-AT ?auto_13312 ?auto_13309 ) ( not ( = ?auto_13304 ?auto_13312 ) ) ( not ( = ?auto_13302 ?auto_13312 ) ) ( AVAILABLE ?auto_13312 ) ( SURFACE-AT ?auto_13299 ?auto_13309 ) ( ON ?auto_13299 ?auto_13308 ) ( CLEAR ?auto_13299 ) ( not ( = ?auto_13300 ?auto_13308 ) ) ( not ( = ?auto_13301 ?auto_13308 ) ) ( not ( = ?auto_13299 ?auto_13308 ) ) ( not ( = ?auto_13311 ?auto_13308 ) ) ( not ( = ?auto_13307 ?auto_13308 ) ) ( not ( = ?auto_13305 ?auto_13308 ) ) ( SURFACE-AT ?auto_13303 ?auto_13313 ) ( CLEAR ?auto_13303 ) ( IS-CRATE ?auto_13305 ) ( not ( = ?auto_13303 ?auto_13305 ) ) ( not ( = ?auto_13300 ?auto_13303 ) ) ( not ( = ?auto_13301 ?auto_13303 ) ) ( not ( = ?auto_13299 ?auto_13303 ) ) ( not ( = ?auto_13311 ?auto_13303 ) ) ( not ( = ?auto_13307 ?auto_13303 ) ) ( not ( = ?auto_13308 ?auto_13303 ) ) ( AVAILABLE ?auto_13304 ) ( IN ?auto_13305 ?auto_13310 ) ( TRUCK-AT ?auto_13310 ?auto_13306 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13300 ?auto_13301 )
      ( MAKE-2CRATE-VERIFY ?auto_13299 ?auto_13300 ?auto_13301 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13314 - SURFACE
      ?auto_13315 - SURFACE
      ?auto_13316 - SURFACE
      ?auto_13317 - SURFACE
    )
    :vars
    (
      ?auto_13328 - HOIST
      ?auto_13326 - PLACE
      ?auto_13327 - PLACE
      ?auto_13325 - HOIST
      ?auto_13318 - SURFACE
      ?auto_13323 - SURFACE
      ?auto_13322 - PLACE
      ?auto_13320 - HOIST
      ?auto_13321 - SURFACE
      ?auto_13319 - SURFACE
      ?auto_13324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13328 ?auto_13326 ) ( IS-CRATE ?auto_13317 ) ( not ( = ?auto_13316 ?auto_13317 ) ) ( not ( = ?auto_13315 ?auto_13316 ) ) ( not ( = ?auto_13315 ?auto_13317 ) ) ( not ( = ?auto_13327 ?auto_13326 ) ) ( HOIST-AT ?auto_13325 ?auto_13327 ) ( not ( = ?auto_13328 ?auto_13325 ) ) ( SURFACE-AT ?auto_13317 ?auto_13327 ) ( ON ?auto_13317 ?auto_13318 ) ( CLEAR ?auto_13317 ) ( not ( = ?auto_13316 ?auto_13318 ) ) ( not ( = ?auto_13317 ?auto_13318 ) ) ( not ( = ?auto_13315 ?auto_13318 ) ) ( IS-CRATE ?auto_13316 ) ( AVAILABLE ?auto_13325 ) ( SURFACE-AT ?auto_13316 ?auto_13327 ) ( ON ?auto_13316 ?auto_13323 ) ( CLEAR ?auto_13316 ) ( not ( = ?auto_13316 ?auto_13323 ) ) ( not ( = ?auto_13317 ?auto_13323 ) ) ( not ( = ?auto_13315 ?auto_13323 ) ) ( not ( = ?auto_13318 ?auto_13323 ) ) ( IS-CRATE ?auto_13315 ) ( not ( = ?auto_13314 ?auto_13315 ) ) ( not ( = ?auto_13316 ?auto_13314 ) ) ( not ( = ?auto_13317 ?auto_13314 ) ) ( not ( = ?auto_13318 ?auto_13314 ) ) ( not ( = ?auto_13323 ?auto_13314 ) ) ( not ( = ?auto_13322 ?auto_13326 ) ) ( not ( = ?auto_13327 ?auto_13322 ) ) ( HOIST-AT ?auto_13320 ?auto_13322 ) ( not ( = ?auto_13328 ?auto_13320 ) ) ( not ( = ?auto_13325 ?auto_13320 ) ) ( AVAILABLE ?auto_13320 ) ( SURFACE-AT ?auto_13315 ?auto_13322 ) ( ON ?auto_13315 ?auto_13321 ) ( CLEAR ?auto_13315 ) ( not ( = ?auto_13316 ?auto_13321 ) ) ( not ( = ?auto_13317 ?auto_13321 ) ) ( not ( = ?auto_13315 ?auto_13321 ) ) ( not ( = ?auto_13318 ?auto_13321 ) ) ( not ( = ?auto_13323 ?auto_13321 ) ) ( not ( = ?auto_13314 ?auto_13321 ) ) ( SURFACE-AT ?auto_13319 ?auto_13326 ) ( CLEAR ?auto_13319 ) ( IS-CRATE ?auto_13314 ) ( not ( = ?auto_13319 ?auto_13314 ) ) ( not ( = ?auto_13316 ?auto_13319 ) ) ( not ( = ?auto_13317 ?auto_13319 ) ) ( not ( = ?auto_13315 ?auto_13319 ) ) ( not ( = ?auto_13318 ?auto_13319 ) ) ( not ( = ?auto_13323 ?auto_13319 ) ) ( not ( = ?auto_13321 ?auto_13319 ) ) ( AVAILABLE ?auto_13328 ) ( IN ?auto_13314 ?auto_13324 ) ( TRUCK-AT ?auto_13324 ?auto_13327 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13315 ?auto_13316 ?auto_13317 )
      ( MAKE-3CRATE-VERIFY ?auto_13314 ?auto_13315 ?auto_13316 ?auto_13317 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13329 - SURFACE
      ?auto_13330 - SURFACE
      ?auto_13331 - SURFACE
      ?auto_13332 - SURFACE
      ?auto_13333 - SURFACE
    )
    :vars
    (
      ?auto_13343 - HOIST
      ?auto_13341 - PLACE
      ?auto_13342 - PLACE
      ?auto_13340 - HOIST
      ?auto_13334 - SURFACE
      ?auto_13338 - SURFACE
      ?auto_13337 - PLACE
      ?auto_13335 - HOIST
      ?auto_13336 - SURFACE
      ?auto_13339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13343 ?auto_13341 ) ( IS-CRATE ?auto_13333 ) ( not ( = ?auto_13332 ?auto_13333 ) ) ( not ( = ?auto_13331 ?auto_13332 ) ) ( not ( = ?auto_13331 ?auto_13333 ) ) ( not ( = ?auto_13342 ?auto_13341 ) ) ( HOIST-AT ?auto_13340 ?auto_13342 ) ( not ( = ?auto_13343 ?auto_13340 ) ) ( SURFACE-AT ?auto_13333 ?auto_13342 ) ( ON ?auto_13333 ?auto_13334 ) ( CLEAR ?auto_13333 ) ( not ( = ?auto_13332 ?auto_13334 ) ) ( not ( = ?auto_13333 ?auto_13334 ) ) ( not ( = ?auto_13331 ?auto_13334 ) ) ( IS-CRATE ?auto_13332 ) ( AVAILABLE ?auto_13340 ) ( SURFACE-AT ?auto_13332 ?auto_13342 ) ( ON ?auto_13332 ?auto_13338 ) ( CLEAR ?auto_13332 ) ( not ( = ?auto_13332 ?auto_13338 ) ) ( not ( = ?auto_13333 ?auto_13338 ) ) ( not ( = ?auto_13331 ?auto_13338 ) ) ( not ( = ?auto_13334 ?auto_13338 ) ) ( IS-CRATE ?auto_13331 ) ( not ( = ?auto_13330 ?auto_13331 ) ) ( not ( = ?auto_13332 ?auto_13330 ) ) ( not ( = ?auto_13333 ?auto_13330 ) ) ( not ( = ?auto_13334 ?auto_13330 ) ) ( not ( = ?auto_13338 ?auto_13330 ) ) ( not ( = ?auto_13337 ?auto_13341 ) ) ( not ( = ?auto_13342 ?auto_13337 ) ) ( HOIST-AT ?auto_13335 ?auto_13337 ) ( not ( = ?auto_13343 ?auto_13335 ) ) ( not ( = ?auto_13340 ?auto_13335 ) ) ( AVAILABLE ?auto_13335 ) ( SURFACE-AT ?auto_13331 ?auto_13337 ) ( ON ?auto_13331 ?auto_13336 ) ( CLEAR ?auto_13331 ) ( not ( = ?auto_13332 ?auto_13336 ) ) ( not ( = ?auto_13333 ?auto_13336 ) ) ( not ( = ?auto_13331 ?auto_13336 ) ) ( not ( = ?auto_13334 ?auto_13336 ) ) ( not ( = ?auto_13338 ?auto_13336 ) ) ( not ( = ?auto_13330 ?auto_13336 ) ) ( SURFACE-AT ?auto_13329 ?auto_13341 ) ( CLEAR ?auto_13329 ) ( IS-CRATE ?auto_13330 ) ( not ( = ?auto_13329 ?auto_13330 ) ) ( not ( = ?auto_13332 ?auto_13329 ) ) ( not ( = ?auto_13333 ?auto_13329 ) ) ( not ( = ?auto_13331 ?auto_13329 ) ) ( not ( = ?auto_13334 ?auto_13329 ) ) ( not ( = ?auto_13338 ?auto_13329 ) ) ( not ( = ?auto_13336 ?auto_13329 ) ) ( AVAILABLE ?auto_13343 ) ( IN ?auto_13330 ?auto_13339 ) ( TRUCK-AT ?auto_13339 ?auto_13342 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13331 ?auto_13332 ?auto_13333 )
      ( MAKE-4CRATE-VERIFY ?auto_13329 ?auto_13330 ?auto_13331 ?auto_13332 ?auto_13333 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13344 - SURFACE
      ?auto_13345 - SURFACE
    )
    :vars
    (
      ?auto_13357 - HOIST
      ?auto_13354 - PLACE
      ?auto_13358 - SURFACE
      ?auto_13355 - PLACE
      ?auto_13353 - HOIST
      ?auto_13346 - SURFACE
      ?auto_13351 - SURFACE
      ?auto_13356 - SURFACE
      ?auto_13350 - PLACE
      ?auto_13348 - HOIST
      ?auto_13349 - SURFACE
      ?auto_13347 - SURFACE
      ?auto_13352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13357 ?auto_13354 ) ( IS-CRATE ?auto_13345 ) ( not ( = ?auto_13344 ?auto_13345 ) ) ( not ( = ?auto_13358 ?auto_13344 ) ) ( not ( = ?auto_13358 ?auto_13345 ) ) ( not ( = ?auto_13355 ?auto_13354 ) ) ( HOIST-AT ?auto_13353 ?auto_13355 ) ( not ( = ?auto_13357 ?auto_13353 ) ) ( SURFACE-AT ?auto_13345 ?auto_13355 ) ( ON ?auto_13345 ?auto_13346 ) ( CLEAR ?auto_13345 ) ( not ( = ?auto_13344 ?auto_13346 ) ) ( not ( = ?auto_13345 ?auto_13346 ) ) ( not ( = ?auto_13358 ?auto_13346 ) ) ( IS-CRATE ?auto_13344 ) ( SURFACE-AT ?auto_13344 ?auto_13355 ) ( ON ?auto_13344 ?auto_13351 ) ( CLEAR ?auto_13344 ) ( not ( = ?auto_13344 ?auto_13351 ) ) ( not ( = ?auto_13345 ?auto_13351 ) ) ( not ( = ?auto_13358 ?auto_13351 ) ) ( not ( = ?auto_13346 ?auto_13351 ) ) ( IS-CRATE ?auto_13358 ) ( not ( = ?auto_13356 ?auto_13358 ) ) ( not ( = ?auto_13344 ?auto_13356 ) ) ( not ( = ?auto_13345 ?auto_13356 ) ) ( not ( = ?auto_13346 ?auto_13356 ) ) ( not ( = ?auto_13351 ?auto_13356 ) ) ( not ( = ?auto_13350 ?auto_13354 ) ) ( not ( = ?auto_13355 ?auto_13350 ) ) ( HOIST-AT ?auto_13348 ?auto_13350 ) ( not ( = ?auto_13357 ?auto_13348 ) ) ( not ( = ?auto_13353 ?auto_13348 ) ) ( AVAILABLE ?auto_13348 ) ( SURFACE-AT ?auto_13358 ?auto_13350 ) ( ON ?auto_13358 ?auto_13349 ) ( CLEAR ?auto_13358 ) ( not ( = ?auto_13344 ?auto_13349 ) ) ( not ( = ?auto_13345 ?auto_13349 ) ) ( not ( = ?auto_13358 ?auto_13349 ) ) ( not ( = ?auto_13346 ?auto_13349 ) ) ( not ( = ?auto_13351 ?auto_13349 ) ) ( not ( = ?auto_13356 ?auto_13349 ) ) ( SURFACE-AT ?auto_13347 ?auto_13354 ) ( CLEAR ?auto_13347 ) ( IS-CRATE ?auto_13356 ) ( not ( = ?auto_13347 ?auto_13356 ) ) ( not ( = ?auto_13344 ?auto_13347 ) ) ( not ( = ?auto_13345 ?auto_13347 ) ) ( not ( = ?auto_13358 ?auto_13347 ) ) ( not ( = ?auto_13346 ?auto_13347 ) ) ( not ( = ?auto_13351 ?auto_13347 ) ) ( not ( = ?auto_13349 ?auto_13347 ) ) ( AVAILABLE ?auto_13357 ) ( TRUCK-AT ?auto_13352 ?auto_13355 ) ( LIFTING ?auto_13353 ?auto_13356 ) )
    :subtasks
    ( ( !LOAD ?auto_13353 ?auto_13356 ?auto_13352 ?auto_13355 )
      ( MAKE-2CRATE ?auto_13358 ?auto_13344 ?auto_13345 )
      ( MAKE-1CRATE-VERIFY ?auto_13344 ?auto_13345 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13359 - SURFACE
      ?auto_13360 - SURFACE
      ?auto_13361 - SURFACE
    )
    :vars
    (
      ?auto_13366 - HOIST
      ?auto_13365 - PLACE
      ?auto_13364 - PLACE
      ?auto_13367 - HOIST
      ?auto_13362 - SURFACE
      ?auto_13369 - SURFACE
      ?auto_13368 - SURFACE
      ?auto_13363 - PLACE
      ?auto_13372 - HOIST
      ?auto_13370 - SURFACE
      ?auto_13373 - SURFACE
      ?auto_13371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13366 ?auto_13365 ) ( IS-CRATE ?auto_13361 ) ( not ( = ?auto_13360 ?auto_13361 ) ) ( not ( = ?auto_13359 ?auto_13360 ) ) ( not ( = ?auto_13359 ?auto_13361 ) ) ( not ( = ?auto_13364 ?auto_13365 ) ) ( HOIST-AT ?auto_13367 ?auto_13364 ) ( not ( = ?auto_13366 ?auto_13367 ) ) ( SURFACE-AT ?auto_13361 ?auto_13364 ) ( ON ?auto_13361 ?auto_13362 ) ( CLEAR ?auto_13361 ) ( not ( = ?auto_13360 ?auto_13362 ) ) ( not ( = ?auto_13361 ?auto_13362 ) ) ( not ( = ?auto_13359 ?auto_13362 ) ) ( IS-CRATE ?auto_13360 ) ( SURFACE-AT ?auto_13360 ?auto_13364 ) ( ON ?auto_13360 ?auto_13369 ) ( CLEAR ?auto_13360 ) ( not ( = ?auto_13360 ?auto_13369 ) ) ( not ( = ?auto_13361 ?auto_13369 ) ) ( not ( = ?auto_13359 ?auto_13369 ) ) ( not ( = ?auto_13362 ?auto_13369 ) ) ( IS-CRATE ?auto_13359 ) ( not ( = ?auto_13368 ?auto_13359 ) ) ( not ( = ?auto_13360 ?auto_13368 ) ) ( not ( = ?auto_13361 ?auto_13368 ) ) ( not ( = ?auto_13362 ?auto_13368 ) ) ( not ( = ?auto_13369 ?auto_13368 ) ) ( not ( = ?auto_13363 ?auto_13365 ) ) ( not ( = ?auto_13364 ?auto_13363 ) ) ( HOIST-AT ?auto_13372 ?auto_13363 ) ( not ( = ?auto_13366 ?auto_13372 ) ) ( not ( = ?auto_13367 ?auto_13372 ) ) ( AVAILABLE ?auto_13372 ) ( SURFACE-AT ?auto_13359 ?auto_13363 ) ( ON ?auto_13359 ?auto_13370 ) ( CLEAR ?auto_13359 ) ( not ( = ?auto_13360 ?auto_13370 ) ) ( not ( = ?auto_13361 ?auto_13370 ) ) ( not ( = ?auto_13359 ?auto_13370 ) ) ( not ( = ?auto_13362 ?auto_13370 ) ) ( not ( = ?auto_13369 ?auto_13370 ) ) ( not ( = ?auto_13368 ?auto_13370 ) ) ( SURFACE-AT ?auto_13373 ?auto_13365 ) ( CLEAR ?auto_13373 ) ( IS-CRATE ?auto_13368 ) ( not ( = ?auto_13373 ?auto_13368 ) ) ( not ( = ?auto_13360 ?auto_13373 ) ) ( not ( = ?auto_13361 ?auto_13373 ) ) ( not ( = ?auto_13359 ?auto_13373 ) ) ( not ( = ?auto_13362 ?auto_13373 ) ) ( not ( = ?auto_13369 ?auto_13373 ) ) ( not ( = ?auto_13370 ?auto_13373 ) ) ( AVAILABLE ?auto_13366 ) ( TRUCK-AT ?auto_13371 ?auto_13364 ) ( LIFTING ?auto_13367 ?auto_13368 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13360 ?auto_13361 )
      ( MAKE-2CRATE-VERIFY ?auto_13359 ?auto_13360 ?auto_13361 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13374 - SURFACE
      ?auto_13375 - SURFACE
      ?auto_13376 - SURFACE
      ?auto_13377 - SURFACE
    )
    :vars
    (
      ?auto_13387 - HOIST
      ?auto_13383 - PLACE
      ?auto_13380 - PLACE
      ?auto_13384 - HOIST
      ?auto_13381 - SURFACE
      ?auto_13388 - SURFACE
      ?auto_13386 - PLACE
      ?auto_13385 - HOIST
      ?auto_13382 - SURFACE
      ?auto_13378 - SURFACE
      ?auto_13379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13387 ?auto_13383 ) ( IS-CRATE ?auto_13377 ) ( not ( = ?auto_13376 ?auto_13377 ) ) ( not ( = ?auto_13375 ?auto_13376 ) ) ( not ( = ?auto_13375 ?auto_13377 ) ) ( not ( = ?auto_13380 ?auto_13383 ) ) ( HOIST-AT ?auto_13384 ?auto_13380 ) ( not ( = ?auto_13387 ?auto_13384 ) ) ( SURFACE-AT ?auto_13377 ?auto_13380 ) ( ON ?auto_13377 ?auto_13381 ) ( CLEAR ?auto_13377 ) ( not ( = ?auto_13376 ?auto_13381 ) ) ( not ( = ?auto_13377 ?auto_13381 ) ) ( not ( = ?auto_13375 ?auto_13381 ) ) ( IS-CRATE ?auto_13376 ) ( SURFACE-AT ?auto_13376 ?auto_13380 ) ( ON ?auto_13376 ?auto_13388 ) ( CLEAR ?auto_13376 ) ( not ( = ?auto_13376 ?auto_13388 ) ) ( not ( = ?auto_13377 ?auto_13388 ) ) ( not ( = ?auto_13375 ?auto_13388 ) ) ( not ( = ?auto_13381 ?auto_13388 ) ) ( IS-CRATE ?auto_13375 ) ( not ( = ?auto_13374 ?auto_13375 ) ) ( not ( = ?auto_13376 ?auto_13374 ) ) ( not ( = ?auto_13377 ?auto_13374 ) ) ( not ( = ?auto_13381 ?auto_13374 ) ) ( not ( = ?auto_13388 ?auto_13374 ) ) ( not ( = ?auto_13386 ?auto_13383 ) ) ( not ( = ?auto_13380 ?auto_13386 ) ) ( HOIST-AT ?auto_13385 ?auto_13386 ) ( not ( = ?auto_13387 ?auto_13385 ) ) ( not ( = ?auto_13384 ?auto_13385 ) ) ( AVAILABLE ?auto_13385 ) ( SURFACE-AT ?auto_13375 ?auto_13386 ) ( ON ?auto_13375 ?auto_13382 ) ( CLEAR ?auto_13375 ) ( not ( = ?auto_13376 ?auto_13382 ) ) ( not ( = ?auto_13377 ?auto_13382 ) ) ( not ( = ?auto_13375 ?auto_13382 ) ) ( not ( = ?auto_13381 ?auto_13382 ) ) ( not ( = ?auto_13388 ?auto_13382 ) ) ( not ( = ?auto_13374 ?auto_13382 ) ) ( SURFACE-AT ?auto_13378 ?auto_13383 ) ( CLEAR ?auto_13378 ) ( IS-CRATE ?auto_13374 ) ( not ( = ?auto_13378 ?auto_13374 ) ) ( not ( = ?auto_13376 ?auto_13378 ) ) ( not ( = ?auto_13377 ?auto_13378 ) ) ( not ( = ?auto_13375 ?auto_13378 ) ) ( not ( = ?auto_13381 ?auto_13378 ) ) ( not ( = ?auto_13388 ?auto_13378 ) ) ( not ( = ?auto_13382 ?auto_13378 ) ) ( AVAILABLE ?auto_13387 ) ( TRUCK-AT ?auto_13379 ?auto_13380 ) ( LIFTING ?auto_13384 ?auto_13374 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13375 ?auto_13376 ?auto_13377 )
      ( MAKE-3CRATE-VERIFY ?auto_13374 ?auto_13375 ?auto_13376 ?auto_13377 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13389 - SURFACE
      ?auto_13390 - SURFACE
      ?auto_13391 - SURFACE
      ?auto_13392 - SURFACE
      ?auto_13393 - SURFACE
    )
    :vars
    (
      ?auto_13402 - HOIST
      ?auto_13398 - PLACE
      ?auto_13395 - PLACE
      ?auto_13399 - HOIST
      ?auto_13396 - SURFACE
      ?auto_13403 - SURFACE
      ?auto_13401 - PLACE
      ?auto_13400 - HOIST
      ?auto_13397 - SURFACE
      ?auto_13394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13402 ?auto_13398 ) ( IS-CRATE ?auto_13393 ) ( not ( = ?auto_13392 ?auto_13393 ) ) ( not ( = ?auto_13391 ?auto_13392 ) ) ( not ( = ?auto_13391 ?auto_13393 ) ) ( not ( = ?auto_13395 ?auto_13398 ) ) ( HOIST-AT ?auto_13399 ?auto_13395 ) ( not ( = ?auto_13402 ?auto_13399 ) ) ( SURFACE-AT ?auto_13393 ?auto_13395 ) ( ON ?auto_13393 ?auto_13396 ) ( CLEAR ?auto_13393 ) ( not ( = ?auto_13392 ?auto_13396 ) ) ( not ( = ?auto_13393 ?auto_13396 ) ) ( not ( = ?auto_13391 ?auto_13396 ) ) ( IS-CRATE ?auto_13392 ) ( SURFACE-AT ?auto_13392 ?auto_13395 ) ( ON ?auto_13392 ?auto_13403 ) ( CLEAR ?auto_13392 ) ( not ( = ?auto_13392 ?auto_13403 ) ) ( not ( = ?auto_13393 ?auto_13403 ) ) ( not ( = ?auto_13391 ?auto_13403 ) ) ( not ( = ?auto_13396 ?auto_13403 ) ) ( IS-CRATE ?auto_13391 ) ( not ( = ?auto_13390 ?auto_13391 ) ) ( not ( = ?auto_13392 ?auto_13390 ) ) ( not ( = ?auto_13393 ?auto_13390 ) ) ( not ( = ?auto_13396 ?auto_13390 ) ) ( not ( = ?auto_13403 ?auto_13390 ) ) ( not ( = ?auto_13401 ?auto_13398 ) ) ( not ( = ?auto_13395 ?auto_13401 ) ) ( HOIST-AT ?auto_13400 ?auto_13401 ) ( not ( = ?auto_13402 ?auto_13400 ) ) ( not ( = ?auto_13399 ?auto_13400 ) ) ( AVAILABLE ?auto_13400 ) ( SURFACE-AT ?auto_13391 ?auto_13401 ) ( ON ?auto_13391 ?auto_13397 ) ( CLEAR ?auto_13391 ) ( not ( = ?auto_13392 ?auto_13397 ) ) ( not ( = ?auto_13393 ?auto_13397 ) ) ( not ( = ?auto_13391 ?auto_13397 ) ) ( not ( = ?auto_13396 ?auto_13397 ) ) ( not ( = ?auto_13403 ?auto_13397 ) ) ( not ( = ?auto_13390 ?auto_13397 ) ) ( SURFACE-AT ?auto_13389 ?auto_13398 ) ( CLEAR ?auto_13389 ) ( IS-CRATE ?auto_13390 ) ( not ( = ?auto_13389 ?auto_13390 ) ) ( not ( = ?auto_13392 ?auto_13389 ) ) ( not ( = ?auto_13393 ?auto_13389 ) ) ( not ( = ?auto_13391 ?auto_13389 ) ) ( not ( = ?auto_13396 ?auto_13389 ) ) ( not ( = ?auto_13403 ?auto_13389 ) ) ( not ( = ?auto_13397 ?auto_13389 ) ) ( AVAILABLE ?auto_13402 ) ( TRUCK-AT ?auto_13394 ?auto_13395 ) ( LIFTING ?auto_13399 ?auto_13390 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13391 ?auto_13392 ?auto_13393 )
      ( MAKE-4CRATE-VERIFY ?auto_13389 ?auto_13390 ?auto_13391 ?auto_13392 ?auto_13393 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13404 - SURFACE
      ?auto_13405 - SURFACE
    )
    :vars
    (
      ?auto_13416 - HOIST
      ?auto_13412 - PLACE
      ?auto_13418 - SURFACE
      ?auto_13408 - PLACE
      ?auto_13413 - HOIST
      ?auto_13409 - SURFACE
      ?auto_13417 - SURFACE
      ?auto_13410 - SURFACE
      ?auto_13415 - PLACE
      ?auto_13414 - HOIST
      ?auto_13411 - SURFACE
      ?auto_13406 - SURFACE
      ?auto_13407 - TRUCK
      ?auto_13419 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13416 ?auto_13412 ) ( IS-CRATE ?auto_13405 ) ( not ( = ?auto_13404 ?auto_13405 ) ) ( not ( = ?auto_13418 ?auto_13404 ) ) ( not ( = ?auto_13418 ?auto_13405 ) ) ( not ( = ?auto_13408 ?auto_13412 ) ) ( HOIST-AT ?auto_13413 ?auto_13408 ) ( not ( = ?auto_13416 ?auto_13413 ) ) ( SURFACE-AT ?auto_13405 ?auto_13408 ) ( ON ?auto_13405 ?auto_13409 ) ( CLEAR ?auto_13405 ) ( not ( = ?auto_13404 ?auto_13409 ) ) ( not ( = ?auto_13405 ?auto_13409 ) ) ( not ( = ?auto_13418 ?auto_13409 ) ) ( IS-CRATE ?auto_13404 ) ( SURFACE-AT ?auto_13404 ?auto_13408 ) ( ON ?auto_13404 ?auto_13417 ) ( CLEAR ?auto_13404 ) ( not ( = ?auto_13404 ?auto_13417 ) ) ( not ( = ?auto_13405 ?auto_13417 ) ) ( not ( = ?auto_13418 ?auto_13417 ) ) ( not ( = ?auto_13409 ?auto_13417 ) ) ( IS-CRATE ?auto_13418 ) ( not ( = ?auto_13410 ?auto_13418 ) ) ( not ( = ?auto_13404 ?auto_13410 ) ) ( not ( = ?auto_13405 ?auto_13410 ) ) ( not ( = ?auto_13409 ?auto_13410 ) ) ( not ( = ?auto_13417 ?auto_13410 ) ) ( not ( = ?auto_13415 ?auto_13412 ) ) ( not ( = ?auto_13408 ?auto_13415 ) ) ( HOIST-AT ?auto_13414 ?auto_13415 ) ( not ( = ?auto_13416 ?auto_13414 ) ) ( not ( = ?auto_13413 ?auto_13414 ) ) ( AVAILABLE ?auto_13414 ) ( SURFACE-AT ?auto_13418 ?auto_13415 ) ( ON ?auto_13418 ?auto_13411 ) ( CLEAR ?auto_13418 ) ( not ( = ?auto_13404 ?auto_13411 ) ) ( not ( = ?auto_13405 ?auto_13411 ) ) ( not ( = ?auto_13418 ?auto_13411 ) ) ( not ( = ?auto_13409 ?auto_13411 ) ) ( not ( = ?auto_13417 ?auto_13411 ) ) ( not ( = ?auto_13410 ?auto_13411 ) ) ( SURFACE-AT ?auto_13406 ?auto_13412 ) ( CLEAR ?auto_13406 ) ( IS-CRATE ?auto_13410 ) ( not ( = ?auto_13406 ?auto_13410 ) ) ( not ( = ?auto_13404 ?auto_13406 ) ) ( not ( = ?auto_13405 ?auto_13406 ) ) ( not ( = ?auto_13418 ?auto_13406 ) ) ( not ( = ?auto_13409 ?auto_13406 ) ) ( not ( = ?auto_13417 ?auto_13406 ) ) ( not ( = ?auto_13411 ?auto_13406 ) ) ( AVAILABLE ?auto_13416 ) ( TRUCK-AT ?auto_13407 ?auto_13408 ) ( AVAILABLE ?auto_13413 ) ( SURFACE-AT ?auto_13410 ?auto_13408 ) ( ON ?auto_13410 ?auto_13419 ) ( CLEAR ?auto_13410 ) ( not ( = ?auto_13404 ?auto_13419 ) ) ( not ( = ?auto_13405 ?auto_13419 ) ) ( not ( = ?auto_13418 ?auto_13419 ) ) ( not ( = ?auto_13409 ?auto_13419 ) ) ( not ( = ?auto_13417 ?auto_13419 ) ) ( not ( = ?auto_13410 ?auto_13419 ) ) ( not ( = ?auto_13411 ?auto_13419 ) ) ( not ( = ?auto_13406 ?auto_13419 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13413 ?auto_13410 ?auto_13419 ?auto_13408 )
      ( MAKE-2CRATE ?auto_13418 ?auto_13404 ?auto_13405 )
      ( MAKE-1CRATE-VERIFY ?auto_13404 ?auto_13405 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13420 - SURFACE
      ?auto_13421 - SURFACE
      ?auto_13422 - SURFACE
    )
    :vars
    (
      ?auto_13431 - HOIST
      ?auto_13432 - PLACE
      ?auto_13434 - PLACE
      ?auto_13425 - HOIST
      ?auto_13423 - SURFACE
      ?auto_13426 - SURFACE
      ?auto_13429 - SURFACE
      ?auto_13427 - PLACE
      ?auto_13428 - HOIST
      ?auto_13430 - SURFACE
      ?auto_13435 - SURFACE
      ?auto_13424 - TRUCK
      ?auto_13433 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13431 ?auto_13432 ) ( IS-CRATE ?auto_13422 ) ( not ( = ?auto_13421 ?auto_13422 ) ) ( not ( = ?auto_13420 ?auto_13421 ) ) ( not ( = ?auto_13420 ?auto_13422 ) ) ( not ( = ?auto_13434 ?auto_13432 ) ) ( HOIST-AT ?auto_13425 ?auto_13434 ) ( not ( = ?auto_13431 ?auto_13425 ) ) ( SURFACE-AT ?auto_13422 ?auto_13434 ) ( ON ?auto_13422 ?auto_13423 ) ( CLEAR ?auto_13422 ) ( not ( = ?auto_13421 ?auto_13423 ) ) ( not ( = ?auto_13422 ?auto_13423 ) ) ( not ( = ?auto_13420 ?auto_13423 ) ) ( IS-CRATE ?auto_13421 ) ( SURFACE-AT ?auto_13421 ?auto_13434 ) ( ON ?auto_13421 ?auto_13426 ) ( CLEAR ?auto_13421 ) ( not ( = ?auto_13421 ?auto_13426 ) ) ( not ( = ?auto_13422 ?auto_13426 ) ) ( not ( = ?auto_13420 ?auto_13426 ) ) ( not ( = ?auto_13423 ?auto_13426 ) ) ( IS-CRATE ?auto_13420 ) ( not ( = ?auto_13429 ?auto_13420 ) ) ( not ( = ?auto_13421 ?auto_13429 ) ) ( not ( = ?auto_13422 ?auto_13429 ) ) ( not ( = ?auto_13423 ?auto_13429 ) ) ( not ( = ?auto_13426 ?auto_13429 ) ) ( not ( = ?auto_13427 ?auto_13432 ) ) ( not ( = ?auto_13434 ?auto_13427 ) ) ( HOIST-AT ?auto_13428 ?auto_13427 ) ( not ( = ?auto_13431 ?auto_13428 ) ) ( not ( = ?auto_13425 ?auto_13428 ) ) ( AVAILABLE ?auto_13428 ) ( SURFACE-AT ?auto_13420 ?auto_13427 ) ( ON ?auto_13420 ?auto_13430 ) ( CLEAR ?auto_13420 ) ( not ( = ?auto_13421 ?auto_13430 ) ) ( not ( = ?auto_13422 ?auto_13430 ) ) ( not ( = ?auto_13420 ?auto_13430 ) ) ( not ( = ?auto_13423 ?auto_13430 ) ) ( not ( = ?auto_13426 ?auto_13430 ) ) ( not ( = ?auto_13429 ?auto_13430 ) ) ( SURFACE-AT ?auto_13435 ?auto_13432 ) ( CLEAR ?auto_13435 ) ( IS-CRATE ?auto_13429 ) ( not ( = ?auto_13435 ?auto_13429 ) ) ( not ( = ?auto_13421 ?auto_13435 ) ) ( not ( = ?auto_13422 ?auto_13435 ) ) ( not ( = ?auto_13420 ?auto_13435 ) ) ( not ( = ?auto_13423 ?auto_13435 ) ) ( not ( = ?auto_13426 ?auto_13435 ) ) ( not ( = ?auto_13430 ?auto_13435 ) ) ( AVAILABLE ?auto_13431 ) ( TRUCK-AT ?auto_13424 ?auto_13434 ) ( AVAILABLE ?auto_13425 ) ( SURFACE-AT ?auto_13429 ?auto_13434 ) ( ON ?auto_13429 ?auto_13433 ) ( CLEAR ?auto_13429 ) ( not ( = ?auto_13421 ?auto_13433 ) ) ( not ( = ?auto_13422 ?auto_13433 ) ) ( not ( = ?auto_13420 ?auto_13433 ) ) ( not ( = ?auto_13423 ?auto_13433 ) ) ( not ( = ?auto_13426 ?auto_13433 ) ) ( not ( = ?auto_13429 ?auto_13433 ) ) ( not ( = ?auto_13430 ?auto_13433 ) ) ( not ( = ?auto_13435 ?auto_13433 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13421 ?auto_13422 )
      ( MAKE-2CRATE-VERIFY ?auto_13420 ?auto_13421 ?auto_13422 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13436 - SURFACE
      ?auto_13437 - SURFACE
      ?auto_13438 - SURFACE
      ?auto_13439 - SURFACE
    )
    :vars
    (
      ?auto_13447 - HOIST
      ?auto_13450 - PLACE
      ?auto_13448 - PLACE
      ?auto_13446 - HOIST
      ?auto_13442 - SURFACE
      ?auto_13449 - SURFACE
      ?auto_13445 - PLACE
      ?auto_13444 - HOIST
      ?auto_13451 - SURFACE
      ?auto_13440 - SURFACE
      ?auto_13443 - TRUCK
      ?auto_13441 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13447 ?auto_13450 ) ( IS-CRATE ?auto_13439 ) ( not ( = ?auto_13438 ?auto_13439 ) ) ( not ( = ?auto_13437 ?auto_13438 ) ) ( not ( = ?auto_13437 ?auto_13439 ) ) ( not ( = ?auto_13448 ?auto_13450 ) ) ( HOIST-AT ?auto_13446 ?auto_13448 ) ( not ( = ?auto_13447 ?auto_13446 ) ) ( SURFACE-AT ?auto_13439 ?auto_13448 ) ( ON ?auto_13439 ?auto_13442 ) ( CLEAR ?auto_13439 ) ( not ( = ?auto_13438 ?auto_13442 ) ) ( not ( = ?auto_13439 ?auto_13442 ) ) ( not ( = ?auto_13437 ?auto_13442 ) ) ( IS-CRATE ?auto_13438 ) ( SURFACE-AT ?auto_13438 ?auto_13448 ) ( ON ?auto_13438 ?auto_13449 ) ( CLEAR ?auto_13438 ) ( not ( = ?auto_13438 ?auto_13449 ) ) ( not ( = ?auto_13439 ?auto_13449 ) ) ( not ( = ?auto_13437 ?auto_13449 ) ) ( not ( = ?auto_13442 ?auto_13449 ) ) ( IS-CRATE ?auto_13437 ) ( not ( = ?auto_13436 ?auto_13437 ) ) ( not ( = ?auto_13438 ?auto_13436 ) ) ( not ( = ?auto_13439 ?auto_13436 ) ) ( not ( = ?auto_13442 ?auto_13436 ) ) ( not ( = ?auto_13449 ?auto_13436 ) ) ( not ( = ?auto_13445 ?auto_13450 ) ) ( not ( = ?auto_13448 ?auto_13445 ) ) ( HOIST-AT ?auto_13444 ?auto_13445 ) ( not ( = ?auto_13447 ?auto_13444 ) ) ( not ( = ?auto_13446 ?auto_13444 ) ) ( AVAILABLE ?auto_13444 ) ( SURFACE-AT ?auto_13437 ?auto_13445 ) ( ON ?auto_13437 ?auto_13451 ) ( CLEAR ?auto_13437 ) ( not ( = ?auto_13438 ?auto_13451 ) ) ( not ( = ?auto_13439 ?auto_13451 ) ) ( not ( = ?auto_13437 ?auto_13451 ) ) ( not ( = ?auto_13442 ?auto_13451 ) ) ( not ( = ?auto_13449 ?auto_13451 ) ) ( not ( = ?auto_13436 ?auto_13451 ) ) ( SURFACE-AT ?auto_13440 ?auto_13450 ) ( CLEAR ?auto_13440 ) ( IS-CRATE ?auto_13436 ) ( not ( = ?auto_13440 ?auto_13436 ) ) ( not ( = ?auto_13438 ?auto_13440 ) ) ( not ( = ?auto_13439 ?auto_13440 ) ) ( not ( = ?auto_13437 ?auto_13440 ) ) ( not ( = ?auto_13442 ?auto_13440 ) ) ( not ( = ?auto_13449 ?auto_13440 ) ) ( not ( = ?auto_13451 ?auto_13440 ) ) ( AVAILABLE ?auto_13447 ) ( TRUCK-AT ?auto_13443 ?auto_13448 ) ( AVAILABLE ?auto_13446 ) ( SURFACE-AT ?auto_13436 ?auto_13448 ) ( ON ?auto_13436 ?auto_13441 ) ( CLEAR ?auto_13436 ) ( not ( = ?auto_13438 ?auto_13441 ) ) ( not ( = ?auto_13439 ?auto_13441 ) ) ( not ( = ?auto_13437 ?auto_13441 ) ) ( not ( = ?auto_13442 ?auto_13441 ) ) ( not ( = ?auto_13449 ?auto_13441 ) ) ( not ( = ?auto_13436 ?auto_13441 ) ) ( not ( = ?auto_13451 ?auto_13441 ) ) ( not ( = ?auto_13440 ?auto_13441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13437 ?auto_13438 ?auto_13439 )
      ( MAKE-3CRATE-VERIFY ?auto_13436 ?auto_13437 ?auto_13438 ?auto_13439 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13452 - SURFACE
      ?auto_13453 - SURFACE
      ?auto_13454 - SURFACE
      ?auto_13455 - SURFACE
      ?auto_13456 - SURFACE
    )
    :vars
    (
      ?auto_13463 - HOIST
      ?auto_13466 - PLACE
      ?auto_13464 - PLACE
      ?auto_13462 - HOIST
      ?auto_13458 - SURFACE
      ?auto_13465 - SURFACE
      ?auto_13461 - PLACE
      ?auto_13460 - HOIST
      ?auto_13467 - SURFACE
      ?auto_13459 - TRUCK
      ?auto_13457 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13463 ?auto_13466 ) ( IS-CRATE ?auto_13456 ) ( not ( = ?auto_13455 ?auto_13456 ) ) ( not ( = ?auto_13454 ?auto_13455 ) ) ( not ( = ?auto_13454 ?auto_13456 ) ) ( not ( = ?auto_13464 ?auto_13466 ) ) ( HOIST-AT ?auto_13462 ?auto_13464 ) ( not ( = ?auto_13463 ?auto_13462 ) ) ( SURFACE-AT ?auto_13456 ?auto_13464 ) ( ON ?auto_13456 ?auto_13458 ) ( CLEAR ?auto_13456 ) ( not ( = ?auto_13455 ?auto_13458 ) ) ( not ( = ?auto_13456 ?auto_13458 ) ) ( not ( = ?auto_13454 ?auto_13458 ) ) ( IS-CRATE ?auto_13455 ) ( SURFACE-AT ?auto_13455 ?auto_13464 ) ( ON ?auto_13455 ?auto_13465 ) ( CLEAR ?auto_13455 ) ( not ( = ?auto_13455 ?auto_13465 ) ) ( not ( = ?auto_13456 ?auto_13465 ) ) ( not ( = ?auto_13454 ?auto_13465 ) ) ( not ( = ?auto_13458 ?auto_13465 ) ) ( IS-CRATE ?auto_13454 ) ( not ( = ?auto_13453 ?auto_13454 ) ) ( not ( = ?auto_13455 ?auto_13453 ) ) ( not ( = ?auto_13456 ?auto_13453 ) ) ( not ( = ?auto_13458 ?auto_13453 ) ) ( not ( = ?auto_13465 ?auto_13453 ) ) ( not ( = ?auto_13461 ?auto_13466 ) ) ( not ( = ?auto_13464 ?auto_13461 ) ) ( HOIST-AT ?auto_13460 ?auto_13461 ) ( not ( = ?auto_13463 ?auto_13460 ) ) ( not ( = ?auto_13462 ?auto_13460 ) ) ( AVAILABLE ?auto_13460 ) ( SURFACE-AT ?auto_13454 ?auto_13461 ) ( ON ?auto_13454 ?auto_13467 ) ( CLEAR ?auto_13454 ) ( not ( = ?auto_13455 ?auto_13467 ) ) ( not ( = ?auto_13456 ?auto_13467 ) ) ( not ( = ?auto_13454 ?auto_13467 ) ) ( not ( = ?auto_13458 ?auto_13467 ) ) ( not ( = ?auto_13465 ?auto_13467 ) ) ( not ( = ?auto_13453 ?auto_13467 ) ) ( SURFACE-AT ?auto_13452 ?auto_13466 ) ( CLEAR ?auto_13452 ) ( IS-CRATE ?auto_13453 ) ( not ( = ?auto_13452 ?auto_13453 ) ) ( not ( = ?auto_13455 ?auto_13452 ) ) ( not ( = ?auto_13456 ?auto_13452 ) ) ( not ( = ?auto_13454 ?auto_13452 ) ) ( not ( = ?auto_13458 ?auto_13452 ) ) ( not ( = ?auto_13465 ?auto_13452 ) ) ( not ( = ?auto_13467 ?auto_13452 ) ) ( AVAILABLE ?auto_13463 ) ( TRUCK-AT ?auto_13459 ?auto_13464 ) ( AVAILABLE ?auto_13462 ) ( SURFACE-AT ?auto_13453 ?auto_13464 ) ( ON ?auto_13453 ?auto_13457 ) ( CLEAR ?auto_13453 ) ( not ( = ?auto_13455 ?auto_13457 ) ) ( not ( = ?auto_13456 ?auto_13457 ) ) ( not ( = ?auto_13454 ?auto_13457 ) ) ( not ( = ?auto_13458 ?auto_13457 ) ) ( not ( = ?auto_13465 ?auto_13457 ) ) ( not ( = ?auto_13453 ?auto_13457 ) ) ( not ( = ?auto_13467 ?auto_13457 ) ) ( not ( = ?auto_13452 ?auto_13457 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13454 ?auto_13455 ?auto_13456 )
      ( MAKE-4CRATE-VERIFY ?auto_13452 ?auto_13453 ?auto_13454 ?auto_13455 ?auto_13456 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13468 - SURFACE
      ?auto_13469 - SURFACE
    )
    :vars
    (
      ?auto_13477 - HOIST
      ?auto_13480 - PLACE
      ?auto_13483 - SURFACE
      ?auto_13478 - PLACE
      ?auto_13476 - HOIST
      ?auto_13472 - SURFACE
      ?auto_13479 - SURFACE
      ?auto_13482 - SURFACE
      ?auto_13475 - PLACE
      ?auto_13474 - HOIST
      ?auto_13481 - SURFACE
      ?auto_13470 - SURFACE
      ?auto_13471 - SURFACE
      ?auto_13473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13477 ?auto_13480 ) ( IS-CRATE ?auto_13469 ) ( not ( = ?auto_13468 ?auto_13469 ) ) ( not ( = ?auto_13483 ?auto_13468 ) ) ( not ( = ?auto_13483 ?auto_13469 ) ) ( not ( = ?auto_13478 ?auto_13480 ) ) ( HOIST-AT ?auto_13476 ?auto_13478 ) ( not ( = ?auto_13477 ?auto_13476 ) ) ( SURFACE-AT ?auto_13469 ?auto_13478 ) ( ON ?auto_13469 ?auto_13472 ) ( CLEAR ?auto_13469 ) ( not ( = ?auto_13468 ?auto_13472 ) ) ( not ( = ?auto_13469 ?auto_13472 ) ) ( not ( = ?auto_13483 ?auto_13472 ) ) ( IS-CRATE ?auto_13468 ) ( SURFACE-AT ?auto_13468 ?auto_13478 ) ( ON ?auto_13468 ?auto_13479 ) ( CLEAR ?auto_13468 ) ( not ( = ?auto_13468 ?auto_13479 ) ) ( not ( = ?auto_13469 ?auto_13479 ) ) ( not ( = ?auto_13483 ?auto_13479 ) ) ( not ( = ?auto_13472 ?auto_13479 ) ) ( IS-CRATE ?auto_13483 ) ( not ( = ?auto_13482 ?auto_13483 ) ) ( not ( = ?auto_13468 ?auto_13482 ) ) ( not ( = ?auto_13469 ?auto_13482 ) ) ( not ( = ?auto_13472 ?auto_13482 ) ) ( not ( = ?auto_13479 ?auto_13482 ) ) ( not ( = ?auto_13475 ?auto_13480 ) ) ( not ( = ?auto_13478 ?auto_13475 ) ) ( HOIST-AT ?auto_13474 ?auto_13475 ) ( not ( = ?auto_13477 ?auto_13474 ) ) ( not ( = ?auto_13476 ?auto_13474 ) ) ( AVAILABLE ?auto_13474 ) ( SURFACE-AT ?auto_13483 ?auto_13475 ) ( ON ?auto_13483 ?auto_13481 ) ( CLEAR ?auto_13483 ) ( not ( = ?auto_13468 ?auto_13481 ) ) ( not ( = ?auto_13469 ?auto_13481 ) ) ( not ( = ?auto_13483 ?auto_13481 ) ) ( not ( = ?auto_13472 ?auto_13481 ) ) ( not ( = ?auto_13479 ?auto_13481 ) ) ( not ( = ?auto_13482 ?auto_13481 ) ) ( SURFACE-AT ?auto_13470 ?auto_13480 ) ( CLEAR ?auto_13470 ) ( IS-CRATE ?auto_13482 ) ( not ( = ?auto_13470 ?auto_13482 ) ) ( not ( = ?auto_13468 ?auto_13470 ) ) ( not ( = ?auto_13469 ?auto_13470 ) ) ( not ( = ?auto_13483 ?auto_13470 ) ) ( not ( = ?auto_13472 ?auto_13470 ) ) ( not ( = ?auto_13479 ?auto_13470 ) ) ( not ( = ?auto_13481 ?auto_13470 ) ) ( AVAILABLE ?auto_13477 ) ( AVAILABLE ?auto_13476 ) ( SURFACE-AT ?auto_13482 ?auto_13478 ) ( ON ?auto_13482 ?auto_13471 ) ( CLEAR ?auto_13482 ) ( not ( = ?auto_13468 ?auto_13471 ) ) ( not ( = ?auto_13469 ?auto_13471 ) ) ( not ( = ?auto_13483 ?auto_13471 ) ) ( not ( = ?auto_13472 ?auto_13471 ) ) ( not ( = ?auto_13479 ?auto_13471 ) ) ( not ( = ?auto_13482 ?auto_13471 ) ) ( not ( = ?auto_13481 ?auto_13471 ) ) ( not ( = ?auto_13470 ?auto_13471 ) ) ( TRUCK-AT ?auto_13473 ?auto_13480 ) )
    :subtasks
    ( ( !DRIVE ?auto_13473 ?auto_13480 ?auto_13478 )
      ( MAKE-2CRATE ?auto_13483 ?auto_13468 ?auto_13469 )
      ( MAKE-1CRATE-VERIFY ?auto_13468 ?auto_13469 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13484 - SURFACE
      ?auto_13485 - SURFACE
      ?auto_13486 - SURFACE
    )
    :vars
    (
      ?auto_13490 - HOIST
      ?auto_13499 - PLACE
      ?auto_13488 - PLACE
      ?auto_13493 - HOIST
      ?auto_13497 - SURFACE
      ?auto_13498 - SURFACE
      ?auto_13487 - SURFACE
      ?auto_13492 - PLACE
      ?auto_13496 - HOIST
      ?auto_13494 - SURFACE
      ?auto_13495 - SURFACE
      ?auto_13491 - SURFACE
      ?auto_13489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13490 ?auto_13499 ) ( IS-CRATE ?auto_13486 ) ( not ( = ?auto_13485 ?auto_13486 ) ) ( not ( = ?auto_13484 ?auto_13485 ) ) ( not ( = ?auto_13484 ?auto_13486 ) ) ( not ( = ?auto_13488 ?auto_13499 ) ) ( HOIST-AT ?auto_13493 ?auto_13488 ) ( not ( = ?auto_13490 ?auto_13493 ) ) ( SURFACE-AT ?auto_13486 ?auto_13488 ) ( ON ?auto_13486 ?auto_13497 ) ( CLEAR ?auto_13486 ) ( not ( = ?auto_13485 ?auto_13497 ) ) ( not ( = ?auto_13486 ?auto_13497 ) ) ( not ( = ?auto_13484 ?auto_13497 ) ) ( IS-CRATE ?auto_13485 ) ( SURFACE-AT ?auto_13485 ?auto_13488 ) ( ON ?auto_13485 ?auto_13498 ) ( CLEAR ?auto_13485 ) ( not ( = ?auto_13485 ?auto_13498 ) ) ( not ( = ?auto_13486 ?auto_13498 ) ) ( not ( = ?auto_13484 ?auto_13498 ) ) ( not ( = ?auto_13497 ?auto_13498 ) ) ( IS-CRATE ?auto_13484 ) ( not ( = ?auto_13487 ?auto_13484 ) ) ( not ( = ?auto_13485 ?auto_13487 ) ) ( not ( = ?auto_13486 ?auto_13487 ) ) ( not ( = ?auto_13497 ?auto_13487 ) ) ( not ( = ?auto_13498 ?auto_13487 ) ) ( not ( = ?auto_13492 ?auto_13499 ) ) ( not ( = ?auto_13488 ?auto_13492 ) ) ( HOIST-AT ?auto_13496 ?auto_13492 ) ( not ( = ?auto_13490 ?auto_13496 ) ) ( not ( = ?auto_13493 ?auto_13496 ) ) ( AVAILABLE ?auto_13496 ) ( SURFACE-AT ?auto_13484 ?auto_13492 ) ( ON ?auto_13484 ?auto_13494 ) ( CLEAR ?auto_13484 ) ( not ( = ?auto_13485 ?auto_13494 ) ) ( not ( = ?auto_13486 ?auto_13494 ) ) ( not ( = ?auto_13484 ?auto_13494 ) ) ( not ( = ?auto_13497 ?auto_13494 ) ) ( not ( = ?auto_13498 ?auto_13494 ) ) ( not ( = ?auto_13487 ?auto_13494 ) ) ( SURFACE-AT ?auto_13495 ?auto_13499 ) ( CLEAR ?auto_13495 ) ( IS-CRATE ?auto_13487 ) ( not ( = ?auto_13495 ?auto_13487 ) ) ( not ( = ?auto_13485 ?auto_13495 ) ) ( not ( = ?auto_13486 ?auto_13495 ) ) ( not ( = ?auto_13484 ?auto_13495 ) ) ( not ( = ?auto_13497 ?auto_13495 ) ) ( not ( = ?auto_13498 ?auto_13495 ) ) ( not ( = ?auto_13494 ?auto_13495 ) ) ( AVAILABLE ?auto_13490 ) ( AVAILABLE ?auto_13493 ) ( SURFACE-AT ?auto_13487 ?auto_13488 ) ( ON ?auto_13487 ?auto_13491 ) ( CLEAR ?auto_13487 ) ( not ( = ?auto_13485 ?auto_13491 ) ) ( not ( = ?auto_13486 ?auto_13491 ) ) ( not ( = ?auto_13484 ?auto_13491 ) ) ( not ( = ?auto_13497 ?auto_13491 ) ) ( not ( = ?auto_13498 ?auto_13491 ) ) ( not ( = ?auto_13487 ?auto_13491 ) ) ( not ( = ?auto_13494 ?auto_13491 ) ) ( not ( = ?auto_13495 ?auto_13491 ) ) ( TRUCK-AT ?auto_13489 ?auto_13499 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13485 ?auto_13486 )
      ( MAKE-2CRATE-VERIFY ?auto_13484 ?auto_13485 ?auto_13486 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13500 - SURFACE
      ?auto_13501 - SURFACE
      ?auto_13502 - SURFACE
      ?auto_13503 - SURFACE
    )
    :vars
    (
      ?auto_13510 - HOIST
      ?auto_13505 - PLACE
      ?auto_13512 - PLACE
      ?auto_13514 - HOIST
      ?auto_13507 - SURFACE
      ?auto_13511 - SURFACE
      ?auto_13506 - PLACE
      ?auto_13504 - HOIST
      ?auto_13513 - SURFACE
      ?auto_13508 - SURFACE
      ?auto_13509 - SURFACE
      ?auto_13515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13510 ?auto_13505 ) ( IS-CRATE ?auto_13503 ) ( not ( = ?auto_13502 ?auto_13503 ) ) ( not ( = ?auto_13501 ?auto_13502 ) ) ( not ( = ?auto_13501 ?auto_13503 ) ) ( not ( = ?auto_13512 ?auto_13505 ) ) ( HOIST-AT ?auto_13514 ?auto_13512 ) ( not ( = ?auto_13510 ?auto_13514 ) ) ( SURFACE-AT ?auto_13503 ?auto_13512 ) ( ON ?auto_13503 ?auto_13507 ) ( CLEAR ?auto_13503 ) ( not ( = ?auto_13502 ?auto_13507 ) ) ( not ( = ?auto_13503 ?auto_13507 ) ) ( not ( = ?auto_13501 ?auto_13507 ) ) ( IS-CRATE ?auto_13502 ) ( SURFACE-AT ?auto_13502 ?auto_13512 ) ( ON ?auto_13502 ?auto_13511 ) ( CLEAR ?auto_13502 ) ( not ( = ?auto_13502 ?auto_13511 ) ) ( not ( = ?auto_13503 ?auto_13511 ) ) ( not ( = ?auto_13501 ?auto_13511 ) ) ( not ( = ?auto_13507 ?auto_13511 ) ) ( IS-CRATE ?auto_13501 ) ( not ( = ?auto_13500 ?auto_13501 ) ) ( not ( = ?auto_13502 ?auto_13500 ) ) ( not ( = ?auto_13503 ?auto_13500 ) ) ( not ( = ?auto_13507 ?auto_13500 ) ) ( not ( = ?auto_13511 ?auto_13500 ) ) ( not ( = ?auto_13506 ?auto_13505 ) ) ( not ( = ?auto_13512 ?auto_13506 ) ) ( HOIST-AT ?auto_13504 ?auto_13506 ) ( not ( = ?auto_13510 ?auto_13504 ) ) ( not ( = ?auto_13514 ?auto_13504 ) ) ( AVAILABLE ?auto_13504 ) ( SURFACE-AT ?auto_13501 ?auto_13506 ) ( ON ?auto_13501 ?auto_13513 ) ( CLEAR ?auto_13501 ) ( not ( = ?auto_13502 ?auto_13513 ) ) ( not ( = ?auto_13503 ?auto_13513 ) ) ( not ( = ?auto_13501 ?auto_13513 ) ) ( not ( = ?auto_13507 ?auto_13513 ) ) ( not ( = ?auto_13511 ?auto_13513 ) ) ( not ( = ?auto_13500 ?auto_13513 ) ) ( SURFACE-AT ?auto_13508 ?auto_13505 ) ( CLEAR ?auto_13508 ) ( IS-CRATE ?auto_13500 ) ( not ( = ?auto_13508 ?auto_13500 ) ) ( not ( = ?auto_13502 ?auto_13508 ) ) ( not ( = ?auto_13503 ?auto_13508 ) ) ( not ( = ?auto_13501 ?auto_13508 ) ) ( not ( = ?auto_13507 ?auto_13508 ) ) ( not ( = ?auto_13511 ?auto_13508 ) ) ( not ( = ?auto_13513 ?auto_13508 ) ) ( AVAILABLE ?auto_13510 ) ( AVAILABLE ?auto_13514 ) ( SURFACE-AT ?auto_13500 ?auto_13512 ) ( ON ?auto_13500 ?auto_13509 ) ( CLEAR ?auto_13500 ) ( not ( = ?auto_13502 ?auto_13509 ) ) ( not ( = ?auto_13503 ?auto_13509 ) ) ( not ( = ?auto_13501 ?auto_13509 ) ) ( not ( = ?auto_13507 ?auto_13509 ) ) ( not ( = ?auto_13511 ?auto_13509 ) ) ( not ( = ?auto_13500 ?auto_13509 ) ) ( not ( = ?auto_13513 ?auto_13509 ) ) ( not ( = ?auto_13508 ?auto_13509 ) ) ( TRUCK-AT ?auto_13515 ?auto_13505 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13501 ?auto_13502 ?auto_13503 )
      ( MAKE-3CRATE-VERIFY ?auto_13500 ?auto_13501 ?auto_13502 ?auto_13503 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13516 - SURFACE
      ?auto_13517 - SURFACE
      ?auto_13518 - SURFACE
      ?auto_13519 - SURFACE
      ?auto_13520 - SURFACE
    )
    :vars
    (
      ?auto_13526 - HOIST
      ?auto_13522 - PLACE
      ?auto_13528 - PLACE
      ?auto_13530 - HOIST
      ?auto_13524 - SURFACE
      ?auto_13527 - SURFACE
      ?auto_13523 - PLACE
      ?auto_13521 - HOIST
      ?auto_13529 - SURFACE
      ?auto_13525 - SURFACE
      ?auto_13531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13526 ?auto_13522 ) ( IS-CRATE ?auto_13520 ) ( not ( = ?auto_13519 ?auto_13520 ) ) ( not ( = ?auto_13518 ?auto_13519 ) ) ( not ( = ?auto_13518 ?auto_13520 ) ) ( not ( = ?auto_13528 ?auto_13522 ) ) ( HOIST-AT ?auto_13530 ?auto_13528 ) ( not ( = ?auto_13526 ?auto_13530 ) ) ( SURFACE-AT ?auto_13520 ?auto_13528 ) ( ON ?auto_13520 ?auto_13524 ) ( CLEAR ?auto_13520 ) ( not ( = ?auto_13519 ?auto_13524 ) ) ( not ( = ?auto_13520 ?auto_13524 ) ) ( not ( = ?auto_13518 ?auto_13524 ) ) ( IS-CRATE ?auto_13519 ) ( SURFACE-AT ?auto_13519 ?auto_13528 ) ( ON ?auto_13519 ?auto_13527 ) ( CLEAR ?auto_13519 ) ( not ( = ?auto_13519 ?auto_13527 ) ) ( not ( = ?auto_13520 ?auto_13527 ) ) ( not ( = ?auto_13518 ?auto_13527 ) ) ( not ( = ?auto_13524 ?auto_13527 ) ) ( IS-CRATE ?auto_13518 ) ( not ( = ?auto_13517 ?auto_13518 ) ) ( not ( = ?auto_13519 ?auto_13517 ) ) ( not ( = ?auto_13520 ?auto_13517 ) ) ( not ( = ?auto_13524 ?auto_13517 ) ) ( not ( = ?auto_13527 ?auto_13517 ) ) ( not ( = ?auto_13523 ?auto_13522 ) ) ( not ( = ?auto_13528 ?auto_13523 ) ) ( HOIST-AT ?auto_13521 ?auto_13523 ) ( not ( = ?auto_13526 ?auto_13521 ) ) ( not ( = ?auto_13530 ?auto_13521 ) ) ( AVAILABLE ?auto_13521 ) ( SURFACE-AT ?auto_13518 ?auto_13523 ) ( ON ?auto_13518 ?auto_13529 ) ( CLEAR ?auto_13518 ) ( not ( = ?auto_13519 ?auto_13529 ) ) ( not ( = ?auto_13520 ?auto_13529 ) ) ( not ( = ?auto_13518 ?auto_13529 ) ) ( not ( = ?auto_13524 ?auto_13529 ) ) ( not ( = ?auto_13527 ?auto_13529 ) ) ( not ( = ?auto_13517 ?auto_13529 ) ) ( SURFACE-AT ?auto_13516 ?auto_13522 ) ( CLEAR ?auto_13516 ) ( IS-CRATE ?auto_13517 ) ( not ( = ?auto_13516 ?auto_13517 ) ) ( not ( = ?auto_13519 ?auto_13516 ) ) ( not ( = ?auto_13520 ?auto_13516 ) ) ( not ( = ?auto_13518 ?auto_13516 ) ) ( not ( = ?auto_13524 ?auto_13516 ) ) ( not ( = ?auto_13527 ?auto_13516 ) ) ( not ( = ?auto_13529 ?auto_13516 ) ) ( AVAILABLE ?auto_13526 ) ( AVAILABLE ?auto_13530 ) ( SURFACE-AT ?auto_13517 ?auto_13528 ) ( ON ?auto_13517 ?auto_13525 ) ( CLEAR ?auto_13517 ) ( not ( = ?auto_13519 ?auto_13525 ) ) ( not ( = ?auto_13520 ?auto_13525 ) ) ( not ( = ?auto_13518 ?auto_13525 ) ) ( not ( = ?auto_13524 ?auto_13525 ) ) ( not ( = ?auto_13527 ?auto_13525 ) ) ( not ( = ?auto_13517 ?auto_13525 ) ) ( not ( = ?auto_13529 ?auto_13525 ) ) ( not ( = ?auto_13516 ?auto_13525 ) ) ( TRUCK-AT ?auto_13531 ?auto_13522 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13518 ?auto_13519 ?auto_13520 )
      ( MAKE-4CRATE-VERIFY ?auto_13516 ?auto_13517 ?auto_13518 ?auto_13519 ?auto_13520 ) )
  )

)

