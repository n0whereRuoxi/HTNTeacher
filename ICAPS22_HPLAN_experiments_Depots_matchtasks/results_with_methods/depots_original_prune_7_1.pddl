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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63675 - SURFACE
      ?auto_63676 - SURFACE
    )
    :vars
    (
      ?auto_63677 - HOIST
      ?auto_63678 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63677 ?auto_63678 ) ( SURFACE-AT ?auto_63675 ?auto_63678 ) ( CLEAR ?auto_63675 ) ( LIFTING ?auto_63677 ?auto_63676 ) ( IS-CRATE ?auto_63676 ) ( not ( = ?auto_63675 ?auto_63676 ) ) )
    :subtasks
    ( ( !DROP ?auto_63677 ?auto_63676 ?auto_63675 ?auto_63678 )
      ( MAKE-1CRATE-VERIFY ?auto_63675 ?auto_63676 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63679 - SURFACE
      ?auto_63680 - SURFACE
    )
    :vars
    (
      ?auto_63682 - HOIST
      ?auto_63681 - PLACE
      ?auto_63683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63682 ?auto_63681 ) ( SURFACE-AT ?auto_63679 ?auto_63681 ) ( CLEAR ?auto_63679 ) ( IS-CRATE ?auto_63680 ) ( not ( = ?auto_63679 ?auto_63680 ) ) ( TRUCK-AT ?auto_63683 ?auto_63681 ) ( AVAILABLE ?auto_63682 ) ( IN ?auto_63680 ?auto_63683 ) )
    :subtasks
    ( ( !UNLOAD ?auto_63682 ?auto_63680 ?auto_63683 ?auto_63681 )
      ( MAKE-1CRATE ?auto_63679 ?auto_63680 )
      ( MAKE-1CRATE-VERIFY ?auto_63679 ?auto_63680 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63684 - SURFACE
      ?auto_63685 - SURFACE
    )
    :vars
    (
      ?auto_63687 - HOIST
      ?auto_63688 - PLACE
      ?auto_63686 - TRUCK
      ?auto_63689 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63687 ?auto_63688 ) ( SURFACE-AT ?auto_63684 ?auto_63688 ) ( CLEAR ?auto_63684 ) ( IS-CRATE ?auto_63685 ) ( not ( = ?auto_63684 ?auto_63685 ) ) ( AVAILABLE ?auto_63687 ) ( IN ?auto_63685 ?auto_63686 ) ( TRUCK-AT ?auto_63686 ?auto_63689 ) ( not ( = ?auto_63689 ?auto_63688 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_63686 ?auto_63689 ?auto_63688 )
      ( MAKE-1CRATE ?auto_63684 ?auto_63685 )
      ( MAKE-1CRATE-VERIFY ?auto_63684 ?auto_63685 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63690 - SURFACE
      ?auto_63691 - SURFACE
    )
    :vars
    (
      ?auto_63692 - HOIST
      ?auto_63694 - PLACE
      ?auto_63693 - TRUCK
      ?auto_63695 - PLACE
      ?auto_63696 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_63692 ?auto_63694 ) ( SURFACE-AT ?auto_63690 ?auto_63694 ) ( CLEAR ?auto_63690 ) ( IS-CRATE ?auto_63691 ) ( not ( = ?auto_63690 ?auto_63691 ) ) ( AVAILABLE ?auto_63692 ) ( TRUCK-AT ?auto_63693 ?auto_63695 ) ( not ( = ?auto_63695 ?auto_63694 ) ) ( HOIST-AT ?auto_63696 ?auto_63695 ) ( LIFTING ?auto_63696 ?auto_63691 ) ( not ( = ?auto_63692 ?auto_63696 ) ) )
    :subtasks
    ( ( !LOAD ?auto_63696 ?auto_63691 ?auto_63693 ?auto_63695 )
      ( MAKE-1CRATE ?auto_63690 ?auto_63691 )
      ( MAKE-1CRATE-VERIFY ?auto_63690 ?auto_63691 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63697 - SURFACE
      ?auto_63698 - SURFACE
    )
    :vars
    (
      ?auto_63702 - HOIST
      ?auto_63703 - PLACE
      ?auto_63700 - TRUCK
      ?auto_63699 - PLACE
      ?auto_63701 - HOIST
      ?auto_63704 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63702 ?auto_63703 ) ( SURFACE-AT ?auto_63697 ?auto_63703 ) ( CLEAR ?auto_63697 ) ( IS-CRATE ?auto_63698 ) ( not ( = ?auto_63697 ?auto_63698 ) ) ( AVAILABLE ?auto_63702 ) ( TRUCK-AT ?auto_63700 ?auto_63699 ) ( not ( = ?auto_63699 ?auto_63703 ) ) ( HOIST-AT ?auto_63701 ?auto_63699 ) ( not ( = ?auto_63702 ?auto_63701 ) ) ( AVAILABLE ?auto_63701 ) ( SURFACE-AT ?auto_63698 ?auto_63699 ) ( ON ?auto_63698 ?auto_63704 ) ( CLEAR ?auto_63698 ) ( not ( = ?auto_63697 ?auto_63704 ) ) ( not ( = ?auto_63698 ?auto_63704 ) ) )
    :subtasks
    ( ( !LIFT ?auto_63701 ?auto_63698 ?auto_63704 ?auto_63699 )
      ( MAKE-1CRATE ?auto_63697 ?auto_63698 )
      ( MAKE-1CRATE-VERIFY ?auto_63697 ?auto_63698 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63705 - SURFACE
      ?auto_63706 - SURFACE
    )
    :vars
    (
      ?auto_63709 - HOIST
      ?auto_63712 - PLACE
      ?auto_63708 - PLACE
      ?auto_63707 - HOIST
      ?auto_63711 - SURFACE
      ?auto_63710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63709 ?auto_63712 ) ( SURFACE-AT ?auto_63705 ?auto_63712 ) ( CLEAR ?auto_63705 ) ( IS-CRATE ?auto_63706 ) ( not ( = ?auto_63705 ?auto_63706 ) ) ( AVAILABLE ?auto_63709 ) ( not ( = ?auto_63708 ?auto_63712 ) ) ( HOIST-AT ?auto_63707 ?auto_63708 ) ( not ( = ?auto_63709 ?auto_63707 ) ) ( AVAILABLE ?auto_63707 ) ( SURFACE-AT ?auto_63706 ?auto_63708 ) ( ON ?auto_63706 ?auto_63711 ) ( CLEAR ?auto_63706 ) ( not ( = ?auto_63705 ?auto_63711 ) ) ( not ( = ?auto_63706 ?auto_63711 ) ) ( TRUCK-AT ?auto_63710 ?auto_63712 ) )
    :subtasks
    ( ( !DRIVE ?auto_63710 ?auto_63712 ?auto_63708 )
      ( MAKE-1CRATE ?auto_63705 ?auto_63706 )
      ( MAKE-1CRATE-VERIFY ?auto_63705 ?auto_63706 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63722 - SURFACE
      ?auto_63723 - SURFACE
      ?auto_63724 - SURFACE
    )
    :vars
    (
      ?auto_63726 - HOIST
      ?auto_63725 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63726 ?auto_63725 ) ( SURFACE-AT ?auto_63723 ?auto_63725 ) ( CLEAR ?auto_63723 ) ( LIFTING ?auto_63726 ?auto_63724 ) ( IS-CRATE ?auto_63724 ) ( not ( = ?auto_63723 ?auto_63724 ) ) ( ON ?auto_63723 ?auto_63722 ) ( not ( = ?auto_63722 ?auto_63723 ) ) ( not ( = ?auto_63722 ?auto_63724 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63723 ?auto_63724 )
      ( MAKE-2CRATE-VERIFY ?auto_63722 ?auto_63723 ?auto_63724 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63732 - SURFACE
      ?auto_63733 - SURFACE
      ?auto_63734 - SURFACE
    )
    :vars
    (
      ?auto_63736 - HOIST
      ?auto_63735 - PLACE
      ?auto_63737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63736 ?auto_63735 ) ( SURFACE-AT ?auto_63733 ?auto_63735 ) ( CLEAR ?auto_63733 ) ( IS-CRATE ?auto_63734 ) ( not ( = ?auto_63733 ?auto_63734 ) ) ( TRUCK-AT ?auto_63737 ?auto_63735 ) ( AVAILABLE ?auto_63736 ) ( IN ?auto_63734 ?auto_63737 ) ( ON ?auto_63733 ?auto_63732 ) ( not ( = ?auto_63732 ?auto_63733 ) ) ( not ( = ?auto_63732 ?auto_63734 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63733 ?auto_63734 )
      ( MAKE-2CRATE-VERIFY ?auto_63732 ?auto_63733 ?auto_63734 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63738 - SURFACE
      ?auto_63739 - SURFACE
    )
    :vars
    (
      ?auto_63741 - HOIST
      ?auto_63742 - PLACE
      ?auto_63743 - TRUCK
      ?auto_63740 - SURFACE
      ?auto_63744 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63741 ?auto_63742 ) ( SURFACE-AT ?auto_63738 ?auto_63742 ) ( CLEAR ?auto_63738 ) ( IS-CRATE ?auto_63739 ) ( not ( = ?auto_63738 ?auto_63739 ) ) ( AVAILABLE ?auto_63741 ) ( IN ?auto_63739 ?auto_63743 ) ( ON ?auto_63738 ?auto_63740 ) ( not ( = ?auto_63740 ?auto_63738 ) ) ( not ( = ?auto_63740 ?auto_63739 ) ) ( TRUCK-AT ?auto_63743 ?auto_63744 ) ( not ( = ?auto_63744 ?auto_63742 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_63743 ?auto_63744 ?auto_63742 )
      ( MAKE-2CRATE ?auto_63740 ?auto_63738 ?auto_63739 )
      ( MAKE-1CRATE-VERIFY ?auto_63738 ?auto_63739 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63745 - SURFACE
      ?auto_63746 - SURFACE
      ?auto_63747 - SURFACE
    )
    :vars
    (
      ?auto_63750 - HOIST
      ?auto_63749 - PLACE
      ?auto_63751 - TRUCK
      ?auto_63748 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63750 ?auto_63749 ) ( SURFACE-AT ?auto_63746 ?auto_63749 ) ( CLEAR ?auto_63746 ) ( IS-CRATE ?auto_63747 ) ( not ( = ?auto_63746 ?auto_63747 ) ) ( AVAILABLE ?auto_63750 ) ( IN ?auto_63747 ?auto_63751 ) ( ON ?auto_63746 ?auto_63745 ) ( not ( = ?auto_63745 ?auto_63746 ) ) ( not ( = ?auto_63745 ?auto_63747 ) ) ( TRUCK-AT ?auto_63751 ?auto_63748 ) ( not ( = ?auto_63748 ?auto_63749 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63746 ?auto_63747 )
      ( MAKE-2CRATE-VERIFY ?auto_63745 ?auto_63746 ?auto_63747 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63752 - SURFACE
      ?auto_63753 - SURFACE
    )
    :vars
    (
      ?auto_63758 - HOIST
      ?auto_63757 - PLACE
      ?auto_63755 - SURFACE
      ?auto_63756 - TRUCK
      ?auto_63754 - PLACE
      ?auto_63759 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_63758 ?auto_63757 ) ( SURFACE-AT ?auto_63752 ?auto_63757 ) ( CLEAR ?auto_63752 ) ( IS-CRATE ?auto_63753 ) ( not ( = ?auto_63752 ?auto_63753 ) ) ( AVAILABLE ?auto_63758 ) ( ON ?auto_63752 ?auto_63755 ) ( not ( = ?auto_63755 ?auto_63752 ) ) ( not ( = ?auto_63755 ?auto_63753 ) ) ( TRUCK-AT ?auto_63756 ?auto_63754 ) ( not ( = ?auto_63754 ?auto_63757 ) ) ( HOIST-AT ?auto_63759 ?auto_63754 ) ( LIFTING ?auto_63759 ?auto_63753 ) ( not ( = ?auto_63758 ?auto_63759 ) ) )
    :subtasks
    ( ( !LOAD ?auto_63759 ?auto_63753 ?auto_63756 ?auto_63754 )
      ( MAKE-2CRATE ?auto_63755 ?auto_63752 ?auto_63753 )
      ( MAKE-1CRATE-VERIFY ?auto_63752 ?auto_63753 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63760 - SURFACE
      ?auto_63761 - SURFACE
      ?auto_63762 - SURFACE
    )
    :vars
    (
      ?auto_63763 - HOIST
      ?auto_63765 - PLACE
      ?auto_63764 - TRUCK
      ?auto_63766 - PLACE
      ?auto_63767 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_63763 ?auto_63765 ) ( SURFACE-AT ?auto_63761 ?auto_63765 ) ( CLEAR ?auto_63761 ) ( IS-CRATE ?auto_63762 ) ( not ( = ?auto_63761 ?auto_63762 ) ) ( AVAILABLE ?auto_63763 ) ( ON ?auto_63761 ?auto_63760 ) ( not ( = ?auto_63760 ?auto_63761 ) ) ( not ( = ?auto_63760 ?auto_63762 ) ) ( TRUCK-AT ?auto_63764 ?auto_63766 ) ( not ( = ?auto_63766 ?auto_63765 ) ) ( HOIST-AT ?auto_63767 ?auto_63766 ) ( LIFTING ?auto_63767 ?auto_63762 ) ( not ( = ?auto_63763 ?auto_63767 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63761 ?auto_63762 )
      ( MAKE-2CRATE-VERIFY ?auto_63760 ?auto_63761 ?auto_63762 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63768 - SURFACE
      ?auto_63769 - SURFACE
    )
    :vars
    (
      ?auto_63772 - HOIST
      ?auto_63771 - PLACE
      ?auto_63774 - SURFACE
      ?auto_63773 - TRUCK
      ?auto_63770 - PLACE
      ?auto_63775 - HOIST
      ?auto_63776 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63772 ?auto_63771 ) ( SURFACE-AT ?auto_63768 ?auto_63771 ) ( CLEAR ?auto_63768 ) ( IS-CRATE ?auto_63769 ) ( not ( = ?auto_63768 ?auto_63769 ) ) ( AVAILABLE ?auto_63772 ) ( ON ?auto_63768 ?auto_63774 ) ( not ( = ?auto_63774 ?auto_63768 ) ) ( not ( = ?auto_63774 ?auto_63769 ) ) ( TRUCK-AT ?auto_63773 ?auto_63770 ) ( not ( = ?auto_63770 ?auto_63771 ) ) ( HOIST-AT ?auto_63775 ?auto_63770 ) ( not ( = ?auto_63772 ?auto_63775 ) ) ( AVAILABLE ?auto_63775 ) ( SURFACE-AT ?auto_63769 ?auto_63770 ) ( ON ?auto_63769 ?auto_63776 ) ( CLEAR ?auto_63769 ) ( not ( = ?auto_63768 ?auto_63776 ) ) ( not ( = ?auto_63769 ?auto_63776 ) ) ( not ( = ?auto_63774 ?auto_63776 ) ) )
    :subtasks
    ( ( !LIFT ?auto_63775 ?auto_63769 ?auto_63776 ?auto_63770 )
      ( MAKE-2CRATE ?auto_63774 ?auto_63768 ?auto_63769 )
      ( MAKE-1CRATE-VERIFY ?auto_63768 ?auto_63769 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63777 - SURFACE
      ?auto_63778 - SURFACE
      ?auto_63779 - SURFACE
    )
    :vars
    (
      ?auto_63782 - HOIST
      ?auto_63784 - PLACE
      ?auto_63780 - TRUCK
      ?auto_63783 - PLACE
      ?auto_63781 - HOIST
      ?auto_63785 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63782 ?auto_63784 ) ( SURFACE-AT ?auto_63778 ?auto_63784 ) ( CLEAR ?auto_63778 ) ( IS-CRATE ?auto_63779 ) ( not ( = ?auto_63778 ?auto_63779 ) ) ( AVAILABLE ?auto_63782 ) ( ON ?auto_63778 ?auto_63777 ) ( not ( = ?auto_63777 ?auto_63778 ) ) ( not ( = ?auto_63777 ?auto_63779 ) ) ( TRUCK-AT ?auto_63780 ?auto_63783 ) ( not ( = ?auto_63783 ?auto_63784 ) ) ( HOIST-AT ?auto_63781 ?auto_63783 ) ( not ( = ?auto_63782 ?auto_63781 ) ) ( AVAILABLE ?auto_63781 ) ( SURFACE-AT ?auto_63779 ?auto_63783 ) ( ON ?auto_63779 ?auto_63785 ) ( CLEAR ?auto_63779 ) ( not ( = ?auto_63778 ?auto_63785 ) ) ( not ( = ?auto_63779 ?auto_63785 ) ) ( not ( = ?auto_63777 ?auto_63785 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63778 ?auto_63779 )
      ( MAKE-2CRATE-VERIFY ?auto_63777 ?auto_63778 ?auto_63779 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63786 - SURFACE
      ?auto_63787 - SURFACE
    )
    :vars
    (
      ?auto_63789 - HOIST
      ?auto_63793 - PLACE
      ?auto_63791 - SURFACE
      ?auto_63792 - PLACE
      ?auto_63794 - HOIST
      ?auto_63790 - SURFACE
      ?auto_63788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63789 ?auto_63793 ) ( SURFACE-AT ?auto_63786 ?auto_63793 ) ( CLEAR ?auto_63786 ) ( IS-CRATE ?auto_63787 ) ( not ( = ?auto_63786 ?auto_63787 ) ) ( AVAILABLE ?auto_63789 ) ( ON ?auto_63786 ?auto_63791 ) ( not ( = ?auto_63791 ?auto_63786 ) ) ( not ( = ?auto_63791 ?auto_63787 ) ) ( not ( = ?auto_63792 ?auto_63793 ) ) ( HOIST-AT ?auto_63794 ?auto_63792 ) ( not ( = ?auto_63789 ?auto_63794 ) ) ( AVAILABLE ?auto_63794 ) ( SURFACE-AT ?auto_63787 ?auto_63792 ) ( ON ?auto_63787 ?auto_63790 ) ( CLEAR ?auto_63787 ) ( not ( = ?auto_63786 ?auto_63790 ) ) ( not ( = ?auto_63787 ?auto_63790 ) ) ( not ( = ?auto_63791 ?auto_63790 ) ) ( TRUCK-AT ?auto_63788 ?auto_63793 ) )
    :subtasks
    ( ( !DRIVE ?auto_63788 ?auto_63793 ?auto_63792 )
      ( MAKE-2CRATE ?auto_63791 ?auto_63786 ?auto_63787 )
      ( MAKE-1CRATE-VERIFY ?auto_63786 ?auto_63787 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63795 - SURFACE
      ?auto_63796 - SURFACE
      ?auto_63797 - SURFACE
    )
    :vars
    (
      ?auto_63802 - HOIST
      ?auto_63801 - PLACE
      ?auto_63798 - PLACE
      ?auto_63803 - HOIST
      ?auto_63799 - SURFACE
      ?auto_63800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63802 ?auto_63801 ) ( SURFACE-AT ?auto_63796 ?auto_63801 ) ( CLEAR ?auto_63796 ) ( IS-CRATE ?auto_63797 ) ( not ( = ?auto_63796 ?auto_63797 ) ) ( AVAILABLE ?auto_63802 ) ( ON ?auto_63796 ?auto_63795 ) ( not ( = ?auto_63795 ?auto_63796 ) ) ( not ( = ?auto_63795 ?auto_63797 ) ) ( not ( = ?auto_63798 ?auto_63801 ) ) ( HOIST-AT ?auto_63803 ?auto_63798 ) ( not ( = ?auto_63802 ?auto_63803 ) ) ( AVAILABLE ?auto_63803 ) ( SURFACE-AT ?auto_63797 ?auto_63798 ) ( ON ?auto_63797 ?auto_63799 ) ( CLEAR ?auto_63797 ) ( not ( = ?auto_63796 ?auto_63799 ) ) ( not ( = ?auto_63797 ?auto_63799 ) ) ( not ( = ?auto_63795 ?auto_63799 ) ) ( TRUCK-AT ?auto_63800 ?auto_63801 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63796 ?auto_63797 )
      ( MAKE-2CRATE-VERIFY ?auto_63795 ?auto_63796 ?auto_63797 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63804 - SURFACE
      ?auto_63805 - SURFACE
    )
    :vars
    (
      ?auto_63806 - HOIST
      ?auto_63811 - PLACE
      ?auto_63812 - SURFACE
      ?auto_63809 - PLACE
      ?auto_63810 - HOIST
      ?auto_63808 - SURFACE
      ?auto_63807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63806 ?auto_63811 ) ( IS-CRATE ?auto_63805 ) ( not ( = ?auto_63804 ?auto_63805 ) ) ( not ( = ?auto_63812 ?auto_63804 ) ) ( not ( = ?auto_63812 ?auto_63805 ) ) ( not ( = ?auto_63809 ?auto_63811 ) ) ( HOIST-AT ?auto_63810 ?auto_63809 ) ( not ( = ?auto_63806 ?auto_63810 ) ) ( AVAILABLE ?auto_63810 ) ( SURFACE-AT ?auto_63805 ?auto_63809 ) ( ON ?auto_63805 ?auto_63808 ) ( CLEAR ?auto_63805 ) ( not ( = ?auto_63804 ?auto_63808 ) ) ( not ( = ?auto_63805 ?auto_63808 ) ) ( not ( = ?auto_63812 ?auto_63808 ) ) ( TRUCK-AT ?auto_63807 ?auto_63811 ) ( SURFACE-AT ?auto_63812 ?auto_63811 ) ( CLEAR ?auto_63812 ) ( LIFTING ?auto_63806 ?auto_63804 ) ( IS-CRATE ?auto_63804 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63812 ?auto_63804 )
      ( MAKE-2CRATE ?auto_63812 ?auto_63804 ?auto_63805 )
      ( MAKE-1CRATE-VERIFY ?auto_63804 ?auto_63805 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63813 - SURFACE
      ?auto_63814 - SURFACE
      ?auto_63815 - SURFACE
    )
    :vars
    (
      ?auto_63821 - HOIST
      ?auto_63816 - PLACE
      ?auto_63820 - PLACE
      ?auto_63818 - HOIST
      ?auto_63819 - SURFACE
      ?auto_63817 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63821 ?auto_63816 ) ( IS-CRATE ?auto_63815 ) ( not ( = ?auto_63814 ?auto_63815 ) ) ( not ( = ?auto_63813 ?auto_63814 ) ) ( not ( = ?auto_63813 ?auto_63815 ) ) ( not ( = ?auto_63820 ?auto_63816 ) ) ( HOIST-AT ?auto_63818 ?auto_63820 ) ( not ( = ?auto_63821 ?auto_63818 ) ) ( AVAILABLE ?auto_63818 ) ( SURFACE-AT ?auto_63815 ?auto_63820 ) ( ON ?auto_63815 ?auto_63819 ) ( CLEAR ?auto_63815 ) ( not ( = ?auto_63814 ?auto_63819 ) ) ( not ( = ?auto_63815 ?auto_63819 ) ) ( not ( = ?auto_63813 ?auto_63819 ) ) ( TRUCK-AT ?auto_63817 ?auto_63816 ) ( SURFACE-AT ?auto_63813 ?auto_63816 ) ( CLEAR ?auto_63813 ) ( LIFTING ?auto_63821 ?auto_63814 ) ( IS-CRATE ?auto_63814 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63814 ?auto_63815 )
      ( MAKE-2CRATE-VERIFY ?auto_63813 ?auto_63814 ?auto_63815 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63822 - SURFACE
      ?auto_63823 - SURFACE
    )
    :vars
    (
      ?auto_63824 - HOIST
      ?auto_63827 - PLACE
      ?auto_63826 - SURFACE
      ?auto_63825 - PLACE
      ?auto_63829 - HOIST
      ?auto_63828 - SURFACE
      ?auto_63830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63824 ?auto_63827 ) ( IS-CRATE ?auto_63823 ) ( not ( = ?auto_63822 ?auto_63823 ) ) ( not ( = ?auto_63826 ?auto_63822 ) ) ( not ( = ?auto_63826 ?auto_63823 ) ) ( not ( = ?auto_63825 ?auto_63827 ) ) ( HOIST-AT ?auto_63829 ?auto_63825 ) ( not ( = ?auto_63824 ?auto_63829 ) ) ( AVAILABLE ?auto_63829 ) ( SURFACE-AT ?auto_63823 ?auto_63825 ) ( ON ?auto_63823 ?auto_63828 ) ( CLEAR ?auto_63823 ) ( not ( = ?auto_63822 ?auto_63828 ) ) ( not ( = ?auto_63823 ?auto_63828 ) ) ( not ( = ?auto_63826 ?auto_63828 ) ) ( TRUCK-AT ?auto_63830 ?auto_63827 ) ( SURFACE-AT ?auto_63826 ?auto_63827 ) ( CLEAR ?auto_63826 ) ( IS-CRATE ?auto_63822 ) ( AVAILABLE ?auto_63824 ) ( IN ?auto_63822 ?auto_63830 ) )
    :subtasks
    ( ( !UNLOAD ?auto_63824 ?auto_63822 ?auto_63830 ?auto_63827 )
      ( MAKE-2CRATE ?auto_63826 ?auto_63822 ?auto_63823 )
      ( MAKE-1CRATE-VERIFY ?auto_63822 ?auto_63823 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63831 - SURFACE
      ?auto_63832 - SURFACE
      ?auto_63833 - SURFACE
    )
    :vars
    (
      ?auto_63836 - HOIST
      ?auto_63834 - PLACE
      ?auto_63838 - PLACE
      ?auto_63837 - HOIST
      ?auto_63835 - SURFACE
      ?auto_63839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63836 ?auto_63834 ) ( IS-CRATE ?auto_63833 ) ( not ( = ?auto_63832 ?auto_63833 ) ) ( not ( = ?auto_63831 ?auto_63832 ) ) ( not ( = ?auto_63831 ?auto_63833 ) ) ( not ( = ?auto_63838 ?auto_63834 ) ) ( HOIST-AT ?auto_63837 ?auto_63838 ) ( not ( = ?auto_63836 ?auto_63837 ) ) ( AVAILABLE ?auto_63837 ) ( SURFACE-AT ?auto_63833 ?auto_63838 ) ( ON ?auto_63833 ?auto_63835 ) ( CLEAR ?auto_63833 ) ( not ( = ?auto_63832 ?auto_63835 ) ) ( not ( = ?auto_63833 ?auto_63835 ) ) ( not ( = ?auto_63831 ?auto_63835 ) ) ( TRUCK-AT ?auto_63839 ?auto_63834 ) ( SURFACE-AT ?auto_63831 ?auto_63834 ) ( CLEAR ?auto_63831 ) ( IS-CRATE ?auto_63832 ) ( AVAILABLE ?auto_63836 ) ( IN ?auto_63832 ?auto_63839 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63832 ?auto_63833 )
      ( MAKE-2CRATE-VERIFY ?auto_63831 ?auto_63832 ?auto_63833 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63840 - SURFACE
      ?auto_63841 - SURFACE
    )
    :vars
    (
      ?auto_63848 - HOIST
      ?auto_63847 - PLACE
      ?auto_63845 - SURFACE
      ?auto_63844 - PLACE
      ?auto_63842 - HOIST
      ?auto_63846 - SURFACE
      ?auto_63843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63848 ?auto_63847 ) ( IS-CRATE ?auto_63841 ) ( not ( = ?auto_63840 ?auto_63841 ) ) ( not ( = ?auto_63845 ?auto_63840 ) ) ( not ( = ?auto_63845 ?auto_63841 ) ) ( not ( = ?auto_63844 ?auto_63847 ) ) ( HOIST-AT ?auto_63842 ?auto_63844 ) ( not ( = ?auto_63848 ?auto_63842 ) ) ( AVAILABLE ?auto_63842 ) ( SURFACE-AT ?auto_63841 ?auto_63844 ) ( ON ?auto_63841 ?auto_63846 ) ( CLEAR ?auto_63841 ) ( not ( = ?auto_63840 ?auto_63846 ) ) ( not ( = ?auto_63841 ?auto_63846 ) ) ( not ( = ?auto_63845 ?auto_63846 ) ) ( SURFACE-AT ?auto_63845 ?auto_63847 ) ( CLEAR ?auto_63845 ) ( IS-CRATE ?auto_63840 ) ( AVAILABLE ?auto_63848 ) ( IN ?auto_63840 ?auto_63843 ) ( TRUCK-AT ?auto_63843 ?auto_63844 ) )
    :subtasks
    ( ( !DRIVE ?auto_63843 ?auto_63844 ?auto_63847 )
      ( MAKE-2CRATE ?auto_63845 ?auto_63840 ?auto_63841 )
      ( MAKE-1CRATE-VERIFY ?auto_63840 ?auto_63841 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63849 - SURFACE
      ?auto_63850 - SURFACE
      ?auto_63851 - SURFACE
    )
    :vars
    (
      ?auto_63852 - HOIST
      ?auto_63857 - PLACE
      ?auto_63856 - PLACE
      ?auto_63855 - HOIST
      ?auto_63854 - SURFACE
      ?auto_63853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63852 ?auto_63857 ) ( IS-CRATE ?auto_63851 ) ( not ( = ?auto_63850 ?auto_63851 ) ) ( not ( = ?auto_63849 ?auto_63850 ) ) ( not ( = ?auto_63849 ?auto_63851 ) ) ( not ( = ?auto_63856 ?auto_63857 ) ) ( HOIST-AT ?auto_63855 ?auto_63856 ) ( not ( = ?auto_63852 ?auto_63855 ) ) ( AVAILABLE ?auto_63855 ) ( SURFACE-AT ?auto_63851 ?auto_63856 ) ( ON ?auto_63851 ?auto_63854 ) ( CLEAR ?auto_63851 ) ( not ( = ?auto_63850 ?auto_63854 ) ) ( not ( = ?auto_63851 ?auto_63854 ) ) ( not ( = ?auto_63849 ?auto_63854 ) ) ( SURFACE-AT ?auto_63849 ?auto_63857 ) ( CLEAR ?auto_63849 ) ( IS-CRATE ?auto_63850 ) ( AVAILABLE ?auto_63852 ) ( IN ?auto_63850 ?auto_63853 ) ( TRUCK-AT ?auto_63853 ?auto_63856 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63850 ?auto_63851 )
      ( MAKE-2CRATE-VERIFY ?auto_63849 ?auto_63850 ?auto_63851 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63858 - SURFACE
      ?auto_63859 - SURFACE
    )
    :vars
    (
      ?auto_63865 - HOIST
      ?auto_63866 - PLACE
      ?auto_63864 - SURFACE
      ?auto_63862 - PLACE
      ?auto_63860 - HOIST
      ?auto_63863 - SURFACE
      ?auto_63861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63865 ?auto_63866 ) ( IS-CRATE ?auto_63859 ) ( not ( = ?auto_63858 ?auto_63859 ) ) ( not ( = ?auto_63864 ?auto_63858 ) ) ( not ( = ?auto_63864 ?auto_63859 ) ) ( not ( = ?auto_63862 ?auto_63866 ) ) ( HOIST-AT ?auto_63860 ?auto_63862 ) ( not ( = ?auto_63865 ?auto_63860 ) ) ( SURFACE-AT ?auto_63859 ?auto_63862 ) ( ON ?auto_63859 ?auto_63863 ) ( CLEAR ?auto_63859 ) ( not ( = ?auto_63858 ?auto_63863 ) ) ( not ( = ?auto_63859 ?auto_63863 ) ) ( not ( = ?auto_63864 ?auto_63863 ) ) ( SURFACE-AT ?auto_63864 ?auto_63866 ) ( CLEAR ?auto_63864 ) ( IS-CRATE ?auto_63858 ) ( AVAILABLE ?auto_63865 ) ( TRUCK-AT ?auto_63861 ?auto_63862 ) ( LIFTING ?auto_63860 ?auto_63858 ) )
    :subtasks
    ( ( !LOAD ?auto_63860 ?auto_63858 ?auto_63861 ?auto_63862 )
      ( MAKE-2CRATE ?auto_63864 ?auto_63858 ?auto_63859 )
      ( MAKE-1CRATE-VERIFY ?auto_63858 ?auto_63859 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63867 - SURFACE
      ?auto_63868 - SURFACE
      ?auto_63869 - SURFACE
    )
    :vars
    (
      ?auto_63870 - HOIST
      ?auto_63874 - PLACE
      ?auto_63871 - PLACE
      ?auto_63873 - HOIST
      ?auto_63872 - SURFACE
      ?auto_63875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63870 ?auto_63874 ) ( IS-CRATE ?auto_63869 ) ( not ( = ?auto_63868 ?auto_63869 ) ) ( not ( = ?auto_63867 ?auto_63868 ) ) ( not ( = ?auto_63867 ?auto_63869 ) ) ( not ( = ?auto_63871 ?auto_63874 ) ) ( HOIST-AT ?auto_63873 ?auto_63871 ) ( not ( = ?auto_63870 ?auto_63873 ) ) ( SURFACE-AT ?auto_63869 ?auto_63871 ) ( ON ?auto_63869 ?auto_63872 ) ( CLEAR ?auto_63869 ) ( not ( = ?auto_63868 ?auto_63872 ) ) ( not ( = ?auto_63869 ?auto_63872 ) ) ( not ( = ?auto_63867 ?auto_63872 ) ) ( SURFACE-AT ?auto_63867 ?auto_63874 ) ( CLEAR ?auto_63867 ) ( IS-CRATE ?auto_63868 ) ( AVAILABLE ?auto_63870 ) ( TRUCK-AT ?auto_63875 ?auto_63871 ) ( LIFTING ?auto_63873 ?auto_63868 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63868 ?auto_63869 )
      ( MAKE-2CRATE-VERIFY ?auto_63867 ?auto_63868 ?auto_63869 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63876 - SURFACE
      ?auto_63877 - SURFACE
    )
    :vars
    (
      ?auto_63878 - HOIST
      ?auto_63881 - PLACE
      ?auto_63879 - SURFACE
      ?auto_63884 - PLACE
      ?auto_63880 - HOIST
      ?auto_63882 - SURFACE
      ?auto_63883 - TRUCK
      ?auto_63885 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63878 ?auto_63881 ) ( IS-CRATE ?auto_63877 ) ( not ( = ?auto_63876 ?auto_63877 ) ) ( not ( = ?auto_63879 ?auto_63876 ) ) ( not ( = ?auto_63879 ?auto_63877 ) ) ( not ( = ?auto_63884 ?auto_63881 ) ) ( HOIST-AT ?auto_63880 ?auto_63884 ) ( not ( = ?auto_63878 ?auto_63880 ) ) ( SURFACE-AT ?auto_63877 ?auto_63884 ) ( ON ?auto_63877 ?auto_63882 ) ( CLEAR ?auto_63877 ) ( not ( = ?auto_63876 ?auto_63882 ) ) ( not ( = ?auto_63877 ?auto_63882 ) ) ( not ( = ?auto_63879 ?auto_63882 ) ) ( SURFACE-AT ?auto_63879 ?auto_63881 ) ( CLEAR ?auto_63879 ) ( IS-CRATE ?auto_63876 ) ( AVAILABLE ?auto_63878 ) ( TRUCK-AT ?auto_63883 ?auto_63884 ) ( AVAILABLE ?auto_63880 ) ( SURFACE-AT ?auto_63876 ?auto_63884 ) ( ON ?auto_63876 ?auto_63885 ) ( CLEAR ?auto_63876 ) ( not ( = ?auto_63876 ?auto_63885 ) ) ( not ( = ?auto_63877 ?auto_63885 ) ) ( not ( = ?auto_63879 ?auto_63885 ) ) ( not ( = ?auto_63882 ?auto_63885 ) ) )
    :subtasks
    ( ( !LIFT ?auto_63880 ?auto_63876 ?auto_63885 ?auto_63884 )
      ( MAKE-2CRATE ?auto_63879 ?auto_63876 ?auto_63877 )
      ( MAKE-1CRATE-VERIFY ?auto_63876 ?auto_63877 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63886 - SURFACE
      ?auto_63887 - SURFACE
      ?auto_63888 - SURFACE
    )
    :vars
    (
      ?auto_63890 - HOIST
      ?auto_63894 - PLACE
      ?auto_63893 - PLACE
      ?auto_63892 - HOIST
      ?auto_63889 - SURFACE
      ?auto_63891 - TRUCK
      ?auto_63895 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63890 ?auto_63894 ) ( IS-CRATE ?auto_63888 ) ( not ( = ?auto_63887 ?auto_63888 ) ) ( not ( = ?auto_63886 ?auto_63887 ) ) ( not ( = ?auto_63886 ?auto_63888 ) ) ( not ( = ?auto_63893 ?auto_63894 ) ) ( HOIST-AT ?auto_63892 ?auto_63893 ) ( not ( = ?auto_63890 ?auto_63892 ) ) ( SURFACE-AT ?auto_63888 ?auto_63893 ) ( ON ?auto_63888 ?auto_63889 ) ( CLEAR ?auto_63888 ) ( not ( = ?auto_63887 ?auto_63889 ) ) ( not ( = ?auto_63888 ?auto_63889 ) ) ( not ( = ?auto_63886 ?auto_63889 ) ) ( SURFACE-AT ?auto_63886 ?auto_63894 ) ( CLEAR ?auto_63886 ) ( IS-CRATE ?auto_63887 ) ( AVAILABLE ?auto_63890 ) ( TRUCK-AT ?auto_63891 ?auto_63893 ) ( AVAILABLE ?auto_63892 ) ( SURFACE-AT ?auto_63887 ?auto_63893 ) ( ON ?auto_63887 ?auto_63895 ) ( CLEAR ?auto_63887 ) ( not ( = ?auto_63887 ?auto_63895 ) ) ( not ( = ?auto_63888 ?auto_63895 ) ) ( not ( = ?auto_63886 ?auto_63895 ) ) ( not ( = ?auto_63889 ?auto_63895 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63887 ?auto_63888 )
      ( MAKE-2CRATE-VERIFY ?auto_63886 ?auto_63887 ?auto_63888 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63896 - SURFACE
      ?auto_63897 - SURFACE
    )
    :vars
    (
      ?auto_63901 - HOIST
      ?auto_63900 - PLACE
      ?auto_63905 - SURFACE
      ?auto_63903 - PLACE
      ?auto_63904 - HOIST
      ?auto_63899 - SURFACE
      ?auto_63898 - SURFACE
      ?auto_63902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63901 ?auto_63900 ) ( IS-CRATE ?auto_63897 ) ( not ( = ?auto_63896 ?auto_63897 ) ) ( not ( = ?auto_63905 ?auto_63896 ) ) ( not ( = ?auto_63905 ?auto_63897 ) ) ( not ( = ?auto_63903 ?auto_63900 ) ) ( HOIST-AT ?auto_63904 ?auto_63903 ) ( not ( = ?auto_63901 ?auto_63904 ) ) ( SURFACE-AT ?auto_63897 ?auto_63903 ) ( ON ?auto_63897 ?auto_63899 ) ( CLEAR ?auto_63897 ) ( not ( = ?auto_63896 ?auto_63899 ) ) ( not ( = ?auto_63897 ?auto_63899 ) ) ( not ( = ?auto_63905 ?auto_63899 ) ) ( SURFACE-AT ?auto_63905 ?auto_63900 ) ( CLEAR ?auto_63905 ) ( IS-CRATE ?auto_63896 ) ( AVAILABLE ?auto_63901 ) ( AVAILABLE ?auto_63904 ) ( SURFACE-AT ?auto_63896 ?auto_63903 ) ( ON ?auto_63896 ?auto_63898 ) ( CLEAR ?auto_63896 ) ( not ( = ?auto_63896 ?auto_63898 ) ) ( not ( = ?auto_63897 ?auto_63898 ) ) ( not ( = ?auto_63905 ?auto_63898 ) ) ( not ( = ?auto_63899 ?auto_63898 ) ) ( TRUCK-AT ?auto_63902 ?auto_63900 ) )
    :subtasks
    ( ( !DRIVE ?auto_63902 ?auto_63900 ?auto_63903 )
      ( MAKE-2CRATE ?auto_63905 ?auto_63896 ?auto_63897 )
      ( MAKE-1CRATE-VERIFY ?auto_63896 ?auto_63897 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63906 - SURFACE
      ?auto_63907 - SURFACE
      ?auto_63908 - SURFACE
    )
    :vars
    (
      ?auto_63910 - HOIST
      ?auto_63913 - PLACE
      ?auto_63912 - PLACE
      ?auto_63911 - HOIST
      ?auto_63914 - SURFACE
      ?auto_63909 - SURFACE
      ?auto_63915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63910 ?auto_63913 ) ( IS-CRATE ?auto_63908 ) ( not ( = ?auto_63907 ?auto_63908 ) ) ( not ( = ?auto_63906 ?auto_63907 ) ) ( not ( = ?auto_63906 ?auto_63908 ) ) ( not ( = ?auto_63912 ?auto_63913 ) ) ( HOIST-AT ?auto_63911 ?auto_63912 ) ( not ( = ?auto_63910 ?auto_63911 ) ) ( SURFACE-AT ?auto_63908 ?auto_63912 ) ( ON ?auto_63908 ?auto_63914 ) ( CLEAR ?auto_63908 ) ( not ( = ?auto_63907 ?auto_63914 ) ) ( not ( = ?auto_63908 ?auto_63914 ) ) ( not ( = ?auto_63906 ?auto_63914 ) ) ( SURFACE-AT ?auto_63906 ?auto_63913 ) ( CLEAR ?auto_63906 ) ( IS-CRATE ?auto_63907 ) ( AVAILABLE ?auto_63910 ) ( AVAILABLE ?auto_63911 ) ( SURFACE-AT ?auto_63907 ?auto_63912 ) ( ON ?auto_63907 ?auto_63909 ) ( CLEAR ?auto_63907 ) ( not ( = ?auto_63907 ?auto_63909 ) ) ( not ( = ?auto_63908 ?auto_63909 ) ) ( not ( = ?auto_63906 ?auto_63909 ) ) ( not ( = ?auto_63914 ?auto_63909 ) ) ( TRUCK-AT ?auto_63915 ?auto_63913 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63907 ?auto_63908 )
      ( MAKE-2CRATE-VERIFY ?auto_63906 ?auto_63907 ?auto_63908 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_63935 - SURFACE
      ?auto_63936 - SURFACE
      ?auto_63937 - SURFACE
      ?auto_63934 - SURFACE
    )
    :vars
    (
      ?auto_63938 - HOIST
      ?auto_63939 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63938 ?auto_63939 ) ( SURFACE-AT ?auto_63937 ?auto_63939 ) ( CLEAR ?auto_63937 ) ( LIFTING ?auto_63938 ?auto_63934 ) ( IS-CRATE ?auto_63934 ) ( not ( = ?auto_63937 ?auto_63934 ) ) ( ON ?auto_63936 ?auto_63935 ) ( ON ?auto_63937 ?auto_63936 ) ( not ( = ?auto_63935 ?auto_63936 ) ) ( not ( = ?auto_63935 ?auto_63937 ) ) ( not ( = ?auto_63935 ?auto_63934 ) ) ( not ( = ?auto_63936 ?auto_63937 ) ) ( not ( = ?auto_63936 ?auto_63934 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63937 ?auto_63934 )
      ( MAKE-3CRATE-VERIFY ?auto_63935 ?auto_63936 ?auto_63937 ?auto_63934 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_63952 - SURFACE
      ?auto_63953 - SURFACE
      ?auto_63954 - SURFACE
      ?auto_63951 - SURFACE
    )
    :vars
    (
      ?auto_63955 - HOIST
      ?auto_63957 - PLACE
      ?auto_63956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63955 ?auto_63957 ) ( SURFACE-AT ?auto_63954 ?auto_63957 ) ( CLEAR ?auto_63954 ) ( IS-CRATE ?auto_63951 ) ( not ( = ?auto_63954 ?auto_63951 ) ) ( TRUCK-AT ?auto_63956 ?auto_63957 ) ( AVAILABLE ?auto_63955 ) ( IN ?auto_63951 ?auto_63956 ) ( ON ?auto_63954 ?auto_63953 ) ( not ( = ?auto_63953 ?auto_63954 ) ) ( not ( = ?auto_63953 ?auto_63951 ) ) ( ON ?auto_63953 ?auto_63952 ) ( not ( = ?auto_63952 ?auto_63953 ) ) ( not ( = ?auto_63952 ?auto_63954 ) ) ( not ( = ?auto_63952 ?auto_63951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_63953 ?auto_63954 ?auto_63951 )
      ( MAKE-3CRATE-VERIFY ?auto_63952 ?auto_63953 ?auto_63954 ?auto_63951 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_63973 - SURFACE
      ?auto_63974 - SURFACE
      ?auto_63975 - SURFACE
      ?auto_63972 - SURFACE
    )
    :vars
    (
      ?auto_63978 - HOIST
      ?auto_63979 - PLACE
      ?auto_63977 - TRUCK
      ?auto_63976 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63978 ?auto_63979 ) ( SURFACE-AT ?auto_63975 ?auto_63979 ) ( CLEAR ?auto_63975 ) ( IS-CRATE ?auto_63972 ) ( not ( = ?auto_63975 ?auto_63972 ) ) ( AVAILABLE ?auto_63978 ) ( IN ?auto_63972 ?auto_63977 ) ( ON ?auto_63975 ?auto_63974 ) ( not ( = ?auto_63974 ?auto_63975 ) ) ( not ( = ?auto_63974 ?auto_63972 ) ) ( TRUCK-AT ?auto_63977 ?auto_63976 ) ( not ( = ?auto_63976 ?auto_63979 ) ) ( ON ?auto_63974 ?auto_63973 ) ( not ( = ?auto_63973 ?auto_63974 ) ) ( not ( = ?auto_63973 ?auto_63975 ) ) ( not ( = ?auto_63973 ?auto_63972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_63974 ?auto_63975 ?auto_63972 )
      ( MAKE-3CRATE-VERIFY ?auto_63973 ?auto_63974 ?auto_63975 ?auto_63972 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_63997 - SURFACE
      ?auto_63998 - SURFACE
      ?auto_63999 - SURFACE
      ?auto_63996 - SURFACE
    )
    :vars
    (
      ?auto_64001 - HOIST
      ?auto_64003 - PLACE
      ?auto_64002 - TRUCK
      ?auto_64004 - PLACE
      ?auto_64000 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64001 ?auto_64003 ) ( SURFACE-AT ?auto_63999 ?auto_64003 ) ( CLEAR ?auto_63999 ) ( IS-CRATE ?auto_63996 ) ( not ( = ?auto_63999 ?auto_63996 ) ) ( AVAILABLE ?auto_64001 ) ( ON ?auto_63999 ?auto_63998 ) ( not ( = ?auto_63998 ?auto_63999 ) ) ( not ( = ?auto_63998 ?auto_63996 ) ) ( TRUCK-AT ?auto_64002 ?auto_64004 ) ( not ( = ?auto_64004 ?auto_64003 ) ) ( HOIST-AT ?auto_64000 ?auto_64004 ) ( LIFTING ?auto_64000 ?auto_63996 ) ( not ( = ?auto_64001 ?auto_64000 ) ) ( ON ?auto_63998 ?auto_63997 ) ( not ( = ?auto_63997 ?auto_63998 ) ) ( not ( = ?auto_63997 ?auto_63999 ) ) ( not ( = ?auto_63997 ?auto_63996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_63998 ?auto_63999 ?auto_63996 )
      ( MAKE-3CRATE-VERIFY ?auto_63997 ?auto_63998 ?auto_63999 ?auto_63996 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_64024 - SURFACE
      ?auto_64025 - SURFACE
      ?auto_64026 - SURFACE
      ?auto_64023 - SURFACE
    )
    :vars
    (
      ?auto_64031 - HOIST
      ?auto_64032 - PLACE
      ?auto_64027 - TRUCK
      ?auto_64028 - PLACE
      ?auto_64029 - HOIST
      ?auto_64030 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64031 ?auto_64032 ) ( SURFACE-AT ?auto_64026 ?auto_64032 ) ( CLEAR ?auto_64026 ) ( IS-CRATE ?auto_64023 ) ( not ( = ?auto_64026 ?auto_64023 ) ) ( AVAILABLE ?auto_64031 ) ( ON ?auto_64026 ?auto_64025 ) ( not ( = ?auto_64025 ?auto_64026 ) ) ( not ( = ?auto_64025 ?auto_64023 ) ) ( TRUCK-AT ?auto_64027 ?auto_64028 ) ( not ( = ?auto_64028 ?auto_64032 ) ) ( HOIST-AT ?auto_64029 ?auto_64028 ) ( not ( = ?auto_64031 ?auto_64029 ) ) ( AVAILABLE ?auto_64029 ) ( SURFACE-AT ?auto_64023 ?auto_64028 ) ( ON ?auto_64023 ?auto_64030 ) ( CLEAR ?auto_64023 ) ( not ( = ?auto_64026 ?auto_64030 ) ) ( not ( = ?auto_64023 ?auto_64030 ) ) ( not ( = ?auto_64025 ?auto_64030 ) ) ( ON ?auto_64025 ?auto_64024 ) ( not ( = ?auto_64024 ?auto_64025 ) ) ( not ( = ?auto_64024 ?auto_64026 ) ) ( not ( = ?auto_64024 ?auto_64023 ) ) ( not ( = ?auto_64024 ?auto_64030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64025 ?auto_64026 ?auto_64023 )
      ( MAKE-3CRATE-VERIFY ?auto_64024 ?auto_64025 ?auto_64026 ?auto_64023 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_64052 - SURFACE
      ?auto_64053 - SURFACE
      ?auto_64054 - SURFACE
      ?auto_64051 - SURFACE
    )
    :vars
    (
      ?auto_64060 - HOIST
      ?auto_64058 - PLACE
      ?auto_64055 - PLACE
      ?auto_64056 - HOIST
      ?auto_64059 - SURFACE
      ?auto_64057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64060 ?auto_64058 ) ( SURFACE-AT ?auto_64054 ?auto_64058 ) ( CLEAR ?auto_64054 ) ( IS-CRATE ?auto_64051 ) ( not ( = ?auto_64054 ?auto_64051 ) ) ( AVAILABLE ?auto_64060 ) ( ON ?auto_64054 ?auto_64053 ) ( not ( = ?auto_64053 ?auto_64054 ) ) ( not ( = ?auto_64053 ?auto_64051 ) ) ( not ( = ?auto_64055 ?auto_64058 ) ) ( HOIST-AT ?auto_64056 ?auto_64055 ) ( not ( = ?auto_64060 ?auto_64056 ) ) ( AVAILABLE ?auto_64056 ) ( SURFACE-AT ?auto_64051 ?auto_64055 ) ( ON ?auto_64051 ?auto_64059 ) ( CLEAR ?auto_64051 ) ( not ( = ?auto_64054 ?auto_64059 ) ) ( not ( = ?auto_64051 ?auto_64059 ) ) ( not ( = ?auto_64053 ?auto_64059 ) ) ( TRUCK-AT ?auto_64057 ?auto_64058 ) ( ON ?auto_64053 ?auto_64052 ) ( not ( = ?auto_64052 ?auto_64053 ) ) ( not ( = ?auto_64052 ?auto_64054 ) ) ( not ( = ?auto_64052 ?auto_64051 ) ) ( not ( = ?auto_64052 ?auto_64059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64053 ?auto_64054 ?auto_64051 )
      ( MAKE-3CRATE-VERIFY ?auto_64052 ?auto_64053 ?auto_64054 ?auto_64051 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_64080 - SURFACE
      ?auto_64081 - SURFACE
      ?auto_64082 - SURFACE
      ?auto_64079 - SURFACE
    )
    :vars
    (
      ?auto_64085 - HOIST
      ?auto_64084 - PLACE
      ?auto_64086 - PLACE
      ?auto_64083 - HOIST
      ?auto_64087 - SURFACE
      ?auto_64088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64085 ?auto_64084 ) ( IS-CRATE ?auto_64079 ) ( not ( = ?auto_64082 ?auto_64079 ) ) ( not ( = ?auto_64081 ?auto_64082 ) ) ( not ( = ?auto_64081 ?auto_64079 ) ) ( not ( = ?auto_64086 ?auto_64084 ) ) ( HOIST-AT ?auto_64083 ?auto_64086 ) ( not ( = ?auto_64085 ?auto_64083 ) ) ( AVAILABLE ?auto_64083 ) ( SURFACE-AT ?auto_64079 ?auto_64086 ) ( ON ?auto_64079 ?auto_64087 ) ( CLEAR ?auto_64079 ) ( not ( = ?auto_64082 ?auto_64087 ) ) ( not ( = ?auto_64079 ?auto_64087 ) ) ( not ( = ?auto_64081 ?auto_64087 ) ) ( TRUCK-AT ?auto_64088 ?auto_64084 ) ( SURFACE-AT ?auto_64081 ?auto_64084 ) ( CLEAR ?auto_64081 ) ( LIFTING ?auto_64085 ?auto_64082 ) ( IS-CRATE ?auto_64082 ) ( ON ?auto_64081 ?auto_64080 ) ( not ( = ?auto_64080 ?auto_64081 ) ) ( not ( = ?auto_64080 ?auto_64082 ) ) ( not ( = ?auto_64080 ?auto_64079 ) ) ( not ( = ?auto_64080 ?auto_64087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64081 ?auto_64082 ?auto_64079 )
      ( MAKE-3CRATE-VERIFY ?auto_64080 ?auto_64081 ?auto_64082 ?auto_64079 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_64108 - SURFACE
      ?auto_64109 - SURFACE
      ?auto_64110 - SURFACE
      ?auto_64107 - SURFACE
    )
    :vars
    (
      ?auto_64113 - HOIST
      ?auto_64116 - PLACE
      ?auto_64112 - PLACE
      ?auto_64115 - HOIST
      ?auto_64111 - SURFACE
      ?auto_64114 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64113 ?auto_64116 ) ( IS-CRATE ?auto_64107 ) ( not ( = ?auto_64110 ?auto_64107 ) ) ( not ( = ?auto_64109 ?auto_64110 ) ) ( not ( = ?auto_64109 ?auto_64107 ) ) ( not ( = ?auto_64112 ?auto_64116 ) ) ( HOIST-AT ?auto_64115 ?auto_64112 ) ( not ( = ?auto_64113 ?auto_64115 ) ) ( AVAILABLE ?auto_64115 ) ( SURFACE-AT ?auto_64107 ?auto_64112 ) ( ON ?auto_64107 ?auto_64111 ) ( CLEAR ?auto_64107 ) ( not ( = ?auto_64110 ?auto_64111 ) ) ( not ( = ?auto_64107 ?auto_64111 ) ) ( not ( = ?auto_64109 ?auto_64111 ) ) ( TRUCK-AT ?auto_64114 ?auto_64116 ) ( SURFACE-AT ?auto_64109 ?auto_64116 ) ( CLEAR ?auto_64109 ) ( IS-CRATE ?auto_64110 ) ( AVAILABLE ?auto_64113 ) ( IN ?auto_64110 ?auto_64114 ) ( ON ?auto_64109 ?auto_64108 ) ( not ( = ?auto_64108 ?auto_64109 ) ) ( not ( = ?auto_64108 ?auto_64110 ) ) ( not ( = ?auto_64108 ?auto_64107 ) ) ( not ( = ?auto_64108 ?auto_64111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64109 ?auto_64110 ?auto_64107 )
      ( MAKE-3CRATE-VERIFY ?auto_64108 ?auto_64109 ?auto_64110 ?auto_64107 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_64186 - SURFACE
      ?auto_64187 - SURFACE
    )
    :vars
    (
      ?auto_64193 - HOIST
      ?auto_64189 - PLACE
      ?auto_64192 - SURFACE
      ?auto_64188 - PLACE
      ?auto_64190 - HOIST
      ?auto_64194 - SURFACE
      ?auto_64191 - TRUCK
      ?auto_64195 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64193 ?auto_64189 ) ( SURFACE-AT ?auto_64186 ?auto_64189 ) ( CLEAR ?auto_64186 ) ( IS-CRATE ?auto_64187 ) ( not ( = ?auto_64186 ?auto_64187 ) ) ( AVAILABLE ?auto_64193 ) ( ON ?auto_64186 ?auto_64192 ) ( not ( = ?auto_64192 ?auto_64186 ) ) ( not ( = ?auto_64192 ?auto_64187 ) ) ( not ( = ?auto_64188 ?auto_64189 ) ) ( HOIST-AT ?auto_64190 ?auto_64188 ) ( not ( = ?auto_64193 ?auto_64190 ) ) ( AVAILABLE ?auto_64190 ) ( SURFACE-AT ?auto_64187 ?auto_64188 ) ( ON ?auto_64187 ?auto_64194 ) ( CLEAR ?auto_64187 ) ( not ( = ?auto_64186 ?auto_64194 ) ) ( not ( = ?auto_64187 ?auto_64194 ) ) ( not ( = ?auto_64192 ?auto_64194 ) ) ( TRUCK-AT ?auto_64191 ?auto_64195 ) ( not ( = ?auto_64195 ?auto_64189 ) ) ( not ( = ?auto_64188 ?auto_64195 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_64191 ?auto_64195 ?auto_64189 )
      ( MAKE-1CRATE ?auto_64186 ?auto_64187 )
      ( MAKE-1CRATE-VERIFY ?auto_64186 ?auto_64187 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_64292 - SURFACE
      ?auto_64293 - SURFACE
    )
    :vars
    (
      ?auto_64295 - HOIST
      ?auto_64299 - PLACE
      ?auto_64296 - SURFACE
      ?auto_64300 - PLACE
      ?auto_64294 - HOIST
      ?auto_64297 - SURFACE
      ?auto_64298 - TRUCK
      ?auto_64301 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64295 ?auto_64299 ) ( SURFACE-AT ?auto_64292 ?auto_64299 ) ( CLEAR ?auto_64292 ) ( IS-CRATE ?auto_64293 ) ( not ( = ?auto_64292 ?auto_64293 ) ) ( ON ?auto_64292 ?auto_64296 ) ( not ( = ?auto_64296 ?auto_64292 ) ) ( not ( = ?auto_64296 ?auto_64293 ) ) ( not ( = ?auto_64300 ?auto_64299 ) ) ( HOIST-AT ?auto_64294 ?auto_64300 ) ( not ( = ?auto_64295 ?auto_64294 ) ) ( AVAILABLE ?auto_64294 ) ( SURFACE-AT ?auto_64293 ?auto_64300 ) ( ON ?auto_64293 ?auto_64297 ) ( CLEAR ?auto_64293 ) ( not ( = ?auto_64292 ?auto_64297 ) ) ( not ( = ?auto_64293 ?auto_64297 ) ) ( not ( = ?auto_64296 ?auto_64297 ) ) ( TRUCK-AT ?auto_64298 ?auto_64299 ) ( LIFTING ?auto_64295 ?auto_64301 ) ( IS-CRATE ?auto_64301 ) ( not ( = ?auto_64292 ?auto_64301 ) ) ( not ( = ?auto_64293 ?auto_64301 ) ) ( not ( = ?auto_64296 ?auto_64301 ) ) ( not ( = ?auto_64297 ?auto_64301 ) ) )
    :subtasks
    ( ( !LOAD ?auto_64295 ?auto_64301 ?auto_64298 ?auto_64299 )
      ( MAKE-1CRATE ?auto_64292 ?auto_64293 )
      ( MAKE-1CRATE-VERIFY ?auto_64292 ?auto_64293 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64401 - SURFACE
      ?auto_64402 - SURFACE
      ?auto_64403 - SURFACE
      ?auto_64400 - SURFACE
      ?auto_64404 - SURFACE
    )
    :vars
    (
      ?auto_64405 - HOIST
      ?auto_64406 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64405 ?auto_64406 ) ( SURFACE-AT ?auto_64400 ?auto_64406 ) ( CLEAR ?auto_64400 ) ( LIFTING ?auto_64405 ?auto_64404 ) ( IS-CRATE ?auto_64404 ) ( not ( = ?auto_64400 ?auto_64404 ) ) ( ON ?auto_64402 ?auto_64401 ) ( ON ?auto_64403 ?auto_64402 ) ( ON ?auto_64400 ?auto_64403 ) ( not ( = ?auto_64401 ?auto_64402 ) ) ( not ( = ?auto_64401 ?auto_64403 ) ) ( not ( = ?auto_64401 ?auto_64400 ) ) ( not ( = ?auto_64401 ?auto_64404 ) ) ( not ( = ?auto_64402 ?auto_64403 ) ) ( not ( = ?auto_64402 ?auto_64400 ) ) ( not ( = ?auto_64402 ?auto_64404 ) ) ( not ( = ?auto_64403 ?auto_64400 ) ) ( not ( = ?auto_64403 ?auto_64404 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_64400 ?auto_64404 )
      ( MAKE-4CRATE-VERIFY ?auto_64401 ?auto_64402 ?auto_64403 ?auto_64400 ?auto_64404 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64426 - SURFACE
      ?auto_64427 - SURFACE
      ?auto_64428 - SURFACE
      ?auto_64425 - SURFACE
      ?auto_64429 - SURFACE
    )
    :vars
    (
      ?auto_64432 - HOIST
      ?auto_64430 - PLACE
      ?auto_64431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64432 ?auto_64430 ) ( SURFACE-AT ?auto_64425 ?auto_64430 ) ( CLEAR ?auto_64425 ) ( IS-CRATE ?auto_64429 ) ( not ( = ?auto_64425 ?auto_64429 ) ) ( TRUCK-AT ?auto_64431 ?auto_64430 ) ( AVAILABLE ?auto_64432 ) ( IN ?auto_64429 ?auto_64431 ) ( ON ?auto_64425 ?auto_64428 ) ( not ( = ?auto_64428 ?auto_64425 ) ) ( not ( = ?auto_64428 ?auto_64429 ) ) ( ON ?auto_64427 ?auto_64426 ) ( ON ?auto_64428 ?auto_64427 ) ( not ( = ?auto_64426 ?auto_64427 ) ) ( not ( = ?auto_64426 ?auto_64428 ) ) ( not ( = ?auto_64426 ?auto_64425 ) ) ( not ( = ?auto_64426 ?auto_64429 ) ) ( not ( = ?auto_64427 ?auto_64428 ) ) ( not ( = ?auto_64427 ?auto_64425 ) ) ( not ( = ?auto_64427 ?auto_64429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64428 ?auto_64425 ?auto_64429 )
      ( MAKE-4CRATE-VERIFY ?auto_64426 ?auto_64427 ?auto_64428 ?auto_64425 ?auto_64429 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64456 - SURFACE
      ?auto_64457 - SURFACE
      ?auto_64458 - SURFACE
      ?auto_64455 - SURFACE
      ?auto_64459 - SURFACE
    )
    :vars
    (
      ?auto_64461 - HOIST
      ?auto_64462 - PLACE
      ?auto_64460 - TRUCK
      ?auto_64463 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64461 ?auto_64462 ) ( SURFACE-AT ?auto_64455 ?auto_64462 ) ( CLEAR ?auto_64455 ) ( IS-CRATE ?auto_64459 ) ( not ( = ?auto_64455 ?auto_64459 ) ) ( AVAILABLE ?auto_64461 ) ( IN ?auto_64459 ?auto_64460 ) ( ON ?auto_64455 ?auto_64458 ) ( not ( = ?auto_64458 ?auto_64455 ) ) ( not ( = ?auto_64458 ?auto_64459 ) ) ( TRUCK-AT ?auto_64460 ?auto_64463 ) ( not ( = ?auto_64463 ?auto_64462 ) ) ( ON ?auto_64457 ?auto_64456 ) ( ON ?auto_64458 ?auto_64457 ) ( not ( = ?auto_64456 ?auto_64457 ) ) ( not ( = ?auto_64456 ?auto_64458 ) ) ( not ( = ?auto_64456 ?auto_64455 ) ) ( not ( = ?auto_64456 ?auto_64459 ) ) ( not ( = ?auto_64457 ?auto_64458 ) ) ( not ( = ?auto_64457 ?auto_64455 ) ) ( not ( = ?auto_64457 ?auto_64459 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64458 ?auto_64455 ?auto_64459 )
      ( MAKE-4CRATE-VERIFY ?auto_64456 ?auto_64457 ?auto_64458 ?auto_64455 ?auto_64459 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64490 - SURFACE
      ?auto_64491 - SURFACE
      ?auto_64492 - SURFACE
      ?auto_64489 - SURFACE
      ?auto_64493 - SURFACE
    )
    :vars
    (
      ?auto_64497 - HOIST
      ?auto_64495 - PLACE
      ?auto_64496 - TRUCK
      ?auto_64494 - PLACE
      ?auto_64498 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64497 ?auto_64495 ) ( SURFACE-AT ?auto_64489 ?auto_64495 ) ( CLEAR ?auto_64489 ) ( IS-CRATE ?auto_64493 ) ( not ( = ?auto_64489 ?auto_64493 ) ) ( AVAILABLE ?auto_64497 ) ( ON ?auto_64489 ?auto_64492 ) ( not ( = ?auto_64492 ?auto_64489 ) ) ( not ( = ?auto_64492 ?auto_64493 ) ) ( TRUCK-AT ?auto_64496 ?auto_64494 ) ( not ( = ?auto_64494 ?auto_64495 ) ) ( HOIST-AT ?auto_64498 ?auto_64494 ) ( LIFTING ?auto_64498 ?auto_64493 ) ( not ( = ?auto_64497 ?auto_64498 ) ) ( ON ?auto_64491 ?auto_64490 ) ( ON ?auto_64492 ?auto_64491 ) ( not ( = ?auto_64490 ?auto_64491 ) ) ( not ( = ?auto_64490 ?auto_64492 ) ) ( not ( = ?auto_64490 ?auto_64489 ) ) ( not ( = ?auto_64490 ?auto_64493 ) ) ( not ( = ?auto_64491 ?auto_64492 ) ) ( not ( = ?auto_64491 ?auto_64489 ) ) ( not ( = ?auto_64491 ?auto_64493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64492 ?auto_64489 ?auto_64493 )
      ( MAKE-4CRATE-VERIFY ?auto_64490 ?auto_64491 ?auto_64492 ?auto_64489 ?auto_64493 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64528 - SURFACE
      ?auto_64529 - SURFACE
      ?auto_64530 - SURFACE
      ?auto_64527 - SURFACE
      ?auto_64531 - SURFACE
    )
    :vars
    (
      ?auto_64532 - HOIST
      ?auto_64536 - PLACE
      ?auto_64537 - TRUCK
      ?auto_64535 - PLACE
      ?auto_64533 - HOIST
      ?auto_64534 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64532 ?auto_64536 ) ( SURFACE-AT ?auto_64527 ?auto_64536 ) ( CLEAR ?auto_64527 ) ( IS-CRATE ?auto_64531 ) ( not ( = ?auto_64527 ?auto_64531 ) ) ( AVAILABLE ?auto_64532 ) ( ON ?auto_64527 ?auto_64530 ) ( not ( = ?auto_64530 ?auto_64527 ) ) ( not ( = ?auto_64530 ?auto_64531 ) ) ( TRUCK-AT ?auto_64537 ?auto_64535 ) ( not ( = ?auto_64535 ?auto_64536 ) ) ( HOIST-AT ?auto_64533 ?auto_64535 ) ( not ( = ?auto_64532 ?auto_64533 ) ) ( AVAILABLE ?auto_64533 ) ( SURFACE-AT ?auto_64531 ?auto_64535 ) ( ON ?auto_64531 ?auto_64534 ) ( CLEAR ?auto_64531 ) ( not ( = ?auto_64527 ?auto_64534 ) ) ( not ( = ?auto_64531 ?auto_64534 ) ) ( not ( = ?auto_64530 ?auto_64534 ) ) ( ON ?auto_64529 ?auto_64528 ) ( ON ?auto_64530 ?auto_64529 ) ( not ( = ?auto_64528 ?auto_64529 ) ) ( not ( = ?auto_64528 ?auto_64530 ) ) ( not ( = ?auto_64528 ?auto_64527 ) ) ( not ( = ?auto_64528 ?auto_64531 ) ) ( not ( = ?auto_64528 ?auto_64534 ) ) ( not ( = ?auto_64529 ?auto_64530 ) ) ( not ( = ?auto_64529 ?auto_64527 ) ) ( not ( = ?auto_64529 ?auto_64531 ) ) ( not ( = ?auto_64529 ?auto_64534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64530 ?auto_64527 ?auto_64531 )
      ( MAKE-4CRATE-VERIFY ?auto_64528 ?auto_64529 ?auto_64530 ?auto_64527 ?auto_64531 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64567 - SURFACE
      ?auto_64568 - SURFACE
      ?auto_64569 - SURFACE
      ?auto_64566 - SURFACE
      ?auto_64570 - SURFACE
    )
    :vars
    (
      ?auto_64575 - HOIST
      ?auto_64574 - PLACE
      ?auto_64573 - PLACE
      ?auto_64572 - HOIST
      ?auto_64571 - SURFACE
      ?auto_64576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64575 ?auto_64574 ) ( SURFACE-AT ?auto_64566 ?auto_64574 ) ( CLEAR ?auto_64566 ) ( IS-CRATE ?auto_64570 ) ( not ( = ?auto_64566 ?auto_64570 ) ) ( AVAILABLE ?auto_64575 ) ( ON ?auto_64566 ?auto_64569 ) ( not ( = ?auto_64569 ?auto_64566 ) ) ( not ( = ?auto_64569 ?auto_64570 ) ) ( not ( = ?auto_64573 ?auto_64574 ) ) ( HOIST-AT ?auto_64572 ?auto_64573 ) ( not ( = ?auto_64575 ?auto_64572 ) ) ( AVAILABLE ?auto_64572 ) ( SURFACE-AT ?auto_64570 ?auto_64573 ) ( ON ?auto_64570 ?auto_64571 ) ( CLEAR ?auto_64570 ) ( not ( = ?auto_64566 ?auto_64571 ) ) ( not ( = ?auto_64570 ?auto_64571 ) ) ( not ( = ?auto_64569 ?auto_64571 ) ) ( TRUCK-AT ?auto_64576 ?auto_64574 ) ( ON ?auto_64568 ?auto_64567 ) ( ON ?auto_64569 ?auto_64568 ) ( not ( = ?auto_64567 ?auto_64568 ) ) ( not ( = ?auto_64567 ?auto_64569 ) ) ( not ( = ?auto_64567 ?auto_64566 ) ) ( not ( = ?auto_64567 ?auto_64570 ) ) ( not ( = ?auto_64567 ?auto_64571 ) ) ( not ( = ?auto_64568 ?auto_64569 ) ) ( not ( = ?auto_64568 ?auto_64566 ) ) ( not ( = ?auto_64568 ?auto_64570 ) ) ( not ( = ?auto_64568 ?auto_64571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64569 ?auto_64566 ?auto_64570 )
      ( MAKE-4CRATE-VERIFY ?auto_64567 ?auto_64568 ?auto_64569 ?auto_64566 ?auto_64570 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64606 - SURFACE
      ?auto_64607 - SURFACE
      ?auto_64608 - SURFACE
      ?auto_64605 - SURFACE
      ?auto_64609 - SURFACE
    )
    :vars
    (
      ?auto_64614 - HOIST
      ?auto_64611 - PLACE
      ?auto_64612 - PLACE
      ?auto_64613 - HOIST
      ?auto_64615 - SURFACE
      ?auto_64610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64614 ?auto_64611 ) ( IS-CRATE ?auto_64609 ) ( not ( = ?auto_64605 ?auto_64609 ) ) ( not ( = ?auto_64608 ?auto_64605 ) ) ( not ( = ?auto_64608 ?auto_64609 ) ) ( not ( = ?auto_64612 ?auto_64611 ) ) ( HOIST-AT ?auto_64613 ?auto_64612 ) ( not ( = ?auto_64614 ?auto_64613 ) ) ( AVAILABLE ?auto_64613 ) ( SURFACE-AT ?auto_64609 ?auto_64612 ) ( ON ?auto_64609 ?auto_64615 ) ( CLEAR ?auto_64609 ) ( not ( = ?auto_64605 ?auto_64615 ) ) ( not ( = ?auto_64609 ?auto_64615 ) ) ( not ( = ?auto_64608 ?auto_64615 ) ) ( TRUCK-AT ?auto_64610 ?auto_64611 ) ( SURFACE-AT ?auto_64608 ?auto_64611 ) ( CLEAR ?auto_64608 ) ( LIFTING ?auto_64614 ?auto_64605 ) ( IS-CRATE ?auto_64605 ) ( ON ?auto_64607 ?auto_64606 ) ( ON ?auto_64608 ?auto_64607 ) ( not ( = ?auto_64606 ?auto_64607 ) ) ( not ( = ?auto_64606 ?auto_64608 ) ) ( not ( = ?auto_64606 ?auto_64605 ) ) ( not ( = ?auto_64606 ?auto_64609 ) ) ( not ( = ?auto_64606 ?auto_64615 ) ) ( not ( = ?auto_64607 ?auto_64608 ) ) ( not ( = ?auto_64607 ?auto_64605 ) ) ( not ( = ?auto_64607 ?auto_64609 ) ) ( not ( = ?auto_64607 ?auto_64615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64608 ?auto_64605 ?auto_64609 )
      ( MAKE-4CRATE-VERIFY ?auto_64606 ?auto_64607 ?auto_64608 ?auto_64605 ?auto_64609 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64645 - SURFACE
      ?auto_64646 - SURFACE
      ?auto_64647 - SURFACE
      ?auto_64644 - SURFACE
      ?auto_64648 - SURFACE
    )
    :vars
    (
      ?auto_64649 - HOIST
      ?auto_64654 - PLACE
      ?auto_64651 - PLACE
      ?auto_64653 - HOIST
      ?auto_64650 - SURFACE
      ?auto_64652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64649 ?auto_64654 ) ( IS-CRATE ?auto_64648 ) ( not ( = ?auto_64644 ?auto_64648 ) ) ( not ( = ?auto_64647 ?auto_64644 ) ) ( not ( = ?auto_64647 ?auto_64648 ) ) ( not ( = ?auto_64651 ?auto_64654 ) ) ( HOIST-AT ?auto_64653 ?auto_64651 ) ( not ( = ?auto_64649 ?auto_64653 ) ) ( AVAILABLE ?auto_64653 ) ( SURFACE-AT ?auto_64648 ?auto_64651 ) ( ON ?auto_64648 ?auto_64650 ) ( CLEAR ?auto_64648 ) ( not ( = ?auto_64644 ?auto_64650 ) ) ( not ( = ?auto_64648 ?auto_64650 ) ) ( not ( = ?auto_64647 ?auto_64650 ) ) ( TRUCK-AT ?auto_64652 ?auto_64654 ) ( SURFACE-AT ?auto_64647 ?auto_64654 ) ( CLEAR ?auto_64647 ) ( IS-CRATE ?auto_64644 ) ( AVAILABLE ?auto_64649 ) ( IN ?auto_64644 ?auto_64652 ) ( ON ?auto_64646 ?auto_64645 ) ( ON ?auto_64647 ?auto_64646 ) ( not ( = ?auto_64645 ?auto_64646 ) ) ( not ( = ?auto_64645 ?auto_64647 ) ) ( not ( = ?auto_64645 ?auto_64644 ) ) ( not ( = ?auto_64645 ?auto_64648 ) ) ( not ( = ?auto_64645 ?auto_64650 ) ) ( not ( = ?auto_64646 ?auto_64647 ) ) ( not ( = ?auto_64646 ?auto_64644 ) ) ( not ( = ?auto_64646 ?auto_64648 ) ) ( not ( = ?auto_64646 ?auto_64650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64647 ?auto_64644 ?auto_64648 )
      ( MAKE-4CRATE-VERIFY ?auto_64645 ?auto_64646 ?auto_64647 ?auto_64644 ?auto_64648 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65305 - SURFACE
      ?auto_65306 - SURFACE
      ?auto_65307 - SURFACE
      ?auto_65304 - SURFACE
      ?auto_65308 - SURFACE
      ?auto_65309 - SURFACE
    )
    :vars
    (
      ?auto_65310 - HOIST
      ?auto_65311 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65310 ?auto_65311 ) ( SURFACE-AT ?auto_65308 ?auto_65311 ) ( CLEAR ?auto_65308 ) ( LIFTING ?auto_65310 ?auto_65309 ) ( IS-CRATE ?auto_65309 ) ( not ( = ?auto_65308 ?auto_65309 ) ) ( ON ?auto_65306 ?auto_65305 ) ( ON ?auto_65307 ?auto_65306 ) ( ON ?auto_65304 ?auto_65307 ) ( ON ?auto_65308 ?auto_65304 ) ( not ( = ?auto_65305 ?auto_65306 ) ) ( not ( = ?auto_65305 ?auto_65307 ) ) ( not ( = ?auto_65305 ?auto_65304 ) ) ( not ( = ?auto_65305 ?auto_65308 ) ) ( not ( = ?auto_65305 ?auto_65309 ) ) ( not ( = ?auto_65306 ?auto_65307 ) ) ( not ( = ?auto_65306 ?auto_65304 ) ) ( not ( = ?auto_65306 ?auto_65308 ) ) ( not ( = ?auto_65306 ?auto_65309 ) ) ( not ( = ?auto_65307 ?auto_65304 ) ) ( not ( = ?auto_65307 ?auto_65308 ) ) ( not ( = ?auto_65307 ?auto_65309 ) ) ( not ( = ?auto_65304 ?auto_65308 ) ) ( not ( = ?auto_65304 ?auto_65309 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_65308 ?auto_65309 )
      ( MAKE-5CRATE-VERIFY ?auto_65305 ?auto_65306 ?auto_65307 ?auto_65304 ?auto_65308 ?auto_65309 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65339 - SURFACE
      ?auto_65340 - SURFACE
      ?auto_65341 - SURFACE
      ?auto_65338 - SURFACE
      ?auto_65342 - SURFACE
      ?auto_65343 - SURFACE
    )
    :vars
    (
      ?auto_65344 - HOIST
      ?auto_65345 - PLACE
      ?auto_65346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65344 ?auto_65345 ) ( SURFACE-AT ?auto_65342 ?auto_65345 ) ( CLEAR ?auto_65342 ) ( IS-CRATE ?auto_65343 ) ( not ( = ?auto_65342 ?auto_65343 ) ) ( TRUCK-AT ?auto_65346 ?auto_65345 ) ( AVAILABLE ?auto_65344 ) ( IN ?auto_65343 ?auto_65346 ) ( ON ?auto_65342 ?auto_65338 ) ( not ( = ?auto_65338 ?auto_65342 ) ) ( not ( = ?auto_65338 ?auto_65343 ) ) ( ON ?auto_65340 ?auto_65339 ) ( ON ?auto_65341 ?auto_65340 ) ( ON ?auto_65338 ?auto_65341 ) ( not ( = ?auto_65339 ?auto_65340 ) ) ( not ( = ?auto_65339 ?auto_65341 ) ) ( not ( = ?auto_65339 ?auto_65338 ) ) ( not ( = ?auto_65339 ?auto_65342 ) ) ( not ( = ?auto_65339 ?auto_65343 ) ) ( not ( = ?auto_65340 ?auto_65341 ) ) ( not ( = ?auto_65340 ?auto_65338 ) ) ( not ( = ?auto_65340 ?auto_65342 ) ) ( not ( = ?auto_65340 ?auto_65343 ) ) ( not ( = ?auto_65341 ?auto_65338 ) ) ( not ( = ?auto_65341 ?auto_65342 ) ) ( not ( = ?auto_65341 ?auto_65343 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65338 ?auto_65342 ?auto_65343 )
      ( MAKE-5CRATE-VERIFY ?auto_65339 ?auto_65340 ?auto_65341 ?auto_65338 ?auto_65342 ?auto_65343 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65379 - SURFACE
      ?auto_65380 - SURFACE
      ?auto_65381 - SURFACE
      ?auto_65378 - SURFACE
      ?auto_65382 - SURFACE
      ?auto_65383 - SURFACE
    )
    :vars
    (
      ?auto_65386 - HOIST
      ?auto_65385 - PLACE
      ?auto_65384 - TRUCK
      ?auto_65387 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65386 ?auto_65385 ) ( SURFACE-AT ?auto_65382 ?auto_65385 ) ( CLEAR ?auto_65382 ) ( IS-CRATE ?auto_65383 ) ( not ( = ?auto_65382 ?auto_65383 ) ) ( AVAILABLE ?auto_65386 ) ( IN ?auto_65383 ?auto_65384 ) ( ON ?auto_65382 ?auto_65378 ) ( not ( = ?auto_65378 ?auto_65382 ) ) ( not ( = ?auto_65378 ?auto_65383 ) ) ( TRUCK-AT ?auto_65384 ?auto_65387 ) ( not ( = ?auto_65387 ?auto_65385 ) ) ( ON ?auto_65380 ?auto_65379 ) ( ON ?auto_65381 ?auto_65380 ) ( ON ?auto_65378 ?auto_65381 ) ( not ( = ?auto_65379 ?auto_65380 ) ) ( not ( = ?auto_65379 ?auto_65381 ) ) ( not ( = ?auto_65379 ?auto_65378 ) ) ( not ( = ?auto_65379 ?auto_65382 ) ) ( not ( = ?auto_65379 ?auto_65383 ) ) ( not ( = ?auto_65380 ?auto_65381 ) ) ( not ( = ?auto_65380 ?auto_65378 ) ) ( not ( = ?auto_65380 ?auto_65382 ) ) ( not ( = ?auto_65380 ?auto_65383 ) ) ( not ( = ?auto_65381 ?auto_65378 ) ) ( not ( = ?auto_65381 ?auto_65382 ) ) ( not ( = ?auto_65381 ?auto_65383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65378 ?auto_65382 ?auto_65383 )
      ( MAKE-5CRATE-VERIFY ?auto_65379 ?auto_65380 ?auto_65381 ?auto_65378 ?auto_65382 ?auto_65383 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65424 - SURFACE
      ?auto_65425 - SURFACE
      ?auto_65426 - SURFACE
      ?auto_65423 - SURFACE
      ?auto_65427 - SURFACE
      ?auto_65428 - SURFACE
    )
    :vars
    (
      ?auto_65431 - HOIST
      ?auto_65429 - PLACE
      ?auto_65432 - TRUCK
      ?auto_65433 - PLACE
      ?auto_65430 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_65431 ?auto_65429 ) ( SURFACE-AT ?auto_65427 ?auto_65429 ) ( CLEAR ?auto_65427 ) ( IS-CRATE ?auto_65428 ) ( not ( = ?auto_65427 ?auto_65428 ) ) ( AVAILABLE ?auto_65431 ) ( ON ?auto_65427 ?auto_65423 ) ( not ( = ?auto_65423 ?auto_65427 ) ) ( not ( = ?auto_65423 ?auto_65428 ) ) ( TRUCK-AT ?auto_65432 ?auto_65433 ) ( not ( = ?auto_65433 ?auto_65429 ) ) ( HOIST-AT ?auto_65430 ?auto_65433 ) ( LIFTING ?auto_65430 ?auto_65428 ) ( not ( = ?auto_65431 ?auto_65430 ) ) ( ON ?auto_65425 ?auto_65424 ) ( ON ?auto_65426 ?auto_65425 ) ( ON ?auto_65423 ?auto_65426 ) ( not ( = ?auto_65424 ?auto_65425 ) ) ( not ( = ?auto_65424 ?auto_65426 ) ) ( not ( = ?auto_65424 ?auto_65423 ) ) ( not ( = ?auto_65424 ?auto_65427 ) ) ( not ( = ?auto_65424 ?auto_65428 ) ) ( not ( = ?auto_65425 ?auto_65426 ) ) ( not ( = ?auto_65425 ?auto_65423 ) ) ( not ( = ?auto_65425 ?auto_65427 ) ) ( not ( = ?auto_65425 ?auto_65428 ) ) ( not ( = ?auto_65426 ?auto_65423 ) ) ( not ( = ?auto_65426 ?auto_65427 ) ) ( not ( = ?auto_65426 ?auto_65428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65423 ?auto_65427 ?auto_65428 )
      ( MAKE-5CRATE-VERIFY ?auto_65424 ?auto_65425 ?auto_65426 ?auto_65423 ?auto_65427 ?auto_65428 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65474 - SURFACE
      ?auto_65475 - SURFACE
      ?auto_65476 - SURFACE
      ?auto_65473 - SURFACE
      ?auto_65477 - SURFACE
      ?auto_65478 - SURFACE
    )
    :vars
    (
      ?auto_65480 - HOIST
      ?auto_65483 - PLACE
      ?auto_65479 - TRUCK
      ?auto_65481 - PLACE
      ?auto_65482 - HOIST
      ?auto_65484 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65480 ?auto_65483 ) ( SURFACE-AT ?auto_65477 ?auto_65483 ) ( CLEAR ?auto_65477 ) ( IS-CRATE ?auto_65478 ) ( not ( = ?auto_65477 ?auto_65478 ) ) ( AVAILABLE ?auto_65480 ) ( ON ?auto_65477 ?auto_65473 ) ( not ( = ?auto_65473 ?auto_65477 ) ) ( not ( = ?auto_65473 ?auto_65478 ) ) ( TRUCK-AT ?auto_65479 ?auto_65481 ) ( not ( = ?auto_65481 ?auto_65483 ) ) ( HOIST-AT ?auto_65482 ?auto_65481 ) ( not ( = ?auto_65480 ?auto_65482 ) ) ( AVAILABLE ?auto_65482 ) ( SURFACE-AT ?auto_65478 ?auto_65481 ) ( ON ?auto_65478 ?auto_65484 ) ( CLEAR ?auto_65478 ) ( not ( = ?auto_65477 ?auto_65484 ) ) ( not ( = ?auto_65478 ?auto_65484 ) ) ( not ( = ?auto_65473 ?auto_65484 ) ) ( ON ?auto_65475 ?auto_65474 ) ( ON ?auto_65476 ?auto_65475 ) ( ON ?auto_65473 ?auto_65476 ) ( not ( = ?auto_65474 ?auto_65475 ) ) ( not ( = ?auto_65474 ?auto_65476 ) ) ( not ( = ?auto_65474 ?auto_65473 ) ) ( not ( = ?auto_65474 ?auto_65477 ) ) ( not ( = ?auto_65474 ?auto_65478 ) ) ( not ( = ?auto_65474 ?auto_65484 ) ) ( not ( = ?auto_65475 ?auto_65476 ) ) ( not ( = ?auto_65475 ?auto_65473 ) ) ( not ( = ?auto_65475 ?auto_65477 ) ) ( not ( = ?auto_65475 ?auto_65478 ) ) ( not ( = ?auto_65475 ?auto_65484 ) ) ( not ( = ?auto_65476 ?auto_65473 ) ) ( not ( = ?auto_65476 ?auto_65477 ) ) ( not ( = ?auto_65476 ?auto_65478 ) ) ( not ( = ?auto_65476 ?auto_65484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65473 ?auto_65477 ?auto_65478 )
      ( MAKE-5CRATE-VERIFY ?auto_65474 ?auto_65475 ?auto_65476 ?auto_65473 ?auto_65477 ?auto_65478 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65525 - SURFACE
      ?auto_65526 - SURFACE
      ?auto_65527 - SURFACE
      ?auto_65524 - SURFACE
      ?auto_65528 - SURFACE
      ?auto_65529 - SURFACE
    )
    :vars
    (
      ?auto_65534 - HOIST
      ?auto_65532 - PLACE
      ?auto_65531 - PLACE
      ?auto_65533 - HOIST
      ?auto_65530 - SURFACE
      ?auto_65535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65534 ?auto_65532 ) ( SURFACE-AT ?auto_65528 ?auto_65532 ) ( CLEAR ?auto_65528 ) ( IS-CRATE ?auto_65529 ) ( not ( = ?auto_65528 ?auto_65529 ) ) ( AVAILABLE ?auto_65534 ) ( ON ?auto_65528 ?auto_65524 ) ( not ( = ?auto_65524 ?auto_65528 ) ) ( not ( = ?auto_65524 ?auto_65529 ) ) ( not ( = ?auto_65531 ?auto_65532 ) ) ( HOIST-AT ?auto_65533 ?auto_65531 ) ( not ( = ?auto_65534 ?auto_65533 ) ) ( AVAILABLE ?auto_65533 ) ( SURFACE-AT ?auto_65529 ?auto_65531 ) ( ON ?auto_65529 ?auto_65530 ) ( CLEAR ?auto_65529 ) ( not ( = ?auto_65528 ?auto_65530 ) ) ( not ( = ?auto_65529 ?auto_65530 ) ) ( not ( = ?auto_65524 ?auto_65530 ) ) ( TRUCK-AT ?auto_65535 ?auto_65532 ) ( ON ?auto_65526 ?auto_65525 ) ( ON ?auto_65527 ?auto_65526 ) ( ON ?auto_65524 ?auto_65527 ) ( not ( = ?auto_65525 ?auto_65526 ) ) ( not ( = ?auto_65525 ?auto_65527 ) ) ( not ( = ?auto_65525 ?auto_65524 ) ) ( not ( = ?auto_65525 ?auto_65528 ) ) ( not ( = ?auto_65525 ?auto_65529 ) ) ( not ( = ?auto_65525 ?auto_65530 ) ) ( not ( = ?auto_65526 ?auto_65527 ) ) ( not ( = ?auto_65526 ?auto_65524 ) ) ( not ( = ?auto_65526 ?auto_65528 ) ) ( not ( = ?auto_65526 ?auto_65529 ) ) ( not ( = ?auto_65526 ?auto_65530 ) ) ( not ( = ?auto_65527 ?auto_65524 ) ) ( not ( = ?auto_65527 ?auto_65528 ) ) ( not ( = ?auto_65527 ?auto_65529 ) ) ( not ( = ?auto_65527 ?auto_65530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65524 ?auto_65528 ?auto_65529 )
      ( MAKE-5CRATE-VERIFY ?auto_65525 ?auto_65526 ?auto_65527 ?auto_65524 ?auto_65528 ?auto_65529 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65576 - SURFACE
      ?auto_65577 - SURFACE
      ?auto_65578 - SURFACE
      ?auto_65575 - SURFACE
      ?auto_65579 - SURFACE
      ?auto_65580 - SURFACE
    )
    :vars
    (
      ?auto_65584 - HOIST
      ?auto_65585 - PLACE
      ?auto_65582 - PLACE
      ?auto_65583 - HOIST
      ?auto_65586 - SURFACE
      ?auto_65581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65584 ?auto_65585 ) ( IS-CRATE ?auto_65580 ) ( not ( = ?auto_65579 ?auto_65580 ) ) ( not ( = ?auto_65575 ?auto_65579 ) ) ( not ( = ?auto_65575 ?auto_65580 ) ) ( not ( = ?auto_65582 ?auto_65585 ) ) ( HOIST-AT ?auto_65583 ?auto_65582 ) ( not ( = ?auto_65584 ?auto_65583 ) ) ( AVAILABLE ?auto_65583 ) ( SURFACE-AT ?auto_65580 ?auto_65582 ) ( ON ?auto_65580 ?auto_65586 ) ( CLEAR ?auto_65580 ) ( not ( = ?auto_65579 ?auto_65586 ) ) ( not ( = ?auto_65580 ?auto_65586 ) ) ( not ( = ?auto_65575 ?auto_65586 ) ) ( TRUCK-AT ?auto_65581 ?auto_65585 ) ( SURFACE-AT ?auto_65575 ?auto_65585 ) ( CLEAR ?auto_65575 ) ( LIFTING ?auto_65584 ?auto_65579 ) ( IS-CRATE ?auto_65579 ) ( ON ?auto_65577 ?auto_65576 ) ( ON ?auto_65578 ?auto_65577 ) ( ON ?auto_65575 ?auto_65578 ) ( not ( = ?auto_65576 ?auto_65577 ) ) ( not ( = ?auto_65576 ?auto_65578 ) ) ( not ( = ?auto_65576 ?auto_65575 ) ) ( not ( = ?auto_65576 ?auto_65579 ) ) ( not ( = ?auto_65576 ?auto_65580 ) ) ( not ( = ?auto_65576 ?auto_65586 ) ) ( not ( = ?auto_65577 ?auto_65578 ) ) ( not ( = ?auto_65577 ?auto_65575 ) ) ( not ( = ?auto_65577 ?auto_65579 ) ) ( not ( = ?auto_65577 ?auto_65580 ) ) ( not ( = ?auto_65577 ?auto_65586 ) ) ( not ( = ?auto_65578 ?auto_65575 ) ) ( not ( = ?auto_65578 ?auto_65579 ) ) ( not ( = ?auto_65578 ?auto_65580 ) ) ( not ( = ?auto_65578 ?auto_65586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65575 ?auto_65579 ?auto_65580 )
      ( MAKE-5CRATE-VERIFY ?auto_65576 ?auto_65577 ?auto_65578 ?auto_65575 ?auto_65579 ?auto_65580 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65627 - SURFACE
      ?auto_65628 - SURFACE
      ?auto_65629 - SURFACE
      ?auto_65626 - SURFACE
      ?auto_65630 - SURFACE
      ?auto_65631 - SURFACE
    )
    :vars
    (
      ?auto_65636 - HOIST
      ?auto_65633 - PLACE
      ?auto_65635 - PLACE
      ?auto_65632 - HOIST
      ?auto_65637 - SURFACE
      ?auto_65634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65636 ?auto_65633 ) ( IS-CRATE ?auto_65631 ) ( not ( = ?auto_65630 ?auto_65631 ) ) ( not ( = ?auto_65626 ?auto_65630 ) ) ( not ( = ?auto_65626 ?auto_65631 ) ) ( not ( = ?auto_65635 ?auto_65633 ) ) ( HOIST-AT ?auto_65632 ?auto_65635 ) ( not ( = ?auto_65636 ?auto_65632 ) ) ( AVAILABLE ?auto_65632 ) ( SURFACE-AT ?auto_65631 ?auto_65635 ) ( ON ?auto_65631 ?auto_65637 ) ( CLEAR ?auto_65631 ) ( not ( = ?auto_65630 ?auto_65637 ) ) ( not ( = ?auto_65631 ?auto_65637 ) ) ( not ( = ?auto_65626 ?auto_65637 ) ) ( TRUCK-AT ?auto_65634 ?auto_65633 ) ( SURFACE-AT ?auto_65626 ?auto_65633 ) ( CLEAR ?auto_65626 ) ( IS-CRATE ?auto_65630 ) ( AVAILABLE ?auto_65636 ) ( IN ?auto_65630 ?auto_65634 ) ( ON ?auto_65628 ?auto_65627 ) ( ON ?auto_65629 ?auto_65628 ) ( ON ?auto_65626 ?auto_65629 ) ( not ( = ?auto_65627 ?auto_65628 ) ) ( not ( = ?auto_65627 ?auto_65629 ) ) ( not ( = ?auto_65627 ?auto_65626 ) ) ( not ( = ?auto_65627 ?auto_65630 ) ) ( not ( = ?auto_65627 ?auto_65631 ) ) ( not ( = ?auto_65627 ?auto_65637 ) ) ( not ( = ?auto_65628 ?auto_65629 ) ) ( not ( = ?auto_65628 ?auto_65626 ) ) ( not ( = ?auto_65628 ?auto_65630 ) ) ( not ( = ?auto_65628 ?auto_65631 ) ) ( not ( = ?auto_65628 ?auto_65637 ) ) ( not ( = ?auto_65629 ?auto_65626 ) ) ( not ( = ?auto_65629 ?auto_65630 ) ) ( not ( = ?auto_65629 ?auto_65631 ) ) ( not ( = ?auto_65629 ?auto_65637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65626 ?auto_65630 ?auto_65631 )
      ( MAKE-5CRATE-VERIFY ?auto_65627 ?auto_65628 ?auto_65629 ?auto_65626 ?auto_65630 ?auto_65631 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_66836 - SURFACE
      ?auto_66837 - SURFACE
      ?auto_66838 - SURFACE
      ?auto_66835 - SURFACE
      ?auto_66839 - SURFACE
      ?auto_66841 - SURFACE
      ?auto_66840 - SURFACE
    )
    :vars
    (
      ?auto_66843 - HOIST
      ?auto_66842 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66843 ?auto_66842 ) ( SURFACE-AT ?auto_66841 ?auto_66842 ) ( CLEAR ?auto_66841 ) ( LIFTING ?auto_66843 ?auto_66840 ) ( IS-CRATE ?auto_66840 ) ( not ( = ?auto_66841 ?auto_66840 ) ) ( ON ?auto_66837 ?auto_66836 ) ( ON ?auto_66838 ?auto_66837 ) ( ON ?auto_66835 ?auto_66838 ) ( ON ?auto_66839 ?auto_66835 ) ( ON ?auto_66841 ?auto_66839 ) ( not ( = ?auto_66836 ?auto_66837 ) ) ( not ( = ?auto_66836 ?auto_66838 ) ) ( not ( = ?auto_66836 ?auto_66835 ) ) ( not ( = ?auto_66836 ?auto_66839 ) ) ( not ( = ?auto_66836 ?auto_66841 ) ) ( not ( = ?auto_66836 ?auto_66840 ) ) ( not ( = ?auto_66837 ?auto_66838 ) ) ( not ( = ?auto_66837 ?auto_66835 ) ) ( not ( = ?auto_66837 ?auto_66839 ) ) ( not ( = ?auto_66837 ?auto_66841 ) ) ( not ( = ?auto_66837 ?auto_66840 ) ) ( not ( = ?auto_66838 ?auto_66835 ) ) ( not ( = ?auto_66838 ?auto_66839 ) ) ( not ( = ?auto_66838 ?auto_66841 ) ) ( not ( = ?auto_66838 ?auto_66840 ) ) ( not ( = ?auto_66835 ?auto_66839 ) ) ( not ( = ?auto_66835 ?auto_66841 ) ) ( not ( = ?auto_66835 ?auto_66840 ) ) ( not ( = ?auto_66839 ?auto_66841 ) ) ( not ( = ?auto_66839 ?auto_66840 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_66841 ?auto_66840 )
      ( MAKE-6CRATE-VERIFY ?auto_66836 ?auto_66837 ?auto_66838 ?auto_66835 ?auto_66839 ?auto_66841 ?auto_66840 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_66880 - SURFACE
      ?auto_66881 - SURFACE
      ?auto_66882 - SURFACE
      ?auto_66879 - SURFACE
      ?auto_66883 - SURFACE
      ?auto_66885 - SURFACE
      ?auto_66884 - SURFACE
    )
    :vars
    (
      ?auto_66888 - HOIST
      ?auto_66887 - PLACE
      ?auto_66886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66888 ?auto_66887 ) ( SURFACE-AT ?auto_66885 ?auto_66887 ) ( CLEAR ?auto_66885 ) ( IS-CRATE ?auto_66884 ) ( not ( = ?auto_66885 ?auto_66884 ) ) ( TRUCK-AT ?auto_66886 ?auto_66887 ) ( AVAILABLE ?auto_66888 ) ( IN ?auto_66884 ?auto_66886 ) ( ON ?auto_66885 ?auto_66883 ) ( not ( = ?auto_66883 ?auto_66885 ) ) ( not ( = ?auto_66883 ?auto_66884 ) ) ( ON ?auto_66881 ?auto_66880 ) ( ON ?auto_66882 ?auto_66881 ) ( ON ?auto_66879 ?auto_66882 ) ( ON ?auto_66883 ?auto_66879 ) ( not ( = ?auto_66880 ?auto_66881 ) ) ( not ( = ?auto_66880 ?auto_66882 ) ) ( not ( = ?auto_66880 ?auto_66879 ) ) ( not ( = ?auto_66880 ?auto_66883 ) ) ( not ( = ?auto_66880 ?auto_66885 ) ) ( not ( = ?auto_66880 ?auto_66884 ) ) ( not ( = ?auto_66881 ?auto_66882 ) ) ( not ( = ?auto_66881 ?auto_66879 ) ) ( not ( = ?auto_66881 ?auto_66883 ) ) ( not ( = ?auto_66881 ?auto_66885 ) ) ( not ( = ?auto_66881 ?auto_66884 ) ) ( not ( = ?auto_66882 ?auto_66879 ) ) ( not ( = ?auto_66882 ?auto_66883 ) ) ( not ( = ?auto_66882 ?auto_66885 ) ) ( not ( = ?auto_66882 ?auto_66884 ) ) ( not ( = ?auto_66879 ?auto_66883 ) ) ( not ( = ?auto_66879 ?auto_66885 ) ) ( not ( = ?auto_66879 ?auto_66884 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_66883 ?auto_66885 ?auto_66884 )
      ( MAKE-6CRATE-VERIFY ?auto_66880 ?auto_66881 ?auto_66882 ?auto_66879 ?auto_66883 ?auto_66885 ?auto_66884 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_66931 - SURFACE
      ?auto_66932 - SURFACE
      ?auto_66933 - SURFACE
      ?auto_66930 - SURFACE
      ?auto_66934 - SURFACE
      ?auto_66936 - SURFACE
      ?auto_66935 - SURFACE
    )
    :vars
    (
      ?auto_66937 - HOIST
      ?auto_66938 - PLACE
      ?auto_66939 - TRUCK
      ?auto_66940 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66937 ?auto_66938 ) ( SURFACE-AT ?auto_66936 ?auto_66938 ) ( CLEAR ?auto_66936 ) ( IS-CRATE ?auto_66935 ) ( not ( = ?auto_66936 ?auto_66935 ) ) ( AVAILABLE ?auto_66937 ) ( IN ?auto_66935 ?auto_66939 ) ( ON ?auto_66936 ?auto_66934 ) ( not ( = ?auto_66934 ?auto_66936 ) ) ( not ( = ?auto_66934 ?auto_66935 ) ) ( TRUCK-AT ?auto_66939 ?auto_66940 ) ( not ( = ?auto_66940 ?auto_66938 ) ) ( ON ?auto_66932 ?auto_66931 ) ( ON ?auto_66933 ?auto_66932 ) ( ON ?auto_66930 ?auto_66933 ) ( ON ?auto_66934 ?auto_66930 ) ( not ( = ?auto_66931 ?auto_66932 ) ) ( not ( = ?auto_66931 ?auto_66933 ) ) ( not ( = ?auto_66931 ?auto_66930 ) ) ( not ( = ?auto_66931 ?auto_66934 ) ) ( not ( = ?auto_66931 ?auto_66936 ) ) ( not ( = ?auto_66931 ?auto_66935 ) ) ( not ( = ?auto_66932 ?auto_66933 ) ) ( not ( = ?auto_66932 ?auto_66930 ) ) ( not ( = ?auto_66932 ?auto_66934 ) ) ( not ( = ?auto_66932 ?auto_66936 ) ) ( not ( = ?auto_66932 ?auto_66935 ) ) ( not ( = ?auto_66933 ?auto_66930 ) ) ( not ( = ?auto_66933 ?auto_66934 ) ) ( not ( = ?auto_66933 ?auto_66936 ) ) ( not ( = ?auto_66933 ?auto_66935 ) ) ( not ( = ?auto_66930 ?auto_66934 ) ) ( not ( = ?auto_66930 ?auto_66936 ) ) ( not ( = ?auto_66930 ?auto_66935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_66934 ?auto_66936 ?auto_66935 )
      ( MAKE-6CRATE-VERIFY ?auto_66931 ?auto_66932 ?auto_66933 ?auto_66930 ?auto_66934 ?auto_66936 ?auto_66935 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_66988 - SURFACE
      ?auto_66989 - SURFACE
      ?auto_66990 - SURFACE
      ?auto_66987 - SURFACE
      ?auto_66991 - SURFACE
      ?auto_66993 - SURFACE
      ?auto_66992 - SURFACE
    )
    :vars
    (
      ?auto_66994 - HOIST
      ?auto_66997 - PLACE
      ?auto_66995 - TRUCK
      ?auto_66998 - PLACE
      ?auto_66996 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_66994 ?auto_66997 ) ( SURFACE-AT ?auto_66993 ?auto_66997 ) ( CLEAR ?auto_66993 ) ( IS-CRATE ?auto_66992 ) ( not ( = ?auto_66993 ?auto_66992 ) ) ( AVAILABLE ?auto_66994 ) ( ON ?auto_66993 ?auto_66991 ) ( not ( = ?auto_66991 ?auto_66993 ) ) ( not ( = ?auto_66991 ?auto_66992 ) ) ( TRUCK-AT ?auto_66995 ?auto_66998 ) ( not ( = ?auto_66998 ?auto_66997 ) ) ( HOIST-AT ?auto_66996 ?auto_66998 ) ( LIFTING ?auto_66996 ?auto_66992 ) ( not ( = ?auto_66994 ?auto_66996 ) ) ( ON ?auto_66989 ?auto_66988 ) ( ON ?auto_66990 ?auto_66989 ) ( ON ?auto_66987 ?auto_66990 ) ( ON ?auto_66991 ?auto_66987 ) ( not ( = ?auto_66988 ?auto_66989 ) ) ( not ( = ?auto_66988 ?auto_66990 ) ) ( not ( = ?auto_66988 ?auto_66987 ) ) ( not ( = ?auto_66988 ?auto_66991 ) ) ( not ( = ?auto_66988 ?auto_66993 ) ) ( not ( = ?auto_66988 ?auto_66992 ) ) ( not ( = ?auto_66989 ?auto_66990 ) ) ( not ( = ?auto_66989 ?auto_66987 ) ) ( not ( = ?auto_66989 ?auto_66991 ) ) ( not ( = ?auto_66989 ?auto_66993 ) ) ( not ( = ?auto_66989 ?auto_66992 ) ) ( not ( = ?auto_66990 ?auto_66987 ) ) ( not ( = ?auto_66990 ?auto_66991 ) ) ( not ( = ?auto_66990 ?auto_66993 ) ) ( not ( = ?auto_66990 ?auto_66992 ) ) ( not ( = ?auto_66987 ?auto_66991 ) ) ( not ( = ?auto_66987 ?auto_66993 ) ) ( not ( = ?auto_66987 ?auto_66992 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_66991 ?auto_66993 ?auto_66992 )
      ( MAKE-6CRATE-VERIFY ?auto_66988 ?auto_66989 ?auto_66990 ?auto_66987 ?auto_66991 ?auto_66993 ?auto_66992 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67051 - SURFACE
      ?auto_67052 - SURFACE
      ?auto_67053 - SURFACE
      ?auto_67050 - SURFACE
      ?auto_67054 - SURFACE
      ?auto_67056 - SURFACE
      ?auto_67055 - SURFACE
    )
    :vars
    (
      ?auto_67058 - HOIST
      ?auto_67057 - PLACE
      ?auto_67060 - TRUCK
      ?auto_67061 - PLACE
      ?auto_67059 - HOIST
      ?auto_67062 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67058 ?auto_67057 ) ( SURFACE-AT ?auto_67056 ?auto_67057 ) ( CLEAR ?auto_67056 ) ( IS-CRATE ?auto_67055 ) ( not ( = ?auto_67056 ?auto_67055 ) ) ( AVAILABLE ?auto_67058 ) ( ON ?auto_67056 ?auto_67054 ) ( not ( = ?auto_67054 ?auto_67056 ) ) ( not ( = ?auto_67054 ?auto_67055 ) ) ( TRUCK-AT ?auto_67060 ?auto_67061 ) ( not ( = ?auto_67061 ?auto_67057 ) ) ( HOIST-AT ?auto_67059 ?auto_67061 ) ( not ( = ?auto_67058 ?auto_67059 ) ) ( AVAILABLE ?auto_67059 ) ( SURFACE-AT ?auto_67055 ?auto_67061 ) ( ON ?auto_67055 ?auto_67062 ) ( CLEAR ?auto_67055 ) ( not ( = ?auto_67056 ?auto_67062 ) ) ( not ( = ?auto_67055 ?auto_67062 ) ) ( not ( = ?auto_67054 ?auto_67062 ) ) ( ON ?auto_67052 ?auto_67051 ) ( ON ?auto_67053 ?auto_67052 ) ( ON ?auto_67050 ?auto_67053 ) ( ON ?auto_67054 ?auto_67050 ) ( not ( = ?auto_67051 ?auto_67052 ) ) ( not ( = ?auto_67051 ?auto_67053 ) ) ( not ( = ?auto_67051 ?auto_67050 ) ) ( not ( = ?auto_67051 ?auto_67054 ) ) ( not ( = ?auto_67051 ?auto_67056 ) ) ( not ( = ?auto_67051 ?auto_67055 ) ) ( not ( = ?auto_67051 ?auto_67062 ) ) ( not ( = ?auto_67052 ?auto_67053 ) ) ( not ( = ?auto_67052 ?auto_67050 ) ) ( not ( = ?auto_67052 ?auto_67054 ) ) ( not ( = ?auto_67052 ?auto_67056 ) ) ( not ( = ?auto_67052 ?auto_67055 ) ) ( not ( = ?auto_67052 ?auto_67062 ) ) ( not ( = ?auto_67053 ?auto_67050 ) ) ( not ( = ?auto_67053 ?auto_67054 ) ) ( not ( = ?auto_67053 ?auto_67056 ) ) ( not ( = ?auto_67053 ?auto_67055 ) ) ( not ( = ?auto_67053 ?auto_67062 ) ) ( not ( = ?auto_67050 ?auto_67054 ) ) ( not ( = ?auto_67050 ?auto_67056 ) ) ( not ( = ?auto_67050 ?auto_67055 ) ) ( not ( = ?auto_67050 ?auto_67062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67054 ?auto_67056 ?auto_67055 )
      ( MAKE-6CRATE-VERIFY ?auto_67051 ?auto_67052 ?auto_67053 ?auto_67050 ?auto_67054 ?auto_67056 ?auto_67055 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67115 - SURFACE
      ?auto_67116 - SURFACE
      ?auto_67117 - SURFACE
      ?auto_67114 - SURFACE
      ?auto_67118 - SURFACE
      ?auto_67120 - SURFACE
      ?auto_67119 - SURFACE
    )
    :vars
    (
      ?auto_67126 - HOIST
      ?auto_67121 - PLACE
      ?auto_67122 - PLACE
      ?auto_67124 - HOIST
      ?auto_67123 - SURFACE
      ?auto_67125 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67126 ?auto_67121 ) ( SURFACE-AT ?auto_67120 ?auto_67121 ) ( CLEAR ?auto_67120 ) ( IS-CRATE ?auto_67119 ) ( not ( = ?auto_67120 ?auto_67119 ) ) ( AVAILABLE ?auto_67126 ) ( ON ?auto_67120 ?auto_67118 ) ( not ( = ?auto_67118 ?auto_67120 ) ) ( not ( = ?auto_67118 ?auto_67119 ) ) ( not ( = ?auto_67122 ?auto_67121 ) ) ( HOIST-AT ?auto_67124 ?auto_67122 ) ( not ( = ?auto_67126 ?auto_67124 ) ) ( AVAILABLE ?auto_67124 ) ( SURFACE-AT ?auto_67119 ?auto_67122 ) ( ON ?auto_67119 ?auto_67123 ) ( CLEAR ?auto_67119 ) ( not ( = ?auto_67120 ?auto_67123 ) ) ( not ( = ?auto_67119 ?auto_67123 ) ) ( not ( = ?auto_67118 ?auto_67123 ) ) ( TRUCK-AT ?auto_67125 ?auto_67121 ) ( ON ?auto_67116 ?auto_67115 ) ( ON ?auto_67117 ?auto_67116 ) ( ON ?auto_67114 ?auto_67117 ) ( ON ?auto_67118 ?auto_67114 ) ( not ( = ?auto_67115 ?auto_67116 ) ) ( not ( = ?auto_67115 ?auto_67117 ) ) ( not ( = ?auto_67115 ?auto_67114 ) ) ( not ( = ?auto_67115 ?auto_67118 ) ) ( not ( = ?auto_67115 ?auto_67120 ) ) ( not ( = ?auto_67115 ?auto_67119 ) ) ( not ( = ?auto_67115 ?auto_67123 ) ) ( not ( = ?auto_67116 ?auto_67117 ) ) ( not ( = ?auto_67116 ?auto_67114 ) ) ( not ( = ?auto_67116 ?auto_67118 ) ) ( not ( = ?auto_67116 ?auto_67120 ) ) ( not ( = ?auto_67116 ?auto_67119 ) ) ( not ( = ?auto_67116 ?auto_67123 ) ) ( not ( = ?auto_67117 ?auto_67114 ) ) ( not ( = ?auto_67117 ?auto_67118 ) ) ( not ( = ?auto_67117 ?auto_67120 ) ) ( not ( = ?auto_67117 ?auto_67119 ) ) ( not ( = ?auto_67117 ?auto_67123 ) ) ( not ( = ?auto_67114 ?auto_67118 ) ) ( not ( = ?auto_67114 ?auto_67120 ) ) ( not ( = ?auto_67114 ?auto_67119 ) ) ( not ( = ?auto_67114 ?auto_67123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67118 ?auto_67120 ?auto_67119 )
      ( MAKE-6CRATE-VERIFY ?auto_67115 ?auto_67116 ?auto_67117 ?auto_67114 ?auto_67118 ?auto_67120 ?auto_67119 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67179 - SURFACE
      ?auto_67180 - SURFACE
      ?auto_67181 - SURFACE
      ?auto_67178 - SURFACE
      ?auto_67182 - SURFACE
      ?auto_67184 - SURFACE
      ?auto_67183 - SURFACE
    )
    :vars
    (
      ?auto_67185 - HOIST
      ?auto_67188 - PLACE
      ?auto_67186 - PLACE
      ?auto_67189 - HOIST
      ?auto_67187 - SURFACE
      ?auto_67190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67185 ?auto_67188 ) ( IS-CRATE ?auto_67183 ) ( not ( = ?auto_67184 ?auto_67183 ) ) ( not ( = ?auto_67182 ?auto_67184 ) ) ( not ( = ?auto_67182 ?auto_67183 ) ) ( not ( = ?auto_67186 ?auto_67188 ) ) ( HOIST-AT ?auto_67189 ?auto_67186 ) ( not ( = ?auto_67185 ?auto_67189 ) ) ( AVAILABLE ?auto_67189 ) ( SURFACE-AT ?auto_67183 ?auto_67186 ) ( ON ?auto_67183 ?auto_67187 ) ( CLEAR ?auto_67183 ) ( not ( = ?auto_67184 ?auto_67187 ) ) ( not ( = ?auto_67183 ?auto_67187 ) ) ( not ( = ?auto_67182 ?auto_67187 ) ) ( TRUCK-AT ?auto_67190 ?auto_67188 ) ( SURFACE-AT ?auto_67182 ?auto_67188 ) ( CLEAR ?auto_67182 ) ( LIFTING ?auto_67185 ?auto_67184 ) ( IS-CRATE ?auto_67184 ) ( ON ?auto_67180 ?auto_67179 ) ( ON ?auto_67181 ?auto_67180 ) ( ON ?auto_67178 ?auto_67181 ) ( ON ?auto_67182 ?auto_67178 ) ( not ( = ?auto_67179 ?auto_67180 ) ) ( not ( = ?auto_67179 ?auto_67181 ) ) ( not ( = ?auto_67179 ?auto_67178 ) ) ( not ( = ?auto_67179 ?auto_67182 ) ) ( not ( = ?auto_67179 ?auto_67184 ) ) ( not ( = ?auto_67179 ?auto_67183 ) ) ( not ( = ?auto_67179 ?auto_67187 ) ) ( not ( = ?auto_67180 ?auto_67181 ) ) ( not ( = ?auto_67180 ?auto_67178 ) ) ( not ( = ?auto_67180 ?auto_67182 ) ) ( not ( = ?auto_67180 ?auto_67184 ) ) ( not ( = ?auto_67180 ?auto_67183 ) ) ( not ( = ?auto_67180 ?auto_67187 ) ) ( not ( = ?auto_67181 ?auto_67178 ) ) ( not ( = ?auto_67181 ?auto_67182 ) ) ( not ( = ?auto_67181 ?auto_67184 ) ) ( not ( = ?auto_67181 ?auto_67183 ) ) ( not ( = ?auto_67181 ?auto_67187 ) ) ( not ( = ?auto_67178 ?auto_67182 ) ) ( not ( = ?auto_67178 ?auto_67184 ) ) ( not ( = ?auto_67178 ?auto_67183 ) ) ( not ( = ?auto_67178 ?auto_67187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67182 ?auto_67184 ?auto_67183 )
      ( MAKE-6CRATE-VERIFY ?auto_67179 ?auto_67180 ?auto_67181 ?auto_67178 ?auto_67182 ?auto_67184 ?auto_67183 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67243 - SURFACE
      ?auto_67244 - SURFACE
      ?auto_67245 - SURFACE
      ?auto_67242 - SURFACE
      ?auto_67246 - SURFACE
      ?auto_67248 - SURFACE
      ?auto_67247 - SURFACE
    )
    :vars
    (
      ?auto_67253 - HOIST
      ?auto_67254 - PLACE
      ?auto_67250 - PLACE
      ?auto_67252 - HOIST
      ?auto_67251 - SURFACE
      ?auto_67249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67253 ?auto_67254 ) ( IS-CRATE ?auto_67247 ) ( not ( = ?auto_67248 ?auto_67247 ) ) ( not ( = ?auto_67246 ?auto_67248 ) ) ( not ( = ?auto_67246 ?auto_67247 ) ) ( not ( = ?auto_67250 ?auto_67254 ) ) ( HOIST-AT ?auto_67252 ?auto_67250 ) ( not ( = ?auto_67253 ?auto_67252 ) ) ( AVAILABLE ?auto_67252 ) ( SURFACE-AT ?auto_67247 ?auto_67250 ) ( ON ?auto_67247 ?auto_67251 ) ( CLEAR ?auto_67247 ) ( not ( = ?auto_67248 ?auto_67251 ) ) ( not ( = ?auto_67247 ?auto_67251 ) ) ( not ( = ?auto_67246 ?auto_67251 ) ) ( TRUCK-AT ?auto_67249 ?auto_67254 ) ( SURFACE-AT ?auto_67246 ?auto_67254 ) ( CLEAR ?auto_67246 ) ( IS-CRATE ?auto_67248 ) ( AVAILABLE ?auto_67253 ) ( IN ?auto_67248 ?auto_67249 ) ( ON ?auto_67244 ?auto_67243 ) ( ON ?auto_67245 ?auto_67244 ) ( ON ?auto_67242 ?auto_67245 ) ( ON ?auto_67246 ?auto_67242 ) ( not ( = ?auto_67243 ?auto_67244 ) ) ( not ( = ?auto_67243 ?auto_67245 ) ) ( not ( = ?auto_67243 ?auto_67242 ) ) ( not ( = ?auto_67243 ?auto_67246 ) ) ( not ( = ?auto_67243 ?auto_67248 ) ) ( not ( = ?auto_67243 ?auto_67247 ) ) ( not ( = ?auto_67243 ?auto_67251 ) ) ( not ( = ?auto_67244 ?auto_67245 ) ) ( not ( = ?auto_67244 ?auto_67242 ) ) ( not ( = ?auto_67244 ?auto_67246 ) ) ( not ( = ?auto_67244 ?auto_67248 ) ) ( not ( = ?auto_67244 ?auto_67247 ) ) ( not ( = ?auto_67244 ?auto_67251 ) ) ( not ( = ?auto_67245 ?auto_67242 ) ) ( not ( = ?auto_67245 ?auto_67246 ) ) ( not ( = ?auto_67245 ?auto_67248 ) ) ( not ( = ?auto_67245 ?auto_67247 ) ) ( not ( = ?auto_67245 ?auto_67251 ) ) ( not ( = ?auto_67242 ?auto_67246 ) ) ( not ( = ?auto_67242 ?auto_67248 ) ) ( not ( = ?auto_67242 ?auto_67247 ) ) ( not ( = ?auto_67242 ?auto_67251 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67246 ?auto_67248 ?auto_67247 )
      ( MAKE-6CRATE-VERIFY ?auto_67243 ?auto_67244 ?auto_67245 ?auto_67242 ?auto_67246 ?auto_67248 ?auto_67247 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69199 - SURFACE
      ?auto_69200 - SURFACE
      ?auto_69201 - SURFACE
      ?auto_69198 - SURFACE
      ?auto_69202 - SURFACE
      ?auto_69204 - SURFACE
      ?auto_69203 - SURFACE
      ?auto_69205 - SURFACE
    )
    :vars
    (
      ?auto_69207 - HOIST
      ?auto_69206 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69207 ?auto_69206 ) ( SURFACE-AT ?auto_69203 ?auto_69206 ) ( CLEAR ?auto_69203 ) ( LIFTING ?auto_69207 ?auto_69205 ) ( IS-CRATE ?auto_69205 ) ( not ( = ?auto_69203 ?auto_69205 ) ) ( ON ?auto_69200 ?auto_69199 ) ( ON ?auto_69201 ?auto_69200 ) ( ON ?auto_69198 ?auto_69201 ) ( ON ?auto_69202 ?auto_69198 ) ( ON ?auto_69204 ?auto_69202 ) ( ON ?auto_69203 ?auto_69204 ) ( not ( = ?auto_69199 ?auto_69200 ) ) ( not ( = ?auto_69199 ?auto_69201 ) ) ( not ( = ?auto_69199 ?auto_69198 ) ) ( not ( = ?auto_69199 ?auto_69202 ) ) ( not ( = ?auto_69199 ?auto_69204 ) ) ( not ( = ?auto_69199 ?auto_69203 ) ) ( not ( = ?auto_69199 ?auto_69205 ) ) ( not ( = ?auto_69200 ?auto_69201 ) ) ( not ( = ?auto_69200 ?auto_69198 ) ) ( not ( = ?auto_69200 ?auto_69202 ) ) ( not ( = ?auto_69200 ?auto_69204 ) ) ( not ( = ?auto_69200 ?auto_69203 ) ) ( not ( = ?auto_69200 ?auto_69205 ) ) ( not ( = ?auto_69201 ?auto_69198 ) ) ( not ( = ?auto_69201 ?auto_69202 ) ) ( not ( = ?auto_69201 ?auto_69204 ) ) ( not ( = ?auto_69201 ?auto_69203 ) ) ( not ( = ?auto_69201 ?auto_69205 ) ) ( not ( = ?auto_69198 ?auto_69202 ) ) ( not ( = ?auto_69198 ?auto_69204 ) ) ( not ( = ?auto_69198 ?auto_69203 ) ) ( not ( = ?auto_69198 ?auto_69205 ) ) ( not ( = ?auto_69202 ?auto_69204 ) ) ( not ( = ?auto_69202 ?auto_69203 ) ) ( not ( = ?auto_69202 ?auto_69205 ) ) ( not ( = ?auto_69204 ?auto_69203 ) ) ( not ( = ?auto_69204 ?auto_69205 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_69203 ?auto_69205 )
      ( MAKE-7CRATE-VERIFY ?auto_69199 ?auto_69200 ?auto_69201 ?auto_69198 ?auto_69202 ?auto_69204 ?auto_69203 ?auto_69205 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69254 - SURFACE
      ?auto_69255 - SURFACE
      ?auto_69256 - SURFACE
      ?auto_69253 - SURFACE
      ?auto_69257 - SURFACE
      ?auto_69259 - SURFACE
      ?auto_69258 - SURFACE
      ?auto_69260 - SURFACE
    )
    :vars
    (
      ?auto_69263 - HOIST
      ?auto_69262 - PLACE
      ?auto_69261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_69263 ?auto_69262 ) ( SURFACE-AT ?auto_69258 ?auto_69262 ) ( CLEAR ?auto_69258 ) ( IS-CRATE ?auto_69260 ) ( not ( = ?auto_69258 ?auto_69260 ) ) ( TRUCK-AT ?auto_69261 ?auto_69262 ) ( AVAILABLE ?auto_69263 ) ( IN ?auto_69260 ?auto_69261 ) ( ON ?auto_69258 ?auto_69259 ) ( not ( = ?auto_69259 ?auto_69258 ) ) ( not ( = ?auto_69259 ?auto_69260 ) ) ( ON ?auto_69255 ?auto_69254 ) ( ON ?auto_69256 ?auto_69255 ) ( ON ?auto_69253 ?auto_69256 ) ( ON ?auto_69257 ?auto_69253 ) ( ON ?auto_69259 ?auto_69257 ) ( not ( = ?auto_69254 ?auto_69255 ) ) ( not ( = ?auto_69254 ?auto_69256 ) ) ( not ( = ?auto_69254 ?auto_69253 ) ) ( not ( = ?auto_69254 ?auto_69257 ) ) ( not ( = ?auto_69254 ?auto_69259 ) ) ( not ( = ?auto_69254 ?auto_69258 ) ) ( not ( = ?auto_69254 ?auto_69260 ) ) ( not ( = ?auto_69255 ?auto_69256 ) ) ( not ( = ?auto_69255 ?auto_69253 ) ) ( not ( = ?auto_69255 ?auto_69257 ) ) ( not ( = ?auto_69255 ?auto_69259 ) ) ( not ( = ?auto_69255 ?auto_69258 ) ) ( not ( = ?auto_69255 ?auto_69260 ) ) ( not ( = ?auto_69256 ?auto_69253 ) ) ( not ( = ?auto_69256 ?auto_69257 ) ) ( not ( = ?auto_69256 ?auto_69259 ) ) ( not ( = ?auto_69256 ?auto_69258 ) ) ( not ( = ?auto_69256 ?auto_69260 ) ) ( not ( = ?auto_69253 ?auto_69257 ) ) ( not ( = ?auto_69253 ?auto_69259 ) ) ( not ( = ?auto_69253 ?auto_69258 ) ) ( not ( = ?auto_69253 ?auto_69260 ) ) ( not ( = ?auto_69257 ?auto_69259 ) ) ( not ( = ?auto_69257 ?auto_69258 ) ) ( not ( = ?auto_69257 ?auto_69260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69259 ?auto_69258 ?auto_69260 )
      ( MAKE-7CRATE-VERIFY ?auto_69254 ?auto_69255 ?auto_69256 ?auto_69253 ?auto_69257 ?auto_69259 ?auto_69258 ?auto_69260 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69317 - SURFACE
      ?auto_69318 - SURFACE
      ?auto_69319 - SURFACE
      ?auto_69316 - SURFACE
      ?auto_69320 - SURFACE
      ?auto_69322 - SURFACE
      ?auto_69321 - SURFACE
      ?auto_69323 - SURFACE
    )
    :vars
    (
      ?auto_69324 - HOIST
      ?auto_69326 - PLACE
      ?auto_69325 - TRUCK
      ?auto_69327 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69324 ?auto_69326 ) ( SURFACE-AT ?auto_69321 ?auto_69326 ) ( CLEAR ?auto_69321 ) ( IS-CRATE ?auto_69323 ) ( not ( = ?auto_69321 ?auto_69323 ) ) ( AVAILABLE ?auto_69324 ) ( IN ?auto_69323 ?auto_69325 ) ( ON ?auto_69321 ?auto_69322 ) ( not ( = ?auto_69322 ?auto_69321 ) ) ( not ( = ?auto_69322 ?auto_69323 ) ) ( TRUCK-AT ?auto_69325 ?auto_69327 ) ( not ( = ?auto_69327 ?auto_69326 ) ) ( ON ?auto_69318 ?auto_69317 ) ( ON ?auto_69319 ?auto_69318 ) ( ON ?auto_69316 ?auto_69319 ) ( ON ?auto_69320 ?auto_69316 ) ( ON ?auto_69322 ?auto_69320 ) ( not ( = ?auto_69317 ?auto_69318 ) ) ( not ( = ?auto_69317 ?auto_69319 ) ) ( not ( = ?auto_69317 ?auto_69316 ) ) ( not ( = ?auto_69317 ?auto_69320 ) ) ( not ( = ?auto_69317 ?auto_69322 ) ) ( not ( = ?auto_69317 ?auto_69321 ) ) ( not ( = ?auto_69317 ?auto_69323 ) ) ( not ( = ?auto_69318 ?auto_69319 ) ) ( not ( = ?auto_69318 ?auto_69316 ) ) ( not ( = ?auto_69318 ?auto_69320 ) ) ( not ( = ?auto_69318 ?auto_69322 ) ) ( not ( = ?auto_69318 ?auto_69321 ) ) ( not ( = ?auto_69318 ?auto_69323 ) ) ( not ( = ?auto_69319 ?auto_69316 ) ) ( not ( = ?auto_69319 ?auto_69320 ) ) ( not ( = ?auto_69319 ?auto_69322 ) ) ( not ( = ?auto_69319 ?auto_69321 ) ) ( not ( = ?auto_69319 ?auto_69323 ) ) ( not ( = ?auto_69316 ?auto_69320 ) ) ( not ( = ?auto_69316 ?auto_69322 ) ) ( not ( = ?auto_69316 ?auto_69321 ) ) ( not ( = ?auto_69316 ?auto_69323 ) ) ( not ( = ?auto_69320 ?auto_69322 ) ) ( not ( = ?auto_69320 ?auto_69321 ) ) ( not ( = ?auto_69320 ?auto_69323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69322 ?auto_69321 ?auto_69323 )
      ( MAKE-7CRATE-VERIFY ?auto_69317 ?auto_69318 ?auto_69319 ?auto_69316 ?auto_69320 ?auto_69322 ?auto_69321 ?auto_69323 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69387 - SURFACE
      ?auto_69388 - SURFACE
      ?auto_69389 - SURFACE
      ?auto_69386 - SURFACE
      ?auto_69390 - SURFACE
      ?auto_69392 - SURFACE
      ?auto_69391 - SURFACE
      ?auto_69393 - SURFACE
    )
    :vars
    (
      ?auto_69397 - HOIST
      ?auto_69394 - PLACE
      ?auto_69398 - TRUCK
      ?auto_69395 - PLACE
      ?auto_69396 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_69397 ?auto_69394 ) ( SURFACE-AT ?auto_69391 ?auto_69394 ) ( CLEAR ?auto_69391 ) ( IS-CRATE ?auto_69393 ) ( not ( = ?auto_69391 ?auto_69393 ) ) ( AVAILABLE ?auto_69397 ) ( ON ?auto_69391 ?auto_69392 ) ( not ( = ?auto_69392 ?auto_69391 ) ) ( not ( = ?auto_69392 ?auto_69393 ) ) ( TRUCK-AT ?auto_69398 ?auto_69395 ) ( not ( = ?auto_69395 ?auto_69394 ) ) ( HOIST-AT ?auto_69396 ?auto_69395 ) ( LIFTING ?auto_69396 ?auto_69393 ) ( not ( = ?auto_69397 ?auto_69396 ) ) ( ON ?auto_69388 ?auto_69387 ) ( ON ?auto_69389 ?auto_69388 ) ( ON ?auto_69386 ?auto_69389 ) ( ON ?auto_69390 ?auto_69386 ) ( ON ?auto_69392 ?auto_69390 ) ( not ( = ?auto_69387 ?auto_69388 ) ) ( not ( = ?auto_69387 ?auto_69389 ) ) ( not ( = ?auto_69387 ?auto_69386 ) ) ( not ( = ?auto_69387 ?auto_69390 ) ) ( not ( = ?auto_69387 ?auto_69392 ) ) ( not ( = ?auto_69387 ?auto_69391 ) ) ( not ( = ?auto_69387 ?auto_69393 ) ) ( not ( = ?auto_69388 ?auto_69389 ) ) ( not ( = ?auto_69388 ?auto_69386 ) ) ( not ( = ?auto_69388 ?auto_69390 ) ) ( not ( = ?auto_69388 ?auto_69392 ) ) ( not ( = ?auto_69388 ?auto_69391 ) ) ( not ( = ?auto_69388 ?auto_69393 ) ) ( not ( = ?auto_69389 ?auto_69386 ) ) ( not ( = ?auto_69389 ?auto_69390 ) ) ( not ( = ?auto_69389 ?auto_69392 ) ) ( not ( = ?auto_69389 ?auto_69391 ) ) ( not ( = ?auto_69389 ?auto_69393 ) ) ( not ( = ?auto_69386 ?auto_69390 ) ) ( not ( = ?auto_69386 ?auto_69392 ) ) ( not ( = ?auto_69386 ?auto_69391 ) ) ( not ( = ?auto_69386 ?auto_69393 ) ) ( not ( = ?auto_69390 ?auto_69392 ) ) ( not ( = ?auto_69390 ?auto_69391 ) ) ( not ( = ?auto_69390 ?auto_69393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69392 ?auto_69391 ?auto_69393 )
      ( MAKE-7CRATE-VERIFY ?auto_69387 ?auto_69388 ?auto_69389 ?auto_69386 ?auto_69390 ?auto_69392 ?auto_69391 ?auto_69393 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69464 - SURFACE
      ?auto_69465 - SURFACE
      ?auto_69466 - SURFACE
      ?auto_69463 - SURFACE
      ?auto_69467 - SURFACE
      ?auto_69469 - SURFACE
      ?auto_69468 - SURFACE
      ?auto_69470 - SURFACE
    )
    :vars
    (
      ?auto_69471 - HOIST
      ?auto_69476 - PLACE
      ?auto_69472 - TRUCK
      ?auto_69475 - PLACE
      ?auto_69473 - HOIST
      ?auto_69474 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69471 ?auto_69476 ) ( SURFACE-AT ?auto_69468 ?auto_69476 ) ( CLEAR ?auto_69468 ) ( IS-CRATE ?auto_69470 ) ( not ( = ?auto_69468 ?auto_69470 ) ) ( AVAILABLE ?auto_69471 ) ( ON ?auto_69468 ?auto_69469 ) ( not ( = ?auto_69469 ?auto_69468 ) ) ( not ( = ?auto_69469 ?auto_69470 ) ) ( TRUCK-AT ?auto_69472 ?auto_69475 ) ( not ( = ?auto_69475 ?auto_69476 ) ) ( HOIST-AT ?auto_69473 ?auto_69475 ) ( not ( = ?auto_69471 ?auto_69473 ) ) ( AVAILABLE ?auto_69473 ) ( SURFACE-AT ?auto_69470 ?auto_69475 ) ( ON ?auto_69470 ?auto_69474 ) ( CLEAR ?auto_69470 ) ( not ( = ?auto_69468 ?auto_69474 ) ) ( not ( = ?auto_69470 ?auto_69474 ) ) ( not ( = ?auto_69469 ?auto_69474 ) ) ( ON ?auto_69465 ?auto_69464 ) ( ON ?auto_69466 ?auto_69465 ) ( ON ?auto_69463 ?auto_69466 ) ( ON ?auto_69467 ?auto_69463 ) ( ON ?auto_69469 ?auto_69467 ) ( not ( = ?auto_69464 ?auto_69465 ) ) ( not ( = ?auto_69464 ?auto_69466 ) ) ( not ( = ?auto_69464 ?auto_69463 ) ) ( not ( = ?auto_69464 ?auto_69467 ) ) ( not ( = ?auto_69464 ?auto_69469 ) ) ( not ( = ?auto_69464 ?auto_69468 ) ) ( not ( = ?auto_69464 ?auto_69470 ) ) ( not ( = ?auto_69464 ?auto_69474 ) ) ( not ( = ?auto_69465 ?auto_69466 ) ) ( not ( = ?auto_69465 ?auto_69463 ) ) ( not ( = ?auto_69465 ?auto_69467 ) ) ( not ( = ?auto_69465 ?auto_69469 ) ) ( not ( = ?auto_69465 ?auto_69468 ) ) ( not ( = ?auto_69465 ?auto_69470 ) ) ( not ( = ?auto_69465 ?auto_69474 ) ) ( not ( = ?auto_69466 ?auto_69463 ) ) ( not ( = ?auto_69466 ?auto_69467 ) ) ( not ( = ?auto_69466 ?auto_69469 ) ) ( not ( = ?auto_69466 ?auto_69468 ) ) ( not ( = ?auto_69466 ?auto_69470 ) ) ( not ( = ?auto_69466 ?auto_69474 ) ) ( not ( = ?auto_69463 ?auto_69467 ) ) ( not ( = ?auto_69463 ?auto_69469 ) ) ( not ( = ?auto_69463 ?auto_69468 ) ) ( not ( = ?auto_69463 ?auto_69470 ) ) ( not ( = ?auto_69463 ?auto_69474 ) ) ( not ( = ?auto_69467 ?auto_69469 ) ) ( not ( = ?auto_69467 ?auto_69468 ) ) ( not ( = ?auto_69467 ?auto_69470 ) ) ( not ( = ?auto_69467 ?auto_69474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69469 ?auto_69468 ?auto_69470 )
      ( MAKE-7CRATE-VERIFY ?auto_69464 ?auto_69465 ?auto_69466 ?auto_69463 ?auto_69467 ?auto_69469 ?auto_69468 ?auto_69470 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69542 - SURFACE
      ?auto_69543 - SURFACE
      ?auto_69544 - SURFACE
      ?auto_69541 - SURFACE
      ?auto_69545 - SURFACE
      ?auto_69547 - SURFACE
      ?auto_69546 - SURFACE
      ?auto_69548 - SURFACE
    )
    :vars
    (
      ?auto_69551 - HOIST
      ?auto_69554 - PLACE
      ?auto_69549 - PLACE
      ?auto_69552 - HOIST
      ?auto_69553 - SURFACE
      ?auto_69550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_69551 ?auto_69554 ) ( SURFACE-AT ?auto_69546 ?auto_69554 ) ( CLEAR ?auto_69546 ) ( IS-CRATE ?auto_69548 ) ( not ( = ?auto_69546 ?auto_69548 ) ) ( AVAILABLE ?auto_69551 ) ( ON ?auto_69546 ?auto_69547 ) ( not ( = ?auto_69547 ?auto_69546 ) ) ( not ( = ?auto_69547 ?auto_69548 ) ) ( not ( = ?auto_69549 ?auto_69554 ) ) ( HOIST-AT ?auto_69552 ?auto_69549 ) ( not ( = ?auto_69551 ?auto_69552 ) ) ( AVAILABLE ?auto_69552 ) ( SURFACE-AT ?auto_69548 ?auto_69549 ) ( ON ?auto_69548 ?auto_69553 ) ( CLEAR ?auto_69548 ) ( not ( = ?auto_69546 ?auto_69553 ) ) ( not ( = ?auto_69548 ?auto_69553 ) ) ( not ( = ?auto_69547 ?auto_69553 ) ) ( TRUCK-AT ?auto_69550 ?auto_69554 ) ( ON ?auto_69543 ?auto_69542 ) ( ON ?auto_69544 ?auto_69543 ) ( ON ?auto_69541 ?auto_69544 ) ( ON ?auto_69545 ?auto_69541 ) ( ON ?auto_69547 ?auto_69545 ) ( not ( = ?auto_69542 ?auto_69543 ) ) ( not ( = ?auto_69542 ?auto_69544 ) ) ( not ( = ?auto_69542 ?auto_69541 ) ) ( not ( = ?auto_69542 ?auto_69545 ) ) ( not ( = ?auto_69542 ?auto_69547 ) ) ( not ( = ?auto_69542 ?auto_69546 ) ) ( not ( = ?auto_69542 ?auto_69548 ) ) ( not ( = ?auto_69542 ?auto_69553 ) ) ( not ( = ?auto_69543 ?auto_69544 ) ) ( not ( = ?auto_69543 ?auto_69541 ) ) ( not ( = ?auto_69543 ?auto_69545 ) ) ( not ( = ?auto_69543 ?auto_69547 ) ) ( not ( = ?auto_69543 ?auto_69546 ) ) ( not ( = ?auto_69543 ?auto_69548 ) ) ( not ( = ?auto_69543 ?auto_69553 ) ) ( not ( = ?auto_69544 ?auto_69541 ) ) ( not ( = ?auto_69544 ?auto_69545 ) ) ( not ( = ?auto_69544 ?auto_69547 ) ) ( not ( = ?auto_69544 ?auto_69546 ) ) ( not ( = ?auto_69544 ?auto_69548 ) ) ( not ( = ?auto_69544 ?auto_69553 ) ) ( not ( = ?auto_69541 ?auto_69545 ) ) ( not ( = ?auto_69541 ?auto_69547 ) ) ( not ( = ?auto_69541 ?auto_69546 ) ) ( not ( = ?auto_69541 ?auto_69548 ) ) ( not ( = ?auto_69541 ?auto_69553 ) ) ( not ( = ?auto_69545 ?auto_69547 ) ) ( not ( = ?auto_69545 ?auto_69546 ) ) ( not ( = ?auto_69545 ?auto_69548 ) ) ( not ( = ?auto_69545 ?auto_69553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69547 ?auto_69546 ?auto_69548 )
      ( MAKE-7CRATE-VERIFY ?auto_69542 ?auto_69543 ?auto_69544 ?auto_69541 ?auto_69545 ?auto_69547 ?auto_69546 ?auto_69548 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69620 - SURFACE
      ?auto_69621 - SURFACE
      ?auto_69622 - SURFACE
      ?auto_69619 - SURFACE
      ?auto_69623 - SURFACE
      ?auto_69625 - SURFACE
      ?auto_69624 - SURFACE
      ?auto_69626 - SURFACE
    )
    :vars
    (
      ?auto_69630 - HOIST
      ?auto_69628 - PLACE
      ?auto_69632 - PLACE
      ?auto_69629 - HOIST
      ?auto_69631 - SURFACE
      ?auto_69627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_69630 ?auto_69628 ) ( IS-CRATE ?auto_69626 ) ( not ( = ?auto_69624 ?auto_69626 ) ) ( not ( = ?auto_69625 ?auto_69624 ) ) ( not ( = ?auto_69625 ?auto_69626 ) ) ( not ( = ?auto_69632 ?auto_69628 ) ) ( HOIST-AT ?auto_69629 ?auto_69632 ) ( not ( = ?auto_69630 ?auto_69629 ) ) ( AVAILABLE ?auto_69629 ) ( SURFACE-AT ?auto_69626 ?auto_69632 ) ( ON ?auto_69626 ?auto_69631 ) ( CLEAR ?auto_69626 ) ( not ( = ?auto_69624 ?auto_69631 ) ) ( not ( = ?auto_69626 ?auto_69631 ) ) ( not ( = ?auto_69625 ?auto_69631 ) ) ( TRUCK-AT ?auto_69627 ?auto_69628 ) ( SURFACE-AT ?auto_69625 ?auto_69628 ) ( CLEAR ?auto_69625 ) ( LIFTING ?auto_69630 ?auto_69624 ) ( IS-CRATE ?auto_69624 ) ( ON ?auto_69621 ?auto_69620 ) ( ON ?auto_69622 ?auto_69621 ) ( ON ?auto_69619 ?auto_69622 ) ( ON ?auto_69623 ?auto_69619 ) ( ON ?auto_69625 ?auto_69623 ) ( not ( = ?auto_69620 ?auto_69621 ) ) ( not ( = ?auto_69620 ?auto_69622 ) ) ( not ( = ?auto_69620 ?auto_69619 ) ) ( not ( = ?auto_69620 ?auto_69623 ) ) ( not ( = ?auto_69620 ?auto_69625 ) ) ( not ( = ?auto_69620 ?auto_69624 ) ) ( not ( = ?auto_69620 ?auto_69626 ) ) ( not ( = ?auto_69620 ?auto_69631 ) ) ( not ( = ?auto_69621 ?auto_69622 ) ) ( not ( = ?auto_69621 ?auto_69619 ) ) ( not ( = ?auto_69621 ?auto_69623 ) ) ( not ( = ?auto_69621 ?auto_69625 ) ) ( not ( = ?auto_69621 ?auto_69624 ) ) ( not ( = ?auto_69621 ?auto_69626 ) ) ( not ( = ?auto_69621 ?auto_69631 ) ) ( not ( = ?auto_69622 ?auto_69619 ) ) ( not ( = ?auto_69622 ?auto_69623 ) ) ( not ( = ?auto_69622 ?auto_69625 ) ) ( not ( = ?auto_69622 ?auto_69624 ) ) ( not ( = ?auto_69622 ?auto_69626 ) ) ( not ( = ?auto_69622 ?auto_69631 ) ) ( not ( = ?auto_69619 ?auto_69623 ) ) ( not ( = ?auto_69619 ?auto_69625 ) ) ( not ( = ?auto_69619 ?auto_69624 ) ) ( not ( = ?auto_69619 ?auto_69626 ) ) ( not ( = ?auto_69619 ?auto_69631 ) ) ( not ( = ?auto_69623 ?auto_69625 ) ) ( not ( = ?auto_69623 ?auto_69624 ) ) ( not ( = ?auto_69623 ?auto_69626 ) ) ( not ( = ?auto_69623 ?auto_69631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69625 ?auto_69624 ?auto_69626 )
      ( MAKE-7CRATE-VERIFY ?auto_69620 ?auto_69621 ?auto_69622 ?auto_69619 ?auto_69623 ?auto_69625 ?auto_69624 ?auto_69626 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69698 - SURFACE
      ?auto_69699 - SURFACE
      ?auto_69700 - SURFACE
      ?auto_69697 - SURFACE
      ?auto_69701 - SURFACE
      ?auto_69703 - SURFACE
      ?auto_69702 - SURFACE
      ?auto_69704 - SURFACE
    )
    :vars
    (
      ?auto_69705 - HOIST
      ?auto_69707 - PLACE
      ?auto_69710 - PLACE
      ?auto_69708 - HOIST
      ?auto_69709 - SURFACE
      ?auto_69706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_69705 ?auto_69707 ) ( IS-CRATE ?auto_69704 ) ( not ( = ?auto_69702 ?auto_69704 ) ) ( not ( = ?auto_69703 ?auto_69702 ) ) ( not ( = ?auto_69703 ?auto_69704 ) ) ( not ( = ?auto_69710 ?auto_69707 ) ) ( HOIST-AT ?auto_69708 ?auto_69710 ) ( not ( = ?auto_69705 ?auto_69708 ) ) ( AVAILABLE ?auto_69708 ) ( SURFACE-AT ?auto_69704 ?auto_69710 ) ( ON ?auto_69704 ?auto_69709 ) ( CLEAR ?auto_69704 ) ( not ( = ?auto_69702 ?auto_69709 ) ) ( not ( = ?auto_69704 ?auto_69709 ) ) ( not ( = ?auto_69703 ?auto_69709 ) ) ( TRUCK-AT ?auto_69706 ?auto_69707 ) ( SURFACE-AT ?auto_69703 ?auto_69707 ) ( CLEAR ?auto_69703 ) ( IS-CRATE ?auto_69702 ) ( AVAILABLE ?auto_69705 ) ( IN ?auto_69702 ?auto_69706 ) ( ON ?auto_69699 ?auto_69698 ) ( ON ?auto_69700 ?auto_69699 ) ( ON ?auto_69697 ?auto_69700 ) ( ON ?auto_69701 ?auto_69697 ) ( ON ?auto_69703 ?auto_69701 ) ( not ( = ?auto_69698 ?auto_69699 ) ) ( not ( = ?auto_69698 ?auto_69700 ) ) ( not ( = ?auto_69698 ?auto_69697 ) ) ( not ( = ?auto_69698 ?auto_69701 ) ) ( not ( = ?auto_69698 ?auto_69703 ) ) ( not ( = ?auto_69698 ?auto_69702 ) ) ( not ( = ?auto_69698 ?auto_69704 ) ) ( not ( = ?auto_69698 ?auto_69709 ) ) ( not ( = ?auto_69699 ?auto_69700 ) ) ( not ( = ?auto_69699 ?auto_69697 ) ) ( not ( = ?auto_69699 ?auto_69701 ) ) ( not ( = ?auto_69699 ?auto_69703 ) ) ( not ( = ?auto_69699 ?auto_69702 ) ) ( not ( = ?auto_69699 ?auto_69704 ) ) ( not ( = ?auto_69699 ?auto_69709 ) ) ( not ( = ?auto_69700 ?auto_69697 ) ) ( not ( = ?auto_69700 ?auto_69701 ) ) ( not ( = ?auto_69700 ?auto_69703 ) ) ( not ( = ?auto_69700 ?auto_69702 ) ) ( not ( = ?auto_69700 ?auto_69704 ) ) ( not ( = ?auto_69700 ?auto_69709 ) ) ( not ( = ?auto_69697 ?auto_69701 ) ) ( not ( = ?auto_69697 ?auto_69703 ) ) ( not ( = ?auto_69697 ?auto_69702 ) ) ( not ( = ?auto_69697 ?auto_69704 ) ) ( not ( = ?auto_69697 ?auto_69709 ) ) ( not ( = ?auto_69701 ?auto_69703 ) ) ( not ( = ?auto_69701 ?auto_69702 ) ) ( not ( = ?auto_69701 ?auto_69704 ) ) ( not ( = ?auto_69701 ?auto_69709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69703 ?auto_69702 ?auto_69704 )
      ( MAKE-7CRATE-VERIFY ?auto_69698 ?auto_69699 ?auto_69700 ?auto_69697 ?auto_69701 ?auto_69703 ?auto_69702 ?auto_69704 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_70276 - SURFACE
      ?auto_70277 - SURFACE
    )
    :vars
    (
      ?auto_70282 - HOIST
      ?auto_70283 - PLACE
      ?auto_70281 - SURFACE
      ?auto_70279 - TRUCK
      ?auto_70284 - PLACE
      ?auto_70278 - HOIST
      ?auto_70280 - SURFACE
      ?auto_70285 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_70282 ?auto_70283 ) ( SURFACE-AT ?auto_70276 ?auto_70283 ) ( CLEAR ?auto_70276 ) ( IS-CRATE ?auto_70277 ) ( not ( = ?auto_70276 ?auto_70277 ) ) ( AVAILABLE ?auto_70282 ) ( ON ?auto_70276 ?auto_70281 ) ( not ( = ?auto_70281 ?auto_70276 ) ) ( not ( = ?auto_70281 ?auto_70277 ) ) ( TRUCK-AT ?auto_70279 ?auto_70284 ) ( not ( = ?auto_70284 ?auto_70283 ) ) ( HOIST-AT ?auto_70278 ?auto_70284 ) ( not ( = ?auto_70282 ?auto_70278 ) ) ( SURFACE-AT ?auto_70277 ?auto_70284 ) ( ON ?auto_70277 ?auto_70280 ) ( CLEAR ?auto_70277 ) ( not ( = ?auto_70276 ?auto_70280 ) ) ( not ( = ?auto_70277 ?auto_70280 ) ) ( not ( = ?auto_70281 ?auto_70280 ) ) ( LIFTING ?auto_70278 ?auto_70285 ) ( IS-CRATE ?auto_70285 ) ( not ( = ?auto_70276 ?auto_70285 ) ) ( not ( = ?auto_70277 ?auto_70285 ) ) ( not ( = ?auto_70281 ?auto_70285 ) ) ( not ( = ?auto_70280 ?auto_70285 ) ) )
    :subtasks
    ( ( !LOAD ?auto_70278 ?auto_70285 ?auto_70279 ?auto_70284 )
      ( MAKE-1CRATE ?auto_70276 ?auto_70277 )
      ( MAKE-1CRATE-VERIFY ?auto_70276 ?auto_70277 ) )
  )

)

