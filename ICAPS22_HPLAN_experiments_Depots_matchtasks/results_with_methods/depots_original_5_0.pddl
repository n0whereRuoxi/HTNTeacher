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
      ?auto_15638 - SURFACE
      ?auto_15639 - SURFACE
    )
    :vars
    (
      ?auto_15640 - HOIST
      ?auto_15641 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15640 ?auto_15641 ) ( SURFACE-AT ?auto_15638 ?auto_15641 ) ( CLEAR ?auto_15638 ) ( LIFTING ?auto_15640 ?auto_15639 ) ( IS-CRATE ?auto_15639 ) ( not ( = ?auto_15638 ?auto_15639 ) ) )
    :subtasks
    ( ( !DROP ?auto_15640 ?auto_15639 ?auto_15638 ?auto_15641 )
      ( MAKE-1CRATE-VERIFY ?auto_15638 ?auto_15639 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15642 - SURFACE
      ?auto_15643 - SURFACE
    )
    :vars
    (
      ?auto_15645 - HOIST
      ?auto_15644 - PLACE
      ?auto_15646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15645 ?auto_15644 ) ( SURFACE-AT ?auto_15642 ?auto_15644 ) ( CLEAR ?auto_15642 ) ( IS-CRATE ?auto_15643 ) ( not ( = ?auto_15642 ?auto_15643 ) ) ( TRUCK-AT ?auto_15646 ?auto_15644 ) ( AVAILABLE ?auto_15645 ) ( IN ?auto_15643 ?auto_15646 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15645 ?auto_15643 ?auto_15646 ?auto_15644 )
      ( MAKE-1CRATE ?auto_15642 ?auto_15643 )
      ( MAKE-1CRATE-VERIFY ?auto_15642 ?auto_15643 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15647 - SURFACE
      ?auto_15648 - SURFACE
    )
    :vars
    (
      ?auto_15649 - HOIST
      ?auto_15650 - PLACE
      ?auto_15651 - TRUCK
      ?auto_15652 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15649 ?auto_15650 ) ( SURFACE-AT ?auto_15647 ?auto_15650 ) ( CLEAR ?auto_15647 ) ( IS-CRATE ?auto_15648 ) ( not ( = ?auto_15647 ?auto_15648 ) ) ( AVAILABLE ?auto_15649 ) ( IN ?auto_15648 ?auto_15651 ) ( TRUCK-AT ?auto_15651 ?auto_15652 ) ( not ( = ?auto_15652 ?auto_15650 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15651 ?auto_15652 ?auto_15650 )
      ( MAKE-1CRATE ?auto_15647 ?auto_15648 )
      ( MAKE-1CRATE-VERIFY ?auto_15647 ?auto_15648 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15653 - SURFACE
      ?auto_15654 - SURFACE
    )
    :vars
    (
      ?auto_15655 - HOIST
      ?auto_15658 - PLACE
      ?auto_15657 - TRUCK
      ?auto_15656 - PLACE
      ?auto_15659 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15655 ?auto_15658 ) ( SURFACE-AT ?auto_15653 ?auto_15658 ) ( CLEAR ?auto_15653 ) ( IS-CRATE ?auto_15654 ) ( not ( = ?auto_15653 ?auto_15654 ) ) ( AVAILABLE ?auto_15655 ) ( TRUCK-AT ?auto_15657 ?auto_15656 ) ( not ( = ?auto_15656 ?auto_15658 ) ) ( HOIST-AT ?auto_15659 ?auto_15656 ) ( LIFTING ?auto_15659 ?auto_15654 ) ( not ( = ?auto_15655 ?auto_15659 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15659 ?auto_15654 ?auto_15657 ?auto_15656 )
      ( MAKE-1CRATE ?auto_15653 ?auto_15654 )
      ( MAKE-1CRATE-VERIFY ?auto_15653 ?auto_15654 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15660 - SURFACE
      ?auto_15661 - SURFACE
    )
    :vars
    (
      ?auto_15666 - HOIST
      ?auto_15664 - PLACE
      ?auto_15665 - TRUCK
      ?auto_15662 - PLACE
      ?auto_15663 - HOIST
      ?auto_15667 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15666 ?auto_15664 ) ( SURFACE-AT ?auto_15660 ?auto_15664 ) ( CLEAR ?auto_15660 ) ( IS-CRATE ?auto_15661 ) ( not ( = ?auto_15660 ?auto_15661 ) ) ( AVAILABLE ?auto_15666 ) ( TRUCK-AT ?auto_15665 ?auto_15662 ) ( not ( = ?auto_15662 ?auto_15664 ) ) ( HOIST-AT ?auto_15663 ?auto_15662 ) ( not ( = ?auto_15666 ?auto_15663 ) ) ( AVAILABLE ?auto_15663 ) ( SURFACE-AT ?auto_15661 ?auto_15662 ) ( ON ?auto_15661 ?auto_15667 ) ( CLEAR ?auto_15661 ) ( not ( = ?auto_15660 ?auto_15667 ) ) ( not ( = ?auto_15661 ?auto_15667 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15663 ?auto_15661 ?auto_15667 ?auto_15662 )
      ( MAKE-1CRATE ?auto_15660 ?auto_15661 )
      ( MAKE-1CRATE-VERIFY ?auto_15660 ?auto_15661 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15668 - SURFACE
      ?auto_15669 - SURFACE
    )
    :vars
    (
      ?auto_15672 - HOIST
      ?auto_15673 - PLACE
      ?auto_15670 - PLACE
      ?auto_15674 - HOIST
      ?auto_15671 - SURFACE
      ?auto_15675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15672 ?auto_15673 ) ( SURFACE-AT ?auto_15668 ?auto_15673 ) ( CLEAR ?auto_15668 ) ( IS-CRATE ?auto_15669 ) ( not ( = ?auto_15668 ?auto_15669 ) ) ( AVAILABLE ?auto_15672 ) ( not ( = ?auto_15670 ?auto_15673 ) ) ( HOIST-AT ?auto_15674 ?auto_15670 ) ( not ( = ?auto_15672 ?auto_15674 ) ) ( AVAILABLE ?auto_15674 ) ( SURFACE-AT ?auto_15669 ?auto_15670 ) ( ON ?auto_15669 ?auto_15671 ) ( CLEAR ?auto_15669 ) ( not ( = ?auto_15668 ?auto_15671 ) ) ( not ( = ?auto_15669 ?auto_15671 ) ) ( TRUCK-AT ?auto_15675 ?auto_15673 ) )
    :subtasks
    ( ( !DRIVE ?auto_15675 ?auto_15673 ?auto_15670 )
      ( MAKE-1CRATE ?auto_15668 ?auto_15669 )
      ( MAKE-1CRATE-VERIFY ?auto_15668 ?auto_15669 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15681 - SURFACE
      ?auto_15682 - SURFACE
    )
    :vars
    (
      ?auto_15683 - HOIST
      ?auto_15684 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15683 ?auto_15684 ) ( SURFACE-AT ?auto_15681 ?auto_15684 ) ( CLEAR ?auto_15681 ) ( LIFTING ?auto_15683 ?auto_15682 ) ( IS-CRATE ?auto_15682 ) ( not ( = ?auto_15681 ?auto_15682 ) ) )
    :subtasks
    ( ( !DROP ?auto_15683 ?auto_15682 ?auto_15681 ?auto_15684 )
      ( MAKE-1CRATE-VERIFY ?auto_15681 ?auto_15682 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15685 - SURFACE
      ?auto_15686 - SURFACE
      ?auto_15687 - SURFACE
    )
    :vars
    (
      ?auto_15688 - HOIST
      ?auto_15689 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15688 ?auto_15689 ) ( SURFACE-AT ?auto_15686 ?auto_15689 ) ( CLEAR ?auto_15686 ) ( LIFTING ?auto_15688 ?auto_15687 ) ( IS-CRATE ?auto_15687 ) ( not ( = ?auto_15686 ?auto_15687 ) ) ( ON ?auto_15686 ?auto_15685 ) ( not ( = ?auto_15685 ?auto_15686 ) ) ( not ( = ?auto_15685 ?auto_15687 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15686 ?auto_15687 )
      ( MAKE-2CRATE-VERIFY ?auto_15685 ?auto_15686 ?auto_15687 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15690 - SURFACE
      ?auto_15691 - SURFACE
    )
    :vars
    (
      ?auto_15692 - HOIST
      ?auto_15693 - PLACE
      ?auto_15694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15692 ?auto_15693 ) ( SURFACE-AT ?auto_15690 ?auto_15693 ) ( CLEAR ?auto_15690 ) ( IS-CRATE ?auto_15691 ) ( not ( = ?auto_15690 ?auto_15691 ) ) ( TRUCK-AT ?auto_15694 ?auto_15693 ) ( AVAILABLE ?auto_15692 ) ( IN ?auto_15691 ?auto_15694 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15692 ?auto_15691 ?auto_15694 ?auto_15693 )
      ( MAKE-1CRATE ?auto_15690 ?auto_15691 )
      ( MAKE-1CRATE-VERIFY ?auto_15690 ?auto_15691 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15695 - SURFACE
      ?auto_15696 - SURFACE
      ?auto_15697 - SURFACE
    )
    :vars
    (
      ?auto_15698 - HOIST
      ?auto_15700 - PLACE
      ?auto_15699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15698 ?auto_15700 ) ( SURFACE-AT ?auto_15696 ?auto_15700 ) ( CLEAR ?auto_15696 ) ( IS-CRATE ?auto_15697 ) ( not ( = ?auto_15696 ?auto_15697 ) ) ( TRUCK-AT ?auto_15699 ?auto_15700 ) ( AVAILABLE ?auto_15698 ) ( IN ?auto_15697 ?auto_15699 ) ( ON ?auto_15696 ?auto_15695 ) ( not ( = ?auto_15695 ?auto_15696 ) ) ( not ( = ?auto_15695 ?auto_15697 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15696 ?auto_15697 )
      ( MAKE-2CRATE-VERIFY ?auto_15695 ?auto_15696 ?auto_15697 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15701 - SURFACE
      ?auto_15702 - SURFACE
    )
    :vars
    (
      ?auto_15704 - HOIST
      ?auto_15703 - PLACE
      ?auto_15706 - TRUCK
      ?auto_15705 - SURFACE
      ?auto_15707 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15704 ?auto_15703 ) ( SURFACE-AT ?auto_15701 ?auto_15703 ) ( CLEAR ?auto_15701 ) ( IS-CRATE ?auto_15702 ) ( not ( = ?auto_15701 ?auto_15702 ) ) ( AVAILABLE ?auto_15704 ) ( IN ?auto_15702 ?auto_15706 ) ( ON ?auto_15701 ?auto_15705 ) ( not ( = ?auto_15705 ?auto_15701 ) ) ( not ( = ?auto_15705 ?auto_15702 ) ) ( TRUCK-AT ?auto_15706 ?auto_15707 ) ( not ( = ?auto_15707 ?auto_15703 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15706 ?auto_15707 ?auto_15703 )
      ( MAKE-2CRATE ?auto_15705 ?auto_15701 ?auto_15702 )
      ( MAKE-1CRATE-VERIFY ?auto_15701 ?auto_15702 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15708 - SURFACE
      ?auto_15709 - SURFACE
      ?auto_15710 - SURFACE
    )
    :vars
    (
      ?auto_15713 - HOIST
      ?auto_15714 - PLACE
      ?auto_15711 - TRUCK
      ?auto_15712 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15713 ?auto_15714 ) ( SURFACE-AT ?auto_15709 ?auto_15714 ) ( CLEAR ?auto_15709 ) ( IS-CRATE ?auto_15710 ) ( not ( = ?auto_15709 ?auto_15710 ) ) ( AVAILABLE ?auto_15713 ) ( IN ?auto_15710 ?auto_15711 ) ( ON ?auto_15709 ?auto_15708 ) ( not ( = ?auto_15708 ?auto_15709 ) ) ( not ( = ?auto_15708 ?auto_15710 ) ) ( TRUCK-AT ?auto_15711 ?auto_15712 ) ( not ( = ?auto_15712 ?auto_15714 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15709 ?auto_15710 )
      ( MAKE-2CRATE-VERIFY ?auto_15708 ?auto_15709 ?auto_15710 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15715 - SURFACE
      ?auto_15716 - SURFACE
    )
    :vars
    (
      ?auto_15719 - HOIST
      ?auto_15720 - PLACE
      ?auto_15717 - SURFACE
      ?auto_15718 - TRUCK
      ?auto_15721 - PLACE
      ?auto_15722 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15719 ?auto_15720 ) ( SURFACE-AT ?auto_15715 ?auto_15720 ) ( CLEAR ?auto_15715 ) ( IS-CRATE ?auto_15716 ) ( not ( = ?auto_15715 ?auto_15716 ) ) ( AVAILABLE ?auto_15719 ) ( ON ?auto_15715 ?auto_15717 ) ( not ( = ?auto_15717 ?auto_15715 ) ) ( not ( = ?auto_15717 ?auto_15716 ) ) ( TRUCK-AT ?auto_15718 ?auto_15721 ) ( not ( = ?auto_15721 ?auto_15720 ) ) ( HOIST-AT ?auto_15722 ?auto_15721 ) ( LIFTING ?auto_15722 ?auto_15716 ) ( not ( = ?auto_15719 ?auto_15722 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15722 ?auto_15716 ?auto_15718 ?auto_15721 )
      ( MAKE-2CRATE ?auto_15717 ?auto_15715 ?auto_15716 )
      ( MAKE-1CRATE-VERIFY ?auto_15715 ?auto_15716 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15723 - SURFACE
      ?auto_15724 - SURFACE
      ?auto_15725 - SURFACE
    )
    :vars
    (
      ?auto_15727 - HOIST
      ?auto_15728 - PLACE
      ?auto_15729 - TRUCK
      ?auto_15730 - PLACE
      ?auto_15726 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15727 ?auto_15728 ) ( SURFACE-AT ?auto_15724 ?auto_15728 ) ( CLEAR ?auto_15724 ) ( IS-CRATE ?auto_15725 ) ( not ( = ?auto_15724 ?auto_15725 ) ) ( AVAILABLE ?auto_15727 ) ( ON ?auto_15724 ?auto_15723 ) ( not ( = ?auto_15723 ?auto_15724 ) ) ( not ( = ?auto_15723 ?auto_15725 ) ) ( TRUCK-AT ?auto_15729 ?auto_15730 ) ( not ( = ?auto_15730 ?auto_15728 ) ) ( HOIST-AT ?auto_15726 ?auto_15730 ) ( LIFTING ?auto_15726 ?auto_15725 ) ( not ( = ?auto_15727 ?auto_15726 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15724 ?auto_15725 )
      ( MAKE-2CRATE-VERIFY ?auto_15723 ?auto_15724 ?auto_15725 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15731 - SURFACE
      ?auto_15732 - SURFACE
    )
    :vars
    (
      ?auto_15735 - HOIST
      ?auto_15734 - PLACE
      ?auto_15736 - SURFACE
      ?auto_15738 - TRUCK
      ?auto_15733 - PLACE
      ?auto_15737 - HOIST
      ?auto_15739 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15735 ?auto_15734 ) ( SURFACE-AT ?auto_15731 ?auto_15734 ) ( CLEAR ?auto_15731 ) ( IS-CRATE ?auto_15732 ) ( not ( = ?auto_15731 ?auto_15732 ) ) ( AVAILABLE ?auto_15735 ) ( ON ?auto_15731 ?auto_15736 ) ( not ( = ?auto_15736 ?auto_15731 ) ) ( not ( = ?auto_15736 ?auto_15732 ) ) ( TRUCK-AT ?auto_15738 ?auto_15733 ) ( not ( = ?auto_15733 ?auto_15734 ) ) ( HOIST-AT ?auto_15737 ?auto_15733 ) ( not ( = ?auto_15735 ?auto_15737 ) ) ( AVAILABLE ?auto_15737 ) ( SURFACE-AT ?auto_15732 ?auto_15733 ) ( ON ?auto_15732 ?auto_15739 ) ( CLEAR ?auto_15732 ) ( not ( = ?auto_15731 ?auto_15739 ) ) ( not ( = ?auto_15732 ?auto_15739 ) ) ( not ( = ?auto_15736 ?auto_15739 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15737 ?auto_15732 ?auto_15739 ?auto_15733 )
      ( MAKE-2CRATE ?auto_15736 ?auto_15731 ?auto_15732 )
      ( MAKE-1CRATE-VERIFY ?auto_15731 ?auto_15732 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15740 - SURFACE
      ?auto_15741 - SURFACE
      ?auto_15742 - SURFACE
    )
    :vars
    (
      ?auto_15746 - HOIST
      ?auto_15744 - PLACE
      ?auto_15748 - TRUCK
      ?auto_15745 - PLACE
      ?auto_15747 - HOIST
      ?auto_15743 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15746 ?auto_15744 ) ( SURFACE-AT ?auto_15741 ?auto_15744 ) ( CLEAR ?auto_15741 ) ( IS-CRATE ?auto_15742 ) ( not ( = ?auto_15741 ?auto_15742 ) ) ( AVAILABLE ?auto_15746 ) ( ON ?auto_15741 ?auto_15740 ) ( not ( = ?auto_15740 ?auto_15741 ) ) ( not ( = ?auto_15740 ?auto_15742 ) ) ( TRUCK-AT ?auto_15748 ?auto_15745 ) ( not ( = ?auto_15745 ?auto_15744 ) ) ( HOIST-AT ?auto_15747 ?auto_15745 ) ( not ( = ?auto_15746 ?auto_15747 ) ) ( AVAILABLE ?auto_15747 ) ( SURFACE-AT ?auto_15742 ?auto_15745 ) ( ON ?auto_15742 ?auto_15743 ) ( CLEAR ?auto_15742 ) ( not ( = ?auto_15741 ?auto_15743 ) ) ( not ( = ?auto_15742 ?auto_15743 ) ) ( not ( = ?auto_15740 ?auto_15743 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15741 ?auto_15742 )
      ( MAKE-2CRATE-VERIFY ?auto_15740 ?auto_15741 ?auto_15742 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15749 - SURFACE
      ?auto_15750 - SURFACE
    )
    :vars
    (
      ?auto_15755 - HOIST
      ?auto_15754 - PLACE
      ?auto_15752 - SURFACE
      ?auto_15751 - PLACE
      ?auto_15753 - HOIST
      ?auto_15757 - SURFACE
      ?auto_15756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15755 ?auto_15754 ) ( SURFACE-AT ?auto_15749 ?auto_15754 ) ( CLEAR ?auto_15749 ) ( IS-CRATE ?auto_15750 ) ( not ( = ?auto_15749 ?auto_15750 ) ) ( AVAILABLE ?auto_15755 ) ( ON ?auto_15749 ?auto_15752 ) ( not ( = ?auto_15752 ?auto_15749 ) ) ( not ( = ?auto_15752 ?auto_15750 ) ) ( not ( = ?auto_15751 ?auto_15754 ) ) ( HOIST-AT ?auto_15753 ?auto_15751 ) ( not ( = ?auto_15755 ?auto_15753 ) ) ( AVAILABLE ?auto_15753 ) ( SURFACE-AT ?auto_15750 ?auto_15751 ) ( ON ?auto_15750 ?auto_15757 ) ( CLEAR ?auto_15750 ) ( not ( = ?auto_15749 ?auto_15757 ) ) ( not ( = ?auto_15750 ?auto_15757 ) ) ( not ( = ?auto_15752 ?auto_15757 ) ) ( TRUCK-AT ?auto_15756 ?auto_15754 ) )
    :subtasks
    ( ( !DRIVE ?auto_15756 ?auto_15754 ?auto_15751 )
      ( MAKE-2CRATE ?auto_15752 ?auto_15749 ?auto_15750 )
      ( MAKE-1CRATE-VERIFY ?auto_15749 ?auto_15750 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15758 - SURFACE
      ?auto_15759 - SURFACE
      ?auto_15760 - SURFACE
    )
    :vars
    (
      ?auto_15763 - HOIST
      ?auto_15761 - PLACE
      ?auto_15764 - PLACE
      ?auto_15762 - HOIST
      ?auto_15766 - SURFACE
      ?auto_15765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15763 ?auto_15761 ) ( SURFACE-AT ?auto_15759 ?auto_15761 ) ( CLEAR ?auto_15759 ) ( IS-CRATE ?auto_15760 ) ( not ( = ?auto_15759 ?auto_15760 ) ) ( AVAILABLE ?auto_15763 ) ( ON ?auto_15759 ?auto_15758 ) ( not ( = ?auto_15758 ?auto_15759 ) ) ( not ( = ?auto_15758 ?auto_15760 ) ) ( not ( = ?auto_15764 ?auto_15761 ) ) ( HOIST-AT ?auto_15762 ?auto_15764 ) ( not ( = ?auto_15763 ?auto_15762 ) ) ( AVAILABLE ?auto_15762 ) ( SURFACE-AT ?auto_15760 ?auto_15764 ) ( ON ?auto_15760 ?auto_15766 ) ( CLEAR ?auto_15760 ) ( not ( = ?auto_15759 ?auto_15766 ) ) ( not ( = ?auto_15760 ?auto_15766 ) ) ( not ( = ?auto_15758 ?auto_15766 ) ) ( TRUCK-AT ?auto_15765 ?auto_15761 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15759 ?auto_15760 )
      ( MAKE-2CRATE-VERIFY ?auto_15758 ?auto_15759 ?auto_15760 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15767 - SURFACE
      ?auto_15768 - SURFACE
    )
    :vars
    (
      ?auto_15772 - HOIST
      ?auto_15771 - PLACE
      ?auto_15770 - SURFACE
      ?auto_15773 - PLACE
      ?auto_15769 - HOIST
      ?auto_15775 - SURFACE
      ?auto_15774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15772 ?auto_15771 ) ( IS-CRATE ?auto_15768 ) ( not ( = ?auto_15767 ?auto_15768 ) ) ( not ( = ?auto_15770 ?auto_15767 ) ) ( not ( = ?auto_15770 ?auto_15768 ) ) ( not ( = ?auto_15773 ?auto_15771 ) ) ( HOIST-AT ?auto_15769 ?auto_15773 ) ( not ( = ?auto_15772 ?auto_15769 ) ) ( AVAILABLE ?auto_15769 ) ( SURFACE-AT ?auto_15768 ?auto_15773 ) ( ON ?auto_15768 ?auto_15775 ) ( CLEAR ?auto_15768 ) ( not ( = ?auto_15767 ?auto_15775 ) ) ( not ( = ?auto_15768 ?auto_15775 ) ) ( not ( = ?auto_15770 ?auto_15775 ) ) ( TRUCK-AT ?auto_15774 ?auto_15771 ) ( SURFACE-AT ?auto_15770 ?auto_15771 ) ( CLEAR ?auto_15770 ) ( LIFTING ?auto_15772 ?auto_15767 ) ( IS-CRATE ?auto_15767 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15770 ?auto_15767 )
      ( MAKE-2CRATE ?auto_15770 ?auto_15767 ?auto_15768 )
      ( MAKE-1CRATE-VERIFY ?auto_15767 ?auto_15768 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15776 - SURFACE
      ?auto_15777 - SURFACE
      ?auto_15778 - SURFACE
    )
    :vars
    (
      ?auto_15783 - HOIST
      ?auto_15779 - PLACE
      ?auto_15782 - PLACE
      ?auto_15780 - HOIST
      ?auto_15781 - SURFACE
      ?auto_15784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15783 ?auto_15779 ) ( IS-CRATE ?auto_15778 ) ( not ( = ?auto_15777 ?auto_15778 ) ) ( not ( = ?auto_15776 ?auto_15777 ) ) ( not ( = ?auto_15776 ?auto_15778 ) ) ( not ( = ?auto_15782 ?auto_15779 ) ) ( HOIST-AT ?auto_15780 ?auto_15782 ) ( not ( = ?auto_15783 ?auto_15780 ) ) ( AVAILABLE ?auto_15780 ) ( SURFACE-AT ?auto_15778 ?auto_15782 ) ( ON ?auto_15778 ?auto_15781 ) ( CLEAR ?auto_15778 ) ( not ( = ?auto_15777 ?auto_15781 ) ) ( not ( = ?auto_15778 ?auto_15781 ) ) ( not ( = ?auto_15776 ?auto_15781 ) ) ( TRUCK-AT ?auto_15784 ?auto_15779 ) ( SURFACE-AT ?auto_15776 ?auto_15779 ) ( CLEAR ?auto_15776 ) ( LIFTING ?auto_15783 ?auto_15777 ) ( IS-CRATE ?auto_15777 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15777 ?auto_15778 )
      ( MAKE-2CRATE-VERIFY ?auto_15776 ?auto_15777 ?auto_15778 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15785 - SURFACE
      ?auto_15786 - SURFACE
    )
    :vars
    (
      ?auto_15792 - HOIST
      ?auto_15789 - PLACE
      ?auto_15788 - SURFACE
      ?auto_15787 - PLACE
      ?auto_15790 - HOIST
      ?auto_15791 - SURFACE
      ?auto_15793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15792 ?auto_15789 ) ( IS-CRATE ?auto_15786 ) ( not ( = ?auto_15785 ?auto_15786 ) ) ( not ( = ?auto_15788 ?auto_15785 ) ) ( not ( = ?auto_15788 ?auto_15786 ) ) ( not ( = ?auto_15787 ?auto_15789 ) ) ( HOIST-AT ?auto_15790 ?auto_15787 ) ( not ( = ?auto_15792 ?auto_15790 ) ) ( AVAILABLE ?auto_15790 ) ( SURFACE-AT ?auto_15786 ?auto_15787 ) ( ON ?auto_15786 ?auto_15791 ) ( CLEAR ?auto_15786 ) ( not ( = ?auto_15785 ?auto_15791 ) ) ( not ( = ?auto_15786 ?auto_15791 ) ) ( not ( = ?auto_15788 ?auto_15791 ) ) ( TRUCK-AT ?auto_15793 ?auto_15789 ) ( SURFACE-AT ?auto_15788 ?auto_15789 ) ( CLEAR ?auto_15788 ) ( IS-CRATE ?auto_15785 ) ( AVAILABLE ?auto_15792 ) ( IN ?auto_15785 ?auto_15793 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15792 ?auto_15785 ?auto_15793 ?auto_15789 )
      ( MAKE-2CRATE ?auto_15788 ?auto_15785 ?auto_15786 )
      ( MAKE-1CRATE-VERIFY ?auto_15785 ?auto_15786 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15794 - SURFACE
      ?auto_15795 - SURFACE
      ?auto_15796 - SURFACE
    )
    :vars
    (
      ?auto_15797 - HOIST
      ?auto_15800 - PLACE
      ?auto_15799 - PLACE
      ?auto_15801 - HOIST
      ?auto_15802 - SURFACE
      ?auto_15798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15797 ?auto_15800 ) ( IS-CRATE ?auto_15796 ) ( not ( = ?auto_15795 ?auto_15796 ) ) ( not ( = ?auto_15794 ?auto_15795 ) ) ( not ( = ?auto_15794 ?auto_15796 ) ) ( not ( = ?auto_15799 ?auto_15800 ) ) ( HOIST-AT ?auto_15801 ?auto_15799 ) ( not ( = ?auto_15797 ?auto_15801 ) ) ( AVAILABLE ?auto_15801 ) ( SURFACE-AT ?auto_15796 ?auto_15799 ) ( ON ?auto_15796 ?auto_15802 ) ( CLEAR ?auto_15796 ) ( not ( = ?auto_15795 ?auto_15802 ) ) ( not ( = ?auto_15796 ?auto_15802 ) ) ( not ( = ?auto_15794 ?auto_15802 ) ) ( TRUCK-AT ?auto_15798 ?auto_15800 ) ( SURFACE-AT ?auto_15794 ?auto_15800 ) ( CLEAR ?auto_15794 ) ( IS-CRATE ?auto_15795 ) ( AVAILABLE ?auto_15797 ) ( IN ?auto_15795 ?auto_15798 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15795 ?auto_15796 )
      ( MAKE-2CRATE-VERIFY ?auto_15794 ?auto_15795 ?auto_15796 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15803 - SURFACE
      ?auto_15804 - SURFACE
    )
    :vars
    (
      ?auto_15811 - HOIST
      ?auto_15810 - PLACE
      ?auto_15805 - SURFACE
      ?auto_15806 - PLACE
      ?auto_15809 - HOIST
      ?auto_15807 - SURFACE
      ?auto_15808 - TRUCK
      ?auto_15812 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15811 ?auto_15810 ) ( IS-CRATE ?auto_15804 ) ( not ( = ?auto_15803 ?auto_15804 ) ) ( not ( = ?auto_15805 ?auto_15803 ) ) ( not ( = ?auto_15805 ?auto_15804 ) ) ( not ( = ?auto_15806 ?auto_15810 ) ) ( HOIST-AT ?auto_15809 ?auto_15806 ) ( not ( = ?auto_15811 ?auto_15809 ) ) ( AVAILABLE ?auto_15809 ) ( SURFACE-AT ?auto_15804 ?auto_15806 ) ( ON ?auto_15804 ?auto_15807 ) ( CLEAR ?auto_15804 ) ( not ( = ?auto_15803 ?auto_15807 ) ) ( not ( = ?auto_15804 ?auto_15807 ) ) ( not ( = ?auto_15805 ?auto_15807 ) ) ( SURFACE-AT ?auto_15805 ?auto_15810 ) ( CLEAR ?auto_15805 ) ( IS-CRATE ?auto_15803 ) ( AVAILABLE ?auto_15811 ) ( IN ?auto_15803 ?auto_15808 ) ( TRUCK-AT ?auto_15808 ?auto_15812 ) ( not ( = ?auto_15812 ?auto_15810 ) ) ( not ( = ?auto_15806 ?auto_15812 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15808 ?auto_15812 ?auto_15810 )
      ( MAKE-2CRATE ?auto_15805 ?auto_15803 ?auto_15804 )
      ( MAKE-1CRATE-VERIFY ?auto_15803 ?auto_15804 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15813 - SURFACE
      ?auto_15814 - SURFACE
      ?auto_15815 - SURFACE
    )
    :vars
    (
      ?auto_15816 - HOIST
      ?auto_15817 - PLACE
      ?auto_15819 - PLACE
      ?auto_15821 - HOIST
      ?auto_15820 - SURFACE
      ?auto_15822 - TRUCK
      ?auto_15818 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15816 ?auto_15817 ) ( IS-CRATE ?auto_15815 ) ( not ( = ?auto_15814 ?auto_15815 ) ) ( not ( = ?auto_15813 ?auto_15814 ) ) ( not ( = ?auto_15813 ?auto_15815 ) ) ( not ( = ?auto_15819 ?auto_15817 ) ) ( HOIST-AT ?auto_15821 ?auto_15819 ) ( not ( = ?auto_15816 ?auto_15821 ) ) ( AVAILABLE ?auto_15821 ) ( SURFACE-AT ?auto_15815 ?auto_15819 ) ( ON ?auto_15815 ?auto_15820 ) ( CLEAR ?auto_15815 ) ( not ( = ?auto_15814 ?auto_15820 ) ) ( not ( = ?auto_15815 ?auto_15820 ) ) ( not ( = ?auto_15813 ?auto_15820 ) ) ( SURFACE-AT ?auto_15813 ?auto_15817 ) ( CLEAR ?auto_15813 ) ( IS-CRATE ?auto_15814 ) ( AVAILABLE ?auto_15816 ) ( IN ?auto_15814 ?auto_15822 ) ( TRUCK-AT ?auto_15822 ?auto_15818 ) ( not ( = ?auto_15818 ?auto_15817 ) ) ( not ( = ?auto_15819 ?auto_15818 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15814 ?auto_15815 )
      ( MAKE-2CRATE-VERIFY ?auto_15813 ?auto_15814 ?auto_15815 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15823 - SURFACE
      ?auto_15824 - SURFACE
    )
    :vars
    (
      ?auto_15830 - HOIST
      ?auto_15829 - PLACE
      ?auto_15825 - SURFACE
      ?auto_15828 - PLACE
      ?auto_15831 - HOIST
      ?auto_15827 - SURFACE
      ?auto_15832 - TRUCK
      ?auto_15826 - PLACE
      ?auto_15833 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15830 ?auto_15829 ) ( IS-CRATE ?auto_15824 ) ( not ( = ?auto_15823 ?auto_15824 ) ) ( not ( = ?auto_15825 ?auto_15823 ) ) ( not ( = ?auto_15825 ?auto_15824 ) ) ( not ( = ?auto_15828 ?auto_15829 ) ) ( HOIST-AT ?auto_15831 ?auto_15828 ) ( not ( = ?auto_15830 ?auto_15831 ) ) ( AVAILABLE ?auto_15831 ) ( SURFACE-AT ?auto_15824 ?auto_15828 ) ( ON ?auto_15824 ?auto_15827 ) ( CLEAR ?auto_15824 ) ( not ( = ?auto_15823 ?auto_15827 ) ) ( not ( = ?auto_15824 ?auto_15827 ) ) ( not ( = ?auto_15825 ?auto_15827 ) ) ( SURFACE-AT ?auto_15825 ?auto_15829 ) ( CLEAR ?auto_15825 ) ( IS-CRATE ?auto_15823 ) ( AVAILABLE ?auto_15830 ) ( TRUCK-AT ?auto_15832 ?auto_15826 ) ( not ( = ?auto_15826 ?auto_15829 ) ) ( not ( = ?auto_15828 ?auto_15826 ) ) ( HOIST-AT ?auto_15833 ?auto_15826 ) ( LIFTING ?auto_15833 ?auto_15823 ) ( not ( = ?auto_15830 ?auto_15833 ) ) ( not ( = ?auto_15831 ?auto_15833 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15833 ?auto_15823 ?auto_15832 ?auto_15826 )
      ( MAKE-2CRATE ?auto_15825 ?auto_15823 ?auto_15824 )
      ( MAKE-1CRATE-VERIFY ?auto_15823 ?auto_15824 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15834 - SURFACE
      ?auto_15835 - SURFACE
      ?auto_15836 - SURFACE
    )
    :vars
    (
      ?auto_15844 - HOIST
      ?auto_15843 - PLACE
      ?auto_15842 - PLACE
      ?auto_15841 - HOIST
      ?auto_15837 - SURFACE
      ?auto_15839 - TRUCK
      ?auto_15840 - PLACE
      ?auto_15838 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15844 ?auto_15843 ) ( IS-CRATE ?auto_15836 ) ( not ( = ?auto_15835 ?auto_15836 ) ) ( not ( = ?auto_15834 ?auto_15835 ) ) ( not ( = ?auto_15834 ?auto_15836 ) ) ( not ( = ?auto_15842 ?auto_15843 ) ) ( HOIST-AT ?auto_15841 ?auto_15842 ) ( not ( = ?auto_15844 ?auto_15841 ) ) ( AVAILABLE ?auto_15841 ) ( SURFACE-AT ?auto_15836 ?auto_15842 ) ( ON ?auto_15836 ?auto_15837 ) ( CLEAR ?auto_15836 ) ( not ( = ?auto_15835 ?auto_15837 ) ) ( not ( = ?auto_15836 ?auto_15837 ) ) ( not ( = ?auto_15834 ?auto_15837 ) ) ( SURFACE-AT ?auto_15834 ?auto_15843 ) ( CLEAR ?auto_15834 ) ( IS-CRATE ?auto_15835 ) ( AVAILABLE ?auto_15844 ) ( TRUCK-AT ?auto_15839 ?auto_15840 ) ( not ( = ?auto_15840 ?auto_15843 ) ) ( not ( = ?auto_15842 ?auto_15840 ) ) ( HOIST-AT ?auto_15838 ?auto_15840 ) ( LIFTING ?auto_15838 ?auto_15835 ) ( not ( = ?auto_15844 ?auto_15838 ) ) ( not ( = ?auto_15841 ?auto_15838 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15835 ?auto_15836 )
      ( MAKE-2CRATE-VERIFY ?auto_15834 ?auto_15835 ?auto_15836 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15845 - SURFACE
      ?auto_15846 - SURFACE
    )
    :vars
    (
      ?auto_15849 - HOIST
      ?auto_15847 - PLACE
      ?auto_15853 - SURFACE
      ?auto_15852 - PLACE
      ?auto_15855 - HOIST
      ?auto_15851 - SURFACE
      ?auto_15850 - TRUCK
      ?auto_15854 - PLACE
      ?auto_15848 - HOIST
      ?auto_15856 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15849 ?auto_15847 ) ( IS-CRATE ?auto_15846 ) ( not ( = ?auto_15845 ?auto_15846 ) ) ( not ( = ?auto_15853 ?auto_15845 ) ) ( not ( = ?auto_15853 ?auto_15846 ) ) ( not ( = ?auto_15852 ?auto_15847 ) ) ( HOIST-AT ?auto_15855 ?auto_15852 ) ( not ( = ?auto_15849 ?auto_15855 ) ) ( AVAILABLE ?auto_15855 ) ( SURFACE-AT ?auto_15846 ?auto_15852 ) ( ON ?auto_15846 ?auto_15851 ) ( CLEAR ?auto_15846 ) ( not ( = ?auto_15845 ?auto_15851 ) ) ( not ( = ?auto_15846 ?auto_15851 ) ) ( not ( = ?auto_15853 ?auto_15851 ) ) ( SURFACE-AT ?auto_15853 ?auto_15847 ) ( CLEAR ?auto_15853 ) ( IS-CRATE ?auto_15845 ) ( AVAILABLE ?auto_15849 ) ( TRUCK-AT ?auto_15850 ?auto_15854 ) ( not ( = ?auto_15854 ?auto_15847 ) ) ( not ( = ?auto_15852 ?auto_15854 ) ) ( HOIST-AT ?auto_15848 ?auto_15854 ) ( not ( = ?auto_15849 ?auto_15848 ) ) ( not ( = ?auto_15855 ?auto_15848 ) ) ( AVAILABLE ?auto_15848 ) ( SURFACE-AT ?auto_15845 ?auto_15854 ) ( ON ?auto_15845 ?auto_15856 ) ( CLEAR ?auto_15845 ) ( not ( = ?auto_15845 ?auto_15856 ) ) ( not ( = ?auto_15846 ?auto_15856 ) ) ( not ( = ?auto_15853 ?auto_15856 ) ) ( not ( = ?auto_15851 ?auto_15856 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15848 ?auto_15845 ?auto_15856 ?auto_15854 )
      ( MAKE-2CRATE ?auto_15853 ?auto_15845 ?auto_15846 )
      ( MAKE-1CRATE-VERIFY ?auto_15845 ?auto_15846 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15857 - SURFACE
      ?auto_15858 - SURFACE
      ?auto_15859 - SURFACE
    )
    :vars
    (
      ?auto_15867 - HOIST
      ?auto_15864 - PLACE
      ?auto_15862 - PLACE
      ?auto_15868 - HOIST
      ?auto_15865 - SURFACE
      ?auto_15861 - TRUCK
      ?auto_15866 - PLACE
      ?auto_15863 - HOIST
      ?auto_15860 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15867 ?auto_15864 ) ( IS-CRATE ?auto_15859 ) ( not ( = ?auto_15858 ?auto_15859 ) ) ( not ( = ?auto_15857 ?auto_15858 ) ) ( not ( = ?auto_15857 ?auto_15859 ) ) ( not ( = ?auto_15862 ?auto_15864 ) ) ( HOIST-AT ?auto_15868 ?auto_15862 ) ( not ( = ?auto_15867 ?auto_15868 ) ) ( AVAILABLE ?auto_15868 ) ( SURFACE-AT ?auto_15859 ?auto_15862 ) ( ON ?auto_15859 ?auto_15865 ) ( CLEAR ?auto_15859 ) ( not ( = ?auto_15858 ?auto_15865 ) ) ( not ( = ?auto_15859 ?auto_15865 ) ) ( not ( = ?auto_15857 ?auto_15865 ) ) ( SURFACE-AT ?auto_15857 ?auto_15864 ) ( CLEAR ?auto_15857 ) ( IS-CRATE ?auto_15858 ) ( AVAILABLE ?auto_15867 ) ( TRUCK-AT ?auto_15861 ?auto_15866 ) ( not ( = ?auto_15866 ?auto_15864 ) ) ( not ( = ?auto_15862 ?auto_15866 ) ) ( HOIST-AT ?auto_15863 ?auto_15866 ) ( not ( = ?auto_15867 ?auto_15863 ) ) ( not ( = ?auto_15868 ?auto_15863 ) ) ( AVAILABLE ?auto_15863 ) ( SURFACE-AT ?auto_15858 ?auto_15866 ) ( ON ?auto_15858 ?auto_15860 ) ( CLEAR ?auto_15858 ) ( not ( = ?auto_15858 ?auto_15860 ) ) ( not ( = ?auto_15859 ?auto_15860 ) ) ( not ( = ?auto_15857 ?auto_15860 ) ) ( not ( = ?auto_15865 ?auto_15860 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15858 ?auto_15859 )
      ( MAKE-2CRATE-VERIFY ?auto_15857 ?auto_15858 ?auto_15859 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15869 - SURFACE
      ?auto_15870 - SURFACE
    )
    :vars
    (
      ?auto_15877 - HOIST
      ?auto_15878 - PLACE
      ?auto_15872 - SURFACE
      ?auto_15874 - PLACE
      ?auto_15879 - HOIST
      ?auto_15876 - SURFACE
      ?auto_15871 - PLACE
      ?auto_15880 - HOIST
      ?auto_15875 - SURFACE
      ?auto_15873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15877 ?auto_15878 ) ( IS-CRATE ?auto_15870 ) ( not ( = ?auto_15869 ?auto_15870 ) ) ( not ( = ?auto_15872 ?auto_15869 ) ) ( not ( = ?auto_15872 ?auto_15870 ) ) ( not ( = ?auto_15874 ?auto_15878 ) ) ( HOIST-AT ?auto_15879 ?auto_15874 ) ( not ( = ?auto_15877 ?auto_15879 ) ) ( AVAILABLE ?auto_15879 ) ( SURFACE-AT ?auto_15870 ?auto_15874 ) ( ON ?auto_15870 ?auto_15876 ) ( CLEAR ?auto_15870 ) ( not ( = ?auto_15869 ?auto_15876 ) ) ( not ( = ?auto_15870 ?auto_15876 ) ) ( not ( = ?auto_15872 ?auto_15876 ) ) ( SURFACE-AT ?auto_15872 ?auto_15878 ) ( CLEAR ?auto_15872 ) ( IS-CRATE ?auto_15869 ) ( AVAILABLE ?auto_15877 ) ( not ( = ?auto_15871 ?auto_15878 ) ) ( not ( = ?auto_15874 ?auto_15871 ) ) ( HOIST-AT ?auto_15880 ?auto_15871 ) ( not ( = ?auto_15877 ?auto_15880 ) ) ( not ( = ?auto_15879 ?auto_15880 ) ) ( AVAILABLE ?auto_15880 ) ( SURFACE-AT ?auto_15869 ?auto_15871 ) ( ON ?auto_15869 ?auto_15875 ) ( CLEAR ?auto_15869 ) ( not ( = ?auto_15869 ?auto_15875 ) ) ( not ( = ?auto_15870 ?auto_15875 ) ) ( not ( = ?auto_15872 ?auto_15875 ) ) ( not ( = ?auto_15876 ?auto_15875 ) ) ( TRUCK-AT ?auto_15873 ?auto_15878 ) )
    :subtasks
    ( ( !DRIVE ?auto_15873 ?auto_15878 ?auto_15871 )
      ( MAKE-2CRATE ?auto_15872 ?auto_15869 ?auto_15870 )
      ( MAKE-1CRATE-VERIFY ?auto_15869 ?auto_15870 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15881 - SURFACE
      ?auto_15882 - SURFACE
      ?auto_15883 - SURFACE
    )
    :vars
    (
      ?auto_15891 - HOIST
      ?auto_15888 - PLACE
      ?auto_15886 - PLACE
      ?auto_15887 - HOIST
      ?auto_15884 - SURFACE
      ?auto_15890 - PLACE
      ?auto_15892 - HOIST
      ?auto_15889 - SURFACE
      ?auto_15885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15891 ?auto_15888 ) ( IS-CRATE ?auto_15883 ) ( not ( = ?auto_15882 ?auto_15883 ) ) ( not ( = ?auto_15881 ?auto_15882 ) ) ( not ( = ?auto_15881 ?auto_15883 ) ) ( not ( = ?auto_15886 ?auto_15888 ) ) ( HOIST-AT ?auto_15887 ?auto_15886 ) ( not ( = ?auto_15891 ?auto_15887 ) ) ( AVAILABLE ?auto_15887 ) ( SURFACE-AT ?auto_15883 ?auto_15886 ) ( ON ?auto_15883 ?auto_15884 ) ( CLEAR ?auto_15883 ) ( not ( = ?auto_15882 ?auto_15884 ) ) ( not ( = ?auto_15883 ?auto_15884 ) ) ( not ( = ?auto_15881 ?auto_15884 ) ) ( SURFACE-AT ?auto_15881 ?auto_15888 ) ( CLEAR ?auto_15881 ) ( IS-CRATE ?auto_15882 ) ( AVAILABLE ?auto_15891 ) ( not ( = ?auto_15890 ?auto_15888 ) ) ( not ( = ?auto_15886 ?auto_15890 ) ) ( HOIST-AT ?auto_15892 ?auto_15890 ) ( not ( = ?auto_15891 ?auto_15892 ) ) ( not ( = ?auto_15887 ?auto_15892 ) ) ( AVAILABLE ?auto_15892 ) ( SURFACE-AT ?auto_15882 ?auto_15890 ) ( ON ?auto_15882 ?auto_15889 ) ( CLEAR ?auto_15882 ) ( not ( = ?auto_15882 ?auto_15889 ) ) ( not ( = ?auto_15883 ?auto_15889 ) ) ( not ( = ?auto_15881 ?auto_15889 ) ) ( not ( = ?auto_15884 ?auto_15889 ) ) ( TRUCK-AT ?auto_15885 ?auto_15888 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15882 ?auto_15883 )
      ( MAKE-2CRATE-VERIFY ?auto_15881 ?auto_15882 ?auto_15883 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15902 - SURFACE
      ?auto_15903 - SURFACE
    )
    :vars
    (
      ?auto_15904 - HOIST
      ?auto_15905 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15904 ?auto_15905 ) ( SURFACE-AT ?auto_15902 ?auto_15905 ) ( CLEAR ?auto_15902 ) ( LIFTING ?auto_15904 ?auto_15903 ) ( IS-CRATE ?auto_15903 ) ( not ( = ?auto_15902 ?auto_15903 ) ) )
    :subtasks
    ( ( !DROP ?auto_15904 ?auto_15903 ?auto_15902 ?auto_15905 )
      ( MAKE-1CRATE-VERIFY ?auto_15902 ?auto_15903 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15906 - SURFACE
      ?auto_15907 - SURFACE
      ?auto_15908 - SURFACE
    )
    :vars
    (
      ?auto_15909 - HOIST
      ?auto_15910 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15909 ?auto_15910 ) ( SURFACE-AT ?auto_15907 ?auto_15910 ) ( CLEAR ?auto_15907 ) ( LIFTING ?auto_15909 ?auto_15908 ) ( IS-CRATE ?auto_15908 ) ( not ( = ?auto_15907 ?auto_15908 ) ) ( ON ?auto_15907 ?auto_15906 ) ( not ( = ?auto_15906 ?auto_15907 ) ) ( not ( = ?auto_15906 ?auto_15908 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15907 ?auto_15908 )
      ( MAKE-2CRATE-VERIFY ?auto_15906 ?auto_15907 ?auto_15908 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15911 - SURFACE
      ?auto_15912 - SURFACE
      ?auto_15913 - SURFACE
      ?auto_15914 - SURFACE
    )
    :vars
    (
      ?auto_15915 - HOIST
      ?auto_15916 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15915 ?auto_15916 ) ( SURFACE-AT ?auto_15913 ?auto_15916 ) ( CLEAR ?auto_15913 ) ( LIFTING ?auto_15915 ?auto_15914 ) ( IS-CRATE ?auto_15914 ) ( not ( = ?auto_15913 ?auto_15914 ) ) ( ON ?auto_15912 ?auto_15911 ) ( ON ?auto_15913 ?auto_15912 ) ( not ( = ?auto_15911 ?auto_15912 ) ) ( not ( = ?auto_15911 ?auto_15913 ) ) ( not ( = ?auto_15911 ?auto_15914 ) ) ( not ( = ?auto_15912 ?auto_15913 ) ) ( not ( = ?auto_15912 ?auto_15914 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15913 ?auto_15914 )
      ( MAKE-3CRATE-VERIFY ?auto_15911 ?auto_15912 ?auto_15913 ?auto_15914 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15917 - SURFACE
      ?auto_15918 - SURFACE
    )
    :vars
    (
      ?auto_15919 - HOIST
      ?auto_15920 - PLACE
      ?auto_15921 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15919 ?auto_15920 ) ( SURFACE-AT ?auto_15917 ?auto_15920 ) ( CLEAR ?auto_15917 ) ( IS-CRATE ?auto_15918 ) ( not ( = ?auto_15917 ?auto_15918 ) ) ( TRUCK-AT ?auto_15921 ?auto_15920 ) ( AVAILABLE ?auto_15919 ) ( IN ?auto_15918 ?auto_15921 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15919 ?auto_15918 ?auto_15921 ?auto_15920 )
      ( MAKE-1CRATE ?auto_15917 ?auto_15918 )
      ( MAKE-1CRATE-VERIFY ?auto_15917 ?auto_15918 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15922 - SURFACE
      ?auto_15923 - SURFACE
      ?auto_15924 - SURFACE
    )
    :vars
    (
      ?auto_15927 - HOIST
      ?auto_15925 - PLACE
      ?auto_15926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15927 ?auto_15925 ) ( SURFACE-AT ?auto_15923 ?auto_15925 ) ( CLEAR ?auto_15923 ) ( IS-CRATE ?auto_15924 ) ( not ( = ?auto_15923 ?auto_15924 ) ) ( TRUCK-AT ?auto_15926 ?auto_15925 ) ( AVAILABLE ?auto_15927 ) ( IN ?auto_15924 ?auto_15926 ) ( ON ?auto_15923 ?auto_15922 ) ( not ( = ?auto_15922 ?auto_15923 ) ) ( not ( = ?auto_15922 ?auto_15924 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15923 ?auto_15924 )
      ( MAKE-2CRATE-VERIFY ?auto_15922 ?auto_15923 ?auto_15924 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15928 - SURFACE
      ?auto_15929 - SURFACE
      ?auto_15930 - SURFACE
      ?auto_15931 - SURFACE
    )
    :vars
    (
      ?auto_15934 - HOIST
      ?auto_15933 - PLACE
      ?auto_15932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15934 ?auto_15933 ) ( SURFACE-AT ?auto_15930 ?auto_15933 ) ( CLEAR ?auto_15930 ) ( IS-CRATE ?auto_15931 ) ( not ( = ?auto_15930 ?auto_15931 ) ) ( TRUCK-AT ?auto_15932 ?auto_15933 ) ( AVAILABLE ?auto_15934 ) ( IN ?auto_15931 ?auto_15932 ) ( ON ?auto_15930 ?auto_15929 ) ( not ( = ?auto_15929 ?auto_15930 ) ) ( not ( = ?auto_15929 ?auto_15931 ) ) ( ON ?auto_15929 ?auto_15928 ) ( not ( = ?auto_15928 ?auto_15929 ) ) ( not ( = ?auto_15928 ?auto_15930 ) ) ( not ( = ?auto_15928 ?auto_15931 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15929 ?auto_15930 ?auto_15931 )
      ( MAKE-3CRATE-VERIFY ?auto_15928 ?auto_15929 ?auto_15930 ?auto_15931 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15935 - SURFACE
      ?auto_15936 - SURFACE
    )
    :vars
    (
      ?auto_15940 - HOIST
      ?auto_15939 - PLACE
      ?auto_15938 - TRUCK
      ?auto_15937 - SURFACE
      ?auto_15941 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15940 ?auto_15939 ) ( SURFACE-AT ?auto_15935 ?auto_15939 ) ( CLEAR ?auto_15935 ) ( IS-CRATE ?auto_15936 ) ( not ( = ?auto_15935 ?auto_15936 ) ) ( AVAILABLE ?auto_15940 ) ( IN ?auto_15936 ?auto_15938 ) ( ON ?auto_15935 ?auto_15937 ) ( not ( = ?auto_15937 ?auto_15935 ) ) ( not ( = ?auto_15937 ?auto_15936 ) ) ( TRUCK-AT ?auto_15938 ?auto_15941 ) ( not ( = ?auto_15941 ?auto_15939 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15938 ?auto_15941 ?auto_15939 )
      ( MAKE-2CRATE ?auto_15937 ?auto_15935 ?auto_15936 )
      ( MAKE-1CRATE-VERIFY ?auto_15935 ?auto_15936 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15942 - SURFACE
      ?auto_15943 - SURFACE
      ?auto_15944 - SURFACE
    )
    :vars
    (
      ?auto_15946 - HOIST
      ?auto_15945 - PLACE
      ?auto_15948 - TRUCK
      ?auto_15947 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15946 ?auto_15945 ) ( SURFACE-AT ?auto_15943 ?auto_15945 ) ( CLEAR ?auto_15943 ) ( IS-CRATE ?auto_15944 ) ( not ( = ?auto_15943 ?auto_15944 ) ) ( AVAILABLE ?auto_15946 ) ( IN ?auto_15944 ?auto_15948 ) ( ON ?auto_15943 ?auto_15942 ) ( not ( = ?auto_15942 ?auto_15943 ) ) ( not ( = ?auto_15942 ?auto_15944 ) ) ( TRUCK-AT ?auto_15948 ?auto_15947 ) ( not ( = ?auto_15947 ?auto_15945 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15943 ?auto_15944 )
      ( MAKE-2CRATE-VERIFY ?auto_15942 ?auto_15943 ?auto_15944 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15949 - SURFACE
      ?auto_15950 - SURFACE
      ?auto_15951 - SURFACE
      ?auto_15952 - SURFACE
    )
    :vars
    (
      ?auto_15954 - HOIST
      ?auto_15953 - PLACE
      ?auto_15956 - TRUCK
      ?auto_15955 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15954 ?auto_15953 ) ( SURFACE-AT ?auto_15951 ?auto_15953 ) ( CLEAR ?auto_15951 ) ( IS-CRATE ?auto_15952 ) ( not ( = ?auto_15951 ?auto_15952 ) ) ( AVAILABLE ?auto_15954 ) ( IN ?auto_15952 ?auto_15956 ) ( ON ?auto_15951 ?auto_15950 ) ( not ( = ?auto_15950 ?auto_15951 ) ) ( not ( = ?auto_15950 ?auto_15952 ) ) ( TRUCK-AT ?auto_15956 ?auto_15955 ) ( not ( = ?auto_15955 ?auto_15953 ) ) ( ON ?auto_15950 ?auto_15949 ) ( not ( = ?auto_15949 ?auto_15950 ) ) ( not ( = ?auto_15949 ?auto_15951 ) ) ( not ( = ?auto_15949 ?auto_15952 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15950 ?auto_15951 ?auto_15952 )
      ( MAKE-3CRATE-VERIFY ?auto_15949 ?auto_15950 ?auto_15951 ?auto_15952 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15957 - SURFACE
      ?auto_15958 - SURFACE
    )
    :vars
    (
      ?auto_15960 - HOIST
      ?auto_15959 - PLACE
      ?auto_15961 - SURFACE
      ?auto_15963 - TRUCK
      ?auto_15962 - PLACE
      ?auto_15964 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15960 ?auto_15959 ) ( SURFACE-AT ?auto_15957 ?auto_15959 ) ( CLEAR ?auto_15957 ) ( IS-CRATE ?auto_15958 ) ( not ( = ?auto_15957 ?auto_15958 ) ) ( AVAILABLE ?auto_15960 ) ( ON ?auto_15957 ?auto_15961 ) ( not ( = ?auto_15961 ?auto_15957 ) ) ( not ( = ?auto_15961 ?auto_15958 ) ) ( TRUCK-AT ?auto_15963 ?auto_15962 ) ( not ( = ?auto_15962 ?auto_15959 ) ) ( HOIST-AT ?auto_15964 ?auto_15962 ) ( LIFTING ?auto_15964 ?auto_15958 ) ( not ( = ?auto_15960 ?auto_15964 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15964 ?auto_15958 ?auto_15963 ?auto_15962 )
      ( MAKE-2CRATE ?auto_15961 ?auto_15957 ?auto_15958 )
      ( MAKE-1CRATE-VERIFY ?auto_15957 ?auto_15958 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15965 - SURFACE
      ?auto_15966 - SURFACE
      ?auto_15967 - SURFACE
    )
    :vars
    (
      ?auto_15971 - HOIST
      ?auto_15972 - PLACE
      ?auto_15970 - TRUCK
      ?auto_15969 - PLACE
      ?auto_15968 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15971 ?auto_15972 ) ( SURFACE-AT ?auto_15966 ?auto_15972 ) ( CLEAR ?auto_15966 ) ( IS-CRATE ?auto_15967 ) ( not ( = ?auto_15966 ?auto_15967 ) ) ( AVAILABLE ?auto_15971 ) ( ON ?auto_15966 ?auto_15965 ) ( not ( = ?auto_15965 ?auto_15966 ) ) ( not ( = ?auto_15965 ?auto_15967 ) ) ( TRUCK-AT ?auto_15970 ?auto_15969 ) ( not ( = ?auto_15969 ?auto_15972 ) ) ( HOIST-AT ?auto_15968 ?auto_15969 ) ( LIFTING ?auto_15968 ?auto_15967 ) ( not ( = ?auto_15971 ?auto_15968 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15966 ?auto_15967 )
      ( MAKE-2CRATE-VERIFY ?auto_15965 ?auto_15966 ?auto_15967 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15973 - SURFACE
      ?auto_15974 - SURFACE
      ?auto_15975 - SURFACE
      ?auto_15976 - SURFACE
    )
    :vars
    (
      ?auto_15978 - HOIST
      ?auto_15981 - PLACE
      ?auto_15979 - TRUCK
      ?auto_15977 - PLACE
      ?auto_15980 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15978 ?auto_15981 ) ( SURFACE-AT ?auto_15975 ?auto_15981 ) ( CLEAR ?auto_15975 ) ( IS-CRATE ?auto_15976 ) ( not ( = ?auto_15975 ?auto_15976 ) ) ( AVAILABLE ?auto_15978 ) ( ON ?auto_15975 ?auto_15974 ) ( not ( = ?auto_15974 ?auto_15975 ) ) ( not ( = ?auto_15974 ?auto_15976 ) ) ( TRUCK-AT ?auto_15979 ?auto_15977 ) ( not ( = ?auto_15977 ?auto_15981 ) ) ( HOIST-AT ?auto_15980 ?auto_15977 ) ( LIFTING ?auto_15980 ?auto_15976 ) ( not ( = ?auto_15978 ?auto_15980 ) ) ( ON ?auto_15974 ?auto_15973 ) ( not ( = ?auto_15973 ?auto_15974 ) ) ( not ( = ?auto_15973 ?auto_15975 ) ) ( not ( = ?auto_15973 ?auto_15976 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15974 ?auto_15975 ?auto_15976 )
      ( MAKE-3CRATE-VERIFY ?auto_15973 ?auto_15974 ?auto_15975 ?auto_15976 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15982 - SURFACE
      ?auto_15983 - SURFACE
    )
    :vars
    (
      ?auto_15986 - HOIST
      ?auto_15989 - PLACE
      ?auto_15985 - SURFACE
      ?auto_15987 - TRUCK
      ?auto_15984 - PLACE
      ?auto_15988 - HOIST
      ?auto_15990 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15986 ?auto_15989 ) ( SURFACE-AT ?auto_15982 ?auto_15989 ) ( CLEAR ?auto_15982 ) ( IS-CRATE ?auto_15983 ) ( not ( = ?auto_15982 ?auto_15983 ) ) ( AVAILABLE ?auto_15986 ) ( ON ?auto_15982 ?auto_15985 ) ( not ( = ?auto_15985 ?auto_15982 ) ) ( not ( = ?auto_15985 ?auto_15983 ) ) ( TRUCK-AT ?auto_15987 ?auto_15984 ) ( not ( = ?auto_15984 ?auto_15989 ) ) ( HOIST-AT ?auto_15988 ?auto_15984 ) ( not ( = ?auto_15986 ?auto_15988 ) ) ( AVAILABLE ?auto_15988 ) ( SURFACE-AT ?auto_15983 ?auto_15984 ) ( ON ?auto_15983 ?auto_15990 ) ( CLEAR ?auto_15983 ) ( not ( = ?auto_15982 ?auto_15990 ) ) ( not ( = ?auto_15983 ?auto_15990 ) ) ( not ( = ?auto_15985 ?auto_15990 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15988 ?auto_15983 ?auto_15990 ?auto_15984 )
      ( MAKE-2CRATE ?auto_15985 ?auto_15982 ?auto_15983 )
      ( MAKE-1CRATE-VERIFY ?auto_15982 ?auto_15983 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15991 - SURFACE
      ?auto_15992 - SURFACE
      ?auto_15993 - SURFACE
    )
    :vars
    (
      ?auto_15994 - HOIST
      ?auto_15998 - PLACE
      ?auto_15996 - TRUCK
      ?auto_15999 - PLACE
      ?auto_15997 - HOIST
      ?auto_15995 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15994 ?auto_15998 ) ( SURFACE-AT ?auto_15992 ?auto_15998 ) ( CLEAR ?auto_15992 ) ( IS-CRATE ?auto_15993 ) ( not ( = ?auto_15992 ?auto_15993 ) ) ( AVAILABLE ?auto_15994 ) ( ON ?auto_15992 ?auto_15991 ) ( not ( = ?auto_15991 ?auto_15992 ) ) ( not ( = ?auto_15991 ?auto_15993 ) ) ( TRUCK-AT ?auto_15996 ?auto_15999 ) ( not ( = ?auto_15999 ?auto_15998 ) ) ( HOIST-AT ?auto_15997 ?auto_15999 ) ( not ( = ?auto_15994 ?auto_15997 ) ) ( AVAILABLE ?auto_15997 ) ( SURFACE-AT ?auto_15993 ?auto_15999 ) ( ON ?auto_15993 ?auto_15995 ) ( CLEAR ?auto_15993 ) ( not ( = ?auto_15992 ?auto_15995 ) ) ( not ( = ?auto_15993 ?auto_15995 ) ) ( not ( = ?auto_15991 ?auto_15995 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15992 ?auto_15993 )
      ( MAKE-2CRATE-VERIFY ?auto_15991 ?auto_15992 ?auto_15993 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16000 - SURFACE
      ?auto_16001 - SURFACE
      ?auto_16002 - SURFACE
      ?auto_16003 - SURFACE
    )
    :vars
    (
      ?auto_16008 - HOIST
      ?auto_16005 - PLACE
      ?auto_16006 - TRUCK
      ?auto_16007 - PLACE
      ?auto_16009 - HOIST
      ?auto_16004 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16008 ?auto_16005 ) ( SURFACE-AT ?auto_16002 ?auto_16005 ) ( CLEAR ?auto_16002 ) ( IS-CRATE ?auto_16003 ) ( not ( = ?auto_16002 ?auto_16003 ) ) ( AVAILABLE ?auto_16008 ) ( ON ?auto_16002 ?auto_16001 ) ( not ( = ?auto_16001 ?auto_16002 ) ) ( not ( = ?auto_16001 ?auto_16003 ) ) ( TRUCK-AT ?auto_16006 ?auto_16007 ) ( not ( = ?auto_16007 ?auto_16005 ) ) ( HOIST-AT ?auto_16009 ?auto_16007 ) ( not ( = ?auto_16008 ?auto_16009 ) ) ( AVAILABLE ?auto_16009 ) ( SURFACE-AT ?auto_16003 ?auto_16007 ) ( ON ?auto_16003 ?auto_16004 ) ( CLEAR ?auto_16003 ) ( not ( = ?auto_16002 ?auto_16004 ) ) ( not ( = ?auto_16003 ?auto_16004 ) ) ( not ( = ?auto_16001 ?auto_16004 ) ) ( ON ?auto_16001 ?auto_16000 ) ( not ( = ?auto_16000 ?auto_16001 ) ) ( not ( = ?auto_16000 ?auto_16002 ) ) ( not ( = ?auto_16000 ?auto_16003 ) ) ( not ( = ?auto_16000 ?auto_16004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16001 ?auto_16002 ?auto_16003 )
      ( MAKE-3CRATE-VERIFY ?auto_16000 ?auto_16001 ?auto_16002 ?auto_16003 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16010 - SURFACE
      ?auto_16011 - SURFACE
    )
    :vars
    (
      ?auto_16017 - HOIST
      ?auto_16014 - PLACE
      ?auto_16012 - SURFACE
      ?auto_16016 - PLACE
      ?auto_16018 - HOIST
      ?auto_16013 - SURFACE
      ?auto_16015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16017 ?auto_16014 ) ( SURFACE-AT ?auto_16010 ?auto_16014 ) ( CLEAR ?auto_16010 ) ( IS-CRATE ?auto_16011 ) ( not ( = ?auto_16010 ?auto_16011 ) ) ( AVAILABLE ?auto_16017 ) ( ON ?auto_16010 ?auto_16012 ) ( not ( = ?auto_16012 ?auto_16010 ) ) ( not ( = ?auto_16012 ?auto_16011 ) ) ( not ( = ?auto_16016 ?auto_16014 ) ) ( HOIST-AT ?auto_16018 ?auto_16016 ) ( not ( = ?auto_16017 ?auto_16018 ) ) ( AVAILABLE ?auto_16018 ) ( SURFACE-AT ?auto_16011 ?auto_16016 ) ( ON ?auto_16011 ?auto_16013 ) ( CLEAR ?auto_16011 ) ( not ( = ?auto_16010 ?auto_16013 ) ) ( not ( = ?auto_16011 ?auto_16013 ) ) ( not ( = ?auto_16012 ?auto_16013 ) ) ( TRUCK-AT ?auto_16015 ?auto_16014 ) )
    :subtasks
    ( ( !DRIVE ?auto_16015 ?auto_16014 ?auto_16016 )
      ( MAKE-2CRATE ?auto_16012 ?auto_16010 ?auto_16011 )
      ( MAKE-1CRATE-VERIFY ?auto_16010 ?auto_16011 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16019 - SURFACE
      ?auto_16020 - SURFACE
      ?auto_16021 - SURFACE
    )
    :vars
    (
      ?auto_16025 - HOIST
      ?auto_16026 - PLACE
      ?auto_16022 - PLACE
      ?auto_16024 - HOIST
      ?auto_16027 - SURFACE
      ?auto_16023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16025 ?auto_16026 ) ( SURFACE-AT ?auto_16020 ?auto_16026 ) ( CLEAR ?auto_16020 ) ( IS-CRATE ?auto_16021 ) ( not ( = ?auto_16020 ?auto_16021 ) ) ( AVAILABLE ?auto_16025 ) ( ON ?auto_16020 ?auto_16019 ) ( not ( = ?auto_16019 ?auto_16020 ) ) ( not ( = ?auto_16019 ?auto_16021 ) ) ( not ( = ?auto_16022 ?auto_16026 ) ) ( HOIST-AT ?auto_16024 ?auto_16022 ) ( not ( = ?auto_16025 ?auto_16024 ) ) ( AVAILABLE ?auto_16024 ) ( SURFACE-AT ?auto_16021 ?auto_16022 ) ( ON ?auto_16021 ?auto_16027 ) ( CLEAR ?auto_16021 ) ( not ( = ?auto_16020 ?auto_16027 ) ) ( not ( = ?auto_16021 ?auto_16027 ) ) ( not ( = ?auto_16019 ?auto_16027 ) ) ( TRUCK-AT ?auto_16023 ?auto_16026 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16020 ?auto_16021 )
      ( MAKE-2CRATE-VERIFY ?auto_16019 ?auto_16020 ?auto_16021 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16028 - SURFACE
      ?auto_16029 - SURFACE
      ?auto_16030 - SURFACE
      ?auto_16031 - SURFACE
    )
    :vars
    (
      ?auto_16033 - HOIST
      ?auto_16032 - PLACE
      ?auto_16034 - PLACE
      ?auto_16036 - HOIST
      ?auto_16037 - SURFACE
      ?auto_16035 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16033 ?auto_16032 ) ( SURFACE-AT ?auto_16030 ?auto_16032 ) ( CLEAR ?auto_16030 ) ( IS-CRATE ?auto_16031 ) ( not ( = ?auto_16030 ?auto_16031 ) ) ( AVAILABLE ?auto_16033 ) ( ON ?auto_16030 ?auto_16029 ) ( not ( = ?auto_16029 ?auto_16030 ) ) ( not ( = ?auto_16029 ?auto_16031 ) ) ( not ( = ?auto_16034 ?auto_16032 ) ) ( HOIST-AT ?auto_16036 ?auto_16034 ) ( not ( = ?auto_16033 ?auto_16036 ) ) ( AVAILABLE ?auto_16036 ) ( SURFACE-AT ?auto_16031 ?auto_16034 ) ( ON ?auto_16031 ?auto_16037 ) ( CLEAR ?auto_16031 ) ( not ( = ?auto_16030 ?auto_16037 ) ) ( not ( = ?auto_16031 ?auto_16037 ) ) ( not ( = ?auto_16029 ?auto_16037 ) ) ( TRUCK-AT ?auto_16035 ?auto_16032 ) ( ON ?auto_16029 ?auto_16028 ) ( not ( = ?auto_16028 ?auto_16029 ) ) ( not ( = ?auto_16028 ?auto_16030 ) ) ( not ( = ?auto_16028 ?auto_16031 ) ) ( not ( = ?auto_16028 ?auto_16037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16029 ?auto_16030 ?auto_16031 )
      ( MAKE-3CRATE-VERIFY ?auto_16028 ?auto_16029 ?auto_16030 ?auto_16031 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16038 - SURFACE
      ?auto_16039 - SURFACE
    )
    :vars
    (
      ?auto_16041 - HOIST
      ?auto_16040 - PLACE
      ?auto_16045 - SURFACE
      ?auto_16042 - PLACE
      ?auto_16044 - HOIST
      ?auto_16046 - SURFACE
      ?auto_16043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16041 ?auto_16040 ) ( IS-CRATE ?auto_16039 ) ( not ( = ?auto_16038 ?auto_16039 ) ) ( not ( = ?auto_16045 ?auto_16038 ) ) ( not ( = ?auto_16045 ?auto_16039 ) ) ( not ( = ?auto_16042 ?auto_16040 ) ) ( HOIST-AT ?auto_16044 ?auto_16042 ) ( not ( = ?auto_16041 ?auto_16044 ) ) ( AVAILABLE ?auto_16044 ) ( SURFACE-AT ?auto_16039 ?auto_16042 ) ( ON ?auto_16039 ?auto_16046 ) ( CLEAR ?auto_16039 ) ( not ( = ?auto_16038 ?auto_16046 ) ) ( not ( = ?auto_16039 ?auto_16046 ) ) ( not ( = ?auto_16045 ?auto_16046 ) ) ( TRUCK-AT ?auto_16043 ?auto_16040 ) ( SURFACE-AT ?auto_16045 ?auto_16040 ) ( CLEAR ?auto_16045 ) ( LIFTING ?auto_16041 ?auto_16038 ) ( IS-CRATE ?auto_16038 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16045 ?auto_16038 )
      ( MAKE-2CRATE ?auto_16045 ?auto_16038 ?auto_16039 )
      ( MAKE-1CRATE-VERIFY ?auto_16038 ?auto_16039 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16047 - SURFACE
      ?auto_16048 - SURFACE
      ?auto_16049 - SURFACE
    )
    :vars
    (
      ?auto_16052 - HOIST
      ?auto_16050 - PLACE
      ?auto_16053 - PLACE
      ?auto_16051 - HOIST
      ?auto_16054 - SURFACE
      ?auto_16055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16052 ?auto_16050 ) ( IS-CRATE ?auto_16049 ) ( not ( = ?auto_16048 ?auto_16049 ) ) ( not ( = ?auto_16047 ?auto_16048 ) ) ( not ( = ?auto_16047 ?auto_16049 ) ) ( not ( = ?auto_16053 ?auto_16050 ) ) ( HOIST-AT ?auto_16051 ?auto_16053 ) ( not ( = ?auto_16052 ?auto_16051 ) ) ( AVAILABLE ?auto_16051 ) ( SURFACE-AT ?auto_16049 ?auto_16053 ) ( ON ?auto_16049 ?auto_16054 ) ( CLEAR ?auto_16049 ) ( not ( = ?auto_16048 ?auto_16054 ) ) ( not ( = ?auto_16049 ?auto_16054 ) ) ( not ( = ?auto_16047 ?auto_16054 ) ) ( TRUCK-AT ?auto_16055 ?auto_16050 ) ( SURFACE-AT ?auto_16047 ?auto_16050 ) ( CLEAR ?auto_16047 ) ( LIFTING ?auto_16052 ?auto_16048 ) ( IS-CRATE ?auto_16048 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16048 ?auto_16049 )
      ( MAKE-2CRATE-VERIFY ?auto_16047 ?auto_16048 ?auto_16049 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16056 - SURFACE
      ?auto_16057 - SURFACE
      ?auto_16058 - SURFACE
      ?auto_16059 - SURFACE
    )
    :vars
    (
      ?auto_16061 - HOIST
      ?auto_16060 - PLACE
      ?auto_16065 - PLACE
      ?auto_16062 - HOIST
      ?auto_16063 - SURFACE
      ?auto_16064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16061 ?auto_16060 ) ( IS-CRATE ?auto_16059 ) ( not ( = ?auto_16058 ?auto_16059 ) ) ( not ( = ?auto_16057 ?auto_16058 ) ) ( not ( = ?auto_16057 ?auto_16059 ) ) ( not ( = ?auto_16065 ?auto_16060 ) ) ( HOIST-AT ?auto_16062 ?auto_16065 ) ( not ( = ?auto_16061 ?auto_16062 ) ) ( AVAILABLE ?auto_16062 ) ( SURFACE-AT ?auto_16059 ?auto_16065 ) ( ON ?auto_16059 ?auto_16063 ) ( CLEAR ?auto_16059 ) ( not ( = ?auto_16058 ?auto_16063 ) ) ( not ( = ?auto_16059 ?auto_16063 ) ) ( not ( = ?auto_16057 ?auto_16063 ) ) ( TRUCK-AT ?auto_16064 ?auto_16060 ) ( SURFACE-AT ?auto_16057 ?auto_16060 ) ( CLEAR ?auto_16057 ) ( LIFTING ?auto_16061 ?auto_16058 ) ( IS-CRATE ?auto_16058 ) ( ON ?auto_16057 ?auto_16056 ) ( not ( = ?auto_16056 ?auto_16057 ) ) ( not ( = ?auto_16056 ?auto_16058 ) ) ( not ( = ?auto_16056 ?auto_16059 ) ) ( not ( = ?auto_16056 ?auto_16063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16057 ?auto_16058 ?auto_16059 )
      ( MAKE-3CRATE-VERIFY ?auto_16056 ?auto_16057 ?auto_16058 ?auto_16059 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16066 - SURFACE
      ?auto_16067 - SURFACE
    )
    :vars
    (
      ?auto_16069 - HOIST
      ?auto_16068 - PLACE
      ?auto_16070 - SURFACE
      ?auto_16074 - PLACE
      ?auto_16071 - HOIST
      ?auto_16072 - SURFACE
      ?auto_16073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16069 ?auto_16068 ) ( IS-CRATE ?auto_16067 ) ( not ( = ?auto_16066 ?auto_16067 ) ) ( not ( = ?auto_16070 ?auto_16066 ) ) ( not ( = ?auto_16070 ?auto_16067 ) ) ( not ( = ?auto_16074 ?auto_16068 ) ) ( HOIST-AT ?auto_16071 ?auto_16074 ) ( not ( = ?auto_16069 ?auto_16071 ) ) ( AVAILABLE ?auto_16071 ) ( SURFACE-AT ?auto_16067 ?auto_16074 ) ( ON ?auto_16067 ?auto_16072 ) ( CLEAR ?auto_16067 ) ( not ( = ?auto_16066 ?auto_16072 ) ) ( not ( = ?auto_16067 ?auto_16072 ) ) ( not ( = ?auto_16070 ?auto_16072 ) ) ( TRUCK-AT ?auto_16073 ?auto_16068 ) ( SURFACE-AT ?auto_16070 ?auto_16068 ) ( CLEAR ?auto_16070 ) ( IS-CRATE ?auto_16066 ) ( AVAILABLE ?auto_16069 ) ( IN ?auto_16066 ?auto_16073 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16069 ?auto_16066 ?auto_16073 ?auto_16068 )
      ( MAKE-2CRATE ?auto_16070 ?auto_16066 ?auto_16067 )
      ( MAKE-1CRATE-VERIFY ?auto_16066 ?auto_16067 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16075 - SURFACE
      ?auto_16076 - SURFACE
      ?auto_16077 - SURFACE
    )
    :vars
    (
      ?auto_16079 - HOIST
      ?auto_16081 - PLACE
      ?auto_16080 - PLACE
      ?auto_16082 - HOIST
      ?auto_16078 - SURFACE
      ?auto_16083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16079 ?auto_16081 ) ( IS-CRATE ?auto_16077 ) ( not ( = ?auto_16076 ?auto_16077 ) ) ( not ( = ?auto_16075 ?auto_16076 ) ) ( not ( = ?auto_16075 ?auto_16077 ) ) ( not ( = ?auto_16080 ?auto_16081 ) ) ( HOIST-AT ?auto_16082 ?auto_16080 ) ( not ( = ?auto_16079 ?auto_16082 ) ) ( AVAILABLE ?auto_16082 ) ( SURFACE-AT ?auto_16077 ?auto_16080 ) ( ON ?auto_16077 ?auto_16078 ) ( CLEAR ?auto_16077 ) ( not ( = ?auto_16076 ?auto_16078 ) ) ( not ( = ?auto_16077 ?auto_16078 ) ) ( not ( = ?auto_16075 ?auto_16078 ) ) ( TRUCK-AT ?auto_16083 ?auto_16081 ) ( SURFACE-AT ?auto_16075 ?auto_16081 ) ( CLEAR ?auto_16075 ) ( IS-CRATE ?auto_16076 ) ( AVAILABLE ?auto_16079 ) ( IN ?auto_16076 ?auto_16083 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16076 ?auto_16077 )
      ( MAKE-2CRATE-VERIFY ?auto_16075 ?auto_16076 ?auto_16077 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16084 - SURFACE
      ?auto_16085 - SURFACE
      ?auto_16086 - SURFACE
      ?auto_16087 - SURFACE
    )
    :vars
    (
      ?auto_16091 - HOIST
      ?auto_16088 - PLACE
      ?auto_16092 - PLACE
      ?auto_16093 - HOIST
      ?auto_16090 - SURFACE
      ?auto_16089 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16091 ?auto_16088 ) ( IS-CRATE ?auto_16087 ) ( not ( = ?auto_16086 ?auto_16087 ) ) ( not ( = ?auto_16085 ?auto_16086 ) ) ( not ( = ?auto_16085 ?auto_16087 ) ) ( not ( = ?auto_16092 ?auto_16088 ) ) ( HOIST-AT ?auto_16093 ?auto_16092 ) ( not ( = ?auto_16091 ?auto_16093 ) ) ( AVAILABLE ?auto_16093 ) ( SURFACE-AT ?auto_16087 ?auto_16092 ) ( ON ?auto_16087 ?auto_16090 ) ( CLEAR ?auto_16087 ) ( not ( = ?auto_16086 ?auto_16090 ) ) ( not ( = ?auto_16087 ?auto_16090 ) ) ( not ( = ?auto_16085 ?auto_16090 ) ) ( TRUCK-AT ?auto_16089 ?auto_16088 ) ( SURFACE-AT ?auto_16085 ?auto_16088 ) ( CLEAR ?auto_16085 ) ( IS-CRATE ?auto_16086 ) ( AVAILABLE ?auto_16091 ) ( IN ?auto_16086 ?auto_16089 ) ( ON ?auto_16085 ?auto_16084 ) ( not ( = ?auto_16084 ?auto_16085 ) ) ( not ( = ?auto_16084 ?auto_16086 ) ) ( not ( = ?auto_16084 ?auto_16087 ) ) ( not ( = ?auto_16084 ?auto_16090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16085 ?auto_16086 ?auto_16087 )
      ( MAKE-3CRATE-VERIFY ?auto_16084 ?auto_16085 ?auto_16086 ?auto_16087 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16094 - SURFACE
      ?auto_16095 - SURFACE
    )
    :vars
    (
      ?auto_16100 - HOIST
      ?auto_16096 - PLACE
      ?auto_16097 - SURFACE
      ?auto_16101 - PLACE
      ?auto_16102 - HOIST
      ?auto_16099 - SURFACE
      ?auto_16098 - TRUCK
      ?auto_16103 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16100 ?auto_16096 ) ( IS-CRATE ?auto_16095 ) ( not ( = ?auto_16094 ?auto_16095 ) ) ( not ( = ?auto_16097 ?auto_16094 ) ) ( not ( = ?auto_16097 ?auto_16095 ) ) ( not ( = ?auto_16101 ?auto_16096 ) ) ( HOIST-AT ?auto_16102 ?auto_16101 ) ( not ( = ?auto_16100 ?auto_16102 ) ) ( AVAILABLE ?auto_16102 ) ( SURFACE-AT ?auto_16095 ?auto_16101 ) ( ON ?auto_16095 ?auto_16099 ) ( CLEAR ?auto_16095 ) ( not ( = ?auto_16094 ?auto_16099 ) ) ( not ( = ?auto_16095 ?auto_16099 ) ) ( not ( = ?auto_16097 ?auto_16099 ) ) ( SURFACE-AT ?auto_16097 ?auto_16096 ) ( CLEAR ?auto_16097 ) ( IS-CRATE ?auto_16094 ) ( AVAILABLE ?auto_16100 ) ( IN ?auto_16094 ?auto_16098 ) ( TRUCK-AT ?auto_16098 ?auto_16103 ) ( not ( = ?auto_16103 ?auto_16096 ) ) ( not ( = ?auto_16101 ?auto_16103 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16098 ?auto_16103 ?auto_16096 )
      ( MAKE-2CRATE ?auto_16097 ?auto_16094 ?auto_16095 )
      ( MAKE-1CRATE-VERIFY ?auto_16094 ?auto_16095 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16104 - SURFACE
      ?auto_16105 - SURFACE
      ?auto_16106 - SURFACE
    )
    :vars
    (
      ?auto_16111 - HOIST
      ?auto_16108 - PLACE
      ?auto_16107 - PLACE
      ?auto_16110 - HOIST
      ?auto_16109 - SURFACE
      ?auto_16112 - TRUCK
      ?auto_16113 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16111 ?auto_16108 ) ( IS-CRATE ?auto_16106 ) ( not ( = ?auto_16105 ?auto_16106 ) ) ( not ( = ?auto_16104 ?auto_16105 ) ) ( not ( = ?auto_16104 ?auto_16106 ) ) ( not ( = ?auto_16107 ?auto_16108 ) ) ( HOIST-AT ?auto_16110 ?auto_16107 ) ( not ( = ?auto_16111 ?auto_16110 ) ) ( AVAILABLE ?auto_16110 ) ( SURFACE-AT ?auto_16106 ?auto_16107 ) ( ON ?auto_16106 ?auto_16109 ) ( CLEAR ?auto_16106 ) ( not ( = ?auto_16105 ?auto_16109 ) ) ( not ( = ?auto_16106 ?auto_16109 ) ) ( not ( = ?auto_16104 ?auto_16109 ) ) ( SURFACE-AT ?auto_16104 ?auto_16108 ) ( CLEAR ?auto_16104 ) ( IS-CRATE ?auto_16105 ) ( AVAILABLE ?auto_16111 ) ( IN ?auto_16105 ?auto_16112 ) ( TRUCK-AT ?auto_16112 ?auto_16113 ) ( not ( = ?auto_16113 ?auto_16108 ) ) ( not ( = ?auto_16107 ?auto_16113 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16105 ?auto_16106 )
      ( MAKE-2CRATE-VERIFY ?auto_16104 ?auto_16105 ?auto_16106 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16114 - SURFACE
      ?auto_16115 - SURFACE
      ?auto_16116 - SURFACE
      ?auto_16117 - SURFACE
    )
    :vars
    (
      ?auto_16124 - HOIST
      ?auto_16123 - PLACE
      ?auto_16120 - PLACE
      ?auto_16119 - HOIST
      ?auto_16118 - SURFACE
      ?auto_16122 - TRUCK
      ?auto_16121 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16124 ?auto_16123 ) ( IS-CRATE ?auto_16117 ) ( not ( = ?auto_16116 ?auto_16117 ) ) ( not ( = ?auto_16115 ?auto_16116 ) ) ( not ( = ?auto_16115 ?auto_16117 ) ) ( not ( = ?auto_16120 ?auto_16123 ) ) ( HOIST-AT ?auto_16119 ?auto_16120 ) ( not ( = ?auto_16124 ?auto_16119 ) ) ( AVAILABLE ?auto_16119 ) ( SURFACE-AT ?auto_16117 ?auto_16120 ) ( ON ?auto_16117 ?auto_16118 ) ( CLEAR ?auto_16117 ) ( not ( = ?auto_16116 ?auto_16118 ) ) ( not ( = ?auto_16117 ?auto_16118 ) ) ( not ( = ?auto_16115 ?auto_16118 ) ) ( SURFACE-AT ?auto_16115 ?auto_16123 ) ( CLEAR ?auto_16115 ) ( IS-CRATE ?auto_16116 ) ( AVAILABLE ?auto_16124 ) ( IN ?auto_16116 ?auto_16122 ) ( TRUCK-AT ?auto_16122 ?auto_16121 ) ( not ( = ?auto_16121 ?auto_16123 ) ) ( not ( = ?auto_16120 ?auto_16121 ) ) ( ON ?auto_16115 ?auto_16114 ) ( not ( = ?auto_16114 ?auto_16115 ) ) ( not ( = ?auto_16114 ?auto_16116 ) ) ( not ( = ?auto_16114 ?auto_16117 ) ) ( not ( = ?auto_16114 ?auto_16118 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16115 ?auto_16116 ?auto_16117 )
      ( MAKE-3CRATE-VERIFY ?auto_16114 ?auto_16115 ?auto_16116 ?auto_16117 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16125 - SURFACE
      ?auto_16126 - SURFACE
    )
    :vars
    (
      ?auto_16134 - HOIST
      ?auto_16133 - PLACE
      ?auto_16129 - SURFACE
      ?auto_16130 - PLACE
      ?auto_16128 - HOIST
      ?auto_16127 - SURFACE
      ?auto_16132 - TRUCK
      ?auto_16131 - PLACE
      ?auto_16135 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16134 ?auto_16133 ) ( IS-CRATE ?auto_16126 ) ( not ( = ?auto_16125 ?auto_16126 ) ) ( not ( = ?auto_16129 ?auto_16125 ) ) ( not ( = ?auto_16129 ?auto_16126 ) ) ( not ( = ?auto_16130 ?auto_16133 ) ) ( HOIST-AT ?auto_16128 ?auto_16130 ) ( not ( = ?auto_16134 ?auto_16128 ) ) ( AVAILABLE ?auto_16128 ) ( SURFACE-AT ?auto_16126 ?auto_16130 ) ( ON ?auto_16126 ?auto_16127 ) ( CLEAR ?auto_16126 ) ( not ( = ?auto_16125 ?auto_16127 ) ) ( not ( = ?auto_16126 ?auto_16127 ) ) ( not ( = ?auto_16129 ?auto_16127 ) ) ( SURFACE-AT ?auto_16129 ?auto_16133 ) ( CLEAR ?auto_16129 ) ( IS-CRATE ?auto_16125 ) ( AVAILABLE ?auto_16134 ) ( TRUCK-AT ?auto_16132 ?auto_16131 ) ( not ( = ?auto_16131 ?auto_16133 ) ) ( not ( = ?auto_16130 ?auto_16131 ) ) ( HOIST-AT ?auto_16135 ?auto_16131 ) ( LIFTING ?auto_16135 ?auto_16125 ) ( not ( = ?auto_16134 ?auto_16135 ) ) ( not ( = ?auto_16128 ?auto_16135 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16135 ?auto_16125 ?auto_16132 ?auto_16131 )
      ( MAKE-2CRATE ?auto_16129 ?auto_16125 ?auto_16126 )
      ( MAKE-1CRATE-VERIFY ?auto_16125 ?auto_16126 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16136 - SURFACE
      ?auto_16137 - SURFACE
      ?auto_16138 - SURFACE
    )
    :vars
    (
      ?auto_16143 - HOIST
      ?auto_16144 - PLACE
      ?auto_16146 - PLACE
      ?auto_16139 - HOIST
      ?auto_16145 - SURFACE
      ?auto_16142 - TRUCK
      ?auto_16140 - PLACE
      ?auto_16141 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16143 ?auto_16144 ) ( IS-CRATE ?auto_16138 ) ( not ( = ?auto_16137 ?auto_16138 ) ) ( not ( = ?auto_16136 ?auto_16137 ) ) ( not ( = ?auto_16136 ?auto_16138 ) ) ( not ( = ?auto_16146 ?auto_16144 ) ) ( HOIST-AT ?auto_16139 ?auto_16146 ) ( not ( = ?auto_16143 ?auto_16139 ) ) ( AVAILABLE ?auto_16139 ) ( SURFACE-AT ?auto_16138 ?auto_16146 ) ( ON ?auto_16138 ?auto_16145 ) ( CLEAR ?auto_16138 ) ( not ( = ?auto_16137 ?auto_16145 ) ) ( not ( = ?auto_16138 ?auto_16145 ) ) ( not ( = ?auto_16136 ?auto_16145 ) ) ( SURFACE-AT ?auto_16136 ?auto_16144 ) ( CLEAR ?auto_16136 ) ( IS-CRATE ?auto_16137 ) ( AVAILABLE ?auto_16143 ) ( TRUCK-AT ?auto_16142 ?auto_16140 ) ( not ( = ?auto_16140 ?auto_16144 ) ) ( not ( = ?auto_16146 ?auto_16140 ) ) ( HOIST-AT ?auto_16141 ?auto_16140 ) ( LIFTING ?auto_16141 ?auto_16137 ) ( not ( = ?auto_16143 ?auto_16141 ) ) ( not ( = ?auto_16139 ?auto_16141 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16137 ?auto_16138 )
      ( MAKE-2CRATE-VERIFY ?auto_16136 ?auto_16137 ?auto_16138 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16147 - SURFACE
      ?auto_16148 - SURFACE
      ?auto_16149 - SURFACE
      ?auto_16150 - SURFACE
    )
    :vars
    (
      ?auto_16158 - HOIST
      ?auto_16156 - PLACE
      ?auto_16154 - PLACE
      ?auto_16151 - HOIST
      ?auto_16157 - SURFACE
      ?auto_16152 - TRUCK
      ?auto_16155 - PLACE
      ?auto_16153 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16158 ?auto_16156 ) ( IS-CRATE ?auto_16150 ) ( not ( = ?auto_16149 ?auto_16150 ) ) ( not ( = ?auto_16148 ?auto_16149 ) ) ( not ( = ?auto_16148 ?auto_16150 ) ) ( not ( = ?auto_16154 ?auto_16156 ) ) ( HOIST-AT ?auto_16151 ?auto_16154 ) ( not ( = ?auto_16158 ?auto_16151 ) ) ( AVAILABLE ?auto_16151 ) ( SURFACE-AT ?auto_16150 ?auto_16154 ) ( ON ?auto_16150 ?auto_16157 ) ( CLEAR ?auto_16150 ) ( not ( = ?auto_16149 ?auto_16157 ) ) ( not ( = ?auto_16150 ?auto_16157 ) ) ( not ( = ?auto_16148 ?auto_16157 ) ) ( SURFACE-AT ?auto_16148 ?auto_16156 ) ( CLEAR ?auto_16148 ) ( IS-CRATE ?auto_16149 ) ( AVAILABLE ?auto_16158 ) ( TRUCK-AT ?auto_16152 ?auto_16155 ) ( not ( = ?auto_16155 ?auto_16156 ) ) ( not ( = ?auto_16154 ?auto_16155 ) ) ( HOIST-AT ?auto_16153 ?auto_16155 ) ( LIFTING ?auto_16153 ?auto_16149 ) ( not ( = ?auto_16158 ?auto_16153 ) ) ( not ( = ?auto_16151 ?auto_16153 ) ) ( ON ?auto_16148 ?auto_16147 ) ( not ( = ?auto_16147 ?auto_16148 ) ) ( not ( = ?auto_16147 ?auto_16149 ) ) ( not ( = ?auto_16147 ?auto_16150 ) ) ( not ( = ?auto_16147 ?auto_16157 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16148 ?auto_16149 ?auto_16150 )
      ( MAKE-3CRATE-VERIFY ?auto_16147 ?auto_16148 ?auto_16149 ?auto_16150 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16159 - SURFACE
      ?auto_16160 - SURFACE
    )
    :vars
    (
      ?auto_16169 - HOIST
      ?auto_16167 - PLACE
      ?auto_16162 - SURFACE
      ?auto_16165 - PLACE
      ?auto_16161 - HOIST
      ?auto_16168 - SURFACE
      ?auto_16163 - TRUCK
      ?auto_16166 - PLACE
      ?auto_16164 - HOIST
      ?auto_16170 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16169 ?auto_16167 ) ( IS-CRATE ?auto_16160 ) ( not ( = ?auto_16159 ?auto_16160 ) ) ( not ( = ?auto_16162 ?auto_16159 ) ) ( not ( = ?auto_16162 ?auto_16160 ) ) ( not ( = ?auto_16165 ?auto_16167 ) ) ( HOIST-AT ?auto_16161 ?auto_16165 ) ( not ( = ?auto_16169 ?auto_16161 ) ) ( AVAILABLE ?auto_16161 ) ( SURFACE-AT ?auto_16160 ?auto_16165 ) ( ON ?auto_16160 ?auto_16168 ) ( CLEAR ?auto_16160 ) ( not ( = ?auto_16159 ?auto_16168 ) ) ( not ( = ?auto_16160 ?auto_16168 ) ) ( not ( = ?auto_16162 ?auto_16168 ) ) ( SURFACE-AT ?auto_16162 ?auto_16167 ) ( CLEAR ?auto_16162 ) ( IS-CRATE ?auto_16159 ) ( AVAILABLE ?auto_16169 ) ( TRUCK-AT ?auto_16163 ?auto_16166 ) ( not ( = ?auto_16166 ?auto_16167 ) ) ( not ( = ?auto_16165 ?auto_16166 ) ) ( HOIST-AT ?auto_16164 ?auto_16166 ) ( not ( = ?auto_16169 ?auto_16164 ) ) ( not ( = ?auto_16161 ?auto_16164 ) ) ( AVAILABLE ?auto_16164 ) ( SURFACE-AT ?auto_16159 ?auto_16166 ) ( ON ?auto_16159 ?auto_16170 ) ( CLEAR ?auto_16159 ) ( not ( = ?auto_16159 ?auto_16170 ) ) ( not ( = ?auto_16160 ?auto_16170 ) ) ( not ( = ?auto_16162 ?auto_16170 ) ) ( not ( = ?auto_16168 ?auto_16170 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16164 ?auto_16159 ?auto_16170 ?auto_16166 )
      ( MAKE-2CRATE ?auto_16162 ?auto_16159 ?auto_16160 )
      ( MAKE-1CRATE-VERIFY ?auto_16159 ?auto_16160 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16171 - SURFACE
      ?auto_16172 - SURFACE
      ?auto_16173 - SURFACE
    )
    :vars
    (
      ?auto_16178 - HOIST
      ?auto_16180 - PLACE
      ?auto_16177 - PLACE
      ?auto_16176 - HOIST
      ?auto_16179 - SURFACE
      ?auto_16174 - TRUCK
      ?auto_16175 - PLACE
      ?auto_16181 - HOIST
      ?auto_16182 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16178 ?auto_16180 ) ( IS-CRATE ?auto_16173 ) ( not ( = ?auto_16172 ?auto_16173 ) ) ( not ( = ?auto_16171 ?auto_16172 ) ) ( not ( = ?auto_16171 ?auto_16173 ) ) ( not ( = ?auto_16177 ?auto_16180 ) ) ( HOIST-AT ?auto_16176 ?auto_16177 ) ( not ( = ?auto_16178 ?auto_16176 ) ) ( AVAILABLE ?auto_16176 ) ( SURFACE-AT ?auto_16173 ?auto_16177 ) ( ON ?auto_16173 ?auto_16179 ) ( CLEAR ?auto_16173 ) ( not ( = ?auto_16172 ?auto_16179 ) ) ( not ( = ?auto_16173 ?auto_16179 ) ) ( not ( = ?auto_16171 ?auto_16179 ) ) ( SURFACE-AT ?auto_16171 ?auto_16180 ) ( CLEAR ?auto_16171 ) ( IS-CRATE ?auto_16172 ) ( AVAILABLE ?auto_16178 ) ( TRUCK-AT ?auto_16174 ?auto_16175 ) ( not ( = ?auto_16175 ?auto_16180 ) ) ( not ( = ?auto_16177 ?auto_16175 ) ) ( HOIST-AT ?auto_16181 ?auto_16175 ) ( not ( = ?auto_16178 ?auto_16181 ) ) ( not ( = ?auto_16176 ?auto_16181 ) ) ( AVAILABLE ?auto_16181 ) ( SURFACE-AT ?auto_16172 ?auto_16175 ) ( ON ?auto_16172 ?auto_16182 ) ( CLEAR ?auto_16172 ) ( not ( = ?auto_16172 ?auto_16182 ) ) ( not ( = ?auto_16173 ?auto_16182 ) ) ( not ( = ?auto_16171 ?auto_16182 ) ) ( not ( = ?auto_16179 ?auto_16182 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16172 ?auto_16173 )
      ( MAKE-2CRATE-VERIFY ?auto_16171 ?auto_16172 ?auto_16173 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16183 - SURFACE
      ?auto_16184 - SURFACE
      ?auto_16185 - SURFACE
      ?auto_16186 - SURFACE
    )
    :vars
    (
      ?auto_16188 - HOIST
      ?auto_16195 - PLACE
      ?auto_16190 - PLACE
      ?auto_16191 - HOIST
      ?auto_16189 - SURFACE
      ?auto_16194 - TRUCK
      ?auto_16193 - PLACE
      ?auto_16187 - HOIST
      ?auto_16192 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16188 ?auto_16195 ) ( IS-CRATE ?auto_16186 ) ( not ( = ?auto_16185 ?auto_16186 ) ) ( not ( = ?auto_16184 ?auto_16185 ) ) ( not ( = ?auto_16184 ?auto_16186 ) ) ( not ( = ?auto_16190 ?auto_16195 ) ) ( HOIST-AT ?auto_16191 ?auto_16190 ) ( not ( = ?auto_16188 ?auto_16191 ) ) ( AVAILABLE ?auto_16191 ) ( SURFACE-AT ?auto_16186 ?auto_16190 ) ( ON ?auto_16186 ?auto_16189 ) ( CLEAR ?auto_16186 ) ( not ( = ?auto_16185 ?auto_16189 ) ) ( not ( = ?auto_16186 ?auto_16189 ) ) ( not ( = ?auto_16184 ?auto_16189 ) ) ( SURFACE-AT ?auto_16184 ?auto_16195 ) ( CLEAR ?auto_16184 ) ( IS-CRATE ?auto_16185 ) ( AVAILABLE ?auto_16188 ) ( TRUCK-AT ?auto_16194 ?auto_16193 ) ( not ( = ?auto_16193 ?auto_16195 ) ) ( not ( = ?auto_16190 ?auto_16193 ) ) ( HOIST-AT ?auto_16187 ?auto_16193 ) ( not ( = ?auto_16188 ?auto_16187 ) ) ( not ( = ?auto_16191 ?auto_16187 ) ) ( AVAILABLE ?auto_16187 ) ( SURFACE-AT ?auto_16185 ?auto_16193 ) ( ON ?auto_16185 ?auto_16192 ) ( CLEAR ?auto_16185 ) ( not ( = ?auto_16185 ?auto_16192 ) ) ( not ( = ?auto_16186 ?auto_16192 ) ) ( not ( = ?auto_16184 ?auto_16192 ) ) ( not ( = ?auto_16189 ?auto_16192 ) ) ( ON ?auto_16184 ?auto_16183 ) ( not ( = ?auto_16183 ?auto_16184 ) ) ( not ( = ?auto_16183 ?auto_16185 ) ) ( not ( = ?auto_16183 ?auto_16186 ) ) ( not ( = ?auto_16183 ?auto_16189 ) ) ( not ( = ?auto_16183 ?auto_16192 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16184 ?auto_16185 ?auto_16186 )
      ( MAKE-3CRATE-VERIFY ?auto_16183 ?auto_16184 ?auto_16185 ?auto_16186 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16196 - SURFACE
      ?auto_16197 - SURFACE
    )
    :vars
    (
      ?auto_16199 - HOIST
      ?auto_16207 - PLACE
      ?auto_16206 - SURFACE
      ?auto_16201 - PLACE
      ?auto_16202 - HOIST
      ?auto_16200 - SURFACE
      ?auto_16204 - PLACE
      ?auto_16198 - HOIST
      ?auto_16203 - SURFACE
      ?auto_16205 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16199 ?auto_16207 ) ( IS-CRATE ?auto_16197 ) ( not ( = ?auto_16196 ?auto_16197 ) ) ( not ( = ?auto_16206 ?auto_16196 ) ) ( not ( = ?auto_16206 ?auto_16197 ) ) ( not ( = ?auto_16201 ?auto_16207 ) ) ( HOIST-AT ?auto_16202 ?auto_16201 ) ( not ( = ?auto_16199 ?auto_16202 ) ) ( AVAILABLE ?auto_16202 ) ( SURFACE-AT ?auto_16197 ?auto_16201 ) ( ON ?auto_16197 ?auto_16200 ) ( CLEAR ?auto_16197 ) ( not ( = ?auto_16196 ?auto_16200 ) ) ( not ( = ?auto_16197 ?auto_16200 ) ) ( not ( = ?auto_16206 ?auto_16200 ) ) ( SURFACE-AT ?auto_16206 ?auto_16207 ) ( CLEAR ?auto_16206 ) ( IS-CRATE ?auto_16196 ) ( AVAILABLE ?auto_16199 ) ( not ( = ?auto_16204 ?auto_16207 ) ) ( not ( = ?auto_16201 ?auto_16204 ) ) ( HOIST-AT ?auto_16198 ?auto_16204 ) ( not ( = ?auto_16199 ?auto_16198 ) ) ( not ( = ?auto_16202 ?auto_16198 ) ) ( AVAILABLE ?auto_16198 ) ( SURFACE-AT ?auto_16196 ?auto_16204 ) ( ON ?auto_16196 ?auto_16203 ) ( CLEAR ?auto_16196 ) ( not ( = ?auto_16196 ?auto_16203 ) ) ( not ( = ?auto_16197 ?auto_16203 ) ) ( not ( = ?auto_16206 ?auto_16203 ) ) ( not ( = ?auto_16200 ?auto_16203 ) ) ( TRUCK-AT ?auto_16205 ?auto_16207 ) )
    :subtasks
    ( ( !DRIVE ?auto_16205 ?auto_16207 ?auto_16204 )
      ( MAKE-2CRATE ?auto_16206 ?auto_16196 ?auto_16197 )
      ( MAKE-1CRATE-VERIFY ?auto_16196 ?auto_16197 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16208 - SURFACE
      ?auto_16209 - SURFACE
      ?auto_16210 - SURFACE
    )
    :vars
    (
      ?auto_16212 - HOIST
      ?auto_16214 - PLACE
      ?auto_16211 - PLACE
      ?auto_16213 - HOIST
      ?auto_16215 - SURFACE
      ?auto_16218 - PLACE
      ?auto_16216 - HOIST
      ?auto_16219 - SURFACE
      ?auto_16217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16212 ?auto_16214 ) ( IS-CRATE ?auto_16210 ) ( not ( = ?auto_16209 ?auto_16210 ) ) ( not ( = ?auto_16208 ?auto_16209 ) ) ( not ( = ?auto_16208 ?auto_16210 ) ) ( not ( = ?auto_16211 ?auto_16214 ) ) ( HOIST-AT ?auto_16213 ?auto_16211 ) ( not ( = ?auto_16212 ?auto_16213 ) ) ( AVAILABLE ?auto_16213 ) ( SURFACE-AT ?auto_16210 ?auto_16211 ) ( ON ?auto_16210 ?auto_16215 ) ( CLEAR ?auto_16210 ) ( not ( = ?auto_16209 ?auto_16215 ) ) ( not ( = ?auto_16210 ?auto_16215 ) ) ( not ( = ?auto_16208 ?auto_16215 ) ) ( SURFACE-AT ?auto_16208 ?auto_16214 ) ( CLEAR ?auto_16208 ) ( IS-CRATE ?auto_16209 ) ( AVAILABLE ?auto_16212 ) ( not ( = ?auto_16218 ?auto_16214 ) ) ( not ( = ?auto_16211 ?auto_16218 ) ) ( HOIST-AT ?auto_16216 ?auto_16218 ) ( not ( = ?auto_16212 ?auto_16216 ) ) ( not ( = ?auto_16213 ?auto_16216 ) ) ( AVAILABLE ?auto_16216 ) ( SURFACE-AT ?auto_16209 ?auto_16218 ) ( ON ?auto_16209 ?auto_16219 ) ( CLEAR ?auto_16209 ) ( not ( = ?auto_16209 ?auto_16219 ) ) ( not ( = ?auto_16210 ?auto_16219 ) ) ( not ( = ?auto_16208 ?auto_16219 ) ) ( not ( = ?auto_16215 ?auto_16219 ) ) ( TRUCK-AT ?auto_16217 ?auto_16214 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16209 ?auto_16210 )
      ( MAKE-2CRATE-VERIFY ?auto_16208 ?auto_16209 ?auto_16210 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16220 - SURFACE
      ?auto_16221 - SURFACE
      ?auto_16222 - SURFACE
      ?auto_16223 - SURFACE
    )
    :vars
    (
      ?auto_16224 - HOIST
      ?auto_16226 - PLACE
      ?auto_16230 - PLACE
      ?auto_16231 - HOIST
      ?auto_16232 - SURFACE
      ?auto_16227 - PLACE
      ?auto_16225 - HOIST
      ?auto_16229 - SURFACE
      ?auto_16228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16224 ?auto_16226 ) ( IS-CRATE ?auto_16223 ) ( not ( = ?auto_16222 ?auto_16223 ) ) ( not ( = ?auto_16221 ?auto_16222 ) ) ( not ( = ?auto_16221 ?auto_16223 ) ) ( not ( = ?auto_16230 ?auto_16226 ) ) ( HOIST-AT ?auto_16231 ?auto_16230 ) ( not ( = ?auto_16224 ?auto_16231 ) ) ( AVAILABLE ?auto_16231 ) ( SURFACE-AT ?auto_16223 ?auto_16230 ) ( ON ?auto_16223 ?auto_16232 ) ( CLEAR ?auto_16223 ) ( not ( = ?auto_16222 ?auto_16232 ) ) ( not ( = ?auto_16223 ?auto_16232 ) ) ( not ( = ?auto_16221 ?auto_16232 ) ) ( SURFACE-AT ?auto_16221 ?auto_16226 ) ( CLEAR ?auto_16221 ) ( IS-CRATE ?auto_16222 ) ( AVAILABLE ?auto_16224 ) ( not ( = ?auto_16227 ?auto_16226 ) ) ( not ( = ?auto_16230 ?auto_16227 ) ) ( HOIST-AT ?auto_16225 ?auto_16227 ) ( not ( = ?auto_16224 ?auto_16225 ) ) ( not ( = ?auto_16231 ?auto_16225 ) ) ( AVAILABLE ?auto_16225 ) ( SURFACE-AT ?auto_16222 ?auto_16227 ) ( ON ?auto_16222 ?auto_16229 ) ( CLEAR ?auto_16222 ) ( not ( = ?auto_16222 ?auto_16229 ) ) ( not ( = ?auto_16223 ?auto_16229 ) ) ( not ( = ?auto_16221 ?auto_16229 ) ) ( not ( = ?auto_16232 ?auto_16229 ) ) ( TRUCK-AT ?auto_16228 ?auto_16226 ) ( ON ?auto_16221 ?auto_16220 ) ( not ( = ?auto_16220 ?auto_16221 ) ) ( not ( = ?auto_16220 ?auto_16222 ) ) ( not ( = ?auto_16220 ?auto_16223 ) ) ( not ( = ?auto_16220 ?auto_16232 ) ) ( not ( = ?auto_16220 ?auto_16229 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16221 ?auto_16222 ?auto_16223 )
      ( MAKE-3CRATE-VERIFY ?auto_16220 ?auto_16221 ?auto_16222 ?auto_16223 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16233 - SURFACE
      ?auto_16234 - SURFACE
    )
    :vars
    (
      ?auto_16235 - HOIST
      ?auto_16237 - PLACE
      ?auto_16238 - SURFACE
      ?auto_16242 - PLACE
      ?auto_16243 - HOIST
      ?auto_16244 - SURFACE
      ?auto_16239 - PLACE
      ?auto_16236 - HOIST
      ?auto_16241 - SURFACE
      ?auto_16240 - TRUCK
      ?auto_16245 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16235 ?auto_16237 ) ( IS-CRATE ?auto_16234 ) ( not ( = ?auto_16233 ?auto_16234 ) ) ( not ( = ?auto_16238 ?auto_16233 ) ) ( not ( = ?auto_16238 ?auto_16234 ) ) ( not ( = ?auto_16242 ?auto_16237 ) ) ( HOIST-AT ?auto_16243 ?auto_16242 ) ( not ( = ?auto_16235 ?auto_16243 ) ) ( AVAILABLE ?auto_16243 ) ( SURFACE-AT ?auto_16234 ?auto_16242 ) ( ON ?auto_16234 ?auto_16244 ) ( CLEAR ?auto_16234 ) ( not ( = ?auto_16233 ?auto_16244 ) ) ( not ( = ?auto_16234 ?auto_16244 ) ) ( not ( = ?auto_16238 ?auto_16244 ) ) ( IS-CRATE ?auto_16233 ) ( not ( = ?auto_16239 ?auto_16237 ) ) ( not ( = ?auto_16242 ?auto_16239 ) ) ( HOIST-AT ?auto_16236 ?auto_16239 ) ( not ( = ?auto_16235 ?auto_16236 ) ) ( not ( = ?auto_16243 ?auto_16236 ) ) ( AVAILABLE ?auto_16236 ) ( SURFACE-AT ?auto_16233 ?auto_16239 ) ( ON ?auto_16233 ?auto_16241 ) ( CLEAR ?auto_16233 ) ( not ( = ?auto_16233 ?auto_16241 ) ) ( not ( = ?auto_16234 ?auto_16241 ) ) ( not ( = ?auto_16238 ?auto_16241 ) ) ( not ( = ?auto_16244 ?auto_16241 ) ) ( TRUCK-AT ?auto_16240 ?auto_16237 ) ( SURFACE-AT ?auto_16245 ?auto_16237 ) ( CLEAR ?auto_16245 ) ( LIFTING ?auto_16235 ?auto_16238 ) ( IS-CRATE ?auto_16238 ) ( not ( = ?auto_16245 ?auto_16238 ) ) ( not ( = ?auto_16233 ?auto_16245 ) ) ( not ( = ?auto_16234 ?auto_16245 ) ) ( not ( = ?auto_16244 ?auto_16245 ) ) ( not ( = ?auto_16241 ?auto_16245 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16245 ?auto_16238 )
      ( MAKE-2CRATE ?auto_16238 ?auto_16233 ?auto_16234 )
      ( MAKE-1CRATE-VERIFY ?auto_16233 ?auto_16234 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16246 - SURFACE
      ?auto_16247 - SURFACE
      ?auto_16248 - SURFACE
    )
    :vars
    (
      ?auto_16252 - HOIST
      ?auto_16250 - PLACE
      ?auto_16251 - PLACE
      ?auto_16254 - HOIST
      ?auto_16249 - SURFACE
      ?auto_16256 - PLACE
      ?auto_16257 - HOIST
      ?auto_16253 - SURFACE
      ?auto_16258 - TRUCK
      ?auto_16255 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16252 ?auto_16250 ) ( IS-CRATE ?auto_16248 ) ( not ( = ?auto_16247 ?auto_16248 ) ) ( not ( = ?auto_16246 ?auto_16247 ) ) ( not ( = ?auto_16246 ?auto_16248 ) ) ( not ( = ?auto_16251 ?auto_16250 ) ) ( HOIST-AT ?auto_16254 ?auto_16251 ) ( not ( = ?auto_16252 ?auto_16254 ) ) ( AVAILABLE ?auto_16254 ) ( SURFACE-AT ?auto_16248 ?auto_16251 ) ( ON ?auto_16248 ?auto_16249 ) ( CLEAR ?auto_16248 ) ( not ( = ?auto_16247 ?auto_16249 ) ) ( not ( = ?auto_16248 ?auto_16249 ) ) ( not ( = ?auto_16246 ?auto_16249 ) ) ( IS-CRATE ?auto_16247 ) ( not ( = ?auto_16256 ?auto_16250 ) ) ( not ( = ?auto_16251 ?auto_16256 ) ) ( HOIST-AT ?auto_16257 ?auto_16256 ) ( not ( = ?auto_16252 ?auto_16257 ) ) ( not ( = ?auto_16254 ?auto_16257 ) ) ( AVAILABLE ?auto_16257 ) ( SURFACE-AT ?auto_16247 ?auto_16256 ) ( ON ?auto_16247 ?auto_16253 ) ( CLEAR ?auto_16247 ) ( not ( = ?auto_16247 ?auto_16253 ) ) ( not ( = ?auto_16248 ?auto_16253 ) ) ( not ( = ?auto_16246 ?auto_16253 ) ) ( not ( = ?auto_16249 ?auto_16253 ) ) ( TRUCK-AT ?auto_16258 ?auto_16250 ) ( SURFACE-AT ?auto_16255 ?auto_16250 ) ( CLEAR ?auto_16255 ) ( LIFTING ?auto_16252 ?auto_16246 ) ( IS-CRATE ?auto_16246 ) ( not ( = ?auto_16255 ?auto_16246 ) ) ( not ( = ?auto_16247 ?auto_16255 ) ) ( not ( = ?auto_16248 ?auto_16255 ) ) ( not ( = ?auto_16249 ?auto_16255 ) ) ( not ( = ?auto_16253 ?auto_16255 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16247 ?auto_16248 )
      ( MAKE-2CRATE-VERIFY ?auto_16246 ?auto_16247 ?auto_16248 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16259 - SURFACE
      ?auto_16260 - SURFACE
      ?auto_16261 - SURFACE
      ?auto_16262 - SURFACE
    )
    :vars
    (
      ?auto_16268 - HOIST
      ?auto_16267 - PLACE
      ?auto_16265 - PLACE
      ?auto_16269 - HOIST
      ?auto_16271 - SURFACE
      ?auto_16264 - PLACE
      ?auto_16270 - HOIST
      ?auto_16266 - SURFACE
      ?auto_16263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16268 ?auto_16267 ) ( IS-CRATE ?auto_16262 ) ( not ( = ?auto_16261 ?auto_16262 ) ) ( not ( = ?auto_16260 ?auto_16261 ) ) ( not ( = ?auto_16260 ?auto_16262 ) ) ( not ( = ?auto_16265 ?auto_16267 ) ) ( HOIST-AT ?auto_16269 ?auto_16265 ) ( not ( = ?auto_16268 ?auto_16269 ) ) ( AVAILABLE ?auto_16269 ) ( SURFACE-AT ?auto_16262 ?auto_16265 ) ( ON ?auto_16262 ?auto_16271 ) ( CLEAR ?auto_16262 ) ( not ( = ?auto_16261 ?auto_16271 ) ) ( not ( = ?auto_16262 ?auto_16271 ) ) ( not ( = ?auto_16260 ?auto_16271 ) ) ( IS-CRATE ?auto_16261 ) ( not ( = ?auto_16264 ?auto_16267 ) ) ( not ( = ?auto_16265 ?auto_16264 ) ) ( HOIST-AT ?auto_16270 ?auto_16264 ) ( not ( = ?auto_16268 ?auto_16270 ) ) ( not ( = ?auto_16269 ?auto_16270 ) ) ( AVAILABLE ?auto_16270 ) ( SURFACE-AT ?auto_16261 ?auto_16264 ) ( ON ?auto_16261 ?auto_16266 ) ( CLEAR ?auto_16261 ) ( not ( = ?auto_16261 ?auto_16266 ) ) ( not ( = ?auto_16262 ?auto_16266 ) ) ( not ( = ?auto_16260 ?auto_16266 ) ) ( not ( = ?auto_16271 ?auto_16266 ) ) ( TRUCK-AT ?auto_16263 ?auto_16267 ) ( SURFACE-AT ?auto_16259 ?auto_16267 ) ( CLEAR ?auto_16259 ) ( LIFTING ?auto_16268 ?auto_16260 ) ( IS-CRATE ?auto_16260 ) ( not ( = ?auto_16259 ?auto_16260 ) ) ( not ( = ?auto_16261 ?auto_16259 ) ) ( not ( = ?auto_16262 ?auto_16259 ) ) ( not ( = ?auto_16271 ?auto_16259 ) ) ( not ( = ?auto_16266 ?auto_16259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16260 ?auto_16261 ?auto_16262 )
      ( MAKE-3CRATE-VERIFY ?auto_16259 ?auto_16260 ?auto_16261 ?auto_16262 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16272 - SURFACE
      ?auto_16273 - SURFACE
    )
    :vars
    (
      ?auto_16280 - HOIST
      ?auto_16278 - PLACE
      ?auto_16281 - SURFACE
      ?auto_16276 - PLACE
      ?auto_16282 - HOIST
      ?auto_16284 - SURFACE
      ?auto_16275 - PLACE
      ?auto_16283 - HOIST
      ?auto_16277 - SURFACE
      ?auto_16274 - TRUCK
      ?auto_16279 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16280 ?auto_16278 ) ( IS-CRATE ?auto_16273 ) ( not ( = ?auto_16272 ?auto_16273 ) ) ( not ( = ?auto_16281 ?auto_16272 ) ) ( not ( = ?auto_16281 ?auto_16273 ) ) ( not ( = ?auto_16276 ?auto_16278 ) ) ( HOIST-AT ?auto_16282 ?auto_16276 ) ( not ( = ?auto_16280 ?auto_16282 ) ) ( AVAILABLE ?auto_16282 ) ( SURFACE-AT ?auto_16273 ?auto_16276 ) ( ON ?auto_16273 ?auto_16284 ) ( CLEAR ?auto_16273 ) ( not ( = ?auto_16272 ?auto_16284 ) ) ( not ( = ?auto_16273 ?auto_16284 ) ) ( not ( = ?auto_16281 ?auto_16284 ) ) ( IS-CRATE ?auto_16272 ) ( not ( = ?auto_16275 ?auto_16278 ) ) ( not ( = ?auto_16276 ?auto_16275 ) ) ( HOIST-AT ?auto_16283 ?auto_16275 ) ( not ( = ?auto_16280 ?auto_16283 ) ) ( not ( = ?auto_16282 ?auto_16283 ) ) ( AVAILABLE ?auto_16283 ) ( SURFACE-AT ?auto_16272 ?auto_16275 ) ( ON ?auto_16272 ?auto_16277 ) ( CLEAR ?auto_16272 ) ( not ( = ?auto_16272 ?auto_16277 ) ) ( not ( = ?auto_16273 ?auto_16277 ) ) ( not ( = ?auto_16281 ?auto_16277 ) ) ( not ( = ?auto_16284 ?auto_16277 ) ) ( TRUCK-AT ?auto_16274 ?auto_16278 ) ( SURFACE-AT ?auto_16279 ?auto_16278 ) ( CLEAR ?auto_16279 ) ( IS-CRATE ?auto_16281 ) ( not ( = ?auto_16279 ?auto_16281 ) ) ( not ( = ?auto_16272 ?auto_16279 ) ) ( not ( = ?auto_16273 ?auto_16279 ) ) ( not ( = ?auto_16284 ?auto_16279 ) ) ( not ( = ?auto_16277 ?auto_16279 ) ) ( AVAILABLE ?auto_16280 ) ( IN ?auto_16281 ?auto_16274 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16280 ?auto_16281 ?auto_16274 ?auto_16278 )
      ( MAKE-2CRATE ?auto_16281 ?auto_16272 ?auto_16273 )
      ( MAKE-1CRATE-VERIFY ?auto_16272 ?auto_16273 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16285 - SURFACE
      ?auto_16286 - SURFACE
      ?auto_16287 - SURFACE
    )
    :vars
    (
      ?auto_16294 - HOIST
      ?auto_16295 - PLACE
      ?auto_16292 - PLACE
      ?auto_16291 - HOIST
      ?auto_16290 - SURFACE
      ?auto_16297 - PLACE
      ?auto_16288 - HOIST
      ?auto_16293 - SURFACE
      ?auto_16296 - TRUCK
      ?auto_16289 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16294 ?auto_16295 ) ( IS-CRATE ?auto_16287 ) ( not ( = ?auto_16286 ?auto_16287 ) ) ( not ( = ?auto_16285 ?auto_16286 ) ) ( not ( = ?auto_16285 ?auto_16287 ) ) ( not ( = ?auto_16292 ?auto_16295 ) ) ( HOIST-AT ?auto_16291 ?auto_16292 ) ( not ( = ?auto_16294 ?auto_16291 ) ) ( AVAILABLE ?auto_16291 ) ( SURFACE-AT ?auto_16287 ?auto_16292 ) ( ON ?auto_16287 ?auto_16290 ) ( CLEAR ?auto_16287 ) ( not ( = ?auto_16286 ?auto_16290 ) ) ( not ( = ?auto_16287 ?auto_16290 ) ) ( not ( = ?auto_16285 ?auto_16290 ) ) ( IS-CRATE ?auto_16286 ) ( not ( = ?auto_16297 ?auto_16295 ) ) ( not ( = ?auto_16292 ?auto_16297 ) ) ( HOIST-AT ?auto_16288 ?auto_16297 ) ( not ( = ?auto_16294 ?auto_16288 ) ) ( not ( = ?auto_16291 ?auto_16288 ) ) ( AVAILABLE ?auto_16288 ) ( SURFACE-AT ?auto_16286 ?auto_16297 ) ( ON ?auto_16286 ?auto_16293 ) ( CLEAR ?auto_16286 ) ( not ( = ?auto_16286 ?auto_16293 ) ) ( not ( = ?auto_16287 ?auto_16293 ) ) ( not ( = ?auto_16285 ?auto_16293 ) ) ( not ( = ?auto_16290 ?auto_16293 ) ) ( TRUCK-AT ?auto_16296 ?auto_16295 ) ( SURFACE-AT ?auto_16289 ?auto_16295 ) ( CLEAR ?auto_16289 ) ( IS-CRATE ?auto_16285 ) ( not ( = ?auto_16289 ?auto_16285 ) ) ( not ( = ?auto_16286 ?auto_16289 ) ) ( not ( = ?auto_16287 ?auto_16289 ) ) ( not ( = ?auto_16290 ?auto_16289 ) ) ( not ( = ?auto_16293 ?auto_16289 ) ) ( AVAILABLE ?auto_16294 ) ( IN ?auto_16285 ?auto_16296 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16286 ?auto_16287 )
      ( MAKE-2CRATE-VERIFY ?auto_16285 ?auto_16286 ?auto_16287 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16298 - SURFACE
      ?auto_16299 - SURFACE
      ?auto_16300 - SURFACE
      ?auto_16301 - SURFACE
    )
    :vars
    (
      ?auto_16308 - HOIST
      ?auto_16302 - PLACE
      ?auto_16309 - PLACE
      ?auto_16306 - HOIST
      ?auto_16304 - SURFACE
      ?auto_16303 - PLACE
      ?auto_16307 - HOIST
      ?auto_16310 - SURFACE
      ?auto_16305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16308 ?auto_16302 ) ( IS-CRATE ?auto_16301 ) ( not ( = ?auto_16300 ?auto_16301 ) ) ( not ( = ?auto_16299 ?auto_16300 ) ) ( not ( = ?auto_16299 ?auto_16301 ) ) ( not ( = ?auto_16309 ?auto_16302 ) ) ( HOIST-AT ?auto_16306 ?auto_16309 ) ( not ( = ?auto_16308 ?auto_16306 ) ) ( AVAILABLE ?auto_16306 ) ( SURFACE-AT ?auto_16301 ?auto_16309 ) ( ON ?auto_16301 ?auto_16304 ) ( CLEAR ?auto_16301 ) ( not ( = ?auto_16300 ?auto_16304 ) ) ( not ( = ?auto_16301 ?auto_16304 ) ) ( not ( = ?auto_16299 ?auto_16304 ) ) ( IS-CRATE ?auto_16300 ) ( not ( = ?auto_16303 ?auto_16302 ) ) ( not ( = ?auto_16309 ?auto_16303 ) ) ( HOIST-AT ?auto_16307 ?auto_16303 ) ( not ( = ?auto_16308 ?auto_16307 ) ) ( not ( = ?auto_16306 ?auto_16307 ) ) ( AVAILABLE ?auto_16307 ) ( SURFACE-AT ?auto_16300 ?auto_16303 ) ( ON ?auto_16300 ?auto_16310 ) ( CLEAR ?auto_16300 ) ( not ( = ?auto_16300 ?auto_16310 ) ) ( not ( = ?auto_16301 ?auto_16310 ) ) ( not ( = ?auto_16299 ?auto_16310 ) ) ( not ( = ?auto_16304 ?auto_16310 ) ) ( TRUCK-AT ?auto_16305 ?auto_16302 ) ( SURFACE-AT ?auto_16298 ?auto_16302 ) ( CLEAR ?auto_16298 ) ( IS-CRATE ?auto_16299 ) ( not ( = ?auto_16298 ?auto_16299 ) ) ( not ( = ?auto_16300 ?auto_16298 ) ) ( not ( = ?auto_16301 ?auto_16298 ) ) ( not ( = ?auto_16304 ?auto_16298 ) ) ( not ( = ?auto_16310 ?auto_16298 ) ) ( AVAILABLE ?auto_16308 ) ( IN ?auto_16299 ?auto_16305 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16299 ?auto_16300 ?auto_16301 )
      ( MAKE-3CRATE-VERIFY ?auto_16298 ?auto_16299 ?auto_16300 ?auto_16301 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16311 - SURFACE
      ?auto_16312 - SURFACE
    )
    :vars
    (
      ?auto_16321 - HOIST
      ?auto_16313 - PLACE
      ?auto_16319 - SURFACE
      ?auto_16322 - PLACE
      ?auto_16318 - HOIST
      ?auto_16316 - SURFACE
      ?auto_16315 - PLACE
      ?auto_16320 - HOIST
      ?auto_16323 - SURFACE
      ?auto_16314 - SURFACE
      ?auto_16317 - TRUCK
      ?auto_16324 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16321 ?auto_16313 ) ( IS-CRATE ?auto_16312 ) ( not ( = ?auto_16311 ?auto_16312 ) ) ( not ( = ?auto_16319 ?auto_16311 ) ) ( not ( = ?auto_16319 ?auto_16312 ) ) ( not ( = ?auto_16322 ?auto_16313 ) ) ( HOIST-AT ?auto_16318 ?auto_16322 ) ( not ( = ?auto_16321 ?auto_16318 ) ) ( AVAILABLE ?auto_16318 ) ( SURFACE-AT ?auto_16312 ?auto_16322 ) ( ON ?auto_16312 ?auto_16316 ) ( CLEAR ?auto_16312 ) ( not ( = ?auto_16311 ?auto_16316 ) ) ( not ( = ?auto_16312 ?auto_16316 ) ) ( not ( = ?auto_16319 ?auto_16316 ) ) ( IS-CRATE ?auto_16311 ) ( not ( = ?auto_16315 ?auto_16313 ) ) ( not ( = ?auto_16322 ?auto_16315 ) ) ( HOIST-AT ?auto_16320 ?auto_16315 ) ( not ( = ?auto_16321 ?auto_16320 ) ) ( not ( = ?auto_16318 ?auto_16320 ) ) ( AVAILABLE ?auto_16320 ) ( SURFACE-AT ?auto_16311 ?auto_16315 ) ( ON ?auto_16311 ?auto_16323 ) ( CLEAR ?auto_16311 ) ( not ( = ?auto_16311 ?auto_16323 ) ) ( not ( = ?auto_16312 ?auto_16323 ) ) ( not ( = ?auto_16319 ?auto_16323 ) ) ( not ( = ?auto_16316 ?auto_16323 ) ) ( SURFACE-AT ?auto_16314 ?auto_16313 ) ( CLEAR ?auto_16314 ) ( IS-CRATE ?auto_16319 ) ( not ( = ?auto_16314 ?auto_16319 ) ) ( not ( = ?auto_16311 ?auto_16314 ) ) ( not ( = ?auto_16312 ?auto_16314 ) ) ( not ( = ?auto_16316 ?auto_16314 ) ) ( not ( = ?auto_16323 ?auto_16314 ) ) ( AVAILABLE ?auto_16321 ) ( IN ?auto_16319 ?auto_16317 ) ( TRUCK-AT ?auto_16317 ?auto_16324 ) ( not ( = ?auto_16324 ?auto_16313 ) ) ( not ( = ?auto_16322 ?auto_16324 ) ) ( not ( = ?auto_16315 ?auto_16324 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16317 ?auto_16324 ?auto_16313 )
      ( MAKE-2CRATE ?auto_16319 ?auto_16311 ?auto_16312 )
      ( MAKE-1CRATE-VERIFY ?auto_16311 ?auto_16312 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16325 - SURFACE
      ?auto_16326 - SURFACE
      ?auto_16327 - SURFACE
    )
    :vars
    (
      ?auto_16335 - HOIST
      ?auto_16334 - PLACE
      ?auto_16330 - PLACE
      ?auto_16328 - HOIST
      ?auto_16336 - SURFACE
      ?auto_16332 - PLACE
      ?auto_16337 - HOIST
      ?auto_16331 - SURFACE
      ?auto_16329 - SURFACE
      ?auto_16338 - TRUCK
      ?auto_16333 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16335 ?auto_16334 ) ( IS-CRATE ?auto_16327 ) ( not ( = ?auto_16326 ?auto_16327 ) ) ( not ( = ?auto_16325 ?auto_16326 ) ) ( not ( = ?auto_16325 ?auto_16327 ) ) ( not ( = ?auto_16330 ?auto_16334 ) ) ( HOIST-AT ?auto_16328 ?auto_16330 ) ( not ( = ?auto_16335 ?auto_16328 ) ) ( AVAILABLE ?auto_16328 ) ( SURFACE-AT ?auto_16327 ?auto_16330 ) ( ON ?auto_16327 ?auto_16336 ) ( CLEAR ?auto_16327 ) ( not ( = ?auto_16326 ?auto_16336 ) ) ( not ( = ?auto_16327 ?auto_16336 ) ) ( not ( = ?auto_16325 ?auto_16336 ) ) ( IS-CRATE ?auto_16326 ) ( not ( = ?auto_16332 ?auto_16334 ) ) ( not ( = ?auto_16330 ?auto_16332 ) ) ( HOIST-AT ?auto_16337 ?auto_16332 ) ( not ( = ?auto_16335 ?auto_16337 ) ) ( not ( = ?auto_16328 ?auto_16337 ) ) ( AVAILABLE ?auto_16337 ) ( SURFACE-AT ?auto_16326 ?auto_16332 ) ( ON ?auto_16326 ?auto_16331 ) ( CLEAR ?auto_16326 ) ( not ( = ?auto_16326 ?auto_16331 ) ) ( not ( = ?auto_16327 ?auto_16331 ) ) ( not ( = ?auto_16325 ?auto_16331 ) ) ( not ( = ?auto_16336 ?auto_16331 ) ) ( SURFACE-AT ?auto_16329 ?auto_16334 ) ( CLEAR ?auto_16329 ) ( IS-CRATE ?auto_16325 ) ( not ( = ?auto_16329 ?auto_16325 ) ) ( not ( = ?auto_16326 ?auto_16329 ) ) ( not ( = ?auto_16327 ?auto_16329 ) ) ( not ( = ?auto_16336 ?auto_16329 ) ) ( not ( = ?auto_16331 ?auto_16329 ) ) ( AVAILABLE ?auto_16335 ) ( IN ?auto_16325 ?auto_16338 ) ( TRUCK-AT ?auto_16338 ?auto_16333 ) ( not ( = ?auto_16333 ?auto_16334 ) ) ( not ( = ?auto_16330 ?auto_16333 ) ) ( not ( = ?auto_16332 ?auto_16333 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16326 ?auto_16327 )
      ( MAKE-2CRATE-VERIFY ?auto_16325 ?auto_16326 ?auto_16327 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16339 - SURFACE
      ?auto_16340 - SURFACE
      ?auto_16341 - SURFACE
      ?auto_16342 - SURFACE
    )
    :vars
    (
      ?auto_16344 - HOIST
      ?auto_16343 - PLACE
      ?auto_16347 - PLACE
      ?auto_16352 - HOIST
      ?auto_16346 - SURFACE
      ?auto_16345 - PLACE
      ?auto_16350 - HOIST
      ?auto_16349 - SURFACE
      ?auto_16351 - TRUCK
      ?auto_16348 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16344 ?auto_16343 ) ( IS-CRATE ?auto_16342 ) ( not ( = ?auto_16341 ?auto_16342 ) ) ( not ( = ?auto_16340 ?auto_16341 ) ) ( not ( = ?auto_16340 ?auto_16342 ) ) ( not ( = ?auto_16347 ?auto_16343 ) ) ( HOIST-AT ?auto_16352 ?auto_16347 ) ( not ( = ?auto_16344 ?auto_16352 ) ) ( AVAILABLE ?auto_16352 ) ( SURFACE-AT ?auto_16342 ?auto_16347 ) ( ON ?auto_16342 ?auto_16346 ) ( CLEAR ?auto_16342 ) ( not ( = ?auto_16341 ?auto_16346 ) ) ( not ( = ?auto_16342 ?auto_16346 ) ) ( not ( = ?auto_16340 ?auto_16346 ) ) ( IS-CRATE ?auto_16341 ) ( not ( = ?auto_16345 ?auto_16343 ) ) ( not ( = ?auto_16347 ?auto_16345 ) ) ( HOIST-AT ?auto_16350 ?auto_16345 ) ( not ( = ?auto_16344 ?auto_16350 ) ) ( not ( = ?auto_16352 ?auto_16350 ) ) ( AVAILABLE ?auto_16350 ) ( SURFACE-AT ?auto_16341 ?auto_16345 ) ( ON ?auto_16341 ?auto_16349 ) ( CLEAR ?auto_16341 ) ( not ( = ?auto_16341 ?auto_16349 ) ) ( not ( = ?auto_16342 ?auto_16349 ) ) ( not ( = ?auto_16340 ?auto_16349 ) ) ( not ( = ?auto_16346 ?auto_16349 ) ) ( SURFACE-AT ?auto_16339 ?auto_16343 ) ( CLEAR ?auto_16339 ) ( IS-CRATE ?auto_16340 ) ( not ( = ?auto_16339 ?auto_16340 ) ) ( not ( = ?auto_16341 ?auto_16339 ) ) ( not ( = ?auto_16342 ?auto_16339 ) ) ( not ( = ?auto_16346 ?auto_16339 ) ) ( not ( = ?auto_16349 ?auto_16339 ) ) ( AVAILABLE ?auto_16344 ) ( IN ?auto_16340 ?auto_16351 ) ( TRUCK-AT ?auto_16351 ?auto_16348 ) ( not ( = ?auto_16348 ?auto_16343 ) ) ( not ( = ?auto_16347 ?auto_16348 ) ) ( not ( = ?auto_16345 ?auto_16348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16340 ?auto_16341 ?auto_16342 )
      ( MAKE-3CRATE-VERIFY ?auto_16339 ?auto_16340 ?auto_16341 ?auto_16342 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16353 - SURFACE
      ?auto_16354 - SURFACE
    )
    :vars
    (
      ?auto_16356 - HOIST
      ?auto_16355 - PLACE
      ?auto_16366 - SURFACE
      ?auto_16359 - PLACE
      ?auto_16364 - HOIST
      ?auto_16358 - SURFACE
      ?auto_16357 - PLACE
      ?auto_16362 - HOIST
      ?auto_16361 - SURFACE
      ?auto_16365 - SURFACE
      ?auto_16363 - TRUCK
      ?auto_16360 - PLACE
      ?auto_16367 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16356 ?auto_16355 ) ( IS-CRATE ?auto_16354 ) ( not ( = ?auto_16353 ?auto_16354 ) ) ( not ( = ?auto_16366 ?auto_16353 ) ) ( not ( = ?auto_16366 ?auto_16354 ) ) ( not ( = ?auto_16359 ?auto_16355 ) ) ( HOIST-AT ?auto_16364 ?auto_16359 ) ( not ( = ?auto_16356 ?auto_16364 ) ) ( AVAILABLE ?auto_16364 ) ( SURFACE-AT ?auto_16354 ?auto_16359 ) ( ON ?auto_16354 ?auto_16358 ) ( CLEAR ?auto_16354 ) ( not ( = ?auto_16353 ?auto_16358 ) ) ( not ( = ?auto_16354 ?auto_16358 ) ) ( not ( = ?auto_16366 ?auto_16358 ) ) ( IS-CRATE ?auto_16353 ) ( not ( = ?auto_16357 ?auto_16355 ) ) ( not ( = ?auto_16359 ?auto_16357 ) ) ( HOIST-AT ?auto_16362 ?auto_16357 ) ( not ( = ?auto_16356 ?auto_16362 ) ) ( not ( = ?auto_16364 ?auto_16362 ) ) ( AVAILABLE ?auto_16362 ) ( SURFACE-AT ?auto_16353 ?auto_16357 ) ( ON ?auto_16353 ?auto_16361 ) ( CLEAR ?auto_16353 ) ( not ( = ?auto_16353 ?auto_16361 ) ) ( not ( = ?auto_16354 ?auto_16361 ) ) ( not ( = ?auto_16366 ?auto_16361 ) ) ( not ( = ?auto_16358 ?auto_16361 ) ) ( SURFACE-AT ?auto_16365 ?auto_16355 ) ( CLEAR ?auto_16365 ) ( IS-CRATE ?auto_16366 ) ( not ( = ?auto_16365 ?auto_16366 ) ) ( not ( = ?auto_16353 ?auto_16365 ) ) ( not ( = ?auto_16354 ?auto_16365 ) ) ( not ( = ?auto_16358 ?auto_16365 ) ) ( not ( = ?auto_16361 ?auto_16365 ) ) ( AVAILABLE ?auto_16356 ) ( TRUCK-AT ?auto_16363 ?auto_16360 ) ( not ( = ?auto_16360 ?auto_16355 ) ) ( not ( = ?auto_16359 ?auto_16360 ) ) ( not ( = ?auto_16357 ?auto_16360 ) ) ( HOIST-AT ?auto_16367 ?auto_16360 ) ( LIFTING ?auto_16367 ?auto_16366 ) ( not ( = ?auto_16356 ?auto_16367 ) ) ( not ( = ?auto_16364 ?auto_16367 ) ) ( not ( = ?auto_16362 ?auto_16367 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16367 ?auto_16366 ?auto_16363 ?auto_16360 )
      ( MAKE-2CRATE ?auto_16366 ?auto_16353 ?auto_16354 )
      ( MAKE-1CRATE-VERIFY ?auto_16353 ?auto_16354 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16368 - SURFACE
      ?auto_16369 - SURFACE
      ?auto_16370 - SURFACE
    )
    :vars
    (
      ?auto_16373 - HOIST
      ?auto_16380 - PLACE
      ?auto_16375 - PLACE
      ?auto_16378 - HOIST
      ?auto_16381 - SURFACE
      ?auto_16382 - PLACE
      ?auto_16372 - HOIST
      ?auto_16377 - SURFACE
      ?auto_16379 - SURFACE
      ?auto_16371 - TRUCK
      ?auto_16376 - PLACE
      ?auto_16374 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16373 ?auto_16380 ) ( IS-CRATE ?auto_16370 ) ( not ( = ?auto_16369 ?auto_16370 ) ) ( not ( = ?auto_16368 ?auto_16369 ) ) ( not ( = ?auto_16368 ?auto_16370 ) ) ( not ( = ?auto_16375 ?auto_16380 ) ) ( HOIST-AT ?auto_16378 ?auto_16375 ) ( not ( = ?auto_16373 ?auto_16378 ) ) ( AVAILABLE ?auto_16378 ) ( SURFACE-AT ?auto_16370 ?auto_16375 ) ( ON ?auto_16370 ?auto_16381 ) ( CLEAR ?auto_16370 ) ( not ( = ?auto_16369 ?auto_16381 ) ) ( not ( = ?auto_16370 ?auto_16381 ) ) ( not ( = ?auto_16368 ?auto_16381 ) ) ( IS-CRATE ?auto_16369 ) ( not ( = ?auto_16382 ?auto_16380 ) ) ( not ( = ?auto_16375 ?auto_16382 ) ) ( HOIST-AT ?auto_16372 ?auto_16382 ) ( not ( = ?auto_16373 ?auto_16372 ) ) ( not ( = ?auto_16378 ?auto_16372 ) ) ( AVAILABLE ?auto_16372 ) ( SURFACE-AT ?auto_16369 ?auto_16382 ) ( ON ?auto_16369 ?auto_16377 ) ( CLEAR ?auto_16369 ) ( not ( = ?auto_16369 ?auto_16377 ) ) ( not ( = ?auto_16370 ?auto_16377 ) ) ( not ( = ?auto_16368 ?auto_16377 ) ) ( not ( = ?auto_16381 ?auto_16377 ) ) ( SURFACE-AT ?auto_16379 ?auto_16380 ) ( CLEAR ?auto_16379 ) ( IS-CRATE ?auto_16368 ) ( not ( = ?auto_16379 ?auto_16368 ) ) ( not ( = ?auto_16369 ?auto_16379 ) ) ( not ( = ?auto_16370 ?auto_16379 ) ) ( not ( = ?auto_16381 ?auto_16379 ) ) ( not ( = ?auto_16377 ?auto_16379 ) ) ( AVAILABLE ?auto_16373 ) ( TRUCK-AT ?auto_16371 ?auto_16376 ) ( not ( = ?auto_16376 ?auto_16380 ) ) ( not ( = ?auto_16375 ?auto_16376 ) ) ( not ( = ?auto_16382 ?auto_16376 ) ) ( HOIST-AT ?auto_16374 ?auto_16376 ) ( LIFTING ?auto_16374 ?auto_16368 ) ( not ( = ?auto_16373 ?auto_16374 ) ) ( not ( = ?auto_16378 ?auto_16374 ) ) ( not ( = ?auto_16372 ?auto_16374 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16369 ?auto_16370 )
      ( MAKE-2CRATE-VERIFY ?auto_16368 ?auto_16369 ?auto_16370 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16383 - SURFACE
      ?auto_16384 - SURFACE
      ?auto_16385 - SURFACE
      ?auto_16386 - SURFACE
    )
    :vars
    (
      ?auto_16391 - HOIST
      ?auto_16393 - PLACE
      ?auto_16388 - PLACE
      ?auto_16389 - HOIST
      ?auto_16394 - SURFACE
      ?auto_16387 - PLACE
      ?auto_16397 - HOIST
      ?auto_16392 - SURFACE
      ?auto_16396 - TRUCK
      ?auto_16395 - PLACE
      ?auto_16390 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16391 ?auto_16393 ) ( IS-CRATE ?auto_16386 ) ( not ( = ?auto_16385 ?auto_16386 ) ) ( not ( = ?auto_16384 ?auto_16385 ) ) ( not ( = ?auto_16384 ?auto_16386 ) ) ( not ( = ?auto_16388 ?auto_16393 ) ) ( HOIST-AT ?auto_16389 ?auto_16388 ) ( not ( = ?auto_16391 ?auto_16389 ) ) ( AVAILABLE ?auto_16389 ) ( SURFACE-AT ?auto_16386 ?auto_16388 ) ( ON ?auto_16386 ?auto_16394 ) ( CLEAR ?auto_16386 ) ( not ( = ?auto_16385 ?auto_16394 ) ) ( not ( = ?auto_16386 ?auto_16394 ) ) ( not ( = ?auto_16384 ?auto_16394 ) ) ( IS-CRATE ?auto_16385 ) ( not ( = ?auto_16387 ?auto_16393 ) ) ( not ( = ?auto_16388 ?auto_16387 ) ) ( HOIST-AT ?auto_16397 ?auto_16387 ) ( not ( = ?auto_16391 ?auto_16397 ) ) ( not ( = ?auto_16389 ?auto_16397 ) ) ( AVAILABLE ?auto_16397 ) ( SURFACE-AT ?auto_16385 ?auto_16387 ) ( ON ?auto_16385 ?auto_16392 ) ( CLEAR ?auto_16385 ) ( not ( = ?auto_16385 ?auto_16392 ) ) ( not ( = ?auto_16386 ?auto_16392 ) ) ( not ( = ?auto_16384 ?auto_16392 ) ) ( not ( = ?auto_16394 ?auto_16392 ) ) ( SURFACE-AT ?auto_16383 ?auto_16393 ) ( CLEAR ?auto_16383 ) ( IS-CRATE ?auto_16384 ) ( not ( = ?auto_16383 ?auto_16384 ) ) ( not ( = ?auto_16385 ?auto_16383 ) ) ( not ( = ?auto_16386 ?auto_16383 ) ) ( not ( = ?auto_16394 ?auto_16383 ) ) ( not ( = ?auto_16392 ?auto_16383 ) ) ( AVAILABLE ?auto_16391 ) ( TRUCK-AT ?auto_16396 ?auto_16395 ) ( not ( = ?auto_16395 ?auto_16393 ) ) ( not ( = ?auto_16388 ?auto_16395 ) ) ( not ( = ?auto_16387 ?auto_16395 ) ) ( HOIST-AT ?auto_16390 ?auto_16395 ) ( LIFTING ?auto_16390 ?auto_16384 ) ( not ( = ?auto_16391 ?auto_16390 ) ) ( not ( = ?auto_16389 ?auto_16390 ) ) ( not ( = ?auto_16397 ?auto_16390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16384 ?auto_16385 ?auto_16386 )
      ( MAKE-3CRATE-VERIFY ?auto_16383 ?auto_16384 ?auto_16385 ?auto_16386 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16398 - SURFACE
      ?auto_16399 - SURFACE
    )
    :vars
    (
      ?auto_16405 - HOIST
      ?auto_16407 - PLACE
      ?auto_16412 - SURFACE
      ?auto_16401 - PLACE
      ?auto_16403 - HOIST
      ?auto_16408 - SURFACE
      ?auto_16400 - PLACE
      ?auto_16411 - HOIST
      ?auto_16406 - SURFACE
      ?auto_16402 - SURFACE
      ?auto_16410 - TRUCK
      ?auto_16409 - PLACE
      ?auto_16404 - HOIST
      ?auto_16413 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16405 ?auto_16407 ) ( IS-CRATE ?auto_16399 ) ( not ( = ?auto_16398 ?auto_16399 ) ) ( not ( = ?auto_16412 ?auto_16398 ) ) ( not ( = ?auto_16412 ?auto_16399 ) ) ( not ( = ?auto_16401 ?auto_16407 ) ) ( HOIST-AT ?auto_16403 ?auto_16401 ) ( not ( = ?auto_16405 ?auto_16403 ) ) ( AVAILABLE ?auto_16403 ) ( SURFACE-AT ?auto_16399 ?auto_16401 ) ( ON ?auto_16399 ?auto_16408 ) ( CLEAR ?auto_16399 ) ( not ( = ?auto_16398 ?auto_16408 ) ) ( not ( = ?auto_16399 ?auto_16408 ) ) ( not ( = ?auto_16412 ?auto_16408 ) ) ( IS-CRATE ?auto_16398 ) ( not ( = ?auto_16400 ?auto_16407 ) ) ( not ( = ?auto_16401 ?auto_16400 ) ) ( HOIST-AT ?auto_16411 ?auto_16400 ) ( not ( = ?auto_16405 ?auto_16411 ) ) ( not ( = ?auto_16403 ?auto_16411 ) ) ( AVAILABLE ?auto_16411 ) ( SURFACE-AT ?auto_16398 ?auto_16400 ) ( ON ?auto_16398 ?auto_16406 ) ( CLEAR ?auto_16398 ) ( not ( = ?auto_16398 ?auto_16406 ) ) ( not ( = ?auto_16399 ?auto_16406 ) ) ( not ( = ?auto_16412 ?auto_16406 ) ) ( not ( = ?auto_16408 ?auto_16406 ) ) ( SURFACE-AT ?auto_16402 ?auto_16407 ) ( CLEAR ?auto_16402 ) ( IS-CRATE ?auto_16412 ) ( not ( = ?auto_16402 ?auto_16412 ) ) ( not ( = ?auto_16398 ?auto_16402 ) ) ( not ( = ?auto_16399 ?auto_16402 ) ) ( not ( = ?auto_16408 ?auto_16402 ) ) ( not ( = ?auto_16406 ?auto_16402 ) ) ( AVAILABLE ?auto_16405 ) ( TRUCK-AT ?auto_16410 ?auto_16409 ) ( not ( = ?auto_16409 ?auto_16407 ) ) ( not ( = ?auto_16401 ?auto_16409 ) ) ( not ( = ?auto_16400 ?auto_16409 ) ) ( HOIST-AT ?auto_16404 ?auto_16409 ) ( not ( = ?auto_16405 ?auto_16404 ) ) ( not ( = ?auto_16403 ?auto_16404 ) ) ( not ( = ?auto_16411 ?auto_16404 ) ) ( AVAILABLE ?auto_16404 ) ( SURFACE-AT ?auto_16412 ?auto_16409 ) ( ON ?auto_16412 ?auto_16413 ) ( CLEAR ?auto_16412 ) ( not ( = ?auto_16398 ?auto_16413 ) ) ( not ( = ?auto_16399 ?auto_16413 ) ) ( not ( = ?auto_16412 ?auto_16413 ) ) ( not ( = ?auto_16408 ?auto_16413 ) ) ( not ( = ?auto_16406 ?auto_16413 ) ) ( not ( = ?auto_16402 ?auto_16413 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16404 ?auto_16412 ?auto_16413 ?auto_16409 )
      ( MAKE-2CRATE ?auto_16412 ?auto_16398 ?auto_16399 )
      ( MAKE-1CRATE-VERIFY ?auto_16398 ?auto_16399 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16414 - SURFACE
      ?auto_16415 - SURFACE
      ?auto_16416 - SURFACE
    )
    :vars
    (
      ?auto_16428 - HOIST
      ?auto_16419 - PLACE
      ?auto_16423 - PLACE
      ?auto_16417 - HOIST
      ?auto_16426 - SURFACE
      ?auto_16427 - PLACE
      ?auto_16422 - HOIST
      ?auto_16424 - SURFACE
      ?auto_16420 - SURFACE
      ?auto_16425 - TRUCK
      ?auto_16429 - PLACE
      ?auto_16421 - HOIST
      ?auto_16418 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16428 ?auto_16419 ) ( IS-CRATE ?auto_16416 ) ( not ( = ?auto_16415 ?auto_16416 ) ) ( not ( = ?auto_16414 ?auto_16415 ) ) ( not ( = ?auto_16414 ?auto_16416 ) ) ( not ( = ?auto_16423 ?auto_16419 ) ) ( HOIST-AT ?auto_16417 ?auto_16423 ) ( not ( = ?auto_16428 ?auto_16417 ) ) ( AVAILABLE ?auto_16417 ) ( SURFACE-AT ?auto_16416 ?auto_16423 ) ( ON ?auto_16416 ?auto_16426 ) ( CLEAR ?auto_16416 ) ( not ( = ?auto_16415 ?auto_16426 ) ) ( not ( = ?auto_16416 ?auto_16426 ) ) ( not ( = ?auto_16414 ?auto_16426 ) ) ( IS-CRATE ?auto_16415 ) ( not ( = ?auto_16427 ?auto_16419 ) ) ( not ( = ?auto_16423 ?auto_16427 ) ) ( HOIST-AT ?auto_16422 ?auto_16427 ) ( not ( = ?auto_16428 ?auto_16422 ) ) ( not ( = ?auto_16417 ?auto_16422 ) ) ( AVAILABLE ?auto_16422 ) ( SURFACE-AT ?auto_16415 ?auto_16427 ) ( ON ?auto_16415 ?auto_16424 ) ( CLEAR ?auto_16415 ) ( not ( = ?auto_16415 ?auto_16424 ) ) ( not ( = ?auto_16416 ?auto_16424 ) ) ( not ( = ?auto_16414 ?auto_16424 ) ) ( not ( = ?auto_16426 ?auto_16424 ) ) ( SURFACE-AT ?auto_16420 ?auto_16419 ) ( CLEAR ?auto_16420 ) ( IS-CRATE ?auto_16414 ) ( not ( = ?auto_16420 ?auto_16414 ) ) ( not ( = ?auto_16415 ?auto_16420 ) ) ( not ( = ?auto_16416 ?auto_16420 ) ) ( not ( = ?auto_16426 ?auto_16420 ) ) ( not ( = ?auto_16424 ?auto_16420 ) ) ( AVAILABLE ?auto_16428 ) ( TRUCK-AT ?auto_16425 ?auto_16429 ) ( not ( = ?auto_16429 ?auto_16419 ) ) ( not ( = ?auto_16423 ?auto_16429 ) ) ( not ( = ?auto_16427 ?auto_16429 ) ) ( HOIST-AT ?auto_16421 ?auto_16429 ) ( not ( = ?auto_16428 ?auto_16421 ) ) ( not ( = ?auto_16417 ?auto_16421 ) ) ( not ( = ?auto_16422 ?auto_16421 ) ) ( AVAILABLE ?auto_16421 ) ( SURFACE-AT ?auto_16414 ?auto_16429 ) ( ON ?auto_16414 ?auto_16418 ) ( CLEAR ?auto_16414 ) ( not ( = ?auto_16415 ?auto_16418 ) ) ( not ( = ?auto_16416 ?auto_16418 ) ) ( not ( = ?auto_16414 ?auto_16418 ) ) ( not ( = ?auto_16426 ?auto_16418 ) ) ( not ( = ?auto_16424 ?auto_16418 ) ) ( not ( = ?auto_16420 ?auto_16418 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16415 ?auto_16416 )
      ( MAKE-2CRATE-VERIFY ?auto_16414 ?auto_16415 ?auto_16416 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16430 - SURFACE
      ?auto_16431 - SURFACE
      ?auto_16432 - SURFACE
      ?auto_16433 - SURFACE
    )
    :vars
    (
      ?auto_16445 - HOIST
      ?auto_16440 - PLACE
      ?auto_16438 - PLACE
      ?auto_16442 - HOIST
      ?auto_16435 - SURFACE
      ?auto_16434 - PLACE
      ?auto_16437 - HOIST
      ?auto_16443 - SURFACE
      ?auto_16439 - TRUCK
      ?auto_16444 - PLACE
      ?auto_16436 - HOIST
      ?auto_16441 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16445 ?auto_16440 ) ( IS-CRATE ?auto_16433 ) ( not ( = ?auto_16432 ?auto_16433 ) ) ( not ( = ?auto_16431 ?auto_16432 ) ) ( not ( = ?auto_16431 ?auto_16433 ) ) ( not ( = ?auto_16438 ?auto_16440 ) ) ( HOIST-AT ?auto_16442 ?auto_16438 ) ( not ( = ?auto_16445 ?auto_16442 ) ) ( AVAILABLE ?auto_16442 ) ( SURFACE-AT ?auto_16433 ?auto_16438 ) ( ON ?auto_16433 ?auto_16435 ) ( CLEAR ?auto_16433 ) ( not ( = ?auto_16432 ?auto_16435 ) ) ( not ( = ?auto_16433 ?auto_16435 ) ) ( not ( = ?auto_16431 ?auto_16435 ) ) ( IS-CRATE ?auto_16432 ) ( not ( = ?auto_16434 ?auto_16440 ) ) ( not ( = ?auto_16438 ?auto_16434 ) ) ( HOIST-AT ?auto_16437 ?auto_16434 ) ( not ( = ?auto_16445 ?auto_16437 ) ) ( not ( = ?auto_16442 ?auto_16437 ) ) ( AVAILABLE ?auto_16437 ) ( SURFACE-AT ?auto_16432 ?auto_16434 ) ( ON ?auto_16432 ?auto_16443 ) ( CLEAR ?auto_16432 ) ( not ( = ?auto_16432 ?auto_16443 ) ) ( not ( = ?auto_16433 ?auto_16443 ) ) ( not ( = ?auto_16431 ?auto_16443 ) ) ( not ( = ?auto_16435 ?auto_16443 ) ) ( SURFACE-AT ?auto_16430 ?auto_16440 ) ( CLEAR ?auto_16430 ) ( IS-CRATE ?auto_16431 ) ( not ( = ?auto_16430 ?auto_16431 ) ) ( not ( = ?auto_16432 ?auto_16430 ) ) ( not ( = ?auto_16433 ?auto_16430 ) ) ( not ( = ?auto_16435 ?auto_16430 ) ) ( not ( = ?auto_16443 ?auto_16430 ) ) ( AVAILABLE ?auto_16445 ) ( TRUCK-AT ?auto_16439 ?auto_16444 ) ( not ( = ?auto_16444 ?auto_16440 ) ) ( not ( = ?auto_16438 ?auto_16444 ) ) ( not ( = ?auto_16434 ?auto_16444 ) ) ( HOIST-AT ?auto_16436 ?auto_16444 ) ( not ( = ?auto_16445 ?auto_16436 ) ) ( not ( = ?auto_16442 ?auto_16436 ) ) ( not ( = ?auto_16437 ?auto_16436 ) ) ( AVAILABLE ?auto_16436 ) ( SURFACE-AT ?auto_16431 ?auto_16444 ) ( ON ?auto_16431 ?auto_16441 ) ( CLEAR ?auto_16431 ) ( not ( = ?auto_16432 ?auto_16441 ) ) ( not ( = ?auto_16433 ?auto_16441 ) ) ( not ( = ?auto_16431 ?auto_16441 ) ) ( not ( = ?auto_16435 ?auto_16441 ) ) ( not ( = ?auto_16443 ?auto_16441 ) ) ( not ( = ?auto_16430 ?auto_16441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16431 ?auto_16432 ?auto_16433 )
      ( MAKE-3CRATE-VERIFY ?auto_16430 ?auto_16431 ?auto_16432 ?auto_16433 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16446 - SURFACE
      ?auto_16447 - SURFACE
    )
    :vars
    (
      ?auto_16461 - HOIST
      ?auto_16454 - PLACE
      ?auto_16458 - SURFACE
      ?auto_16452 - PLACE
      ?auto_16456 - HOIST
      ?auto_16449 - SURFACE
      ?auto_16448 - PLACE
      ?auto_16451 - HOIST
      ?auto_16459 - SURFACE
      ?auto_16457 - SURFACE
      ?auto_16460 - PLACE
      ?auto_16450 - HOIST
      ?auto_16455 - SURFACE
      ?auto_16453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16461 ?auto_16454 ) ( IS-CRATE ?auto_16447 ) ( not ( = ?auto_16446 ?auto_16447 ) ) ( not ( = ?auto_16458 ?auto_16446 ) ) ( not ( = ?auto_16458 ?auto_16447 ) ) ( not ( = ?auto_16452 ?auto_16454 ) ) ( HOIST-AT ?auto_16456 ?auto_16452 ) ( not ( = ?auto_16461 ?auto_16456 ) ) ( AVAILABLE ?auto_16456 ) ( SURFACE-AT ?auto_16447 ?auto_16452 ) ( ON ?auto_16447 ?auto_16449 ) ( CLEAR ?auto_16447 ) ( not ( = ?auto_16446 ?auto_16449 ) ) ( not ( = ?auto_16447 ?auto_16449 ) ) ( not ( = ?auto_16458 ?auto_16449 ) ) ( IS-CRATE ?auto_16446 ) ( not ( = ?auto_16448 ?auto_16454 ) ) ( not ( = ?auto_16452 ?auto_16448 ) ) ( HOIST-AT ?auto_16451 ?auto_16448 ) ( not ( = ?auto_16461 ?auto_16451 ) ) ( not ( = ?auto_16456 ?auto_16451 ) ) ( AVAILABLE ?auto_16451 ) ( SURFACE-AT ?auto_16446 ?auto_16448 ) ( ON ?auto_16446 ?auto_16459 ) ( CLEAR ?auto_16446 ) ( not ( = ?auto_16446 ?auto_16459 ) ) ( not ( = ?auto_16447 ?auto_16459 ) ) ( not ( = ?auto_16458 ?auto_16459 ) ) ( not ( = ?auto_16449 ?auto_16459 ) ) ( SURFACE-AT ?auto_16457 ?auto_16454 ) ( CLEAR ?auto_16457 ) ( IS-CRATE ?auto_16458 ) ( not ( = ?auto_16457 ?auto_16458 ) ) ( not ( = ?auto_16446 ?auto_16457 ) ) ( not ( = ?auto_16447 ?auto_16457 ) ) ( not ( = ?auto_16449 ?auto_16457 ) ) ( not ( = ?auto_16459 ?auto_16457 ) ) ( AVAILABLE ?auto_16461 ) ( not ( = ?auto_16460 ?auto_16454 ) ) ( not ( = ?auto_16452 ?auto_16460 ) ) ( not ( = ?auto_16448 ?auto_16460 ) ) ( HOIST-AT ?auto_16450 ?auto_16460 ) ( not ( = ?auto_16461 ?auto_16450 ) ) ( not ( = ?auto_16456 ?auto_16450 ) ) ( not ( = ?auto_16451 ?auto_16450 ) ) ( AVAILABLE ?auto_16450 ) ( SURFACE-AT ?auto_16458 ?auto_16460 ) ( ON ?auto_16458 ?auto_16455 ) ( CLEAR ?auto_16458 ) ( not ( = ?auto_16446 ?auto_16455 ) ) ( not ( = ?auto_16447 ?auto_16455 ) ) ( not ( = ?auto_16458 ?auto_16455 ) ) ( not ( = ?auto_16449 ?auto_16455 ) ) ( not ( = ?auto_16459 ?auto_16455 ) ) ( not ( = ?auto_16457 ?auto_16455 ) ) ( TRUCK-AT ?auto_16453 ?auto_16454 ) )
    :subtasks
    ( ( !DRIVE ?auto_16453 ?auto_16454 ?auto_16460 )
      ( MAKE-2CRATE ?auto_16458 ?auto_16446 ?auto_16447 )
      ( MAKE-1CRATE-VERIFY ?auto_16446 ?auto_16447 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16462 - SURFACE
      ?auto_16463 - SURFACE
      ?auto_16464 - SURFACE
    )
    :vars
    (
      ?auto_16473 - HOIST
      ?auto_16468 - PLACE
      ?auto_16474 - PLACE
      ?auto_16477 - HOIST
      ?auto_16466 - SURFACE
      ?auto_16476 - PLACE
      ?auto_16467 - HOIST
      ?auto_16470 - SURFACE
      ?auto_16471 - SURFACE
      ?auto_16472 - PLACE
      ?auto_16465 - HOIST
      ?auto_16469 - SURFACE
      ?auto_16475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16473 ?auto_16468 ) ( IS-CRATE ?auto_16464 ) ( not ( = ?auto_16463 ?auto_16464 ) ) ( not ( = ?auto_16462 ?auto_16463 ) ) ( not ( = ?auto_16462 ?auto_16464 ) ) ( not ( = ?auto_16474 ?auto_16468 ) ) ( HOIST-AT ?auto_16477 ?auto_16474 ) ( not ( = ?auto_16473 ?auto_16477 ) ) ( AVAILABLE ?auto_16477 ) ( SURFACE-AT ?auto_16464 ?auto_16474 ) ( ON ?auto_16464 ?auto_16466 ) ( CLEAR ?auto_16464 ) ( not ( = ?auto_16463 ?auto_16466 ) ) ( not ( = ?auto_16464 ?auto_16466 ) ) ( not ( = ?auto_16462 ?auto_16466 ) ) ( IS-CRATE ?auto_16463 ) ( not ( = ?auto_16476 ?auto_16468 ) ) ( not ( = ?auto_16474 ?auto_16476 ) ) ( HOIST-AT ?auto_16467 ?auto_16476 ) ( not ( = ?auto_16473 ?auto_16467 ) ) ( not ( = ?auto_16477 ?auto_16467 ) ) ( AVAILABLE ?auto_16467 ) ( SURFACE-AT ?auto_16463 ?auto_16476 ) ( ON ?auto_16463 ?auto_16470 ) ( CLEAR ?auto_16463 ) ( not ( = ?auto_16463 ?auto_16470 ) ) ( not ( = ?auto_16464 ?auto_16470 ) ) ( not ( = ?auto_16462 ?auto_16470 ) ) ( not ( = ?auto_16466 ?auto_16470 ) ) ( SURFACE-AT ?auto_16471 ?auto_16468 ) ( CLEAR ?auto_16471 ) ( IS-CRATE ?auto_16462 ) ( not ( = ?auto_16471 ?auto_16462 ) ) ( not ( = ?auto_16463 ?auto_16471 ) ) ( not ( = ?auto_16464 ?auto_16471 ) ) ( not ( = ?auto_16466 ?auto_16471 ) ) ( not ( = ?auto_16470 ?auto_16471 ) ) ( AVAILABLE ?auto_16473 ) ( not ( = ?auto_16472 ?auto_16468 ) ) ( not ( = ?auto_16474 ?auto_16472 ) ) ( not ( = ?auto_16476 ?auto_16472 ) ) ( HOIST-AT ?auto_16465 ?auto_16472 ) ( not ( = ?auto_16473 ?auto_16465 ) ) ( not ( = ?auto_16477 ?auto_16465 ) ) ( not ( = ?auto_16467 ?auto_16465 ) ) ( AVAILABLE ?auto_16465 ) ( SURFACE-AT ?auto_16462 ?auto_16472 ) ( ON ?auto_16462 ?auto_16469 ) ( CLEAR ?auto_16462 ) ( not ( = ?auto_16463 ?auto_16469 ) ) ( not ( = ?auto_16464 ?auto_16469 ) ) ( not ( = ?auto_16462 ?auto_16469 ) ) ( not ( = ?auto_16466 ?auto_16469 ) ) ( not ( = ?auto_16470 ?auto_16469 ) ) ( not ( = ?auto_16471 ?auto_16469 ) ) ( TRUCK-AT ?auto_16475 ?auto_16468 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16463 ?auto_16464 )
      ( MAKE-2CRATE-VERIFY ?auto_16462 ?auto_16463 ?auto_16464 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16478 - SURFACE
      ?auto_16479 - SURFACE
      ?auto_16480 - SURFACE
      ?auto_16481 - SURFACE
    )
    :vars
    (
      ?auto_16491 - HOIST
      ?auto_16484 - PLACE
      ?auto_16489 - PLACE
      ?auto_16482 - HOIST
      ?auto_16487 - SURFACE
      ?auto_16488 - PLACE
      ?auto_16483 - HOIST
      ?auto_16485 - SURFACE
      ?auto_16486 - PLACE
      ?auto_16493 - HOIST
      ?auto_16490 - SURFACE
      ?auto_16492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16491 ?auto_16484 ) ( IS-CRATE ?auto_16481 ) ( not ( = ?auto_16480 ?auto_16481 ) ) ( not ( = ?auto_16479 ?auto_16480 ) ) ( not ( = ?auto_16479 ?auto_16481 ) ) ( not ( = ?auto_16489 ?auto_16484 ) ) ( HOIST-AT ?auto_16482 ?auto_16489 ) ( not ( = ?auto_16491 ?auto_16482 ) ) ( AVAILABLE ?auto_16482 ) ( SURFACE-AT ?auto_16481 ?auto_16489 ) ( ON ?auto_16481 ?auto_16487 ) ( CLEAR ?auto_16481 ) ( not ( = ?auto_16480 ?auto_16487 ) ) ( not ( = ?auto_16481 ?auto_16487 ) ) ( not ( = ?auto_16479 ?auto_16487 ) ) ( IS-CRATE ?auto_16480 ) ( not ( = ?auto_16488 ?auto_16484 ) ) ( not ( = ?auto_16489 ?auto_16488 ) ) ( HOIST-AT ?auto_16483 ?auto_16488 ) ( not ( = ?auto_16491 ?auto_16483 ) ) ( not ( = ?auto_16482 ?auto_16483 ) ) ( AVAILABLE ?auto_16483 ) ( SURFACE-AT ?auto_16480 ?auto_16488 ) ( ON ?auto_16480 ?auto_16485 ) ( CLEAR ?auto_16480 ) ( not ( = ?auto_16480 ?auto_16485 ) ) ( not ( = ?auto_16481 ?auto_16485 ) ) ( not ( = ?auto_16479 ?auto_16485 ) ) ( not ( = ?auto_16487 ?auto_16485 ) ) ( SURFACE-AT ?auto_16478 ?auto_16484 ) ( CLEAR ?auto_16478 ) ( IS-CRATE ?auto_16479 ) ( not ( = ?auto_16478 ?auto_16479 ) ) ( not ( = ?auto_16480 ?auto_16478 ) ) ( not ( = ?auto_16481 ?auto_16478 ) ) ( not ( = ?auto_16487 ?auto_16478 ) ) ( not ( = ?auto_16485 ?auto_16478 ) ) ( AVAILABLE ?auto_16491 ) ( not ( = ?auto_16486 ?auto_16484 ) ) ( not ( = ?auto_16489 ?auto_16486 ) ) ( not ( = ?auto_16488 ?auto_16486 ) ) ( HOIST-AT ?auto_16493 ?auto_16486 ) ( not ( = ?auto_16491 ?auto_16493 ) ) ( not ( = ?auto_16482 ?auto_16493 ) ) ( not ( = ?auto_16483 ?auto_16493 ) ) ( AVAILABLE ?auto_16493 ) ( SURFACE-AT ?auto_16479 ?auto_16486 ) ( ON ?auto_16479 ?auto_16490 ) ( CLEAR ?auto_16479 ) ( not ( = ?auto_16480 ?auto_16490 ) ) ( not ( = ?auto_16481 ?auto_16490 ) ) ( not ( = ?auto_16479 ?auto_16490 ) ) ( not ( = ?auto_16487 ?auto_16490 ) ) ( not ( = ?auto_16485 ?auto_16490 ) ) ( not ( = ?auto_16478 ?auto_16490 ) ) ( TRUCK-AT ?auto_16492 ?auto_16484 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16479 ?auto_16480 ?auto_16481 )
      ( MAKE-3CRATE-VERIFY ?auto_16478 ?auto_16479 ?auto_16480 ?auto_16481 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16508 - SURFACE
      ?auto_16509 - SURFACE
    )
    :vars
    (
      ?auto_16510 - HOIST
      ?auto_16511 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16510 ?auto_16511 ) ( SURFACE-AT ?auto_16508 ?auto_16511 ) ( CLEAR ?auto_16508 ) ( LIFTING ?auto_16510 ?auto_16509 ) ( IS-CRATE ?auto_16509 ) ( not ( = ?auto_16508 ?auto_16509 ) ) )
    :subtasks
    ( ( !DROP ?auto_16510 ?auto_16509 ?auto_16508 ?auto_16511 )
      ( MAKE-1CRATE-VERIFY ?auto_16508 ?auto_16509 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16512 - SURFACE
      ?auto_16513 - SURFACE
      ?auto_16514 - SURFACE
    )
    :vars
    (
      ?auto_16516 - HOIST
      ?auto_16515 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16516 ?auto_16515 ) ( SURFACE-AT ?auto_16513 ?auto_16515 ) ( CLEAR ?auto_16513 ) ( LIFTING ?auto_16516 ?auto_16514 ) ( IS-CRATE ?auto_16514 ) ( not ( = ?auto_16513 ?auto_16514 ) ) ( ON ?auto_16513 ?auto_16512 ) ( not ( = ?auto_16512 ?auto_16513 ) ) ( not ( = ?auto_16512 ?auto_16514 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16513 ?auto_16514 )
      ( MAKE-2CRATE-VERIFY ?auto_16512 ?auto_16513 ?auto_16514 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16517 - SURFACE
      ?auto_16518 - SURFACE
      ?auto_16519 - SURFACE
      ?auto_16520 - SURFACE
    )
    :vars
    (
      ?auto_16522 - HOIST
      ?auto_16521 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16522 ?auto_16521 ) ( SURFACE-AT ?auto_16519 ?auto_16521 ) ( CLEAR ?auto_16519 ) ( LIFTING ?auto_16522 ?auto_16520 ) ( IS-CRATE ?auto_16520 ) ( not ( = ?auto_16519 ?auto_16520 ) ) ( ON ?auto_16518 ?auto_16517 ) ( ON ?auto_16519 ?auto_16518 ) ( not ( = ?auto_16517 ?auto_16518 ) ) ( not ( = ?auto_16517 ?auto_16519 ) ) ( not ( = ?auto_16517 ?auto_16520 ) ) ( not ( = ?auto_16518 ?auto_16519 ) ) ( not ( = ?auto_16518 ?auto_16520 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16519 ?auto_16520 )
      ( MAKE-3CRATE-VERIFY ?auto_16517 ?auto_16518 ?auto_16519 ?auto_16520 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16523 - SURFACE
      ?auto_16524 - SURFACE
      ?auto_16525 - SURFACE
      ?auto_16526 - SURFACE
      ?auto_16527 - SURFACE
    )
    :vars
    (
      ?auto_16529 - HOIST
      ?auto_16528 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16529 ?auto_16528 ) ( SURFACE-AT ?auto_16526 ?auto_16528 ) ( CLEAR ?auto_16526 ) ( LIFTING ?auto_16529 ?auto_16527 ) ( IS-CRATE ?auto_16527 ) ( not ( = ?auto_16526 ?auto_16527 ) ) ( ON ?auto_16524 ?auto_16523 ) ( ON ?auto_16525 ?auto_16524 ) ( ON ?auto_16526 ?auto_16525 ) ( not ( = ?auto_16523 ?auto_16524 ) ) ( not ( = ?auto_16523 ?auto_16525 ) ) ( not ( = ?auto_16523 ?auto_16526 ) ) ( not ( = ?auto_16523 ?auto_16527 ) ) ( not ( = ?auto_16524 ?auto_16525 ) ) ( not ( = ?auto_16524 ?auto_16526 ) ) ( not ( = ?auto_16524 ?auto_16527 ) ) ( not ( = ?auto_16525 ?auto_16526 ) ) ( not ( = ?auto_16525 ?auto_16527 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16526 ?auto_16527 )
      ( MAKE-4CRATE-VERIFY ?auto_16523 ?auto_16524 ?auto_16525 ?auto_16526 ?auto_16527 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16530 - SURFACE
      ?auto_16531 - SURFACE
    )
    :vars
    (
      ?auto_16533 - HOIST
      ?auto_16532 - PLACE
      ?auto_16534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16533 ?auto_16532 ) ( SURFACE-AT ?auto_16530 ?auto_16532 ) ( CLEAR ?auto_16530 ) ( IS-CRATE ?auto_16531 ) ( not ( = ?auto_16530 ?auto_16531 ) ) ( TRUCK-AT ?auto_16534 ?auto_16532 ) ( AVAILABLE ?auto_16533 ) ( IN ?auto_16531 ?auto_16534 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16533 ?auto_16531 ?auto_16534 ?auto_16532 )
      ( MAKE-1CRATE ?auto_16530 ?auto_16531 )
      ( MAKE-1CRATE-VERIFY ?auto_16530 ?auto_16531 ) )
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
      ?auto_16540 - HOIST
      ?auto_16539 - PLACE
      ?auto_16538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16540 ?auto_16539 ) ( SURFACE-AT ?auto_16536 ?auto_16539 ) ( CLEAR ?auto_16536 ) ( IS-CRATE ?auto_16537 ) ( not ( = ?auto_16536 ?auto_16537 ) ) ( TRUCK-AT ?auto_16538 ?auto_16539 ) ( AVAILABLE ?auto_16540 ) ( IN ?auto_16537 ?auto_16538 ) ( ON ?auto_16536 ?auto_16535 ) ( not ( = ?auto_16535 ?auto_16536 ) ) ( not ( = ?auto_16535 ?auto_16537 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16536 ?auto_16537 )
      ( MAKE-2CRATE-VERIFY ?auto_16535 ?auto_16536 ?auto_16537 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16541 - SURFACE
      ?auto_16542 - SURFACE
      ?auto_16543 - SURFACE
      ?auto_16544 - SURFACE
    )
    :vars
    (
      ?auto_16546 - HOIST
      ?auto_16545 - PLACE
      ?auto_16547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16546 ?auto_16545 ) ( SURFACE-AT ?auto_16543 ?auto_16545 ) ( CLEAR ?auto_16543 ) ( IS-CRATE ?auto_16544 ) ( not ( = ?auto_16543 ?auto_16544 ) ) ( TRUCK-AT ?auto_16547 ?auto_16545 ) ( AVAILABLE ?auto_16546 ) ( IN ?auto_16544 ?auto_16547 ) ( ON ?auto_16543 ?auto_16542 ) ( not ( = ?auto_16542 ?auto_16543 ) ) ( not ( = ?auto_16542 ?auto_16544 ) ) ( ON ?auto_16542 ?auto_16541 ) ( not ( = ?auto_16541 ?auto_16542 ) ) ( not ( = ?auto_16541 ?auto_16543 ) ) ( not ( = ?auto_16541 ?auto_16544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16542 ?auto_16543 ?auto_16544 )
      ( MAKE-3CRATE-VERIFY ?auto_16541 ?auto_16542 ?auto_16543 ?auto_16544 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16548 - SURFACE
      ?auto_16549 - SURFACE
      ?auto_16550 - SURFACE
      ?auto_16551 - SURFACE
      ?auto_16552 - SURFACE
    )
    :vars
    (
      ?auto_16554 - HOIST
      ?auto_16553 - PLACE
      ?auto_16555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16554 ?auto_16553 ) ( SURFACE-AT ?auto_16551 ?auto_16553 ) ( CLEAR ?auto_16551 ) ( IS-CRATE ?auto_16552 ) ( not ( = ?auto_16551 ?auto_16552 ) ) ( TRUCK-AT ?auto_16555 ?auto_16553 ) ( AVAILABLE ?auto_16554 ) ( IN ?auto_16552 ?auto_16555 ) ( ON ?auto_16551 ?auto_16550 ) ( not ( = ?auto_16550 ?auto_16551 ) ) ( not ( = ?auto_16550 ?auto_16552 ) ) ( ON ?auto_16549 ?auto_16548 ) ( ON ?auto_16550 ?auto_16549 ) ( not ( = ?auto_16548 ?auto_16549 ) ) ( not ( = ?auto_16548 ?auto_16550 ) ) ( not ( = ?auto_16548 ?auto_16551 ) ) ( not ( = ?auto_16548 ?auto_16552 ) ) ( not ( = ?auto_16549 ?auto_16550 ) ) ( not ( = ?auto_16549 ?auto_16551 ) ) ( not ( = ?auto_16549 ?auto_16552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16550 ?auto_16551 ?auto_16552 )
      ( MAKE-4CRATE-VERIFY ?auto_16548 ?auto_16549 ?auto_16550 ?auto_16551 ?auto_16552 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16556 - SURFACE
      ?auto_16557 - SURFACE
    )
    :vars
    (
      ?auto_16560 - HOIST
      ?auto_16559 - PLACE
      ?auto_16561 - TRUCK
      ?auto_16558 - SURFACE
      ?auto_16562 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16560 ?auto_16559 ) ( SURFACE-AT ?auto_16556 ?auto_16559 ) ( CLEAR ?auto_16556 ) ( IS-CRATE ?auto_16557 ) ( not ( = ?auto_16556 ?auto_16557 ) ) ( AVAILABLE ?auto_16560 ) ( IN ?auto_16557 ?auto_16561 ) ( ON ?auto_16556 ?auto_16558 ) ( not ( = ?auto_16558 ?auto_16556 ) ) ( not ( = ?auto_16558 ?auto_16557 ) ) ( TRUCK-AT ?auto_16561 ?auto_16562 ) ( not ( = ?auto_16562 ?auto_16559 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16561 ?auto_16562 ?auto_16559 )
      ( MAKE-2CRATE ?auto_16558 ?auto_16556 ?auto_16557 )
      ( MAKE-1CRATE-VERIFY ?auto_16556 ?auto_16557 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16563 - SURFACE
      ?auto_16564 - SURFACE
      ?auto_16565 - SURFACE
    )
    :vars
    (
      ?auto_16568 - HOIST
      ?auto_16566 - PLACE
      ?auto_16567 - TRUCK
      ?auto_16569 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16568 ?auto_16566 ) ( SURFACE-AT ?auto_16564 ?auto_16566 ) ( CLEAR ?auto_16564 ) ( IS-CRATE ?auto_16565 ) ( not ( = ?auto_16564 ?auto_16565 ) ) ( AVAILABLE ?auto_16568 ) ( IN ?auto_16565 ?auto_16567 ) ( ON ?auto_16564 ?auto_16563 ) ( not ( = ?auto_16563 ?auto_16564 ) ) ( not ( = ?auto_16563 ?auto_16565 ) ) ( TRUCK-AT ?auto_16567 ?auto_16569 ) ( not ( = ?auto_16569 ?auto_16566 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16564 ?auto_16565 )
      ( MAKE-2CRATE-VERIFY ?auto_16563 ?auto_16564 ?auto_16565 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16570 - SURFACE
      ?auto_16571 - SURFACE
      ?auto_16572 - SURFACE
      ?auto_16573 - SURFACE
    )
    :vars
    (
      ?auto_16576 - HOIST
      ?auto_16577 - PLACE
      ?auto_16575 - TRUCK
      ?auto_16574 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16576 ?auto_16577 ) ( SURFACE-AT ?auto_16572 ?auto_16577 ) ( CLEAR ?auto_16572 ) ( IS-CRATE ?auto_16573 ) ( not ( = ?auto_16572 ?auto_16573 ) ) ( AVAILABLE ?auto_16576 ) ( IN ?auto_16573 ?auto_16575 ) ( ON ?auto_16572 ?auto_16571 ) ( not ( = ?auto_16571 ?auto_16572 ) ) ( not ( = ?auto_16571 ?auto_16573 ) ) ( TRUCK-AT ?auto_16575 ?auto_16574 ) ( not ( = ?auto_16574 ?auto_16577 ) ) ( ON ?auto_16571 ?auto_16570 ) ( not ( = ?auto_16570 ?auto_16571 ) ) ( not ( = ?auto_16570 ?auto_16572 ) ) ( not ( = ?auto_16570 ?auto_16573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16571 ?auto_16572 ?auto_16573 )
      ( MAKE-3CRATE-VERIFY ?auto_16570 ?auto_16571 ?auto_16572 ?auto_16573 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16578 - SURFACE
      ?auto_16579 - SURFACE
      ?auto_16580 - SURFACE
      ?auto_16581 - SURFACE
      ?auto_16582 - SURFACE
    )
    :vars
    (
      ?auto_16585 - HOIST
      ?auto_16586 - PLACE
      ?auto_16584 - TRUCK
      ?auto_16583 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16585 ?auto_16586 ) ( SURFACE-AT ?auto_16581 ?auto_16586 ) ( CLEAR ?auto_16581 ) ( IS-CRATE ?auto_16582 ) ( not ( = ?auto_16581 ?auto_16582 ) ) ( AVAILABLE ?auto_16585 ) ( IN ?auto_16582 ?auto_16584 ) ( ON ?auto_16581 ?auto_16580 ) ( not ( = ?auto_16580 ?auto_16581 ) ) ( not ( = ?auto_16580 ?auto_16582 ) ) ( TRUCK-AT ?auto_16584 ?auto_16583 ) ( not ( = ?auto_16583 ?auto_16586 ) ) ( ON ?auto_16579 ?auto_16578 ) ( ON ?auto_16580 ?auto_16579 ) ( not ( = ?auto_16578 ?auto_16579 ) ) ( not ( = ?auto_16578 ?auto_16580 ) ) ( not ( = ?auto_16578 ?auto_16581 ) ) ( not ( = ?auto_16578 ?auto_16582 ) ) ( not ( = ?auto_16579 ?auto_16580 ) ) ( not ( = ?auto_16579 ?auto_16581 ) ) ( not ( = ?auto_16579 ?auto_16582 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16580 ?auto_16581 ?auto_16582 )
      ( MAKE-4CRATE-VERIFY ?auto_16578 ?auto_16579 ?auto_16580 ?auto_16581 ?auto_16582 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16587 - SURFACE
      ?auto_16588 - SURFACE
    )
    :vars
    (
      ?auto_16592 - HOIST
      ?auto_16593 - PLACE
      ?auto_16589 - SURFACE
      ?auto_16591 - TRUCK
      ?auto_16590 - PLACE
      ?auto_16594 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16592 ?auto_16593 ) ( SURFACE-AT ?auto_16587 ?auto_16593 ) ( CLEAR ?auto_16587 ) ( IS-CRATE ?auto_16588 ) ( not ( = ?auto_16587 ?auto_16588 ) ) ( AVAILABLE ?auto_16592 ) ( ON ?auto_16587 ?auto_16589 ) ( not ( = ?auto_16589 ?auto_16587 ) ) ( not ( = ?auto_16589 ?auto_16588 ) ) ( TRUCK-AT ?auto_16591 ?auto_16590 ) ( not ( = ?auto_16590 ?auto_16593 ) ) ( HOIST-AT ?auto_16594 ?auto_16590 ) ( LIFTING ?auto_16594 ?auto_16588 ) ( not ( = ?auto_16592 ?auto_16594 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16594 ?auto_16588 ?auto_16591 ?auto_16590 )
      ( MAKE-2CRATE ?auto_16589 ?auto_16587 ?auto_16588 )
      ( MAKE-1CRATE-VERIFY ?auto_16587 ?auto_16588 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16595 - SURFACE
      ?auto_16596 - SURFACE
      ?auto_16597 - SURFACE
    )
    :vars
    (
      ?auto_16601 - HOIST
      ?auto_16600 - PLACE
      ?auto_16599 - TRUCK
      ?auto_16598 - PLACE
      ?auto_16602 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16601 ?auto_16600 ) ( SURFACE-AT ?auto_16596 ?auto_16600 ) ( CLEAR ?auto_16596 ) ( IS-CRATE ?auto_16597 ) ( not ( = ?auto_16596 ?auto_16597 ) ) ( AVAILABLE ?auto_16601 ) ( ON ?auto_16596 ?auto_16595 ) ( not ( = ?auto_16595 ?auto_16596 ) ) ( not ( = ?auto_16595 ?auto_16597 ) ) ( TRUCK-AT ?auto_16599 ?auto_16598 ) ( not ( = ?auto_16598 ?auto_16600 ) ) ( HOIST-AT ?auto_16602 ?auto_16598 ) ( LIFTING ?auto_16602 ?auto_16597 ) ( not ( = ?auto_16601 ?auto_16602 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16596 ?auto_16597 )
      ( MAKE-2CRATE-VERIFY ?auto_16595 ?auto_16596 ?auto_16597 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16603 - SURFACE
      ?auto_16604 - SURFACE
      ?auto_16605 - SURFACE
      ?auto_16606 - SURFACE
    )
    :vars
    (
      ?auto_16607 - HOIST
      ?auto_16610 - PLACE
      ?auto_16608 - TRUCK
      ?auto_16609 - PLACE
      ?auto_16611 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16607 ?auto_16610 ) ( SURFACE-AT ?auto_16605 ?auto_16610 ) ( CLEAR ?auto_16605 ) ( IS-CRATE ?auto_16606 ) ( not ( = ?auto_16605 ?auto_16606 ) ) ( AVAILABLE ?auto_16607 ) ( ON ?auto_16605 ?auto_16604 ) ( not ( = ?auto_16604 ?auto_16605 ) ) ( not ( = ?auto_16604 ?auto_16606 ) ) ( TRUCK-AT ?auto_16608 ?auto_16609 ) ( not ( = ?auto_16609 ?auto_16610 ) ) ( HOIST-AT ?auto_16611 ?auto_16609 ) ( LIFTING ?auto_16611 ?auto_16606 ) ( not ( = ?auto_16607 ?auto_16611 ) ) ( ON ?auto_16604 ?auto_16603 ) ( not ( = ?auto_16603 ?auto_16604 ) ) ( not ( = ?auto_16603 ?auto_16605 ) ) ( not ( = ?auto_16603 ?auto_16606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16604 ?auto_16605 ?auto_16606 )
      ( MAKE-3CRATE-VERIFY ?auto_16603 ?auto_16604 ?auto_16605 ?auto_16606 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16612 - SURFACE
      ?auto_16613 - SURFACE
      ?auto_16614 - SURFACE
      ?auto_16615 - SURFACE
      ?auto_16616 - SURFACE
    )
    :vars
    (
      ?auto_16617 - HOIST
      ?auto_16620 - PLACE
      ?auto_16618 - TRUCK
      ?auto_16619 - PLACE
      ?auto_16621 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16617 ?auto_16620 ) ( SURFACE-AT ?auto_16615 ?auto_16620 ) ( CLEAR ?auto_16615 ) ( IS-CRATE ?auto_16616 ) ( not ( = ?auto_16615 ?auto_16616 ) ) ( AVAILABLE ?auto_16617 ) ( ON ?auto_16615 ?auto_16614 ) ( not ( = ?auto_16614 ?auto_16615 ) ) ( not ( = ?auto_16614 ?auto_16616 ) ) ( TRUCK-AT ?auto_16618 ?auto_16619 ) ( not ( = ?auto_16619 ?auto_16620 ) ) ( HOIST-AT ?auto_16621 ?auto_16619 ) ( LIFTING ?auto_16621 ?auto_16616 ) ( not ( = ?auto_16617 ?auto_16621 ) ) ( ON ?auto_16613 ?auto_16612 ) ( ON ?auto_16614 ?auto_16613 ) ( not ( = ?auto_16612 ?auto_16613 ) ) ( not ( = ?auto_16612 ?auto_16614 ) ) ( not ( = ?auto_16612 ?auto_16615 ) ) ( not ( = ?auto_16612 ?auto_16616 ) ) ( not ( = ?auto_16613 ?auto_16614 ) ) ( not ( = ?auto_16613 ?auto_16615 ) ) ( not ( = ?auto_16613 ?auto_16616 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16614 ?auto_16615 ?auto_16616 )
      ( MAKE-4CRATE-VERIFY ?auto_16612 ?auto_16613 ?auto_16614 ?auto_16615 ?auto_16616 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16622 - SURFACE
      ?auto_16623 - SURFACE
    )
    :vars
    (
      ?auto_16625 - HOIST
      ?auto_16628 - PLACE
      ?auto_16624 - SURFACE
      ?auto_16626 - TRUCK
      ?auto_16627 - PLACE
      ?auto_16629 - HOIST
      ?auto_16630 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16625 ?auto_16628 ) ( SURFACE-AT ?auto_16622 ?auto_16628 ) ( CLEAR ?auto_16622 ) ( IS-CRATE ?auto_16623 ) ( not ( = ?auto_16622 ?auto_16623 ) ) ( AVAILABLE ?auto_16625 ) ( ON ?auto_16622 ?auto_16624 ) ( not ( = ?auto_16624 ?auto_16622 ) ) ( not ( = ?auto_16624 ?auto_16623 ) ) ( TRUCK-AT ?auto_16626 ?auto_16627 ) ( not ( = ?auto_16627 ?auto_16628 ) ) ( HOIST-AT ?auto_16629 ?auto_16627 ) ( not ( = ?auto_16625 ?auto_16629 ) ) ( AVAILABLE ?auto_16629 ) ( SURFACE-AT ?auto_16623 ?auto_16627 ) ( ON ?auto_16623 ?auto_16630 ) ( CLEAR ?auto_16623 ) ( not ( = ?auto_16622 ?auto_16630 ) ) ( not ( = ?auto_16623 ?auto_16630 ) ) ( not ( = ?auto_16624 ?auto_16630 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16629 ?auto_16623 ?auto_16630 ?auto_16627 )
      ( MAKE-2CRATE ?auto_16624 ?auto_16622 ?auto_16623 )
      ( MAKE-1CRATE-VERIFY ?auto_16622 ?auto_16623 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16631 - SURFACE
      ?auto_16632 - SURFACE
      ?auto_16633 - SURFACE
    )
    :vars
    (
      ?auto_16638 - HOIST
      ?auto_16634 - PLACE
      ?auto_16635 - TRUCK
      ?auto_16639 - PLACE
      ?auto_16637 - HOIST
      ?auto_16636 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16638 ?auto_16634 ) ( SURFACE-AT ?auto_16632 ?auto_16634 ) ( CLEAR ?auto_16632 ) ( IS-CRATE ?auto_16633 ) ( not ( = ?auto_16632 ?auto_16633 ) ) ( AVAILABLE ?auto_16638 ) ( ON ?auto_16632 ?auto_16631 ) ( not ( = ?auto_16631 ?auto_16632 ) ) ( not ( = ?auto_16631 ?auto_16633 ) ) ( TRUCK-AT ?auto_16635 ?auto_16639 ) ( not ( = ?auto_16639 ?auto_16634 ) ) ( HOIST-AT ?auto_16637 ?auto_16639 ) ( not ( = ?auto_16638 ?auto_16637 ) ) ( AVAILABLE ?auto_16637 ) ( SURFACE-AT ?auto_16633 ?auto_16639 ) ( ON ?auto_16633 ?auto_16636 ) ( CLEAR ?auto_16633 ) ( not ( = ?auto_16632 ?auto_16636 ) ) ( not ( = ?auto_16633 ?auto_16636 ) ) ( not ( = ?auto_16631 ?auto_16636 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16632 ?auto_16633 )
      ( MAKE-2CRATE-VERIFY ?auto_16631 ?auto_16632 ?auto_16633 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16640 - SURFACE
      ?auto_16641 - SURFACE
      ?auto_16642 - SURFACE
      ?auto_16643 - SURFACE
    )
    :vars
    (
      ?auto_16649 - HOIST
      ?auto_16648 - PLACE
      ?auto_16644 - TRUCK
      ?auto_16647 - PLACE
      ?auto_16645 - HOIST
      ?auto_16646 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16649 ?auto_16648 ) ( SURFACE-AT ?auto_16642 ?auto_16648 ) ( CLEAR ?auto_16642 ) ( IS-CRATE ?auto_16643 ) ( not ( = ?auto_16642 ?auto_16643 ) ) ( AVAILABLE ?auto_16649 ) ( ON ?auto_16642 ?auto_16641 ) ( not ( = ?auto_16641 ?auto_16642 ) ) ( not ( = ?auto_16641 ?auto_16643 ) ) ( TRUCK-AT ?auto_16644 ?auto_16647 ) ( not ( = ?auto_16647 ?auto_16648 ) ) ( HOIST-AT ?auto_16645 ?auto_16647 ) ( not ( = ?auto_16649 ?auto_16645 ) ) ( AVAILABLE ?auto_16645 ) ( SURFACE-AT ?auto_16643 ?auto_16647 ) ( ON ?auto_16643 ?auto_16646 ) ( CLEAR ?auto_16643 ) ( not ( = ?auto_16642 ?auto_16646 ) ) ( not ( = ?auto_16643 ?auto_16646 ) ) ( not ( = ?auto_16641 ?auto_16646 ) ) ( ON ?auto_16641 ?auto_16640 ) ( not ( = ?auto_16640 ?auto_16641 ) ) ( not ( = ?auto_16640 ?auto_16642 ) ) ( not ( = ?auto_16640 ?auto_16643 ) ) ( not ( = ?auto_16640 ?auto_16646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16641 ?auto_16642 ?auto_16643 )
      ( MAKE-3CRATE-VERIFY ?auto_16640 ?auto_16641 ?auto_16642 ?auto_16643 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16650 - SURFACE
      ?auto_16651 - SURFACE
      ?auto_16652 - SURFACE
      ?auto_16653 - SURFACE
      ?auto_16654 - SURFACE
    )
    :vars
    (
      ?auto_16660 - HOIST
      ?auto_16659 - PLACE
      ?auto_16655 - TRUCK
      ?auto_16658 - PLACE
      ?auto_16656 - HOIST
      ?auto_16657 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16660 ?auto_16659 ) ( SURFACE-AT ?auto_16653 ?auto_16659 ) ( CLEAR ?auto_16653 ) ( IS-CRATE ?auto_16654 ) ( not ( = ?auto_16653 ?auto_16654 ) ) ( AVAILABLE ?auto_16660 ) ( ON ?auto_16653 ?auto_16652 ) ( not ( = ?auto_16652 ?auto_16653 ) ) ( not ( = ?auto_16652 ?auto_16654 ) ) ( TRUCK-AT ?auto_16655 ?auto_16658 ) ( not ( = ?auto_16658 ?auto_16659 ) ) ( HOIST-AT ?auto_16656 ?auto_16658 ) ( not ( = ?auto_16660 ?auto_16656 ) ) ( AVAILABLE ?auto_16656 ) ( SURFACE-AT ?auto_16654 ?auto_16658 ) ( ON ?auto_16654 ?auto_16657 ) ( CLEAR ?auto_16654 ) ( not ( = ?auto_16653 ?auto_16657 ) ) ( not ( = ?auto_16654 ?auto_16657 ) ) ( not ( = ?auto_16652 ?auto_16657 ) ) ( ON ?auto_16651 ?auto_16650 ) ( ON ?auto_16652 ?auto_16651 ) ( not ( = ?auto_16650 ?auto_16651 ) ) ( not ( = ?auto_16650 ?auto_16652 ) ) ( not ( = ?auto_16650 ?auto_16653 ) ) ( not ( = ?auto_16650 ?auto_16654 ) ) ( not ( = ?auto_16650 ?auto_16657 ) ) ( not ( = ?auto_16651 ?auto_16652 ) ) ( not ( = ?auto_16651 ?auto_16653 ) ) ( not ( = ?auto_16651 ?auto_16654 ) ) ( not ( = ?auto_16651 ?auto_16657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16652 ?auto_16653 ?auto_16654 )
      ( MAKE-4CRATE-VERIFY ?auto_16650 ?auto_16651 ?auto_16652 ?auto_16653 ?auto_16654 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16661 - SURFACE
      ?auto_16662 - SURFACE
    )
    :vars
    (
      ?auto_16668 - HOIST
      ?auto_16667 - PLACE
      ?auto_16669 - SURFACE
      ?auto_16666 - PLACE
      ?auto_16664 - HOIST
      ?auto_16665 - SURFACE
      ?auto_16663 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16668 ?auto_16667 ) ( SURFACE-AT ?auto_16661 ?auto_16667 ) ( CLEAR ?auto_16661 ) ( IS-CRATE ?auto_16662 ) ( not ( = ?auto_16661 ?auto_16662 ) ) ( AVAILABLE ?auto_16668 ) ( ON ?auto_16661 ?auto_16669 ) ( not ( = ?auto_16669 ?auto_16661 ) ) ( not ( = ?auto_16669 ?auto_16662 ) ) ( not ( = ?auto_16666 ?auto_16667 ) ) ( HOIST-AT ?auto_16664 ?auto_16666 ) ( not ( = ?auto_16668 ?auto_16664 ) ) ( AVAILABLE ?auto_16664 ) ( SURFACE-AT ?auto_16662 ?auto_16666 ) ( ON ?auto_16662 ?auto_16665 ) ( CLEAR ?auto_16662 ) ( not ( = ?auto_16661 ?auto_16665 ) ) ( not ( = ?auto_16662 ?auto_16665 ) ) ( not ( = ?auto_16669 ?auto_16665 ) ) ( TRUCK-AT ?auto_16663 ?auto_16667 ) )
    :subtasks
    ( ( !DRIVE ?auto_16663 ?auto_16667 ?auto_16666 )
      ( MAKE-2CRATE ?auto_16669 ?auto_16661 ?auto_16662 )
      ( MAKE-1CRATE-VERIFY ?auto_16661 ?auto_16662 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16670 - SURFACE
      ?auto_16671 - SURFACE
      ?auto_16672 - SURFACE
    )
    :vars
    (
      ?auto_16674 - HOIST
      ?auto_16676 - PLACE
      ?auto_16673 - PLACE
      ?auto_16678 - HOIST
      ?auto_16677 - SURFACE
      ?auto_16675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16674 ?auto_16676 ) ( SURFACE-AT ?auto_16671 ?auto_16676 ) ( CLEAR ?auto_16671 ) ( IS-CRATE ?auto_16672 ) ( not ( = ?auto_16671 ?auto_16672 ) ) ( AVAILABLE ?auto_16674 ) ( ON ?auto_16671 ?auto_16670 ) ( not ( = ?auto_16670 ?auto_16671 ) ) ( not ( = ?auto_16670 ?auto_16672 ) ) ( not ( = ?auto_16673 ?auto_16676 ) ) ( HOIST-AT ?auto_16678 ?auto_16673 ) ( not ( = ?auto_16674 ?auto_16678 ) ) ( AVAILABLE ?auto_16678 ) ( SURFACE-AT ?auto_16672 ?auto_16673 ) ( ON ?auto_16672 ?auto_16677 ) ( CLEAR ?auto_16672 ) ( not ( = ?auto_16671 ?auto_16677 ) ) ( not ( = ?auto_16672 ?auto_16677 ) ) ( not ( = ?auto_16670 ?auto_16677 ) ) ( TRUCK-AT ?auto_16675 ?auto_16676 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16671 ?auto_16672 )
      ( MAKE-2CRATE-VERIFY ?auto_16670 ?auto_16671 ?auto_16672 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16679 - SURFACE
      ?auto_16680 - SURFACE
      ?auto_16681 - SURFACE
      ?auto_16682 - SURFACE
    )
    :vars
    (
      ?auto_16686 - HOIST
      ?auto_16684 - PLACE
      ?auto_16683 - PLACE
      ?auto_16687 - HOIST
      ?auto_16688 - SURFACE
      ?auto_16685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16686 ?auto_16684 ) ( SURFACE-AT ?auto_16681 ?auto_16684 ) ( CLEAR ?auto_16681 ) ( IS-CRATE ?auto_16682 ) ( not ( = ?auto_16681 ?auto_16682 ) ) ( AVAILABLE ?auto_16686 ) ( ON ?auto_16681 ?auto_16680 ) ( not ( = ?auto_16680 ?auto_16681 ) ) ( not ( = ?auto_16680 ?auto_16682 ) ) ( not ( = ?auto_16683 ?auto_16684 ) ) ( HOIST-AT ?auto_16687 ?auto_16683 ) ( not ( = ?auto_16686 ?auto_16687 ) ) ( AVAILABLE ?auto_16687 ) ( SURFACE-AT ?auto_16682 ?auto_16683 ) ( ON ?auto_16682 ?auto_16688 ) ( CLEAR ?auto_16682 ) ( not ( = ?auto_16681 ?auto_16688 ) ) ( not ( = ?auto_16682 ?auto_16688 ) ) ( not ( = ?auto_16680 ?auto_16688 ) ) ( TRUCK-AT ?auto_16685 ?auto_16684 ) ( ON ?auto_16680 ?auto_16679 ) ( not ( = ?auto_16679 ?auto_16680 ) ) ( not ( = ?auto_16679 ?auto_16681 ) ) ( not ( = ?auto_16679 ?auto_16682 ) ) ( not ( = ?auto_16679 ?auto_16688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16680 ?auto_16681 ?auto_16682 )
      ( MAKE-3CRATE-VERIFY ?auto_16679 ?auto_16680 ?auto_16681 ?auto_16682 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16689 - SURFACE
      ?auto_16690 - SURFACE
      ?auto_16691 - SURFACE
      ?auto_16692 - SURFACE
      ?auto_16693 - SURFACE
    )
    :vars
    (
      ?auto_16697 - HOIST
      ?auto_16695 - PLACE
      ?auto_16694 - PLACE
      ?auto_16698 - HOIST
      ?auto_16699 - SURFACE
      ?auto_16696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16697 ?auto_16695 ) ( SURFACE-AT ?auto_16692 ?auto_16695 ) ( CLEAR ?auto_16692 ) ( IS-CRATE ?auto_16693 ) ( not ( = ?auto_16692 ?auto_16693 ) ) ( AVAILABLE ?auto_16697 ) ( ON ?auto_16692 ?auto_16691 ) ( not ( = ?auto_16691 ?auto_16692 ) ) ( not ( = ?auto_16691 ?auto_16693 ) ) ( not ( = ?auto_16694 ?auto_16695 ) ) ( HOIST-AT ?auto_16698 ?auto_16694 ) ( not ( = ?auto_16697 ?auto_16698 ) ) ( AVAILABLE ?auto_16698 ) ( SURFACE-AT ?auto_16693 ?auto_16694 ) ( ON ?auto_16693 ?auto_16699 ) ( CLEAR ?auto_16693 ) ( not ( = ?auto_16692 ?auto_16699 ) ) ( not ( = ?auto_16693 ?auto_16699 ) ) ( not ( = ?auto_16691 ?auto_16699 ) ) ( TRUCK-AT ?auto_16696 ?auto_16695 ) ( ON ?auto_16690 ?auto_16689 ) ( ON ?auto_16691 ?auto_16690 ) ( not ( = ?auto_16689 ?auto_16690 ) ) ( not ( = ?auto_16689 ?auto_16691 ) ) ( not ( = ?auto_16689 ?auto_16692 ) ) ( not ( = ?auto_16689 ?auto_16693 ) ) ( not ( = ?auto_16689 ?auto_16699 ) ) ( not ( = ?auto_16690 ?auto_16691 ) ) ( not ( = ?auto_16690 ?auto_16692 ) ) ( not ( = ?auto_16690 ?auto_16693 ) ) ( not ( = ?auto_16690 ?auto_16699 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16691 ?auto_16692 ?auto_16693 )
      ( MAKE-4CRATE-VERIFY ?auto_16689 ?auto_16690 ?auto_16691 ?auto_16692 ?auto_16693 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16700 - SURFACE
      ?auto_16701 - SURFACE
    )
    :vars
    (
      ?auto_16706 - HOIST
      ?auto_16703 - PLACE
      ?auto_16704 - SURFACE
      ?auto_16702 - PLACE
      ?auto_16707 - HOIST
      ?auto_16708 - SURFACE
      ?auto_16705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16706 ?auto_16703 ) ( IS-CRATE ?auto_16701 ) ( not ( = ?auto_16700 ?auto_16701 ) ) ( not ( = ?auto_16704 ?auto_16700 ) ) ( not ( = ?auto_16704 ?auto_16701 ) ) ( not ( = ?auto_16702 ?auto_16703 ) ) ( HOIST-AT ?auto_16707 ?auto_16702 ) ( not ( = ?auto_16706 ?auto_16707 ) ) ( AVAILABLE ?auto_16707 ) ( SURFACE-AT ?auto_16701 ?auto_16702 ) ( ON ?auto_16701 ?auto_16708 ) ( CLEAR ?auto_16701 ) ( not ( = ?auto_16700 ?auto_16708 ) ) ( not ( = ?auto_16701 ?auto_16708 ) ) ( not ( = ?auto_16704 ?auto_16708 ) ) ( TRUCK-AT ?auto_16705 ?auto_16703 ) ( SURFACE-AT ?auto_16704 ?auto_16703 ) ( CLEAR ?auto_16704 ) ( LIFTING ?auto_16706 ?auto_16700 ) ( IS-CRATE ?auto_16700 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16704 ?auto_16700 )
      ( MAKE-2CRATE ?auto_16704 ?auto_16700 ?auto_16701 )
      ( MAKE-1CRATE-VERIFY ?auto_16700 ?auto_16701 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16709 - SURFACE
      ?auto_16710 - SURFACE
      ?auto_16711 - SURFACE
    )
    :vars
    (
      ?auto_16717 - HOIST
      ?auto_16715 - PLACE
      ?auto_16716 - PLACE
      ?auto_16713 - HOIST
      ?auto_16712 - SURFACE
      ?auto_16714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16717 ?auto_16715 ) ( IS-CRATE ?auto_16711 ) ( not ( = ?auto_16710 ?auto_16711 ) ) ( not ( = ?auto_16709 ?auto_16710 ) ) ( not ( = ?auto_16709 ?auto_16711 ) ) ( not ( = ?auto_16716 ?auto_16715 ) ) ( HOIST-AT ?auto_16713 ?auto_16716 ) ( not ( = ?auto_16717 ?auto_16713 ) ) ( AVAILABLE ?auto_16713 ) ( SURFACE-AT ?auto_16711 ?auto_16716 ) ( ON ?auto_16711 ?auto_16712 ) ( CLEAR ?auto_16711 ) ( not ( = ?auto_16710 ?auto_16712 ) ) ( not ( = ?auto_16711 ?auto_16712 ) ) ( not ( = ?auto_16709 ?auto_16712 ) ) ( TRUCK-AT ?auto_16714 ?auto_16715 ) ( SURFACE-AT ?auto_16709 ?auto_16715 ) ( CLEAR ?auto_16709 ) ( LIFTING ?auto_16717 ?auto_16710 ) ( IS-CRATE ?auto_16710 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16710 ?auto_16711 )
      ( MAKE-2CRATE-VERIFY ?auto_16709 ?auto_16710 ?auto_16711 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16718 - SURFACE
      ?auto_16719 - SURFACE
      ?auto_16720 - SURFACE
      ?auto_16721 - SURFACE
    )
    :vars
    (
      ?auto_16726 - HOIST
      ?auto_16725 - PLACE
      ?auto_16723 - PLACE
      ?auto_16724 - HOIST
      ?auto_16727 - SURFACE
      ?auto_16722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16726 ?auto_16725 ) ( IS-CRATE ?auto_16721 ) ( not ( = ?auto_16720 ?auto_16721 ) ) ( not ( = ?auto_16719 ?auto_16720 ) ) ( not ( = ?auto_16719 ?auto_16721 ) ) ( not ( = ?auto_16723 ?auto_16725 ) ) ( HOIST-AT ?auto_16724 ?auto_16723 ) ( not ( = ?auto_16726 ?auto_16724 ) ) ( AVAILABLE ?auto_16724 ) ( SURFACE-AT ?auto_16721 ?auto_16723 ) ( ON ?auto_16721 ?auto_16727 ) ( CLEAR ?auto_16721 ) ( not ( = ?auto_16720 ?auto_16727 ) ) ( not ( = ?auto_16721 ?auto_16727 ) ) ( not ( = ?auto_16719 ?auto_16727 ) ) ( TRUCK-AT ?auto_16722 ?auto_16725 ) ( SURFACE-AT ?auto_16719 ?auto_16725 ) ( CLEAR ?auto_16719 ) ( LIFTING ?auto_16726 ?auto_16720 ) ( IS-CRATE ?auto_16720 ) ( ON ?auto_16719 ?auto_16718 ) ( not ( = ?auto_16718 ?auto_16719 ) ) ( not ( = ?auto_16718 ?auto_16720 ) ) ( not ( = ?auto_16718 ?auto_16721 ) ) ( not ( = ?auto_16718 ?auto_16727 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16719 ?auto_16720 ?auto_16721 )
      ( MAKE-3CRATE-VERIFY ?auto_16718 ?auto_16719 ?auto_16720 ?auto_16721 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16728 - SURFACE
      ?auto_16729 - SURFACE
      ?auto_16730 - SURFACE
      ?auto_16731 - SURFACE
      ?auto_16732 - SURFACE
    )
    :vars
    (
      ?auto_16737 - HOIST
      ?auto_16736 - PLACE
      ?auto_16734 - PLACE
      ?auto_16735 - HOIST
      ?auto_16738 - SURFACE
      ?auto_16733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16737 ?auto_16736 ) ( IS-CRATE ?auto_16732 ) ( not ( = ?auto_16731 ?auto_16732 ) ) ( not ( = ?auto_16730 ?auto_16731 ) ) ( not ( = ?auto_16730 ?auto_16732 ) ) ( not ( = ?auto_16734 ?auto_16736 ) ) ( HOIST-AT ?auto_16735 ?auto_16734 ) ( not ( = ?auto_16737 ?auto_16735 ) ) ( AVAILABLE ?auto_16735 ) ( SURFACE-AT ?auto_16732 ?auto_16734 ) ( ON ?auto_16732 ?auto_16738 ) ( CLEAR ?auto_16732 ) ( not ( = ?auto_16731 ?auto_16738 ) ) ( not ( = ?auto_16732 ?auto_16738 ) ) ( not ( = ?auto_16730 ?auto_16738 ) ) ( TRUCK-AT ?auto_16733 ?auto_16736 ) ( SURFACE-AT ?auto_16730 ?auto_16736 ) ( CLEAR ?auto_16730 ) ( LIFTING ?auto_16737 ?auto_16731 ) ( IS-CRATE ?auto_16731 ) ( ON ?auto_16729 ?auto_16728 ) ( ON ?auto_16730 ?auto_16729 ) ( not ( = ?auto_16728 ?auto_16729 ) ) ( not ( = ?auto_16728 ?auto_16730 ) ) ( not ( = ?auto_16728 ?auto_16731 ) ) ( not ( = ?auto_16728 ?auto_16732 ) ) ( not ( = ?auto_16728 ?auto_16738 ) ) ( not ( = ?auto_16729 ?auto_16730 ) ) ( not ( = ?auto_16729 ?auto_16731 ) ) ( not ( = ?auto_16729 ?auto_16732 ) ) ( not ( = ?auto_16729 ?auto_16738 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16730 ?auto_16731 ?auto_16732 )
      ( MAKE-4CRATE-VERIFY ?auto_16728 ?auto_16729 ?auto_16730 ?auto_16731 ?auto_16732 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16739 - SURFACE
      ?auto_16740 - SURFACE
    )
    :vars
    (
      ?auto_16745 - HOIST
      ?auto_16744 - PLACE
      ?auto_16747 - SURFACE
      ?auto_16742 - PLACE
      ?auto_16743 - HOIST
      ?auto_16746 - SURFACE
      ?auto_16741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16745 ?auto_16744 ) ( IS-CRATE ?auto_16740 ) ( not ( = ?auto_16739 ?auto_16740 ) ) ( not ( = ?auto_16747 ?auto_16739 ) ) ( not ( = ?auto_16747 ?auto_16740 ) ) ( not ( = ?auto_16742 ?auto_16744 ) ) ( HOIST-AT ?auto_16743 ?auto_16742 ) ( not ( = ?auto_16745 ?auto_16743 ) ) ( AVAILABLE ?auto_16743 ) ( SURFACE-AT ?auto_16740 ?auto_16742 ) ( ON ?auto_16740 ?auto_16746 ) ( CLEAR ?auto_16740 ) ( not ( = ?auto_16739 ?auto_16746 ) ) ( not ( = ?auto_16740 ?auto_16746 ) ) ( not ( = ?auto_16747 ?auto_16746 ) ) ( TRUCK-AT ?auto_16741 ?auto_16744 ) ( SURFACE-AT ?auto_16747 ?auto_16744 ) ( CLEAR ?auto_16747 ) ( IS-CRATE ?auto_16739 ) ( AVAILABLE ?auto_16745 ) ( IN ?auto_16739 ?auto_16741 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16745 ?auto_16739 ?auto_16741 ?auto_16744 )
      ( MAKE-2CRATE ?auto_16747 ?auto_16739 ?auto_16740 )
      ( MAKE-1CRATE-VERIFY ?auto_16739 ?auto_16740 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16748 - SURFACE
      ?auto_16749 - SURFACE
      ?auto_16750 - SURFACE
    )
    :vars
    (
      ?auto_16753 - HOIST
      ?auto_16755 - PLACE
      ?auto_16752 - PLACE
      ?auto_16751 - HOIST
      ?auto_16754 - SURFACE
      ?auto_16756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16753 ?auto_16755 ) ( IS-CRATE ?auto_16750 ) ( not ( = ?auto_16749 ?auto_16750 ) ) ( not ( = ?auto_16748 ?auto_16749 ) ) ( not ( = ?auto_16748 ?auto_16750 ) ) ( not ( = ?auto_16752 ?auto_16755 ) ) ( HOIST-AT ?auto_16751 ?auto_16752 ) ( not ( = ?auto_16753 ?auto_16751 ) ) ( AVAILABLE ?auto_16751 ) ( SURFACE-AT ?auto_16750 ?auto_16752 ) ( ON ?auto_16750 ?auto_16754 ) ( CLEAR ?auto_16750 ) ( not ( = ?auto_16749 ?auto_16754 ) ) ( not ( = ?auto_16750 ?auto_16754 ) ) ( not ( = ?auto_16748 ?auto_16754 ) ) ( TRUCK-AT ?auto_16756 ?auto_16755 ) ( SURFACE-AT ?auto_16748 ?auto_16755 ) ( CLEAR ?auto_16748 ) ( IS-CRATE ?auto_16749 ) ( AVAILABLE ?auto_16753 ) ( IN ?auto_16749 ?auto_16756 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16749 ?auto_16750 )
      ( MAKE-2CRATE-VERIFY ?auto_16748 ?auto_16749 ?auto_16750 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16757 - SURFACE
      ?auto_16758 - SURFACE
      ?auto_16759 - SURFACE
      ?auto_16760 - SURFACE
    )
    :vars
    (
      ?auto_16766 - HOIST
      ?auto_16761 - PLACE
      ?auto_16765 - PLACE
      ?auto_16762 - HOIST
      ?auto_16763 - SURFACE
      ?auto_16764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16766 ?auto_16761 ) ( IS-CRATE ?auto_16760 ) ( not ( = ?auto_16759 ?auto_16760 ) ) ( not ( = ?auto_16758 ?auto_16759 ) ) ( not ( = ?auto_16758 ?auto_16760 ) ) ( not ( = ?auto_16765 ?auto_16761 ) ) ( HOIST-AT ?auto_16762 ?auto_16765 ) ( not ( = ?auto_16766 ?auto_16762 ) ) ( AVAILABLE ?auto_16762 ) ( SURFACE-AT ?auto_16760 ?auto_16765 ) ( ON ?auto_16760 ?auto_16763 ) ( CLEAR ?auto_16760 ) ( not ( = ?auto_16759 ?auto_16763 ) ) ( not ( = ?auto_16760 ?auto_16763 ) ) ( not ( = ?auto_16758 ?auto_16763 ) ) ( TRUCK-AT ?auto_16764 ?auto_16761 ) ( SURFACE-AT ?auto_16758 ?auto_16761 ) ( CLEAR ?auto_16758 ) ( IS-CRATE ?auto_16759 ) ( AVAILABLE ?auto_16766 ) ( IN ?auto_16759 ?auto_16764 ) ( ON ?auto_16758 ?auto_16757 ) ( not ( = ?auto_16757 ?auto_16758 ) ) ( not ( = ?auto_16757 ?auto_16759 ) ) ( not ( = ?auto_16757 ?auto_16760 ) ) ( not ( = ?auto_16757 ?auto_16763 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16758 ?auto_16759 ?auto_16760 )
      ( MAKE-3CRATE-VERIFY ?auto_16757 ?auto_16758 ?auto_16759 ?auto_16760 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16767 - SURFACE
      ?auto_16768 - SURFACE
      ?auto_16769 - SURFACE
      ?auto_16770 - SURFACE
      ?auto_16771 - SURFACE
    )
    :vars
    (
      ?auto_16777 - HOIST
      ?auto_16772 - PLACE
      ?auto_16776 - PLACE
      ?auto_16773 - HOIST
      ?auto_16774 - SURFACE
      ?auto_16775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16777 ?auto_16772 ) ( IS-CRATE ?auto_16771 ) ( not ( = ?auto_16770 ?auto_16771 ) ) ( not ( = ?auto_16769 ?auto_16770 ) ) ( not ( = ?auto_16769 ?auto_16771 ) ) ( not ( = ?auto_16776 ?auto_16772 ) ) ( HOIST-AT ?auto_16773 ?auto_16776 ) ( not ( = ?auto_16777 ?auto_16773 ) ) ( AVAILABLE ?auto_16773 ) ( SURFACE-AT ?auto_16771 ?auto_16776 ) ( ON ?auto_16771 ?auto_16774 ) ( CLEAR ?auto_16771 ) ( not ( = ?auto_16770 ?auto_16774 ) ) ( not ( = ?auto_16771 ?auto_16774 ) ) ( not ( = ?auto_16769 ?auto_16774 ) ) ( TRUCK-AT ?auto_16775 ?auto_16772 ) ( SURFACE-AT ?auto_16769 ?auto_16772 ) ( CLEAR ?auto_16769 ) ( IS-CRATE ?auto_16770 ) ( AVAILABLE ?auto_16777 ) ( IN ?auto_16770 ?auto_16775 ) ( ON ?auto_16768 ?auto_16767 ) ( ON ?auto_16769 ?auto_16768 ) ( not ( = ?auto_16767 ?auto_16768 ) ) ( not ( = ?auto_16767 ?auto_16769 ) ) ( not ( = ?auto_16767 ?auto_16770 ) ) ( not ( = ?auto_16767 ?auto_16771 ) ) ( not ( = ?auto_16767 ?auto_16774 ) ) ( not ( = ?auto_16768 ?auto_16769 ) ) ( not ( = ?auto_16768 ?auto_16770 ) ) ( not ( = ?auto_16768 ?auto_16771 ) ) ( not ( = ?auto_16768 ?auto_16774 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16769 ?auto_16770 ?auto_16771 )
      ( MAKE-4CRATE-VERIFY ?auto_16767 ?auto_16768 ?auto_16769 ?auto_16770 ?auto_16771 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16778 - SURFACE
      ?auto_16779 - SURFACE
    )
    :vars
    (
      ?auto_16785 - HOIST
      ?auto_16780 - PLACE
      ?auto_16786 - SURFACE
      ?auto_16784 - PLACE
      ?auto_16781 - HOIST
      ?auto_16782 - SURFACE
      ?auto_16783 - TRUCK
      ?auto_16787 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16785 ?auto_16780 ) ( IS-CRATE ?auto_16779 ) ( not ( = ?auto_16778 ?auto_16779 ) ) ( not ( = ?auto_16786 ?auto_16778 ) ) ( not ( = ?auto_16786 ?auto_16779 ) ) ( not ( = ?auto_16784 ?auto_16780 ) ) ( HOIST-AT ?auto_16781 ?auto_16784 ) ( not ( = ?auto_16785 ?auto_16781 ) ) ( AVAILABLE ?auto_16781 ) ( SURFACE-AT ?auto_16779 ?auto_16784 ) ( ON ?auto_16779 ?auto_16782 ) ( CLEAR ?auto_16779 ) ( not ( = ?auto_16778 ?auto_16782 ) ) ( not ( = ?auto_16779 ?auto_16782 ) ) ( not ( = ?auto_16786 ?auto_16782 ) ) ( SURFACE-AT ?auto_16786 ?auto_16780 ) ( CLEAR ?auto_16786 ) ( IS-CRATE ?auto_16778 ) ( AVAILABLE ?auto_16785 ) ( IN ?auto_16778 ?auto_16783 ) ( TRUCK-AT ?auto_16783 ?auto_16787 ) ( not ( = ?auto_16787 ?auto_16780 ) ) ( not ( = ?auto_16784 ?auto_16787 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16783 ?auto_16787 ?auto_16780 )
      ( MAKE-2CRATE ?auto_16786 ?auto_16778 ?auto_16779 )
      ( MAKE-1CRATE-VERIFY ?auto_16778 ?auto_16779 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16788 - SURFACE
      ?auto_16789 - SURFACE
      ?auto_16790 - SURFACE
    )
    :vars
    (
      ?auto_16793 - HOIST
      ?auto_16791 - PLACE
      ?auto_16792 - PLACE
      ?auto_16796 - HOIST
      ?auto_16797 - SURFACE
      ?auto_16794 - TRUCK
      ?auto_16795 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16793 ?auto_16791 ) ( IS-CRATE ?auto_16790 ) ( not ( = ?auto_16789 ?auto_16790 ) ) ( not ( = ?auto_16788 ?auto_16789 ) ) ( not ( = ?auto_16788 ?auto_16790 ) ) ( not ( = ?auto_16792 ?auto_16791 ) ) ( HOIST-AT ?auto_16796 ?auto_16792 ) ( not ( = ?auto_16793 ?auto_16796 ) ) ( AVAILABLE ?auto_16796 ) ( SURFACE-AT ?auto_16790 ?auto_16792 ) ( ON ?auto_16790 ?auto_16797 ) ( CLEAR ?auto_16790 ) ( not ( = ?auto_16789 ?auto_16797 ) ) ( not ( = ?auto_16790 ?auto_16797 ) ) ( not ( = ?auto_16788 ?auto_16797 ) ) ( SURFACE-AT ?auto_16788 ?auto_16791 ) ( CLEAR ?auto_16788 ) ( IS-CRATE ?auto_16789 ) ( AVAILABLE ?auto_16793 ) ( IN ?auto_16789 ?auto_16794 ) ( TRUCK-AT ?auto_16794 ?auto_16795 ) ( not ( = ?auto_16795 ?auto_16791 ) ) ( not ( = ?auto_16792 ?auto_16795 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16789 ?auto_16790 )
      ( MAKE-2CRATE-VERIFY ?auto_16788 ?auto_16789 ?auto_16790 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16798 - SURFACE
      ?auto_16799 - SURFACE
      ?auto_16800 - SURFACE
      ?auto_16801 - SURFACE
    )
    :vars
    (
      ?auto_16806 - HOIST
      ?auto_16802 - PLACE
      ?auto_16808 - PLACE
      ?auto_16804 - HOIST
      ?auto_16805 - SURFACE
      ?auto_16803 - TRUCK
      ?auto_16807 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16806 ?auto_16802 ) ( IS-CRATE ?auto_16801 ) ( not ( = ?auto_16800 ?auto_16801 ) ) ( not ( = ?auto_16799 ?auto_16800 ) ) ( not ( = ?auto_16799 ?auto_16801 ) ) ( not ( = ?auto_16808 ?auto_16802 ) ) ( HOIST-AT ?auto_16804 ?auto_16808 ) ( not ( = ?auto_16806 ?auto_16804 ) ) ( AVAILABLE ?auto_16804 ) ( SURFACE-AT ?auto_16801 ?auto_16808 ) ( ON ?auto_16801 ?auto_16805 ) ( CLEAR ?auto_16801 ) ( not ( = ?auto_16800 ?auto_16805 ) ) ( not ( = ?auto_16801 ?auto_16805 ) ) ( not ( = ?auto_16799 ?auto_16805 ) ) ( SURFACE-AT ?auto_16799 ?auto_16802 ) ( CLEAR ?auto_16799 ) ( IS-CRATE ?auto_16800 ) ( AVAILABLE ?auto_16806 ) ( IN ?auto_16800 ?auto_16803 ) ( TRUCK-AT ?auto_16803 ?auto_16807 ) ( not ( = ?auto_16807 ?auto_16802 ) ) ( not ( = ?auto_16808 ?auto_16807 ) ) ( ON ?auto_16799 ?auto_16798 ) ( not ( = ?auto_16798 ?auto_16799 ) ) ( not ( = ?auto_16798 ?auto_16800 ) ) ( not ( = ?auto_16798 ?auto_16801 ) ) ( not ( = ?auto_16798 ?auto_16805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16799 ?auto_16800 ?auto_16801 )
      ( MAKE-3CRATE-VERIFY ?auto_16798 ?auto_16799 ?auto_16800 ?auto_16801 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16809 - SURFACE
      ?auto_16810 - SURFACE
      ?auto_16811 - SURFACE
      ?auto_16812 - SURFACE
      ?auto_16813 - SURFACE
    )
    :vars
    (
      ?auto_16818 - HOIST
      ?auto_16814 - PLACE
      ?auto_16820 - PLACE
      ?auto_16816 - HOIST
      ?auto_16817 - SURFACE
      ?auto_16815 - TRUCK
      ?auto_16819 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16818 ?auto_16814 ) ( IS-CRATE ?auto_16813 ) ( not ( = ?auto_16812 ?auto_16813 ) ) ( not ( = ?auto_16811 ?auto_16812 ) ) ( not ( = ?auto_16811 ?auto_16813 ) ) ( not ( = ?auto_16820 ?auto_16814 ) ) ( HOIST-AT ?auto_16816 ?auto_16820 ) ( not ( = ?auto_16818 ?auto_16816 ) ) ( AVAILABLE ?auto_16816 ) ( SURFACE-AT ?auto_16813 ?auto_16820 ) ( ON ?auto_16813 ?auto_16817 ) ( CLEAR ?auto_16813 ) ( not ( = ?auto_16812 ?auto_16817 ) ) ( not ( = ?auto_16813 ?auto_16817 ) ) ( not ( = ?auto_16811 ?auto_16817 ) ) ( SURFACE-AT ?auto_16811 ?auto_16814 ) ( CLEAR ?auto_16811 ) ( IS-CRATE ?auto_16812 ) ( AVAILABLE ?auto_16818 ) ( IN ?auto_16812 ?auto_16815 ) ( TRUCK-AT ?auto_16815 ?auto_16819 ) ( not ( = ?auto_16819 ?auto_16814 ) ) ( not ( = ?auto_16820 ?auto_16819 ) ) ( ON ?auto_16810 ?auto_16809 ) ( ON ?auto_16811 ?auto_16810 ) ( not ( = ?auto_16809 ?auto_16810 ) ) ( not ( = ?auto_16809 ?auto_16811 ) ) ( not ( = ?auto_16809 ?auto_16812 ) ) ( not ( = ?auto_16809 ?auto_16813 ) ) ( not ( = ?auto_16809 ?auto_16817 ) ) ( not ( = ?auto_16810 ?auto_16811 ) ) ( not ( = ?auto_16810 ?auto_16812 ) ) ( not ( = ?auto_16810 ?auto_16813 ) ) ( not ( = ?auto_16810 ?auto_16817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16811 ?auto_16812 ?auto_16813 )
      ( MAKE-4CRATE-VERIFY ?auto_16809 ?auto_16810 ?auto_16811 ?auto_16812 ?auto_16813 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16821 - SURFACE
      ?auto_16822 - SURFACE
    )
    :vars
    (
      ?auto_16828 - HOIST
      ?auto_16824 - PLACE
      ?auto_16823 - SURFACE
      ?auto_16830 - PLACE
      ?auto_16826 - HOIST
      ?auto_16827 - SURFACE
      ?auto_16825 - TRUCK
      ?auto_16829 - PLACE
      ?auto_16831 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16828 ?auto_16824 ) ( IS-CRATE ?auto_16822 ) ( not ( = ?auto_16821 ?auto_16822 ) ) ( not ( = ?auto_16823 ?auto_16821 ) ) ( not ( = ?auto_16823 ?auto_16822 ) ) ( not ( = ?auto_16830 ?auto_16824 ) ) ( HOIST-AT ?auto_16826 ?auto_16830 ) ( not ( = ?auto_16828 ?auto_16826 ) ) ( AVAILABLE ?auto_16826 ) ( SURFACE-AT ?auto_16822 ?auto_16830 ) ( ON ?auto_16822 ?auto_16827 ) ( CLEAR ?auto_16822 ) ( not ( = ?auto_16821 ?auto_16827 ) ) ( not ( = ?auto_16822 ?auto_16827 ) ) ( not ( = ?auto_16823 ?auto_16827 ) ) ( SURFACE-AT ?auto_16823 ?auto_16824 ) ( CLEAR ?auto_16823 ) ( IS-CRATE ?auto_16821 ) ( AVAILABLE ?auto_16828 ) ( TRUCK-AT ?auto_16825 ?auto_16829 ) ( not ( = ?auto_16829 ?auto_16824 ) ) ( not ( = ?auto_16830 ?auto_16829 ) ) ( HOIST-AT ?auto_16831 ?auto_16829 ) ( LIFTING ?auto_16831 ?auto_16821 ) ( not ( = ?auto_16828 ?auto_16831 ) ) ( not ( = ?auto_16826 ?auto_16831 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16831 ?auto_16821 ?auto_16825 ?auto_16829 )
      ( MAKE-2CRATE ?auto_16823 ?auto_16821 ?auto_16822 )
      ( MAKE-1CRATE-VERIFY ?auto_16821 ?auto_16822 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16832 - SURFACE
      ?auto_16833 - SURFACE
      ?auto_16834 - SURFACE
    )
    :vars
    (
      ?auto_16840 - HOIST
      ?auto_16837 - PLACE
      ?auto_16836 - PLACE
      ?auto_16842 - HOIST
      ?auto_16838 - SURFACE
      ?auto_16839 - TRUCK
      ?auto_16841 - PLACE
      ?auto_16835 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16840 ?auto_16837 ) ( IS-CRATE ?auto_16834 ) ( not ( = ?auto_16833 ?auto_16834 ) ) ( not ( = ?auto_16832 ?auto_16833 ) ) ( not ( = ?auto_16832 ?auto_16834 ) ) ( not ( = ?auto_16836 ?auto_16837 ) ) ( HOIST-AT ?auto_16842 ?auto_16836 ) ( not ( = ?auto_16840 ?auto_16842 ) ) ( AVAILABLE ?auto_16842 ) ( SURFACE-AT ?auto_16834 ?auto_16836 ) ( ON ?auto_16834 ?auto_16838 ) ( CLEAR ?auto_16834 ) ( not ( = ?auto_16833 ?auto_16838 ) ) ( not ( = ?auto_16834 ?auto_16838 ) ) ( not ( = ?auto_16832 ?auto_16838 ) ) ( SURFACE-AT ?auto_16832 ?auto_16837 ) ( CLEAR ?auto_16832 ) ( IS-CRATE ?auto_16833 ) ( AVAILABLE ?auto_16840 ) ( TRUCK-AT ?auto_16839 ?auto_16841 ) ( not ( = ?auto_16841 ?auto_16837 ) ) ( not ( = ?auto_16836 ?auto_16841 ) ) ( HOIST-AT ?auto_16835 ?auto_16841 ) ( LIFTING ?auto_16835 ?auto_16833 ) ( not ( = ?auto_16840 ?auto_16835 ) ) ( not ( = ?auto_16842 ?auto_16835 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16833 ?auto_16834 )
      ( MAKE-2CRATE-VERIFY ?auto_16832 ?auto_16833 ?auto_16834 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16843 - SURFACE
      ?auto_16844 - SURFACE
      ?auto_16845 - SURFACE
      ?auto_16846 - SURFACE
    )
    :vars
    (
      ?auto_16853 - HOIST
      ?auto_16851 - PLACE
      ?auto_16849 - PLACE
      ?auto_16848 - HOIST
      ?auto_16850 - SURFACE
      ?auto_16852 - TRUCK
      ?auto_16854 - PLACE
      ?auto_16847 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16853 ?auto_16851 ) ( IS-CRATE ?auto_16846 ) ( not ( = ?auto_16845 ?auto_16846 ) ) ( not ( = ?auto_16844 ?auto_16845 ) ) ( not ( = ?auto_16844 ?auto_16846 ) ) ( not ( = ?auto_16849 ?auto_16851 ) ) ( HOIST-AT ?auto_16848 ?auto_16849 ) ( not ( = ?auto_16853 ?auto_16848 ) ) ( AVAILABLE ?auto_16848 ) ( SURFACE-AT ?auto_16846 ?auto_16849 ) ( ON ?auto_16846 ?auto_16850 ) ( CLEAR ?auto_16846 ) ( not ( = ?auto_16845 ?auto_16850 ) ) ( not ( = ?auto_16846 ?auto_16850 ) ) ( not ( = ?auto_16844 ?auto_16850 ) ) ( SURFACE-AT ?auto_16844 ?auto_16851 ) ( CLEAR ?auto_16844 ) ( IS-CRATE ?auto_16845 ) ( AVAILABLE ?auto_16853 ) ( TRUCK-AT ?auto_16852 ?auto_16854 ) ( not ( = ?auto_16854 ?auto_16851 ) ) ( not ( = ?auto_16849 ?auto_16854 ) ) ( HOIST-AT ?auto_16847 ?auto_16854 ) ( LIFTING ?auto_16847 ?auto_16845 ) ( not ( = ?auto_16853 ?auto_16847 ) ) ( not ( = ?auto_16848 ?auto_16847 ) ) ( ON ?auto_16844 ?auto_16843 ) ( not ( = ?auto_16843 ?auto_16844 ) ) ( not ( = ?auto_16843 ?auto_16845 ) ) ( not ( = ?auto_16843 ?auto_16846 ) ) ( not ( = ?auto_16843 ?auto_16850 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16844 ?auto_16845 ?auto_16846 )
      ( MAKE-3CRATE-VERIFY ?auto_16843 ?auto_16844 ?auto_16845 ?auto_16846 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16855 - SURFACE
      ?auto_16856 - SURFACE
      ?auto_16857 - SURFACE
      ?auto_16858 - SURFACE
      ?auto_16859 - SURFACE
    )
    :vars
    (
      ?auto_16866 - HOIST
      ?auto_16864 - PLACE
      ?auto_16862 - PLACE
      ?auto_16861 - HOIST
      ?auto_16863 - SURFACE
      ?auto_16865 - TRUCK
      ?auto_16867 - PLACE
      ?auto_16860 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16866 ?auto_16864 ) ( IS-CRATE ?auto_16859 ) ( not ( = ?auto_16858 ?auto_16859 ) ) ( not ( = ?auto_16857 ?auto_16858 ) ) ( not ( = ?auto_16857 ?auto_16859 ) ) ( not ( = ?auto_16862 ?auto_16864 ) ) ( HOIST-AT ?auto_16861 ?auto_16862 ) ( not ( = ?auto_16866 ?auto_16861 ) ) ( AVAILABLE ?auto_16861 ) ( SURFACE-AT ?auto_16859 ?auto_16862 ) ( ON ?auto_16859 ?auto_16863 ) ( CLEAR ?auto_16859 ) ( not ( = ?auto_16858 ?auto_16863 ) ) ( not ( = ?auto_16859 ?auto_16863 ) ) ( not ( = ?auto_16857 ?auto_16863 ) ) ( SURFACE-AT ?auto_16857 ?auto_16864 ) ( CLEAR ?auto_16857 ) ( IS-CRATE ?auto_16858 ) ( AVAILABLE ?auto_16866 ) ( TRUCK-AT ?auto_16865 ?auto_16867 ) ( not ( = ?auto_16867 ?auto_16864 ) ) ( not ( = ?auto_16862 ?auto_16867 ) ) ( HOIST-AT ?auto_16860 ?auto_16867 ) ( LIFTING ?auto_16860 ?auto_16858 ) ( not ( = ?auto_16866 ?auto_16860 ) ) ( not ( = ?auto_16861 ?auto_16860 ) ) ( ON ?auto_16856 ?auto_16855 ) ( ON ?auto_16857 ?auto_16856 ) ( not ( = ?auto_16855 ?auto_16856 ) ) ( not ( = ?auto_16855 ?auto_16857 ) ) ( not ( = ?auto_16855 ?auto_16858 ) ) ( not ( = ?auto_16855 ?auto_16859 ) ) ( not ( = ?auto_16855 ?auto_16863 ) ) ( not ( = ?auto_16856 ?auto_16857 ) ) ( not ( = ?auto_16856 ?auto_16858 ) ) ( not ( = ?auto_16856 ?auto_16859 ) ) ( not ( = ?auto_16856 ?auto_16863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16857 ?auto_16858 ?auto_16859 )
      ( MAKE-4CRATE-VERIFY ?auto_16855 ?auto_16856 ?auto_16857 ?auto_16858 ?auto_16859 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16868 - SURFACE
      ?auto_16869 - SURFACE
    )
    :vars
    (
      ?auto_16876 - HOIST
      ?auto_16874 - PLACE
      ?auto_16877 - SURFACE
      ?auto_16872 - PLACE
      ?auto_16871 - HOIST
      ?auto_16873 - SURFACE
      ?auto_16875 - TRUCK
      ?auto_16878 - PLACE
      ?auto_16870 - HOIST
      ?auto_16879 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16876 ?auto_16874 ) ( IS-CRATE ?auto_16869 ) ( not ( = ?auto_16868 ?auto_16869 ) ) ( not ( = ?auto_16877 ?auto_16868 ) ) ( not ( = ?auto_16877 ?auto_16869 ) ) ( not ( = ?auto_16872 ?auto_16874 ) ) ( HOIST-AT ?auto_16871 ?auto_16872 ) ( not ( = ?auto_16876 ?auto_16871 ) ) ( AVAILABLE ?auto_16871 ) ( SURFACE-AT ?auto_16869 ?auto_16872 ) ( ON ?auto_16869 ?auto_16873 ) ( CLEAR ?auto_16869 ) ( not ( = ?auto_16868 ?auto_16873 ) ) ( not ( = ?auto_16869 ?auto_16873 ) ) ( not ( = ?auto_16877 ?auto_16873 ) ) ( SURFACE-AT ?auto_16877 ?auto_16874 ) ( CLEAR ?auto_16877 ) ( IS-CRATE ?auto_16868 ) ( AVAILABLE ?auto_16876 ) ( TRUCK-AT ?auto_16875 ?auto_16878 ) ( not ( = ?auto_16878 ?auto_16874 ) ) ( not ( = ?auto_16872 ?auto_16878 ) ) ( HOIST-AT ?auto_16870 ?auto_16878 ) ( not ( = ?auto_16876 ?auto_16870 ) ) ( not ( = ?auto_16871 ?auto_16870 ) ) ( AVAILABLE ?auto_16870 ) ( SURFACE-AT ?auto_16868 ?auto_16878 ) ( ON ?auto_16868 ?auto_16879 ) ( CLEAR ?auto_16868 ) ( not ( = ?auto_16868 ?auto_16879 ) ) ( not ( = ?auto_16869 ?auto_16879 ) ) ( not ( = ?auto_16877 ?auto_16879 ) ) ( not ( = ?auto_16873 ?auto_16879 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16870 ?auto_16868 ?auto_16879 ?auto_16878 )
      ( MAKE-2CRATE ?auto_16877 ?auto_16868 ?auto_16869 )
      ( MAKE-1CRATE-VERIFY ?auto_16868 ?auto_16869 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16880 - SURFACE
      ?auto_16881 - SURFACE
      ?auto_16882 - SURFACE
    )
    :vars
    (
      ?auto_16885 - HOIST
      ?auto_16886 - PLACE
      ?auto_16888 - PLACE
      ?auto_16883 - HOIST
      ?auto_16891 - SURFACE
      ?auto_16884 - TRUCK
      ?auto_16887 - PLACE
      ?auto_16890 - HOIST
      ?auto_16889 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16885 ?auto_16886 ) ( IS-CRATE ?auto_16882 ) ( not ( = ?auto_16881 ?auto_16882 ) ) ( not ( = ?auto_16880 ?auto_16881 ) ) ( not ( = ?auto_16880 ?auto_16882 ) ) ( not ( = ?auto_16888 ?auto_16886 ) ) ( HOIST-AT ?auto_16883 ?auto_16888 ) ( not ( = ?auto_16885 ?auto_16883 ) ) ( AVAILABLE ?auto_16883 ) ( SURFACE-AT ?auto_16882 ?auto_16888 ) ( ON ?auto_16882 ?auto_16891 ) ( CLEAR ?auto_16882 ) ( not ( = ?auto_16881 ?auto_16891 ) ) ( not ( = ?auto_16882 ?auto_16891 ) ) ( not ( = ?auto_16880 ?auto_16891 ) ) ( SURFACE-AT ?auto_16880 ?auto_16886 ) ( CLEAR ?auto_16880 ) ( IS-CRATE ?auto_16881 ) ( AVAILABLE ?auto_16885 ) ( TRUCK-AT ?auto_16884 ?auto_16887 ) ( not ( = ?auto_16887 ?auto_16886 ) ) ( not ( = ?auto_16888 ?auto_16887 ) ) ( HOIST-AT ?auto_16890 ?auto_16887 ) ( not ( = ?auto_16885 ?auto_16890 ) ) ( not ( = ?auto_16883 ?auto_16890 ) ) ( AVAILABLE ?auto_16890 ) ( SURFACE-AT ?auto_16881 ?auto_16887 ) ( ON ?auto_16881 ?auto_16889 ) ( CLEAR ?auto_16881 ) ( not ( = ?auto_16881 ?auto_16889 ) ) ( not ( = ?auto_16882 ?auto_16889 ) ) ( not ( = ?auto_16880 ?auto_16889 ) ) ( not ( = ?auto_16891 ?auto_16889 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16881 ?auto_16882 )
      ( MAKE-2CRATE-VERIFY ?auto_16880 ?auto_16881 ?auto_16882 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16892 - SURFACE
      ?auto_16893 - SURFACE
      ?auto_16894 - SURFACE
      ?auto_16895 - SURFACE
    )
    :vars
    (
      ?auto_16896 - HOIST
      ?auto_16897 - PLACE
      ?auto_16903 - PLACE
      ?auto_16900 - HOIST
      ?auto_16904 - SURFACE
      ?auto_16899 - TRUCK
      ?auto_16898 - PLACE
      ?auto_16901 - HOIST
      ?auto_16902 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16896 ?auto_16897 ) ( IS-CRATE ?auto_16895 ) ( not ( = ?auto_16894 ?auto_16895 ) ) ( not ( = ?auto_16893 ?auto_16894 ) ) ( not ( = ?auto_16893 ?auto_16895 ) ) ( not ( = ?auto_16903 ?auto_16897 ) ) ( HOIST-AT ?auto_16900 ?auto_16903 ) ( not ( = ?auto_16896 ?auto_16900 ) ) ( AVAILABLE ?auto_16900 ) ( SURFACE-AT ?auto_16895 ?auto_16903 ) ( ON ?auto_16895 ?auto_16904 ) ( CLEAR ?auto_16895 ) ( not ( = ?auto_16894 ?auto_16904 ) ) ( not ( = ?auto_16895 ?auto_16904 ) ) ( not ( = ?auto_16893 ?auto_16904 ) ) ( SURFACE-AT ?auto_16893 ?auto_16897 ) ( CLEAR ?auto_16893 ) ( IS-CRATE ?auto_16894 ) ( AVAILABLE ?auto_16896 ) ( TRUCK-AT ?auto_16899 ?auto_16898 ) ( not ( = ?auto_16898 ?auto_16897 ) ) ( not ( = ?auto_16903 ?auto_16898 ) ) ( HOIST-AT ?auto_16901 ?auto_16898 ) ( not ( = ?auto_16896 ?auto_16901 ) ) ( not ( = ?auto_16900 ?auto_16901 ) ) ( AVAILABLE ?auto_16901 ) ( SURFACE-AT ?auto_16894 ?auto_16898 ) ( ON ?auto_16894 ?auto_16902 ) ( CLEAR ?auto_16894 ) ( not ( = ?auto_16894 ?auto_16902 ) ) ( not ( = ?auto_16895 ?auto_16902 ) ) ( not ( = ?auto_16893 ?auto_16902 ) ) ( not ( = ?auto_16904 ?auto_16902 ) ) ( ON ?auto_16893 ?auto_16892 ) ( not ( = ?auto_16892 ?auto_16893 ) ) ( not ( = ?auto_16892 ?auto_16894 ) ) ( not ( = ?auto_16892 ?auto_16895 ) ) ( not ( = ?auto_16892 ?auto_16904 ) ) ( not ( = ?auto_16892 ?auto_16902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16893 ?auto_16894 ?auto_16895 )
      ( MAKE-3CRATE-VERIFY ?auto_16892 ?auto_16893 ?auto_16894 ?auto_16895 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16905 - SURFACE
      ?auto_16906 - SURFACE
      ?auto_16907 - SURFACE
      ?auto_16908 - SURFACE
      ?auto_16909 - SURFACE
    )
    :vars
    (
      ?auto_16910 - HOIST
      ?auto_16911 - PLACE
      ?auto_16917 - PLACE
      ?auto_16914 - HOIST
      ?auto_16918 - SURFACE
      ?auto_16913 - TRUCK
      ?auto_16912 - PLACE
      ?auto_16915 - HOIST
      ?auto_16916 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16910 ?auto_16911 ) ( IS-CRATE ?auto_16909 ) ( not ( = ?auto_16908 ?auto_16909 ) ) ( not ( = ?auto_16907 ?auto_16908 ) ) ( not ( = ?auto_16907 ?auto_16909 ) ) ( not ( = ?auto_16917 ?auto_16911 ) ) ( HOIST-AT ?auto_16914 ?auto_16917 ) ( not ( = ?auto_16910 ?auto_16914 ) ) ( AVAILABLE ?auto_16914 ) ( SURFACE-AT ?auto_16909 ?auto_16917 ) ( ON ?auto_16909 ?auto_16918 ) ( CLEAR ?auto_16909 ) ( not ( = ?auto_16908 ?auto_16918 ) ) ( not ( = ?auto_16909 ?auto_16918 ) ) ( not ( = ?auto_16907 ?auto_16918 ) ) ( SURFACE-AT ?auto_16907 ?auto_16911 ) ( CLEAR ?auto_16907 ) ( IS-CRATE ?auto_16908 ) ( AVAILABLE ?auto_16910 ) ( TRUCK-AT ?auto_16913 ?auto_16912 ) ( not ( = ?auto_16912 ?auto_16911 ) ) ( not ( = ?auto_16917 ?auto_16912 ) ) ( HOIST-AT ?auto_16915 ?auto_16912 ) ( not ( = ?auto_16910 ?auto_16915 ) ) ( not ( = ?auto_16914 ?auto_16915 ) ) ( AVAILABLE ?auto_16915 ) ( SURFACE-AT ?auto_16908 ?auto_16912 ) ( ON ?auto_16908 ?auto_16916 ) ( CLEAR ?auto_16908 ) ( not ( = ?auto_16908 ?auto_16916 ) ) ( not ( = ?auto_16909 ?auto_16916 ) ) ( not ( = ?auto_16907 ?auto_16916 ) ) ( not ( = ?auto_16918 ?auto_16916 ) ) ( ON ?auto_16906 ?auto_16905 ) ( ON ?auto_16907 ?auto_16906 ) ( not ( = ?auto_16905 ?auto_16906 ) ) ( not ( = ?auto_16905 ?auto_16907 ) ) ( not ( = ?auto_16905 ?auto_16908 ) ) ( not ( = ?auto_16905 ?auto_16909 ) ) ( not ( = ?auto_16905 ?auto_16918 ) ) ( not ( = ?auto_16905 ?auto_16916 ) ) ( not ( = ?auto_16906 ?auto_16907 ) ) ( not ( = ?auto_16906 ?auto_16908 ) ) ( not ( = ?auto_16906 ?auto_16909 ) ) ( not ( = ?auto_16906 ?auto_16918 ) ) ( not ( = ?auto_16906 ?auto_16916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16907 ?auto_16908 ?auto_16909 )
      ( MAKE-4CRATE-VERIFY ?auto_16905 ?auto_16906 ?auto_16907 ?auto_16908 ?auto_16909 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16919 - SURFACE
      ?auto_16920 - SURFACE
    )
    :vars
    (
      ?auto_16921 - HOIST
      ?auto_16922 - PLACE
      ?auto_16928 - SURFACE
      ?auto_16929 - PLACE
      ?auto_16925 - HOIST
      ?auto_16930 - SURFACE
      ?auto_16923 - PLACE
      ?auto_16926 - HOIST
      ?auto_16927 - SURFACE
      ?auto_16924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16921 ?auto_16922 ) ( IS-CRATE ?auto_16920 ) ( not ( = ?auto_16919 ?auto_16920 ) ) ( not ( = ?auto_16928 ?auto_16919 ) ) ( not ( = ?auto_16928 ?auto_16920 ) ) ( not ( = ?auto_16929 ?auto_16922 ) ) ( HOIST-AT ?auto_16925 ?auto_16929 ) ( not ( = ?auto_16921 ?auto_16925 ) ) ( AVAILABLE ?auto_16925 ) ( SURFACE-AT ?auto_16920 ?auto_16929 ) ( ON ?auto_16920 ?auto_16930 ) ( CLEAR ?auto_16920 ) ( not ( = ?auto_16919 ?auto_16930 ) ) ( not ( = ?auto_16920 ?auto_16930 ) ) ( not ( = ?auto_16928 ?auto_16930 ) ) ( SURFACE-AT ?auto_16928 ?auto_16922 ) ( CLEAR ?auto_16928 ) ( IS-CRATE ?auto_16919 ) ( AVAILABLE ?auto_16921 ) ( not ( = ?auto_16923 ?auto_16922 ) ) ( not ( = ?auto_16929 ?auto_16923 ) ) ( HOIST-AT ?auto_16926 ?auto_16923 ) ( not ( = ?auto_16921 ?auto_16926 ) ) ( not ( = ?auto_16925 ?auto_16926 ) ) ( AVAILABLE ?auto_16926 ) ( SURFACE-AT ?auto_16919 ?auto_16923 ) ( ON ?auto_16919 ?auto_16927 ) ( CLEAR ?auto_16919 ) ( not ( = ?auto_16919 ?auto_16927 ) ) ( not ( = ?auto_16920 ?auto_16927 ) ) ( not ( = ?auto_16928 ?auto_16927 ) ) ( not ( = ?auto_16930 ?auto_16927 ) ) ( TRUCK-AT ?auto_16924 ?auto_16922 ) )
    :subtasks
    ( ( !DRIVE ?auto_16924 ?auto_16922 ?auto_16923 )
      ( MAKE-2CRATE ?auto_16928 ?auto_16919 ?auto_16920 )
      ( MAKE-1CRATE-VERIFY ?auto_16919 ?auto_16920 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16931 - SURFACE
      ?auto_16932 - SURFACE
      ?auto_16933 - SURFACE
    )
    :vars
    (
      ?auto_16940 - HOIST
      ?auto_16941 - PLACE
      ?auto_16938 - PLACE
      ?auto_16934 - HOIST
      ?auto_16935 - SURFACE
      ?auto_16937 - PLACE
      ?auto_16942 - HOIST
      ?auto_16939 - SURFACE
      ?auto_16936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16940 ?auto_16941 ) ( IS-CRATE ?auto_16933 ) ( not ( = ?auto_16932 ?auto_16933 ) ) ( not ( = ?auto_16931 ?auto_16932 ) ) ( not ( = ?auto_16931 ?auto_16933 ) ) ( not ( = ?auto_16938 ?auto_16941 ) ) ( HOIST-AT ?auto_16934 ?auto_16938 ) ( not ( = ?auto_16940 ?auto_16934 ) ) ( AVAILABLE ?auto_16934 ) ( SURFACE-AT ?auto_16933 ?auto_16938 ) ( ON ?auto_16933 ?auto_16935 ) ( CLEAR ?auto_16933 ) ( not ( = ?auto_16932 ?auto_16935 ) ) ( not ( = ?auto_16933 ?auto_16935 ) ) ( not ( = ?auto_16931 ?auto_16935 ) ) ( SURFACE-AT ?auto_16931 ?auto_16941 ) ( CLEAR ?auto_16931 ) ( IS-CRATE ?auto_16932 ) ( AVAILABLE ?auto_16940 ) ( not ( = ?auto_16937 ?auto_16941 ) ) ( not ( = ?auto_16938 ?auto_16937 ) ) ( HOIST-AT ?auto_16942 ?auto_16937 ) ( not ( = ?auto_16940 ?auto_16942 ) ) ( not ( = ?auto_16934 ?auto_16942 ) ) ( AVAILABLE ?auto_16942 ) ( SURFACE-AT ?auto_16932 ?auto_16937 ) ( ON ?auto_16932 ?auto_16939 ) ( CLEAR ?auto_16932 ) ( not ( = ?auto_16932 ?auto_16939 ) ) ( not ( = ?auto_16933 ?auto_16939 ) ) ( not ( = ?auto_16931 ?auto_16939 ) ) ( not ( = ?auto_16935 ?auto_16939 ) ) ( TRUCK-AT ?auto_16936 ?auto_16941 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16932 ?auto_16933 )
      ( MAKE-2CRATE-VERIFY ?auto_16931 ?auto_16932 ?auto_16933 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16943 - SURFACE
      ?auto_16944 - SURFACE
      ?auto_16945 - SURFACE
      ?auto_16946 - SURFACE
    )
    :vars
    (
      ?auto_16954 - HOIST
      ?auto_16949 - PLACE
      ?auto_16952 - PLACE
      ?auto_16953 - HOIST
      ?auto_16948 - SURFACE
      ?auto_16955 - PLACE
      ?auto_16947 - HOIST
      ?auto_16951 - SURFACE
      ?auto_16950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16954 ?auto_16949 ) ( IS-CRATE ?auto_16946 ) ( not ( = ?auto_16945 ?auto_16946 ) ) ( not ( = ?auto_16944 ?auto_16945 ) ) ( not ( = ?auto_16944 ?auto_16946 ) ) ( not ( = ?auto_16952 ?auto_16949 ) ) ( HOIST-AT ?auto_16953 ?auto_16952 ) ( not ( = ?auto_16954 ?auto_16953 ) ) ( AVAILABLE ?auto_16953 ) ( SURFACE-AT ?auto_16946 ?auto_16952 ) ( ON ?auto_16946 ?auto_16948 ) ( CLEAR ?auto_16946 ) ( not ( = ?auto_16945 ?auto_16948 ) ) ( not ( = ?auto_16946 ?auto_16948 ) ) ( not ( = ?auto_16944 ?auto_16948 ) ) ( SURFACE-AT ?auto_16944 ?auto_16949 ) ( CLEAR ?auto_16944 ) ( IS-CRATE ?auto_16945 ) ( AVAILABLE ?auto_16954 ) ( not ( = ?auto_16955 ?auto_16949 ) ) ( not ( = ?auto_16952 ?auto_16955 ) ) ( HOIST-AT ?auto_16947 ?auto_16955 ) ( not ( = ?auto_16954 ?auto_16947 ) ) ( not ( = ?auto_16953 ?auto_16947 ) ) ( AVAILABLE ?auto_16947 ) ( SURFACE-AT ?auto_16945 ?auto_16955 ) ( ON ?auto_16945 ?auto_16951 ) ( CLEAR ?auto_16945 ) ( not ( = ?auto_16945 ?auto_16951 ) ) ( not ( = ?auto_16946 ?auto_16951 ) ) ( not ( = ?auto_16944 ?auto_16951 ) ) ( not ( = ?auto_16948 ?auto_16951 ) ) ( TRUCK-AT ?auto_16950 ?auto_16949 ) ( ON ?auto_16944 ?auto_16943 ) ( not ( = ?auto_16943 ?auto_16944 ) ) ( not ( = ?auto_16943 ?auto_16945 ) ) ( not ( = ?auto_16943 ?auto_16946 ) ) ( not ( = ?auto_16943 ?auto_16948 ) ) ( not ( = ?auto_16943 ?auto_16951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16944 ?auto_16945 ?auto_16946 )
      ( MAKE-3CRATE-VERIFY ?auto_16943 ?auto_16944 ?auto_16945 ?auto_16946 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16956 - SURFACE
      ?auto_16957 - SURFACE
      ?auto_16958 - SURFACE
      ?auto_16959 - SURFACE
      ?auto_16960 - SURFACE
    )
    :vars
    (
      ?auto_16968 - HOIST
      ?auto_16963 - PLACE
      ?auto_16966 - PLACE
      ?auto_16967 - HOIST
      ?auto_16962 - SURFACE
      ?auto_16969 - PLACE
      ?auto_16961 - HOIST
      ?auto_16965 - SURFACE
      ?auto_16964 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16968 ?auto_16963 ) ( IS-CRATE ?auto_16960 ) ( not ( = ?auto_16959 ?auto_16960 ) ) ( not ( = ?auto_16958 ?auto_16959 ) ) ( not ( = ?auto_16958 ?auto_16960 ) ) ( not ( = ?auto_16966 ?auto_16963 ) ) ( HOIST-AT ?auto_16967 ?auto_16966 ) ( not ( = ?auto_16968 ?auto_16967 ) ) ( AVAILABLE ?auto_16967 ) ( SURFACE-AT ?auto_16960 ?auto_16966 ) ( ON ?auto_16960 ?auto_16962 ) ( CLEAR ?auto_16960 ) ( not ( = ?auto_16959 ?auto_16962 ) ) ( not ( = ?auto_16960 ?auto_16962 ) ) ( not ( = ?auto_16958 ?auto_16962 ) ) ( SURFACE-AT ?auto_16958 ?auto_16963 ) ( CLEAR ?auto_16958 ) ( IS-CRATE ?auto_16959 ) ( AVAILABLE ?auto_16968 ) ( not ( = ?auto_16969 ?auto_16963 ) ) ( not ( = ?auto_16966 ?auto_16969 ) ) ( HOIST-AT ?auto_16961 ?auto_16969 ) ( not ( = ?auto_16968 ?auto_16961 ) ) ( not ( = ?auto_16967 ?auto_16961 ) ) ( AVAILABLE ?auto_16961 ) ( SURFACE-AT ?auto_16959 ?auto_16969 ) ( ON ?auto_16959 ?auto_16965 ) ( CLEAR ?auto_16959 ) ( not ( = ?auto_16959 ?auto_16965 ) ) ( not ( = ?auto_16960 ?auto_16965 ) ) ( not ( = ?auto_16958 ?auto_16965 ) ) ( not ( = ?auto_16962 ?auto_16965 ) ) ( TRUCK-AT ?auto_16964 ?auto_16963 ) ( ON ?auto_16957 ?auto_16956 ) ( ON ?auto_16958 ?auto_16957 ) ( not ( = ?auto_16956 ?auto_16957 ) ) ( not ( = ?auto_16956 ?auto_16958 ) ) ( not ( = ?auto_16956 ?auto_16959 ) ) ( not ( = ?auto_16956 ?auto_16960 ) ) ( not ( = ?auto_16956 ?auto_16962 ) ) ( not ( = ?auto_16956 ?auto_16965 ) ) ( not ( = ?auto_16957 ?auto_16958 ) ) ( not ( = ?auto_16957 ?auto_16959 ) ) ( not ( = ?auto_16957 ?auto_16960 ) ) ( not ( = ?auto_16957 ?auto_16962 ) ) ( not ( = ?auto_16957 ?auto_16965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16958 ?auto_16959 ?auto_16960 )
      ( MAKE-4CRATE-VERIFY ?auto_16956 ?auto_16957 ?auto_16958 ?auto_16959 ?auto_16960 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16970 - SURFACE
      ?auto_16971 - SURFACE
    )
    :vars
    (
      ?auto_16980 - HOIST
      ?auto_16975 - PLACE
      ?auto_16972 - SURFACE
      ?auto_16978 - PLACE
      ?auto_16979 - HOIST
      ?auto_16974 - SURFACE
      ?auto_16981 - PLACE
      ?auto_16973 - HOIST
      ?auto_16977 - SURFACE
      ?auto_16976 - TRUCK
      ?auto_16982 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16980 ?auto_16975 ) ( IS-CRATE ?auto_16971 ) ( not ( = ?auto_16970 ?auto_16971 ) ) ( not ( = ?auto_16972 ?auto_16970 ) ) ( not ( = ?auto_16972 ?auto_16971 ) ) ( not ( = ?auto_16978 ?auto_16975 ) ) ( HOIST-AT ?auto_16979 ?auto_16978 ) ( not ( = ?auto_16980 ?auto_16979 ) ) ( AVAILABLE ?auto_16979 ) ( SURFACE-AT ?auto_16971 ?auto_16978 ) ( ON ?auto_16971 ?auto_16974 ) ( CLEAR ?auto_16971 ) ( not ( = ?auto_16970 ?auto_16974 ) ) ( not ( = ?auto_16971 ?auto_16974 ) ) ( not ( = ?auto_16972 ?auto_16974 ) ) ( IS-CRATE ?auto_16970 ) ( not ( = ?auto_16981 ?auto_16975 ) ) ( not ( = ?auto_16978 ?auto_16981 ) ) ( HOIST-AT ?auto_16973 ?auto_16981 ) ( not ( = ?auto_16980 ?auto_16973 ) ) ( not ( = ?auto_16979 ?auto_16973 ) ) ( AVAILABLE ?auto_16973 ) ( SURFACE-AT ?auto_16970 ?auto_16981 ) ( ON ?auto_16970 ?auto_16977 ) ( CLEAR ?auto_16970 ) ( not ( = ?auto_16970 ?auto_16977 ) ) ( not ( = ?auto_16971 ?auto_16977 ) ) ( not ( = ?auto_16972 ?auto_16977 ) ) ( not ( = ?auto_16974 ?auto_16977 ) ) ( TRUCK-AT ?auto_16976 ?auto_16975 ) ( SURFACE-AT ?auto_16982 ?auto_16975 ) ( CLEAR ?auto_16982 ) ( LIFTING ?auto_16980 ?auto_16972 ) ( IS-CRATE ?auto_16972 ) ( not ( = ?auto_16982 ?auto_16972 ) ) ( not ( = ?auto_16970 ?auto_16982 ) ) ( not ( = ?auto_16971 ?auto_16982 ) ) ( not ( = ?auto_16974 ?auto_16982 ) ) ( not ( = ?auto_16977 ?auto_16982 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16982 ?auto_16972 )
      ( MAKE-2CRATE ?auto_16972 ?auto_16970 ?auto_16971 )
      ( MAKE-1CRATE-VERIFY ?auto_16970 ?auto_16971 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16983 - SURFACE
      ?auto_16984 - SURFACE
      ?auto_16985 - SURFACE
    )
    :vars
    (
      ?auto_16988 - HOIST
      ?auto_16995 - PLACE
      ?auto_16987 - PLACE
      ?auto_16986 - HOIST
      ?auto_16994 - SURFACE
      ?auto_16991 - PLACE
      ?auto_16992 - HOIST
      ?auto_16989 - SURFACE
      ?auto_16993 - TRUCK
      ?auto_16990 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16988 ?auto_16995 ) ( IS-CRATE ?auto_16985 ) ( not ( = ?auto_16984 ?auto_16985 ) ) ( not ( = ?auto_16983 ?auto_16984 ) ) ( not ( = ?auto_16983 ?auto_16985 ) ) ( not ( = ?auto_16987 ?auto_16995 ) ) ( HOIST-AT ?auto_16986 ?auto_16987 ) ( not ( = ?auto_16988 ?auto_16986 ) ) ( AVAILABLE ?auto_16986 ) ( SURFACE-AT ?auto_16985 ?auto_16987 ) ( ON ?auto_16985 ?auto_16994 ) ( CLEAR ?auto_16985 ) ( not ( = ?auto_16984 ?auto_16994 ) ) ( not ( = ?auto_16985 ?auto_16994 ) ) ( not ( = ?auto_16983 ?auto_16994 ) ) ( IS-CRATE ?auto_16984 ) ( not ( = ?auto_16991 ?auto_16995 ) ) ( not ( = ?auto_16987 ?auto_16991 ) ) ( HOIST-AT ?auto_16992 ?auto_16991 ) ( not ( = ?auto_16988 ?auto_16992 ) ) ( not ( = ?auto_16986 ?auto_16992 ) ) ( AVAILABLE ?auto_16992 ) ( SURFACE-AT ?auto_16984 ?auto_16991 ) ( ON ?auto_16984 ?auto_16989 ) ( CLEAR ?auto_16984 ) ( not ( = ?auto_16984 ?auto_16989 ) ) ( not ( = ?auto_16985 ?auto_16989 ) ) ( not ( = ?auto_16983 ?auto_16989 ) ) ( not ( = ?auto_16994 ?auto_16989 ) ) ( TRUCK-AT ?auto_16993 ?auto_16995 ) ( SURFACE-AT ?auto_16990 ?auto_16995 ) ( CLEAR ?auto_16990 ) ( LIFTING ?auto_16988 ?auto_16983 ) ( IS-CRATE ?auto_16983 ) ( not ( = ?auto_16990 ?auto_16983 ) ) ( not ( = ?auto_16984 ?auto_16990 ) ) ( not ( = ?auto_16985 ?auto_16990 ) ) ( not ( = ?auto_16994 ?auto_16990 ) ) ( not ( = ?auto_16989 ?auto_16990 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16984 ?auto_16985 )
      ( MAKE-2CRATE-VERIFY ?auto_16983 ?auto_16984 ?auto_16985 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16996 - SURFACE
      ?auto_16997 - SURFACE
      ?auto_16998 - SURFACE
      ?auto_16999 - SURFACE
    )
    :vars
    (
      ?auto_17001 - HOIST
      ?auto_17008 - PLACE
      ?auto_17005 - PLACE
      ?auto_17003 - HOIST
      ?auto_17002 - SURFACE
      ?auto_17000 - PLACE
      ?auto_17006 - HOIST
      ?auto_17004 - SURFACE
      ?auto_17007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17001 ?auto_17008 ) ( IS-CRATE ?auto_16999 ) ( not ( = ?auto_16998 ?auto_16999 ) ) ( not ( = ?auto_16997 ?auto_16998 ) ) ( not ( = ?auto_16997 ?auto_16999 ) ) ( not ( = ?auto_17005 ?auto_17008 ) ) ( HOIST-AT ?auto_17003 ?auto_17005 ) ( not ( = ?auto_17001 ?auto_17003 ) ) ( AVAILABLE ?auto_17003 ) ( SURFACE-AT ?auto_16999 ?auto_17005 ) ( ON ?auto_16999 ?auto_17002 ) ( CLEAR ?auto_16999 ) ( not ( = ?auto_16998 ?auto_17002 ) ) ( not ( = ?auto_16999 ?auto_17002 ) ) ( not ( = ?auto_16997 ?auto_17002 ) ) ( IS-CRATE ?auto_16998 ) ( not ( = ?auto_17000 ?auto_17008 ) ) ( not ( = ?auto_17005 ?auto_17000 ) ) ( HOIST-AT ?auto_17006 ?auto_17000 ) ( not ( = ?auto_17001 ?auto_17006 ) ) ( not ( = ?auto_17003 ?auto_17006 ) ) ( AVAILABLE ?auto_17006 ) ( SURFACE-AT ?auto_16998 ?auto_17000 ) ( ON ?auto_16998 ?auto_17004 ) ( CLEAR ?auto_16998 ) ( not ( = ?auto_16998 ?auto_17004 ) ) ( not ( = ?auto_16999 ?auto_17004 ) ) ( not ( = ?auto_16997 ?auto_17004 ) ) ( not ( = ?auto_17002 ?auto_17004 ) ) ( TRUCK-AT ?auto_17007 ?auto_17008 ) ( SURFACE-AT ?auto_16996 ?auto_17008 ) ( CLEAR ?auto_16996 ) ( LIFTING ?auto_17001 ?auto_16997 ) ( IS-CRATE ?auto_16997 ) ( not ( = ?auto_16996 ?auto_16997 ) ) ( not ( = ?auto_16998 ?auto_16996 ) ) ( not ( = ?auto_16999 ?auto_16996 ) ) ( not ( = ?auto_17002 ?auto_16996 ) ) ( not ( = ?auto_17004 ?auto_16996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16997 ?auto_16998 ?auto_16999 )
      ( MAKE-3CRATE-VERIFY ?auto_16996 ?auto_16997 ?auto_16998 ?auto_16999 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17009 - SURFACE
      ?auto_17010 - SURFACE
      ?auto_17011 - SURFACE
      ?auto_17012 - SURFACE
      ?auto_17013 - SURFACE
    )
    :vars
    (
      ?auto_17015 - HOIST
      ?auto_17022 - PLACE
      ?auto_17019 - PLACE
      ?auto_17017 - HOIST
      ?auto_17016 - SURFACE
      ?auto_17014 - PLACE
      ?auto_17020 - HOIST
      ?auto_17018 - SURFACE
      ?auto_17021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17015 ?auto_17022 ) ( IS-CRATE ?auto_17013 ) ( not ( = ?auto_17012 ?auto_17013 ) ) ( not ( = ?auto_17011 ?auto_17012 ) ) ( not ( = ?auto_17011 ?auto_17013 ) ) ( not ( = ?auto_17019 ?auto_17022 ) ) ( HOIST-AT ?auto_17017 ?auto_17019 ) ( not ( = ?auto_17015 ?auto_17017 ) ) ( AVAILABLE ?auto_17017 ) ( SURFACE-AT ?auto_17013 ?auto_17019 ) ( ON ?auto_17013 ?auto_17016 ) ( CLEAR ?auto_17013 ) ( not ( = ?auto_17012 ?auto_17016 ) ) ( not ( = ?auto_17013 ?auto_17016 ) ) ( not ( = ?auto_17011 ?auto_17016 ) ) ( IS-CRATE ?auto_17012 ) ( not ( = ?auto_17014 ?auto_17022 ) ) ( not ( = ?auto_17019 ?auto_17014 ) ) ( HOIST-AT ?auto_17020 ?auto_17014 ) ( not ( = ?auto_17015 ?auto_17020 ) ) ( not ( = ?auto_17017 ?auto_17020 ) ) ( AVAILABLE ?auto_17020 ) ( SURFACE-AT ?auto_17012 ?auto_17014 ) ( ON ?auto_17012 ?auto_17018 ) ( CLEAR ?auto_17012 ) ( not ( = ?auto_17012 ?auto_17018 ) ) ( not ( = ?auto_17013 ?auto_17018 ) ) ( not ( = ?auto_17011 ?auto_17018 ) ) ( not ( = ?auto_17016 ?auto_17018 ) ) ( TRUCK-AT ?auto_17021 ?auto_17022 ) ( SURFACE-AT ?auto_17010 ?auto_17022 ) ( CLEAR ?auto_17010 ) ( LIFTING ?auto_17015 ?auto_17011 ) ( IS-CRATE ?auto_17011 ) ( not ( = ?auto_17010 ?auto_17011 ) ) ( not ( = ?auto_17012 ?auto_17010 ) ) ( not ( = ?auto_17013 ?auto_17010 ) ) ( not ( = ?auto_17016 ?auto_17010 ) ) ( not ( = ?auto_17018 ?auto_17010 ) ) ( ON ?auto_17010 ?auto_17009 ) ( not ( = ?auto_17009 ?auto_17010 ) ) ( not ( = ?auto_17009 ?auto_17011 ) ) ( not ( = ?auto_17009 ?auto_17012 ) ) ( not ( = ?auto_17009 ?auto_17013 ) ) ( not ( = ?auto_17009 ?auto_17016 ) ) ( not ( = ?auto_17009 ?auto_17018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17011 ?auto_17012 ?auto_17013 )
      ( MAKE-4CRATE-VERIFY ?auto_17009 ?auto_17010 ?auto_17011 ?auto_17012 ?auto_17013 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17023 - SURFACE
      ?auto_17024 - SURFACE
    )
    :vars
    (
      ?auto_17026 - HOIST
      ?auto_17035 - PLACE
      ?auto_17030 - SURFACE
      ?auto_17031 - PLACE
      ?auto_17028 - HOIST
      ?auto_17027 - SURFACE
      ?auto_17025 - PLACE
      ?auto_17033 - HOIST
      ?auto_17029 - SURFACE
      ?auto_17034 - TRUCK
      ?auto_17032 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17026 ?auto_17035 ) ( IS-CRATE ?auto_17024 ) ( not ( = ?auto_17023 ?auto_17024 ) ) ( not ( = ?auto_17030 ?auto_17023 ) ) ( not ( = ?auto_17030 ?auto_17024 ) ) ( not ( = ?auto_17031 ?auto_17035 ) ) ( HOIST-AT ?auto_17028 ?auto_17031 ) ( not ( = ?auto_17026 ?auto_17028 ) ) ( AVAILABLE ?auto_17028 ) ( SURFACE-AT ?auto_17024 ?auto_17031 ) ( ON ?auto_17024 ?auto_17027 ) ( CLEAR ?auto_17024 ) ( not ( = ?auto_17023 ?auto_17027 ) ) ( not ( = ?auto_17024 ?auto_17027 ) ) ( not ( = ?auto_17030 ?auto_17027 ) ) ( IS-CRATE ?auto_17023 ) ( not ( = ?auto_17025 ?auto_17035 ) ) ( not ( = ?auto_17031 ?auto_17025 ) ) ( HOIST-AT ?auto_17033 ?auto_17025 ) ( not ( = ?auto_17026 ?auto_17033 ) ) ( not ( = ?auto_17028 ?auto_17033 ) ) ( AVAILABLE ?auto_17033 ) ( SURFACE-AT ?auto_17023 ?auto_17025 ) ( ON ?auto_17023 ?auto_17029 ) ( CLEAR ?auto_17023 ) ( not ( = ?auto_17023 ?auto_17029 ) ) ( not ( = ?auto_17024 ?auto_17029 ) ) ( not ( = ?auto_17030 ?auto_17029 ) ) ( not ( = ?auto_17027 ?auto_17029 ) ) ( TRUCK-AT ?auto_17034 ?auto_17035 ) ( SURFACE-AT ?auto_17032 ?auto_17035 ) ( CLEAR ?auto_17032 ) ( IS-CRATE ?auto_17030 ) ( not ( = ?auto_17032 ?auto_17030 ) ) ( not ( = ?auto_17023 ?auto_17032 ) ) ( not ( = ?auto_17024 ?auto_17032 ) ) ( not ( = ?auto_17027 ?auto_17032 ) ) ( not ( = ?auto_17029 ?auto_17032 ) ) ( AVAILABLE ?auto_17026 ) ( IN ?auto_17030 ?auto_17034 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17026 ?auto_17030 ?auto_17034 ?auto_17035 )
      ( MAKE-2CRATE ?auto_17030 ?auto_17023 ?auto_17024 )
      ( MAKE-1CRATE-VERIFY ?auto_17023 ?auto_17024 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17036 - SURFACE
      ?auto_17037 - SURFACE
      ?auto_17038 - SURFACE
    )
    :vars
    (
      ?auto_17040 - HOIST
      ?auto_17048 - PLACE
      ?auto_17047 - PLACE
      ?auto_17044 - HOIST
      ?auto_17039 - SURFACE
      ?auto_17043 - PLACE
      ?auto_17045 - HOIST
      ?auto_17046 - SURFACE
      ?auto_17042 - TRUCK
      ?auto_17041 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17040 ?auto_17048 ) ( IS-CRATE ?auto_17038 ) ( not ( = ?auto_17037 ?auto_17038 ) ) ( not ( = ?auto_17036 ?auto_17037 ) ) ( not ( = ?auto_17036 ?auto_17038 ) ) ( not ( = ?auto_17047 ?auto_17048 ) ) ( HOIST-AT ?auto_17044 ?auto_17047 ) ( not ( = ?auto_17040 ?auto_17044 ) ) ( AVAILABLE ?auto_17044 ) ( SURFACE-AT ?auto_17038 ?auto_17047 ) ( ON ?auto_17038 ?auto_17039 ) ( CLEAR ?auto_17038 ) ( not ( = ?auto_17037 ?auto_17039 ) ) ( not ( = ?auto_17038 ?auto_17039 ) ) ( not ( = ?auto_17036 ?auto_17039 ) ) ( IS-CRATE ?auto_17037 ) ( not ( = ?auto_17043 ?auto_17048 ) ) ( not ( = ?auto_17047 ?auto_17043 ) ) ( HOIST-AT ?auto_17045 ?auto_17043 ) ( not ( = ?auto_17040 ?auto_17045 ) ) ( not ( = ?auto_17044 ?auto_17045 ) ) ( AVAILABLE ?auto_17045 ) ( SURFACE-AT ?auto_17037 ?auto_17043 ) ( ON ?auto_17037 ?auto_17046 ) ( CLEAR ?auto_17037 ) ( not ( = ?auto_17037 ?auto_17046 ) ) ( not ( = ?auto_17038 ?auto_17046 ) ) ( not ( = ?auto_17036 ?auto_17046 ) ) ( not ( = ?auto_17039 ?auto_17046 ) ) ( TRUCK-AT ?auto_17042 ?auto_17048 ) ( SURFACE-AT ?auto_17041 ?auto_17048 ) ( CLEAR ?auto_17041 ) ( IS-CRATE ?auto_17036 ) ( not ( = ?auto_17041 ?auto_17036 ) ) ( not ( = ?auto_17037 ?auto_17041 ) ) ( not ( = ?auto_17038 ?auto_17041 ) ) ( not ( = ?auto_17039 ?auto_17041 ) ) ( not ( = ?auto_17046 ?auto_17041 ) ) ( AVAILABLE ?auto_17040 ) ( IN ?auto_17036 ?auto_17042 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17037 ?auto_17038 )
      ( MAKE-2CRATE-VERIFY ?auto_17036 ?auto_17037 ?auto_17038 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17049 - SURFACE
      ?auto_17050 - SURFACE
      ?auto_17051 - SURFACE
      ?auto_17052 - SURFACE
    )
    :vars
    (
      ?auto_17061 - HOIST
      ?auto_17060 - PLACE
      ?auto_17054 - PLACE
      ?auto_17057 - HOIST
      ?auto_17055 - SURFACE
      ?auto_17053 - PLACE
      ?auto_17059 - HOIST
      ?auto_17056 - SURFACE
      ?auto_17058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17061 ?auto_17060 ) ( IS-CRATE ?auto_17052 ) ( not ( = ?auto_17051 ?auto_17052 ) ) ( not ( = ?auto_17050 ?auto_17051 ) ) ( not ( = ?auto_17050 ?auto_17052 ) ) ( not ( = ?auto_17054 ?auto_17060 ) ) ( HOIST-AT ?auto_17057 ?auto_17054 ) ( not ( = ?auto_17061 ?auto_17057 ) ) ( AVAILABLE ?auto_17057 ) ( SURFACE-AT ?auto_17052 ?auto_17054 ) ( ON ?auto_17052 ?auto_17055 ) ( CLEAR ?auto_17052 ) ( not ( = ?auto_17051 ?auto_17055 ) ) ( not ( = ?auto_17052 ?auto_17055 ) ) ( not ( = ?auto_17050 ?auto_17055 ) ) ( IS-CRATE ?auto_17051 ) ( not ( = ?auto_17053 ?auto_17060 ) ) ( not ( = ?auto_17054 ?auto_17053 ) ) ( HOIST-AT ?auto_17059 ?auto_17053 ) ( not ( = ?auto_17061 ?auto_17059 ) ) ( not ( = ?auto_17057 ?auto_17059 ) ) ( AVAILABLE ?auto_17059 ) ( SURFACE-AT ?auto_17051 ?auto_17053 ) ( ON ?auto_17051 ?auto_17056 ) ( CLEAR ?auto_17051 ) ( not ( = ?auto_17051 ?auto_17056 ) ) ( not ( = ?auto_17052 ?auto_17056 ) ) ( not ( = ?auto_17050 ?auto_17056 ) ) ( not ( = ?auto_17055 ?auto_17056 ) ) ( TRUCK-AT ?auto_17058 ?auto_17060 ) ( SURFACE-AT ?auto_17049 ?auto_17060 ) ( CLEAR ?auto_17049 ) ( IS-CRATE ?auto_17050 ) ( not ( = ?auto_17049 ?auto_17050 ) ) ( not ( = ?auto_17051 ?auto_17049 ) ) ( not ( = ?auto_17052 ?auto_17049 ) ) ( not ( = ?auto_17055 ?auto_17049 ) ) ( not ( = ?auto_17056 ?auto_17049 ) ) ( AVAILABLE ?auto_17061 ) ( IN ?auto_17050 ?auto_17058 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17050 ?auto_17051 ?auto_17052 )
      ( MAKE-3CRATE-VERIFY ?auto_17049 ?auto_17050 ?auto_17051 ?auto_17052 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17062 - SURFACE
      ?auto_17063 - SURFACE
      ?auto_17064 - SURFACE
      ?auto_17065 - SURFACE
      ?auto_17066 - SURFACE
    )
    :vars
    (
      ?auto_17075 - HOIST
      ?auto_17074 - PLACE
      ?auto_17068 - PLACE
      ?auto_17071 - HOIST
      ?auto_17069 - SURFACE
      ?auto_17067 - PLACE
      ?auto_17073 - HOIST
      ?auto_17070 - SURFACE
      ?auto_17072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17075 ?auto_17074 ) ( IS-CRATE ?auto_17066 ) ( not ( = ?auto_17065 ?auto_17066 ) ) ( not ( = ?auto_17064 ?auto_17065 ) ) ( not ( = ?auto_17064 ?auto_17066 ) ) ( not ( = ?auto_17068 ?auto_17074 ) ) ( HOIST-AT ?auto_17071 ?auto_17068 ) ( not ( = ?auto_17075 ?auto_17071 ) ) ( AVAILABLE ?auto_17071 ) ( SURFACE-AT ?auto_17066 ?auto_17068 ) ( ON ?auto_17066 ?auto_17069 ) ( CLEAR ?auto_17066 ) ( not ( = ?auto_17065 ?auto_17069 ) ) ( not ( = ?auto_17066 ?auto_17069 ) ) ( not ( = ?auto_17064 ?auto_17069 ) ) ( IS-CRATE ?auto_17065 ) ( not ( = ?auto_17067 ?auto_17074 ) ) ( not ( = ?auto_17068 ?auto_17067 ) ) ( HOIST-AT ?auto_17073 ?auto_17067 ) ( not ( = ?auto_17075 ?auto_17073 ) ) ( not ( = ?auto_17071 ?auto_17073 ) ) ( AVAILABLE ?auto_17073 ) ( SURFACE-AT ?auto_17065 ?auto_17067 ) ( ON ?auto_17065 ?auto_17070 ) ( CLEAR ?auto_17065 ) ( not ( = ?auto_17065 ?auto_17070 ) ) ( not ( = ?auto_17066 ?auto_17070 ) ) ( not ( = ?auto_17064 ?auto_17070 ) ) ( not ( = ?auto_17069 ?auto_17070 ) ) ( TRUCK-AT ?auto_17072 ?auto_17074 ) ( SURFACE-AT ?auto_17063 ?auto_17074 ) ( CLEAR ?auto_17063 ) ( IS-CRATE ?auto_17064 ) ( not ( = ?auto_17063 ?auto_17064 ) ) ( not ( = ?auto_17065 ?auto_17063 ) ) ( not ( = ?auto_17066 ?auto_17063 ) ) ( not ( = ?auto_17069 ?auto_17063 ) ) ( not ( = ?auto_17070 ?auto_17063 ) ) ( AVAILABLE ?auto_17075 ) ( IN ?auto_17064 ?auto_17072 ) ( ON ?auto_17063 ?auto_17062 ) ( not ( = ?auto_17062 ?auto_17063 ) ) ( not ( = ?auto_17062 ?auto_17064 ) ) ( not ( = ?auto_17062 ?auto_17065 ) ) ( not ( = ?auto_17062 ?auto_17066 ) ) ( not ( = ?auto_17062 ?auto_17069 ) ) ( not ( = ?auto_17062 ?auto_17070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17064 ?auto_17065 ?auto_17066 )
      ( MAKE-4CRATE-VERIFY ?auto_17062 ?auto_17063 ?auto_17064 ?auto_17065 ?auto_17066 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17076 - SURFACE
      ?auto_17077 - SURFACE
    )
    :vars
    (
      ?auto_17087 - HOIST
      ?auto_17086 - PLACE
      ?auto_17088 - SURFACE
      ?auto_17080 - PLACE
      ?auto_17083 - HOIST
      ?auto_17081 - SURFACE
      ?auto_17079 - PLACE
      ?auto_17085 - HOIST
      ?auto_17082 - SURFACE
      ?auto_17078 - SURFACE
      ?auto_17084 - TRUCK
      ?auto_17089 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17087 ?auto_17086 ) ( IS-CRATE ?auto_17077 ) ( not ( = ?auto_17076 ?auto_17077 ) ) ( not ( = ?auto_17088 ?auto_17076 ) ) ( not ( = ?auto_17088 ?auto_17077 ) ) ( not ( = ?auto_17080 ?auto_17086 ) ) ( HOIST-AT ?auto_17083 ?auto_17080 ) ( not ( = ?auto_17087 ?auto_17083 ) ) ( AVAILABLE ?auto_17083 ) ( SURFACE-AT ?auto_17077 ?auto_17080 ) ( ON ?auto_17077 ?auto_17081 ) ( CLEAR ?auto_17077 ) ( not ( = ?auto_17076 ?auto_17081 ) ) ( not ( = ?auto_17077 ?auto_17081 ) ) ( not ( = ?auto_17088 ?auto_17081 ) ) ( IS-CRATE ?auto_17076 ) ( not ( = ?auto_17079 ?auto_17086 ) ) ( not ( = ?auto_17080 ?auto_17079 ) ) ( HOIST-AT ?auto_17085 ?auto_17079 ) ( not ( = ?auto_17087 ?auto_17085 ) ) ( not ( = ?auto_17083 ?auto_17085 ) ) ( AVAILABLE ?auto_17085 ) ( SURFACE-AT ?auto_17076 ?auto_17079 ) ( ON ?auto_17076 ?auto_17082 ) ( CLEAR ?auto_17076 ) ( not ( = ?auto_17076 ?auto_17082 ) ) ( not ( = ?auto_17077 ?auto_17082 ) ) ( not ( = ?auto_17088 ?auto_17082 ) ) ( not ( = ?auto_17081 ?auto_17082 ) ) ( SURFACE-AT ?auto_17078 ?auto_17086 ) ( CLEAR ?auto_17078 ) ( IS-CRATE ?auto_17088 ) ( not ( = ?auto_17078 ?auto_17088 ) ) ( not ( = ?auto_17076 ?auto_17078 ) ) ( not ( = ?auto_17077 ?auto_17078 ) ) ( not ( = ?auto_17081 ?auto_17078 ) ) ( not ( = ?auto_17082 ?auto_17078 ) ) ( AVAILABLE ?auto_17087 ) ( IN ?auto_17088 ?auto_17084 ) ( TRUCK-AT ?auto_17084 ?auto_17089 ) ( not ( = ?auto_17089 ?auto_17086 ) ) ( not ( = ?auto_17080 ?auto_17089 ) ) ( not ( = ?auto_17079 ?auto_17089 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17084 ?auto_17089 ?auto_17086 )
      ( MAKE-2CRATE ?auto_17088 ?auto_17076 ?auto_17077 )
      ( MAKE-1CRATE-VERIFY ?auto_17076 ?auto_17077 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17090 - SURFACE
      ?auto_17091 - SURFACE
      ?auto_17092 - SURFACE
    )
    :vars
    (
      ?auto_17095 - HOIST
      ?auto_17096 - PLACE
      ?auto_17101 - PLACE
      ?auto_17097 - HOIST
      ?auto_17093 - SURFACE
      ?auto_17099 - PLACE
      ?auto_17094 - HOIST
      ?auto_17100 - SURFACE
      ?auto_17103 - SURFACE
      ?auto_17098 - TRUCK
      ?auto_17102 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17095 ?auto_17096 ) ( IS-CRATE ?auto_17092 ) ( not ( = ?auto_17091 ?auto_17092 ) ) ( not ( = ?auto_17090 ?auto_17091 ) ) ( not ( = ?auto_17090 ?auto_17092 ) ) ( not ( = ?auto_17101 ?auto_17096 ) ) ( HOIST-AT ?auto_17097 ?auto_17101 ) ( not ( = ?auto_17095 ?auto_17097 ) ) ( AVAILABLE ?auto_17097 ) ( SURFACE-AT ?auto_17092 ?auto_17101 ) ( ON ?auto_17092 ?auto_17093 ) ( CLEAR ?auto_17092 ) ( not ( = ?auto_17091 ?auto_17093 ) ) ( not ( = ?auto_17092 ?auto_17093 ) ) ( not ( = ?auto_17090 ?auto_17093 ) ) ( IS-CRATE ?auto_17091 ) ( not ( = ?auto_17099 ?auto_17096 ) ) ( not ( = ?auto_17101 ?auto_17099 ) ) ( HOIST-AT ?auto_17094 ?auto_17099 ) ( not ( = ?auto_17095 ?auto_17094 ) ) ( not ( = ?auto_17097 ?auto_17094 ) ) ( AVAILABLE ?auto_17094 ) ( SURFACE-AT ?auto_17091 ?auto_17099 ) ( ON ?auto_17091 ?auto_17100 ) ( CLEAR ?auto_17091 ) ( not ( = ?auto_17091 ?auto_17100 ) ) ( not ( = ?auto_17092 ?auto_17100 ) ) ( not ( = ?auto_17090 ?auto_17100 ) ) ( not ( = ?auto_17093 ?auto_17100 ) ) ( SURFACE-AT ?auto_17103 ?auto_17096 ) ( CLEAR ?auto_17103 ) ( IS-CRATE ?auto_17090 ) ( not ( = ?auto_17103 ?auto_17090 ) ) ( not ( = ?auto_17091 ?auto_17103 ) ) ( not ( = ?auto_17092 ?auto_17103 ) ) ( not ( = ?auto_17093 ?auto_17103 ) ) ( not ( = ?auto_17100 ?auto_17103 ) ) ( AVAILABLE ?auto_17095 ) ( IN ?auto_17090 ?auto_17098 ) ( TRUCK-AT ?auto_17098 ?auto_17102 ) ( not ( = ?auto_17102 ?auto_17096 ) ) ( not ( = ?auto_17101 ?auto_17102 ) ) ( not ( = ?auto_17099 ?auto_17102 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17091 ?auto_17092 )
      ( MAKE-2CRATE-VERIFY ?auto_17090 ?auto_17091 ?auto_17092 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17104 - SURFACE
      ?auto_17105 - SURFACE
      ?auto_17106 - SURFACE
      ?auto_17107 - SURFACE
    )
    :vars
    (
      ?auto_17113 - HOIST
      ?auto_17116 - PLACE
      ?auto_17115 - PLACE
      ?auto_17108 - HOIST
      ?auto_17112 - SURFACE
      ?auto_17109 - PLACE
      ?auto_17117 - HOIST
      ?auto_17114 - SURFACE
      ?auto_17110 - TRUCK
      ?auto_17111 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17113 ?auto_17116 ) ( IS-CRATE ?auto_17107 ) ( not ( = ?auto_17106 ?auto_17107 ) ) ( not ( = ?auto_17105 ?auto_17106 ) ) ( not ( = ?auto_17105 ?auto_17107 ) ) ( not ( = ?auto_17115 ?auto_17116 ) ) ( HOIST-AT ?auto_17108 ?auto_17115 ) ( not ( = ?auto_17113 ?auto_17108 ) ) ( AVAILABLE ?auto_17108 ) ( SURFACE-AT ?auto_17107 ?auto_17115 ) ( ON ?auto_17107 ?auto_17112 ) ( CLEAR ?auto_17107 ) ( not ( = ?auto_17106 ?auto_17112 ) ) ( not ( = ?auto_17107 ?auto_17112 ) ) ( not ( = ?auto_17105 ?auto_17112 ) ) ( IS-CRATE ?auto_17106 ) ( not ( = ?auto_17109 ?auto_17116 ) ) ( not ( = ?auto_17115 ?auto_17109 ) ) ( HOIST-AT ?auto_17117 ?auto_17109 ) ( not ( = ?auto_17113 ?auto_17117 ) ) ( not ( = ?auto_17108 ?auto_17117 ) ) ( AVAILABLE ?auto_17117 ) ( SURFACE-AT ?auto_17106 ?auto_17109 ) ( ON ?auto_17106 ?auto_17114 ) ( CLEAR ?auto_17106 ) ( not ( = ?auto_17106 ?auto_17114 ) ) ( not ( = ?auto_17107 ?auto_17114 ) ) ( not ( = ?auto_17105 ?auto_17114 ) ) ( not ( = ?auto_17112 ?auto_17114 ) ) ( SURFACE-AT ?auto_17104 ?auto_17116 ) ( CLEAR ?auto_17104 ) ( IS-CRATE ?auto_17105 ) ( not ( = ?auto_17104 ?auto_17105 ) ) ( not ( = ?auto_17106 ?auto_17104 ) ) ( not ( = ?auto_17107 ?auto_17104 ) ) ( not ( = ?auto_17112 ?auto_17104 ) ) ( not ( = ?auto_17114 ?auto_17104 ) ) ( AVAILABLE ?auto_17113 ) ( IN ?auto_17105 ?auto_17110 ) ( TRUCK-AT ?auto_17110 ?auto_17111 ) ( not ( = ?auto_17111 ?auto_17116 ) ) ( not ( = ?auto_17115 ?auto_17111 ) ) ( not ( = ?auto_17109 ?auto_17111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17105 ?auto_17106 ?auto_17107 )
      ( MAKE-3CRATE-VERIFY ?auto_17104 ?auto_17105 ?auto_17106 ?auto_17107 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17118 - SURFACE
      ?auto_17119 - SURFACE
      ?auto_17120 - SURFACE
      ?auto_17121 - SURFACE
      ?auto_17122 - SURFACE
    )
    :vars
    (
      ?auto_17128 - HOIST
      ?auto_17131 - PLACE
      ?auto_17130 - PLACE
      ?auto_17123 - HOIST
      ?auto_17127 - SURFACE
      ?auto_17124 - PLACE
      ?auto_17132 - HOIST
      ?auto_17129 - SURFACE
      ?auto_17125 - TRUCK
      ?auto_17126 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17128 ?auto_17131 ) ( IS-CRATE ?auto_17122 ) ( not ( = ?auto_17121 ?auto_17122 ) ) ( not ( = ?auto_17120 ?auto_17121 ) ) ( not ( = ?auto_17120 ?auto_17122 ) ) ( not ( = ?auto_17130 ?auto_17131 ) ) ( HOIST-AT ?auto_17123 ?auto_17130 ) ( not ( = ?auto_17128 ?auto_17123 ) ) ( AVAILABLE ?auto_17123 ) ( SURFACE-AT ?auto_17122 ?auto_17130 ) ( ON ?auto_17122 ?auto_17127 ) ( CLEAR ?auto_17122 ) ( not ( = ?auto_17121 ?auto_17127 ) ) ( not ( = ?auto_17122 ?auto_17127 ) ) ( not ( = ?auto_17120 ?auto_17127 ) ) ( IS-CRATE ?auto_17121 ) ( not ( = ?auto_17124 ?auto_17131 ) ) ( not ( = ?auto_17130 ?auto_17124 ) ) ( HOIST-AT ?auto_17132 ?auto_17124 ) ( not ( = ?auto_17128 ?auto_17132 ) ) ( not ( = ?auto_17123 ?auto_17132 ) ) ( AVAILABLE ?auto_17132 ) ( SURFACE-AT ?auto_17121 ?auto_17124 ) ( ON ?auto_17121 ?auto_17129 ) ( CLEAR ?auto_17121 ) ( not ( = ?auto_17121 ?auto_17129 ) ) ( not ( = ?auto_17122 ?auto_17129 ) ) ( not ( = ?auto_17120 ?auto_17129 ) ) ( not ( = ?auto_17127 ?auto_17129 ) ) ( SURFACE-AT ?auto_17119 ?auto_17131 ) ( CLEAR ?auto_17119 ) ( IS-CRATE ?auto_17120 ) ( not ( = ?auto_17119 ?auto_17120 ) ) ( not ( = ?auto_17121 ?auto_17119 ) ) ( not ( = ?auto_17122 ?auto_17119 ) ) ( not ( = ?auto_17127 ?auto_17119 ) ) ( not ( = ?auto_17129 ?auto_17119 ) ) ( AVAILABLE ?auto_17128 ) ( IN ?auto_17120 ?auto_17125 ) ( TRUCK-AT ?auto_17125 ?auto_17126 ) ( not ( = ?auto_17126 ?auto_17131 ) ) ( not ( = ?auto_17130 ?auto_17126 ) ) ( not ( = ?auto_17124 ?auto_17126 ) ) ( ON ?auto_17119 ?auto_17118 ) ( not ( = ?auto_17118 ?auto_17119 ) ) ( not ( = ?auto_17118 ?auto_17120 ) ) ( not ( = ?auto_17118 ?auto_17121 ) ) ( not ( = ?auto_17118 ?auto_17122 ) ) ( not ( = ?auto_17118 ?auto_17127 ) ) ( not ( = ?auto_17118 ?auto_17129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17120 ?auto_17121 ?auto_17122 )
      ( MAKE-4CRATE-VERIFY ?auto_17118 ?auto_17119 ?auto_17120 ?auto_17121 ?auto_17122 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17133 - SURFACE
      ?auto_17134 - SURFACE
    )
    :vars
    (
      ?auto_17141 - HOIST
      ?auto_17145 - PLACE
      ?auto_17135 - SURFACE
      ?auto_17143 - PLACE
      ?auto_17136 - HOIST
      ?auto_17140 - SURFACE
      ?auto_17137 - PLACE
      ?auto_17146 - HOIST
      ?auto_17142 - SURFACE
      ?auto_17144 - SURFACE
      ?auto_17138 - TRUCK
      ?auto_17139 - PLACE
      ?auto_17147 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17141 ?auto_17145 ) ( IS-CRATE ?auto_17134 ) ( not ( = ?auto_17133 ?auto_17134 ) ) ( not ( = ?auto_17135 ?auto_17133 ) ) ( not ( = ?auto_17135 ?auto_17134 ) ) ( not ( = ?auto_17143 ?auto_17145 ) ) ( HOIST-AT ?auto_17136 ?auto_17143 ) ( not ( = ?auto_17141 ?auto_17136 ) ) ( AVAILABLE ?auto_17136 ) ( SURFACE-AT ?auto_17134 ?auto_17143 ) ( ON ?auto_17134 ?auto_17140 ) ( CLEAR ?auto_17134 ) ( not ( = ?auto_17133 ?auto_17140 ) ) ( not ( = ?auto_17134 ?auto_17140 ) ) ( not ( = ?auto_17135 ?auto_17140 ) ) ( IS-CRATE ?auto_17133 ) ( not ( = ?auto_17137 ?auto_17145 ) ) ( not ( = ?auto_17143 ?auto_17137 ) ) ( HOIST-AT ?auto_17146 ?auto_17137 ) ( not ( = ?auto_17141 ?auto_17146 ) ) ( not ( = ?auto_17136 ?auto_17146 ) ) ( AVAILABLE ?auto_17146 ) ( SURFACE-AT ?auto_17133 ?auto_17137 ) ( ON ?auto_17133 ?auto_17142 ) ( CLEAR ?auto_17133 ) ( not ( = ?auto_17133 ?auto_17142 ) ) ( not ( = ?auto_17134 ?auto_17142 ) ) ( not ( = ?auto_17135 ?auto_17142 ) ) ( not ( = ?auto_17140 ?auto_17142 ) ) ( SURFACE-AT ?auto_17144 ?auto_17145 ) ( CLEAR ?auto_17144 ) ( IS-CRATE ?auto_17135 ) ( not ( = ?auto_17144 ?auto_17135 ) ) ( not ( = ?auto_17133 ?auto_17144 ) ) ( not ( = ?auto_17134 ?auto_17144 ) ) ( not ( = ?auto_17140 ?auto_17144 ) ) ( not ( = ?auto_17142 ?auto_17144 ) ) ( AVAILABLE ?auto_17141 ) ( TRUCK-AT ?auto_17138 ?auto_17139 ) ( not ( = ?auto_17139 ?auto_17145 ) ) ( not ( = ?auto_17143 ?auto_17139 ) ) ( not ( = ?auto_17137 ?auto_17139 ) ) ( HOIST-AT ?auto_17147 ?auto_17139 ) ( LIFTING ?auto_17147 ?auto_17135 ) ( not ( = ?auto_17141 ?auto_17147 ) ) ( not ( = ?auto_17136 ?auto_17147 ) ) ( not ( = ?auto_17146 ?auto_17147 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17147 ?auto_17135 ?auto_17138 ?auto_17139 )
      ( MAKE-2CRATE ?auto_17135 ?auto_17133 ?auto_17134 )
      ( MAKE-1CRATE-VERIFY ?auto_17133 ?auto_17134 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17148 - SURFACE
      ?auto_17149 - SURFACE
      ?auto_17150 - SURFACE
    )
    :vars
    (
      ?auto_17154 - HOIST
      ?auto_17160 - PLACE
      ?auto_17151 - PLACE
      ?auto_17155 - HOIST
      ?auto_17152 - SURFACE
      ?auto_17158 - PLACE
      ?auto_17161 - HOIST
      ?auto_17157 - SURFACE
      ?auto_17162 - SURFACE
      ?auto_17153 - TRUCK
      ?auto_17159 - PLACE
      ?auto_17156 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17154 ?auto_17160 ) ( IS-CRATE ?auto_17150 ) ( not ( = ?auto_17149 ?auto_17150 ) ) ( not ( = ?auto_17148 ?auto_17149 ) ) ( not ( = ?auto_17148 ?auto_17150 ) ) ( not ( = ?auto_17151 ?auto_17160 ) ) ( HOIST-AT ?auto_17155 ?auto_17151 ) ( not ( = ?auto_17154 ?auto_17155 ) ) ( AVAILABLE ?auto_17155 ) ( SURFACE-AT ?auto_17150 ?auto_17151 ) ( ON ?auto_17150 ?auto_17152 ) ( CLEAR ?auto_17150 ) ( not ( = ?auto_17149 ?auto_17152 ) ) ( not ( = ?auto_17150 ?auto_17152 ) ) ( not ( = ?auto_17148 ?auto_17152 ) ) ( IS-CRATE ?auto_17149 ) ( not ( = ?auto_17158 ?auto_17160 ) ) ( not ( = ?auto_17151 ?auto_17158 ) ) ( HOIST-AT ?auto_17161 ?auto_17158 ) ( not ( = ?auto_17154 ?auto_17161 ) ) ( not ( = ?auto_17155 ?auto_17161 ) ) ( AVAILABLE ?auto_17161 ) ( SURFACE-AT ?auto_17149 ?auto_17158 ) ( ON ?auto_17149 ?auto_17157 ) ( CLEAR ?auto_17149 ) ( not ( = ?auto_17149 ?auto_17157 ) ) ( not ( = ?auto_17150 ?auto_17157 ) ) ( not ( = ?auto_17148 ?auto_17157 ) ) ( not ( = ?auto_17152 ?auto_17157 ) ) ( SURFACE-AT ?auto_17162 ?auto_17160 ) ( CLEAR ?auto_17162 ) ( IS-CRATE ?auto_17148 ) ( not ( = ?auto_17162 ?auto_17148 ) ) ( not ( = ?auto_17149 ?auto_17162 ) ) ( not ( = ?auto_17150 ?auto_17162 ) ) ( not ( = ?auto_17152 ?auto_17162 ) ) ( not ( = ?auto_17157 ?auto_17162 ) ) ( AVAILABLE ?auto_17154 ) ( TRUCK-AT ?auto_17153 ?auto_17159 ) ( not ( = ?auto_17159 ?auto_17160 ) ) ( not ( = ?auto_17151 ?auto_17159 ) ) ( not ( = ?auto_17158 ?auto_17159 ) ) ( HOIST-AT ?auto_17156 ?auto_17159 ) ( LIFTING ?auto_17156 ?auto_17148 ) ( not ( = ?auto_17154 ?auto_17156 ) ) ( not ( = ?auto_17155 ?auto_17156 ) ) ( not ( = ?auto_17161 ?auto_17156 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17149 ?auto_17150 )
      ( MAKE-2CRATE-VERIFY ?auto_17148 ?auto_17149 ?auto_17150 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17163 - SURFACE
      ?auto_17164 - SURFACE
      ?auto_17165 - SURFACE
      ?auto_17166 - SURFACE
    )
    :vars
    (
      ?auto_17177 - HOIST
      ?auto_17169 - PLACE
      ?auto_17170 - PLACE
      ?auto_17176 - HOIST
      ?auto_17167 - SURFACE
      ?auto_17173 - PLACE
      ?auto_17174 - HOIST
      ?auto_17175 - SURFACE
      ?auto_17172 - TRUCK
      ?auto_17171 - PLACE
      ?auto_17168 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17177 ?auto_17169 ) ( IS-CRATE ?auto_17166 ) ( not ( = ?auto_17165 ?auto_17166 ) ) ( not ( = ?auto_17164 ?auto_17165 ) ) ( not ( = ?auto_17164 ?auto_17166 ) ) ( not ( = ?auto_17170 ?auto_17169 ) ) ( HOIST-AT ?auto_17176 ?auto_17170 ) ( not ( = ?auto_17177 ?auto_17176 ) ) ( AVAILABLE ?auto_17176 ) ( SURFACE-AT ?auto_17166 ?auto_17170 ) ( ON ?auto_17166 ?auto_17167 ) ( CLEAR ?auto_17166 ) ( not ( = ?auto_17165 ?auto_17167 ) ) ( not ( = ?auto_17166 ?auto_17167 ) ) ( not ( = ?auto_17164 ?auto_17167 ) ) ( IS-CRATE ?auto_17165 ) ( not ( = ?auto_17173 ?auto_17169 ) ) ( not ( = ?auto_17170 ?auto_17173 ) ) ( HOIST-AT ?auto_17174 ?auto_17173 ) ( not ( = ?auto_17177 ?auto_17174 ) ) ( not ( = ?auto_17176 ?auto_17174 ) ) ( AVAILABLE ?auto_17174 ) ( SURFACE-AT ?auto_17165 ?auto_17173 ) ( ON ?auto_17165 ?auto_17175 ) ( CLEAR ?auto_17165 ) ( not ( = ?auto_17165 ?auto_17175 ) ) ( not ( = ?auto_17166 ?auto_17175 ) ) ( not ( = ?auto_17164 ?auto_17175 ) ) ( not ( = ?auto_17167 ?auto_17175 ) ) ( SURFACE-AT ?auto_17163 ?auto_17169 ) ( CLEAR ?auto_17163 ) ( IS-CRATE ?auto_17164 ) ( not ( = ?auto_17163 ?auto_17164 ) ) ( not ( = ?auto_17165 ?auto_17163 ) ) ( not ( = ?auto_17166 ?auto_17163 ) ) ( not ( = ?auto_17167 ?auto_17163 ) ) ( not ( = ?auto_17175 ?auto_17163 ) ) ( AVAILABLE ?auto_17177 ) ( TRUCK-AT ?auto_17172 ?auto_17171 ) ( not ( = ?auto_17171 ?auto_17169 ) ) ( not ( = ?auto_17170 ?auto_17171 ) ) ( not ( = ?auto_17173 ?auto_17171 ) ) ( HOIST-AT ?auto_17168 ?auto_17171 ) ( LIFTING ?auto_17168 ?auto_17164 ) ( not ( = ?auto_17177 ?auto_17168 ) ) ( not ( = ?auto_17176 ?auto_17168 ) ) ( not ( = ?auto_17174 ?auto_17168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17164 ?auto_17165 ?auto_17166 )
      ( MAKE-3CRATE-VERIFY ?auto_17163 ?auto_17164 ?auto_17165 ?auto_17166 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17178 - SURFACE
      ?auto_17179 - SURFACE
      ?auto_17180 - SURFACE
      ?auto_17181 - SURFACE
      ?auto_17182 - SURFACE
    )
    :vars
    (
      ?auto_17193 - HOIST
      ?auto_17185 - PLACE
      ?auto_17186 - PLACE
      ?auto_17192 - HOIST
      ?auto_17183 - SURFACE
      ?auto_17189 - PLACE
      ?auto_17190 - HOIST
      ?auto_17191 - SURFACE
      ?auto_17188 - TRUCK
      ?auto_17187 - PLACE
      ?auto_17184 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17193 ?auto_17185 ) ( IS-CRATE ?auto_17182 ) ( not ( = ?auto_17181 ?auto_17182 ) ) ( not ( = ?auto_17180 ?auto_17181 ) ) ( not ( = ?auto_17180 ?auto_17182 ) ) ( not ( = ?auto_17186 ?auto_17185 ) ) ( HOIST-AT ?auto_17192 ?auto_17186 ) ( not ( = ?auto_17193 ?auto_17192 ) ) ( AVAILABLE ?auto_17192 ) ( SURFACE-AT ?auto_17182 ?auto_17186 ) ( ON ?auto_17182 ?auto_17183 ) ( CLEAR ?auto_17182 ) ( not ( = ?auto_17181 ?auto_17183 ) ) ( not ( = ?auto_17182 ?auto_17183 ) ) ( not ( = ?auto_17180 ?auto_17183 ) ) ( IS-CRATE ?auto_17181 ) ( not ( = ?auto_17189 ?auto_17185 ) ) ( not ( = ?auto_17186 ?auto_17189 ) ) ( HOIST-AT ?auto_17190 ?auto_17189 ) ( not ( = ?auto_17193 ?auto_17190 ) ) ( not ( = ?auto_17192 ?auto_17190 ) ) ( AVAILABLE ?auto_17190 ) ( SURFACE-AT ?auto_17181 ?auto_17189 ) ( ON ?auto_17181 ?auto_17191 ) ( CLEAR ?auto_17181 ) ( not ( = ?auto_17181 ?auto_17191 ) ) ( not ( = ?auto_17182 ?auto_17191 ) ) ( not ( = ?auto_17180 ?auto_17191 ) ) ( not ( = ?auto_17183 ?auto_17191 ) ) ( SURFACE-AT ?auto_17179 ?auto_17185 ) ( CLEAR ?auto_17179 ) ( IS-CRATE ?auto_17180 ) ( not ( = ?auto_17179 ?auto_17180 ) ) ( not ( = ?auto_17181 ?auto_17179 ) ) ( not ( = ?auto_17182 ?auto_17179 ) ) ( not ( = ?auto_17183 ?auto_17179 ) ) ( not ( = ?auto_17191 ?auto_17179 ) ) ( AVAILABLE ?auto_17193 ) ( TRUCK-AT ?auto_17188 ?auto_17187 ) ( not ( = ?auto_17187 ?auto_17185 ) ) ( not ( = ?auto_17186 ?auto_17187 ) ) ( not ( = ?auto_17189 ?auto_17187 ) ) ( HOIST-AT ?auto_17184 ?auto_17187 ) ( LIFTING ?auto_17184 ?auto_17180 ) ( not ( = ?auto_17193 ?auto_17184 ) ) ( not ( = ?auto_17192 ?auto_17184 ) ) ( not ( = ?auto_17190 ?auto_17184 ) ) ( ON ?auto_17179 ?auto_17178 ) ( not ( = ?auto_17178 ?auto_17179 ) ) ( not ( = ?auto_17178 ?auto_17180 ) ) ( not ( = ?auto_17178 ?auto_17181 ) ) ( not ( = ?auto_17178 ?auto_17182 ) ) ( not ( = ?auto_17178 ?auto_17183 ) ) ( not ( = ?auto_17178 ?auto_17191 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17180 ?auto_17181 ?auto_17182 )
      ( MAKE-4CRATE-VERIFY ?auto_17178 ?auto_17179 ?auto_17180 ?auto_17181 ?auto_17182 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17194 - SURFACE
      ?auto_17195 - SURFACE
    )
    :vars
    (
      ?auto_17208 - HOIST
      ?auto_17199 - PLACE
      ?auto_17197 - SURFACE
      ?auto_17200 - PLACE
      ?auto_17207 - HOIST
      ?auto_17196 - SURFACE
      ?auto_17203 - PLACE
      ?auto_17205 - HOIST
      ?auto_17206 - SURFACE
      ?auto_17204 - SURFACE
      ?auto_17202 - TRUCK
      ?auto_17201 - PLACE
      ?auto_17198 - HOIST
      ?auto_17209 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17208 ?auto_17199 ) ( IS-CRATE ?auto_17195 ) ( not ( = ?auto_17194 ?auto_17195 ) ) ( not ( = ?auto_17197 ?auto_17194 ) ) ( not ( = ?auto_17197 ?auto_17195 ) ) ( not ( = ?auto_17200 ?auto_17199 ) ) ( HOIST-AT ?auto_17207 ?auto_17200 ) ( not ( = ?auto_17208 ?auto_17207 ) ) ( AVAILABLE ?auto_17207 ) ( SURFACE-AT ?auto_17195 ?auto_17200 ) ( ON ?auto_17195 ?auto_17196 ) ( CLEAR ?auto_17195 ) ( not ( = ?auto_17194 ?auto_17196 ) ) ( not ( = ?auto_17195 ?auto_17196 ) ) ( not ( = ?auto_17197 ?auto_17196 ) ) ( IS-CRATE ?auto_17194 ) ( not ( = ?auto_17203 ?auto_17199 ) ) ( not ( = ?auto_17200 ?auto_17203 ) ) ( HOIST-AT ?auto_17205 ?auto_17203 ) ( not ( = ?auto_17208 ?auto_17205 ) ) ( not ( = ?auto_17207 ?auto_17205 ) ) ( AVAILABLE ?auto_17205 ) ( SURFACE-AT ?auto_17194 ?auto_17203 ) ( ON ?auto_17194 ?auto_17206 ) ( CLEAR ?auto_17194 ) ( not ( = ?auto_17194 ?auto_17206 ) ) ( not ( = ?auto_17195 ?auto_17206 ) ) ( not ( = ?auto_17197 ?auto_17206 ) ) ( not ( = ?auto_17196 ?auto_17206 ) ) ( SURFACE-AT ?auto_17204 ?auto_17199 ) ( CLEAR ?auto_17204 ) ( IS-CRATE ?auto_17197 ) ( not ( = ?auto_17204 ?auto_17197 ) ) ( not ( = ?auto_17194 ?auto_17204 ) ) ( not ( = ?auto_17195 ?auto_17204 ) ) ( not ( = ?auto_17196 ?auto_17204 ) ) ( not ( = ?auto_17206 ?auto_17204 ) ) ( AVAILABLE ?auto_17208 ) ( TRUCK-AT ?auto_17202 ?auto_17201 ) ( not ( = ?auto_17201 ?auto_17199 ) ) ( not ( = ?auto_17200 ?auto_17201 ) ) ( not ( = ?auto_17203 ?auto_17201 ) ) ( HOIST-AT ?auto_17198 ?auto_17201 ) ( not ( = ?auto_17208 ?auto_17198 ) ) ( not ( = ?auto_17207 ?auto_17198 ) ) ( not ( = ?auto_17205 ?auto_17198 ) ) ( AVAILABLE ?auto_17198 ) ( SURFACE-AT ?auto_17197 ?auto_17201 ) ( ON ?auto_17197 ?auto_17209 ) ( CLEAR ?auto_17197 ) ( not ( = ?auto_17194 ?auto_17209 ) ) ( not ( = ?auto_17195 ?auto_17209 ) ) ( not ( = ?auto_17197 ?auto_17209 ) ) ( not ( = ?auto_17196 ?auto_17209 ) ) ( not ( = ?auto_17206 ?auto_17209 ) ) ( not ( = ?auto_17204 ?auto_17209 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17198 ?auto_17197 ?auto_17209 ?auto_17201 )
      ( MAKE-2CRATE ?auto_17197 ?auto_17194 ?auto_17195 )
      ( MAKE-1CRATE-VERIFY ?auto_17194 ?auto_17195 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17210 - SURFACE
      ?auto_17211 - SURFACE
      ?auto_17212 - SURFACE
    )
    :vars
    (
      ?auto_17225 - HOIST
      ?auto_17213 - PLACE
      ?auto_17224 - PLACE
      ?auto_17220 - HOIST
      ?auto_17214 - SURFACE
      ?auto_17221 - PLACE
      ?auto_17219 - HOIST
      ?auto_17217 - SURFACE
      ?auto_17218 - SURFACE
      ?auto_17223 - TRUCK
      ?auto_17222 - PLACE
      ?auto_17215 - HOIST
      ?auto_17216 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17225 ?auto_17213 ) ( IS-CRATE ?auto_17212 ) ( not ( = ?auto_17211 ?auto_17212 ) ) ( not ( = ?auto_17210 ?auto_17211 ) ) ( not ( = ?auto_17210 ?auto_17212 ) ) ( not ( = ?auto_17224 ?auto_17213 ) ) ( HOIST-AT ?auto_17220 ?auto_17224 ) ( not ( = ?auto_17225 ?auto_17220 ) ) ( AVAILABLE ?auto_17220 ) ( SURFACE-AT ?auto_17212 ?auto_17224 ) ( ON ?auto_17212 ?auto_17214 ) ( CLEAR ?auto_17212 ) ( not ( = ?auto_17211 ?auto_17214 ) ) ( not ( = ?auto_17212 ?auto_17214 ) ) ( not ( = ?auto_17210 ?auto_17214 ) ) ( IS-CRATE ?auto_17211 ) ( not ( = ?auto_17221 ?auto_17213 ) ) ( not ( = ?auto_17224 ?auto_17221 ) ) ( HOIST-AT ?auto_17219 ?auto_17221 ) ( not ( = ?auto_17225 ?auto_17219 ) ) ( not ( = ?auto_17220 ?auto_17219 ) ) ( AVAILABLE ?auto_17219 ) ( SURFACE-AT ?auto_17211 ?auto_17221 ) ( ON ?auto_17211 ?auto_17217 ) ( CLEAR ?auto_17211 ) ( not ( = ?auto_17211 ?auto_17217 ) ) ( not ( = ?auto_17212 ?auto_17217 ) ) ( not ( = ?auto_17210 ?auto_17217 ) ) ( not ( = ?auto_17214 ?auto_17217 ) ) ( SURFACE-AT ?auto_17218 ?auto_17213 ) ( CLEAR ?auto_17218 ) ( IS-CRATE ?auto_17210 ) ( not ( = ?auto_17218 ?auto_17210 ) ) ( not ( = ?auto_17211 ?auto_17218 ) ) ( not ( = ?auto_17212 ?auto_17218 ) ) ( not ( = ?auto_17214 ?auto_17218 ) ) ( not ( = ?auto_17217 ?auto_17218 ) ) ( AVAILABLE ?auto_17225 ) ( TRUCK-AT ?auto_17223 ?auto_17222 ) ( not ( = ?auto_17222 ?auto_17213 ) ) ( not ( = ?auto_17224 ?auto_17222 ) ) ( not ( = ?auto_17221 ?auto_17222 ) ) ( HOIST-AT ?auto_17215 ?auto_17222 ) ( not ( = ?auto_17225 ?auto_17215 ) ) ( not ( = ?auto_17220 ?auto_17215 ) ) ( not ( = ?auto_17219 ?auto_17215 ) ) ( AVAILABLE ?auto_17215 ) ( SURFACE-AT ?auto_17210 ?auto_17222 ) ( ON ?auto_17210 ?auto_17216 ) ( CLEAR ?auto_17210 ) ( not ( = ?auto_17211 ?auto_17216 ) ) ( not ( = ?auto_17212 ?auto_17216 ) ) ( not ( = ?auto_17210 ?auto_17216 ) ) ( not ( = ?auto_17214 ?auto_17216 ) ) ( not ( = ?auto_17217 ?auto_17216 ) ) ( not ( = ?auto_17218 ?auto_17216 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17211 ?auto_17212 )
      ( MAKE-2CRATE-VERIFY ?auto_17210 ?auto_17211 ?auto_17212 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17226 - SURFACE
      ?auto_17227 - SURFACE
      ?auto_17228 - SURFACE
      ?auto_17229 - SURFACE
    )
    :vars
    (
      ?auto_17232 - HOIST
      ?auto_17233 - PLACE
      ?auto_17231 - PLACE
      ?auto_17237 - HOIST
      ?auto_17239 - SURFACE
      ?auto_17240 - PLACE
      ?auto_17236 - HOIST
      ?auto_17230 - SURFACE
      ?auto_17234 - TRUCK
      ?auto_17235 - PLACE
      ?auto_17241 - HOIST
      ?auto_17238 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17232 ?auto_17233 ) ( IS-CRATE ?auto_17229 ) ( not ( = ?auto_17228 ?auto_17229 ) ) ( not ( = ?auto_17227 ?auto_17228 ) ) ( not ( = ?auto_17227 ?auto_17229 ) ) ( not ( = ?auto_17231 ?auto_17233 ) ) ( HOIST-AT ?auto_17237 ?auto_17231 ) ( not ( = ?auto_17232 ?auto_17237 ) ) ( AVAILABLE ?auto_17237 ) ( SURFACE-AT ?auto_17229 ?auto_17231 ) ( ON ?auto_17229 ?auto_17239 ) ( CLEAR ?auto_17229 ) ( not ( = ?auto_17228 ?auto_17239 ) ) ( not ( = ?auto_17229 ?auto_17239 ) ) ( not ( = ?auto_17227 ?auto_17239 ) ) ( IS-CRATE ?auto_17228 ) ( not ( = ?auto_17240 ?auto_17233 ) ) ( not ( = ?auto_17231 ?auto_17240 ) ) ( HOIST-AT ?auto_17236 ?auto_17240 ) ( not ( = ?auto_17232 ?auto_17236 ) ) ( not ( = ?auto_17237 ?auto_17236 ) ) ( AVAILABLE ?auto_17236 ) ( SURFACE-AT ?auto_17228 ?auto_17240 ) ( ON ?auto_17228 ?auto_17230 ) ( CLEAR ?auto_17228 ) ( not ( = ?auto_17228 ?auto_17230 ) ) ( not ( = ?auto_17229 ?auto_17230 ) ) ( not ( = ?auto_17227 ?auto_17230 ) ) ( not ( = ?auto_17239 ?auto_17230 ) ) ( SURFACE-AT ?auto_17226 ?auto_17233 ) ( CLEAR ?auto_17226 ) ( IS-CRATE ?auto_17227 ) ( not ( = ?auto_17226 ?auto_17227 ) ) ( not ( = ?auto_17228 ?auto_17226 ) ) ( not ( = ?auto_17229 ?auto_17226 ) ) ( not ( = ?auto_17239 ?auto_17226 ) ) ( not ( = ?auto_17230 ?auto_17226 ) ) ( AVAILABLE ?auto_17232 ) ( TRUCK-AT ?auto_17234 ?auto_17235 ) ( not ( = ?auto_17235 ?auto_17233 ) ) ( not ( = ?auto_17231 ?auto_17235 ) ) ( not ( = ?auto_17240 ?auto_17235 ) ) ( HOIST-AT ?auto_17241 ?auto_17235 ) ( not ( = ?auto_17232 ?auto_17241 ) ) ( not ( = ?auto_17237 ?auto_17241 ) ) ( not ( = ?auto_17236 ?auto_17241 ) ) ( AVAILABLE ?auto_17241 ) ( SURFACE-AT ?auto_17227 ?auto_17235 ) ( ON ?auto_17227 ?auto_17238 ) ( CLEAR ?auto_17227 ) ( not ( = ?auto_17228 ?auto_17238 ) ) ( not ( = ?auto_17229 ?auto_17238 ) ) ( not ( = ?auto_17227 ?auto_17238 ) ) ( not ( = ?auto_17239 ?auto_17238 ) ) ( not ( = ?auto_17230 ?auto_17238 ) ) ( not ( = ?auto_17226 ?auto_17238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17227 ?auto_17228 ?auto_17229 )
      ( MAKE-3CRATE-VERIFY ?auto_17226 ?auto_17227 ?auto_17228 ?auto_17229 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17242 - SURFACE
      ?auto_17243 - SURFACE
      ?auto_17244 - SURFACE
      ?auto_17245 - SURFACE
      ?auto_17246 - SURFACE
    )
    :vars
    (
      ?auto_17249 - HOIST
      ?auto_17250 - PLACE
      ?auto_17248 - PLACE
      ?auto_17254 - HOIST
      ?auto_17256 - SURFACE
      ?auto_17257 - PLACE
      ?auto_17253 - HOIST
      ?auto_17247 - SURFACE
      ?auto_17251 - TRUCK
      ?auto_17252 - PLACE
      ?auto_17258 - HOIST
      ?auto_17255 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17249 ?auto_17250 ) ( IS-CRATE ?auto_17246 ) ( not ( = ?auto_17245 ?auto_17246 ) ) ( not ( = ?auto_17244 ?auto_17245 ) ) ( not ( = ?auto_17244 ?auto_17246 ) ) ( not ( = ?auto_17248 ?auto_17250 ) ) ( HOIST-AT ?auto_17254 ?auto_17248 ) ( not ( = ?auto_17249 ?auto_17254 ) ) ( AVAILABLE ?auto_17254 ) ( SURFACE-AT ?auto_17246 ?auto_17248 ) ( ON ?auto_17246 ?auto_17256 ) ( CLEAR ?auto_17246 ) ( not ( = ?auto_17245 ?auto_17256 ) ) ( not ( = ?auto_17246 ?auto_17256 ) ) ( not ( = ?auto_17244 ?auto_17256 ) ) ( IS-CRATE ?auto_17245 ) ( not ( = ?auto_17257 ?auto_17250 ) ) ( not ( = ?auto_17248 ?auto_17257 ) ) ( HOIST-AT ?auto_17253 ?auto_17257 ) ( not ( = ?auto_17249 ?auto_17253 ) ) ( not ( = ?auto_17254 ?auto_17253 ) ) ( AVAILABLE ?auto_17253 ) ( SURFACE-AT ?auto_17245 ?auto_17257 ) ( ON ?auto_17245 ?auto_17247 ) ( CLEAR ?auto_17245 ) ( not ( = ?auto_17245 ?auto_17247 ) ) ( not ( = ?auto_17246 ?auto_17247 ) ) ( not ( = ?auto_17244 ?auto_17247 ) ) ( not ( = ?auto_17256 ?auto_17247 ) ) ( SURFACE-AT ?auto_17243 ?auto_17250 ) ( CLEAR ?auto_17243 ) ( IS-CRATE ?auto_17244 ) ( not ( = ?auto_17243 ?auto_17244 ) ) ( not ( = ?auto_17245 ?auto_17243 ) ) ( not ( = ?auto_17246 ?auto_17243 ) ) ( not ( = ?auto_17256 ?auto_17243 ) ) ( not ( = ?auto_17247 ?auto_17243 ) ) ( AVAILABLE ?auto_17249 ) ( TRUCK-AT ?auto_17251 ?auto_17252 ) ( not ( = ?auto_17252 ?auto_17250 ) ) ( not ( = ?auto_17248 ?auto_17252 ) ) ( not ( = ?auto_17257 ?auto_17252 ) ) ( HOIST-AT ?auto_17258 ?auto_17252 ) ( not ( = ?auto_17249 ?auto_17258 ) ) ( not ( = ?auto_17254 ?auto_17258 ) ) ( not ( = ?auto_17253 ?auto_17258 ) ) ( AVAILABLE ?auto_17258 ) ( SURFACE-AT ?auto_17244 ?auto_17252 ) ( ON ?auto_17244 ?auto_17255 ) ( CLEAR ?auto_17244 ) ( not ( = ?auto_17245 ?auto_17255 ) ) ( not ( = ?auto_17246 ?auto_17255 ) ) ( not ( = ?auto_17244 ?auto_17255 ) ) ( not ( = ?auto_17256 ?auto_17255 ) ) ( not ( = ?auto_17247 ?auto_17255 ) ) ( not ( = ?auto_17243 ?auto_17255 ) ) ( ON ?auto_17243 ?auto_17242 ) ( not ( = ?auto_17242 ?auto_17243 ) ) ( not ( = ?auto_17242 ?auto_17244 ) ) ( not ( = ?auto_17242 ?auto_17245 ) ) ( not ( = ?auto_17242 ?auto_17246 ) ) ( not ( = ?auto_17242 ?auto_17256 ) ) ( not ( = ?auto_17242 ?auto_17247 ) ) ( not ( = ?auto_17242 ?auto_17255 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17244 ?auto_17245 ?auto_17246 )
      ( MAKE-4CRATE-VERIFY ?auto_17242 ?auto_17243 ?auto_17244 ?auto_17245 ?auto_17246 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17259 - SURFACE
      ?auto_17260 - SURFACE
    )
    :vars
    (
      ?auto_17264 - HOIST
      ?auto_17265 - PLACE
      ?auto_17261 - SURFACE
      ?auto_17263 - PLACE
      ?auto_17269 - HOIST
      ?auto_17272 - SURFACE
      ?auto_17273 - PLACE
      ?auto_17268 - HOIST
      ?auto_17262 - SURFACE
      ?auto_17271 - SURFACE
      ?auto_17267 - PLACE
      ?auto_17274 - HOIST
      ?auto_17270 - SURFACE
      ?auto_17266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17264 ?auto_17265 ) ( IS-CRATE ?auto_17260 ) ( not ( = ?auto_17259 ?auto_17260 ) ) ( not ( = ?auto_17261 ?auto_17259 ) ) ( not ( = ?auto_17261 ?auto_17260 ) ) ( not ( = ?auto_17263 ?auto_17265 ) ) ( HOIST-AT ?auto_17269 ?auto_17263 ) ( not ( = ?auto_17264 ?auto_17269 ) ) ( AVAILABLE ?auto_17269 ) ( SURFACE-AT ?auto_17260 ?auto_17263 ) ( ON ?auto_17260 ?auto_17272 ) ( CLEAR ?auto_17260 ) ( not ( = ?auto_17259 ?auto_17272 ) ) ( not ( = ?auto_17260 ?auto_17272 ) ) ( not ( = ?auto_17261 ?auto_17272 ) ) ( IS-CRATE ?auto_17259 ) ( not ( = ?auto_17273 ?auto_17265 ) ) ( not ( = ?auto_17263 ?auto_17273 ) ) ( HOIST-AT ?auto_17268 ?auto_17273 ) ( not ( = ?auto_17264 ?auto_17268 ) ) ( not ( = ?auto_17269 ?auto_17268 ) ) ( AVAILABLE ?auto_17268 ) ( SURFACE-AT ?auto_17259 ?auto_17273 ) ( ON ?auto_17259 ?auto_17262 ) ( CLEAR ?auto_17259 ) ( not ( = ?auto_17259 ?auto_17262 ) ) ( not ( = ?auto_17260 ?auto_17262 ) ) ( not ( = ?auto_17261 ?auto_17262 ) ) ( not ( = ?auto_17272 ?auto_17262 ) ) ( SURFACE-AT ?auto_17271 ?auto_17265 ) ( CLEAR ?auto_17271 ) ( IS-CRATE ?auto_17261 ) ( not ( = ?auto_17271 ?auto_17261 ) ) ( not ( = ?auto_17259 ?auto_17271 ) ) ( not ( = ?auto_17260 ?auto_17271 ) ) ( not ( = ?auto_17272 ?auto_17271 ) ) ( not ( = ?auto_17262 ?auto_17271 ) ) ( AVAILABLE ?auto_17264 ) ( not ( = ?auto_17267 ?auto_17265 ) ) ( not ( = ?auto_17263 ?auto_17267 ) ) ( not ( = ?auto_17273 ?auto_17267 ) ) ( HOIST-AT ?auto_17274 ?auto_17267 ) ( not ( = ?auto_17264 ?auto_17274 ) ) ( not ( = ?auto_17269 ?auto_17274 ) ) ( not ( = ?auto_17268 ?auto_17274 ) ) ( AVAILABLE ?auto_17274 ) ( SURFACE-AT ?auto_17261 ?auto_17267 ) ( ON ?auto_17261 ?auto_17270 ) ( CLEAR ?auto_17261 ) ( not ( = ?auto_17259 ?auto_17270 ) ) ( not ( = ?auto_17260 ?auto_17270 ) ) ( not ( = ?auto_17261 ?auto_17270 ) ) ( not ( = ?auto_17272 ?auto_17270 ) ) ( not ( = ?auto_17262 ?auto_17270 ) ) ( not ( = ?auto_17271 ?auto_17270 ) ) ( TRUCK-AT ?auto_17266 ?auto_17265 ) )
    :subtasks
    ( ( !DRIVE ?auto_17266 ?auto_17265 ?auto_17267 )
      ( MAKE-2CRATE ?auto_17261 ?auto_17259 ?auto_17260 )
      ( MAKE-1CRATE-VERIFY ?auto_17259 ?auto_17260 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17275 - SURFACE
      ?auto_17276 - SURFACE
      ?auto_17277 - SURFACE
    )
    :vars
    (
      ?auto_17289 - HOIST
      ?auto_17278 - PLACE
      ?auto_17279 - PLACE
      ?auto_17288 - HOIST
      ?auto_17280 - SURFACE
      ?auto_17283 - PLACE
      ?auto_17281 - HOIST
      ?auto_17286 - SURFACE
      ?auto_17284 - SURFACE
      ?auto_17290 - PLACE
      ?auto_17287 - HOIST
      ?auto_17282 - SURFACE
      ?auto_17285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17289 ?auto_17278 ) ( IS-CRATE ?auto_17277 ) ( not ( = ?auto_17276 ?auto_17277 ) ) ( not ( = ?auto_17275 ?auto_17276 ) ) ( not ( = ?auto_17275 ?auto_17277 ) ) ( not ( = ?auto_17279 ?auto_17278 ) ) ( HOIST-AT ?auto_17288 ?auto_17279 ) ( not ( = ?auto_17289 ?auto_17288 ) ) ( AVAILABLE ?auto_17288 ) ( SURFACE-AT ?auto_17277 ?auto_17279 ) ( ON ?auto_17277 ?auto_17280 ) ( CLEAR ?auto_17277 ) ( not ( = ?auto_17276 ?auto_17280 ) ) ( not ( = ?auto_17277 ?auto_17280 ) ) ( not ( = ?auto_17275 ?auto_17280 ) ) ( IS-CRATE ?auto_17276 ) ( not ( = ?auto_17283 ?auto_17278 ) ) ( not ( = ?auto_17279 ?auto_17283 ) ) ( HOIST-AT ?auto_17281 ?auto_17283 ) ( not ( = ?auto_17289 ?auto_17281 ) ) ( not ( = ?auto_17288 ?auto_17281 ) ) ( AVAILABLE ?auto_17281 ) ( SURFACE-AT ?auto_17276 ?auto_17283 ) ( ON ?auto_17276 ?auto_17286 ) ( CLEAR ?auto_17276 ) ( not ( = ?auto_17276 ?auto_17286 ) ) ( not ( = ?auto_17277 ?auto_17286 ) ) ( not ( = ?auto_17275 ?auto_17286 ) ) ( not ( = ?auto_17280 ?auto_17286 ) ) ( SURFACE-AT ?auto_17284 ?auto_17278 ) ( CLEAR ?auto_17284 ) ( IS-CRATE ?auto_17275 ) ( not ( = ?auto_17284 ?auto_17275 ) ) ( not ( = ?auto_17276 ?auto_17284 ) ) ( not ( = ?auto_17277 ?auto_17284 ) ) ( not ( = ?auto_17280 ?auto_17284 ) ) ( not ( = ?auto_17286 ?auto_17284 ) ) ( AVAILABLE ?auto_17289 ) ( not ( = ?auto_17290 ?auto_17278 ) ) ( not ( = ?auto_17279 ?auto_17290 ) ) ( not ( = ?auto_17283 ?auto_17290 ) ) ( HOIST-AT ?auto_17287 ?auto_17290 ) ( not ( = ?auto_17289 ?auto_17287 ) ) ( not ( = ?auto_17288 ?auto_17287 ) ) ( not ( = ?auto_17281 ?auto_17287 ) ) ( AVAILABLE ?auto_17287 ) ( SURFACE-AT ?auto_17275 ?auto_17290 ) ( ON ?auto_17275 ?auto_17282 ) ( CLEAR ?auto_17275 ) ( not ( = ?auto_17276 ?auto_17282 ) ) ( not ( = ?auto_17277 ?auto_17282 ) ) ( not ( = ?auto_17275 ?auto_17282 ) ) ( not ( = ?auto_17280 ?auto_17282 ) ) ( not ( = ?auto_17286 ?auto_17282 ) ) ( not ( = ?auto_17284 ?auto_17282 ) ) ( TRUCK-AT ?auto_17285 ?auto_17278 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17276 ?auto_17277 )
      ( MAKE-2CRATE-VERIFY ?auto_17275 ?auto_17276 ?auto_17277 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17291 - SURFACE
      ?auto_17292 - SURFACE
      ?auto_17293 - SURFACE
      ?auto_17294 - SURFACE
    )
    :vars
    (
      ?auto_17302 - HOIST
      ?auto_17297 - PLACE
      ?auto_17304 - PLACE
      ?auto_17299 - HOIST
      ?auto_17300 - SURFACE
      ?auto_17298 - PLACE
      ?auto_17296 - HOIST
      ?auto_17295 - SURFACE
      ?auto_17305 - PLACE
      ?auto_17301 - HOIST
      ?auto_17306 - SURFACE
      ?auto_17303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17302 ?auto_17297 ) ( IS-CRATE ?auto_17294 ) ( not ( = ?auto_17293 ?auto_17294 ) ) ( not ( = ?auto_17292 ?auto_17293 ) ) ( not ( = ?auto_17292 ?auto_17294 ) ) ( not ( = ?auto_17304 ?auto_17297 ) ) ( HOIST-AT ?auto_17299 ?auto_17304 ) ( not ( = ?auto_17302 ?auto_17299 ) ) ( AVAILABLE ?auto_17299 ) ( SURFACE-AT ?auto_17294 ?auto_17304 ) ( ON ?auto_17294 ?auto_17300 ) ( CLEAR ?auto_17294 ) ( not ( = ?auto_17293 ?auto_17300 ) ) ( not ( = ?auto_17294 ?auto_17300 ) ) ( not ( = ?auto_17292 ?auto_17300 ) ) ( IS-CRATE ?auto_17293 ) ( not ( = ?auto_17298 ?auto_17297 ) ) ( not ( = ?auto_17304 ?auto_17298 ) ) ( HOIST-AT ?auto_17296 ?auto_17298 ) ( not ( = ?auto_17302 ?auto_17296 ) ) ( not ( = ?auto_17299 ?auto_17296 ) ) ( AVAILABLE ?auto_17296 ) ( SURFACE-AT ?auto_17293 ?auto_17298 ) ( ON ?auto_17293 ?auto_17295 ) ( CLEAR ?auto_17293 ) ( not ( = ?auto_17293 ?auto_17295 ) ) ( not ( = ?auto_17294 ?auto_17295 ) ) ( not ( = ?auto_17292 ?auto_17295 ) ) ( not ( = ?auto_17300 ?auto_17295 ) ) ( SURFACE-AT ?auto_17291 ?auto_17297 ) ( CLEAR ?auto_17291 ) ( IS-CRATE ?auto_17292 ) ( not ( = ?auto_17291 ?auto_17292 ) ) ( not ( = ?auto_17293 ?auto_17291 ) ) ( not ( = ?auto_17294 ?auto_17291 ) ) ( not ( = ?auto_17300 ?auto_17291 ) ) ( not ( = ?auto_17295 ?auto_17291 ) ) ( AVAILABLE ?auto_17302 ) ( not ( = ?auto_17305 ?auto_17297 ) ) ( not ( = ?auto_17304 ?auto_17305 ) ) ( not ( = ?auto_17298 ?auto_17305 ) ) ( HOIST-AT ?auto_17301 ?auto_17305 ) ( not ( = ?auto_17302 ?auto_17301 ) ) ( not ( = ?auto_17299 ?auto_17301 ) ) ( not ( = ?auto_17296 ?auto_17301 ) ) ( AVAILABLE ?auto_17301 ) ( SURFACE-AT ?auto_17292 ?auto_17305 ) ( ON ?auto_17292 ?auto_17306 ) ( CLEAR ?auto_17292 ) ( not ( = ?auto_17293 ?auto_17306 ) ) ( not ( = ?auto_17294 ?auto_17306 ) ) ( not ( = ?auto_17292 ?auto_17306 ) ) ( not ( = ?auto_17300 ?auto_17306 ) ) ( not ( = ?auto_17295 ?auto_17306 ) ) ( not ( = ?auto_17291 ?auto_17306 ) ) ( TRUCK-AT ?auto_17303 ?auto_17297 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17292 ?auto_17293 ?auto_17294 )
      ( MAKE-3CRATE-VERIFY ?auto_17291 ?auto_17292 ?auto_17293 ?auto_17294 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17307 - SURFACE
      ?auto_17308 - SURFACE
      ?auto_17309 - SURFACE
      ?auto_17310 - SURFACE
      ?auto_17311 - SURFACE
    )
    :vars
    (
      ?auto_17319 - HOIST
      ?auto_17314 - PLACE
      ?auto_17321 - PLACE
      ?auto_17316 - HOIST
      ?auto_17317 - SURFACE
      ?auto_17315 - PLACE
      ?auto_17313 - HOIST
      ?auto_17312 - SURFACE
      ?auto_17322 - PLACE
      ?auto_17318 - HOIST
      ?auto_17323 - SURFACE
      ?auto_17320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17319 ?auto_17314 ) ( IS-CRATE ?auto_17311 ) ( not ( = ?auto_17310 ?auto_17311 ) ) ( not ( = ?auto_17309 ?auto_17310 ) ) ( not ( = ?auto_17309 ?auto_17311 ) ) ( not ( = ?auto_17321 ?auto_17314 ) ) ( HOIST-AT ?auto_17316 ?auto_17321 ) ( not ( = ?auto_17319 ?auto_17316 ) ) ( AVAILABLE ?auto_17316 ) ( SURFACE-AT ?auto_17311 ?auto_17321 ) ( ON ?auto_17311 ?auto_17317 ) ( CLEAR ?auto_17311 ) ( not ( = ?auto_17310 ?auto_17317 ) ) ( not ( = ?auto_17311 ?auto_17317 ) ) ( not ( = ?auto_17309 ?auto_17317 ) ) ( IS-CRATE ?auto_17310 ) ( not ( = ?auto_17315 ?auto_17314 ) ) ( not ( = ?auto_17321 ?auto_17315 ) ) ( HOIST-AT ?auto_17313 ?auto_17315 ) ( not ( = ?auto_17319 ?auto_17313 ) ) ( not ( = ?auto_17316 ?auto_17313 ) ) ( AVAILABLE ?auto_17313 ) ( SURFACE-AT ?auto_17310 ?auto_17315 ) ( ON ?auto_17310 ?auto_17312 ) ( CLEAR ?auto_17310 ) ( not ( = ?auto_17310 ?auto_17312 ) ) ( not ( = ?auto_17311 ?auto_17312 ) ) ( not ( = ?auto_17309 ?auto_17312 ) ) ( not ( = ?auto_17317 ?auto_17312 ) ) ( SURFACE-AT ?auto_17308 ?auto_17314 ) ( CLEAR ?auto_17308 ) ( IS-CRATE ?auto_17309 ) ( not ( = ?auto_17308 ?auto_17309 ) ) ( not ( = ?auto_17310 ?auto_17308 ) ) ( not ( = ?auto_17311 ?auto_17308 ) ) ( not ( = ?auto_17317 ?auto_17308 ) ) ( not ( = ?auto_17312 ?auto_17308 ) ) ( AVAILABLE ?auto_17319 ) ( not ( = ?auto_17322 ?auto_17314 ) ) ( not ( = ?auto_17321 ?auto_17322 ) ) ( not ( = ?auto_17315 ?auto_17322 ) ) ( HOIST-AT ?auto_17318 ?auto_17322 ) ( not ( = ?auto_17319 ?auto_17318 ) ) ( not ( = ?auto_17316 ?auto_17318 ) ) ( not ( = ?auto_17313 ?auto_17318 ) ) ( AVAILABLE ?auto_17318 ) ( SURFACE-AT ?auto_17309 ?auto_17322 ) ( ON ?auto_17309 ?auto_17323 ) ( CLEAR ?auto_17309 ) ( not ( = ?auto_17310 ?auto_17323 ) ) ( not ( = ?auto_17311 ?auto_17323 ) ) ( not ( = ?auto_17309 ?auto_17323 ) ) ( not ( = ?auto_17317 ?auto_17323 ) ) ( not ( = ?auto_17312 ?auto_17323 ) ) ( not ( = ?auto_17308 ?auto_17323 ) ) ( TRUCK-AT ?auto_17320 ?auto_17314 ) ( ON ?auto_17308 ?auto_17307 ) ( not ( = ?auto_17307 ?auto_17308 ) ) ( not ( = ?auto_17307 ?auto_17309 ) ) ( not ( = ?auto_17307 ?auto_17310 ) ) ( not ( = ?auto_17307 ?auto_17311 ) ) ( not ( = ?auto_17307 ?auto_17317 ) ) ( not ( = ?auto_17307 ?auto_17312 ) ) ( not ( = ?auto_17307 ?auto_17323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17309 ?auto_17310 ?auto_17311 )
      ( MAKE-4CRATE-VERIFY ?auto_17307 ?auto_17308 ?auto_17309 ?auto_17310 ?auto_17311 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17324 - SURFACE
      ?auto_17325 - SURFACE
    )
    :vars
    (
      ?auto_17335 - HOIST
      ?auto_17330 - PLACE
      ?auto_17326 - SURFACE
      ?auto_17337 - PLACE
      ?auto_17332 - HOIST
      ?auto_17333 - SURFACE
      ?auto_17331 - PLACE
      ?auto_17329 - HOIST
      ?auto_17328 - SURFACE
      ?auto_17327 - SURFACE
      ?auto_17338 - PLACE
      ?auto_17334 - HOIST
      ?auto_17339 - SURFACE
      ?auto_17336 - TRUCK
      ?auto_17340 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17335 ?auto_17330 ) ( IS-CRATE ?auto_17325 ) ( not ( = ?auto_17324 ?auto_17325 ) ) ( not ( = ?auto_17326 ?auto_17324 ) ) ( not ( = ?auto_17326 ?auto_17325 ) ) ( not ( = ?auto_17337 ?auto_17330 ) ) ( HOIST-AT ?auto_17332 ?auto_17337 ) ( not ( = ?auto_17335 ?auto_17332 ) ) ( AVAILABLE ?auto_17332 ) ( SURFACE-AT ?auto_17325 ?auto_17337 ) ( ON ?auto_17325 ?auto_17333 ) ( CLEAR ?auto_17325 ) ( not ( = ?auto_17324 ?auto_17333 ) ) ( not ( = ?auto_17325 ?auto_17333 ) ) ( not ( = ?auto_17326 ?auto_17333 ) ) ( IS-CRATE ?auto_17324 ) ( not ( = ?auto_17331 ?auto_17330 ) ) ( not ( = ?auto_17337 ?auto_17331 ) ) ( HOIST-AT ?auto_17329 ?auto_17331 ) ( not ( = ?auto_17335 ?auto_17329 ) ) ( not ( = ?auto_17332 ?auto_17329 ) ) ( AVAILABLE ?auto_17329 ) ( SURFACE-AT ?auto_17324 ?auto_17331 ) ( ON ?auto_17324 ?auto_17328 ) ( CLEAR ?auto_17324 ) ( not ( = ?auto_17324 ?auto_17328 ) ) ( not ( = ?auto_17325 ?auto_17328 ) ) ( not ( = ?auto_17326 ?auto_17328 ) ) ( not ( = ?auto_17333 ?auto_17328 ) ) ( IS-CRATE ?auto_17326 ) ( not ( = ?auto_17327 ?auto_17326 ) ) ( not ( = ?auto_17324 ?auto_17327 ) ) ( not ( = ?auto_17325 ?auto_17327 ) ) ( not ( = ?auto_17333 ?auto_17327 ) ) ( not ( = ?auto_17328 ?auto_17327 ) ) ( not ( = ?auto_17338 ?auto_17330 ) ) ( not ( = ?auto_17337 ?auto_17338 ) ) ( not ( = ?auto_17331 ?auto_17338 ) ) ( HOIST-AT ?auto_17334 ?auto_17338 ) ( not ( = ?auto_17335 ?auto_17334 ) ) ( not ( = ?auto_17332 ?auto_17334 ) ) ( not ( = ?auto_17329 ?auto_17334 ) ) ( AVAILABLE ?auto_17334 ) ( SURFACE-AT ?auto_17326 ?auto_17338 ) ( ON ?auto_17326 ?auto_17339 ) ( CLEAR ?auto_17326 ) ( not ( = ?auto_17324 ?auto_17339 ) ) ( not ( = ?auto_17325 ?auto_17339 ) ) ( not ( = ?auto_17326 ?auto_17339 ) ) ( not ( = ?auto_17333 ?auto_17339 ) ) ( not ( = ?auto_17328 ?auto_17339 ) ) ( not ( = ?auto_17327 ?auto_17339 ) ) ( TRUCK-AT ?auto_17336 ?auto_17330 ) ( SURFACE-AT ?auto_17340 ?auto_17330 ) ( CLEAR ?auto_17340 ) ( LIFTING ?auto_17335 ?auto_17327 ) ( IS-CRATE ?auto_17327 ) ( not ( = ?auto_17340 ?auto_17327 ) ) ( not ( = ?auto_17324 ?auto_17340 ) ) ( not ( = ?auto_17325 ?auto_17340 ) ) ( not ( = ?auto_17326 ?auto_17340 ) ) ( not ( = ?auto_17333 ?auto_17340 ) ) ( not ( = ?auto_17328 ?auto_17340 ) ) ( not ( = ?auto_17339 ?auto_17340 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17340 ?auto_17327 )
      ( MAKE-2CRATE ?auto_17326 ?auto_17324 ?auto_17325 )
      ( MAKE-1CRATE-VERIFY ?auto_17324 ?auto_17325 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17341 - SURFACE
      ?auto_17342 - SURFACE
      ?auto_17343 - SURFACE
    )
    :vars
    (
      ?auto_17350 - HOIST
      ?auto_17349 - PLACE
      ?auto_17351 - PLACE
      ?auto_17347 - HOIST
      ?auto_17354 - SURFACE
      ?auto_17357 - PLACE
      ?auto_17345 - HOIST
      ?auto_17346 - SURFACE
      ?auto_17356 - SURFACE
      ?auto_17348 - PLACE
      ?auto_17352 - HOIST
      ?auto_17344 - SURFACE
      ?auto_17353 - TRUCK
      ?auto_17355 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17350 ?auto_17349 ) ( IS-CRATE ?auto_17343 ) ( not ( = ?auto_17342 ?auto_17343 ) ) ( not ( = ?auto_17341 ?auto_17342 ) ) ( not ( = ?auto_17341 ?auto_17343 ) ) ( not ( = ?auto_17351 ?auto_17349 ) ) ( HOIST-AT ?auto_17347 ?auto_17351 ) ( not ( = ?auto_17350 ?auto_17347 ) ) ( AVAILABLE ?auto_17347 ) ( SURFACE-AT ?auto_17343 ?auto_17351 ) ( ON ?auto_17343 ?auto_17354 ) ( CLEAR ?auto_17343 ) ( not ( = ?auto_17342 ?auto_17354 ) ) ( not ( = ?auto_17343 ?auto_17354 ) ) ( not ( = ?auto_17341 ?auto_17354 ) ) ( IS-CRATE ?auto_17342 ) ( not ( = ?auto_17357 ?auto_17349 ) ) ( not ( = ?auto_17351 ?auto_17357 ) ) ( HOIST-AT ?auto_17345 ?auto_17357 ) ( not ( = ?auto_17350 ?auto_17345 ) ) ( not ( = ?auto_17347 ?auto_17345 ) ) ( AVAILABLE ?auto_17345 ) ( SURFACE-AT ?auto_17342 ?auto_17357 ) ( ON ?auto_17342 ?auto_17346 ) ( CLEAR ?auto_17342 ) ( not ( = ?auto_17342 ?auto_17346 ) ) ( not ( = ?auto_17343 ?auto_17346 ) ) ( not ( = ?auto_17341 ?auto_17346 ) ) ( not ( = ?auto_17354 ?auto_17346 ) ) ( IS-CRATE ?auto_17341 ) ( not ( = ?auto_17356 ?auto_17341 ) ) ( not ( = ?auto_17342 ?auto_17356 ) ) ( not ( = ?auto_17343 ?auto_17356 ) ) ( not ( = ?auto_17354 ?auto_17356 ) ) ( not ( = ?auto_17346 ?auto_17356 ) ) ( not ( = ?auto_17348 ?auto_17349 ) ) ( not ( = ?auto_17351 ?auto_17348 ) ) ( not ( = ?auto_17357 ?auto_17348 ) ) ( HOIST-AT ?auto_17352 ?auto_17348 ) ( not ( = ?auto_17350 ?auto_17352 ) ) ( not ( = ?auto_17347 ?auto_17352 ) ) ( not ( = ?auto_17345 ?auto_17352 ) ) ( AVAILABLE ?auto_17352 ) ( SURFACE-AT ?auto_17341 ?auto_17348 ) ( ON ?auto_17341 ?auto_17344 ) ( CLEAR ?auto_17341 ) ( not ( = ?auto_17342 ?auto_17344 ) ) ( not ( = ?auto_17343 ?auto_17344 ) ) ( not ( = ?auto_17341 ?auto_17344 ) ) ( not ( = ?auto_17354 ?auto_17344 ) ) ( not ( = ?auto_17346 ?auto_17344 ) ) ( not ( = ?auto_17356 ?auto_17344 ) ) ( TRUCK-AT ?auto_17353 ?auto_17349 ) ( SURFACE-AT ?auto_17355 ?auto_17349 ) ( CLEAR ?auto_17355 ) ( LIFTING ?auto_17350 ?auto_17356 ) ( IS-CRATE ?auto_17356 ) ( not ( = ?auto_17355 ?auto_17356 ) ) ( not ( = ?auto_17342 ?auto_17355 ) ) ( not ( = ?auto_17343 ?auto_17355 ) ) ( not ( = ?auto_17341 ?auto_17355 ) ) ( not ( = ?auto_17354 ?auto_17355 ) ) ( not ( = ?auto_17346 ?auto_17355 ) ) ( not ( = ?auto_17344 ?auto_17355 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17342 ?auto_17343 )
      ( MAKE-2CRATE-VERIFY ?auto_17341 ?auto_17342 ?auto_17343 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17358 - SURFACE
      ?auto_17359 - SURFACE
      ?auto_17360 - SURFACE
      ?auto_17361 - SURFACE
    )
    :vars
    (
      ?auto_17370 - HOIST
      ?auto_17373 - PLACE
      ?auto_17367 - PLACE
      ?auto_17371 - HOIST
      ?auto_17372 - SURFACE
      ?auto_17364 - PLACE
      ?auto_17363 - HOIST
      ?auto_17368 - SURFACE
      ?auto_17362 - PLACE
      ?auto_17365 - HOIST
      ?auto_17366 - SURFACE
      ?auto_17369 - TRUCK
      ?auto_17374 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17370 ?auto_17373 ) ( IS-CRATE ?auto_17361 ) ( not ( = ?auto_17360 ?auto_17361 ) ) ( not ( = ?auto_17359 ?auto_17360 ) ) ( not ( = ?auto_17359 ?auto_17361 ) ) ( not ( = ?auto_17367 ?auto_17373 ) ) ( HOIST-AT ?auto_17371 ?auto_17367 ) ( not ( = ?auto_17370 ?auto_17371 ) ) ( AVAILABLE ?auto_17371 ) ( SURFACE-AT ?auto_17361 ?auto_17367 ) ( ON ?auto_17361 ?auto_17372 ) ( CLEAR ?auto_17361 ) ( not ( = ?auto_17360 ?auto_17372 ) ) ( not ( = ?auto_17361 ?auto_17372 ) ) ( not ( = ?auto_17359 ?auto_17372 ) ) ( IS-CRATE ?auto_17360 ) ( not ( = ?auto_17364 ?auto_17373 ) ) ( not ( = ?auto_17367 ?auto_17364 ) ) ( HOIST-AT ?auto_17363 ?auto_17364 ) ( not ( = ?auto_17370 ?auto_17363 ) ) ( not ( = ?auto_17371 ?auto_17363 ) ) ( AVAILABLE ?auto_17363 ) ( SURFACE-AT ?auto_17360 ?auto_17364 ) ( ON ?auto_17360 ?auto_17368 ) ( CLEAR ?auto_17360 ) ( not ( = ?auto_17360 ?auto_17368 ) ) ( not ( = ?auto_17361 ?auto_17368 ) ) ( not ( = ?auto_17359 ?auto_17368 ) ) ( not ( = ?auto_17372 ?auto_17368 ) ) ( IS-CRATE ?auto_17359 ) ( not ( = ?auto_17358 ?auto_17359 ) ) ( not ( = ?auto_17360 ?auto_17358 ) ) ( not ( = ?auto_17361 ?auto_17358 ) ) ( not ( = ?auto_17372 ?auto_17358 ) ) ( not ( = ?auto_17368 ?auto_17358 ) ) ( not ( = ?auto_17362 ?auto_17373 ) ) ( not ( = ?auto_17367 ?auto_17362 ) ) ( not ( = ?auto_17364 ?auto_17362 ) ) ( HOIST-AT ?auto_17365 ?auto_17362 ) ( not ( = ?auto_17370 ?auto_17365 ) ) ( not ( = ?auto_17371 ?auto_17365 ) ) ( not ( = ?auto_17363 ?auto_17365 ) ) ( AVAILABLE ?auto_17365 ) ( SURFACE-AT ?auto_17359 ?auto_17362 ) ( ON ?auto_17359 ?auto_17366 ) ( CLEAR ?auto_17359 ) ( not ( = ?auto_17360 ?auto_17366 ) ) ( not ( = ?auto_17361 ?auto_17366 ) ) ( not ( = ?auto_17359 ?auto_17366 ) ) ( not ( = ?auto_17372 ?auto_17366 ) ) ( not ( = ?auto_17368 ?auto_17366 ) ) ( not ( = ?auto_17358 ?auto_17366 ) ) ( TRUCK-AT ?auto_17369 ?auto_17373 ) ( SURFACE-AT ?auto_17374 ?auto_17373 ) ( CLEAR ?auto_17374 ) ( LIFTING ?auto_17370 ?auto_17358 ) ( IS-CRATE ?auto_17358 ) ( not ( = ?auto_17374 ?auto_17358 ) ) ( not ( = ?auto_17360 ?auto_17374 ) ) ( not ( = ?auto_17361 ?auto_17374 ) ) ( not ( = ?auto_17359 ?auto_17374 ) ) ( not ( = ?auto_17372 ?auto_17374 ) ) ( not ( = ?auto_17368 ?auto_17374 ) ) ( not ( = ?auto_17366 ?auto_17374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17359 ?auto_17360 ?auto_17361 )
      ( MAKE-3CRATE-VERIFY ?auto_17358 ?auto_17359 ?auto_17360 ?auto_17361 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17375 - SURFACE
      ?auto_17376 - SURFACE
      ?auto_17377 - SURFACE
      ?auto_17378 - SURFACE
      ?auto_17379 - SURFACE
    )
    :vars
    (
      ?auto_17388 - HOIST
      ?auto_17391 - PLACE
      ?auto_17385 - PLACE
      ?auto_17389 - HOIST
      ?auto_17390 - SURFACE
      ?auto_17382 - PLACE
      ?auto_17381 - HOIST
      ?auto_17386 - SURFACE
      ?auto_17380 - PLACE
      ?auto_17383 - HOIST
      ?auto_17384 - SURFACE
      ?auto_17387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17388 ?auto_17391 ) ( IS-CRATE ?auto_17379 ) ( not ( = ?auto_17378 ?auto_17379 ) ) ( not ( = ?auto_17377 ?auto_17378 ) ) ( not ( = ?auto_17377 ?auto_17379 ) ) ( not ( = ?auto_17385 ?auto_17391 ) ) ( HOIST-AT ?auto_17389 ?auto_17385 ) ( not ( = ?auto_17388 ?auto_17389 ) ) ( AVAILABLE ?auto_17389 ) ( SURFACE-AT ?auto_17379 ?auto_17385 ) ( ON ?auto_17379 ?auto_17390 ) ( CLEAR ?auto_17379 ) ( not ( = ?auto_17378 ?auto_17390 ) ) ( not ( = ?auto_17379 ?auto_17390 ) ) ( not ( = ?auto_17377 ?auto_17390 ) ) ( IS-CRATE ?auto_17378 ) ( not ( = ?auto_17382 ?auto_17391 ) ) ( not ( = ?auto_17385 ?auto_17382 ) ) ( HOIST-AT ?auto_17381 ?auto_17382 ) ( not ( = ?auto_17388 ?auto_17381 ) ) ( not ( = ?auto_17389 ?auto_17381 ) ) ( AVAILABLE ?auto_17381 ) ( SURFACE-AT ?auto_17378 ?auto_17382 ) ( ON ?auto_17378 ?auto_17386 ) ( CLEAR ?auto_17378 ) ( not ( = ?auto_17378 ?auto_17386 ) ) ( not ( = ?auto_17379 ?auto_17386 ) ) ( not ( = ?auto_17377 ?auto_17386 ) ) ( not ( = ?auto_17390 ?auto_17386 ) ) ( IS-CRATE ?auto_17377 ) ( not ( = ?auto_17376 ?auto_17377 ) ) ( not ( = ?auto_17378 ?auto_17376 ) ) ( not ( = ?auto_17379 ?auto_17376 ) ) ( not ( = ?auto_17390 ?auto_17376 ) ) ( not ( = ?auto_17386 ?auto_17376 ) ) ( not ( = ?auto_17380 ?auto_17391 ) ) ( not ( = ?auto_17385 ?auto_17380 ) ) ( not ( = ?auto_17382 ?auto_17380 ) ) ( HOIST-AT ?auto_17383 ?auto_17380 ) ( not ( = ?auto_17388 ?auto_17383 ) ) ( not ( = ?auto_17389 ?auto_17383 ) ) ( not ( = ?auto_17381 ?auto_17383 ) ) ( AVAILABLE ?auto_17383 ) ( SURFACE-AT ?auto_17377 ?auto_17380 ) ( ON ?auto_17377 ?auto_17384 ) ( CLEAR ?auto_17377 ) ( not ( = ?auto_17378 ?auto_17384 ) ) ( not ( = ?auto_17379 ?auto_17384 ) ) ( not ( = ?auto_17377 ?auto_17384 ) ) ( not ( = ?auto_17390 ?auto_17384 ) ) ( not ( = ?auto_17386 ?auto_17384 ) ) ( not ( = ?auto_17376 ?auto_17384 ) ) ( TRUCK-AT ?auto_17387 ?auto_17391 ) ( SURFACE-AT ?auto_17375 ?auto_17391 ) ( CLEAR ?auto_17375 ) ( LIFTING ?auto_17388 ?auto_17376 ) ( IS-CRATE ?auto_17376 ) ( not ( = ?auto_17375 ?auto_17376 ) ) ( not ( = ?auto_17378 ?auto_17375 ) ) ( not ( = ?auto_17379 ?auto_17375 ) ) ( not ( = ?auto_17377 ?auto_17375 ) ) ( not ( = ?auto_17390 ?auto_17375 ) ) ( not ( = ?auto_17386 ?auto_17375 ) ) ( not ( = ?auto_17384 ?auto_17375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17377 ?auto_17378 ?auto_17379 )
      ( MAKE-4CRATE-VERIFY ?auto_17375 ?auto_17376 ?auto_17377 ?auto_17378 ?auto_17379 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17392 - SURFACE
      ?auto_17393 - SURFACE
    )
    :vars
    (
      ?auto_17402 - HOIST
      ?auto_17406 - PLACE
      ?auto_17408 - SURFACE
      ?auto_17399 - PLACE
      ?auto_17403 - HOIST
      ?auto_17405 - SURFACE
      ?auto_17396 - PLACE
      ?auto_17395 - HOIST
      ?auto_17400 - SURFACE
      ?auto_17404 - SURFACE
      ?auto_17394 - PLACE
      ?auto_17397 - HOIST
      ?auto_17398 - SURFACE
      ?auto_17401 - TRUCK
      ?auto_17407 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17402 ?auto_17406 ) ( IS-CRATE ?auto_17393 ) ( not ( = ?auto_17392 ?auto_17393 ) ) ( not ( = ?auto_17408 ?auto_17392 ) ) ( not ( = ?auto_17408 ?auto_17393 ) ) ( not ( = ?auto_17399 ?auto_17406 ) ) ( HOIST-AT ?auto_17403 ?auto_17399 ) ( not ( = ?auto_17402 ?auto_17403 ) ) ( AVAILABLE ?auto_17403 ) ( SURFACE-AT ?auto_17393 ?auto_17399 ) ( ON ?auto_17393 ?auto_17405 ) ( CLEAR ?auto_17393 ) ( not ( = ?auto_17392 ?auto_17405 ) ) ( not ( = ?auto_17393 ?auto_17405 ) ) ( not ( = ?auto_17408 ?auto_17405 ) ) ( IS-CRATE ?auto_17392 ) ( not ( = ?auto_17396 ?auto_17406 ) ) ( not ( = ?auto_17399 ?auto_17396 ) ) ( HOIST-AT ?auto_17395 ?auto_17396 ) ( not ( = ?auto_17402 ?auto_17395 ) ) ( not ( = ?auto_17403 ?auto_17395 ) ) ( AVAILABLE ?auto_17395 ) ( SURFACE-AT ?auto_17392 ?auto_17396 ) ( ON ?auto_17392 ?auto_17400 ) ( CLEAR ?auto_17392 ) ( not ( = ?auto_17392 ?auto_17400 ) ) ( not ( = ?auto_17393 ?auto_17400 ) ) ( not ( = ?auto_17408 ?auto_17400 ) ) ( not ( = ?auto_17405 ?auto_17400 ) ) ( IS-CRATE ?auto_17408 ) ( not ( = ?auto_17404 ?auto_17408 ) ) ( not ( = ?auto_17392 ?auto_17404 ) ) ( not ( = ?auto_17393 ?auto_17404 ) ) ( not ( = ?auto_17405 ?auto_17404 ) ) ( not ( = ?auto_17400 ?auto_17404 ) ) ( not ( = ?auto_17394 ?auto_17406 ) ) ( not ( = ?auto_17399 ?auto_17394 ) ) ( not ( = ?auto_17396 ?auto_17394 ) ) ( HOIST-AT ?auto_17397 ?auto_17394 ) ( not ( = ?auto_17402 ?auto_17397 ) ) ( not ( = ?auto_17403 ?auto_17397 ) ) ( not ( = ?auto_17395 ?auto_17397 ) ) ( AVAILABLE ?auto_17397 ) ( SURFACE-AT ?auto_17408 ?auto_17394 ) ( ON ?auto_17408 ?auto_17398 ) ( CLEAR ?auto_17408 ) ( not ( = ?auto_17392 ?auto_17398 ) ) ( not ( = ?auto_17393 ?auto_17398 ) ) ( not ( = ?auto_17408 ?auto_17398 ) ) ( not ( = ?auto_17405 ?auto_17398 ) ) ( not ( = ?auto_17400 ?auto_17398 ) ) ( not ( = ?auto_17404 ?auto_17398 ) ) ( TRUCK-AT ?auto_17401 ?auto_17406 ) ( SURFACE-AT ?auto_17407 ?auto_17406 ) ( CLEAR ?auto_17407 ) ( IS-CRATE ?auto_17404 ) ( not ( = ?auto_17407 ?auto_17404 ) ) ( not ( = ?auto_17392 ?auto_17407 ) ) ( not ( = ?auto_17393 ?auto_17407 ) ) ( not ( = ?auto_17408 ?auto_17407 ) ) ( not ( = ?auto_17405 ?auto_17407 ) ) ( not ( = ?auto_17400 ?auto_17407 ) ) ( not ( = ?auto_17398 ?auto_17407 ) ) ( AVAILABLE ?auto_17402 ) ( IN ?auto_17404 ?auto_17401 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17402 ?auto_17404 ?auto_17401 ?auto_17406 )
      ( MAKE-2CRATE ?auto_17408 ?auto_17392 ?auto_17393 )
      ( MAKE-1CRATE-VERIFY ?auto_17392 ?auto_17393 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17409 - SURFACE
      ?auto_17410 - SURFACE
      ?auto_17411 - SURFACE
    )
    :vars
    (
      ?auto_17424 - HOIST
      ?auto_17418 - PLACE
      ?auto_17415 - PLACE
      ?auto_17419 - HOIST
      ?auto_17423 - SURFACE
      ?auto_17414 - PLACE
      ?auto_17412 - HOIST
      ?auto_17416 - SURFACE
      ?auto_17422 - SURFACE
      ?auto_17421 - PLACE
      ?auto_17417 - HOIST
      ?auto_17413 - SURFACE
      ?auto_17420 - TRUCK
      ?auto_17425 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17424 ?auto_17418 ) ( IS-CRATE ?auto_17411 ) ( not ( = ?auto_17410 ?auto_17411 ) ) ( not ( = ?auto_17409 ?auto_17410 ) ) ( not ( = ?auto_17409 ?auto_17411 ) ) ( not ( = ?auto_17415 ?auto_17418 ) ) ( HOIST-AT ?auto_17419 ?auto_17415 ) ( not ( = ?auto_17424 ?auto_17419 ) ) ( AVAILABLE ?auto_17419 ) ( SURFACE-AT ?auto_17411 ?auto_17415 ) ( ON ?auto_17411 ?auto_17423 ) ( CLEAR ?auto_17411 ) ( not ( = ?auto_17410 ?auto_17423 ) ) ( not ( = ?auto_17411 ?auto_17423 ) ) ( not ( = ?auto_17409 ?auto_17423 ) ) ( IS-CRATE ?auto_17410 ) ( not ( = ?auto_17414 ?auto_17418 ) ) ( not ( = ?auto_17415 ?auto_17414 ) ) ( HOIST-AT ?auto_17412 ?auto_17414 ) ( not ( = ?auto_17424 ?auto_17412 ) ) ( not ( = ?auto_17419 ?auto_17412 ) ) ( AVAILABLE ?auto_17412 ) ( SURFACE-AT ?auto_17410 ?auto_17414 ) ( ON ?auto_17410 ?auto_17416 ) ( CLEAR ?auto_17410 ) ( not ( = ?auto_17410 ?auto_17416 ) ) ( not ( = ?auto_17411 ?auto_17416 ) ) ( not ( = ?auto_17409 ?auto_17416 ) ) ( not ( = ?auto_17423 ?auto_17416 ) ) ( IS-CRATE ?auto_17409 ) ( not ( = ?auto_17422 ?auto_17409 ) ) ( not ( = ?auto_17410 ?auto_17422 ) ) ( not ( = ?auto_17411 ?auto_17422 ) ) ( not ( = ?auto_17423 ?auto_17422 ) ) ( not ( = ?auto_17416 ?auto_17422 ) ) ( not ( = ?auto_17421 ?auto_17418 ) ) ( not ( = ?auto_17415 ?auto_17421 ) ) ( not ( = ?auto_17414 ?auto_17421 ) ) ( HOIST-AT ?auto_17417 ?auto_17421 ) ( not ( = ?auto_17424 ?auto_17417 ) ) ( not ( = ?auto_17419 ?auto_17417 ) ) ( not ( = ?auto_17412 ?auto_17417 ) ) ( AVAILABLE ?auto_17417 ) ( SURFACE-AT ?auto_17409 ?auto_17421 ) ( ON ?auto_17409 ?auto_17413 ) ( CLEAR ?auto_17409 ) ( not ( = ?auto_17410 ?auto_17413 ) ) ( not ( = ?auto_17411 ?auto_17413 ) ) ( not ( = ?auto_17409 ?auto_17413 ) ) ( not ( = ?auto_17423 ?auto_17413 ) ) ( not ( = ?auto_17416 ?auto_17413 ) ) ( not ( = ?auto_17422 ?auto_17413 ) ) ( TRUCK-AT ?auto_17420 ?auto_17418 ) ( SURFACE-AT ?auto_17425 ?auto_17418 ) ( CLEAR ?auto_17425 ) ( IS-CRATE ?auto_17422 ) ( not ( = ?auto_17425 ?auto_17422 ) ) ( not ( = ?auto_17410 ?auto_17425 ) ) ( not ( = ?auto_17411 ?auto_17425 ) ) ( not ( = ?auto_17409 ?auto_17425 ) ) ( not ( = ?auto_17423 ?auto_17425 ) ) ( not ( = ?auto_17416 ?auto_17425 ) ) ( not ( = ?auto_17413 ?auto_17425 ) ) ( AVAILABLE ?auto_17424 ) ( IN ?auto_17422 ?auto_17420 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17410 ?auto_17411 )
      ( MAKE-2CRATE-VERIFY ?auto_17409 ?auto_17410 ?auto_17411 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17426 - SURFACE
      ?auto_17427 - SURFACE
      ?auto_17428 - SURFACE
      ?auto_17429 - SURFACE
    )
    :vars
    (
      ?auto_17437 - HOIST
      ?auto_17440 - PLACE
      ?auto_17435 - PLACE
      ?auto_17434 - HOIST
      ?auto_17438 - SURFACE
      ?auto_17433 - PLACE
      ?auto_17432 - HOIST
      ?auto_17442 - SURFACE
      ?auto_17439 - PLACE
      ?auto_17430 - HOIST
      ?auto_17431 - SURFACE
      ?auto_17441 - TRUCK
      ?auto_17436 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17437 ?auto_17440 ) ( IS-CRATE ?auto_17429 ) ( not ( = ?auto_17428 ?auto_17429 ) ) ( not ( = ?auto_17427 ?auto_17428 ) ) ( not ( = ?auto_17427 ?auto_17429 ) ) ( not ( = ?auto_17435 ?auto_17440 ) ) ( HOIST-AT ?auto_17434 ?auto_17435 ) ( not ( = ?auto_17437 ?auto_17434 ) ) ( AVAILABLE ?auto_17434 ) ( SURFACE-AT ?auto_17429 ?auto_17435 ) ( ON ?auto_17429 ?auto_17438 ) ( CLEAR ?auto_17429 ) ( not ( = ?auto_17428 ?auto_17438 ) ) ( not ( = ?auto_17429 ?auto_17438 ) ) ( not ( = ?auto_17427 ?auto_17438 ) ) ( IS-CRATE ?auto_17428 ) ( not ( = ?auto_17433 ?auto_17440 ) ) ( not ( = ?auto_17435 ?auto_17433 ) ) ( HOIST-AT ?auto_17432 ?auto_17433 ) ( not ( = ?auto_17437 ?auto_17432 ) ) ( not ( = ?auto_17434 ?auto_17432 ) ) ( AVAILABLE ?auto_17432 ) ( SURFACE-AT ?auto_17428 ?auto_17433 ) ( ON ?auto_17428 ?auto_17442 ) ( CLEAR ?auto_17428 ) ( not ( = ?auto_17428 ?auto_17442 ) ) ( not ( = ?auto_17429 ?auto_17442 ) ) ( not ( = ?auto_17427 ?auto_17442 ) ) ( not ( = ?auto_17438 ?auto_17442 ) ) ( IS-CRATE ?auto_17427 ) ( not ( = ?auto_17426 ?auto_17427 ) ) ( not ( = ?auto_17428 ?auto_17426 ) ) ( not ( = ?auto_17429 ?auto_17426 ) ) ( not ( = ?auto_17438 ?auto_17426 ) ) ( not ( = ?auto_17442 ?auto_17426 ) ) ( not ( = ?auto_17439 ?auto_17440 ) ) ( not ( = ?auto_17435 ?auto_17439 ) ) ( not ( = ?auto_17433 ?auto_17439 ) ) ( HOIST-AT ?auto_17430 ?auto_17439 ) ( not ( = ?auto_17437 ?auto_17430 ) ) ( not ( = ?auto_17434 ?auto_17430 ) ) ( not ( = ?auto_17432 ?auto_17430 ) ) ( AVAILABLE ?auto_17430 ) ( SURFACE-AT ?auto_17427 ?auto_17439 ) ( ON ?auto_17427 ?auto_17431 ) ( CLEAR ?auto_17427 ) ( not ( = ?auto_17428 ?auto_17431 ) ) ( not ( = ?auto_17429 ?auto_17431 ) ) ( not ( = ?auto_17427 ?auto_17431 ) ) ( not ( = ?auto_17438 ?auto_17431 ) ) ( not ( = ?auto_17442 ?auto_17431 ) ) ( not ( = ?auto_17426 ?auto_17431 ) ) ( TRUCK-AT ?auto_17441 ?auto_17440 ) ( SURFACE-AT ?auto_17436 ?auto_17440 ) ( CLEAR ?auto_17436 ) ( IS-CRATE ?auto_17426 ) ( not ( = ?auto_17436 ?auto_17426 ) ) ( not ( = ?auto_17428 ?auto_17436 ) ) ( not ( = ?auto_17429 ?auto_17436 ) ) ( not ( = ?auto_17427 ?auto_17436 ) ) ( not ( = ?auto_17438 ?auto_17436 ) ) ( not ( = ?auto_17442 ?auto_17436 ) ) ( not ( = ?auto_17431 ?auto_17436 ) ) ( AVAILABLE ?auto_17437 ) ( IN ?auto_17426 ?auto_17441 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17427 ?auto_17428 ?auto_17429 )
      ( MAKE-3CRATE-VERIFY ?auto_17426 ?auto_17427 ?auto_17428 ?auto_17429 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17443 - SURFACE
      ?auto_17444 - SURFACE
      ?auto_17445 - SURFACE
      ?auto_17446 - SURFACE
      ?auto_17447 - SURFACE
    )
    :vars
    (
      ?auto_17454 - HOIST
      ?auto_17457 - PLACE
      ?auto_17453 - PLACE
      ?auto_17452 - HOIST
      ?auto_17455 - SURFACE
      ?auto_17451 - PLACE
      ?auto_17450 - HOIST
      ?auto_17459 - SURFACE
      ?auto_17456 - PLACE
      ?auto_17448 - HOIST
      ?auto_17449 - SURFACE
      ?auto_17458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17454 ?auto_17457 ) ( IS-CRATE ?auto_17447 ) ( not ( = ?auto_17446 ?auto_17447 ) ) ( not ( = ?auto_17445 ?auto_17446 ) ) ( not ( = ?auto_17445 ?auto_17447 ) ) ( not ( = ?auto_17453 ?auto_17457 ) ) ( HOIST-AT ?auto_17452 ?auto_17453 ) ( not ( = ?auto_17454 ?auto_17452 ) ) ( AVAILABLE ?auto_17452 ) ( SURFACE-AT ?auto_17447 ?auto_17453 ) ( ON ?auto_17447 ?auto_17455 ) ( CLEAR ?auto_17447 ) ( not ( = ?auto_17446 ?auto_17455 ) ) ( not ( = ?auto_17447 ?auto_17455 ) ) ( not ( = ?auto_17445 ?auto_17455 ) ) ( IS-CRATE ?auto_17446 ) ( not ( = ?auto_17451 ?auto_17457 ) ) ( not ( = ?auto_17453 ?auto_17451 ) ) ( HOIST-AT ?auto_17450 ?auto_17451 ) ( not ( = ?auto_17454 ?auto_17450 ) ) ( not ( = ?auto_17452 ?auto_17450 ) ) ( AVAILABLE ?auto_17450 ) ( SURFACE-AT ?auto_17446 ?auto_17451 ) ( ON ?auto_17446 ?auto_17459 ) ( CLEAR ?auto_17446 ) ( not ( = ?auto_17446 ?auto_17459 ) ) ( not ( = ?auto_17447 ?auto_17459 ) ) ( not ( = ?auto_17445 ?auto_17459 ) ) ( not ( = ?auto_17455 ?auto_17459 ) ) ( IS-CRATE ?auto_17445 ) ( not ( = ?auto_17444 ?auto_17445 ) ) ( not ( = ?auto_17446 ?auto_17444 ) ) ( not ( = ?auto_17447 ?auto_17444 ) ) ( not ( = ?auto_17455 ?auto_17444 ) ) ( not ( = ?auto_17459 ?auto_17444 ) ) ( not ( = ?auto_17456 ?auto_17457 ) ) ( not ( = ?auto_17453 ?auto_17456 ) ) ( not ( = ?auto_17451 ?auto_17456 ) ) ( HOIST-AT ?auto_17448 ?auto_17456 ) ( not ( = ?auto_17454 ?auto_17448 ) ) ( not ( = ?auto_17452 ?auto_17448 ) ) ( not ( = ?auto_17450 ?auto_17448 ) ) ( AVAILABLE ?auto_17448 ) ( SURFACE-AT ?auto_17445 ?auto_17456 ) ( ON ?auto_17445 ?auto_17449 ) ( CLEAR ?auto_17445 ) ( not ( = ?auto_17446 ?auto_17449 ) ) ( not ( = ?auto_17447 ?auto_17449 ) ) ( not ( = ?auto_17445 ?auto_17449 ) ) ( not ( = ?auto_17455 ?auto_17449 ) ) ( not ( = ?auto_17459 ?auto_17449 ) ) ( not ( = ?auto_17444 ?auto_17449 ) ) ( TRUCK-AT ?auto_17458 ?auto_17457 ) ( SURFACE-AT ?auto_17443 ?auto_17457 ) ( CLEAR ?auto_17443 ) ( IS-CRATE ?auto_17444 ) ( not ( = ?auto_17443 ?auto_17444 ) ) ( not ( = ?auto_17446 ?auto_17443 ) ) ( not ( = ?auto_17447 ?auto_17443 ) ) ( not ( = ?auto_17445 ?auto_17443 ) ) ( not ( = ?auto_17455 ?auto_17443 ) ) ( not ( = ?auto_17459 ?auto_17443 ) ) ( not ( = ?auto_17449 ?auto_17443 ) ) ( AVAILABLE ?auto_17454 ) ( IN ?auto_17444 ?auto_17458 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17445 ?auto_17446 ?auto_17447 )
      ( MAKE-4CRATE-VERIFY ?auto_17443 ?auto_17444 ?auto_17445 ?auto_17446 ?auto_17447 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17460 - SURFACE
      ?auto_17461 - SURFACE
    )
    :vars
    (
      ?auto_17470 - HOIST
      ?auto_17474 - PLACE
      ?auto_17473 - SURFACE
      ?auto_17467 - PLACE
      ?auto_17466 - HOIST
      ?auto_17471 - SURFACE
      ?auto_17465 - PLACE
      ?auto_17464 - HOIST
      ?auto_17476 - SURFACE
      ?auto_17468 - SURFACE
      ?auto_17472 - PLACE
      ?auto_17462 - HOIST
      ?auto_17463 - SURFACE
      ?auto_17469 - SURFACE
      ?auto_17475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17470 ?auto_17474 ) ( IS-CRATE ?auto_17461 ) ( not ( = ?auto_17460 ?auto_17461 ) ) ( not ( = ?auto_17473 ?auto_17460 ) ) ( not ( = ?auto_17473 ?auto_17461 ) ) ( not ( = ?auto_17467 ?auto_17474 ) ) ( HOIST-AT ?auto_17466 ?auto_17467 ) ( not ( = ?auto_17470 ?auto_17466 ) ) ( AVAILABLE ?auto_17466 ) ( SURFACE-AT ?auto_17461 ?auto_17467 ) ( ON ?auto_17461 ?auto_17471 ) ( CLEAR ?auto_17461 ) ( not ( = ?auto_17460 ?auto_17471 ) ) ( not ( = ?auto_17461 ?auto_17471 ) ) ( not ( = ?auto_17473 ?auto_17471 ) ) ( IS-CRATE ?auto_17460 ) ( not ( = ?auto_17465 ?auto_17474 ) ) ( not ( = ?auto_17467 ?auto_17465 ) ) ( HOIST-AT ?auto_17464 ?auto_17465 ) ( not ( = ?auto_17470 ?auto_17464 ) ) ( not ( = ?auto_17466 ?auto_17464 ) ) ( AVAILABLE ?auto_17464 ) ( SURFACE-AT ?auto_17460 ?auto_17465 ) ( ON ?auto_17460 ?auto_17476 ) ( CLEAR ?auto_17460 ) ( not ( = ?auto_17460 ?auto_17476 ) ) ( not ( = ?auto_17461 ?auto_17476 ) ) ( not ( = ?auto_17473 ?auto_17476 ) ) ( not ( = ?auto_17471 ?auto_17476 ) ) ( IS-CRATE ?auto_17473 ) ( not ( = ?auto_17468 ?auto_17473 ) ) ( not ( = ?auto_17460 ?auto_17468 ) ) ( not ( = ?auto_17461 ?auto_17468 ) ) ( not ( = ?auto_17471 ?auto_17468 ) ) ( not ( = ?auto_17476 ?auto_17468 ) ) ( not ( = ?auto_17472 ?auto_17474 ) ) ( not ( = ?auto_17467 ?auto_17472 ) ) ( not ( = ?auto_17465 ?auto_17472 ) ) ( HOIST-AT ?auto_17462 ?auto_17472 ) ( not ( = ?auto_17470 ?auto_17462 ) ) ( not ( = ?auto_17466 ?auto_17462 ) ) ( not ( = ?auto_17464 ?auto_17462 ) ) ( AVAILABLE ?auto_17462 ) ( SURFACE-AT ?auto_17473 ?auto_17472 ) ( ON ?auto_17473 ?auto_17463 ) ( CLEAR ?auto_17473 ) ( not ( = ?auto_17460 ?auto_17463 ) ) ( not ( = ?auto_17461 ?auto_17463 ) ) ( not ( = ?auto_17473 ?auto_17463 ) ) ( not ( = ?auto_17471 ?auto_17463 ) ) ( not ( = ?auto_17476 ?auto_17463 ) ) ( not ( = ?auto_17468 ?auto_17463 ) ) ( SURFACE-AT ?auto_17469 ?auto_17474 ) ( CLEAR ?auto_17469 ) ( IS-CRATE ?auto_17468 ) ( not ( = ?auto_17469 ?auto_17468 ) ) ( not ( = ?auto_17460 ?auto_17469 ) ) ( not ( = ?auto_17461 ?auto_17469 ) ) ( not ( = ?auto_17473 ?auto_17469 ) ) ( not ( = ?auto_17471 ?auto_17469 ) ) ( not ( = ?auto_17476 ?auto_17469 ) ) ( not ( = ?auto_17463 ?auto_17469 ) ) ( AVAILABLE ?auto_17470 ) ( IN ?auto_17468 ?auto_17475 ) ( TRUCK-AT ?auto_17475 ?auto_17467 ) )
    :subtasks
    ( ( !DRIVE ?auto_17475 ?auto_17467 ?auto_17474 )
      ( MAKE-2CRATE ?auto_17473 ?auto_17460 ?auto_17461 )
      ( MAKE-1CRATE-VERIFY ?auto_17460 ?auto_17461 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17477 - SURFACE
      ?auto_17478 - SURFACE
      ?auto_17479 - SURFACE
    )
    :vars
    (
      ?auto_17481 - HOIST
      ?auto_17489 - PLACE
      ?auto_17483 - PLACE
      ?auto_17485 - HOIST
      ?auto_17480 - SURFACE
      ?auto_17482 - PLACE
      ?auto_17488 - HOIST
      ?auto_17487 - SURFACE
      ?auto_17484 - SURFACE
      ?auto_17492 - PLACE
      ?auto_17493 - HOIST
      ?auto_17491 - SURFACE
      ?auto_17486 - SURFACE
      ?auto_17490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17481 ?auto_17489 ) ( IS-CRATE ?auto_17479 ) ( not ( = ?auto_17478 ?auto_17479 ) ) ( not ( = ?auto_17477 ?auto_17478 ) ) ( not ( = ?auto_17477 ?auto_17479 ) ) ( not ( = ?auto_17483 ?auto_17489 ) ) ( HOIST-AT ?auto_17485 ?auto_17483 ) ( not ( = ?auto_17481 ?auto_17485 ) ) ( AVAILABLE ?auto_17485 ) ( SURFACE-AT ?auto_17479 ?auto_17483 ) ( ON ?auto_17479 ?auto_17480 ) ( CLEAR ?auto_17479 ) ( not ( = ?auto_17478 ?auto_17480 ) ) ( not ( = ?auto_17479 ?auto_17480 ) ) ( not ( = ?auto_17477 ?auto_17480 ) ) ( IS-CRATE ?auto_17478 ) ( not ( = ?auto_17482 ?auto_17489 ) ) ( not ( = ?auto_17483 ?auto_17482 ) ) ( HOIST-AT ?auto_17488 ?auto_17482 ) ( not ( = ?auto_17481 ?auto_17488 ) ) ( not ( = ?auto_17485 ?auto_17488 ) ) ( AVAILABLE ?auto_17488 ) ( SURFACE-AT ?auto_17478 ?auto_17482 ) ( ON ?auto_17478 ?auto_17487 ) ( CLEAR ?auto_17478 ) ( not ( = ?auto_17478 ?auto_17487 ) ) ( not ( = ?auto_17479 ?auto_17487 ) ) ( not ( = ?auto_17477 ?auto_17487 ) ) ( not ( = ?auto_17480 ?auto_17487 ) ) ( IS-CRATE ?auto_17477 ) ( not ( = ?auto_17484 ?auto_17477 ) ) ( not ( = ?auto_17478 ?auto_17484 ) ) ( not ( = ?auto_17479 ?auto_17484 ) ) ( not ( = ?auto_17480 ?auto_17484 ) ) ( not ( = ?auto_17487 ?auto_17484 ) ) ( not ( = ?auto_17492 ?auto_17489 ) ) ( not ( = ?auto_17483 ?auto_17492 ) ) ( not ( = ?auto_17482 ?auto_17492 ) ) ( HOIST-AT ?auto_17493 ?auto_17492 ) ( not ( = ?auto_17481 ?auto_17493 ) ) ( not ( = ?auto_17485 ?auto_17493 ) ) ( not ( = ?auto_17488 ?auto_17493 ) ) ( AVAILABLE ?auto_17493 ) ( SURFACE-AT ?auto_17477 ?auto_17492 ) ( ON ?auto_17477 ?auto_17491 ) ( CLEAR ?auto_17477 ) ( not ( = ?auto_17478 ?auto_17491 ) ) ( not ( = ?auto_17479 ?auto_17491 ) ) ( not ( = ?auto_17477 ?auto_17491 ) ) ( not ( = ?auto_17480 ?auto_17491 ) ) ( not ( = ?auto_17487 ?auto_17491 ) ) ( not ( = ?auto_17484 ?auto_17491 ) ) ( SURFACE-AT ?auto_17486 ?auto_17489 ) ( CLEAR ?auto_17486 ) ( IS-CRATE ?auto_17484 ) ( not ( = ?auto_17486 ?auto_17484 ) ) ( not ( = ?auto_17478 ?auto_17486 ) ) ( not ( = ?auto_17479 ?auto_17486 ) ) ( not ( = ?auto_17477 ?auto_17486 ) ) ( not ( = ?auto_17480 ?auto_17486 ) ) ( not ( = ?auto_17487 ?auto_17486 ) ) ( not ( = ?auto_17491 ?auto_17486 ) ) ( AVAILABLE ?auto_17481 ) ( IN ?auto_17484 ?auto_17490 ) ( TRUCK-AT ?auto_17490 ?auto_17483 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17478 ?auto_17479 )
      ( MAKE-2CRATE-VERIFY ?auto_17477 ?auto_17478 ?auto_17479 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17494 - SURFACE
      ?auto_17495 - SURFACE
      ?auto_17496 - SURFACE
      ?auto_17497 - SURFACE
    )
    :vars
    (
      ?auto_17501 - HOIST
      ?auto_17504 - PLACE
      ?auto_17499 - PLACE
      ?auto_17498 - HOIST
      ?auto_17510 - SURFACE
      ?auto_17502 - PLACE
      ?auto_17503 - HOIST
      ?auto_17509 - SURFACE
      ?auto_17507 - PLACE
      ?auto_17508 - HOIST
      ?auto_17500 - SURFACE
      ?auto_17505 - SURFACE
      ?auto_17506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17501 ?auto_17504 ) ( IS-CRATE ?auto_17497 ) ( not ( = ?auto_17496 ?auto_17497 ) ) ( not ( = ?auto_17495 ?auto_17496 ) ) ( not ( = ?auto_17495 ?auto_17497 ) ) ( not ( = ?auto_17499 ?auto_17504 ) ) ( HOIST-AT ?auto_17498 ?auto_17499 ) ( not ( = ?auto_17501 ?auto_17498 ) ) ( AVAILABLE ?auto_17498 ) ( SURFACE-AT ?auto_17497 ?auto_17499 ) ( ON ?auto_17497 ?auto_17510 ) ( CLEAR ?auto_17497 ) ( not ( = ?auto_17496 ?auto_17510 ) ) ( not ( = ?auto_17497 ?auto_17510 ) ) ( not ( = ?auto_17495 ?auto_17510 ) ) ( IS-CRATE ?auto_17496 ) ( not ( = ?auto_17502 ?auto_17504 ) ) ( not ( = ?auto_17499 ?auto_17502 ) ) ( HOIST-AT ?auto_17503 ?auto_17502 ) ( not ( = ?auto_17501 ?auto_17503 ) ) ( not ( = ?auto_17498 ?auto_17503 ) ) ( AVAILABLE ?auto_17503 ) ( SURFACE-AT ?auto_17496 ?auto_17502 ) ( ON ?auto_17496 ?auto_17509 ) ( CLEAR ?auto_17496 ) ( not ( = ?auto_17496 ?auto_17509 ) ) ( not ( = ?auto_17497 ?auto_17509 ) ) ( not ( = ?auto_17495 ?auto_17509 ) ) ( not ( = ?auto_17510 ?auto_17509 ) ) ( IS-CRATE ?auto_17495 ) ( not ( = ?auto_17494 ?auto_17495 ) ) ( not ( = ?auto_17496 ?auto_17494 ) ) ( not ( = ?auto_17497 ?auto_17494 ) ) ( not ( = ?auto_17510 ?auto_17494 ) ) ( not ( = ?auto_17509 ?auto_17494 ) ) ( not ( = ?auto_17507 ?auto_17504 ) ) ( not ( = ?auto_17499 ?auto_17507 ) ) ( not ( = ?auto_17502 ?auto_17507 ) ) ( HOIST-AT ?auto_17508 ?auto_17507 ) ( not ( = ?auto_17501 ?auto_17508 ) ) ( not ( = ?auto_17498 ?auto_17508 ) ) ( not ( = ?auto_17503 ?auto_17508 ) ) ( AVAILABLE ?auto_17508 ) ( SURFACE-AT ?auto_17495 ?auto_17507 ) ( ON ?auto_17495 ?auto_17500 ) ( CLEAR ?auto_17495 ) ( not ( = ?auto_17496 ?auto_17500 ) ) ( not ( = ?auto_17497 ?auto_17500 ) ) ( not ( = ?auto_17495 ?auto_17500 ) ) ( not ( = ?auto_17510 ?auto_17500 ) ) ( not ( = ?auto_17509 ?auto_17500 ) ) ( not ( = ?auto_17494 ?auto_17500 ) ) ( SURFACE-AT ?auto_17505 ?auto_17504 ) ( CLEAR ?auto_17505 ) ( IS-CRATE ?auto_17494 ) ( not ( = ?auto_17505 ?auto_17494 ) ) ( not ( = ?auto_17496 ?auto_17505 ) ) ( not ( = ?auto_17497 ?auto_17505 ) ) ( not ( = ?auto_17495 ?auto_17505 ) ) ( not ( = ?auto_17510 ?auto_17505 ) ) ( not ( = ?auto_17509 ?auto_17505 ) ) ( not ( = ?auto_17500 ?auto_17505 ) ) ( AVAILABLE ?auto_17501 ) ( IN ?auto_17494 ?auto_17506 ) ( TRUCK-AT ?auto_17506 ?auto_17499 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17495 ?auto_17496 ?auto_17497 )
      ( MAKE-3CRATE-VERIFY ?auto_17494 ?auto_17495 ?auto_17496 ?auto_17497 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17511 - SURFACE
      ?auto_17512 - SURFACE
      ?auto_17513 - SURFACE
      ?auto_17514 - SURFACE
      ?auto_17515 - SURFACE
    )
    :vars
    (
      ?auto_17519 - HOIST
      ?auto_17522 - PLACE
      ?auto_17517 - PLACE
      ?auto_17516 - HOIST
      ?auto_17527 - SURFACE
      ?auto_17520 - PLACE
      ?auto_17521 - HOIST
      ?auto_17526 - SURFACE
      ?auto_17524 - PLACE
      ?auto_17525 - HOIST
      ?auto_17518 - SURFACE
      ?auto_17523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17519 ?auto_17522 ) ( IS-CRATE ?auto_17515 ) ( not ( = ?auto_17514 ?auto_17515 ) ) ( not ( = ?auto_17513 ?auto_17514 ) ) ( not ( = ?auto_17513 ?auto_17515 ) ) ( not ( = ?auto_17517 ?auto_17522 ) ) ( HOIST-AT ?auto_17516 ?auto_17517 ) ( not ( = ?auto_17519 ?auto_17516 ) ) ( AVAILABLE ?auto_17516 ) ( SURFACE-AT ?auto_17515 ?auto_17517 ) ( ON ?auto_17515 ?auto_17527 ) ( CLEAR ?auto_17515 ) ( not ( = ?auto_17514 ?auto_17527 ) ) ( not ( = ?auto_17515 ?auto_17527 ) ) ( not ( = ?auto_17513 ?auto_17527 ) ) ( IS-CRATE ?auto_17514 ) ( not ( = ?auto_17520 ?auto_17522 ) ) ( not ( = ?auto_17517 ?auto_17520 ) ) ( HOIST-AT ?auto_17521 ?auto_17520 ) ( not ( = ?auto_17519 ?auto_17521 ) ) ( not ( = ?auto_17516 ?auto_17521 ) ) ( AVAILABLE ?auto_17521 ) ( SURFACE-AT ?auto_17514 ?auto_17520 ) ( ON ?auto_17514 ?auto_17526 ) ( CLEAR ?auto_17514 ) ( not ( = ?auto_17514 ?auto_17526 ) ) ( not ( = ?auto_17515 ?auto_17526 ) ) ( not ( = ?auto_17513 ?auto_17526 ) ) ( not ( = ?auto_17527 ?auto_17526 ) ) ( IS-CRATE ?auto_17513 ) ( not ( = ?auto_17512 ?auto_17513 ) ) ( not ( = ?auto_17514 ?auto_17512 ) ) ( not ( = ?auto_17515 ?auto_17512 ) ) ( not ( = ?auto_17527 ?auto_17512 ) ) ( not ( = ?auto_17526 ?auto_17512 ) ) ( not ( = ?auto_17524 ?auto_17522 ) ) ( not ( = ?auto_17517 ?auto_17524 ) ) ( not ( = ?auto_17520 ?auto_17524 ) ) ( HOIST-AT ?auto_17525 ?auto_17524 ) ( not ( = ?auto_17519 ?auto_17525 ) ) ( not ( = ?auto_17516 ?auto_17525 ) ) ( not ( = ?auto_17521 ?auto_17525 ) ) ( AVAILABLE ?auto_17525 ) ( SURFACE-AT ?auto_17513 ?auto_17524 ) ( ON ?auto_17513 ?auto_17518 ) ( CLEAR ?auto_17513 ) ( not ( = ?auto_17514 ?auto_17518 ) ) ( not ( = ?auto_17515 ?auto_17518 ) ) ( not ( = ?auto_17513 ?auto_17518 ) ) ( not ( = ?auto_17527 ?auto_17518 ) ) ( not ( = ?auto_17526 ?auto_17518 ) ) ( not ( = ?auto_17512 ?auto_17518 ) ) ( SURFACE-AT ?auto_17511 ?auto_17522 ) ( CLEAR ?auto_17511 ) ( IS-CRATE ?auto_17512 ) ( not ( = ?auto_17511 ?auto_17512 ) ) ( not ( = ?auto_17514 ?auto_17511 ) ) ( not ( = ?auto_17515 ?auto_17511 ) ) ( not ( = ?auto_17513 ?auto_17511 ) ) ( not ( = ?auto_17527 ?auto_17511 ) ) ( not ( = ?auto_17526 ?auto_17511 ) ) ( not ( = ?auto_17518 ?auto_17511 ) ) ( AVAILABLE ?auto_17519 ) ( IN ?auto_17512 ?auto_17523 ) ( TRUCK-AT ?auto_17523 ?auto_17517 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17513 ?auto_17514 ?auto_17515 )
      ( MAKE-4CRATE-VERIFY ?auto_17511 ?auto_17512 ?auto_17513 ?auto_17514 ?auto_17515 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17528 - SURFACE
      ?auto_17529 - SURFACE
    )
    :vars
    (
      ?auto_17533 - HOIST
      ?auto_17538 - PLACE
      ?auto_17536 - SURFACE
      ?auto_17531 - PLACE
      ?auto_17530 - HOIST
      ?auto_17544 - SURFACE
      ?auto_17534 - PLACE
      ?auto_17537 - HOIST
      ?auto_17543 - SURFACE
      ?auto_17535 - SURFACE
      ?auto_17541 - PLACE
      ?auto_17542 - HOIST
      ?auto_17532 - SURFACE
      ?auto_17539 - SURFACE
      ?auto_17540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17533 ?auto_17538 ) ( IS-CRATE ?auto_17529 ) ( not ( = ?auto_17528 ?auto_17529 ) ) ( not ( = ?auto_17536 ?auto_17528 ) ) ( not ( = ?auto_17536 ?auto_17529 ) ) ( not ( = ?auto_17531 ?auto_17538 ) ) ( HOIST-AT ?auto_17530 ?auto_17531 ) ( not ( = ?auto_17533 ?auto_17530 ) ) ( SURFACE-AT ?auto_17529 ?auto_17531 ) ( ON ?auto_17529 ?auto_17544 ) ( CLEAR ?auto_17529 ) ( not ( = ?auto_17528 ?auto_17544 ) ) ( not ( = ?auto_17529 ?auto_17544 ) ) ( not ( = ?auto_17536 ?auto_17544 ) ) ( IS-CRATE ?auto_17528 ) ( not ( = ?auto_17534 ?auto_17538 ) ) ( not ( = ?auto_17531 ?auto_17534 ) ) ( HOIST-AT ?auto_17537 ?auto_17534 ) ( not ( = ?auto_17533 ?auto_17537 ) ) ( not ( = ?auto_17530 ?auto_17537 ) ) ( AVAILABLE ?auto_17537 ) ( SURFACE-AT ?auto_17528 ?auto_17534 ) ( ON ?auto_17528 ?auto_17543 ) ( CLEAR ?auto_17528 ) ( not ( = ?auto_17528 ?auto_17543 ) ) ( not ( = ?auto_17529 ?auto_17543 ) ) ( not ( = ?auto_17536 ?auto_17543 ) ) ( not ( = ?auto_17544 ?auto_17543 ) ) ( IS-CRATE ?auto_17536 ) ( not ( = ?auto_17535 ?auto_17536 ) ) ( not ( = ?auto_17528 ?auto_17535 ) ) ( not ( = ?auto_17529 ?auto_17535 ) ) ( not ( = ?auto_17544 ?auto_17535 ) ) ( not ( = ?auto_17543 ?auto_17535 ) ) ( not ( = ?auto_17541 ?auto_17538 ) ) ( not ( = ?auto_17531 ?auto_17541 ) ) ( not ( = ?auto_17534 ?auto_17541 ) ) ( HOIST-AT ?auto_17542 ?auto_17541 ) ( not ( = ?auto_17533 ?auto_17542 ) ) ( not ( = ?auto_17530 ?auto_17542 ) ) ( not ( = ?auto_17537 ?auto_17542 ) ) ( AVAILABLE ?auto_17542 ) ( SURFACE-AT ?auto_17536 ?auto_17541 ) ( ON ?auto_17536 ?auto_17532 ) ( CLEAR ?auto_17536 ) ( not ( = ?auto_17528 ?auto_17532 ) ) ( not ( = ?auto_17529 ?auto_17532 ) ) ( not ( = ?auto_17536 ?auto_17532 ) ) ( not ( = ?auto_17544 ?auto_17532 ) ) ( not ( = ?auto_17543 ?auto_17532 ) ) ( not ( = ?auto_17535 ?auto_17532 ) ) ( SURFACE-AT ?auto_17539 ?auto_17538 ) ( CLEAR ?auto_17539 ) ( IS-CRATE ?auto_17535 ) ( not ( = ?auto_17539 ?auto_17535 ) ) ( not ( = ?auto_17528 ?auto_17539 ) ) ( not ( = ?auto_17529 ?auto_17539 ) ) ( not ( = ?auto_17536 ?auto_17539 ) ) ( not ( = ?auto_17544 ?auto_17539 ) ) ( not ( = ?auto_17543 ?auto_17539 ) ) ( not ( = ?auto_17532 ?auto_17539 ) ) ( AVAILABLE ?auto_17533 ) ( TRUCK-AT ?auto_17540 ?auto_17531 ) ( LIFTING ?auto_17530 ?auto_17535 ) )
    :subtasks
    ( ( !LOAD ?auto_17530 ?auto_17535 ?auto_17540 ?auto_17531 )
      ( MAKE-2CRATE ?auto_17536 ?auto_17528 ?auto_17529 )
      ( MAKE-1CRATE-VERIFY ?auto_17528 ?auto_17529 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17545 - SURFACE
      ?auto_17546 - SURFACE
      ?auto_17547 - SURFACE
    )
    :vars
    (
      ?auto_17560 - HOIST
      ?auto_17556 - PLACE
      ?auto_17561 - PLACE
      ?auto_17551 - HOIST
      ?auto_17557 - SURFACE
      ?auto_17554 - PLACE
      ?auto_17555 - HOIST
      ?auto_17549 - SURFACE
      ?auto_17558 - SURFACE
      ?auto_17548 - PLACE
      ?auto_17550 - HOIST
      ?auto_17559 - SURFACE
      ?auto_17552 - SURFACE
      ?auto_17553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17560 ?auto_17556 ) ( IS-CRATE ?auto_17547 ) ( not ( = ?auto_17546 ?auto_17547 ) ) ( not ( = ?auto_17545 ?auto_17546 ) ) ( not ( = ?auto_17545 ?auto_17547 ) ) ( not ( = ?auto_17561 ?auto_17556 ) ) ( HOIST-AT ?auto_17551 ?auto_17561 ) ( not ( = ?auto_17560 ?auto_17551 ) ) ( SURFACE-AT ?auto_17547 ?auto_17561 ) ( ON ?auto_17547 ?auto_17557 ) ( CLEAR ?auto_17547 ) ( not ( = ?auto_17546 ?auto_17557 ) ) ( not ( = ?auto_17547 ?auto_17557 ) ) ( not ( = ?auto_17545 ?auto_17557 ) ) ( IS-CRATE ?auto_17546 ) ( not ( = ?auto_17554 ?auto_17556 ) ) ( not ( = ?auto_17561 ?auto_17554 ) ) ( HOIST-AT ?auto_17555 ?auto_17554 ) ( not ( = ?auto_17560 ?auto_17555 ) ) ( not ( = ?auto_17551 ?auto_17555 ) ) ( AVAILABLE ?auto_17555 ) ( SURFACE-AT ?auto_17546 ?auto_17554 ) ( ON ?auto_17546 ?auto_17549 ) ( CLEAR ?auto_17546 ) ( not ( = ?auto_17546 ?auto_17549 ) ) ( not ( = ?auto_17547 ?auto_17549 ) ) ( not ( = ?auto_17545 ?auto_17549 ) ) ( not ( = ?auto_17557 ?auto_17549 ) ) ( IS-CRATE ?auto_17545 ) ( not ( = ?auto_17558 ?auto_17545 ) ) ( not ( = ?auto_17546 ?auto_17558 ) ) ( not ( = ?auto_17547 ?auto_17558 ) ) ( not ( = ?auto_17557 ?auto_17558 ) ) ( not ( = ?auto_17549 ?auto_17558 ) ) ( not ( = ?auto_17548 ?auto_17556 ) ) ( not ( = ?auto_17561 ?auto_17548 ) ) ( not ( = ?auto_17554 ?auto_17548 ) ) ( HOIST-AT ?auto_17550 ?auto_17548 ) ( not ( = ?auto_17560 ?auto_17550 ) ) ( not ( = ?auto_17551 ?auto_17550 ) ) ( not ( = ?auto_17555 ?auto_17550 ) ) ( AVAILABLE ?auto_17550 ) ( SURFACE-AT ?auto_17545 ?auto_17548 ) ( ON ?auto_17545 ?auto_17559 ) ( CLEAR ?auto_17545 ) ( not ( = ?auto_17546 ?auto_17559 ) ) ( not ( = ?auto_17547 ?auto_17559 ) ) ( not ( = ?auto_17545 ?auto_17559 ) ) ( not ( = ?auto_17557 ?auto_17559 ) ) ( not ( = ?auto_17549 ?auto_17559 ) ) ( not ( = ?auto_17558 ?auto_17559 ) ) ( SURFACE-AT ?auto_17552 ?auto_17556 ) ( CLEAR ?auto_17552 ) ( IS-CRATE ?auto_17558 ) ( not ( = ?auto_17552 ?auto_17558 ) ) ( not ( = ?auto_17546 ?auto_17552 ) ) ( not ( = ?auto_17547 ?auto_17552 ) ) ( not ( = ?auto_17545 ?auto_17552 ) ) ( not ( = ?auto_17557 ?auto_17552 ) ) ( not ( = ?auto_17549 ?auto_17552 ) ) ( not ( = ?auto_17559 ?auto_17552 ) ) ( AVAILABLE ?auto_17560 ) ( TRUCK-AT ?auto_17553 ?auto_17561 ) ( LIFTING ?auto_17551 ?auto_17558 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17546 ?auto_17547 )
      ( MAKE-2CRATE-VERIFY ?auto_17545 ?auto_17546 ?auto_17547 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17562 - SURFACE
      ?auto_17563 - SURFACE
      ?auto_17564 - SURFACE
      ?auto_17565 - SURFACE
    )
    :vars
    (
      ?auto_17575 - HOIST
      ?auto_17570 - PLACE
      ?auto_17576 - PLACE
      ?auto_17571 - HOIST
      ?auto_17577 - SURFACE
      ?auto_17574 - PLACE
      ?auto_17578 - HOIST
      ?auto_17573 - SURFACE
      ?auto_17567 - PLACE
      ?auto_17569 - HOIST
      ?auto_17568 - SURFACE
      ?auto_17566 - SURFACE
      ?auto_17572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17575 ?auto_17570 ) ( IS-CRATE ?auto_17565 ) ( not ( = ?auto_17564 ?auto_17565 ) ) ( not ( = ?auto_17563 ?auto_17564 ) ) ( not ( = ?auto_17563 ?auto_17565 ) ) ( not ( = ?auto_17576 ?auto_17570 ) ) ( HOIST-AT ?auto_17571 ?auto_17576 ) ( not ( = ?auto_17575 ?auto_17571 ) ) ( SURFACE-AT ?auto_17565 ?auto_17576 ) ( ON ?auto_17565 ?auto_17577 ) ( CLEAR ?auto_17565 ) ( not ( = ?auto_17564 ?auto_17577 ) ) ( not ( = ?auto_17565 ?auto_17577 ) ) ( not ( = ?auto_17563 ?auto_17577 ) ) ( IS-CRATE ?auto_17564 ) ( not ( = ?auto_17574 ?auto_17570 ) ) ( not ( = ?auto_17576 ?auto_17574 ) ) ( HOIST-AT ?auto_17578 ?auto_17574 ) ( not ( = ?auto_17575 ?auto_17578 ) ) ( not ( = ?auto_17571 ?auto_17578 ) ) ( AVAILABLE ?auto_17578 ) ( SURFACE-AT ?auto_17564 ?auto_17574 ) ( ON ?auto_17564 ?auto_17573 ) ( CLEAR ?auto_17564 ) ( not ( = ?auto_17564 ?auto_17573 ) ) ( not ( = ?auto_17565 ?auto_17573 ) ) ( not ( = ?auto_17563 ?auto_17573 ) ) ( not ( = ?auto_17577 ?auto_17573 ) ) ( IS-CRATE ?auto_17563 ) ( not ( = ?auto_17562 ?auto_17563 ) ) ( not ( = ?auto_17564 ?auto_17562 ) ) ( not ( = ?auto_17565 ?auto_17562 ) ) ( not ( = ?auto_17577 ?auto_17562 ) ) ( not ( = ?auto_17573 ?auto_17562 ) ) ( not ( = ?auto_17567 ?auto_17570 ) ) ( not ( = ?auto_17576 ?auto_17567 ) ) ( not ( = ?auto_17574 ?auto_17567 ) ) ( HOIST-AT ?auto_17569 ?auto_17567 ) ( not ( = ?auto_17575 ?auto_17569 ) ) ( not ( = ?auto_17571 ?auto_17569 ) ) ( not ( = ?auto_17578 ?auto_17569 ) ) ( AVAILABLE ?auto_17569 ) ( SURFACE-AT ?auto_17563 ?auto_17567 ) ( ON ?auto_17563 ?auto_17568 ) ( CLEAR ?auto_17563 ) ( not ( = ?auto_17564 ?auto_17568 ) ) ( not ( = ?auto_17565 ?auto_17568 ) ) ( not ( = ?auto_17563 ?auto_17568 ) ) ( not ( = ?auto_17577 ?auto_17568 ) ) ( not ( = ?auto_17573 ?auto_17568 ) ) ( not ( = ?auto_17562 ?auto_17568 ) ) ( SURFACE-AT ?auto_17566 ?auto_17570 ) ( CLEAR ?auto_17566 ) ( IS-CRATE ?auto_17562 ) ( not ( = ?auto_17566 ?auto_17562 ) ) ( not ( = ?auto_17564 ?auto_17566 ) ) ( not ( = ?auto_17565 ?auto_17566 ) ) ( not ( = ?auto_17563 ?auto_17566 ) ) ( not ( = ?auto_17577 ?auto_17566 ) ) ( not ( = ?auto_17573 ?auto_17566 ) ) ( not ( = ?auto_17568 ?auto_17566 ) ) ( AVAILABLE ?auto_17575 ) ( TRUCK-AT ?auto_17572 ?auto_17576 ) ( LIFTING ?auto_17571 ?auto_17562 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17563 ?auto_17564 ?auto_17565 )
      ( MAKE-3CRATE-VERIFY ?auto_17562 ?auto_17563 ?auto_17564 ?auto_17565 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17579 - SURFACE
      ?auto_17580 - SURFACE
      ?auto_17581 - SURFACE
      ?auto_17582 - SURFACE
      ?auto_17583 - SURFACE
    )
    :vars
    (
      ?auto_17592 - HOIST
      ?auto_17587 - PLACE
      ?auto_17593 - PLACE
      ?auto_17588 - HOIST
      ?auto_17594 - SURFACE
      ?auto_17591 - PLACE
      ?auto_17595 - HOIST
      ?auto_17590 - SURFACE
      ?auto_17584 - PLACE
      ?auto_17586 - HOIST
      ?auto_17585 - SURFACE
      ?auto_17589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17592 ?auto_17587 ) ( IS-CRATE ?auto_17583 ) ( not ( = ?auto_17582 ?auto_17583 ) ) ( not ( = ?auto_17581 ?auto_17582 ) ) ( not ( = ?auto_17581 ?auto_17583 ) ) ( not ( = ?auto_17593 ?auto_17587 ) ) ( HOIST-AT ?auto_17588 ?auto_17593 ) ( not ( = ?auto_17592 ?auto_17588 ) ) ( SURFACE-AT ?auto_17583 ?auto_17593 ) ( ON ?auto_17583 ?auto_17594 ) ( CLEAR ?auto_17583 ) ( not ( = ?auto_17582 ?auto_17594 ) ) ( not ( = ?auto_17583 ?auto_17594 ) ) ( not ( = ?auto_17581 ?auto_17594 ) ) ( IS-CRATE ?auto_17582 ) ( not ( = ?auto_17591 ?auto_17587 ) ) ( not ( = ?auto_17593 ?auto_17591 ) ) ( HOIST-AT ?auto_17595 ?auto_17591 ) ( not ( = ?auto_17592 ?auto_17595 ) ) ( not ( = ?auto_17588 ?auto_17595 ) ) ( AVAILABLE ?auto_17595 ) ( SURFACE-AT ?auto_17582 ?auto_17591 ) ( ON ?auto_17582 ?auto_17590 ) ( CLEAR ?auto_17582 ) ( not ( = ?auto_17582 ?auto_17590 ) ) ( not ( = ?auto_17583 ?auto_17590 ) ) ( not ( = ?auto_17581 ?auto_17590 ) ) ( not ( = ?auto_17594 ?auto_17590 ) ) ( IS-CRATE ?auto_17581 ) ( not ( = ?auto_17580 ?auto_17581 ) ) ( not ( = ?auto_17582 ?auto_17580 ) ) ( not ( = ?auto_17583 ?auto_17580 ) ) ( not ( = ?auto_17594 ?auto_17580 ) ) ( not ( = ?auto_17590 ?auto_17580 ) ) ( not ( = ?auto_17584 ?auto_17587 ) ) ( not ( = ?auto_17593 ?auto_17584 ) ) ( not ( = ?auto_17591 ?auto_17584 ) ) ( HOIST-AT ?auto_17586 ?auto_17584 ) ( not ( = ?auto_17592 ?auto_17586 ) ) ( not ( = ?auto_17588 ?auto_17586 ) ) ( not ( = ?auto_17595 ?auto_17586 ) ) ( AVAILABLE ?auto_17586 ) ( SURFACE-AT ?auto_17581 ?auto_17584 ) ( ON ?auto_17581 ?auto_17585 ) ( CLEAR ?auto_17581 ) ( not ( = ?auto_17582 ?auto_17585 ) ) ( not ( = ?auto_17583 ?auto_17585 ) ) ( not ( = ?auto_17581 ?auto_17585 ) ) ( not ( = ?auto_17594 ?auto_17585 ) ) ( not ( = ?auto_17590 ?auto_17585 ) ) ( not ( = ?auto_17580 ?auto_17585 ) ) ( SURFACE-AT ?auto_17579 ?auto_17587 ) ( CLEAR ?auto_17579 ) ( IS-CRATE ?auto_17580 ) ( not ( = ?auto_17579 ?auto_17580 ) ) ( not ( = ?auto_17582 ?auto_17579 ) ) ( not ( = ?auto_17583 ?auto_17579 ) ) ( not ( = ?auto_17581 ?auto_17579 ) ) ( not ( = ?auto_17594 ?auto_17579 ) ) ( not ( = ?auto_17590 ?auto_17579 ) ) ( not ( = ?auto_17585 ?auto_17579 ) ) ( AVAILABLE ?auto_17592 ) ( TRUCK-AT ?auto_17589 ?auto_17593 ) ( LIFTING ?auto_17588 ?auto_17580 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17581 ?auto_17582 ?auto_17583 )
      ( MAKE-4CRATE-VERIFY ?auto_17579 ?auto_17580 ?auto_17581 ?auto_17582 ?auto_17583 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17596 - SURFACE
      ?auto_17597 - SURFACE
    )
    :vars
    (
      ?auto_17607 - HOIST
      ?auto_17602 - PLACE
      ?auto_17611 - SURFACE
      ?auto_17608 - PLACE
      ?auto_17603 - HOIST
      ?auto_17609 - SURFACE
      ?auto_17606 - PLACE
      ?auto_17612 - HOIST
      ?auto_17605 - SURFACE
      ?auto_17610 - SURFACE
      ?auto_17599 - PLACE
      ?auto_17601 - HOIST
      ?auto_17600 - SURFACE
      ?auto_17598 - SURFACE
      ?auto_17604 - TRUCK
      ?auto_17613 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17607 ?auto_17602 ) ( IS-CRATE ?auto_17597 ) ( not ( = ?auto_17596 ?auto_17597 ) ) ( not ( = ?auto_17611 ?auto_17596 ) ) ( not ( = ?auto_17611 ?auto_17597 ) ) ( not ( = ?auto_17608 ?auto_17602 ) ) ( HOIST-AT ?auto_17603 ?auto_17608 ) ( not ( = ?auto_17607 ?auto_17603 ) ) ( SURFACE-AT ?auto_17597 ?auto_17608 ) ( ON ?auto_17597 ?auto_17609 ) ( CLEAR ?auto_17597 ) ( not ( = ?auto_17596 ?auto_17609 ) ) ( not ( = ?auto_17597 ?auto_17609 ) ) ( not ( = ?auto_17611 ?auto_17609 ) ) ( IS-CRATE ?auto_17596 ) ( not ( = ?auto_17606 ?auto_17602 ) ) ( not ( = ?auto_17608 ?auto_17606 ) ) ( HOIST-AT ?auto_17612 ?auto_17606 ) ( not ( = ?auto_17607 ?auto_17612 ) ) ( not ( = ?auto_17603 ?auto_17612 ) ) ( AVAILABLE ?auto_17612 ) ( SURFACE-AT ?auto_17596 ?auto_17606 ) ( ON ?auto_17596 ?auto_17605 ) ( CLEAR ?auto_17596 ) ( not ( = ?auto_17596 ?auto_17605 ) ) ( not ( = ?auto_17597 ?auto_17605 ) ) ( not ( = ?auto_17611 ?auto_17605 ) ) ( not ( = ?auto_17609 ?auto_17605 ) ) ( IS-CRATE ?auto_17611 ) ( not ( = ?auto_17610 ?auto_17611 ) ) ( not ( = ?auto_17596 ?auto_17610 ) ) ( not ( = ?auto_17597 ?auto_17610 ) ) ( not ( = ?auto_17609 ?auto_17610 ) ) ( not ( = ?auto_17605 ?auto_17610 ) ) ( not ( = ?auto_17599 ?auto_17602 ) ) ( not ( = ?auto_17608 ?auto_17599 ) ) ( not ( = ?auto_17606 ?auto_17599 ) ) ( HOIST-AT ?auto_17601 ?auto_17599 ) ( not ( = ?auto_17607 ?auto_17601 ) ) ( not ( = ?auto_17603 ?auto_17601 ) ) ( not ( = ?auto_17612 ?auto_17601 ) ) ( AVAILABLE ?auto_17601 ) ( SURFACE-AT ?auto_17611 ?auto_17599 ) ( ON ?auto_17611 ?auto_17600 ) ( CLEAR ?auto_17611 ) ( not ( = ?auto_17596 ?auto_17600 ) ) ( not ( = ?auto_17597 ?auto_17600 ) ) ( not ( = ?auto_17611 ?auto_17600 ) ) ( not ( = ?auto_17609 ?auto_17600 ) ) ( not ( = ?auto_17605 ?auto_17600 ) ) ( not ( = ?auto_17610 ?auto_17600 ) ) ( SURFACE-AT ?auto_17598 ?auto_17602 ) ( CLEAR ?auto_17598 ) ( IS-CRATE ?auto_17610 ) ( not ( = ?auto_17598 ?auto_17610 ) ) ( not ( = ?auto_17596 ?auto_17598 ) ) ( not ( = ?auto_17597 ?auto_17598 ) ) ( not ( = ?auto_17611 ?auto_17598 ) ) ( not ( = ?auto_17609 ?auto_17598 ) ) ( not ( = ?auto_17605 ?auto_17598 ) ) ( not ( = ?auto_17600 ?auto_17598 ) ) ( AVAILABLE ?auto_17607 ) ( TRUCK-AT ?auto_17604 ?auto_17608 ) ( AVAILABLE ?auto_17603 ) ( SURFACE-AT ?auto_17610 ?auto_17608 ) ( ON ?auto_17610 ?auto_17613 ) ( CLEAR ?auto_17610 ) ( not ( = ?auto_17596 ?auto_17613 ) ) ( not ( = ?auto_17597 ?auto_17613 ) ) ( not ( = ?auto_17611 ?auto_17613 ) ) ( not ( = ?auto_17609 ?auto_17613 ) ) ( not ( = ?auto_17605 ?auto_17613 ) ) ( not ( = ?auto_17610 ?auto_17613 ) ) ( not ( = ?auto_17600 ?auto_17613 ) ) ( not ( = ?auto_17598 ?auto_17613 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17603 ?auto_17610 ?auto_17613 ?auto_17608 )
      ( MAKE-2CRATE ?auto_17611 ?auto_17596 ?auto_17597 )
      ( MAKE-1CRATE-VERIFY ?auto_17596 ?auto_17597 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17614 - SURFACE
      ?auto_17615 - SURFACE
      ?auto_17616 - SURFACE
    )
    :vars
    (
      ?auto_17622 - HOIST
      ?auto_17624 - PLACE
      ?auto_17621 - PLACE
      ?auto_17627 - HOIST
      ?auto_17618 - SURFACE
      ?auto_17631 - PLACE
      ?auto_17617 - HOIST
      ?auto_17625 - SURFACE
      ?auto_17619 - SURFACE
      ?auto_17620 - PLACE
      ?auto_17623 - HOIST
      ?auto_17629 - SURFACE
      ?auto_17630 - SURFACE
      ?auto_17626 - TRUCK
      ?auto_17628 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17622 ?auto_17624 ) ( IS-CRATE ?auto_17616 ) ( not ( = ?auto_17615 ?auto_17616 ) ) ( not ( = ?auto_17614 ?auto_17615 ) ) ( not ( = ?auto_17614 ?auto_17616 ) ) ( not ( = ?auto_17621 ?auto_17624 ) ) ( HOIST-AT ?auto_17627 ?auto_17621 ) ( not ( = ?auto_17622 ?auto_17627 ) ) ( SURFACE-AT ?auto_17616 ?auto_17621 ) ( ON ?auto_17616 ?auto_17618 ) ( CLEAR ?auto_17616 ) ( not ( = ?auto_17615 ?auto_17618 ) ) ( not ( = ?auto_17616 ?auto_17618 ) ) ( not ( = ?auto_17614 ?auto_17618 ) ) ( IS-CRATE ?auto_17615 ) ( not ( = ?auto_17631 ?auto_17624 ) ) ( not ( = ?auto_17621 ?auto_17631 ) ) ( HOIST-AT ?auto_17617 ?auto_17631 ) ( not ( = ?auto_17622 ?auto_17617 ) ) ( not ( = ?auto_17627 ?auto_17617 ) ) ( AVAILABLE ?auto_17617 ) ( SURFACE-AT ?auto_17615 ?auto_17631 ) ( ON ?auto_17615 ?auto_17625 ) ( CLEAR ?auto_17615 ) ( not ( = ?auto_17615 ?auto_17625 ) ) ( not ( = ?auto_17616 ?auto_17625 ) ) ( not ( = ?auto_17614 ?auto_17625 ) ) ( not ( = ?auto_17618 ?auto_17625 ) ) ( IS-CRATE ?auto_17614 ) ( not ( = ?auto_17619 ?auto_17614 ) ) ( not ( = ?auto_17615 ?auto_17619 ) ) ( not ( = ?auto_17616 ?auto_17619 ) ) ( not ( = ?auto_17618 ?auto_17619 ) ) ( not ( = ?auto_17625 ?auto_17619 ) ) ( not ( = ?auto_17620 ?auto_17624 ) ) ( not ( = ?auto_17621 ?auto_17620 ) ) ( not ( = ?auto_17631 ?auto_17620 ) ) ( HOIST-AT ?auto_17623 ?auto_17620 ) ( not ( = ?auto_17622 ?auto_17623 ) ) ( not ( = ?auto_17627 ?auto_17623 ) ) ( not ( = ?auto_17617 ?auto_17623 ) ) ( AVAILABLE ?auto_17623 ) ( SURFACE-AT ?auto_17614 ?auto_17620 ) ( ON ?auto_17614 ?auto_17629 ) ( CLEAR ?auto_17614 ) ( not ( = ?auto_17615 ?auto_17629 ) ) ( not ( = ?auto_17616 ?auto_17629 ) ) ( not ( = ?auto_17614 ?auto_17629 ) ) ( not ( = ?auto_17618 ?auto_17629 ) ) ( not ( = ?auto_17625 ?auto_17629 ) ) ( not ( = ?auto_17619 ?auto_17629 ) ) ( SURFACE-AT ?auto_17630 ?auto_17624 ) ( CLEAR ?auto_17630 ) ( IS-CRATE ?auto_17619 ) ( not ( = ?auto_17630 ?auto_17619 ) ) ( not ( = ?auto_17615 ?auto_17630 ) ) ( not ( = ?auto_17616 ?auto_17630 ) ) ( not ( = ?auto_17614 ?auto_17630 ) ) ( not ( = ?auto_17618 ?auto_17630 ) ) ( not ( = ?auto_17625 ?auto_17630 ) ) ( not ( = ?auto_17629 ?auto_17630 ) ) ( AVAILABLE ?auto_17622 ) ( TRUCK-AT ?auto_17626 ?auto_17621 ) ( AVAILABLE ?auto_17627 ) ( SURFACE-AT ?auto_17619 ?auto_17621 ) ( ON ?auto_17619 ?auto_17628 ) ( CLEAR ?auto_17619 ) ( not ( = ?auto_17615 ?auto_17628 ) ) ( not ( = ?auto_17616 ?auto_17628 ) ) ( not ( = ?auto_17614 ?auto_17628 ) ) ( not ( = ?auto_17618 ?auto_17628 ) ) ( not ( = ?auto_17625 ?auto_17628 ) ) ( not ( = ?auto_17619 ?auto_17628 ) ) ( not ( = ?auto_17629 ?auto_17628 ) ) ( not ( = ?auto_17630 ?auto_17628 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17615 ?auto_17616 )
      ( MAKE-2CRATE-VERIFY ?auto_17614 ?auto_17615 ?auto_17616 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17632 - SURFACE
      ?auto_17633 - SURFACE
      ?auto_17634 - SURFACE
      ?auto_17635 - SURFACE
    )
    :vars
    (
      ?auto_17636 - HOIST
      ?auto_17648 - PLACE
      ?auto_17639 - PLACE
      ?auto_17638 - HOIST
      ?auto_17640 - SURFACE
      ?auto_17645 - PLACE
      ?auto_17641 - HOIST
      ?auto_17646 - SURFACE
      ?auto_17643 - PLACE
      ?auto_17649 - HOIST
      ?auto_17637 - SURFACE
      ?auto_17642 - SURFACE
      ?auto_17647 - TRUCK
      ?auto_17644 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17636 ?auto_17648 ) ( IS-CRATE ?auto_17635 ) ( not ( = ?auto_17634 ?auto_17635 ) ) ( not ( = ?auto_17633 ?auto_17634 ) ) ( not ( = ?auto_17633 ?auto_17635 ) ) ( not ( = ?auto_17639 ?auto_17648 ) ) ( HOIST-AT ?auto_17638 ?auto_17639 ) ( not ( = ?auto_17636 ?auto_17638 ) ) ( SURFACE-AT ?auto_17635 ?auto_17639 ) ( ON ?auto_17635 ?auto_17640 ) ( CLEAR ?auto_17635 ) ( not ( = ?auto_17634 ?auto_17640 ) ) ( not ( = ?auto_17635 ?auto_17640 ) ) ( not ( = ?auto_17633 ?auto_17640 ) ) ( IS-CRATE ?auto_17634 ) ( not ( = ?auto_17645 ?auto_17648 ) ) ( not ( = ?auto_17639 ?auto_17645 ) ) ( HOIST-AT ?auto_17641 ?auto_17645 ) ( not ( = ?auto_17636 ?auto_17641 ) ) ( not ( = ?auto_17638 ?auto_17641 ) ) ( AVAILABLE ?auto_17641 ) ( SURFACE-AT ?auto_17634 ?auto_17645 ) ( ON ?auto_17634 ?auto_17646 ) ( CLEAR ?auto_17634 ) ( not ( = ?auto_17634 ?auto_17646 ) ) ( not ( = ?auto_17635 ?auto_17646 ) ) ( not ( = ?auto_17633 ?auto_17646 ) ) ( not ( = ?auto_17640 ?auto_17646 ) ) ( IS-CRATE ?auto_17633 ) ( not ( = ?auto_17632 ?auto_17633 ) ) ( not ( = ?auto_17634 ?auto_17632 ) ) ( not ( = ?auto_17635 ?auto_17632 ) ) ( not ( = ?auto_17640 ?auto_17632 ) ) ( not ( = ?auto_17646 ?auto_17632 ) ) ( not ( = ?auto_17643 ?auto_17648 ) ) ( not ( = ?auto_17639 ?auto_17643 ) ) ( not ( = ?auto_17645 ?auto_17643 ) ) ( HOIST-AT ?auto_17649 ?auto_17643 ) ( not ( = ?auto_17636 ?auto_17649 ) ) ( not ( = ?auto_17638 ?auto_17649 ) ) ( not ( = ?auto_17641 ?auto_17649 ) ) ( AVAILABLE ?auto_17649 ) ( SURFACE-AT ?auto_17633 ?auto_17643 ) ( ON ?auto_17633 ?auto_17637 ) ( CLEAR ?auto_17633 ) ( not ( = ?auto_17634 ?auto_17637 ) ) ( not ( = ?auto_17635 ?auto_17637 ) ) ( not ( = ?auto_17633 ?auto_17637 ) ) ( not ( = ?auto_17640 ?auto_17637 ) ) ( not ( = ?auto_17646 ?auto_17637 ) ) ( not ( = ?auto_17632 ?auto_17637 ) ) ( SURFACE-AT ?auto_17642 ?auto_17648 ) ( CLEAR ?auto_17642 ) ( IS-CRATE ?auto_17632 ) ( not ( = ?auto_17642 ?auto_17632 ) ) ( not ( = ?auto_17634 ?auto_17642 ) ) ( not ( = ?auto_17635 ?auto_17642 ) ) ( not ( = ?auto_17633 ?auto_17642 ) ) ( not ( = ?auto_17640 ?auto_17642 ) ) ( not ( = ?auto_17646 ?auto_17642 ) ) ( not ( = ?auto_17637 ?auto_17642 ) ) ( AVAILABLE ?auto_17636 ) ( TRUCK-AT ?auto_17647 ?auto_17639 ) ( AVAILABLE ?auto_17638 ) ( SURFACE-AT ?auto_17632 ?auto_17639 ) ( ON ?auto_17632 ?auto_17644 ) ( CLEAR ?auto_17632 ) ( not ( = ?auto_17634 ?auto_17644 ) ) ( not ( = ?auto_17635 ?auto_17644 ) ) ( not ( = ?auto_17633 ?auto_17644 ) ) ( not ( = ?auto_17640 ?auto_17644 ) ) ( not ( = ?auto_17646 ?auto_17644 ) ) ( not ( = ?auto_17632 ?auto_17644 ) ) ( not ( = ?auto_17637 ?auto_17644 ) ) ( not ( = ?auto_17642 ?auto_17644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17633 ?auto_17634 ?auto_17635 )
      ( MAKE-3CRATE-VERIFY ?auto_17632 ?auto_17633 ?auto_17634 ?auto_17635 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17650 - SURFACE
      ?auto_17651 - SURFACE
      ?auto_17652 - SURFACE
      ?auto_17653 - SURFACE
      ?auto_17654 - SURFACE
    )
    :vars
    (
      ?auto_17655 - HOIST
      ?auto_17666 - PLACE
      ?auto_17658 - PLACE
      ?auto_17657 - HOIST
      ?auto_17659 - SURFACE
      ?auto_17663 - PLACE
      ?auto_17660 - HOIST
      ?auto_17664 - SURFACE
      ?auto_17661 - PLACE
      ?auto_17667 - HOIST
      ?auto_17656 - SURFACE
      ?auto_17665 - TRUCK
      ?auto_17662 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17655 ?auto_17666 ) ( IS-CRATE ?auto_17654 ) ( not ( = ?auto_17653 ?auto_17654 ) ) ( not ( = ?auto_17652 ?auto_17653 ) ) ( not ( = ?auto_17652 ?auto_17654 ) ) ( not ( = ?auto_17658 ?auto_17666 ) ) ( HOIST-AT ?auto_17657 ?auto_17658 ) ( not ( = ?auto_17655 ?auto_17657 ) ) ( SURFACE-AT ?auto_17654 ?auto_17658 ) ( ON ?auto_17654 ?auto_17659 ) ( CLEAR ?auto_17654 ) ( not ( = ?auto_17653 ?auto_17659 ) ) ( not ( = ?auto_17654 ?auto_17659 ) ) ( not ( = ?auto_17652 ?auto_17659 ) ) ( IS-CRATE ?auto_17653 ) ( not ( = ?auto_17663 ?auto_17666 ) ) ( not ( = ?auto_17658 ?auto_17663 ) ) ( HOIST-AT ?auto_17660 ?auto_17663 ) ( not ( = ?auto_17655 ?auto_17660 ) ) ( not ( = ?auto_17657 ?auto_17660 ) ) ( AVAILABLE ?auto_17660 ) ( SURFACE-AT ?auto_17653 ?auto_17663 ) ( ON ?auto_17653 ?auto_17664 ) ( CLEAR ?auto_17653 ) ( not ( = ?auto_17653 ?auto_17664 ) ) ( not ( = ?auto_17654 ?auto_17664 ) ) ( not ( = ?auto_17652 ?auto_17664 ) ) ( not ( = ?auto_17659 ?auto_17664 ) ) ( IS-CRATE ?auto_17652 ) ( not ( = ?auto_17651 ?auto_17652 ) ) ( not ( = ?auto_17653 ?auto_17651 ) ) ( not ( = ?auto_17654 ?auto_17651 ) ) ( not ( = ?auto_17659 ?auto_17651 ) ) ( not ( = ?auto_17664 ?auto_17651 ) ) ( not ( = ?auto_17661 ?auto_17666 ) ) ( not ( = ?auto_17658 ?auto_17661 ) ) ( not ( = ?auto_17663 ?auto_17661 ) ) ( HOIST-AT ?auto_17667 ?auto_17661 ) ( not ( = ?auto_17655 ?auto_17667 ) ) ( not ( = ?auto_17657 ?auto_17667 ) ) ( not ( = ?auto_17660 ?auto_17667 ) ) ( AVAILABLE ?auto_17667 ) ( SURFACE-AT ?auto_17652 ?auto_17661 ) ( ON ?auto_17652 ?auto_17656 ) ( CLEAR ?auto_17652 ) ( not ( = ?auto_17653 ?auto_17656 ) ) ( not ( = ?auto_17654 ?auto_17656 ) ) ( not ( = ?auto_17652 ?auto_17656 ) ) ( not ( = ?auto_17659 ?auto_17656 ) ) ( not ( = ?auto_17664 ?auto_17656 ) ) ( not ( = ?auto_17651 ?auto_17656 ) ) ( SURFACE-AT ?auto_17650 ?auto_17666 ) ( CLEAR ?auto_17650 ) ( IS-CRATE ?auto_17651 ) ( not ( = ?auto_17650 ?auto_17651 ) ) ( not ( = ?auto_17653 ?auto_17650 ) ) ( not ( = ?auto_17654 ?auto_17650 ) ) ( not ( = ?auto_17652 ?auto_17650 ) ) ( not ( = ?auto_17659 ?auto_17650 ) ) ( not ( = ?auto_17664 ?auto_17650 ) ) ( not ( = ?auto_17656 ?auto_17650 ) ) ( AVAILABLE ?auto_17655 ) ( TRUCK-AT ?auto_17665 ?auto_17658 ) ( AVAILABLE ?auto_17657 ) ( SURFACE-AT ?auto_17651 ?auto_17658 ) ( ON ?auto_17651 ?auto_17662 ) ( CLEAR ?auto_17651 ) ( not ( = ?auto_17653 ?auto_17662 ) ) ( not ( = ?auto_17654 ?auto_17662 ) ) ( not ( = ?auto_17652 ?auto_17662 ) ) ( not ( = ?auto_17659 ?auto_17662 ) ) ( not ( = ?auto_17664 ?auto_17662 ) ) ( not ( = ?auto_17651 ?auto_17662 ) ) ( not ( = ?auto_17656 ?auto_17662 ) ) ( not ( = ?auto_17650 ?auto_17662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17652 ?auto_17653 ?auto_17654 )
      ( MAKE-4CRATE-VERIFY ?auto_17650 ?auto_17651 ?auto_17652 ?auto_17653 ?auto_17654 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17668 - SURFACE
      ?auto_17669 - SURFACE
    )
    :vars
    (
      ?auto_17670 - HOIST
      ?auto_17683 - PLACE
      ?auto_17685 - SURFACE
      ?auto_17673 - PLACE
      ?auto_17672 - HOIST
      ?auto_17674 - SURFACE
      ?auto_17680 - PLACE
      ?auto_17675 - HOIST
      ?auto_17681 - SURFACE
      ?auto_17679 - SURFACE
      ?auto_17677 - PLACE
      ?auto_17684 - HOIST
      ?auto_17671 - SURFACE
      ?auto_17676 - SURFACE
      ?auto_17678 - SURFACE
      ?auto_17682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17670 ?auto_17683 ) ( IS-CRATE ?auto_17669 ) ( not ( = ?auto_17668 ?auto_17669 ) ) ( not ( = ?auto_17685 ?auto_17668 ) ) ( not ( = ?auto_17685 ?auto_17669 ) ) ( not ( = ?auto_17673 ?auto_17683 ) ) ( HOIST-AT ?auto_17672 ?auto_17673 ) ( not ( = ?auto_17670 ?auto_17672 ) ) ( SURFACE-AT ?auto_17669 ?auto_17673 ) ( ON ?auto_17669 ?auto_17674 ) ( CLEAR ?auto_17669 ) ( not ( = ?auto_17668 ?auto_17674 ) ) ( not ( = ?auto_17669 ?auto_17674 ) ) ( not ( = ?auto_17685 ?auto_17674 ) ) ( IS-CRATE ?auto_17668 ) ( not ( = ?auto_17680 ?auto_17683 ) ) ( not ( = ?auto_17673 ?auto_17680 ) ) ( HOIST-AT ?auto_17675 ?auto_17680 ) ( not ( = ?auto_17670 ?auto_17675 ) ) ( not ( = ?auto_17672 ?auto_17675 ) ) ( AVAILABLE ?auto_17675 ) ( SURFACE-AT ?auto_17668 ?auto_17680 ) ( ON ?auto_17668 ?auto_17681 ) ( CLEAR ?auto_17668 ) ( not ( = ?auto_17668 ?auto_17681 ) ) ( not ( = ?auto_17669 ?auto_17681 ) ) ( not ( = ?auto_17685 ?auto_17681 ) ) ( not ( = ?auto_17674 ?auto_17681 ) ) ( IS-CRATE ?auto_17685 ) ( not ( = ?auto_17679 ?auto_17685 ) ) ( not ( = ?auto_17668 ?auto_17679 ) ) ( not ( = ?auto_17669 ?auto_17679 ) ) ( not ( = ?auto_17674 ?auto_17679 ) ) ( not ( = ?auto_17681 ?auto_17679 ) ) ( not ( = ?auto_17677 ?auto_17683 ) ) ( not ( = ?auto_17673 ?auto_17677 ) ) ( not ( = ?auto_17680 ?auto_17677 ) ) ( HOIST-AT ?auto_17684 ?auto_17677 ) ( not ( = ?auto_17670 ?auto_17684 ) ) ( not ( = ?auto_17672 ?auto_17684 ) ) ( not ( = ?auto_17675 ?auto_17684 ) ) ( AVAILABLE ?auto_17684 ) ( SURFACE-AT ?auto_17685 ?auto_17677 ) ( ON ?auto_17685 ?auto_17671 ) ( CLEAR ?auto_17685 ) ( not ( = ?auto_17668 ?auto_17671 ) ) ( not ( = ?auto_17669 ?auto_17671 ) ) ( not ( = ?auto_17685 ?auto_17671 ) ) ( not ( = ?auto_17674 ?auto_17671 ) ) ( not ( = ?auto_17681 ?auto_17671 ) ) ( not ( = ?auto_17679 ?auto_17671 ) ) ( SURFACE-AT ?auto_17676 ?auto_17683 ) ( CLEAR ?auto_17676 ) ( IS-CRATE ?auto_17679 ) ( not ( = ?auto_17676 ?auto_17679 ) ) ( not ( = ?auto_17668 ?auto_17676 ) ) ( not ( = ?auto_17669 ?auto_17676 ) ) ( not ( = ?auto_17685 ?auto_17676 ) ) ( not ( = ?auto_17674 ?auto_17676 ) ) ( not ( = ?auto_17681 ?auto_17676 ) ) ( not ( = ?auto_17671 ?auto_17676 ) ) ( AVAILABLE ?auto_17670 ) ( AVAILABLE ?auto_17672 ) ( SURFACE-AT ?auto_17679 ?auto_17673 ) ( ON ?auto_17679 ?auto_17678 ) ( CLEAR ?auto_17679 ) ( not ( = ?auto_17668 ?auto_17678 ) ) ( not ( = ?auto_17669 ?auto_17678 ) ) ( not ( = ?auto_17685 ?auto_17678 ) ) ( not ( = ?auto_17674 ?auto_17678 ) ) ( not ( = ?auto_17681 ?auto_17678 ) ) ( not ( = ?auto_17679 ?auto_17678 ) ) ( not ( = ?auto_17671 ?auto_17678 ) ) ( not ( = ?auto_17676 ?auto_17678 ) ) ( TRUCK-AT ?auto_17682 ?auto_17683 ) )
    :subtasks
    ( ( !DRIVE ?auto_17682 ?auto_17683 ?auto_17673 )
      ( MAKE-2CRATE ?auto_17685 ?auto_17668 ?auto_17669 )
      ( MAKE-1CRATE-VERIFY ?auto_17668 ?auto_17669 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17686 - SURFACE
      ?auto_17687 - SURFACE
      ?auto_17688 - SURFACE
    )
    :vars
    (
      ?auto_17689 - HOIST
      ?auto_17694 - PLACE
      ?auto_17693 - PLACE
      ?auto_17690 - HOIST
      ?auto_17696 - SURFACE
      ?auto_17703 - PLACE
      ?auto_17701 - HOIST
      ?auto_17695 - SURFACE
      ?auto_17697 - SURFACE
      ?auto_17698 - PLACE
      ?auto_17702 - HOIST
      ?auto_17700 - SURFACE
      ?auto_17692 - SURFACE
      ?auto_17691 - SURFACE
      ?auto_17699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17689 ?auto_17694 ) ( IS-CRATE ?auto_17688 ) ( not ( = ?auto_17687 ?auto_17688 ) ) ( not ( = ?auto_17686 ?auto_17687 ) ) ( not ( = ?auto_17686 ?auto_17688 ) ) ( not ( = ?auto_17693 ?auto_17694 ) ) ( HOIST-AT ?auto_17690 ?auto_17693 ) ( not ( = ?auto_17689 ?auto_17690 ) ) ( SURFACE-AT ?auto_17688 ?auto_17693 ) ( ON ?auto_17688 ?auto_17696 ) ( CLEAR ?auto_17688 ) ( not ( = ?auto_17687 ?auto_17696 ) ) ( not ( = ?auto_17688 ?auto_17696 ) ) ( not ( = ?auto_17686 ?auto_17696 ) ) ( IS-CRATE ?auto_17687 ) ( not ( = ?auto_17703 ?auto_17694 ) ) ( not ( = ?auto_17693 ?auto_17703 ) ) ( HOIST-AT ?auto_17701 ?auto_17703 ) ( not ( = ?auto_17689 ?auto_17701 ) ) ( not ( = ?auto_17690 ?auto_17701 ) ) ( AVAILABLE ?auto_17701 ) ( SURFACE-AT ?auto_17687 ?auto_17703 ) ( ON ?auto_17687 ?auto_17695 ) ( CLEAR ?auto_17687 ) ( not ( = ?auto_17687 ?auto_17695 ) ) ( not ( = ?auto_17688 ?auto_17695 ) ) ( not ( = ?auto_17686 ?auto_17695 ) ) ( not ( = ?auto_17696 ?auto_17695 ) ) ( IS-CRATE ?auto_17686 ) ( not ( = ?auto_17697 ?auto_17686 ) ) ( not ( = ?auto_17687 ?auto_17697 ) ) ( not ( = ?auto_17688 ?auto_17697 ) ) ( not ( = ?auto_17696 ?auto_17697 ) ) ( not ( = ?auto_17695 ?auto_17697 ) ) ( not ( = ?auto_17698 ?auto_17694 ) ) ( not ( = ?auto_17693 ?auto_17698 ) ) ( not ( = ?auto_17703 ?auto_17698 ) ) ( HOIST-AT ?auto_17702 ?auto_17698 ) ( not ( = ?auto_17689 ?auto_17702 ) ) ( not ( = ?auto_17690 ?auto_17702 ) ) ( not ( = ?auto_17701 ?auto_17702 ) ) ( AVAILABLE ?auto_17702 ) ( SURFACE-AT ?auto_17686 ?auto_17698 ) ( ON ?auto_17686 ?auto_17700 ) ( CLEAR ?auto_17686 ) ( not ( = ?auto_17687 ?auto_17700 ) ) ( not ( = ?auto_17688 ?auto_17700 ) ) ( not ( = ?auto_17686 ?auto_17700 ) ) ( not ( = ?auto_17696 ?auto_17700 ) ) ( not ( = ?auto_17695 ?auto_17700 ) ) ( not ( = ?auto_17697 ?auto_17700 ) ) ( SURFACE-AT ?auto_17692 ?auto_17694 ) ( CLEAR ?auto_17692 ) ( IS-CRATE ?auto_17697 ) ( not ( = ?auto_17692 ?auto_17697 ) ) ( not ( = ?auto_17687 ?auto_17692 ) ) ( not ( = ?auto_17688 ?auto_17692 ) ) ( not ( = ?auto_17686 ?auto_17692 ) ) ( not ( = ?auto_17696 ?auto_17692 ) ) ( not ( = ?auto_17695 ?auto_17692 ) ) ( not ( = ?auto_17700 ?auto_17692 ) ) ( AVAILABLE ?auto_17689 ) ( AVAILABLE ?auto_17690 ) ( SURFACE-AT ?auto_17697 ?auto_17693 ) ( ON ?auto_17697 ?auto_17691 ) ( CLEAR ?auto_17697 ) ( not ( = ?auto_17687 ?auto_17691 ) ) ( not ( = ?auto_17688 ?auto_17691 ) ) ( not ( = ?auto_17686 ?auto_17691 ) ) ( not ( = ?auto_17696 ?auto_17691 ) ) ( not ( = ?auto_17695 ?auto_17691 ) ) ( not ( = ?auto_17697 ?auto_17691 ) ) ( not ( = ?auto_17700 ?auto_17691 ) ) ( not ( = ?auto_17692 ?auto_17691 ) ) ( TRUCK-AT ?auto_17699 ?auto_17694 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17687 ?auto_17688 )
      ( MAKE-2CRATE-VERIFY ?auto_17686 ?auto_17687 ?auto_17688 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17704 - SURFACE
      ?auto_17705 - SURFACE
      ?auto_17706 - SURFACE
      ?auto_17707 - SURFACE
    )
    :vars
    (
      ?auto_17711 - HOIST
      ?auto_17708 - PLACE
      ?auto_17715 - PLACE
      ?auto_17718 - HOIST
      ?auto_17719 - SURFACE
      ?auto_17709 - PLACE
      ?auto_17713 - HOIST
      ?auto_17720 - SURFACE
      ?auto_17710 - PLACE
      ?auto_17712 - HOIST
      ?auto_17717 - SURFACE
      ?auto_17716 - SURFACE
      ?auto_17721 - SURFACE
      ?auto_17714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17711 ?auto_17708 ) ( IS-CRATE ?auto_17707 ) ( not ( = ?auto_17706 ?auto_17707 ) ) ( not ( = ?auto_17705 ?auto_17706 ) ) ( not ( = ?auto_17705 ?auto_17707 ) ) ( not ( = ?auto_17715 ?auto_17708 ) ) ( HOIST-AT ?auto_17718 ?auto_17715 ) ( not ( = ?auto_17711 ?auto_17718 ) ) ( SURFACE-AT ?auto_17707 ?auto_17715 ) ( ON ?auto_17707 ?auto_17719 ) ( CLEAR ?auto_17707 ) ( not ( = ?auto_17706 ?auto_17719 ) ) ( not ( = ?auto_17707 ?auto_17719 ) ) ( not ( = ?auto_17705 ?auto_17719 ) ) ( IS-CRATE ?auto_17706 ) ( not ( = ?auto_17709 ?auto_17708 ) ) ( not ( = ?auto_17715 ?auto_17709 ) ) ( HOIST-AT ?auto_17713 ?auto_17709 ) ( not ( = ?auto_17711 ?auto_17713 ) ) ( not ( = ?auto_17718 ?auto_17713 ) ) ( AVAILABLE ?auto_17713 ) ( SURFACE-AT ?auto_17706 ?auto_17709 ) ( ON ?auto_17706 ?auto_17720 ) ( CLEAR ?auto_17706 ) ( not ( = ?auto_17706 ?auto_17720 ) ) ( not ( = ?auto_17707 ?auto_17720 ) ) ( not ( = ?auto_17705 ?auto_17720 ) ) ( not ( = ?auto_17719 ?auto_17720 ) ) ( IS-CRATE ?auto_17705 ) ( not ( = ?auto_17704 ?auto_17705 ) ) ( not ( = ?auto_17706 ?auto_17704 ) ) ( not ( = ?auto_17707 ?auto_17704 ) ) ( not ( = ?auto_17719 ?auto_17704 ) ) ( not ( = ?auto_17720 ?auto_17704 ) ) ( not ( = ?auto_17710 ?auto_17708 ) ) ( not ( = ?auto_17715 ?auto_17710 ) ) ( not ( = ?auto_17709 ?auto_17710 ) ) ( HOIST-AT ?auto_17712 ?auto_17710 ) ( not ( = ?auto_17711 ?auto_17712 ) ) ( not ( = ?auto_17718 ?auto_17712 ) ) ( not ( = ?auto_17713 ?auto_17712 ) ) ( AVAILABLE ?auto_17712 ) ( SURFACE-AT ?auto_17705 ?auto_17710 ) ( ON ?auto_17705 ?auto_17717 ) ( CLEAR ?auto_17705 ) ( not ( = ?auto_17706 ?auto_17717 ) ) ( not ( = ?auto_17707 ?auto_17717 ) ) ( not ( = ?auto_17705 ?auto_17717 ) ) ( not ( = ?auto_17719 ?auto_17717 ) ) ( not ( = ?auto_17720 ?auto_17717 ) ) ( not ( = ?auto_17704 ?auto_17717 ) ) ( SURFACE-AT ?auto_17716 ?auto_17708 ) ( CLEAR ?auto_17716 ) ( IS-CRATE ?auto_17704 ) ( not ( = ?auto_17716 ?auto_17704 ) ) ( not ( = ?auto_17706 ?auto_17716 ) ) ( not ( = ?auto_17707 ?auto_17716 ) ) ( not ( = ?auto_17705 ?auto_17716 ) ) ( not ( = ?auto_17719 ?auto_17716 ) ) ( not ( = ?auto_17720 ?auto_17716 ) ) ( not ( = ?auto_17717 ?auto_17716 ) ) ( AVAILABLE ?auto_17711 ) ( AVAILABLE ?auto_17718 ) ( SURFACE-AT ?auto_17704 ?auto_17715 ) ( ON ?auto_17704 ?auto_17721 ) ( CLEAR ?auto_17704 ) ( not ( = ?auto_17706 ?auto_17721 ) ) ( not ( = ?auto_17707 ?auto_17721 ) ) ( not ( = ?auto_17705 ?auto_17721 ) ) ( not ( = ?auto_17719 ?auto_17721 ) ) ( not ( = ?auto_17720 ?auto_17721 ) ) ( not ( = ?auto_17704 ?auto_17721 ) ) ( not ( = ?auto_17717 ?auto_17721 ) ) ( not ( = ?auto_17716 ?auto_17721 ) ) ( TRUCK-AT ?auto_17714 ?auto_17708 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17705 ?auto_17706 ?auto_17707 )
      ( MAKE-3CRATE-VERIFY ?auto_17704 ?auto_17705 ?auto_17706 ?auto_17707 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17722 - SURFACE
      ?auto_17723 - SURFACE
      ?auto_17724 - SURFACE
      ?auto_17725 - SURFACE
      ?auto_17726 - SURFACE
    )
    :vars
    (
      ?auto_17730 - HOIST
      ?auto_17727 - PLACE
      ?auto_17734 - PLACE
      ?auto_17736 - HOIST
      ?auto_17737 - SURFACE
      ?auto_17728 - PLACE
      ?auto_17732 - HOIST
      ?auto_17738 - SURFACE
      ?auto_17729 - PLACE
      ?auto_17731 - HOIST
      ?auto_17735 - SURFACE
      ?auto_17739 - SURFACE
      ?auto_17733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17730 ?auto_17727 ) ( IS-CRATE ?auto_17726 ) ( not ( = ?auto_17725 ?auto_17726 ) ) ( not ( = ?auto_17724 ?auto_17725 ) ) ( not ( = ?auto_17724 ?auto_17726 ) ) ( not ( = ?auto_17734 ?auto_17727 ) ) ( HOIST-AT ?auto_17736 ?auto_17734 ) ( not ( = ?auto_17730 ?auto_17736 ) ) ( SURFACE-AT ?auto_17726 ?auto_17734 ) ( ON ?auto_17726 ?auto_17737 ) ( CLEAR ?auto_17726 ) ( not ( = ?auto_17725 ?auto_17737 ) ) ( not ( = ?auto_17726 ?auto_17737 ) ) ( not ( = ?auto_17724 ?auto_17737 ) ) ( IS-CRATE ?auto_17725 ) ( not ( = ?auto_17728 ?auto_17727 ) ) ( not ( = ?auto_17734 ?auto_17728 ) ) ( HOIST-AT ?auto_17732 ?auto_17728 ) ( not ( = ?auto_17730 ?auto_17732 ) ) ( not ( = ?auto_17736 ?auto_17732 ) ) ( AVAILABLE ?auto_17732 ) ( SURFACE-AT ?auto_17725 ?auto_17728 ) ( ON ?auto_17725 ?auto_17738 ) ( CLEAR ?auto_17725 ) ( not ( = ?auto_17725 ?auto_17738 ) ) ( not ( = ?auto_17726 ?auto_17738 ) ) ( not ( = ?auto_17724 ?auto_17738 ) ) ( not ( = ?auto_17737 ?auto_17738 ) ) ( IS-CRATE ?auto_17724 ) ( not ( = ?auto_17723 ?auto_17724 ) ) ( not ( = ?auto_17725 ?auto_17723 ) ) ( not ( = ?auto_17726 ?auto_17723 ) ) ( not ( = ?auto_17737 ?auto_17723 ) ) ( not ( = ?auto_17738 ?auto_17723 ) ) ( not ( = ?auto_17729 ?auto_17727 ) ) ( not ( = ?auto_17734 ?auto_17729 ) ) ( not ( = ?auto_17728 ?auto_17729 ) ) ( HOIST-AT ?auto_17731 ?auto_17729 ) ( not ( = ?auto_17730 ?auto_17731 ) ) ( not ( = ?auto_17736 ?auto_17731 ) ) ( not ( = ?auto_17732 ?auto_17731 ) ) ( AVAILABLE ?auto_17731 ) ( SURFACE-AT ?auto_17724 ?auto_17729 ) ( ON ?auto_17724 ?auto_17735 ) ( CLEAR ?auto_17724 ) ( not ( = ?auto_17725 ?auto_17735 ) ) ( not ( = ?auto_17726 ?auto_17735 ) ) ( not ( = ?auto_17724 ?auto_17735 ) ) ( not ( = ?auto_17737 ?auto_17735 ) ) ( not ( = ?auto_17738 ?auto_17735 ) ) ( not ( = ?auto_17723 ?auto_17735 ) ) ( SURFACE-AT ?auto_17722 ?auto_17727 ) ( CLEAR ?auto_17722 ) ( IS-CRATE ?auto_17723 ) ( not ( = ?auto_17722 ?auto_17723 ) ) ( not ( = ?auto_17725 ?auto_17722 ) ) ( not ( = ?auto_17726 ?auto_17722 ) ) ( not ( = ?auto_17724 ?auto_17722 ) ) ( not ( = ?auto_17737 ?auto_17722 ) ) ( not ( = ?auto_17738 ?auto_17722 ) ) ( not ( = ?auto_17735 ?auto_17722 ) ) ( AVAILABLE ?auto_17730 ) ( AVAILABLE ?auto_17736 ) ( SURFACE-AT ?auto_17723 ?auto_17734 ) ( ON ?auto_17723 ?auto_17739 ) ( CLEAR ?auto_17723 ) ( not ( = ?auto_17725 ?auto_17739 ) ) ( not ( = ?auto_17726 ?auto_17739 ) ) ( not ( = ?auto_17724 ?auto_17739 ) ) ( not ( = ?auto_17737 ?auto_17739 ) ) ( not ( = ?auto_17738 ?auto_17739 ) ) ( not ( = ?auto_17723 ?auto_17739 ) ) ( not ( = ?auto_17735 ?auto_17739 ) ) ( not ( = ?auto_17722 ?auto_17739 ) ) ( TRUCK-AT ?auto_17733 ?auto_17727 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17724 ?auto_17725 ?auto_17726 )
      ( MAKE-4CRATE-VERIFY ?auto_17722 ?auto_17723 ?auto_17724 ?auto_17725 ?auto_17726 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17760 - SURFACE
      ?auto_17761 - SURFACE
    )
    :vars
    (
      ?auto_17762 - HOIST
      ?auto_17763 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17762 ?auto_17763 ) ( SURFACE-AT ?auto_17760 ?auto_17763 ) ( CLEAR ?auto_17760 ) ( LIFTING ?auto_17762 ?auto_17761 ) ( IS-CRATE ?auto_17761 ) ( not ( = ?auto_17760 ?auto_17761 ) ) )
    :subtasks
    ( ( !DROP ?auto_17762 ?auto_17761 ?auto_17760 ?auto_17763 )
      ( MAKE-1CRATE-VERIFY ?auto_17760 ?auto_17761 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17764 - SURFACE
      ?auto_17765 - SURFACE
      ?auto_17766 - SURFACE
    )
    :vars
    (
      ?auto_17768 - HOIST
      ?auto_17767 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17768 ?auto_17767 ) ( SURFACE-AT ?auto_17765 ?auto_17767 ) ( CLEAR ?auto_17765 ) ( LIFTING ?auto_17768 ?auto_17766 ) ( IS-CRATE ?auto_17766 ) ( not ( = ?auto_17765 ?auto_17766 ) ) ( ON ?auto_17765 ?auto_17764 ) ( not ( = ?auto_17764 ?auto_17765 ) ) ( not ( = ?auto_17764 ?auto_17766 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17765 ?auto_17766 )
      ( MAKE-2CRATE-VERIFY ?auto_17764 ?auto_17765 ?auto_17766 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17769 - SURFACE
      ?auto_17770 - SURFACE
      ?auto_17771 - SURFACE
      ?auto_17772 - SURFACE
    )
    :vars
    (
      ?auto_17774 - HOIST
      ?auto_17773 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17774 ?auto_17773 ) ( SURFACE-AT ?auto_17771 ?auto_17773 ) ( CLEAR ?auto_17771 ) ( LIFTING ?auto_17774 ?auto_17772 ) ( IS-CRATE ?auto_17772 ) ( not ( = ?auto_17771 ?auto_17772 ) ) ( ON ?auto_17770 ?auto_17769 ) ( ON ?auto_17771 ?auto_17770 ) ( not ( = ?auto_17769 ?auto_17770 ) ) ( not ( = ?auto_17769 ?auto_17771 ) ) ( not ( = ?auto_17769 ?auto_17772 ) ) ( not ( = ?auto_17770 ?auto_17771 ) ) ( not ( = ?auto_17770 ?auto_17772 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17771 ?auto_17772 )
      ( MAKE-3CRATE-VERIFY ?auto_17769 ?auto_17770 ?auto_17771 ?auto_17772 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17775 - SURFACE
      ?auto_17776 - SURFACE
      ?auto_17777 - SURFACE
      ?auto_17778 - SURFACE
      ?auto_17779 - SURFACE
    )
    :vars
    (
      ?auto_17781 - HOIST
      ?auto_17780 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17781 ?auto_17780 ) ( SURFACE-AT ?auto_17778 ?auto_17780 ) ( CLEAR ?auto_17778 ) ( LIFTING ?auto_17781 ?auto_17779 ) ( IS-CRATE ?auto_17779 ) ( not ( = ?auto_17778 ?auto_17779 ) ) ( ON ?auto_17776 ?auto_17775 ) ( ON ?auto_17777 ?auto_17776 ) ( ON ?auto_17778 ?auto_17777 ) ( not ( = ?auto_17775 ?auto_17776 ) ) ( not ( = ?auto_17775 ?auto_17777 ) ) ( not ( = ?auto_17775 ?auto_17778 ) ) ( not ( = ?auto_17775 ?auto_17779 ) ) ( not ( = ?auto_17776 ?auto_17777 ) ) ( not ( = ?auto_17776 ?auto_17778 ) ) ( not ( = ?auto_17776 ?auto_17779 ) ) ( not ( = ?auto_17777 ?auto_17778 ) ) ( not ( = ?auto_17777 ?auto_17779 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17778 ?auto_17779 )
      ( MAKE-4CRATE-VERIFY ?auto_17775 ?auto_17776 ?auto_17777 ?auto_17778 ?auto_17779 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17782 - SURFACE
      ?auto_17783 - SURFACE
      ?auto_17784 - SURFACE
      ?auto_17785 - SURFACE
      ?auto_17786 - SURFACE
      ?auto_17787 - SURFACE
    )
    :vars
    (
      ?auto_17789 - HOIST
      ?auto_17788 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17789 ?auto_17788 ) ( SURFACE-AT ?auto_17786 ?auto_17788 ) ( CLEAR ?auto_17786 ) ( LIFTING ?auto_17789 ?auto_17787 ) ( IS-CRATE ?auto_17787 ) ( not ( = ?auto_17786 ?auto_17787 ) ) ( ON ?auto_17783 ?auto_17782 ) ( ON ?auto_17784 ?auto_17783 ) ( ON ?auto_17785 ?auto_17784 ) ( ON ?auto_17786 ?auto_17785 ) ( not ( = ?auto_17782 ?auto_17783 ) ) ( not ( = ?auto_17782 ?auto_17784 ) ) ( not ( = ?auto_17782 ?auto_17785 ) ) ( not ( = ?auto_17782 ?auto_17786 ) ) ( not ( = ?auto_17782 ?auto_17787 ) ) ( not ( = ?auto_17783 ?auto_17784 ) ) ( not ( = ?auto_17783 ?auto_17785 ) ) ( not ( = ?auto_17783 ?auto_17786 ) ) ( not ( = ?auto_17783 ?auto_17787 ) ) ( not ( = ?auto_17784 ?auto_17785 ) ) ( not ( = ?auto_17784 ?auto_17786 ) ) ( not ( = ?auto_17784 ?auto_17787 ) ) ( not ( = ?auto_17785 ?auto_17786 ) ) ( not ( = ?auto_17785 ?auto_17787 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17786 ?auto_17787 )
      ( MAKE-5CRATE-VERIFY ?auto_17782 ?auto_17783 ?auto_17784 ?auto_17785 ?auto_17786 ?auto_17787 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17790 - SURFACE
      ?auto_17791 - SURFACE
    )
    :vars
    (
      ?auto_17793 - HOIST
      ?auto_17792 - PLACE
      ?auto_17794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17793 ?auto_17792 ) ( SURFACE-AT ?auto_17790 ?auto_17792 ) ( CLEAR ?auto_17790 ) ( IS-CRATE ?auto_17791 ) ( not ( = ?auto_17790 ?auto_17791 ) ) ( TRUCK-AT ?auto_17794 ?auto_17792 ) ( AVAILABLE ?auto_17793 ) ( IN ?auto_17791 ?auto_17794 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17793 ?auto_17791 ?auto_17794 ?auto_17792 )
      ( MAKE-1CRATE ?auto_17790 ?auto_17791 )
      ( MAKE-1CRATE-VERIFY ?auto_17790 ?auto_17791 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17795 - SURFACE
      ?auto_17796 - SURFACE
      ?auto_17797 - SURFACE
    )
    :vars
    (
      ?auto_17799 - HOIST
      ?auto_17800 - PLACE
      ?auto_17798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17799 ?auto_17800 ) ( SURFACE-AT ?auto_17796 ?auto_17800 ) ( CLEAR ?auto_17796 ) ( IS-CRATE ?auto_17797 ) ( not ( = ?auto_17796 ?auto_17797 ) ) ( TRUCK-AT ?auto_17798 ?auto_17800 ) ( AVAILABLE ?auto_17799 ) ( IN ?auto_17797 ?auto_17798 ) ( ON ?auto_17796 ?auto_17795 ) ( not ( = ?auto_17795 ?auto_17796 ) ) ( not ( = ?auto_17795 ?auto_17797 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17796 ?auto_17797 )
      ( MAKE-2CRATE-VERIFY ?auto_17795 ?auto_17796 ?auto_17797 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17801 - SURFACE
      ?auto_17802 - SURFACE
      ?auto_17803 - SURFACE
      ?auto_17804 - SURFACE
    )
    :vars
    (
      ?auto_17807 - HOIST
      ?auto_17805 - PLACE
      ?auto_17806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17807 ?auto_17805 ) ( SURFACE-AT ?auto_17803 ?auto_17805 ) ( CLEAR ?auto_17803 ) ( IS-CRATE ?auto_17804 ) ( not ( = ?auto_17803 ?auto_17804 ) ) ( TRUCK-AT ?auto_17806 ?auto_17805 ) ( AVAILABLE ?auto_17807 ) ( IN ?auto_17804 ?auto_17806 ) ( ON ?auto_17803 ?auto_17802 ) ( not ( = ?auto_17802 ?auto_17803 ) ) ( not ( = ?auto_17802 ?auto_17804 ) ) ( ON ?auto_17802 ?auto_17801 ) ( not ( = ?auto_17801 ?auto_17802 ) ) ( not ( = ?auto_17801 ?auto_17803 ) ) ( not ( = ?auto_17801 ?auto_17804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17802 ?auto_17803 ?auto_17804 )
      ( MAKE-3CRATE-VERIFY ?auto_17801 ?auto_17802 ?auto_17803 ?auto_17804 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17808 - SURFACE
      ?auto_17809 - SURFACE
      ?auto_17810 - SURFACE
      ?auto_17811 - SURFACE
      ?auto_17812 - SURFACE
    )
    :vars
    (
      ?auto_17815 - HOIST
      ?auto_17813 - PLACE
      ?auto_17814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17815 ?auto_17813 ) ( SURFACE-AT ?auto_17811 ?auto_17813 ) ( CLEAR ?auto_17811 ) ( IS-CRATE ?auto_17812 ) ( not ( = ?auto_17811 ?auto_17812 ) ) ( TRUCK-AT ?auto_17814 ?auto_17813 ) ( AVAILABLE ?auto_17815 ) ( IN ?auto_17812 ?auto_17814 ) ( ON ?auto_17811 ?auto_17810 ) ( not ( = ?auto_17810 ?auto_17811 ) ) ( not ( = ?auto_17810 ?auto_17812 ) ) ( ON ?auto_17809 ?auto_17808 ) ( ON ?auto_17810 ?auto_17809 ) ( not ( = ?auto_17808 ?auto_17809 ) ) ( not ( = ?auto_17808 ?auto_17810 ) ) ( not ( = ?auto_17808 ?auto_17811 ) ) ( not ( = ?auto_17808 ?auto_17812 ) ) ( not ( = ?auto_17809 ?auto_17810 ) ) ( not ( = ?auto_17809 ?auto_17811 ) ) ( not ( = ?auto_17809 ?auto_17812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17810 ?auto_17811 ?auto_17812 )
      ( MAKE-4CRATE-VERIFY ?auto_17808 ?auto_17809 ?auto_17810 ?auto_17811 ?auto_17812 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17816 - SURFACE
      ?auto_17817 - SURFACE
      ?auto_17818 - SURFACE
      ?auto_17819 - SURFACE
      ?auto_17820 - SURFACE
      ?auto_17821 - SURFACE
    )
    :vars
    (
      ?auto_17824 - HOIST
      ?auto_17822 - PLACE
      ?auto_17823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17824 ?auto_17822 ) ( SURFACE-AT ?auto_17820 ?auto_17822 ) ( CLEAR ?auto_17820 ) ( IS-CRATE ?auto_17821 ) ( not ( = ?auto_17820 ?auto_17821 ) ) ( TRUCK-AT ?auto_17823 ?auto_17822 ) ( AVAILABLE ?auto_17824 ) ( IN ?auto_17821 ?auto_17823 ) ( ON ?auto_17820 ?auto_17819 ) ( not ( = ?auto_17819 ?auto_17820 ) ) ( not ( = ?auto_17819 ?auto_17821 ) ) ( ON ?auto_17817 ?auto_17816 ) ( ON ?auto_17818 ?auto_17817 ) ( ON ?auto_17819 ?auto_17818 ) ( not ( = ?auto_17816 ?auto_17817 ) ) ( not ( = ?auto_17816 ?auto_17818 ) ) ( not ( = ?auto_17816 ?auto_17819 ) ) ( not ( = ?auto_17816 ?auto_17820 ) ) ( not ( = ?auto_17816 ?auto_17821 ) ) ( not ( = ?auto_17817 ?auto_17818 ) ) ( not ( = ?auto_17817 ?auto_17819 ) ) ( not ( = ?auto_17817 ?auto_17820 ) ) ( not ( = ?auto_17817 ?auto_17821 ) ) ( not ( = ?auto_17818 ?auto_17819 ) ) ( not ( = ?auto_17818 ?auto_17820 ) ) ( not ( = ?auto_17818 ?auto_17821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17819 ?auto_17820 ?auto_17821 )
      ( MAKE-5CRATE-VERIFY ?auto_17816 ?auto_17817 ?auto_17818 ?auto_17819 ?auto_17820 ?auto_17821 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17825 - SURFACE
      ?auto_17826 - SURFACE
    )
    :vars
    (
      ?auto_17829 - HOIST
      ?auto_17827 - PLACE
      ?auto_17828 - TRUCK
      ?auto_17830 - SURFACE
      ?auto_17831 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17829 ?auto_17827 ) ( SURFACE-AT ?auto_17825 ?auto_17827 ) ( CLEAR ?auto_17825 ) ( IS-CRATE ?auto_17826 ) ( not ( = ?auto_17825 ?auto_17826 ) ) ( AVAILABLE ?auto_17829 ) ( IN ?auto_17826 ?auto_17828 ) ( ON ?auto_17825 ?auto_17830 ) ( not ( = ?auto_17830 ?auto_17825 ) ) ( not ( = ?auto_17830 ?auto_17826 ) ) ( TRUCK-AT ?auto_17828 ?auto_17831 ) ( not ( = ?auto_17831 ?auto_17827 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17828 ?auto_17831 ?auto_17827 )
      ( MAKE-2CRATE ?auto_17830 ?auto_17825 ?auto_17826 )
      ( MAKE-1CRATE-VERIFY ?auto_17825 ?auto_17826 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17832 - SURFACE
      ?auto_17833 - SURFACE
      ?auto_17834 - SURFACE
    )
    :vars
    (
      ?auto_17836 - HOIST
      ?auto_17835 - PLACE
      ?auto_17838 - TRUCK
      ?auto_17837 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17836 ?auto_17835 ) ( SURFACE-AT ?auto_17833 ?auto_17835 ) ( CLEAR ?auto_17833 ) ( IS-CRATE ?auto_17834 ) ( not ( = ?auto_17833 ?auto_17834 ) ) ( AVAILABLE ?auto_17836 ) ( IN ?auto_17834 ?auto_17838 ) ( ON ?auto_17833 ?auto_17832 ) ( not ( = ?auto_17832 ?auto_17833 ) ) ( not ( = ?auto_17832 ?auto_17834 ) ) ( TRUCK-AT ?auto_17838 ?auto_17837 ) ( not ( = ?auto_17837 ?auto_17835 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17833 ?auto_17834 )
      ( MAKE-2CRATE-VERIFY ?auto_17832 ?auto_17833 ?auto_17834 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17839 - SURFACE
      ?auto_17840 - SURFACE
      ?auto_17841 - SURFACE
      ?auto_17842 - SURFACE
    )
    :vars
    (
      ?auto_17844 - HOIST
      ?auto_17846 - PLACE
      ?auto_17843 - TRUCK
      ?auto_17845 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17844 ?auto_17846 ) ( SURFACE-AT ?auto_17841 ?auto_17846 ) ( CLEAR ?auto_17841 ) ( IS-CRATE ?auto_17842 ) ( not ( = ?auto_17841 ?auto_17842 ) ) ( AVAILABLE ?auto_17844 ) ( IN ?auto_17842 ?auto_17843 ) ( ON ?auto_17841 ?auto_17840 ) ( not ( = ?auto_17840 ?auto_17841 ) ) ( not ( = ?auto_17840 ?auto_17842 ) ) ( TRUCK-AT ?auto_17843 ?auto_17845 ) ( not ( = ?auto_17845 ?auto_17846 ) ) ( ON ?auto_17840 ?auto_17839 ) ( not ( = ?auto_17839 ?auto_17840 ) ) ( not ( = ?auto_17839 ?auto_17841 ) ) ( not ( = ?auto_17839 ?auto_17842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17840 ?auto_17841 ?auto_17842 )
      ( MAKE-3CRATE-VERIFY ?auto_17839 ?auto_17840 ?auto_17841 ?auto_17842 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17847 - SURFACE
      ?auto_17848 - SURFACE
      ?auto_17849 - SURFACE
      ?auto_17850 - SURFACE
      ?auto_17851 - SURFACE
    )
    :vars
    (
      ?auto_17853 - HOIST
      ?auto_17855 - PLACE
      ?auto_17852 - TRUCK
      ?auto_17854 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17853 ?auto_17855 ) ( SURFACE-AT ?auto_17850 ?auto_17855 ) ( CLEAR ?auto_17850 ) ( IS-CRATE ?auto_17851 ) ( not ( = ?auto_17850 ?auto_17851 ) ) ( AVAILABLE ?auto_17853 ) ( IN ?auto_17851 ?auto_17852 ) ( ON ?auto_17850 ?auto_17849 ) ( not ( = ?auto_17849 ?auto_17850 ) ) ( not ( = ?auto_17849 ?auto_17851 ) ) ( TRUCK-AT ?auto_17852 ?auto_17854 ) ( not ( = ?auto_17854 ?auto_17855 ) ) ( ON ?auto_17848 ?auto_17847 ) ( ON ?auto_17849 ?auto_17848 ) ( not ( = ?auto_17847 ?auto_17848 ) ) ( not ( = ?auto_17847 ?auto_17849 ) ) ( not ( = ?auto_17847 ?auto_17850 ) ) ( not ( = ?auto_17847 ?auto_17851 ) ) ( not ( = ?auto_17848 ?auto_17849 ) ) ( not ( = ?auto_17848 ?auto_17850 ) ) ( not ( = ?auto_17848 ?auto_17851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17849 ?auto_17850 ?auto_17851 )
      ( MAKE-4CRATE-VERIFY ?auto_17847 ?auto_17848 ?auto_17849 ?auto_17850 ?auto_17851 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17856 - SURFACE
      ?auto_17857 - SURFACE
      ?auto_17858 - SURFACE
      ?auto_17859 - SURFACE
      ?auto_17860 - SURFACE
      ?auto_17861 - SURFACE
    )
    :vars
    (
      ?auto_17863 - HOIST
      ?auto_17865 - PLACE
      ?auto_17862 - TRUCK
      ?auto_17864 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17863 ?auto_17865 ) ( SURFACE-AT ?auto_17860 ?auto_17865 ) ( CLEAR ?auto_17860 ) ( IS-CRATE ?auto_17861 ) ( not ( = ?auto_17860 ?auto_17861 ) ) ( AVAILABLE ?auto_17863 ) ( IN ?auto_17861 ?auto_17862 ) ( ON ?auto_17860 ?auto_17859 ) ( not ( = ?auto_17859 ?auto_17860 ) ) ( not ( = ?auto_17859 ?auto_17861 ) ) ( TRUCK-AT ?auto_17862 ?auto_17864 ) ( not ( = ?auto_17864 ?auto_17865 ) ) ( ON ?auto_17857 ?auto_17856 ) ( ON ?auto_17858 ?auto_17857 ) ( ON ?auto_17859 ?auto_17858 ) ( not ( = ?auto_17856 ?auto_17857 ) ) ( not ( = ?auto_17856 ?auto_17858 ) ) ( not ( = ?auto_17856 ?auto_17859 ) ) ( not ( = ?auto_17856 ?auto_17860 ) ) ( not ( = ?auto_17856 ?auto_17861 ) ) ( not ( = ?auto_17857 ?auto_17858 ) ) ( not ( = ?auto_17857 ?auto_17859 ) ) ( not ( = ?auto_17857 ?auto_17860 ) ) ( not ( = ?auto_17857 ?auto_17861 ) ) ( not ( = ?auto_17858 ?auto_17859 ) ) ( not ( = ?auto_17858 ?auto_17860 ) ) ( not ( = ?auto_17858 ?auto_17861 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17859 ?auto_17860 ?auto_17861 )
      ( MAKE-5CRATE-VERIFY ?auto_17856 ?auto_17857 ?auto_17858 ?auto_17859 ?auto_17860 ?auto_17861 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17866 - SURFACE
      ?auto_17867 - SURFACE
    )
    :vars
    (
      ?auto_17869 - HOIST
      ?auto_17871 - PLACE
      ?auto_17872 - SURFACE
      ?auto_17868 - TRUCK
      ?auto_17870 - PLACE
      ?auto_17873 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17869 ?auto_17871 ) ( SURFACE-AT ?auto_17866 ?auto_17871 ) ( CLEAR ?auto_17866 ) ( IS-CRATE ?auto_17867 ) ( not ( = ?auto_17866 ?auto_17867 ) ) ( AVAILABLE ?auto_17869 ) ( ON ?auto_17866 ?auto_17872 ) ( not ( = ?auto_17872 ?auto_17866 ) ) ( not ( = ?auto_17872 ?auto_17867 ) ) ( TRUCK-AT ?auto_17868 ?auto_17870 ) ( not ( = ?auto_17870 ?auto_17871 ) ) ( HOIST-AT ?auto_17873 ?auto_17870 ) ( LIFTING ?auto_17873 ?auto_17867 ) ( not ( = ?auto_17869 ?auto_17873 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17873 ?auto_17867 ?auto_17868 ?auto_17870 )
      ( MAKE-2CRATE ?auto_17872 ?auto_17866 ?auto_17867 )
      ( MAKE-1CRATE-VERIFY ?auto_17866 ?auto_17867 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17874 - SURFACE
      ?auto_17875 - SURFACE
      ?auto_17876 - SURFACE
    )
    :vars
    (
      ?auto_17877 - HOIST
      ?auto_17880 - PLACE
      ?auto_17878 - TRUCK
      ?auto_17879 - PLACE
      ?auto_17881 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17877 ?auto_17880 ) ( SURFACE-AT ?auto_17875 ?auto_17880 ) ( CLEAR ?auto_17875 ) ( IS-CRATE ?auto_17876 ) ( not ( = ?auto_17875 ?auto_17876 ) ) ( AVAILABLE ?auto_17877 ) ( ON ?auto_17875 ?auto_17874 ) ( not ( = ?auto_17874 ?auto_17875 ) ) ( not ( = ?auto_17874 ?auto_17876 ) ) ( TRUCK-AT ?auto_17878 ?auto_17879 ) ( not ( = ?auto_17879 ?auto_17880 ) ) ( HOIST-AT ?auto_17881 ?auto_17879 ) ( LIFTING ?auto_17881 ?auto_17876 ) ( not ( = ?auto_17877 ?auto_17881 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17875 ?auto_17876 )
      ( MAKE-2CRATE-VERIFY ?auto_17874 ?auto_17875 ?auto_17876 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17882 - SURFACE
      ?auto_17883 - SURFACE
      ?auto_17884 - SURFACE
      ?auto_17885 - SURFACE
    )
    :vars
    (
      ?auto_17886 - HOIST
      ?auto_17890 - PLACE
      ?auto_17889 - TRUCK
      ?auto_17887 - PLACE
      ?auto_17888 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17886 ?auto_17890 ) ( SURFACE-AT ?auto_17884 ?auto_17890 ) ( CLEAR ?auto_17884 ) ( IS-CRATE ?auto_17885 ) ( not ( = ?auto_17884 ?auto_17885 ) ) ( AVAILABLE ?auto_17886 ) ( ON ?auto_17884 ?auto_17883 ) ( not ( = ?auto_17883 ?auto_17884 ) ) ( not ( = ?auto_17883 ?auto_17885 ) ) ( TRUCK-AT ?auto_17889 ?auto_17887 ) ( not ( = ?auto_17887 ?auto_17890 ) ) ( HOIST-AT ?auto_17888 ?auto_17887 ) ( LIFTING ?auto_17888 ?auto_17885 ) ( not ( = ?auto_17886 ?auto_17888 ) ) ( ON ?auto_17883 ?auto_17882 ) ( not ( = ?auto_17882 ?auto_17883 ) ) ( not ( = ?auto_17882 ?auto_17884 ) ) ( not ( = ?auto_17882 ?auto_17885 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17883 ?auto_17884 ?auto_17885 )
      ( MAKE-3CRATE-VERIFY ?auto_17882 ?auto_17883 ?auto_17884 ?auto_17885 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17891 - SURFACE
      ?auto_17892 - SURFACE
      ?auto_17893 - SURFACE
      ?auto_17894 - SURFACE
      ?auto_17895 - SURFACE
    )
    :vars
    (
      ?auto_17896 - HOIST
      ?auto_17900 - PLACE
      ?auto_17899 - TRUCK
      ?auto_17897 - PLACE
      ?auto_17898 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17896 ?auto_17900 ) ( SURFACE-AT ?auto_17894 ?auto_17900 ) ( CLEAR ?auto_17894 ) ( IS-CRATE ?auto_17895 ) ( not ( = ?auto_17894 ?auto_17895 ) ) ( AVAILABLE ?auto_17896 ) ( ON ?auto_17894 ?auto_17893 ) ( not ( = ?auto_17893 ?auto_17894 ) ) ( not ( = ?auto_17893 ?auto_17895 ) ) ( TRUCK-AT ?auto_17899 ?auto_17897 ) ( not ( = ?auto_17897 ?auto_17900 ) ) ( HOIST-AT ?auto_17898 ?auto_17897 ) ( LIFTING ?auto_17898 ?auto_17895 ) ( not ( = ?auto_17896 ?auto_17898 ) ) ( ON ?auto_17892 ?auto_17891 ) ( ON ?auto_17893 ?auto_17892 ) ( not ( = ?auto_17891 ?auto_17892 ) ) ( not ( = ?auto_17891 ?auto_17893 ) ) ( not ( = ?auto_17891 ?auto_17894 ) ) ( not ( = ?auto_17891 ?auto_17895 ) ) ( not ( = ?auto_17892 ?auto_17893 ) ) ( not ( = ?auto_17892 ?auto_17894 ) ) ( not ( = ?auto_17892 ?auto_17895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17893 ?auto_17894 ?auto_17895 )
      ( MAKE-4CRATE-VERIFY ?auto_17891 ?auto_17892 ?auto_17893 ?auto_17894 ?auto_17895 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17901 - SURFACE
      ?auto_17902 - SURFACE
      ?auto_17903 - SURFACE
      ?auto_17904 - SURFACE
      ?auto_17905 - SURFACE
      ?auto_17906 - SURFACE
    )
    :vars
    (
      ?auto_17907 - HOIST
      ?auto_17911 - PLACE
      ?auto_17910 - TRUCK
      ?auto_17908 - PLACE
      ?auto_17909 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17907 ?auto_17911 ) ( SURFACE-AT ?auto_17905 ?auto_17911 ) ( CLEAR ?auto_17905 ) ( IS-CRATE ?auto_17906 ) ( not ( = ?auto_17905 ?auto_17906 ) ) ( AVAILABLE ?auto_17907 ) ( ON ?auto_17905 ?auto_17904 ) ( not ( = ?auto_17904 ?auto_17905 ) ) ( not ( = ?auto_17904 ?auto_17906 ) ) ( TRUCK-AT ?auto_17910 ?auto_17908 ) ( not ( = ?auto_17908 ?auto_17911 ) ) ( HOIST-AT ?auto_17909 ?auto_17908 ) ( LIFTING ?auto_17909 ?auto_17906 ) ( not ( = ?auto_17907 ?auto_17909 ) ) ( ON ?auto_17902 ?auto_17901 ) ( ON ?auto_17903 ?auto_17902 ) ( ON ?auto_17904 ?auto_17903 ) ( not ( = ?auto_17901 ?auto_17902 ) ) ( not ( = ?auto_17901 ?auto_17903 ) ) ( not ( = ?auto_17901 ?auto_17904 ) ) ( not ( = ?auto_17901 ?auto_17905 ) ) ( not ( = ?auto_17901 ?auto_17906 ) ) ( not ( = ?auto_17902 ?auto_17903 ) ) ( not ( = ?auto_17902 ?auto_17904 ) ) ( not ( = ?auto_17902 ?auto_17905 ) ) ( not ( = ?auto_17902 ?auto_17906 ) ) ( not ( = ?auto_17903 ?auto_17904 ) ) ( not ( = ?auto_17903 ?auto_17905 ) ) ( not ( = ?auto_17903 ?auto_17906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17904 ?auto_17905 ?auto_17906 )
      ( MAKE-5CRATE-VERIFY ?auto_17901 ?auto_17902 ?auto_17903 ?auto_17904 ?auto_17905 ?auto_17906 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17912 - SURFACE
      ?auto_17913 - SURFACE
    )
    :vars
    (
      ?auto_17914 - HOIST
      ?auto_17918 - PLACE
      ?auto_17919 - SURFACE
      ?auto_17917 - TRUCK
      ?auto_17915 - PLACE
      ?auto_17916 - HOIST
      ?auto_17920 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17914 ?auto_17918 ) ( SURFACE-AT ?auto_17912 ?auto_17918 ) ( CLEAR ?auto_17912 ) ( IS-CRATE ?auto_17913 ) ( not ( = ?auto_17912 ?auto_17913 ) ) ( AVAILABLE ?auto_17914 ) ( ON ?auto_17912 ?auto_17919 ) ( not ( = ?auto_17919 ?auto_17912 ) ) ( not ( = ?auto_17919 ?auto_17913 ) ) ( TRUCK-AT ?auto_17917 ?auto_17915 ) ( not ( = ?auto_17915 ?auto_17918 ) ) ( HOIST-AT ?auto_17916 ?auto_17915 ) ( not ( = ?auto_17914 ?auto_17916 ) ) ( AVAILABLE ?auto_17916 ) ( SURFACE-AT ?auto_17913 ?auto_17915 ) ( ON ?auto_17913 ?auto_17920 ) ( CLEAR ?auto_17913 ) ( not ( = ?auto_17912 ?auto_17920 ) ) ( not ( = ?auto_17913 ?auto_17920 ) ) ( not ( = ?auto_17919 ?auto_17920 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17916 ?auto_17913 ?auto_17920 ?auto_17915 )
      ( MAKE-2CRATE ?auto_17919 ?auto_17912 ?auto_17913 )
      ( MAKE-1CRATE-VERIFY ?auto_17912 ?auto_17913 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17921 - SURFACE
      ?auto_17922 - SURFACE
      ?auto_17923 - SURFACE
    )
    :vars
    (
      ?auto_17924 - HOIST
      ?auto_17927 - PLACE
      ?auto_17928 - TRUCK
      ?auto_17925 - PLACE
      ?auto_17926 - HOIST
      ?auto_17929 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17924 ?auto_17927 ) ( SURFACE-AT ?auto_17922 ?auto_17927 ) ( CLEAR ?auto_17922 ) ( IS-CRATE ?auto_17923 ) ( not ( = ?auto_17922 ?auto_17923 ) ) ( AVAILABLE ?auto_17924 ) ( ON ?auto_17922 ?auto_17921 ) ( not ( = ?auto_17921 ?auto_17922 ) ) ( not ( = ?auto_17921 ?auto_17923 ) ) ( TRUCK-AT ?auto_17928 ?auto_17925 ) ( not ( = ?auto_17925 ?auto_17927 ) ) ( HOIST-AT ?auto_17926 ?auto_17925 ) ( not ( = ?auto_17924 ?auto_17926 ) ) ( AVAILABLE ?auto_17926 ) ( SURFACE-AT ?auto_17923 ?auto_17925 ) ( ON ?auto_17923 ?auto_17929 ) ( CLEAR ?auto_17923 ) ( not ( = ?auto_17922 ?auto_17929 ) ) ( not ( = ?auto_17923 ?auto_17929 ) ) ( not ( = ?auto_17921 ?auto_17929 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17922 ?auto_17923 )
      ( MAKE-2CRATE-VERIFY ?auto_17921 ?auto_17922 ?auto_17923 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17930 - SURFACE
      ?auto_17931 - SURFACE
      ?auto_17932 - SURFACE
      ?auto_17933 - SURFACE
    )
    :vars
    (
      ?auto_17936 - HOIST
      ?auto_17938 - PLACE
      ?auto_17937 - TRUCK
      ?auto_17939 - PLACE
      ?auto_17934 - HOIST
      ?auto_17935 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17936 ?auto_17938 ) ( SURFACE-AT ?auto_17932 ?auto_17938 ) ( CLEAR ?auto_17932 ) ( IS-CRATE ?auto_17933 ) ( not ( = ?auto_17932 ?auto_17933 ) ) ( AVAILABLE ?auto_17936 ) ( ON ?auto_17932 ?auto_17931 ) ( not ( = ?auto_17931 ?auto_17932 ) ) ( not ( = ?auto_17931 ?auto_17933 ) ) ( TRUCK-AT ?auto_17937 ?auto_17939 ) ( not ( = ?auto_17939 ?auto_17938 ) ) ( HOIST-AT ?auto_17934 ?auto_17939 ) ( not ( = ?auto_17936 ?auto_17934 ) ) ( AVAILABLE ?auto_17934 ) ( SURFACE-AT ?auto_17933 ?auto_17939 ) ( ON ?auto_17933 ?auto_17935 ) ( CLEAR ?auto_17933 ) ( not ( = ?auto_17932 ?auto_17935 ) ) ( not ( = ?auto_17933 ?auto_17935 ) ) ( not ( = ?auto_17931 ?auto_17935 ) ) ( ON ?auto_17931 ?auto_17930 ) ( not ( = ?auto_17930 ?auto_17931 ) ) ( not ( = ?auto_17930 ?auto_17932 ) ) ( not ( = ?auto_17930 ?auto_17933 ) ) ( not ( = ?auto_17930 ?auto_17935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17931 ?auto_17932 ?auto_17933 )
      ( MAKE-3CRATE-VERIFY ?auto_17930 ?auto_17931 ?auto_17932 ?auto_17933 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17940 - SURFACE
      ?auto_17941 - SURFACE
      ?auto_17942 - SURFACE
      ?auto_17943 - SURFACE
      ?auto_17944 - SURFACE
    )
    :vars
    (
      ?auto_17947 - HOIST
      ?auto_17949 - PLACE
      ?auto_17948 - TRUCK
      ?auto_17950 - PLACE
      ?auto_17945 - HOIST
      ?auto_17946 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17947 ?auto_17949 ) ( SURFACE-AT ?auto_17943 ?auto_17949 ) ( CLEAR ?auto_17943 ) ( IS-CRATE ?auto_17944 ) ( not ( = ?auto_17943 ?auto_17944 ) ) ( AVAILABLE ?auto_17947 ) ( ON ?auto_17943 ?auto_17942 ) ( not ( = ?auto_17942 ?auto_17943 ) ) ( not ( = ?auto_17942 ?auto_17944 ) ) ( TRUCK-AT ?auto_17948 ?auto_17950 ) ( not ( = ?auto_17950 ?auto_17949 ) ) ( HOIST-AT ?auto_17945 ?auto_17950 ) ( not ( = ?auto_17947 ?auto_17945 ) ) ( AVAILABLE ?auto_17945 ) ( SURFACE-AT ?auto_17944 ?auto_17950 ) ( ON ?auto_17944 ?auto_17946 ) ( CLEAR ?auto_17944 ) ( not ( = ?auto_17943 ?auto_17946 ) ) ( not ( = ?auto_17944 ?auto_17946 ) ) ( not ( = ?auto_17942 ?auto_17946 ) ) ( ON ?auto_17941 ?auto_17940 ) ( ON ?auto_17942 ?auto_17941 ) ( not ( = ?auto_17940 ?auto_17941 ) ) ( not ( = ?auto_17940 ?auto_17942 ) ) ( not ( = ?auto_17940 ?auto_17943 ) ) ( not ( = ?auto_17940 ?auto_17944 ) ) ( not ( = ?auto_17940 ?auto_17946 ) ) ( not ( = ?auto_17941 ?auto_17942 ) ) ( not ( = ?auto_17941 ?auto_17943 ) ) ( not ( = ?auto_17941 ?auto_17944 ) ) ( not ( = ?auto_17941 ?auto_17946 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17942 ?auto_17943 ?auto_17944 )
      ( MAKE-4CRATE-VERIFY ?auto_17940 ?auto_17941 ?auto_17942 ?auto_17943 ?auto_17944 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17951 - SURFACE
      ?auto_17952 - SURFACE
      ?auto_17953 - SURFACE
      ?auto_17954 - SURFACE
      ?auto_17955 - SURFACE
      ?auto_17956 - SURFACE
    )
    :vars
    (
      ?auto_17959 - HOIST
      ?auto_17961 - PLACE
      ?auto_17960 - TRUCK
      ?auto_17962 - PLACE
      ?auto_17957 - HOIST
      ?auto_17958 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17959 ?auto_17961 ) ( SURFACE-AT ?auto_17955 ?auto_17961 ) ( CLEAR ?auto_17955 ) ( IS-CRATE ?auto_17956 ) ( not ( = ?auto_17955 ?auto_17956 ) ) ( AVAILABLE ?auto_17959 ) ( ON ?auto_17955 ?auto_17954 ) ( not ( = ?auto_17954 ?auto_17955 ) ) ( not ( = ?auto_17954 ?auto_17956 ) ) ( TRUCK-AT ?auto_17960 ?auto_17962 ) ( not ( = ?auto_17962 ?auto_17961 ) ) ( HOIST-AT ?auto_17957 ?auto_17962 ) ( not ( = ?auto_17959 ?auto_17957 ) ) ( AVAILABLE ?auto_17957 ) ( SURFACE-AT ?auto_17956 ?auto_17962 ) ( ON ?auto_17956 ?auto_17958 ) ( CLEAR ?auto_17956 ) ( not ( = ?auto_17955 ?auto_17958 ) ) ( not ( = ?auto_17956 ?auto_17958 ) ) ( not ( = ?auto_17954 ?auto_17958 ) ) ( ON ?auto_17952 ?auto_17951 ) ( ON ?auto_17953 ?auto_17952 ) ( ON ?auto_17954 ?auto_17953 ) ( not ( = ?auto_17951 ?auto_17952 ) ) ( not ( = ?auto_17951 ?auto_17953 ) ) ( not ( = ?auto_17951 ?auto_17954 ) ) ( not ( = ?auto_17951 ?auto_17955 ) ) ( not ( = ?auto_17951 ?auto_17956 ) ) ( not ( = ?auto_17951 ?auto_17958 ) ) ( not ( = ?auto_17952 ?auto_17953 ) ) ( not ( = ?auto_17952 ?auto_17954 ) ) ( not ( = ?auto_17952 ?auto_17955 ) ) ( not ( = ?auto_17952 ?auto_17956 ) ) ( not ( = ?auto_17952 ?auto_17958 ) ) ( not ( = ?auto_17953 ?auto_17954 ) ) ( not ( = ?auto_17953 ?auto_17955 ) ) ( not ( = ?auto_17953 ?auto_17956 ) ) ( not ( = ?auto_17953 ?auto_17958 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17954 ?auto_17955 ?auto_17956 )
      ( MAKE-5CRATE-VERIFY ?auto_17951 ?auto_17952 ?auto_17953 ?auto_17954 ?auto_17955 ?auto_17956 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17963 - SURFACE
      ?auto_17964 - SURFACE
    )
    :vars
    (
      ?auto_17967 - HOIST
      ?auto_17969 - PLACE
      ?auto_17971 - SURFACE
      ?auto_17970 - PLACE
      ?auto_17965 - HOIST
      ?auto_17966 - SURFACE
      ?auto_17968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17967 ?auto_17969 ) ( SURFACE-AT ?auto_17963 ?auto_17969 ) ( CLEAR ?auto_17963 ) ( IS-CRATE ?auto_17964 ) ( not ( = ?auto_17963 ?auto_17964 ) ) ( AVAILABLE ?auto_17967 ) ( ON ?auto_17963 ?auto_17971 ) ( not ( = ?auto_17971 ?auto_17963 ) ) ( not ( = ?auto_17971 ?auto_17964 ) ) ( not ( = ?auto_17970 ?auto_17969 ) ) ( HOIST-AT ?auto_17965 ?auto_17970 ) ( not ( = ?auto_17967 ?auto_17965 ) ) ( AVAILABLE ?auto_17965 ) ( SURFACE-AT ?auto_17964 ?auto_17970 ) ( ON ?auto_17964 ?auto_17966 ) ( CLEAR ?auto_17964 ) ( not ( = ?auto_17963 ?auto_17966 ) ) ( not ( = ?auto_17964 ?auto_17966 ) ) ( not ( = ?auto_17971 ?auto_17966 ) ) ( TRUCK-AT ?auto_17968 ?auto_17969 ) )
    :subtasks
    ( ( !DRIVE ?auto_17968 ?auto_17969 ?auto_17970 )
      ( MAKE-2CRATE ?auto_17971 ?auto_17963 ?auto_17964 )
      ( MAKE-1CRATE-VERIFY ?auto_17963 ?auto_17964 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17972 - SURFACE
      ?auto_17973 - SURFACE
      ?auto_17974 - SURFACE
    )
    :vars
    (
      ?auto_17979 - HOIST
      ?auto_17975 - PLACE
      ?auto_17980 - PLACE
      ?auto_17976 - HOIST
      ?auto_17977 - SURFACE
      ?auto_17978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17979 ?auto_17975 ) ( SURFACE-AT ?auto_17973 ?auto_17975 ) ( CLEAR ?auto_17973 ) ( IS-CRATE ?auto_17974 ) ( not ( = ?auto_17973 ?auto_17974 ) ) ( AVAILABLE ?auto_17979 ) ( ON ?auto_17973 ?auto_17972 ) ( not ( = ?auto_17972 ?auto_17973 ) ) ( not ( = ?auto_17972 ?auto_17974 ) ) ( not ( = ?auto_17980 ?auto_17975 ) ) ( HOIST-AT ?auto_17976 ?auto_17980 ) ( not ( = ?auto_17979 ?auto_17976 ) ) ( AVAILABLE ?auto_17976 ) ( SURFACE-AT ?auto_17974 ?auto_17980 ) ( ON ?auto_17974 ?auto_17977 ) ( CLEAR ?auto_17974 ) ( not ( = ?auto_17973 ?auto_17977 ) ) ( not ( = ?auto_17974 ?auto_17977 ) ) ( not ( = ?auto_17972 ?auto_17977 ) ) ( TRUCK-AT ?auto_17978 ?auto_17975 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17973 ?auto_17974 )
      ( MAKE-2CRATE-VERIFY ?auto_17972 ?auto_17973 ?auto_17974 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17981 - SURFACE
      ?auto_17982 - SURFACE
      ?auto_17983 - SURFACE
      ?auto_17984 - SURFACE
    )
    :vars
    (
      ?auto_17989 - HOIST
      ?auto_17988 - PLACE
      ?auto_17986 - PLACE
      ?auto_17990 - HOIST
      ?auto_17985 - SURFACE
      ?auto_17987 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17989 ?auto_17988 ) ( SURFACE-AT ?auto_17983 ?auto_17988 ) ( CLEAR ?auto_17983 ) ( IS-CRATE ?auto_17984 ) ( not ( = ?auto_17983 ?auto_17984 ) ) ( AVAILABLE ?auto_17989 ) ( ON ?auto_17983 ?auto_17982 ) ( not ( = ?auto_17982 ?auto_17983 ) ) ( not ( = ?auto_17982 ?auto_17984 ) ) ( not ( = ?auto_17986 ?auto_17988 ) ) ( HOIST-AT ?auto_17990 ?auto_17986 ) ( not ( = ?auto_17989 ?auto_17990 ) ) ( AVAILABLE ?auto_17990 ) ( SURFACE-AT ?auto_17984 ?auto_17986 ) ( ON ?auto_17984 ?auto_17985 ) ( CLEAR ?auto_17984 ) ( not ( = ?auto_17983 ?auto_17985 ) ) ( not ( = ?auto_17984 ?auto_17985 ) ) ( not ( = ?auto_17982 ?auto_17985 ) ) ( TRUCK-AT ?auto_17987 ?auto_17988 ) ( ON ?auto_17982 ?auto_17981 ) ( not ( = ?auto_17981 ?auto_17982 ) ) ( not ( = ?auto_17981 ?auto_17983 ) ) ( not ( = ?auto_17981 ?auto_17984 ) ) ( not ( = ?auto_17981 ?auto_17985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17982 ?auto_17983 ?auto_17984 )
      ( MAKE-3CRATE-VERIFY ?auto_17981 ?auto_17982 ?auto_17983 ?auto_17984 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17991 - SURFACE
      ?auto_17992 - SURFACE
      ?auto_17993 - SURFACE
      ?auto_17994 - SURFACE
      ?auto_17995 - SURFACE
    )
    :vars
    (
      ?auto_18000 - HOIST
      ?auto_17999 - PLACE
      ?auto_17997 - PLACE
      ?auto_18001 - HOIST
      ?auto_17996 - SURFACE
      ?auto_17998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18000 ?auto_17999 ) ( SURFACE-AT ?auto_17994 ?auto_17999 ) ( CLEAR ?auto_17994 ) ( IS-CRATE ?auto_17995 ) ( not ( = ?auto_17994 ?auto_17995 ) ) ( AVAILABLE ?auto_18000 ) ( ON ?auto_17994 ?auto_17993 ) ( not ( = ?auto_17993 ?auto_17994 ) ) ( not ( = ?auto_17993 ?auto_17995 ) ) ( not ( = ?auto_17997 ?auto_17999 ) ) ( HOIST-AT ?auto_18001 ?auto_17997 ) ( not ( = ?auto_18000 ?auto_18001 ) ) ( AVAILABLE ?auto_18001 ) ( SURFACE-AT ?auto_17995 ?auto_17997 ) ( ON ?auto_17995 ?auto_17996 ) ( CLEAR ?auto_17995 ) ( not ( = ?auto_17994 ?auto_17996 ) ) ( not ( = ?auto_17995 ?auto_17996 ) ) ( not ( = ?auto_17993 ?auto_17996 ) ) ( TRUCK-AT ?auto_17998 ?auto_17999 ) ( ON ?auto_17992 ?auto_17991 ) ( ON ?auto_17993 ?auto_17992 ) ( not ( = ?auto_17991 ?auto_17992 ) ) ( not ( = ?auto_17991 ?auto_17993 ) ) ( not ( = ?auto_17991 ?auto_17994 ) ) ( not ( = ?auto_17991 ?auto_17995 ) ) ( not ( = ?auto_17991 ?auto_17996 ) ) ( not ( = ?auto_17992 ?auto_17993 ) ) ( not ( = ?auto_17992 ?auto_17994 ) ) ( not ( = ?auto_17992 ?auto_17995 ) ) ( not ( = ?auto_17992 ?auto_17996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17993 ?auto_17994 ?auto_17995 )
      ( MAKE-4CRATE-VERIFY ?auto_17991 ?auto_17992 ?auto_17993 ?auto_17994 ?auto_17995 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18002 - SURFACE
      ?auto_18003 - SURFACE
      ?auto_18004 - SURFACE
      ?auto_18005 - SURFACE
      ?auto_18006 - SURFACE
      ?auto_18007 - SURFACE
    )
    :vars
    (
      ?auto_18012 - HOIST
      ?auto_18011 - PLACE
      ?auto_18009 - PLACE
      ?auto_18013 - HOIST
      ?auto_18008 - SURFACE
      ?auto_18010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18012 ?auto_18011 ) ( SURFACE-AT ?auto_18006 ?auto_18011 ) ( CLEAR ?auto_18006 ) ( IS-CRATE ?auto_18007 ) ( not ( = ?auto_18006 ?auto_18007 ) ) ( AVAILABLE ?auto_18012 ) ( ON ?auto_18006 ?auto_18005 ) ( not ( = ?auto_18005 ?auto_18006 ) ) ( not ( = ?auto_18005 ?auto_18007 ) ) ( not ( = ?auto_18009 ?auto_18011 ) ) ( HOIST-AT ?auto_18013 ?auto_18009 ) ( not ( = ?auto_18012 ?auto_18013 ) ) ( AVAILABLE ?auto_18013 ) ( SURFACE-AT ?auto_18007 ?auto_18009 ) ( ON ?auto_18007 ?auto_18008 ) ( CLEAR ?auto_18007 ) ( not ( = ?auto_18006 ?auto_18008 ) ) ( not ( = ?auto_18007 ?auto_18008 ) ) ( not ( = ?auto_18005 ?auto_18008 ) ) ( TRUCK-AT ?auto_18010 ?auto_18011 ) ( ON ?auto_18003 ?auto_18002 ) ( ON ?auto_18004 ?auto_18003 ) ( ON ?auto_18005 ?auto_18004 ) ( not ( = ?auto_18002 ?auto_18003 ) ) ( not ( = ?auto_18002 ?auto_18004 ) ) ( not ( = ?auto_18002 ?auto_18005 ) ) ( not ( = ?auto_18002 ?auto_18006 ) ) ( not ( = ?auto_18002 ?auto_18007 ) ) ( not ( = ?auto_18002 ?auto_18008 ) ) ( not ( = ?auto_18003 ?auto_18004 ) ) ( not ( = ?auto_18003 ?auto_18005 ) ) ( not ( = ?auto_18003 ?auto_18006 ) ) ( not ( = ?auto_18003 ?auto_18007 ) ) ( not ( = ?auto_18003 ?auto_18008 ) ) ( not ( = ?auto_18004 ?auto_18005 ) ) ( not ( = ?auto_18004 ?auto_18006 ) ) ( not ( = ?auto_18004 ?auto_18007 ) ) ( not ( = ?auto_18004 ?auto_18008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18005 ?auto_18006 ?auto_18007 )
      ( MAKE-5CRATE-VERIFY ?auto_18002 ?auto_18003 ?auto_18004 ?auto_18005 ?auto_18006 ?auto_18007 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18014 - SURFACE
      ?auto_18015 - SURFACE
    )
    :vars
    (
      ?auto_18020 - HOIST
      ?auto_18019 - PLACE
      ?auto_18022 - SURFACE
      ?auto_18017 - PLACE
      ?auto_18021 - HOIST
      ?auto_18016 - SURFACE
      ?auto_18018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18020 ?auto_18019 ) ( IS-CRATE ?auto_18015 ) ( not ( = ?auto_18014 ?auto_18015 ) ) ( not ( = ?auto_18022 ?auto_18014 ) ) ( not ( = ?auto_18022 ?auto_18015 ) ) ( not ( = ?auto_18017 ?auto_18019 ) ) ( HOIST-AT ?auto_18021 ?auto_18017 ) ( not ( = ?auto_18020 ?auto_18021 ) ) ( AVAILABLE ?auto_18021 ) ( SURFACE-AT ?auto_18015 ?auto_18017 ) ( ON ?auto_18015 ?auto_18016 ) ( CLEAR ?auto_18015 ) ( not ( = ?auto_18014 ?auto_18016 ) ) ( not ( = ?auto_18015 ?auto_18016 ) ) ( not ( = ?auto_18022 ?auto_18016 ) ) ( TRUCK-AT ?auto_18018 ?auto_18019 ) ( SURFACE-AT ?auto_18022 ?auto_18019 ) ( CLEAR ?auto_18022 ) ( LIFTING ?auto_18020 ?auto_18014 ) ( IS-CRATE ?auto_18014 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18022 ?auto_18014 )
      ( MAKE-2CRATE ?auto_18022 ?auto_18014 ?auto_18015 )
      ( MAKE-1CRATE-VERIFY ?auto_18014 ?auto_18015 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18023 - SURFACE
      ?auto_18024 - SURFACE
      ?auto_18025 - SURFACE
    )
    :vars
    (
      ?auto_18030 - HOIST
      ?auto_18026 - PLACE
      ?auto_18031 - PLACE
      ?auto_18028 - HOIST
      ?auto_18027 - SURFACE
      ?auto_18029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18030 ?auto_18026 ) ( IS-CRATE ?auto_18025 ) ( not ( = ?auto_18024 ?auto_18025 ) ) ( not ( = ?auto_18023 ?auto_18024 ) ) ( not ( = ?auto_18023 ?auto_18025 ) ) ( not ( = ?auto_18031 ?auto_18026 ) ) ( HOIST-AT ?auto_18028 ?auto_18031 ) ( not ( = ?auto_18030 ?auto_18028 ) ) ( AVAILABLE ?auto_18028 ) ( SURFACE-AT ?auto_18025 ?auto_18031 ) ( ON ?auto_18025 ?auto_18027 ) ( CLEAR ?auto_18025 ) ( not ( = ?auto_18024 ?auto_18027 ) ) ( not ( = ?auto_18025 ?auto_18027 ) ) ( not ( = ?auto_18023 ?auto_18027 ) ) ( TRUCK-AT ?auto_18029 ?auto_18026 ) ( SURFACE-AT ?auto_18023 ?auto_18026 ) ( CLEAR ?auto_18023 ) ( LIFTING ?auto_18030 ?auto_18024 ) ( IS-CRATE ?auto_18024 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18024 ?auto_18025 )
      ( MAKE-2CRATE-VERIFY ?auto_18023 ?auto_18024 ?auto_18025 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18032 - SURFACE
      ?auto_18033 - SURFACE
      ?auto_18034 - SURFACE
      ?auto_18035 - SURFACE
    )
    :vars
    (
      ?auto_18039 - HOIST
      ?auto_18040 - PLACE
      ?auto_18041 - PLACE
      ?auto_18038 - HOIST
      ?auto_18036 - SURFACE
      ?auto_18037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18039 ?auto_18040 ) ( IS-CRATE ?auto_18035 ) ( not ( = ?auto_18034 ?auto_18035 ) ) ( not ( = ?auto_18033 ?auto_18034 ) ) ( not ( = ?auto_18033 ?auto_18035 ) ) ( not ( = ?auto_18041 ?auto_18040 ) ) ( HOIST-AT ?auto_18038 ?auto_18041 ) ( not ( = ?auto_18039 ?auto_18038 ) ) ( AVAILABLE ?auto_18038 ) ( SURFACE-AT ?auto_18035 ?auto_18041 ) ( ON ?auto_18035 ?auto_18036 ) ( CLEAR ?auto_18035 ) ( not ( = ?auto_18034 ?auto_18036 ) ) ( not ( = ?auto_18035 ?auto_18036 ) ) ( not ( = ?auto_18033 ?auto_18036 ) ) ( TRUCK-AT ?auto_18037 ?auto_18040 ) ( SURFACE-AT ?auto_18033 ?auto_18040 ) ( CLEAR ?auto_18033 ) ( LIFTING ?auto_18039 ?auto_18034 ) ( IS-CRATE ?auto_18034 ) ( ON ?auto_18033 ?auto_18032 ) ( not ( = ?auto_18032 ?auto_18033 ) ) ( not ( = ?auto_18032 ?auto_18034 ) ) ( not ( = ?auto_18032 ?auto_18035 ) ) ( not ( = ?auto_18032 ?auto_18036 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18033 ?auto_18034 ?auto_18035 )
      ( MAKE-3CRATE-VERIFY ?auto_18032 ?auto_18033 ?auto_18034 ?auto_18035 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18042 - SURFACE
      ?auto_18043 - SURFACE
      ?auto_18044 - SURFACE
      ?auto_18045 - SURFACE
      ?auto_18046 - SURFACE
    )
    :vars
    (
      ?auto_18050 - HOIST
      ?auto_18051 - PLACE
      ?auto_18052 - PLACE
      ?auto_18049 - HOIST
      ?auto_18047 - SURFACE
      ?auto_18048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18050 ?auto_18051 ) ( IS-CRATE ?auto_18046 ) ( not ( = ?auto_18045 ?auto_18046 ) ) ( not ( = ?auto_18044 ?auto_18045 ) ) ( not ( = ?auto_18044 ?auto_18046 ) ) ( not ( = ?auto_18052 ?auto_18051 ) ) ( HOIST-AT ?auto_18049 ?auto_18052 ) ( not ( = ?auto_18050 ?auto_18049 ) ) ( AVAILABLE ?auto_18049 ) ( SURFACE-AT ?auto_18046 ?auto_18052 ) ( ON ?auto_18046 ?auto_18047 ) ( CLEAR ?auto_18046 ) ( not ( = ?auto_18045 ?auto_18047 ) ) ( not ( = ?auto_18046 ?auto_18047 ) ) ( not ( = ?auto_18044 ?auto_18047 ) ) ( TRUCK-AT ?auto_18048 ?auto_18051 ) ( SURFACE-AT ?auto_18044 ?auto_18051 ) ( CLEAR ?auto_18044 ) ( LIFTING ?auto_18050 ?auto_18045 ) ( IS-CRATE ?auto_18045 ) ( ON ?auto_18043 ?auto_18042 ) ( ON ?auto_18044 ?auto_18043 ) ( not ( = ?auto_18042 ?auto_18043 ) ) ( not ( = ?auto_18042 ?auto_18044 ) ) ( not ( = ?auto_18042 ?auto_18045 ) ) ( not ( = ?auto_18042 ?auto_18046 ) ) ( not ( = ?auto_18042 ?auto_18047 ) ) ( not ( = ?auto_18043 ?auto_18044 ) ) ( not ( = ?auto_18043 ?auto_18045 ) ) ( not ( = ?auto_18043 ?auto_18046 ) ) ( not ( = ?auto_18043 ?auto_18047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18044 ?auto_18045 ?auto_18046 )
      ( MAKE-4CRATE-VERIFY ?auto_18042 ?auto_18043 ?auto_18044 ?auto_18045 ?auto_18046 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18053 - SURFACE
      ?auto_18054 - SURFACE
      ?auto_18055 - SURFACE
      ?auto_18056 - SURFACE
      ?auto_18057 - SURFACE
      ?auto_18058 - SURFACE
    )
    :vars
    (
      ?auto_18062 - HOIST
      ?auto_18063 - PLACE
      ?auto_18064 - PLACE
      ?auto_18061 - HOIST
      ?auto_18059 - SURFACE
      ?auto_18060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18062 ?auto_18063 ) ( IS-CRATE ?auto_18058 ) ( not ( = ?auto_18057 ?auto_18058 ) ) ( not ( = ?auto_18056 ?auto_18057 ) ) ( not ( = ?auto_18056 ?auto_18058 ) ) ( not ( = ?auto_18064 ?auto_18063 ) ) ( HOIST-AT ?auto_18061 ?auto_18064 ) ( not ( = ?auto_18062 ?auto_18061 ) ) ( AVAILABLE ?auto_18061 ) ( SURFACE-AT ?auto_18058 ?auto_18064 ) ( ON ?auto_18058 ?auto_18059 ) ( CLEAR ?auto_18058 ) ( not ( = ?auto_18057 ?auto_18059 ) ) ( not ( = ?auto_18058 ?auto_18059 ) ) ( not ( = ?auto_18056 ?auto_18059 ) ) ( TRUCK-AT ?auto_18060 ?auto_18063 ) ( SURFACE-AT ?auto_18056 ?auto_18063 ) ( CLEAR ?auto_18056 ) ( LIFTING ?auto_18062 ?auto_18057 ) ( IS-CRATE ?auto_18057 ) ( ON ?auto_18054 ?auto_18053 ) ( ON ?auto_18055 ?auto_18054 ) ( ON ?auto_18056 ?auto_18055 ) ( not ( = ?auto_18053 ?auto_18054 ) ) ( not ( = ?auto_18053 ?auto_18055 ) ) ( not ( = ?auto_18053 ?auto_18056 ) ) ( not ( = ?auto_18053 ?auto_18057 ) ) ( not ( = ?auto_18053 ?auto_18058 ) ) ( not ( = ?auto_18053 ?auto_18059 ) ) ( not ( = ?auto_18054 ?auto_18055 ) ) ( not ( = ?auto_18054 ?auto_18056 ) ) ( not ( = ?auto_18054 ?auto_18057 ) ) ( not ( = ?auto_18054 ?auto_18058 ) ) ( not ( = ?auto_18054 ?auto_18059 ) ) ( not ( = ?auto_18055 ?auto_18056 ) ) ( not ( = ?auto_18055 ?auto_18057 ) ) ( not ( = ?auto_18055 ?auto_18058 ) ) ( not ( = ?auto_18055 ?auto_18059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18056 ?auto_18057 ?auto_18058 )
      ( MAKE-5CRATE-VERIFY ?auto_18053 ?auto_18054 ?auto_18055 ?auto_18056 ?auto_18057 ?auto_18058 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18065 - SURFACE
      ?auto_18066 - SURFACE
    )
    :vars
    (
      ?auto_18070 - HOIST
      ?auto_18071 - PLACE
      ?auto_18073 - SURFACE
      ?auto_18072 - PLACE
      ?auto_18069 - HOIST
      ?auto_18067 - SURFACE
      ?auto_18068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18070 ?auto_18071 ) ( IS-CRATE ?auto_18066 ) ( not ( = ?auto_18065 ?auto_18066 ) ) ( not ( = ?auto_18073 ?auto_18065 ) ) ( not ( = ?auto_18073 ?auto_18066 ) ) ( not ( = ?auto_18072 ?auto_18071 ) ) ( HOIST-AT ?auto_18069 ?auto_18072 ) ( not ( = ?auto_18070 ?auto_18069 ) ) ( AVAILABLE ?auto_18069 ) ( SURFACE-AT ?auto_18066 ?auto_18072 ) ( ON ?auto_18066 ?auto_18067 ) ( CLEAR ?auto_18066 ) ( not ( = ?auto_18065 ?auto_18067 ) ) ( not ( = ?auto_18066 ?auto_18067 ) ) ( not ( = ?auto_18073 ?auto_18067 ) ) ( TRUCK-AT ?auto_18068 ?auto_18071 ) ( SURFACE-AT ?auto_18073 ?auto_18071 ) ( CLEAR ?auto_18073 ) ( IS-CRATE ?auto_18065 ) ( AVAILABLE ?auto_18070 ) ( IN ?auto_18065 ?auto_18068 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18070 ?auto_18065 ?auto_18068 ?auto_18071 )
      ( MAKE-2CRATE ?auto_18073 ?auto_18065 ?auto_18066 )
      ( MAKE-1CRATE-VERIFY ?auto_18065 ?auto_18066 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18074 - SURFACE
      ?auto_18075 - SURFACE
      ?auto_18076 - SURFACE
    )
    :vars
    (
      ?auto_18079 - HOIST
      ?auto_18078 - PLACE
      ?auto_18082 - PLACE
      ?auto_18081 - HOIST
      ?auto_18080 - SURFACE
      ?auto_18077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18079 ?auto_18078 ) ( IS-CRATE ?auto_18076 ) ( not ( = ?auto_18075 ?auto_18076 ) ) ( not ( = ?auto_18074 ?auto_18075 ) ) ( not ( = ?auto_18074 ?auto_18076 ) ) ( not ( = ?auto_18082 ?auto_18078 ) ) ( HOIST-AT ?auto_18081 ?auto_18082 ) ( not ( = ?auto_18079 ?auto_18081 ) ) ( AVAILABLE ?auto_18081 ) ( SURFACE-AT ?auto_18076 ?auto_18082 ) ( ON ?auto_18076 ?auto_18080 ) ( CLEAR ?auto_18076 ) ( not ( = ?auto_18075 ?auto_18080 ) ) ( not ( = ?auto_18076 ?auto_18080 ) ) ( not ( = ?auto_18074 ?auto_18080 ) ) ( TRUCK-AT ?auto_18077 ?auto_18078 ) ( SURFACE-AT ?auto_18074 ?auto_18078 ) ( CLEAR ?auto_18074 ) ( IS-CRATE ?auto_18075 ) ( AVAILABLE ?auto_18079 ) ( IN ?auto_18075 ?auto_18077 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18075 ?auto_18076 )
      ( MAKE-2CRATE-VERIFY ?auto_18074 ?auto_18075 ?auto_18076 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18083 - SURFACE
      ?auto_18084 - SURFACE
      ?auto_18085 - SURFACE
      ?auto_18086 - SURFACE
    )
    :vars
    (
      ?auto_18089 - HOIST
      ?auto_18092 - PLACE
      ?auto_18088 - PLACE
      ?auto_18090 - HOIST
      ?auto_18091 - SURFACE
      ?auto_18087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18089 ?auto_18092 ) ( IS-CRATE ?auto_18086 ) ( not ( = ?auto_18085 ?auto_18086 ) ) ( not ( = ?auto_18084 ?auto_18085 ) ) ( not ( = ?auto_18084 ?auto_18086 ) ) ( not ( = ?auto_18088 ?auto_18092 ) ) ( HOIST-AT ?auto_18090 ?auto_18088 ) ( not ( = ?auto_18089 ?auto_18090 ) ) ( AVAILABLE ?auto_18090 ) ( SURFACE-AT ?auto_18086 ?auto_18088 ) ( ON ?auto_18086 ?auto_18091 ) ( CLEAR ?auto_18086 ) ( not ( = ?auto_18085 ?auto_18091 ) ) ( not ( = ?auto_18086 ?auto_18091 ) ) ( not ( = ?auto_18084 ?auto_18091 ) ) ( TRUCK-AT ?auto_18087 ?auto_18092 ) ( SURFACE-AT ?auto_18084 ?auto_18092 ) ( CLEAR ?auto_18084 ) ( IS-CRATE ?auto_18085 ) ( AVAILABLE ?auto_18089 ) ( IN ?auto_18085 ?auto_18087 ) ( ON ?auto_18084 ?auto_18083 ) ( not ( = ?auto_18083 ?auto_18084 ) ) ( not ( = ?auto_18083 ?auto_18085 ) ) ( not ( = ?auto_18083 ?auto_18086 ) ) ( not ( = ?auto_18083 ?auto_18091 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18084 ?auto_18085 ?auto_18086 )
      ( MAKE-3CRATE-VERIFY ?auto_18083 ?auto_18084 ?auto_18085 ?auto_18086 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18093 - SURFACE
      ?auto_18094 - SURFACE
      ?auto_18095 - SURFACE
      ?auto_18096 - SURFACE
      ?auto_18097 - SURFACE
    )
    :vars
    (
      ?auto_18100 - HOIST
      ?auto_18103 - PLACE
      ?auto_18099 - PLACE
      ?auto_18101 - HOIST
      ?auto_18102 - SURFACE
      ?auto_18098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18100 ?auto_18103 ) ( IS-CRATE ?auto_18097 ) ( not ( = ?auto_18096 ?auto_18097 ) ) ( not ( = ?auto_18095 ?auto_18096 ) ) ( not ( = ?auto_18095 ?auto_18097 ) ) ( not ( = ?auto_18099 ?auto_18103 ) ) ( HOIST-AT ?auto_18101 ?auto_18099 ) ( not ( = ?auto_18100 ?auto_18101 ) ) ( AVAILABLE ?auto_18101 ) ( SURFACE-AT ?auto_18097 ?auto_18099 ) ( ON ?auto_18097 ?auto_18102 ) ( CLEAR ?auto_18097 ) ( not ( = ?auto_18096 ?auto_18102 ) ) ( not ( = ?auto_18097 ?auto_18102 ) ) ( not ( = ?auto_18095 ?auto_18102 ) ) ( TRUCK-AT ?auto_18098 ?auto_18103 ) ( SURFACE-AT ?auto_18095 ?auto_18103 ) ( CLEAR ?auto_18095 ) ( IS-CRATE ?auto_18096 ) ( AVAILABLE ?auto_18100 ) ( IN ?auto_18096 ?auto_18098 ) ( ON ?auto_18094 ?auto_18093 ) ( ON ?auto_18095 ?auto_18094 ) ( not ( = ?auto_18093 ?auto_18094 ) ) ( not ( = ?auto_18093 ?auto_18095 ) ) ( not ( = ?auto_18093 ?auto_18096 ) ) ( not ( = ?auto_18093 ?auto_18097 ) ) ( not ( = ?auto_18093 ?auto_18102 ) ) ( not ( = ?auto_18094 ?auto_18095 ) ) ( not ( = ?auto_18094 ?auto_18096 ) ) ( not ( = ?auto_18094 ?auto_18097 ) ) ( not ( = ?auto_18094 ?auto_18102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18095 ?auto_18096 ?auto_18097 )
      ( MAKE-4CRATE-VERIFY ?auto_18093 ?auto_18094 ?auto_18095 ?auto_18096 ?auto_18097 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18104 - SURFACE
      ?auto_18105 - SURFACE
      ?auto_18106 - SURFACE
      ?auto_18107 - SURFACE
      ?auto_18108 - SURFACE
      ?auto_18109 - SURFACE
    )
    :vars
    (
      ?auto_18112 - HOIST
      ?auto_18115 - PLACE
      ?auto_18111 - PLACE
      ?auto_18113 - HOIST
      ?auto_18114 - SURFACE
      ?auto_18110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18112 ?auto_18115 ) ( IS-CRATE ?auto_18109 ) ( not ( = ?auto_18108 ?auto_18109 ) ) ( not ( = ?auto_18107 ?auto_18108 ) ) ( not ( = ?auto_18107 ?auto_18109 ) ) ( not ( = ?auto_18111 ?auto_18115 ) ) ( HOIST-AT ?auto_18113 ?auto_18111 ) ( not ( = ?auto_18112 ?auto_18113 ) ) ( AVAILABLE ?auto_18113 ) ( SURFACE-AT ?auto_18109 ?auto_18111 ) ( ON ?auto_18109 ?auto_18114 ) ( CLEAR ?auto_18109 ) ( not ( = ?auto_18108 ?auto_18114 ) ) ( not ( = ?auto_18109 ?auto_18114 ) ) ( not ( = ?auto_18107 ?auto_18114 ) ) ( TRUCK-AT ?auto_18110 ?auto_18115 ) ( SURFACE-AT ?auto_18107 ?auto_18115 ) ( CLEAR ?auto_18107 ) ( IS-CRATE ?auto_18108 ) ( AVAILABLE ?auto_18112 ) ( IN ?auto_18108 ?auto_18110 ) ( ON ?auto_18105 ?auto_18104 ) ( ON ?auto_18106 ?auto_18105 ) ( ON ?auto_18107 ?auto_18106 ) ( not ( = ?auto_18104 ?auto_18105 ) ) ( not ( = ?auto_18104 ?auto_18106 ) ) ( not ( = ?auto_18104 ?auto_18107 ) ) ( not ( = ?auto_18104 ?auto_18108 ) ) ( not ( = ?auto_18104 ?auto_18109 ) ) ( not ( = ?auto_18104 ?auto_18114 ) ) ( not ( = ?auto_18105 ?auto_18106 ) ) ( not ( = ?auto_18105 ?auto_18107 ) ) ( not ( = ?auto_18105 ?auto_18108 ) ) ( not ( = ?auto_18105 ?auto_18109 ) ) ( not ( = ?auto_18105 ?auto_18114 ) ) ( not ( = ?auto_18106 ?auto_18107 ) ) ( not ( = ?auto_18106 ?auto_18108 ) ) ( not ( = ?auto_18106 ?auto_18109 ) ) ( not ( = ?auto_18106 ?auto_18114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18107 ?auto_18108 ?auto_18109 )
      ( MAKE-5CRATE-VERIFY ?auto_18104 ?auto_18105 ?auto_18106 ?auto_18107 ?auto_18108 ?auto_18109 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18116 - SURFACE
      ?auto_18117 - SURFACE
    )
    :vars
    (
      ?auto_18120 - HOIST
      ?auto_18123 - PLACE
      ?auto_18124 - SURFACE
      ?auto_18119 - PLACE
      ?auto_18121 - HOIST
      ?auto_18122 - SURFACE
      ?auto_18118 - TRUCK
      ?auto_18125 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18120 ?auto_18123 ) ( IS-CRATE ?auto_18117 ) ( not ( = ?auto_18116 ?auto_18117 ) ) ( not ( = ?auto_18124 ?auto_18116 ) ) ( not ( = ?auto_18124 ?auto_18117 ) ) ( not ( = ?auto_18119 ?auto_18123 ) ) ( HOIST-AT ?auto_18121 ?auto_18119 ) ( not ( = ?auto_18120 ?auto_18121 ) ) ( AVAILABLE ?auto_18121 ) ( SURFACE-AT ?auto_18117 ?auto_18119 ) ( ON ?auto_18117 ?auto_18122 ) ( CLEAR ?auto_18117 ) ( not ( = ?auto_18116 ?auto_18122 ) ) ( not ( = ?auto_18117 ?auto_18122 ) ) ( not ( = ?auto_18124 ?auto_18122 ) ) ( SURFACE-AT ?auto_18124 ?auto_18123 ) ( CLEAR ?auto_18124 ) ( IS-CRATE ?auto_18116 ) ( AVAILABLE ?auto_18120 ) ( IN ?auto_18116 ?auto_18118 ) ( TRUCK-AT ?auto_18118 ?auto_18125 ) ( not ( = ?auto_18125 ?auto_18123 ) ) ( not ( = ?auto_18119 ?auto_18125 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18118 ?auto_18125 ?auto_18123 )
      ( MAKE-2CRATE ?auto_18124 ?auto_18116 ?auto_18117 )
      ( MAKE-1CRATE-VERIFY ?auto_18116 ?auto_18117 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18126 - SURFACE
      ?auto_18127 - SURFACE
      ?auto_18128 - SURFACE
    )
    :vars
    (
      ?auto_18130 - HOIST
      ?auto_18129 - PLACE
      ?auto_18134 - PLACE
      ?auto_18131 - HOIST
      ?auto_18132 - SURFACE
      ?auto_18135 - TRUCK
      ?auto_18133 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18130 ?auto_18129 ) ( IS-CRATE ?auto_18128 ) ( not ( = ?auto_18127 ?auto_18128 ) ) ( not ( = ?auto_18126 ?auto_18127 ) ) ( not ( = ?auto_18126 ?auto_18128 ) ) ( not ( = ?auto_18134 ?auto_18129 ) ) ( HOIST-AT ?auto_18131 ?auto_18134 ) ( not ( = ?auto_18130 ?auto_18131 ) ) ( AVAILABLE ?auto_18131 ) ( SURFACE-AT ?auto_18128 ?auto_18134 ) ( ON ?auto_18128 ?auto_18132 ) ( CLEAR ?auto_18128 ) ( not ( = ?auto_18127 ?auto_18132 ) ) ( not ( = ?auto_18128 ?auto_18132 ) ) ( not ( = ?auto_18126 ?auto_18132 ) ) ( SURFACE-AT ?auto_18126 ?auto_18129 ) ( CLEAR ?auto_18126 ) ( IS-CRATE ?auto_18127 ) ( AVAILABLE ?auto_18130 ) ( IN ?auto_18127 ?auto_18135 ) ( TRUCK-AT ?auto_18135 ?auto_18133 ) ( not ( = ?auto_18133 ?auto_18129 ) ) ( not ( = ?auto_18134 ?auto_18133 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18127 ?auto_18128 )
      ( MAKE-2CRATE-VERIFY ?auto_18126 ?auto_18127 ?auto_18128 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18136 - SURFACE
      ?auto_18137 - SURFACE
      ?auto_18138 - SURFACE
      ?auto_18139 - SURFACE
    )
    :vars
    (
      ?auto_18146 - HOIST
      ?auto_18140 - PLACE
      ?auto_18143 - PLACE
      ?auto_18142 - HOIST
      ?auto_18141 - SURFACE
      ?auto_18144 - TRUCK
      ?auto_18145 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18146 ?auto_18140 ) ( IS-CRATE ?auto_18139 ) ( not ( = ?auto_18138 ?auto_18139 ) ) ( not ( = ?auto_18137 ?auto_18138 ) ) ( not ( = ?auto_18137 ?auto_18139 ) ) ( not ( = ?auto_18143 ?auto_18140 ) ) ( HOIST-AT ?auto_18142 ?auto_18143 ) ( not ( = ?auto_18146 ?auto_18142 ) ) ( AVAILABLE ?auto_18142 ) ( SURFACE-AT ?auto_18139 ?auto_18143 ) ( ON ?auto_18139 ?auto_18141 ) ( CLEAR ?auto_18139 ) ( not ( = ?auto_18138 ?auto_18141 ) ) ( not ( = ?auto_18139 ?auto_18141 ) ) ( not ( = ?auto_18137 ?auto_18141 ) ) ( SURFACE-AT ?auto_18137 ?auto_18140 ) ( CLEAR ?auto_18137 ) ( IS-CRATE ?auto_18138 ) ( AVAILABLE ?auto_18146 ) ( IN ?auto_18138 ?auto_18144 ) ( TRUCK-AT ?auto_18144 ?auto_18145 ) ( not ( = ?auto_18145 ?auto_18140 ) ) ( not ( = ?auto_18143 ?auto_18145 ) ) ( ON ?auto_18137 ?auto_18136 ) ( not ( = ?auto_18136 ?auto_18137 ) ) ( not ( = ?auto_18136 ?auto_18138 ) ) ( not ( = ?auto_18136 ?auto_18139 ) ) ( not ( = ?auto_18136 ?auto_18141 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18137 ?auto_18138 ?auto_18139 )
      ( MAKE-3CRATE-VERIFY ?auto_18136 ?auto_18137 ?auto_18138 ?auto_18139 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18147 - SURFACE
      ?auto_18148 - SURFACE
      ?auto_18149 - SURFACE
      ?auto_18150 - SURFACE
      ?auto_18151 - SURFACE
    )
    :vars
    (
      ?auto_18158 - HOIST
      ?auto_18152 - PLACE
      ?auto_18155 - PLACE
      ?auto_18154 - HOIST
      ?auto_18153 - SURFACE
      ?auto_18156 - TRUCK
      ?auto_18157 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18158 ?auto_18152 ) ( IS-CRATE ?auto_18151 ) ( not ( = ?auto_18150 ?auto_18151 ) ) ( not ( = ?auto_18149 ?auto_18150 ) ) ( not ( = ?auto_18149 ?auto_18151 ) ) ( not ( = ?auto_18155 ?auto_18152 ) ) ( HOIST-AT ?auto_18154 ?auto_18155 ) ( not ( = ?auto_18158 ?auto_18154 ) ) ( AVAILABLE ?auto_18154 ) ( SURFACE-AT ?auto_18151 ?auto_18155 ) ( ON ?auto_18151 ?auto_18153 ) ( CLEAR ?auto_18151 ) ( not ( = ?auto_18150 ?auto_18153 ) ) ( not ( = ?auto_18151 ?auto_18153 ) ) ( not ( = ?auto_18149 ?auto_18153 ) ) ( SURFACE-AT ?auto_18149 ?auto_18152 ) ( CLEAR ?auto_18149 ) ( IS-CRATE ?auto_18150 ) ( AVAILABLE ?auto_18158 ) ( IN ?auto_18150 ?auto_18156 ) ( TRUCK-AT ?auto_18156 ?auto_18157 ) ( not ( = ?auto_18157 ?auto_18152 ) ) ( not ( = ?auto_18155 ?auto_18157 ) ) ( ON ?auto_18148 ?auto_18147 ) ( ON ?auto_18149 ?auto_18148 ) ( not ( = ?auto_18147 ?auto_18148 ) ) ( not ( = ?auto_18147 ?auto_18149 ) ) ( not ( = ?auto_18147 ?auto_18150 ) ) ( not ( = ?auto_18147 ?auto_18151 ) ) ( not ( = ?auto_18147 ?auto_18153 ) ) ( not ( = ?auto_18148 ?auto_18149 ) ) ( not ( = ?auto_18148 ?auto_18150 ) ) ( not ( = ?auto_18148 ?auto_18151 ) ) ( not ( = ?auto_18148 ?auto_18153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18149 ?auto_18150 ?auto_18151 )
      ( MAKE-4CRATE-VERIFY ?auto_18147 ?auto_18148 ?auto_18149 ?auto_18150 ?auto_18151 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18159 - SURFACE
      ?auto_18160 - SURFACE
      ?auto_18161 - SURFACE
      ?auto_18162 - SURFACE
      ?auto_18163 - SURFACE
      ?auto_18164 - SURFACE
    )
    :vars
    (
      ?auto_18171 - HOIST
      ?auto_18165 - PLACE
      ?auto_18168 - PLACE
      ?auto_18167 - HOIST
      ?auto_18166 - SURFACE
      ?auto_18169 - TRUCK
      ?auto_18170 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18171 ?auto_18165 ) ( IS-CRATE ?auto_18164 ) ( not ( = ?auto_18163 ?auto_18164 ) ) ( not ( = ?auto_18162 ?auto_18163 ) ) ( not ( = ?auto_18162 ?auto_18164 ) ) ( not ( = ?auto_18168 ?auto_18165 ) ) ( HOIST-AT ?auto_18167 ?auto_18168 ) ( not ( = ?auto_18171 ?auto_18167 ) ) ( AVAILABLE ?auto_18167 ) ( SURFACE-AT ?auto_18164 ?auto_18168 ) ( ON ?auto_18164 ?auto_18166 ) ( CLEAR ?auto_18164 ) ( not ( = ?auto_18163 ?auto_18166 ) ) ( not ( = ?auto_18164 ?auto_18166 ) ) ( not ( = ?auto_18162 ?auto_18166 ) ) ( SURFACE-AT ?auto_18162 ?auto_18165 ) ( CLEAR ?auto_18162 ) ( IS-CRATE ?auto_18163 ) ( AVAILABLE ?auto_18171 ) ( IN ?auto_18163 ?auto_18169 ) ( TRUCK-AT ?auto_18169 ?auto_18170 ) ( not ( = ?auto_18170 ?auto_18165 ) ) ( not ( = ?auto_18168 ?auto_18170 ) ) ( ON ?auto_18160 ?auto_18159 ) ( ON ?auto_18161 ?auto_18160 ) ( ON ?auto_18162 ?auto_18161 ) ( not ( = ?auto_18159 ?auto_18160 ) ) ( not ( = ?auto_18159 ?auto_18161 ) ) ( not ( = ?auto_18159 ?auto_18162 ) ) ( not ( = ?auto_18159 ?auto_18163 ) ) ( not ( = ?auto_18159 ?auto_18164 ) ) ( not ( = ?auto_18159 ?auto_18166 ) ) ( not ( = ?auto_18160 ?auto_18161 ) ) ( not ( = ?auto_18160 ?auto_18162 ) ) ( not ( = ?auto_18160 ?auto_18163 ) ) ( not ( = ?auto_18160 ?auto_18164 ) ) ( not ( = ?auto_18160 ?auto_18166 ) ) ( not ( = ?auto_18161 ?auto_18162 ) ) ( not ( = ?auto_18161 ?auto_18163 ) ) ( not ( = ?auto_18161 ?auto_18164 ) ) ( not ( = ?auto_18161 ?auto_18166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18162 ?auto_18163 ?auto_18164 )
      ( MAKE-5CRATE-VERIFY ?auto_18159 ?auto_18160 ?auto_18161 ?auto_18162 ?auto_18163 ?auto_18164 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18172 - SURFACE
      ?auto_18173 - SURFACE
    )
    :vars
    (
      ?auto_18180 - HOIST
      ?auto_18174 - PLACE
      ?auto_18181 - SURFACE
      ?auto_18177 - PLACE
      ?auto_18176 - HOIST
      ?auto_18175 - SURFACE
      ?auto_18178 - TRUCK
      ?auto_18179 - PLACE
      ?auto_18182 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18180 ?auto_18174 ) ( IS-CRATE ?auto_18173 ) ( not ( = ?auto_18172 ?auto_18173 ) ) ( not ( = ?auto_18181 ?auto_18172 ) ) ( not ( = ?auto_18181 ?auto_18173 ) ) ( not ( = ?auto_18177 ?auto_18174 ) ) ( HOIST-AT ?auto_18176 ?auto_18177 ) ( not ( = ?auto_18180 ?auto_18176 ) ) ( AVAILABLE ?auto_18176 ) ( SURFACE-AT ?auto_18173 ?auto_18177 ) ( ON ?auto_18173 ?auto_18175 ) ( CLEAR ?auto_18173 ) ( not ( = ?auto_18172 ?auto_18175 ) ) ( not ( = ?auto_18173 ?auto_18175 ) ) ( not ( = ?auto_18181 ?auto_18175 ) ) ( SURFACE-AT ?auto_18181 ?auto_18174 ) ( CLEAR ?auto_18181 ) ( IS-CRATE ?auto_18172 ) ( AVAILABLE ?auto_18180 ) ( TRUCK-AT ?auto_18178 ?auto_18179 ) ( not ( = ?auto_18179 ?auto_18174 ) ) ( not ( = ?auto_18177 ?auto_18179 ) ) ( HOIST-AT ?auto_18182 ?auto_18179 ) ( LIFTING ?auto_18182 ?auto_18172 ) ( not ( = ?auto_18180 ?auto_18182 ) ) ( not ( = ?auto_18176 ?auto_18182 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18182 ?auto_18172 ?auto_18178 ?auto_18179 )
      ( MAKE-2CRATE ?auto_18181 ?auto_18172 ?auto_18173 )
      ( MAKE-1CRATE-VERIFY ?auto_18172 ?auto_18173 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18183 - SURFACE
      ?auto_18184 - SURFACE
      ?auto_18185 - SURFACE
    )
    :vars
    (
      ?auto_18189 - HOIST
      ?auto_18188 - PLACE
      ?auto_18190 - PLACE
      ?auto_18193 - HOIST
      ?auto_18191 - SURFACE
      ?auto_18186 - TRUCK
      ?auto_18187 - PLACE
      ?auto_18192 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18189 ?auto_18188 ) ( IS-CRATE ?auto_18185 ) ( not ( = ?auto_18184 ?auto_18185 ) ) ( not ( = ?auto_18183 ?auto_18184 ) ) ( not ( = ?auto_18183 ?auto_18185 ) ) ( not ( = ?auto_18190 ?auto_18188 ) ) ( HOIST-AT ?auto_18193 ?auto_18190 ) ( not ( = ?auto_18189 ?auto_18193 ) ) ( AVAILABLE ?auto_18193 ) ( SURFACE-AT ?auto_18185 ?auto_18190 ) ( ON ?auto_18185 ?auto_18191 ) ( CLEAR ?auto_18185 ) ( not ( = ?auto_18184 ?auto_18191 ) ) ( not ( = ?auto_18185 ?auto_18191 ) ) ( not ( = ?auto_18183 ?auto_18191 ) ) ( SURFACE-AT ?auto_18183 ?auto_18188 ) ( CLEAR ?auto_18183 ) ( IS-CRATE ?auto_18184 ) ( AVAILABLE ?auto_18189 ) ( TRUCK-AT ?auto_18186 ?auto_18187 ) ( not ( = ?auto_18187 ?auto_18188 ) ) ( not ( = ?auto_18190 ?auto_18187 ) ) ( HOIST-AT ?auto_18192 ?auto_18187 ) ( LIFTING ?auto_18192 ?auto_18184 ) ( not ( = ?auto_18189 ?auto_18192 ) ) ( not ( = ?auto_18193 ?auto_18192 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18184 ?auto_18185 )
      ( MAKE-2CRATE-VERIFY ?auto_18183 ?auto_18184 ?auto_18185 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18194 - SURFACE
      ?auto_18195 - SURFACE
      ?auto_18196 - SURFACE
      ?auto_18197 - SURFACE
    )
    :vars
    (
      ?auto_18205 - HOIST
      ?auto_18202 - PLACE
      ?auto_18201 - PLACE
      ?auto_18198 - HOIST
      ?auto_18203 - SURFACE
      ?auto_18204 - TRUCK
      ?auto_18199 - PLACE
      ?auto_18200 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18205 ?auto_18202 ) ( IS-CRATE ?auto_18197 ) ( not ( = ?auto_18196 ?auto_18197 ) ) ( not ( = ?auto_18195 ?auto_18196 ) ) ( not ( = ?auto_18195 ?auto_18197 ) ) ( not ( = ?auto_18201 ?auto_18202 ) ) ( HOIST-AT ?auto_18198 ?auto_18201 ) ( not ( = ?auto_18205 ?auto_18198 ) ) ( AVAILABLE ?auto_18198 ) ( SURFACE-AT ?auto_18197 ?auto_18201 ) ( ON ?auto_18197 ?auto_18203 ) ( CLEAR ?auto_18197 ) ( not ( = ?auto_18196 ?auto_18203 ) ) ( not ( = ?auto_18197 ?auto_18203 ) ) ( not ( = ?auto_18195 ?auto_18203 ) ) ( SURFACE-AT ?auto_18195 ?auto_18202 ) ( CLEAR ?auto_18195 ) ( IS-CRATE ?auto_18196 ) ( AVAILABLE ?auto_18205 ) ( TRUCK-AT ?auto_18204 ?auto_18199 ) ( not ( = ?auto_18199 ?auto_18202 ) ) ( not ( = ?auto_18201 ?auto_18199 ) ) ( HOIST-AT ?auto_18200 ?auto_18199 ) ( LIFTING ?auto_18200 ?auto_18196 ) ( not ( = ?auto_18205 ?auto_18200 ) ) ( not ( = ?auto_18198 ?auto_18200 ) ) ( ON ?auto_18195 ?auto_18194 ) ( not ( = ?auto_18194 ?auto_18195 ) ) ( not ( = ?auto_18194 ?auto_18196 ) ) ( not ( = ?auto_18194 ?auto_18197 ) ) ( not ( = ?auto_18194 ?auto_18203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18195 ?auto_18196 ?auto_18197 )
      ( MAKE-3CRATE-VERIFY ?auto_18194 ?auto_18195 ?auto_18196 ?auto_18197 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18206 - SURFACE
      ?auto_18207 - SURFACE
      ?auto_18208 - SURFACE
      ?auto_18209 - SURFACE
      ?auto_18210 - SURFACE
    )
    :vars
    (
      ?auto_18218 - HOIST
      ?auto_18215 - PLACE
      ?auto_18214 - PLACE
      ?auto_18211 - HOIST
      ?auto_18216 - SURFACE
      ?auto_18217 - TRUCK
      ?auto_18212 - PLACE
      ?auto_18213 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18218 ?auto_18215 ) ( IS-CRATE ?auto_18210 ) ( not ( = ?auto_18209 ?auto_18210 ) ) ( not ( = ?auto_18208 ?auto_18209 ) ) ( not ( = ?auto_18208 ?auto_18210 ) ) ( not ( = ?auto_18214 ?auto_18215 ) ) ( HOIST-AT ?auto_18211 ?auto_18214 ) ( not ( = ?auto_18218 ?auto_18211 ) ) ( AVAILABLE ?auto_18211 ) ( SURFACE-AT ?auto_18210 ?auto_18214 ) ( ON ?auto_18210 ?auto_18216 ) ( CLEAR ?auto_18210 ) ( not ( = ?auto_18209 ?auto_18216 ) ) ( not ( = ?auto_18210 ?auto_18216 ) ) ( not ( = ?auto_18208 ?auto_18216 ) ) ( SURFACE-AT ?auto_18208 ?auto_18215 ) ( CLEAR ?auto_18208 ) ( IS-CRATE ?auto_18209 ) ( AVAILABLE ?auto_18218 ) ( TRUCK-AT ?auto_18217 ?auto_18212 ) ( not ( = ?auto_18212 ?auto_18215 ) ) ( not ( = ?auto_18214 ?auto_18212 ) ) ( HOIST-AT ?auto_18213 ?auto_18212 ) ( LIFTING ?auto_18213 ?auto_18209 ) ( not ( = ?auto_18218 ?auto_18213 ) ) ( not ( = ?auto_18211 ?auto_18213 ) ) ( ON ?auto_18207 ?auto_18206 ) ( ON ?auto_18208 ?auto_18207 ) ( not ( = ?auto_18206 ?auto_18207 ) ) ( not ( = ?auto_18206 ?auto_18208 ) ) ( not ( = ?auto_18206 ?auto_18209 ) ) ( not ( = ?auto_18206 ?auto_18210 ) ) ( not ( = ?auto_18206 ?auto_18216 ) ) ( not ( = ?auto_18207 ?auto_18208 ) ) ( not ( = ?auto_18207 ?auto_18209 ) ) ( not ( = ?auto_18207 ?auto_18210 ) ) ( not ( = ?auto_18207 ?auto_18216 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18208 ?auto_18209 ?auto_18210 )
      ( MAKE-4CRATE-VERIFY ?auto_18206 ?auto_18207 ?auto_18208 ?auto_18209 ?auto_18210 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18219 - SURFACE
      ?auto_18220 - SURFACE
      ?auto_18221 - SURFACE
      ?auto_18222 - SURFACE
      ?auto_18223 - SURFACE
      ?auto_18224 - SURFACE
    )
    :vars
    (
      ?auto_18232 - HOIST
      ?auto_18229 - PLACE
      ?auto_18228 - PLACE
      ?auto_18225 - HOIST
      ?auto_18230 - SURFACE
      ?auto_18231 - TRUCK
      ?auto_18226 - PLACE
      ?auto_18227 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18232 ?auto_18229 ) ( IS-CRATE ?auto_18224 ) ( not ( = ?auto_18223 ?auto_18224 ) ) ( not ( = ?auto_18222 ?auto_18223 ) ) ( not ( = ?auto_18222 ?auto_18224 ) ) ( not ( = ?auto_18228 ?auto_18229 ) ) ( HOIST-AT ?auto_18225 ?auto_18228 ) ( not ( = ?auto_18232 ?auto_18225 ) ) ( AVAILABLE ?auto_18225 ) ( SURFACE-AT ?auto_18224 ?auto_18228 ) ( ON ?auto_18224 ?auto_18230 ) ( CLEAR ?auto_18224 ) ( not ( = ?auto_18223 ?auto_18230 ) ) ( not ( = ?auto_18224 ?auto_18230 ) ) ( not ( = ?auto_18222 ?auto_18230 ) ) ( SURFACE-AT ?auto_18222 ?auto_18229 ) ( CLEAR ?auto_18222 ) ( IS-CRATE ?auto_18223 ) ( AVAILABLE ?auto_18232 ) ( TRUCK-AT ?auto_18231 ?auto_18226 ) ( not ( = ?auto_18226 ?auto_18229 ) ) ( not ( = ?auto_18228 ?auto_18226 ) ) ( HOIST-AT ?auto_18227 ?auto_18226 ) ( LIFTING ?auto_18227 ?auto_18223 ) ( not ( = ?auto_18232 ?auto_18227 ) ) ( not ( = ?auto_18225 ?auto_18227 ) ) ( ON ?auto_18220 ?auto_18219 ) ( ON ?auto_18221 ?auto_18220 ) ( ON ?auto_18222 ?auto_18221 ) ( not ( = ?auto_18219 ?auto_18220 ) ) ( not ( = ?auto_18219 ?auto_18221 ) ) ( not ( = ?auto_18219 ?auto_18222 ) ) ( not ( = ?auto_18219 ?auto_18223 ) ) ( not ( = ?auto_18219 ?auto_18224 ) ) ( not ( = ?auto_18219 ?auto_18230 ) ) ( not ( = ?auto_18220 ?auto_18221 ) ) ( not ( = ?auto_18220 ?auto_18222 ) ) ( not ( = ?auto_18220 ?auto_18223 ) ) ( not ( = ?auto_18220 ?auto_18224 ) ) ( not ( = ?auto_18220 ?auto_18230 ) ) ( not ( = ?auto_18221 ?auto_18222 ) ) ( not ( = ?auto_18221 ?auto_18223 ) ) ( not ( = ?auto_18221 ?auto_18224 ) ) ( not ( = ?auto_18221 ?auto_18230 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18222 ?auto_18223 ?auto_18224 )
      ( MAKE-5CRATE-VERIFY ?auto_18219 ?auto_18220 ?auto_18221 ?auto_18222 ?auto_18223 ?auto_18224 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18233 - SURFACE
      ?auto_18234 - SURFACE
    )
    :vars
    (
      ?auto_18242 - HOIST
      ?auto_18239 - PLACE
      ?auto_18243 - SURFACE
      ?auto_18238 - PLACE
      ?auto_18235 - HOIST
      ?auto_18240 - SURFACE
      ?auto_18241 - TRUCK
      ?auto_18236 - PLACE
      ?auto_18237 - HOIST
      ?auto_18244 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18242 ?auto_18239 ) ( IS-CRATE ?auto_18234 ) ( not ( = ?auto_18233 ?auto_18234 ) ) ( not ( = ?auto_18243 ?auto_18233 ) ) ( not ( = ?auto_18243 ?auto_18234 ) ) ( not ( = ?auto_18238 ?auto_18239 ) ) ( HOIST-AT ?auto_18235 ?auto_18238 ) ( not ( = ?auto_18242 ?auto_18235 ) ) ( AVAILABLE ?auto_18235 ) ( SURFACE-AT ?auto_18234 ?auto_18238 ) ( ON ?auto_18234 ?auto_18240 ) ( CLEAR ?auto_18234 ) ( not ( = ?auto_18233 ?auto_18240 ) ) ( not ( = ?auto_18234 ?auto_18240 ) ) ( not ( = ?auto_18243 ?auto_18240 ) ) ( SURFACE-AT ?auto_18243 ?auto_18239 ) ( CLEAR ?auto_18243 ) ( IS-CRATE ?auto_18233 ) ( AVAILABLE ?auto_18242 ) ( TRUCK-AT ?auto_18241 ?auto_18236 ) ( not ( = ?auto_18236 ?auto_18239 ) ) ( not ( = ?auto_18238 ?auto_18236 ) ) ( HOIST-AT ?auto_18237 ?auto_18236 ) ( not ( = ?auto_18242 ?auto_18237 ) ) ( not ( = ?auto_18235 ?auto_18237 ) ) ( AVAILABLE ?auto_18237 ) ( SURFACE-AT ?auto_18233 ?auto_18236 ) ( ON ?auto_18233 ?auto_18244 ) ( CLEAR ?auto_18233 ) ( not ( = ?auto_18233 ?auto_18244 ) ) ( not ( = ?auto_18234 ?auto_18244 ) ) ( not ( = ?auto_18243 ?auto_18244 ) ) ( not ( = ?auto_18240 ?auto_18244 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18237 ?auto_18233 ?auto_18244 ?auto_18236 )
      ( MAKE-2CRATE ?auto_18243 ?auto_18233 ?auto_18234 )
      ( MAKE-1CRATE-VERIFY ?auto_18233 ?auto_18234 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18245 - SURFACE
      ?auto_18246 - SURFACE
      ?auto_18247 - SURFACE
    )
    :vars
    (
      ?auto_18253 - HOIST
      ?auto_18255 - PLACE
      ?auto_18250 - PLACE
      ?auto_18252 - HOIST
      ?auto_18249 - SURFACE
      ?auto_18251 - TRUCK
      ?auto_18254 - PLACE
      ?auto_18248 - HOIST
      ?auto_18256 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18253 ?auto_18255 ) ( IS-CRATE ?auto_18247 ) ( not ( = ?auto_18246 ?auto_18247 ) ) ( not ( = ?auto_18245 ?auto_18246 ) ) ( not ( = ?auto_18245 ?auto_18247 ) ) ( not ( = ?auto_18250 ?auto_18255 ) ) ( HOIST-AT ?auto_18252 ?auto_18250 ) ( not ( = ?auto_18253 ?auto_18252 ) ) ( AVAILABLE ?auto_18252 ) ( SURFACE-AT ?auto_18247 ?auto_18250 ) ( ON ?auto_18247 ?auto_18249 ) ( CLEAR ?auto_18247 ) ( not ( = ?auto_18246 ?auto_18249 ) ) ( not ( = ?auto_18247 ?auto_18249 ) ) ( not ( = ?auto_18245 ?auto_18249 ) ) ( SURFACE-AT ?auto_18245 ?auto_18255 ) ( CLEAR ?auto_18245 ) ( IS-CRATE ?auto_18246 ) ( AVAILABLE ?auto_18253 ) ( TRUCK-AT ?auto_18251 ?auto_18254 ) ( not ( = ?auto_18254 ?auto_18255 ) ) ( not ( = ?auto_18250 ?auto_18254 ) ) ( HOIST-AT ?auto_18248 ?auto_18254 ) ( not ( = ?auto_18253 ?auto_18248 ) ) ( not ( = ?auto_18252 ?auto_18248 ) ) ( AVAILABLE ?auto_18248 ) ( SURFACE-AT ?auto_18246 ?auto_18254 ) ( ON ?auto_18246 ?auto_18256 ) ( CLEAR ?auto_18246 ) ( not ( = ?auto_18246 ?auto_18256 ) ) ( not ( = ?auto_18247 ?auto_18256 ) ) ( not ( = ?auto_18245 ?auto_18256 ) ) ( not ( = ?auto_18249 ?auto_18256 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18246 ?auto_18247 )
      ( MAKE-2CRATE-VERIFY ?auto_18245 ?auto_18246 ?auto_18247 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18257 - SURFACE
      ?auto_18258 - SURFACE
      ?auto_18259 - SURFACE
      ?auto_18260 - SURFACE
    )
    :vars
    (
      ?auto_18265 - HOIST
      ?auto_18264 - PLACE
      ?auto_18262 - PLACE
      ?auto_18268 - HOIST
      ?auto_18269 - SURFACE
      ?auto_18266 - TRUCK
      ?auto_18267 - PLACE
      ?auto_18261 - HOIST
      ?auto_18263 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18265 ?auto_18264 ) ( IS-CRATE ?auto_18260 ) ( not ( = ?auto_18259 ?auto_18260 ) ) ( not ( = ?auto_18258 ?auto_18259 ) ) ( not ( = ?auto_18258 ?auto_18260 ) ) ( not ( = ?auto_18262 ?auto_18264 ) ) ( HOIST-AT ?auto_18268 ?auto_18262 ) ( not ( = ?auto_18265 ?auto_18268 ) ) ( AVAILABLE ?auto_18268 ) ( SURFACE-AT ?auto_18260 ?auto_18262 ) ( ON ?auto_18260 ?auto_18269 ) ( CLEAR ?auto_18260 ) ( not ( = ?auto_18259 ?auto_18269 ) ) ( not ( = ?auto_18260 ?auto_18269 ) ) ( not ( = ?auto_18258 ?auto_18269 ) ) ( SURFACE-AT ?auto_18258 ?auto_18264 ) ( CLEAR ?auto_18258 ) ( IS-CRATE ?auto_18259 ) ( AVAILABLE ?auto_18265 ) ( TRUCK-AT ?auto_18266 ?auto_18267 ) ( not ( = ?auto_18267 ?auto_18264 ) ) ( not ( = ?auto_18262 ?auto_18267 ) ) ( HOIST-AT ?auto_18261 ?auto_18267 ) ( not ( = ?auto_18265 ?auto_18261 ) ) ( not ( = ?auto_18268 ?auto_18261 ) ) ( AVAILABLE ?auto_18261 ) ( SURFACE-AT ?auto_18259 ?auto_18267 ) ( ON ?auto_18259 ?auto_18263 ) ( CLEAR ?auto_18259 ) ( not ( = ?auto_18259 ?auto_18263 ) ) ( not ( = ?auto_18260 ?auto_18263 ) ) ( not ( = ?auto_18258 ?auto_18263 ) ) ( not ( = ?auto_18269 ?auto_18263 ) ) ( ON ?auto_18258 ?auto_18257 ) ( not ( = ?auto_18257 ?auto_18258 ) ) ( not ( = ?auto_18257 ?auto_18259 ) ) ( not ( = ?auto_18257 ?auto_18260 ) ) ( not ( = ?auto_18257 ?auto_18269 ) ) ( not ( = ?auto_18257 ?auto_18263 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18258 ?auto_18259 ?auto_18260 )
      ( MAKE-3CRATE-VERIFY ?auto_18257 ?auto_18258 ?auto_18259 ?auto_18260 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18270 - SURFACE
      ?auto_18271 - SURFACE
      ?auto_18272 - SURFACE
      ?auto_18273 - SURFACE
      ?auto_18274 - SURFACE
    )
    :vars
    (
      ?auto_18279 - HOIST
      ?auto_18278 - PLACE
      ?auto_18276 - PLACE
      ?auto_18282 - HOIST
      ?auto_18283 - SURFACE
      ?auto_18280 - TRUCK
      ?auto_18281 - PLACE
      ?auto_18275 - HOIST
      ?auto_18277 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18279 ?auto_18278 ) ( IS-CRATE ?auto_18274 ) ( not ( = ?auto_18273 ?auto_18274 ) ) ( not ( = ?auto_18272 ?auto_18273 ) ) ( not ( = ?auto_18272 ?auto_18274 ) ) ( not ( = ?auto_18276 ?auto_18278 ) ) ( HOIST-AT ?auto_18282 ?auto_18276 ) ( not ( = ?auto_18279 ?auto_18282 ) ) ( AVAILABLE ?auto_18282 ) ( SURFACE-AT ?auto_18274 ?auto_18276 ) ( ON ?auto_18274 ?auto_18283 ) ( CLEAR ?auto_18274 ) ( not ( = ?auto_18273 ?auto_18283 ) ) ( not ( = ?auto_18274 ?auto_18283 ) ) ( not ( = ?auto_18272 ?auto_18283 ) ) ( SURFACE-AT ?auto_18272 ?auto_18278 ) ( CLEAR ?auto_18272 ) ( IS-CRATE ?auto_18273 ) ( AVAILABLE ?auto_18279 ) ( TRUCK-AT ?auto_18280 ?auto_18281 ) ( not ( = ?auto_18281 ?auto_18278 ) ) ( not ( = ?auto_18276 ?auto_18281 ) ) ( HOIST-AT ?auto_18275 ?auto_18281 ) ( not ( = ?auto_18279 ?auto_18275 ) ) ( not ( = ?auto_18282 ?auto_18275 ) ) ( AVAILABLE ?auto_18275 ) ( SURFACE-AT ?auto_18273 ?auto_18281 ) ( ON ?auto_18273 ?auto_18277 ) ( CLEAR ?auto_18273 ) ( not ( = ?auto_18273 ?auto_18277 ) ) ( not ( = ?auto_18274 ?auto_18277 ) ) ( not ( = ?auto_18272 ?auto_18277 ) ) ( not ( = ?auto_18283 ?auto_18277 ) ) ( ON ?auto_18271 ?auto_18270 ) ( ON ?auto_18272 ?auto_18271 ) ( not ( = ?auto_18270 ?auto_18271 ) ) ( not ( = ?auto_18270 ?auto_18272 ) ) ( not ( = ?auto_18270 ?auto_18273 ) ) ( not ( = ?auto_18270 ?auto_18274 ) ) ( not ( = ?auto_18270 ?auto_18283 ) ) ( not ( = ?auto_18270 ?auto_18277 ) ) ( not ( = ?auto_18271 ?auto_18272 ) ) ( not ( = ?auto_18271 ?auto_18273 ) ) ( not ( = ?auto_18271 ?auto_18274 ) ) ( not ( = ?auto_18271 ?auto_18283 ) ) ( not ( = ?auto_18271 ?auto_18277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18272 ?auto_18273 ?auto_18274 )
      ( MAKE-4CRATE-VERIFY ?auto_18270 ?auto_18271 ?auto_18272 ?auto_18273 ?auto_18274 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18284 - SURFACE
      ?auto_18285 - SURFACE
      ?auto_18286 - SURFACE
      ?auto_18287 - SURFACE
      ?auto_18288 - SURFACE
      ?auto_18289 - SURFACE
    )
    :vars
    (
      ?auto_18294 - HOIST
      ?auto_18293 - PLACE
      ?auto_18291 - PLACE
      ?auto_18297 - HOIST
      ?auto_18298 - SURFACE
      ?auto_18295 - TRUCK
      ?auto_18296 - PLACE
      ?auto_18290 - HOIST
      ?auto_18292 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18294 ?auto_18293 ) ( IS-CRATE ?auto_18289 ) ( not ( = ?auto_18288 ?auto_18289 ) ) ( not ( = ?auto_18287 ?auto_18288 ) ) ( not ( = ?auto_18287 ?auto_18289 ) ) ( not ( = ?auto_18291 ?auto_18293 ) ) ( HOIST-AT ?auto_18297 ?auto_18291 ) ( not ( = ?auto_18294 ?auto_18297 ) ) ( AVAILABLE ?auto_18297 ) ( SURFACE-AT ?auto_18289 ?auto_18291 ) ( ON ?auto_18289 ?auto_18298 ) ( CLEAR ?auto_18289 ) ( not ( = ?auto_18288 ?auto_18298 ) ) ( not ( = ?auto_18289 ?auto_18298 ) ) ( not ( = ?auto_18287 ?auto_18298 ) ) ( SURFACE-AT ?auto_18287 ?auto_18293 ) ( CLEAR ?auto_18287 ) ( IS-CRATE ?auto_18288 ) ( AVAILABLE ?auto_18294 ) ( TRUCK-AT ?auto_18295 ?auto_18296 ) ( not ( = ?auto_18296 ?auto_18293 ) ) ( not ( = ?auto_18291 ?auto_18296 ) ) ( HOIST-AT ?auto_18290 ?auto_18296 ) ( not ( = ?auto_18294 ?auto_18290 ) ) ( not ( = ?auto_18297 ?auto_18290 ) ) ( AVAILABLE ?auto_18290 ) ( SURFACE-AT ?auto_18288 ?auto_18296 ) ( ON ?auto_18288 ?auto_18292 ) ( CLEAR ?auto_18288 ) ( not ( = ?auto_18288 ?auto_18292 ) ) ( not ( = ?auto_18289 ?auto_18292 ) ) ( not ( = ?auto_18287 ?auto_18292 ) ) ( not ( = ?auto_18298 ?auto_18292 ) ) ( ON ?auto_18285 ?auto_18284 ) ( ON ?auto_18286 ?auto_18285 ) ( ON ?auto_18287 ?auto_18286 ) ( not ( = ?auto_18284 ?auto_18285 ) ) ( not ( = ?auto_18284 ?auto_18286 ) ) ( not ( = ?auto_18284 ?auto_18287 ) ) ( not ( = ?auto_18284 ?auto_18288 ) ) ( not ( = ?auto_18284 ?auto_18289 ) ) ( not ( = ?auto_18284 ?auto_18298 ) ) ( not ( = ?auto_18284 ?auto_18292 ) ) ( not ( = ?auto_18285 ?auto_18286 ) ) ( not ( = ?auto_18285 ?auto_18287 ) ) ( not ( = ?auto_18285 ?auto_18288 ) ) ( not ( = ?auto_18285 ?auto_18289 ) ) ( not ( = ?auto_18285 ?auto_18298 ) ) ( not ( = ?auto_18285 ?auto_18292 ) ) ( not ( = ?auto_18286 ?auto_18287 ) ) ( not ( = ?auto_18286 ?auto_18288 ) ) ( not ( = ?auto_18286 ?auto_18289 ) ) ( not ( = ?auto_18286 ?auto_18298 ) ) ( not ( = ?auto_18286 ?auto_18292 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18287 ?auto_18288 ?auto_18289 )
      ( MAKE-5CRATE-VERIFY ?auto_18284 ?auto_18285 ?auto_18286 ?auto_18287 ?auto_18288 ?auto_18289 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18299 - SURFACE
      ?auto_18300 - SURFACE
    )
    :vars
    (
      ?auto_18305 - HOIST
      ?auto_18304 - PLACE
      ?auto_18310 - SURFACE
      ?auto_18302 - PLACE
      ?auto_18308 - HOIST
      ?auto_18309 - SURFACE
      ?auto_18307 - PLACE
      ?auto_18301 - HOIST
      ?auto_18303 - SURFACE
      ?auto_18306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18305 ?auto_18304 ) ( IS-CRATE ?auto_18300 ) ( not ( = ?auto_18299 ?auto_18300 ) ) ( not ( = ?auto_18310 ?auto_18299 ) ) ( not ( = ?auto_18310 ?auto_18300 ) ) ( not ( = ?auto_18302 ?auto_18304 ) ) ( HOIST-AT ?auto_18308 ?auto_18302 ) ( not ( = ?auto_18305 ?auto_18308 ) ) ( AVAILABLE ?auto_18308 ) ( SURFACE-AT ?auto_18300 ?auto_18302 ) ( ON ?auto_18300 ?auto_18309 ) ( CLEAR ?auto_18300 ) ( not ( = ?auto_18299 ?auto_18309 ) ) ( not ( = ?auto_18300 ?auto_18309 ) ) ( not ( = ?auto_18310 ?auto_18309 ) ) ( SURFACE-AT ?auto_18310 ?auto_18304 ) ( CLEAR ?auto_18310 ) ( IS-CRATE ?auto_18299 ) ( AVAILABLE ?auto_18305 ) ( not ( = ?auto_18307 ?auto_18304 ) ) ( not ( = ?auto_18302 ?auto_18307 ) ) ( HOIST-AT ?auto_18301 ?auto_18307 ) ( not ( = ?auto_18305 ?auto_18301 ) ) ( not ( = ?auto_18308 ?auto_18301 ) ) ( AVAILABLE ?auto_18301 ) ( SURFACE-AT ?auto_18299 ?auto_18307 ) ( ON ?auto_18299 ?auto_18303 ) ( CLEAR ?auto_18299 ) ( not ( = ?auto_18299 ?auto_18303 ) ) ( not ( = ?auto_18300 ?auto_18303 ) ) ( not ( = ?auto_18310 ?auto_18303 ) ) ( not ( = ?auto_18309 ?auto_18303 ) ) ( TRUCK-AT ?auto_18306 ?auto_18304 ) )
    :subtasks
    ( ( !DRIVE ?auto_18306 ?auto_18304 ?auto_18307 )
      ( MAKE-2CRATE ?auto_18310 ?auto_18299 ?auto_18300 )
      ( MAKE-1CRATE-VERIFY ?auto_18299 ?auto_18300 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18311 - SURFACE
      ?auto_18312 - SURFACE
      ?auto_18313 - SURFACE
    )
    :vars
    (
      ?auto_18321 - HOIST
      ?auto_18316 - PLACE
      ?auto_18319 - PLACE
      ?auto_18318 - HOIST
      ?auto_18320 - SURFACE
      ?auto_18317 - PLACE
      ?auto_18314 - HOIST
      ?auto_18315 - SURFACE
      ?auto_18322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18321 ?auto_18316 ) ( IS-CRATE ?auto_18313 ) ( not ( = ?auto_18312 ?auto_18313 ) ) ( not ( = ?auto_18311 ?auto_18312 ) ) ( not ( = ?auto_18311 ?auto_18313 ) ) ( not ( = ?auto_18319 ?auto_18316 ) ) ( HOIST-AT ?auto_18318 ?auto_18319 ) ( not ( = ?auto_18321 ?auto_18318 ) ) ( AVAILABLE ?auto_18318 ) ( SURFACE-AT ?auto_18313 ?auto_18319 ) ( ON ?auto_18313 ?auto_18320 ) ( CLEAR ?auto_18313 ) ( not ( = ?auto_18312 ?auto_18320 ) ) ( not ( = ?auto_18313 ?auto_18320 ) ) ( not ( = ?auto_18311 ?auto_18320 ) ) ( SURFACE-AT ?auto_18311 ?auto_18316 ) ( CLEAR ?auto_18311 ) ( IS-CRATE ?auto_18312 ) ( AVAILABLE ?auto_18321 ) ( not ( = ?auto_18317 ?auto_18316 ) ) ( not ( = ?auto_18319 ?auto_18317 ) ) ( HOIST-AT ?auto_18314 ?auto_18317 ) ( not ( = ?auto_18321 ?auto_18314 ) ) ( not ( = ?auto_18318 ?auto_18314 ) ) ( AVAILABLE ?auto_18314 ) ( SURFACE-AT ?auto_18312 ?auto_18317 ) ( ON ?auto_18312 ?auto_18315 ) ( CLEAR ?auto_18312 ) ( not ( = ?auto_18312 ?auto_18315 ) ) ( not ( = ?auto_18313 ?auto_18315 ) ) ( not ( = ?auto_18311 ?auto_18315 ) ) ( not ( = ?auto_18320 ?auto_18315 ) ) ( TRUCK-AT ?auto_18322 ?auto_18316 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18312 ?auto_18313 )
      ( MAKE-2CRATE-VERIFY ?auto_18311 ?auto_18312 ?auto_18313 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18323 - SURFACE
      ?auto_18324 - SURFACE
      ?auto_18325 - SURFACE
      ?auto_18326 - SURFACE
    )
    :vars
    (
      ?auto_18333 - HOIST
      ?auto_18332 - PLACE
      ?auto_18335 - PLACE
      ?auto_18331 - HOIST
      ?auto_18330 - SURFACE
      ?auto_18328 - PLACE
      ?auto_18327 - HOIST
      ?auto_18329 - SURFACE
      ?auto_18334 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18333 ?auto_18332 ) ( IS-CRATE ?auto_18326 ) ( not ( = ?auto_18325 ?auto_18326 ) ) ( not ( = ?auto_18324 ?auto_18325 ) ) ( not ( = ?auto_18324 ?auto_18326 ) ) ( not ( = ?auto_18335 ?auto_18332 ) ) ( HOIST-AT ?auto_18331 ?auto_18335 ) ( not ( = ?auto_18333 ?auto_18331 ) ) ( AVAILABLE ?auto_18331 ) ( SURFACE-AT ?auto_18326 ?auto_18335 ) ( ON ?auto_18326 ?auto_18330 ) ( CLEAR ?auto_18326 ) ( not ( = ?auto_18325 ?auto_18330 ) ) ( not ( = ?auto_18326 ?auto_18330 ) ) ( not ( = ?auto_18324 ?auto_18330 ) ) ( SURFACE-AT ?auto_18324 ?auto_18332 ) ( CLEAR ?auto_18324 ) ( IS-CRATE ?auto_18325 ) ( AVAILABLE ?auto_18333 ) ( not ( = ?auto_18328 ?auto_18332 ) ) ( not ( = ?auto_18335 ?auto_18328 ) ) ( HOIST-AT ?auto_18327 ?auto_18328 ) ( not ( = ?auto_18333 ?auto_18327 ) ) ( not ( = ?auto_18331 ?auto_18327 ) ) ( AVAILABLE ?auto_18327 ) ( SURFACE-AT ?auto_18325 ?auto_18328 ) ( ON ?auto_18325 ?auto_18329 ) ( CLEAR ?auto_18325 ) ( not ( = ?auto_18325 ?auto_18329 ) ) ( not ( = ?auto_18326 ?auto_18329 ) ) ( not ( = ?auto_18324 ?auto_18329 ) ) ( not ( = ?auto_18330 ?auto_18329 ) ) ( TRUCK-AT ?auto_18334 ?auto_18332 ) ( ON ?auto_18324 ?auto_18323 ) ( not ( = ?auto_18323 ?auto_18324 ) ) ( not ( = ?auto_18323 ?auto_18325 ) ) ( not ( = ?auto_18323 ?auto_18326 ) ) ( not ( = ?auto_18323 ?auto_18330 ) ) ( not ( = ?auto_18323 ?auto_18329 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18324 ?auto_18325 ?auto_18326 )
      ( MAKE-3CRATE-VERIFY ?auto_18323 ?auto_18324 ?auto_18325 ?auto_18326 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18336 - SURFACE
      ?auto_18337 - SURFACE
      ?auto_18338 - SURFACE
      ?auto_18339 - SURFACE
      ?auto_18340 - SURFACE
    )
    :vars
    (
      ?auto_18347 - HOIST
      ?auto_18346 - PLACE
      ?auto_18349 - PLACE
      ?auto_18345 - HOIST
      ?auto_18344 - SURFACE
      ?auto_18342 - PLACE
      ?auto_18341 - HOIST
      ?auto_18343 - SURFACE
      ?auto_18348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18347 ?auto_18346 ) ( IS-CRATE ?auto_18340 ) ( not ( = ?auto_18339 ?auto_18340 ) ) ( not ( = ?auto_18338 ?auto_18339 ) ) ( not ( = ?auto_18338 ?auto_18340 ) ) ( not ( = ?auto_18349 ?auto_18346 ) ) ( HOIST-AT ?auto_18345 ?auto_18349 ) ( not ( = ?auto_18347 ?auto_18345 ) ) ( AVAILABLE ?auto_18345 ) ( SURFACE-AT ?auto_18340 ?auto_18349 ) ( ON ?auto_18340 ?auto_18344 ) ( CLEAR ?auto_18340 ) ( not ( = ?auto_18339 ?auto_18344 ) ) ( not ( = ?auto_18340 ?auto_18344 ) ) ( not ( = ?auto_18338 ?auto_18344 ) ) ( SURFACE-AT ?auto_18338 ?auto_18346 ) ( CLEAR ?auto_18338 ) ( IS-CRATE ?auto_18339 ) ( AVAILABLE ?auto_18347 ) ( not ( = ?auto_18342 ?auto_18346 ) ) ( not ( = ?auto_18349 ?auto_18342 ) ) ( HOIST-AT ?auto_18341 ?auto_18342 ) ( not ( = ?auto_18347 ?auto_18341 ) ) ( not ( = ?auto_18345 ?auto_18341 ) ) ( AVAILABLE ?auto_18341 ) ( SURFACE-AT ?auto_18339 ?auto_18342 ) ( ON ?auto_18339 ?auto_18343 ) ( CLEAR ?auto_18339 ) ( not ( = ?auto_18339 ?auto_18343 ) ) ( not ( = ?auto_18340 ?auto_18343 ) ) ( not ( = ?auto_18338 ?auto_18343 ) ) ( not ( = ?auto_18344 ?auto_18343 ) ) ( TRUCK-AT ?auto_18348 ?auto_18346 ) ( ON ?auto_18337 ?auto_18336 ) ( ON ?auto_18338 ?auto_18337 ) ( not ( = ?auto_18336 ?auto_18337 ) ) ( not ( = ?auto_18336 ?auto_18338 ) ) ( not ( = ?auto_18336 ?auto_18339 ) ) ( not ( = ?auto_18336 ?auto_18340 ) ) ( not ( = ?auto_18336 ?auto_18344 ) ) ( not ( = ?auto_18336 ?auto_18343 ) ) ( not ( = ?auto_18337 ?auto_18338 ) ) ( not ( = ?auto_18337 ?auto_18339 ) ) ( not ( = ?auto_18337 ?auto_18340 ) ) ( not ( = ?auto_18337 ?auto_18344 ) ) ( not ( = ?auto_18337 ?auto_18343 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18338 ?auto_18339 ?auto_18340 )
      ( MAKE-4CRATE-VERIFY ?auto_18336 ?auto_18337 ?auto_18338 ?auto_18339 ?auto_18340 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18350 - SURFACE
      ?auto_18351 - SURFACE
      ?auto_18352 - SURFACE
      ?auto_18353 - SURFACE
      ?auto_18354 - SURFACE
      ?auto_18355 - SURFACE
    )
    :vars
    (
      ?auto_18362 - HOIST
      ?auto_18361 - PLACE
      ?auto_18364 - PLACE
      ?auto_18360 - HOIST
      ?auto_18359 - SURFACE
      ?auto_18357 - PLACE
      ?auto_18356 - HOIST
      ?auto_18358 - SURFACE
      ?auto_18363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18362 ?auto_18361 ) ( IS-CRATE ?auto_18355 ) ( not ( = ?auto_18354 ?auto_18355 ) ) ( not ( = ?auto_18353 ?auto_18354 ) ) ( not ( = ?auto_18353 ?auto_18355 ) ) ( not ( = ?auto_18364 ?auto_18361 ) ) ( HOIST-AT ?auto_18360 ?auto_18364 ) ( not ( = ?auto_18362 ?auto_18360 ) ) ( AVAILABLE ?auto_18360 ) ( SURFACE-AT ?auto_18355 ?auto_18364 ) ( ON ?auto_18355 ?auto_18359 ) ( CLEAR ?auto_18355 ) ( not ( = ?auto_18354 ?auto_18359 ) ) ( not ( = ?auto_18355 ?auto_18359 ) ) ( not ( = ?auto_18353 ?auto_18359 ) ) ( SURFACE-AT ?auto_18353 ?auto_18361 ) ( CLEAR ?auto_18353 ) ( IS-CRATE ?auto_18354 ) ( AVAILABLE ?auto_18362 ) ( not ( = ?auto_18357 ?auto_18361 ) ) ( not ( = ?auto_18364 ?auto_18357 ) ) ( HOIST-AT ?auto_18356 ?auto_18357 ) ( not ( = ?auto_18362 ?auto_18356 ) ) ( not ( = ?auto_18360 ?auto_18356 ) ) ( AVAILABLE ?auto_18356 ) ( SURFACE-AT ?auto_18354 ?auto_18357 ) ( ON ?auto_18354 ?auto_18358 ) ( CLEAR ?auto_18354 ) ( not ( = ?auto_18354 ?auto_18358 ) ) ( not ( = ?auto_18355 ?auto_18358 ) ) ( not ( = ?auto_18353 ?auto_18358 ) ) ( not ( = ?auto_18359 ?auto_18358 ) ) ( TRUCK-AT ?auto_18363 ?auto_18361 ) ( ON ?auto_18351 ?auto_18350 ) ( ON ?auto_18352 ?auto_18351 ) ( ON ?auto_18353 ?auto_18352 ) ( not ( = ?auto_18350 ?auto_18351 ) ) ( not ( = ?auto_18350 ?auto_18352 ) ) ( not ( = ?auto_18350 ?auto_18353 ) ) ( not ( = ?auto_18350 ?auto_18354 ) ) ( not ( = ?auto_18350 ?auto_18355 ) ) ( not ( = ?auto_18350 ?auto_18359 ) ) ( not ( = ?auto_18350 ?auto_18358 ) ) ( not ( = ?auto_18351 ?auto_18352 ) ) ( not ( = ?auto_18351 ?auto_18353 ) ) ( not ( = ?auto_18351 ?auto_18354 ) ) ( not ( = ?auto_18351 ?auto_18355 ) ) ( not ( = ?auto_18351 ?auto_18359 ) ) ( not ( = ?auto_18351 ?auto_18358 ) ) ( not ( = ?auto_18352 ?auto_18353 ) ) ( not ( = ?auto_18352 ?auto_18354 ) ) ( not ( = ?auto_18352 ?auto_18355 ) ) ( not ( = ?auto_18352 ?auto_18359 ) ) ( not ( = ?auto_18352 ?auto_18358 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18353 ?auto_18354 ?auto_18355 )
      ( MAKE-5CRATE-VERIFY ?auto_18350 ?auto_18351 ?auto_18352 ?auto_18353 ?auto_18354 ?auto_18355 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18365 - SURFACE
      ?auto_18366 - SURFACE
    )
    :vars
    (
      ?auto_18373 - HOIST
      ?auto_18372 - PLACE
      ?auto_18376 - SURFACE
      ?auto_18375 - PLACE
      ?auto_18371 - HOIST
      ?auto_18370 - SURFACE
      ?auto_18368 - PLACE
      ?auto_18367 - HOIST
      ?auto_18369 - SURFACE
      ?auto_18374 - TRUCK
      ?auto_18377 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18373 ?auto_18372 ) ( IS-CRATE ?auto_18366 ) ( not ( = ?auto_18365 ?auto_18366 ) ) ( not ( = ?auto_18376 ?auto_18365 ) ) ( not ( = ?auto_18376 ?auto_18366 ) ) ( not ( = ?auto_18375 ?auto_18372 ) ) ( HOIST-AT ?auto_18371 ?auto_18375 ) ( not ( = ?auto_18373 ?auto_18371 ) ) ( AVAILABLE ?auto_18371 ) ( SURFACE-AT ?auto_18366 ?auto_18375 ) ( ON ?auto_18366 ?auto_18370 ) ( CLEAR ?auto_18366 ) ( not ( = ?auto_18365 ?auto_18370 ) ) ( not ( = ?auto_18366 ?auto_18370 ) ) ( not ( = ?auto_18376 ?auto_18370 ) ) ( IS-CRATE ?auto_18365 ) ( not ( = ?auto_18368 ?auto_18372 ) ) ( not ( = ?auto_18375 ?auto_18368 ) ) ( HOIST-AT ?auto_18367 ?auto_18368 ) ( not ( = ?auto_18373 ?auto_18367 ) ) ( not ( = ?auto_18371 ?auto_18367 ) ) ( AVAILABLE ?auto_18367 ) ( SURFACE-AT ?auto_18365 ?auto_18368 ) ( ON ?auto_18365 ?auto_18369 ) ( CLEAR ?auto_18365 ) ( not ( = ?auto_18365 ?auto_18369 ) ) ( not ( = ?auto_18366 ?auto_18369 ) ) ( not ( = ?auto_18376 ?auto_18369 ) ) ( not ( = ?auto_18370 ?auto_18369 ) ) ( TRUCK-AT ?auto_18374 ?auto_18372 ) ( SURFACE-AT ?auto_18377 ?auto_18372 ) ( CLEAR ?auto_18377 ) ( LIFTING ?auto_18373 ?auto_18376 ) ( IS-CRATE ?auto_18376 ) ( not ( = ?auto_18377 ?auto_18376 ) ) ( not ( = ?auto_18365 ?auto_18377 ) ) ( not ( = ?auto_18366 ?auto_18377 ) ) ( not ( = ?auto_18370 ?auto_18377 ) ) ( not ( = ?auto_18369 ?auto_18377 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18377 ?auto_18376 )
      ( MAKE-2CRATE ?auto_18376 ?auto_18365 ?auto_18366 )
      ( MAKE-1CRATE-VERIFY ?auto_18365 ?auto_18366 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18378 - SURFACE
      ?auto_18379 - SURFACE
      ?auto_18380 - SURFACE
    )
    :vars
    (
      ?auto_18385 - HOIST
      ?auto_18383 - PLACE
      ?auto_18387 - PLACE
      ?auto_18384 - HOIST
      ?auto_18382 - SURFACE
      ?auto_18388 - PLACE
      ?auto_18390 - HOIST
      ?auto_18386 - SURFACE
      ?auto_18381 - TRUCK
      ?auto_18389 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18385 ?auto_18383 ) ( IS-CRATE ?auto_18380 ) ( not ( = ?auto_18379 ?auto_18380 ) ) ( not ( = ?auto_18378 ?auto_18379 ) ) ( not ( = ?auto_18378 ?auto_18380 ) ) ( not ( = ?auto_18387 ?auto_18383 ) ) ( HOIST-AT ?auto_18384 ?auto_18387 ) ( not ( = ?auto_18385 ?auto_18384 ) ) ( AVAILABLE ?auto_18384 ) ( SURFACE-AT ?auto_18380 ?auto_18387 ) ( ON ?auto_18380 ?auto_18382 ) ( CLEAR ?auto_18380 ) ( not ( = ?auto_18379 ?auto_18382 ) ) ( not ( = ?auto_18380 ?auto_18382 ) ) ( not ( = ?auto_18378 ?auto_18382 ) ) ( IS-CRATE ?auto_18379 ) ( not ( = ?auto_18388 ?auto_18383 ) ) ( not ( = ?auto_18387 ?auto_18388 ) ) ( HOIST-AT ?auto_18390 ?auto_18388 ) ( not ( = ?auto_18385 ?auto_18390 ) ) ( not ( = ?auto_18384 ?auto_18390 ) ) ( AVAILABLE ?auto_18390 ) ( SURFACE-AT ?auto_18379 ?auto_18388 ) ( ON ?auto_18379 ?auto_18386 ) ( CLEAR ?auto_18379 ) ( not ( = ?auto_18379 ?auto_18386 ) ) ( not ( = ?auto_18380 ?auto_18386 ) ) ( not ( = ?auto_18378 ?auto_18386 ) ) ( not ( = ?auto_18382 ?auto_18386 ) ) ( TRUCK-AT ?auto_18381 ?auto_18383 ) ( SURFACE-AT ?auto_18389 ?auto_18383 ) ( CLEAR ?auto_18389 ) ( LIFTING ?auto_18385 ?auto_18378 ) ( IS-CRATE ?auto_18378 ) ( not ( = ?auto_18389 ?auto_18378 ) ) ( not ( = ?auto_18379 ?auto_18389 ) ) ( not ( = ?auto_18380 ?auto_18389 ) ) ( not ( = ?auto_18382 ?auto_18389 ) ) ( not ( = ?auto_18386 ?auto_18389 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18379 ?auto_18380 )
      ( MAKE-2CRATE-VERIFY ?auto_18378 ?auto_18379 ?auto_18380 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18391 - SURFACE
      ?auto_18392 - SURFACE
      ?auto_18393 - SURFACE
      ?auto_18394 - SURFACE
    )
    :vars
    (
      ?auto_18402 - HOIST
      ?auto_18397 - PLACE
      ?auto_18401 - PLACE
      ?auto_18395 - HOIST
      ?auto_18400 - SURFACE
      ?auto_18399 - PLACE
      ?auto_18396 - HOIST
      ?auto_18398 - SURFACE
      ?auto_18403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18402 ?auto_18397 ) ( IS-CRATE ?auto_18394 ) ( not ( = ?auto_18393 ?auto_18394 ) ) ( not ( = ?auto_18392 ?auto_18393 ) ) ( not ( = ?auto_18392 ?auto_18394 ) ) ( not ( = ?auto_18401 ?auto_18397 ) ) ( HOIST-AT ?auto_18395 ?auto_18401 ) ( not ( = ?auto_18402 ?auto_18395 ) ) ( AVAILABLE ?auto_18395 ) ( SURFACE-AT ?auto_18394 ?auto_18401 ) ( ON ?auto_18394 ?auto_18400 ) ( CLEAR ?auto_18394 ) ( not ( = ?auto_18393 ?auto_18400 ) ) ( not ( = ?auto_18394 ?auto_18400 ) ) ( not ( = ?auto_18392 ?auto_18400 ) ) ( IS-CRATE ?auto_18393 ) ( not ( = ?auto_18399 ?auto_18397 ) ) ( not ( = ?auto_18401 ?auto_18399 ) ) ( HOIST-AT ?auto_18396 ?auto_18399 ) ( not ( = ?auto_18402 ?auto_18396 ) ) ( not ( = ?auto_18395 ?auto_18396 ) ) ( AVAILABLE ?auto_18396 ) ( SURFACE-AT ?auto_18393 ?auto_18399 ) ( ON ?auto_18393 ?auto_18398 ) ( CLEAR ?auto_18393 ) ( not ( = ?auto_18393 ?auto_18398 ) ) ( not ( = ?auto_18394 ?auto_18398 ) ) ( not ( = ?auto_18392 ?auto_18398 ) ) ( not ( = ?auto_18400 ?auto_18398 ) ) ( TRUCK-AT ?auto_18403 ?auto_18397 ) ( SURFACE-AT ?auto_18391 ?auto_18397 ) ( CLEAR ?auto_18391 ) ( LIFTING ?auto_18402 ?auto_18392 ) ( IS-CRATE ?auto_18392 ) ( not ( = ?auto_18391 ?auto_18392 ) ) ( not ( = ?auto_18393 ?auto_18391 ) ) ( not ( = ?auto_18394 ?auto_18391 ) ) ( not ( = ?auto_18400 ?auto_18391 ) ) ( not ( = ?auto_18398 ?auto_18391 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18392 ?auto_18393 ?auto_18394 )
      ( MAKE-3CRATE-VERIFY ?auto_18391 ?auto_18392 ?auto_18393 ?auto_18394 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18404 - SURFACE
      ?auto_18405 - SURFACE
      ?auto_18406 - SURFACE
      ?auto_18407 - SURFACE
      ?auto_18408 - SURFACE
    )
    :vars
    (
      ?auto_18416 - HOIST
      ?auto_18411 - PLACE
      ?auto_18415 - PLACE
      ?auto_18409 - HOIST
      ?auto_18414 - SURFACE
      ?auto_18413 - PLACE
      ?auto_18410 - HOIST
      ?auto_18412 - SURFACE
      ?auto_18417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18416 ?auto_18411 ) ( IS-CRATE ?auto_18408 ) ( not ( = ?auto_18407 ?auto_18408 ) ) ( not ( = ?auto_18406 ?auto_18407 ) ) ( not ( = ?auto_18406 ?auto_18408 ) ) ( not ( = ?auto_18415 ?auto_18411 ) ) ( HOIST-AT ?auto_18409 ?auto_18415 ) ( not ( = ?auto_18416 ?auto_18409 ) ) ( AVAILABLE ?auto_18409 ) ( SURFACE-AT ?auto_18408 ?auto_18415 ) ( ON ?auto_18408 ?auto_18414 ) ( CLEAR ?auto_18408 ) ( not ( = ?auto_18407 ?auto_18414 ) ) ( not ( = ?auto_18408 ?auto_18414 ) ) ( not ( = ?auto_18406 ?auto_18414 ) ) ( IS-CRATE ?auto_18407 ) ( not ( = ?auto_18413 ?auto_18411 ) ) ( not ( = ?auto_18415 ?auto_18413 ) ) ( HOIST-AT ?auto_18410 ?auto_18413 ) ( not ( = ?auto_18416 ?auto_18410 ) ) ( not ( = ?auto_18409 ?auto_18410 ) ) ( AVAILABLE ?auto_18410 ) ( SURFACE-AT ?auto_18407 ?auto_18413 ) ( ON ?auto_18407 ?auto_18412 ) ( CLEAR ?auto_18407 ) ( not ( = ?auto_18407 ?auto_18412 ) ) ( not ( = ?auto_18408 ?auto_18412 ) ) ( not ( = ?auto_18406 ?auto_18412 ) ) ( not ( = ?auto_18414 ?auto_18412 ) ) ( TRUCK-AT ?auto_18417 ?auto_18411 ) ( SURFACE-AT ?auto_18405 ?auto_18411 ) ( CLEAR ?auto_18405 ) ( LIFTING ?auto_18416 ?auto_18406 ) ( IS-CRATE ?auto_18406 ) ( not ( = ?auto_18405 ?auto_18406 ) ) ( not ( = ?auto_18407 ?auto_18405 ) ) ( not ( = ?auto_18408 ?auto_18405 ) ) ( not ( = ?auto_18414 ?auto_18405 ) ) ( not ( = ?auto_18412 ?auto_18405 ) ) ( ON ?auto_18405 ?auto_18404 ) ( not ( = ?auto_18404 ?auto_18405 ) ) ( not ( = ?auto_18404 ?auto_18406 ) ) ( not ( = ?auto_18404 ?auto_18407 ) ) ( not ( = ?auto_18404 ?auto_18408 ) ) ( not ( = ?auto_18404 ?auto_18414 ) ) ( not ( = ?auto_18404 ?auto_18412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18406 ?auto_18407 ?auto_18408 )
      ( MAKE-4CRATE-VERIFY ?auto_18404 ?auto_18405 ?auto_18406 ?auto_18407 ?auto_18408 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18418 - SURFACE
      ?auto_18419 - SURFACE
      ?auto_18420 - SURFACE
      ?auto_18421 - SURFACE
      ?auto_18422 - SURFACE
      ?auto_18423 - SURFACE
    )
    :vars
    (
      ?auto_18431 - HOIST
      ?auto_18426 - PLACE
      ?auto_18430 - PLACE
      ?auto_18424 - HOIST
      ?auto_18429 - SURFACE
      ?auto_18428 - PLACE
      ?auto_18425 - HOIST
      ?auto_18427 - SURFACE
      ?auto_18432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18431 ?auto_18426 ) ( IS-CRATE ?auto_18423 ) ( not ( = ?auto_18422 ?auto_18423 ) ) ( not ( = ?auto_18421 ?auto_18422 ) ) ( not ( = ?auto_18421 ?auto_18423 ) ) ( not ( = ?auto_18430 ?auto_18426 ) ) ( HOIST-AT ?auto_18424 ?auto_18430 ) ( not ( = ?auto_18431 ?auto_18424 ) ) ( AVAILABLE ?auto_18424 ) ( SURFACE-AT ?auto_18423 ?auto_18430 ) ( ON ?auto_18423 ?auto_18429 ) ( CLEAR ?auto_18423 ) ( not ( = ?auto_18422 ?auto_18429 ) ) ( not ( = ?auto_18423 ?auto_18429 ) ) ( not ( = ?auto_18421 ?auto_18429 ) ) ( IS-CRATE ?auto_18422 ) ( not ( = ?auto_18428 ?auto_18426 ) ) ( not ( = ?auto_18430 ?auto_18428 ) ) ( HOIST-AT ?auto_18425 ?auto_18428 ) ( not ( = ?auto_18431 ?auto_18425 ) ) ( not ( = ?auto_18424 ?auto_18425 ) ) ( AVAILABLE ?auto_18425 ) ( SURFACE-AT ?auto_18422 ?auto_18428 ) ( ON ?auto_18422 ?auto_18427 ) ( CLEAR ?auto_18422 ) ( not ( = ?auto_18422 ?auto_18427 ) ) ( not ( = ?auto_18423 ?auto_18427 ) ) ( not ( = ?auto_18421 ?auto_18427 ) ) ( not ( = ?auto_18429 ?auto_18427 ) ) ( TRUCK-AT ?auto_18432 ?auto_18426 ) ( SURFACE-AT ?auto_18420 ?auto_18426 ) ( CLEAR ?auto_18420 ) ( LIFTING ?auto_18431 ?auto_18421 ) ( IS-CRATE ?auto_18421 ) ( not ( = ?auto_18420 ?auto_18421 ) ) ( not ( = ?auto_18422 ?auto_18420 ) ) ( not ( = ?auto_18423 ?auto_18420 ) ) ( not ( = ?auto_18429 ?auto_18420 ) ) ( not ( = ?auto_18427 ?auto_18420 ) ) ( ON ?auto_18419 ?auto_18418 ) ( ON ?auto_18420 ?auto_18419 ) ( not ( = ?auto_18418 ?auto_18419 ) ) ( not ( = ?auto_18418 ?auto_18420 ) ) ( not ( = ?auto_18418 ?auto_18421 ) ) ( not ( = ?auto_18418 ?auto_18422 ) ) ( not ( = ?auto_18418 ?auto_18423 ) ) ( not ( = ?auto_18418 ?auto_18429 ) ) ( not ( = ?auto_18418 ?auto_18427 ) ) ( not ( = ?auto_18419 ?auto_18420 ) ) ( not ( = ?auto_18419 ?auto_18421 ) ) ( not ( = ?auto_18419 ?auto_18422 ) ) ( not ( = ?auto_18419 ?auto_18423 ) ) ( not ( = ?auto_18419 ?auto_18429 ) ) ( not ( = ?auto_18419 ?auto_18427 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18421 ?auto_18422 ?auto_18423 )
      ( MAKE-5CRATE-VERIFY ?auto_18418 ?auto_18419 ?auto_18420 ?auto_18421 ?auto_18422 ?auto_18423 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18433 - SURFACE
      ?auto_18434 - SURFACE
    )
    :vars
    (
      ?auto_18443 - HOIST
      ?auto_18437 - PLACE
      ?auto_18445 - SURFACE
      ?auto_18442 - PLACE
      ?auto_18435 - HOIST
      ?auto_18441 - SURFACE
      ?auto_18439 - PLACE
      ?auto_18436 - HOIST
      ?auto_18438 - SURFACE
      ?auto_18444 - TRUCK
      ?auto_18440 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18443 ?auto_18437 ) ( IS-CRATE ?auto_18434 ) ( not ( = ?auto_18433 ?auto_18434 ) ) ( not ( = ?auto_18445 ?auto_18433 ) ) ( not ( = ?auto_18445 ?auto_18434 ) ) ( not ( = ?auto_18442 ?auto_18437 ) ) ( HOIST-AT ?auto_18435 ?auto_18442 ) ( not ( = ?auto_18443 ?auto_18435 ) ) ( AVAILABLE ?auto_18435 ) ( SURFACE-AT ?auto_18434 ?auto_18442 ) ( ON ?auto_18434 ?auto_18441 ) ( CLEAR ?auto_18434 ) ( not ( = ?auto_18433 ?auto_18441 ) ) ( not ( = ?auto_18434 ?auto_18441 ) ) ( not ( = ?auto_18445 ?auto_18441 ) ) ( IS-CRATE ?auto_18433 ) ( not ( = ?auto_18439 ?auto_18437 ) ) ( not ( = ?auto_18442 ?auto_18439 ) ) ( HOIST-AT ?auto_18436 ?auto_18439 ) ( not ( = ?auto_18443 ?auto_18436 ) ) ( not ( = ?auto_18435 ?auto_18436 ) ) ( AVAILABLE ?auto_18436 ) ( SURFACE-AT ?auto_18433 ?auto_18439 ) ( ON ?auto_18433 ?auto_18438 ) ( CLEAR ?auto_18433 ) ( not ( = ?auto_18433 ?auto_18438 ) ) ( not ( = ?auto_18434 ?auto_18438 ) ) ( not ( = ?auto_18445 ?auto_18438 ) ) ( not ( = ?auto_18441 ?auto_18438 ) ) ( TRUCK-AT ?auto_18444 ?auto_18437 ) ( SURFACE-AT ?auto_18440 ?auto_18437 ) ( CLEAR ?auto_18440 ) ( IS-CRATE ?auto_18445 ) ( not ( = ?auto_18440 ?auto_18445 ) ) ( not ( = ?auto_18433 ?auto_18440 ) ) ( not ( = ?auto_18434 ?auto_18440 ) ) ( not ( = ?auto_18441 ?auto_18440 ) ) ( not ( = ?auto_18438 ?auto_18440 ) ) ( AVAILABLE ?auto_18443 ) ( IN ?auto_18445 ?auto_18444 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18443 ?auto_18445 ?auto_18444 ?auto_18437 )
      ( MAKE-2CRATE ?auto_18445 ?auto_18433 ?auto_18434 )
      ( MAKE-1CRATE-VERIFY ?auto_18433 ?auto_18434 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18446 - SURFACE
      ?auto_18447 - SURFACE
      ?auto_18448 - SURFACE
    )
    :vars
    (
      ?auto_18454 - HOIST
      ?auto_18455 - PLACE
      ?auto_18457 - PLACE
      ?auto_18452 - HOIST
      ?auto_18451 - SURFACE
      ?auto_18449 - PLACE
      ?auto_18450 - HOIST
      ?auto_18456 - SURFACE
      ?auto_18458 - TRUCK
      ?auto_18453 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18454 ?auto_18455 ) ( IS-CRATE ?auto_18448 ) ( not ( = ?auto_18447 ?auto_18448 ) ) ( not ( = ?auto_18446 ?auto_18447 ) ) ( not ( = ?auto_18446 ?auto_18448 ) ) ( not ( = ?auto_18457 ?auto_18455 ) ) ( HOIST-AT ?auto_18452 ?auto_18457 ) ( not ( = ?auto_18454 ?auto_18452 ) ) ( AVAILABLE ?auto_18452 ) ( SURFACE-AT ?auto_18448 ?auto_18457 ) ( ON ?auto_18448 ?auto_18451 ) ( CLEAR ?auto_18448 ) ( not ( = ?auto_18447 ?auto_18451 ) ) ( not ( = ?auto_18448 ?auto_18451 ) ) ( not ( = ?auto_18446 ?auto_18451 ) ) ( IS-CRATE ?auto_18447 ) ( not ( = ?auto_18449 ?auto_18455 ) ) ( not ( = ?auto_18457 ?auto_18449 ) ) ( HOIST-AT ?auto_18450 ?auto_18449 ) ( not ( = ?auto_18454 ?auto_18450 ) ) ( not ( = ?auto_18452 ?auto_18450 ) ) ( AVAILABLE ?auto_18450 ) ( SURFACE-AT ?auto_18447 ?auto_18449 ) ( ON ?auto_18447 ?auto_18456 ) ( CLEAR ?auto_18447 ) ( not ( = ?auto_18447 ?auto_18456 ) ) ( not ( = ?auto_18448 ?auto_18456 ) ) ( not ( = ?auto_18446 ?auto_18456 ) ) ( not ( = ?auto_18451 ?auto_18456 ) ) ( TRUCK-AT ?auto_18458 ?auto_18455 ) ( SURFACE-AT ?auto_18453 ?auto_18455 ) ( CLEAR ?auto_18453 ) ( IS-CRATE ?auto_18446 ) ( not ( = ?auto_18453 ?auto_18446 ) ) ( not ( = ?auto_18447 ?auto_18453 ) ) ( not ( = ?auto_18448 ?auto_18453 ) ) ( not ( = ?auto_18451 ?auto_18453 ) ) ( not ( = ?auto_18456 ?auto_18453 ) ) ( AVAILABLE ?auto_18454 ) ( IN ?auto_18446 ?auto_18458 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18447 ?auto_18448 )
      ( MAKE-2CRATE-VERIFY ?auto_18446 ?auto_18447 ?auto_18448 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18459 - SURFACE
      ?auto_18460 - SURFACE
      ?auto_18461 - SURFACE
      ?auto_18462 - SURFACE
    )
    :vars
    (
      ?auto_18465 - HOIST
      ?auto_18464 - PLACE
      ?auto_18471 - PLACE
      ?auto_18463 - HOIST
      ?auto_18470 - SURFACE
      ?auto_18467 - PLACE
      ?auto_18468 - HOIST
      ?auto_18466 - SURFACE
      ?auto_18469 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18465 ?auto_18464 ) ( IS-CRATE ?auto_18462 ) ( not ( = ?auto_18461 ?auto_18462 ) ) ( not ( = ?auto_18460 ?auto_18461 ) ) ( not ( = ?auto_18460 ?auto_18462 ) ) ( not ( = ?auto_18471 ?auto_18464 ) ) ( HOIST-AT ?auto_18463 ?auto_18471 ) ( not ( = ?auto_18465 ?auto_18463 ) ) ( AVAILABLE ?auto_18463 ) ( SURFACE-AT ?auto_18462 ?auto_18471 ) ( ON ?auto_18462 ?auto_18470 ) ( CLEAR ?auto_18462 ) ( not ( = ?auto_18461 ?auto_18470 ) ) ( not ( = ?auto_18462 ?auto_18470 ) ) ( not ( = ?auto_18460 ?auto_18470 ) ) ( IS-CRATE ?auto_18461 ) ( not ( = ?auto_18467 ?auto_18464 ) ) ( not ( = ?auto_18471 ?auto_18467 ) ) ( HOIST-AT ?auto_18468 ?auto_18467 ) ( not ( = ?auto_18465 ?auto_18468 ) ) ( not ( = ?auto_18463 ?auto_18468 ) ) ( AVAILABLE ?auto_18468 ) ( SURFACE-AT ?auto_18461 ?auto_18467 ) ( ON ?auto_18461 ?auto_18466 ) ( CLEAR ?auto_18461 ) ( not ( = ?auto_18461 ?auto_18466 ) ) ( not ( = ?auto_18462 ?auto_18466 ) ) ( not ( = ?auto_18460 ?auto_18466 ) ) ( not ( = ?auto_18470 ?auto_18466 ) ) ( TRUCK-AT ?auto_18469 ?auto_18464 ) ( SURFACE-AT ?auto_18459 ?auto_18464 ) ( CLEAR ?auto_18459 ) ( IS-CRATE ?auto_18460 ) ( not ( = ?auto_18459 ?auto_18460 ) ) ( not ( = ?auto_18461 ?auto_18459 ) ) ( not ( = ?auto_18462 ?auto_18459 ) ) ( not ( = ?auto_18470 ?auto_18459 ) ) ( not ( = ?auto_18466 ?auto_18459 ) ) ( AVAILABLE ?auto_18465 ) ( IN ?auto_18460 ?auto_18469 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18460 ?auto_18461 ?auto_18462 )
      ( MAKE-3CRATE-VERIFY ?auto_18459 ?auto_18460 ?auto_18461 ?auto_18462 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18472 - SURFACE
      ?auto_18473 - SURFACE
      ?auto_18474 - SURFACE
      ?auto_18475 - SURFACE
      ?auto_18476 - SURFACE
    )
    :vars
    (
      ?auto_18479 - HOIST
      ?auto_18478 - PLACE
      ?auto_18485 - PLACE
      ?auto_18477 - HOIST
      ?auto_18484 - SURFACE
      ?auto_18481 - PLACE
      ?auto_18482 - HOIST
      ?auto_18480 - SURFACE
      ?auto_18483 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18479 ?auto_18478 ) ( IS-CRATE ?auto_18476 ) ( not ( = ?auto_18475 ?auto_18476 ) ) ( not ( = ?auto_18474 ?auto_18475 ) ) ( not ( = ?auto_18474 ?auto_18476 ) ) ( not ( = ?auto_18485 ?auto_18478 ) ) ( HOIST-AT ?auto_18477 ?auto_18485 ) ( not ( = ?auto_18479 ?auto_18477 ) ) ( AVAILABLE ?auto_18477 ) ( SURFACE-AT ?auto_18476 ?auto_18485 ) ( ON ?auto_18476 ?auto_18484 ) ( CLEAR ?auto_18476 ) ( not ( = ?auto_18475 ?auto_18484 ) ) ( not ( = ?auto_18476 ?auto_18484 ) ) ( not ( = ?auto_18474 ?auto_18484 ) ) ( IS-CRATE ?auto_18475 ) ( not ( = ?auto_18481 ?auto_18478 ) ) ( not ( = ?auto_18485 ?auto_18481 ) ) ( HOIST-AT ?auto_18482 ?auto_18481 ) ( not ( = ?auto_18479 ?auto_18482 ) ) ( not ( = ?auto_18477 ?auto_18482 ) ) ( AVAILABLE ?auto_18482 ) ( SURFACE-AT ?auto_18475 ?auto_18481 ) ( ON ?auto_18475 ?auto_18480 ) ( CLEAR ?auto_18475 ) ( not ( = ?auto_18475 ?auto_18480 ) ) ( not ( = ?auto_18476 ?auto_18480 ) ) ( not ( = ?auto_18474 ?auto_18480 ) ) ( not ( = ?auto_18484 ?auto_18480 ) ) ( TRUCK-AT ?auto_18483 ?auto_18478 ) ( SURFACE-AT ?auto_18473 ?auto_18478 ) ( CLEAR ?auto_18473 ) ( IS-CRATE ?auto_18474 ) ( not ( = ?auto_18473 ?auto_18474 ) ) ( not ( = ?auto_18475 ?auto_18473 ) ) ( not ( = ?auto_18476 ?auto_18473 ) ) ( not ( = ?auto_18484 ?auto_18473 ) ) ( not ( = ?auto_18480 ?auto_18473 ) ) ( AVAILABLE ?auto_18479 ) ( IN ?auto_18474 ?auto_18483 ) ( ON ?auto_18473 ?auto_18472 ) ( not ( = ?auto_18472 ?auto_18473 ) ) ( not ( = ?auto_18472 ?auto_18474 ) ) ( not ( = ?auto_18472 ?auto_18475 ) ) ( not ( = ?auto_18472 ?auto_18476 ) ) ( not ( = ?auto_18472 ?auto_18484 ) ) ( not ( = ?auto_18472 ?auto_18480 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18474 ?auto_18475 ?auto_18476 )
      ( MAKE-4CRATE-VERIFY ?auto_18472 ?auto_18473 ?auto_18474 ?auto_18475 ?auto_18476 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18486 - SURFACE
      ?auto_18487 - SURFACE
      ?auto_18488 - SURFACE
      ?auto_18489 - SURFACE
      ?auto_18490 - SURFACE
      ?auto_18491 - SURFACE
    )
    :vars
    (
      ?auto_18494 - HOIST
      ?auto_18493 - PLACE
      ?auto_18500 - PLACE
      ?auto_18492 - HOIST
      ?auto_18499 - SURFACE
      ?auto_18496 - PLACE
      ?auto_18497 - HOIST
      ?auto_18495 - SURFACE
      ?auto_18498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18494 ?auto_18493 ) ( IS-CRATE ?auto_18491 ) ( not ( = ?auto_18490 ?auto_18491 ) ) ( not ( = ?auto_18489 ?auto_18490 ) ) ( not ( = ?auto_18489 ?auto_18491 ) ) ( not ( = ?auto_18500 ?auto_18493 ) ) ( HOIST-AT ?auto_18492 ?auto_18500 ) ( not ( = ?auto_18494 ?auto_18492 ) ) ( AVAILABLE ?auto_18492 ) ( SURFACE-AT ?auto_18491 ?auto_18500 ) ( ON ?auto_18491 ?auto_18499 ) ( CLEAR ?auto_18491 ) ( not ( = ?auto_18490 ?auto_18499 ) ) ( not ( = ?auto_18491 ?auto_18499 ) ) ( not ( = ?auto_18489 ?auto_18499 ) ) ( IS-CRATE ?auto_18490 ) ( not ( = ?auto_18496 ?auto_18493 ) ) ( not ( = ?auto_18500 ?auto_18496 ) ) ( HOIST-AT ?auto_18497 ?auto_18496 ) ( not ( = ?auto_18494 ?auto_18497 ) ) ( not ( = ?auto_18492 ?auto_18497 ) ) ( AVAILABLE ?auto_18497 ) ( SURFACE-AT ?auto_18490 ?auto_18496 ) ( ON ?auto_18490 ?auto_18495 ) ( CLEAR ?auto_18490 ) ( not ( = ?auto_18490 ?auto_18495 ) ) ( not ( = ?auto_18491 ?auto_18495 ) ) ( not ( = ?auto_18489 ?auto_18495 ) ) ( not ( = ?auto_18499 ?auto_18495 ) ) ( TRUCK-AT ?auto_18498 ?auto_18493 ) ( SURFACE-AT ?auto_18488 ?auto_18493 ) ( CLEAR ?auto_18488 ) ( IS-CRATE ?auto_18489 ) ( not ( = ?auto_18488 ?auto_18489 ) ) ( not ( = ?auto_18490 ?auto_18488 ) ) ( not ( = ?auto_18491 ?auto_18488 ) ) ( not ( = ?auto_18499 ?auto_18488 ) ) ( not ( = ?auto_18495 ?auto_18488 ) ) ( AVAILABLE ?auto_18494 ) ( IN ?auto_18489 ?auto_18498 ) ( ON ?auto_18487 ?auto_18486 ) ( ON ?auto_18488 ?auto_18487 ) ( not ( = ?auto_18486 ?auto_18487 ) ) ( not ( = ?auto_18486 ?auto_18488 ) ) ( not ( = ?auto_18486 ?auto_18489 ) ) ( not ( = ?auto_18486 ?auto_18490 ) ) ( not ( = ?auto_18486 ?auto_18491 ) ) ( not ( = ?auto_18486 ?auto_18499 ) ) ( not ( = ?auto_18486 ?auto_18495 ) ) ( not ( = ?auto_18487 ?auto_18488 ) ) ( not ( = ?auto_18487 ?auto_18489 ) ) ( not ( = ?auto_18487 ?auto_18490 ) ) ( not ( = ?auto_18487 ?auto_18491 ) ) ( not ( = ?auto_18487 ?auto_18499 ) ) ( not ( = ?auto_18487 ?auto_18495 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18489 ?auto_18490 ?auto_18491 )
      ( MAKE-5CRATE-VERIFY ?auto_18486 ?auto_18487 ?auto_18488 ?auto_18489 ?auto_18490 ?auto_18491 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18501 - SURFACE
      ?auto_18502 - SURFACE
    )
    :vars
    (
      ?auto_18506 - HOIST
      ?auto_18504 - PLACE
      ?auto_18513 - SURFACE
      ?auto_18512 - PLACE
      ?auto_18503 - HOIST
      ?auto_18511 - SURFACE
      ?auto_18508 - PLACE
      ?auto_18509 - HOIST
      ?auto_18507 - SURFACE
      ?auto_18505 - SURFACE
      ?auto_18510 - TRUCK
      ?auto_18514 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18506 ?auto_18504 ) ( IS-CRATE ?auto_18502 ) ( not ( = ?auto_18501 ?auto_18502 ) ) ( not ( = ?auto_18513 ?auto_18501 ) ) ( not ( = ?auto_18513 ?auto_18502 ) ) ( not ( = ?auto_18512 ?auto_18504 ) ) ( HOIST-AT ?auto_18503 ?auto_18512 ) ( not ( = ?auto_18506 ?auto_18503 ) ) ( AVAILABLE ?auto_18503 ) ( SURFACE-AT ?auto_18502 ?auto_18512 ) ( ON ?auto_18502 ?auto_18511 ) ( CLEAR ?auto_18502 ) ( not ( = ?auto_18501 ?auto_18511 ) ) ( not ( = ?auto_18502 ?auto_18511 ) ) ( not ( = ?auto_18513 ?auto_18511 ) ) ( IS-CRATE ?auto_18501 ) ( not ( = ?auto_18508 ?auto_18504 ) ) ( not ( = ?auto_18512 ?auto_18508 ) ) ( HOIST-AT ?auto_18509 ?auto_18508 ) ( not ( = ?auto_18506 ?auto_18509 ) ) ( not ( = ?auto_18503 ?auto_18509 ) ) ( AVAILABLE ?auto_18509 ) ( SURFACE-AT ?auto_18501 ?auto_18508 ) ( ON ?auto_18501 ?auto_18507 ) ( CLEAR ?auto_18501 ) ( not ( = ?auto_18501 ?auto_18507 ) ) ( not ( = ?auto_18502 ?auto_18507 ) ) ( not ( = ?auto_18513 ?auto_18507 ) ) ( not ( = ?auto_18511 ?auto_18507 ) ) ( SURFACE-AT ?auto_18505 ?auto_18504 ) ( CLEAR ?auto_18505 ) ( IS-CRATE ?auto_18513 ) ( not ( = ?auto_18505 ?auto_18513 ) ) ( not ( = ?auto_18501 ?auto_18505 ) ) ( not ( = ?auto_18502 ?auto_18505 ) ) ( not ( = ?auto_18511 ?auto_18505 ) ) ( not ( = ?auto_18507 ?auto_18505 ) ) ( AVAILABLE ?auto_18506 ) ( IN ?auto_18513 ?auto_18510 ) ( TRUCK-AT ?auto_18510 ?auto_18514 ) ( not ( = ?auto_18514 ?auto_18504 ) ) ( not ( = ?auto_18512 ?auto_18514 ) ) ( not ( = ?auto_18508 ?auto_18514 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18510 ?auto_18514 ?auto_18504 )
      ( MAKE-2CRATE ?auto_18513 ?auto_18501 ?auto_18502 )
      ( MAKE-1CRATE-VERIFY ?auto_18501 ?auto_18502 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18515 - SURFACE
      ?auto_18516 - SURFACE
      ?auto_18517 - SURFACE
    )
    :vars
    (
      ?auto_18523 - HOIST
      ?auto_18521 - PLACE
      ?auto_18518 - PLACE
      ?auto_18524 - HOIST
      ?auto_18528 - SURFACE
      ?auto_18525 - PLACE
      ?auto_18519 - HOIST
      ?auto_18526 - SURFACE
      ?auto_18522 - SURFACE
      ?auto_18520 - TRUCK
      ?auto_18527 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18523 ?auto_18521 ) ( IS-CRATE ?auto_18517 ) ( not ( = ?auto_18516 ?auto_18517 ) ) ( not ( = ?auto_18515 ?auto_18516 ) ) ( not ( = ?auto_18515 ?auto_18517 ) ) ( not ( = ?auto_18518 ?auto_18521 ) ) ( HOIST-AT ?auto_18524 ?auto_18518 ) ( not ( = ?auto_18523 ?auto_18524 ) ) ( AVAILABLE ?auto_18524 ) ( SURFACE-AT ?auto_18517 ?auto_18518 ) ( ON ?auto_18517 ?auto_18528 ) ( CLEAR ?auto_18517 ) ( not ( = ?auto_18516 ?auto_18528 ) ) ( not ( = ?auto_18517 ?auto_18528 ) ) ( not ( = ?auto_18515 ?auto_18528 ) ) ( IS-CRATE ?auto_18516 ) ( not ( = ?auto_18525 ?auto_18521 ) ) ( not ( = ?auto_18518 ?auto_18525 ) ) ( HOIST-AT ?auto_18519 ?auto_18525 ) ( not ( = ?auto_18523 ?auto_18519 ) ) ( not ( = ?auto_18524 ?auto_18519 ) ) ( AVAILABLE ?auto_18519 ) ( SURFACE-AT ?auto_18516 ?auto_18525 ) ( ON ?auto_18516 ?auto_18526 ) ( CLEAR ?auto_18516 ) ( not ( = ?auto_18516 ?auto_18526 ) ) ( not ( = ?auto_18517 ?auto_18526 ) ) ( not ( = ?auto_18515 ?auto_18526 ) ) ( not ( = ?auto_18528 ?auto_18526 ) ) ( SURFACE-AT ?auto_18522 ?auto_18521 ) ( CLEAR ?auto_18522 ) ( IS-CRATE ?auto_18515 ) ( not ( = ?auto_18522 ?auto_18515 ) ) ( not ( = ?auto_18516 ?auto_18522 ) ) ( not ( = ?auto_18517 ?auto_18522 ) ) ( not ( = ?auto_18528 ?auto_18522 ) ) ( not ( = ?auto_18526 ?auto_18522 ) ) ( AVAILABLE ?auto_18523 ) ( IN ?auto_18515 ?auto_18520 ) ( TRUCK-AT ?auto_18520 ?auto_18527 ) ( not ( = ?auto_18527 ?auto_18521 ) ) ( not ( = ?auto_18518 ?auto_18527 ) ) ( not ( = ?auto_18525 ?auto_18527 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18516 ?auto_18517 )
      ( MAKE-2CRATE-VERIFY ?auto_18515 ?auto_18516 ?auto_18517 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18529 - SURFACE
      ?auto_18530 - SURFACE
      ?auto_18531 - SURFACE
      ?auto_18532 - SURFACE
    )
    :vars
    (
      ?auto_18539 - HOIST
      ?auto_18541 - PLACE
      ?auto_18536 - PLACE
      ?auto_18542 - HOIST
      ?auto_18537 - SURFACE
      ?auto_18533 - PLACE
      ?auto_18535 - HOIST
      ?auto_18538 - SURFACE
      ?auto_18534 - TRUCK
      ?auto_18540 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18539 ?auto_18541 ) ( IS-CRATE ?auto_18532 ) ( not ( = ?auto_18531 ?auto_18532 ) ) ( not ( = ?auto_18530 ?auto_18531 ) ) ( not ( = ?auto_18530 ?auto_18532 ) ) ( not ( = ?auto_18536 ?auto_18541 ) ) ( HOIST-AT ?auto_18542 ?auto_18536 ) ( not ( = ?auto_18539 ?auto_18542 ) ) ( AVAILABLE ?auto_18542 ) ( SURFACE-AT ?auto_18532 ?auto_18536 ) ( ON ?auto_18532 ?auto_18537 ) ( CLEAR ?auto_18532 ) ( not ( = ?auto_18531 ?auto_18537 ) ) ( not ( = ?auto_18532 ?auto_18537 ) ) ( not ( = ?auto_18530 ?auto_18537 ) ) ( IS-CRATE ?auto_18531 ) ( not ( = ?auto_18533 ?auto_18541 ) ) ( not ( = ?auto_18536 ?auto_18533 ) ) ( HOIST-AT ?auto_18535 ?auto_18533 ) ( not ( = ?auto_18539 ?auto_18535 ) ) ( not ( = ?auto_18542 ?auto_18535 ) ) ( AVAILABLE ?auto_18535 ) ( SURFACE-AT ?auto_18531 ?auto_18533 ) ( ON ?auto_18531 ?auto_18538 ) ( CLEAR ?auto_18531 ) ( not ( = ?auto_18531 ?auto_18538 ) ) ( not ( = ?auto_18532 ?auto_18538 ) ) ( not ( = ?auto_18530 ?auto_18538 ) ) ( not ( = ?auto_18537 ?auto_18538 ) ) ( SURFACE-AT ?auto_18529 ?auto_18541 ) ( CLEAR ?auto_18529 ) ( IS-CRATE ?auto_18530 ) ( not ( = ?auto_18529 ?auto_18530 ) ) ( not ( = ?auto_18531 ?auto_18529 ) ) ( not ( = ?auto_18532 ?auto_18529 ) ) ( not ( = ?auto_18537 ?auto_18529 ) ) ( not ( = ?auto_18538 ?auto_18529 ) ) ( AVAILABLE ?auto_18539 ) ( IN ?auto_18530 ?auto_18534 ) ( TRUCK-AT ?auto_18534 ?auto_18540 ) ( not ( = ?auto_18540 ?auto_18541 ) ) ( not ( = ?auto_18536 ?auto_18540 ) ) ( not ( = ?auto_18533 ?auto_18540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18530 ?auto_18531 ?auto_18532 )
      ( MAKE-3CRATE-VERIFY ?auto_18529 ?auto_18530 ?auto_18531 ?auto_18532 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18543 - SURFACE
      ?auto_18544 - SURFACE
      ?auto_18545 - SURFACE
      ?auto_18546 - SURFACE
      ?auto_18547 - SURFACE
    )
    :vars
    (
      ?auto_18554 - HOIST
      ?auto_18556 - PLACE
      ?auto_18551 - PLACE
      ?auto_18557 - HOIST
      ?auto_18552 - SURFACE
      ?auto_18548 - PLACE
      ?auto_18550 - HOIST
      ?auto_18553 - SURFACE
      ?auto_18549 - TRUCK
      ?auto_18555 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18554 ?auto_18556 ) ( IS-CRATE ?auto_18547 ) ( not ( = ?auto_18546 ?auto_18547 ) ) ( not ( = ?auto_18545 ?auto_18546 ) ) ( not ( = ?auto_18545 ?auto_18547 ) ) ( not ( = ?auto_18551 ?auto_18556 ) ) ( HOIST-AT ?auto_18557 ?auto_18551 ) ( not ( = ?auto_18554 ?auto_18557 ) ) ( AVAILABLE ?auto_18557 ) ( SURFACE-AT ?auto_18547 ?auto_18551 ) ( ON ?auto_18547 ?auto_18552 ) ( CLEAR ?auto_18547 ) ( not ( = ?auto_18546 ?auto_18552 ) ) ( not ( = ?auto_18547 ?auto_18552 ) ) ( not ( = ?auto_18545 ?auto_18552 ) ) ( IS-CRATE ?auto_18546 ) ( not ( = ?auto_18548 ?auto_18556 ) ) ( not ( = ?auto_18551 ?auto_18548 ) ) ( HOIST-AT ?auto_18550 ?auto_18548 ) ( not ( = ?auto_18554 ?auto_18550 ) ) ( not ( = ?auto_18557 ?auto_18550 ) ) ( AVAILABLE ?auto_18550 ) ( SURFACE-AT ?auto_18546 ?auto_18548 ) ( ON ?auto_18546 ?auto_18553 ) ( CLEAR ?auto_18546 ) ( not ( = ?auto_18546 ?auto_18553 ) ) ( not ( = ?auto_18547 ?auto_18553 ) ) ( not ( = ?auto_18545 ?auto_18553 ) ) ( not ( = ?auto_18552 ?auto_18553 ) ) ( SURFACE-AT ?auto_18544 ?auto_18556 ) ( CLEAR ?auto_18544 ) ( IS-CRATE ?auto_18545 ) ( not ( = ?auto_18544 ?auto_18545 ) ) ( not ( = ?auto_18546 ?auto_18544 ) ) ( not ( = ?auto_18547 ?auto_18544 ) ) ( not ( = ?auto_18552 ?auto_18544 ) ) ( not ( = ?auto_18553 ?auto_18544 ) ) ( AVAILABLE ?auto_18554 ) ( IN ?auto_18545 ?auto_18549 ) ( TRUCK-AT ?auto_18549 ?auto_18555 ) ( not ( = ?auto_18555 ?auto_18556 ) ) ( not ( = ?auto_18551 ?auto_18555 ) ) ( not ( = ?auto_18548 ?auto_18555 ) ) ( ON ?auto_18544 ?auto_18543 ) ( not ( = ?auto_18543 ?auto_18544 ) ) ( not ( = ?auto_18543 ?auto_18545 ) ) ( not ( = ?auto_18543 ?auto_18546 ) ) ( not ( = ?auto_18543 ?auto_18547 ) ) ( not ( = ?auto_18543 ?auto_18552 ) ) ( not ( = ?auto_18543 ?auto_18553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18545 ?auto_18546 ?auto_18547 )
      ( MAKE-4CRATE-VERIFY ?auto_18543 ?auto_18544 ?auto_18545 ?auto_18546 ?auto_18547 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18558 - SURFACE
      ?auto_18559 - SURFACE
      ?auto_18560 - SURFACE
      ?auto_18561 - SURFACE
      ?auto_18562 - SURFACE
      ?auto_18563 - SURFACE
    )
    :vars
    (
      ?auto_18570 - HOIST
      ?auto_18572 - PLACE
      ?auto_18567 - PLACE
      ?auto_18573 - HOIST
      ?auto_18568 - SURFACE
      ?auto_18564 - PLACE
      ?auto_18566 - HOIST
      ?auto_18569 - SURFACE
      ?auto_18565 - TRUCK
      ?auto_18571 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18570 ?auto_18572 ) ( IS-CRATE ?auto_18563 ) ( not ( = ?auto_18562 ?auto_18563 ) ) ( not ( = ?auto_18561 ?auto_18562 ) ) ( not ( = ?auto_18561 ?auto_18563 ) ) ( not ( = ?auto_18567 ?auto_18572 ) ) ( HOIST-AT ?auto_18573 ?auto_18567 ) ( not ( = ?auto_18570 ?auto_18573 ) ) ( AVAILABLE ?auto_18573 ) ( SURFACE-AT ?auto_18563 ?auto_18567 ) ( ON ?auto_18563 ?auto_18568 ) ( CLEAR ?auto_18563 ) ( not ( = ?auto_18562 ?auto_18568 ) ) ( not ( = ?auto_18563 ?auto_18568 ) ) ( not ( = ?auto_18561 ?auto_18568 ) ) ( IS-CRATE ?auto_18562 ) ( not ( = ?auto_18564 ?auto_18572 ) ) ( not ( = ?auto_18567 ?auto_18564 ) ) ( HOIST-AT ?auto_18566 ?auto_18564 ) ( not ( = ?auto_18570 ?auto_18566 ) ) ( not ( = ?auto_18573 ?auto_18566 ) ) ( AVAILABLE ?auto_18566 ) ( SURFACE-AT ?auto_18562 ?auto_18564 ) ( ON ?auto_18562 ?auto_18569 ) ( CLEAR ?auto_18562 ) ( not ( = ?auto_18562 ?auto_18569 ) ) ( not ( = ?auto_18563 ?auto_18569 ) ) ( not ( = ?auto_18561 ?auto_18569 ) ) ( not ( = ?auto_18568 ?auto_18569 ) ) ( SURFACE-AT ?auto_18560 ?auto_18572 ) ( CLEAR ?auto_18560 ) ( IS-CRATE ?auto_18561 ) ( not ( = ?auto_18560 ?auto_18561 ) ) ( not ( = ?auto_18562 ?auto_18560 ) ) ( not ( = ?auto_18563 ?auto_18560 ) ) ( not ( = ?auto_18568 ?auto_18560 ) ) ( not ( = ?auto_18569 ?auto_18560 ) ) ( AVAILABLE ?auto_18570 ) ( IN ?auto_18561 ?auto_18565 ) ( TRUCK-AT ?auto_18565 ?auto_18571 ) ( not ( = ?auto_18571 ?auto_18572 ) ) ( not ( = ?auto_18567 ?auto_18571 ) ) ( not ( = ?auto_18564 ?auto_18571 ) ) ( ON ?auto_18559 ?auto_18558 ) ( ON ?auto_18560 ?auto_18559 ) ( not ( = ?auto_18558 ?auto_18559 ) ) ( not ( = ?auto_18558 ?auto_18560 ) ) ( not ( = ?auto_18558 ?auto_18561 ) ) ( not ( = ?auto_18558 ?auto_18562 ) ) ( not ( = ?auto_18558 ?auto_18563 ) ) ( not ( = ?auto_18558 ?auto_18568 ) ) ( not ( = ?auto_18558 ?auto_18569 ) ) ( not ( = ?auto_18559 ?auto_18560 ) ) ( not ( = ?auto_18559 ?auto_18561 ) ) ( not ( = ?auto_18559 ?auto_18562 ) ) ( not ( = ?auto_18559 ?auto_18563 ) ) ( not ( = ?auto_18559 ?auto_18568 ) ) ( not ( = ?auto_18559 ?auto_18569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18561 ?auto_18562 ?auto_18563 )
      ( MAKE-5CRATE-VERIFY ?auto_18558 ?auto_18559 ?auto_18560 ?auto_18561 ?auto_18562 ?auto_18563 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18574 - SURFACE
      ?auto_18575 - SURFACE
    )
    :vars
    (
      ?auto_18583 - HOIST
      ?auto_18585 - PLACE
      ?auto_18587 - SURFACE
      ?auto_18580 - PLACE
      ?auto_18586 - HOIST
      ?auto_18581 - SURFACE
      ?auto_18577 - PLACE
      ?auto_18579 - HOIST
      ?auto_18582 - SURFACE
      ?auto_18576 - SURFACE
      ?auto_18578 - TRUCK
      ?auto_18584 - PLACE
      ?auto_18588 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18583 ?auto_18585 ) ( IS-CRATE ?auto_18575 ) ( not ( = ?auto_18574 ?auto_18575 ) ) ( not ( = ?auto_18587 ?auto_18574 ) ) ( not ( = ?auto_18587 ?auto_18575 ) ) ( not ( = ?auto_18580 ?auto_18585 ) ) ( HOIST-AT ?auto_18586 ?auto_18580 ) ( not ( = ?auto_18583 ?auto_18586 ) ) ( AVAILABLE ?auto_18586 ) ( SURFACE-AT ?auto_18575 ?auto_18580 ) ( ON ?auto_18575 ?auto_18581 ) ( CLEAR ?auto_18575 ) ( not ( = ?auto_18574 ?auto_18581 ) ) ( not ( = ?auto_18575 ?auto_18581 ) ) ( not ( = ?auto_18587 ?auto_18581 ) ) ( IS-CRATE ?auto_18574 ) ( not ( = ?auto_18577 ?auto_18585 ) ) ( not ( = ?auto_18580 ?auto_18577 ) ) ( HOIST-AT ?auto_18579 ?auto_18577 ) ( not ( = ?auto_18583 ?auto_18579 ) ) ( not ( = ?auto_18586 ?auto_18579 ) ) ( AVAILABLE ?auto_18579 ) ( SURFACE-AT ?auto_18574 ?auto_18577 ) ( ON ?auto_18574 ?auto_18582 ) ( CLEAR ?auto_18574 ) ( not ( = ?auto_18574 ?auto_18582 ) ) ( not ( = ?auto_18575 ?auto_18582 ) ) ( not ( = ?auto_18587 ?auto_18582 ) ) ( not ( = ?auto_18581 ?auto_18582 ) ) ( SURFACE-AT ?auto_18576 ?auto_18585 ) ( CLEAR ?auto_18576 ) ( IS-CRATE ?auto_18587 ) ( not ( = ?auto_18576 ?auto_18587 ) ) ( not ( = ?auto_18574 ?auto_18576 ) ) ( not ( = ?auto_18575 ?auto_18576 ) ) ( not ( = ?auto_18581 ?auto_18576 ) ) ( not ( = ?auto_18582 ?auto_18576 ) ) ( AVAILABLE ?auto_18583 ) ( TRUCK-AT ?auto_18578 ?auto_18584 ) ( not ( = ?auto_18584 ?auto_18585 ) ) ( not ( = ?auto_18580 ?auto_18584 ) ) ( not ( = ?auto_18577 ?auto_18584 ) ) ( HOIST-AT ?auto_18588 ?auto_18584 ) ( LIFTING ?auto_18588 ?auto_18587 ) ( not ( = ?auto_18583 ?auto_18588 ) ) ( not ( = ?auto_18586 ?auto_18588 ) ) ( not ( = ?auto_18579 ?auto_18588 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18588 ?auto_18587 ?auto_18578 ?auto_18584 )
      ( MAKE-2CRATE ?auto_18587 ?auto_18574 ?auto_18575 )
      ( MAKE-1CRATE-VERIFY ?auto_18574 ?auto_18575 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18589 - SURFACE
      ?auto_18590 - SURFACE
      ?auto_18591 - SURFACE
    )
    :vars
    (
      ?auto_18596 - HOIST
      ?auto_18600 - PLACE
      ?auto_18594 - PLACE
      ?auto_18601 - HOIST
      ?auto_18602 - SURFACE
      ?auto_18593 - PLACE
      ?auto_18597 - HOIST
      ?auto_18592 - SURFACE
      ?auto_18599 - SURFACE
      ?auto_18595 - TRUCK
      ?auto_18598 - PLACE
      ?auto_18603 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18596 ?auto_18600 ) ( IS-CRATE ?auto_18591 ) ( not ( = ?auto_18590 ?auto_18591 ) ) ( not ( = ?auto_18589 ?auto_18590 ) ) ( not ( = ?auto_18589 ?auto_18591 ) ) ( not ( = ?auto_18594 ?auto_18600 ) ) ( HOIST-AT ?auto_18601 ?auto_18594 ) ( not ( = ?auto_18596 ?auto_18601 ) ) ( AVAILABLE ?auto_18601 ) ( SURFACE-AT ?auto_18591 ?auto_18594 ) ( ON ?auto_18591 ?auto_18602 ) ( CLEAR ?auto_18591 ) ( not ( = ?auto_18590 ?auto_18602 ) ) ( not ( = ?auto_18591 ?auto_18602 ) ) ( not ( = ?auto_18589 ?auto_18602 ) ) ( IS-CRATE ?auto_18590 ) ( not ( = ?auto_18593 ?auto_18600 ) ) ( not ( = ?auto_18594 ?auto_18593 ) ) ( HOIST-AT ?auto_18597 ?auto_18593 ) ( not ( = ?auto_18596 ?auto_18597 ) ) ( not ( = ?auto_18601 ?auto_18597 ) ) ( AVAILABLE ?auto_18597 ) ( SURFACE-AT ?auto_18590 ?auto_18593 ) ( ON ?auto_18590 ?auto_18592 ) ( CLEAR ?auto_18590 ) ( not ( = ?auto_18590 ?auto_18592 ) ) ( not ( = ?auto_18591 ?auto_18592 ) ) ( not ( = ?auto_18589 ?auto_18592 ) ) ( not ( = ?auto_18602 ?auto_18592 ) ) ( SURFACE-AT ?auto_18599 ?auto_18600 ) ( CLEAR ?auto_18599 ) ( IS-CRATE ?auto_18589 ) ( not ( = ?auto_18599 ?auto_18589 ) ) ( not ( = ?auto_18590 ?auto_18599 ) ) ( not ( = ?auto_18591 ?auto_18599 ) ) ( not ( = ?auto_18602 ?auto_18599 ) ) ( not ( = ?auto_18592 ?auto_18599 ) ) ( AVAILABLE ?auto_18596 ) ( TRUCK-AT ?auto_18595 ?auto_18598 ) ( not ( = ?auto_18598 ?auto_18600 ) ) ( not ( = ?auto_18594 ?auto_18598 ) ) ( not ( = ?auto_18593 ?auto_18598 ) ) ( HOIST-AT ?auto_18603 ?auto_18598 ) ( LIFTING ?auto_18603 ?auto_18589 ) ( not ( = ?auto_18596 ?auto_18603 ) ) ( not ( = ?auto_18601 ?auto_18603 ) ) ( not ( = ?auto_18597 ?auto_18603 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18590 ?auto_18591 )
      ( MAKE-2CRATE-VERIFY ?auto_18589 ?auto_18590 ?auto_18591 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18604 - SURFACE
      ?auto_18605 - SURFACE
      ?auto_18606 - SURFACE
      ?auto_18607 - SURFACE
    )
    :vars
    (
      ?auto_18612 - HOIST
      ?auto_18608 - PLACE
      ?auto_18616 - PLACE
      ?auto_18609 - HOIST
      ?auto_18613 - SURFACE
      ?auto_18617 - PLACE
      ?auto_18614 - HOIST
      ?auto_18611 - SURFACE
      ?auto_18610 - TRUCK
      ?auto_18615 - PLACE
      ?auto_18618 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18612 ?auto_18608 ) ( IS-CRATE ?auto_18607 ) ( not ( = ?auto_18606 ?auto_18607 ) ) ( not ( = ?auto_18605 ?auto_18606 ) ) ( not ( = ?auto_18605 ?auto_18607 ) ) ( not ( = ?auto_18616 ?auto_18608 ) ) ( HOIST-AT ?auto_18609 ?auto_18616 ) ( not ( = ?auto_18612 ?auto_18609 ) ) ( AVAILABLE ?auto_18609 ) ( SURFACE-AT ?auto_18607 ?auto_18616 ) ( ON ?auto_18607 ?auto_18613 ) ( CLEAR ?auto_18607 ) ( not ( = ?auto_18606 ?auto_18613 ) ) ( not ( = ?auto_18607 ?auto_18613 ) ) ( not ( = ?auto_18605 ?auto_18613 ) ) ( IS-CRATE ?auto_18606 ) ( not ( = ?auto_18617 ?auto_18608 ) ) ( not ( = ?auto_18616 ?auto_18617 ) ) ( HOIST-AT ?auto_18614 ?auto_18617 ) ( not ( = ?auto_18612 ?auto_18614 ) ) ( not ( = ?auto_18609 ?auto_18614 ) ) ( AVAILABLE ?auto_18614 ) ( SURFACE-AT ?auto_18606 ?auto_18617 ) ( ON ?auto_18606 ?auto_18611 ) ( CLEAR ?auto_18606 ) ( not ( = ?auto_18606 ?auto_18611 ) ) ( not ( = ?auto_18607 ?auto_18611 ) ) ( not ( = ?auto_18605 ?auto_18611 ) ) ( not ( = ?auto_18613 ?auto_18611 ) ) ( SURFACE-AT ?auto_18604 ?auto_18608 ) ( CLEAR ?auto_18604 ) ( IS-CRATE ?auto_18605 ) ( not ( = ?auto_18604 ?auto_18605 ) ) ( not ( = ?auto_18606 ?auto_18604 ) ) ( not ( = ?auto_18607 ?auto_18604 ) ) ( not ( = ?auto_18613 ?auto_18604 ) ) ( not ( = ?auto_18611 ?auto_18604 ) ) ( AVAILABLE ?auto_18612 ) ( TRUCK-AT ?auto_18610 ?auto_18615 ) ( not ( = ?auto_18615 ?auto_18608 ) ) ( not ( = ?auto_18616 ?auto_18615 ) ) ( not ( = ?auto_18617 ?auto_18615 ) ) ( HOIST-AT ?auto_18618 ?auto_18615 ) ( LIFTING ?auto_18618 ?auto_18605 ) ( not ( = ?auto_18612 ?auto_18618 ) ) ( not ( = ?auto_18609 ?auto_18618 ) ) ( not ( = ?auto_18614 ?auto_18618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18605 ?auto_18606 ?auto_18607 )
      ( MAKE-3CRATE-VERIFY ?auto_18604 ?auto_18605 ?auto_18606 ?auto_18607 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18619 - SURFACE
      ?auto_18620 - SURFACE
      ?auto_18621 - SURFACE
      ?auto_18622 - SURFACE
      ?auto_18623 - SURFACE
    )
    :vars
    (
      ?auto_18628 - HOIST
      ?auto_18624 - PLACE
      ?auto_18632 - PLACE
      ?auto_18625 - HOIST
      ?auto_18629 - SURFACE
      ?auto_18633 - PLACE
      ?auto_18630 - HOIST
      ?auto_18627 - SURFACE
      ?auto_18626 - TRUCK
      ?auto_18631 - PLACE
      ?auto_18634 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18628 ?auto_18624 ) ( IS-CRATE ?auto_18623 ) ( not ( = ?auto_18622 ?auto_18623 ) ) ( not ( = ?auto_18621 ?auto_18622 ) ) ( not ( = ?auto_18621 ?auto_18623 ) ) ( not ( = ?auto_18632 ?auto_18624 ) ) ( HOIST-AT ?auto_18625 ?auto_18632 ) ( not ( = ?auto_18628 ?auto_18625 ) ) ( AVAILABLE ?auto_18625 ) ( SURFACE-AT ?auto_18623 ?auto_18632 ) ( ON ?auto_18623 ?auto_18629 ) ( CLEAR ?auto_18623 ) ( not ( = ?auto_18622 ?auto_18629 ) ) ( not ( = ?auto_18623 ?auto_18629 ) ) ( not ( = ?auto_18621 ?auto_18629 ) ) ( IS-CRATE ?auto_18622 ) ( not ( = ?auto_18633 ?auto_18624 ) ) ( not ( = ?auto_18632 ?auto_18633 ) ) ( HOIST-AT ?auto_18630 ?auto_18633 ) ( not ( = ?auto_18628 ?auto_18630 ) ) ( not ( = ?auto_18625 ?auto_18630 ) ) ( AVAILABLE ?auto_18630 ) ( SURFACE-AT ?auto_18622 ?auto_18633 ) ( ON ?auto_18622 ?auto_18627 ) ( CLEAR ?auto_18622 ) ( not ( = ?auto_18622 ?auto_18627 ) ) ( not ( = ?auto_18623 ?auto_18627 ) ) ( not ( = ?auto_18621 ?auto_18627 ) ) ( not ( = ?auto_18629 ?auto_18627 ) ) ( SURFACE-AT ?auto_18620 ?auto_18624 ) ( CLEAR ?auto_18620 ) ( IS-CRATE ?auto_18621 ) ( not ( = ?auto_18620 ?auto_18621 ) ) ( not ( = ?auto_18622 ?auto_18620 ) ) ( not ( = ?auto_18623 ?auto_18620 ) ) ( not ( = ?auto_18629 ?auto_18620 ) ) ( not ( = ?auto_18627 ?auto_18620 ) ) ( AVAILABLE ?auto_18628 ) ( TRUCK-AT ?auto_18626 ?auto_18631 ) ( not ( = ?auto_18631 ?auto_18624 ) ) ( not ( = ?auto_18632 ?auto_18631 ) ) ( not ( = ?auto_18633 ?auto_18631 ) ) ( HOIST-AT ?auto_18634 ?auto_18631 ) ( LIFTING ?auto_18634 ?auto_18621 ) ( not ( = ?auto_18628 ?auto_18634 ) ) ( not ( = ?auto_18625 ?auto_18634 ) ) ( not ( = ?auto_18630 ?auto_18634 ) ) ( ON ?auto_18620 ?auto_18619 ) ( not ( = ?auto_18619 ?auto_18620 ) ) ( not ( = ?auto_18619 ?auto_18621 ) ) ( not ( = ?auto_18619 ?auto_18622 ) ) ( not ( = ?auto_18619 ?auto_18623 ) ) ( not ( = ?auto_18619 ?auto_18629 ) ) ( not ( = ?auto_18619 ?auto_18627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18621 ?auto_18622 ?auto_18623 )
      ( MAKE-4CRATE-VERIFY ?auto_18619 ?auto_18620 ?auto_18621 ?auto_18622 ?auto_18623 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18635 - SURFACE
      ?auto_18636 - SURFACE
      ?auto_18637 - SURFACE
      ?auto_18638 - SURFACE
      ?auto_18639 - SURFACE
      ?auto_18640 - SURFACE
    )
    :vars
    (
      ?auto_18645 - HOIST
      ?auto_18641 - PLACE
      ?auto_18649 - PLACE
      ?auto_18642 - HOIST
      ?auto_18646 - SURFACE
      ?auto_18650 - PLACE
      ?auto_18647 - HOIST
      ?auto_18644 - SURFACE
      ?auto_18643 - TRUCK
      ?auto_18648 - PLACE
      ?auto_18651 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18645 ?auto_18641 ) ( IS-CRATE ?auto_18640 ) ( not ( = ?auto_18639 ?auto_18640 ) ) ( not ( = ?auto_18638 ?auto_18639 ) ) ( not ( = ?auto_18638 ?auto_18640 ) ) ( not ( = ?auto_18649 ?auto_18641 ) ) ( HOIST-AT ?auto_18642 ?auto_18649 ) ( not ( = ?auto_18645 ?auto_18642 ) ) ( AVAILABLE ?auto_18642 ) ( SURFACE-AT ?auto_18640 ?auto_18649 ) ( ON ?auto_18640 ?auto_18646 ) ( CLEAR ?auto_18640 ) ( not ( = ?auto_18639 ?auto_18646 ) ) ( not ( = ?auto_18640 ?auto_18646 ) ) ( not ( = ?auto_18638 ?auto_18646 ) ) ( IS-CRATE ?auto_18639 ) ( not ( = ?auto_18650 ?auto_18641 ) ) ( not ( = ?auto_18649 ?auto_18650 ) ) ( HOIST-AT ?auto_18647 ?auto_18650 ) ( not ( = ?auto_18645 ?auto_18647 ) ) ( not ( = ?auto_18642 ?auto_18647 ) ) ( AVAILABLE ?auto_18647 ) ( SURFACE-AT ?auto_18639 ?auto_18650 ) ( ON ?auto_18639 ?auto_18644 ) ( CLEAR ?auto_18639 ) ( not ( = ?auto_18639 ?auto_18644 ) ) ( not ( = ?auto_18640 ?auto_18644 ) ) ( not ( = ?auto_18638 ?auto_18644 ) ) ( not ( = ?auto_18646 ?auto_18644 ) ) ( SURFACE-AT ?auto_18637 ?auto_18641 ) ( CLEAR ?auto_18637 ) ( IS-CRATE ?auto_18638 ) ( not ( = ?auto_18637 ?auto_18638 ) ) ( not ( = ?auto_18639 ?auto_18637 ) ) ( not ( = ?auto_18640 ?auto_18637 ) ) ( not ( = ?auto_18646 ?auto_18637 ) ) ( not ( = ?auto_18644 ?auto_18637 ) ) ( AVAILABLE ?auto_18645 ) ( TRUCK-AT ?auto_18643 ?auto_18648 ) ( not ( = ?auto_18648 ?auto_18641 ) ) ( not ( = ?auto_18649 ?auto_18648 ) ) ( not ( = ?auto_18650 ?auto_18648 ) ) ( HOIST-AT ?auto_18651 ?auto_18648 ) ( LIFTING ?auto_18651 ?auto_18638 ) ( not ( = ?auto_18645 ?auto_18651 ) ) ( not ( = ?auto_18642 ?auto_18651 ) ) ( not ( = ?auto_18647 ?auto_18651 ) ) ( ON ?auto_18636 ?auto_18635 ) ( ON ?auto_18637 ?auto_18636 ) ( not ( = ?auto_18635 ?auto_18636 ) ) ( not ( = ?auto_18635 ?auto_18637 ) ) ( not ( = ?auto_18635 ?auto_18638 ) ) ( not ( = ?auto_18635 ?auto_18639 ) ) ( not ( = ?auto_18635 ?auto_18640 ) ) ( not ( = ?auto_18635 ?auto_18646 ) ) ( not ( = ?auto_18635 ?auto_18644 ) ) ( not ( = ?auto_18636 ?auto_18637 ) ) ( not ( = ?auto_18636 ?auto_18638 ) ) ( not ( = ?auto_18636 ?auto_18639 ) ) ( not ( = ?auto_18636 ?auto_18640 ) ) ( not ( = ?auto_18636 ?auto_18646 ) ) ( not ( = ?auto_18636 ?auto_18644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18638 ?auto_18639 ?auto_18640 )
      ( MAKE-5CRATE-VERIFY ?auto_18635 ?auto_18636 ?auto_18637 ?auto_18638 ?auto_18639 ?auto_18640 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18652 - SURFACE
      ?auto_18653 - SURFACE
    )
    :vars
    (
      ?auto_18659 - HOIST
      ?auto_18654 - PLACE
      ?auto_18666 - SURFACE
      ?auto_18663 - PLACE
      ?auto_18655 - HOIST
      ?auto_18660 - SURFACE
      ?auto_18664 - PLACE
      ?auto_18661 - HOIST
      ?auto_18657 - SURFACE
      ?auto_18658 - SURFACE
      ?auto_18656 - TRUCK
      ?auto_18662 - PLACE
      ?auto_18665 - HOIST
      ?auto_18667 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18659 ?auto_18654 ) ( IS-CRATE ?auto_18653 ) ( not ( = ?auto_18652 ?auto_18653 ) ) ( not ( = ?auto_18666 ?auto_18652 ) ) ( not ( = ?auto_18666 ?auto_18653 ) ) ( not ( = ?auto_18663 ?auto_18654 ) ) ( HOIST-AT ?auto_18655 ?auto_18663 ) ( not ( = ?auto_18659 ?auto_18655 ) ) ( AVAILABLE ?auto_18655 ) ( SURFACE-AT ?auto_18653 ?auto_18663 ) ( ON ?auto_18653 ?auto_18660 ) ( CLEAR ?auto_18653 ) ( not ( = ?auto_18652 ?auto_18660 ) ) ( not ( = ?auto_18653 ?auto_18660 ) ) ( not ( = ?auto_18666 ?auto_18660 ) ) ( IS-CRATE ?auto_18652 ) ( not ( = ?auto_18664 ?auto_18654 ) ) ( not ( = ?auto_18663 ?auto_18664 ) ) ( HOIST-AT ?auto_18661 ?auto_18664 ) ( not ( = ?auto_18659 ?auto_18661 ) ) ( not ( = ?auto_18655 ?auto_18661 ) ) ( AVAILABLE ?auto_18661 ) ( SURFACE-AT ?auto_18652 ?auto_18664 ) ( ON ?auto_18652 ?auto_18657 ) ( CLEAR ?auto_18652 ) ( not ( = ?auto_18652 ?auto_18657 ) ) ( not ( = ?auto_18653 ?auto_18657 ) ) ( not ( = ?auto_18666 ?auto_18657 ) ) ( not ( = ?auto_18660 ?auto_18657 ) ) ( SURFACE-AT ?auto_18658 ?auto_18654 ) ( CLEAR ?auto_18658 ) ( IS-CRATE ?auto_18666 ) ( not ( = ?auto_18658 ?auto_18666 ) ) ( not ( = ?auto_18652 ?auto_18658 ) ) ( not ( = ?auto_18653 ?auto_18658 ) ) ( not ( = ?auto_18660 ?auto_18658 ) ) ( not ( = ?auto_18657 ?auto_18658 ) ) ( AVAILABLE ?auto_18659 ) ( TRUCK-AT ?auto_18656 ?auto_18662 ) ( not ( = ?auto_18662 ?auto_18654 ) ) ( not ( = ?auto_18663 ?auto_18662 ) ) ( not ( = ?auto_18664 ?auto_18662 ) ) ( HOIST-AT ?auto_18665 ?auto_18662 ) ( not ( = ?auto_18659 ?auto_18665 ) ) ( not ( = ?auto_18655 ?auto_18665 ) ) ( not ( = ?auto_18661 ?auto_18665 ) ) ( AVAILABLE ?auto_18665 ) ( SURFACE-AT ?auto_18666 ?auto_18662 ) ( ON ?auto_18666 ?auto_18667 ) ( CLEAR ?auto_18666 ) ( not ( = ?auto_18652 ?auto_18667 ) ) ( not ( = ?auto_18653 ?auto_18667 ) ) ( not ( = ?auto_18666 ?auto_18667 ) ) ( not ( = ?auto_18660 ?auto_18667 ) ) ( not ( = ?auto_18657 ?auto_18667 ) ) ( not ( = ?auto_18658 ?auto_18667 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18665 ?auto_18666 ?auto_18667 ?auto_18662 )
      ( MAKE-2CRATE ?auto_18666 ?auto_18652 ?auto_18653 )
      ( MAKE-1CRATE-VERIFY ?auto_18652 ?auto_18653 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18668 - SURFACE
      ?auto_18669 - SURFACE
      ?auto_18670 - SURFACE
    )
    :vars
    (
      ?auto_18673 - HOIST
      ?auto_18683 - PLACE
      ?auto_18675 - PLACE
      ?auto_18682 - HOIST
      ?auto_18680 - SURFACE
      ?auto_18679 - PLACE
      ?auto_18677 - HOIST
      ?auto_18676 - SURFACE
      ?auto_18678 - SURFACE
      ?auto_18674 - TRUCK
      ?auto_18671 - PLACE
      ?auto_18672 - HOIST
      ?auto_18681 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18673 ?auto_18683 ) ( IS-CRATE ?auto_18670 ) ( not ( = ?auto_18669 ?auto_18670 ) ) ( not ( = ?auto_18668 ?auto_18669 ) ) ( not ( = ?auto_18668 ?auto_18670 ) ) ( not ( = ?auto_18675 ?auto_18683 ) ) ( HOIST-AT ?auto_18682 ?auto_18675 ) ( not ( = ?auto_18673 ?auto_18682 ) ) ( AVAILABLE ?auto_18682 ) ( SURFACE-AT ?auto_18670 ?auto_18675 ) ( ON ?auto_18670 ?auto_18680 ) ( CLEAR ?auto_18670 ) ( not ( = ?auto_18669 ?auto_18680 ) ) ( not ( = ?auto_18670 ?auto_18680 ) ) ( not ( = ?auto_18668 ?auto_18680 ) ) ( IS-CRATE ?auto_18669 ) ( not ( = ?auto_18679 ?auto_18683 ) ) ( not ( = ?auto_18675 ?auto_18679 ) ) ( HOIST-AT ?auto_18677 ?auto_18679 ) ( not ( = ?auto_18673 ?auto_18677 ) ) ( not ( = ?auto_18682 ?auto_18677 ) ) ( AVAILABLE ?auto_18677 ) ( SURFACE-AT ?auto_18669 ?auto_18679 ) ( ON ?auto_18669 ?auto_18676 ) ( CLEAR ?auto_18669 ) ( not ( = ?auto_18669 ?auto_18676 ) ) ( not ( = ?auto_18670 ?auto_18676 ) ) ( not ( = ?auto_18668 ?auto_18676 ) ) ( not ( = ?auto_18680 ?auto_18676 ) ) ( SURFACE-AT ?auto_18678 ?auto_18683 ) ( CLEAR ?auto_18678 ) ( IS-CRATE ?auto_18668 ) ( not ( = ?auto_18678 ?auto_18668 ) ) ( not ( = ?auto_18669 ?auto_18678 ) ) ( not ( = ?auto_18670 ?auto_18678 ) ) ( not ( = ?auto_18680 ?auto_18678 ) ) ( not ( = ?auto_18676 ?auto_18678 ) ) ( AVAILABLE ?auto_18673 ) ( TRUCK-AT ?auto_18674 ?auto_18671 ) ( not ( = ?auto_18671 ?auto_18683 ) ) ( not ( = ?auto_18675 ?auto_18671 ) ) ( not ( = ?auto_18679 ?auto_18671 ) ) ( HOIST-AT ?auto_18672 ?auto_18671 ) ( not ( = ?auto_18673 ?auto_18672 ) ) ( not ( = ?auto_18682 ?auto_18672 ) ) ( not ( = ?auto_18677 ?auto_18672 ) ) ( AVAILABLE ?auto_18672 ) ( SURFACE-AT ?auto_18668 ?auto_18671 ) ( ON ?auto_18668 ?auto_18681 ) ( CLEAR ?auto_18668 ) ( not ( = ?auto_18669 ?auto_18681 ) ) ( not ( = ?auto_18670 ?auto_18681 ) ) ( not ( = ?auto_18668 ?auto_18681 ) ) ( not ( = ?auto_18680 ?auto_18681 ) ) ( not ( = ?auto_18676 ?auto_18681 ) ) ( not ( = ?auto_18678 ?auto_18681 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18669 ?auto_18670 )
      ( MAKE-2CRATE-VERIFY ?auto_18668 ?auto_18669 ?auto_18670 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18684 - SURFACE
      ?auto_18685 - SURFACE
      ?auto_18686 - SURFACE
      ?auto_18687 - SURFACE
    )
    :vars
    (
      ?auto_18696 - HOIST
      ?auto_18692 - PLACE
      ?auto_18694 - PLACE
      ?auto_18697 - HOIST
      ?auto_18688 - SURFACE
      ?auto_18691 - PLACE
      ?auto_18689 - HOIST
      ?auto_18693 - SURFACE
      ?auto_18695 - TRUCK
      ?auto_18690 - PLACE
      ?auto_18699 - HOIST
      ?auto_18698 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18696 ?auto_18692 ) ( IS-CRATE ?auto_18687 ) ( not ( = ?auto_18686 ?auto_18687 ) ) ( not ( = ?auto_18685 ?auto_18686 ) ) ( not ( = ?auto_18685 ?auto_18687 ) ) ( not ( = ?auto_18694 ?auto_18692 ) ) ( HOIST-AT ?auto_18697 ?auto_18694 ) ( not ( = ?auto_18696 ?auto_18697 ) ) ( AVAILABLE ?auto_18697 ) ( SURFACE-AT ?auto_18687 ?auto_18694 ) ( ON ?auto_18687 ?auto_18688 ) ( CLEAR ?auto_18687 ) ( not ( = ?auto_18686 ?auto_18688 ) ) ( not ( = ?auto_18687 ?auto_18688 ) ) ( not ( = ?auto_18685 ?auto_18688 ) ) ( IS-CRATE ?auto_18686 ) ( not ( = ?auto_18691 ?auto_18692 ) ) ( not ( = ?auto_18694 ?auto_18691 ) ) ( HOIST-AT ?auto_18689 ?auto_18691 ) ( not ( = ?auto_18696 ?auto_18689 ) ) ( not ( = ?auto_18697 ?auto_18689 ) ) ( AVAILABLE ?auto_18689 ) ( SURFACE-AT ?auto_18686 ?auto_18691 ) ( ON ?auto_18686 ?auto_18693 ) ( CLEAR ?auto_18686 ) ( not ( = ?auto_18686 ?auto_18693 ) ) ( not ( = ?auto_18687 ?auto_18693 ) ) ( not ( = ?auto_18685 ?auto_18693 ) ) ( not ( = ?auto_18688 ?auto_18693 ) ) ( SURFACE-AT ?auto_18684 ?auto_18692 ) ( CLEAR ?auto_18684 ) ( IS-CRATE ?auto_18685 ) ( not ( = ?auto_18684 ?auto_18685 ) ) ( not ( = ?auto_18686 ?auto_18684 ) ) ( not ( = ?auto_18687 ?auto_18684 ) ) ( not ( = ?auto_18688 ?auto_18684 ) ) ( not ( = ?auto_18693 ?auto_18684 ) ) ( AVAILABLE ?auto_18696 ) ( TRUCK-AT ?auto_18695 ?auto_18690 ) ( not ( = ?auto_18690 ?auto_18692 ) ) ( not ( = ?auto_18694 ?auto_18690 ) ) ( not ( = ?auto_18691 ?auto_18690 ) ) ( HOIST-AT ?auto_18699 ?auto_18690 ) ( not ( = ?auto_18696 ?auto_18699 ) ) ( not ( = ?auto_18697 ?auto_18699 ) ) ( not ( = ?auto_18689 ?auto_18699 ) ) ( AVAILABLE ?auto_18699 ) ( SURFACE-AT ?auto_18685 ?auto_18690 ) ( ON ?auto_18685 ?auto_18698 ) ( CLEAR ?auto_18685 ) ( not ( = ?auto_18686 ?auto_18698 ) ) ( not ( = ?auto_18687 ?auto_18698 ) ) ( not ( = ?auto_18685 ?auto_18698 ) ) ( not ( = ?auto_18688 ?auto_18698 ) ) ( not ( = ?auto_18693 ?auto_18698 ) ) ( not ( = ?auto_18684 ?auto_18698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18685 ?auto_18686 ?auto_18687 )
      ( MAKE-3CRATE-VERIFY ?auto_18684 ?auto_18685 ?auto_18686 ?auto_18687 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18700 - SURFACE
      ?auto_18701 - SURFACE
      ?auto_18702 - SURFACE
      ?auto_18703 - SURFACE
      ?auto_18704 - SURFACE
    )
    :vars
    (
      ?auto_18713 - HOIST
      ?auto_18709 - PLACE
      ?auto_18711 - PLACE
      ?auto_18714 - HOIST
      ?auto_18705 - SURFACE
      ?auto_18708 - PLACE
      ?auto_18706 - HOIST
      ?auto_18710 - SURFACE
      ?auto_18712 - TRUCK
      ?auto_18707 - PLACE
      ?auto_18716 - HOIST
      ?auto_18715 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18713 ?auto_18709 ) ( IS-CRATE ?auto_18704 ) ( not ( = ?auto_18703 ?auto_18704 ) ) ( not ( = ?auto_18702 ?auto_18703 ) ) ( not ( = ?auto_18702 ?auto_18704 ) ) ( not ( = ?auto_18711 ?auto_18709 ) ) ( HOIST-AT ?auto_18714 ?auto_18711 ) ( not ( = ?auto_18713 ?auto_18714 ) ) ( AVAILABLE ?auto_18714 ) ( SURFACE-AT ?auto_18704 ?auto_18711 ) ( ON ?auto_18704 ?auto_18705 ) ( CLEAR ?auto_18704 ) ( not ( = ?auto_18703 ?auto_18705 ) ) ( not ( = ?auto_18704 ?auto_18705 ) ) ( not ( = ?auto_18702 ?auto_18705 ) ) ( IS-CRATE ?auto_18703 ) ( not ( = ?auto_18708 ?auto_18709 ) ) ( not ( = ?auto_18711 ?auto_18708 ) ) ( HOIST-AT ?auto_18706 ?auto_18708 ) ( not ( = ?auto_18713 ?auto_18706 ) ) ( not ( = ?auto_18714 ?auto_18706 ) ) ( AVAILABLE ?auto_18706 ) ( SURFACE-AT ?auto_18703 ?auto_18708 ) ( ON ?auto_18703 ?auto_18710 ) ( CLEAR ?auto_18703 ) ( not ( = ?auto_18703 ?auto_18710 ) ) ( not ( = ?auto_18704 ?auto_18710 ) ) ( not ( = ?auto_18702 ?auto_18710 ) ) ( not ( = ?auto_18705 ?auto_18710 ) ) ( SURFACE-AT ?auto_18701 ?auto_18709 ) ( CLEAR ?auto_18701 ) ( IS-CRATE ?auto_18702 ) ( not ( = ?auto_18701 ?auto_18702 ) ) ( not ( = ?auto_18703 ?auto_18701 ) ) ( not ( = ?auto_18704 ?auto_18701 ) ) ( not ( = ?auto_18705 ?auto_18701 ) ) ( not ( = ?auto_18710 ?auto_18701 ) ) ( AVAILABLE ?auto_18713 ) ( TRUCK-AT ?auto_18712 ?auto_18707 ) ( not ( = ?auto_18707 ?auto_18709 ) ) ( not ( = ?auto_18711 ?auto_18707 ) ) ( not ( = ?auto_18708 ?auto_18707 ) ) ( HOIST-AT ?auto_18716 ?auto_18707 ) ( not ( = ?auto_18713 ?auto_18716 ) ) ( not ( = ?auto_18714 ?auto_18716 ) ) ( not ( = ?auto_18706 ?auto_18716 ) ) ( AVAILABLE ?auto_18716 ) ( SURFACE-AT ?auto_18702 ?auto_18707 ) ( ON ?auto_18702 ?auto_18715 ) ( CLEAR ?auto_18702 ) ( not ( = ?auto_18703 ?auto_18715 ) ) ( not ( = ?auto_18704 ?auto_18715 ) ) ( not ( = ?auto_18702 ?auto_18715 ) ) ( not ( = ?auto_18705 ?auto_18715 ) ) ( not ( = ?auto_18710 ?auto_18715 ) ) ( not ( = ?auto_18701 ?auto_18715 ) ) ( ON ?auto_18701 ?auto_18700 ) ( not ( = ?auto_18700 ?auto_18701 ) ) ( not ( = ?auto_18700 ?auto_18702 ) ) ( not ( = ?auto_18700 ?auto_18703 ) ) ( not ( = ?auto_18700 ?auto_18704 ) ) ( not ( = ?auto_18700 ?auto_18705 ) ) ( not ( = ?auto_18700 ?auto_18710 ) ) ( not ( = ?auto_18700 ?auto_18715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18702 ?auto_18703 ?auto_18704 )
      ( MAKE-4CRATE-VERIFY ?auto_18700 ?auto_18701 ?auto_18702 ?auto_18703 ?auto_18704 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18717 - SURFACE
      ?auto_18718 - SURFACE
      ?auto_18719 - SURFACE
      ?auto_18720 - SURFACE
      ?auto_18721 - SURFACE
      ?auto_18722 - SURFACE
    )
    :vars
    (
      ?auto_18731 - HOIST
      ?auto_18727 - PLACE
      ?auto_18729 - PLACE
      ?auto_18732 - HOIST
      ?auto_18723 - SURFACE
      ?auto_18726 - PLACE
      ?auto_18724 - HOIST
      ?auto_18728 - SURFACE
      ?auto_18730 - TRUCK
      ?auto_18725 - PLACE
      ?auto_18734 - HOIST
      ?auto_18733 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18731 ?auto_18727 ) ( IS-CRATE ?auto_18722 ) ( not ( = ?auto_18721 ?auto_18722 ) ) ( not ( = ?auto_18720 ?auto_18721 ) ) ( not ( = ?auto_18720 ?auto_18722 ) ) ( not ( = ?auto_18729 ?auto_18727 ) ) ( HOIST-AT ?auto_18732 ?auto_18729 ) ( not ( = ?auto_18731 ?auto_18732 ) ) ( AVAILABLE ?auto_18732 ) ( SURFACE-AT ?auto_18722 ?auto_18729 ) ( ON ?auto_18722 ?auto_18723 ) ( CLEAR ?auto_18722 ) ( not ( = ?auto_18721 ?auto_18723 ) ) ( not ( = ?auto_18722 ?auto_18723 ) ) ( not ( = ?auto_18720 ?auto_18723 ) ) ( IS-CRATE ?auto_18721 ) ( not ( = ?auto_18726 ?auto_18727 ) ) ( not ( = ?auto_18729 ?auto_18726 ) ) ( HOIST-AT ?auto_18724 ?auto_18726 ) ( not ( = ?auto_18731 ?auto_18724 ) ) ( not ( = ?auto_18732 ?auto_18724 ) ) ( AVAILABLE ?auto_18724 ) ( SURFACE-AT ?auto_18721 ?auto_18726 ) ( ON ?auto_18721 ?auto_18728 ) ( CLEAR ?auto_18721 ) ( not ( = ?auto_18721 ?auto_18728 ) ) ( not ( = ?auto_18722 ?auto_18728 ) ) ( not ( = ?auto_18720 ?auto_18728 ) ) ( not ( = ?auto_18723 ?auto_18728 ) ) ( SURFACE-AT ?auto_18719 ?auto_18727 ) ( CLEAR ?auto_18719 ) ( IS-CRATE ?auto_18720 ) ( not ( = ?auto_18719 ?auto_18720 ) ) ( not ( = ?auto_18721 ?auto_18719 ) ) ( not ( = ?auto_18722 ?auto_18719 ) ) ( not ( = ?auto_18723 ?auto_18719 ) ) ( not ( = ?auto_18728 ?auto_18719 ) ) ( AVAILABLE ?auto_18731 ) ( TRUCK-AT ?auto_18730 ?auto_18725 ) ( not ( = ?auto_18725 ?auto_18727 ) ) ( not ( = ?auto_18729 ?auto_18725 ) ) ( not ( = ?auto_18726 ?auto_18725 ) ) ( HOIST-AT ?auto_18734 ?auto_18725 ) ( not ( = ?auto_18731 ?auto_18734 ) ) ( not ( = ?auto_18732 ?auto_18734 ) ) ( not ( = ?auto_18724 ?auto_18734 ) ) ( AVAILABLE ?auto_18734 ) ( SURFACE-AT ?auto_18720 ?auto_18725 ) ( ON ?auto_18720 ?auto_18733 ) ( CLEAR ?auto_18720 ) ( not ( = ?auto_18721 ?auto_18733 ) ) ( not ( = ?auto_18722 ?auto_18733 ) ) ( not ( = ?auto_18720 ?auto_18733 ) ) ( not ( = ?auto_18723 ?auto_18733 ) ) ( not ( = ?auto_18728 ?auto_18733 ) ) ( not ( = ?auto_18719 ?auto_18733 ) ) ( ON ?auto_18718 ?auto_18717 ) ( ON ?auto_18719 ?auto_18718 ) ( not ( = ?auto_18717 ?auto_18718 ) ) ( not ( = ?auto_18717 ?auto_18719 ) ) ( not ( = ?auto_18717 ?auto_18720 ) ) ( not ( = ?auto_18717 ?auto_18721 ) ) ( not ( = ?auto_18717 ?auto_18722 ) ) ( not ( = ?auto_18717 ?auto_18723 ) ) ( not ( = ?auto_18717 ?auto_18728 ) ) ( not ( = ?auto_18717 ?auto_18733 ) ) ( not ( = ?auto_18718 ?auto_18719 ) ) ( not ( = ?auto_18718 ?auto_18720 ) ) ( not ( = ?auto_18718 ?auto_18721 ) ) ( not ( = ?auto_18718 ?auto_18722 ) ) ( not ( = ?auto_18718 ?auto_18723 ) ) ( not ( = ?auto_18718 ?auto_18728 ) ) ( not ( = ?auto_18718 ?auto_18733 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18720 ?auto_18721 ?auto_18722 )
      ( MAKE-5CRATE-VERIFY ?auto_18717 ?auto_18718 ?auto_18719 ?auto_18720 ?auto_18721 ?auto_18722 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18735 - SURFACE
      ?auto_18736 - SURFACE
    )
    :vars
    (
      ?auto_18746 - HOIST
      ?auto_18742 - PLACE
      ?auto_18750 - SURFACE
      ?auto_18744 - PLACE
      ?auto_18747 - HOIST
      ?auto_18737 - SURFACE
      ?auto_18741 - PLACE
      ?auto_18739 - HOIST
      ?auto_18743 - SURFACE
      ?auto_18738 - SURFACE
      ?auto_18740 - PLACE
      ?auto_18749 - HOIST
      ?auto_18748 - SURFACE
      ?auto_18745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18746 ?auto_18742 ) ( IS-CRATE ?auto_18736 ) ( not ( = ?auto_18735 ?auto_18736 ) ) ( not ( = ?auto_18750 ?auto_18735 ) ) ( not ( = ?auto_18750 ?auto_18736 ) ) ( not ( = ?auto_18744 ?auto_18742 ) ) ( HOIST-AT ?auto_18747 ?auto_18744 ) ( not ( = ?auto_18746 ?auto_18747 ) ) ( AVAILABLE ?auto_18747 ) ( SURFACE-AT ?auto_18736 ?auto_18744 ) ( ON ?auto_18736 ?auto_18737 ) ( CLEAR ?auto_18736 ) ( not ( = ?auto_18735 ?auto_18737 ) ) ( not ( = ?auto_18736 ?auto_18737 ) ) ( not ( = ?auto_18750 ?auto_18737 ) ) ( IS-CRATE ?auto_18735 ) ( not ( = ?auto_18741 ?auto_18742 ) ) ( not ( = ?auto_18744 ?auto_18741 ) ) ( HOIST-AT ?auto_18739 ?auto_18741 ) ( not ( = ?auto_18746 ?auto_18739 ) ) ( not ( = ?auto_18747 ?auto_18739 ) ) ( AVAILABLE ?auto_18739 ) ( SURFACE-AT ?auto_18735 ?auto_18741 ) ( ON ?auto_18735 ?auto_18743 ) ( CLEAR ?auto_18735 ) ( not ( = ?auto_18735 ?auto_18743 ) ) ( not ( = ?auto_18736 ?auto_18743 ) ) ( not ( = ?auto_18750 ?auto_18743 ) ) ( not ( = ?auto_18737 ?auto_18743 ) ) ( SURFACE-AT ?auto_18738 ?auto_18742 ) ( CLEAR ?auto_18738 ) ( IS-CRATE ?auto_18750 ) ( not ( = ?auto_18738 ?auto_18750 ) ) ( not ( = ?auto_18735 ?auto_18738 ) ) ( not ( = ?auto_18736 ?auto_18738 ) ) ( not ( = ?auto_18737 ?auto_18738 ) ) ( not ( = ?auto_18743 ?auto_18738 ) ) ( AVAILABLE ?auto_18746 ) ( not ( = ?auto_18740 ?auto_18742 ) ) ( not ( = ?auto_18744 ?auto_18740 ) ) ( not ( = ?auto_18741 ?auto_18740 ) ) ( HOIST-AT ?auto_18749 ?auto_18740 ) ( not ( = ?auto_18746 ?auto_18749 ) ) ( not ( = ?auto_18747 ?auto_18749 ) ) ( not ( = ?auto_18739 ?auto_18749 ) ) ( AVAILABLE ?auto_18749 ) ( SURFACE-AT ?auto_18750 ?auto_18740 ) ( ON ?auto_18750 ?auto_18748 ) ( CLEAR ?auto_18750 ) ( not ( = ?auto_18735 ?auto_18748 ) ) ( not ( = ?auto_18736 ?auto_18748 ) ) ( not ( = ?auto_18750 ?auto_18748 ) ) ( not ( = ?auto_18737 ?auto_18748 ) ) ( not ( = ?auto_18743 ?auto_18748 ) ) ( not ( = ?auto_18738 ?auto_18748 ) ) ( TRUCK-AT ?auto_18745 ?auto_18742 ) )
    :subtasks
    ( ( !DRIVE ?auto_18745 ?auto_18742 ?auto_18740 )
      ( MAKE-2CRATE ?auto_18750 ?auto_18735 ?auto_18736 )
      ( MAKE-1CRATE-VERIFY ?auto_18735 ?auto_18736 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18751 - SURFACE
      ?auto_18752 - SURFACE
      ?auto_18753 - SURFACE
    )
    :vars
    (
      ?auto_18762 - HOIST
      ?auto_18761 - PLACE
      ?auto_18759 - PLACE
      ?auto_18760 - HOIST
      ?auto_18754 - SURFACE
      ?auto_18763 - PLACE
      ?auto_18765 - HOIST
      ?auto_18764 - SURFACE
      ?auto_18756 - SURFACE
      ?auto_18757 - PLACE
      ?auto_18758 - HOIST
      ?auto_18766 - SURFACE
      ?auto_18755 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18762 ?auto_18761 ) ( IS-CRATE ?auto_18753 ) ( not ( = ?auto_18752 ?auto_18753 ) ) ( not ( = ?auto_18751 ?auto_18752 ) ) ( not ( = ?auto_18751 ?auto_18753 ) ) ( not ( = ?auto_18759 ?auto_18761 ) ) ( HOIST-AT ?auto_18760 ?auto_18759 ) ( not ( = ?auto_18762 ?auto_18760 ) ) ( AVAILABLE ?auto_18760 ) ( SURFACE-AT ?auto_18753 ?auto_18759 ) ( ON ?auto_18753 ?auto_18754 ) ( CLEAR ?auto_18753 ) ( not ( = ?auto_18752 ?auto_18754 ) ) ( not ( = ?auto_18753 ?auto_18754 ) ) ( not ( = ?auto_18751 ?auto_18754 ) ) ( IS-CRATE ?auto_18752 ) ( not ( = ?auto_18763 ?auto_18761 ) ) ( not ( = ?auto_18759 ?auto_18763 ) ) ( HOIST-AT ?auto_18765 ?auto_18763 ) ( not ( = ?auto_18762 ?auto_18765 ) ) ( not ( = ?auto_18760 ?auto_18765 ) ) ( AVAILABLE ?auto_18765 ) ( SURFACE-AT ?auto_18752 ?auto_18763 ) ( ON ?auto_18752 ?auto_18764 ) ( CLEAR ?auto_18752 ) ( not ( = ?auto_18752 ?auto_18764 ) ) ( not ( = ?auto_18753 ?auto_18764 ) ) ( not ( = ?auto_18751 ?auto_18764 ) ) ( not ( = ?auto_18754 ?auto_18764 ) ) ( SURFACE-AT ?auto_18756 ?auto_18761 ) ( CLEAR ?auto_18756 ) ( IS-CRATE ?auto_18751 ) ( not ( = ?auto_18756 ?auto_18751 ) ) ( not ( = ?auto_18752 ?auto_18756 ) ) ( not ( = ?auto_18753 ?auto_18756 ) ) ( not ( = ?auto_18754 ?auto_18756 ) ) ( not ( = ?auto_18764 ?auto_18756 ) ) ( AVAILABLE ?auto_18762 ) ( not ( = ?auto_18757 ?auto_18761 ) ) ( not ( = ?auto_18759 ?auto_18757 ) ) ( not ( = ?auto_18763 ?auto_18757 ) ) ( HOIST-AT ?auto_18758 ?auto_18757 ) ( not ( = ?auto_18762 ?auto_18758 ) ) ( not ( = ?auto_18760 ?auto_18758 ) ) ( not ( = ?auto_18765 ?auto_18758 ) ) ( AVAILABLE ?auto_18758 ) ( SURFACE-AT ?auto_18751 ?auto_18757 ) ( ON ?auto_18751 ?auto_18766 ) ( CLEAR ?auto_18751 ) ( not ( = ?auto_18752 ?auto_18766 ) ) ( not ( = ?auto_18753 ?auto_18766 ) ) ( not ( = ?auto_18751 ?auto_18766 ) ) ( not ( = ?auto_18754 ?auto_18766 ) ) ( not ( = ?auto_18764 ?auto_18766 ) ) ( not ( = ?auto_18756 ?auto_18766 ) ) ( TRUCK-AT ?auto_18755 ?auto_18761 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18752 ?auto_18753 )
      ( MAKE-2CRATE-VERIFY ?auto_18751 ?auto_18752 ?auto_18753 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18767 - SURFACE
      ?auto_18768 - SURFACE
      ?auto_18769 - SURFACE
      ?auto_18770 - SURFACE
    )
    :vars
    (
      ?auto_18780 - HOIST
      ?auto_18779 - PLACE
      ?auto_18781 - PLACE
      ?auto_18772 - HOIST
      ?auto_18777 - SURFACE
      ?auto_18773 - PLACE
      ?auto_18775 - HOIST
      ?auto_18776 - SURFACE
      ?auto_18782 - PLACE
      ?auto_18778 - HOIST
      ?auto_18774 - SURFACE
      ?auto_18771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18780 ?auto_18779 ) ( IS-CRATE ?auto_18770 ) ( not ( = ?auto_18769 ?auto_18770 ) ) ( not ( = ?auto_18768 ?auto_18769 ) ) ( not ( = ?auto_18768 ?auto_18770 ) ) ( not ( = ?auto_18781 ?auto_18779 ) ) ( HOIST-AT ?auto_18772 ?auto_18781 ) ( not ( = ?auto_18780 ?auto_18772 ) ) ( AVAILABLE ?auto_18772 ) ( SURFACE-AT ?auto_18770 ?auto_18781 ) ( ON ?auto_18770 ?auto_18777 ) ( CLEAR ?auto_18770 ) ( not ( = ?auto_18769 ?auto_18777 ) ) ( not ( = ?auto_18770 ?auto_18777 ) ) ( not ( = ?auto_18768 ?auto_18777 ) ) ( IS-CRATE ?auto_18769 ) ( not ( = ?auto_18773 ?auto_18779 ) ) ( not ( = ?auto_18781 ?auto_18773 ) ) ( HOIST-AT ?auto_18775 ?auto_18773 ) ( not ( = ?auto_18780 ?auto_18775 ) ) ( not ( = ?auto_18772 ?auto_18775 ) ) ( AVAILABLE ?auto_18775 ) ( SURFACE-AT ?auto_18769 ?auto_18773 ) ( ON ?auto_18769 ?auto_18776 ) ( CLEAR ?auto_18769 ) ( not ( = ?auto_18769 ?auto_18776 ) ) ( not ( = ?auto_18770 ?auto_18776 ) ) ( not ( = ?auto_18768 ?auto_18776 ) ) ( not ( = ?auto_18777 ?auto_18776 ) ) ( SURFACE-AT ?auto_18767 ?auto_18779 ) ( CLEAR ?auto_18767 ) ( IS-CRATE ?auto_18768 ) ( not ( = ?auto_18767 ?auto_18768 ) ) ( not ( = ?auto_18769 ?auto_18767 ) ) ( not ( = ?auto_18770 ?auto_18767 ) ) ( not ( = ?auto_18777 ?auto_18767 ) ) ( not ( = ?auto_18776 ?auto_18767 ) ) ( AVAILABLE ?auto_18780 ) ( not ( = ?auto_18782 ?auto_18779 ) ) ( not ( = ?auto_18781 ?auto_18782 ) ) ( not ( = ?auto_18773 ?auto_18782 ) ) ( HOIST-AT ?auto_18778 ?auto_18782 ) ( not ( = ?auto_18780 ?auto_18778 ) ) ( not ( = ?auto_18772 ?auto_18778 ) ) ( not ( = ?auto_18775 ?auto_18778 ) ) ( AVAILABLE ?auto_18778 ) ( SURFACE-AT ?auto_18768 ?auto_18782 ) ( ON ?auto_18768 ?auto_18774 ) ( CLEAR ?auto_18768 ) ( not ( = ?auto_18769 ?auto_18774 ) ) ( not ( = ?auto_18770 ?auto_18774 ) ) ( not ( = ?auto_18768 ?auto_18774 ) ) ( not ( = ?auto_18777 ?auto_18774 ) ) ( not ( = ?auto_18776 ?auto_18774 ) ) ( not ( = ?auto_18767 ?auto_18774 ) ) ( TRUCK-AT ?auto_18771 ?auto_18779 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18768 ?auto_18769 ?auto_18770 )
      ( MAKE-3CRATE-VERIFY ?auto_18767 ?auto_18768 ?auto_18769 ?auto_18770 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18783 - SURFACE
      ?auto_18784 - SURFACE
      ?auto_18785 - SURFACE
      ?auto_18786 - SURFACE
      ?auto_18787 - SURFACE
    )
    :vars
    (
      ?auto_18797 - HOIST
      ?auto_18796 - PLACE
      ?auto_18798 - PLACE
      ?auto_18789 - HOIST
      ?auto_18794 - SURFACE
      ?auto_18790 - PLACE
      ?auto_18792 - HOIST
      ?auto_18793 - SURFACE
      ?auto_18799 - PLACE
      ?auto_18795 - HOIST
      ?auto_18791 - SURFACE
      ?auto_18788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18797 ?auto_18796 ) ( IS-CRATE ?auto_18787 ) ( not ( = ?auto_18786 ?auto_18787 ) ) ( not ( = ?auto_18785 ?auto_18786 ) ) ( not ( = ?auto_18785 ?auto_18787 ) ) ( not ( = ?auto_18798 ?auto_18796 ) ) ( HOIST-AT ?auto_18789 ?auto_18798 ) ( not ( = ?auto_18797 ?auto_18789 ) ) ( AVAILABLE ?auto_18789 ) ( SURFACE-AT ?auto_18787 ?auto_18798 ) ( ON ?auto_18787 ?auto_18794 ) ( CLEAR ?auto_18787 ) ( not ( = ?auto_18786 ?auto_18794 ) ) ( not ( = ?auto_18787 ?auto_18794 ) ) ( not ( = ?auto_18785 ?auto_18794 ) ) ( IS-CRATE ?auto_18786 ) ( not ( = ?auto_18790 ?auto_18796 ) ) ( not ( = ?auto_18798 ?auto_18790 ) ) ( HOIST-AT ?auto_18792 ?auto_18790 ) ( not ( = ?auto_18797 ?auto_18792 ) ) ( not ( = ?auto_18789 ?auto_18792 ) ) ( AVAILABLE ?auto_18792 ) ( SURFACE-AT ?auto_18786 ?auto_18790 ) ( ON ?auto_18786 ?auto_18793 ) ( CLEAR ?auto_18786 ) ( not ( = ?auto_18786 ?auto_18793 ) ) ( not ( = ?auto_18787 ?auto_18793 ) ) ( not ( = ?auto_18785 ?auto_18793 ) ) ( not ( = ?auto_18794 ?auto_18793 ) ) ( SURFACE-AT ?auto_18784 ?auto_18796 ) ( CLEAR ?auto_18784 ) ( IS-CRATE ?auto_18785 ) ( not ( = ?auto_18784 ?auto_18785 ) ) ( not ( = ?auto_18786 ?auto_18784 ) ) ( not ( = ?auto_18787 ?auto_18784 ) ) ( not ( = ?auto_18794 ?auto_18784 ) ) ( not ( = ?auto_18793 ?auto_18784 ) ) ( AVAILABLE ?auto_18797 ) ( not ( = ?auto_18799 ?auto_18796 ) ) ( not ( = ?auto_18798 ?auto_18799 ) ) ( not ( = ?auto_18790 ?auto_18799 ) ) ( HOIST-AT ?auto_18795 ?auto_18799 ) ( not ( = ?auto_18797 ?auto_18795 ) ) ( not ( = ?auto_18789 ?auto_18795 ) ) ( not ( = ?auto_18792 ?auto_18795 ) ) ( AVAILABLE ?auto_18795 ) ( SURFACE-AT ?auto_18785 ?auto_18799 ) ( ON ?auto_18785 ?auto_18791 ) ( CLEAR ?auto_18785 ) ( not ( = ?auto_18786 ?auto_18791 ) ) ( not ( = ?auto_18787 ?auto_18791 ) ) ( not ( = ?auto_18785 ?auto_18791 ) ) ( not ( = ?auto_18794 ?auto_18791 ) ) ( not ( = ?auto_18793 ?auto_18791 ) ) ( not ( = ?auto_18784 ?auto_18791 ) ) ( TRUCK-AT ?auto_18788 ?auto_18796 ) ( ON ?auto_18784 ?auto_18783 ) ( not ( = ?auto_18783 ?auto_18784 ) ) ( not ( = ?auto_18783 ?auto_18785 ) ) ( not ( = ?auto_18783 ?auto_18786 ) ) ( not ( = ?auto_18783 ?auto_18787 ) ) ( not ( = ?auto_18783 ?auto_18794 ) ) ( not ( = ?auto_18783 ?auto_18793 ) ) ( not ( = ?auto_18783 ?auto_18791 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18785 ?auto_18786 ?auto_18787 )
      ( MAKE-4CRATE-VERIFY ?auto_18783 ?auto_18784 ?auto_18785 ?auto_18786 ?auto_18787 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18800 - SURFACE
      ?auto_18801 - SURFACE
      ?auto_18802 - SURFACE
      ?auto_18803 - SURFACE
      ?auto_18804 - SURFACE
      ?auto_18805 - SURFACE
    )
    :vars
    (
      ?auto_18815 - HOIST
      ?auto_18814 - PLACE
      ?auto_18816 - PLACE
      ?auto_18807 - HOIST
      ?auto_18812 - SURFACE
      ?auto_18808 - PLACE
      ?auto_18810 - HOIST
      ?auto_18811 - SURFACE
      ?auto_18817 - PLACE
      ?auto_18813 - HOIST
      ?auto_18809 - SURFACE
      ?auto_18806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18815 ?auto_18814 ) ( IS-CRATE ?auto_18805 ) ( not ( = ?auto_18804 ?auto_18805 ) ) ( not ( = ?auto_18803 ?auto_18804 ) ) ( not ( = ?auto_18803 ?auto_18805 ) ) ( not ( = ?auto_18816 ?auto_18814 ) ) ( HOIST-AT ?auto_18807 ?auto_18816 ) ( not ( = ?auto_18815 ?auto_18807 ) ) ( AVAILABLE ?auto_18807 ) ( SURFACE-AT ?auto_18805 ?auto_18816 ) ( ON ?auto_18805 ?auto_18812 ) ( CLEAR ?auto_18805 ) ( not ( = ?auto_18804 ?auto_18812 ) ) ( not ( = ?auto_18805 ?auto_18812 ) ) ( not ( = ?auto_18803 ?auto_18812 ) ) ( IS-CRATE ?auto_18804 ) ( not ( = ?auto_18808 ?auto_18814 ) ) ( not ( = ?auto_18816 ?auto_18808 ) ) ( HOIST-AT ?auto_18810 ?auto_18808 ) ( not ( = ?auto_18815 ?auto_18810 ) ) ( not ( = ?auto_18807 ?auto_18810 ) ) ( AVAILABLE ?auto_18810 ) ( SURFACE-AT ?auto_18804 ?auto_18808 ) ( ON ?auto_18804 ?auto_18811 ) ( CLEAR ?auto_18804 ) ( not ( = ?auto_18804 ?auto_18811 ) ) ( not ( = ?auto_18805 ?auto_18811 ) ) ( not ( = ?auto_18803 ?auto_18811 ) ) ( not ( = ?auto_18812 ?auto_18811 ) ) ( SURFACE-AT ?auto_18802 ?auto_18814 ) ( CLEAR ?auto_18802 ) ( IS-CRATE ?auto_18803 ) ( not ( = ?auto_18802 ?auto_18803 ) ) ( not ( = ?auto_18804 ?auto_18802 ) ) ( not ( = ?auto_18805 ?auto_18802 ) ) ( not ( = ?auto_18812 ?auto_18802 ) ) ( not ( = ?auto_18811 ?auto_18802 ) ) ( AVAILABLE ?auto_18815 ) ( not ( = ?auto_18817 ?auto_18814 ) ) ( not ( = ?auto_18816 ?auto_18817 ) ) ( not ( = ?auto_18808 ?auto_18817 ) ) ( HOIST-AT ?auto_18813 ?auto_18817 ) ( not ( = ?auto_18815 ?auto_18813 ) ) ( not ( = ?auto_18807 ?auto_18813 ) ) ( not ( = ?auto_18810 ?auto_18813 ) ) ( AVAILABLE ?auto_18813 ) ( SURFACE-AT ?auto_18803 ?auto_18817 ) ( ON ?auto_18803 ?auto_18809 ) ( CLEAR ?auto_18803 ) ( not ( = ?auto_18804 ?auto_18809 ) ) ( not ( = ?auto_18805 ?auto_18809 ) ) ( not ( = ?auto_18803 ?auto_18809 ) ) ( not ( = ?auto_18812 ?auto_18809 ) ) ( not ( = ?auto_18811 ?auto_18809 ) ) ( not ( = ?auto_18802 ?auto_18809 ) ) ( TRUCK-AT ?auto_18806 ?auto_18814 ) ( ON ?auto_18801 ?auto_18800 ) ( ON ?auto_18802 ?auto_18801 ) ( not ( = ?auto_18800 ?auto_18801 ) ) ( not ( = ?auto_18800 ?auto_18802 ) ) ( not ( = ?auto_18800 ?auto_18803 ) ) ( not ( = ?auto_18800 ?auto_18804 ) ) ( not ( = ?auto_18800 ?auto_18805 ) ) ( not ( = ?auto_18800 ?auto_18812 ) ) ( not ( = ?auto_18800 ?auto_18811 ) ) ( not ( = ?auto_18800 ?auto_18809 ) ) ( not ( = ?auto_18801 ?auto_18802 ) ) ( not ( = ?auto_18801 ?auto_18803 ) ) ( not ( = ?auto_18801 ?auto_18804 ) ) ( not ( = ?auto_18801 ?auto_18805 ) ) ( not ( = ?auto_18801 ?auto_18812 ) ) ( not ( = ?auto_18801 ?auto_18811 ) ) ( not ( = ?auto_18801 ?auto_18809 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18803 ?auto_18804 ?auto_18805 )
      ( MAKE-5CRATE-VERIFY ?auto_18800 ?auto_18801 ?auto_18802 ?auto_18803 ?auto_18804 ?auto_18805 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18818 - SURFACE
      ?auto_18819 - SURFACE
    )
    :vars
    (
      ?auto_18830 - HOIST
      ?auto_18829 - PLACE
      ?auto_18833 - SURFACE
      ?auto_18831 - PLACE
      ?auto_18821 - HOIST
      ?auto_18827 - SURFACE
      ?auto_18823 - PLACE
      ?auto_18825 - HOIST
      ?auto_18826 - SURFACE
      ?auto_18822 - SURFACE
      ?auto_18832 - PLACE
      ?auto_18828 - HOIST
      ?auto_18824 - SURFACE
      ?auto_18820 - TRUCK
      ?auto_18834 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18830 ?auto_18829 ) ( IS-CRATE ?auto_18819 ) ( not ( = ?auto_18818 ?auto_18819 ) ) ( not ( = ?auto_18833 ?auto_18818 ) ) ( not ( = ?auto_18833 ?auto_18819 ) ) ( not ( = ?auto_18831 ?auto_18829 ) ) ( HOIST-AT ?auto_18821 ?auto_18831 ) ( not ( = ?auto_18830 ?auto_18821 ) ) ( AVAILABLE ?auto_18821 ) ( SURFACE-AT ?auto_18819 ?auto_18831 ) ( ON ?auto_18819 ?auto_18827 ) ( CLEAR ?auto_18819 ) ( not ( = ?auto_18818 ?auto_18827 ) ) ( not ( = ?auto_18819 ?auto_18827 ) ) ( not ( = ?auto_18833 ?auto_18827 ) ) ( IS-CRATE ?auto_18818 ) ( not ( = ?auto_18823 ?auto_18829 ) ) ( not ( = ?auto_18831 ?auto_18823 ) ) ( HOIST-AT ?auto_18825 ?auto_18823 ) ( not ( = ?auto_18830 ?auto_18825 ) ) ( not ( = ?auto_18821 ?auto_18825 ) ) ( AVAILABLE ?auto_18825 ) ( SURFACE-AT ?auto_18818 ?auto_18823 ) ( ON ?auto_18818 ?auto_18826 ) ( CLEAR ?auto_18818 ) ( not ( = ?auto_18818 ?auto_18826 ) ) ( not ( = ?auto_18819 ?auto_18826 ) ) ( not ( = ?auto_18833 ?auto_18826 ) ) ( not ( = ?auto_18827 ?auto_18826 ) ) ( IS-CRATE ?auto_18833 ) ( not ( = ?auto_18822 ?auto_18833 ) ) ( not ( = ?auto_18818 ?auto_18822 ) ) ( not ( = ?auto_18819 ?auto_18822 ) ) ( not ( = ?auto_18827 ?auto_18822 ) ) ( not ( = ?auto_18826 ?auto_18822 ) ) ( not ( = ?auto_18832 ?auto_18829 ) ) ( not ( = ?auto_18831 ?auto_18832 ) ) ( not ( = ?auto_18823 ?auto_18832 ) ) ( HOIST-AT ?auto_18828 ?auto_18832 ) ( not ( = ?auto_18830 ?auto_18828 ) ) ( not ( = ?auto_18821 ?auto_18828 ) ) ( not ( = ?auto_18825 ?auto_18828 ) ) ( AVAILABLE ?auto_18828 ) ( SURFACE-AT ?auto_18833 ?auto_18832 ) ( ON ?auto_18833 ?auto_18824 ) ( CLEAR ?auto_18833 ) ( not ( = ?auto_18818 ?auto_18824 ) ) ( not ( = ?auto_18819 ?auto_18824 ) ) ( not ( = ?auto_18833 ?auto_18824 ) ) ( not ( = ?auto_18827 ?auto_18824 ) ) ( not ( = ?auto_18826 ?auto_18824 ) ) ( not ( = ?auto_18822 ?auto_18824 ) ) ( TRUCK-AT ?auto_18820 ?auto_18829 ) ( SURFACE-AT ?auto_18834 ?auto_18829 ) ( CLEAR ?auto_18834 ) ( LIFTING ?auto_18830 ?auto_18822 ) ( IS-CRATE ?auto_18822 ) ( not ( = ?auto_18834 ?auto_18822 ) ) ( not ( = ?auto_18818 ?auto_18834 ) ) ( not ( = ?auto_18819 ?auto_18834 ) ) ( not ( = ?auto_18833 ?auto_18834 ) ) ( not ( = ?auto_18827 ?auto_18834 ) ) ( not ( = ?auto_18826 ?auto_18834 ) ) ( not ( = ?auto_18824 ?auto_18834 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18834 ?auto_18822 )
      ( MAKE-2CRATE ?auto_18833 ?auto_18818 ?auto_18819 )
      ( MAKE-1CRATE-VERIFY ?auto_18818 ?auto_18819 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18835 - SURFACE
      ?auto_18836 - SURFACE
      ?auto_18837 - SURFACE
    )
    :vars
    (
      ?auto_18845 - HOIST
      ?auto_18840 - PLACE
      ?auto_18841 - PLACE
      ?auto_18844 - HOIST
      ?auto_18849 - SURFACE
      ?auto_18846 - PLACE
      ?auto_18838 - HOIST
      ?auto_18847 - SURFACE
      ?auto_18842 - SURFACE
      ?auto_18850 - PLACE
      ?auto_18848 - HOIST
      ?auto_18839 - SURFACE
      ?auto_18843 - TRUCK
      ?auto_18851 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18845 ?auto_18840 ) ( IS-CRATE ?auto_18837 ) ( not ( = ?auto_18836 ?auto_18837 ) ) ( not ( = ?auto_18835 ?auto_18836 ) ) ( not ( = ?auto_18835 ?auto_18837 ) ) ( not ( = ?auto_18841 ?auto_18840 ) ) ( HOIST-AT ?auto_18844 ?auto_18841 ) ( not ( = ?auto_18845 ?auto_18844 ) ) ( AVAILABLE ?auto_18844 ) ( SURFACE-AT ?auto_18837 ?auto_18841 ) ( ON ?auto_18837 ?auto_18849 ) ( CLEAR ?auto_18837 ) ( not ( = ?auto_18836 ?auto_18849 ) ) ( not ( = ?auto_18837 ?auto_18849 ) ) ( not ( = ?auto_18835 ?auto_18849 ) ) ( IS-CRATE ?auto_18836 ) ( not ( = ?auto_18846 ?auto_18840 ) ) ( not ( = ?auto_18841 ?auto_18846 ) ) ( HOIST-AT ?auto_18838 ?auto_18846 ) ( not ( = ?auto_18845 ?auto_18838 ) ) ( not ( = ?auto_18844 ?auto_18838 ) ) ( AVAILABLE ?auto_18838 ) ( SURFACE-AT ?auto_18836 ?auto_18846 ) ( ON ?auto_18836 ?auto_18847 ) ( CLEAR ?auto_18836 ) ( not ( = ?auto_18836 ?auto_18847 ) ) ( not ( = ?auto_18837 ?auto_18847 ) ) ( not ( = ?auto_18835 ?auto_18847 ) ) ( not ( = ?auto_18849 ?auto_18847 ) ) ( IS-CRATE ?auto_18835 ) ( not ( = ?auto_18842 ?auto_18835 ) ) ( not ( = ?auto_18836 ?auto_18842 ) ) ( not ( = ?auto_18837 ?auto_18842 ) ) ( not ( = ?auto_18849 ?auto_18842 ) ) ( not ( = ?auto_18847 ?auto_18842 ) ) ( not ( = ?auto_18850 ?auto_18840 ) ) ( not ( = ?auto_18841 ?auto_18850 ) ) ( not ( = ?auto_18846 ?auto_18850 ) ) ( HOIST-AT ?auto_18848 ?auto_18850 ) ( not ( = ?auto_18845 ?auto_18848 ) ) ( not ( = ?auto_18844 ?auto_18848 ) ) ( not ( = ?auto_18838 ?auto_18848 ) ) ( AVAILABLE ?auto_18848 ) ( SURFACE-AT ?auto_18835 ?auto_18850 ) ( ON ?auto_18835 ?auto_18839 ) ( CLEAR ?auto_18835 ) ( not ( = ?auto_18836 ?auto_18839 ) ) ( not ( = ?auto_18837 ?auto_18839 ) ) ( not ( = ?auto_18835 ?auto_18839 ) ) ( not ( = ?auto_18849 ?auto_18839 ) ) ( not ( = ?auto_18847 ?auto_18839 ) ) ( not ( = ?auto_18842 ?auto_18839 ) ) ( TRUCK-AT ?auto_18843 ?auto_18840 ) ( SURFACE-AT ?auto_18851 ?auto_18840 ) ( CLEAR ?auto_18851 ) ( LIFTING ?auto_18845 ?auto_18842 ) ( IS-CRATE ?auto_18842 ) ( not ( = ?auto_18851 ?auto_18842 ) ) ( not ( = ?auto_18836 ?auto_18851 ) ) ( not ( = ?auto_18837 ?auto_18851 ) ) ( not ( = ?auto_18835 ?auto_18851 ) ) ( not ( = ?auto_18849 ?auto_18851 ) ) ( not ( = ?auto_18847 ?auto_18851 ) ) ( not ( = ?auto_18839 ?auto_18851 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18836 ?auto_18837 )
      ( MAKE-2CRATE-VERIFY ?auto_18835 ?auto_18836 ?auto_18837 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18852 - SURFACE
      ?auto_18853 - SURFACE
      ?auto_18854 - SURFACE
      ?auto_18855 - SURFACE
    )
    :vars
    (
      ?auto_18856 - HOIST
      ?auto_18859 - PLACE
      ?auto_18868 - PLACE
      ?auto_18865 - HOIST
      ?auto_18860 - SURFACE
      ?auto_18867 - PLACE
      ?auto_18864 - HOIST
      ?auto_18863 - SURFACE
      ?auto_18857 - PLACE
      ?auto_18862 - HOIST
      ?auto_18866 - SURFACE
      ?auto_18858 - TRUCK
      ?auto_18861 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18856 ?auto_18859 ) ( IS-CRATE ?auto_18855 ) ( not ( = ?auto_18854 ?auto_18855 ) ) ( not ( = ?auto_18853 ?auto_18854 ) ) ( not ( = ?auto_18853 ?auto_18855 ) ) ( not ( = ?auto_18868 ?auto_18859 ) ) ( HOIST-AT ?auto_18865 ?auto_18868 ) ( not ( = ?auto_18856 ?auto_18865 ) ) ( AVAILABLE ?auto_18865 ) ( SURFACE-AT ?auto_18855 ?auto_18868 ) ( ON ?auto_18855 ?auto_18860 ) ( CLEAR ?auto_18855 ) ( not ( = ?auto_18854 ?auto_18860 ) ) ( not ( = ?auto_18855 ?auto_18860 ) ) ( not ( = ?auto_18853 ?auto_18860 ) ) ( IS-CRATE ?auto_18854 ) ( not ( = ?auto_18867 ?auto_18859 ) ) ( not ( = ?auto_18868 ?auto_18867 ) ) ( HOIST-AT ?auto_18864 ?auto_18867 ) ( not ( = ?auto_18856 ?auto_18864 ) ) ( not ( = ?auto_18865 ?auto_18864 ) ) ( AVAILABLE ?auto_18864 ) ( SURFACE-AT ?auto_18854 ?auto_18867 ) ( ON ?auto_18854 ?auto_18863 ) ( CLEAR ?auto_18854 ) ( not ( = ?auto_18854 ?auto_18863 ) ) ( not ( = ?auto_18855 ?auto_18863 ) ) ( not ( = ?auto_18853 ?auto_18863 ) ) ( not ( = ?auto_18860 ?auto_18863 ) ) ( IS-CRATE ?auto_18853 ) ( not ( = ?auto_18852 ?auto_18853 ) ) ( not ( = ?auto_18854 ?auto_18852 ) ) ( not ( = ?auto_18855 ?auto_18852 ) ) ( not ( = ?auto_18860 ?auto_18852 ) ) ( not ( = ?auto_18863 ?auto_18852 ) ) ( not ( = ?auto_18857 ?auto_18859 ) ) ( not ( = ?auto_18868 ?auto_18857 ) ) ( not ( = ?auto_18867 ?auto_18857 ) ) ( HOIST-AT ?auto_18862 ?auto_18857 ) ( not ( = ?auto_18856 ?auto_18862 ) ) ( not ( = ?auto_18865 ?auto_18862 ) ) ( not ( = ?auto_18864 ?auto_18862 ) ) ( AVAILABLE ?auto_18862 ) ( SURFACE-AT ?auto_18853 ?auto_18857 ) ( ON ?auto_18853 ?auto_18866 ) ( CLEAR ?auto_18853 ) ( not ( = ?auto_18854 ?auto_18866 ) ) ( not ( = ?auto_18855 ?auto_18866 ) ) ( not ( = ?auto_18853 ?auto_18866 ) ) ( not ( = ?auto_18860 ?auto_18866 ) ) ( not ( = ?auto_18863 ?auto_18866 ) ) ( not ( = ?auto_18852 ?auto_18866 ) ) ( TRUCK-AT ?auto_18858 ?auto_18859 ) ( SURFACE-AT ?auto_18861 ?auto_18859 ) ( CLEAR ?auto_18861 ) ( LIFTING ?auto_18856 ?auto_18852 ) ( IS-CRATE ?auto_18852 ) ( not ( = ?auto_18861 ?auto_18852 ) ) ( not ( = ?auto_18854 ?auto_18861 ) ) ( not ( = ?auto_18855 ?auto_18861 ) ) ( not ( = ?auto_18853 ?auto_18861 ) ) ( not ( = ?auto_18860 ?auto_18861 ) ) ( not ( = ?auto_18863 ?auto_18861 ) ) ( not ( = ?auto_18866 ?auto_18861 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18853 ?auto_18854 ?auto_18855 )
      ( MAKE-3CRATE-VERIFY ?auto_18852 ?auto_18853 ?auto_18854 ?auto_18855 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18869 - SURFACE
      ?auto_18870 - SURFACE
      ?auto_18871 - SURFACE
      ?auto_18872 - SURFACE
      ?auto_18873 - SURFACE
    )
    :vars
    (
      ?auto_18874 - HOIST
      ?auto_18877 - PLACE
      ?auto_18885 - PLACE
      ?auto_18882 - HOIST
      ?auto_18878 - SURFACE
      ?auto_18884 - PLACE
      ?auto_18881 - HOIST
      ?auto_18880 - SURFACE
      ?auto_18875 - PLACE
      ?auto_18879 - HOIST
      ?auto_18883 - SURFACE
      ?auto_18876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18874 ?auto_18877 ) ( IS-CRATE ?auto_18873 ) ( not ( = ?auto_18872 ?auto_18873 ) ) ( not ( = ?auto_18871 ?auto_18872 ) ) ( not ( = ?auto_18871 ?auto_18873 ) ) ( not ( = ?auto_18885 ?auto_18877 ) ) ( HOIST-AT ?auto_18882 ?auto_18885 ) ( not ( = ?auto_18874 ?auto_18882 ) ) ( AVAILABLE ?auto_18882 ) ( SURFACE-AT ?auto_18873 ?auto_18885 ) ( ON ?auto_18873 ?auto_18878 ) ( CLEAR ?auto_18873 ) ( not ( = ?auto_18872 ?auto_18878 ) ) ( not ( = ?auto_18873 ?auto_18878 ) ) ( not ( = ?auto_18871 ?auto_18878 ) ) ( IS-CRATE ?auto_18872 ) ( not ( = ?auto_18884 ?auto_18877 ) ) ( not ( = ?auto_18885 ?auto_18884 ) ) ( HOIST-AT ?auto_18881 ?auto_18884 ) ( not ( = ?auto_18874 ?auto_18881 ) ) ( not ( = ?auto_18882 ?auto_18881 ) ) ( AVAILABLE ?auto_18881 ) ( SURFACE-AT ?auto_18872 ?auto_18884 ) ( ON ?auto_18872 ?auto_18880 ) ( CLEAR ?auto_18872 ) ( not ( = ?auto_18872 ?auto_18880 ) ) ( not ( = ?auto_18873 ?auto_18880 ) ) ( not ( = ?auto_18871 ?auto_18880 ) ) ( not ( = ?auto_18878 ?auto_18880 ) ) ( IS-CRATE ?auto_18871 ) ( not ( = ?auto_18870 ?auto_18871 ) ) ( not ( = ?auto_18872 ?auto_18870 ) ) ( not ( = ?auto_18873 ?auto_18870 ) ) ( not ( = ?auto_18878 ?auto_18870 ) ) ( not ( = ?auto_18880 ?auto_18870 ) ) ( not ( = ?auto_18875 ?auto_18877 ) ) ( not ( = ?auto_18885 ?auto_18875 ) ) ( not ( = ?auto_18884 ?auto_18875 ) ) ( HOIST-AT ?auto_18879 ?auto_18875 ) ( not ( = ?auto_18874 ?auto_18879 ) ) ( not ( = ?auto_18882 ?auto_18879 ) ) ( not ( = ?auto_18881 ?auto_18879 ) ) ( AVAILABLE ?auto_18879 ) ( SURFACE-AT ?auto_18871 ?auto_18875 ) ( ON ?auto_18871 ?auto_18883 ) ( CLEAR ?auto_18871 ) ( not ( = ?auto_18872 ?auto_18883 ) ) ( not ( = ?auto_18873 ?auto_18883 ) ) ( not ( = ?auto_18871 ?auto_18883 ) ) ( not ( = ?auto_18878 ?auto_18883 ) ) ( not ( = ?auto_18880 ?auto_18883 ) ) ( not ( = ?auto_18870 ?auto_18883 ) ) ( TRUCK-AT ?auto_18876 ?auto_18877 ) ( SURFACE-AT ?auto_18869 ?auto_18877 ) ( CLEAR ?auto_18869 ) ( LIFTING ?auto_18874 ?auto_18870 ) ( IS-CRATE ?auto_18870 ) ( not ( = ?auto_18869 ?auto_18870 ) ) ( not ( = ?auto_18872 ?auto_18869 ) ) ( not ( = ?auto_18873 ?auto_18869 ) ) ( not ( = ?auto_18871 ?auto_18869 ) ) ( not ( = ?auto_18878 ?auto_18869 ) ) ( not ( = ?auto_18880 ?auto_18869 ) ) ( not ( = ?auto_18883 ?auto_18869 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18871 ?auto_18872 ?auto_18873 )
      ( MAKE-4CRATE-VERIFY ?auto_18869 ?auto_18870 ?auto_18871 ?auto_18872 ?auto_18873 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18886 - SURFACE
      ?auto_18887 - SURFACE
      ?auto_18888 - SURFACE
      ?auto_18889 - SURFACE
      ?auto_18890 - SURFACE
      ?auto_18891 - SURFACE
    )
    :vars
    (
      ?auto_18892 - HOIST
      ?auto_18895 - PLACE
      ?auto_18903 - PLACE
      ?auto_18900 - HOIST
      ?auto_18896 - SURFACE
      ?auto_18902 - PLACE
      ?auto_18899 - HOIST
      ?auto_18898 - SURFACE
      ?auto_18893 - PLACE
      ?auto_18897 - HOIST
      ?auto_18901 - SURFACE
      ?auto_18894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18892 ?auto_18895 ) ( IS-CRATE ?auto_18891 ) ( not ( = ?auto_18890 ?auto_18891 ) ) ( not ( = ?auto_18889 ?auto_18890 ) ) ( not ( = ?auto_18889 ?auto_18891 ) ) ( not ( = ?auto_18903 ?auto_18895 ) ) ( HOIST-AT ?auto_18900 ?auto_18903 ) ( not ( = ?auto_18892 ?auto_18900 ) ) ( AVAILABLE ?auto_18900 ) ( SURFACE-AT ?auto_18891 ?auto_18903 ) ( ON ?auto_18891 ?auto_18896 ) ( CLEAR ?auto_18891 ) ( not ( = ?auto_18890 ?auto_18896 ) ) ( not ( = ?auto_18891 ?auto_18896 ) ) ( not ( = ?auto_18889 ?auto_18896 ) ) ( IS-CRATE ?auto_18890 ) ( not ( = ?auto_18902 ?auto_18895 ) ) ( not ( = ?auto_18903 ?auto_18902 ) ) ( HOIST-AT ?auto_18899 ?auto_18902 ) ( not ( = ?auto_18892 ?auto_18899 ) ) ( not ( = ?auto_18900 ?auto_18899 ) ) ( AVAILABLE ?auto_18899 ) ( SURFACE-AT ?auto_18890 ?auto_18902 ) ( ON ?auto_18890 ?auto_18898 ) ( CLEAR ?auto_18890 ) ( not ( = ?auto_18890 ?auto_18898 ) ) ( not ( = ?auto_18891 ?auto_18898 ) ) ( not ( = ?auto_18889 ?auto_18898 ) ) ( not ( = ?auto_18896 ?auto_18898 ) ) ( IS-CRATE ?auto_18889 ) ( not ( = ?auto_18888 ?auto_18889 ) ) ( not ( = ?auto_18890 ?auto_18888 ) ) ( not ( = ?auto_18891 ?auto_18888 ) ) ( not ( = ?auto_18896 ?auto_18888 ) ) ( not ( = ?auto_18898 ?auto_18888 ) ) ( not ( = ?auto_18893 ?auto_18895 ) ) ( not ( = ?auto_18903 ?auto_18893 ) ) ( not ( = ?auto_18902 ?auto_18893 ) ) ( HOIST-AT ?auto_18897 ?auto_18893 ) ( not ( = ?auto_18892 ?auto_18897 ) ) ( not ( = ?auto_18900 ?auto_18897 ) ) ( not ( = ?auto_18899 ?auto_18897 ) ) ( AVAILABLE ?auto_18897 ) ( SURFACE-AT ?auto_18889 ?auto_18893 ) ( ON ?auto_18889 ?auto_18901 ) ( CLEAR ?auto_18889 ) ( not ( = ?auto_18890 ?auto_18901 ) ) ( not ( = ?auto_18891 ?auto_18901 ) ) ( not ( = ?auto_18889 ?auto_18901 ) ) ( not ( = ?auto_18896 ?auto_18901 ) ) ( not ( = ?auto_18898 ?auto_18901 ) ) ( not ( = ?auto_18888 ?auto_18901 ) ) ( TRUCK-AT ?auto_18894 ?auto_18895 ) ( SURFACE-AT ?auto_18887 ?auto_18895 ) ( CLEAR ?auto_18887 ) ( LIFTING ?auto_18892 ?auto_18888 ) ( IS-CRATE ?auto_18888 ) ( not ( = ?auto_18887 ?auto_18888 ) ) ( not ( = ?auto_18890 ?auto_18887 ) ) ( not ( = ?auto_18891 ?auto_18887 ) ) ( not ( = ?auto_18889 ?auto_18887 ) ) ( not ( = ?auto_18896 ?auto_18887 ) ) ( not ( = ?auto_18898 ?auto_18887 ) ) ( not ( = ?auto_18901 ?auto_18887 ) ) ( ON ?auto_18887 ?auto_18886 ) ( not ( = ?auto_18886 ?auto_18887 ) ) ( not ( = ?auto_18886 ?auto_18888 ) ) ( not ( = ?auto_18886 ?auto_18889 ) ) ( not ( = ?auto_18886 ?auto_18890 ) ) ( not ( = ?auto_18886 ?auto_18891 ) ) ( not ( = ?auto_18886 ?auto_18896 ) ) ( not ( = ?auto_18886 ?auto_18898 ) ) ( not ( = ?auto_18886 ?auto_18901 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18889 ?auto_18890 ?auto_18891 )
      ( MAKE-5CRATE-VERIFY ?auto_18886 ?auto_18887 ?auto_18888 ?auto_18889 ?auto_18890 ?auto_18891 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18904 - SURFACE
      ?auto_18905 - SURFACE
    )
    :vars
    (
      ?auto_18906 - HOIST
      ?auto_18909 - PLACE
      ?auto_18920 - SURFACE
      ?auto_18919 - PLACE
      ?auto_18915 - HOIST
      ?auto_18910 - SURFACE
      ?auto_18918 - PLACE
      ?auto_18914 - HOIST
      ?auto_18913 - SURFACE
      ?auto_18917 - SURFACE
      ?auto_18907 - PLACE
      ?auto_18912 - HOIST
      ?auto_18916 - SURFACE
      ?auto_18908 - TRUCK
      ?auto_18911 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18906 ?auto_18909 ) ( IS-CRATE ?auto_18905 ) ( not ( = ?auto_18904 ?auto_18905 ) ) ( not ( = ?auto_18920 ?auto_18904 ) ) ( not ( = ?auto_18920 ?auto_18905 ) ) ( not ( = ?auto_18919 ?auto_18909 ) ) ( HOIST-AT ?auto_18915 ?auto_18919 ) ( not ( = ?auto_18906 ?auto_18915 ) ) ( AVAILABLE ?auto_18915 ) ( SURFACE-AT ?auto_18905 ?auto_18919 ) ( ON ?auto_18905 ?auto_18910 ) ( CLEAR ?auto_18905 ) ( not ( = ?auto_18904 ?auto_18910 ) ) ( not ( = ?auto_18905 ?auto_18910 ) ) ( not ( = ?auto_18920 ?auto_18910 ) ) ( IS-CRATE ?auto_18904 ) ( not ( = ?auto_18918 ?auto_18909 ) ) ( not ( = ?auto_18919 ?auto_18918 ) ) ( HOIST-AT ?auto_18914 ?auto_18918 ) ( not ( = ?auto_18906 ?auto_18914 ) ) ( not ( = ?auto_18915 ?auto_18914 ) ) ( AVAILABLE ?auto_18914 ) ( SURFACE-AT ?auto_18904 ?auto_18918 ) ( ON ?auto_18904 ?auto_18913 ) ( CLEAR ?auto_18904 ) ( not ( = ?auto_18904 ?auto_18913 ) ) ( not ( = ?auto_18905 ?auto_18913 ) ) ( not ( = ?auto_18920 ?auto_18913 ) ) ( not ( = ?auto_18910 ?auto_18913 ) ) ( IS-CRATE ?auto_18920 ) ( not ( = ?auto_18917 ?auto_18920 ) ) ( not ( = ?auto_18904 ?auto_18917 ) ) ( not ( = ?auto_18905 ?auto_18917 ) ) ( not ( = ?auto_18910 ?auto_18917 ) ) ( not ( = ?auto_18913 ?auto_18917 ) ) ( not ( = ?auto_18907 ?auto_18909 ) ) ( not ( = ?auto_18919 ?auto_18907 ) ) ( not ( = ?auto_18918 ?auto_18907 ) ) ( HOIST-AT ?auto_18912 ?auto_18907 ) ( not ( = ?auto_18906 ?auto_18912 ) ) ( not ( = ?auto_18915 ?auto_18912 ) ) ( not ( = ?auto_18914 ?auto_18912 ) ) ( AVAILABLE ?auto_18912 ) ( SURFACE-AT ?auto_18920 ?auto_18907 ) ( ON ?auto_18920 ?auto_18916 ) ( CLEAR ?auto_18920 ) ( not ( = ?auto_18904 ?auto_18916 ) ) ( not ( = ?auto_18905 ?auto_18916 ) ) ( not ( = ?auto_18920 ?auto_18916 ) ) ( not ( = ?auto_18910 ?auto_18916 ) ) ( not ( = ?auto_18913 ?auto_18916 ) ) ( not ( = ?auto_18917 ?auto_18916 ) ) ( TRUCK-AT ?auto_18908 ?auto_18909 ) ( SURFACE-AT ?auto_18911 ?auto_18909 ) ( CLEAR ?auto_18911 ) ( IS-CRATE ?auto_18917 ) ( not ( = ?auto_18911 ?auto_18917 ) ) ( not ( = ?auto_18904 ?auto_18911 ) ) ( not ( = ?auto_18905 ?auto_18911 ) ) ( not ( = ?auto_18920 ?auto_18911 ) ) ( not ( = ?auto_18910 ?auto_18911 ) ) ( not ( = ?auto_18913 ?auto_18911 ) ) ( not ( = ?auto_18916 ?auto_18911 ) ) ( AVAILABLE ?auto_18906 ) ( IN ?auto_18917 ?auto_18908 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18906 ?auto_18917 ?auto_18908 ?auto_18909 )
      ( MAKE-2CRATE ?auto_18920 ?auto_18904 ?auto_18905 )
      ( MAKE-1CRATE-VERIFY ?auto_18904 ?auto_18905 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18921 - SURFACE
      ?auto_18922 - SURFACE
      ?auto_18923 - SURFACE
    )
    :vars
    (
      ?auto_18930 - HOIST
      ?auto_18925 - PLACE
      ?auto_18934 - PLACE
      ?auto_18935 - HOIST
      ?auto_18936 - SURFACE
      ?auto_18926 - PLACE
      ?auto_18932 - HOIST
      ?auto_18931 - SURFACE
      ?auto_18928 - SURFACE
      ?auto_18927 - PLACE
      ?auto_18924 - HOIST
      ?auto_18929 - SURFACE
      ?auto_18933 - TRUCK
      ?auto_18937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18930 ?auto_18925 ) ( IS-CRATE ?auto_18923 ) ( not ( = ?auto_18922 ?auto_18923 ) ) ( not ( = ?auto_18921 ?auto_18922 ) ) ( not ( = ?auto_18921 ?auto_18923 ) ) ( not ( = ?auto_18934 ?auto_18925 ) ) ( HOIST-AT ?auto_18935 ?auto_18934 ) ( not ( = ?auto_18930 ?auto_18935 ) ) ( AVAILABLE ?auto_18935 ) ( SURFACE-AT ?auto_18923 ?auto_18934 ) ( ON ?auto_18923 ?auto_18936 ) ( CLEAR ?auto_18923 ) ( not ( = ?auto_18922 ?auto_18936 ) ) ( not ( = ?auto_18923 ?auto_18936 ) ) ( not ( = ?auto_18921 ?auto_18936 ) ) ( IS-CRATE ?auto_18922 ) ( not ( = ?auto_18926 ?auto_18925 ) ) ( not ( = ?auto_18934 ?auto_18926 ) ) ( HOIST-AT ?auto_18932 ?auto_18926 ) ( not ( = ?auto_18930 ?auto_18932 ) ) ( not ( = ?auto_18935 ?auto_18932 ) ) ( AVAILABLE ?auto_18932 ) ( SURFACE-AT ?auto_18922 ?auto_18926 ) ( ON ?auto_18922 ?auto_18931 ) ( CLEAR ?auto_18922 ) ( not ( = ?auto_18922 ?auto_18931 ) ) ( not ( = ?auto_18923 ?auto_18931 ) ) ( not ( = ?auto_18921 ?auto_18931 ) ) ( not ( = ?auto_18936 ?auto_18931 ) ) ( IS-CRATE ?auto_18921 ) ( not ( = ?auto_18928 ?auto_18921 ) ) ( not ( = ?auto_18922 ?auto_18928 ) ) ( not ( = ?auto_18923 ?auto_18928 ) ) ( not ( = ?auto_18936 ?auto_18928 ) ) ( not ( = ?auto_18931 ?auto_18928 ) ) ( not ( = ?auto_18927 ?auto_18925 ) ) ( not ( = ?auto_18934 ?auto_18927 ) ) ( not ( = ?auto_18926 ?auto_18927 ) ) ( HOIST-AT ?auto_18924 ?auto_18927 ) ( not ( = ?auto_18930 ?auto_18924 ) ) ( not ( = ?auto_18935 ?auto_18924 ) ) ( not ( = ?auto_18932 ?auto_18924 ) ) ( AVAILABLE ?auto_18924 ) ( SURFACE-AT ?auto_18921 ?auto_18927 ) ( ON ?auto_18921 ?auto_18929 ) ( CLEAR ?auto_18921 ) ( not ( = ?auto_18922 ?auto_18929 ) ) ( not ( = ?auto_18923 ?auto_18929 ) ) ( not ( = ?auto_18921 ?auto_18929 ) ) ( not ( = ?auto_18936 ?auto_18929 ) ) ( not ( = ?auto_18931 ?auto_18929 ) ) ( not ( = ?auto_18928 ?auto_18929 ) ) ( TRUCK-AT ?auto_18933 ?auto_18925 ) ( SURFACE-AT ?auto_18937 ?auto_18925 ) ( CLEAR ?auto_18937 ) ( IS-CRATE ?auto_18928 ) ( not ( = ?auto_18937 ?auto_18928 ) ) ( not ( = ?auto_18922 ?auto_18937 ) ) ( not ( = ?auto_18923 ?auto_18937 ) ) ( not ( = ?auto_18921 ?auto_18937 ) ) ( not ( = ?auto_18936 ?auto_18937 ) ) ( not ( = ?auto_18931 ?auto_18937 ) ) ( not ( = ?auto_18929 ?auto_18937 ) ) ( AVAILABLE ?auto_18930 ) ( IN ?auto_18928 ?auto_18933 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18922 ?auto_18923 )
      ( MAKE-2CRATE-VERIFY ?auto_18921 ?auto_18922 ?auto_18923 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18938 - SURFACE
      ?auto_18939 - SURFACE
      ?auto_18940 - SURFACE
      ?auto_18941 - SURFACE
    )
    :vars
    (
      ?auto_18944 - HOIST
      ?auto_18947 - PLACE
      ?auto_18950 - PLACE
      ?auto_18948 - HOIST
      ?auto_18942 - SURFACE
      ?auto_18954 - PLACE
      ?auto_18953 - HOIST
      ?auto_18946 - SURFACE
      ?auto_18949 - PLACE
      ?auto_18951 - HOIST
      ?auto_18945 - SURFACE
      ?auto_18943 - TRUCK
      ?auto_18952 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18944 ?auto_18947 ) ( IS-CRATE ?auto_18941 ) ( not ( = ?auto_18940 ?auto_18941 ) ) ( not ( = ?auto_18939 ?auto_18940 ) ) ( not ( = ?auto_18939 ?auto_18941 ) ) ( not ( = ?auto_18950 ?auto_18947 ) ) ( HOIST-AT ?auto_18948 ?auto_18950 ) ( not ( = ?auto_18944 ?auto_18948 ) ) ( AVAILABLE ?auto_18948 ) ( SURFACE-AT ?auto_18941 ?auto_18950 ) ( ON ?auto_18941 ?auto_18942 ) ( CLEAR ?auto_18941 ) ( not ( = ?auto_18940 ?auto_18942 ) ) ( not ( = ?auto_18941 ?auto_18942 ) ) ( not ( = ?auto_18939 ?auto_18942 ) ) ( IS-CRATE ?auto_18940 ) ( not ( = ?auto_18954 ?auto_18947 ) ) ( not ( = ?auto_18950 ?auto_18954 ) ) ( HOIST-AT ?auto_18953 ?auto_18954 ) ( not ( = ?auto_18944 ?auto_18953 ) ) ( not ( = ?auto_18948 ?auto_18953 ) ) ( AVAILABLE ?auto_18953 ) ( SURFACE-AT ?auto_18940 ?auto_18954 ) ( ON ?auto_18940 ?auto_18946 ) ( CLEAR ?auto_18940 ) ( not ( = ?auto_18940 ?auto_18946 ) ) ( not ( = ?auto_18941 ?auto_18946 ) ) ( not ( = ?auto_18939 ?auto_18946 ) ) ( not ( = ?auto_18942 ?auto_18946 ) ) ( IS-CRATE ?auto_18939 ) ( not ( = ?auto_18938 ?auto_18939 ) ) ( not ( = ?auto_18940 ?auto_18938 ) ) ( not ( = ?auto_18941 ?auto_18938 ) ) ( not ( = ?auto_18942 ?auto_18938 ) ) ( not ( = ?auto_18946 ?auto_18938 ) ) ( not ( = ?auto_18949 ?auto_18947 ) ) ( not ( = ?auto_18950 ?auto_18949 ) ) ( not ( = ?auto_18954 ?auto_18949 ) ) ( HOIST-AT ?auto_18951 ?auto_18949 ) ( not ( = ?auto_18944 ?auto_18951 ) ) ( not ( = ?auto_18948 ?auto_18951 ) ) ( not ( = ?auto_18953 ?auto_18951 ) ) ( AVAILABLE ?auto_18951 ) ( SURFACE-AT ?auto_18939 ?auto_18949 ) ( ON ?auto_18939 ?auto_18945 ) ( CLEAR ?auto_18939 ) ( not ( = ?auto_18940 ?auto_18945 ) ) ( not ( = ?auto_18941 ?auto_18945 ) ) ( not ( = ?auto_18939 ?auto_18945 ) ) ( not ( = ?auto_18942 ?auto_18945 ) ) ( not ( = ?auto_18946 ?auto_18945 ) ) ( not ( = ?auto_18938 ?auto_18945 ) ) ( TRUCK-AT ?auto_18943 ?auto_18947 ) ( SURFACE-AT ?auto_18952 ?auto_18947 ) ( CLEAR ?auto_18952 ) ( IS-CRATE ?auto_18938 ) ( not ( = ?auto_18952 ?auto_18938 ) ) ( not ( = ?auto_18940 ?auto_18952 ) ) ( not ( = ?auto_18941 ?auto_18952 ) ) ( not ( = ?auto_18939 ?auto_18952 ) ) ( not ( = ?auto_18942 ?auto_18952 ) ) ( not ( = ?auto_18946 ?auto_18952 ) ) ( not ( = ?auto_18945 ?auto_18952 ) ) ( AVAILABLE ?auto_18944 ) ( IN ?auto_18938 ?auto_18943 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18939 ?auto_18940 ?auto_18941 )
      ( MAKE-3CRATE-VERIFY ?auto_18938 ?auto_18939 ?auto_18940 ?auto_18941 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18955 - SURFACE
      ?auto_18956 - SURFACE
      ?auto_18957 - SURFACE
      ?auto_18958 - SURFACE
      ?auto_18959 - SURFACE
    )
    :vars
    (
      ?auto_18962 - HOIST
      ?auto_18965 - PLACE
      ?auto_18968 - PLACE
      ?auto_18966 - HOIST
      ?auto_18960 - SURFACE
      ?auto_18971 - PLACE
      ?auto_18970 - HOIST
      ?auto_18964 - SURFACE
      ?auto_18967 - PLACE
      ?auto_18969 - HOIST
      ?auto_18963 - SURFACE
      ?auto_18961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18962 ?auto_18965 ) ( IS-CRATE ?auto_18959 ) ( not ( = ?auto_18958 ?auto_18959 ) ) ( not ( = ?auto_18957 ?auto_18958 ) ) ( not ( = ?auto_18957 ?auto_18959 ) ) ( not ( = ?auto_18968 ?auto_18965 ) ) ( HOIST-AT ?auto_18966 ?auto_18968 ) ( not ( = ?auto_18962 ?auto_18966 ) ) ( AVAILABLE ?auto_18966 ) ( SURFACE-AT ?auto_18959 ?auto_18968 ) ( ON ?auto_18959 ?auto_18960 ) ( CLEAR ?auto_18959 ) ( not ( = ?auto_18958 ?auto_18960 ) ) ( not ( = ?auto_18959 ?auto_18960 ) ) ( not ( = ?auto_18957 ?auto_18960 ) ) ( IS-CRATE ?auto_18958 ) ( not ( = ?auto_18971 ?auto_18965 ) ) ( not ( = ?auto_18968 ?auto_18971 ) ) ( HOIST-AT ?auto_18970 ?auto_18971 ) ( not ( = ?auto_18962 ?auto_18970 ) ) ( not ( = ?auto_18966 ?auto_18970 ) ) ( AVAILABLE ?auto_18970 ) ( SURFACE-AT ?auto_18958 ?auto_18971 ) ( ON ?auto_18958 ?auto_18964 ) ( CLEAR ?auto_18958 ) ( not ( = ?auto_18958 ?auto_18964 ) ) ( not ( = ?auto_18959 ?auto_18964 ) ) ( not ( = ?auto_18957 ?auto_18964 ) ) ( not ( = ?auto_18960 ?auto_18964 ) ) ( IS-CRATE ?auto_18957 ) ( not ( = ?auto_18956 ?auto_18957 ) ) ( not ( = ?auto_18958 ?auto_18956 ) ) ( not ( = ?auto_18959 ?auto_18956 ) ) ( not ( = ?auto_18960 ?auto_18956 ) ) ( not ( = ?auto_18964 ?auto_18956 ) ) ( not ( = ?auto_18967 ?auto_18965 ) ) ( not ( = ?auto_18968 ?auto_18967 ) ) ( not ( = ?auto_18971 ?auto_18967 ) ) ( HOIST-AT ?auto_18969 ?auto_18967 ) ( not ( = ?auto_18962 ?auto_18969 ) ) ( not ( = ?auto_18966 ?auto_18969 ) ) ( not ( = ?auto_18970 ?auto_18969 ) ) ( AVAILABLE ?auto_18969 ) ( SURFACE-AT ?auto_18957 ?auto_18967 ) ( ON ?auto_18957 ?auto_18963 ) ( CLEAR ?auto_18957 ) ( not ( = ?auto_18958 ?auto_18963 ) ) ( not ( = ?auto_18959 ?auto_18963 ) ) ( not ( = ?auto_18957 ?auto_18963 ) ) ( not ( = ?auto_18960 ?auto_18963 ) ) ( not ( = ?auto_18964 ?auto_18963 ) ) ( not ( = ?auto_18956 ?auto_18963 ) ) ( TRUCK-AT ?auto_18961 ?auto_18965 ) ( SURFACE-AT ?auto_18955 ?auto_18965 ) ( CLEAR ?auto_18955 ) ( IS-CRATE ?auto_18956 ) ( not ( = ?auto_18955 ?auto_18956 ) ) ( not ( = ?auto_18958 ?auto_18955 ) ) ( not ( = ?auto_18959 ?auto_18955 ) ) ( not ( = ?auto_18957 ?auto_18955 ) ) ( not ( = ?auto_18960 ?auto_18955 ) ) ( not ( = ?auto_18964 ?auto_18955 ) ) ( not ( = ?auto_18963 ?auto_18955 ) ) ( AVAILABLE ?auto_18962 ) ( IN ?auto_18956 ?auto_18961 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18957 ?auto_18958 ?auto_18959 )
      ( MAKE-4CRATE-VERIFY ?auto_18955 ?auto_18956 ?auto_18957 ?auto_18958 ?auto_18959 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18972 - SURFACE
      ?auto_18973 - SURFACE
      ?auto_18974 - SURFACE
      ?auto_18975 - SURFACE
      ?auto_18976 - SURFACE
      ?auto_18977 - SURFACE
    )
    :vars
    (
      ?auto_18980 - HOIST
      ?auto_18983 - PLACE
      ?auto_18986 - PLACE
      ?auto_18984 - HOIST
      ?auto_18978 - SURFACE
      ?auto_18989 - PLACE
      ?auto_18988 - HOIST
      ?auto_18982 - SURFACE
      ?auto_18985 - PLACE
      ?auto_18987 - HOIST
      ?auto_18981 - SURFACE
      ?auto_18979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18980 ?auto_18983 ) ( IS-CRATE ?auto_18977 ) ( not ( = ?auto_18976 ?auto_18977 ) ) ( not ( = ?auto_18975 ?auto_18976 ) ) ( not ( = ?auto_18975 ?auto_18977 ) ) ( not ( = ?auto_18986 ?auto_18983 ) ) ( HOIST-AT ?auto_18984 ?auto_18986 ) ( not ( = ?auto_18980 ?auto_18984 ) ) ( AVAILABLE ?auto_18984 ) ( SURFACE-AT ?auto_18977 ?auto_18986 ) ( ON ?auto_18977 ?auto_18978 ) ( CLEAR ?auto_18977 ) ( not ( = ?auto_18976 ?auto_18978 ) ) ( not ( = ?auto_18977 ?auto_18978 ) ) ( not ( = ?auto_18975 ?auto_18978 ) ) ( IS-CRATE ?auto_18976 ) ( not ( = ?auto_18989 ?auto_18983 ) ) ( not ( = ?auto_18986 ?auto_18989 ) ) ( HOIST-AT ?auto_18988 ?auto_18989 ) ( not ( = ?auto_18980 ?auto_18988 ) ) ( not ( = ?auto_18984 ?auto_18988 ) ) ( AVAILABLE ?auto_18988 ) ( SURFACE-AT ?auto_18976 ?auto_18989 ) ( ON ?auto_18976 ?auto_18982 ) ( CLEAR ?auto_18976 ) ( not ( = ?auto_18976 ?auto_18982 ) ) ( not ( = ?auto_18977 ?auto_18982 ) ) ( not ( = ?auto_18975 ?auto_18982 ) ) ( not ( = ?auto_18978 ?auto_18982 ) ) ( IS-CRATE ?auto_18975 ) ( not ( = ?auto_18974 ?auto_18975 ) ) ( not ( = ?auto_18976 ?auto_18974 ) ) ( not ( = ?auto_18977 ?auto_18974 ) ) ( not ( = ?auto_18978 ?auto_18974 ) ) ( not ( = ?auto_18982 ?auto_18974 ) ) ( not ( = ?auto_18985 ?auto_18983 ) ) ( not ( = ?auto_18986 ?auto_18985 ) ) ( not ( = ?auto_18989 ?auto_18985 ) ) ( HOIST-AT ?auto_18987 ?auto_18985 ) ( not ( = ?auto_18980 ?auto_18987 ) ) ( not ( = ?auto_18984 ?auto_18987 ) ) ( not ( = ?auto_18988 ?auto_18987 ) ) ( AVAILABLE ?auto_18987 ) ( SURFACE-AT ?auto_18975 ?auto_18985 ) ( ON ?auto_18975 ?auto_18981 ) ( CLEAR ?auto_18975 ) ( not ( = ?auto_18976 ?auto_18981 ) ) ( not ( = ?auto_18977 ?auto_18981 ) ) ( not ( = ?auto_18975 ?auto_18981 ) ) ( not ( = ?auto_18978 ?auto_18981 ) ) ( not ( = ?auto_18982 ?auto_18981 ) ) ( not ( = ?auto_18974 ?auto_18981 ) ) ( TRUCK-AT ?auto_18979 ?auto_18983 ) ( SURFACE-AT ?auto_18973 ?auto_18983 ) ( CLEAR ?auto_18973 ) ( IS-CRATE ?auto_18974 ) ( not ( = ?auto_18973 ?auto_18974 ) ) ( not ( = ?auto_18976 ?auto_18973 ) ) ( not ( = ?auto_18977 ?auto_18973 ) ) ( not ( = ?auto_18975 ?auto_18973 ) ) ( not ( = ?auto_18978 ?auto_18973 ) ) ( not ( = ?auto_18982 ?auto_18973 ) ) ( not ( = ?auto_18981 ?auto_18973 ) ) ( AVAILABLE ?auto_18980 ) ( IN ?auto_18974 ?auto_18979 ) ( ON ?auto_18973 ?auto_18972 ) ( not ( = ?auto_18972 ?auto_18973 ) ) ( not ( = ?auto_18972 ?auto_18974 ) ) ( not ( = ?auto_18972 ?auto_18975 ) ) ( not ( = ?auto_18972 ?auto_18976 ) ) ( not ( = ?auto_18972 ?auto_18977 ) ) ( not ( = ?auto_18972 ?auto_18978 ) ) ( not ( = ?auto_18972 ?auto_18982 ) ) ( not ( = ?auto_18972 ?auto_18981 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18975 ?auto_18976 ?auto_18977 )
      ( MAKE-5CRATE-VERIFY ?auto_18972 ?auto_18973 ?auto_18974 ?auto_18975 ?auto_18976 ?auto_18977 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18990 - SURFACE
      ?auto_18991 - SURFACE
    )
    :vars
    (
      ?auto_18994 - HOIST
      ?auto_18997 - PLACE
      ?auto_19006 - SURFACE
      ?auto_19001 - PLACE
      ?auto_18998 - HOIST
      ?auto_18992 - SURFACE
      ?auto_19005 - PLACE
      ?auto_19004 - HOIST
      ?auto_18996 - SURFACE
      ?auto_19000 - SURFACE
      ?auto_18999 - PLACE
      ?auto_19002 - HOIST
      ?auto_18995 - SURFACE
      ?auto_19003 - SURFACE
      ?auto_18993 - TRUCK
      ?auto_19007 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18994 ?auto_18997 ) ( IS-CRATE ?auto_18991 ) ( not ( = ?auto_18990 ?auto_18991 ) ) ( not ( = ?auto_19006 ?auto_18990 ) ) ( not ( = ?auto_19006 ?auto_18991 ) ) ( not ( = ?auto_19001 ?auto_18997 ) ) ( HOIST-AT ?auto_18998 ?auto_19001 ) ( not ( = ?auto_18994 ?auto_18998 ) ) ( AVAILABLE ?auto_18998 ) ( SURFACE-AT ?auto_18991 ?auto_19001 ) ( ON ?auto_18991 ?auto_18992 ) ( CLEAR ?auto_18991 ) ( not ( = ?auto_18990 ?auto_18992 ) ) ( not ( = ?auto_18991 ?auto_18992 ) ) ( not ( = ?auto_19006 ?auto_18992 ) ) ( IS-CRATE ?auto_18990 ) ( not ( = ?auto_19005 ?auto_18997 ) ) ( not ( = ?auto_19001 ?auto_19005 ) ) ( HOIST-AT ?auto_19004 ?auto_19005 ) ( not ( = ?auto_18994 ?auto_19004 ) ) ( not ( = ?auto_18998 ?auto_19004 ) ) ( AVAILABLE ?auto_19004 ) ( SURFACE-AT ?auto_18990 ?auto_19005 ) ( ON ?auto_18990 ?auto_18996 ) ( CLEAR ?auto_18990 ) ( not ( = ?auto_18990 ?auto_18996 ) ) ( not ( = ?auto_18991 ?auto_18996 ) ) ( not ( = ?auto_19006 ?auto_18996 ) ) ( not ( = ?auto_18992 ?auto_18996 ) ) ( IS-CRATE ?auto_19006 ) ( not ( = ?auto_19000 ?auto_19006 ) ) ( not ( = ?auto_18990 ?auto_19000 ) ) ( not ( = ?auto_18991 ?auto_19000 ) ) ( not ( = ?auto_18992 ?auto_19000 ) ) ( not ( = ?auto_18996 ?auto_19000 ) ) ( not ( = ?auto_18999 ?auto_18997 ) ) ( not ( = ?auto_19001 ?auto_18999 ) ) ( not ( = ?auto_19005 ?auto_18999 ) ) ( HOIST-AT ?auto_19002 ?auto_18999 ) ( not ( = ?auto_18994 ?auto_19002 ) ) ( not ( = ?auto_18998 ?auto_19002 ) ) ( not ( = ?auto_19004 ?auto_19002 ) ) ( AVAILABLE ?auto_19002 ) ( SURFACE-AT ?auto_19006 ?auto_18999 ) ( ON ?auto_19006 ?auto_18995 ) ( CLEAR ?auto_19006 ) ( not ( = ?auto_18990 ?auto_18995 ) ) ( not ( = ?auto_18991 ?auto_18995 ) ) ( not ( = ?auto_19006 ?auto_18995 ) ) ( not ( = ?auto_18992 ?auto_18995 ) ) ( not ( = ?auto_18996 ?auto_18995 ) ) ( not ( = ?auto_19000 ?auto_18995 ) ) ( SURFACE-AT ?auto_19003 ?auto_18997 ) ( CLEAR ?auto_19003 ) ( IS-CRATE ?auto_19000 ) ( not ( = ?auto_19003 ?auto_19000 ) ) ( not ( = ?auto_18990 ?auto_19003 ) ) ( not ( = ?auto_18991 ?auto_19003 ) ) ( not ( = ?auto_19006 ?auto_19003 ) ) ( not ( = ?auto_18992 ?auto_19003 ) ) ( not ( = ?auto_18996 ?auto_19003 ) ) ( not ( = ?auto_18995 ?auto_19003 ) ) ( AVAILABLE ?auto_18994 ) ( IN ?auto_19000 ?auto_18993 ) ( TRUCK-AT ?auto_18993 ?auto_19007 ) ( not ( = ?auto_19007 ?auto_18997 ) ) ( not ( = ?auto_19001 ?auto_19007 ) ) ( not ( = ?auto_19005 ?auto_19007 ) ) ( not ( = ?auto_18999 ?auto_19007 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18993 ?auto_19007 ?auto_18997 )
      ( MAKE-2CRATE ?auto_19006 ?auto_18990 ?auto_18991 )
      ( MAKE-1CRATE-VERIFY ?auto_18990 ?auto_18991 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19008 - SURFACE
      ?auto_19009 - SURFACE
      ?auto_19010 - SURFACE
    )
    :vars
    (
      ?auto_19020 - HOIST
      ?auto_19019 - PLACE
      ?auto_19018 - PLACE
      ?auto_19017 - HOIST
      ?auto_19024 - SURFACE
      ?auto_19022 - PLACE
      ?auto_19021 - HOIST
      ?auto_19013 - SURFACE
      ?auto_19023 - SURFACE
      ?auto_19015 - PLACE
      ?auto_19014 - HOIST
      ?auto_19012 - SURFACE
      ?auto_19011 - SURFACE
      ?auto_19016 - TRUCK
      ?auto_19025 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19020 ?auto_19019 ) ( IS-CRATE ?auto_19010 ) ( not ( = ?auto_19009 ?auto_19010 ) ) ( not ( = ?auto_19008 ?auto_19009 ) ) ( not ( = ?auto_19008 ?auto_19010 ) ) ( not ( = ?auto_19018 ?auto_19019 ) ) ( HOIST-AT ?auto_19017 ?auto_19018 ) ( not ( = ?auto_19020 ?auto_19017 ) ) ( AVAILABLE ?auto_19017 ) ( SURFACE-AT ?auto_19010 ?auto_19018 ) ( ON ?auto_19010 ?auto_19024 ) ( CLEAR ?auto_19010 ) ( not ( = ?auto_19009 ?auto_19024 ) ) ( not ( = ?auto_19010 ?auto_19024 ) ) ( not ( = ?auto_19008 ?auto_19024 ) ) ( IS-CRATE ?auto_19009 ) ( not ( = ?auto_19022 ?auto_19019 ) ) ( not ( = ?auto_19018 ?auto_19022 ) ) ( HOIST-AT ?auto_19021 ?auto_19022 ) ( not ( = ?auto_19020 ?auto_19021 ) ) ( not ( = ?auto_19017 ?auto_19021 ) ) ( AVAILABLE ?auto_19021 ) ( SURFACE-AT ?auto_19009 ?auto_19022 ) ( ON ?auto_19009 ?auto_19013 ) ( CLEAR ?auto_19009 ) ( not ( = ?auto_19009 ?auto_19013 ) ) ( not ( = ?auto_19010 ?auto_19013 ) ) ( not ( = ?auto_19008 ?auto_19013 ) ) ( not ( = ?auto_19024 ?auto_19013 ) ) ( IS-CRATE ?auto_19008 ) ( not ( = ?auto_19023 ?auto_19008 ) ) ( not ( = ?auto_19009 ?auto_19023 ) ) ( not ( = ?auto_19010 ?auto_19023 ) ) ( not ( = ?auto_19024 ?auto_19023 ) ) ( not ( = ?auto_19013 ?auto_19023 ) ) ( not ( = ?auto_19015 ?auto_19019 ) ) ( not ( = ?auto_19018 ?auto_19015 ) ) ( not ( = ?auto_19022 ?auto_19015 ) ) ( HOIST-AT ?auto_19014 ?auto_19015 ) ( not ( = ?auto_19020 ?auto_19014 ) ) ( not ( = ?auto_19017 ?auto_19014 ) ) ( not ( = ?auto_19021 ?auto_19014 ) ) ( AVAILABLE ?auto_19014 ) ( SURFACE-AT ?auto_19008 ?auto_19015 ) ( ON ?auto_19008 ?auto_19012 ) ( CLEAR ?auto_19008 ) ( not ( = ?auto_19009 ?auto_19012 ) ) ( not ( = ?auto_19010 ?auto_19012 ) ) ( not ( = ?auto_19008 ?auto_19012 ) ) ( not ( = ?auto_19024 ?auto_19012 ) ) ( not ( = ?auto_19013 ?auto_19012 ) ) ( not ( = ?auto_19023 ?auto_19012 ) ) ( SURFACE-AT ?auto_19011 ?auto_19019 ) ( CLEAR ?auto_19011 ) ( IS-CRATE ?auto_19023 ) ( not ( = ?auto_19011 ?auto_19023 ) ) ( not ( = ?auto_19009 ?auto_19011 ) ) ( not ( = ?auto_19010 ?auto_19011 ) ) ( not ( = ?auto_19008 ?auto_19011 ) ) ( not ( = ?auto_19024 ?auto_19011 ) ) ( not ( = ?auto_19013 ?auto_19011 ) ) ( not ( = ?auto_19012 ?auto_19011 ) ) ( AVAILABLE ?auto_19020 ) ( IN ?auto_19023 ?auto_19016 ) ( TRUCK-AT ?auto_19016 ?auto_19025 ) ( not ( = ?auto_19025 ?auto_19019 ) ) ( not ( = ?auto_19018 ?auto_19025 ) ) ( not ( = ?auto_19022 ?auto_19025 ) ) ( not ( = ?auto_19015 ?auto_19025 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19009 ?auto_19010 )
      ( MAKE-2CRATE-VERIFY ?auto_19008 ?auto_19009 ?auto_19010 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19026 - SURFACE
      ?auto_19027 - SURFACE
      ?auto_19028 - SURFACE
      ?auto_19029 - SURFACE
    )
    :vars
    (
      ?auto_19033 - HOIST
      ?auto_19031 - PLACE
      ?auto_19043 - PLACE
      ?auto_19039 - HOIST
      ?auto_19036 - SURFACE
      ?auto_19038 - PLACE
      ?auto_19040 - HOIST
      ?auto_19030 - SURFACE
      ?auto_19035 - PLACE
      ?auto_19041 - HOIST
      ?auto_19034 - SURFACE
      ?auto_19037 - SURFACE
      ?auto_19032 - TRUCK
      ?auto_19042 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19033 ?auto_19031 ) ( IS-CRATE ?auto_19029 ) ( not ( = ?auto_19028 ?auto_19029 ) ) ( not ( = ?auto_19027 ?auto_19028 ) ) ( not ( = ?auto_19027 ?auto_19029 ) ) ( not ( = ?auto_19043 ?auto_19031 ) ) ( HOIST-AT ?auto_19039 ?auto_19043 ) ( not ( = ?auto_19033 ?auto_19039 ) ) ( AVAILABLE ?auto_19039 ) ( SURFACE-AT ?auto_19029 ?auto_19043 ) ( ON ?auto_19029 ?auto_19036 ) ( CLEAR ?auto_19029 ) ( not ( = ?auto_19028 ?auto_19036 ) ) ( not ( = ?auto_19029 ?auto_19036 ) ) ( not ( = ?auto_19027 ?auto_19036 ) ) ( IS-CRATE ?auto_19028 ) ( not ( = ?auto_19038 ?auto_19031 ) ) ( not ( = ?auto_19043 ?auto_19038 ) ) ( HOIST-AT ?auto_19040 ?auto_19038 ) ( not ( = ?auto_19033 ?auto_19040 ) ) ( not ( = ?auto_19039 ?auto_19040 ) ) ( AVAILABLE ?auto_19040 ) ( SURFACE-AT ?auto_19028 ?auto_19038 ) ( ON ?auto_19028 ?auto_19030 ) ( CLEAR ?auto_19028 ) ( not ( = ?auto_19028 ?auto_19030 ) ) ( not ( = ?auto_19029 ?auto_19030 ) ) ( not ( = ?auto_19027 ?auto_19030 ) ) ( not ( = ?auto_19036 ?auto_19030 ) ) ( IS-CRATE ?auto_19027 ) ( not ( = ?auto_19026 ?auto_19027 ) ) ( not ( = ?auto_19028 ?auto_19026 ) ) ( not ( = ?auto_19029 ?auto_19026 ) ) ( not ( = ?auto_19036 ?auto_19026 ) ) ( not ( = ?auto_19030 ?auto_19026 ) ) ( not ( = ?auto_19035 ?auto_19031 ) ) ( not ( = ?auto_19043 ?auto_19035 ) ) ( not ( = ?auto_19038 ?auto_19035 ) ) ( HOIST-AT ?auto_19041 ?auto_19035 ) ( not ( = ?auto_19033 ?auto_19041 ) ) ( not ( = ?auto_19039 ?auto_19041 ) ) ( not ( = ?auto_19040 ?auto_19041 ) ) ( AVAILABLE ?auto_19041 ) ( SURFACE-AT ?auto_19027 ?auto_19035 ) ( ON ?auto_19027 ?auto_19034 ) ( CLEAR ?auto_19027 ) ( not ( = ?auto_19028 ?auto_19034 ) ) ( not ( = ?auto_19029 ?auto_19034 ) ) ( not ( = ?auto_19027 ?auto_19034 ) ) ( not ( = ?auto_19036 ?auto_19034 ) ) ( not ( = ?auto_19030 ?auto_19034 ) ) ( not ( = ?auto_19026 ?auto_19034 ) ) ( SURFACE-AT ?auto_19037 ?auto_19031 ) ( CLEAR ?auto_19037 ) ( IS-CRATE ?auto_19026 ) ( not ( = ?auto_19037 ?auto_19026 ) ) ( not ( = ?auto_19028 ?auto_19037 ) ) ( not ( = ?auto_19029 ?auto_19037 ) ) ( not ( = ?auto_19027 ?auto_19037 ) ) ( not ( = ?auto_19036 ?auto_19037 ) ) ( not ( = ?auto_19030 ?auto_19037 ) ) ( not ( = ?auto_19034 ?auto_19037 ) ) ( AVAILABLE ?auto_19033 ) ( IN ?auto_19026 ?auto_19032 ) ( TRUCK-AT ?auto_19032 ?auto_19042 ) ( not ( = ?auto_19042 ?auto_19031 ) ) ( not ( = ?auto_19043 ?auto_19042 ) ) ( not ( = ?auto_19038 ?auto_19042 ) ) ( not ( = ?auto_19035 ?auto_19042 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19027 ?auto_19028 ?auto_19029 )
      ( MAKE-3CRATE-VERIFY ?auto_19026 ?auto_19027 ?auto_19028 ?auto_19029 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19044 - SURFACE
      ?auto_19045 - SURFACE
      ?auto_19046 - SURFACE
      ?auto_19047 - SURFACE
      ?auto_19048 - SURFACE
    )
    :vars
    (
      ?auto_19052 - HOIST
      ?auto_19050 - PLACE
      ?auto_19061 - PLACE
      ?auto_19057 - HOIST
      ?auto_19055 - SURFACE
      ?auto_19056 - PLACE
      ?auto_19058 - HOIST
      ?auto_19049 - SURFACE
      ?auto_19054 - PLACE
      ?auto_19059 - HOIST
      ?auto_19053 - SURFACE
      ?auto_19051 - TRUCK
      ?auto_19060 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19052 ?auto_19050 ) ( IS-CRATE ?auto_19048 ) ( not ( = ?auto_19047 ?auto_19048 ) ) ( not ( = ?auto_19046 ?auto_19047 ) ) ( not ( = ?auto_19046 ?auto_19048 ) ) ( not ( = ?auto_19061 ?auto_19050 ) ) ( HOIST-AT ?auto_19057 ?auto_19061 ) ( not ( = ?auto_19052 ?auto_19057 ) ) ( AVAILABLE ?auto_19057 ) ( SURFACE-AT ?auto_19048 ?auto_19061 ) ( ON ?auto_19048 ?auto_19055 ) ( CLEAR ?auto_19048 ) ( not ( = ?auto_19047 ?auto_19055 ) ) ( not ( = ?auto_19048 ?auto_19055 ) ) ( not ( = ?auto_19046 ?auto_19055 ) ) ( IS-CRATE ?auto_19047 ) ( not ( = ?auto_19056 ?auto_19050 ) ) ( not ( = ?auto_19061 ?auto_19056 ) ) ( HOIST-AT ?auto_19058 ?auto_19056 ) ( not ( = ?auto_19052 ?auto_19058 ) ) ( not ( = ?auto_19057 ?auto_19058 ) ) ( AVAILABLE ?auto_19058 ) ( SURFACE-AT ?auto_19047 ?auto_19056 ) ( ON ?auto_19047 ?auto_19049 ) ( CLEAR ?auto_19047 ) ( not ( = ?auto_19047 ?auto_19049 ) ) ( not ( = ?auto_19048 ?auto_19049 ) ) ( not ( = ?auto_19046 ?auto_19049 ) ) ( not ( = ?auto_19055 ?auto_19049 ) ) ( IS-CRATE ?auto_19046 ) ( not ( = ?auto_19045 ?auto_19046 ) ) ( not ( = ?auto_19047 ?auto_19045 ) ) ( not ( = ?auto_19048 ?auto_19045 ) ) ( not ( = ?auto_19055 ?auto_19045 ) ) ( not ( = ?auto_19049 ?auto_19045 ) ) ( not ( = ?auto_19054 ?auto_19050 ) ) ( not ( = ?auto_19061 ?auto_19054 ) ) ( not ( = ?auto_19056 ?auto_19054 ) ) ( HOIST-AT ?auto_19059 ?auto_19054 ) ( not ( = ?auto_19052 ?auto_19059 ) ) ( not ( = ?auto_19057 ?auto_19059 ) ) ( not ( = ?auto_19058 ?auto_19059 ) ) ( AVAILABLE ?auto_19059 ) ( SURFACE-AT ?auto_19046 ?auto_19054 ) ( ON ?auto_19046 ?auto_19053 ) ( CLEAR ?auto_19046 ) ( not ( = ?auto_19047 ?auto_19053 ) ) ( not ( = ?auto_19048 ?auto_19053 ) ) ( not ( = ?auto_19046 ?auto_19053 ) ) ( not ( = ?auto_19055 ?auto_19053 ) ) ( not ( = ?auto_19049 ?auto_19053 ) ) ( not ( = ?auto_19045 ?auto_19053 ) ) ( SURFACE-AT ?auto_19044 ?auto_19050 ) ( CLEAR ?auto_19044 ) ( IS-CRATE ?auto_19045 ) ( not ( = ?auto_19044 ?auto_19045 ) ) ( not ( = ?auto_19047 ?auto_19044 ) ) ( not ( = ?auto_19048 ?auto_19044 ) ) ( not ( = ?auto_19046 ?auto_19044 ) ) ( not ( = ?auto_19055 ?auto_19044 ) ) ( not ( = ?auto_19049 ?auto_19044 ) ) ( not ( = ?auto_19053 ?auto_19044 ) ) ( AVAILABLE ?auto_19052 ) ( IN ?auto_19045 ?auto_19051 ) ( TRUCK-AT ?auto_19051 ?auto_19060 ) ( not ( = ?auto_19060 ?auto_19050 ) ) ( not ( = ?auto_19061 ?auto_19060 ) ) ( not ( = ?auto_19056 ?auto_19060 ) ) ( not ( = ?auto_19054 ?auto_19060 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19046 ?auto_19047 ?auto_19048 )
      ( MAKE-4CRATE-VERIFY ?auto_19044 ?auto_19045 ?auto_19046 ?auto_19047 ?auto_19048 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19062 - SURFACE
      ?auto_19063 - SURFACE
      ?auto_19064 - SURFACE
      ?auto_19065 - SURFACE
      ?auto_19066 - SURFACE
      ?auto_19067 - SURFACE
    )
    :vars
    (
      ?auto_19071 - HOIST
      ?auto_19069 - PLACE
      ?auto_19080 - PLACE
      ?auto_19076 - HOIST
      ?auto_19074 - SURFACE
      ?auto_19075 - PLACE
      ?auto_19077 - HOIST
      ?auto_19068 - SURFACE
      ?auto_19073 - PLACE
      ?auto_19078 - HOIST
      ?auto_19072 - SURFACE
      ?auto_19070 - TRUCK
      ?auto_19079 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19071 ?auto_19069 ) ( IS-CRATE ?auto_19067 ) ( not ( = ?auto_19066 ?auto_19067 ) ) ( not ( = ?auto_19065 ?auto_19066 ) ) ( not ( = ?auto_19065 ?auto_19067 ) ) ( not ( = ?auto_19080 ?auto_19069 ) ) ( HOIST-AT ?auto_19076 ?auto_19080 ) ( not ( = ?auto_19071 ?auto_19076 ) ) ( AVAILABLE ?auto_19076 ) ( SURFACE-AT ?auto_19067 ?auto_19080 ) ( ON ?auto_19067 ?auto_19074 ) ( CLEAR ?auto_19067 ) ( not ( = ?auto_19066 ?auto_19074 ) ) ( not ( = ?auto_19067 ?auto_19074 ) ) ( not ( = ?auto_19065 ?auto_19074 ) ) ( IS-CRATE ?auto_19066 ) ( not ( = ?auto_19075 ?auto_19069 ) ) ( not ( = ?auto_19080 ?auto_19075 ) ) ( HOIST-AT ?auto_19077 ?auto_19075 ) ( not ( = ?auto_19071 ?auto_19077 ) ) ( not ( = ?auto_19076 ?auto_19077 ) ) ( AVAILABLE ?auto_19077 ) ( SURFACE-AT ?auto_19066 ?auto_19075 ) ( ON ?auto_19066 ?auto_19068 ) ( CLEAR ?auto_19066 ) ( not ( = ?auto_19066 ?auto_19068 ) ) ( not ( = ?auto_19067 ?auto_19068 ) ) ( not ( = ?auto_19065 ?auto_19068 ) ) ( not ( = ?auto_19074 ?auto_19068 ) ) ( IS-CRATE ?auto_19065 ) ( not ( = ?auto_19064 ?auto_19065 ) ) ( not ( = ?auto_19066 ?auto_19064 ) ) ( not ( = ?auto_19067 ?auto_19064 ) ) ( not ( = ?auto_19074 ?auto_19064 ) ) ( not ( = ?auto_19068 ?auto_19064 ) ) ( not ( = ?auto_19073 ?auto_19069 ) ) ( not ( = ?auto_19080 ?auto_19073 ) ) ( not ( = ?auto_19075 ?auto_19073 ) ) ( HOIST-AT ?auto_19078 ?auto_19073 ) ( not ( = ?auto_19071 ?auto_19078 ) ) ( not ( = ?auto_19076 ?auto_19078 ) ) ( not ( = ?auto_19077 ?auto_19078 ) ) ( AVAILABLE ?auto_19078 ) ( SURFACE-AT ?auto_19065 ?auto_19073 ) ( ON ?auto_19065 ?auto_19072 ) ( CLEAR ?auto_19065 ) ( not ( = ?auto_19066 ?auto_19072 ) ) ( not ( = ?auto_19067 ?auto_19072 ) ) ( not ( = ?auto_19065 ?auto_19072 ) ) ( not ( = ?auto_19074 ?auto_19072 ) ) ( not ( = ?auto_19068 ?auto_19072 ) ) ( not ( = ?auto_19064 ?auto_19072 ) ) ( SURFACE-AT ?auto_19063 ?auto_19069 ) ( CLEAR ?auto_19063 ) ( IS-CRATE ?auto_19064 ) ( not ( = ?auto_19063 ?auto_19064 ) ) ( not ( = ?auto_19066 ?auto_19063 ) ) ( not ( = ?auto_19067 ?auto_19063 ) ) ( not ( = ?auto_19065 ?auto_19063 ) ) ( not ( = ?auto_19074 ?auto_19063 ) ) ( not ( = ?auto_19068 ?auto_19063 ) ) ( not ( = ?auto_19072 ?auto_19063 ) ) ( AVAILABLE ?auto_19071 ) ( IN ?auto_19064 ?auto_19070 ) ( TRUCK-AT ?auto_19070 ?auto_19079 ) ( not ( = ?auto_19079 ?auto_19069 ) ) ( not ( = ?auto_19080 ?auto_19079 ) ) ( not ( = ?auto_19075 ?auto_19079 ) ) ( not ( = ?auto_19073 ?auto_19079 ) ) ( ON ?auto_19063 ?auto_19062 ) ( not ( = ?auto_19062 ?auto_19063 ) ) ( not ( = ?auto_19062 ?auto_19064 ) ) ( not ( = ?auto_19062 ?auto_19065 ) ) ( not ( = ?auto_19062 ?auto_19066 ) ) ( not ( = ?auto_19062 ?auto_19067 ) ) ( not ( = ?auto_19062 ?auto_19074 ) ) ( not ( = ?auto_19062 ?auto_19068 ) ) ( not ( = ?auto_19062 ?auto_19072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19065 ?auto_19066 ?auto_19067 )
      ( MAKE-5CRATE-VERIFY ?auto_19062 ?auto_19063 ?auto_19064 ?auto_19065 ?auto_19066 ?auto_19067 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19081 - SURFACE
      ?auto_19082 - SURFACE
    )
    :vars
    (
      ?auto_19086 - HOIST
      ?auto_19084 - PLACE
      ?auto_19097 - SURFACE
      ?auto_19098 - PLACE
      ?auto_19093 - HOIST
      ?auto_19089 - SURFACE
      ?auto_19092 - PLACE
      ?auto_19094 - HOIST
      ?auto_19083 - SURFACE
      ?auto_19090 - SURFACE
      ?auto_19088 - PLACE
      ?auto_19095 - HOIST
      ?auto_19087 - SURFACE
      ?auto_19091 - SURFACE
      ?auto_19085 - TRUCK
      ?auto_19096 - PLACE
      ?auto_19099 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19086 ?auto_19084 ) ( IS-CRATE ?auto_19082 ) ( not ( = ?auto_19081 ?auto_19082 ) ) ( not ( = ?auto_19097 ?auto_19081 ) ) ( not ( = ?auto_19097 ?auto_19082 ) ) ( not ( = ?auto_19098 ?auto_19084 ) ) ( HOIST-AT ?auto_19093 ?auto_19098 ) ( not ( = ?auto_19086 ?auto_19093 ) ) ( AVAILABLE ?auto_19093 ) ( SURFACE-AT ?auto_19082 ?auto_19098 ) ( ON ?auto_19082 ?auto_19089 ) ( CLEAR ?auto_19082 ) ( not ( = ?auto_19081 ?auto_19089 ) ) ( not ( = ?auto_19082 ?auto_19089 ) ) ( not ( = ?auto_19097 ?auto_19089 ) ) ( IS-CRATE ?auto_19081 ) ( not ( = ?auto_19092 ?auto_19084 ) ) ( not ( = ?auto_19098 ?auto_19092 ) ) ( HOIST-AT ?auto_19094 ?auto_19092 ) ( not ( = ?auto_19086 ?auto_19094 ) ) ( not ( = ?auto_19093 ?auto_19094 ) ) ( AVAILABLE ?auto_19094 ) ( SURFACE-AT ?auto_19081 ?auto_19092 ) ( ON ?auto_19081 ?auto_19083 ) ( CLEAR ?auto_19081 ) ( not ( = ?auto_19081 ?auto_19083 ) ) ( not ( = ?auto_19082 ?auto_19083 ) ) ( not ( = ?auto_19097 ?auto_19083 ) ) ( not ( = ?auto_19089 ?auto_19083 ) ) ( IS-CRATE ?auto_19097 ) ( not ( = ?auto_19090 ?auto_19097 ) ) ( not ( = ?auto_19081 ?auto_19090 ) ) ( not ( = ?auto_19082 ?auto_19090 ) ) ( not ( = ?auto_19089 ?auto_19090 ) ) ( not ( = ?auto_19083 ?auto_19090 ) ) ( not ( = ?auto_19088 ?auto_19084 ) ) ( not ( = ?auto_19098 ?auto_19088 ) ) ( not ( = ?auto_19092 ?auto_19088 ) ) ( HOIST-AT ?auto_19095 ?auto_19088 ) ( not ( = ?auto_19086 ?auto_19095 ) ) ( not ( = ?auto_19093 ?auto_19095 ) ) ( not ( = ?auto_19094 ?auto_19095 ) ) ( AVAILABLE ?auto_19095 ) ( SURFACE-AT ?auto_19097 ?auto_19088 ) ( ON ?auto_19097 ?auto_19087 ) ( CLEAR ?auto_19097 ) ( not ( = ?auto_19081 ?auto_19087 ) ) ( not ( = ?auto_19082 ?auto_19087 ) ) ( not ( = ?auto_19097 ?auto_19087 ) ) ( not ( = ?auto_19089 ?auto_19087 ) ) ( not ( = ?auto_19083 ?auto_19087 ) ) ( not ( = ?auto_19090 ?auto_19087 ) ) ( SURFACE-AT ?auto_19091 ?auto_19084 ) ( CLEAR ?auto_19091 ) ( IS-CRATE ?auto_19090 ) ( not ( = ?auto_19091 ?auto_19090 ) ) ( not ( = ?auto_19081 ?auto_19091 ) ) ( not ( = ?auto_19082 ?auto_19091 ) ) ( not ( = ?auto_19097 ?auto_19091 ) ) ( not ( = ?auto_19089 ?auto_19091 ) ) ( not ( = ?auto_19083 ?auto_19091 ) ) ( not ( = ?auto_19087 ?auto_19091 ) ) ( AVAILABLE ?auto_19086 ) ( TRUCK-AT ?auto_19085 ?auto_19096 ) ( not ( = ?auto_19096 ?auto_19084 ) ) ( not ( = ?auto_19098 ?auto_19096 ) ) ( not ( = ?auto_19092 ?auto_19096 ) ) ( not ( = ?auto_19088 ?auto_19096 ) ) ( HOIST-AT ?auto_19099 ?auto_19096 ) ( LIFTING ?auto_19099 ?auto_19090 ) ( not ( = ?auto_19086 ?auto_19099 ) ) ( not ( = ?auto_19093 ?auto_19099 ) ) ( not ( = ?auto_19094 ?auto_19099 ) ) ( not ( = ?auto_19095 ?auto_19099 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19099 ?auto_19090 ?auto_19085 ?auto_19096 )
      ( MAKE-2CRATE ?auto_19097 ?auto_19081 ?auto_19082 )
      ( MAKE-1CRATE-VERIFY ?auto_19081 ?auto_19082 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19100 - SURFACE
      ?auto_19101 - SURFACE
      ?auto_19102 - SURFACE
    )
    :vars
    (
      ?auto_19107 - HOIST
      ?auto_19105 - PLACE
      ?auto_19116 - PLACE
      ?auto_19106 - HOIST
      ?auto_19114 - SURFACE
      ?auto_19103 - PLACE
      ?auto_19118 - HOIST
      ?auto_19112 - SURFACE
      ?auto_19108 - SURFACE
      ?auto_19109 - PLACE
      ?auto_19110 - HOIST
      ?auto_19104 - SURFACE
      ?auto_19115 - SURFACE
      ?auto_19113 - TRUCK
      ?auto_19111 - PLACE
      ?auto_19117 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19107 ?auto_19105 ) ( IS-CRATE ?auto_19102 ) ( not ( = ?auto_19101 ?auto_19102 ) ) ( not ( = ?auto_19100 ?auto_19101 ) ) ( not ( = ?auto_19100 ?auto_19102 ) ) ( not ( = ?auto_19116 ?auto_19105 ) ) ( HOIST-AT ?auto_19106 ?auto_19116 ) ( not ( = ?auto_19107 ?auto_19106 ) ) ( AVAILABLE ?auto_19106 ) ( SURFACE-AT ?auto_19102 ?auto_19116 ) ( ON ?auto_19102 ?auto_19114 ) ( CLEAR ?auto_19102 ) ( not ( = ?auto_19101 ?auto_19114 ) ) ( not ( = ?auto_19102 ?auto_19114 ) ) ( not ( = ?auto_19100 ?auto_19114 ) ) ( IS-CRATE ?auto_19101 ) ( not ( = ?auto_19103 ?auto_19105 ) ) ( not ( = ?auto_19116 ?auto_19103 ) ) ( HOIST-AT ?auto_19118 ?auto_19103 ) ( not ( = ?auto_19107 ?auto_19118 ) ) ( not ( = ?auto_19106 ?auto_19118 ) ) ( AVAILABLE ?auto_19118 ) ( SURFACE-AT ?auto_19101 ?auto_19103 ) ( ON ?auto_19101 ?auto_19112 ) ( CLEAR ?auto_19101 ) ( not ( = ?auto_19101 ?auto_19112 ) ) ( not ( = ?auto_19102 ?auto_19112 ) ) ( not ( = ?auto_19100 ?auto_19112 ) ) ( not ( = ?auto_19114 ?auto_19112 ) ) ( IS-CRATE ?auto_19100 ) ( not ( = ?auto_19108 ?auto_19100 ) ) ( not ( = ?auto_19101 ?auto_19108 ) ) ( not ( = ?auto_19102 ?auto_19108 ) ) ( not ( = ?auto_19114 ?auto_19108 ) ) ( not ( = ?auto_19112 ?auto_19108 ) ) ( not ( = ?auto_19109 ?auto_19105 ) ) ( not ( = ?auto_19116 ?auto_19109 ) ) ( not ( = ?auto_19103 ?auto_19109 ) ) ( HOIST-AT ?auto_19110 ?auto_19109 ) ( not ( = ?auto_19107 ?auto_19110 ) ) ( not ( = ?auto_19106 ?auto_19110 ) ) ( not ( = ?auto_19118 ?auto_19110 ) ) ( AVAILABLE ?auto_19110 ) ( SURFACE-AT ?auto_19100 ?auto_19109 ) ( ON ?auto_19100 ?auto_19104 ) ( CLEAR ?auto_19100 ) ( not ( = ?auto_19101 ?auto_19104 ) ) ( not ( = ?auto_19102 ?auto_19104 ) ) ( not ( = ?auto_19100 ?auto_19104 ) ) ( not ( = ?auto_19114 ?auto_19104 ) ) ( not ( = ?auto_19112 ?auto_19104 ) ) ( not ( = ?auto_19108 ?auto_19104 ) ) ( SURFACE-AT ?auto_19115 ?auto_19105 ) ( CLEAR ?auto_19115 ) ( IS-CRATE ?auto_19108 ) ( not ( = ?auto_19115 ?auto_19108 ) ) ( not ( = ?auto_19101 ?auto_19115 ) ) ( not ( = ?auto_19102 ?auto_19115 ) ) ( not ( = ?auto_19100 ?auto_19115 ) ) ( not ( = ?auto_19114 ?auto_19115 ) ) ( not ( = ?auto_19112 ?auto_19115 ) ) ( not ( = ?auto_19104 ?auto_19115 ) ) ( AVAILABLE ?auto_19107 ) ( TRUCK-AT ?auto_19113 ?auto_19111 ) ( not ( = ?auto_19111 ?auto_19105 ) ) ( not ( = ?auto_19116 ?auto_19111 ) ) ( not ( = ?auto_19103 ?auto_19111 ) ) ( not ( = ?auto_19109 ?auto_19111 ) ) ( HOIST-AT ?auto_19117 ?auto_19111 ) ( LIFTING ?auto_19117 ?auto_19108 ) ( not ( = ?auto_19107 ?auto_19117 ) ) ( not ( = ?auto_19106 ?auto_19117 ) ) ( not ( = ?auto_19118 ?auto_19117 ) ) ( not ( = ?auto_19110 ?auto_19117 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19101 ?auto_19102 )
      ( MAKE-2CRATE-VERIFY ?auto_19100 ?auto_19101 ?auto_19102 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19119 - SURFACE
      ?auto_19120 - SURFACE
      ?auto_19121 - SURFACE
      ?auto_19122 - SURFACE
    )
    :vars
    (
      ?auto_19130 - HOIST
      ?auto_19134 - PLACE
      ?auto_19129 - PLACE
      ?auto_19136 - HOIST
      ?auto_19131 - SURFACE
      ?auto_19123 - PLACE
      ?auto_19126 - HOIST
      ?auto_19137 - SURFACE
      ?auto_19124 - PLACE
      ?auto_19125 - HOIST
      ?auto_19132 - SURFACE
      ?auto_19127 - SURFACE
      ?auto_19128 - TRUCK
      ?auto_19133 - PLACE
      ?auto_19135 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19130 ?auto_19134 ) ( IS-CRATE ?auto_19122 ) ( not ( = ?auto_19121 ?auto_19122 ) ) ( not ( = ?auto_19120 ?auto_19121 ) ) ( not ( = ?auto_19120 ?auto_19122 ) ) ( not ( = ?auto_19129 ?auto_19134 ) ) ( HOIST-AT ?auto_19136 ?auto_19129 ) ( not ( = ?auto_19130 ?auto_19136 ) ) ( AVAILABLE ?auto_19136 ) ( SURFACE-AT ?auto_19122 ?auto_19129 ) ( ON ?auto_19122 ?auto_19131 ) ( CLEAR ?auto_19122 ) ( not ( = ?auto_19121 ?auto_19131 ) ) ( not ( = ?auto_19122 ?auto_19131 ) ) ( not ( = ?auto_19120 ?auto_19131 ) ) ( IS-CRATE ?auto_19121 ) ( not ( = ?auto_19123 ?auto_19134 ) ) ( not ( = ?auto_19129 ?auto_19123 ) ) ( HOIST-AT ?auto_19126 ?auto_19123 ) ( not ( = ?auto_19130 ?auto_19126 ) ) ( not ( = ?auto_19136 ?auto_19126 ) ) ( AVAILABLE ?auto_19126 ) ( SURFACE-AT ?auto_19121 ?auto_19123 ) ( ON ?auto_19121 ?auto_19137 ) ( CLEAR ?auto_19121 ) ( not ( = ?auto_19121 ?auto_19137 ) ) ( not ( = ?auto_19122 ?auto_19137 ) ) ( not ( = ?auto_19120 ?auto_19137 ) ) ( not ( = ?auto_19131 ?auto_19137 ) ) ( IS-CRATE ?auto_19120 ) ( not ( = ?auto_19119 ?auto_19120 ) ) ( not ( = ?auto_19121 ?auto_19119 ) ) ( not ( = ?auto_19122 ?auto_19119 ) ) ( not ( = ?auto_19131 ?auto_19119 ) ) ( not ( = ?auto_19137 ?auto_19119 ) ) ( not ( = ?auto_19124 ?auto_19134 ) ) ( not ( = ?auto_19129 ?auto_19124 ) ) ( not ( = ?auto_19123 ?auto_19124 ) ) ( HOIST-AT ?auto_19125 ?auto_19124 ) ( not ( = ?auto_19130 ?auto_19125 ) ) ( not ( = ?auto_19136 ?auto_19125 ) ) ( not ( = ?auto_19126 ?auto_19125 ) ) ( AVAILABLE ?auto_19125 ) ( SURFACE-AT ?auto_19120 ?auto_19124 ) ( ON ?auto_19120 ?auto_19132 ) ( CLEAR ?auto_19120 ) ( not ( = ?auto_19121 ?auto_19132 ) ) ( not ( = ?auto_19122 ?auto_19132 ) ) ( not ( = ?auto_19120 ?auto_19132 ) ) ( not ( = ?auto_19131 ?auto_19132 ) ) ( not ( = ?auto_19137 ?auto_19132 ) ) ( not ( = ?auto_19119 ?auto_19132 ) ) ( SURFACE-AT ?auto_19127 ?auto_19134 ) ( CLEAR ?auto_19127 ) ( IS-CRATE ?auto_19119 ) ( not ( = ?auto_19127 ?auto_19119 ) ) ( not ( = ?auto_19121 ?auto_19127 ) ) ( not ( = ?auto_19122 ?auto_19127 ) ) ( not ( = ?auto_19120 ?auto_19127 ) ) ( not ( = ?auto_19131 ?auto_19127 ) ) ( not ( = ?auto_19137 ?auto_19127 ) ) ( not ( = ?auto_19132 ?auto_19127 ) ) ( AVAILABLE ?auto_19130 ) ( TRUCK-AT ?auto_19128 ?auto_19133 ) ( not ( = ?auto_19133 ?auto_19134 ) ) ( not ( = ?auto_19129 ?auto_19133 ) ) ( not ( = ?auto_19123 ?auto_19133 ) ) ( not ( = ?auto_19124 ?auto_19133 ) ) ( HOIST-AT ?auto_19135 ?auto_19133 ) ( LIFTING ?auto_19135 ?auto_19119 ) ( not ( = ?auto_19130 ?auto_19135 ) ) ( not ( = ?auto_19136 ?auto_19135 ) ) ( not ( = ?auto_19126 ?auto_19135 ) ) ( not ( = ?auto_19125 ?auto_19135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19120 ?auto_19121 ?auto_19122 )
      ( MAKE-3CRATE-VERIFY ?auto_19119 ?auto_19120 ?auto_19121 ?auto_19122 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19138 - SURFACE
      ?auto_19139 - SURFACE
      ?auto_19140 - SURFACE
      ?auto_19141 - SURFACE
      ?auto_19142 - SURFACE
    )
    :vars
    (
      ?auto_19149 - HOIST
      ?auto_19153 - PLACE
      ?auto_19148 - PLACE
      ?auto_19155 - HOIST
      ?auto_19150 - SURFACE
      ?auto_19143 - PLACE
      ?auto_19146 - HOIST
      ?auto_19156 - SURFACE
      ?auto_19144 - PLACE
      ?auto_19145 - HOIST
      ?auto_19151 - SURFACE
      ?auto_19147 - TRUCK
      ?auto_19152 - PLACE
      ?auto_19154 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19149 ?auto_19153 ) ( IS-CRATE ?auto_19142 ) ( not ( = ?auto_19141 ?auto_19142 ) ) ( not ( = ?auto_19140 ?auto_19141 ) ) ( not ( = ?auto_19140 ?auto_19142 ) ) ( not ( = ?auto_19148 ?auto_19153 ) ) ( HOIST-AT ?auto_19155 ?auto_19148 ) ( not ( = ?auto_19149 ?auto_19155 ) ) ( AVAILABLE ?auto_19155 ) ( SURFACE-AT ?auto_19142 ?auto_19148 ) ( ON ?auto_19142 ?auto_19150 ) ( CLEAR ?auto_19142 ) ( not ( = ?auto_19141 ?auto_19150 ) ) ( not ( = ?auto_19142 ?auto_19150 ) ) ( not ( = ?auto_19140 ?auto_19150 ) ) ( IS-CRATE ?auto_19141 ) ( not ( = ?auto_19143 ?auto_19153 ) ) ( not ( = ?auto_19148 ?auto_19143 ) ) ( HOIST-AT ?auto_19146 ?auto_19143 ) ( not ( = ?auto_19149 ?auto_19146 ) ) ( not ( = ?auto_19155 ?auto_19146 ) ) ( AVAILABLE ?auto_19146 ) ( SURFACE-AT ?auto_19141 ?auto_19143 ) ( ON ?auto_19141 ?auto_19156 ) ( CLEAR ?auto_19141 ) ( not ( = ?auto_19141 ?auto_19156 ) ) ( not ( = ?auto_19142 ?auto_19156 ) ) ( not ( = ?auto_19140 ?auto_19156 ) ) ( not ( = ?auto_19150 ?auto_19156 ) ) ( IS-CRATE ?auto_19140 ) ( not ( = ?auto_19139 ?auto_19140 ) ) ( not ( = ?auto_19141 ?auto_19139 ) ) ( not ( = ?auto_19142 ?auto_19139 ) ) ( not ( = ?auto_19150 ?auto_19139 ) ) ( not ( = ?auto_19156 ?auto_19139 ) ) ( not ( = ?auto_19144 ?auto_19153 ) ) ( not ( = ?auto_19148 ?auto_19144 ) ) ( not ( = ?auto_19143 ?auto_19144 ) ) ( HOIST-AT ?auto_19145 ?auto_19144 ) ( not ( = ?auto_19149 ?auto_19145 ) ) ( not ( = ?auto_19155 ?auto_19145 ) ) ( not ( = ?auto_19146 ?auto_19145 ) ) ( AVAILABLE ?auto_19145 ) ( SURFACE-AT ?auto_19140 ?auto_19144 ) ( ON ?auto_19140 ?auto_19151 ) ( CLEAR ?auto_19140 ) ( not ( = ?auto_19141 ?auto_19151 ) ) ( not ( = ?auto_19142 ?auto_19151 ) ) ( not ( = ?auto_19140 ?auto_19151 ) ) ( not ( = ?auto_19150 ?auto_19151 ) ) ( not ( = ?auto_19156 ?auto_19151 ) ) ( not ( = ?auto_19139 ?auto_19151 ) ) ( SURFACE-AT ?auto_19138 ?auto_19153 ) ( CLEAR ?auto_19138 ) ( IS-CRATE ?auto_19139 ) ( not ( = ?auto_19138 ?auto_19139 ) ) ( not ( = ?auto_19141 ?auto_19138 ) ) ( not ( = ?auto_19142 ?auto_19138 ) ) ( not ( = ?auto_19140 ?auto_19138 ) ) ( not ( = ?auto_19150 ?auto_19138 ) ) ( not ( = ?auto_19156 ?auto_19138 ) ) ( not ( = ?auto_19151 ?auto_19138 ) ) ( AVAILABLE ?auto_19149 ) ( TRUCK-AT ?auto_19147 ?auto_19152 ) ( not ( = ?auto_19152 ?auto_19153 ) ) ( not ( = ?auto_19148 ?auto_19152 ) ) ( not ( = ?auto_19143 ?auto_19152 ) ) ( not ( = ?auto_19144 ?auto_19152 ) ) ( HOIST-AT ?auto_19154 ?auto_19152 ) ( LIFTING ?auto_19154 ?auto_19139 ) ( not ( = ?auto_19149 ?auto_19154 ) ) ( not ( = ?auto_19155 ?auto_19154 ) ) ( not ( = ?auto_19146 ?auto_19154 ) ) ( not ( = ?auto_19145 ?auto_19154 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19140 ?auto_19141 ?auto_19142 )
      ( MAKE-4CRATE-VERIFY ?auto_19138 ?auto_19139 ?auto_19140 ?auto_19141 ?auto_19142 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19157 - SURFACE
      ?auto_19158 - SURFACE
      ?auto_19159 - SURFACE
      ?auto_19160 - SURFACE
      ?auto_19161 - SURFACE
      ?auto_19162 - SURFACE
    )
    :vars
    (
      ?auto_19169 - HOIST
      ?auto_19173 - PLACE
      ?auto_19168 - PLACE
      ?auto_19175 - HOIST
      ?auto_19170 - SURFACE
      ?auto_19163 - PLACE
      ?auto_19166 - HOIST
      ?auto_19176 - SURFACE
      ?auto_19164 - PLACE
      ?auto_19165 - HOIST
      ?auto_19171 - SURFACE
      ?auto_19167 - TRUCK
      ?auto_19172 - PLACE
      ?auto_19174 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19169 ?auto_19173 ) ( IS-CRATE ?auto_19162 ) ( not ( = ?auto_19161 ?auto_19162 ) ) ( not ( = ?auto_19160 ?auto_19161 ) ) ( not ( = ?auto_19160 ?auto_19162 ) ) ( not ( = ?auto_19168 ?auto_19173 ) ) ( HOIST-AT ?auto_19175 ?auto_19168 ) ( not ( = ?auto_19169 ?auto_19175 ) ) ( AVAILABLE ?auto_19175 ) ( SURFACE-AT ?auto_19162 ?auto_19168 ) ( ON ?auto_19162 ?auto_19170 ) ( CLEAR ?auto_19162 ) ( not ( = ?auto_19161 ?auto_19170 ) ) ( not ( = ?auto_19162 ?auto_19170 ) ) ( not ( = ?auto_19160 ?auto_19170 ) ) ( IS-CRATE ?auto_19161 ) ( not ( = ?auto_19163 ?auto_19173 ) ) ( not ( = ?auto_19168 ?auto_19163 ) ) ( HOIST-AT ?auto_19166 ?auto_19163 ) ( not ( = ?auto_19169 ?auto_19166 ) ) ( not ( = ?auto_19175 ?auto_19166 ) ) ( AVAILABLE ?auto_19166 ) ( SURFACE-AT ?auto_19161 ?auto_19163 ) ( ON ?auto_19161 ?auto_19176 ) ( CLEAR ?auto_19161 ) ( not ( = ?auto_19161 ?auto_19176 ) ) ( not ( = ?auto_19162 ?auto_19176 ) ) ( not ( = ?auto_19160 ?auto_19176 ) ) ( not ( = ?auto_19170 ?auto_19176 ) ) ( IS-CRATE ?auto_19160 ) ( not ( = ?auto_19159 ?auto_19160 ) ) ( not ( = ?auto_19161 ?auto_19159 ) ) ( not ( = ?auto_19162 ?auto_19159 ) ) ( not ( = ?auto_19170 ?auto_19159 ) ) ( not ( = ?auto_19176 ?auto_19159 ) ) ( not ( = ?auto_19164 ?auto_19173 ) ) ( not ( = ?auto_19168 ?auto_19164 ) ) ( not ( = ?auto_19163 ?auto_19164 ) ) ( HOIST-AT ?auto_19165 ?auto_19164 ) ( not ( = ?auto_19169 ?auto_19165 ) ) ( not ( = ?auto_19175 ?auto_19165 ) ) ( not ( = ?auto_19166 ?auto_19165 ) ) ( AVAILABLE ?auto_19165 ) ( SURFACE-AT ?auto_19160 ?auto_19164 ) ( ON ?auto_19160 ?auto_19171 ) ( CLEAR ?auto_19160 ) ( not ( = ?auto_19161 ?auto_19171 ) ) ( not ( = ?auto_19162 ?auto_19171 ) ) ( not ( = ?auto_19160 ?auto_19171 ) ) ( not ( = ?auto_19170 ?auto_19171 ) ) ( not ( = ?auto_19176 ?auto_19171 ) ) ( not ( = ?auto_19159 ?auto_19171 ) ) ( SURFACE-AT ?auto_19158 ?auto_19173 ) ( CLEAR ?auto_19158 ) ( IS-CRATE ?auto_19159 ) ( not ( = ?auto_19158 ?auto_19159 ) ) ( not ( = ?auto_19161 ?auto_19158 ) ) ( not ( = ?auto_19162 ?auto_19158 ) ) ( not ( = ?auto_19160 ?auto_19158 ) ) ( not ( = ?auto_19170 ?auto_19158 ) ) ( not ( = ?auto_19176 ?auto_19158 ) ) ( not ( = ?auto_19171 ?auto_19158 ) ) ( AVAILABLE ?auto_19169 ) ( TRUCK-AT ?auto_19167 ?auto_19172 ) ( not ( = ?auto_19172 ?auto_19173 ) ) ( not ( = ?auto_19168 ?auto_19172 ) ) ( not ( = ?auto_19163 ?auto_19172 ) ) ( not ( = ?auto_19164 ?auto_19172 ) ) ( HOIST-AT ?auto_19174 ?auto_19172 ) ( LIFTING ?auto_19174 ?auto_19159 ) ( not ( = ?auto_19169 ?auto_19174 ) ) ( not ( = ?auto_19175 ?auto_19174 ) ) ( not ( = ?auto_19166 ?auto_19174 ) ) ( not ( = ?auto_19165 ?auto_19174 ) ) ( ON ?auto_19158 ?auto_19157 ) ( not ( = ?auto_19157 ?auto_19158 ) ) ( not ( = ?auto_19157 ?auto_19159 ) ) ( not ( = ?auto_19157 ?auto_19160 ) ) ( not ( = ?auto_19157 ?auto_19161 ) ) ( not ( = ?auto_19157 ?auto_19162 ) ) ( not ( = ?auto_19157 ?auto_19170 ) ) ( not ( = ?auto_19157 ?auto_19176 ) ) ( not ( = ?auto_19157 ?auto_19171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19160 ?auto_19161 ?auto_19162 )
      ( MAKE-5CRATE-VERIFY ?auto_19157 ?auto_19158 ?auto_19159 ?auto_19160 ?auto_19161 ?auto_19162 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19177 - SURFACE
      ?auto_19178 - SURFACE
    )
    :vars
    (
      ?auto_19186 - HOIST
      ?auto_19190 - PLACE
      ?auto_19195 - SURFACE
      ?auto_19185 - PLACE
      ?auto_19193 - HOIST
      ?auto_19187 - SURFACE
      ?auto_19179 - PLACE
      ?auto_19182 - HOIST
      ?auto_19194 - SURFACE
      ?auto_19192 - SURFACE
      ?auto_19180 - PLACE
      ?auto_19181 - HOIST
      ?auto_19188 - SURFACE
      ?auto_19183 - SURFACE
      ?auto_19184 - TRUCK
      ?auto_19189 - PLACE
      ?auto_19191 - HOIST
      ?auto_19196 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19186 ?auto_19190 ) ( IS-CRATE ?auto_19178 ) ( not ( = ?auto_19177 ?auto_19178 ) ) ( not ( = ?auto_19195 ?auto_19177 ) ) ( not ( = ?auto_19195 ?auto_19178 ) ) ( not ( = ?auto_19185 ?auto_19190 ) ) ( HOIST-AT ?auto_19193 ?auto_19185 ) ( not ( = ?auto_19186 ?auto_19193 ) ) ( AVAILABLE ?auto_19193 ) ( SURFACE-AT ?auto_19178 ?auto_19185 ) ( ON ?auto_19178 ?auto_19187 ) ( CLEAR ?auto_19178 ) ( not ( = ?auto_19177 ?auto_19187 ) ) ( not ( = ?auto_19178 ?auto_19187 ) ) ( not ( = ?auto_19195 ?auto_19187 ) ) ( IS-CRATE ?auto_19177 ) ( not ( = ?auto_19179 ?auto_19190 ) ) ( not ( = ?auto_19185 ?auto_19179 ) ) ( HOIST-AT ?auto_19182 ?auto_19179 ) ( not ( = ?auto_19186 ?auto_19182 ) ) ( not ( = ?auto_19193 ?auto_19182 ) ) ( AVAILABLE ?auto_19182 ) ( SURFACE-AT ?auto_19177 ?auto_19179 ) ( ON ?auto_19177 ?auto_19194 ) ( CLEAR ?auto_19177 ) ( not ( = ?auto_19177 ?auto_19194 ) ) ( not ( = ?auto_19178 ?auto_19194 ) ) ( not ( = ?auto_19195 ?auto_19194 ) ) ( not ( = ?auto_19187 ?auto_19194 ) ) ( IS-CRATE ?auto_19195 ) ( not ( = ?auto_19192 ?auto_19195 ) ) ( not ( = ?auto_19177 ?auto_19192 ) ) ( not ( = ?auto_19178 ?auto_19192 ) ) ( not ( = ?auto_19187 ?auto_19192 ) ) ( not ( = ?auto_19194 ?auto_19192 ) ) ( not ( = ?auto_19180 ?auto_19190 ) ) ( not ( = ?auto_19185 ?auto_19180 ) ) ( not ( = ?auto_19179 ?auto_19180 ) ) ( HOIST-AT ?auto_19181 ?auto_19180 ) ( not ( = ?auto_19186 ?auto_19181 ) ) ( not ( = ?auto_19193 ?auto_19181 ) ) ( not ( = ?auto_19182 ?auto_19181 ) ) ( AVAILABLE ?auto_19181 ) ( SURFACE-AT ?auto_19195 ?auto_19180 ) ( ON ?auto_19195 ?auto_19188 ) ( CLEAR ?auto_19195 ) ( not ( = ?auto_19177 ?auto_19188 ) ) ( not ( = ?auto_19178 ?auto_19188 ) ) ( not ( = ?auto_19195 ?auto_19188 ) ) ( not ( = ?auto_19187 ?auto_19188 ) ) ( not ( = ?auto_19194 ?auto_19188 ) ) ( not ( = ?auto_19192 ?auto_19188 ) ) ( SURFACE-AT ?auto_19183 ?auto_19190 ) ( CLEAR ?auto_19183 ) ( IS-CRATE ?auto_19192 ) ( not ( = ?auto_19183 ?auto_19192 ) ) ( not ( = ?auto_19177 ?auto_19183 ) ) ( not ( = ?auto_19178 ?auto_19183 ) ) ( not ( = ?auto_19195 ?auto_19183 ) ) ( not ( = ?auto_19187 ?auto_19183 ) ) ( not ( = ?auto_19194 ?auto_19183 ) ) ( not ( = ?auto_19188 ?auto_19183 ) ) ( AVAILABLE ?auto_19186 ) ( TRUCK-AT ?auto_19184 ?auto_19189 ) ( not ( = ?auto_19189 ?auto_19190 ) ) ( not ( = ?auto_19185 ?auto_19189 ) ) ( not ( = ?auto_19179 ?auto_19189 ) ) ( not ( = ?auto_19180 ?auto_19189 ) ) ( HOIST-AT ?auto_19191 ?auto_19189 ) ( not ( = ?auto_19186 ?auto_19191 ) ) ( not ( = ?auto_19193 ?auto_19191 ) ) ( not ( = ?auto_19182 ?auto_19191 ) ) ( not ( = ?auto_19181 ?auto_19191 ) ) ( AVAILABLE ?auto_19191 ) ( SURFACE-AT ?auto_19192 ?auto_19189 ) ( ON ?auto_19192 ?auto_19196 ) ( CLEAR ?auto_19192 ) ( not ( = ?auto_19177 ?auto_19196 ) ) ( not ( = ?auto_19178 ?auto_19196 ) ) ( not ( = ?auto_19195 ?auto_19196 ) ) ( not ( = ?auto_19187 ?auto_19196 ) ) ( not ( = ?auto_19194 ?auto_19196 ) ) ( not ( = ?auto_19192 ?auto_19196 ) ) ( not ( = ?auto_19188 ?auto_19196 ) ) ( not ( = ?auto_19183 ?auto_19196 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19191 ?auto_19192 ?auto_19196 ?auto_19189 )
      ( MAKE-2CRATE ?auto_19195 ?auto_19177 ?auto_19178 )
      ( MAKE-1CRATE-VERIFY ?auto_19177 ?auto_19178 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19197 - SURFACE
      ?auto_19198 - SURFACE
      ?auto_19199 - SURFACE
    )
    :vars
    (
      ?auto_19205 - HOIST
      ?auto_19200 - PLACE
      ?auto_19206 - PLACE
      ?auto_19211 - HOIST
      ?auto_19215 - SURFACE
      ?auto_19208 - PLACE
      ?auto_19203 - HOIST
      ?auto_19209 - SURFACE
      ?auto_19214 - SURFACE
      ?auto_19201 - PLACE
      ?auto_19202 - HOIST
      ?auto_19210 - SURFACE
      ?auto_19207 - SURFACE
      ?auto_19212 - TRUCK
      ?auto_19204 - PLACE
      ?auto_19213 - HOIST
      ?auto_19216 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19205 ?auto_19200 ) ( IS-CRATE ?auto_19199 ) ( not ( = ?auto_19198 ?auto_19199 ) ) ( not ( = ?auto_19197 ?auto_19198 ) ) ( not ( = ?auto_19197 ?auto_19199 ) ) ( not ( = ?auto_19206 ?auto_19200 ) ) ( HOIST-AT ?auto_19211 ?auto_19206 ) ( not ( = ?auto_19205 ?auto_19211 ) ) ( AVAILABLE ?auto_19211 ) ( SURFACE-AT ?auto_19199 ?auto_19206 ) ( ON ?auto_19199 ?auto_19215 ) ( CLEAR ?auto_19199 ) ( not ( = ?auto_19198 ?auto_19215 ) ) ( not ( = ?auto_19199 ?auto_19215 ) ) ( not ( = ?auto_19197 ?auto_19215 ) ) ( IS-CRATE ?auto_19198 ) ( not ( = ?auto_19208 ?auto_19200 ) ) ( not ( = ?auto_19206 ?auto_19208 ) ) ( HOIST-AT ?auto_19203 ?auto_19208 ) ( not ( = ?auto_19205 ?auto_19203 ) ) ( not ( = ?auto_19211 ?auto_19203 ) ) ( AVAILABLE ?auto_19203 ) ( SURFACE-AT ?auto_19198 ?auto_19208 ) ( ON ?auto_19198 ?auto_19209 ) ( CLEAR ?auto_19198 ) ( not ( = ?auto_19198 ?auto_19209 ) ) ( not ( = ?auto_19199 ?auto_19209 ) ) ( not ( = ?auto_19197 ?auto_19209 ) ) ( not ( = ?auto_19215 ?auto_19209 ) ) ( IS-CRATE ?auto_19197 ) ( not ( = ?auto_19214 ?auto_19197 ) ) ( not ( = ?auto_19198 ?auto_19214 ) ) ( not ( = ?auto_19199 ?auto_19214 ) ) ( not ( = ?auto_19215 ?auto_19214 ) ) ( not ( = ?auto_19209 ?auto_19214 ) ) ( not ( = ?auto_19201 ?auto_19200 ) ) ( not ( = ?auto_19206 ?auto_19201 ) ) ( not ( = ?auto_19208 ?auto_19201 ) ) ( HOIST-AT ?auto_19202 ?auto_19201 ) ( not ( = ?auto_19205 ?auto_19202 ) ) ( not ( = ?auto_19211 ?auto_19202 ) ) ( not ( = ?auto_19203 ?auto_19202 ) ) ( AVAILABLE ?auto_19202 ) ( SURFACE-AT ?auto_19197 ?auto_19201 ) ( ON ?auto_19197 ?auto_19210 ) ( CLEAR ?auto_19197 ) ( not ( = ?auto_19198 ?auto_19210 ) ) ( not ( = ?auto_19199 ?auto_19210 ) ) ( not ( = ?auto_19197 ?auto_19210 ) ) ( not ( = ?auto_19215 ?auto_19210 ) ) ( not ( = ?auto_19209 ?auto_19210 ) ) ( not ( = ?auto_19214 ?auto_19210 ) ) ( SURFACE-AT ?auto_19207 ?auto_19200 ) ( CLEAR ?auto_19207 ) ( IS-CRATE ?auto_19214 ) ( not ( = ?auto_19207 ?auto_19214 ) ) ( not ( = ?auto_19198 ?auto_19207 ) ) ( not ( = ?auto_19199 ?auto_19207 ) ) ( not ( = ?auto_19197 ?auto_19207 ) ) ( not ( = ?auto_19215 ?auto_19207 ) ) ( not ( = ?auto_19209 ?auto_19207 ) ) ( not ( = ?auto_19210 ?auto_19207 ) ) ( AVAILABLE ?auto_19205 ) ( TRUCK-AT ?auto_19212 ?auto_19204 ) ( not ( = ?auto_19204 ?auto_19200 ) ) ( not ( = ?auto_19206 ?auto_19204 ) ) ( not ( = ?auto_19208 ?auto_19204 ) ) ( not ( = ?auto_19201 ?auto_19204 ) ) ( HOIST-AT ?auto_19213 ?auto_19204 ) ( not ( = ?auto_19205 ?auto_19213 ) ) ( not ( = ?auto_19211 ?auto_19213 ) ) ( not ( = ?auto_19203 ?auto_19213 ) ) ( not ( = ?auto_19202 ?auto_19213 ) ) ( AVAILABLE ?auto_19213 ) ( SURFACE-AT ?auto_19214 ?auto_19204 ) ( ON ?auto_19214 ?auto_19216 ) ( CLEAR ?auto_19214 ) ( not ( = ?auto_19198 ?auto_19216 ) ) ( not ( = ?auto_19199 ?auto_19216 ) ) ( not ( = ?auto_19197 ?auto_19216 ) ) ( not ( = ?auto_19215 ?auto_19216 ) ) ( not ( = ?auto_19209 ?auto_19216 ) ) ( not ( = ?auto_19214 ?auto_19216 ) ) ( not ( = ?auto_19210 ?auto_19216 ) ) ( not ( = ?auto_19207 ?auto_19216 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19198 ?auto_19199 )
      ( MAKE-2CRATE-VERIFY ?auto_19197 ?auto_19198 ?auto_19199 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19217 - SURFACE
      ?auto_19218 - SURFACE
      ?auto_19219 - SURFACE
      ?auto_19220 - SURFACE
    )
    :vars
    (
      ?auto_19233 - HOIST
      ?auto_19230 - PLACE
      ?auto_19226 - PLACE
      ?auto_19236 - HOIST
      ?auto_19222 - SURFACE
      ?auto_19231 - PLACE
      ?auto_19229 - HOIST
      ?auto_19228 - SURFACE
      ?auto_19235 - PLACE
      ?auto_19225 - HOIST
      ?auto_19232 - SURFACE
      ?auto_19224 - SURFACE
      ?auto_19223 - TRUCK
      ?auto_19221 - PLACE
      ?auto_19234 - HOIST
      ?auto_19227 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19233 ?auto_19230 ) ( IS-CRATE ?auto_19220 ) ( not ( = ?auto_19219 ?auto_19220 ) ) ( not ( = ?auto_19218 ?auto_19219 ) ) ( not ( = ?auto_19218 ?auto_19220 ) ) ( not ( = ?auto_19226 ?auto_19230 ) ) ( HOIST-AT ?auto_19236 ?auto_19226 ) ( not ( = ?auto_19233 ?auto_19236 ) ) ( AVAILABLE ?auto_19236 ) ( SURFACE-AT ?auto_19220 ?auto_19226 ) ( ON ?auto_19220 ?auto_19222 ) ( CLEAR ?auto_19220 ) ( not ( = ?auto_19219 ?auto_19222 ) ) ( not ( = ?auto_19220 ?auto_19222 ) ) ( not ( = ?auto_19218 ?auto_19222 ) ) ( IS-CRATE ?auto_19219 ) ( not ( = ?auto_19231 ?auto_19230 ) ) ( not ( = ?auto_19226 ?auto_19231 ) ) ( HOIST-AT ?auto_19229 ?auto_19231 ) ( not ( = ?auto_19233 ?auto_19229 ) ) ( not ( = ?auto_19236 ?auto_19229 ) ) ( AVAILABLE ?auto_19229 ) ( SURFACE-AT ?auto_19219 ?auto_19231 ) ( ON ?auto_19219 ?auto_19228 ) ( CLEAR ?auto_19219 ) ( not ( = ?auto_19219 ?auto_19228 ) ) ( not ( = ?auto_19220 ?auto_19228 ) ) ( not ( = ?auto_19218 ?auto_19228 ) ) ( not ( = ?auto_19222 ?auto_19228 ) ) ( IS-CRATE ?auto_19218 ) ( not ( = ?auto_19217 ?auto_19218 ) ) ( not ( = ?auto_19219 ?auto_19217 ) ) ( not ( = ?auto_19220 ?auto_19217 ) ) ( not ( = ?auto_19222 ?auto_19217 ) ) ( not ( = ?auto_19228 ?auto_19217 ) ) ( not ( = ?auto_19235 ?auto_19230 ) ) ( not ( = ?auto_19226 ?auto_19235 ) ) ( not ( = ?auto_19231 ?auto_19235 ) ) ( HOIST-AT ?auto_19225 ?auto_19235 ) ( not ( = ?auto_19233 ?auto_19225 ) ) ( not ( = ?auto_19236 ?auto_19225 ) ) ( not ( = ?auto_19229 ?auto_19225 ) ) ( AVAILABLE ?auto_19225 ) ( SURFACE-AT ?auto_19218 ?auto_19235 ) ( ON ?auto_19218 ?auto_19232 ) ( CLEAR ?auto_19218 ) ( not ( = ?auto_19219 ?auto_19232 ) ) ( not ( = ?auto_19220 ?auto_19232 ) ) ( not ( = ?auto_19218 ?auto_19232 ) ) ( not ( = ?auto_19222 ?auto_19232 ) ) ( not ( = ?auto_19228 ?auto_19232 ) ) ( not ( = ?auto_19217 ?auto_19232 ) ) ( SURFACE-AT ?auto_19224 ?auto_19230 ) ( CLEAR ?auto_19224 ) ( IS-CRATE ?auto_19217 ) ( not ( = ?auto_19224 ?auto_19217 ) ) ( not ( = ?auto_19219 ?auto_19224 ) ) ( not ( = ?auto_19220 ?auto_19224 ) ) ( not ( = ?auto_19218 ?auto_19224 ) ) ( not ( = ?auto_19222 ?auto_19224 ) ) ( not ( = ?auto_19228 ?auto_19224 ) ) ( not ( = ?auto_19232 ?auto_19224 ) ) ( AVAILABLE ?auto_19233 ) ( TRUCK-AT ?auto_19223 ?auto_19221 ) ( not ( = ?auto_19221 ?auto_19230 ) ) ( not ( = ?auto_19226 ?auto_19221 ) ) ( not ( = ?auto_19231 ?auto_19221 ) ) ( not ( = ?auto_19235 ?auto_19221 ) ) ( HOIST-AT ?auto_19234 ?auto_19221 ) ( not ( = ?auto_19233 ?auto_19234 ) ) ( not ( = ?auto_19236 ?auto_19234 ) ) ( not ( = ?auto_19229 ?auto_19234 ) ) ( not ( = ?auto_19225 ?auto_19234 ) ) ( AVAILABLE ?auto_19234 ) ( SURFACE-AT ?auto_19217 ?auto_19221 ) ( ON ?auto_19217 ?auto_19227 ) ( CLEAR ?auto_19217 ) ( not ( = ?auto_19219 ?auto_19227 ) ) ( not ( = ?auto_19220 ?auto_19227 ) ) ( not ( = ?auto_19218 ?auto_19227 ) ) ( not ( = ?auto_19222 ?auto_19227 ) ) ( not ( = ?auto_19228 ?auto_19227 ) ) ( not ( = ?auto_19217 ?auto_19227 ) ) ( not ( = ?auto_19232 ?auto_19227 ) ) ( not ( = ?auto_19224 ?auto_19227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19218 ?auto_19219 ?auto_19220 )
      ( MAKE-3CRATE-VERIFY ?auto_19217 ?auto_19218 ?auto_19219 ?auto_19220 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19237 - SURFACE
      ?auto_19238 - SURFACE
      ?auto_19239 - SURFACE
      ?auto_19240 - SURFACE
      ?auto_19241 - SURFACE
    )
    :vars
    (
      ?auto_19253 - HOIST
      ?auto_19250 - PLACE
      ?auto_19246 - PLACE
      ?auto_19256 - HOIST
      ?auto_19243 - SURFACE
      ?auto_19251 - PLACE
      ?auto_19249 - HOIST
      ?auto_19248 - SURFACE
      ?auto_19255 - PLACE
      ?auto_19245 - HOIST
      ?auto_19252 - SURFACE
      ?auto_19244 - TRUCK
      ?auto_19242 - PLACE
      ?auto_19254 - HOIST
      ?auto_19247 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19253 ?auto_19250 ) ( IS-CRATE ?auto_19241 ) ( not ( = ?auto_19240 ?auto_19241 ) ) ( not ( = ?auto_19239 ?auto_19240 ) ) ( not ( = ?auto_19239 ?auto_19241 ) ) ( not ( = ?auto_19246 ?auto_19250 ) ) ( HOIST-AT ?auto_19256 ?auto_19246 ) ( not ( = ?auto_19253 ?auto_19256 ) ) ( AVAILABLE ?auto_19256 ) ( SURFACE-AT ?auto_19241 ?auto_19246 ) ( ON ?auto_19241 ?auto_19243 ) ( CLEAR ?auto_19241 ) ( not ( = ?auto_19240 ?auto_19243 ) ) ( not ( = ?auto_19241 ?auto_19243 ) ) ( not ( = ?auto_19239 ?auto_19243 ) ) ( IS-CRATE ?auto_19240 ) ( not ( = ?auto_19251 ?auto_19250 ) ) ( not ( = ?auto_19246 ?auto_19251 ) ) ( HOIST-AT ?auto_19249 ?auto_19251 ) ( not ( = ?auto_19253 ?auto_19249 ) ) ( not ( = ?auto_19256 ?auto_19249 ) ) ( AVAILABLE ?auto_19249 ) ( SURFACE-AT ?auto_19240 ?auto_19251 ) ( ON ?auto_19240 ?auto_19248 ) ( CLEAR ?auto_19240 ) ( not ( = ?auto_19240 ?auto_19248 ) ) ( not ( = ?auto_19241 ?auto_19248 ) ) ( not ( = ?auto_19239 ?auto_19248 ) ) ( not ( = ?auto_19243 ?auto_19248 ) ) ( IS-CRATE ?auto_19239 ) ( not ( = ?auto_19238 ?auto_19239 ) ) ( not ( = ?auto_19240 ?auto_19238 ) ) ( not ( = ?auto_19241 ?auto_19238 ) ) ( not ( = ?auto_19243 ?auto_19238 ) ) ( not ( = ?auto_19248 ?auto_19238 ) ) ( not ( = ?auto_19255 ?auto_19250 ) ) ( not ( = ?auto_19246 ?auto_19255 ) ) ( not ( = ?auto_19251 ?auto_19255 ) ) ( HOIST-AT ?auto_19245 ?auto_19255 ) ( not ( = ?auto_19253 ?auto_19245 ) ) ( not ( = ?auto_19256 ?auto_19245 ) ) ( not ( = ?auto_19249 ?auto_19245 ) ) ( AVAILABLE ?auto_19245 ) ( SURFACE-AT ?auto_19239 ?auto_19255 ) ( ON ?auto_19239 ?auto_19252 ) ( CLEAR ?auto_19239 ) ( not ( = ?auto_19240 ?auto_19252 ) ) ( not ( = ?auto_19241 ?auto_19252 ) ) ( not ( = ?auto_19239 ?auto_19252 ) ) ( not ( = ?auto_19243 ?auto_19252 ) ) ( not ( = ?auto_19248 ?auto_19252 ) ) ( not ( = ?auto_19238 ?auto_19252 ) ) ( SURFACE-AT ?auto_19237 ?auto_19250 ) ( CLEAR ?auto_19237 ) ( IS-CRATE ?auto_19238 ) ( not ( = ?auto_19237 ?auto_19238 ) ) ( not ( = ?auto_19240 ?auto_19237 ) ) ( not ( = ?auto_19241 ?auto_19237 ) ) ( not ( = ?auto_19239 ?auto_19237 ) ) ( not ( = ?auto_19243 ?auto_19237 ) ) ( not ( = ?auto_19248 ?auto_19237 ) ) ( not ( = ?auto_19252 ?auto_19237 ) ) ( AVAILABLE ?auto_19253 ) ( TRUCK-AT ?auto_19244 ?auto_19242 ) ( not ( = ?auto_19242 ?auto_19250 ) ) ( not ( = ?auto_19246 ?auto_19242 ) ) ( not ( = ?auto_19251 ?auto_19242 ) ) ( not ( = ?auto_19255 ?auto_19242 ) ) ( HOIST-AT ?auto_19254 ?auto_19242 ) ( not ( = ?auto_19253 ?auto_19254 ) ) ( not ( = ?auto_19256 ?auto_19254 ) ) ( not ( = ?auto_19249 ?auto_19254 ) ) ( not ( = ?auto_19245 ?auto_19254 ) ) ( AVAILABLE ?auto_19254 ) ( SURFACE-AT ?auto_19238 ?auto_19242 ) ( ON ?auto_19238 ?auto_19247 ) ( CLEAR ?auto_19238 ) ( not ( = ?auto_19240 ?auto_19247 ) ) ( not ( = ?auto_19241 ?auto_19247 ) ) ( not ( = ?auto_19239 ?auto_19247 ) ) ( not ( = ?auto_19243 ?auto_19247 ) ) ( not ( = ?auto_19248 ?auto_19247 ) ) ( not ( = ?auto_19238 ?auto_19247 ) ) ( not ( = ?auto_19252 ?auto_19247 ) ) ( not ( = ?auto_19237 ?auto_19247 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19239 ?auto_19240 ?auto_19241 )
      ( MAKE-4CRATE-VERIFY ?auto_19237 ?auto_19238 ?auto_19239 ?auto_19240 ?auto_19241 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19257 - SURFACE
      ?auto_19258 - SURFACE
      ?auto_19259 - SURFACE
      ?auto_19260 - SURFACE
      ?auto_19261 - SURFACE
      ?auto_19262 - SURFACE
    )
    :vars
    (
      ?auto_19274 - HOIST
      ?auto_19271 - PLACE
      ?auto_19267 - PLACE
      ?auto_19277 - HOIST
      ?auto_19264 - SURFACE
      ?auto_19272 - PLACE
      ?auto_19270 - HOIST
      ?auto_19269 - SURFACE
      ?auto_19276 - PLACE
      ?auto_19266 - HOIST
      ?auto_19273 - SURFACE
      ?auto_19265 - TRUCK
      ?auto_19263 - PLACE
      ?auto_19275 - HOIST
      ?auto_19268 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19274 ?auto_19271 ) ( IS-CRATE ?auto_19262 ) ( not ( = ?auto_19261 ?auto_19262 ) ) ( not ( = ?auto_19260 ?auto_19261 ) ) ( not ( = ?auto_19260 ?auto_19262 ) ) ( not ( = ?auto_19267 ?auto_19271 ) ) ( HOIST-AT ?auto_19277 ?auto_19267 ) ( not ( = ?auto_19274 ?auto_19277 ) ) ( AVAILABLE ?auto_19277 ) ( SURFACE-AT ?auto_19262 ?auto_19267 ) ( ON ?auto_19262 ?auto_19264 ) ( CLEAR ?auto_19262 ) ( not ( = ?auto_19261 ?auto_19264 ) ) ( not ( = ?auto_19262 ?auto_19264 ) ) ( not ( = ?auto_19260 ?auto_19264 ) ) ( IS-CRATE ?auto_19261 ) ( not ( = ?auto_19272 ?auto_19271 ) ) ( not ( = ?auto_19267 ?auto_19272 ) ) ( HOIST-AT ?auto_19270 ?auto_19272 ) ( not ( = ?auto_19274 ?auto_19270 ) ) ( not ( = ?auto_19277 ?auto_19270 ) ) ( AVAILABLE ?auto_19270 ) ( SURFACE-AT ?auto_19261 ?auto_19272 ) ( ON ?auto_19261 ?auto_19269 ) ( CLEAR ?auto_19261 ) ( not ( = ?auto_19261 ?auto_19269 ) ) ( not ( = ?auto_19262 ?auto_19269 ) ) ( not ( = ?auto_19260 ?auto_19269 ) ) ( not ( = ?auto_19264 ?auto_19269 ) ) ( IS-CRATE ?auto_19260 ) ( not ( = ?auto_19259 ?auto_19260 ) ) ( not ( = ?auto_19261 ?auto_19259 ) ) ( not ( = ?auto_19262 ?auto_19259 ) ) ( not ( = ?auto_19264 ?auto_19259 ) ) ( not ( = ?auto_19269 ?auto_19259 ) ) ( not ( = ?auto_19276 ?auto_19271 ) ) ( not ( = ?auto_19267 ?auto_19276 ) ) ( not ( = ?auto_19272 ?auto_19276 ) ) ( HOIST-AT ?auto_19266 ?auto_19276 ) ( not ( = ?auto_19274 ?auto_19266 ) ) ( not ( = ?auto_19277 ?auto_19266 ) ) ( not ( = ?auto_19270 ?auto_19266 ) ) ( AVAILABLE ?auto_19266 ) ( SURFACE-AT ?auto_19260 ?auto_19276 ) ( ON ?auto_19260 ?auto_19273 ) ( CLEAR ?auto_19260 ) ( not ( = ?auto_19261 ?auto_19273 ) ) ( not ( = ?auto_19262 ?auto_19273 ) ) ( not ( = ?auto_19260 ?auto_19273 ) ) ( not ( = ?auto_19264 ?auto_19273 ) ) ( not ( = ?auto_19269 ?auto_19273 ) ) ( not ( = ?auto_19259 ?auto_19273 ) ) ( SURFACE-AT ?auto_19258 ?auto_19271 ) ( CLEAR ?auto_19258 ) ( IS-CRATE ?auto_19259 ) ( not ( = ?auto_19258 ?auto_19259 ) ) ( not ( = ?auto_19261 ?auto_19258 ) ) ( not ( = ?auto_19262 ?auto_19258 ) ) ( not ( = ?auto_19260 ?auto_19258 ) ) ( not ( = ?auto_19264 ?auto_19258 ) ) ( not ( = ?auto_19269 ?auto_19258 ) ) ( not ( = ?auto_19273 ?auto_19258 ) ) ( AVAILABLE ?auto_19274 ) ( TRUCK-AT ?auto_19265 ?auto_19263 ) ( not ( = ?auto_19263 ?auto_19271 ) ) ( not ( = ?auto_19267 ?auto_19263 ) ) ( not ( = ?auto_19272 ?auto_19263 ) ) ( not ( = ?auto_19276 ?auto_19263 ) ) ( HOIST-AT ?auto_19275 ?auto_19263 ) ( not ( = ?auto_19274 ?auto_19275 ) ) ( not ( = ?auto_19277 ?auto_19275 ) ) ( not ( = ?auto_19270 ?auto_19275 ) ) ( not ( = ?auto_19266 ?auto_19275 ) ) ( AVAILABLE ?auto_19275 ) ( SURFACE-AT ?auto_19259 ?auto_19263 ) ( ON ?auto_19259 ?auto_19268 ) ( CLEAR ?auto_19259 ) ( not ( = ?auto_19261 ?auto_19268 ) ) ( not ( = ?auto_19262 ?auto_19268 ) ) ( not ( = ?auto_19260 ?auto_19268 ) ) ( not ( = ?auto_19264 ?auto_19268 ) ) ( not ( = ?auto_19269 ?auto_19268 ) ) ( not ( = ?auto_19259 ?auto_19268 ) ) ( not ( = ?auto_19273 ?auto_19268 ) ) ( not ( = ?auto_19258 ?auto_19268 ) ) ( ON ?auto_19258 ?auto_19257 ) ( not ( = ?auto_19257 ?auto_19258 ) ) ( not ( = ?auto_19257 ?auto_19259 ) ) ( not ( = ?auto_19257 ?auto_19260 ) ) ( not ( = ?auto_19257 ?auto_19261 ) ) ( not ( = ?auto_19257 ?auto_19262 ) ) ( not ( = ?auto_19257 ?auto_19264 ) ) ( not ( = ?auto_19257 ?auto_19269 ) ) ( not ( = ?auto_19257 ?auto_19273 ) ) ( not ( = ?auto_19257 ?auto_19268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19260 ?auto_19261 ?auto_19262 )
      ( MAKE-5CRATE-VERIFY ?auto_19257 ?auto_19258 ?auto_19259 ?auto_19260 ?auto_19261 ?auto_19262 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19278 - SURFACE
      ?auto_19279 - SURFACE
    )
    :vars
    (
      ?auto_19293 - HOIST
      ?auto_19290 - PLACE
      ?auto_19297 - SURFACE
      ?auto_19286 - PLACE
      ?auto_19296 - HOIST
      ?auto_19281 - SURFACE
      ?auto_19291 - PLACE
      ?auto_19289 - HOIST
      ?auto_19288 - SURFACE
      ?auto_19282 - SURFACE
      ?auto_19295 - PLACE
      ?auto_19285 - HOIST
      ?auto_19292 - SURFACE
      ?auto_19284 - SURFACE
      ?auto_19280 - PLACE
      ?auto_19294 - HOIST
      ?auto_19287 - SURFACE
      ?auto_19283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19293 ?auto_19290 ) ( IS-CRATE ?auto_19279 ) ( not ( = ?auto_19278 ?auto_19279 ) ) ( not ( = ?auto_19297 ?auto_19278 ) ) ( not ( = ?auto_19297 ?auto_19279 ) ) ( not ( = ?auto_19286 ?auto_19290 ) ) ( HOIST-AT ?auto_19296 ?auto_19286 ) ( not ( = ?auto_19293 ?auto_19296 ) ) ( AVAILABLE ?auto_19296 ) ( SURFACE-AT ?auto_19279 ?auto_19286 ) ( ON ?auto_19279 ?auto_19281 ) ( CLEAR ?auto_19279 ) ( not ( = ?auto_19278 ?auto_19281 ) ) ( not ( = ?auto_19279 ?auto_19281 ) ) ( not ( = ?auto_19297 ?auto_19281 ) ) ( IS-CRATE ?auto_19278 ) ( not ( = ?auto_19291 ?auto_19290 ) ) ( not ( = ?auto_19286 ?auto_19291 ) ) ( HOIST-AT ?auto_19289 ?auto_19291 ) ( not ( = ?auto_19293 ?auto_19289 ) ) ( not ( = ?auto_19296 ?auto_19289 ) ) ( AVAILABLE ?auto_19289 ) ( SURFACE-AT ?auto_19278 ?auto_19291 ) ( ON ?auto_19278 ?auto_19288 ) ( CLEAR ?auto_19278 ) ( not ( = ?auto_19278 ?auto_19288 ) ) ( not ( = ?auto_19279 ?auto_19288 ) ) ( not ( = ?auto_19297 ?auto_19288 ) ) ( not ( = ?auto_19281 ?auto_19288 ) ) ( IS-CRATE ?auto_19297 ) ( not ( = ?auto_19282 ?auto_19297 ) ) ( not ( = ?auto_19278 ?auto_19282 ) ) ( not ( = ?auto_19279 ?auto_19282 ) ) ( not ( = ?auto_19281 ?auto_19282 ) ) ( not ( = ?auto_19288 ?auto_19282 ) ) ( not ( = ?auto_19295 ?auto_19290 ) ) ( not ( = ?auto_19286 ?auto_19295 ) ) ( not ( = ?auto_19291 ?auto_19295 ) ) ( HOIST-AT ?auto_19285 ?auto_19295 ) ( not ( = ?auto_19293 ?auto_19285 ) ) ( not ( = ?auto_19296 ?auto_19285 ) ) ( not ( = ?auto_19289 ?auto_19285 ) ) ( AVAILABLE ?auto_19285 ) ( SURFACE-AT ?auto_19297 ?auto_19295 ) ( ON ?auto_19297 ?auto_19292 ) ( CLEAR ?auto_19297 ) ( not ( = ?auto_19278 ?auto_19292 ) ) ( not ( = ?auto_19279 ?auto_19292 ) ) ( not ( = ?auto_19297 ?auto_19292 ) ) ( not ( = ?auto_19281 ?auto_19292 ) ) ( not ( = ?auto_19288 ?auto_19292 ) ) ( not ( = ?auto_19282 ?auto_19292 ) ) ( SURFACE-AT ?auto_19284 ?auto_19290 ) ( CLEAR ?auto_19284 ) ( IS-CRATE ?auto_19282 ) ( not ( = ?auto_19284 ?auto_19282 ) ) ( not ( = ?auto_19278 ?auto_19284 ) ) ( not ( = ?auto_19279 ?auto_19284 ) ) ( not ( = ?auto_19297 ?auto_19284 ) ) ( not ( = ?auto_19281 ?auto_19284 ) ) ( not ( = ?auto_19288 ?auto_19284 ) ) ( not ( = ?auto_19292 ?auto_19284 ) ) ( AVAILABLE ?auto_19293 ) ( not ( = ?auto_19280 ?auto_19290 ) ) ( not ( = ?auto_19286 ?auto_19280 ) ) ( not ( = ?auto_19291 ?auto_19280 ) ) ( not ( = ?auto_19295 ?auto_19280 ) ) ( HOIST-AT ?auto_19294 ?auto_19280 ) ( not ( = ?auto_19293 ?auto_19294 ) ) ( not ( = ?auto_19296 ?auto_19294 ) ) ( not ( = ?auto_19289 ?auto_19294 ) ) ( not ( = ?auto_19285 ?auto_19294 ) ) ( AVAILABLE ?auto_19294 ) ( SURFACE-AT ?auto_19282 ?auto_19280 ) ( ON ?auto_19282 ?auto_19287 ) ( CLEAR ?auto_19282 ) ( not ( = ?auto_19278 ?auto_19287 ) ) ( not ( = ?auto_19279 ?auto_19287 ) ) ( not ( = ?auto_19297 ?auto_19287 ) ) ( not ( = ?auto_19281 ?auto_19287 ) ) ( not ( = ?auto_19288 ?auto_19287 ) ) ( not ( = ?auto_19282 ?auto_19287 ) ) ( not ( = ?auto_19292 ?auto_19287 ) ) ( not ( = ?auto_19284 ?auto_19287 ) ) ( TRUCK-AT ?auto_19283 ?auto_19290 ) )
    :subtasks
    ( ( !DRIVE ?auto_19283 ?auto_19290 ?auto_19280 )
      ( MAKE-2CRATE ?auto_19297 ?auto_19278 ?auto_19279 )
      ( MAKE-1CRATE-VERIFY ?auto_19278 ?auto_19279 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19298 - SURFACE
      ?auto_19299 - SURFACE
      ?auto_19300 - SURFACE
    )
    :vars
    (
      ?auto_19304 - HOIST
      ?auto_19316 - PLACE
      ?auto_19314 - PLACE
      ?auto_19302 - HOIST
      ?auto_19307 - SURFACE
      ?auto_19308 - PLACE
      ?auto_19306 - HOIST
      ?auto_19312 - SURFACE
      ?auto_19303 - SURFACE
      ?auto_19315 - PLACE
      ?auto_19317 - HOIST
      ?auto_19301 - SURFACE
      ?auto_19310 - SURFACE
      ?auto_19313 - PLACE
      ?auto_19311 - HOIST
      ?auto_19305 - SURFACE
      ?auto_19309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19304 ?auto_19316 ) ( IS-CRATE ?auto_19300 ) ( not ( = ?auto_19299 ?auto_19300 ) ) ( not ( = ?auto_19298 ?auto_19299 ) ) ( not ( = ?auto_19298 ?auto_19300 ) ) ( not ( = ?auto_19314 ?auto_19316 ) ) ( HOIST-AT ?auto_19302 ?auto_19314 ) ( not ( = ?auto_19304 ?auto_19302 ) ) ( AVAILABLE ?auto_19302 ) ( SURFACE-AT ?auto_19300 ?auto_19314 ) ( ON ?auto_19300 ?auto_19307 ) ( CLEAR ?auto_19300 ) ( not ( = ?auto_19299 ?auto_19307 ) ) ( not ( = ?auto_19300 ?auto_19307 ) ) ( not ( = ?auto_19298 ?auto_19307 ) ) ( IS-CRATE ?auto_19299 ) ( not ( = ?auto_19308 ?auto_19316 ) ) ( not ( = ?auto_19314 ?auto_19308 ) ) ( HOIST-AT ?auto_19306 ?auto_19308 ) ( not ( = ?auto_19304 ?auto_19306 ) ) ( not ( = ?auto_19302 ?auto_19306 ) ) ( AVAILABLE ?auto_19306 ) ( SURFACE-AT ?auto_19299 ?auto_19308 ) ( ON ?auto_19299 ?auto_19312 ) ( CLEAR ?auto_19299 ) ( not ( = ?auto_19299 ?auto_19312 ) ) ( not ( = ?auto_19300 ?auto_19312 ) ) ( not ( = ?auto_19298 ?auto_19312 ) ) ( not ( = ?auto_19307 ?auto_19312 ) ) ( IS-CRATE ?auto_19298 ) ( not ( = ?auto_19303 ?auto_19298 ) ) ( not ( = ?auto_19299 ?auto_19303 ) ) ( not ( = ?auto_19300 ?auto_19303 ) ) ( not ( = ?auto_19307 ?auto_19303 ) ) ( not ( = ?auto_19312 ?auto_19303 ) ) ( not ( = ?auto_19315 ?auto_19316 ) ) ( not ( = ?auto_19314 ?auto_19315 ) ) ( not ( = ?auto_19308 ?auto_19315 ) ) ( HOIST-AT ?auto_19317 ?auto_19315 ) ( not ( = ?auto_19304 ?auto_19317 ) ) ( not ( = ?auto_19302 ?auto_19317 ) ) ( not ( = ?auto_19306 ?auto_19317 ) ) ( AVAILABLE ?auto_19317 ) ( SURFACE-AT ?auto_19298 ?auto_19315 ) ( ON ?auto_19298 ?auto_19301 ) ( CLEAR ?auto_19298 ) ( not ( = ?auto_19299 ?auto_19301 ) ) ( not ( = ?auto_19300 ?auto_19301 ) ) ( not ( = ?auto_19298 ?auto_19301 ) ) ( not ( = ?auto_19307 ?auto_19301 ) ) ( not ( = ?auto_19312 ?auto_19301 ) ) ( not ( = ?auto_19303 ?auto_19301 ) ) ( SURFACE-AT ?auto_19310 ?auto_19316 ) ( CLEAR ?auto_19310 ) ( IS-CRATE ?auto_19303 ) ( not ( = ?auto_19310 ?auto_19303 ) ) ( not ( = ?auto_19299 ?auto_19310 ) ) ( not ( = ?auto_19300 ?auto_19310 ) ) ( not ( = ?auto_19298 ?auto_19310 ) ) ( not ( = ?auto_19307 ?auto_19310 ) ) ( not ( = ?auto_19312 ?auto_19310 ) ) ( not ( = ?auto_19301 ?auto_19310 ) ) ( AVAILABLE ?auto_19304 ) ( not ( = ?auto_19313 ?auto_19316 ) ) ( not ( = ?auto_19314 ?auto_19313 ) ) ( not ( = ?auto_19308 ?auto_19313 ) ) ( not ( = ?auto_19315 ?auto_19313 ) ) ( HOIST-AT ?auto_19311 ?auto_19313 ) ( not ( = ?auto_19304 ?auto_19311 ) ) ( not ( = ?auto_19302 ?auto_19311 ) ) ( not ( = ?auto_19306 ?auto_19311 ) ) ( not ( = ?auto_19317 ?auto_19311 ) ) ( AVAILABLE ?auto_19311 ) ( SURFACE-AT ?auto_19303 ?auto_19313 ) ( ON ?auto_19303 ?auto_19305 ) ( CLEAR ?auto_19303 ) ( not ( = ?auto_19299 ?auto_19305 ) ) ( not ( = ?auto_19300 ?auto_19305 ) ) ( not ( = ?auto_19298 ?auto_19305 ) ) ( not ( = ?auto_19307 ?auto_19305 ) ) ( not ( = ?auto_19312 ?auto_19305 ) ) ( not ( = ?auto_19303 ?auto_19305 ) ) ( not ( = ?auto_19301 ?auto_19305 ) ) ( not ( = ?auto_19310 ?auto_19305 ) ) ( TRUCK-AT ?auto_19309 ?auto_19316 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19299 ?auto_19300 )
      ( MAKE-2CRATE-VERIFY ?auto_19298 ?auto_19299 ?auto_19300 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19318 - SURFACE
      ?auto_19319 - SURFACE
      ?auto_19320 - SURFACE
      ?auto_19321 - SURFACE
    )
    :vars
    (
      ?auto_19329 - HOIST
      ?auto_19332 - PLACE
      ?auto_19333 - PLACE
      ?auto_19331 - HOIST
      ?auto_19328 - SURFACE
      ?auto_19324 - PLACE
      ?auto_19335 - HOIST
      ?auto_19322 - SURFACE
      ?auto_19325 - PLACE
      ?auto_19337 - HOIST
      ?auto_19330 - SURFACE
      ?auto_19323 - SURFACE
      ?auto_19336 - PLACE
      ?auto_19327 - HOIST
      ?auto_19334 - SURFACE
      ?auto_19326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19329 ?auto_19332 ) ( IS-CRATE ?auto_19321 ) ( not ( = ?auto_19320 ?auto_19321 ) ) ( not ( = ?auto_19319 ?auto_19320 ) ) ( not ( = ?auto_19319 ?auto_19321 ) ) ( not ( = ?auto_19333 ?auto_19332 ) ) ( HOIST-AT ?auto_19331 ?auto_19333 ) ( not ( = ?auto_19329 ?auto_19331 ) ) ( AVAILABLE ?auto_19331 ) ( SURFACE-AT ?auto_19321 ?auto_19333 ) ( ON ?auto_19321 ?auto_19328 ) ( CLEAR ?auto_19321 ) ( not ( = ?auto_19320 ?auto_19328 ) ) ( not ( = ?auto_19321 ?auto_19328 ) ) ( not ( = ?auto_19319 ?auto_19328 ) ) ( IS-CRATE ?auto_19320 ) ( not ( = ?auto_19324 ?auto_19332 ) ) ( not ( = ?auto_19333 ?auto_19324 ) ) ( HOIST-AT ?auto_19335 ?auto_19324 ) ( not ( = ?auto_19329 ?auto_19335 ) ) ( not ( = ?auto_19331 ?auto_19335 ) ) ( AVAILABLE ?auto_19335 ) ( SURFACE-AT ?auto_19320 ?auto_19324 ) ( ON ?auto_19320 ?auto_19322 ) ( CLEAR ?auto_19320 ) ( not ( = ?auto_19320 ?auto_19322 ) ) ( not ( = ?auto_19321 ?auto_19322 ) ) ( not ( = ?auto_19319 ?auto_19322 ) ) ( not ( = ?auto_19328 ?auto_19322 ) ) ( IS-CRATE ?auto_19319 ) ( not ( = ?auto_19318 ?auto_19319 ) ) ( not ( = ?auto_19320 ?auto_19318 ) ) ( not ( = ?auto_19321 ?auto_19318 ) ) ( not ( = ?auto_19328 ?auto_19318 ) ) ( not ( = ?auto_19322 ?auto_19318 ) ) ( not ( = ?auto_19325 ?auto_19332 ) ) ( not ( = ?auto_19333 ?auto_19325 ) ) ( not ( = ?auto_19324 ?auto_19325 ) ) ( HOIST-AT ?auto_19337 ?auto_19325 ) ( not ( = ?auto_19329 ?auto_19337 ) ) ( not ( = ?auto_19331 ?auto_19337 ) ) ( not ( = ?auto_19335 ?auto_19337 ) ) ( AVAILABLE ?auto_19337 ) ( SURFACE-AT ?auto_19319 ?auto_19325 ) ( ON ?auto_19319 ?auto_19330 ) ( CLEAR ?auto_19319 ) ( not ( = ?auto_19320 ?auto_19330 ) ) ( not ( = ?auto_19321 ?auto_19330 ) ) ( not ( = ?auto_19319 ?auto_19330 ) ) ( not ( = ?auto_19328 ?auto_19330 ) ) ( not ( = ?auto_19322 ?auto_19330 ) ) ( not ( = ?auto_19318 ?auto_19330 ) ) ( SURFACE-AT ?auto_19323 ?auto_19332 ) ( CLEAR ?auto_19323 ) ( IS-CRATE ?auto_19318 ) ( not ( = ?auto_19323 ?auto_19318 ) ) ( not ( = ?auto_19320 ?auto_19323 ) ) ( not ( = ?auto_19321 ?auto_19323 ) ) ( not ( = ?auto_19319 ?auto_19323 ) ) ( not ( = ?auto_19328 ?auto_19323 ) ) ( not ( = ?auto_19322 ?auto_19323 ) ) ( not ( = ?auto_19330 ?auto_19323 ) ) ( AVAILABLE ?auto_19329 ) ( not ( = ?auto_19336 ?auto_19332 ) ) ( not ( = ?auto_19333 ?auto_19336 ) ) ( not ( = ?auto_19324 ?auto_19336 ) ) ( not ( = ?auto_19325 ?auto_19336 ) ) ( HOIST-AT ?auto_19327 ?auto_19336 ) ( not ( = ?auto_19329 ?auto_19327 ) ) ( not ( = ?auto_19331 ?auto_19327 ) ) ( not ( = ?auto_19335 ?auto_19327 ) ) ( not ( = ?auto_19337 ?auto_19327 ) ) ( AVAILABLE ?auto_19327 ) ( SURFACE-AT ?auto_19318 ?auto_19336 ) ( ON ?auto_19318 ?auto_19334 ) ( CLEAR ?auto_19318 ) ( not ( = ?auto_19320 ?auto_19334 ) ) ( not ( = ?auto_19321 ?auto_19334 ) ) ( not ( = ?auto_19319 ?auto_19334 ) ) ( not ( = ?auto_19328 ?auto_19334 ) ) ( not ( = ?auto_19322 ?auto_19334 ) ) ( not ( = ?auto_19318 ?auto_19334 ) ) ( not ( = ?auto_19330 ?auto_19334 ) ) ( not ( = ?auto_19323 ?auto_19334 ) ) ( TRUCK-AT ?auto_19326 ?auto_19332 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19319 ?auto_19320 ?auto_19321 )
      ( MAKE-3CRATE-VERIFY ?auto_19318 ?auto_19319 ?auto_19320 ?auto_19321 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19338 - SURFACE
      ?auto_19339 - SURFACE
      ?auto_19340 - SURFACE
      ?auto_19341 - SURFACE
      ?auto_19342 - SURFACE
    )
    :vars
    (
      ?auto_19349 - HOIST
      ?auto_19352 - PLACE
      ?auto_19353 - PLACE
      ?auto_19351 - HOIST
      ?auto_19348 - SURFACE
      ?auto_19344 - PLACE
      ?auto_19355 - HOIST
      ?auto_19343 - SURFACE
      ?auto_19345 - PLACE
      ?auto_19357 - HOIST
      ?auto_19350 - SURFACE
      ?auto_19356 - PLACE
      ?auto_19347 - HOIST
      ?auto_19354 - SURFACE
      ?auto_19346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19349 ?auto_19352 ) ( IS-CRATE ?auto_19342 ) ( not ( = ?auto_19341 ?auto_19342 ) ) ( not ( = ?auto_19340 ?auto_19341 ) ) ( not ( = ?auto_19340 ?auto_19342 ) ) ( not ( = ?auto_19353 ?auto_19352 ) ) ( HOIST-AT ?auto_19351 ?auto_19353 ) ( not ( = ?auto_19349 ?auto_19351 ) ) ( AVAILABLE ?auto_19351 ) ( SURFACE-AT ?auto_19342 ?auto_19353 ) ( ON ?auto_19342 ?auto_19348 ) ( CLEAR ?auto_19342 ) ( not ( = ?auto_19341 ?auto_19348 ) ) ( not ( = ?auto_19342 ?auto_19348 ) ) ( not ( = ?auto_19340 ?auto_19348 ) ) ( IS-CRATE ?auto_19341 ) ( not ( = ?auto_19344 ?auto_19352 ) ) ( not ( = ?auto_19353 ?auto_19344 ) ) ( HOIST-AT ?auto_19355 ?auto_19344 ) ( not ( = ?auto_19349 ?auto_19355 ) ) ( not ( = ?auto_19351 ?auto_19355 ) ) ( AVAILABLE ?auto_19355 ) ( SURFACE-AT ?auto_19341 ?auto_19344 ) ( ON ?auto_19341 ?auto_19343 ) ( CLEAR ?auto_19341 ) ( not ( = ?auto_19341 ?auto_19343 ) ) ( not ( = ?auto_19342 ?auto_19343 ) ) ( not ( = ?auto_19340 ?auto_19343 ) ) ( not ( = ?auto_19348 ?auto_19343 ) ) ( IS-CRATE ?auto_19340 ) ( not ( = ?auto_19339 ?auto_19340 ) ) ( not ( = ?auto_19341 ?auto_19339 ) ) ( not ( = ?auto_19342 ?auto_19339 ) ) ( not ( = ?auto_19348 ?auto_19339 ) ) ( not ( = ?auto_19343 ?auto_19339 ) ) ( not ( = ?auto_19345 ?auto_19352 ) ) ( not ( = ?auto_19353 ?auto_19345 ) ) ( not ( = ?auto_19344 ?auto_19345 ) ) ( HOIST-AT ?auto_19357 ?auto_19345 ) ( not ( = ?auto_19349 ?auto_19357 ) ) ( not ( = ?auto_19351 ?auto_19357 ) ) ( not ( = ?auto_19355 ?auto_19357 ) ) ( AVAILABLE ?auto_19357 ) ( SURFACE-AT ?auto_19340 ?auto_19345 ) ( ON ?auto_19340 ?auto_19350 ) ( CLEAR ?auto_19340 ) ( not ( = ?auto_19341 ?auto_19350 ) ) ( not ( = ?auto_19342 ?auto_19350 ) ) ( not ( = ?auto_19340 ?auto_19350 ) ) ( not ( = ?auto_19348 ?auto_19350 ) ) ( not ( = ?auto_19343 ?auto_19350 ) ) ( not ( = ?auto_19339 ?auto_19350 ) ) ( SURFACE-AT ?auto_19338 ?auto_19352 ) ( CLEAR ?auto_19338 ) ( IS-CRATE ?auto_19339 ) ( not ( = ?auto_19338 ?auto_19339 ) ) ( not ( = ?auto_19341 ?auto_19338 ) ) ( not ( = ?auto_19342 ?auto_19338 ) ) ( not ( = ?auto_19340 ?auto_19338 ) ) ( not ( = ?auto_19348 ?auto_19338 ) ) ( not ( = ?auto_19343 ?auto_19338 ) ) ( not ( = ?auto_19350 ?auto_19338 ) ) ( AVAILABLE ?auto_19349 ) ( not ( = ?auto_19356 ?auto_19352 ) ) ( not ( = ?auto_19353 ?auto_19356 ) ) ( not ( = ?auto_19344 ?auto_19356 ) ) ( not ( = ?auto_19345 ?auto_19356 ) ) ( HOIST-AT ?auto_19347 ?auto_19356 ) ( not ( = ?auto_19349 ?auto_19347 ) ) ( not ( = ?auto_19351 ?auto_19347 ) ) ( not ( = ?auto_19355 ?auto_19347 ) ) ( not ( = ?auto_19357 ?auto_19347 ) ) ( AVAILABLE ?auto_19347 ) ( SURFACE-AT ?auto_19339 ?auto_19356 ) ( ON ?auto_19339 ?auto_19354 ) ( CLEAR ?auto_19339 ) ( not ( = ?auto_19341 ?auto_19354 ) ) ( not ( = ?auto_19342 ?auto_19354 ) ) ( not ( = ?auto_19340 ?auto_19354 ) ) ( not ( = ?auto_19348 ?auto_19354 ) ) ( not ( = ?auto_19343 ?auto_19354 ) ) ( not ( = ?auto_19339 ?auto_19354 ) ) ( not ( = ?auto_19350 ?auto_19354 ) ) ( not ( = ?auto_19338 ?auto_19354 ) ) ( TRUCK-AT ?auto_19346 ?auto_19352 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19340 ?auto_19341 ?auto_19342 )
      ( MAKE-4CRATE-VERIFY ?auto_19338 ?auto_19339 ?auto_19340 ?auto_19341 ?auto_19342 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19358 - SURFACE
      ?auto_19359 - SURFACE
      ?auto_19360 - SURFACE
      ?auto_19361 - SURFACE
      ?auto_19362 - SURFACE
      ?auto_19363 - SURFACE
    )
    :vars
    (
      ?auto_19370 - HOIST
      ?auto_19373 - PLACE
      ?auto_19374 - PLACE
      ?auto_19372 - HOIST
      ?auto_19369 - SURFACE
      ?auto_19365 - PLACE
      ?auto_19376 - HOIST
      ?auto_19364 - SURFACE
      ?auto_19366 - PLACE
      ?auto_19378 - HOIST
      ?auto_19371 - SURFACE
      ?auto_19377 - PLACE
      ?auto_19368 - HOIST
      ?auto_19375 - SURFACE
      ?auto_19367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19370 ?auto_19373 ) ( IS-CRATE ?auto_19363 ) ( not ( = ?auto_19362 ?auto_19363 ) ) ( not ( = ?auto_19361 ?auto_19362 ) ) ( not ( = ?auto_19361 ?auto_19363 ) ) ( not ( = ?auto_19374 ?auto_19373 ) ) ( HOIST-AT ?auto_19372 ?auto_19374 ) ( not ( = ?auto_19370 ?auto_19372 ) ) ( AVAILABLE ?auto_19372 ) ( SURFACE-AT ?auto_19363 ?auto_19374 ) ( ON ?auto_19363 ?auto_19369 ) ( CLEAR ?auto_19363 ) ( not ( = ?auto_19362 ?auto_19369 ) ) ( not ( = ?auto_19363 ?auto_19369 ) ) ( not ( = ?auto_19361 ?auto_19369 ) ) ( IS-CRATE ?auto_19362 ) ( not ( = ?auto_19365 ?auto_19373 ) ) ( not ( = ?auto_19374 ?auto_19365 ) ) ( HOIST-AT ?auto_19376 ?auto_19365 ) ( not ( = ?auto_19370 ?auto_19376 ) ) ( not ( = ?auto_19372 ?auto_19376 ) ) ( AVAILABLE ?auto_19376 ) ( SURFACE-AT ?auto_19362 ?auto_19365 ) ( ON ?auto_19362 ?auto_19364 ) ( CLEAR ?auto_19362 ) ( not ( = ?auto_19362 ?auto_19364 ) ) ( not ( = ?auto_19363 ?auto_19364 ) ) ( not ( = ?auto_19361 ?auto_19364 ) ) ( not ( = ?auto_19369 ?auto_19364 ) ) ( IS-CRATE ?auto_19361 ) ( not ( = ?auto_19360 ?auto_19361 ) ) ( not ( = ?auto_19362 ?auto_19360 ) ) ( not ( = ?auto_19363 ?auto_19360 ) ) ( not ( = ?auto_19369 ?auto_19360 ) ) ( not ( = ?auto_19364 ?auto_19360 ) ) ( not ( = ?auto_19366 ?auto_19373 ) ) ( not ( = ?auto_19374 ?auto_19366 ) ) ( not ( = ?auto_19365 ?auto_19366 ) ) ( HOIST-AT ?auto_19378 ?auto_19366 ) ( not ( = ?auto_19370 ?auto_19378 ) ) ( not ( = ?auto_19372 ?auto_19378 ) ) ( not ( = ?auto_19376 ?auto_19378 ) ) ( AVAILABLE ?auto_19378 ) ( SURFACE-AT ?auto_19361 ?auto_19366 ) ( ON ?auto_19361 ?auto_19371 ) ( CLEAR ?auto_19361 ) ( not ( = ?auto_19362 ?auto_19371 ) ) ( not ( = ?auto_19363 ?auto_19371 ) ) ( not ( = ?auto_19361 ?auto_19371 ) ) ( not ( = ?auto_19369 ?auto_19371 ) ) ( not ( = ?auto_19364 ?auto_19371 ) ) ( not ( = ?auto_19360 ?auto_19371 ) ) ( SURFACE-AT ?auto_19359 ?auto_19373 ) ( CLEAR ?auto_19359 ) ( IS-CRATE ?auto_19360 ) ( not ( = ?auto_19359 ?auto_19360 ) ) ( not ( = ?auto_19362 ?auto_19359 ) ) ( not ( = ?auto_19363 ?auto_19359 ) ) ( not ( = ?auto_19361 ?auto_19359 ) ) ( not ( = ?auto_19369 ?auto_19359 ) ) ( not ( = ?auto_19364 ?auto_19359 ) ) ( not ( = ?auto_19371 ?auto_19359 ) ) ( AVAILABLE ?auto_19370 ) ( not ( = ?auto_19377 ?auto_19373 ) ) ( not ( = ?auto_19374 ?auto_19377 ) ) ( not ( = ?auto_19365 ?auto_19377 ) ) ( not ( = ?auto_19366 ?auto_19377 ) ) ( HOIST-AT ?auto_19368 ?auto_19377 ) ( not ( = ?auto_19370 ?auto_19368 ) ) ( not ( = ?auto_19372 ?auto_19368 ) ) ( not ( = ?auto_19376 ?auto_19368 ) ) ( not ( = ?auto_19378 ?auto_19368 ) ) ( AVAILABLE ?auto_19368 ) ( SURFACE-AT ?auto_19360 ?auto_19377 ) ( ON ?auto_19360 ?auto_19375 ) ( CLEAR ?auto_19360 ) ( not ( = ?auto_19362 ?auto_19375 ) ) ( not ( = ?auto_19363 ?auto_19375 ) ) ( not ( = ?auto_19361 ?auto_19375 ) ) ( not ( = ?auto_19369 ?auto_19375 ) ) ( not ( = ?auto_19364 ?auto_19375 ) ) ( not ( = ?auto_19360 ?auto_19375 ) ) ( not ( = ?auto_19371 ?auto_19375 ) ) ( not ( = ?auto_19359 ?auto_19375 ) ) ( TRUCK-AT ?auto_19367 ?auto_19373 ) ( ON ?auto_19359 ?auto_19358 ) ( not ( = ?auto_19358 ?auto_19359 ) ) ( not ( = ?auto_19358 ?auto_19360 ) ) ( not ( = ?auto_19358 ?auto_19361 ) ) ( not ( = ?auto_19358 ?auto_19362 ) ) ( not ( = ?auto_19358 ?auto_19363 ) ) ( not ( = ?auto_19358 ?auto_19369 ) ) ( not ( = ?auto_19358 ?auto_19364 ) ) ( not ( = ?auto_19358 ?auto_19371 ) ) ( not ( = ?auto_19358 ?auto_19375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19361 ?auto_19362 ?auto_19363 )
      ( MAKE-5CRATE-VERIFY ?auto_19358 ?auto_19359 ?auto_19360 ?auto_19361 ?auto_19362 ?auto_19363 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19379 - SURFACE
      ?auto_19380 - SURFACE
    )
    :vars
    (
      ?auto_19389 - HOIST
      ?auto_19392 - PLACE
      ?auto_19394 - SURFACE
      ?auto_19393 - PLACE
      ?auto_19391 - HOIST
      ?auto_19387 - SURFACE
      ?auto_19383 - PLACE
      ?auto_19396 - HOIST
      ?auto_19381 - SURFACE
      ?auto_19388 - SURFACE
      ?auto_19384 - PLACE
      ?auto_19398 - HOIST
      ?auto_19390 - SURFACE
      ?auto_19382 - SURFACE
      ?auto_19397 - PLACE
      ?auto_19386 - HOIST
      ?auto_19395 - SURFACE
      ?auto_19385 - TRUCK
      ?auto_19399 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19389 ?auto_19392 ) ( IS-CRATE ?auto_19380 ) ( not ( = ?auto_19379 ?auto_19380 ) ) ( not ( = ?auto_19394 ?auto_19379 ) ) ( not ( = ?auto_19394 ?auto_19380 ) ) ( not ( = ?auto_19393 ?auto_19392 ) ) ( HOIST-AT ?auto_19391 ?auto_19393 ) ( not ( = ?auto_19389 ?auto_19391 ) ) ( AVAILABLE ?auto_19391 ) ( SURFACE-AT ?auto_19380 ?auto_19393 ) ( ON ?auto_19380 ?auto_19387 ) ( CLEAR ?auto_19380 ) ( not ( = ?auto_19379 ?auto_19387 ) ) ( not ( = ?auto_19380 ?auto_19387 ) ) ( not ( = ?auto_19394 ?auto_19387 ) ) ( IS-CRATE ?auto_19379 ) ( not ( = ?auto_19383 ?auto_19392 ) ) ( not ( = ?auto_19393 ?auto_19383 ) ) ( HOIST-AT ?auto_19396 ?auto_19383 ) ( not ( = ?auto_19389 ?auto_19396 ) ) ( not ( = ?auto_19391 ?auto_19396 ) ) ( AVAILABLE ?auto_19396 ) ( SURFACE-AT ?auto_19379 ?auto_19383 ) ( ON ?auto_19379 ?auto_19381 ) ( CLEAR ?auto_19379 ) ( not ( = ?auto_19379 ?auto_19381 ) ) ( not ( = ?auto_19380 ?auto_19381 ) ) ( not ( = ?auto_19394 ?auto_19381 ) ) ( not ( = ?auto_19387 ?auto_19381 ) ) ( IS-CRATE ?auto_19394 ) ( not ( = ?auto_19388 ?auto_19394 ) ) ( not ( = ?auto_19379 ?auto_19388 ) ) ( not ( = ?auto_19380 ?auto_19388 ) ) ( not ( = ?auto_19387 ?auto_19388 ) ) ( not ( = ?auto_19381 ?auto_19388 ) ) ( not ( = ?auto_19384 ?auto_19392 ) ) ( not ( = ?auto_19393 ?auto_19384 ) ) ( not ( = ?auto_19383 ?auto_19384 ) ) ( HOIST-AT ?auto_19398 ?auto_19384 ) ( not ( = ?auto_19389 ?auto_19398 ) ) ( not ( = ?auto_19391 ?auto_19398 ) ) ( not ( = ?auto_19396 ?auto_19398 ) ) ( AVAILABLE ?auto_19398 ) ( SURFACE-AT ?auto_19394 ?auto_19384 ) ( ON ?auto_19394 ?auto_19390 ) ( CLEAR ?auto_19394 ) ( not ( = ?auto_19379 ?auto_19390 ) ) ( not ( = ?auto_19380 ?auto_19390 ) ) ( not ( = ?auto_19394 ?auto_19390 ) ) ( not ( = ?auto_19387 ?auto_19390 ) ) ( not ( = ?auto_19381 ?auto_19390 ) ) ( not ( = ?auto_19388 ?auto_19390 ) ) ( IS-CRATE ?auto_19388 ) ( not ( = ?auto_19382 ?auto_19388 ) ) ( not ( = ?auto_19379 ?auto_19382 ) ) ( not ( = ?auto_19380 ?auto_19382 ) ) ( not ( = ?auto_19394 ?auto_19382 ) ) ( not ( = ?auto_19387 ?auto_19382 ) ) ( not ( = ?auto_19381 ?auto_19382 ) ) ( not ( = ?auto_19390 ?auto_19382 ) ) ( not ( = ?auto_19397 ?auto_19392 ) ) ( not ( = ?auto_19393 ?auto_19397 ) ) ( not ( = ?auto_19383 ?auto_19397 ) ) ( not ( = ?auto_19384 ?auto_19397 ) ) ( HOIST-AT ?auto_19386 ?auto_19397 ) ( not ( = ?auto_19389 ?auto_19386 ) ) ( not ( = ?auto_19391 ?auto_19386 ) ) ( not ( = ?auto_19396 ?auto_19386 ) ) ( not ( = ?auto_19398 ?auto_19386 ) ) ( AVAILABLE ?auto_19386 ) ( SURFACE-AT ?auto_19388 ?auto_19397 ) ( ON ?auto_19388 ?auto_19395 ) ( CLEAR ?auto_19388 ) ( not ( = ?auto_19379 ?auto_19395 ) ) ( not ( = ?auto_19380 ?auto_19395 ) ) ( not ( = ?auto_19394 ?auto_19395 ) ) ( not ( = ?auto_19387 ?auto_19395 ) ) ( not ( = ?auto_19381 ?auto_19395 ) ) ( not ( = ?auto_19388 ?auto_19395 ) ) ( not ( = ?auto_19390 ?auto_19395 ) ) ( not ( = ?auto_19382 ?auto_19395 ) ) ( TRUCK-AT ?auto_19385 ?auto_19392 ) ( SURFACE-AT ?auto_19399 ?auto_19392 ) ( CLEAR ?auto_19399 ) ( LIFTING ?auto_19389 ?auto_19382 ) ( IS-CRATE ?auto_19382 ) ( not ( = ?auto_19399 ?auto_19382 ) ) ( not ( = ?auto_19379 ?auto_19399 ) ) ( not ( = ?auto_19380 ?auto_19399 ) ) ( not ( = ?auto_19394 ?auto_19399 ) ) ( not ( = ?auto_19387 ?auto_19399 ) ) ( not ( = ?auto_19381 ?auto_19399 ) ) ( not ( = ?auto_19388 ?auto_19399 ) ) ( not ( = ?auto_19390 ?auto_19399 ) ) ( not ( = ?auto_19395 ?auto_19399 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19399 ?auto_19382 )
      ( MAKE-2CRATE ?auto_19394 ?auto_19379 ?auto_19380 )
      ( MAKE-1CRATE-VERIFY ?auto_19379 ?auto_19380 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19400 - SURFACE
      ?auto_19401 - SURFACE
      ?auto_19402 - SURFACE
    )
    :vars
    (
      ?auto_19417 - HOIST
      ?auto_19405 - PLACE
      ?auto_19412 - PLACE
      ?auto_19406 - HOIST
      ?auto_19410 - SURFACE
      ?auto_19403 - PLACE
      ?auto_19416 - HOIST
      ?auto_19420 - SURFACE
      ?auto_19414 - SURFACE
      ?auto_19408 - PLACE
      ?auto_19411 - HOIST
      ?auto_19404 - SURFACE
      ?auto_19419 - SURFACE
      ?auto_19415 - PLACE
      ?auto_19413 - HOIST
      ?auto_19407 - SURFACE
      ?auto_19409 - TRUCK
      ?auto_19418 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19417 ?auto_19405 ) ( IS-CRATE ?auto_19402 ) ( not ( = ?auto_19401 ?auto_19402 ) ) ( not ( = ?auto_19400 ?auto_19401 ) ) ( not ( = ?auto_19400 ?auto_19402 ) ) ( not ( = ?auto_19412 ?auto_19405 ) ) ( HOIST-AT ?auto_19406 ?auto_19412 ) ( not ( = ?auto_19417 ?auto_19406 ) ) ( AVAILABLE ?auto_19406 ) ( SURFACE-AT ?auto_19402 ?auto_19412 ) ( ON ?auto_19402 ?auto_19410 ) ( CLEAR ?auto_19402 ) ( not ( = ?auto_19401 ?auto_19410 ) ) ( not ( = ?auto_19402 ?auto_19410 ) ) ( not ( = ?auto_19400 ?auto_19410 ) ) ( IS-CRATE ?auto_19401 ) ( not ( = ?auto_19403 ?auto_19405 ) ) ( not ( = ?auto_19412 ?auto_19403 ) ) ( HOIST-AT ?auto_19416 ?auto_19403 ) ( not ( = ?auto_19417 ?auto_19416 ) ) ( not ( = ?auto_19406 ?auto_19416 ) ) ( AVAILABLE ?auto_19416 ) ( SURFACE-AT ?auto_19401 ?auto_19403 ) ( ON ?auto_19401 ?auto_19420 ) ( CLEAR ?auto_19401 ) ( not ( = ?auto_19401 ?auto_19420 ) ) ( not ( = ?auto_19402 ?auto_19420 ) ) ( not ( = ?auto_19400 ?auto_19420 ) ) ( not ( = ?auto_19410 ?auto_19420 ) ) ( IS-CRATE ?auto_19400 ) ( not ( = ?auto_19414 ?auto_19400 ) ) ( not ( = ?auto_19401 ?auto_19414 ) ) ( not ( = ?auto_19402 ?auto_19414 ) ) ( not ( = ?auto_19410 ?auto_19414 ) ) ( not ( = ?auto_19420 ?auto_19414 ) ) ( not ( = ?auto_19408 ?auto_19405 ) ) ( not ( = ?auto_19412 ?auto_19408 ) ) ( not ( = ?auto_19403 ?auto_19408 ) ) ( HOIST-AT ?auto_19411 ?auto_19408 ) ( not ( = ?auto_19417 ?auto_19411 ) ) ( not ( = ?auto_19406 ?auto_19411 ) ) ( not ( = ?auto_19416 ?auto_19411 ) ) ( AVAILABLE ?auto_19411 ) ( SURFACE-AT ?auto_19400 ?auto_19408 ) ( ON ?auto_19400 ?auto_19404 ) ( CLEAR ?auto_19400 ) ( not ( = ?auto_19401 ?auto_19404 ) ) ( not ( = ?auto_19402 ?auto_19404 ) ) ( not ( = ?auto_19400 ?auto_19404 ) ) ( not ( = ?auto_19410 ?auto_19404 ) ) ( not ( = ?auto_19420 ?auto_19404 ) ) ( not ( = ?auto_19414 ?auto_19404 ) ) ( IS-CRATE ?auto_19414 ) ( not ( = ?auto_19419 ?auto_19414 ) ) ( not ( = ?auto_19401 ?auto_19419 ) ) ( not ( = ?auto_19402 ?auto_19419 ) ) ( not ( = ?auto_19400 ?auto_19419 ) ) ( not ( = ?auto_19410 ?auto_19419 ) ) ( not ( = ?auto_19420 ?auto_19419 ) ) ( not ( = ?auto_19404 ?auto_19419 ) ) ( not ( = ?auto_19415 ?auto_19405 ) ) ( not ( = ?auto_19412 ?auto_19415 ) ) ( not ( = ?auto_19403 ?auto_19415 ) ) ( not ( = ?auto_19408 ?auto_19415 ) ) ( HOIST-AT ?auto_19413 ?auto_19415 ) ( not ( = ?auto_19417 ?auto_19413 ) ) ( not ( = ?auto_19406 ?auto_19413 ) ) ( not ( = ?auto_19416 ?auto_19413 ) ) ( not ( = ?auto_19411 ?auto_19413 ) ) ( AVAILABLE ?auto_19413 ) ( SURFACE-AT ?auto_19414 ?auto_19415 ) ( ON ?auto_19414 ?auto_19407 ) ( CLEAR ?auto_19414 ) ( not ( = ?auto_19401 ?auto_19407 ) ) ( not ( = ?auto_19402 ?auto_19407 ) ) ( not ( = ?auto_19400 ?auto_19407 ) ) ( not ( = ?auto_19410 ?auto_19407 ) ) ( not ( = ?auto_19420 ?auto_19407 ) ) ( not ( = ?auto_19414 ?auto_19407 ) ) ( not ( = ?auto_19404 ?auto_19407 ) ) ( not ( = ?auto_19419 ?auto_19407 ) ) ( TRUCK-AT ?auto_19409 ?auto_19405 ) ( SURFACE-AT ?auto_19418 ?auto_19405 ) ( CLEAR ?auto_19418 ) ( LIFTING ?auto_19417 ?auto_19419 ) ( IS-CRATE ?auto_19419 ) ( not ( = ?auto_19418 ?auto_19419 ) ) ( not ( = ?auto_19401 ?auto_19418 ) ) ( not ( = ?auto_19402 ?auto_19418 ) ) ( not ( = ?auto_19400 ?auto_19418 ) ) ( not ( = ?auto_19410 ?auto_19418 ) ) ( not ( = ?auto_19420 ?auto_19418 ) ) ( not ( = ?auto_19414 ?auto_19418 ) ) ( not ( = ?auto_19404 ?auto_19418 ) ) ( not ( = ?auto_19407 ?auto_19418 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19401 ?auto_19402 )
      ( MAKE-2CRATE-VERIFY ?auto_19400 ?auto_19401 ?auto_19402 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19421 - SURFACE
      ?auto_19422 - SURFACE
      ?auto_19423 - SURFACE
      ?auto_19424 - SURFACE
    )
    :vars
    (
      ?auto_19437 - HOIST
      ?auto_19427 - PLACE
      ?auto_19430 - PLACE
      ?auto_19426 - HOIST
      ?auto_19432 - SURFACE
      ?auto_19433 - PLACE
      ?auto_19438 - HOIST
      ?auto_19429 - SURFACE
      ?auto_19436 - PLACE
      ?auto_19425 - HOIST
      ?auto_19441 - SURFACE
      ?auto_19431 - SURFACE
      ?auto_19428 - PLACE
      ?auto_19440 - HOIST
      ?auto_19439 - SURFACE
      ?auto_19434 - TRUCK
      ?auto_19435 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19437 ?auto_19427 ) ( IS-CRATE ?auto_19424 ) ( not ( = ?auto_19423 ?auto_19424 ) ) ( not ( = ?auto_19422 ?auto_19423 ) ) ( not ( = ?auto_19422 ?auto_19424 ) ) ( not ( = ?auto_19430 ?auto_19427 ) ) ( HOIST-AT ?auto_19426 ?auto_19430 ) ( not ( = ?auto_19437 ?auto_19426 ) ) ( AVAILABLE ?auto_19426 ) ( SURFACE-AT ?auto_19424 ?auto_19430 ) ( ON ?auto_19424 ?auto_19432 ) ( CLEAR ?auto_19424 ) ( not ( = ?auto_19423 ?auto_19432 ) ) ( not ( = ?auto_19424 ?auto_19432 ) ) ( not ( = ?auto_19422 ?auto_19432 ) ) ( IS-CRATE ?auto_19423 ) ( not ( = ?auto_19433 ?auto_19427 ) ) ( not ( = ?auto_19430 ?auto_19433 ) ) ( HOIST-AT ?auto_19438 ?auto_19433 ) ( not ( = ?auto_19437 ?auto_19438 ) ) ( not ( = ?auto_19426 ?auto_19438 ) ) ( AVAILABLE ?auto_19438 ) ( SURFACE-AT ?auto_19423 ?auto_19433 ) ( ON ?auto_19423 ?auto_19429 ) ( CLEAR ?auto_19423 ) ( not ( = ?auto_19423 ?auto_19429 ) ) ( not ( = ?auto_19424 ?auto_19429 ) ) ( not ( = ?auto_19422 ?auto_19429 ) ) ( not ( = ?auto_19432 ?auto_19429 ) ) ( IS-CRATE ?auto_19422 ) ( not ( = ?auto_19421 ?auto_19422 ) ) ( not ( = ?auto_19423 ?auto_19421 ) ) ( not ( = ?auto_19424 ?auto_19421 ) ) ( not ( = ?auto_19432 ?auto_19421 ) ) ( not ( = ?auto_19429 ?auto_19421 ) ) ( not ( = ?auto_19436 ?auto_19427 ) ) ( not ( = ?auto_19430 ?auto_19436 ) ) ( not ( = ?auto_19433 ?auto_19436 ) ) ( HOIST-AT ?auto_19425 ?auto_19436 ) ( not ( = ?auto_19437 ?auto_19425 ) ) ( not ( = ?auto_19426 ?auto_19425 ) ) ( not ( = ?auto_19438 ?auto_19425 ) ) ( AVAILABLE ?auto_19425 ) ( SURFACE-AT ?auto_19422 ?auto_19436 ) ( ON ?auto_19422 ?auto_19441 ) ( CLEAR ?auto_19422 ) ( not ( = ?auto_19423 ?auto_19441 ) ) ( not ( = ?auto_19424 ?auto_19441 ) ) ( not ( = ?auto_19422 ?auto_19441 ) ) ( not ( = ?auto_19432 ?auto_19441 ) ) ( not ( = ?auto_19429 ?auto_19441 ) ) ( not ( = ?auto_19421 ?auto_19441 ) ) ( IS-CRATE ?auto_19421 ) ( not ( = ?auto_19431 ?auto_19421 ) ) ( not ( = ?auto_19423 ?auto_19431 ) ) ( not ( = ?auto_19424 ?auto_19431 ) ) ( not ( = ?auto_19422 ?auto_19431 ) ) ( not ( = ?auto_19432 ?auto_19431 ) ) ( not ( = ?auto_19429 ?auto_19431 ) ) ( not ( = ?auto_19441 ?auto_19431 ) ) ( not ( = ?auto_19428 ?auto_19427 ) ) ( not ( = ?auto_19430 ?auto_19428 ) ) ( not ( = ?auto_19433 ?auto_19428 ) ) ( not ( = ?auto_19436 ?auto_19428 ) ) ( HOIST-AT ?auto_19440 ?auto_19428 ) ( not ( = ?auto_19437 ?auto_19440 ) ) ( not ( = ?auto_19426 ?auto_19440 ) ) ( not ( = ?auto_19438 ?auto_19440 ) ) ( not ( = ?auto_19425 ?auto_19440 ) ) ( AVAILABLE ?auto_19440 ) ( SURFACE-AT ?auto_19421 ?auto_19428 ) ( ON ?auto_19421 ?auto_19439 ) ( CLEAR ?auto_19421 ) ( not ( = ?auto_19423 ?auto_19439 ) ) ( not ( = ?auto_19424 ?auto_19439 ) ) ( not ( = ?auto_19422 ?auto_19439 ) ) ( not ( = ?auto_19432 ?auto_19439 ) ) ( not ( = ?auto_19429 ?auto_19439 ) ) ( not ( = ?auto_19421 ?auto_19439 ) ) ( not ( = ?auto_19441 ?auto_19439 ) ) ( not ( = ?auto_19431 ?auto_19439 ) ) ( TRUCK-AT ?auto_19434 ?auto_19427 ) ( SURFACE-AT ?auto_19435 ?auto_19427 ) ( CLEAR ?auto_19435 ) ( LIFTING ?auto_19437 ?auto_19431 ) ( IS-CRATE ?auto_19431 ) ( not ( = ?auto_19435 ?auto_19431 ) ) ( not ( = ?auto_19423 ?auto_19435 ) ) ( not ( = ?auto_19424 ?auto_19435 ) ) ( not ( = ?auto_19422 ?auto_19435 ) ) ( not ( = ?auto_19432 ?auto_19435 ) ) ( not ( = ?auto_19429 ?auto_19435 ) ) ( not ( = ?auto_19421 ?auto_19435 ) ) ( not ( = ?auto_19441 ?auto_19435 ) ) ( not ( = ?auto_19439 ?auto_19435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19422 ?auto_19423 ?auto_19424 )
      ( MAKE-3CRATE-VERIFY ?auto_19421 ?auto_19422 ?auto_19423 ?auto_19424 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19442 - SURFACE
      ?auto_19443 - SURFACE
      ?auto_19444 - SURFACE
      ?auto_19445 - SURFACE
      ?auto_19446 - SURFACE
    )
    :vars
    (
      ?auto_19458 - HOIST
      ?auto_19449 - PLACE
      ?auto_19452 - PLACE
      ?auto_19448 - HOIST
      ?auto_19453 - SURFACE
      ?auto_19454 - PLACE
      ?auto_19459 - HOIST
      ?auto_19451 - SURFACE
      ?auto_19457 - PLACE
      ?auto_19447 - HOIST
      ?auto_19462 - SURFACE
      ?auto_19450 - PLACE
      ?auto_19461 - HOIST
      ?auto_19460 - SURFACE
      ?auto_19455 - TRUCK
      ?auto_19456 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19458 ?auto_19449 ) ( IS-CRATE ?auto_19446 ) ( not ( = ?auto_19445 ?auto_19446 ) ) ( not ( = ?auto_19444 ?auto_19445 ) ) ( not ( = ?auto_19444 ?auto_19446 ) ) ( not ( = ?auto_19452 ?auto_19449 ) ) ( HOIST-AT ?auto_19448 ?auto_19452 ) ( not ( = ?auto_19458 ?auto_19448 ) ) ( AVAILABLE ?auto_19448 ) ( SURFACE-AT ?auto_19446 ?auto_19452 ) ( ON ?auto_19446 ?auto_19453 ) ( CLEAR ?auto_19446 ) ( not ( = ?auto_19445 ?auto_19453 ) ) ( not ( = ?auto_19446 ?auto_19453 ) ) ( not ( = ?auto_19444 ?auto_19453 ) ) ( IS-CRATE ?auto_19445 ) ( not ( = ?auto_19454 ?auto_19449 ) ) ( not ( = ?auto_19452 ?auto_19454 ) ) ( HOIST-AT ?auto_19459 ?auto_19454 ) ( not ( = ?auto_19458 ?auto_19459 ) ) ( not ( = ?auto_19448 ?auto_19459 ) ) ( AVAILABLE ?auto_19459 ) ( SURFACE-AT ?auto_19445 ?auto_19454 ) ( ON ?auto_19445 ?auto_19451 ) ( CLEAR ?auto_19445 ) ( not ( = ?auto_19445 ?auto_19451 ) ) ( not ( = ?auto_19446 ?auto_19451 ) ) ( not ( = ?auto_19444 ?auto_19451 ) ) ( not ( = ?auto_19453 ?auto_19451 ) ) ( IS-CRATE ?auto_19444 ) ( not ( = ?auto_19443 ?auto_19444 ) ) ( not ( = ?auto_19445 ?auto_19443 ) ) ( not ( = ?auto_19446 ?auto_19443 ) ) ( not ( = ?auto_19453 ?auto_19443 ) ) ( not ( = ?auto_19451 ?auto_19443 ) ) ( not ( = ?auto_19457 ?auto_19449 ) ) ( not ( = ?auto_19452 ?auto_19457 ) ) ( not ( = ?auto_19454 ?auto_19457 ) ) ( HOIST-AT ?auto_19447 ?auto_19457 ) ( not ( = ?auto_19458 ?auto_19447 ) ) ( not ( = ?auto_19448 ?auto_19447 ) ) ( not ( = ?auto_19459 ?auto_19447 ) ) ( AVAILABLE ?auto_19447 ) ( SURFACE-AT ?auto_19444 ?auto_19457 ) ( ON ?auto_19444 ?auto_19462 ) ( CLEAR ?auto_19444 ) ( not ( = ?auto_19445 ?auto_19462 ) ) ( not ( = ?auto_19446 ?auto_19462 ) ) ( not ( = ?auto_19444 ?auto_19462 ) ) ( not ( = ?auto_19453 ?auto_19462 ) ) ( not ( = ?auto_19451 ?auto_19462 ) ) ( not ( = ?auto_19443 ?auto_19462 ) ) ( IS-CRATE ?auto_19443 ) ( not ( = ?auto_19442 ?auto_19443 ) ) ( not ( = ?auto_19445 ?auto_19442 ) ) ( not ( = ?auto_19446 ?auto_19442 ) ) ( not ( = ?auto_19444 ?auto_19442 ) ) ( not ( = ?auto_19453 ?auto_19442 ) ) ( not ( = ?auto_19451 ?auto_19442 ) ) ( not ( = ?auto_19462 ?auto_19442 ) ) ( not ( = ?auto_19450 ?auto_19449 ) ) ( not ( = ?auto_19452 ?auto_19450 ) ) ( not ( = ?auto_19454 ?auto_19450 ) ) ( not ( = ?auto_19457 ?auto_19450 ) ) ( HOIST-AT ?auto_19461 ?auto_19450 ) ( not ( = ?auto_19458 ?auto_19461 ) ) ( not ( = ?auto_19448 ?auto_19461 ) ) ( not ( = ?auto_19459 ?auto_19461 ) ) ( not ( = ?auto_19447 ?auto_19461 ) ) ( AVAILABLE ?auto_19461 ) ( SURFACE-AT ?auto_19443 ?auto_19450 ) ( ON ?auto_19443 ?auto_19460 ) ( CLEAR ?auto_19443 ) ( not ( = ?auto_19445 ?auto_19460 ) ) ( not ( = ?auto_19446 ?auto_19460 ) ) ( not ( = ?auto_19444 ?auto_19460 ) ) ( not ( = ?auto_19453 ?auto_19460 ) ) ( not ( = ?auto_19451 ?auto_19460 ) ) ( not ( = ?auto_19443 ?auto_19460 ) ) ( not ( = ?auto_19462 ?auto_19460 ) ) ( not ( = ?auto_19442 ?auto_19460 ) ) ( TRUCK-AT ?auto_19455 ?auto_19449 ) ( SURFACE-AT ?auto_19456 ?auto_19449 ) ( CLEAR ?auto_19456 ) ( LIFTING ?auto_19458 ?auto_19442 ) ( IS-CRATE ?auto_19442 ) ( not ( = ?auto_19456 ?auto_19442 ) ) ( not ( = ?auto_19445 ?auto_19456 ) ) ( not ( = ?auto_19446 ?auto_19456 ) ) ( not ( = ?auto_19444 ?auto_19456 ) ) ( not ( = ?auto_19453 ?auto_19456 ) ) ( not ( = ?auto_19451 ?auto_19456 ) ) ( not ( = ?auto_19443 ?auto_19456 ) ) ( not ( = ?auto_19462 ?auto_19456 ) ) ( not ( = ?auto_19460 ?auto_19456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19444 ?auto_19445 ?auto_19446 )
      ( MAKE-4CRATE-VERIFY ?auto_19442 ?auto_19443 ?auto_19444 ?auto_19445 ?auto_19446 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19463 - SURFACE
      ?auto_19464 - SURFACE
      ?auto_19465 - SURFACE
      ?auto_19466 - SURFACE
      ?auto_19467 - SURFACE
      ?auto_19468 - SURFACE
    )
    :vars
    (
      ?auto_19479 - HOIST
      ?auto_19471 - PLACE
      ?auto_19474 - PLACE
      ?auto_19470 - HOIST
      ?auto_19475 - SURFACE
      ?auto_19476 - PLACE
      ?auto_19480 - HOIST
      ?auto_19473 - SURFACE
      ?auto_19478 - PLACE
      ?auto_19469 - HOIST
      ?auto_19483 - SURFACE
      ?auto_19472 - PLACE
      ?auto_19482 - HOIST
      ?auto_19481 - SURFACE
      ?auto_19477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19479 ?auto_19471 ) ( IS-CRATE ?auto_19468 ) ( not ( = ?auto_19467 ?auto_19468 ) ) ( not ( = ?auto_19466 ?auto_19467 ) ) ( not ( = ?auto_19466 ?auto_19468 ) ) ( not ( = ?auto_19474 ?auto_19471 ) ) ( HOIST-AT ?auto_19470 ?auto_19474 ) ( not ( = ?auto_19479 ?auto_19470 ) ) ( AVAILABLE ?auto_19470 ) ( SURFACE-AT ?auto_19468 ?auto_19474 ) ( ON ?auto_19468 ?auto_19475 ) ( CLEAR ?auto_19468 ) ( not ( = ?auto_19467 ?auto_19475 ) ) ( not ( = ?auto_19468 ?auto_19475 ) ) ( not ( = ?auto_19466 ?auto_19475 ) ) ( IS-CRATE ?auto_19467 ) ( not ( = ?auto_19476 ?auto_19471 ) ) ( not ( = ?auto_19474 ?auto_19476 ) ) ( HOIST-AT ?auto_19480 ?auto_19476 ) ( not ( = ?auto_19479 ?auto_19480 ) ) ( not ( = ?auto_19470 ?auto_19480 ) ) ( AVAILABLE ?auto_19480 ) ( SURFACE-AT ?auto_19467 ?auto_19476 ) ( ON ?auto_19467 ?auto_19473 ) ( CLEAR ?auto_19467 ) ( not ( = ?auto_19467 ?auto_19473 ) ) ( not ( = ?auto_19468 ?auto_19473 ) ) ( not ( = ?auto_19466 ?auto_19473 ) ) ( not ( = ?auto_19475 ?auto_19473 ) ) ( IS-CRATE ?auto_19466 ) ( not ( = ?auto_19465 ?auto_19466 ) ) ( not ( = ?auto_19467 ?auto_19465 ) ) ( not ( = ?auto_19468 ?auto_19465 ) ) ( not ( = ?auto_19475 ?auto_19465 ) ) ( not ( = ?auto_19473 ?auto_19465 ) ) ( not ( = ?auto_19478 ?auto_19471 ) ) ( not ( = ?auto_19474 ?auto_19478 ) ) ( not ( = ?auto_19476 ?auto_19478 ) ) ( HOIST-AT ?auto_19469 ?auto_19478 ) ( not ( = ?auto_19479 ?auto_19469 ) ) ( not ( = ?auto_19470 ?auto_19469 ) ) ( not ( = ?auto_19480 ?auto_19469 ) ) ( AVAILABLE ?auto_19469 ) ( SURFACE-AT ?auto_19466 ?auto_19478 ) ( ON ?auto_19466 ?auto_19483 ) ( CLEAR ?auto_19466 ) ( not ( = ?auto_19467 ?auto_19483 ) ) ( not ( = ?auto_19468 ?auto_19483 ) ) ( not ( = ?auto_19466 ?auto_19483 ) ) ( not ( = ?auto_19475 ?auto_19483 ) ) ( not ( = ?auto_19473 ?auto_19483 ) ) ( not ( = ?auto_19465 ?auto_19483 ) ) ( IS-CRATE ?auto_19465 ) ( not ( = ?auto_19464 ?auto_19465 ) ) ( not ( = ?auto_19467 ?auto_19464 ) ) ( not ( = ?auto_19468 ?auto_19464 ) ) ( not ( = ?auto_19466 ?auto_19464 ) ) ( not ( = ?auto_19475 ?auto_19464 ) ) ( not ( = ?auto_19473 ?auto_19464 ) ) ( not ( = ?auto_19483 ?auto_19464 ) ) ( not ( = ?auto_19472 ?auto_19471 ) ) ( not ( = ?auto_19474 ?auto_19472 ) ) ( not ( = ?auto_19476 ?auto_19472 ) ) ( not ( = ?auto_19478 ?auto_19472 ) ) ( HOIST-AT ?auto_19482 ?auto_19472 ) ( not ( = ?auto_19479 ?auto_19482 ) ) ( not ( = ?auto_19470 ?auto_19482 ) ) ( not ( = ?auto_19480 ?auto_19482 ) ) ( not ( = ?auto_19469 ?auto_19482 ) ) ( AVAILABLE ?auto_19482 ) ( SURFACE-AT ?auto_19465 ?auto_19472 ) ( ON ?auto_19465 ?auto_19481 ) ( CLEAR ?auto_19465 ) ( not ( = ?auto_19467 ?auto_19481 ) ) ( not ( = ?auto_19468 ?auto_19481 ) ) ( not ( = ?auto_19466 ?auto_19481 ) ) ( not ( = ?auto_19475 ?auto_19481 ) ) ( not ( = ?auto_19473 ?auto_19481 ) ) ( not ( = ?auto_19465 ?auto_19481 ) ) ( not ( = ?auto_19483 ?auto_19481 ) ) ( not ( = ?auto_19464 ?auto_19481 ) ) ( TRUCK-AT ?auto_19477 ?auto_19471 ) ( SURFACE-AT ?auto_19463 ?auto_19471 ) ( CLEAR ?auto_19463 ) ( LIFTING ?auto_19479 ?auto_19464 ) ( IS-CRATE ?auto_19464 ) ( not ( = ?auto_19463 ?auto_19464 ) ) ( not ( = ?auto_19467 ?auto_19463 ) ) ( not ( = ?auto_19468 ?auto_19463 ) ) ( not ( = ?auto_19466 ?auto_19463 ) ) ( not ( = ?auto_19475 ?auto_19463 ) ) ( not ( = ?auto_19473 ?auto_19463 ) ) ( not ( = ?auto_19465 ?auto_19463 ) ) ( not ( = ?auto_19483 ?auto_19463 ) ) ( not ( = ?auto_19481 ?auto_19463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19466 ?auto_19467 ?auto_19468 )
      ( MAKE-5CRATE-VERIFY ?auto_19463 ?auto_19464 ?auto_19465 ?auto_19466 ?auto_19467 ?auto_19468 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19484 - SURFACE
      ?auto_19485 - SURFACE
    )
    :vars
    (
      ?auto_19498 - HOIST
      ?auto_19488 - PLACE
      ?auto_19500 - SURFACE
      ?auto_19491 - PLACE
      ?auto_19487 - HOIST
      ?auto_19493 - SURFACE
      ?auto_19494 - PLACE
      ?auto_19499 - HOIST
      ?auto_19490 - SURFACE
      ?auto_19504 - SURFACE
      ?auto_19497 - PLACE
      ?auto_19486 - HOIST
      ?auto_19503 - SURFACE
      ?auto_19492 - SURFACE
      ?auto_19489 - PLACE
      ?auto_19502 - HOIST
      ?auto_19501 - SURFACE
      ?auto_19495 - TRUCK
      ?auto_19496 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19498 ?auto_19488 ) ( IS-CRATE ?auto_19485 ) ( not ( = ?auto_19484 ?auto_19485 ) ) ( not ( = ?auto_19500 ?auto_19484 ) ) ( not ( = ?auto_19500 ?auto_19485 ) ) ( not ( = ?auto_19491 ?auto_19488 ) ) ( HOIST-AT ?auto_19487 ?auto_19491 ) ( not ( = ?auto_19498 ?auto_19487 ) ) ( AVAILABLE ?auto_19487 ) ( SURFACE-AT ?auto_19485 ?auto_19491 ) ( ON ?auto_19485 ?auto_19493 ) ( CLEAR ?auto_19485 ) ( not ( = ?auto_19484 ?auto_19493 ) ) ( not ( = ?auto_19485 ?auto_19493 ) ) ( not ( = ?auto_19500 ?auto_19493 ) ) ( IS-CRATE ?auto_19484 ) ( not ( = ?auto_19494 ?auto_19488 ) ) ( not ( = ?auto_19491 ?auto_19494 ) ) ( HOIST-AT ?auto_19499 ?auto_19494 ) ( not ( = ?auto_19498 ?auto_19499 ) ) ( not ( = ?auto_19487 ?auto_19499 ) ) ( AVAILABLE ?auto_19499 ) ( SURFACE-AT ?auto_19484 ?auto_19494 ) ( ON ?auto_19484 ?auto_19490 ) ( CLEAR ?auto_19484 ) ( not ( = ?auto_19484 ?auto_19490 ) ) ( not ( = ?auto_19485 ?auto_19490 ) ) ( not ( = ?auto_19500 ?auto_19490 ) ) ( not ( = ?auto_19493 ?auto_19490 ) ) ( IS-CRATE ?auto_19500 ) ( not ( = ?auto_19504 ?auto_19500 ) ) ( not ( = ?auto_19484 ?auto_19504 ) ) ( not ( = ?auto_19485 ?auto_19504 ) ) ( not ( = ?auto_19493 ?auto_19504 ) ) ( not ( = ?auto_19490 ?auto_19504 ) ) ( not ( = ?auto_19497 ?auto_19488 ) ) ( not ( = ?auto_19491 ?auto_19497 ) ) ( not ( = ?auto_19494 ?auto_19497 ) ) ( HOIST-AT ?auto_19486 ?auto_19497 ) ( not ( = ?auto_19498 ?auto_19486 ) ) ( not ( = ?auto_19487 ?auto_19486 ) ) ( not ( = ?auto_19499 ?auto_19486 ) ) ( AVAILABLE ?auto_19486 ) ( SURFACE-AT ?auto_19500 ?auto_19497 ) ( ON ?auto_19500 ?auto_19503 ) ( CLEAR ?auto_19500 ) ( not ( = ?auto_19484 ?auto_19503 ) ) ( not ( = ?auto_19485 ?auto_19503 ) ) ( not ( = ?auto_19500 ?auto_19503 ) ) ( not ( = ?auto_19493 ?auto_19503 ) ) ( not ( = ?auto_19490 ?auto_19503 ) ) ( not ( = ?auto_19504 ?auto_19503 ) ) ( IS-CRATE ?auto_19504 ) ( not ( = ?auto_19492 ?auto_19504 ) ) ( not ( = ?auto_19484 ?auto_19492 ) ) ( not ( = ?auto_19485 ?auto_19492 ) ) ( not ( = ?auto_19500 ?auto_19492 ) ) ( not ( = ?auto_19493 ?auto_19492 ) ) ( not ( = ?auto_19490 ?auto_19492 ) ) ( not ( = ?auto_19503 ?auto_19492 ) ) ( not ( = ?auto_19489 ?auto_19488 ) ) ( not ( = ?auto_19491 ?auto_19489 ) ) ( not ( = ?auto_19494 ?auto_19489 ) ) ( not ( = ?auto_19497 ?auto_19489 ) ) ( HOIST-AT ?auto_19502 ?auto_19489 ) ( not ( = ?auto_19498 ?auto_19502 ) ) ( not ( = ?auto_19487 ?auto_19502 ) ) ( not ( = ?auto_19499 ?auto_19502 ) ) ( not ( = ?auto_19486 ?auto_19502 ) ) ( AVAILABLE ?auto_19502 ) ( SURFACE-AT ?auto_19504 ?auto_19489 ) ( ON ?auto_19504 ?auto_19501 ) ( CLEAR ?auto_19504 ) ( not ( = ?auto_19484 ?auto_19501 ) ) ( not ( = ?auto_19485 ?auto_19501 ) ) ( not ( = ?auto_19500 ?auto_19501 ) ) ( not ( = ?auto_19493 ?auto_19501 ) ) ( not ( = ?auto_19490 ?auto_19501 ) ) ( not ( = ?auto_19504 ?auto_19501 ) ) ( not ( = ?auto_19503 ?auto_19501 ) ) ( not ( = ?auto_19492 ?auto_19501 ) ) ( TRUCK-AT ?auto_19495 ?auto_19488 ) ( SURFACE-AT ?auto_19496 ?auto_19488 ) ( CLEAR ?auto_19496 ) ( IS-CRATE ?auto_19492 ) ( not ( = ?auto_19496 ?auto_19492 ) ) ( not ( = ?auto_19484 ?auto_19496 ) ) ( not ( = ?auto_19485 ?auto_19496 ) ) ( not ( = ?auto_19500 ?auto_19496 ) ) ( not ( = ?auto_19493 ?auto_19496 ) ) ( not ( = ?auto_19490 ?auto_19496 ) ) ( not ( = ?auto_19504 ?auto_19496 ) ) ( not ( = ?auto_19503 ?auto_19496 ) ) ( not ( = ?auto_19501 ?auto_19496 ) ) ( AVAILABLE ?auto_19498 ) ( IN ?auto_19492 ?auto_19495 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19498 ?auto_19492 ?auto_19495 ?auto_19488 )
      ( MAKE-2CRATE ?auto_19500 ?auto_19484 ?auto_19485 )
      ( MAKE-1CRATE-VERIFY ?auto_19484 ?auto_19485 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19505 - SURFACE
      ?auto_19506 - SURFACE
      ?auto_19507 - SURFACE
    )
    :vars
    (
      ?auto_19518 - HOIST
      ?auto_19524 - PLACE
      ?auto_19513 - PLACE
      ?auto_19514 - HOIST
      ?auto_19516 - SURFACE
      ?auto_19519 - PLACE
      ?auto_19509 - HOIST
      ?auto_19512 - SURFACE
      ?auto_19508 - SURFACE
      ?auto_19525 - PLACE
      ?auto_19523 - HOIST
      ?auto_19521 - SURFACE
      ?auto_19517 - SURFACE
      ?auto_19510 - PLACE
      ?auto_19520 - HOIST
      ?auto_19522 - SURFACE
      ?auto_19515 - TRUCK
      ?auto_19511 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19518 ?auto_19524 ) ( IS-CRATE ?auto_19507 ) ( not ( = ?auto_19506 ?auto_19507 ) ) ( not ( = ?auto_19505 ?auto_19506 ) ) ( not ( = ?auto_19505 ?auto_19507 ) ) ( not ( = ?auto_19513 ?auto_19524 ) ) ( HOIST-AT ?auto_19514 ?auto_19513 ) ( not ( = ?auto_19518 ?auto_19514 ) ) ( AVAILABLE ?auto_19514 ) ( SURFACE-AT ?auto_19507 ?auto_19513 ) ( ON ?auto_19507 ?auto_19516 ) ( CLEAR ?auto_19507 ) ( not ( = ?auto_19506 ?auto_19516 ) ) ( not ( = ?auto_19507 ?auto_19516 ) ) ( not ( = ?auto_19505 ?auto_19516 ) ) ( IS-CRATE ?auto_19506 ) ( not ( = ?auto_19519 ?auto_19524 ) ) ( not ( = ?auto_19513 ?auto_19519 ) ) ( HOIST-AT ?auto_19509 ?auto_19519 ) ( not ( = ?auto_19518 ?auto_19509 ) ) ( not ( = ?auto_19514 ?auto_19509 ) ) ( AVAILABLE ?auto_19509 ) ( SURFACE-AT ?auto_19506 ?auto_19519 ) ( ON ?auto_19506 ?auto_19512 ) ( CLEAR ?auto_19506 ) ( not ( = ?auto_19506 ?auto_19512 ) ) ( not ( = ?auto_19507 ?auto_19512 ) ) ( not ( = ?auto_19505 ?auto_19512 ) ) ( not ( = ?auto_19516 ?auto_19512 ) ) ( IS-CRATE ?auto_19505 ) ( not ( = ?auto_19508 ?auto_19505 ) ) ( not ( = ?auto_19506 ?auto_19508 ) ) ( not ( = ?auto_19507 ?auto_19508 ) ) ( not ( = ?auto_19516 ?auto_19508 ) ) ( not ( = ?auto_19512 ?auto_19508 ) ) ( not ( = ?auto_19525 ?auto_19524 ) ) ( not ( = ?auto_19513 ?auto_19525 ) ) ( not ( = ?auto_19519 ?auto_19525 ) ) ( HOIST-AT ?auto_19523 ?auto_19525 ) ( not ( = ?auto_19518 ?auto_19523 ) ) ( not ( = ?auto_19514 ?auto_19523 ) ) ( not ( = ?auto_19509 ?auto_19523 ) ) ( AVAILABLE ?auto_19523 ) ( SURFACE-AT ?auto_19505 ?auto_19525 ) ( ON ?auto_19505 ?auto_19521 ) ( CLEAR ?auto_19505 ) ( not ( = ?auto_19506 ?auto_19521 ) ) ( not ( = ?auto_19507 ?auto_19521 ) ) ( not ( = ?auto_19505 ?auto_19521 ) ) ( not ( = ?auto_19516 ?auto_19521 ) ) ( not ( = ?auto_19512 ?auto_19521 ) ) ( not ( = ?auto_19508 ?auto_19521 ) ) ( IS-CRATE ?auto_19508 ) ( not ( = ?auto_19517 ?auto_19508 ) ) ( not ( = ?auto_19506 ?auto_19517 ) ) ( not ( = ?auto_19507 ?auto_19517 ) ) ( not ( = ?auto_19505 ?auto_19517 ) ) ( not ( = ?auto_19516 ?auto_19517 ) ) ( not ( = ?auto_19512 ?auto_19517 ) ) ( not ( = ?auto_19521 ?auto_19517 ) ) ( not ( = ?auto_19510 ?auto_19524 ) ) ( not ( = ?auto_19513 ?auto_19510 ) ) ( not ( = ?auto_19519 ?auto_19510 ) ) ( not ( = ?auto_19525 ?auto_19510 ) ) ( HOIST-AT ?auto_19520 ?auto_19510 ) ( not ( = ?auto_19518 ?auto_19520 ) ) ( not ( = ?auto_19514 ?auto_19520 ) ) ( not ( = ?auto_19509 ?auto_19520 ) ) ( not ( = ?auto_19523 ?auto_19520 ) ) ( AVAILABLE ?auto_19520 ) ( SURFACE-AT ?auto_19508 ?auto_19510 ) ( ON ?auto_19508 ?auto_19522 ) ( CLEAR ?auto_19508 ) ( not ( = ?auto_19506 ?auto_19522 ) ) ( not ( = ?auto_19507 ?auto_19522 ) ) ( not ( = ?auto_19505 ?auto_19522 ) ) ( not ( = ?auto_19516 ?auto_19522 ) ) ( not ( = ?auto_19512 ?auto_19522 ) ) ( not ( = ?auto_19508 ?auto_19522 ) ) ( not ( = ?auto_19521 ?auto_19522 ) ) ( not ( = ?auto_19517 ?auto_19522 ) ) ( TRUCK-AT ?auto_19515 ?auto_19524 ) ( SURFACE-AT ?auto_19511 ?auto_19524 ) ( CLEAR ?auto_19511 ) ( IS-CRATE ?auto_19517 ) ( not ( = ?auto_19511 ?auto_19517 ) ) ( not ( = ?auto_19506 ?auto_19511 ) ) ( not ( = ?auto_19507 ?auto_19511 ) ) ( not ( = ?auto_19505 ?auto_19511 ) ) ( not ( = ?auto_19516 ?auto_19511 ) ) ( not ( = ?auto_19512 ?auto_19511 ) ) ( not ( = ?auto_19508 ?auto_19511 ) ) ( not ( = ?auto_19521 ?auto_19511 ) ) ( not ( = ?auto_19522 ?auto_19511 ) ) ( AVAILABLE ?auto_19518 ) ( IN ?auto_19517 ?auto_19515 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19506 ?auto_19507 )
      ( MAKE-2CRATE-VERIFY ?auto_19505 ?auto_19506 ?auto_19507 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19526 - SURFACE
      ?auto_19527 - SURFACE
      ?auto_19528 - SURFACE
      ?auto_19529 - SURFACE
    )
    :vars
    (
      ?auto_19544 - HOIST
      ?auto_19546 - PLACE
      ?auto_19535 - PLACE
      ?auto_19539 - HOIST
      ?auto_19531 - SURFACE
      ?auto_19541 - PLACE
      ?auto_19530 - HOIST
      ?auto_19538 - SURFACE
      ?auto_19537 - PLACE
      ?auto_19533 - HOIST
      ?auto_19536 - SURFACE
      ?auto_19545 - SURFACE
      ?auto_19540 - PLACE
      ?auto_19532 - HOIST
      ?auto_19534 - SURFACE
      ?auto_19542 - TRUCK
      ?auto_19543 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19544 ?auto_19546 ) ( IS-CRATE ?auto_19529 ) ( not ( = ?auto_19528 ?auto_19529 ) ) ( not ( = ?auto_19527 ?auto_19528 ) ) ( not ( = ?auto_19527 ?auto_19529 ) ) ( not ( = ?auto_19535 ?auto_19546 ) ) ( HOIST-AT ?auto_19539 ?auto_19535 ) ( not ( = ?auto_19544 ?auto_19539 ) ) ( AVAILABLE ?auto_19539 ) ( SURFACE-AT ?auto_19529 ?auto_19535 ) ( ON ?auto_19529 ?auto_19531 ) ( CLEAR ?auto_19529 ) ( not ( = ?auto_19528 ?auto_19531 ) ) ( not ( = ?auto_19529 ?auto_19531 ) ) ( not ( = ?auto_19527 ?auto_19531 ) ) ( IS-CRATE ?auto_19528 ) ( not ( = ?auto_19541 ?auto_19546 ) ) ( not ( = ?auto_19535 ?auto_19541 ) ) ( HOIST-AT ?auto_19530 ?auto_19541 ) ( not ( = ?auto_19544 ?auto_19530 ) ) ( not ( = ?auto_19539 ?auto_19530 ) ) ( AVAILABLE ?auto_19530 ) ( SURFACE-AT ?auto_19528 ?auto_19541 ) ( ON ?auto_19528 ?auto_19538 ) ( CLEAR ?auto_19528 ) ( not ( = ?auto_19528 ?auto_19538 ) ) ( not ( = ?auto_19529 ?auto_19538 ) ) ( not ( = ?auto_19527 ?auto_19538 ) ) ( not ( = ?auto_19531 ?auto_19538 ) ) ( IS-CRATE ?auto_19527 ) ( not ( = ?auto_19526 ?auto_19527 ) ) ( not ( = ?auto_19528 ?auto_19526 ) ) ( not ( = ?auto_19529 ?auto_19526 ) ) ( not ( = ?auto_19531 ?auto_19526 ) ) ( not ( = ?auto_19538 ?auto_19526 ) ) ( not ( = ?auto_19537 ?auto_19546 ) ) ( not ( = ?auto_19535 ?auto_19537 ) ) ( not ( = ?auto_19541 ?auto_19537 ) ) ( HOIST-AT ?auto_19533 ?auto_19537 ) ( not ( = ?auto_19544 ?auto_19533 ) ) ( not ( = ?auto_19539 ?auto_19533 ) ) ( not ( = ?auto_19530 ?auto_19533 ) ) ( AVAILABLE ?auto_19533 ) ( SURFACE-AT ?auto_19527 ?auto_19537 ) ( ON ?auto_19527 ?auto_19536 ) ( CLEAR ?auto_19527 ) ( not ( = ?auto_19528 ?auto_19536 ) ) ( not ( = ?auto_19529 ?auto_19536 ) ) ( not ( = ?auto_19527 ?auto_19536 ) ) ( not ( = ?auto_19531 ?auto_19536 ) ) ( not ( = ?auto_19538 ?auto_19536 ) ) ( not ( = ?auto_19526 ?auto_19536 ) ) ( IS-CRATE ?auto_19526 ) ( not ( = ?auto_19545 ?auto_19526 ) ) ( not ( = ?auto_19528 ?auto_19545 ) ) ( not ( = ?auto_19529 ?auto_19545 ) ) ( not ( = ?auto_19527 ?auto_19545 ) ) ( not ( = ?auto_19531 ?auto_19545 ) ) ( not ( = ?auto_19538 ?auto_19545 ) ) ( not ( = ?auto_19536 ?auto_19545 ) ) ( not ( = ?auto_19540 ?auto_19546 ) ) ( not ( = ?auto_19535 ?auto_19540 ) ) ( not ( = ?auto_19541 ?auto_19540 ) ) ( not ( = ?auto_19537 ?auto_19540 ) ) ( HOIST-AT ?auto_19532 ?auto_19540 ) ( not ( = ?auto_19544 ?auto_19532 ) ) ( not ( = ?auto_19539 ?auto_19532 ) ) ( not ( = ?auto_19530 ?auto_19532 ) ) ( not ( = ?auto_19533 ?auto_19532 ) ) ( AVAILABLE ?auto_19532 ) ( SURFACE-AT ?auto_19526 ?auto_19540 ) ( ON ?auto_19526 ?auto_19534 ) ( CLEAR ?auto_19526 ) ( not ( = ?auto_19528 ?auto_19534 ) ) ( not ( = ?auto_19529 ?auto_19534 ) ) ( not ( = ?auto_19527 ?auto_19534 ) ) ( not ( = ?auto_19531 ?auto_19534 ) ) ( not ( = ?auto_19538 ?auto_19534 ) ) ( not ( = ?auto_19526 ?auto_19534 ) ) ( not ( = ?auto_19536 ?auto_19534 ) ) ( not ( = ?auto_19545 ?auto_19534 ) ) ( TRUCK-AT ?auto_19542 ?auto_19546 ) ( SURFACE-AT ?auto_19543 ?auto_19546 ) ( CLEAR ?auto_19543 ) ( IS-CRATE ?auto_19545 ) ( not ( = ?auto_19543 ?auto_19545 ) ) ( not ( = ?auto_19528 ?auto_19543 ) ) ( not ( = ?auto_19529 ?auto_19543 ) ) ( not ( = ?auto_19527 ?auto_19543 ) ) ( not ( = ?auto_19531 ?auto_19543 ) ) ( not ( = ?auto_19538 ?auto_19543 ) ) ( not ( = ?auto_19526 ?auto_19543 ) ) ( not ( = ?auto_19536 ?auto_19543 ) ) ( not ( = ?auto_19534 ?auto_19543 ) ) ( AVAILABLE ?auto_19544 ) ( IN ?auto_19545 ?auto_19542 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19527 ?auto_19528 ?auto_19529 )
      ( MAKE-3CRATE-VERIFY ?auto_19526 ?auto_19527 ?auto_19528 ?auto_19529 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19547 - SURFACE
      ?auto_19548 - SURFACE
      ?auto_19549 - SURFACE
      ?auto_19550 - SURFACE
      ?auto_19551 - SURFACE
    )
    :vars
    (
      ?auto_19566 - HOIST
      ?auto_19567 - PLACE
      ?auto_19557 - PLACE
      ?auto_19561 - HOIST
      ?auto_19553 - SURFACE
      ?auto_19563 - PLACE
      ?auto_19552 - HOIST
      ?auto_19560 - SURFACE
      ?auto_19559 - PLACE
      ?auto_19555 - HOIST
      ?auto_19558 - SURFACE
      ?auto_19562 - PLACE
      ?auto_19554 - HOIST
      ?auto_19556 - SURFACE
      ?auto_19564 - TRUCK
      ?auto_19565 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19566 ?auto_19567 ) ( IS-CRATE ?auto_19551 ) ( not ( = ?auto_19550 ?auto_19551 ) ) ( not ( = ?auto_19549 ?auto_19550 ) ) ( not ( = ?auto_19549 ?auto_19551 ) ) ( not ( = ?auto_19557 ?auto_19567 ) ) ( HOIST-AT ?auto_19561 ?auto_19557 ) ( not ( = ?auto_19566 ?auto_19561 ) ) ( AVAILABLE ?auto_19561 ) ( SURFACE-AT ?auto_19551 ?auto_19557 ) ( ON ?auto_19551 ?auto_19553 ) ( CLEAR ?auto_19551 ) ( not ( = ?auto_19550 ?auto_19553 ) ) ( not ( = ?auto_19551 ?auto_19553 ) ) ( not ( = ?auto_19549 ?auto_19553 ) ) ( IS-CRATE ?auto_19550 ) ( not ( = ?auto_19563 ?auto_19567 ) ) ( not ( = ?auto_19557 ?auto_19563 ) ) ( HOIST-AT ?auto_19552 ?auto_19563 ) ( not ( = ?auto_19566 ?auto_19552 ) ) ( not ( = ?auto_19561 ?auto_19552 ) ) ( AVAILABLE ?auto_19552 ) ( SURFACE-AT ?auto_19550 ?auto_19563 ) ( ON ?auto_19550 ?auto_19560 ) ( CLEAR ?auto_19550 ) ( not ( = ?auto_19550 ?auto_19560 ) ) ( not ( = ?auto_19551 ?auto_19560 ) ) ( not ( = ?auto_19549 ?auto_19560 ) ) ( not ( = ?auto_19553 ?auto_19560 ) ) ( IS-CRATE ?auto_19549 ) ( not ( = ?auto_19548 ?auto_19549 ) ) ( not ( = ?auto_19550 ?auto_19548 ) ) ( not ( = ?auto_19551 ?auto_19548 ) ) ( not ( = ?auto_19553 ?auto_19548 ) ) ( not ( = ?auto_19560 ?auto_19548 ) ) ( not ( = ?auto_19559 ?auto_19567 ) ) ( not ( = ?auto_19557 ?auto_19559 ) ) ( not ( = ?auto_19563 ?auto_19559 ) ) ( HOIST-AT ?auto_19555 ?auto_19559 ) ( not ( = ?auto_19566 ?auto_19555 ) ) ( not ( = ?auto_19561 ?auto_19555 ) ) ( not ( = ?auto_19552 ?auto_19555 ) ) ( AVAILABLE ?auto_19555 ) ( SURFACE-AT ?auto_19549 ?auto_19559 ) ( ON ?auto_19549 ?auto_19558 ) ( CLEAR ?auto_19549 ) ( not ( = ?auto_19550 ?auto_19558 ) ) ( not ( = ?auto_19551 ?auto_19558 ) ) ( not ( = ?auto_19549 ?auto_19558 ) ) ( not ( = ?auto_19553 ?auto_19558 ) ) ( not ( = ?auto_19560 ?auto_19558 ) ) ( not ( = ?auto_19548 ?auto_19558 ) ) ( IS-CRATE ?auto_19548 ) ( not ( = ?auto_19547 ?auto_19548 ) ) ( not ( = ?auto_19550 ?auto_19547 ) ) ( not ( = ?auto_19551 ?auto_19547 ) ) ( not ( = ?auto_19549 ?auto_19547 ) ) ( not ( = ?auto_19553 ?auto_19547 ) ) ( not ( = ?auto_19560 ?auto_19547 ) ) ( not ( = ?auto_19558 ?auto_19547 ) ) ( not ( = ?auto_19562 ?auto_19567 ) ) ( not ( = ?auto_19557 ?auto_19562 ) ) ( not ( = ?auto_19563 ?auto_19562 ) ) ( not ( = ?auto_19559 ?auto_19562 ) ) ( HOIST-AT ?auto_19554 ?auto_19562 ) ( not ( = ?auto_19566 ?auto_19554 ) ) ( not ( = ?auto_19561 ?auto_19554 ) ) ( not ( = ?auto_19552 ?auto_19554 ) ) ( not ( = ?auto_19555 ?auto_19554 ) ) ( AVAILABLE ?auto_19554 ) ( SURFACE-AT ?auto_19548 ?auto_19562 ) ( ON ?auto_19548 ?auto_19556 ) ( CLEAR ?auto_19548 ) ( not ( = ?auto_19550 ?auto_19556 ) ) ( not ( = ?auto_19551 ?auto_19556 ) ) ( not ( = ?auto_19549 ?auto_19556 ) ) ( not ( = ?auto_19553 ?auto_19556 ) ) ( not ( = ?auto_19560 ?auto_19556 ) ) ( not ( = ?auto_19548 ?auto_19556 ) ) ( not ( = ?auto_19558 ?auto_19556 ) ) ( not ( = ?auto_19547 ?auto_19556 ) ) ( TRUCK-AT ?auto_19564 ?auto_19567 ) ( SURFACE-AT ?auto_19565 ?auto_19567 ) ( CLEAR ?auto_19565 ) ( IS-CRATE ?auto_19547 ) ( not ( = ?auto_19565 ?auto_19547 ) ) ( not ( = ?auto_19550 ?auto_19565 ) ) ( not ( = ?auto_19551 ?auto_19565 ) ) ( not ( = ?auto_19549 ?auto_19565 ) ) ( not ( = ?auto_19553 ?auto_19565 ) ) ( not ( = ?auto_19560 ?auto_19565 ) ) ( not ( = ?auto_19548 ?auto_19565 ) ) ( not ( = ?auto_19558 ?auto_19565 ) ) ( not ( = ?auto_19556 ?auto_19565 ) ) ( AVAILABLE ?auto_19566 ) ( IN ?auto_19547 ?auto_19564 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19549 ?auto_19550 ?auto_19551 )
      ( MAKE-4CRATE-VERIFY ?auto_19547 ?auto_19548 ?auto_19549 ?auto_19550 ?auto_19551 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19568 - SURFACE
      ?auto_19569 - SURFACE
      ?auto_19570 - SURFACE
      ?auto_19571 - SURFACE
      ?auto_19572 - SURFACE
      ?auto_19573 - SURFACE
    )
    :vars
    (
      ?auto_19587 - HOIST
      ?auto_19588 - PLACE
      ?auto_19579 - PLACE
      ?auto_19583 - HOIST
      ?auto_19575 - SURFACE
      ?auto_19585 - PLACE
      ?auto_19574 - HOIST
      ?auto_19582 - SURFACE
      ?auto_19581 - PLACE
      ?auto_19577 - HOIST
      ?auto_19580 - SURFACE
      ?auto_19584 - PLACE
      ?auto_19576 - HOIST
      ?auto_19578 - SURFACE
      ?auto_19586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19587 ?auto_19588 ) ( IS-CRATE ?auto_19573 ) ( not ( = ?auto_19572 ?auto_19573 ) ) ( not ( = ?auto_19571 ?auto_19572 ) ) ( not ( = ?auto_19571 ?auto_19573 ) ) ( not ( = ?auto_19579 ?auto_19588 ) ) ( HOIST-AT ?auto_19583 ?auto_19579 ) ( not ( = ?auto_19587 ?auto_19583 ) ) ( AVAILABLE ?auto_19583 ) ( SURFACE-AT ?auto_19573 ?auto_19579 ) ( ON ?auto_19573 ?auto_19575 ) ( CLEAR ?auto_19573 ) ( not ( = ?auto_19572 ?auto_19575 ) ) ( not ( = ?auto_19573 ?auto_19575 ) ) ( not ( = ?auto_19571 ?auto_19575 ) ) ( IS-CRATE ?auto_19572 ) ( not ( = ?auto_19585 ?auto_19588 ) ) ( not ( = ?auto_19579 ?auto_19585 ) ) ( HOIST-AT ?auto_19574 ?auto_19585 ) ( not ( = ?auto_19587 ?auto_19574 ) ) ( not ( = ?auto_19583 ?auto_19574 ) ) ( AVAILABLE ?auto_19574 ) ( SURFACE-AT ?auto_19572 ?auto_19585 ) ( ON ?auto_19572 ?auto_19582 ) ( CLEAR ?auto_19572 ) ( not ( = ?auto_19572 ?auto_19582 ) ) ( not ( = ?auto_19573 ?auto_19582 ) ) ( not ( = ?auto_19571 ?auto_19582 ) ) ( not ( = ?auto_19575 ?auto_19582 ) ) ( IS-CRATE ?auto_19571 ) ( not ( = ?auto_19570 ?auto_19571 ) ) ( not ( = ?auto_19572 ?auto_19570 ) ) ( not ( = ?auto_19573 ?auto_19570 ) ) ( not ( = ?auto_19575 ?auto_19570 ) ) ( not ( = ?auto_19582 ?auto_19570 ) ) ( not ( = ?auto_19581 ?auto_19588 ) ) ( not ( = ?auto_19579 ?auto_19581 ) ) ( not ( = ?auto_19585 ?auto_19581 ) ) ( HOIST-AT ?auto_19577 ?auto_19581 ) ( not ( = ?auto_19587 ?auto_19577 ) ) ( not ( = ?auto_19583 ?auto_19577 ) ) ( not ( = ?auto_19574 ?auto_19577 ) ) ( AVAILABLE ?auto_19577 ) ( SURFACE-AT ?auto_19571 ?auto_19581 ) ( ON ?auto_19571 ?auto_19580 ) ( CLEAR ?auto_19571 ) ( not ( = ?auto_19572 ?auto_19580 ) ) ( not ( = ?auto_19573 ?auto_19580 ) ) ( not ( = ?auto_19571 ?auto_19580 ) ) ( not ( = ?auto_19575 ?auto_19580 ) ) ( not ( = ?auto_19582 ?auto_19580 ) ) ( not ( = ?auto_19570 ?auto_19580 ) ) ( IS-CRATE ?auto_19570 ) ( not ( = ?auto_19569 ?auto_19570 ) ) ( not ( = ?auto_19572 ?auto_19569 ) ) ( not ( = ?auto_19573 ?auto_19569 ) ) ( not ( = ?auto_19571 ?auto_19569 ) ) ( not ( = ?auto_19575 ?auto_19569 ) ) ( not ( = ?auto_19582 ?auto_19569 ) ) ( not ( = ?auto_19580 ?auto_19569 ) ) ( not ( = ?auto_19584 ?auto_19588 ) ) ( not ( = ?auto_19579 ?auto_19584 ) ) ( not ( = ?auto_19585 ?auto_19584 ) ) ( not ( = ?auto_19581 ?auto_19584 ) ) ( HOIST-AT ?auto_19576 ?auto_19584 ) ( not ( = ?auto_19587 ?auto_19576 ) ) ( not ( = ?auto_19583 ?auto_19576 ) ) ( not ( = ?auto_19574 ?auto_19576 ) ) ( not ( = ?auto_19577 ?auto_19576 ) ) ( AVAILABLE ?auto_19576 ) ( SURFACE-AT ?auto_19570 ?auto_19584 ) ( ON ?auto_19570 ?auto_19578 ) ( CLEAR ?auto_19570 ) ( not ( = ?auto_19572 ?auto_19578 ) ) ( not ( = ?auto_19573 ?auto_19578 ) ) ( not ( = ?auto_19571 ?auto_19578 ) ) ( not ( = ?auto_19575 ?auto_19578 ) ) ( not ( = ?auto_19582 ?auto_19578 ) ) ( not ( = ?auto_19570 ?auto_19578 ) ) ( not ( = ?auto_19580 ?auto_19578 ) ) ( not ( = ?auto_19569 ?auto_19578 ) ) ( TRUCK-AT ?auto_19586 ?auto_19588 ) ( SURFACE-AT ?auto_19568 ?auto_19588 ) ( CLEAR ?auto_19568 ) ( IS-CRATE ?auto_19569 ) ( not ( = ?auto_19568 ?auto_19569 ) ) ( not ( = ?auto_19572 ?auto_19568 ) ) ( not ( = ?auto_19573 ?auto_19568 ) ) ( not ( = ?auto_19571 ?auto_19568 ) ) ( not ( = ?auto_19575 ?auto_19568 ) ) ( not ( = ?auto_19582 ?auto_19568 ) ) ( not ( = ?auto_19570 ?auto_19568 ) ) ( not ( = ?auto_19580 ?auto_19568 ) ) ( not ( = ?auto_19578 ?auto_19568 ) ) ( AVAILABLE ?auto_19587 ) ( IN ?auto_19569 ?auto_19586 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19571 ?auto_19572 ?auto_19573 )
      ( MAKE-5CRATE-VERIFY ?auto_19568 ?auto_19569 ?auto_19570 ?auto_19571 ?auto_19572 ?auto_19573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19589 - SURFACE
      ?auto_19590 - SURFACE
    )
    :vars
    (
      ?auto_19607 - HOIST
      ?auto_19609 - PLACE
      ?auto_19606 - SURFACE
      ?auto_19597 - PLACE
      ?auto_19601 - HOIST
      ?auto_19592 - SURFACE
      ?auto_19603 - PLACE
      ?auto_19591 - HOIST
      ?auto_19600 - SURFACE
      ?auto_19594 - SURFACE
      ?auto_19599 - PLACE
      ?auto_19595 - HOIST
      ?auto_19598 - SURFACE
      ?auto_19608 - SURFACE
      ?auto_19602 - PLACE
      ?auto_19593 - HOIST
      ?auto_19596 - SURFACE
      ?auto_19605 - SURFACE
      ?auto_19604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19607 ?auto_19609 ) ( IS-CRATE ?auto_19590 ) ( not ( = ?auto_19589 ?auto_19590 ) ) ( not ( = ?auto_19606 ?auto_19589 ) ) ( not ( = ?auto_19606 ?auto_19590 ) ) ( not ( = ?auto_19597 ?auto_19609 ) ) ( HOIST-AT ?auto_19601 ?auto_19597 ) ( not ( = ?auto_19607 ?auto_19601 ) ) ( AVAILABLE ?auto_19601 ) ( SURFACE-AT ?auto_19590 ?auto_19597 ) ( ON ?auto_19590 ?auto_19592 ) ( CLEAR ?auto_19590 ) ( not ( = ?auto_19589 ?auto_19592 ) ) ( not ( = ?auto_19590 ?auto_19592 ) ) ( not ( = ?auto_19606 ?auto_19592 ) ) ( IS-CRATE ?auto_19589 ) ( not ( = ?auto_19603 ?auto_19609 ) ) ( not ( = ?auto_19597 ?auto_19603 ) ) ( HOIST-AT ?auto_19591 ?auto_19603 ) ( not ( = ?auto_19607 ?auto_19591 ) ) ( not ( = ?auto_19601 ?auto_19591 ) ) ( AVAILABLE ?auto_19591 ) ( SURFACE-AT ?auto_19589 ?auto_19603 ) ( ON ?auto_19589 ?auto_19600 ) ( CLEAR ?auto_19589 ) ( not ( = ?auto_19589 ?auto_19600 ) ) ( not ( = ?auto_19590 ?auto_19600 ) ) ( not ( = ?auto_19606 ?auto_19600 ) ) ( not ( = ?auto_19592 ?auto_19600 ) ) ( IS-CRATE ?auto_19606 ) ( not ( = ?auto_19594 ?auto_19606 ) ) ( not ( = ?auto_19589 ?auto_19594 ) ) ( not ( = ?auto_19590 ?auto_19594 ) ) ( not ( = ?auto_19592 ?auto_19594 ) ) ( not ( = ?auto_19600 ?auto_19594 ) ) ( not ( = ?auto_19599 ?auto_19609 ) ) ( not ( = ?auto_19597 ?auto_19599 ) ) ( not ( = ?auto_19603 ?auto_19599 ) ) ( HOIST-AT ?auto_19595 ?auto_19599 ) ( not ( = ?auto_19607 ?auto_19595 ) ) ( not ( = ?auto_19601 ?auto_19595 ) ) ( not ( = ?auto_19591 ?auto_19595 ) ) ( AVAILABLE ?auto_19595 ) ( SURFACE-AT ?auto_19606 ?auto_19599 ) ( ON ?auto_19606 ?auto_19598 ) ( CLEAR ?auto_19606 ) ( not ( = ?auto_19589 ?auto_19598 ) ) ( not ( = ?auto_19590 ?auto_19598 ) ) ( not ( = ?auto_19606 ?auto_19598 ) ) ( not ( = ?auto_19592 ?auto_19598 ) ) ( not ( = ?auto_19600 ?auto_19598 ) ) ( not ( = ?auto_19594 ?auto_19598 ) ) ( IS-CRATE ?auto_19594 ) ( not ( = ?auto_19608 ?auto_19594 ) ) ( not ( = ?auto_19589 ?auto_19608 ) ) ( not ( = ?auto_19590 ?auto_19608 ) ) ( not ( = ?auto_19606 ?auto_19608 ) ) ( not ( = ?auto_19592 ?auto_19608 ) ) ( not ( = ?auto_19600 ?auto_19608 ) ) ( not ( = ?auto_19598 ?auto_19608 ) ) ( not ( = ?auto_19602 ?auto_19609 ) ) ( not ( = ?auto_19597 ?auto_19602 ) ) ( not ( = ?auto_19603 ?auto_19602 ) ) ( not ( = ?auto_19599 ?auto_19602 ) ) ( HOIST-AT ?auto_19593 ?auto_19602 ) ( not ( = ?auto_19607 ?auto_19593 ) ) ( not ( = ?auto_19601 ?auto_19593 ) ) ( not ( = ?auto_19591 ?auto_19593 ) ) ( not ( = ?auto_19595 ?auto_19593 ) ) ( AVAILABLE ?auto_19593 ) ( SURFACE-AT ?auto_19594 ?auto_19602 ) ( ON ?auto_19594 ?auto_19596 ) ( CLEAR ?auto_19594 ) ( not ( = ?auto_19589 ?auto_19596 ) ) ( not ( = ?auto_19590 ?auto_19596 ) ) ( not ( = ?auto_19606 ?auto_19596 ) ) ( not ( = ?auto_19592 ?auto_19596 ) ) ( not ( = ?auto_19600 ?auto_19596 ) ) ( not ( = ?auto_19594 ?auto_19596 ) ) ( not ( = ?auto_19598 ?auto_19596 ) ) ( not ( = ?auto_19608 ?auto_19596 ) ) ( SURFACE-AT ?auto_19605 ?auto_19609 ) ( CLEAR ?auto_19605 ) ( IS-CRATE ?auto_19608 ) ( not ( = ?auto_19605 ?auto_19608 ) ) ( not ( = ?auto_19589 ?auto_19605 ) ) ( not ( = ?auto_19590 ?auto_19605 ) ) ( not ( = ?auto_19606 ?auto_19605 ) ) ( not ( = ?auto_19592 ?auto_19605 ) ) ( not ( = ?auto_19600 ?auto_19605 ) ) ( not ( = ?auto_19594 ?auto_19605 ) ) ( not ( = ?auto_19598 ?auto_19605 ) ) ( not ( = ?auto_19596 ?auto_19605 ) ) ( AVAILABLE ?auto_19607 ) ( IN ?auto_19608 ?auto_19604 ) ( TRUCK-AT ?auto_19604 ?auto_19603 ) )
    :subtasks
    ( ( !DRIVE ?auto_19604 ?auto_19603 ?auto_19609 )
      ( MAKE-2CRATE ?auto_19606 ?auto_19589 ?auto_19590 )
      ( MAKE-1CRATE-VERIFY ?auto_19589 ?auto_19590 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19610 - SURFACE
      ?auto_19611 - SURFACE
      ?auto_19612 - SURFACE
    )
    :vars
    (
      ?auto_19618 - HOIST
      ?auto_19620 - PLACE
      ?auto_19615 - PLACE
      ?auto_19624 - HOIST
      ?auto_19614 - SURFACE
      ?auto_19616 - PLACE
      ?auto_19617 - HOIST
      ?auto_19625 - SURFACE
      ?auto_19623 - SURFACE
      ?auto_19622 - PLACE
      ?auto_19626 - HOIST
      ?auto_19629 - SURFACE
      ?auto_19621 - SURFACE
      ?auto_19630 - PLACE
      ?auto_19613 - HOIST
      ?auto_19619 - SURFACE
      ?auto_19628 - SURFACE
      ?auto_19627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19618 ?auto_19620 ) ( IS-CRATE ?auto_19612 ) ( not ( = ?auto_19611 ?auto_19612 ) ) ( not ( = ?auto_19610 ?auto_19611 ) ) ( not ( = ?auto_19610 ?auto_19612 ) ) ( not ( = ?auto_19615 ?auto_19620 ) ) ( HOIST-AT ?auto_19624 ?auto_19615 ) ( not ( = ?auto_19618 ?auto_19624 ) ) ( AVAILABLE ?auto_19624 ) ( SURFACE-AT ?auto_19612 ?auto_19615 ) ( ON ?auto_19612 ?auto_19614 ) ( CLEAR ?auto_19612 ) ( not ( = ?auto_19611 ?auto_19614 ) ) ( not ( = ?auto_19612 ?auto_19614 ) ) ( not ( = ?auto_19610 ?auto_19614 ) ) ( IS-CRATE ?auto_19611 ) ( not ( = ?auto_19616 ?auto_19620 ) ) ( not ( = ?auto_19615 ?auto_19616 ) ) ( HOIST-AT ?auto_19617 ?auto_19616 ) ( not ( = ?auto_19618 ?auto_19617 ) ) ( not ( = ?auto_19624 ?auto_19617 ) ) ( AVAILABLE ?auto_19617 ) ( SURFACE-AT ?auto_19611 ?auto_19616 ) ( ON ?auto_19611 ?auto_19625 ) ( CLEAR ?auto_19611 ) ( not ( = ?auto_19611 ?auto_19625 ) ) ( not ( = ?auto_19612 ?auto_19625 ) ) ( not ( = ?auto_19610 ?auto_19625 ) ) ( not ( = ?auto_19614 ?auto_19625 ) ) ( IS-CRATE ?auto_19610 ) ( not ( = ?auto_19623 ?auto_19610 ) ) ( not ( = ?auto_19611 ?auto_19623 ) ) ( not ( = ?auto_19612 ?auto_19623 ) ) ( not ( = ?auto_19614 ?auto_19623 ) ) ( not ( = ?auto_19625 ?auto_19623 ) ) ( not ( = ?auto_19622 ?auto_19620 ) ) ( not ( = ?auto_19615 ?auto_19622 ) ) ( not ( = ?auto_19616 ?auto_19622 ) ) ( HOIST-AT ?auto_19626 ?auto_19622 ) ( not ( = ?auto_19618 ?auto_19626 ) ) ( not ( = ?auto_19624 ?auto_19626 ) ) ( not ( = ?auto_19617 ?auto_19626 ) ) ( AVAILABLE ?auto_19626 ) ( SURFACE-AT ?auto_19610 ?auto_19622 ) ( ON ?auto_19610 ?auto_19629 ) ( CLEAR ?auto_19610 ) ( not ( = ?auto_19611 ?auto_19629 ) ) ( not ( = ?auto_19612 ?auto_19629 ) ) ( not ( = ?auto_19610 ?auto_19629 ) ) ( not ( = ?auto_19614 ?auto_19629 ) ) ( not ( = ?auto_19625 ?auto_19629 ) ) ( not ( = ?auto_19623 ?auto_19629 ) ) ( IS-CRATE ?auto_19623 ) ( not ( = ?auto_19621 ?auto_19623 ) ) ( not ( = ?auto_19611 ?auto_19621 ) ) ( not ( = ?auto_19612 ?auto_19621 ) ) ( not ( = ?auto_19610 ?auto_19621 ) ) ( not ( = ?auto_19614 ?auto_19621 ) ) ( not ( = ?auto_19625 ?auto_19621 ) ) ( not ( = ?auto_19629 ?auto_19621 ) ) ( not ( = ?auto_19630 ?auto_19620 ) ) ( not ( = ?auto_19615 ?auto_19630 ) ) ( not ( = ?auto_19616 ?auto_19630 ) ) ( not ( = ?auto_19622 ?auto_19630 ) ) ( HOIST-AT ?auto_19613 ?auto_19630 ) ( not ( = ?auto_19618 ?auto_19613 ) ) ( not ( = ?auto_19624 ?auto_19613 ) ) ( not ( = ?auto_19617 ?auto_19613 ) ) ( not ( = ?auto_19626 ?auto_19613 ) ) ( AVAILABLE ?auto_19613 ) ( SURFACE-AT ?auto_19623 ?auto_19630 ) ( ON ?auto_19623 ?auto_19619 ) ( CLEAR ?auto_19623 ) ( not ( = ?auto_19611 ?auto_19619 ) ) ( not ( = ?auto_19612 ?auto_19619 ) ) ( not ( = ?auto_19610 ?auto_19619 ) ) ( not ( = ?auto_19614 ?auto_19619 ) ) ( not ( = ?auto_19625 ?auto_19619 ) ) ( not ( = ?auto_19623 ?auto_19619 ) ) ( not ( = ?auto_19629 ?auto_19619 ) ) ( not ( = ?auto_19621 ?auto_19619 ) ) ( SURFACE-AT ?auto_19628 ?auto_19620 ) ( CLEAR ?auto_19628 ) ( IS-CRATE ?auto_19621 ) ( not ( = ?auto_19628 ?auto_19621 ) ) ( not ( = ?auto_19611 ?auto_19628 ) ) ( not ( = ?auto_19612 ?auto_19628 ) ) ( not ( = ?auto_19610 ?auto_19628 ) ) ( not ( = ?auto_19614 ?auto_19628 ) ) ( not ( = ?auto_19625 ?auto_19628 ) ) ( not ( = ?auto_19623 ?auto_19628 ) ) ( not ( = ?auto_19629 ?auto_19628 ) ) ( not ( = ?auto_19619 ?auto_19628 ) ) ( AVAILABLE ?auto_19618 ) ( IN ?auto_19621 ?auto_19627 ) ( TRUCK-AT ?auto_19627 ?auto_19616 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19611 ?auto_19612 )
      ( MAKE-2CRATE-VERIFY ?auto_19610 ?auto_19611 ?auto_19612 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19631 - SURFACE
      ?auto_19632 - SURFACE
      ?auto_19633 - SURFACE
      ?auto_19634 - SURFACE
    )
    :vars
    (
      ?auto_19638 - HOIST
      ?auto_19649 - PLACE
      ?auto_19635 - PLACE
      ?auto_19645 - HOIST
      ?auto_19643 - SURFACE
      ?auto_19637 - PLACE
      ?auto_19650 - HOIST
      ?auto_19647 - SURFACE
      ?auto_19640 - PLACE
      ?auto_19642 - HOIST
      ?auto_19646 - SURFACE
      ?auto_19648 - SURFACE
      ?auto_19644 - PLACE
      ?auto_19651 - HOIST
      ?auto_19639 - SURFACE
      ?auto_19641 - SURFACE
      ?auto_19636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19638 ?auto_19649 ) ( IS-CRATE ?auto_19634 ) ( not ( = ?auto_19633 ?auto_19634 ) ) ( not ( = ?auto_19632 ?auto_19633 ) ) ( not ( = ?auto_19632 ?auto_19634 ) ) ( not ( = ?auto_19635 ?auto_19649 ) ) ( HOIST-AT ?auto_19645 ?auto_19635 ) ( not ( = ?auto_19638 ?auto_19645 ) ) ( AVAILABLE ?auto_19645 ) ( SURFACE-AT ?auto_19634 ?auto_19635 ) ( ON ?auto_19634 ?auto_19643 ) ( CLEAR ?auto_19634 ) ( not ( = ?auto_19633 ?auto_19643 ) ) ( not ( = ?auto_19634 ?auto_19643 ) ) ( not ( = ?auto_19632 ?auto_19643 ) ) ( IS-CRATE ?auto_19633 ) ( not ( = ?auto_19637 ?auto_19649 ) ) ( not ( = ?auto_19635 ?auto_19637 ) ) ( HOIST-AT ?auto_19650 ?auto_19637 ) ( not ( = ?auto_19638 ?auto_19650 ) ) ( not ( = ?auto_19645 ?auto_19650 ) ) ( AVAILABLE ?auto_19650 ) ( SURFACE-AT ?auto_19633 ?auto_19637 ) ( ON ?auto_19633 ?auto_19647 ) ( CLEAR ?auto_19633 ) ( not ( = ?auto_19633 ?auto_19647 ) ) ( not ( = ?auto_19634 ?auto_19647 ) ) ( not ( = ?auto_19632 ?auto_19647 ) ) ( not ( = ?auto_19643 ?auto_19647 ) ) ( IS-CRATE ?auto_19632 ) ( not ( = ?auto_19631 ?auto_19632 ) ) ( not ( = ?auto_19633 ?auto_19631 ) ) ( not ( = ?auto_19634 ?auto_19631 ) ) ( not ( = ?auto_19643 ?auto_19631 ) ) ( not ( = ?auto_19647 ?auto_19631 ) ) ( not ( = ?auto_19640 ?auto_19649 ) ) ( not ( = ?auto_19635 ?auto_19640 ) ) ( not ( = ?auto_19637 ?auto_19640 ) ) ( HOIST-AT ?auto_19642 ?auto_19640 ) ( not ( = ?auto_19638 ?auto_19642 ) ) ( not ( = ?auto_19645 ?auto_19642 ) ) ( not ( = ?auto_19650 ?auto_19642 ) ) ( AVAILABLE ?auto_19642 ) ( SURFACE-AT ?auto_19632 ?auto_19640 ) ( ON ?auto_19632 ?auto_19646 ) ( CLEAR ?auto_19632 ) ( not ( = ?auto_19633 ?auto_19646 ) ) ( not ( = ?auto_19634 ?auto_19646 ) ) ( not ( = ?auto_19632 ?auto_19646 ) ) ( not ( = ?auto_19643 ?auto_19646 ) ) ( not ( = ?auto_19647 ?auto_19646 ) ) ( not ( = ?auto_19631 ?auto_19646 ) ) ( IS-CRATE ?auto_19631 ) ( not ( = ?auto_19648 ?auto_19631 ) ) ( not ( = ?auto_19633 ?auto_19648 ) ) ( not ( = ?auto_19634 ?auto_19648 ) ) ( not ( = ?auto_19632 ?auto_19648 ) ) ( not ( = ?auto_19643 ?auto_19648 ) ) ( not ( = ?auto_19647 ?auto_19648 ) ) ( not ( = ?auto_19646 ?auto_19648 ) ) ( not ( = ?auto_19644 ?auto_19649 ) ) ( not ( = ?auto_19635 ?auto_19644 ) ) ( not ( = ?auto_19637 ?auto_19644 ) ) ( not ( = ?auto_19640 ?auto_19644 ) ) ( HOIST-AT ?auto_19651 ?auto_19644 ) ( not ( = ?auto_19638 ?auto_19651 ) ) ( not ( = ?auto_19645 ?auto_19651 ) ) ( not ( = ?auto_19650 ?auto_19651 ) ) ( not ( = ?auto_19642 ?auto_19651 ) ) ( AVAILABLE ?auto_19651 ) ( SURFACE-AT ?auto_19631 ?auto_19644 ) ( ON ?auto_19631 ?auto_19639 ) ( CLEAR ?auto_19631 ) ( not ( = ?auto_19633 ?auto_19639 ) ) ( not ( = ?auto_19634 ?auto_19639 ) ) ( not ( = ?auto_19632 ?auto_19639 ) ) ( not ( = ?auto_19643 ?auto_19639 ) ) ( not ( = ?auto_19647 ?auto_19639 ) ) ( not ( = ?auto_19631 ?auto_19639 ) ) ( not ( = ?auto_19646 ?auto_19639 ) ) ( not ( = ?auto_19648 ?auto_19639 ) ) ( SURFACE-AT ?auto_19641 ?auto_19649 ) ( CLEAR ?auto_19641 ) ( IS-CRATE ?auto_19648 ) ( not ( = ?auto_19641 ?auto_19648 ) ) ( not ( = ?auto_19633 ?auto_19641 ) ) ( not ( = ?auto_19634 ?auto_19641 ) ) ( not ( = ?auto_19632 ?auto_19641 ) ) ( not ( = ?auto_19643 ?auto_19641 ) ) ( not ( = ?auto_19647 ?auto_19641 ) ) ( not ( = ?auto_19631 ?auto_19641 ) ) ( not ( = ?auto_19646 ?auto_19641 ) ) ( not ( = ?auto_19639 ?auto_19641 ) ) ( AVAILABLE ?auto_19638 ) ( IN ?auto_19648 ?auto_19636 ) ( TRUCK-AT ?auto_19636 ?auto_19637 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19632 ?auto_19633 ?auto_19634 )
      ( MAKE-3CRATE-VERIFY ?auto_19631 ?auto_19632 ?auto_19633 ?auto_19634 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19652 - SURFACE
      ?auto_19653 - SURFACE
      ?auto_19654 - SURFACE
      ?auto_19655 - SURFACE
      ?auto_19656 - SURFACE
    )
    :vars
    (
      ?auto_19660 - HOIST
      ?auto_19670 - PLACE
      ?auto_19657 - PLACE
      ?auto_19667 - HOIST
      ?auto_19665 - SURFACE
      ?auto_19659 - PLACE
      ?auto_19671 - HOIST
      ?auto_19669 - SURFACE
      ?auto_19662 - PLACE
      ?auto_19664 - HOIST
      ?auto_19668 - SURFACE
      ?auto_19666 - PLACE
      ?auto_19672 - HOIST
      ?auto_19661 - SURFACE
      ?auto_19663 - SURFACE
      ?auto_19658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19660 ?auto_19670 ) ( IS-CRATE ?auto_19656 ) ( not ( = ?auto_19655 ?auto_19656 ) ) ( not ( = ?auto_19654 ?auto_19655 ) ) ( not ( = ?auto_19654 ?auto_19656 ) ) ( not ( = ?auto_19657 ?auto_19670 ) ) ( HOIST-AT ?auto_19667 ?auto_19657 ) ( not ( = ?auto_19660 ?auto_19667 ) ) ( AVAILABLE ?auto_19667 ) ( SURFACE-AT ?auto_19656 ?auto_19657 ) ( ON ?auto_19656 ?auto_19665 ) ( CLEAR ?auto_19656 ) ( not ( = ?auto_19655 ?auto_19665 ) ) ( not ( = ?auto_19656 ?auto_19665 ) ) ( not ( = ?auto_19654 ?auto_19665 ) ) ( IS-CRATE ?auto_19655 ) ( not ( = ?auto_19659 ?auto_19670 ) ) ( not ( = ?auto_19657 ?auto_19659 ) ) ( HOIST-AT ?auto_19671 ?auto_19659 ) ( not ( = ?auto_19660 ?auto_19671 ) ) ( not ( = ?auto_19667 ?auto_19671 ) ) ( AVAILABLE ?auto_19671 ) ( SURFACE-AT ?auto_19655 ?auto_19659 ) ( ON ?auto_19655 ?auto_19669 ) ( CLEAR ?auto_19655 ) ( not ( = ?auto_19655 ?auto_19669 ) ) ( not ( = ?auto_19656 ?auto_19669 ) ) ( not ( = ?auto_19654 ?auto_19669 ) ) ( not ( = ?auto_19665 ?auto_19669 ) ) ( IS-CRATE ?auto_19654 ) ( not ( = ?auto_19653 ?auto_19654 ) ) ( not ( = ?auto_19655 ?auto_19653 ) ) ( not ( = ?auto_19656 ?auto_19653 ) ) ( not ( = ?auto_19665 ?auto_19653 ) ) ( not ( = ?auto_19669 ?auto_19653 ) ) ( not ( = ?auto_19662 ?auto_19670 ) ) ( not ( = ?auto_19657 ?auto_19662 ) ) ( not ( = ?auto_19659 ?auto_19662 ) ) ( HOIST-AT ?auto_19664 ?auto_19662 ) ( not ( = ?auto_19660 ?auto_19664 ) ) ( not ( = ?auto_19667 ?auto_19664 ) ) ( not ( = ?auto_19671 ?auto_19664 ) ) ( AVAILABLE ?auto_19664 ) ( SURFACE-AT ?auto_19654 ?auto_19662 ) ( ON ?auto_19654 ?auto_19668 ) ( CLEAR ?auto_19654 ) ( not ( = ?auto_19655 ?auto_19668 ) ) ( not ( = ?auto_19656 ?auto_19668 ) ) ( not ( = ?auto_19654 ?auto_19668 ) ) ( not ( = ?auto_19665 ?auto_19668 ) ) ( not ( = ?auto_19669 ?auto_19668 ) ) ( not ( = ?auto_19653 ?auto_19668 ) ) ( IS-CRATE ?auto_19653 ) ( not ( = ?auto_19652 ?auto_19653 ) ) ( not ( = ?auto_19655 ?auto_19652 ) ) ( not ( = ?auto_19656 ?auto_19652 ) ) ( not ( = ?auto_19654 ?auto_19652 ) ) ( not ( = ?auto_19665 ?auto_19652 ) ) ( not ( = ?auto_19669 ?auto_19652 ) ) ( not ( = ?auto_19668 ?auto_19652 ) ) ( not ( = ?auto_19666 ?auto_19670 ) ) ( not ( = ?auto_19657 ?auto_19666 ) ) ( not ( = ?auto_19659 ?auto_19666 ) ) ( not ( = ?auto_19662 ?auto_19666 ) ) ( HOIST-AT ?auto_19672 ?auto_19666 ) ( not ( = ?auto_19660 ?auto_19672 ) ) ( not ( = ?auto_19667 ?auto_19672 ) ) ( not ( = ?auto_19671 ?auto_19672 ) ) ( not ( = ?auto_19664 ?auto_19672 ) ) ( AVAILABLE ?auto_19672 ) ( SURFACE-AT ?auto_19653 ?auto_19666 ) ( ON ?auto_19653 ?auto_19661 ) ( CLEAR ?auto_19653 ) ( not ( = ?auto_19655 ?auto_19661 ) ) ( not ( = ?auto_19656 ?auto_19661 ) ) ( not ( = ?auto_19654 ?auto_19661 ) ) ( not ( = ?auto_19665 ?auto_19661 ) ) ( not ( = ?auto_19669 ?auto_19661 ) ) ( not ( = ?auto_19653 ?auto_19661 ) ) ( not ( = ?auto_19668 ?auto_19661 ) ) ( not ( = ?auto_19652 ?auto_19661 ) ) ( SURFACE-AT ?auto_19663 ?auto_19670 ) ( CLEAR ?auto_19663 ) ( IS-CRATE ?auto_19652 ) ( not ( = ?auto_19663 ?auto_19652 ) ) ( not ( = ?auto_19655 ?auto_19663 ) ) ( not ( = ?auto_19656 ?auto_19663 ) ) ( not ( = ?auto_19654 ?auto_19663 ) ) ( not ( = ?auto_19665 ?auto_19663 ) ) ( not ( = ?auto_19669 ?auto_19663 ) ) ( not ( = ?auto_19653 ?auto_19663 ) ) ( not ( = ?auto_19668 ?auto_19663 ) ) ( not ( = ?auto_19661 ?auto_19663 ) ) ( AVAILABLE ?auto_19660 ) ( IN ?auto_19652 ?auto_19658 ) ( TRUCK-AT ?auto_19658 ?auto_19659 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19654 ?auto_19655 ?auto_19656 )
      ( MAKE-4CRATE-VERIFY ?auto_19652 ?auto_19653 ?auto_19654 ?auto_19655 ?auto_19656 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19673 - SURFACE
      ?auto_19674 - SURFACE
      ?auto_19675 - SURFACE
      ?auto_19676 - SURFACE
      ?auto_19677 - SURFACE
      ?auto_19678 - SURFACE
    )
    :vars
    (
      ?auto_19682 - HOIST
      ?auto_19691 - PLACE
      ?auto_19679 - PLACE
      ?auto_19688 - HOIST
      ?auto_19686 - SURFACE
      ?auto_19681 - PLACE
      ?auto_19692 - HOIST
      ?auto_19690 - SURFACE
      ?auto_19684 - PLACE
      ?auto_19685 - HOIST
      ?auto_19689 - SURFACE
      ?auto_19687 - PLACE
      ?auto_19693 - HOIST
      ?auto_19683 - SURFACE
      ?auto_19680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19682 ?auto_19691 ) ( IS-CRATE ?auto_19678 ) ( not ( = ?auto_19677 ?auto_19678 ) ) ( not ( = ?auto_19676 ?auto_19677 ) ) ( not ( = ?auto_19676 ?auto_19678 ) ) ( not ( = ?auto_19679 ?auto_19691 ) ) ( HOIST-AT ?auto_19688 ?auto_19679 ) ( not ( = ?auto_19682 ?auto_19688 ) ) ( AVAILABLE ?auto_19688 ) ( SURFACE-AT ?auto_19678 ?auto_19679 ) ( ON ?auto_19678 ?auto_19686 ) ( CLEAR ?auto_19678 ) ( not ( = ?auto_19677 ?auto_19686 ) ) ( not ( = ?auto_19678 ?auto_19686 ) ) ( not ( = ?auto_19676 ?auto_19686 ) ) ( IS-CRATE ?auto_19677 ) ( not ( = ?auto_19681 ?auto_19691 ) ) ( not ( = ?auto_19679 ?auto_19681 ) ) ( HOIST-AT ?auto_19692 ?auto_19681 ) ( not ( = ?auto_19682 ?auto_19692 ) ) ( not ( = ?auto_19688 ?auto_19692 ) ) ( AVAILABLE ?auto_19692 ) ( SURFACE-AT ?auto_19677 ?auto_19681 ) ( ON ?auto_19677 ?auto_19690 ) ( CLEAR ?auto_19677 ) ( not ( = ?auto_19677 ?auto_19690 ) ) ( not ( = ?auto_19678 ?auto_19690 ) ) ( not ( = ?auto_19676 ?auto_19690 ) ) ( not ( = ?auto_19686 ?auto_19690 ) ) ( IS-CRATE ?auto_19676 ) ( not ( = ?auto_19675 ?auto_19676 ) ) ( not ( = ?auto_19677 ?auto_19675 ) ) ( not ( = ?auto_19678 ?auto_19675 ) ) ( not ( = ?auto_19686 ?auto_19675 ) ) ( not ( = ?auto_19690 ?auto_19675 ) ) ( not ( = ?auto_19684 ?auto_19691 ) ) ( not ( = ?auto_19679 ?auto_19684 ) ) ( not ( = ?auto_19681 ?auto_19684 ) ) ( HOIST-AT ?auto_19685 ?auto_19684 ) ( not ( = ?auto_19682 ?auto_19685 ) ) ( not ( = ?auto_19688 ?auto_19685 ) ) ( not ( = ?auto_19692 ?auto_19685 ) ) ( AVAILABLE ?auto_19685 ) ( SURFACE-AT ?auto_19676 ?auto_19684 ) ( ON ?auto_19676 ?auto_19689 ) ( CLEAR ?auto_19676 ) ( not ( = ?auto_19677 ?auto_19689 ) ) ( not ( = ?auto_19678 ?auto_19689 ) ) ( not ( = ?auto_19676 ?auto_19689 ) ) ( not ( = ?auto_19686 ?auto_19689 ) ) ( not ( = ?auto_19690 ?auto_19689 ) ) ( not ( = ?auto_19675 ?auto_19689 ) ) ( IS-CRATE ?auto_19675 ) ( not ( = ?auto_19674 ?auto_19675 ) ) ( not ( = ?auto_19677 ?auto_19674 ) ) ( not ( = ?auto_19678 ?auto_19674 ) ) ( not ( = ?auto_19676 ?auto_19674 ) ) ( not ( = ?auto_19686 ?auto_19674 ) ) ( not ( = ?auto_19690 ?auto_19674 ) ) ( not ( = ?auto_19689 ?auto_19674 ) ) ( not ( = ?auto_19687 ?auto_19691 ) ) ( not ( = ?auto_19679 ?auto_19687 ) ) ( not ( = ?auto_19681 ?auto_19687 ) ) ( not ( = ?auto_19684 ?auto_19687 ) ) ( HOIST-AT ?auto_19693 ?auto_19687 ) ( not ( = ?auto_19682 ?auto_19693 ) ) ( not ( = ?auto_19688 ?auto_19693 ) ) ( not ( = ?auto_19692 ?auto_19693 ) ) ( not ( = ?auto_19685 ?auto_19693 ) ) ( AVAILABLE ?auto_19693 ) ( SURFACE-AT ?auto_19675 ?auto_19687 ) ( ON ?auto_19675 ?auto_19683 ) ( CLEAR ?auto_19675 ) ( not ( = ?auto_19677 ?auto_19683 ) ) ( not ( = ?auto_19678 ?auto_19683 ) ) ( not ( = ?auto_19676 ?auto_19683 ) ) ( not ( = ?auto_19686 ?auto_19683 ) ) ( not ( = ?auto_19690 ?auto_19683 ) ) ( not ( = ?auto_19675 ?auto_19683 ) ) ( not ( = ?auto_19689 ?auto_19683 ) ) ( not ( = ?auto_19674 ?auto_19683 ) ) ( SURFACE-AT ?auto_19673 ?auto_19691 ) ( CLEAR ?auto_19673 ) ( IS-CRATE ?auto_19674 ) ( not ( = ?auto_19673 ?auto_19674 ) ) ( not ( = ?auto_19677 ?auto_19673 ) ) ( not ( = ?auto_19678 ?auto_19673 ) ) ( not ( = ?auto_19676 ?auto_19673 ) ) ( not ( = ?auto_19686 ?auto_19673 ) ) ( not ( = ?auto_19690 ?auto_19673 ) ) ( not ( = ?auto_19675 ?auto_19673 ) ) ( not ( = ?auto_19689 ?auto_19673 ) ) ( not ( = ?auto_19683 ?auto_19673 ) ) ( AVAILABLE ?auto_19682 ) ( IN ?auto_19674 ?auto_19680 ) ( TRUCK-AT ?auto_19680 ?auto_19681 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19676 ?auto_19677 ?auto_19678 )
      ( MAKE-5CRATE-VERIFY ?auto_19673 ?auto_19674 ?auto_19675 ?auto_19676 ?auto_19677 ?auto_19678 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19694 - SURFACE
      ?auto_19695 - SURFACE
    )
    :vars
    (
      ?auto_19700 - HOIST
      ?auto_19712 - PLACE
      ?auto_19707 - SURFACE
      ?auto_19697 - PLACE
      ?auto_19708 - HOIST
      ?auto_19705 - SURFACE
      ?auto_19699 - PLACE
      ?auto_19713 - HOIST
      ?auto_19710 - SURFACE
      ?auto_19696 - SURFACE
      ?auto_19702 - PLACE
      ?auto_19704 - HOIST
      ?auto_19709 - SURFACE
      ?auto_19711 - SURFACE
      ?auto_19706 - PLACE
      ?auto_19714 - HOIST
      ?auto_19701 - SURFACE
      ?auto_19703 - SURFACE
      ?auto_19698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19700 ?auto_19712 ) ( IS-CRATE ?auto_19695 ) ( not ( = ?auto_19694 ?auto_19695 ) ) ( not ( = ?auto_19707 ?auto_19694 ) ) ( not ( = ?auto_19707 ?auto_19695 ) ) ( not ( = ?auto_19697 ?auto_19712 ) ) ( HOIST-AT ?auto_19708 ?auto_19697 ) ( not ( = ?auto_19700 ?auto_19708 ) ) ( AVAILABLE ?auto_19708 ) ( SURFACE-AT ?auto_19695 ?auto_19697 ) ( ON ?auto_19695 ?auto_19705 ) ( CLEAR ?auto_19695 ) ( not ( = ?auto_19694 ?auto_19705 ) ) ( not ( = ?auto_19695 ?auto_19705 ) ) ( not ( = ?auto_19707 ?auto_19705 ) ) ( IS-CRATE ?auto_19694 ) ( not ( = ?auto_19699 ?auto_19712 ) ) ( not ( = ?auto_19697 ?auto_19699 ) ) ( HOIST-AT ?auto_19713 ?auto_19699 ) ( not ( = ?auto_19700 ?auto_19713 ) ) ( not ( = ?auto_19708 ?auto_19713 ) ) ( SURFACE-AT ?auto_19694 ?auto_19699 ) ( ON ?auto_19694 ?auto_19710 ) ( CLEAR ?auto_19694 ) ( not ( = ?auto_19694 ?auto_19710 ) ) ( not ( = ?auto_19695 ?auto_19710 ) ) ( not ( = ?auto_19707 ?auto_19710 ) ) ( not ( = ?auto_19705 ?auto_19710 ) ) ( IS-CRATE ?auto_19707 ) ( not ( = ?auto_19696 ?auto_19707 ) ) ( not ( = ?auto_19694 ?auto_19696 ) ) ( not ( = ?auto_19695 ?auto_19696 ) ) ( not ( = ?auto_19705 ?auto_19696 ) ) ( not ( = ?auto_19710 ?auto_19696 ) ) ( not ( = ?auto_19702 ?auto_19712 ) ) ( not ( = ?auto_19697 ?auto_19702 ) ) ( not ( = ?auto_19699 ?auto_19702 ) ) ( HOIST-AT ?auto_19704 ?auto_19702 ) ( not ( = ?auto_19700 ?auto_19704 ) ) ( not ( = ?auto_19708 ?auto_19704 ) ) ( not ( = ?auto_19713 ?auto_19704 ) ) ( AVAILABLE ?auto_19704 ) ( SURFACE-AT ?auto_19707 ?auto_19702 ) ( ON ?auto_19707 ?auto_19709 ) ( CLEAR ?auto_19707 ) ( not ( = ?auto_19694 ?auto_19709 ) ) ( not ( = ?auto_19695 ?auto_19709 ) ) ( not ( = ?auto_19707 ?auto_19709 ) ) ( not ( = ?auto_19705 ?auto_19709 ) ) ( not ( = ?auto_19710 ?auto_19709 ) ) ( not ( = ?auto_19696 ?auto_19709 ) ) ( IS-CRATE ?auto_19696 ) ( not ( = ?auto_19711 ?auto_19696 ) ) ( not ( = ?auto_19694 ?auto_19711 ) ) ( not ( = ?auto_19695 ?auto_19711 ) ) ( not ( = ?auto_19707 ?auto_19711 ) ) ( not ( = ?auto_19705 ?auto_19711 ) ) ( not ( = ?auto_19710 ?auto_19711 ) ) ( not ( = ?auto_19709 ?auto_19711 ) ) ( not ( = ?auto_19706 ?auto_19712 ) ) ( not ( = ?auto_19697 ?auto_19706 ) ) ( not ( = ?auto_19699 ?auto_19706 ) ) ( not ( = ?auto_19702 ?auto_19706 ) ) ( HOIST-AT ?auto_19714 ?auto_19706 ) ( not ( = ?auto_19700 ?auto_19714 ) ) ( not ( = ?auto_19708 ?auto_19714 ) ) ( not ( = ?auto_19713 ?auto_19714 ) ) ( not ( = ?auto_19704 ?auto_19714 ) ) ( AVAILABLE ?auto_19714 ) ( SURFACE-AT ?auto_19696 ?auto_19706 ) ( ON ?auto_19696 ?auto_19701 ) ( CLEAR ?auto_19696 ) ( not ( = ?auto_19694 ?auto_19701 ) ) ( not ( = ?auto_19695 ?auto_19701 ) ) ( not ( = ?auto_19707 ?auto_19701 ) ) ( not ( = ?auto_19705 ?auto_19701 ) ) ( not ( = ?auto_19710 ?auto_19701 ) ) ( not ( = ?auto_19696 ?auto_19701 ) ) ( not ( = ?auto_19709 ?auto_19701 ) ) ( not ( = ?auto_19711 ?auto_19701 ) ) ( SURFACE-AT ?auto_19703 ?auto_19712 ) ( CLEAR ?auto_19703 ) ( IS-CRATE ?auto_19711 ) ( not ( = ?auto_19703 ?auto_19711 ) ) ( not ( = ?auto_19694 ?auto_19703 ) ) ( not ( = ?auto_19695 ?auto_19703 ) ) ( not ( = ?auto_19707 ?auto_19703 ) ) ( not ( = ?auto_19705 ?auto_19703 ) ) ( not ( = ?auto_19710 ?auto_19703 ) ) ( not ( = ?auto_19696 ?auto_19703 ) ) ( not ( = ?auto_19709 ?auto_19703 ) ) ( not ( = ?auto_19701 ?auto_19703 ) ) ( AVAILABLE ?auto_19700 ) ( TRUCK-AT ?auto_19698 ?auto_19699 ) ( LIFTING ?auto_19713 ?auto_19711 ) )
    :subtasks
    ( ( !LOAD ?auto_19713 ?auto_19711 ?auto_19698 ?auto_19699 )
      ( MAKE-2CRATE ?auto_19707 ?auto_19694 ?auto_19695 )
      ( MAKE-1CRATE-VERIFY ?auto_19694 ?auto_19695 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19715 - SURFACE
      ?auto_19716 - SURFACE
      ?auto_19717 - SURFACE
    )
    :vars
    (
      ?auto_19734 - HOIST
      ?auto_19727 - PLACE
      ?auto_19729 - PLACE
      ?auto_19724 - HOIST
      ?auto_19722 - SURFACE
      ?auto_19720 - PLACE
      ?auto_19730 - HOIST
      ?auto_19718 - SURFACE
      ?auto_19719 - SURFACE
      ?auto_19731 - PLACE
      ?auto_19733 - HOIST
      ?auto_19725 - SURFACE
      ?auto_19732 - SURFACE
      ?auto_19726 - PLACE
      ?auto_19721 - HOIST
      ?auto_19735 - SURFACE
      ?auto_19728 - SURFACE
      ?auto_19723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19734 ?auto_19727 ) ( IS-CRATE ?auto_19717 ) ( not ( = ?auto_19716 ?auto_19717 ) ) ( not ( = ?auto_19715 ?auto_19716 ) ) ( not ( = ?auto_19715 ?auto_19717 ) ) ( not ( = ?auto_19729 ?auto_19727 ) ) ( HOIST-AT ?auto_19724 ?auto_19729 ) ( not ( = ?auto_19734 ?auto_19724 ) ) ( AVAILABLE ?auto_19724 ) ( SURFACE-AT ?auto_19717 ?auto_19729 ) ( ON ?auto_19717 ?auto_19722 ) ( CLEAR ?auto_19717 ) ( not ( = ?auto_19716 ?auto_19722 ) ) ( not ( = ?auto_19717 ?auto_19722 ) ) ( not ( = ?auto_19715 ?auto_19722 ) ) ( IS-CRATE ?auto_19716 ) ( not ( = ?auto_19720 ?auto_19727 ) ) ( not ( = ?auto_19729 ?auto_19720 ) ) ( HOIST-AT ?auto_19730 ?auto_19720 ) ( not ( = ?auto_19734 ?auto_19730 ) ) ( not ( = ?auto_19724 ?auto_19730 ) ) ( SURFACE-AT ?auto_19716 ?auto_19720 ) ( ON ?auto_19716 ?auto_19718 ) ( CLEAR ?auto_19716 ) ( not ( = ?auto_19716 ?auto_19718 ) ) ( not ( = ?auto_19717 ?auto_19718 ) ) ( not ( = ?auto_19715 ?auto_19718 ) ) ( not ( = ?auto_19722 ?auto_19718 ) ) ( IS-CRATE ?auto_19715 ) ( not ( = ?auto_19719 ?auto_19715 ) ) ( not ( = ?auto_19716 ?auto_19719 ) ) ( not ( = ?auto_19717 ?auto_19719 ) ) ( not ( = ?auto_19722 ?auto_19719 ) ) ( not ( = ?auto_19718 ?auto_19719 ) ) ( not ( = ?auto_19731 ?auto_19727 ) ) ( not ( = ?auto_19729 ?auto_19731 ) ) ( not ( = ?auto_19720 ?auto_19731 ) ) ( HOIST-AT ?auto_19733 ?auto_19731 ) ( not ( = ?auto_19734 ?auto_19733 ) ) ( not ( = ?auto_19724 ?auto_19733 ) ) ( not ( = ?auto_19730 ?auto_19733 ) ) ( AVAILABLE ?auto_19733 ) ( SURFACE-AT ?auto_19715 ?auto_19731 ) ( ON ?auto_19715 ?auto_19725 ) ( CLEAR ?auto_19715 ) ( not ( = ?auto_19716 ?auto_19725 ) ) ( not ( = ?auto_19717 ?auto_19725 ) ) ( not ( = ?auto_19715 ?auto_19725 ) ) ( not ( = ?auto_19722 ?auto_19725 ) ) ( not ( = ?auto_19718 ?auto_19725 ) ) ( not ( = ?auto_19719 ?auto_19725 ) ) ( IS-CRATE ?auto_19719 ) ( not ( = ?auto_19732 ?auto_19719 ) ) ( not ( = ?auto_19716 ?auto_19732 ) ) ( not ( = ?auto_19717 ?auto_19732 ) ) ( not ( = ?auto_19715 ?auto_19732 ) ) ( not ( = ?auto_19722 ?auto_19732 ) ) ( not ( = ?auto_19718 ?auto_19732 ) ) ( not ( = ?auto_19725 ?auto_19732 ) ) ( not ( = ?auto_19726 ?auto_19727 ) ) ( not ( = ?auto_19729 ?auto_19726 ) ) ( not ( = ?auto_19720 ?auto_19726 ) ) ( not ( = ?auto_19731 ?auto_19726 ) ) ( HOIST-AT ?auto_19721 ?auto_19726 ) ( not ( = ?auto_19734 ?auto_19721 ) ) ( not ( = ?auto_19724 ?auto_19721 ) ) ( not ( = ?auto_19730 ?auto_19721 ) ) ( not ( = ?auto_19733 ?auto_19721 ) ) ( AVAILABLE ?auto_19721 ) ( SURFACE-AT ?auto_19719 ?auto_19726 ) ( ON ?auto_19719 ?auto_19735 ) ( CLEAR ?auto_19719 ) ( not ( = ?auto_19716 ?auto_19735 ) ) ( not ( = ?auto_19717 ?auto_19735 ) ) ( not ( = ?auto_19715 ?auto_19735 ) ) ( not ( = ?auto_19722 ?auto_19735 ) ) ( not ( = ?auto_19718 ?auto_19735 ) ) ( not ( = ?auto_19719 ?auto_19735 ) ) ( not ( = ?auto_19725 ?auto_19735 ) ) ( not ( = ?auto_19732 ?auto_19735 ) ) ( SURFACE-AT ?auto_19728 ?auto_19727 ) ( CLEAR ?auto_19728 ) ( IS-CRATE ?auto_19732 ) ( not ( = ?auto_19728 ?auto_19732 ) ) ( not ( = ?auto_19716 ?auto_19728 ) ) ( not ( = ?auto_19717 ?auto_19728 ) ) ( not ( = ?auto_19715 ?auto_19728 ) ) ( not ( = ?auto_19722 ?auto_19728 ) ) ( not ( = ?auto_19718 ?auto_19728 ) ) ( not ( = ?auto_19719 ?auto_19728 ) ) ( not ( = ?auto_19725 ?auto_19728 ) ) ( not ( = ?auto_19735 ?auto_19728 ) ) ( AVAILABLE ?auto_19734 ) ( TRUCK-AT ?auto_19723 ?auto_19720 ) ( LIFTING ?auto_19730 ?auto_19732 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19716 ?auto_19717 )
      ( MAKE-2CRATE-VERIFY ?auto_19715 ?auto_19716 ?auto_19717 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19736 - SURFACE
      ?auto_19737 - SURFACE
      ?auto_19738 - SURFACE
      ?auto_19739 - SURFACE
    )
    :vars
    (
      ?auto_19750 - HOIST
      ?auto_19753 - PLACE
      ?auto_19746 - PLACE
      ?auto_19743 - HOIST
      ?auto_19749 - SURFACE
      ?auto_19754 - PLACE
      ?auto_19756 - HOIST
      ?auto_19748 - SURFACE
      ?auto_19751 - PLACE
      ?auto_19747 - HOIST
      ?auto_19741 - SURFACE
      ?auto_19752 - SURFACE
      ?auto_19742 - PLACE
      ?auto_19744 - HOIST
      ?auto_19745 - SURFACE
      ?auto_19740 - SURFACE
      ?auto_19755 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19750 ?auto_19753 ) ( IS-CRATE ?auto_19739 ) ( not ( = ?auto_19738 ?auto_19739 ) ) ( not ( = ?auto_19737 ?auto_19738 ) ) ( not ( = ?auto_19737 ?auto_19739 ) ) ( not ( = ?auto_19746 ?auto_19753 ) ) ( HOIST-AT ?auto_19743 ?auto_19746 ) ( not ( = ?auto_19750 ?auto_19743 ) ) ( AVAILABLE ?auto_19743 ) ( SURFACE-AT ?auto_19739 ?auto_19746 ) ( ON ?auto_19739 ?auto_19749 ) ( CLEAR ?auto_19739 ) ( not ( = ?auto_19738 ?auto_19749 ) ) ( not ( = ?auto_19739 ?auto_19749 ) ) ( not ( = ?auto_19737 ?auto_19749 ) ) ( IS-CRATE ?auto_19738 ) ( not ( = ?auto_19754 ?auto_19753 ) ) ( not ( = ?auto_19746 ?auto_19754 ) ) ( HOIST-AT ?auto_19756 ?auto_19754 ) ( not ( = ?auto_19750 ?auto_19756 ) ) ( not ( = ?auto_19743 ?auto_19756 ) ) ( SURFACE-AT ?auto_19738 ?auto_19754 ) ( ON ?auto_19738 ?auto_19748 ) ( CLEAR ?auto_19738 ) ( not ( = ?auto_19738 ?auto_19748 ) ) ( not ( = ?auto_19739 ?auto_19748 ) ) ( not ( = ?auto_19737 ?auto_19748 ) ) ( not ( = ?auto_19749 ?auto_19748 ) ) ( IS-CRATE ?auto_19737 ) ( not ( = ?auto_19736 ?auto_19737 ) ) ( not ( = ?auto_19738 ?auto_19736 ) ) ( not ( = ?auto_19739 ?auto_19736 ) ) ( not ( = ?auto_19749 ?auto_19736 ) ) ( not ( = ?auto_19748 ?auto_19736 ) ) ( not ( = ?auto_19751 ?auto_19753 ) ) ( not ( = ?auto_19746 ?auto_19751 ) ) ( not ( = ?auto_19754 ?auto_19751 ) ) ( HOIST-AT ?auto_19747 ?auto_19751 ) ( not ( = ?auto_19750 ?auto_19747 ) ) ( not ( = ?auto_19743 ?auto_19747 ) ) ( not ( = ?auto_19756 ?auto_19747 ) ) ( AVAILABLE ?auto_19747 ) ( SURFACE-AT ?auto_19737 ?auto_19751 ) ( ON ?auto_19737 ?auto_19741 ) ( CLEAR ?auto_19737 ) ( not ( = ?auto_19738 ?auto_19741 ) ) ( not ( = ?auto_19739 ?auto_19741 ) ) ( not ( = ?auto_19737 ?auto_19741 ) ) ( not ( = ?auto_19749 ?auto_19741 ) ) ( not ( = ?auto_19748 ?auto_19741 ) ) ( not ( = ?auto_19736 ?auto_19741 ) ) ( IS-CRATE ?auto_19736 ) ( not ( = ?auto_19752 ?auto_19736 ) ) ( not ( = ?auto_19738 ?auto_19752 ) ) ( not ( = ?auto_19739 ?auto_19752 ) ) ( not ( = ?auto_19737 ?auto_19752 ) ) ( not ( = ?auto_19749 ?auto_19752 ) ) ( not ( = ?auto_19748 ?auto_19752 ) ) ( not ( = ?auto_19741 ?auto_19752 ) ) ( not ( = ?auto_19742 ?auto_19753 ) ) ( not ( = ?auto_19746 ?auto_19742 ) ) ( not ( = ?auto_19754 ?auto_19742 ) ) ( not ( = ?auto_19751 ?auto_19742 ) ) ( HOIST-AT ?auto_19744 ?auto_19742 ) ( not ( = ?auto_19750 ?auto_19744 ) ) ( not ( = ?auto_19743 ?auto_19744 ) ) ( not ( = ?auto_19756 ?auto_19744 ) ) ( not ( = ?auto_19747 ?auto_19744 ) ) ( AVAILABLE ?auto_19744 ) ( SURFACE-AT ?auto_19736 ?auto_19742 ) ( ON ?auto_19736 ?auto_19745 ) ( CLEAR ?auto_19736 ) ( not ( = ?auto_19738 ?auto_19745 ) ) ( not ( = ?auto_19739 ?auto_19745 ) ) ( not ( = ?auto_19737 ?auto_19745 ) ) ( not ( = ?auto_19749 ?auto_19745 ) ) ( not ( = ?auto_19748 ?auto_19745 ) ) ( not ( = ?auto_19736 ?auto_19745 ) ) ( not ( = ?auto_19741 ?auto_19745 ) ) ( not ( = ?auto_19752 ?auto_19745 ) ) ( SURFACE-AT ?auto_19740 ?auto_19753 ) ( CLEAR ?auto_19740 ) ( IS-CRATE ?auto_19752 ) ( not ( = ?auto_19740 ?auto_19752 ) ) ( not ( = ?auto_19738 ?auto_19740 ) ) ( not ( = ?auto_19739 ?auto_19740 ) ) ( not ( = ?auto_19737 ?auto_19740 ) ) ( not ( = ?auto_19749 ?auto_19740 ) ) ( not ( = ?auto_19748 ?auto_19740 ) ) ( not ( = ?auto_19736 ?auto_19740 ) ) ( not ( = ?auto_19741 ?auto_19740 ) ) ( not ( = ?auto_19745 ?auto_19740 ) ) ( AVAILABLE ?auto_19750 ) ( TRUCK-AT ?auto_19755 ?auto_19754 ) ( LIFTING ?auto_19756 ?auto_19752 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19737 ?auto_19738 ?auto_19739 )
      ( MAKE-3CRATE-VERIFY ?auto_19736 ?auto_19737 ?auto_19738 ?auto_19739 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19757 - SURFACE
      ?auto_19758 - SURFACE
      ?auto_19759 - SURFACE
      ?auto_19760 - SURFACE
      ?auto_19761 - SURFACE
    )
    :vars
    (
      ?auto_19772 - HOIST
      ?auto_19774 - PLACE
      ?auto_19768 - PLACE
      ?auto_19765 - HOIST
      ?auto_19771 - SURFACE
      ?auto_19775 - PLACE
      ?auto_19777 - HOIST
      ?auto_19770 - SURFACE
      ?auto_19773 - PLACE
      ?auto_19769 - HOIST
      ?auto_19763 - SURFACE
      ?auto_19764 - PLACE
      ?auto_19766 - HOIST
      ?auto_19767 - SURFACE
      ?auto_19762 - SURFACE
      ?auto_19776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19772 ?auto_19774 ) ( IS-CRATE ?auto_19761 ) ( not ( = ?auto_19760 ?auto_19761 ) ) ( not ( = ?auto_19759 ?auto_19760 ) ) ( not ( = ?auto_19759 ?auto_19761 ) ) ( not ( = ?auto_19768 ?auto_19774 ) ) ( HOIST-AT ?auto_19765 ?auto_19768 ) ( not ( = ?auto_19772 ?auto_19765 ) ) ( AVAILABLE ?auto_19765 ) ( SURFACE-AT ?auto_19761 ?auto_19768 ) ( ON ?auto_19761 ?auto_19771 ) ( CLEAR ?auto_19761 ) ( not ( = ?auto_19760 ?auto_19771 ) ) ( not ( = ?auto_19761 ?auto_19771 ) ) ( not ( = ?auto_19759 ?auto_19771 ) ) ( IS-CRATE ?auto_19760 ) ( not ( = ?auto_19775 ?auto_19774 ) ) ( not ( = ?auto_19768 ?auto_19775 ) ) ( HOIST-AT ?auto_19777 ?auto_19775 ) ( not ( = ?auto_19772 ?auto_19777 ) ) ( not ( = ?auto_19765 ?auto_19777 ) ) ( SURFACE-AT ?auto_19760 ?auto_19775 ) ( ON ?auto_19760 ?auto_19770 ) ( CLEAR ?auto_19760 ) ( not ( = ?auto_19760 ?auto_19770 ) ) ( not ( = ?auto_19761 ?auto_19770 ) ) ( not ( = ?auto_19759 ?auto_19770 ) ) ( not ( = ?auto_19771 ?auto_19770 ) ) ( IS-CRATE ?auto_19759 ) ( not ( = ?auto_19758 ?auto_19759 ) ) ( not ( = ?auto_19760 ?auto_19758 ) ) ( not ( = ?auto_19761 ?auto_19758 ) ) ( not ( = ?auto_19771 ?auto_19758 ) ) ( not ( = ?auto_19770 ?auto_19758 ) ) ( not ( = ?auto_19773 ?auto_19774 ) ) ( not ( = ?auto_19768 ?auto_19773 ) ) ( not ( = ?auto_19775 ?auto_19773 ) ) ( HOIST-AT ?auto_19769 ?auto_19773 ) ( not ( = ?auto_19772 ?auto_19769 ) ) ( not ( = ?auto_19765 ?auto_19769 ) ) ( not ( = ?auto_19777 ?auto_19769 ) ) ( AVAILABLE ?auto_19769 ) ( SURFACE-AT ?auto_19759 ?auto_19773 ) ( ON ?auto_19759 ?auto_19763 ) ( CLEAR ?auto_19759 ) ( not ( = ?auto_19760 ?auto_19763 ) ) ( not ( = ?auto_19761 ?auto_19763 ) ) ( not ( = ?auto_19759 ?auto_19763 ) ) ( not ( = ?auto_19771 ?auto_19763 ) ) ( not ( = ?auto_19770 ?auto_19763 ) ) ( not ( = ?auto_19758 ?auto_19763 ) ) ( IS-CRATE ?auto_19758 ) ( not ( = ?auto_19757 ?auto_19758 ) ) ( not ( = ?auto_19760 ?auto_19757 ) ) ( not ( = ?auto_19761 ?auto_19757 ) ) ( not ( = ?auto_19759 ?auto_19757 ) ) ( not ( = ?auto_19771 ?auto_19757 ) ) ( not ( = ?auto_19770 ?auto_19757 ) ) ( not ( = ?auto_19763 ?auto_19757 ) ) ( not ( = ?auto_19764 ?auto_19774 ) ) ( not ( = ?auto_19768 ?auto_19764 ) ) ( not ( = ?auto_19775 ?auto_19764 ) ) ( not ( = ?auto_19773 ?auto_19764 ) ) ( HOIST-AT ?auto_19766 ?auto_19764 ) ( not ( = ?auto_19772 ?auto_19766 ) ) ( not ( = ?auto_19765 ?auto_19766 ) ) ( not ( = ?auto_19777 ?auto_19766 ) ) ( not ( = ?auto_19769 ?auto_19766 ) ) ( AVAILABLE ?auto_19766 ) ( SURFACE-AT ?auto_19758 ?auto_19764 ) ( ON ?auto_19758 ?auto_19767 ) ( CLEAR ?auto_19758 ) ( not ( = ?auto_19760 ?auto_19767 ) ) ( not ( = ?auto_19761 ?auto_19767 ) ) ( not ( = ?auto_19759 ?auto_19767 ) ) ( not ( = ?auto_19771 ?auto_19767 ) ) ( not ( = ?auto_19770 ?auto_19767 ) ) ( not ( = ?auto_19758 ?auto_19767 ) ) ( not ( = ?auto_19763 ?auto_19767 ) ) ( not ( = ?auto_19757 ?auto_19767 ) ) ( SURFACE-AT ?auto_19762 ?auto_19774 ) ( CLEAR ?auto_19762 ) ( IS-CRATE ?auto_19757 ) ( not ( = ?auto_19762 ?auto_19757 ) ) ( not ( = ?auto_19760 ?auto_19762 ) ) ( not ( = ?auto_19761 ?auto_19762 ) ) ( not ( = ?auto_19759 ?auto_19762 ) ) ( not ( = ?auto_19771 ?auto_19762 ) ) ( not ( = ?auto_19770 ?auto_19762 ) ) ( not ( = ?auto_19758 ?auto_19762 ) ) ( not ( = ?auto_19763 ?auto_19762 ) ) ( not ( = ?auto_19767 ?auto_19762 ) ) ( AVAILABLE ?auto_19772 ) ( TRUCK-AT ?auto_19776 ?auto_19775 ) ( LIFTING ?auto_19777 ?auto_19757 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19759 ?auto_19760 ?auto_19761 )
      ( MAKE-4CRATE-VERIFY ?auto_19757 ?auto_19758 ?auto_19759 ?auto_19760 ?auto_19761 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19778 - SURFACE
      ?auto_19779 - SURFACE
      ?auto_19780 - SURFACE
      ?auto_19781 - SURFACE
      ?auto_19782 - SURFACE
      ?auto_19783 - SURFACE
    )
    :vars
    (
      ?auto_19793 - HOIST
      ?auto_19795 - PLACE
      ?auto_19789 - PLACE
      ?auto_19786 - HOIST
      ?auto_19792 - SURFACE
      ?auto_19796 - PLACE
      ?auto_19798 - HOIST
      ?auto_19791 - SURFACE
      ?auto_19794 - PLACE
      ?auto_19790 - HOIST
      ?auto_19784 - SURFACE
      ?auto_19785 - PLACE
      ?auto_19787 - HOIST
      ?auto_19788 - SURFACE
      ?auto_19797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19793 ?auto_19795 ) ( IS-CRATE ?auto_19783 ) ( not ( = ?auto_19782 ?auto_19783 ) ) ( not ( = ?auto_19781 ?auto_19782 ) ) ( not ( = ?auto_19781 ?auto_19783 ) ) ( not ( = ?auto_19789 ?auto_19795 ) ) ( HOIST-AT ?auto_19786 ?auto_19789 ) ( not ( = ?auto_19793 ?auto_19786 ) ) ( AVAILABLE ?auto_19786 ) ( SURFACE-AT ?auto_19783 ?auto_19789 ) ( ON ?auto_19783 ?auto_19792 ) ( CLEAR ?auto_19783 ) ( not ( = ?auto_19782 ?auto_19792 ) ) ( not ( = ?auto_19783 ?auto_19792 ) ) ( not ( = ?auto_19781 ?auto_19792 ) ) ( IS-CRATE ?auto_19782 ) ( not ( = ?auto_19796 ?auto_19795 ) ) ( not ( = ?auto_19789 ?auto_19796 ) ) ( HOIST-AT ?auto_19798 ?auto_19796 ) ( not ( = ?auto_19793 ?auto_19798 ) ) ( not ( = ?auto_19786 ?auto_19798 ) ) ( SURFACE-AT ?auto_19782 ?auto_19796 ) ( ON ?auto_19782 ?auto_19791 ) ( CLEAR ?auto_19782 ) ( not ( = ?auto_19782 ?auto_19791 ) ) ( not ( = ?auto_19783 ?auto_19791 ) ) ( not ( = ?auto_19781 ?auto_19791 ) ) ( not ( = ?auto_19792 ?auto_19791 ) ) ( IS-CRATE ?auto_19781 ) ( not ( = ?auto_19780 ?auto_19781 ) ) ( not ( = ?auto_19782 ?auto_19780 ) ) ( not ( = ?auto_19783 ?auto_19780 ) ) ( not ( = ?auto_19792 ?auto_19780 ) ) ( not ( = ?auto_19791 ?auto_19780 ) ) ( not ( = ?auto_19794 ?auto_19795 ) ) ( not ( = ?auto_19789 ?auto_19794 ) ) ( not ( = ?auto_19796 ?auto_19794 ) ) ( HOIST-AT ?auto_19790 ?auto_19794 ) ( not ( = ?auto_19793 ?auto_19790 ) ) ( not ( = ?auto_19786 ?auto_19790 ) ) ( not ( = ?auto_19798 ?auto_19790 ) ) ( AVAILABLE ?auto_19790 ) ( SURFACE-AT ?auto_19781 ?auto_19794 ) ( ON ?auto_19781 ?auto_19784 ) ( CLEAR ?auto_19781 ) ( not ( = ?auto_19782 ?auto_19784 ) ) ( not ( = ?auto_19783 ?auto_19784 ) ) ( not ( = ?auto_19781 ?auto_19784 ) ) ( not ( = ?auto_19792 ?auto_19784 ) ) ( not ( = ?auto_19791 ?auto_19784 ) ) ( not ( = ?auto_19780 ?auto_19784 ) ) ( IS-CRATE ?auto_19780 ) ( not ( = ?auto_19779 ?auto_19780 ) ) ( not ( = ?auto_19782 ?auto_19779 ) ) ( not ( = ?auto_19783 ?auto_19779 ) ) ( not ( = ?auto_19781 ?auto_19779 ) ) ( not ( = ?auto_19792 ?auto_19779 ) ) ( not ( = ?auto_19791 ?auto_19779 ) ) ( not ( = ?auto_19784 ?auto_19779 ) ) ( not ( = ?auto_19785 ?auto_19795 ) ) ( not ( = ?auto_19789 ?auto_19785 ) ) ( not ( = ?auto_19796 ?auto_19785 ) ) ( not ( = ?auto_19794 ?auto_19785 ) ) ( HOIST-AT ?auto_19787 ?auto_19785 ) ( not ( = ?auto_19793 ?auto_19787 ) ) ( not ( = ?auto_19786 ?auto_19787 ) ) ( not ( = ?auto_19798 ?auto_19787 ) ) ( not ( = ?auto_19790 ?auto_19787 ) ) ( AVAILABLE ?auto_19787 ) ( SURFACE-AT ?auto_19780 ?auto_19785 ) ( ON ?auto_19780 ?auto_19788 ) ( CLEAR ?auto_19780 ) ( not ( = ?auto_19782 ?auto_19788 ) ) ( not ( = ?auto_19783 ?auto_19788 ) ) ( not ( = ?auto_19781 ?auto_19788 ) ) ( not ( = ?auto_19792 ?auto_19788 ) ) ( not ( = ?auto_19791 ?auto_19788 ) ) ( not ( = ?auto_19780 ?auto_19788 ) ) ( not ( = ?auto_19784 ?auto_19788 ) ) ( not ( = ?auto_19779 ?auto_19788 ) ) ( SURFACE-AT ?auto_19778 ?auto_19795 ) ( CLEAR ?auto_19778 ) ( IS-CRATE ?auto_19779 ) ( not ( = ?auto_19778 ?auto_19779 ) ) ( not ( = ?auto_19782 ?auto_19778 ) ) ( not ( = ?auto_19783 ?auto_19778 ) ) ( not ( = ?auto_19781 ?auto_19778 ) ) ( not ( = ?auto_19792 ?auto_19778 ) ) ( not ( = ?auto_19791 ?auto_19778 ) ) ( not ( = ?auto_19780 ?auto_19778 ) ) ( not ( = ?auto_19784 ?auto_19778 ) ) ( not ( = ?auto_19788 ?auto_19778 ) ) ( AVAILABLE ?auto_19793 ) ( TRUCK-AT ?auto_19797 ?auto_19796 ) ( LIFTING ?auto_19798 ?auto_19779 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19781 ?auto_19782 ?auto_19783 )
      ( MAKE-5CRATE-VERIFY ?auto_19778 ?auto_19779 ?auto_19780 ?auto_19781 ?auto_19782 ?auto_19783 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19799 - SURFACE
      ?auto_19800 - SURFACE
    )
    :vars
    (
      ?auto_19812 - HOIST
      ?auto_19815 - PLACE
      ?auto_19818 - SURFACE
      ?auto_19808 - PLACE
      ?auto_19805 - HOIST
      ?auto_19811 - SURFACE
      ?auto_19816 - PLACE
      ?auto_19819 - HOIST
      ?auto_19810 - SURFACE
      ?auto_19801 - SURFACE
      ?auto_19813 - PLACE
      ?auto_19809 - HOIST
      ?auto_19803 - SURFACE
      ?auto_19814 - SURFACE
      ?auto_19804 - PLACE
      ?auto_19806 - HOIST
      ?auto_19807 - SURFACE
      ?auto_19802 - SURFACE
      ?auto_19817 - TRUCK
      ?auto_19820 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19812 ?auto_19815 ) ( IS-CRATE ?auto_19800 ) ( not ( = ?auto_19799 ?auto_19800 ) ) ( not ( = ?auto_19818 ?auto_19799 ) ) ( not ( = ?auto_19818 ?auto_19800 ) ) ( not ( = ?auto_19808 ?auto_19815 ) ) ( HOIST-AT ?auto_19805 ?auto_19808 ) ( not ( = ?auto_19812 ?auto_19805 ) ) ( AVAILABLE ?auto_19805 ) ( SURFACE-AT ?auto_19800 ?auto_19808 ) ( ON ?auto_19800 ?auto_19811 ) ( CLEAR ?auto_19800 ) ( not ( = ?auto_19799 ?auto_19811 ) ) ( not ( = ?auto_19800 ?auto_19811 ) ) ( not ( = ?auto_19818 ?auto_19811 ) ) ( IS-CRATE ?auto_19799 ) ( not ( = ?auto_19816 ?auto_19815 ) ) ( not ( = ?auto_19808 ?auto_19816 ) ) ( HOIST-AT ?auto_19819 ?auto_19816 ) ( not ( = ?auto_19812 ?auto_19819 ) ) ( not ( = ?auto_19805 ?auto_19819 ) ) ( SURFACE-AT ?auto_19799 ?auto_19816 ) ( ON ?auto_19799 ?auto_19810 ) ( CLEAR ?auto_19799 ) ( not ( = ?auto_19799 ?auto_19810 ) ) ( not ( = ?auto_19800 ?auto_19810 ) ) ( not ( = ?auto_19818 ?auto_19810 ) ) ( not ( = ?auto_19811 ?auto_19810 ) ) ( IS-CRATE ?auto_19818 ) ( not ( = ?auto_19801 ?auto_19818 ) ) ( not ( = ?auto_19799 ?auto_19801 ) ) ( not ( = ?auto_19800 ?auto_19801 ) ) ( not ( = ?auto_19811 ?auto_19801 ) ) ( not ( = ?auto_19810 ?auto_19801 ) ) ( not ( = ?auto_19813 ?auto_19815 ) ) ( not ( = ?auto_19808 ?auto_19813 ) ) ( not ( = ?auto_19816 ?auto_19813 ) ) ( HOIST-AT ?auto_19809 ?auto_19813 ) ( not ( = ?auto_19812 ?auto_19809 ) ) ( not ( = ?auto_19805 ?auto_19809 ) ) ( not ( = ?auto_19819 ?auto_19809 ) ) ( AVAILABLE ?auto_19809 ) ( SURFACE-AT ?auto_19818 ?auto_19813 ) ( ON ?auto_19818 ?auto_19803 ) ( CLEAR ?auto_19818 ) ( not ( = ?auto_19799 ?auto_19803 ) ) ( not ( = ?auto_19800 ?auto_19803 ) ) ( not ( = ?auto_19818 ?auto_19803 ) ) ( not ( = ?auto_19811 ?auto_19803 ) ) ( not ( = ?auto_19810 ?auto_19803 ) ) ( not ( = ?auto_19801 ?auto_19803 ) ) ( IS-CRATE ?auto_19801 ) ( not ( = ?auto_19814 ?auto_19801 ) ) ( not ( = ?auto_19799 ?auto_19814 ) ) ( not ( = ?auto_19800 ?auto_19814 ) ) ( not ( = ?auto_19818 ?auto_19814 ) ) ( not ( = ?auto_19811 ?auto_19814 ) ) ( not ( = ?auto_19810 ?auto_19814 ) ) ( not ( = ?auto_19803 ?auto_19814 ) ) ( not ( = ?auto_19804 ?auto_19815 ) ) ( not ( = ?auto_19808 ?auto_19804 ) ) ( not ( = ?auto_19816 ?auto_19804 ) ) ( not ( = ?auto_19813 ?auto_19804 ) ) ( HOIST-AT ?auto_19806 ?auto_19804 ) ( not ( = ?auto_19812 ?auto_19806 ) ) ( not ( = ?auto_19805 ?auto_19806 ) ) ( not ( = ?auto_19819 ?auto_19806 ) ) ( not ( = ?auto_19809 ?auto_19806 ) ) ( AVAILABLE ?auto_19806 ) ( SURFACE-AT ?auto_19801 ?auto_19804 ) ( ON ?auto_19801 ?auto_19807 ) ( CLEAR ?auto_19801 ) ( not ( = ?auto_19799 ?auto_19807 ) ) ( not ( = ?auto_19800 ?auto_19807 ) ) ( not ( = ?auto_19818 ?auto_19807 ) ) ( not ( = ?auto_19811 ?auto_19807 ) ) ( not ( = ?auto_19810 ?auto_19807 ) ) ( not ( = ?auto_19801 ?auto_19807 ) ) ( not ( = ?auto_19803 ?auto_19807 ) ) ( not ( = ?auto_19814 ?auto_19807 ) ) ( SURFACE-AT ?auto_19802 ?auto_19815 ) ( CLEAR ?auto_19802 ) ( IS-CRATE ?auto_19814 ) ( not ( = ?auto_19802 ?auto_19814 ) ) ( not ( = ?auto_19799 ?auto_19802 ) ) ( not ( = ?auto_19800 ?auto_19802 ) ) ( not ( = ?auto_19818 ?auto_19802 ) ) ( not ( = ?auto_19811 ?auto_19802 ) ) ( not ( = ?auto_19810 ?auto_19802 ) ) ( not ( = ?auto_19801 ?auto_19802 ) ) ( not ( = ?auto_19803 ?auto_19802 ) ) ( not ( = ?auto_19807 ?auto_19802 ) ) ( AVAILABLE ?auto_19812 ) ( TRUCK-AT ?auto_19817 ?auto_19816 ) ( AVAILABLE ?auto_19819 ) ( SURFACE-AT ?auto_19814 ?auto_19816 ) ( ON ?auto_19814 ?auto_19820 ) ( CLEAR ?auto_19814 ) ( not ( = ?auto_19799 ?auto_19820 ) ) ( not ( = ?auto_19800 ?auto_19820 ) ) ( not ( = ?auto_19818 ?auto_19820 ) ) ( not ( = ?auto_19811 ?auto_19820 ) ) ( not ( = ?auto_19810 ?auto_19820 ) ) ( not ( = ?auto_19801 ?auto_19820 ) ) ( not ( = ?auto_19803 ?auto_19820 ) ) ( not ( = ?auto_19814 ?auto_19820 ) ) ( not ( = ?auto_19807 ?auto_19820 ) ) ( not ( = ?auto_19802 ?auto_19820 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19819 ?auto_19814 ?auto_19820 ?auto_19816 )
      ( MAKE-2CRATE ?auto_19818 ?auto_19799 ?auto_19800 )
      ( MAKE-1CRATE-VERIFY ?auto_19799 ?auto_19800 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19821 - SURFACE
      ?auto_19822 - SURFACE
      ?auto_19823 - SURFACE
    )
    :vars
    (
      ?auto_19833 - HOIST
      ?auto_19838 - PLACE
      ?auto_19825 - PLACE
      ?auto_19832 - HOIST
      ?auto_19839 - SURFACE
      ?auto_19840 - PLACE
      ?auto_19837 - HOIST
      ?auto_19834 - SURFACE
      ?auto_19841 - SURFACE
      ?auto_19824 - PLACE
      ?auto_19828 - HOIST
      ?auto_19835 - SURFACE
      ?auto_19836 - SURFACE
      ?auto_19827 - PLACE
      ?auto_19826 - HOIST
      ?auto_19829 - SURFACE
      ?auto_19830 - SURFACE
      ?auto_19831 - TRUCK
      ?auto_19842 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19833 ?auto_19838 ) ( IS-CRATE ?auto_19823 ) ( not ( = ?auto_19822 ?auto_19823 ) ) ( not ( = ?auto_19821 ?auto_19822 ) ) ( not ( = ?auto_19821 ?auto_19823 ) ) ( not ( = ?auto_19825 ?auto_19838 ) ) ( HOIST-AT ?auto_19832 ?auto_19825 ) ( not ( = ?auto_19833 ?auto_19832 ) ) ( AVAILABLE ?auto_19832 ) ( SURFACE-AT ?auto_19823 ?auto_19825 ) ( ON ?auto_19823 ?auto_19839 ) ( CLEAR ?auto_19823 ) ( not ( = ?auto_19822 ?auto_19839 ) ) ( not ( = ?auto_19823 ?auto_19839 ) ) ( not ( = ?auto_19821 ?auto_19839 ) ) ( IS-CRATE ?auto_19822 ) ( not ( = ?auto_19840 ?auto_19838 ) ) ( not ( = ?auto_19825 ?auto_19840 ) ) ( HOIST-AT ?auto_19837 ?auto_19840 ) ( not ( = ?auto_19833 ?auto_19837 ) ) ( not ( = ?auto_19832 ?auto_19837 ) ) ( SURFACE-AT ?auto_19822 ?auto_19840 ) ( ON ?auto_19822 ?auto_19834 ) ( CLEAR ?auto_19822 ) ( not ( = ?auto_19822 ?auto_19834 ) ) ( not ( = ?auto_19823 ?auto_19834 ) ) ( not ( = ?auto_19821 ?auto_19834 ) ) ( not ( = ?auto_19839 ?auto_19834 ) ) ( IS-CRATE ?auto_19821 ) ( not ( = ?auto_19841 ?auto_19821 ) ) ( not ( = ?auto_19822 ?auto_19841 ) ) ( not ( = ?auto_19823 ?auto_19841 ) ) ( not ( = ?auto_19839 ?auto_19841 ) ) ( not ( = ?auto_19834 ?auto_19841 ) ) ( not ( = ?auto_19824 ?auto_19838 ) ) ( not ( = ?auto_19825 ?auto_19824 ) ) ( not ( = ?auto_19840 ?auto_19824 ) ) ( HOIST-AT ?auto_19828 ?auto_19824 ) ( not ( = ?auto_19833 ?auto_19828 ) ) ( not ( = ?auto_19832 ?auto_19828 ) ) ( not ( = ?auto_19837 ?auto_19828 ) ) ( AVAILABLE ?auto_19828 ) ( SURFACE-AT ?auto_19821 ?auto_19824 ) ( ON ?auto_19821 ?auto_19835 ) ( CLEAR ?auto_19821 ) ( not ( = ?auto_19822 ?auto_19835 ) ) ( not ( = ?auto_19823 ?auto_19835 ) ) ( not ( = ?auto_19821 ?auto_19835 ) ) ( not ( = ?auto_19839 ?auto_19835 ) ) ( not ( = ?auto_19834 ?auto_19835 ) ) ( not ( = ?auto_19841 ?auto_19835 ) ) ( IS-CRATE ?auto_19841 ) ( not ( = ?auto_19836 ?auto_19841 ) ) ( not ( = ?auto_19822 ?auto_19836 ) ) ( not ( = ?auto_19823 ?auto_19836 ) ) ( not ( = ?auto_19821 ?auto_19836 ) ) ( not ( = ?auto_19839 ?auto_19836 ) ) ( not ( = ?auto_19834 ?auto_19836 ) ) ( not ( = ?auto_19835 ?auto_19836 ) ) ( not ( = ?auto_19827 ?auto_19838 ) ) ( not ( = ?auto_19825 ?auto_19827 ) ) ( not ( = ?auto_19840 ?auto_19827 ) ) ( not ( = ?auto_19824 ?auto_19827 ) ) ( HOIST-AT ?auto_19826 ?auto_19827 ) ( not ( = ?auto_19833 ?auto_19826 ) ) ( not ( = ?auto_19832 ?auto_19826 ) ) ( not ( = ?auto_19837 ?auto_19826 ) ) ( not ( = ?auto_19828 ?auto_19826 ) ) ( AVAILABLE ?auto_19826 ) ( SURFACE-AT ?auto_19841 ?auto_19827 ) ( ON ?auto_19841 ?auto_19829 ) ( CLEAR ?auto_19841 ) ( not ( = ?auto_19822 ?auto_19829 ) ) ( not ( = ?auto_19823 ?auto_19829 ) ) ( not ( = ?auto_19821 ?auto_19829 ) ) ( not ( = ?auto_19839 ?auto_19829 ) ) ( not ( = ?auto_19834 ?auto_19829 ) ) ( not ( = ?auto_19841 ?auto_19829 ) ) ( not ( = ?auto_19835 ?auto_19829 ) ) ( not ( = ?auto_19836 ?auto_19829 ) ) ( SURFACE-AT ?auto_19830 ?auto_19838 ) ( CLEAR ?auto_19830 ) ( IS-CRATE ?auto_19836 ) ( not ( = ?auto_19830 ?auto_19836 ) ) ( not ( = ?auto_19822 ?auto_19830 ) ) ( not ( = ?auto_19823 ?auto_19830 ) ) ( not ( = ?auto_19821 ?auto_19830 ) ) ( not ( = ?auto_19839 ?auto_19830 ) ) ( not ( = ?auto_19834 ?auto_19830 ) ) ( not ( = ?auto_19841 ?auto_19830 ) ) ( not ( = ?auto_19835 ?auto_19830 ) ) ( not ( = ?auto_19829 ?auto_19830 ) ) ( AVAILABLE ?auto_19833 ) ( TRUCK-AT ?auto_19831 ?auto_19840 ) ( AVAILABLE ?auto_19837 ) ( SURFACE-AT ?auto_19836 ?auto_19840 ) ( ON ?auto_19836 ?auto_19842 ) ( CLEAR ?auto_19836 ) ( not ( = ?auto_19822 ?auto_19842 ) ) ( not ( = ?auto_19823 ?auto_19842 ) ) ( not ( = ?auto_19821 ?auto_19842 ) ) ( not ( = ?auto_19839 ?auto_19842 ) ) ( not ( = ?auto_19834 ?auto_19842 ) ) ( not ( = ?auto_19841 ?auto_19842 ) ) ( not ( = ?auto_19835 ?auto_19842 ) ) ( not ( = ?auto_19836 ?auto_19842 ) ) ( not ( = ?auto_19829 ?auto_19842 ) ) ( not ( = ?auto_19830 ?auto_19842 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19822 ?auto_19823 )
      ( MAKE-2CRATE-VERIFY ?auto_19821 ?auto_19822 ?auto_19823 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19843 - SURFACE
      ?auto_19844 - SURFACE
      ?auto_19845 - SURFACE
      ?auto_19846 - SURFACE
    )
    :vars
    (
      ?auto_19860 - HOIST
      ?auto_19863 - PLACE
      ?auto_19855 - PLACE
      ?auto_19859 - HOIST
      ?auto_19849 - SURFACE
      ?auto_19856 - PLACE
      ?auto_19857 - HOIST
      ?auto_19854 - SURFACE
      ?auto_19847 - PLACE
      ?auto_19851 - HOIST
      ?auto_19853 - SURFACE
      ?auto_19858 - SURFACE
      ?auto_19862 - PLACE
      ?auto_19852 - HOIST
      ?auto_19848 - SURFACE
      ?auto_19861 - SURFACE
      ?auto_19864 - TRUCK
      ?auto_19850 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19860 ?auto_19863 ) ( IS-CRATE ?auto_19846 ) ( not ( = ?auto_19845 ?auto_19846 ) ) ( not ( = ?auto_19844 ?auto_19845 ) ) ( not ( = ?auto_19844 ?auto_19846 ) ) ( not ( = ?auto_19855 ?auto_19863 ) ) ( HOIST-AT ?auto_19859 ?auto_19855 ) ( not ( = ?auto_19860 ?auto_19859 ) ) ( AVAILABLE ?auto_19859 ) ( SURFACE-AT ?auto_19846 ?auto_19855 ) ( ON ?auto_19846 ?auto_19849 ) ( CLEAR ?auto_19846 ) ( not ( = ?auto_19845 ?auto_19849 ) ) ( not ( = ?auto_19846 ?auto_19849 ) ) ( not ( = ?auto_19844 ?auto_19849 ) ) ( IS-CRATE ?auto_19845 ) ( not ( = ?auto_19856 ?auto_19863 ) ) ( not ( = ?auto_19855 ?auto_19856 ) ) ( HOIST-AT ?auto_19857 ?auto_19856 ) ( not ( = ?auto_19860 ?auto_19857 ) ) ( not ( = ?auto_19859 ?auto_19857 ) ) ( SURFACE-AT ?auto_19845 ?auto_19856 ) ( ON ?auto_19845 ?auto_19854 ) ( CLEAR ?auto_19845 ) ( not ( = ?auto_19845 ?auto_19854 ) ) ( not ( = ?auto_19846 ?auto_19854 ) ) ( not ( = ?auto_19844 ?auto_19854 ) ) ( not ( = ?auto_19849 ?auto_19854 ) ) ( IS-CRATE ?auto_19844 ) ( not ( = ?auto_19843 ?auto_19844 ) ) ( not ( = ?auto_19845 ?auto_19843 ) ) ( not ( = ?auto_19846 ?auto_19843 ) ) ( not ( = ?auto_19849 ?auto_19843 ) ) ( not ( = ?auto_19854 ?auto_19843 ) ) ( not ( = ?auto_19847 ?auto_19863 ) ) ( not ( = ?auto_19855 ?auto_19847 ) ) ( not ( = ?auto_19856 ?auto_19847 ) ) ( HOIST-AT ?auto_19851 ?auto_19847 ) ( not ( = ?auto_19860 ?auto_19851 ) ) ( not ( = ?auto_19859 ?auto_19851 ) ) ( not ( = ?auto_19857 ?auto_19851 ) ) ( AVAILABLE ?auto_19851 ) ( SURFACE-AT ?auto_19844 ?auto_19847 ) ( ON ?auto_19844 ?auto_19853 ) ( CLEAR ?auto_19844 ) ( not ( = ?auto_19845 ?auto_19853 ) ) ( not ( = ?auto_19846 ?auto_19853 ) ) ( not ( = ?auto_19844 ?auto_19853 ) ) ( not ( = ?auto_19849 ?auto_19853 ) ) ( not ( = ?auto_19854 ?auto_19853 ) ) ( not ( = ?auto_19843 ?auto_19853 ) ) ( IS-CRATE ?auto_19843 ) ( not ( = ?auto_19858 ?auto_19843 ) ) ( not ( = ?auto_19845 ?auto_19858 ) ) ( not ( = ?auto_19846 ?auto_19858 ) ) ( not ( = ?auto_19844 ?auto_19858 ) ) ( not ( = ?auto_19849 ?auto_19858 ) ) ( not ( = ?auto_19854 ?auto_19858 ) ) ( not ( = ?auto_19853 ?auto_19858 ) ) ( not ( = ?auto_19862 ?auto_19863 ) ) ( not ( = ?auto_19855 ?auto_19862 ) ) ( not ( = ?auto_19856 ?auto_19862 ) ) ( not ( = ?auto_19847 ?auto_19862 ) ) ( HOIST-AT ?auto_19852 ?auto_19862 ) ( not ( = ?auto_19860 ?auto_19852 ) ) ( not ( = ?auto_19859 ?auto_19852 ) ) ( not ( = ?auto_19857 ?auto_19852 ) ) ( not ( = ?auto_19851 ?auto_19852 ) ) ( AVAILABLE ?auto_19852 ) ( SURFACE-AT ?auto_19843 ?auto_19862 ) ( ON ?auto_19843 ?auto_19848 ) ( CLEAR ?auto_19843 ) ( not ( = ?auto_19845 ?auto_19848 ) ) ( not ( = ?auto_19846 ?auto_19848 ) ) ( not ( = ?auto_19844 ?auto_19848 ) ) ( not ( = ?auto_19849 ?auto_19848 ) ) ( not ( = ?auto_19854 ?auto_19848 ) ) ( not ( = ?auto_19843 ?auto_19848 ) ) ( not ( = ?auto_19853 ?auto_19848 ) ) ( not ( = ?auto_19858 ?auto_19848 ) ) ( SURFACE-AT ?auto_19861 ?auto_19863 ) ( CLEAR ?auto_19861 ) ( IS-CRATE ?auto_19858 ) ( not ( = ?auto_19861 ?auto_19858 ) ) ( not ( = ?auto_19845 ?auto_19861 ) ) ( not ( = ?auto_19846 ?auto_19861 ) ) ( not ( = ?auto_19844 ?auto_19861 ) ) ( not ( = ?auto_19849 ?auto_19861 ) ) ( not ( = ?auto_19854 ?auto_19861 ) ) ( not ( = ?auto_19843 ?auto_19861 ) ) ( not ( = ?auto_19853 ?auto_19861 ) ) ( not ( = ?auto_19848 ?auto_19861 ) ) ( AVAILABLE ?auto_19860 ) ( TRUCK-AT ?auto_19864 ?auto_19856 ) ( AVAILABLE ?auto_19857 ) ( SURFACE-AT ?auto_19858 ?auto_19856 ) ( ON ?auto_19858 ?auto_19850 ) ( CLEAR ?auto_19858 ) ( not ( = ?auto_19845 ?auto_19850 ) ) ( not ( = ?auto_19846 ?auto_19850 ) ) ( not ( = ?auto_19844 ?auto_19850 ) ) ( not ( = ?auto_19849 ?auto_19850 ) ) ( not ( = ?auto_19854 ?auto_19850 ) ) ( not ( = ?auto_19843 ?auto_19850 ) ) ( not ( = ?auto_19853 ?auto_19850 ) ) ( not ( = ?auto_19858 ?auto_19850 ) ) ( not ( = ?auto_19848 ?auto_19850 ) ) ( not ( = ?auto_19861 ?auto_19850 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19844 ?auto_19845 ?auto_19846 )
      ( MAKE-3CRATE-VERIFY ?auto_19843 ?auto_19844 ?auto_19845 ?auto_19846 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19865 - SURFACE
      ?auto_19866 - SURFACE
      ?auto_19867 - SURFACE
      ?auto_19868 - SURFACE
      ?auto_19869 - SURFACE
    )
    :vars
    (
      ?auto_19882 - HOIST
      ?auto_19885 - PLACE
      ?auto_19878 - PLACE
      ?auto_19881 - HOIST
      ?auto_19872 - SURFACE
      ?auto_19879 - PLACE
      ?auto_19880 - HOIST
      ?auto_19877 - SURFACE
      ?auto_19870 - PLACE
      ?auto_19874 - HOIST
      ?auto_19876 - SURFACE
      ?auto_19884 - PLACE
      ?auto_19875 - HOIST
      ?auto_19871 - SURFACE
      ?auto_19883 - SURFACE
      ?auto_19886 - TRUCK
      ?auto_19873 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19882 ?auto_19885 ) ( IS-CRATE ?auto_19869 ) ( not ( = ?auto_19868 ?auto_19869 ) ) ( not ( = ?auto_19867 ?auto_19868 ) ) ( not ( = ?auto_19867 ?auto_19869 ) ) ( not ( = ?auto_19878 ?auto_19885 ) ) ( HOIST-AT ?auto_19881 ?auto_19878 ) ( not ( = ?auto_19882 ?auto_19881 ) ) ( AVAILABLE ?auto_19881 ) ( SURFACE-AT ?auto_19869 ?auto_19878 ) ( ON ?auto_19869 ?auto_19872 ) ( CLEAR ?auto_19869 ) ( not ( = ?auto_19868 ?auto_19872 ) ) ( not ( = ?auto_19869 ?auto_19872 ) ) ( not ( = ?auto_19867 ?auto_19872 ) ) ( IS-CRATE ?auto_19868 ) ( not ( = ?auto_19879 ?auto_19885 ) ) ( not ( = ?auto_19878 ?auto_19879 ) ) ( HOIST-AT ?auto_19880 ?auto_19879 ) ( not ( = ?auto_19882 ?auto_19880 ) ) ( not ( = ?auto_19881 ?auto_19880 ) ) ( SURFACE-AT ?auto_19868 ?auto_19879 ) ( ON ?auto_19868 ?auto_19877 ) ( CLEAR ?auto_19868 ) ( not ( = ?auto_19868 ?auto_19877 ) ) ( not ( = ?auto_19869 ?auto_19877 ) ) ( not ( = ?auto_19867 ?auto_19877 ) ) ( not ( = ?auto_19872 ?auto_19877 ) ) ( IS-CRATE ?auto_19867 ) ( not ( = ?auto_19866 ?auto_19867 ) ) ( not ( = ?auto_19868 ?auto_19866 ) ) ( not ( = ?auto_19869 ?auto_19866 ) ) ( not ( = ?auto_19872 ?auto_19866 ) ) ( not ( = ?auto_19877 ?auto_19866 ) ) ( not ( = ?auto_19870 ?auto_19885 ) ) ( not ( = ?auto_19878 ?auto_19870 ) ) ( not ( = ?auto_19879 ?auto_19870 ) ) ( HOIST-AT ?auto_19874 ?auto_19870 ) ( not ( = ?auto_19882 ?auto_19874 ) ) ( not ( = ?auto_19881 ?auto_19874 ) ) ( not ( = ?auto_19880 ?auto_19874 ) ) ( AVAILABLE ?auto_19874 ) ( SURFACE-AT ?auto_19867 ?auto_19870 ) ( ON ?auto_19867 ?auto_19876 ) ( CLEAR ?auto_19867 ) ( not ( = ?auto_19868 ?auto_19876 ) ) ( not ( = ?auto_19869 ?auto_19876 ) ) ( not ( = ?auto_19867 ?auto_19876 ) ) ( not ( = ?auto_19872 ?auto_19876 ) ) ( not ( = ?auto_19877 ?auto_19876 ) ) ( not ( = ?auto_19866 ?auto_19876 ) ) ( IS-CRATE ?auto_19866 ) ( not ( = ?auto_19865 ?auto_19866 ) ) ( not ( = ?auto_19868 ?auto_19865 ) ) ( not ( = ?auto_19869 ?auto_19865 ) ) ( not ( = ?auto_19867 ?auto_19865 ) ) ( not ( = ?auto_19872 ?auto_19865 ) ) ( not ( = ?auto_19877 ?auto_19865 ) ) ( not ( = ?auto_19876 ?auto_19865 ) ) ( not ( = ?auto_19884 ?auto_19885 ) ) ( not ( = ?auto_19878 ?auto_19884 ) ) ( not ( = ?auto_19879 ?auto_19884 ) ) ( not ( = ?auto_19870 ?auto_19884 ) ) ( HOIST-AT ?auto_19875 ?auto_19884 ) ( not ( = ?auto_19882 ?auto_19875 ) ) ( not ( = ?auto_19881 ?auto_19875 ) ) ( not ( = ?auto_19880 ?auto_19875 ) ) ( not ( = ?auto_19874 ?auto_19875 ) ) ( AVAILABLE ?auto_19875 ) ( SURFACE-AT ?auto_19866 ?auto_19884 ) ( ON ?auto_19866 ?auto_19871 ) ( CLEAR ?auto_19866 ) ( not ( = ?auto_19868 ?auto_19871 ) ) ( not ( = ?auto_19869 ?auto_19871 ) ) ( not ( = ?auto_19867 ?auto_19871 ) ) ( not ( = ?auto_19872 ?auto_19871 ) ) ( not ( = ?auto_19877 ?auto_19871 ) ) ( not ( = ?auto_19866 ?auto_19871 ) ) ( not ( = ?auto_19876 ?auto_19871 ) ) ( not ( = ?auto_19865 ?auto_19871 ) ) ( SURFACE-AT ?auto_19883 ?auto_19885 ) ( CLEAR ?auto_19883 ) ( IS-CRATE ?auto_19865 ) ( not ( = ?auto_19883 ?auto_19865 ) ) ( not ( = ?auto_19868 ?auto_19883 ) ) ( not ( = ?auto_19869 ?auto_19883 ) ) ( not ( = ?auto_19867 ?auto_19883 ) ) ( not ( = ?auto_19872 ?auto_19883 ) ) ( not ( = ?auto_19877 ?auto_19883 ) ) ( not ( = ?auto_19866 ?auto_19883 ) ) ( not ( = ?auto_19876 ?auto_19883 ) ) ( not ( = ?auto_19871 ?auto_19883 ) ) ( AVAILABLE ?auto_19882 ) ( TRUCK-AT ?auto_19886 ?auto_19879 ) ( AVAILABLE ?auto_19880 ) ( SURFACE-AT ?auto_19865 ?auto_19879 ) ( ON ?auto_19865 ?auto_19873 ) ( CLEAR ?auto_19865 ) ( not ( = ?auto_19868 ?auto_19873 ) ) ( not ( = ?auto_19869 ?auto_19873 ) ) ( not ( = ?auto_19867 ?auto_19873 ) ) ( not ( = ?auto_19872 ?auto_19873 ) ) ( not ( = ?auto_19877 ?auto_19873 ) ) ( not ( = ?auto_19866 ?auto_19873 ) ) ( not ( = ?auto_19876 ?auto_19873 ) ) ( not ( = ?auto_19865 ?auto_19873 ) ) ( not ( = ?auto_19871 ?auto_19873 ) ) ( not ( = ?auto_19883 ?auto_19873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19867 ?auto_19868 ?auto_19869 )
      ( MAKE-4CRATE-VERIFY ?auto_19865 ?auto_19866 ?auto_19867 ?auto_19868 ?auto_19869 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19887 - SURFACE
      ?auto_19888 - SURFACE
      ?auto_19889 - SURFACE
      ?auto_19890 - SURFACE
      ?auto_19891 - SURFACE
      ?auto_19892 - SURFACE
    )
    :vars
    (
      ?auto_19905 - HOIST
      ?auto_19907 - PLACE
      ?auto_19901 - PLACE
      ?auto_19904 - HOIST
      ?auto_19895 - SURFACE
      ?auto_19902 - PLACE
      ?auto_19903 - HOIST
      ?auto_19900 - SURFACE
      ?auto_19893 - PLACE
      ?auto_19897 - HOIST
      ?auto_19899 - SURFACE
      ?auto_19906 - PLACE
      ?auto_19898 - HOIST
      ?auto_19894 - SURFACE
      ?auto_19908 - TRUCK
      ?auto_19896 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19905 ?auto_19907 ) ( IS-CRATE ?auto_19892 ) ( not ( = ?auto_19891 ?auto_19892 ) ) ( not ( = ?auto_19890 ?auto_19891 ) ) ( not ( = ?auto_19890 ?auto_19892 ) ) ( not ( = ?auto_19901 ?auto_19907 ) ) ( HOIST-AT ?auto_19904 ?auto_19901 ) ( not ( = ?auto_19905 ?auto_19904 ) ) ( AVAILABLE ?auto_19904 ) ( SURFACE-AT ?auto_19892 ?auto_19901 ) ( ON ?auto_19892 ?auto_19895 ) ( CLEAR ?auto_19892 ) ( not ( = ?auto_19891 ?auto_19895 ) ) ( not ( = ?auto_19892 ?auto_19895 ) ) ( not ( = ?auto_19890 ?auto_19895 ) ) ( IS-CRATE ?auto_19891 ) ( not ( = ?auto_19902 ?auto_19907 ) ) ( not ( = ?auto_19901 ?auto_19902 ) ) ( HOIST-AT ?auto_19903 ?auto_19902 ) ( not ( = ?auto_19905 ?auto_19903 ) ) ( not ( = ?auto_19904 ?auto_19903 ) ) ( SURFACE-AT ?auto_19891 ?auto_19902 ) ( ON ?auto_19891 ?auto_19900 ) ( CLEAR ?auto_19891 ) ( not ( = ?auto_19891 ?auto_19900 ) ) ( not ( = ?auto_19892 ?auto_19900 ) ) ( not ( = ?auto_19890 ?auto_19900 ) ) ( not ( = ?auto_19895 ?auto_19900 ) ) ( IS-CRATE ?auto_19890 ) ( not ( = ?auto_19889 ?auto_19890 ) ) ( not ( = ?auto_19891 ?auto_19889 ) ) ( not ( = ?auto_19892 ?auto_19889 ) ) ( not ( = ?auto_19895 ?auto_19889 ) ) ( not ( = ?auto_19900 ?auto_19889 ) ) ( not ( = ?auto_19893 ?auto_19907 ) ) ( not ( = ?auto_19901 ?auto_19893 ) ) ( not ( = ?auto_19902 ?auto_19893 ) ) ( HOIST-AT ?auto_19897 ?auto_19893 ) ( not ( = ?auto_19905 ?auto_19897 ) ) ( not ( = ?auto_19904 ?auto_19897 ) ) ( not ( = ?auto_19903 ?auto_19897 ) ) ( AVAILABLE ?auto_19897 ) ( SURFACE-AT ?auto_19890 ?auto_19893 ) ( ON ?auto_19890 ?auto_19899 ) ( CLEAR ?auto_19890 ) ( not ( = ?auto_19891 ?auto_19899 ) ) ( not ( = ?auto_19892 ?auto_19899 ) ) ( not ( = ?auto_19890 ?auto_19899 ) ) ( not ( = ?auto_19895 ?auto_19899 ) ) ( not ( = ?auto_19900 ?auto_19899 ) ) ( not ( = ?auto_19889 ?auto_19899 ) ) ( IS-CRATE ?auto_19889 ) ( not ( = ?auto_19888 ?auto_19889 ) ) ( not ( = ?auto_19891 ?auto_19888 ) ) ( not ( = ?auto_19892 ?auto_19888 ) ) ( not ( = ?auto_19890 ?auto_19888 ) ) ( not ( = ?auto_19895 ?auto_19888 ) ) ( not ( = ?auto_19900 ?auto_19888 ) ) ( not ( = ?auto_19899 ?auto_19888 ) ) ( not ( = ?auto_19906 ?auto_19907 ) ) ( not ( = ?auto_19901 ?auto_19906 ) ) ( not ( = ?auto_19902 ?auto_19906 ) ) ( not ( = ?auto_19893 ?auto_19906 ) ) ( HOIST-AT ?auto_19898 ?auto_19906 ) ( not ( = ?auto_19905 ?auto_19898 ) ) ( not ( = ?auto_19904 ?auto_19898 ) ) ( not ( = ?auto_19903 ?auto_19898 ) ) ( not ( = ?auto_19897 ?auto_19898 ) ) ( AVAILABLE ?auto_19898 ) ( SURFACE-AT ?auto_19889 ?auto_19906 ) ( ON ?auto_19889 ?auto_19894 ) ( CLEAR ?auto_19889 ) ( not ( = ?auto_19891 ?auto_19894 ) ) ( not ( = ?auto_19892 ?auto_19894 ) ) ( not ( = ?auto_19890 ?auto_19894 ) ) ( not ( = ?auto_19895 ?auto_19894 ) ) ( not ( = ?auto_19900 ?auto_19894 ) ) ( not ( = ?auto_19889 ?auto_19894 ) ) ( not ( = ?auto_19899 ?auto_19894 ) ) ( not ( = ?auto_19888 ?auto_19894 ) ) ( SURFACE-AT ?auto_19887 ?auto_19907 ) ( CLEAR ?auto_19887 ) ( IS-CRATE ?auto_19888 ) ( not ( = ?auto_19887 ?auto_19888 ) ) ( not ( = ?auto_19891 ?auto_19887 ) ) ( not ( = ?auto_19892 ?auto_19887 ) ) ( not ( = ?auto_19890 ?auto_19887 ) ) ( not ( = ?auto_19895 ?auto_19887 ) ) ( not ( = ?auto_19900 ?auto_19887 ) ) ( not ( = ?auto_19889 ?auto_19887 ) ) ( not ( = ?auto_19899 ?auto_19887 ) ) ( not ( = ?auto_19894 ?auto_19887 ) ) ( AVAILABLE ?auto_19905 ) ( TRUCK-AT ?auto_19908 ?auto_19902 ) ( AVAILABLE ?auto_19903 ) ( SURFACE-AT ?auto_19888 ?auto_19902 ) ( ON ?auto_19888 ?auto_19896 ) ( CLEAR ?auto_19888 ) ( not ( = ?auto_19891 ?auto_19896 ) ) ( not ( = ?auto_19892 ?auto_19896 ) ) ( not ( = ?auto_19890 ?auto_19896 ) ) ( not ( = ?auto_19895 ?auto_19896 ) ) ( not ( = ?auto_19900 ?auto_19896 ) ) ( not ( = ?auto_19889 ?auto_19896 ) ) ( not ( = ?auto_19899 ?auto_19896 ) ) ( not ( = ?auto_19888 ?auto_19896 ) ) ( not ( = ?auto_19894 ?auto_19896 ) ) ( not ( = ?auto_19887 ?auto_19896 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19890 ?auto_19891 ?auto_19892 )
      ( MAKE-5CRATE-VERIFY ?auto_19887 ?auto_19888 ?auto_19889 ?auto_19890 ?auto_19891 ?auto_19892 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19909 - SURFACE
      ?auto_19910 - SURFACE
    )
    :vars
    (
      ?auto_19925 - HOIST
      ?auto_19929 - PLACE
      ?auto_19922 - SURFACE
      ?auto_19919 - PLACE
      ?auto_19924 - HOIST
      ?auto_19913 - SURFACE
      ?auto_19920 - PLACE
      ?auto_19921 - HOIST
      ?auto_19918 - SURFACE
      ?auto_19928 - SURFACE
      ?auto_19911 - PLACE
      ?auto_19915 - HOIST
      ?auto_19917 - SURFACE
      ?auto_19923 - SURFACE
      ?auto_19927 - PLACE
      ?auto_19916 - HOIST
      ?auto_19912 - SURFACE
      ?auto_19926 - SURFACE
      ?auto_19914 - SURFACE
      ?auto_19930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19925 ?auto_19929 ) ( IS-CRATE ?auto_19910 ) ( not ( = ?auto_19909 ?auto_19910 ) ) ( not ( = ?auto_19922 ?auto_19909 ) ) ( not ( = ?auto_19922 ?auto_19910 ) ) ( not ( = ?auto_19919 ?auto_19929 ) ) ( HOIST-AT ?auto_19924 ?auto_19919 ) ( not ( = ?auto_19925 ?auto_19924 ) ) ( AVAILABLE ?auto_19924 ) ( SURFACE-AT ?auto_19910 ?auto_19919 ) ( ON ?auto_19910 ?auto_19913 ) ( CLEAR ?auto_19910 ) ( not ( = ?auto_19909 ?auto_19913 ) ) ( not ( = ?auto_19910 ?auto_19913 ) ) ( not ( = ?auto_19922 ?auto_19913 ) ) ( IS-CRATE ?auto_19909 ) ( not ( = ?auto_19920 ?auto_19929 ) ) ( not ( = ?auto_19919 ?auto_19920 ) ) ( HOIST-AT ?auto_19921 ?auto_19920 ) ( not ( = ?auto_19925 ?auto_19921 ) ) ( not ( = ?auto_19924 ?auto_19921 ) ) ( SURFACE-AT ?auto_19909 ?auto_19920 ) ( ON ?auto_19909 ?auto_19918 ) ( CLEAR ?auto_19909 ) ( not ( = ?auto_19909 ?auto_19918 ) ) ( not ( = ?auto_19910 ?auto_19918 ) ) ( not ( = ?auto_19922 ?auto_19918 ) ) ( not ( = ?auto_19913 ?auto_19918 ) ) ( IS-CRATE ?auto_19922 ) ( not ( = ?auto_19928 ?auto_19922 ) ) ( not ( = ?auto_19909 ?auto_19928 ) ) ( not ( = ?auto_19910 ?auto_19928 ) ) ( not ( = ?auto_19913 ?auto_19928 ) ) ( not ( = ?auto_19918 ?auto_19928 ) ) ( not ( = ?auto_19911 ?auto_19929 ) ) ( not ( = ?auto_19919 ?auto_19911 ) ) ( not ( = ?auto_19920 ?auto_19911 ) ) ( HOIST-AT ?auto_19915 ?auto_19911 ) ( not ( = ?auto_19925 ?auto_19915 ) ) ( not ( = ?auto_19924 ?auto_19915 ) ) ( not ( = ?auto_19921 ?auto_19915 ) ) ( AVAILABLE ?auto_19915 ) ( SURFACE-AT ?auto_19922 ?auto_19911 ) ( ON ?auto_19922 ?auto_19917 ) ( CLEAR ?auto_19922 ) ( not ( = ?auto_19909 ?auto_19917 ) ) ( not ( = ?auto_19910 ?auto_19917 ) ) ( not ( = ?auto_19922 ?auto_19917 ) ) ( not ( = ?auto_19913 ?auto_19917 ) ) ( not ( = ?auto_19918 ?auto_19917 ) ) ( not ( = ?auto_19928 ?auto_19917 ) ) ( IS-CRATE ?auto_19928 ) ( not ( = ?auto_19923 ?auto_19928 ) ) ( not ( = ?auto_19909 ?auto_19923 ) ) ( not ( = ?auto_19910 ?auto_19923 ) ) ( not ( = ?auto_19922 ?auto_19923 ) ) ( not ( = ?auto_19913 ?auto_19923 ) ) ( not ( = ?auto_19918 ?auto_19923 ) ) ( not ( = ?auto_19917 ?auto_19923 ) ) ( not ( = ?auto_19927 ?auto_19929 ) ) ( not ( = ?auto_19919 ?auto_19927 ) ) ( not ( = ?auto_19920 ?auto_19927 ) ) ( not ( = ?auto_19911 ?auto_19927 ) ) ( HOIST-AT ?auto_19916 ?auto_19927 ) ( not ( = ?auto_19925 ?auto_19916 ) ) ( not ( = ?auto_19924 ?auto_19916 ) ) ( not ( = ?auto_19921 ?auto_19916 ) ) ( not ( = ?auto_19915 ?auto_19916 ) ) ( AVAILABLE ?auto_19916 ) ( SURFACE-AT ?auto_19928 ?auto_19927 ) ( ON ?auto_19928 ?auto_19912 ) ( CLEAR ?auto_19928 ) ( not ( = ?auto_19909 ?auto_19912 ) ) ( not ( = ?auto_19910 ?auto_19912 ) ) ( not ( = ?auto_19922 ?auto_19912 ) ) ( not ( = ?auto_19913 ?auto_19912 ) ) ( not ( = ?auto_19918 ?auto_19912 ) ) ( not ( = ?auto_19928 ?auto_19912 ) ) ( not ( = ?auto_19917 ?auto_19912 ) ) ( not ( = ?auto_19923 ?auto_19912 ) ) ( SURFACE-AT ?auto_19926 ?auto_19929 ) ( CLEAR ?auto_19926 ) ( IS-CRATE ?auto_19923 ) ( not ( = ?auto_19926 ?auto_19923 ) ) ( not ( = ?auto_19909 ?auto_19926 ) ) ( not ( = ?auto_19910 ?auto_19926 ) ) ( not ( = ?auto_19922 ?auto_19926 ) ) ( not ( = ?auto_19913 ?auto_19926 ) ) ( not ( = ?auto_19918 ?auto_19926 ) ) ( not ( = ?auto_19928 ?auto_19926 ) ) ( not ( = ?auto_19917 ?auto_19926 ) ) ( not ( = ?auto_19912 ?auto_19926 ) ) ( AVAILABLE ?auto_19925 ) ( AVAILABLE ?auto_19921 ) ( SURFACE-AT ?auto_19923 ?auto_19920 ) ( ON ?auto_19923 ?auto_19914 ) ( CLEAR ?auto_19923 ) ( not ( = ?auto_19909 ?auto_19914 ) ) ( not ( = ?auto_19910 ?auto_19914 ) ) ( not ( = ?auto_19922 ?auto_19914 ) ) ( not ( = ?auto_19913 ?auto_19914 ) ) ( not ( = ?auto_19918 ?auto_19914 ) ) ( not ( = ?auto_19928 ?auto_19914 ) ) ( not ( = ?auto_19917 ?auto_19914 ) ) ( not ( = ?auto_19923 ?auto_19914 ) ) ( not ( = ?auto_19912 ?auto_19914 ) ) ( not ( = ?auto_19926 ?auto_19914 ) ) ( TRUCK-AT ?auto_19930 ?auto_19929 ) )
    :subtasks
    ( ( !DRIVE ?auto_19930 ?auto_19929 ?auto_19920 )
      ( MAKE-2CRATE ?auto_19922 ?auto_19909 ?auto_19910 )
      ( MAKE-1CRATE-VERIFY ?auto_19909 ?auto_19910 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19931 - SURFACE
      ?auto_19932 - SURFACE
      ?auto_19933 - SURFACE
    )
    :vars
    (
      ?auto_19952 - HOIST
      ?auto_19939 - PLACE
      ?auto_19947 - PLACE
      ?auto_19938 - HOIST
      ?auto_19942 - SURFACE
      ?auto_19940 - PLACE
      ?auto_19941 - HOIST
      ?auto_19934 - SURFACE
      ?auto_19944 - SURFACE
      ?auto_19950 - PLACE
      ?auto_19937 - HOIST
      ?auto_19946 - SURFACE
      ?auto_19948 - SURFACE
      ?auto_19951 - PLACE
      ?auto_19943 - HOIST
      ?auto_19949 - SURFACE
      ?auto_19936 - SURFACE
      ?auto_19945 - SURFACE
      ?auto_19935 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19952 ?auto_19939 ) ( IS-CRATE ?auto_19933 ) ( not ( = ?auto_19932 ?auto_19933 ) ) ( not ( = ?auto_19931 ?auto_19932 ) ) ( not ( = ?auto_19931 ?auto_19933 ) ) ( not ( = ?auto_19947 ?auto_19939 ) ) ( HOIST-AT ?auto_19938 ?auto_19947 ) ( not ( = ?auto_19952 ?auto_19938 ) ) ( AVAILABLE ?auto_19938 ) ( SURFACE-AT ?auto_19933 ?auto_19947 ) ( ON ?auto_19933 ?auto_19942 ) ( CLEAR ?auto_19933 ) ( not ( = ?auto_19932 ?auto_19942 ) ) ( not ( = ?auto_19933 ?auto_19942 ) ) ( not ( = ?auto_19931 ?auto_19942 ) ) ( IS-CRATE ?auto_19932 ) ( not ( = ?auto_19940 ?auto_19939 ) ) ( not ( = ?auto_19947 ?auto_19940 ) ) ( HOIST-AT ?auto_19941 ?auto_19940 ) ( not ( = ?auto_19952 ?auto_19941 ) ) ( not ( = ?auto_19938 ?auto_19941 ) ) ( SURFACE-AT ?auto_19932 ?auto_19940 ) ( ON ?auto_19932 ?auto_19934 ) ( CLEAR ?auto_19932 ) ( not ( = ?auto_19932 ?auto_19934 ) ) ( not ( = ?auto_19933 ?auto_19934 ) ) ( not ( = ?auto_19931 ?auto_19934 ) ) ( not ( = ?auto_19942 ?auto_19934 ) ) ( IS-CRATE ?auto_19931 ) ( not ( = ?auto_19944 ?auto_19931 ) ) ( not ( = ?auto_19932 ?auto_19944 ) ) ( not ( = ?auto_19933 ?auto_19944 ) ) ( not ( = ?auto_19942 ?auto_19944 ) ) ( not ( = ?auto_19934 ?auto_19944 ) ) ( not ( = ?auto_19950 ?auto_19939 ) ) ( not ( = ?auto_19947 ?auto_19950 ) ) ( not ( = ?auto_19940 ?auto_19950 ) ) ( HOIST-AT ?auto_19937 ?auto_19950 ) ( not ( = ?auto_19952 ?auto_19937 ) ) ( not ( = ?auto_19938 ?auto_19937 ) ) ( not ( = ?auto_19941 ?auto_19937 ) ) ( AVAILABLE ?auto_19937 ) ( SURFACE-AT ?auto_19931 ?auto_19950 ) ( ON ?auto_19931 ?auto_19946 ) ( CLEAR ?auto_19931 ) ( not ( = ?auto_19932 ?auto_19946 ) ) ( not ( = ?auto_19933 ?auto_19946 ) ) ( not ( = ?auto_19931 ?auto_19946 ) ) ( not ( = ?auto_19942 ?auto_19946 ) ) ( not ( = ?auto_19934 ?auto_19946 ) ) ( not ( = ?auto_19944 ?auto_19946 ) ) ( IS-CRATE ?auto_19944 ) ( not ( = ?auto_19948 ?auto_19944 ) ) ( not ( = ?auto_19932 ?auto_19948 ) ) ( not ( = ?auto_19933 ?auto_19948 ) ) ( not ( = ?auto_19931 ?auto_19948 ) ) ( not ( = ?auto_19942 ?auto_19948 ) ) ( not ( = ?auto_19934 ?auto_19948 ) ) ( not ( = ?auto_19946 ?auto_19948 ) ) ( not ( = ?auto_19951 ?auto_19939 ) ) ( not ( = ?auto_19947 ?auto_19951 ) ) ( not ( = ?auto_19940 ?auto_19951 ) ) ( not ( = ?auto_19950 ?auto_19951 ) ) ( HOIST-AT ?auto_19943 ?auto_19951 ) ( not ( = ?auto_19952 ?auto_19943 ) ) ( not ( = ?auto_19938 ?auto_19943 ) ) ( not ( = ?auto_19941 ?auto_19943 ) ) ( not ( = ?auto_19937 ?auto_19943 ) ) ( AVAILABLE ?auto_19943 ) ( SURFACE-AT ?auto_19944 ?auto_19951 ) ( ON ?auto_19944 ?auto_19949 ) ( CLEAR ?auto_19944 ) ( not ( = ?auto_19932 ?auto_19949 ) ) ( not ( = ?auto_19933 ?auto_19949 ) ) ( not ( = ?auto_19931 ?auto_19949 ) ) ( not ( = ?auto_19942 ?auto_19949 ) ) ( not ( = ?auto_19934 ?auto_19949 ) ) ( not ( = ?auto_19944 ?auto_19949 ) ) ( not ( = ?auto_19946 ?auto_19949 ) ) ( not ( = ?auto_19948 ?auto_19949 ) ) ( SURFACE-AT ?auto_19936 ?auto_19939 ) ( CLEAR ?auto_19936 ) ( IS-CRATE ?auto_19948 ) ( not ( = ?auto_19936 ?auto_19948 ) ) ( not ( = ?auto_19932 ?auto_19936 ) ) ( not ( = ?auto_19933 ?auto_19936 ) ) ( not ( = ?auto_19931 ?auto_19936 ) ) ( not ( = ?auto_19942 ?auto_19936 ) ) ( not ( = ?auto_19934 ?auto_19936 ) ) ( not ( = ?auto_19944 ?auto_19936 ) ) ( not ( = ?auto_19946 ?auto_19936 ) ) ( not ( = ?auto_19949 ?auto_19936 ) ) ( AVAILABLE ?auto_19952 ) ( AVAILABLE ?auto_19941 ) ( SURFACE-AT ?auto_19948 ?auto_19940 ) ( ON ?auto_19948 ?auto_19945 ) ( CLEAR ?auto_19948 ) ( not ( = ?auto_19932 ?auto_19945 ) ) ( not ( = ?auto_19933 ?auto_19945 ) ) ( not ( = ?auto_19931 ?auto_19945 ) ) ( not ( = ?auto_19942 ?auto_19945 ) ) ( not ( = ?auto_19934 ?auto_19945 ) ) ( not ( = ?auto_19944 ?auto_19945 ) ) ( not ( = ?auto_19946 ?auto_19945 ) ) ( not ( = ?auto_19948 ?auto_19945 ) ) ( not ( = ?auto_19949 ?auto_19945 ) ) ( not ( = ?auto_19936 ?auto_19945 ) ) ( TRUCK-AT ?auto_19935 ?auto_19939 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19932 ?auto_19933 )
      ( MAKE-2CRATE-VERIFY ?auto_19931 ?auto_19932 ?auto_19933 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19953 - SURFACE
      ?auto_19954 - SURFACE
      ?auto_19955 - SURFACE
      ?auto_19956 - SURFACE
    )
    :vars
    (
      ?auto_19970 - HOIST
      ?auto_19960 - PLACE
      ?auto_19967 - PLACE
      ?auto_19962 - HOIST
      ?auto_19961 - SURFACE
      ?auto_19965 - PLACE
      ?auto_19963 - HOIST
      ?auto_19969 - SURFACE
      ?auto_19972 - PLACE
      ?auto_19974 - HOIST
      ?auto_19968 - SURFACE
      ?auto_19957 - SURFACE
      ?auto_19964 - PLACE
      ?auto_19966 - HOIST
      ?auto_19973 - SURFACE
      ?auto_19958 - SURFACE
      ?auto_19959 - SURFACE
      ?auto_19971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19970 ?auto_19960 ) ( IS-CRATE ?auto_19956 ) ( not ( = ?auto_19955 ?auto_19956 ) ) ( not ( = ?auto_19954 ?auto_19955 ) ) ( not ( = ?auto_19954 ?auto_19956 ) ) ( not ( = ?auto_19967 ?auto_19960 ) ) ( HOIST-AT ?auto_19962 ?auto_19967 ) ( not ( = ?auto_19970 ?auto_19962 ) ) ( AVAILABLE ?auto_19962 ) ( SURFACE-AT ?auto_19956 ?auto_19967 ) ( ON ?auto_19956 ?auto_19961 ) ( CLEAR ?auto_19956 ) ( not ( = ?auto_19955 ?auto_19961 ) ) ( not ( = ?auto_19956 ?auto_19961 ) ) ( not ( = ?auto_19954 ?auto_19961 ) ) ( IS-CRATE ?auto_19955 ) ( not ( = ?auto_19965 ?auto_19960 ) ) ( not ( = ?auto_19967 ?auto_19965 ) ) ( HOIST-AT ?auto_19963 ?auto_19965 ) ( not ( = ?auto_19970 ?auto_19963 ) ) ( not ( = ?auto_19962 ?auto_19963 ) ) ( SURFACE-AT ?auto_19955 ?auto_19965 ) ( ON ?auto_19955 ?auto_19969 ) ( CLEAR ?auto_19955 ) ( not ( = ?auto_19955 ?auto_19969 ) ) ( not ( = ?auto_19956 ?auto_19969 ) ) ( not ( = ?auto_19954 ?auto_19969 ) ) ( not ( = ?auto_19961 ?auto_19969 ) ) ( IS-CRATE ?auto_19954 ) ( not ( = ?auto_19953 ?auto_19954 ) ) ( not ( = ?auto_19955 ?auto_19953 ) ) ( not ( = ?auto_19956 ?auto_19953 ) ) ( not ( = ?auto_19961 ?auto_19953 ) ) ( not ( = ?auto_19969 ?auto_19953 ) ) ( not ( = ?auto_19972 ?auto_19960 ) ) ( not ( = ?auto_19967 ?auto_19972 ) ) ( not ( = ?auto_19965 ?auto_19972 ) ) ( HOIST-AT ?auto_19974 ?auto_19972 ) ( not ( = ?auto_19970 ?auto_19974 ) ) ( not ( = ?auto_19962 ?auto_19974 ) ) ( not ( = ?auto_19963 ?auto_19974 ) ) ( AVAILABLE ?auto_19974 ) ( SURFACE-AT ?auto_19954 ?auto_19972 ) ( ON ?auto_19954 ?auto_19968 ) ( CLEAR ?auto_19954 ) ( not ( = ?auto_19955 ?auto_19968 ) ) ( not ( = ?auto_19956 ?auto_19968 ) ) ( not ( = ?auto_19954 ?auto_19968 ) ) ( not ( = ?auto_19961 ?auto_19968 ) ) ( not ( = ?auto_19969 ?auto_19968 ) ) ( not ( = ?auto_19953 ?auto_19968 ) ) ( IS-CRATE ?auto_19953 ) ( not ( = ?auto_19957 ?auto_19953 ) ) ( not ( = ?auto_19955 ?auto_19957 ) ) ( not ( = ?auto_19956 ?auto_19957 ) ) ( not ( = ?auto_19954 ?auto_19957 ) ) ( not ( = ?auto_19961 ?auto_19957 ) ) ( not ( = ?auto_19969 ?auto_19957 ) ) ( not ( = ?auto_19968 ?auto_19957 ) ) ( not ( = ?auto_19964 ?auto_19960 ) ) ( not ( = ?auto_19967 ?auto_19964 ) ) ( not ( = ?auto_19965 ?auto_19964 ) ) ( not ( = ?auto_19972 ?auto_19964 ) ) ( HOIST-AT ?auto_19966 ?auto_19964 ) ( not ( = ?auto_19970 ?auto_19966 ) ) ( not ( = ?auto_19962 ?auto_19966 ) ) ( not ( = ?auto_19963 ?auto_19966 ) ) ( not ( = ?auto_19974 ?auto_19966 ) ) ( AVAILABLE ?auto_19966 ) ( SURFACE-AT ?auto_19953 ?auto_19964 ) ( ON ?auto_19953 ?auto_19973 ) ( CLEAR ?auto_19953 ) ( not ( = ?auto_19955 ?auto_19973 ) ) ( not ( = ?auto_19956 ?auto_19973 ) ) ( not ( = ?auto_19954 ?auto_19973 ) ) ( not ( = ?auto_19961 ?auto_19973 ) ) ( not ( = ?auto_19969 ?auto_19973 ) ) ( not ( = ?auto_19953 ?auto_19973 ) ) ( not ( = ?auto_19968 ?auto_19973 ) ) ( not ( = ?auto_19957 ?auto_19973 ) ) ( SURFACE-AT ?auto_19958 ?auto_19960 ) ( CLEAR ?auto_19958 ) ( IS-CRATE ?auto_19957 ) ( not ( = ?auto_19958 ?auto_19957 ) ) ( not ( = ?auto_19955 ?auto_19958 ) ) ( not ( = ?auto_19956 ?auto_19958 ) ) ( not ( = ?auto_19954 ?auto_19958 ) ) ( not ( = ?auto_19961 ?auto_19958 ) ) ( not ( = ?auto_19969 ?auto_19958 ) ) ( not ( = ?auto_19953 ?auto_19958 ) ) ( not ( = ?auto_19968 ?auto_19958 ) ) ( not ( = ?auto_19973 ?auto_19958 ) ) ( AVAILABLE ?auto_19970 ) ( AVAILABLE ?auto_19963 ) ( SURFACE-AT ?auto_19957 ?auto_19965 ) ( ON ?auto_19957 ?auto_19959 ) ( CLEAR ?auto_19957 ) ( not ( = ?auto_19955 ?auto_19959 ) ) ( not ( = ?auto_19956 ?auto_19959 ) ) ( not ( = ?auto_19954 ?auto_19959 ) ) ( not ( = ?auto_19961 ?auto_19959 ) ) ( not ( = ?auto_19969 ?auto_19959 ) ) ( not ( = ?auto_19953 ?auto_19959 ) ) ( not ( = ?auto_19968 ?auto_19959 ) ) ( not ( = ?auto_19957 ?auto_19959 ) ) ( not ( = ?auto_19973 ?auto_19959 ) ) ( not ( = ?auto_19958 ?auto_19959 ) ) ( TRUCK-AT ?auto_19971 ?auto_19960 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19954 ?auto_19955 ?auto_19956 )
      ( MAKE-3CRATE-VERIFY ?auto_19953 ?auto_19954 ?auto_19955 ?auto_19956 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19975 - SURFACE
      ?auto_19976 - SURFACE
      ?auto_19977 - SURFACE
      ?auto_19978 - SURFACE
      ?auto_19979 - SURFACE
    )
    :vars
    (
      ?auto_19992 - HOIST
      ?auto_19982 - PLACE
      ?auto_19989 - PLACE
      ?auto_19984 - HOIST
      ?auto_19983 - SURFACE
      ?auto_19987 - PLACE
      ?auto_19985 - HOIST
      ?auto_19991 - SURFACE
      ?auto_19994 - PLACE
      ?auto_19996 - HOIST
      ?auto_19990 - SURFACE
      ?auto_19986 - PLACE
      ?auto_19988 - HOIST
      ?auto_19995 - SURFACE
      ?auto_19980 - SURFACE
      ?auto_19981 - SURFACE
      ?auto_19993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19992 ?auto_19982 ) ( IS-CRATE ?auto_19979 ) ( not ( = ?auto_19978 ?auto_19979 ) ) ( not ( = ?auto_19977 ?auto_19978 ) ) ( not ( = ?auto_19977 ?auto_19979 ) ) ( not ( = ?auto_19989 ?auto_19982 ) ) ( HOIST-AT ?auto_19984 ?auto_19989 ) ( not ( = ?auto_19992 ?auto_19984 ) ) ( AVAILABLE ?auto_19984 ) ( SURFACE-AT ?auto_19979 ?auto_19989 ) ( ON ?auto_19979 ?auto_19983 ) ( CLEAR ?auto_19979 ) ( not ( = ?auto_19978 ?auto_19983 ) ) ( not ( = ?auto_19979 ?auto_19983 ) ) ( not ( = ?auto_19977 ?auto_19983 ) ) ( IS-CRATE ?auto_19978 ) ( not ( = ?auto_19987 ?auto_19982 ) ) ( not ( = ?auto_19989 ?auto_19987 ) ) ( HOIST-AT ?auto_19985 ?auto_19987 ) ( not ( = ?auto_19992 ?auto_19985 ) ) ( not ( = ?auto_19984 ?auto_19985 ) ) ( SURFACE-AT ?auto_19978 ?auto_19987 ) ( ON ?auto_19978 ?auto_19991 ) ( CLEAR ?auto_19978 ) ( not ( = ?auto_19978 ?auto_19991 ) ) ( not ( = ?auto_19979 ?auto_19991 ) ) ( not ( = ?auto_19977 ?auto_19991 ) ) ( not ( = ?auto_19983 ?auto_19991 ) ) ( IS-CRATE ?auto_19977 ) ( not ( = ?auto_19976 ?auto_19977 ) ) ( not ( = ?auto_19978 ?auto_19976 ) ) ( not ( = ?auto_19979 ?auto_19976 ) ) ( not ( = ?auto_19983 ?auto_19976 ) ) ( not ( = ?auto_19991 ?auto_19976 ) ) ( not ( = ?auto_19994 ?auto_19982 ) ) ( not ( = ?auto_19989 ?auto_19994 ) ) ( not ( = ?auto_19987 ?auto_19994 ) ) ( HOIST-AT ?auto_19996 ?auto_19994 ) ( not ( = ?auto_19992 ?auto_19996 ) ) ( not ( = ?auto_19984 ?auto_19996 ) ) ( not ( = ?auto_19985 ?auto_19996 ) ) ( AVAILABLE ?auto_19996 ) ( SURFACE-AT ?auto_19977 ?auto_19994 ) ( ON ?auto_19977 ?auto_19990 ) ( CLEAR ?auto_19977 ) ( not ( = ?auto_19978 ?auto_19990 ) ) ( not ( = ?auto_19979 ?auto_19990 ) ) ( not ( = ?auto_19977 ?auto_19990 ) ) ( not ( = ?auto_19983 ?auto_19990 ) ) ( not ( = ?auto_19991 ?auto_19990 ) ) ( not ( = ?auto_19976 ?auto_19990 ) ) ( IS-CRATE ?auto_19976 ) ( not ( = ?auto_19975 ?auto_19976 ) ) ( not ( = ?auto_19978 ?auto_19975 ) ) ( not ( = ?auto_19979 ?auto_19975 ) ) ( not ( = ?auto_19977 ?auto_19975 ) ) ( not ( = ?auto_19983 ?auto_19975 ) ) ( not ( = ?auto_19991 ?auto_19975 ) ) ( not ( = ?auto_19990 ?auto_19975 ) ) ( not ( = ?auto_19986 ?auto_19982 ) ) ( not ( = ?auto_19989 ?auto_19986 ) ) ( not ( = ?auto_19987 ?auto_19986 ) ) ( not ( = ?auto_19994 ?auto_19986 ) ) ( HOIST-AT ?auto_19988 ?auto_19986 ) ( not ( = ?auto_19992 ?auto_19988 ) ) ( not ( = ?auto_19984 ?auto_19988 ) ) ( not ( = ?auto_19985 ?auto_19988 ) ) ( not ( = ?auto_19996 ?auto_19988 ) ) ( AVAILABLE ?auto_19988 ) ( SURFACE-AT ?auto_19976 ?auto_19986 ) ( ON ?auto_19976 ?auto_19995 ) ( CLEAR ?auto_19976 ) ( not ( = ?auto_19978 ?auto_19995 ) ) ( not ( = ?auto_19979 ?auto_19995 ) ) ( not ( = ?auto_19977 ?auto_19995 ) ) ( not ( = ?auto_19983 ?auto_19995 ) ) ( not ( = ?auto_19991 ?auto_19995 ) ) ( not ( = ?auto_19976 ?auto_19995 ) ) ( not ( = ?auto_19990 ?auto_19995 ) ) ( not ( = ?auto_19975 ?auto_19995 ) ) ( SURFACE-AT ?auto_19980 ?auto_19982 ) ( CLEAR ?auto_19980 ) ( IS-CRATE ?auto_19975 ) ( not ( = ?auto_19980 ?auto_19975 ) ) ( not ( = ?auto_19978 ?auto_19980 ) ) ( not ( = ?auto_19979 ?auto_19980 ) ) ( not ( = ?auto_19977 ?auto_19980 ) ) ( not ( = ?auto_19983 ?auto_19980 ) ) ( not ( = ?auto_19991 ?auto_19980 ) ) ( not ( = ?auto_19976 ?auto_19980 ) ) ( not ( = ?auto_19990 ?auto_19980 ) ) ( not ( = ?auto_19995 ?auto_19980 ) ) ( AVAILABLE ?auto_19992 ) ( AVAILABLE ?auto_19985 ) ( SURFACE-AT ?auto_19975 ?auto_19987 ) ( ON ?auto_19975 ?auto_19981 ) ( CLEAR ?auto_19975 ) ( not ( = ?auto_19978 ?auto_19981 ) ) ( not ( = ?auto_19979 ?auto_19981 ) ) ( not ( = ?auto_19977 ?auto_19981 ) ) ( not ( = ?auto_19983 ?auto_19981 ) ) ( not ( = ?auto_19991 ?auto_19981 ) ) ( not ( = ?auto_19976 ?auto_19981 ) ) ( not ( = ?auto_19990 ?auto_19981 ) ) ( not ( = ?auto_19975 ?auto_19981 ) ) ( not ( = ?auto_19995 ?auto_19981 ) ) ( not ( = ?auto_19980 ?auto_19981 ) ) ( TRUCK-AT ?auto_19993 ?auto_19982 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19977 ?auto_19978 ?auto_19979 )
      ( MAKE-4CRATE-VERIFY ?auto_19975 ?auto_19976 ?auto_19977 ?auto_19978 ?auto_19979 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19997 - SURFACE
      ?auto_19998 - SURFACE
      ?auto_19999 - SURFACE
      ?auto_20000 - SURFACE
      ?auto_20001 - SURFACE
      ?auto_20002 - SURFACE
    )
    :vars
    (
      ?auto_20014 - HOIST
      ?auto_20004 - PLACE
      ?auto_20011 - PLACE
      ?auto_20006 - HOIST
      ?auto_20005 - SURFACE
      ?auto_20009 - PLACE
      ?auto_20007 - HOIST
      ?auto_20013 - SURFACE
      ?auto_20016 - PLACE
      ?auto_20018 - HOIST
      ?auto_20012 - SURFACE
      ?auto_20008 - PLACE
      ?auto_20010 - HOIST
      ?auto_20017 - SURFACE
      ?auto_20003 - SURFACE
      ?auto_20015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20014 ?auto_20004 ) ( IS-CRATE ?auto_20002 ) ( not ( = ?auto_20001 ?auto_20002 ) ) ( not ( = ?auto_20000 ?auto_20001 ) ) ( not ( = ?auto_20000 ?auto_20002 ) ) ( not ( = ?auto_20011 ?auto_20004 ) ) ( HOIST-AT ?auto_20006 ?auto_20011 ) ( not ( = ?auto_20014 ?auto_20006 ) ) ( AVAILABLE ?auto_20006 ) ( SURFACE-AT ?auto_20002 ?auto_20011 ) ( ON ?auto_20002 ?auto_20005 ) ( CLEAR ?auto_20002 ) ( not ( = ?auto_20001 ?auto_20005 ) ) ( not ( = ?auto_20002 ?auto_20005 ) ) ( not ( = ?auto_20000 ?auto_20005 ) ) ( IS-CRATE ?auto_20001 ) ( not ( = ?auto_20009 ?auto_20004 ) ) ( not ( = ?auto_20011 ?auto_20009 ) ) ( HOIST-AT ?auto_20007 ?auto_20009 ) ( not ( = ?auto_20014 ?auto_20007 ) ) ( not ( = ?auto_20006 ?auto_20007 ) ) ( SURFACE-AT ?auto_20001 ?auto_20009 ) ( ON ?auto_20001 ?auto_20013 ) ( CLEAR ?auto_20001 ) ( not ( = ?auto_20001 ?auto_20013 ) ) ( not ( = ?auto_20002 ?auto_20013 ) ) ( not ( = ?auto_20000 ?auto_20013 ) ) ( not ( = ?auto_20005 ?auto_20013 ) ) ( IS-CRATE ?auto_20000 ) ( not ( = ?auto_19999 ?auto_20000 ) ) ( not ( = ?auto_20001 ?auto_19999 ) ) ( not ( = ?auto_20002 ?auto_19999 ) ) ( not ( = ?auto_20005 ?auto_19999 ) ) ( not ( = ?auto_20013 ?auto_19999 ) ) ( not ( = ?auto_20016 ?auto_20004 ) ) ( not ( = ?auto_20011 ?auto_20016 ) ) ( not ( = ?auto_20009 ?auto_20016 ) ) ( HOIST-AT ?auto_20018 ?auto_20016 ) ( not ( = ?auto_20014 ?auto_20018 ) ) ( not ( = ?auto_20006 ?auto_20018 ) ) ( not ( = ?auto_20007 ?auto_20018 ) ) ( AVAILABLE ?auto_20018 ) ( SURFACE-AT ?auto_20000 ?auto_20016 ) ( ON ?auto_20000 ?auto_20012 ) ( CLEAR ?auto_20000 ) ( not ( = ?auto_20001 ?auto_20012 ) ) ( not ( = ?auto_20002 ?auto_20012 ) ) ( not ( = ?auto_20000 ?auto_20012 ) ) ( not ( = ?auto_20005 ?auto_20012 ) ) ( not ( = ?auto_20013 ?auto_20012 ) ) ( not ( = ?auto_19999 ?auto_20012 ) ) ( IS-CRATE ?auto_19999 ) ( not ( = ?auto_19998 ?auto_19999 ) ) ( not ( = ?auto_20001 ?auto_19998 ) ) ( not ( = ?auto_20002 ?auto_19998 ) ) ( not ( = ?auto_20000 ?auto_19998 ) ) ( not ( = ?auto_20005 ?auto_19998 ) ) ( not ( = ?auto_20013 ?auto_19998 ) ) ( not ( = ?auto_20012 ?auto_19998 ) ) ( not ( = ?auto_20008 ?auto_20004 ) ) ( not ( = ?auto_20011 ?auto_20008 ) ) ( not ( = ?auto_20009 ?auto_20008 ) ) ( not ( = ?auto_20016 ?auto_20008 ) ) ( HOIST-AT ?auto_20010 ?auto_20008 ) ( not ( = ?auto_20014 ?auto_20010 ) ) ( not ( = ?auto_20006 ?auto_20010 ) ) ( not ( = ?auto_20007 ?auto_20010 ) ) ( not ( = ?auto_20018 ?auto_20010 ) ) ( AVAILABLE ?auto_20010 ) ( SURFACE-AT ?auto_19999 ?auto_20008 ) ( ON ?auto_19999 ?auto_20017 ) ( CLEAR ?auto_19999 ) ( not ( = ?auto_20001 ?auto_20017 ) ) ( not ( = ?auto_20002 ?auto_20017 ) ) ( not ( = ?auto_20000 ?auto_20017 ) ) ( not ( = ?auto_20005 ?auto_20017 ) ) ( not ( = ?auto_20013 ?auto_20017 ) ) ( not ( = ?auto_19999 ?auto_20017 ) ) ( not ( = ?auto_20012 ?auto_20017 ) ) ( not ( = ?auto_19998 ?auto_20017 ) ) ( SURFACE-AT ?auto_19997 ?auto_20004 ) ( CLEAR ?auto_19997 ) ( IS-CRATE ?auto_19998 ) ( not ( = ?auto_19997 ?auto_19998 ) ) ( not ( = ?auto_20001 ?auto_19997 ) ) ( not ( = ?auto_20002 ?auto_19997 ) ) ( not ( = ?auto_20000 ?auto_19997 ) ) ( not ( = ?auto_20005 ?auto_19997 ) ) ( not ( = ?auto_20013 ?auto_19997 ) ) ( not ( = ?auto_19999 ?auto_19997 ) ) ( not ( = ?auto_20012 ?auto_19997 ) ) ( not ( = ?auto_20017 ?auto_19997 ) ) ( AVAILABLE ?auto_20014 ) ( AVAILABLE ?auto_20007 ) ( SURFACE-AT ?auto_19998 ?auto_20009 ) ( ON ?auto_19998 ?auto_20003 ) ( CLEAR ?auto_19998 ) ( not ( = ?auto_20001 ?auto_20003 ) ) ( not ( = ?auto_20002 ?auto_20003 ) ) ( not ( = ?auto_20000 ?auto_20003 ) ) ( not ( = ?auto_20005 ?auto_20003 ) ) ( not ( = ?auto_20013 ?auto_20003 ) ) ( not ( = ?auto_19999 ?auto_20003 ) ) ( not ( = ?auto_20012 ?auto_20003 ) ) ( not ( = ?auto_19998 ?auto_20003 ) ) ( not ( = ?auto_20017 ?auto_20003 ) ) ( not ( = ?auto_19997 ?auto_20003 ) ) ( TRUCK-AT ?auto_20015 ?auto_20004 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20000 ?auto_20001 ?auto_20002 )
      ( MAKE-5CRATE-VERIFY ?auto_19997 ?auto_19998 ?auto_19999 ?auto_20000 ?auto_20001 ?auto_20002 ) )
  )

)

