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
      ?auto_16656 - SURFACE
      ?auto_16657 - SURFACE
    )
    :vars
    (
      ?auto_16658 - HOIST
      ?auto_16659 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16658 ?auto_16659 ) ( SURFACE-AT ?auto_16657 ?auto_16659 ) ( CLEAR ?auto_16657 ) ( LIFTING ?auto_16658 ?auto_16656 ) ( IS-CRATE ?auto_16656 ) ( not ( = ?auto_16656 ?auto_16657 ) ) )
    :subtasks
    ( ( !DROP ?auto_16658 ?auto_16656 ?auto_16657 ?auto_16659 )
      ( MAKE-ON-VERIFY ?auto_16656 ?auto_16657 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16660 - SURFACE
      ?auto_16661 - SURFACE
    )
    :vars
    (
      ?auto_16663 - HOIST
      ?auto_16662 - PLACE
      ?auto_16664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16663 ?auto_16662 ) ( SURFACE-AT ?auto_16661 ?auto_16662 ) ( CLEAR ?auto_16661 ) ( IS-CRATE ?auto_16660 ) ( not ( = ?auto_16660 ?auto_16661 ) ) ( TRUCK-AT ?auto_16664 ?auto_16662 ) ( AVAILABLE ?auto_16663 ) ( IN ?auto_16660 ?auto_16664 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16663 ?auto_16660 ?auto_16664 ?auto_16662 )
      ( MAKE-ON ?auto_16660 ?auto_16661 )
      ( MAKE-ON-VERIFY ?auto_16660 ?auto_16661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16665 - SURFACE
      ?auto_16666 - SURFACE
    )
    :vars
    (
      ?auto_16669 - HOIST
      ?auto_16668 - PLACE
      ?auto_16667 - TRUCK
      ?auto_16670 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16669 ?auto_16668 ) ( SURFACE-AT ?auto_16666 ?auto_16668 ) ( CLEAR ?auto_16666 ) ( IS-CRATE ?auto_16665 ) ( not ( = ?auto_16665 ?auto_16666 ) ) ( AVAILABLE ?auto_16669 ) ( IN ?auto_16665 ?auto_16667 ) ( TRUCK-AT ?auto_16667 ?auto_16670 ) ( not ( = ?auto_16670 ?auto_16668 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16667 ?auto_16670 ?auto_16668 )
      ( MAKE-ON ?auto_16665 ?auto_16666 )
      ( MAKE-ON-VERIFY ?auto_16665 ?auto_16666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16671 - SURFACE
      ?auto_16672 - SURFACE
    )
    :vars
    (
      ?auto_16674 - HOIST
      ?auto_16675 - PLACE
      ?auto_16676 - TRUCK
      ?auto_16673 - PLACE
      ?auto_16677 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16674 ?auto_16675 ) ( SURFACE-AT ?auto_16672 ?auto_16675 ) ( CLEAR ?auto_16672 ) ( IS-CRATE ?auto_16671 ) ( not ( = ?auto_16671 ?auto_16672 ) ) ( AVAILABLE ?auto_16674 ) ( TRUCK-AT ?auto_16676 ?auto_16673 ) ( not ( = ?auto_16673 ?auto_16675 ) ) ( HOIST-AT ?auto_16677 ?auto_16673 ) ( LIFTING ?auto_16677 ?auto_16671 ) ( not ( = ?auto_16674 ?auto_16677 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16677 ?auto_16671 ?auto_16676 ?auto_16673 )
      ( MAKE-ON ?auto_16671 ?auto_16672 )
      ( MAKE-ON-VERIFY ?auto_16671 ?auto_16672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16678 - SURFACE
      ?auto_16679 - SURFACE
    )
    :vars
    (
      ?auto_16683 - HOIST
      ?auto_16681 - PLACE
      ?auto_16682 - TRUCK
      ?auto_16680 - PLACE
      ?auto_16684 - HOIST
      ?auto_16685 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16683 ?auto_16681 ) ( SURFACE-AT ?auto_16679 ?auto_16681 ) ( CLEAR ?auto_16679 ) ( IS-CRATE ?auto_16678 ) ( not ( = ?auto_16678 ?auto_16679 ) ) ( AVAILABLE ?auto_16683 ) ( TRUCK-AT ?auto_16682 ?auto_16680 ) ( not ( = ?auto_16680 ?auto_16681 ) ) ( HOIST-AT ?auto_16684 ?auto_16680 ) ( not ( = ?auto_16683 ?auto_16684 ) ) ( AVAILABLE ?auto_16684 ) ( SURFACE-AT ?auto_16678 ?auto_16680 ) ( ON ?auto_16678 ?auto_16685 ) ( CLEAR ?auto_16678 ) ( not ( = ?auto_16678 ?auto_16685 ) ) ( not ( = ?auto_16679 ?auto_16685 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16684 ?auto_16678 ?auto_16685 ?auto_16680 )
      ( MAKE-ON ?auto_16678 ?auto_16679 )
      ( MAKE-ON-VERIFY ?auto_16678 ?auto_16679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16686 - SURFACE
      ?auto_16687 - SURFACE
    )
    :vars
    (
      ?auto_16692 - HOIST
      ?auto_16691 - PLACE
      ?auto_16688 - PLACE
      ?auto_16693 - HOIST
      ?auto_16690 - SURFACE
      ?auto_16689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16692 ?auto_16691 ) ( SURFACE-AT ?auto_16687 ?auto_16691 ) ( CLEAR ?auto_16687 ) ( IS-CRATE ?auto_16686 ) ( not ( = ?auto_16686 ?auto_16687 ) ) ( AVAILABLE ?auto_16692 ) ( not ( = ?auto_16688 ?auto_16691 ) ) ( HOIST-AT ?auto_16693 ?auto_16688 ) ( not ( = ?auto_16692 ?auto_16693 ) ) ( AVAILABLE ?auto_16693 ) ( SURFACE-AT ?auto_16686 ?auto_16688 ) ( ON ?auto_16686 ?auto_16690 ) ( CLEAR ?auto_16686 ) ( not ( = ?auto_16686 ?auto_16690 ) ) ( not ( = ?auto_16687 ?auto_16690 ) ) ( TRUCK-AT ?auto_16689 ?auto_16691 ) )
    :subtasks
    ( ( !DRIVE ?auto_16689 ?auto_16691 ?auto_16688 )
      ( MAKE-ON ?auto_16686 ?auto_16687 )
      ( MAKE-ON-VERIFY ?auto_16686 ?auto_16687 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16696 - SURFACE
      ?auto_16697 - SURFACE
    )
    :vars
    (
      ?auto_16698 - HOIST
      ?auto_16699 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16698 ?auto_16699 ) ( SURFACE-AT ?auto_16697 ?auto_16699 ) ( CLEAR ?auto_16697 ) ( LIFTING ?auto_16698 ?auto_16696 ) ( IS-CRATE ?auto_16696 ) ( not ( = ?auto_16696 ?auto_16697 ) ) )
    :subtasks
    ( ( !DROP ?auto_16698 ?auto_16696 ?auto_16697 ?auto_16699 )
      ( MAKE-ON-VERIFY ?auto_16696 ?auto_16697 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16700 - SURFACE
      ?auto_16701 - SURFACE
    )
    :vars
    (
      ?auto_16702 - HOIST
      ?auto_16703 - PLACE
      ?auto_16704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16702 ?auto_16703 ) ( SURFACE-AT ?auto_16701 ?auto_16703 ) ( CLEAR ?auto_16701 ) ( IS-CRATE ?auto_16700 ) ( not ( = ?auto_16700 ?auto_16701 ) ) ( TRUCK-AT ?auto_16704 ?auto_16703 ) ( AVAILABLE ?auto_16702 ) ( IN ?auto_16700 ?auto_16704 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16702 ?auto_16700 ?auto_16704 ?auto_16703 )
      ( MAKE-ON ?auto_16700 ?auto_16701 )
      ( MAKE-ON-VERIFY ?auto_16700 ?auto_16701 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16705 - SURFACE
      ?auto_16706 - SURFACE
    )
    :vars
    (
      ?auto_16707 - HOIST
      ?auto_16708 - PLACE
      ?auto_16709 - TRUCK
      ?auto_16710 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16707 ?auto_16708 ) ( SURFACE-AT ?auto_16706 ?auto_16708 ) ( CLEAR ?auto_16706 ) ( IS-CRATE ?auto_16705 ) ( not ( = ?auto_16705 ?auto_16706 ) ) ( AVAILABLE ?auto_16707 ) ( IN ?auto_16705 ?auto_16709 ) ( TRUCK-AT ?auto_16709 ?auto_16710 ) ( not ( = ?auto_16710 ?auto_16708 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16709 ?auto_16710 ?auto_16708 )
      ( MAKE-ON ?auto_16705 ?auto_16706 )
      ( MAKE-ON-VERIFY ?auto_16705 ?auto_16706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16711 - SURFACE
      ?auto_16712 - SURFACE
    )
    :vars
    (
      ?auto_16714 - HOIST
      ?auto_16713 - PLACE
      ?auto_16715 - TRUCK
      ?auto_16716 - PLACE
      ?auto_16717 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16714 ?auto_16713 ) ( SURFACE-AT ?auto_16712 ?auto_16713 ) ( CLEAR ?auto_16712 ) ( IS-CRATE ?auto_16711 ) ( not ( = ?auto_16711 ?auto_16712 ) ) ( AVAILABLE ?auto_16714 ) ( TRUCK-AT ?auto_16715 ?auto_16716 ) ( not ( = ?auto_16716 ?auto_16713 ) ) ( HOIST-AT ?auto_16717 ?auto_16716 ) ( LIFTING ?auto_16717 ?auto_16711 ) ( not ( = ?auto_16714 ?auto_16717 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16717 ?auto_16711 ?auto_16715 ?auto_16716 )
      ( MAKE-ON ?auto_16711 ?auto_16712 )
      ( MAKE-ON-VERIFY ?auto_16711 ?auto_16712 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16718 - SURFACE
      ?auto_16719 - SURFACE
    )
    :vars
    (
      ?auto_16723 - HOIST
      ?auto_16722 - PLACE
      ?auto_16720 - TRUCK
      ?auto_16724 - PLACE
      ?auto_16721 - HOIST
      ?auto_16725 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16723 ?auto_16722 ) ( SURFACE-AT ?auto_16719 ?auto_16722 ) ( CLEAR ?auto_16719 ) ( IS-CRATE ?auto_16718 ) ( not ( = ?auto_16718 ?auto_16719 ) ) ( AVAILABLE ?auto_16723 ) ( TRUCK-AT ?auto_16720 ?auto_16724 ) ( not ( = ?auto_16724 ?auto_16722 ) ) ( HOIST-AT ?auto_16721 ?auto_16724 ) ( not ( = ?auto_16723 ?auto_16721 ) ) ( AVAILABLE ?auto_16721 ) ( SURFACE-AT ?auto_16718 ?auto_16724 ) ( ON ?auto_16718 ?auto_16725 ) ( CLEAR ?auto_16718 ) ( not ( = ?auto_16718 ?auto_16725 ) ) ( not ( = ?auto_16719 ?auto_16725 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16721 ?auto_16718 ?auto_16725 ?auto_16724 )
      ( MAKE-ON ?auto_16718 ?auto_16719 )
      ( MAKE-ON-VERIFY ?auto_16718 ?auto_16719 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16726 - SURFACE
      ?auto_16727 - SURFACE
    )
    :vars
    (
      ?auto_16728 - HOIST
      ?auto_16733 - PLACE
      ?auto_16729 - PLACE
      ?auto_16732 - HOIST
      ?auto_16731 - SURFACE
      ?auto_16730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16728 ?auto_16733 ) ( SURFACE-AT ?auto_16727 ?auto_16733 ) ( CLEAR ?auto_16727 ) ( IS-CRATE ?auto_16726 ) ( not ( = ?auto_16726 ?auto_16727 ) ) ( AVAILABLE ?auto_16728 ) ( not ( = ?auto_16729 ?auto_16733 ) ) ( HOIST-AT ?auto_16732 ?auto_16729 ) ( not ( = ?auto_16728 ?auto_16732 ) ) ( AVAILABLE ?auto_16732 ) ( SURFACE-AT ?auto_16726 ?auto_16729 ) ( ON ?auto_16726 ?auto_16731 ) ( CLEAR ?auto_16726 ) ( not ( = ?auto_16726 ?auto_16731 ) ) ( not ( = ?auto_16727 ?auto_16731 ) ) ( TRUCK-AT ?auto_16730 ?auto_16733 ) )
    :subtasks
    ( ( !DRIVE ?auto_16730 ?auto_16733 ?auto_16729 )
      ( MAKE-ON ?auto_16726 ?auto_16727 )
      ( MAKE-ON-VERIFY ?auto_16726 ?auto_16727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16734 - SURFACE
      ?auto_16735 - SURFACE
    )
    :vars
    (
      ?auto_16740 - HOIST
      ?auto_16736 - PLACE
      ?auto_16738 - PLACE
      ?auto_16739 - HOIST
      ?auto_16737 - SURFACE
      ?auto_16741 - TRUCK
      ?auto_16742 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16740 ?auto_16736 ) ( IS-CRATE ?auto_16734 ) ( not ( = ?auto_16734 ?auto_16735 ) ) ( not ( = ?auto_16738 ?auto_16736 ) ) ( HOIST-AT ?auto_16739 ?auto_16738 ) ( not ( = ?auto_16740 ?auto_16739 ) ) ( AVAILABLE ?auto_16739 ) ( SURFACE-AT ?auto_16734 ?auto_16738 ) ( ON ?auto_16734 ?auto_16737 ) ( CLEAR ?auto_16734 ) ( not ( = ?auto_16734 ?auto_16737 ) ) ( not ( = ?auto_16735 ?auto_16737 ) ) ( TRUCK-AT ?auto_16741 ?auto_16736 ) ( SURFACE-AT ?auto_16742 ?auto_16736 ) ( CLEAR ?auto_16742 ) ( LIFTING ?auto_16740 ?auto_16735 ) ( IS-CRATE ?auto_16735 ) ( not ( = ?auto_16734 ?auto_16742 ) ) ( not ( = ?auto_16735 ?auto_16742 ) ) ( not ( = ?auto_16737 ?auto_16742 ) ) )
    :subtasks
    ( ( !DROP ?auto_16740 ?auto_16735 ?auto_16742 ?auto_16736 )
      ( MAKE-ON ?auto_16734 ?auto_16735 )
      ( MAKE-ON-VERIFY ?auto_16734 ?auto_16735 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16743 - SURFACE
      ?auto_16744 - SURFACE
    )
    :vars
    (
      ?auto_16749 - HOIST
      ?auto_16746 - PLACE
      ?auto_16750 - PLACE
      ?auto_16751 - HOIST
      ?auto_16745 - SURFACE
      ?auto_16748 - TRUCK
      ?auto_16747 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16749 ?auto_16746 ) ( IS-CRATE ?auto_16743 ) ( not ( = ?auto_16743 ?auto_16744 ) ) ( not ( = ?auto_16750 ?auto_16746 ) ) ( HOIST-AT ?auto_16751 ?auto_16750 ) ( not ( = ?auto_16749 ?auto_16751 ) ) ( AVAILABLE ?auto_16751 ) ( SURFACE-AT ?auto_16743 ?auto_16750 ) ( ON ?auto_16743 ?auto_16745 ) ( CLEAR ?auto_16743 ) ( not ( = ?auto_16743 ?auto_16745 ) ) ( not ( = ?auto_16744 ?auto_16745 ) ) ( TRUCK-AT ?auto_16748 ?auto_16746 ) ( SURFACE-AT ?auto_16747 ?auto_16746 ) ( CLEAR ?auto_16747 ) ( IS-CRATE ?auto_16744 ) ( not ( = ?auto_16743 ?auto_16747 ) ) ( not ( = ?auto_16744 ?auto_16747 ) ) ( not ( = ?auto_16745 ?auto_16747 ) ) ( AVAILABLE ?auto_16749 ) ( IN ?auto_16744 ?auto_16748 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16749 ?auto_16744 ?auto_16748 ?auto_16746 )
      ( MAKE-ON ?auto_16743 ?auto_16744 )
      ( MAKE-ON-VERIFY ?auto_16743 ?auto_16744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16752 - SURFACE
      ?auto_16753 - SURFACE
    )
    :vars
    (
      ?auto_16756 - HOIST
      ?auto_16759 - PLACE
      ?auto_16757 - PLACE
      ?auto_16758 - HOIST
      ?auto_16760 - SURFACE
      ?auto_16754 - SURFACE
      ?auto_16755 - TRUCK
      ?auto_16761 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16756 ?auto_16759 ) ( IS-CRATE ?auto_16752 ) ( not ( = ?auto_16752 ?auto_16753 ) ) ( not ( = ?auto_16757 ?auto_16759 ) ) ( HOIST-AT ?auto_16758 ?auto_16757 ) ( not ( = ?auto_16756 ?auto_16758 ) ) ( AVAILABLE ?auto_16758 ) ( SURFACE-AT ?auto_16752 ?auto_16757 ) ( ON ?auto_16752 ?auto_16760 ) ( CLEAR ?auto_16752 ) ( not ( = ?auto_16752 ?auto_16760 ) ) ( not ( = ?auto_16753 ?auto_16760 ) ) ( SURFACE-AT ?auto_16754 ?auto_16759 ) ( CLEAR ?auto_16754 ) ( IS-CRATE ?auto_16753 ) ( not ( = ?auto_16752 ?auto_16754 ) ) ( not ( = ?auto_16753 ?auto_16754 ) ) ( not ( = ?auto_16760 ?auto_16754 ) ) ( AVAILABLE ?auto_16756 ) ( IN ?auto_16753 ?auto_16755 ) ( TRUCK-AT ?auto_16755 ?auto_16761 ) ( not ( = ?auto_16761 ?auto_16759 ) ) ( not ( = ?auto_16757 ?auto_16761 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16755 ?auto_16761 ?auto_16759 )
      ( MAKE-ON ?auto_16752 ?auto_16753 )
      ( MAKE-ON-VERIFY ?auto_16752 ?auto_16753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16762 - SURFACE
      ?auto_16763 - SURFACE
    )
    :vars
    (
      ?auto_16765 - HOIST
      ?auto_16770 - PLACE
      ?auto_16767 - PLACE
      ?auto_16766 - HOIST
      ?auto_16769 - SURFACE
      ?auto_16771 - SURFACE
      ?auto_16764 - TRUCK
      ?auto_16768 - PLACE
      ?auto_16772 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16765 ?auto_16770 ) ( IS-CRATE ?auto_16762 ) ( not ( = ?auto_16762 ?auto_16763 ) ) ( not ( = ?auto_16767 ?auto_16770 ) ) ( HOIST-AT ?auto_16766 ?auto_16767 ) ( not ( = ?auto_16765 ?auto_16766 ) ) ( AVAILABLE ?auto_16766 ) ( SURFACE-AT ?auto_16762 ?auto_16767 ) ( ON ?auto_16762 ?auto_16769 ) ( CLEAR ?auto_16762 ) ( not ( = ?auto_16762 ?auto_16769 ) ) ( not ( = ?auto_16763 ?auto_16769 ) ) ( SURFACE-AT ?auto_16771 ?auto_16770 ) ( CLEAR ?auto_16771 ) ( IS-CRATE ?auto_16763 ) ( not ( = ?auto_16762 ?auto_16771 ) ) ( not ( = ?auto_16763 ?auto_16771 ) ) ( not ( = ?auto_16769 ?auto_16771 ) ) ( AVAILABLE ?auto_16765 ) ( TRUCK-AT ?auto_16764 ?auto_16768 ) ( not ( = ?auto_16768 ?auto_16770 ) ) ( not ( = ?auto_16767 ?auto_16768 ) ) ( HOIST-AT ?auto_16772 ?auto_16768 ) ( LIFTING ?auto_16772 ?auto_16763 ) ( not ( = ?auto_16765 ?auto_16772 ) ) ( not ( = ?auto_16766 ?auto_16772 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16772 ?auto_16763 ?auto_16764 ?auto_16768 )
      ( MAKE-ON ?auto_16762 ?auto_16763 )
      ( MAKE-ON-VERIFY ?auto_16762 ?auto_16763 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16773 - SURFACE
      ?auto_16774 - SURFACE
    )
    :vars
    (
      ?auto_16776 - HOIST
      ?auto_16781 - PLACE
      ?auto_16782 - PLACE
      ?auto_16777 - HOIST
      ?auto_16778 - SURFACE
      ?auto_16783 - SURFACE
      ?auto_16779 - TRUCK
      ?auto_16780 - PLACE
      ?auto_16775 - HOIST
      ?auto_16784 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16776 ?auto_16781 ) ( IS-CRATE ?auto_16773 ) ( not ( = ?auto_16773 ?auto_16774 ) ) ( not ( = ?auto_16782 ?auto_16781 ) ) ( HOIST-AT ?auto_16777 ?auto_16782 ) ( not ( = ?auto_16776 ?auto_16777 ) ) ( AVAILABLE ?auto_16777 ) ( SURFACE-AT ?auto_16773 ?auto_16782 ) ( ON ?auto_16773 ?auto_16778 ) ( CLEAR ?auto_16773 ) ( not ( = ?auto_16773 ?auto_16778 ) ) ( not ( = ?auto_16774 ?auto_16778 ) ) ( SURFACE-AT ?auto_16783 ?auto_16781 ) ( CLEAR ?auto_16783 ) ( IS-CRATE ?auto_16774 ) ( not ( = ?auto_16773 ?auto_16783 ) ) ( not ( = ?auto_16774 ?auto_16783 ) ) ( not ( = ?auto_16778 ?auto_16783 ) ) ( AVAILABLE ?auto_16776 ) ( TRUCK-AT ?auto_16779 ?auto_16780 ) ( not ( = ?auto_16780 ?auto_16781 ) ) ( not ( = ?auto_16782 ?auto_16780 ) ) ( HOIST-AT ?auto_16775 ?auto_16780 ) ( not ( = ?auto_16776 ?auto_16775 ) ) ( not ( = ?auto_16777 ?auto_16775 ) ) ( AVAILABLE ?auto_16775 ) ( SURFACE-AT ?auto_16774 ?auto_16780 ) ( ON ?auto_16774 ?auto_16784 ) ( CLEAR ?auto_16774 ) ( not ( = ?auto_16773 ?auto_16784 ) ) ( not ( = ?auto_16774 ?auto_16784 ) ) ( not ( = ?auto_16778 ?auto_16784 ) ) ( not ( = ?auto_16783 ?auto_16784 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16775 ?auto_16774 ?auto_16784 ?auto_16780 )
      ( MAKE-ON ?auto_16773 ?auto_16774 )
      ( MAKE-ON-VERIFY ?auto_16773 ?auto_16774 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16785 - SURFACE
      ?auto_16786 - SURFACE
    )
    :vars
    (
      ?auto_16787 - HOIST
      ?auto_16791 - PLACE
      ?auto_16793 - PLACE
      ?auto_16790 - HOIST
      ?auto_16796 - SURFACE
      ?auto_16795 - SURFACE
      ?auto_16789 - PLACE
      ?auto_16788 - HOIST
      ?auto_16792 - SURFACE
      ?auto_16794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16787 ?auto_16791 ) ( IS-CRATE ?auto_16785 ) ( not ( = ?auto_16785 ?auto_16786 ) ) ( not ( = ?auto_16793 ?auto_16791 ) ) ( HOIST-AT ?auto_16790 ?auto_16793 ) ( not ( = ?auto_16787 ?auto_16790 ) ) ( AVAILABLE ?auto_16790 ) ( SURFACE-AT ?auto_16785 ?auto_16793 ) ( ON ?auto_16785 ?auto_16796 ) ( CLEAR ?auto_16785 ) ( not ( = ?auto_16785 ?auto_16796 ) ) ( not ( = ?auto_16786 ?auto_16796 ) ) ( SURFACE-AT ?auto_16795 ?auto_16791 ) ( CLEAR ?auto_16795 ) ( IS-CRATE ?auto_16786 ) ( not ( = ?auto_16785 ?auto_16795 ) ) ( not ( = ?auto_16786 ?auto_16795 ) ) ( not ( = ?auto_16796 ?auto_16795 ) ) ( AVAILABLE ?auto_16787 ) ( not ( = ?auto_16789 ?auto_16791 ) ) ( not ( = ?auto_16793 ?auto_16789 ) ) ( HOIST-AT ?auto_16788 ?auto_16789 ) ( not ( = ?auto_16787 ?auto_16788 ) ) ( not ( = ?auto_16790 ?auto_16788 ) ) ( AVAILABLE ?auto_16788 ) ( SURFACE-AT ?auto_16786 ?auto_16789 ) ( ON ?auto_16786 ?auto_16792 ) ( CLEAR ?auto_16786 ) ( not ( = ?auto_16785 ?auto_16792 ) ) ( not ( = ?auto_16786 ?auto_16792 ) ) ( not ( = ?auto_16796 ?auto_16792 ) ) ( not ( = ?auto_16795 ?auto_16792 ) ) ( TRUCK-AT ?auto_16794 ?auto_16791 ) )
    :subtasks
    ( ( !DRIVE ?auto_16794 ?auto_16791 ?auto_16789 )
      ( MAKE-ON ?auto_16785 ?auto_16786 )
      ( MAKE-ON-VERIFY ?auto_16785 ?auto_16786 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16799 - SURFACE
      ?auto_16800 - SURFACE
    )
    :vars
    (
      ?auto_16801 - HOIST
      ?auto_16802 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16801 ?auto_16802 ) ( SURFACE-AT ?auto_16800 ?auto_16802 ) ( CLEAR ?auto_16800 ) ( LIFTING ?auto_16801 ?auto_16799 ) ( IS-CRATE ?auto_16799 ) ( not ( = ?auto_16799 ?auto_16800 ) ) )
    :subtasks
    ( ( !DROP ?auto_16801 ?auto_16799 ?auto_16800 ?auto_16802 )
      ( MAKE-ON-VERIFY ?auto_16799 ?auto_16800 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16803 - SURFACE
      ?auto_16804 - SURFACE
    )
    :vars
    (
      ?auto_16805 - HOIST
      ?auto_16806 - PLACE
      ?auto_16807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16805 ?auto_16806 ) ( SURFACE-AT ?auto_16804 ?auto_16806 ) ( CLEAR ?auto_16804 ) ( IS-CRATE ?auto_16803 ) ( not ( = ?auto_16803 ?auto_16804 ) ) ( TRUCK-AT ?auto_16807 ?auto_16806 ) ( AVAILABLE ?auto_16805 ) ( IN ?auto_16803 ?auto_16807 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16805 ?auto_16803 ?auto_16807 ?auto_16806 )
      ( MAKE-ON ?auto_16803 ?auto_16804 )
      ( MAKE-ON-VERIFY ?auto_16803 ?auto_16804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16808 - SURFACE
      ?auto_16809 - SURFACE
    )
    :vars
    (
      ?auto_16812 - HOIST
      ?auto_16810 - PLACE
      ?auto_16811 - TRUCK
      ?auto_16813 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16812 ?auto_16810 ) ( SURFACE-AT ?auto_16809 ?auto_16810 ) ( CLEAR ?auto_16809 ) ( IS-CRATE ?auto_16808 ) ( not ( = ?auto_16808 ?auto_16809 ) ) ( AVAILABLE ?auto_16812 ) ( IN ?auto_16808 ?auto_16811 ) ( TRUCK-AT ?auto_16811 ?auto_16813 ) ( not ( = ?auto_16813 ?auto_16810 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16811 ?auto_16813 ?auto_16810 )
      ( MAKE-ON ?auto_16808 ?auto_16809 )
      ( MAKE-ON-VERIFY ?auto_16808 ?auto_16809 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16814 - SURFACE
      ?auto_16815 - SURFACE
    )
    :vars
    (
      ?auto_16817 - HOIST
      ?auto_16818 - PLACE
      ?auto_16816 - TRUCK
      ?auto_16819 - PLACE
      ?auto_16820 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16817 ?auto_16818 ) ( SURFACE-AT ?auto_16815 ?auto_16818 ) ( CLEAR ?auto_16815 ) ( IS-CRATE ?auto_16814 ) ( not ( = ?auto_16814 ?auto_16815 ) ) ( AVAILABLE ?auto_16817 ) ( TRUCK-AT ?auto_16816 ?auto_16819 ) ( not ( = ?auto_16819 ?auto_16818 ) ) ( HOIST-AT ?auto_16820 ?auto_16819 ) ( LIFTING ?auto_16820 ?auto_16814 ) ( not ( = ?auto_16817 ?auto_16820 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16820 ?auto_16814 ?auto_16816 ?auto_16819 )
      ( MAKE-ON ?auto_16814 ?auto_16815 )
      ( MAKE-ON-VERIFY ?auto_16814 ?auto_16815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16821 - SURFACE
      ?auto_16822 - SURFACE
    )
    :vars
    (
      ?auto_16824 - HOIST
      ?auto_16823 - PLACE
      ?auto_16825 - TRUCK
      ?auto_16827 - PLACE
      ?auto_16826 - HOIST
      ?auto_16828 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16824 ?auto_16823 ) ( SURFACE-AT ?auto_16822 ?auto_16823 ) ( CLEAR ?auto_16822 ) ( IS-CRATE ?auto_16821 ) ( not ( = ?auto_16821 ?auto_16822 ) ) ( AVAILABLE ?auto_16824 ) ( TRUCK-AT ?auto_16825 ?auto_16827 ) ( not ( = ?auto_16827 ?auto_16823 ) ) ( HOIST-AT ?auto_16826 ?auto_16827 ) ( not ( = ?auto_16824 ?auto_16826 ) ) ( AVAILABLE ?auto_16826 ) ( SURFACE-AT ?auto_16821 ?auto_16827 ) ( ON ?auto_16821 ?auto_16828 ) ( CLEAR ?auto_16821 ) ( not ( = ?auto_16821 ?auto_16828 ) ) ( not ( = ?auto_16822 ?auto_16828 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16826 ?auto_16821 ?auto_16828 ?auto_16827 )
      ( MAKE-ON ?auto_16821 ?auto_16822 )
      ( MAKE-ON-VERIFY ?auto_16821 ?auto_16822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16829 - SURFACE
      ?auto_16830 - SURFACE
    )
    :vars
    (
      ?auto_16836 - HOIST
      ?auto_16833 - PLACE
      ?auto_16835 - PLACE
      ?auto_16832 - HOIST
      ?auto_16834 - SURFACE
      ?auto_16831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16836 ?auto_16833 ) ( SURFACE-AT ?auto_16830 ?auto_16833 ) ( CLEAR ?auto_16830 ) ( IS-CRATE ?auto_16829 ) ( not ( = ?auto_16829 ?auto_16830 ) ) ( AVAILABLE ?auto_16836 ) ( not ( = ?auto_16835 ?auto_16833 ) ) ( HOIST-AT ?auto_16832 ?auto_16835 ) ( not ( = ?auto_16836 ?auto_16832 ) ) ( AVAILABLE ?auto_16832 ) ( SURFACE-AT ?auto_16829 ?auto_16835 ) ( ON ?auto_16829 ?auto_16834 ) ( CLEAR ?auto_16829 ) ( not ( = ?auto_16829 ?auto_16834 ) ) ( not ( = ?auto_16830 ?auto_16834 ) ) ( TRUCK-AT ?auto_16831 ?auto_16833 ) )
    :subtasks
    ( ( !DRIVE ?auto_16831 ?auto_16833 ?auto_16835 )
      ( MAKE-ON ?auto_16829 ?auto_16830 )
      ( MAKE-ON-VERIFY ?auto_16829 ?auto_16830 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16837 - SURFACE
      ?auto_16838 - SURFACE
    )
    :vars
    (
      ?auto_16842 - HOIST
      ?auto_16839 - PLACE
      ?auto_16840 - PLACE
      ?auto_16844 - HOIST
      ?auto_16843 - SURFACE
      ?auto_16841 - TRUCK
      ?auto_16845 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16842 ?auto_16839 ) ( IS-CRATE ?auto_16837 ) ( not ( = ?auto_16837 ?auto_16838 ) ) ( not ( = ?auto_16840 ?auto_16839 ) ) ( HOIST-AT ?auto_16844 ?auto_16840 ) ( not ( = ?auto_16842 ?auto_16844 ) ) ( AVAILABLE ?auto_16844 ) ( SURFACE-AT ?auto_16837 ?auto_16840 ) ( ON ?auto_16837 ?auto_16843 ) ( CLEAR ?auto_16837 ) ( not ( = ?auto_16837 ?auto_16843 ) ) ( not ( = ?auto_16838 ?auto_16843 ) ) ( TRUCK-AT ?auto_16841 ?auto_16839 ) ( SURFACE-AT ?auto_16845 ?auto_16839 ) ( CLEAR ?auto_16845 ) ( LIFTING ?auto_16842 ?auto_16838 ) ( IS-CRATE ?auto_16838 ) ( not ( = ?auto_16837 ?auto_16845 ) ) ( not ( = ?auto_16838 ?auto_16845 ) ) ( not ( = ?auto_16843 ?auto_16845 ) ) )
    :subtasks
    ( ( !DROP ?auto_16842 ?auto_16838 ?auto_16845 ?auto_16839 )
      ( MAKE-ON ?auto_16837 ?auto_16838 )
      ( MAKE-ON-VERIFY ?auto_16837 ?auto_16838 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16846 - SURFACE
      ?auto_16847 - SURFACE
    )
    :vars
    (
      ?auto_16850 - HOIST
      ?auto_16849 - PLACE
      ?auto_16852 - PLACE
      ?auto_16851 - HOIST
      ?auto_16848 - SURFACE
      ?auto_16853 - TRUCK
      ?auto_16854 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16850 ?auto_16849 ) ( IS-CRATE ?auto_16846 ) ( not ( = ?auto_16846 ?auto_16847 ) ) ( not ( = ?auto_16852 ?auto_16849 ) ) ( HOIST-AT ?auto_16851 ?auto_16852 ) ( not ( = ?auto_16850 ?auto_16851 ) ) ( AVAILABLE ?auto_16851 ) ( SURFACE-AT ?auto_16846 ?auto_16852 ) ( ON ?auto_16846 ?auto_16848 ) ( CLEAR ?auto_16846 ) ( not ( = ?auto_16846 ?auto_16848 ) ) ( not ( = ?auto_16847 ?auto_16848 ) ) ( TRUCK-AT ?auto_16853 ?auto_16849 ) ( SURFACE-AT ?auto_16854 ?auto_16849 ) ( CLEAR ?auto_16854 ) ( IS-CRATE ?auto_16847 ) ( not ( = ?auto_16846 ?auto_16854 ) ) ( not ( = ?auto_16847 ?auto_16854 ) ) ( not ( = ?auto_16848 ?auto_16854 ) ) ( AVAILABLE ?auto_16850 ) ( IN ?auto_16847 ?auto_16853 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16850 ?auto_16847 ?auto_16853 ?auto_16849 )
      ( MAKE-ON ?auto_16846 ?auto_16847 )
      ( MAKE-ON-VERIFY ?auto_16846 ?auto_16847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16855 - SURFACE
      ?auto_16856 - SURFACE
    )
    :vars
    (
      ?auto_16862 - HOIST
      ?auto_16860 - PLACE
      ?auto_16859 - PLACE
      ?auto_16857 - HOIST
      ?auto_16858 - SURFACE
      ?auto_16861 - SURFACE
      ?auto_16863 - TRUCK
      ?auto_16864 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16862 ?auto_16860 ) ( IS-CRATE ?auto_16855 ) ( not ( = ?auto_16855 ?auto_16856 ) ) ( not ( = ?auto_16859 ?auto_16860 ) ) ( HOIST-AT ?auto_16857 ?auto_16859 ) ( not ( = ?auto_16862 ?auto_16857 ) ) ( AVAILABLE ?auto_16857 ) ( SURFACE-AT ?auto_16855 ?auto_16859 ) ( ON ?auto_16855 ?auto_16858 ) ( CLEAR ?auto_16855 ) ( not ( = ?auto_16855 ?auto_16858 ) ) ( not ( = ?auto_16856 ?auto_16858 ) ) ( SURFACE-AT ?auto_16861 ?auto_16860 ) ( CLEAR ?auto_16861 ) ( IS-CRATE ?auto_16856 ) ( not ( = ?auto_16855 ?auto_16861 ) ) ( not ( = ?auto_16856 ?auto_16861 ) ) ( not ( = ?auto_16858 ?auto_16861 ) ) ( AVAILABLE ?auto_16862 ) ( IN ?auto_16856 ?auto_16863 ) ( TRUCK-AT ?auto_16863 ?auto_16864 ) ( not ( = ?auto_16864 ?auto_16860 ) ) ( not ( = ?auto_16859 ?auto_16864 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16863 ?auto_16864 ?auto_16860 )
      ( MAKE-ON ?auto_16855 ?auto_16856 )
      ( MAKE-ON-VERIFY ?auto_16855 ?auto_16856 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16865 - SURFACE
      ?auto_16866 - SURFACE
    )
    :vars
    (
      ?auto_16873 - HOIST
      ?auto_16869 - PLACE
      ?auto_16872 - PLACE
      ?auto_16870 - HOIST
      ?auto_16868 - SURFACE
      ?auto_16867 - SURFACE
      ?auto_16871 - TRUCK
      ?auto_16874 - PLACE
      ?auto_16875 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16873 ?auto_16869 ) ( IS-CRATE ?auto_16865 ) ( not ( = ?auto_16865 ?auto_16866 ) ) ( not ( = ?auto_16872 ?auto_16869 ) ) ( HOIST-AT ?auto_16870 ?auto_16872 ) ( not ( = ?auto_16873 ?auto_16870 ) ) ( AVAILABLE ?auto_16870 ) ( SURFACE-AT ?auto_16865 ?auto_16872 ) ( ON ?auto_16865 ?auto_16868 ) ( CLEAR ?auto_16865 ) ( not ( = ?auto_16865 ?auto_16868 ) ) ( not ( = ?auto_16866 ?auto_16868 ) ) ( SURFACE-AT ?auto_16867 ?auto_16869 ) ( CLEAR ?auto_16867 ) ( IS-CRATE ?auto_16866 ) ( not ( = ?auto_16865 ?auto_16867 ) ) ( not ( = ?auto_16866 ?auto_16867 ) ) ( not ( = ?auto_16868 ?auto_16867 ) ) ( AVAILABLE ?auto_16873 ) ( TRUCK-AT ?auto_16871 ?auto_16874 ) ( not ( = ?auto_16874 ?auto_16869 ) ) ( not ( = ?auto_16872 ?auto_16874 ) ) ( HOIST-AT ?auto_16875 ?auto_16874 ) ( LIFTING ?auto_16875 ?auto_16866 ) ( not ( = ?auto_16873 ?auto_16875 ) ) ( not ( = ?auto_16870 ?auto_16875 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16875 ?auto_16866 ?auto_16871 ?auto_16874 )
      ( MAKE-ON ?auto_16865 ?auto_16866 )
      ( MAKE-ON-VERIFY ?auto_16865 ?auto_16866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16876 - SURFACE
      ?auto_16877 - SURFACE
    )
    :vars
    (
      ?auto_16886 - HOIST
      ?auto_16884 - PLACE
      ?auto_16883 - PLACE
      ?auto_16880 - HOIST
      ?auto_16881 - SURFACE
      ?auto_16885 - SURFACE
      ?auto_16882 - TRUCK
      ?auto_16879 - PLACE
      ?auto_16878 - HOIST
      ?auto_16887 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16886 ?auto_16884 ) ( IS-CRATE ?auto_16876 ) ( not ( = ?auto_16876 ?auto_16877 ) ) ( not ( = ?auto_16883 ?auto_16884 ) ) ( HOIST-AT ?auto_16880 ?auto_16883 ) ( not ( = ?auto_16886 ?auto_16880 ) ) ( AVAILABLE ?auto_16880 ) ( SURFACE-AT ?auto_16876 ?auto_16883 ) ( ON ?auto_16876 ?auto_16881 ) ( CLEAR ?auto_16876 ) ( not ( = ?auto_16876 ?auto_16881 ) ) ( not ( = ?auto_16877 ?auto_16881 ) ) ( SURFACE-AT ?auto_16885 ?auto_16884 ) ( CLEAR ?auto_16885 ) ( IS-CRATE ?auto_16877 ) ( not ( = ?auto_16876 ?auto_16885 ) ) ( not ( = ?auto_16877 ?auto_16885 ) ) ( not ( = ?auto_16881 ?auto_16885 ) ) ( AVAILABLE ?auto_16886 ) ( TRUCK-AT ?auto_16882 ?auto_16879 ) ( not ( = ?auto_16879 ?auto_16884 ) ) ( not ( = ?auto_16883 ?auto_16879 ) ) ( HOIST-AT ?auto_16878 ?auto_16879 ) ( not ( = ?auto_16886 ?auto_16878 ) ) ( not ( = ?auto_16880 ?auto_16878 ) ) ( AVAILABLE ?auto_16878 ) ( SURFACE-AT ?auto_16877 ?auto_16879 ) ( ON ?auto_16877 ?auto_16887 ) ( CLEAR ?auto_16877 ) ( not ( = ?auto_16876 ?auto_16887 ) ) ( not ( = ?auto_16877 ?auto_16887 ) ) ( not ( = ?auto_16881 ?auto_16887 ) ) ( not ( = ?auto_16885 ?auto_16887 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16878 ?auto_16877 ?auto_16887 ?auto_16879 )
      ( MAKE-ON ?auto_16876 ?auto_16877 )
      ( MAKE-ON-VERIFY ?auto_16876 ?auto_16877 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16888 - SURFACE
      ?auto_16889 - SURFACE
    )
    :vars
    (
      ?auto_16893 - HOIST
      ?auto_16891 - PLACE
      ?auto_16899 - PLACE
      ?auto_16898 - HOIST
      ?auto_16896 - SURFACE
      ?auto_16890 - SURFACE
      ?auto_16892 - PLACE
      ?auto_16894 - HOIST
      ?auto_16895 - SURFACE
      ?auto_16897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16893 ?auto_16891 ) ( IS-CRATE ?auto_16888 ) ( not ( = ?auto_16888 ?auto_16889 ) ) ( not ( = ?auto_16899 ?auto_16891 ) ) ( HOIST-AT ?auto_16898 ?auto_16899 ) ( not ( = ?auto_16893 ?auto_16898 ) ) ( AVAILABLE ?auto_16898 ) ( SURFACE-AT ?auto_16888 ?auto_16899 ) ( ON ?auto_16888 ?auto_16896 ) ( CLEAR ?auto_16888 ) ( not ( = ?auto_16888 ?auto_16896 ) ) ( not ( = ?auto_16889 ?auto_16896 ) ) ( SURFACE-AT ?auto_16890 ?auto_16891 ) ( CLEAR ?auto_16890 ) ( IS-CRATE ?auto_16889 ) ( not ( = ?auto_16888 ?auto_16890 ) ) ( not ( = ?auto_16889 ?auto_16890 ) ) ( not ( = ?auto_16896 ?auto_16890 ) ) ( AVAILABLE ?auto_16893 ) ( not ( = ?auto_16892 ?auto_16891 ) ) ( not ( = ?auto_16899 ?auto_16892 ) ) ( HOIST-AT ?auto_16894 ?auto_16892 ) ( not ( = ?auto_16893 ?auto_16894 ) ) ( not ( = ?auto_16898 ?auto_16894 ) ) ( AVAILABLE ?auto_16894 ) ( SURFACE-AT ?auto_16889 ?auto_16892 ) ( ON ?auto_16889 ?auto_16895 ) ( CLEAR ?auto_16889 ) ( not ( = ?auto_16888 ?auto_16895 ) ) ( not ( = ?auto_16889 ?auto_16895 ) ) ( not ( = ?auto_16896 ?auto_16895 ) ) ( not ( = ?auto_16890 ?auto_16895 ) ) ( TRUCK-AT ?auto_16897 ?auto_16891 ) )
    :subtasks
    ( ( !DRIVE ?auto_16897 ?auto_16891 ?auto_16892 )
      ( MAKE-ON ?auto_16888 ?auto_16889 )
      ( MAKE-ON-VERIFY ?auto_16888 ?auto_16889 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16900 - SURFACE
      ?auto_16901 - SURFACE
    )
    :vars
    (
      ?auto_16905 - HOIST
      ?auto_16911 - PLACE
      ?auto_16907 - PLACE
      ?auto_16902 - HOIST
      ?auto_16910 - SURFACE
      ?auto_16908 - SURFACE
      ?auto_16903 - PLACE
      ?auto_16909 - HOIST
      ?auto_16906 - SURFACE
      ?auto_16904 - TRUCK
      ?auto_16912 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16905 ?auto_16911 ) ( IS-CRATE ?auto_16900 ) ( not ( = ?auto_16900 ?auto_16901 ) ) ( not ( = ?auto_16907 ?auto_16911 ) ) ( HOIST-AT ?auto_16902 ?auto_16907 ) ( not ( = ?auto_16905 ?auto_16902 ) ) ( AVAILABLE ?auto_16902 ) ( SURFACE-AT ?auto_16900 ?auto_16907 ) ( ON ?auto_16900 ?auto_16910 ) ( CLEAR ?auto_16900 ) ( not ( = ?auto_16900 ?auto_16910 ) ) ( not ( = ?auto_16901 ?auto_16910 ) ) ( IS-CRATE ?auto_16901 ) ( not ( = ?auto_16900 ?auto_16908 ) ) ( not ( = ?auto_16901 ?auto_16908 ) ) ( not ( = ?auto_16910 ?auto_16908 ) ) ( not ( = ?auto_16903 ?auto_16911 ) ) ( not ( = ?auto_16907 ?auto_16903 ) ) ( HOIST-AT ?auto_16909 ?auto_16903 ) ( not ( = ?auto_16905 ?auto_16909 ) ) ( not ( = ?auto_16902 ?auto_16909 ) ) ( AVAILABLE ?auto_16909 ) ( SURFACE-AT ?auto_16901 ?auto_16903 ) ( ON ?auto_16901 ?auto_16906 ) ( CLEAR ?auto_16901 ) ( not ( = ?auto_16900 ?auto_16906 ) ) ( not ( = ?auto_16901 ?auto_16906 ) ) ( not ( = ?auto_16910 ?auto_16906 ) ) ( not ( = ?auto_16908 ?auto_16906 ) ) ( TRUCK-AT ?auto_16904 ?auto_16911 ) ( SURFACE-AT ?auto_16912 ?auto_16911 ) ( CLEAR ?auto_16912 ) ( LIFTING ?auto_16905 ?auto_16908 ) ( IS-CRATE ?auto_16908 ) ( not ( = ?auto_16900 ?auto_16912 ) ) ( not ( = ?auto_16901 ?auto_16912 ) ) ( not ( = ?auto_16910 ?auto_16912 ) ) ( not ( = ?auto_16908 ?auto_16912 ) ) ( not ( = ?auto_16906 ?auto_16912 ) ) )
    :subtasks
    ( ( !DROP ?auto_16905 ?auto_16908 ?auto_16912 ?auto_16911 )
      ( MAKE-ON ?auto_16900 ?auto_16901 )
      ( MAKE-ON-VERIFY ?auto_16900 ?auto_16901 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16913 - SURFACE
      ?auto_16914 - SURFACE
    )
    :vars
    (
      ?auto_16916 - HOIST
      ?auto_16921 - PLACE
      ?auto_16918 - PLACE
      ?auto_16919 - HOIST
      ?auto_16925 - SURFACE
      ?auto_16920 - SURFACE
      ?auto_16924 - PLACE
      ?auto_16915 - HOIST
      ?auto_16917 - SURFACE
      ?auto_16922 - TRUCK
      ?auto_16923 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16916 ?auto_16921 ) ( IS-CRATE ?auto_16913 ) ( not ( = ?auto_16913 ?auto_16914 ) ) ( not ( = ?auto_16918 ?auto_16921 ) ) ( HOIST-AT ?auto_16919 ?auto_16918 ) ( not ( = ?auto_16916 ?auto_16919 ) ) ( AVAILABLE ?auto_16919 ) ( SURFACE-AT ?auto_16913 ?auto_16918 ) ( ON ?auto_16913 ?auto_16925 ) ( CLEAR ?auto_16913 ) ( not ( = ?auto_16913 ?auto_16925 ) ) ( not ( = ?auto_16914 ?auto_16925 ) ) ( IS-CRATE ?auto_16914 ) ( not ( = ?auto_16913 ?auto_16920 ) ) ( not ( = ?auto_16914 ?auto_16920 ) ) ( not ( = ?auto_16925 ?auto_16920 ) ) ( not ( = ?auto_16924 ?auto_16921 ) ) ( not ( = ?auto_16918 ?auto_16924 ) ) ( HOIST-AT ?auto_16915 ?auto_16924 ) ( not ( = ?auto_16916 ?auto_16915 ) ) ( not ( = ?auto_16919 ?auto_16915 ) ) ( AVAILABLE ?auto_16915 ) ( SURFACE-AT ?auto_16914 ?auto_16924 ) ( ON ?auto_16914 ?auto_16917 ) ( CLEAR ?auto_16914 ) ( not ( = ?auto_16913 ?auto_16917 ) ) ( not ( = ?auto_16914 ?auto_16917 ) ) ( not ( = ?auto_16925 ?auto_16917 ) ) ( not ( = ?auto_16920 ?auto_16917 ) ) ( TRUCK-AT ?auto_16922 ?auto_16921 ) ( SURFACE-AT ?auto_16923 ?auto_16921 ) ( CLEAR ?auto_16923 ) ( IS-CRATE ?auto_16920 ) ( not ( = ?auto_16913 ?auto_16923 ) ) ( not ( = ?auto_16914 ?auto_16923 ) ) ( not ( = ?auto_16925 ?auto_16923 ) ) ( not ( = ?auto_16920 ?auto_16923 ) ) ( not ( = ?auto_16917 ?auto_16923 ) ) ( AVAILABLE ?auto_16916 ) ( IN ?auto_16920 ?auto_16922 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16916 ?auto_16920 ?auto_16922 ?auto_16921 )
      ( MAKE-ON ?auto_16913 ?auto_16914 )
      ( MAKE-ON-VERIFY ?auto_16913 ?auto_16914 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16926 - SURFACE
      ?auto_16927 - SURFACE
    )
    :vars
    (
      ?auto_16929 - HOIST
      ?auto_16933 - PLACE
      ?auto_16928 - PLACE
      ?auto_16938 - HOIST
      ?auto_16931 - SURFACE
      ?auto_16935 - SURFACE
      ?auto_16930 - PLACE
      ?auto_16937 - HOIST
      ?auto_16934 - SURFACE
      ?auto_16932 - SURFACE
      ?auto_16936 - TRUCK
      ?auto_16939 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16929 ?auto_16933 ) ( IS-CRATE ?auto_16926 ) ( not ( = ?auto_16926 ?auto_16927 ) ) ( not ( = ?auto_16928 ?auto_16933 ) ) ( HOIST-AT ?auto_16938 ?auto_16928 ) ( not ( = ?auto_16929 ?auto_16938 ) ) ( AVAILABLE ?auto_16938 ) ( SURFACE-AT ?auto_16926 ?auto_16928 ) ( ON ?auto_16926 ?auto_16931 ) ( CLEAR ?auto_16926 ) ( not ( = ?auto_16926 ?auto_16931 ) ) ( not ( = ?auto_16927 ?auto_16931 ) ) ( IS-CRATE ?auto_16927 ) ( not ( = ?auto_16926 ?auto_16935 ) ) ( not ( = ?auto_16927 ?auto_16935 ) ) ( not ( = ?auto_16931 ?auto_16935 ) ) ( not ( = ?auto_16930 ?auto_16933 ) ) ( not ( = ?auto_16928 ?auto_16930 ) ) ( HOIST-AT ?auto_16937 ?auto_16930 ) ( not ( = ?auto_16929 ?auto_16937 ) ) ( not ( = ?auto_16938 ?auto_16937 ) ) ( AVAILABLE ?auto_16937 ) ( SURFACE-AT ?auto_16927 ?auto_16930 ) ( ON ?auto_16927 ?auto_16934 ) ( CLEAR ?auto_16927 ) ( not ( = ?auto_16926 ?auto_16934 ) ) ( not ( = ?auto_16927 ?auto_16934 ) ) ( not ( = ?auto_16931 ?auto_16934 ) ) ( not ( = ?auto_16935 ?auto_16934 ) ) ( SURFACE-AT ?auto_16932 ?auto_16933 ) ( CLEAR ?auto_16932 ) ( IS-CRATE ?auto_16935 ) ( not ( = ?auto_16926 ?auto_16932 ) ) ( not ( = ?auto_16927 ?auto_16932 ) ) ( not ( = ?auto_16931 ?auto_16932 ) ) ( not ( = ?auto_16935 ?auto_16932 ) ) ( not ( = ?auto_16934 ?auto_16932 ) ) ( AVAILABLE ?auto_16929 ) ( IN ?auto_16935 ?auto_16936 ) ( TRUCK-AT ?auto_16936 ?auto_16939 ) ( not ( = ?auto_16939 ?auto_16933 ) ) ( not ( = ?auto_16928 ?auto_16939 ) ) ( not ( = ?auto_16930 ?auto_16939 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16936 ?auto_16939 ?auto_16933 )
      ( MAKE-ON ?auto_16926 ?auto_16927 )
      ( MAKE-ON-VERIFY ?auto_16926 ?auto_16927 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16940 - SURFACE
      ?auto_16941 - SURFACE
    )
    :vars
    (
      ?auto_16948 - HOIST
      ?auto_16944 - PLACE
      ?auto_16950 - PLACE
      ?auto_16945 - HOIST
      ?auto_16949 - SURFACE
      ?auto_16942 - SURFACE
      ?auto_16947 - PLACE
      ?auto_16943 - HOIST
      ?auto_16953 - SURFACE
      ?auto_16951 - SURFACE
      ?auto_16946 - TRUCK
      ?auto_16952 - PLACE
      ?auto_16954 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16948 ?auto_16944 ) ( IS-CRATE ?auto_16940 ) ( not ( = ?auto_16940 ?auto_16941 ) ) ( not ( = ?auto_16950 ?auto_16944 ) ) ( HOIST-AT ?auto_16945 ?auto_16950 ) ( not ( = ?auto_16948 ?auto_16945 ) ) ( AVAILABLE ?auto_16945 ) ( SURFACE-AT ?auto_16940 ?auto_16950 ) ( ON ?auto_16940 ?auto_16949 ) ( CLEAR ?auto_16940 ) ( not ( = ?auto_16940 ?auto_16949 ) ) ( not ( = ?auto_16941 ?auto_16949 ) ) ( IS-CRATE ?auto_16941 ) ( not ( = ?auto_16940 ?auto_16942 ) ) ( not ( = ?auto_16941 ?auto_16942 ) ) ( not ( = ?auto_16949 ?auto_16942 ) ) ( not ( = ?auto_16947 ?auto_16944 ) ) ( not ( = ?auto_16950 ?auto_16947 ) ) ( HOIST-AT ?auto_16943 ?auto_16947 ) ( not ( = ?auto_16948 ?auto_16943 ) ) ( not ( = ?auto_16945 ?auto_16943 ) ) ( AVAILABLE ?auto_16943 ) ( SURFACE-AT ?auto_16941 ?auto_16947 ) ( ON ?auto_16941 ?auto_16953 ) ( CLEAR ?auto_16941 ) ( not ( = ?auto_16940 ?auto_16953 ) ) ( not ( = ?auto_16941 ?auto_16953 ) ) ( not ( = ?auto_16949 ?auto_16953 ) ) ( not ( = ?auto_16942 ?auto_16953 ) ) ( SURFACE-AT ?auto_16951 ?auto_16944 ) ( CLEAR ?auto_16951 ) ( IS-CRATE ?auto_16942 ) ( not ( = ?auto_16940 ?auto_16951 ) ) ( not ( = ?auto_16941 ?auto_16951 ) ) ( not ( = ?auto_16949 ?auto_16951 ) ) ( not ( = ?auto_16942 ?auto_16951 ) ) ( not ( = ?auto_16953 ?auto_16951 ) ) ( AVAILABLE ?auto_16948 ) ( TRUCK-AT ?auto_16946 ?auto_16952 ) ( not ( = ?auto_16952 ?auto_16944 ) ) ( not ( = ?auto_16950 ?auto_16952 ) ) ( not ( = ?auto_16947 ?auto_16952 ) ) ( HOIST-AT ?auto_16954 ?auto_16952 ) ( LIFTING ?auto_16954 ?auto_16942 ) ( not ( = ?auto_16948 ?auto_16954 ) ) ( not ( = ?auto_16945 ?auto_16954 ) ) ( not ( = ?auto_16943 ?auto_16954 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16954 ?auto_16942 ?auto_16946 ?auto_16952 )
      ( MAKE-ON ?auto_16940 ?auto_16941 )
      ( MAKE-ON-VERIFY ?auto_16940 ?auto_16941 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16955 - SURFACE
      ?auto_16956 - SURFACE
    )
    :vars
    (
      ?auto_16962 - HOIST
      ?auto_16966 - PLACE
      ?auto_16967 - PLACE
      ?auto_16965 - HOIST
      ?auto_16959 - SURFACE
      ?auto_16964 - SURFACE
      ?auto_16960 - PLACE
      ?auto_16958 - HOIST
      ?auto_16963 - SURFACE
      ?auto_16968 - SURFACE
      ?auto_16969 - TRUCK
      ?auto_16961 - PLACE
      ?auto_16957 - HOIST
      ?auto_16970 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16962 ?auto_16966 ) ( IS-CRATE ?auto_16955 ) ( not ( = ?auto_16955 ?auto_16956 ) ) ( not ( = ?auto_16967 ?auto_16966 ) ) ( HOIST-AT ?auto_16965 ?auto_16967 ) ( not ( = ?auto_16962 ?auto_16965 ) ) ( AVAILABLE ?auto_16965 ) ( SURFACE-AT ?auto_16955 ?auto_16967 ) ( ON ?auto_16955 ?auto_16959 ) ( CLEAR ?auto_16955 ) ( not ( = ?auto_16955 ?auto_16959 ) ) ( not ( = ?auto_16956 ?auto_16959 ) ) ( IS-CRATE ?auto_16956 ) ( not ( = ?auto_16955 ?auto_16964 ) ) ( not ( = ?auto_16956 ?auto_16964 ) ) ( not ( = ?auto_16959 ?auto_16964 ) ) ( not ( = ?auto_16960 ?auto_16966 ) ) ( not ( = ?auto_16967 ?auto_16960 ) ) ( HOIST-AT ?auto_16958 ?auto_16960 ) ( not ( = ?auto_16962 ?auto_16958 ) ) ( not ( = ?auto_16965 ?auto_16958 ) ) ( AVAILABLE ?auto_16958 ) ( SURFACE-AT ?auto_16956 ?auto_16960 ) ( ON ?auto_16956 ?auto_16963 ) ( CLEAR ?auto_16956 ) ( not ( = ?auto_16955 ?auto_16963 ) ) ( not ( = ?auto_16956 ?auto_16963 ) ) ( not ( = ?auto_16959 ?auto_16963 ) ) ( not ( = ?auto_16964 ?auto_16963 ) ) ( SURFACE-AT ?auto_16968 ?auto_16966 ) ( CLEAR ?auto_16968 ) ( IS-CRATE ?auto_16964 ) ( not ( = ?auto_16955 ?auto_16968 ) ) ( not ( = ?auto_16956 ?auto_16968 ) ) ( not ( = ?auto_16959 ?auto_16968 ) ) ( not ( = ?auto_16964 ?auto_16968 ) ) ( not ( = ?auto_16963 ?auto_16968 ) ) ( AVAILABLE ?auto_16962 ) ( TRUCK-AT ?auto_16969 ?auto_16961 ) ( not ( = ?auto_16961 ?auto_16966 ) ) ( not ( = ?auto_16967 ?auto_16961 ) ) ( not ( = ?auto_16960 ?auto_16961 ) ) ( HOIST-AT ?auto_16957 ?auto_16961 ) ( not ( = ?auto_16962 ?auto_16957 ) ) ( not ( = ?auto_16965 ?auto_16957 ) ) ( not ( = ?auto_16958 ?auto_16957 ) ) ( AVAILABLE ?auto_16957 ) ( SURFACE-AT ?auto_16964 ?auto_16961 ) ( ON ?auto_16964 ?auto_16970 ) ( CLEAR ?auto_16964 ) ( not ( = ?auto_16955 ?auto_16970 ) ) ( not ( = ?auto_16956 ?auto_16970 ) ) ( not ( = ?auto_16959 ?auto_16970 ) ) ( not ( = ?auto_16964 ?auto_16970 ) ) ( not ( = ?auto_16963 ?auto_16970 ) ) ( not ( = ?auto_16968 ?auto_16970 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16957 ?auto_16964 ?auto_16970 ?auto_16961 )
      ( MAKE-ON ?auto_16955 ?auto_16956 )
      ( MAKE-ON-VERIFY ?auto_16955 ?auto_16956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16971 - SURFACE
      ?auto_16972 - SURFACE
    )
    :vars
    (
      ?auto_16984 - HOIST
      ?auto_16976 - PLACE
      ?auto_16983 - PLACE
      ?auto_16981 - HOIST
      ?auto_16974 - SURFACE
      ?auto_16977 - SURFACE
      ?auto_16978 - PLACE
      ?auto_16979 - HOIST
      ?auto_16973 - SURFACE
      ?auto_16982 - SURFACE
      ?auto_16986 - PLACE
      ?auto_16980 - HOIST
      ?auto_16985 - SURFACE
      ?auto_16975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16984 ?auto_16976 ) ( IS-CRATE ?auto_16971 ) ( not ( = ?auto_16971 ?auto_16972 ) ) ( not ( = ?auto_16983 ?auto_16976 ) ) ( HOIST-AT ?auto_16981 ?auto_16983 ) ( not ( = ?auto_16984 ?auto_16981 ) ) ( AVAILABLE ?auto_16981 ) ( SURFACE-AT ?auto_16971 ?auto_16983 ) ( ON ?auto_16971 ?auto_16974 ) ( CLEAR ?auto_16971 ) ( not ( = ?auto_16971 ?auto_16974 ) ) ( not ( = ?auto_16972 ?auto_16974 ) ) ( IS-CRATE ?auto_16972 ) ( not ( = ?auto_16971 ?auto_16977 ) ) ( not ( = ?auto_16972 ?auto_16977 ) ) ( not ( = ?auto_16974 ?auto_16977 ) ) ( not ( = ?auto_16978 ?auto_16976 ) ) ( not ( = ?auto_16983 ?auto_16978 ) ) ( HOIST-AT ?auto_16979 ?auto_16978 ) ( not ( = ?auto_16984 ?auto_16979 ) ) ( not ( = ?auto_16981 ?auto_16979 ) ) ( AVAILABLE ?auto_16979 ) ( SURFACE-AT ?auto_16972 ?auto_16978 ) ( ON ?auto_16972 ?auto_16973 ) ( CLEAR ?auto_16972 ) ( not ( = ?auto_16971 ?auto_16973 ) ) ( not ( = ?auto_16972 ?auto_16973 ) ) ( not ( = ?auto_16974 ?auto_16973 ) ) ( not ( = ?auto_16977 ?auto_16973 ) ) ( SURFACE-AT ?auto_16982 ?auto_16976 ) ( CLEAR ?auto_16982 ) ( IS-CRATE ?auto_16977 ) ( not ( = ?auto_16971 ?auto_16982 ) ) ( not ( = ?auto_16972 ?auto_16982 ) ) ( not ( = ?auto_16974 ?auto_16982 ) ) ( not ( = ?auto_16977 ?auto_16982 ) ) ( not ( = ?auto_16973 ?auto_16982 ) ) ( AVAILABLE ?auto_16984 ) ( not ( = ?auto_16986 ?auto_16976 ) ) ( not ( = ?auto_16983 ?auto_16986 ) ) ( not ( = ?auto_16978 ?auto_16986 ) ) ( HOIST-AT ?auto_16980 ?auto_16986 ) ( not ( = ?auto_16984 ?auto_16980 ) ) ( not ( = ?auto_16981 ?auto_16980 ) ) ( not ( = ?auto_16979 ?auto_16980 ) ) ( AVAILABLE ?auto_16980 ) ( SURFACE-AT ?auto_16977 ?auto_16986 ) ( ON ?auto_16977 ?auto_16985 ) ( CLEAR ?auto_16977 ) ( not ( = ?auto_16971 ?auto_16985 ) ) ( not ( = ?auto_16972 ?auto_16985 ) ) ( not ( = ?auto_16974 ?auto_16985 ) ) ( not ( = ?auto_16977 ?auto_16985 ) ) ( not ( = ?auto_16973 ?auto_16985 ) ) ( not ( = ?auto_16982 ?auto_16985 ) ) ( TRUCK-AT ?auto_16975 ?auto_16976 ) )
    :subtasks
    ( ( !DRIVE ?auto_16975 ?auto_16976 ?auto_16986 )
      ( MAKE-ON ?auto_16971 ?auto_16972 )
      ( MAKE-ON-VERIFY ?auto_16971 ?auto_16972 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16989 - SURFACE
      ?auto_16990 - SURFACE
    )
    :vars
    (
      ?auto_16991 - HOIST
      ?auto_16992 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16991 ?auto_16992 ) ( SURFACE-AT ?auto_16990 ?auto_16992 ) ( CLEAR ?auto_16990 ) ( LIFTING ?auto_16991 ?auto_16989 ) ( IS-CRATE ?auto_16989 ) ( not ( = ?auto_16989 ?auto_16990 ) ) )
    :subtasks
    ( ( !DROP ?auto_16991 ?auto_16989 ?auto_16990 ?auto_16992 )
      ( MAKE-ON-VERIFY ?auto_16989 ?auto_16990 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16993 - SURFACE
      ?auto_16994 - SURFACE
    )
    :vars
    (
      ?auto_16996 - HOIST
      ?auto_16995 - PLACE
      ?auto_16997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16996 ?auto_16995 ) ( SURFACE-AT ?auto_16994 ?auto_16995 ) ( CLEAR ?auto_16994 ) ( IS-CRATE ?auto_16993 ) ( not ( = ?auto_16993 ?auto_16994 ) ) ( TRUCK-AT ?auto_16997 ?auto_16995 ) ( AVAILABLE ?auto_16996 ) ( IN ?auto_16993 ?auto_16997 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16996 ?auto_16993 ?auto_16997 ?auto_16995 )
      ( MAKE-ON ?auto_16993 ?auto_16994 )
      ( MAKE-ON-VERIFY ?auto_16993 ?auto_16994 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_16998 - SURFACE
      ?auto_16999 - SURFACE
    )
    :vars
    (
      ?auto_17000 - HOIST
      ?auto_17002 - PLACE
      ?auto_17001 - TRUCK
      ?auto_17003 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17000 ?auto_17002 ) ( SURFACE-AT ?auto_16999 ?auto_17002 ) ( CLEAR ?auto_16999 ) ( IS-CRATE ?auto_16998 ) ( not ( = ?auto_16998 ?auto_16999 ) ) ( AVAILABLE ?auto_17000 ) ( IN ?auto_16998 ?auto_17001 ) ( TRUCK-AT ?auto_17001 ?auto_17003 ) ( not ( = ?auto_17003 ?auto_17002 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17001 ?auto_17003 ?auto_17002 )
      ( MAKE-ON ?auto_16998 ?auto_16999 )
      ( MAKE-ON-VERIFY ?auto_16998 ?auto_16999 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17004 - SURFACE
      ?auto_17005 - SURFACE
    )
    :vars
    (
      ?auto_17006 - HOIST
      ?auto_17008 - PLACE
      ?auto_17009 - TRUCK
      ?auto_17007 - PLACE
      ?auto_17010 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17006 ?auto_17008 ) ( SURFACE-AT ?auto_17005 ?auto_17008 ) ( CLEAR ?auto_17005 ) ( IS-CRATE ?auto_17004 ) ( not ( = ?auto_17004 ?auto_17005 ) ) ( AVAILABLE ?auto_17006 ) ( TRUCK-AT ?auto_17009 ?auto_17007 ) ( not ( = ?auto_17007 ?auto_17008 ) ) ( HOIST-AT ?auto_17010 ?auto_17007 ) ( LIFTING ?auto_17010 ?auto_17004 ) ( not ( = ?auto_17006 ?auto_17010 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17010 ?auto_17004 ?auto_17009 ?auto_17007 )
      ( MAKE-ON ?auto_17004 ?auto_17005 )
      ( MAKE-ON-VERIFY ?auto_17004 ?auto_17005 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17011 - SURFACE
      ?auto_17012 - SURFACE
    )
    :vars
    (
      ?auto_17016 - HOIST
      ?auto_17013 - PLACE
      ?auto_17014 - TRUCK
      ?auto_17015 - PLACE
      ?auto_17017 - HOIST
      ?auto_17018 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17016 ?auto_17013 ) ( SURFACE-AT ?auto_17012 ?auto_17013 ) ( CLEAR ?auto_17012 ) ( IS-CRATE ?auto_17011 ) ( not ( = ?auto_17011 ?auto_17012 ) ) ( AVAILABLE ?auto_17016 ) ( TRUCK-AT ?auto_17014 ?auto_17015 ) ( not ( = ?auto_17015 ?auto_17013 ) ) ( HOIST-AT ?auto_17017 ?auto_17015 ) ( not ( = ?auto_17016 ?auto_17017 ) ) ( AVAILABLE ?auto_17017 ) ( SURFACE-AT ?auto_17011 ?auto_17015 ) ( ON ?auto_17011 ?auto_17018 ) ( CLEAR ?auto_17011 ) ( not ( = ?auto_17011 ?auto_17018 ) ) ( not ( = ?auto_17012 ?auto_17018 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17017 ?auto_17011 ?auto_17018 ?auto_17015 )
      ( MAKE-ON ?auto_17011 ?auto_17012 )
      ( MAKE-ON-VERIFY ?auto_17011 ?auto_17012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17019 - SURFACE
      ?auto_17020 - SURFACE
    )
    :vars
    (
      ?auto_17022 - HOIST
      ?auto_17021 - PLACE
      ?auto_17024 - PLACE
      ?auto_17025 - HOIST
      ?auto_17026 - SURFACE
      ?auto_17023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17022 ?auto_17021 ) ( SURFACE-AT ?auto_17020 ?auto_17021 ) ( CLEAR ?auto_17020 ) ( IS-CRATE ?auto_17019 ) ( not ( = ?auto_17019 ?auto_17020 ) ) ( AVAILABLE ?auto_17022 ) ( not ( = ?auto_17024 ?auto_17021 ) ) ( HOIST-AT ?auto_17025 ?auto_17024 ) ( not ( = ?auto_17022 ?auto_17025 ) ) ( AVAILABLE ?auto_17025 ) ( SURFACE-AT ?auto_17019 ?auto_17024 ) ( ON ?auto_17019 ?auto_17026 ) ( CLEAR ?auto_17019 ) ( not ( = ?auto_17019 ?auto_17026 ) ) ( not ( = ?auto_17020 ?auto_17026 ) ) ( TRUCK-AT ?auto_17023 ?auto_17021 ) )
    :subtasks
    ( ( !DRIVE ?auto_17023 ?auto_17021 ?auto_17024 )
      ( MAKE-ON ?auto_17019 ?auto_17020 )
      ( MAKE-ON-VERIFY ?auto_17019 ?auto_17020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17027 - SURFACE
      ?auto_17028 - SURFACE
    )
    :vars
    (
      ?auto_17031 - HOIST
      ?auto_17032 - PLACE
      ?auto_17030 - PLACE
      ?auto_17033 - HOIST
      ?auto_17029 - SURFACE
      ?auto_17034 - TRUCK
      ?auto_17035 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17031 ?auto_17032 ) ( IS-CRATE ?auto_17027 ) ( not ( = ?auto_17027 ?auto_17028 ) ) ( not ( = ?auto_17030 ?auto_17032 ) ) ( HOIST-AT ?auto_17033 ?auto_17030 ) ( not ( = ?auto_17031 ?auto_17033 ) ) ( AVAILABLE ?auto_17033 ) ( SURFACE-AT ?auto_17027 ?auto_17030 ) ( ON ?auto_17027 ?auto_17029 ) ( CLEAR ?auto_17027 ) ( not ( = ?auto_17027 ?auto_17029 ) ) ( not ( = ?auto_17028 ?auto_17029 ) ) ( TRUCK-AT ?auto_17034 ?auto_17032 ) ( SURFACE-AT ?auto_17035 ?auto_17032 ) ( CLEAR ?auto_17035 ) ( LIFTING ?auto_17031 ?auto_17028 ) ( IS-CRATE ?auto_17028 ) ( not ( = ?auto_17027 ?auto_17035 ) ) ( not ( = ?auto_17028 ?auto_17035 ) ) ( not ( = ?auto_17029 ?auto_17035 ) ) )
    :subtasks
    ( ( !DROP ?auto_17031 ?auto_17028 ?auto_17035 ?auto_17032 )
      ( MAKE-ON ?auto_17027 ?auto_17028 )
      ( MAKE-ON-VERIFY ?auto_17027 ?auto_17028 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17036 - SURFACE
      ?auto_17037 - SURFACE
    )
    :vars
    (
      ?auto_17039 - HOIST
      ?auto_17044 - PLACE
      ?auto_17040 - PLACE
      ?auto_17043 - HOIST
      ?auto_17042 - SURFACE
      ?auto_17038 - TRUCK
      ?auto_17041 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17039 ?auto_17044 ) ( IS-CRATE ?auto_17036 ) ( not ( = ?auto_17036 ?auto_17037 ) ) ( not ( = ?auto_17040 ?auto_17044 ) ) ( HOIST-AT ?auto_17043 ?auto_17040 ) ( not ( = ?auto_17039 ?auto_17043 ) ) ( AVAILABLE ?auto_17043 ) ( SURFACE-AT ?auto_17036 ?auto_17040 ) ( ON ?auto_17036 ?auto_17042 ) ( CLEAR ?auto_17036 ) ( not ( = ?auto_17036 ?auto_17042 ) ) ( not ( = ?auto_17037 ?auto_17042 ) ) ( TRUCK-AT ?auto_17038 ?auto_17044 ) ( SURFACE-AT ?auto_17041 ?auto_17044 ) ( CLEAR ?auto_17041 ) ( IS-CRATE ?auto_17037 ) ( not ( = ?auto_17036 ?auto_17041 ) ) ( not ( = ?auto_17037 ?auto_17041 ) ) ( not ( = ?auto_17042 ?auto_17041 ) ) ( AVAILABLE ?auto_17039 ) ( IN ?auto_17037 ?auto_17038 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17039 ?auto_17037 ?auto_17038 ?auto_17044 )
      ( MAKE-ON ?auto_17036 ?auto_17037 )
      ( MAKE-ON-VERIFY ?auto_17036 ?auto_17037 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17045 - SURFACE
      ?auto_17046 - SURFACE
    )
    :vars
    (
      ?auto_17048 - HOIST
      ?auto_17051 - PLACE
      ?auto_17052 - PLACE
      ?auto_17053 - HOIST
      ?auto_17049 - SURFACE
      ?auto_17050 - SURFACE
      ?auto_17047 - TRUCK
      ?auto_17054 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17048 ?auto_17051 ) ( IS-CRATE ?auto_17045 ) ( not ( = ?auto_17045 ?auto_17046 ) ) ( not ( = ?auto_17052 ?auto_17051 ) ) ( HOIST-AT ?auto_17053 ?auto_17052 ) ( not ( = ?auto_17048 ?auto_17053 ) ) ( AVAILABLE ?auto_17053 ) ( SURFACE-AT ?auto_17045 ?auto_17052 ) ( ON ?auto_17045 ?auto_17049 ) ( CLEAR ?auto_17045 ) ( not ( = ?auto_17045 ?auto_17049 ) ) ( not ( = ?auto_17046 ?auto_17049 ) ) ( SURFACE-AT ?auto_17050 ?auto_17051 ) ( CLEAR ?auto_17050 ) ( IS-CRATE ?auto_17046 ) ( not ( = ?auto_17045 ?auto_17050 ) ) ( not ( = ?auto_17046 ?auto_17050 ) ) ( not ( = ?auto_17049 ?auto_17050 ) ) ( AVAILABLE ?auto_17048 ) ( IN ?auto_17046 ?auto_17047 ) ( TRUCK-AT ?auto_17047 ?auto_17054 ) ( not ( = ?auto_17054 ?auto_17051 ) ) ( not ( = ?auto_17052 ?auto_17054 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17047 ?auto_17054 ?auto_17051 )
      ( MAKE-ON ?auto_17045 ?auto_17046 )
      ( MAKE-ON-VERIFY ?auto_17045 ?auto_17046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17055 - SURFACE
      ?auto_17056 - SURFACE
    )
    :vars
    (
      ?auto_17060 - HOIST
      ?auto_17061 - PLACE
      ?auto_17063 - PLACE
      ?auto_17059 - HOIST
      ?auto_17057 - SURFACE
      ?auto_17064 - SURFACE
      ?auto_17062 - TRUCK
      ?auto_17058 - PLACE
      ?auto_17065 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17060 ?auto_17061 ) ( IS-CRATE ?auto_17055 ) ( not ( = ?auto_17055 ?auto_17056 ) ) ( not ( = ?auto_17063 ?auto_17061 ) ) ( HOIST-AT ?auto_17059 ?auto_17063 ) ( not ( = ?auto_17060 ?auto_17059 ) ) ( AVAILABLE ?auto_17059 ) ( SURFACE-AT ?auto_17055 ?auto_17063 ) ( ON ?auto_17055 ?auto_17057 ) ( CLEAR ?auto_17055 ) ( not ( = ?auto_17055 ?auto_17057 ) ) ( not ( = ?auto_17056 ?auto_17057 ) ) ( SURFACE-AT ?auto_17064 ?auto_17061 ) ( CLEAR ?auto_17064 ) ( IS-CRATE ?auto_17056 ) ( not ( = ?auto_17055 ?auto_17064 ) ) ( not ( = ?auto_17056 ?auto_17064 ) ) ( not ( = ?auto_17057 ?auto_17064 ) ) ( AVAILABLE ?auto_17060 ) ( TRUCK-AT ?auto_17062 ?auto_17058 ) ( not ( = ?auto_17058 ?auto_17061 ) ) ( not ( = ?auto_17063 ?auto_17058 ) ) ( HOIST-AT ?auto_17065 ?auto_17058 ) ( LIFTING ?auto_17065 ?auto_17056 ) ( not ( = ?auto_17060 ?auto_17065 ) ) ( not ( = ?auto_17059 ?auto_17065 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17065 ?auto_17056 ?auto_17062 ?auto_17058 )
      ( MAKE-ON ?auto_17055 ?auto_17056 )
      ( MAKE-ON-VERIFY ?auto_17055 ?auto_17056 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17066 - SURFACE
      ?auto_17067 - SURFACE
    )
    :vars
    (
      ?auto_17071 - HOIST
      ?auto_17068 - PLACE
      ?auto_17073 - PLACE
      ?auto_17070 - HOIST
      ?auto_17075 - SURFACE
      ?auto_17076 - SURFACE
      ?auto_17074 - TRUCK
      ?auto_17072 - PLACE
      ?auto_17069 - HOIST
      ?auto_17077 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17071 ?auto_17068 ) ( IS-CRATE ?auto_17066 ) ( not ( = ?auto_17066 ?auto_17067 ) ) ( not ( = ?auto_17073 ?auto_17068 ) ) ( HOIST-AT ?auto_17070 ?auto_17073 ) ( not ( = ?auto_17071 ?auto_17070 ) ) ( AVAILABLE ?auto_17070 ) ( SURFACE-AT ?auto_17066 ?auto_17073 ) ( ON ?auto_17066 ?auto_17075 ) ( CLEAR ?auto_17066 ) ( not ( = ?auto_17066 ?auto_17075 ) ) ( not ( = ?auto_17067 ?auto_17075 ) ) ( SURFACE-AT ?auto_17076 ?auto_17068 ) ( CLEAR ?auto_17076 ) ( IS-CRATE ?auto_17067 ) ( not ( = ?auto_17066 ?auto_17076 ) ) ( not ( = ?auto_17067 ?auto_17076 ) ) ( not ( = ?auto_17075 ?auto_17076 ) ) ( AVAILABLE ?auto_17071 ) ( TRUCK-AT ?auto_17074 ?auto_17072 ) ( not ( = ?auto_17072 ?auto_17068 ) ) ( not ( = ?auto_17073 ?auto_17072 ) ) ( HOIST-AT ?auto_17069 ?auto_17072 ) ( not ( = ?auto_17071 ?auto_17069 ) ) ( not ( = ?auto_17070 ?auto_17069 ) ) ( AVAILABLE ?auto_17069 ) ( SURFACE-AT ?auto_17067 ?auto_17072 ) ( ON ?auto_17067 ?auto_17077 ) ( CLEAR ?auto_17067 ) ( not ( = ?auto_17066 ?auto_17077 ) ) ( not ( = ?auto_17067 ?auto_17077 ) ) ( not ( = ?auto_17075 ?auto_17077 ) ) ( not ( = ?auto_17076 ?auto_17077 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17069 ?auto_17067 ?auto_17077 ?auto_17072 )
      ( MAKE-ON ?auto_17066 ?auto_17067 )
      ( MAKE-ON-VERIFY ?auto_17066 ?auto_17067 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17078 - SURFACE
      ?auto_17079 - SURFACE
    )
    :vars
    (
      ?auto_17080 - HOIST
      ?auto_17081 - PLACE
      ?auto_17082 - PLACE
      ?auto_17089 - HOIST
      ?auto_17088 - SURFACE
      ?auto_17085 - SURFACE
      ?auto_17084 - PLACE
      ?auto_17087 - HOIST
      ?auto_17083 - SURFACE
      ?auto_17086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17080 ?auto_17081 ) ( IS-CRATE ?auto_17078 ) ( not ( = ?auto_17078 ?auto_17079 ) ) ( not ( = ?auto_17082 ?auto_17081 ) ) ( HOIST-AT ?auto_17089 ?auto_17082 ) ( not ( = ?auto_17080 ?auto_17089 ) ) ( AVAILABLE ?auto_17089 ) ( SURFACE-AT ?auto_17078 ?auto_17082 ) ( ON ?auto_17078 ?auto_17088 ) ( CLEAR ?auto_17078 ) ( not ( = ?auto_17078 ?auto_17088 ) ) ( not ( = ?auto_17079 ?auto_17088 ) ) ( SURFACE-AT ?auto_17085 ?auto_17081 ) ( CLEAR ?auto_17085 ) ( IS-CRATE ?auto_17079 ) ( not ( = ?auto_17078 ?auto_17085 ) ) ( not ( = ?auto_17079 ?auto_17085 ) ) ( not ( = ?auto_17088 ?auto_17085 ) ) ( AVAILABLE ?auto_17080 ) ( not ( = ?auto_17084 ?auto_17081 ) ) ( not ( = ?auto_17082 ?auto_17084 ) ) ( HOIST-AT ?auto_17087 ?auto_17084 ) ( not ( = ?auto_17080 ?auto_17087 ) ) ( not ( = ?auto_17089 ?auto_17087 ) ) ( AVAILABLE ?auto_17087 ) ( SURFACE-AT ?auto_17079 ?auto_17084 ) ( ON ?auto_17079 ?auto_17083 ) ( CLEAR ?auto_17079 ) ( not ( = ?auto_17078 ?auto_17083 ) ) ( not ( = ?auto_17079 ?auto_17083 ) ) ( not ( = ?auto_17088 ?auto_17083 ) ) ( not ( = ?auto_17085 ?auto_17083 ) ) ( TRUCK-AT ?auto_17086 ?auto_17081 ) )
    :subtasks
    ( ( !DRIVE ?auto_17086 ?auto_17081 ?auto_17084 )
      ( MAKE-ON ?auto_17078 ?auto_17079 )
      ( MAKE-ON-VERIFY ?auto_17078 ?auto_17079 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17090 - SURFACE
      ?auto_17091 - SURFACE
    )
    :vars
    (
      ?auto_17101 - HOIST
      ?auto_17098 - PLACE
      ?auto_17093 - PLACE
      ?auto_17095 - HOIST
      ?auto_17096 - SURFACE
      ?auto_17100 - SURFACE
      ?auto_17092 - PLACE
      ?auto_17097 - HOIST
      ?auto_17094 - SURFACE
      ?auto_17099 - TRUCK
      ?auto_17102 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17101 ?auto_17098 ) ( IS-CRATE ?auto_17090 ) ( not ( = ?auto_17090 ?auto_17091 ) ) ( not ( = ?auto_17093 ?auto_17098 ) ) ( HOIST-AT ?auto_17095 ?auto_17093 ) ( not ( = ?auto_17101 ?auto_17095 ) ) ( AVAILABLE ?auto_17095 ) ( SURFACE-AT ?auto_17090 ?auto_17093 ) ( ON ?auto_17090 ?auto_17096 ) ( CLEAR ?auto_17090 ) ( not ( = ?auto_17090 ?auto_17096 ) ) ( not ( = ?auto_17091 ?auto_17096 ) ) ( IS-CRATE ?auto_17091 ) ( not ( = ?auto_17090 ?auto_17100 ) ) ( not ( = ?auto_17091 ?auto_17100 ) ) ( not ( = ?auto_17096 ?auto_17100 ) ) ( not ( = ?auto_17092 ?auto_17098 ) ) ( not ( = ?auto_17093 ?auto_17092 ) ) ( HOIST-AT ?auto_17097 ?auto_17092 ) ( not ( = ?auto_17101 ?auto_17097 ) ) ( not ( = ?auto_17095 ?auto_17097 ) ) ( AVAILABLE ?auto_17097 ) ( SURFACE-AT ?auto_17091 ?auto_17092 ) ( ON ?auto_17091 ?auto_17094 ) ( CLEAR ?auto_17091 ) ( not ( = ?auto_17090 ?auto_17094 ) ) ( not ( = ?auto_17091 ?auto_17094 ) ) ( not ( = ?auto_17096 ?auto_17094 ) ) ( not ( = ?auto_17100 ?auto_17094 ) ) ( TRUCK-AT ?auto_17099 ?auto_17098 ) ( SURFACE-AT ?auto_17102 ?auto_17098 ) ( CLEAR ?auto_17102 ) ( LIFTING ?auto_17101 ?auto_17100 ) ( IS-CRATE ?auto_17100 ) ( not ( = ?auto_17090 ?auto_17102 ) ) ( not ( = ?auto_17091 ?auto_17102 ) ) ( not ( = ?auto_17096 ?auto_17102 ) ) ( not ( = ?auto_17100 ?auto_17102 ) ) ( not ( = ?auto_17094 ?auto_17102 ) ) )
    :subtasks
    ( ( !DROP ?auto_17101 ?auto_17100 ?auto_17102 ?auto_17098 )
      ( MAKE-ON ?auto_17090 ?auto_17091 )
      ( MAKE-ON-VERIFY ?auto_17090 ?auto_17091 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17103 - SURFACE
      ?auto_17104 - SURFACE
    )
    :vars
    (
      ?auto_17105 - HOIST
      ?auto_17114 - PLACE
      ?auto_17107 - PLACE
      ?auto_17108 - HOIST
      ?auto_17110 - SURFACE
      ?auto_17112 - SURFACE
      ?auto_17111 - PLACE
      ?auto_17115 - HOIST
      ?auto_17113 - SURFACE
      ?auto_17106 - TRUCK
      ?auto_17109 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17105 ?auto_17114 ) ( IS-CRATE ?auto_17103 ) ( not ( = ?auto_17103 ?auto_17104 ) ) ( not ( = ?auto_17107 ?auto_17114 ) ) ( HOIST-AT ?auto_17108 ?auto_17107 ) ( not ( = ?auto_17105 ?auto_17108 ) ) ( AVAILABLE ?auto_17108 ) ( SURFACE-AT ?auto_17103 ?auto_17107 ) ( ON ?auto_17103 ?auto_17110 ) ( CLEAR ?auto_17103 ) ( not ( = ?auto_17103 ?auto_17110 ) ) ( not ( = ?auto_17104 ?auto_17110 ) ) ( IS-CRATE ?auto_17104 ) ( not ( = ?auto_17103 ?auto_17112 ) ) ( not ( = ?auto_17104 ?auto_17112 ) ) ( not ( = ?auto_17110 ?auto_17112 ) ) ( not ( = ?auto_17111 ?auto_17114 ) ) ( not ( = ?auto_17107 ?auto_17111 ) ) ( HOIST-AT ?auto_17115 ?auto_17111 ) ( not ( = ?auto_17105 ?auto_17115 ) ) ( not ( = ?auto_17108 ?auto_17115 ) ) ( AVAILABLE ?auto_17115 ) ( SURFACE-AT ?auto_17104 ?auto_17111 ) ( ON ?auto_17104 ?auto_17113 ) ( CLEAR ?auto_17104 ) ( not ( = ?auto_17103 ?auto_17113 ) ) ( not ( = ?auto_17104 ?auto_17113 ) ) ( not ( = ?auto_17110 ?auto_17113 ) ) ( not ( = ?auto_17112 ?auto_17113 ) ) ( TRUCK-AT ?auto_17106 ?auto_17114 ) ( SURFACE-AT ?auto_17109 ?auto_17114 ) ( CLEAR ?auto_17109 ) ( IS-CRATE ?auto_17112 ) ( not ( = ?auto_17103 ?auto_17109 ) ) ( not ( = ?auto_17104 ?auto_17109 ) ) ( not ( = ?auto_17110 ?auto_17109 ) ) ( not ( = ?auto_17112 ?auto_17109 ) ) ( not ( = ?auto_17113 ?auto_17109 ) ) ( AVAILABLE ?auto_17105 ) ( IN ?auto_17112 ?auto_17106 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17105 ?auto_17112 ?auto_17106 ?auto_17114 )
      ( MAKE-ON ?auto_17103 ?auto_17104 )
      ( MAKE-ON-VERIFY ?auto_17103 ?auto_17104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17116 - SURFACE
      ?auto_17117 - SURFACE
    )
    :vars
    (
      ?auto_17125 - HOIST
      ?auto_17118 - PLACE
      ?auto_17126 - PLACE
      ?auto_17128 - HOIST
      ?auto_17121 - SURFACE
      ?auto_17124 - SURFACE
      ?auto_17122 - PLACE
      ?auto_17123 - HOIST
      ?auto_17127 - SURFACE
      ?auto_17120 - SURFACE
      ?auto_17119 - TRUCK
      ?auto_17129 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17125 ?auto_17118 ) ( IS-CRATE ?auto_17116 ) ( not ( = ?auto_17116 ?auto_17117 ) ) ( not ( = ?auto_17126 ?auto_17118 ) ) ( HOIST-AT ?auto_17128 ?auto_17126 ) ( not ( = ?auto_17125 ?auto_17128 ) ) ( AVAILABLE ?auto_17128 ) ( SURFACE-AT ?auto_17116 ?auto_17126 ) ( ON ?auto_17116 ?auto_17121 ) ( CLEAR ?auto_17116 ) ( not ( = ?auto_17116 ?auto_17121 ) ) ( not ( = ?auto_17117 ?auto_17121 ) ) ( IS-CRATE ?auto_17117 ) ( not ( = ?auto_17116 ?auto_17124 ) ) ( not ( = ?auto_17117 ?auto_17124 ) ) ( not ( = ?auto_17121 ?auto_17124 ) ) ( not ( = ?auto_17122 ?auto_17118 ) ) ( not ( = ?auto_17126 ?auto_17122 ) ) ( HOIST-AT ?auto_17123 ?auto_17122 ) ( not ( = ?auto_17125 ?auto_17123 ) ) ( not ( = ?auto_17128 ?auto_17123 ) ) ( AVAILABLE ?auto_17123 ) ( SURFACE-AT ?auto_17117 ?auto_17122 ) ( ON ?auto_17117 ?auto_17127 ) ( CLEAR ?auto_17117 ) ( not ( = ?auto_17116 ?auto_17127 ) ) ( not ( = ?auto_17117 ?auto_17127 ) ) ( not ( = ?auto_17121 ?auto_17127 ) ) ( not ( = ?auto_17124 ?auto_17127 ) ) ( SURFACE-AT ?auto_17120 ?auto_17118 ) ( CLEAR ?auto_17120 ) ( IS-CRATE ?auto_17124 ) ( not ( = ?auto_17116 ?auto_17120 ) ) ( not ( = ?auto_17117 ?auto_17120 ) ) ( not ( = ?auto_17121 ?auto_17120 ) ) ( not ( = ?auto_17124 ?auto_17120 ) ) ( not ( = ?auto_17127 ?auto_17120 ) ) ( AVAILABLE ?auto_17125 ) ( IN ?auto_17124 ?auto_17119 ) ( TRUCK-AT ?auto_17119 ?auto_17129 ) ( not ( = ?auto_17129 ?auto_17118 ) ) ( not ( = ?auto_17126 ?auto_17129 ) ) ( not ( = ?auto_17122 ?auto_17129 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17119 ?auto_17129 ?auto_17118 )
      ( MAKE-ON ?auto_17116 ?auto_17117 )
      ( MAKE-ON-VERIFY ?auto_17116 ?auto_17117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17130 - SURFACE
      ?auto_17131 - SURFACE
    )
    :vars
    (
      ?auto_17140 - HOIST
      ?auto_17139 - PLACE
      ?auto_17133 - PLACE
      ?auto_17143 - HOIST
      ?auto_17137 - SURFACE
      ?auto_17134 - SURFACE
      ?auto_17135 - PLACE
      ?auto_17142 - HOIST
      ?auto_17141 - SURFACE
      ?auto_17132 - SURFACE
      ?auto_17138 - TRUCK
      ?auto_17136 - PLACE
      ?auto_17144 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17140 ?auto_17139 ) ( IS-CRATE ?auto_17130 ) ( not ( = ?auto_17130 ?auto_17131 ) ) ( not ( = ?auto_17133 ?auto_17139 ) ) ( HOIST-AT ?auto_17143 ?auto_17133 ) ( not ( = ?auto_17140 ?auto_17143 ) ) ( AVAILABLE ?auto_17143 ) ( SURFACE-AT ?auto_17130 ?auto_17133 ) ( ON ?auto_17130 ?auto_17137 ) ( CLEAR ?auto_17130 ) ( not ( = ?auto_17130 ?auto_17137 ) ) ( not ( = ?auto_17131 ?auto_17137 ) ) ( IS-CRATE ?auto_17131 ) ( not ( = ?auto_17130 ?auto_17134 ) ) ( not ( = ?auto_17131 ?auto_17134 ) ) ( not ( = ?auto_17137 ?auto_17134 ) ) ( not ( = ?auto_17135 ?auto_17139 ) ) ( not ( = ?auto_17133 ?auto_17135 ) ) ( HOIST-AT ?auto_17142 ?auto_17135 ) ( not ( = ?auto_17140 ?auto_17142 ) ) ( not ( = ?auto_17143 ?auto_17142 ) ) ( AVAILABLE ?auto_17142 ) ( SURFACE-AT ?auto_17131 ?auto_17135 ) ( ON ?auto_17131 ?auto_17141 ) ( CLEAR ?auto_17131 ) ( not ( = ?auto_17130 ?auto_17141 ) ) ( not ( = ?auto_17131 ?auto_17141 ) ) ( not ( = ?auto_17137 ?auto_17141 ) ) ( not ( = ?auto_17134 ?auto_17141 ) ) ( SURFACE-AT ?auto_17132 ?auto_17139 ) ( CLEAR ?auto_17132 ) ( IS-CRATE ?auto_17134 ) ( not ( = ?auto_17130 ?auto_17132 ) ) ( not ( = ?auto_17131 ?auto_17132 ) ) ( not ( = ?auto_17137 ?auto_17132 ) ) ( not ( = ?auto_17134 ?auto_17132 ) ) ( not ( = ?auto_17141 ?auto_17132 ) ) ( AVAILABLE ?auto_17140 ) ( TRUCK-AT ?auto_17138 ?auto_17136 ) ( not ( = ?auto_17136 ?auto_17139 ) ) ( not ( = ?auto_17133 ?auto_17136 ) ) ( not ( = ?auto_17135 ?auto_17136 ) ) ( HOIST-AT ?auto_17144 ?auto_17136 ) ( LIFTING ?auto_17144 ?auto_17134 ) ( not ( = ?auto_17140 ?auto_17144 ) ) ( not ( = ?auto_17143 ?auto_17144 ) ) ( not ( = ?auto_17142 ?auto_17144 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17144 ?auto_17134 ?auto_17138 ?auto_17136 )
      ( MAKE-ON ?auto_17130 ?auto_17131 )
      ( MAKE-ON-VERIFY ?auto_17130 ?auto_17131 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17145 - SURFACE
      ?auto_17146 - SURFACE
    )
    :vars
    (
      ?auto_17151 - HOIST
      ?auto_17152 - PLACE
      ?auto_17155 - PLACE
      ?auto_17156 - HOIST
      ?auto_17149 - SURFACE
      ?auto_17148 - SURFACE
      ?auto_17157 - PLACE
      ?auto_17158 - HOIST
      ?auto_17147 - SURFACE
      ?auto_17150 - SURFACE
      ?auto_17153 - TRUCK
      ?auto_17154 - PLACE
      ?auto_17159 - HOIST
      ?auto_17160 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17151 ?auto_17152 ) ( IS-CRATE ?auto_17145 ) ( not ( = ?auto_17145 ?auto_17146 ) ) ( not ( = ?auto_17155 ?auto_17152 ) ) ( HOIST-AT ?auto_17156 ?auto_17155 ) ( not ( = ?auto_17151 ?auto_17156 ) ) ( AVAILABLE ?auto_17156 ) ( SURFACE-AT ?auto_17145 ?auto_17155 ) ( ON ?auto_17145 ?auto_17149 ) ( CLEAR ?auto_17145 ) ( not ( = ?auto_17145 ?auto_17149 ) ) ( not ( = ?auto_17146 ?auto_17149 ) ) ( IS-CRATE ?auto_17146 ) ( not ( = ?auto_17145 ?auto_17148 ) ) ( not ( = ?auto_17146 ?auto_17148 ) ) ( not ( = ?auto_17149 ?auto_17148 ) ) ( not ( = ?auto_17157 ?auto_17152 ) ) ( not ( = ?auto_17155 ?auto_17157 ) ) ( HOIST-AT ?auto_17158 ?auto_17157 ) ( not ( = ?auto_17151 ?auto_17158 ) ) ( not ( = ?auto_17156 ?auto_17158 ) ) ( AVAILABLE ?auto_17158 ) ( SURFACE-AT ?auto_17146 ?auto_17157 ) ( ON ?auto_17146 ?auto_17147 ) ( CLEAR ?auto_17146 ) ( not ( = ?auto_17145 ?auto_17147 ) ) ( not ( = ?auto_17146 ?auto_17147 ) ) ( not ( = ?auto_17149 ?auto_17147 ) ) ( not ( = ?auto_17148 ?auto_17147 ) ) ( SURFACE-AT ?auto_17150 ?auto_17152 ) ( CLEAR ?auto_17150 ) ( IS-CRATE ?auto_17148 ) ( not ( = ?auto_17145 ?auto_17150 ) ) ( not ( = ?auto_17146 ?auto_17150 ) ) ( not ( = ?auto_17149 ?auto_17150 ) ) ( not ( = ?auto_17148 ?auto_17150 ) ) ( not ( = ?auto_17147 ?auto_17150 ) ) ( AVAILABLE ?auto_17151 ) ( TRUCK-AT ?auto_17153 ?auto_17154 ) ( not ( = ?auto_17154 ?auto_17152 ) ) ( not ( = ?auto_17155 ?auto_17154 ) ) ( not ( = ?auto_17157 ?auto_17154 ) ) ( HOIST-AT ?auto_17159 ?auto_17154 ) ( not ( = ?auto_17151 ?auto_17159 ) ) ( not ( = ?auto_17156 ?auto_17159 ) ) ( not ( = ?auto_17158 ?auto_17159 ) ) ( AVAILABLE ?auto_17159 ) ( SURFACE-AT ?auto_17148 ?auto_17154 ) ( ON ?auto_17148 ?auto_17160 ) ( CLEAR ?auto_17148 ) ( not ( = ?auto_17145 ?auto_17160 ) ) ( not ( = ?auto_17146 ?auto_17160 ) ) ( not ( = ?auto_17149 ?auto_17160 ) ) ( not ( = ?auto_17148 ?auto_17160 ) ) ( not ( = ?auto_17147 ?auto_17160 ) ) ( not ( = ?auto_17150 ?auto_17160 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17159 ?auto_17148 ?auto_17160 ?auto_17154 )
      ( MAKE-ON ?auto_17145 ?auto_17146 )
      ( MAKE-ON-VERIFY ?auto_17145 ?auto_17146 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17161 - SURFACE
      ?auto_17162 - SURFACE
    )
    :vars
    (
      ?auto_17176 - HOIST
      ?auto_17175 - PLACE
      ?auto_17168 - PLACE
      ?auto_17171 - HOIST
      ?auto_17172 - SURFACE
      ?auto_17173 - SURFACE
      ?auto_17166 - PLACE
      ?auto_17174 - HOIST
      ?auto_17169 - SURFACE
      ?auto_17167 - SURFACE
      ?auto_17163 - PLACE
      ?auto_17164 - HOIST
      ?auto_17170 - SURFACE
      ?auto_17165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17176 ?auto_17175 ) ( IS-CRATE ?auto_17161 ) ( not ( = ?auto_17161 ?auto_17162 ) ) ( not ( = ?auto_17168 ?auto_17175 ) ) ( HOIST-AT ?auto_17171 ?auto_17168 ) ( not ( = ?auto_17176 ?auto_17171 ) ) ( AVAILABLE ?auto_17171 ) ( SURFACE-AT ?auto_17161 ?auto_17168 ) ( ON ?auto_17161 ?auto_17172 ) ( CLEAR ?auto_17161 ) ( not ( = ?auto_17161 ?auto_17172 ) ) ( not ( = ?auto_17162 ?auto_17172 ) ) ( IS-CRATE ?auto_17162 ) ( not ( = ?auto_17161 ?auto_17173 ) ) ( not ( = ?auto_17162 ?auto_17173 ) ) ( not ( = ?auto_17172 ?auto_17173 ) ) ( not ( = ?auto_17166 ?auto_17175 ) ) ( not ( = ?auto_17168 ?auto_17166 ) ) ( HOIST-AT ?auto_17174 ?auto_17166 ) ( not ( = ?auto_17176 ?auto_17174 ) ) ( not ( = ?auto_17171 ?auto_17174 ) ) ( AVAILABLE ?auto_17174 ) ( SURFACE-AT ?auto_17162 ?auto_17166 ) ( ON ?auto_17162 ?auto_17169 ) ( CLEAR ?auto_17162 ) ( not ( = ?auto_17161 ?auto_17169 ) ) ( not ( = ?auto_17162 ?auto_17169 ) ) ( not ( = ?auto_17172 ?auto_17169 ) ) ( not ( = ?auto_17173 ?auto_17169 ) ) ( SURFACE-AT ?auto_17167 ?auto_17175 ) ( CLEAR ?auto_17167 ) ( IS-CRATE ?auto_17173 ) ( not ( = ?auto_17161 ?auto_17167 ) ) ( not ( = ?auto_17162 ?auto_17167 ) ) ( not ( = ?auto_17172 ?auto_17167 ) ) ( not ( = ?auto_17173 ?auto_17167 ) ) ( not ( = ?auto_17169 ?auto_17167 ) ) ( AVAILABLE ?auto_17176 ) ( not ( = ?auto_17163 ?auto_17175 ) ) ( not ( = ?auto_17168 ?auto_17163 ) ) ( not ( = ?auto_17166 ?auto_17163 ) ) ( HOIST-AT ?auto_17164 ?auto_17163 ) ( not ( = ?auto_17176 ?auto_17164 ) ) ( not ( = ?auto_17171 ?auto_17164 ) ) ( not ( = ?auto_17174 ?auto_17164 ) ) ( AVAILABLE ?auto_17164 ) ( SURFACE-AT ?auto_17173 ?auto_17163 ) ( ON ?auto_17173 ?auto_17170 ) ( CLEAR ?auto_17173 ) ( not ( = ?auto_17161 ?auto_17170 ) ) ( not ( = ?auto_17162 ?auto_17170 ) ) ( not ( = ?auto_17172 ?auto_17170 ) ) ( not ( = ?auto_17173 ?auto_17170 ) ) ( not ( = ?auto_17169 ?auto_17170 ) ) ( not ( = ?auto_17167 ?auto_17170 ) ) ( TRUCK-AT ?auto_17165 ?auto_17175 ) )
    :subtasks
    ( ( !DRIVE ?auto_17165 ?auto_17175 ?auto_17163 )
      ( MAKE-ON ?auto_17161 ?auto_17162 )
      ( MAKE-ON-VERIFY ?auto_17161 ?auto_17162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17177 - SURFACE
      ?auto_17178 - SURFACE
    )
    :vars
    (
      ?auto_17186 - HOIST
      ?auto_17189 - PLACE
      ?auto_17180 - PLACE
      ?auto_17183 - HOIST
      ?auto_17179 - SURFACE
      ?auto_17187 - SURFACE
      ?auto_17185 - PLACE
      ?auto_17181 - HOIST
      ?auto_17188 - SURFACE
      ?auto_17190 - SURFACE
      ?auto_17184 - PLACE
      ?auto_17191 - HOIST
      ?auto_17182 - SURFACE
      ?auto_17192 - TRUCK
      ?auto_17193 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17186 ?auto_17189 ) ( IS-CRATE ?auto_17177 ) ( not ( = ?auto_17177 ?auto_17178 ) ) ( not ( = ?auto_17180 ?auto_17189 ) ) ( HOIST-AT ?auto_17183 ?auto_17180 ) ( not ( = ?auto_17186 ?auto_17183 ) ) ( AVAILABLE ?auto_17183 ) ( SURFACE-AT ?auto_17177 ?auto_17180 ) ( ON ?auto_17177 ?auto_17179 ) ( CLEAR ?auto_17177 ) ( not ( = ?auto_17177 ?auto_17179 ) ) ( not ( = ?auto_17178 ?auto_17179 ) ) ( IS-CRATE ?auto_17178 ) ( not ( = ?auto_17177 ?auto_17187 ) ) ( not ( = ?auto_17178 ?auto_17187 ) ) ( not ( = ?auto_17179 ?auto_17187 ) ) ( not ( = ?auto_17185 ?auto_17189 ) ) ( not ( = ?auto_17180 ?auto_17185 ) ) ( HOIST-AT ?auto_17181 ?auto_17185 ) ( not ( = ?auto_17186 ?auto_17181 ) ) ( not ( = ?auto_17183 ?auto_17181 ) ) ( AVAILABLE ?auto_17181 ) ( SURFACE-AT ?auto_17178 ?auto_17185 ) ( ON ?auto_17178 ?auto_17188 ) ( CLEAR ?auto_17178 ) ( not ( = ?auto_17177 ?auto_17188 ) ) ( not ( = ?auto_17178 ?auto_17188 ) ) ( not ( = ?auto_17179 ?auto_17188 ) ) ( not ( = ?auto_17187 ?auto_17188 ) ) ( IS-CRATE ?auto_17187 ) ( not ( = ?auto_17177 ?auto_17190 ) ) ( not ( = ?auto_17178 ?auto_17190 ) ) ( not ( = ?auto_17179 ?auto_17190 ) ) ( not ( = ?auto_17187 ?auto_17190 ) ) ( not ( = ?auto_17188 ?auto_17190 ) ) ( not ( = ?auto_17184 ?auto_17189 ) ) ( not ( = ?auto_17180 ?auto_17184 ) ) ( not ( = ?auto_17185 ?auto_17184 ) ) ( HOIST-AT ?auto_17191 ?auto_17184 ) ( not ( = ?auto_17186 ?auto_17191 ) ) ( not ( = ?auto_17183 ?auto_17191 ) ) ( not ( = ?auto_17181 ?auto_17191 ) ) ( AVAILABLE ?auto_17191 ) ( SURFACE-AT ?auto_17187 ?auto_17184 ) ( ON ?auto_17187 ?auto_17182 ) ( CLEAR ?auto_17187 ) ( not ( = ?auto_17177 ?auto_17182 ) ) ( not ( = ?auto_17178 ?auto_17182 ) ) ( not ( = ?auto_17179 ?auto_17182 ) ) ( not ( = ?auto_17187 ?auto_17182 ) ) ( not ( = ?auto_17188 ?auto_17182 ) ) ( not ( = ?auto_17190 ?auto_17182 ) ) ( TRUCK-AT ?auto_17192 ?auto_17189 ) ( SURFACE-AT ?auto_17193 ?auto_17189 ) ( CLEAR ?auto_17193 ) ( LIFTING ?auto_17186 ?auto_17190 ) ( IS-CRATE ?auto_17190 ) ( not ( = ?auto_17177 ?auto_17193 ) ) ( not ( = ?auto_17178 ?auto_17193 ) ) ( not ( = ?auto_17179 ?auto_17193 ) ) ( not ( = ?auto_17187 ?auto_17193 ) ) ( not ( = ?auto_17188 ?auto_17193 ) ) ( not ( = ?auto_17190 ?auto_17193 ) ) ( not ( = ?auto_17182 ?auto_17193 ) ) )
    :subtasks
    ( ( !DROP ?auto_17186 ?auto_17190 ?auto_17193 ?auto_17189 )
      ( MAKE-ON ?auto_17177 ?auto_17178 )
      ( MAKE-ON-VERIFY ?auto_17177 ?auto_17178 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17194 - SURFACE
      ?auto_17195 - SURFACE
    )
    :vars
    (
      ?auto_17201 - HOIST
      ?auto_17198 - PLACE
      ?auto_17196 - PLACE
      ?auto_17210 - HOIST
      ?auto_17205 - SURFACE
      ?auto_17204 - SURFACE
      ?auto_17200 - PLACE
      ?auto_17206 - HOIST
      ?auto_17209 - SURFACE
      ?auto_17199 - SURFACE
      ?auto_17202 - PLACE
      ?auto_17207 - HOIST
      ?auto_17197 - SURFACE
      ?auto_17203 - TRUCK
      ?auto_17208 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17201 ?auto_17198 ) ( IS-CRATE ?auto_17194 ) ( not ( = ?auto_17194 ?auto_17195 ) ) ( not ( = ?auto_17196 ?auto_17198 ) ) ( HOIST-AT ?auto_17210 ?auto_17196 ) ( not ( = ?auto_17201 ?auto_17210 ) ) ( AVAILABLE ?auto_17210 ) ( SURFACE-AT ?auto_17194 ?auto_17196 ) ( ON ?auto_17194 ?auto_17205 ) ( CLEAR ?auto_17194 ) ( not ( = ?auto_17194 ?auto_17205 ) ) ( not ( = ?auto_17195 ?auto_17205 ) ) ( IS-CRATE ?auto_17195 ) ( not ( = ?auto_17194 ?auto_17204 ) ) ( not ( = ?auto_17195 ?auto_17204 ) ) ( not ( = ?auto_17205 ?auto_17204 ) ) ( not ( = ?auto_17200 ?auto_17198 ) ) ( not ( = ?auto_17196 ?auto_17200 ) ) ( HOIST-AT ?auto_17206 ?auto_17200 ) ( not ( = ?auto_17201 ?auto_17206 ) ) ( not ( = ?auto_17210 ?auto_17206 ) ) ( AVAILABLE ?auto_17206 ) ( SURFACE-AT ?auto_17195 ?auto_17200 ) ( ON ?auto_17195 ?auto_17209 ) ( CLEAR ?auto_17195 ) ( not ( = ?auto_17194 ?auto_17209 ) ) ( not ( = ?auto_17195 ?auto_17209 ) ) ( not ( = ?auto_17205 ?auto_17209 ) ) ( not ( = ?auto_17204 ?auto_17209 ) ) ( IS-CRATE ?auto_17204 ) ( not ( = ?auto_17194 ?auto_17199 ) ) ( not ( = ?auto_17195 ?auto_17199 ) ) ( not ( = ?auto_17205 ?auto_17199 ) ) ( not ( = ?auto_17204 ?auto_17199 ) ) ( not ( = ?auto_17209 ?auto_17199 ) ) ( not ( = ?auto_17202 ?auto_17198 ) ) ( not ( = ?auto_17196 ?auto_17202 ) ) ( not ( = ?auto_17200 ?auto_17202 ) ) ( HOIST-AT ?auto_17207 ?auto_17202 ) ( not ( = ?auto_17201 ?auto_17207 ) ) ( not ( = ?auto_17210 ?auto_17207 ) ) ( not ( = ?auto_17206 ?auto_17207 ) ) ( AVAILABLE ?auto_17207 ) ( SURFACE-AT ?auto_17204 ?auto_17202 ) ( ON ?auto_17204 ?auto_17197 ) ( CLEAR ?auto_17204 ) ( not ( = ?auto_17194 ?auto_17197 ) ) ( not ( = ?auto_17195 ?auto_17197 ) ) ( not ( = ?auto_17205 ?auto_17197 ) ) ( not ( = ?auto_17204 ?auto_17197 ) ) ( not ( = ?auto_17209 ?auto_17197 ) ) ( not ( = ?auto_17199 ?auto_17197 ) ) ( TRUCK-AT ?auto_17203 ?auto_17198 ) ( SURFACE-AT ?auto_17208 ?auto_17198 ) ( CLEAR ?auto_17208 ) ( IS-CRATE ?auto_17199 ) ( not ( = ?auto_17194 ?auto_17208 ) ) ( not ( = ?auto_17195 ?auto_17208 ) ) ( not ( = ?auto_17205 ?auto_17208 ) ) ( not ( = ?auto_17204 ?auto_17208 ) ) ( not ( = ?auto_17209 ?auto_17208 ) ) ( not ( = ?auto_17199 ?auto_17208 ) ) ( not ( = ?auto_17197 ?auto_17208 ) ) ( AVAILABLE ?auto_17201 ) ( IN ?auto_17199 ?auto_17203 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17201 ?auto_17199 ?auto_17203 ?auto_17198 )
      ( MAKE-ON ?auto_17194 ?auto_17195 )
      ( MAKE-ON-VERIFY ?auto_17194 ?auto_17195 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17211 - SURFACE
      ?auto_17212 - SURFACE
    )
    :vars
    (
      ?auto_17213 - HOIST
      ?auto_17220 - PLACE
      ?auto_17214 - PLACE
      ?auto_17217 - HOIST
      ?auto_17222 - SURFACE
      ?auto_17227 - SURFACE
      ?auto_17221 - PLACE
      ?auto_17223 - HOIST
      ?auto_17226 - SURFACE
      ?auto_17219 - SURFACE
      ?auto_17216 - PLACE
      ?auto_17215 - HOIST
      ?auto_17224 - SURFACE
      ?auto_17218 - SURFACE
      ?auto_17225 - TRUCK
      ?auto_17228 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17213 ?auto_17220 ) ( IS-CRATE ?auto_17211 ) ( not ( = ?auto_17211 ?auto_17212 ) ) ( not ( = ?auto_17214 ?auto_17220 ) ) ( HOIST-AT ?auto_17217 ?auto_17214 ) ( not ( = ?auto_17213 ?auto_17217 ) ) ( AVAILABLE ?auto_17217 ) ( SURFACE-AT ?auto_17211 ?auto_17214 ) ( ON ?auto_17211 ?auto_17222 ) ( CLEAR ?auto_17211 ) ( not ( = ?auto_17211 ?auto_17222 ) ) ( not ( = ?auto_17212 ?auto_17222 ) ) ( IS-CRATE ?auto_17212 ) ( not ( = ?auto_17211 ?auto_17227 ) ) ( not ( = ?auto_17212 ?auto_17227 ) ) ( not ( = ?auto_17222 ?auto_17227 ) ) ( not ( = ?auto_17221 ?auto_17220 ) ) ( not ( = ?auto_17214 ?auto_17221 ) ) ( HOIST-AT ?auto_17223 ?auto_17221 ) ( not ( = ?auto_17213 ?auto_17223 ) ) ( not ( = ?auto_17217 ?auto_17223 ) ) ( AVAILABLE ?auto_17223 ) ( SURFACE-AT ?auto_17212 ?auto_17221 ) ( ON ?auto_17212 ?auto_17226 ) ( CLEAR ?auto_17212 ) ( not ( = ?auto_17211 ?auto_17226 ) ) ( not ( = ?auto_17212 ?auto_17226 ) ) ( not ( = ?auto_17222 ?auto_17226 ) ) ( not ( = ?auto_17227 ?auto_17226 ) ) ( IS-CRATE ?auto_17227 ) ( not ( = ?auto_17211 ?auto_17219 ) ) ( not ( = ?auto_17212 ?auto_17219 ) ) ( not ( = ?auto_17222 ?auto_17219 ) ) ( not ( = ?auto_17227 ?auto_17219 ) ) ( not ( = ?auto_17226 ?auto_17219 ) ) ( not ( = ?auto_17216 ?auto_17220 ) ) ( not ( = ?auto_17214 ?auto_17216 ) ) ( not ( = ?auto_17221 ?auto_17216 ) ) ( HOIST-AT ?auto_17215 ?auto_17216 ) ( not ( = ?auto_17213 ?auto_17215 ) ) ( not ( = ?auto_17217 ?auto_17215 ) ) ( not ( = ?auto_17223 ?auto_17215 ) ) ( AVAILABLE ?auto_17215 ) ( SURFACE-AT ?auto_17227 ?auto_17216 ) ( ON ?auto_17227 ?auto_17224 ) ( CLEAR ?auto_17227 ) ( not ( = ?auto_17211 ?auto_17224 ) ) ( not ( = ?auto_17212 ?auto_17224 ) ) ( not ( = ?auto_17222 ?auto_17224 ) ) ( not ( = ?auto_17227 ?auto_17224 ) ) ( not ( = ?auto_17226 ?auto_17224 ) ) ( not ( = ?auto_17219 ?auto_17224 ) ) ( SURFACE-AT ?auto_17218 ?auto_17220 ) ( CLEAR ?auto_17218 ) ( IS-CRATE ?auto_17219 ) ( not ( = ?auto_17211 ?auto_17218 ) ) ( not ( = ?auto_17212 ?auto_17218 ) ) ( not ( = ?auto_17222 ?auto_17218 ) ) ( not ( = ?auto_17227 ?auto_17218 ) ) ( not ( = ?auto_17226 ?auto_17218 ) ) ( not ( = ?auto_17219 ?auto_17218 ) ) ( not ( = ?auto_17224 ?auto_17218 ) ) ( AVAILABLE ?auto_17213 ) ( IN ?auto_17219 ?auto_17225 ) ( TRUCK-AT ?auto_17225 ?auto_17228 ) ( not ( = ?auto_17228 ?auto_17220 ) ) ( not ( = ?auto_17214 ?auto_17228 ) ) ( not ( = ?auto_17221 ?auto_17228 ) ) ( not ( = ?auto_17216 ?auto_17228 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17225 ?auto_17228 ?auto_17220 )
      ( MAKE-ON ?auto_17211 ?auto_17212 )
      ( MAKE-ON-VERIFY ?auto_17211 ?auto_17212 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17229 - SURFACE
      ?auto_17230 - SURFACE
    )
    :vars
    (
      ?auto_17236 - HOIST
      ?auto_17231 - PLACE
      ?auto_17244 - PLACE
      ?auto_17238 - HOIST
      ?auto_17237 - SURFACE
      ?auto_17233 - SURFACE
      ?auto_17241 - PLACE
      ?auto_17243 - HOIST
      ?auto_17234 - SURFACE
      ?auto_17246 - SURFACE
      ?auto_17232 - PLACE
      ?auto_17242 - HOIST
      ?auto_17239 - SURFACE
      ?auto_17235 - SURFACE
      ?auto_17245 - TRUCK
      ?auto_17240 - PLACE
      ?auto_17247 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17236 ?auto_17231 ) ( IS-CRATE ?auto_17229 ) ( not ( = ?auto_17229 ?auto_17230 ) ) ( not ( = ?auto_17244 ?auto_17231 ) ) ( HOIST-AT ?auto_17238 ?auto_17244 ) ( not ( = ?auto_17236 ?auto_17238 ) ) ( AVAILABLE ?auto_17238 ) ( SURFACE-AT ?auto_17229 ?auto_17244 ) ( ON ?auto_17229 ?auto_17237 ) ( CLEAR ?auto_17229 ) ( not ( = ?auto_17229 ?auto_17237 ) ) ( not ( = ?auto_17230 ?auto_17237 ) ) ( IS-CRATE ?auto_17230 ) ( not ( = ?auto_17229 ?auto_17233 ) ) ( not ( = ?auto_17230 ?auto_17233 ) ) ( not ( = ?auto_17237 ?auto_17233 ) ) ( not ( = ?auto_17241 ?auto_17231 ) ) ( not ( = ?auto_17244 ?auto_17241 ) ) ( HOIST-AT ?auto_17243 ?auto_17241 ) ( not ( = ?auto_17236 ?auto_17243 ) ) ( not ( = ?auto_17238 ?auto_17243 ) ) ( AVAILABLE ?auto_17243 ) ( SURFACE-AT ?auto_17230 ?auto_17241 ) ( ON ?auto_17230 ?auto_17234 ) ( CLEAR ?auto_17230 ) ( not ( = ?auto_17229 ?auto_17234 ) ) ( not ( = ?auto_17230 ?auto_17234 ) ) ( not ( = ?auto_17237 ?auto_17234 ) ) ( not ( = ?auto_17233 ?auto_17234 ) ) ( IS-CRATE ?auto_17233 ) ( not ( = ?auto_17229 ?auto_17246 ) ) ( not ( = ?auto_17230 ?auto_17246 ) ) ( not ( = ?auto_17237 ?auto_17246 ) ) ( not ( = ?auto_17233 ?auto_17246 ) ) ( not ( = ?auto_17234 ?auto_17246 ) ) ( not ( = ?auto_17232 ?auto_17231 ) ) ( not ( = ?auto_17244 ?auto_17232 ) ) ( not ( = ?auto_17241 ?auto_17232 ) ) ( HOIST-AT ?auto_17242 ?auto_17232 ) ( not ( = ?auto_17236 ?auto_17242 ) ) ( not ( = ?auto_17238 ?auto_17242 ) ) ( not ( = ?auto_17243 ?auto_17242 ) ) ( AVAILABLE ?auto_17242 ) ( SURFACE-AT ?auto_17233 ?auto_17232 ) ( ON ?auto_17233 ?auto_17239 ) ( CLEAR ?auto_17233 ) ( not ( = ?auto_17229 ?auto_17239 ) ) ( not ( = ?auto_17230 ?auto_17239 ) ) ( not ( = ?auto_17237 ?auto_17239 ) ) ( not ( = ?auto_17233 ?auto_17239 ) ) ( not ( = ?auto_17234 ?auto_17239 ) ) ( not ( = ?auto_17246 ?auto_17239 ) ) ( SURFACE-AT ?auto_17235 ?auto_17231 ) ( CLEAR ?auto_17235 ) ( IS-CRATE ?auto_17246 ) ( not ( = ?auto_17229 ?auto_17235 ) ) ( not ( = ?auto_17230 ?auto_17235 ) ) ( not ( = ?auto_17237 ?auto_17235 ) ) ( not ( = ?auto_17233 ?auto_17235 ) ) ( not ( = ?auto_17234 ?auto_17235 ) ) ( not ( = ?auto_17246 ?auto_17235 ) ) ( not ( = ?auto_17239 ?auto_17235 ) ) ( AVAILABLE ?auto_17236 ) ( TRUCK-AT ?auto_17245 ?auto_17240 ) ( not ( = ?auto_17240 ?auto_17231 ) ) ( not ( = ?auto_17244 ?auto_17240 ) ) ( not ( = ?auto_17241 ?auto_17240 ) ) ( not ( = ?auto_17232 ?auto_17240 ) ) ( HOIST-AT ?auto_17247 ?auto_17240 ) ( LIFTING ?auto_17247 ?auto_17246 ) ( not ( = ?auto_17236 ?auto_17247 ) ) ( not ( = ?auto_17238 ?auto_17247 ) ) ( not ( = ?auto_17243 ?auto_17247 ) ) ( not ( = ?auto_17242 ?auto_17247 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17247 ?auto_17246 ?auto_17245 ?auto_17240 )
      ( MAKE-ON ?auto_17229 ?auto_17230 )
      ( MAKE-ON-VERIFY ?auto_17229 ?auto_17230 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17248 - SURFACE
      ?auto_17249 - SURFACE
    )
    :vars
    (
      ?auto_17258 - HOIST
      ?auto_17266 - PLACE
      ?auto_17259 - PLACE
      ?auto_17252 - HOIST
      ?auto_17257 - SURFACE
      ?auto_17251 - SURFACE
      ?auto_17262 - PLACE
      ?auto_17263 - HOIST
      ?auto_17255 - SURFACE
      ?auto_17264 - SURFACE
      ?auto_17253 - PLACE
      ?auto_17260 - HOIST
      ?auto_17265 - SURFACE
      ?auto_17254 - SURFACE
      ?auto_17250 - TRUCK
      ?auto_17261 - PLACE
      ?auto_17256 - HOIST
      ?auto_17267 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17258 ?auto_17266 ) ( IS-CRATE ?auto_17248 ) ( not ( = ?auto_17248 ?auto_17249 ) ) ( not ( = ?auto_17259 ?auto_17266 ) ) ( HOIST-AT ?auto_17252 ?auto_17259 ) ( not ( = ?auto_17258 ?auto_17252 ) ) ( AVAILABLE ?auto_17252 ) ( SURFACE-AT ?auto_17248 ?auto_17259 ) ( ON ?auto_17248 ?auto_17257 ) ( CLEAR ?auto_17248 ) ( not ( = ?auto_17248 ?auto_17257 ) ) ( not ( = ?auto_17249 ?auto_17257 ) ) ( IS-CRATE ?auto_17249 ) ( not ( = ?auto_17248 ?auto_17251 ) ) ( not ( = ?auto_17249 ?auto_17251 ) ) ( not ( = ?auto_17257 ?auto_17251 ) ) ( not ( = ?auto_17262 ?auto_17266 ) ) ( not ( = ?auto_17259 ?auto_17262 ) ) ( HOIST-AT ?auto_17263 ?auto_17262 ) ( not ( = ?auto_17258 ?auto_17263 ) ) ( not ( = ?auto_17252 ?auto_17263 ) ) ( AVAILABLE ?auto_17263 ) ( SURFACE-AT ?auto_17249 ?auto_17262 ) ( ON ?auto_17249 ?auto_17255 ) ( CLEAR ?auto_17249 ) ( not ( = ?auto_17248 ?auto_17255 ) ) ( not ( = ?auto_17249 ?auto_17255 ) ) ( not ( = ?auto_17257 ?auto_17255 ) ) ( not ( = ?auto_17251 ?auto_17255 ) ) ( IS-CRATE ?auto_17251 ) ( not ( = ?auto_17248 ?auto_17264 ) ) ( not ( = ?auto_17249 ?auto_17264 ) ) ( not ( = ?auto_17257 ?auto_17264 ) ) ( not ( = ?auto_17251 ?auto_17264 ) ) ( not ( = ?auto_17255 ?auto_17264 ) ) ( not ( = ?auto_17253 ?auto_17266 ) ) ( not ( = ?auto_17259 ?auto_17253 ) ) ( not ( = ?auto_17262 ?auto_17253 ) ) ( HOIST-AT ?auto_17260 ?auto_17253 ) ( not ( = ?auto_17258 ?auto_17260 ) ) ( not ( = ?auto_17252 ?auto_17260 ) ) ( not ( = ?auto_17263 ?auto_17260 ) ) ( AVAILABLE ?auto_17260 ) ( SURFACE-AT ?auto_17251 ?auto_17253 ) ( ON ?auto_17251 ?auto_17265 ) ( CLEAR ?auto_17251 ) ( not ( = ?auto_17248 ?auto_17265 ) ) ( not ( = ?auto_17249 ?auto_17265 ) ) ( not ( = ?auto_17257 ?auto_17265 ) ) ( not ( = ?auto_17251 ?auto_17265 ) ) ( not ( = ?auto_17255 ?auto_17265 ) ) ( not ( = ?auto_17264 ?auto_17265 ) ) ( SURFACE-AT ?auto_17254 ?auto_17266 ) ( CLEAR ?auto_17254 ) ( IS-CRATE ?auto_17264 ) ( not ( = ?auto_17248 ?auto_17254 ) ) ( not ( = ?auto_17249 ?auto_17254 ) ) ( not ( = ?auto_17257 ?auto_17254 ) ) ( not ( = ?auto_17251 ?auto_17254 ) ) ( not ( = ?auto_17255 ?auto_17254 ) ) ( not ( = ?auto_17264 ?auto_17254 ) ) ( not ( = ?auto_17265 ?auto_17254 ) ) ( AVAILABLE ?auto_17258 ) ( TRUCK-AT ?auto_17250 ?auto_17261 ) ( not ( = ?auto_17261 ?auto_17266 ) ) ( not ( = ?auto_17259 ?auto_17261 ) ) ( not ( = ?auto_17262 ?auto_17261 ) ) ( not ( = ?auto_17253 ?auto_17261 ) ) ( HOIST-AT ?auto_17256 ?auto_17261 ) ( not ( = ?auto_17258 ?auto_17256 ) ) ( not ( = ?auto_17252 ?auto_17256 ) ) ( not ( = ?auto_17263 ?auto_17256 ) ) ( not ( = ?auto_17260 ?auto_17256 ) ) ( AVAILABLE ?auto_17256 ) ( SURFACE-AT ?auto_17264 ?auto_17261 ) ( ON ?auto_17264 ?auto_17267 ) ( CLEAR ?auto_17264 ) ( not ( = ?auto_17248 ?auto_17267 ) ) ( not ( = ?auto_17249 ?auto_17267 ) ) ( not ( = ?auto_17257 ?auto_17267 ) ) ( not ( = ?auto_17251 ?auto_17267 ) ) ( not ( = ?auto_17255 ?auto_17267 ) ) ( not ( = ?auto_17264 ?auto_17267 ) ) ( not ( = ?auto_17265 ?auto_17267 ) ) ( not ( = ?auto_17254 ?auto_17267 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17256 ?auto_17264 ?auto_17267 ?auto_17261 )
      ( MAKE-ON ?auto_17248 ?auto_17249 )
      ( MAKE-ON-VERIFY ?auto_17248 ?auto_17249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17268 - SURFACE
      ?auto_17269 - SURFACE
    )
    :vars
    (
      ?auto_17282 - HOIST
      ?auto_17270 - PLACE
      ?auto_17281 - PLACE
      ?auto_17287 - HOIST
      ?auto_17279 - SURFACE
      ?auto_17286 - SURFACE
      ?auto_17273 - PLACE
      ?auto_17276 - HOIST
      ?auto_17280 - SURFACE
      ?auto_17285 - SURFACE
      ?auto_17283 - PLACE
      ?auto_17274 - HOIST
      ?auto_17277 - SURFACE
      ?auto_17271 - SURFACE
      ?auto_17275 - PLACE
      ?auto_17284 - HOIST
      ?auto_17272 - SURFACE
      ?auto_17278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17282 ?auto_17270 ) ( IS-CRATE ?auto_17268 ) ( not ( = ?auto_17268 ?auto_17269 ) ) ( not ( = ?auto_17281 ?auto_17270 ) ) ( HOIST-AT ?auto_17287 ?auto_17281 ) ( not ( = ?auto_17282 ?auto_17287 ) ) ( AVAILABLE ?auto_17287 ) ( SURFACE-AT ?auto_17268 ?auto_17281 ) ( ON ?auto_17268 ?auto_17279 ) ( CLEAR ?auto_17268 ) ( not ( = ?auto_17268 ?auto_17279 ) ) ( not ( = ?auto_17269 ?auto_17279 ) ) ( IS-CRATE ?auto_17269 ) ( not ( = ?auto_17268 ?auto_17286 ) ) ( not ( = ?auto_17269 ?auto_17286 ) ) ( not ( = ?auto_17279 ?auto_17286 ) ) ( not ( = ?auto_17273 ?auto_17270 ) ) ( not ( = ?auto_17281 ?auto_17273 ) ) ( HOIST-AT ?auto_17276 ?auto_17273 ) ( not ( = ?auto_17282 ?auto_17276 ) ) ( not ( = ?auto_17287 ?auto_17276 ) ) ( AVAILABLE ?auto_17276 ) ( SURFACE-AT ?auto_17269 ?auto_17273 ) ( ON ?auto_17269 ?auto_17280 ) ( CLEAR ?auto_17269 ) ( not ( = ?auto_17268 ?auto_17280 ) ) ( not ( = ?auto_17269 ?auto_17280 ) ) ( not ( = ?auto_17279 ?auto_17280 ) ) ( not ( = ?auto_17286 ?auto_17280 ) ) ( IS-CRATE ?auto_17286 ) ( not ( = ?auto_17268 ?auto_17285 ) ) ( not ( = ?auto_17269 ?auto_17285 ) ) ( not ( = ?auto_17279 ?auto_17285 ) ) ( not ( = ?auto_17286 ?auto_17285 ) ) ( not ( = ?auto_17280 ?auto_17285 ) ) ( not ( = ?auto_17283 ?auto_17270 ) ) ( not ( = ?auto_17281 ?auto_17283 ) ) ( not ( = ?auto_17273 ?auto_17283 ) ) ( HOIST-AT ?auto_17274 ?auto_17283 ) ( not ( = ?auto_17282 ?auto_17274 ) ) ( not ( = ?auto_17287 ?auto_17274 ) ) ( not ( = ?auto_17276 ?auto_17274 ) ) ( AVAILABLE ?auto_17274 ) ( SURFACE-AT ?auto_17286 ?auto_17283 ) ( ON ?auto_17286 ?auto_17277 ) ( CLEAR ?auto_17286 ) ( not ( = ?auto_17268 ?auto_17277 ) ) ( not ( = ?auto_17269 ?auto_17277 ) ) ( not ( = ?auto_17279 ?auto_17277 ) ) ( not ( = ?auto_17286 ?auto_17277 ) ) ( not ( = ?auto_17280 ?auto_17277 ) ) ( not ( = ?auto_17285 ?auto_17277 ) ) ( SURFACE-AT ?auto_17271 ?auto_17270 ) ( CLEAR ?auto_17271 ) ( IS-CRATE ?auto_17285 ) ( not ( = ?auto_17268 ?auto_17271 ) ) ( not ( = ?auto_17269 ?auto_17271 ) ) ( not ( = ?auto_17279 ?auto_17271 ) ) ( not ( = ?auto_17286 ?auto_17271 ) ) ( not ( = ?auto_17280 ?auto_17271 ) ) ( not ( = ?auto_17285 ?auto_17271 ) ) ( not ( = ?auto_17277 ?auto_17271 ) ) ( AVAILABLE ?auto_17282 ) ( not ( = ?auto_17275 ?auto_17270 ) ) ( not ( = ?auto_17281 ?auto_17275 ) ) ( not ( = ?auto_17273 ?auto_17275 ) ) ( not ( = ?auto_17283 ?auto_17275 ) ) ( HOIST-AT ?auto_17284 ?auto_17275 ) ( not ( = ?auto_17282 ?auto_17284 ) ) ( not ( = ?auto_17287 ?auto_17284 ) ) ( not ( = ?auto_17276 ?auto_17284 ) ) ( not ( = ?auto_17274 ?auto_17284 ) ) ( AVAILABLE ?auto_17284 ) ( SURFACE-AT ?auto_17285 ?auto_17275 ) ( ON ?auto_17285 ?auto_17272 ) ( CLEAR ?auto_17285 ) ( not ( = ?auto_17268 ?auto_17272 ) ) ( not ( = ?auto_17269 ?auto_17272 ) ) ( not ( = ?auto_17279 ?auto_17272 ) ) ( not ( = ?auto_17286 ?auto_17272 ) ) ( not ( = ?auto_17280 ?auto_17272 ) ) ( not ( = ?auto_17285 ?auto_17272 ) ) ( not ( = ?auto_17277 ?auto_17272 ) ) ( not ( = ?auto_17271 ?auto_17272 ) ) ( TRUCK-AT ?auto_17278 ?auto_17270 ) )
    :subtasks
    ( ( !DRIVE ?auto_17278 ?auto_17270 ?auto_17275 )
      ( MAKE-ON ?auto_17268 ?auto_17269 )
      ( MAKE-ON-VERIFY ?auto_17268 ?auto_17269 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17290 - SURFACE
      ?auto_17291 - SURFACE
    )
    :vars
    (
      ?auto_17292 - HOIST
      ?auto_17293 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17292 ?auto_17293 ) ( SURFACE-AT ?auto_17291 ?auto_17293 ) ( CLEAR ?auto_17291 ) ( LIFTING ?auto_17292 ?auto_17290 ) ( IS-CRATE ?auto_17290 ) ( not ( = ?auto_17290 ?auto_17291 ) ) )
    :subtasks
    ( ( !DROP ?auto_17292 ?auto_17290 ?auto_17291 ?auto_17293 )
      ( MAKE-ON-VERIFY ?auto_17290 ?auto_17291 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17294 - SURFACE
      ?auto_17295 - SURFACE
    )
    :vars
    (
      ?auto_17296 - HOIST
      ?auto_17297 - PLACE
      ?auto_17298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17296 ?auto_17297 ) ( SURFACE-AT ?auto_17295 ?auto_17297 ) ( CLEAR ?auto_17295 ) ( IS-CRATE ?auto_17294 ) ( not ( = ?auto_17294 ?auto_17295 ) ) ( TRUCK-AT ?auto_17298 ?auto_17297 ) ( AVAILABLE ?auto_17296 ) ( IN ?auto_17294 ?auto_17298 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17296 ?auto_17294 ?auto_17298 ?auto_17297 )
      ( MAKE-ON ?auto_17294 ?auto_17295 )
      ( MAKE-ON-VERIFY ?auto_17294 ?auto_17295 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17299 - SURFACE
      ?auto_17300 - SURFACE
    )
    :vars
    (
      ?auto_17302 - HOIST
      ?auto_17303 - PLACE
      ?auto_17301 - TRUCK
      ?auto_17304 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17302 ?auto_17303 ) ( SURFACE-AT ?auto_17300 ?auto_17303 ) ( CLEAR ?auto_17300 ) ( IS-CRATE ?auto_17299 ) ( not ( = ?auto_17299 ?auto_17300 ) ) ( AVAILABLE ?auto_17302 ) ( IN ?auto_17299 ?auto_17301 ) ( TRUCK-AT ?auto_17301 ?auto_17304 ) ( not ( = ?auto_17304 ?auto_17303 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17301 ?auto_17304 ?auto_17303 )
      ( MAKE-ON ?auto_17299 ?auto_17300 )
      ( MAKE-ON-VERIFY ?auto_17299 ?auto_17300 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17305 - SURFACE
      ?auto_17306 - SURFACE
    )
    :vars
    (
      ?auto_17310 - HOIST
      ?auto_17308 - PLACE
      ?auto_17307 - TRUCK
      ?auto_17309 - PLACE
      ?auto_17311 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17310 ?auto_17308 ) ( SURFACE-AT ?auto_17306 ?auto_17308 ) ( CLEAR ?auto_17306 ) ( IS-CRATE ?auto_17305 ) ( not ( = ?auto_17305 ?auto_17306 ) ) ( AVAILABLE ?auto_17310 ) ( TRUCK-AT ?auto_17307 ?auto_17309 ) ( not ( = ?auto_17309 ?auto_17308 ) ) ( HOIST-AT ?auto_17311 ?auto_17309 ) ( LIFTING ?auto_17311 ?auto_17305 ) ( not ( = ?auto_17310 ?auto_17311 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17311 ?auto_17305 ?auto_17307 ?auto_17309 )
      ( MAKE-ON ?auto_17305 ?auto_17306 )
      ( MAKE-ON-VERIFY ?auto_17305 ?auto_17306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17312 - SURFACE
      ?auto_17313 - SURFACE
    )
    :vars
    (
      ?auto_17314 - HOIST
      ?auto_17318 - PLACE
      ?auto_17315 - TRUCK
      ?auto_17316 - PLACE
      ?auto_17317 - HOIST
      ?auto_17319 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17314 ?auto_17318 ) ( SURFACE-AT ?auto_17313 ?auto_17318 ) ( CLEAR ?auto_17313 ) ( IS-CRATE ?auto_17312 ) ( not ( = ?auto_17312 ?auto_17313 ) ) ( AVAILABLE ?auto_17314 ) ( TRUCK-AT ?auto_17315 ?auto_17316 ) ( not ( = ?auto_17316 ?auto_17318 ) ) ( HOIST-AT ?auto_17317 ?auto_17316 ) ( not ( = ?auto_17314 ?auto_17317 ) ) ( AVAILABLE ?auto_17317 ) ( SURFACE-AT ?auto_17312 ?auto_17316 ) ( ON ?auto_17312 ?auto_17319 ) ( CLEAR ?auto_17312 ) ( not ( = ?auto_17312 ?auto_17319 ) ) ( not ( = ?auto_17313 ?auto_17319 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17317 ?auto_17312 ?auto_17319 ?auto_17316 )
      ( MAKE-ON ?auto_17312 ?auto_17313 )
      ( MAKE-ON-VERIFY ?auto_17312 ?auto_17313 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17320 - SURFACE
      ?auto_17321 - SURFACE
    )
    :vars
    (
      ?auto_17327 - HOIST
      ?auto_17323 - PLACE
      ?auto_17325 - PLACE
      ?auto_17324 - HOIST
      ?auto_17322 - SURFACE
      ?auto_17326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17327 ?auto_17323 ) ( SURFACE-AT ?auto_17321 ?auto_17323 ) ( CLEAR ?auto_17321 ) ( IS-CRATE ?auto_17320 ) ( not ( = ?auto_17320 ?auto_17321 ) ) ( AVAILABLE ?auto_17327 ) ( not ( = ?auto_17325 ?auto_17323 ) ) ( HOIST-AT ?auto_17324 ?auto_17325 ) ( not ( = ?auto_17327 ?auto_17324 ) ) ( AVAILABLE ?auto_17324 ) ( SURFACE-AT ?auto_17320 ?auto_17325 ) ( ON ?auto_17320 ?auto_17322 ) ( CLEAR ?auto_17320 ) ( not ( = ?auto_17320 ?auto_17322 ) ) ( not ( = ?auto_17321 ?auto_17322 ) ) ( TRUCK-AT ?auto_17326 ?auto_17323 ) )
    :subtasks
    ( ( !DRIVE ?auto_17326 ?auto_17323 ?auto_17325 )
      ( MAKE-ON ?auto_17320 ?auto_17321 )
      ( MAKE-ON-VERIFY ?auto_17320 ?auto_17321 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17328 - SURFACE
      ?auto_17329 - SURFACE
    )
    :vars
    (
      ?auto_17330 - HOIST
      ?auto_17332 - PLACE
      ?auto_17334 - PLACE
      ?auto_17333 - HOIST
      ?auto_17335 - SURFACE
      ?auto_17331 - TRUCK
      ?auto_17336 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17330 ?auto_17332 ) ( IS-CRATE ?auto_17328 ) ( not ( = ?auto_17328 ?auto_17329 ) ) ( not ( = ?auto_17334 ?auto_17332 ) ) ( HOIST-AT ?auto_17333 ?auto_17334 ) ( not ( = ?auto_17330 ?auto_17333 ) ) ( AVAILABLE ?auto_17333 ) ( SURFACE-AT ?auto_17328 ?auto_17334 ) ( ON ?auto_17328 ?auto_17335 ) ( CLEAR ?auto_17328 ) ( not ( = ?auto_17328 ?auto_17335 ) ) ( not ( = ?auto_17329 ?auto_17335 ) ) ( TRUCK-AT ?auto_17331 ?auto_17332 ) ( SURFACE-AT ?auto_17336 ?auto_17332 ) ( CLEAR ?auto_17336 ) ( LIFTING ?auto_17330 ?auto_17329 ) ( IS-CRATE ?auto_17329 ) ( not ( = ?auto_17328 ?auto_17336 ) ) ( not ( = ?auto_17329 ?auto_17336 ) ) ( not ( = ?auto_17335 ?auto_17336 ) ) )
    :subtasks
    ( ( !DROP ?auto_17330 ?auto_17329 ?auto_17336 ?auto_17332 )
      ( MAKE-ON ?auto_17328 ?auto_17329 )
      ( MAKE-ON-VERIFY ?auto_17328 ?auto_17329 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17337 - SURFACE
      ?auto_17338 - SURFACE
    )
    :vars
    (
      ?auto_17344 - HOIST
      ?auto_17341 - PLACE
      ?auto_17345 - PLACE
      ?auto_17339 - HOIST
      ?auto_17343 - SURFACE
      ?auto_17342 - TRUCK
      ?auto_17340 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17344 ?auto_17341 ) ( IS-CRATE ?auto_17337 ) ( not ( = ?auto_17337 ?auto_17338 ) ) ( not ( = ?auto_17345 ?auto_17341 ) ) ( HOIST-AT ?auto_17339 ?auto_17345 ) ( not ( = ?auto_17344 ?auto_17339 ) ) ( AVAILABLE ?auto_17339 ) ( SURFACE-AT ?auto_17337 ?auto_17345 ) ( ON ?auto_17337 ?auto_17343 ) ( CLEAR ?auto_17337 ) ( not ( = ?auto_17337 ?auto_17343 ) ) ( not ( = ?auto_17338 ?auto_17343 ) ) ( TRUCK-AT ?auto_17342 ?auto_17341 ) ( SURFACE-AT ?auto_17340 ?auto_17341 ) ( CLEAR ?auto_17340 ) ( IS-CRATE ?auto_17338 ) ( not ( = ?auto_17337 ?auto_17340 ) ) ( not ( = ?auto_17338 ?auto_17340 ) ) ( not ( = ?auto_17343 ?auto_17340 ) ) ( AVAILABLE ?auto_17344 ) ( IN ?auto_17338 ?auto_17342 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17344 ?auto_17338 ?auto_17342 ?auto_17341 )
      ( MAKE-ON ?auto_17337 ?auto_17338 )
      ( MAKE-ON-VERIFY ?auto_17337 ?auto_17338 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17346 - SURFACE
      ?auto_17347 - SURFACE
    )
    :vars
    (
      ?auto_17352 - HOIST
      ?auto_17349 - PLACE
      ?auto_17348 - PLACE
      ?auto_17353 - HOIST
      ?auto_17351 - SURFACE
      ?auto_17350 - SURFACE
      ?auto_17354 - TRUCK
      ?auto_17355 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17352 ?auto_17349 ) ( IS-CRATE ?auto_17346 ) ( not ( = ?auto_17346 ?auto_17347 ) ) ( not ( = ?auto_17348 ?auto_17349 ) ) ( HOIST-AT ?auto_17353 ?auto_17348 ) ( not ( = ?auto_17352 ?auto_17353 ) ) ( AVAILABLE ?auto_17353 ) ( SURFACE-AT ?auto_17346 ?auto_17348 ) ( ON ?auto_17346 ?auto_17351 ) ( CLEAR ?auto_17346 ) ( not ( = ?auto_17346 ?auto_17351 ) ) ( not ( = ?auto_17347 ?auto_17351 ) ) ( SURFACE-AT ?auto_17350 ?auto_17349 ) ( CLEAR ?auto_17350 ) ( IS-CRATE ?auto_17347 ) ( not ( = ?auto_17346 ?auto_17350 ) ) ( not ( = ?auto_17347 ?auto_17350 ) ) ( not ( = ?auto_17351 ?auto_17350 ) ) ( AVAILABLE ?auto_17352 ) ( IN ?auto_17347 ?auto_17354 ) ( TRUCK-AT ?auto_17354 ?auto_17355 ) ( not ( = ?auto_17355 ?auto_17349 ) ) ( not ( = ?auto_17348 ?auto_17355 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17354 ?auto_17355 ?auto_17349 )
      ( MAKE-ON ?auto_17346 ?auto_17347 )
      ( MAKE-ON-VERIFY ?auto_17346 ?auto_17347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17356 - SURFACE
      ?auto_17357 - SURFACE
    )
    :vars
    (
      ?auto_17358 - HOIST
      ?auto_17361 - PLACE
      ?auto_17365 - PLACE
      ?auto_17360 - HOIST
      ?auto_17359 - SURFACE
      ?auto_17364 - SURFACE
      ?auto_17362 - TRUCK
      ?auto_17363 - PLACE
      ?auto_17366 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17358 ?auto_17361 ) ( IS-CRATE ?auto_17356 ) ( not ( = ?auto_17356 ?auto_17357 ) ) ( not ( = ?auto_17365 ?auto_17361 ) ) ( HOIST-AT ?auto_17360 ?auto_17365 ) ( not ( = ?auto_17358 ?auto_17360 ) ) ( AVAILABLE ?auto_17360 ) ( SURFACE-AT ?auto_17356 ?auto_17365 ) ( ON ?auto_17356 ?auto_17359 ) ( CLEAR ?auto_17356 ) ( not ( = ?auto_17356 ?auto_17359 ) ) ( not ( = ?auto_17357 ?auto_17359 ) ) ( SURFACE-AT ?auto_17364 ?auto_17361 ) ( CLEAR ?auto_17364 ) ( IS-CRATE ?auto_17357 ) ( not ( = ?auto_17356 ?auto_17364 ) ) ( not ( = ?auto_17357 ?auto_17364 ) ) ( not ( = ?auto_17359 ?auto_17364 ) ) ( AVAILABLE ?auto_17358 ) ( TRUCK-AT ?auto_17362 ?auto_17363 ) ( not ( = ?auto_17363 ?auto_17361 ) ) ( not ( = ?auto_17365 ?auto_17363 ) ) ( HOIST-AT ?auto_17366 ?auto_17363 ) ( LIFTING ?auto_17366 ?auto_17357 ) ( not ( = ?auto_17358 ?auto_17366 ) ) ( not ( = ?auto_17360 ?auto_17366 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17366 ?auto_17357 ?auto_17362 ?auto_17363 )
      ( MAKE-ON ?auto_17356 ?auto_17357 )
      ( MAKE-ON-VERIFY ?auto_17356 ?auto_17357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17367 - SURFACE
      ?auto_17368 - SURFACE
    )
    :vars
    (
      ?auto_17369 - HOIST
      ?auto_17371 - PLACE
      ?auto_17370 - PLACE
      ?auto_17373 - HOIST
      ?auto_17374 - SURFACE
      ?auto_17376 - SURFACE
      ?auto_17375 - TRUCK
      ?auto_17372 - PLACE
      ?auto_17377 - HOIST
      ?auto_17378 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17369 ?auto_17371 ) ( IS-CRATE ?auto_17367 ) ( not ( = ?auto_17367 ?auto_17368 ) ) ( not ( = ?auto_17370 ?auto_17371 ) ) ( HOIST-AT ?auto_17373 ?auto_17370 ) ( not ( = ?auto_17369 ?auto_17373 ) ) ( AVAILABLE ?auto_17373 ) ( SURFACE-AT ?auto_17367 ?auto_17370 ) ( ON ?auto_17367 ?auto_17374 ) ( CLEAR ?auto_17367 ) ( not ( = ?auto_17367 ?auto_17374 ) ) ( not ( = ?auto_17368 ?auto_17374 ) ) ( SURFACE-AT ?auto_17376 ?auto_17371 ) ( CLEAR ?auto_17376 ) ( IS-CRATE ?auto_17368 ) ( not ( = ?auto_17367 ?auto_17376 ) ) ( not ( = ?auto_17368 ?auto_17376 ) ) ( not ( = ?auto_17374 ?auto_17376 ) ) ( AVAILABLE ?auto_17369 ) ( TRUCK-AT ?auto_17375 ?auto_17372 ) ( not ( = ?auto_17372 ?auto_17371 ) ) ( not ( = ?auto_17370 ?auto_17372 ) ) ( HOIST-AT ?auto_17377 ?auto_17372 ) ( not ( = ?auto_17369 ?auto_17377 ) ) ( not ( = ?auto_17373 ?auto_17377 ) ) ( AVAILABLE ?auto_17377 ) ( SURFACE-AT ?auto_17368 ?auto_17372 ) ( ON ?auto_17368 ?auto_17378 ) ( CLEAR ?auto_17368 ) ( not ( = ?auto_17367 ?auto_17378 ) ) ( not ( = ?auto_17368 ?auto_17378 ) ) ( not ( = ?auto_17374 ?auto_17378 ) ) ( not ( = ?auto_17376 ?auto_17378 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17377 ?auto_17368 ?auto_17378 ?auto_17372 )
      ( MAKE-ON ?auto_17367 ?auto_17368 )
      ( MAKE-ON-VERIFY ?auto_17367 ?auto_17368 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17379 - SURFACE
      ?auto_17380 - SURFACE
    )
    :vars
    (
      ?auto_17387 - HOIST
      ?auto_17384 - PLACE
      ?auto_17383 - PLACE
      ?auto_17385 - HOIST
      ?auto_17390 - SURFACE
      ?auto_17382 - SURFACE
      ?auto_17388 - PLACE
      ?auto_17381 - HOIST
      ?auto_17386 - SURFACE
      ?auto_17389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17387 ?auto_17384 ) ( IS-CRATE ?auto_17379 ) ( not ( = ?auto_17379 ?auto_17380 ) ) ( not ( = ?auto_17383 ?auto_17384 ) ) ( HOIST-AT ?auto_17385 ?auto_17383 ) ( not ( = ?auto_17387 ?auto_17385 ) ) ( AVAILABLE ?auto_17385 ) ( SURFACE-AT ?auto_17379 ?auto_17383 ) ( ON ?auto_17379 ?auto_17390 ) ( CLEAR ?auto_17379 ) ( not ( = ?auto_17379 ?auto_17390 ) ) ( not ( = ?auto_17380 ?auto_17390 ) ) ( SURFACE-AT ?auto_17382 ?auto_17384 ) ( CLEAR ?auto_17382 ) ( IS-CRATE ?auto_17380 ) ( not ( = ?auto_17379 ?auto_17382 ) ) ( not ( = ?auto_17380 ?auto_17382 ) ) ( not ( = ?auto_17390 ?auto_17382 ) ) ( AVAILABLE ?auto_17387 ) ( not ( = ?auto_17388 ?auto_17384 ) ) ( not ( = ?auto_17383 ?auto_17388 ) ) ( HOIST-AT ?auto_17381 ?auto_17388 ) ( not ( = ?auto_17387 ?auto_17381 ) ) ( not ( = ?auto_17385 ?auto_17381 ) ) ( AVAILABLE ?auto_17381 ) ( SURFACE-AT ?auto_17380 ?auto_17388 ) ( ON ?auto_17380 ?auto_17386 ) ( CLEAR ?auto_17380 ) ( not ( = ?auto_17379 ?auto_17386 ) ) ( not ( = ?auto_17380 ?auto_17386 ) ) ( not ( = ?auto_17390 ?auto_17386 ) ) ( not ( = ?auto_17382 ?auto_17386 ) ) ( TRUCK-AT ?auto_17389 ?auto_17384 ) )
    :subtasks
    ( ( !DRIVE ?auto_17389 ?auto_17384 ?auto_17388 )
      ( MAKE-ON ?auto_17379 ?auto_17380 )
      ( MAKE-ON-VERIFY ?auto_17379 ?auto_17380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17391 - SURFACE
      ?auto_17392 - SURFACE
    )
    :vars
    (
      ?auto_17394 - HOIST
      ?auto_17402 - PLACE
      ?auto_17396 - PLACE
      ?auto_17401 - HOIST
      ?auto_17393 - SURFACE
      ?auto_17397 - SURFACE
      ?auto_17399 - PLACE
      ?auto_17398 - HOIST
      ?auto_17400 - SURFACE
      ?auto_17395 - TRUCK
      ?auto_17403 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17394 ?auto_17402 ) ( IS-CRATE ?auto_17391 ) ( not ( = ?auto_17391 ?auto_17392 ) ) ( not ( = ?auto_17396 ?auto_17402 ) ) ( HOIST-AT ?auto_17401 ?auto_17396 ) ( not ( = ?auto_17394 ?auto_17401 ) ) ( AVAILABLE ?auto_17401 ) ( SURFACE-AT ?auto_17391 ?auto_17396 ) ( ON ?auto_17391 ?auto_17393 ) ( CLEAR ?auto_17391 ) ( not ( = ?auto_17391 ?auto_17393 ) ) ( not ( = ?auto_17392 ?auto_17393 ) ) ( IS-CRATE ?auto_17392 ) ( not ( = ?auto_17391 ?auto_17397 ) ) ( not ( = ?auto_17392 ?auto_17397 ) ) ( not ( = ?auto_17393 ?auto_17397 ) ) ( not ( = ?auto_17399 ?auto_17402 ) ) ( not ( = ?auto_17396 ?auto_17399 ) ) ( HOIST-AT ?auto_17398 ?auto_17399 ) ( not ( = ?auto_17394 ?auto_17398 ) ) ( not ( = ?auto_17401 ?auto_17398 ) ) ( AVAILABLE ?auto_17398 ) ( SURFACE-AT ?auto_17392 ?auto_17399 ) ( ON ?auto_17392 ?auto_17400 ) ( CLEAR ?auto_17392 ) ( not ( = ?auto_17391 ?auto_17400 ) ) ( not ( = ?auto_17392 ?auto_17400 ) ) ( not ( = ?auto_17393 ?auto_17400 ) ) ( not ( = ?auto_17397 ?auto_17400 ) ) ( TRUCK-AT ?auto_17395 ?auto_17402 ) ( SURFACE-AT ?auto_17403 ?auto_17402 ) ( CLEAR ?auto_17403 ) ( LIFTING ?auto_17394 ?auto_17397 ) ( IS-CRATE ?auto_17397 ) ( not ( = ?auto_17391 ?auto_17403 ) ) ( not ( = ?auto_17392 ?auto_17403 ) ) ( not ( = ?auto_17393 ?auto_17403 ) ) ( not ( = ?auto_17397 ?auto_17403 ) ) ( not ( = ?auto_17400 ?auto_17403 ) ) )
    :subtasks
    ( ( !DROP ?auto_17394 ?auto_17397 ?auto_17403 ?auto_17402 )
      ( MAKE-ON ?auto_17391 ?auto_17392 )
      ( MAKE-ON-VERIFY ?auto_17391 ?auto_17392 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17404 - SURFACE
      ?auto_17405 - SURFACE
    )
    :vars
    (
      ?auto_17409 - HOIST
      ?auto_17415 - PLACE
      ?auto_17410 - PLACE
      ?auto_17414 - HOIST
      ?auto_17413 - SURFACE
      ?auto_17411 - SURFACE
      ?auto_17407 - PLACE
      ?auto_17408 - HOIST
      ?auto_17406 - SURFACE
      ?auto_17412 - TRUCK
      ?auto_17416 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17409 ?auto_17415 ) ( IS-CRATE ?auto_17404 ) ( not ( = ?auto_17404 ?auto_17405 ) ) ( not ( = ?auto_17410 ?auto_17415 ) ) ( HOIST-AT ?auto_17414 ?auto_17410 ) ( not ( = ?auto_17409 ?auto_17414 ) ) ( AVAILABLE ?auto_17414 ) ( SURFACE-AT ?auto_17404 ?auto_17410 ) ( ON ?auto_17404 ?auto_17413 ) ( CLEAR ?auto_17404 ) ( not ( = ?auto_17404 ?auto_17413 ) ) ( not ( = ?auto_17405 ?auto_17413 ) ) ( IS-CRATE ?auto_17405 ) ( not ( = ?auto_17404 ?auto_17411 ) ) ( not ( = ?auto_17405 ?auto_17411 ) ) ( not ( = ?auto_17413 ?auto_17411 ) ) ( not ( = ?auto_17407 ?auto_17415 ) ) ( not ( = ?auto_17410 ?auto_17407 ) ) ( HOIST-AT ?auto_17408 ?auto_17407 ) ( not ( = ?auto_17409 ?auto_17408 ) ) ( not ( = ?auto_17414 ?auto_17408 ) ) ( AVAILABLE ?auto_17408 ) ( SURFACE-AT ?auto_17405 ?auto_17407 ) ( ON ?auto_17405 ?auto_17406 ) ( CLEAR ?auto_17405 ) ( not ( = ?auto_17404 ?auto_17406 ) ) ( not ( = ?auto_17405 ?auto_17406 ) ) ( not ( = ?auto_17413 ?auto_17406 ) ) ( not ( = ?auto_17411 ?auto_17406 ) ) ( TRUCK-AT ?auto_17412 ?auto_17415 ) ( SURFACE-AT ?auto_17416 ?auto_17415 ) ( CLEAR ?auto_17416 ) ( IS-CRATE ?auto_17411 ) ( not ( = ?auto_17404 ?auto_17416 ) ) ( not ( = ?auto_17405 ?auto_17416 ) ) ( not ( = ?auto_17413 ?auto_17416 ) ) ( not ( = ?auto_17411 ?auto_17416 ) ) ( not ( = ?auto_17406 ?auto_17416 ) ) ( AVAILABLE ?auto_17409 ) ( IN ?auto_17411 ?auto_17412 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17409 ?auto_17411 ?auto_17412 ?auto_17415 )
      ( MAKE-ON ?auto_17404 ?auto_17405 )
      ( MAKE-ON-VERIFY ?auto_17404 ?auto_17405 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17417 - SURFACE
      ?auto_17418 - SURFACE
    )
    :vars
    (
      ?auto_17419 - HOIST
      ?auto_17428 - PLACE
      ?auto_17424 - PLACE
      ?auto_17421 - HOIST
      ?auto_17429 - SURFACE
      ?auto_17423 - SURFACE
      ?auto_17426 - PLACE
      ?auto_17425 - HOIST
      ?auto_17422 - SURFACE
      ?auto_17420 - SURFACE
      ?auto_17427 - TRUCK
      ?auto_17430 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17419 ?auto_17428 ) ( IS-CRATE ?auto_17417 ) ( not ( = ?auto_17417 ?auto_17418 ) ) ( not ( = ?auto_17424 ?auto_17428 ) ) ( HOIST-AT ?auto_17421 ?auto_17424 ) ( not ( = ?auto_17419 ?auto_17421 ) ) ( AVAILABLE ?auto_17421 ) ( SURFACE-AT ?auto_17417 ?auto_17424 ) ( ON ?auto_17417 ?auto_17429 ) ( CLEAR ?auto_17417 ) ( not ( = ?auto_17417 ?auto_17429 ) ) ( not ( = ?auto_17418 ?auto_17429 ) ) ( IS-CRATE ?auto_17418 ) ( not ( = ?auto_17417 ?auto_17423 ) ) ( not ( = ?auto_17418 ?auto_17423 ) ) ( not ( = ?auto_17429 ?auto_17423 ) ) ( not ( = ?auto_17426 ?auto_17428 ) ) ( not ( = ?auto_17424 ?auto_17426 ) ) ( HOIST-AT ?auto_17425 ?auto_17426 ) ( not ( = ?auto_17419 ?auto_17425 ) ) ( not ( = ?auto_17421 ?auto_17425 ) ) ( AVAILABLE ?auto_17425 ) ( SURFACE-AT ?auto_17418 ?auto_17426 ) ( ON ?auto_17418 ?auto_17422 ) ( CLEAR ?auto_17418 ) ( not ( = ?auto_17417 ?auto_17422 ) ) ( not ( = ?auto_17418 ?auto_17422 ) ) ( not ( = ?auto_17429 ?auto_17422 ) ) ( not ( = ?auto_17423 ?auto_17422 ) ) ( SURFACE-AT ?auto_17420 ?auto_17428 ) ( CLEAR ?auto_17420 ) ( IS-CRATE ?auto_17423 ) ( not ( = ?auto_17417 ?auto_17420 ) ) ( not ( = ?auto_17418 ?auto_17420 ) ) ( not ( = ?auto_17429 ?auto_17420 ) ) ( not ( = ?auto_17423 ?auto_17420 ) ) ( not ( = ?auto_17422 ?auto_17420 ) ) ( AVAILABLE ?auto_17419 ) ( IN ?auto_17423 ?auto_17427 ) ( TRUCK-AT ?auto_17427 ?auto_17430 ) ( not ( = ?auto_17430 ?auto_17428 ) ) ( not ( = ?auto_17424 ?auto_17430 ) ) ( not ( = ?auto_17426 ?auto_17430 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17427 ?auto_17430 ?auto_17428 )
      ( MAKE-ON ?auto_17417 ?auto_17418 )
      ( MAKE-ON-VERIFY ?auto_17417 ?auto_17418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17431 - SURFACE
      ?auto_17432 - SURFACE
    )
    :vars
    (
      ?auto_17440 - HOIST
      ?auto_17438 - PLACE
      ?auto_17433 - PLACE
      ?auto_17439 - HOIST
      ?auto_17435 - SURFACE
      ?auto_17442 - SURFACE
      ?auto_17434 - PLACE
      ?auto_17443 - HOIST
      ?auto_17436 - SURFACE
      ?auto_17437 - SURFACE
      ?auto_17441 - TRUCK
      ?auto_17444 - PLACE
      ?auto_17445 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17440 ?auto_17438 ) ( IS-CRATE ?auto_17431 ) ( not ( = ?auto_17431 ?auto_17432 ) ) ( not ( = ?auto_17433 ?auto_17438 ) ) ( HOIST-AT ?auto_17439 ?auto_17433 ) ( not ( = ?auto_17440 ?auto_17439 ) ) ( AVAILABLE ?auto_17439 ) ( SURFACE-AT ?auto_17431 ?auto_17433 ) ( ON ?auto_17431 ?auto_17435 ) ( CLEAR ?auto_17431 ) ( not ( = ?auto_17431 ?auto_17435 ) ) ( not ( = ?auto_17432 ?auto_17435 ) ) ( IS-CRATE ?auto_17432 ) ( not ( = ?auto_17431 ?auto_17442 ) ) ( not ( = ?auto_17432 ?auto_17442 ) ) ( not ( = ?auto_17435 ?auto_17442 ) ) ( not ( = ?auto_17434 ?auto_17438 ) ) ( not ( = ?auto_17433 ?auto_17434 ) ) ( HOIST-AT ?auto_17443 ?auto_17434 ) ( not ( = ?auto_17440 ?auto_17443 ) ) ( not ( = ?auto_17439 ?auto_17443 ) ) ( AVAILABLE ?auto_17443 ) ( SURFACE-AT ?auto_17432 ?auto_17434 ) ( ON ?auto_17432 ?auto_17436 ) ( CLEAR ?auto_17432 ) ( not ( = ?auto_17431 ?auto_17436 ) ) ( not ( = ?auto_17432 ?auto_17436 ) ) ( not ( = ?auto_17435 ?auto_17436 ) ) ( not ( = ?auto_17442 ?auto_17436 ) ) ( SURFACE-AT ?auto_17437 ?auto_17438 ) ( CLEAR ?auto_17437 ) ( IS-CRATE ?auto_17442 ) ( not ( = ?auto_17431 ?auto_17437 ) ) ( not ( = ?auto_17432 ?auto_17437 ) ) ( not ( = ?auto_17435 ?auto_17437 ) ) ( not ( = ?auto_17442 ?auto_17437 ) ) ( not ( = ?auto_17436 ?auto_17437 ) ) ( AVAILABLE ?auto_17440 ) ( TRUCK-AT ?auto_17441 ?auto_17444 ) ( not ( = ?auto_17444 ?auto_17438 ) ) ( not ( = ?auto_17433 ?auto_17444 ) ) ( not ( = ?auto_17434 ?auto_17444 ) ) ( HOIST-AT ?auto_17445 ?auto_17444 ) ( LIFTING ?auto_17445 ?auto_17442 ) ( not ( = ?auto_17440 ?auto_17445 ) ) ( not ( = ?auto_17439 ?auto_17445 ) ) ( not ( = ?auto_17443 ?auto_17445 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17445 ?auto_17442 ?auto_17441 ?auto_17444 )
      ( MAKE-ON ?auto_17431 ?auto_17432 )
      ( MAKE-ON-VERIFY ?auto_17431 ?auto_17432 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17446 - SURFACE
      ?auto_17447 - SURFACE
    )
    :vars
    (
      ?auto_17451 - HOIST
      ?auto_17450 - PLACE
      ?auto_17455 - PLACE
      ?auto_17453 - HOIST
      ?auto_17449 - SURFACE
      ?auto_17448 - SURFACE
      ?auto_17459 - PLACE
      ?auto_17457 - HOIST
      ?auto_17458 - SURFACE
      ?auto_17456 - SURFACE
      ?auto_17454 - TRUCK
      ?auto_17460 - PLACE
      ?auto_17452 - HOIST
      ?auto_17461 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17451 ?auto_17450 ) ( IS-CRATE ?auto_17446 ) ( not ( = ?auto_17446 ?auto_17447 ) ) ( not ( = ?auto_17455 ?auto_17450 ) ) ( HOIST-AT ?auto_17453 ?auto_17455 ) ( not ( = ?auto_17451 ?auto_17453 ) ) ( AVAILABLE ?auto_17453 ) ( SURFACE-AT ?auto_17446 ?auto_17455 ) ( ON ?auto_17446 ?auto_17449 ) ( CLEAR ?auto_17446 ) ( not ( = ?auto_17446 ?auto_17449 ) ) ( not ( = ?auto_17447 ?auto_17449 ) ) ( IS-CRATE ?auto_17447 ) ( not ( = ?auto_17446 ?auto_17448 ) ) ( not ( = ?auto_17447 ?auto_17448 ) ) ( not ( = ?auto_17449 ?auto_17448 ) ) ( not ( = ?auto_17459 ?auto_17450 ) ) ( not ( = ?auto_17455 ?auto_17459 ) ) ( HOIST-AT ?auto_17457 ?auto_17459 ) ( not ( = ?auto_17451 ?auto_17457 ) ) ( not ( = ?auto_17453 ?auto_17457 ) ) ( AVAILABLE ?auto_17457 ) ( SURFACE-AT ?auto_17447 ?auto_17459 ) ( ON ?auto_17447 ?auto_17458 ) ( CLEAR ?auto_17447 ) ( not ( = ?auto_17446 ?auto_17458 ) ) ( not ( = ?auto_17447 ?auto_17458 ) ) ( not ( = ?auto_17449 ?auto_17458 ) ) ( not ( = ?auto_17448 ?auto_17458 ) ) ( SURFACE-AT ?auto_17456 ?auto_17450 ) ( CLEAR ?auto_17456 ) ( IS-CRATE ?auto_17448 ) ( not ( = ?auto_17446 ?auto_17456 ) ) ( not ( = ?auto_17447 ?auto_17456 ) ) ( not ( = ?auto_17449 ?auto_17456 ) ) ( not ( = ?auto_17448 ?auto_17456 ) ) ( not ( = ?auto_17458 ?auto_17456 ) ) ( AVAILABLE ?auto_17451 ) ( TRUCK-AT ?auto_17454 ?auto_17460 ) ( not ( = ?auto_17460 ?auto_17450 ) ) ( not ( = ?auto_17455 ?auto_17460 ) ) ( not ( = ?auto_17459 ?auto_17460 ) ) ( HOIST-AT ?auto_17452 ?auto_17460 ) ( not ( = ?auto_17451 ?auto_17452 ) ) ( not ( = ?auto_17453 ?auto_17452 ) ) ( not ( = ?auto_17457 ?auto_17452 ) ) ( AVAILABLE ?auto_17452 ) ( SURFACE-AT ?auto_17448 ?auto_17460 ) ( ON ?auto_17448 ?auto_17461 ) ( CLEAR ?auto_17448 ) ( not ( = ?auto_17446 ?auto_17461 ) ) ( not ( = ?auto_17447 ?auto_17461 ) ) ( not ( = ?auto_17449 ?auto_17461 ) ) ( not ( = ?auto_17448 ?auto_17461 ) ) ( not ( = ?auto_17458 ?auto_17461 ) ) ( not ( = ?auto_17456 ?auto_17461 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17452 ?auto_17448 ?auto_17461 ?auto_17460 )
      ( MAKE-ON ?auto_17446 ?auto_17447 )
      ( MAKE-ON-VERIFY ?auto_17446 ?auto_17447 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17462 - SURFACE
      ?auto_17463 - SURFACE
    )
    :vars
    (
      ?auto_17470 - HOIST
      ?auto_17475 - PLACE
      ?auto_17477 - PLACE
      ?auto_17467 - HOIST
      ?auto_17466 - SURFACE
      ?auto_17464 - SURFACE
      ?auto_17465 - PLACE
      ?auto_17474 - HOIST
      ?auto_17469 - SURFACE
      ?auto_17476 - SURFACE
      ?auto_17472 - PLACE
      ?auto_17468 - HOIST
      ?auto_17473 - SURFACE
      ?auto_17471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17470 ?auto_17475 ) ( IS-CRATE ?auto_17462 ) ( not ( = ?auto_17462 ?auto_17463 ) ) ( not ( = ?auto_17477 ?auto_17475 ) ) ( HOIST-AT ?auto_17467 ?auto_17477 ) ( not ( = ?auto_17470 ?auto_17467 ) ) ( AVAILABLE ?auto_17467 ) ( SURFACE-AT ?auto_17462 ?auto_17477 ) ( ON ?auto_17462 ?auto_17466 ) ( CLEAR ?auto_17462 ) ( not ( = ?auto_17462 ?auto_17466 ) ) ( not ( = ?auto_17463 ?auto_17466 ) ) ( IS-CRATE ?auto_17463 ) ( not ( = ?auto_17462 ?auto_17464 ) ) ( not ( = ?auto_17463 ?auto_17464 ) ) ( not ( = ?auto_17466 ?auto_17464 ) ) ( not ( = ?auto_17465 ?auto_17475 ) ) ( not ( = ?auto_17477 ?auto_17465 ) ) ( HOIST-AT ?auto_17474 ?auto_17465 ) ( not ( = ?auto_17470 ?auto_17474 ) ) ( not ( = ?auto_17467 ?auto_17474 ) ) ( AVAILABLE ?auto_17474 ) ( SURFACE-AT ?auto_17463 ?auto_17465 ) ( ON ?auto_17463 ?auto_17469 ) ( CLEAR ?auto_17463 ) ( not ( = ?auto_17462 ?auto_17469 ) ) ( not ( = ?auto_17463 ?auto_17469 ) ) ( not ( = ?auto_17466 ?auto_17469 ) ) ( not ( = ?auto_17464 ?auto_17469 ) ) ( SURFACE-AT ?auto_17476 ?auto_17475 ) ( CLEAR ?auto_17476 ) ( IS-CRATE ?auto_17464 ) ( not ( = ?auto_17462 ?auto_17476 ) ) ( not ( = ?auto_17463 ?auto_17476 ) ) ( not ( = ?auto_17466 ?auto_17476 ) ) ( not ( = ?auto_17464 ?auto_17476 ) ) ( not ( = ?auto_17469 ?auto_17476 ) ) ( AVAILABLE ?auto_17470 ) ( not ( = ?auto_17472 ?auto_17475 ) ) ( not ( = ?auto_17477 ?auto_17472 ) ) ( not ( = ?auto_17465 ?auto_17472 ) ) ( HOIST-AT ?auto_17468 ?auto_17472 ) ( not ( = ?auto_17470 ?auto_17468 ) ) ( not ( = ?auto_17467 ?auto_17468 ) ) ( not ( = ?auto_17474 ?auto_17468 ) ) ( AVAILABLE ?auto_17468 ) ( SURFACE-AT ?auto_17464 ?auto_17472 ) ( ON ?auto_17464 ?auto_17473 ) ( CLEAR ?auto_17464 ) ( not ( = ?auto_17462 ?auto_17473 ) ) ( not ( = ?auto_17463 ?auto_17473 ) ) ( not ( = ?auto_17466 ?auto_17473 ) ) ( not ( = ?auto_17464 ?auto_17473 ) ) ( not ( = ?auto_17469 ?auto_17473 ) ) ( not ( = ?auto_17476 ?auto_17473 ) ) ( TRUCK-AT ?auto_17471 ?auto_17475 ) )
    :subtasks
    ( ( !DRIVE ?auto_17471 ?auto_17475 ?auto_17472 )
      ( MAKE-ON ?auto_17462 ?auto_17463 )
      ( MAKE-ON-VERIFY ?auto_17462 ?auto_17463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17478 - SURFACE
      ?auto_17479 - SURFACE
    )
    :vars
    (
      ?auto_17487 - HOIST
      ?auto_17481 - PLACE
      ?auto_17493 - PLACE
      ?auto_17480 - HOIST
      ?auto_17486 - SURFACE
      ?auto_17484 - SURFACE
      ?auto_17482 - PLACE
      ?auto_17492 - HOIST
      ?auto_17491 - SURFACE
      ?auto_17488 - SURFACE
      ?auto_17485 - PLACE
      ?auto_17489 - HOIST
      ?auto_17490 - SURFACE
      ?auto_17483 - TRUCK
      ?auto_17494 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17487 ?auto_17481 ) ( IS-CRATE ?auto_17478 ) ( not ( = ?auto_17478 ?auto_17479 ) ) ( not ( = ?auto_17493 ?auto_17481 ) ) ( HOIST-AT ?auto_17480 ?auto_17493 ) ( not ( = ?auto_17487 ?auto_17480 ) ) ( AVAILABLE ?auto_17480 ) ( SURFACE-AT ?auto_17478 ?auto_17493 ) ( ON ?auto_17478 ?auto_17486 ) ( CLEAR ?auto_17478 ) ( not ( = ?auto_17478 ?auto_17486 ) ) ( not ( = ?auto_17479 ?auto_17486 ) ) ( IS-CRATE ?auto_17479 ) ( not ( = ?auto_17478 ?auto_17484 ) ) ( not ( = ?auto_17479 ?auto_17484 ) ) ( not ( = ?auto_17486 ?auto_17484 ) ) ( not ( = ?auto_17482 ?auto_17481 ) ) ( not ( = ?auto_17493 ?auto_17482 ) ) ( HOIST-AT ?auto_17492 ?auto_17482 ) ( not ( = ?auto_17487 ?auto_17492 ) ) ( not ( = ?auto_17480 ?auto_17492 ) ) ( AVAILABLE ?auto_17492 ) ( SURFACE-AT ?auto_17479 ?auto_17482 ) ( ON ?auto_17479 ?auto_17491 ) ( CLEAR ?auto_17479 ) ( not ( = ?auto_17478 ?auto_17491 ) ) ( not ( = ?auto_17479 ?auto_17491 ) ) ( not ( = ?auto_17486 ?auto_17491 ) ) ( not ( = ?auto_17484 ?auto_17491 ) ) ( IS-CRATE ?auto_17484 ) ( not ( = ?auto_17478 ?auto_17488 ) ) ( not ( = ?auto_17479 ?auto_17488 ) ) ( not ( = ?auto_17486 ?auto_17488 ) ) ( not ( = ?auto_17484 ?auto_17488 ) ) ( not ( = ?auto_17491 ?auto_17488 ) ) ( not ( = ?auto_17485 ?auto_17481 ) ) ( not ( = ?auto_17493 ?auto_17485 ) ) ( not ( = ?auto_17482 ?auto_17485 ) ) ( HOIST-AT ?auto_17489 ?auto_17485 ) ( not ( = ?auto_17487 ?auto_17489 ) ) ( not ( = ?auto_17480 ?auto_17489 ) ) ( not ( = ?auto_17492 ?auto_17489 ) ) ( AVAILABLE ?auto_17489 ) ( SURFACE-AT ?auto_17484 ?auto_17485 ) ( ON ?auto_17484 ?auto_17490 ) ( CLEAR ?auto_17484 ) ( not ( = ?auto_17478 ?auto_17490 ) ) ( not ( = ?auto_17479 ?auto_17490 ) ) ( not ( = ?auto_17486 ?auto_17490 ) ) ( not ( = ?auto_17484 ?auto_17490 ) ) ( not ( = ?auto_17491 ?auto_17490 ) ) ( not ( = ?auto_17488 ?auto_17490 ) ) ( TRUCK-AT ?auto_17483 ?auto_17481 ) ( SURFACE-AT ?auto_17494 ?auto_17481 ) ( CLEAR ?auto_17494 ) ( LIFTING ?auto_17487 ?auto_17488 ) ( IS-CRATE ?auto_17488 ) ( not ( = ?auto_17478 ?auto_17494 ) ) ( not ( = ?auto_17479 ?auto_17494 ) ) ( not ( = ?auto_17486 ?auto_17494 ) ) ( not ( = ?auto_17484 ?auto_17494 ) ) ( not ( = ?auto_17491 ?auto_17494 ) ) ( not ( = ?auto_17488 ?auto_17494 ) ) ( not ( = ?auto_17490 ?auto_17494 ) ) )
    :subtasks
    ( ( !DROP ?auto_17487 ?auto_17488 ?auto_17494 ?auto_17481 )
      ( MAKE-ON ?auto_17478 ?auto_17479 )
      ( MAKE-ON-VERIFY ?auto_17478 ?auto_17479 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17495 - SURFACE
      ?auto_17496 - SURFACE
    )
    :vars
    (
      ?auto_17508 - HOIST
      ?auto_17503 - PLACE
      ?auto_17502 - PLACE
      ?auto_17501 - HOIST
      ?auto_17507 - SURFACE
      ?auto_17506 - SURFACE
      ?auto_17497 - PLACE
      ?auto_17498 - HOIST
      ?auto_17510 - SURFACE
      ?auto_17499 - SURFACE
      ?auto_17509 - PLACE
      ?auto_17505 - HOIST
      ?auto_17500 - SURFACE
      ?auto_17504 - TRUCK
      ?auto_17511 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17508 ?auto_17503 ) ( IS-CRATE ?auto_17495 ) ( not ( = ?auto_17495 ?auto_17496 ) ) ( not ( = ?auto_17502 ?auto_17503 ) ) ( HOIST-AT ?auto_17501 ?auto_17502 ) ( not ( = ?auto_17508 ?auto_17501 ) ) ( AVAILABLE ?auto_17501 ) ( SURFACE-AT ?auto_17495 ?auto_17502 ) ( ON ?auto_17495 ?auto_17507 ) ( CLEAR ?auto_17495 ) ( not ( = ?auto_17495 ?auto_17507 ) ) ( not ( = ?auto_17496 ?auto_17507 ) ) ( IS-CRATE ?auto_17496 ) ( not ( = ?auto_17495 ?auto_17506 ) ) ( not ( = ?auto_17496 ?auto_17506 ) ) ( not ( = ?auto_17507 ?auto_17506 ) ) ( not ( = ?auto_17497 ?auto_17503 ) ) ( not ( = ?auto_17502 ?auto_17497 ) ) ( HOIST-AT ?auto_17498 ?auto_17497 ) ( not ( = ?auto_17508 ?auto_17498 ) ) ( not ( = ?auto_17501 ?auto_17498 ) ) ( AVAILABLE ?auto_17498 ) ( SURFACE-AT ?auto_17496 ?auto_17497 ) ( ON ?auto_17496 ?auto_17510 ) ( CLEAR ?auto_17496 ) ( not ( = ?auto_17495 ?auto_17510 ) ) ( not ( = ?auto_17496 ?auto_17510 ) ) ( not ( = ?auto_17507 ?auto_17510 ) ) ( not ( = ?auto_17506 ?auto_17510 ) ) ( IS-CRATE ?auto_17506 ) ( not ( = ?auto_17495 ?auto_17499 ) ) ( not ( = ?auto_17496 ?auto_17499 ) ) ( not ( = ?auto_17507 ?auto_17499 ) ) ( not ( = ?auto_17506 ?auto_17499 ) ) ( not ( = ?auto_17510 ?auto_17499 ) ) ( not ( = ?auto_17509 ?auto_17503 ) ) ( not ( = ?auto_17502 ?auto_17509 ) ) ( not ( = ?auto_17497 ?auto_17509 ) ) ( HOIST-AT ?auto_17505 ?auto_17509 ) ( not ( = ?auto_17508 ?auto_17505 ) ) ( not ( = ?auto_17501 ?auto_17505 ) ) ( not ( = ?auto_17498 ?auto_17505 ) ) ( AVAILABLE ?auto_17505 ) ( SURFACE-AT ?auto_17506 ?auto_17509 ) ( ON ?auto_17506 ?auto_17500 ) ( CLEAR ?auto_17506 ) ( not ( = ?auto_17495 ?auto_17500 ) ) ( not ( = ?auto_17496 ?auto_17500 ) ) ( not ( = ?auto_17507 ?auto_17500 ) ) ( not ( = ?auto_17506 ?auto_17500 ) ) ( not ( = ?auto_17510 ?auto_17500 ) ) ( not ( = ?auto_17499 ?auto_17500 ) ) ( TRUCK-AT ?auto_17504 ?auto_17503 ) ( SURFACE-AT ?auto_17511 ?auto_17503 ) ( CLEAR ?auto_17511 ) ( IS-CRATE ?auto_17499 ) ( not ( = ?auto_17495 ?auto_17511 ) ) ( not ( = ?auto_17496 ?auto_17511 ) ) ( not ( = ?auto_17507 ?auto_17511 ) ) ( not ( = ?auto_17506 ?auto_17511 ) ) ( not ( = ?auto_17510 ?auto_17511 ) ) ( not ( = ?auto_17499 ?auto_17511 ) ) ( not ( = ?auto_17500 ?auto_17511 ) ) ( AVAILABLE ?auto_17508 ) ( IN ?auto_17499 ?auto_17504 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17508 ?auto_17499 ?auto_17504 ?auto_17503 )
      ( MAKE-ON ?auto_17495 ?auto_17496 )
      ( MAKE-ON-VERIFY ?auto_17495 ?auto_17496 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17512 - SURFACE
      ?auto_17513 - SURFACE
    )
    :vars
    (
      ?auto_17523 - HOIST
      ?auto_17514 - PLACE
      ?auto_17520 - PLACE
      ?auto_17528 - HOIST
      ?auto_17517 - SURFACE
      ?auto_17516 - SURFACE
      ?auto_17526 - PLACE
      ?auto_17525 - HOIST
      ?auto_17522 - SURFACE
      ?auto_17519 - SURFACE
      ?auto_17521 - PLACE
      ?auto_17518 - HOIST
      ?auto_17527 - SURFACE
      ?auto_17524 - SURFACE
      ?auto_17515 - TRUCK
      ?auto_17529 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17523 ?auto_17514 ) ( IS-CRATE ?auto_17512 ) ( not ( = ?auto_17512 ?auto_17513 ) ) ( not ( = ?auto_17520 ?auto_17514 ) ) ( HOIST-AT ?auto_17528 ?auto_17520 ) ( not ( = ?auto_17523 ?auto_17528 ) ) ( AVAILABLE ?auto_17528 ) ( SURFACE-AT ?auto_17512 ?auto_17520 ) ( ON ?auto_17512 ?auto_17517 ) ( CLEAR ?auto_17512 ) ( not ( = ?auto_17512 ?auto_17517 ) ) ( not ( = ?auto_17513 ?auto_17517 ) ) ( IS-CRATE ?auto_17513 ) ( not ( = ?auto_17512 ?auto_17516 ) ) ( not ( = ?auto_17513 ?auto_17516 ) ) ( not ( = ?auto_17517 ?auto_17516 ) ) ( not ( = ?auto_17526 ?auto_17514 ) ) ( not ( = ?auto_17520 ?auto_17526 ) ) ( HOIST-AT ?auto_17525 ?auto_17526 ) ( not ( = ?auto_17523 ?auto_17525 ) ) ( not ( = ?auto_17528 ?auto_17525 ) ) ( AVAILABLE ?auto_17525 ) ( SURFACE-AT ?auto_17513 ?auto_17526 ) ( ON ?auto_17513 ?auto_17522 ) ( CLEAR ?auto_17513 ) ( not ( = ?auto_17512 ?auto_17522 ) ) ( not ( = ?auto_17513 ?auto_17522 ) ) ( not ( = ?auto_17517 ?auto_17522 ) ) ( not ( = ?auto_17516 ?auto_17522 ) ) ( IS-CRATE ?auto_17516 ) ( not ( = ?auto_17512 ?auto_17519 ) ) ( not ( = ?auto_17513 ?auto_17519 ) ) ( not ( = ?auto_17517 ?auto_17519 ) ) ( not ( = ?auto_17516 ?auto_17519 ) ) ( not ( = ?auto_17522 ?auto_17519 ) ) ( not ( = ?auto_17521 ?auto_17514 ) ) ( not ( = ?auto_17520 ?auto_17521 ) ) ( not ( = ?auto_17526 ?auto_17521 ) ) ( HOIST-AT ?auto_17518 ?auto_17521 ) ( not ( = ?auto_17523 ?auto_17518 ) ) ( not ( = ?auto_17528 ?auto_17518 ) ) ( not ( = ?auto_17525 ?auto_17518 ) ) ( AVAILABLE ?auto_17518 ) ( SURFACE-AT ?auto_17516 ?auto_17521 ) ( ON ?auto_17516 ?auto_17527 ) ( CLEAR ?auto_17516 ) ( not ( = ?auto_17512 ?auto_17527 ) ) ( not ( = ?auto_17513 ?auto_17527 ) ) ( not ( = ?auto_17517 ?auto_17527 ) ) ( not ( = ?auto_17516 ?auto_17527 ) ) ( not ( = ?auto_17522 ?auto_17527 ) ) ( not ( = ?auto_17519 ?auto_17527 ) ) ( SURFACE-AT ?auto_17524 ?auto_17514 ) ( CLEAR ?auto_17524 ) ( IS-CRATE ?auto_17519 ) ( not ( = ?auto_17512 ?auto_17524 ) ) ( not ( = ?auto_17513 ?auto_17524 ) ) ( not ( = ?auto_17517 ?auto_17524 ) ) ( not ( = ?auto_17516 ?auto_17524 ) ) ( not ( = ?auto_17522 ?auto_17524 ) ) ( not ( = ?auto_17519 ?auto_17524 ) ) ( not ( = ?auto_17527 ?auto_17524 ) ) ( AVAILABLE ?auto_17523 ) ( IN ?auto_17519 ?auto_17515 ) ( TRUCK-AT ?auto_17515 ?auto_17529 ) ( not ( = ?auto_17529 ?auto_17514 ) ) ( not ( = ?auto_17520 ?auto_17529 ) ) ( not ( = ?auto_17526 ?auto_17529 ) ) ( not ( = ?auto_17521 ?auto_17529 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17515 ?auto_17529 ?auto_17514 )
      ( MAKE-ON ?auto_17512 ?auto_17513 )
      ( MAKE-ON-VERIFY ?auto_17512 ?auto_17513 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17530 - SURFACE
      ?auto_17531 - SURFACE
    )
    :vars
    (
      ?auto_17544 - HOIST
      ?auto_17532 - PLACE
      ?auto_17543 - PLACE
      ?auto_17535 - HOIST
      ?auto_17542 - SURFACE
      ?auto_17540 - SURFACE
      ?auto_17533 - PLACE
      ?auto_17534 - HOIST
      ?auto_17546 - SURFACE
      ?auto_17538 - SURFACE
      ?auto_17537 - PLACE
      ?auto_17545 - HOIST
      ?auto_17536 - SURFACE
      ?auto_17541 - SURFACE
      ?auto_17539 - TRUCK
      ?auto_17547 - PLACE
      ?auto_17548 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17544 ?auto_17532 ) ( IS-CRATE ?auto_17530 ) ( not ( = ?auto_17530 ?auto_17531 ) ) ( not ( = ?auto_17543 ?auto_17532 ) ) ( HOIST-AT ?auto_17535 ?auto_17543 ) ( not ( = ?auto_17544 ?auto_17535 ) ) ( AVAILABLE ?auto_17535 ) ( SURFACE-AT ?auto_17530 ?auto_17543 ) ( ON ?auto_17530 ?auto_17542 ) ( CLEAR ?auto_17530 ) ( not ( = ?auto_17530 ?auto_17542 ) ) ( not ( = ?auto_17531 ?auto_17542 ) ) ( IS-CRATE ?auto_17531 ) ( not ( = ?auto_17530 ?auto_17540 ) ) ( not ( = ?auto_17531 ?auto_17540 ) ) ( not ( = ?auto_17542 ?auto_17540 ) ) ( not ( = ?auto_17533 ?auto_17532 ) ) ( not ( = ?auto_17543 ?auto_17533 ) ) ( HOIST-AT ?auto_17534 ?auto_17533 ) ( not ( = ?auto_17544 ?auto_17534 ) ) ( not ( = ?auto_17535 ?auto_17534 ) ) ( AVAILABLE ?auto_17534 ) ( SURFACE-AT ?auto_17531 ?auto_17533 ) ( ON ?auto_17531 ?auto_17546 ) ( CLEAR ?auto_17531 ) ( not ( = ?auto_17530 ?auto_17546 ) ) ( not ( = ?auto_17531 ?auto_17546 ) ) ( not ( = ?auto_17542 ?auto_17546 ) ) ( not ( = ?auto_17540 ?auto_17546 ) ) ( IS-CRATE ?auto_17540 ) ( not ( = ?auto_17530 ?auto_17538 ) ) ( not ( = ?auto_17531 ?auto_17538 ) ) ( not ( = ?auto_17542 ?auto_17538 ) ) ( not ( = ?auto_17540 ?auto_17538 ) ) ( not ( = ?auto_17546 ?auto_17538 ) ) ( not ( = ?auto_17537 ?auto_17532 ) ) ( not ( = ?auto_17543 ?auto_17537 ) ) ( not ( = ?auto_17533 ?auto_17537 ) ) ( HOIST-AT ?auto_17545 ?auto_17537 ) ( not ( = ?auto_17544 ?auto_17545 ) ) ( not ( = ?auto_17535 ?auto_17545 ) ) ( not ( = ?auto_17534 ?auto_17545 ) ) ( AVAILABLE ?auto_17545 ) ( SURFACE-AT ?auto_17540 ?auto_17537 ) ( ON ?auto_17540 ?auto_17536 ) ( CLEAR ?auto_17540 ) ( not ( = ?auto_17530 ?auto_17536 ) ) ( not ( = ?auto_17531 ?auto_17536 ) ) ( not ( = ?auto_17542 ?auto_17536 ) ) ( not ( = ?auto_17540 ?auto_17536 ) ) ( not ( = ?auto_17546 ?auto_17536 ) ) ( not ( = ?auto_17538 ?auto_17536 ) ) ( SURFACE-AT ?auto_17541 ?auto_17532 ) ( CLEAR ?auto_17541 ) ( IS-CRATE ?auto_17538 ) ( not ( = ?auto_17530 ?auto_17541 ) ) ( not ( = ?auto_17531 ?auto_17541 ) ) ( not ( = ?auto_17542 ?auto_17541 ) ) ( not ( = ?auto_17540 ?auto_17541 ) ) ( not ( = ?auto_17546 ?auto_17541 ) ) ( not ( = ?auto_17538 ?auto_17541 ) ) ( not ( = ?auto_17536 ?auto_17541 ) ) ( AVAILABLE ?auto_17544 ) ( TRUCK-AT ?auto_17539 ?auto_17547 ) ( not ( = ?auto_17547 ?auto_17532 ) ) ( not ( = ?auto_17543 ?auto_17547 ) ) ( not ( = ?auto_17533 ?auto_17547 ) ) ( not ( = ?auto_17537 ?auto_17547 ) ) ( HOIST-AT ?auto_17548 ?auto_17547 ) ( LIFTING ?auto_17548 ?auto_17538 ) ( not ( = ?auto_17544 ?auto_17548 ) ) ( not ( = ?auto_17535 ?auto_17548 ) ) ( not ( = ?auto_17534 ?auto_17548 ) ) ( not ( = ?auto_17545 ?auto_17548 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17548 ?auto_17538 ?auto_17539 ?auto_17547 )
      ( MAKE-ON ?auto_17530 ?auto_17531 )
      ( MAKE-ON-VERIFY ?auto_17530 ?auto_17531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17549 - SURFACE
      ?auto_17550 - SURFACE
    )
    :vars
    (
      ?auto_17554 - HOIST
      ?auto_17559 - PLACE
      ?auto_17561 - PLACE
      ?auto_17553 - HOIST
      ?auto_17563 - SURFACE
      ?auto_17557 - SURFACE
      ?auto_17551 - PLACE
      ?auto_17552 - HOIST
      ?auto_17560 - SURFACE
      ?auto_17555 - SURFACE
      ?auto_17558 - PLACE
      ?auto_17566 - HOIST
      ?auto_17567 - SURFACE
      ?auto_17562 - SURFACE
      ?auto_17564 - TRUCK
      ?auto_17556 - PLACE
      ?auto_17565 - HOIST
      ?auto_17568 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17554 ?auto_17559 ) ( IS-CRATE ?auto_17549 ) ( not ( = ?auto_17549 ?auto_17550 ) ) ( not ( = ?auto_17561 ?auto_17559 ) ) ( HOIST-AT ?auto_17553 ?auto_17561 ) ( not ( = ?auto_17554 ?auto_17553 ) ) ( AVAILABLE ?auto_17553 ) ( SURFACE-AT ?auto_17549 ?auto_17561 ) ( ON ?auto_17549 ?auto_17563 ) ( CLEAR ?auto_17549 ) ( not ( = ?auto_17549 ?auto_17563 ) ) ( not ( = ?auto_17550 ?auto_17563 ) ) ( IS-CRATE ?auto_17550 ) ( not ( = ?auto_17549 ?auto_17557 ) ) ( not ( = ?auto_17550 ?auto_17557 ) ) ( not ( = ?auto_17563 ?auto_17557 ) ) ( not ( = ?auto_17551 ?auto_17559 ) ) ( not ( = ?auto_17561 ?auto_17551 ) ) ( HOIST-AT ?auto_17552 ?auto_17551 ) ( not ( = ?auto_17554 ?auto_17552 ) ) ( not ( = ?auto_17553 ?auto_17552 ) ) ( AVAILABLE ?auto_17552 ) ( SURFACE-AT ?auto_17550 ?auto_17551 ) ( ON ?auto_17550 ?auto_17560 ) ( CLEAR ?auto_17550 ) ( not ( = ?auto_17549 ?auto_17560 ) ) ( not ( = ?auto_17550 ?auto_17560 ) ) ( not ( = ?auto_17563 ?auto_17560 ) ) ( not ( = ?auto_17557 ?auto_17560 ) ) ( IS-CRATE ?auto_17557 ) ( not ( = ?auto_17549 ?auto_17555 ) ) ( not ( = ?auto_17550 ?auto_17555 ) ) ( not ( = ?auto_17563 ?auto_17555 ) ) ( not ( = ?auto_17557 ?auto_17555 ) ) ( not ( = ?auto_17560 ?auto_17555 ) ) ( not ( = ?auto_17558 ?auto_17559 ) ) ( not ( = ?auto_17561 ?auto_17558 ) ) ( not ( = ?auto_17551 ?auto_17558 ) ) ( HOIST-AT ?auto_17566 ?auto_17558 ) ( not ( = ?auto_17554 ?auto_17566 ) ) ( not ( = ?auto_17553 ?auto_17566 ) ) ( not ( = ?auto_17552 ?auto_17566 ) ) ( AVAILABLE ?auto_17566 ) ( SURFACE-AT ?auto_17557 ?auto_17558 ) ( ON ?auto_17557 ?auto_17567 ) ( CLEAR ?auto_17557 ) ( not ( = ?auto_17549 ?auto_17567 ) ) ( not ( = ?auto_17550 ?auto_17567 ) ) ( not ( = ?auto_17563 ?auto_17567 ) ) ( not ( = ?auto_17557 ?auto_17567 ) ) ( not ( = ?auto_17560 ?auto_17567 ) ) ( not ( = ?auto_17555 ?auto_17567 ) ) ( SURFACE-AT ?auto_17562 ?auto_17559 ) ( CLEAR ?auto_17562 ) ( IS-CRATE ?auto_17555 ) ( not ( = ?auto_17549 ?auto_17562 ) ) ( not ( = ?auto_17550 ?auto_17562 ) ) ( not ( = ?auto_17563 ?auto_17562 ) ) ( not ( = ?auto_17557 ?auto_17562 ) ) ( not ( = ?auto_17560 ?auto_17562 ) ) ( not ( = ?auto_17555 ?auto_17562 ) ) ( not ( = ?auto_17567 ?auto_17562 ) ) ( AVAILABLE ?auto_17554 ) ( TRUCK-AT ?auto_17564 ?auto_17556 ) ( not ( = ?auto_17556 ?auto_17559 ) ) ( not ( = ?auto_17561 ?auto_17556 ) ) ( not ( = ?auto_17551 ?auto_17556 ) ) ( not ( = ?auto_17558 ?auto_17556 ) ) ( HOIST-AT ?auto_17565 ?auto_17556 ) ( not ( = ?auto_17554 ?auto_17565 ) ) ( not ( = ?auto_17553 ?auto_17565 ) ) ( not ( = ?auto_17552 ?auto_17565 ) ) ( not ( = ?auto_17566 ?auto_17565 ) ) ( AVAILABLE ?auto_17565 ) ( SURFACE-AT ?auto_17555 ?auto_17556 ) ( ON ?auto_17555 ?auto_17568 ) ( CLEAR ?auto_17555 ) ( not ( = ?auto_17549 ?auto_17568 ) ) ( not ( = ?auto_17550 ?auto_17568 ) ) ( not ( = ?auto_17563 ?auto_17568 ) ) ( not ( = ?auto_17557 ?auto_17568 ) ) ( not ( = ?auto_17560 ?auto_17568 ) ) ( not ( = ?auto_17555 ?auto_17568 ) ) ( not ( = ?auto_17567 ?auto_17568 ) ) ( not ( = ?auto_17562 ?auto_17568 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17565 ?auto_17555 ?auto_17568 ?auto_17556 )
      ( MAKE-ON ?auto_17549 ?auto_17550 )
      ( MAKE-ON-VERIFY ?auto_17549 ?auto_17550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17569 - SURFACE
      ?auto_17570 - SURFACE
    )
    :vars
    (
      ?auto_17584 - HOIST
      ?auto_17580 - PLACE
      ?auto_17572 - PLACE
      ?auto_17578 - HOIST
      ?auto_17571 - SURFACE
      ?auto_17575 - SURFACE
      ?auto_17576 - PLACE
      ?auto_17577 - HOIST
      ?auto_17581 - SURFACE
      ?auto_17582 - SURFACE
      ?auto_17586 - PLACE
      ?auto_17583 - HOIST
      ?auto_17588 - SURFACE
      ?auto_17573 - SURFACE
      ?auto_17585 - PLACE
      ?auto_17574 - HOIST
      ?auto_17579 - SURFACE
      ?auto_17587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17584 ?auto_17580 ) ( IS-CRATE ?auto_17569 ) ( not ( = ?auto_17569 ?auto_17570 ) ) ( not ( = ?auto_17572 ?auto_17580 ) ) ( HOIST-AT ?auto_17578 ?auto_17572 ) ( not ( = ?auto_17584 ?auto_17578 ) ) ( AVAILABLE ?auto_17578 ) ( SURFACE-AT ?auto_17569 ?auto_17572 ) ( ON ?auto_17569 ?auto_17571 ) ( CLEAR ?auto_17569 ) ( not ( = ?auto_17569 ?auto_17571 ) ) ( not ( = ?auto_17570 ?auto_17571 ) ) ( IS-CRATE ?auto_17570 ) ( not ( = ?auto_17569 ?auto_17575 ) ) ( not ( = ?auto_17570 ?auto_17575 ) ) ( not ( = ?auto_17571 ?auto_17575 ) ) ( not ( = ?auto_17576 ?auto_17580 ) ) ( not ( = ?auto_17572 ?auto_17576 ) ) ( HOIST-AT ?auto_17577 ?auto_17576 ) ( not ( = ?auto_17584 ?auto_17577 ) ) ( not ( = ?auto_17578 ?auto_17577 ) ) ( AVAILABLE ?auto_17577 ) ( SURFACE-AT ?auto_17570 ?auto_17576 ) ( ON ?auto_17570 ?auto_17581 ) ( CLEAR ?auto_17570 ) ( not ( = ?auto_17569 ?auto_17581 ) ) ( not ( = ?auto_17570 ?auto_17581 ) ) ( not ( = ?auto_17571 ?auto_17581 ) ) ( not ( = ?auto_17575 ?auto_17581 ) ) ( IS-CRATE ?auto_17575 ) ( not ( = ?auto_17569 ?auto_17582 ) ) ( not ( = ?auto_17570 ?auto_17582 ) ) ( not ( = ?auto_17571 ?auto_17582 ) ) ( not ( = ?auto_17575 ?auto_17582 ) ) ( not ( = ?auto_17581 ?auto_17582 ) ) ( not ( = ?auto_17586 ?auto_17580 ) ) ( not ( = ?auto_17572 ?auto_17586 ) ) ( not ( = ?auto_17576 ?auto_17586 ) ) ( HOIST-AT ?auto_17583 ?auto_17586 ) ( not ( = ?auto_17584 ?auto_17583 ) ) ( not ( = ?auto_17578 ?auto_17583 ) ) ( not ( = ?auto_17577 ?auto_17583 ) ) ( AVAILABLE ?auto_17583 ) ( SURFACE-AT ?auto_17575 ?auto_17586 ) ( ON ?auto_17575 ?auto_17588 ) ( CLEAR ?auto_17575 ) ( not ( = ?auto_17569 ?auto_17588 ) ) ( not ( = ?auto_17570 ?auto_17588 ) ) ( not ( = ?auto_17571 ?auto_17588 ) ) ( not ( = ?auto_17575 ?auto_17588 ) ) ( not ( = ?auto_17581 ?auto_17588 ) ) ( not ( = ?auto_17582 ?auto_17588 ) ) ( SURFACE-AT ?auto_17573 ?auto_17580 ) ( CLEAR ?auto_17573 ) ( IS-CRATE ?auto_17582 ) ( not ( = ?auto_17569 ?auto_17573 ) ) ( not ( = ?auto_17570 ?auto_17573 ) ) ( not ( = ?auto_17571 ?auto_17573 ) ) ( not ( = ?auto_17575 ?auto_17573 ) ) ( not ( = ?auto_17581 ?auto_17573 ) ) ( not ( = ?auto_17582 ?auto_17573 ) ) ( not ( = ?auto_17588 ?auto_17573 ) ) ( AVAILABLE ?auto_17584 ) ( not ( = ?auto_17585 ?auto_17580 ) ) ( not ( = ?auto_17572 ?auto_17585 ) ) ( not ( = ?auto_17576 ?auto_17585 ) ) ( not ( = ?auto_17586 ?auto_17585 ) ) ( HOIST-AT ?auto_17574 ?auto_17585 ) ( not ( = ?auto_17584 ?auto_17574 ) ) ( not ( = ?auto_17578 ?auto_17574 ) ) ( not ( = ?auto_17577 ?auto_17574 ) ) ( not ( = ?auto_17583 ?auto_17574 ) ) ( AVAILABLE ?auto_17574 ) ( SURFACE-AT ?auto_17582 ?auto_17585 ) ( ON ?auto_17582 ?auto_17579 ) ( CLEAR ?auto_17582 ) ( not ( = ?auto_17569 ?auto_17579 ) ) ( not ( = ?auto_17570 ?auto_17579 ) ) ( not ( = ?auto_17571 ?auto_17579 ) ) ( not ( = ?auto_17575 ?auto_17579 ) ) ( not ( = ?auto_17581 ?auto_17579 ) ) ( not ( = ?auto_17582 ?auto_17579 ) ) ( not ( = ?auto_17588 ?auto_17579 ) ) ( not ( = ?auto_17573 ?auto_17579 ) ) ( TRUCK-AT ?auto_17587 ?auto_17580 ) )
    :subtasks
    ( ( !DRIVE ?auto_17587 ?auto_17580 ?auto_17585 )
      ( MAKE-ON ?auto_17569 ?auto_17570 )
      ( MAKE-ON-VERIFY ?auto_17569 ?auto_17570 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17589 - SURFACE
      ?auto_17590 - SURFACE
    )
    :vars
    (
      ?auto_17595 - HOIST
      ?auto_17607 - PLACE
      ?auto_17594 - PLACE
      ?auto_17605 - HOIST
      ?auto_17593 - SURFACE
      ?auto_17591 - SURFACE
      ?auto_17592 - PLACE
      ?auto_17596 - HOIST
      ?auto_17601 - SURFACE
      ?auto_17606 - SURFACE
      ?auto_17608 - PLACE
      ?auto_17600 - HOIST
      ?auto_17603 - SURFACE
      ?auto_17599 - SURFACE
      ?auto_17598 - PLACE
      ?auto_17602 - HOIST
      ?auto_17597 - SURFACE
      ?auto_17604 - TRUCK
      ?auto_17609 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17595 ?auto_17607 ) ( IS-CRATE ?auto_17589 ) ( not ( = ?auto_17589 ?auto_17590 ) ) ( not ( = ?auto_17594 ?auto_17607 ) ) ( HOIST-AT ?auto_17605 ?auto_17594 ) ( not ( = ?auto_17595 ?auto_17605 ) ) ( AVAILABLE ?auto_17605 ) ( SURFACE-AT ?auto_17589 ?auto_17594 ) ( ON ?auto_17589 ?auto_17593 ) ( CLEAR ?auto_17589 ) ( not ( = ?auto_17589 ?auto_17593 ) ) ( not ( = ?auto_17590 ?auto_17593 ) ) ( IS-CRATE ?auto_17590 ) ( not ( = ?auto_17589 ?auto_17591 ) ) ( not ( = ?auto_17590 ?auto_17591 ) ) ( not ( = ?auto_17593 ?auto_17591 ) ) ( not ( = ?auto_17592 ?auto_17607 ) ) ( not ( = ?auto_17594 ?auto_17592 ) ) ( HOIST-AT ?auto_17596 ?auto_17592 ) ( not ( = ?auto_17595 ?auto_17596 ) ) ( not ( = ?auto_17605 ?auto_17596 ) ) ( AVAILABLE ?auto_17596 ) ( SURFACE-AT ?auto_17590 ?auto_17592 ) ( ON ?auto_17590 ?auto_17601 ) ( CLEAR ?auto_17590 ) ( not ( = ?auto_17589 ?auto_17601 ) ) ( not ( = ?auto_17590 ?auto_17601 ) ) ( not ( = ?auto_17593 ?auto_17601 ) ) ( not ( = ?auto_17591 ?auto_17601 ) ) ( IS-CRATE ?auto_17591 ) ( not ( = ?auto_17589 ?auto_17606 ) ) ( not ( = ?auto_17590 ?auto_17606 ) ) ( not ( = ?auto_17593 ?auto_17606 ) ) ( not ( = ?auto_17591 ?auto_17606 ) ) ( not ( = ?auto_17601 ?auto_17606 ) ) ( not ( = ?auto_17608 ?auto_17607 ) ) ( not ( = ?auto_17594 ?auto_17608 ) ) ( not ( = ?auto_17592 ?auto_17608 ) ) ( HOIST-AT ?auto_17600 ?auto_17608 ) ( not ( = ?auto_17595 ?auto_17600 ) ) ( not ( = ?auto_17605 ?auto_17600 ) ) ( not ( = ?auto_17596 ?auto_17600 ) ) ( AVAILABLE ?auto_17600 ) ( SURFACE-AT ?auto_17591 ?auto_17608 ) ( ON ?auto_17591 ?auto_17603 ) ( CLEAR ?auto_17591 ) ( not ( = ?auto_17589 ?auto_17603 ) ) ( not ( = ?auto_17590 ?auto_17603 ) ) ( not ( = ?auto_17593 ?auto_17603 ) ) ( not ( = ?auto_17591 ?auto_17603 ) ) ( not ( = ?auto_17601 ?auto_17603 ) ) ( not ( = ?auto_17606 ?auto_17603 ) ) ( IS-CRATE ?auto_17606 ) ( not ( = ?auto_17589 ?auto_17599 ) ) ( not ( = ?auto_17590 ?auto_17599 ) ) ( not ( = ?auto_17593 ?auto_17599 ) ) ( not ( = ?auto_17591 ?auto_17599 ) ) ( not ( = ?auto_17601 ?auto_17599 ) ) ( not ( = ?auto_17606 ?auto_17599 ) ) ( not ( = ?auto_17603 ?auto_17599 ) ) ( not ( = ?auto_17598 ?auto_17607 ) ) ( not ( = ?auto_17594 ?auto_17598 ) ) ( not ( = ?auto_17592 ?auto_17598 ) ) ( not ( = ?auto_17608 ?auto_17598 ) ) ( HOIST-AT ?auto_17602 ?auto_17598 ) ( not ( = ?auto_17595 ?auto_17602 ) ) ( not ( = ?auto_17605 ?auto_17602 ) ) ( not ( = ?auto_17596 ?auto_17602 ) ) ( not ( = ?auto_17600 ?auto_17602 ) ) ( AVAILABLE ?auto_17602 ) ( SURFACE-AT ?auto_17606 ?auto_17598 ) ( ON ?auto_17606 ?auto_17597 ) ( CLEAR ?auto_17606 ) ( not ( = ?auto_17589 ?auto_17597 ) ) ( not ( = ?auto_17590 ?auto_17597 ) ) ( not ( = ?auto_17593 ?auto_17597 ) ) ( not ( = ?auto_17591 ?auto_17597 ) ) ( not ( = ?auto_17601 ?auto_17597 ) ) ( not ( = ?auto_17606 ?auto_17597 ) ) ( not ( = ?auto_17603 ?auto_17597 ) ) ( not ( = ?auto_17599 ?auto_17597 ) ) ( TRUCK-AT ?auto_17604 ?auto_17607 ) ( SURFACE-AT ?auto_17609 ?auto_17607 ) ( CLEAR ?auto_17609 ) ( LIFTING ?auto_17595 ?auto_17599 ) ( IS-CRATE ?auto_17599 ) ( not ( = ?auto_17589 ?auto_17609 ) ) ( not ( = ?auto_17590 ?auto_17609 ) ) ( not ( = ?auto_17593 ?auto_17609 ) ) ( not ( = ?auto_17591 ?auto_17609 ) ) ( not ( = ?auto_17601 ?auto_17609 ) ) ( not ( = ?auto_17606 ?auto_17609 ) ) ( not ( = ?auto_17603 ?auto_17609 ) ) ( not ( = ?auto_17599 ?auto_17609 ) ) ( not ( = ?auto_17597 ?auto_17609 ) ) )
    :subtasks
    ( ( !DROP ?auto_17595 ?auto_17599 ?auto_17609 ?auto_17607 )
      ( MAKE-ON ?auto_17589 ?auto_17590 )
      ( MAKE-ON-VERIFY ?auto_17589 ?auto_17590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17610 - SURFACE
      ?auto_17611 - SURFACE
    )
    :vars
    (
      ?auto_17612 - HOIST
      ?auto_17629 - PLACE
      ?auto_17613 - PLACE
      ?auto_17620 - HOIST
      ?auto_17614 - SURFACE
      ?auto_17622 - SURFACE
      ?auto_17615 - PLACE
      ?auto_17623 - HOIST
      ?auto_17624 - SURFACE
      ?auto_17617 - SURFACE
      ?auto_17630 - PLACE
      ?auto_17627 - HOIST
      ?auto_17628 - SURFACE
      ?auto_17621 - SURFACE
      ?auto_17626 - PLACE
      ?auto_17619 - HOIST
      ?auto_17618 - SURFACE
      ?auto_17625 - TRUCK
      ?auto_17616 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17612 ?auto_17629 ) ( IS-CRATE ?auto_17610 ) ( not ( = ?auto_17610 ?auto_17611 ) ) ( not ( = ?auto_17613 ?auto_17629 ) ) ( HOIST-AT ?auto_17620 ?auto_17613 ) ( not ( = ?auto_17612 ?auto_17620 ) ) ( AVAILABLE ?auto_17620 ) ( SURFACE-AT ?auto_17610 ?auto_17613 ) ( ON ?auto_17610 ?auto_17614 ) ( CLEAR ?auto_17610 ) ( not ( = ?auto_17610 ?auto_17614 ) ) ( not ( = ?auto_17611 ?auto_17614 ) ) ( IS-CRATE ?auto_17611 ) ( not ( = ?auto_17610 ?auto_17622 ) ) ( not ( = ?auto_17611 ?auto_17622 ) ) ( not ( = ?auto_17614 ?auto_17622 ) ) ( not ( = ?auto_17615 ?auto_17629 ) ) ( not ( = ?auto_17613 ?auto_17615 ) ) ( HOIST-AT ?auto_17623 ?auto_17615 ) ( not ( = ?auto_17612 ?auto_17623 ) ) ( not ( = ?auto_17620 ?auto_17623 ) ) ( AVAILABLE ?auto_17623 ) ( SURFACE-AT ?auto_17611 ?auto_17615 ) ( ON ?auto_17611 ?auto_17624 ) ( CLEAR ?auto_17611 ) ( not ( = ?auto_17610 ?auto_17624 ) ) ( not ( = ?auto_17611 ?auto_17624 ) ) ( not ( = ?auto_17614 ?auto_17624 ) ) ( not ( = ?auto_17622 ?auto_17624 ) ) ( IS-CRATE ?auto_17622 ) ( not ( = ?auto_17610 ?auto_17617 ) ) ( not ( = ?auto_17611 ?auto_17617 ) ) ( not ( = ?auto_17614 ?auto_17617 ) ) ( not ( = ?auto_17622 ?auto_17617 ) ) ( not ( = ?auto_17624 ?auto_17617 ) ) ( not ( = ?auto_17630 ?auto_17629 ) ) ( not ( = ?auto_17613 ?auto_17630 ) ) ( not ( = ?auto_17615 ?auto_17630 ) ) ( HOIST-AT ?auto_17627 ?auto_17630 ) ( not ( = ?auto_17612 ?auto_17627 ) ) ( not ( = ?auto_17620 ?auto_17627 ) ) ( not ( = ?auto_17623 ?auto_17627 ) ) ( AVAILABLE ?auto_17627 ) ( SURFACE-AT ?auto_17622 ?auto_17630 ) ( ON ?auto_17622 ?auto_17628 ) ( CLEAR ?auto_17622 ) ( not ( = ?auto_17610 ?auto_17628 ) ) ( not ( = ?auto_17611 ?auto_17628 ) ) ( not ( = ?auto_17614 ?auto_17628 ) ) ( not ( = ?auto_17622 ?auto_17628 ) ) ( not ( = ?auto_17624 ?auto_17628 ) ) ( not ( = ?auto_17617 ?auto_17628 ) ) ( IS-CRATE ?auto_17617 ) ( not ( = ?auto_17610 ?auto_17621 ) ) ( not ( = ?auto_17611 ?auto_17621 ) ) ( not ( = ?auto_17614 ?auto_17621 ) ) ( not ( = ?auto_17622 ?auto_17621 ) ) ( not ( = ?auto_17624 ?auto_17621 ) ) ( not ( = ?auto_17617 ?auto_17621 ) ) ( not ( = ?auto_17628 ?auto_17621 ) ) ( not ( = ?auto_17626 ?auto_17629 ) ) ( not ( = ?auto_17613 ?auto_17626 ) ) ( not ( = ?auto_17615 ?auto_17626 ) ) ( not ( = ?auto_17630 ?auto_17626 ) ) ( HOIST-AT ?auto_17619 ?auto_17626 ) ( not ( = ?auto_17612 ?auto_17619 ) ) ( not ( = ?auto_17620 ?auto_17619 ) ) ( not ( = ?auto_17623 ?auto_17619 ) ) ( not ( = ?auto_17627 ?auto_17619 ) ) ( AVAILABLE ?auto_17619 ) ( SURFACE-AT ?auto_17617 ?auto_17626 ) ( ON ?auto_17617 ?auto_17618 ) ( CLEAR ?auto_17617 ) ( not ( = ?auto_17610 ?auto_17618 ) ) ( not ( = ?auto_17611 ?auto_17618 ) ) ( not ( = ?auto_17614 ?auto_17618 ) ) ( not ( = ?auto_17622 ?auto_17618 ) ) ( not ( = ?auto_17624 ?auto_17618 ) ) ( not ( = ?auto_17617 ?auto_17618 ) ) ( not ( = ?auto_17628 ?auto_17618 ) ) ( not ( = ?auto_17621 ?auto_17618 ) ) ( TRUCK-AT ?auto_17625 ?auto_17629 ) ( SURFACE-AT ?auto_17616 ?auto_17629 ) ( CLEAR ?auto_17616 ) ( IS-CRATE ?auto_17621 ) ( not ( = ?auto_17610 ?auto_17616 ) ) ( not ( = ?auto_17611 ?auto_17616 ) ) ( not ( = ?auto_17614 ?auto_17616 ) ) ( not ( = ?auto_17622 ?auto_17616 ) ) ( not ( = ?auto_17624 ?auto_17616 ) ) ( not ( = ?auto_17617 ?auto_17616 ) ) ( not ( = ?auto_17628 ?auto_17616 ) ) ( not ( = ?auto_17621 ?auto_17616 ) ) ( not ( = ?auto_17618 ?auto_17616 ) ) ( AVAILABLE ?auto_17612 ) ( IN ?auto_17621 ?auto_17625 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17612 ?auto_17621 ?auto_17625 ?auto_17629 )
      ( MAKE-ON ?auto_17610 ?auto_17611 )
      ( MAKE-ON-VERIFY ?auto_17610 ?auto_17611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17631 - SURFACE
      ?auto_17632 - SURFACE
    )
    :vars
    (
      ?auto_17646 - HOIST
      ?auto_17634 - PLACE
      ?auto_17639 - PLACE
      ?auto_17643 - HOIST
      ?auto_17637 - SURFACE
      ?auto_17648 - SURFACE
      ?auto_17638 - PLACE
      ?auto_17644 - HOIST
      ?auto_17650 - SURFACE
      ?auto_17642 - SURFACE
      ?auto_17633 - PLACE
      ?auto_17649 - HOIST
      ?auto_17635 - SURFACE
      ?auto_17645 - SURFACE
      ?auto_17647 - PLACE
      ?auto_17651 - HOIST
      ?auto_17641 - SURFACE
      ?auto_17640 - SURFACE
      ?auto_17636 - TRUCK
      ?auto_17652 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17646 ?auto_17634 ) ( IS-CRATE ?auto_17631 ) ( not ( = ?auto_17631 ?auto_17632 ) ) ( not ( = ?auto_17639 ?auto_17634 ) ) ( HOIST-AT ?auto_17643 ?auto_17639 ) ( not ( = ?auto_17646 ?auto_17643 ) ) ( AVAILABLE ?auto_17643 ) ( SURFACE-AT ?auto_17631 ?auto_17639 ) ( ON ?auto_17631 ?auto_17637 ) ( CLEAR ?auto_17631 ) ( not ( = ?auto_17631 ?auto_17637 ) ) ( not ( = ?auto_17632 ?auto_17637 ) ) ( IS-CRATE ?auto_17632 ) ( not ( = ?auto_17631 ?auto_17648 ) ) ( not ( = ?auto_17632 ?auto_17648 ) ) ( not ( = ?auto_17637 ?auto_17648 ) ) ( not ( = ?auto_17638 ?auto_17634 ) ) ( not ( = ?auto_17639 ?auto_17638 ) ) ( HOIST-AT ?auto_17644 ?auto_17638 ) ( not ( = ?auto_17646 ?auto_17644 ) ) ( not ( = ?auto_17643 ?auto_17644 ) ) ( AVAILABLE ?auto_17644 ) ( SURFACE-AT ?auto_17632 ?auto_17638 ) ( ON ?auto_17632 ?auto_17650 ) ( CLEAR ?auto_17632 ) ( not ( = ?auto_17631 ?auto_17650 ) ) ( not ( = ?auto_17632 ?auto_17650 ) ) ( not ( = ?auto_17637 ?auto_17650 ) ) ( not ( = ?auto_17648 ?auto_17650 ) ) ( IS-CRATE ?auto_17648 ) ( not ( = ?auto_17631 ?auto_17642 ) ) ( not ( = ?auto_17632 ?auto_17642 ) ) ( not ( = ?auto_17637 ?auto_17642 ) ) ( not ( = ?auto_17648 ?auto_17642 ) ) ( not ( = ?auto_17650 ?auto_17642 ) ) ( not ( = ?auto_17633 ?auto_17634 ) ) ( not ( = ?auto_17639 ?auto_17633 ) ) ( not ( = ?auto_17638 ?auto_17633 ) ) ( HOIST-AT ?auto_17649 ?auto_17633 ) ( not ( = ?auto_17646 ?auto_17649 ) ) ( not ( = ?auto_17643 ?auto_17649 ) ) ( not ( = ?auto_17644 ?auto_17649 ) ) ( AVAILABLE ?auto_17649 ) ( SURFACE-AT ?auto_17648 ?auto_17633 ) ( ON ?auto_17648 ?auto_17635 ) ( CLEAR ?auto_17648 ) ( not ( = ?auto_17631 ?auto_17635 ) ) ( not ( = ?auto_17632 ?auto_17635 ) ) ( not ( = ?auto_17637 ?auto_17635 ) ) ( not ( = ?auto_17648 ?auto_17635 ) ) ( not ( = ?auto_17650 ?auto_17635 ) ) ( not ( = ?auto_17642 ?auto_17635 ) ) ( IS-CRATE ?auto_17642 ) ( not ( = ?auto_17631 ?auto_17645 ) ) ( not ( = ?auto_17632 ?auto_17645 ) ) ( not ( = ?auto_17637 ?auto_17645 ) ) ( not ( = ?auto_17648 ?auto_17645 ) ) ( not ( = ?auto_17650 ?auto_17645 ) ) ( not ( = ?auto_17642 ?auto_17645 ) ) ( not ( = ?auto_17635 ?auto_17645 ) ) ( not ( = ?auto_17647 ?auto_17634 ) ) ( not ( = ?auto_17639 ?auto_17647 ) ) ( not ( = ?auto_17638 ?auto_17647 ) ) ( not ( = ?auto_17633 ?auto_17647 ) ) ( HOIST-AT ?auto_17651 ?auto_17647 ) ( not ( = ?auto_17646 ?auto_17651 ) ) ( not ( = ?auto_17643 ?auto_17651 ) ) ( not ( = ?auto_17644 ?auto_17651 ) ) ( not ( = ?auto_17649 ?auto_17651 ) ) ( AVAILABLE ?auto_17651 ) ( SURFACE-AT ?auto_17642 ?auto_17647 ) ( ON ?auto_17642 ?auto_17641 ) ( CLEAR ?auto_17642 ) ( not ( = ?auto_17631 ?auto_17641 ) ) ( not ( = ?auto_17632 ?auto_17641 ) ) ( not ( = ?auto_17637 ?auto_17641 ) ) ( not ( = ?auto_17648 ?auto_17641 ) ) ( not ( = ?auto_17650 ?auto_17641 ) ) ( not ( = ?auto_17642 ?auto_17641 ) ) ( not ( = ?auto_17635 ?auto_17641 ) ) ( not ( = ?auto_17645 ?auto_17641 ) ) ( SURFACE-AT ?auto_17640 ?auto_17634 ) ( CLEAR ?auto_17640 ) ( IS-CRATE ?auto_17645 ) ( not ( = ?auto_17631 ?auto_17640 ) ) ( not ( = ?auto_17632 ?auto_17640 ) ) ( not ( = ?auto_17637 ?auto_17640 ) ) ( not ( = ?auto_17648 ?auto_17640 ) ) ( not ( = ?auto_17650 ?auto_17640 ) ) ( not ( = ?auto_17642 ?auto_17640 ) ) ( not ( = ?auto_17635 ?auto_17640 ) ) ( not ( = ?auto_17645 ?auto_17640 ) ) ( not ( = ?auto_17641 ?auto_17640 ) ) ( AVAILABLE ?auto_17646 ) ( IN ?auto_17645 ?auto_17636 ) ( TRUCK-AT ?auto_17636 ?auto_17652 ) ( not ( = ?auto_17652 ?auto_17634 ) ) ( not ( = ?auto_17639 ?auto_17652 ) ) ( not ( = ?auto_17638 ?auto_17652 ) ) ( not ( = ?auto_17633 ?auto_17652 ) ) ( not ( = ?auto_17647 ?auto_17652 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17636 ?auto_17652 ?auto_17634 )
      ( MAKE-ON ?auto_17631 ?auto_17632 )
      ( MAKE-ON-VERIFY ?auto_17631 ?auto_17632 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17653 - SURFACE
      ?auto_17654 - SURFACE
    )
    :vars
    (
      ?auto_17666 - HOIST
      ?auto_17668 - PLACE
      ?auto_17674 - PLACE
      ?auto_17659 - HOIST
      ?auto_17656 - SURFACE
      ?auto_17673 - SURFACE
      ?auto_17658 - PLACE
      ?auto_17669 - HOIST
      ?auto_17661 - SURFACE
      ?auto_17670 - SURFACE
      ?auto_17672 - PLACE
      ?auto_17660 - HOIST
      ?auto_17665 - SURFACE
      ?auto_17664 - SURFACE
      ?auto_17671 - PLACE
      ?auto_17662 - HOIST
      ?auto_17667 - SURFACE
      ?auto_17663 - SURFACE
      ?auto_17657 - TRUCK
      ?auto_17655 - PLACE
      ?auto_17675 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17666 ?auto_17668 ) ( IS-CRATE ?auto_17653 ) ( not ( = ?auto_17653 ?auto_17654 ) ) ( not ( = ?auto_17674 ?auto_17668 ) ) ( HOIST-AT ?auto_17659 ?auto_17674 ) ( not ( = ?auto_17666 ?auto_17659 ) ) ( AVAILABLE ?auto_17659 ) ( SURFACE-AT ?auto_17653 ?auto_17674 ) ( ON ?auto_17653 ?auto_17656 ) ( CLEAR ?auto_17653 ) ( not ( = ?auto_17653 ?auto_17656 ) ) ( not ( = ?auto_17654 ?auto_17656 ) ) ( IS-CRATE ?auto_17654 ) ( not ( = ?auto_17653 ?auto_17673 ) ) ( not ( = ?auto_17654 ?auto_17673 ) ) ( not ( = ?auto_17656 ?auto_17673 ) ) ( not ( = ?auto_17658 ?auto_17668 ) ) ( not ( = ?auto_17674 ?auto_17658 ) ) ( HOIST-AT ?auto_17669 ?auto_17658 ) ( not ( = ?auto_17666 ?auto_17669 ) ) ( not ( = ?auto_17659 ?auto_17669 ) ) ( AVAILABLE ?auto_17669 ) ( SURFACE-AT ?auto_17654 ?auto_17658 ) ( ON ?auto_17654 ?auto_17661 ) ( CLEAR ?auto_17654 ) ( not ( = ?auto_17653 ?auto_17661 ) ) ( not ( = ?auto_17654 ?auto_17661 ) ) ( not ( = ?auto_17656 ?auto_17661 ) ) ( not ( = ?auto_17673 ?auto_17661 ) ) ( IS-CRATE ?auto_17673 ) ( not ( = ?auto_17653 ?auto_17670 ) ) ( not ( = ?auto_17654 ?auto_17670 ) ) ( not ( = ?auto_17656 ?auto_17670 ) ) ( not ( = ?auto_17673 ?auto_17670 ) ) ( not ( = ?auto_17661 ?auto_17670 ) ) ( not ( = ?auto_17672 ?auto_17668 ) ) ( not ( = ?auto_17674 ?auto_17672 ) ) ( not ( = ?auto_17658 ?auto_17672 ) ) ( HOIST-AT ?auto_17660 ?auto_17672 ) ( not ( = ?auto_17666 ?auto_17660 ) ) ( not ( = ?auto_17659 ?auto_17660 ) ) ( not ( = ?auto_17669 ?auto_17660 ) ) ( AVAILABLE ?auto_17660 ) ( SURFACE-AT ?auto_17673 ?auto_17672 ) ( ON ?auto_17673 ?auto_17665 ) ( CLEAR ?auto_17673 ) ( not ( = ?auto_17653 ?auto_17665 ) ) ( not ( = ?auto_17654 ?auto_17665 ) ) ( not ( = ?auto_17656 ?auto_17665 ) ) ( not ( = ?auto_17673 ?auto_17665 ) ) ( not ( = ?auto_17661 ?auto_17665 ) ) ( not ( = ?auto_17670 ?auto_17665 ) ) ( IS-CRATE ?auto_17670 ) ( not ( = ?auto_17653 ?auto_17664 ) ) ( not ( = ?auto_17654 ?auto_17664 ) ) ( not ( = ?auto_17656 ?auto_17664 ) ) ( not ( = ?auto_17673 ?auto_17664 ) ) ( not ( = ?auto_17661 ?auto_17664 ) ) ( not ( = ?auto_17670 ?auto_17664 ) ) ( not ( = ?auto_17665 ?auto_17664 ) ) ( not ( = ?auto_17671 ?auto_17668 ) ) ( not ( = ?auto_17674 ?auto_17671 ) ) ( not ( = ?auto_17658 ?auto_17671 ) ) ( not ( = ?auto_17672 ?auto_17671 ) ) ( HOIST-AT ?auto_17662 ?auto_17671 ) ( not ( = ?auto_17666 ?auto_17662 ) ) ( not ( = ?auto_17659 ?auto_17662 ) ) ( not ( = ?auto_17669 ?auto_17662 ) ) ( not ( = ?auto_17660 ?auto_17662 ) ) ( AVAILABLE ?auto_17662 ) ( SURFACE-AT ?auto_17670 ?auto_17671 ) ( ON ?auto_17670 ?auto_17667 ) ( CLEAR ?auto_17670 ) ( not ( = ?auto_17653 ?auto_17667 ) ) ( not ( = ?auto_17654 ?auto_17667 ) ) ( not ( = ?auto_17656 ?auto_17667 ) ) ( not ( = ?auto_17673 ?auto_17667 ) ) ( not ( = ?auto_17661 ?auto_17667 ) ) ( not ( = ?auto_17670 ?auto_17667 ) ) ( not ( = ?auto_17665 ?auto_17667 ) ) ( not ( = ?auto_17664 ?auto_17667 ) ) ( SURFACE-AT ?auto_17663 ?auto_17668 ) ( CLEAR ?auto_17663 ) ( IS-CRATE ?auto_17664 ) ( not ( = ?auto_17653 ?auto_17663 ) ) ( not ( = ?auto_17654 ?auto_17663 ) ) ( not ( = ?auto_17656 ?auto_17663 ) ) ( not ( = ?auto_17673 ?auto_17663 ) ) ( not ( = ?auto_17661 ?auto_17663 ) ) ( not ( = ?auto_17670 ?auto_17663 ) ) ( not ( = ?auto_17665 ?auto_17663 ) ) ( not ( = ?auto_17664 ?auto_17663 ) ) ( not ( = ?auto_17667 ?auto_17663 ) ) ( AVAILABLE ?auto_17666 ) ( TRUCK-AT ?auto_17657 ?auto_17655 ) ( not ( = ?auto_17655 ?auto_17668 ) ) ( not ( = ?auto_17674 ?auto_17655 ) ) ( not ( = ?auto_17658 ?auto_17655 ) ) ( not ( = ?auto_17672 ?auto_17655 ) ) ( not ( = ?auto_17671 ?auto_17655 ) ) ( HOIST-AT ?auto_17675 ?auto_17655 ) ( LIFTING ?auto_17675 ?auto_17664 ) ( not ( = ?auto_17666 ?auto_17675 ) ) ( not ( = ?auto_17659 ?auto_17675 ) ) ( not ( = ?auto_17669 ?auto_17675 ) ) ( not ( = ?auto_17660 ?auto_17675 ) ) ( not ( = ?auto_17662 ?auto_17675 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17675 ?auto_17664 ?auto_17657 ?auto_17655 )
      ( MAKE-ON ?auto_17653 ?auto_17654 )
      ( MAKE-ON-VERIFY ?auto_17653 ?auto_17654 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17676 - SURFACE
      ?auto_17677 - SURFACE
    )
    :vars
    (
      ?auto_17679 - HOIST
      ?auto_17688 - PLACE
      ?auto_17695 - PLACE
      ?auto_17682 - HOIST
      ?auto_17680 - SURFACE
      ?auto_17683 - SURFACE
      ?auto_17692 - PLACE
      ?auto_17693 - HOIST
      ?auto_17697 - SURFACE
      ?auto_17685 - SURFACE
      ?auto_17686 - PLACE
      ?auto_17678 - HOIST
      ?auto_17681 - SURFACE
      ?auto_17689 - SURFACE
      ?auto_17684 - PLACE
      ?auto_17687 - HOIST
      ?auto_17690 - SURFACE
      ?auto_17698 - SURFACE
      ?auto_17691 - TRUCK
      ?auto_17694 - PLACE
      ?auto_17696 - HOIST
      ?auto_17699 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17679 ?auto_17688 ) ( IS-CRATE ?auto_17676 ) ( not ( = ?auto_17676 ?auto_17677 ) ) ( not ( = ?auto_17695 ?auto_17688 ) ) ( HOIST-AT ?auto_17682 ?auto_17695 ) ( not ( = ?auto_17679 ?auto_17682 ) ) ( AVAILABLE ?auto_17682 ) ( SURFACE-AT ?auto_17676 ?auto_17695 ) ( ON ?auto_17676 ?auto_17680 ) ( CLEAR ?auto_17676 ) ( not ( = ?auto_17676 ?auto_17680 ) ) ( not ( = ?auto_17677 ?auto_17680 ) ) ( IS-CRATE ?auto_17677 ) ( not ( = ?auto_17676 ?auto_17683 ) ) ( not ( = ?auto_17677 ?auto_17683 ) ) ( not ( = ?auto_17680 ?auto_17683 ) ) ( not ( = ?auto_17692 ?auto_17688 ) ) ( not ( = ?auto_17695 ?auto_17692 ) ) ( HOIST-AT ?auto_17693 ?auto_17692 ) ( not ( = ?auto_17679 ?auto_17693 ) ) ( not ( = ?auto_17682 ?auto_17693 ) ) ( AVAILABLE ?auto_17693 ) ( SURFACE-AT ?auto_17677 ?auto_17692 ) ( ON ?auto_17677 ?auto_17697 ) ( CLEAR ?auto_17677 ) ( not ( = ?auto_17676 ?auto_17697 ) ) ( not ( = ?auto_17677 ?auto_17697 ) ) ( not ( = ?auto_17680 ?auto_17697 ) ) ( not ( = ?auto_17683 ?auto_17697 ) ) ( IS-CRATE ?auto_17683 ) ( not ( = ?auto_17676 ?auto_17685 ) ) ( not ( = ?auto_17677 ?auto_17685 ) ) ( not ( = ?auto_17680 ?auto_17685 ) ) ( not ( = ?auto_17683 ?auto_17685 ) ) ( not ( = ?auto_17697 ?auto_17685 ) ) ( not ( = ?auto_17686 ?auto_17688 ) ) ( not ( = ?auto_17695 ?auto_17686 ) ) ( not ( = ?auto_17692 ?auto_17686 ) ) ( HOIST-AT ?auto_17678 ?auto_17686 ) ( not ( = ?auto_17679 ?auto_17678 ) ) ( not ( = ?auto_17682 ?auto_17678 ) ) ( not ( = ?auto_17693 ?auto_17678 ) ) ( AVAILABLE ?auto_17678 ) ( SURFACE-AT ?auto_17683 ?auto_17686 ) ( ON ?auto_17683 ?auto_17681 ) ( CLEAR ?auto_17683 ) ( not ( = ?auto_17676 ?auto_17681 ) ) ( not ( = ?auto_17677 ?auto_17681 ) ) ( not ( = ?auto_17680 ?auto_17681 ) ) ( not ( = ?auto_17683 ?auto_17681 ) ) ( not ( = ?auto_17697 ?auto_17681 ) ) ( not ( = ?auto_17685 ?auto_17681 ) ) ( IS-CRATE ?auto_17685 ) ( not ( = ?auto_17676 ?auto_17689 ) ) ( not ( = ?auto_17677 ?auto_17689 ) ) ( not ( = ?auto_17680 ?auto_17689 ) ) ( not ( = ?auto_17683 ?auto_17689 ) ) ( not ( = ?auto_17697 ?auto_17689 ) ) ( not ( = ?auto_17685 ?auto_17689 ) ) ( not ( = ?auto_17681 ?auto_17689 ) ) ( not ( = ?auto_17684 ?auto_17688 ) ) ( not ( = ?auto_17695 ?auto_17684 ) ) ( not ( = ?auto_17692 ?auto_17684 ) ) ( not ( = ?auto_17686 ?auto_17684 ) ) ( HOIST-AT ?auto_17687 ?auto_17684 ) ( not ( = ?auto_17679 ?auto_17687 ) ) ( not ( = ?auto_17682 ?auto_17687 ) ) ( not ( = ?auto_17693 ?auto_17687 ) ) ( not ( = ?auto_17678 ?auto_17687 ) ) ( AVAILABLE ?auto_17687 ) ( SURFACE-AT ?auto_17685 ?auto_17684 ) ( ON ?auto_17685 ?auto_17690 ) ( CLEAR ?auto_17685 ) ( not ( = ?auto_17676 ?auto_17690 ) ) ( not ( = ?auto_17677 ?auto_17690 ) ) ( not ( = ?auto_17680 ?auto_17690 ) ) ( not ( = ?auto_17683 ?auto_17690 ) ) ( not ( = ?auto_17697 ?auto_17690 ) ) ( not ( = ?auto_17685 ?auto_17690 ) ) ( not ( = ?auto_17681 ?auto_17690 ) ) ( not ( = ?auto_17689 ?auto_17690 ) ) ( SURFACE-AT ?auto_17698 ?auto_17688 ) ( CLEAR ?auto_17698 ) ( IS-CRATE ?auto_17689 ) ( not ( = ?auto_17676 ?auto_17698 ) ) ( not ( = ?auto_17677 ?auto_17698 ) ) ( not ( = ?auto_17680 ?auto_17698 ) ) ( not ( = ?auto_17683 ?auto_17698 ) ) ( not ( = ?auto_17697 ?auto_17698 ) ) ( not ( = ?auto_17685 ?auto_17698 ) ) ( not ( = ?auto_17681 ?auto_17698 ) ) ( not ( = ?auto_17689 ?auto_17698 ) ) ( not ( = ?auto_17690 ?auto_17698 ) ) ( AVAILABLE ?auto_17679 ) ( TRUCK-AT ?auto_17691 ?auto_17694 ) ( not ( = ?auto_17694 ?auto_17688 ) ) ( not ( = ?auto_17695 ?auto_17694 ) ) ( not ( = ?auto_17692 ?auto_17694 ) ) ( not ( = ?auto_17686 ?auto_17694 ) ) ( not ( = ?auto_17684 ?auto_17694 ) ) ( HOIST-AT ?auto_17696 ?auto_17694 ) ( not ( = ?auto_17679 ?auto_17696 ) ) ( not ( = ?auto_17682 ?auto_17696 ) ) ( not ( = ?auto_17693 ?auto_17696 ) ) ( not ( = ?auto_17678 ?auto_17696 ) ) ( not ( = ?auto_17687 ?auto_17696 ) ) ( AVAILABLE ?auto_17696 ) ( SURFACE-AT ?auto_17689 ?auto_17694 ) ( ON ?auto_17689 ?auto_17699 ) ( CLEAR ?auto_17689 ) ( not ( = ?auto_17676 ?auto_17699 ) ) ( not ( = ?auto_17677 ?auto_17699 ) ) ( not ( = ?auto_17680 ?auto_17699 ) ) ( not ( = ?auto_17683 ?auto_17699 ) ) ( not ( = ?auto_17697 ?auto_17699 ) ) ( not ( = ?auto_17685 ?auto_17699 ) ) ( not ( = ?auto_17681 ?auto_17699 ) ) ( not ( = ?auto_17689 ?auto_17699 ) ) ( not ( = ?auto_17690 ?auto_17699 ) ) ( not ( = ?auto_17698 ?auto_17699 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17696 ?auto_17689 ?auto_17699 ?auto_17694 )
      ( MAKE-ON ?auto_17676 ?auto_17677 )
      ( MAKE-ON-VERIFY ?auto_17676 ?auto_17677 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17700 - SURFACE
      ?auto_17701 - SURFACE
    )
    :vars
    (
      ?auto_17715 - HOIST
      ?auto_17704 - PLACE
      ?auto_17723 - PLACE
      ?auto_17717 - HOIST
      ?auto_17710 - SURFACE
      ?auto_17703 - SURFACE
      ?auto_17708 - PLACE
      ?auto_17707 - HOIST
      ?auto_17702 - SURFACE
      ?auto_17718 - SURFACE
      ?auto_17712 - PLACE
      ?auto_17713 - HOIST
      ?auto_17719 - SURFACE
      ?auto_17716 - SURFACE
      ?auto_17705 - PLACE
      ?auto_17720 - HOIST
      ?auto_17721 - SURFACE
      ?auto_17711 - SURFACE
      ?auto_17722 - PLACE
      ?auto_17709 - HOIST
      ?auto_17714 - SURFACE
      ?auto_17706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17715 ?auto_17704 ) ( IS-CRATE ?auto_17700 ) ( not ( = ?auto_17700 ?auto_17701 ) ) ( not ( = ?auto_17723 ?auto_17704 ) ) ( HOIST-AT ?auto_17717 ?auto_17723 ) ( not ( = ?auto_17715 ?auto_17717 ) ) ( AVAILABLE ?auto_17717 ) ( SURFACE-AT ?auto_17700 ?auto_17723 ) ( ON ?auto_17700 ?auto_17710 ) ( CLEAR ?auto_17700 ) ( not ( = ?auto_17700 ?auto_17710 ) ) ( not ( = ?auto_17701 ?auto_17710 ) ) ( IS-CRATE ?auto_17701 ) ( not ( = ?auto_17700 ?auto_17703 ) ) ( not ( = ?auto_17701 ?auto_17703 ) ) ( not ( = ?auto_17710 ?auto_17703 ) ) ( not ( = ?auto_17708 ?auto_17704 ) ) ( not ( = ?auto_17723 ?auto_17708 ) ) ( HOIST-AT ?auto_17707 ?auto_17708 ) ( not ( = ?auto_17715 ?auto_17707 ) ) ( not ( = ?auto_17717 ?auto_17707 ) ) ( AVAILABLE ?auto_17707 ) ( SURFACE-AT ?auto_17701 ?auto_17708 ) ( ON ?auto_17701 ?auto_17702 ) ( CLEAR ?auto_17701 ) ( not ( = ?auto_17700 ?auto_17702 ) ) ( not ( = ?auto_17701 ?auto_17702 ) ) ( not ( = ?auto_17710 ?auto_17702 ) ) ( not ( = ?auto_17703 ?auto_17702 ) ) ( IS-CRATE ?auto_17703 ) ( not ( = ?auto_17700 ?auto_17718 ) ) ( not ( = ?auto_17701 ?auto_17718 ) ) ( not ( = ?auto_17710 ?auto_17718 ) ) ( not ( = ?auto_17703 ?auto_17718 ) ) ( not ( = ?auto_17702 ?auto_17718 ) ) ( not ( = ?auto_17712 ?auto_17704 ) ) ( not ( = ?auto_17723 ?auto_17712 ) ) ( not ( = ?auto_17708 ?auto_17712 ) ) ( HOIST-AT ?auto_17713 ?auto_17712 ) ( not ( = ?auto_17715 ?auto_17713 ) ) ( not ( = ?auto_17717 ?auto_17713 ) ) ( not ( = ?auto_17707 ?auto_17713 ) ) ( AVAILABLE ?auto_17713 ) ( SURFACE-AT ?auto_17703 ?auto_17712 ) ( ON ?auto_17703 ?auto_17719 ) ( CLEAR ?auto_17703 ) ( not ( = ?auto_17700 ?auto_17719 ) ) ( not ( = ?auto_17701 ?auto_17719 ) ) ( not ( = ?auto_17710 ?auto_17719 ) ) ( not ( = ?auto_17703 ?auto_17719 ) ) ( not ( = ?auto_17702 ?auto_17719 ) ) ( not ( = ?auto_17718 ?auto_17719 ) ) ( IS-CRATE ?auto_17718 ) ( not ( = ?auto_17700 ?auto_17716 ) ) ( not ( = ?auto_17701 ?auto_17716 ) ) ( not ( = ?auto_17710 ?auto_17716 ) ) ( not ( = ?auto_17703 ?auto_17716 ) ) ( not ( = ?auto_17702 ?auto_17716 ) ) ( not ( = ?auto_17718 ?auto_17716 ) ) ( not ( = ?auto_17719 ?auto_17716 ) ) ( not ( = ?auto_17705 ?auto_17704 ) ) ( not ( = ?auto_17723 ?auto_17705 ) ) ( not ( = ?auto_17708 ?auto_17705 ) ) ( not ( = ?auto_17712 ?auto_17705 ) ) ( HOIST-AT ?auto_17720 ?auto_17705 ) ( not ( = ?auto_17715 ?auto_17720 ) ) ( not ( = ?auto_17717 ?auto_17720 ) ) ( not ( = ?auto_17707 ?auto_17720 ) ) ( not ( = ?auto_17713 ?auto_17720 ) ) ( AVAILABLE ?auto_17720 ) ( SURFACE-AT ?auto_17718 ?auto_17705 ) ( ON ?auto_17718 ?auto_17721 ) ( CLEAR ?auto_17718 ) ( not ( = ?auto_17700 ?auto_17721 ) ) ( not ( = ?auto_17701 ?auto_17721 ) ) ( not ( = ?auto_17710 ?auto_17721 ) ) ( not ( = ?auto_17703 ?auto_17721 ) ) ( not ( = ?auto_17702 ?auto_17721 ) ) ( not ( = ?auto_17718 ?auto_17721 ) ) ( not ( = ?auto_17719 ?auto_17721 ) ) ( not ( = ?auto_17716 ?auto_17721 ) ) ( SURFACE-AT ?auto_17711 ?auto_17704 ) ( CLEAR ?auto_17711 ) ( IS-CRATE ?auto_17716 ) ( not ( = ?auto_17700 ?auto_17711 ) ) ( not ( = ?auto_17701 ?auto_17711 ) ) ( not ( = ?auto_17710 ?auto_17711 ) ) ( not ( = ?auto_17703 ?auto_17711 ) ) ( not ( = ?auto_17702 ?auto_17711 ) ) ( not ( = ?auto_17718 ?auto_17711 ) ) ( not ( = ?auto_17719 ?auto_17711 ) ) ( not ( = ?auto_17716 ?auto_17711 ) ) ( not ( = ?auto_17721 ?auto_17711 ) ) ( AVAILABLE ?auto_17715 ) ( not ( = ?auto_17722 ?auto_17704 ) ) ( not ( = ?auto_17723 ?auto_17722 ) ) ( not ( = ?auto_17708 ?auto_17722 ) ) ( not ( = ?auto_17712 ?auto_17722 ) ) ( not ( = ?auto_17705 ?auto_17722 ) ) ( HOIST-AT ?auto_17709 ?auto_17722 ) ( not ( = ?auto_17715 ?auto_17709 ) ) ( not ( = ?auto_17717 ?auto_17709 ) ) ( not ( = ?auto_17707 ?auto_17709 ) ) ( not ( = ?auto_17713 ?auto_17709 ) ) ( not ( = ?auto_17720 ?auto_17709 ) ) ( AVAILABLE ?auto_17709 ) ( SURFACE-AT ?auto_17716 ?auto_17722 ) ( ON ?auto_17716 ?auto_17714 ) ( CLEAR ?auto_17716 ) ( not ( = ?auto_17700 ?auto_17714 ) ) ( not ( = ?auto_17701 ?auto_17714 ) ) ( not ( = ?auto_17710 ?auto_17714 ) ) ( not ( = ?auto_17703 ?auto_17714 ) ) ( not ( = ?auto_17702 ?auto_17714 ) ) ( not ( = ?auto_17718 ?auto_17714 ) ) ( not ( = ?auto_17719 ?auto_17714 ) ) ( not ( = ?auto_17716 ?auto_17714 ) ) ( not ( = ?auto_17721 ?auto_17714 ) ) ( not ( = ?auto_17711 ?auto_17714 ) ) ( TRUCK-AT ?auto_17706 ?auto_17704 ) )
    :subtasks
    ( ( !DRIVE ?auto_17706 ?auto_17704 ?auto_17722 )
      ( MAKE-ON ?auto_17700 ?auto_17701 )
      ( MAKE-ON-VERIFY ?auto_17700 ?auto_17701 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17726 - SURFACE
      ?auto_17727 - SURFACE
    )
    :vars
    (
      ?auto_17728 - HOIST
      ?auto_17729 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17728 ?auto_17729 ) ( SURFACE-AT ?auto_17727 ?auto_17729 ) ( CLEAR ?auto_17727 ) ( LIFTING ?auto_17728 ?auto_17726 ) ( IS-CRATE ?auto_17726 ) ( not ( = ?auto_17726 ?auto_17727 ) ) )
    :subtasks
    ( ( !DROP ?auto_17728 ?auto_17726 ?auto_17727 ?auto_17729 )
      ( MAKE-ON-VERIFY ?auto_17726 ?auto_17727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17730 - SURFACE
      ?auto_17731 - SURFACE
    )
    :vars
    (
      ?auto_17732 - HOIST
      ?auto_17733 - PLACE
      ?auto_17734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17732 ?auto_17733 ) ( SURFACE-AT ?auto_17731 ?auto_17733 ) ( CLEAR ?auto_17731 ) ( IS-CRATE ?auto_17730 ) ( not ( = ?auto_17730 ?auto_17731 ) ) ( TRUCK-AT ?auto_17734 ?auto_17733 ) ( AVAILABLE ?auto_17732 ) ( IN ?auto_17730 ?auto_17734 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17732 ?auto_17730 ?auto_17734 ?auto_17733 )
      ( MAKE-ON ?auto_17730 ?auto_17731 )
      ( MAKE-ON-VERIFY ?auto_17730 ?auto_17731 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17735 - SURFACE
      ?auto_17736 - SURFACE
    )
    :vars
    (
      ?auto_17738 - HOIST
      ?auto_17739 - PLACE
      ?auto_17737 - TRUCK
      ?auto_17740 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17738 ?auto_17739 ) ( SURFACE-AT ?auto_17736 ?auto_17739 ) ( CLEAR ?auto_17736 ) ( IS-CRATE ?auto_17735 ) ( not ( = ?auto_17735 ?auto_17736 ) ) ( AVAILABLE ?auto_17738 ) ( IN ?auto_17735 ?auto_17737 ) ( TRUCK-AT ?auto_17737 ?auto_17740 ) ( not ( = ?auto_17740 ?auto_17739 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17737 ?auto_17740 ?auto_17739 )
      ( MAKE-ON ?auto_17735 ?auto_17736 )
      ( MAKE-ON-VERIFY ?auto_17735 ?auto_17736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17741 - SURFACE
      ?auto_17742 - SURFACE
    )
    :vars
    (
      ?auto_17743 - HOIST
      ?auto_17746 - PLACE
      ?auto_17744 - TRUCK
      ?auto_17745 - PLACE
      ?auto_17747 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17743 ?auto_17746 ) ( SURFACE-AT ?auto_17742 ?auto_17746 ) ( CLEAR ?auto_17742 ) ( IS-CRATE ?auto_17741 ) ( not ( = ?auto_17741 ?auto_17742 ) ) ( AVAILABLE ?auto_17743 ) ( TRUCK-AT ?auto_17744 ?auto_17745 ) ( not ( = ?auto_17745 ?auto_17746 ) ) ( HOIST-AT ?auto_17747 ?auto_17745 ) ( LIFTING ?auto_17747 ?auto_17741 ) ( not ( = ?auto_17743 ?auto_17747 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17747 ?auto_17741 ?auto_17744 ?auto_17745 )
      ( MAKE-ON ?auto_17741 ?auto_17742 )
      ( MAKE-ON-VERIFY ?auto_17741 ?auto_17742 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17748 - SURFACE
      ?auto_17749 - SURFACE
    )
    :vars
    (
      ?auto_17750 - HOIST
      ?auto_17753 - PLACE
      ?auto_17754 - TRUCK
      ?auto_17751 - PLACE
      ?auto_17752 - HOIST
      ?auto_17755 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17750 ?auto_17753 ) ( SURFACE-AT ?auto_17749 ?auto_17753 ) ( CLEAR ?auto_17749 ) ( IS-CRATE ?auto_17748 ) ( not ( = ?auto_17748 ?auto_17749 ) ) ( AVAILABLE ?auto_17750 ) ( TRUCK-AT ?auto_17754 ?auto_17751 ) ( not ( = ?auto_17751 ?auto_17753 ) ) ( HOIST-AT ?auto_17752 ?auto_17751 ) ( not ( = ?auto_17750 ?auto_17752 ) ) ( AVAILABLE ?auto_17752 ) ( SURFACE-AT ?auto_17748 ?auto_17751 ) ( ON ?auto_17748 ?auto_17755 ) ( CLEAR ?auto_17748 ) ( not ( = ?auto_17748 ?auto_17755 ) ) ( not ( = ?auto_17749 ?auto_17755 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17752 ?auto_17748 ?auto_17755 ?auto_17751 )
      ( MAKE-ON ?auto_17748 ?auto_17749 )
      ( MAKE-ON-VERIFY ?auto_17748 ?auto_17749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17756 - SURFACE
      ?auto_17757 - SURFACE
    )
    :vars
    (
      ?auto_17763 - HOIST
      ?auto_17759 - PLACE
      ?auto_17761 - PLACE
      ?auto_17762 - HOIST
      ?auto_17758 - SURFACE
      ?auto_17760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17763 ?auto_17759 ) ( SURFACE-AT ?auto_17757 ?auto_17759 ) ( CLEAR ?auto_17757 ) ( IS-CRATE ?auto_17756 ) ( not ( = ?auto_17756 ?auto_17757 ) ) ( AVAILABLE ?auto_17763 ) ( not ( = ?auto_17761 ?auto_17759 ) ) ( HOIST-AT ?auto_17762 ?auto_17761 ) ( not ( = ?auto_17763 ?auto_17762 ) ) ( AVAILABLE ?auto_17762 ) ( SURFACE-AT ?auto_17756 ?auto_17761 ) ( ON ?auto_17756 ?auto_17758 ) ( CLEAR ?auto_17756 ) ( not ( = ?auto_17756 ?auto_17758 ) ) ( not ( = ?auto_17757 ?auto_17758 ) ) ( TRUCK-AT ?auto_17760 ?auto_17759 ) )
    :subtasks
    ( ( !DRIVE ?auto_17760 ?auto_17759 ?auto_17761 )
      ( MAKE-ON ?auto_17756 ?auto_17757 )
      ( MAKE-ON-VERIFY ?auto_17756 ?auto_17757 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17764 - SURFACE
      ?auto_17765 - SURFACE
    )
    :vars
    (
      ?auto_17770 - HOIST
      ?auto_17771 - PLACE
      ?auto_17769 - PLACE
      ?auto_17766 - HOIST
      ?auto_17767 - SURFACE
      ?auto_17768 - TRUCK
      ?auto_17772 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17770 ?auto_17771 ) ( IS-CRATE ?auto_17764 ) ( not ( = ?auto_17764 ?auto_17765 ) ) ( not ( = ?auto_17769 ?auto_17771 ) ) ( HOIST-AT ?auto_17766 ?auto_17769 ) ( not ( = ?auto_17770 ?auto_17766 ) ) ( AVAILABLE ?auto_17766 ) ( SURFACE-AT ?auto_17764 ?auto_17769 ) ( ON ?auto_17764 ?auto_17767 ) ( CLEAR ?auto_17764 ) ( not ( = ?auto_17764 ?auto_17767 ) ) ( not ( = ?auto_17765 ?auto_17767 ) ) ( TRUCK-AT ?auto_17768 ?auto_17771 ) ( SURFACE-AT ?auto_17772 ?auto_17771 ) ( CLEAR ?auto_17772 ) ( LIFTING ?auto_17770 ?auto_17765 ) ( IS-CRATE ?auto_17765 ) ( not ( = ?auto_17764 ?auto_17772 ) ) ( not ( = ?auto_17765 ?auto_17772 ) ) ( not ( = ?auto_17767 ?auto_17772 ) ) )
    :subtasks
    ( ( !DROP ?auto_17770 ?auto_17765 ?auto_17772 ?auto_17771 )
      ( MAKE-ON ?auto_17764 ?auto_17765 )
      ( MAKE-ON-VERIFY ?auto_17764 ?auto_17765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17773 - SURFACE
      ?auto_17774 - SURFACE
    )
    :vars
    (
      ?auto_17776 - HOIST
      ?auto_17781 - PLACE
      ?auto_17775 - PLACE
      ?auto_17777 - HOIST
      ?auto_17780 - SURFACE
      ?auto_17779 - TRUCK
      ?auto_17778 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17776 ?auto_17781 ) ( IS-CRATE ?auto_17773 ) ( not ( = ?auto_17773 ?auto_17774 ) ) ( not ( = ?auto_17775 ?auto_17781 ) ) ( HOIST-AT ?auto_17777 ?auto_17775 ) ( not ( = ?auto_17776 ?auto_17777 ) ) ( AVAILABLE ?auto_17777 ) ( SURFACE-AT ?auto_17773 ?auto_17775 ) ( ON ?auto_17773 ?auto_17780 ) ( CLEAR ?auto_17773 ) ( not ( = ?auto_17773 ?auto_17780 ) ) ( not ( = ?auto_17774 ?auto_17780 ) ) ( TRUCK-AT ?auto_17779 ?auto_17781 ) ( SURFACE-AT ?auto_17778 ?auto_17781 ) ( CLEAR ?auto_17778 ) ( IS-CRATE ?auto_17774 ) ( not ( = ?auto_17773 ?auto_17778 ) ) ( not ( = ?auto_17774 ?auto_17778 ) ) ( not ( = ?auto_17780 ?auto_17778 ) ) ( AVAILABLE ?auto_17776 ) ( IN ?auto_17774 ?auto_17779 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17776 ?auto_17774 ?auto_17779 ?auto_17781 )
      ( MAKE-ON ?auto_17773 ?auto_17774 )
      ( MAKE-ON-VERIFY ?auto_17773 ?auto_17774 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17782 - SURFACE
      ?auto_17783 - SURFACE
    )
    :vars
    (
      ?auto_17784 - HOIST
      ?auto_17790 - PLACE
      ?auto_17788 - PLACE
      ?auto_17785 - HOIST
      ?auto_17787 - SURFACE
      ?auto_17786 - SURFACE
      ?auto_17789 - TRUCK
      ?auto_17791 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17784 ?auto_17790 ) ( IS-CRATE ?auto_17782 ) ( not ( = ?auto_17782 ?auto_17783 ) ) ( not ( = ?auto_17788 ?auto_17790 ) ) ( HOIST-AT ?auto_17785 ?auto_17788 ) ( not ( = ?auto_17784 ?auto_17785 ) ) ( AVAILABLE ?auto_17785 ) ( SURFACE-AT ?auto_17782 ?auto_17788 ) ( ON ?auto_17782 ?auto_17787 ) ( CLEAR ?auto_17782 ) ( not ( = ?auto_17782 ?auto_17787 ) ) ( not ( = ?auto_17783 ?auto_17787 ) ) ( SURFACE-AT ?auto_17786 ?auto_17790 ) ( CLEAR ?auto_17786 ) ( IS-CRATE ?auto_17783 ) ( not ( = ?auto_17782 ?auto_17786 ) ) ( not ( = ?auto_17783 ?auto_17786 ) ) ( not ( = ?auto_17787 ?auto_17786 ) ) ( AVAILABLE ?auto_17784 ) ( IN ?auto_17783 ?auto_17789 ) ( TRUCK-AT ?auto_17789 ?auto_17791 ) ( not ( = ?auto_17791 ?auto_17790 ) ) ( not ( = ?auto_17788 ?auto_17791 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17789 ?auto_17791 ?auto_17790 )
      ( MAKE-ON ?auto_17782 ?auto_17783 )
      ( MAKE-ON-VERIFY ?auto_17782 ?auto_17783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17792 - SURFACE
      ?auto_17793 - SURFACE
    )
    :vars
    (
      ?auto_17801 - HOIST
      ?auto_17800 - PLACE
      ?auto_17795 - PLACE
      ?auto_17794 - HOIST
      ?auto_17799 - SURFACE
      ?auto_17797 - SURFACE
      ?auto_17796 - TRUCK
      ?auto_17798 - PLACE
      ?auto_17802 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17801 ?auto_17800 ) ( IS-CRATE ?auto_17792 ) ( not ( = ?auto_17792 ?auto_17793 ) ) ( not ( = ?auto_17795 ?auto_17800 ) ) ( HOIST-AT ?auto_17794 ?auto_17795 ) ( not ( = ?auto_17801 ?auto_17794 ) ) ( AVAILABLE ?auto_17794 ) ( SURFACE-AT ?auto_17792 ?auto_17795 ) ( ON ?auto_17792 ?auto_17799 ) ( CLEAR ?auto_17792 ) ( not ( = ?auto_17792 ?auto_17799 ) ) ( not ( = ?auto_17793 ?auto_17799 ) ) ( SURFACE-AT ?auto_17797 ?auto_17800 ) ( CLEAR ?auto_17797 ) ( IS-CRATE ?auto_17793 ) ( not ( = ?auto_17792 ?auto_17797 ) ) ( not ( = ?auto_17793 ?auto_17797 ) ) ( not ( = ?auto_17799 ?auto_17797 ) ) ( AVAILABLE ?auto_17801 ) ( TRUCK-AT ?auto_17796 ?auto_17798 ) ( not ( = ?auto_17798 ?auto_17800 ) ) ( not ( = ?auto_17795 ?auto_17798 ) ) ( HOIST-AT ?auto_17802 ?auto_17798 ) ( LIFTING ?auto_17802 ?auto_17793 ) ( not ( = ?auto_17801 ?auto_17802 ) ) ( not ( = ?auto_17794 ?auto_17802 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17802 ?auto_17793 ?auto_17796 ?auto_17798 )
      ( MAKE-ON ?auto_17792 ?auto_17793 )
      ( MAKE-ON-VERIFY ?auto_17792 ?auto_17793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17803 - SURFACE
      ?auto_17804 - SURFACE
    )
    :vars
    (
      ?auto_17808 - HOIST
      ?auto_17807 - PLACE
      ?auto_17810 - PLACE
      ?auto_17812 - HOIST
      ?auto_17813 - SURFACE
      ?auto_17805 - SURFACE
      ?auto_17806 - TRUCK
      ?auto_17809 - PLACE
      ?auto_17811 - HOIST
      ?auto_17814 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17808 ?auto_17807 ) ( IS-CRATE ?auto_17803 ) ( not ( = ?auto_17803 ?auto_17804 ) ) ( not ( = ?auto_17810 ?auto_17807 ) ) ( HOIST-AT ?auto_17812 ?auto_17810 ) ( not ( = ?auto_17808 ?auto_17812 ) ) ( AVAILABLE ?auto_17812 ) ( SURFACE-AT ?auto_17803 ?auto_17810 ) ( ON ?auto_17803 ?auto_17813 ) ( CLEAR ?auto_17803 ) ( not ( = ?auto_17803 ?auto_17813 ) ) ( not ( = ?auto_17804 ?auto_17813 ) ) ( SURFACE-AT ?auto_17805 ?auto_17807 ) ( CLEAR ?auto_17805 ) ( IS-CRATE ?auto_17804 ) ( not ( = ?auto_17803 ?auto_17805 ) ) ( not ( = ?auto_17804 ?auto_17805 ) ) ( not ( = ?auto_17813 ?auto_17805 ) ) ( AVAILABLE ?auto_17808 ) ( TRUCK-AT ?auto_17806 ?auto_17809 ) ( not ( = ?auto_17809 ?auto_17807 ) ) ( not ( = ?auto_17810 ?auto_17809 ) ) ( HOIST-AT ?auto_17811 ?auto_17809 ) ( not ( = ?auto_17808 ?auto_17811 ) ) ( not ( = ?auto_17812 ?auto_17811 ) ) ( AVAILABLE ?auto_17811 ) ( SURFACE-AT ?auto_17804 ?auto_17809 ) ( ON ?auto_17804 ?auto_17814 ) ( CLEAR ?auto_17804 ) ( not ( = ?auto_17803 ?auto_17814 ) ) ( not ( = ?auto_17804 ?auto_17814 ) ) ( not ( = ?auto_17813 ?auto_17814 ) ) ( not ( = ?auto_17805 ?auto_17814 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17811 ?auto_17804 ?auto_17814 ?auto_17809 )
      ( MAKE-ON ?auto_17803 ?auto_17804 )
      ( MAKE-ON-VERIFY ?auto_17803 ?auto_17804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17815 - SURFACE
      ?auto_17816 - SURFACE
    )
    :vars
    (
      ?auto_17825 - HOIST
      ?auto_17821 - PLACE
      ?auto_17826 - PLACE
      ?auto_17817 - HOIST
      ?auto_17818 - SURFACE
      ?auto_17824 - SURFACE
      ?auto_17823 - PLACE
      ?auto_17820 - HOIST
      ?auto_17819 - SURFACE
      ?auto_17822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17825 ?auto_17821 ) ( IS-CRATE ?auto_17815 ) ( not ( = ?auto_17815 ?auto_17816 ) ) ( not ( = ?auto_17826 ?auto_17821 ) ) ( HOIST-AT ?auto_17817 ?auto_17826 ) ( not ( = ?auto_17825 ?auto_17817 ) ) ( AVAILABLE ?auto_17817 ) ( SURFACE-AT ?auto_17815 ?auto_17826 ) ( ON ?auto_17815 ?auto_17818 ) ( CLEAR ?auto_17815 ) ( not ( = ?auto_17815 ?auto_17818 ) ) ( not ( = ?auto_17816 ?auto_17818 ) ) ( SURFACE-AT ?auto_17824 ?auto_17821 ) ( CLEAR ?auto_17824 ) ( IS-CRATE ?auto_17816 ) ( not ( = ?auto_17815 ?auto_17824 ) ) ( not ( = ?auto_17816 ?auto_17824 ) ) ( not ( = ?auto_17818 ?auto_17824 ) ) ( AVAILABLE ?auto_17825 ) ( not ( = ?auto_17823 ?auto_17821 ) ) ( not ( = ?auto_17826 ?auto_17823 ) ) ( HOIST-AT ?auto_17820 ?auto_17823 ) ( not ( = ?auto_17825 ?auto_17820 ) ) ( not ( = ?auto_17817 ?auto_17820 ) ) ( AVAILABLE ?auto_17820 ) ( SURFACE-AT ?auto_17816 ?auto_17823 ) ( ON ?auto_17816 ?auto_17819 ) ( CLEAR ?auto_17816 ) ( not ( = ?auto_17815 ?auto_17819 ) ) ( not ( = ?auto_17816 ?auto_17819 ) ) ( not ( = ?auto_17818 ?auto_17819 ) ) ( not ( = ?auto_17824 ?auto_17819 ) ) ( TRUCK-AT ?auto_17822 ?auto_17821 ) )
    :subtasks
    ( ( !DRIVE ?auto_17822 ?auto_17821 ?auto_17823 )
      ( MAKE-ON ?auto_17815 ?auto_17816 )
      ( MAKE-ON-VERIFY ?auto_17815 ?auto_17816 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17827 - SURFACE
      ?auto_17828 - SURFACE
    )
    :vars
    (
      ?auto_17836 - HOIST
      ?auto_17831 - PLACE
      ?auto_17830 - PLACE
      ?auto_17838 - HOIST
      ?auto_17835 - SURFACE
      ?auto_17833 - SURFACE
      ?auto_17829 - PLACE
      ?auto_17832 - HOIST
      ?auto_17837 - SURFACE
      ?auto_17834 - TRUCK
      ?auto_17839 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17836 ?auto_17831 ) ( IS-CRATE ?auto_17827 ) ( not ( = ?auto_17827 ?auto_17828 ) ) ( not ( = ?auto_17830 ?auto_17831 ) ) ( HOIST-AT ?auto_17838 ?auto_17830 ) ( not ( = ?auto_17836 ?auto_17838 ) ) ( AVAILABLE ?auto_17838 ) ( SURFACE-AT ?auto_17827 ?auto_17830 ) ( ON ?auto_17827 ?auto_17835 ) ( CLEAR ?auto_17827 ) ( not ( = ?auto_17827 ?auto_17835 ) ) ( not ( = ?auto_17828 ?auto_17835 ) ) ( IS-CRATE ?auto_17828 ) ( not ( = ?auto_17827 ?auto_17833 ) ) ( not ( = ?auto_17828 ?auto_17833 ) ) ( not ( = ?auto_17835 ?auto_17833 ) ) ( not ( = ?auto_17829 ?auto_17831 ) ) ( not ( = ?auto_17830 ?auto_17829 ) ) ( HOIST-AT ?auto_17832 ?auto_17829 ) ( not ( = ?auto_17836 ?auto_17832 ) ) ( not ( = ?auto_17838 ?auto_17832 ) ) ( AVAILABLE ?auto_17832 ) ( SURFACE-AT ?auto_17828 ?auto_17829 ) ( ON ?auto_17828 ?auto_17837 ) ( CLEAR ?auto_17828 ) ( not ( = ?auto_17827 ?auto_17837 ) ) ( not ( = ?auto_17828 ?auto_17837 ) ) ( not ( = ?auto_17835 ?auto_17837 ) ) ( not ( = ?auto_17833 ?auto_17837 ) ) ( TRUCK-AT ?auto_17834 ?auto_17831 ) ( SURFACE-AT ?auto_17839 ?auto_17831 ) ( CLEAR ?auto_17839 ) ( LIFTING ?auto_17836 ?auto_17833 ) ( IS-CRATE ?auto_17833 ) ( not ( = ?auto_17827 ?auto_17839 ) ) ( not ( = ?auto_17828 ?auto_17839 ) ) ( not ( = ?auto_17835 ?auto_17839 ) ) ( not ( = ?auto_17833 ?auto_17839 ) ) ( not ( = ?auto_17837 ?auto_17839 ) ) )
    :subtasks
    ( ( !DROP ?auto_17836 ?auto_17833 ?auto_17839 ?auto_17831 )
      ( MAKE-ON ?auto_17827 ?auto_17828 )
      ( MAKE-ON-VERIFY ?auto_17827 ?auto_17828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17840 - SURFACE
      ?auto_17841 - SURFACE
    )
    :vars
    (
      ?auto_17842 - HOIST
      ?auto_17846 - PLACE
      ?auto_17848 - PLACE
      ?auto_17843 - HOIST
      ?auto_17844 - SURFACE
      ?auto_17850 - SURFACE
      ?auto_17852 - PLACE
      ?auto_17849 - HOIST
      ?auto_17851 - SURFACE
      ?auto_17847 - TRUCK
      ?auto_17845 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17842 ?auto_17846 ) ( IS-CRATE ?auto_17840 ) ( not ( = ?auto_17840 ?auto_17841 ) ) ( not ( = ?auto_17848 ?auto_17846 ) ) ( HOIST-AT ?auto_17843 ?auto_17848 ) ( not ( = ?auto_17842 ?auto_17843 ) ) ( AVAILABLE ?auto_17843 ) ( SURFACE-AT ?auto_17840 ?auto_17848 ) ( ON ?auto_17840 ?auto_17844 ) ( CLEAR ?auto_17840 ) ( not ( = ?auto_17840 ?auto_17844 ) ) ( not ( = ?auto_17841 ?auto_17844 ) ) ( IS-CRATE ?auto_17841 ) ( not ( = ?auto_17840 ?auto_17850 ) ) ( not ( = ?auto_17841 ?auto_17850 ) ) ( not ( = ?auto_17844 ?auto_17850 ) ) ( not ( = ?auto_17852 ?auto_17846 ) ) ( not ( = ?auto_17848 ?auto_17852 ) ) ( HOIST-AT ?auto_17849 ?auto_17852 ) ( not ( = ?auto_17842 ?auto_17849 ) ) ( not ( = ?auto_17843 ?auto_17849 ) ) ( AVAILABLE ?auto_17849 ) ( SURFACE-AT ?auto_17841 ?auto_17852 ) ( ON ?auto_17841 ?auto_17851 ) ( CLEAR ?auto_17841 ) ( not ( = ?auto_17840 ?auto_17851 ) ) ( not ( = ?auto_17841 ?auto_17851 ) ) ( not ( = ?auto_17844 ?auto_17851 ) ) ( not ( = ?auto_17850 ?auto_17851 ) ) ( TRUCK-AT ?auto_17847 ?auto_17846 ) ( SURFACE-AT ?auto_17845 ?auto_17846 ) ( CLEAR ?auto_17845 ) ( IS-CRATE ?auto_17850 ) ( not ( = ?auto_17840 ?auto_17845 ) ) ( not ( = ?auto_17841 ?auto_17845 ) ) ( not ( = ?auto_17844 ?auto_17845 ) ) ( not ( = ?auto_17850 ?auto_17845 ) ) ( not ( = ?auto_17851 ?auto_17845 ) ) ( AVAILABLE ?auto_17842 ) ( IN ?auto_17850 ?auto_17847 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17842 ?auto_17850 ?auto_17847 ?auto_17846 )
      ( MAKE-ON ?auto_17840 ?auto_17841 )
      ( MAKE-ON-VERIFY ?auto_17840 ?auto_17841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17853 - SURFACE
      ?auto_17854 - SURFACE
    )
    :vars
    (
      ?auto_17865 - HOIST
      ?auto_17857 - PLACE
      ?auto_17856 - PLACE
      ?auto_17863 - HOIST
      ?auto_17861 - SURFACE
      ?auto_17864 - SURFACE
      ?auto_17859 - PLACE
      ?auto_17858 - HOIST
      ?auto_17855 - SURFACE
      ?auto_17860 - SURFACE
      ?auto_17862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17865 ?auto_17857 ) ( IS-CRATE ?auto_17853 ) ( not ( = ?auto_17853 ?auto_17854 ) ) ( not ( = ?auto_17856 ?auto_17857 ) ) ( HOIST-AT ?auto_17863 ?auto_17856 ) ( not ( = ?auto_17865 ?auto_17863 ) ) ( AVAILABLE ?auto_17863 ) ( SURFACE-AT ?auto_17853 ?auto_17856 ) ( ON ?auto_17853 ?auto_17861 ) ( CLEAR ?auto_17853 ) ( not ( = ?auto_17853 ?auto_17861 ) ) ( not ( = ?auto_17854 ?auto_17861 ) ) ( IS-CRATE ?auto_17854 ) ( not ( = ?auto_17853 ?auto_17864 ) ) ( not ( = ?auto_17854 ?auto_17864 ) ) ( not ( = ?auto_17861 ?auto_17864 ) ) ( not ( = ?auto_17859 ?auto_17857 ) ) ( not ( = ?auto_17856 ?auto_17859 ) ) ( HOIST-AT ?auto_17858 ?auto_17859 ) ( not ( = ?auto_17865 ?auto_17858 ) ) ( not ( = ?auto_17863 ?auto_17858 ) ) ( AVAILABLE ?auto_17858 ) ( SURFACE-AT ?auto_17854 ?auto_17859 ) ( ON ?auto_17854 ?auto_17855 ) ( CLEAR ?auto_17854 ) ( not ( = ?auto_17853 ?auto_17855 ) ) ( not ( = ?auto_17854 ?auto_17855 ) ) ( not ( = ?auto_17861 ?auto_17855 ) ) ( not ( = ?auto_17864 ?auto_17855 ) ) ( SURFACE-AT ?auto_17860 ?auto_17857 ) ( CLEAR ?auto_17860 ) ( IS-CRATE ?auto_17864 ) ( not ( = ?auto_17853 ?auto_17860 ) ) ( not ( = ?auto_17854 ?auto_17860 ) ) ( not ( = ?auto_17861 ?auto_17860 ) ) ( not ( = ?auto_17864 ?auto_17860 ) ) ( not ( = ?auto_17855 ?auto_17860 ) ) ( AVAILABLE ?auto_17865 ) ( IN ?auto_17864 ?auto_17862 ) ( TRUCK-AT ?auto_17862 ?auto_17856 ) )
    :subtasks
    ( ( !DRIVE ?auto_17862 ?auto_17856 ?auto_17857 )
      ( MAKE-ON ?auto_17853 ?auto_17854 )
      ( MAKE-ON-VERIFY ?auto_17853 ?auto_17854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17866 - SURFACE
      ?auto_17867 - SURFACE
    )
    :vars
    (
      ?auto_17876 - HOIST
      ?auto_17872 - PLACE
      ?auto_17874 - PLACE
      ?auto_17873 - HOIST
      ?auto_17878 - SURFACE
      ?auto_17871 - SURFACE
      ?auto_17868 - PLACE
      ?auto_17875 - HOIST
      ?auto_17877 - SURFACE
      ?auto_17869 - SURFACE
      ?auto_17870 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17876 ?auto_17872 ) ( IS-CRATE ?auto_17866 ) ( not ( = ?auto_17866 ?auto_17867 ) ) ( not ( = ?auto_17874 ?auto_17872 ) ) ( HOIST-AT ?auto_17873 ?auto_17874 ) ( not ( = ?auto_17876 ?auto_17873 ) ) ( SURFACE-AT ?auto_17866 ?auto_17874 ) ( ON ?auto_17866 ?auto_17878 ) ( CLEAR ?auto_17866 ) ( not ( = ?auto_17866 ?auto_17878 ) ) ( not ( = ?auto_17867 ?auto_17878 ) ) ( IS-CRATE ?auto_17867 ) ( not ( = ?auto_17866 ?auto_17871 ) ) ( not ( = ?auto_17867 ?auto_17871 ) ) ( not ( = ?auto_17878 ?auto_17871 ) ) ( not ( = ?auto_17868 ?auto_17872 ) ) ( not ( = ?auto_17874 ?auto_17868 ) ) ( HOIST-AT ?auto_17875 ?auto_17868 ) ( not ( = ?auto_17876 ?auto_17875 ) ) ( not ( = ?auto_17873 ?auto_17875 ) ) ( AVAILABLE ?auto_17875 ) ( SURFACE-AT ?auto_17867 ?auto_17868 ) ( ON ?auto_17867 ?auto_17877 ) ( CLEAR ?auto_17867 ) ( not ( = ?auto_17866 ?auto_17877 ) ) ( not ( = ?auto_17867 ?auto_17877 ) ) ( not ( = ?auto_17878 ?auto_17877 ) ) ( not ( = ?auto_17871 ?auto_17877 ) ) ( SURFACE-AT ?auto_17869 ?auto_17872 ) ( CLEAR ?auto_17869 ) ( IS-CRATE ?auto_17871 ) ( not ( = ?auto_17866 ?auto_17869 ) ) ( not ( = ?auto_17867 ?auto_17869 ) ) ( not ( = ?auto_17878 ?auto_17869 ) ) ( not ( = ?auto_17871 ?auto_17869 ) ) ( not ( = ?auto_17877 ?auto_17869 ) ) ( AVAILABLE ?auto_17876 ) ( TRUCK-AT ?auto_17870 ?auto_17874 ) ( LIFTING ?auto_17873 ?auto_17871 ) )
    :subtasks
    ( ( !LOAD ?auto_17873 ?auto_17871 ?auto_17870 ?auto_17874 )
      ( MAKE-ON ?auto_17866 ?auto_17867 )
      ( MAKE-ON-VERIFY ?auto_17866 ?auto_17867 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17879 - SURFACE
      ?auto_17880 - SURFACE
    )
    :vars
    (
      ?auto_17881 - HOIST
      ?auto_17885 - PLACE
      ?auto_17882 - PLACE
      ?auto_17891 - HOIST
      ?auto_17887 - SURFACE
      ?auto_17883 - SURFACE
      ?auto_17884 - PLACE
      ?auto_17886 - HOIST
      ?auto_17888 - SURFACE
      ?auto_17889 - SURFACE
      ?auto_17890 - TRUCK
      ?auto_17892 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17881 ?auto_17885 ) ( IS-CRATE ?auto_17879 ) ( not ( = ?auto_17879 ?auto_17880 ) ) ( not ( = ?auto_17882 ?auto_17885 ) ) ( HOIST-AT ?auto_17891 ?auto_17882 ) ( not ( = ?auto_17881 ?auto_17891 ) ) ( SURFACE-AT ?auto_17879 ?auto_17882 ) ( ON ?auto_17879 ?auto_17887 ) ( CLEAR ?auto_17879 ) ( not ( = ?auto_17879 ?auto_17887 ) ) ( not ( = ?auto_17880 ?auto_17887 ) ) ( IS-CRATE ?auto_17880 ) ( not ( = ?auto_17879 ?auto_17883 ) ) ( not ( = ?auto_17880 ?auto_17883 ) ) ( not ( = ?auto_17887 ?auto_17883 ) ) ( not ( = ?auto_17884 ?auto_17885 ) ) ( not ( = ?auto_17882 ?auto_17884 ) ) ( HOIST-AT ?auto_17886 ?auto_17884 ) ( not ( = ?auto_17881 ?auto_17886 ) ) ( not ( = ?auto_17891 ?auto_17886 ) ) ( AVAILABLE ?auto_17886 ) ( SURFACE-AT ?auto_17880 ?auto_17884 ) ( ON ?auto_17880 ?auto_17888 ) ( CLEAR ?auto_17880 ) ( not ( = ?auto_17879 ?auto_17888 ) ) ( not ( = ?auto_17880 ?auto_17888 ) ) ( not ( = ?auto_17887 ?auto_17888 ) ) ( not ( = ?auto_17883 ?auto_17888 ) ) ( SURFACE-AT ?auto_17889 ?auto_17885 ) ( CLEAR ?auto_17889 ) ( IS-CRATE ?auto_17883 ) ( not ( = ?auto_17879 ?auto_17889 ) ) ( not ( = ?auto_17880 ?auto_17889 ) ) ( not ( = ?auto_17887 ?auto_17889 ) ) ( not ( = ?auto_17883 ?auto_17889 ) ) ( not ( = ?auto_17888 ?auto_17889 ) ) ( AVAILABLE ?auto_17881 ) ( TRUCK-AT ?auto_17890 ?auto_17882 ) ( AVAILABLE ?auto_17891 ) ( SURFACE-AT ?auto_17883 ?auto_17882 ) ( ON ?auto_17883 ?auto_17892 ) ( CLEAR ?auto_17883 ) ( not ( = ?auto_17879 ?auto_17892 ) ) ( not ( = ?auto_17880 ?auto_17892 ) ) ( not ( = ?auto_17887 ?auto_17892 ) ) ( not ( = ?auto_17883 ?auto_17892 ) ) ( not ( = ?auto_17888 ?auto_17892 ) ) ( not ( = ?auto_17889 ?auto_17892 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17891 ?auto_17883 ?auto_17892 ?auto_17882 )
      ( MAKE-ON ?auto_17879 ?auto_17880 )
      ( MAKE-ON-VERIFY ?auto_17879 ?auto_17880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17893 - SURFACE
      ?auto_17894 - SURFACE
    )
    :vars
    (
      ?auto_17903 - HOIST
      ?auto_17897 - PLACE
      ?auto_17896 - PLACE
      ?auto_17898 - HOIST
      ?auto_17902 - SURFACE
      ?auto_17900 - SURFACE
      ?auto_17899 - PLACE
      ?auto_17906 - HOIST
      ?auto_17895 - SURFACE
      ?auto_17901 - SURFACE
      ?auto_17904 - SURFACE
      ?auto_17905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17903 ?auto_17897 ) ( IS-CRATE ?auto_17893 ) ( not ( = ?auto_17893 ?auto_17894 ) ) ( not ( = ?auto_17896 ?auto_17897 ) ) ( HOIST-AT ?auto_17898 ?auto_17896 ) ( not ( = ?auto_17903 ?auto_17898 ) ) ( SURFACE-AT ?auto_17893 ?auto_17896 ) ( ON ?auto_17893 ?auto_17902 ) ( CLEAR ?auto_17893 ) ( not ( = ?auto_17893 ?auto_17902 ) ) ( not ( = ?auto_17894 ?auto_17902 ) ) ( IS-CRATE ?auto_17894 ) ( not ( = ?auto_17893 ?auto_17900 ) ) ( not ( = ?auto_17894 ?auto_17900 ) ) ( not ( = ?auto_17902 ?auto_17900 ) ) ( not ( = ?auto_17899 ?auto_17897 ) ) ( not ( = ?auto_17896 ?auto_17899 ) ) ( HOIST-AT ?auto_17906 ?auto_17899 ) ( not ( = ?auto_17903 ?auto_17906 ) ) ( not ( = ?auto_17898 ?auto_17906 ) ) ( AVAILABLE ?auto_17906 ) ( SURFACE-AT ?auto_17894 ?auto_17899 ) ( ON ?auto_17894 ?auto_17895 ) ( CLEAR ?auto_17894 ) ( not ( = ?auto_17893 ?auto_17895 ) ) ( not ( = ?auto_17894 ?auto_17895 ) ) ( not ( = ?auto_17902 ?auto_17895 ) ) ( not ( = ?auto_17900 ?auto_17895 ) ) ( SURFACE-AT ?auto_17901 ?auto_17897 ) ( CLEAR ?auto_17901 ) ( IS-CRATE ?auto_17900 ) ( not ( = ?auto_17893 ?auto_17901 ) ) ( not ( = ?auto_17894 ?auto_17901 ) ) ( not ( = ?auto_17902 ?auto_17901 ) ) ( not ( = ?auto_17900 ?auto_17901 ) ) ( not ( = ?auto_17895 ?auto_17901 ) ) ( AVAILABLE ?auto_17903 ) ( AVAILABLE ?auto_17898 ) ( SURFACE-AT ?auto_17900 ?auto_17896 ) ( ON ?auto_17900 ?auto_17904 ) ( CLEAR ?auto_17900 ) ( not ( = ?auto_17893 ?auto_17904 ) ) ( not ( = ?auto_17894 ?auto_17904 ) ) ( not ( = ?auto_17902 ?auto_17904 ) ) ( not ( = ?auto_17900 ?auto_17904 ) ) ( not ( = ?auto_17895 ?auto_17904 ) ) ( not ( = ?auto_17901 ?auto_17904 ) ) ( TRUCK-AT ?auto_17905 ?auto_17897 ) )
    :subtasks
    ( ( !DRIVE ?auto_17905 ?auto_17897 ?auto_17896 )
      ( MAKE-ON ?auto_17893 ?auto_17894 )
      ( MAKE-ON-VERIFY ?auto_17893 ?auto_17894 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17907 - SURFACE
      ?auto_17908 - SURFACE
    )
    :vars
    (
      ?auto_17910 - HOIST
      ?auto_17916 - PLACE
      ?auto_17919 - PLACE
      ?auto_17920 - HOIST
      ?auto_17917 - SURFACE
      ?auto_17913 - SURFACE
      ?auto_17909 - PLACE
      ?auto_17918 - HOIST
      ?auto_17912 - SURFACE
      ?auto_17915 - SURFACE
      ?auto_17911 - SURFACE
      ?auto_17914 - TRUCK
      ?auto_17921 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17910 ?auto_17916 ) ( IS-CRATE ?auto_17907 ) ( not ( = ?auto_17907 ?auto_17908 ) ) ( not ( = ?auto_17919 ?auto_17916 ) ) ( HOIST-AT ?auto_17920 ?auto_17919 ) ( not ( = ?auto_17910 ?auto_17920 ) ) ( SURFACE-AT ?auto_17907 ?auto_17919 ) ( ON ?auto_17907 ?auto_17917 ) ( CLEAR ?auto_17907 ) ( not ( = ?auto_17907 ?auto_17917 ) ) ( not ( = ?auto_17908 ?auto_17917 ) ) ( IS-CRATE ?auto_17908 ) ( not ( = ?auto_17907 ?auto_17913 ) ) ( not ( = ?auto_17908 ?auto_17913 ) ) ( not ( = ?auto_17917 ?auto_17913 ) ) ( not ( = ?auto_17909 ?auto_17916 ) ) ( not ( = ?auto_17919 ?auto_17909 ) ) ( HOIST-AT ?auto_17918 ?auto_17909 ) ( not ( = ?auto_17910 ?auto_17918 ) ) ( not ( = ?auto_17920 ?auto_17918 ) ) ( AVAILABLE ?auto_17918 ) ( SURFACE-AT ?auto_17908 ?auto_17909 ) ( ON ?auto_17908 ?auto_17912 ) ( CLEAR ?auto_17908 ) ( not ( = ?auto_17907 ?auto_17912 ) ) ( not ( = ?auto_17908 ?auto_17912 ) ) ( not ( = ?auto_17917 ?auto_17912 ) ) ( not ( = ?auto_17913 ?auto_17912 ) ) ( IS-CRATE ?auto_17913 ) ( not ( = ?auto_17907 ?auto_17915 ) ) ( not ( = ?auto_17908 ?auto_17915 ) ) ( not ( = ?auto_17917 ?auto_17915 ) ) ( not ( = ?auto_17913 ?auto_17915 ) ) ( not ( = ?auto_17912 ?auto_17915 ) ) ( AVAILABLE ?auto_17920 ) ( SURFACE-AT ?auto_17913 ?auto_17919 ) ( ON ?auto_17913 ?auto_17911 ) ( CLEAR ?auto_17913 ) ( not ( = ?auto_17907 ?auto_17911 ) ) ( not ( = ?auto_17908 ?auto_17911 ) ) ( not ( = ?auto_17917 ?auto_17911 ) ) ( not ( = ?auto_17913 ?auto_17911 ) ) ( not ( = ?auto_17912 ?auto_17911 ) ) ( not ( = ?auto_17915 ?auto_17911 ) ) ( TRUCK-AT ?auto_17914 ?auto_17916 ) ( SURFACE-AT ?auto_17921 ?auto_17916 ) ( CLEAR ?auto_17921 ) ( LIFTING ?auto_17910 ?auto_17915 ) ( IS-CRATE ?auto_17915 ) ( not ( = ?auto_17907 ?auto_17921 ) ) ( not ( = ?auto_17908 ?auto_17921 ) ) ( not ( = ?auto_17917 ?auto_17921 ) ) ( not ( = ?auto_17913 ?auto_17921 ) ) ( not ( = ?auto_17912 ?auto_17921 ) ) ( not ( = ?auto_17915 ?auto_17921 ) ) ( not ( = ?auto_17911 ?auto_17921 ) ) )
    :subtasks
    ( ( !DROP ?auto_17910 ?auto_17915 ?auto_17921 ?auto_17916 )
      ( MAKE-ON ?auto_17907 ?auto_17908 )
      ( MAKE-ON-VERIFY ?auto_17907 ?auto_17908 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17922 - SURFACE
      ?auto_17923 - SURFACE
    )
    :vars
    (
      ?auto_17932 - HOIST
      ?auto_17931 - PLACE
      ?auto_17928 - PLACE
      ?auto_17936 - HOIST
      ?auto_17929 - SURFACE
      ?auto_17935 - SURFACE
      ?auto_17926 - PLACE
      ?auto_17924 - HOIST
      ?auto_17933 - SURFACE
      ?auto_17927 - SURFACE
      ?auto_17925 - SURFACE
      ?auto_17934 - TRUCK
      ?auto_17930 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17932 ?auto_17931 ) ( IS-CRATE ?auto_17922 ) ( not ( = ?auto_17922 ?auto_17923 ) ) ( not ( = ?auto_17928 ?auto_17931 ) ) ( HOIST-AT ?auto_17936 ?auto_17928 ) ( not ( = ?auto_17932 ?auto_17936 ) ) ( SURFACE-AT ?auto_17922 ?auto_17928 ) ( ON ?auto_17922 ?auto_17929 ) ( CLEAR ?auto_17922 ) ( not ( = ?auto_17922 ?auto_17929 ) ) ( not ( = ?auto_17923 ?auto_17929 ) ) ( IS-CRATE ?auto_17923 ) ( not ( = ?auto_17922 ?auto_17935 ) ) ( not ( = ?auto_17923 ?auto_17935 ) ) ( not ( = ?auto_17929 ?auto_17935 ) ) ( not ( = ?auto_17926 ?auto_17931 ) ) ( not ( = ?auto_17928 ?auto_17926 ) ) ( HOIST-AT ?auto_17924 ?auto_17926 ) ( not ( = ?auto_17932 ?auto_17924 ) ) ( not ( = ?auto_17936 ?auto_17924 ) ) ( AVAILABLE ?auto_17924 ) ( SURFACE-AT ?auto_17923 ?auto_17926 ) ( ON ?auto_17923 ?auto_17933 ) ( CLEAR ?auto_17923 ) ( not ( = ?auto_17922 ?auto_17933 ) ) ( not ( = ?auto_17923 ?auto_17933 ) ) ( not ( = ?auto_17929 ?auto_17933 ) ) ( not ( = ?auto_17935 ?auto_17933 ) ) ( IS-CRATE ?auto_17935 ) ( not ( = ?auto_17922 ?auto_17927 ) ) ( not ( = ?auto_17923 ?auto_17927 ) ) ( not ( = ?auto_17929 ?auto_17927 ) ) ( not ( = ?auto_17935 ?auto_17927 ) ) ( not ( = ?auto_17933 ?auto_17927 ) ) ( AVAILABLE ?auto_17936 ) ( SURFACE-AT ?auto_17935 ?auto_17928 ) ( ON ?auto_17935 ?auto_17925 ) ( CLEAR ?auto_17935 ) ( not ( = ?auto_17922 ?auto_17925 ) ) ( not ( = ?auto_17923 ?auto_17925 ) ) ( not ( = ?auto_17929 ?auto_17925 ) ) ( not ( = ?auto_17935 ?auto_17925 ) ) ( not ( = ?auto_17933 ?auto_17925 ) ) ( not ( = ?auto_17927 ?auto_17925 ) ) ( TRUCK-AT ?auto_17934 ?auto_17931 ) ( SURFACE-AT ?auto_17930 ?auto_17931 ) ( CLEAR ?auto_17930 ) ( IS-CRATE ?auto_17927 ) ( not ( = ?auto_17922 ?auto_17930 ) ) ( not ( = ?auto_17923 ?auto_17930 ) ) ( not ( = ?auto_17929 ?auto_17930 ) ) ( not ( = ?auto_17935 ?auto_17930 ) ) ( not ( = ?auto_17933 ?auto_17930 ) ) ( not ( = ?auto_17927 ?auto_17930 ) ) ( not ( = ?auto_17925 ?auto_17930 ) ) ( AVAILABLE ?auto_17932 ) ( IN ?auto_17927 ?auto_17934 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17932 ?auto_17927 ?auto_17934 ?auto_17931 )
      ( MAKE-ON ?auto_17922 ?auto_17923 )
      ( MAKE-ON-VERIFY ?auto_17922 ?auto_17923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17937 - SURFACE
      ?auto_17938 - SURFACE
    )
    :vars
    (
      ?auto_17949 - HOIST
      ?auto_17951 - PLACE
      ?auto_17942 - PLACE
      ?auto_17950 - HOIST
      ?auto_17947 - SURFACE
      ?auto_17939 - SURFACE
      ?auto_17946 - PLACE
      ?auto_17941 - HOIST
      ?auto_17943 - SURFACE
      ?auto_17940 - SURFACE
      ?auto_17945 - SURFACE
      ?auto_17948 - SURFACE
      ?auto_17944 - TRUCK
      ?auto_17952 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17949 ?auto_17951 ) ( IS-CRATE ?auto_17937 ) ( not ( = ?auto_17937 ?auto_17938 ) ) ( not ( = ?auto_17942 ?auto_17951 ) ) ( HOIST-AT ?auto_17950 ?auto_17942 ) ( not ( = ?auto_17949 ?auto_17950 ) ) ( SURFACE-AT ?auto_17937 ?auto_17942 ) ( ON ?auto_17937 ?auto_17947 ) ( CLEAR ?auto_17937 ) ( not ( = ?auto_17937 ?auto_17947 ) ) ( not ( = ?auto_17938 ?auto_17947 ) ) ( IS-CRATE ?auto_17938 ) ( not ( = ?auto_17937 ?auto_17939 ) ) ( not ( = ?auto_17938 ?auto_17939 ) ) ( not ( = ?auto_17947 ?auto_17939 ) ) ( not ( = ?auto_17946 ?auto_17951 ) ) ( not ( = ?auto_17942 ?auto_17946 ) ) ( HOIST-AT ?auto_17941 ?auto_17946 ) ( not ( = ?auto_17949 ?auto_17941 ) ) ( not ( = ?auto_17950 ?auto_17941 ) ) ( AVAILABLE ?auto_17941 ) ( SURFACE-AT ?auto_17938 ?auto_17946 ) ( ON ?auto_17938 ?auto_17943 ) ( CLEAR ?auto_17938 ) ( not ( = ?auto_17937 ?auto_17943 ) ) ( not ( = ?auto_17938 ?auto_17943 ) ) ( not ( = ?auto_17947 ?auto_17943 ) ) ( not ( = ?auto_17939 ?auto_17943 ) ) ( IS-CRATE ?auto_17939 ) ( not ( = ?auto_17937 ?auto_17940 ) ) ( not ( = ?auto_17938 ?auto_17940 ) ) ( not ( = ?auto_17947 ?auto_17940 ) ) ( not ( = ?auto_17939 ?auto_17940 ) ) ( not ( = ?auto_17943 ?auto_17940 ) ) ( AVAILABLE ?auto_17950 ) ( SURFACE-AT ?auto_17939 ?auto_17942 ) ( ON ?auto_17939 ?auto_17945 ) ( CLEAR ?auto_17939 ) ( not ( = ?auto_17937 ?auto_17945 ) ) ( not ( = ?auto_17938 ?auto_17945 ) ) ( not ( = ?auto_17947 ?auto_17945 ) ) ( not ( = ?auto_17939 ?auto_17945 ) ) ( not ( = ?auto_17943 ?auto_17945 ) ) ( not ( = ?auto_17940 ?auto_17945 ) ) ( SURFACE-AT ?auto_17948 ?auto_17951 ) ( CLEAR ?auto_17948 ) ( IS-CRATE ?auto_17940 ) ( not ( = ?auto_17937 ?auto_17948 ) ) ( not ( = ?auto_17938 ?auto_17948 ) ) ( not ( = ?auto_17947 ?auto_17948 ) ) ( not ( = ?auto_17939 ?auto_17948 ) ) ( not ( = ?auto_17943 ?auto_17948 ) ) ( not ( = ?auto_17940 ?auto_17948 ) ) ( not ( = ?auto_17945 ?auto_17948 ) ) ( AVAILABLE ?auto_17949 ) ( IN ?auto_17940 ?auto_17944 ) ( TRUCK-AT ?auto_17944 ?auto_17952 ) ( not ( = ?auto_17952 ?auto_17951 ) ) ( not ( = ?auto_17942 ?auto_17952 ) ) ( not ( = ?auto_17946 ?auto_17952 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17944 ?auto_17952 ?auto_17951 )
      ( MAKE-ON ?auto_17937 ?auto_17938 )
      ( MAKE-ON-VERIFY ?auto_17937 ?auto_17938 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17953 - SURFACE
      ?auto_17954 - SURFACE
    )
    :vars
    (
      ?auto_17963 - HOIST
      ?auto_17959 - PLACE
      ?auto_17964 - PLACE
      ?auto_17958 - HOIST
      ?auto_17965 - SURFACE
      ?auto_17966 - SURFACE
      ?auto_17960 - PLACE
      ?auto_17962 - HOIST
      ?auto_17967 - SURFACE
      ?auto_17955 - SURFACE
      ?auto_17957 - SURFACE
      ?auto_17956 - SURFACE
      ?auto_17961 - TRUCK
      ?auto_17968 - PLACE
      ?auto_17969 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17963 ?auto_17959 ) ( IS-CRATE ?auto_17953 ) ( not ( = ?auto_17953 ?auto_17954 ) ) ( not ( = ?auto_17964 ?auto_17959 ) ) ( HOIST-AT ?auto_17958 ?auto_17964 ) ( not ( = ?auto_17963 ?auto_17958 ) ) ( SURFACE-AT ?auto_17953 ?auto_17964 ) ( ON ?auto_17953 ?auto_17965 ) ( CLEAR ?auto_17953 ) ( not ( = ?auto_17953 ?auto_17965 ) ) ( not ( = ?auto_17954 ?auto_17965 ) ) ( IS-CRATE ?auto_17954 ) ( not ( = ?auto_17953 ?auto_17966 ) ) ( not ( = ?auto_17954 ?auto_17966 ) ) ( not ( = ?auto_17965 ?auto_17966 ) ) ( not ( = ?auto_17960 ?auto_17959 ) ) ( not ( = ?auto_17964 ?auto_17960 ) ) ( HOIST-AT ?auto_17962 ?auto_17960 ) ( not ( = ?auto_17963 ?auto_17962 ) ) ( not ( = ?auto_17958 ?auto_17962 ) ) ( AVAILABLE ?auto_17962 ) ( SURFACE-AT ?auto_17954 ?auto_17960 ) ( ON ?auto_17954 ?auto_17967 ) ( CLEAR ?auto_17954 ) ( not ( = ?auto_17953 ?auto_17967 ) ) ( not ( = ?auto_17954 ?auto_17967 ) ) ( not ( = ?auto_17965 ?auto_17967 ) ) ( not ( = ?auto_17966 ?auto_17967 ) ) ( IS-CRATE ?auto_17966 ) ( not ( = ?auto_17953 ?auto_17955 ) ) ( not ( = ?auto_17954 ?auto_17955 ) ) ( not ( = ?auto_17965 ?auto_17955 ) ) ( not ( = ?auto_17966 ?auto_17955 ) ) ( not ( = ?auto_17967 ?auto_17955 ) ) ( AVAILABLE ?auto_17958 ) ( SURFACE-AT ?auto_17966 ?auto_17964 ) ( ON ?auto_17966 ?auto_17957 ) ( CLEAR ?auto_17966 ) ( not ( = ?auto_17953 ?auto_17957 ) ) ( not ( = ?auto_17954 ?auto_17957 ) ) ( not ( = ?auto_17965 ?auto_17957 ) ) ( not ( = ?auto_17966 ?auto_17957 ) ) ( not ( = ?auto_17967 ?auto_17957 ) ) ( not ( = ?auto_17955 ?auto_17957 ) ) ( SURFACE-AT ?auto_17956 ?auto_17959 ) ( CLEAR ?auto_17956 ) ( IS-CRATE ?auto_17955 ) ( not ( = ?auto_17953 ?auto_17956 ) ) ( not ( = ?auto_17954 ?auto_17956 ) ) ( not ( = ?auto_17965 ?auto_17956 ) ) ( not ( = ?auto_17966 ?auto_17956 ) ) ( not ( = ?auto_17967 ?auto_17956 ) ) ( not ( = ?auto_17955 ?auto_17956 ) ) ( not ( = ?auto_17957 ?auto_17956 ) ) ( AVAILABLE ?auto_17963 ) ( TRUCK-AT ?auto_17961 ?auto_17968 ) ( not ( = ?auto_17968 ?auto_17959 ) ) ( not ( = ?auto_17964 ?auto_17968 ) ) ( not ( = ?auto_17960 ?auto_17968 ) ) ( HOIST-AT ?auto_17969 ?auto_17968 ) ( LIFTING ?auto_17969 ?auto_17955 ) ( not ( = ?auto_17963 ?auto_17969 ) ) ( not ( = ?auto_17958 ?auto_17969 ) ) ( not ( = ?auto_17962 ?auto_17969 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17969 ?auto_17955 ?auto_17961 ?auto_17968 )
      ( MAKE-ON ?auto_17953 ?auto_17954 )
      ( MAKE-ON-VERIFY ?auto_17953 ?auto_17954 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17970 - SURFACE
      ?auto_17971 - SURFACE
    )
    :vars
    (
      ?auto_17975 - HOIST
      ?auto_17976 - PLACE
      ?auto_17977 - PLACE
      ?auto_17986 - HOIST
      ?auto_17982 - SURFACE
      ?auto_17978 - SURFACE
      ?auto_17972 - PLACE
      ?auto_17984 - HOIST
      ?auto_17980 - SURFACE
      ?auto_17981 - SURFACE
      ?auto_17983 - SURFACE
      ?auto_17979 - SURFACE
      ?auto_17974 - TRUCK
      ?auto_17973 - PLACE
      ?auto_17985 - HOIST
      ?auto_17987 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17975 ?auto_17976 ) ( IS-CRATE ?auto_17970 ) ( not ( = ?auto_17970 ?auto_17971 ) ) ( not ( = ?auto_17977 ?auto_17976 ) ) ( HOIST-AT ?auto_17986 ?auto_17977 ) ( not ( = ?auto_17975 ?auto_17986 ) ) ( SURFACE-AT ?auto_17970 ?auto_17977 ) ( ON ?auto_17970 ?auto_17982 ) ( CLEAR ?auto_17970 ) ( not ( = ?auto_17970 ?auto_17982 ) ) ( not ( = ?auto_17971 ?auto_17982 ) ) ( IS-CRATE ?auto_17971 ) ( not ( = ?auto_17970 ?auto_17978 ) ) ( not ( = ?auto_17971 ?auto_17978 ) ) ( not ( = ?auto_17982 ?auto_17978 ) ) ( not ( = ?auto_17972 ?auto_17976 ) ) ( not ( = ?auto_17977 ?auto_17972 ) ) ( HOIST-AT ?auto_17984 ?auto_17972 ) ( not ( = ?auto_17975 ?auto_17984 ) ) ( not ( = ?auto_17986 ?auto_17984 ) ) ( AVAILABLE ?auto_17984 ) ( SURFACE-AT ?auto_17971 ?auto_17972 ) ( ON ?auto_17971 ?auto_17980 ) ( CLEAR ?auto_17971 ) ( not ( = ?auto_17970 ?auto_17980 ) ) ( not ( = ?auto_17971 ?auto_17980 ) ) ( not ( = ?auto_17982 ?auto_17980 ) ) ( not ( = ?auto_17978 ?auto_17980 ) ) ( IS-CRATE ?auto_17978 ) ( not ( = ?auto_17970 ?auto_17981 ) ) ( not ( = ?auto_17971 ?auto_17981 ) ) ( not ( = ?auto_17982 ?auto_17981 ) ) ( not ( = ?auto_17978 ?auto_17981 ) ) ( not ( = ?auto_17980 ?auto_17981 ) ) ( AVAILABLE ?auto_17986 ) ( SURFACE-AT ?auto_17978 ?auto_17977 ) ( ON ?auto_17978 ?auto_17983 ) ( CLEAR ?auto_17978 ) ( not ( = ?auto_17970 ?auto_17983 ) ) ( not ( = ?auto_17971 ?auto_17983 ) ) ( not ( = ?auto_17982 ?auto_17983 ) ) ( not ( = ?auto_17978 ?auto_17983 ) ) ( not ( = ?auto_17980 ?auto_17983 ) ) ( not ( = ?auto_17981 ?auto_17983 ) ) ( SURFACE-AT ?auto_17979 ?auto_17976 ) ( CLEAR ?auto_17979 ) ( IS-CRATE ?auto_17981 ) ( not ( = ?auto_17970 ?auto_17979 ) ) ( not ( = ?auto_17971 ?auto_17979 ) ) ( not ( = ?auto_17982 ?auto_17979 ) ) ( not ( = ?auto_17978 ?auto_17979 ) ) ( not ( = ?auto_17980 ?auto_17979 ) ) ( not ( = ?auto_17981 ?auto_17979 ) ) ( not ( = ?auto_17983 ?auto_17979 ) ) ( AVAILABLE ?auto_17975 ) ( TRUCK-AT ?auto_17974 ?auto_17973 ) ( not ( = ?auto_17973 ?auto_17976 ) ) ( not ( = ?auto_17977 ?auto_17973 ) ) ( not ( = ?auto_17972 ?auto_17973 ) ) ( HOIST-AT ?auto_17985 ?auto_17973 ) ( not ( = ?auto_17975 ?auto_17985 ) ) ( not ( = ?auto_17986 ?auto_17985 ) ) ( not ( = ?auto_17984 ?auto_17985 ) ) ( AVAILABLE ?auto_17985 ) ( SURFACE-AT ?auto_17981 ?auto_17973 ) ( ON ?auto_17981 ?auto_17987 ) ( CLEAR ?auto_17981 ) ( not ( = ?auto_17970 ?auto_17987 ) ) ( not ( = ?auto_17971 ?auto_17987 ) ) ( not ( = ?auto_17982 ?auto_17987 ) ) ( not ( = ?auto_17978 ?auto_17987 ) ) ( not ( = ?auto_17980 ?auto_17987 ) ) ( not ( = ?auto_17981 ?auto_17987 ) ) ( not ( = ?auto_17983 ?auto_17987 ) ) ( not ( = ?auto_17979 ?auto_17987 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17985 ?auto_17981 ?auto_17987 ?auto_17973 )
      ( MAKE-ON ?auto_17970 ?auto_17971 )
      ( MAKE-ON-VERIFY ?auto_17970 ?auto_17971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17988 - SURFACE
      ?auto_17989 - SURFACE
    )
    :vars
    (
      ?auto_17998 - HOIST
      ?auto_17996 - PLACE
      ?auto_18001 - PLACE
      ?auto_18003 - HOIST
      ?auto_17993 - SURFACE
      ?auto_18005 - SURFACE
      ?auto_18000 - PLACE
      ?auto_17991 - HOIST
      ?auto_17995 - SURFACE
      ?auto_17994 - SURFACE
      ?auto_17990 - SURFACE
      ?auto_17999 - SURFACE
      ?auto_18002 - PLACE
      ?auto_17992 - HOIST
      ?auto_17997 - SURFACE
      ?auto_18004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17998 ?auto_17996 ) ( IS-CRATE ?auto_17988 ) ( not ( = ?auto_17988 ?auto_17989 ) ) ( not ( = ?auto_18001 ?auto_17996 ) ) ( HOIST-AT ?auto_18003 ?auto_18001 ) ( not ( = ?auto_17998 ?auto_18003 ) ) ( SURFACE-AT ?auto_17988 ?auto_18001 ) ( ON ?auto_17988 ?auto_17993 ) ( CLEAR ?auto_17988 ) ( not ( = ?auto_17988 ?auto_17993 ) ) ( not ( = ?auto_17989 ?auto_17993 ) ) ( IS-CRATE ?auto_17989 ) ( not ( = ?auto_17988 ?auto_18005 ) ) ( not ( = ?auto_17989 ?auto_18005 ) ) ( not ( = ?auto_17993 ?auto_18005 ) ) ( not ( = ?auto_18000 ?auto_17996 ) ) ( not ( = ?auto_18001 ?auto_18000 ) ) ( HOIST-AT ?auto_17991 ?auto_18000 ) ( not ( = ?auto_17998 ?auto_17991 ) ) ( not ( = ?auto_18003 ?auto_17991 ) ) ( AVAILABLE ?auto_17991 ) ( SURFACE-AT ?auto_17989 ?auto_18000 ) ( ON ?auto_17989 ?auto_17995 ) ( CLEAR ?auto_17989 ) ( not ( = ?auto_17988 ?auto_17995 ) ) ( not ( = ?auto_17989 ?auto_17995 ) ) ( not ( = ?auto_17993 ?auto_17995 ) ) ( not ( = ?auto_18005 ?auto_17995 ) ) ( IS-CRATE ?auto_18005 ) ( not ( = ?auto_17988 ?auto_17994 ) ) ( not ( = ?auto_17989 ?auto_17994 ) ) ( not ( = ?auto_17993 ?auto_17994 ) ) ( not ( = ?auto_18005 ?auto_17994 ) ) ( not ( = ?auto_17995 ?auto_17994 ) ) ( AVAILABLE ?auto_18003 ) ( SURFACE-AT ?auto_18005 ?auto_18001 ) ( ON ?auto_18005 ?auto_17990 ) ( CLEAR ?auto_18005 ) ( not ( = ?auto_17988 ?auto_17990 ) ) ( not ( = ?auto_17989 ?auto_17990 ) ) ( not ( = ?auto_17993 ?auto_17990 ) ) ( not ( = ?auto_18005 ?auto_17990 ) ) ( not ( = ?auto_17995 ?auto_17990 ) ) ( not ( = ?auto_17994 ?auto_17990 ) ) ( SURFACE-AT ?auto_17999 ?auto_17996 ) ( CLEAR ?auto_17999 ) ( IS-CRATE ?auto_17994 ) ( not ( = ?auto_17988 ?auto_17999 ) ) ( not ( = ?auto_17989 ?auto_17999 ) ) ( not ( = ?auto_17993 ?auto_17999 ) ) ( not ( = ?auto_18005 ?auto_17999 ) ) ( not ( = ?auto_17995 ?auto_17999 ) ) ( not ( = ?auto_17994 ?auto_17999 ) ) ( not ( = ?auto_17990 ?auto_17999 ) ) ( AVAILABLE ?auto_17998 ) ( not ( = ?auto_18002 ?auto_17996 ) ) ( not ( = ?auto_18001 ?auto_18002 ) ) ( not ( = ?auto_18000 ?auto_18002 ) ) ( HOIST-AT ?auto_17992 ?auto_18002 ) ( not ( = ?auto_17998 ?auto_17992 ) ) ( not ( = ?auto_18003 ?auto_17992 ) ) ( not ( = ?auto_17991 ?auto_17992 ) ) ( AVAILABLE ?auto_17992 ) ( SURFACE-AT ?auto_17994 ?auto_18002 ) ( ON ?auto_17994 ?auto_17997 ) ( CLEAR ?auto_17994 ) ( not ( = ?auto_17988 ?auto_17997 ) ) ( not ( = ?auto_17989 ?auto_17997 ) ) ( not ( = ?auto_17993 ?auto_17997 ) ) ( not ( = ?auto_18005 ?auto_17997 ) ) ( not ( = ?auto_17995 ?auto_17997 ) ) ( not ( = ?auto_17994 ?auto_17997 ) ) ( not ( = ?auto_17990 ?auto_17997 ) ) ( not ( = ?auto_17999 ?auto_17997 ) ) ( TRUCK-AT ?auto_18004 ?auto_17996 ) )
    :subtasks
    ( ( !DRIVE ?auto_18004 ?auto_17996 ?auto_18002 )
      ( MAKE-ON ?auto_17988 ?auto_17989 )
      ( MAKE-ON-VERIFY ?auto_17988 ?auto_17989 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18006 - SURFACE
      ?auto_18007 - SURFACE
    )
    :vars
    (
      ?auto_18008 - HOIST
      ?auto_18016 - PLACE
      ?auto_18011 - PLACE
      ?auto_18018 - HOIST
      ?auto_18019 - SURFACE
      ?auto_18015 - SURFACE
      ?auto_18017 - PLACE
      ?auto_18020 - HOIST
      ?auto_18021 - SURFACE
      ?auto_18013 - SURFACE
      ?auto_18009 - SURFACE
      ?auto_18022 - SURFACE
      ?auto_18012 - PLACE
      ?auto_18023 - HOIST
      ?auto_18010 - SURFACE
      ?auto_18014 - TRUCK
      ?auto_18024 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18008 ?auto_18016 ) ( IS-CRATE ?auto_18006 ) ( not ( = ?auto_18006 ?auto_18007 ) ) ( not ( = ?auto_18011 ?auto_18016 ) ) ( HOIST-AT ?auto_18018 ?auto_18011 ) ( not ( = ?auto_18008 ?auto_18018 ) ) ( SURFACE-AT ?auto_18006 ?auto_18011 ) ( ON ?auto_18006 ?auto_18019 ) ( CLEAR ?auto_18006 ) ( not ( = ?auto_18006 ?auto_18019 ) ) ( not ( = ?auto_18007 ?auto_18019 ) ) ( IS-CRATE ?auto_18007 ) ( not ( = ?auto_18006 ?auto_18015 ) ) ( not ( = ?auto_18007 ?auto_18015 ) ) ( not ( = ?auto_18019 ?auto_18015 ) ) ( not ( = ?auto_18017 ?auto_18016 ) ) ( not ( = ?auto_18011 ?auto_18017 ) ) ( HOIST-AT ?auto_18020 ?auto_18017 ) ( not ( = ?auto_18008 ?auto_18020 ) ) ( not ( = ?auto_18018 ?auto_18020 ) ) ( AVAILABLE ?auto_18020 ) ( SURFACE-AT ?auto_18007 ?auto_18017 ) ( ON ?auto_18007 ?auto_18021 ) ( CLEAR ?auto_18007 ) ( not ( = ?auto_18006 ?auto_18021 ) ) ( not ( = ?auto_18007 ?auto_18021 ) ) ( not ( = ?auto_18019 ?auto_18021 ) ) ( not ( = ?auto_18015 ?auto_18021 ) ) ( IS-CRATE ?auto_18015 ) ( not ( = ?auto_18006 ?auto_18013 ) ) ( not ( = ?auto_18007 ?auto_18013 ) ) ( not ( = ?auto_18019 ?auto_18013 ) ) ( not ( = ?auto_18015 ?auto_18013 ) ) ( not ( = ?auto_18021 ?auto_18013 ) ) ( AVAILABLE ?auto_18018 ) ( SURFACE-AT ?auto_18015 ?auto_18011 ) ( ON ?auto_18015 ?auto_18009 ) ( CLEAR ?auto_18015 ) ( not ( = ?auto_18006 ?auto_18009 ) ) ( not ( = ?auto_18007 ?auto_18009 ) ) ( not ( = ?auto_18019 ?auto_18009 ) ) ( not ( = ?auto_18015 ?auto_18009 ) ) ( not ( = ?auto_18021 ?auto_18009 ) ) ( not ( = ?auto_18013 ?auto_18009 ) ) ( IS-CRATE ?auto_18013 ) ( not ( = ?auto_18006 ?auto_18022 ) ) ( not ( = ?auto_18007 ?auto_18022 ) ) ( not ( = ?auto_18019 ?auto_18022 ) ) ( not ( = ?auto_18015 ?auto_18022 ) ) ( not ( = ?auto_18021 ?auto_18022 ) ) ( not ( = ?auto_18013 ?auto_18022 ) ) ( not ( = ?auto_18009 ?auto_18022 ) ) ( not ( = ?auto_18012 ?auto_18016 ) ) ( not ( = ?auto_18011 ?auto_18012 ) ) ( not ( = ?auto_18017 ?auto_18012 ) ) ( HOIST-AT ?auto_18023 ?auto_18012 ) ( not ( = ?auto_18008 ?auto_18023 ) ) ( not ( = ?auto_18018 ?auto_18023 ) ) ( not ( = ?auto_18020 ?auto_18023 ) ) ( AVAILABLE ?auto_18023 ) ( SURFACE-AT ?auto_18013 ?auto_18012 ) ( ON ?auto_18013 ?auto_18010 ) ( CLEAR ?auto_18013 ) ( not ( = ?auto_18006 ?auto_18010 ) ) ( not ( = ?auto_18007 ?auto_18010 ) ) ( not ( = ?auto_18019 ?auto_18010 ) ) ( not ( = ?auto_18015 ?auto_18010 ) ) ( not ( = ?auto_18021 ?auto_18010 ) ) ( not ( = ?auto_18013 ?auto_18010 ) ) ( not ( = ?auto_18009 ?auto_18010 ) ) ( not ( = ?auto_18022 ?auto_18010 ) ) ( TRUCK-AT ?auto_18014 ?auto_18016 ) ( SURFACE-AT ?auto_18024 ?auto_18016 ) ( CLEAR ?auto_18024 ) ( LIFTING ?auto_18008 ?auto_18022 ) ( IS-CRATE ?auto_18022 ) ( not ( = ?auto_18006 ?auto_18024 ) ) ( not ( = ?auto_18007 ?auto_18024 ) ) ( not ( = ?auto_18019 ?auto_18024 ) ) ( not ( = ?auto_18015 ?auto_18024 ) ) ( not ( = ?auto_18021 ?auto_18024 ) ) ( not ( = ?auto_18013 ?auto_18024 ) ) ( not ( = ?auto_18009 ?auto_18024 ) ) ( not ( = ?auto_18022 ?auto_18024 ) ) ( not ( = ?auto_18010 ?auto_18024 ) ) )
    :subtasks
    ( ( !DROP ?auto_18008 ?auto_18022 ?auto_18024 ?auto_18016 )
      ( MAKE-ON ?auto_18006 ?auto_18007 )
      ( MAKE-ON-VERIFY ?auto_18006 ?auto_18007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18025 - SURFACE
      ?auto_18026 - SURFACE
    )
    :vars
    (
      ?auto_18043 - HOIST
      ?auto_18042 - PLACE
      ?auto_18028 - PLACE
      ?auto_18032 - HOIST
      ?auto_18035 - SURFACE
      ?auto_18034 - SURFACE
      ?auto_18039 - PLACE
      ?auto_18038 - HOIST
      ?auto_18033 - SURFACE
      ?auto_18031 - SURFACE
      ?auto_18030 - SURFACE
      ?auto_18040 - SURFACE
      ?auto_18027 - PLACE
      ?auto_18036 - HOIST
      ?auto_18029 - SURFACE
      ?auto_18037 - TRUCK
      ?auto_18041 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18043 ?auto_18042 ) ( IS-CRATE ?auto_18025 ) ( not ( = ?auto_18025 ?auto_18026 ) ) ( not ( = ?auto_18028 ?auto_18042 ) ) ( HOIST-AT ?auto_18032 ?auto_18028 ) ( not ( = ?auto_18043 ?auto_18032 ) ) ( SURFACE-AT ?auto_18025 ?auto_18028 ) ( ON ?auto_18025 ?auto_18035 ) ( CLEAR ?auto_18025 ) ( not ( = ?auto_18025 ?auto_18035 ) ) ( not ( = ?auto_18026 ?auto_18035 ) ) ( IS-CRATE ?auto_18026 ) ( not ( = ?auto_18025 ?auto_18034 ) ) ( not ( = ?auto_18026 ?auto_18034 ) ) ( not ( = ?auto_18035 ?auto_18034 ) ) ( not ( = ?auto_18039 ?auto_18042 ) ) ( not ( = ?auto_18028 ?auto_18039 ) ) ( HOIST-AT ?auto_18038 ?auto_18039 ) ( not ( = ?auto_18043 ?auto_18038 ) ) ( not ( = ?auto_18032 ?auto_18038 ) ) ( AVAILABLE ?auto_18038 ) ( SURFACE-AT ?auto_18026 ?auto_18039 ) ( ON ?auto_18026 ?auto_18033 ) ( CLEAR ?auto_18026 ) ( not ( = ?auto_18025 ?auto_18033 ) ) ( not ( = ?auto_18026 ?auto_18033 ) ) ( not ( = ?auto_18035 ?auto_18033 ) ) ( not ( = ?auto_18034 ?auto_18033 ) ) ( IS-CRATE ?auto_18034 ) ( not ( = ?auto_18025 ?auto_18031 ) ) ( not ( = ?auto_18026 ?auto_18031 ) ) ( not ( = ?auto_18035 ?auto_18031 ) ) ( not ( = ?auto_18034 ?auto_18031 ) ) ( not ( = ?auto_18033 ?auto_18031 ) ) ( AVAILABLE ?auto_18032 ) ( SURFACE-AT ?auto_18034 ?auto_18028 ) ( ON ?auto_18034 ?auto_18030 ) ( CLEAR ?auto_18034 ) ( not ( = ?auto_18025 ?auto_18030 ) ) ( not ( = ?auto_18026 ?auto_18030 ) ) ( not ( = ?auto_18035 ?auto_18030 ) ) ( not ( = ?auto_18034 ?auto_18030 ) ) ( not ( = ?auto_18033 ?auto_18030 ) ) ( not ( = ?auto_18031 ?auto_18030 ) ) ( IS-CRATE ?auto_18031 ) ( not ( = ?auto_18025 ?auto_18040 ) ) ( not ( = ?auto_18026 ?auto_18040 ) ) ( not ( = ?auto_18035 ?auto_18040 ) ) ( not ( = ?auto_18034 ?auto_18040 ) ) ( not ( = ?auto_18033 ?auto_18040 ) ) ( not ( = ?auto_18031 ?auto_18040 ) ) ( not ( = ?auto_18030 ?auto_18040 ) ) ( not ( = ?auto_18027 ?auto_18042 ) ) ( not ( = ?auto_18028 ?auto_18027 ) ) ( not ( = ?auto_18039 ?auto_18027 ) ) ( HOIST-AT ?auto_18036 ?auto_18027 ) ( not ( = ?auto_18043 ?auto_18036 ) ) ( not ( = ?auto_18032 ?auto_18036 ) ) ( not ( = ?auto_18038 ?auto_18036 ) ) ( AVAILABLE ?auto_18036 ) ( SURFACE-AT ?auto_18031 ?auto_18027 ) ( ON ?auto_18031 ?auto_18029 ) ( CLEAR ?auto_18031 ) ( not ( = ?auto_18025 ?auto_18029 ) ) ( not ( = ?auto_18026 ?auto_18029 ) ) ( not ( = ?auto_18035 ?auto_18029 ) ) ( not ( = ?auto_18034 ?auto_18029 ) ) ( not ( = ?auto_18033 ?auto_18029 ) ) ( not ( = ?auto_18031 ?auto_18029 ) ) ( not ( = ?auto_18030 ?auto_18029 ) ) ( not ( = ?auto_18040 ?auto_18029 ) ) ( TRUCK-AT ?auto_18037 ?auto_18042 ) ( SURFACE-AT ?auto_18041 ?auto_18042 ) ( CLEAR ?auto_18041 ) ( IS-CRATE ?auto_18040 ) ( not ( = ?auto_18025 ?auto_18041 ) ) ( not ( = ?auto_18026 ?auto_18041 ) ) ( not ( = ?auto_18035 ?auto_18041 ) ) ( not ( = ?auto_18034 ?auto_18041 ) ) ( not ( = ?auto_18033 ?auto_18041 ) ) ( not ( = ?auto_18031 ?auto_18041 ) ) ( not ( = ?auto_18030 ?auto_18041 ) ) ( not ( = ?auto_18040 ?auto_18041 ) ) ( not ( = ?auto_18029 ?auto_18041 ) ) ( AVAILABLE ?auto_18043 ) ( IN ?auto_18040 ?auto_18037 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18043 ?auto_18040 ?auto_18037 ?auto_18042 )
      ( MAKE-ON ?auto_18025 ?auto_18026 )
      ( MAKE-ON-VERIFY ?auto_18025 ?auto_18026 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18044 - SURFACE
      ?auto_18045 - SURFACE
    )
    :vars
    (
      ?auto_18058 - HOIST
      ?auto_18054 - PLACE
      ?auto_18061 - PLACE
      ?auto_18047 - HOIST
      ?auto_18051 - SURFACE
      ?auto_18059 - SURFACE
      ?auto_18055 - PLACE
      ?auto_18048 - HOIST
      ?auto_18053 - SURFACE
      ?auto_18062 - SURFACE
      ?auto_18049 - SURFACE
      ?auto_18060 - SURFACE
      ?auto_18056 - PLACE
      ?auto_18052 - HOIST
      ?auto_18050 - SURFACE
      ?auto_18057 - SURFACE
      ?auto_18046 - TRUCK
      ?auto_18063 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18058 ?auto_18054 ) ( IS-CRATE ?auto_18044 ) ( not ( = ?auto_18044 ?auto_18045 ) ) ( not ( = ?auto_18061 ?auto_18054 ) ) ( HOIST-AT ?auto_18047 ?auto_18061 ) ( not ( = ?auto_18058 ?auto_18047 ) ) ( SURFACE-AT ?auto_18044 ?auto_18061 ) ( ON ?auto_18044 ?auto_18051 ) ( CLEAR ?auto_18044 ) ( not ( = ?auto_18044 ?auto_18051 ) ) ( not ( = ?auto_18045 ?auto_18051 ) ) ( IS-CRATE ?auto_18045 ) ( not ( = ?auto_18044 ?auto_18059 ) ) ( not ( = ?auto_18045 ?auto_18059 ) ) ( not ( = ?auto_18051 ?auto_18059 ) ) ( not ( = ?auto_18055 ?auto_18054 ) ) ( not ( = ?auto_18061 ?auto_18055 ) ) ( HOIST-AT ?auto_18048 ?auto_18055 ) ( not ( = ?auto_18058 ?auto_18048 ) ) ( not ( = ?auto_18047 ?auto_18048 ) ) ( AVAILABLE ?auto_18048 ) ( SURFACE-AT ?auto_18045 ?auto_18055 ) ( ON ?auto_18045 ?auto_18053 ) ( CLEAR ?auto_18045 ) ( not ( = ?auto_18044 ?auto_18053 ) ) ( not ( = ?auto_18045 ?auto_18053 ) ) ( not ( = ?auto_18051 ?auto_18053 ) ) ( not ( = ?auto_18059 ?auto_18053 ) ) ( IS-CRATE ?auto_18059 ) ( not ( = ?auto_18044 ?auto_18062 ) ) ( not ( = ?auto_18045 ?auto_18062 ) ) ( not ( = ?auto_18051 ?auto_18062 ) ) ( not ( = ?auto_18059 ?auto_18062 ) ) ( not ( = ?auto_18053 ?auto_18062 ) ) ( AVAILABLE ?auto_18047 ) ( SURFACE-AT ?auto_18059 ?auto_18061 ) ( ON ?auto_18059 ?auto_18049 ) ( CLEAR ?auto_18059 ) ( not ( = ?auto_18044 ?auto_18049 ) ) ( not ( = ?auto_18045 ?auto_18049 ) ) ( not ( = ?auto_18051 ?auto_18049 ) ) ( not ( = ?auto_18059 ?auto_18049 ) ) ( not ( = ?auto_18053 ?auto_18049 ) ) ( not ( = ?auto_18062 ?auto_18049 ) ) ( IS-CRATE ?auto_18062 ) ( not ( = ?auto_18044 ?auto_18060 ) ) ( not ( = ?auto_18045 ?auto_18060 ) ) ( not ( = ?auto_18051 ?auto_18060 ) ) ( not ( = ?auto_18059 ?auto_18060 ) ) ( not ( = ?auto_18053 ?auto_18060 ) ) ( not ( = ?auto_18062 ?auto_18060 ) ) ( not ( = ?auto_18049 ?auto_18060 ) ) ( not ( = ?auto_18056 ?auto_18054 ) ) ( not ( = ?auto_18061 ?auto_18056 ) ) ( not ( = ?auto_18055 ?auto_18056 ) ) ( HOIST-AT ?auto_18052 ?auto_18056 ) ( not ( = ?auto_18058 ?auto_18052 ) ) ( not ( = ?auto_18047 ?auto_18052 ) ) ( not ( = ?auto_18048 ?auto_18052 ) ) ( AVAILABLE ?auto_18052 ) ( SURFACE-AT ?auto_18062 ?auto_18056 ) ( ON ?auto_18062 ?auto_18050 ) ( CLEAR ?auto_18062 ) ( not ( = ?auto_18044 ?auto_18050 ) ) ( not ( = ?auto_18045 ?auto_18050 ) ) ( not ( = ?auto_18051 ?auto_18050 ) ) ( not ( = ?auto_18059 ?auto_18050 ) ) ( not ( = ?auto_18053 ?auto_18050 ) ) ( not ( = ?auto_18062 ?auto_18050 ) ) ( not ( = ?auto_18049 ?auto_18050 ) ) ( not ( = ?auto_18060 ?auto_18050 ) ) ( SURFACE-AT ?auto_18057 ?auto_18054 ) ( CLEAR ?auto_18057 ) ( IS-CRATE ?auto_18060 ) ( not ( = ?auto_18044 ?auto_18057 ) ) ( not ( = ?auto_18045 ?auto_18057 ) ) ( not ( = ?auto_18051 ?auto_18057 ) ) ( not ( = ?auto_18059 ?auto_18057 ) ) ( not ( = ?auto_18053 ?auto_18057 ) ) ( not ( = ?auto_18062 ?auto_18057 ) ) ( not ( = ?auto_18049 ?auto_18057 ) ) ( not ( = ?auto_18060 ?auto_18057 ) ) ( not ( = ?auto_18050 ?auto_18057 ) ) ( AVAILABLE ?auto_18058 ) ( IN ?auto_18060 ?auto_18046 ) ( TRUCK-AT ?auto_18046 ?auto_18063 ) ( not ( = ?auto_18063 ?auto_18054 ) ) ( not ( = ?auto_18061 ?auto_18063 ) ) ( not ( = ?auto_18055 ?auto_18063 ) ) ( not ( = ?auto_18056 ?auto_18063 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18046 ?auto_18063 ?auto_18054 )
      ( MAKE-ON ?auto_18044 ?auto_18045 )
      ( MAKE-ON-VERIFY ?auto_18044 ?auto_18045 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18064 - SURFACE
      ?auto_18065 - SURFACE
    )
    :vars
    (
      ?auto_18072 - HOIST
      ?auto_18067 - PLACE
      ?auto_18069 - PLACE
      ?auto_18082 - HOIST
      ?auto_18080 - SURFACE
      ?auto_18071 - SURFACE
      ?auto_18079 - PLACE
      ?auto_18070 - HOIST
      ?auto_18068 - SURFACE
      ?auto_18066 - SURFACE
      ?auto_18075 - SURFACE
      ?auto_18076 - SURFACE
      ?auto_18081 - PLACE
      ?auto_18077 - HOIST
      ?auto_18074 - SURFACE
      ?auto_18083 - SURFACE
      ?auto_18073 - TRUCK
      ?auto_18078 - PLACE
      ?auto_18084 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18072 ?auto_18067 ) ( IS-CRATE ?auto_18064 ) ( not ( = ?auto_18064 ?auto_18065 ) ) ( not ( = ?auto_18069 ?auto_18067 ) ) ( HOIST-AT ?auto_18082 ?auto_18069 ) ( not ( = ?auto_18072 ?auto_18082 ) ) ( SURFACE-AT ?auto_18064 ?auto_18069 ) ( ON ?auto_18064 ?auto_18080 ) ( CLEAR ?auto_18064 ) ( not ( = ?auto_18064 ?auto_18080 ) ) ( not ( = ?auto_18065 ?auto_18080 ) ) ( IS-CRATE ?auto_18065 ) ( not ( = ?auto_18064 ?auto_18071 ) ) ( not ( = ?auto_18065 ?auto_18071 ) ) ( not ( = ?auto_18080 ?auto_18071 ) ) ( not ( = ?auto_18079 ?auto_18067 ) ) ( not ( = ?auto_18069 ?auto_18079 ) ) ( HOIST-AT ?auto_18070 ?auto_18079 ) ( not ( = ?auto_18072 ?auto_18070 ) ) ( not ( = ?auto_18082 ?auto_18070 ) ) ( AVAILABLE ?auto_18070 ) ( SURFACE-AT ?auto_18065 ?auto_18079 ) ( ON ?auto_18065 ?auto_18068 ) ( CLEAR ?auto_18065 ) ( not ( = ?auto_18064 ?auto_18068 ) ) ( not ( = ?auto_18065 ?auto_18068 ) ) ( not ( = ?auto_18080 ?auto_18068 ) ) ( not ( = ?auto_18071 ?auto_18068 ) ) ( IS-CRATE ?auto_18071 ) ( not ( = ?auto_18064 ?auto_18066 ) ) ( not ( = ?auto_18065 ?auto_18066 ) ) ( not ( = ?auto_18080 ?auto_18066 ) ) ( not ( = ?auto_18071 ?auto_18066 ) ) ( not ( = ?auto_18068 ?auto_18066 ) ) ( AVAILABLE ?auto_18082 ) ( SURFACE-AT ?auto_18071 ?auto_18069 ) ( ON ?auto_18071 ?auto_18075 ) ( CLEAR ?auto_18071 ) ( not ( = ?auto_18064 ?auto_18075 ) ) ( not ( = ?auto_18065 ?auto_18075 ) ) ( not ( = ?auto_18080 ?auto_18075 ) ) ( not ( = ?auto_18071 ?auto_18075 ) ) ( not ( = ?auto_18068 ?auto_18075 ) ) ( not ( = ?auto_18066 ?auto_18075 ) ) ( IS-CRATE ?auto_18066 ) ( not ( = ?auto_18064 ?auto_18076 ) ) ( not ( = ?auto_18065 ?auto_18076 ) ) ( not ( = ?auto_18080 ?auto_18076 ) ) ( not ( = ?auto_18071 ?auto_18076 ) ) ( not ( = ?auto_18068 ?auto_18076 ) ) ( not ( = ?auto_18066 ?auto_18076 ) ) ( not ( = ?auto_18075 ?auto_18076 ) ) ( not ( = ?auto_18081 ?auto_18067 ) ) ( not ( = ?auto_18069 ?auto_18081 ) ) ( not ( = ?auto_18079 ?auto_18081 ) ) ( HOIST-AT ?auto_18077 ?auto_18081 ) ( not ( = ?auto_18072 ?auto_18077 ) ) ( not ( = ?auto_18082 ?auto_18077 ) ) ( not ( = ?auto_18070 ?auto_18077 ) ) ( AVAILABLE ?auto_18077 ) ( SURFACE-AT ?auto_18066 ?auto_18081 ) ( ON ?auto_18066 ?auto_18074 ) ( CLEAR ?auto_18066 ) ( not ( = ?auto_18064 ?auto_18074 ) ) ( not ( = ?auto_18065 ?auto_18074 ) ) ( not ( = ?auto_18080 ?auto_18074 ) ) ( not ( = ?auto_18071 ?auto_18074 ) ) ( not ( = ?auto_18068 ?auto_18074 ) ) ( not ( = ?auto_18066 ?auto_18074 ) ) ( not ( = ?auto_18075 ?auto_18074 ) ) ( not ( = ?auto_18076 ?auto_18074 ) ) ( SURFACE-AT ?auto_18083 ?auto_18067 ) ( CLEAR ?auto_18083 ) ( IS-CRATE ?auto_18076 ) ( not ( = ?auto_18064 ?auto_18083 ) ) ( not ( = ?auto_18065 ?auto_18083 ) ) ( not ( = ?auto_18080 ?auto_18083 ) ) ( not ( = ?auto_18071 ?auto_18083 ) ) ( not ( = ?auto_18068 ?auto_18083 ) ) ( not ( = ?auto_18066 ?auto_18083 ) ) ( not ( = ?auto_18075 ?auto_18083 ) ) ( not ( = ?auto_18076 ?auto_18083 ) ) ( not ( = ?auto_18074 ?auto_18083 ) ) ( AVAILABLE ?auto_18072 ) ( TRUCK-AT ?auto_18073 ?auto_18078 ) ( not ( = ?auto_18078 ?auto_18067 ) ) ( not ( = ?auto_18069 ?auto_18078 ) ) ( not ( = ?auto_18079 ?auto_18078 ) ) ( not ( = ?auto_18081 ?auto_18078 ) ) ( HOIST-AT ?auto_18084 ?auto_18078 ) ( LIFTING ?auto_18084 ?auto_18076 ) ( not ( = ?auto_18072 ?auto_18084 ) ) ( not ( = ?auto_18082 ?auto_18084 ) ) ( not ( = ?auto_18070 ?auto_18084 ) ) ( not ( = ?auto_18077 ?auto_18084 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18084 ?auto_18076 ?auto_18073 ?auto_18078 )
      ( MAKE-ON ?auto_18064 ?auto_18065 )
      ( MAKE-ON-VERIFY ?auto_18064 ?auto_18065 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18085 - SURFACE
      ?auto_18086 - SURFACE
    )
    :vars
    (
      ?auto_18096 - HOIST
      ?auto_18093 - PLACE
      ?auto_18105 - PLACE
      ?auto_18090 - HOIST
      ?auto_18099 - SURFACE
      ?auto_18092 - SURFACE
      ?auto_18101 - PLACE
      ?auto_18088 - HOIST
      ?auto_18104 - SURFACE
      ?auto_18094 - SURFACE
      ?auto_18102 - SURFACE
      ?auto_18087 - SURFACE
      ?auto_18098 - PLACE
      ?auto_18091 - HOIST
      ?auto_18097 - SURFACE
      ?auto_18089 - SURFACE
      ?auto_18100 - TRUCK
      ?auto_18103 - PLACE
      ?auto_18095 - HOIST
      ?auto_18106 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18096 ?auto_18093 ) ( IS-CRATE ?auto_18085 ) ( not ( = ?auto_18085 ?auto_18086 ) ) ( not ( = ?auto_18105 ?auto_18093 ) ) ( HOIST-AT ?auto_18090 ?auto_18105 ) ( not ( = ?auto_18096 ?auto_18090 ) ) ( SURFACE-AT ?auto_18085 ?auto_18105 ) ( ON ?auto_18085 ?auto_18099 ) ( CLEAR ?auto_18085 ) ( not ( = ?auto_18085 ?auto_18099 ) ) ( not ( = ?auto_18086 ?auto_18099 ) ) ( IS-CRATE ?auto_18086 ) ( not ( = ?auto_18085 ?auto_18092 ) ) ( not ( = ?auto_18086 ?auto_18092 ) ) ( not ( = ?auto_18099 ?auto_18092 ) ) ( not ( = ?auto_18101 ?auto_18093 ) ) ( not ( = ?auto_18105 ?auto_18101 ) ) ( HOIST-AT ?auto_18088 ?auto_18101 ) ( not ( = ?auto_18096 ?auto_18088 ) ) ( not ( = ?auto_18090 ?auto_18088 ) ) ( AVAILABLE ?auto_18088 ) ( SURFACE-AT ?auto_18086 ?auto_18101 ) ( ON ?auto_18086 ?auto_18104 ) ( CLEAR ?auto_18086 ) ( not ( = ?auto_18085 ?auto_18104 ) ) ( not ( = ?auto_18086 ?auto_18104 ) ) ( not ( = ?auto_18099 ?auto_18104 ) ) ( not ( = ?auto_18092 ?auto_18104 ) ) ( IS-CRATE ?auto_18092 ) ( not ( = ?auto_18085 ?auto_18094 ) ) ( not ( = ?auto_18086 ?auto_18094 ) ) ( not ( = ?auto_18099 ?auto_18094 ) ) ( not ( = ?auto_18092 ?auto_18094 ) ) ( not ( = ?auto_18104 ?auto_18094 ) ) ( AVAILABLE ?auto_18090 ) ( SURFACE-AT ?auto_18092 ?auto_18105 ) ( ON ?auto_18092 ?auto_18102 ) ( CLEAR ?auto_18092 ) ( not ( = ?auto_18085 ?auto_18102 ) ) ( not ( = ?auto_18086 ?auto_18102 ) ) ( not ( = ?auto_18099 ?auto_18102 ) ) ( not ( = ?auto_18092 ?auto_18102 ) ) ( not ( = ?auto_18104 ?auto_18102 ) ) ( not ( = ?auto_18094 ?auto_18102 ) ) ( IS-CRATE ?auto_18094 ) ( not ( = ?auto_18085 ?auto_18087 ) ) ( not ( = ?auto_18086 ?auto_18087 ) ) ( not ( = ?auto_18099 ?auto_18087 ) ) ( not ( = ?auto_18092 ?auto_18087 ) ) ( not ( = ?auto_18104 ?auto_18087 ) ) ( not ( = ?auto_18094 ?auto_18087 ) ) ( not ( = ?auto_18102 ?auto_18087 ) ) ( not ( = ?auto_18098 ?auto_18093 ) ) ( not ( = ?auto_18105 ?auto_18098 ) ) ( not ( = ?auto_18101 ?auto_18098 ) ) ( HOIST-AT ?auto_18091 ?auto_18098 ) ( not ( = ?auto_18096 ?auto_18091 ) ) ( not ( = ?auto_18090 ?auto_18091 ) ) ( not ( = ?auto_18088 ?auto_18091 ) ) ( AVAILABLE ?auto_18091 ) ( SURFACE-AT ?auto_18094 ?auto_18098 ) ( ON ?auto_18094 ?auto_18097 ) ( CLEAR ?auto_18094 ) ( not ( = ?auto_18085 ?auto_18097 ) ) ( not ( = ?auto_18086 ?auto_18097 ) ) ( not ( = ?auto_18099 ?auto_18097 ) ) ( not ( = ?auto_18092 ?auto_18097 ) ) ( not ( = ?auto_18104 ?auto_18097 ) ) ( not ( = ?auto_18094 ?auto_18097 ) ) ( not ( = ?auto_18102 ?auto_18097 ) ) ( not ( = ?auto_18087 ?auto_18097 ) ) ( SURFACE-AT ?auto_18089 ?auto_18093 ) ( CLEAR ?auto_18089 ) ( IS-CRATE ?auto_18087 ) ( not ( = ?auto_18085 ?auto_18089 ) ) ( not ( = ?auto_18086 ?auto_18089 ) ) ( not ( = ?auto_18099 ?auto_18089 ) ) ( not ( = ?auto_18092 ?auto_18089 ) ) ( not ( = ?auto_18104 ?auto_18089 ) ) ( not ( = ?auto_18094 ?auto_18089 ) ) ( not ( = ?auto_18102 ?auto_18089 ) ) ( not ( = ?auto_18087 ?auto_18089 ) ) ( not ( = ?auto_18097 ?auto_18089 ) ) ( AVAILABLE ?auto_18096 ) ( TRUCK-AT ?auto_18100 ?auto_18103 ) ( not ( = ?auto_18103 ?auto_18093 ) ) ( not ( = ?auto_18105 ?auto_18103 ) ) ( not ( = ?auto_18101 ?auto_18103 ) ) ( not ( = ?auto_18098 ?auto_18103 ) ) ( HOIST-AT ?auto_18095 ?auto_18103 ) ( not ( = ?auto_18096 ?auto_18095 ) ) ( not ( = ?auto_18090 ?auto_18095 ) ) ( not ( = ?auto_18088 ?auto_18095 ) ) ( not ( = ?auto_18091 ?auto_18095 ) ) ( AVAILABLE ?auto_18095 ) ( SURFACE-AT ?auto_18087 ?auto_18103 ) ( ON ?auto_18087 ?auto_18106 ) ( CLEAR ?auto_18087 ) ( not ( = ?auto_18085 ?auto_18106 ) ) ( not ( = ?auto_18086 ?auto_18106 ) ) ( not ( = ?auto_18099 ?auto_18106 ) ) ( not ( = ?auto_18092 ?auto_18106 ) ) ( not ( = ?auto_18104 ?auto_18106 ) ) ( not ( = ?auto_18094 ?auto_18106 ) ) ( not ( = ?auto_18102 ?auto_18106 ) ) ( not ( = ?auto_18087 ?auto_18106 ) ) ( not ( = ?auto_18097 ?auto_18106 ) ) ( not ( = ?auto_18089 ?auto_18106 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18095 ?auto_18087 ?auto_18106 ?auto_18103 )
      ( MAKE-ON ?auto_18085 ?auto_18086 )
      ( MAKE-ON-VERIFY ?auto_18085 ?auto_18086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18107 - SURFACE
      ?auto_18108 - SURFACE
    )
    :vars
    (
      ?auto_18109 - HOIST
      ?auto_18127 - PLACE
      ?auto_18114 - PLACE
      ?auto_18115 - HOIST
      ?auto_18116 - SURFACE
      ?auto_18125 - SURFACE
      ?auto_18123 - PLACE
      ?auto_18126 - HOIST
      ?auto_18117 - SURFACE
      ?auto_18124 - SURFACE
      ?auto_18119 - SURFACE
      ?auto_18122 - SURFACE
      ?auto_18113 - PLACE
      ?auto_18112 - HOIST
      ?auto_18128 - SURFACE
      ?auto_18110 - SURFACE
      ?auto_18118 - PLACE
      ?auto_18121 - HOIST
      ?auto_18120 - SURFACE
      ?auto_18111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18109 ?auto_18127 ) ( IS-CRATE ?auto_18107 ) ( not ( = ?auto_18107 ?auto_18108 ) ) ( not ( = ?auto_18114 ?auto_18127 ) ) ( HOIST-AT ?auto_18115 ?auto_18114 ) ( not ( = ?auto_18109 ?auto_18115 ) ) ( SURFACE-AT ?auto_18107 ?auto_18114 ) ( ON ?auto_18107 ?auto_18116 ) ( CLEAR ?auto_18107 ) ( not ( = ?auto_18107 ?auto_18116 ) ) ( not ( = ?auto_18108 ?auto_18116 ) ) ( IS-CRATE ?auto_18108 ) ( not ( = ?auto_18107 ?auto_18125 ) ) ( not ( = ?auto_18108 ?auto_18125 ) ) ( not ( = ?auto_18116 ?auto_18125 ) ) ( not ( = ?auto_18123 ?auto_18127 ) ) ( not ( = ?auto_18114 ?auto_18123 ) ) ( HOIST-AT ?auto_18126 ?auto_18123 ) ( not ( = ?auto_18109 ?auto_18126 ) ) ( not ( = ?auto_18115 ?auto_18126 ) ) ( AVAILABLE ?auto_18126 ) ( SURFACE-AT ?auto_18108 ?auto_18123 ) ( ON ?auto_18108 ?auto_18117 ) ( CLEAR ?auto_18108 ) ( not ( = ?auto_18107 ?auto_18117 ) ) ( not ( = ?auto_18108 ?auto_18117 ) ) ( not ( = ?auto_18116 ?auto_18117 ) ) ( not ( = ?auto_18125 ?auto_18117 ) ) ( IS-CRATE ?auto_18125 ) ( not ( = ?auto_18107 ?auto_18124 ) ) ( not ( = ?auto_18108 ?auto_18124 ) ) ( not ( = ?auto_18116 ?auto_18124 ) ) ( not ( = ?auto_18125 ?auto_18124 ) ) ( not ( = ?auto_18117 ?auto_18124 ) ) ( AVAILABLE ?auto_18115 ) ( SURFACE-AT ?auto_18125 ?auto_18114 ) ( ON ?auto_18125 ?auto_18119 ) ( CLEAR ?auto_18125 ) ( not ( = ?auto_18107 ?auto_18119 ) ) ( not ( = ?auto_18108 ?auto_18119 ) ) ( not ( = ?auto_18116 ?auto_18119 ) ) ( not ( = ?auto_18125 ?auto_18119 ) ) ( not ( = ?auto_18117 ?auto_18119 ) ) ( not ( = ?auto_18124 ?auto_18119 ) ) ( IS-CRATE ?auto_18124 ) ( not ( = ?auto_18107 ?auto_18122 ) ) ( not ( = ?auto_18108 ?auto_18122 ) ) ( not ( = ?auto_18116 ?auto_18122 ) ) ( not ( = ?auto_18125 ?auto_18122 ) ) ( not ( = ?auto_18117 ?auto_18122 ) ) ( not ( = ?auto_18124 ?auto_18122 ) ) ( not ( = ?auto_18119 ?auto_18122 ) ) ( not ( = ?auto_18113 ?auto_18127 ) ) ( not ( = ?auto_18114 ?auto_18113 ) ) ( not ( = ?auto_18123 ?auto_18113 ) ) ( HOIST-AT ?auto_18112 ?auto_18113 ) ( not ( = ?auto_18109 ?auto_18112 ) ) ( not ( = ?auto_18115 ?auto_18112 ) ) ( not ( = ?auto_18126 ?auto_18112 ) ) ( AVAILABLE ?auto_18112 ) ( SURFACE-AT ?auto_18124 ?auto_18113 ) ( ON ?auto_18124 ?auto_18128 ) ( CLEAR ?auto_18124 ) ( not ( = ?auto_18107 ?auto_18128 ) ) ( not ( = ?auto_18108 ?auto_18128 ) ) ( not ( = ?auto_18116 ?auto_18128 ) ) ( not ( = ?auto_18125 ?auto_18128 ) ) ( not ( = ?auto_18117 ?auto_18128 ) ) ( not ( = ?auto_18124 ?auto_18128 ) ) ( not ( = ?auto_18119 ?auto_18128 ) ) ( not ( = ?auto_18122 ?auto_18128 ) ) ( SURFACE-AT ?auto_18110 ?auto_18127 ) ( CLEAR ?auto_18110 ) ( IS-CRATE ?auto_18122 ) ( not ( = ?auto_18107 ?auto_18110 ) ) ( not ( = ?auto_18108 ?auto_18110 ) ) ( not ( = ?auto_18116 ?auto_18110 ) ) ( not ( = ?auto_18125 ?auto_18110 ) ) ( not ( = ?auto_18117 ?auto_18110 ) ) ( not ( = ?auto_18124 ?auto_18110 ) ) ( not ( = ?auto_18119 ?auto_18110 ) ) ( not ( = ?auto_18122 ?auto_18110 ) ) ( not ( = ?auto_18128 ?auto_18110 ) ) ( AVAILABLE ?auto_18109 ) ( not ( = ?auto_18118 ?auto_18127 ) ) ( not ( = ?auto_18114 ?auto_18118 ) ) ( not ( = ?auto_18123 ?auto_18118 ) ) ( not ( = ?auto_18113 ?auto_18118 ) ) ( HOIST-AT ?auto_18121 ?auto_18118 ) ( not ( = ?auto_18109 ?auto_18121 ) ) ( not ( = ?auto_18115 ?auto_18121 ) ) ( not ( = ?auto_18126 ?auto_18121 ) ) ( not ( = ?auto_18112 ?auto_18121 ) ) ( AVAILABLE ?auto_18121 ) ( SURFACE-AT ?auto_18122 ?auto_18118 ) ( ON ?auto_18122 ?auto_18120 ) ( CLEAR ?auto_18122 ) ( not ( = ?auto_18107 ?auto_18120 ) ) ( not ( = ?auto_18108 ?auto_18120 ) ) ( not ( = ?auto_18116 ?auto_18120 ) ) ( not ( = ?auto_18125 ?auto_18120 ) ) ( not ( = ?auto_18117 ?auto_18120 ) ) ( not ( = ?auto_18124 ?auto_18120 ) ) ( not ( = ?auto_18119 ?auto_18120 ) ) ( not ( = ?auto_18122 ?auto_18120 ) ) ( not ( = ?auto_18128 ?auto_18120 ) ) ( not ( = ?auto_18110 ?auto_18120 ) ) ( TRUCK-AT ?auto_18111 ?auto_18127 ) )
    :subtasks
    ( ( !DRIVE ?auto_18111 ?auto_18127 ?auto_18118 )
      ( MAKE-ON ?auto_18107 ?auto_18108 )
      ( MAKE-ON-VERIFY ?auto_18107 ?auto_18108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18129 - SURFACE
      ?auto_18130 - SURFACE
    )
    :vars
    (
      ?auto_18139 - HOIST
      ?auto_18146 - PLACE
      ?auto_18143 - PLACE
      ?auto_18137 - HOIST
      ?auto_18133 - SURFACE
      ?auto_18144 - SURFACE
      ?auto_18140 - PLACE
      ?auto_18145 - HOIST
      ?auto_18149 - SURFACE
      ?auto_18148 - SURFACE
      ?auto_18142 - SURFACE
      ?auto_18141 - SURFACE
      ?auto_18131 - PLACE
      ?auto_18134 - HOIST
      ?auto_18147 - SURFACE
      ?auto_18138 - SURFACE
      ?auto_18136 - PLACE
      ?auto_18135 - HOIST
      ?auto_18132 - SURFACE
      ?auto_18150 - TRUCK
      ?auto_18151 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18139 ?auto_18146 ) ( IS-CRATE ?auto_18129 ) ( not ( = ?auto_18129 ?auto_18130 ) ) ( not ( = ?auto_18143 ?auto_18146 ) ) ( HOIST-AT ?auto_18137 ?auto_18143 ) ( not ( = ?auto_18139 ?auto_18137 ) ) ( SURFACE-AT ?auto_18129 ?auto_18143 ) ( ON ?auto_18129 ?auto_18133 ) ( CLEAR ?auto_18129 ) ( not ( = ?auto_18129 ?auto_18133 ) ) ( not ( = ?auto_18130 ?auto_18133 ) ) ( IS-CRATE ?auto_18130 ) ( not ( = ?auto_18129 ?auto_18144 ) ) ( not ( = ?auto_18130 ?auto_18144 ) ) ( not ( = ?auto_18133 ?auto_18144 ) ) ( not ( = ?auto_18140 ?auto_18146 ) ) ( not ( = ?auto_18143 ?auto_18140 ) ) ( HOIST-AT ?auto_18145 ?auto_18140 ) ( not ( = ?auto_18139 ?auto_18145 ) ) ( not ( = ?auto_18137 ?auto_18145 ) ) ( AVAILABLE ?auto_18145 ) ( SURFACE-AT ?auto_18130 ?auto_18140 ) ( ON ?auto_18130 ?auto_18149 ) ( CLEAR ?auto_18130 ) ( not ( = ?auto_18129 ?auto_18149 ) ) ( not ( = ?auto_18130 ?auto_18149 ) ) ( not ( = ?auto_18133 ?auto_18149 ) ) ( not ( = ?auto_18144 ?auto_18149 ) ) ( IS-CRATE ?auto_18144 ) ( not ( = ?auto_18129 ?auto_18148 ) ) ( not ( = ?auto_18130 ?auto_18148 ) ) ( not ( = ?auto_18133 ?auto_18148 ) ) ( not ( = ?auto_18144 ?auto_18148 ) ) ( not ( = ?auto_18149 ?auto_18148 ) ) ( AVAILABLE ?auto_18137 ) ( SURFACE-AT ?auto_18144 ?auto_18143 ) ( ON ?auto_18144 ?auto_18142 ) ( CLEAR ?auto_18144 ) ( not ( = ?auto_18129 ?auto_18142 ) ) ( not ( = ?auto_18130 ?auto_18142 ) ) ( not ( = ?auto_18133 ?auto_18142 ) ) ( not ( = ?auto_18144 ?auto_18142 ) ) ( not ( = ?auto_18149 ?auto_18142 ) ) ( not ( = ?auto_18148 ?auto_18142 ) ) ( IS-CRATE ?auto_18148 ) ( not ( = ?auto_18129 ?auto_18141 ) ) ( not ( = ?auto_18130 ?auto_18141 ) ) ( not ( = ?auto_18133 ?auto_18141 ) ) ( not ( = ?auto_18144 ?auto_18141 ) ) ( not ( = ?auto_18149 ?auto_18141 ) ) ( not ( = ?auto_18148 ?auto_18141 ) ) ( not ( = ?auto_18142 ?auto_18141 ) ) ( not ( = ?auto_18131 ?auto_18146 ) ) ( not ( = ?auto_18143 ?auto_18131 ) ) ( not ( = ?auto_18140 ?auto_18131 ) ) ( HOIST-AT ?auto_18134 ?auto_18131 ) ( not ( = ?auto_18139 ?auto_18134 ) ) ( not ( = ?auto_18137 ?auto_18134 ) ) ( not ( = ?auto_18145 ?auto_18134 ) ) ( AVAILABLE ?auto_18134 ) ( SURFACE-AT ?auto_18148 ?auto_18131 ) ( ON ?auto_18148 ?auto_18147 ) ( CLEAR ?auto_18148 ) ( not ( = ?auto_18129 ?auto_18147 ) ) ( not ( = ?auto_18130 ?auto_18147 ) ) ( not ( = ?auto_18133 ?auto_18147 ) ) ( not ( = ?auto_18144 ?auto_18147 ) ) ( not ( = ?auto_18149 ?auto_18147 ) ) ( not ( = ?auto_18148 ?auto_18147 ) ) ( not ( = ?auto_18142 ?auto_18147 ) ) ( not ( = ?auto_18141 ?auto_18147 ) ) ( IS-CRATE ?auto_18141 ) ( not ( = ?auto_18129 ?auto_18138 ) ) ( not ( = ?auto_18130 ?auto_18138 ) ) ( not ( = ?auto_18133 ?auto_18138 ) ) ( not ( = ?auto_18144 ?auto_18138 ) ) ( not ( = ?auto_18149 ?auto_18138 ) ) ( not ( = ?auto_18148 ?auto_18138 ) ) ( not ( = ?auto_18142 ?auto_18138 ) ) ( not ( = ?auto_18141 ?auto_18138 ) ) ( not ( = ?auto_18147 ?auto_18138 ) ) ( not ( = ?auto_18136 ?auto_18146 ) ) ( not ( = ?auto_18143 ?auto_18136 ) ) ( not ( = ?auto_18140 ?auto_18136 ) ) ( not ( = ?auto_18131 ?auto_18136 ) ) ( HOIST-AT ?auto_18135 ?auto_18136 ) ( not ( = ?auto_18139 ?auto_18135 ) ) ( not ( = ?auto_18137 ?auto_18135 ) ) ( not ( = ?auto_18145 ?auto_18135 ) ) ( not ( = ?auto_18134 ?auto_18135 ) ) ( AVAILABLE ?auto_18135 ) ( SURFACE-AT ?auto_18141 ?auto_18136 ) ( ON ?auto_18141 ?auto_18132 ) ( CLEAR ?auto_18141 ) ( not ( = ?auto_18129 ?auto_18132 ) ) ( not ( = ?auto_18130 ?auto_18132 ) ) ( not ( = ?auto_18133 ?auto_18132 ) ) ( not ( = ?auto_18144 ?auto_18132 ) ) ( not ( = ?auto_18149 ?auto_18132 ) ) ( not ( = ?auto_18148 ?auto_18132 ) ) ( not ( = ?auto_18142 ?auto_18132 ) ) ( not ( = ?auto_18141 ?auto_18132 ) ) ( not ( = ?auto_18147 ?auto_18132 ) ) ( not ( = ?auto_18138 ?auto_18132 ) ) ( TRUCK-AT ?auto_18150 ?auto_18146 ) ( SURFACE-AT ?auto_18151 ?auto_18146 ) ( CLEAR ?auto_18151 ) ( LIFTING ?auto_18139 ?auto_18138 ) ( IS-CRATE ?auto_18138 ) ( not ( = ?auto_18129 ?auto_18151 ) ) ( not ( = ?auto_18130 ?auto_18151 ) ) ( not ( = ?auto_18133 ?auto_18151 ) ) ( not ( = ?auto_18144 ?auto_18151 ) ) ( not ( = ?auto_18149 ?auto_18151 ) ) ( not ( = ?auto_18148 ?auto_18151 ) ) ( not ( = ?auto_18142 ?auto_18151 ) ) ( not ( = ?auto_18141 ?auto_18151 ) ) ( not ( = ?auto_18147 ?auto_18151 ) ) ( not ( = ?auto_18138 ?auto_18151 ) ) ( not ( = ?auto_18132 ?auto_18151 ) ) )
    :subtasks
    ( ( !DROP ?auto_18139 ?auto_18138 ?auto_18151 ?auto_18146 )
      ( MAKE-ON ?auto_18129 ?auto_18130 )
      ( MAKE-ON-VERIFY ?auto_18129 ?auto_18130 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18152 - SURFACE
      ?auto_18153 - SURFACE
    )
    :vars
    (
      ?auto_18164 - HOIST
      ?auto_18156 - PLACE
      ?auto_18174 - PLACE
      ?auto_18169 - HOIST
      ?auto_18165 - SURFACE
      ?auto_18160 - SURFACE
      ?auto_18162 - PLACE
      ?auto_18168 - HOIST
      ?auto_18172 - SURFACE
      ?auto_18171 - SURFACE
      ?auto_18154 - SURFACE
      ?auto_18161 - SURFACE
      ?auto_18155 - PLACE
      ?auto_18170 - HOIST
      ?auto_18157 - SURFACE
      ?auto_18163 - SURFACE
      ?auto_18173 - PLACE
      ?auto_18159 - HOIST
      ?auto_18158 - SURFACE
      ?auto_18166 - TRUCK
      ?auto_18167 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18164 ?auto_18156 ) ( IS-CRATE ?auto_18152 ) ( not ( = ?auto_18152 ?auto_18153 ) ) ( not ( = ?auto_18174 ?auto_18156 ) ) ( HOIST-AT ?auto_18169 ?auto_18174 ) ( not ( = ?auto_18164 ?auto_18169 ) ) ( SURFACE-AT ?auto_18152 ?auto_18174 ) ( ON ?auto_18152 ?auto_18165 ) ( CLEAR ?auto_18152 ) ( not ( = ?auto_18152 ?auto_18165 ) ) ( not ( = ?auto_18153 ?auto_18165 ) ) ( IS-CRATE ?auto_18153 ) ( not ( = ?auto_18152 ?auto_18160 ) ) ( not ( = ?auto_18153 ?auto_18160 ) ) ( not ( = ?auto_18165 ?auto_18160 ) ) ( not ( = ?auto_18162 ?auto_18156 ) ) ( not ( = ?auto_18174 ?auto_18162 ) ) ( HOIST-AT ?auto_18168 ?auto_18162 ) ( not ( = ?auto_18164 ?auto_18168 ) ) ( not ( = ?auto_18169 ?auto_18168 ) ) ( AVAILABLE ?auto_18168 ) ( SURFACE-AT ?auto_18153 ?auto_18162 ) ( ON ?auto_18153 ?auto_18172 ) ( CLEAR ?auto_18153 ) ( not ( = ?auto_18152 ?auto_18172 ) ) ( not ( = ?auto_18153 ?auto_18172 ) ) ( not ( = ?auto_18165 ?auto_18172 ) ) ( not ( = ?auto_18160 ?auto_18172 ) ) ( IS-CRATE ?auto_18160 ) ( not ( = ?auto_18152 ?auto_18171 ) ) ( not ( = ?auto_18153 ?auto_18171 ) ) ( not ( = ?auto_18165 ?auto_18171 ) ) ( not ( = ?auto_18160 ?auto_18171 ) ) ( not ( = ?auto_18172 ?auto_18171 ) ) ( AVAILABLE ?auto_18169 ) ( SURFACE-AT ?auto_18160 ?auto_18174 ) ( ON ?auto_18160 ?auto_18154 ) ( CLEAR ?auto_18160 ) ( not ( = ?auto_18152 ?auto_18154 ) ) ( not ( = ?auto_18153 ?auto_18154 ) ) ( not ( = ?auto_18165 ?auto_18154 ) ) ( not ( = ?auto_18160 ?auto_18154 ) ) ( not ( = ?auto_18172 ?auto_18154 ) ) ( not ( = ?auto_18171 ?auto_18154 ) ) ( IS-CRATE ?auto_18171 ) ( not ( = ?auto_18152 ?auto_18161 ) ) ( not ( = ?auto_18153 ?auto_18161 ) ) ( not ( = ?auto_18165 ?auto_18161 ) ) ( not ( = ?auto_18160 ?auto_18161 ) ) ( not ( = ?auto_18172 ?auto_18161 ) ) ( not ( = ?auto_18171 ?auto_18161 ) ) ( not ( = ?auto_18154 ?auto_18161 ) ) ( not ( = ?auto_18155 ?auto_18156 ) ) ( not ( = ?auto_18174 ?auto_18155 ) ) ( not ( = ?auto_18162 ?auto_18155 ) ) ( HOIST-AT ?auto_18170 ?auto_18155 ) ( not ( = ?auto_18164 ?auto_18170 ) ) ( not ( = ?auto_18169 ?auto_18170 ) ) ( not ( = ?auto_18168 ?auto_18170 ) ) ( AVAILABLE ?auto_18170 ) ( SURFACE-AT ?auto_18171 ?auto_18155 ) ( ON ?auto_18171 ?auto_18157 ) ( CLEAR ?auto_18171 ) ( not ( = ?auto_18152 ?auto_18157 ) ) ( not ( = ?auto_18153 ?auto_18157 ) ) ( not ( = ?auto_18165 ?auto_18157 ) ) ( not ( = ?auto_18160 ?auto_18157 ) ) ( not ( = ?auto_18172 ?auto_18157 ) ) ( not ( = ?auto_18171 ?auto_18157 ) ) ( not ( = ?auto_18154 ?auto_18157 ) ) ( not ( = ?auto_18161 ?auto_18157 ) ) ( IS-CRATE ?auto_18161 ) ( not ( = ?auto_18152 ?auto_18163 ) ) ( not ( = ?auto_18153 ?auto_18163 ) ) ( not ( = ?auto_18165 ?auto_18163 ) ) ( not ( = ?auto_18160 ?auto_18163 ) ) ( not ( = ?auto_18172 ?auto_18163 ) ) ( not ( = ?auto_18171 ?auto_18163 ) ) ( not ( = ?auto_18154 ?auto_18163 ) ) ( not ( = ?auto_18161 ?auto_18163 ) ) ( not ( = ?auto_18157 ?auto_18163 ) ) ( not ( = ?auto_18173 ?auto_18156 ) ) ( not ( = ?auto_18174 ?auto_18173 ) ) ( not ( = ?auto_18162 ?auto_18173 ) ) ( not ( = ?auto_18155 ?auto_18173 ) ) ( HOIST-AT ?auto_18159 ?auto_18173 ) ( not ( = ?auto_18164 ?auto_18159 ) ) ( not ( = ?auto_18169 ?auto_18159 ) ) ( not ( = ?auto_18168 ?auto_18159 ) ) ( not ( = ?auto_18170 ?auto_18159 ) ) ( AVAILABLE ?auto_18159 ) ( SURFACE-AT ?auto_18161 ?auto_18173 ) ( ON ?auto_18161 ?auto_18158 ) ( CLEAR ?auto_18161 ) ( not ( = ?auto_18152 ?auto_18158 ) ) ( not ( = ?auto_18153 ?auto_18158 ) ) ( not ( = ?auto_18165 ?auto_18158 ) ) ( not ( = ?auto_18160 ?auto_18158 ) ) ( not ( = ?auto_18172 ?auto_18158 ) ) ( not ( = ?auto_18171 ?auto_18158 ) ) ( not ( = ?auto_18154 ?auto_18158 ) ) ( not ( = ?auto_18161 ?auto_18158 ) ) ( not ( = ?auto_18157 ?auto_18158 ) ) ( not ( = ?auto_18163 ?auto_18158 ) ) ( TRUCK-AT ?auto_18166 ?auto_18156 ) ( SURFACE-AT ?auto_18167 ?auto_18156 ) ( CLEAR ?auto_18167 ) ( IS-CRATE ?auto_18163 ) ( not ( = ?auto_18152 ?auto_18167 ) ) ( not ( = ?auto_18153 ?auto_18167 ) ) ( not ( = ?auto_18165 ?auto_18167 ) ) ( not ( = ?auto_18160 ?auto_18167 ) ) ( not ( = ?auto_18172 ?auto_18167 ) ) ( not ( = ?auto_18171 ?auto_18167 ) ) ( not ( = ?auto_18154 ?auto_18167 ) ) ( not ( = ?auto_18161 ?auto_18167 ) ) ( not ( = ?auto_18157 ?auto_18167 ) ) ( not ( = ?auto_18163 ?auto_18167 ) ) ( not ( = ?auto_18158 ?auto_18167 ) ) ( AVAILABLE ?auto_18164 ) ( IN ?auto_18163 ?auto_18166 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18164 ?auto_18163 ?auto_18166 ?auto_18156 )
      ( MAKE-ON ?auto_18152 ?auto_18153 )
      ( MAKE-ON-VERIFY ?auto_18152 ?auto_18153 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18175 - SURFACE
      ?auto_18176 - SURFACE
    )
    :vars
    (
      ?auto_18182 - HOIST
      ?auto_18181 - PLACE
      ?auto_18190 - PLACE
      ?auto_18178 - HOIST
      ?auto_18191 - SURFACE
      ?auto_18195 - SURFACE
      ?auto_18196 - PLACE
      ?auto_18188 - HOIST
      ?auto_18186 - SURFACE
      ?auto_18185 - SURFACE
      ?auto_18183 - SURFACE
      ?auto_18192 - SURFACE
      ?auto_18179 - PLACE
      ?auto_18194 - HOIST
      ?auto_18189 - SURFACE
      ?auto_18180 - SURFACE
      ?auto_18187 - PLACE
      ?auto_18177 - HOIST
      ?auto_18184 - SURFACE
      ?auto_18193 - SURFACE
      ?auto_18197 - TRUCK
      ?auto_18198 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18182 ?auto_18181 ) ( IS-CRATE ?auto_18175 ) ( not ( = ?auto_18175 ?auto_18176 ) ) ( not ( = ?auto_18190 ?auto_18181 ) ) ( HOIST-AT ?auto_18178 ?auto_18190 ) ( not ( = ?auto_18182 ?auto_18178 ) ) ( SURFACE-AT ?auto_18175 ?auto_18190 ) ( ON ?auto_18175 ?auto_18191 ) ( CLEAR ?auto_18175 ) ( not ( = ?auto_18175 ?auto_18191 ) ) ( not ( = ?auto_18176 ?auto_18191 ) ) ( IS-CRATE ?auto_18176 ) ( not ( = ?auto_18175 ?auto_18195 ) ) ( not ( = ?auto_18176 ?auto_18195 ) ) ( not ( = ?auto_18191 ?auto_18195 ) ) ( not ( = ?auto_18196 ?auto_18181 ) ) ( not ( = ?auto_18190 ?auto_18196 ) ) ( HOIST-AT ?auto_18188 ?auto_18196 ) ( not ( = ?auto_18182 ?auto_18188 ) ) ( not ( = ?auto_18178 ?auto_18188 ) ) ( AVAILABLE ?auto_18188 ) ( SURFACE-AT ?auto_18176 ?auto_18196 ) ( ON ?auto_18176 ?auto_18186 ) ( CLEAR ?auto_18176 ) ( not ( = ?auto_18175 ?auto_18186 ) ) ( not ( = ?auto_18176 ?auto_18186 ) ) ( not ( = ?auto_18191 ?auto_18186 ) ) ( not ( = ?auto_18195 ?auto_18186 ) ) ( IS-CRATE ?auto_18195 ) ( not ( = ?auto_18175 ?auto_18185 ) ) ( not ( = ?auto_18176 ?auto_18185 ) ) ( not ( = ?auto_18191 ?auto_18185 ) ) ( not ( = ?auto_18195 ?auto_18185 ) ) ( not ( = ?auto_18186 ?auto_18185 ) ) ( AVAILABLE ?auto_18178 ) ( SURFACE-AT ?auto_18195 ?auto_18190 ) ( ON ?auto_18195 ?auto_18183 ) ( CLEAR ?auto_18195 ) ( not ( = ?auto_18175 ?auto_18183 ) ) ( not ( = ?auto_18176 ?auto_18183 ) ) ( not ( = ?auto_18191 ?auto_18183 ) ) ( not ( = ?auto_18195 ?auto_18183 ) ) ( not ( = ?auto_18186 ?auto_18183 ) ) ( not ( = ?auto_18185 ?auto_18183 ) ) ( IS-CRATE ?auto_18185 ) ( not ( = ?auto_18175 ?auto_18192 ) ) ( not ( = ?auto_18176 ?auto_18192 ) ) ( not ( = ?auto_18191 ?auto_18192 ) ) ( not ( = ?auto_18195 ?auto_18192 ) ) ( not ( = ?auto_18186 ?auto_18192 ) ) ( not ( = ?auto_18185 ?auto_18192 ) ) ( not ( = ?auto_18183 ?auto_18192 ) ) ( not ( = ?auto_18179 ?auto_18181 ) ) ( not ( = ?auto_18190 ?auto_18179 ) ) ( not ( = ?auto_18196 ?auto_18179 ) ) ( HOIST-AT ?auto_18194 ?auto_18179 ) ( not ( = ?auto_18182 ?auto_18194 ) ) ( not ( = ?auto_18178 ?auto_18194 ) ) ( not ( = ?auto_18188 ?auto_18194 ) ) ( AVAILABLE ?auto_18194 ) ( SURFACE-AT ?auto_18185 ?auto_18179 ) ( ON ?auto_18185 ?auto_18189 ) ( CLEAR ?auto_18185 ) ( not ( = ?auto_18175 ?auto_18189 ) ) ( not ( = ?auto_18176 ?auto_18189 ) ) ( not ( = ?auto_18191 ?auto_18189 ) ) ( not ( = ?auto_18195 ?auto_18189 ) ) ( not ( = ?auto_18186 ?auto_18189 ) ) ( not ( = ?auto_18185 ?auto_18189 ) ) ( not ( = ?auto_18183 ?auto_18189 ) ) ( not ( = ?auto_18192 ?auto_18189 ) ) ( IS-CRATE ?auto_18192 ) ( not ( = ?auto_18175 ?auto_18180 ) ) ( not ( = ?auto_18176 ?auto_18180 ) ) ( not ( = ?auto_18191 ?auto_18180 ) ) ( not ( = ?auto_18195 ?auto_18180 ) ) ( not ( = ?auto_18186 ?auto_18180 ) ) ( not ( = ?auto_18185 ?auto_18180 ) ) ( not ( = ?auto_18183 ?auto_18180 ) ) ( not ( = ?auto_18192 ?auto_18180 ) ) ( not ( = ?auto_18189 ?auto_18180 ) ) ( not ( = ?auto_18187 ?auto_18181 ) ) ( not ( = ?auto_18190 ?auto_18187 ) ) ( not ( = ?auto_18196 ?auto_18187 ) ) ( not ( = ?auto_18179 ?auto_18187 ) ) ( HOIST-AT ?auto_18177 ?auto_18187 ) ( not ( = ?auto_18182 ?auto_18177 ) ) ( not ( = ?auto_18178 ?auto_18177 ) ) ( not ( = ?auto_18188 ?auto_18177 ) ) ( not ( = ?auto_18194 ?auto_18177 ) ) ( AVAILABLE ?auto_18177 ) ( SURFACE-AT ?auto_18192 ?auto_18187 ) ( ON ?auto_18192 ?auto_18184 ) ( CLEAR ?auto_18192 ) ( not ( = ?auto_18175 ?auto_18184 ) ) ( not ( = ?auto_18176 ?auto_18184 ) ) ( not ( = ?auto_18191 ?auto_18184 ) ) ( not ( = ?auto_18195 ?auto_18184 ) ) ( not ( = ?auto_18186 ?auto_18184 ) ) ( not ( = ?auto_18185 ?auto_18184 ) ) ( not ( = ?auto_18183 ?auto_18184 ) ) ( not ( = ?auto_18192 ?auto_18184 ) ) ( not ( = ?auto_18189 ?auto_18184 ) ) ( not ( = ?auto_18180 ?auto_18184 ) ) ( SURFACE-AT ?auto_18193 ?auto_18181 ) ( CLEAR ?auto_18193 ) ( IS-CRATE ?auto_18180 ) ( not ( = ?auto_18175 ?auto_18193 ) ) ( not ( = ?auto_18176 ?auto_18193 ) ) ( not ( = ?auto_18191 ?auto_18193 ) ) ( not ( = ?auto_18195 ?auto_18193 ) ) ( not ( = ?auto_18186 ?auto_18193 ) ) ( not ( = ?auto_18185 ?auto_18193 ) ) ( not ( = ?auto_18183 ?auto_18193 ) ) ( not ( = ?auto_18192 ?auto_18193 ) ) ( not ( = ?auto_18189 ?auto_18193 ) ) ( not ( = ?auto_18180 ?auto_18193 ) ) ( not ( = ?auto_18184 ?auto_18193 ) ) ( AVAILABLE ?auto_18182 ) ( IN ?auto_18180 ?auto_18197 ) ( TRUCK-AT ?auto_18197 ?auto_18198 ) ( not ( = ?auto_18198 ?auto_18181 ) ) ( not ( = ?auto_18190 ?auto_18198 ) ) ( not ( = ?auto_18196 ?auto_18198 ) ) ( not ( = ?auto_18179 ?auto_18198 ) ) ( not ( = ?auto_18187 ?auto_18198 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18197 ?auto_18198 ?auto_18181 )
      ( MAKE-ON ?auto_18175 ?auto_18176 )
      ( MAKE-ON-VERIFY ?auto_18175 ?auto_18176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18199 - SURFACE
      ?auto_18200 - SURFACE
    )
    :vars
    (
      ?auto_18204 - HOIST
      ?auto_18208 - PLACE
      ?auto_18214 - PLACE
      ?auto_18216 - HOIST
      ?auto_18215 - SURFACE
      ?auto_18201 - SURFACE
      ?auto_18206 - PLACE
      ?auto_18211 - HOIST
      ?auto_18210 - SURFACE
      ?auto_18219 - SURFACE
      ?auto_18213 - SURFACE
      ?auto_18222 - SURFACE
      ?auto_18221 - PLACE
      ?auto_18205 - HOIST
      ?auto_18212 - SURFACE
      ?auto_18203 - SURFACE
      ?auto_18209 - PLACE
      ?auto_18220 - HOIST
      ?auto_18217 - SURFACE
      ?auto_18202 - SURFACE
      ?auto_18207 - TRUCK
      ?auto_18218 - PLACE
      ?auto_18223 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18204 ?auto_18208 ) ( IS-CRATE ?auto_18199 ) ( not ( = ?auto_18199 ?auto_18200 ) ) ( not ( = ?auto_18214 ?auto_18208 ) ) ( HOIST-AT ?auto_18216 ?auto_18214 ) ( not ( = ?auto_18204 ?auto_18216 ) ) ( SURFACE-AT ?auto_18199 ?auto_18214 ) ( ON ?auto_18199 ?auto_18215 ) ( CLEAR ?auto_18199 ) ( not ( = ?auto_18199 ?auto_18215 ) ) ( not ( = ?auto_18200 ?auto_18215 ) ) ( IS-CRATE ?auto_18200 ) ( not ( = ?auto_18199 ?auto_18201 ) ) ( not ( = ?auto_18200 ?auto_18201 ) ) ( not ( = ?auto_18215 ?auto_18201 ) ) ( not ( = ?auto_18206 ?auto_18208 ) ) ( not ( = ?auto_18214 ?auto_18206 ) ) ( HOIST-AT ?auto_18211 ?auto_18206 ) ( not ( = ?auto_18204 ?auto_18211 ) ) ( not ( = ?auto_18216 ?auto_18211 ) ) ( AVAILABLE ?auto_18211 ) ( SURFACE-AT ?auto_18200 ?auto_18206 ) ( ON ?auto_18200 ?auto_18210 ) ( CLEAR ?auto_18200 ) ( not ( = ?auto_18199 ?auto_18210 ) ) ( not ( = ?auto_18200 ?auto_18210 ) ) ( not ( = ?auto_18215 ?auto_18210 ) ) ( not ( = ?auto_18201 ?auto_18210 ) ) ( IS-CRATE ?auto_18201 ) ( not ( = ?auto_18199 ?auto_18219 ) ) ( not ( = ?auto_18200 ?auto_18219 ) ) ( not ( = ?auto_18215 ?auto_18219 ) ) ( not ( = ?auto_18201 ?auto_18219 ) ) ( not ( = ?auto_18210 ?auto_18219 ) ) ( AVAILABLE ?auto_18216 ) ( SURFACE-AT ?auto_18201 ?auto_18214 ) ( ON ?auto_18201 ?auto_18213 ) ( CLEAR ?auto_18201 ) ( not ( = ?auto_18199 ?auto_18213 ) ) ( not ( = ?auto_18200 ?auto_18213 ) ) ( not ( = ?auto_18215 ?auto_18213 ) ) ( not ( = ?auto_18201 ?auto_18213 ) ) ( not ( = ?auto_18210 ?auto_18213 ) ) ( not ( = ?auto_18219 ?auto_18213 ) ) ( IS-CRATE ?auto_18219 ) ( not ( = ?auto_18199 ?auto_18222 ) ) ( not ( = ?auto_18200 ?auto_18222 ) ) ( not ( = ?auto_18215 ?auto_18222 ) ) ( not ( = ?auto_18201 ?auto_18222 ) ) ( not ( = ?auto_18210 ?auto_18222 ) ) ( not ( = ?auto_18219 ?auto_18222 ) ) ( not ( = ?auto_18213 ?auto_18222 ) ) ( not ( = ?auto_18221 ?auto_18208 ) ) ( not ( = ?auto_18214 ?auto_18221 ) ) ( not ( = ?auto_18206 ?auto_18221 ) ) ( HOIST-AT ?auto_18205 ?auto_18221 ) ( not ( = ?auto_18204 ?auto_18205 ) ) ( not ( = ?auto_18216 ?auto_18205 ) ) ( not ( = ?auto_18211 ?auto_18205 ) ) ( AVAILABLE ?auto_18205 ) ( SURFACE-AT ?auto_18219 ?auto_18221 ) ( ON ?auto_18219 ?auto_18212 ) ( CLEAR ?auto_18219 ) ( not ( = ?auto_18199 ?auto_18212 ) ) ( not ( = ?auto_18200 ?auto_18212 ) ) ( not ( = ?auto_18215 ?auto_18212 ) ) ( not ( = ?auto_18201 ?auto_18212 ) ) ( not ( = ?auto_18210 ?auto_18212 ) ) ( not ( = ?auto_18219 ?auto_18212 ) ) ( not ( = ?auto_18213 ?auto_18212 ) ) ( not ( = ?auto_18222 ?auto_18212 ) ) ( IS-CRATE ?auto_18222 ) ( not ( = ?auto_18199 ?auto_18203 ) ) ( not ( = ?auto_18200 ?auto_18203 ) ) ( not ( = ?auto_18215 ?auto_18203 ) ) ( not ( = ?auto_18201 ?auto_18203 ) ) ( not ( = ?auto_18210 ?auto_18203 ) ) ( not ( = ?auto_18219 ?auto_18203 ) ) ( not ( = ?auto_18213 ?auto_18203 ) ) ( not ( = ?auto_18222 ?auto_18203 ) ) ( not ( = ?auto_18212 ?auto_18203 ) ) ( not ( = ?auto_18209 ?auto_18208 ) ) ( not ( = ?auto_18214 ?auto_18209 ) ) ( not ( = ?auto_18206 ?auto_18209 ) ) ( not ( = ?auto_18221 ?auto_18209 ) ) ( HOIST-AT ?auto_18220 ?auto_18209 ) ( not ( = ?auto_18204 ?auto_18220 ) ) ( not ( = ?auto_18216 ?auto_18220 ) ) ( not ( = ?auto_18211 ?auto_18220 ) ) ( not ( = ?auto_18205 ?auto_18220 ) ) ( AVAILABLE ?auto_18220 ) ( SURFACE-AT ?auto_18222 ?auto_18209 ) ( ON ?auto_18222 ?auto_18217 ) ( CLEAR ?auto_18222 ) ( not ( = ?auto_18199 ?auto_18217 ) ) ( not ( = ?auto_18200 ?auto_18217 ) ) ( not ( = ?auto_18215 ?auto_18217 ) ) ( not ( = ?auto_18201 ?auto_18217 ) ) ( not ( = ?auto_18210 ?auto_18217 ) ) ( not ( = ?auto_18219 ?auto_18217 ) ) ( not ( = ?auto_18213 ?auto_18217 ) ) ( not ( = ?auto_18222 ?auto_18217 ) ) ( not ( = ?auto_18212 ?auto_18217 ) ) ( not ( = ?auto_18203 ?auto_18217 ) ) ( SURFACE-AT ?auto_18202 ?auto_18208 ) ( CLEAR ?auto_18202 ) ( IS-CRATE ?auto_18203 ) ( not ( = ?auto_18199 ?auto_18202 ) ) ( not ( = ?auto_18200 ?auto_18202 ) ) ( not ( = ?auto_18215 ?auto_18202 ) ) ( not ( = ?auto_18201 ?auto_18202 ) ) ( not ( = ?auto_18210 ?auto_18202 ) ) ( not ( = ?auto_18219 ?auto_18202 ) ) ( not ( = ?auto_18213 ?auto_18202 ) ) ( not ( = ?auto_18222 ?auto_18202 ) ) ( not ( = ?auto_18212 ?auto_18202 ) ) ( not ( = ?auto_18203 ?auto_18202 ) ) ( not ( = ?auto_18217 ?auto_18202 ) ) ( AVAILABLE ?auto_18204 ) ( TRUCK-AT ?auto_18207 ?auto_18218 ) ( not ( = ?auto_18218 ?auto_18208 ) ) ( not ( = ?auto_18214 ?auto_18218 ) ) ( not ( = ?auto_18206 ?auto_18218 ) ) ( not ( = ?auto_18221 ?auto_18218 ) ) ( not ( = ?auto_18209 ?auto_18218 ) ) ( HOIST-AT ?auto_18223 ?auto_18218 ) ( LIFTING ?auto_18223 ?auto_18203 ) ( not ( = ?auto_18204 ?auto_18223 ) ) ( not ( = ?auto_18216 ?auto_18223 ) ) ( not ( = ?auto_18211 ?auto_18223 ) ) ( not ( = ?auto_18205 ?auto_18223 ) ) ( not ( = ?auto_18220 ?auto_18223 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18223 ?auto_18203 ?auto_18207 ?auto_18218 )
      ( MAKE-ON ?auto_18199 ?auto_18200 )
      ( MAKE-ON-VERIFY ?auto_18199 ?auto_18200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18224 - SURFACE
      ?auto_18225 - SURFACE
    )
    :vars
    (
      ?auto_18246 - HOIST
      ?auto_18244 - PLACE
      ?auto_18226 - PLACE
      ?auto_18241 - HOIST
      ?auto_18240 - SURFACE
      ?auto_18239 - SURFACE
      ?auto_18243 - PLACE
      ?auto_18234 - HOIST
      ?auto_18228 - SURFACE
      ?auto_18231 - SURFACE
      ?auto_18236 - SURFACE
      ?auto_18227 - SURFACE
      ?auto_18230 - PLACE
      ?auto_18248 - HOIST
      ?auto_18235 - SURFACE
      ?auto_18245 - SURFACE
      ?auto_18242 - PLACE
      ?auto_18237 - HOIST
      ?auto_18232 - SURFACE
      ?auto_18247 - SURFACE
      ?auto_18229 - TRUCK
      ?auto_18233 - PLACE
      ?auto_18238 - HOIST
      ?auto_18249 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18246 ?auto_18244 ) ( IS-CRATE ?auto_18224 ) ( not ( = ?auto_18224 ?auto_18225 ) ) ( not ( = ?auto_18226 ?auto_18244 ) ) ( HOIST-AT ?auto_18241 ?auto_18226 ) ( not ( = ?auto_18246 ?auto_18241 ) ) ( SURFACE-AT ?auto_18224 ?auto_18226 ) ( ON ?auto_18224 ?auto_18240 ) ( CLEAR ?auto_18224 ) ( not ( = ?auto_18224 ?auto_18240 ) ) ( not ( = ?auto_18225 ?auto_18240 ) ) ( IS-CRATE ?auto_18225 ) ( not ( = ?auto_18224 ?auto_18239 ) ) ( not ( = ?auto_18225 ?auto_18239 ) ) ( not ( = ?auto_18240 ?auto_18239 ) ) ( not ( = ?auto_18243 ?auto_18244 ) ) ( not ( = ?auto_18226 ?auto_18243 ) ) ( HOIST-AT ?auto_18234 ?auto_18243 ) ( not ( = ?auto_18246 ?auto_18234 ) ) ( not ( = ?auto_18241 ?auto_18234 ) ) ( AVAILABLE ?auto_18234 ) ( SURFACE-AT ?auto_18225 ?auto_18243 ) ( ON ?auto_18225 ?auto_18228 ) ( CLEAR ?auto_18225 ) ( not ( = ?auto_18224 ?auto_18228 ) ) ( not ( = ?auto_18225 ?auto_18228 ) ) ( not ( = ?auto_18240 ?auto_18228 ) ) ( not ( = ?auto_18239 ?auto_18228 ) ) ( IS-CRATE ?auto_18239 ) ( not ( = ?auto_18224 ?auto_18231 ) ) ( not ( = ?auto_18225 ?auto_18231 ) ) ( not ( = ?auto_18240 ?auto_18231 ) ) ( not ( = ?auto_18239 ?auto_18231 ) ) ( not ( = ?auto_18228 ?auto_18231 ) ) ( AVAILABLE ?auto_18241 ) ( SURFACE-AT ?auto_18239 ?auto_18226 ) ( ON ?auto_18239 ?auto_18236 ) ( CLEAR ?auto_18239 ) ( not ( = ?auto_18224 ?auto_18236 ) ) ( not ( = ?auto_18225 ?auto_18236 ) ) ( not ( = ?auto_18240 ?auto_18236 ) ) ( not ( = ?auto_18239 ?auto_18236 ) ) ( not ( = ?auto_18228 ?auto_18236 ) ) ( not ( = ?auto_18231 ?auto_18236 ) ) ( IS-CRATE ?auto_18231 ) ( not ( = ?auto_18224 ?auto_18227 ) ) ( not ( = ?auto_18225 ?auto_18227 ) ) ( not ( = ?auto_18240 ?auto_18227 ) ) ( not ( = ?auto_18239 ?auto_18227 ) ) ( not ( = ?auto_18228 ?auto_18227 ) ) ( not ( = ?auto_18231 ?auto_18227 ) ) ( not ( = ?auto_18236 ?auto_18227 ) ) ( not ( = ?auto_18230 ?auto_18244 ) ) ( not ( = ?auto_18226 ?auto_18230 ) ) ( not ( = ?auto_18243 ?auto_18230 ) ) ( HOIST-AT ?auto_18248 ?auto_18230 ) ( not ( = ?auto_18246 ?auto_18248 ) ) ( not ( = ?auto_18241 ?auto_18248 ) ) ( not ( = ?auto_18234 ?auto_18248 ) ) ( AVAILABLE ?auto_18248 ) ( SURFACE-AT ?auto_18231 ?auto_18230 ) ( ON ?auto_18231 ?auto_18235 ) ( CLEAR ?auto_18231 ) ( not ( = ?auto_18224 ?auto_18235 ) ) ( not ( = ?auto_18225 ?auto_18235 ) ) ( not ( = ?auto_18240 ?auto_18235 ) ) ( not ( = ?auto_18239 ?auto_18235 ) ) ( not ( = ?auto_18228 ?auto_18235 ) ) ( not ( = ?auto_18231 ?auto_18235 ) ) ( not ( = ?auto_18236 ?auto_18235 ) ) ( not ( = ?auto_18227 ?auto_18235 ) ) ( IS-CRATE ?auto_18227 ) ( not ( = ?auto_18224 ?auto_18245 ) ) ( not ( = ?auto_18225 ?auto_18245 ) ) ( not ( = ?auto_18240 ?auto_18245 ) ) ( not ( = ?auto_18239 ?auto_18245 ) ) ( not ( = ?auto_18228 ?auto_18245 ) ) ( not ( = ?auto_18231 ?auto_18245 ) ) ( not ( = ?auto_18236 ?auto_18245 ) ) ( not ( = ?auto_18227 ?auto_18245 ) ) ( not ( = ?auto_18235 ?auto_18245 ) ) ( not ( = ?auto_18242 ?auto_18244 ) ) ( not ( = ?auto_18226 ?auto_18242 ) ) ( not ( = ?auto_18243 ?auto_18242 ) ) ( not ( = ?auto_18230 ?auto_18242 ) ) ( HOIST-AT ?auto_18237 ?auto_18242 ) ( not ( = ?auto_18246 ?auto_18237 ) ) ( not ( = ?auto_18241 ?auto_18237 ) ) ( not ( = ?auto_18234 ?auto_18237 ) ) ( not ( = ?auto_18248 ?auto_18237 ) ) ( AVAILABLE ?auto_18237 ) ( SURFACE-AT ?auto_18227 ?auto_18242 ) ( ON ?auto_18227 ?auto_18232 ) ( CLEAR ?auto_18227 ) ( not ( = ?auto_18224 ?auto_18232 ) ) ( not ( = ?auto_18225 ?auto_18232 ) ) ( not ( = ?auto_18240 ?auto_18232 ) ) ( not ( = ?auto_18239 ?auto_18232 ) ) ( not ( = ?auto_18228 ?auto_18232 ) ) ( not ( = ?auto_18231 ?auto_18232 ) ) ( not ( = ?auto_18236 ?auto_18232 ) ) ( not ( = ?auto_18227 ?auto_18232 ) ) ( not ( = ?auto_18235 ?auto_18232 ) ) ( not ( = ?auto_18245 ?auto_18232 ) ) ( SURFACE-AT ?auto_18247 ?auto_18244 ) ( CLEAR ?auto_18247 ) ( IS-CRATE ?auto_18245 ) ( not ( = ?auto_18224 ?auto_18247 ) ) ( not ( = ?auto_18225 ?auto_18247 ) ) ( not ( = ?auto_18240 ?auto_18247 ) ) ( not ( = ?auto_18239 ?auto_18247 ) ) ( not ( = ?auto_18228 ?auto_18247 ) ) ( not ( = ?auto_18231 ?auto_18247 ) ) ( not ( = ?auto_18236 ?auto_18247 ) ) ( not ( = ?auto_18227 ?auto_18247 ) ) ( not ( = ?auto_18235 ?auto_18247 ) ) ( not ( = ?auto_18245 ?auto_18247 ) ) ( not ( = ?auto_18232 ?auto_18247 ) ) ( AVAILABLE ?auto_18246 ) ( TRUCK-AT ?auto_18229 ?auto_18233 ) ( not ( = ?auto_18233 ?auto_18244 ) ) ( not ( = ?auto_18226 ?auto_18233 ) ) ( not ( = ?auto_18243 ?auto_18233 ) ) ( not ( = ?auto_18230 ?auto_18233 ) ) ( not ( = ?auto_18242 ?auto_18233 ) ) ( HOIST-AT ?auto_18238 ?auto_18233 ) ( not ( = ?auto_18246 ?auto_18238 ) ) ( not ( = ?auto_18241 ?auto_18238 ) ) ( not ( = ?auto_18234 ?auto_18238 ) ) ( not ( = ?auto_18248 ?auto_18238 ) ) ( not ( = ?auto_18237 ?auto_18238 ) ) ( AVAILABLE ?auto_18238 ) ( SURFACE-AT ?auto_18245 ?auto_18233 ) ( ON ?auto_18245 ?auto_18249 ) ( CLEAR ?auto_18245 ) ( not ( = ?auto_18224 ?auto_18249 ) ) ( not ( = ?auto_18225 ?auto_18249 ) ) ( not ( = ?auto_18240 ?auto_18249 ) ) ( not ( = ?auto_18239 ?auto_18249 ) ) ( not ( = ?auto_18228 ?auto_18249 ) ) ( not ( = ?auto_18231 ?auto_18249 ) ) ( not ( = ?auto_18236 ?auto_18249 ) ) ( not ( = ?auto_18227 ?auto_18249 ) ) ( not ( = ?auto_18235 ?auto_18249 ) ) ( not ( = ?auto_18245 ?auto_18249 ) ) ( not ( = ?auto_18232 ?auto_18249 ) ) ( not ( = ?auto_18247 ?auto_18249 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18238 ?auto_18245 ?auto_18249 ?auto_18233 )
      ( MAKE-ON ?auto_18224 ?auto_18225 )
      ( MAKE-ON-VERIFY ?auto_18224 ?auto_18225 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18250 - SURFACE
      ?auto_18251 - SURFACE
    )
    :vars
    (
      ?auto_18264 - HOIST
      ?auto_18262 - PLACE
      ?auto_18254 - PLACE
      ?auto_18261 - HOIST
      ?auto_18275 - SURFACE
      ?auto_18269 - SURFACE
      ?auto_18258 - PLACE
      ?auto_18256 - HOIST
      ?auto_18265 - SURFACE
      ?auto_18255 - SURFACE
      ?auto_18273 - SURFACE
      ?auto_18257 - SURFACE
      ?auto_18266 - PLACE
      ?auto_18260 - HOIST
      ?auto_18253 - SURFACE
      ?auto_18263 - SURFACE
      ?auto_18252 - PLACE
      ?auto_18274 - HOIST
      ?auto_18271 - SURFACE
      ?auto_18259 - SURFACE
      ?auto_18270 - PLACE
      ?auto_18268 - HOIST
      ?auto_18272 - SURFACE
      ?auto_18267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18264 ?auto_18262 ) ( IS-CRATE ?auto_18250 ) ( not ( = ?auto_18250 ?auto_18251 ) ) ( not ( = ?auto_18254 ?auto_18262 ) ) ( HOIST-AT ?auto_18261 ?auto_18254 ) ( not ( = ?auto_18264 ?auto_18261 ) ) ( SURFACE-AT ?auto_18250 ?auto_18254 ) ( ON ?auto_18250 ?auto_18275 ) ( CLEAR ?auto_18250 ) ( not ( = ?auto_18250 ?auto_18275 ) ) ( not ( = ?auto_18251 ?auto_18275 ) ) ( IS-CRATE ?auto_18251 ) ( not ( = ?auto_18250 ?auto_18269 ) ) ( not ( = ?auto_18251 ?auto_18269 ) ) ( not ( = ?auto_18275 ?auto_18269 ) ) ( not ( = ?auto_18258 ?auto_18262 ) ) ( not ( = ?auto_18254 ?auto_18258 ) ) ( HOIST-AT ?auto_18256 ?auto_18258 ) ( not ( = ?auto_18264 ?auto_18256 ) ) ( not ( = ?auto_18261 ?auto_18256 ) ) ( AVAILABLE ?auto_18256 ) ( SURFACE-AT ?auto_18251 ?auto_18258 ) ( ON ?auto_18251 ?auto_18265 ) ( CLEAR ?auto_18251 ) ( not ( = ?auto_18250 ?auto_18265 ) ) ( not ( = ?auto_18251 ?auto_18265 ) ) ( not ( = ?auto_18275 ?auto_18265 ) ) ( not ( = ?auto_18269 ?auto_18265 ) ) ( IS-CRATE ?auto_18269 ) ( not ( = ?auto_18250 ?auto_18255 ) ) ( not ( = ?auto_18251 ?auto_18255 ) ) ( not ( = ?auto_18275 ?auto_18255 ) ) ( not ( = ?auto_18269 ?auto_18255 ) ) ( not ( = ?auto_18265 ?auto_18255 ) ) ( AVAILABLE ?auto_18261 ) ( SURFACE-AT ?auto_18269 ?auto_18254 ) ( ON ?auto_18269 ?auto_18273 ) ( CLEAR ?auto_18269 ) ( not ( = ?auto_18250 ?auto_18273 ) ) ( not ( = ?auto_18251 ?auto_18273 ) ) ( not ( = ?auto_18275 ?auto_18273 ) ) ( not ( = ?auto_18269 ?auto_18273 ) ) ( not ( = ?auto_18265 ?auto_18273 ) ) ( not ( = ?auto_18255 ?auto_18273 ) ) ( IS-CRATE ?auto_18255 ) ( not ( = ?auto_18250 ?auto_18257 ) ) ( not ( = ?auto_18251 ?auto_18257 ) ) ( not ( = ?auto_18275 ?auto_18257 ) ) ( not ( = ?auto_18269 ?auto_18257 ) ) ( not ( = ?auto_18265 ?auto_18257 ) ) ( not ( = ?auto_18255 ?auto_18257 ) ) ( not ( = ?auto_18273 ?auto_18257 ) ) ( not ( = ?auto_18266 ?auto_18262 ) ) ( not ( = ?auto_18254 ?auto_18266 ) ) ( not ( = ?auto_18258 ?auto_18266 ) ) ( HOIST-AT ?auto_18260 ?auto_18266 ) ( not ( = ?auto_18264 ?auto_18260 ) ) ( not ( = ?auto_18261 ?auto_18260 ) ) ( not ( = ?auto_18256 ?auto_18260 ) ) ( AVAILABLE ?auto_18260 ) ( SURFACE-AT ?auto_18255 ?auto_18266 ) ( ON ?auto_18255 ?auto_18253 ) ( CLEAR ?auto_18255 ) ( not ( = ?auto_18250 ?auto_18253 ) ) ( not ( = ?auto_18251 ?auto_18253 ) ) ( not ( = ?auto_18275 ?auto_18253 ) ) ( not ( = ?auto_18269 ?auto_18253 ) ) ( not ( = ?auto_18265 ?auto_18253 ) ) ( not ( = ?auto_18255 ?auto_18253 ) ) ( not ( = ?auto_18273 ?auto_18253 ) ) ( not ( = ?auto_18257 ?auto_18253 ) ) ( IS-CRATE ?auto_18257 ) ( not ( = ?auto_18250 ?auto_18263 ) ) ( not ( = ?auto_18251 ?auto_18263 ) ) ( not ( = ?auto_18275 ?auto_18263 ) ) ( not ( = ?auto_18269 ?auto_18263 ) ) ( not ( = ?auto_18265 ?auto_18263 ) ) ( not ( = ?auto_18255 ?auto_18263 ) ) ( not ( = ?auto_18273 ?auto_18263 ) ) ( not ( = ?auto_18257 ?auto_18263 ) ) ( not ( = ?auto_18253 ?auto_18263 ) ) ( not ( = ?auto_18252 ?auto_18262 ) ) ( not ( = ?auto_18254 ?auto_18252 ) ) ( not ( = ?auto_18258 ?auto_18252 ) ) ( not ( = ?auto_18266 ?auto_18252 ) ) ( HOIST-AT ?auto_18274 ?auto_18252 ) ( not ( = ?auto_18264 ?auto_18274 ) ) ( not ( = ?auto_18261 ?auto_18274 ) ) ( not ( = ?auto_18256 ?auto_18274 ) ) ( not ( = ?auto_18260 ?auto_18274 ) ) ( AVAILABLE ?auto_18274 ) ( SURFACE-AT ?auto_18257 ?auto_18252 ) ( ON ?auto_18257 ?auto_18271 ) ( CLEAR ?auto_18257 ) ( not ( = ?auto_18250 ?auto_18271 ) ) ( not ( = ?auto_18251 ?auto_18271 ) ) ( not ( = ?auto_18275 ?auto_18271 ) ) ( not ( = ?auto_18269 ?auto_18271 ) ) ( not ( = ?auto_18265 ?auto_18271 ) ) ( not ( = ?auto_18255 ?auto_18271 ) ) ( not ( = ?auto_18273 ?auto_18271 ) ) ( not ( = ?auto_18257 ?auto_18271 ) ) ( not ( = ?auto_18253 ?auto_18271 ) ) ( not ( = ?auto_18263 ?auto_18271 ) ) ( SURFACE-AT ?auto_18259 ?auto_18262 ) ( CLEAR ?auto_18259 ) ( IS-CRATE ?auto_18263 ) ( not ( = ?auto_18250 ?auto_18259 ) ) ( not ( = ?auto_18251 ?auto_18259 ) ) ( not ( = ?auto_18275 ?auto_18259 ) ) ( not ( = ?auto_18269 ?auto_18259 ) ) ( not ( = ?auto_18265 ?auto_18259 ) ) ( not ( = ?auto_18255 ?auto_18259 ) ) ( not ( = ?auto_18273 ?auto_18259 ) ) ( not ( = ?auto_18257 ?auto_18259 ) ) ( not ( = ?auto_18253 ?auto_18259 ) ) ( not ( = ?auto_18263 ?auto_18259 ) ) ( not ( = ?auto_18271 ?auto_18259 ) ) ( AVAILABLE ?auto_18264 ) ( not ( = ?auto_18270 ?auto_18262 ) ) ( not ( = ?auto_18254 ?auto_18270 ) ) ( not ( = ?auto_18258 ?auto_18270 ) ) ( not ( = ?auto_18266 ?auto_18270 ) ) ( not ( = ?auto_18252 ?auto_18270 ) ) ( HOIST-AT ?auto_18268 ?auto_18270 ) ( not ( = ?auto_18264 ?auto_18268 ) ) ( not ( = ?auto_18261 ?auto_18268 ) ) ( not ( = ?auto_18256 ?auto_18268 ) ) ( not ( = ?auto_18260 ?auto_18268 ) ) ( not ( = ?auto_18274 ?auto_18268 ) ) ( AVAILABLE ?auto_18268 ) ( SURFACE-AT ?auto_18263 ?auto_18270 ) ( ON ?auto_18263 ?auto_18272 ) ( CLEAR ?auto_18263 ) ( not ( = ?auto_18250 ?auto_18272 ) ) ( not ( = ?auto_18251 ?auto_18272 ) ) ( not ( = ?auto_18275 ?auto_18272 ) ) ( not ( = ?auto_18269 ?auto_18272 ) ) ( not ( = ?auto_18265 ?auto_18272 ) ) ( not ( = ?auto_18255 ?auto_18272 ) ) ( not ( = ?auto_18273 ?auto_18272 ) ) ( not ( = ?auto_18257 ?auto_18272 ) ) ( not ( = ?auto_18253 ?auto_18272 ) ) ( not ( = ?auto_18263 ?auto_18272 ) ) ( not ( = ?auto_18271 ?auto_18272 ) ) ( not ( = ?auto_18259 ?auto_18272 ) ) ( TRUCK-AT ?auto_18267 ?auto_18262 ) )
    :subtasks
    ( ( !DRIVE ?auto_18267 ?auto_18262 ?auto_18270 )
      ( MAKE-ON ?auto_18250 ?auto_18251 )
      ( MAKE-ON-VERIFY ?auto_18250 ?auto_18251 ) )
  )

)

