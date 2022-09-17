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
      ?auto_9616 - SURFACE
      ?auto_9617 - SURFACE
    )
    :vars
    (
      ?auto_9618 - HOIST
      ?auto_9619 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9618 ?auto_9619 ) ( SURFACE-AT ?auto_9616 ?auto_9619 ) ( CLEAR ?auto_9616 ) ( LIFTING ?auto_9618 ?auto_9617 ) ( IS-CRATE ?auto_9617 ) ( not ( = ?auto_9616 ?auto_9617 ) ) )
    :subtasks
    ( ( !DROP ?auto_9618 ?auto_9617 ?auto_9616 ?auto_9619 )
      ( MAKE-1CRATE-VERIFY ?auto_9616 ?auto_9617 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9620 - SURFACE
      ?auto_9621 - SURFACE
    )
    :vars
    (
      ?auto_9623 - HOIST
      ?auto_9622 - PLACE
      ?auto_9624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9623 ?auto_9622 ) ( SURFACE-AT ?auto_9620 ?auto_9622 ) ( CLEAR ?auto_9620 ) ( IS-CRATE ?auto_9621 ) ( not ( = ?auto_9620 ?auto_9621 ) ) ( TRUCK-AT ?auto_9624 ?auto_9622 ) ( AVAILABLE ?auto_9623 ) ( IN ?auto_9621 ?auto_9624 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9623 ?auto_9621 ?auto_9624 ?auto_9622 )
      ( MAKE-1CRATE ?auto_9620 ?auto_9621 )
      ( MAKE-1CRATE-VERIFY ?auto_9620 ?auto_9621 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9625 - SURFACE
      ?auto_9626 - SURFACE
    )
    :vars
    (
      ?auto_9628 - HOIST
      ?auto_9629 - PLACE
      ?auto_9627 - TRUCK
      ?auto_9630 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9628 ?auto_9629 ) ( SURFACE-AT ?auto_9625 ?auto_9629 ) ( CLEAR ?auto_9625 ) ( IS-CRATE ?auto_9626 ) ( not ( = ?auto_9625 ?auto_9626 ) ) ( AVAILABLE ?auto_9628 ) ( IN ?auto_9626 ?auto_9627 ) ( TRUCK-AT ?auto_9627 ?auto_9630 ) ( not ( = ?auto_9630 ?auto_9629 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9627 ?auto_9630 ?auto_9629 )
      ( MAKE-1CRATE ?auto_9625 ?auto_9626 )
      ( MAKE-1CRATE-VERIFY ?auto_9625 ?auto_9626 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9631 - SURFACE
      ?auto_9632 - SURFACE
    )
    :vars
    (
      ?auto_9634 - HOIST
      ?auto_9635 - PLACE
      ?auto_9633 - TRUCK
      ?auto_9636 - PLACE
      ?auto_9637 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9634 ?auto_9635 ) ( SURFACE-AT ?auto_9631 ?auto_9635 ) ( CLEAR ?auto_9631 ) ( IS-CRATE ?auto_9632 ) ( not ( = ?auto_9631 ?auto_9632 ) ) ( AVAILABLE ?auto_9634 ) ( TRUCK-AT ?auto_9633 ?auto_9636 ) ( not ( = ?auto_9636 ?auto_9635 ) ) ( HOIST-AT ?auto_9637 ?auto_9636 ) ( LIFTING ?auto_9637 ?auto_9632 ) ( not ( = ?auto_9634 ?auto_9637 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9637 ?auto_9632 ?auto_9633 ?auto_9636 )
      ( MAKE-1CRATE ?auto_9631 ?auto_9632 )
      ( MAKE-1CRATE-VERIFY ?auto_9631 ?auto_9632 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9638 - SURFACE
      ?auto_9639 - SURFACE
    )
    :vars
    (
      ?auto_9643 - HOIST
      ?auto_9644 - PLACE
      ?auto_9640 - TRUCK
      ?auto_9641 - PLACE
      ?auto_9642 - HOIST
      ?auto_9645 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9643 ?auto_9644 ) ( SURFACE-AT ?auto_9638 ?auto_9644 ) ( CLEAR ?auto_9638 ) ( IS-CRATE ?auto_9639 ) ( not ( = ?auto_9638 ?auto_9639 ) ) ( AVAILABLE ?auto_9643 ) ( TRUCK-AT ?auto_9640 ?auto_9641 ) ( not ( = ?auto_9641 ?auto_9644 ) ) ( HOIST-AT ?auto_9642 ?auto_9641 ) ( not ( = ?auto_9643 ?auto_9642 ) ) ( AVAILABLE ?auto_9642 ) ( SURFACE-AT ?auto_9639 ?auto_9641 ) ( ON ?auto_9639 ?auto_9645 ) ( CLEAR ?auto_9639 ) ( not ( = ?auto_9638 ?auto_9645 ) ) ( not ( = ?auto_9639 ?auto_9645 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9642 ?auto_9639 ?auto_9645 ?auto_9641 )
      ( MAKE-1CRATE ?auto_9638 ?auto_9639 )
      ( MAKE-1CRATE-VERIFY ?auto_9638 ?auto_9639 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9646 - SURFACE
      ?auto_9647 - SURFACE
    )
    :vars
    (
      ?auto_9650 - HOIST
      ?auto_9648 - PLACE
      ?auto_9653 - PLACE
      ?auto_9652 - HOIST
      ?auto_9649 - SURFACE
      ?auto_9651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9650 ?auto_9648 ) ( SURFACE-AT ?auto_9646 ?auto_9648 ) ( CLEAR ?auto_9646 ) ( IS-CRATE ?auto_9647 ) ( not ( = ?auto_9646 ?auto_9647 ) ) ( AVAILABLE ?auto_9650 ) ( not ( = ?auto_9653 ?auto_9648 ) ) ( HOIST-AT ?auto_9652 ?auto_9653 ) ( not ( = ?auto_9650 ?auto_9652 ) ) ( AVAILABLE ?auto_9652 ) ( SURFACE-AT ?auto_9647 ?auto_9653 ) ( ON ?auto_9647 ?auto_9649 ) ( CLEAR ?auto_9647 ) ( not ( = ?auto_9646 ?auto_9649 ) ) ( not ( = ?auto_9647 ?auto_9649 ) ) ( TRUCK-AT ?auto_9651 ?auto_9648 ) )
    :subtasks
    ( ( !DRIVE ?auto_9651 ?auto_9648 ?auto_9653 )
      ( MAKE-1CRATE ?auto_9646 ?auto_9647 )
      ( MAKE-1CRATE-VERIFY ?auto_9646 ?auto_9647 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9659 - SURFACE
      ?auto_9660 - SURFACE
    )
    :vars
    (
      ?auto_9661 - HOIST
      ?auto_9662 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9661 ?auto_9662 ) ( SURFACE-AT ?auto_9659 ?auto_9662 ) ( CLEAR ?auto_9659 ) ( LIFTING ?auto_9661 ?auto_9660 ) ( IS-CRATE ?auto_9660 ) ( not ( = ?auto_9659 ?auto_9660 ) ) )
    :subtasks
    ( ( !DROP ?auto_9661 ?auto_9660 ?auto_9659 ?auto_9662 )
      ( MAKE-1CRATE-VERIFY ?auto_9659 ?auto_9660 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9663 - SURFACE
      ?auto_9664 - SURFACE
      ?auto_9665 - SURFACE
    )
    :vars
    (
      ?auto_9667 - HOIST
      ?auto_9666 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9667 ?auto_9666 ) ( SURFACE-AT ?auto_9664 ?auto_9666 ) ( CLEAR ?auto_9664 ) ( LIFTING ?auto_9667 ?auto_9665 ) ( IS-CRATE ?auto_9665 ) ( not ( = ?auto_9664 ?auto_9665 ) ) ( ON ?auto_9664 ?auto_9663 ) ( not ( = ?auto_9663 ?auto_9664 ) ) ( not ( = ?auto_9663 ?auto_9665 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9664 ?auto_9665 )
      ( MAKE-2CRATE-VERIFY ?auto_9663 ?auto_9664 ?auto_9665 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9668 - SURFACE
      ?auto_9669 - SURFACE
    )
    :vars
    (
      ?auto_9671 - HOIST
      ?auto_9670 - PLACE
      ?auto_9672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9671 ?auto_9670 ) ( SURFACE-AT ?auto_9668 ?auto_9670 ) ( CLEAR ?auto_9668 ) ( IS-CRATE ?auto_9669 ) ( not ( = ?auto_9668 ?auto_9669 ) ) ( TRUCK-AT ?auto_9672 ?auto_9670 ) ( AVAILABLE ?auto_9671 ) ( IN ?auto_9669 ?auto_9672 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9671 ?auto_9669 ?auto_9672 ?auto_9670 )
      ( MAKE-1CRATE ?auto_9668 ?auto_9669 )
      ( MAKE-1CRATE-VERIFY ?auto_9668 ?auto_9669 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9673 - SURFACE
      ?auto_9674 - SURFACE
      ?auto_9675 - SURFACE
    )
    :vars
    (
      ?auto_9678 - HOIST
      ?auto_9677 - PLACE
      ?auto_9676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9678 ?auto_9677 ) ( SURFACE-AT ?auto_9674 ?auto_9677 ) ( CLEAR ?auto_9674 ) ( IS-CRATE ?auto_9675 ) ( not ( = ?auto_9674 ?auto_9675 ) ) ( TRUCK-AT ?auto_9676 ?auto_9677 ) ( AVAILABLE ?auto_9678 ) ( IN ?auto_9675 ?auto_9676 ) ( ON ?auto_9674 ?auto_9673 ) ( not ( = ?auto_9673 ?auto_9674 ) ) ( not ( = ?auto_9673 ?auto_9675 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9674 ?auto_9675 )
      ( MAKE-2CRATE-VERIFY ?auto_9673 ?auto_9674 ?auto_9675 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9679 - SURFACE
      ?auto_9680 - SURFACE
    )
    :vars
    (
      ?auto_9683 - HOIST
      ?auto_9684 - PLACE
      ?auto_9682 - TRUCK
      ?auto_9681 - SURFACE
      ?auto_9685 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9683 ?auto_9684 ) ( SURFACE-AT ?auto_9679 ?auto_9684 ) ( CLEAR ?auto_9679 ) ( IS-CRATE ?auto_9680 ) ( not ( = ?auto_9679 ?auto_9680 ) ) ( AVAILABLE ?auto_9683 ) ( IN ?auto_9680 ?auto_9682 ) ( ON ?auto_9679 ?auto_9681 ) ( not ( = ?auto_9681 ?auto_9679 ) ) ( not ( = ?auto_9681 ?auto_9680 ) ) ( TRUCK-AT ?auto_9682 ?auto_9685 ) ( not ( = ?auto_9685 ?auto_9684 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9682 ?auto_9685 ?auto_9684 )
      ( MAKE-2CRATE ?auto_9681 ?auto_9679 ?auto_9680 )
      ( MAKE-1CRATE-VERIFY ?auto_9679 ?auto_9680 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9686 - SURFACE
      ?auto_9687 - SURFACE
      ?auto_9688 - SURFACE
    )
    :vars
    (
      ?auto_9692 - HOIST
      ?auto_9690 - PLACE
      ?auto_9689 - TRUCK
      ?auto_9691 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9692 ?auto_9690 ) ( SURFACE-AT ?auto_9687 ?auto_9690 ) ( CLEAR ?auto_9687 ) ( IS-CRATE ?auto_9688 ) ( not ( = ?auto_9687 ?auto_9688 ) ) ( AVAILABLE ?auto_9692 ) ( IN ?auto_9688 ?auto_9689 ) ( ON ?auto_9687 ?auto_9686 ) ( not ( = ?auto_9686 ?auto_9687 ) ) ( not ( = ?auto_9686 ?auto_9688 ) ) ( TRUCK-AT ?auto_9689 ?auto_9691 ) ( not ( = ?auto_9691 ?auto_9690 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9687 ?auto_9688 )
      ( MAKE-2CRATE-VERIFY ?auto_9686 ?auto_9687 ?auto_9688 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9693 - SURFACE
      ?auto_9694 - SURFACE
    )
    :vars
    (
      ?auto_9697 - HOIST
      ?auto_9698 - PLACE
      ?auto_9695 - SURFACE
      ?auto_9699 - TRUCK
      ?auto_9696 - PLACE
      ?auto_9700 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9697 ?auto_9698 ) ( SURFACE-AT ?auto_9693 ?auto_9698 ) ( CLEAR ?auto_9693 ) ( IS-CRATE ?auto_9694 ) ( not ( = ?auto_9693 ?auto_9694 ) ) ( AVAILABLE ?auto_9697 ) ( ON ?auto_9693 ?auto_9695 ) ( not ( = ?auto_9695 ?auto_9693 ) ) ( not ( = ?auto_9695 ?auto_9694 ) ) ( TRUCK-AT ?auto_9699 ?auto_9696 ) ( not ( = ?auto_9696 ?auto_9698 ) ) ( HOIST-AT ?auto_9700 ?auto_9696 ) ( LIFTING ?auto_9700 ?auto_9694 ) ( not ( = ?auto_9697 ?auto_9700 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9700 ?auto_9694 ?auto_9699 ?auto_9696 )
      ( MAKE-2CRATE ?auto_9695 ?auto_9693 ?auto_9694 )
      ( MAKE-1CRATE-VERIFY ?auto_9693 ?auto_9694 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9701 - SURFACE
      ?auto_9702 - SURFACE
      ?auto_9703 - SURFACE
    )
    :vars
    (
      ?auto_9707 - HOIST
      ?auto_9704 - PLACE
      ?auto_9706 - TRUCK
      ?auto_9705 - PLACE
      ?auto_9708 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9707 ?auto_9704 ) ( SURFACE-AT ?auto_9702 ?auto_9704 ) ( CLEAR ?auto_9702 ) ( IS-CRATE ?auto_9703 ) ( not ( = ?auto_9702 ?auto_9703 ) ) ( AVAILABLE ?auto_9707 ) ( ON ?auto_9702 ?auto_9701 ) ( not ( = ?auto_9701 ?auto_9702 ) ) ( not ( = ?auto_9701 ?auto_9703 ) ) ( TRUCK-AT ?auto_9706 ?auto_9705 ) ( not ( = ?auto_9705 ?auto_9704 ) ) ( HOIST-AT ?auto_9708 ?auto_9705 ) ( LIFTING ?auto_9708 ?auto_9703 ) ( not ( = ?auto_9707 ?auto_9708 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9702 ?auto_9703 )
      ( MAKE-2CRATE-VERIFY ?auto_9701 ?auto_9702 ?auto_9703 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9709 - SURFACE
      ?auto_9710 - SURFACE
    )
    :vars
    (
      ?auto_9714 - HOIST
      ?auto_9712 - PLACE
      ?auto_9715 - SURFACE
      ?auto_9716 - TRUCK
      ?auto_9711 - PLACE
      ?auto_9713 - HOIST
      ?auto_9717 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9714 ?auto_9712 ) ( SURFACE-AT ?auto_9709 ?auto_9712 ) ( CLEAR ?auto_9709 ) ( IS-CRATE ?auto_9710 ) ( not ( = ?auto_9709 ?auto_9710 ) ) ( AVAILABLE ?auto_9714 ) ( ON ?auto_9709 ?auto_9715 ) ( not ( = ?auto_9715 ?auto_9709 ) ) ( not ( = ?auto_9715 ?auto_9710 ) ) ( TRUCK-AT ?auto_9716 ?auto_9711 ) ( not ( = ?auto_9711 ?auto_9712 ) ) ( HOIST-AT ?auto_9713 ?auto_9711 ) ( not ( = ?auto_9714 ?auto_9713 ) ) ( AVAILABLE ?auto_9713 ) ( SURFACE-AT ?auto_9710 ?auto_9711 ) ( ON ?auto_9710 ?auto_9717 ) ( CLEAR ?auto_9710 ) ( not ( = ?auto_9709 ?auto_9717 ) ) ( not ( = ?auto_9710 ?auto_9717 ) ) ( not ( = ?auto_9715 ?auto_9717 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9713 ?auto_9710 ?auto_9717 ?auto_9711 )
      ( MAKE-2CRATE ?auto_9715 ?auto_9709 ?auto_9710 )
      ( MAKE-1CRATE-VERIFY ?auto_9709 ?auto_9710 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9718 - SURFACE
      ?auto_9719 - SURFACE
      ?auto_9720 - SURFACE
    )
    :vars
    (
      ?auto_9724 - HOIST
      ?auto_9721 - PLACE
      ?auto_9725 - TRUCK
      ?auto_9722 - PLACE
      ?auto_9726 - HOIST
      ?auto_9723 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9724 ?auto_9721 ) ( SURFACE-AT ?auto_9719 ?auto_9721 ) ( CLEAR ?auto_9719 ) ( IS-CRATE ?auto_9720 ) ( not ( = ?auto_9719 ?auto_9720 ) ) ( AVAILABLE ?auto_9724 ) ( ON ?auto_9719 ?auto_9718 ) ( not ( = ?auto_9718 ?auto_9719 ) ) ( not ( = ?auto_9718 ?auto_9720 ) ) ( TRUCK-AT ?auto_9725 ?auto_9722 ) ( not ( = ?auto_9722 ?auto_9721 ) ) ( HOIST-AT ?auto_9726 ?auto_9722 ) ( not ( = ?auto_9724 ?auto_9726 ) ) ( AVAILABLE ?auto_9726 ) ( SURFACE-AT ?auto_9720 ?auto_9722 ) ( ON ?auto_9720 ?auto_9723 ) ( CLEAR ?auto_9720 ) ( not ( = ?auto_9719 ?auto_9723 ) ) ( not ( = ?auto_9720 ?auto_9723 ) ) ( not ( = ?auto_9718 ?auto_9723 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9719 ?auto_9720 )
      ( MAKE-2CRATE-VERIFY ?auto_9718 ?auto_9719 ?auto_9720 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9727 - SURFACE
      ?auto_9728 - SURFACE
    )
    :vars
    (
      ?auto_9732 - HOIST
      ?auto_9730 - PLACE
      ?auto_9735 - SURFACE
      ?auto_9731 - PLACE
      ?auto_9729 - HOIST
      ?auto_9733 - SURFACE
      ?auto_9734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9732 ?auto_9730 ) ( SURFACE-AT ?auto_9727 ?auto_9730 ) ( CLEAR ?auto_9727 ) ( IS-CRATE ?auto_9728 ) ( not ( = ?auto_9727 ?auto_9728 ) ) ( AVAILABLE ?auto_9732 ) ( ON ?auto_9727 ?auto_9735 ) ( not ( = ?auto_9735 ?auto_9727 ) ) ( not ( = ?auto_9735 ?auto_9728 ) ) ( not ( = ?auto_9731 ?auto_9730 ) ) ( HOIST-AT ?auto_9729 ?auto_9731 ) ( not ( = ?auto_9732 ?auto_9729 ) ) ( AVAILABLE ?auto_9729 ) ( SURFACE-AT ?auto_9728 ?auto_9731 ) ( ON ?auto_9728 ?auto_9733 ) ( CLEAR ?auto_9728 ) ( not ( = ?auto_9727 ?auto_9733 ) ) ( not ( = ?auto_9728 ?auto_9733 ) ) ( not ( = ?auto_9735 ?auto_9733 ) ) ( TRUCK-AT ?auto_9734 ?auto_9730 ) )
    :subtasks
    ( ( !DRIVE ?auto_9734 ?auto_9730 ?auto_9731 )
      ( MAKE-2CRATE ?auto_9735 ?auto_9727 ?auto_9728 )
      ( MAKE-1CRATE-VERIFY ?auto_9727 ?auto_9728 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9736 - SURFACE
      ?auto_9737 - SURFACE
      ?auto_9738 - SURFACE
    )
    :vars
    (
      ?auto_9742 - HOIST
      ?auto_9740 - PLACE
      ?auto_9743 - PLACE
      ?auto_9739 - HOIST
      ?auto_9744 - SURFACE
      ?auto_9741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9742 ?auto_9740 ) ( SURFACE-AT ?auto_9737 ?auto_9740 ) ( CLEAR ?auto_9737 ) ( IS-CRATE ?auto_9738 ) ( not ( = ?auto_9737 ?auto_9738 ) ) ( AVAILABLE ?auto_9742 ) ( ON ?auto_9737 ?auto_9736 ) ( not ( = ?auto_9736 ?auto_9737 ) ) ( not ( = ?auto_9736 ?auto_9738 ) ) ( not ( = ?auto_9743 ?auto_9740 ) ) ( HOIST-AT ?auto_9739 ?auto_9743 ) ( not ( = ?auto_9742 ?auto_9739 ) ) ( AVAILABLE ?auto_9739 ) ( SURFACE-AT ?auto_9738 ?auto_9743 ) ( ON ?auto_9738 ?auto_9744 ) ( CLEAR ?auto_9738 ) ( not ( = ?auto_9737 ?auto_9744 ) ) ( not ( = ?auto_9738 ?auto_9744 ) ) ( not ( = ?auto_9736 ?auto_9744 ) ) ( TRUCK-AT ?auto_9741 ?auto_9740 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9737 ?auto_9738 )
      ( MAKE-2CRATE-VERIFY ?auto_9736 ?auto_9737 ?auto_9738 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9745 - SURFACE
      ?auto_9746 - SURFACE
    )
    :vars
    (
      ?auto_9753 - HOIST
      ?auto_9750 - PLACE
      ?auto_9747 - SURFACE
      ?auto_9752 - PLACE
      ?auto_9751 - HOIST
      ?auto_9749 - SURFACE
      ?auto_9748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9753 ?auto_9750 ) ( IS-CRATE ?auto_9746 ) ( not ( = ?auto_9745 ?auto_9746 ) ) ( not ( = ?auto_9747 ?auto_9745 ) ) ( not ( = ?auto_9747 ?auto_9746 ) ) ( not ( = ?auto_9752 ?auto_9750 ) ) ( HOIST-AT ?auto_9751 ?auto_9752 ) ( not ( = ?auto_9753 ?auto_9751 ) ) ( AVAILABLE ?auto_9751 ) ( SURFACE-AT ?auto_9746 ?auto_9752 ) ( ON ?auto_9746 ?auto_9749 ) ( CLEAR ?auto_9746 ) ( not ( = ?auto_9745 ?auto_9749 ) ) ( not ( = ?auto_9746 ?auto_9749 ) ) ( not ( = ?auto_9747 ?auto_9749 ) ) ( TRUCK-AT ?auto_9748 ?auto_9750 ) ( SURFACE-AT ?auto_9747 ?auto_9750 ) ( CLEAR ?auto_9747 ) ( LIFTING ?auto_9753 ?auto_9745 ) ( IS-CRATE ?auto_9745 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9747 ?auto_9745 )
      ( MAKE-2CRATE ?auto_9747 ?auto_9745 ?auto_9746 )
      ( MAKE-1CRATE-VERIFY ?auto_9745 ?auto_9746 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9754 - SURFACE
      ?auto_9755 - SURFACE
      ?auto_9756 - SURFACE
    )
    :vars
    (
      ?auto_9758 - HOIST
      ?auto_9757 - PLACE
      ?auto_9759 - PLACE
      ?auto_9761 - HOIST
      ?auto_9762 - SURFACE
      ?auto_9760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9758 ?auto_9757 ) ( IS-CRATE ?auto_9756 ) ( not ( = ?auto_9755 ?auto_9756 ) ) ( not ( = ?auto_9754 ?auto_9755 ) ) ( not ( = ?auto_9754 ?auto_9756 ) ) ( not ( = ?auto_9759 ?auto_9757 ) ) ( HOIST-AT ?auto_9761 ?auto_9759 ) ( not ( = ?auto_9758 ?auto_9761 ) ) ( AVAILABLE ?auto_9761 ) ( SURFACE-AT ?auto_9756 ?auto_9759 ) ( ON ?auto_9756 ?auto_9762 ) ( CLEAR ?auto_9756 ) ( not ( = ?auto_9755 ?auto_9762 ) ) ( not ( = ?auto_9756 ?auto_9762 ) ) ( not ( = ?auto_9754 ?auto_9762 ) ) ( TRUCK-AT ?auto_9760 ?auto_9757 ) ( SURFACE-AT ?auto_9754 ?auto_9757 ) ( CLEAR ?auto_9754 ) ( LIFTING ?auto_9758 ?auto_9755 ) ( IS-CRATE ?auto_9755 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9755 ?auto_9756 )
      ( MAKE-2CRATE-VERIFY ?auto_9754 ?auto_9755 ?auto_9756 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9763 - SURFACE
      ?auto_9764 - SURFACE
    )
    :vars
    (
      ?auto_9770 - HOIST
      ?auto_9771 - PLACE
      ?auto_9767 - SURFACE
      ?auto_9769 - PLACE
      ?auto_9768 - HOIST
      ?auto_9765 - SURFACE
      ?auto_9766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9770 ?auto_9771 ) ( IS-CRATE ?auto_9764 ) ( not ( = ?auto_9763 ?auto_9764 ) ) ( not ( = ?auto_9767 ?auto_9763 ) ) ( not ( = ?auto_9767 ?auto_9764 ) ) ( not ( = ?auto_9769 ?auto_9771 ) ) ( HOIST-AT ?auto_9768 ?auto_9769 ) ( not ( = ?auto_9770 ?auto_9768 ) ) ( AVAILABLE ?auto_9768 ) ( SURFACE-AT ?auto_9764 ?auto_9769 ) ( ON ?auto_9764 ?auto_9765 ) ( CLEAR ?auto_9764 ) ( not ( = ?auto_9763 ?auto_9765 ) ) ( not ( = ?auto_9764 ?auto_9765 ) ) ( not ( = ?auto_9767 ?auto_9765 ) ) ( TRUCK-AT ?auto_9766 ?auto_9771 ) ( SURFACE-AT ?auto_9767 ?auto_9771 ) ( CLEAR ?auto_9767 ) ( IS-CRATE ?auto_9763 ) ( AVAILABLE ?auto_9770 ) ( IN ?auto_9763 ?auto_9766 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9770 ?auto_9763 ?auto_9766 ?auto_9771 )
      ( MAKE-2CRATE ?auto_9767 ?auto_9763 ?auto_9764 )
      ( MAKE-1CRATE-VERIFY ?auto_9763 ?auto_9764 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9772 - SURFACE
      ?auto_9773 - SURFACE
      ?auto_9774 - SURFACE
    )
    :vars
    (
      ?auto_9775 - HOIST
      ?auto_9778 - PLACE
      ?auto_9780 - PLACE
      ?auto_9779 - HOIST
      ?auto_9776 - SURFACE
      ?auto_9777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9775 ?auto_9778 ) ( IS-CRATE ?auto_9774 ) ( not ( = ?auto_9773 ?auto_9774 ) ) ( not ( = ?auto_9772 ?auto_9773 ) ) ( not ( = ?auto_9772 ?auto_9774 ) ) ( not ( = ?auto_9780 ?auto_9778 ) ) ( HOIST-AT ?auto_9779 ?auto_9780 ) ( not ( = ?auto_9775 ?auto_9779 ) ) ( AVAILABLE ?auto_9779 ) ( SURFACE-AT ?auto_9774 ?auto_9780 ) ( ON ?auto_9774 ?auto_9776 ) ( CLEAR ?auto_9774 ) ( not ( = ?auto_9773 ?auto_9776 ) ) ( not ( = ?auto_9774 ?auto_9776 ) ) ( not ( = ?auto_9772 ?auto_9776 ) ) ( TRUCK-AT ?auto_9777 ?auto_9778 ) ( SURFACE-AT ?auto_9772 ?auto_9778 ) ( CLEAR ?auto_9772 ) ( IS-CRATE ?auto_9773 ) ( AVAILABLE ?auto_9775 ) ( IN ?auto_9773 ?auto_9777 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9773 ?auto_9774 )
      ( MAKE-2CRATE-VERIFY ?auto_9772 ?auto_9773 ?auto_9774 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9781 - SURFACE
      ?auto_9782 - SURFACE
    )
    :vars
    (
      ?auto_9788 - HOIST
      ?auto_9783 - PLACE
      ?auto_9785 - SURFACE
      ?auto_9786 - PLACE
      ?auto_9787 - HOIST
      ?auto_9784 - SURFACE
      ?auto_9789 - TRUCK
      ?auto_9790 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9788 ?auto_9783 ) ( IS-CRATE ?auto_9782 ) ( not ( = ?auto_9781 ?auto_9782 ) ) ( not ( = ?auto_9785 ?auto_9781 ) ) ( not ( = ?auto_9785 ?auto_9782 ) ) ( not ( = ?auto_9786 ?auto_9783 ) ) ( HOIST-AT ?auto_9787 ?auto_9786 ) ( not ( = ?auto_9788 ?auto_9787 ) ) ( AVAILABLE ?auto_9787 ) ( SURFACE-AT ?auto_9782 ?auto_9786 ) ( ON ?auto_9782 ?auto_9784 ) ( CLEAR ?auto_9782 ) ( not ( = ?auto_9781 ?auto_9784 ) ) ( not ( = ?auto_9782 ?auto_9784 ) ) ( not ( = ?auto_9785 ?auto_9784 ) ) ( SURFACE-AT ?auto_9785 ?auto_9783 ) ( CLEAR ?auto_9785 ) ( IS-CRATE ?auto_9781 ) ( AVAILABLE ?auto_9788 ) ( IN ?auto_9781 ?auto_9789 ) ( TRUCK-AT ?auto_9789 ?auto_9790 ) ( not ( = ?auto_9790 ?auto_9783 ) ) ( not ( = ?auto_9786 ?auto_9790 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9789 ?auto_9790 ?auto_9783 )
      ( MAKE-2CRATE ?auto_9785 ?auto_9781 ?auto_9782 )
      ( MAKE-1CRATE-VERIFY ?auto_9781 ?auto_9782 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9791 - SURFACE
      ?auto_9792 - SURFACE
      ?auto_9793 - SURFACE
    )
    :vars
    (
      ?auto_9794 - HOIST
      ?auto_9800 - PLACE
      ?auto_9796 - PLACE
      ?auto_9799 - HOIST
      ?auto_9795 - SURFACE
      ?auto_9798 - TRUCK
      ?auto_9797 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9794 ?auto_9800 ) ( IS-CRATE ?auto_9793 ) ( not ( = ?auto_9792 ?auto_9793 ) ) ( not ( = ?auto_9791 ?auto_9792 ) ) ( not ( = ?auto_9791 ?auto_9793 ) ) ( not ( = ?auto_9796 ?auto_9800 ) ) ( HOIST-AT ?auto_9799 ?auto_9796 ) ( not ( = ?auto_9794 ?auto_9799 ) ) ( AVAILABLE ?auto_9799 ) ( SURFACE-AT ?auto_9793 ?auto_9796 ) ( ON ?auto_9793 ?auto_9795 ) ( CLEAR ?auto_9793 ) ( not ( = ?auto_9792 ?auto_9795 ) ) ( not ( = ?auto_9793 ?auto_9795 ) ) ( not ( = ?auto_9791 ?auto_9795 ) ) ( SURFACE-AT ?auto_9791 ?auto_9800 ) ( CLEAR ?auto_9791 ) ( IS-CRATE ?auto_9792 ) ( AVAILABLE ?auto_9794 ) ( IN ?auto_9792 ?auto_9798 ) ( TRUCK-AT ?auto_9798 ?auto_9797 ) ( not ( = ?auto_9797 ?auto_9800 ) ) ( not ( = ?auto_9796 ?auto_9797 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9792 ?auto_9793 )
      ( MAKE-2CRATE-VERIFY ?auto_9791 ?auto_9792 ?auto_9793 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9801 - SURFACE
      ?auto_9802 - SURFACE
    )
    :vars
    (
      ?auto_9803 - HOIST
      ?auto_9807 - PLACE
      ?auto_9805 - SURFACE
      ?auto_9808 - PLACE
      ?auto_9810 - HOIST
      ?auto_9804 - SURFACE
      ?auto_9806 - TRUCK
      ?auto_9809 - PLACE
      ?auto_9811 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9803 ?auto_9807 ) ( IS-CRATE ?auto_9802 ) ( not ( = ?auto_9801 ?auto_9802 ) ) ( not ( = ?auto_9805 ?auto_9801 ) ) ( not ( = ?auto_9805 ?auto_9802 ) ) ( not ( = ?auto_9808 ?auto_9807 ) ) ( HOIST-AT ?auto_9810 ?auto_9808 ) ( not ( = ?auto_9803 ?auto_9810 ) ) ( AVAILABLE ?auto_9810 ) ( SURFACE-AT ?auto_9802 ?auto_9808 ) ( ON ?auto_9802 ?auto_9804 ) ( CLEAR ?auto_9802 ) ( not ( = ?auto_9801 ?auto_9804 ) ) ( not ( = ?auto_9802 ?auto_9804 ) ) ( not ( = ?auto_9805 ?auto_9804 ) ) ( SURFACE-AT ?auto_9805 ?auto_9807 ) ( CLEAR ?auto_9805 ) ( IS-CRATE ?auto_9801 ) ( AVAILABLE ?auto_9803 ) ( TRUCK-AT ?auto_9806 ?auto_9809 ) ( not ( = ?auto_9809 ?auto_9807 ) ) ( not ( = ?auto_9808 ?auto_9809 ) ) ( HOIST-AT ?auto_9811 ?auto_9809 ) ( LIFTING ?auto_9811 ?auto_9801 ) ( not ( = ?auto_9803 ?auto_9811 ) ) ( not ( = ?auto_9810 ?auto_9811 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9811 ?auto_9801 ?auto_9806 ?auto_9809 )
      ( MAKE-2CRATE ?auto_9805 ?auto_9801 ?auto_9802 )
      ( MAKE-1CRATE-VERIFY ?auto_9801 ?auto_9802 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9812 - SURFACE
      ?auto_9813 - SURFACE
      ?auto_9814 - SURFACE
    )
    :vars
    (
      ?auto_9817 - HOIST
      ?auto_9822 - PLACE
      ?auto_9820 - PLACE
      ?auto_9818 - HOIST
      ?auto_9815 - SURFACE
      ?auto_9821 - TRUCK
      ?auto_9819 - PLACE
      ?auto_9816 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9817 ?auto_9822 ) ( IS-CRATE ?auto_9814 ) ( not ( = ?auto_9813 ?auto_9814 ) ) ( not ( = ?auto_9812 ?auto_9813 ) ) ( not ( = ?auto_9812 ?auto_9814 ) ) ( not ( = ?auto_9820 ?auto_9822 ) ) ( HOIST-AT ?auto_9818 ?auto_9820 ) ( not ( = ?auto_9817 ?auto_9818 ) ) ( AVAILABLE ?auto_9818 ) ( SURFACE-AT ?auto_9814 ?auto_9820 ) ( ON ?auto_9814 ?auto_9815 ) ( CLEAR ?auto_9814 ) ( not ( = ?auto_9813 ?auto_9815 ) ) ( not ( = ?auto_9814 ?auto_9815 ) ) ( not ( = ?auto_9812 ?auto_9815 ) ) ( SURFACE-AT ?auto_9812 ?auto_9822 ) ( CLEAR ?auto_9812 ) ( IS-CRATE ?auto_9813 ) ( AVAILABLE ?auto_9817 ) ( TRUCK-AT ?auto_9821 ?auto_9819 ) ( not ( = ?auto_9819 ?auto_9822 ) ) ( not ( = ?auto_9820 ?auto_9819 ) ) ( HOIST-AT ?auto_9816 ?auto_9819 ) ( LIFTING ?auto_9816 ?auto_9813 ) ( not ( = ?auto_9817 ?auto_9816 ) ) ( not ( = ?auto_9818 ?auto_9816 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9813 ?auto_9814 )
      ( MAKE-2CRATE-VERIFY ?auto_9812 ?auto_9813 ?auto_9814 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9823 - SURFACE
      ?auto_9824 - SURFACE
    )
    :vars
    (
      ?auto_9831 - HOIST
      ?auto_9830 - PLACE
      ?auto_9826 - SURFACE
      ?auto_9828 - PLACE
      ?auto_9827 - HOIST
      ?auto_9825 - SURFACE
      ?auto_9832 - TRUCK
      ?auto_9829 - PLACE
      ?auto_9833 - HOIST
      ?auto_9834 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9831 ?auto_9830 ) ( IS-CRATE ?auto_9824 ) ( not ( = ?auto_9823 ?auto_9824 ) ) ( not ( = ?auto_9826 ?auto_9823 ) ) ( not ( = ?auto_9826 ?auto_9824 ) ) ( not ( = ?auto_9828 ?auto_9830 ) ) ( HOIST-AT ?auto_9827 ?auto_9828 ) ( not ( = ?auto_9831 ?auto_9827 ) ) ( AVAILABLE ?auto_9827 ) ( SURFACE-AT ?auto_9824 ?auto_9828 ) ( ON ?auto_9824 ?auto_9825 ) ( CLEAR ?auto_9824 ) ( not ( = ?auto_9823 ?auto_9825 ) ) ( not ( = ?auto_9824 ?auto_9825 ) ) ( not ( = ?auto_9826 ?auto_9825 ) ) ( SURFACE-AT ?auto_9826 ?auto_9830 ) ( CLEAR ?auto_9826 ) ( IS-CRATE ?auto_9823 ) ( AVAILABLE ?auto_9831 ) ( TRUCK-AT ?auto_9832 ?auto_9829 ) ( not ( = ?auto_9829 ?auto_9830 ) ) ( not ( = ?auto_9828 ?auto_9829 ) ) ( HOIST-AT ?auto_9833 ?auto_9829 ) ( not ( = ?auto_9831 ?auto_9833 ) ) ( not ( = ?auto_9827 ?auto_9833 ) ) ( AVAILABLE ?auto_9833 ) ( SURFACE-AT ?auto_9823 ?auto_9829 ) ( ON ?auto_9823 ?auto_9834 ) ( CLEAR ?auto_9823 ) ( not ( = ?auto_9823 ?auto_9834 ) ) ( not ( = ?auto_9824 ?auto_9834 ) ) ( not ( = ?auto_9826 ?auto_9834 ) ) ( not ( = ?auto_9825 ?auto_9834 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9833 ?auto_9823 ?auto_9834 ?auto_9829 )
      ( MAKE-2CRATE ?auto_9826 ?auto_9823 ?auto_9824 )
      ( MAKE-1CRATE-VERIFY ?auto_9823 ?auto_9824 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9835 - SURFACE
      ?auto_9836 - SURFACE
      ?auto_9837 - SURFACE
    )
    :vars
    (
      ?auto_9846 - HOIST
      ?auto_9840 - PLACE
      ?auto_9844 - PLACE
      ?auto_9842 - HOIST
      ?auto_9845 - SURFACE
      ?auto_9838 - TRUCK
      ?auto_9839 - PLACE
      ?auto_9841 - HOIST
      ?auto_9843 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9846 ?auto_9840 ) ( IS-CRATE ?auto_9837 ) ( not ( = ?auto_9836 ?auto_9837 ) ) ( not ( = ?auto_9835 ?auto_9836 ) ) ( not ( = ?auto_9835 ?auto_9837 ) ) ( not ( = ?auto_9844 ?auto_9840 ) ) ( HOIST-AT ?auto_9842 ?auto_9844 ) ( not ( = ?auto_9846 ?auto_9842 ) ) ( AVAILABLE ?auto_9842 ) ( SURFACE-AT ?auto_9837 ?auto_9844 ) ( ON ?auto_9837 ?auto_9845 ) ( CLEAR ?auto_9837 ) ( not ( = ?auto_9836 ?auto_9845 ) ) ( not ( = ?auto_9837 ?auto_9845 ) ) ( not ( = ?auto_9835 ?auto_9845 ) ) ( SURFACE-AT ?auto_9835 ?auto_9840 ) ( CLEAR ?auto_9835 ) ( IS-CRATE ?auto_9836 ) ( AVAILABLE ?auto_9846 ) ( TRUCK-AT ?auto_9838 ?auto_9839 ) ( not ( = ?auto_9839 ?auto_9840 ) ) ( not ( = ?auto_9844 ?auto_9839 ) ) ( HOIST-AT ?auto_9841 ?auto_9839 ) ( not ( = ?auto_9846 ?auto_9841 ) ) ( not ( = ?auto_9842 ?auto_9841 ) ) ( AVAILABLE ?auto_9841 ) ( SURFACE-AT ?auto_9836 ?auto_9839 ) ( ON ?auto_9836 ?auto_9843 ) ( CLEAR ?auto_9836 ) ( not ( = ?auto_9836 ?auto_9843 ) ) ( not ( = ?auto_9837 ?auto_9843 ) ) ( not ( = ?auto_9835 ?auto_9843 ) ) ( not ( = ?auto_9845 ?auto_9843 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9836 ?auto_9837 )
      ( MAKE-2CRATE-VERIFY ?auto_9835 ?auto_9836 ?auto_9837 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9847 - SURFACE
      ?auto_9848 - SURFACE
    )
    :vars
    (
      ?auto_9856 - HOIST
      ?auto_9850 - PLACE
      ?auto_9855 - SURFACE
      ?auto_9851 - PLACE
      ?auto_9854 - HOIST
      ?auto_9849 - SURFACE
      ?auto_9858 - PLACE
      ?auto_9853 - HOIST
      ?auto_9852 - SURFACE
      ?auto_9857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9856 ?auto_9850 ) ( IS-CRATE ?auto_9848 ) ( not ( = ?auto_9847 ?auto_9848 ) ) ( not ( = ?auto_9855 ?auto_9847 ) ) ( not ( = ?auto_9855 ?auto_9848 ) ) ( not ( = ?auto_9851 ?auto_9850 ) ) ( HOIST-AT ?auto_9854 ?auto_9851 ) ( not ( = ?auto_9856 ?auto_9854 ) ) ( AVAILABLE ?auto_9854 ) ( SURFACE-AT ?auto_9848 ?auto_9851 ) ( ON ?auto_9848 ?auto_9849 ) ( CLEAR ?auto_9848 ) ( not ( = ?auto_9847 ?auto_9849 ) ) ( not ( = ?auto_9848 ?auto_9849 ) ) ( not ( = ?auto_9855 ?auto_9849 ) ) ( SURFACE-AT ?auto_9855 ?auto_9850 ) ( CLEAR ?auto_9855 ) ( IS-CRATE ?auto_9847 ) ( AVAILABLE ?auto_9856 ) ( not ( = ?auto_9858 ?auto_9850 ) ) ( not ( = ?auto_9851 ?auto_9858 ) ) ( HOIST-AT ?auto_9853 ?auto_9858 ) ( not ( = ?auto_9856 ?auto_9853 ) ) ( not ( = ?auto_9854 ?auto_9853 ) ) ( AVAILABLE ?auto_9853 ) ( SURFACE-AT ?auto_9847 ?auto_9858 ) ( ON ?auto_9847 ?auto_9852 ) ( CLEAR ?auto_9847 ) ( not ( = ?auto_9847 ?auto_9852 ) ) ( not ( = ?auto_9848 ?auto_9852 ) ) ( not ( = ?auto_9855 ?auto_9852 ) ) ( not ( = ?auto_9849 ?auto_9852 ) ) ( TRUCK-AT ?auto_9857 ?auto_9850 ) )
    :subtasks
    ( ( !DRIVE ?auto_9857 ?auto_9850 ?auto_9858 )
      ( MAKE-2CRATE ?auto_9855 ?auto_9847 ?auto_9848 )
      ( MAKE-1CRATE-VERIFY ?auto_9847 ?auto_9848 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9859 - SURFACE
      ?auto_9860 - SURFACE
      ?auto_9861 - SURFACE
    )
    :vars
    (
      ?auto_9864 - HOIST
      ?auto_9867 - PLACE
      ?auto_9868 - PLACE
      ?auto_9865 - HOIST
      ?auto_9863 - SURFACE
      ?auto_9869 - PLACE
      ?auto_9866 - HOIST
      ?auto_9862 - SURFACE
      ?auto_9870 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9864 ?auto_9867 ) ( IS-CRATE ?auto_9861 ) ( not ( = ?auto_9860 ?auto_9861 ) ) ( not ( = ?auto_9859 ?auto_9860 ) ) ( not ( = ?auto_9859 ?auto_9861 ) ) ( not ( = ?auto_9868 ?auto_9867 ) ) ( HOIST-AT ?auto_9865 ?auto_9868 ) ( not ( = ?auto_9864 ?auto_9865 ) ) ( AVAILABLE ?auto_9865 ) ( SURFACE-AT ?auto_9861 ?auto_9868 ) ( ON ?auto_9861 ?auto_9863 ) ( CLEAR ?auto_9861 ) ( not ( = ?auto_9860 ?auto_9863 ) ) ( not ( = ?auto_9861 ?auto_9863 ) ) ( not ( = ?auto_9859 ?auto_9863 ) ) ( SURFACE-AT ?auto_9859 ?auto_9867 ) ( CLEAR ?auto_9859 ) ( IS-CRATE ?auto_9860 ) ( AVAILABLE ?auto_9864 ) ( not ( = ?auto_9869 ?auto_9867 ) ) ( not ( = ?auto_9868 ?auto_9869 ) ) ( HOIST-AT ?auto_9866 ?auto_9869 ) ( not ( = ?auto_9864 ?auto_9866 ) ) ( not ( = ?auto_9865 ?auto_9866 ) ) ( AVAILABLE ?auto_9866 ) ( SURFACE-AT ?auto_9860 ?auto_9869 ) ( ON ?auto_9860 ?auto_9862 ) ( CLEAR ?auto_9860 ) ( not ( = ?auto_9860 ?auto_9862 ) ) ( not ( = ?auto_9861 ?auto_9862 ) ) ( not ( = ?auto_9859 ?auto_9862 ) ) ( not ( = ?auto_9863 ?auto_9862 ) ) ( TRUCK-AT ?auto_9870 ?auto_9867 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9860 ?auto_9861 )
      ( MAKE-2CRATE-VERIFY ?auto_9859 ?auto_9860 ?auto_9861 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9880 - SURFACE
      ?auto_9881 - SURFACE
    )
    :vars
    (
      ?auto_9882 - HOIST
      ?auto_9883 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9882 ?auto_9883 ) ( SURFACE-AT ?auto_9880 ?auto_9883 ) ( CLEAR ?auto_9880 ) ( LIFTING ?auto_9882 ?auto_9881 ) ( IS-CRATE ?auto_9881 ) ( not ( = ?auto_9880 ?auto_9881 ) ) )
    :subtasks
    ( ( !DROP ?auto_9882 ?auto_9881 ?auto_9880 ?auto_9883 )
      ( MAKE-1CRATE-VERIFY ?auto_9880 ?auto_9881 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9884 - SURFACE
      ?auto_9885 - SURFACE
      ?auto_9886 - SURFACE
    )
    :vars
    (
      ?auto_9888 - HOIST
      ?auto_9887 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9888 ?auto_9887 ) ( SURFACE-AT ?auto_9885 ?auto_9887 ) ( CLEAR ?auto_9885 ) ( LIFTING ?auto_9888 ?auto_9886 ) ( IS-CRATE ?auto_9886 ) ( not ( = ?auto_9885 ?auto_9886 ) ) ( ON ?auto_9885 ?auto_9884 ) ( not ( = ?auto_9884 ?auto_9885 ) ) ( not ( = ?auto_9884 ?auto_9886 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9885 ?auto_9886 )
      ( MAKE-2CRATE-VERIFY ?auto_9884 ?auto_9885 ?auto_9886 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9889 - SURFACE
      ?auto_9890 - SURFACE
      ?auto_9891 - SURFACE
      ?auto_9892 - SURFACE
    )
    :vars
    (
      ?auto_9894 - HOIST
      ?auto_9893 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9894 ?auto_9893 ) ( SURFACE-AT ?auto_9891 ?auto_9893 ) ( CLEAR ?auto_9891 ) ( LIFTING ?auto_9894 ?auto_9892 ) ( IS-CRATE ?auto_9892 ) ( not ( = ?auto_9891 ?auto_9892 ) ) ( ON ?auto_9890 ?auto_9889 ) ( ON ?auto_9891 ?auto_9890 ) ( not ( = ?auto_9889 ?auto_9890 ) ) ( not ( = ?auto_9889 ?auto_9891 ) ) ( not ( = ?auto_9889 ?auto_9892 ) ) ( not ( = ?auto_9890 ?auto_9891 ) ) ( not ( = ?auto_9890 ?auto_9892 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9891 ?auto_9892 )
      ( MAKE-3CRATE-VERIFY ?auto_9889 ?auto_9890 ?auto_9891 ?auto_9892 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9895 - SURFACE
      ?auto_9896 - SURFACE
    )
    :vars
    (
      ?auto_9898 - HOIST
      ?auto_9897 - PLACE
      ?auto_9899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9898 ?auto_9897 ) ( SURFACE-AT ?auto_9895 ?auto_9897 ) ( CLEAR ?auto_9895 ) ( IS-CRATE ?auto_9896 ) ( not ( = ?auto_9895 ?auto_9896 ) ) ( TRUCK-AT ?auto_9899 ?auto_9897 ) ( AVAILABLE ?auto_9898 ) ( IN ?auto_9896 ?auto_9899 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9898 ?auto_9896 ?auto_9899 ?auto_9897 )
      ( MAKE-1CRATE ?auto_9895 ?auto_9896 )
      ( MAKE-1CRATE-VERIFY ?auto_9895 ?auto_9896 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9900 - SURFACE
      ?auto_9901 - SURFACE
      ?auto_9902 - SURFACE
    )
    :vars
    (
      ?auto_9904 - HOIST
      ?auto_9905 - PLACE
      ?auto_9903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9904 ?auto_9905 ) ( SURFACE-AT ?auto_9901 ?auto_9905 ) ( CLEAR ?auto_9901 ) ( IS-CRATE ?auto_9902 ) ( not ( = ?auto_9901 ?auto_9902 ) ) ( TRUCK-AT ?auto_9903 ?auto_9905 ) ( AVAILABLE ?auto_9904 ) ( IN ?auto_9902 ?auto_9903 ) ( ON ?auto_9901 ?auto_9900 ) ( not ( = ?auto_9900 ?auto_9901 ) ) ( not ( = ?auto_9900 ?auto_9902 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9901 ?auto_9902 )
      ( MAKE-2CRATE-VERIFY ?auto_9900 ?auto_9901 ?auto_9902 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9906 - SURFACE
      ?auto_9907 - SURFACE
      ?auto_9908 - SURFACE
      ?auto_9909 - SURFACE
    )
    :vars
    (
      ?auto_9910 - HOIST
      ?auto_9911 - PLACE
      ?auto_9912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9910 ?auto_9911 ) ( SURFACE-AT ?auto_9908 ?auto_9911 ) ( CLEAR ?auto_9908 ) ( IS-CRATE ?auto_9909 ) ( not ( = ?auto_9908 ?auto_9909 ) ) ( TRUCK-AT ?auto_9912 ?auto_9911 ) ( AVAILABLE ?auto_9910 ) ( IN ?auto_9909 ?auto_9912 ) ( ON ?auto_9908 ?auto_9907 ) ( not ( = ?auto_9907 ?auto_9908 ) ) ( not ( = ?auto_9907 ?auto_9909 ) ) ( ON ?auto_9907 ?auto_9906 ) ( not ( = ?auto_9906 ?auto_9907 ) ) ( not ( = ?auto_9906 ?auto_9908 ) ) ( not ( = ?auto_9906 ?auto_9909 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9907 ?auto_9908 ?auto_9909 )
      ( MAKE-3CRATE-VERIFY ?auto_9906 ?auto_9907 ?auto_9908 ?auto_9909 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9913 - SURFACE
      ?auto_9914 - SURFACE
    )
    :vars
    (
      ?auto_9915 - HOIST
      ?auto_9917 - PLACE
      ?auto_9918 - TRUCK
      ?auto_9916 - SURFACE
      ?auto_9919 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9915 ?auto_9917 ) ( SURFACE-AT ?auto_9913 ?auto_9917 ) ( CLEAR ?auto_9913 ) ( IS-CRATE ?auto_9914 ) ( not ( = ?auto_9913 ?auto_9914 ) ) ( AVAILABLE ?auto_9915 ) ( IN ?auto_9914 ?auto_9918 ) ( ON ?auto_9913 ?auto_9916 ) ( not ( = ?auto_9916 ?auto_9913 ) ) ( not ( = ?auto_9916 ?auto_9914 ) ) ( TRUCK-AT ?auto_9918 ?auto_9919 ) ( not ( = ?auto_9919 ?auto_9917 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9918 ?auto_9919 ?auto_9917 )
      ( MAKE-2CRATE ?auto_9916 ?auto_9913 ?auto_9914 )
      ( MAKE-1CRATE-VERIFY ?auto_9913 ?auto_9914 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9920 - SURFACE
      ?auto_9921 - SURFACE
      ?auto_9922 - SURFACE
    )
    :vars
    (
      ?auto_9923 - HOIST
      ?auto_9924 - PLACE
      ?auto_9926 - TRUCK
      ?auto_9925 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9923 ?auto_9924 ) ( SURFACE-AT ?auto_9921 ?auto_9924 ) ( CLEAR ?auto_9921 ) ( IS-CRATE ?auto_9922 ) ( not ( = ?auto_9921 ?auto_9922 ) ) ( AVAILABLE ?auto_9923 ) ( IN ?auto_9922 ?auto_9926 ) ( ON ?auto_9921 ?auto_9920 ) ( not ( = ?auto_9920 ?auto_9921 ) ) ( not ( = ?auto_9920 ?auto_9922 ) ) ( TRUCK-AT ?auto_9926 ?auto_9925 ) ( not ( = ?auto_9925 ?auto_9924 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9921 ?auto_9922 )
      ( MAKE-2CRATE-VERIFY ?auto_9920 ?auto_9921 ?auto_9922 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9927 - SURFACE
      ?auto_9928 - SURFACE
      ?auto_9929 - SURFACE
      ?auto_9930 - SURFACE
    )
    :vars
    (
      ?auto_9931 - HOIST
      ?auto_9932 - PLACE
      ?auto_9933 - TRUCK
      ?auto_9934 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9931 ?auto_9932 ) ( SURFACE-AT ?auto_9929 ?auto_9932 ) ( CLEAR ?auto_9929 ) ( IS-CRATE ?auto_9930 ) ( not ( = ?auto_9929 ?auto_9930 ) ) ( AVAILABLE ?auto_9931 ) ( IN ?auto_9930 ?auto_9933 ) ( ON ?auto_9929 ?auto_9928 ) ( not ( = ?auto_9928 ?auto_9929 ) ) ( not ( = ?auto_9928 ?auto_9930 ) ) ( TRUCK-AT ?auto_9933 ?auto_9934 ) ( not ( = ?auto_9934 ?auto_9932 ) ) ( ON ?auto_9928 ?auto_9927 ) ( not ( = ?auto_9927 ?auto_9928 ) ) ( not ( = ?auto_9927 ?auto_9929 ) ) ( not ( = ?auto_9927 ?auto_9930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9928 ?auto_9929 ?auto_9930 )
      ( MAKE-3CRATE-VERIFY ?auto_9927 ?auto_9928 ?auto_9929 ?auto_9930 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9935 - SURFACE
      ?auto_9936 - SURFACE
    )
    :vars
    (
      ?auto_9937 - HOIST
      ?auto_9939 - PLACE
      ?auto_9938 - SURFACE
      ?auto_9940 - TRUCK
      ?auto_9941 - PLACE
      ?auto_9942 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9937 ?auto_9939 ) ( SURFACE-AT ?auto_9935 ?auto_9939 ) ( CLEAR ?auto_9935 ) ( IS-CRATE ?auto_9936 ) ( not ( = ?auto_9935 ?auto_9936 ) ) ( AVAILABLE ?auto_9937 ) ( ON ?auto_9935 ?auto_9938 ) ( not ( = ?auto_9938 ?auto_9935 ) ) ( not ( = ?auto_9938 ?auto_9936 ) ) ( TRUCK-AT ?auto_9940 ?auto_9941 ) ( not ( = ?auto_9941 ?auto_9939 ) ) ( HOIST-AT ?auto_9942 ?auto_9941 ) ( LIFTING ?auto_9942 ?auto_9936 ) ( not ( = ?auto_9937 ?auto_9942 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9942 ?auto_9936 ?auto_9940 ?auto_9941 )
      ( MAKE-2CRATE ?auto_9938 ?auto_9935 ?auto_9936 )
      ( MAKE-1CRATE-VERIFY ?auto_9935 ?auto_9936 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9943 - SURFACE
      ?auto_9944 - SURFACE
      ?auto_9945 - SURFACE
    )
    :vars
    (
      ?auto_9948 - HOIST
      ?auto_9950 - PLACE
      ?auto_9949 - TRUCK
      ?auto_9946 - PLACE
      ?auto_9947 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9948 ?auto_9950 ) ( SURFACE-AT ?auto_9944 ?auto_9950 ) ( CLEAR ?auto_9944 ) ( IS-CRATE ?auto_9945 ) ( not ( = ?auto_9944 ?auto_9945 ) ) ( AVAILABLE ?auto_9948 ) ( ON ?auto_9944 ?auto_9943 ) ( not ( = ?auto_9943 ?auto_9944 ) ) ( not ( = ?auto_9943 ?auto_9945 ) ) ( TRUCK-AT ?auto_9949 ?auto_9946 ) ( not ( = ?auto_9946 ?auto_9950 ) ) ( HOIST-AT ?auto_9947 ?auto_9946 ) ( LIFTING ?auto_9947 ?auto_9945 ) ( not ( = ?auto_9948 ?auto_9947 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9944 ?auto_9945 )
      ( MAKE-2CRATE-VERIFY ?auto_9943 ?auto_9944 ?auto_9945 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9951 - SURFACE
      ?auto_9952 - SURFACE
      ?auto_9953 - SURFACE
      ?auto_9954 - SURFACE
    )
    :vars
    (
      ?auto_9955 - HOIST
      ?auto_9959 - PLACE
      ?auto_9957 - TRUCK
      ?auto_9956 - PLACE
      ?auto_9958 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9955 ?auto_9959 ) ( SURFACE-AT ?auto_9953 ?auto_9959 ) ( CLEAR ?auto_9953 ) ( IS-CRATE ?auto_9954 ) ( not ( = ?auto_9953 ?auto_9954 ) ) ( AVAILABLE ?auto_9955 ) ( ON ?auto_9953 ?auto_9952 ) ( not ( = ?auto_9952 ?auto_9953 ) ) ( not ( = ?auto_9952 ?auto_9954 ) ) ( TRUCK-AT ?auto_9957 ?auto_9956 ) ( not ( = ?auto_9956 ?auto_9959 ) ) ( HOIST-AT ?auto_9958 ?auto_9956 ) ( LIFTING ?auto_9958 ?auto_9954 ) ( not ( = ?auto_9955 ?auto_9958 ) ) ( ON ?auto_9952 ?auto_9951 ) ( not ( = ?auto_9951 ?auto_9952 ) ) ( not ( = ?auto_9951 ?auto_9953 ) ) ( not ( = ?auto_9951 ?auto_9954 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9952 ?auto_9953 ?auto_9954 )
      ( MAKE-3CRATE-VERIFY ?auto_9951 ?auto_9952 ?auto_9953 ?auto_9954 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9960 - SURFACE
      ?auto_9961 - SURFACE
    )
    :vars
    (
      ?auto_9962 - HOIST
      ?auto_9967 - PLACE
      ?auto_9965 - SURFACE
      ?auto_9964 - TRUCK
      ?auto_9963 - PLACE
      ?auto_9966 - HOIST
      ?auto_9968 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9962 ?auto_9967 ) ( SURFACE-AT ?auto_9960 ?auto_9967 ) ( CLEAR ?auto_9960 ) ( IS-CRATE ?auto_9961 ) ( not ( = ?auto_9960 ?auto_9961 ) ) ( AVAILABLE ?auto_9962 ) ( ON ?auto_9960 ?auto_9965 ) ( not ( = ?auto_9965 ?auto_9960 ) ) ( not ( = ?auto_9965 ?auto_9961 ) ) ( TRUCK-AT ?auto_9964 ?auto_9963 ) ( not ( = ?auto_9963 ?auto_9967 ) ) ( HOIST-AT ?auto_9966 ?auto_9963 ) ( not ( = ?auto_9962 ?auto_9966 ) ) ( AVAILABLE ?auto_9966 ) ( SURFACE-AT ?auto_9961 ?auto_9963 ) ( ON ?auto_9961 ?auto_9968 ) ( CLEAR ?auto_9961 ) ( not ( = ?auto_9960 ?auto_9968 ) ) ( not ( = ?auto_9961 ?auto_9968 ) ) ( not ( = ?auto_9965 ?auto_9968 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9966 ?auto_9961 ?auto_9968 ?auto_9963 )
      ( MAKE-2CRATE ?auto_9965 ?auto_9960 ?auto_9961 )
      ( MAKE-1CRATE-VERIFY ?auto_9960 ?auto_9961 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9969 - SURFACE
      ?auto_9970 - SURFACE
      ?auto_9971 - SURFACE
    )
    :vars
    (
      ?auto_9976 - HOIST
      ?auto_9972 - PLACE
      ?auto_9975 - TRUCK
      ?auto_9977 - PLACE
      ?auto_9973 - HOIST
      ?auto_9974 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9976 ?auto_9972 ) ( SURFACE-AT ?auto_9970 ?auto_9972 ) ( CLEAR ?auto_9970 ) ( IS-CRATE ?auto_9971 ) ( not ( = ?auto_9970 ?auto_9971 ) ) ( AVAILABLE ?auto_9976 ) ( ON ?auto_9970 ?auto_9969 ) ( not ( = ?auto_9969 ?auto_9970 ) ) ( not ( = ?auto_9969 ?auto_9971 ) ) ( TRUCK-AT ?auto_9975 ?auto_9977 ) ( not ( = ?auto_9977 ?auto_9972 ) ) ( HOIST-AT ?auto_9973 ?auto_9977 ) ( not ( = ?auto_9976 ?auto_9973 ) ) ( AVAILABLE ?auto_9973 ) ( SURFACE-AT ?auto_9971 ?auto_9977 ) ( ON ?auto_9971 ?auto_9974 ) ( CLEAR ?auto_9971 ) ( not ( = ?auto_9970 ?auto_9974 ) ) ( not ( = ?auto_9971 ?auto_9974 ) ) ( not ( = ?auto_9969 ?auto_9974 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9970 ?auto_9971 )
      ( MAKE-2CRATE-VERIFY ?auto_9969 ?auto_9970 ?auto_9971 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9978 - SURFACE
      ?auto_9979 - SURFACE
      ?auto_9980 - SURFACE
      ?auto_9981 - SURFACE
    )
    :vars
    (
      ?auto_9982 - HOIST
      ?auto_9986 - PLACE
      ?auto_9987 - TRUCK
      ?auto_9983 - PLACE
      ?auto_9985 - HOIST
      ?auto_9984 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9982 ?auto_9986 ) ( SURFACE-AT ?auto_9980 ?auto_9986 ) ( CLEAR ?auto_9980 ) ( IS-CRATE ?auto_9981 ) ( not ( = ?auto_9980 ?auto_9981 ) ) ( AVAILABLE ?auto_9982 ) ( ON ?auto_9980 ?auto_9979 ) ( not ( = ?auto_9979 ?auto_9980 ) ) ( not ( = ?auto_9979 ?auto_9981 ) ) ( TRUCK-AT ?auto_9987 ?auto_9983 ) ( not ( = ?auto_9983 ?auto_9986 ) ) ( HOIST-AT ?auto_9985 ?auto_9983 ) ( not ( = ?auto_9982 ?auto_9985 ) ) ( AVAILABLE ?auto_9985 ) ( SURFACE-AT ?auto_9981 ?auto_9983 ) ( ON ?auto_9981 ?auto_9984 ) ( CLEAR ?auto_9981 ) ( not ( = ?auto_9980 ?auto_9984 ) ) ( not ( = ?auto_9981 ?auto_9984 ) ) ( not ( = ?auto_9979 ?auto_9984 ) ) ( ON ?auto_9979 ?auto_9978 ) ( not ( = ?auto_9978 ?auto_9979 ) ) ( not ( = ?auto_9978 ?auto_9980 ) ) ( not ( = ?auto_9978 ?auto_9981 ) ) ( not ( = ?auto_9978 ?auto_9984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9979 ?auto_9980 ?auto_9981 )
      ( MAKE-3CRATE-VERIFY ?auto_9978 ?auto_9979 ?auto_9980 ?auto_9981 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9988 - SURFACE
      ?auto_9989 - SURFACE
    )
    :vars
    (
      ?auto_9990 - HOIST
      ?auto_9995 - PLACE
      ?auto_9992 - SURFACE
      ?auto_9991 - PLACE
      ?auto_9994 - HOIST
      ?auto_9993 - SURFACE
      ?auto_9996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9990 ?auto_9995 ) ( SURFACE-AT ?auto_9988 ?auto_9995 ) ( CLEAR ?auto_9988 ) ( IS-CRATE ?auto_9989 ) ( not ( = ?auto_9988 ?auto_9989 ) ) ( AVAILABLE ?auto_9990 ) ( ON ?auto_9988 ?auto_9992 ) ( not ( = ?auto_9992 ?auto_9988 ) ) ( not ( = ?auto_9992 ?auto_9989 ) ) ( not ( = ?auto_9991 ?auto_9995 ) ) ( HOIST-AT ?auto_9994 ?auto_9991 ) ( not ( = ?auto_9990 ?auto_9994 ) ) ( AVAILABLE ?auto_9994 ) ( SURFACE-AT ?auto_9989 ?auto_9991 ) ( ON ?auto_9989 ?auto_9993 ) ( CLEAR ?auto_9989 ) ( not ( = ?auto_9988 ?auto_9993 ) ) ( not ( = ?auto_9989 ?auto_9993 ) ) ( not ( = ?auto_9992 ?auto_9993 ) ) ( TRUCK-AT ?auto_9996 ?auto_9995 ) )
    :subtasks
    ( ( !DRIVE ?auto_9996 ?auto_9995 ?auto_9991 )
      ( MAKE-2CRATE ?auto_9992 ?auto_9988 ?auto_9989 )
      ( MAKE-1CRATE-VERIFY ?auto_9988 ?auto_9989 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9997 - SURFACE
      ?auto_9998 - SURFACE
      ?auto_9999 - SURFACE
    )
    :vars
    (
      ?auto_10001 - HOIST
      ?auto_10004 - PLACE
      ?auto_10002 - PLACE
      ?auto_10005 - HOIST
      ?auto_10000 - SURFACE
      ?auto_10003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10001 ?auto_10004 ) ( SURFACE-AT ?auto_9998 ?auto_10004 ) ( CLEAR ?auto_9998 ) ( IS-CRATE ?auto_9999 ) ( not ( = ?auto_9998 ?auto_9999 ) ) ( AVAILABLE ?auto_10001 ) ( ON ?auto_9998 ?auto_9997 ) ( not ( = ?auto_9997 ?auto_9998 ) ) ( not ( = ?auto_9997 ?auto_9999 ) ) ( not ( = ?auto_10002 ?auto_10004 ) ) ( HOIST-AT ?auto_10005 ?auto_10002 ) ( not ( = ?auto_10001 ?auto_10005 ) ) ( AVAILABLE ?auto_10005 ) ( SURFACE-AT ?auto_9999 ?auto_10002 ) ( ON ?auto_9999 ?auto_10000 ) ( CLEAR ?auto_9999 ) ( not ( = ?auto_9998 ?auto_10000 ) ) ( not ( = ?auto_9999 ?auto_10000 ) ) ( not ( = ?auto_9997 ?auto_10000 ) ) ( TRUCK-AT ?auto_10003 ?auto_10004 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9998 ?auto_9999 )
      ( MAKE-2CRATE-VERIFY ?auto_9997 ?auto_9998 ?auto_9999 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10006 - SURFACE
      ?auto_10007 - SURFACE
      ?auto_10008 - SURFACE
      ?auto_10009 - SURFACE
    )
    :vars
    (
      ?auto_10014 - HOIST
      ?auto_10015 - PLACE
      ?auto_10012 - PLACE
      ?auto_10010 - HOIST
      ?auto_10013 - SURFACE
      ?auto_10011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10014 ?auto_10015 ) ( SURFACE-AT ?auto_10008 ?auto_10015 ) ( CLEAR ?auto_10008 ) ( IS-CRATE ?auto_10009 ) ( not ( = ?auto_10008 ?auto_10009 ) ) ( AVAILABLE ?auto_10014 ) ( ON ?auto_10008 ?auto_10007 ) ( not ( = ?auto_10007 ?auto_10008 ) ) ( not ( = ?auto_10007 ?auto_10009 ) ) ( not ( = ?auto_10012 ?auto_10015 ) ) ( HOIST-AT ?auto_10010 ?auto_10012 ) ( not ( = ?auto_10014 ?auto_10010 ) ) ( AVAILABLE ?auto_10010 ) ( SURFACE-AT ?auto_10009 ?auto_10012 ) ( ON ?auto_10009 ?auto_10013 ) ( CLEAR ?auto_10009 ) ( not ( = ?auto_10008 ?auto_10013 ) ) ( not ( = ?auto_10009 ?auto_10013 ) ) ( not ( = ?auto_10007 ?auto_10013 ) ) ( TRUCK-AT ?auto_10011 ?auto_10015 ) ( ON ?auto_10007 ?auto_10006 ) ( not ( = ?auto_10006 ?auto_10007 ) ) ( not ( = ?auto_10006 ?auto_10008 ) ) ( not ( = ?auto_10006 ?auto_10009 ) ) ( not ( = ?auto_10006 ?auto_10013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10007 ?auto_10008 ?auto_10009 )
      ( MAKE-3CRATE-VERIFY ?auto_10006 ?auto_10007 ?auto_10008 ?auto_10009 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10016 - SURFACE
      ?auto_10017 - SURFACE
    )
    :vars
    (
      ?auto_10023 - HOIST
      ?auto_10024 - PLACE
      ?auto_10018 - SURFACE
      ?auto_10021 - PLACE
      ?auto_10019 - HOIST
      ?auto_10022 - SURFACE
      ?auto_10020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10023 ?auto_10024 ) ( IS-CRATE ?auto_10017 ) ( not ( = ?auto_10016 ?auto_10017 ) ) ( not ( = ?auto_10018 ?auto_10016 ) ) ( not ( = ?auto_10018 ?auto_10017 ) ) ( not ( = ?auto_10021 ?auto_10024 ) ) ( HOIST-AT ?auto_10019 ?auto_10021 ) ( not ( = ?auto_10023 ?auto_10019 ) ) ( AVAILABLE ?auto_10019 ) ( SURFACE-AT ?auto_10017 ?auto_10021 ) ( ON ?auto_10017 ?auto_10022 ) ( CLEAR ?auto_10017 ) ( not ( = ?auto_10016 ?auto_10022 ) ) ( not ( = ?auto_10017 ?auto_10022 ) ) ( not ( = ?auto_10018 ?auto_10022 ) ) ( TRUCK-AT ?auto_10020 ?auto_10024 ) ( SURFACE-AT ?auto_10018 ?auto_10024 ) ( CLEAR ?auto_10018 ) ( LIFTING ?auto_10023 ?auto_10016 ) ( IS-CRATE ?auto_10016 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10018 ?auto_10016 )
      ( MAKE-2CRATE ?auto_10018 ?auto_10016 ?auto_10017 )
      ( MAKE-1CRATE-VERIFY ?auto_10016 ?auto_10017 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10025 - SURFACE
      ?auto_10026 - SURFACE
      ?auto_10027 - SURFACE
    )
    :vars
    (
      ?auto_10031 - HOIST
      ?auto_10028 - PLACE
      ?auto_10029 - PLACE
      ?auto_10032 - HOIST
      ?auto_10030 - SURFACE
      ?auto_10033 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10031 ?auto_10028 ) ( IS-CRATE ?auto_10027 ) ( not ( = ?auto_10026 ?auto_10027 ) ) ( not ( = ?auto_10025 ?auto_10026 ) ) ( not ( = ?auto_10025 ?auto_10027 ) ) ( not ( = ?auto_10029 ?auto_10028 ) ) ( HOIST-AT ?auto_10032 ?auto_10029 ) ( not ( = ?auto_10031 ?auto_10032 ) ) ( AVAILABLE ?auto_10032 ) ( SURFACE-AT ?auto_10027 ?auto_10029 ) ( ON ?auto_10027 ?auto_10030 ) ( CLEAR ?auto_10027 ) ( not ( = ?auto_10026 ?auto_10030 ) ) ( not ( = ?auto_10027 ?auto_10030 ) ) ( not ( = ?auto_10025 ?auto_10030 ) ) ( TRUCK-AT ?auto_10033 ?auto_10028 ) ( SURFACE-AT ?auto_10025 ?auto_10028 ) ( CLEAR ?auto_10025 ) ( LIFTING ?auto_10031 ?auto_10026 ) ( IS-CRATE ?auto_10026 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10026 ?auto_10027 )
      ( MAKE-2CRATE-VERIFY ?auto_10025 ?auto_10026 ?auto_10027 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10034 - SURFACE
      ?auto_10035 - SURFACE
      ?auto_10036 - SURFACE
      ?auto_10037 - SURFACE
    )
    :vars
    (
      ?auto_10042 - HOIST
      ?auto_10039 - PLACE
      ?auto_10040 - PLACE
      ?auto_10043 - HOIST
      ?auto_10041 - SURFACE
      ?auto_10038 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10042 ?auto_10039 ) ( IS-CRATE ?auto_10037 ) ( not ( = ?auto_10036 ?auto_10037 ) ) ( not ( = ?auto_10035 ?auto_10036 ) ) ( not ( = ?auto_10035 ?auto_10037 ) ) ( not ( = ?auto_10040 ?auto_10039 ) ) ( HOIST-AT ?auto_10043 ?auto_10040 ) ( not ( = ?auto_10042 ?auto_10043 ) ) ( AVAILABLE ?auto_10043 ) ( SURFACE-AT ?auto_10037 ?auto_10040 ) ( ON ?auto_10037 ?auto_10041 ) ( CLEAR ?auto_10037 ) ( not ( = ?auto_10036 ?auto_10041 ) ) ( not ( = ?auto_10037 ?auto_10041 ) ) ( not ( = ?auto_10035 ?auto_10041 ) ) ( TRUCK-AT ?auto_10038 ?auto_10039 ) ( SURFACE-AT ?auto_10035 ?auto_10039 ) ( CLEAR ?auto_10035 ) ( LIFTING ?auto_10042 ?auto_10036 ) ( IS-CRATE ?auto_10036 ) ( ON ?auto_10035 ?auto_10034 ) ( not ( = ?auto_10034 ?auto_10035 ) ) ( not ( = ?auto_10034 ?auto_10036 ) ) ( not ( = ?auto_10034 ?auto_10037 ) ) ( not ( = ?auto_10034 ?auto_10041 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10035 ?auto_10036 ?auto_10037 )
      ( MAKE-3CRATE-VERIFY ?auto_10034 ?auto_10035 ?auto_10036 ?auto_10037 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10044 - SURFACE
      ?auto_10045 - SURFACE
    )
    :vars
    (
      ?auto_10051 - HOIST
      ?auto_10048 - PLACE
      ?auto_10047 - SURFACE
      ?auto_10049 - PLACE
      ?auto_10052 - HOIST
      ?auto_10050 - SURFACE
      ?auto_10046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10051 ?auto_10048 ) ( IS-CRATE ?auto_10045 ) ( not ( = ?auto_10044 ?auto_10045 ) ) ( not ( = ?auto_10047 ?auto_10044 ) ) ( not ( = ?auto_10047 ?auto_10045 ) ) ( not ( = ?auto_10049 ?auto_10048 ) ) ( HOIST-AT ?auto_10052 ?auto_10049 ) ( not ( = ?auto_10051 ?auto_10052 ) ) ( AVAILABLE ?auto_10052 ) ( SURFACE-AT ?auto_10045 ?auto_10049 ) ( ON ?auto_10045 ?auto_10050 ) ( CLEAR ?auto_10045 ) ( not ( = ?auto_10044 ?auto_10050 ) ) ( not ( = ?auto_10045 ?auto_10050 ) ) ( not ( = ?auto_10047 ?auto_10050 ) ) ( TRUCK-AT ?auto_10046 ?auto_10048 ) ( SURFACE-AT ?auto_10047 ?auto_10048 ) ( CLEAR ?auto_10047 ) ( IS-CRATE ?auto_10044 ) ( AVAILABLE ?auto_10051 ) ( IN ?auto_10044 ?auto_10046 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10051 ?auto_10044 ?auto_10046 ?auto_10048 )
      ( MAKE-2CRATE ?auto_10047 ?auto_10044 ?auto_10045 )
      ( MAKE-1CRATE-VERIFY ?auto_10044 ?auto_10045 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10053 - SURFACE
      ?auto_10054 - SURFACE
      ?auto_10055 - SURFACE
    )
    :vars
    (
      ?auto_10061 - HOIST
      ?auto_10060 - PLACE
      ?auto_10056 - PLACE
      ?auto_10057 - HOIST
      ?auto_10058 - SURFACE
      ?auto_10059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10061 ?auto_10060 ) ( IS-CRATE ?auto_10055 ) ( not ( = ?auto_10054 ?auto_10055 ) ) ( not ( = ?auto_10053 ?auto_10054 ) ) ( not ( = ?auto_10053 ?auto_10055 ) ) ( not ( = ?auto_10056 ?auto_10060 ) ) ( HOIST-AT ?auto_10057 ?auto_10056 ) ( not ( = ?auto_10061 ?auto_10057 ) ) ( AVAILABLE ?auto_10057 ) ( SURFACE-AT ?auto_10055 ?auto_10056 ) ( ON ?auto_10055 ?auto_10058 ) ( CLEAR ?auto_10055 ) ( not ( = ?auto_10054 ?auto_10058 ) ) ( not ( = ?auto_10055 ?auto_10058 ) ) ( not ( = ?auto_10053 ?auto_10058 ) ) ( TRUCK-AT ?auto_10059 ?auto_10060 ) ( SURFACE-AT ?auto_10053 ?auto_10060 ) ( CLEAR ?auto_10053 ) ( IS-CRATE ?auto_10054 ) ( AVAILABLE ?auto_10061 ) ( IN ?auto_10054 ?auto_10059 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10054 ?auto_10055 )
      ( MAKE-2CRATE-VERIFY ?auto_10053 ?auto_10054 ?auto_10055 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10062 - SURFACE
      ?auto_10063 - SURFACE
      ?auto_10064 - SURFACE
      ?auto_10065 - SURFACE
    )
    :vars
    (
      ?auto_10070 - HOIST
      ?auto_10067 - PLACE
      ?auto_10068 - PLACE
      ?auto_10069 - HOIST
      ?auto_10066 - SURFACE
      ?auto_10071 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10070 ?auto_10067 ) ( IS-CRATE ?auto_10065 ) ( not ( = ?auto_10064 ?auto_10065 ) ) ( not ( = ?auto_10063 ?auto_10064 ) ) ( not ( = ?auto_10063 ?auto_10065 ) ) ( not ( = ?auto_10068 ?auto_10067 ) ) ( HOIST-AT ?auto_10069 ?auto_10068 ) ( not ( = ?auto_10070 ?auto_10069 ) ) ( AVAILABLE ?auto_10069 ) ( SURFACE-AT ?auto_10065 ?auto_10068 ) ( ON ?auto_10065 ?auto_10066 ) ( CLEAR ?auto_10065 ) ( not ( = ?auto_10064 ?auto_10066 ) ) ( not ( = ?auto_10065 ?auto_10066 ) ) ( not ( = ?auto_10063 ?auto_10066 ) ) ( TRUCK-AT ?auto_10071 ?auto_10067 ) ( SURFACE-AT ?auto_10063 ?auto_10067 ) ( CLEAR ?auto_10063 ) ( IS-CRATE ?auto_10064 ) ( AVAILABLE ?auto_10070 ) ( IN ?auto_10064 ?auto_10071 ) ( ON ?auto_10063 ?auto_10062 ) ( not ( = ?auto_10062 ?auto_10063 ) ) ( not ( = ?auto_10062 ?auto_10064 ) ) ( not ( = ?auto_10062 ?auto_10065 ) ) ( not ( = ?auto_10062 ?auto_10066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10063 ?auto_10064 ?auto_10065 )
      ( MAKE-3CRATE-VERIFY ?auto_10062 ?auto_10063 ?auto_10064 ?auto_10065 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10072 - SURFACE
      ?auto_10073 - SURFACE
    )
    :vars
    (
      ?auto_10079 - HOIST
      ?auto_10075 - PLACE
      ?auto_10076 - SURFACE
      ?auto_10077 - PLACE
      ?auto_10078 - HOIST
      ?auto_10074 - SURFACE
      ?auto_10080 - TRUCK
      ?auto_10081 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10079 ?auto_10075 ) ( IS-CRATE ?auto_10073 ) ( not ( = ?auto_10072 ?auto_10073 ) ) ( not ( = ?auto_10076 ?auto_10072 ) ) ( not ( = ?auto_10076 ?auto_10073 ) ) ( not ( = ?auto_10077 ?auto_10075 ) ) ( HOIST-AT ?auto_10078 ?auto_10077 ) ( not ( = ?auto_10079 ?auto_10078 ) ) ( AVAILABLE ?auto_10078 ) ( SURFACE-AT ?auto_10073 ?auto_10077 ) ( ON ?auto_10073 ?auto_10074 ) ( CLEAR ?auto_10073 ) ( not ( = ?auto_10072 ?auto_10074 ) ) ( not ( = ?auto_10073 ?auto_10074 ) ) ( not ( = ?auto_10076 ?auto_10074 ) ) ( SURFACE-AT ?auto_10076 ?auto_10075 ) ( CLEAR ?auto_10076 ) ( IS-CRATE ?auto_10072 ) ( AVAILABLE ?auto_10079 ) ( IN ?auto_10072 ?auto_10080 ) ( TRUCK-AT ?auto_10080 ?auto_10081 ) ( not ( = ?auto_10081 ?auto_10075 ) ) ( not ( = ?auto_10077 ?auto_10081 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10080 ?auto_10081 ?auto_10075 )
      ( MAKE-2CRATE ?auto_10076 ?auto_10072 ?auto_10073 )
      ( MAKE-1CRATE-VERIFY ?auto_10072 ?auto_10073 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10082 - SURFACE
      ?auto_10083 - SURFACE
      ?auto_10084 - SURFACE
    )
    :vars
    (
      ?auto_10090 - HOIST
      ?auto_10088 - PLACE
      ?auto_10089 - PLACE
      ?auto_10085 - HOIST
      ?auto_10091 - SURFACE
      ?auto_10087 - TRUCK
      ?auto_10086 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10090 ?auto_10088 ) ( IS-CRATE ?auto_10084 ) ( not ( = ?auto_10083 ?auto_10084 ) ) ( not ( = ?auto_10082 ?auto_10083 ) ) ( not ( = ?auto_10082 ?auto_10084 ) ) ( not ( = ?auto_10089 ?auto_10088 ) ) ( HOIST-AT ?auto_10085 ?auto_10089 ) ( not ( = ?auto_10090 ?auto_10085 ) ) ( AVAILABLE ?auto_10085 ) ( SURFACE-AT ?auto_10084 ?auto_10089 ) ( ON ?auto_10084 ?auto_10091 ) ( CLEAR ?auto_10084 ) ( not ( = ?auto_10083 ?auto_10091 ) ) ( not ( = ?auto_10084 ?auto_10091 ) ) ( not ( = ?auto_10082 ?auto_10091 ) ) ( SURFACE-AT ?auto_10082 ?auto_10088 ) ( CLEAR ?auto_10082 ) ( IS-CRATE ?auto_10083 ) ( AVAILABLE ?auto_10090 ) ( IN ?auto_10083 ?auto_10087 ) ( TRUCK-AT ?auto_10087 ?auto_10086 ) ( not ( = ?auto_10086 ?auto_10088 ) ) ( not ( = ?auto_10089 ?auto_10086 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10083 ?auto_10084 )
      ( MAKE-2CRATE-VERIFY ?auto_10082 ?auto_10083 ?auto_10084 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10092 - SURFACE
      ?auto_10093 - SURFACE
      ?auto_10094 - SURFACE
      ?auto_10095 - SURFACE
    )
    :vars
    (
      ?auto_10096 - HOIST
      ?auto_10099 - PLACE
      ?auto_10098 - PLACE
      ?auto_10102 - HOIST
      ?auto_10100 - SURFACE
      ?auto_10101 - TRUCK
      ?auto_10097 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10096 ?auto_10099 ) ( IS-CRATE ?auto_10095 ) ( not ( = ?auto_10094 ?auto_10095 ) ) ( not ( = ?auto_10093 ?auto_10094 ) ) ( not ( = ?auto_10093 ?auto_10095 ) ) ( not ( = ?auto_10098 ?auto_10099 ) ) ( HOIST-AT ?auto_10102 ?auto_10098 ) ( not ( = ?auto_10096 ?auto_10102 ) ) ( AVAILABLE ?auto_10102 ) ( SURFACE-AT ?auto_10095 ?auto_10098 ) ( ON ?auto_10095 ?auto_10100 ) ( CLEAR ?auto_10095 ) ( not ( = ?auto_10094 ?auto_10100 ) ) ( not ( = ?auto_10095 ?auto_10100 ) ) ( not ( = ?auto_10093 ?auto_10100 ) ) ( SURFACE-AT ?auto_10093 ?auto_10099 ) ( CLEAR ?auto_10093 ) ( IS-CRATE ?auto_10094 ) ( AVAILABLE ?auto_10096 ) ( IN ?auto_10094 ?auto_10101 ) ( TRUCK-AT ?auto_10101 ?auto_10097 ) ( not ( = ?auto_10097 ?auto_10099 ) ) ( not ( = ?auto_10098 ?auto_10097 ) ) ( ON ?auto_10093 ?auto_10092 ) ( not ( = ?auto_10092 ?auto_10093 ) ) ( not ( = ?auto_10092 ?auto_10094 ) ) ( not ( = ?auto_10092 ?auto_10095 ) ) ( not ( = ?auto_10092 ?auto_10100 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10093 ?auto_10094 ?auto_10095 )
      ( MAKE-3CRATE-VERIFY ?auto_10092 ?auto_10093 ?auto_10094 ?auto_10095 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10103 - SURFACE
      ?auto_10104 - SURFACE
    )
    :vars
    (
      ?auto_10105 - HOIST
      ?auto_10108 - PLACE
      ?auto_10111 - SURFACE
      ?auto_10107 - PLACE
      ?auto_10112 - HOIST
      ?auto_10109 - SURFACE
      ?auto_10110 - TRUCK
      ?auto_10106 - PLACE
      ?auto_10113 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10105 ?auto_10108 ) ( IS-CRATE ?auto_10104 ) ( not ( = ?auto_10103 ?auto_10104 ) ) ( not ( = ?auto_10111 ?auto_10103 ) ) ( not ( = ?auto_10111 ?auto_10104 ) ) ( not ( = ?auto_10107 ?auto_10108 ) ) ( HOIST-AT ?auto_10112 ?auto_10107 ) ( not ( = ?auto_10105 ?auto_10112 ) ) ( AVAILABLE ?auto_10112 ) ( SURFACE-AT ?auto_10104 ?auto_10107 ) ( ON ?auto_10104 ?auto_10109 ) ( CLEAR ?auto_10104 ) ( not ( = ?auto_10103 ?auto_10109 ) ) ( not ( = ?auto_10104 ?auto_10109 ) ) ( not ( = ?auto_10111 ?auto_10109 ) ) ( SURFACE-AT ?auto_10111 ?auto_10108 ) ( CLEAR ?auto_10111 ) ( IS-CRATE ?auto_10103 ) ( AVAILABLE ?auto_10105 ) ( TRUCK-AT ?auto_10110 ?auto_10106 ) ( not ( = ?auto_10106 ?auto_10108 ) ) ( not ( = ?auto_10107 ?auto_10106 ) ) ( HOIST-AT ?auto_10113 ?auto_10106 ) ( LIFTING ?auto_10113 ?auto_10103 ) ( not ( = ?auto_10105 ?auto_10113 ) ) ( not ( = ?auto_10112 ?auto_10113 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10113 ?auto_10103 ?auto_10110 ?auto_10106 )
      ( MAKE-2CRATE ?auto_10111 ?auto_10103 ?auto_10104 )
      ( MAKE-1CRATE-VERIFY ?auto_10103 ?auto_10104 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10114 - SURFACE
      ?auto_10115 - SURFACE
      ?auto_10116 - SURFACE
    )
    :vars
    (
      ?auto_10119 - HOIST
      ?auto_10117 - PLACE
      ?auto_10118 - PLACE
      ?auto_10120 - HOIST
      ?auto_10121 - SURFACE
      ?auto_10124 - TRUCK
      ?auto_10123 - PLACE
      ?auto_10122 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10119 ?auto_10117 ) ( IS-CRATE ?auto_10116 ) ( not ( = ?auto_10115 ?auto_10116 ) ) ( not ( = ?auto_10114 ?auto_10115 ) ) ( not ( = ?auto_10114 ?auto_10116 ) ) ( not ( = ?auto_10118 ?auto_10117 ) ) ( HOIST-AT ?auto_10120 ?auto_10118 ) ( not ( = ?auto_10119 ?auto_10120 ) ) ( AVAILABLE ?auto_10120 ) ( SURFACE-AT ?auto_10116 ?auto_10118 ) ( ON ?auto_10116 ?auto_10121 ) ( CLEAR ?auto_10116 ) ( not ( = ?auto_10115 ?auto_10121 ) ) ( not ( = ?auto_10116 ?auto_10121 ) ) ( not ( = ?auto_10114 ?auto_10121 ) ) ( SURFACE-AT ?auto_10114 ?auto_10117 ) ( CLEAR ?auto_10114 ) ( IS-CRATE ?auto_10115 ) ( AVAILABLE ?auto_10119 ) ( TRUCK-AT ?auto_10124 ?auto_10123 ) ( not ( = ?auto_10123 ?auto_10117 ) ) ( not ( = ?auto_10118 ?auto_10123 ) ) ( HOIST-AT ?auto_10122 ?auto_10123 ) ( LIFTING ?auto_10122 ?auto_10115 ) ( not ( = ?auto_10119 ?auto_10122 ) ) ( not ( = ?auto_10120 ?auto_10122 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10115 ?auto_10116 )
      ( MAKE-2CRATE-VERIFY ?auto_10114 ?auto_10115 ?auto_10116 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10125 - SURFACE
      ?auto_10126 - SURFACE
      ?auto_10127 - SURFACE
      ?auto_10128 - SURFACE
    )
    :vars
    (
      ?auto_10135 - HOIST
      ?auto_10133 - PLACE
      ?auto_10136 - PLACE
      ?auto_10134 - HOIST
      ?auto_10129 - SURFACE
      ?auto_10130 - TRUCK
      ?auto_10131 - PLACE
      ?auto_10132 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10135 ?auto_10133 ) ( IS-CRATE ?auto_10128 ) ( not ( = ?auto_10127 ?auto_10128 ) ) ( not ( = ?auto_10126 ?auto_10127 ) ) ( not ( = ?auto_10126 ?auto_10128 ) ) ( not ( = ?auto_10136 ?auto_10133 ) ) ( HOIST-AT ?auto_10134 ?auto_10136 ) ( not ( = ?auto_10135 ?auto_10134 ) ) ( AVAILABLE ?auto_10134 ) ( SURFACE-AT ?auto_10128 ?auto_10136 ) ( ON ?auto_10128 ?auto_10129 ) ( CLEAR ?auto_10128 ) ( not ( = ?auto_10127 ?auto_10129 ) ) ( not ( = ?auto_10128 ?auto_10129 ) ) ( not ( = ?auto_10126 ?auto_10129 ) ) ( SURFACE-AT ?auto_10126 ?auto_10133 ) ( CLEAR ?auto_10126 ) ( IS-CRATE ?auto_10127 ) ( AVAILABLE ?auto_10135 ) ( TRUCK-AT ?auto_10130 ?auto_10131 ) ( not ( = ?auto_10131 ?auto_10133 ) ) ( not ( = ?auto_10136 ?auto_10131 ) ) ( HOIST-AT ?auto_10132 ?auto_10131 ) ( LIFTING ?auto_10132 ?auto_10127 ) ( not ( = ?auto_10135 ?auto_10132 ) ) ( not ( = ?auto_10134 ?auto_10132 ) ) ( ON ?auto_10126 ?auto_10125 ) ( not ( = ?auto_10125 ?auto_10126 ) ) ( not ( = ?auto_10125 ?auto_10127 ) ) ( not ( = ?auto_10125 ?auto_10128 ) ) ( not ( = ?auto_10125 ?auto_10129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10126 ?auto_10127 ?auto_10128 )
      ( MAKE-3CRATE-VERIFY ?auto_10125 ?auto_10126 ?auto_10127 ?auto_10128 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10137 - SURFACE
      ?auto_10138 - SURFACE
    )
    :vars
    (
      ?auto_10146 - HOIST
      ?auto_10144 - PLACE
      ?auto_10139 - SURFACE
      ?auto_10147 - PLACE
      ?auto_10145 - HOIST
      ?auto_10140 - SURFACE
      ?auto_10141 - TRUCK
      ?auto_10142 - PLACE
      ?auto_10143 - HOIST
      ?auto_10148 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10146 ?auto_10144 ) ( IS-CRATE ?auto_10138 ) ( not ( = ?auto_10137 ?auto_10138 ) ) ( not ( = ?auto_10139 ?auto_10137 ) ) ( not ( = ?auto_10139 ?auto_10138 ) ) ( not ( = ?auto_10147 ?auto_10144 ) ) ( HOIST-AT ?auto_10145 ?auto_10147 ) ( not ( = ?auto_10146 ?auto_10145 ) ) ( AVAILABLE ?auto_10145 ) ( SURFACE-AT ?auto_10138 ?auto_10147 ) ( ON ?auto_10138 ?auto_10140 ) ( CLEAR ?auto_10138 ) ( not ( = ?auto_10137 ?auto_10140 ) ) ( not ( = ?auto_10138 ?auto_10140 ) ) ( not ( = ?auto_10139 ?auto_10140 ) ) ( SURFACE-AT ?auto_10139 ?auto_10144 ) ( CLEAR ?auto_10139 ) ( IS-CRATE ?auto_10137 ) ( AVAILABLE ?auto_10146 ) ( TRUCK-AT ?auto_10141 ?auto_10142 ) ( not ( = ?auto_10142 ?auto_10144 ) ) ( not ( = ?auto_10147 ?auto_10142 ) ) ( HOIST-AT ?auto_10143 ?auto_10142 ) ( not ( = ?auto_10146 ?auto_10143 ) ) ( not ( = ?auto_10145 ?auto_10143 ) ) ( AVAILABLE ?auto_10143 ) ( SURFACE-AT ?auto_10137 ?auto_10142 ) ( ON ?auto_10137 ?auto_10148 ) ( CLEAR ?auto_10137 ) ( not ( = ?auto_10137 ?auto_10148 ) ) ( not ( = ?auto_10138 ?auto_10148 ) ) ( not ( = ?auto_10139 ?auto_10148 ) ) ( not ( = ?auto_10140 ?auto_10148 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10143 ?auto_10137 ?auto_10148 ?auto_10142 )
      ( MAKE-2CRATE ?auto_10139 ?auto_10137 ?auto_10138 )
      ( MAKE-1CRATE-VERIFY ?auto_10137 ?auto_10138 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10149 - SURFACE
      ?auto_10150 - SURFACE
      ?auto_10151 - SURFACE
    )
    :vars
    (
      ?auto_10156 - HOIST
      ?auto_10153 - PLACE
      ?auto_10152 - PLACE
      ?auto_10159 - HOIST
      ?auto_10157 - SURFACE
      ?auto_10160 - TRUCK
      ?auto_10158 - PLACE
      ?auto_10154 - HOIST
      ?auto_10155 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10156 ?auto_10153 ) ( IS-CRATE ?auto_10151 ) ( not ( = ?auto_10150 ?auto_10151 ) ) ( not ( = ?auto_10149 ?auto_10150 ) ) ( not ( = ?auto_10149 ?auto_10151 ) ) ( not ( = ?auto_10152 ?auto_10153 ) ) ( HOIST-AT ?auto_10159 ?auto_10152 ) ( not ( = ?auto_10156 ?auto_10159 ) ) ( AVAILABLE ?auto_10159 ) ( SURFACE-AT ?auto_10151 ?auto_10152 ) ( ON ?auto_10151 ?auto_10157 ) ( CLEAR ?auto_10151 ) ( not ( = ?auto_10150 ?auto_10157 ) ) ( not ( = ?auto_10151 ?auto_10157 ) ) ( not ( = ?auto_10149 ?auto_10157 ) ) ( SURFACE-AT ?auto_10149 ?auto_10153 ) ( CLEAR ?auto_10149 ) ( IS-CRATE ?auto_10150 ) ( AVAILABLE ?auto_10156 ) ( TRUCK-AT ?auto_10160 ?auto_10158 ) ( not ( = ?auto_10158 ?auto_10153 ) ) ( not ( = ?auto_10152 ?auto_10158 ) ) ( HOIST-AT ?auto_10154 ?auto_10158 ) ( not ( = ?auto_10156 ?auto_10154 ) ) ( not ( = ?auto_10159 ?auto_10154 ) ) ( AVAILABLE ?auto_10154 ) ( SURFACE-AT ?auto_10150 ?auto_10158 ) ( ON ?auto_10150 ?auto_10155 ) ( CLEAR ?auto_10150 ) ( not ( = ?auto_10150 ?auto_10155 ) ) ( not ( = ?auto_10151 ?auto_10155 ) ) ( not ( = ?auto_10149 ?auto_10155 ) ) ( not ( = ?auto_10157 ?auto_10155 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10150 ?auto_10151 )
      ( MAKE-2CRATE-VERIFY ?auto_10149 ?auto_10150 ?auto_10151 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10161 - SURFACE
      ?auto_10162 - SURFACE
      ?auto_10163 - SURFACE
      ?auto_10164 - SURFACE
    )
    :vars
    (
      ?auto_10172 - HOIST
      ?auto_10166 - PLACE
      ?auto_10173 - PLACE
      ?auto_10171 - HOIST
      ?auto_10167 - SURFACE
      ?auto_10168 - TRUCK
      ?auto_10165 - PLACE
      ?auto_10169 - HOIST
      ?auto_10170 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10172 ?auto_10166 ) ( IS-CRATE ?auto_10164 ) ( not ( = ?auto_10163 ?auto_10164 ) ) ( not ( = ?auto_10162 ?auto_10163 ) ) ( not ( = ?auto_10162 ?auto_10164 ) ) ( not ( = ?auto_10173 ?auto_10166 ) ) ( HOIST-AT ?auto_10171 ?auto_10173 ) ( not ( = ?auto_10172 ?auto_10171 ) ) ( AVAILABLE ?auto_10171 ) ( SURFACE-AT ?auto_10164 ?auto_10173 ) ( ON ?auto_10164 ?auto_10167 ) ( CLEAR ?auto_10164 ) ( not ( = ?auto_10163 ?auto_10167 ) ) ( not ( = ?auto_10164 ?auto_10167 ) ) ( not ( = ?auto_10162 ?auto_10167 ) ) ( SURFACE-AT ?auto_10162 ?auto_10166 ) ( CLEAR ?auto_10162 ) ( IS-CRATE ?auto_10163 ) ( AVAILABLE ?auto_10172 ) ( TRUCK-AT ?auto_10168 ?auto_10165 ) ( not ( = ?auto_10165 ?auto_10166 ) ) ( not ( = ?auto_10173 ?auto_10165 ) ) ( HOIST-AT ?auto_10169 ?auto_10165 ) ( not ( = ?auto_10172 ?auto_10169 ) ) ( not ( = ?auto_10171 ?auto_10169 ) ) ( AVAILABLE ?auto_10169 ) ( SURFACE-AT ?auto_10163 ?auto_10165 ) ( ON ?auto_10163 ?auto_10170 ) ( CLEAR ?auto_10163 ) ( not ( = ?auto_10163 ?auto_10170 ) ) ( not ( = ?auto_10164 ?auto_10170 ) ) ( not ( = ?auto_10162 ?auto_10170 ) ) ( not ( = ?auto_10167 ?auto_10170 ) ) ( ON ?auto_10162 ?auto_10161 ) ( not ( = ?auto_10161 ?auto_10162 ) ) ( not ( = ?auto_10161 ?auto_10163 ) ) ( not ( = ?auto_10161 ?auto_10164 ) ) ( not ( = ?auto_10161 ?auto_10167 ) ) ( not ( = ?auto_10161 ?auto_10170 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10162 ?auto_10163 ?auto_10164 )
      ( MAKE-3CRATE-VERIFY ?auto_10161 ?auto_10162 ?auto_10163 ?auto_10164 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10174 - SURFACE
      ?auto_10175 - SURFACE
    )
    :vars
    (
      ?auto_10184 - HOIST
      ?auto_10178 - PLACE
      ?auto_10176 - SURFACE
      ?auto_10185 - PLACE
      ?auto_10183 - HOIST
      ?auto_10179 - SURFACE
      ?auto_10177 - PLACE
      ?auto_10181 - HOIST
      ?auto_10182 - SURFACE
      ?auto_10180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10184 ?auto_10178 ) ( IS-CRATE ?auto_10175 ) ( not ( = ?auto_10174 ?auto_10175 ) ) ( not ( = ?auto_10176 ?auto_10174 ) ) ( not ( = ?auto_10176 ?auto_10175 ) ) ( not ( = ?auto_10185 ?auto_10178 ) ) ( HOIST-AT ?auto_10183 ?auto_10185 ) ( not ( = ?auto_10184 ?auto_10183 ) ) ( AVAILABLE ?auto_10183 ) ( SURFACE-AT ?auto_10175 ?auto_10185 ) ( ON ?auto_10175 ?auto_10179 ) ( CLEAR ?auto_10175 ) ( not ( = ?auto_10174 ?auto_10179 ) ) ( not ( = ?auto_10175 ?auto_10179 ) ) ( not ( = ?auto_10176 ?auto_10179 ) ) ( SURFACE-AT ?auto_10176 ?auto_10178 ) ( CLEAR ?auto_10176 ) ( IS-CRATE ?auto_10174 ) ( AVAILABLE ?auto_10184 ) ( not ( = ?auto_10177 ?auto_10178 ) ) ( not ( = ?auto_10185 ?auto_10177 ) ) ( HOIST-AT ?auto_10181 ?auto_10177 ) ( not ( = ?auto_10184 ?auto_10181 ) ) ( not ( = ?auto_10183 ?auto_10181 ) ) ( AVAILABLE ?auto_10181 ) ( SURFACE-AT ?auto_10174 ?auto_10177 ) ( ON ?auto_10174 ?auto_10182 ) ( CLEAR ?auto_10174 ) ( not ( = ?auto_10174 ?auto_10182 ) ) ( not ( = ?auto_10175 ?auto_10182 ) ) ( not ( = ?auto_10176 ?auto_10182 ) ) ( not ( = ?auto_10179 ?auto_10182 ) ) ( TRUCK-AT ?auto_10180 ?auto_10178 ) )
    :subtasks
    ( ( !DRIVE ?auto_10180 ?auto_10178 ?auto_10177 )
      ( MAKE-2CRATE ?auto_10176 ?auto_10174 ?auto_10175 )
      ( MAKE-1CRATE-VERIFY ?auto_10174 ?auto_10175 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10186 - SURFACE
      ?auto_10187 - SURFACE
      ?auto_10188 - SURFACE
    )
    :vars
    (
      ?auto_10195 - HOIST
      ?auto_10194 - PLACE
      ?auto_10193 - PLACE
      ?auto_10191 - HOIST
      ?auto_10189 - SURFACE
      ?auto_10192 - PLACE
      ?auto_10196 - HOIST
      ?auto_10190 - SURFACE
      ?auto_10197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10195 ?auto_10194 ) ( IS-CRATE ?auto_10188 ) ( not ( = ?auto_10187 ?auto_10188 ) ) ( not ( = ?auto_10186 ?auto_10187 ) ) ( not ( = ?auto_10186 ?auto_10188 ) ) ( not ( = ?auto_10193 ?auto_10194 ) ) ( HOIST-AT ?auto_10191 ?auto_10193 ) ( not ( = ?auto_10195 ?auto_10191 ) ) ( AVAILABLE ?auto_10191 ) ( SURFACE-AT ?auto_10188 ?auto_10193 ) ( ON ?auto_10188 ?auto_10189 ) ( CLEAR ?auto_10188 ) ( not ( = ?auto_10187 ?auto_10189 ) ) ( not ( = ?auto_10188 ?auto_10189 ) ) ( not ( = ?auto_10186 ?auto_10189 ) ) ( SURFACE-AT ?auto_10186 ?auto_10194 ) ( CLEAR ?auto_10186 ) ( IS-CRATE ?auto_10187 ) ( AVAILABLE ?auto_10195 ) ( not ( = ?auto_10192 ?auto_10194 ) ) ( not ( = ?auto_10193 ?auto_10192 ) ) ( HOIST-AT ?auto_10196 ?auto_10192 ) ( not ( = ?auto_10195 ?auto_10196 ) ) ( not ( = ?auto_10191 ?auto_10196 ) ) ( AVAILABLE ?auto_10196 ) ( SURFACE-AT ?auto_10187 ?auto_10192 ) ( ON ?auto_10187 ?auto_10190 ) ( CLEAR ?auto_10187 ) ( not ( = ?auto_10187 ?auto_10190 ) ) ( not ( = ?auto_10188 ?auto_10190 ) ) ( not ( = ?auto_10186 ?auto_10190 ) ) ( not ( = ?auto_10189 ?auto_10190 ) ) ( TRUCK-AT ?auto_10197 ?auto_10194 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10187 ?auto_10188 )
      ( MAKE-2CRATE-VERIFY ?auto_10186 ?auto_10187 ?auto_10188 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10198 - SURFACE
      ?auto_10199 - SURFACE
      ?auto_10200 - SURFACE
      ?auto_10201 - SURFACE
    )
    :vars
    (
      ?auto_10207 - HOIST
      ?auto_10203 - PLACE
      ?auto_10205 - PLACE
      ?auto_10204 - HOIST
      ?auto_10202 - SURFACE
      ?auto_10209 - PLACE
      ?auto_10206 - HOIST
      ?auto_10208 - SURFACE
      ?auto_10210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10207 ?auto_10203 ) ( IS-CRATE ?auto_10201 ) ( not ( = ?auto_10200 ?auto_10201 ) ) ( not ( = ?auto_10199 ?auto_10200 ) ) ( not ( = ?auto_10199 ?auto_10201 ) ) ( not ( = ?auto_10205 ?auto_10203 ) ) ( HOIST-AT ?auto_10204 ?auto_10205 ) ( not ( = ?auto_10207 ?auto_10204 ) ) ( AVAILABLE ?auto_10204 ) ( SURFACE-AT ?auto_10201 ?auto_10205 ) ( ON ?auto_10201 ?auto_10202 ) ( CLEAR ?auto_10201 ) ( not ( = ?auto_10200 ?auto_10202 ) ) ( not ( = ?auto_10201 ?auto_10202 ) ) ( not ( = ?auto_10199 ?auto_10202 ) ) ( SURFACE-AT ?auto_10199 ?auto_10203 ) ( CLEAR ?auto_10199 ) ( IS-CRATE ?auto_10200 ) ( AVAILABLE ?auto_10207 ) ( not ( = ?auto_10209 ?auto_10203 ) ) ( not ( = ?auto_10205 ?auto_10209 ) ) ( HOIST-AT ?auto_10206 ?auto_10209 ) ( not ( = ?auto_10207 ?auto_10206 ) ) ( not ( = ?auto_10204 ?auto_10206 ) ) ( AVAILABLE ?auto_10206 ) ( SURFACE-AT ?auto_10200 ?auto_10209 ) ( ON ?auto_10200 ?auto_10208 ) ( CLEAR ?auto_10200 ) ( not ( = ?auto_10200 ?auto_10208 ) ) ( not ( = ?auto_10201 ?auto_10208 ) ) ( not ( = ?auto_10199 ?auto_10208 ) ) ( not ( = ?auto_10202 ?auto_10208 ) ) ( TRUCK-AT ?auto_10210 ?auto_10203 ) ( ON ?auto_10199 ?auto_10198 ) ( not ( = ?auto_10198 ?auto_10199 ) ) ( not ( = ?auto_10198 ?auto_10200 ) ) ( not ( = ?auto_10198 ?auto_10201 ) ) ( not ( = ?auto_10198 ?auto_10202 ) ) ( not ( = ?auto_10198 ?auto_10208 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10199 ?auto_10200 ?auto_10201 )
      ( MAKE-3CRATE-VERIFY ?auto_10198 ?auto_10199 ?auto_10200 ?auto_10201 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10211 - SURFACE
      ?auto_10212 - SURFACE
    )
    :vars
    (
      ?auto_10219 - HOIST
      ?auto_10215 - PLACE
      ?auto_10213 - SURFACE
      ?auto_10217 - PLACE
      ?auto_10216 - HOIST
      ?auto_10214 - SURFACE
      ?auto_10221 - PLACE
      ?auto_10218 - HOIST
      ?auto_10220 - SURFACE
      ?auto_10222 - TRUCK
      ?auto_10223 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10219 ?auto_10215 ) ( IS-CRATE ?auto_10212 ) ( not ( = ?auto_10211 ?auto_10212 ) ) ( not ( = ?auto_10213 ?auto_10211 ) ) ( not ( = ?auto_10213 ?auto_10212 ) ) ( not ( = ?auto_10217 ?auto_10215 ) ) ( HOIST-AT ?auto_10216 ?auto_10217 ) ( not ( = ?auto_10219 ?auto_10216 ) ) ( AVAILABLE ?auto_10216 ) ( SURFACE-AT ?auto_10212 ?auto_10217 ) ( ON ?auto_10212 ?auto_10214 ) ( CLEAR ?auto_10212 ) ( not ( = ?auto_10211 ?auto_10214 ) ) ( not ( = ?auto_10212 ?auto_10214 ) ) ( not ( = ?auto_10213 ?auto_10214 ) ) ( IS-CRATE ?auto_10211 ) ( not ( = ?auto_10221 ?auto_10215 ) ) ( not ( = ?auto_10217 ?auto_10221 ) ) ( HOIST-AT ?auto_10218 ?auto_10221 ) ( not ( = ?auto_10219 ?auto_10218 ) ) ( not ( = ?auto_10216 ?auto_10218 ) ) ( AVAILABLE ?auto_10218 ) ( SURFACE-AT ?auto_10211 ?auto_10221 ) ( ON ?auto_10211 ?auto_10220 ) ( CLEAR ?auto_10211 ) ( not ( = ?auto_10211 ?auto_10220 ) ) ( not ( = ?auto_10212 ?auto_10220 ) ) ( not ( = ?auto_10213 ?auto_10220 ) ) ( not ( = ?auto_10214 ?auto_10220 ) ) ( TRUCK-AT ?auto_10222 ?auto_10215 ) ( SURFACE-AT ?auto_10223 ?auto_10215 ) ( CLEAR ?auto_10223 ) ( LIFTING ?auto_10219 ?auto_10213 ) ( IS-CRATE ?auto_10213 ) ( not ( = ?auto_10223 ?auto_10213 ) ) ( not ( = ?auto_10211 ?auto_10223 ) ) ( not ( = ?auto_10212 ?auto_10223 ) ) ( not ( = ?auto_10214 ?auto_10223 ) ) ( not ( = ?auto_10220 ?auto_10223 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10223 ?auto_10213 )
      ( MAKE-2CRATE ?auto_10213 ?auto_10211 ?auto_10212 )
      ( MAKE-1CRATE-VERIFY ?auto_10211 ?auto_10212 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10224 - SURFACE
      ?auto_10225 - SURFACE
      ?auto_10226 - SURFACE
    )
    :vars
    (
      ?auto_10231 - HOIST
      ?auto_10233 - PLACE
      ?auto_10228 - PLACE
      ?auto_10235 - HOIST
      ?auto_10234 - SURFACE
      ?auto_10229 - PLACE
      ?auto_10230 - HOIST
      ?auto_10232 - SURFACE
      ?auto_10227 - TRUCK
      ?auto_10236 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10231 ?auto_10233 ) ( IS-CRATE ?auto_10226 ) ( not ( = ?auto_10225 ?auto_10226 ) ) ( not ( = ?auto_10224 ?auto_10225 ) ) ( not ( = ?auto_10224 ?auto_10226 ) ) ( not ( = ?auto_10228 ?auto_10233 ) ) ( HOIST-AT ?auto_10235 ?auto_10228 ) ( not ( = ?auto_10231 ?auto_10235 ) ) ( AVAILABLE ?auto_10235 ) ( SURFACE-AT ?auto_10226 ?auto_10228 ) ( ON ?auto_10226 ?auto_10234 ) ( CLEAR ?auto_10226 ) ( not ( = ?auto_10225 ?auto_10234 ) ) ( not ( = ?auto_10226 ?auto_10234 ) ) ( not ( = ?auto_10224 ?auto_10234 ) ) ( IS-CRATE ?auto_10225 ) ( not ( = ?auto_10229 ?auto_10233 ) ) ( not ( = ?auto_10228 ?auto_10229 ) ) ( HOIST-AT ?auto_10230 ?auto_10229 ) ( not ( = ?auto_10231 ?auto_10230 ) ) ( not ( = ?auto_10235 ?auto_10230 ) ) ( AVAILABLE ?auto_10230 ) ( SURFACE-AT ?auto_10225 ?auto_10229 ) ( ON ?auto_10225 ?auto_10232 ) ( CLEAR ?auto_10225 ) ( not ( = ?auto_10225 ?auto_10232 ) ) ( not ( = ?auto_10226 ?auto_10232 ) ) ( not ( = ?auto_10224 ?auto_10232 ) ) ( not ( = ?auto_10234 ?auto_10232 ) ) ( TRUCK-AT ?auto_10227 ?auto_10233 ) ( SURFACE-AT ?auto_10236 ?auto_10233 ) ( CLEAR ?auto_10236 ) ( LIFTING ?auto_10231 ?auto_10224 ) ( IS-CRATE ?auto_10224 ) ( not ( = ?auto_10236 ?auto_10224 ) ) ( not ( = ?auto_10225 ?auto_10236 ) ) ( not ( = ?auto_10226 ?auto_10236 ) ) ( not ( = ?auto_10234 ?auto_10236 ) ) ( not ( = ?auto_10232 ?auto_10236 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10225 ?auto_10226 )
      ( MAKE-2CRATE-VERIFY ?auto_10224 ?auto_10225 ?auto_10226 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10237 - SURFACE
      ?auto_10238 - SURFACE
      ?auto_10239 - SURFACE
      ?auto_10240 - SURFACE
    )
    :vars
    (
      ?auto_10249 - HOIST
      ?auto_10243 - PLACE
      ?auto_10241 - PLACE
      ?auto_10242 - HOIST
      ?auto_10245 - SURFACE
      ?auto_10244 - PLACE
      ?auto_10246 - HOIST
      ?auto_10248 - SURFACE
      ?auto_10247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10249 ?auto_10243 ) ( IS-CRATE ?auto_10240 ) ( not ( = ?auto_10239 ?auto_10240 ) ) ( not ( = ?auto_10238 ?auto_10239 ) ) ( not ( = ?auto_10238 ?auto_10240 ) ) ( not ( = ?auto_10241 ?auto_10243 ) ) ( HOIST-AT ?auto_10242 ?auto_10241 ) ( not ( = ?auto_10249 ?auto_10242 ) ) ( AVAILABLE ?auto_10242 ) ( SURFACE-AT ?auto_10240 ?auto_10241 ) ( ON ?auto_10240 ?auto_10245 ) ( CLEAR ?auto_10240 ) ( not ( = ?auto_10239 ?auto_10245 ) ) ( not ( = ?auto_10240 ?auto_10245 ) ) ( not ( = ?auto_10238 ?auto_10245 ) ) ( IS-CRATE ?auto_10239 ) ( not ( = ?auto_10244 ?auto_10243 ) ) ( not ( = ?auto_10241 ?auto_10244 ) ) ( HOIST-AT ?auto_10246 ?auto_10244 ) ( not ( = ?auto_10249 ?auto_10246 ) ) ( not ( = ?auto_10242 ?auto_10246 ) ) ( AVAILABLE ?auto_10246 ) ( SURFACE-AT ?auto_10239 ?auto_10244 ) ( ON ?auto_10239 ?auto_10248 ) ( CLEAR ?auto_10239 ) ( not ( = ?auto_10239 ?auto_10248 ) ) ( not ( = ?auto_10240 ?auto_10248 ) ) ( not ( = ?auto_10238 ?auto_10248 ) ) ( not ( = ?auto_10245 ?auto_10248 ) ) ( TRUCK-AT ?auto_10247 ?auto_10243 ) ( SURFACE-AT ?auto_10237 ?auto_10243 ) ( CLEAR ?auto_10237 ) ( LIFTING ?auto_10249 ?auto_10238 ) ( IS-CRATE ?auto_10238 ) ( not ( = ?auto_10237 ?auto_10238 ) ) ( not ( = ?auto_10239 ?auto_10237 ) ) ( not ( = ?auto_10240 ?auto_10237 ) ) ( not ( = ?auto_10245 ?auto_10237 ) ) ( not ( = ?auto_10248 ?auto_10237 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10238 ?auto_10239 ?auto_10240 )
      ( MAKE-3CRATE-VERIFY ?auto_10237 ?auto_10238 ?auto_10239 ?auto_10240 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10250 - SURFACE
      ?auto_10251 - SURFACE
    )
    :vars
    (
      ?auto_10262 - HOIST
      ?auto_10254 - PLACE
      ?auto_10255 - SURFACE
      ?auto_10252 - PLACE
      ?auto_10253 - HOIST
      ?auto_10258 - SURFACE
      ?auto_10257 - PLACE
      ?auto_10259 - HOIST
      ?auto_10261 - SURFACE
      ?auto_10260 - TRUCK
      ?auto_10256 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10262 ?auto_10254 ) ( IS-CRATE ?auto_10251 ) ( not ( = ?auto_10250 ?auto_10251 ) ) ( not ( = ?auto_10255 ?auto_10250 ) ) ( not ( = ?auto_10255 ?auto_10251 ) ) ( not ( = ?auto_10252 ?auto_10254 ) ) ( HOIST-AT ?auto_10253 ?auto_10252 ) ( not ( = ?auto_10262 ?auto_10253 ) ) ( AVAILABLE ?auto_10253 ) ( SURFACE-AT ?auto_10251 ?auto_10252 ) ( ON ?auto_10251 ?auto_10258 ) ( CLEAR ?auto_10251 ) ( not ( = ?auto_10250 ?auto_10258 ) ) ( not ( = ?auto_10251 ?auto_10258 ) ) ( not ( = ?auto_10255 ?auto_10258 ) ) ( IS-CRATE ?auto_10250 ) ( not ( = ?auto_10257 ?auto_10254 ) ) ( not ( = ?auto_10252 ?auto_10257 ) ) ( HOIST-AT ?auto_10259 ?auto_10257 ) ( not ( = ?auto_10262 ?auto_10259 ) ) ( not ( = ?auto_10253 ?auto_10259 ) ) ( AVAILABLE ?auto_10259 ) ( SURFACE-AT ?auto_10250 ?auto_10257 ) ( ON ?auto_10250 ?auto_10261 ) ( CLEAR ?auto_10250 ) ( not ( = ?auto_10250 ?auto_10261 ) ) ( not ( = ?auto_10251 ?auto_10261 ) ) ( not ( = ?auto_10255 ?auto_10261 ) ) ( not ( = ?auto_10258 ?auto_10261 ) ) ( TRUCK-AT ?auto_10260 ?auto_10254 ) ( SURFACE-AT ?auto_10256 ?auto_10254 ) ( CLEAR ?auto_10256 ) ( IS-CRATE ?auto_10255 ) ( not ( = ?auto_10256 ?auto_10255 ) ) ( not ( = ?auto_10250 ?auto_10256 ) ) ( not ( = ?auto_10251 ?auto_10256 ) ) ( not ( = ?auto_10258 ?auto_10256 ) ) ( not ( = ?auto_10261 ?auto_10256 ) ) ( AVAILABLE ?auto_10262 ) ( IN ?auto_10255 ?auto_10260 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10262 ?auto_10255 ?auto_10260 ?auto_10254 )
      ( MAKE-2CRATE ?auto_10255 ?auto_10250 ?auto_10251 )
      ( MAKE-1CRATE-VERIFY ?auto_10250 ?auto_10251 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10263 - SURFACE
      ?auto_10264 - SURFACE
      ?auto_10265 - SURFACE
    )
    :vars
    (
      ?auto_10274 - HOIST
      ?auto_10268 - PLACE
      ?auto_10272 - PLACE
      ?auto_10266 - HOIST
      ?auto_10267 - SURFACE
      ?auto_10270 - PLACE
      ?auto_10271 - HOIST
      ?auto_10275 - SURFACE
      ?auto_10269 - TRUCK
      ?auto_10273 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10274 ?auto_10268 ) ( IS-CRATE ?auto_10265 ) ( not ( = ?auto_10264 ?auto_10265 ) ) ( not ( = ?auto_10263 ?auto_10264 ) ) ( not ( = ?auto_10263 ?auto_10265 ) ) ( not ( = ?auto_10272 ?auto_10268 ) ) ( HOIST-AT ?auto_10266 ?auto_10272 ) ( not ( = ?auto_10274 ?auto_10266 ) ) ( AVAILABLE ?auto_10266 ) ( SURFACE-AT ?auto_10265 ?auto_10272 ) ( ON ?auto_10265 ?auto_10267 ) ( CLEAR ?auto_10265 ) ( not ( = ?auto_10264 ?auto_10267 ) ) ( not ( = ?auto_10265 ?auto_10267 ) ) ( not ( = ?auto_10263 ?auto_10267 ) ) ( IS-CRATE ?auto_10264 ) ( not ( = ?auto_10270 ?auto_10268 ) ) ( not ( = ?auto_10272 ?auto_10270 ) ) ( HOIST-AT ?auto_10271 ?auto_10270 ) ( not ( = ?auto_10274 ?auto_10271 ) ) ( not ( = ?auto_10266 ?auto_10271 ) ) ( AVAILABLE ?auto_10271 ) ( SURFACE-AT ?auto_10264 ?auto_10270 ) ( ON ?auto_10264 ?auto_10275 ) ( CLEAR ?auto_10264 ) ( not ( = ?auto_10264 ?auto_10275 ) ) ( not ( = ?auto_10265 ?auto_10275 ) ) ( not ( = ?auto_10263 ?auto_10275 ) ) ( not ( = ?auto_10267 ?auto_10275 ) ) ( TRUCK-AT ?auto_10269 ?auto_10268 ) ( SURFACE-AT ?auto_10273 ?auto_10268 ) ( CLEAR ?auto_10273 ) ( IS-CRATE ?auto_10263 ) ( not ( = ?auto_10273 ?auto_10263 ) ) ( not ( = ?auto_10264 ?auto_10273 ) ) ( not ( = ?auto_10265 ?auto_10273 ) ) ( not ( = ?auto_10267 ?auto_10273 ) ) ( not ( = ?auto_10275 ?auto_10273 ) ) ( AVAILABLE ?auto_10274 ) ( IN ?auto_10263 ?auto_10269 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10264 ?auto_10265 )
      ( MAKE-2CRATE-VERIFY ?auto_10263 ?auto_10264 ?auto_10265 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10276 - SURFACE
      ?auto_10277 - SURFACE
      ?auto_10278 - SURFACE
      ?auto_10279 - SURFACE
    )
    :vars
    (
      ?auto_10284 - HOIST
      ?auto_10283 - PLACE
      ?auto_10286 - PLACE
      ?auto_10288 - HOIST
      ?auto_10281 - SURFACE
      ?auto_10287 - PLACE
      ?auto_10280 - HOIST
      ?auto_10282 - SURFACE
      ?auto_10285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10284 ?auto_10283 ) ( IS-CRATE ?auto_10279 ) ( not ( = ?auto_10278 ?auto_10279 ) ) ( not ( = ?auto_10277 ?auto_10278 ) ) ( not ( = ?auto_10277 ?auto_10279 ) ) ( not ( = ?auto_10286 ?auto_10283 ) ) ( HOIST-AT ?auto_10288 ?auto_10286 ) ( not ( = ?auto_10284 ?auto_10288 ) ) ( AVAILABLE ?auto_10288 ) ( SURFACE-AT ?auto_10279 ?auto_10286 ) ( ON ?auto_10279 ?auto_10281 ) ( CLEAR ?auto_10279 ) ( not ( = ?auto_10278 ?auto_10281 ) ) ( not ( = ?auto_10279 ?auto_10281 ) ) ( not ( = ?auto_10277 ?auto_10281 ) ) ( IS-CRATE ?auto_10278 ) ( not ( = ?auto_10287 ?auto_10283 ) ) ( not ( = ?auto_10286 ?auto_10287 ) ) ( HOIST-AT ?auto_10280 ?auto_10287 ) ( not ( = ?auto_10284 ?auto_10280 ) ) ( not ( = ?auto_10288 ?auto_10280 ) ) ( AVAILABLE ?auto_10280 ) ( SURFACE-AT ?auto_10278 ?auto_10287 ) ( ON ?auto_10278 ?auto_10282 ) ( CLEAR ?auto_10278 ) ( not ( = ?auto_10278 ?auto_10282 ) ) ( not ( = ?auto_10279 ?auto_10282 ) ) ( not ( = ?auto_10277 ?auto_10282 ) ) ( not ( = ?auto_10281 ?auto_10282 ) ) ( TRUCK-AT ?auto_10285 ?auto_10283 ) ( SURFACE-AT ?auto_10276 ?auto_10283 ) ( CLEAR ?auto_10276 ) ( IS-CRATE ?auto_10277 ) ( not ( = ?auto_10276 ?auto_10277 ) ) ( not ( = ?auto_10278 ?auto_10276 ) ) ( not ( = ?auto_10279 ?auto_10276 ) ) ( not ( = ?auto_10281 ?auto_10276 ) ) ( not ( = ?auto_10282 ?auto_10276 ) ) ( AVAILABLE ?auto_10284 ) ( IN ?auto_10277 ?auto_10285 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10277 ?auto_10278 ?auto_10279 )
      ( MAKE-3CRATE-VERIFY ?auto_10276 ?auto_10277 ?auto_10278 ?auto_10279 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10289 - SURFACE
      ?auto_10290 - SURFACE
    )
    :vars
    (
      ?auto_10297 - HOIST
      ?auto_10296 - PLACE
      ?auto_10295 - SURFACE
      ?auto_10299 - PLACE
      ?auto_10301 - HOIST
      ?auto_10292 - SURFACE
      ?auto_10300 - PLACE
      ?auto_10291 - HOIST
      ?auto_10294 - SURFACE
      ?auto_10293 - SURFACE
      ?auto_10298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10297 ?auto_10296 ) ( IS-CRATE ?auto_10290 ) ( not ( = ?auto_10289 ?auto_10290 ) ) ( not ( = ?auto_10295 ?auto_10289 ) ) ( not ( = ?auto_10295 ?auto_10290 ) ) ( not ( = ?auto_10299 ?auto_10296 ) ) ( HOIST-AT ?auto_10301 ?auto_10299 ) ( not ( = ?auto_10297 ?auto_10301 ) ) ( AVAILABLE ?auto_10301 ) ( SURFACE-AT ?auto_10290 ?auto_10299 ) ( ON ?auto_10290 ?auto_10292 ) ( CLEAR ?auto_10290 ) ( not ( = ?auto_10289 ?auto_10292 ) ) ( not ( = ?auto_10290 ?auto_10292 ) ) ( not ( = ?auto_10295 ?auto_10292 ) ) ( IS-CRATE ?auto_10289 ) ( not ( = ?auto_10300 ?auto_10296 ) ) ( not ( = ?auto_10299 ?auto_10300 ) ) ( HOIST-AT ?auto_10291 ?auto_10300 ) ( not ( = ?auto_10297 ?auto_10291 ) ) ( not ( = ?auto_10301 ?auto_10291 ) ) ( AVAILABLE ?auto_10291 ) ( SURFACE-AT ?auto_10289 ?auto_10300 ) ( ON ?auto_10289 ?auto_10294 ) ( CLEAR ?auto_10289 ) ( not ( = ?auto_10289 ?auto_10294 ) ) ( not ( = ?auto_10290 ?auto_10294 ) ) ( not ( = ?auto_10295 ?auto_10294 ) ) ( not ( = ?auto_10292 ?auto_10294 ) ) ( SURFACE-AT ?auto_10293 ?auto_10296 ) ( CLEAR ?auto_10293 ) ( IS-CRATE ?auto_10295 ) ( not ( = ?auto_10293 ?auto_10295 ) ) ( not ( = ?auto_10289 ?auto_10293 ) ) ( not ( = ?auto_10290 ?auto_10293 ) ) ( not ( = ?auto_10292 ?auto_10293 ) ) ( not ( = ?auto_10294 ?auto_10293 ) ) ( AVAILABLE ?auto_10297 ) ( IN ?auto_10295 ?auto_10298 ) ( TRUCK-AT ?auto_10298 ?auto_10299 ) )
    :subtasks
    ( ( !DRIVE ?auto_10298 ?auto_10299 ?auto_10296 )
      ( MAKE-2CRATE ?auto_10295 ?auto_10289 ?auto_10290 )
      ( MAKE-1CRATE-VERIFY ?auto_10289 ?auto_10290 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10302 - SURFACE
      ?auto_10303 - SURFACE
      ?auto_10304 - SURFACE
    )
    :vars
    (
      ?auto_10307 - HOIST
      ?auto_10312 - PLACE
      ?auto_10311 - PLACE
      ?auto_10309 - HOIST
      ?auto_10305 - SURFACE
      ?auto_10310 - PLACE
      ?auto_10306 - HOIST
      ?auto_10308 - SURFACE
      ?auto_10313 - SURFACE
      ?auto_10314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10307 ?auto_10312 ) ( IS-CRATE ?auto_10304 ) ( not ( = ?auto_10303 ?auto_10304 ) ) ( not ( = ?auto_10302 ?auto_10303 ) ) ( not ( = ?auto_10302 ?auto_10304 ) ) ( not ( = ?auto_10311 ?auto_10312 ) ) ( HOIST-AT ?auto_10309 ?auto_10311 ) ( not ( = ?auto_10307 ?auto_10309 ) ) ( AVAILABLE ?auto_10309 ) ( SURFACE-AT ?auto_10304 ?auto_10311 ) ( ON ?auto_10304 ?auto_10305 ) ( CLEAR ?auto_10304 ) ( not ( = ?auto_10303 ?auto_10305 ) ) ( not ( = ?auto_10304 ?auto_10305 ) ) ( not ( = ?auto_10302 ?auto_10305 ) ) ( IS-CRATE ?auto_10303 ) ( not ( = ?auto_10310 ?auto_10312 ) ) ( not ( = ?auto_10311 ?auto_10310 ) ) ( HOIST-AT ?auto_10306 ?auto_10310 ) ( not ( = ?auto_10307 ?auto_10306 ) ) ( not ( = ?auto_10309 ?auto_10306 ) ) ( AVAILABLE ?auto_10306 ) ( SURFACE-AT ?auto_10303 ?auto_10310 ) ( ON ?auto_10303 ?auto_10308 ) ( CLEAR ?auto_10303 ) ( not ( = ?auto_10303 ?auto_10308 ) ) ( not ( = ?auto_10304 ?auto_10308 ) ) ( not ( = ?auto_10302 ?auto_10308 ) ) ( not ( = ?auto_10305 ?auto_10308 ) ) ( SURFACE-AT ?auto_10313 ?auto_10312 ) ( CLEAR ?auto_10313 ) ( IS-CRATE ?auto_10302 ) ( not ( = ?auto_10313 ?auto_10302 ) ) ( not ( = ?auto_10303 ?auto_10313 ) ) ( not ( = ?auto_10304 ?auto_10313 ) ) ( not ( = ?auto_10305 ?auto_10313 ) ) ( not ( = ?auto_10308 ?auto_10313 ) ) ( AVAILABLE ?auto_10307 ) ( IN ?auto_10302 ?auto_10314 ) ( TRUCK-AT ?auto_10314 ?auto_10311 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10303 ?auto_10304 )
      ( MAKE-2CRATE-VERIFY ?auto_10302 ?auto_10303 ?auto_10304 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10315 - SURFACE
      ?auto_10316 - SURFACE
      ?auto_10317 - SURFACE
      ?auto_10318 - SURFACE
    )
    :vars
    (
      ?auto_10319 - HOIST
      ?auto_10326 - PLACE
      ?auto_10323 - PLACE
      ?auto_10322 - HOIST
      ?auto_10320 - SURFACE
      ?auto_10324 - PLACE
      ?auto_10321 - HOIST
      ?auto_10325 - SURFACE
      ?auto_10327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10319 ?auto_10326 ) ( IS-CRATE ?auto_10318 ) ( not ( = ?auto_10317 ?auto_10318 ) ) ( not ( = ?auto_10316 ?auto_10317 ) ) ( not ( = ?auto_10316 ?auto_10318 ) ) ( not ( = ?auto_10323 ?auto_10326 ) ) ( HOIST-AT ?auto_10322 ?auto_10323 ) ( not ( = ?auto_10319 ?auto_10322 ) ) ( AVAILABLE ?auto_10322 ) ( SURFACE-AT ?auto_10318 ?auto_10323 ) ( ON ?auto_10318 ?auto_10320 ) ( CLEAR ?auto_10318 ) ( not ( = ?auto_10317 ?auto_10320 ) ) ( not ( = ?auto_10318 ?auto_10320 ) ) ( not ( = ?auto_10316 ?auto_10320 ) ) ( IS-CRATE ?auto_10317 ) ( not ( = ?auto_10324 ?auto_10326 ) ) ( not ( = ?auto_10323 ?auto_10324 ) ) ( HOIST-AT ?auto_10321 ?auto_10324 ) ( not ( = ?auto_10319 ?auto_10321 ) ) ( not ( = ?auto_10322 ?auto_10321 ) ) ( AVAILABLE ?auto_10321 ) ( SURFACE-AT ?auto_10317 ?auto_10324 ) ( ON ?auto_10317 ?auto_10325 ) ( CLEAR ?auto_10317 ) ( not ( = ?auto_10317 ?auto_10325 ) ) ( not ( = ?auto_10318 ?auto_10325 ) ) ( not ( = ?auto_10316 ?auto_10325 ) ) ( not ( = ?auto_10320 ?auto_10325 ) ) ( SURFACE-AT ?auto_10315 ?auto_10326 ) ( CLEAR ?auto_10315 ) ( IS-CRATE ?auto_10316 ) ( not ( = ?auto_10315 ?auto_10316 ) ) ( not ( = ?auto_10317 ?auto_10315 ) ) ( not ( = ?auto_10318 ?auto_10315 ) ) ( not ( = ?auto_10320 ?auto_10315 ) ) ( not ( = ?auto_10325 ?auto_10315 ) ) ( AVAILABLE ?auto_10319 ) ( IN ?auto_10316 ?auto_10327 ) ( TRUCK-AT ?auto_10327 ?auto_10323 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10316 ?auto_10317 ?auto_10318 )
      ( MAKE-3CRATE-VERIFY ?auto_10315 ?auto_10316 ?auto_10317 ?auto_10318 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10328 - SURFACE
      ?auto_10329 - SURFACE
    )
    :vars
    (
      ?auto_10331 - HOIST
      ?auto_10338 - PLACE
      ?auto_10330 - SURFACE
      ?auto_10335 - PLACE
      ?auto_10334 - HOIST
      ?auto_10332 - SURFACE
      ?auto_10336 - PLACE
      ?auto_10333 - HOIST
      ?auto_10337 - SURFACE
      ?auto_10339 - SURFACE
      ?auto_10340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10331 ?auto_10338 ) ( IS-CRATE ?auto_10329 ) ( not ( = ?auto_10328 ?auto_10329 ) ) ( not ( = ?auto_10330 ?auto_10328 ) ) ( not ( = ?auto_10330 ?auto_10329 ) ) ( not ( = ?auto_10335 ?auto_10338 ) ) ( HOIST-AT ?auto_10334 ?auto_10335 ) ( not ( = ?auto_10331 ?auto_10334 ) ) ( SURFACE-AT ?auto_10329 ?auto_10335 ) ( ON ?auto_10329 ?auto_10332 ) ( CLEAR ?auto_10329 ) ( not ( = ?auto_10328 ?auto_10332 ) ) ( not ( = ?auto_10329 ?auto_10332 ) ) ( not ( = ?auto_10330 ?auto_10332 ) ) ( IS-CRATE ?auto_10328 ) ( not ( = ?auto_10336 ?auto_10338 ) ) ( not ( = ?auto_10335 ?auto_10336 ) ) ( HOIST-AT ?auto_10333 ?auto_10336 ) ( not ( = ?auto_10331 ?auto_10333 ) ) ( not ( = ?auto_10334 ?auto_10333 ) ) ( AVAILABLE ?auto_10333 ) ( SURFACE-AT ?auto_10328 ?auto_10336 ) ( ON ?auto_10328 ?auto_10337 ) ( CLEAR ?auto_10328 ) ( not ( = ?auto_10328 ?auto_10337 ) ) ( not ( = ?auto_10329 ?auto_10337 ) ) ( not ( = ?auto_10330 ?auto_10337 ) ) ( not ( = ?auto_10332 ?auto_10337 ) ) ( SURFACE-AT ?auto_10339 ?auto_10338 ) ( CLEAR ?auto_10339 ) ( IS-CRATE ?auto_10330 ) ( not ( = ?auto_10339 ?auto_10330 ) ) ( not ( = ?auto_10328 ?auto_10339 ) ) ( not ( = ?auto_10329 ?auto_10339 ) ) ( not ( = ?auto_10332 ?auto_10339 ) ) ( not ( = ?auto_10337 ?auto_10339 ) ) ( AVAILABLE ?auto_10331 ) ( TRUCK-AT ?auto_10340 ?auto_10335 ) ( LIFTING ?auto_10334 ?auto_10330 ) )
    :subtasks
    ( ( !LOAD ?auto_10334 ?auto_10330 ?auto_10340 ?auto_10335 )
      ( MAKE-2CRATE ?auto_10330 ?auto_10328 ?auto_10329 )
      ( MAKE-1CRATE-VERIFY ?auto_10328 ?auto_10329 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10341 - SURFACE
      ?auto_10342 - SURFACE
      ?auto_10343 - SURFACE
    )
    :vars
    (
      ?auto_10352 - HOIST
      ?auto_10353 - PLACE
      ?auto_10346 - PLACE
      ?auto_10344 - HOIST
      ?auto_10350 - SURFACE
      ?auto_10345 - PLACE
      ?auto_10348 - HOIST
      ?auto_10351 - SURFACE
      ?auto_10349 - SURFACE
      ?auto_10347 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10352 ?auto_10353 ) ( IS-CRATE ?auto_10343 ) ( not ( = ?auto_10342 ?auto_10343 ) ) ( not ( = ?auto_10341 ?auto_10342 ) ) ( not ( = ?auto_10341 ?auto_10343 ) ) ( not ( = ?auto_10346 ?auto_10353 ) ) ( HOIST-AT ?auto_10344 ?auto_10346 ) ( not ( = ?auto_10352 ?auto_10344 ) ) ( SURFACE-AT ?auto_10343 ?auto_10346 ) ( ON ?auto_10343 ?auto_10350 ) ( CLEAR ?auto_10343 ) ( not ( = ?auto_10342 ?auto_10350 ) ) ( not ( = ?auto_10343 ?auto_10350 ) ) ( not ( = ?auto_10341 ?auto_10350 ) ) ( IS-CRATE ?auto_10342 ) ( not ( = ?auto_10345 ?auto_10353 ) ) ( not ( = ?auto_10346 ?auto_10345 ) ) ( HOIST-AT ?auto_10348 ?auto_10345 ) ( not ( = ?auto_10352 ?auto_10348 ) ) ( not ( = ?auto_10344 ?auto_10348 ) ) ( AVAILABLE ?auto_10348 ) ( SURFACE-AT ?auto_10342 ?auto_10345 ) ( ON ?auto_10342 ?auto_10351 ) ( CLEAR ?auto_10342 ) ( not ( = ?auto_10342 ?auto_10351 ) ) ( not ( = ?auto_10343 ?auto_10351 ) ) ( not ( = ?auto_10341 ?auto_10351 ) ) ( not ( = ?auto_10350 ?auto_10351 ) ) ( SURFACE-AT ?auto_10349 ?auto_10353 ) ( CLEAR ?auto_10349 ) ( IS-CRATE ?auto_10341 ) ( not ( = ?auto_10349 ?auto_10341 ) ) ( not ( = ?auto_10342 ?auto_10349 ) ) ( not ( = ?auto_10343 ?auto_10349 ) ) ( not ( = ?auto_10350 ?auto_10349 ) ) ( not ( = ?auto_10351 ?auto_10349 ) ) ( AVAILABLE ?auto_10352 ) ( TRUCK-AT ?auto_10347 ?auto_10346 ) ( LIFTING ?auto_10344 ?auto_10341 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10342 ?auto_10343 )
      ( MAKE-2CRATE-VERIFY ?auto_10341 ?auto_10342 ?auto_10343 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10354 - SURFACE
      ?auto_10355 - SURFACE
      ?auto_10356 - SURFACE
      ?auto_10357 - SURFACE
    )
    :vars
    (
      ?auto_10358 - HOIST
      ?auto_10363 - PLACE
      ?auto_10364 - PLACE
      ?auto_10366 - HOIST
      ?auto_10362 - SURFACE
      ?auto_10365 - PLACE
      ?auto_10359 - HOIST
      ?auto_10360 - SURFACE
      ?auto_10361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10358 ?auto_10363 ) ( IS-CRATE ?auto_10357 ) ( not ( = ?auto_10356 ?auto_10357 ) ) ( not ( = ?auto_10355 ?auto_10356 ) ) ( not ( = ?auto_10355 ?auto_10357 ) ) ( not ( = ?auto_10364 ?auto_10363 ) ) ( HOIST-AT ?auto_10366 ?auto_10364 ) ( not ( = ?auto_10358 ?auto_10366 ) ) ( SURFACE-AT ?auto_10357 ?auto_10364 ) ( ON ?auto_10357 ?auto_10362 ) ( CLEAR ?auto_10357 ) ( not ( = ?auto_10356 ?auto_10362 ) ) ( not ( = ?auto_10357 ?auto_10362 ) ) ( not ( = ?auto_10355 ?auto_10362 ) ) ( IS-CRATE ?auto_10356 ) ( not ( = ?auto_10365 ?auto_10363 ) ) ( not ( = ?auto_10364 ?auto_10365 ) ) ( HOIST-AT ?auto_10359 ?auto_10365 ) ( not ( = ?auto_10358 ?auto_10359 ) ) ( not ( = ?auto_10366 ?auto_10359 ) ) ( AVAILABLE ?auto_10359 ) ( SURFACE-AT ?auto_10356 ?auto_10365 ) ( ON ?auto_10356 ?auto_10360 ) ( CLEAR ?auto_10356 ) ( not ( = ?auto_10356 ?auto_10360 ) ) ( not ( = ?auto_10357 ?auto_10360 ) ) ( not ( = ?auto_10355 ?auto_10360 ) ) ( not ( = ?auto_10362 ?auto_10360 ) ) ( SURFACE-AT ?auto_10354 ?auto_10363 ) ( CLEAR ?auto_10354 ) ( IS-CRATE ?auto_10355 ) ( not ( = ?auto_10354 ?auto_10355 ) ) ( not ( = ?auto_10356 ?auto_10354 ) ) ( not ( = ?auto_10357 ?auto_10354 ) ) ( not ( = ?auto_10362 ?auto_10354 ) ) ( not ( = ?auto_10360 ?auto_10354 ) ) ( AVAILABLE ?auto_10358 ) ( TRUCK-AT ?auto_10361 ?auto_10364 ) ( LIFTING ?auto_10366 ?auto_10355 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10355 ?auto_10356 ?auto_10357 )
      ( MAKE-3CRATE-VERIFY ?auto_10354 ?auto_10355 ?auto_10356 ?auto_10357 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10367 - SURFACE
      ?auto_10368 - SURFACE
    )
    :vars
    (
      ?auto_10369 - HOIST
      ?auto_10375 - PLACE
      ?auto_10379 - SURFACE
      ?auto_10376 - PLACE
      ?auto_10378 - HOIST
      ?auto_10374 - SURFACE
      ?auto_10377 - PLACE
      ?auto_10371 - HOIST
      ?auto_10372 - SURFACE
      ?auto_10370 - SURFACE
      ?auto_10373 - TRUCK
      ?auto_10380 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10369 ?auto_10375 ) ( IS-CRATE ?auto_10368 ) ( not ( = ?auto_10367 ?auto_10368 ) ) ( not ( = ?auto_10379 ?auto_10367 ) ) ( not ( = ?auto_10379 ?auto_10368 ) ) ( not ( = ?auto_10376 ?auto_10375 ) ) ( HOIST-AT ?auto_10378 ?auto_10376 ) ( not ( = ?auto_10369 ?auto_10378 ) ) ( SURFACE-AT ?auto_10368 ?auto_10376 ) ( ON ?auto_10368 ?auto_10374 ) ( CLEAR ?auto_10368 ) ( not ( = ?auto_10367 ?auto_10374 ) ) ( not ( = ?auto_10368 ?auto_10374 ) ) ( not ( = ?auto_10379 ?auto_10374 ) ) ( IS-CRATE ?auto_10367 ) ( not ( = ?auto_10377 ?auto_10375 ) ) ( not ( = ?auto_10376 ?auto_10377 ) ) ( HOIST-AT ?auto_10371 ?auto_10377 ) ( not ( = ?auto_10369 ?auto_10371 ) ) ( not ( = ?auto_10378 ?auto_10371 ) ) ( AVAILABLE ?auto_10371 ) ( SURFACE-AT ?auto_10367 ?auto_10377 ) ( ON ?auto_10367 ?auto_10372 ) ( CLEAR ?auto_10367 ) ( not ( = ?auto_10367 ?auto_10372 ) ) ( not ( = ?auto_10368 ?auto_10372 ) ) ( not ( = ?auto_10379 ?auto_10372 ) ) ( not ( = ?auto_10374 ?auto_10372 ) ) ( SURFACE-AT ?auto_10370 ?auto_10375 ) ( CLEAR ?auto_10370 ) ( IS-CRATE ?auto_10379 ) ( not ( = ?auto_10370 ?auto_10379 ) ) ( not ( = ?auto_10367 ?auto_10370 ) ) ( not ( = ?auto_10368 ?auto_10370 ) ) ( not ( = ?auto_10374 ?auto_10370 ) ) ( not ( = ?auto_10372 ?auto_10370 ) ) ( AVAILABLE ?auto_10369 ) ( TRUCK-AT ?auto_10373 ?auto_10376 ) ( AVAILABLE ?auto_10378 ) ( SURFACE-AT ?auto_10379 ?auto_10376 ) ( ON ?auto_10379 ?auto_10380 ) ( CLEAR ?auto_10379 ) ( not ( = ?auto_10367 ?auto_10380 ) ) ( not ( = ?auto_10368 ?auto_10380 ) ) ( not ( = ?auto_10379 ?auto_10380 ) ) ( not ( = ?auto_10374 ?auto_10380 ) ) ( not ( = ?auto_10372 ?auto_10380 ) ) ( not ( = ?auto_10370 ?auto_10380 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10378 ?auto_10379 ?auto_10380 ?auto_10376 )
      ( MAKE-2CRATE ?auto_10379 ?auto_10367 ?auto_10368 )
      ( MAKE-1CRATE-VERIFY ?auto_10367 ?auto_10368 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10381 - SURFACE
      ?auto_10382 - SURFACE
      ?auto_10383 - SURFACE
    )
    :vars
    (
      ?auto_10392 - HOIST
      ?auto_10390 - PLACE
      ?auto_10385 - PLACE
      ?auto_10393 - HOIST
      ?auto_10391 - SURFACE
      ?auto_10394 - PLACE
      ?auto_10384 - HOIST
      ?auto_10386 - SURFACE
      ?auto_10387 - SURFACE
      ?auto_10389 - TRUCK
      ?auto_10388 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10392 ?auto_10390 ) ( IS-CRATE ?auto_10383 ) ( not ( = ?auto_10382 ?auto_10383 ) ) ( not ( = ?auto_10381 ?auto_10382 ) ) ( not ( = ?auto_10381 ?auto_10383 ) ) ( not ( = ?auto_10385 ?auto_10390 ) ) ( HOIST-AT ?auto_10393 ?auto_10385 ) ( not ( = ?auto_10392 ?auto_10393 ) ) ( SURFACE-AT ?auto_10383 ?auto_10385 ) ( ON ?auto_10383 ?auto_10391 ) ( CLEAR ?auto_10383 ) ( not ( = ?auto_10382 ?auto_10391 ) ) ( not ( = ?auto_10383 ?auto_10391 ) ) ( not ( = ?auto_10381 ?auto_10391 ) ) ( IS-CRATE ?auto_10382 ) ( not ( = ?auto_10394 ?auto_10390 ) ) ( not ( = ?auto_10385 ?auto_10394 ) ) ( HOIST-AT ?auto_10384 ?auto_10394 ) ( not ( = ?auto_10392 ?auto_10384 ) ) ( not ( = ?auto_10393 ?auto_10384 ) ) ( AVAILABLE ?auto_10384 ) ( SURFACE-AT ?auto_10382 ?auto_10394 ) ( ON ?auto_10382 ?auto_10386 ) ( CLEAR ?auto_10382 ) ( not ( = ?auto_10382 ?auto_10386 ) ) ( not ( = ?auto_10383 ?auto_10386 ) ) ( not ( = ?auto_10381 ?auto_10386 ) ) ( not ( = ?auto_10391 ?auto_10386 ) ) ( SURFACE-AT ?auto_10387 ?auto_10390 ) ( CLEAR ?auto_10387 ) ( IS-CRATE ?auto_10381 ) ( not ( = ?auto_10387 ?auto_10381 ) ) ( not ( = ?auto_10382 ?auto_10387 ) ) ( not ( = ?auto_10383 ?auto_10387 ) ) ( not ( = ?auto_10391 ?auto_10387 ) ) ( not ( = ?auto_10386 ?auto_10387 ) ) ( AVAILABLE ?auto_10392 ) ( TRUCK-AT ?auto_10389 ?auto_10385 ) ( AVAILABLE ?auto_10393 ) ( SURFACE-AT ?auto_10381 ?auto_10385 ) ( ON ?auto_10381 ?auto_10388 ) ( CLEAR ?auto_10381 ) ( not ( = ?auto_10382 ?auto_10388 ) ) ( not ( = ?auto_10383 ?auto_10388 ) ) ( not ( = ?auto_10381 ?auto_10388 ) ) ( not ( = ?auto_10391 ?auto_10388 ) ) ( not ( = ?auto_10386 ?auto_10388 ) ) ( not ( = ?auto_10387 ?auto_10388 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10382 ?auto_10383 )
      ( MAKE-2CRATE-VERIFY ?auto_10381 ?auto_10382 ?auto_10383 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10395 - SURFACE
      ?auto_10396 - SURFACE
      ?auto_10397 - SURFACE
      ?auto_10398 - SURFACE
    )
    :vars
    (
      ?auto_10404 - HOIST
      ?auto_10406 - PLACE
      ?auto_10400 - PLACE
      ?auto_10403 - HOIST
      ?auto_10402 - SURFACE
      ?auto_10407 - PLACE
      ?auto_10408 - HOIST
      ?auto_10401 - SURFACE
      ?auto_10405 - TRUCK
      ?auto_10399 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10404 ?auto_10406 ) ( IS-CRATE ?auto_10398 ) ( not ( = ?auto_10397 ?auto_10398 ) ) ( not ( = ?auto_10396 ?auto_10397 ) ) ( not ( = ?auto_10396 ?auto_10398 ) ) ( not ( = ?auto_10400 ?auto_10406 ) ) ( HOIST-AT ?auto_10403 ?auto_10400 ) ( not ( = ?auto_10404 ?auto_10403 ) ) ( SURFACE-AT ?auto_10398 ?auto_10400 ) ( ON ?auto_10398 ?auto_10402 ) ( CLEAR ?auto_10398 ) ( not ( = ?auto_10397 ?auto_10402 ) ) ( not ( = ?auto_10398 ?auto_10402 ) ) ( not ( = ?auto_10396 ?auto_10402 ) ) ( IS-CRATE ?auto_10397 ) ( not ( = ?auto_10407 ?auto_10406 ) ) ( not ( = ?auto_10400 ?auto_10407 ) ) ( HOIST-AT ?auto_10408 ?auto_10407 ) ( not ( = ?auto_10404 ?auto_10408 ) ) ( not ( = ?auto_10403 ?auto_10408 ) ) ( AVAILABLE ?auto_10408 ) ( SURFACE-AT ?auto_10397 ?auto_10407 ) ( ON ?auto_10397 ?auto_10401 ) ( CLEAR ?auto_10397 ) ( not ( = ?auto_10397 ?auto_10401 ) ) ( not ( = ?auto_10398 ?auto_10401 ) ) ( not ( = ?auto_10396 ?auto_10401 ) ) ( not ( = ?auto_10402 ?auto_10401 ) ) ( SURFACE-AT ?auto_10395 ?auto_10406 ) ( CLEAR ?auto_10395 ) ( IS-CRATE ?auto_10396 ) ( not ( = ?auto_10395 ?auto_10396 ) ) ( not ( = ?auto_10397 ?auto_10395 ) ) ( not ( = ?auto_10398 ?auto_10395 ) ) ( not ( = ?auto_10402 ?auto_10395 ) ) ( not ( = ?auto_10401 ?auto_10395 ) ) ( AVAILABLE ?auto_10404 ) ( TRUCK-AT ?auto_10405 ?auto_10400 ) ( AVAILABLE ?auto_10403 ) ( SURFACE-AT ?auto_10396 ?auto_10400 ) ( ON ?auto_10396 ?auto_10399 ) ( CLEAR ?auto_10396 ) ( not ( = ?auto_10397 ?auto_10399 ) ) ( not ( = ?auto_10398 ?auto_10399 ) ) ( not ( = ?auto_10396 ?auto_10399 ) ) ( not ( = ?auto_10402 ?auto_10399 ) ) ( not ( = ?auto_10401 ?auto_10399 ) ) ( not ( = ?auto_10395 ?auto_10399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10396 ?auto_10397 ?auto_10398 )
      ( MAKE-3CRATE-VERIFY ?auto_10395 ?auto_10396 ?auto_10397 ?auto_10398 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10409 - SURFACE
      ?auto_10410 - SURFACE
    )
    :vars
    (
      ?auto_10416 - HOIST
      ?auto_10419 - PLACE
      ?auto_10421 - SURFACE
      ?auto_10412 - PLACE
      ?auto_10415 - HOIST
      ?auto_10414 - SURFACE
      ?auto_10420 - PLACE
      ?auto_10422 - HOIST
      ?auto_10413 - SURFACE
      ?auto_10417 - SURFACE
      ?auto_10411 - SURFACE
      ?auto_10418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10416 ?auto_10419 ) ( IS-CRATE ?auto_10410 ) ( not ( = ?auto_10409 ?auto_10410 ) ) ( not ( = ?auto_10421 ?auto_10409 ) ) ( not ( = ?auto_10421 ?auto_10410 ) ) ( not ( = ?auto_10412 ?auto_10419 ) ) ( HOIST-AT ?auto_10415 ?auto_10412 ) ( not ( = ?auto_10416 ?auto_10415 ) ) ( SURFACE-AT ?auto_10410 ?auto_10412 ) ( ON ?auto_10410 ?auto_10414 ) ( CLEAR ?auto_10410 ) ( not ( = ?auto_10409 ?auto_10414 ) ) ( not ( = ?auto_10410 ?auto_10414 ) ) ( not ( = ?auto_10421 ?auto_10414 ) ) ( IS-CRATE ?auto_10409 ) ( not ( = ?auto_10420 ?auto_10419 ) ) ( not ( = ?auto_10412 ?auto_10420 ) ) ( HOIST-AT ?auto_10422 ?auto_10420 ) ( not ( = ?auto_10416 ?auto_10422 ) ) ( not ( = ?auto_10415 ?auto_10422 ) ) ( AVAILABLE ?auto_10422 ) ( SURFACE-AT ?auto_10409 ?auto_10420 ) ( ON ?auto_10409 ?auto_10413 ) ( CLEAR ?auto_10409 ) ( not ( = ?auto_10409 ?auto_10413 ) ) ( not ( = ?auto_10410 ?auto_10413 ) ) ( not ( = ?auto_10421 ?auto_10413 ) ) ( not ( = ?auto_10414 ?auto_10413 ) ) ( SURFACE-AT ?auto_10417 ?auto_10419 ) ( CLEAR ?auto_10417 ) ( IS-CRATE ?auto_10421 ) ( not ( = ?auto_10417 ?auto_10421 ) ) ( not ( = ?auto_10409 ?auto_10417 ) ) ( not ( = ?auto_10410 ?auto_10417 ) ) ( not ( = ?auto_10414 ?auto_10417 ) ) ( not ( = ?auto_10413 ?auto_10417 ) ) ( AVAILABLE ?auto_10416 ) ( AVAILABLE ?auto_10415 ) ( SURFACE-AT ?auto_10421 ?auto_10412 ) ( ON ?auto_10421 ?auto_10411 ) ( CLEAR ?auto_10421 ) ( not ( = ?auto_10409 ?auto_10411 ) ) ( not ( = ?auto_10410 ?auto_10411 ) ) ( not ( = ?auto_10421 ?auto_10411 ) ) ( not ( = ?auto_10414 ?auto_10411 ) ) ( not ( = ?auto_10413 ?auto_10411 ) ) ( not ( = ?auto_10417 ?auto_10411 ) ) ( TRUCK-AT ?auto_10418 ?auto_10419 ) )
    :subtasks
    ( ( !DRIVE ?auto_10418 ?auto_10419 ?auto_10412 )
      ( MAKE-2CRATE ?auto_10421 ?auto_10409 ?auto_10410 )
      ( MAKE-1CRATE-VERIFY ?auto_10409 ?auto_10410 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10423 - SURFACE
      ?auto_10424 - SURFACE
      ?auto_10425 - SURFACE
    )
    :vars
    (
      ?auto_10431 - HOIST
      ?auto_10428 - PLACE
      ?auto_10429 - PLACE
      ?auto_10433 - HOIST
      ?auto_10426 - SURFACE
      ?auto_10430 - PLACE
      ?auto_10436 - HOIST
      ?auto_10434 - SURFACE
      ?auto_10427 - SURFACE
      ?auto_10435 - SURFACE
      ?auto_10432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10431 ?auto_10428 ) ( IS-CRATE ?auto_10425 ) ( not ( = ?auto_10424 ?auto_10425 ) ) ( not ( = ?auto_10423 ?auto_10424 ) ) ( not ( = ?auto_10423 ?auto_10425 ) ) ( not ( = ?auto_10429 ?auto_10428 ) ) ( HOIST-AT ?auto_10433 ?auto_10429 ) ( not ( = ?auto_10431 ?auto_10433 ) ) ( SURFACE-AT ?auto_10425 ?auto_10429 ) ( ON ?auto_10425 ?auto_10426 ) ( CLEAR ?auto_10425 ) ( not ( = ?auto_10424 ?auto_10426 ) ) ( not ( = ?auto_10425 ?auto_10426 ) ) ( not ( = ?auto_10423 ?auto_10426 ) ) ( IS-CRATE ?auto_10424 ) ( not ( = ?auto_10430 ?auto_10428 ) ) ( not ( = ?auto_10429 ?auto_10430 ) ) ( HOIST-AT ?auto_10436 ?auto_10430 ) ( not ( = ?auto_10431 ?auto_10436 ) ) ( not ( = ?auto_10433 ?auto_10436 ) ) ( AVAILABLE ?auto_10436 ) ( SURFACE-AT ?auto_10424 ?auto_10430 ) ( ON ?auto_10424 ?auto_10434 ) ( CLEAR ?auto_10424 ) ( not ( = ?auto_10424 ?auto_10434 ) ) ( not ( = ?auto_10425 ?auto_10434 ) ) ( not ( = ?auto_10423 ?auto_10434 ) ) ( not ( = ?auto_10426 ?auto_10434 ) ) ( SURFACE-AT ?auto_10427 ?auto_10428 ) ( CLEAR ?auto_10427 ) ( IS-CRATE ?auto_10423 ) ( not ( = ?auto_10427 ?auto_10423 ) ) ( not ( = ?auto_10424 ?auto_10427 ) ) ( not ( = ?auto_10425 ?auto_10427 ) ) ( not ( = ?auto_10426 ?auto_10427 ) ) ( not ( = ?auto_10434 ?auto_10427 ) ) ( AVAILABLE ?auto_10431 ) ( AVAILABLE ?auto_10433 ) ( SURFACE-AT ?auto_10423 ?auto_10429 ) ( ON ?auto_10423 ?auto_10435 ) ( CLEAR ?auto_10423 ) ( not ( = ?auto_10424 ?auto_10435 ) ) ( not ( = ?auto_10425 ?auto_10435 ) ) ( not ( = ?auto_10423 ?auto_10435 ) ) ( not ( = ?auto_10426 ?auto_10435 ) ) ( not ( = ?auto_10434 ?auto_10435 ) ) ( not ( = ?auto_10427 ?auto_10435 ) ) ( TRUCK-AT ?auto_10432 ?auto_10428 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10424 ?auto_10425 )
      ( MAKE-2CRATE-VERIFY ?auto_10423 ?auto_10424 ?auto_10425 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10437 - SURFACE
      ?auto_10438 - SURFACE
      ?auto_10439 - SURFACE
      ?auto_10440 - SURFACE
    )
    :vars
    (
      ?auto_10442 - HOIST
      ?auto_10448 - PLACE
      ?auto_10443 - PLACE
      ?auto_10447 - HOIST
      ?auto_10449 - SURFACE
      ?auto_10445 - PLACE
      ?auto_10444 - HOIST
      ?auto_10446 - SURFACE
      ?auto_10441 - SURFACE
      ?auto_10450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10442 ?auto_10448 ) ( IS-CRATE ?auto_10440 ) ( not ( = ?auto_10439 ?auto_10440 ) ) ( not ( = ?auto_10438 ?auto_10439 ) ) ( not ( = ?auto_10438 ?auto_10440 ) ) ( not ( = ?auto_10443 ?auto_10448 ) ) ( HOIST-AT ?auto_10447 ?auto_10443 ) ( not ( = ?auto_10442 ?auto_10447 ) ) ( SURFACE-AT ?auto_10440 ?auto_10443 ) ( ON ?auto_10440 ?auto_10449 ) ( CLEAR ?auto_10440 ) ( not ( = ?auto_10439 ?auto_10449 ) ) ( not ( = ?auto_10440 ?auto_10449 ) ) ( not ( = ?auto_10438 ?auto_10449 ) ) ( IS-CRATE ?auto_10439 ) ( not ( = ?auto_10445 ?auto_10448 ) ) ( not ( = ?auto_10443 ?auto_10445 ) ) ( HOIST-AT ?auto_10444 ?auto_10445 ) ( not ( = ?auto_10442 ?auto_10444 ) ) ( not ( = ?auto_10447 ?auto_10444 ) ) ( AVAILABLE ?auto_10444 ) ( SURFACE-AT ?auto_10439 ?auto_10445 ) ( ON ?auto_10439 ?auto_10446 ) ( CLEAR ?auto_10439 ) ( not ( = ?auto_10439 ?auto_10446 ) ) ( not ( = ?auto_10440 ?auto_10446 ) ) ( not ( = ?auto_10438 ?auto_10446 ) ) ( not ( = ?auto_10449 ?auto_10446 ) ) ( SURFACE-AT ?auto_10437 ?auto_10448 ) ( CLEAR ?auto_10437 ) ( IS-CRATE ?auto_10438 ) ( not ( = ?auto_10437 ?auto_10438 ) ) ( not ( = ?auto_10439 ?auto_10437 ) ) ( not ( = ?auto_10440 ?auto_10437 ) ) ( not ( = ?auto_10449 ?auto_10437 ) ) ( not ( = ?auto_10446 ?auto_10437 ) ) ( AVAILABLE ?auto_10442 ) ( AVAILABLE ?auto_10447 ) ( SURFACE-AT ?auto_10438 ?auto_10443 ) ( ON ?auto_10438 ?auto_10441 ) ( CLEAR ?auto_10438 ) ( not ( = ?auto_10439 ?auto_10441 ) ) ( not ( = ?auto_10440 ?auto_10441 ) ) ( not ( = ?auto_10438 ?auto_10441 ) ) ( not ( = ?auto_10449 ?auto_10441 ) ) ( not ( = ?auto_10446 ?auto_10441 ) ) ( not ( = ?auto_10437 ?auto_10441 ) ) ( TRUCK-AT ?auto_10450 ?auto_10448 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10438 ?auto_10439 ?auto_10440 )
      ( MAKE-3CRATE-VERIFY ?auto_10437 ?auto_10438 ?auto_10439 ?auto_10440 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10465 - SURFACE
      ?auto_10466 - SURFACE
    )
    :vars
    (
      ?auto_10467 - HOIST
      ?auto_10468 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10467 ?auto_10468 ) ( SURFACE-AT ?auto_10465 ?auto_10468 ) ( CLEAR ?auto_10465 ) ( LIFTING ?auto_10467 ?auto_10466 ) ( IS-CRATE ?auto_10466 ) ( not ( = ?auto_10465 ?auto_10466 ) ) )
    :subtasks
    ( ( !DROP ?auto_10467 ?auto_10466 ?auto_10465 ?auto_10468 )
      ( MAKE-1CRATE-VERIFY ?auto_10465 ?auto_10466 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10469 - SURFACE
      ?auto_10470 - SURFACE
      ?auto_10471 - SURFACE
    )
    :vars
    (
      ?auto_10473 - HOIST
      ?auto_10472 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10473 ?auto_10472 ) ( SURFACE-AT ?auto_10470 ?auto_10472 ) ( CLEAR ?auto_10470 ) ( LIFTING ?auto_10473 ?auto_10471 ) ( IS-CRATE ?auto_10471 ) ( not ( = ?auto_10470 ?auto_10471 ) ) ( ON ?auto_10470 ?auto_10469 ) ( not ( = ?auto_10469 ?auto_10470 ) ) ( not ( = ?auto_10469 ?auto_10471 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10470 ?auto_10471 )
      ( MAKE-2CRATE-VERIFY ?auto_10469 ?auto_10470 ?auto_10471 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10474 - SURFACE
      ?auto_10475 - SURFACE
      ?auto_10476 - SURFACE
      ?auto_10477 - SURFACE
    )
    :vars
    (
      ?auto_10479 - HOIST
      ?auto_10478 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10479 ?auto_10478 ) ( SURFACE-AT ?auto_10476 ?auto_10478 ) ( CLEAR ?auto_10476 ) ( LIFTING ?auto_10479 ?auto_10477 ) ( IS-CRATE ?auto_10477 ) ( not ( = ?auto_10476 ?auto_10477 ) ) ( ON ?auto_10475 ?auto_10474 ) ( ON ?auto_10476 ?auto_10475 ) ( not ( = ?auto_10474 ?auto_10475 ) ) ( not ( = ?auto_10474 ?auto_10476 ) ) ( not ( = ?auto_10474 ?auto_10477 ) ) ( not ( = ?auto_10475 ?auto_10476 ) ) ( not ( = ?auto_10475 ?auto_10477 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10476 ?auto_10477 )
      ( MAKE-3CRATE-VERIFY ?auto_10474 ?auto_10475 ?auto_10476 ?auto_10477 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10480 - SURFACE
      ?auto_10481 - SURFACE
      ?auto_10482 - SURFACE
      ?auto_10483 - SURFACE
      ?auto_10484 - SURFACE
    )
    :vars
    (
      ?auto_10486 - HOIST
      ?auto_10485 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10486 ?auto_10485 ) ( SURFACE-AT ?auto_10483 ?auto_10485 ) ( CLEAR ?auto_10483 ) ( LIFTING ?auto_10486 ?auto_10484 ) ( IS-CRATE ?auto_10484 ) ( not ( = ?auto_10483 ?auto_10484 ) ) ( ON ?auto_10481 ?auto_10480 ) ( ON ?auto_10482 ?auto_10481 ) ( ON ?auto_10483 ?auto_10482 ) ( not ( = ?auto_10480 ?auto_10481 ) ) ( not ( = ?auto_10480 ?auto_10482 ) ) ( not ( = ?auto_10480 ?auto_10483 ) ) ( not ( = ?auto_10480 ?auto_10484 ) ) ( not ( = ?auto_10481 ?auto_10482 ) ) ( not ( = ?auto_10481 ?auto_10483 ) ) ( not ( = ?auto_10481 ?auto_10484 ) ) ( not ( = ?auto_10482 ?auto_10483 ) ) ( not ( = ?auto_10482 ?auto_10484 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10483 ?auto_10484 )
      ( MAKE-4CRATE-VERIFY ?auto_10480 ?auto_10481 ?auto_10482 ?auto_10483 ?auto_10484 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10487 - SURFACE
      ?auto_10488 - SURFACE
    )
    :vars
    (
      ?auto_10490 - HOIST
      ?auto_10489 - PLACE
      ?auto_10491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10490 ?auto_10489 ) ( SURFACE-AT ?auto_10487 ?auto_10489 ) ( CLEAR ?auto_10487 ) ( IS-CRATE ?auto_10488 ) ( not ( = ?auto_10487 ?auto_10488 ) ) ( TRUCK-AT ?auto_10491 ?auto_10489 ) ( AVAILABLE ?auto_10490 ) ( IN ?auto_10488 ?auto_10491 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10490 ?auto_10488 ?auto_10491 ?auto_10489 )
      ( MAKE-1CRATE ?auto_10487 ?auto_10488 )
      ( MAKE-1CRATE-VERIFY ?auto_10487 ?auto_10488 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10492 - SURFACE
      ?auto_10493 - SURFACE
      ?auto_10494 - SURFACE
    )
    :vars
    (
      ?auto_10496 - HOIST
      ?auto_10497 - PLACE
      ?auto_10495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10496 ?auto_10497 ) ( SURFACE-AT ?auto_10493 ?auto_10497 ) ( CLEAR ?auto_10493 ) ( IS-CRATE ?auto_10494 ) ( not ( = ?auto_10493 ?auto_10494 ) ) ( TRUCK-AT ?auto_10495 ?auto_10497 ) ( AVAILABLE ?auto_10496 ) ( IN ?auto_10494 ?auto_10495 ) ( ON ?auto_10493 ?auto_10492 ) ( not ( = ?auto_10492 ?auto_10493 ) ) ( not ( = ?auto_10492 ?auto_10494 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10493 ?auto_10494 )
      ( MAKE-2CRATE-VERIFY ?auto_10492 ?auto_10493 ?auto_10494 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10498 - SURFACE
      ?auto_10499 - SURFACE
      ?auto_10500 - SURFACE
      ?auto_10501 - SURFACE
    )
    :vars
    (
      ?auto_10502 - HOIST
      ?auto_10503 - PLACE
      ?auto_10504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10502 ?auto_10503 ) ( SURFACE-AT ?auto_10500 ?auto_10503 ) ( CLEAR ?auto_10500 ) ( IS-CRATE ?auto_10501 ) ( not ( = ?auto_10500 ?auto_10501 ) ) ( TRUCK-AT ?auto_10504 ?auto_10503 ) ( AVAILABLE ?auto_10502 ) ( IN ?auto_10501 ?auto_10504 ) ( ON ?auto_10500 ?auto_10499 ) ( not ( = ?auto_10499 ?auto_10500 ) ) ( not ( = ?auto_10499 ?auto_10501 ) ) ( ON ?auto_10499 ?auto_10498 ) ( not ( = ?auto_10498 ?auto_10499 ) ) ( not ( = ?auto_10498 ?auto_10500 ) ) ( not ( = ?auto_10498 ?auto_10501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10499 ?auto_10500 ?auto_10501 )
      ( MAKE-3CRATE-VERIFY ?auto_10498 ?auto_10499 ?auto_10500 ?auto_10501 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10505 - SURFACE
      ?auto_10506 - SURFACE
      ?auto_10507 - SURFACE
      ?auto_10508 - SURFACE
      ?auto_10509 - SURFACE
    )
    :vars
    (
      ?auto_10510 - HOIST
      ?auto_10511 - PLACE
      ?auto_10512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10510 ?auto_10511 ) ( SURFACE-AT ?auto_10508 ?auto_10511 ) ( CLEAR ?auto_10508 ) ( IS-CRATE ?auto_10509 ) ( not ( = ?auto_10508 ?auto_10509 ) ) ( TRUCK-AT ?auto_10512 ?auto_10511 ) ( AVAILABLE ?auto_10510 ) ( IN ?auto_10509 ?auto_10512 ) ( ON ?auto_10508 ?auto_10507 ) ( not ( = ?auto_10507 ?auto_10508 ) ) ( not ( = ?auto_10507 ?auto_10509 ) ) ( ON ?auto_10506 ?auto_10505 ) ( ON ?auto_10507 ?auto_10506 ) ( not ( = ?auto_10505 ?auto_10506 ) ) ( not ( = ?auto_10505 ?auto_10507 ) ) ( not ( = ?auto_10505 ?auto_10508 ) ) ( not ( = ?auto_10505 ?auto_10509 ) ) ( not ( = ?auto_10506 ?auto_10507 ) ) ( not ( = ?auto_10506 ?auto_10508 ) ) ( not ( = ?auto_10506 ?auto_10509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10507 ?auto_10508 ?auto_10509 )
      ( MAKE-4CRATE-VERIFY ?auto_10505 ?auto_10506 ?auto_10507 ?auto_10508 ?auto_10509 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10513 - SURFACE
      ?auto_10514 - SURFACE
    )
    :vars
    (
      ?auto_10516 - HOIST
      ?auto_10517 - PLACE
      ?auto_10518 - TRUCK
      ?auto_10515 - SURFACE
      ?auto_10519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10516 ?auto_10517 ) ( SURFACE-AT ?auto_10513 ?auto_10517 ) ( CLEAR ?auto_10513 ) ( IS-CRATE ?auto_10514 ) ( not ( = ?auto_10513 ?auto_10514 ) ) ( AVAILABLE ?auto_10516 ) ( IN ?auto_10514 ?auto_10518 ) ( ON ?auto_10513 ?auto_10515 ) ( not ( = ?auto_10515 ?auto_10513 ) ) ( not ( = ?auto_10515 ?auto_10514 ) ) ( TRUCK-AT ?auto_10518 ?auto_10519 ) ( not ( = ?auto_10519 ?auto_10517 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10518 ?auto_10519 ?auto_10517 )
      ( MAKE-2CRATE ?auto_10515 ?auto_10513 ?auto_10514 )
      ( MAKE-1CRATE-VERIFY ?auto_10513 ?auto_10514 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10520 - SURFACE
      ?auto_10521 - SURFACE
      ?auto_10522 - SURFACE
    )
    :vars
    (
      ?auto_10523 - HOIST
      ?auto_10525 - PLACE
      ?auto_10524 - TRUCK
      ?auto_10526 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10523 ?auto_10525 ) ( SURFACE-AT ?auto_10521 ?auto_10525 ) ( CLEAR ?auto_10521 ) ( IS-CRATE ?auto_10522 ) ( not ( = ?auto_10521 ?auto_10522 ) ) ( AVAILABLE ?auto_10523 ) ( IN ?auto_10522 ?auto_10524 ) ( ON ?auto_10521 ?auto_10520 ) ( not ( = ?auto_10520 ?auto_10521 ) ) ( not ( = ?auto_10520 ?auto_10522 ) ) ( TRUCK-AT ?auto_10524 ?auto_10526 ) ( not ( = ?auto_10526 ?auto_10525 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10521 ?auto_10522 )
      ( MAKE-2CRATE-VERIFY ?auto_10520 ?auto_10521 ?auto_10522 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10527 - SURFACE
      ?auto_10528 - SURFACE
      ?auto_10529 - SURFACE
      ?auto_10530 - SURFACE
    )
    :vars
    (
      ?auto_10531 - HOIST
      ?auto_10534 - PLACE
      ?auto_10533 - TRUCK
      ?auto_10532 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10531 ?auto_10534 ) ( SURFACE-AT ?auto_10529 ?auto_10534 ) ( CLEAR ?auto_10529 ) ( IS-CRATE ?auto_10530 ) ( not ( = ?auto_10529 ?auto_10530 ) ) ( AVAILABLE ?auto_10531 ) ( IN ?auto_10530 ?auto_10533 ) ( ON ?auto_10529 ?auto_10528 ) ( not ( = ?auto_10528 ?auto_10529 ) ) ( not ( = ?auto_10528 ?auto_10530 ) ) ( TRUCK-AT ?auto_10533 ?auto_10532 ) ( not ( = ?auto_10532 ?auto_10534 ) ) ( ON ?auto_10528 ?auto_10527 ) ( not ( = ?auto_10527 ?auto_10528 ) ) ( not ( = ?auto_10527 ?auto_10529 ) ) ( not ( = ?auto_10527 ?auto_10530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10528 ?auto_10529 ?auto_10530 )
      ( MAKE-3CRATE-VERIFY ?auto_10527 ?auto_10528 ?auto_10529 ?auto_10530 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10535 - SURFACE
      ?auto_10536 - SURFACE
      ?auto_10537 - SURFACE
      ?auto_10538 - SURFACE
      ?auto_10539 - SURFACE
    )
    :vars
    (
      ?auto_10540 - HOIST
      ?auto_10543 - PLACE
      ?auto_10542 - TRUCK
      ?auto_10541 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10540 ?auto_10543 ) ( SURFACE-AT ?auto_10538 ?auto_10543 ) ( CLEAR ?auto_10538 ) ( IS-CRATE ?auto_10539 ) ( not ( = ?auto_10538 ?auto_10539 ) ) ( AVAILABLE ?auto_10540 ) ( IN ?auto_10539 ?auto_10542 ) ( ON ?auto_10538 ?auto_10537 ) ( not ( = ?auto_10537 ?auto_10538 ) ) ( not ( = ?auto_10537 ?auto_10539 ) ) ( TRUCK-AT ?auto_10542 ?auto_10541 ) ( not ( = ?auto_10541 ?auto_10543 ) ) ( ON ?auto_10536 ?auto_10535 ) ( ON ?auto_10537 ?auto_10536 ) ( not ( = ?auto_10535 ?auto_10536 ) ) ( not ( = ?auto_10535 ?auto_10537 ) ) ( not ( = ?auto_10535 ?auto_10538 ) ) ( not ( = ?auto_10535 ?auto_10539 ) ) ( not ( = ?auto_10536 ?auto_10537 ) ) ( not ( = ?auto_10536 ?auto_10538 ) ) ( not ( = ?auto_10536 ?auto_10539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10537 ?auto_10538 ?auto_10539 )
      ( MAKE-4CRATE-VERIFY ?auto_10535 ?auto_10536 ?auto_10537 ?auto_10538 ?auto_10539 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10544 - SURFACE
      ?auto_10545 - SURFACE
    )
    :vars
    (
      ?auto_10547 - HOIST
      ?auto_10550 - PLACE
      ?auto_10546 - SURFACE
      ?auto_10549 - TRUCK
      ?auto_10548 - PLACE
      ?auto_10551 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10547 ?auto_10550 ) ( SURFACE-AT ?auto_10544 ?auto_10550 ) ( CLEAR ?auto_10544 ) ( IS-CRATE ?auto_10545 ) ( not ( = ?auto_10544 ?auto_10545 ) ) ( AVAILABLE ?auto_10547 ) ( ON ?auto_10544 ?auto_10546 ) ( not ( = ?auto_10546 ?auto_10544 ) ) ( not ( = ?auto_10546 ?auto_10545 ) ) ( TRUCK-AT ?auto_10549 ?auto_10548 ) ( not ( = ?auto_10548 ?auto_10550 ) ) ( HOIST-AT ?auto_10551 ?auto_10548 ) ( LIFTING ?auto_10551 ?auto_10545 ) ( not ( = ?auto_10547 ?auto_10551 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10551 ?auto_10545 ?auto_10549 ?auto_10548 )
      ( MAKE-2CRATE ?auto_10546 ?auto_10544 ?auto_10545 )
      ( MAKE-1CRATE-VERIFY ?auto_10544 ?auto_10545 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10552 - SURFACE
      ?auto_10553 - SURFACE
      ?auto_10554 - SURFACE
    )
    :vars
    (
      ?auto_10556 - HOIST
      ?auto_10557 - PLACE
      ?auto_10559 - TRUCK
      ?auto_10558 - PLACE
      ?auto_10555 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10556 ?auto_10557 ) ( SURFACE-AT ?auto_10553 ?auto_10557 ) ( CLEAR ?auto_10553 ) ( IS-CRATE ?auto_10554 ) ( not ( = ?auto_10553 ?auto_10554 ) ) ( AVAILABLE ?auto_10556 ) ( ON ?auto_10553 ?auto_10552 ) ( not ( = ?auto_10552 ?auto_10553 ) ) ( not ( = ?auto_10552 ?auto_10554 ) ) ( TRUCK-AT ?auto_10559 ?auto_10558 ) ( not ( = ?auto_10558 ?auto_10557 ) ) ( HOIST-AT ?auto_10555 ?auto_10558 ) ( LIFTING ?auto_10555 ?auto_10554 ) ( not ( = ?auto_10556 ?auto_10555 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10553 ?auto_10554 )
      ( MAKE-2CRATE-VERIFY ?auto_10552 ?auto_10553 ?auto_10554 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10560 - SURFACE
      ?auto_10561 - SURFACE
      ?auto_10562 - SURFACE
      ?auto_10563 - SURFACE
    )
    :vars
    (
      ?auto_10567 - HOIST
      ?auto_10568 - PLACE
      ?auto_10564 - TRUCK
      ?auto_10566 - PLACE
      ?auto_10565 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10567 ?auto_10568 ) ( SURFACE-AT ?auto_10562 ?auto_10568 ) ( CLEAR ?auto_10562 ) ( IS-CRATE ?auto_10563 ) ( not ( = ?auto_10562 ?auto_10563 ) ) ( AVAILABLE ?auto_10567 ) ( ON ?auto_10562 ?auto_10561 ) ( not ( = ?auto_10561 ?auto_10562 ) ) ( not ( = ?auto_10561 ?auto_10563 ) ) ( TRUCK-AT ?auto_10564 ?auto_10566 ) ( not ( = ?auto_10566 ?auto_10568 ) ) ( HOIST-AT ?auto_10565 ?auto_10566 ) ( LIFTING ?auto_10565 ?auto_10563 ) ( not ( = ?auto_10567 ?auto_10565 ) ) ( ON ?auto_10561 ?auto_10560 ) ( not ( = ?auto_10560 ?auto_10561 ) ) ( not ( = ?auto_10560 ?auto_10562 ) ) ( not ( = ?auto_10560 ?auto_10563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10561 ?auto_10562 ?auto_10563 )
      ( MAKE-3CRATE-VERIFY ?auto_10560 ?auto_10561 ?auto_10562 ?auto_10563 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10569 - SURFACE
      ?auto_10570 - SURFACE
      ?auto_10571 - SURFACE
      ?auto_10572 - SURFACE
      ?auto_10573 - SURFACE
    )
    :vars
    (
      ?auto_10577 - HOIST
      ?auto_10578 - PLACE
      ?auto_10574 - TRUCK
      ?auto_10576 - PLACE
      ?auto_10575 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10577 ?auto_10578 ) ( SURFACE-AT ?auto_10572 ?auto_10578 ) ( CLEAR ?auto_10572 ) ( IS-CRATE ?auto_10573 ) ( not ( = ?auto_10572 ?auto_10573 ) ) ( AVAILABLE ?auto_10577 ) ( ON ?auto_10572 ?auto_10571 ) ( not ( = ?auto_10571 ?auto_10572 ) ) ( not ( = ?auto_10571 ?auto_10573 ) ) ( TRUCK-AT ?auto_10574 ?auto_10576 ) ( not ( = ?auto_10576 ?auto_10578 ) ) ( HOIST-AT ?auto_10575 ?auto_10576 ) ( LIFTING ?auto_10575 ?auto_10573 ) ( not ( = ?auto_10577 ?auto_10575 ) ) ( ON ?auto_10570 ?auto_10569 ) ( ON ?auto_10571 ?auto_10570 ) ( not ( = ?auto_10569 ?auto_10570 ) ) ( not ( = ?auto_10569 ?auto_10571 ) ) ( not ( = ?auto_10569 ?auto_10572 ) ) ( not ( = ?auto_10569 ?auto_10573 ) ) ( not ( = ?auto_10570 ?auto_10571 ) ) ( not ( = ?auto_10570 ?auto_10572 ) ) ( not ( = ?auto_10570 ?auto_10573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10571 ?auto_10572 ?auto_10573 )
      ( MAKE-4CRATE-VERIFY ?auto_10569 ?auto_10570 ?auto_10571 ?auto_10572 ?auto_10573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10579 - SURFACE
      ?auto_10580 - SURFACE
    )
    :vars
    (
      ?auto_10585 - HOIST
      ?auto_10586 - PLACE
      ?auto_10582 - SURFACE
      ?auto_10581 - TRUCK
      ?auto_10584 - PLACE
      ?auto_10583 - HOIST
      ?auto_10587 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10585 ?auto_10586 ) ( SURFACE-AT ?auto_10579 ?auto_10586 ) ( CLEAR ?auto_10579 ) ( IS-CRATE ?auto_10580 ) ( not ( = ?auto_10579 ?auto_10580 ) ) ( AVAILABLE ?auto_10585 ) ( ON ?auto_10579 ?auto_10582 ) ( not ( = ?auto_10582 ?auto_10579 ) ) ( not ( = ?auto_10582 ?auto_10580 ) ) ( TRUCK-AT ?auto_10581 ?auto_10584 ) ( not ( = ?auto_10584 ?auto_10586 ) ) ( HOIST-AT ?auto_10583 ?auto_10584 ) ( not ( = ?auto_10585 ?auto_10583 ) ) ( AVAILABLE ?auto_10583 ) ( SURFACE-AT ?auto_10580 ?auto_10584 ) ( ON ?auto_10580 ?auto_10587 ) ( CLEAR ?auto_10580 ) ( not ( = ?auto_10579 ?auto_10587 ) ) ( not ( = ?auto_10580 ?auto_10587 ) ) ( not ( = ?auto_10582 ?auto_10587 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10583 ?auto_10580 ?auto_10587 ?auto_10584 )
      ( MAKE-2CRATE ?auto_10582 ?auto_10579 ?auto_10580 )
      ( MAKE-1CRATE-VERIFY ?auto_10579 ?auto_10580 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10588 - SURFACE
      ?auto_10589 - SURFACE
      ?auto_10590 - SURFACE
    )
    :vars
    (
      ?auto_10592 - HOIST
      ?auto_10594 - PLACE
      ?auto_10591 - TRUCK
      ?auto_10593 - PLACE
      ?auto_10596 - HOIST
      ?auto_10595 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10592 ?auto_10594 ) ( SURFACE-AT ?auto_10589 ?auto_10594 ) ( CLEAR ?auto_10589 ) ( IS-CRATE ?auto_10590 ) ( not ( = ?auto_10589 ?auto_10590 ) ) ( AVAILABLE ?auto_10592 ) ( ON ?auto_10589 ?auto_10588 ) ( not ( = ?auto_10588 ?auto_10589 ) ) ( not ( = ?auto_10588 ?auto_10590 ) ) ( TRUCK-AT ?auto_10591 ?auto_10593 ) ( not ( = ?auto_10593 ?auto_10594 ) ) ( HOIST-AT ?auto_10596 ?auto_10593 ) ( not ( = ?auto_10592 ?auto_10596 ) ) ( AVAILABLE ?auto_10596 ) ( SURFACE-AT ?auto_10590 ?auto_10593 ) ( ON ?auto_10590 ?auto_10595 ) ( CLEAR ?auto_10590 ) ( not ( = ?auto_10589 ?auto_10595 ) ) ( not ( = ?auto_10590 ?auto_10595 ) ) ( not ( = ?auto_10588 ?auto_10595 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10589 ?auto_10590 )
      ( MAKE-2CRATE-VERIFY ?auto_10588 ?auto_10589 ?auto_10590 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10597 - SURFACE
      ?auto_10598 - SURFACE
      ?auto_10599 - SURFACE
      ?auto_10600 - SURFACE
    )
    :vars
    (
      ?auto_10604 - HOIST
      ?auto_10606 - PLACE
      ?auto_10601 - TRUCK
      ?auto_10602 - PLACE
      ?auto_10603 - HOIST
      ?auto_10605 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10604 ?auto_10606 ) ( SURFACE-AT ?auto_10599 ?auto_10606 ) ( CLEAR ?auto_10599 ) ( IS-CRATE ?auto_10600 ) ( not ( = ?auto_10599 ?auto_10600 ) ) ( AVAILABLE ?auto_10604 ) ( ON ?auto_10599 ?auto_10598 ) ( not ( = ?auto_10598 ?auto_10599 ) ) ( not ( = ?auto_10598 ?auto_10600 ) ) ( TRUCK-AT ?auto_10601 ?auto_10602 ) ( not ( = ?auto_10602 ?auto_10606 ) ) ( HOIST-AT ?auto_10603 ?auto_10602 ) ( not ( = ?auto_10604 ?auto_10603 ) ) ( AVAILABLE ?auto_10603 ) ( SURFACE-AT ?auto_10600 ?auto_10602 ) ( ON ?auto_10600 ?auto_10605 ) ( CLEAR ?auto_10600 ) ( not ( = ?auto_10599 ?auto_10605 ) ) ( not ( = ?auto_10600 ?auto_10605 ) ) ( not ( = ?auto_10598 ?auto_10605 ) ) ( ON ?auto_10598 ?auto_10597 ) ( not ( = ?auto_10597 ?auto_10598 ) ) ( not ( = ?auto_10597 ?auto_10599 ) ) ( not ( = ?auto_10597 ?auto_10600 ) ) ( not ( = ?auto_10597 ?auto_10605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10598 ?auto_10599 ?auto_10600 )
      ( MAKE-3CRATE-VERIFY ?auto_10597 ?auto_10598 ?auto_10599 ?auto_10600 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10607 - SURFACE
      ?auto_10608 - SURFACE
      ?auto_10609 - SURFACE
      ?auto_10610 - SURFACE
      ?auto_10611 - SURFACE
    )
    :vars
    (
      ?auto_10615 - HOIST
      ?auto_10617 - PLACE
      ?auto_10612 - TRUCK
      ?auto_10613 - PLACE
      ?auto_10614 - HOIST
      ?auto_10616 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10615 ?auto_10617 ) ( SURFACE-AT ?auto_10610 ?auto_10617 ) ( CLEAR ?auto_10610 ) ( IS-CRATE ?auto_10611 ) ( not ( = ?auto_10610 ?auto_10611 ) ) ( AVAILABLE ?auto_10615 ) ( ON ?auto_10610 ?auto_10609 ) ( not ( = ?auto_10609 ?auto_10610 ) ) ( not ( = ?auto_10609 ?auto_10611 ) ) ( TRUCK-AT ?auto_10612 ?auto_10613 ) ( not ( = ?auto_10613 ?auto_10617 ) ) ( HOIST-AT ?auto_10614 ?auto_10613 ) ( not ( = ?auto_10615 ?auto_10614 ) ) ( AVAILABLE ?auto_10614 ) ( SURFACE-AT ?auto_10611 ?auto_10613 ) ( ON ?auto_10611 ?auto_10616 ) ( CLEAR ?auto_10611 ) ( not ( = ?auto_10610 ?auto_10616 ) ) ( not ( = ?auto_10611 ?auto_10616 ) ) ( not ( = ?auto_10609 ?auto_10616 ) ) ( ON ?auto_10608 ?auto_10607 ) ( ON ?auto_10609 ?auto_10608 ) ( not ( = ?auto_10607 ?auto_10608 ) ) ( not ( = ?auto_10607 ?auto_10609 ) ) ( not ( = ?auto_10607 ?auto_10610 ) ) ( not ( = ?auto_10607 ?auto_10611 ) ) ( not ( = ?auto_10607 ?auto_10616 ) ) ( not ( = ?auto_10608 ?auto_10609 ) ) ( not ( = ?auto_10608 ?auto_10610 ) ) ( not ( = ?auto_10608 ?auto_10611 ) ) ( not ( = ?auto_10608 ?auto_10616 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10609 ?auto_10610 ?auto_10611 )
      ( MAKE-4CRATE-VERIFY ?auto_10607 ?auto_10608 ?auto_10609 ?auto_10610 ?auto_10611 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10618 - SURFACE
      ?auto_10619 - SURFACE
    )
    :vars
    (
      ?auto_10624 - HOIST
      ?auto_10626 - PLACE
      ?auto_10621 - SURFACE
      ?auto_10622 - PLACE
      ?auto_10623 - HOIST
      ?auto_10625 - SURFACE
      ?auto_10620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10624 ?auto_10626 ) ( SURFACE-AT ?auto_10618 ?auto_10626 ) ( CLEAR ?auto_10618 ) ( IS-CRATE ?auto_10619 ) ( not ( = ?auto_10618 ?auto_10619 ) ) ( AVAILABLE ?auto_10624 ) ( ON ?auto_10618 ?auto_10621 ) ( not ( = ?auto_10621 ?auto_10618 ) ) ( not ( = ?auto_10621 ?auto_10619 ) ) ( not ( = ?auto_10622 ?auto_10626 ) ) ( HOIST-AT ?auto_10623 ?auto_10622 ) ( not ( = ?auto_10624 ?auto_10623 ) ) ( AVAILABLE ?auto_10623 ) ( SURFACE-AT ?auto_10619 ?auto_10622 ) ( ON ?auto_10619 ?auto_10625 ) ( CLEAR ?auto_10619 ) ( not ( = ?auto_10618 ?auto_10625 ) ) ( not ( = ?auto_10619 ?auto_10625 ) ) ( not ( = ?auto_10621 ?auto_10625 ) ) ( TRUCK-AT ?auto_10620 ?auto_10626 ) )
    :subtasks
    ( ( !DRIVE ?auto_10620 ?auto_10626 ?auto_10622 )
      ( MAKE-2CRATE ?auto_10621 ?auto_10618 ?auto_10619 )
      ( MAKE-1CRATE-VERIFY ?auto_10618 ?auto_10619 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10627 - SURFACE
      ?auto_10628 - SURFACE
      ?auto_10629 - SURFACE
    )
    :vars
    (
      ?auto_10631 - HOIST
      ?auto_10632 - PLACE
      ?auto_10634 - PLACE
      ?auto_10630 - HOIST
      ?auto_10633 - SURFACE
      ?auto_10635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10631 ?auto_10632 ) ( SURFACE-AT ?auto_10628 ?auto_10632 ) ( CLEAR ?auto_10628 ) ( IS-CRATE ?auto_10629 ) ( not ( = ?auto_10628 ?auto_10629 ) ) ( AVAILABLE ?auto_10631 ) ( ON ?auto_10628 ?auto_10627 ) ( not ( = ?auto_10627 ?auto_10628 ) ) ( not ( = ?auto_10627 ?auto_10629 ) ) ( not ( = ?auto_10634 ?auto_10632 ) ) ( HOIST-AT ?auto_10630 ?auto_10634 ) ( not ( = ?auto_10631 ?auto_10630 ) ) ( AVAILABLE ?auto_10630 ) ( SURFACE-AT ?auto_10629 ?auto_10634 ) ( ON ?auto_10629 ?auto_10633 ) ( CLEAR ?auto_10629 ) ( not ( = ?auto_10628 ?auto_10633 ) ) ( not ( = ?auto_10629 ?auto_10633 ) ) ( not ( = ?auto_10627 ?auto_10633 ) ) ( TRUCK-AT ?auto_10635 ?auto_10632 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10628 ?auto_10629 )
      ( MAKE-2CRATE-VERIFY ?auto_10627 ?auto_10628 ?auto_10629 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10636 - SURFACE
      ?auto_10637 - SURFACE
      ?auto_10638 - SURFACE
      ?auto_10639 - SURFACE
    )
    :vars
    (
      ?auto_10640 - HOIST
      ?auto_10643 - PLACE
      ?auto_10644 - PLACE
      ?auto_10642 - HOIST
      ?auto_10645 - SURFACE
      ?auto_10641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10640 ?auto_10643 ) ( SURFACE-AT ?auto_10638 ?auto_10643 ) ( CLEAR ?auto_10638 ) ( IS-CRATE ?auto_10639 ) ( not ( = ?auto_10638 ?auto_10639 ) ) ( AVAILABLE ?auto_10640 ) ( ON ?auto_10638 ?auto_10637 ) ( not ( = ?auto_10637 ?auto_10638 ) ) ( not ( = ?auto_10637 ?auto_10639 ) ) ( not ( = ?auto_10644 ?auto_10643 ) ) ( HOIST-AT ?auto_10642 ?auto_10644 ) ( not ( = ?auto_10640 ?auto_10642 ) ) ( AVAILABLE ?auto_10642 ) ( SURFACE-AT ?auto_10639 ?auto_10644 ) ( ON ?auto_10639 ?auto_10645 ) ( CLEAR ?auto_10639 ) ( not ( = ?auto_10638 ?auto_10645 ) ) ( not ( = ?auto_10639 ?auto_10645 ) ) ( not ( = ?auto_10637 ?auto_10645 ) ) ( TRUCK-AT ?auto_10641 ?auto_10643 ) ( ON ?auto_10637 ?auto_10636 ) ( not ( = ?auto_10636 ?auto_10637 ) ) ( not ( = ?auto_10636 ?auto_10638 ) ) ( not ( = ?auto_10636 ?auto_10639 ) ) ( not ( = ?auto_10636 ?auto_10645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10637 ?auto_10638 ?auto_10639 )
      ( MAKE-3CRATE-VERIFY ?auto_10636 ?auto_10637 ?auto_10638 ?auto_10639 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10646 - SURFACE
      ?auto_10647 - SURFACE
      ?auto_10648 - SURFACE
      ?auto_10649 - SURFACE
      ?auto_10650 - SURFACE
    )
    :vars
    (
      ?auto_10651 - HOIST
      ?auto_10654 - PLACE
      ?auto_10655 - PLACE
      ?auto_10653 - HOIST
      ?auto_10656 - SURFACE
      ?auto_10652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10651 ?auto_10654 ) ( SURFACE-AT ?auto_10649 ?auto_10654 ) ( CLEAR ?auto_10649 ) ( IS-CRATE ?auto_10650 ) ( not ( = ?auto_10649 ?auto_10650 ) ) ( AVAILABLE ?auto_10651 ) ( ON ?auto_10649 ?auto_10648 ) ( not ( = ?auto_10648 ?auto_10649 ) ) ( not ( = ?auto_10648 ?auto_10650 ) ) ( not ( = ?auto_10655 ?auto_10654 ) ) ( HOIST-AT ?auto_10653 ?auto_10655 ) ( not ( = ?auto_10651 ?auto_10653 ) ) ( AVAILABLE ?auto_10653 ) ( SURFACE-AT ?auto_10650 ?auto_10655 ) ( ON ?auto_10650 ?auto_10656 ) ( CLEAR ?auto_10650 ) ( not ( = ?auto_10649 ?auto_10656 ) ) ( not ( = ?auto_10650 ?auto_10656 ) ) ( not ( = ?auto_10648 ?auto_10656 ) ) ( TRUCK-AT ?auto_10652 ?auto_10654 ) ( ON ?auto_10647 ?auto_10646 ) ( ON ?auto_10648 ?auto_10647 ) ( not ( = ?auto_10646 ?auto_10647 ) ) ( not ( = ?auto_10646 ?auto_10648 ) ) ( not ( = ?auto_10646 ?auto_10649 ) ) ( not ( = ?auto_10646 ?auto_10650 ) ) ( not ( = ?auto_10646 ?auto_10656 ) ) ( not ( = ?auto_10647 ?auto_10648 ) ) ( not ( = ?auto_10647 ?auto_10649 ) ) ( not ( = ?auto_10647 ?auto_10650 ) ) ( not ( = ?auto_10647 ?auto_10656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10648 ?auto_10649 ?auto_10650 )
      ( MAKE-4CRATE-VERIFY ?auto_10646 ?auto_10647 ?auto_10648 ?auto_10649 ?auto_10650 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10657 - SURFACE
      ?auto_10658 - SURFACE
    )
    :vars
    (
      ?auto_10659 - HOIST
      ?auto_10662 - PLACE
      ?auto_10664 - SURFACE
      ?auto_10663 - PLACE
      ?auto_10661 - HOIST
      ?auto_10665 - SURFACE
      ?auto_10660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10659 ?auto_10662 ) ( IS-CRATE ?auto_10658 ) ( not ( = ?auto_10657 ?auto_10658 ) ) ( not ( = ?auto_10664 ?auto_10657 ) ) ( not ( = ?auto_10664 ?auto_10658 ) ) ( not ( = ?auto_10663 ?auto_10662 ) ) ( HOIST-AT ?auto_10661 ?auto_10663 ) ( not ( = ?auto_10659 ?auto_10661 ) ) ( AVAILABLE ?auto_10661 ) ( SURFACE-AT ?auto_10658 ?auto_10663 ) ( ON ?auto_10658 ?auto_10665 ) ( CLEAR ?auto_10658 ) ( not ( = ?auto_10657 ?auto_10665 ) ) ( not ( = ?auto_10658 ?auto_10665 ) ) ( not ( = ?auto_10664 ?auto_10665 ) ) ( TRUCK-AT ?auto_10660 ?auto_10662 ) ( SURFACE-AT ?auto_10664 ?auto_10662 ) ( CLEAR ?auto_10664 ) ( LIFTING ?auto_10659 ?auto_10657 ) ( IS-CRATE ?auto_10657 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10664 ?auto_10657 )
      ( MAKE-2CRATE ?auto_10664 ?auto_10657 ?auto_10658 )
      ( MAKE-1CRATE-VERIFY ?auto_10657 ?auto_10658 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10666 - SURFACE
      ?auto_10667 - SURFACE
      ?auto_10668 - SURFACE
    )
    :vars
    (
      ?auto_10674 - HOIST
      ?auto_10670 - PLACE
      ?auto_10672 - PLACE
      ?auto_10671 - HOIST
      ?auto_10669 - SURFACE
      ?auto_10673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10674 ?auto_10670 ) ( IS-CRATE ?auto_10668 ) ( not ( = ?auto_10667 ?auto_10668 ) ) ( not ( = ?auto_10666 ?auto_10667 ) ) ( not ( = ?auto_10666 ?auto_10668 ) ) ( not ( = ?auto_10672 ?auto_10670 ) ) ( HOIST-AT ?auto_10671 ?auto_10672 ) ( not ( = ?auto_10674 ?auto_10671 ) ) ( AVAILABLE ?auto_10671 ) ( SURFACE-AT ?auto_10668 ?auto_10672 ) ( ON ?auto_10668 ?auto_10669 ) ( CLEAR ?auto_10668 ) ( not ( = ?auto_10667 ?auto_10669 ) ) ( not ( = ?auto_10668 ?auto_10669 ) ) ( not ( = ?auto_10666 ?auto_10669 ) ) ( TRUCK-AT ?auto_10673 ?auto_10670 ) ( SURFACE-AT ?auto_10666 ?auto_10670 ) ( CLEAR ?auto_10666 ) ( LIFTING ?auto_10674 ?auto_10667 ) ( IS-CRATE ?auto_10667 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10667 ?auto_10668 )
      ( MAKE-2CRATE-VERIFY ?auto_10666 ?auto_10667 ?auto_10668 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10675 - SURFACE
      ?auto_10676 - SURFACE
      ?auto_10677 - SURFACE
      ?auto_10678 - SURFACE
    )
    :vars
    (
      ?auto_10682 - HOIST
      ?auto_10681 - PLACE
      ?auto_10684 - PLACE
      ?auto_10679 - HOIST
      ?auto_10680 - SURFACE
      ?auto_10683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10682 ?auto_10681 ) ( IS-CRATE ?auto_10678 ) ( not ( = ?auto_10677 ?auto_10678 ) ) ( not ( = ?auto_10676 ?auto_10677 ) ) ( not ( = ?auto_10676 ?auto_10678 ) ) ( not ( = ?auto_10684 ?auto_10681 ) ) ( HOIST-AT ?auto_10679 ?auto_10684 ) ( not ( = ?auto_10682 ?auto_10679 ) ) ( AVAILABLE ?auto_10679 ) ( SURFACE-AT ?auto_10678 ?auto_10684 ) ( ON ?auto_10678 ?auto_10680 ) ( CLEAR ?auto_10678 ) ( not ( = ?auto_10677 ?auto_10680 ) ) ( not ( = ?auto_10678 ?auto_10680 ) ) ( not ( = ?auto_10676 ?auto_10680 ) ) ( TRUCK-AT ?auto_10683 ?auto_10681 ) ( SURFACE-AT ?auto_10676 ?auto_10681 ) ( CLEAR ?auto_10676 ) ( LIFTING ?auto_10682 ?auto_10677 ) ( IS-CRATE ?auto_10677 ) ( ON ?auto_10676 ?auto_10675 ) ( not ( = ?auto_10675 ?auto_10676 ) ) ( not ( = ?auto_10675 ?auto_10677 ) ) ( not ( = ?auto_10675 ?auto_10678 ) ) ( not ( = ?auto_10675 ?auto_10680 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10676 ?auto_10677 ?auto_10678 )
      ( MAKE-3CRATE-VERIFY ?auto_10675 ?auto_10676 ?auto_10677 ?auto_10678 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10685 - SURFACE
      ?auto_10686 - SURFACE
      ?auto_10687 - SURFACE
      ?auto_10688 - SURFACE
      ?auto_10689 - SURFACE
    )
    :vars
    (
      ?auto_10693 - HOIST
      ?auto_10692 - PLACE
      ?auto_10695 - PLACE
      ?auto_10690 - HOIST
      ?auto_10691 - SURFACE
      ?auto_10694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10693 ?auto_10692 ) ( IS-CRATE ?auto_10689 ) ( not ( = ?auto_10688 ?auto_10689 ) ) ( not ( = ?auto_10687 ?auto_10688 ) ) ( not ( = ?auto_10687 ?auto_10689 ) ) ( not ( = ?auto_10695 ?auto_10692 ) ) ( HOIST-AT ?auto_10690 ?auto_10695 ) ( not ( = ?auto_10693 ?auto_10690 ) ) ( AVAILABLE ?auto_10690 ) ( SURFACE-AT ?auto_10689 ?auto_10695 ) ( ON ?auto_10689 ?auto_10691 ) ( CLEAR ?auto_10689 ) ( not ( = ?auto_10688 ?auto_10691 ) ) ( not ( = ?auto_10689 ?auto_10691 ) ) ( not ( = ?auto_10687 ?auto_10691 ) ) ( TRUCK-AT ?auto_10694 ?auto_10692 ) ( SURFACE-AT ?auto_10687 ?auto_10692 ) ( CLEAR ?auto_10687 ) ( LIFTING ?auto_10693 ?auto_10688 ) ( IS-CRATE ?auto_10688 ) ( ON ?auto_10686 ?auto_10685 ) ( ON ?auto_10687 ?auto_10686 ) ( not ( = ?auto_10685 ?auto_10686 ) ) ( not ( = ?auto_10685 ?auto_10687 ) ) ( not ( = ?auto_10685 ?auto_10688 ) ) ( not ( = ?auto_10685 ?auto_10689 ) ) ( not ( = ?auto_10685 ?auto_10691 ) ) ( not ( = ?auto_10686 ?auto_10687 ) ) ( not ( = ?auto_10686 ?auto_10688 ) ) ( not ( = ?auto_10686 ?auto_10689 ) ) ( not ( = ?auto_10686 ?auto_10691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10687 ?auto_10688 ?auto_10689 )
      ( MAKE-4CRATE-VERIFY ?auto_10685 ?auto_10686 ?auto_10687 ?auto_10688 ?auto_10689 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10696 - SURFACE
      ?auto_10697 - SURFACE
    )
    :vars
    (
      ?auto_10702 - HOIST
      ?auto_10701 - PLACE
      ?auto_10698 - SURFACE
      ?auto_10704 - PLACE
      ?auto_10699 - HOIST
      ?auto_10700 - SURFACE
      ?auto_10703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10702 ?auto_10701 ) ( IS-CRATE ?auto_10697 ) ( not ( = ?auto_10696 ?auto_10697 ) ) ( not ( = ?auto_10698 ?auto_10696 ) ) ( not ( = ?auto_10698 ?auto_10697 ) ) ( not ( = ?auto_10704 ?auto_10701 ) ) ( HOIST-AT ?auto_10699 ?auto_10704 ) ( not ( = ?auto_10702 ?auto_10699 ) ) ( AVAILABLE ?auto_10699 ) ( SURFACE-AT ?auto_10697 ?auto_10704 ) ( ON ?auto_10697 ?auto_10700 ) ( CLEAR ?auto_10697 ) ( not ( = ?auto_10696 ?auto_10700 ) ) ( not ( = ?auto_10697 ?auto_10700 ) ) ( not ( = ?auto_10698 ?auto_10700 ) ) ( TRUCK-AT ?auto_10703 ?auto_10701 ) ( SURFACE-AT ?auto_10698 ?auto_10701 ) ( CLEAR ?auto_10698 ) ( IS-CRATE ?auto_10696 ) ( AVAILABLE ?auto_10702 ) ( IN ?auto_10696 ?auto_10703 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10702 ?auto_10696 ?auto_10703 ?auto_10701 )
      ( MAKE-2CRATE ?auto_10698 ?auto_10696 ?auto_10697 )
      ( MAKE-1CRATE-VERIFY ?auto_10696 ?auto_10697 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10705 - SURFACE
      ?auto_10706 - SURFACE
      ?auto_10707 - SURFACE
    )
    :vars
    (
      ?auto_10709 - HOIST
      ?auto_10711 - PLACE
      ?auto_10712 - PLACE
      ?auto_10708 - HOIST
      ?auto_10710 - SURFACE
      ?auto_10713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10709 ?auto_10711 ) ( IS-CRATE ?auto_10707 ) ( not ( = ?auto_10706 ?auto_10707 ) ) ( not ( = ?auto_10705 ?auto_10706 ) ) ( not ( = ?auto_10705 ?auto_10707 ) ) ( not ( = ?auto_10712 ?auto_10711 ) ) ( HOIST-AT ?auto_10708 ?auto_10712 ) ( not ( = ?auto_10709 ?auto_10708 ) ) ( AVAILABLE ?auto_10708 ) ( SURFACE-AT ?auto_10707 ?auto_10712 ) ( ON ?auto_10707 ?auto_10710 ) ( CLEAR ?auto_10707 ) ( not ( = ?auto_10706 ?auto_10710 ) ) ( not ( = ?auto_10707 ?auto_10710 ) ) ( not ( = ?auto_10705 ?auto_10710 ) ) ( TRUCK-AT ?auto_10713 ?auto_10711 ) ( SURFACE-AT ?auto_10705 ?auto_10711 ) ( CLEAR ?auto_10705 ) ( IS-CRATE ?auto_10706 ) ( AVAILABLE ?auto_10709 ) ( IN ?auto_10706 ?auto_10713 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10706 ?auto_10707 )
      ( MAKE-2CRATE-VERIFY ?auto_10705 ?auto_10706 ?auto_10707 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10714 - SURFACE
      ?auto_10715 - SURFACE
      ?auto_10716 - SURFACE
      ?auto_10717 - SURFACE
    )
    :vars
    (
      ?auto_10722 - HOIST
      ?auto_10723 - PLACE
      ?auto_10721 - PLACE
      ?auto_10719 - HOIST
      ?auto_10718 - SURFACE
      ?auto_10720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10722 ?auto_10723 ) ( IS-CRATE ?auto_10717 ) ( not ( = ?auto_10716 ?auto_10717 ) ) ( not ( = ?auto_10715 ?auto_10716 ) ) ( not ( = ?auto_10715 ?auto_10717 ) ) ( not ( = ?auto_10721 ?auto_10723 ) ) ( HOIST-AT ?auto_10719 ?auto_10721 ) ( not ( = ?auto_10722 ?auto_10719 ) ) ( AVAILABLE ?auto_10719 ) ( SURFACE-AT ?auto_10717 ?auto_10721 ) ( ON ?auto_10717 ?auto_10718 ) ( CLEAR ?auto_10717 ) ( not ( = ?auto_10716 ?auto_10718 ) ) ( not ( = ?auto_10717 ?auto_10718 ) ) ( not ( = ?auto_10715 ?auto_10718 ) ) ( TRUCK-AT ?auto_10720 ?auto_10723 ) ( SURFACE-AT ?auto_10715 ?auto_10723 ) ( CLEAR ?auto_10715 ) ( IS-CRATE ?auto_10716 ) ( AVAILABLE ?auto_10722 ) ( IN ?auto_10716 ?auto_10720 ) ( ON ?auto_10715 ?auto_10714 ) ( not ( = ?auto_10714 ?auto_10715 ) ) ( not ( = ?auto_10714 ?auto_10716 ) ) ( not ( = ?auto_10714 ?auto_10717 ) ) ( not ( = ?auto_10714 ?auto_10718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10715 ?auto_10716 ?auto_10717 )
      ( MAKE-3CRATE-VERIFY ?auto_10714 ?auto_10715 ?auto_10716 ?auto_10717 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10724 - SURFACE
      ?auto_10725 - SURFACE
      ?auto_10726 - SURFACE
      ?auto_10727 - SURFACE
      ?auto_10728 - SURFACE
    )
    :vars
    (
      ?auto_10733 - HOIST
      ?auto_10734 - PLACE
      ?auto_10732 - PLACE
      ?auto_10730 - HOIST
      ?auto_10729 - SURFACE
      ?auto_10731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10733 ?auto_10734 ) ( IS-CRATE ?auto_10728 ) ( not ( = ?auto_10727 ?auto_10728 ) ) ( not ( = ?auto_10726 ?auto_10727 ) ) ( not ( = ?auto_10726 ?auto_10728 ) ) ( not ( = ?auto_10732 ?auto_10734 ) ) ( HOIST-AT ?auto_10730 ?auto_10732 ) ( not ( = ?auto_10733 ?auto_10730 ) ) ( AVAILABLE ?auto_10730 ) ( SURFACE-AT ?auto_10728 ?auto_10732 ) ( ON ?auto_10728 ?auto_10729 ) ( CLEAR ?auto_10728 ) ( not ( = ?auto_10727 ?auto_10729 ) ) ( not ( = ?auto_10728 ?auto_10729 ) ) ( not ( = ?auto_10726 ?auto_10729 ) ) ( TRUCK-AT ?auto_10731 ?auto_10734 ) ( SURFACE-AT ?auto_10726 ?auto_10734 ) ( CLEAR ?auto_10726 ) ( IS-CRATE ?auto_10727 ) ( AVAILABLE ?auto_10733 ) ( IN ?auto_10727 ?auto_10731 ) ( ON ?auto_10725 ?auto_10724 ) ( ON ?auto_10726 ?auto_10725 ) ( not ( = ?auto_10724 ?auto_10725 ) ) ( not ( = ?auto_10724 ?auto_10726 ) ) ( not ( = ?auto_10724 ?auto_10727 ) ) ( not ( = ?auto_10724 ?auto_10728 ) ) ( not ( = ?auto_10724 ?auto_10729 ) ) ( not ( = ?auto_10725 ?auto_10726 ) ) ( not ( = ?auto_10725 ?auto_10727 ) ) ( not ( = ?auto_10725 ?auto_10728 ) ) ( not ( = ?auto_10725 ?auto_10729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10726 ?auto_10727 ?auto_10728 )
      ( MAKE-4CRATE-VERIFY ?auto_10724 ?auto_10725 ?auto_10726 ?auto_10727 ?auto_10728 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10735 - SURFACE
      ?auto_10736 - SURFACE
    )
    :vars
    (
      ?auto_10742 - HOIST
      ?auto_10743 - PLACE
      ?auto_10738 - SURFACE
      ?auto_10741 - PLACE
      ?auto_10739 - HOIST
      ?auto_10737 - SURFACE
      ?auto_10740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10742 ?auto_10743 ) ( IS-CRATE ?auto_10736 ) ( not ( = ?auto_10735 ?auto_10736 ) ) ( not ( = ?auto_10738 ?auto_10735 ) ) ( not ( = ?auto_10738 ?auto_10736 ) ) ( not ( = ?auto_10741 ?auto_10743 ) ) ( HOIST-AT ?auto_10739 ?auto_10741 ) ( not ( = ?auto_10742 ?auto_10739 ) ) ( AVAILABLE ?auto_10739 ) ( SURFACE-AT ?auto_10736 ?auto_10741 ) ( ON ?auto_10736 ?auto_10737 ) ( CLEAR ?auto_10736 ) ( not ( = ?auto_10735 ?auto_10737 ) ) ( not ( = ?auto_10736 ?auto_10737 ) ) ( not ( = ?auto_10738 ?auto_10737 ) ) ( SURFACE-AT ?auto_10738 ?auto_10743 ) ( CLEAR ?auto_10738 ) ( IS-CRATE ?auto_10735 ) ( AVAILABLE ?auto_10742 ) ( IN ?auto_10735 ?auto_10740 ) ( TRUCK-AT ?auto_10740 ?auto_10741 ) )
    :subtasks
    ( ( !DRIVE ?auto_10740 ?auto_10741 ?auto_10743 )
      ( MAKE-2CRATE ?auto_10738 ?auto_10735 ?auto_10736 )
      ( MAKE-1CRATE-VERIFY ?auto_10735 ?auto_10736 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10744 - SURFACE
      ?auto_10745 - SURFACE
      ?auto_10746 - SURFACE
    )
    :vars
    (
      ?auto_10751 - HOIST
      ?auto_10748 - PLACE
      ?auto_10752 - PLACE
      ?auto_10750 - HOIST
      ?auto_10747 - SURFACE
      ?auto_10749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10751 ?auto_10748 ) ( IS-CRATE ?auto_10746 ) ( not ( = ?auto_10745 ?auto_10746 ) ) ( not ( = ?auto_10744 ?auto_10745 ) ) ( not ( = ?auto_10744 ?auto_10746 ) ) ( not ( = ?auto_10752 ?auto_10748 ) ) ( HOIST-AT ?auto_10750 ?auto_10752 ) ( not ( = ?auto_10751 ?auto_10750 ) ) ( AVAILABLE ?auto_10750 ) ( SURFACE-AT ?auto_10746 ?auto_10752 ) ( ON ?auto_10746 ?auto_10747 ) ( CLEAR ?auto_10746 ) ( not ( = ?auto_10745 ?auto_10747 ) ) ( not ( = ?auto_10746 ?auto_10747 ) ) ( not ( = ?auto_10744 ?auto_10747 ) ) ( SURFACE-AT ?auto_10744 ?auto_10748 ) ( CLEAR ?auto_10744 ) ( IS-CRATE ?auto_10745 ) ( AVAILABLE ?auto_10751 ) ( IN ?auto_10745 ?auto_10749 ) ( TRUCK-AT ?auto_10749 ?auto_10752 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10745 ?auto_10746 )
      ( MAKE-2CRATE-VERIFY ?auto_10744 ?auto_10745 ?auto_10746 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10753 - SURFACE
      ?auto_10754 - SURFACE
      ?auto_10755 - SURFACE
      ?auto_10756 - SURFACE
    )
    :vars
    (
      ?auto_10760 - HOIST
      ?auto_10759 - PLACE
      ?auto_10758 - PLACE
      ?auto_10761 - HOIST
      ?auto_10762 - SURFACE
      ?auto_10757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10760 ?auto_10759 ) ( IS-CRATE ?auto_10756 ) ( not ( = ?auto_10755 ?auto_10756 ) ) ( not ( = ?auto_10754 ?auto_10755 ) ) ( not ( = ?auto_10754 ?auto_10756 ) ) ( not ( = ?auto_10758 ?auto_10759 ) ) ( HOIST-AT ?auto_10761 ?auto_10758 ) ( not ( = ?auto_10760 ?auto_10761 ) ) ( AVAILABLE ?auto_10761 ) ( SURFACE-AT ?auto_10756 ?auto_10758 ) ( ON ?auto_10756 ?auto_10762 ) ( CLEAR ?auto_10756 ) ( not ( = ?auto_10755 ?auto_10762 ) ) ( not ( = ?auto_10756 ?auto_10762 ) ) ( not ( = ?auto_10754 ?auto_10762 ) ) ( SURFACE-AT ?auto_10754 ?auto_10759 ) ( CLEAR ?auto_10754 ) ( IS-CRATE ?auto_10755 ) ( AVAILABLE ?auto_10760 ) ( IN ?auto_10755 ?auto_10757 ) ( TRUCK-AT ?auto_10757 ?auto_10758 ) ( ON ?auto_10754 ?auto_10753 ) ( not ( = ?auto_10753 ?auto_10754 ) ) ( not ( = ?auto_10753 ?auto_10755 ) ) ( not ( = ?auto_10753 ?auto_10756 ) ) ( not ( = ?auto_10753 ?auto_10762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10754 ?auto_10755 ?auto_10756 )
      ( MAKE-3CRATE-VERIFY ?auto_10753 ?auto_10754 ?auto_10755 ?auto_10756 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10763 - SURFACE
      ?auto_10764 - SURFACE
      ?auto_10765 - SURFACE
      ?auto_10766 - SURFACE
      ?auto_10767 - SURFACE
    )
    :vars
    (
      ?auto_10771 - HOIST
      ?auto_10770 - PLACE
      ?auto_10769 - PLACE
      ?auto_10772 - HOIST
      ?auto_10773 - SURFACE
      ?auto_10768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10771 ?auto_10770 ) ( IS-CRATE ?auto_10767 ) ( not ( = ?auto_10766 ?auto_10767 ) ) ( not ( = ?auto_10765 ?auto_10766 ) ) ( not ( = ?auto_10765 ?auto_10767 ) ) ( not ( = ?auto_10769 ?auto_10770 ) ) ( HOIST-AT ?auto_10772 ?auto_10769 ) ( not ( = ?auto_10771 ?auto_10772 ) ) ( AVAILABLE ?auto_10772 ) ( SURFACE-AT ?auto_10767 ?auto_10769 ) ( ON ?auto_10767 ?auto_10773 ) ( CLEAR ?auto_10767 ) ( not ( = ?auto_10766 ?auto_10773 ) ) ( not ( = ?auto_10767 ?auto_10773 ) ) ( not ( = ?auto_10765 ?auto_10773 ) ) ( SURFACE-AT ?auto_10765 ?auto_10770 ) ( CLEAR ?auto_10765 ) ( IS-CRATE ?auto_10766 ) ( AVAILABLE ?auto_10771 ) ( IN ?auto_10766 ?auto_10768 ) ( TRUCK-AT ?auto_10768 ?auto_10769 ) ( ON ?auto_10764 ?auto_10763 ) ( ON ?auto_10765 ?auto_10764 ) ( not ( = ?auto_10763 ?auto_10764 ) ) ( not ( = ?auto_10763 ?auto_10765 ) ) ( not ( = ?auto_10763 ?auto_10766 ) ) ( not ( = ?auto_10763 ?auto_10767 ) ) ( not ( = ?auto_10763 ?auto_10773 ) ) ( not ( = ?auto_10764 ?auto_10765 ) ) ( not ( = ?auto_10764 ?auto_10766 ) ) ( not ( = ?auto_10764 ?auto_10767 ) ) ( not ( = ?auto_10764 ?auto_10773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10765 ?auto_10766 ?auto_10767 )
      ( MAKE-4CRATE-VERIFY ?auto_10763 ?auto_10764 ?auto_10765 ?auto_10766 ?auto_10767 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10774 - SURFACE
      ?auto_10775 - SURFACE
    )
    :vars
    (
      ?auto_10779 - HOIST
      ?auto_10778 - PLACE
      ?auto_10780 - SURFACE
      ?auto_10777 - PLACE
      ?auto_10781 - HOIST
      ?auto_10782 - SURFACE
      ?auto_10776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10779 ?auto_10778 ) ( IS-CRATE ?auto_10775 ) ( not ( = ?auto_10774 ?auto_10775 ) ) ( not ( = ?auto_10780 ?auto_10774 ) ) ( not ( = ?auto_10780 ?auto_10775 ) ) ( not ( = ?auto_10777 ?auto_10778 ) ) ( HOIST-AT ?auto_10781 ?auto_10777 ) ( not ( = ?auto_10779 ?auto_10781 ) ) ( SURFACE-AT ?auto_10775 ?auto_10777 ) ( ON ?auto_10775 ?auto_10782 ) ( CLEAR ?auto_10775 ) ( not ( = ?auto_10774 ?auto_10782 ) ) ( not ( = ?auto_10775 ?auto_10782 ) ) ( not ( = ?auto_10780 ?auto_10782 ) ) ( SURFACE-AT ?auto_10780 ?auto_10778 ) ( CLEAR ?auto_10780 ) ( IS-CRATE ?auto_10774 ) ( AVAILABLE ?auto_10779 ) ( TRUCK-AT ?auto_10776 ?auto_10777 ) ( LIFTING ?auto_10781 ?auto_10774 ) )
    :subtasks
    ( ( !LOAD ?auto_10781 ?auto_10774 ?auto_10776 ?auto_10777 )
      ( MAKE-2CRATE ?auto_10780 ?auto_10774 ?auto_10775 )
      ( MAKE-1CRATE-VERIFY ?auto_10774 ?auto_10775 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10783 - SURFACE
      ?auto_10784 - SURFACE
      ?auto_10785 - SURFACE
    )
    :vars
    (
      ?auto_10791 - HOIST
      ?auto_10788 - PLACE
      ?auto_10787 - PLACE
      ?auto_10789 - HOIST
      ?auto_10786 - SURFACE
      ?auto_10790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10791 ?auto_10788 ) ( IS-CRATE ?auto_10785 ) ( not ( = ?auto_10784 ?auto_10785 ) ) ( not ( = ?auto_10783 ?auto_10784 ) ) ( not ( = ?auto_10783 ?auto_10785 ) ) ( not ( = ?auto_10787 ?auto_10788 ) ) ( HOIST-AT ?auto_10789 ?auto_10787 ) ( not ( = ?auto_10791 ?auto_10789 ) ) ( SURFACE-AT ?auto_10785 ?auto_10787 ) ( ON ?auto_10785 ?auto_10786 ) ( CLEAR ?auto_10785 ) ( not ( = ?auto_10784 ?auto_10786 ) ) ( not ( = ?auto_10785 ?auto_10786 ) ) ( not ( = ?auto_10783 ?auto_10786 ) ) ( SURFACE-AT ?auto_10783 ?auto_10788 ) ( CLEAR ?auto_10783 ) ( IS-CRATE ?auto_10784 ) ( AVAILABLE ?auto_10791 ) ( TRUCK-AT ?auto_10790 ?auto_10787 ) ( LIFTING ?auto_10789 ?auto_10784 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10784 ?auto_10785 )
      ( MAKE-2CRATE-VERIFY ?auto_10783 ?auto_10784 ?auto_10785 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10792 - SURFACE
      ?auto_10793 - SURFACE
      ?auto_10794 - SURFACE
      ?auto_10795 - SURFACE
    )
    :vars
    (
      ?auto_10797 - HOIST
      ?auto_10796 - PLACE
      ?auto_10801 - PLACE
      ?auto_10800 - HOIST
      ?auto_10799 - SURFACE
      ?auto_10798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10797 ?auto_10796 ) ( IS-CRATE ?auto_10795 ) ( not ( = ?auto_10794 ?auto_10795 ) ) ( not ( = ?auto_10793 ?auto_10794 ) ) ( not ( = ?auto_10793 ?auto_10795 ) ) ( not ( = ?auto_10801 ?auto_10796 ) ) ( HOIST-AT ?auto_10800 ?auto_10801 ) ( not ( = ?auto_10797 ?auto_10800 ) ) ( SURFACE-AT ?auto_10795 ?auto_10801 ) ( ON ?auto_10795 ?auto_10799 ) ( CLEAR ?auto_10795 ) ( not ( = ?auto_10794 ?auto_10799 ) ) ( not ( = ?auto_10795 ?auto_10799 ) ) ( not ( = ?auto_10793 ?auto_10799 ) ) ( SURFACE-AT ?auto_10793 ?auto_10796 ) ( CLEAR ?auto_10793 ) ( IS-CRATE ?auto_10794 ) ( AVAILABLE ?auto_10797 ) ( TRUCK-AT ?auto_10798 ?auto_10801 ) ( LIFTING ?auto_10800 ?auto_10794 ) ( ON ?auto_10793 ?auto_10792 ) ( not ( = ?auto_10792 ?auto_10793 ) ) ( not ( = ?auto_10792 ?auto_10794 ) ) ( not ( = ?auto_10792 ?auto_10795 ) ) ( not ( = ?auto_10792 ?auto_10799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10793 ?auto_10794 ?auto_10795 )
      ( MAKE-3CRATE-VERIFY ?auto_10792 ?auto_10793 ?auto_10794 ?auto_10795 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10802 - SURFACE
      ?auto_10803 - SURFACE
      ?auto_10804 - SURFACE
      ?auto_10805 - SURFACE
      ?auto_10806 - SURFACE
    )
    :vars
    (
      ?auto_10808 - HOIST
      ?auto_10807 - PLACE
      ?auto_10812 - PLACE
      ?auto_10811 - HOIST
      ?auto_10810 - SURFACE
      ?auto_10809 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10808 ?auto_10807 ) ( IS-CRATE ?auto_10806 ) ( not ( = ?auto_10805 ?auto_10806 ) ) ( not ( = ?auto_10804 ?auto_10805 ) ) ( not ( = ?auto_10804 ?auto_10806 ) ) ( not ( = ?auto_10812 ?auto_10807 ) ) ( HOIST-AT ?auto_10811 ?auto_10812 ) ( not ( = ?auto_10808 ?auto_10811 ) ) ( SURFACE-AT ?auto_10806 ?auto_10812 ) ( ON ?auto_10806 ?auto_10810 ) ( CLEAR ?auto_10806 ) ( not ( = ?auto_10805 ?auto_10810 ) ) ( not ( = ?auto_10806 ?auto_10810 ) ) ( not ( = ?auto_10804 ?auto_10810 ) ) ( SURFACE-AT ?auto_10804 ?auto_10807 ) ( CLEAR ?auto_10804 ) ( IS-CRATE ?auto_10805 ) ( AVAILABLE ?auto_10808 ) ( TRUCK-AT ?auto_10809 ?auto_10812 ) ( LIFTING ?auto_10811 ?auto_10805 ) ( ON ?auto_10803 ?auto_10802 ) ( ON ?auto_10804 ?auto_10803 ) ( not ( = ?auto_10802 ?auto_10803 ) ) ( not ( = ?auto_10802 ?auto_10804 ) ) ( not ( = ?auto_10802 ?auto_10805 ) ) ( not ( = ?auto_10802 ?auto_10806 ) ) ( not ( = ?auto_10802 ?auto_10810 ) ) ( not ( = ?auto_10803 ?auto_10804 ) ) ( not ( = ?auto_10803 ?auto_10805 ) ) ( not ( = ?auto_10803 ?auto_10806 ) ) ( not ( = ?auto_10803 ?auto_10810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10804 ?auto_10805 ?auto_10806 )
      ( MAKE-4CRATE-VERIFY ?auto_10802 ?auto_10803 ?auto_10804 ?auto_10805 ?auto_10806 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10813 - SURFACE
      ?auto_10814 - SURFACE
    )
    :vars
    (
      ?auto_10817 - HOIST
      ?auto_10816 - PLACE
      ?auto_10815 - SURFACE
      ?auto_10821 - PLACE
      ?auto_10820 - HOIST
      ?auto_10819 - SURFACE
      ?auto_10818 - TRUCK
      ?auto_10822 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10817 ?auto_10816 ) ( IS-CRATE ?auto_10814 ) ( not ( = ?auto_10813 ?auto_10814 ) ) ( not ( = ?auto_10815 ?auto_10813 ) ) ( not ( = ?auto_10815 ?auto_10814 ) ) ( not ( = ?auto_10821 ?auto_10816 ) ) ( HOIST-AT ?auto_10820 ?auto_10821 ) ( not ( = ?auto_10817 ?auto_10820 ) ) ( SURFACE-AT ?auto_10814 ?auto_10821 ) ( ON ?auto_10814 ?auto_10819 ) ( CLEAR ?auto_10814 ) ( not ( = ?auto_10813 ?auto_10819 ) ) ( not ( = ?auto_10814 ?auto_10819 ) ) ( not ( = ?auto_10815 ?auto_10819 ) ) ( SURFACE-AT ?auto_10815 ?auto_10816 ) ( CLEAR ?auto_10815 ) ( IS-CRATE ?auto_10813 ) ( AVAILABLE ?auto_10817 ) ( TRUCK-AT ?auto_10818 ?auto_10821 ) ( AVAILABLE ?auto_10820 ) ( SURFACE-AT ?auto_10813 ?auto_10821 ) ( ON ?auto_10813 ?auto_10822 ) ( CLEAR ?auto_10813 ) ( not ( = ?auto_10813 ?auto_10822 ) ) ( not ( = ?auto_10814 ?auto_10822 ) ) ( not ( = ?auto_10815 ?auto_10822 ) ) ( not ( = ?auto_10819 ?auto_10822 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10820 ?auto_10813 ?auto_10822 ?auto_10821 )
      ( MAKE-2CRATE ?auto_10815 ?auto_10813 ?auto_10814 )
      ( MAKE-1CRATE-VERIFY ?auto_10813 ?auto_10814 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10823 - SURFACE
      ?auto_10824 - SURFACE
      ?auto_10825 - SURFACE
    )
    :vars
    (
      ?auto_10832 - HOIST
      ?auto_10827 - PLACE
      ?auto_10828 - PLACE
      ?auto_10829 - HOIST
      ?auto_10831 - SURFACE
      ?auto_10830 - TRUCK
      ?auto_10826 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10832 ?auto_10827 ) ( IS-CRATE ?auto_10825 ) ( not ( = ?auto_10824 ?auto_10825 ) ) ( not ( = ?auto_10823 ?auto_10824 ) ) ( not ( = ?auto_10823 ?auto_10825 ) ) ( not ( = ?auto_10828 ?auto_10827 ) ) ( HOIST-AT ?auto_10829 ?auto_10828 ) ( not ( = ?auto_10832 ?auto_10829 ) ) ( SURFACE-AT ?auto_10825 ?auto_10828 ) ( ON ?auto_10825 ?auto_10831 ) ( CLEAR ?auto_10825 ) ( not ( = ?auto_10824 ?auto_10831 ) ) ( not ( = ?auto_10825 ?auto_10831 ) ) ( not ( = ?auto_10823 ?auto_10831 ) ) ( SURFACE-AT ?auto_10823 ?auto_10827 ) ( CLEAR ?auto_10823 ) ( IS-CRATE ?auto_10824 ) ( AVAILABLE ?auto_10832 ) ( TRUCK-AT ?auto_10830 ?auto_10828 ) ( AVAILABLE ?auto_10829 ) ( SURFACE-AT ?auto_10824 ?auto_10828 ) ( ON ?auto_10824 ?auto_10826 ) ( CLEAR ?auto_10824 ) ( not ( = ?auto_10824 ?auto_10826 ) ) ( not ( = ?auto_10825 ?auto_10826 ) ) ( not ( = ?auto_10823 ?auto_10826 ) ) ( not ( = ?auto_10831 ?auto_10826 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10824 ?auto_10825 )
      ( MAKE-2CRATE-VERIFY ?auto_10823 ?auto_10824 ?auto_10825 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10833 - SURFACE
      ?auto_10834 - SURFACE
      ?auto_10835 - SURFACE
      ?auto_10836 - SURFACE
    )
    :vars
    (
      ?auto_10842 - HOIST
      ?auto_10843 - PLACE
      ?auto_10840 - PLACE
      ?auto_10841 - HOIST
      ?auto_10837 - SURFACE
      ?auto_10839 - TRUCK
      ?auto_10838 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10842 ?auto_10843 ) ( IS-CRATE ?auto_10836 ) ( not ( = ?auto_10835 ?auto_10836 ) ) ( not ( = ?auto_10834 ?auto_10835 ) ) ( not ( = ?auto_10834 ?auto_10836 ) ) ( not ( = ?auto_10840 ?auto_10843 ) ) ( HOIST-AT ?auto_10841 ?auto_10840 ) ( not ( = ?auto_10842 ?auto_10841 ) ) ( SURFACE-AT ?auto_10836 ?auto_10840 ) ( ON ?auto_10836 ?auto_10837 ) ( CLEAR ?auto_10836 ) ( not ( = ?auto_10835 ?auto_10837 ) ) ( not ( = ?auto_10836 ?auto_10837 ) ) ( not ( = ?auto_10834 ?auto_10837 ) ) ( SURFACE-AT ?auto_10834 ?auto_10843 ) ( CLEAR ?auto_10834 ) ( IS-CRATE ?auto_10835 ) ( AVAILABLE ?auto_10842 ) ( TRUCK-AT ?auto_10839 ?auto_10840 ) ( AVAILABLE ?auto_10841 ) ( SURFACE-AT ?auto_10835 ?auto_10840 ) ( ON ?auto_10835 ?auto_10838 ) ( CLEAR ?auto_10835 ) ( not ( = ?auto_10835 ?auto_10838 ) ) ( not ( = ?auto_10836 ?auto_10838 ) ) ( not ( = ?auto_10834 ?auto_10838 ) ) ( not ( = ?auto_10837 ?auto_10838 ) ) ( ON ?auto_10834 ?auto_10833 ) ( not ( = ?auto_10833 ?auto_10834 ) ) ( not ( = ?auto_10833 ?auto_10835 ) ) ( not ( = ?auto_10833 ?auto_10836 ) ) ( not ( = ?auto_10833 ?auto_10837 ) ) ( not ( = ?auto_10833 ?auto_10838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10834 ?auto_10835 ?auto_10836 )
      ( MAKE-3CRATE-VERIFY ?auto_10833 ?auto_10834 ?auto_10835 ?auto_10836 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10844 - SURFACE
      ?auto_10845 - SURFACE
      ?auto_10846 - SURFACE
      ?auto_10847 - SURFACE
      ?auto_10848 - SURFACE
    )
    :vars
    (
      ?auto_10854 - HOIST
      ?auto_10855 - PLACE
      ?auto_10852 - PLACE
      ?auto_10853 - HOIST
      ?auto_10849 - SURFACE
      ?auto_10851 - TRUCK
      ?auto_10850 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10854 ?auto_10855 ) ( IS-CRATE ?auto_10848 ) ( not ( = ?auto_10847 ?auto_10848 ) ) ( not ( = ?auto_10846 ?auto_10847 ) ) ( not ( = ?auto_10846 ?auto_10848 ) ) ( not ( = ?auto_10852 ?auto_10855 ) ) ( HOIST-AT ?auto_10853 ?auto_10852 ) ( not ( = ?auto_10854 ?auto_10853 ) ) ( SURFACE-AT ?auto_10848 ?auto_10852 ) ( ON ?auto_10848 ?auto_10849 ) ( CLEAR ?auto_10848 ) ( not ( = ?auto_10847 ?auto_10849 ) ) ( not ( = ?auto_10848 ?auto_10849 ) ) ( not ( = ?auto_10846 ?auto_10849 ) ) ( SURFACE-AT ?auto_10846 ?auto_10855 ) ( CLEAR ?auto_10846 ) ( IS-CRATE ?auto_10847 ) ( AVAILABLE ?auto_10854 ) ( TRUCK-AT ?auto_10851 ?auto_10852 ) ( AVAILABLE ?auto_10853 ) ( SURFACE-AT ?auto_10847 ?auto_10852 ) ( ON ?auto_10847 ?auto_10850 ) ( CLEAR ?auto_10847 ) ( not ( = ?auto_10847 ?auto_10850 ) ) ( not ( = ?auto_10848 ?auto_10850 ) ) ( not ( = ?auto_10846 ?auto_10850 ) ) ( not ( = ?auto_10849 ?auto_10850 ) ) ( ON ?auto_10845 ?auto_10844 ) ( ON ?auto_10846 ?auto_10845 ) ( not ( = ?auto_10844 ?auto_10845 ) ) ( not ( = ?auto_10844 ?auto_10846 ) ) ( not ( = ?auto_10844 ?auto_10847 ) ) ( not ( = ?auto_10844 ?auto_10848 ) ) ( not ( = ?auto_10844 ?auto_10849 ) ) ( not ( = ?auto_10844 ?auto_10850 ) ) ( not ( = ?auto_10845 ?auto_10846 ) ) ( not ( = ?auto_10845 ?auto_10847 ) ) ( not ( = ?auto_10845 ?auto_10848 ) ) ( not ( = ?auto_10845 ?auto_10849 ) ) ( not ( = ?auto_10845 ?auto_10850 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10846 ?auto_10847 ?auto_10848 )
      ( MAKE-4CRATE-VERIFY ?auto_10844 ?auto_10845 ?auto_10846 ?auto_10847 ?auto_10848 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10856 - SURFACE
      ?auto_10857 - SURFACE
    )
    :vars
    (
      ?auto_10864 - HOIST
      ?auto_10865 - PLACE
      ?auto_10862 - SURFACE
      ?auto_10861 - PLACE
      ?auto_10863 - HOIST
      ?auto_10858 - SURFACE
      ?auto_10859 - SURFACE
      ?auto_10860 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10864 ?auto_10865 ) ( IS-CRATE ?auto_10857 ) ( not ( = ?auto_10856 ?auto_10857 ) ) ( not ( = ?auto_10862 ?auto_10856 ) ) ( not ( = ?auto_10862 ?auto_10857 ) ) ( not ( = ?auto_10861 ?auto_10865 ) ) ( HOIST-AT ?auto_10863 ?auto_10861 ) ( not ( = ?auto_10864 ?auto_10863 ) ) ( SURFACE-AT ?auto_10857 ?auto_10861 ) ( ON ?auto_10857 ?auto_10858 ) ( CLEAR ?auto_10857 ) ( not ( = ?auto_10856 ?auto_10858 ) ) ( not ( = ?auto_10857 ?auto_10858 ) ) ( not ( = ?auto_10862 ?auto_10858 ) ) ( SURFACE-AT ?auto_10862 ?auto_10865 ) ( CLEAR ?auto_10862 ) ( IS-CRATE ?auto_10856 ) ( AVAILABLE ?auto_10864 ) ( AVAILABLE ?auto_10863 ) ( SURFACE-AT ?auto_10856 ?auto_10861 ) ( ON ?auto_10856 ?auto_10859 ) ( CLEAR ?auto_10856 ) ( not ( = ?auto_10856 ?auto_10859 ) ) ( not ( = ?auto_10857 ?auto_10859 ) ) ( not ( = ?auto_10862 ?auto_10859 ) ) ( not ( = ?auto_10858 ?auto_10859 ) ) ( TRUCK-AT ?auto_10860 ?auto_10865 ) )
    :subtasks
    ( ( !DRIVE ?auto_10860 ?auto_10865 ?auto_10861 )
      ( MAKE-2CRATE ?auto_10862 ?auto_10856 ?auto_10857 )
      ( MAKE-1CRATE-VERIFY ?auto_10856 ?auto_10857 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10866 - SURFACE
      ?auto_10867 - SURFACE
      ?auto_10868 - SURFACE
    )
    :vars
    (
      ?auto_10874 - HOIST
      ?auto_10871 - PLACE
      ?auto_10873 - PLACE
      ?auto_10870 - HOIST
      ?auto_10869 - SURFACE
      ?auto_10875 - SURFACE
      ?auto_10872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10874 ?auto_10871 ) ( IS-CRATE ?auto_10868 ) ( not ( = ?auto_10867 ?auto_10868 ) ) ( not ( = ?auto_10866 ?auto_10867 ) ) ( not ( = ?auto_10866 ?auto_10868 ) ) ( not ( = ?auto_10873 ?auto_10871 ) ) ( HOIST-AT ?auto_10870 ?auto_10873 ) ( not ( = ?auto_10874 ?auto_10870 ) ) ( SURFACE-AT ?auto_10868 ?auto_10873 ) ( ON ?auto_10868 ?auto_10869 ) ( CLEAR ?auto_10868 ) ( not ( = ?auto_10867 ?auto_10869 ) ) ( not ( = ?auto_10868 ?auto_10869 ) ) ( not ( = ?auto_10866 ?auto_10869 ) ) ( SURFACE-AT ?auto_10866 ?auto_10871 ) ( CLEAR ?auto_10866 ) ( IS-CRATE ?auto_10867 ) ( AVAILABLE ?auto_10874 ) ( AVAILABLE ?auto_10870 ) ( SURFACE-AT ?auto_10867 ?auto_10873 ) ( ON ?auto_10867 ?auto_10875 ) ( CLEAR ?auto_10867 ) ( not ( = ?auto_10867 ?auto_10875 ) ) ( not ( = ?auto_10868 ?auto_10875 ) ) ( not ( = ?auto_10866 ?auto_10875 ) ) ( not ( = ?auto_10869 ?auto_10875 ) ) ( TRUCK-AT ?auto_10872 ?auto_10871 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10867 ?auto_10868 )
      ( MAKE-2CRATE-VERIFY ?auto_10866 ?auto_10867 ?auto_10868 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10876 - SURFACE
      ?auto_10877 - SURFACE
      ?auto_10878 - SURFACE
      ?auto_10879 - SURFACE
    )
    :vars
    (
      ?auto_10883 - HOIST
      ?auto_10886 - PLACE
      ?auto_10884 - PLACE
      ?auto_10885 - HOIST
      ?auto_10881 - SURFACE
      ?auto_10880 - SURFACE
      ?auto_10882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10883 ?auto_10886 ) ( IS-CRATE ?auto_10879 ) ( not ( = ?auto_10878 ?auto_10879 ) ) ( not ( = ?auto_10877 ?auto_10878 ) ) ( not ( = ?auto_10877 ?auto_10879 ) ) ( not ( = ?auto_10884 ?auto_10886 ) ) ( HOIST-AT ?auto_10885 ?auto_10884 ) ( not ( = ?auto_10883 ?auto_10885 ) ) ( SURFACE-AT ?auto_10879 ?auto_10884 ) ( ON ?auto_10879 ?auto_10881 ) ( CLEAR ?auto_10879 ) ( not ( = ?auto_10878 ?auto_10881 ) ) ( not ( = ?auto_10879 ?auto_10881 ) ) ( not ( = ?auto_10877 ?auto_10881 ) ) ( SURFACE-AT ?auto_10877 ?auto_10886 ) ( CLEAR ?auto_10877 ) ( IS-CRATE ?auto_10878 ) ( AVAILABLE ?auto_10883 ) ( AVAILABLE ?auto_10885 ) ( SURFACE-AT ?auto_10878 ?auto_10884 ) ( ON ?auto_10878 ?auto_10880 ) ( CLEAR ?auto_10878 ) ( not ( = ?auto_10878 ?auto_10880 ) ) ( not ( = ?auto_10879 ?auto_10880 ) ) ( not ( = ?auto_10877 ?auto_10880 ) ) ( not ( = ?auto_10881 ?auto_10880 ) ) ( TRUCK-AT ?auto_10882 ?auto_10886 ) ( ON ?auto_10877 ?auto_10876 ) ( not ( = ?auto_10876 ?auto_10877 ) ) ( not ( = ?auto_10876 ?auto_10878 ) ) ( not ( = ?auto_10876 ?auto_10879 ) ) ( not ( = ?auto_10876 ?auto_10881 ) ) ( not ( = ?auto_10876 ?auto_10880 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10877 ?auto_10878 ?auto_10879 )
      ( MAKE-3CRATE-VERIFY ?auto_10876 ?auto_10877 ?auto_10878 ?auto_10879 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10887 - SURFACE
      ?auto_10888 - SURFACE
      ?auto_10889 - SURFACE
      ?auto_10890 - SURFACE
      ?auto_10891 - SURFACE
    )
    :vars
    (
      ?auto_10895 - HOIST
      ?auto_10898 - PLACE
      ?auto_10896 - PLACE
      ?auto_10897 - HOIST
      ?auto_10893 - SURFACE
      ?auto_10892 - SURFACE
      ?auto_10894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10895 ?auto_10898 ) ( IS-CRATE ?auto_10891 ) ( not ( = ?auto_10890 ?auto_10891 ) ) ( not ( = ?auto_10889 ?auto_10890 ) ) ( not ( = ?auto_10889 ?auto_10891 ) ) ( not ( = ?auto_10896 ?auto_10898 ) ) ( HOIST-AT ?auto_10897 ?auto_10896 ) ( not ( = ?auto_10895 ?auto_10897 ) ) ( SURFACE-AT ?auto_10891 ?auto_10896 ) ( ON ?auto_10891 ?auto_10893 ) ( CLEAR ?auto_10891 ) ( not ( = ?auto_10890 ?auto_10893 ) ) ( not ( = ?auto_10891 ?auto_10893 ) ) ( not ( = ?auto_10889 ?auto_10893 ) ) ( SURFACE-AT ?auto_10889 ?auto_10898 ) ( CLEAR ?auto_10889 ) ( IS-CRATE ?auto_10890 ) ( AVAILABLE ?auto_10895 ) ( AVAILABLE ?auto_10897 ) ( SURFACE-AT ?auto_10890 ?auto_10896 ) ( ON ?auto_10890 ?auto_10892 ) ( CLEAR ?auto_10890 ) ( not ( = ?auto_10890 ?auto_10892 ) ) ( not ( = ?auto_10891 ?auto_10892 ) ) ( not ( = ?auto_10889 ?auto_10892 ) ) ( not ( = ?auto_10893 ?auto_10892 ) ) ( TRUCK-AT ?auto_10894 ?auto_10898 ) ( ON ?auto_10888 ?auto_10887 ) ( ON ?auto_10889 ?auto_10888 ) ( not ( = ?auto_10887 ?auto_10888 ) ) ( not ( = ?auto_10887 ?auto_10889 ) ) ( not ( = ?auto_10887 ?auto_10890 ) ) ( not ( = ?auto_10887 ?auto_10891 ) ) ( not ( = ?auto_10887 ?auto_10893 ) ) ( not ( = ?auto_10887 ?auto_10892 ) ) ( not ( = ?auto_10888 ?auto_10889 ) ) ( not ( = ?auto_10888 ?auto_10890 ) ) ( not ( = ?auto_10888 ?auto_10891 ) ) ( not ( = ?auto_10888 ?auto_10893 ) ) ( not ( = ?auto_10888 ?auto_10892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10889 ?auto_10890 ?auto_10891 )
      ( MAKE-4CRATE-VERIFY ?auto_10887 ?auto_10888 ?auto_10889 ?auto_10890 ?auto_10891 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10899 - SURFACE
      ?auto_10900 - SURFACE
    )
    :vars
    (
      ?auto_10904 - HOIST
      ?auto_10908 - PLACE
      ?auto_10906 - SURFACE
      ?auto_10905 - PLACE
      ?auto_10907 - HOIST
      ?auto_10902 - SURFACE
      ?auto_10901 - SURFACE
      ?auto_10903 - TRUCK
      ?auto_10909 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10904 ?auto_10908 ) ( IS-CRATE ?auto_10900 ) ( not ( = ?auto_10899 ?auto_10900 ) ) ( not ( = ?auto_10906 ?auto_10899 ) ) ( not ( = ?auto_10906 ?auto_10900 ) ) ( not ( = ?auto_10905 ?auto_10908 ) ) ( HOIST-AT ?auto_10907 ?auto_10905 ) ( not ( = ?auto_10904 ?auto_10907 ) ) ( SURFACE-AT ?auto_10900 ?auto_10905 ) ( ON ?auto_10900 ?auto_10902 ) ( CLEAR ?auto_10900 ) ( not ( = ?auto_10899 ?auto_10902 ) ) ( not ( = ?auto_10900 ?auto_10902 ) ) ( not ( = ?auto_10906 ?auto_10902 ) ) ( IS-CRATE ?auto_10899 ) ( AVAILABLE ?auto_10907 ) ( SURFACE-AT ?auto_10899 ?auto_10905 ) ( ON ?auto_10899 ?auto_10901 ) ( CLEAR ?auto_10899 ) ( not ( = ?auto_10899 ?auto_10901 ) ) ( not ( = ?auto_10900 ?auto_10901 ) ) ( not ( = ?auto_10906 ?auto_10901 ) ) ( not ( = ?auto_10902 ?auto_10901 ) ) ( TRUCK-AT ?auto_10903 ?auto_10908 ) ( SURFACE-AT ?auto_10909 ?auto_10908 ) ( CLEAR ?auto_10909 ) ( LIFTING ?auto_10904 ?auto_10906 ) ( IS-CRATE ?auto_10906 ) ( not ( = ?auto_10909 ?auto_10906 ) ) ( not ( = ?auto_10899 ?auto_10909 ) ) ( not ( = ?auto_10900 ?auto_10909 ) ) ( not ( = ?auto_10902 ?auto_10909 ) ) ( not ( = ?auto_10901 ?auto_10909 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10909 ?auto_10906 )
      ( MAKE-2CRATE ?auto_10906 ?auto_10899 ?auto_10900 )
      ( MAKE-1CRATE-VERIFY ?auto_10899 ?auto_10900 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10910 - SURFACE
      ?auto_10911 - SURFACE
      ?auto_10912 - SURFACE
    )
    :vars
    (
      ?auto_10915 - HOIST
      ?auto_10913 - PLACE
      ?auto_10914 - PLACE
      ?auto_10920 - HOIST
      ?auto_10917 - SURFACE
      ?auto_10918 - SURFACE
      ?auto_10916 - TRUCK
      ?auto_10919 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10915 ?auto_10913 ) ( IS-CRATE ?auto_10912 ) ( not ( = ?auto_10911 ?auto_10912 ) ) ( not ( = ?auto_10910 ?auto_10911 ) ) ( not ( = ?auto_10910 ?auto_10912 ) ) ( not ( = ?auto_10914 ?auto_10913 ) ) ( HOIST-AT ?auto_10920 ?auto_10914 ) ( not ( = ?auto_10915 ?auto_10920 ) ) ( SURFACE-AT ?auto_10912 ?auto_10914 ) ( ON ?auto_10912 ?auto_10917 ) ( CLEAR ?auto_10912 ) ( not ( = ?auto_10911 ?auto_10917 ) ) ( not ( = ?auto_10912 ?auto_10917 ) ) ( not ( = ?auto_10910 ?auto_10917 ) ) ( IS-CRATE ?auto_10911 ) ( AVAILABLE ?auto_10920 ) ( SURFACE-AT ?auto_10911 ?auto_10914 ) ( ON ?auto_10911 ?auto_10918 ) ( CLEAR ?auto_10911 ) ( not ( = ?auto_10911 ?auto_10918 ) ) ( not ( = ?auto_10912 ?auto_10918 ) ) ( not ( = ?auto_10910 ?auto_10918 ) ) ( not ( = ?auto_10917 ?auto_10918 ) ) ( TRUCK-AT ?auto_10916 ?auto_10913 ) ( SURFACE-AT ?auto_10919 ?auto_10913 ) ( CLEAR ?auto_10919 ) ( LIFTING ?auto_10915 ?auto_10910 ) ( IS-CRATE ?auto_10910 ) ( not ( = ?auto_10919 ?auto_10910 ) ) ( not ( = ?auto_10911 ?auto_10919 ) ) ( not ( = ?auto_10912 ?auto_10919 ) ) ( not ( = ?auto_10917 ?auto_10919 ) ) ( not ( = ?auto_10918 ?auto_10919 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10911 ?auto_10912 )
      ( MAKE-2CRATE-VERIFY ?auto_10910 ?auto_10911 ?auto_10912 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10921 - SURFACE
      ?auto_10922 - SURFACE
      ?auto_10923 - SURFACE
      ?auto_10924 - SURFACE
    )
    :vars
    (
      ?auto_10929 - HOIST
      ?auto_10925 - PLACE
      ?auto_10927 - PLACE
      ?auto_10931 - HOIST
      ?auto_10928 - SURFACE
      ?auto_10926 - SURFACE
      ?auto_10930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10929 ?auto_10925 ) ( IS-CRATE ?auto_10924 ) ( not ( = ?auto_10923 ?auto_10924 ) ) ( not ( = ?auto_10922 ?auto_10923 ) ) ( not ( = ?auto_10922 ?auto_10924 ) ) ( not ( = ?auto_10927 ?auto_10925 ) ) ( HOIST-AT ?auto_10931 ?auto_10927 ) ( not ( = ?auto_10929 ?auto_10931 ) ) ( SURFACE-AT ?auto_10924 ?auto_10927 ) ( ON ?auto_10924 ?auto_10928 ) ( CLEAR ?auto_10924 ) ( not ( = ?auto_10923 ?auto_10928 ) ) ( not ( = ?auto_10924 ?auto_10928 ) ) ( not ( = ?auto_10922 ?auto_10928 ) ) ( IS-CRATE ?auto_10923 ) ( AVAILABLE ?auto_10931 ) ( SURFACE-AT ?auto_10923 ?auto_10927 ) ( ON ?auto_10923 ?auto_10926 ) ( CLEAR ?auto_10923 ) ( not ( = ?auto_10923 ?auto_10926 ) ) ( not ( = ?auto_10924 ?auto_10926 ) ) ( not ( = ?auto_10922 ?auto_10926 ) ) ( not ( = ?auto_10928 ?auto_10926 ) ) ( TRUCK-AT ?auto_10930 ?auto_10925 ) ( SURFACE-AT ?auto_10921 ?auto_10925 ) ( CLEAR ?auto_10921 ) ( LIFTING ?auto_10929 ?auto_10922 ) ( IS-CRATE ?auto_10922 ) ( not ( = ?auto_10921 ?auto_10922 ) ) ( not ( = ?auto_10923 ?auto_10921 ) ) ( not ( = ?auto_10924 ?auto_10921 ) ) ( not ( = ?auto_10928 ?auto_10921 ) ) ( not ( = ?auto_10926 ?auto_10921 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10922 ?auto_10923 ?auto_10924 )
      ( MAKE-3CRATE-VERIFY ?auto_10921 ?auto_10922 ?auto_10923 ?auto_10924 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10932 - SURFACE
      ?auto_10933 - SURFACE
      ?auto_10934 - SURFACE
      ?auto_10935 - SURFACE
      ?auto_10936 - SURFACE
    )
    :vars
    (
      ?auto_10941 - HOIST
      ?auto_10937 - PLACE
      ?auto_10939 - PLACE
      ?auto_10943 - HOIST
      ?auto_10940 - SURFACE
      ?auto_10938 - SURFACE
      ?auto_10942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10941 ?auto_10937 ) ( IS-CRATE ?auto_10936 ) ( not ( = ?auto_10935 ?auto_10936 ) ) ( not ( = ?auto_10934 ?auto_10935 ) ) ( not ( = ?auto_10934 ?auto_10936 ) ) ( not ( = ?auto_10939 ?auto_10937 ) ) ( HOIST-AT ?auto_10943 ?auto_10939 ) ( not ( = ?auto_10941 ?auto_10943 ) ) ( SURFACE-AT ?auto_10936 ?auto_10939 ) ( ON ?auto_10936 ?auto_10940 ) ( CLEAR ?auto_10936 ) ( not ( = ?auto_10935 ?auto_10940 ) ) ( not ( = ?auto_10936 ?auto_10940 ) ) ( not ( = ?auto_10934 ?auto_10940 ) ) ( IS-CRATE ?auto_10935 ) ( AVAILABLE ?auto_10943 ) ( SURFACE-AT ?auto_10935 ?auto_10939 ) ( ON ?auto_10935 ?auto_10938 ) ( CLEAR ?auto_10935 ) ( not ( = ?auto_10935 ?auto_10938 ) ) ( not ( = ?auto_10936 ?auto_10938 ) ) ( not ( = ?auto_10934 ?auto_10938 ) ) ( not ( = ?auto_10940 ?auto_10938 ) ) ( TRUCK-AT ?auto_10942 ?auto_10937 ) ( SURFACE-AT ?auto_10933 ?auto_10937 ) ( CLEAR ?auto_10933 ) ( LIFTING ?auto_10941 ?auto_10934 ) ( IS-CRATE ?auto_10934 ) ( not ( = ?auto_10933 ?auto_10934 ) ) ( not ( = ?auto_10935 ?auto_10933 ) ) ( not ( = ?auto_10936 ?auto_10933 ) ) ( not ( = ?auto_10940 ?auto_10933 ) ) ( not ( = ?auto_10938 ?auto_10933 ) ) ( ON ?auto_10933 ?auto_10932 ) ( not ( = ?auto_10932 ?auto_10933 ) ) ( not ( = ?auto_10932 ?auto_10934 ) ) ( not ( = ?auto_10932 ?auto_10935 ) ) ( not ( = ?auto_10932 ?auto_10936 ) ) ( not ( = ?auto_10932 ?auto_10940 ) ) ( not ( = ?auto_10932 ?auto_10938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10934 ?auto_10935 ?auto_10936 )
      ( MAKE-4CRATE-VERIFY ?auto_10932 ?auto_10933 ?auto_10934 ?auto_10935 ?auto_10936 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10944 - SURFACE
      ?auto_10945 - SURFACE
    )
    :vars
    (
      ?auto_10952 - HOIST
      ?auto_10946 - PLACE
      ?auto_10947 - SURFACE
      ?auto_10950 - PLACE
      ?auto_10954 - HOIST
      ?auto_10951 - SURFACE
      ?auto_10948 - SURFACE
      ?auto_10953 - TRUCK
      ?auto_10949 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10952 ?auto_10946 ) ( IS-CRATE ?auto_10945 ) ( not ( = ?auto_10944 ?auto_10945 ) ) ( not ( = ?auto_10947 ?auto_10944 ) ) ( not ( = ?auto_10947 ?auto_10945 ) ) ( not ( = ?auto_10950 ?auto_10946 ) ) ( HOIST-AT ?auto_10954 ?auto_10950 ) ( not ( = ?auto_10952 ?auto_10954 ) ) ( SURFACE-AT ?auto_10945 ?auto_10950 ) ( ON ?auto_10945 ?auto_10951 ) ( CLEAR ?auto_10945 ) ( not ( = ?auto_10944 ?auto_10951 ) ) ( not ( = ?auto_10945 ?auto_10951 ) ) ( not ( = ?auto_10947 ?auto_10951 ) ) ( IS-CRATE ?auto_10944 ) ( AVAILABLE ?auto_10954 ) ( SURFACE-AT ?auto_10944 ?auto_10950 ) ( ON ?auto_10944 ?auto_10948 ) ( CLEAR ?auto_10944 ) ( not ( = ?auto_10944 ?auto_10948 ) ) ( not ( = ?auto_10945 ?auto_10948 ) ) ( not ( = ?auto_10947 ?auto_10948 ) ) ( not ( = ?auto_10951 ?auto_10948 ) ) ( TRUCK-AT ?auto_10953 ?auto_10946 ) ( SURFACE-AT ?auto_10949 ?auto_10946 ) ( CLEAR ?auto_10949 ) ( IS-CRATE ?auto_10947 ) ( not ( = ?auto_10949 ?auto_10947 ) ) ( not ( = ?auto_10944 ?auto_10949 ) ) ( not ( = ?auto_10945 ?auto_10949 ) ) ( not ( = ?auto_10951 ?auto_10949 ) ) ( not ( = ?auto_10948 ?auto_10949 ) ) ( AVAILABLE ?auto_10952 ) ( IN ?auto_10947 ?auto_10953 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10952 ?auto_10947 ?auto_10953 ?auto_10946 )
      ( MAKE-2CRATE ?auto_10947 ?auto_10944 ?auto_10945 )
      ( MAKE-1CRATE-VERIFY ?auto_10944 ?auto_10945 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10955 - SURFACE
      ?auto_10956 - SURFACE
      ?auto_10957 - SURFACE
    )
    :vars
    (
      ?auto_10959 - HOIST
      ?auto_10962 - PLACE
      ?auto_10963 - PLACE
      ?auto_10964 - HOIST
      ?auto_10961 - SURFACE
      ?auto_10960 - SURFACE
      ?auto_10965 - TRUCK
      ?auto_10958 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10959 ?auto_10962 ) ( IS-CRATE ?auto_10957 ) ( not ( = ?auto_10956 ?auto_10957 ) ) ( not ( = ?auto_10955 ?auto_10956 ) ) ( not ( = ?auto_10955 ?auto_10957 ) ) ( not ( = ?auto_10963 ?auto_10962 ) ) ( HOIST-AT ?auto_10964 ?auto_10963 ) ( not ( = ?auto_10959 ?auto_10964 ) ) ( SURFACE-AT ?auto_10957 ?auto_10963 ) ( ON ?auto_10957 ?auto_10961 ) ( CLEAR ?auto_10957 ) ( not ( = ?auto_10956 ?auto_10961 ) ) ( not ( = ?auto_10957 ?auto_10961 ) ) ( not ( = ?auto_10955 ?auto_10961 ) ) ( IS-CRATE ?auto_10956 ) ( AVAILABLE ?auto_10964 ) ( SURFACE-AT ?auto_10956 ?auto_10963 ) ( ON ?auto_10956 ?auto_10960 ) ( CLEAR ?auto_10956 ) ( not ( = ?auto_10956 ?auto_10960 ) ) ( not ( = ?auto_10957 ?auto_10960 ) ) ( not ( = ?auto_10955 ?auto_10960 ) ) ( not ( = ?auto_10961 ?auto_10960 ) ) ( TRUCK-AT ?auto_10965 ?auto_10962 ) ( SURFACE-AT ?auto_10958 ?auto_10962 ) ( CLEAR ?auto_10958 ) ( IS-CRATE ?auto_10955 ) ( not ( = ?auto_10958 ?auto_10955 ) ) ( not ( = ?auto_10956 ?auto_10958 ) ) ( not ( = ?auto_10957 ?auto_10958 ) ) ( not ( = ?auto_10961 ?auto_10958 ) ) ( not ( = ?auto_10960 ?auto_10958 ) ) ( AVAILABLE ?auto_10959 ) ( IN ?auto_10955 ?auto_10965 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10956 ?auto_10957 )
      ( MAKE-2CRATE-VERIFY ?auto_10955 ?auto_10956 ?auto_10957 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10966 - SURFACE
      ?auto_10967 - SURFACE
      ?auto_10968 - SURFACE
      ?auto_10969 - SURFACE
    )
    :vars
    (
      ?auto_10973 - HOIST
      ?auto_10975 - PLACE
      ?auto_10972 - PLACE
      ?auto_10971 - HOIST
      ?auto_10976 - SURFACE
      ?auto_10970 - SURFACE
      ?auto_10974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10973 ?auto_10975 ) ( IS-CRATE ?auto_10969 ) ( not ( = ?auto_10968 ?auto_10969 ) ) ( not ( = ?auto_10967 ?auto_10968 ) ) ( not ( = ?auto_10967 ?auto_10969 ) ) ( not ( = ?auto_10972 ?auto_10975 ) ) ( HOIST-AT ?auto_10971 ?auto_10972 ) ( not ( = ?auto_10973 ?auto_10971 ) ) ( SURFACE-AT ?auto_10969 ?auto_10972 ) ( ON ?auto_10969 ?auto_10976 ) ( CLEAR ?auto_10969 ) ( not ( = ?auto_10968 ?auto_10976 ) ) ( not ( = ?auto_10969 ?auto_10976 ) ) ( not ( = ?auto_10967 ?auto_10976 ) ) ( IS-CRATE ?auto_10968 ) ( AVAILABLE ?auto_10971 ) ( SURFACE-AT ?auto_10968 ?auto_10972 ) ( ON ?auto_10968 ?auto_10970 ) ( CLEAR ?auto_10968 ) ( not ( = ?auto_10968 ?auto_10970 ) ) ( not ( = ?auto_10969 ?auto_10970 ) ) ( not ( = ?auto_10967 ?auto_10970 ) ) ( not ( = ?auto_10976 ?auto_10970 ) ) ( TRUCK-AT ?auto_10974 ?auto_10975 ) ( SURFACE-AT ?auto_10966 ?auto_10975 ) ( CLEAR ?auto_10966 ) ( IS-CRATE ?auto_10967 ) ( not ( = ?auto_10966 ?auto_10967 ) ) ( not ( = ?auto_10968 ?auto_10966 ) ) ( not ( = ?auto_10969 ?auto_10966 ) ) ( not ( = ?auto_10976 ?auto_10966 ) ) ( not ( = ?auto_10970 ?auto_10966 ) ) ( AVAILABLE ?auto_10973 ) ( IN ?auto_10967 ?auto_10974 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10967 ?auto_10968 ?auto_10969 )
      ( MAKE-3CRATE-VERIFY ?auto_10966 ?auto_10967 ?auto_10968 ?auto_10969 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10977 - SURFACE
      ?auto_10978 - SURFACE
      ?auto_10979 - SURFACE
      ?auto_10980 - SURFACE
      ?auto_10981 - SURFACE
    )
    :vars
    (
      ?auto_10985 - HOIST
      ?auto_10987 - PLACE
      ?auto_10984 - PLACE
      ?auto_10983 - HOIST
      ?auto_10988 - SURFACE
      ?auto_10982 - SURFACE
      ?auto_10986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10985 ?auto_10987 ) ( IS-CRATE ?auto_10981 ) ( not ( = ?auto_10980 ?auto_10981 ) ) ( not ( = ?auto_10979 ?auto_10980 ) ) ( not ( = ?auto_10979 ?auto_10981 ) ) ( not ( = ?auto_10984 ?auto_10987 ) ) ( HOIST-AT ?auto_10983 ?auto_10984 ) ( not ( = ?auto_10985 ?auto_10983 ) ) ( SURFACE-AT ?auto_10981 ?auto_10984 ) ( ON ?auto_10981 ?auto_10988 ) ( CLEAR ?auto_10981 ) ( not ( = ?auto_10980 ?auto_10988 ) ) ( not ( = ?auto_10981 ?auto_10988 ) ) ( not ( = ?auto_10979 ?auto_10988 ) ) ( IS-CRATE ?auto_10980 ) ( AVAILABLE ?auto_10983 ) ( SURFACE-AT ?auto_10980 ?auto_10984 ) ( ON ?auto_10980 ?auto_10982 ) ( CLEAR ?auto_10980 ) ( not ( = ?auto_10980 ?auto_10982 ) ) ( not ( = ?auto_10981 ?auto_10982 ) ) ( not ( = ?auto_10979 ?auto_10982 ) ) ( not ( = ?auto_10988 ?auto_10982 ) ) ( TRUCK-AT ?auto_10986 ?auto_10987 ) ( SURFACE-AT ?auto_10978 ?auto_10987 ) ( CLEAR ?auto_10978 ) ( IS-CRATE ?auto_10979 ) ( not ( = ?auto_10978 ?auto_10979 ) ) ( not ( = ?auto_10980 ?auto_10978 ) ) ( not ( = ?auto_10981 ?auto_10978 ) ) ( not ( = ?auto_10988 ?auto_10978 ) ) ( not ( = ?auto_10982 ?auto_10978 ) ) ( AVAILABLE ?auto_10985 ) ( IN ?auto_10979 ?auto_10986 ) ( ON ?auto_10978 ?auto_10977 ) ( not ( = ?auto_10977 ?auto_10978 ) ) ( not ( = ?auto_10977 ?auto_10979 ) ) ( not ( = ?auto_10977 ?auto_10980 ) ) ( not ( = ?auto_10977 ?auto_10981 ) ) ( not ( = ?auto_10977 ?auto_10988 ) ) ( not ( = ?auto_10977 ?auto_10982 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10979 ?auto_10980 ?auto_10981 )
      ( MAKE-4CRATE-VERIFY ?auto_10977 ?auto_10978 ?auto_10979 ?auto_10980 ?auto_10981 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10989 - SURFACE
      ?auto_10990 - SURFACE
    )
    :vars
    (
      ?auto_10996 - HOIST
      ?auto_10998 - PLACE
      ?auto_10992 - SURFACE
      ?auto_10995 - PLACE
      ?auto_10993 - HOIST
      ?auto_10999 - SURFACE
      ?auto_10991 - SURFACE
      ?auto_10994 - SURFACE
      ?auto_10997 - TRUCK
      ?auto_11000 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10996 ?auto_10998 ) ( IS-CRATE ?auto_10990 ) ( not ( = ?auto_10989 ?auto_10990 ) ) ( not ( = ?auto_10992 ?auto_10989 ) ) ( not ( = ?auto_10992 ?auto_10990 ) ) ( not ( = ?auto_10995 ?auto_10998 ) ) ( HOIST-AT ?auto_10993 ?auto_10995 ) ( not ( = ?auto_10996 ?auto_10993 ) ) ( SURFACE-AT ?auto_10990 ?auto_10995 ) ( ON ?auto_10990 ?auto_10999 ) ( CLEAR ?auto_10990 ) ( not ( = ?auto_10989 ?auto_10999 ) ) ( not ( = ?auto_10990 ?auto_10999 ) ) ( not ( = ?auto_10992 ?auto_10999 ) ) ( IS-CRATE ?auto_10989 ) ( AVAILABLE ?auto_10993 ) ( SURFACE-AT ?auto_10989 ?auto_10995 ) ( ON ?auto_10989 ?auto_10991 ) ( CLEAR ?auto_10989 ) ( not ( = ?auto_10989 ?auto_10991 ) ) ( not ( = ?auto_10990 ?auto_10991 ) ) ( not ( = ?auto_10992 ?auto_10991 ) ) ( not ( = ?auto_10999 ?auto_10991 ) ) ( SURFACE-AT ?auto_10994 ?auto_10998 ) ( CLEAR ?auto_10994 ) ( IS-CRATE ?auto_10992 ) ( not ( = ?auto_10994 ?auto_10992 ) ) ( not ( = ?auto_10989 ?auto_10994 ) ) ( not ( = ?auto_10990 ?auto_10994 ) ) ( not ( = ?auto_10999 ?auto_10994 ) ) ( not ( = ?auto_10991 ?auto_10994 ) ) ( AVAILABLE ?auto_10996 ) ( IN ?auto_10992 ?auto_10997 ) ( TRUCK-AT ?auto_10997 ?auto_11000 ) ( not ( = ?auto_11000 ?auto_10998 ) ) ( not ( = ?auto_10995 ?auto_11000 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10997 ?auto_11000 ?auto_10998 )
      ( MAKE-2CRATE ?auto_10992 ?auto_10989 ?auto_10990 )
      ( MAKE-1CRATE-VERIFY ?auto_10989 ?auto_10990 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11001 - SURFACE
      ?auto_11002 - SURFACE
      ?auto_11003 - SURFACE
    )
    :vars
    (
      ?auto_11007 - HOIST
      ?auto_11006 - PLACE
      ?auto_11009 - PLACE
      ?auto_11010 - HOIST
      ?auto_11004 - SURFACE
      ?auto_11012 - SURFACE
      ?auto_11005 - SURFACE
      ?auto_11008 - TRUCK
      ?auto_11011 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11007 ?auto_11006 ) ( IS-CRATE ?auto_11003 ) ( not ( = ?auto_11002 ?auto_11003 ) ) ( not ( = ?auto_11001 ?auto_11002 ) ) ( not ( = ?auto_11001 ?auto_11003 ) ) ( not ( = ?auto_11009 ?auto_11006 ) ) ( HOIST-AT ?auto_11010 ?auto_11009 ) ( not ( = ?auto_11007 ?auto_11010 ) ) ( SURFACE-AT ?auto_11003 ?auto_11009 ) ( ON ?auto_11003 ?auto_11004 ) ( CLEAR ?auto_11003 ) ( not ( = ?auto_11002 ?auto_11004 ) ) ( not ( = ?auto_11003 ?auto_11004 ) ) ( not ( = ?auto_11001 ?auto_11004 ) ) ( IS-CRATE ?auto_11002 ) ( AVAILABLE ?auto_11010 ) ( SURFACE-AT ?auto_11002 ?auto_11009 ) ( ON ?auto_11002 ?auto_11012 ) ( CLEAR ?auto_11002 ) ( not ( = ?auto_11002 ?auto_11012 ) ) ( not ( = ?auto_11003 ?auto_11012 ) ) ( not ( = ?auto_11001 ?auto_11012 ) ) ( not ( = ?auto_11004 ?auto_11012 ) ) ( SURFACE-AT ?auto_11005 ?auto_11006 ) ( CLEAR ?auto_11005 ) ( IS-CRATE ?auto_11001 ) ( not ( = ?auto_11005 ?auto_11001 ) ) ( not ( = ?auto_11002 ?auto_11005 ) ) ( not ( = ?auto_11003 ?auto_11005 ) ) ( not ( = ?auto_11004 ?auto_11005 ) ) ( not ( = ?auto_11012 ?auto_11005 ) ) ( AVAILABLE ?auto_11007 ) ( IN ?auto_11001 ?auto_11008 ) ( TRUCK-AT ?auto_11008 ?auto_11011 ) ( not ( = ?auto_11011 ?auto_11006 ) ) ( not ( = ?auto_11009 ?auto_11011 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11002 ?auto_11003 )
      ( MAKE-2CRATE-VERIFY ?auto_11001 ?auto_11002 ?auto_11003 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11013 - SURFACE
      ?auto_11014 - SURFACE
      ?auto_11015 - SURFACE
      ?auto_11016 - SURFACE
    )
    :vars
    (
      ?auto_11020 - HOIST
      ?auto_11018 - PLACE
      ?auto_11023 - PLACE
      ?auto_11024 - HOIST
      ?auto_11022 - SURFACE
      ?auto_11017 - SURFACE
      ?auto_11019 - TRUCK
      ?auto_11021 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11020 ?auto_11018 ) ( IS-CRATE ?auto_11016 ) ( not ( = ?auto_11015 ?auto_11016 ) ) ( not ( = ?auto_11014 ?auto_11015 ) ) ( not ( = ?auto_11014 ?auto_11016 ) ) ( not ( = ?auto_11023 ?auto_11018 ) ) ( HOIST-AT ?auto_11024 ?auto_11023 ) ( not ( = ?auto_11020 ?auto_11024 ) ) ( SURFACE-AT ?auto_11016 ?auto_11023 ) ( ON ?auto_11016 ?auto_11022 ) ( CLEAR ?auto_11016 ) ( not ( = ?auto_11015 ?auto_11022 ) ) ( not ( = ?auto_11016 ?auto_11022 ) ) ( not ( = ?auto_11014 ?auto_11022 ) ) ( IS-CRATE ?auto_11015 ) ( AVAILABLE ?auto_11024 ) ( SURFACE-AT ?auto_11015 ?auto_11023 ) ( ON ?auto_11015 ?auto_11017 ) ( CLEAR ?auto_11015 ) ( not ( = ?auto_11015 ?auto_11017 ) ) ( not ( = ?auto_11016 ?auto_11017 ) ) ( not ( = ?auto_11014 ?auto_11017 ) ) ( not ( = ?auto_11022 ?auto_11017 ) ) ( SURFACE-AT ?auto_11013 ?auto_11018 ) ( CLEAR ?auto_11013 ) ( IS-CRATE ?auto_11014 ) ( not ( = ?auto_11013 ?auto_11014 ) ) ( not ( = ?auto_11015 ?auto_11013 ) ) ( not ( = ?auto_11016 ?auto_11013 ) ) ( not ( = ?auto_11022 ?auto_11013 ) ) ( not ( = ?auto_11017 ?auto_11013 ) ) ( AVAILABLE ?auto_11020 ) ( IN ?auto_11014 ?auto_11019 ) ( TRUCK-AT ?auto_11019 ?auto_11021 ) ( not ( = ?auto_11021 ?auto_11018 ) ) ( not ( = ?auto_11023 ?auto_11021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11014 ?auto_11015 ?auto_11016 )
      ( MAKE-3CRATE-VERIFY ?auto_11013 ?auto_11014 ?auto_11015 ?auto_11016 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11025 - SURFACE
      ?auto_11026 - SURFACE
      ?auto_11027 - SURFACE
      ?auto_11028 - SURFACE
      ?auto_11029 - SURFACE
    )
    :vars
    (
      ?auto_11033 - HOIST
      ?auto_11031 - PLACE
      ?auto_11036 - PLACE
      ?auto_11037 - HOIST
      ?auto_11035 - SURFACE
      ?auto_11030 - SURFACE
      ?auto_11032 - TRUCK
      ?auto_11034 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11033 ?auto_11031 ) ( IS-CRATE ?auto_11029 ) ( not ( = ?auto_11028 ?auto_11029 ) ) ( not ( = ?auto_11027 ?auto_11028 ) ) ( not ( = ?auto_11027 ?auto_11029 ) ) ( not ( = ?auto_11036 ?auto_11031 ) ) ( HOIST-AT ?auto_11037 ?auto_11036 ) ( not ( = ?auto_11033 ?auto_11037 ) ) ( SURFACE-AT ?auto_11029 ?auto_11036 ) ( ON ?auto_11029 ?auto_11035 ) ( CLEAR ?auto_11029 ) ( not ( = ?auto_11028 ?auto_11035 ) ) ( not ( = ?auto_11029 ?auto_11035 ) ) ( not ( = ?auto_11027 ?auto_11035 ) ) ( IS-CRATE ?auto_11028 ) ( AVAILABLE ?auto_11037 ) ( SURFACE-AT ?auto_11028 ?auto_11036 ) ( ON ?auto_11028 ?auto_11030 ) ( CLEAR ?auto_11028 ) ( not ( = ?auto_11028 ?auto_11030 ) ) ( not ( = ?auto_11029 ?auto_11030 ) ) ( not ( = ?auto_11027 ?auto_11030 ) ) ( not ( = ?auto_11035 ?auto_11030 ) ) ( SURFACE-AT ?auto_11026 ?auto_11031 ) ( CLEAR ?auto_11026 ) ( IS-CRATE ?auto_11027 ) ( not ( = ?auto_11026 ?auto_11027 ) ) ( not ( = ?auto_11028 ?auto_11026 ) ) ( not ( = ?auto_11029 ?auto_11026 ) ) ( not ( = ?auto_11035 ?auto_11026 ) ) ( not ( = ?auto_11030 ?auto_11026 ) ) ( AVAILABLE ?auto_11033 ) ( IN ?auto_11027 ?auto_11032 ) ( TRUCK-AT ?auto_11032 ?auto_11034 ) ( not ( = ?auto_11034 ?auto_11031 ) ) ( not ( = ?auto_11036 ?auto_11034 ) ) ( ON ?auto_11026 ?auto_11025 ) ( not ( = ?auto_11025 ?auto_11026 ) ) ( not ( = ?auto_11025 ?auto_11027 ) ) ( not ( = ?auto_11025 ?auto_11028 ) ) ( not ( = ?auto_11025 ?auto_11029 ) ) ( not ( = ?auto_11025 ?auto_11035 ) ) ( not ( = ?auto_11025 ?auto_11030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11027 ?auto_11028 ?auto_11029 )
      ( MAKE-4CRATE-VERIFY ?auto_11025 ?auto_11026 ?auto_11027 ?auto_11028 ?auto_11029 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11038 - SURFACE
      ?auto_11039 - SURFACE
    )
    :vars
    (
      ?auto_11044 - HOIST
      ?auto_11041 - PLACE
      ?auto_11048 - SURFACE
      ?auto_11047 - PLACE
      ?auto_11049 - HOIST
      ?auto_11046 - SURFACE
      ?auto_11040 - SURFACE
      ?auto_11042 - SURFACE
      ?auto_11043 - TRUCK
      ?auto_11045 - PLACE
      ?auto_11050 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11044 ?auto_11041 ) ( IS-CRATE ?auto_11039 ) ( not ( = ?auto_11038 ?auto_11039 ) ) ( not ( = ?auto_11048 ?auto_11038 ) ) ( not ( = ?auto_11048 ?auto_11039 ) ) ( not ( = ?auto_11047 ?auto_11041 ) ) ( HOIST-AT ?auto_11049 ?auto_11047 ) ( not ( = ?auto_11044 ?auto_11049 ) ) ( SURFACE-AT ?auto_11039 ?auto_11047 ) ( ON ?auto_11039 ?auto_11046 ) ( CLEAR ?auto_11039 ) ( not ( = ?auto_11038 ?auto_11046 ) ) ( not ( = ?auto_11039 ?auto_11046 ) ) ( not ( = ?auto_11048 ?auto_11046 ) ) ( IS-CRATE ?auto_11038 ) ( AVAILABLE ?auto_11049 ) ( SURFACE-AT ?auto_11038 ?auto_11047 ) ( ON ?auto_11038 ?auto_11040 ) ( CLEAR ?auto_11038 ) ( not ( = ?auto_11038 ?auto_11040 ) ) ( not ( = ?auto_11039 ?auto_11040 ) ) ( not ( = ?auto_11048 ?auto_11040 ) ) ( not ( = ?auto_11046 ?auto_11040 ) ) ( SURFACE-AT ?auto_11042 ?auto_11041 ) ( CLEAR ?auto_11042 ) ( IS-CRATE ?auto_11048 ) ( not ( = ?auto_11042 ?auto_11048 ) ) ( not ( = ?auto_11038 ?auto_11042 ) ) ( not ( = ?auto_11039 ?auto_11042 ) ) ( not ( = ?auto_11046 ?auto_11042 ) ) ( not ( = ?auto_11040 ?auto_11042 ) ) ( AVAILABLE ?auto_11044 ) ( TRUCK-AT ?auto_11043 ?auto_11045 ) ( not ( = ?auto_11045 ?auto_11041 ) ) ( not ( = ?auto_11047 ?auto_11045 ) ) ( HOIST-AT ?auto_11050 ?auto_11045 ) ( LIFTING ?auto_11050 ?auto_11048 ) ( not ( = ?auto_11044 ?auto_11050 ) ) ( not ( = ?auto_11049 ?auto_11050 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11050 ?auto_11048 ?auto_11043 ?auto_11045 )
      ( MAKE-2CRATE ?auto_11048 ?auto_11038 ?auto_11039 )
      ( MAKE-1CRATE-VERIFY ?auto_11038 ?auto_11039 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11051 - SURFACE
      ?auto_11052 - SURFACE
      ?auto_11053 - SURFACE
    )
    :vars
    (
      ?auto_11062 - HOIST
      ?auto_11054 - PLACE
      ?auto_11060 - PLACE
      ?auto_11061 - HOIST
      ?auto_11059 - SURFACE
      ?auto_11055 - SURFACE
      ?auto_11056 - SURFACE
      ?auto_11058 - TRUCK
      ?auto_11057 - PLACE
      ?auto_11063 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11062 ?auto_11054 ) ( IS-CRATE ?auto_11053 ) ( not ( = ?auto_11052 ?auto_11053 ) ) ( not ( = ?auto_11051 ?auto_11052 ) ) ( not ( = ?auto_11051 ?auto_11053 ) ) ( not ( = ?auto_11060 ?auto_11054 ) ) ( HOIST-AT ?auto_11061 ?auto_11060 ) ( not ( = ?auto_11062 ?auto_11061 ) ) ( SURFACE-AT ?auto_11053 ?auto_11060 ) ( ON ?auto_11053 ?auto_11059 ) ( CLEAR ?auto_11053 ) ( not ( = ?auto_11052 ?auto_11059 ) ) ( not ( = ?auto_11053 ?auto_11059 ) ) ( not ( = ?auto_11051 ?auto_11059 ) ) ( IS-CRATE ?auto_11052 ) ( AVAILABLE ?auto_11061 ) ( SURFACE-AT ?auto_11052 ?auto_11060 ) ( ON ?auto_11052 ?auto_11055 ) ( CLEAR ?auto_11052 ) ( not ( = ?auto_11052 ?auto_11055 ) ) ( not ( = ?auto_11053 ?auto_11055 ) ) ( not ( = ?auto_11051 ?auto_11055 ) ) ( not ( = ?auto_11059 ?auto_11055 ) ) ( SURFACE-AT ?auto_11056 ?auto_11054 ) ( CLEAR ?auto_11056 ) ( IS-CRATE ?auto_11051 ) ( not ( = ?auto_11056 ?auto_11051 ) ) ( not ( = ?auto_11052 ?auto_11056 ) ) ( not ( = ?auto_11053 ?auto_11056 ) ) ( not ( = ?auto_11059 ?auto_11056 ) ) ( not ( = ?auto_11055 ?auto_11056 ) ) ( AVAILABLE ?auto_11062 ) ( TRUCK-AT ?auto_11058 ?auto_11057 ) ( not ( = ?auto_11057 ?auto_11054 ) ) ( not ( = ?auto_11060 ?auto_11057 ) ) ( HOIST-AT ?auto_11063 ?auto_11057 ) ( LIFTING ?auto_11063 ?auto_11051 ) ( not ( = ?auto_11062 ?auto_11063 ) ) ( not ( = ?auto_11061 ?auto_11063 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11052 ?auto_11053 )
      ( MAKE-2CRATE-VERIFY ?auto_11051 ?auto_11052 ?auto_11053 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11064 - SURFACE
      ?auto_11065 - SURFACE
      ?auto_11066 - SURFACE
      ?auto_11067 - SURFACE
    )
    :vars
    (
      ?auto_11074 - HOIST
      ?auto_11070 - PLACE
      ?auto_11071 - PLACE
      ?auto_11069 - HOIST
      ?auto_11075 - SURFACE
      ?auto_11068 - SURFACE
      ?auto_11076 - TRUCK
      ?auto_11073 - PLACE
      ?auto_11072 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11074 ?auto_11070 ) ( IS-CRATE ?auto_11067 ) ( not ( = ?auto_11066 ?auto_11067 ) ) ( not ( = ?auto_11065 ?auto_11066 ) ) ( not ( = ?auto_11065 ?auto_11067 ) ) ( not ( = ?auto_11071 ?auto_11070 ) ) ( HOIST-AT ?auto_11069 ?auto_11071 ) ( not ( = ?auto_11074 ?auto_11069 ) ) ( SURFACE-AT ?auto_11067 ?auto_11071 ) ( ON ?auto_11067 ?auto_11075 ) ( CLEAR ?auto_11067 ) ( not ( = ?auto_11066 ?auto_11075 ) ) ( not ( = ?auto_11067 ?auto_11075 ) ) ( not ( = ?auto_11065 ?auto_11075 ) ) ( IS-CRATE ?auto_11066 ) ( AVAILABLE ?auto_11069 ) ( SURFACE-AT ?auto_11066 ?auto_11071 ) ( ON ?auto_11066 ?auto_11068 ) ( CLEAR ?auto_11066 ) ( not ( = ?auto_11066 ?auto_11068 ) ) ( not ( = ?auto_11067 ?auto_11068 ) ) ( not ( = ?auto_11065 ?auto_11068 ) ) ( not ( = ?auto_11075 ?auto_11068 ) ) ( SURFACE-AT ?auto_11064 ?auto_11070 ) ( CLEAR ?auto_11064 ) ( IS-CRATE ?auto_11065 ) ( not ( = ?auto_11064 ?auto_11065 ) ) ( not ( = ?auto_11066 ?auto_11064 ) ) ( not ( = ?auto_11067 ?auto_11064 ) ) ( not ( = ?auto_11075 ?auto_11064 ) ) ( not ( = ?auto_11068 ?auto_11064 ) ) ( AVAILABLE ?auto_11074 ) ( TRUCK-AT ?auto_11076 ?auto_11073 ) ( not ( = ?auto_11073 ?auto_11070 ) ) ( not ( = ?auto_11071 ?auto_11073 ) ) ( HOIST-AT ?auto_11072 ?auto_11073 ) ( LIFTING ?auto_11072 ?auto_11065 ) ( not ( = ?auto_11074 ?auto_11072 ) ) ( not ( = ?auto_11069 ?auto_11072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11065 ?auto_11066 ?auto_11067 )
      ( MAKE-3CRATE-VERIFY ?auto_11064 ?auto_11065 ?auto_11066 ?auto_11067 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11077 - SURFACE
      ?auto_11078 - SURFACE
      ?auto_11079 - SURFACE
      ?auto_11080 - SURFACE
      ?auto_11081 - SURFACE
    )
    :vars
    (
      ?auto_11088 - HOIST
      ?auto_11084 - PLACE
      ?auto_11085 - PLACE
      ?auto_11083 - HOIST
      ?auto_11089 - SURFACE
      ?auto_11082 - SURFACE
      ?auto_11090 - TRUCK
      ?auto_11087 - PLACE
      ?auto_11086 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11088 ?auto_11084 ) ( IS-CRATE ?auto_11081 ) ( not ( = ?auto_11080 ?auto_11081 ) ) ( not ( = ?auto_11079 ?auto_11080 ) ) ( not ( = ?auto_11079 ?auto_11081 ) ) ( not ( = ?auto_11085 ?auto_11084 ) ) ( HOIST-AT ?auto_11083 ?auto_11085 ) ( not ( = ?auto_11088 ?auto_11083 ) ) ( SURFACE-AT ?auto_11081 ?auto_11085 ) ( ON ?auto_11081 ?auto_11089 ) ( CLEAR ?auto_11081 ) ( not ( = ?auto_11080 ?auto_11089 ) ) ( not ( = ?auto_11081 ?auto_11089 ) ) ( not ( = ?auto_11079 ?auto_11089 ) ) ( IS-CRATE ?auto_11080 ) ( AVAILABLE ?auto_11083 ) ( SURFACE-AT ?auto_11080 ?auto_11085 ) ( ON ?auto_11080 ?auto_11082 ) ( CLEAR ?auto_11080 ) ( not ( = ?auto_11080 ?auto_11082 ) ) ( not ( = ?auto_11081 ?auto_11082 ) ) ( not ( = ?auto_11079 ?auto_11082 ) ) ( not ( = ?auto_11089 ?auto_11082 ) ) ( SURFACE-AT ?auto_11078 ?auto_11084 ) ( CLEAR ?auto_11078 ) ( IS-CRATE ?auto_11079 ) ( not ( = ?auto_11078 ?auto_11079 ) ) ( not ( = ?auto_11080 ?auto_11078 ) ) ( not ( = ?auto_11081 ?auto_11078 ) ) ( not ( = ?auto_11089 ?auto_11078 ) ) ( not ( = ?auto_11082 ?auto_11078 ) ) ( AVAILABLE ?auto_11088 ) ( TRUCK-AT ?auto_11090 ?auto_11087 ) ( not ( = ?auto_11087 ?auto_11084 ) ) ( not ( = ?auto_11085 ?auto_11087 ) ) ( HOIST-AT ?auto_11086 ?auto_11087 ) ( LIFTING ?auto_11086 ?auto_11079 ) ( not ( = ?auto_11088 ?auto_11086 ) ) ( not ( = ?auto_11083 ?auto_11086 ) ) ( ON ?auto_11078 ?auto_11077 ) ( not ( = ?auto_11077 ?auto_11078 ) ) ( not ( = ?auto_11077 ?auto_11079 ) ) ( not ( = ?auto_11077 ?auto_11080 ) ) ( not ( = ?auto_11077 ?auto_11081 ) ) ( not ( = ?auto_11077 ?auto_11089 ) ) ( not ( = ?auto_11077 ?auto_11082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11079 ?auto_11080 ?auto_11081 )
      ( MAKE-4CRATE-VERIFY ?auto_11077 ?auto_11078 ?auto_11079 ?auto_11080 ?auto_11081 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11091 - SURFACE
      ?auto_11092 - SURFACE
    )
    :vars
    (
      ?auto_11100 - HOIST
      ?auto_11096 - PLACE
      ?auto_11095 - SURFACE
      ?auto_11097 - PLACE
      ?auto_11094 - HOIST
      ?auto_11102 - SURFACE
      ?auto_11093 - SURFACE
      ?auto_11101 - SURFACE
      ?auto_11103 - TRUCK
      ?auto_11099 - PLACE
      ?auto_11098 - HOIST
      ?auto_11104 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11100 ?auto_11096 ) ( IS-CRATE ?auto_11092 ) ( not ( = ?auto_11091 ?auto_11092 ) ) ( not ( = ?auto_11095 ?auto_11091 ) ) ( not ( = ?auto_11095 ?auto_11092 ) ) ( not ( = ?auto_11097 ?auto_11096 ) ) ( HOIST-AT ?auto_11094 ?auto_11097 ) ( not ( = ?auto_11100 ?auto_11094 ) ) ( SURFACE-AT ?auto_11092 ?auto_11097 ) ( ON ?auto_11092 ?auto_11102 ) ( CLEAR ?auto_11092 ) ( not ( = ?auto_11091 ?auto_11102 ) ) ( not ( = ?auto_11092 ?auto_11102 ) ) ( not ( = ?auto_11095 ?auto_11102 ) ) ( IS-CRATE ?auto_11091 ) ( AVAILABLE ?auto_11094 ) ( SURFACE-AT ?auto_11091 ?auto_11097 ) ( ON ?auto_11091 ?auto_11093 ) ( CLEAR ?auto_11091 ) ( not ( = ?auto_11091 ?auto_11093 ) ) ( not ( = ?auto_11092 ?auto_11093 ) ) ( not ( = ?auto_11095 ?auto_11093 ) ) ( not ( = ?auto_11102 ?auto_11093 ) ) ( SURFACE-AT ?auto_11101 ?auto_11096 ) ( CLEAR ?auto_11101 ) ( IS-CRATE ?auto_11095 ) ( not ( = ?auto_11101 ?auto_11095 ) ) ( not ( = ?auto_11091 ?auto_11101 ) ) ( not ( = ?auto_11092 ?auto_11101 ) ) ( not ( = ?auto_11102 ?auto_11101 ) ) ( not ( = ?auto_11093 ?auto_11101 ) ) ( AVAILABLE ?auto_11100 ) ( TRUCK-AT ?auto_11103 ?auto_11099 ) ( not ( = ?auto_11099 ?auto_11096 ) ) ( not ( = ?auto_11097 ?auto_11099 ) ) ( HOIST-AT ?auto_11098 ?auto_11099 ) ( not ( = ?auto_11100 ?auto_11098 ) ) ( not ( = ?auto_11094 ?auto_11098 ) ) ( AVAILABLE ?auto_11098 ) ( SURFACE-AT ?auto_11095 ?auto_11099 ) ( ON ?auto_11095 ?auto_11104 ) ( CLEAR ?auto_11095 ) ( not ( = ?auto_11091 ?auto_11104 ) ) ( not ( = ?auto_11092 ?auto_11104 ) ) ( not ( = ?auto_11095 ?auto_11104 ) ) ( not ( = ?auto_11102 ?auto_11104 ) ) ( not ( = ?auto_11093 ?auto_11104 ) ) ( not ( = ?auto_11101 ?auto_11104 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11098 ?auto_11095 ?auto_11104 ?auto_11099 )
      ( MAKE-2CRATE ?auto_11095 ?auto_11091 ?auto_11092 )
      ( MAKE-1CRATE-VERIFY ?auto_11091 ?auto_11092 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11105 - SURFACE
      ?auto_11106 - SURFACE
      ?auto_11107 - SURFACE
    )
    :vars
    (
      ?auto_11110 - HOIST
      ?auto_11109 - PLACE
      ?auto_11111 - PLACE
      ?auto_11112 - HOIST
      ?auto_11113 - SURFACE
      ?auto_11118 - SURFACE
      ?auto_11114 - SURFACE
      ?auto_11116 - TRUCK
      ?auto_11108 - PLACE
      ?auto_11115 - HOIST
      ?auto_11117 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11110 ?auto_11109 ) ( IS-CRATE ?auto_11107 ) ( not ( = ?auto_11106 ?auto_11107 ) ) ( not ( = ?auto_11105 ?auto_11106 ) ) ( not ( = ?auto_11105 ?auto_11107 ) ) ( not ( = ?auto_11111 ?auto_11109 ) ) ( HOIST-AT ?auto_11112 ?auto_11111 ) ( not ( = ?auto_11110 ?auto_11112 ) ) ( SURFACE-AT ?auto_11107 ?auto_11111 ) ( ON ?auto_11107 ?auto_11113 ) ( CLEAR ?auto_11107 ) ( not ( = ?auto_11106 ?auto_11113 ) ) ( not ( = ?auto_11107 ?auto_11113 ) ) ( not ( = ?auto_11105 ?auto_11113 ) ) ( IS-CRATE ?auto_11106 ) ( AVAILABLE ?auto_11112 ) ( SURFACE-AT ?auto_11106 ?auto_11111 ) ( ON ?auto_11106 ?auto_11118 ) ( CLEAR ?auto_11106 ) ( not ( = ?auto_11106 ?auto_11118 ) ) ( not ( = ?auto_11107 ?auto_11118 ) ) ( not ( = ?auto_11105 ?auto_11118 ) ) ( not ( = ?auto_11113 ?auto_11118 ) ) ( SURFACE-AT ?auto_11114 ?auto_11109 ) ( CLEAR ?auto_11114 ) ( IS-CRATE ?auto_11105 ) ( not ( = ?auto_11114 ?auto_11105 ) ) ( not ( = ?auto_11106 ?auto_11114 ) ) ( not ( = ?auto_11107 ?auto_11114 ) ) ( not ( = ?auto_11113 ?auto_11114 ) ) ( not ( = ?auto_11118 ?auto_11114 ) ) ( AVAILABLE ?auto_11110 ) ( TRUCK-AT ?auto_11116 ?auto_11108 ) ( not ( = ?auto_11108 ?auto_11109 ) ) ( not ( = ?auto_11111 ?auto_11108 ) ) ( HOIST-AT ?auto_11115 ?auto_11108 ) ( not ( = ?auto_11110 ?auto_11115 ) ) ( not ( = ?auto_11112 ?auto_11115 ) ) ( AVAILABLE ?auto_11115 ) ( SURFACE-AT ?auto_11105 ?auto_11108 ) ( ON ?auto_11105 ?auto_11117 ) ( CLEAR ?auto_11105 ) ( not ( = ?auto_11106 ?auto_11117 ) ) ( not ( = ?auto_11107 ?auto_11117 ) ) ( not ( = ?auto_11105 ?auto_11117 ) ) ( not ( = ?auto_11113 ?auto_11117 ) ) ( not ( = ?auto_11118 ?auto_11117 ) ) ( not ( = ?auto_11114 ?auto_11117 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11106 ?auto_11107 )
      ( MAKE-2CRATE-VERIFY ?auto_11105 ?auto_11106 ?auto_11107 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11119 - SURFACE
      ?auto_11120 - SURFACE
      ?auto_11121 - SURFACE
      ?auto_11122 - SURFACE
    )
    :vars
    (
      ?auto_11130 - HOIST
      ?auto_11131 - PLACE
      ?auto_11126 - PLACE
      ?auto_11123 - HOIST
      ?auto_11129 - SURFACE
      ?auto_11132 - SURFACE
      ?auto_11128 - TRUCK
      ?auto_11124 - PLACE
      ?auto_11127 - HOIST
      ?auto_11125 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11130 ?auto_11131 ) ( IS-CRATE ?auto_11122 ) ( not ( = ?auto_11121 ?auto_11122 ) ) ( not ( = ?auto_11120 ?auto_11121 ) ) ( not ( = ?auto_11120 ?auto_11122 ) ) ( not ( = ?auto_11126 ?auto_11131 ) ) ( HOIST-AT ?auto_11123 ?auto_11126 ) ( not ( = ?auto_11130 ?auto_11123 ) ) ( SURFACE-AT ?auto_11122 ?auto_11126 ) ( ON ?auto_11122 ?auto_11129 ) ( CLEAR ?auto_11122 ) ( not ( = ?auto_11121 ?auto_11129 ) ) ( not ( = ?auto_11122 ?auto_11129 ) ) ( not ( = ?auto_11120 ?auto_11129 ) ) ( IS-CRATE ?auto_11121 ) ( AVAILABLE ?auto_11123 ) ( SURFACE-AT ?auto_11121 ?auto_11126 ) ( ON ?auto_11121 ?auto_11132 ) ( CLEAR ?auto_11121 ) ( not ( = ?auto_11121 ?auto_11132 ) ) ( not ( = ?auto_11122 ?auto_11132 ) ) ( not ( = ?auto_11120 ?auto_11132 ) ) ( not ( = ?auto_11129 ?auto_11132 ) ) ( SURFACE-AT ?auto_11119 ?auto_11131 ) ( CLEAR ?auto_11119 ) ( IS-CRATE ?auto_11120 ) ( not ( = ?auto_11119 ?auto_11120 ) ) ( not ( = ?auto_11121 ?auto_11119 ) ) ( not ( = ?auto_11122 ?auto_11119 ) ) ( not ( = ?auto_11129 ?auto_11119 ) ) ( not ( = ?auto_11132 ?auto_11119 ) ) ( AVAILABLE ?auto_11130 ) ( TRUCK-AT ?auto_11128 ?auto_11124 ) ( not ( = ?auto_11124 ?auto_11131 ) ) ( not ( = ?auto_11126 ?auto_11124 ) ) ( HOIST-AT ?auto_11127 ?auto_11124 ) ( not ( = ?auto_11130 ?auto_11127 ) ) ( not ( = ?auto_11123 ?auto_11127 ) ) ( AVAILABLE ?auto_11127 ) ( SURFACE-AT ?auto_11120 ?auto_11124 ) ( ON ?auto_11120 ?auto_11125 ) ( CLEAR ?auto_11120 ) ( not ( = ?auto_11121 ?auto_11125 ) ) ( not ( = ?auto_11122 ?auto_11125 ) ) ( not ( = ?auto_11120 ?auto_11125 ) ) ( not ( = ?auto_11129 ?auto_11125 ) ) ( not ( = ?auto_11132 ?auto_11125 ) ) ( not ( = ?auto_11119 ?auto_11125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11120 ?auto_11121 ?auto_11122 )
      ( MAKE-3CRATE-VERIFY ?auto_11119 ?auto_11120 ?auto_11121 ?auto_11122 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11133 - SURFACE
      ?auto_11134 - SURFACE
      ?auto_11135 - SURFACE
      ?auto_11136 - SURFACE
      ?auto_11137 - SURFACE
    )
    :vars
    (
      ?auto_11145 - HOIST
      ?auto_11146 - PLACE
      ?auto_11141 - PLACE
      ?auto_11138 - HOIST
      ?auto_11144 - SURFACE
      ?auto_11147 - SURFACE
      ?auto_11143 - TRUCK
      ?auto_11139 - PLACE
      ?auto_11142 - HOIST
      ?auto_11140 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11145 ?auto_11146 ) ( IS-CRATE ?auto_11137 ) ( not ( = ?auto_11136 ?auto_11137 ) ) ( not ( = ?auto_11135 ?auto_11136 ) ) ( not ( = ?auto_11135 ?auto_11137 ) ) ( not ( = ?auto_11141 ?auto_11146 ) ) ( HOIST-AT ?auto_11138 ?auto_11141 ) ( not ( = ?auto_11145 ?auto_11138 ) ) ( SURFACE-AT ?auto_11137 ?auto_11141 ) ( ON ?auto_11137 ?auto_11144 ) ( CLEAR ?auto_11137 ) ( not ( = ?auto_11136 ?auto_11144 ) ) ( not ( = ?auto_11137 ?auto_11144 ) ) ( not ( = ?auto_11135 ?auto_11144 ) ) ( IS-CRATE ?auto_11136 ) ( AVAILABLE ?auto_11138 ) ( SURFACE-AT ?auto_11136 ?auto_11141 ) ( ON ?auto_11136 ?auto_11147 ) ( CLEAR ?auto_11136 ) ( not ( = ?auto_11136 ?auto_11147 ) ) ( not ( = ?auto_11137 ?auto_11147 ) ) ( not ( = ?auto_11135 ?auto_11147 ) ) ( not ( = ?auto_11144 ?auto_11147 ) ) ( SURFACE-AT ?auto_11134 ?auto_11146 ) ( CLEAR ?auto_11134 ) ( IS-CRATE ?auto_11135 ) ( not ( = ?auto_11134 ?auto_11135 ) ) ( not ( = ?auto_11136 ?auto_11134 ) ) ( not ( = ?auto_11137 ?auto_11134 ) ) ( not ( = ?auto_11144 ?auto_11134 ) ) ( not ( = ?auto_11147 ?auto_11134 ) ) ( AVAILABLE ?auto_11145 ) ( TRUCK-AT ?auto_11143 ?auto_11139 ) ( not ( = ?auto_11139 ?auto_11146 ) ) ( not ( = ?auto_11141 ?auto_11139 ) ) ( HOIST-AT ?auto_11142 ?auto_11139 ) ( not ( = ?auto_11145 ?auto_11142 ) ) ( not ( = ?auto_11138 ?auto_11142 ) ) ( AVAILABLE ?auto_11142 ) ( SURFACE-AT ?auto_11135 ?auto_11139 ) ( ON ?auto_11135 ?auto_11140 ) ( CLEAR ?auto_11135 ) ( not ( = ?auto_11136 ?auto_11140 ) ) ( not ( = ?auto_11137 ?auto_11140 ) ) ( not ( = ?auto_11135 ?auto_11140 ) ) ( not ( = ?auto_11144 ?auto_11140 ) ) ( not ( = ?auto_11147 ?auto_11140 ) ) ( not ( = ?auto_11134 ?auto_11140 ) ) ( ON ?auto_11134 ?auto_11133 ) ( not ( = ?auto_11133 ?auto_11134 ) ) ( not ( = ?auto_11133 ?auto_11135 ) ) ( not ( = ?auto_11133 ?auto_11136 ) ) ( not ( = ?auto_11133 ?auto_11137 ) ) ( not ( = ?auto_11133 ?auto_11144 ) ) ( not ( = ?auto_11133 ?auto_11147 ) ) ( not ( = ?auto_11133 ?auto_11140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11135 ?auto_11136 ?auto_11137 )
      ( MAKE-4CRATE-VERIFY ?auto_11133 ?auto_11134 ?auto_11135 ?auto_11136 ?auto_11137 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11148 - SURFACE
      ?auto_11149 - SURFACE
    )
    :vars
    (
      ?auto_11158 - HOIST
      ?auto_11159 - PLACE
      ?auto_11161 - SURFACE
      ?auto_11154 - PLACE
      ?auto_11150 - HOIST
      ?auto_11157 - SURFACE
      ?auto_11160 - SURFACE
      ?auto_11151 - SURFACE
      ?auto_11152 - PLACE
      ?auto_11155 - HOIST
      ?auto_11153 - SURFACE
      ?auto_11156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11158 ?auto_11159 ) ( IS-CRATE ?auto_11149 ) ( not ( = ?auto_11148 ?auto_11149 ) ) ( not ( = ?auto_11161 ?auto_11148 ) ) ( not ( = ?auto_11161 ?auto_11149 ) ) ( not ( = ?auto_11154 ?auto_11159 ) ) ( HOIST-AT ?auto_11150 ?auto_11154 ) ( not ( = ?auto_11158 ?auto_11150 ) ) ( SURFACE-AT ?auto_11149 ?auto_11154 ) ( ON ?auto_11149 ?auto_11157 ) ( CLEAR ?auto_11149 ) ( not ( = ?auto_11148 ?auto_11157 ) ) ( not ( = ?auto_11149 ?auto_11157 ) ) ( not ( = ?auto_11161 ?auto_11157 ) ) ( IS-CRATE ?auto_11148 ) ( AVAILABLE ?auto_11150 ) ( SURFACE-AT ?auto_11148 ?auto_11154 ) ( ON ?auto_11148 ?auto_11160 ) ( CLEAR ?auto_11148 ) ( not ( = ?auto_11148 ?auto_11160 ) ) ( not ( = ?auto_11149 ?auto_11160 ) ) ( not ( = ?auto_11161 ?auto_11160 ) ) ( not ( = ?auto_11157 ?auto_11160 ) ) ( SURFACE-AT ?auto_11151 ?auto_11159 ) ( CLEAR ?auto_11151 ) ( IS-CRATE ?auto_11161 ) ( not ( = ?auto_11151 ?auto_11161 ) ) ( not ( = ?auto_11148 ?auto_11151 ) ) ( not ( = ?auto_11149 ?auto_11151 ) ) ( not ( = ?auto_11157 ?auto_11151 ) ) ( not ( = ?auto_11160 ?auto_11151 ) ) ( AVAILABLE ?auto_11158 ) ( not ( = ?auto_11152 ?auto_11159 ) ) ( not ( = ?auto_11154 ?auto_11152 ) ) ( HOIST-AT ?auto_11155 ?auto_11152 ) ( not ( = ?auto_11158 ?auto_11155 ) ) ( not ( = ?auto_11150 ?auto_11155 ) ) ( AVAILABLE ?auto_11155 ) ( SURFACE-AT ?auto_11161 ?auto_11152 ) ( ON ?auto_11161 ?auto_11153 ) ( CLEAR ?auto_11161 ) ( not ( = ?auto_11148 ?auto_11153 ) ) ( not ( = ?auto_11149 ?auto_11153 ) ) ( not ( = ?auto_11161 ?auto_11153 ) ) ( not ( = ?auto_11157 ?auto_11153 ) ) ( not ( = ?auto_11160 ?auto_11153 ) ) ( not ( = ?auto_11151 ?auto_11153 ) ) ( TRUCK-AT ?auto_11156 ?auto_11159 ) )
    :subtasks
    ( ( !DRIVE ?auto_11156 ?auto_11159 ?auto_11152 )
      ( MAKE-2CRATE ?auto_11161 ?auto_11148 ?auto_11149 )
      ( MAKE-1CRATE-VERIFY ?auto_11148 ?auto_11149 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11162 - SURFACE
      ?auto_11163 - SURFACE
      ?auto_11164 - SURFACE
    )
    :vars
    (
      ?auto_11167 - HOIST
      ?auto_11165 - PLACE
      ?auto_11168 - PLACE
      ?auto_11173 - HOIST
      ?auto_11166 - SURFACE
      ?auto_11169 - SURFACE
      ?auto_11171 - SURFACE
      ?auto_11170 - PLACE
      ?auto_11172 - HOIST
      ?auto_11174 - SURFACE
      ?auto_11175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11167 ?auto_11165 ) ( IS-CRATE ?auto_11164 ) ( not ( = ?auto_11163 ?auto_11164 ) ) ( not ( = ?auto_11162 ?auto_11163 ) ) ( not ( = ?auto_11162 ?auto_11164 ) ) ( not ( = ?auto_11168 ?auto_11165 ) ) ( HOIST-AT ?auto_11173 ?auto_11168 ) ( not ( = ?auto_11167 ?auto_11173 ) ) ( SURFACE-AT ?auto_11164 ?auto_11168 ) ( ON ?auto_11164 ?auto_11166 ) ( CLEAR ?auto_11164 ) ( not ( = ?auto_11163 ?auto_11166 ) ) ( not ( = ?auto_11164 ?auto_11166 ) ) ( not ( = ?auto_11162 ?auto_11166 ) ) ( IS-CRATE ?auto_11163 ) ( AVAILABLE ?auto_11173 ) ( SURFACE-AT ?auto_11163 ?auto_11168 ) ( ON ?auto_11163 ?auto_11169 ) ( CLEAR ?auto_11163 ) ( not ( = ?auto_11163 ?auto_11169 ) ) ( not ( = ?auto_11164 ?auto_11169 ) ) ( not ( = ?auto_11162 ?auto_11169 ) ) ( not ( = ?auto_11166 ?auto_11169 ) ) ( SURFACE-AT ?auto_11171 ?auto_11165 ) ( CLEAR ?auto_11171 ) ( IS-CRATE ?auto_11162 ) ( not ( = ?auto_11171 ?auto_11162 ) ) ( not ( = ?auto_11163 ?auto_11171 ) ) ( not ( = ?auto_11164 ?auto_11171 ) ) ( not ( = ?auto_11166 ?auto_11171 ) ) ( not ( = ?auto_11169 ?auto_11171 ) ) ( AVAILABLE ?auto_11167 ) ( not ( = ?auto_11170 ?auto_11165 ) ) ( not ( = ?auto_11168 ?auto_11170 ) ) ( HOIST-AT ?auto_11172 ?auto_11170 ) ( not ( = ?auto_11167 ?auto_11172 ) ) ( not ( = ?auto_11173 ?auto_11172 ) ) ( AVAILABLE ?auto_11172 ) ( SURFACE-AT ?auto_11162 ?auto_11170 ) ( ON ?auto_11162 ?auto_11174 ) ( CLEAR ?auto_11162 ) ( not ( = ?auto_11163 ?auto_11174 ) ) ( not ( = ?auto_11164 ?auto_11174 ) ) ( not ( = ?auto_11162 ?auto_11174 ) ) ( not ( = ?auto_11166 ?auto_11174 ) ) ( not ( = ?auto_11169 ?auto_11174 ) ) ( not ( = ?auto_11171 ?auto_11174 ) ) ( TRUCK-AT ?auto_11175 ?auto_11165 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11163 ?auto_11164 )
      ( MAKE-2CRATE-VERIFY ?auto_11162 ?auto_11163 ?auto_11164 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11176 - SURFACE
      ?auto_11177 - SURFACE
      ?auto_11178 - SURFACE
      ?auto_11179 - SURFACE
    )
    :vars
    (
      ?auto_11180 - HOIST
      ?auto_11185 - PLACE
      ?auto_11184 - PLACE
      ?auto_11181 - HOIST
      ?auto_11186 - SURFACE
      ?auto_11183 - SURFACE
      ?auto_11182 - PLACE
      ?auto_11189 - HOIST
      ?auto_11187 - SURFACE
      ?auto_11188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11180 ?auto_11185 ) ( IS-CRATE ?auto_11179 ) ( not ( = ?auto_11178 ?auto_11179 ) ) ( not ( = ?auto_11177 ?auto_11178 ) ) ( not ( = ?auto_11177 ?auto_11179 ) ) ( not ( = ?auto_11184 ?auto_11185 ) ) ( HOIST-AT ?auto_11181 ?auto_11184 ) ( not ( = ?auto_11180 ?auto_11181 ) ) ( SURFACE-AT ?auto_11179 ?auto_11184 ) ( ON ?auto_11179 ?auto_11186 ) ( CLEAR ?auto_11179 ) ( not ( = ?auto_11178 ?auto_11186 ) ) ( not ( = ?auto_11179 ?auto_11186 ) ) ( not ( = ?auto_11177 ?auto_11186 ) ) ( IS-CRATE ?auto_11178 ) ( AVAILABLE ?auto_11181 ) ( SURFACE-AT ?auto_11178 ?auto_11184 ) ( ON ?auto_11178 ?auto_11183 ) ( CLEAR ?auto_11178 ) ( not ( = ?auto_11178 ?auto_11183 ) ) ( not ( = ?auto_11179 ?auto_11183 ) ) ( not ( = ?auto_11177 ?auto_11183 ) ) ( not ( = ?auto_11186 ?auto_11183 ) ) ( SURFACE-AT ?auto_11176 ?auto_11185 ) ( CLEAR ?auto_11176 ) ( IS-CRATE ?auto_11177 ) ( not ( = ?auto_11176 ?auto_11177 ) ) ( not ( = ?auto_11178 ?auto_11176 ) ) ( not ( = ?auto_11179 ?auto_11176 ) ) ( not ( = ?auto_11186 ?auto_11176 ) ) ( not ( = ?auto_11183 ?auto_11176 ) ) ( AVAILABLE ?auto_11180 ) ( not ( = ?auto_11182 ?auto_11185 ) ) ( not ( = ?auto_11184 ?auto_11182 ) ) ( HOIST-AT ?auto_11189 ?auto_11182 ) ( not ( = ?auto_11180 ?auto_11189 ) ) ( not ( = ?auto_11181 ?auto_11189 ) ) ( AVAILABLE ?auto_11189 ) ( SURFACE-AT ?auto_11177 ?auto_11182 ) ( ON ?auto_11177 ?auto_11187 ) ( CLEAR ?auto_11177 ) ( not ( = ?auto_11178 ?auto_11187 ) ) ( not ( = ?auto_11179 ?auto_11187 ) ) ( not ( = ?auto_11177 ?auto_11187 ) ) ( not ( = ?auto_11186 ?auto_11187 ) ) ( not ( = ?auto_11183 ?auto_11187 ) ) ( not ( = ?auto_11176 ?auto_11187 ) ) ( TRUCK-AT ?auto_11188 ?auto_11185 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11177 ?auto_11178 ?auto_11179 )
      ( MAKE-3CRATE-VERIFY ?auto_11176 ?auto_11177 ?auto_11178 ?auto_11179 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11190 - SURFACE
      ?auto_11191 - SURFACE
      ?auto_11192 - SURFACE
      ?auto_11193 - SURFACE
      ?auto_11194 - SURFACE
    )
    :vars
    (
      ?auto_11195 - HOIST
      ?auto_11200 - PLACE
      ?auto_11199 - PLACE
      ?auto_11196 - HOIST
      ?auto_11201 - SURFACE
      ?auto_11198 - SURFACE
      ?auto_11197 - PLACE
      ?auto_11204 - HOIST
      ?auto_11202 - SURFACE
      ?auto_11203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11195 ?auto_11200 ) ( IS-CRATE ?auto_11194 ) ( not ( = ?auto_11193 ?auto_11194 ) ) ( not ( = ?auto_11192 ?auto_11193 ) ) ( not ( = ?auto_11192 ?auto_11194 ) ) ( not ( = ?auto_11199 ?auto_11200 ) ) ( HOIST-AT ?auto_11196 ?auto_11199 ) ( not ( = ?auto_11195 ?auto_11196 ) ) ( SURFACE-AT ?auto_11194 ?auto_11199 ) ( ON ?auto_11194 ?auto_11201 ) ( CLEAR ?auto_11194 ) ( not ( = ?auto_11193 ?auto_11201 ) ) ( not ( = ?auto_11194 ?auto_11201 ) ) ( not ( = ?auto_11192 ?auto_11201 ) ) ( IS-CRATE ?auto_11193 ) ( AVAILABLE ?auto_11196 ) ( SURFACE-AT ?auto_11193 ?auto_11199 ) ( ON ?auto_11193 ?auto_11198 ) ( CLEAR ?auto_11193 ) ( not ( = ?auto_11193 ?auto_11198 ) ) ( not ( = ?auto_11194 ?auto_11198 ) ) ( not ( = ?auto_11192 ?auto_11198 ) ) ( not ( = ?auto_11201 ?auto_11198 ) ) ( SURFACE-AT ?auto_11191 ?auto_11200 ) ( CLEAR ?auto_11191 ) ( IS-CRATE ?auto_11192 ) ( not ( = ?auto_11191 ?auto_11192 ) ) ( not ( = ?auto_11193 ?auto_11191 ) ) ( not ( = ?auto_11194 ?auto_11191 ) ) ( not ( = ?auto_11201 ?auto_11191 ) ) ( not ( = ?auto_11198 ?auto_11191 ) ) ( AVAILABLE ?auto_11195 ) ( not ( = ?auto_11197 ?auto_11200 ) ) ( not ( = ?auto_11199 ?auto_11197 ) ) ( HOIST-AT ?auto_11204 ?auto_11197 ) ( not ( = ?auto_11195 ?auto_11204 ) ) ( not ( = ?auto_11196 ?auto_11204 ) ) ( AVAILABLE ?auto_11204 ) ( SURFACE-AT ?auto_11192 ?auto_11197 ) ( ON ?auto_11192 ?auto_11202 ) ( CLEAR ?auto_11192 ) ( not ( = ?auto_11193 ?auto_11202 ) ) ( not ( = ?auto_11194 ?auto_11202 ) ) ( not ( = ?auto_11192 ?auto_11202 ) ) ( not ( = ?auto_11201 ?auto_11202 ) ) ( not ( = ?auto_11198 ?auto_11202 ) ) ( not ( = ?auto_11191 ?auto_11202 ) ) ( TRUCK-AT ?auto_11203 ?auto_11200 ) ( ON ?auto_11191 ?auto_11190 ) ( not ( = ?auto_11190 ?auto_11191 ) ) ( not ( = ?auto_11190 ?auto_11192 ) ) ( not ( = ?auto_11190 ?auto_11193 ) ) ( not ( = ?auto_11190 ?auto_11194 ) ) ( not ( = ?auto_11190 ?auto_11201 ) ) ( not ( = ?auto_11190 ?auto_11198 ) ) ( not ( = ?auto_11190 ?auto_11202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11192 ?auto_11193 ?auto_11194 )
      ( MAKE-4CRATE-VERIFY ?auto_11190 ?auto_11191 ?auto_11192 ?auto_11193 ?auto_11194 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11205 - SURFACE
      ?auto_11206 - SURFACE
    )
    :vars
    (
      ?auto_11207 - HOIST
      ?auto_11213 - PLACE
      ?auto_11208 - SURFACE
      ?auto_11212 - PLACE
      ?auto_11209 - HOIST
      ?auto_11215 - SURFACE
      ?auto_11211 - SURFACE
      ?auto_11214 - SURFACE
      ?auto_11210 - PLACE
      ?auto_11218 - HOIST
      ?auto_11216 - SURFACE
      ?auto_11217 - TRUCK
      ?auto_11219 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11207 ?auto_11213 ) ( IS-CRATE ?auto_11206 ) ( not ( = ?auto_11205 ?auto_11206 ) ) ( not ( = ?auto_11208 ?auto_11205 ) ) ( not ( = ?auto_11208 ?auto_11206 ) ) ( not ( = ?auto_11212 ?auto_11213 ) ) ( HOIST-AT ?auto_11209 ?auto_11212 ) ( not ( = ?auto_11207 ?auto_11209 ) ) ( SURFACE-AT ?auto_11206 ?auto_11212 ) ( ON ?auto_11206 ?auto_11215 ) ( CLEAR ?auto_11206 ) ( not ( = ?auto_11205 ?auto_11215 ) ) ( not ( = ?auto_11206 ?auto_11215 ) ) ( not ( = ?auto_11208 ?auto_11215 ) ) ( IS-CRATE ?auto_11205 ) ( AVAILABLE ?auto_11209 ) ( SURFACE-AT ?auto_11205 ?auto_11212 ) ( ON ?auto_11205 ?auto_11211 ) ( CLEAR ?auto_11205 ) ( not ( = ?auto_11205 ?auto_11211 ) ) ( not ( = ?auto_11206 ?auto_11211 ) ) ( not ( = ?auto_11208 ?auto_11211 ) ) ( not ( = ?auto_11215 ?auto_11211 ) ) ( IS-CRATE ?auto_11208 ) ( not ( = ?auto_11214 ?auto_11208 ) ) ( not ( = ?auto_11205 ?auto_11214 ) ) ( not ( = ?auto_11206 ?auto_11214 ) ) ( not ( = ?auto_11215 ?auto_11214 ) ) ( not ( = ?auto_11211 ?auto_11214 ) ) ( not ( = ?auto_11210 ?auto_11213 ) ) ( not ( = ?auto_11212 ?auto_11210 ) ) ( HOIST-AT ?auto_11218 ?auto_11210 ) ( not ( = ?auto_11207 ?auto_11218 ) ) ( not ( = ?auto_11209 ?auto_11218 ) ) ( AVAILABLE ?auto_11218 ) ( SURFACE-AT ?auto_11208 ?auto_11210 ) ( ON ?auto_11208 ?auto_11216 ) ( CLEAR ?auto_11208 ) ( not ( = ?auto_11205 ?auto_11216 ) ) ( not ( = ?auto_11206 ?auto_11216 ) ) ( not ( = ?auto_11208 ?auto_11216 ) ) ( not ( = ?auto_11215 ?auto_11216 ) ) ( not ( = ?auto_11211 ?auto_11216 ) ) ( not ( = ?auto_11214 ?auto_11216 ) ) ( TRUCK-AT ?auto_11217 ?auto_11213 ) ( SURFACE-AT ?auto_11219 ?auto_11213 ) ( CLEAR ?auto_11219 ) ( LIFTING ?auto_11207 ?auto_11214 ) ( IS-CRATE ?auto_11214 ) ( not ( = ?auto_11219 ?auto_11214 ) ) ( not ( = ?auto_11205 ?auto_11219 ) ) ( not ( = ?auto_11206 ?auto_11219 ) ) ( not ( = ?auto_11208 ?auto_11219 ) ) ( not ( = ?auto_11215 ?auto_11219 ) ) ( not ( = ?auto_11211 ?auto_11219 ) ) ( not ( = ?auto_11216 ?auto_11219 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11219 ?auto_11214 )
      ( MAKE-2CRATE ?auto_11208 ?auto_11205 ?auto_11206 )
      ( MAKE-1CRATE-VERIFY ?auto_11205 ?auto_11206 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11220 - SURFACE
      ?auto_11221 - SURFACE
      ?auto_11222 - SURFACE
    )
    :vars
    (
      ?auto_11224 - HOIST
      ?auto_11231 - PLACE
      ?auto_11230 - PLACE
      ?auto_11229 - HOIST
      ?auto_11233 - SURFACE
      ?auto_11234 - SURFACE
      ?auto_11225 - SURFACE
      ?auto_11228 - PLACE
      ?auto_11232 - HOIST
      ?auto_11227 - SURFACE
      ?auto_11226 - TRUCK
      ?auto_11223 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11224 ?auto_11231 ) ( IS-CRATE ?auto_11222 ) ( not ( = ?auto_11221 ?auto_11222 ) ) ( not ( = ?auto_11220 ?auto_11221 ) ) ( not ( = ?auto_11220 ?auto_11222 ) ) ( not ( = ?auto_11230 ?auto_11231 ) ) ( HOIST-AT ?auto_11229 ?auto_11230 ) ( not ( = ?auto_11224 ?auto_11229 ) ) ( SURFACE-AT ?auto_11222 ?auto_11230 ) ( ON ?auto_11222 ?auto_11233 ) ( CLEAR ?auto_11222 ) ( not ( = ?auto_11221 ?auto_11233 ) ) ( not ( = ?auto_11222 ?auto_11233 ) ) ( not ( = ?auto_11220 ?auto_11233 ) ) ( IS-CRATE ?auto_11221 ) ( AVAILABLE ?auto_11229 ) ( SURFACE-AT ?auto_11221 ?auto_11230 ) ( ON ?auto_11221 ?auto_11234 ) ( CLEAR ?auto_11221 ) ( not ( = ?auto_11221 ?auto_11234 ) ) ( not ( = ?auto_11222 ?auto_11234 ) ) ( not ( = ?auto_11220 ?auto_11234 ) ) ( not ( = ?auto_11233 ?auto_11234 ) ) ( IS-CRATE ?auto_11220 ) ( not ( = ?auto_11225 ?auto_11220 ) ) ( not ( = ?auto_11221 ?auto_11225 ) ) ( not ( = ?auto_11222 ?auto_11225 ) ) ( not ( = ?auto_11233 ?auto_11225 ) ) ( not ( = ?auto_11234 ?auto_11225 ) ) ( not ( = ?auto_11228 ?auto_11231 ) ) ( not ( = ?auto_11230 ?auto_11228 ) ) ( HOIST-AT ?auto_11232 ?auto_11228 ) ( not ( = ?auto_11224 ?auto_11232 ) ) ( not ( = ?auto_11229 ?auto_11232 ) ) ( AVAILABLE ?auto_11232 ) ( SURFACE-AT ?auto_11220 ?auto_11228 ) ( ON ?auto_11220 ?auto_11227 ) ( CLEAR ?auto_11220 ) ( not ( = ?auto_11221 ?auto_11227 ) ) ( not ( = ?auto_11222 ?auto_11227 ) ) ( not ( = ?auto_11220 ?auto_11227 ) ) ( not ( = ?auto_11233 ?auto_11227 ) ) ( not ( = ?auto_11234 ?auto_11227 ) ) ( not ( = ?auto_11225 ?auto_11227 ) ) ( TRUCK-AT ?auto_11226 ?auto_11231 ) ( SURFACE-AT ?auto_11223 ?auto_11231 ) ( CLEAR ?auto_11223 ) ( LIFTING ?auto_11224 ?auto_11225 ) ( IS-CRATE ?auto_11225 ) ( not ( = ?auto_11223 ?auto_11225 ) ) ( not ( = ?auto_11221 ?auto_11223 ) ) ( not ( = ?auto_11222 ?auto_11223 ) ) ( not ( = ?auto_11220 ?auto_11223 ) ) ( not ( = ?auto_11233 ?auto_11223 ) ) ( not ( = ?auto_11234 ?auto_11223 ) ) ( not ( = ?auto_11227 ?auto_11223 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11221 ?auto_11222 )
      ( MAKE-2CRATE-VERIFY ?auto_11220 ?auto_11221 ?auto_11222 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11235 - SURFACE
      ?auto_11236 - SURFACE
      ?auto_11237 - SURFACE
      ?auto_11238 - SURFACE
    )
    :vars
    (
      ?auto_11246 - HOIST
      ?auto_11242 - PLACE
      ?auto_11240 - PLACE
      ?auto_11244 - HOIST
      ?auto_11247 - SURFACE
      ?auto_11239 - SURFACE
      ?auto_11248 - PLACE
      ?auto_11241 - HOIST
      ?auto_11249 - SURFACE
      ?auto_11243 - TRUCK
      ?auto_11245 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11246 ?auto_11242 ) ( IS-CRATE ?auto_11238 ) ( not ( = ?auto_11237 ?auto_11238 ) ) ( not ( = ?auto_11236 ?auto_11237 ) ) ( not ( = ?auto_11236 ?auto_11238 ) ) ( not ( = ?auto_11240 ?auto_11242 ) ) ( HOIST-AT ?auto_11244 ?auto_11240 ) ( not ( = ?auto_11246 ?auto_11244 ) ) ( SURFACE-AT ?auto_11238 ?auto_11240 ) ( ON ?auto_11238 ?auto_11247 ) ( CLEAR ?auto_11238 ) ( not ( = ?auto_11237 ?auto_11247 ) ) ( not ( = ?auto_11238 ?auto_11247 ) ) ( not ( = ?auto_11236 ?auto_11247 ) ) ( IS-CRATE ?auto_11237 ) ( AVAILABLE ?auto_11244 ) ( SURFACE-AT ?auto_11237 ?auto_11240 ) ( ON ?auto_11237 ?auto_11239 ) ( CLEAR ?auto_11237 ) ( not ( = ?auto_11237 ?auto_11239 ) ) ( not ( = ?auto_11238 ?auto_11239 ) ) ( not ( = ?auto_11236 ?auto_11239 ) ) ( not ( = ?auto_11247 ?auto_11239 ) ) ( IS-CRATE ?auto_11236 ) ( not ( = ?auto_11235 ?auto_11236 ) ) ( not ( = ?auto_11237 ?auto_11235 ) ) ( not ( = ?auto_11238 ?auto_11235 ) ) ( not ( = ?auto_11247 ?auto_11235 ) ) ( not ( = ?auto_11239 ?auto_11235 ) ) ( not ( = ?auto_11248 ?auto_11242 ) ) ( not ( = ?auto_11240 ?auto_11248 ) ) ( HOIST-AT ?auto_11241 ?auto_11248 ) ( not ( = ?auto_11246 ?auto_11241 ) ) ( not ( = ?auto_11244 ?auto_11241 ) ) ( AVAILABLE ?auto_11241 ) ( SURFACE-AT ?auto_11236 ?auto_11248 ) ( ON ?auto_11236 ?auto_11249 ) ( CLEAR ?auto_11236 ) ( not ( = ?auto_11237 ?auto_11249 ) ) ( not ( = ?auto_11238 ?auto_11249 ) ) ( not ( = ?auto_11236 ?auto_11249 ) ) ( not ( = ?auto_11247 ?auto_11249 ) ) ( not ( = ?auto_11239 ?auto_11249 ) ) ( not ( = ?auto_11235 ?auto_11249 ) ) ( TRUCK-AT ?auto_11243 ?auto_11242 ) ( SURFACE-AT ?auto_11245 ?auto_11242 ) ( CLEAR ?auto_11245 ) ( LIFTING ?auto_11246 ?auto_11235 ) ( IS-CRATE ?auto_11235 ) ( not ( = ?auto_11245 ?auto_11235 ) ) ( not ( = ?auto_11237 ?auto_11245 ) ) ( not ( = ?auto_11238 ?auto_11245 ) ) ( not ( = ?auto_11236 ?auto_11245 ) ) ( not ( = ?auto_11247 ?auto_11245 ) ) ( not ( = ?auto_11239 ?auto_11245 ) ) ( not ( = ?auto_11249 ?auto_11245 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11236 ?auto_11237 ?auto_11238 )
      ( MAKE-3CRATE-VERIFY ?auto_11235 ?auto_11236 ?auto_11237 ?auto_11238 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11250 - SURFACE
      ?auto_11251 - SURFACE
      ?auto_11252 - SURFACE
      ?auto_11253 - SURFACE
      ?auto_11254 - SURFACE
    )
    :vars
    (
      ?auto_11261 - HOIST
      ?auto_11258 - PLACE
      ?auto_11256 - PLACE
      ?auto_11260 - HOIST
      ?auto_11262 - SURFACE
      ?auto_11255 - SURFACE
      ?auto_11263 - PLACE
      ?auto_11257 - HOIST
      ?auto_11264 - SURFACE
      ?auto_11259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11261 ?auto_11258 ) ( IS-CRATE ?auto_11254 ) ( not ( = ?auto_11253 ?auto_11254 ) ) ( not ( = ?auto_11252 ?auto_11253 ) ) ( not ( = ?auto_11252 ?auto_11254 ) ) ( not ( = ?auto_11256 ?auto_11258 ) ) ( HOIST-AT ?auto_11260 ?auto_11256 ) ( not ( = ?auto_11261 ?auto_11260 ) ) ( SURFACE-AT ?auto_11254 ?auto_11256 ) ( ON ?auto_11254 ?auto_11262 ) ( CLEAR ?auto_11254 ) ( not ( = ?auto_11253 ?auto_11262 ) ) ( not ( = ?auto_11254 ?auto_11262 ) ) ( not ( = ?auto_11252 ?auto_11262 ) ) ( IS-CRATE ?auto_11253 ) ( AVAILABLE ?auto_11260 ) ( SURFACE-AT ?auto_11253 ?auto_11256 ) ( ON ?auto_11253 ?auto_11255 ) ( CLEAR ?auto_11253 ) ( not ( = ?auto_11253 ?auto_11255 ) ) ( not ( = ?auto_11254 ?auto_11255 ) ) ( not ( = ?auto_11252 ?auto_11255 ) ) ( not ( = ?auto_11262 ?auto_11255 ) ) ( IS-CRATE ?auto_11252 ) ( not ( = ?auto_11251 ?auto_11252 ) ) ( not ( = ?auto_11253 ?auto_11251 ) ) ( not ( = ?auto_11254 ?auto_11251 ) ) ( not ( = ?auto_11262 ?auto_11251 ) ) ( not ( = ?auto_11255 ?auto_11251 ) ) ( not ( = ?auto_11263 ?auto_11258 ) ) ( not ( = ?auto_11256 ?auto_11263 ) ) ( HOIST-AT ?auto_11257 ?auto_11263 ) ( not ( = ?auto_11261 ?auto_11257 ) ) ( not ( = ?auto_11260 ?auto_11257 ) ) ( AVAILABLE ?auto_11257 ) ( SURFACE-AT ?auto_11252 ?auto_11263 ) ( ON ?auto_11252 ?auto_11264 ) ( CLEAR ?auto_11252 ) ( not ( = ?auto_11253 ?auto_11264 ) ) ( not ( = ?auto_11254 ?auto_11264 ) ) ( not ( = ?auto_11252 ?auto_11264 ) ) ( not ( = ?auto_11262 ?auto_11264 ) ) ( not ( = ?auto_11255 ?auto_11264 ) ) ( not ( = ?auto_11251 ?auto_11264 ) ) ( TRUCK-AT ?auto_11259 ?auto_11258 ) ( SURFACE-AT ?auto_11250 ?auto_11258 ) ( CLEAR ?auto_11250 ) ( LIFTING ?auto_11261 ?auto_11251 ) ( IS-CRATE ?auto_11251 ) ( not ( = ?auto_11250 ?auto_11251 ) ) ( not ( = ?auto_11253 ?auto_11250 ) ) ( not ( = ?auto_11254 ?auto_11250 ) ) ( not ( = ?auto_11252 ?auto_11250 ) ) ( not ( = ?auto_11262 ?auto_11250 ) ) ( not ( = ?auto_11255 ?auto_11250 ) ) ( not ( = ?auto_11264 ?auto_11250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11252 ?auto_11253 ?auto_11254 )
      ( MAKE-4CRATE-VERIFY ?auto_11250 ?auto_11251 ?auto_11252 ?auto_11253 ?auto_11254 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11265 - SURFACE
      ?auto_11266 - SURFACE
    )
    :vars
    (
      ?auto_11276 - HOIST
      ?auto_11272 - PLACE
      ?auto_11269 - SURFACE
      ?auto_11268 - PLACE
      ?auto_11274 - HOIST
      ?auto_11277 - SURFACE
      ?auto_11267 - SURFACE
      ?auto_11270 - SURFACE
      ?auto_11278 - PLACE
      ?auto_11271 - HOIST
      ?auto_11279 - SURFACE
      ?auto_11273 - TRUCK
      ?auto_11275 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11276 ?auto_11272 ) ( IS-CRATE ?auto_11266 ) ( not ( = ?auto_11265 ?auto_11266 ) ) ( not ( = ?auto_11269 ?auto_11265 ) ) ( not ( = ?auto_11269 ?auto_11266 ) ) ( not ( = ?auto_11268 ?auto_11272 ) ) ( HOIST-AT ?auto_11274 ?auto_11268 ) ( not ( = ?auto_11276 ?auto_11274 ) ) ( SURFACE-AT ?auto_11266 ?auto_11268 ) ( ON ?auto_11266 ?auto_11277 ) ( CLEAR ?auto_11266 ) ( not ( = ?auto_11265 ?auto_11277 ) ) ( not ( = ?auto_11266 ?auto_11277 ) ) ( not ( = ?auto_11269 ?auto_11277 ) ) ( IS-CRATE ?auto_11265 ) ( AVAILABLE ?auto_11274 ) ( SURFACE-AT ?auto_11265 ?auto_11268 ) ( ON ?auto_11265 ?auto_11267 ) ( CLEAR ?auto_11265 ) ( not ( = ?auto_11265 ?auto_11267 ) ) ( not ( = ?auto_11266 ?auto_11267 ) ) ( not ( = ?auto_11269 ?auto_11267 ) ) ( not ( = ?auto_11277 ?auto_11267 ) ) ( IS-CRATE ?auto_11269 ) ( not ( = ?auto_11270 ?auto_11269 ) ) ( not ( = ?auto_11265 ?auto_11270 ) ) ( not ( = ?auto_11266 ?auto_11270 ) ) ( not ( = ?auto_11277 ?auto_11270 ) ) ( not ( = ?auto_11267 ?auto_11270 ) ) ( not ( = ?auto_11278 ?auto_11272 ) ) ( not ( = ?auto_11268 ?auto_11278 ) ) ( HOIST-AT ?auto_11271 ?auto_11278 ) ( not ( = ?auto_11276 ?auto_11271 ) ) ( not ( = ?auto_11274 ?auto_11271 ) ) ( AVAILABLE ?auto_11271 ) ( SURFACE-AT ?auto_11269 ?auto_11278 ) ( ON ?auto_11269 ?auto_11279 ) ( CLEAR ?auto_11269 ) ( not ( = ?auto_11265 ?auto_11279 ) ) ( not ( = ?auto_11266 ?auto_11279 ) ) ( not ( = ?auto_11269 ?auto_11279 ) ) ( not ( = ?auto_11277 ?auto_11279 ) ) ( not ( = ?auto_11267 ?auto_11279 ) ) ( not ( = ?auto_11270 ?auto_11279 ) ) ( TRUCK-AT ?auto_11273 ?auto_11272 ) ( SURFACE-AT ?auto_11275 ?auto_11272 ) ( CLEAR ?auto_11275 ) ( IS-CRATE ?auto_11270 ) ( not ( = ?auto_11275 ?auto_11270 ) ) ( not ( = ?auto_11265 ?auto_11275 ) ) ( not ( = ?auto_11266 ?auto_11275 ) ) ( not ( = ?auto_11269 ?auto_11275 ) ) ( not ( = ?auto_11277 ?auto_11275 ) ) ( not ( = ?auto_11267 ?auto_11275 ) ) ( not ( = ?auto_11279 ?auto_11275 ) ) ( AVAILABLE ?auto_11276 ) ( IN ?auto_11270 ?auto_11273 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11276 ?auto_11270 ?auto_11273 ?auto_11272 )
      ( MAKE-2CRATE ?auto_11269 ?auto_11265 ?auto_11266 )
      ( MAKE-1CRATE-VERIFY ?auto_11265 ?auto_11266 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11280 - SURFACE
      ?auto_11281 - SURFACE
      ?auto_11282 - SURFACE
    )
    :vars
    (
      ?auto_11285 - HOIST
      ?auto_11293 - PLACE
      ?auto_11290 - PLACE
      ?auto_11286 - HOIST
      ?auto_11292 - SURFACE
      ?auto_11287 - SURFACE
      ?auto_11294 - SURFACE
      ?auto_11289 - PLACE
      ?auto_11288 - HOIST
      ?auto_11283 - SURFACE
      ?auto_11291 - TRUCK
      ?auto_11284 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11285 ?auto_11293 ) ( IS-CRATE ?auto_11282 ) ( not ( = ?auto_11281 ?auto_11282 ) ) ( not ( = ?auto_11280 ?auto_11281 ) ) ( not ( = ?auto_11280 ?auto_11282 ) ) ( not ( = ?auto_11290 ?auto_11293 ) ) ( HOIST-AT ?auto_11286 ?auto_11290 ) ( not ( = ?auto_11285 ?auto_11286 ) ) ( SURFACE-AT ?auto_11282 ?auto_11290 ) ( ON ?auto_11282 ?auto_11292 ) ( CLEAR ?auto_11282 ) ( not ( = ?auto_11281 ?auto_11292 ) ) ( not ( = ?auto_11282 ?auto_11292 ) ) ( not ( = ?auto_11280 ?auto_11292 ) ) ( IS-CRATE ?auto_11281 ) ( AVAILABLE ?auto_11286 ) ( SURFACE-AT ?auto_11281 ?auto_11290 ) ( ON ?auto_11281 ?auto_11287 ) ( CLEAR ?auto_11281 ) ( not ( = ?auto_11281 ?auto_11287 ) ) ( not ( = ?auto_11282 ?auto_11287 ) ) ( not ( = ?auto_11280 ?auto_11287 ) ) ( not ( = ?auto_11292 ?auto_11287 ) ) ( IS-CRATE ?auto_11280 ) ( not ( = ?auto_11294 ?auto_11280 ) ) ( not ( = ?auto_11281 ?auto_11294 ) ) ( not ( = ?auto_11282 ?auto_11294 ) ) ( not ( = ?auto_11292 ?auto_11294 ) ) ( not ( = ?auto_11287 ?auto_11294 ) ) ( not ( = ?auto_11289 ?auto_11293 ) ) ( not ( = ?auto_11290 ?auto_11289 ) ) ( HOIST-AT ?auto_11288 ?auto_11289 ) ( not ( = ?auto_11285 ?auto_11288 ) ) ( not ( = ?auto_11286 ?auto_11288 ) ) ( AVAILABLE ?auto_11288 ) ( SURFACE-AT ?auto_11280 ?auto_11289 ) ( ON ?auto_11280 ?auto_11283 ) ( CLEAR ?auto_11280 ) ( not ( = ?auto_11281 ?auto_11283 ) ) ( not ( = ?auto_11282 ?auto_11283 ) ) ( not ( = ?auto_11280 ?auto_11283 ) ) ( not ( = ?auto_11292 ?auto_11283 ) ) ( not ( = ?auto_11287 ?auto_11283 ) ) ( not ( = ?auto_11294 ?auto_11283 ) ) ( TRUCK-AT ?auto_11291 ?auto_11293 ) ( SURFACE-AT ?auto_11284 ?auto_11293 ) ( CLEAR ?auto_11284 ) ( IS-CRATE ?auto_11294 ) ( not ( = ?auto_11284 ?auto_11294 ) ) ( not ( = ?auto_11281 ?auto_11284 ) ) ( not ( = ?auto_11282 ?auto_11284 ) ) ( not ( = ?auto_11280 ?auto_11284 ) ) ( not ( = ?auto_11292 ?auto_11284 ) ) ( not ( = ?auto_11287 ?auto_11284 ) ) ( not ( = ?auto_11283 ?auto_11284 ) ) ( AVAILABLE ?auto_11285 ) ( IN ?auto_11294 ?auto_11291 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11281 ?auto_11282 )
      ( MAKE-2CRATE-VERIFY ?auto_11280 ?auto_11281 ?auto_11282 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11295 - SURFACE
      ?auto_11296 - SURFACE
      ?auto_11297 - SURFACE
      ?auto_11298 - SURFACE
    )
    :vars
    (
      ?auto_11308 - HOIST
      ?auto_11306 - PLACE
      ?auto_11307 - PLACE
      ?auto_11309 - HOIST
      ?auto_11303 - SURFACE
      ?auto_11305 - SURFACE
      ?auto_11301 - PLACE
      ?auto_11304 - HOIST
      ?auto_11299 - SURFACE
      ?auto_11302 - TRUCK
      ?auto_11300 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11308 ?auto_11306 ) ( IS-CRATE ?auto_11298 ) ( not ( = ?auto_11297 ?auto_11298 ) ) ( not ( = ?auto_11296 ?auto_11297 ) ) ( not ( = ?auto_11296 ?auto_11298 ) ) ( not ( = ?auto_11307 ?auto_11306 ) ) ( HOIST-AT ?auto_11309 ?auto_11307 ) ( not ( = ?auto_11308 ?auto_11309 ) ) ( SURFACE-AT ?auto_11298 ?auto_11307 ) ( ON ?auto_11298 ?auto_11303 ) ( CLEAR ?auto_11298 ) ( not ( = ?auto_11297 ?auto_11303 ) ) ( not ( = ?auto_11298 ?auto_11303 ) ) ( not ( = ?auto_11296 ?auto_11303 ) ) ( IS-CRATE ?auto_11297 ) ( AVAILABLE ?auto_11309 ) ( SURFACE-AT ?auto_11297 ?auto_11307 ) ( ON ?auto_11297 ?auto_11305 ) ( CLEAR ?auto_11297 ) ( not ( = ?auto_11297 ?auto_11305 ) ) ( not ( = ?auto_11298 ?auto_11305 ) ) ( not ( = ?auto_11296 ?auto_11305 ) ) ( not ( = ?auto_11303 ?auto_11305 ) ) ( IS-CRATE ?auto_11296 ) ( not ( = ?auto_11295 ?auto_11296 ) ) ( not ( = ?auto_11297 ?auto_11295 ) ) ( not ( = ?auto_11298 ?auto_11295 ) ) ( not ( = ?auto_11303 ?auto_11295 ) ) ( not ( = ?auto_11305 ?auto_11295 ) ) ( not ( = ?auto_11301 ?auto_11306 ) ) ( not ( = ?auto_11307 ?auto_11301 ) ) ( HOIST-AT ?auto_11304 ?auto_11301 ) ( not ( = ?auto_11308 ?auto_11304 ) ) ( not ( = ?auto_11309 ?auto_11304 ) ) ( AVAILABLE ?auto_11304 ) ( SURFACE-AT ?auto_11296 ?auto_11301 ) ( ON ?auto_11296 ?auto_11299 ) ( CLEAR ?auto_11296 ) ( not ( = ?auto_11297 ?auto_11299 ) ) ( not ( = ?auto_11298 ?auto_11299 ) ) ( not ( = ?auto_11296 ?auto_11299 ) ) ( not ( = ?auto_11303 ?auto_11299 ) ) ( not ( = ?auto_11305 ?auto_11299 ) ) ( not ( = ?auto_11295 ?auto_11299 ) ) ( TRUCK-AT ?auto_11302 ?auto_11306 ) ( SURFACE-AT ?auto_11300 ?auto_11306 ) ( CLEAR ?auto_11300 ) ( IS-CRATE ?auto_11295 ) ( not ( = ?auto_11300 ?auto_11295 ) ) ( not ( = ?auto_11297 ?auto_11300 ) ) ( not ( = ?auto_11298 ?auto_11300 ) ) ( not ( = ?auto_11296 ?auto_11300 ) ) ( not ( = ?auto_11303 ?auto_11300 ) ) ( not ( = ?auto_11305 ?auto_11300 ) ) ( not ( = ?auto_11299 ?auto_11300 ) ) ( AVAILABLE ?auto_11308 ) ( IN ?auto_11295 ?auto_11302 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11296 ?auto_11297 ?auto_11298 )
      ( MAKE-3CRATE-VERIFY ?auto_11295 ?auto_11296 ?auto_11297 ?auto_11298 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11310 - SURFACE
      ?auto_11311 - SURFACE
      ?auto_11312 - SURFACE
      ?auto_11313 - SURFACE
      ?auto_11314 - SURFACE
    )
    :vars
    (
      ?auto_11323 - HOIST
      ?auto_11321 - PLACE
      ?auto_11322 - PLACE
      ?auto_11324 - HOIST
      ?auto_11318 - SURFACE
      ?auto_11320 - SURFACE
      ?auto_11316 - PLACE
      ?auto_11319 - HOIST
      ?auto_11315 - SURFACE
      ?auto_11317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11323 ?auto_11321 ) ( IS-CRATE ?auto_11314 ) ( not ( = ?auto_11313 ?auto_11314 ) ) ( not ( = ?auto_11312 ?auto_11313 ) ) ( not ( = ?auto_11312 ?auto_11314 ) ) ( not ( = ?auto_11322 ?auto_11321 ) ) ( HOIST-AT ?auto_11324 ?auto_11322 ) ( not ( = ?auto_11323 ?auto_11324 ) ) ( SURFACE-AT ?auto_11314 ?auto_11322 ) ( ON ?auto_11314 ?auto_11318 ) ( CLEAR ?auto_11314 ) ( not ( = ?auto_11313 ?auto_11318 ) ) ( not ( = ?auto_11314 ?auto_11318 ) ) ( not ( = ?auto_11312 ?auto_11318 ) ) ( IS-CRATE ?auto_11313 ) ( AVAILABLE ?auto_11324 ) ( SURFACE-AT ?auto_11313 ?auto_11322 ) ( ON ?auto_11313 ?auto_11320 ) ( CLEAR ?auto_11313 ) ( not ( = ?auto_11313 ?auto_11320 ) ) ( not ( = ?auto_11314 ?auto_11320 ) ) ( not ( = ?auto_11312 ?auto_11320 ) ) ( not ( = ?auto_11318 ?auto_11320 ) ) ( IS-CRATE ?auto_11312 ) ( not ( = ?auto_11311 ?auto_11312 ) ) ( not ( = ?auto_11313 ?auto_11311 ) ) ( not ( = ?auto_11314 ?auto_11311 ) ) ( not ( = ?auto_11318 ?auto_11311 ) ) ( not ( = ?auto_11320 ?auto_11311 ) ) ( not ( = ?auto_11316 ?auto_11321 ) ) ( not ( = ?auto_11322 ?auto_11316 ) ) ( HOIST-AT ?auto_11319 ?auto_11316 ) ( not ( = ?auto_11323 ?auto_11319 ) ) ( not ( = ?auto_11324 ?auto_11319 ) ) ( AVAILABLE ?auto_11319 ) ( SURFACE-AT ?auto_11312 ?auto_11316 ) ( ON ?auto_11312 ?auto_11315 ) ( CLEAR ?auto_11312 ) ( not ( = ?auto_11313 ?auto_11315 ) ) ( not ( = ?auto_11314 ?auto_11315 ) ) ( not ( = ?auto_11312 ?auto_11315 ) ) ( not ( = ?auto_11318 ?auto_11315 ) ) ( not ( = ?auto_11320 ?auto_11315 ) ) ( not ( = ?auto_11311 ?auto_11315 ) ) ( TRUCK-AT ?auto_11317 ?auto_11321 ) ( SURFACE-AT ?auto_11310 ?auto_11321 ) ( CLEAR ?auto_11310 ) ( IS-CRATE ?auto_11311 ) ( not ( = ?auto_11310 ?auto_11311 ) ) ( not ( = ?auto_11313 ?auto_11310 ) ) ( not ( = ?auto_11314 ?auto_11310 ) ) ( not ( = ?auto_11312 ?auto_11310 ) ) ( not ( = ?auto_11318 ?auto_11310 ) ) ( not ( = ?auto_11320 ?auto_11310 ) ) ( not ( = ?auto_11315 ?auto_11310 ) ) ( AVAILABLE ?auto_11323 ) ( IN ?auto_11311 ?auto_11317 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11312 ?auto_11313 ?auto_11314 )
      ( MAKE-4CRATE-VERIFY ?auto_11310 ?auto_11311 ?auto_11312 ?auto_11313 ?auto_11314 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11325 - SURFACE
      ?auto_11326 - SURFACE
    )
    :vars
    (
      ?auto_11338 - HOIST
      ?auto_11335 - PLACE
      ?auto_11336 - SURFACE
      ?auto_11337 - PLACE
      ?auto_11339 - HOIST
      ?auto_11332 - SURFACE
      ?auto_11334 - SURFACE
      ?auto_11330 - SURFACE
      ?auto_11329 - PLACE
      ?auto_11333 - HOIST
      ?auto_11327 - SURFACE
      ?auto_11328 - SURFACE
      ?auto_11331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11338 ?auto_11335 ) ( IS-CRATE ?auto_11326 ) ( not ( = ?auto_11325 ?auto_11326 ) ) ( not ( = ?auto_11336 ?auto_11325 ) ) ( not ( = ?auto_11336 ?auto_11326 ) ) ( not ( = ?auto_11337 ?auto_11335 ) ) ( HOIST-AT ?auto_11339 ?auto_11337 ) ( not ( = ?auto_11338 ?auto_11339 ) ) ( SURFACE-AT ?auto_11326 ?auto_11337 ) ( ON ?auto_11326 ?auto_11332 ) ( CLEAR ?auto_11326 ) ( not ( = ?auto_11325 ?auto_11332 ) ) ( not ( = ?auto_11326 ?auto_11332 ) ) ( not ( = ?auto_11336 ?auto_11332 ) ) ( IS-CRATE ?auto_11325 ) ( AVAILABLE ?auto_11339 ) ( SURFACE-AT ?auto_11325 ?auto_11337 ) ( ON ?auto_11325 ?auto_11334 ) ( CLEAR ?auto_11325 ) ( not ( = ?auto_11325 ?auto_11334 ) ) ( not ( = ?auto_11326 ?auto_11334 ) ) ( not ( = ?auto_11336 ?auto_11334 ) ) ( not ( = ?auto_11332 ?auto_11334 ) ) ( IS-CRATE ?auto_11336 ) ( not ( = ?auto_11330 ?auto_11336 ) ) ( not ( = ?auto_11325 ?auto_11330 ) ) ( not ( = ?auto_11326 ?auto_11330 ) ) ( not ( = ?auto_11332 ?auto_11330 ) ) ( not ( = ?auto_11334 ?auto_11330 ) ) ( not ( = ?auto_11329 ?auto_11335 ) ) ( not ( = ?auto_11337 ?auto_11329 ) ) ( HOIST-AT ?auto_11333 ?auto_11329 ) ( not ( = ?auto_11338 ?auto_11333 ) ) ( not ( = ?auto_11339 ?auto_11333 ) ) ( AVAILABLE ?auto_11333 ) ( SURFACE-AT ?auto_11336 ?auto_11329 ) ( ON ?auto_11336 ?auto_11327 ) ( CLEAR ?auto_11336 ) ( not ( = ?auto_11325 ?auto_11327 ) ) ( not ( = ?auto_11326 ?auto_11327 ) ) ( not ( = ?auto_11336 ?auto_11327 ) ) ( not ( = ?auto_11332 ?auto_11327 ) ) ( not ( = ?auto_11334 ?auto_11327 ) ) ( not ( = ?auto_11330 ?auto_11327 ) ) ( SURFACE-AT ?auto_11328 ?auto_11335 ) ( CLEAR ?auto_11328 ) ( IS-CRATE ?auto_11330 ) ( not ( = ?auto_11328 ?auto_11330 ) ) ( not ( = ?auto_11325 ?auto_11328 ) ) ( not ( = ?auto_11326 ?auto_11328 ) ) ( not ( = ?auto_11336 ?auto_11328 ) ) ( not ( = ?auto_11332 ?auto_11328 ) ) ( not ( = ?auto_11334 ?auto_11328 ) ) ( not ( = ?auto_11327 ?auto_11328 ) ) ( AVAILABLE ?auto_11338 ) ( IN ?auto_11330 ?auto_11331 ) ( TRUCK-AT ?auto_11331 ?auto_11337 ) )
    :subtasks
    ( ( !DRIVE ?auto_11331 ?auto_11337 ?auto_11335 )
      ( MAKE-2CRATE ?auto_11336 ?auto_11325 ?auto_11326 )
      ( MAKE-1CRATE-VERIFY ?auto_11325 ?auto_11326 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11340 - SURFACE
      ?auto_11341 - SURFACE
      ?auto_11342 - SURFACE
    )
    :vars
    (
      ?auto_11348 - HOIST
      ?auto_11351 - PLACE
      ?auto_11352 - PLACE
      ?auto_11343 - HOIST
      ?auto_11344 - SURFACE
      ?auto_11347 - SURFACE
      ?auto_11346 - SURFACE
      ?auto_11350 - PLACE
      ?auto_11349 - HOIST
      ?auto_11353 - SURFACE
      ?auto_11354 - SURFACE
      ?auto_11345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11348 ?auto_11351 ) ( IS-CRATE ?auto_11342 ) ( not ( = ?auto_11341 ?auto_11342 ) ) ( not ( = ?auto_11340 ?auto_11341 ) ) ( not ( = ?auto_11340 ?auto_11342 ) ) ( not ( = ?auto_11352 ?auto_11351 ) ) ( HOIST-AT ?auto_11343 ?auto_11352 ) ( not ( = ?auto_11348 ?auto_11343 ) ) ( SURFACE-AT ?auto_11342 ?auto_11352 ) ( ON ?auto_11342 ?auto_11344 ) ( CLEAR ?auto_11342 ) ( not ( = ?auto_11341 ?auto_11344 ) ) ( not ( = ?auto_11342 ?auto_11344 ) ) ( not ( = ?auto_11340 ?auto_11344 ) ) ( IS-CRATE ?auto_11341 ) ( AVAILABLE ?auto_11343 ) ( SURFACE-AT ?auto_11341 ?auto_11352 ) ( ON ?auto_11341 ?auto_11347 ) ( CLEAR ?auto_11341 ) ( not ( = ?auto_11341 ?auto_11347 ) ) ( not ( = ?auto_11342 ?auto_11347 ) ) ( not ( = ?auto_11340 ?auto_11347 ) ) ( not ( = ?auto_11344 ?auto_11347 ) ) ( IS-CRATE ?auto_11340 ) ( not ( = ?auto_11346 ?auto_11340 ) ) ( not ( = ?auto_11341 ?auto_11346 ) ) ( not ( = ?auto_11342 ?auto_11346 ) ) ( not ( = ?auto_11344 ?auto_11346 ) ) ( not ( = ?auto_11347 ?auto_11346 ) ) ( not ( = ?auto_11350 ?auto_11351 ) ) ( not ( = ?auto_11352 ?auto_11350 ) ) ( HOIST-AT ?auto_11349 ?auto_11350 ) ( not ( = ?auto_11348 ?auto_11349 ) ) ( not ( = ?auto_11343 ?auto_11349 ) ) ( AVAILABLE ?auto_11349 ) ( SURFACE-AT ?auto_11340 ?auto_11350 ) ( ON ?auto_11340 ?auto_11353 ) ( CLEAR ?auto_11340 ) ( not ( = ?auto_11341 ?auto_11353 ) ) ( not ( = ?auto_11342 ?auto_11353 ) ) ( not ( = ?auto_11340 ?auto_11353 ) ) ( not ( = ?auto_11344 ?auto_11353 ) ) ( not ( = ?auto_11347 ?auto_11353 ) ) ( not ( = ?auto_11346 ?auto_11353 ) ) ( SURFACE-AT ?auto_11354 ?auto_11351 ) ( CLEAR ?auto_11354 ) ( IS-CRATE ?auto_11346 ) ( not ( = ?auto_11354 ?auto_11346 ) ) ( not ( = ?auto_11341 ?auto_11354 ) ) ( not ( = ?auto_11342 ?auto_11354 ) ) ( not ( = ?auto_11340 ?auto_11354 ) ) ( not ( = ?auto_11344 ?auto_11354 ) ) ( not ( = ?auto_11347 ?auto_11354 ) ) ( not ( = ?auto_11353 ?auto_11354 ) ) ( AVAILABLE ?auto_11348 ) ( IN ?auto_11346 ?auto_11345 ) ( TRUCK-AT ?auto_11345 ?auto_11352 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11341 ?auto_11342 )
      ( MAKE-2CRATE-VERIFY ?auto_11340 ?auto_11341 ?auto_11342 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11355 - SURFACE
      ?auto_11356 - SURFACE
      ?auto_11357 - SURFACE
      ?auto_11358 - SURFACE
    )
    :vars
    (
      ?auto_11365 - HOIST
      ?auto_11366 - PLACE
      ?auto_11360 - PLACE
      ?auto_11367 - HOIST
      ?auto_11361 - SURFACE
      ?auto_11368 - SURFACE
      ?auto_11364 - PLACE
      ?auto_11363 - HOIST
      ?auto_11362 - SURFACE
      ?auto_11359 - SURFACE
      ?auto_11369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11365 ?auto_11366 ) ( IS-CRATE ?auto_11358 ) ( not ( = ?auto_11357 ?auto_11358 ) ) ( not ( = ?auto_11356 ?auto_11357 ) ) ( not ( = ?auto_11356 ?auto_11358 ) ) ( not ( = ?auto_11360 ?auto_11366 ) ) ( HOIST-AT ?auto_11367 ?auto_11360 ) ( not ( = ?auto_11365 ?auto_11367 ) ) ( SURFACE-AT ?auto_11358 ?auto_11360 ) ( ON ?auto_11358 ?auto_11361 ) ( CLEAR ?auto_11358 ) ( not ( = ?auto_11357 ?auto_11361 ) ) ( not ( = ?auto_11358 ?auto_11361 ) ) ( not ( = ?auto_11356 ?auto_11361 ) ) ( IS-CRATE ?auto_11357 ) ( AVAILABLE ?auto_11367 ) ( SURFACE-AT ?auto_11357 ?auto_11360 ) ( ON ?auto_11357 ?auto_11368 ) ( CLEAR ?auto_11357 ) ( not ( = ?auto_11357 ?auto_11368 ) ) ( not ( = ?auto_11358 ?auto_11368 ) ) ( not ( = ?auto_11356 ?auto_11368 ) ) ( not ( = ?auto_11361 ?auto_11368 ) ) ( IS-CRATE ?auto_11356 ) ( not ( = ?auto_11355 ?auto_11356 ) ) ( not ( = ?auto_11357 ?auto_11355 ) ) ( not ( = ?auto_11358 ?auto_11355 ) ) ( not ( = ?auto_11361 ?auto_11355 ) ) ( not ( = ?auto_11368 ?auto_11355 ) ) ( not ( = ?auto_11364 ?auto_11366 ) ) ( not ( = ?auto_11360 ?auto_11364 ) ) ( HOIST-AT ?auto_11363 ?auto_11364 ) ( not ( = ?auto_11365 ?auto_11363 ) ) ( not ( = ?auto_11367 ?auto_11363 ) ) ( AVAILABLE ?auto_11363 ) ( SURFACE-AT ?auto_11356 ?auto_11364 ) ( ON ?auto_11356 ?auto_11362 ) ( CLEAR ?auto_11356 ) ( not ( = ?auto_11357 ?auto_11362 ) ) ( not ( = ?auto_11358 ?auto_11362 ) ) ( not ( = ?auto_11356 ?auto_11362 ) ) ( not ( = ?auto_11361 ?auto_11362 ) ) ( not ( = ?auto_11368 ?auto_11362 ) ) ( not ( = ?auto_11355 ?auto_11362 ) ) ( SURFACE-AT ?auto_11359 ?auto_11366 ) ( CLEAR ?auto_11359 ) ( IS-CRATE ?auto_11355 ) ( not ( = ?auto_11359 ?auto_11355 ) ) ( not ( = ?auto_11357 ?auto_11359 ) ) ( not ( = ?auto_11358 ?auto_11359 ) ) ( not ( = ?auto_11356 ?auto_11359 ) ) ( not ( = ?auto_11361 ?auto_11359 ) ) ( not ( = ?auto_11368 ?auto_11359 ) ) ( not ( = ?auto_11362 ?auto_11359 ) ) ( AVAILABLE ?auto_11365 ) ( IN ?auto_11355 ?auto_11369 ) ( TRUCK-AT ?auto_11369 ?auto_11360 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11356 ?auto_11357 ?auto_11358 )
      ( MAKE-3CRATE-VERIFY ?auto_11355 ?auto_11356 ?auto_11357 ?auto_11358 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11370 - SURFACE
      ?auto_11371 - SURFACE
      ?auto_11372 - SURFACE
      ?auto_11373 - SURFACE
      ?auto_11374 - SURFACE
    )
    :vars
    (
      ?auto_11380 - HOIST
      ?auto_11381 - PLACE
      ?auto_11375 - PLACE
      ?auto_11382 - HOIST
      ?auto_11376 - SURFACE
      ?auto_11383 - SURFACE
      ?auto_11379 - PLACE
      ?auto_11378 - HOIST
      ?auto_11377 - SURFACE
      ?auto_11384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11380 ?auto_11381 ) ( IS-CRATE ?auto_11374 ) ( not ( = ?auto_11373 ?auto_11374 ) ) ( not ( = ?auto_11372 ?auto_11373 ) ) ( not ( = ?auto_11372 ?auto_11374 ) ) ( not ( = ?auto_11375 ?auto_11381 ) ) ( HOIST-AT ?auto_11382 ?auto_11375 ) ( not ( = ?auto_11380 ?auto_11382 ) ) ( SURFACE-AT ?auto_11374 ?auto_11375 ) ( ON ?auto_11374 ?auto_11376 ) ( CLEAR ?auto_11374 ) ( not ( = ?auto_11373 ?auto_11376 ) ) ( not ( = ?auto_11374 ?auto_11376 ) ) ( not ( = ?auto_11372 ?auto_11376 ) ) ( IS-CRATE ?auto_11373 ) ( AVAILABLE ?auto_11382 ) ( SURFACE-AT ?auto_11373 ?auto_11375 ) ( ON ?auto_11373 ?auto_11383 ) ( CLEAR ?auto_11373 ) ( not ( = ?auto_11373 ?auto_11383 ) ) ( not ( = ?auto_11374 ?auto_11383 ) ) ( not ( = ?auto_11372 ?auto_11383 ) ) ( not ( = ?auto_11376 ?auto_11383 ) ) ( IS-CRATE ?auto_11372 ) ( not ( = ?auto_11371 ?auto_11372 ) ) ( not ( = ?auto_11373 ?auto_11371 ) ) ( not ( = ?auto_11374 ?auto_11371 ) ) ( not ( = ?auto_11376 ?auto_11371 ) ) ( not ( = ?auto_11383 ?auto_11371 ) ) ( not ( = ?auto_11379 ?auto_11381 ) ) ( not ( = ?auto_11375 ?auto_11379 ) ) ( HOIST-AT ?auto_11378 ?auto_11379 ) ( not ( = ?auto_11380 ?auto_11378 ) ) ( not ( = ?auto_11382 ?auto_11378 ) ) ( AVAILABLE ?auto_11378 ) ( SURFACE-AT ?auto_11372 ?auto_11379 ) ( ON ?auto_11372 ?auto_11377 ) ( CLEAR ?auto_11372 ) ( not ( = ?auto_11373 ?auto_11377 ) ) ( not ( = ?auto_11374 ?auto_11377 ) ) ( not ( = ?auto_11372 ?auto_11377 ) ) ( not ( = ?auto_11376 ?auto_11377 ) ) ( not ( = ?auto_11383 ?auto_11377 ) ) ( not ( = ?auto_11371 ?auto_11377 ) ) ( SURFACE-AT ?auto_11370 ?auto_11381 ) ( CLEAR ?auto_11370 ) ( IS-CRATE ?auto_11371 ) ( not ( = ?auto_11370 ?auto_11371 ) ) ( not ( = ?auto_11373 ?auto_11370 ) ) ( not ( = ?auto_11374 ?auto_11370 ) ) ( not ( = ?auto_11372 ?auto_11370 ) ) ( not ( = ?auto_11376 ?auto_11370 ) ) ( not ( = ?auto_11383 ?auto_11370 ) ) ( not ( = ?auto_11377 ?auto_11370 ) ) ( AVAILABLE ?auto_11380 ) ( IN ?auto_11371 ?auto_11384 ) ( TRUCK-AT ?auto_11384 ?auto_11375 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11372 ?auto_11373 ?auto_11374 )
      ( MAKE-4CRATE-VERIFY ?auto_11370 ?auto_11371 ?auto_11372 ?auto_11373 ?auto_11374 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11385 - SURFACE
      ?auto_11386 - SURFACE
    )
    :vars
    (
      ?auto_11394 - HOIST
      ?auto_11395 - PLACE
      ?auto_11388 - SURFACE
      ?auto_11389 - PLACE
      ?auto_11396 - HOIST
      ?auto_11390 - SURFACE
      ?auto_11397 - SURFACE
      ?auto_11398 - SURFACE
      ?auto_11393 - PLACE
      ?auto_11392 - HOIST
      ?auto_11391 - SURFACE
      ?auto_11387 - SURFACE
      ?auto_11399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11394 ?auto_11395 ) ( IS-CRATE ?auto_11386 ) ( not ( = ?auto_11385 ?auto_11386 ) ) ( not ( = ?auto_11388 ?auto_11385 ) ) ( not ( = ?auto_11388 ?auto_11386 ) ) ( not ( = ?auto_11389 ?auto_11395 ) ) ( HOIST-AT ?auto_11396 ?auto_11389 ) ( not ( = ?auto_11394 ?auto_11396 ) ) ( SURFACE-AT ?auto_11386 ?auto_11389 ) ( ON ?auto_11386 ?auto_11390 ) ( CLEAR ?auto_11386 ) ( not ( = ?auto_11385 ?auto_11390 ) ) ( not ( = ?auto_11386 ?auto_11390 ) ) ( not ( = ?auto_11388 ?auto_11390 ) ) ( IS-CRATE ?auto_11385 ) ( SURFACE-AT ?auto_11385 ?auto_11389 ) ( ON ?auto_11385 ?auto_11397 ) ( CLEAR ?auto_11385 ) ( not ( = ?auto_11385 ?auto_11397 ) ) ( not ( = ?auto_11386 ?auto_11397 ) ) ( not ( = ?auto_11388 ?auto_11397 ) ) ( not ( = ?auto_11390 ?auto_11397 ) ) ( IS-CRATE ?auto_11388 ) ( not ( = ?auto_11398 ?auto_11388 ) ) ( not ( = ?auto_11385 ?auto_11398 ) ) ( not ( = ?auto_11386 ?auto_11398 ) ) ( not ( = ?auto_11390 ?auto_11398 ) ) ( not ( = ?auto_11397 ?auto_11398 ) ) ( not ( = ?auto_11393 ?auto_11395 ) ) ( not ( = ?auto_11389 ?auto_11393 ) ) ( HOIST-AT ?auto_11392 ?auto_11393 ) ( not ( = ?auto_11394 ?auto_11392 ) ) ( not ( = ?auto_11396 ?auto_11392 ) ) ( AVAILABLE ?auto_11392 ) ( SURFACE-AT ?auto_11388 ?auto_11393 ) ( ON ?auto_11388 ?auto_11391 ) ( CLEAR ?auto_11388 ) ( not ( = ?auto_11385 ?auto_11391 ) ) ( not ( = ?auto_11386 ?auto_11391 ) ) ( not ( = ?auto_11388 ?auto_11391 ) ) ( not ( = ?auto_11390 ?auto_11391 ) ) ( not ( = ?auto_11397 ?auto_11391 ) ) ( not ( = ?auto_11398 ?auto_11391 ) ) ( SURFACE-AT ?auto_11387 ?auto_11395 ) ( CLEAR ?auto_11387 ) ( IS-CRATE ?auto_11398 ) ( not ( = ?auto_11387 ?auto_11398 ) ) ( not ( = ?auto_11385 ?auto_11387 ) ) ( not ( = ?auto_11386 ?auto_11387 ) ) ( not ( = ?auto_11388 ?auto_11387 ) ) ( not ( = ?auto_11390 ?auto_11387 ) ) ( not ( = ?auto_11397 ?auto_11387 ) ) ( not ( = ?auto_11391 ?auto_11387 ) ) ( AVAILABLE ?auto_11394 ) ( TRUCK-AT ?auto_11399 ?auto_11389 ) ( LIFTING ?auto_11396 ?auto_11398 ) )
    :subtasks
    ( ( !LOAD ?auto_11396 ?auto_11398 ?auto_11399 ?auto_11389 )
      ( MAKE-2CRATE ?auto_11388 ?auto_11385 ?auto_11386 )
      ( MAKE-1CRATE-VERIFY ?auto_11385 ?auto_11386 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11400 - SURFACE
      ?auto_11401 - SURFACE
      ?auto_11402 - SURFACE
    )
    :vars
    (
      ?auto_11412 - HOIST
      ?auto_11407 - PLACE
      ?auto_11414 - PLACE
      ?auto_11408 - HOIST
      ?auto_11403 - SURFACE
      ?auto_11411 - SURFACE
      ?auto_11410 - SURFACE
      ?auto_11404 - PLACE
      ?auto_11409 - HOIST
      ?auto_11406 - SURFACE
      ?auto_11413 - SURFACE
      ?auto_11405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11412 ?auto_11407 ) ( IS-CRATE ?auto_11402 ) ( not ( = ?auto_11401 ?auto_11402 ) ) ( not ( = ?auto_11400 ?auto_11401 ) ) ( not ( = ?auto_11400 ?auto_11402 ) ) ( not ( = ?auto_11414 ?auto_11407 ) ) ( HOIST-AT ?auto_11408 ?auto_11414 ) ( not ( = ?auto_11412 ?auto_11408 ) ) ( SURFACE-AT ?auto_11402 ?auto_11414 ) ( ON ?auto_11402 ?auto_11403 ) ( CLEAR ?auto_11402 ) ( not ( = ?auto_11401 ?auto_11403 ) ) ( not ( = ?auto_11402 ?auto_11403 ) ) ( not ( = ?auto_11400 ?auto_11403 ) ) ( IS-CRATE ?auto_11401 ) ( SURFACE-AT ?auto_11401 ?auto_11414 ) ( ON ?auto_11401 ?auto_11411 ) ( CLEAR ?auto_11401 ) ( not ( = ?auto_11401 ?auto_11411 ) ) ( not ( = ?auto_11402 ?auto_11411 ) ) ( not ( = ?auto_11400 ?auto_11411 ) ) ( not ( = ?auto_11403 ?auto_11411 ) ) ( IS-CRATE ?auto_11400 ) ( not ( = ?auto_11410 ?auto_11400 ) ) ( not ( = ?auto_11401 ?auto_11410 ) ) ( not ( = ?auto_11402 ?auto_11410 ) ) ( not ( = ?auto_11403 ?auto_11410 ) ) ( not ( = ?auto_11411 ?auto_11410 ) ) ( not ( = ?auto_11404 ?auto_11407 ) ) ( not ( = ?auto_11414 ?auto_11404 ) ) ( HOIST-AT ?auto_11409 ?auto_11404 ) ( not ( = ?auto_11412 ?auto_11409 ) ) ( not ( = ?auto_11408 ?auto_11409 ) ) ( AVAILABLE ?auto_11409 ) ( SURFACE-AT ?auto_11400 ?auto_11404 ) ( ON ?auto_11400 ?auto_11406 ) ( CLEAR ?auto_11400 ) ( not ( = ?auto_11401 ?auto_11406 ) ) ( not ( = ?auto_11402 ?auto_11406 ) ) ( not ( = ?auto_11400 ?auto_11406 ) ) ( not ( = ?auto_11403 ?auto_11406 ) ) ( not ( = ?auto_11411 ?auto_11406 ) ) ( not ( = ?auto_11410 ?auto_11406 ) ) ( SURFACE-AT ?auto_11413 ?auto_11407 ) ( CLEAR ?auto_11413 ) ( IS-CRATE ?auto_11410 ) ( not ( = ?auto_11413 ?auto_11410 ) ) ( not ( = ?auto_11401 ?auto_11413 ) ) ( not ( = ?auto_11402 ?auto_11413 ) ) ( not ( = ?auto_11400 ?auto_11413 ) ) ( not ( = ?auto_11403 ?auto_11413 ) ) ( not ( = ?auto_11411 ?auto_11413 ) ) ( not ( = ?auto_11406 ?auto_11413 ) ) ( AVAILABLE ?auto_11412 ) ( TRUCK-AT ?auto_11405 ?auto_11414 ) ( LIFTING ?auto_11408 ?auto_11410 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11401 ?auto_11402 )
      ( MAKE-2CRATE-VERIFY ?auto_11400 ?auto_11401 ?auto_11402 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11415 - SURFACE
      ?auto_11416 - SURFACE
      ?auto_11417 - SURFACE
      ?auto_11418 - SURFACE
    )
    :vars
    (
      ?auto_11420 - HOIST
      ?auto_11428 - PLACE
      ?auto_11419 - PLACE
      ?auto_11425 - HOIST
      ?auto_11421 - SURFACE
      ?auto_11423 - SURFACE
      ?auto_11427 - PLACE
      ?auto_11422 - HOIST
      ?auto_11424 - SURFACE
      ?auto_11426 - SURFACE
      ?auto_11429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11420 ?auto_11428 ) ( IS-CRATE ?auto_11418 ) ( not ( = ?auto_11417 ?auto_11418 ) ) ( not ( = ?auto_11416 ?auto_11417 ) ) ( not ( = ?auto_11416 ?auto_11418 ) ) ( not ( = ?auto_11419 ?auto_11428 ) ) ( HOIST-AT ?auto_11425 ?auto_11419 ) ( not ( = ?auto_11420 ?auto_11425 ) ) ( SURFACE-AT ?auto_11418 ?auto_11419 ) ( ON ?auto_11418 ?auto_11421 ) ( CLEAR ?auto_11418 ) ( not ( = ?auto_11417 ?auto_11421 ) ) ( not ( = ?auto_11418 ?auto_11421 ) ) ( not ( = ?auto_11416 ?auto_11421 ) ) ( IS-CRATE ?auto_11417 ) ( SURFACE-AT ?auto_11417 ?auto_11419 ) ( ON ?auto_11417 ?auto_11423 ) ( CLEAR ?auto_11417 ) ( not ( = ?auto_11417 ?auto_11423 ) ) ( not ( = ?auto_11418 ?auto_11423 ) ) ( not ( = ?auto_11416 ?auto_11423 ) ) ( not ( = ?auto_11421 ?auto_11423 ) ) ( IS-CRATE ?auto_11416 ) ( not ( = ?auto_11415 ?auto_11416 ) ) ( not ( = ?auto_11417 ?auto_11415 ) ) ( not ( = ?auto_11418 ?auto_11415 ) ) ( not ( = ?auto_11421 ?auto_11415 ) ) ( not ( = ?auto_11423 ?auto_11415 ) ) ( not ( = ?auto_11427 ?auto_11428 ) ) ( not ( = ?auto_11419 ?auto_11427 ) ) ( HOIST-AT ?auto_11422 ?auto_11427 ) ( not ( = ?auto_11420 ?auto_11422 ) ) ( not ( = ?auto_11425 ?auto_11422 ) ) ( AVAILABLE ?auto_11422 ) ( SURFACE-AT ?auto_11416 ?auto_11427 ) ( ON ?auto_11416 ?auto_11424 ) ( CLEAR ?auto_11416 ) ( not ( = ?auto_11417 ?auto_11424 ) ) ( not ( = ?auto_11418 ?auto_11424 ) ) ( not ( = ?auto_11416 ?auto_11424 ) ) ( not ( = ?auto_11421 ?auto_11424 ) ) ( not ( = ?auto_11423 ?auto_11424 ) ) ( not ( = ?auto_11415 ?auto_11424 ) ) ( SURFACE-AT ?auto_11426 ?auto_11428 ) ( CLEAR ?auto_11426 ) ( IS-CRATE ?auto_11415 ) ( not ( = ?auto_11426 ?auto_11415 ) ) ( not ( = ?auto_11417 ?auto_11426 ) ) ( not ( = ?auto_11418 ?auto_11426 ) ) ( not ( = ?auto_11416 ?auto_11426 ) ) ( not ( = ?auto_11421 ?auto_11426 ) ) ( not ( = ?auto_11423 ?auto_11426 ) ) ( not ( = ?auto_11424 ?auto_11426 ) ) ( AVAILABLE ?auto_11420 ) ( TRUCK-AT ?auto_11429 ?auto_11419 ) ( LIFTING ?auto_11425 ?auto_11415 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11416 ?auto_11417 ?auto_11418 )
      ( MAKE-3CRATE-VERIFY ?auto_11415 ?auto_11416 ?auto_11417 ?auto_11418 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11430 - SURFACE
      ?auto_11431 - SURFACE
      ?auto_11432 - SURFACE
      ?auto_11433 - SURFACE
      ?auto_11434 - SURFACE
    )
    :vars
    (
      ?auto_11436 - HOIST
      ?auto_11443 - PLACE
      ?auto_11435 - PLACE
      ?auto_11441 - HOIST
      ?auto_11437 - SURFACE
      ?auto_11439 - SURFACE
      ?auto_11442 - PLACE
      ?auto_11438 - HOIST
      ?auto_11440 - SURFACE
      ?auto_11444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11436 ?auto_11443 ) ( IS-CRATE ?auto_11434 ) ( not ( = ?auto_11433 ?auto_11434 ) ) ( not ( = ?auto_11432 ?auto_11433 ) ) ( not ( = ?auto_11432 ?auto_11434 ) ) ( not ( = ?auto_11435 ?auto_11443 ) ) ( HOIST-AT ?auto_11441 ?auto_11435 ) ( not ( = ?auto_11436 ?auto_11441 ) ) ( SURFACE-AT ?auto_11434 ?auto_11435 ) ( ON ?auto_11434 ?auto_11437 ) ( CLEAR ?auto_11434 ) ( not ( = ?auto_11433 ?auto_11437 ) ) ( not ( = ?auto_11434 ?auto_11437 ) ) ( not ( = ?auto_11432 ?auto_11437 ) ) ( IS-CRATE ?auto_11433 ) ( SURFACE-AT ?auto_11433 ?auto_11435 ) ( ON ?auto_11433 ?auto_11439 ) ( CLEAR ?auto_11433 ) ( not ( = ?auto_11433 ?auto_11439 ) ) ( not ( = ?auto_11434 ?auto_11439 ) ) ( not ( = ?auto_11432 ?auto_11439 ) ) ( not ( = ?auto_11437 ?auto_11439 ) ) ( IS-CRATE ?auto_11432 ) ( not ( = ?auto_11431 ?auto_11432 ) ) ( not ( = ?auto_11433 ?auto_11431 ) ) ( not ( = ?auto_11434 ?auto_11431 ) ) ( not ( = ?auto_11437 ?auto_11431 ) ) ( not ( = ?auto_11439 ?auto_11431 ) ) ( not ( = ?auto_11442 ?auto_11443 ) ) ( not ( = ?auto_11435 ?auto_11442 ) ) ( HOIST-AT ?auto_11438 ?auto_11442 ) ( not ( = ?auto_11436 ?auto_11438 ) ) ( not ( = ?auto_11441 ?auto_11438 ) ) ( AVAILABLE ?auto_11438 ) ( SURFACE-AT ?auto_11432 ?auto_11442 ) ( ON ?auto_11432 ?auto_11440 ) ( CLEAR ?auto_11432 ) ( not ( = ?auto_11433 ?auto_11440 ) ) ( not ( = ?auto_11434 ?auto_11440 ) ) ( not ( = ?auto_11432 ?auto_11440 ) ) ( not ( = ?auto_11437 ?auto_11440 ) ) ( not ( = ?auto_11439 ?auto_11440 ) ) ( not ( = ?auto_11431 ?auto_11440 ) ) ( SURFACE-AT ?auto_11430 ?auto_11443 ) ( CLEAR ?auto_11430 ) ( IS-CRATE ?auto_11431 ) ( not ( = ?auto_11430 ?auto_11431 ) ) ( not ( = ?auto_11433 ?auto_11430 ) ) ( not ( = ?auto_11434 ?auto_11430 ) ) ( not ( = ?auto_11432 ?auto_11430 ) ) ( not ( = ?auto_11437 ?auto_11430 ) ) ( not ( = ?auto_11439 ?auto_11430 ) ) ( not ( = ?auto_11440 ?auto_11430 ) ) ( AVAILABLE ?auto_11436 ) ( TRUCK-AT ?auto_11444 ?auto_11435 ) ( LIFTING ?auto_11441 ?auto_11431 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11432 ?auto_11433 ?auto_11434 )
      ( MAKE-4CRATE-VERIFY ?auto_11430 ?auto_11431 ?auto_11432 ?auto_11433 ?auto_11434 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11445 - SURFACE
      ?auto_11446 - SURFACE
    )
    :vars
    (
      ?auto_11448 - HOIST
      ?auto_11456 - PLACE
      ?auto_11458 - SURFACE
      ?auto_11447 - PLACE
      ?auto_11453 - HOIST
      ?auto_11449 - SURFACE
      ?auto_11451 - SURFACE
      ?auto_11457 - SURFACE
      ?auto_11455 - PLACE
      ?auto_11450 - HOIST
      ?auto_11452 - SURFACE
      ?auto_11454 - SURFACE
      ?auto_11459 - TRUCK
      ?auto_11460 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11448 ?auto_11456 ) ( IS-CRATE ?auto_11446 ) ( not ( = ?auto_11445 ?auto_11446 ) ) ( not ( = ?auto_11458 ?auto_11445 ) ) ( not ( = ?auto_11458 ?auto_11446 ) ) ( not ( = ?auto_11447 ?auto_11456 ) ) ( HOIST-AT ?auto_11453 ?auto_11447 ) ( not ( = ?auto_11448 ?auto_11453 ) ) ( SURFACE-AT ?auto_11446 ?auto_11447 ) ( ON ?auto_11446 ?auto_11449 ) ( CLEAR ?auto_11446 ) ( not ( = ?auto_11445 ?auto_11449 ) ) ( not ( = ?auto_11446 ?auto_11449 ) ) ( not ( = ?auto_11458 ?auto_11449 ) ) ( IS-CRATE ?auto_11445 ) ( SURFACE-AT ?auto_11445 ?auto_11447 ) ( ON ?auto_11445 ?auto_11451 ) ( CLEAR ?auto_11445 ) ( not ( = ?auto_11445 ?auto_11451 ) ) ( not ( = ?auto_11446 ?auto_11451 ) ) ( not ( = ?auto_11458 ?auto_11451 ) ) ( not ( = ?auto_11449 ?auto_11451 ) ) ( IS-CRATE ?auto_11458 ) ( not ( = ?auto_11457 ?auto_11458 ) ) ( not ( = ?auto_11445 ?auto_11457 ) ) ( not ( = ?auto_11446 ?auto_11457 ) ) ( not ( = ?auto_11449 ?auto_11457 ) ) ( not ( = ?auto_11451 ?auto_11457 ) ) ( not ( = ?auto_11455 ?auto_11456 ) ) ( not ( = ?auto_11447 ?auto_11455 ) ) ( HOIST-AT ?auto_11450 ?auto_11455 ) ( not ( = ?auto_11448 ?auto_11450 ) ) ( not ( = ?auto_11453 ?auto_11450 ) ) ( AVAILABLE ?auto_11450 ) ( SURFACE-AT ?auto_11458 ?auto_11455 ) ( ON ?auto_11458 ?auto_11452 ) ( CLEAR ?auto_11458 ) ( not ( = ?auto_11445 ?auto_11452 ) ) ( not ( = ?auto_11446 ?auto_11452 ) ) ( not ( = ?auto_11458 ?auto_11452 ) ) ( not ( = ?auto_11449 ?auto_11452 ) ) ( not ( = ?auto_11451 ?auto_11452 ) ) ( not ( = ?auto_11457 ?auto_11452 ) ) ( SURFACE-AT ?auto_11454 ?auto_11456 ) ( CLEAR ?auto_11454 ) ( IS-CRATE ?auto_11457 ) ( not ( = ?auto_11454 ?auto_11457 ) ) ( not ( = ?auto_11445 ?auto_11454 ) ) ( not ( = ?auto_11446 ?auto_11454 ) ) ( not ( = ?auto_11458 ?auto_11454 ) ) ( not ( = ?auto_11449 ?auto_11454 ) ) ( not ( = ?auto_11451 ?auto_11454 ) ) ( not ( = ?auto_11452 ?auto_11454 ) ) ( AVAILABLE ?auto_11448 ) ( TRUCK-AT ?auto_11459 ?auto_11447 ) ( AVAILABLE ?auto_11453 ) ( SURFACE-AT ?auto_11457 ?auto_11447 ) ( ON ?auto_11457 ?auto_11460 ) ( CLEAR ?auto_11457 ) ( not ( = ?auto_11445 ?auto_11460 ) ) ( not ( = ?auto_11446 ?auto_11460 ) ) ( not ( = ?auto_11458 ?auto_11460 ) ) ( not ( = ?auto_11449 ?auto_11460 ) ) ( not ( = ?auto_11451 ?auto_11460 ) ) ( not ( = ?auto_11457 ?auto_11460 ) ) ( not ( = ?auto_11452 ?auto_11460 ) ) ( not ( = ?auto_11454 ?auto_11460 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11453 ?auto_11457 ?auto_11460 ?auto_11447 )
      ( MAKE-2CRATE ?auto_11458 ?auto_11445 ?auto_11446 )
      ( MAKE-1CRATE-VERIFY ?auto_11445 ?auto_11446 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11461 - SURFACE
      ?auto_11462 - SURFACE
      ?auto_11463 - SURFACE
    )
    :vars
    (
      ?auto_11472 - HOIST
      ?auto_11468 - PLACE
      ?auto_11476 - PLACE
      ?auto_11465 - HOIST
      ?auto_11475 - SURFACE
      ?auto_11471 - SURFACE
      ?auto_11466 - SURFACE
      ?auto_11469 - PLACE
      ?auto_11467 - HOIST
      ?auto_11470 - SURFACE
      ?auto_11473 - SURFACE
      ?auto_11464 - TRUCK
      ?auto_11474 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11472 ?auto_11468 ) ( IS-CRATE ?auto_11463 ) ( not ( = ?auto_11462 ?auto_11463 ) ) ( not ( = ?auto_11461 ?auto_11462 ) ) ( not ( = ?auto_11461 ?auto_11463 ) ) ( not ( = ?auto_11476 ?auto_11468 ) ) ( HOIST-AT ?auto_11465 ?auto_11476 ) ( not ( = ?auto_11472 ?auto_11465 ) ) ( SURFACE-AT ?auto_11463 ?auto_11476 ) ( ON ?auto_11463 ?auto_11475 ) ( CLEAR ?auto_11463 ) ( not ( = ?auto_11462 ?auto_11475 ) ) ( not ( = ?auto_11463 ?auto_11475 ) ) ( not ( = ?auto_11461 ?auto_11475 ) ) ( IS-CRATE ?auto_11462 ) ( SURFACE-AT ?auto_11462 ?auto_11476 ) ( ON ?auto_11462 ?auto_11471 ) ( CLEAR ?auto_11462 ) ( not ( = ?auto_11462 ?auto_11471 ) ) ( not ( = ?auto_11463 ?auto_11471 ) ) ( not ( = ?auto_11461 ?auto_11471 ) ) ( not ( = ?auto_11475 ?auto_11471 ) ) ( IS-CRATE ?auto_11461 ) ( not ( = ?auto_11466 ?auto_11461 ) ) ( not ( = ?auto_11462 ?auto_11466 ) ) ( not ( = ?auto_11463 ?auto_11466 ) ) ( not ( = ?auto_11475 ?auto_11466 ) ) ( not ( = ?auto_11471 ?auto_11466 ) ) ( not ( = ?auto_11469 ?auto_11468 ) ) ( not ( = ?auto_11476 ?auto_11469 ) ) ( HOIST-AT ?auto_11467 ?auto_11469 ) ( not ( = ?auto_11472 ?auto_11467 ) ) ( not ( = ?auto_11465 ?auto_11467 ) ) ( AVAILABLE ?auto_11467 ) ( SURFACE-AT ?auto_11461 ?auto_11469 ) ( ON ?auto_11461 ?auto_11470 ) ( CLEAR ?auto_11461 ) ( not ( = ?auto_11462 ?auto_11470 ) ) ( not ( = ?auto_11463 ?auto_11470 ) ) ( not ( = ?auto_11461 ?auto_11470 ) ) ( not ( = ?auto_11475 ?auto_11470 ) ) ( not ( = ?auto_11471 ?auto_11470 ) ) ( not ( = ?auto_11466 ?auto_11470 ) ) ( SURFACE-AT ?auto_11473 ?auto_11468 ) ( CLEAR ?auto_11473 ) ( IS-CRATE ?auto_11466 ) ( not ( = ?auto_11473 ?auto_11466 ) ) ( not ( = ?auto_11462 ?auto_11473 ) ) ( not ( = ?auto_11463 ?auto_11473 ) ) ( not ( = ?auto_11461 ?auto_11473 ) ) ( not ( = ?auto_11475 ?auto_11473 ) ) ( not ( = ?auto_11471 ?auto_11473 ) ) ( not ( = ?auto_11470 ?auto_11473 ) ) ( AVAILABLE ?auto_11472 ) ( TRUCK-AT ?auto_11464 ?auto_11476 ) ( AVAILABLE ?auto_11465 ) ( SURFACE-AT ?auto_11466 ?auto_11476 ) ( ON ?auto_11466 ?auto_11474 ) ( CLEAR ?auto_11466 ) ( not ( = ?auto_11462 ?auto_11474 ) ) ( not ( = ?auto_11463 ?auto_11474 ) ) ( not ( = ?auto_11461 ?auto_11474 ) ) ( not ( = ?auto_11475 ?auto_11474 ) ) ( not ( = ?auto_11471 ?auto_11474 ) ) ( not ( = ?auto_11466 ?auto_11474 ) ) ( not ( = ?auto_11470 ?auto_11474 ) ) ( not ( = ?auto_11473 ?auto_11474 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11462 ?auto_11463 )
      ( MAKE-2CRATE-VERIFY ?auto_11461 ?auto_11462 ?auto_11463 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11477 - SURFACE
      ?auto_11478 - SURFACE
      ?auto_11479 - SURFACE
      ?auto_11480 - SURFACE
    )
    :vars
    (
      ?auto_11487 - HOIST
      ?auto_11484 - PLACE
      ?auto_11481 - PLACE
      ?auto_11485 - HOIST
      ?auto_11488 - SURFACE
      ?auto_11491 - SURFACE
      ?auto_11483 - PLACE
      ?auto_11489 - HOIST
      ?auto_11492 - SURFACE
      ?auto_11490 - SURFACE
      ?auto_11486 - TRUCK
      ?auto_11482 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11487 ?auto_11484 ) ( IS-CRATE ?auto_11480 ) ( not ( = ?auto_11479 ?auto_11480 ) ) ( not ( = ?auto_11478 ?auto_11479 ) ) ( not ( = ?auto_11478 ?auto_11480 ) ) ( not ( = ?auto_11481 ?auto_11484 ) ) ( HOIST-AT ?auto_11485 ?auto_11481 ) ( not ( = ?auto_11487 ?auto_11485 ) ) ( SURFACE-AT ?auto_11480 ?auto_11481 ) ( ON ?auto_11480 ?auto_11488 ) ( CLEAR ?auto_11480 ) ( not ( = ?auto_11479 ?auto_11488 ) ) ( not ( = ?auto_11480 ?auto_11488 ) ) ( not ( = ?auto_11478 ?auto_11488 ) ) ( IS-CRATE ?auto_11479 ) ( SURFACE-AT ?auto_11479 ?auto_11481 ) ( ON ?auto_11479 ?auto_11491 ) ( CLEAR ?auto_11479 ) ( not ( = ?auto_11479 ?auto_11491 ) ) ( not ( = ?auto_11480 ?auto_11491 ) ) ( not ( = ?auto_11478 ?auto_11491 ) ) ( not ( = ?auto_11488 ?auto_11491 ) ) ( IS-CRATE ?auto_11478 ) ( not ( = ?auto_11477 ?auto_11478 ) ) ( not ( = ?auto_11479 ?auto_11477 ) ) ( not ( = ?auto_11480 ?auto_11477 ) ) ( not ( = ?auto_11488 ?auto_11477 ) ) ( not ( = ?auto_11491 ?auto_11477 ) ) ( not ( = ?auto_11483 ?auto_11484 ) ) ( not ( = ?auto_11481 ?auto_11483 ) ) ( HOIST-AT ?auto_11489 ?auto_11483 ) ( not ( = ?auto_11487 ?auto_11489 ) ) ( not ( = ?auto_11485 ?auto_11489 ) ) ( AVAILABLE ?auto_11489 ) ( SURFACE-AT ?auto_11478 ?auto_11483 ) ( ON ?auto_11478 ?auto_11492 ) ( CLEAR ?auto_11478 ) ( not ( = ?auto_11479 ?auto_11492 ) ) ( not ( = ?auto_11480 ?auto_11492 ) ) ( not ( = ?auto_11478 ?auto_11492 ) ) ( not ( = ?auto_11488 ?auto_11492 ) ) ( not ( = ?auto_11491 ?auto_11492 ) ) ( not ( = ?auto_11477 ?auto_11492 ) ) ( SURFACE-AT ?auto_11490 ?auto_11484 ) ( CLEAR ?auto_11490 ) ( IS-CRATE ?auto_11477 ) ( not ( = ?auto_11490 ?auto_11477 ) ) ( not ( = ?auto_11479 ?auto_11490 ) ) ( not ( = ?auto_11480 ?auto_11490 ) ) ( not ( = ?auto_11478 ?auto_11490 ) ) ( not ( = ?auto_11488 ?auto_11490 ) ) ( not ( = ?auto_11491 ?auto_11490 ) ) ( not ( = ?auto_11492 ?auto_11490 ) ) ( AVAILABLE ?auto_11487 ) ( TRUCK-AT ?auto_11486 ?auto_11481 ) ( AVAILABLE ?auto_11485 ) ( SURFACE-AT ?auto_11477 ?auto_11481 ) ( ON ?auto_11477 ?auto_11482 ) ( CLEAR ?auto_11477 ) ( not ( = ?auto_11479 ?auto_11482 ) ) ( not ( = ?auto_11480 ?auto_11482 ) ) ( not ( = ?auto_11478 ?auto_11482 ) ) ( not ( = ?auto_11488 ?auto_11482 ) ) ( not ( = ?auto_11491 ?auto_11482 ) ) ( not ( = ?auto_11477 ?auto_11482 ) ) ( not ( = ?auto_11492 ?auto_11482 ) ) ( not ( = ?auto_11490 ?auto_11482 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11478 ?auto_11479 ?auto_11480 )
      ( MAKE-3CRATE-VERIFY ?auto_11477 ?auto_11478 ?auto_11479 ?auto_11480 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11493 - SURFACE
      ?auto_11494 - SURFACE
      ?auto_11495 - SURFACE
      ?auto_11496 - SURFACE
      ?auto_11497 - SURFACE
    )
    :vars
    (
      ?auto_11504 - HOIST
      ?auto_11501 - PLACE
      ?auto_11498 - PLACE
      ?auto_11502 - HOIST
      ?auto_11505 - SURFACE
      ?auto_11507 - SURFACE
      ?auto_11500 - PLACE
      ?auto_11506 - HOIST
      ?auto_11508 - SURFACE
      ?auto_11503 - TRUCK
      ?auto_11499 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11504 ?auto_11501 ) ( IS-CRATE ?auto_11497 ) ( not ( = ?auto_11496 ?auto_11497 ) ) ( not ( = ?auto_11495 ?auto_11496 ) ) ( not ( = ?auto_11495 ?auto_11497 ) ) ( not ( = ?auto_11498 ?auto_11501 ) ) ( HOIST-AT ?auto_11502 ?auto_11498 ) ( not ( = ?auto_11504 ?auto_11502 ) ) ( SURFACE-AT ?auto_11497 ?auto_11498 ) ( ON ?auto_11497 ?auto_11505 ) ( CLEAR ?auto_11497 ) ( not ( = ?auto_11496 ?auto_11505 ) ) ( not ( = ?auto_11497 ?auto_11505 ) ) ( not ( = ?auto_11495 ?auto_11505 ) ) ( IS-CRATE ?auto_11496 ) ( SURFACE-AT ?auto_11496 ?auto_11498 ) ( ON ?auto_11496 ?auto_11507 ) ( CLEAR ?auto_11496 ) ( not ( = ?auto_11496 ?auto_11507 ) ) ( not ( = ?auto_11497 ?auto_11507 ) ) ( not ( = ?auto_11495 ?auto_11507 ) ) ( not ( = ?auto_11505 ?auto_11507 ) ) ( IS-CRATE ?auto_11495 ) ( not ( = ?auto_11494 ?auto_11495 ) ) ( not ( = ?auto_11496 ?auto_11494 ) ) ( not ( = ?auto_11497 ?auto_11494 ) ) ( not ( = ?auto_11505 ?auto_11494 ) ) ( not ( = ?auto_11507 ?auto_11494 ) ) ( not ( = ?auto_11500 ?auto_11501 ) ) ( not ( = ?auto_11498 ?auto_11500 ) ) ( HOIST-AT ?auto_11506 ?auto_11500 ) ( not ( = ?auto_11504 ?auto_11506 ) ) ( not ( = ?auto_11502 ?auto_11506 ) ) ( AVAILABLE ?auto_11506 ) ( SURFACE-AT ?auto_11495 ?auto_11500 ) ( ON ?auto_11495 ?auto_11508 ) ( CLEAR ?auto_11495 ) ( not ( = ?auto_11496 ?auto_11508 ) ) ( not ( = ?auto_11497 ?auto_11508 ) ) ( not ( = ?auto_11495 ?auto_11508 ) ) ( not ( = ?auto_11505 ?auto_11508 ) ) ( not ( = ?auto_11507 ?auto_11508 ) ) ( not ( = ?auto_11494 ?auto_11508 ) ) ( SURFACE-AT ?auto_11493 ?auto_11501 ) ( CLEAR ?auto_11493 ) ( IS-CRATE ?auto_11494 ) ( not ( = ?auto_11493 ?auto_11494 ) ) ( not ( = ?auto_11496 ?auto_11493 ) ) ( not ( = ?auto_11497 ?auto_11493 ) ) ( not ( = ?auto_11495 ?auto_11493 ) ) ( not ( = ?auto_11505 ?auto_11493 ) ) ( not ( = ?auto_11507 ?auto_11493 ) ) ( not ( = ?auto_11508 ?auto_11493 ) ) ( AVAILABLE ?auto_11504 ) ( TRUCK-AT ?auto_11503 ?auto_11498 ) ( AVAILABLE ?auto_11502 ) ( SURFACE-AT ?auto_11494 ?auto_11498 ) ( ON ?auto_11494 ?auto_11499 ) ( CLEAR ?auto_11494 ) ( not ( = ?auto_11496 ?auto_11499 ) ) ( not ( = ?auto_11497 ?auto_11499 ) ) ( not ( = ?auto_11495 ?auto_11499 ) ) ( not ( = ?auto_11505 ?auto_11499 ) ) ( not ( = ?auto_11507 ?auto_11499 ) ) ( not ( = ?auto_11494 ?auto_11499 ) ) ( not ( = ?auto_11508 ?auto_11499 ) ) ( not ( = ?auto_11493 ?auto_11499 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11495 ?auto_11496 ?auto_11497 )
      ( MAKE-4CRATE-VERIFY ?auto_11493 ?auto_11494 ?auto_11495 ?auto_11496 ?auto_11497 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11509 - SURFACE
      ?auto_11510 - SURFACE
    )
    :vars
    (
      ?auto_11518 - HOIST
      ?auto_11514 - PLACE
      ?auto_11524 - SURFACE
      ?auto_11511 - PLACE
      ?auto_11515 - HOIST
      ?auto_11519 - SURFACE
      ?auto_11522 - SURFACE
      ?auto_11517 - SURFACE
      ?auto_11513 - PLACE
      ?auto_11520 - HOIST
      ?auto_11523 - SURFACE
      ?auto_11521 - SURFACE
      ?auto_11512 - SURFACE
      ?auto_11516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11518 ?auto_11514 ) ( IS-CRATE ?auto_11510 ) ( not ( = ?auto_11509 ?auto_11510 ) ) ( not ( = ?auto_11524 ?auto_11509 ) ) ( not ( = ?auto_11524 ?auto_11510 ) ) ( not ( = ?auto_11511 ?auto_11514 ) ) ( HOIST-AT ?auto_11515 ?auto_11511 ) ( not ( = ?auto_11518 ?auto_11515 ) ) ( SURFACE-AT ?auto_11510 ?auto_11511 ) ( ON ?auto_11510 ?auto_11519 ) ( CLEAR ?auto_11510 ) ( not ( = ?auto_11509 ?auto_11519 ) ) ( not ( = ?auto_11510 ?auto_11519 ) ) ( not ( = ?auto_11524 ?auto_11519 ) ) ( IS-CRATE ?auto_11509 ) ( SURFACE-AT ?auto_11509 ?auto_11511 ) ( ON ?auto_11509 ?auto_11522 ) ( CLEAR ?auto_11509 ) ( not ( = ?auto_11509 ?auto_11522 ) ) ( not ( = ?auto_11510 ?auto_11522 ) ) ( not ( = ?auto_11524 ?auto_11522 ) ) ( not ( = ?auto_11519 ?auto_11522 ) ) ( IS-CRATE ?auto_11524 ) ( not ( = ?auto_11517 ?auto_11524 ) ) ( not ( = ?auto_11509 ?auto_11517 ) ) ( not ( = ?auto_11510 ?auto_11517 ) ) ( not ( = ?auto_11519 ?auto_11517 ) ) ( not ( = ?auto_11522 ?auto_11517 ) ) ( not ( = ?auto_11513 ?auto_11514 ) ) ( not ( = ?auto_11511 ?auto_11513 ) ) ( HOIST-AT ?auto_11520 ?auto_11513 ) ( not ( = ?auto_11518 ?auto_11520 ) ) ( not ( = ?auto_11515 ?auto_11520 ) ) ( AVAILABLE ?auto_11520 ) ( SURFACE-AT ?auto_11524 ?auto_11513 ) ( ON ?auto_11524 ?auto_11523 ) ( CLEAR ?auto_11524 ) ( not ( = ?auto_11509 ?auto_11523 ) ) ( not ( = ?auto_11510 ?auto_11523 ) ) ( not ( = ?auto_11524 ?auto_11523 ) ) ( not ( = ?auto_11519 ?auto_11523 ) ) ( not ( = ?auto_11522 ?auto_11523 ) ) ( not ( = ?auto_11517 ?auto_11523 ) ) ( SURFACE-AT ?auto_11521 ?auto_11514 ) ( CLEAR ?auto_11521 ) ( IS-CRATE ?auto_11517 ) ( not ( = ?auto_11521 ?auto_11517 ) ) ( not ( = ?auto_11509 ?auto_11521 ) ) ( not ( = ?auto_11510 ?auto_11521 ) ) ( not ( = ?auto_11524 ?auto_11521 ) ) ( not ( = ?auto_11519 ?auto_11521 ) ) ( not ( = ?auto_11522 ?auto_11521 ) ) ( not ( = ?auto_11523 ?auto_11521 ) ) ( AVAILABLE ?auto_11518 ) ( AVAILABLE ?auto_11515 ) ( SURFACE-AT ?auto_11517 ?auto_11511 ) ( ON ?auto_11517 ?auto_11512 ) ( CLEAR ?auto_11517 ) ( not ( = ?auto_11509 ?auto_11512 ) ) ( not ( = ?auto_11510 ?auto_11512 ) ) ( not ( = ?auto_11524 ?auto_11512 ) ) ( not ( = ?auto_11519 ?auto_11512 ) ) ( not ( = ?auto_11522 ?auto_11512 ) ) ( not ( = ?auto_11517 ?auto_11512 ) ) ( not ( = ?auto_11523 ?auto_11512 ) ) ( not ( = ?auto_11521 ?auto_11512 ) ) ( TRUCK-AT ?auto_11516 ?auto_11514 ) )
    :subtasks
    ( ( !DRIVE ?auto_11516 ?auto_11514 ?auto_11511 )
      ( MAKE-2CRATE ?auto_11524 ?auto_11509 ?auto_11510 )
      ( MAKE-1CRATE-VERIFY ?auto_11509 ?auto_11510 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11525 - SURFACE
      ?auto_11526 - SURFACE
      ?auto_11527 - SURFACE
    )
    :vars
    (
      ?auto_11531 - HOIST
      ?auto_11530 - PLACE
      ?auto_11536 - PLACE
      ?auto_11537 - HOIST
      ?auto_11529 - SURFACE
      ?auto_11535 - SURFACE
      ?auto_11534 - SURFACE
      ?auto_11538 - PLACE
      ?auto_11539 - HOIST
      ?auto_11528 - SURFACE
      ?auto_11540 - SURFACE
      ?auto_11532 - SURFACE
      ?auto_11533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11531 ?auto_11530 ) ( IS-CRATE ?auto_11527 ) ( not ( = ?auto_11526 ?auto_11527 ) ) ( not ( = ?auto_11525 ?auto_11526 ) ) ( not ( = ?auto_11525 ?auto_11527 ) ) ( not ( = ?auto_11536 ?auto_11530 ) ) ( HOIST-AT ?auto_11537 ?auto_11536 ) ( not ( = ?auto_11531 ?auto_11537 ) ) ( SURFACE-AT ?auto_11527 ?auto_11536 ) ( ON ?auto_11527 ?auto_11529 ) ( CLEAR ?auto_11527 ) ( not ( = ?auto_11526 ?auto_11529 ) ) ( not ( = ?auto_11527 ?auto_11529 ) ) ( not ( = ?auto_11525 ?auto_11529 ) ) ( IS-CRATE ?auto_11526 ) ( SURFACE-AT ?auto_11526 ?auto_11536 ) ( ON ?auto_11526 ?auto_11535 ) ( CLEAR ?auto_11526 ) ( not ( = ?auto_11526 ?auto_11535 ) ) ( not ( = ?auto_11527 ?auto_11535 ) ) ( not ( = ?auto_11525 ?auto_11535 ) ) ( not ( = ?auto_11529 ?auto_11535 ) ) ( IS-CRATE ?auto_11525 ) ( not ( = ?auto_11534 ?auto_11525 ) ) ( not ( = ?auto_11526 ?auto_11534 ) ) ( not ( = ?auto_11527 ?auto_11534 ) ) ( not ( = ?auto_11529 ?auto_11534 ) ) ( not ( = ?auto_11535 ?auto_11534 ) ) ( not ( = ?auto_11538 ?auto_11530 ) ) ( not ( = ?auto_11536 ?auto_11538 ) ) ( HOIST-AT ?auto_11539 ?auto_11538 ) ( not ( = ?auto_11531 ?auto_11539 ) ) ( not ( = ?auto_11537 ?auto_11539 ) ) ( AVAILABLE ?auto_11539 ) ( SURFACE-AT ?auto_11525 ?auto_11538 ) ( ON ?auto_11525 ?auto_11528 ) ( CLEAR ?auto_11525 ) ( not ( = ?auto_11526 ?auto_11528 ) ) ( not ( = ?auto_11527 ?auto_11528 ) ) ( not ( = ?auto_11525 ?auto_11528 ) ) ( not ( = ?auto_11529 ?auto_11528 ) ) ( not ( = ?auto_11535 ?auto_11528 ) ) ( not ( = ?auto_11534 ?auto_11528 ) ) ( SURFACE-AT ?auto_11540 ?auto_11530 ) ( CLEAR ?auto_11540 ) ( IS-CRATE ?auto_11534 ) ( not ( = ?auto_11540 ?auto_11534 ) ) ( not ( = ?auto_11526 ?auto_11540 ) ) ( not ( = ?auto_11527 ?auto_11540 ) ) ( not ( = ?auto_11525 ?auto_11540 ) ) ( not ( = ?auto_11529 ?auto_11540 ) ) ( not ( = ?auto_11535 ?auto_11540 ) ) ( not ( = ?auto_11528 ?auto_11540 ) ) ( AVAILABLE ?auto_11531 ) ( AVAILABLE ?auto_11537 ) ( SURFACE-AT ?auto_11534 ?auto_11536 ) ( ON ?auto_11534 ?auto_11532 ) ( CLEAR ?auto_11534 ) ( not ( = ?auto_11526 ?auto_11532 ) ) ( not ( = ?auto_11527 ?auto_11532 ) ) ( not ( = ?auto_11525 ?auto_11532 ) ) ( not ( = ?auto_11529 ?auto_11532 ) ) ( not ( = ?auto_11535 ?auto_11532 ) ) ( not ( = ?auto_11534 ?auto_11532 ) ) ( not ( = ?auto_11528 ?auto_11532 ) ) ( not ( = ?auto_11540 ?auto_11532 ) ) ( TRUCK-AT ?auto_11533 ?auto_11530 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11526 ?auto_11527 )
      ( MAKE-2CRATE-VERIFY ?auto_11525 ?auto_11526 ?auto_11527 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11541 - SURFACE
      ?auto_11542 - SURFACE
      ?auto_11543 - SURFACE
      ?auto_11544 - SURFACE
    )
    :vars
    (
      ?auto_11552 - HOIST
      ?auto_11556 - PLACE
      ?auto_11550 - PLACE
      ?auto_11546 - HOIST
      ?auto_11554 - SURFACE
      ?auto_11555 - SURFACE
      ?auto_11549 - PLACE
      ?auto_11553 - HOIST
      ?auto_11545 - SURFACE
      ?auto_11547 - SURFACE
      ?auto_11551 - SURFACE
      ?auto_11548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11552 ?auto_11556 ) ( IS-CRATE ?auto_11544 ) ( not ( = ?auto_11543 ?auto_11544 ) ) ( not ( = ?auto_11542 ?auto_11543 ) ) ( not ( = ?auto_11542 ?auto_11544 ) ) ( not ( = ?auto_11550 ?auto_11556 ) ) ( HOIST-AT ?auto_11546 ?auto_11550 ) ( not ( = ?auto_11552 ?auto_11546 ) ) ( SURFACE-AT ?auto_11544 ?auto_11550 ) ( ON ?auto_11544 ?auto_11554 ) ( CLEAR ?auto_11544 ) ( not ( = ?auto_11543 ?auto_11554 ) ) ( not ( = ?auto_11544 ?auto_11554 ) ) ( not ( = ?auto_11542 ?auto_11554 ) ) ( IS-CRATE ?auto_11543 ) ( SURFACE-AT ?auto_11543 ?auto_11550 ) ( ON ?auto_11543 ?auto_11555 ) ( CLEAR ?auto_11543 ) ( not ( = ?auto_11543 ?auto_11555 ) ) ( not ( = ?auto_11544 ?auto_11555 ) ) ( not ( = ?auto_11542 ?auto_11555 ) ) ( not ( = ?auto_11554 ?auto_11555 ) ) ( IS-CRATE ?auto_11542 ) ( not ( = ?auto_11541 ?auto_11542 ) ) ( not ( = ?auto_11543 ?auto_11541 ) ) ( not ( = ?auto_11544 ?auto_11541 ) ) ( not ( = ?auto_11554 ?auto_11541 ) ) ( not ( = ?auto_11555 ?auto_11541 ) ) ( not ( = ?auto_11549 ?auto_11556 ) ) ( not ( = ?auto_11550 ?auto_11549 ) ) ( HOIST-AT ?auto_11553 ?auto_11549 ) ( not ( = ?auto_11552 ?auto_11553 ) ) ( not ( = ?auto_11546 ?auto_11553 ) ) ( AVAILABLE ?auto_11553 ) ( SURFACE-AT ?auto_11542 ?auto_11549 ) ( ON ?auto_11542 ?auto_11545 ) ( CLEAR ?auto_11542 ) ( not ( = ?auto_11543 ?auto_11545 ) ) ( not ( = ?auto_11544 ?auto_11545 ) ) ( not ( = ?auto_11542 ?auto_11545 ) ) ( not ( = ?auto_11554 ?auto_11545 ) ) ( not ( = ?auto_11555 ?auto_11545 ) ) ( not ( = ?auto_11541 ?auto_11545 ) ) ( SURFACE-AT ?auto_11547 ?auto_11556 ) ( CLEAR ?auto_11547 ) ( IS-CRATE ?auto_11541 ) ( not ( = ?auto_11547 ?auto_11541 ) ) ( not ( = ?auto_11543 ?auto_11547 ) ) ( not ( = ?auto_11544 ?auto_11547 ) ) ( not ( = ?auto_11542 ?auto_11547 ) ) ( not ( = ?auto_11554 ?auto_11547 ) ) ( not ( = ?auto_11555 ?auto_11547 ) ) ( not ( = ?auto_11545 ?auto_11547 ) ) ( AVAILABLE ?auto_11552 ) ( AVAILABLE ?auto_11546 ) ( SURFACE-AT ?auto_11541 ?auto_11550 ) ( ON ?auto_11541 ?auto_11551 ) ( CLEAR ?auto_11541 ) ( not ( = ?auto_11543 ?auto_11551 ) ) ( not ( = ?auto_11544 ?auto_11551 ) ) ( not ( = ?auto_11542 ?auto_11551 ) ) ( not ( = ?auto_11554 ?auto_11551 ) ) ( not ( = ?auto_11555 ?auto_11551 ) ) ( not ( = ?auto_11541 ?auto_11551 ) ) ( not ( = ?auto_11545 ?auto_11551 ) ) ( not ( = ?auto_11547 ?auto_11551 ) ) ( TRUCK-AT ?auto_11548 ?auto_11556 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11542 ?auto_11543 ?auto_11544 )
      ( MAKE-3CRATE-VERIFY ?auto_11541 ?auto_11542 ?auto_11543 ?auto_11544 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11557 - SURFACE
      ?auto_11558 - SURFACE
      ?auto_11559 - SURFACE
      ?auto_11560 - SURFACE
      ?auto_11561 - SURFACE
    )
    :vars
    (
      ?auto_11568 - HOIST
      ?auto_11572 - PLACE
      ?auto_11566 - PLACE
      ?auto_11563 - HOIST
      ?auto_11570 - SURFACE
      ?auto_11571 - SURFACE
      ?auto_11565 - PLACE
      ?auto_11569 - HOIST
      ?auto_11562 - SURFACE
      ?auto_11567 - SURFACE
      ?auto_11564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11568 ?auto_11572 ) ( IS-CRATE ?auto_11561 ) ( not ( = ?auto_11560 ?auto_11561 ) ) ( not ( = ?auto_11559 ?auto_11560 ) ) ( not ( = ?auto_11559 ?auto_11561 ) ) ( not ( = ?auto_11566 ?auto_11572 ) ) ( HOIST-AT ?auto_11563 ?auto_11566 ) ( not ( = ?auto_11568 ?auto_11563 ) ) ( SURFACE-AT ?auto_11561 ?auto_11566 ) ( ON ?auto_11561 ?auto_11570 ) ( CLEAR ?auto_11561 ) ( not ( = ?auto_11560 ?auto_11570 ) ) ( not ( = ?auto_11561 ?auto_11570 ) ) ( not ( = ?auto_11559 ?auto_11570 ) ) ( IS-CRATE ?auto_11560 ) ( SURFACE-AT ?auto_11560 ?auto_11566 ) ( ON ?auto_11560 ?auto_11571 ) ( CLEAR ?auto_11560 ) ( not ( = ?auto_11560 ?auto_11571 ) ) ( not ( = ?auto_11561 ?auto_11571 ) ) ( not ( = ?auto_11559 ?auto_11571 ) ) ( not ( = ?auto_11570 ?auto_11571 ) ) ( IS-CRATE ?auto_11559 ) ( not ( = ?auto_11558 ?auto_11559 ) ) ( not ( = ?auto_11560 ?auto_11558 ) ) ( not ( = ?auto_11561 ?auto_11558 ) ) ( not ( = ?auto_11570 ?auto_11558 ) ) ( not ( = ?auto_11571 ?auto_11558 ) ) ( not ( = ?auto_11565 ?auto_11572 ) ) ( not ( = ?auto_11566 ?auto_11565 ) ) ( HOIST-AT ?auto_11569 ?auto_11565 ) ( not ( = ?auto_11568 ?auto_11569 ) ) ( not ( = ?auto_11563 ?auto_11569 ) ) ( AVAILABLE ?auto_11569 ) ( SURFACE-AT ?auto_11559 ?auto_11565 ) ( ON ?auto_11559 ?auto_11562 ) ( CLEAR ?auto_11559 ) ( not ( = ?auto_11560 ?auto_11562 ) ) ( not ( = ?auto_11561 ?auto_11562 ) ) ( not ( = ?auto_11559 ?auto_11562 ) ) ( not ( = ?auto_11570 ?auto_11562 ) ) ( not ( = ?auto_11571 ?auto_11562 ) ) ( not ( = ?auto_11558 ?auto_11562 ) ) ( SURFACE-AT ?auto_11557 ?auto_11572 ) ( CLEAR ?auto_11557 ) ( IS-CRATE ?auto_11558 ) ( not ( = ?auto_11557 ?auto_11558 ) ) ( not ( = ?auto_11560 ?auto_11557 ) ) ( not ( = ?auto_11561 ?auto_11557 ) ) ( not ( = ?auto_11559 ?auto_11557 ) ) ( not ( = ?auto_11570 ?auto_11557 ) ) ( not ( = ?auto_11571 ?auto_11557 ) ) ( not ( = ?auto_11562 ?auto_11557 ) ) ( AVAILABLE ?auto_11568 ) ( AVAILABLE ?auto_11563 ) ( SURFACE-AT ?auto_11558 ?auto_11566 ) ( ON ?auto_11558 ?auto_11567 ) ( CLEAR ?auto_11558 ) ( not ( = ?auto_11560 ?auto_11567 ) ) ( not ( = ?auto_11561 ?auto_11567 ) ) ( not ( = ?auto_11559 ?auto_11567 ) ) ( not ( = ?auto_11570 ?auto_11567 ) ) ( not ( = ?auto_11571 ?auto_11567 ) ) ( not ( = ?auto_11558 ?auto_11567 ) ) ( not ( = ?auto_11562 ?auto_11567 ) ) ( not ( = ?auto_11557 ?auto_11567 ) ) ( TRUCK-AT ?auto_11564 ?auto_11572 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11559 ?auto_11560 ?auto_11561 )
      ( MAKE-4CRATE-VERIFY ?auto_11557 ?auto_11558 ?auto_11559 ?auto_11560 ?auto_11561 ) )
  )

)

