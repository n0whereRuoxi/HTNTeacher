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

  ( :method MAKE-12CRATE-VERIFY
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
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693687 - SURFACE
      ?auto_693688 - SURFACE
    )
    :vars
    (
      ?auto_693689 - HOIST
      ?auto_693690 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693689 ?auto_693690 ) ( SURFACE-AT ?auto_693687 ?auto_693690 ) ( CLEAR ?auto_693687 ) ( LIFTING ?auto_693689 ?auto_693688 ) ( IS-CRATE ?auto_693688 ) ( not ( = ?auto_693687 ?auto_693688 ) ) )
    :subtasks
    ( ( !DROP ?auto_693689 ?auto_693688 ?auto_693687 ?auto_693690 )
      ( MAKE-1CRATE-VERIFY ?auto_693687 ?auto_693688 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693691 - SURFACE
      ?auto_693692 - SURFACE
    )
    :vars
    (
      ?auto_693693 - HOIST
      ?auto_693694 - PLACE
      ?auto_693695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693693 ?auto_693694 ) ( SURFACE-AT ?auto_693691 ?auto_693694 ) ( CLEAR ?auto_693691 ) ( IS-CRATE ?auto_693692 ) ( not ( = ?auto_693691 ?auto_693692 ) ) ( TRUCK-AT ?auto_693695 ?auto_693694 ) ( AVAILABLE ?auto_693693 ) ( IN ?auto_693692 ?auto_693695 ) )
    :subtasks
    ( ( !UNLOAD ?auto_693693 ?auto_693692 ?auto_693695 ?auto_693694 )
      ( MAKE-1CRATE ?auto_693691 ?auto_693692 )
      ( MAKE-1CRATE-VERIFY ?auto_693691 ?auto_693692 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693696 - SURFACE
      ?auto_693697 - SURFACE
    )
    :vars
    (
      ?auto_693698 - HOIST
      ?auto_693700 - PLACE
      ?auto_693699 - TRUCK
      ?auto_693701 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693698 ?auto_693700 ) ( SURFACE-AT ?auto_693696 ?auto_693700 ) ( CLEAR ?auto_693696 ) ( IS-CRATE ?auto_693697 ) ( not ( = ?auto_693696 ?auto_693697 ) ) ( AVAILABLE ?auto_693698 ) ( IN ?auto_693697 ?auto_693699 ) ( TRUCK-AT ?auto_693699 ?auto_693701 ) ( not ( = ?auto_693701 ?auto_693700 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_693699 ?auto_693701 ?auto_693700 )
      ( MAKE-1CRATE ?auto_693696 ?auto_693697 )
      ( MAKE-1CRATE-VERIFY ?auto_693696 ?auto_693697 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693702 - SURFACE
      ?auto_693703 - SURFACE
    )
    :vars
    (
      ?auto_693707 - HOIST
      ?auto_693706 - PLACE
      ?auto_693705 - TRUCK
      ?auto_693704 - PLACE
      ?auto_693708 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_693707 ?auto_693706 ) ( SURFACE-AT ?auto_693702 ?auto_693706 ) ( CLEAR ?auto_693702 ) ( IS-CRATE ?auto_693703 ) ( not ( = ?auto_693702 ?auto_693703 ) ) ( AVAILABLE ?auto_693707 ) ( TRUCK-AT ?auto_693705 ?auto_693704 ) ( not ( = ?auto_693704 ?auto_693706 ) ) ( HOIST-AT ?auto_693708 ?auto_693704 ) ( LIFTING ?auto_693708 ?auto_693703 ) ( not ( = ?auto_693707 ?auto_693708 ) ) )
    :subtasks
    ( ( !LOAD ?auto_693708 ?auto_693703 ?auto_693705 ?auto_693704 )
      ( MAKE-1CRATE ?auto_693702 ?auto_693703 )
      ( MAKE-1CRATE-VERIFY ?auto_693702 ?auto_693703 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693709 - SURFACE
      ?auto_693710 - SURFACE
    )
    :vars
    (
      ?auto_693713 - HOIST
      ?auto_693712 - PLACE
      ?auto_693714 - TRUCK
      ?auto_693711 - PLACE
      ?auto_693715 - HOIST
      ?auto_693716 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693713 ?auto_693712 ) ( SURFACE-AT ?auto_693709 ?auto_693712 ) ( CLEAR ?auto_693709 ) ( IS-CRATE ?auto_693710 ) ( not ( = ?auto_693709 ?auto_693710 ) ) ( AVAILABLE ?auto_693713 ) ( TRUCK-AT ?auto_693714 ?auto_693711 ) ( not ( = ?auto_693711 ?auto_693712 ) ) ( HOIST-AT ?auto_693715 ?auto_693711 ) ( not ( = ?auto_693713 ?auto_693715 ) ) ( AVAILABLE ?auto_693715 ) ( SURFACE-AT ?auto_693710 ?auto_693711 ) ( ON ?auto_693710 ?auto_693716 ) ( CLEAR ?auto_693710 ) ( not ( = ?auto_693709 ?auto_693716 ) ) ( not ( = ?auto_693710 ?auto_693716 ) ) )
    :subtasks
    ( ( !LIFT ?auto_693715 ?auto_693710 ?auto_693716 ?auto_693711 )
      ( MAKE-1CRATE ?auto_693709 ?auto_693710 )
      ( MAKE-1CRATE-VERIFY ?auto_693709 ?auto_693710 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693717 - SURFACE
      ?auto_693718 - SURFACE
    )
    :vars
    (
      ?auto_693719 - HOIST
      ?auto_693722 - PLACE
      ?auto_693720 - PLACE
      ?auto_693723 - HOIST
      ?auto_693724 - SURFACE
      ?auto_693721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693719 ?auto_693722 ) ( SURFACE-AT ?auto_693717 ?auto_693722 ) ( CLEAR ?auto_693717 ) ( IS-CRATE ?auto_693718 ) ( not ( = ?auto_693717 ?auto_693718 ) ) ( AVAILABLE ?auto_693719 ) ( not ( = ?auto_693720 ?auto_693722 ) ) ( HOIST-AT ?auto_693723 ?auto_693720 ) ( not ( = ?auto_693719 ?auto_693723 ) ) ( AVAILABLE ?auto_693723 ) ( SURFACE-AT ?auto_693718 ?auto_693720 ) ( ON ?auto_693718 ?auto_693724 ) ( CLEAR ?auto_693718 ) ( not ( = ?auto_693717 ?auto_693724 ) ) ( not ( = ?auto_693718 ?auto_693724 ) ) ( TRUCK-AT ?auto_693721 ?auto_693722 ) )
    :subtasks
    ( ( !DRIVE ?auto_693721 ?auto_693722 ?auto_693720 )
      ( MAKE-1CRATE ?auto_693717 ?auto_693718 )
      ( MAKE-1CRATE-VERIFY ?auto_693717 ?auto_693718 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693734 - SURFACE
      ?auto_693735 - SURFACE
      ?auto_693736 - SURFACE
    )
    :vars
    (
      ?auto_693737 - HOIST
      ?auto_693738 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693737 ?auto_693738 ) ( SURFACE-AT ?auto_693735 ?auto_693738 ) ( CLEAR ?auto_693735 ) ( LIFTING ?auto_693737 ?auto_693736 ) ( IS-CRATE ?auto_693736 ) ( not ( = ?auto_693735 ?auto_693736 ) ) ( ON ?auto_693735 ?auto_693734 ) ( not ( = ?auto_693734 ?auto_693735 ) ) ( not ( = ?auto_693734 ?auto_693736 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693735 ?auto_693736 )
      ( MAKE-2CRATE-VERIFY ?auto_693734 ?auto_693735 ?auto_693736 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693744 - SURFACE
      ?auto_693745 - SURFACE
      ?auto_693746 - SURFACE
    )
    :vars
    (
      ?auto_693748 - HOIST
      ?auto_693749 - PLACE
      ?auto_693747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693748 ?auto_693749 ) ( SURFACE-AT ?auto_693745 ?auto_693749 ) ( CLEAR ?auto_693745 ) ( IS-CRATE ?auto_693746 ) ( not ( = ?auto_693745 ?auto_693746 ) ) ( TRUCK-AT ?auto_693747 ?auto_693749 ) ( AVAILABLE ?auto_693748 ) ( IN ?auto_693746 ?auto_693747 ) ( ON ?auto_693745 ?auto_693744 ) ( not ( = ?auto_693744 ?auto_693745 ) ) ( not ( = ?auto_693744 ?auto_693746 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693745 ?auto_693746 )
      ( MAKE-2CRATE-VERIFY ?auto_693744 ?auto_693745 ?auto_693746 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693750 - SURFACE
      ?auto_693751 - SURFACE
    )
    :vars
    (
      ?auto_693752 - HOIST
      ?auto_693754 - PLACE
      ?auto_693753 - TRUCK
      ?auto_693755 - SURFACE
      ?auto_693756 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693752 ?auto_693754 ) ( SURFACE-AT ?auto_693750 ?auto_693754 ) ( CLEAR ?auto_693750 ) ( IS-CRATE ?auto_693751 ) ( not ( = ?auto_693750 ?auto_693751 ) ) ( AVAILABLE ?auto_693752 ) ( IN ?auto_693751 ?auto_693753 ) ( ON ?auto_693750 ?auto_693755 ) ( not ( = ?auto_693755 ?auto_693750 ) ) ( not ( = ?auto_693755 ?auto_693751 ) ) ( TRUCK-AT ?auto_693753 ?auto_693756 ) ( not ( = ?auto_693756 ?auto_693754 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_693753 ?auto_693756 ?auto_693754 )
      ( MAKE-2CRATE ?auto_693755 ?auto_693750 ?auto_693751 )
      ( MAKE-1CRATE-VERIFY ?auto_693750 ?auto_693751 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693757 - SURFACE
      ?auto_693758 - SURFACE
      ?auto_693759 - SURFACE
    )
    :vars
    (
      ?auto_693761 - HOIST
      ?auto_693762 - PLACE
      ?auto_693760 - TRUCK
      ?auto_693763 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693761 ?auto_693762 ) ( SURFACE-AT ?auto_693758 ?auto_693762 ) ( CLEAR ?auto_693758 ) ( IS-CRATE ?auto_693759 ) ( not ( = ?auto_693758 ?auto_693759 ) ) ( AVAILABLE ?auto_693761 ) ( IN ?auto_693759 ?auto_693760 ) ( ON ?auto_693758 ?auto_693757 ) ( not ( = ?auto_693757 ?auto_693758 ) ) ( not ( = ?auto_693757 ?auto_693759 ) ) ( TRUCK-AT ?auto_693760 ?auto_693763 ) ( not ( = ?auto_693763 ?auto_693762 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693758 ?auto_693759 )
      ( MAKE-2CRATE-VERIFY ?auto_693757 ?auto_693758 ?auto_693759 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693764 - SURFACE
      ?auto_693765 - SURFACE
    )
    :vars
    (
      ?auto_693769 - HOIST
      ?auto_693770 - PLACE
      ?auto_693766 - SURFACE
      ?auto_693768 - TRUCK
      ?auto_693767 - PLACE
      ?auto_693771 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_693769 ?auto_693770 ) ( SURFACE-AT ?auto_693764 ?auto_693770 ) ( CLEAR ?auto_693764 ) ( IS-CRATE ?auto_693765 ) ( not ( = ?auto_693764 ?auto_693765 ) ) ( AVAILABLE ?auto_693769 ) ( ON ?auto_693764 ?auto_693766 ) ( not ( = ?auto_693766 ?auto_693764 ) ) ( not ( = ?auto_693766 ?auto_693765 ) ) ( TRUCK-AT ?auto_693768 ?auto_693767 ) ( not ( = ?auto_693767 ?auto_693770 ) ) ( HOIST-AT ?auto_693771 ?auto_693767 ) ( LIFTING ?auto_693771 ?auto_693765 ) ( not ( = ?auto_693769 ?auto_693771 ) ) )
    :subtasks
    ( ( !LOAD ?auto_693771 ?auto_693765 ?auto_693768 ?auto_693767 )
      ( MAKE-2CRATE ?auto_693766 ?auto_693764 ?auto_693765 )
      ( MAKE-1CRATE-VERIFY ?auto_693764 ?auto_693765 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693772 - SURFACE
      ?auto_693773 - SURFACE
      ?auto_693774 - SURFACE
    )
    :vars
    (
      ?auto_693779 - HOIST
      ?auto_693777 - PLACE
      ?auto_693775 - TRUCK
      ?auto_693778 - PLACE
      ?auto_693776 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_693779 ?auto_693777 ) ( SURFACE-AT ?auto_693773 ?auto_693777 ) ( CLEAR ?auto_693773 ) ( IS-CRATE ?auto_693774 ) ( not ( = ?auto_693773 ?auto_693774 ) ) ( AVAILABLE ?auto_693779 ) ( ON ?auto_693773 ?auto_693772 ) ( not ( = ?auto_693772 ?auto_693773 ) ) ( not ( = ?auto_693772 ?auto_693774 ) ) ( TRUCK-AT ?auto_693775 ?auto_693778 ) ( not ( = ?auto_693778 ?auto_693777 ) ) ( HOIST-AT ?auto_693776 ?auto_693778 ) ( LIFTING ?auto_693776 ?auto_693774 ) ( not ( = ?auto_693779 ?auto_693776 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693773 ?auto_693774 )
      ( MAKE-2CRATE-VERIFY ?auto_693772 ?auto_693773 ?auto_693774 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693780 - SURFACE
      ?auto_693781 - SURFACE
    )
    :vars
    (
      ?auto_693784 - HOIST
      ?auto_693783 - PLACE
      ?auto_693782 - SURFACE
      ?auto_693785 - TRUCK
      ?auto_693787 - PLACE
      ?auto_693786 - HOIST
      ?auto_693788 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693784 ?auto_693783 ) ( SURFACE-AT ?auto_693780 ?auto_693783 ) ( CLEAR ?auto_693780 ) ( IS-CRATE ?auto_693781 ) ( not ( = ?auto_693780 ?auto_693781 ) ) ( AVAILABLE ?auto_693784 ) ( ON ?auto_693780 ?auto_693782 ) ( not ( = ?auto_693782 ?auto_693780 ) ) ( not ( = ?auto_693782 ?auto_693781 ) ) ( TRUCK-AT ?auto_693785 ?auto_693787 ) ( not ( = ?auto_693787 ?auto_693783 ) ) ( HOIST-AT ?auto_693786 ?auto_693787 ) ( not ( = ?auto_693784 ?auto_693786 ) ) ( AVAILABLE ?auto_693786 ) ( SURFACE-AT ?auto_693781 ?auto_693787 ) ( ON ?auto_693781 ?auto_693788 ) ( CLEAR ?auto_693781 ) ( not ( = ?auto_693780 ?auto_693788 ) ) ( not ( = ?auto_693781 ?auto_693788 ) ) ( not ( = ?auto_693782 ?auto_693788 ) ) )
    :subtasks
    ( ( !LIFT ?auto_693786 ?auto_693781 ?auto_693788 ?auto_693787 )
      ( MAKE-2CRATE ?auto_693782 ?auto_693780 ?auto_693781 )
      ( MAKE-1CRATE-VERIFY ?auto_693780 ?auto_693781 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693789 - SURFACE
      ?auto_693790 - SURFACE
      ?auto_693791 - SURFACE
    )
    :vars
    (
      ?auto_693794 - HOIST
      ?auto_693793 - PLACE
      ?auto_693797 - TRUCK
      ?auto_693795 - PLACE
      ?auto_693792 - HOIST
      ?auto_693796 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693794 ?auto_693793 ) ( SURFACE-AT ?auto_693790 ?auto_693793 ) ( CLEAR ?auto_693790 ) ( IS-CRATE ?auto_693791 ) ( not ( = ?auto_693790 ?auto_693791 ) ) ( AVAILABLE ?auto_693794 ) ( ON ?auto_693790 ?auto_693789 ) ( not ( = ?auto_693789 ?auto_693790 ) ) ( not ( = ?auto_693789 ?auto_693791 ) ) ( TRUCK-AT ?auto_693797 ?auto_693795 ) ( not ( = ?auto_693795 ?auto_693793 ) ) ( HOIST-AT ?auto_693792 ?auto_693795 ) ( not ( = ?auto_693794 ?auto_693792 ) ) ( AVAILABLE ?auto_693792 ) ( SURFACE-AT ?auto_693791 ?auto_693795 ) ( ON ?auto_693791 ?auto_693796 ) ( CLEAR ?auto_693791 ) ( not ( = ?auto_693790 ?auto_693796 ) ) ( not ( = ?auto_693791 ?auto_693796 ) ) ( not ( = ?auto_693789 ?auto_693796 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693790 ?auto_693791 )
      ( MAKE-2CRATE-VERIFY ?auto_693789 ?auto_693790 ?auto_693791 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693798 - SURFACE
      ?auto_693799 - SURFACE
    )
    :vars
    (
      ?auto_693805 - HOIST
      ?auto_693801 - PLACE
      ?auto_693802 - SURFACE
      ?auto_693800 - PLACE
      ?auto_693803 - HOIST
      ?auto_693806 - SURFACE
      ?auto_693804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693805 ?auto_693801 ) ( SURFACE-AT ?auto_693798 ?auto_693801 ) ( CLEAR ?auto_693798 ) ( IS-CRATE ?auto_693799 ) ( not ( = ?auto_693798 ?auto_693799 ) ) ( AVAILABLE ?auto_693805 ) ( ON ?auto_693798 ?auto_693802 ) ( not ( = ?auto_693802 ?auto_693798 ) ) ( not ( = ?auto_693802 ?auto_693799 ) ) ( not ( = ?auto_693800 ?auto_693801 ) ) ( HOIST-AT ?auto_693803 ?auto_693800 ) ( not ( = ?auto_693805 ?auto_693803 ) ) ( AVAILABLE ?auto_693803 ) ( SURFACE-AT ?auto_693799 ?auto_693800 ) ( ON ?auto_693799 ?auto_693806 ) ( CLEAR ?auto_693799 ) ( not ( = ?auto_693798 ?auto_693806 ) ) ( not ( = ?auto_693799 ?auto_693806 ) ) ( not ( = ?auto_693802 ?auto_693806 ) ) ( TRUCK-AT ?auto_693804 ?auto_693801 ) )
    :subtasks
    ( ( !DRIVE ?auto_693804 ?auto_693801 ?auto_693800 )
      ( MAKE-2CRATE ?auto_693802 ?auto_693798 ?auto_693799 )
      ( MAKE-1CRATE-VERIFY ?auto_693798 ?auto_693799 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693807 - SURFACE
      ?auto_693808 - SURFACE
      ?auto_693809 - SURFACE
    )
    :vars
    (
      ?auto_693815 - HOIST
      ?auto_693810 - PLACE
      ?auto_693812 - PLACE
      ?auto_693814 - HOIST
      ?auto_693813 - SURFACE
      ?auto_693811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693815 ?auto_693810 ) ( SURFACE-AT ?auto_693808 ?auto_693810 ) ( CLEAR ?auto_693808 ) ( IS-CRATE ?auto_693809 ) ( not ( = ?auto_693808 ?auto_693809 ) ) ( AVAILABLE ?auto_693815 ) ( ON ?auto_693808 ?auto_693807 ) ( not ( = ?auto_693807 ?auto_693808 ) ) ( not ( = ?auto_693807 ?auto_693809 ) ) ( not ( = ?auto_693812 ?auto_693810 ) ) ( HOIST-AT ?auto_693814 ?auto_693812 ) ( not ( = ?auto_693815 ?auto_693814 ) ) ( AVAILABLE ?auto_693814 ) ( SURFACE-AT ?auto_693809 ?auto_693812 ) ( ON ?auto_693809 ?auto_693813 ) ( CLEAR ?auto_693809 ) ( not ( = ?auto_693808 ?auto_693813 ) ) ( not ( = ?auto_693809 ?auto_693813 ) ) ( not ( = ?auto_693807 ?auto_693813 ) ) ( TRUCK-AT ?auto_693811 ?auto_693810 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693808 ?auto_693809 )
      ( MAKE-2CRATE-VERIFY ?auto_693807 ?auto_693808 ?auto_693809 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693816 - SURFACE
      ?auto_693817 - SURFACE
    )
    :vars
    (
      ?auto_693818 - HOIST
      ?auto_693822 - PLACE
      ?auto_693820 - SURFACE
      ?auto_693821 - PLACE
      ?auto_693824 - HOIST
      ?auto_693819 - SURFACE
      ?auto_693823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693818 ?auto_693822 ) ( IS-CRATE ?auto_693817 ) ( not ( = ?auto_693816 ?auto_693817 ) ) ( not ( = ?auto_693820 ?auto_693816 ) ) ( not ( = ?auto_693820 ?auto_693817 ) ) ( not ( = ?auto_693821 ?auto_693822 ) ) ( HOIST-AT ?auto_693824 ?auto_693821 ) ( not ( = ?auto_693818 ?auto_693824 ) ) ( AVAILABLE ?auto_693824 ) ( SURFACE-AT ?auto_693817 ?auto_693821 ) ( ON ?auto_693817 ?auto_693819 ) ( CLEAR ?auto_693817 ) ( not ( = ?auto_693816 ?auto_693819 ) ) ( not ( = ?auto_693817 ?auto_693819 ) ) ( not ( = ?auto_693820 ?auto_693819 ) ) ( TRUCK-AT ?auto_693823 ?auto_693822 ) ( SURFACE-AT ?auto_693820 ?auto_693822 ) ( CLEAR ?auto_693820 ) ( LIFTING ?auto_693818 ?auto_693816 ) ( IS-CRATE ?auto_693816 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693820 ?auto_693816 )
      ( MAKE-2CRATE ?auto_693820 ?auto_693816 ?auto_693817 )
      ( MAKE-1CRATE-VERIFY ?auto_693816 ?auto_693817 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693825 - SURFACE
      ?auto_693826 - SURFACE
      ?auto_693827 - SURFACE
    )
    :vars
    (
      ?auto_693828 - HOIST
      ?auto_693833 - PLACE
      ?auto_693829 - PLACE
      ?auto_693830 - HOIST
      ?auto_693832 - SURFACE
      ?auto_693831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693828 ?auto_693833 ) ( IS-CRATE ?auto_693827 ) ( not ( = ?auto_693826 ?auto_693827 ) ) ( not ( = ?auto_693825 ?auto_693826 ) ) ( not ( = ?auto_693825 ?auto_693827 ) ) ( not ( = ?auto_693829 ?auto_693833 ) ) ( HOIST-AT ?auto_693830 ?auto_693829 ) ( not ( = ?auto_693828 ?auto_693830 ) ) ( AVAILABLE ?auto_693830 ) ( SURFACE-AT ?auto_693827 ?auto_693829 ) ( ON ?auto_693827 ?auto_693832 ) ( CLEAR ?auto_693827 ) ( not ( = ?auto_693826 ?auto_693832 ) ) ( not ( = ?auto_693827 ?auto_693832 ) ) ( not ( = ?auto_693825 ?auto_693832 ) ) ( TRUCK-AT ?auto_693831 ?auto_693833 ) ( SURFACE-AT ?auto_693825 ?auto_693833 ) ( CLEAR ?auto_693825 ) ( LIFTING ?auto_693828 ?auto_693826 ) ( IS-CRATE ?auto_693826 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693826 ?auto_693827 )
      ( MAKE-2CRATE-VERIFY ?auto_693825 ?auto_693826 ?auto_693827 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693834 - SURFACE
      ?auto_693835 - SURFACE
    )
    :vars
    (
      ?auto_693836 - HOIST
      ?auto_693840 - PLACE
      ?auto_693842 - SURFACE
      ?auto_693841 - PLACE
      ?auto_693838 - HOIST
      ?auto_693839 - SURFACE
      ?auto_693837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693836 ?auto_693840 ) ( IS-CRATE ?auto_693835 ) ( not ( = ?auto_693834 ?auto_693835 ) ) ( not ( = ?auto_693842 ?auto_693834 ) ) ( not ( = ?auto_693842 ?auto_693835 ) ) ( not ( = ?auto_693841 ?auto_693840 ) ) ( HOIST-AT ?auto_693838 ?auto_693841 ) ( not ( = ?auto_693836 ?auto_693838 ) ) ( AVAILABLE ?auto_693838 ) ( SURFACE-AT ?auto_693835 ?auto_693841 ) ( ON ?auto_693835 ?auto_693839 ) ( CLEAR ?auto_693835 ) ( not ( = ?auto_693834 ?auto_693839 ) ) ( not ( = ?auto_693835 ?auto_693839 ) ) ( not ( = ?auto_693842 ?auto_693839 ) ) ( TRUCK-AT ?auto_693837 ?auto_693840 ) ( SURFACE-AT ?auto_693842 ?auto_693840 ) ( CLEAR ?auto_693842 ) ( IS-CRATE ?auto_693834 ) ( AVAILABLE ?auto_693836 ) ( IN ?auto_693834 ?auto_693837 ) )
    :subtasks
    ( ( !UNLOAD ?auto_693836 ?auto_693834 ?auto_693837 ?auto_693840 )
      ( MAKE-2CRATE ?auto_693842 ?auto_693834 ?auto_693835 )
      ( MAKE-1CRATE-VERIFY ?auto_693834 ?auto_693835 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693843 - SURFACE
      ?auto_693844 - SURFACE
      ?auto_693845 - SURFACE
    )
    :vars
    (
      ?auto_693847 - HOIST
      ?auto_693849 - PLACE
      ?auto_693846 - PLACE
      ?auto_693851 - HOIST
      ?auto_693850 - SURFACE
      ?auto_693848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693847 ?auto_693849 ) ( IS-CRATE ?auto_693845 ) ( not ( = ?auto_693844 ?auto_693845 ) ) ( not ( = ?auto_693843 ?auto_693844 ) ) ( not ( = ?auto_693843 ?auto_693845 ) ) ( not ( = ?auto_693846 ?auto_693849 ) ) ( HOIST-AT ?auto_693851 ?auto_693846 ) ( not ( = ?auto_693847 ?auto_693851 ) ) ( AVAILABLE ?auto_693851 ) ( SURFACE-AT ?auto_693845 ?auto_693846 ) ( ON ?auto_693845 ?auto_693850 ) ( CLEAR ?auto_693845 ) ( not ( = ?auto_693844 ?auto_693850 ) ) ( not ( = ?auto_693845 ?auto_693850 ) ) ( not ( = ?auto_693843 ?auto_693850 ) ) ( TRUCK-AT ?auto_693848 ?auto_693849 ) ( SURFACE-AT ?auto_693843 ?auto_693849 ) ( CLEAR ?auto_693843 ) ( IS-CRATE ?auto_693844 ) ( AVAILABLE ?auto_693847 ) ( IN ?auto_693844 ?auto_693848 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693844 ?auto_693845 )
      ( MAKE-2CRATE-VERIFY ?auto_693843 ?auto_693844 ?auto_693845 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693888 - SURFACE
      ?auto_693889 - SURFACE
    )
    :vars
    (
      ?auto_693895 - HOIST
      ?auto_693893 - PLACE
      ?auto_693891 - SURFACE
      ?auto_693890 - PLACE
      ?auto_693896 - HOIST
      ?auto_693892 - SURFACE
      ?auto_693894 - TRUCK
      ?auto_693897 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693895 ?auto_693893 ) ( SURFACE-AT ?auto_693888 ?auto_693893 ) ( CLEAR ?auto_693888 ) ( IS-CRATE ?auto_693889 ) ( not ( = ?auto_693888 ?auto_693889 ) ) ( AVAILABLE ?auto_693895 ) ( ON ?auto_693888 ?auto_693891 ) ( not ( = ?auto_693891 ?auto_693888 ) ) ( not ( = ?auto_693891 ?auto_693889 ) ) ( not ( = ?auto_693890 ?auto_693893 ) ) ( HOIST-AT ?auto_693896 ?auto_693890 ) ( not ( = ?auto_693895 ?auto_693896 ) ) ( AVAILABLE ?auto_693896 ) ( SURFACE-AT ?auto_693889 ?auto_693890 ) ( ON ?auto_693889 ?auto_693892 ) ( CLEAR ?auto_693889 ) ( not ( = ?auto_693888 ?auto_693892 ) ) ( not ( = ?auto_693889 ?auto_693892 ) ) ( not ( = ?auto_693891 ?auto_693892 ) ) ( TRUCK-AT ?auto_693894 ?auto_693897 ) ( not ( = ?auto_693897 ?auto_693893 ) ) ( not ( = ?auto_693890 ?auto_693897 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_693894 ?auto_693897 ?auto_693893 )
      ( MAKE-1CRATE ?auto_693888 ?auto_693889 )
      ( MAKE-1CRATE-VERIFY ?auto_693888 ?auto_693889 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_693928 - SURFACE
      ?auto_693929 - SURFACE
      ?auto_693930 - SURFACE
      ?auto_693927 - SURFACE
    )
    :vars
    (
      ?auto_693932 - HOIST
      ?auto_693931 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693932 ?auto_693931 ) ( SURFACE-AT ?auto_693930 ?auto_693931 ) ( CLEAR ?auto_693930 ) ( LIFTING ?auto_693932 ?auto_693927 ) ( IS-CRATE ?auto_693927 ) ( not ( = ?auto_693930 ?auto_693927 ) ) ( ON ?auto_693929 ?auto_693928 ) ( ON ?auto_693930 ?auto_693929 ) ( not ( = ?auto_693928 ?auto_693929 ) ) ( not ( = ?auto_693928 ?auto_693930 ) ) ( not ( = ?auto_693928 ?auto_693927 ) ) ( not ( = ?auto_693929 ?auto_693930 ) ) ( not ( = ?auto_693929 ?auto_693927 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693930 ?auto_693927 )
      ( MAKE-3CRATE-VERIFY ?auto_693928 ?auto_693929 ?auto_693930 ?auto_693927 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_693945 - SURFACE
      ?auto_693946 - SURFACE
      ?auto_693947 - SURFACE
      ?auto_693944 - SURFACE
    )
    :vars
    (
      ?auto_693948 - HOIST
      ?auto_693949 - PLACE
      ?auto_693950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693948 ?auto_693949 ) ( SURFACE-AT ?auto_693947 ?auto_693949 ) ( CLEAR ?auto_693947 ) ( IS-CRATE ?auto_693944 ) ( not ( = ?auto_693947 ?auto_693944 ) ) ( TRUCK-AT ?auto_693950 ?auto_693949 ) ( AVAILABLE ?auto_693948 ) ( IN ?auto_693944 ?auto_693950 ) ( ON ?auto_693947 ?auto_693946 ) ( not ( = ?auto_693946 ?auto_693947 ) ) ( not ( = ?auto_693946 ?auto_693944 ) ) ( ON ?auto_693946 ?auto_693945 ) ( not ( = ?auto_693945 ?auto_693946 ) ) ( not ( = ?auto_693945 ?auto_693947 ) ) ( not ( = ?auto_693945 ?auto_693944 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_693946 ?auto_693947 ?auto_693944 )
      ( MAKE-3CRATE-VERIFY ?auto_693945 ?auto_693946 ?auto_693947 ?auto_693944 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_693966 - SURFACE
      ?auto_693967 - SURFACE
      ?auto_693968 - SURFACE
      ?auto_693965 - SURFACE
    )
    :vars
    (
      ?auto_693969 - HOIST
      ?auto_693970 - PLACE
      ?auto_693971 - TRUCK
      ?auto_693972 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693969 ?auto_693970 ) ( SURFACE-AT ?auto_693968 ?auto_693970 ) ( CLEAR ?auto_693968 ) ( IS-CRATE ?auto_693965 ) ( not ( = ?auto_693968 ?auto_693965 ) ) ( AVAILABLE ?auto_693969 ) ( IN ?auto_693965 ?auto_693971 ) ( ON ?auto_693968 ?auto_693967 ) ( not ( = ?auto_693967 ?auto_693968 ) ) ( not ( = ?auto_693967 ?auto_693965 ) ) ( TRUCK-AT ?auto_693971 ?auto_693972 ) ( not ( = ?auto_693972 ?auto_693970 ) ) ( ON ?auto_693967 ?auto_693966 ) ( not ( = ?auto_693966 ?auto_693967 ) ) ( not ( = ?auto_693966 ?auto_693968 ) ) ( not ( = ?auto_693966 ?auto_693965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_693967 ?auto_693968 ?auto_693965 )
      ( MAKE-3CRATE-VERIFY ?auto_693966 ?auto_693967 ?auto_693968 ?auto_693965 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_693990 - SURFACE
      ?auto_693991 - SURFACE
      ?auto_693992 - SURFACE
      ?auto_693989 - SURFACE
    )
    :vars
    (
      ?auto_693995 - HOIST
      ?auto_693997 - PLACE
      ?auto_693993 - TRUCK
      ?auto_693994 - PLACE
      ?auto_693996 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_693995 ?auto_693997 ) ( SURFACE-AT ?auto_693992 ?auto_693997 ) ( CLEAR ?auto_693992 ) ( IS-CRATE ?auto_693989 ) ( not ( = ?auto_693992 ?auto_693989 ) ) ( AVAILABLE ?auto_693995 ) ( ON ?auto_693992 ?auto_693991 ) ( not ( = ?auto_693991 ?auto_693992 ) ) ( not ( = ?auto_693991 ?auto_693989 ) ) ( TRUCK-AT ?auto_693993 ?auto_693994 ) ( not ( = ?auto_693994 ?auto_693997 ) ) ( HOIST-AT ?auto_693996 ?auto_693994 ) ( LIFTING ?auto_693996 ?auto_693989 ) ( not ( = ?auto_693995 ?auto_693996 ) ) ( ON ?auto_693991 ?auto_693990 ) ( not ( = ?auto_693990 ?auto_693991 ) ) ( not ( = ?auto_693990 ?auto_693992 ) ) ( not ( = ?auto_693990 ?auto_693989 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_693991 ?auto_693992 ?auto_693989 )
      ( MAKE-3CRATE-VERIFY ?auto_693990 ?auto_693991 ?auto_693992 ?auto_693989 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_694017 - SURFACE
      ?auto_694018 - SURFACE
      ?auto_694019 - SURFACE
      ?auto_694016 - SURFACE
    )
    :vars
    (
      ?auto_694023 - HOIST
      ?auto_694022 - PLACE
      ?auto_694024 - TRUCK
      ?auto_694020 - PLACE
      ?auto_694021 - HOIST
      ?auto_694025 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_694023 ?auto_694022 ) ( SURFACE-AT ?auto_694019 ?auto_694022 ) ( CLEAR ?auto_694019 ) ( IS-CRATE ?auto_694016 ) ( not ( = ?auto_694019 ?auto_694016 ) ) ( AVAILABLE ?auto_694023 ) ( ON ?auto_694019 ?auto_694018 ) ( not ( = ?auto_694018 ?auto_694019 ) ) ( not ( = ?auto_694018 ?auto_694016 ) ) ( TRUCK-AT ?auto_694024 ?auto_694020 ) ( not ( = ?auto_694020 ?auto_694022 ) ) ( HOIST-AT ?auto_694021 ?auto_694020 ) ( not ( = ?auto_694023 ?auto_694021 ) ) ( AVAILABLE ?auto_694021 ) ( SURFACE-AT ?auto_694016 ?auto_694020 ) ( ON ?auto_694016 ?auto_694025 ) ( CLEAR ?auto_694016 ) ( not ( = ?auto_694019 ?auto_694025 ) ) ( not ( = ?auto_694016 ?auto_694025 ) ) ( not ( = ?auto_694018 ?auto_694025 ) ) ( ON ?auto_694018 ?auto_694017 ) ( not ( = ?auto_694017 ?auto_694018 ) ) ( not ( = ?auto_694017 ?auto_694019 ) ) ( not ( = ?auto_694017 ?auto_694016 ) ) ( not ( = ?auto_694017 ?auto_694025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694018 ?auto_694019 ?auto_694016 )
      ( MAKE-3CRATE-VERIFY ?auto_694017 ?auto_694018 ?auto_694019 ?auto_694016 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_694045 - SURFACE
      ?auto_694046 - SURFACE
      ?auto_694047 - SURFACE
      ?auto_694044 - SURFACE
    )
    :vars
    (
      ?auto_694052 - HOIST
      ?auto_694050 - PLACE
      ?auto_694053 - PLACE
      ?auto_694051 - HOIST
      ?auto_694049 - SURFACE
      ?auto_694048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694052 ?auto_694050 ) ( SURFACE-AT ?auto_694047 ?auto_694050 ) ( CLEAR ?auto_694047 ) ( IS-CRATE ?auto_694044 ) ( not ( = ?auto_694047 ?auto_694044 ) ) ( AVAILABLE ?auto_694052 ) ( ON ?auto_694047 ?auto_694046 ) ( not ( = ?auto_694046 ?auto_694047 ) ) ( not ( = ?auto_694046 ?auto_694044 ) ) ( not ( = ?auto_694053 ?auto_694050 ) ) ( HOIST-AT ?auto_694051 ?auto_694053 ) ( not ( = ?auto_694052 ?auto_694051 ) ) ( AVAILABLE ?auto_694051 ) ( SURFACE-AT ?auto_694044 ?auto_694053 ) ( ON ?auto_694044 ?auto_694049 ) ( CLEAR ?auto_694044 ) ( not ( = ?auto_694047 ?auto_694049 ) ) ( not ( = ?auto_694044 ?auto_694049 ) ) ( not ( = ?auto_694046 ?auto_694049 ) ) ( TRUCK-AT ?auto_694048 ?auto_694050 ) ( ON ?auto_694046 ?auto_694045 ) ( not ( = ?auto_694045 ?auto_694046 ) ) ( not ( = ?auto_694045 ?auto_694047 ) ) ( not ( = ?auto_694045 ?auto_694044 ) ) ( not ( = ?auto_694045 ?auto_694049 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694046 ?auto_694047 ?auto_694044 )
      ( MAKE-3CRATE-VERIFY ?auto_694045 ?auto_694046 ?auto_694047 ?auto_694044 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_694073 - SURFACE
      ?auto_694074 - SURFACE
      ?auto_694075 - SURFACE
      ?auto_694072 - SURFACE
    )
    :vars
    (
      ?auto_694079 - HOIST
      ?auto_694076 - PLACE
      ?auto_694077 - PLACE
      ?auto_694078 - HOIST
      ?auto_694081 - SURFACE
      ?auto_694080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694079 ?auto_694076 ) ( IS-CRATE ?auto_694072 ) ( not ( = ?auto_694075 ?auto_694072 ) ) ( not ( = ?auto_694074 ?auto_694075 ) ) ( not ( = ?auto_694074 ?auto_694072 ) ) ( not ( = ?auto_694077 ?auto_694076 ) ) ( HOIST-AT ?auto_694078 ?auto_694077 ) ( not ( = ?auto_694079 ?auto_694078 ) ) ( AVAILABLE ?auto_694078 ) ( SURFACE-AT ?auto_694072 ?auto_694077 ) ( ON ?auto_694072 ?auto_694081 ) ( CLEAR ?auto_694072 ) ( not ( = ?auto_694075 ?auto_694081 ) ) ( not ( = ?auto_694072 ?auto_694081 ) ) ( not ( = ?auto_694074 ?auto_694081 ) ) ( TRUCK-AT ?auto_694080 ?auto_694076 ) ( SURFACE-AT ?auto_694074 ?auto_694076 ) ( CLEAR ?auto_694074 ) ( LIFTING ?auto_694079 ?auto_694075 ) ( IS-CRATE ?auto_694075 ) ( ON ?auto_694074 ?auto_694073 ) ( not ( = ?auto_694073 ?auto_694074 ) ) ( not ( = ?auto_694073 ?auto_694075 ) ) ( not ( = ?auto_694073 ?auto_694072 ) ) ( not ( = ?auto_694073 ?auto_694081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694074 ?auto_694075 ?auto_694072 )
      ( MAKE-3CRATE-VERIFY ?auto_694073 ?auto_694074 ?auto_694075 ?auto_694072 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_694101 - SURFACE
      ?auto_694102 - SURFACE
      ?auto_694103 - SURFACE
      ?auto_694100 - SURFACE
    )
    :vars
    (
      ?auto_694108 - HOIST
      ?auto_694104 - PLACE
      ?auto_694106 - PLACE
      ?auto_694109 - HOIST
      ?auto_694105 - SURFACE
      ?auto_694107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694108 ?auto_694104 ) ( IS-CRATE ?auto_694100 ) ( not ( = ?auto_694103 ?auto_694100 ) ) ( not ( = ?auto_694102 ?auto_694103 ) ) ( not ( = ?auto_694102 ?auto_694100 ) ) ( not ( = ?auto_694106 ?auto_694104 ) ) ( HOIST-AT ?auto_694109 ?auto_694106 ) ( not ( = ?auto_694108 ?auto_694109 ) ) ( AVAILABLE ?auto_694109 ) ( SURFACE-AT ?auto_694100 ?auto_694106 ) ( ON ?auto_694100 ?auto_694105 ) ( CLEAR ?auto_694100 ) ( not ( = ?auto_694103 ?auto_694105 ) ) ( not ( = ?auto_694100 ?auto_694105 ) ) ( not ( = ?auto_694102 ?auto_694105 ) ) ( TRUCK-AT ?auto_694107 ?auto_694104 ) ( SURFACE-AT ?auto_694102 ?auto_694104 ) ( CLEAR ?auto_694102 ) ( IS-CRATE ?auto_694103 ) ( AVAILABLE ?auto_694108 ) ( IN ?auto_694103 ?auto_694107 ) ( ON ?auto_694102 ?auto_694101 ) ( not ( = ?auto_694101 ?auto_694102 ) ) ( not ( = ?auto_694101 ?auto_694103 ) ) ( not ( = ?auto_694101 ?auto_694100 ) ) ( not ( = ?auto_694101 ?auto_694105 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694102 ?auto_694103 ?auto_694100 )
      ( MAKE-3CRATE-VERIFY ?auto_694101 ?auto_694102 ?auto_694103 ?auto_694100 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_694285 - SURFACE
      ?auto_694286 - SURFACE
    )
    :vars
    (
      ?auto_694291 - HOIST
      ?auto_694288 - PLACE
      ?auto_694289 - SURFACE
      ?auto_694290 - TRUCK
      ?auto_694287 - PLACE
      ?auto_694292 - HOIST
      ?auto_694293 - SURFACE
      ?auto_694294 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_694291 ?auto_694288 ) ( SURFACE-AT ?auto_694285 ?auto_694288 ) ( CLEAR ?auto_694285 ) ( IS-CRATE ?auto_694286 ) ( not ( = ?auto_694285 ?auto_694286 ) ) ( AVAILABLE ?auto_694291 ) ( ON ?auto_694285 ?auto_694289 ) ( not ( = ?auto_694289 ?auto_694285 ) ) ( not ( = ?auto_694289 ?auto_694286 ) ) ( TRUCK-AT ?auto_694290 ?auto_694287 ) ( not ( = ?auto_694287 ?auto_694288 ) ) ( HOIST-AT ?auto_694292 ?auto_694287 ) ( not ( = ?auto_694291 ?auto_694292 ) ) ( SURFACE-AT ?auto_694286 ?auto_694287 ) ( ON ?auto_694286 ?auto_694293 ) ( CLEAR ?auto_694286 ) ( not ( = ?auto_694285 ?auto_694293 ) ) ( not ( = ?auto_694286 ?auto_694293 ) ) ( not ( = ?auto_694289 ?auto_694293 ) ) ( LIFTING ?auto_694292 ?auto_694294 ) ( IS-CRATE ?auto_694294 ) ( not ( = ?auto_694285 ?auto_694294 ) ) ( not ( = ?auto_694286 ?auto_694294 ) ) ( not ( = ?auto_694289 ?auto_694294 ) ) ( not ( = ?auto_694293 ?auto_694294 ) ) )
    :subtasks
    ( ( !LOAD ?auto_694292 ?auto_694294 ?auto_694290 ?auto_694287 )
      ( MAKE-1CRATE ?auto_694285 ?auto_694286 )
      ( MAKE-1CRATE-VERIFY ?auto_694285 ?auto_694286 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694394 - SURFACE
      ?auto_694395 - SURFACE
      ?auto_694396 - SURFACE
      ?auto_694393 - SURFACE
      ?auto_694397 - SURFACE
    )
    :vars
    (
      ?auto_694398 - HOIST
      ?auto_694399 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_694398 ?auto_694399 ) ( SURFACE-AT ?auto_694393 ?auto_694399 ) ( CLEAR ?auto_694393 ) ( LIFTING ?auto_694398 ?auto_694397 ) ( IS-CRATE ?auto_694397 ) ( not ( = ?auto_694393 ?auto_694397 ) ) ( ON ?auto_694395 ?auto_694394 ) ( ON ?auto_694396 ?auto_694395 ) ( ON ?auto_694393 ?auto_694396 ) ( not ( = ?auto_694394 ?auto_694395 ) ) ( not ( = ?auto_694394 ?auto_694396 ) ) ( not ( = ?auto_694394 ?auto_694393 ) ) ( not ( = ?auto_694394 ?auto_694397 ) ) ( not ( = ?auto_694395 ?auto_694396 ) ) ( not ( = ?auto_694395 ?auto_694393 ) ) ( not ( = ?auto_694395 ?auto_694397 ) ) ( not ( = ?auto_694396 ?auto_694393 ) ) ( not ( = ?auto_694396 ?auto_694397 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_694393 ?auto_694397 )
      ( MAKE-4CRATE-VERIFY ?auto_694394 ?auto_694395 ?auto_694396 ?auto_694393 ?auto_694397 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694419 - SURFACE
      ?auto_694420 - SURFACE
      ?auto_694421 - SURFACE
      ?auto_694418 - SURFACE
      ?auto_694422 - SURFACE
    )
    :vars
    (
      ?auto_694423 - HOIST
      ?auto_694424 - PLACE
      ?auto_694425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694423 ?auto_694424 ) ( SURFACE-AT ?auto_694418 ?auto_694424 ) ( CLEAR ?auto_694418 ) ( IS-CRATE ?auto_694422 ) ( not ( = ?auto_694418 ?auto_694422 ) ) ( TRUCK-AT ?auto_694425 ?auto_694424 ) ( AVAILABLE ?auto_694423 ) ( IN ?auto_694422 ?auto_694425 ) ( ON ?auto_694418 ?auto_694421 ) ( not ( = ?auto_694421 ?auto_694418 ) ) ( not ( = ?auto_694421 ?auto_694422 ) ) ( ON ?auto_694420 ?auto_694419 ) ( ON ?auto_694421 ?auto_694420 ) ( not ( = ?auto_694419 ?auto_694420 ) ) ( not ( = ?auto_694419 ?auto_694421 ) ) ( not ( = ?auto_694419 ?auto_694418 ) ) ( not ( = ?auto_694419 ?auto_694422 ) ) ( not ( = ?auto_694420 ?auto_694421 ) ) ( not ( = ?auto_694420 ?auto_694418 ) ) ( not ( = ?auto_694420 ?auto_694422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694421 ?auto_694418 ?auto_694422 )
      ( MAKE-4CRATE-VERIFY ?auto_694419 ?auto_694420 ?auto_694421 ?auto_694418 ?auto_694422 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694449 - SURFACE
      ?auto_694450 - SURFACE
      ?auto_694451 - SURFACE
      ?auto_694448 - SURFACE
      ?auto_694452 - SURFACE
    )
    :vars
    (
      ?auto_694455 - HOIST
      ?auto_694456 - PLACE
      ?auto_694454 - TRUCK
      ?auto_694453 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_694455 ?auto_694456 ) ( SURFACE-AT ?auto_694448 ?auto_694456 ) ( CLEAR ?auto_694448 ) ( IS-CRATE ?auto_694452 ) ( not ( = ?auto_694448 ?auto_694452 ) ) ( AVAILABLE ?auto_694455 ) ( IN ?auto_694452 ?auto_694454 ) ( ON ?auto_694448 ?auto_694451 ) ( not ( = ?auto_694451 ?auto_694448 ) ) ( not ( = ?auto_694451 ?auto_694452 ) ) ( TRUCK-AT ?auto_694454 ?auto_694453 ) ( not ( = ?auto_694453 ?auto_694456 ) ) ( ON ?auto_694450 ?auto_694449 ) ( ON ?auto_694451 ?auto_694450 ) ( not ( = ?auto_694449 ?auto_694450 ) ) ( not ( = ?auto_694449 ?auto_694451 ) ) ( not ( = ?auto_694449 ?auto_694448 ) ) ( not ( = ?auto_694449 ?auto_694452 ) ) ( not ( = ?auto_694450 ?auto_694451 ) ) ( not ( = ?auto_694450 ?auto_694448 ) ) ( not ( = ?auto_694450 ?auto_694452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694451 ?auto_694448 ?auto_694452 )
      ( MAKE-4CRATE-VERIFY ?auto_694449 ?auto_694450 ?auto_694451 ?auto_694448 ?auto_694452 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694483 - SURFACE
      ?auto_694484 - SURFACE
      ?auto_694485 - SURFACE
      ?auto_694482 - SURFACE
      ?auto_694486 - SURFACE
    )
    :vars
    (
      ?auto_694490 - HOIST
      ?auto_694491 - PLACE
      ?auto_694487 - TRUCK
      ?auto_694489 - PLACE
      ?auto_694488 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_694490 ?auto_694491 ) ( SURFACE-AT ?auto_694482 ?auto_694491 ) ( CLEAR ?auto_694482 ) ( IS-CRATE ?auto_694486 ) ( not ( = ?auto_694482 ?auto_694486 ) ) ( AVAILABLE ?auto_694490 ) ( ON ?auto_694482 ?auto_694485 ) ( not ( = ?auto_694485 ?auto_694482 ) ) ( not ( = ?auto_694485 ?auto_694486 ) ) ( TRUCK-AT ?auto_694487 ?auto_694489 ) ( not ( = ?auto_694489 ?auto_694491 ) ) ( HOIST-AT ?auto_694488 ?auto_694489 ) ( LIFTING ?auto_694488 ?auto_694486 ) ( not ( = ?auto_694490 ?auto_694488 ) ) ( ON ?auto_694484 ?auto_694483 ) ( ON ?auto_694485 ?auto_694484 ) ( not ( = ?auto_694483 ?auto_694484 ) ) ( not ( = ?auto_694483 ?auto_694485 ) ) ( not ( = ?auto_694483 ?auto_694482 ) ) ( not ( = ?auto_694483 ?auto_694486 ) ) ( not ( = ?auto_694484 ?auto_694485 ) ) ( not ( = ?auto_694484 ?auto_694482 ) ) ( not ( = ?auto_694484 ?auto_694486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694485 ?auto_694482 ?auto_694486 )
      ( MAKE-4CRATE-VERIFY ?auto_694483 ?auto_694484 ?auto_694485 ?auto_694482 ?auto_694486 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694521 - SURFACE
      ?auto_694522 - SURFACE
      ?auto_694523 - SURFACE
      ?auto_694520 - SURFACE
      ?auto_694524 - SURFACE
    )
    :vars
    (
      ?auto_694529 - HOIST
      ?auto_694530 - PLACE
      ?auto_694526 - TRUCK
      ?auto_694525 - PLACE
      ?auto_694528 - HOIST
      ?auto_694527 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_694529 ?auto_694530 ) ( SURFACE-AT ?auto_694520 ?auto_694530 ) ( CLEAR ?auto_694520 ) ( IS-CRATE ?auto_694524 ) ( not ( = ?auto_694520 ?auto_694524 ) ) ( AVAILABLE ?auto_694529 ) ( ON ?auto_694520 ?auto_694523 ) ( not ( = ?auto_694523 ?auto_694520 ) ) ( not ( = ?auto_694523 ?auto_694524 ) ) ( TRUCK-AT ?auto_694526 ?auto_694525 ) ( not ( = ?auto_694525 ?auto_694530 ) ) ( HOIST-AT ?auto_694528 ?auto_694525 ) ( not ( = ?auto_694529 ?auto_694528 ) ) ( AVAILABLE ?auto_694528 ) ( SURFACE-AT ?auto_694524 ?auto_694525 ) ( ON ?auto_694524 ?auto_694527 ) ( CLEAR ?auto_694524 ) ( not ( = ?auto_694520 ?auto_694527 ) ) ( not ( = ?auto_694524 ?auto_694527 ) ) ( not ( = ?auto_694523 ?auto_694527 ) ) ( ON ?auto_694522 ?auto_694521 ) ( ON ?auto_694523 ?auto_694522 ) ( not ( = ?auto_694521 ?auto_694522 ) ) ( not ( = ?auto_694521 ?auto_694523 ) ) ( not ( = ?auto_694521 ?auto_694520 ) ) ( not ( = ?auto_694521 ?auto_694524 ) ) ( not ( = ?auto_694521 ?auto_694527 ) ) ( not ( = ?auto_694522 ?auto_694523 ) ) ( not ( = ?auto_694522 ?auto_694520 ) ) ( not ( = ?auto_694522 ?auto_694524 ) ) ( not ( = ?auto_694522 ?auto_694527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694523 ?auto_694520 ?auto_694524 )
      ( MAKE-4CRATE-VERIFY ?auto_694521 ?auto_694522 ?auto_694523 ?auto_694520 ?auto_694524 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694560 - SURFACE
      ?auto_694561 - SURFACE
      ?auto_694562 - SURFACE
      ?auto_694559 - SURFACE
      ?auto_694563 - SURFACE
    )
    :vars
    (
      ?auto_694564 - HOIST
      ?auto_694568 - PLACE
      ?auto_694566 - PLACE
      ?auto_694569 - HOIST
      ?auto_694567 - SURFACE
      ?auto_694565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694564 ?auto_694568 ) ( SURFACE-AT ?auto_694559 ?auto_694568 ) ( CLEAR ?auto_694559 ) ( IS-CRATE ?auto_694563 ) ( not ( = ?auto_694559 ?auto_694563 ) ) ( AVAILABLE ?auto_694564 ) ( ON ?auto_694559 ?auto_694562 ) ( not ( = ?auto_694562 ?auto_694559 ) ) ( not ( = ?auto_694562 ?auto_694563 ) ) ( not ( = ?auto_694566 ?auto_694568 ) ) ( HOIST-AT ?auto_694569 ?auto_694566 ) ( not ( = ?auto_694564 ?auto_694569 ) ) ( AVAILABLE ?auto_694569 ) ( SURFACE-AT ?auto_694563 ?auto_694566 ) ( ON ?auto_694563 ?auto_694567 ) ( CLEAR ?auto_694563 ) ( not ( = ?auto_694559 ?auto_694567 ) ) ( not ( = ?auto_694563 ?auto_694567 ) ) ( not ( = ?auto_694562 ?auto_694567 ) ) ( TRUCK-AT ?auto_694565 ?auto_694568 ) ( ON ?auto_694561 ?auto_694560 ) ( ON ?auto_694562 ?auto_694561 ) ( not ( = ?auto_694560 ?auto_694561 ) ) ( not ( = ?auto_694560 ?auto_694562 ) ) ( not ( = ?auto_694560 ?auto_694559 ) ) ( not ( = ?auto_694560 ?auto_694563 ) ) ( not ( = ?auto_694560 ?auto_694567 ) ) ( not ( = ?auto_694561 ?auto_694562 ) ) ( not ( = ?auto_694561 ?auto_694559 ) ) ( not ( = ?auto_694561 ?auto_694563 ) ) ( not ( = ?auto_694561 ?auto_694567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694562 ?auto_694559 ?auto_694563 )
      ( MAKE-4CRATE-VERIFY ?auto_694560 ?auto_694561 ?auto_694562 ?auto_694559 ?auto_694563 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694599 - SURFACE
      ?auto_694600 - SURFACE
      ?auto_694601 - SURFACE
      ?auto_694598 - SURFACE
      ?auto_694602 - SURFACE
    )
    :vars
    (
      ?auto_694606 - HOIST
      ?auto_694605 - PLACE
      ?auto_694604 - PLACE
      ?auto_694608 - HOIST
      ?auto_694607 - SURFACE
      ?auto_694603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694606 ?auto_694605 ) ( IS-CRATE ?auto_694602 ) ( not ( = ?auto_694598 ?auto_694602 ) ) ( not ( = ?auto_694601 ?auto_694598 ) ) ( not ( = ?auto_694601 ?auto_694602 ) ) ( not ( = ?auto_694604 ?auto_694605 ) ) ( HOIST-AT ?auto_694608 ?auto_694604 ) ( not ( = ?auto_694606 ?auto_694608 ) ) ( AVAILABLE ?auto_694608 ) ( SURFACE-AT ?auto_694602 ?auto_694604 ) ( ON ?auto_694602 ?auto_694607 ) ( CLEAR ?auto_694602 ) ( not ( = ?auto_694598 ?auto_694607 ) ) ( not ( = ?auto_694602 ?auto_694607 ) ) ( not ( = ?auto_694601 ?auto_694607 ) ) ( TRUCK-AT ?auto_694603 ?auto_694605 ) ( SURFACE-AT ?auto_694601 ?auto_694605 ) ( CLEAR ?auto_694601 ) ( LIFTING ?auto_694606 ?auto_694598 ) ( IS-CRATE ?auto_694598 ) ( ON ?auto_694600 ?auto_694599 ) ( ON ?auto_694601 ?auto_694600 ) ( not ( = ?auto_694599 ?auto_694600 ) ) ( not ( = ?auto_694599 ?auto_694601 ) ) ( not ( = ?auto_694599 ?auto_694598 ) ) ( not ( = ?auto_694599 ?auto_694602 ) ) ( not ( = ?auto_694599 ?auto_694607 ) ) ( not ( = ?auto_694600 ?auto_694601 ) ) ( not ( = ?auto_694600 ?auto_694598 ) ) ( not ( = ?auto_694600 ?auto_694602 ) ) ( not ( = ?auto_694600 ?auto_694607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694601 ?auto_694598 ?auto_694602 )
      ( MAKE-4CRATE-VERIFY ?auto_694599 ?auto_694600 ?auto_694601 ?auto_694598 ?auto_694602 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694638 - SURFACE
      ?auto_694639 - SURFACE
      ?auto_694640 - SURFACE
      ?auto_694637 - SURFACE
      ?auto_694641 - SURFACE
    )
    :vars
    (
      ?auto_694645 - HOIST
      ?auto_694647 - PLACE
      ?auto_694644 - PLACE
      ?auto_694642 - HOIST
      ?auto_694643 - SURFACE
      ?auto_694646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694645 ?auto_694647 ) ( IS-CRATE ?auto_694641 ) ( not ( = ?auto_694637 ?auto_694641 ) ) ( not ( = ?auto_694640 ?auto_694637 ) ) ( not ( = ?auto_694640 ?auto_694641 ) ) ( not ( = ?auto_694644 ?auto_694647 ) ) ( HOIST-AT ?auto_694642 ?auto_694644 ) ( not ( = ?auto_694645 ?auto_694642 ) ) ( AVAILABLE ?auto_694642 ) ( SURFACE-AT ?auto_694641 ?auto_694644 ) ( ON ?auto_694641 ?auto_694643 ) ( CLEAR ?auto_694641 ) ( not ( = ?auto_694637 ?auto_694643 ) ) ( not ( = ?auto_694641 ?auto_694643 ) ) ( not ( = ?auto_694640 ?auto_694643 ) ) ( TRUCK-AT ?auto_694646 ?auto_694647 ) ( SURFACE-AT ?auto_694640 ?auto_694647 ) ( CLEAR ?auto_694640 ) ( IS-CRATE ?auto_694637 ) ( AVAILABLE ?auto_694645 ) ( IN ?auto_694637 ?auto_694646 ) ( ON ?auto_694639 ?auto_694638 ) ( ON ?auto_694640 ?auto_694639 ) ( not ( = ?auto_694638 ?auto_694639 ) ) ( not ( = ?auto_694638 ?auto_694640 ) ) ( not ( = ?auto_694638 ?auto_694637 ) ) ( not ( = ?auto_694638 ?auto_694641 ) ) ( not ( = ?auto_694638 ?auto_694643 ) ) ( not ( = ?auto_694639 ?auto_694640 ) ) ( not ( = ?auto_694639 ?auto_694637 ) ) ( not ( = ?auto_694639 ?auto_694641 ) ) ( not ( = ?auto_694639 ?auto_694643 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694640 ?auto_694637 ?auto_694641 )
      ( MAKE-4CRATE-VERIFY ?auto_694638 ?auto_694639 ?auto_694640 ?auto_694637 ?auto_694641 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_695138 - SURFACE
      ?auto_695139 - SURFACE
    )
    :vars
    (
      ?auto_695141 - HOIST
      ?auto_695143 - PLACE
      ?auto_695142 - SURFACE
      ?auto_695140 - PLACE
      ?auto_695146 - HOIST
      ?auto_695144 - SURFACE
      ?auto_695145 - TRUCK
      ?auto_695147 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_695141 ?auto_695143 ) ( SURFACE-AT ?auto_695138 ?auto_695143 ) ( CLEAR ?auto_695138 ) ( IS-CRATE ?auto_695139 ) ( not ( = ?auto_695138 ?auto_695139 ) ) ( ON ?auto_695138 ?auto_695142 ) ( not ( = ?auto_695142 ?auto_695138 ) ) ( not ( = ?auto_695142 ?auto_695139 ) ) ( not ( = ?auto_695140 ?auto_695143 ) ) ( HOIST-AT ?auto_695146 ?auto_695140 ) ( not ( = ?auto_695141 ?auto_695146 ) ) ( AVAILABLE ?auto_695146 ) ( SURFACE-AT ?auto_695139 ?auto_695140 ) ( ON ?auto_695139 ?auto_695144 ) ( CLEAR ?auto_695139 ) ( not ( = ?auto_695138 ?auto_695144 ) ) ( not ( = ?auto_695139 ?auto_695144 ) ) ( not ( = ?auto_695142 ?auto_695144 ) ) ( TRUCK-AT ?auto_695145 ?auto_695143 ) ( LIFTING ?auto_695141 ?auto_695147 ) ( IS-CRATE ?auto_695147 ) ( not ( = ?auto_695138 ?auto_695147 ) ) ( not ( = ?auto_695139 ?auto_695147 ) ) ( not ( = ?auto_695142 ?auto_695147 ) ) ( not ( = ?auto_695144 ?auto_695147 ) ) )
    :subtasks
    ( ( !LOAD ?auto_695141 ?auto_695147 ?auto_695145 ?auto_695143 )
      ( MAKE-1CRATE ?auto_695138 ?auto_695139 )
      ( MAKE-1CRATE-VERIFY ?auto_695138 ?auto_695139 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695298 - SURFACE
      ?auto_695299 - SURFACE
      ?auto_695300 - SURFACE
      ?auto_695297 - SURFACE
      ?auto_695301 - SURFACE
      ?auto_695302 - SURFACE
    )
    :vars
    (
      ?auto_695304 - HOIST
      ?auto_695303 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_695304 ?auto_695303 ) ( SURFACE-AT ?auto_695301 ?auto_695303 ) ( CLEAR ?auto_695301 ) ( LIFTING ?auto_695304 ?auto_695302 ) ( IS-CRATE ?auto_695302 ) ( not ( = ?auto_695301 ?auto_695302 ) ) ( ON ?auto_695299 ?auto_695298 ) ( ON ?auto_695300 ?auto_695299 ) ( ON ?auto_695297 ?auto_695300 ) ( ON ?auto_695301 ?auto_695297 ) ( not ( = ?auto_695298 ?auto_695299 ) ) ( not ( = ?auto_695298 ?auto_695300 ) ) ( not ( = ?auto_695298 ?auto_695297 ) ) ( not ( = ?auto_695298 ?auto_695301 ) ) ( not ( = ?auto_695298 ?auto_695302 ) ) ( not ( = ?auto_695299 ?auto_695300 ) ) ( not ( = ?auto_695299 ?auto_695297 ) ) ( not ( = ?auto_695299 ?auto_695301 ) ) ( not ( = ?auto_695299 ?auto_695302 ) ) ( not ( = ?auto_695300 ?auto_695297 ) ) ( not ( = ?auto_695300 ?auto_695301 ) ) ( not ( = ?auto_695300 ?auto_695302 ) ) ( not ( = ?auto_695297 ?auto_695301 ) ) ( not ( = ?auto_695297 ?auto_695302 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_695301 ?auto_695302 )
      ( MAKE-5CRATE-VERIFY ?auto_695298 ?auto_695299 ?auto_695300 ?auto_695297 ?auto_695301 ?auto_695302 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695332 - SURFACE
      ?auto_695333 - SURFACE
      ?auto_695334 - SURFACE
      ?auto_695331 - SURFACE
      ?auto_695335 - SURFACE
      ?auto_695336 - SURFACE
    )
    :vars
    (
      ?auto_695339 - HOIST
      ?auto_695338 - PLACE
      ?auto_695337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_695339 ?auto_695338 ) ( SURFACE-AT ?auto_695335 ?auto_695338 ) ( CLEAR ?auto_695335 ) ( IS-CRATE ?auto_695336 ) ( not ( = ?auto_695335 ?auto_695336 ) ) ( TRUCK-AT ?auto_695337 ?auto_695338 ) ( AVAILABLE ?auto_695339 ) ( IN ?auto_695336 ?auto_695337 ) ( ON ?auto_695335 ?auto_695331 ) ( not ( = ?auto_695331 ?auto_695335 ) ) ( not ( = ?auto_695331 ?auto_695336 ) ) ( ON ?auto_695333 ?auto_695332 ) ( ON ?auto_695334 ?auto_695333 ) ( ON ?auto_695331 ?auto_695334 ) ( not ( = ?auto_695332 ?auto_695333 ) ) ( not ( = ?auto_695332 ?auto_695334 ) ) ( not ( = ?auto_695332 ?auto_695331 ) ) ( not ( = ?auto_695332 ?auto_695335 ) ) ( not ( = ?auto_695332 ?auto_695336 ) ) ( not ( = ?auto_695333 ?auto_695334 ) ) ( not ( = ?auto_695333 ?auto_695331 ) ) ( not ( = ?auto_695333 ?auto_695335 ) ) ( not ( = ?auto_695333 ?auto_695336 ) ) ( not ( = ?auto_695334 ?auto_695331 ) ) ( not ( = ?auto_695334 ?auto_695335 ) ) ( not ( = ?auto_695334 ?auto_695336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695331 ?auto_695335 ?auto_695336 )
      ( MAKE-5CRATE-VERIFY ?auto_695332 ?auto_695333 ?auto_695334 ?auto_695331 ?auto_695335 ?auto_695336 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695372 - SURFACE
      ?auto_695373 - SURFACE
      ?auto_695374 - SURFACE
      ?auto_695371 - SURFACE
      ?auto_695375 - SURFACE
      ?auto_695376 - SURFACE
    )
    :vars
    (
      ?auto_695377 - HOIST
      ?auto_695380 - PLACE
      ?auto_695378 - TRUCK
      ?auto_695379 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_695377 ?auto_695380 ) ( SURFACE-AT ?auto_695375 ?auto_695380 ) ( CLEAR ?auto_695375 ) ( IS-CRATE ?auto_695376 ) ( not ( = ?auto_695375 ?auto_695376 ) ) ( AVAILABLE ?auto_695377 ) ( IN ?auto_695376 ?auto_695378 ) ( ON ?auto_695375 ?auto_695371 ) ( not ( = ?auto_695371 ?auto_695375 ) ) ( not ( = ?auto_695371 ?auto_695376 ) ) ( TRUCK-AT ?auto_695378 ?auto_695379 ) ( not ( = ?auto_695379 ?auto_695380 ) ) ( ON ?auto_695373 ?auto_695372 ) ( ON ?auto_695374 ?auto_695373 ) ( ON ?auto_695371 ?auto_695374 ) ( not ( = ?auto_695372 ?auto_695373 ) ) ( not ( = ?auto_695372 ?auto_695374 ) ) ( not ( = ?auto_695372 ?auto_695371 ) ) ( not ( = ?auto_695372 ?auto_695375 ) ) ( not ( = ?auto_695372 ?auto_695376 ) ) ( not ( = ?auto_695373 ?auto_695374 ) ) ( not ( = ?auto_695373 ?auto_695371 ) ) ( not ( = ?auto_695373 ?auto_695375 ) ) ( not ( = ?auto_695373 ?auto_695376 ) ) ( not ( = ?auto_695374 ?auto_695371 ) ) ( not ( = ?auto_695374 ?auto_695375 ) ) ( not ( = ?auto_695374 ?auto_695376 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695371 ?auto_695375 ?auto_695376 )
      ( MAKE-5CRATE-VERIFY ?auto_695372 ?auto_695373 ?auto_695374 ?auto_695371 ?auto_695375 ?auto_695376 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695417 - SURFACE
      ?auto_695418 - SURFACE
      ?auto_695419 - SURFACE
      ?auto_695416 - SURFACE
      ?auto_695420 - SURFACE
      ?auto_695421 - SURFACE
    )
    :vars
    (
      ?auto_695424 - HOIST
      ?auto_695423 - PLACE
      ?auto_695426 - TRUCK
      ?auto_695422 - PLACE
      ?auto_695425 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_695424 ?auto_695423 ) ( SURFACE-AT ?auto_695420 ?auto_695423 ) ( CLEAR ?auto_695420 ) ( IS-CRATE ?auto_695421 ) ( not ( = ?auto_695420 ?auto_695421 ) ) ( AVAILABLE ?auto_695424 ) ( ON ?auto_695420 ?auto_695416 ) ( not ( = ?auto_695416 ?auto_695420 ) ) ( not ( = ?auto_695416 ?auto_695421 ) ) ( TRUCK-AT ?auto_695426 ?auto_695422 ) ( not ( = ?auto_695422 ?auto_695423 ) ) ( HOIST-AT ?auto_695425 ?auto_695422 ) ( LIFTING ?auto_695425 ?auto_695421 ) ( not ( = ?auto_695424 ?auto_695425 ) ) ( ON ?auto_695418 ?auto_695417 ) ( ON ?auto_695419 ?auto_695418 ) ( ON ?auto_695416 ?auto_695419 ) ( not ( = ?auto_695417 ?auto_695418 ) ) ( not ( = ?auto_695417 ?auto_695419 ) ) ( not ( = ?auto_695417 ?auto_695416 ) ) ( not ( = ?auto_695417 ?auto_695420 ) ) ( not ( = ?auto_695417 ?auto_695421 ) ) ( not ( = ?auto_695418 ?auto_695419 ) ) ( not ( = ?auto_695418 ?auto_695416 ) ) ( not ( = ?auto_695418 ?auto_695420 ) ) ( not ( = ?auto_695418 ?auto_695421 ) ) ( not ( = ?auto_695419 ?auto_695416 ) ) ( not ( = ?auto_695419 ?auto_695420 ) ) ( not ( = ?auto_695419 ?auto_695421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695416 ?auto_695420 ?auto_695421 )
      ( MAKE-5CRATE-VERIFY ?auto_695417 ?auto_695418 ?auto_695419 ?auto_695416 ?auto_695420 ?auto_695421 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695467 - SURFACE
      ?auto_695468 - SURFACE
      ?auto_695469 - SURFACE
      ?auto_695466 - SURFACE
      ?auto_695470 - SURFACE
      ?auto_695471 - SURFACE
    )
    :vars
    (
      ?auto_695476 - HOIST
      ?auto_695475 - PLACE
      ?auto_695472 - TRUCK
      ?auto_695474 - PLACE
      ?auto_695477 - HOIST
      ?auto_695473 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_695476 ?auto_695475 ) ( SURFACE-AT ?auto_695470 ?auto_695475 ) ( CLEAR ?auto_695470 ) ( IS-CRATE ?auto_695471 ) ( not ( = ?auto_695470 ?auto_695471 ) ) ( AVAILABLE ?auto_695476 ) ( ON ?auto_695470 ?auto_695466 ) ( not ( = ?auto_695466 ?auto_695470 ) ) ( not ( = ?auto_695466 ?auto_695471 ) ) ( TRUCK-AT ?auto_695472 ?auto_695474 ) ( not ( = ?auto_695474 ?auto_695475 ) ) ( HOIST-AT ?auto_695477 ?auto_695474 ) ( not ( = ?auto_695476 ?auto_695477 ) ) ( AVAILABLE ?auto_695477 ) ( SURFACE-AT ?auto_695471 ?auto_695474 ) ( ON ?auto_695471 ?auto_695473 ) ( CLEAR ?auto_695471 ) ( not ( = ?auto_695470 ?auto_695473 ) ) ( not ( = ?auto_695471 ?auto_695473 ) ) ( not ( = ?auto_695466 ?auto_695473 ) ) ( ON ?auto_695468 ?auto_695467 ) ( ON ?auto_695469 ?auto_695468 ) ( ON ?auto_695466 ?auto_695469 ) ( not ( = ?auto_695467 ?auto_695468 ) ) ( not ( = ?auto_695467 ?auto_695469 ) ) ( not ( = ?auto_695467 ?auto_695466 ) ) ( not ( = ?auto_695467 ?auto_695470 ) ) ( not ( = ?auto_695467 ?auto_695471 ) ) ( not ( = ?auto_695467 ?auto_695473 ) ) ( not ( = ?auto_695468 ?auto_695469 ) ) ( not ( = ?auto_695468 ?auto_695466 ) ) ( not ( = ?auto_695468 ?auto_695470 ) ) ( not ( = ?auto_695468 ?auto_695471 ) ) ( not ( = ?auto_695468 ?auto_695473 ) ) ( not ( = ?auto_695469 ?auto_695466 ) ) ( not ( = ?auto_695469 ?auto_695470 ) ) ( not ( = ?auto_695469 ?auto_695471 ) ) ( not ( = ?auto_695469 ?auto_695473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695466 ?auto_695470 ?auto_695471 )
      ( MAKE-5CRATE-VERIFY ?auto_695467 ?auto_695468 ?auto_695469 ?auto_695466 ?auto_695470 ?auto_695471 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695518 - SURFACE
      ?auto_695519 - SURFACE
      ?auto_695520 - SURFACE
      ?auto_695517 - SURFACE
      ?auto_695521 - SURFACE
      ?auto_695522 - SURFACE
    )
    :vars
    (
      ?auto_695528 - HOIST
      ?auto_695525 - PLACE
      ?auto_695526 - PLACE
      ?auto_695523 - HOIST
      ?auto_695524 - SURFACE
      ?auto_695527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_695528 ?auto_695525 ) ( SURFACE-AT ?auto_695521 ?auto_695525 ) ( CLEAR ?auto_695521 ) ( IS-CRATE ?auto_695522 ) ( not ( = ?auto_695521 ?auto_695522 ) ) ( AVAILABLE ?auto_695528 ) ( ON ?auto_695521 ?auto_695517 ) ( not ( = ?auto_695517 ?auto_695521 ) ) ( not ( = ?auto_695517 ?auto_695522 ) ) ( not ( = ?auto_695526 ?auto_695525 ) ) ( HOIST-AT ?auto_695523 ?auto_695526 ) ( not ( = ?auto_695528 ?auto_695523 ) ) ( AVAILABLE ?auto_695523 ) ( SURFACE-AT ?auto_695522 ?auto_695526 ) ( ON ?auto_695522 ?auto_695524 ) ( CLEAR ?auto_695522 ) ( not ( = ?auto_695521 ?auto_695524 ) ) ( not ( = ?auto_695522 ?auto_695524 ) ) ( not ( = ?auto_695517 ?auto_695524 ) ) ( TRUCK-AT ?auto_695527 ?auto_695525 ) ( ON ?auto_695519 ?auto_695518 ) ( ON ?auto_695520 ?auto_695519 ) ( ON ?auto_695517 ?auto_695520 ) ( not ( = ?auto_695518 ?auto_695519 ) ) ( not ( = ?auto_695518 ?auto_695520 ) ) ( not ( = ?auto_695518 ?auto_695517 ) ) ( not ( = ?auto_695518 ?auto_695521 ) ) ( not ( = ?auto_695518 ?auto_695522 ) ) ( not ( = ?auto_695518 ?auto_695524 ) ) ( not ( = ?auto_695519 ?auto_695520 ) ) ( not ( = ?auto_695519 ?auto_695517 ) ) ( not ( = ?auto_695519 ?auto_695521 ) ) ( not ( = ?auto_695519 ?auto_695522 ) ) ( not ( = ?auto_695519 ?auto_695524 ) ) ( not ( = ?auto_695520 ?auto_695517 ) ) ( not ( = ?auto_695520 ?auto_695521 ) ) ( not ( = ?auto_695520 ?auto_695522 ) ) ( not ( = ?auto_695520 ?auto_695524 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695517 ?auto_695521 ?auto_695522 )
      ( MAKE-5CRATE-VERIFY ?auto_695518 ?auto_695519 ?auto_695520 ?auto_695517 ?auto_695521 ?auto_695522 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695569 - SURFACE
      ?auto_695570 - SURFACE
      ?auto_695571 - SURFACE
      ?auto_695568 - SURFACE
      ?auto_695572 - SURFACE
      ?auto_695573 - SURFACE
    )
    :vars
    (
      ?auto_695574 - HOIST
      ?auto_695579 - PLACE
      ?auto_695578 - PLACE
      ?auto_695575 - HOIST
      ?auto_695577 - SURFACE
      ?auto_695576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_695574 ?auto_695579 ) ( IS-CRATE ?auto_695573 ) ( not ( = ?auto_695572 ?auto_695573 ) ) ( not ( = ?auto_695568 ?auto_695572 ) ) ( not ( = ?auto_695568 ?auto_695573 ) ) ( not ( = ?auto_695578 ?auto_695579 ) ) ( HOIST-AT ?auto_695575 ?auto_695578 ) ( not ( = ?auto_695574 ?auto_695575 ) ) ( AVAILABLE ?auto_695575 ) ( SURFACE-AT ?auto_695573 ?auto_695578 ) ( ON ?auto_695573 ?auto_695577 ) ( CLEAR ?auto_695573 ) ( not ( = ?auto_695572 ?auto_695577 ) ) ( not ( = ?auto_695573 ?auto_695577 ) ) ( not ( = ?auto_695568 ?auto_695577 ) ) ( TRUCK-AT ?auto_695576 ?auto_695579 ) ( SURFACE-AT ?auto_695568 ?auto_695579 ) ( CLEAR ?auto_695568 ) ( LIFTING ?auto_695574 ?auto_695572 ) ( IS-CRATE ?auto_695572 ) ( ON ?auto_695570 ?auto_695569 ) ( ON ?auto_695571 ?auto_695570 ) ( ON ?auto_695568 ?auto_695571 ) ( not ( = ?auto_695569 ?auto_695570 ) ) ( not ( = ?auto_695569 ?auto_695571 ) ) ( not ( = ?auto_695569 ?auto_695568 ) ) ( not ( = ?auto_695569 ?auto_695572 ) ) ( not ( = ?auto_695569 ?auto_695573 ) ) ( not ( = ?auto_695569 ?auto_695577 ) ) ( not ( = ?auto_695570 ?auto_695571 ) ) ( not ( = ?auto_695570 ?auto_695568 ) ) ( not ( = ?auto_695570 ?auto_695572 ) ) ( not ( = ?auto_695570 ?auto_695573 ) ) ( not ( = ?auto_695570 ?auto_695577 ) ) ( not ( = ?auto_695571 ?auto_695568 ) ) ( not ( = ?auto_695571 ?auto_695572 ) ) ( not ( = ?auto_695571 ?auto_695573 ) ) ( not ( = ?auto_695571 ?auto_695577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695568 ?auto_695572 ?auto_695573 )
      ( MAKE-5CRATE-VERIFY ?auto_695569 ?auto_695570 ?auto_695571 ?auto_695568 ?auto_695572 ?auto_695573 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695620 - SURFACE
      ?auto_695621 - SURFACE
      ?auto_695622 - SURFACE
      ?auto_695619 - SURFACE
      ?auto_695623 - SURFACE
      ?auto_695624 - SURFACE
    )
    :vars
    (
      ?auto_695627 - HOIST
      ?auto_695628 - PLACE
      ?auto_695625 - PLACE
      ?auto_695629 - HOIST
      ?auto_695626 - SURFACE
      ?auto_695630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_695627 ?auto_695628 ) ( IS-CRATE ?auto_695624 ) ( not ( = ?auto_695623 ?auto_695624 ) ) ( not ( = ?auto_695619 ?auto_695623 ) ) ( not ( = ?auto_695619 ?auto_695624 ) ) ( not ( = ?auto_695625 ?auto_695628 ) ) ( HOIST-AT ?auto_695629 ?auto_695625 ) ( not ( = ?auto_695627 ?auto_695629 ) ) ( AVAILABLE ?auto_695629 ) ( SURFACE-AT ?auto_695624 ?auto_695625 ) ( ON ?auto_695624 ?auto_695626 ) ( CLEAR ?auto_695624 ) ( not ( = ?auto_695623 ?auto_695626 ) ) ( not ( = ?auto_695624 ?auto_695626 ) ) ( not ( = ?auto_695619 ?auto_695626 ) ) ( TRUCK-AT ?auto_695630 ?auto_695628 ) ( SURFACE-AT ?auto_695619 ?auto_695628 ) ( CLEAR ?auto_695619 ) ( IS-CRATE ?auto_695623 ) ( AVAILABLE ?auto_695627 ) ( IN ?auto_695623 ?auto_695630 ) ( ON ?auto_695621 ?auto_695620 ) ( ON ?auto_695622 ?auto_695621 ) ( ON ?auto_695619 ?auto_695622 ) ( not ( = ?auto_695620 ?auto_695621 ) ) ( not ( = ?auto_695620 ?auto_695622 ) ) ( not ( = ?auto_695620 ?auto_695619 ) ) ( not ( = ?auto_695620 ?auto_695623 ) ) ( not ( = ?auto_695620 ?auto_695624 ) ) ( not ( = ?auto_695620 ?auto_695626 ) ) ( not ( = ?auto_695621 ?auto_695622 ) ) ( not ( = ?auto_695621 ?auto_695619 ) ) ( not ( = ?auto_695621 ?auto_695623 ) ) ( not ( = ?auto_695621 ?auto_695624 ) ) ( not ( = ?auto_695621 ?auto_695626 ) ) ( not ( = ?auto_695622 ?auto_695619 ) ) ( not ( = ?auto_695622 ?auto_695623 ) ) ( not ( = ?auto_695622 ?auto_695624 ) ) ( not ( = ?auto_695622 ?auto_695626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695619 ?auto_695623 ?auto_695624 )
      ( MAKE-5CRATE-VERIFY ?auto_695620 ?auto_695621 ?auto_695622 ?auto_695619 ?auto_695623 ?auto_695624 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_696829 - SURFACE
      ?auto_696830 - SURFACE
      ?auto_696831 - SURFACE
      ?auto_696828 - SURFACE
      ?auto_696832 - SURFACE
      ?auto_696834 - SURFACE
      ?auto_696833 - SURFACE
    )
    :vars
    (
      ?auto_696835 - HOIST
      ?auto_696836 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_696835 ?auto_696836 ) ( SURFACE-AT ?auto_696834 ?auto_696836 ) ( CLEAR ?auto_696834 ) ( LIFTING ?auto_696835 ?auto_696833 ) ( IS-CRATE ?auto_696833 ) ( not ( = ?auto_696834 ?auto_696833 ) ) ( ON ?auto_696830 ?auto_696829 ) ( ON ?auto_696831 ?auto_696830 ) ( ON ?auto_696828 ?auto_696831 ) ( ON ?auto_696832 ?auto_696828 ) ( ON ?auto_696834 ?auto_696832 ) ( not ( = ?auto_696829 ?auto_696830 ) ) ( not ( = ?auto_696829 ?auto_696831 ) ) ( not ( = ?auto_696829 ?auto_696828 ) ) ( not ( = ?auto_696829 ?auto_696832 ) ) ( not ( = ?auto_696829 ?auto_696834 ) ) ( not ( = ?auto_696829 ?auto_696833 ) ) ( not ( = ?auto_696830 ?auto_696831 ) ) ( not ( = ?auto_696830 ?auto_696828 ) ) ( not ( = ?auto_696830 ?auto_696832 ) ) ( not ( = ?auto_696830 ?auto_696834 ) ) ( not ( = ?auto_696830 ?auto_696833 ) ) ( not ( = ?auto_696831 ?auto_696828 ) ) ( not ( = ?auto_696831 ?auto_696832 ) ) ( not ( = ?auto_696831 ?auto_696834 ) ) ( not ( = ?auto_696831 ?auto_696833 ) ) ( not ( = ?auto_696828 ?auto_696832 ) ) ( not ( = ?auto_696828 ?auto_696834 ) ) ( not ( = ?auto_696828 ?auto_696833 ) ) ( not ( = ?auto_696832 ?auto_696834 ) ) ( not ( = ?auto_696832 ?auto_696833 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_696834 ?auto_696833 )
      ( MAKE-6CRATE-VERIFY ?auto_696829 ?auto_696830 ?auto_696831 ?auto_696828 ?auto_696832 ?auto_696834 ?auto_696833 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_696873 - SURFACE
      ?auto_696874 - SURFACE
      ?auto_696875 - SURFACE
      ?auto_696872 - SURFACE
      ?auto_696876 - SURFACE
      ?auto_696878 - SURFACE
      ?auto_696877 - SURFACE
    )
    :vars
    (
      ?auto_696881 - HOIST
      ?auto_696880 - PLACE
      ?auto_696879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_696881 ?auto_696880 ) ( SURFACE-AT ?auto_696878 ?auto_696880 ) ( CLEAR ?auto_696878 ) ( IS-CRATE ?auto_696877 ) ( not ( = ?auto_696878 ?auto_696877 ) ) ( TRUCK-AT ?auto_696879 ?auto_696880 ) ( AVAILABLE ?auto_696881 ) ( IN ?auto_696877 ?auto_696879 ) ( ON ?auto_696878 ?auto_696876 ) ( not ( = ?auto_696876 ?auto_696878 ) ) ( not ( = ?auto_696876 ?auto_696877 ) ) ( ON ?auto_696874 ?auto_696873 ) ( ON ?auto_696875 ?auto_696874 ) ( ON ?auto_696872 ?auto_696875 ) ( ON ?auto_696876 ?auto_696872 ) ( not ( = ?auto_696873 ?auto_696874 ) ) ( not ( = ?auto_696873 ?auto_696875 ) ) ( not ( = ?auto_696873 ?auto_696872 ) ) ( not ( = ?auto_696873 ?auto_696876 ) ) ( not ( = ?auto_696873 ?auto_696878 ) ) ( not ( = ?auto_696873 ?auto_696877 ) ) ( not ( = ?auto_696874 ?auto_696875 ) ) ( not ( = ?auto_696874 ?auto_696872 ) ) ( not ( = ?auto_696874 ?auto_696876 ) ) ( not ( = ?auto_696874 ?auto_696878 ) ) ( not ( = ?auto_696874 ?auto_696877 ) ) ( not ( = ?auto_696875 ?auto_696872 ) ) ( not ( = ?auto_696875 ?auto_696876 ) ) ( not ( = ?auto_696875 ?auto_696878 ) ) ( not ( = ?auto_696875 ?auto_696877 ) ) ( not ( = ?auto_696872 ?auto_696876 ) ) ( not ( = ?auto_696872 ?auto_696878 ) ) ( not ( = ?auto_696872 ?auto_696877 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_696876 ?auto_696878 ?auto_696877 )
      ( MAKE-6CRATE-VERIFY ?auto_696873 ?auto_696874 ?auto_696875 ?auto_696872 ?auto_696876 ?auto_696878 ?auto_696877 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_696924 - SURFACE
      ?auto_696925 - SURFACE
      ?auto_696926 - SURFACE
      ?auto_696923 - SURFACE
      ?auto_696927 - SURFACE
      ?auto_696929 - SURFACE
      ?auto_696928 - SURFACE
    )
    :vars
    (
      ?auto_696933 - HOIST
      ?auto_696931 - PLACE
      ?auto_696930 - TRUCK
      ?auto_696932 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_696933 ?auto_696931 ) ( SURFACE-AT ?auto_696929 ?auto_696931 ) ( CLEAR ?auto_696929 ) ( IS-CRATE ?auto_696928 ) ( not ( = ?auto_696929 ?auto_696928 ) ) ( AVAILABLE ?auto_696933 ) ( IN ?auto_696928 ?auto_696930 ) ( ON ?auto_696929 ?auto_696927 ) ( not ( = ?auto_696927 ?auto_696929 ) ) ( not ( = ?auto_696927 ?auto_696928 ) ) ( TRUCK-AT ?auto_696930 ?auto_696932 ) ( not ( = ?auto_696932 ?auto_696931 ) ) ( ON ?auto_696925 ?auto_696924 ) ( ON ?auto_696926 ?auto_696925 ) ( ON ?auto_696923 ?auto_696926 ) ( ON ?auto_696927 ?auto_696923 ) ( not ( = ?auto_696924 ?auto_696925 ) ) ( not ( = ?auto_696924 ?auto_696926 ) ) ( not ( = ?auto_696924 ?auto_696923 ) ) ( not ( = ?auto_696924 ?auto_696927 ) ) ( not ( = ?auto_696924 ?auto_696929 ) ) ( not ( = ?auto_696924 ?auto_696928 ) ) ( not ( = ?auto_696925 ?auto_696926 ) ) ( not ( = ?auto_696925 ?auto_696923 ) ) ( not ( = ?auto_696925 ?auto_696927 ) ) ( not ( = ?auto_696925 ?auto_696929 ) ) ( not ( = ?auto_696925 ?auto_696928 ) ) ( not ( = ?auto_696926 ?auto_696923 ) ) ( not ( = ?auto_696926 ?auto_696927 ) ) ( not ( = ?auto_696926 ?auto_696929 ) ) ( not ( = ?auto_696926 ?auto_696928 ) ) ( not ( = ?auto_696923 ?auto_696927 ) ) ( not ( = ?auto_696923 ?auto_696929 ) ) ( not ( = ?auto_696923 ?auto_696928 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_696927 ?auto_696929 ?auto_696928 )
      ( MAKE-6CRATE-VERIFY ?auto_696924 ?auto_696925 ?auto_696926 ?auto_696923 ?auto_696927 ?auto_696929 ?auto_696928 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_696981 - SURFACE
      ?auto_696982 - SURFACE
      ?auto_696983 - SURFACE
      ?auto_696980 - SURFACE
      ?auto_696984 - SURFACE
      ?auto_696986 - SURFACE
      ?auto_696985 - SURFACE
    )
    :vars
    (
      ?auto_696988 - HOIST
      ?auto_696990 - PLACE
      ?auto_696987 - TRUCK
      ?auto_696989 - PLACE
      ?auto_696991 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_696988 ?auto_696990 ) ( SURFACE-AT ?auto_696986 ?auto_696990 ) ( CLEAR ?auto_696986 ) ( IS-CRATE ?auto_696985 ) ( not ( = ?auto_696986 ?auto_696985 ) ) ( AVAILABLE ?auto_696988 ) ( ON ?auto_696986 ?auto_696984 ) ( not ( = ?auto_696984 ?auto_696986 ) ) ( not ( = ?auto_696984 ?auto_696985 ) ) ( TRUCK-AT ?auto_696987 ?auto_696989 ) ( not ( = ?auto_696989 ?auto_696990 ) ) ( HOIST-AT ?auto_696991 ?auto_696989 ) ( LIFTING ?auto_696991 ?auto_696985 ) ( not ( = ?auto_696988 ?auto_696991 ) ) ( ON ?auto_696982 ?auto_696981 ) ( ON ?auto_696983 ?auto_696982 ) ( ON ?auto_696980 ?auto_696983 ) ( ON ?auto_696984 ?auto_696980 ) ( not ( = ?auto_696981 ?auto_696982 ) ) ( not ( = ?auto_696981 ?auto_696983 ) ) ( not ( = ?auto_696981 ?auto_696980 ) ) ( not ( = ?auto_696981 ?auto_696984 ) ) ( not ( = ?auto_696981 ?auto_696986 ) ) ( not ( = ?auto_696981 ?auto_696985 ) ) ( not ( = ?auto_696982 ?auto_696983 ) ) ( not ( = ?auto_696982 ?auto_696980 ) ) ( not ( = ?auto_696982 ?auto_696984 ) ) ( not ( = ?auto_696982 ?auto_696986 ) ) ( not ( = ?auto_696982 ?auto_696985 ) ) ( not ( = ?auto_696983 ?auto_696980 ) ) ( not ( = ?auto_696983 ?auto_696984 ) ) ( not ( = ?auto_696983 ?auto_696986 ) ) ( not ( = ?auto_696983 ?auto_696985 ) ) ( not ( = ?auto_696980 ?auto_696984 ) ) ( not ( = ?auto_696980 ?auto_696986 ) ) ( not ( = ?auto_696980 ?auto_696985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_696984 ?auto_696986 ?auto_696985 )
      ( MAKE-6CRATE-VERIFY ?auto_696981 ?auto_696982 ?auto_696983 ?auto_696980 ?auto_696984 ?auto_696986 ?auto_696985 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_697044 - SURFACE
      ?auto_697045 - SURFACE
      ?auto_697046 - SURFACE
      ?auto_697043 - SURFACE
      ?auto_697047 - SURFACE
      ?auto_697049 - SURFACE
      ?auto_697048 - SURFACE
    )
    :vars
    (
      ?auto_697055 - HOIST
      ?auto_697053 - PLACE
      ?auto_697050 - TRUCK
      ?auto_697052 - PLACE
      ?auto_697054 - HOIST
      ?auto_697051 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_697055 ?auto_697053 ) ( SURFACE-AT ?auto_697049 ?auto_697053 ) ( CLEAR ?auto_697049 ) ( IS-CRATE ?auto_697048 ) ( not ( = ?auto_697049 ?auto_697048 ) ) ( AVAILABLE ?auto_697055 ) ( ON ?auto_697049 ?auto_697047 ) ( not ( = ?auto_697047 ?auto_697049 ) ) ( not ( = ?auto_697047 ?auto_697048 ) ) ( TRUCK-AT ?auto_697050 ?auto_697052 ) ( not ( = ?auto_697052 ?auto_697053 ) ) ( HOIST-AT ?auto_697054 ?auto_697052 ) ( not ( = ?auto_697055 ?auto_697054 ) ) ( AVAILABLE ?auto_697054 ) ( SURFACE-AT ?auto_697048 ?auto_697052 ) ( ON ?auto_697048 ?auto_697051 ) ( CLEAR ?auto_697048 ) ( not ( = ?auto_697049 ?auto_697051 ) ) ( not ( = ?auto_697048 ?auto_697051 ) ) ( not ( = ?auto_697047 ?auto_697051 ) ) ( ON ?auto_697045 ?auto_697044 ) ( ON ?auto_697046 ?auto_697045 ) ( ON ?auto_697043 ?auto_697046 ) ( ON ?auto_697047 ?auto_697043 ) ( not ( = ?auto_697044 ?auto_697045 ) ) ( not ( = ?auto_697044 ?auto_697046 ) ) ( not ( = ?auto_697044 ?auto_697043 ) ) ( not ( = ?auto_697044 ?auto_697047 ) ) ( not ( = ?auto_697044 ?auto_697049 ) ) ( not ( = ?auto_697044 ?auto_697048 ) ) ( not ( = ?auto_697044 ?auto_697051 ) ) ( not ( = ?auto_697045 ?auto_697046 ) ) ( not ( = ?auto_697045 ?auto_697043 ) ) ( not ( = ?auto_697045 ?auto_697047 ) ) ( not ( = ?auto_697045 ?auto_697049 ) ) ( not ( = ?auto_697045 ?auto_697048 ) ) ( not ( = ?auto_697045 ?auto_697051 ) ) ( not ( = ?auto_697046 ?auto_697043 ) ) ( not ( = ?auto_697046 ?auto_697047 ) ) ( not ( = ?auto_697046 ?auto_697049 ) ) ( not ( = ?auto_697046 ?auto_697048 ) ) ( not ( = ?auto_697046 ?auto_697051 ) ) ( not ( = ?auto_697043 ?auto_697047 ) ) ( not ( = ?auto_697043 ?auto_697049 ) ) ( not ( = ?auto_697043 ?auto_697048 ) ) ( not ( = ?auto_697043 ?auto_697051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_697047 ?auto_697049 ?auto_697048 )
      ( MAKE-6CRATE-VERIFY ?auto_697044 ?auto_697045 ?auto_697046 ?auto_697043 ?auto_697047 ?auto_697049 ?auto_697048 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_697108 - SURFACE
      ?auto_697109 - SURFACE
      ?auto_697110 - SURFACE
      ?auto_697107 - SURFACE
      ?auto_697111 - SURFACE
      ?auto_697113 - SURFACE
      ?auto_697112 - SURFACE
    )
    :vars
    (
      ?auto_697118 - HOIST
      ?auto_697116 - PLACE
      ?auto_697114 - PLACE
      ?auto_697117 - HOIST
      ?auto_697115 - SURFACE
      ?auto_697119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_697118 ?auto_697116 ) ( SURFACE-AT ?auto_697113 ?auto_697116 ) ( CLEAR ?auto_697113 ) ( IS-CRATE ?auto_697112 ) ( not ( = ?auto_697113 ?auto_697112 ) ) ( AVAILABLE ?auto_697118 ) ( ON ?auto_697113 ?auto_697111 ) ( not ( = ?auto_697111 ?auto_697113 ) ) ( not ( = ?auto_697111 ?auto_697112 ) ) ( not ( = ?auto_697114 ?auto_697116 ) ) ( HOIST-AT ?auto_697117 ?auto_697114 ) ( not ( = ?auto_697118 ?auto_697117 ) ) ( AVAILABLE ?auto_697117 ) ( SURFACE-AT ?auto_697112 ?auto_697114 ) ( ON ?auto_697112 ?auto_697115 ) ( CLEAR ?auto_697112 ) ( not ( = ?auto_697113 ?auto_697115 ) ) ( not ( = ?auto_697112 ?auto_697115 ) ) ( not ( = ?auto_697111 ?auto_697115 ) ) ( TRUCK-AT ?auto_697119 ?auto_697116 ) ( ON ?auto_697109 ?auto_697108 ) ( ON ?auto_697110 ?auto_697109 ) ( ON ?auto_697107 ?auto_697110 ) ( ON ?auto_697111 ?auto_697107 ) ( not ( = ?auto_697108 ?auto_697109 ) ) ( not ( = ?auto_697108 ?auto_697110 ) ) ( not ( = ?auto_697108 ?auto_697107 ) ) ( not ( = ?auto_697108 ?auto_697111 ) ) ( not ( = ?auto_697108 ?auto_697113 ) ) ( not ( = ?auto_697108 ?auto_697112 ) ) ( not ( = ?auto_697108 ?auto_697115 ) ) ( not ( = ?auto_697109 ?auto_697110 ) ) ( not ( = ?auto_697109 ?auto_697107 ) ) ( not ( = ?auto_697109 ?auto_697111 ) ) ( not ( = ?auto_697109 ?auto_697113 ) ) ( not ( = ?auto_697109 ?auto_697112 ) ) ( not ( = ?auto_697109 ?auto_697115 ) ) ( not ( = ?auto_697110 ?auto_697107 ) ) ( not ( = ?auto_697110 ?auto_697111 ) ) ( not ( = ?auto_697110 ?auto_697113 ) ) ( not ( = ?auto_697110 ?auto_697112 ) ) ( not ( = ?auto_697110 ?auto_697115 ) ) ( not ( = ?auto_697107 ?auto_697111 ) ) ( not ( = ?auto_697107 ?auto_697113 ) ) ( not ( = ?auto_697107 ?auto_697112 ) ) ( not ( = ?auto_697107 ?auto_697115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_697111 ?auto_697113 ?auto_697112 )
      ( MAKE-6CRATE-VERIFY ?auto_697108 ?auto_697109 ?auto_697110 ?auto_697107 ?auto_697111 ?auto_697113 ?auto_697112 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_697172 - SURFACE
      ?auto_697173 - SURFACE
      ?auto_697174 - SURFACE
      ?auto_697171 - SURFACE
      ?auto_697175 - SURFACE
      ?auto_697177 - SURFACE
      ?auto_697176 - SURFACE
    )
    :vars
    (
      ?auto_697180 - HOIST
      ?auto_697178 - PLACE
      ?auto_697179 - PLACE
      ?auto_697182 - HOIST
      ?auto_697181 - SURFACE
      ?auto_697183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_697180 ?auto_697178 ) ( IS-CRATE ?auto_697176 ) ( not ( = ?auto_697177 ?auto_697176 ) ) ( not ( = ?auto_697175 ?auto_697177 ) ) ( not ( = ?auto_697175 ?auto_697176 ) ) ( not ( = ?auto_697179 ?auto_697178 ) ) ( HOIST-AT ?auto_697182 ?auto_697179 ) ( not ( = ?auto_697180 ?auto_697182 ) ) ( AVAILABLE ?auto_697182 ) ( SURFACE-AT ?auto_697176 ?auto_697179 ) ( ON ?auto_697176 ?auto_697181 ) ( CLEAR ?auto_697176 ) ( not ( = ?auto_697177 ?auto_697181 ) ) ( not ( = ?auto_697176 ?auto_697181 ) ) ( not ( = ?auto_697175 ?auto_697181 ) ) ( TRUCK-AT ?auto_697183 ?auto_697178 ) ( SURFACE-AT ?auto_697175 ?auto_697178 ) ( CLEAR ?auto_697175 ) ( LIFTING ?auto_697180 ?auto_697177 ) ( IS-CRATE ?auto_697177 ) ( ON ?auto_697173 ?auto_697172 ) ( ON ?auto_697174 ?auto_697173 ) ( ON ?auto_697171 ?auto_697174 ) ( ON ?auto_697175 ?auto_697171 ) ( not ( = ?auto_697172 ?auto_697173 ) ) ( not ( = ?auto_697172 ?auto_697174 ) ) ( not ( = ?auto_697172 ?auto_697171 ) ) ( not ( = ?auto_697172 ?auto_697175 ) ) ( not ( = ?auto_697172 ?auto_697177 ) ) ( not ( = ?auto_697172 ?auto_697176 ) ) ( not ( = ?auto_697172 ?auto_697181 ) ) ( not ( = ?auto_697173 ?auto_697174 ) ) ( not ( = ?auto_697173 ?auto_697171 ) ) ( not ( = ?auto_697173 ?auto_697175 ) ) ( not ( = ?auto_697173 ?auto_697177 ) ) ( not ( = ?auto_697173 ?auto_697176 ) ) ( not ( = ?auto_697173 ?auto_697181 ) ) ( not ( = ?auto_697174 ?auto_697171 ) ) ( not ( = ?auto_697174 ?auto_697175 ) ) ( not ( = ?auto_697174 ?auto_697177 ) ) ( not ( = ?auto_697174 ?auto_697176 ) ) ( not ( = ?auto_697174 ?auto_697181 ) ) ( not ( = ?auto_697171 ?auto_697175 ) ) ( not ( = ?auto_697171 ?auto_697177 ) ) ( not ( = ?auto_697171 ?auto_697176 ) ) ( not ( = ?auto_697171 ?auto_697181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_697175 ?auto_697177 ?auto_697176 )
      ( MAKE-6CRATE-VERIFY ?auto_697172 ?auto_697173 ?auto_697174 ?auto_697171 ?auto_697175 ?auto_697177 ?auto_697176 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_697236 - SURFACE
      ?auto_697237 - SURFACE
      ?auto_697238 - SURFACE
      ?auto_697235 - SURFACE
      ?auto_697239 - SURFACE
      ?auto_697241 - SURFACE
      ?auto_697240 - SURFACE
    )
    :vars
    (
      ?auto_697247 - HOIST
      ?auto_697245 - PLACE
      ?auto_697244 - PLACE
      ?auto_697242 - HOIST
      ?auto_697246 - SURFACE
      ?auto_697243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_697247 ?auto_697245 ) ( IS-CRATE ?auto_697240 ) ( not ( = ?auto_697241 ?auto_697240 ) ) ( not ( = ?auto_697239 ?auto_697241 ) ) ( not ( = ?auto_697239 ?auto_697240 ) ) ( not ( = ?auto_697244 ?auto_697245 ) ) ( HOIST-AT ?auto_697242 ?auto_697244 ) ( not ( = ?auto_697247 ?auto_697242 ) ) ( AVAILABLE ?auto_697242 ) ( SURFACE-AT ?auto_697240 ?auto_697244 ) ( ON ?auto_697240 ?auto_697246 ) ( CLEAR ?auto_697240 ) ( not ( = ?auto_697241 ?auto_697246 ) ) ( not ( = ?auto_697240 ?auto_697246 ) ) ( not ( = ?auto_697239 ?auto_697246 ) ) ( TRUCK-AT ?auto_697243 ?auto_697245 ) ( SURFACE-AT ?auto_697239 ?auto_697245 ) ( CLEAR ?auto_697239 ) ( IS-CRATE ?auto_697241 ) ( AVAILABLE ?auto_697247 ) ( IN ?auto_697241 ?auto_697243 ) ( ON ?auto_697237 ?auto_697236 ) ( ON ?auto_697238 ?auto_697237 ) ( ON ?auto_697235 ?auto_697238 ) ( ON ?auto_697239 ?auto_697235 ) ( not ( = ?auto_697236 ?auto_697237 ) ) ( not ( = ?auto_697236 ?auto_697238 ) ) ( not ( = ?auto_697236 ?auto_697235 ) ) ( not ( = ?auto_697236 ?auto_697239 ) ) ( not ( = ?auto_697236 ?auto_697241 ) ) ( not ( = ?auto_697236 ?auto_697240 ) ) ( not ( = ?auto_697236 ?auto_697246 ) ) ( not ( = ?auto_697237 ?auto_697238 ) ) ( not ( = ?auto_697237 ?auto_697235 ) ) ( not ( = ?auto_697237 ?auto_697239 ) ) ( not ( = ?auto_697237 ?auto_697241 ) ) ( not ( = ?auto_697237 ?auto_697240 ) ) ( not ( = ?auto_697237 ?auto_697246 ) ) ( not ( = ?auto_697238 ?auto_697235 ) ) ( not ( = ?auto_697238 ?auto_697239 ) ) ( not ( = ?auto_697238 ?auto_697241 ) ) ( not ( = ?auto_697238 ?auto_697240 ) ) ( not ( = ?auto_697238 ?auto_697246 ) ) ( not ( = ?auto_697235 ?auto_697239 ) ) ( not ( = ?auto_697235 ?auto_697241 ) ) ( not ( = ?auto_697235 ?auto_697240 ) ) ( not ( = ?auto_697235 ?auto_697246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_697239 ?auto_697241 ?auto_697240 )
      ( MAKE-6CRATE-VERIFY ?auto_697236 ?auto_697237 ?auto_697238 ?auto_697235 ?auto_697239 ?auto_697241 ?auto_697240 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699174 - SURFACE
      ?auto_699175 - SURFACE
      ?auto_699176 - SURFACE
      ?auto_699173 - SURFACE
      ?auto_699177 - SURFACE
      ?auto_699179 - SURFACE
      ?auto_699178 - SURFACE
      ?auto_699180 - SURFACE
    )
    :vars
    (
      ?auto_699182 - HOIST
      ?auto_699181 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_699182 ?auto_699181 ) ( SURFACE-AT ?auto_699178 ?auto_699181 ) ( CLEAR ?auto_699178 ) ( LIFTING ?auto_699182 ?auto_699180 ) ( IS-CRATE ?auto_699180 ) ( not ( = ?auto_699178 ?auto_699180 ) ) ( ON ?auto_699175 ?auto_699174 ) ( ON ?auto_699176 ?auto_699175 ) ( ON ?auto_699173 ?auto_699176 ) ( ON ?auto_699177 ?auto_699173 ) ( ON ?auto_699179 ?auto_699177 ) ( ON ?auto_699178 ?auto_699179 ) ( not ( = ?auto_699174 ?auto_699175 ) ) ( not ( = ?auto_699174 ?auto_699176 ) ) ( not ( = ?auto_699174 ?auto_699173 ) ) ( not ( = ?auto_699174 ?auto_699177 ) ) ( not ( = ?auto_699174 ?auto_699179 ) ) ( not ( = ?auto_699174 ?auto_699178 ) ) ( not ( = ?auto_699174 ?auto_699180 ) ) ( not ( = ?auto_699175 ?auto_699176 ) ) ( not ( = ?auto_699175 ?auto_699173 ) ) ( not ( = ?auto_699175 ?auto_699177 ) ) ( not ( = ?auto_699175 ?auto_699179 ) ) ( not ( = ?auto_699175 ?auto_699178 ) ) ( not ( = ?auto_699175 ?auto_699180 ) ) ( not ( = ?auto_699176 ?auto_699173 ) ) ( not ( = ?auto_699176 ?auto_699177 ) ) ( not ( = ?auto_699176 ?auto_699179 ) ) ( not ( = ?auto_699176 ?auto_699178 ) ) ( not ( = ?auto_699176 ?auto_699180 ) ) ( not ( = ?auto_699173 ?auto_699177 ) ) ( not ( = ?auto_699173 ?auto_699179 ) ) ( not ( = ?auto_699173 ?auto_699178 ) ) ( not ( = ?auto_699173 ?auto_699180 ) ) ( not ( = ?auto_699177 ?auto_699179 ) ) ( not ( = ?auto_699177 ?auto_699178 ) ) ( not ( = ?auto_699177 ?auto_699180 ) ) ( not ( = ?auto_699179 ?auto_699178 ) ) ( not ( = ?auto_699179 ?auto_699180 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_699178 ?auto_699180 )
      ( MAKE-7CRATE-VERIFY ?auto_699174 ?auto_699175 ?auto_699176 ?auto_699173 ?auto_699177 ?auto_699179 ?auto_699178 ?auto_699180 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699229 - SURFACE
      ?auto_699230 - SURFACE
      ?auto_699231 - SURFACE
      ?auto_699228 - SURFACE
      ?auto_699232 - SURFACE
      ?auto_699234 - SURFACE
      ?auto_699233 - SURFACE
      ?auto_699235 - SURFACE
    )
    :vars
    (
      ?auto_699238 - HOIST
      ?auto_699237 - PLACE
      ?auto_699236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_699238 ?auto_699237 ) ( SURFACE-AT ?auto_699233 ?auto_699237 ) ( CLEAR ?auto_699233 ) ( IS-CRATE ?auto_699235 ) ( not ( = ?auto_699233 ?auto_699235 ) ) ( TRUCK-AT ?auto_699236 ?auto_699237 ) ( AVAILABLE ?auto_699238 ) ( IN ?auto_699235 ?auto_699236 ) ( ON ?auto_699233 ?auto_699234 ) ( not ( = ?auto_699234 ?auto_699233 ) ) ( not ( = ?auto_699234 ?auto_699235 ) ) ( ON ?auto_699230 ?auto_699229 ) ( ON ?auto_699231 ?auto_699230 ) ( ON ?auto_699228 ?auto_699231 ) ( ON ?auto_699232 ?auto_699228 ) ( ON ?auto_699234 ?auto_699232 ) ( not ( = ?auto_699229 ?auto_699230 ) ) ( not ( = ?auto_699229 ?auto_699231 ) ) ( not ( = ?auto_699229 ?auto_699228 ) ) ( not ( = ?auto_699229 ?auto_699232 ) ) ( not ( = ?auto_699229 ?auto_699234 ) ) ( not ( = ?auto_699229 ?auto_699233 ) ) ( not ( = ?auto_699229 ?auto_699235 ) ) ( not ( = ?auto_699230 ?auto_699231 ) ) ( not ( = ?auto_699230 ?auto_699228 ) ) ( not ( = ?auto_699230 ?auto_699232 ) ) ( not ( = ?auto_699230 ?auto_699234 ) ) ( not ( = ?auto_699230 ?auto_699233 ) ) ( not ( = ?auto_699230 ?auto_699235 ) ) ( not ( = ?auto_699231 ?auto_699228 ) ) ( not ( = ?auto_699231 ?auto_699232 ) ) ( not ( = ?auto_699231 ?auto_699234 ) ) ( not ( = ?auto_699231 ?auto_699233 ) ) ( not ( = ?auto_699231 ?auto_699235 ) ) ( not ( = ?auto_699228 ?auto_699232 ) ) ( not ( = ?auto_699228 ?auto_699234 ) ) ( not ( = ?auto_699228 ?auto_699233 ) ) ( not ( = ?auto_699228 ?auto_699235 ) ) ( not ( = ?auto_699232 ?auto_699234 ) ) ( not ( = ?auto_699232 ?auto_699233 ) ) ( not ( = ?auto_699232 ?auto_699235 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699234 ?auto_699233 ?auto_699235 )
      ( MAKE-7CRATE-VERIFY ?auto_699229 ?auto_699230 ?auto_699231 ?auto_699228 ?auto_699232 ?auto_699234 ?auto_699233 ?auto_699235 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699292 - SURFACE
      ?auto_699293 - SURFACE
      ?auto_699294 - SURFACE
      ?auto_699291 - SURFACE
      ?auto_699295 - SURFACE
      ?auto_699297 - SURFACE
      ?auto_699296 - SURFACE
      ?auto_699298 - SURFACE
    )
    :vars
    (
      ?auto_699300 - HOIST
      ?auto_699299 - PLACE
      ?auto_699302 - TRUCK
      ?auto_699301 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_699300 ?auto_699299 ) ( SURFACE-AT ?auto_699296 ?auto_699299 ) ( CLEAR ?auto_699296 ) ( IS-CRATE ?auto_699298 ) ( not ( = ?auto_699296 ?auto_699298 ) ) ( AVAILABLE ?auto_699300 ) ( IN ?auto_699298 ?auto_699302 ) ( ON ?auto_699296 ?auto_699297 ) ( not ( = ?auto_699297 ?auto_699296 ) ) ( not ( = ?auto_699297 ?auto_699298 ) ) ( TRUCK-AT ?auto_699302 ?auto_699301 ) ( not ( = ?auto_699301 ?auto_699299 ) ) ( ON ?auto_699293 ?auto_699292 ) ( ON ?auto_699294 ?auto_699293 ) ( ON ?auto_699291 ?auto_699294 ) ( ON ?auto_699295 ?auto_699291 ) ( ON ?auto_699297 ?auto_699295 ) ( not ( = ?auto_699292 ?auto_699293 ) ) ( not ( = ?auto_699292 ?auto_699294 ) ) ( not ( = ?auto_699292 ?auto_699291 ) ) ( not ( = ?auto_699292 ?auto_699295 ) ) ( not ( = ?auto_699292 ?auto_699297 ) ) ( not ( = ?auto_699292 ?auto_699296 ) ) ( not ( = ?auto_699292 ?auto_699298 ) ) ( not ( = ?auto_699293 ?auto_699294 ) ) ( not ( = ?auto_699293 ?auto_699291 ) ) ( not ( = ?auto_699293 ?auto_699295 ) ) ( not ( = ?auto_699293 ?auto_699297 ) ) ( not ( = ?auto_699293 ?auto_699296 ) ) ( not ( = ?auto_699293 ?auto_699298 ) ) ( not ( = ?auto_699294 ?auto_699291 ) ) ( not ( = ?auto_699294 ?auto_699295 ) ) ( not ( = ?auto_699294 ?auto_699297 ) ) ( not ( = ?auto_699294 ?auto_699296 ) ) ( not ( = ?auto_699294 ?auto_699298 ) ) ( not ( = ?auto_699291 ?auto_699295 ) ) ( not ( = ?auto_699291 ?auto_699297 ) ) ( not ( = ?auto_699291 ?auto_699296 ) ) ( not ( = ?auto_699291 ?auto_699298 ) ) ( not ( = ?auto_699295 ?auto_699297 ) ) ( not ( = ?auto_699295 ?auto_699296 ) ) ( not ( = ?auto_699295 ?auto_699298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699297 ?auto_699296 ?auto_699298 )
      ( MAKE-7CRATE-VERIFY ?auto_699292 ?auto_699293 ?auto_699294 ?auto_699291 ?auto_699295 ?auto_699297 ?auto_699296 ?auto_699298 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699362 - SURFACE
      ?auto_699363 - SURFACE
      ?auto_699364 - SURFACE
      ?auto_699361 - SURFACE
      ?auto_699365 - SURFACE
      ?auto_699367 - SURFACE
      ?auto_699366 - SURFACE
      ?auto_699368 - SURFACE
    )
    :vars
    (
      ?auto_699373 - HOIST
      ?auto_699369 - PLACE
      ?auto_699370 - TRUCK
      ?auto_699371 - PLACE
      ?auto_699372 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_699373 ?auto_699369 ) ( SURFACE-AT ?auto_699366 ?auto_699369 ) ( CLEAR ?auto_699366 ) ( IS-CRATE ?auto_699368 ) ( not ( = ?auto_699366 ?auto_699368 ) ) ( AVAILABLE ?auto_699373 ) ( ON ?auto_699366 ?auto_699367 ) ( not ( = ?auto_699367 ?auto_699366 ) ) ( not ( = ?auto_699367 ?auto_699368 ) ) ( TRUCK-AT ?auto_699370 ?auto_699371 ) ( not ( = ?auto_699371 ?auto_699369 ) ) ( HOIST-AT ?auto_699372 ?auto_699371 ) ( LIFTING ?auto_699372 ?auto_699368 ) ( not ( = ?auto_699373 ?auto_699372 ) ) ( ON ?auto_699363 ?auto_699362 ) ( ON ?auto_699364 ?auto_699363 ) ( ON ?auto_699361 ?auto_699364 ) ( ON ?auto_699365 ?auto_699361 ) ( ON ?auto_699367 ?auto_699365 ) ( not ( = ?auto_699362 ?auto_699363 ) ) ( not ( = ?auto_699362 ?auto_699364 ) ) ( not ( = ?auto_699362 ?auto_699361 ) ) ( not ( = ?auto_699362 ?auto_699365 ) ) ( not ( = ?auto_699362 ?auto_699367 ) ) ( not ( = ?auto_699362 ?auto_699366 ) ) ( not ( = ?auto_699362 ?auto_699368 ) ) ( not ( = ?auto_699363 ?auto_699364 ) ) ( not ( = ?auto_699363 ?auto_699361 ) ) ( not ( = ?auto_699363 ?auto_699365 ) ) ( not ( = ?auto_699363 ?auto_699367 ) ) ( not ( = ?auto_699363 ?auto_699366 ) ) ( not ( = ?auto_699363 ?auto_699368 ) ) ( not ( = ?auto_699364 ?auto_699361 ) ) ( not ( = ?auto_699364 ?auto_699365 ) ) ( not ( = ?auto_699364 ?auto_699367 ) ) ( not ( = ?auto_699364 ?auto_699366 ) ) ( not ( = ?auto_699364 ?auto_699368 ) ) ( not ( = ?auto_699361 ?auto_699365 ) ) ( not ( = ?auto_699361 ?auto_699367 ) ) ( not ( = ?auto_699361 ?auto_699366 ) ) ( not ( = ?auto_699361 ?auto_699368 ) ) ( not ( = ?auto_699365 ?auto_699367 ) ) ( not ( = ?auto_699365 ?auto_699366 ) ) ( not ( = ?auto_699365 ?auto_699368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699367 ?auto_699366 ?auto_699368 )
      ( MAKE-7CRATE-VERIFY ?auto_699362 ?auto_699363 ?auto_699364 ?auto_699361 ?auto_699365 ?auto_699367 ?auto_699366 ?auto_699368 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699439 - SURFACE
      ?auto_699440 - SURFACE
      ?auto_699441 - SURFACE
      ?auto_699438 - SURFACE
      ?auto_699442 - SURFACE
      ?auto_699444 - SURFACE
      ?auto_699443 - SURFACE
      ?auto_699445 - SURFACE
    )
    :vars
    (
      ?auto_699450 - HOIST
      ?auto_699446 - PLACE
      ?auto_699448 - TRUCK
      ?auto_699451 - PLACE
      ?auto_699447 - HOIST
      ?auto_699449 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_699450 ?auto_699446 ) ( SURFACE-AT ?auto_699443 ?auto_699446 ) ( CLEAR ?auto_699443 ) ( IS-CRATE ?auto_699445 ) ( not ( = ?auto_699443 ?auto_699445 ) ) ( AVAILABLE ?auto_699450 ) ( ON ?auto_699443 ?auto_699444 ) ( not ( = ?auto_699444 ?auto_699443 ) ) ( not ( = ?auto_699444 ?auto_699445 ) ) ( TRUCK-AT ?auto_699448 ?auto_699451 ) ( not ( = ?auto_699451 ?auto_699446 ) ) ( HOIST-AT ?auto_699447 ?auto_699451 ) ( not ( = ?auto_699450 ?auto_699447 ) ) ( AVAILABLE ?auto_699447 ) ( SURFACE-AT ?auto_699445 ?auto_699451 ) ( ON ?auto_699445 ?auto_699449 ) ( CLEAR ?auto_699445 ) ( not ( = ?auto_699443 ?auto_699449 ) ) ( not ( = ?auto_699445 ?auto_699449 ) ) ( not ( = ?auto_699444 ?auto_699449 ) ) ( ON ?auto_699440 ?auto_699439 ) ( ON ?auto_699441 ?auto_699440 ) ( ON ?auto_699438 ?auto_699441 ) ( ON ?auto_699442 ?auto_699438 ) ( ON ?auto_699444 ?auto_699442 ) ( not ( = ?auto_699439 ?auto_699440 ) ) ( not ( = ?auto_699439 ?auto_699441 ) ) ( not ( = ?auto_699439 ?auto_699438 ) ) ( not ( = ?auto_699439 ?auto_699442 ) ) ( not ( = ?auto_699439 ?auto_699444 ) ) ( not ( = ?auto_699439 ?auto_699443 ) ) ( not ( = ?auto_699439 ?auto_699445 ) ) ( not ( = ?auto_699439 ?auto_699449 ) ) ( not ( = ?auto_699440 ?auto_699441 ) ) ( not ( = ?auto_699440 ?auto_699438 ) ) ( not ( = ?auto_699440 ?auto_699442 ) ) ( not ( = ?auto_699440 ?auto_699444 ) ) ( not ( = ?auto_699440 ?auto_699443 ) ) ( not ( = ?auto_699440 ?auto_699445 ) ) ( not ( = ?auto_699440 ?auto_699449 ) ) ( not ( = ?auto_699441 ?auto_699438 ) ) ( not ( = ?auto_699441 ?auto_699442 ) ) ( not ( = ?auto_699441 ?auto_699444 ) ) ( not ( = ?auto_699441 ?auto_699443 ) ) ( not ( = ?auto_699441 ?auto_699445 ) ) ( not ( = ?auto_699441 ?auto_699449 ) ) ( not ( = ?auto_699438 ?auto_699442 ) ) ( not ( = ?auto_699438 ?auto_699444 ) ) ( not ( = ?auto_699438 ?auto_699443 ) ) ( not ( = ?auto_699438 ?auto_699445 ) ) ( not ( = ?auto_699438 ?auto_699449 ) ) ( not ( = ?auto_699442 ?auto_699444 ) ) ( not ( = ?auto_699442 ?auto_699443 ) ) ( not ( = ?auto_699442 ?auto_699445 ) ) ( not ( = ?auto_699442 ?auto_699449 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699444 ?auto_699443 ?auto_699445 )
      ( MAKE-7CRATE-VERIFY ?auto_699439 ?auto_699440 ?auto_699441 ?auto_699438 ?auto_699442 ?auto_699444 ?auto_699443 ?auto_699445 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699517 - SURFACE
      ?auto_699518 - SURFACE
      ?auto_699519 - SURFACE
      ?auto_699516 - SURFACE
      ?auto_699520 - SURFACE
      ?auto_699522 - SURFACE
      ?auto_699521 - SURFACE
      ?auto_699523 - SURFACE
    )
    :vars
    (
      ?auto_699528 - HOIST
      ?auto_699524 - PLACE
      ?auto_699525 - PLACE
      ?auto_699526 - HOIST
      ?auto_699527 - SURFACE
      ?auto_699529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_699528 ?auto_699524 ) ( SURFACE-AT ?auto_699521 ?auto_699524 ) ( CLEAR ?auto_699521 ) ( IS-CRATE ?auto_699523 ) ( not ( = ?auto_699521 ?auto_699523 ) ) ( AVAILABLE ?auto_699528 ) ( ON ?auto_699521 ?auto_699522 ) ( not ( = ?auto_699522 ?auto_699521 ) ) ( not ( = ?auto_699522 ?auto_699523 ) ) ( not ( = ?auto_699525 ?auto_699524 ) ) ( HOIST-AT ?auto_699526 ?auto_699525 ) ( not ( = ?auto_699528 ?auto_699526 ) ) ( AVAILABLE ?auto_699526 ) ( SURFACE-AT ?auto_699523 ?auto_699525 ) ( ON ?auto_699523 ?auto_699527 ) ( CLEAR ?auto_699523 ) ( not ( = ?auto_699521 ?auto_699527 ) ) ( not ( = ?auto_699523 ?auto_699527 ) ) ( not ( = ?auto_699522 ?auto_699527 ) ) ( TRUCK-AT ?auto_699529 ?auto_699524 ) ( ON ?auto_699518 ?auto_699517 ) ( ON ?auto_699519 ?auto_699518 ) ( ON ?auto_699516 ?auto_699519 ) ( ON ?auto_699520 ?auto_699516 ) ( ON ?auto_699522 ?auto_699520 ) ( not ( = ?auto_699517 ?auto_699518 ) ) ( not ( = ?auto_699517 ?auto_699519 ) ) ( not ( = ?auto_699517 ?auto_699516 ) ) ( not ( = ?auto_699517 ?auto_699520 ) ) ( not ( = ?auto_699517 ?auto_699522 ) ) ( not ( = ?auto_699517 ?auto_699521 ) ) ( not ( = ?auto_699517 ?auto_699523 ) ) ( not ( = ?auto_699517 ?auto_699527 ) ) ( not ( = ?auto_699518 ?auto_699519 ) ) ( not ( = ?auto_699518 ?auto_699516 ) ) ( not ( = ?auto_699518 ?auto_699520 ) ) ( not ( = ?auto_699518 ?auto_699522 ) ) ( not ( = ?auto_699518 ?auto_699521 ) ) ( not ( = ?auto_699518 ?auto_699523 ) ) ( not ( = ?auto_699518 ?auto_699527 ) ) ( not ( = ?auto_699519 ?auto_699516 ) ) ( not ( = ?auto_699519 ?auto_699520 ) ) ( not ( = ?auto_699519 ?auto_699522 ) ) ( not ( = ?auto_699519 ?auto_699521 ) ) ( not ( = ?auto_699519 ?auto_699523 ) ) ( not ( = ?auto_699519 ?auto_699527 ) ) ( not ( = ?auto_699516 ?auto_699520 ) ) ( not ( = ?auto_699516 ?auto_699522 ) ) ( not ( = ?auto_699516 ?auto_699521 ) ) ( not ( = ?auto_699516 ?auto_699523 ) ) ( not ( = ?auto_699516 ?auto_699527 ) ) ( not ( = ?auto_699520 ?auto_699522 ) ) ( not ( = ?auto_699520 ?auto_699521 ) ) ( not ( = ?auto_699520 ?auto_699523 ) ) ( not ( = ?auto_699520 ?auto_699527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699522 ?auto_699521 ?auto_699523 )
      ( MAKE-7CRATE-VERIFY ?auto_699517 ?auto_699518 ?auto_699519 ?auto_699516 ?auto_699520 ?auto_699522 ?auto_699521 ?auto_699523 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699595 - SURFACE
      ?auto_699596 - SURFACE
      ?auto_699597 - SURFACE
      ?auto_699594 - SURFACE
      ?auto_699598 - SURFACE
      ?auto_699600 - SURFACE
      ?auto_699599 - SURFACE
      ?auto_699601 - SURFACE
    )
    :vars
    (
      ?auto_699604 - HOIST
      ?auto_699602 - PLACE
      ?auto_699603 - PLACE
      ?auto_699605 - HOIST
      ?auto_699607 - SURFACE
      ?auto_699606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_699604 ?auto_699602 ) ( IS-CRATE ?auto_699601 ) ( not ( = ?auto_699599 ?auto_699601 ) ) ( not ( = ?auto_699600 ?auto_699599 ) ) ( not ( = ?auto_699600 ?auto_699601 ) ) ( not ( = ?auto_699603 ?auto_699602 ) ) ( HOIST-AT ?auto_699605 ?auto_699603 ) ( not ( = ?auto_699604 ?auto_699605 ) ) ( AVAILABLE ?auto_699605 ) ( SURFACE-AT ?auto_699601 ?auto_699603 ) ( ON ?auto_699601 ?auto_699607 ) ( CLEAR ?auto_699601 ) ( not ( = ?auto_699599 ?auto_699607 ) ) ( not ( = ?auto_699601 ?auto_699607 ) ) ( not ( = ?auto_699600 ?auto_699607 ) ) ( TRUCK-AT ?auto_699606 ?auto_699602 ) ( SURFACE-AT ?auto_699600 ?auto_699602 ) ( CLEAR ?auto_699600 ) ( LIFTING ?auto_699604 ?auto_699599 ) ( IS-CRATE ?auto_699599 ) ( ON ?auto_699596 ?auto_699595 ) ( ON ?auto_699597 ?auto_699596 ) ( ON ?auto_699594 ?auto_699597 ) ( ON ?auto_699598 ?auto_699594 ) ( ON ?auto_699600 ?auto_699598 ) ( not ( = ?auto_699595 ?auto_699596 ) ) ( not ( = ?auto_699595 ?auto_699597 ) ) ( not ( = ?auto_699595 ?auto_699594 ) ) ( not ( = ?auto_699595 ?auto_699598 ) ) ( not ( = ?auto_699595 ?auto_699600 ) ) ( not ( = ?auto_699595 ?auto_699599 ) ) ( not ( = ?auto_699595 ?auto_699601 ) ) ( not ( = ?auto_699595 ?auto_699607 ) ) ( not ( = ?auto_699596 ?auto_699597 ) ) ( not ( = ?auto_699596 ?auto_699594 ) ) ( not ( = ?auto_699596 ?auto_699598 ) ) ( not ( = ?auto_699596 ?auto_699600 ) ) ( not ( = ?auto_699596 ?auto_699599 ) ) ( not ( = ?auto_699596 ?auto_699601 ) ) ( not ( = ?auto_699596 ?auto_699607 ) ) ( not ( = ?auto_699597 ?auto_699594 ) ) ( not ( = ?auto_699597 ?auto_699598 ) ) ( not ( = ?auto_699597 ?auto_699600 ) ) ( not ( = ?auto_699597 ?auto_699599 ) ) ( not ( = ?auto_699597 ?auto_699601 ) ) ( not ( = ?auto_699597 ?auto_699607 ) ) ( not ( = ?auto_699594 ?auto_699598 ) ) ( not ( = ?auto_699594 ?auto_699600 ) ) ( not ( = ?auto_699594 ?auto_699599 ) ) ( not ( = ?auto_699594 ?auto_699601 ) ) ( not ( = ?auto_699594 ?auto_699607 ) ) ( not ( = ?auto_699598 ?auto_699600 ) ) ( not ( = ?auto_699598 ?auto_699599 ) ) ( not ( = ?auto_699598 ?auto_699601 ) ) ( not ( = ?auto_699598 ?auto_699607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699600 ?auto_699599 ?auto_699601 )
      ( MAKE-7CRATE-VERIFY ?auto_699595 ?auto_699596 ?auto_699597 ?auto_699594 ?auto_699598 ?auto_699600 ?auto_699599 ?auto_699601 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699673 - SURFACE
      ?auto_699674 - SURFACE
      ?auto_699675 - SURFACE
      ?auto_699672 - SURFACE
      ?auto_699676 - SURFACE
      ?auto_699678 - SURFACE
      ?auto_699677 - SURFACE
      ?auto_699679 - SURFACE
    )
    :vars
    (
      ?auto_699680 - HOIST
      ?auto_699681 - PLACE
      ?auto_699682 - PLACE
      ?auto_699685 - HOIST
      ?auto_699683 - SURFACE
      ?auto_699684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_699680 ?auto_699681 ) ( IS-CRATE ?auto_699679 ) ( not ( = ?auto_699677 ?auto_699679 ) ) ( not ( = ?auto_699678 ?auto_699677 ) ) ( not ( = ?auto_699678 ?auto_699679 ) ) ( not ( = ?auto_699682 ?auto_699681 ) ) ( HOIST-AT ?auto_699685 ?auto_699682 ) ( not ( = ?auto_699680 ?auto_699685 ) ) ( AVAILABLE ?auto_699685 ) ( SURFACE-AT ?auto_699679 ?auto_699682 ) ( ON ?auto_699679 ?auto_699683 ) ( CLEAR ?auto_699679 ) ( not ( = ?auto_699677 ?auto_699683 ) ) ( not ( = ?auto_699679 ?auto_699683 ) ) ( not ( = ?auto_699678 ?auto_699683 ) ) ( TRUCK-AT ?auto_699684 ?auto_699681 ) ( SURFACE-AT ?auto_699678 ?auto_699681 ) ( CLEAR ?auto_699678 ) ( IS-CRATE ?auto_699677 ) ( AVAILABLE ?auto_699680 ) ( IN ?auto_699677 ?auto_699684 ) ( ON ?auto_699674 ?auto_699673 ) ( ON ?auto_699675 ?auto_699674 ) ( ON ?auto_699672 ?auto_699675 ) ( ON ?auto_699676 ?auto_699672 ) ( ON ?auto_699678 ?auto_699676 ) ( not ( = ?auto_699673 ?auto_699674 ) ) ( not ( = ?auto_699673 ?auto_699675 ) ) ( not ( = ?auto_699673 ?auto_699672 ) ) ( not ( = ?auto_699673 ?auto_699676 ) ) ( not ( = ?auto_699673 ?auto_699678 ) ) ( not ( = ?auto_699673 ?auto_699677 ) ) ( not ( = ?auto_699673 ?auto_699679 ) ) ( not ( = ?auto_699673 ?auto_699683 ) ) ( not ( = ?auto_699674 ?auto_699675 ) ) ( not ( = ?auto_699674 ?auto_699672 ) ) ( not ( = ?auto_699674 ?auto_699676 ) ) ( not ( = ?auto_699674 ?auto_699678 ) ) ( not ( = ?auto_699674 ?auto_699677 ) ) ( not ( = ?auto_699674 ?auto_699679 ) ) ( not ( = ?auto_699674 ?auto_699683 ) ) ( not ( = ?auto_699675 ?auto_699672 ) ) ( not ( = ?auto_699675 ?auto_699676 ) ) ( not ( = ?auto_699675 ?auto_699678 ) ) ( not ( = ?auto_699675 ?auto_699677 ) ) ( not ( = ?auto_699675 ?auto_699679 ) ) ( not ( = ?auto_699675 ?auto_699683 ) ) ( not ( = ?auto_699672 ?auto_699676 ) ) ( not ( = ?auto_699672 ?auto_699678 ) ) ( not ( = ?auto_699672 ?auto_699677 ) ) ( not ( = ?auto_699672 ?auto_699679 ) ) ( not ( = ?auto_699672 ?auto_699683 ) ) ( not ( = ?auto_699676 ?auto_699678 ) ) ( not ( = ?auto_699676 ?auto_699677 ) ) ( not ( = ?auto_699676 ?auto_699679 ) ) ( not ( = ?auto_699676 ?auto_699683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699678 ?auto_699677 ?auto_699679 )
      ( MAKE-7CRATE-VERIFY ?auto_699673 ?auto_699674 ?auto_699675 ?auto_699672 ?auto_699676 ?auto_699678 ?auto_699677 ?auto_699679 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702570 - SURFACE
      ?auto_702571 - SURFACE
      ?auto_702572 - SURFACE
      ?auto_702569 - SURFACE
      ?auto_702573 - SURFACE
      ?auto_702575 - SURFACE
      ?auto_702574 - SURFACE
      ?auto_702576 - SURFACE
      ?auto_702577 - SURFACE
    )
    :vars
    (
      ?auto_702578 - HOIST
      ?auto_702579 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_702578 ?auto_702579 ) ( SURFACE-AT ?auto_702576 ?auto_702579 ) ( CLEAR ?auto_702576 ) ( LIFTING ?auto_702578 ?auto_702577 ) ( IS-CRATE ?auto_702577 ) ( not ( = ?auto_702576 ?auto_702577 ) ) ( ON ?auto_702571 ?auto_702570 ) ( ON ?auto_702572 ?auto_702571 ) ( ON ?auto_702569 ?auto_702572 ) ( ON ?auto_702573 ?auto_702569 ) ( ON ?auto_702575 ?auto_702573 ) ( ON ?auto_702574 ?auto_702575 ) ( ON ?auto_702576 ?auto_702574 ) ( not ( = ?auto_702570 ?auto_702571 ) ) ( not ( = ?auto_702570 ?auto_702572 ) ) ( not ( = ?auto_702570 ?auto_702569 ) ) ( not ( = ?auto_702570 ?auto_702573 ) ) ( not ( = ?auto_702570 ?auto_702575 ) ) ( not ( = ?auto_702570 ?auto_702574 ) ) ( not ( = ?auto_702570 ?auto_702576 ) ) ( not ( = ?auto_702570 ?auto_702577 ) ) ( not ( = ?auto_702571 ?auto_702572 ) ) ( not ( = ?auto_702571 ?auto_702569 ) ) ( not ( = ?auto_702571 ?auto_702573 ) ) ( not ( = ?auto_702571 ?auto_702575 ) ) ( not ( = ?auto_702571 ?auto_702574 ) ) ( not ( = ?auto_702571 ?auto_702576 ) ) ( not ( = ?auto_702571 ?auto_702577 ) ) ( not ( = ?auto_702572 ?auto_702569 ) ) ( not ( = ?auto_702572 ?auto_702573 ) ) ( not ( = ?auto_702572 ?auto_702575 ) ) ( not ( = ?auto_702572 ?auto_702574 ) ) ( not ( = ?auto_702572 ?auto_702576 ) ) ( not ( = ?auto_702572 ?auto_702577 ) ) ( not ( = ?auto_702569 ?auto_702573 ) ) ( not ( = ?auto_702569 ?auto_702575 ) ) ( not ( = ?auto_702569 ?auto_702574 ) ) ( not ( = ?auto_702569 ?auto_702576 ) ) ( not ( = ?auto_702569 ?auto_702577 ) ) ( not ( = ?auto_702573 ?auto_702575 ) ) ( not ( = ?auto_702573 ?auto_702574 ) ) ( not ( = ?auto_702573 ?auto_702576 ) ) ( not ( = ?auto_702573 ?auto_702577 ) ) ( not ( = ?auto_702575 ?auto_702574 ) ) ( not ( = ?auto_702575 ?auto_702576 ) ) ( not ( = ?auto_702575 ?auto_702577 ) ) ( not ( = ?auto_702574 ?auto_702576 ) ) ( not ( = ?auto_702574 ?auto_702577 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_702576 ?auto_702577 )
      ( MAKE-8CRATE-VERIFY ?auto_702570 ?auto_702571 ?auto_702572 ?auto_702569 ?auto_702573 ?auto_702575 ?auto_702574 ?auto_702576 ?auto_702577 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702637 - SURFACE
      ?auto_702638 - SURFACE
      ?auto_702639 - SURFACE
      ?auto_702636 - SURFACE
      ?auto_702640 - SURFACE
      ?auto_702642 - SURFACE
      ?auto_702641 - SURFACE
      ?auto_702643 - SURFACE
      ?auto_702644 - SURFACE
    )
    :vars
    (
      ?auto_702647 - HOIST
      ?auto_702645 - PLACE
      ?auto_702646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_702647 ?auto_702645 ) ( SURFACE-AT ?auto_702643 ?auto_702645 ) ( CLEAR ?auto_702643 ) ( IS-CRATE ?auto_702644 ) ( not ( = ?auto_702643 ?auto_702644 ) ) ( TRUCK-AT ?auto_702646 ?auto_702645 ) ( AVAILABLE ?auto_702647 ) ( IN ?auto_702644 ?auto_702646 ) ( ON ?auto_702643 ?auto_702641 ) ( not ( = ?auto_702641 ?auto_702643 ) ) ( not ( = ?auto_702641 ?auto_702644 ) ) ( ON ?auto_702638 ?auto_702637 ) ( ON ?auto_702639 ?auto_702638 ) ( ON ?auto_702636 ?auto_702639 ) ( ON ?auto_702640 ?auto_702636 ) ( ON ?auto_702642 ?auto_702640 ) ( ON ?auto_702641 ?auto_702642 ) ( not ( = ?auto_702637 ?auto_702638 ) ) ( not ( = ?auto_702637 ?auto_702639 ) ) ( not ( = ?auto_702637 ?auto_702636 ) ) ( not ( = ?auto_702637 ?auto_702640 ) ) ( not ( = ?auto_702637 ?auto_702642 ) ) ( not ( = ?auto_702637 ?auto_702641 ) ) ( not ( = ?auto_702637 ?auto_702643 ) ) ( not ( = ?auto_702637 ?auto_702644 ) ) ( not ( = ?auto_702638 ?auto_702639 ) ) ( not ( = ?auto_702638 ?auto_702636 ) ) ( not ( = ?auto_702638 ?auto_702640 ) ) ( not ( = ?auto_702638 ?auto_702642 ) ) ( not ( = ?auto_702638 ?auto_702641 ) ) ( not ( = ?auto_702638 ?auto_702643 ) ) ( not ( = ?auto_702638 ?auto_702644 ) ) ( not ( = ?auto_702639 ?auto_702636 ) ) ( not ( = ?auto_702639 ?auto_702640 ) ) ( not ( = ?auto_702639 ?auto_702642 ) ) ( not ( = ?auto_702639 ?auto_702641 ) ) ( not ( = ?auto_702639 ?auto_702643 ) ) ( not ( = ?auto_702639 ?auto_702644 ) ) ( not ( = ?auto_702636 ?auto_702640 ) ) ( not ( = ?auto_702636 ?auto_702642 ) ) ( not ( = ?auto_702636 ?auto_702641 ) ) ( not ( = ?auto_702636 ?auto_702643 ) ) ( not ( = ?auto_702636 ?auto_702644 ) ) ( not ( = ?auto_702640 ?auto_702642 ) ) ( not ( = ?auto_702640 ?auto_702641 ) ) ( not ( = ?auto_702640 ?auto_702643 ) ) ( not ( = ?auto_702640 ?auto_702644 ) ) ( not ( = ?auto_702642 ?auto_702641 ) ) ( not ( = ?auto_702642 ?auto_702643 ) ) ( not ( = ?auto_702642 ?auto_702644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_702641 ?auto_702643 ?auto_702644 )
      ( MAKE-8CRATE-VERIFY ?auto_702637 ?auto_702638 ?auto_702639 ?auto_702636 ?auto_702640 ?auto_702642 ?auto_702641 ?auto_702643 ?auto_702644 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702713 - SURFACE
      ?auto_702714 - SURFACE
      ?auto_702715 - SURFACE
      ?auto_702712 - SURFACE
      ?auto_702716 - SURFACE
      ?auto_702718 - SURFACE
      ?auto_702717 - SURFACE
      ?auto_702719 - SURFACE
      ?auto_702720 - SURFACE
    )
    :vars
    (
      ?auto_702724 - HOIST
      ?auto_702722 - PLACE
      ?auto_702723 - TRUCK
      ?auto_702721 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_702724 ?auto_702722 ) ( SURFACE-AT ?auto_702719 ?auto_702722 ) ( CLEAR ?auto_702719 ) ( IS-CRATE ?auto_702720 ) ( not ( = ?auto_702719 ?auto_702720 ) ) ( AVAILABLE ?auto_702724 ) ( IN ?auto_702720 ?auto_702723 ) ( ON ?auto_702719 ?auto_702717 ) ( not ( = ?auto_702717 ?auto_702719 ) ) ( not ( = ?auto_702717 ?auto_702720 ) ) ( TRUCK-AT ?auto_702723 ?auto_702721 ) ( not ( = ?auto_702721 ?auto_702722 ) ) ( ON ?auto_702714 ?auto_702713 ) ( ON ?auto_702715 ?auto_702714 ) ( ON ?auto_702712 ?auto_702715 ) ( ON ?auto_702716 ?auto_702712 ) ( ON ?auto_702718 ?auto_702716 ) ( ON ?auto_702717 ?auto_702718 ) ( not ( = ?auto_702713 ?auto_702714 ) ) ( not ( = ?auto_702713 ?auto_702715 ) ) ( not ( = ?auto_702713 ?auto_702712 ) ) ( not ( = ?auto_702713 ?auto_702716 ) ) ( not ( = ?auto_702713 ?auto_702718 ) ) ( not ( = ?auto_702713 ?auto_702717 ) ) ( not ( = ?auto_702713 ?auto_702719 ) ) ( not ( = ?auto_702713 ?auto_702720 ) ) ( not ( = ?auto_702714 ?auto_702715 ) ) ( not ( = ?auto_702714 ?auto_702712 ) ) ( not ( = ?auto_702714 ?auto_702716 ) ) ( not ( = ?auto_702714 ?auto_702718 ) ) ( not ( = ?auto_702714 ?auto_702717 ) ) ( not ( = ?auto_702714 ?auto_702719 ) ) ( not ( = ?auto_702714 ?auto_702720 ) ) ( not ( = ?auto_702715 ?auto_702712 ) ) ( not ( = ?auto_702715 ?auto_702716 ) ) ( not ( = ?auto_702715 ?auto_702718 ) ) ( not ( = ?auto_702715 ?auto_702717 ) ) ( not ( = ?auto_702715 ?auto_702719 ) ) ( not ( = ?auto_702715 ?auto_702720 ) ) ( not ( = ?auto_702712 ?auto_702716 ) ) ( not ( = ?auto_702712 ?auto_702718 ) ) ( not ( = ?auto_702712 ?auto_702717 ) ) ( not ( = ?auto_702712 ?auto_702719 ) ) ( not ( = ?auto_702712 ?auto_702720 ) ) ( not ( = ?auto_702716 ?auto_702718 ) ) ( not ( = ?auto_702716 ?auto_702717 ) ) ( not ( = ?auto_702716 ?auto_702719 ) ) ( not ( = ?auto_702716 ?auto_702720 ) ) ( not ( = ?auto_702718 ?auto_702717 ) ) ( not ( = ?auto_702718 ?auto_702719 ) ) ( not ( = ?auto_702718 ?auto_702720 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_702717 ?auto_702719 ?auto_702720 )
      ( MAKE-8CRATE-VERIFY ?auto_702713 ?auto_702714 ?auto_702715 ?auto_702712 ?auto_702716 ?auto_702718 ?auto_702717 ?auto_702719 ?auto_702720 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702797 - SURFACE
      ?auto_702798 - SURFACE
      ?auto_702799 - SURFACE
      ?auto_702796 - SURFACE
      ?auto_702800 - SURFACE
      ?auto_702802 - SURFACE
      ?auto_702801 - SURFACE
      ?auto_702803 - SURFACE
      ?auto_702804 - SURFACE
    )
    :vars
    (
      ?auto_702807 - HOIST
      ?auto_702809 - PLACE
      ?auto_702805 - TRUCK
      ?auto_702808 - PLACE
      ?auto_702806 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_702807 ?auto_702809 ) ( SURFACE-AT ?auto_702803 ?auto_702809 ) ( CLEAR ?auto_702803 ) ( IS-CRATE ?auto_702804 ) ( not ( = ?auto_702803 ?auto_702804 ) ) ( AVAILABLE ?auto_702807 ) ( ON ?auto_702803 ?auto_702801 ) ( not ( = ?auto_702801 ?auto_702803 ) ) ( not ( = ?auto_702801 ?auto_702804 ) ) ( TRUCK-AT ?auto_702805 ?auto_702808 ) ( not ( = ?auto_702808 ?auto_702809 ) ) ( HOIST-AT ?auto_702806 ?auto_702808 ) ( LIFTING ?auto_702806 ?auto_702804 ) ( not ( = ?auto_702807 ?auto_702806 ) ) ( ON ?auto_702798 ?auto_702797 ) ( ON ?auto_702799 ?auto_702798 ) ( ON ?auto_702796 ?auto_702799 ) ( ON ?auto_702800 ?auto_702796 ) ( ON ?auto_702802 ?auto_702800 ) ( ON ?auto_702801 ?auto_702802 ) ( not ( = ?auto_702797 ?auto_702798 ) ) ( not ( = ?auto_702797 ?auto_702799 ) ) ( not ( = ?auto_702797 ?auto_702796 ) ) ( not ( = ?auto_702797 ?auto_702800 ) ) ( not ( = ?auto_702797 ?auto_702802 ) ) ( not ( = ?auto_702797 ?auto_702801 ) ) ( not ( = ?auto_702797 ?auto_702803 ) ) ( not ( = ?auto_702797 ?auto_702804 ) ) ( not ( = ?auto_702798 ?auto_702799 ) ) ( not ( = ?auto_702798 ?auto_702796 ) ) ( not ( = ?auto_702798 ?auto_702800 ) ) ( not ( = ?auto_702798 ?auto_702802 ) ) ( not ( = ?auto_702798 ?auto_702801 ) ) ( not ( = ?auto_702798 ?auto_702803 ) ) ( not ( = ?auto_702798 ?auto_702804 ) ) ( not ( = ?auto_702799 ?auto_702796 ) ) ( not ( = ?auto_702799 ?auto_702800 ) ) ( not ( = ?auto_702799 ?auto_702802 ) ) ( not ( = ?auto_702799 ?auto_702801 ) ) ( not ( = ?auto_702799 ?auto_702803 ) ) ( not ( = ?auto_702799 ?auto_702804 ) ) ( not ( = ?auto_702796 ?auto_702800 ) ) ( not ( = ?auto_702796 ?auto_702802 ) ) ( not ( = ?auto_702796 ?auto_702801 ) ) ( not ( = ?auto_702796 ?auto_702803 ) ) ( not ( = ?auto_702796 ?auto_702804 ) ) ( not ( = ?auto_702800 ?auto_702802 ) ) ( not ( = ?auto_702800 ?auto_702801 ) ) ( not ( = ?auto_702800 ?auto_702803 ) ) ( not ( = ?auto_702800 ?auto_702804 ) ) ( not ( = ?auto_702802 ?auto_702801 ) ) ( not ( = ?auto_702802 ?auto_702803 ) ) ( not ( = ?auto_702802 ?auto_702804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_702801 ?auto_702803 ?auto_702804 )
      ( MAKE-8CRATE-VERIFY ?auto_702797 ?auto_702798 ?auto_702799 ?auto_702796 ?auto_702800 ?auto_702802 ?auto_702801 ?auto_702803 ?auto_702804 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702889 - SURFACE
      ?auto_702890 - SURFACE
      ?auto_702891 - SURFACE
      ?auto_702888 - SURFACE
      ?auto_702892 - SURFACE
      ?auto_702894 - SURFACE
      ?auto_702893 - SURFACE
      ?auto_702895 - SURFACE
      ?auto_702896 - SURFACE
    )
    :vars
    (
      ?auto_702897 - HOIST
      ?auto_702900 - PLACE
      ?auto_702901 - TRUCK
      ?auto_702898 - PLACE
      ?auto_702899 - HOIST
      ?auto_702902 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_702897 ?auto_702900 ) ( SURFACE-AT ?auto_702895 ?auto_702900 ) ( CLEAR ?auto_702895 ) ( IS-CRATE ?auto_702896 ) ( not ( = ?auto_702895 ?auto_702896 ) ) ( AVAILABLE ?auto_702897 ) ( ON ?auto_702895 ?auto_702893 ) ( not ( = ?auto_702893 ?auto_702895 ) ) ( not ( = ?auto_702893 ?auto_702896 ) ) ( TRUCK-AT ?auto_702901 ?auto_702898 ) ( not ( = ?auto_702898 ?auto_702900 ) ) ( HOIST-AT ?auto_702899 ?auto_702898 ) ( not ( = ?auto_702897 ?auto_702899 ) ) ( AVAILABLE ?auto_702899 ) ( SURFACE-AT ?auto_702896 ?auto_702898 ) ( ON ?auto_702896 ?auto_702902 ) ( CLEAR ?auto_702896 ) ( not ( = ?auto_702895 ?auto_702902 ) ) ( not ( = ?auto_702896 ?auto_702902 ) ) ( not ( = ?auto_702893 ?auto_702902 ) ) ( ON ?auto_702890 ?auto_702889 ) ( ON ?auto_702891 ?auto_702890 ) ( ON ?auto_702888 ?auto_702891 ) ( ON ?auto_702892 ?auto_702888 ) ( ON ?auto_702894 ?auto_702892 ) ( ON ?auto_702893 ?auto_702894 ) ( not ( = ?auto_702889 ?auto_702890 ) ) ( not ( = ?auto_702889 ?auto_702891 ) ) ( not ( = ?auto_702889 ?auto_702888 ) ) ( not ( = ?auto_702889 ?auto_702892 ) ) ( not ( = ?auto_702889 ?auto_702894 ) ) ( not ( = ?auto_702889 ?auto_702893 ) ) ( not ( = ?auto_702889 ?auto_702895 ) ) ( not ( = ?auto_702889 ?auto_702896 ) ) ( not ( = ?auto_702889 ?auto_702902 ) ) ( not ( = ?auto_702890 ?auto_702891 ) ) ( not ( = ?auto_702890 ?auto_702888 ) ) ( not ( = ?auto_702890 ?auto_702892 ) ) ( not ( = ?auto_702890 ?auto_702894 ) ) ( not ( = ?auto_702890 ?auto_702893 ) ) ( not ( = ?auto_702890 ?auto_702895 ) ) ( not ( = ?auto_702890 ?auto_702896 ) ) ( not ( = ?auto_702890 ?auto_702902 ) ) ( not ( = ?auto_702891 ?auto_702888 ) ) ( not ( = ?auto_702891 ?auto_702892 ) ) ( not ( = ?auto_702891 ?auto_702894 ) ) ( not ( = ?auto_702891 ?auto_702893 ) ) ( not ( = ?auto_702891 ?auto_702895 ) ) ( not ( = ?auto_702891 ?auto_702896 ) ) ( not ( = ?auto_702891 ?auto_702902 ) ) ( not ( = ?auto_702888 ?auto_702892 ) ) ( not ( = ?auto_702888 ?auto_702894 ) ) ( not ( = ?auto_702888 ?auto_702893 ) ) ( not ( = ?auto_702888 ?auto_702895 ) ) ( not ( = ?auto_702888 ?auto_702896 ) ) ( not ( = ?auto_702888 ?auto_702902 ) ) ( not ( = ?auto_702892 ?auto_702894 ) ) ( not ( = ?auto_702892 ?auto_702893 ) ) ( not ( = ?auto_702892 ?auto_702895 ) ) ( not ( = ?auto_702892 ?auto_702896 ) ) ( not ( = ?auto_702892 ?auto_702902 ) ) ( not ( = ?auto_702894 ?auto_702893 ) ) ( not ( = ?auto_702894 ?auto_702895 ) ) ( not ( = ?auto_702894 ?auto_702896 ) ) ( not ( = ?auto_702894 ?auto_702902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_702893 ?auto_702895 ?auto_702896 )
      ( MAKE-8CRATE-VERIFY ?auto_702889 ?auto_702890 ?auto_702891 ?auto_702888 ?auto_702892 ?auto_702894 ?auto_702893 ?auto_702895 ?auto_702896 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702982 - SURFACE
      ?auto_702983 - SURFACE
      ?auto_702984 - SURFACE
      ?auto_702981 - SURFACE
      ?auto_702985 - SURFACE
      ?auto_702987 - SURFACE
      ?auto_702986 - SURFACE
      ?auto_702988 - SURFACE
      ?auto_702989 - SURFACE
    )
    :vars
    (
      ?auto_702990 - HOIST
      ?auto_702992 - PLACE
      ?auto_702993 - PLACE
      ?auto_702991 - HOIST
      ?auto_702994 - SURFACE
      ?auto_702995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_702990 ?auto_702992 ) ( SURFACE-AT ?auto_702988 ?auto_702992 ) ( CLEAR ?auto_702988 ) ( IS-CRATE ?auto_702989 ) ( not ( = ?auto_702988 ?auto_702989 ) ) ( AVAILABLE ?auto_702990 ) ( ON ?auto_702988 ?auto_702986 ) ( not ( = ?auto_702986 ?auto_702988 ) ) ( not ( = ?auto_702986 ?auto_702989 ) ) ( not ( = ?auto_702993 ?auto_702992 ) ) ( HOIST-AT ?auto_702991 ?auto_702993 ) ( not ( = ?auto_702990 ?auto_702991 ) ) ( AVAILABLE ?auto_702991 ) ( SURFACE-AT ?auto_702989 ?auto_702993 ) ( ON ?auto_702989 ?auto_702994 ) ( CLEAR ?auto_702989 ) ( not ( = ?auto_702988 ?auto_702994 ) ) ( not ( = ?auto_702989 ?auto_702994 ) ) ( not ( = ?auto_702986 ?auto_702994 ) ) ( TRUCK-AT ?auto_702995 ?auto_702992 ) ( ON ?auto_702983 ?auto_702982 ) ( ON ?auto_702984 ?auto_702983 ) ( ON ?auto_702981 ?auto_702984 ) ( ON ?auto_702985 ?auto_702981 ) ( ON ?auto_702987 ?auto_702985 ) ( ON ?auto_702986 ?auto_702987 ) ( not ( = ?auto_702982 ?auto_702983 ) ) ( not ( = ?auto_702982 ?auto_702984 ) ) ( not ( = ?auto_702982 ?auto_702981 ) ) ( not ( = ?auto_702982 ?auto_702985 ) ) ( not ( = ?auto_702982 ?auto_702987 ) ) ( not ( = ?auto_702982 ?auto_702986 ) ) ( not ( = ?auto_702982 ?auto_702988 ) ) ( not ( = ?auto_702982 ?auto_702989 ) ) ( not ( = ?auto_702982 ?auto_702994 ) ) ( not ( = ?auto_702983 ?auto_702984 ) ) ( not ( = ?auto_702983 ?auto_702981 ) ) ( not ( = ?auto_702983 ?auto_702985 ) ) ( not ( = ?auto_702983 ?auto_702987 ) ) ( not ( = ?auto_702983 ?auto_702986 ) ) ( not ( = ?auto_702983 ?auto_702988 ) ) ( not ( = ?auto_702983 ?auto_702989 ) ) ( not ( = ?auto_702983 ?auto_702994 ) ) ( not ( = ?auto_702984 ?auto_702981 ) ) ( not ( = ?auto_702984 ?auto_702985 ) ) ( not ( = ?auto_702984 ?auto_702987 ) ) ( not ( = ?auto_702984 ?auto_702986 ) ) ( not ( = ?auto_702984 ?auto_702988 ) ) ( not ( = ?auto_702984 ?auto_702989 ) ) ( not ( = ?auto_702984 ?auto_702994 ) ) ( not ( = ?auto_702981 ?auto_702985 ) ) ( not ( = ?auto_702981 ?auto_702987 ) ) ( not ( = ?auto_702981 ?auto_702986 ) ) ( not ( = ?auto_702981 ?auto_702988 ) ) ( not ( = ?auto_702981 ?auto_702989 ) ) ( not ( = ?auto_702981 ?auto_702994 ) ) ( not ( = ?auto_702985 ?auto_702987 ) ) ( not ( = ?auto_702985 ?auto_702986 ) ) ( not ( = ?auto_702985 ?auto_702988 ) ) ( not ( = ?auto_702985 ?auto_702989 ) ) ( not ( = ?auto_702985 ?auto_702994 ) ) ( not ( = ?auto_702987 ?auto_702986 ) ) ( not ( = ?auto_702987 ?auto_702988 ) ) ( not ( = ?auto_702987 ?auto_702989 ) ) ( not ( = ?auto_702987 ?auto_702994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_702986 ?auto_702988 ?auto_702989 )
      ( MAKE-8CRATE-VERIFY ?auto_702982 ?auto_702983 ?auto_702984 ?auto_702981 ?auto_702985 ?auto_702987 ?auto_702986 ?auto_702988 ?auto_702989 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_703075 - SURFACE
      ?auto_703076 - SURFACE
      ?auto_703077 - SURFACE
      ?auto_703074 - SURFACE
      ?auto_703078 - SURFACE
      ?auto_703080 - SURFACE
      ?auto_703079 - SURFACE
      ?auto_703081 - SURFACE
      ?auto_703082 - SURFACE
    )
    :vars
    (
      ?auto_703087 - HOIST
      ?auto_703086 - PLACE
      ?auto_703084 - PLACE
      ?auto_703083 - HOIST
      ?auto_703085 - SURFACE
      ?auto_703088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_703087 ?auto_703086 ) ( IS-CRATE ?auto_703082 ) ( not ( = ?auto_703081 ?auto_703082 ) ) ( not ( = ?auto_703079 ?auto_703081 ) ) ( not ( = ?auto_703079 ?auto_703082 ) ) ( not ( = ?auto_703084 ?auto_703086 ) ) ( HOIST-AT ?auto_703083 ?auto_703084 ) ( not ( = ?auto_703087 ?auto_703083 ) ) ( AVAILABLE ?auto_703083 ) ( SURFACE-AT ?auto_703082 ?auto_703084 ) ( ON ?auto_703082 ?auto_703085 ) ( CLEAR ?auto_703082 ) ( not ( = ?auto_703081 ?auto_703085 ) ) ( not ( = ?auto_703082 ?auto_703085 ) ) ( not ( = ?auto_703079 ?auto_703085 ) ) ( TRUCK-AT ?auto_703088 ?auto_703086 ) ( SURFACE-AT ?auto_703079 ?auto_703086 ) ( CLEAR ?auto_703079 ) ( LIFTING ?auto_703087 ?auto_703081 ) ( IS-CRATE ?auto_703081 ) ( ON ?auto_703076 ?auto_703075 ) ( ON ?auto_703077 ?auto_703076 ) ( ON ?auto_703074 ?auto_703077 ) ( ON ?auto_703078 ?auto_703074 ) ( ON ?auto_703080 ?auto_703078 ) ( ON ?auto_703079 ?auto_703080 ) ( not ( = ?auto_703075 ?auto_703076 ) ) ( not ( = ?auto_703075 ?auto_703077 ) ) ( not ( = ?auto_703075 ?auto_703074 ) ) ( not ( = ?auto_703075 ?auto_703078 ) ) ( not ( = ?auto_703075 ?auto_703080 ) ) ( not ( = ?auto_703075 ?auto_703079 ) ) ( not ( = ?auto_703075 ?auto_703081 ) ) ( not ( = ?auto_703075 ?auto_703082 ) ) ( not ( = ?auto_703075 ?auto_703085 ) ) ( not ( = ?auto_703076 ?auto_703077 ) ) ( not ( = ?auto_703076 ?auto_703074 ) ) ( not ( = ?auto_703076 ?auto_703078 ) ) ( not ( = ?auto_703076 ?auto_703080 ) ) ( not ( = ?auto_703076 ?auto_703079 ) ) ( not ( = ?auto_703076 ?auto_703081 ) ) ( not ( = ?auto_703076 ?auto_703082 ) ) ( not ( = ?auto_703076 ?auto_703085 ) ) ( not ( = ?auto_703077 ?auto_703074 ) ) ( not ( = ?auto_703077 ?auto_703078 ) ) ( not ( = ?auto_703077 ?auto_703080 ) ) ( not ( = ?auto_703077 ?auto_703079 ) ) ( not ( = ?auto_703077 ?auto_703081 ) ) ( not ( = ?auto_703077 ?auto_703082 ) ) ( not ( = ?auto_703077 ?auto_703085 ) ) ( not ( = ?auto_703074 ?auto_703078 ) ) ( not ( = ?auto_703074 ?auto_703080 ) ) ( not ( = ?auto_703074 ?auto_703079 ) ) ( not ( = ?auto_703074 ?auto_703081 ) ) ( not ( = ?auto_703074 ?auto_703082 ) ) ( not ( = ?auto_703074 ?auto_703085 ) ) ( not ( = ?auto_703078 ?auto_703080 ) ) ( not ( = ?auto_703078 ?auto_703079 ) ) ( not ( = ?auto_703078 ?auto_703081 ) ) ( not ( = ?auto_703078 ?auto_703082 ) ) ( not ( = ?auto_703078 ?auto_703085 ) ) ( not ( = ?auto_703080 ?auto_703079 ) ) ( not ( = ?auto_703080 ?auto_703081 ) ) ( not ( = ?auto_703080 ?auto_703082 ) ) ( not ( = ?auto_703080 ?auto_703085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_703079 ?auto_703081 ?auto_703082 )
      ( MAKE-8CRATE-VERIFY ?auto_703075 ?auto_703076 ?auto_703077 ?auto_703074 ?auto_703078 ?auto_703080 ?auto_703079 ?auto_703081 ?auto_703082 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_703168 - SURFACE
      ?auto_703169 - SURFACE
      ?auto_703170 - SURFACE
      ?auto_703167 - SURFACE
      ?auto_703171 - SURFACE
      ?auto_703173 - SURFACE
      ?auto_703172 - SURFACE
      ?auto_703174 - SURFACE
      ?auto_703175 - SURFACE
    )
    :vars
    (
      ?auto_703178 - HOIST
      ?auto_703177 - PLACE
      ?auto_703176 - PLACE
      ?auto_703180 - HOIST
      ?auto_703181 - SURFACE
      ?auto_703179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_703178 ?auto_703177 ) ( IS-CRATE ?auto_703175 ) ( not ( = ?auto_703174 ?auto_703175 ) ) ( not ( = ?auto_703172 ?auto_703174 ) ) ( not ( = ?auto_703172 ?auto_703175 ) ) ( not ( = ?auto_703176 ?auto_703177 ) ) ( HOIST-AT ?auto_703180 ?auto_703176 ) ( not ( = ?auto_703178 ?auto_703180 ) ) ( AVAILABLE ?auto_703180 ) ( SURFACE-AT ?auto_703175 ?auto_703176 ) ( ON ?auto_703175 ?auto_703181 ) ( CLEAR ?auto_703175 ) ( not ( = ?auto_703174 ?auto_703181 ) ) ( not ( = ?auto_703175 ?auto_703181 ) ) ( not ( = ?auto_703172 ?auto_703181 ) ) ( TRUCK-AT ?auto_703179 ?auto_703177 ) ( SURFACE-AT ?auto_703172 ?auto_703177 ) ( CLEAR ?auto_703172 ) ( IS-CRATE ?auto_703174 ) ( AVAILABLE ?auto_703178 ) ( IN ?auto_703174 ?auto_703179 ) ( ON ?auto_703169 ?auto_703168 ) ( ON ?auto_703170 ?auto_703169 ) ( ON ?auto_703167 ?auto_703170 ) ( ON ?auto_703171 ?auto_703167 ) ( ON ?auto_703173 ?auto_703171 ) ( ON ?auto_703172 ?auto_703173 ) ( not ( = ?auto_703168 ?auto_703169 ) ) ( not ( = ?auto_703168 ?auto_703170 ) ) ( not ( = ?auto_703168 ?auto_703167 ) ) ( not ( = ?auto_703168 ?auto_703171 ) ) ( not ( = ?auto_703168 ?auto_703173 ) ) ( not ( = ?auto_703168 ?auto_703172 ) ) ( not ( = ?auto_703168 ?auto_703174 ) ) ( not ( = ?auto_703168 ?auto_703175 ) ) ( not ( = ?auto_703168 ?auto_703181 ) ) ( not ( = ?auto_703169 ?auto_703170 ) ) ( not ( = ?auto_703169 ?auto_703167 ) ) ( not ( = ?auto_703169 ?auto_703171 ) ) ( not ( = ?auto_703169 ?auto_703173 ) ) ( not ( = ?auto_703169 ?auto_703172 ) ) ( not ( = ?auto_703169 ?auto_703174 ) ) ( not ( = ?auto_703169 ?auto_703175 ) ) ( not ( = ?auto_703169 ?auto_703181 ) ) ( not ( = ?auto_703170 ?auto_703167 ) ) ( not ( = ?auto_703170 ?auto_703171 ) ) ( not ( = ?auto_703170 ?auto_703173 ) ) ( not ( = ?auto_703170 ?auto_703172 ) ) ( not ( = ?auto_703170 ?auto_703174 ) ) ( not ( = ?auto_703170 ?auto_703175 ) ) ( not ( = ?auto_703170 ?auto_703181 ) ) ( not ( = ?auto_703167 ?auto_703171 ) ) ( not ( = ?auto_703167 ?auto_703173 ) ) ( not ( = ?auto_703167 ?auto_703172 ) ) ( not ( = ?auto_703167 ?auto_703174 ) ) ( not ( = ?auto_703167 ?auto_703175 ) ) ( not ( = ?auto_703167 ?auto_703181 ) ) ( not ( = ?auto_703171 ?auto_703173 ) ) ( not ( = ?auto_703171 ?auto_703172 ) ) ( not ( = ?auto_703171 ?auto_703174 ) ) ( not ( = ?auto_703171 ?auto_703175 ) ) ( not ( = ?auto_703171 ?auto_703181 ) ) ( not ( = ?auto_703173 ?auto_703172 ) ) ( not ( = ?auto_703173 ?auto_703174 ) ) ( not ( = ?auto_703173 ?auto_703175 ) ) ( not ( = ?auto_703173 ?auto_703181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_703172 ?auto_703174 ?auto_703175 )
      ( MAKE-8CRATE-VERIFY ?auto_703168 ?auto_703169 ?auto_703170 ?auto_703167 ?auto_703171 ?auto_703173 ?auto_703172 ?auto_703174 ?auto_703175 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707284 - SURFACE
      ?auto_707285 - SURFACE
      ?auto_707286 - SURFACE
      ?auto_707283 - SURFACE
      ?auto_707287 - SURFACE
      ?auto_707289 - SURFACE
      ?auto_707288 - SURFACE
      ?auto_707290 - SURFACE
      ?auto_707291 - SURFACE
      ?auto_707292 - SURFACE
    )
    :vars
    (
      ?auto_707294 - HOIST
      ?auto_707293 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_707294 ?auto_707293 ) ( SURFACE-AT ?auto_707291 ?auto_707293 ) ( CLEAR ?auto_707291 ) ( LIFTING ?auto_707294 ?auto_707292 ) ( IS-CRATE ?auto_707292 ) ( not ( = ?auto_707291 ?auto_707292 ) ) ( ON ?auto_707285 ?auto_707284 ) ( ON ?auto_707286 ?auto_707285 ) ( ON ?auto_707283 ?auto_707286 ) ( ON ?auto_707287 ?auto_707283 ) ( ON ?auto_707289 ?auto_707287 ) ( ON ?auto_707288 ?auto_707289 ) ( ON ?auto_707290 ?auto_707288 ) ( ON ?auto_707291 ?auto_707290 ) ( not ( = ?auto_707284 ?auto_707285 ) ) ( not ( = ?auto_707284 ?auto_707286 ) ) ( not ( = ?auto_707284 ?auto_707283 ) ) ( not ( = ?auto_707284 ?auto_707287 ) ) ( not ( = ?auto_707284 ?auto_707289 ) ) ( not ( = ?auto_707284 ?auto_707288 ) ) ( not ( = ?auto_707284 ?auto_707290 ) ) ( not ( = ?auto_707284 ?auto_707291 ) ) ( not ( = ?auto_707284 ?auto_707292 ) ) ( not ( = ?auto_707285 ?auto_707286 ) ) ( not ( = ?auto_707285 ?auto_707283 ) ) ( not ( = ?auto_707285 ?auto_707287 ) ) ( not ( = ?auto_707285 ?auto_707289 ) ) ( not ( = ?auto_707285 ?auto_707288 ) ) ( not ( = ?auto_707285 ?auto_707290 ) ) ( not ( = ?auto_707285 ?auto_707291 ) ) ( not ( = ?auto_707285 ?auto_707292 ) ) ( not ( = ?auto_707286 ?auto_707283 ) ) ( not ( = ?auto_707286 ?auto_707287 ) ) ( not ( = ?auto_707286 ?auto_707289 ) ) ( not ( = ?auto_707286 ?auto_707288 ) ) ( not ( = ?auto_707286 ?auto_707290 ) ) ( not ( = ?auto_707286 ?auto_707291 ) ) ( not ( = ?auto_707286 ?auto_707292 ) ) ( not ( = ?auto_707283 ?auto_707287 ) ) ( not ( = ?auto_707283 ?auto_707289 ) ) ( not ( = ?auto_707283 ?auto_707288 ) ) ( not ( = ?auto_707283 ?auto_707290 ) ) ( not ( = ?auto_707283 ?auto_707291 ) ) ( not ( = ?auto_707283 ?auto_707292 ) ) ( not ( = ?auto_707287 ?auto_707289 ) ) ( not ( = ?auto_707287 ?auto_707288 ) ) ( not ( = ?auto_707287 ?auto_707290 ) ) ( not ( = ?auto_707287 ?auto_707291 ) ) ( not ( = ?auto_707287 ?auto_707292 ) ) ( not ( = ?auto_707289 ?auto_707288 ) ) ( not ( = ?auto_707289 ?auto_707290 ) ) ( not ( = ?auto_707289 ?auto_707291 ) ) ( not ( = ?auto_707289 ?auto_707292 ) ) ( not ( = ?auto_707288 ?auto_707290 ) ) ( not ( = ?auto_707288 ?auto_707291 ) ) ( not ( = ?auto_707288 ?auto_707292 ) ) ( not ( = ?auto_707290 ?auto_707291 ) ) ( not ( = ?auto_707290 ?auto_707292 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_707291 ?auto_707292 )
      ( MAKE-9CRATE-VERIFY ?auto_707284 ?auto_707285 ?auto_707286 ?auto_707283 ?auto_707287 ?auto_707289 ?auto_707288 ?auto_707290 ?auto_707291 ?auto_707292 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707364 - SURFACE
      ?auto_707365 - SURFACE
      ?auto_707366 - SURFACE
      ?auto_707363 - SURFACE
      ?auto_707367 - SURFACE
      ?auto_707369 - SURFACE
      ?auto_707368 - SURFACE
      ?auto_707370 - SURFACE
      ?auto_707371 - SURFACE
      ?auto_707372 - SURFACE
    )
    :vars
    (
      ?auto_707374 - HOIST
      ?auto_707375 - PLACE
      ?auto_707373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_707374 ?auto_707375 ) ( SURFACE-AT ?auto_707371 ?auto_707375 ) ( CLEAR ?auto_707371 ) ( IS-CRATE ?auto_707372 ) ( not ( = ?auto_707371 ?auto_707372 ) ) ( TRUCK-AT ?auto_707373 ?auto_707375 ) ( AVAILABLE ?auto_707374 ) ( IN ?auto_707372 ?auto_707373 ) ( ON ?auto_707371 ?auto_707370 ) ( not ( = ?auto_707370 ?auto_707371 ) ) ( not ( = ?auto_707370 ?auto_707372 ) ) ( ON ?auto_707365 ?auto_707364 ) ( ON ?auto_707366 ?auto_707365 ) ( ON ?auto_707363 ?auto_707366 ) ( ON ?auto_707367 ?auto_707363 ) ( ON ?auto_707369 ?auto_707367 ) ( ON ?auto_707368 ?auto_707369 ) ( ON ?auto_707370 ?auto_707368 ) ( not ( = ?auto_707364 ?auto_707365 ) ) ( not ( = ?auto_707364 ?auto_707366 ) ) ( not ( = ?auto_707364 ?auto_707363 ) ) ( not ( = ?auto_707364 ?auto_707367 ) ) ( not ( = ?auto_707364 ?auto_707369 ) ) ( not ( = ?auto_707364 ?auto_707368 ) ) ( not ( = ?auto_707364 ?auto_707370 ) ) ( not ( = ?auto_707364 ?auto_707371 ) ) ( not ( = ?auto_707364 ?auto_707372 ) ) ( not ( = ?auto_707365 ?auto_707366 ) ) ( not ( = ?auto_707365 ?auto_707363 ) ) ( not ( = ?auto_707365 ?auto_707367 ) ) ( not ( = ?auto_707365 ?auto_707369 ) ) ( not ( = ?auto_707365 ?auto_707368 ) ) ( not ( = ?auto_707365 ?auto_707370 ) ) ( not ( = ?auto_707365 ?auto_707371 ) ) ( not ( = ?auto_707365 ?auto_707372 ) ) ( not ( = ?auto_707366 ?auto_707363 ) ) ( not ( = ?auto_707366 ?auto_707367 ) ) ( not ( = ?auto_707366 ?auto_707369 ) ) ( not ( = ?auto_707366 ?auto_707368 ) ) ( not ( = ?auto_707366 ?auto_707370 ) ) ( not ( = ?auto_707366 ?auto_707371 ) ) ( not ( = ?auto_707366 ?auto_707372 ) ) ( not ( = ?auto_707363 ?auto_707367 ) ) ( not ( = ?auto_707363 ?auto_707369 ) ) ( not ( = ?auto_707363 ?auto_707368 ) ) ( not ( = ?auto_707363 ?auto_707370 ) ) ( not ( = ?auto_707363 ?auto_707371 ) ) ( not ( = ?auto_707363 ?auto_707372 ) ) ( not ( = ?auto_707367 ?auto_707369 ) ) ( not ( = ?auto_707367 ?auto_707368 ) ) ( not ( = ?auto_707367 ?auto_707370 ) ) ( not ( = ?auto_707367 ?auto_707371 ) ) ( not ( = ?auto_707367 ?auto_707372 ) ) ( not ( = ?auto_707369 ?auto_707368 ) ) ( not ( = ?auto_707369 ?auto_707370 ) ) ( not ( = ?auto_707369 ?auto_707371 ) ) ( not ( = ?auto_707369 ?auto_707372 ) ) ( not ( = ?auto_707368 ?auto_707370 ) ) ( not ( = ?auto_707368 ?auto_707371 ) ) ( not ( = ?auto_707368 ?auto_707372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707370 ?auto_707371 ?auto_707372 )
      ( MAKE-9CRATE-VERIFY ?auto_707364 ?auto_707365 ?auto_707366 ?auto_707363 ?auto_707367 ?auto_707369 ?auto_707368 ?auto_707370 ?auto_707371 ?auto_707372 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707454 - SURFACE
      ?auto_707455 - SURFACE
      ?auto_707456 - SURFACE
      ?auto_707453 - SURFACE
      ?auto_707457 - SURFACE
      ?auto_707459 - SURFACE
      ?auto_707458 - SURFACE
      ?auto_707460 - SURFACE
      ?auto_707461 - SURFACE
      ?auto_707462 - SURFACE
    )
    :vars
    (
      ?auto_707465 - HOIST
      ?auto_707464 - PLACE
      ?auto_707463 - TRUCK
      ?auto_707466 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_707465 ?auto_707464 ) ( SURFACE-AT ?auto_707461 ?auto_707464 ) ( CLEAR ?auto_707461 ) ( IS-CRATE ?auto_707462 ) ( not ( = ?auto_707461 ?auto_707462 ) ) ( AVAILABLE ?auto_707465 ) ( IN ?auto_707462 ?auto_707463 ) ( ON ?auto_707461 ?auto_707460 ) ( not ( = ?auto_707460 ?auto_707461 ) ) ( not ( = ?auto_707460 ?auto_707462 ) ) ( TRUCK-AT ?auto_707463 ?auto_707466 ) ( not ( = ?auto_707466 ?auto_707464 ) ) ( ON ?auto_707455 ?auto_707454 ) ( ON ?auto_707456 ?auto_707455 ) ( ON ?auto_707453 ?auto_707456 ) ( ON ?auto_707457 ?auto_707453 ) ( ON ?auto_707459 ?auto_707457 ) ( ON ?auto_707458 ?auto_707459 ) ( ON ?auto_707460 ?auto_707458 ) ( not ( = ?auto_707454 ?auto_707455 ) ) ( not ( = ?auto_707454 ?auto_707456 ) ) ( not ( = ?auto_707454 ?auto_707453 ) ) ( not ( = ?auto_707454 ?auto_707457 ) ) ( not ( = ?auto_707454 ?auto_707459 ) ) ( not ( = ?auto_707454 ?auto_707458 ) ) ( not ( = ?auto_707454 ?auto_707460 ) ) ( not ( = ?auto_707454 ?auto_707461 ) ) ( not ( = ?auto_707454 ?auto_707462 ) ) ( not ( = ?auto_707455 ?auto_707456 ) ) ( not ( = ?auto_707455 ?auto_707453 ) ) ( not ( = ?auto_707455 ?auto_707457 ) ) ( not ( = ?auto_707455 ?auto_707459 ) ) ( not ( = ?auto_707455 ?auto_707458 ) ) ( not ( = ?auto_707455 ?auto_707460 ) ) ( not ( = ?auto_707455 ?auto_707461 ) ) ( not ( = ?auto_707455 ?auto_707462 ) ) ( not ( = ?auto_707456 ?auto_707453 ) ) ( not ( = ?auto_707456 ?auto_707457 ) ) ( not ( = ?auto_707456 ?auto_707459 ) ) ( not ( = ?auto_707456 ?auto_707458 ) ) ( not ( = ?auto_707456 ?auto_707460 ) ) ( not ( = ?auto_707456 ?auto_707461 ) ) ( not ( = ?auto_707456 ?auto_707462 ) ) ( not ( = ?auto_707453 ?auto_707457 ) ) ( not ( = ?auto_707453 ?auto_707459 ) ) ( not ( = ?auto_707453 ?auto_707458 ) ) ( not ( = ?auto_707453 ?auto_707460 ) ) ( not ( = ?auto_707453 ?auto_707461 ) ) ( not ( = ?auto_707453 ?auto_707462 ) ) ( not ( = ?auto_707457 ?auto_707459 ) ) ( not ( = ?auto_707457 ?auto_707458 ) ) ( not ( = ?auto_707457 ?auto_707460 ) ) ( not ( = ?auto_707457 ?auto_707461 ) ) ( not ( = ?auto_707457 ?auto_707462 ) ) ( not ( = ?auto_707459 ?auto_707458 ) ) ( not ( = ?auto_707459 ?auto_707460 ) ) ( not ( = ?auto_707459 ?auto_707461 ) ) ( not ( = ?auto_707459 ?auto_707462 ) ) ( not ( = ?auto_707458 ?auto_707460 ) ) ( not ( = ?auto_707458 ?auto_707461 ) ) ( not ( = ?auto_707458 ?auto_707462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707460 ?auto_707461 ?auto_707462 )
      ( MAKE-9CRATE-VERIFY ?auto_707454 ?auto_707455 ?auto_707456 ?auto_707453 ?auto_707457 ?auto_707459 ?auto_707458 ?auto_707460 ?auto_707461 ?auto_707462 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707553 - SURFACE
      ?auto_707554 - SURFACE
      ?auto_707555 - SURFACE
      ?auto_707552 - SURFACE
      ?auto_707556 - SURFACE
      ?auto_707558 - SURFACE
      ?auto_707557 - SURFACE
      ?auto_707559 - SURFACE
      ?auto_707560 - SURFACE
      ?auto_707561 - SURFACE
    )
    :vars
    (
      ?auto_707564 - HOIST
      ?auto_707566 - PLACE
      ?auto_707565 - TRUCK
      ?auto_707563 - PLACE
      ?auto_707562 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_707564 ?auto_707566 ) ( SURFACE-AT ?auto_707560 ?auto_707566 ) ( CLEAR ?auto_707560 ) ( IS-CRATE ?auto_707561 ) ( not ( = ?auto_707560 ?auto_707561 ) ) ( AVAILABLE ?auto_707564 ) ( ON ?auto_707560 ?auto_707559 ) ( not ( = ?auto_707559 ?auto_707560 ) ) ( not ( = ?auto_707559 ?auto_707561 ) ) ( TRUCK-AT ?auto_707565 ?auto_707563 ) ( not ( = ?auto_707563 ?auto_707566 ) ) ( HOIST-AT ?auto_707562 ?auto_707563 ) ( LIFTING ?auto_707562 ?auto_707561 ) ( not ( = ?auto_707564 ?auto_707562 ) ) ( ON ?auto_707554 ?auto_707553 ) ( ON ?auto_707555 ?auto_707554 ) ( ON ?auto_707552 ?auto_707555 ) ( ON ?auto_707556 ?auto_707552 ) ( ON ?auto_707558 ?auto_707556 ) ( ON ?auto_707557 ?auto_707558 ) ( ON ?auto_707559 ?auto_707557 ) ( not ( = ?auto_707553 ?auto_707554 ) ) ( not ( = ?auto_707553 ?auto_707555 ) ) ( not ( = ?auto_707553 ?auto_707552 ) ) ( not ( = ?auto_707553 ?auto_707556 ) ) ( not ( = ?auto_707553 ?auto_707558 ) ) ( not ( = ?auto_707553 ?auto_707557 ) ) ( not ( = ?auto_707553 ?auto_707559 ) ) ( not ( = ?auto_707553 ?auto_707560 ) ) ( not ( = ?auto_707553 ?auto_707561 ) ) ( not ( = ?auto_707554 ?auto_707555 ) ) ( not ( = ?auto_707554 ?auto_707552 ) ) ( not ( = ?auto_707554 ?auto_707556 ) ) ( not ( = ?auto_707554 ?auto_707558 ) ) ( not ( = ?auto_707554 ?auto_707557 ) ) ( not ( = ?auto_707554 ?auto_707559 ) ) ( not ( = ?auto_707554 ?auto_707560 ) ) ( not ( = ?auto_707554 ?auto_707561 ) ) ( not ( = ?auto_707555 ?auto_707552 ) ) ( not ( = ?auto_707555 ?auto_707556 ) ) ( not ( = ?auto_707555 ?auto_707558 ) ) ( not ( = ?auto_707555 ?auto_707557 ) ) ( not ( = ?auto_707555 ?auto_707559 ) ) ( not ( = ?auto_707555 ?auto_707560 ) ) ( not ( = ?auto_707555 ?auto_707561 ) ) ( not ( = ?auto_707552 ?auto_707556 ) ) ( not ( = ?auto_707552 ?auto_707558 ) ) ( not ( = ?auto_707552 ?auto_707557 ) ) ( not ( = ?auto_707552 ?auto_707559 ) ) ( not ( = ?auto_707552 ?auto_707560 ) ) ( not ( = ?auto_707552 ?auto_707561 ) ) ( not ( = ?auto_707556 ?auto_707558 ) ) ( not ( = ?auto_707556 ?auto_707557 ) ) ( not ( = ?auto_707556 ?auto_707559 ) ) ( not ( = ?auto_707556 ?auto_707560 ) ) ( not ( = ?auto_707556 ?auto_707561 ) ) ( not ( = ?auto_707558 ?auto_707557 ) ) ( not ( = ?auto_707558 ?auto_707559 ) ) ( not ( = ?auto_707558 ?auto_707560 ) ) ( not ( = ?auto_707558 ?auto_707561 ) ) ( not ( = ?auto_707557 ?auto_707559 ) ) ( not ( = ?auto_707557 ?auto_707560 ) ) ( not ( = ?auto_707557 ?auto_707561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707559 ?auto_707560 ?auto_707561 )
      ( MAKE-9CRATE-VERIFY ?auto_707553 ?auto_707554 ?auto_707555 ?auto_707552 ?auto_707556 ?auto_707558 ?auto_707557 ?auto_707559 ?auto_707560 ?auto_707561 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707661 - SURFACE
      ?auto_707662 - SURFACE
      ?auto_707663 - SURFACE
      ?auto_707660 - SURFACE
      ?auto_707664 - SURFACE
      ?auto_707666 - SURFACE
      ?auto_707665 - SURFACE
      ?auto_707667 - SURFACE
      ?auto_707668 - SURFACE
      ?auto_707669 - SURFACE
    )
    :vars
    (
      ?auto_707672 - HOIST
      ?auto_707675 - PLACE
      ?auto_707674 - TRUCK
      ?auto_707673 - PLACE
      ?auto_707671 - HOIST
      ?auto_707670 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_707672 ?auto_707675 ) ( SURFACE-AT ?auto_707668 ?auto_707675 ) ( CLEAR ?auto_707668 ) ( IS-CRATE ?auto_707669 ) ( not ( = ?auto_707668 ?auto_707669 ) ) ( AVAILABLE ?auto_707672 ) ( ON ?auto_707668 ?auto_707667 ) ( not ( = ?auto_707667 ?auto_707668 ) ) ( not ( = ?auto_707667 ?auto_707669 ) ) ( TRUCK-AT ?auto_707674 ?auto_707673 ) ( not ( = ?auto_707673 ?auto_707675 ) ) ( HOIST-AT ?auto_707671 ?auto_707673 ) ( not ( = ?auto_707672 ?auto_707671 ) ) ( AVAILABLE ?auto_707671 ) ( SURFACE-AT ?auto_707669 ?auto_707673 ) ( ON ?auto_707669 ?auto_707670 ) ( CLEAR ?auto_707669 ) ( not ( = ?auto_707668 ?auto_707670 ) ) ( not ( = ?auto_707669 ?auto_707670 ) ) ( not ( = ?auto_707667 ?auto_707670 ) ) ( ON ?auto_707662 ?auto_707661 ) ( ON ?auto_707663 ?auto_707662 ) ( ON ?auto_707660 ?auto_707663 ) ( ON ?auto_707664 ?auto_707660 ) ( ON ?auto_707666 ?auto_707664 ) ( ON ?auto_707665 ?auto_707666 ) ( ON ?auto_707667 ?auto_707665 ) ( not ( = ?auto_707661 ?auto_707662 ) ) ( not ( = ?auto_707661 ?auto_707663 ) ) ( not ( = ?auto_707661 ?auto_707660 ) ) ( not ( = ?auto_707661 ?auto_707664 ) ) ( not ( = ?auto_707661 ?auto_707666 ) ) ( not ( = ?auto_707661 ?auto_707665 ) ) ( not ( = ?auto_707661 ?auto_707667 ) ) ( not ( = ?auto_707661 ?auto_707668 ) ) ( not ( = ?auto_707661 ?auto_707669 ) ) ( not ( = ?auto_707661 ?auto_707670 ) ) ( not ( = ?auto_707662 ?auto_707663 ) ) ( not ( = ?auto_707662 ?auto_707660 ) ) ( not ( = ?auto_707662 ?auto_707664 ) ) ( not ( = ?auto_707662 ?auto_707666 ) ) ( not ( = ?auto_707662 ?auto_707665 ) ) ( not ( = ?auto_707662 ?auto_707667 ) ) ( not ( = ?auto_707662 ?auto_707668 ) ) ( not ( = ?auto_707662 ?auto_707669 ) ) ( not ( = ?auto_707662 ?auto_707670 ) ) ( not ( = ?auto_707663 ?auto_707660 ) ) ( not ( = ?auto_707663 ?auto_707664 ) ) ( not ( = ?auto_707663 ?auto_707666 ) ) ( not ( = ?auto_707663 ?auto_707665 ) ) ( not ( = ?auto_707663 ?auto_707667 ) ) ( not ( = ?auto_707663 ?auto_707668 ) ) ( not ( = ?auto_707663 ?auto_707669 ) ) ( not ( = ?auto_707663 ?auto_707670 ) ) ( not ( = ?auto_707660 ?auto_707664 ) ) ( not ( = ?auto_707660 ?auto_707666 ) ) ( not ( = ?auto_707660 ?auto_707665 ) ) ( not ( = ?auto_707660 ?auto_707667 ) ) ( not ( = ?auto_707660 ?auto_707668 ) ) ( not ( = ?auto_707660 ?auto_707669 ) ) ( not ( = ?auto_707660 ?auto_707670 ) ) ( not ( = ?auto_707664 ?auto_707666 ) ) ( not ( = ?auto_707664 ?auto_707665 ) ) ( not ( = ?auto_707664 ?auto_707667 ) ) ( not ( = ?auto_707664 ?auto_707668 ) ) ( not ( = ?auto_707664 ?auto_707669 ) ) ( not ( = ?auto_707664 ?auto_707670 ) ) ( not ( = ?auto_707666 ?auto_707665 ) ) ( not ( = ?auto_707666 ?auto_707667 ) ) ( not ( = ?auto_707666 ?auto_707668 ) ) ( not ( = ?auto_707666 ?auto_707669 ) ) ( not ( = ?auto_707666 ?auto_707670 ) ) ( not ( = ?auto_707665 ?auto_707667 ) ) ( not ( = ?auto_707665 ?auto_707668 ) ) ( not ( = ?auto_707665 ?auto_707669 ) ) ( not ( = ?auto_707665 ?auto_707670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707667 ?auto_707668 ?auto_707669 )
      ( MAKE-9CRATE-VERIFY ?auto_707661 ?auto_707662 ?auto_707663 ?auto_707660 ?auto_707664 ?auto_707666 ?auto_707665 ?auto_707667 ?auto_707668 ?auto_707669 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707770 - SURFACE
      ?auto_707771 - SURFACE
      ?auto_707772 - SURFACE
      ?auto_707769 - SURFACE
      ?auto_707773 - SURFACE
      ?auto_707775 - SURFACE
      ?auto_707774 - SURFACE
      ?auto_707776 - SURFACE
      ?auto_707777 - SURFACE
      ?auto_707778 - SURFACE
    )
    :vars
    (
      ?auto_707781 - HOIST
      ?auto_707779 - PLACE
      ?auto_707783 - PLACE
      ?auto_707782 - HOIST
      ?auto_707784 - SURFACE
      ?auto_707780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_707781 ?auto_707779 ) ( SURFACE-AT ?auto_707777 ?auto_707779 ) ( CLEAR ?auto_707777 ) ( IS-CRATE ?auto_707778 ) ( not ( = ?auto_707777 ?auto_707778 ) ) ( AVAILABLE ?auto_707781 ) ( ON ?auto_707777 ?auto_707776 ) ( not ( = ?auto_707776 ?auto_707777 ) ) ( not ( = ?auto_707776 ?auto_707778 ) ) ( not ( = ?auto_707783 ?auto_707779 ) ) ( HOIST-AT ?auto_707782 ?auto_707783 ) ( not ( = ?auto_707781 ?auto_707782 ) ) ( AVAILABLE ?auto_707782 ) ( SURFACE-AT ?auto_707778 ?auto_707783 ) ( ON ?auto_707778 ?auto_707784 ) ( CLEAR ?auto_707778 ) ( not ( = ?auto_707777 ?auto_707784 ) ) ( not ( = ?auto_707778 ?auto_707784 ) ) ( not ( = ?auto_707776 ?auto_707784 ) ) ( TRUCK-AT ?auto_707780 ?auto_707779 ) ( ON ?auto_707771 ?auto_707770 ) ( ON ?auto_707772 ?auto_707771 ) ( ON ?auto_707769 ?auto_707772 ) ( ON ?auto_707773 ?auto_707769 ) ( ON ?auto_707775 ?auto_707773 ) ( ON ?auto_707774 ?auto_707775 ) ( ON ?auto_707776 ?auto_707774 ) ( not ( = ?auto_707770 ?auto_707771 ) ) ( not ( = ?auto_707770 ?auto_707772 ) ) ( not ( = ?auto_707770 ?auto_707769 ) ) ( not ( = ?auto_707770 ?auto_707773 ) ) ( not ( = ?auto_707770 ?auto_707775 ) ) ( not ( = ?auto_707770 ?auto_707774 ) ) ( not ( = ?auto_707770 ?auto_707776 ) ) ( not ( = ?auto_707770 ?auto_707777 ) ) ( not ( = ?auto_707770 ?auto_707778 ) ) ( not ( = ?auto_707770 ?auto_707784 ) ) ( not ( = ?auto_707771 ?auto_707772 ) ) ( not ( = ?auto_707771 ?auto_707769 ) ) ( not ( = ?auto_707771 ?auto_707773 ) ) ( not ( = ?auto_707771 ?auto_707775 ) ) ( not ( = ?auto_707771 ?auto_707774 ) ) ( not ( = ?auto_707771 ?auto_707776 ) ) ( not ( = ?auto_707771 ?auto_707777 ) ) ( not ( = ?auto_707771 ?auto_707778 ) ) ( not ( = ?auto_707771 ?auto_707784 ) ) ( not ( = ?auto_707772 ?auto_707769 ) ) ( not ( = ?auto_707772 ?auto_707773 ) ) ( not ( = ?auto_707772 ?auto_707775 ) ) ( not ( = ?auto_707772 ?auto_707774 ) ) ( not ( = ?auto_707772 ?auto_707776 ) ) ( not ( = ?auto_707772 ?auto_707777 ) ) ( not ( = ?auto_707772 ?auto_707778 ) ) ( not ( = ?auto_707772 ?auto_707784 ) ) ( not ( = ?auto_707769 ?auto_707773 ) ) ( not ( = ?auto_707769 ?auto_707775 ) ) ( not ( = ?auto_707769 ?auto_707774 ) ) ( not ( = ?auto_707769 ?auto_707776 ) ) ( not ( = ?auto_707769 ?auto_707777 ) ) ( not ( = ?auto_707769 ?auto_707778 ) ) ( not ( = ?auto_707769 ?auto_707784 ) ) ( not ( = ?auto_707773 ?auto_707775 ) ) ( not ( = ?auto_707773 ?auto_707774 ) ) ( not ( = ?auto_707773 ?auto_707776 ) ) ( not ( = ?auto_707773 ?auto_707777 ) ) ( not ( = ?auto_707773 ?auto_707778 ) ) ( not ( = ?auto_707773 ?auto_707784 ) ) ( not ( = ?auto_707775 ?auto_707774 ) ) ( not ( = ?auto_707775 ?auto_707776 ) ) ( not ( = ?auto_707775 ?auto_707777 ) ) ( not ( = ?auto_707775 ?auto_707778 ) ) ( not ( = ?auto_707775 ?auto_707784 ) ) ( not ( = ?auto_707774 ?auto_707776 ) ) ( not ( = ?auto_707774 ?auto_707777 ) ) ( not ( = ?auto_707774 ?auto_707778 ) ) ( not ( = ?auto_707774 ?auto_707784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707776 ?auto_707777 ?auto_707778 )
      ( MAKE-9CRATE-VERIFY ?auto_707770 ?auto_707771 ?auto_707772 ?auto_707769 ?auto_707773 ?auto_707775 ?auto_707774 ?auto_707776 ?auto_707777 ?auto_707778 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707879 - SURFACE
      ?auto_707880 - SURFACE
      ?auto_707881 - SURFACE
      ?auto_707878 - SURFACE
      ?auto_707882 - SURFACE
      ?auto_707884 - SURFACE
      ?auto_707883 - SURFACE
      ?auto_707885 - SURFACE
      ?auto_707886 - SURFACE
      ?auto_707887 - SURFACE
    )
    :vars
    (
      ?auto_707891 - HOIST
      ?auto_707892 - PLACE
      ?auto_707893 - PLACE
      ?auto_707888 - HOIST
      ?auto_707889 - SURFACE
      ?auto_707890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_707891 ?auto_707892 ) ( IS-CRATE ?auto_707887 ) ( not ( = ?auto_707886 ?auto_707887 ) ) ( not ( = ?auto_707885 ?auto_707886 ) ) ( not ( = ?auto_707885 ?auto_707887 ) ) ( not ( = ?auto_707893 ?auto_707892 ) ) ( HOIST-AT ?auto_707888 ?auto_707893 ) ( not ( = ?auto_707891 ?auto_707888 ) ) ( AVAILABLE ?auto_707888 ) ( SURFACE-AT ?auto_707887 ?auto_707893 ) ( ON ?auto_707887 ?auto_707889 ) ( CLEAR ?auto_707887 ) ( not ( = ?auto_707886 ?auto_707889 ) ) ( not ( = ?auto_707887 ?auto_707889 ) ) ( not ( = ?auto_707885 ?auto_707889 ) ) ( TRUCK-AT ?auto_707890 ?auto_707892 ) ( SURFACE-AT ?auto_707885 ?auto_707892 ) ( CLEAR ?auto_707885 ) ( LIFTING ?auto_707891 ?auto_707886 ) ( IS-CRATE ?auto_707886 ) ( ON ?auto_707880 ?auto_707879 ) ( ON ?auto_707881 ?auto_707880 ) ( ON ?auto_707878 ?auto_707881 ) ( ON ?auto_707882 ?auto_707878 ) ( ON ?auto_707884 ?auto_707882 ) ( ON ?auto_707883 ?auto_707884 ) ( ON ?auto_707885 ?auto_707883 ) ( not ( = ?auto_707879 ?auto_707880 ) ) ( not ( = ?auto_707879 ?auto_707881 ) ) ( not ( = ?auto_707879 ?auto_707878 ) ) ( not ( = ?auto_707879 ?auto_707882 ) ) ( not ( = ?auto_707879 ?auto_707884 ) ) ( not ( = ?auto_707879 ?auto_707883 ) ) ( not ( = ?auto_707879 ?auto_707885 ) ) ( not ( = ?auto_707879 ?auto_707886 ) ) ( not ( = ?auto_707879 ?auto_707887 ) ) ( not ( = ?auto_707879 ?auto_707889 ) ) ( not ( = ?auto_707880 ?auto_707881 ) ) ( not ( = ?auto_707880 ?auto_707878 ) ) ( not ( = ?auto_707880 ?auto_707882 ) ) ( not ( = ?auto_707880 ?auto_707884 ) ) ( not ( = ?auto_707880 ?auto_707883 ) ) ( not ( = ?auto_707880 ?auto_707885 ) ) ( not ( = ?auto_707880 ?auto_707886 ) ) ( not ( = ?auto_707880 ?auto_707887 ) ) ( not ( = ?auto_707880 ?auto_707889 ) ) ( not ( = ?auto_707881 ?auto_707878 ) ) ( not ( = ?auto_707881 ?auto_707882 ) ) ( not ( = ?auto_707881 ?auto_707884 ) ) ( not ( = ?auto_707881 ?auto_707883 ) ) ( not ( = ?auto_707881 ?auto_707885 ) ) ( not ( = ?auto_707881 ?auto_707886 ) ) ( not ( = ?auto_707881 ?auto_707887 ) ) ( not ( = ?auto_707881 ?auto_707889 ) ) ( not ( = ?auto_707878 ?auto_707882 ) ) ( not ( = ?auto_707878 ?auto_707884 ) ) ( not ( = ?auto_707878 ?auto_707883 ) ) ( not ( = ?auto_707878 ?auto_707885 ) ) ( not ( = ?auto_707878 ?auto_707886 ) ) ( not ( = ?auto_707878 ?auto_707887 ) ) ( not ( = ?auto_707878 ?auto_707889 ) ) ( not ( = ?auto_707882 ?auto_707884 ) ) ( not ( = ?auto_707882 ?auto_707883 ) ) ( not ( = ?auto_707882 ?auto_707885 ) ) ( not ( = ?auto_707882 ?auto_707886 ) ) ( not ( = ?auto_707882 ?auto_707887 ) ) ( not ( = ?auto_707882 ?auto_707889 ) ) ( not ( = ?auto_707884 ?auto_707883 ) ) ( not ( = ?auto_707884 ?auto_707885 ) ) ( not ( = ?auto_707884 ?auto_707886 ) ) ( not ( = ?auto_707884 ?auto_707887 ) ) ( not ( = ?auto_707884 ?auto_707889 ) ) ( not ( = ?auto_707883 ?auto_707885 ) ) ( not ( = ?auto_707883 ?auto_707886 ) ) ( not ( = ?auto_707883 ?auto_707887 ) ) ( not ( = ?auto_707883 ?auto_707889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707885 ?auto_707886 ?auto_707887 )
      ( MAKE-9CRATE-VERIFY ?auto_707879 ?auto_707880 ?auto_707881 ?auto_707878 ?auto_707882 ?auto_707884 ?auto_707883 ?auto_707885 ?auto_707886 ?auto_707887 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707988 - SURFACE
      ?auto_707989 - SURFACE
      ?auto_707990 - SURFACE
      ?auto_707987 - SURFACE
      ?auto_707991 - SURFACE
      ?auto_707993 - SURFACE
      ?auto_707992 - SURFACE
      ?auto_707994 - SURFACE
      ?auto_707995 - SURFACE
      ?auto_707996 - SURFACE
    )
    :vars
    (
      ?auto_708001 - HOIST
      ?auto_707997 - PLACE
      ?auto_707998 - PLACE
      ?auto_708000 - HOIST
      ?auto_707999 - SURFACE
      ?auto_708002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_708001 ?auto_707997 ) ( IS-CRATE ?auto_707996 ) ( not ( = ?auto_707995 ?auto_707996 ) ) ( not ( = ?auto_707994 ?auto_707995 ) ) ( not ( = ?auto_707994 ?auto_707996 ) ) ( not ( = ?auto_707998 ?auto_707997 ) ) ( HOIST-AT ?auto_708000 ?auto_707998 ) ( not ( = ?auto_708001 ?auto_708000 ) ) ( AVAILABLE ?auto_708000 ) ( SURFACE-AT ?auto_707996 ?auto_707998 ) ( ON ?auto_707996 ?auto_707999 ) ( CLEAR ?auto_707996 ) ( not ( = ?auto_707995 ?auto_707999 ) ) ( not ( = ?auto_707996 ?auto_707999 ) ) ( not ( = ?auto_707994 ?auto_707999 ) ) ( TRUCK-AT ?auto_708002 ?auto_707997 ) ( SURFACE-AT ?auto_707994 ?auto_707997 ) ( CLEAR ?auto_707994 ) ( IS-CRATE ?auto_707995 ) ( AVAILABLE ?auto_708001 ) ( IN ?auto_707995 ?auto_708002 ) ( ON ?auto_707989 ?auto_707988 ) ( ON ?auto_707990 ?auto_707989 ) ( ON ?auto_707987 ?auto_707990 ) ( ON ?auto_707991 ?auto_707987 ) ( ON ?auto_707993 ?auto_707991 ) ( ON ?auto_707992 ?auto_707993 ) ( ON ?auto_707994 ?auto_707992 ) ( not ( = ?auto_707988 ?auto_707989 ) ) ( not ( = ?auto_707988 ?auto_707990 ) ) ( not ( = ?auto_707988 ?auto_707987 ) ) ( not ( = ?auto_707988 ?auto_707991 ) ) ( not ( = ?auto_707988 ?auto_707993 ) ) ( not ( = ?auto_707988 ?auto_707992 ) ) ( not ( = ?auto_707988 ?auto_707994 ) ) ( not ( = ?auto_707988 ?auto_707995 ) ) ( not ( = ?auto_707988 ?auto_707996 ) ) ( not ( = ?auto_707988 ?auto_707999 ) ) ( not ( = ?auto_707989 ?auto_707990 ) ) ( not ( = ?auto_707989 ?auto_707987 ) ) ( not ( = ?auto_707989 ?auto_707991 ) ) ( not ( = ?auto_707989 ?auto_707993 ) ) ( not ( = ?auto_707989 ?auto_707992 ) ) ( not ( = ?auto_707989 ?auto_707994 ) ) ( not ( = ?auto_707989 ?auto_707995 ) ) ( not ( = ?auto_707989 ?auto_707996 ) ) ( not ( = ?auto_707989 ?auto_707999 ) ) ( not ( = ?auto_707990 ?auto_707987 ) ) ( not ( = ?auto_707990 ?auto_707991 ) ) ( not ( = ?auto_707990 ?auto_707993 ) ) ( not ( = ?auto_707990 ?auto_707992 ) ) ( not ( = ?auto_707990 ?auto_707994 ) ) ( not ( = ?auto_707990 ?auto_707995 ) ) ( not ( = ?auto_707990 ?auto_707996 ) ) ( not ( = ?auto_707990 ?auto_707999 ) ) ( not ( = ?auto_707987 ?auto_707991 ) ) ( not ( = ?auto_707987 ?auto_707993 ) ) ( not ( = ?auto_707987 ?auto_707992 ) ) ( not ( = ?auto_707987 ?auto_707994 ) ) ( not ( = ?auto_707987 ?auto_707995 ) ) ( not ( = ?auto_707987 ?auto_707996 ) ) ( not ( = ?auto_707987 ?auto_707999 ) ) ( not ( = ?auto_707991 ?auto_707993 ) ) ( not ( = ?auto_707991 ?auto_707992 ) ) ( not ( = ?auto_707991 ?auto_707994 ) ) ( not ( = ?auto_707991 ?auto_707995 ) ) ( not ( = ?auto_707991 ?auto_707996 ) ) ( not ( = ?auto_707991 ?auto_707999 ) ) ( not ( = ?auto_707993 ?auto_707992 ) ) ( not ( = ?auto_707993 ?auto_707994 ) ) ( not ( = ?auto_707993 ?auto_707995 ) ) ( not ( = ?auto_707993 ?auto_707996 ) ) ( not ( = ?auto_707993 ?auto_707999 ) ) ( not ( = ?auto_707992 ?auto_707994 ) ) ( not ( = ?auto_707992 ?auto_707995 ) ) ( not ( = ?auto_707992 ?auto_707996 ) ) ( not ( = ?auto_707992 ?auto_707999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707994 ?auto_707995 ?auto_707996 )
      ( MAKE-9CRATE-VERIFY ?auto_707988 ?auto_707989 ?auto_707990 ?auto_707987 ?auto_707991 ?auto_707993 ?auto_707992 ?auto_707994 ?auto_707995 ?auto_707996 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_713553 - SURFACE
      ?auto_713554 - SURFACE
      ?auto_713555 - SURFACE
      ?auto_713552 - SURFACE
      ?auto_713556 - SURFACE
      ?auto_713558 - SURFACE
      ?auto_713557 - SURFACE
      ?auto_713559 - SURFACE
      ?auto_713560 - SURFACE
      ?auto_713561 - SURFACE
      ?auto_713562 - SURFACE
    )
    :vars
    (
      ?auto_713564 - HOIST
      ?auto_713563 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_713564 ?auto_713563 ) ( SURFACE-AT ?auto_713561 ?auto_713563 ) ( CLEAR ?auto_713561 ) ( LIFTING ?auto_713564 ?auto_713562 ) ( IS-CRATE ?auto_713562 ) ( not ( = ?auto_713561 ?auto_713562 ) ) ( ON ?auto_713554 ?auto_713553 ) ( ON ?auto_713555 ?auto_713554 ) ( ON ?auto_713552 ?auto_713555 ) ( ON ?auto_713556 ?auto_713552 ) ( ON ?auto_713558 ?auto_713556 ) ( ON ?auto_713557 ?auto_713558 ) ( ON ?auto_713559 ?auto_713557 ) ( ON ?auto_713560 ?auto_713559 ) ( ON ?auto_713561 ?auto_713560 ) ( not ( = ?auto_713553 ?auto_713554 ) ) ( not ( = ?auto_713553 ?auto_713555 ) ) ( not ( = ?auto_713553 ?auto_713552 ) ) ( not ( = ?auto_713553 ?auto_713556 ) ) ( not ( = ?auto_713553 ?auto_713558 ) ) ( not ( = ?auto_713553 ?auto_713557 ) ) ( not ( = ?auto_713553 ?auto_713559 ) ) ( not ( = ?auto_713553 ?auto_713560 ) ) ( not ( = ?auto_713553 ?auto_713561 ) ) ( not ( = ?auto_713553 ?auto_713562 ) ) ( not ( = ?auto_713554 ?auto_713555 ) ) ( not ( = ?auto_713554 ?auto_713552 ) ) ( not ( = ?auto_713554 ?auto_713556 ) ) ( not ( = ?auto_713554 ?auto_713558 ) ) ( not ( = ?auto_713554 ?auto_713557 ) ) ( not ( = ?auto_713554 ?auto_713559 ) ) ( not ( = ?auto_713554 ?auto_713560 ) ) ( not ( = ?auto_713554 ?auto_713561 ) ) ( not ( = ?auto_713554 ?auto_713562 ) ) ( not ( = ?auto_713555 ?auto_713552 ) ) ( not ( = ?auto_713555 ?auto_713556 ) ) ( not ( = ?auto_713555 ?auto_713558 ) ) ( not ( = ?auto_713555 ?auto_713557 ) ) ( not ( = ?auto_713555 ?auto_713559 ) ) ( not ( = ?auto_713555 ?auto_713560 ) ) ( not ( = ?auto_713555 ?auto_713561 ) ) ( not ( = ?auto_713555 ?auto_713562 ) ) ( not ( = ?auto_713552 ?auto_713556 ) ) ( not ( = ?auto_713552 ?auto_713558 ) ) ( not ( = ?auto_713552 ?auto_713557 ) ) ( not ( = ?auto_713552 ?auto_713559 ) ) ( not ( = ?auto_713552 ?auto_713560 ) ) ( not ( = ?auto_713552 ?auto_713561 ) ) ( not ( = ?auto_713552 ?auto_713562 ) ) ( not ( = ?auto_713556 ?auto_713558 ) ) ( not ( = ?auto_713556 ?auto_713557 ) ) ( not ( = ?auto_713556 ?auto_713559 ) ) ( not ( = ?auto_713556 ?auto_713560 ) ) ( not ( = ?auto_713556 ?auto_713561 ) ) ( not ( = ?auto_713556 ?auto_713562 ) ) ( not ( = ?auto_713558 ?auto_713557 ) ) ( not ( = ?auto_713558 ?auto_713559 ) ) ( not ( = ?auto_713558 ?auto_713560 ) ) ( not ( = ?auto_713558 ?auto_713561 ) ) ( not ( = ?auto_713558 ?auto_713562 ) ) ( not ( = ?auto_713557 ?auto_713559 ) ) ( not ( = ?auto_713557 ?auto_713560 ) ) ( not ( = ?auto_713557 ?auto_713561 ) ) ( not ( = ?auto_713557 ?auto_713562 ) ) ( not ( = ?auto_713559 ?auto_713560 ) ) ( not ( = ?auto_713559 ?auto_713561 ) ) ( not ( = ?auto_713559 ?auto_713562 ) ) ( not ( = ?auto_713560 ?auto_713561 ) ) ( not ( = ?auto_713560 ?auto_713562 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_713561 ?auto_713562 )
      ( MAKE-10CRATE-VERIFY ?auto_713553 ?auto_713554 ?auto_713555 ?auto_713552 ?auto_713556 ?auto_713558 ?auto_713557 ?auto_713559 ?auto_713560 ?auto_713561 ?auto_713562 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_713647 - SURFACE
      ?auto_713648 - SURFACE
      ?auto_713649 - SURFACE
      ?auto_713646 - SURFACE
      ?auto_713650 - SURFACE
      ?auto_713652 - SURFACE
      ?auto_713651 - SURFACE
      ?auto_713653 - SURFACE
      ?auto_713654 - SURFACE
      ?auto_713655 - SURFACE
      ?auto_713656 - SURFACE
    )
    :vars
    (
      ?auto_713657 - HOIST
      ?auto_713658 - PLACE
      ?auto_713659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_713657 ?auto_713658 ) ( SURFACE-AT ?auto_713655 ?auto_713658 ) ( CLEAR ?auto_713655 ) ( IS-CRATE ?auto_713656 ) ( not ( = ?auto_713655 ?auto_713656 ) ) ( TRUCK-AT ?auto_713659 ?auto_713658 ) ( AVAILABLE ?auto_713657 ) ( IN ?auto_713656 ?auto_713659 ) ( ON ?auto_713655 ?auto_713654 ) ( not ( = ?auto_713654 ?auto_713655 ) ) ( not ( = ?auto_713654 ?auto_713656 ) ) ( ON ?auto_713648 ?auto_713647 ) ( ON ?auto_713649 ?auto_713648 ) ( ON ?auto_713646 ?auto_713649 ) ( ON ?auto_713650 ?auto_713646 ) ( ON ?auto_713652 ?auto_713650 ) ( ON ?auto_713651 ?auto_713652 ) ( ON ?auto_713653 ?auto_713651 ) ( ON ?auto_713654 ?auto_713653 ) ( not ( = ?auto_713647 ?auto_713648 ) ) ( not ( = ?auto_713647 ?auto_713649 ) ) ( not ( = ?auto_713647 ?auto_713646 ) ) ( not ( = ?auto_713647 ?auto_713650 ) ) ( not ( = ?auto_713647 ?auto_713652 ) ) ( not ( = ?auto_713647 ?auto_713651 ) ) ( not ( = ?auto_713647 ?auto_713653 ) ) ( not ( = ?auto_713647 ?auto_713654 ) ) ( not ( = ?auto_713647 ?auto_713655 ) ) ( not ( = ?auto_713647 ?auto_713656 ) ) ( not ( = ?auto_713648 ?auto_713649 ) ) ( not ( = ?auto_713648 ?auto_713646 ) ) ( not ( = ?auto_713648 ?auto_713650 ) ) ( not ( = ?auto_713648 ?auto_713652 ) ) ( not ( = ?auto_713648 ?auto_713651 ) ) ( not ( = ?auto_713648 ?auto_713653 ) ) ( not ( = ?auto_713648 ?auto_713654 ) ) ( not ( = ?auto_713648 ?auto_713655 ) ) ( not ( = ?auto_713648 ?auto_713656 ) ) ( not ( = ?auto_713649 ?auto_713646 ) ) ( not ( = ?auto_713649 ?auto_713650 ) ) ( not ( = ?auto_713649 ?auto_713652 ) ) ( not ( = ?auto_713649 ?auto_713651 ) ) ( not ( = ?auto_713649 ?auto_713653 ) ) ( not ( = ?auto_713649 ?auto_713654 ) ) ( not ( = ?auto_713649 ?auto_713655 ) ) ( not ( = ?auto_713649 ?auto_713656 ) ) ( not ( = ?auto_713646 ?auto_713650 ) ) ( not ( = ?auto_713646 ?auto_713652 ) ) ( not ( = ?auto_713646 ?auto_713651 ) ) ( not ( = ?auto_713646 ?auto_713653 ) ) ( not ( = ?auto_713646 ?auto_713654 ) ) ( not ( = ?auto_713646 ?auto_713655 ) ) ( not ( = ?auto_713646 ?auto_713656 ) ) ( not ( = ?auto_713650 ?auto_713652 ) ) ( not ( = ?auto_713650 ?auto_713651 ) ) ( not ( = ?auto_713650 ?auto_713653 ) ) ( not ( = ?auto_713650 ?auto_713654 ) ) ( not ( = ?auto_713650 ?auto_713655 ) ) ( not ( = ?auto_713650 ?auto_713656 ) ) ( not ( = ?auto_713652 ?auto_713651 ) ) ( not ( = ?auto_713652 ?auto_713653 ) ) ( not ( = ?auto_713652 ?auto_713654 ) ) ( not ( = ?auto_713652 ?auto_713655 ) ) ( not ( = ?auto_713652 ?auto_713656 ) ) ( not ( = ?auto_713651 ?auto_713653 ) ) ( not ( = ?auto_713651 ?auto_713654 ) ) ( not ( = ?auto_713651 ?auto_713655 ) ) ( not ( = ?auto_713651 ?auto_713656 ) ) ( not ( = ?auto_713653 ?auto_713654 ) ) ( not ( = ?auto_713653 ?auto_713655 ) ) ( not ( = ?auto_713653 ?auto_713656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_713654 ?auto_713655 ?auto_713656 )
      ( MAKE-10CRATE-VERIFY ?auto_713647 ?auto_713648 ?auto_713649 ?auto_713646 ?auto_713650 ?auto_713652 ?auto_713651 ?auto_713653 ?auto_713654 ?auto_713655 ?auto_713656 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_713752 - SURFACE
      ?auto_713753 - SURFACE
      ?auto_713754 - SURFACE
      ?auto_713751 - SURFACE
      ?auto_713755 - SURFACE
      ?auto_713757 - SURFACE
      ?auto_713756 - SURFACE
      ?auto_713758 - SURFACE
      ?auto_713759 - SURFACE
      ?auto_713760 - SURFACE
      ?auto_713761 - SURFACE
    )
    :vars
    (
      ?auto_713764 - HOIST
      ?auto_713762 - PLACE
      ?auto_713765 - TRUCK
      ?auto_713763 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_713764 ?auto_713762 ) ( SURFACE-AT ?auto_713760 ?auto_713762 ) ( CLEAR ?auto_713760 ) ( IS-CRATE ?auto_713761 ) ( not ( = ?auto_713760 ?auto_713761 ) ) ( AVAILABLE ?auto_713764 ) ( IN ?auto_713761 ?auto_713765 ) ( ON ?auto_713760 ?auto_713759 ) ( not ( = ?auto_713759 ?auto_713760 ) ) ( not ( = ?auto_713759 ?auto_713761 ) ) ( TRUCK-AT ?auto_713765 ?auto_713763 ) ( not ( = ?auto_713763 ?auto_713762 ) ) ( ON ?auto_713753 ?auto_713752 ) ( ON ?auto_713754 ?auto_713753 ) ( ON ?auto_713751 ?auto_713754 ) ( ON ?auto_713755 ?auto_713751 ) ( ON ?auto_713757 ?auto_713755 ) ( ON ?auto_713756 ?auto_713757 ) ( ON ?auto_713758 ?auto_713756 ) ( ON ?auto_713759 ?auto_713758 ) ( not ( = ?auto_713752 ?auto_713753 ) ) ( not ( = ?auto_713752 ?auto_713754 ) ) ( not ( = ?auto_713752 ?auto_713751 ) ) ( not ( = ?auto_713752 ?auto_713755 ) ) ( not ( = ?auto_713752 ?auto_713757 ) ) ( not ( = ?auto_713752 ?auto_713756 ) ) ( not ( = ?auto_713752 ?auto_713758 ) ) ( not ( = ?auto_713752 ?auto_713759 ) ) ( not ( = ?auto_713752 ?auto_713760 ) ) ( not ( = ?auto_713752 ?auto_713761 ) ) ( not ( = ?auto_713753 ?auto_713754 ) ) ( not ( = ?auto_713753 ?auto_713751 ) ) ( not ( = ?auto_713753 ?auto_713755 ) ) ( not ( = ?auto_713753 ?auto_713757 ) ) ( not ( = ?auto_713753 ?auto_713756 ) ) ( not ( = ?auto_713753 ?auto_713758 ) ) ( not ( = ?auto_713753 ?auto_713759 ) ) ( not ( = ?auto_713753 ?auto_713760 ) ) ( not ( = ?auto_713753 ?auto_713761 ) ) ( not ( = ?auto_713754 ?auto_713751 ) ) ( not ( = ?auto_713754 ?auto_713755 ) ) ( not ( = ?auto_713754 ?auto_713757 ) ) ( not ( = ?auto_713754 ?auto_713756 ) ) ( not ( = ?auto_713754 ?auto_713758 ) ) ( not ( = ?auto_713754 ?auto_713759 ) ) ( not ( = ?auto_713754 ?auto_713760 ) ) ( not ( = ?auto_713754 ?auto_713761 ) ) ( not ( = ?auto_713751 ?auto_713755 ) ) ( not ( = ?auto_713751 ?auto_713757 ) ) ( not ( = ?auto_713751 ?auto_713756 ) ) ( not ( = ?auto_713751 ?auto_713758 ) ) ( not ( = ?auto_713751 ?auto_713759 ) ) ( not ( = ?auto_713751 ?auto_713760 ) ) ( not ( = ?auto_713751 ?auto_713761 ) ) ( not ( = ?auto_713755 ?auto_713757 ) ) ( not ( = ?auto_713755 ?auto_713756 ) ) ( not ( = ?auto_713755 ?auto_713758 ) ) ( not ( = ?auto_713755 ?auto_713759 ) ) ( not ( = ?auto_713755 ?auto_713760 ) ) ( not ( = ?auto_713755 ?auto_713761 ) ) ( not ( = ?auto_713757 ?auto_713756 ) ) ( not ( = ?auto_713757 ?auto_713758 ) ) ( not ( = ?auto_713757 ?auto_713759 ) ) ( not ( = ?auto_713757 ?auto_713760 ) ) ( not ( = ?auto_713757 ?auto_713761 ) ) ( not ( = ?auto_713756 ?auto_713758 ) ) ( not ( = ?auto_713756 ?auto_713759 ) ) ( not ( = ?auto_713756 ?auto_713760 ) ) ( not ( = ?auto_713756 ?auto_713761 ) ) ( not ( = ?auto_713758 ?auto_713759 ) ) ( not ( = ?auto_713758 ?auto_713760 ) ) ( not ( = ?auto_713758 ?auto_713761 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_713759 ?auto_713760 ?auto_713761 )
      ( MAKE-10CRATE-VERIFY ?auto_713752 ?auto_713753 ?auto_713754 ?auto_713751 ?auto_713755 ?auto_713757 ?auto_713756 ?auto_713758 ?auto_713759 ?auto_713760 ?auto_713761 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_713867 - SURFACE
      ?auto_713868 - SURFACE
      ?auto_713869 - SURFACE
      ?auto_713866 - SURFACE
      ?auto_713870 - SURFACE
      ?auto_713872 - SURFACE
      ?auto_713871 - SURFACE
      ?auto_713873 - SURFACE
      ?auto_713874 - SURFACE
      ?auto_713875 - SURFACE
      ?auto_713876 - SURFACE
    )
    :vars
    (
      ?auto_713878 - HOIST
      ?auto_713881 - PLACE
      ?auto_713877 - TRUCK
      ?auto_713880 - PLACE
      ?auto_713879 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_713878 ?auto_713881 ) ( SURFACE-AT ?auto_713875 ?auto_713881 ) ( CLEAR ?auto_713875 ) ( IS-CRATE ?auto_713876 ) ( not ( = ?auto_713875 ?auto_713876 ) ) ( AVAILABLE ?auto_713878 ) ( ON ?auto_713875 ?auto_713874 ) ( not ( = ?auto_713874 ?auto_713875 ) ) ( not ( = ?auto_713874 ?auto_713876 ) ) ( TRUCK-AT ?auto_713877 ?auto_713880 ) ( not ( = ?auto_713880 ?auto_713881 ) ) ( HOIST-AT ?auto_713879 ?auto_713880 ) ( LIFTING ?auto_713879 ?auto_713876 ) ( not ( = ?auto_713878 ?auto_713879 ) ) ( ON ?auto_713868 ?auto_713867 ) ( ON ?auto_713869 ?auto_713868 ) ( ON ?auto_713866 ?auto_713869 ) ( ON ?auto_713870 ?auto_713866 ) ( ON ?auto_713872 ?auto_713870 ) ( ON ?auto_713871 ?auto_713872 ) ( ON ?auto_713873 ?auto_713871 ) ( ON ?auto_713874 ?auto_713873 ) ( not ( = ?auto_713867 ?auto_713868 ) ) ( not ( = ?auto_713867 ?auto_713869 ) ) ( not ( = ?auto_713867 ?auto_713866 ) ) ( not ( = ?auto_713867 ?auto_713870 ) ) ( not ( = ?auto_713867 ?auto_713872 ) ) ( not ( = ?auto_713867 ?auto_713871 ) ) ( not ( = ?auto_713867 ?auto_713873 ) ) ( not ( = ?auto_713867 ?auto_713874 ) ) ( not ( = ?auto_713867 ?auto_713875 ) ) ( not ( = ?auto_713867 ?auto_713876 ) ) ( not ( = ?auto_713868 ?auto_713869 ) ) ( not ( = ?auto_713868 ?auto_713866 ) ) ( not ( = ?auto_713868 ?auto_713870 ) ) ( not ( = ?auto_713868 ?auto_713872 ) ) ( not ( = ?auto_713868 ?auto_713871 ) ) ( not ( = ?auto_713868 ?auto_713873 ) ) ( not ( = ?auto_713868 ?auto_713874 ) ) ( not ( = ?auto_713868 ?auto_713875 ) ) ( not ( = ?auto_713868 ?auto_713876 ) ) ( not ( = ?auto_713869 ?auto_713866 ) ) ( not ( = ?auto_713869 ?auto_713870 ) ) ( not ( = ?auto_713869 ?auto_713872 ) ) ( not ( = ?auto_713869 ?auto_713871 ) ) ( not ( = ?auto_713869 ?auto_713873 ) ) ( not ( = ?auto_713869 ?auto_713874 ) ) ( not ( = ?auto_713869 ?auto_713875 ) ) ( not ( = ?auto_713869 ?auto_713876 ) ) ( not ( = ?auto_713866 ?auto_713870 ) ) ( not ( = ?auto_713866 ?auto_713872 ) ) ( not ( = ?auto_713866 ?auto_713871 ) ) ( not ( = ?auto_713866 ?auto_713873 ) ) ( not ( = ?auto_713866 ?auto_713874 ) ) ( not ( = ?auto_713866 ?auto_713875 ) ) ( not ( = ?auto_713866 ?auto_713876 ) ) ( not ( = ?auto_713870 ?auto_713872 ) ) ( not ( = ?auto_713870 ?auto_713871 ) ) ( not ( = ?auto_713870 ?auto_713873 ) ) ( not ( = ?auto_713870 ?auto_713874 ) ) ( not ( = ?auto_713870 ?auto_713875 ) ) ( not ( = ?auto_713870 ?auto_713876 ) ) ( not ( = ?auto_713872 ?auto_713871 ) ) ( not ( = ?auto_713872 ?auto_713873 ) ) ( not ( = ?auto_713872 ?auto_713874 ) ) ( not ( = ?auto_713872 ?auto_713875 ) ) ( not ( = ?auto_713872 ?auto_713876 ) ) ( not ( = ?auto_713871 ?auto_713873 ) ) ( not ( = ?auto_713871 ?auto_713874 ) ) ( not ( = ?auto_713871 ?auto_713875 ) ) ( not ( = ?auto_713871 ?auto_713876 ) ) ( not ( = ?auto_713873 ?auto_713874 ) ) ( not ( = ?auto_713873 ?auto_713875 ) ) ( not ( = ?auto_713873 ?auto_713876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_713874 ?auto_713875 ?auto_713876 )
      ( MAKE-10CRATE-VERIFY ?auto_713867 ?auto_713868 ?auto_713869 ?auto_713866 ?auto_713870 ?auto_713872 ?auto_713871 ?auto_713873 ?auto_713874 ?auto_713875 ?auto_713876 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_713992 - SURFACE
      ?auto_713993 - SURFACE
      ?auto_713994 - SURFACE
      ?auto_713991 - SURFACE
      ?auto_713995 - SURFACE
      ?auto_713997 - SURFACE
      ?auto_713996 - SURFACE
      ?auto_713998 - SURFACE
      ?auto_713999 - SURFACE
      ?auto_714000 - SURFACE
      ?auto_714001 - SURFACE
    )
    :vars
    (
      ?auto_714006 - HOIST
      ?auto_714007 - PLACE
      ?auto_714005 - TRUCK
      ?auto_714003 - PLACE
      ?auto_714002 - HOIST
      ?auto_714004 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_714006 ?auto_714007 ) ( SURFACE-AT ?auto_714000 ?auto_714007 ) ( CLEAR ?auto_714000 ) ( IS-CRATE ?auto_714001 ) ( not ( = ?auto_714000 ?auto_714001 ) ) ( AVAILABLE ?auto_714006 ) ( ON ?auto_714000 ?auto_713999 ) ( not ( = ?auto_713999 ?auto_714000 ) ) ( not ( = ?auto_713999 ?auto_714001 ) ) ( TRUCK-AT ?auto_714005 ?auto_714003 ) ( not ( = ?auto_714003 ?auto_714007 ) ) ( HOIST-AT ?auto_714002 ?auto_714003 ) ( not ( = ?auto_714006 ?auto_714002 ) ) ( AVAILABLE ?auto_714002 ) ( SURFACE-AT ?auto_714001 ?auto_714003 ) ( ON ?auto_714001 ?auto_714004 ) ( CLEAR ?auto_714001 ) ( not ( = ?auto_714000 ?auto_714004 ) ) ( not ( = ?auto_714001 ?auto_714004 ) ) ( not ( = ?auto_713999 ?auto_714004 ) ) ( ON ?auto_713993 ?auto_713992 ) ( ON ?auto_713994 ?auto_713993 ) ( ON ?auto_713991 ?auto_713994 ) ( ON ?auto_713995 ?auto_713991 ) ( ON ?auto_713997 ?auto_713995 ) ( ON ?auto_713996 ?auto_713997 ) ( ON ?auto_713998 ?auto_713996 ) ( ON ?auto_713999 ?auto_713998 ) ( not ( = ?auto_713992 ?auto_713993 ) ) ( not ( = ?auto_713992 ?auto_713994 ) ) ( not ( = ?auto_713992 ?auto_713991 ) ) ( not ( = ?auto_713992 ?auto_713995 ) ) ( not ( = ?auto_713992 ?auto_713997 ) ) ( not ( = ?auto_713992 ?auto_713996 ) ) ( not ( = ?auto_713992 ?auto_713998 ) ) ( not ( = ?auto_713992 ?auto_713999 ) ) ( not ( = ?auto_713992 ?auto_714000 ) ) ( not ( = ?auto_713992 ?auto_714001 ) ) ( not ( = ?auto_713992 ?auto_714004 ) ) ( not ( = ?auto_713993 ?auto_713994 ) ) ( not ( = ?auto_713993 ?auto_713991 ) ) ( not ( = ?auto_713993 ?auto_713995 ) ) ( not ( = ?auto_713993 ?auto_713997 ) ) ( not ( = ?auto_713993 ?auto_713996 ) ) ( not ( = ?auto_713993 ?auto_713998 ) ) ( not ( = ?auto_713993 ?auto_713999 ) ) ( not ( = ?auto_713993 ?auto_714000 ) ) ( not ( = ?auto_713993 ?auto_714001 ) ) ( not ( = ?auto_713993 ?auto_714004 ) ) ( not ( = ?auto_713994 ?auto_713991 ) ) ( not ( = ?auto_713994 ?auto_713995 ) ) ( not ( = ?auto_713994 ?auto_713997 ) ) ( not ( = ?auto_713994 ?auto_713996 ) ) ( not ( = ?auto_713994 ?auto_713998 ) ) ( not ( = ?auto_713994 ?auto_713999 ) ) ( not ( = ?auto_713994 ?auto_714000 ) ) ( not ( = ?auto_713994 ?auto_714001 ) ) ( not ( = ?auto_713994 ?auto_714004 ) ) ( not ( = ?auto_713991 ?auto_713995 ) ) ( not ( = ?auto_713991 ?auto_713997 ) ) ( not ( = ?auto_713991 ?auto_713996 ) ) ( not ( = ?auto_713991 ?auto_713998 ) ) ( not ( = ?auto_713991 ?auto_713999 ) ) ( not ( = ?auto_713991 ?auto_714000 ) ) ( not ( = ?auto_713991 ?auto_714001 ) ) ( not ( = ?auto_713991 ?auto_714004 ) ) ( not ( = ?auto_713995 ?auto_713997 ) ) ( not ( = ?auto_713995 ?auto_713996 ) ) ( not ( = ?auto_713995 ?auto_713998 ) ) ( not ( = ?auto_713995 ?auto_713999 ) ) ( not ( = ?auto_713995 ?auto_714000 ) ) ( not ( = ?auto_713995 ?auto_714001 ) ) ( not ( = ?auto_713995 ?auto_714004 ) ) ( not ( = ?auto_713997 ?auto_713996 ) ) ( not ( = ?auto_713997 ?auto_713998 ) ) ( not ( = ?auto_713997 ?auto_713999 ) ) ( not ( = ?auto_713997 ?auto_714000 ) ) ( not ( = ?auto_713997 ?auto_714001 ) ) ( not ( = ?auto_713997 ?auto_714004 ) ) ( not ( = ?auto_713996 ?auto_713998 ) ) ( not ( = ?auto_713996 ?auto_713999 ) ) ( not ( = ?auto_713996 ?auto_714000 ) ) ( not ( = ?auto_713996 ?auto_714001 ) ) ( not ( = ?auto_713996 ?auto_714004 ) ) ( not ( = ?auto_713998 ?auto_713999 ) ) ( not ( = ?auto_713998 ?auto_714000 ) ) ( not ( = ?auto_713998 ?auto_714001 ) ) ( not ( = ?auto_713998 ?auto_714004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_713999 ?auto_714000 ?auto_714001 )
      ( MAKE-10CRATE-VERIFY ?auto_713992 ?auto_713993 ?auto_713994 ?auto_713991 ?auto_713995 ?auto_713997 ?auto_713996 ?auto_713998 ?auto_713999 ?auto_714000 ?auto_714001 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_714118 - SURFACE
      ?auto_714119 - SURFACE
      ?auto_714120 - SURFACE
      ?auto_714117 - SURFACE
      ?auto_714121 - SURFACE
      ?auto_714123 - SURFACE
      ?auto_714122 - SURFACE
      ?auto_714124 - SURFACE
      ?auto_714125 - SURFACE
      ?auto_714126 - SURFACE
      ?auto_714127 - SURFACE
    )
    :vars
    (
      ?auto_714131 - HOIST
      ?auto_714133 - PLACE
      ?auto_714128 - PLACE
      ?auto_714130 - HOIST
      ?auto_714129 - SURFACE
      ?auto_714132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_714131 ?auto_714133 ) ( SURFACE-AT ?auto_714126 ?auto_714133 ) ( CLEAR ?auto_714126 ) ( IS-CRATE ?auto_714127 ) ( not ( = ?auto_714126 ?auto_714127 ) ) ( AVAILABLE ?auto_714131 ) ( ON ?auto_714126 ?auto_714125 ) ( not ( = ?auto_714125 ?auto_714126 ) ) ( not ( = ?auto_714125 ?auto_714127 ) ) ( not ( = ?auto_714128 ?auto_714133 ) ) ( HOIST-AT ?auto_714130 ?auto_714128 ) ( not ( = ?auto_714131 ?auto_714130 ) ) ( AVAILABLE ?auto_714130 ) ( SURFACE-AT ?auto_714127 ?auto_714128 ) ( ON ?auto_714127 ?auto_714129 ) ( CLEAR ?auto_714127 ) ( not ( = ?auto_714126 ?auto_714129 ) ) ( not ( = ?auto_714127 ?auto_714129 ) ) ( not ( = ?auto_714125 ?auto_714129 ) ) ( TRUCK-AT ?auto_714132 ?auto_714133 ) ( ON ?auto_714119 ?auto_714118 ) ( ON ?auto_714120 ?auto_714119 ) ( ON ?auto_714117 ?auto_714120 ) ( ON ?auto_714121 ?auto_714117 ) ( ON ?auto_714123 ?auto_714121 ) ( ON ?auto_714122 ?auto_714123 ) ( ON ?auto_714124 ?auto_714122 ) ( ON ?auto_714125 ?auto_714124 ) ( not ( = ?auto_714118 ?auto_714119 ) ) ( not ( = ?auto_714118 ?auto_714120 ) ) ( not ( = ?auto_714118 ?auto_714117 ) ) ( not ( = ?auto_714118 ?auto_714121 ) ) ( not ( = ?auto_714118 ?auto_714123 ) ) ( not ( = ?auto_714118 ?auto_714122 ) ) ( not ( = ?auto_714118 ?auto_714124 ) ) ( not ( = ?auto_714118 ?auto_714125 ) ) ( not ( = ?auto_714118 ?auto_714126 ) ) ( not ( = ?auto_714118 ?auto_714127 ) ) ( not ( = ?auto_714118 ?auto_714129 ) ) ( not ( = ?auto_714119 ?auto_714120 ) ) ( not ( = ?auto_714119 ?auto_714117 ) ) ( not ( = ?auto_714119 ?auto_714121 ) ) ( not ( = ?auto_714119 ?auto_714123 ) ) ( not ( = ?auto_714119 ?auto_714122 ) ) ( not ( = ?auto_714119 ?auto_714124 ) ) ( not ( = ?auto_714119 ?auto_714125 ) ) ( not ( = ?auto_714119 ?auto_714126 ) ) ( not ( = ?auto_714119 ?auto_714127 ) ) ( not ( = ?auto_714119 ?auto_714129 ) ) ( not ( = ?auto_714120 ?auto_714117 ) ) ( not ( = ?auto_714120 ?auto_714121 ) ) ( not ( = ?auto_714120 ?auto_714123 ) ) ( not ( = ?auto_714120 ?auto_714122 ) ) ( not ( = ?auto_714120 ?auto_714124 ) ) ( not ( = ?auto_714120 ?auto_714125 ) ) ( not ( = ?auto_714120 ?auto_714126 ) ) ( not ( = ?auto_714120 ?auto_714127 ) ) ( not ( = ?auto_714120 ?auto_714129 ) ) ( not ( = ?auto_714117 ?auto_714121 ) ) ( not ( = ?auto_714117 ?auto_714123 ) ) ( not ( = ?auto_714117 ?auto_714122 ) ) ( not ( = ?auto_714117 ?auto_714124 ) ) ( not ( = ?auto_714117 ?auto_714125 ) ) ( not ( = ?auto_714117 ?auto_714126 ) ) ( not ( = ?auto_714117 ?auto_714127 ) ) ( not ( = ?auto_714117 ?auto_714129 ) ) ( not ( = ?auto_714121 ?auto_714123 ) ) ( not ( = ?auto_714121 ?auto_714122 ) ) ( not ( = ?auto_714121 ?auto_714124 ) ) ( not ( = ?auto_714121 ?auto_714125 ) ) ( not ( = ?auto_714121 ?auto_714126 ) ) ( not ( = ?auto_714121 ?auto_714127 ) ) ( not ( = ?auto_714121 ?auto_714129 ) ) ( not ( = ?auto_714123 ?auto_714122 ) ) ( not ( = ?auto_714123 ?auto_714124 ) ) ( not ( = ?auto_714123 ?auto_714125 ) ) ( not ( = ?auto_714123 ?auto_714126 ) ) ( not ( = ?auto_714123 ?auto_714127 ) ) ( not ( = ?auto_714123 ?auto_714129 ) ) ( not ( = ?auto_714122 ?auto_714124 ) ) ( not ( = ?auto_714122 ?auto_714125 ) ) ( not ( = ?auto_714122 ?auto_714126 ) ) ( not ( = ?auto_714122 ?auto_714127 ) ) ( not ( = ?auto_714122 ?auto_714129 ) ) ( not ( = ?auto_714124 ?auto_714125 ) ) ( not ( = ?auto_714124 ?auto_714126 ) ) ( not ( = ?auto_714124 ?auto_714127 ) ) ( not ( = ?auto_714124 ?auto_714129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_714125 ?auto_714126 ?auto_714127 )
      ( MAKE-10CRATE-VERIFY ?auto_714118 ?auto_714119 ?auto_714120 ?auto_714117 ?auto_714121 ?auto_714123 ?auto_714122 ?auto_714124 ?auto_714125 ?auto_714126 ?auto_714127 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_714244 - SURFACE
      ?auto_714245 - SURFACE
      ?auto_714246 - SURFACE
      ?auto_714243 - SURFACE
      ?auto_714247 - SURFACE
      ?auto_714249 - SURFACE
      ?auto_714248 - SURFACE
      ?auto_714250 - SURFACE
      ?auto_714251 - SURFACE
      ?auto_714252 - SURFACE
      ?auto_714253 - SURFACE
    )
    :vars
    (
      ?auto_714255 - HOIST
      ?auto_714258 - PLACE
      ?auto_714254 - PLACE
      ?auto_714257 - HOIST
      ?auto_714256 - SURFACE
      ?auto_714259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_714255 ?auto_714258 ) ( IS-CRATE ?auto_714253 ) ( not ( = ?auto_714252 ?auto_714253 ) ) ( not ( = ?auto_714251 ?auto_714252 ) ) ( not ( = ?auto_714251 ?auto_714253 ) ) ( not ( = ?auto_714254 ?auto_714258 ) ) ( HOIST-AT ?auto_714257 ?auto_714254 ) ( not ( = ?auto_714255 ?auto_714257 ) ) ( AVAILABLE ?auto_714257 ) ( SURFACE-AT ?auto_714253 ?auto_714254 ) ( ON ?auto_714253 ?auto_714256 ) ( CLEAR ?auto_714253 ) ( not ( = ?auto_714252 ?auto_714256 ) ) ( not ( = ?auto_714253 ?auto_714256 ) ) ( not ( = ?auto_714251 ?auto_714256 ) ) ( TRUCK-AT ?auto_714259 ?auto_714258 ) ( SURFACE-AT ?auto_714251 ?auto_714258 ) ( CLEAR ?auto_714251 ) ( LIFTING ?auto_714255 ?auto_714252 ) ( IS-CRATE ?auto_714252 ) ( ON ?auto_714245 ?auto_714244 ) ( ON ?auto_714246 ?auto_714245 ) ( ON ?auto_714243 ?auto_714246 ) ( ON ?auto_714247 ?auto_714243 ) ( ON ?auto_714249 ?auto_714247 ) ( ON ?auto_714248 ?auto_714249 ) ( ON ?auto_714250 ?auto_714248 ) ( ON ?auto_714251 ?auto_714250 ) ( not ( = ?auto_714244 ?auto_714245 ) ) ( not ( = ?auto_714244 ?auto_714246 ) ) ( not ( = ?auto_714244 ?auto_714243 ) ) ( not ( = ?auto_714244 ?auto_714247 ) ) ( not ( = ?auto_714244 ?auto_714249 ) ) ( not ( = ?auto_714244 ?auto_714248 ) ) ( not ( = ?auto_714244 ?auto_714250 ) ) ( not ( = ?auto_714244 ?auto_714251 ) ) ( not ( = ?auto_714244 ?auto_714252 ) ) ( not ( = ?auto_714244 ?auto_714253 ) ) ( not ( = ?auto_714244 ?auto_714256 ) ) ( not ( = ?auto_714245 ?auto_714246 ) ) ( not ( = ?auto_714245 ?auto_714243 ) ) ( not ( = ?auto_714245 ?auto_714247 ) ) ( not ( = ?auto_714245 ?auto_714249 ) ) ( not ( = ?auto_714245 ?auto_714248 ) ) ( not ( = ?auto_714245 ?auto_714250 ) ) ( not ( = ?auto_714245 ?auto_714251 ) ) ( not ( = ?auto_714245 ?auto_714252 ) ) ( not ( = ?auto_714245 ?auto_714253 ) ) ( not ( = ?auto_714245 ?auto_714256 ) ) ( not ( = ?auto_714246 ?auto_714243 ) ) ( not ( = ?auto_714246 ?auto_714247 ) ) ( not ( = ?auto_714246 ?auto_714249 ) ) ( not ( = ?auto_714246 ?auto_714248 ) ) ( not ( = ?auto_714246 ?auto_714250 ) ) ( not ( = ?auto_714246 ?auto_714251 ) ) ( not ( = ?auto_714246 ?auto_714252 ) ) ( not ( = ?auto_714246 ?auto_714253 ) ) ( not ( = ?auto_714246 ?auto_714256 ) ) ( not ( = ?auto_714243 ?auto_714247 ) ) ( not ( = ?auto_714243 ?auto_714249 ) ) ( not ( = ?auto_714243 ?auto_714248 ) ) ( not ( = ?auto_714243 ?auto_714250 ) ) ( not ( = ?auto_714243 ?auto_714251 ) ) ( not ( = ?auto_714243 ?auto_714252 ) ) ( not ( = ?auto_714243 ?auto_714253 ) ) ( not ( = ?auto_714243 ?auto_714256 ) ) ( not ( = ?auto_714247 ?auto_714249 ) ) ( not ( = ?auto_714247 ?auto_714248 ) ) ( not ( = ?auto_714247 ?auto_714250 ) ) ( not ( = ?auto_714247 ?auto_714251 ) ) ( not ( = ?auto_714247 ?auto_714252 ) ) ( not ( = ?auto_714247 ?auto_714253 ) ) ( not ( = ?auto_714247 ?auto_714256 ) ) ( not ( = ?auto_714249 ?auto_714248 ) ) ( not ( = ?auto_714249 ?auto_714250 ) ) ( not ( = ?auto_714249 ?auto_714251 ) ) ( not ( = ?auto_714249 ?auto_714252 ) ) ( not ( = ?auto_714249 ?auto_714253 ) ) ( not ( = ?auto_714249 ?auto_714256 ) ) ( not ( = ?auto_714248 ?auto_714250 ) ) ( not ( = ?auto_714248 ?auto_714251 ) ) ( not ( = ?auto_714248 ?auto_714252 ) ) ( not ( = ?auto_714248 ?auto_714253 ) ) ( not ( = ?auto_714248 ?auto_714256 ) ) ( not ( = ?auto_714250 ?auto_714251 ) ) ( not ( = ?auto_714250 ?auto_714252 ) ) ( not ( = ?auto_714250 ?auto_714253 ) ) ( not ( = ?auto_714250 ?auto_714256 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_714251 ?auto_714252 ?auto_714253 )
      ( MAKE-10CRATE-VERIFY ?auto_714244 ?auto_714245 ?auto_714246 ?auto_714243 ?auto_714247 ?auto_714249 ?auto_714248 ?auto_714250 ?auto_714251 ?auto_714252 ?auto_714253 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_714370 - SURFACE
      ?auto_714371 - SURFACE
      ?auto_714372 - SURFACE
      ?auto_714369 - SURFACE
      ?auto_714373 - SURFACE
      ?auto_714375 - SURFACE
      ?auto_714374 - SURFACE
      ?auto_714376 - SURFACE
      ?auto_714377 - SURFACE
      ?auto_714378 - SURFACE
      ?auto_714379 - SURFACE
    )
    :vars
    (
      ?auto_714380 - HOIST
      ?auto_714383 - PLACE
      ?auto_714384 - PLACE
      ?auto_714382 - HOIST
      ?auto_714381 - SURFACE
      ?auto_714385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_714380 ?auto_714383 ) ( IS-CRATE ?auto_714379 ) ( not ( = ?auto_714378 ?auto_714379 ) ) ( not ( = ?auto_714377 ?auto_714378 ) ) ( not ( = ?auto_714377 ?auto_714379 ) ) ( not ( = ?auto_714384 ?auto_714383 ) ) ( HOIST-AT ?auto_714382 ?auto_714384 ) ( not ( = ?auto_714380 ?auto_714382 ) ) ( AVAILABLE ?auto_714382 ) ( SURFACE-AT ?auto_714379 ?auto_714384 ) ( ON ?auto_714379 ?auto_714381 ) ( CLEAR ?auto_714379 ) ( not ( = ?auto_714378 ?auto_714381 ) ) ( not ( = ?auto_714379 ?auto_714381 ) ) ( not ( = ?auto_714377 ?auto_714381 ) ) ( TRUCK-AT ?auto_714385 ?auto_714383 ) ( SURFACE-AT ?auto_714377 ?auto_714383 ) ( CLEAR ?auto_714377 ) ( IS-CRATE ?auto_714378 ) ( AVAILABLE ?auto_714380 ) ( IN ?auto_714378 ?auto_714385 ) ( ON ?auto_714371 ?auto_714370 ) ( ON ?auto_714372 ?auto_714371 ) ( ON ?auto_714369 ?auto_714372 ) ( ON ?auto_714373 ?auto_714369 ) ( ON ?auto_714375 ?auto_714373 ) ( ON ?auto_714374 ?auto_714375 ) ( ON ?auto_714376 ?auto_714374 ) ( ON ?auto_714377 ?auto_714376 ) ( not ( = ?auto_714370 ?auto_714371 ) ) ( not ( = ?auto_714370 ?auto_714372 ) ) ( not ( = ?auto_714370 ?auto_714369 ) ) ( not ( = ?auto_714370 ?auto_714373 ) ) ( not ( = ?auto_714370 ?auto_714375 ) ) ( not ( = ?auto_714370 ?auto_714374 ) ) ( not ( = ?auto_714370 ?auto_714376 ) ) ( not ( = ?auto_714370 ?auto_714377 ) ) ( not ( = ?auto_714370 ?auto_714378 ) ) ( not ( = ?auto_714370 ?auto_714379 ) ) ( not ( = ?auto_714370 ?auto_714381 ) ) ( not ( = ?auto_714371 ?auto_714372 ) ) ( not ( = ?auto_714371 ?auto_714369 ) ) ( not ( = ?auto_714371 ?auto_714373 ) ) ( not ( = ?auto_714371 ?auto_714375 ) ) ( not ( = ?auto_714371 ?auto_714374 ) ) ( not ( = ?auto_714371 ?auto_714376 ) ) ( not ( = ?auto_714371 ?auto_714377 ) ) ( not ( = ?auto_714371 ?auto_714378 ) ) ( not ( = ?auto_714371 ?auto_714379 ) ) ( not ( = ?auto_714371 ?auto_714381 ) ) ( not ( = ?auto_714372 ?auto_714369 ) ) ( not ( = ?auto_714372 ?auto_714373 ) ) ( not ( = ?auto_714372 ?auto_714375 ) ) ( not ( = ?auto_714372 ?auto_714374 ) ) ( not ( = ?auto_714372 ?auto_714376 ) ) ( not ( = ?auto_714372 ?auto_714377 ) ) ( not ( = ?auto_714372 ?auto_714378 ) ) ( not ( = ?auto_714372 ?auto_714379 ) ) ( not ( = ?auto_714372 ?auto_714381 ) ) ( not ( = ?auto_714369 ?auto_714373 ) ) ( not ( = ?auto_714369 ?auto_714375 ) ) ( not ( = ?auto_714369 ?auto_714374 ) ) ( not ( = ?auto_714369 ?auto_714376 ) ) ( not ( = ?auto_714369 ?auto_714377 ) ) ( not ( = ?auto_714369 ?auto_714378 ) ) ( not ( = ?auto_714369 ?auto_714379 ) ) ( not ( = ?auto_714369 ?auto_714381 ) ) ( not ( = ?auto_714373 ?auto_714375 ) ) ( not ( = ?auto_714373 ?auto_714374 ) ) ( not ( = ?auto_714373 ?auto_714376 ) ) ( not ( = ?auto_714373 ?auto_714377 ) ) ( not ( = ?auto_714373 ?auto_714378 ) ) ( not ( = ?auto_714373 ?auto_714379 ) ) ( not ( = ?auto_714373 ?auto_714381 ) ) ( not ( = ?auto_714375 ?auto_714374 ) ) ( not ( = ?auto_714375 ?auto_714376 ) ) ( not ( = ?auto_714375 ?auto_714377 ) ) ( not ( = ?auto_714375 ?auto_714378 ) ) ( not ( = ?auto_714375 ?auto_714379 ) ) ( not ( = ?auto_714375 ?auto_714381 ) ) ( not ( = ?auto_714374 ?auto_714376 ) ) ( not ( = ?auto_714374 ?auto_714377 ) ) ( not ( = ?auto_714374 ?auto_714378 ) ) ( not ( = ?auto_714374 ?auto_714379 ) ) ( not ( = ?auto_714374 ?auto_714381 ) ) ( not ( = ?auto_714376 ?auto_714377 ) ) ( not ( = ?auto_714376 ?auto_714378 ) ) ( not ( = ?auto_714376 ?auto_714379 ) ) ( not ( = ?auto_714376 ?auto_714381 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_714377 ?auto_714378 ?auto_714379 )
      ( MAKE-10CRATE-VERIFY ?auto_714370 ?auto_714371 ?auto_714372 ?auto_714369 ?auto_714373 ?auto_714375 ?auto_714374 ?auto_714376 ?auto_714377 ?auto_714378 ?auto_714379 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_721654 - SURFACE
      ?auto_721655 - SURFACE
      ?auto_721656 - SURFACE
      ?auto_721653 - SURFACE
      ?auto_721657 - SURFACE
      ?auto_721659 - SURFACE
      ?auto_721658 - SURFACE
      ?auto_721660 - SURFACE
      ?auto_721661 - SURFACE
      ?auto_721662 - SURFACE
      ?auto_721663 - SURFACE
      ?auto_721664 - SURFACE
    )
    :vars
    (
      ?auto_721665 - HOIST
      ?auto_721666 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_721665 ?auto_721666 ) ( SURFACE-AT ?auto_721663 ?auto_721666 ) ( CLEAR ?auto_721663 ) ( LIFTING ?auto_721665 ?auto_721664 ) ( IS-CRATE ?auto_721664 ) ( not ( = ?auto_721663 ?auto_721664 ) ) ( ON ?auto_721655 ?auto_721654 ) ( ON ?auto_721656 ?auto_721655 ) ( ON ?auto_721653 ?auto_721656 ) ( ON ?auto_721657 ?auto_721653 ) ( ON ?auto_721659 ?auto_721657 ) ( ON ?auto_721658 ?auto_721659 ) ( ON ?auto_721660 ?auto_721658 ) ( ON ?auto_721661 ?auto_721660 ) ( ON ?auto_721662 ?auto_721661 ) ( ON ?auto_721663 ?auto_721662 ) ( not ( = ?auto_721654 ?auto_721655 ) ) ( not ( = ?auto_721654 ?auto_721656 ) ) ( not ( = ?auto_721654 ?auto_721653 ) ) ( not ( = ?auto_721654 ?auto_721657 ) ) ( not ( = ?auto_721654 ?auto_721659 ) ) ( not ( = ?auto_721654 ?auto_721658 ) ) ( not ( = ?auto_721654 ?auto_721660 ) ) ( not ( = ?auto_721654 ?auto_721661 ) ) ( not ( = ?auto_721654 ?auto_721662 ) ) ( not ( = ?auto_721654 ?auto_721663 ) ) ( not ( = ?auto_721654 ?auto_721664 ) ) ( not ( = ?auto_721655 ?auto_721656 ) ) ( not ( = ?auto_721655 ?auto_721653 ) ) ( not ( = ?auto_721655 ?auto_721657 ) ) ( not ( = ?auto_721655 ?auto_721659 ) ) ( not ( = ?auto_721655 ?auto_721658 ) ) ( not ( = ?auto_721655 ?auto_721660 ) ) ( not ( = ?auto_721655 ?auto_721661 ) ) ( not ( = ?auto_721655 ?auto_721662 ) ) ( not ( = ?auto_721655 ?auto_721663 ) ) ( not ( = ?auto_721655 ?auto_721664 ) ) ( not ( = ?auto_721656 ?auto_721653 ) ) ( not ( = ?auto_721656 ?auto_721657 ) ) ( not ( = ?auto_721656 ?auto_721659 ) ) ( not ( = ?auto_721656 ?auto_721658 ) ) ( not ( = ?auto_721656 ?auto_721660 ) ) ( not ( = ?auto_721656 ?auto_721661 ) ) ( not ( = ?auto_721656 ?auto_721662 ) ) ( not ( = ?auto_721656 ?auto_721663 ) ) ( not ( = ?auto_721656 ?auto_721664 ) ) ( not ( = ?auto_721653 ?auto_721657 ) ) ( not ( = ?auto_721653 ?auto_721659 ) ) ( not ( = ?auto_721653 ?auto_721658 ) ) ( not ( = ?auto_721653 ?auto_721660 ) ) ( not ( = ?auto_721653 ?auto_721661 ) ) ( not ( = ?auto_721653 ?auto_721662 ) ) ( not ( = ?auto_721653 ?auto_721663 ) ) ( not ( = ?auto_721653 ?auto_721664 ) ) ( not ( = ?auto_721657 ?auto_721659 ) ) ( not ( = ?auto_721657 ?auto_721658 ) ) ( not ( = ?auto_721657 ?auto_721660 ) ) ( not ( = ?auto_721657 ?auto_721661 ) ) ( not ( = ?auto_721657 ?auto_721662 ) ) ( not ( = ?auto_721657 ?auto_721663 ) ) ( not ( = ?auto_721657 ?auto_721664 ) ) ( not ( = ?auto_721659 ?auto_721658 ) ) ( not ( = ?auto_721659 ?auto_721660 ) ) ( not ( = ?auto_721659 ?auto_721661 ) ) ( not ( = ?auto_721659 ?auto_721662 ) ) ( not ( = ?auto_721659 ?auto_721663 ) ) ( not ( = ?auto_721659 ?auto_721664 ) ) ( not ( = ?auto_721658 ?auto_721660 ) ) ( not ( = ?auto_721658 ?auto_721661 ) ) ( not ( = ?auto_721658 ?auto_721662 ) ) ( not ( = ?auto_721658 ?auto_721663 ) ) ( not ( = ?auto_721658 ?auto_721664 ) ) ( not ( = ?auto_721660 ?auto_721661 ) ) ( not ( = ?auto_721660 ?auto_721662 ) ) ( not ( = ?auto_721660 ?auto_721663 ) ) ( not ( = ?auto_721660 ?auto_721664 ) ) ( not ( = ?auto_721661 ?auto_721662 ) ) ( not ( = ?auto_721661 ?auto_721663 ) ) ( not ( = ?auto_721661 ?auto_721664 ) ) ( not ( = ?auto_721662 ?auto_721663 ) ) ( not ( = ?auto_721662 ?auto_721664 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_721663 ?auto_721664 )
      ( MAKE-11CRATE-VERIFY ?auto_721654 ?auto_721655 ?auto_721656 ?auto_721653 ?auto_721657 ?auto_721659 ?auto_721658 ?auto_721660 ?auto_721661 ?auto_721662 ?auto_721663 ?auto_721664 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_721763 - SURFACE
      ?auto_721764 - SURFACE
      ?auto_721765 - SURFACE
      ?auto_721762 - SURFACE
      ?auto_721766 - SURFACE
      ?auto_721768 - SURFACE
      ?auto_721767 - SURFACE
      ?auto_721769 - SURFACE
      ?auto_721770 - SURFACE
      ?auto_721771 - SURFACE
      ?auto_721772 - SURFACE
      ?auto_721773 - SURFACE
    )
    :vars
    (
      ?auto_721776 - HOIST
      ?auto_721774 - PLACE
      ?auto_721775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_721776 ?auto_721774 ) ( SURFACE-AT ?auto_721772 ?auto_721774 ) ( CLEAR ?auto_721772 ) ( IS-CRATE ?auto_721773 ) ( not ( = ?auto_721772 ?auto_721773 ) ) ( TRUCK-AT ?auto_721775 ?auto_721774 ) ( AVAILABLE ?auto_721776 ) ( IN ?auto_721773 ?auto_721775 ) ( ON ?auto_721772 ?auto_721771 ) ( not ( = ?auto_721771 ?auto_721772 ) ) ( not ( = ?auto_721771 ?auto_721773 ) ) ( ON ?auto_721764 ?auto_721763 ) ( ON ?auto_721765 ?auto_721764 ) ( ON ?auto_721762 ?auto_721765 ) ( ON ?auto_721766 ?auto_721762 ) ( ON ?auto_721768 ?auto_721766 ) ( ON ?auto_721767 ?auto_721768 ) ( ON ?auto_721769 ?auto_721767 ) ( ON ?auto_721770 ?auto_721769 ) ( ON ?auto_721771 ?auto_721770 ) ( not ( = ?auto_721763 ?auto_721764 ) ) ( not ( = ?auto_721763 ?auto_721765 ) ) ( not ( = ?auto_721763 ?auto_721762 ) ) ( not ( = ?auto_721763 ?auto_721766 ) ) ( not ( = ?auto_721763 ?auto_721768 ) ) ( not ( = ?auto_721763 ?auto_721767 ) ) ( not ( = ?auto_721763 ?auto_721769 ) ) ( not ( = ?auto_721763 ?auto_721770 ) ) ( not ( = ?auto_721763 ?auto_721771 ) ) ( not ( = ?auto_721763 ?auto_721772 ) ) ( not ( = ?auto_721763 ?auto_721773 ) ) ( not ( = ?auto_721764 ?auto_721765 ) ) ( not ( = ?auto_721764 ?auto_721762 ) ) ( not ( = ?auto_721764 ?auto_721766 ) ) ( not ( = ?auto_721764 ?auto_721768 ) ) ( not ( = ?auto_721764 ?auto_721767 ) ) ( not ( = ?auto_721764 ?auto_721769 ) ) ( not ( = ?auto_721764 ?auto_721770 ) ) ( not ( = ?auto_721764 ?auto_721771 ) ) ( not ( = ?auto_721764 ?auto_721772 ) ) ( not ( = ?auto_721764 ?auto_721773 ) ) ( not ( = ?auto_721765 ?auto_721762 ) ) ( not ( = ?auto_721765 ?auto_721766 ) ) ( not ( = ?auto_721765 ?auto_721768 ) ) ( not ( = ?auto_721765 ?auto_721767 ) ) ( not ( = ?auto_721765 ?auto_721769 ) ) ( not ( = ?auto_721765 ?auto_721770 ) ) ( not ( = ?auto_721765 ?auto_721771 ) ) ( not ( = ?auto_721765 ?auto_721772 ) ) ( not ( = ?auto_721765 ?auto_721773 ) ) ( not ( = ?auto_721762 ?auto_721766 ) ) ( not ( = ?auto_721762 ?auto_721768 ) ) ( not ( = ?auto_721762 ?auto_721767 ) ) ( not ( = ?auto_721762 ?auto_721769 ) ) ( not ( = ?auto_721762 ?auto_721770 ) ) ( not ( = ?auto_721762 ?auto_721771 ) ) ( not ( = ?auto_721762 ?auto_721772 ) ) ( not ( = ?auto_721762 ?auto_721773 ) ) ( not ( = ?auto_721766 ?auto_721768 ) ) ( not ( = ?auto_721766 ?auto_721767 ) ) ( not ( = ?auto_721766 ?auto_721769 ) ) ( not ( = ?auto_721766 ?auto_721770 ) ) ( not ( = ?auto_721766 ?auto_721771 ) ) ( not ( = ?auto_721766 ?auto_721772 ) ) ( not ( = ?auto_721766 ?auto_721773 ) ) ( not ( = ?auto_721768 ?auto_721767 ) ) ( not ( = ?auto_721768 ?auto_721769 ) ) ( not ( = ?auto_721768 ?auto_721770 ) ) ( not ( = ?auto_721768 ?auto_721771 ) ) ( not ( = ?auto_721768 ?auto_721772 ) ) ( not ( = ?auto_721768 ?auto_721773 ) ) ( not ( = ?auto_721767 ?auto_721769 ) ) ( not ( = ?auto_721767 ?auto_721770 ) ) ( not ( = ?auto_721767 ?auto_721771 ) ) ( not ( = ?auto_721767 ?auto_721772 ) ) ( not ( = ?auto_721767 ?auto_721773 ) ) ( not ( = ?auto_721769 ?auto_721770 ) ) ( not ( = ?auto_721769 ?auto_721771 ) ) ( not ( = ?auto_721769 ?auto_721772 ) ) ( not ( = ?auto_721769 ?auto_721773 ) ) ( not ( = ?auto_721770 ?auto_721771 ) ) ( not ( = ?auto_721770 ?auto_721772 ) ) ( not ( = ?auto_721770 ?auto_721773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_721771 ?auto_721772 ?auto_721773 )
      ( MAKE-11CRATE-VERIFY ?auto_721763 ?auto_721764 ?auto_721765 ?auto_721762 ?auto_721766 ?auto_721768 ?auto_721767 ?auto_721769 ?auto_721770 ?auto_721771 ?auto_721772 ?auto_721773 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_721884 - SURFACE
      ?auto_721885 - SURFACE
      ?auto_721886 - SURFACE
      ?auto_721883 - SURFACE
      ?auto_721887 - SURFACE
      ?auto_721889 - SURFACE
      ?auto_721888 - SURFACE
      ?auto_721890 - SURFACE
      ?auto_721891 - SURFACE
      ?auto_721892 - SURFACE
      ?auto_721893 - SURFACE
      ?auto_721894 - SURFACE
    )
    :vars
    (
      ?auto_721898 - HOIST
      ?auto_721897 - PLACE
      ?auto_721896 - TRUCK
      ?auto_721895 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_721898 ?auto_721897 ) ( SURFACE-AT ?auto_721893 ?auto_721897 ) ( CLEAR ?auto_721893 ) ( IS-CRATE ?auto_721894 ) ( not ( = ?auto_721893 ?auto_721894 ) ) ( AVAILABLE ?auto_721898 ) ( IN ?auto_721894 ?auto_721896 ) ( ON ?auto_721893 ?auto_721892 ) ( not ( = ?auto_721892 ?auto_721893 ) ) ( not ( = ?auto_721892 ?auto_721894 ) ) ( TRUCK-AT ?auto_721896 ?auto_721895 ) ( not ( = ?auto_721895 ?auto_721897 ) ) ( ON ?auto_721885 ?auto_721884 ) ( ON ?auto_721886 ?auto_721885 ) ( ON ?auto_721883 ?auto_721886 ) ( ON ?auto_721887 ?auto_721883 ) ( ON ?auto_721889 ?auto_721887 ) ( ON ?auto_721888 ?auto_721889 ) ( ON ?auto_721890 ?auto_721888 ) ( ON ?auto_721891 ?auto_721890 ) ( ON ?auto_721892 ?auto_721891 ) ( not ( = ?auto_721884 ?auto_721885 ) ) ( not ( = ?auto_721884 ?auto_721886 ) ) ( not ( = ?auto_721884 ?auto_721883 ) ) ( not ( = ?auto_721884 ?auto_721887 ) ) ( not ( = ?auto_721884 ?auto_721889 ) ) ( not ( = ?auto_721884 ?auto_721888 ) ) ( not ( = ?auto_721884 ?auto_721890 ) ) ( not ( = ?auto_721884 ?auto_721891 ) ) ( not ( = ?auto_721884 ?auto_721892 ) ) ( not ( = ?auto_721884 ?auto_721893 ) ) ( not ( = ?auto_721884 ?auto_721894 ) ) ( not ( = ?auto_721885 ?auto_721886 ) ) ( not ( = ?auto_721885 ?auto_721883 ) ) ( not ( = ?auto_721885 ?auto_721887 ) ) ( not ( = ?auto_721885 ?auto_721889 ) ) ( not ( = ?auto_721885 ?auto_721888 ) ) ( not ( = ?auto_721885 ?auto_721890 ) ) ( not ( = ?auto_721885 ?auto_721891 ) ) ( not ( = ?auto_721885 ?auto_721892 ) ) ( not ( = ?auto_721885 ?auto_721893 ) ) ( not ( = ?auto_721885 ?auto_721894 ) ) ( not ( = ?auto_721886 ?auto_721883 ) ) ( not ( = ?auto_721886 ?auto_721887 ) ) ( not ( = ?auto_721886 ?auto_721889 ) ) ( not ( = ?auto_721886 ?auto_721888 ) ) ( not ( = ?auto_721886 ?auto_721890 ) ) ( not ( = ?auto_721886 ?auto_721891 ) ) ( not ( = ?auto_721886 ?auto_721892 ) ) ( not ( = ?auto_721886 ?auto_721893 ) ) ( not ( = ?auto_721886 ?auto_721894 ) ) ( not ( = ?auto_721883 ?auto_721887 ) ) ( not ( = ?auto_721883 ?auto_721889 ) ) ( not ( = ?auto_721883 ?auto_721888 ) ) ( not ( = ?auto_721883 ?auto_721890 ) ) ( not ( = ?auto_721883 ?auto_721891 ) ) ( not ( = ?auto_721883 ?auto_721892 ) ) ( not ( = ?auto_721883 ?auto_721893 ) ) ( not ( = ?auto_721883 ?auto_721894 ) ) ( not ( = ?auto_721887 ?auto_721889 ) ) ( not ( = ?auto_721887 ?auto_721888 ) ) ( not ( = ?auto_721887 ?auto_721890 ) ) ( not ( = ?auto_721887 ?auto_721891 ) ) ( not ( = ?auto_721887 ?auto_721892 ) ) ( not ( = ?auto_721887 ?auto_721893 ) ) ( not ( = ?auto_721887 ?auto_721894 ) ) ( not ( = ?auto_721889 ?auto_721888 ) ) ( not ( = ?auto_721889 ?auto_721890 ) ) ( not ( = ?auto_721889 ?auto_721891 ) ) ( not ( = ?auto_721889 ?auto_721892 ) ) ( not ( = ?auto_721889 ?auto_721893 ) ) ( not ( = ?auto_721889 ?auto_721894 ) ) ( not ( = ?auto_721888 ?auto_721890 ) ) ( not ( = ?auto_721888 ?auto_721891 ) ) ( not ( = ?auto_721888 ?auto_721892 ) ) ( not ( = ?auto_721888 ?auto_721893 ) ) ( not ( = ?auto_721888 ?auto_721894 ) ) ( not ( = ?auto_721890 ?auto_721891 ) ) ( not ( = ?auto_721890 ?auto_721892 ) ) ( not ( = ?auto_721890 ?auto_721893 ) ) ( not ( = ?auto_721890 ?auto_721894 ) ) ( not ( = ?auto_721891 ?auto_721892 ) ) ( not ( = ?auto_721891 ?auto_721893 ) ) ( not ( = ?auto_721891 ?auto_721894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_721892 ?auto_721893 ?auto_721894 )
      ( MAKE-11CRATE-VERIFY ?auto_721884 ?auto_721885 ?auto_721886 ?auto_721883 ?auto_721887 ?auto_721889 ?auto_721888 ?auto_721890 ?auto_721891 ?auto_721892 ?auto_721893 ?auto_721894 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_722016 - SURFACE
      ?auto_722017 - SURFACE
      ?auto_722018 - SURFACE
      ?auto_722015 - SURFACE
      ?auto_722019 - SURFACE
      ?auto_722021 - SURFACE
      ?auto_722020 - SURFACE
      ?auto_722022 - SURFACE
      ?auto_722023 - SURFACE
      ?auto_722024 - SURFACE
      ?auto_722025 - SURFACE
      ?auto_722026 - SURFACE
    )
    :vars
    (
      ?auto_722028 - HOIST
      ?auto_722031 - PLACE
      ?auto_722027 - TRUCK
      ?auto_722029 - PLACE
      ?auto_722030 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_722028 ?auto_722031 ) ( SURFACE-AT ?auto_722025 ?auto_722031 ) ( CLEAR ?auto_722025 ) ( IS-CRATE ?auto_722026 ) ( not ( = ?auto_722025 ?auto_722026 ) ) ( AVAILABLE ?auto_722028 ) ( ON ?auto_722025 ?auto_722024 ) ( not ( = ?auto_722024 ?auto_722025 ) ) ( not ( = ?auto_722024 ?auto_722026 ) ) ( TRUCK-AT ?auto_722027 ?auto_722029 ) ( not ( = ?auto_722029 ?auto_722031 ) ) ( HOIST-AT ?auto_722030 ?auto_722029 ) ( LIFTING ?auto_722030 ?auto_722026 ) ( not ( = ?auto_722028 ?auto_722030 ) ) ( ON ?auto_722017 ?auto_722016 ) ( ON ?auto_722018 ?auto_722017 ) ( ON ?auto_722015 ?auto_722018 ) ( ON ?auto_722019 ?auto_722015 ) ( ON ?auto_722021 ?auto_722019 ) ( ON ?auto_722020 ?auto_722021 ) ( ON ?auto_722022 ?auto_722020 ) ( ON ?auto_722023 ?auto_722022 ) ( ON ?auto_722024 ?auto_722023 ) ( not ( = ?auto_722016 ?auto_722017 ) ) ( not ( = ?auto_722016 ?auto_722018 ) ) ( not ( = ?auto_722016 ?auto_722015 ) ) ( not ( = ?auto_722016 ?auto_722019 ) ) ( not ( = ?auto_722016 ?auto_722021 ) ) ( not ( = ?auto_722016 ?auto_722020 ) ) ( not ( = ?auto_722016 ?auto_722022 ) ) ( not ( = ?auto_722016 ?auto_722023 ) ) ( not ( = ?auto_722016 ?auto_722024 ) ) ( not ( = ?auto_722016 ?auto_722025 ) ) ( not ( = ?auto_722016 ?auto_722026 ) ) ( not ( = ?auto_722017 ?auto_722018 ) ) ( not ( = ?auto_722017 ?auto_722015 ) ) ( not ( = ?auto_722017 ?auto_722019 ) ) ( not ( = ?auto_722017 ?auto_722021 ) ) ( not ( = ?auto_722017 ?auto_722020 ) ) ( not ( = ?auto_722017 ?auto_722022 ) ) ( not ( = ?auto_722017 ?auto_722023 ) ) ( not ( = ?auto_722017 ?auto_722024 ) ) ( not ( = ?auto_722017 ?auto_722025 ) ) ( not ( = ?auto_722017 ?auto_722026 ) ) ( not ( = ?auto_722018 ?auto_722015 ) ) ( not ( = ?auto_722018 ?auto_722019 ) ) ( not ( = ?auto_722018 ?auto_722021 ) ) ( not ( = ?auto_722018 ?auto_722020 ) ) ( not ( = ?auto_722018 ?auto_722022 ) ) ( not ( = ?auto_722018 ?auto_722023 ) ) ( not ( = ?auto_722018 ?auto_722024 ) ) ( not ( = ?auto_722018 ?auto_722025 ) ) ( not ( = ?auto_722018 ?auto_722026 ) ) ( not ( = ?auto_722015 ?auto_722019 ) ) ( not ( = ?auto_722015 ?auto_722021 ) ) ( not ( = ?auto_722015 ?auto_722020 ) ) ( not ( = ?auto_722015 ?auto_722022 ) ) ( not ( = ?auto_722015 ?auto_722023 ) ) ( not ( = ?auto_722015 ?auto_722024 ) ) ( not ( = ?auto_722015 ?auto_722025 ) ) ( not ( = ?auto_722015 ?auto_722026 ) ) ( not ( = ?auto_722019 ?auto_722021 ) ) ( not ( = ?auto_722019 ?auto_722020 ) ) ( not ( = ?auto_722019 ?auto_722022 ) ) ( not ( = ?auto_722019 ?auto_722023 ) ) ( not ( = ?auto_722019 ?auto_722024 ) ) ( not ( = ?auto_722019 ?auto_722025 ) ) ( not ( = ?auto_722019 ?auto_722026 ) ) ( not ( = ?auto_722021 ?auto_722020 ) ) ( not ( = ?auto_722021 ?auto_722022 ) ) ( not ( = ?auto_722021 ?auto_722023 ) ) ( not ( = ?auto_722021 ?auto_722024 ) ) ( not ( = ?auto_722021 ?auto_722025 ) ) ( not ( = ?auto_722021 ?auto_722026 ) ) ( not ( = ?auto_722020 ?auto_722022 ) ) ( not ( = ?auto_722020 ?auto_722023 ) ) ( not ( = ?auto_722020 ?auto_722024 ) ) ( not ( = ?auto_722020 ?auto_722025 ) ) ( not ( = ?auto_722020 ?auto_722026 ) ) ( not ( = ?auto_722022 ?auto_722023 ) ) ( not ( = ?auto_722022 ?auto_722024 ) ) ( not ( = ?auto_722022 ?auto_722025 ) ) ( not ( = ?auto_722022 ?auto_722026 ) ) ( not ( = ?auto_722023 ?auto_722024 ) ) ( not ( = ?auto_722023 ?auto_722025 ) ) ( not ( = ?auto_722023 ?auto_722026 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_722024 ?auto_722025 ?auto_722026 )
      ( MAKE-11CRATE-VERIFY ?auto_722016 ?auto_722017 ?auto_722018 ?auto_722015 ?auto_722019 ?auto_722021 ?auto_722020 ?auto_722022 ?auto_722023 ?auto_722024 ?auto_722025 ?auto_722026 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_722159 - SURFACE
      ?auto_722160 - SURFACE
      ?auto_722161 - SURFACE
      ?auto_722158 - SURFACE
      ?auto_722162 - SURFACE
      ?auto_722164 - SURFACE
      ?auto_722163 - SURFACE
      ?auto_722165 - SURFACE
      ?auto_722166 - SURFACE
      ?auto_722167 - SURFACE
      ?auto_722168 - SURFACE
      ?auto_722169 - SURFACE
    )
    :vars
    (
      ?auto_722174 - HOIST
      ?auto_722172 - PLACE
      ?auto_722173 - TRUCK
      ?auto_722170 - PLACE
      ?auto_722171 - HOIST
      ?auto_722175 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_722174 ?auto_722172 ) ( SURFACE-AT ?auto_722168 ?auto_722172 ) ( CLEAR ?auto_722168 ) ( IS-CRATE ?auto_722169 ) ( not ( = ?auto_722168 ?auto_722169 ) ) ( AVAILABLE ?auto_722174 ) ( ON ?auto_722168 ?auto_722167 ) ( not ( = ?auto_722167 ?auto_722168 ) ) ( not ( = ?auto_722167 ?auto_722169 ) ) ( TRUCK-AT ?auto_722173 ?auto_722170 ) ( not ( = ?auto_722170 ?auto_722172 ) ) ( HOIST-AT ?auto_722171 ?auto_722170 ) ( not ( = ?auto_722174 ?auto_722171 ) ) ( AVAILABLE ?auto_722171 ) ( SURFACE-AT ?auto_722169 ?auto_722170 ) ( ON ?auto_722169 ?auto_722175 ) ( CLEAR ?auto_722169 ) ( not ( = ?auto_722168 ?auto_722175 ) ) ( not ( = ?auto_722169 ?auto_722175 ) ) ( not ( = ?auto_722167 ?auto_722175 ) ) ( ON ?auto_722160 ?auto_722159 ) ( ON ?auto_722161 ?auto_722160 ) ( ON ?auto_722158 ?auto_722161 ) ( ON ?auto_722162 ?auto_722158 ) ( ON ?auto_722164 ?auto_722162 ) ( ON ?auto_722163 ?auto_722164 ) ( ON ?auto_722165 ?auto_722163 ) ( ON ?auto_722166 ?auto_722165 ) ( ON ?auto_722167 ?auto_722166 ) ( not ( = ?auto_722159 ?auto_722160 ) ) ( not ( = ?auto_722159 ?auto_722161 ) ) ( not ( = ?auto_722159 ?auto_722158 ) ) ( not ( = ?auto_722159 ?auto_722162 ) ) ( not ( = ?auto_722159 ?auto_722164 ) ) ( not ( = ?auto_722159 ?auto_722163 ) ) ( not ( = ?auto_722159 ?auto_722165 ) ) ( not ( = ?auto_722159 ?auto_722166 ) ) ( not ( = ?auto_722159 ?auto_722167 ) ) ( not ( = ?auto_722159 ?auto_722168 ) ) ( not ( = ?auto_722159 ?auto_722169 ) ) ( not ( = ?auto_722159 ?auto_722175 ) ) ( not ( = ?auto_722160 ?auto_722161 ) ) ( not ( = ?auto_722160 ?auto_722158 ) ) ( not ( = ?auto_722160 ?auto_722162 ) ) ( not ( = ?auto_722160 ?auto_722164 ) ) ( not ( = ?auto_722160 ?auto_722163 ) ) ( not ( = ?auto_722160 ?auto_722165 ) ) ( not ( = ?auto_722160 ?auto_722166 ) ) ( not ( = ?auto_722160 ?auto_722167 ) ) ( not ( = ?auto_722160 ?auto_722168 ) ) ( not ( = ?auto_722160 ?auto_722169 ) ) ( not ( = ?auto_722160 ?auto_722175 ) ) ( not ( = ?auto_722161 ?auto_722158 ) ) ( not ( = ?auto_722161 ?auto_722162 ) ) ( not ( = ?auto_722161 ?auto_722164 ) ) ( not ( = ?auto_722161 ?auto_722163 ) ) ( not ( = ?auto_722161 ?auto_722165 ) ) ( not ( = ?auto_722161 ?auto_722166 ) ) ( not ( = ?auto_722161 ?auto_722167 ) ) ( not ( = ?auto_722161 ?auto_722168 ) ) ( not ( = ?auto_722161 ?auto_722169 ) ) ( not ( = ?auto_722161 ?auto_722175 ) ) ( not ( = ?auto_722158 ?auto_722162 ) ) ( not ( = ?auto_722158 ?auto_722164 ) ) ( not ( = ?auto_722158 ?auto_722163 ) ) ( not ( = ?auto_722158 ?auto_722165 ) ) ( not ( = ?auto_722158 ?auto_722166 ) ) ( not ( = ?auto_722158 ?auto_722167 ) ) ( not ( = ?auto_722158 ?auto_722168 ) ) ( not ( = ?auto_722158 ?auto_722169 ) ) ( not ( = ?auto_722158 ?auto_722175 ) ) ( not ( = ?auto_722162 ?auto_722164 ) ) ( not ( = ?auto_722162 ?auto_722163 ) ) ( not ( = ?auto_722162 ?auto_722165 ) ) ( not ( = ?auto_722162 ?auto_722166 ) ) ( not ( = ?auto_722162 ?auto_722167 ) ) ( not ( = ?auto_722162 ?auto_722168 ) ) ( not ( = ?auto_722162 ?auto_722169 ) ) ( not ( = ?auto_722162 ?auto_722175 ) ) ( not ( = ?auto_722164 ?auto_722163 ) ) ( not ( = ?auto_722164 ?auto_722165 ) ) ( not ( = ?auto_722164 ?auto_722166 ) ) ( not ( = ?auto_722164 ?auto_722167 ) ) ( not ( = ?auto_722164 ?auto_722168 ) ) ( not ( = ?auto_722164 ?auto_722169 ) ) ( not ( = ?auto_722164 ?auto_722175 ) ) ( not ( = ?auto_722163 ?auto_722165 ) ) ( not ( = ?auto_722163 ?auto_722166 ) ) ( not ( = ?auto_722163 ?auto_722167 ) ) ( not ( = ?auto_722163 ?auto_722168 ) ) ( not ( = ?auto_722163 ?auto_722169 ) ) ( not ( = ?auto_722163 ?auto_722175 ) ) ( not ( = ?auto_722165 ?auto_722166 ) ) ( not ( = ?auto_722165 ?auto_722167 ) ) ( not ( = ?auto_722165 ?auto_722168 ) ) ( not ( = ?auto_722165 ?auto_722169 ) ) ( not ( = ?auto_722165 ?auto_722175 ) ) ( not ( = ?auto_722166 ?auto_722167 ) ) ( not ( = ?auto_722166 ?auto_722168 ) ) ( not ( = ?auto_722166 ?auto_722169 ) ) ( not ( = ?auto_722166 ?auto_722175 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_722167 ?auto_722168 ?auto_722169 )
      ( MAKE-11CRATE-VERIFY ?auto_722159 ?auto_722160 ?auto_722161 ?auto_722158 ?auto_722162 ?auto_722164 ?auto_722163 ?auto_722165 ?auto_722166 ?auto_722167 ?auto_722168 ?auto_722169 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_722303 - SURFACE
      ?auto_722304 - SURFACE
      ?auto_722305 - SURFACE
      ?auto_722302 - SURFACE
      ?auto_722306 - SURFACE
      ?auto_722308 - SURFACE
      ?auto_722307 - SURFACE
      ?auto_722309 - SURFACE
      ?auto_722310 - SURFACE
      ?auto_722311 - SURFACE
      ?auto_722312 - SURFACE
      ?auto_722313 - SURFACE
    )
    :vars
    (
      ?auto_722319 - HOIST
      ?auto_722317 - PLACE
      ?auto_722314 - PLACE
      ?auto_722315 - HOIST
      ?auto_722316 - SURFACE
      ?auto_722318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_722319 ?auto_722317 ) ( SURFACE-AT ?auto_722312 ?auto_722317 ) ( CLEAR ?auto_722312 ) ( IS-CRATE ?auto_722313 ) ( not ( = ?auto_722312 ?auto_722313 ) ) ( AVAILABLE ?auto_722319 ) ( ON ?auto_722312 ?auto_722311 ) ( not ( = ?auto_722311 ?auto_722312 ) ) ( not ( = ?auto_722311 ?auto_722313 ) ) ( not ( = ?auto_722314 ?auto_722317 ) ) ( HOIST-AT ?auto_722315 ?auto_722314 ) ( not ( = ?auto_722319 ?auto_722315 ) ) ( AVAILABLE ?auto_722315 ) ( SURFACE-AT ?auto_722313 ?auto_722314 ) ( ON ?auto_722313 ?auto_722316 ) ( CLEAR ?auto_722313 ) ( not ( = ?auto_722312 ?auto_722316 ) ) ( not ( = ?auto_722313 ?auto_722316 ) ) ( not ( = ?auto_722311 ?auto_722316 ) ) ( TRUCK-AT ?auto_722318 ?auto_722317 ) ( ON ?auto_722304 ?auto_722303 ) ( ON ?auto_722305 ?auto_722304 ) ( ON ?auto_722302 ?auto_722305 ) ( ON ?auto_722306 ?auto_722302 ) ( ON ?auto_722308 ?auto_722306 ) ( ON ?auto_722307 ?auto_722308 ) ( ON ?auto_722309 ?auto_722307 ) ( ON ?auto_722310 ?auto_722309 ) ( ON ?auto_722311 ?auto_722310 ) ( not ( = ?auto_722303 ?auto_722304 ) ) ( not ( = ?auto_722303 ?auto_722305 ) ) ( not ( = ?auto_722303 ?auto_722302 ) ) ( not ( = ?auto_722303 ?auto_722306 ) ) ( not ( = ?auto_722303 ?auto_722308 ) ) ( not ( = ?auto_722303 ?auto_722307 ) ) ( not ( = ?auto_722303 ?auto_722309 ) ) ( not ( = ?auto_722303 ?auto_722310 ) ) ( not ( = ?auto_722303 ?auto_722311 ) ) ( not ( = ?auto_722303 ?auto_722312 ) ) ( not ( = ?auto_722303 ?auto_722313 ) ) ( not ( = ?auto_722303 ?auto_722316 ) ) ( not ( = ?auto_722304 ?auto_722305 ) ) ( not ( = ?auto_722304 ?auto_722302 ) ) ( not ( = ?auto_722304 ?auto_722306 ) ) ( not ( = ?auto_722304 ?auto_722308 ) ) ( not ( = ?auto_722304 ?auto_722307 ) ) ( not ( = ?auto_722304 ?auto_722309 ) ) ( not ( = ?auto_722304 ?auto_722310 ) ) ( not ( = ?auto_722304 ?auto_722311 ) ) ( not ( = ?auto_722304 ?auto_722312 ) ) ( not ( = ?auto_722304 ?auto_722313 ) ) ( not ( = ?auto_722304 ?auto_722316 ) ) ( not ( = ?auto_722305 ?auto_722302 ) ) ( not ( = ?auto_722305 ?auto_722306 ) ) ( not ( = ?auto_722305 ?auto_722308 ) ) ( not ( = ?auto_722305 ?auto_722307 ) ) ( not ( = ?auto_722305 ?auto_722309 ) ) ( not ( = ?auto_722305 ?auto_722310 ) ) ( not ( = ?auto_722305 ?auto_722311 ) ) ( not ( = ?auto_722305 ?auto_722312 ) ) ( not ( = ?auto_722305 ?auto_722313 ) ) ( not ( = ?auto_722305 ?auto_722316 ) ) ( not ( = ?auto_722302 ?auto_722306 ) ) ( not ( = ?auto_722302 ?auto_722308 ) ) ( not ( = ?auto_722302 ?auto_722307 ) ) ( not ( = ?auto_722302 ?auto_722309 ) ) ( not ( = ?auto_722302 ?auto_722310 ) ) ( not ( = ?auto_722302 ?auto_722311 ) ) ( not ( = ?auto_722302 ?auto_722312 ) ) ( not ( = ?auto_722302 ?auto_722313 ) ) ( not ( = ?auto_722302 ?auto_722316 ) ) ( not ( = ?auto_722306 ?auto_722308 ) ) ( not ( = ?auto_722306 ?auto_722307 ) ) ( not ( = ?auto_722306 ?auto_722309 ) ) ( not ( = ?auto_722306 ?auto_722310 ) ) ( not ( = ?auto_722306 ?auto_722311 ) ) ( not ( = ?auto_722306 ?auto_722312 ) ) ( not ( = ?auto_722306 ?auto_722313 ) ) ( not ( = ?auto_722306 ?auto_722316 ) ) ( not ( = ?auto_722308 ?auto_722307 ) ) ( not ( = ?auto_722308 ?auto_722309 ) ) ( not ( = ?auto_722308 ?auto_722310 ) ) ( not ( = ?auto_722308 ?auto_722311 ) ) ( not ( = ?auto_722308 ?auto_722312 ) ) ( not ( = ?auto_722308 ?auto_722313 ) ) ( not ( = ?auto_722308 ?auto_722316 ) ) ( not ( = ?auto_722307 ?auto_722309 ) ) ( not ( = ?auto_722307 ?auto_722310 ) ) ( not ( = ?auto_722307 ?auto_722311 ) ) ( not ( = ?auto_722307 ?auto_722312 ) ) ( not ( = ?auto_722307 ?auto_722313 ) ) ( not ( = ?auto_722307 ?auto_722316 ) ) ( not ( = ?auto_722309 ?auto_722310 ) ) ( not ( = ?auto_722309 ?auto_722311 ) ) ( not ( = ?auto_722309 ?auto_722312 ) ) ( not ( = ?auto_722309 ?auto_722313 ) ) ( not ( = ?auto_722309 ?auto_722316 ) ) ( not ( = ?auto_722310 ?auto_722311 ) ) ( not ( = ?auto_722310 ?auto_722312 ) ) ( not ( = ?auto_722310 ?auto_722313 ) ) ( not ( = ?auto_722310 ?auto_722316 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_722311 ?auto_722312 ?auto_722313 )
      ( MAKE-11CRATE-VERIFY ?auto_722303 ?auto_722304 ?auto_722305 ?auto_722302 ?auto_722306 ?auto_722308 ?auto_722307 ?auto_722309 ?auto_722310 ?auto_722311 ?auto_722312 ?auto_722313 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_722447 - SURFACE
      ?auto_722448 - SURFACE
      ?auto_722449 - SURFACE
      ?auto_722446 - SURFACE
      ?auto_722450 - SURFACE
      ?auto_722452 - SURFACE
      ?auto_722451 - SURFACE
      ?auto_722453 - SURFACE
      ?auto_722454 - SURFACE
      ?auto_722455 - SURFACE
      ?auto_722456 - SURFACE
      ?auto_722457 - SURFACE
    )
    :vars
    (
      ?auto_722458 - HOIST
      ?auto_722463 - PLACE
      ?auto_722462 - PLACE
      ?auto_722459 - HOIST
      ?auto_722460 - SURFACE
      ?auto_722461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_722458 ?auto_722463 ) ( IS-CRATE ?auto_722457 ) ( not ( = ?auto_722456 ?auto_722457 ) ) ( not ( = ?auto_722455 ?auto_722456 ) ) ( not ( = ?auto_722455 ?auto_722457 ) ) ( not ( = ?auto_722462 ?auto_722463 ) ) ( HOIST-AT ?auto_722459 ?auto_722462 ) ( not ( = ?auto_722458 ?auto_722459 ) ) ( AVAILABLE ?auto_722459 ) ( SURFACE-AT ?auto_722457 ?auto_722462 ) ( ON ?auto_722457 ?auto_722460 ) ( CLEAR ?auto_722457 ) ( not ( = ?auto_722456 ?auto_722460 ) ) ( not ( = ?auto_722457 ?auto_722460 ) ) ( not ( = ?auto_722455 ?auto_722460 ) ) ( TRUCK-AT ?auto_722461 ?auto_722463 ) ( SURFACE-AT ?auto_722455 ?auto_722463 ) ( CLEAR ?auto_722455 ) ( LIFTING ?auto_722458 ?auto_722456 ) ( IS-CRATE ?auto_722456 ) ( ON ?auto_722448 ?auto_722447 ) ( ON ?auto_722449 ?auto_722448 ) ( ON ?auto_722446 ?auto_722449 ) ( ON ?auto_722450 ?auto_722446 ) ( ON ?auto_722452 ?auto_722450 ) ( ON ?auto_722451 ?auto_722452 ) ( ON ?auto_722453 ?auto_722451 ) ( ON ?auto_722454 ?auto_722453 ) ( ON ?auto_722455 ?auto_722454 ) ( not ( = ?auto_722447 ?auto_722448 ) ) ( not ( = ?auto_722447 ?auto_722449 ) ) ( not ( = ?auto_722447 ?auto_722446 ) ) ( not ( = ?auto_722447 ?auto_722450 ) ) ( not ( = ?auto_722447 ?auto_722452 ) ) ( not ( = ?auto_722447 ?auto_722451 ) ) ( not ( = ?auto_722447 ?auto_722453 ) ) ( not ( = ?auto_722447 ?auto_722454 ) ) ( not ( = ?auto_722447 ?auto_722455 ) ) ( not ( = ?auto_722447 ?auto_722456 ) ) ( not ( = ?auto_722447 ?auto_722457 ) ) ( not ( = ?auto_722447 ?auto_722460 ) ) ( not ( = ?auto_722448 ?auto_722449 ) ) ( not ( = ?auto_722448 ?auto_722446 ) ) ( not ( = ?auto_722448 ?auto_722450 ) ) ( not ( = ?auto_722448 ?auto_722452 ) ) ( not ( = ?auto_722448 ?auto_722451 ) ) ( not ( = ?auto_722448 ?auto_722453 ) ) ( not ( = ?auto_722448 ?auto_722454 ) ) ( not ( = ?auto_722448 ?auto_722455 ) ) ( not ( = ?auto_722448 ?auto_722456 ) ) ( not ( = ?auto_722448 ?auto_722457 ) ) ( not ( = ?auto_722448 ?auto_722460 ) ) ( not ( = ?auto_722449 ?auto_722446 ) ) ( not ( = ?auto_722449 ?auto_722450 ) ) ( not ( = ?auto_722449 ?auto_722452 ) ) ( not ( = ?auto_722449 ?auto_722451 ) ) ( not ( = ?auto_722449 ?auto_722453 ) ) ( not ( = ?auto_722449 ?auto_722454 ) ) ( not ( = ?auto_722449 ?auto_722455 ) ) ( not ( = ?auto_722449 ?auto_722456 ) ) ( not ( = ?auto_722449 ?auto_722457 ) ) ( not ( = ?auto_722449 ?auto_722460 ) ) ( not ( = ?auto_722446 ?auto_722450 ) ) ( not ( = ?auto_722446 ?auto_722452 ) ) ( not ( = ?auto_722446 ?auto_722451 ) ) ( not ( = ?auto_722446 ?auto_722453 ) ) ( not ( = ?auto_722446 ?auto_722454 ) ) ( not ( = ?auto_722446 ?auto_722455 ) ) ( not ( = ?auto_722446 ?auto_722456 ) ) ( not ( = ?auto_722446 ?auto_722457 ) ) ( not ( = ?auto_722446 ?auto_722460 ) ) ( not ( = ?auto_722450 ?auto_722452 ) ) ( not ( = ?auto_722450 ?auto_722451 ) ) ( not ( = ?auto_722450 ?auto_722453 ) ) ( not ( = ?auto_722450 ?auto_722454 ) ) ( not ( = ?auto_722450 ?auto_722455 ) ) ( not ( = ?auto_722450 ?auto_722456 ) ) ( not ( = ?auto_722450 ?auto_722457 ) ) ( not ( = ?auto_722450 ?auto_722460 ) ) ( not ( = ?auto_722452 ?auto_722451 ) ) ( not ( = ?auto_722452 ?auto_722453 ) ) ( not ( = ?auto_722452 ?auto_722454 ) ) ( not ( = ?auto_722452 ?auto_722455 ) ) ( not ( = ?auto_722452 ?auto_722456 ) ) ( not ( = ?auto_722452 ?auto_722457 ) ) ( not ( = ?auto_722452 ?auto_722460 ) ) ( not ( = ?auto_722451 ?auto_722453 ) ) ( not ( = ?auto_722451 ?auto_722454 ) ) ( not ( = ?auto_722451 ?auto_722455 ) ) ( not ( = ?auto_722451 ?auto_722456 ) ) ( not ( = ?auto_722451 ?auto_722457 ) ) ( not ( = ?auto_722451 ?auto_722460 ) ) ( not ( = ?auto_722453 ?auto_722454 ) ) ( not ( = ?auto_722453 ?auto_722455 ) ) ( not ( = ?auto_722453 ?auto_722456 ) ) ( not ( = ?auto_722453 ?auto_722457 ) ) ( not ( = ?auto_722453 ?auto_722460 ) ) ( not ( = ?auto_722454 ?auto_722455 ) ) ( not ( = ?auto_722454 ?auto_722456 ) ) ( not ( = ?auto_722454 ?auto_722457 ) ) ( not ( = ?auto_722454 ?auto_722460 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_722455 ?auto_722456 ?auto_722457 )
      ( MAKE-11CRATE-VERIFY ?auto_722447 ?auto_722448 ?auto_722449 ?auto_722446 ?auto_722450 ?auto_722452 ?auto_722451 ?auto_722453 ?auto_722454 ?auto_722455 ?auto_722456 ?auto_722457 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_722591 - SURFACE
      ?auto_722592 - SURFACE
      ?auto_722593 - SURFACE
      ?auto_722590 - SURFACE
      ?auto_722594 - SURFACE
      ?auto_722596 - SURFACE
      ?auto_722595 - SURFACE
      ?auto_722597 - SURFACE
      ?auto_722598 - SURFACE
      ?auto_722599 - SURFACE
      ?auto_722600 - SURFACE
      ?auto_722601 - SURFACE
    )
    :vars
    (
      ?auto_722602 - HOIST
      ?auto_722606 - PLACE
      ?auto_722604 - PLACE
      ?auto_722603 - HOIST
      ?auto_722605 - SURFACE
      ?auto_722607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_722602 ?auto_722606 ) ( IS-CRATE ?auto_722601 ) ( not ( = ?auto_722600 ?auto_722601 ) ) ( not ( = ?auto_722599 ?auto_722600 ) ) ( not ( = ?auto_722599 ?auto_722601 ) ) ( not ( = ?auto_722604 ?auto_722606 ) ) ( HOIST-AT ?auto_722603 ?auto_722604 ) ( not ( = ?auto_722602 ?auto_722603 ) ) ( AVAILABLE ?auto_722603 ) ( SURFACE-AT ?auto_722601 ?auto_722604 ) ( ON ?auto_722601 ?auto_722605 ) ( CLEAR ?auto_722601 ) ( not ( = ?auto_722600 ?auto_722605 ) ) ( not ( = ?auto_722601 ?auto_722605 ) ) ( not ( = ?auto_722599 ?auto_722605 ) ) ( TRUCK-AT ?auto_722607 ?auto_722606 ) ( SURFACE-AT ?auto_722599 ?auto_722606 ) ( CLEAR ?auto_722599 ) ( IS-CRATE ?auto_722600 ) ( AVAILABLE ?auto_722602 ) ( IN ?auto_722600 ?auto_722607 ) ( ON ?auto_722592 ?auto_722591 ) ( ON ?auto_722593 ?auto_722592 ) ( ON ?auto_722590 ?auto_722593 ) ( ON ?auto_722594 ?auto_722590 ) ( ON ?auto_722596 ?auto_722594 ) ( ON ?auto_722595 ?auto_722596 ) ( ON ?auto_722597 ?auto_722595 ) ( ON ?auto_722598 ?auto_722597 ) ( ON ?auto_722599 ?auto_722598 ) ( not ( = ?auto_722591 ?auto_722592 ) ) ( not ( = ?auto_722591 ?auto_722593 ) ) ( not ( = ?auto_722591 ?auto_722590 ) ) ( not ( = ?auto_722591 ?auto_722594 ) ) ( not ( = ?auto_722591 ?auto_722596 ) ) ( not ( = ?auto_722591 ?auto_722595 ) ) ( not ( = ?auto_722591 ?auto_722597 ) ) ( not ( = ?auto_722591 ?auto_722598 ) ) ( not ( = ?auto_722591 ?auto_722599 ) ) ( not ( = ?auto_722591 ?auto_722600 ) ) ( not ( = ?auto_722591 ?auto_722601 ) ) ( not ( = ?auto_722591 ?auto_722605 ) ) ( not ( = ?auto_722592 ?auto_722593 ) ) ( not ( = ?auto_722592 ?auto_722590 ) ) ( not ( = ?auto_722592 ?auto_722594 ) ) ( not ( = ?auto_722592 ?auto_722596 ) ) ( not ( = ?auto_722592 ?auto_722595 ) ) ( not ( = ?auto_722592 ?auto_722597 ) ) ( not ( = ?auto_722592 ?auto_722598 ) ) ( not ( = ?auto_722592 ?auto_722599 ) ) ( not ( = ?auto_722592 ?auto_722600 ) ) ( not ( = ?auto_722592 ?auto_722601 ) ) ( not ( = ?auto_722592 ?auto_722605 ) ) ( not ( = ?auto_722593 ?auto_722590 ) ) ( not ( = ?auto_722593 ?auto_722594 ) ) ( not ( = ?auto_722593 ?auto_722596 ) ) ( not ( = ?auto_722593 ?auto_722595 ) ) ( not ( = ?auto_722593 ?auto_722597 ) ) ( not ( = ?auto_722593 ?auto_722598 ) ) ( not ( = ?auto_722593 ?auto_722599 ) ) ( not ( = ?auto_722593 ?auto_722600 ) ) ( not ( = ?auto_722593 ?auto_722601 ) ) ( not ( = ?auto_722593 ?auto_722605 ) ) ( not ( = ?auto_722590 ?auto_722594 ) ) ( not ( = ?auto_722590 ?auto_722596 ) ) ( not ( = ?auto_722590 ?auto_722595 ) ) ( not ( = ?auto_722590 ?auto_722597 ) ) ( not ( = ?auto_722590 ?auto_722598 ) ) ( not ( = ?auto_722590 ?auto_722599 ) ) ( not ( = ?auto_722590 ?auto_722600 ) ) ( not ( = ?auto_722590 ?auto_722601 ) ) ( not ( = ?auto_722590 ?auto_722605 ) ) ( not ( = ?auto_722594 ?auto_722596 ) ) ( not ( = ?auto_722594 ?auto_722595 ) ) ( not ( = ?auto_722594 ?auto_722597 ) ) ( not ( = ?auto_722594 ?auto_722598 ) ) ( not ( = ?auto_722594 ?auto_722599 ) ) ( not ( = ?auto_722594 ?auto_722600 ) ) ( not ( = ?auto_722594 ?auto_722601 ) ) ( not ( = ?auto_722594 ?auto_722605 ) ) ( not ( = ?auto_722596 ?auto_722595 ) ) ( not ( = ?auto_722596 ?auto_722597 ) ) ( not ( = ?auto_722596 ?auto_722598 ) ) ( not ( = ?auto_722596 ?auto_722599 ) ) ( not ( = ?auto_722596 ?auto_722600 ) ) ( not ( = ?auto_722596 ?auto_722601 ) ) ( not ( = ?auto_722596 ?auto_722605 ) ) ( not ( = ?auto_722595 ?auto_722597 ) ) ( not ( = ?auto_722595 ?auto_722598 ) ) ( not ( = ?auto_722595 ?auto_722599 ) ) ( not ( = ?auto_722595 ?auto_722600 ) ) ( not ( = ?auto_722595 ?auto_722601 ) ) ( not ( = ?auto_722595 ?auto_722605 ) ) ( not ( = ?auto_722597 ?auto_722598 ) ) ( not ( = ?auto_722597 ?auto_722599 ) ) ( not ( = ?auto_722597 ?auto_722600 ) ) ( not ( = ?auto_722597 ?auto_722601 ) ) ( not ( = ?auto_722597 ?auto_722605 ) ) ( not ( = ?auto_722598 ?auto_722599 ) ) ( not ( = ?auto_722598 ?auto_722600 ) ) ( not ( = ?auto_722598 ?auto_722601 ) ) ( not ( = ?auto_722598 ?auto_722605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_722599 ?auto_722600 ?auto_722601 )
      ( MAKE-11CRATE-VERIFY ?auto_722591 ?auto_722592 ?auto_722593 ?auto_722590 ?auto_722594 ?auto_722596 ?auto_722595 ?auto_722597 ?auto_722598 ?auto_722599 ?auto_722600 ?auto_722601 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_731882 - SURFACE
      ?auto_731883 - SURFACE
      ?auto_731884 - SURFACE
      ?auto_731881 - SURFACE
      ?auto_731885 - SURFACE
      ?auto_731887 - SURFACE
      ?auto_731886 - SURFACE
      ?auto_731888 - SURFACE
      ?auto_731889 - SURFACE
      ?auto_731890 - SURFACE
      ?auto_731891 - SURFACE
      ?auto_731892 - SURFACE
      ?auto_731893 - SURFACE
    )
    :vars
    (
      ?auto_731894 - HOIST
      ?auto_731895 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_731894 ?auto_731895 ) ( SURFACE-AT ?auto_731892 ?auto_731895 ) ( CLEAR ?auto_731892 ) ( LIFTING ?auto_731894 ?auto_731893 ) ( IS-CRATE ?auto_731893 ) ( not ( = ?auto_731892 ?auto_731893 ) ) ( ON ?auto_731883 ?auto_731882 ) ( ON ?auto_731884 ?auto_731883 ) ( ON ?auto_731881 ?auto_731884 ) ( ON ?auto_731885 ?auto_731881 ) ( ON ?auto_731887 ?auto_731885 ) ( ON ?auto_731886 ?auto_731887 ) ( ON ?auto_731888 ?auto_731886 ) ( ON ?auto_731889 ?auto_731888 ) ( ON ?auto_731890 ?auto_731889 ) ( ON ?auto_731891 ?auto_731890 ) ( ON ?auto_731892 ?auto_731891 ) ( not ( = ?auto_731882 ?auto_731883 ) ) ( not ( = ?auto_731882 ?auto_731884 ) ) ( not ( = ?auto_731882 ?auto_731881 ) ) ( not ( = ?auto_731882 ?auto_731885 ) ) ( not ( = ?auto_731882 ?auto_731887 ) ) ( not ( = ?auto_731882 ?auto_731886 ) ) ( not ( = ?auto_731882 ?auto_731888 ) ) ( not ( = ?auto_731882 ?auto_731889 ) ) ( not ( = ?auto_731882 ?auto_731890 ) ) ( not ( = ?auto_731882 ?auto_731891 ) ) ( not ( = ?auto_731882 ?auto_731892 ) ) ( not ( = ?auto_731882 ?auto_731893 ) ) ( not ( = ?auto_731883 ?auto_731884 ) ) ( not ( = ?auto_731883 ?auto_731881 ) ) ( not ( = ?auto_731883 ?auto_731885 ) ) ( not ( = ?auto_731883 ?auto_731887 ) ) ( not ( = ?auto_731883 ?auto_731886 ) ) ( not ( = ?auto_731883 ?auto_731888 ) ) ( not ( = ?auto_731883 ?auto_731889 ) ) ( not ( = ?auto_731883 ?auto_731890 ) ) ( not ( = ?auto_731883 ?auto_731891 ) ) ( not ( = ?auto_731883 ?auto_731892 ) ) ( not ( = ?auto_731883 ?auto_731893 ) ) ( not ( = ?auto_731884 ?auto_731881 ) ) ( not ( = ?auto_731884 ?auto_731885 ) ) ( not ( = ?auto_731884 ?auto_731887 ) ) ( not ( = ?auto_731884 ?auto_731886 ) ) ( not ( = ?auto_731884 ?auto_731888 ) ) ( not ( = ?auto_731884 ?auto_731889 ) ) ( not ( = ?auto_731884 ?auto_731890 ) ) ( not ( = ?auto_731884 ?auto_731891 ) ) ( not ( = ?auto_731884 ?auto_731892 ) ) ( not ( = ?auto_731884 ?auto_731893 ) ) ( not ( = ?auto_731881 ?auto_731885 ) ) ( not ( = ?auto_731881 ?auto_731887 ) ) ( not ( = ?auto_731881 ?auto_731886 ) ) ( not ( = ?auto_731881 ?auto_731888 ) ) ( not ( = ?auto_731881 ?auto_731889 ) ) ( not ( = ?auto_731881 ?auto_731890 ) ) ( not ( = ?auto_731881 ?auto_731891 ) ) ( not ( = ?auto_731881 ?auto_731892 ) ) ( not ( = ?auto_731881 ?auto_731893 ) ) ( not ( = ?auto_731885 ?auto_731887 ) ) ( not ( = ?auto_731885 ?auto_731886 ) ) ( not ( = ?auto_731885 ?auto_731888 ) ) ( not ( = ?auto_731885 ?auto_731889 ) ) ( not ( = ?auto_731885 ?auto_731890 ) ) ( not ( = ?auto_731885 ?auto_731891 ) ) ( not ( = ?auto_731885 ?auto_731892 ) ) ( not ( = ?auto_731885 ?auto_731893 ) ) ( not ( = ?auto_731887 ?auto_731886 ) ) ( not ( = ?auto_731887 ?auto_731888 ) ) ( not ( = ?auto_731887 ?auto_731889 ) ) ( not ( = ?auto_731887 ?auto_731890 ) ) ( not ( = ?auto_731887 ?auto_731891 ) ) ( not ( = ?auto_731887 ?auto_731892 ) ) ( not ( = ?auto_731887 ?auto_731893 ) ) ( not ( = ?auto_731886 ?auto_731888 ) ) ( not ( = ?auto_731886 ?auto_731889 ) ) ( not ( = ?auto_731886 ?auto_731890 ) ) ( not ( = ?auto_731886 ?auto_731891 ) ) ( not ( = ?auto_731886 ?auto_731892 ) ) ( not ( = ?auto_731886 ?auto_731893 ) ) ( not ( = ?auto_731888 ?auto_731889 ) ) ( not ( = ?auto_731888 ?auto_731890 ) ) ( not ( = ?auto_731888 ?auto_731891 ) ) ( not ( = ?auto_731888 ?auto_731892 ) ) ( not ( = ?auto_731888 ?auto_731893 ) ) ( not ( = ?auto_731889 ?auto_731890 ) ) ( not ( = ?auto_731889 ?auto_731891 ) ) ( not ( = ?auto_731889 ?auto_731892 ) ) ( not ( = ?auto_731889 ?auto_731893 ) ) ( not ( = ?auto_731890 ?auto_731891 ) ) ( not ( = ?auto_731890 ?auto_731892 ) ) ( not ( = ?auto_731890 ?auto_731893 ) ) ( not ( = ?auto_731891 ?auto_731892 ) ) ( not ( = ?auto_731891 ?auto_731893 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_731892 ?auto_731893 )
      ( MAKE-12CRATE-VERIFY ?auto_731882 ?auto_731883 ?auto_731884 ?auto_731881 ?auto_731885 ?auto_731887 ?auto_731886 ?auto_731888 ?auto_731889 ?auto_731890 ?auto_731891 ?auto_731892 ?auto_731893 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732007 - SURFACE
      ?auto_732008 - SURFACE
      ?auto_732009 - SURFACE
      ?auto_732006 - SURFACE
      ?auto_732010 - SURFACE
      ?auto_732012 - SURFACE
      ?auto_732011 - SURFACE
      ?auto_732013 - SURFACE
      ?auto_732014 - SURFACE
      ?auto_732015 - SURFACE
      ?auto_732016 - SURFACE
      ?auto_732017 - SURFACE
      ?auto_732018 - SURFACE
    )
    :vars
    (
      ?auto_732021 - HOIST
      ?auto_732019 - PLACE
      ?auto_732020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_732021 ?auto_732019 ) ( SURFACE-AT ?auto_732017 ?auto_732019 ) ( CLEAR ?auto_732017 ) ( IS-CRATE ?auto_732018 ) ( not ( = ?auto_732017 ?auto_732018 ) ) ( TRUCK-AT ?auto_732020 ?auto_732019 ) ( AVAILABLE ?auto_732021 ) ( IN ?auto_732018 ?auto_732020 ) ( ON ?auto_732017 ?auto_732016 ) ( not ( = ?auto_732016 ?auto_732017 ) ) ( not ( = ?auto_732016 ?auto_732018 ) ) ( ON ?auto_732008 ?auto_732007 ) ( ON ?auto_732009 ?auto_732008 ) ( ON ?auto_732006 ?auto_732009 ) ( ON ?auto_732010 ?auto_732006 ) ( ON ?auto_732012 ?auto_732010 ) ( ON ?auto_732011 ?auto_732012 ) ( ON ?auto_732013 ?auto_732011 ) ( ON ?auto_732014 ?auto_732013 ) ( ON ?auto_732015 ?auto_732014 ) ( ON ?auto_732016 ?auto_732015 ) ( not ( = ?auto_732007 ?auto_732008 ) ) ( not ( = ?auto_732007 ?auto_732009 ) ) ( not ( = ?auto_732007 ?auto_732006 ) ) ( not ( = ?auto_732007 ?auto_732010 ) ) ( not ( = ?auto_732007 ?auto_732012 ) ) ( not ( = ?auto_732007 ?auto_732011 ) ) ( not ( = ?auto_732007 ?auto_732013 ) ) ( not ( = ?auto_732007 ?auto_732014 ) ) ( not ( = ?auto_732007 ?auto_732015 ) ) ( not ( = ?auto_732007 ?auto_732016 ) ) ( not ( = ?auto_732007 ?auto_732017 ) ) ( not ( = ?auto_732007 ?auto_732018 ) ) ( not ( = ?auto_732008 ?auto_732009 ) ) ( not ( = ?auto_732008 ?auto_732006 ) ) ( not ( = ?auto_732008 ?auto_732010 ) ) ( not ( = ?auto_732008 ?auto_732012 ) ) ( not ( = ?auto_732008 ?auto_732011 ) ) ( not ( = ?auto_732008 ?auto_732013 ) ) ( not ( = ?auto_732008 ?auto_732014 ) ) ( not ( = ?auto_732008 ?auto_732015 ) ) ( not ( = ?auto_732008 ?auto_732016 ) ) ( not ( = ?auto_732008 ?auto_732017 ) ) ( not ( = ?auto_732008 ?auto_732018 ) ) ( not ( = ?auto_732009 ?auto_732006 ) ) ( not ( = ?auto_732009 ?auto_732010 ) ) ( not ( = ?auto_732009 ?auto_732012 ) ) ( not ( = ?auto_732009 ?auto_732011 ) ) ( not ( = ?auto_732009 ?auto_732013 ) ) ( not ( = ?auto_732009 ?auto_732014 ) ) ( not ( = ?auto_732009 ?auto_732015 ) ) ( not ( = ?auto_732009 ?auto_732016 ) ) ( not ( = ?auto_732009 ?auto_732017 ) ) ( not ( = ?auto_732009 ?auto_732018 ) ) ( not ( = ?auto_732006 ?auto_732010 ) ) ( not ( = ?auto_732006 ?auto_732012 ) ) ( not ( = ?auto_732006 ?auto_732011 ) ) ( not ( = ?auto_732006 ?auto_732013 ) ) ( not ( = ?auto_732006 ?auto_732014 ) ) ( not ( = ?auto_732006 ?auto_732015 ) ) ( not ( = ?auto_732006 ?auto_732016 ) ) ( not ( = ?auto_732006 ?auto_732017 ) ) ( not ( = ?auto_732006 ?auto_732018 ) ) ( not ( = ?auto_732010 ?auto_732012 ) ) ( not ( = ?auto_732010 ?auto_732011 ) ) ( not ( = ?auto_732010 ?auto_732013 ) ) ( not ( = ?auto_732010 ?auto_732014 ) ) ( not ( = ?auto_732010 ?auto_732015 ) ) ( not ( = ?auto_732010 ?auto_732016 ) ) ( not ( = ?auto_732010 ?auto_732017 ) ) ( not ( = ?auto_732010 ?auto_732018 ) ) ( not ( = ?auto_732012 ?auto_732011 ) ) ( not ( = ?auto_732012 ?auto_732013 ) ) ( not ( = ?auto_732012 ?auto_732014 ) ) ( not ( = ?auto_732012 ?auto_732015 ) ) ( not ( = ?auto_732012 ?auto_732016 ) ) ( not ( = ?auto_732012 ?auto_732017 ) ) ( not ( = ?auto_732012 ?auto_732018 ) ) ( not ( = ?auto_732011 ?auto_732013 ) ) ( not ( = ?auto_732011 ?auto_732014 ) ) ( not ( = ?auto_732011 ?auto_732015 ) ) ( not ( = ?auto_732011 ?auto_732016 ) ) ( not ( = ?auto_732011 ?auto_732017 ) ) ( not ( = ?auto_732011 ?auto_732018 ) ) ( not ( = ?auto_732013 ?auto_732014 ) ) ( not ( = ?auto_732013 ?auto_732015 ) ) ( not ( = ?auto_732013 ?auto_732016 ) ) ( not ( = ?auto_732013 ?auto_732017 ) ) ( not ( = ?auto_732013 ?auto_732018 ) ) ( not ( = ?auto_732014 ?auto_732015 ) ) ( not ( = ?auto_732014 ?auto_732016 ) ) ( not ( = ?auto_732014 ?auto_732017 ) ) ( not ( = ?auto_732014 ?auto_732018 ) ) ( not ( = ?auto_732015 ?auto_732016 ) ) ( not ( = ?auto_732015 ?auto_732017 ) ) ( not ( = ?auto_732015 ?auto_732018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732016 ?auto_732017 ?auto_732018 )
      ( MAKE-12CRATE-VERIFY ?auto_732007 ?auto_732008 ?auto_732009 ?auto_732006 ?auto_732010 ?auto_732012 ?auto_732011 ?auto_732013 ?auto_732014 ?auto_732015 ?auto_732016 ?auto_732017 ?auto_732018 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732145 - SURFACE
      ?auto_732146 - SURFACE
      ?auto_732147 - SURFACE
      ?auto_732144 - SURFACE
      ?auto_732148 - SURFACE
      ?auto_732150 - SURFACE
      ?auto_732149 - SURFACE
      ?auto_732151 - SURFACE
      ?auto_732152 - SURFACE
      ?auto_732153 - SURFACE
      ?auto_732154 - SURFACE
      ?auto_732155 - SURFACE
      ?auto_732156 - SURFACE
    )
    :vars
    (
      ?auto_732159 - HOIST
      ?auto_732157 - PLACE
      ?auto_732158 - TRUCK
      ?auto_732160 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_732159 ?auto_732157 ) ( SURFACE-AT ?auto_732155 ?auto_732157 ) ( CLEAR ?auto_732155 ) ( IS-CRATE ?auto_732156 ) ( not ( = ?auto_732155 ?auto_732156 ) ) ( AVAILABLE ?auto_732159 ) ( IN ?auto_732156 ?auto_732158 ) ( ON ?auto_732155 ?auto_732154 ) ( not ( = ?auto_732154 ?auto_732155 ) ) ( not ( = ?auto_732154 ?auto_732156 ) ) ( TRUCK-AT ?auto_732158 ?auto_732160 ) ( not ( = ?auto_732160 ?auto_732157 ) ) ( ON ?auto_732146 ?auto_732145 ) ( ON ?auto_732147 ?auto_732146 ) ( ON ?auto_732144 ?auto_732147 ) ( ON ?auto_732148 ?auto_732144 ) ( ON ?auto_732150 ?auto_732148 ) ( ON ?auto_732149 ?auto_732150 ) ( ON ?auto_732151 ?auto_732149 ) ( ON ?auto_732152 ?auto_732151 ) ( ON ?auto_732153 ?auto_732152 ) ( ON ?auto_732154 ?auto_732153 ) ( not ( = ?auto_732145 ?auto_732146 ) ) ( not ( = ?auto_732145 ?auto_732147 ) ) ( not ( = ?auto_732145 ?auto_732144 ) ) ( not ( = ?auto_732145 ?auto_732148 ) ) ( not ( = ?auto_732145 ?auto_732150 ) ) ( not ( = ?auto_732145 ?auto_732149 ) ) ( not ( = ?auto_732145 ?auto_732151 ) ) ( not ( = ?auto_732145 ?auto_732152 ) ) ( not ( = ?auto_732145 ?auto_732153 ) ) ( not ( = ?auto_732145 ?auto_732154 ) ) ( not ( = ?auto_732145 ?auto_732155 ) ) ( not ( = ?auto_732145 ?auto_732156 ) ) ( not ( = ?auto_732146 ?auto_732147 ) ) ( not ( = ?auto_732146 ?auto_732144 ) ) ( not ( = ?auto_732146 ?auto_732148 ) ) ( not ( = ?auto_732146 ?auto_732150 ) ) ( not ( = ?auto_732146 ?auto_732149 ) ) ( not ( = ?auto_732146 ?auto_732151 ) ) ( not ( = ?auto_732146 ?auto_732152 ) ) ( not ( = ?auto_732146 ?auto_732153 ) ) ( not ( = ?auto_732146 ?auto_732154 ) ) ( not ( = ?auto_732146 ?auto_732155 ) ) ( not ( = ?auto_732146 ?auto_732156 ) ) ( not ( = ?auto_732147 ?auto_732144 ) ) ( not ( = ?auto_732147 ?auto_732148 ) ) ( not ( = ?auto_732147 ?auto_732150 ) ) ( not ( = ?auto_732147 ?auto_732149 ) ) ( not ( = ?auto_732147 ?auto_732151 ) ) ( not ( = ?auto_732147 ?auto_732152 ) ) ( not ( = ?auto_732147 ?auto_732153 ) ) ( not ( = ?auto_732147 ?auto_732154 ) ) ( not ( = ?auto_732147 ?auto_732155 ) ) ( not ( = ?auto_732147 ?auto_732156 ) ) ( not ( = ?auto_732144 ?auto_732148 ) ) ( not ( = ?auto_732144 ?auto_732150 ) ) ( not ( = ?auto_732144 ?auto_732149 ) ) ( not ( = ?auto_732144 ?auto_732151 ) ) ( not ( = ?auto_732144 ?auto_732152 ) ) ( not ( = ?auto_732144 ?auto_732153 ) ) ( not ( = ?auto_732144 ?auto_732154 ) ) ( not ( = ?auto_732144 ?auto_732155 ) ) ( not ( = ?auto_732144 ?auto_732156 ) ) ( not ( = ?auto_732148 ?auto_732150 ) ) ( not ( = ?auto_732148 ?auto_732149 ) ) ( not ( = ?auto_732148 ?auto_732151 ) ) ( not ( = ?auto_732148 ?auto_732152 ) ) ( not ( = ?auto_732148 ?auto_732153 ) ) ( not ( = ?auto_732148 ?auto_732154 ) ) ( not ( = ?auto_732148 ?auto_732155 ) ) ( not ( = ?auto_732148 ?auto_732156 ) ) ( not ( = ?auto_732150 ?auto_732149 ) ) ( not ( = ?auto_732150 ?auto_732151 ) ) ( not ( = ?auto_732150 ?auto_732152 ) ) ( not ( = ?auto_732150 ?auto_732153 ) ) ( not ( = ?auto_732150 ?auto_732154 ) ) ( not ( = ?auto_732150 ?auto_732155 ) ) ( not ( = ?auto_732150 ?auto_732156 ) ) ( not ( = ?auto_732149 ?auto_732151 ) ) ( not ( = ?auto_732149 ?auto_732152 ) ) ( not ( = ?auto_732149 ?auto_732153 ) ) ( not ( = ?auto_732149 ?auto_732154 ) ) ( not ( = ?auto_732149 ?auto_732155 ) ) ( not ( = ?auto_732149 ?auto_732156 ) ) ( not ( = ?auto_732151 ?auto_732152 ) ) ( not ( = ?auto_732151 ?auto_732153 ) ) ( not ( = ?auto_732151 ?auto_732154 ) ) ( not ( = ?auto_732151 ?auto_732155 ) ) ( not ( = ?auto_732151 ?auto_732156 ) ) ( not ( = ?auto_732152 ?auto_732153 ) ) ( not ( = ?auto_732152 ?auto_732154 ) ) ( not ( = ?auto_732152 ?auto_732155 ) ) ( not ( = ?auto_732152 ?auto_732156 ) ) ( not ( = ?auto_732153 ?auto_732154 ) ) ( not ( = ?auto_732153 ?auto_732155 ) ) ( not ( = ?auto_732153 ?auto_732156 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732154 ?auto_732155 ?auto_732156 )
      ( MAKE-12CRATE-VERIFY ?auto_732145 ?auto_732146 ?auto_732147 ?auto_732144 ?auto_732148 ?auto_732150 ?auto_732149 ?auto_732151 ?auto_732152 ?auto_732153 ?auto_732154 ?auto_732155 ?auto_732156 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732295 - SURFACE
      ?auto_732296 - SURFACE
      ?auto_732297 - SURFACE
      ?auto_732294 - SURFACE
      ?auto_732298 - SURFACE
      ?auto_732300 - SURFACE
      ?auto_732299 - SURFACE
      ?auto_732301 - SURFACE
      ?auto_732302 - SURFACE
      ?auto_732303 - SURFACE
      ?auto_732304 - SURFACE
      ?auto_732305 - SURFACE
      ?auto_732306 - SURFACE
    )
    :vars
    (
      ?auto_732311 - HOIST
      ?auto_732307 - PLACE
      ?auto_732308 - TRUCK
      ?auto_732310 - PLACE
      ?auto_732309 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_732311 ?auto_732307 ) ( SURFACE-AT ?auto_732305 ?auto_732307 ) ( CLEAR ?auto_732305 ) ( IS-CRATE ?auto_732306 ) ( not ( = ?auto_732305 ?auto_732306 ) ) ( AVAILABLE ?auto_732311 ) ( ON ?auto_732305 ?auto_732304 ) ( not ( = ?auto_732304 ?auto_732305 ) ) ( not ( = ?auto_732304 ?auto_732306 ) ) ( TRUCK-AT ?auto_732308 ?auto_732310 ) ( not ( = ?auto_732310 ?auto_732307 ) ) ( HOIST-AT ?auto_732309 ?auto_732310 ) ( LIFTING ?auto_732309 ?auto_732306 ) ( not ( = ?auto_732311 ?auto_732309 ) ) ( ON ?auto_732296 ?auto_732295 ) ( ON ?auto_732297 ?auto_732296 ) ( ON ?auto_732294 ?auto_732297 ) ( ON ?auto_732298 ?auto_732294 ) ( ON ?auto_732300 ?auto_732298 ) ( ON ?auto_732299 ?auto_732300 ) ( ON ?auto_732301 ?auto_732299 ) ( ON ?auto_732302 ?auto_732301 ) ( ON ?auto_732303 ?auto_732302 ) ( ON ?auto_732304 ?auto_732303 ) ( not ( = ?auto_732295 ?auto_732296 ) ) ( not ( = ?auto_732295 ?auto_732297 ) ) ( not ( = ?auto_732295 ?auto_732294 ) ) ( not ( = ?auto_732295 ?auto_732298 ) ) ( not ( = ?auto_732295 ?auto_732300 ) ) ( not ( = ?auto_732295 ?auto_732299 ) ) ( not ( = ?auto_732295 ?auto_732301 ) ) ( not ( = ?auto_732295 ?auto_732302 ) ) ( not ( = ?auto_732295 ?auto_732303 ) ) ( not ( = ?auto_732295 ?auto_732304 ) ) ( not ( = ?auto_732295 ?auto_732305 ) ) ( not ( = ?auto_732295 ?auto_732306 ) ) ( not ( = ?auto_732296 ?auto_732297 ) ) ( not ( = ?auto_732296 ?auto_732294 ) ) ( not ( = ?auto_732296 ?auto_732298 ) ) ( not ( = ?auto_732296 ?auto_732300 ) ) ( not ( = ?auto_732296 ?auto_732299 ) ) ( not ( = ?auto_732296 ?auto_732301 ) ) ( not ( = ?auto_732296 ?auto_732302 ) ) ( not ( = ?auto_732296 ?auto_732303 ) ) ( not ( = ?auto_732296 ?auto_732304 ) ) ( not ( = ?auto_732296 ?auto_732305 ) ) ( not ( = ?auto_732296 ?auto_732306 ) ) ( not ( = ?auto_732297 ?auto_732294 ) ) ( not ( = ?auto_732297 ?auto_732298 ) ) ( not ( = ?auto_732297 ?auto_732300 ) ) ( not ( = ?auto_732297 ?auto_732299 ) ) ( not ( = ?auto_732297 ?auto_732301 ) ) ( not ( = ?auto_732297 ?auto_732302 ) ) ( not ( = ?auto_732297 ?auto_732303 ) ) ( not ( = ?auto_732297 ?auto_732304 ) ) ( not ( = ?auto_732297 ?auto_732305 ) ) ( not ( = ?auto_732297 ?auto_732306 ) ) ( not ( = ?auto_732294 ?auto_732298 ) ) ( not ( = ?auto_732294 ?auto_732300 ) ) ( not ( = ?auto_732294 ?auto_732299 ) ) ( not ( = ?auto_732294 ?auto_732301 ) ) ( not ( = ?auto_732294 ?auto_732302 ) ) ( not ( = ?auto_732294 ?auto_732303 ) ) ( not ( = ?auto_732294 ?auto_732304 ) ) ( not ( = ?auto_732294 ?auto_732305 ) ) ( not ( = ?auto_732294 ?auto_732306 ) ) ( not ( = ?auto_732298 ?auto_732300 ) ) ( not ( = ?auto_732298 ?auto_732299 ) ) ( not ( = ?auto_732298 ?auto_732301 ) ) ( not ( = ?auto_732298 ?auto_732302 ) ) ( not ( = ?auto_732298 ?auto_732303 ) ) ( not ( = ?auto_732298 ?auto_732304 ) ) ( not ( = ?auto_732298 ?auto_732305 ) ) ( not ( = ?auto_732298 ?auto_732306 ) ) ( not ( = ?auto_732300 ?auto_732299 ) ) ( not ( = ?auto_732300 ?auto_732301 ) ) ( not ( = ?auto_732300 ?auto_732302 ) ) ( not ( = ?auto_732300 ?auto_732303 ) ) ( not ( = ?auto_732300 ?auto_732304 ) ) ( not ( = ?auto_732300 ?auto_732305 ) ) ( not ( = ?auto_732300 ?auto_732306 ) ) ( not ( = ?auto_732299 ?auto_732301 ) ) ( not ( = ?auto_732299 ?auto_732302 ) ) ( not ( = ?auto_732299 ?auto_732303 ) ) ( not ( = ?auto_732299 ?auto_732304 ) ) ( not ( = ?auto_732299 ?auto_732305 ) ) ( not ( = ?auto_732299 ?auto_732306 ) ) ( not ( = ?auto_732301 ?auto_732302 ) ) ( not ( = ?auto_732301 ?auto_732303 ) ) ( not ( = ?auto_732301 ?auto_732304 ) ) ( not ( = ?auto_732301 ?auto_732305 ) ) ( not ( = ?auto_732301 ?auto_732306 ) ) ( not ( = ?auto_732302 ?auto_732303 ) ) ( not ( = ?auto_732302 ?auto_732304 ) ) ( not ( = ?auto_732302 ?auto_732305 ) ) ( not ( = ?auto_732302 ?auto_732306 ) ) ( not ( = ?auto_732303 ?auto_732304 ) ) ( not ( = ?auto_732303 ?auto_732305 ) ) ( not ( = ?auto_732303 ?auto_732306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732304 ?auto_732305 ?auto_732306 )
      ( MAKE-12CRATE-VERIFY ?auto_732295 ?auto_732296 ?auto_732297 ?auto_732294 ?auto_732298 ?auto_732300 ?auto_732299 ?auto_732301 ?auto_732302 ?auto_732303 ?auto_732304 ?auto_732305 ?auto_732306 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732457 - SURFACE
      ?auto_732458 - SURFACE
      ?auto_732459 - SURFACE
      ?auto_732456 - SURFACE
      ?auto_732460 - SURFACE
      ?auto_732462 - SURFACE
      ?auto_732461 - SURFACE
      ?auto_732463 - SURFACE
      ?auto_732464 - SURFACE
      ?auto_732465 - SURFACE
      ?auto_732466 - SURFACE
      ?auto_732467 - SURFACE
      ?auto_732468 - SURFACE
    )
    :vars
    (
      ?auto_732474 - HOIST
      ?auto_732473 - PLACE
      ?auto_732471 - TRUCK
      ?auto_732470 - PLACE
      ?auto_732469 - HOIST
      ?auto_732472 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_732474 ?auto_732473 ) ( SURFACE-AT ?auto_732467 ?auto_732473 ) ( CLEAR ?auto_732467 ) ( IS-CRATE ?auto_732468 ) ( not ( = ?auto_732467 ?auto_732468 ) ) ( AVAILABLE ?auto_732474 ) ( ON ?auto_732467 ?auto_732466 ) ( not ( = ?auto_732466 ?auto_732467 ) ) ( not ( = ?auto_732466 ?auto_732468 ) ) ( TRUCK-AT ?auto_732471 ?auto_732470 ) ( not ( = ?auto_732470 ?auto_732473 ) ) ( HOIST-AT ?auto_732469 ?auto_732470 ) ( not ( = ?auto_732474 ?auto_732469 ) ) ( AVAILABLE ?auto_732469 ) ( SURFACE-AT ?auto_732468 ?auto_732470 ) ( ON ?auto_732468 ?auto_732472 ) ( CLEAR ?auto_732468 ) ( not ( = ?auto_732467 ?auto_732472 ) ) ( not ( = ?auto_732468 ?auto_732472 ) ) ( not ( = ?auto_732466 ?auto_732472 ) ) ( ON ?auto_732458 ?auto_732457 ) ( ON ?auto_732459 ?auto_732458 ) ( ON ?auto_732456 ?auto_732459 ) ( ON ?auto_732460 ?auto_732456 ) ( ON ?auto_732462 ?auto_732460 ) ( ON ?auto_732461 ?auto_732462 ) ( ON ?auto_732463 ?auto_732461 ) ( ON ?auto_732464 ?auto_732463 ) ( ON ?auto_732465 ?auto_732464 ) ( ON ?auto_732466 ?auto_732465 ) ( not ( = ?auto_732457 ?auto_732458 ) ) ( not ( = ?auto_732457 ?auto_732459 ) ) ( not ( = ?auto_732457 ?auto_732456 ) ) ( not ( = ?auto_732457 ?auto_732460 ) ) ( not ( = ?auto_732457 ?auto_732462 ) ) ( not ( = ?auto_732457 ?auto_732461 ) ) ( not ( = ?auto_732457 ?auto_732463 ) ) ( not ( = ?auto_732457 ?auto_732464 ) ) ( not ( = ?auto_732457 ?auto_732465 ) ) ( not ( = ?auto_732457 ?auto_732466 ) ) ( not ( = ?auto_732457 ?auto_732467 ) ) ( not ( = ?auto_732457 ?auto_732468 ) ) ( not ( = ?auto_732457 ?auto_732472 ) ) ( not ( = ?auto_732458 ?auto_732459 ) ) ( not ( = ?auto_732458 ?auto_732456 ) ) ( not ( = ?auto_732458 ?auto_732460 ) ) ( not ( = ?auto_732458 ?auto_732462 ) ) ( not ( = ?auto_732458 ?auto_732461 ) ) ( not ( = ?auto_732458 ?auto_732463 ) ) ( not ( = ?auto_732458 ?auto_732464 ) ) ( not ( = ?auto_732458 ?auto_732465 ) ) ( not ( = ?auto_732458 ?auto_732466 ) ) ( not ( = ?auto_732458 ?auto_732467 ) ) ( not ( = ?auto_732458 ?auto_732468 ) ) ( not ( = ?auto_732458 ?auto_732472 ) ) ( not ( = ?auto_732459 ?auto_732456 ) ) ( not ( = ?auto_732459 ?auto_732460 ) ) ( not ( = ?auto_732459 ?auto_732462 ) ) ( not ( = ?auto_732459 ?auto_732461 ) ) ( not ( = ?auto_732459 ?auto_732463 ) ) ( not ( = ?auto_732459 ?auto_732464 ) ) ( not ( = ?auto_732459 ?auto_732465 ) ) ( not ( = ?auto_732459 ?auto_732466 ) ) ( not ( = ?auto_732459 ?auto_732467 ) ) ( not ( = ?auto_732459 ?auto_732468 ) ) ( not ( = ?auto_732459 ?auto_732472 ) ) ( not ( = ?auto_732456 ?auto_732460 ) ) ( not ( = ?auto_732456 ?auto_732462 ) ) ( not ( = ?auto_732456 ?auto_732461 ) ) ( not ( = ?auto_732456 ?auto_732463 ) ) ( not ( = ?auto_732456 ?auto_732464 ) ) ( not ( = ?auto_732456 ?auto_732465 ) ) ( not ( = ?auto_732456 ?auto_732466 ) ) ( not ( = ?auto_732456 ?auto_732467 ) ) ( not ( = ?auto_732456 ?auto_732468 ) ) ( not ( = ?auto_732456 ?auto_732472 ) ) ( not ( = ?auto_732460 ?auto_732462 ) ) ( not ( = ?auto_732460 ?auto_732461 ) ) ( not ( = ?auto_732460 ?auto_732463 ) ) ( not ( = ?auto_732460 ?auto_732464 ) ) ( not ( = ?auto_732460 ?auto_732465 ) ) ( not ( = ?auto_732460 ?auto_732466 ) ) ( not ( = ?auto_732460 ?auto_732467 ) ) ( not ( = ?auto_732460 ?auto_732468 ) ) ( not ( = ?auto_732460 ?auto_732472 ) ) ( not ( = ?auto_732462 ?auto_732461 ) ) ( not ( = ?auto_732462 ?auto_732463 ) ) ( not ( = ?auto_732462 ?auto_732464 ) ) ( not ( = ?auto_732462 ?auto_732465 ) ) ( not ( = ?auto_732462 ?auto_732466 ) ) ( not ( = ?auto_732462 ?auto_732467 ) ) ( not ( = ?auto_732462 ?auto_732468 ) ) ( not ( = ?auto_732462 ?auto_732472 ) ) ( not ( = ?auto_732461 ?auto_732463 ) ) ( not ( = ?auto_732461 ?auto_732464 ) ) ( not ( = ?auto_732461 ?auto_732465 ) ) ( not ( = ?auto_732461 ?auto_732466 ) ) ( not ( = ?auto_732461 ?auto_732467 ) ) ( not ( = ?auto_732461 ?auto_732468 ) ) ( not ( = ?auto_732461 ?auto_732472 ) ) ( not ( = ?auto_732463 ?auto_732464 ) ) ( not ( = ?auto_732463 ?auto_732465 ) ) ( not ( = ?auto_732463 ?auto_732466 ) ) ( not ( = ?auto_732463 ?auto_732467 ) ) ( not ( = ?auto_732463 ?auto_732468 ) ) ( not ( = ?auto_732463 ?auto_732472 ) ) ( not ( = ?auto_732464 ?auto_732465 ) ) ( not ( = ?auto_732464 ?auto_732466 ) ) ( not ( = ?auto_732464 ?auto_732467 ) ) ( not ( = ?auto_732464 ?auto_732468 ) ) ( not ( = ?auto_732464 ?auto_732472 ) ) ( not ( = ?auto_732465 ?auto_732466 ) ) ( not ( = ?auto_732465 ?auto_732467 ) ) ( not ( = ?auto_732465 ?auto_732468 ) ) ( not ( = ?auto_732465 ?auto_732472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732466 ?auto_732467 ?auto_732468 )
      ( MAKE-12CRATE-VERIFY ?auto_732457 ?auto_732458 ?auto_732459 ?auto_732456 ?auto_732460 ?auto_732462 ?auto_732461 ?auto_732463 ?auto_732464 ?auto_732465 ?auto_732466 ?auto_732467 ?auto_732468 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732620 - SURFACE
      ?auto_732621 - SURFACE
      ?auto_732622 - SURFACE
      ?auto_732619 - SURFACE
      ?auto_732623 - SURFACE
      ?auto_732625 - SURFACE
      ?auto_732624 - SURFACE
      ?auto_732626 - SURFACE
      ?auto_732627 - SURFACE
      ?auto_732628 - SURFACE
      ?auto_732629 - SURFACE
      ?auto_732630 - SURFACE
      ?auto_732631 - SURFACE
    )
    :vars
    (
      ?auto_732633 - HOIST
      ?auto_732637 - PLACE
      ?auto_732635 - PLACE
      ?auto_732634 - HOIST
      ?auto_732636 - SURFACE
      ?auto_732632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_732633 ?auto_732637 ) ( SURFACE-AT ?auto_732630 ?auto_732637 ) ( CLEAR ?auto_732630 ) ( IS-CRATE ?auto_732631 ) ( not ( = ?auto_732630 ?auto_732631 ) ) ( AVAILABLE ?auto_732633 ) ( ON ?auto_732630 ?auto_732629 ) ( not ( = ?auto_732629 ?auto_732630 ) ) ( not ( = ?auto_732629 ?auto_732631 ) ) ( not ( = ?auto_732635 ?auto_732637 ) ) ( HOIST-AT ?auto_732634 ?auto_732635 ) ( not ( = ?auto_732633 ?auto_732634 ) ) ( AVAILABLE ?auto_732634 ) ( SURFACE-AT ?auto_732631 ?auto_732635 ) ( ON ?auto_732631 ?auto_732636 ) ( CLEAR ?auto_732631 ) ( not ( = ?auto_732630 ?auto_732636 ) ) ( not ( = ?auto_732631 ?auto_732636 ) ) ( not ( = ?auto_732629 ?auto_732636 ) ) ( TRUCK-AT ?auto_732632 ?auto_732637 ) ( ON ?auto_732621 ?auto_732620 ) ( ON ?auto_732622 ?auto_732621 ) ( ON ?auto_732619 ?auto_732622 ) ( ON ?auto_732623 ?auto_732619 ) ( ON ?auto_732625 ?auto_732623 ) ( ON ?auto_732624 ?auto_732625 ) ( ON ?auto_732626 ?auto_732624 ) ( ON ?auto_732627 ?auto_732626 ) ( ON ?auto_732628 ?auto_732627 ) ( ON ?auto_732629 ?auto_732628 ) ( not ( = ?auto_732620 ?auto_732621 ) ) ( not ( = ?auto_732620 ?auto_732622 ) ) ( not ( = ?auto_732620 ?auto_732619 ) ) ( not ( = ?auto_732620 ?auto_732623 ) ) ( not ( = ?auto_732620 ?auto_732625 ) ) ( not ( = ?auto_732620 ?auto_732624 ) ) ( not ( = ?auto_732620 ?auto_732626 ) ) ( not ( = ?auto_732620 ?auto_732627 ) ) ( not ( = ?auto_732620 ?auto_732628 ) ) ( not ( = ?auto_732620 ?auto_732629 ) ) ( not ( = ?auto_732620 ?auto_732630 ) ) ( not ( = ?auto_732620 ?auto_732631 ) ) ( not ( = ?auto_732620 ?auto_732636 ) ) ( not ( = ?auto_732621 ?auto_732622 ) ) ( not ( = ?auto_732621 ?auto_732619 ) ) ( not ( = ?auto_732621 ?auto_732623 ) ) ( not ( = ?auto_732621 ?auto_732625 ) ) ( not ( = ?auto_732621 ?auto_732624 ) ) ( not ( = ?auto_732621 ?auto_732626 ) ) ( not ( = ?auto_732621 ?auto_732627 ) ) ( not ( = ?auto_732621 ?auto_732628 ) ) ( not ( = ?auto_732621 ?auto_732629 ) ) ( not ( = ?auto_732621 ?auto_732630 ) ) ( not ( = ?auto_732621 ?auto_732631 ) ) ( not ( = ?auto_732621 ?auto_732636 ) ) ( not ( = ?auto_732622 ?auto_732619 ) ) ( not ( = ?auto_732622 ?auto_732623 ) ) ( not ( = ?auto_732622 ?auto_732625 ) ) ( not ( = ?auto_732622 ?auto_732624 ) ) ( not ( = ?auto_732622 ?auto_732626 ) ) ( not ( = ?auto_732622 ?auto_732627 ) ) ( not ( = ?auto_732622 ?auto_732628 ) ) ( not ( = ?auto_732622 ?auto_732629 ) ) ( not ( = ?auto_732622 ?auto_732630 ) ) ( not ( = ?auto_732622 ?auto_732631 ) ) ( not ( = ?auto_732622 ?auto_732636 ) ) ( not ( = ?auto_732619 ?auto_732623 ) ) ( not ( = ?auto_732619 ?auto_732625 ) ) ( not ( = ?auto_732619 ?auto_732624 ) ) ( not ( = ?auto_732619 ?auto_732626 ) ) ( not ( = ?auto_732619 ?auto_732627 ) ) ( not ( = ?auto_732619 ?auto_732628 ) ) ( not ( = ?auto_732619 ?auto_732629 ) ) ( not ( = ?auto_732619 ?auto_732630 ) ) ( not ( = ?auto_732619 ?auto_732631 ) ) ( not ( = ?auto_732619 ?auto_732636 ) ) ( not ( = ?auto_732623 ?auto_732625 ) ) ( not ( = ?auto_732623 ?auto_732624 ) ) ( not ( = ?auto_732623 ?auto_732626 ) ) ( not ( = ?auto_732623 ?auto_732627 ) ) ( not ( = ?auto_732623 ?auto_732628 ) ) ( not ( = ?auto_732623 ?auto_732629 ) ) ( not ( = ?auto_732623 ?auto_732630 ) ) ( not ( = ?auto_732623 ?auto_732631 ) ) ( not ( = ?auto_732623 ?auto_732636 ) ) ( not ( = ?auto_732625 ?auto_732624 ) ) ( not ( = ?auto_732625 ?auto_732626 ) ) ( not ( = ?auto_732625 ?auto_732627 ) ) ( not ( = ?auto_732625 ?auto_732628 ) ) ( not ( = ?auto_732625 ?auto_732629 ) ) ( not ( = ?auto_732625 ?auto_732630 ) ) ( not ( = ?auto_732625 ?auto_732631 ) ) ( not ( = ?auto_732625 ?auto_732636 ) ) ( not ( = ?auto_732624 ?auto_732626 ) ) ( not ( = ?auto_732624 ?auto_732627 ) ) ( not ( = ?auto_732624 ?auto_732628 ) ) ( not ( = ?auto_732624 ?auto_732629 ) ) ( not ( = ?auto_732624 ?auto_732630 ) ) ( not ( = ?auto_732624 ?auto_732631 ) ) ( not ( = ?auto_732624 ?auto_732636 ) ) ( not ( = ?auto_732626 ?auto_732627 ) ) ( not ( = ?auto_732626 ?auto_732628 ) ) ( not ( = ?auto_732626 ?auto_732629 ) ) ( not ( = ?auto_732626 ?auto_732630 ) ) ( not ( = ?auto_732626 ?auto_732631 ) ) ( not ( = ?auto_732626 ?auto_732636 ) ) ( not ( = ?auto_732627 ?auto_732628 ) ) ( not ( = ?auto_732627 ?auto_732629 ) ) ( not ( = ?auto_732627 ?auto_732630 ) ) ( not ( = ?auto_732627 ?auto_732631 ) ) ( not ( = ?auto_732627 ?auto_732636 ) ) ( not ( = ?auto_732628 ?auto_732629 ) ) ( not ( = ?auto_732628 ?auto_732630 ) ) ( not ( = ?auto_732628 ?auto_732631 ) ) ( not ( = ?auto_732628 ?auto_732636 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732629 ?auto_732630 ?auto_732631 )
      ( MAKE-12CRATE-VERIFY ?auto_732620 ?auto_732621 ?auto_732622 ?auto_732619 ?auto_732623 ?auto_732625 ?auto_732624 ?auto_732626 ?auto_732627 ?auto_732628 ?auto_732629 ?auto_732630 ?auto_732631 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732783 - SURFACE
      ?auto_732784 - SURFACE
      ?auto_732785 - SURFACE
      ?auto_732782 - SURFACE
      ?auto_732786 - SURFACE
      ?auto_732788 - SURFACE
      ?auto_732787 - SURFACE
      ?auto_732789 - SURFACE
      ?auto_732790 - SURFACE
      ?auto_732791 - SURFACE
      ?auto_732792 - SURFACE
      ?auto_732793 - SURFACE
      ?auto_732794 - SURFACE
    )
    :vars
    (
      ?auto_732796 - HOIST
      ?auto_732800 - PLACE
      ?auto_732798 - PLACE
      ?auto_732799 - HOIST
      ?auto_732795 - SURFACE
      ?auto_732797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_732796 ?auto_732800 ) ( IS-CRATE ?auto_732794 ) ( not ( = ?auto_732793 ?auto_732794 ) ) ( not ( = ?auto_732792 ?auto_732793 ) ) ( not ( = ?auto_732792 ?auto_732794 ) ) ( not ( = ?auto_732798 ?auto_732800 ) ) ( HOIST-AT ?auto_732799 ?auto_732798 ) ( not ( = ?auto_732796 ?auto_732799 ) ) ( AVAILABLE ?auto_732799 ) ( SURFACE-AT ?auto_732794 ?auto_732798 ) ( ON ?auto_732794 ?auto_732795 ) ( CLEAR ?auto_732794 ) ( not ( = ?auto_732793 ?auto_732795 ) ) ( not ( = ?auto_732794 ?auto_732795 ) ) ( not ( = ?auto_732792 ?auto_732795 ) ) ( TRUCK-AT ?auto_732797 ?auto_732800 ) ( SURFACE-AT ?auto_732792 ?auto_732800 ) ( CLEAR ?auto_732792 ) ( LIFTING ?auto_732796 ?auto_732793 ) ( IS-CRATE ?auto_732793 ) ( ON ?auto_732784 ?auto_732783 ) ( ON ?auto_732785 ?auto_732784 ) ( ON ?auto_732782 ?auto_732785 ) ( ON ?auto_732786 ?auto_732782 ) ( ON ?auto_732788 ?auto_732786 ) ( ON ?auto_732787 ?auto_732788 ) ( ON ?auto_732789 ?auto_732787 ) ( ON ?auto_732790 ?auto_732789 ) ( ON ?auto_732791 ?auto_732790 ) ( ON ?auto_732792 ?auto_732791 ) ( not ( = ?auto_732783 ?auto_732784 ) ) ( not ( = ?auto_732783 ?auto_732785 ) ) ( not ( = ?auto_732783 ?auto_732782 ) ) ( not ( = ?auto_732783 ?auto_732786 ) ) ( not ( = ?auto_732783 ?auto_732788 ) ) ( not ( = ?auto_732783 ?auto_732787 ) ) ( not ( = ?auto_732783 ?auto_732789 ) ) ( not ( = ?auto_732783 ?auto_732790 ) ) ( not ( = ?auto_732783 ?auto_732791 ) ) ( not ( = ?auto_732783 ?auto_732792 ) ) ( not ( = ?auto_732783 ?auto_732793 ) ) ( not ( = ?auto_732783 ?auto_732794 ) ) ( not ( = ?auto_732783 ?auto_732795 ) ) ( not ( = ?auto_732784 ?auto_732785 ) ) ( not ( = ?auto_732784 ?auto_732782 ) ) ( not ( = ?auto_732784 ?auto_732786 ) ) ( not ( = ?auto_732784 ?auto_732788 ) ) ( not ( = ?auto_732784 ?auto_732787 ) ) ( not ( = ?auto_732784 ?auto_732789 ) ) ( not ( = ?auto_732784 ?auto_732790 ) ) ( not ( = ?auto_732784 ?auto_732791 ) ) ( not ( = ?auto_732784 ?auto_732792 ) ) ( not ( = ?auto_732784 ?auto_732793 ) ) ( not ( = ?auto_732784 ?auto_732794 ) ) ( not ( = ?auto_732784 ?auto_732795 ) ) ( not ( = ?auto_732785 ?auto_732782 ) ) ( not ( = ?auto_732785 ?auto_732786 ) ) ( not ( = ?auto_732785 ?auto_732788 ) ) ( not ( = ?auto_732785 ?auto_732787 ) ) ( not ( = ?auto_732785 ?auto_732789 ) ) ( not ( = ?auto_732785 ?auto_732790 ) ) ( not ( = ?auto_732785 ?auto_732791 ) ) ( not ( = ?auto_732785 ?auto_732792 ) ) ( not ( = ?auto_732785 ?auto_732793 ) ) ( not ( = ?auto_732785 ?auto_732794 ) ) ( not ( = ?auto_732785 ?auto_732795 ) ) ( not ( = ?auto_732782 ?auto_732786 ) ) ( not ( = ?auto_732782 ?auto_732788 ) ) ( not ( = ?auto_732782 ?auto_732787 ) ) ( not ( = ?auto_732782 ?auto_732789 ) ) ( not ( = ?auto_732782 ?auto_732790 ) ) ( not ( = ?auto_732782 ?auto_732791 ) ) ( not ( = ?auto_732782 ?auto_732792 ) ) ( not ( = ?auto_732782 ?auto_732793 ) ) ( not ( = ?auto_732782 ?auto_732794 ) ) ( not ( = ?auto_732782 ?auto_732795 ) ) ( not ( = ?auto_732786 ?auto_732788 ) ) ( not ( = ?auto_732786 ?auto_732787 ) ) ( not ( = ?auto_732786 ?auto_732789 ) ) ( not ( = ?auto_732786 ?auto_732790 ) ) ( not ( = ?auto_732786 ?auto_732791 ) ) ( not ( = ?auto_732786 ?auto_732792 ) ) ( not ( = ?auto_732786 ?auto_732793 ) ) ( not ( = ?auto_732786 ?auto_732794 ) ) ( not ( = ?auto_732786 ?auto_732795 ) ) ( not ( = ?auto_732788 ?auto_732787 ) ) ( not ( = ?auto_732788 ?auto_732789 ) ) ( not ( = ?auto_732788 ?auto_732790 ) ) ( not ( = ?auto_732788 ?auto_732791 ) ) ( not ( = ?auto_732788 ?auto_732792 ) ) ( not ( = ?auto_732788 ?auto_732793 ) ) ( not ( = ?auto_732788 ?auto_732794 ) ) ( not ( = ?auto_732788 ?auto_732795 ) ) ( not ( = ?auto_732787 ?auto_732789 ) ) ( not ( = ?auto_732787 ?auto_732790 ) ) ( not ( = ?auto_732787 ?auto_732791 ) ) ( not ( = ?auto_732787 ?auto_732792 ) ) ( not ( = ?auto_732787 ?auto_732793 ) ) ( not ( = ?auto_732787 ?auto_732794 ) ) ( not ( = ?auto_732787 ?auto_732795 ) ) ( not ( = ?auto_732789 ?auto_732790 ) ) ( not ( = ?auto_732789 ?auto_732791 ) ) ( not ( = ?auto_732789 ?auto_732792 ) ) ( not ( = ?auto_732789 ?auto_732793 ) ) ( not ( = ?auto_732789 ?auto_732794 ) ) ( not ( = ?auto_732789 ?auto_732795 ) ) ( not ( = ?auto_732790 ?auto_732791 ) ) ( not ( = ?auto_732790 ?auto_732792 ) ) ( not ( = ?auto_732790 ?auto_732793 ) ) ( not ( = ?auto_732790 ?auto_732794 ) ) ( not ( = ?auto_732790 ?auto_732795 ) ) ( not ( = ?auto_732791 ?auto_732792 ) ) ( not ( = ?auto_732791 ?auto_732793 ) ) ( not ( = ?auto_732791 ?auto_732794 ) ) ( not ( = ?auto_732791 ?auto_732795 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732792 ?auto_732793 ?auto_732794 )
      ( MAKE-12CRATE-VERIFY ?auto_732783 ?auto_732784 ?auto_732785 ?auto_732782 ?auto_732786 ?auto_732788 ?auto_732787 ?auto_732789 ?auto_732790 ?auto_732791 ?auto_732792 ?auto_732793 ?auto_732794 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732946 - SURFACE
      ?auto_732947 - SURFACE
      ?auto_732948 - SURFACE
      ?auto_732945 - SURFACE
      ?auto_732949 - SURFACE
      ?auto_732951 - SURFACE
      ?auto_732950 - SURFACE
      ?auto_732952 - SURFACE
      ?auto_732953 - SURFACE
      ?auto_732954 - SURFACE
      ?auto_732955 - SURFACE
      ?auto_732956 - SURFACE
      ?auto_732957 - SURFACE
    )
    :vars
    (
      ?auto_732960 - HOIST
      ?auto_732963 - PLACE
      ?auto_732958 - PLACE
      ?auto_732961 - HOIST
      ?auto_732962 - SURFACE
      ?auto_732959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_732960 ?auto_732963 ) ( IS-CRATE ?auto_732957 ) ( not ( = ?auto_732956 ?auto_732957 ) ) ( not ( = ?auto_732955 ?auto_732956 ) ) ( not ( = ?auto_732955 ?auto_732957 ) ) ( not ( = ?auto_732958 ?auto_732963 ) ) ( HOIST-AT ?auto_732961 ?auto_732958 ) ( not ( = ?auto_732960 ?auto_732961 ) ) ( AVAILABLE ?auto_732961 ) ( SURFACE-AT ?auto_732957 ?auto_732958 ) ( ON ?auto_732957 ?auto_732962 ) ( CLEAR ?auto_732957 ) ( not ( = ?auto_732956 ?auto_732962 ) ) ( not ( = ?auto_732957 ?auto_732962 ) ) ( not ( = ?auto_732955 ?auto_732962 ) ) ( TRUCK-AT ?auto_732959 ?auto_732963 ) ( SURFACE-AT ?auto_732955 ?auto_732963 ) ( CLEAR ?auto_732955 ) ( IS-CRATE ?auto_732956 ) ( AVAILABLE ?auto_732960 ) ( IN ?auto_732956 ?auto_732959 ) ( ON ?auto_732947 ?auto_732946 ) ( ON ?auto_732948 ?auto_732947 ) ( ON ?auto_732945 ?auto_732948 ) ( ON ?auto_732949 ?auto_732945 ) ( ON ?auto_732951 ?auto_732949 ) ( ON ?auto_732950 ?auto_732951 ) ( ON ?auto_732952 ?auto_732950 ) ( ON ?auto_732953 ?auto_732952 ) ( ON ?auto_732954 ?auto_732953 ) ( ON ?auto_732955 ?auto_732954 ) ( not ( = ?auto_732946 ?auto_732947 ) ) ( not ( = ?auto_732946 ?auto_732948 ) ) ( not ( = ?auto_732946 ?auto_732945 ) ) ( not ( = ?auto_732946 ?auto_732949 ) ) ( not ( = ?auto_732946 ?auto_732951 ) ) ( not ( = ?auto_732946 ?auto_732950 ) ) ( not ( = ?auto_732946 ?auto_732952 ) ) ( not ( = ?auto_732946 ?auto_732953 ) ) ( not ( = ?auto_732946 ?auto_732954 ) ) ( not ( = ?auto_732946 ?auto_732955 ) ) ( not ( = ?auto_732946 ?auto_732956 ) ) ( not ( = ?auto_732946 ?auto_732957 ) ) ( not ( = ?auto_732946 ?auto_732962 ) ) ( not ( = ?auto_732947 ?auto_732948 ) ) ( not ( = ?auto_732947 ?auto_732945 ) ) ( not ( = ?auto_732947 ?auto_732949 ) ) ( not ( = ?auto_732947 ?auto_732951 ) ) ( not ( = ?auto_732947 ?auto_732950 ) ) ( not ( = ?auto_732947 ?auto_732952 ) ) ( not ( = ?auto_732947 ?auto_732953 ) ) ( not ( = ?auto_732947 ?auto_732954 ) ) ( not ( = ?auto_732947 ?auto_732955 ) ) ( not ( = ?auto_732947 ?auto_732956 ) ) ( not ( = ?auto_732947 ?auto_732957 ) ) ( not ( = ?auto_732947 ?auto_732962 ) ) ( not ( = ?auto_732948 ?auto_732945 ) ) ( not ( = ?auto_732948 ?auto_732949 ) ) ( not ( = ?auto_732948 ?auto_732951 ) ) ( not ( = ?auto_732948 ?auto_732950 ) ) ( not ( = ?auto_732948 ?auto_732952 ) ) ( not ( = ?auto_732948 ?auto_732953 ) ) ( not ( = ?auto_732948 ?auto_732954 ) ) ( not ( = ?auto_732948 ?auto_732955 ) ) ( not ( = ?auto_732948 ?auto_732956 ) ) ( not ( = ?auto_732948 ?auto_732957 ) ) ( not ( = ?auto_732948 ?auto_732962 ) ) ( not ( = ?auto_732945 ?auto_732949 ) ) ( not ( = ?auto_732945 ?auto_732951 ) ) ( not ( = ?auto_732945 ?auto_732950 ) ) ( not ( = ?auto_732945 ?auto_732952 ) ) ( not ( = ?auto_732945 ?auto_732953 ) ) ( not ( = ?auto_732945 ?auto_732954 ) ) ( not ( = ?auto_732945 ?auto_732955 ) ) ( not ( = ?auto_732945 ?auto_732956 ) ) ( not ( = ?auto_732945 ?auto_732957 ) ) ( not ( = ?auto_732945 ?auto_732962 ) ) ( not ( = ?auto_732949 ?auto_732951 ) ) ( not ( = ?auto_732949 ?auto_732950 ) ) ( not ( = ?auto_732949 ?auto_732952 ) ) ( not ( = ?auto_732949 ?auto_732953 ) ) ( not ( = ?auto_732949 ?auto_732954 ) ) ( not ( = ?auto_732949 ?auto_732955 ) ) ( not ( = ?auto_732949 ?auto_732956 ) ) ( not ( = ?auto_732949 ?auto_732957 ) ) ( not ( = ?auto_732949 ?auto_732962 ) ) ( not ( = ?auto_732951 ?auto_732950 ) ) ( not ( = ?auto_732951 ?auto_732952 ) ) ( not ( = ?auto_732951 ?auto_732953 ) ) ( not ( = ?auto_732951 ?auto_732954 ) ) ( not ( = ?auto_732951 ?auto_732955 ) ) ( not ( = ?auto_732951 ?auto_732956 ) ) ( not ( = ?auto_732951 ?auto_732957 ) ) ( not ( = ?auto_732951 ?auto_732962 ) ) ( not ( = ?auto_732950 ?auto_732952 ) ) ( not ( = ?auto_732950 ?auto_732953 ) ) ( not ( = ?auto_732950 ?auto_732954 ) ) ( not ( = ?auto_732950 ?auto_732955 ) ) ( not ( = ?auto_732950 ?auto_732956 ) ) ( not ( = ?auto_732950 ?auto_732957 ) ) ( not ( = ?auto_732950 ?auto_732962 ) ) ( not ( = ?auto_732952 ?auto_732953 ) ) ( not ( = ?auto_732952 ?auto_732954 ) ) ( not ( = ?auto_732952 ?auto_732955 ) ) ( not ( = ?auto_732952 ?auto_732956 ) ) ( not ( = ?auto_732952 ?auto_732957 ) ) ( not ( = ?auto_732952 ?auto_732962 ) ) ( not ( = ?auto_732953 ?auto_732954 ) ) ( not ( = ?auto_732953 ?auto_732955 ) ) ( not ( = ?auto_732953 ?auto_732956 ) ) ( not ( = ?auto_732953 ?auto_732957 ) ) ( not ( = ?auto_732953 ?auto_732962 ) ) ( not ( = ?auto_732954 ?auto_732955 ) ) ( not ( = ?auto_732954 ?auto_732956 ) ) ( not ( = ?auto_732954 ?auto_732957 ) ) ( not ( = ?auto_732954 ?auto_732962 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732955 ?auto_732956 ?auto_732957 )
      ( MAKE-12CRATE-VERIFY ?auto_732946 ?auto_732947 ?auto_732948 ?auto_732945 ?auto_732949 ?auto_732951 ?auto_732950 ?auto_732952 ?auto_732953 ?auto_732954 ?auto_732955 ?auto_732956 ?auto_732957 ) )
  )

)

