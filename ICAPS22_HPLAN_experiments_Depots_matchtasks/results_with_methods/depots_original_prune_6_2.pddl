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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38670 - SURFACE
      ?auto_38671 - SURFACE
    )
    :vars
    (
      ?auto_38672 - HOIST
      ?auto_38673 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38672 ?auto_38673 ) ( SURFACE-AT ?auto_38670 ?auto_38673 ) ( CLEAR ?auto_38670 ) ( LIFTING ?auto_38672 ?auto_38671 ) ( IS-CRATE ?auto_38671 ) ( not ( = ?auto_38670 ?auto_38671 ) ) )
    :subtasks
    ( ( !DROP ?auto_38672 ?auto_38671 ?auto_38670 ?auto_38673 )
      ( MAKE-1CRATE-VERIFY ?auto_38670 ?auto_38671 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38674 - SURFACE
      ?auto_38675 - SURFACE
    )
    :vars
    (
      ?auto_38677 - HOIST
      ?auto_38676 - PLACE
      ?auto_38678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38677 ?auto_38676 ) ( SURFACE-AT ?auto_38674 ?auto_38676 ) ( CLEAR ?auto_38674 ) ( IS-CRATE ?auto_38675 ) ( not ( = ?auto_38674 ?auto_38675 ) ) ( TRUCK-AT ?auto_38678 ?auto_38676 ) ( AVAILABLE ?auto_38677 ) ( IN ?auto_38675 ?auto_38678 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38677 ?auto_38675 ?auto_38678 ?auto_38676 )
      ( MAKE-1CRATE ?auto_38674 ?auto_38675 )
      ( MAKE-1CRATE-VERIFY ?auto_38674 ?auto_38675 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38679 - SURFACE
      ?auto_38680 - SURFACE
    )
    :vars
    (
      ?auto_38682 - HOIST
      ?auto_38681 - PLACE
      ?auto_38683 - TRUCK
      ?auto_38684 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38682 ?auto_38681 ) ( SURFACE-AT ?auto_38679 ?auto_38681 ) ( CLEAR ?auto_38679 ) ( IS-CRATE ?auto_38680 ) ( not ( = ?auto_38679 ?auto_38680 ) ) ( AVAILABLE ?auto_38682 ) ( IN ?auto_38680 ?auto_38683 ) ( TRUCK-AT ?auto_38683 ?auto_38684 ) ( not ( = ?auto_38684 ?auto_38681 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38683 ?auto_38684 ?auto_38681 )
      ( MAKE-1CRATE ?auto_38679 ?auto_38680 )
      ( MAKE-1CRATE-VERIFY ?auto_38679 ?auto_38680 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38685 - SURFACE
      ?auto_38686 - SURFACE
    )
    :vars
    (
      ?auto_38687 - HOIST
      ?auto_38688 - PLACE
      ?auto_38690 - TRUCK
      ?auto_38689 - PLACE
      ?auto_38691 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38687 ?auto_38688 ) ( SURFACE-AT ?auto_38685 ?auto_38688 ) ( CLEAR ?auto_38685 ) ( IS-CRATE ?auto_38686 ) ( not ( = ?auto_38685 ?auto_38686 ) ) ( AVAILABLE ?auto_38687 ) ( TRUCK-AT ?auto_38690 ?auto_38689 ) ( not ( = ?auto_38689 ?auto_38688 ) ) ( HOIST-AT ?auto_38691 ?auto_38689 ) ( LIFTING ?auto_38691 ?auto_38686 ) ( not ( = ?auto_38687 ?auto_38691 ) ) )
    :subtasks
    ( ( !LOAD ?auto_38691 ?auto_38686 ?auto_38690 ?auto_38689 )
      ( MAKE-1CRATE ?auto_38685 ?auto_38686 )
      ( MAKE-1CRATE-VERIFY ?auto_38685 ?auto_38686 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38692 - SURFACE
      ?auto_38693 - SURFACE
    )
    :vars
    (
      ?auto_38696 - HOIST
      ?auto_38697 - PLACE
      ?auto_38695 - TRUCK
      ?auto_38694 - PLACE
      ?auto_38698 - HOIST
      ?auto_38699 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38696 ?auto_38697 ) ( SURFACE-AT ?auto_38692 ?auto_38697 ) ( CLEAR ?auto_38692 ) ( IS-CRATE ?auto_38693 ) ( not ( = ?auto_38692 ?auto_38693 ) ) ( AVAILABLE ?auto_38696 ) ( TRUCK-AT ?auto_38695 ?auto_38694 ) ( not ( = ?auto_38694 ?auto_38697 ) ) ( HOIST-AT ?auto_38698 ?auto_38694 ) ( not ( = ?auto_38696 ?auto_38698 ) ) ( AVAILABLE ?auto_38698 ) ( SURFACE-AT ?auto_38693 ?auto_38694 ) ( ON ?auto_38693 ?auto_38699 ) ( CLEAR ?auto_38693 ) ( not ( = ?auto_38692 ?auto_38699 ) ) ( not ( = ?auto_38693 ?auto_38699 ) ) )
    :subtasks
    ( ( !LIFT ?auto_38698 ?auto_38693 ?auto_38699 ?auto_38694 )
      ( MAKE-1CRATE ?auto_38692 ?auto_38693 )
      ( MAKE-1CRATE-VERIFY ?auto_38692 ?auto_38693 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38700 - SURFACE
      ?auto_38701 - SURFACE
    )
    :vars
    (
      ?auto_38707 - HOIST
      ?auto_38706 - PLACE
      ?auto_38705 - PLACE
      ?auto_38703 - HOIST
      ?auto_38702 - SURFACE
      ?auto_38704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38707 ?auto_38706 ) ( SURFACE-AT ?auto_38700 ?auto_38706 ) ( CLEAR ?auto_38700 ) ( IS-CRATE ?auto_38701 ) ( not ( = ?auto_38700 ?auto_38701 ) ) ( AVAILABLE ?auto_38707 ) ( not ( = ?auto_38705 ?auto_38706 ) ) ( HOIST-AT ?auto_38703 ?auto_38705 ) ( not ( = ?auto_38707 ?auto_38703 ) ) ( AVAILABLE ?auto_38703 ) ( SURFACE-AT ?auto_38701 ?auto_38705 ) ( ON ?auto_38701 ?auto_38702 ) ( CLEAR ?auto_38701 ) ( not ( = ?auto_38700 ?auto_38702 ) ) ( not ( = ?auto_38701 ?auto_38702 ) ) ( TRUCK-AT ?auto_38704 ?auto_38706 ) )
    :subtasks
    ( ( !DRIVE ?auto_38704 ?auto_38706 ?auto_38705 )
      ( MAKE-1CRATE ?auto_38700 ?auto_38701 )
      ( MAKE-1CRATE-VERIFY ?auto_38700 ?auto_38701 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38717 - SURFACE
      ?auto_38718 - SURFACE
      ?auto_38719 - SURFACE
    )
    :vars
    (
      ?auto_38720 - HOIST
      ?auto_38721 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38720 ?auto_38721 ) ( SURFACE-AT ?auto_38718 ?auto_38721 ) ( CLEAR ?auto_38718 ) ( LIFTING ?auto_38720 ?auto_38719 ) ( IS-CRATE ?auto_38719 ) ( not ( = ?auto_38718 ?auto_38719 ) ) ( ON ?auto_38718 ?auto_38717 ) ( not ( = ?auto_38717 ?auto_38718 ) ) ( not ( = ?auto_38717 ?auto_38719 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38718 ?auto_38719 )
      ( MAKE-2CRATE-VERIFY ?auto_38717 ?auto_38718 ?auto_38719 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38727 - SURFACE
      ?auto_38728 - SURFACE
      ?auto_38729 - SURFACE
    )
    :vars
    (
      ?auto_38732 - HOIST
      ?auto_38730 - PLACE
      ?auto_38731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38732 ?auto_38730 ) ( SURFACE-AT ?auto_38728 ?auto_38730 ) ( CLEAR ?auto_38728 ) ( IS-CRATE ?auto_38729 ) ( not ( = ?auto_38728 ?auto_38729 ) ) ( TRUCK-AT ?auto_38731 ?auto_38730 ) ( AVAILABLE ?auto_38732 ) ( IN ?auto_38729 ?auto_38731 ) ( ON ?auto_38728 ?auto_38727 ) ( not ( = ?auto_38727 ?auto_38728 ) ) ( not ( = ?auto_38727 ?auto_38729 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38728 ?auto_38729 )
      ( MAKE-2CRATE-VERIFY ?auto_38727 ?auto_38728 ?auto_38729 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38733 - SURFACE
      ?auto_38734 - SURFACE
    )
    :vars
    (
      ?auto_38738 - HOIST
      ?auto_38735 - PLACE
      ?auto_38737 - TRUCK
      ?auto_38736 - SURFACE
      ?auto_38739 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38738 ?auto_38735 ) ( SURFACE-AT ?auto_38733 ?auto_38735 ) ( CLEAR ?auto_38733 ) ( IS-CRATE ?auto_38734 ) ( not ( = ?auto_38733 ?auto_38734 ) ) ( AVAILABLE ?auto_38738 ) ( IN ?auto_38734 ?auto_38737 ) ( ON ?auto_38733 ?auto_38736 ) ( not ( = ?auto_38736 ?auto_38733 ) ) ( not ( = ?auto_38736 ?auto_38734 ) ) ( TRUCK-AT ?auto_38737 ?auto_38739 ) ( not ( = ?auto_38739 ?auto_38735 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38737 ?auto_38739 ?auto_38735 )
      ( MAKE-2CRATE ?auto_38736 ?auto_38733 ?auto_38734 )
      ( MAKE-1CRATE-VERIFY ?auto_38733 ?auto_38734 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38740 - SURFACE
      ?auto_38741 - SURFACE
      ?auto_38742 - SURFACE
    )
    :vars
    (
      ?auto_38745 - HOIST
      ?auto_38743 - PLACE
      ?auto_38746 - TRUCK
      ?auto_38744 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38745 ?auto_38743 ) ( SURFACE-AT ?auto_38741 ?auto_38743 ) ( CLEAR ?auto_38741 ) ( IS-CRATE ?auto_38742 ) ( not ( = ?auto_38741 ?auto_38742 ) ) ( AVAILABLE ?auto_38745 ) ( IN ?auto_38742 ?auto_38746 ) ( ON ?auto_38741 ?auto_38740 ) ( not ( = ?auto_38740 ?auto_38741 ) ) ( not ( = ?auto_38740 ?auto_38742 ) ) ( TRUCK-AT ?auto_38746 ?auto_38744 ) ( not ( = ?auto_38744 ?auto_38743 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38741 ?auto_38742 )
      ( MAKE-2CRATE-VERIFY ?auto_38740 ?auto_38741 ?auto_38742 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38747 - SURFACE
      ?auto_38748 - SURFACE
    )
    :vars
    (
      ?auto_38750 - HOIST
      ?auto_38753 - PLACE
      ?auto_38752 - SURFACE
      ?auto_38751 - TRUCK
      ?auto_38749 - PLACE
      ?auto_38754 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38750 ?auto_38753 ) ( SURFACE-AT ?auto_38747 ?auto_38753 ) ( CLEAR ?auto_38747 ) ( IS-CRATE ?auto_38748 ) ( not ( = ?auto_38747 ?auto_38748 ) ) ( AVAILABLE ?auto_38750 ) ( ON ?auto_38747 ?auto_38752 ) ( not ( = ?auto_38752 ?auto_38747 ) ) ( not ( = ?auto_38752 ?auto_38748 ) ) ( TRUCK-AT ?auto_38751 ?auto_38749 ) ( not ( = ?auto_38749 ?auto_38753 ) ) ( HOIST-AT ?auto_38754 ?auto_38749 ) ( LIFTING ?auto_38754 ?auto_38748 ) ( not ( = ?auto_38750 ?auto_38754 ) ) )
    :subtasks
    ( ( !LOAD ?auto_38754 ?auto_38748 ?auto_38751 ?auto_38749 )
      ( MAKE-2CRATE ?auto_38752 ?auto_38747 ?auto_38748 )
      ( MAKE-1CRATE-VERIFY ?auto_38747 ?auto_38748 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38755 - SURFACE
      ?auto_38756 - SURFACE
      ?auto_38757 - SURFACE
    )
    :vars
    (
      ?auto_38760 - HOIST
      ?auto_38758 - PLACE
      ?auto_38762 - TRUCK
      ?auto_38761 - PLACE
      ?auto_38759 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38760 ?auto_38758 ) ( SURFACE-AT ?auto_38756 ?auto_38758 ) ( CLEAR ?auto_38756 ) ( IS-CRATE ?auto_38757 ) ( not ( = ?auto_38756 ?auto_38757 ) ) ( AVAILABLE ?auto_38760 ) ( ON ?auto_38756 ?auto_38755 ) ( not ( = ?auto_38755 ?auto_38756 ) ) ( not ( = ?auto_38755 ?auto_38757 ) ) ( TRUCK-AT ?auto_38762 ?auto_38761 ) ( not ( = ?auto_38761 ?auto_38758 ) ) ( HOIST-AT ?auto_38759 ?auto_38761 ) ( LIFTING ?auto_38759 ?auto_38757 ) ( not ( = ?auto_38760 ?auto_38759 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38756 ?auto_38757 )
      ( MAKE-2CRATE-VERIFY ?auto_38755 ?auto_38756 ?auto_38757 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38763 - SURFACE
      ?auto_38764 - SURFACE
    )
    :vars
    (
      ?auto_38766 - HOIST
      ?auto_38768 - PLACE
      ?auto_38765 - SURFACE
      ?auto_38770 - TRUCK
      ?auto_38769 - PLACE
      ?auto_38767 - HOIST
      ?auto_38771 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38766 ?auto_38768 ) ( SURFACE-AT ?auto_38763 ?auto_38768 ) ( CLEAR ?auto_38763 ) ( IS-CRATE ?auto_38764 ) ( not ( = ?auto_38763 ?auto_38764 ) ) ( AVAILABLE ?auto_38766 ) ( ON ?auto_38763 ?auto_38765 ) ( not ( = ?auto_38765 ?auto_38763 ) ) ( not ( = ?auto_38765 ?auto_38764 ) ) ( TRUCK-AT ?auto_38770 ?auto_38769 ) ( not ( = ?auto_38769 ?auto_38768 ) ) ( HOIST-AT ?auto_38767 ?auto_38769 ) ( not ( = ?auto_38766 ?auto_38767 ) ) ( AVAILABLE ?auto_38767 ) ( SURFACE-AT ?auto_38764 ?auto_38769 ) ( ON ?auto_38764 ?auto_38771 ) ( CLEAR ?auto_38764 ) ( not ( = ?auto_38763 ?auto_38771 ) ) ( not ( = ?auto_38764 ?auto_38771 ) ) ( not ( = ?auto_38765 ?auto_38771 ) ) )
    :subtasks
    ( ( !LIFT ?auto_38767 ?auto_38764 ?auto_38771 ?auto_38769 )
      ( MAKE-2CRATE ?auto_38765 ?auto_38763 ?auto_38764 )
      ( MAKE-1CRATE-VERIFY ?auto_38763 ?auto_38764 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38772 - SURFACE
      ?auto_38773 - SURFACE
      ?auto_38774 - SURFACE
    )
    :vars
    (
      ?auto_38777 - HOIST
      ?auto_38778 - PLACE
      ?auto_38776 - TRUCK
      ?auto_38780 - PLACE
      ?auto_38775 - HOIST
      ?auto_38779 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38777 ?auto_38778 ) ( SURFACE-AT ?auto_38773 ?auto_38778 ) ( CLEAR ?auto_38773 ) ( IS-CRATE ?auto_38774 ) ( not ( = ?auto_38773 ?auto_38774 ) ) ( AVAILABLE ?auto_38777 ) ( ON ?auto_38773 ?auto_38772 ) ( not ( = ?auto_38772 ?auto_38773 ) ) ( not ( = ?auto_38772 ?auto_38774 ) ) ( TRUCK-AT ?auto_38776 ?auto_38780 ) ( not ( = ?auto_38780 ?auto_38778 ) ) ( HOIST-AT ?auto_38775 ?auto_38780 ) ( not ( = ?auto_38777 ?auto_38775 ) ) ( AVAILABLE ?auto_38775 ) ( SURFACE-AT ?auto_38774 ?auto_38780 ) ( ON ?auto_38774 ?auto_38779 ) ( CLEAR ?auto_38774 ) ( not ( = ?auto_38773 ?auto_38779 ) ) ( not ( = ?auto_38774 ?auto_38779 ) ) ( not ( = ?auto_38772 ?auto_38779 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38773 ?auto_38774 )
      ( MAKE-2CRATE-VERIFY ?auto_38772 ?auto_38773 ?auto_38774 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38781 - SURFACE
      ?auto_38782 - SURFACE
    )
    :vars
    (
      ?auto_38788 - HOIST
      ?auto_38789 - PLACE
      ?auto_38783 - SURFACE
      ?auto_38785 - PLACE
      ?auto_38787 - HOIST
      ?auto_38786 - SURFACE
      ?auto_38784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38788 ?auto_38789 ) ( SURFACE-AT ?auto_38781 ?auto_38789 ) ( CLEAR ?auto_38781 ) ( IS-CRATE ?auto_38782 ) ( not ( = ?auto_38781 ?auto_38782 ) ) ( AVAILABLE ?auto_38788 ) ( ON ?auto_38781 ?auto_38783 ) ( not ( = ?auto_38783 ?auto_38781 ) ) ( not ( = ?auto_38783 ?auto_38782 ) ) ( not ( = ?auto_38785 ?auto_38789 ) ) ( HOIST-AT ?auto_38787 ?auto_38785 ) ( not ( = ?auto_38788 ?auto_38787 ) ) ( AVAILABLE ?auto_38787 ) ( SURFACE-AT ?auto_38782 ?auto_38785 ) ( ON ?auto_38782 ?auto_38786 ) ( CLEAR ?auto_38782 ) ( not ( = ?auto_38781 ?auto_38786 ) ) ( not ( = ?auto_38782 ?auto_38786 ) ) ( not ( = ?auto_38783 ?auto_38786 ) ) ( TRUCK-AT ?auto_38784 ?auto_38789 ) )
    :subtasks
    ( ( !DRIVE ?auto_38784 ?auto_38789 ?auto_38785 )
      ( MAKE-2CRATE ?auto_38783 ?auto_38781 ?auto_38782 )
      ( MAKE-1CRATE-VERIFY ?auto_38781 ?auto_38782 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38790 - SURFACE
      ?auto_38791 - SURFACE
      ?auto_38792 - SURFACE
    )
    :vars
    (
      ?auto_38794 - HOIST
      ?auto_38797 - PLACE
      ?auto_38798 - PLACE
      ?auto_38795 - HOIST
      ?auto_38793 - SURFACE
      ?auto_38796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38794 ?auto_38797 ) ( SURFACE-AT ?auto_38791 ?auto_38797 ) ( CLEAR ?auto_38791 ) ( IS-CRATE ?auto_38792 ) ( not ( = ?auto_38791 ?auto_38792 ) ) ( AVAILABLE ?auto_38794 ) ( ON ?auto_38791 ?auto_38790 ) ( not ( = ?auto_38790 ?auto_38791 ) ) ( not ( = ?auto_38790 ?auto_38792 ) ) ( not ( = ?auto_38798 ?auto_38797 ) ) ( HOIST-AT ?auto_38795 ?auto_38798 ) ( not ( = ?auto_38794 ?auto_38795 ) ) ( AVAILABLE ?auto_38795 ) ( SURFACE-AT ?auto_38792 ?auto_38798 ) ( ON ?auto_38792 ?auto_38793 ) ( CLEAR ?auto_38792 ) ( not ( = ?auto_38791 ?auto_38793 ) ) ( not ( = ?auto_38792 ?auto_38793 ) ) ( not ( = ?auto_38790 ?auto_38793 ) ) ( TRUCK-AT ?auto_38796 ?auto_38797 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38791 ?auto_38792 )
      ( MAKE-2CRATE-VERIFY ?auto_38790 ?auto_38791 ?auto_38792 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38799 - SURFACE
      ?auto_38800 - SURFACE
    )
    :vars
    (
      ?auto_38802 - HOIST
      ?auto_38801 - PLACE
      ?auto_38807 - SURFACE
      ?auto_38806 - PLACE
      ?auto_38803 - HOIST
      ?auto_38805 - SURFACE
      ?auto_38804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38802 ?auto_38801 ) ( IS-CRATE ?auto_38800 ) ( not ( = ?auto_38799 ?auto_38800 ) ) ( not ( = ?auto_38807 ?auto_38799 ) ) ( not ( = ?auto_38807 ?auto_38800 ) ) ( not ( = ?auto_38806 ?auto_38801 ) ) ( HOIST-AT ?auto_38803 ?auto_38806 ) ( not ( = ?auto_38802 ?auto_38803 ) ) ( AVAILABLE ?auto_38803 ) ( SURFACE-AT ?auto_38800 ?auto_38806 ) ( ON ?auto_38800 ?auto_38805 ) ( CLEAR ?auto_38800 ) ( not ( = ?auto_38799 ?auto_38805 ) ) ( not ( = ?auto_38800 ?auto_38805 ) ) ( not ( = ?auto_38807 ?auto_38805 ) ) ( TRUCK-AT ?auto_38804 ?auto_38801 ) ( SURFACE-AT ?auto_38807 ?auto_38801 ) ( CLEAR ?auto_38807 ) ( LIFTING ?auto_38802 ?auto_38799 ) ( IS-CRATE ?auto_38799 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38807 ?auto_38799 )
      ( MAKE-2CRATE ?auto_38807 ?auto_38799 ?auto_38800 )
      ( MAKE-1CRATE-VERIFY ?auto_38799 ?auto_38800 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38808 - SURFACE
      ?auto_38809 - SURFACE
      ?auto_38810 - SURFACE
    )
    :vars
    (
      ?auto_38813 - HOIST
      ?auto_38811 - PLACE
      ?auto_38812 - PLACE
      ?auto_38816 - HOIST
      ?auto_38815 - SURFACE
      ?auto_38814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38813 ?auto_38811 ) ( IS-CRATE ?auto_38810 ) ( not ( = ?auto_38809 ?auto_38810 ) ) ( not ( = ?auto_38808 ?auto_38809 ) ) ( not ( = ?auto_38808 ?auto_38810 ) ) ( not ( = ?auto_38812 ?auto_38811 ) ) ( HOIST-AT ?auto_38816 ?auto_38812 ) ( not ( = ?auto_38813 ?auto_38816 ) ) ( AVAILABLE ?auto_38816 ) ( SURFACE-AT ?auto_38810 ?auto_38812 ) ( ON ?auto_38810 ?auto_38815 ) ( CLEAR ?auto_38810 ) ( not ( = ?auto_38809 ?auto_38815 ) ) ( not ( = ?auto_38810 ?auto_38815 ) ) ( not ( = ?auto_38808 ?auto_38815 ) ) ( TRUCK-AT ?auto_38814 ?auto_38811 ) ( SURFACE-AT ?auto_38808 ?auto_38811 ) ( CLEAR ?auto_38808 ) ( LIFTING ?auto_38813 ?auto_38809 ) ( IS-CRATE ?auto_38809 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38809 ?auto_38810 )
      ( MAKE-2CRATE-VERIFY ?auto_38808 ?auto_38809 ?auto_38810 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38817 - SURFACE
      ?auto_38818 - SURFACE
    )
    :vars
    (
      ?auto_38819 - HOIST
      ?auto_38825 - PLACE
      ?auto_38820 - SURFACE
      ?auto_38821 - PLACE
      ?auto_38822 - HOIST
      ?auto_38823 - SURFACE
      ?auto_38824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38819 ?auto_38825 ) ( IS-CRATE ?auto_38818 ) ( not ( = ?auto_38817 ?auto_38818 ) ) ( not ( = ?auto_38820 ?auto_38817 ) ) ( not ( = ?auto_38820 ?auto_38818 ) ) ( not ( = ?auto_38821 ?auto_38825 ) ) ( HOIST-AT ?auto_38822 ?auto_38821 ) ( not ( = ?auto_38819 ?auto_38822 ) ) ( AVAILABLE ?auto_38822 ) ( SURFACE-AT ?auto_38818 ?auto_38821 ) ( ON ?auto_38818 ?auto_38823 ) ( CLEAR ?auto_38818 ) ( not ( = ?auto_38817 ?auto_38823 ) ) ( not ( = ?auto_38818 ?auto_38823 ) ) ( not ( = ?auto_38820 ?auto_38823 ) ) ( TRUCK-AT ?auto_38824 ?auto_38825 ) ( SURFACE-AT ?auto_38820 ?auto_38825 ) ( CLEAR ?auto_38820 ) ( IS-CRATE ?auto_38817 ) ( AVAILABLE ?auto_38819 ) ( IN ?auto_38817 ?auto_38824 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38819 ?auto_38817 ?auto_38824 ?auto_38825 )
      ( MAKE-2CRATE ?auto_38820 ?auto_38817 ?auto_38818 )
      ( MAKE-1CRATE-VERIFY ?auto_38817 ?auto_38818 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38826 - SURFACE
      ?auto_38827 - SURFACE
      ?auto_38828 - SURFACE
    )
    :vars
    (
      ?auto_38834 - HOIST
      ?auto_38833 - PLACE
      ?auto_38832 - PLACE
      ?auto_38830 - HOIST
      ?auto_38831 - SURFACE
      ?auto_38829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38834 ?auto_38833 ) ( IS-CRATE ?auto_38828 ) ( not ( = ?auto_38827 ?auto_38828 ) ) ( not ( = ?auto_38826 ?auto_38827 ) ) ( not ( = ?auto_38826 ?auto_38828 ) ) ( not ( = ?auto_38832 ?auto_38833 ) ) ( HOIST-AT ?auto_38830 ?auto_38832 ) ( not ( = ?auto_38834 ?auto_38830 ) ) ( AVAILABLE ?auto_38830 ) ( SURFACE-AT ?auto_38828 ?auto_38832 ) ( ON ?auto_38828 ?auto_38831 ) ( CLEAR ?auto_38828 ) ( not ( = ?auto_38827 ?auto_38831 ) ) ( not ( = ?auto_38828 ?auto_38831 ) ) ( not ( = ?auto_38826 ?auto_38831 ) ) ( TRUCK-AT ?auto_38829 ?auto_38833 ) ( SURFACE-AT ?auto_38826 ?auto_38833 ) ( CLEAR ?auto_38826 ) ( IS-CRATE ?auto_38827 ) ( AVAILABLE ?auto_38834 ) ( IN ?auto_38827 ?auto_38829 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38827 ?auto_38828 )
      ( MAKE-2CRATE-VERIFY ?auto_38826 ?auto_38827 ?auto_38828 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38871 - SURFACE
      ?auto_38872 - SURFACE
    )
    :vars
    (
      ?auto_38876 - HOIST
      ?auto_38875 - PLACE
      ?auto_38874 - SURFACE
      ?auto_38879 - PLACE
      ?auto_38877 - HOIST
      ?auto_38878 - SURFACE
      ?auto_38873 - TRUCK
      ?auto_38880 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38876 ?auto_38875 ) ( SURFACE-AT ?auto_38871 ?auto_38875 ) ( CLEAR ?auto_38871 ) ( IS-CRATE ?auto_38872 ) ( not ( = ?auto_38871 ?auto_38872 ) ) ( AVAILABLE ?auto_38876 ) ( ON ?auto_38871 ?auto_38874 ) ( not ( = ?auto_38874 ?auto_38871 ) ) ( not ( = ?auto_38874 ?auto_38872 ) ) ( not ( = ?auto_38879 ?auto_38875 ) ) ( HOIST-AT ?auto_38877 ?auto_38879 ) ( not ( = ?auto_38876 ?auto_38877 ) ) ( AVAILABLE ?auto_38877 ) ( SURFACE-AT ?auto_38872 ?auto_38879 ) ( ON ?auto_38872 ?auto_38878 ) ( CLEAR ?auto_38872 ) ( not ( = ?auto_38871 ?auto_38878 ) ) ( not ( = ?auto_38872 ?auto_38878 ) ) ( not ( = ?auto_38874 ?auto_38878 ) ) ( TRUCK-AT ?auto_38873 ?auto_38880 ) ( not ( = ?auto_38880 ?auto_38875 ) ) ( not ( = ?auto_38879 ?auto_38880 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38873 ?auto_38880 ?auto_38875 )
      ( MAKE-1CRATE ?auto_38871 ?auto_38872 )
      ( MAKE-1CRATE-VERIFY ?auto_38871 ?auto_38872 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_38911 - SURFACE
      ?auto_38912 - SURFACE
      ?auto_38913 - SURFACE
      ?auto_38910 - SURFACE
    )
    :vars
    (
      ?auto_38914 - HOIST
      ?auto_38915 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38914 ?auto_38915 ) ( SURFACE-AT ?auto_38913 ?auto_38915 ) ( CLEAR ?auto_38913 ) ( LIFTING ?auto_38914 ?auto_38910 ) ( IS-CRATE ?auto_38910 ) ( not ( = ?auto_38913 ?auto_38910 ) ) ( ON ?auto_38912 ?auto_38911 ) ( ON ?auto_38913 ?auto_38912 ) ( not ( = ?auto_38911 ?auto_38912 ) ) ( not ( = ?auto_38911 ?auto_38913 ) ) ( not ( = ?auto_38911 ?auto_38910 ) ) ( not ( = ?auto_38912 ?auto_38913 ) ) ( not ( = ?auto_38912 ?auto_38910 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38913 ?auto_38910 )
      ( MAKE-3CRATE-VERIFY ?auto_38911 ?auto_38912 ?auto_38913 ?auto_38910 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_38928 - SURFACE
      ?auto_38929 - SURFACE
      ?auto_38930 - SURFACE
      ?auto_38927 - SURFACE
    )
    :vars
    (
      ?auto_38933 - HOIST
      ?auto_38932 - PLACE
      ?auto_38931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38933 ?auto_38932 ) ( SURFACE-AT ?auto_38930 ?auto_38932 ) ( CLEAR ?auto_38930 ) ( IS-CRATE ?auto_38927 ) ( not ( = ?auto_38930 ?auto_38927 ) ) ( TRUCK-AT ?auto_38931 ?auto_38932 ) ( AVAILABLE ?auto_38933 ) ( IN ?auto_38927 ?auto_38931 ) ( ON ?auto_38930 ?auto_38929 ) ( not ( = ?auto_38929 ?auto_38930 ) ) ( not ( = ?auto_38929 ?auto_38927 ) ) ( ON ?auto_38929 ?auto_38928 ) ( not ( = ?auto_38928 ?auto_38929 ) ) ( not ( = ?auto_38928 ?auto_38930 ) ) ( not ( = ?auto_38928 ?auto_38927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_38929 ?auto_38930 ?auto_38927 )
      ( MAKE-3CRATE-VERIFY ?auto_38928 ?auto_38929 ?auto_38930 ?auto_38927 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_38949 - SURFACE
      ?auto_38950 - SURFACE
      ?auto_38951 - SURFACE
      ?auto_38948 - SURFACE
    )
    :vars
    (
      ?auto_38953 - HOIST
      ?auto_38954 - PLACE
      ?auto_38955 - TRUCK
      ?auto_38952 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38953 ?auto_38954 ) ( SURFACE-AT ?auto_38951 ?auto_38954 ) ( CLEAR ?auto_38951 ) ( IS-CRATE ?auto_38948 ) ( not ( = ?auto_38951 ?auto_38948 ) ) ( AVAILABLE ?auto_38953 ) ( IN ?auto_38948 ?auto_38955 ) ( ON ?auto_38951 ?auto_38950 ) ( not ( = ?auto_38950 ?auto_38951 ) ) ( not ( = ?auto_38950 ?auto_38948 ) ) ( TRUCK-AT ?auto_38955 ?auto_38952 ) ( not ( = ?auto_38952 ?auto_38954 ) ) ( ON ?auto_38950 ?auto_38949 ) ( not ( = ?auto_38949 ?auto_38950 ) ) ( not ( = ?auto_38949 ?auto_38951 ) ) ( not ( = ?auto_38949 ?auto_38948 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_38950 ?auto_38951 ?auto_38948 )
      ( MAKE-3CRATE-VERIFY ?auto_38949 ?auto_38950 ?auto_38951 ?auto_38948 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_38973 - SURFACE
      ?auto_38974 - SURFACE
      ?auto_38975 - SURFACE
      ?auto_38972 - SURFACE
    )
    :vars
    (
      ?auto_38976 - HOIST
      ?auto_38980 - PLACE
      ?auto_38977 - TRUCK
      ?auto_38979 - PLACE
      ?auto_38978 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38976 ?auto_38980 ) ( SURFACE-AT ?auto_38975 ?auto_38980 ) ( CLEAR ?auto_38975 ) ( IS-CRATE ?auto_38972 ) ( not ( = ?auto_38975 ?auto_38972 ) ) ( AVAILABLE ?auto_38976 ) ( ON ?auto_38975 ?auto_38974 ) ( not ( = ?auto_38974 ?auto_38975 ) ) ( not ( = ?auto_38974 ?auto_38972 ) ) ( TRUCK-AT ?auto_38977 ?auto_38979 ) ( not ( = ?auto_38979 ?auto_38980 ) ) ( HOIST-AT ?auto_38978 ?auto_38979 ) ( LIFTING ?auto_38978 ?auto_38972 ) ( not ( = ?auto_38976 ?auto_38978 ) ) ( ON ?auto_38974 ?auto_38973 ) ( not ( = ?auto_38973 ?auto_38974 ) ) ( not ( = ?auto_38973 ?auto_38975 ) ) ( not ( = ?auto_38973 ?auto_38972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_38974 ?auto_38975 ?auto_38972 )
      ( MAKE-3CRATE-VERIFY ?auto_38973 ?auto_38974 ?auto_38975 ?auto_38972 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_39000 - SURFACE
      ?auto_39001 - SURFACE
      ?auto_39002 - SURFACE
      ?auto_38999 - SURFACE
    )
    :vars
    (
      ?auto_39005 - HOIST
      ?auto_39006 - PLACE
      ?auto_39007 - TRUCK
      ?auto_39008 - PLACE
      ?auto_39003 - HOIST
      ?auto_39004 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39005 ?auto_39006 ) ( SURFACE-AT ?auto_39002 ?auto_39006 ) ( CLEAR ?auto_39002 ) ( IS-CRATE ?auto_38999 ) ( not ( = ?auto_39002 ?auto_38999 ) ) ( AVAILABLE ?auto_39005 ) ( ON ?auto_39002 ?auto_39001 ) ( not ( = ?auto_39001 ?auto_39002 ) ) ( not ( = ?auto_39001 ?auto_38999 ) ) ( TRUCK-AT ?auto_39007 ?auto_39008 ) ( not ( = ?auto_39008 ?auto_39006 ) ) ( HOIST-AT ?auto_39003 ?auto_39008 ) ( not ( = ?auto_39005 ?auto_39003 ) ) ( AVAILABLE ?auto_39003 ) ( SURFACE-AT ?auto_38999 ?auto_39008 ) ( ON ?auto_38999 ?auto_39004 ) ( CLEAR ?auto_38999 ) ( not ( = ?auto_39002 ?auto_39004 ) ) ( not ( = ?auto_38999 ?auto_39004 ) ) ( not ( = ?auto_39001 ?auto_39004 ) ) ( ON ?auto_39001 ?auto_39000 ) ( not ( = ?auto_39000 ?auto_39001 ) ) ( not ( = ?auto_39000 ?auto_39002 ) ) ( not ( = ?auto_39000 ?auto_38999 ) ) ( not ( = ?auto_39000 ?auto_39004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39001 ?auto_39002 ?auto_38999 )
      ( MAKE-3CRATE-VERIFY ?auto_39000 ?auto_39001 ?auto_39002 ?auto_38999 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_39028 - SURFACE
      ?auto_39029 - SURFACE
      ?auto_39030 - SURFACE
      ?auto_39027 - SURFACE
    )
    :vars
    (
      ?auto_39036 - HOIST
      ?auto_39033 - PLACE
      ?auto_39031 - PLACE
      ?auto_39032 - HOIST
      ?auto_39034 - SURFACE
      ?auto_39035 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39036 ?auto_39033 ) ( SURFACE-AT ?auto_39030 ?auto_39033 ) ( CLEAR ?auto_39030 ) ( IS-CRATE ?auto_39027 ) ( not ( = ?auto_39030 ?auto_39027 ) ) ( AVAILABLE ?auto_39036 ) ( ON ?auto_39030 ?auto_39029 ) ( not ( = ?auto_39029 ?auto_39030 ) ) ( not ( = ?auto_39029 ?auto_39027 ) ) ( not ( = ?auto_39031 ?auto_39033 ) ) ( HOIST-AT ?auto_39032 ?auto_39031 ) ( not ( = ?auto_39036 ?auto_39032 ) ) ( AVAILABLE ?auto_39032 ) ( SURFACE-AT ?auto_39027 ?auto_39031 ) ( ON ?auto_39027 ?auto_39034 ) ( CLEAR ?auto_39027 ) ( not ( = ?auto_39030 ?auto_39034 ) ) ( not ( = ?auto_39027 ?auto_39034 ) ) ( not ( = ?auto_39029 ?auto_39034 ) ) ( TRUCK-AT ?auto_39035 ?auto_39033 ) ( ON ?auto_39029 ?auto_39028 ) ( not ( = ?auto_39028 ?auto_39029 ) ) ( not ( = ?auto_39028 ?auto_39030 ) ) ( not ( = ?auto_39028 ?auto_39027 ) ) ( not ( = ?auto_39028 ?auto_39034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39029 ?auto_39030 ?auto_39027 )
      ( MAKE-3CRATE-VERIFY ?auto_39028 ?auto_39029 ?auto_39030 ?auto_39027 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_39056 - SURFACE
      ?auto_39057 - SURFACE
      ?auto_39058 - SURFACE
      ?auto_39055 - SURFACE
    )
    :vars
    (
      ?auto_39060 - HOIST
      ?auto_39064 - PLACE
      ?auto_39063 - PLACE
      ?auto_39061 - HOIST
      ?auto_39062 - SURFACE
      ?auto_39059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39060 ?auto_39064 ) ( IS-CRATE ?auto_39055 ) ( not ( = ?auto_39058 ?auto_39055 ) ) ( not ( = ?auto_39057 ?auto_39058 ) ) ( not ( = ?auto_39057 ?auto_39055 ) ) ( not ( = ?auto_39063 ?auto_39064 ) ) ( HOIST-AT ?auto_39061 ?auto_39063 ) ( not ( = ?auto_39060 ?auto_39061 ) ) ( AVAILABLE ?auto_39061 ) ( SURFACE-AT ?auto_39055 ?auto_39063 ) ( ON ?auto_39055 ?auto_39062 ) ( CLEAR ?auto_39055 ) ( not ( = ?auto_39058 ?auto_39062 ) ) ( not ( = ?auto_39055 ?auto_39062 ) ) ( not ( = ?auto_39057 ?auto_39062 ) ) ( TRUCK-AT ?auto_39059 ?auto_39064 ) ( SURFACE-AT ?auto_39057 ?auto_39064 ) ( CLEAR ?auto_39057 ) ( LIFTING ?auto_39060 ?auto_39058 ) ( IS-CRATE ?auto_39058 ) ( ON ?auto_39057 ?auto_39056 ) ( not ( = ?auto_39056 ?auto_39057 ) ) ( not ( = ?auto_39056 ?auto_39058 ) ) ( not ( = ?auto_39056 ?auto_39055 ) ) ( not ( = ?auto_39056 ?auto_39062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39057 ?auto_39058 ?auto_39055 )
      ( MAKE-3CRATE-VERIFY ?auto_39056 ?auto_39057 ?auto_39058 ?auto_39055 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_39084 - SURFACE
      ?auto_39085 - SURFACE
      ?auto_39086 - SURFACE
      ?auto_39083 - SURFACE
    )
    :vars
    (
      ?auto_39091 - HOIST
      ?auto_39087 - PLACE
      ?auto_39092 - PLACE
      ?auto_39089 - HOIST
      ?auto_39090 - SURFACE
      ?auto_39088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39091 ?auto_39087 ) ( IS-CRATE ?auto_39083 ) ( not ( = ?auto_39086 ?auto_39083 ) ) ( not ( = ?auto_39085 ?auto_39086 ) ) ( not ( = ?auto_39085 ?auto_39083 ) ) ( not ( = ?auto_39092 ?auto_39087 ) ) ( HOIST-AT ?auto_39089 ?auto_39092 ) ( not ( = ?auto_39091 ?auto_39089 ) ) ( AVAILABLE ?auto_39089 ) ( SURFACE-AT ?auto_39083 ?auto_39092 ) ( ON ?auto_39083 ?auto_39090 ) ( CLEAR ?auto_39083 ) ( not ( = ?auto_39086 ?auto_39090 ) ) ( not ( = ?auto_39083 ?auto_39090 ) ) ( not ( = ?auto_39085 ?auto_39090 ) ) ( TRUCK-AT ?auto_39088 ?auto_39087 ) ( SURFACE-AT ?auto_39085 ?auto_39087 ) ( CLEAR ?auto_39085 ) ( IS-CRATE ?auto_39086 ) ( AVAILABLE ?auto_39091 ) ( IN ?auto_39086 ?auto_39088 ) ( ON ?auto_39085 ?auto_39084 ) ( not ( = ?auto_39084 ?auto_39085 ) ) ( not ( = ?auto_39084 ?auto_39086 ) ) ( not ( = ?auto_39084 ?auto_39083 ) ) ( not ( = ?auto_39084 ?auto_39090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39085 ?auto_39086 ?auto_39083 )
      ( MAKE-3CRATE-VERIFY ?auto_39084 ?auto_39085 ?auto_39086 ?auto_39083 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39375 - SURFACE
      ?auto_39376 - SURFACE
      ?auto_39377 - SURFACE
      ?auto_39374 - SURFACE
      ?auto_39378 - SURFACE
    )
    :vars
    (
      ?auto_39380 - HOIST
      ?auto_39379 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39380 ?auto_39379 ) ( SURFACE-AT ?auto_39374 ?auto_39379 ) ( CLEAR ?auto_39374 ) ( LIFTING ?auto_39380 ?auto_39378 ) ( IS-CRATE ?auto_39378 ) ( not ( = ?auto_39374 ?auto_39378 ) ) ( ON ?auto_39376 ?auto_39375 ) ( ON ?auto_39377 ?auto_39376 ) ( ON ?auto_39374 ?auto_39377 ) ( not ( = ?auto_39375 ?auto_39376 ) ) ( not ( = ?auto_39375 ?auto_39377 ) ) ( not ( = ?auto_39375 ?auto_39374 ) ) ( not ( = ?auto_39375 ?auto_39378 ) ) ( not ( = ?auto_39376 ?auto_39377 ) ) ( not ( = ?auto_39376 ?auto_39374 ) ) ( not ( = ?auto_39376 ?auto_39378 ) ) ( not ( = ?auto_39377 ?auto_39374 ) ) ( not ( = ?auto_39377 ?auto_39378 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_39374 ?auto_39378 )
      ( MAKE-4CRATE-VERIFY ?auto_39375 ?auto_39376 ?auto_39377 ?auto_39374 ?auto_39378 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39400 - SURFACE
      ?auto_39401 - SURFACE
      ?auto_39402 - SURFACE
      ?auto_39399 - SURFACE
      ?auto_39403 - SURFACE
    )
    :vars
    (
      ?auto_39405 - HOIST
      ?auto_39404 - PLACE
      ?auto_39406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39405 ?auto_39404 ) ( SURFACE-AT ?auto_39399 ?auto_39404 ) ( CLEAR ?auto_39399 ) ( IS-CRATE ?auto_39403 ) ( not ( = ?auto_39399 ?auto_39403 ) ) ( TRUCK-AT ?auto_39406 ?auto_39404 ) ( AVAILABLE ?auto_39405 ) ( IN ?auto_39403 ?auto_39406 ) ( ON ?auto_39399 ?auto_39402 ) ( not ( = ?auto_39402 ?auto_39399 ) ) ( not ( = ?auto_39402 ?auto_39403 ) ) ( ON ?auto_39401 ?auto_39400 ) ( ON ?auto_39402 ?auto_39401 ) ( not ( = ?auto_39400 ?auto_39401 ) ) ( not ( = ?auto_39400 ?auto_39402 ) ) ( not ( = ?auto_39400 ?auto_39399 ) ) ( not ( = ?auto_39400 ?auto_39403 ) ) ( not ( = ?auto_39401 ?auto_39402 ) ) ( not ( = ?auto_39401 ?auto_39399 ) ) ( not ( = ?auto_39401 ?auto_39403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39402 ?auto_39399 ?auto_39403 )
      ( MAKE-4CRATE-VERIFY ?auto_39400 ?auto_39401 ?auto_39402 ?auto_39399 ?auto_39403 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39430 - SURFACE
      ?auto_39431 - SURFACE
      ?auto_39432 - SURFACE
      ?auto_39429 - SURFACE
      ?auto_39433 - SURFACE
    )
    :vars
    (
      ?auto_39437 - HOIST
      ?auto_39436 - PLACE
      ?auto_39434 - TRUCK
      ?auto_39435 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39437 ?auto_39436 ) ( SURFACE-AT ?auto_39429 ?auto_39436 ) ( CLEAR ?auto_39429 ) ( IS-CRATE ?auto_39433 ) ( not ( = ?auto_39429 ?auto_39433 ) ) ( AVAILABLE ?auto_39437 ) ( IN ?auto_39433 ?auto_39434 ) ( ON ?auto_39429 ?auto_39432 ) ( not ( = ?auto_39432 ?auto_39429 ) ) ( not ( = ?auto_39432 ?auto_39433 ) ) ( TRUCK-AT ?auto_39434 ?auto_39435 ) ( not ( = ?auto_39435 ?auto_39436 ) ) ( ON ?auto_39431 ?auto_39430 ) ( ON ?auto_39432 ?auto_39431 ) ( not ( = ?auto_39430 ?auto_39431 ) ) ( not ( = ?auto_39430 ?auto_39432 ) ) ( not ( = ?auto_39430 ?auto_39429 ) ) ( not ( = ?auto_39430 ?auto_39433 ) ) ( not ( = ?auto_39431 ?auto_39432 ) ) ( not ( = ?auto_39431 ?auto_39429 ) ) ( not ( = ?auto_39431 ?auto_39433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39432 ?auto_39429 ?auto_39433 )
      ( MAKE-4CRATE-VERIFY ?auto_39430 ?auto_39431 ?auto_39432 ?auto_39429 ?auto_39433 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39464 - SURFACE
      ?auto_39465 - SURFACE
      ?auto_39466 - SURFACE
      ?auto_39463 - SURFACE
      ?auto_39467 - SURFACE
    )
    :vars
    (
      ?auto_39472 - HOIST
      ?auto_39471 - PLACE
      ?auto_39468 - TRUCK
      ?auto_39470 - PLACE
      ?auto_39469 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_39472 ?auto_39471 ) ( SURFACE-AT ?auto_39463 ?auto_39471 ) ( CLEAR ?auto_39463 ) ( IS-CRATE ?auto_39467 ) ( not ( = ?auto_39463 ?auto_39467 ) ) ( AVAILABLE ?auto_39472 ) ( ON ?auto_39463 ?auto_39466 ) ( not ( = ?auto_39466 ?auto_39463 ) ) ( not ( = ?auto_39466 ?auto_39467 ) ) ( TRUCK-AT ?auto_39468 ?auto_39470 ) ( not ( = ?auto_39470 ?auto_39471 ) ) ( HOIST-AT ?auto_39469 ?auto_39470 ) ( LIFTING ?auto_39469 ?auto_39467 ) ( not ( = ?auto_39472 ?auto_39469 ) ) ( ON ?auto_39465 ?auto_39464 ) ( ON ?auto_39466 ?auto_39465 ) ( not ( = ?auto_39464 ?auto_39465 ) ) ( not ( = ?auto_39464 ?auto_39466 ) ) ( not ( = ?auto_39464 ?auto_39463 ) ) ( not ( = ?auto_39464 ?auto_39467 ) ) ( not ( = ?auto_39465 ?auto_39466 ) ) ( not ( = ?auto_39465 ?auto_39463 ) ) ( not ( = ?auto_39465 ?auto_39467 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39466 ?auto_39463 ?auto_39467 )
      ( MAKE-4CRATE-VERIFY ?auto_39464 ?auto_39465 ?auto_39466 ?auto_39463 ?auto_39467 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39502 - SURFACE
      ?auto_39503 - SURFACE
      ?auto_39504 - SURFACE
      ?auto_39501 - SURFACE
      ?auto_39505 - SURFACE
    )
    :vars
    (
      ?auto_39511 - HOIST
      ?auto_39508 - PLACE
      ?auto_39506 - TRUCK
      ?auto_39509 - PLACE
      ?auto_39510 - HOIST
      ?auto_39507 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39511 ?auto_39508 ) ( SURFACE-AT ?auto_39501 ?auto_39508 ) ( CLEAR ?auto_39501 ) ( IS-CRATE ?auto_39505 ) ( not ( = ?auto_39501 ?auto_39505 ) ) ( AVAILABLE ?auto_39511 ) ( ON ?auto_39501 ?auto_39504 ) ( not ( = ?auto_39504 ?auto_39501 ) ) ( not ( = ?auto_39504 ?auto_39505 ) ) ( TRUCK-AT ?auto_39506 ?auto_39509 ) ( not ( = ?auto_39509 ?auto_39508 ) ) ( HOIST-AT ?auto_39510 ?auto_39509 ) ( not ( = ?auto_39511 ?auto_39510 ) ) ( AVAILABLE ?auto_39510 ) ( SURFACE-AT ?auto_39505 ?auto_39509 ) ( ON ?auto_39505 ?auto_39507 ) ( CLEAR ?auto_39505 ) ( not ( = ?auto_39501 ?auto_39507 ) ) ( not ( = ?auto_39505 ?auto_39507 ) ) ( not ( = ?auto_39504 ?auto_39507 ) ) ( ON ?auto_39503 ?auto_39502 ) ( ON ?auto_39504 ?auto_39503 ) ( not ( = ?auto_39502 ?auto_39503 ) ) ( not ( = ?auto_39502 ?auto_39504 ) ) ( not ( = ?auto_39502 ?auto_39501 ) ) ( not ( = ?auto_39502 ?auto_39505 ) ) ( not ( = ?auto_39502 ?auto_39507 ) ) ( not ( = ?auto_39503 ?auto_39504 ) ) ( not ( = ?auto_39503 ?auto_39501 ) ) ( not ( = ?auto_39503 ?auto_39505 ) ) ( not ( = ?auto_39503 ?auto_39507 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39504 ?auto_39501 ?auto_39505 )
      ( MAKE-4CRATE-VERIFY ?auto_39502 ?auto_39503 ?auto_39504 ?auto_39501 ?auto_39505 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39541 - SURFACE
      ?auto_39542 - SURFACE
      ?auto_39543 - SURFACE
      ?auto_39540 - SURFACE
      ?auto_39544 - SURFACE
    )
    :vars
    (
      ?auto_39546 - HOIST
      ?auto_39548 - PLACE
      ?auto_39549 - PLACE
      ?auto_39547 - HOIST
      ?auto_39545 - SURFACE
      ?auto_39550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39546 ?auto_39548 ) ( SURFACE-AT ?auto_39540 ?auto_39548 ) ( CLEAR ?auto_39540 ) ( IS-CRATE ?auto_39544 ) ( not ( = ?auto_39540 ?auto_39544 ) ) ( AVAILABLE ?auto_39546 ) ( ON ?auto_39540 ?auto_39543 ) ( not ( = ?auto_39543 ?auto_39540 ) ) ( not ( = ?auto_39543 ?auto_39544 ) ) ( not ( = ?auto_39549 ?auto_39548 ) ) ( HOIST-AT ?auto_39547 ?auto_39549 ) ( not ( = ?auto_39546 ?auto_39547 ) ) ( AVAILABLE ?auto_39547 ) ( SURFACE-AT ?auto_39544 ?auto_39549 ) ( ON ?auto_39544 ?auto_39545 ) ( CLEAR ?auto_39544 ) ( not ( = ?auto_39540 ?auto_39545 ) ) ( not ( = ?auto_39544 ?auto_39545 ) ) ( not ( = ?auto_39543 ?auto_39545 ) ) ( TRUCK-AT ?auto_39550 ?auto_39548 ) ( ON ?auto_39542 ?auto_39541 ) ( ON ?auto_39543 ?auto_39542 ) ( not ( = ?auto_39541 ?auto_39542 ) ) ( not ( = ?auto_39541 ?auto_39543 ) ) ( not ( = ?auto_39541 ?auto_39540 ) ) ( not ( = ?auto_39541 ?auto_39544 ) ) ( not ( = ?auto_39541 ?auto_39545 ) ) ( not ( = ?auto_39542 ?auto_39543 ) ) ( not ( = ?auto_39542 ?auto_39540 ) ) ( not ( = ?auto_39542 ?auto_39544 ) ) ( not ( = ?auto_39542 ?auto_39545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39543 ?auto_39540 ?auto_39544 )
      ( MAKE-4CRATE-VERIFY ?auto_39541 ?auto_39542 ?auto_39543 ?auto_39540 ?auto_39544 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39580 - SURFACE
      ?auto_39581 - SURFACE
      ?auto_39582 - SURFACE
      ?auto_39579 - SURFACE
      ?auto_39583 - SURFACE
    )
    :vars
    (
      ?auto_39587 - HOIST
      ?auto_39584 - PLACE
      ?auto_39588 - PLACE
      ?auto_39589 - HOIST
      ?auto_39586 - SURFACE
      ?auto_39585 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39587 ?auto_39584 ) ( IS-CRATE ?auto_39583 ) ( not ( = ?auto_39579 ?auto_39583 ) ) ( not ( = ?auto_39582 ?auto_39579 ) ) ( not ( = ?auto_39582 ?auto_39583 ) ) ( not ( = ?auto_39588 ?auto_39584 ) ) ( HOIST-AT ?auto_39589 ?auto_39588 ) ( not ( = ?auto_39587 ?auto_39589 ) ) ( AVAILABLE ?auto_39589 ) ( SURFACE-AT ?auto_39583 ?auto_39588 ) ( ON ?auto_39583 ?auto_39586 ) ( CLEAR ?auto_39583 ) ( not ( = ?auto_39579 ?auto_39586 ) ) ( not ( = ?auto_39583 ?auto_39586 ) ) ( not ( = ?auto_39582 ?auto_39586 ) ) ( TRUCK-AT ?auto_39585 ?auto_39584 ) ( SURFACE-AT ?auto_39582 ?auto_39584 ) ( CLEAR ?auto_39582 ) ( LIFTING ?auto_39587 ?auto_39579 ) ( IS-CRATE ?auto_39579 ) ( ON ?auto_39581 ?auto_39580 ) ( ON ?auto_39582 ?auto_39581 ) ( not ( = ?auto_39580 ?auto_39581 ) ) ( not ( = ?auto_39580 ?auto_39582 ) ) ( not ( = ?auto_39580 ?auto_39579 ) ) ( not ( = ?auto_39580 ?auto_39583 ) ) ( not ( = ?auto_39580 ?auto_39586 ) ) ( not ( = ?auto_39581 ?auto_39582 ) ) ( not ( = ?auto_39581 ?auto_39579 ) ) ( not ( = ?auto_39581 ?auto_39583 ) ) ( not ( = ?auto_39581 ?auto_39586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39582 ?auto_39579 ?auto_39583 )
      ( MAKE-4CRATE-VERIFY ?auto_39580 ?auto_39581 ?auto_39582 ?auto_39579 ?auto_39583 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39619 - SURFACE
      ?auto_39620 - SURFACE
      ?auto_39621 - SURFACE
      ?auto_39618 - SURFACE
      ?auto_39622 - SURFACE
    )
    :vars
    (
      ?auto_39627 - HOIST
      ?auto_39624 - PLACE
      ?auto_39623 - PLACE
      ?auto_39625 - HOIST
      ?auto_39628 - SURFACE
      ?auto_39626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39627 ?auto_39624 ) ( IS-CRATE ?auto_39622 ) ( not ( = ?auto_39618 ?auto_39622 ) ) ( not ( = ?auto_39621 ?auto_39618 ) ) ( not ( = ?auto_39621 ?auto_39622 ) ) ( not ( = ?auto_39623 ?auto_39624 ) ) ( HOIST-AT ?auto_39625 ?auto_39623 ) ( not ( = ?auto_39627 ?auto_39625 ) ) ( AVAILABLE ?auto_39625 ) ( SURFACE-AT ?auto_39622 ?auto_39623 ) ( ON ?auto_39622 ?auto_39628 ) ( CLEAR ?auto_39622 ) ( not ( = ?auto_39618 ?auto_39628 ) ) ( not ( = ?auto_39622 ?auto_39628 ) ) ( not ( = ?auto_39621 ?auto_39628 ) ) ( TRUCK-AT ?auto_39626 ?auto_39624 ) ( SURFACE-AT ?auto_39621 ?auto_39624 ) ( CLEAR ?auto_39621 ) ( IS-CRATE ?auto_39618 ) ( AVAILABLE ?auto_39627 ) ( IN ?auto_39618 ?auto_39626 ) ( ON ?auto_39620 ?auto_39619 ) ( ON ?auto_39621 ?auto_39620 ) ( not ( = ?auto_39619 ?auto_39620 ) ) ( not ( = ?auto_39619 ?auto_39621 ) ) ( not ( = ?auto_39619 ?auto_39618 ) ) ( not ( = ?auto_39619 ?auto_39622 ) ) ( not ( = ?auto_39619 ?auto_39628 ) ) ( not ( = ?auto_39620 ?auto_39621 ) ) ( not ( = ?auto_39620 ?auto_39618 ) ) ( not ( = ?auto_39620 ?auto_39622 ) ) ( not ( = ?auto_39620 ?auto_39628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39621 ?auto_39618 ?auto_39622 )
      ( MAKE-4CRATE-VERIFY ?auto_39619 ?auto_39620 ?auto_39621 ?auto_39618 ?auto_39622 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_39629 - SURFACE
      ?auto_39630 - SURFACE
    )
    :vars
    (
      ?auto_39635 - HOIST
      ?auto_39632 - PLACE
      ?auto_39637 - SURFACE
      ?auto_39631 - PLACE
      ?auto_39633 - HOIST
      ?auto_39636 - SURFACE
      ?auto_39634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39635 ?auto_39632 ) ( IS-CRATE ?auto_39630 ) ( not ( = ?auto_39629 ?auto_39630 ) ) ( not ( = ?auto_39637 ?auto_39629 ) ) ( not ( = ?auto_39637 ?auto_39630 ) ) ( not ( = ?auto_39631 ?auto_39632 ) ) ( HOIST-AT ?auto_39633 ?auto_39631 ) ( not ( = ?auto_39635 ?auto_39633 ) ) ( AVAILABLE ?auto_39633 ) ( SURFACE-AT ?auto_39630 ?auto_39631 ) ( ON ?auto_39630 ?auto_39636 ) ( CLEAR ?auto_39630 ) ( not ( = ?auto_39629 ?auto_39636 ) ) ( not ( = ?auto_39630 ?auto_39636 ) ) ( not ( = ?auto_39637 ?auto_39636 ) ) ( SURFACE-AT ?auto_39637 ?auto_39632 ) ( CLEAR ?auto_39637 ) ( IS-CRATE ?auto_39629 ) ( AVAILABLE ?auto_39635 ) ( IN ?auto_39629 ?auto_39634 ) ( TRUCK-AT ?auto_39634 ?auto_39631 ) )
    :subtasks
    ( ( !DRIVE ?auto_39634 ?auto_39631 ?auto_39632 )
      ( MAKE-2CRATE ?auto_39637 ?auto_39629 ?auto_39630 )
      ( MAKE-1CRATE-VERIFY ?auto_39629 ?auto_39630 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_39638 - SURFACE
      ?auto_39639 - SURFACE
      ?auto_39640 - SURFACE
    )
    :vars
    (
      ?auto_39644 - HOIST
      ?auto_39645 - PLACE
      ?auto_39643 - PLACE
      ?auto_39642 - HOIST
      ?auto_39641 - SURFACE
      ?auto_39646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39644 ?auto_39645 ) ( IS-CRATE ?auto_39640 ) ( not ( = ?auto_39639 ?auto_39640 ) ) ( not ( = ?auto_39638 ?auto_39639 ) ) ( not ( = ?auto_39638 ?auto_39640 ) ) ( not ( = ?auto_39643 ?auto_39645 ) ) ( HOIST-AT ?auto_39642 ?auto_39643 ) ( not ( = ?auto_39644 ?auto_39642 ) ) ( AVAILABLE ?auto_39642 ) ( SURFACE-AT ?auto_39640 ?auto_39643 ) ( ON ?auto_39640 ?auto_39641 ) ( CLEAR ?auto_39640 ) ( not ( = ?auto_39639 ?auto_39641 ) ) ( not ( = ?auto_39640 ?auto_39641 ) ) ( not ( = ?auto_39638 ?auto_39641 ) ) ( SURFACE-AT ?auto_39638 ?auto_39645 ) ( CLEAR ?auto_39638 ) ( IS-CRATE ?auto_39639 ) ( AVAILABLE ?auto_39644 ) ( IN ?auto_39639 ?auto_39646 ) ( TRUCK-AT ?auto_39646 ?auto_39643 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_39639 ?auto_39640 )
      ( MAKE-2CRATE-VERIFY ?auto_39638 ?auto_39639 ?auto_39640 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_39648 - SURFACE
      ?auto_39649 - SURFACE
      ?auto_39650 - SURFACE
      ?auto_39647 - SURFACE
    )
    :vars
    (
      ?auto_39655 - HOIST
      ?auto_39653 - PLACE
      ?auto_39654 - PLACE
      ?auto_39656 - HOIST
      ?auto_39651 - SURFACE
      ?auto_39652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39655 ?auto_39653 ) ( IS-CRATE ?auto_39647 ) ( not ( = ?auto_39650 ?auto_39647 ) ) ( not ( = ?auto_39649 ?auto_39650 ) ) ( not ( = ?auto_39649 ?auto_39647 ) ) ( not ( = ?auto_39654 ?auto_39653 ) ) ( HOIST-AT ?auto_39656 ?auto_39654 ) ( not ( = ?auto_39655 ?auto_39656 ) ) ( AVAILABLE ?auto_39656 ) ( SURFACE-AT ?auto_39647 ?auto_39654 ) ( ON ?auto_39647 ?auto_39651 ) ( CLEAR ?auto_39647 ) ( not ( = ?auto_39650 ?auto_39651 ) ) ( not ( = ?auto_39647 ?auto_39651 ) ) ( not ( = ?auto_39649 ?auto_39651 ) ) ( SURFACE-AT ?auto_39649 ?auto_39653 ) ( CLEAR ?auto_39649 ) ( IS-CRATE ?auto_39650 ) ( AVAILABLE ?auto_39655 ) ( IN ?auto_39650 ?auto_39652 ) ( TRUCK-AT ?auto_39652 ?auto_39654 ) ( ON ?auto_39649 ?auto_39648 ) ( not ( = ?auto_39648 ?auto_39649 ) ) ( not ( = ?auto_39648 ?auto_39650 ) ) ( not ( = ?auto_39648 ?auto_39647 ) ) ( not ( = ?auto_39648 ?auto_39651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39649 ?auto_39650 ?auto_39647 )
      ( MAKE-3CRATE-VERIFY ?auto_39648 ?auto_39649 ?auto_39650 ?auto_39647 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39658 - SURFACE
      ?auto_39659 - SURFACE
      ?auto_39660 - SURFACE
      ?auto_39657 - SURFACE
      ?auto_39661 - SURFACE
    )
    :vars
    (
      ?auto_39666 - HOIST
      ?auto_39664 - PLACE
      ?auto_39665 - PLACE
      ?auto_39667 - HOIST
      ?auto_39662 - SURFACE
      ?auto_39663 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39666 ?auto_39664 ) ( IS-CRATE ?auto_39661 ) ( not ( = ?auto_39657 ?auto_39661 ) ) ( not ( = ?auto_39660 ?auto_39657 ) ) ( not ( = ?auto_39660 ?auto_39661 ) ) ( not ( = ?auto_39665 ?auto_39664 ) ) ( HOIST-AT ?auto_39667 ?auto_39665 ) ( not ( = ?auto_39666 ?auto_39667 ) ) ( AVAILABLE ?auto_39667 ) ( SURFACE-AT ?auto_39661 ?auto_39665 ) ( ON ?auto_39661 ?auto_39662 ) ( CLEAR ?auto_39661 ) ( not ( = ?auto_39657 ?auto_39662 ) ) ( not ( = ?auto_39661 ?auto_39662 ) ) ( not ( = ?auto_39660 ?auto_39662 ) ) ( SURFACE-AT ?auto_39660 ?auto_39664 ) ( CLEAR ?auto_39660 ) ( IS-CRATE ?auto_39657 ) ( AVAILABLE ?auto_39666 ) ( IN ?auto_39657 ?auto_39663 ) ( TRUCK-AT ?auto_39663 ?auto_39665 ) ( ON ?auto_39659 ?auto_39658 ) ( ON ?auto_39660 ?auto_39659 ) ( not ( = ?auto_39658 ?auto_39659 ) ) ( not ( = ?auto_39658 ?auto_39660 ) ) ( not ( = ?auto_39658 ?auto_39657 ) ) ( not ( = ?auto_39658 ?auto_39661 ) ) ( not ( = ?auto_39658 ?auto_39662 ) ) ( not ( = ?auto_39659 ?auto_39660 ) ) ( not ( = ?auto_39659 ?auto_39657 ) ) ( not ( = ?auto_39659 ?auto_39661 ) ) ( not ( = ?auto_39659 ?auto_39662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39660 ?auto_39657 ?auto_39661 )
      ( MAKE-4CRATE-VERIFY ?auto_39658 ?auto_39659 ?auto_39660 ?auto_39657 ?auto_39661 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_39668 - SURFACE
      ?auto_39669 - SURFACE
    )
    :vars
    (
      ?auto_39675 - HOIST
      ?auto_39673 - PLACE
      ?auto_39672 - SURFACE
      ?auto_39674 - PLACE
      ?auto_39676 - HOIST
      ?auto_39670 - SURFACE
      ?auto_39671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39675 ?auto_39673 ) ( IS-CRATE ?auto_39669 ) ( not ( = ?auto_39668 ?auto_39669 ) ) ( not ( = ?auto_39672 ?auto_39668 ) ) ( not ( = ?auto_39672 ?auto_39669 ) ) ( not ( = ?auto_39674 ?auto_39673 ) ) ( HOIST-AT ?auto_39676 ?auto_39674 ) ( not ( = ?auto_39675 ?auto_39676 ) ) ( SURFACE-AT ?auto_39669 ?auto_39674 ) ( ON ?auto_39669 ?auto_39670 ) ( CLEAR ?auto_39669 ) ( not ( = ?auto_39668 ?auto_39670 ) ) ( not ( = ?auto_39669 ?auto_39670 ) ) ( not ( = ?auto_39672 ?auto_39670 ) ) ( SURFACE-AT ?auto_39672 ?auto_39673 ) ( CLEAR ?auto_39672 ) ( IS-CRATE ?auto_39668 ) ( AVAILABLE ?auto_39675 ) ( TRUCK-AT ?auto_39671 ?auto_39674 ) ( LIFTING ?auto_39676 ?auto_39668 ) )
    :subtasks
    ( ( !LOAD ?auto_39676 ?auto_39668 ?auto_39671 ?auto_39674 )
      ( MAKE-2CRATE ?auto_39672 ?auto_39668 ?auto_39669 )
      ( MAKE-1CRATE-VERIFY ?auto_39668 ?auto_39669 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_39677 - SURFACE
      ?auto_39678 - SURFACE
      ?auto_39679 - SURFACE
    )
    :vars
    (
      ?auto_39682 - HOIST
      ?auto_39681 - PLACE
      ?auto_39684 - PLACE
      ?auto_39680 - HOIST
      ?auto_39685 - SURFACE
      ?auto_39683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39682 ?auto_39681 ) ( IS-CRATE ?auto_39679 ) ( not ( = ?auto_39678 ?auto_39679 ) ) ( not ( = ?auto_39677 ?auto_39678 ) ) ( not ( = ?auto_39677 ?auto_39679 ) ) ( not ( = ?auto_39684 ?auto_39681 ) ) ( HOIST-AT ?auto_39680 ?auto_39684 ) ( not ( = ?auto_39682 ?auto_39680 ) ) ( SURFACE-AT ?auto_39679 ?auto_39684 ) ( ON ?auto_39679 ?auto_39685 ) ( CLEAR ?auto_39679 ) ( not ( = ?auto_39678 ?auto_39685 ) ) ( not ( = ?auto_39679 ?auto_39685 ) ) ( not ( = ?auto_39677 ?auto_39685 ) ) ( SURFACE-AT ?auto_39677 ?auto_39681 ) ( CLEAR ?auto_39677 ) ( IS-CRATE ?auto_39678 ) ( AVAILABLE ?auto_39682 ) ( TRUCK-AT ?auto_39683 ?auto_39684 ) ( LIFTING ?auto_39680 ?auto_39678 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_39678 ?auto_39679 )
      ( MAKE-2CRATE-VERIFY ?auto_39677 ?auto_39678 ?auto_39679 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_39687 - SURFACE
      ?auto_39688 - SURFACE
      ?auto_39689 - SURFACE
      ?auto_39686 - SURFACE
    )
    :vars
    (
      ?auto_39692 - HOIST
      ?auto_39690 - PLACE
      ?auto_39695 - PLACE
      ?auto_39693 - HOIST
      ?auto_39691 - SURFACE
      ?auto_39694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39692 ?auto_39690 ) ( IS-CRATE ?auto_39686 ) ( not ( = ?auto_39689 ?auto_39686 ) ) ( not ( = ?auto_39688 ?auto_39689 ) ) ( not ( = ?auto_39688 ?auto_39686 ) ) ( not ( = ?auto_39695 ?auto_39690 ) ) ( HOIST-AT ?auto_39693 ?auto_39695 ) ( not ( = ?auto_39692 ?auto_39693 ) ) ( SURFACE-AT ?auto_39686 ?auto_39695 ) ( ON ?auto_39686 ?auto_39691 ) ( CLEAR ?auto_39686 ) ( not ( = ?auto_39689 ?auto_39691 ) ) ( not ( = ?auto_39686 ?auto_39691 ) ) ( not ( = ?auto_39688 ?auto_39691 ) ) ( SURFACE-AT ?auto_39688 ?auto_39690 ) ( CLEAR ?auto_39688 ) ( IS-CRATE ?auto_39689 ) ( AVAILABLE ?auto_39692 ) ( TRUCK-AT ?auto_39694 ?auto_39695 ) ( LIFTING ?auto_39693 ?auto_39689 ) ( ON ?auto_39688 ?auto_39687 ) ( not ( = ?auto_39687 ?auto_39688 ) ) ( not ( = ?auto_39687 ?auto_39689 ) ) ( not ( = ?auto_39687 ?auto_39686 ) ) ( not ( = ?auto_39687 ?auto_39691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39688 ?auto_39689 ?auto_39686 )
      ( MAKE-3CRATE-VERIFY ?auto_39687 ?auto_39688 ?auto_39689 ?auto_39686 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39697 - SURFACE
      ?auto_39698 - SURFACE
      ?auto_39699 - SURFACE
      ?auto_39696 - SURFACE
      ?auto_39700 - SURFACE
    )
    :vars
    (
      ?auto_39703 - HOIST
      ?auto_39701 - PLACE
      ?auto_39706 - PLACE
      ?auto_39704 - HOIST
      ?auto_39702 - SURFACE
      ?auto_39705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39703 ?auto_39701 ) ( IS-CRATE ?auto_39700 ) ( not ( = ?auto_39696 ?auto_39700 ) ) ( not ( = ?auto_39699 ?auto_39696 ) ) ( not ( = ?auto_39699 ?auto_39700 ) ) ( not ( = ?auto_39706 ?auto_39701 ) ) ( HOIST-AT ?auto_39704 ?auto_39706 ) ( not ( = ?auto_39703 ?auto_39704 ) ) ( SURFACE-AT ?auto_39700 ?auto_39706 ) ( ON ?auto_39700 ?auto_39702 ) ( CLEAR ?auto_39700 ) ( not ( = ?auto_39696 ?auto_39702 ) ) ( not ( = ?auto_39700 ?auto_39702 ) ) ( not ( = ?auto_39699 ?auto_39702 ) ) ( SURFACE-AT ?auto_39699 ?auto_39701 ) ( CLEAR ?auto_39699 ) ( IS-CRATE ?auto_39696 ) ( AVAILABLE ?auto_39703 ) ( TRUCK-AT ?auto_39705 ?auto_39706 ) ( LIFTING ?auto_39704 ?auto_39696 ) ( ON ?auto_39698 ?auto_39697 ) ( ON ?auto_39699 ?auto_39698 ) ( not ( = ?auto_39697 ?auto_39698 ) ) ( not ( = ?auto_39697 ?auto_39699 ) ) ( not ( = ?auto_39697 ?auto_39696 ) ) ( not ( = ?auto_39697 ?auto_39700 ) ) ( not ( = ?auto_39697 ?auto_39702 ) ) ( not ( = ?auto_39698 ?auto_39699 ) ) ( not ( = ?auto_39698 ?auto_39696 ) ) ( not ( = ?auto_39698 ?auto_39700 ) ) ( not ( = ?auto_39698 ?auto_39702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39699 ?auto_39696 ?auto_39700 )
      ( MAKE-4CRATE-VERIFY ?auto_39697 ?auto_39698 ?auto_39699 ?auto_39696 ?auto_39700 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_39707 - SURFACE
      ?auto_39708 - SURFACE
    )
    :vars
    (
      ?auto_39712 - HOIST
      ?auto_39709 - PLACE
      ?auto_39711 - SURFACE
      ?auto_39715 - PLACE
      ?auto_39713 - HOIST
      ?auto_39710 - SURFACE
      ?auto_39714 - TRUCK
      ?auto_39716 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39712 ?auto_39709 ) ( IS-CRATE ?auto_39708 ) ( not ( = ?auto_39707 ?auto_39708 ) ) ( not ( = ?auto_39711 ?auto_39707 ) ) ( not ( = ?auto_39711 ?auto_39708 ) ) ( not ( = ?auto_39715 ?auto_39709 ) ) ( HOIST-AT ?auto_39713 ?auto_39715 ) ( not ( = ?auto_39712 ?auto_39713 ) ) ( SURFACE-AT ?auto_39708 ?auto_39715 ) ( ON ?auto_39708 ?auto_39710 ) ( CLEAR ?auto_39708 ) ( not ( = ?auto_39707 ?auto_39710 ) ) ( not ( = ?auto_39708 ?auto_39710 ) ) ( not ( = ?auto_39711 ?auto_39710 ) ) ( SURFACE-AT ?auto_39711 ?auto_39709 ) ( CLEAR ?auto_39711 ) ( IS-CRATE ?auto_39707 ) ( AVAILABLE ?auto_39712 ) ( TRUCK-AT ?auto_39714 ?auto_39715 ) ( AVAILABLE ?auto_39713 ) ( SURFACE-AT ?auto_39707 ?auto_39715 ) ( ON ?auto_39707 ?auto_39716 ) ( CLEAR ?auto_39707 ) ( not ( = ?auto_39707 ?auto_39716 ) ) ( not ( = ?auto_39708 ?auto_39716 ) ) ( not ( = ?auto_39711 ?auto_39716 ) ) ( not ( = ?auto_39710 ?auto_39716 ) ) )
    :subtasks
    ( ( !LIFT ?auto_39713 ?auto_39707 ?auto_39716 ?auto_39715 )
      ( MAKE-2CRATE ?auto_39711 ?auto_39707 ?auto_39708 )
      ( MAKE-1CRATE-VERIFY ?auto_39707 ?auto_39708 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_39717 - SURFACE
      ?auto_39718 - SURFACE
      ?auto_39719 - SURFACE
    )
    :vars
    (
      ?auto_39726 - HOIST
      ?auto_39721 - PLACE
      ?auto_39723 - PLACE
      ?auto_39720 - HOIST
      ?auto_39724 - SURFACE
      ?auto_39725 - TRUCK
      ?auto_39722 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39726 ?auto_39721 ) ( IS-CRATE ?auto_39719 ) ( not ( = ?auto_39718 ?auto_39719 ) ) ( not ( = ?auto_39717 ?auto_39718 ) ) ( not ( = ?auto_39717 ?auto_39719 ) ) ( not ( = ?auto_39723 ?auto_39721 ) ) ( HOIST-AT ?auto_39720 ?auto_39723 ) ( not ( = ?auto_39726 ?auto_39720 ) ) ( SURFACE-AT ?auto_39719 ?auto_39723 ) ( ON ?auto_39719 ?auto_39724 ) ( CLEAR ?auto_39719 ) ( not ( = ?auto_39718 ?auto_39724 ) ) ( not ( = ?auto_39719 ?auto_39724 ) ) ( not ( = ?auto_39717 ?auto_39724 ) ) ( SURFACE-AT ?auto_39717 ?auto_39721 ) ( CLEAR ?auto_39717 ) ( IS-CRATE ?auto_39718 ) ( AVAILABLE ?auto_39726 ) ( TRUCK-AT ?auto_39725 ?auto_39723 ) ( AVAILABLE ?auto_39720 ) ( SURFACE-AT ?auto_39718 ?auto_39723 ) ( ON ?auto_39718 ?auto_39722 ) ( CLEAR ?auto_39718 ) ( not ( = ?auto_39718 ?auto_39722 ) ) ( not ( = ?auto_39719 ?auto_39722 ) ) ( not ( = ?auto_39717 ?auto_39722 ) ) ( not ( = ?auto_39724 ?auto_39722 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_39718 ?auto_39719 )
      ( MAKE-2CRATE-VERIFY ?auto_39717 ?auto_39718 ?auto_39719 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_39728 - SURFACE
      ?auto_39729 - SURFACE
      ?auto_39730 - SURFACE
      ?auto_39727 - SURFACE
    )
    :vars
    (
      ?auto_39731 - HOIST
      ?auto_39735 - PLACE
      ?auto_39737 - PLACE
      ?auto_39732 - HOIST
      ?auto_39733 - SURFACE
      ?auto_39736 - TRUCK
      ?auto_39734 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39731 ?auto_39735 ) ( IS-CRATE ?auto_39727 ) ( not ( = ?auto_39730 ?auto_39727 ) ) ( not ( = ?auto_39729 ?auto_39730 ) ) ( not ( = ?auto_39729 ?auto_39727 ) ) ( not ( = ?auto_39737 ?auto_39735 ) ) ( HOIST-AT ?auto_39732 ?auto_39737 ) ( not ( = ?auto_39731 ?auto_39732 ) ) ( SURFACE-AT ?auto_39727 ?auto_39737 ) ( ON ?auto_39727 ?auto_39733 ) ( CLEAR ?auto_39727 ) ( not ( = ?auto_39730 ?auto_39733 ) ) ( not ( = ?auto_39727 ?auto_39733 ) ) ( not ( = ?auto_39729 ?auto_39733 ) ) ( SURFACE-AT ?auto_39729 ?auto_39735 ) ( CLEAR ?auto_39729 ) ( IS-CRATE ?auto_39730 ) ( AVAILABLE ?auto_39731 ) ( TRUCK-AT ?auto_39736 ?auto_39737 ) ( AVAILABLE ?auto_39732 ) ( SURFACE-AT ?auto_39730 ?auto_39737 ) ( ON ?auto_39730 ?auto_39734 ) ( CLEAR ?auto_39730 ) ( not ( = ?auto_39730 ?auto_39734 ) ) ( not ( = ?auto_39727 ?auto_39734 ) ) ( not ( = ?auto_39729 ?auto_39734 ) ) ( not ( = ?auto_39733 ?auto_39734 ) ) ( ON ?auto_39729 ?auto_39728 ) ( not ( = ?auto_39728 ?auto_39729 ) ) ( not ( = ?auto_39728 ?auto_39730 ) ) ( not ( = ?auto_39728 ?auto_39727 ) ) ( not ( = ?auto_39728 ?auto_39733 ) ) ( not ( = ?auto_39728 ?auto_39734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39729 ?auto_39730 ?auto_39727 )
      ( MAKE-3CRATE-VERIFY ?auto_39728 ?auto_39729 ?auto_39730 ?auto_39727 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39739 - SURFACE
      ?auto_39740 - SURFACE
      ?auto_39741 - SURFACE
      ?auto_39738 - SURFACE
      ?auto_39742 - SURFACE
    )
    :vars
    (
      ?auto_39743 - HOIST
      ?auto_39747 - PLACE
      ?auto_39749 - PLACE
      ?auto_39744 - HOIST
      ?auto_39745 - SURFACE
      ?auto_39748 - TRUCK
      ?auto_39746 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39743 ?auto_39747 ) ( IS-CRATE ?auto_39742 ) ( not ( = ?auto_39738 ?auto_39742 ) ) ( not ( = ?auto_39741 ?auto_39738 ) ) ( not ( = ?auto_39741 ?auto_39742 ) ) ( not ( = ?auto_39749 ?auto_39747 ) ) ( HOIST-AT ?auto_39744 ?auto_39749 ) ( not ( = ?auto_39743 ?auto_39744 ) ) ( SURFACE-AT ?auto_39742 ?auto_39749 ) ( ON ?auto_39742 ?auto_39745 ) ( CLEAR ?auto_39742 ) ( not ( = ?auto_39738 ?auto_39745 ) ) ( not ( = ?auto_39742 ?auto_39745 ) ) ( not ( = ?auto_39741 ?auto_39745 ) ) ( SURFACE-AT ?auto_39741 ?auto_39747 ) ( CLEAR ?auto_39741 ) ( IS-CRATE ?auto_39738 ) ( AVAILABLE ?auto_39743 ) ( TRUCK-AT ?auto_39748 ?auto_39749 ) ( AVAILABLE ?auto_39744 ) ( SURFACE-AT ?auto_39738 ?auto_39749 ) ( ON ?auto_39738 ?auto_39746 ) ( CLEAR ?auto_39738 ) ( not ( = ?auto_39738 ?auto_39746 ) ) ( not ( = ?auto_39742 ?auto_39746 ) ) ( not ( = ?auto_39741 ?auto_39746 ) ) ( not ( = ?auto_39745 ?auto_39746 ) ) ( ON ?auto_39740 ?auto_39739 ) ( ON ?auto_39741 ?auto_39740 ) ( not ( = ?auto_39739 ?auto_39740 ) ) ( not ( = ?auto_39739 ?auto_39741 ) ) ( not ( = ?auto_39739 ?auto_39738 ) ) ( not ( = ?auto_39739 ?auto_39742 ) ) ( not ( = ?auto_39739 ?auto_39745 ) ) ( not ( = ?auto_39739 ?auto_39746 ) ) ( not ( = ?auto_39740 ?auto_39741 ) ) ( not ( = ?auto_39740 ?auto_39738 ) ) ( not ( = ?auto_39740 ?auto_39742 ) ) ( not ( = ?auto_39740 ?auto_39745 ) ) ( not ( = ?auto_39740 ?auto_39746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39741 ?auto_39738 ?auto_39742 )
      ( MAKE-4CRATE-VERIFY ?auto_39739 ?auto_39740 ?auto_39741 ?auto_39738 ?auto_39742 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_39750 - SURFACE
      ?auto_39751 - SURFACE
    )
    :vars
    (
      ?auto_39752 - HOIST
      ?auto_39757 - PLACE
      ?auto_39755 - SURFACE
      ?auto_39759 - PLACE
      ?auto_39753 - HOIST
      ?auto_39754 - SURFACE
      ?auto_39756 - SURFACE
      ?auto_39758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39752 ?auto_39757 ) ( IS-CRATE ?auto_39751 ) ( not ( = ?auto_39750 ?auto_39751 ) ) ( not ( = ?auto_39755 ?auto_39750 ) ) ( not ( = ?auto_39755 ?auto_39751 ) ) ( not ( = ?auto_39759 ?auto_39757 ) ) ( HOIST-AT ?auto_39753 ?auto_39759 ) ( not ( = ?auto_39752 ?auto_39753 ) ) ( SURFACE-AT ?auto_39751 ?auto_39759 ) ( ON ?auto_39751 ?auto_39754 ) ( CLEAR ?auto_39751 ) ( not ( = ?auto_39750 ?auto_39754 ) ) ( not ( = ?auto_39751 ?auto_39754 ) ) ( not ( = ?auto_39755 ?auto_39754 ) ) ( SURFACE-AT ?auto_39755 ?auto_39757 ) ( CLEAR ?auto_39755 ) ( IS-CRATE ?auto_39750 ) ( AVAILABLE ?auto_39752 ) ( AVAILABLE ?auto_39753 ) ( SURFACE-AT ?auto_39750 ?auto_39759 ) ( ON ?auto_39750 ?auto_39756 ) ( CLEAR ?auto_39750 ) ( not ( = ?auto_39750 ?auto_39756 ) ) ( not ( = ?auto_39751 ?auto_39756 ) ) ( not ( = ?auto_39755 ?auto_39756 ) ) ( not ( = ?auto_39754 ?auto_39756 ) ) ( TRUCK-AT ?auto_39758 ?auto_39757 ) )
    :subtasks
    ( ( !DRIVE ?auto_39758 ?auto_39757 ?auto_39759 )
      ( MAKE-2CRATE ?auto_39755 ?auto_39750 ?auto_39751 )
      ( MAKE-1CRATE-VERIFY ?auto_39750 ?auto_39751 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_39760 - SURFACE
      ?auto_39761 - SURFACE
      ?auto_39762 - SURFACE
    )
    :vars
    (
      ?auto_39765 - HOIST
      ?auto_39763 - PLACE
      ?auto_39764 - PLACE
      ?auto_39768 - HOIST
      ?auto_39767 - SURFACE
      ?auto_39766 - SURFACE
      ?auto_39769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39765 ?auto_39763 ) ( IS-CRATE ?auto_39762 ) ( not ( = ?auto_39761 ?auto_39762 ) ) ( not ( = ?auto_39760 ?auto_39761 ) ) ( not ( = ?auto_39760 ?auto_39762 ) ) ( not ( = ?auto_39764 ?auto_39763 ) ) ( HOIST-AT ?auto_39768 ?auto_39764 ) ( not ( = ?auto_39765 ?auto_39768 ) ) ( SURFACE-AT ?auto_39762 ?auto_39764 ) ( ON ?auto_39762 ?auto_39767 ) ( CLEAR ?auto_39762 ) ( not ( = ?auto_39761 ?auto_39767 ) ) ( not ( = ?auto_39762 ?auto_39767 ) ) ( not ( = ?auto_39760 ?auto_39767 ) ) ( SURFACE-AT ?auto_39760 ?auto_39763 ) ( CLEAR ?auto_39760 ) ( IS-CRATE ?auto_39761 ) ( AVAILABLE ?auto_39765 ) ( AVAILABLE ?auto_39768 ) ( SURFACE-AT ?auto_39761 ?auto_39764 ) ( ON ?auto_39761 ?auto_39766 ) ( CLEAR ?auto_39761 ) ( not ( = ?auto_39761 ?auto_39766 ) ) ( not ( = ?auto_39762 ?auto_39766 ) ) ( not ( = ?auto_39760 ?auto_39766 ) ) ( not ( = ?auto_39767 ?auto_39766 ) ) ( TRUCK-AT ?auto_39769 ?auto_39763 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_39761 ?auto_39762 )
      ( MAKE-2CRATE-VERIFY ?auto_39760 ?auto_39761 ?auto_39762 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_39771 - SURFACE
      ?auto_39772 - SURFACE
      ?auto_39773 - SURFACE
      ?auto_39770 - SURFACE
    )
    :vars
    (
      ?auto_39779 - HOIST
      ?auto_39778 - PLACE
      ?auto_39775 - PLACE
      ?auto_39777 - HOIST
      ?auto_39780 - SURFACE
      ?auto_39774 - SURFACE
      ?auto_39776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39779 ?auto_39778 ) ( IS-CRATE ?auto_39770 ) ( not ( = ?auto_39773 ?auto_39770 ) ) ( not ( = ?auto_39772 ?auto_39773 ) ) ( not ( = ?auto_39772 ?auto_39770 ) ) ( not ( = ?auto_39775 ?auto_39778 ) ) ( HOIST-AT ?auto_39777 ?auto_39775 ) ( not ( = ?auto_39779 ?auto_39777 ) ) ( SURFACE-AT ?auto_39770 ?auto_39775 ) ( ON ?auto_39770 ?auto_39780 ) ( CLEAR ?auto_39770 ) ( not ( = ?auto_39773 ?auto_39780 ) ) ( not ( = ?auto_39770 ?auto_39780 ) ) ( not ( = ?auto_39772 ?auto_39780 ) ) ( SURFACE-AT ?auto_39772 ?auto_39778 ) ( CLEAR ?auto_39772 ) ( IS-CRATE ?auto_39773 ) ( AVAILABLE ?auto_39779 ) ( AVAILABLE ?auto_39777 ) ( SURFACE-AT ?auto_39773 ?auto_39775 ) ( ON ?auto_39773 ?auto_39774 ) ( CLEAR ?auto_39773 ) ( not ( = ?auto_39773 ?auto_39774 ) ) ( not ( = ?auto_39770 ?auto_39774 ) ) ( not ( = ?auto_39772 ?auto_39774 ) ) ( not ( = ?auto_39780 ?auto_39774 ) ) ( TRUCK-AT ?auto_39776 ?auto_39778 ) ( ON ?auto_39772 ?auto_39771 ) ( not ( = ?auto_39771 ?auto_39772 ) ) ( not ( = ?auto_39771 ?auto_39773 ) ) ( not ( = ?auto_39771 ?auto_39770 ) ) ( not ( = ?auto_39771 ?auto_39780 ) ) ( not ( = ?auto_39771 ?auto_39774 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39772 ?auto_39773 ?auto_39770 )
      ( MAKE-3CRATE-VERIFY ?auto_39771 ?auto_39772 ?auto_39773 ?auto_39770 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39782 - SURFACE
      ?auto_39783 - SURFACE
      ?auto_39784 - SURFACE
      ?auto_39781 - SURFACE
      ?auto_39785 - SURFACE
    )
    :vars
    (
      ?auto_39791 - HOIST
      ?auto_39790 - PLACE
      ?auto_39787 - PLACE
      ?auto_39789 - HOIST
      ?auto_39792 - SURFACE
      ?auto_39786 - SURFACE
      ?auto_39788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39791 ?auto_39790 ) ( IS-CRATE ?auto_39785 ) ( not ( = ?auto_39781 ?auto_39785 ) ) ( not ( = ?auto_39784 ?auto_39781 ) ) ( not ( = ?auto_39784 ?auto_39785 ) ) ( not ( = ?auto_39787 ?auto_39790 ) ) ( HOIST-AT ?auto_39789 ?auto_39787 ) ( not ( = ?auto_39791 ?auto_39789 ) ) ( SURFACE-AT ?auto_39785 ?auto_39787 ) ( ON ?auto_39785 ?auto_39792 ) ( CLEAR ?auto_39785 ) ( not ( = ?auto_39781 ?auto_39792 ) ) ( not ( = ?auto_39785 ?auto_39792 ) ) ( not ( = ?auto_39784 ?auto_39792 ) ) ( SURFACE-AT ?auto_39784 ?auto_39790 ) ( CLEAR ?auto_39784 ) ( IS-CRATE ?auto_39781 ) ( AVAILABLE ?auto_39791 ) ( AVAILABLE ?auto_39789 ) ( SURFACE-AT ?auto_39781 ?auto_39787 ) ( ON ?auto_39781 ?auto_39786 ) ( CLEAR ?auto_39781 ) ( not ( = ?auto_39781 ?auto_39786 ) ) ( not ( = ?auto_39785 ?auto_39786 ) ) ( not ( = ?auto_39784 ?auto_39786 ) ) ( not ( = ?auto_39792 ?auto_39786 ) ) ( TRUCK-AT ?auto_39788 ?auto_39790 ) ( ON ?auto_39783 ?auto_39782 ) ( ON ?auto_39784 ?auto_39783 ) ( not ( = ?auto_39782 ?auto_39783 ) ) ( not ( = ?auto_39782 ?auto_39784 ) ) ( not ( = ?auto_39782 ?auto_39781 ) ) ( not ( = ?auto_39782 ?auto_39785 ) ) ( not ( = ?auto_39782 ?auto_39792 ) ) ( not ( = ?auto_39782 ?auto_39786 ) ) ( not ( = ?auto_39783 ?auto_39784 ) ) ( not ( = ?auto_39783 ?auto_39781 ) ) ( not ( = ?auto_39783 ?auto_39785 ) ) ( not ( = ?auto_39783 ?auto_39792 ) ) ( not ( = ?auto_39783 ?auto_39786 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39784 ?auto_39781 ?auto_39785 )
      ( MAKE-4CRATE-VERIFY ?auto_39782 ?auto_39783 ?auto_39784 ?auto_39781 ?auto_39785 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_39793 - SURFACE
      ?auto_39794 - SURFACE
    )
    :vars
    (
      ?auto_39800 - HOIST
      ?auto_39799 - PLACE
      ?auto_39802 - SURFACE
      ?auto_39796 - PLACE
      ?auto_39798 - HOIST
      ?auto_39801 - SURFACE
      ?auto_39795 - SURFACE
      ?auto_39797 - TRUCK
      ?auto_39803 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39800 ?auto_39799 ) ( IS-CRATE ?auto_39794 ) ( not ( = ?auto_39793 ?auto_39794 ) ) ( not ( = ?auto_39802 ?auto_39793 ) ) ( not ( = ?auto_39802 ?auto_39794 ) ) ( not ( = ?auto_39796 ?auto_39799 ) ) ( HOIST-AT ?auto_39798 ?auto_39796 ) ( not ( = ?auto_39800 ?auto_39798 ) ) ( SURFACE-AT ?auto_39794 ?auto_39796 ) ( ON ?auto_39794 ?auto_39801 ) ( CLEAR ?auto_39794 ) ( not ( = ?auto_39793 ?auto_39801 ) ) ( not ( = ?auto_39794 ?auto_39801 ) ) ( not ( = ?auto_39802 ?auto_39801 ) ) ( IS-CRATE ?auto_39793 ) ( AVAILABLE ?auto_39798 ) ( SURFACE-AT ?auto_39793 ?auto_39796 ) ( ON ?auto_39793 ?auto_39795 ) ( CLEAR ?auto_39793 ) ( not ( = ?auto_39793 ?auto_39795 ) ) ( not ( = ?auto_39794 ?auto_39795 ) ) ( not ( = ?auto_39802 ?auto_39795 ) ) ( not ( = ?auto_39801 ?auto_39795 ) ) ( TRUCK-AT ?auto_39797 ?auto_39799 ) ( SURFACE-AT ?auto_39803 ?auto_39799 ) ( CLEAR ?auto_39803 ) ( LIFTING ?auto_39800 ?auto_39802 ) ( IS-CRATE ?auto_39802 ) ( not ( = ?auto_39803 ?auto_39802 ) ) ( not ( = ?auto_39793 ?auto_39803 ) ) ( not ( = ?auto_39794 ?auto_39803 ) ) ( not ( = ?auto_39801 ?auto_39803 ) ) ( not ( = ?auto_39795 ?auto_39803 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_39803 ?auto_39802 )
      ( MAKE-2CRATE ?auto_39802 ?auto_39793 ?auto_39794 )
      ( MAKE-1CRATE-VERIFY ?auto_39793 ?auto_39794 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_39804 - SURFACE
      ?auto_39805 - SURFACE
      ?auto_39806 - SURFACE
    )
    :vars
    (
      ?auto_39813 - HOIST
      ?auto_39810 - PLACE
      ?auto_39812 - PLACE
      ?auto_39809 - HOIST
      ?auto_39811 - SURFACE
      ?auto_39814 - SURFACE
      ?auto_39807 - TRUCK
      ?auto_39808 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39813 ?auto_39810 ) ( IS-CRATE ?auto_39806 ) ( not ( = ?auto_39805 ?auto_39806 ) ) ( not ( = ?auto_39804 ?auto_39805 ) ) ( not ( = ?auto_39804 ?auto_39806 ) ) ( not ( = ?auto_39812 ?auto_39810 ) ) ( HOIST-AT ?auto_39809 ?auto_39812 ) ( not ( = ?auto_39813 ?auto_39809 ) ) ( SURFACE-AT ?auto_39806 ?auto_39812 ) ( ON ?auto_39806 ?auto_39811 ) ( CLEAR ?auto_39806 ) ( not ( = ?auto_39805 ?auto_39811 ) ) ( not ( = ?auto_39806 ?auto_39811 ) ) ( not ( = ?auto_39804 ?auto_39811 ) ) ( IS-CRATE ?auto_39805 ) ( AVAILABLE ?auto_39809 ) ( SURFACE-AT ?auto_39805 ?auto_39812 ) ( ON ?auto_39805 ?auto_39814 ) ( CLEAR ?auto_39805 ) ( not ( = ?auto_39805 ?auto_39814 ) ) ( not ( = ?auto_39806 ?auto_39814 ) ) ( not ( = ?auto_39804 ?auto_39814 ) ) ( not ( = ?auto_39811 ?auto_39814 ) ) ( TRUCK-AT ?auto_39807 ?auto_39810 ) ( SURFACE-AT ?auto_39808 ?auto_39810 ) ( CLEAR ?auto_39808 ) ( LIFTING ?auto_39813 ?auto_39804 ) ( IS-CRATE ?auto_39804 ) ( not ( = ?auto_39808 ?auto_39804 ) ) ( not ( = ?auto_39805 ?auto_39808 ) ) ( not ( = ?auto_39806 ?auto_39808 ) ) ( not ( = ?auto_39811 ?auto_39808 ) ) ( not ( = ?auto_39814 ?auto_39808 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_39805 ?auto_39806 )
      ( MAKE-2CRATE-VERIFY ?auto_39804 ?auto_39805 ?auto_39806 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_39816 - SURFACE
      ?auto_39817 - SURFACE
      ?auto_39818 - SURFACE
      ?auto_39815 - SURFACE
    )
    :vars
    (
      ?auto_39822 - HOIST
      ?auto_39825 - PLACE
      ?auto_39820 - PLACE
      ?auto_39824 - HOIST
      ?auto_39823 - SURFACE
      ?auto_39821 - SURFACE
      ?auto_39819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39822 ?auto_39825 ) ( IS-CRATE ?auto_39815 ) ( not ( = ?auto_39818 ?auto_39815 ) ) ( not ( = ?auto_39817 ?auto_39818 ) ) ( not ( = ?auto_39817 ?auto_39815 ) ) ( not ( = ?auto_39820 ?auto_39825 ) ) ( HOIST-AT ?auto_39824 ?auto_39820 ) ( not ( = ?auto_39822 ?auto_39824 ) ) ( SURFACE-AT ?auto_39815 ?auto_39820 ) ( ON ?auto_39815 ?auto_39823 ) ( CLEAR ?auto_39815 ) ( not ( = ?auto_39818 ?auto_39823 ) ) ( not ( = ?auto_39815 ?auto_39823 ) ) ( not ( = ?auto_39817 ?auto_39823 ) ) ( IS-CRATE ?auto_39818 ) ( AVAILABLE ?auto_39824 ) ( SURFACE-AT ?auto_39818 ?auto_39820 ) ( ON ?auto_39818 ?auto_39821 ) ( CLEAR ?auto_39818 ) ( not ( = ?auto_39818 ?auto_39821 ) ) ( not ( = ?auto_39815 ?auto_39821 ) ) ( not ( = ?auto_39817 ?auto_39821 ) ) ( not ( = ?auto_39823 ?auto_39821 ) ) ( TRUCK-AT ?auto_39819 ?auto_39825 ) ( SURFACE-AT ?auto_39816 ?auto_39825 ) ( CLEAR ?auto_39816 ) ( LIFTING ?auto_39822 ?auto_39817 ) ( IS-CRATE ?auto_39817 ) ( not ( = ?auto_39816 ?auto_39817 ) ) ( not ( = ?auto_39818 ?auto_39816 ) ) ( not ( = ?auto_39815 ?auto_39816 ) ) ( not ( = ?auto_39823 ?auto_39816 ) ) ( not ( = ?auto_39821 ?auto_39816 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39817 ?auto_39818 ?auto_39815 )
      ( MAKE-3CRATE-VERIFY ?auto_39816 ?auto_39817 ?auto_39818 ?auto_39815 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39827 - SURFACE
      ?auto_39828 - SURFACE
      ?auto_39829 - SURFACE
      ?auto_39826 - SURFACE
      ?auto_39830 - SURFACE
    )
    :vars
    (
      ?auto_39834 - HOIST
      ?auto_39837 - PLACE
      ?auto_39832 - PLACE
      ?auto_39836 - HOIST
      ?auto_39835 - SURFACE
      ?auto_39833 - SURFACE
      ?auto_39831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39834 ?auto_39837 ) ( IS-CRATE ?auto_39830 ) ( not ( = ?auto_39826 ?auto_39830 ) ) ( not ( = ?auto_39829 ?auto_39826 ) ) ( not ( = ?auto_39829 ?auto_39830 ) ) ( not ( = ?auto_39832 ?auto_39837 ) ) ( HOIST-AT ?auto_39836 ?auto_39832 ) ( not ( = ?auto_39834 ?auto_39836 ) ) ( SURFACE-AT ?auto_39830 ?auto_39832 ) ( ON ?auto_39830 ?auto_39835 ) ( CLEAR ?auto_39830 ) ( not ( = ?auto_39826 ?auto_39835 ) ) ( not ( = ?auto_39830 ?auto_39835 ) ) ( not ( = ?auto_39829 ?auto_39835 ) ) ( IS-CRATE ?auto_39826 ) ( AVAILABLE ?auto_39836 ) ( SURFACE-AT ?auto_39826 ?auto_39832 ) ( ON ?auto_39826 ?auto_39833 ) ( CLEAR ?auto_39826 ) ( not ( = ?auto_39826 ?auto_39833 ) ) ( not ( = ?auto_39830 ?auto_39833 ) ) ( not ( = ?auto_39829 ?auto_39833 ) ) ( not ( = ?auto_39835 ?auto_39833 ) ) ( TRUCK-AT ?auto_39831 ?auto_39837 ) ( SURFACE-AT ?auto_39828 ?auto_39837 ) ( CLEAR ?auto_39828 ) ( LIFTING ?auto_39834 ?auto_39829 ) ( IS-CRATE ?auto_39829 ) ( not ( = ?auto_39828 ?auto_39829 ) ) ( not ( = ?auto_39826 ?auto_39828 ) ) ( not ( = ?auto_39830 ?auto_39828 ) ) ( not ( = ?auto_39835 ?auto_39828 ) ) ( not ( = ?auto_39833 ?auto_39828 ) ) ( ON ?auto_39828 ?auto_39827 ) ( not ( = ?auto_39827 ?auto_39828 ) ) ( not ( = ?auto_39827 ?auto_39829 ) ) ( not ( = ?auto_39827 ?auto_39826 ) ) ( not ( = ?auto_39827 ?auto_39830 ) ) ( not ( = ?auto_39827 ?auto_39835 ) ) ( not ( = ?auto_39827 ?auto_39833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39829 ?auto_39826 ?auto_39830 )
      ( MAKE-4CRATE-VERIFY ?auto_39827 ?auto_39828 ?auto_39829 ?auto_39826 ?auto_39830 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40274 - SURFACE
      ?auto_40275 - SURFACE
      ?auto_40276 - SURFACE
      ?auto_40273 - SURFACE
      ?auto_40277 - SURFACE
      ?auto_40278 - SURFACE
    )
    :vars
    (
      ?auto_40279 - HOIST
      ?auto_40280 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40279 ?auto_40280 ) ( SURFACE-AT ?auto_40277 ?auto_40280 ) ( CLEAR ?auto_40277 ) ( LIFTING ?auto_40279 ?auto_40278 ) ( IS-CRATE ?auto_40278 ) ( not ( = ?auto_40277 ?auto_40278 ) ) ( ON ?auto_40275 ?auto_40274 ) ( ON ?auto_40276 ?auto_40275 ) ( ON ?auto_40273 ?auto_40276 ) ( ON ?auto_40277 ?auto_40273 ) ( not ( = ?auto_40274 ?auto_40275 ) ) ( not ( = ?auto_40274 ?auto_40276 ) ) ( not ( = ?auto_40274 ?auto_40273 ) ) ( not ( = ?auto_40274 ?auto_40277 ) ) ( not ( = ?auto_40274 ?auto_40278 ) ) ( not ( = ?auto_40275 ?auto_40276 ) ) ( not ( = ?auto_40275 ?auto_40273 ) ) ( not ( = ?auto_40275 ?auto_40277 ) ) ( not ( = ?auto_40275 ?auto_40278 ) ) ( not ( = ?auto_40276 ?auto_40273 ) ) ( not ( = ?auto_40276 ?auto_40277 ) ) ( not ( = ?auto_40276 ?auto_40278 ) ) ( not ( = ?auto_40273 ?auto_40277 ) ) ( not ( = ?auto_40273 ?auto_40278 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_40277 ?auto_40278 )
      ( MAKE-5CRATE-VERIFY ?auto_40274 ?auto_40275 ?auto_40276 ?auto_40273 ?auto_40277 ?auto_40278 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40308 - SURFACE
      ?auto_40309 - SURFACE
      ?auto_40310 - SURFACE
      ?auto_40307 - SURFACE
      ?auto_40311 - SURFACE
      ?auto_40312 - SURFACE
    )
    :vars
    (
      ?auto_40315 - HOIST
      ?auto_40313 - PLACE
      ?auto_40314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40315 ?auto_40313 ) ( SURFACE-AT ?auto_40311 ?auto_40313 ) ( CLEAR ?auto_40311 ) ( IS-CRATE ?auto_40312 ) ( not ( = ?auto_40311 ?auto_40312 ) ) ( TRUCK-AT ?auto_40314 ?auto_40313 ) ( AVAILABLE ?auto_40315 ) ( IN ?auto_40312 ?auto_40314 ) ( ON ?auto_40311 ?auto_40307 ) ( not ( = ?auto_40307 ?auto_40311 ) ) ( not ( = ?auto_40307 ?auto_40312 ) ) ( ON ?auto_40309 ?auto_40308 ) ( ON ?auto_40310 ?auto_40309 ) ( ON ?auto_40307 ?auto_40310 ) ( not ( = ?auto_40308 ?auto_40309 ) ) ( not ( = ?auto_40308 ?auto_40310 ) ) ( not ( = ?auto_40308 ?auto_40307 ) ) ( not ( = ?auto_40308 ?auto_40311 ) ) ( not ( = ?auto_40308 ?auto_40312 ) ) ( not ( = ?auto_40309 ?auto_40310 ) ) ( not ( = ?auto_40309 ?auto_40307 ) ) ( not ( = ?auto_40309 ?auto_40311 ) ) ( not ( = ?auto_40309 ?auto_40312 ) ) ( not ( = ?auto_40310 ?auto_40307 ) ) ( not ( = ?auto_40310 ?auto_40311 ) ) ( not ( = ?auto_40310 ?auto_40312 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40307 ?auto_40311 ?auto_40312 )
      ( MAKE-5CRATE-VERIFY ?auto_40308 ?auto_40309 ?auto_40310 ?auto_40307 ?auto_40311 ?auto_40312 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40348 - SURFACE
      ?auto_40349 - SURFACE
      ?auto_40350 - SURFACE
      ?auto_40347 - SURFACE
      ?auto_40351 - SURFACE
      ?auto_40352 - SURFACE
    )
    :vars
    (
      ?auto_40355 - HOIST
      ?auto_40353 - PLACE
      ?auto_40356 - TRUCK
      ?auto_40354 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40355 ?auto_40353 ) ( SURFACE-AT ?auto_40351 ?auto_40353 ) ( CLEAR ?auto_40351 ) ( IS-CRATE ?auto_40352 ) ( not ( = ?auto_40351 ?auto_40352 ) ) ( AVAILABLE ?auto_40355 ) ( IN ?auto_40352 ?auto_40356 ) ( ON ?auto_40351 ?auto_40347 ) ( not ( = ?auto_40347 ?auto_40351 ) ) ( not ( = ?auto_40347 ?auto_40352 ) ) ( TRUCK-AT ?auto_40356 ?auto_40354 ) ( not ( = ?auto_40354 ?auto_40353 ) ) ( ON ?auto_40349 ?auto_40348 ) ( ON ?auto_40350 ?auto_40349 ) ( ON ?auto_40347 ?auto_40350 ) ( not ( = ?auto_40348 ?auto_40349 ) ) ( not ( = ?auto_40348 ?auto_40350 ) ) ( not ( = ?auto_40348 ?auto_40347 ) ) ( not ( = ?auto_40348 ?auto_40351 ) ) ( not ( = ?auto_40348 ?auto_40352 ) ) ( not ( = ?auto_40349 ?auto_40350 ) ) ( not ( = ?auto_40349 ?auto_40347 ) ) ( not ( = ?auto_40349 ?auto_40351 ) ) ( not ( = ?auto_40349 ?auto_40352 ) ) ( not ( = ?auto_40350 ?auto_40347 ) ) ( not ( = ?auto_40350 ?auto_40351 ) ) ( not ( = ?auto_40350 ?auto_40352 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40347 ?auto_40351 ?auto_40352 )
      ( MAKE-5CRATE-VERIFY ?auto_40348 ?auto_40349 ?auto_40350 ?auto_40347 ?auto_40351 ?auto_40352 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40393 - SURFACE
      ?auto_40394 - SURFACE
      ?auto_40395 - SURFACE
      ?auto_40392 - SURFACE
      ?auto_40396 - SURFACE
      ?auto_40397 - SURFACE
    )
    :vars
    (
      ?auto_40401 - HOIST
      ?auto_40399 - PLACE
      ?auto_40402 - TRUCK
      ?auto_40398 - PLACE
      ?auto_40400 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_40401 ?auto_40399 ) ( SURFACE-AT ?auto_40396 ?auto_40399 ) ( CLEAR ?auto_40396 ) ( IS-CRATE ?auto_40397 ) ( not ( = ?auto_40396 ?auto_40397 ) ) ( AVAILABLE ?auto_40401 ) ( ON ?auto_40396 ?auto_40392 ) ( not ( = ?auto_40392 ?auto_40396 ) ) ( not ( = ?auto_40392 ?auto_40397 ) ) ( TRUCK-AT ?auto_40402 ?auto_40398 ) ( not ( = ?auto_40398 ?auto_40399 ) ) ( HOIST-AT ?auto_40400 ?auto_40398 ) ( LIFTING ?auto_40400 ?auto_40397 ) ( not ( = ?auto_40401 ?auto_40400 ) ) ( ON ?auto_40394 ?auto_40393 ) ( ON ?auto_40395 ?auto_40394 ) ( ON ?auto_40392 ?auto_40395 ) ( not ( = ?auto_40393 ?auto_40394 ) ) ( not ( = ?auto_40393 ?auto_40395 ) ) ( not ( = ?auto_40393 ?auto_40392 ) ) ( not ( = ?auto_40393 ?auto_40396 ) ) ( not ( = ?auto_40393 ?auto_40397 ) ) ( not ( = ?auto_40394 ?auto_40395 ) ) ( not ( = ?auto_40394 ?auto_40392 ) ) ( not ( = ?auto_40394 ?auto_40396 ) ) ( not ( = ?auto_40394 ?auto_40397 ) ) ( not ( = ?auto_40395 ?auto_40392 ) ) ( not ( = ?auto_40395 ?auto_40396 ) ) ( not ( = ?auto_40395 ?auto_40397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40392 ?auto_40396 ?auto_40397 )
      ( MAKE-5CRATE-VERIFY ?auto_40393 ?auto_40394 ?auto_40395 ?auto_40392 ?auto_40396 ?auto_40397 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40443 - SURFACE
      ?auto_40444 - SURFACE
      ?auto_40445 - SURFACE
      ?auto_40442 - SURFACE
      ?auto_40446 - SURFACE
      ?auto_40447 - SURFACE
    )
    :vars
    (
      ?auto_40451 - HOIST
      ?auto_40449 - PLACE
      ?auto_40453 - TRUCK
      ?auto_40448 - PLACE
      ?auto_40450 - HOIST
      ?auto_40452 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40451 ?auto_40449 ) ( SURFACE-AT ?auto_40446 ?auto_40449 ) ( CLEAR ?auto_40446 ) ( IS-CRATE ?auto_40447 ) ( not ( = ?auto_40446 ?auto_40447 ) ) ( AVAILABLE ?auto_40451 ) ( ON ?auto_40446 ?auto_40442 ) ( not ( = ?auto_40442 ?auto_40446 ) ) ( not ( = ?auto_40442 ?auto_40447 ) ) ( TRUCK-AT ?auto_40453 ?auto_40448 ) ( not ( = ?auto_40448 ?auto_40449 ) ) ( HOIST-AT ?auto_40450 ?auto_40448 ) ( not ( = ?auto_40451 ?auto_40450 ) ) ( AVAILABLE ?auto_40450 ) ( SURFACE-AT ?auto_40447 ?auto_40448 ) ( ON ?auto_40447 ?auto_40452 ) ( CLEAR ?auto_40447 ) ( not ( = ?auto_40446 ?auto_40452 ) ) ( not ( = ?auto_40447 ?auto_40452 ) ) ( not ( = ?auto_40442 ?auto_40452 ) ) ( ON ?auto_40444 ?auto_40443 ) ( ON ?auto_40445 ?auto_40444 ) ( ON ?auto_40442 ?auto_40445 ) ( not ( = ?auto_40443 ?auto_40444 ) ) ( not ( = ?auto_40443 ?auto_40445 ) ) ( not ( = ?auto_40443 ?auto_40442 ) ) ( not ( = ?auto_40443 ?auto_40446 ) ) ( not ( = ?auto_40443 ?auto_40447 ) ) ( not ( = ?auto_40443 ?auto_40452 ) ) ( not ( = ?auto_40444 ?auto_40445 ) ) ( not ( = ?auto_40444 ?auto_40442 ) ) ( not ( = ?auto_40444 ?auto_40446 ) ) ( not ( = ?auto_40444 ?auto_40447 ) ) ( not ( = ?auto_40444 ?auto_40452 ) ) ( not ( = ?auto_40445 ?auto_40442 ) ) ( not ( = ?auto_40445 ?auto_40446 ) ) ( not ( = ?auto_40445 ?auto_40447 ) ) ( not ( = ?auto_40445 ?auto_40452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40442 ?auto_40446 ?auto_40447 )
      ( MAKE-5CRATE-VERIFY ?auto_40443 ?auto_40444 ?auto_40445 ?auto_40442 ?auto_40446 ?auto_40447 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40494 - SURFACE
      ?auto_40495 - SURFACE
      ?auto_40496 - SURFACE
      ?auto_40493 - SURFACE
      ?auto_40497 - SURFACE
      ?auto_40498 - SURFACE
    )
    :vars
    (
      ?auto_40503 - HOIST
      ?auto_40502 - PLACE
      ?auto_40499 - PLACE
      ?auto_40501 - HOIST
      ?auto_40504 - SURFACE
      ?auto_40500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40503 ?auto_40502 ) ( SURFACE-AT ?auto_40497 ?auto_40502 ) ( CLEAR ?auto_40497 ) ( IS-CRATE ?auto_40498 ) ( not ( = ?auto_40497 ?auto_40498 ) ) ( AVAILABLE ?auto_40503 ) ( ON ?auto_40497 ?auto_40493 ) ( not ( = ?auto_40493 ?auto_40497 ) ) ( not ( = ?auto_40493 ?auto_40498 ) ) ( not ( = ?auto_40499 ?auto_40502 ) ) ( HOIST-AT ?auto_40501 ?auto_40499 ) ( not ( = ?auto_40503 ?auto_40501 ) ) ( AVAILABLE ?auto_40501 ) ( SURFACE-AT ?auto_40498 ?auto_40499 ) ( ON ?auto_40498 ?auto_40504 ) ( CLEAR ?auto_40498 ) ( not ( = ?auto_40497 ?auto_40504 ) ) ( not ( = ?auto_40498 ?auto_40504 ) ) ( not ( = ?auto_40493 ?auto_40504 ) ) ( TRUCK-AT ?auto_40500 ?auto_40502 ) ( ON ?auto_40495 ?auto_40494 ) ( ON ?auto_40496 ?auto_40495 ) ( ON ?auto_40493 ?auto_40496 ) ( not ( = ?auto_40494 ?auto_40495 ) ) ( not ( = ?auto_40494 ?auto_40496 ) ) ( not ( = ?auto_40494 ?auto_40493 ) ) ( not ( = ?auto_40494 ?auto_40497 ) ) ( not ( = ?auto_40494 ?auto_40498 ) ) ( not ( = ?auto_40494 ?auto_40504 ) ) ( not ( = ?auto_40495 ?auto_40496 ) ) ( not ( = ?auto_40495 ?auto_40493 ) ) ( not ( = ?auto_40495 ?auto_40497 ) ) ( not ( = ?auto_40495 ?auto_40498 ) ) ( not ( = ?auto_40495 ?auto_40504 ) ) ( not ( = ?auto_40496 ?auto_40493 ) ) ( not ( = ?auto_40496 ?auto_40497 ) ) ( not ( = ?auto_40496 ?auto_40498 ) ) ( not ( = ?auto_40496 ?auto_40504 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40493 ?auto_40497 ?auto_40498 )
      ( MAKE-5CRATE-VERIFY ?auto_40494 ?auto_40495 ?auto_40496 ?auto_40493 ?auto_40497 ?auto_40498 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40545 - SURFACE
      ?auto_40546 - SURFACE
      ?auto_40547 - SURFACE
      ?auto_40544 - SURFACE
      ?auto_40548 - SURFACE
      ?auto_40549 - SURFACE
    )
    :vars
    (
      ?auto_40551 - HOIST
      ?auto_40553 - PLACE
      ?auto_40555 - PLACE
      ?auto_40552 - HOIST
      ?auto_40550 - SURFACE
      ?auto_40554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40551 ?auto_40553 ) ( IS-CRATE ?auto_40549 ) ( not ( = ?auto_40548 ?auto_40549 ) ) ( not ( = ?auto_40544 ?auto_40548 ) ) ( not ( = ?auto_40544 ?auto_40549 ) ) ( not ( = ?auto_40555 ?auto_40553 ) ) ( HOIST-AT ?auto_40552 ?auto_40555 ) ( not ( = ?auto_40551 ?auto_40552 ) ) ( AVAILABLE ?auto_40552 ) ( SURFACE-AT ?auto_40549 ?auto_40555 ) ( ON ?auto_40549 ?auto_40550 ) ( CLEAR ?auto_40549 ) ( not ( = ?auto_40548 ?auto_40550 ) ) ( not ( = ?auto_40549 ?auto_40550 ) ) ( not ( = ?auto_40544 ?auto_40550 ) ) ( TRUCK-AT ?auto_40554 ?auto_40553 ) ( SURFACE-AT ?auto_40544 ?auto_40553 ) ( CLEAR ?auto_40544 ) ( LIFTING ?auto_40551 ?auto_40548 ) ( IS-CRATE ?auto_40548 ) ( ON ?auto_40546 ?auto_40545 ) ( ON ?auto_40547 ?auto_40546 ) ( ON ?auto_40544 ?auto_40547 ) ( not ( = ?auto_40545 ?auto_40546 ) ) ( not ( = ?auto_40545 ?auto_40547 ) ) ( not ( = ?auto_40545 ?auto_40544 ) ) ( not ( = ?auto_40545 ?auto_40548 ) ) ( not ( = ?auto_40545 ?auto_40549 ) ) ( not ( = ?auto_40545 ?auto_40550 ) ) ( not ( = ?auto_40546 ?auto_40547 ) ) ( not ( = ?auto_40546 ?auto_40544 ) ) ( not ( = ?auto_40546 ?auto_40548 ) ) ( not ( = ?auto_40546 ?auto_40549 ) ) ( not ( = ?auto_40546 ?auto_40550 ) ) ( not ( = ?auto_40547 ?auto_40544 ) ) ( not ( = ?auto_40547 ?auto_40548 ) ) ( not ( = ?auto_40547 ?auto_40549 ) ) ( not ( = ?auto_40547 ?auto_40550 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40544 ?auto_40548 ?auto_40549 )
      ( MAKE-5CRATE-VERIFY ?auto_40545 ?auto_40546 ?auto_40547 ?auto_40544 ?auto_40548 ?auto_40549 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40596 - SURFACE
      ?auto_40597 - SURFACE
      ?auto_40598 - SURFACE
      ?auto_40595 - SURFACE
      ?auto_40599 - SURFACE
      ?auto_40600 - SURFACE
    )
    :vars
    (
      ?auto_40604 - HOIST
      ?auto_40606 - PLACE
      ?auto_40603 - PLACE
      ?auto_40601 - HOIST
      ?auto_40602 - SURFACE
      ?auto_40605 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40604 ?auto_40606 ) ( IS-CRATE ?auto_40600 ) ( not ( = ?auto_40599 ?auto_40600 ) ) ( not ( = ?auto_40595 ?auto_40599 ) ) ( not ( = ?auto_40595 ?auto_40600 ) ) ( not ( = ?auto_40603 ?auto_40606 ) ) ( HOIST-AT ?auto_40601 ?auto_40603 ) ( not ( = ?auto_40604 ?auto_40601 ) ) ( AVAILABLE ?auto_40601 ) ( SURFACE-AT ?auto_40600 ?auto_40603 ) ( ON ?auto_40600 ?auto_40602 ) ( CLEAR ?auto_40600 ) ( not ( = ?auto_40599 ?auto_40602 ) ) ( not ( = ?auto_40600 ?auto_40602 ) ) ( not ( = ?auto_40595 ?auto_40602 ) ) ( TRUCK-AT ?auto_40605 ?auto_40606 ) ( SURFACE-AT ?auto_40595 ?auto_40606 ) ( CLEAR ?auto_40595 ) ( IS-CRATE ?auto_40599 ) ( AVAILABLE ?auto_40604 ) ( IN ?auto_40599 ?auto_40605 ) ( ON ?auto_40597 ?auto_40596 ) ( ON ?auto_40598 ?auto_40597 ) ( ON ?auto_40595 ?auto_40598 ) ( not ( = ?auto_40596 ?auto_40597 ) ) ( not ( = ?auto_40596 ?auto_40598 ) ) ( not ( = ?auto_40596 ?auto_40595 ) ) ( not ( = ?auto_40596 ?auto_40599 ) ) ( not ( = ?auto_40596 ?auto_40600 ) ) ( not ( = ?auto_40596 ?auto_40602 ) ) ( not ( = ?auto_40597 ?auto_40598 ) ) ( not ( = ?auto_40597 ?auto_40595 ) ) ( not ( = ?auto_40597 ?auto_40599 ) ) ( not ( = ?auto_40597 ?auto_40600 ) ) ( not ( = ?auto_40597 ?auto_40602 ) ) ( not ( = ?auto_40598 ?auto_40595 ) ) ( not ( = ?auto_40598 ?auto_40599 ) ) ( not ( = ?auto_40598 ?auto_40600 ) ) ( not ( = ?auto_40598 ?auto_40602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40595 ?auto_40599 ?auto_40600 )
      ( MAKE-5CRATE-VERIFY ?auto_40596 ?auto_40597 ?auto_40598 ?auto_40595 ?auto_40599 ?auto_40600 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_40963 - SURFACE
      ?auto_40964 - SURFACE
    )
    :vars
    (
      ?auto_40970 - HOIST
      ?auto_40966 - PLACE
      ?auto_40968 - SURFACE
      ?auto_40969 - PLACE
      ?auto_40967 - HOIST
      ?auto_40971 - SURFACE
      ?auto_40965 - TRUCK
      ?auto_40972 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40970 ?auto_40966 ) ( SURFACE-AT ?auto_40963 ?auto_40966 ) ( CLEAR ?auto_40963 ) ( IS-CRATE ?auto_40964 ) ( not ( = ?auto_40963 ?auto_40964 ) ) ( ON ?auto_40963 ?auto_40968 ) ( not ( = ?auto_40968 ?auto_40963 ) ) ( not ( = ?auto_40968 ?auto_40964 ) ) ( not ( = ?auto_40969 ?auto_40966 ) ) ( HOIST-AT ?auto_40967 ?auto_40969 ) ( not ( = ?auto_40970 ?auto_40967 ) ) ( AVAILABLE ?auto_40967 ) ( SURFACE-AT ?auto_40964 ?auto_40969 ) ( ON ?auto_40964 ?auto_40971 ) ( CLEAR ?auto_40964 ) ( not ( = ?auto_40963 ?auto_40971 ) ) ( not ( = ?auto_40964 ?auto_40971 ) ) ( not ( = ?auto_40968 ?auto_40971 ) ) ( TRUCK-AT ?auto_40965 ?auto_40966 ) ( LIFTING ?auto_40970 ?auto_40972 ) ( IS-CRATE ?auto_40972 ) ( not ( = ?auto_40963 ?auto_40972 ) ) ( not ( = ?auto_40964 ?auto_40972 ) ) ( not ( = ?auto_40968 ?auto_40972 ) ) ( not ( = ?auto_40971 ?auto_40972 ) ) )
    :subtasks
    ( ( !LOAD ?auto_40970 ?auto_40972 ?auto_40965 ?auto_40966 )
      ( MAKE-1CRATE ?auto_40963 ?auto_40964 )
      ( MAKE-1CRATE-VERIFY ?auto_40963 ?auto_40964 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_41271 - SURFACE
      ?auto_41272 - SURFACE
    )
    :vars
    (
      ?auto_41277 - HOIST
      ?auto_41279 - PLACE
      ?auto_41276 - SURFACE
      ?auto_41273 - TRUCK
      ?auto_41274 - PLACE
      ?auto_41278 - HOIST
      ?auto_41275 - SURFACE
      ?auto_41280 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41277 ?auto_41279 ) ( SURFACE-AT ?auto_41271 ?auto_41279 ) ( CLEAR ?auto_41271 ) ( IS-CRATE ?auto_41272 ) ( not ( = ?auto_41271 ?auto_41272 ) ) ( AVAILABLE ?auto_41277 ) ( ON ?auto_41271 ?auto_41276 ) ( not ( = ?auto_41276 ?auto_41271 ) ) ( not ( = ?auto_41276 ?auto_41272 ) ) ( TRUCK-AT ?auto_41273 ?auto_41274 ) ( not ( = ?auto_41274 ?auto_41279 ) ) ( HOIST-AT ?auto_41278 ?auto_41274 ) ( not ( = ?auto_41277 ?auto_41278 ) ) ( SURFACE-AT ?auto_41272 ?auto_41274 ) ( ON ?auto_41272 ?auto_41275 ) ( CLEAR ?auto_41272 ) ( not ( = ?auto_41271 ?auto_41275 ) ) ( not ( = ?auto_41272 ?auto_41275 ) ) ( not ( = ?auto_41276 ?auto_41275 ) ) ( LIFTING ?auto_41278 ?auto_41280 ) ( IS-CRATE ?auto_41280 ) ( not ( = ?auto_41271 ?auto_41280 ) ) ( not ( = ?auto_41272 ?auto_41280 ) ) ( not ( = ?auto_41276 ?auto_41280 ) ) ( not ( = ?auto_41275 ?auto_41280 ) ) )
    :subtasks
    ( ( !LOAD ?auto_41278 ?auto_41280 ?auto_41273 ?auto_41274 )
      ( MAKE-1CRATE ?auto_41271 ?auto_41272 )
      ( MAKE-1CRATE-VERIFY ?auto_41271 ?auto_41272 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_41798 - SURFACE
      ?auto_41799 - SURFACE
      ?auto_41800 - SURFACE
      ?auto_41797 - SURFACE
      ?auto_41801 - SURFACE
      ?auto_41803 - SURFACE
      ?auto_41802 - SURFACE
    )
    :vars
    (
      ?auto_41805 - HOIST
      ?auto_41804 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41805 ?auto_41804 ) ( SURFACE-AT ?auto_41803 ?auto_41804 ) ( CLEAR ?auto_41803 ) ( LIFTING ?auto_41805 ?auto_41802 ) ( IS-CRATE ?auto_41802 ) ( not ( = ?auto_41803 ?auto_41802 ) ) ( ON ?auto_41799 ?auto_41798 ) ( ON ?auto_41800 ?auto_41799 ) ( ON ?auto_41797 ?auto_41800 ) ( ON ?auto_41801 ?auto_41797 ) ( ON ?auto_41803 ?auto_41801 ) ( not ( = ?auto_41798 ?auto_41799 ) ) ( not ( = ?auto_41798 ?auto_41800 ) ) ( not ( = ?auto_41798 ?auto_41797 ) ) ( not ( = ?auto_41798 ?auto_41801 ) ) ( not ( = ?auto_41798 ?auto_41803 ) ) ( not ( = ?auto_41798 ?auto_41802 ) ) ( not ( = ?auto_41799 ?auto_41800 ) ) ( not ( = ?auto_41799 ?auto_41797 ) ) ( not ( = ?auto_41799 ?auto_41801 ) ) ( not ( = ?auto_41799 ?auto_41803 ) ) ( not ( = ?auto_41799 ?auto_41802 ) ) ( not ( = ?auto_41800 ?auto_41797 ) ) ( not ( = ?auto_41800 ?auto_41801 ) ) ( not ( = ?auto_41800 ?auto_41803 ) ) ( not ( = ?auto_41800 ?auto_41802 ) ) ( not ( = ?auto_41797 ?auto_41801 ) ) ( not ( = ?auto_41797 ?auto_41803 ) ) ( not ( = ?auto_41797 ?auto_41802 ) ) ( not ( = ?auto_41801 ?auto_41803 ) ) ( not ( = ?auto_41801 ?auto_41802 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_41803 ?auto_41802 )
      ( MAKE-6CRATE-VERIFY ?auto_41798 ?auto_41799 ?auto_41800 ?auto_41797 ?auto_41801 ?auto_41803 ?auto_41802 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_41842 - SURFACE
      ?auto_41843 - SURFACE
      ?auto_41844 - SURFACE
      ?auto_41841 - SURFACE
      ?auto_41845 - SURFACE
      ?auto_41847 - SURFACE
      ?auto_41846 - SURFACE
    )
    :vars
    (
      ?auto_41849 - HOIST
      ?auto_41848 - PLACE
      ?auto_41850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41849 ?auto_41848 ) ( SURFACE-AT ?auto_41847 ?auto_41848 ) ( CLEAR ?auto_41847 ) ( IS-CRATE ?auto_41846 ) ( not ( = ?auto_41847 ?auto_41846 ) ) ( TRUCK-AT ?auto_41850 ?auto_41848 ) ( AVAILABLE ?auto_41849 ) ( IN ?auto_41846 ?auto_41850 ) ( ON ?auto_41847 ?auto_41845 ) ( not ( = ?auto_41845 ?auto_41847 ) ) ( not ( = ?auto_41845 ?auto_41846 ) ) ( ON ?auto_41843 ?auto_41842 ) ( ON ?auto_41844 ?auto_41843 ) ( ON ?auto_41841 ?auto_41844 ) ( ON ?auto_41845 ?auto_41841 ) ( not ( = ?auto_41842 ?auto_41843 ) ) ( not ( = ?auto_41842 ?auto_41844 ) ) ( not ( = ?auto_41842 ?auto_41841 ) ) ( not ( = ?auto_41842 ?auto_41845 ) ) ( not ( = ?auto_41842 ?auto_41847 ) ) ( not ( = ?auto_41842 ?auto_41846 ) ) ( not ( = ?auto_41843 ?auto_41844 ) ) ( not ( = ?auto_41843 ?auto_41841 ) ) ( not ( = ?auto_41843 ?auto_41845 ) ) ( not ( = ?auto_41843 ?auto_41847 ) ) ( not ( = ?auto_41843 ?auto_41846 ) ) ( not ( = ?auto_41844 ?auto_41841 ) ) ( not ( = ?auto_41844 ?auto_41845 ) ) ( not ( = ?auto_41844 ?auto_41847 ) ) ( not ( = ?auto_41844 ?auto_41846 ) ) ( not ( = ?auto_41841 ?auto_41845 ) ) ( not ( = ?auto_41841 ?auto_41847 ) ) ( not ( = ?auto_41841 ?auto_41846 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_41845 ?auto_41847 ?auto_41846 )
      ( MAKE-6CRATE-VERIFY ?auto_41842 ?auto_41843 ?auto_41844 ?auto_41841 ?auto_41845 ?auto_41847 ?auto_41846 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_41893 - SURFACE
      ?auto_41894 - SURFACE
      ?auto_41895 - SURFACE
      ?auto_41892 - SURFACE
      ?auto_41896 - SURFACE
      ?auto_41898 - SURFACE
      ?auto_41897 - SURFACE
    )
    :vars
    (
      ?auto_41899 - HOIST
      ?auto_41902 - PLACE
      ?auto_41900 - TRUCK
      ?auto_41901 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41899 ?auto_41902 ) ( SURFACE-AT ?auto_41898 ?auto_41902 ) ( CLEAR ?auto_41898 ) ( IS-CRATE ?auto_41897 ) ( not ( = ?auto_41898 ?auto_41897 ) ) ( AVAILABLE ?auto_41899 ) ( IN ?auto_41897 ?auto_41900 ) ( ON ?auto_41898 ?auto_41896 ) ( not ( = ?auto_41896 ?auto_41898 ) ) ( not ( = ?auto_41896 ?auto_41897 ) ) ( TRUCK-AT ?auto_41900 ?auto_41901 ) ( not ( = ?auto_41901 ?auto_41902 ) ) ( ON ?auto_41894 ?auto_41893 ) ( ON ?auto_41895 ?auto_41894 ) ( ON ?auto_41892 ?auto_41895 ) ( ON ?auto_41896 ?auto_41892 ) ( not ( = ?auto_41893 ?auto_41894 ) ) ( not ( = ?auto_41893 ?auto_41895 ) ) ( not ( = ?auto_41893 ?auto_41892 ) ) ( not ( = ?auto_41893 ?auto_41896 ) ) ( not ( = ?auto_41893 ?auto_41898 ) ) ( not ( = ?auto_41893 ?auto_41897 ) ) ( not ( = ?auto_41894 ?auto_41895 ) ) ( not ( = ?auto_41894 ?auto_41892 ) ) ( not ( = ?auto_41894 ?auto_41896 ) ) ( not ( = ?auto_41894 ?auto_41898 ) ) ( not ( = ?auto_41894 ?auto_41897 ) ) ( not ( = ?auto_41895 ?auto_41892 ) ) ( not ( = ?auto_41895 ?auto_41896 ) ) ( not ( = ?auto_41895 ?auto_41898 ) ) ( not ( = ?auto_41895 ?auto_41897 ) ) ( not ( = ?auto_41892 ?auto_41896 ) ) ( not ( = ?auto_41892 ?auto_41898 ) ) ( not ( = ?auto_41892 ?auto_41897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_41896 ?auto_41898 ?auto_41897 )
      ( MAKE-6CRATE-VERIFY ?auto_41893 ?auto_41894 ?auto_41895 ?auto_41892 ?auto_41896 ?auto_41898 ?auto_41897 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_41950 - SURFACE
      ?auto_41951 - SURFACE
      ?auto_41952 - SURFACE
      ?auto_41949 - SURFACE
      ?auto_41953 - SURFACE
      ?auto_41955 - SURFACE
      ?auto_41954 - SURFACE
    )
    :vars
    (
      ?auto_41960 - HOIST
      ?auto_41959 - PLACE
      ?auto_41957 - TRUCK
      ?auto_41956 - PLACE
      ?auto_41958 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_41960 ?auto_41959 ) ( SURFACE-AT ?auto_41955 ?auto_41959 ) ( CLEAR ?auto_41955 ) ( IS-CRATE ?auto_41954 ) ( not ( = ?auto_41955 ?auto_41954 ) ) ( AVAILABLE ?auto_41960 ) ( ON ?auto_41955 ?auto_41953 ) ( not ( = ?auto_41953 ?auto_41955 ) ) ( not ( = ?auto_41953 ?auto_41954 ) ) ( TRUCK-AT ?auto_41957 ?auto_41956 ) ( not ( = ?auto_41956 ?auto_41959 ) ) ( HOIST-AT ?auto_41958 ?auto_41956 ) ( LIFTING ?auto_41958 ?auto_41954 ) ( not ( = ?auto_41960 ?auto_41958 ) ) ( ON ?auto_41951 ?auto_41950 ) ( ON ?auto_41952 ?auto_41951 ) ( ON ?auto_41949 ?auto_41952 ) ( ON ?auto_41953 ?auto_41949 ) ( not ( = ?auto_41950 ?auto_41951 ) ) ( not ( = ?auto_41950 ?auto_41952 ) ) ( not ( = ?auto_41950 ?auto_41949 ) ) ( not ( = ?auto_41950 ?auto_41953 ) ) ( not ( = ?auto_41950 ?auto_41955 ) ) ( not ( = ?auto_41950 ?auto_41954 ) ) ( not ( = ?auto_41951 ?auto_41952 ) ) ( not ( = ?auto_41951 ?auto_41949 ) ) ( not ( = ?auto_41951 ?auto_41953 ) ) ( not ( = ?auto_41951 ?auto_41955 ) ) ( not ( = ?auto_41951 ?auto_41954 ) ) ( not ( = ?auto_41952 ?auto_41949 ) ) ( not ( = ?auto_41952 ?auto_41953 ) ) ( not ( = ?auto_41952 ?auto_41955 ) ) ( not ( = ?auto_41952 ?auto_41954 ) ) ( not ( = ?auto_41949 ?auto_41953 ) ) ( not ( = ?auto_41949 ?auto_41955 ) ) ( not ( = ?auto_41949 ?auto_41954 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_41953 ?auto_41955 ?auto_41954 )
      ( MAKE-6CRATE-VERIFY ?auto_41950 ?auto_41951 ?auto_41952 ?auto_41949 ?auto_41953 ?auto_41955 ?auto_41954 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_42013 - SURFACE
      ?auto_42014 - SURFACE
      ?auto_42015 - SURFACE
      ?auto_42012 - SURFACE
      ?auto_42016 - SURFACE
      ?auto_42018 - SURFACE
      ?auto_42017 - SURFACE
    )
    :vars
    (
      ?auto_42023 - HOIST
      ?auto_42024 - PLACE
      ?auto_42020 - TRUCK
      ?auto_42019 - PLACE
      ?auto_42021 - HOIST
      ?auto_42022 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42023 ?auto_42024 ) ( SURFACE-AT ?auto_42018 ?auto_42024 ) ( CLEAR ?auto_42018 ) ( IS-CRATE ?auto_42017 ) ( not ( = ?auto_42018 ?auto_42017 ) ) ( AVAILABLE ?auto_42023 ) ( ON ?auto_42018 ?auto_42016 ) ( not ( = ?auto_42016 ?auto_42018 ) ) ( not ( = ?auto_42016 ?auto_42017 ) ) ( TRUCK-AT ?auto_42020 ?auto_42019 ) ( not ( = ?auto_42019 ?auto_42024 ) ) ( HOIST-AT ?auto_42021 ?auto_42019 ) ( not ( = ?auto_42023 ?auto_42021 ) ) ( AVAILABLE ?auto_42021 ) ( SURFACE-AT ?auto_42017 ?auto_42019 ) ( ON ?auto_42017 ?auto_42022 ) ( CLEAR ?auto_42017 ) ( not ( = ?auto_42018 ?auto_42022 ) ) ( not ( = ?auto_42017 ?auto_42022 ) ) ( not ( = ?auto_42016 ?auto_42022 ) ) ( ON ?auto_42014 ?auto_42013 ) ( ON ?auto_42015 ?auto_42014 ) ( ON ?auto_42012 ?auto_42015 ) ( ON ?auto_42016 ?auto_42012 ) ( not ( = ?auto_42013 ?auto_42014 ) ) ( not ( = ?auto_42013 ?auto_42015 ) ) ( not ( = ?auto_42013 ?auto_42012 ) ) ( not ( = ?auto_42013 ?auto_42016 ) ) ( not ( = ?auto_42013 ?auto_42018 ) ) ( not ( = ?auto_42013 ?auto_42017 ) ) ( not ( = ?auto_42013 ?auto_42022 ) ) ( not ( = ?auto_42014 ?auto_42015 ) ) ( not ( = ?auto_42014 ?auto_42012 ) ) ( not ( = ?auto_42014 ?auto_42016 ) ) ( not ( = ?auto_42014 ?auto_42018 ) ) ( not ( = ?auto_42014 ?auto_42017 ) ) ( not ( = ?auto_42014 ?auto_42022 ) ) ( not ( = ?auto_42015 ?auto_42012 ) ) ( not ( = ?auto_42015 ?auto_42016 ) ) ( not ( = ?auto_42015 ?auto_42018 ) ) ( not ( = ?auto_42015 ?auto_42017 ) ) ( not ( = ?auto_42015 ?auto_42022 ) ) ( not ( = ?auto_42012 ?auto_42016 ) ) ( not ( = ?auto_42012 ?auto_42018 ) ) ( not ( = ?auto_42012 ?auto_42017 ) ) ( not ( = ?auto_42012 ?auto_42022 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_42016 ?auto_42018 ?auto_42017 )
      ( MAKE-6CRATE-VERIFY ?auto_42013 ?auto_42014 ?auto_42015 ?auto_42012 ?auto_42016 ?auto_42018 ?auto_42017 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_42077 - SURFACE
      ?auto_42078 - SURFACE
      ?auto_42079 - SURFACE
      ?auto_42076 - SURFACE
      ?auto_42080 - SURFACE
      ?auto_42082 - SURFACE
      ?auto_42081 - SURFACE
    )
    :vars
    (
      ?auto_42086 - HOIST
      ?auto_42084 - PLACE
      ?auto_42088 - PLACE
      ?auto_42087 - HOIST
      ?auto_42083 - SURFACE
      ?auto_42085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42086 ?auto_42084 ) ( SURFACE-AT ?auto_42082 ?auto_42084 ) ( CLEAR ?auto_42082 ) ( IS-CRATE ?auto_42081 ) ( not ( = ?auto_42082 ?auto_42081 ) ) ( AVAILABLE ?auto_42086 ) ( ON ?auto_42082 ?auto_42080 ) ( not ( = ?auto_42080 ?auto_42082 ) ) ( not ( = ?auto_42080 ?auto_42081 ) ) ( not ( = ?auto_42088 ?auto_42084 ) ) ( HOIST-AT ?auto_42087 ?auto_42088 ) ( not ( = ?auto_42086 ?auto_42087 ) ) ( AVAILABLE ?auto_42087 ) ( SURFACE-AT ?auto_42081 ?auto_42088 ) ( ON ?auto_42081 ?auto_42083 ) ( CLEAR ?auto_42081 ) ( not ( = ?auto_42082 ?auto_42083 ) ) ( not ( = ?auto_42081 ?auto_42083 ) ) ( not ( = ?auto_42080 ?auto_42083 ) ) ( TRUCK-AT ?auto_42085 ?auto_42084 ) ( ON ?auto_42078 ?auto_42077 ) ( ON ?auto_42079 ?auto_42078 ) ( ON ?auto_42076 ?auto_42079 ) ( ON ?auto_42080 ?auto_42076 ) ( not ( = ?auto_42077 ?auto_42078 ) ) ( not ( = ?auto_42077 ?auto_42079 ) ) ( not ( = ?auto_42077 ?auto_42076 ) ) ( not ( = ?auto_42077 ?auto_42080 ) ) ( not ( = ?auto_42077 ?auto_42082 ) ) ( not ( = ?auto_42077 ?auto_42081 ) ) ( not ( = ?auto_42077 ?auto_42083 ) ) ( not ( = ?auto_42078 ?auto_42079 ) ) ( not ( = ?auto_42078 ?auto_42076 ) ) ( not ( = ?auto_42078 ?auto_42080 ) ) ( not ( = ?auto_42078 ?auto_42082 ) ) ( not ( = ?auto_42078 ?auto_42081 ) ) ( not ( = ?auto_42078 ?auto_42083 ) ) ( not ( = ?auto_42079 ?auto_42076 ) ) ( not ( = ?auto_42079 ?auto_42080 ) ) ( not ( = ?auto_42079 ?auto_42082 ) ) ( not ( = ?auto_42079 ?auto_42081 ) ) ( not ( = ?auto_42079 ?auto_42083 ) ) ( not ( = ?auto_42076 ?auto_42080 ) ) ( not ( = ?auto_42076 ?auto_42082 ) ) ( not ( = ?auto_42076 ?auto_42081 ) ) ( not ( = ?auto_42076 ?auto_42083 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_42080 ?auto_42082 ?auto_42081 )
      ( MAKE-6CRATE-VERIFY ?auto_42077 ?auto_42078 ?auto_42079 ?auto_42076 ?auto_42080 ?auto_42082 ?auto_42081 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_42141 - SURFACE
      ?auto_42142 - SURFACE
      ?auto_42143 - SURFACE
      ?auto_42140 - SURFACE
      ?auto_42144 - SURFACE
      ?auto_42146 - SURFACE
      ?auto_42145 - SURFACE
    )
    :vars
    (
      ?auto_42147 - HOIST
      ?auto_42148 - PLACE
      ?auto_42152 - PLACE
      ?auto_42150 - HOIST
      ?auto_42149 - SURFACE
      ?auto_42151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42147 ?auto_42148 ) ( IS-CRATE ?auto_42145 ) ( not ( = ?auto_42146 ?auto_42145 ) ) ( not ( = ?auto_42144 ?auto_42146 ) ) ( not ( = ?auto_42144 ?auto_42145 ) ) ( not ( = ?auto_42152 ?auto_42148 ) ) ( HOIST-AT ?auto_42150 ?auto_42152 ) ( not ( = ?auto_42147 ?auto_42150 ) ) ( AVAILABLE ?auto_42150 ) ( SURFACE-AT ?auto_42145 ?auto_42152 ) ( ON ?auto_42145 ?auto_42149 ) ( CLEAR ?auto_42145 ) ( not ( = ?auto_42146 ?auto_42149 ) ) ( not ( = ?auto_42145 ?auto_42149 ) ) ( not ( = ?auto_42144 ?auto_42149 ) ) ( TRUCK-AT ?auto_42151 ?auto_42148 ) ( SURFACE-AT ?auto_42144 ?auto_42148 ) ( CLEAR ?auto_42144 ) ( LIFTING ?auto_42147 ?auto_42146 ) ( IS-CRATE ?auto_42146 ) ( ON ?auto_42142 ?auto_42141 ) ( ON ?auto_42143 ?auto_42142 ) ( ON ?auto_42140 ?auto_42143 ) ( ON ?auto_42144 ?auto_42140 ) ( not ( = ?auto_42141 ?auto_42142 ) ) ( not ( = ?auto_42141 ?auto_42143 ) ) ( not ( = ?auto_42141 ?auto_42140 ) ) ( not ( = ?auto_42141 ?auto_42144 ) ) ( not ( = ?auto_42141 ?auto_42146 ) ) ( not ( = ?auto_42141 ?auto_42145 ) ) ( not ( = ?auto_42141 ?auto_42149 ) ) ( not ( = ?auto_42142 ?auto_42143 ) ) ( not ( = ?auto_42142 ?auto_42140 ) ) ( not ( = ?auto_42142 ?auto_42144 ) ) ( not ( = ?auto_42142 ?auto_42146 ) ) ( not ( = ?auto_42142 ?auto_42145 ) ) ( not ( = ?auto_42142 ?auto_42149 ) ) ( not ( = ?auto_42143 ?auto_42140 ) ) ( not ( = ?auto_42143 ?auto_42144 ) ) ( not ( = ?auto_42143 ?auto_42146 ) ) ( not ( = ?auto_42143 ?auto_42145 ) ) ( not ( = ?auto_42143 ?auto_42149 ) ) ( not ( = ?auto_42140 ?auto_42144 ) ) ( not ( = ?auto_42140 ?auto_42146 ) ) ( not ( = ?auto_42140 ?auto_42145 ) ) ( not ( = ?auto_42140 ?auto_42149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_42144 ?auto_42146 ?auto_42145 )
      ( MAKE-6CRATE-VERIFY ?auto_42141 ?auto_42142 ?auto_42143 ?auto_42140 ?auto_42144 ?auto_42146 ?auto_42145 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_42205 - SURFACE
      ?auto_42206 - SURFACE
      ?auto_42207 - SURFACE
      ?auto_42204 - SURFACE
      ?auto_42208 - SURFACE
      ?auto_42210 - SURFACE
      ?auto_42209 - SURFACE
    )
    :vars
    (
      ?auto_42214 - HOIST
      ?auto_42215 - PLACE
      ?auto_42212 - PLACE
      ?auto_42211 - HOIST
      ?auto_42213 - SURFACE
      ?auto_42216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42214 ?auto_42215 ) ( IS-CRATE ?auto_42209 ) ( not ( = ?auto_42210 ?auto_42209 ) ) ( not ( = ?auto_42208 ?auto_42210 ) ) ( not ( = ?auto_42208 ?auto_42209 ) ) ( not ( = ?auto_42212 ?auto_42215 ) ) ( HOIST-AT ?auto_42211 ?auto_42212 ) ( not ( = ?auto_42214 ?auto_42211 ) ) ( AVAILABLE ?auto_42211 ) ( SURFACE-AT ?auto_42209 ?auto_42212 ) ( ON ?auto_42209 ?auto_42213 ) ( CLEAR ?auto_42209 ) ( not ( = ?auto_42210 ?auto_42213 ) ) ( not ( = ?auto_42209 ?auto_42213 ) ) ( not ( = ?auto_42208 ?auto_42213 ) ) ( TRUCK-AT ?auto_42216 ?auto_42215 ) ( SURFACE-AT ?auto_42208 ?auto_42215 ) ( CLEAR ?auto_42208 ) ( IS-CRATE ?auto_42210 ) ( AVAILABLE ?auto_42214 ) ( IN ?auto_42210 ?auto_42216 ) ( ON ?auto_42206 ?auto_42205 ) ( ON ?auto_42207 ?auto_42206 ) ( ON ?auto_42204 ?auto_42207 ) ( ON ?auto_42208 ?auto_42204 ) ( not ( = ?auto_42205 ?auto_42206 ) ) ( not ( = ?auto_42205 ?auto_42207 ) ) ( not ( = ?auto_42205 ?auto_42204 ) ) ( not ( = ?auto_42205 ?auto_42208 ) ) ( not ( = ?auto_42205 ?auto_42210 ) ) ( not ( = ?auto_42205 ?auto_42209 ) ) ( not ( = ?auto_42205 ?auto_42213 ) ) ( not ( = ?auto_42206 ?auto_42207 ) ) ( not ( = ?auto_42206 ?auto_42204 ) ) ( not ( = ?auto_42206 ?auto_42208 ) ) ( not ( = ?auto_42206 ?auto_42210 ) ) ( not ( = ?auto_42206 ?auto_42209 ) ) ( not ( = ?auto_42206 ?auto_42213 ) ) ( not ( = ?auto_42207 ?auto_42204 ) ) ( not ( = ?auto_42207 ?auto_42208 ) ) ( not ( = ?auto_42207 ?auto_42210 ) ) ( not ( = ?auto_42207 ?auto_42209 ) ) ( not ( = ?auto_42207 ?auto_42213 ) ) ( not ( = ?auto_42204 ?auto_42208 ) ) ( not ( = ?auto_42204 ?auto_42210 ) ) ( not ( = ?auto_42204 ?auto_42209 ) ) ( not ( = ?auto_42204 ?auto_42213 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_42208 ?auto_42210 ?auto_42209 )
      ( MAKE-6CRATE-VERIFY ?auto_42205 ?auto_42206 ?auto_42207 ?auto_42204 ?auto_42208 ?auto_42210 ?auto_42209 ) )
  )

)

