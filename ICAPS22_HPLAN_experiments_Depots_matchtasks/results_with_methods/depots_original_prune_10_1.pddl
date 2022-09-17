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
      ?auto_292627 - SURFACE
      ?auto_292628 - SURFACE
    )
    :vars
    (
      ?auto_292629 - HOIST
      ?auto_292630 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292629 ?auto_292630 ) ( SURFACE-AT ?auto_292627 ?auto_292630 ) ( CLEAR ?auto_292627 ) ( LIFTING ?auto_292629 ?auto_292628 ) ( IS-CRATE ?auto_292628 ) ( not ( = ?auto_292627 ?auto_292628 ) ) )
    :subtasks
    ( ( !DROP ?auto_292629 ?auto_292628 ?auto_292627 ?auto_292630 )
      ( MAKE-1CRATE-VERIFY ?auto_292627 ?auto_292628 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292631 - SURFACE
      ?auto_292632 - SURFACE
    )
    :vars
    (
      ?auto_292634 - HOIST
      ?auto_292633 - PLACE
      ?auto_292635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292634 ?auto_292633 ) ( SURFACE-AT ?auto_292631 ?auto_292633 ) ( CLEAR ?auto_292631 ) ( IS-CRATE ?auto_292632 ) ( not ( = ?auto_292631 ?auto_292632 ) ) ( TRUCK-AT ?auto_292635 ?auto_292633 ) ( AVAILABLE ?auto_292634 ) ( IN ?auto_292632 ?auto_292635 ) )
    :subtasks
    ( ( !UNLOAD ?auto_292634 ?auto_292632 ?auto_292635 ?auto_292633 )
      ( MAKE-1CRATE ?auto_292631 ?auto_292632 )
      ( MAKE-1CRATE-VERIFY ?auto_292631 ?auto_292632 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292636 - SURFACE
      ?auto_292637 - SURFACE
    )
    :vars
    (
      ?auto_292640 - HOIST
      ?auto_292639 - PLACE
      ?auto_292638 - TRUCK
      ?auto_292641 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292640 ?auto_292639 ) ( SURFACE-AT ?auto_292636 ?auto_292639 ) ( CLEAR ?auto_292636 ) ( IS-CRATE ?auto_292637 ) ( not ( = ?auto_292636 ?auto_292637 ) ) ( AVAILABLE ?auto_292640 ) ( IN ?auto_292637 ?auto_292638 ) ( TRUCK-AT ?auto_292638 ?auto_292641 ) ( not ( = ?auto_292641 ?auto_292639 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_292638 ?auto_292641 ?auto_292639 )
      ( MAKE-1CRATE ?auto_292636 ?auto_292637 )
      ( MAKE-1CRATE-VERIFY ?auto_292636 ?auto_292637 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292642 - SURFACE
      ?auto_292643 - SURFACE
    )
    :vars
    (
      ?auto_292645 - HOIST
      ?auto_292646 - PLACE
      ?auto_292644 - TRUCK
      ?auto_292647 - PLACE
      ?auto_292648 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_292645 ?auto_292646 ) ( SURFACE-AT ?auto_292642 ?auto_292646 ) ( CLEAR ?auto_292642 ) ( IS-CRATE ?auto_292643 ) ( not ( = ?auto_292642 ?auto_292643 ) ) ( AVAILABLE ?auto_292645 ) ( TRUCK-AT ?auto_292644 ?auto_292647 ) ( not ( = ?auto_292647 ?auto_292646 ) ) ( HOIST-AT ?auto_292648 ?auto_292647 ) ( LIFTING ?auto_292648 ?auto_292643 ) ( not ( = ?auto_292645 ?auto_292648 ) ) )
    :subtasks
    ( ( !LOAD ?auto_292648 ?auto_292643 ?auto_292644 ?auto_292647 )
      ( MAKE-1CRATE ?auto_292642 ?auto_292643 )
      ( MAKE-1CRATE-VERIFY ?auto_292642 ?auto_292643 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292649 - SURFACE
      ?auto_292650 - SURFACE
    )
    :vars
    (
      ?auto_292655 - HOIST
      ?auto_292653 - PLACE
      ?auto_292654 - TRUCK
      ?auto_292652 - PLACE
      ?auto_292651 - HOIST
      ?auto_292656 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292655 ?auto_292653 ) ( SURFACE-AT ?auto_292649 ?auto_292653 ) ( CLEAR ?auto_292649 ) ( IS-CRATE ?auto_292650 ) ( not ( = ?auto_292649 ?auto_292650 ) ) ( AVAILABLE ?auto_292655 ) ( TRUCK-AT ?auto_292654 ?auto_292652 ) ( not ( = ?auto_292652 ?auto_292653 ) ) ( HOIST-AT ?auto_292651 ?auto_292652 ) ( not ( = ?auto_292655 ?auto_292651 ) ) ( AVAILABLE ?auto_292651 ) ( SURFACE-AT ?auto_292650 ?auto_292652 ) ( ON ?auto_292650 ?auto_292656 ) ( CLEAR ?auto_292650 ) ( not ( = ?auto_292649 ?auto_292656 ) ) ( not ( = ?auto_292650 ?auto_292656 ) ) )
    :subtasks
    ( ( !LIFT ?auto_292651 ?auto_292650 ?auto_292656 ?auto_292652 )
      ( MAKE-1CRATE ?auto_292649 ?auto_292650 )
      ( MAKE-1CRATE-VERIFY ?auto_292649 ?auto_292650 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292657 - SURFACE
      ?auto_292658 - SURFACE
    )
    :vars
    (
      ?auto_292662 - HOIST
      ?auto_292663 - PLACE
      ?auto_292660 - PLACE
      ?auto_292664 - HOIST
      ?auto_292659 - SURFACE
      ?auto_292661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292662 ?auto_292663 ) ( SURFACE-AT ?auto_292657 ?auto_292663 ) ( CLEAR ?auto_292657 ) ( IS-CRATE ?auto_292658 ) ( not ( = ?auto_292657 ?auto_292658 ) ) ( AVAILABLE ?auto_292662 ) ( not ( = ?auto_292660 ?auto_292663 ) ) ( HOIST-AT ?auto_292664 ?auto_292660 ) ( not ( = ?auto_292662 ?auto_292664 ) ) ( AVAILABLE ?auto_292664 ) ( SURFACE-AT ?auto_292658 ?auto_292660 ) ( ON ?auto_292658 ?auto_292659 ) ( CLEAR ?auto_292658 ) ( not ( = ?auto_292657 ?auto_292659 ) ) ( not ( = ?auto_292658 ?auto_292659 ) ) ( TRUCK-AT ?auto_292661 ?auto_292663 ) )
    :subtasks
    ( ( !DRIVE ?auto_292661 ?auto_292663 ?auto_292660 )
      ( MAKE-1CRATE ?auto_292657 ?auto_292658 )
      ( MAKE-1CRATE-VERIFY ?auto_292657 ?auto_292658 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292674 - SURFACE
      ?auto_292675 - SURFACE
      ?auto_292676 - SURFACE
    )
    :vars
    (
      ?auto_292678 - HOIST
      ?auto_292677 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292678 ?auto_292677 ) ( SURFACE-AT ?auto_292675 ?auto_292677 ) ( CLEAR ?auto_292675 ) ( LIFTING ?auto_292678 ?auto_292676 ) ( IS-CRATE ?auto_292676 ) ( not ( = ?auto_292675 ?auto_292676 ) ) ( ON ?auto_292675 ?auto_292674 ) ( not ( = ?auto_292674 ?auto_292675 ) ) ( not ( = ?auto_292674 ?auto_292676 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292675 ?auto_292676 )
      ( MAKE-2CRATE-VERIFY ?auto_292674 ?auto_292675 ?auto_292676 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292684 - SURFACE
      ?auto_292685 - SURFACE
      ?auto_292686 - SURFACE
    )
    :vars
    (
      ?auto_292689 - HOIST
      ?auto_292688 - PLACE
      ?auto_292687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292689 ?auto_292688 ) ( SURFACE-AT ?auto_292685 ?auto_292688 ) ( CLEAR ?auto_292685 ) ( IS-CRATE ?auto_292686 ) ( not ( = ?auto_292685 ?auto_292686 ) ) ( TRUCK-AT ?auto_292687 ?auto_292688 ) ( AVAILABLE ?auto_292689 ) ( IN ?auto_292686 ?auto_292687 ) ( ON ?auto_292685 ?auto_292684 ) ( not ( = ?auto_292684 ?auto_292685 ) ) ( not ( = ?auto_292684 ?auto_292686 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292685 ?auto_292686 )
      ( MAKE-2CRATE-VERIFY ?auto_292684 ?auto_292685 ?auto_292686 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292690 - SURFACE
      ?auto_292691 - SURFACE
    )
    :vars
    (
      ?auto_292693 - HOIST
      ?auto_292692 - PLACE
      ?auto_292695 - TRUCK
      ?auto_292694 - SURFACE
      ?auto_292696 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292693 ?auto_292692 ) ( SURFACE-AT ?auto_292690 ?auto_292692 ) ( CLEAR ?auto_292690 ) ( IS-CRATE ?auto_292691 ) ( not ( = ?auto_292690 ?auto_292691 ) ) ( AVAILABLE ?auto_292693 ) ( IN ?auto_292691 ?auto_292695 ) ( ON ?auto_292690 ?auto_292694 ) ( not ( = ?auto_292694 ?auto_292690 ) ) ( not ( = ?auto_292694 ?auto_292691 ) ) ( TRUCK-AT ?auto_292695 ?auto_292696 ) ( not ( = ?auto_292696 ?auto_292692 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_292695 ?auto_292696 ?auto_292692 )
      ( MAKE-2CRATE ?auto_292694 ?auto_292690 ?auto_292691 )
      ( MAKE-1CRATE-VERIFY ?auto_292690 ?auto_292691 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292697 - SURFACE
      ?auto_292698 - SURFACE
      ?auto_292699 - SURFACE
    )
    :vars
    (
      ?auto_292701 - HOIST
      ?auto_292702 - PLACE
      ?auto_292703 - TRUCK
      ?auto_292700 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292701 ?auto_292702 ) ( SURFACE-AT ?auto_292698 ?auto_292702 ) ( CLEAR ?auto_292698 ) ( IS-CRATE ?auto_292699 ) ( not ( = ?auto_292698 ?auto_292699 ) ) ( AVAILABLE ?auto_292701 ) ( IN ?auto_292699 ?auto_292703 ) ( ON ?auto_292698 ?auto_292697 ) ( not ( = ?auto_292697 ?auto_292698 ) ) ( not ( = ?auto_292697 ?auto_292699 ) ) ( TRUCK-AT ?auto_292703 ?auto_292700 ) ( not ( = ?auto_292700 ?auto_292702 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292698 ?auto_292699 )
      ( MAKE-2CRATE-VERIFY ?auto_292697 ?auto_292698 ?auto_292699 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292704 - SURFACE
      ?auto_292705 - SURFACE
    )
    :vars
    (
      ?auto_292706 - HOIST
      ?auto_292708 - PLACE
      ?auto_292707 - SURFACE
      ?auto_292709 - TRUCK
      ?auto_292710 - PLACE
      ?auto_292711 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_292706 ?auto_292708 ) ( SURFACE-AT ?auto_292704 ?auto_292708 ) ( CLEAR ?auto_292704 ) ( IS-CRATE ?auto_292705 ) ( not ( = ?auto_292704 ?auto_292705 ) ) ( AVAILABLE ?auto_292706 ) ( ON ?auto_292704 ?auto_292707 ) ( not ( = ?auto_292707 ?auto_292704 ) ) ( not ( = ?auto_292707 ?auto_292705 ) ) ( TRUCK-AT ?auto_292709 ?auto_292710 ) ( not ( = ?auto_292710 ?auto_292708 ) ) ( HOIST-AT ?auto_292711 ?auto_292710 ) ( LIFTING ?auto_292711 ?auto_292705 ) ( not ( = ?auto_292706 ?auto_292711 ) ) )
    :subtasks
    ( ( !LOAD ?auto_292711 ?auto_292705 ?auto_292709 ?auto_292710 )
      ( MAKE-2CRATE ?auto_292707 ?auto_292704 ?auto_292705 )
      ( MAKE-1CRATE-VERIFY ?auto_292704 ?auto_292705 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292712 - SURFACE
      ?auto_292713 - SURFACE
      ?auto_292714 - SURFACE
    )
    :vars
    (
      ?auto_292717 - HOIST
      ?auto_292718 - PLACE
      ?auto_292719 - TRUCK
      ?auto_292715 - PLACE
      ?auto_292716 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_292717 ?auto_292718 ) ( SURFACE-AT ?auto_292713 ?auto_292718 ) ( CLEAR ?auto_292713 ) ( IS-CRATE ?auto_292714 ) ( not ( = ?auto_292713 ?auto_292714 ) ) ( AVAILABLE ?auto_292717 ) ( ON ?auto_292713 ?auto_292712 ) ( not ( = ?auto_292712 ?auto_292713 ) ) ( not ( = ?auto_292712 ?auto_292714 ) ) ( TRUCK-AT ?auto_292719 ?auto_292715 ) ( not ( = ?auto_292715 ?auto_292718 ) ) ( HOIST-AT ?auto_292716 ?auto_292715 ) ( LIFTING ?auto_292716 ?auto_292714 ) ( not ( = ?auto_292717 ?auto_292716 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292713 ?auto_292714 )
      ( MAKE-2CRATE-VERIFY ?auto_292712 ?auto_292713 ?auto_292714 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292720 - SURFACE
      ?auto_292721 - SURFACE
    )
    :vars
    (
      ?auto_292724 - HOIST
      ?auto_292723 - PLACE
      ?auto_292727 - SURFACE
      ?auto_292722 - TRUCK
      ?auto_292726 - PLACE
      ?auto_292725 - HOIST
      ?auto_292728 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292724 ?auto_292723 ) ( SURFACE-AT ?auto_292720 ?auto_292723 ) ( CLEAR ?auto_292720 ) ( IS-CRATE ?auto_292721 ) ( not ( = ?auto_292720 ?auto_292721 ) ) ( AVAILABLE ?auto_292724 ) ( ON ?auto_292720 ?auto_292727 ) ( not ( = ?auto_292727 ?auto_292720 ) ) ( not ( = ?auto_292727 ?auto_292721 ) ) ( TRUCK-AT ?auto_292722 ?auto_292726 ) ( not ( = ?auto_292726 ?auto_292723 ) ) ( HOIST-AT ?auto_292725 ?auto_292726 ) ( not ( = ?auto_292724 ?auto_292725 ) ) ( AVAILABLE ?auto_292725 ) ( SURFACE-AT ?auto_292721 ?auto_292726 ) ( ON ?auto_292721 ?auto_292728 ) ( CLEAR ?auto_292721 ) ( not ( = ?auto_292720 ?auto_292728 ) ) ( not ( = ?auto_292721 ?auto_292728 ) ) ( not ( = ?auto_292727 ?auto_292728 ) ) )
    :subtasks
    ( ( !LIFT ?auto_292725 ?auto_292721 ?auto_292728 ?auto_292726 )
      ( MAKE-2CRATE ?auto_292727 ?auto_292720 ?auto_292721 )
      ( MAKE-1CRATE-VERIFY ?auto_292720 ?auto_292721 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292729 - SURFACE
      ?auto_292730 - SURFACE
      ?auto_292731 - SURFACE
    )
    :vars
    (
      ?auto_292733 - HOIST
      ?auto_292735 - PLACE
      ?auto_292734 - TRUCK
      ?auto_292737 - PLACE
      ?auto_292732 - HOIST
      ?auto_292736 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292733 ?auto_292735 ) ( SURFACE-AT ?auto_292730 ?auto_292735 ) ( CLEAR ?auto_292730 ) ( IS-CRATE ?auto_292731 ) ( not ( = ?auto_292730 ?auto_292731 ) ) ( AVAILABLE ?auto_292733 ) ( ON ?auto_292730 ?auto_292729 ) ( not ( = ?auto_292729 ?auto_292730 ) ) ( not ( = ?auto_292729 ?auto_292731 ) ) ( TRUCK-AT ?auto_292734 ?auto_292737 ) ( not ( = ?auto_292737 ?auto_292735 ) ) ( HOIST-AT ?auto_292732 ?auto_292737 ) ( not ( = ?auto_292733 ?auto_292732 ) ) ( AVAILABLE ?auto_292732 ) ( SURFACE-AT ?auto_292731 ?auto_292737 ) ( ON ?auto_292731 ?auto_292736 ) ( CLEAR ?auto_292731 ) ( not ( = ?auto_292730 ?auto_292736 ) ) ( not ( = ?auto_292731 ?auto_292736 ) ) ( not ( = ?auto_292729 ?auto_292736 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292730 ?auto_292731 )
      ( MAKE-2CRATE-VERIFY ?auto_292729 ?auto_292730 ?auto_292731 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292738 - SURFACE
      ?auto_292739 - SURFACE
    )
    :vars
    (
      ?auto_292740 - HOIST
      ?auto_292742 - PLACE
      ?auto_292746 - SURFACE
      ?auto_292741 - PLACE
      ?auto_292744 - HOIST
      ?auto_292743 - SURFACE
      ?auto_292745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292740 ?auto_292742 ) ( SURFACE-AT ?auto_292738 ?auto_292742 ) ( CLEAR ?auto_292738 ) ( IS-CRATE ?auto_292739 ) ( not ( = ?auto_292738 ?auto_292739 ) ) ( AVAILABLE ?auto_292740 ) ( ON ?auto_292738 ?auto_292746 ) ( not ( = ?auto_292746 ?auto_292738 ) ) ( not ( = ?auto_292746 ?auto_292739 ) ) ( not ( = ?auto_292741 ?auto_292742 ) ) ( HOIST-AT ?auto_292744 ?auto_292741 ) ( not ( = ?auto_292740 ?auto_292744 ) ) ( AVAILABLE ?auto_292744 ) ( SURFACE-AT ?auto_292739 ?auto_292741 ) ( ON ?auto_292739 ?auto_292743 ) ( CLEAR ?auto_292739 ) ( not ( = ?auto_292738 ?auto_292743 ) ) ( not ( = ?auto_292739 ?auto_292743 ) ) ( not ( = ?auto_292746 ?auto_292743 ) ) ( TRUCK-AT ?auto_292745 ?auto_292742 ) )
    :subtasks
    ( ( !DRIVE ?auto_292745 ?auto_292742 ?auto_292741 )
      ( MAKE-2CRATE ?auto_292746 ?auto_292738 ?auto_292739 )
      ( MAKE-1CRATE-VERIFY ?auto_292738 ?auto_292739 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292747 - SURFACE
      ?auto_292748 - SURFACE
      ?auto_292749 - SURFACE
    )
    :vars
    (
      ?auto_292755 - HOIST
      ?auto_292752 - PLACE
      ?auto_292753 - PLACE
      ?auto_292750 - HOIST
      ?auto_292754 - SURFACE
      ?auto_292751 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292755 ?auto_292752 ) ( SURFACE-AT ?auto_292748 ?auto_292752 ) ( CLEAR ?auto_292748 ) ( IS-CRATE ?auto_292749 ) ( not ( = ?auto_292748 ?auto_292749 ) ) ( AVAILABLE ?auto_292755 ) ( ON ?auto_292748 ?auto_292747 ) ( not ( = ?auto_292747 ?auto_292748 ) ) ( not ( = ?auto_292747 ?auto_292749 ) ) ( not ( = ?auto_292753 ?auto_292752 ) ) ( HOIST-AT ?auto_292750 ?auto_292753 ) ( not ( = ?auto_292755 ?auto_292750 ) ) ( AVAILABLE ?auto_292750 ) ( SURFACE-AT ?auto_292749 ?auto_292753 ) ( ON ?auto_292749 ?auto_292754 ) ( CLEAR ?auto_292749 ) ( not ( = ?auto_292748 ?auto_292754 ) ) ( not ( = ?auto_292749 ?auto_292754 ) ) ( not ( = ?auto_292747 ?auto_292754 ) ) ( TRUCK-AT ?auto_292751 ?auto_292752 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292748 ?auto_292749 )
      ( MAKE-2CRATE-VERIFY ?auto_292747 ?auto_292748 ?auto_292749 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292756 - SURFACE
      ?auto_292757 - SURFACE
    )
    :vars
    (
      ?auto_292760 - HOIST
      ?auto_292759 - PLACE
      ?auto_292764 - SURFACE
      ?auto_292762 - PLACE
      ?auto_292763 - HOIST
      ?auto_292758 - SURFACE
      ?auto_292761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292760 ?auto_292759 ) ( IS-CRATE ?auto_292757 ) ( not ( = ?auto_292756 ?auto_292757 ) ) ( not ( = ?auto_292764 ?auto_292756 ) ) ( not ( = ?auto_292764 ?auto_292757 ) ) ( not ( = ?auto_292762 ?auto_292759 ) ) ( HOIST-AT ?auto_292763 ?auto_292762 ) ( not ( = ?auto_292760 ?auto_292763 ) ) ( AVAILABLE ?auto_292763 ) ( SURFACE-AT ?auto_292757 ?auto_292762 ) ( ON ?auto_292757 ?auto_292758 ) ( CLEAR ?auto_292757 ) ( not ( = ?auto_292756 ?auto_292758 ) ) ( not ( = ?auto_292757 ?auto_292758 ) ) ( not ( = ?auto_292764 ?auto_292758 ) ) ( TRUCK-AT ?auto_292761 ?auto_292759 ) ( SURFACE-AT ?auto_292764 ?auto_292759 ) ( CLEAR ?auto_292764 ) ( LIFTING ?auto_292760 ?auto_292756 ) ( IS-CRATE ?auto_292756 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292764 ?auto_292756 )
      ( MAKE-2CRATE ?auto_292764 ?auto_292756 ?auto_292757 )
      ( MAKE-1CRATE-VERIFY ?auto_292756 ?auto_292757 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292765 - SURFACE
      ?auto_292766 - SURFACE
      ?auto_292767 - SURFACE
    )
    :vars
    (
      ?auto_292772 - HOIST
      ?auto_292768 - PLACE
      ?auto_292773 - PLACE
      ?auto_292771 - HOIST
      ?auto_292769 - SURFACE
      ?auto_292770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292772 ?auto_292768 ) ( IS-CRATE ?auto_292767 ) ( not ( = ?auto_292766 ?auto_292767 ) ) ( not ( = ?auto_292765 ?auto_292766 ) ) ( not ( = ?auto_292765 ?auto_292767 ) ) ( not ( = ?auto_292773 ?auto_292768 ) ) ( HOIST-AT ?auto_292771 ?auto_292773 ) ( not ( = ?auto_292772 ?auto_292771 ) ) ( AVAILABLE ?auto_292771 ) ( SURFACE-AT ?auto_292767 ?auto_292773 ) ( ON ?auto_292767 ?auto_292769 ) ( CLEAR ?auto_292767 ) ( not ( = ?auto_292766 ?auto_292769 ) ) ( not ( = ?auto_292767 ?auto_292769 ) ) ( not ( = ?auto_292765 ?auto_292769 ) ) ( TRUCK-AT ?auto_292770 ?auto_292768 ) ( SURFACE-AT ?auto_292765 ?auto_292768 ) ( CLEAR ?auto_292765 ) ( LIFTING ?auto_292772 ?auto_292766 ) ( IS-CRATE ?auto_292766 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292766 ?auto_292767 )
      ( MAKE-2CRATE-VERIFY ?auto_292765 ?auto_292766 ?auto_292767 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292774 - SURFACE
      ?auto_292775 - SURFACE
    )
    :vars
    (
      ?auto_292781 - HOIST
      ?auto_292779 - PLACE
      ?auto_292777 - SURFACE
      ?auto_292780 - PLACE
      ?auto_292782 - HOIST
      ?auto_292776 - SURFACE
      ?auto_292778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292781 ?auto_292779 ) ( IS-CRATE ?auto_292775 ) ( not ( = ?auto_292774 ?auto_292775 ) ) ( not ( = ?auto_292777 ?auto_292774 ) ) ( not ( = ?auto_292777 ?auto_292775 ) ) ( not ( = ?auto_292780 ?auto_292779 ) ) ( HOIST-AT ?auto_292782 ?auto_292780 ) ( not ( = ?auto_292781 ?auto_292782 ) ) ( AVAILABLE ?auto_292782 ) ( SURFACE-AT ?auto_292775 ?auto_292780 ) ( ON ?auto_292775 ?auto_292776 ) ( CLEAR ?auto_292775 ) ( not ( = ?auto_292774 ?auto_292776 ) ) ( not ( = ?auto_292775 ?auto_292776 ) ) ( not ( = ?auto_292777 ?auto_292776 ) ) ( TRUCK-AT ?auto_292778 ?auto_292779 ) ( SURFACE-AT ?auto_292777 ?auto_292779 ) ( CLEAR ?auto_292777 ) ( IS-CRATE ?auto_292774 ) ( AVAILABLE ?auto_292781 ) ( IN ?auto_292774 ?auto_292778 ) )
    :subtasks
    ( ( !UNLOAD ?auto_292781 ?auto_292774 ?auto_292778 ?auto_292779 )
      ( MAKE-2CRATE ?auto_292777 ?auto_292774 ?auto_292775 )
      ( MAKE-1CRATE-VERIFY ?auto_292774 ?auto_292775 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292783 - SURFACE
      ?auto_292784 - SURFACE
      ?auto_292785 - SURFACE
    )
    :vars
    (
      ?auto_292790 - HOIST
      ?auto_292791 - PLACE
      ?auto_292788 - PLACE
      ?auto_292787 - HOIST
      ?auto_292786 - SURFACE
      ?auto_292789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292790 ?auto_292791 ) ( IS-CRATE ?auto_292785 ) ( not ( = ?auto_292784 ?auto_292785 ) ) ( not ( = ?auto_292783 ?auto_292784 ) ) ( not ( = ?auto_292783 ?auto_292785 ) ) ( not ( = ?auto_292788 ?auto_292791 ) ) ( HOIST-AT ?auto_292787 ?auto_292788 ) ( not ( = ?auto_292790 ?auto_292787 ) ) ( AVAILABLE ?auto_292787 ) ( SURFACE-AT ?auto_292785 ?auto_292788 ) ( ON ?auto_292785 ?auto_292786 ) ( CLEAR ?auto_292785 ) ( not ( = ?auto_292784 ?auto_292786 ) ) ( not ( = ?auto_292785 ?auto_292786 ) ) ( not ( = ?auto_292783 ?auto_292786 ) ) ( TRUCK-AT ?auto_292789 ?auto_292791 ) ( SURFACE-AT ?auto_292783 ?auto_292791 ) ( CLEAR ?auto_292783 ) ( IS-CRATE ?auto_292784 ) ( AVAILABLE ?auto_292790 ) ( IN ?auto_292784 ?auto_292789 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292784 ?auto_292785 )
      ( MAKE-2CRATE-VERIFY ?auto_292783 ?auto_292784 ?auto_292785 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292828 - SURFACE
      ?auto_292829 - SURFACE
    )
    :vars
    (
      ?auto_292836 - HOIST
      ?auto_292832 - PLACE
      ?auto_292833 - SURFACE
      ?auto_292831 - PLACE
      ?auto_292834 - HOIST
      ?auto_292830 - SURFACE
      ?auto_292835 - TRUCK
      ?auto_292837 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292836 ?auto_292832 ) ( SURFACE-AT ?auto_292828 ?auto_292832 ) ( CLEAR ?auto_292828 ) ( IS-CRATE ?auto_292829 ) ( not ( = ?auto_292828 ?auto_292829 ) ) ( AVAILABLE ?auto_292836 ) ( ON ?auto_292828 ?auto_292833 ) ( not ( = ?auto_292833 ?auto_292828 ) ) ( not ( = ?auto_292833 ?auto_292829 ) ) ( not ( = ?auto_292831 ?auto_292832 ) ) ( HOIST-AT ?auto_292834 ?auto_292831 ) ( not ( = ?auto_292836 ?auto_292834 ) ) ( AVAILABLE ?auto_292834 ) ( SURFACE-AT ?auto_292829 ?auto_292831 ) ( ON ?auto_292829 ?auto_292830 ) ( CLEAR ?auto_292829 ) ( not ( = ?auto_292828 ?auto_292830 ) ) ( not ( = ?auto_292829 ?auto_292830 ) ) ( not ( = ?auto_292833 ?auto_292830 ) ) ( TRUCK-AT ?auto_292835 ?auto_292837 ) ( not ( = ?auto_292837 ?auto_292832 ) ) ( not ( = ?auto_292831 ?auto_292837 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_292835 ?auto_292837 ?auto_292832 )
      ( MAKE-1CRATE ?auto_292828 ?auto_292829 )
      ( MAKE-1CRATE-VERIFY ?auto_292828 ?auto_292829 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292868 - SURFACE
      ?auto_292869 - SURFACE
      ?auto_292870 - SURFACE
      ?auto_292867 - SURFACE
    )
    :vars
    (
      ?auto_292871 - HOIST
      ?auto_292872 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292871 ?auto_292872 ) ( SURFACE-AT ?auto_292870 ?auto_292872 ) ( CLEAR ?auto_292870 ) ( LIFTING ?auto_292871 ?auto_292867 ) ( IS-CRATE ?auto_292867 ) ( not ( = ?auto_292870 ?auto_292867 ) ) ( ON ?auto_292869 ?auto_292868 ) ( ON ?auto_292870 ?auto_292869 ) ( not ( = ?auto_292868 ?auto_292869 ) ) ( not ( = ?auto_292868 ?auto_292870 ) ) ( not ( = ?auto_292868 ?auto_292867 ) ) ( not ( = ?auto_292869 ?auto_292870 ) ) ( not ( = ?auto_292869 ?auto_292867 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292870 ?auto_292867 )
      ( MAKE-3CRATE-VERIFY ?auto_292868 ?auto_292869 ?auto_292870 ?auto_292867 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292885 - SURFACE
      ?auto_292886 - SURFACE
      ?auto_292887 - SURFACE
      ?auto_292884 - SURFACE
    )
    :vars
    (
      ?auto_292888 - HOIST
      ?auto_292890 - PLACE
      ?auto_292889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292888 ?auto_292890 ) ( SURFACE-AT ?auto_292887 ?auto_292890 ) ( CLEAR ?auto_292887 ) ( IS-CRATE ?auto_292884 ) ( not ( = ?auto_292887 ?auto_292884 ) ) ( TRUCK-AT ?auto_292889 ?auto_292890 ) ( AVAILABLE ?auto_292888 ) ( IN ?auto_292884 ?auto_292889 ) ( ON ?auto_292887 ?auto_292886 ) ( not ( = ?auto_292886 ?auto_292887 ) ) ( not ( = ?auto_292886 ?auto_292884 ) ) ( ON ?auto_292886 ?auto_292885 ) ( not ( = ?auto_292885 ?auto_292886 ) ) ( not ( = ?auto_292885 ?auto_292887 ) ) ( not ( = ?auto_292885 ?auto_292884 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292886 ?auto_292887 ?auto_292884 )
      ( MAKE-3CRATE-VERIFY ?auto_292885 ?auto_292886 ?auto_292887 ?auto_292884 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292906 - SURFACE
      ?auto_292907 - SURFACE
      ?auto_292908 - SURFACE
      ?auto_292905 - SURFACE
    )
    :vars
    (
      ?auto_292911 - HOIST
      ?auto_292910 - PLACE
      ?auto_292909 - TRUCK
      ?auto_292912 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292911 ?auto_292910 ) ( SURFACE-AT ?auto_292908 ?auto_292910 ) ( CLEAR ?auto_292908 ) ( IS-CRATE ?auto_292905 ) ( not ( = ?auto_292908 ?auto_292905 ) ) ( AVAILABLE ?auto_292911 ) ( IN ?auto_292905 ?auto_292909 ) ( ON ?auto_292908 ?auto_292907 ) ( not ( = ?auto_292907 ?auto_292908 ) ) ( not ( = ?auto_292907 ?auto_292905 ) ) ( TRUCK-AT ?auto_292909 ?auto_292912 ) ( not ( = ?auto_292912 ?auto_292910 ) ) ( ON ?auto_292907 ?auto_292906 ) ( not ( = ?auto_292906 ?auto_292907 ) ) ( not ( = ?auto_292906 ?auto_292908 ) ) ( not ( = ?auto_292906 ?auto_292905 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292907 ?auto_292908 ?auto_292905 )
      ( MAKE-3CRATE-VERIFY ?auto_292906 ?auto_292907 ?auto_292908 ?auto_292905 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292930 - SURFACE
      ?auto_292931 - SURFACE
      ?auto_292932 - SURFACE
      ?auto_292929 - SURFACE
    )
    :vars
    (
      ?auto_292933 - HOIST
      ?auto_292936 - PLACE
      ?auto_292934 - TRUCK
      ?auto_292935 - PLACE
      ?auto_292937 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_292933 ?auto_292936 ) ( SURFACE-AT ?auto_292932 ?auto_292936 ) ( CLEAR ?auto_292932 ) ( IS-CRATE ?auto_292929 ) ( not ( = ?auto_292932 ?auto_292929 ) ) ( AVAILABLE ?auto_292933 ) ( ON ?auto_292932 ?auto_292931 ) ( not ( = ?auto_292931 ?auto_292932 ) ) ( not ( = ?auto_292931 ?auto_292929 ) ) ( TRUCK-AT ?auto_292934 ?auto_292935 ) ( not ( = ?auto_292935 ?auto_292936 ) ) ( HOIST-AT ?auto_292937 ?auto_292935 ) ( LIFTING ?auto_292937 ?auto_292929 ) ( not ( = ?auto_292933 ?auto_292937 ) ) ( ON ?auto_292931 ?auto_292930 ) ( not ( = ?auto_292930 ?auto_292931 ) ) ( not ( = ?auto_292930 ?auto_292932 ) ) ( not ( = ?auto_292930 ?auto_292929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292931 ?auto_292932 ?auto_292929 )
      ( MAKE-3CRATE-VERIFY ?auto_292930 ?auto_292931 ?auto_292932 ?auto_292929 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292957 - SURFACE
      ?auto_292958 - SURFACE
      ?auto_292959 - SURFACE
      ?auto_292956 - SURFACE
    )
    :vars
    (
      ?auto_292962 - HOIST
      ?auto_292963 - PLACE
      ?auto_292964 - TRUCK
      ?auto_292961 - PLACE
      ?auto_292960 - HOIST
      ?auto_292965 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292962 ?auto_292963 ) ( SURFACE-AT ?auto_292959 ?auto_292963 ) ( CLEAR ?auto_292959 ) ( IS-CRATE ?auto_292956 ) ( not ( = ?auto_292959 ?auto_292956 ) ) ( AVAILABLE ?auto_292962 ) ( ON ?auto_292959 ?auto_292958 ) ( not ( = ?auto_292958 ?auto_292959 ) ) ( not ( = ?auto_292958 ?auto_292956 ) ) ( TRUCK-AT ?auto_292964 ?auto_292961 ) ( not ( = ?auto_292961 ?auto_292963 ) ) ( HOIST-AT ?auto_292960 ?auto_292961 ) ( not ( = ?auto_292962 ?auto_292960 ) ) ( AVAILABLE ?auto_292960 ) ( SURFACE-AT ?auto_292956 ?auto_292961 ) ( ON ?auto_292956 ?auto_292965 ) ( CLEAR ?auto_292956 ) ( not ( = ?auto_292959 ?auto_292965 ) ) ( not ( = ?auto_292956 ?auto_292965 ) ) ( not ( = ?auto_292958 ?auto_292965 ) ) ( ON ?auto_292958 ?auto_292957 ) ( not ( = ?auto_292957 ?auto_292958 ) ) ( not ( = ?auto_292957 ?auto_292959 ) ) ( not ( = ?auto_292957 ?auto_292956 ) ) ( not ( = ?auto_292957 ?auto_292965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292958 ?auto_292959 ?auto_292956 )
      ( MAKE-3CRATE-VERIFY ?auto_292957 ?auto_292958 ?auto_292959 ?auto_292956 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292985 - SURFACE
      ?auto_292986 - SURFACE
      ?auto_292987 - SURFACE
      ?auto_292984 - SURFACE
    )
    :vars
    (
      ?auto_292990 - HOIST
      ?auto_292992 - PLACE
      ?auto_292991 - PLACE
      ?auto_292989 - HOIST
      ?auto_292988 - SURFACE
      ?auto_292993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292990 ?auto_292992 ) ( SURFACE-AT ?auto_292987 ?auto_292992 ) ( CLEAR ?auto_292987 ) ( IS-CRATE ?auto_292984 ) ( not ( = ?auto_292987 ?auto_292984 ) ) ( AVAILABLE ?auto_292990 ) ( ON ?auto_292987 ?auto_292986 ) ( not ( = ?auto_292986 ?auto_292987 ) ) ( not ( = ?auto_292986 ?auto_292984 ) ) ( not ( = ?auto_292991 ?auto_292992 ) ) ( HOIST-AT ?auto_292989 ?auto_292991 ) ( not ( = ?auto_292990 ?auto_292989 ) ) ( AVAILABLE ?auto_292989 ) ( SURFACE-AT ?auto_292984 ?auto_292991 ) ( ON ?auto_292984 ?auto_292988 ) ( CLEAR ?auto_292984 ) ( not ( = ?auto_292987 ?auto_292988 ) ) ( not ( = ?auto_292984 ?auto_292988 ) ) ( not ( = ?auto_292986 ?auto_292988 ) ) ( TRUCK-AT ?auto_292993 ?auto_292992 ) ( ON ?auto_292986 ?auto_292985 ) ( not ( = ?auto_292985 ?auto_292986 ) ) ( not ( = ?auto_292985 ?auto_292987 ) ) ( not ( = ?auto_292985 ?auto_292984 ) ) ( not ( = ?auto_292985 ?auto_292988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292986 ?auto_292987 ?auto_292984 )
      ( MAKE-3CRATE-VERIFY ?auto_292985 ?auto_292986 ?auto_292987 ?auto_292984 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_293013 - SURFACE
      ?auto_293014 - SURFACE
      ?auto_293015 - SURFACE
      ?auto_293012 - SURFACE
    )
    :vars
    (
      ?auto_293016 - HOIST
      ?auto_293020 - PLACE
      ?auto_293019 - PLACE
      ?auto_293018 - HOIST
      ?auto_293021 - SURFACE
      ?auto_293017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_293016 ?auto_293020 ) ( IS-CRATE ?auto_293012 ) ( not ( = ?auto_293015 ?auto_293012 ) ) ( not ( = ?auto_293014 ?auto_293015 ) ) ( not ( = ?auto_293014 ?auto_293012 ) ) ( not ( = ?auto_293019 ?auto_293020 ) ) ( HOIST-AT ?auto_293018 ?auto_293019 ) ( not ( = ?auto_293016 ?auto_293018 ) ) ( AVAILABLE ?auto_293018 ) ( SURFACE-AT ?auto_293012 ?auto_293019 ) ( ON ?auto_293012 ?auto_293021 ) ( CLEAR ?auto_293012 ) ( not ( = ?auto_293015 ?auto_293021 ) ) ( not ( = ?auto_293012 ?auto_293021 ) ) ( not ( = ?auto_293014 ?auto_293021 ) ) ( TRUCK-AT ?auto_293017 ?auto_293020 ) ( SURFACE-AT ?auto_293014 ?auto_293020 ) ( CLEAR ?auto_293014 ) ( LIFTING ?auto_293016 ?auto_293015 ) ( IS-CRATE ?auto_293015 ) ( ON ?auto_293014 ?auto_293013 ) ( not ( = ?auto_293013 ?auto_293014 ) ) ( not ( = ?auto_293013 ?auto_293015 ) ) ( not ( = ?auto_293013 ?auto_293012 ) ) ( not ( = ?auto_293013 ?auto_293021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293014 ?auto_293015 ?auto_293012 )
      ( MAKE-3CRATE-VERIFY ?auto_293013 ?auto_293014 ?auto_293015 ?auto_293012 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_293041 - SURFACE
      ?auto_293042 - SURFACE
      ?auto_293043 - SURFACE
      ?auto_293040 - SURFACE
    )
    :vars
    (
      ?auto_293049 - HOIST
      ?auto_293048 - PLACE
      ?auto_293047 - PLACE
      ?auto_293046 - HOIST
      ?auto_293044 - SURFACE
      ?auto_293045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_293049 ?auto_293048 ) ( IS-CRATE ?auto_293040 ) ( not ( = ?auto_293043 ?auto_293040 ) ) ( not ( = ?auto_293042 ?auto_293043 ) ) ( not ( = ?auto_293042 ?auto_293040 ) ) ( not ( = ?auto_293047 ?auto_293048 ) ) ( HOIST-AT ?auto_293046 ?auto_293047 ) ( not ( = ?auto_293049 ?auto_293046 ) ) ( AVAILABLE ?auto_293046 ) ( SURFACE-AT ?auto_293040 ?auto_293047 ) ( ON ?auto_293040 ?auto_293044 ) ( CLEAR ?auto_293040 ) ( not ( = ?auto_293043 ?auto_293044 ) ) ( not ( = ?auto_293040 ?auto_293044 ) ) ( not ( = ?auto_293042 ?auto_293044 ) ) ( TRUCK-AT ?auto_293045 ?auto_293048 ) ( SURFACE-AT ?auto_293042 ?auto_293048 ) ( CLEAR ?auto_293042 ) ( IS-CRATE ?auto_293043 ) ( AVAILABLE ?auto_293049 ) ( IN ?auto_293043 ?auto_293045 ) ( ON ?auto_293042 ?auto_293041 ) ( not ( = ?auto_293041 ?auto_293042 ) ) ( not ( = ?auto_293041 ?auto_293043 ) ) ( not ( = ?auto_293041 ?auto_293040 ) ) ( not ( = ?auto_293041 ?auto_293044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293042 ?auto_293043 ?auto_293040 )
      ( MAKE-3CRATE-VERIFY ?auto_293041 ?auto_293042 ?auto_293043 ?auto_293040 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_293332 - SURFACE
      ?auto_293333 - SURFACE
      ?auto_293334 - SURFACE
      ?auto_293331 - SURFACE
      ?auto_293335 - SURFACE
    )
    :vars
    (
      ?auto_293336 - HOIST
      ?auto_293337 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_293336 ?auto_293337 ) ( SURFACE-AT ?auto_293331 ?auto_293337 ) ( CLEAR ?auto_293331 ) ( LIFTING ?auto_293336 ?auto_293335 ) ( IS-CRATE ?auto_293335 ) ( not ( = ?auto_293331 ?auto_293335 ) ) ( ON ?auto_293333 ?auto_293332 ) ( ON ?auto_293334 ?auto_293333 ) ( ON ?auto_293331 ?auto_293334 ) ( not ( = ?auto_293332 ?auto_293333 ) ) ( not ( = ?auto_293332 ?auto_293334 ) ) ( not ( = ?auto_293332 ?auto_293331 ) ) ( not ( = ?auto_293332 ?auto_293335 ) ) ( not ( = ?auto_293333 ?auto_293334 ) ) ( not ( = ?auto_293333 ?auto_293331 ) ) ( not ( = ?auto_293333 ?auto_293335 ) ) ( not ( = ?auto_293334 ?auto_293331 ) ) ( not ( = ?auto_293334 ?auto_293335 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_293331 ?auto_293335 )
      ( MAKE-4CRATE-VERIFY ?auto_293332 ?auto_293333 ?auto_293334 ?auto_293331 ?auto_293335 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_293357 - SURFACE
      ?auto_293358 - SURFACE
      ?auto_293359 - SURFACE
      ?auto_293356 - SURFACE
      ?auto_293360 - SURFACE
    )
    :vars
    (
      ?auto_293362 - HOIST
      ?auto_293361 - PLACE
      ?auto_293363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_293362 ?auto_293361 ) ( SURFACE-AT ?auto_293356 ?auto_293361 ) ( CLEAR ?auto_293356 ) ( IS-CRATE ?auto_293360 ) ( not ( = ?auto_293356 ?auto_293360 ) ) ( TRUCK-AT ?auto_293363 ?auto_293361 ) ( AVAILABLE ?auto_293362 ) ( IN ?auto_293360 ?auto_293363 ) ( ON ?auto_293356 ?auto_293359 ) ( not ( = ?auto_293359 ?auto_293356 ) ) ( not ( = ?auto_293359 ?auto_293360 ) ) ( ON ?auto_293358 ?auto_293357 ) ( ON ?auto_293359 ?auto_293358 ) ( not ( = ?auto_293357 ?auto_293358 ) ) ( not ( = ?auto_293357 ?auto_293359 ) ) ( not ( = ?auto_293357 ?auto_293356 ) ) ( not ( = ?auto_293357 ?auto_293360 ) ) ( not ( = ?auto_293358 ?auto_293359 ) ) ( not ( = ?auto_293358 ?auto_293356 ) ) ( not ( = ?auto_293358 ?auto_293360 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293359 ?auto_293356 ?auto_293360 )
      ( MAKE-4CRATE-VERIFY ?auto_293357 ?auto_293358 ?auto_293359 ?auto_293356 ?auto_293360 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_293387 - SURFACE
      ?auto_293388 - SURFACE
      ?auto_293389 - SURFACE
      ?auto_293386 - SURFACE
      ?auto_293390 - SURFACE
    )
    :vars
    (
      ?auto_293391 - HOIST
      ?auto_293394 - PLACE
      ?auto_293392 - TRUCK
      ?auto_293393 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_293391 ?auto_293394 ) ( SURFACE-AT ?auto_293386 ?auto_293394 ) ( CLEAR ?auto_293386 ) ( IS-CRATE ?auto_293390 ) ( not ( = ?auto_293386 ?auto_293390 ) ) ( AVAILABLE ?auto_293391 ) ( IN ?auto_293390 ?auto_293392 ) ( ON ?auto_293386 ?auto_293389 ) ( not ( = ?auto_293389 ?auto_293386 ) ) ( not ( = ?auto_293389 ?auto_293390 ) ) ( TRUCK-AT ?auto_293392 ?auto_293393 ) ( not ( = ?auto_293393 ?auto_293394 ) ) ( ON ?auto_293388 ?auto_293387 ) ( ON ?auto_293389 ?auto_293388 ) ( not ( = ?auto_293387 ?auto_293388 ) ) ( not ( = ?auto_293387 ?auto_293389 ) ) ( not ( = ?auto_293387 ?auto_293386 ) ) ( not ( = ?auto_293387 ?auto_293390 ) ) ( not ( = ?auto_293388 ?auto_293389 ) ) ( not ( = ?auto_293388 ?auto_293386 ) ) ( not ( = ?auto_293388 ?auto_293390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293389 ?auto_293386 ?auto_293390 )
      ( MAKE-4CRATE-VERIFY ?auto_293387 ?auto_293388 ?auto_293389 ?auto_293386 ?auto_293390 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_293421 - SURFACE
      ?auto_293422 - SURFACE
      ?auto_293423 - SURFACE
      ?auto_293420 - SURFACE
      ?auto_293424 - SURFACE
    )
    :vars
    (
      ?auto_293428 - HOIST
      ?auto_293426 - PLACE
      ?auto_293425 - TRUCK
      ?auto_293427 - PLACE
      ?auto_293429 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_293428 ?auto_293426 ) ( SURFACE-AT ?auto_293420 ?auto_293426 ) ( CLEAR ?auto_293420 ) ( IS-CRATE ?auto_293424 ) ( not ( = ?auto_293420 ?auto_293424 ) ) ( AVAILABLE ?auto_293428 ) ( ON ?auto_293420 ?auto_293423 ) ( not ( = ?auto_293423 ?auto_293420 ) ) ( not ( = ?auto_293423 ?auto_293424 ) ) ( TRUCK-AT ?auto_293425 ?auto_293427 ) ( not ( = ?auto_293427 ?auto_293426 ) ) ( HOIST-AT ?auto_293429 ?auto_293427 ) ( LIFTING ?auto_293429 ?auto_293424 ) ( not ( = ?auto_293428 ?auto_293429 ) ) ( ON ?auto_293422 ?auto_293421 ) ( ON ?auto_293423 ?auto_293422 ) ( not ( = ?auto_293421 ?auto_293422 ) ) ( not ( = ?auto_293421 ?auto_293423 ) ) ( not ( = ?auto_293421 ?auto_293420 ) ) ( not ( = ?auto_293421 ?auto_293424 ) ) ( not ( = ?auto_293422 ?auto_293423 ) ) ( not ( = ?auto_293422 ?auto_293420 ) ) ( not ( = ?auto_293422 ?auto_293424 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293423 ?auto_293420 ?auto_293424 )
      ( MAKE-4CRATE-VERIFY ?auto_293421 ?auto_293422 ?auto_293423 ?auto_293420 ?auto_293424 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_293459 - SURFACE
      ?auto_293460 - SURFACE
      ?auto_293461 - SURFACE
      ?auto_293458 - SURFACE
      ?auto_293462 - SURFACE
    )
    :vars
    (
      ?auto_293463 - HOIST
      ?auto_293465 - PLACE
      ?auto_293464 - TRUCK
      ?auto_293467 - PLACE
      ?auto_293466 - HOIST
      ?auto_293468 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_293463 ?auto_293465 ) ( SURFACE-AT ?auto_293458 ?auto_293465 ) ( CLEAR ?auto_293458 ) ( IS-CRATE ?auto_293462 ) ( not ( = ?auto_293458 ?auto_293462 ) ) ( AVAILABLE ?auto_293463 ) ( ON ?auto_293458 ?auto_293461 ) ( not ( = ?auto_293461 ?auto_293458 ) ) ( not ( = ?auto_293461 ?auto_293462 ) ) ( TRUCK-AT ?auto_293464 ?auto_293467 ) ( not ( = ?auto_293467 ?auto_293465 ) ) ( HOIST-AT ?auto_293466 ?auto_293467 ) ( not ( = ?auto_293463 ?auto_293466 ) ) ( AVAILABLE ?auto_293466 ) ( SURFACE-AT ?auto_293462 ?auto_293467 ) ( ON ?auto_293462 ?auto_293468 ) ( CLEAR ?auto_293462 ) ( not ( = ?auto_293458 ?auto_293468 ) ) ( not ( = ?auto_293462 ?auto_293468 ) ) ( not ( = ?auto_293461 ?auto_293468 ) ) ( ON ?auto_293460 ?auto_293459 ) ( ON ?auto_293461 ?auto_293460 ) ( not ( = ?auto_293459 ?auto_293460 ) ) ( not ( = ?auto_293459 ?auto_293461 ) ) ( not ( = ?auto_293459 ?auto_293458 ) ) ( not ( = ?auto_293459 ?auto_293462 ) ) ( not ( = ?auto_293459 ?auto_293468 ) ) ( not ( = ?auto_293460 ?auto_293461 ) ) ( not ( = ?auto_293460 ?auto_293458 ) ) ( not ( = ?auto_293460 ?auto_293462 ) ) ( not ( = ?auto_293460 ?auto_293468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293461 ?auto_293458 ?auto_293462 )
      ( MAKE-4CRATE-VERIFY ?auto_293459 ?auto_293460 ?auto_293461 ?auto_293458 ?auto_293462 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_293498 - SURFACE
      ?auto_293499 - SURFACE
      ?auto_293500 - SURFACE
      ?auto_293497 - SURFACE
      ?auto_293501 - SURFACE
    )
    :vars
    (
      ?auto_293504 - HOIST
      ?auto_293505 - PLACE
      ?auto_293506 - PLACE
      ?auto_293507 - HOIST
      ?auto_293502 - SURFACE
      ?auto_293503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_293504 ?auto_293505 ) ( SURFACE-AT ?auto_293497 ?auto_293505 ) ( CLEAR ?auto_293497 ) ( IS-CRATE ?auto_293501 ) ( not ( = ?auto_293497 ?auto_293501 ) ) ( AVAILABLE ?auto_293504 ) ( ON ?auto_293497 ?auto_293500 ) ( not ( = ?auto_293500 ?auto_293497 ) ) ( not ( = ?auto_293500 ?auto_293501 ) ) ( not ( = ?auto_293506 ?auto_293505 ) ) ( HOIST-AT ?auto_293507 ?auto_293506 ) ( not ( = ?auto_293504 ?auto_293507 ) ) ( AVAILABLE ?auto_293507 ) ( SURFACE-AT ?auto_293501 ?auto_293506 ) ( ON ?auto_293501 ?auto_293502 ) ( CLEAR ?auto_293501 ) ( not ( = ?auto_293497 ?auto_293502 ) ) ( not ( = ?auto_293501 ?auto_293502 ) ) ( not ( = ?auto_293500 ?auto_293502 ) ) ( TRUCK-AT ?auto_293503 ?auto_293505 ) ( ON ?auto_293499 ?auto_293498 ) ( ON ?auto_293500 ?auto_293499 ) ( not ( = ?auto_293498 ?auto_293499 ) ) ( not ( = ?auto_293498 ?auto_293500 ) ) ( not ( = ?auto_293498 ?auto_293497 ) ) ( not ( = ?auto_293498 ?auto_293501 ) ) ( not ( = ?auto_293498 ?auto_293502 ) ) ( not ( = ?auto_293499 ?auto_293500 ) ) ( not ( = ?auto_293499 ?auto_293497 ) ) ( not ( = ?auto_293499 ?auto_293501 ) ) ( not ( = ?auto_293499 ?auto_293502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293500 ?auto_293497 ?auto_293501 )
      ( MAKE-4CRATE-VERIFY ?auto_293498 ?auto_293499 ?auto_293500 ?auto_293497 ?auto_293501 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_293537 - SURFACE
      ?auto_293538 - SURFACE
      ?auto_293539 - SURFACE
      ?auto_293536 - SURFACE
      ?auto_293540 - SURFACE
    )
    :vars
    (
      ?auto_293545 - HOIST
      ?auto_293544 - PLACE
      ?auto_293543 - PLACE
      ?auto_293546 - HOIST
      ?auto_293542 - SURFACE
      ?auto_293541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_293545 ?auto_293544 ) ( IS-CRATE ?auto_293540 ) ( not ( = ?auto_293536 ?auto_293540 ) ) ( not ( = ?auto_293539 ?auto_293536 ) ) ( not ( = ?auto_293539 ?auto_293540 ) ) ( not ( = ?auto_293543 ?auto_293544 ) ) ( HOIST-AT ?auto_293546 ?auto_293543 ) ( not ( = ?auto_293545 ?auto_293546 ) ) ( AVAILABLE ?auto_293546 ) ( SURFACE-AT ?auto_293540 ?auto_293543 ) ( ON ?auto_293540 ?auto_293542 ) ( CLEAR ?auto_293540 ) ( not ( = ?auto_293536 ?auto_293542 ) ) ( not ( = ?auto_293540 ?auto_293542 ) ) ( not ( = ?auto_293539 ?auto_293542 ) ) ( TRUCK-AT ?auto_293541 ?auto_293544 ) ( SURFACE-AT ?auto_293539 ?auto_293544 ) ( CLEAR ?auto_293539 ) ( LIFTING ?auto_293545 ?auto_293536 ) ( IS-CRATE ?auto_293536 ) ( ON ?auto_293538 ?auto_293537 ) ( ON ?auto_293539 ?auto_293538 ) ( not ( = ?auto_293537 ?auto_293538 ) ) ( not ( = ?auto_293537 ?auto_293539 ) ) ( not ( = ?auto_293537 ?auto_293536 ) ) ( not ( = ?auto_293537 ?auto_293540 ) ) ( not ( = ?auto_293537 ?auto_293542 ) ) ( not ( = ?auto_293538 ?auto_293539 ) ) ( not ( = ?auto_293538 ?auto_293536 ) ) ( not ( = ?auto_293538 ?auto_293540 ) ) ( not ( = ?auto_293538 ?auto_293542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293539 ?auto_293536 ?auto_293540 )
      ( MAKE-4CRATE-VERIFY ?auto_293537 ?auto_293538 ?auto_293539 ?auto_293536 ?auto_293540 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_293576 - SURFACE
      ?auto_293577 - SURFACE
      ?auto_293578 - SURFACE
      ?auto_293575 - SURFACE
      ?auto_293579 - SURFACE
    )
    :vars
    (
      ?auto_293585 - HOIST
      ?auto_293582 - PLACE
      ?auto_293581 - PLACE
      ?auto_293580 - HOIST
      ?auto_293584 - SURFACE
      ?auto_293583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_293585 ?auto_293582 ) ( IS-CRATE ?auto_293579 ) ( not ( = ?auto_293575 ?auto_293579 ) ) ( not ( = ?auto_293578 ?auto_293575 ) ) ( not ( = ?auto_293578 ?auto_293579 ) ) ( not ( = ?auto_293581 ?auto_293582 ) ) ( HOIST-AT ?auto_293580 ?auto_293581 ) ( not ( = ?auto_293585 ?auto_293580 ) ) ( AVAILABLE ?auto_293580 ) ( SURFACE-AT ?auto_293579 ?auto_293581 ) ( ON ?auto_293579 ?auto_293584 ) ( CLEAR ?auto_293579 ) ( not ( = ?auto_293575 ?auto_293584 ) ) ( not ( = ?auto_293579 ?auto_293584 ) ) ( not ( = ?auto_293578 ?auto_293584 ) ) ( TRUCK-AT ?auto_293583 ?auto_293582 ) ( SURFACE-AT ?auto_293578 ?auto_293582 ) ( CLEAR ?auto_293578 ) ( IS-CRATE ?auto_293575 ) ( AVAILABLE ?auto_293585 ) ( IN ?auto_293575 ?auto_293583 ) ( ON ?auto_293577 ?auto_293576 ) ( ON ?auto_293578 ?auto_293577 ) ( not ( = ?auto_293576 ?auto_293577 ) ) ( not ( = ?auto_293576 ?auto_293578 ) ) ( not ( = ?auto_293576 ?auto_293575 ) ) ( not ( = ?auto_293576 ?auto_293579 ) ) ( not ( = ?auto_293576 ?auto_293584 ) ) ( not ( = ?auto_293577 ?auto_293578 ) ) ( not ( = ?auto_293577 ?auto_293575 ) ) ( not ( = ?auto_293577 ?auto_293579 ) ) ( not ( = ?auto_293577 ?auto_293584 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293578 ?auto_293575 ?auto_293579 )
      ( MAKE-4CRATE-VERIFY ?auto_293576 ?auto_293577 ?auto_293578 ?auto_293575 ?auto_293579 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_294236 - SURFACE
      ?auto_294237 - SURFACE
      ?auto_294238 - SURFACE
      ?auto_294235 - SURFACE
      ?auto_294239 - SURFACE
      ?auto_294240 - SURFACE
    )
    :vars
    (
      ?auto_294241 - HOIST
      ?auto_294242 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_294241 ?auto_294242 ) ( SURFACE-AT ?auto_294239 ?auto_294242 ) ( CLEAR ?auto_294239 ) ( LIFTING ?auto_294241 ?auto_294240 ) ( IS-CRATE ?auto_294240 ) ( not ( = ?auto_294239 ?auto_294240 ) ) ( ON ?auto_294237 ?auto_294236 ) ( ON ?auto_294238 ?auto_294237 ) ( ON ?auto_294235 ?auto_294238 ) ( ON ?auto_294239 ?auto_294235 ) ( not ( = ?auto_294236 ?auto_294237 ) ) ( not ( = ?auto_294236 ?auto_294238 ) ) ( not ( = ?auto_294236 ?auto_294235 ) ) ( not ( = ?auto_294236 ?auto_294239 ) ) ( not ( = ?auto_294236 ?auto_294240 ) ) ( not ( = ?auto_294237 ?auto_294238 ) ) ( not ( = ?auto_294237 ?auto_294235 ) ) ( not ( = ?auto_294237 ?auto_294239 ) ) ( not ( = ?auto_294237 ?auto_294240 ) ) ( not ( = ?auto_294238 ?auto_294235 ) ) ( not ( = ?auto_294238 ?auto_294239 ) ) ( not ( = ?auto_294238 ?auto_294240 ) ) ( not ( = ?auto_294235 ?auto_294239 ) ) ( not ( = ?auto_294235 ?auto_294240 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_294239 ?auto_294240 )
      ( MAKE-5CRATE-VERIFY ?auto_294236 ?auto_294237 ?auto_294238 ?auto_294235 ?auto_294239 ?auto_294240 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_294270 - SURFACE
      ?auto_294271 - SURFACE
      ?auto_294272 - SURFACE
      ?auto_294269 - SURFACE
      ?auto_294273 - SURFACE
      ?auto_294274 - SURFACE
    )
    :vars
    (
      ?auto_294275 - HOIST
      ?auto_294276 - PLACE
      ?auto_294277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_294275 ?auto_294276 ) ( SURFACE-AT ?auto_294273 ?auto_294276 ) ( CLEAR ?auto_294273 ) ( IS-CRATE ?auto_294274 ) ( not ( = ?auto_294273 ?auto_294274 ) ) ( TRUCK-AT ?auto_294277 ?auto_294276 ) ( AVAILABLE ?auto_294275 ) ( IN ?auto_294274 ?auto_294277 ) ( ON ?auto_294273 ?auto_294269 ) ( not ( = ?auto_294269 ?auto_294273 ) ) ( not ( = ?auto_294269 ?auto_294274 ) ) ( ON ?auto_294271 ?auto_294270 ) ( ON ?auto_294272 ?auto_294271 ) ( ON ?auto_294269 ?auto_294272 ) ( not ( = ?auto_294270 ?auto_294271 ) ) ( not ( = ?auto_294270 ?auto_294272 ) ) ( not ( = ?auto_294270 ?auto_294269 ) ) ( not ( = ?auto_294270 ?auto_294273 ) ) ( not ( = ?auto_294270 ?auto_294274 ) ) ( not ( = ?auto_294271 ?auto_294272 ) ) ( not ( = ?auto_294271 ?auto_294269 ) ) ( not ( = ?auto_294271 ?auto_294273 ) ) ( not ( = ?auto_294271 ?auto_294274 ) ) ( not ( = ?auto_294272 ?auto_294269 ) ) ( not ( = ?auto_294272 ?auto_294273 ) ) ( not ( = ?auto_294272 ?auto_294274 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_294269 ?auto_294273 ?auto_294274 )
      ( MAKE-5CRATE-VERIFY ?auto_294270 ?auto_294271 ?auto_294272 ?auto_294269 ?auto_294273 ?auto_294274 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_294310 - SURFACE
      ?auto_294311 - SURFACE
      ?auto_294312 - SURFACE
      ?auto_294309 - SURFACE
      ?auto_294313 - SURFACE
      ?auto_294314 - SURFACE
    )
    :vars
    (
      ?auto_294318 - HOIST
      ?auto_294317 - PLACE
      ?auto_294316 - TRUCK
      ?auto_294315 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_294318 ?auto_294317 ) ( SURFACE-AT ?auto_294313 ?auto_294317 ) ( CLEAR ?auto_294313 ) ( IS-CRATE ?auto_294314 ) ( not ( = ?auto_294313 ?auto_294314 ) ) ( AVAILABLE ?auto_294318 ) ( IN ?auto_294314 ?auto_294316 ) ( ON ?auto_294313 ?auto_294309 ) ( not ( = ?auto_294309 ?auto_294313 ) ) ( not ( = ?auto_294309 ?auto_294314 ) ) ( TRUCK-AT ?auto_294316 ?auto_294315 ) ( not ( = ?auto_294315 ?auto_294317 ) ) ( ON ?auto_294311 ?auto_294310 ) ( ON ?auto_294312 ?auto_294311 ) ( ON ?auto_294309 ?auto_294312 ) ( not ( = ?auto_294310 ?auto_294311 ) ) ( not ( = ?auto_294310 ?auto_294312 ) ) ( not ( = ?auto_294310 ?auto_294309 ) ) ( not ( = ?auto_294310 ?auto_294313 ) ) ( not ( = ?auto_294310 ?auto_294314 ) ) ( not ( = ?auto_294311 ?auto_294312 ) ) ( not ( = ?auto_294311 ?auto_294309 ) ) ( not ( = ?auto_294311 ?auto_294313 ) ) ( not ( = ?auto_294311 ?auto_294314 ) ) ( not ( = ?auto_294312 ?auto_294309 ) ) ( not ( = ?auto_294312 ?auto_294313 ) ) ( not ( = ?auto_294312 ?auto_294314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_294309 ?auto_294313 ?auto_294314 )
      ( MAKE-5CRATE-VERIFY ?auto_294310 ?auto_294311 ?auto_294312 ?auto_294309 ?auto_294313 ?auto_294314 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_294355 - SURFACE
      ?auto_294356 - SURFACE
      ?auto_294357 - SURFACE
      ?auto_294354 - SURFACE
      ?auto_294358 - SURFACE
      ?auto_294359 - SURFACE
    )
    :vars
    (
      ?auto_294363 - HOIST
      ?auto_294361 - PLACE
      ?auto_294364 - TRUCK
      ?auto_294360 - PLACE
      ?auto_294362 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_294363 ?auto_294361 ) ( SURFACE-AT ?auto_294358 ?auto_294361 ) ( CLEAR ?auto_294358 ) ( IS-CRATE ?auto_294359 ) ( not ( = ?auto_294358 ?auto_294359 ) ) ( AVAILABLE ?auto_294363 ) ( ON ?auto_294358 ?auto_294354 ) ( not ( = ?auto_294354 ?auto_294358 ) ) ( not ( = ?auto_294354 ?auto_294359 ) ) ( TRUCK-AT ?auto_294364 ?auto_294360 ) ( not ( = ?auto_294360 ?auto_294361 ) ) ( HOIST-AT ?auto_294362 ?auto_294360 ) ( LIFTING ?auto_294362 ?auto_294359 ) ( not ( = ?auto_294363 ?auto_294362 ) ) ( ON ?auto_294356 ?auto_294355 ) ( ON ?auto_294357 ?auto_294356 ) ( ON ?auto_294354 ?auto_294357 ) ( not ( = ?auto_294355 ?auto_294356 ) ) ( not ( = ?auto_294355 ?auto_294357 ) ) ( not ( = ?auto_294355 ?auto_294354 ) ) ( not ( = ?auto_294355 ?auto_294358 ) ) ( not ( = ?auto_294355 ?auto_294359 ) ) ( not ( = ?auto_294356 ?auto_294357 ) ) ( not ( = ?auto_294356 ?auto_294354 ) ) ( not ( = ?auto_294356 ?auto_294358 ) ) ( not ( = ?auto_294356 ?auto_294359 ) ) ( not ( = ?auto_294357 ?auto_294354 ) ) ( not ( = ?auto_294357 ?auto_294358 ) ) ( not ( = ?auto_294357 ?auto_294359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_294354 ?auto_294358 ?auto_294359 )
      ( MAKE-5CRATE-VERIFY ?auto_294355 ?auto_294356 ?auto_294357 ?auto_294354 ?auto_294358 ?auto_294359 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_294405 - SURFACE
      ?auto_294406 - SURFACE
      ?auto_294407 - SURFACE
      ?auto_294404 - SURFACE
      ?auto_294408 - SURFACE
      ?auto_294409 - SURFACE
    )
    :vars
    (
      ?auto_294415 - HOIST
      ?auto_294410 - PLACE
      ?auto_294412 - TRUCK
      ?auto_294411 - PLACE
      ?auto_294413 - HOIST
      ?auto_294414 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_294415 ?auto_294410 ) ( SURFACE-AT ?auto_294408 ?auto_294410 ) ( CLEAR ?auto_294408 ) ( IS-CRATE ?auto_294409 ) ( not ( = ?auto_294408 ?auto_294409 ) ) ( AVAILABLE ?auto_294415 ) ( ON ?auto_294408 ?auto_294404 ) ( not ( = ?auto_294404 ?auto_294408 ) ) ( not ( = ?auto_294404 ?auto_294409 ) ) ( TRUCK-AT ?auto_294412 ?auto_294411 ) ( not ( = ?auto_294411 ?auto_294410 ) ) ( HOIST-AT ?auto_294413 ?auto_294411 ) ( not ( = ?auto_294415 ?auto_294413 ) ) ( AVAILABLE ?auto_294413 ) ( SURFACE-AT ?auto_294409 ?auto_294411 ) ( ON ?auto_294409 ?auto_294414 ) ( CLEAR ?auto_294409 ) ( not ( = ?auto_294408 ?auto_294414 ) ) ( not ( = ?auto_294409 ?auto_294414 ) ) ( not ( = ?auto_294404 ?auto_294414 ) ) ( ON ?auto_294406 ?auto_294405 ) ( ON ?auto_294407 ?auto_294406 ) ( ON ?auto_294404 ?auto_294407 ) ( not ( = ?auto_294405 ?auto_294406 ) ) ( not ( = ?auto_294405 ?auto_294407 ) ) ( not ( = ?auto_294405 ?auto_294404 ) ) ( not ( = ?auto_294405 ?auto_294408 ) ) ( not ( = ?auto_294405 ?auto_294409 ) ) ( not ( = ?auto_294405 ?auto_294414 ) ) ( not ( = ?auto_294406 ?auto_294407 ) ) ( not ( = ?auto_294406 ?auto_294404 ) ) ( not ( = ?auto_294406 ?auto_294408 ) ) ( not ( = ?auto_294406 ?auto_294409 ) ) ( not ( = ?auto_294406 ?auto_294414 ) ) ( not ( = ?auto_294407 ?auto_294404 ) ) ( not ( = ?auto_294407 ?auto_294408 ) ) ( not ( = ?auto_294407 ?auto_294409 ) ) ( not ( = ?auto_294407 ?auto_294414 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_294404 ?auto_294408 ?auto_294409 )
      ( MAKE-5CRATE-VERIFY ?auto_294405 ?auto_294406 ?auto_294407 ?auto_294404 ?auto_294408 ?auto_294409 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_294456 - SURFACE
      ?auto_294457 - SURFACE
      ?auto_294458 - SURFACE
      ?auto_294455 - SURFACE
      ?auto_294459 - SURFACE
      ?auto_294460 - SURFACE
    )
    :vars
    (
      ?auto_294465 - HOIST
      ?auto_294466 - PLACE
      ?auto_294463 - PLACE
      ?auto_294464 - HOIST
      ?auto_294462 - SURFACE
      ?auto_294461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_294465 ?auto_294466 ) ( SURFACE-AT ?auto_294459 ?auto_294466 ) ( CLEAR ?auto_294459 ) ( IS-CRATE ?auto_294460 ) ( not ( = ?auto_294459 ?auto_294460 ) ) ( AVAILABLE ?auto_294465 ) ( ON ?auto_294459 ?auto_294455 ) ( not ( = ?auto_294455 ?auto_294459 ) ) ( not ( = ?auto_294455 ?auto_294460 ) ) ( not ( = ?auto_294463 ?auto_294466 ) ) ( HOIST-AT ?auto_294464 ?auto_294463 ) ( not ( = ?auto_294465 ?auto_294464 ) ) ( AVAILABLE ?auto_294464 ) ( SURFACE-AT ?auto_294460 ?auto_294463 ) ( ON ?auto_294460 ?auto_294462 ) ( CLEAR ?auto_294460 ) ( not ( = ?auto_294459 ?auto_294462 ) ) ( not ( = ?auto_294460 ?auto_294462 ) ) ( not ( = ?auto_294455 ?auto_294462 ) ) ( TRUCK-AT ?auto_294461 ?auto_294466 ) ( ON ?auto_294457 ?auto_294456 ) ( ON ?auto_294458 ?auto_294457 ) ( ON ?auto_294455 ?auto_294458 ) ( not ( = ?auto_294456 ?auto_294457 ) ) ( not ( = ?auto_294456 ?auto_294458 ) ) ( not ( = ?auto_294456 ?auto_294455 ) ) ( not ( = ?auto_294456 ?auto_294459 ) ) ( not ( = ?auto_294456 ?auto_294460 ) ) ( not ( = ?auto_294456 ?auto_294462 ) ) ( not ( = ?auto_294457 ?auto_294458 ) ) ( not ( = ?auto_294457 ?auto_294455 ) ) ( not ( = ?auto_294457 ?auto_294459 ) ) ( not ( = ?auto_294457 ?auto_294460 ) ) ( not ( = ?auto_294457 ?auto_294462 ) ) ( not ( = ?auto_294458 ?auto_294455 ) ) ( not ( = ?auto_294458 ?auto_294459 ) ) ( not ( = ?auto_294458 ?auto_294460 ) ) ( not ( = ?auto_294458 ?auto_294462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_294455 ?auto_294459 ?auto_294460 )
      ( MAKE-5CRATE-VERIFY ?auto_294456 ?auto_294457 ?auto_294458 ?auto_294455 ?auto_294459 ?auto_294460 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_294507 - SURFACE
      ?auto_294508 - SURFACE
      ?auto_294509 - SURFACE
      ?auto_294506 - SURFACE
      ?auto_294510 - SURFACE
      ?auto_294511 - SURFACE
    )
    :vars
    (
      ?auto_294512 - HOIST
      ?auto_294516 - PLACE
      ?auto_294514 - PLACE
      ?auto_294515 - HOIST
      ?auto_294513 - SURFACE
      ?auto_294517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_294512 ?auto_294516 ) ( IS-CRATE ?auto_294511 ) ( not ( = ?auto_294510 ?auto_294511 ) ) ( not ( = ?auto_294506 ?auto_294510 ) ) ( not ( = ?auto_294506 ?auto_294511 ) ) ( not ( = ?auto_294514 ?auto_294516 ) ) ( HOIST-AT ?auto_294515 ?auto_294514 ) ( not ( = ?auto_294512 ?auto_294515 ) ) ( AVAILABLE ?auto_294515 ) ( SURFACE-AT ?auto_294511 ?auto_294514 ) ( ON ?auto_294511 ?auto_294513 ) ( CLEAR ?auto_294511 ) ( not ( = ?auto_294510 ?auto_294513 ) ) ( not ( = ?auto_294511 ?auto_294513 ) ) ( not ( = ?auto_294506 ?auto_294513 ) ) ( TRUCK-AT ?auto_294517 ?auto_294516 ) ( SURFACE-AT ?auto_294506 ?auto_294516 ) ( CLEAR ?auto_294506 ) ( LIFTING ?auto_294512 ?auto_294510 ) ( IS-CRATE ?auto_294510 ) ( ON ?auto_294508 ?auto_294507 ) ( ON ?auto_294509 ?auto_294508 ) ( ON ?auto_294506 ?auto_294509 ) ( not ( = ?auto_294507 ?auto_294508 ) ) ( not ( = ?auto_294507 ?auto_294509 ) ) ( not ( = ?auto_294507 ?auto_294506 ) ) ( not ( = ?auto_294507 ?auto_294510 ) ) ( not ( = ?auto_294507 ?auto_294511 ) ) ( not ( = ?auto_294507 ?auto_294513 ) ) ( not ( = ?auto_294508 ?auto_294509 ) ) ( not ( = ?auto_294508 ?auto_294506 ) ) ( not ( = ?auto_294508 ?auto_294510 ) ) ( not ( = ?auto_294508 ?auto_294511 ) ) ( not ( = ?auto_294508 ?auto_294513 ) ) ( not ( = ?auto_294509 ?auto_294506 ) ) ( not ( = ?auto_294509 ?auto_294510 ) ) ( not ( = ?auto_294509 ?auto_294511 ) ) ( not ( = ?auto_294509 ?auto_294513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_294506 ?auto_294510 ?auto_294511 )
      ( MAKE-5CRATE-VERIFY ?auto_294507 ?auto_294508 ?auto_294509 ?auto_294506 ?auto_294510 ?auto_294511 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_294558 - SURFACE
      ?auto_294559 - SURFACE
      ?auto_294560 - SURFACE
      ?auto_294557 - SURFACE
      ?auto_294561 - SURFACE
      ?auto_294562 - SURFACE
    )
    :vars
    (
      ?auto_294568 - HOIST
      ?auto_294566 - PLACE
      ?auto_294565 - PLACE
      ?auto_294563 - HOIST
      ?auto_294567 - SURFACE
      ?auto_294564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_294568 ?auto_294566 ) ( IS-CRATE ?auto_294562 ) ( not ( = ?auto_294561 ?auto_294562 ) ) ( not ( = ?auto_294557 ?auto_294561 ) ) ( not ( = ?auto_294557 ?auto_294562 ) ) ( not ( = ?auto_294565 ?auto_294566 ) ) ( HOIST-AT ?auto_294563 ?auto_294565 ) ( not ( = ?auto_294568 ?auto_294563 ) ) ( AVAILABLE ?auto_294563 ) ( SURFACE-AT ?auto_294562 ?auto_294565 ) ( ON ?auto_294562 ?auto_294567 ) ( CLEAR ?auto_294562 ) ( not ( = ?auto_294561 ?auto_294567 ) ) ( not ( = ?auto_294562 ?auto_294567 ) ) ( not ( = ?auto_294557 ?auto_294567 ) ) ( TRUCK-AT ?auto_294564 ?auto_294566 ) ( SURFACE-AT ?auto_294557 ?auto_294566 ) ( CLEAR ?auto_294557 ) ( IS-CRATE ?auto_294561 ) ( AVAILABLE ?auto_294568 ) ( IN ?auto_294561 ?auto_294564 ) ( ON ?auto_294559 ?auto_294558 ) ( ON ?auto_294560 ?auto_294559 ) ( ON ?auto_294557 ?auto_294560 ) ( not ( = ?auto_294558 ?auto_294559 ) ) ( not ( = ?auto_294558 ?auto_294560 ) ) ( not ( = ?auto_294558 ?auto_294557 ) ) ( not ( = ?auto_294558 ?auto_294561 ) ) ( not ( = ?auto_294558 ?auto_294562 ) ) ( not ( = ?auto_294558 ?auto_294567 ) ) ( not ( = ?auto_294559 ?auto_294560 ) ) ( not ( = ?auto_294559 ?auto_294557 ) ) ( not ( = ?auto_294559 ?auto_294561 ) ) ( not ( = ?auto_294559 ?auto_294562 ) ) ( not ( = ?auto_294559 ?auto_294567 ) ) ( not ( = ?auto_294560 ?auto_294557 ) ) ( not ( = ?auto_294560 ?auto_294561 ) ) ( not ( = ?auto_294560 ?auto_294562 ) ) ( not ( = ?auto_294560 ?auto_294567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_294557 ?auto_294561 ?auto_294562 )
      ( MAKE-5CRATE-VERIFY ?auto_294558 ?auto_294559 ?auto_294560 ?auto_294557 ?auto_294561 ?auto_294562 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295767 - SURFACE
      ?auto_295768 - SURFACE
      ?auto_295769 - SURFACE
      ?auto_295766 - SURFACE
      ?auto_295770 - SURFACE
      ?auto_295772 - SURFACE
      ?auto_295771 - SURFACE
    )
    :vars
    (
      ?auto_295774 - HOIST
      ?auto_295773 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_295774 ?auto_295773 ) ( SURFACE-AT ?auto_295772 ?auto_295773 ) ( CLEAR ?auto_295772 ) ( LIFTING ?auto_295774 ?auto_295771 ) ( IS-CRATE ?auto_295771 ) ( not ( = ?auto_295772 ?auto_295771 ) ) ( ON ?auto_295768 ?auto_295767 ) ( ON ?auto_295769 ?auto_295768 ) ( ON ?auto_295766 ?auto_295769 ) ( ON ?auto_295770 ?auto_295766 ) ( ON ?auto_295772 ?auto_295770 ) ( not ( = ?auto_295767 ?auto_295768 ) ) ( not ( = ?auto_295767 ?auto_295769 ) ) ( not ( = ?auto_295767 ?auto_295766 ) ) ( not ( = ?auto_295767 ?auto_295770 ) ) ( not ( = ?auto_295767 ?auto_295772 ) ) ( not ( = ?auto_295767 ?auto_295771 ) ) ( not ( = ?auto_295768 ?auto_295769 ) ) ( not ( = ?auto_295768 ?auto_295766 ) ) ( not ( = ?auto_295768 ?auto_295770 ) ) ( not ( = ?auto_295768 ?auto_295772 ) ) ( not ( = ?auto_295768 ?auto_295771 ) ) ( not ( = ?auto_295769 ?auto_295766 ) ) ( not ( = ?auto_295769 ?auto_295770 ) ) ( not ( = ?auto_295769 ?auto_295772 ) ) ( not ( = ?auto_295769 ?auto_295771 ) ) ( not ( = ?auto_295766 ?auto_295770 ) ) ( not ( = ?auto_295766 ?auto_295772 ) ) ( not ( = ?auto_295766 ?auto_295771 ) ) ( not ( = ?auto_295770 ?auto_295772 ) ) ( not ( = ?auto_295770 ?auto_295771 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_295772 ?auto_295771 )
      ( MAKE-6CRATE-VERIFY ?auto_295767 ?auto_295768 ?auto_295769 ?auto_295766 ?auto_295770 ?auto_295772 ?auto_295771 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295811 - SURFACE
      ?auto_295812 - SURFACE
      ?auto_295813 - SURFACE
      ?auto_295810 - SURFACE
      ?auto_295814 - SURFACE
      ?auto_295816 - SURFACE
      ?auto_295815 - SURFACE
    )
    :vars
    (
      ?auto_295817 - HOIST
      ?auto_295818 - PLACE
      ?auto_295819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_295817 ?auto_295818 ) ( SURFACE-AT ?auto_295816 ?auto_295818 ) ( CLEAR ?auto_295816 ) ( IS-CRATE ?auto_295815 ) ( not ( = ?auto_295816 ?auto_295815 ) ) ( TRUCK-AT ?auto_295819 ?auto_295818 ) ( AVAILABLE ?auto_295817 ) ( IN ?auto_295815 ?auto_295819 ) ( ON ?auto_295816 ?auto_295814 ) ( not ( = ?auto_295814 ?auto_295816 ) ) ( not ( = ?auto_295814 ?auto_295815 ) ) ( ON ?auto_295812 ?auto_295811 ) ( ON ?auto_295813 ?auto_295812 ) ( ON ?auto_295810 ?auto_295813 ) ( ON ?auto_295814 ?auto_295810 ) ( not ( = ?auto_295811 ?auto_295812 ) ) ( not ( = ?auto_295811 ?auto_295813 ) ) ( not ( = ?auto_295811 ?auto_295810 ) ) ( not ( = ?auto_295811 ?auto_295814 ) ) ( not ( = ?auto_295811 ?auto_295816 ) ) ( not ( = ?auto_295811 ?auto_295815 ) ) ( not ( = ?auto_295812 ?auto_295813 ) ) ( not ( = ?auto_295812 ?auto_295810 ) ) ( not ( = ?auto_295812 ?auto_295814 ) ) ( not ( = ?auto_295812 ?auto_295816 ) ) ( not ( = ?auto_295812 ?auto_295815 ) ) ( not ( = ?auto_295813 ?auto_295810 ) ) ( not ( = ?auto_295813 ?auto_295814 ) ) ( not ( = ?auto_295813 ?auto_295816 ) ) ( not ( = ?auto_295813 ?auto_295815 ) ) ( not ( = ?auto_295810 ?auto_295814 ) ) ( not ( = ?auto_295810 ?auto_295816 ) ) ( not ( = ?auto_295810 ?auto_295815 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295814 ?auto_295816 ?auto_295815 )
      ( MAKE-6CRATE-VERIFY ?auto_295811 ?auto_295812 ?auto_295813 ?auto_295810 ?auto_295814 ?auto_295816 ?auto_295815 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295862 - SURFACE
      ?auto_295863 - SURFACE
      ?auto_295864 - SURFACE
      ?auto_295861 - SURFACE
      ?auto_295865 - SURFACE
      ?auto_295867 - SURFACE
      ?auto_295866 - SURFACE
    )
    :vars
    (
      ?auto_295871 - HOIST
      ?auto_295870 - PLACE
      ?auto_295869 - TRUCK
      ?auto_295868 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_295871 ?auto_295870 ) ( SURFACE-AT ?auto_295867 ?auto_295870 ) ( CLEAR ?auto_295867 ) ( IS-CRATE ?auto_295866 ) ( not ( = ?auto_295867 ?auto_295866 ) ) ( AVAILABLE ?auto_295871 ) ( IN ?auto_295866 ?auto_295869 ) ( ON ?auto_295867 ?auto_295865 ) ( not ( = ?auto_295865 ?auto_295867 ) ) ( not ( = ?auto_295865 ?auto_295866 ) ) ( TRUCK-AT ?auto_295869 ?auto_295868 ) ( not ( = ?auto_295868 ?auto_295870 ) ) ( ON ?auto_295863 ?auto_295862 ) ( ON ?auto_295864 ?auto_295863 ) ( ON ?auto_295861 ?auto_295864 ) ( ON ?auto_295865 ?auto_295861 ) ( not ( = ?auto_295862 ?auto_295863 ) ) ( not ( = ?auto_295862 ?auto_295864 ) ) ( not ( = ?auto_295862 ?auto_295861 ) ) ( not ( = ?auto_295862 ?auto_295865 ) ) ( not ( = ?auto_295862 ?auto_295867 ) ) ( not ( = ?auto_295862 ?auto_295866 ) ) ( not ( = ?auto_295863 ?auto_295864 ) ) ( not ( = ?auto_295863 ?auto_295861 ) ) ( not ( = ?auto_295863 ?auto_295865 ) ) ( not ( = ?auto_295863 ?auto_295867 ) ) ( not ( = ?auto_295863 ?auto_295866 ) ) ( not ( = ?auto_295864 ?auto_295861 ) ) ( not ( = ?auto_295864 ?auto_295865 ) ) ( not ( = ?auto_295864 ?auto_295867 ) ) ( not ( = ?auto_295864 ?auto_295866 ) ) ( not ( = ?auto_295861 ?auto_295865 ) ) ( not ( = ?auto_295861 ?auto_295867 ) ) ( not ( = ?auto_295861 ?auto_295866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295865 ?auto_295867 ?auto_295866 )
      ( MAKE-6CRATE-VERIFY ?auto_295862 ?auto_295863 ?auto_295864 ?auto_295861 ?auto_295865 ?auto_295867 ?auto_295866 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295919 - SURFACE
      ?auto_295920 - SURFACE
      ?auto_295921 - SURFACE
      ?auto_295918 - SURFACE
      ?auto_295922 - SURFACE
      ?auto_295924 - SURFACE
      ?auto_295923 - SURFACE
    )
    :vars
    (
      ?auto_295928 - HOIST
      ?auto_295926 - PLACE
      ?auto_295925 - TRUCK
      ?auto_295929 - PLACE
      ?auto_295927 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_295928 ?auto_295926 ) ( SURFACE-AT ?auto_295924 ?auto_295926 ) ( CLEAR ?auto_295924 ) ( IS-CRATE ?auto_295923 ) ( not ( = ?auto_295924 ?auto_295923 ) ) ( AVAILABLE ?auto_295928 ) ( ON ?auto_295924 ?auto_295922 ) ( not ( = ?auto_295922 ?auto_295924 ) ) ( not ( = ?auto_295922 ?auto_295923 ) ) ( TRUCK-AT ?auto_295925 ?auto_295929 ) ( not ( = ?auto_295929 ?auto_295926 ) ) ( HOIST-AT ?auto_295927 ?auto_295929 ) ( LIFTING ?auto_295927 ?auto_295923 ) ( not ( = ?auto_295928 ?auto_295927 ) ) ( ON ?auto_295920 ?auto_295919 ) ( ON ?auto_295921 ?auto_295920 ) ( ON ?auto_295918 ?auto_295921 ) ( ON ?auto_295922 ?auto_295918 ) ( not ( = ?auto_295919 ?auto_295920 ) ) ( not ( = ?auto_295919 ?auto_295921 ) ) ( not ( = ?auto_295919 ?auto_295918 ) ) ( not ( = ?auto_295919 ?auto_295922 ) ) ( not ( = ?auto_295919 ?auto_295924 ) ) ( not ( = ?auto_295919 ?auto_295923 ) ) ( not ( = ?auto_295920 ?auto_295921 ) ) ( not ( = ?auto_295920 ?auto_295918 ) ) ( not ( = ?auto_295920 ?auto_295922 ) ) ( not ( = ?auto_295920 ?auto_295924 ) ) ( not ( = ?auto_295920 ?auto_295923 ) ) ( not ( = ?auto_295921 ?auto_295918 ) ) ( not ( = ?auto_295921 ?auto_295922 ) ) ( not ( = ?auto_295921 ?auto_295924 ) ) ( not ( = ?auto_295921 ?auto_295923 ) ) ( not ( = ?auto_295918 ?auto_295922 ) ) ( not ( = ?auto_295918 ?auto_295924 ) ) ( not ( = ?auto_295918 ?auto_295923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295922 ?auto_295924 ?auto_295923 )
      ( MAKE-6CRATE-VERIFY ?auto_295919 ?auto_295920 ?auto_295921 ?auto_295918 ?auto_295922 ?auto_295924 ?auto_295923 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295982 - SURFACE
      ?auto_295983 - SURFACE
      ?auto_295984 - SURFACE
      ?auto_295981 - SURFACE
      ?auto_295985 - SURFACE
      ?auto_295987 - SURFACE
      ?auto_295986 - SURFACE
    )
    :vars
    (
      ?auto_295990 - HOIST
      ?auto_295993 - PLACE
      ?auto_295989 - TRUCK
      ?auto_295991 - PLACE
      ?auto_295992 - HOIST
      ?auto_295988 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_295990 ?auto_295993 ) ( SURFACE-AT ?auto_295987 ?auto_295993 ) ( CLEAR ?auto_295987 ) ( IS-CRATE ?auto_295986 ) ( not ( = ?auto_295987 ?auto_295986 ) ) ( AVAILABLE ?auto_295990 ) ( ON ?auto_295987 ?auto_295985 ) ( not ( = ?auto_295985 ?auto_295987 ) ) ( not ( = ?auto_295985 ?auto_295986 ) ) ( TRUCK-AT ?auto_295989 ?auto_295991 ) ( not ( = ?auto_295991 ?auto_295993 ) ) ( HOIST-AT ?auto_295992 ?auto_295991 ) ( not ( = ?auto_295990 ?auto_295992 ) ) ( AVAILABLE ?auto_295992 ) ( SURFACE-AT ?auto_295986 ?auto_295991 ) ( ON ?auto_295986 ?auto_295988 ) ( CLEAR ?auto_295986 ) ( not ( = ?auto_295987 ?auto_295988 ) ) ( not ( = ?auto_295986 ?auto_295988 ) ) ( not ( = ?auto_295985 ?auto_295988 ) ) ( ON ?auto_295983 ?auto_295982 ) ( ON ?auto_295984 ?auto_295983 ) ( ON ?auto_295981 ?auto_295984 ) ( ON ?auto_295985 ?auto_295981 ) ( not ( = ?auto_295982 ?auto_295983 ) ) ( not ( = ?auto_295982 ?auto_295984 ) ) ( not ( = ?auto_295982 ?auto_295981 ) ) ( not ( = ?auto_295982 ?auto_295985 ) ) ( not ( = ?auto_295982 ?auto_295987 ) ) ( not ( = ?auto_295982 ?auto_295986 ) ) ( not ( = ?auto_295982 ?auto_295988 ) ) ( not ( = ?auto_295983 ?auto_295984 ) ) ( not ( = ?auto_295983 ?auto_295981 ) ) ( not ( = ?auto_295983 ?auto_295985 ) ) ( not ( = ?auto_295983 ?auto_295987 ) ) ( not ( = ?auto_295983 ?auto_295986 ) ) ( not ( = ?auto_295983 ?auto_295988 ) ) ( not ( = ?auto_295984 ?auto_295981 ) ) ( not ( = ?auto_295984 ?auto_295985 ) ) ( not ( = ?auto_295984 ?auto_295987 ) ) ( not ( = ?auto_295984 ?auto_295986 ) ) ( not ( = ?auto_295984 ?auto_295988 ) ) ( not ( = ?auto_295981 ?auto_295985 ) ) ( not ( = ?auto_295981 ?auto_295987 ) ) ( not ( = ?auto_295981 ?auto_295986 ) ) ( not ( = ?auto_295981 ?auto_295988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295985 ?auto_295987 ?auto_295986 )
      ( MAKE-6CRATE-VERIFY ?auto_295982 ?auto_295983 ?auto_295984 ?auto_295981 ?auto_295985 ?auto_295987 ?auto_295986 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_296046 - SURFACE
      ?auto_296047 - SURFACE
      ?auto_296048 - SURFACE
      ?auto_296045 - SURFACE
      ?auto_296049 - SURFACE
      ?auto_296051 - SURFACE
      ?auto_296050 - SURFACE
    )
    :vars
    (
      ?auto_296056 - HOIST
      ?auto_296057 - PLACE
      ?auto_296052 - PLACE
      ?auto_296053 - HOIST
      ?auto_296055 - SURFACE
      ?auto_296054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_296056 ?auto_296057 ) ( SURFACE-AT ?auto_296051 ?auto_296057 ) ( CLEAR ?auto_296051 ) ( IS-CRATE ?auto_296050 ) ( not ( = ?auto_296051 ?auto_296050 ) ) ( AVAILABLE ?auto_296056 ) ( ON ?auto_296051 ?auto_296049 ) ( not ( = ?auto_296049 ?auto_296051 ) ) ( not ( = ?auto_296049 ?auto_296050 ) ) ( not ( = ?auto_296052 ?auto_296057 ) ) ( HOIST-AT ?auto_296053 ?auto_296052 ) ( not ( = ?auto_296056 ?auto_296053 ) ) ( AVAILABLE ?auto_296053 ) ( SURFACE-AT ?auto_296050 ?auto_296052 ) ( ON ?auto_296050 ?auto_296055 ) ( CLEAR ?auto_296050 ) ( not ( = ?auto_296051 ?auto_296055 ) ) ( not ( = ?auto_296050 ?auto_296055 ) ) ( not ( = ?auto_296049 ?auto_296055 ) ) ( TRUCK-AT ?auto_296054 ?auto_296057 ) ( ON ?auto_296047 ?auto_296046 ) ( ON ?auto_296048 ?auto_296047 ) ( ON ?auto_296045 ?auto_296048 ) ( ON ?auto_296049 ?auto_296045 ) ( not ( = ?auto_296046 ?auto_296047 ) ) ( not ( = ?auto_296046 ?auto_296048 ) ) ( not ( = ?auto_296046 ?auto_296045 ) ) ( not ( = ?auto_296046 ?auto_296049 ) ) ( not ( = ?auto_296046 ?auto_296051 ) ) ( not ( = ?auto_296046 ?auto_296050 ) ) ( not ( = ?auto_296046 ?auto_296055 ) ) ( not ( = ?auto_296047 ?auto_296048 ) ) ( not ( = ?auto_296047 ?auto_296045 ) ) ( not ( = ?auto_296047 ?auto_296049 ) ) ( not ( = ?auto_296047 ?auto_296051 ) ) ( not ( = ?auto_296047 ?auto_296050 ) ) ( not ( = ?auto_296047 ?auto_296055 ) ) ( not ( = ?auto_296048 ?auto_296045 ) ) ( not ( = ?auto_296048 ?auto_296049 ) ) ( not ( = ?auto_296048 ?auto_296051 ) ) ( not ( = ?auto_296048 ?auto_296050 ) ) ( not ( = ?auto_296048 ?auto_296055 ) ) ( not ( = ?auto_296045 ?auto_296049 ) ) ( not ( = ?auto_296045 ?auto_296051 ) ) ( not ( = ?auto_296045 ?auto_296050 ) ) ( not ( = ?auto_296045 ?auto_296055 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_296049 ?auto_296051 ?auto_296050 )
      ( MAKE-6CRATE-VERIFY ?auto_296046 ?auto_296047 ?auto_296048 ?auto_296045 ?auto_296049 ?auto_296051 ?auto_296050 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_296110 - SURFACE
      ?auto_296111 - SURFACE
      ?auto_296112 - SURFACE
      ?auto_296109 - SURFACE
      ?auto_296113 - SURFACE
      ?auto_296115 - SURFACE
      ?auto_296114 - SURFACE
    )
    :vars
    (
      ?auto_296120 - HOIST
      ?auto_296121 - PLACE
      ?auto_296119 - PLACE
      ?auto_296118 - HOIST
      ?auto_296117 - SURFACE
      ?auto_296116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_296120 ?auto_296121 ) ( IS-CRATE ?auto_296114 ) ( not ( = ?auto_296115 ?auto_296114 ) ) ( not ( = ?auto_296113 ?auto_296115 ) ) ( not ( = ?auto_296113 ?auto_296114 ) ) ( not ( = ?auto_296119 ?auto_296121 ) ) ( HOIST-AT ?auto_296118 ?auto_296119 ) ( not ( = ?auto_296120 ?auto_296118 ) ) ( AVAILABLE ?auto_296118 ) ( SURFACE-AT ?auto_296114 ?auto_296119 ) ( ON ?auto_296114 ?auto_296117 ) ( CLEAR ?auto_296114 ) ( not ( = ?auto_296115 ?auto_296117 ) ) ( not ( = ?auto_296114 ?auto_296117 ) ) ( not ( = ?auto_296113 ?auto_296117 ) ) ( TRUCK-AT ?auto_296116 ?auto_296121 ) ( SURFACE-AT ?auto_296113 ?auto_296121 ) ( CLEAR ?auto_296113 ) ( LIFTING ?auto_296120 ?auto_296115 ) ( IS-CRATE ?auto_296115 ) ( ON ?auto_296111 ?auto_296110 ) ( ON ?auto_296112 ?auto_296111 ) ( ON ?auto_296109 ?auto_296112 ) ( ON ?auto_296113 ?auto_296109 ) ( not ( = ?auto_296110 ?auto_296111 ) ) ( not ( = ?auto_296110 ?auto_296112 ) ) ( not ( = ?auto_296110 ?auto_296109 ) ) ( not ( = ?auto_296110 ?auto_296113 ) ) ( not ( = ?auto_296110 ?auto_296115 ) ) ( not ( = ?auto_296110 ?auto_296114 ) ) ( not ( = ?auto_296110 ?auto_296117 ) ) ( not ( = ?auto_296111 ?auto_296112 ) ) ( not ( = ?auto_296111 ?auto_296109 ) ) ( not ( = ?auto_296111 ?auto_296113 ) ) ( not ( = ?auto_296111 ?auto_296115 ) ) ( not ( = ?auto_296111 ?auto_296114 ) ) ( not ( = ?auto_296111 ?auto_296117 ) ) ( not ( = ?auto_296112 ?auto_296109 ) ) ( not ( = ?auto_296112 ?auto_296113 ) ) ( not ( = ?auto_296112 ?auto_296115 ) ) ( not ( = ?auto_296112 ?auto_296114 ) ) ( not ( = ?auto_296112 ?auto_296117 ) ) ( not ( = ?auto_296109 ?auto_296113 ) ) ( not ( = ?auto_296109 ?auto_296115 ) ) ( not ( = ?auto_296109 ?auto_296114 ) ) ( not ( = ?auto_296109 ?auto_296117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_296113 ?auto_296115 ?auto_296114 )
      ( MAKE-6CRATE-VERIFY ?auto_296110 ?auto_296111 ?auto_296112 ?auto_296109 ?auto_296113 ?auto_296115 ?auto_296114 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_296174 - SURFACE
      ?auto_296175 - SURFACE
      ?auto_296176 - SURFACE
      ?auto_296173 - SURFACE
      ?auto_296177 - SURFACE
      ?auto_296179 - SURFACE
      ?auto_296178 - SURFACE
    )
    :vars
    (
      ?auto_296183 - HOIST
      ?auto_296180 - PLACE
      ?auto_296182 - PLACE
      ?auto_296185 - HOIST
      ?auto_296184 - SURFACE
      ?auto_296181 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_296183 ?auto_296180 ) ( IS-CRATE ?auto_296178 ) ( not ( = ?auto_296179 ?auto_296178 ) ) ( not ( = ?auto_296177 ?auto_296179 ) ) ( not ( = ?auto_296177 ?auto_296178 ) ) ( not ( = ?auto_296182 ?auto_296180 ) ) ( HOIST-AT ?auto_296185 ?auto_296182 ) ( not ( = ?auto_296183 ?auto_296185 ) ) ( AVAILABLE ?auto_296185 ) ( SURFACE-AT ?auto_296178 ?auto_296182 ) ( ON ?auto_296178 ?auto_296184 ) ( CLEAR ?auto_296178 ) ( not ( = ?auto_296179 ?auto_296184 ) ) ( not ( = ?auto_296178 ?auto_296184 ) ) ( not ( = ?auto_296177 ?auto_296184 ) ) ( TRUCK-AT ?auto_296181 ?auto_296180 ) ( SURFACE-AT ?auto_296177 ?auto_296180 ) ( CLEAR ?auto_296177 ) ( IS-CRATE ?auto_296179 ) ( AVAILABLE ?auto_296183 ) ( IN ?auto_296179 ?auto_296181 ) ( ON ?auto_296175 ?auto_296174 ) ( ON ?auto_296176 ?auto_296175 ) ( ON ?auto_296173 ?auto_296176 ) ( ON ?auto_296177 ?auto_296173 ) ( not ( = ?auto_296174 ?auto_296175 ) ) ( not ( = ?auto_296174 ?auto_296176 ) ) ( not ( = ?auto_296174 ?auto_296173 ) ) ( not ( = ?auto_296174 ?auto_296177 ) ) ( not ( = ?auto_296174 ?auto_296179 ) ) ( not ( = ?auto_296174 ?auto_296178 ) ) ( not ( = ?auto_296174 ?auto_296184 ) ) ( not ( = ?auto_296175 ?auto_296176 ) ) ( not ( = ?auto_296175 ?auto_296173 ) ) ( not ( = ?auto_296175 ?auto_296177 ) ) ( not ( = ?auto_296175 ?auto_296179 ) ) ( not ( = ?auto_296175 ?auto_296178 ) ) ( not ( = ?auto_296175 ?auto_296184 ) ) ( not ( = ?auto_296176 ?auto_296173 ) ) ( not ( = ?auto_296176 ?auto_296177 ) ) ( not ( = ?auto_296176 ?auto_296179 ) ) ( not ( = ?auto_296176 ?auto_296178 ) ) ( not ( = ?auto_296176 ?auto_296184 ) ) ( not ( = ?auto_296173 ?auto_296177 ) ) ( not ( = ?auto_296173 ?auto_296179 ) ) ( not ( = ?auto_296173 ?auto_296178 ) ) ( not ( = ?auto_296173 ?auto_296184 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_296177 ?auto_296179 ?auto_296178 )
      ( MAKE-6CRATE-VERIFY ?auto_296174 ?auto_296175 ?auto_296176 ?auto_296173 ?auto_296177 ?auto_296179 ?auto_296178 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_297045 - SURFACE
      ?auto_297046 - SURFACE
    )
    :vars
    (
      ?auto_297050 - HOIST
      ?auto_297048 - PLACE
      ?auto_297049 - SURFACE
      ?auto_297053 - TRUCK
      ?auto_297051 - PLACE
      ?auto_297052 - HOIST
      ?auto_297047 - SURFACE
      ?auto_297054 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_297050 ?auto_297048 ) ( SURFACE-AT ?auto_297045 ?auto_297048 ) ( CLEAR ?auto_297045 ) ( IS-CRATE ?auto_297046 ) ( not ( = ?auto_297045 ?auto_297046 ) ) ( AVAILABLE ?auto_297050 ) ( ON ?auto_297045 ?auto_297049 ) ( not ( = ?auto_297049 ?auto_297045 ) ) ( not ( = ?auto_297049 ?auto_297046 ) ) ( TRUCK-AT ?auto_297053 ?auto_297051 ) ( not ( = ?auto_297051 ?auto_297048 ) ) ( HOIST-AT ?auto_297052 ?auto_297051 ) ( not ( = ?auto_297050 ?auto_297052 ) ) ( SURFACE-AT ?auto_297046 ?auto_297051 ) ( ON ?auto_297046 ?auto_297047 ) ( CLEAR ?auto_297046 ) ( not ( = ?auto_297045 ?auto_297047 ) ) ( not ( = ?auto_297046 ?auto_297047 ) ) ( not ( = ?auto_297049 ?auto_297047 ) ) ( LIFTING ?auto_297052 ?auto_297054 ) ( IS-CRATE ?auto_297054 ) ( not ( = ?auto_297045 ?auto_297054 ) ) ( not ( = ?auto_297046 ?auto_297054 ) ) ( not ( = ?auto_297049 ?auto_297054 ) ) ( not ( = ?auto_297047 ?auto_297054 ) ) )
    :subtasks
    ( ( !LOAD ?auto_297052 ?auto_297054 ?auto_297053 ?auto_297051 )
      ( MAKE-1CRATE ?auto_297045 ?auto_297046 )
      ( MAKE-1CRATE-VERIFY ?auto_297045 ?auto_297046 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_298124 - SURFACE
      ?auto_298125 - SURFACE
      ?auto_298126 - SURFACE
      ?auto_298123 - SURFACE
      ?auto_298127 - SURFACE
      ?auto_298129 - SURFACE
      ?auto_298128 - SURFACE
      ?auto_298130 - SURFACE
    )
    :vars
    (
      ?auto_298131 - HOIST
      ?auto_298132 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_298131 ?auto_298132 ) ( SURFACE-AT ?auto_298128 ?auto_298132 ) ( CLEAR ?auto_298128 ) ( LIFTING ?auto_298131 ?auto_298130 ) ( IS-CRATE ?auto_298130 ) ( not ( = ?auto_298128 ?auto_298130 ) ) ( ON ?auto_298125 ?auto_298124 ) ( ON ?auto_298126 ?auto_298125 ) ( ON ?auto_298123 ?auto_298126 ) ( ON ?auto_298127 ?auto_298123 ) ( ON ?auto_298129 ?auto_298127 ) ( ON ?auto_298128 ?auto_298129 ) ( not ( = ?auto_298124 ?auto_298125 ) ) ( not ( = ?auto_298124 ?auto_298126 ) ) ( not ( = ?auto_298124 ?auto_298123 ) ) ( not ( = ?auto_298124 ?auto_298127 ) ) ( not ( = ?auto_298124 ?auto_298129 ) ) ( not ( = ?auto_298124 ?auto_298128 ) ) ( not ( = ?auto_298124 ?auto_298130 ) ) ( not ( = ?auto_298125 ?auto_298126 ) ) ( not ( = ?auto_298125 ?auto_298123 ) ) ( not ( = ?auto_298125 ?auto_298127 ) ) ( not ( = ?auto_298125 ?auto_298129 ) ) ( not ( = ?auto_298125 ?auto_298128 ) ) ( not ( = ?auto_298125 ?auto_298130 ) ) ( not ( = ?auto_298126 ?auto_298123 ) ) ( not ( = ?auto_298126 ?auto_298127 ) ) ( not ( = ?auto_298126 ?auto_298129 ) ) ( not ( = ?auto_298126 ?auto_298128 ) ) ( not ( = ?auto_298126 ?auto_298130 ) ) ( not ( = ?auto_298123 ?auto_298127 ) ) ( not ( = ?auto_298123 ?auto_298129 ) ) ( not ( = ?auto_298123 ?auto_298128 ) ) ( not ( = ?auto_298123 ?auto_298130 ) ) ( not ( = ?auto_298127 ?auto_298129 ) ) ( not ( = ?auto_298127 ?auto_298128 ) ) ( not ( = ?auto_298127 ?auto_298130 ) ) ( not ( = ?auto_298129 ?auto_298128 ) ) ( not ( = ?auto_298129 ?auto_298130 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_298128 ?auto_298130 )
      ( MAKE-7CRATE-VERIFY ?auto_298124 ?auto_298125 ?auto_298126 ?auto_298123 ?auto_298127 ?auto_298129 ?auto_298128 ?auto_298130 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_298179 - SURFACE
      ?auto_298180 - SURFACE
      ?auto_298181 - SURFACE
      ?auto_298178 - SURFACE
      ?auto_298182 - SURFACE
      ?auto_298184 - SURFACE
      ?auto_298183 - SURFACE
      ?auto_298185 - SURFACE
    )
    :vars
    (
      ?auto_298187 - HOIST
      ?auto_298188 - PLACE
      ?auto_298186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_298187 ?auto_298188 ) ( SURFACE-AT ?auto_298183 ?auto_298188 ) ( CLEAR ?auto_298183 ) ( IS-CRATE ?auto_298185 ) ( not ( = ?auto_298183 ?auto_298185 ) ) ( TRUCK-AT ?auto_298186 ?auto_298188 ) ( AVAILABLE ?auto_298187 ) ( IN ?auto_298185 ?auto_298186 ) ( ON ?auto_298183 ?auto_298184 ) ( not ( = ?auto_298184 ?auto_298183 ) ) ( not ( = ?auto_298184 ?auto_298185 ) ) ( ON ?auto_298180 ?auto_298179 ) ( ON ?auto_298181 ?auto_298180 ) ( ON ?auto_298178 ?auto_298181 ) ( ON ?auto_298182 ?auto_298178 ) ( ON ?auto_298184 ?auto_298182 ) ( not ( = ?auto_298179 ?auto_298180 ) ) ( not ( = ?auto_298179 ?auto_298181 ) ) ( not ( = ?auto_298179 ?auto_298178 ) ) ( not ( = ?auto_298179 ?auto_298182 ) ) ( not ( = ?auto_298179 ?auto_298184 ) ) ( not ( = ?auto_298179 ?auto_298183 ) ) ( not ( = ?auto_298179 ?auto_298185 ) ) ( not ( = ?auto_298180 ?auto_298181 ) ) ( not ( = ?auto_298180 ?auto_298178 ) ) ( not ( = ?auto_298180 ?auto_298182 ) ) ( not ( = ?auto_298180 ?auto_298184 ) ) ( not ( = ?auto_298180 ?auto_298183 ) ) ( not ( = ?auto_298180 ?auto_298185 ) ) ( not ( = ?auto_298181 ?auto_298178 ) ) ( not ( = ?auto_298181 ?auto_298182 ) ) ( not ( = ?auto_298181 ?auto_298184 ) ) ( not ( = ?auto_298181 ?auto_298183 ) ) ( not ( = ?auto_298181 ?auto_298185 ) ) ( not ( = ?auto_298178 ?auto_298182 ) ) ( not ( = ?auto_298178 ?auto_298184 ) ) ( not ( = ?auto_298178 ?auto_298183 ) ) ( not ( = ?auto_298178 ?auto_298185 ) ) ( not ( = ?auto_298182 ?auto_298184 ) ) ( not ( = ?auto_298182 ?auto_298183 ) ) ( not ( = ?auto_298182 ?auto_298185 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_298184 ?auto_298183 ?auto_298185 )
      ( MAKE-7CRATE-VERIFY ?auto_298179 ?auto_298180 ?auto_298181 ?auto_298178 ?auto_298182 ?auto_298184 ?auto_298183 ?auto_298185 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_298242 - SURFACE
      ?auto_298243 - SURFACE
      ?auto_298244 - SURFACE
      ?auto_298241 - SURFACE
      ?auto_298245 - SURFACE
      ?auto_298247 - SURFACE
      ?auto_298246 - SURFACE
      ?auto_298248 - SURFACE
    )
    :vars
    (
      ?auto_298251 - HOIST
      ?auto_298249 - PLACE
      ?auto_298250 - TRUCK
      ?auto_298252 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_298251 ?auto_298249 ) ( SURFACE-AT ?auto_298246 ?auto_298249 ) ( CLEAR ?auto_298246 ) ( IS-CRATE ?auto_298248 ) ( not ( = ?auto_298246 ?auto_298248 ) ) ( AVAILABLE ?auto_298251 ) ( IN ?auto_298248 ?auto_298250 ) ( ON ?auto_298246 ?auto_298247 ) ( not ( = ?auto_298247 ?auto_298246 ) ) ( not ( = ?auto_298247 ?auto_298248 ) ) ( TRUCK-AT ?auto_298250 ?auto_298252 ) ( not ( = ?auto_298252 ?auto_298249 ) ) ( ON ?auto_298243 ?auto_298242 ) ( ON ?auto_298244 ?auto_298243 ) ( ON ?auto_298241 ?auto_298244 ) ( ON ?auto_298245 ?auto_298241 ) ( ON ?auto_298247 ?auto_298245 ) ( not ( = ?auto_298242 ?auto_298243 ) ) ( not ( = ?auto_298242 ?auto_298244 ) ) ( not ( = ?auto_298242 ?auto_298241 ) ) ( not ( = ?auto_298242 ?auto_298245 ) ) ( not ( = ?auto_298242 ?auto_298247 ) ) ( not ( = ?auto_298242 ?auto_298246 ) ) ( not ( = ?auto_298242 ?auto_298248 ) ) ( not ( = ?auto_298243 ?auto_298244 ) ) ( not ( = ?auto_298243 ?auto_298241 ) ) ( not ( = ?auto_298243 ?auto_298245 ) ) ( not ( = ?auto_298243 ?auto_298247 ) ) ( not ( = ?auto_298243 ?auto_298246 ) ) ( not ( = ?auto_298243 ?auto_298248 ) ) ( not ( = ?auto_298244 ?auto_298241 ) ) ( not ( = ?auto_298244 ?auto_298245 ) ) ( not ( = ?auto_298244 ?auto_298247 ) ) ( not ( = ?auto_298244 ?auto_298246 ) ) ( not ( = ?auto_298244 ?auto_298248 ) ) ( not ( = ?auto_298241 ?auto_298245 ) ) ( not ( = ?auto_298241 ?auto_298247 ) ) ( not ( = ?auto_298241 ?auto_298246 ) ) ( not ( = ?auto_298241 ?auto_298248 ) ) ( not ( = ?auto_298245 ?auto_298247 ) ) ( not ( = ?auto_298245 ?auto_298246 ) ) ( not ( = ?auto_298245 ?auto_298248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_298247 ?auto_298246 ?auto_298248 )
      ( MAKE-7CRATE-VERIFY ?auto_298242 ?auto_298243 ?auto_298244 ?auto_298241 ?auto_298245 ?auto_298247 ?auto_298246 ?auto_298248 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_298312 - SURFACE
      ?auto_298313 - SURFACE
      ?auto_298314 - SURFACE
      ?auto_298311 - SURFACE
      ?auto_298315 - SURFACE
      ?auto_298317 - SURFACE
      ?auto_298316 - SURFACE
      ?auto_298318 - SURFACE
    )
    :vars
    (
      ?auto_298321 - HOIST
      ?auto_298322 - PLACE
      ?auto_298320 - TRUCK
      ?auto_298319 - PLACE
      ?auto_298323 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_298321 ?auto_298322 ) ( SURFACE-AT ?auto_298316 ?auto_298322 ) ( CLEAR ?auto_298316 ) ( IS-CRATE ?auto_298318 ) ( not ( = ?auto_298316 ?auto_298318 ) ) ( AVAILABLE ?auto_298321 ) ( ON ?auto_298316 ?auto_298317 ) ( not ( = ?auto_298317 ?auto_298316 ) ) ( not ( = ?auto_298317 ?auto_298318 ) ) ( TRUCK-AT ?auto_298320 ?auto_298319 ) ( not ( = ?auto_298319 ?auto_298322 ) ) ( HOIST-AT ?auto_298323 ?auto_298319 ) ( LIFTING ?auto_298323 ?auto_298318 ) ( not ( = ?auto_298321 ?auto_298323 ) ) ( ON ?auto_298313 ?auto_298312 ) ( ON ?auto_298314 ?auto_298313 ) ( ON ?auto_298311 ?auto_298314 ) ( ON ?auto_298315 ?auto_298311 ) ( ON ?auto_298317 ?auto_298315 ) ( not ( = ?auto_298312 ?auto_298313 ) ) ( not ( = ?auto_298312 ?auto_298314 ) ) ( not ( = ?auto_298312 ?auto_298311 ) ) ( not ( = ?auto_298312 ?auto_298315 ) ) ( not ( = ?auto_298312 ?auto_298317 ) ) ( not ( = ?auto_298312 ?auto_298316 ) ) ( not ( = ?auto_298312 ?auto_298318 ) ) ( not ( = ?auto_298313 ?auto_298314 ) ) ( not ( = ?auto_298313 ?auto_298311 ) ) ( not ( = ?auto_298313 ?auto_298315 ) ) ( not ( = ?auto_298313 ?auto_298317 ) ) ( not ( = ?auto_298313 ?auto_298316 ) ) ( not ( = ?auto_298313 ?auto_298318 ) ) ( not ( = ?auto_298314 ?auto_298311 ) ) ( not ( = ?auto_298314 ?auto_298315 ) ) ( not ( = ?auto_298314 ?auto_298317 ) ) ( not ( = ?auto_298314 ?auto_298316 ) ) ( not ( = ?auto_298314 ?auto_298318 ) ) ( not ( = ?auto_298311 ?auto_298315 ) ) ( not ( = ?auto_298311 ?auto_298317 ) ) ( not ( = ?auto_298311 ?auto_298316 ) ) ( not ( = ?auto_298311 ?auto_298318 ) ) ( not ( = ?auto_298315 ?auto_298317 ) ) ( not ( = ?auto_298315 ?auto_298316 ) ) ( not ( = ?auto_298315 ?auto_298318 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_298317 ?auto_298316 ?auto_298318 )
      ( MAKE-7CRATE-VERIFY ?auto_298312 ?auto_298313 ?auto_298314 ?auto_298311 ?auto_298315 ?auto_298317 ?auto_298316 ?auto_298318 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_298389 - SURFACE
      ?auto_298390 - SURFACE
      ?auto_298391 - SURFACE
      ?auto_298388 - SURFACE
      ?auto_298392 - SURFACE
      ?auto_298394 - SURFACE
      ?auto_298393 - SURFACE
      ?auto_298395 - SURFACE
    )
    :vars
    (
      ?auto_298399 - HOIST
      ?auto_298397 - PLACE
      ?auto_298398 - TRUCK
      ?auto_298401 - PLACE
      ?auto_298400 - HOIST
      ?auto_298396 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_298399 ?auto_298397 ) ( SURFACE-AT ?auto_298393 ?auto_298397 ) ( CLEAR ?auto_298393 ) ( IS-CRATE ?auto_298395 ) ( not ( = ?auto_298393 ?auto_298395 ) ) ( AVAILABLE ?auto_298399 ) ( ON ?auto_298393 ?auto_298394 ) ( not ( = ?auto_298394 ?auto_298393 ) ) ( not ( = ?auto_298394 ?auto_298395 ) ) ( TRUCK-AT ?auto_298398 ?auto_298401 ) ( not ( = ?auto_298401 ?auto_298397 ) ) ( HOIST-AT ?auto_298400 ?auto_298401 ) ( not ( = ?auto_298399 ?auto_298400 ) ) ( AVAILABLE ?auto_298400 ) ( SURFACE-AT ?auto_298395 ?auto_298401 ) ( ON ?auto_298395 ?auto_298396 ) ( CLEAR ?auto_298395 ) ( not ( = ?auto_298393 ?auto_298396 ) ) ( not ( = ?auto_298395 ?auto_298396 ) ) ( not ( = ?auto_298394 ?auto_298396 ) ) ( ON ?auto_298390 ?auto_298389 ) ( ON ?auto_298391 ?auto_298390 ) ( ON ?auto_298388 ?auto_298391 ) ( ON ?auto_298392 ?auto_298388 ) ( ON ?auto_298394 ?auto_298392 ) ( not ( = ?auto_298389 ?auto_298390 ) ) ( not ( = ?auto_298389 ?auto_298391 ) ) ( not ( = ?auto_298389 ?auto_298388 ) ) ( not ( = ?auto_298389 ?auto_298392 ) ) ( not ( = ?auto_298389 ?auto_298394 ) ) ( not ( = ?auto_298389 ?auto_298393 ) ) ( not ( = ?auto_298389 ?auto_298395 ) ) ( not ( = ?auto_298389 ?auto_298396 ) ) ( not ( = ?auto_298390 ?auto_298391 ) ) ( not ( = ?auto_298390 ?auto_298388 ) ) ( not ( = ?auto_298390 ?auto_298392 ) ) ( not ( = ?auto_298390 ?auto_298394 ) ) ( not ( = ?auto_298390 ?auto_298393 ) ) ( not ( = ?auto_298390 ?auto_298395 ) ) ( not ( = ?auto_298390 ?auto_298396 ) ) ( not ( = ?auto_298391 ?auto_298388 ) ) ( not ( = ?auto_298391 ?auto_298392 ) ) ( not ( = ?auto_298391 ?auto_298394 ) ) ( not ( = ?auto_298391 ?auto_298393 ) ) ( not ( = ?auto_298391 ?auto_298395 ) ) ( not ( = ?auto_298391 ?auto_298396 ) ) ( not ( = ?auto_298388 ?auto_298392 ) ) ( not ( = ?auto_298388 ?auto_298394 ) ) ( not ( = ?auto_298388 ?auto_298393 ) ) ( not ( = ?auto_298388 ?auto_298395 ) ) ( not ( = ?auto_298388 ?auto_298396 ) ) ( not ( = ?auto_298392 ?auto_298394 ) ) ( not ( = ?auto_298392 ?auto_298393 ) ) ( not ( = ?auto_298392 ?auto_298395 ) ) ( not ( = ?auto_298392 ?auto_298396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_298394 ?auto_298393 ?auto_298395 )
      ( MAKE-7CRATE-VERIFY ?auto_298389 ?auto_298390 ?auto_298391 ?auto_298388 ?auto_298392 ?auto_298394 ?auto_298393 ?auto_298395 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_298467 - SURFACE
      ?auto_298468 - SURFACE
      ?auto_298469 - SURFACE
      ?auto_298466 - SURFACE
      ?auto_298470 - SURFACE
      ?auto_298472 - SURFACE
      ?auto_298471 - SURFACE
      ?auto_298473 - SURFACE
    )
    :vars
    (
      ?auto_298476 - HOIST
      ?auto_298478 - PLACE
      ?auto_298475 - PLACE
      ?auto_298477 - HOIST
      ?auto_298479 - SURFACE
      ?auto_298474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_298476 ?auto_298478 ) ( SURFACE-AT ?auto_298471 ?auto_298478 ) ( CLEAR ?auto_298471 ) ( IS-CRATE ?auto_298473 ) ( not ( = ?auto_298471 ?auto_298473 ) ) ( AVAILABLE ?auto_298476 ) ( ON ?auto_298471 ?auto_298472 ) ( not ( = ?auto_298472 ?auto_298471 ) ) ( not ( = ?auto_298472 ?auto_298473 ) ) ( not ( = ?auto_298475 ?auto_298478 ) ) ( HOIST-AT ?auto_298477 ?auto_298475 ) ( not ( = ?auto_298476 ?auto_298477 ) ) ( AVAILABLE ?auto_298477 ) ( SURFACE-AT ?auto_298473 ?auto_298475 ) ( ON ?auto_298473 ?auto_298479 ) ( CLEAR ?auto_298473 ) ( not ( = ?auto_298471 ?auto_298479 ) ) ( not ( = ?auto_298473 ?auto_298479 ) ) ( not ( = ?auto_298472 ?auto_298479 ) ) ( TRUCK-AT ?auto_298474 ?auto_298478 ) ( ON ?auto_298468 ?auto_298467 ) ( ON ?auto_298469 ?auto_298468 ) ( ON ?auto_298466 ?auto_298469 ) ( ON ?auto_298470 ?auto_298466 ) ( ON ?auto_298472 ?auto_298470 ) ( not ( = ?auto_298467 ?auto_298468 ) ) ( not ( = ?auto_298467 ?auto_298469 ) ) ( not ( = ?auto_298467 ?auto_298466 ) ) ( not ( = ?auto_298467 ?auto_298470 ) ) ( not ( = ?auto_298467 ?auto_298472 ) ) ( not ( = ?auto_298467 ?auto_298471 ) ) ( not ( = ?auto_298467 ?auto_298473 ) ) ( not ( = ?auto_298467 ?auto_298479 ) ) ( not ( = ?auto_298468 ?auto_298469 ) ) ( not ( = ?auto_298468 ?auto_298466 ) ) ( not ( = ?auto_298468 ?auto_298470 ) ) ( not ( = ?auto_298468 ?auto_298472 ) ) ( not ( = ?auto_298468 ?auto_298471 ) ) ( not ( = ?auto_298468 ?auto_298473 ) ) ( not ( = ?auto_298468 ?auto_298479 ) ) ( not ( = ?auto_298469 ?auto_298466 ) ) ( not ( = ?auto_298469 ?auto_298470 ) ) ( not ( = ?auto_298469 ?auto_298472 ) ) ( not ( = ?auto_298469 ?auto_298471 ) ) ( not ( = ?auto_298469 ?auto_298473 ) ) ( not ( = ?auto_298469 ?auto_298479 ) ) ( not ( = ?auto_298466 ?auto_298470 ) ) ( not ( = ?auto_298466 ?auto_298472 ) ) ( not ( = ?auto_298466 ?auto_298471 ) ) ( not ( = ?auto_298466 ?auto_298473 ) ) ( not ( = ?auto_298466 ?auto_298479 ) ) ( not ( = ?auto_298470 ?auto_298472 ) ) ( not ( = ?auto_298470 ?auto_298471 ) ) ( not ( = ?auto_298470 ?auto_298473 ) ) ( not ( = ?auto_298470 ?auto_298479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_298472 ?auto_298471 ?auto_298473 )
      ( MAKE-7CRATE-VERIFY ?auto_298467 ?auto_298468 ?auto_298469 ?auto_298466 ?auto_298470 ?auto_298472 ?auto_298471 ?auto_298473 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_298545 - SURFACE
      ?auto_298546 - SURFACE
      ?auto_298547 - SURFACE
      ?auto_298544 - SURFACE
      ?auto_298548 - SURFACE
      ?auto_298550 - SURFACE
      ?auto_298549 - SURFACE
      ?auto_298551 - SURFACE
    )
    :vars
    (
      ?auto_298553 - HOIST
      ?auto_298554 - PLACE
      ?auto_298552 - PLACE
      ?auto_298556 - HOIST
      ?auto_298557 - SURFACE
      ?auto_298555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_298553 ?auto_298554 ) ( IS-CRATE ?auto_298551 ) ( not ( = ?auto_298549 ?auto_298551 ) ) ( not ( = ?auto_298550 ?auto_298549 ) ) ( not ( = ?auto_298550 ?auto_298551 ) ) ( not ( = ?auto_298552 ?auto_298554 ) ) ( HOIST-AT ?auto_298556 ?auto_298552 ) ( not ( = ?auto_298553 ?auto_298556 ) ) ( AVAILABLE ?auto_298556 ) ( SURFACE-AT ?auto_298551 ?auto_298552 ) ( ON ?auto_298551 ?auto_298557 ) ( CLEAR ?auto_298551 ) ( not ( = ?auto_298549 ?auto_298557 ) ) ( not ( = ?auto_298551 ?auto_298557 ) ) ( not ( = ?auto_298550 ?auto_298557 ) ) ( TRUCK-AT ?auto_298555 ?auto_298554 ) ( SURFACE-AT ?auto_298550 ?auto_298554 ) ( CLEAR ?auto_298550 ) ( LIFTING ?auto_298553 ?auto_298549 ) ( IS-CRATE ?auto_298549 ) ( ON ?auto_298546 ?auto_298545 ) ( ON ?auto_298547 ?auto_298546 ) ( ON ?auto_298544 ?auto_298547 ) ( ON ?auto_298548 ?auto_298544 ) ( ON ?auto_298550 ?auto_298548 ) ( not ( = ?auto_298545 ?auto_298546 ) ) ( not ( = ?auto_298545 ?auto_298547 ) ) ( not ( = ?auto_298545 ?auto_298544 ) ) ( not ( = ?auto_298545 ?auto_298548 ) ) ( not ( = ?auto_298545 ?auto_298550 ) ) ( not ( = ?auto_298545 ?auto_298549 ) ) ( not ( = ?auto_298545 ?auto_298551 ) ) ( not ( = ?auto_298545 ?auto_298557 ) ) ( not ( = ?auto_298546 ?auto_298547 ) ) ( not ( = ?auto_298546 ?auto_298544 ) ) ( not ( = ?auto_298546 ?auto_298548 ) ) ( not ( = ?auto_298546 ?auto_298550 ) ) ( not ( = ?auto_298546 ?auto_298549 ) ) ( not ( = ?auto_298546 ?auto_298551 ) ) ( not ( = ?auto_298546 ?auto_298557 ) ) ( not ( = ?auto_298547 ?auto_298544 ) ) ( not ( = ?auto_298547 ?auto_298548 ) ) ( not ( = ?auto_298547 ?auto_298550 ) ) ( not ( = ?auto_298547 ?auto_298549 ) ) ( not ( = ?auto_298547 ?auto_298551 ) ) ( not ( = ?auto_298547 ?auto_298557 ) ) ( not ( = ?auto_298544 ?auto_298548 ) ) ( not ( = ?auto_298544 ?auto_298550 ) ) ( not ( = ?auto_298544 ?auto_298549 ) ) ( not ( = ?auto_298544 ?auto_298551 ) ) ( not ( = ?auto_298544 ?auto_298557 ) ) ( not ( = ?auto_298548 ?auto_298550 ) ) ( not ( = ?auto_298548 ?auto_298549 ) ) ( not ( = ?auto_298548 ?auto_298551 ) ) ( not ( = ?auto_298548 ?auto_298557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_298550 ?auto_298549 ?auto_298551 )
      ( MAKE-7CRATE-VERIFY ?auto_298545 ?auto_298546 ?auto_298547 ?auto_298544 ?auto_298548 ?auto_298550 ?auto_298549 ?auto_298551 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_298623 - SURFACE
      ?auto_298624 - SURFACE
      ?auto_298625 - SURFACE
      ?auto_298622 - SURFACE
      ?auto_298626 - SURFACE
      ?auto_298628 - SURFACE
      ?auto_298627 - SURFACE
      ?auto_298629 - SURFACE
    )
    :vars
    (
      ?auto_298633 - HOIST
      ?auto_298635 - PLACE
      ?auto_298632 - PLACE
      ?auto_298631 - HOIST
      ?auto_298634 - SURFACE
      ?auto_298630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_298633 ?auto_298635 ) ( IS-CRATE ?auto_298629 ) ( not ( = ?auto_298627 ?auto_298629 ) ) ( not ( = ?auto_298628 ?auto_298627 ) ) ( not ( = ?auto_298628 ?auto_298629 ) ) ( not ( = ?auto_298632 ?auto_298635 ) ) ( HOIST-AT ?auto_298631 ?auto_298632 ) ( not ( = ?auto_298633 ?auto_298631 ) ) ( AVAILABLE ?auto_298631 ) ( SURFACE-AT ?auto_298629 ?auto_298632 ) ( ON ?auto_298629 ?auto_298634 ) ( CLEAR ?auto_298629 ) ( not ( = ?auto_298627 ?auto_298634 ) ) ( not ( = ?auto_298629 ?auto_298634 ) ) ( not ( = ?auto_298628 ?auto_298634 ) ) ( TRUCK-AT ?auto_298630 ?auto_298635 ) ( SURFACE-AT ?auto_298628 ?auto_298635 ) ( CLEAR ?auto_298628 ) ( IS-CRATE ?auto_298627 ) ( AVAILABLE ?auto_298633 ) ( IN ?auto_298627 ?auto_298630 ) ( ON ?auto_298624 ?auto_298623 ) ( ON ?auto_298625 ?auto_298624 ) ( ON ?auto_298622 ?auto_298625 ) ( ON ?auto_298626 ?auto_298622 ) ( ON ?auto_298628 ?auto_298626 ) ( not ( = ?auto_298623 ?auto_298624 ) ) ( not ( = ?auto_298623 ?auto_298625 ) ) ( not ( = ?auto_298623 ?auto_298622 ) ) ( not ( = ?auto_298623 ?auto_298626 ) ) ( not ( = ?auto_298623 ?auto_298628 ) ) ( not ( = ?auto_298623 ?auto_298627 ) ) ( not ( = ?auto_298623 ?auto_298629 ) ) ( not ( = ?auto_298623 ?auto_298634 ) ) ( not ( = ?auto_298624 ?auto_298625 ) ) ( not ( = ?auto_298624 ?auto_298622 ) ) ( not ( = ?auto_298624 ?auto_298626 ) ) ( not ( = ?auto_298624 ?auto_298628 ) ) ( not ( = ?auto_298624 ?auto_298627 ) ) ( not ( = ?auto_298624 ?auto_298629 ) ) ( not ( = ?auto_298624 ?auto_298634 ) ) ( not ( = ?auto_298625 ?auto_298622 ) ) ( not ( = ?auto_298625 ?auto_298626 ) ) ( not ( = ?auto_298625 ?auto_298628 ) ) ( not ( = ?auto_298625 ?auto_298627 ) ) ( not ( = ?auto_298625 ?auto_298629 ) ) ( not ( = ?auto_298625 ?auto_298634 ) ) ( not ( = ?auto_298622 ?auto_298626 ) ) ( not ( = ?auto_298622 ?auto_298628 ) ) ( not ( = ?auto_298622 ?auto_298627 ) ) ( not ( = ?auto_298622 ?auto_298629 ) ) ( not ( = ?auto_298622 ?auto_298634 ) ) ( not ( = ?auto_298626 ?auto_298628 ) ) ( not ( = ?auto_298626 ?auto_298627 ) ) ( not ( = ?auto_298626 ?auto_298629 ) ) ( not ( = ?auto_298626 ?auto_298634 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_298628 ?auto_298627 ?auto_298629 )
      ( MAKE-7CRATE-VERIFY ?auto_298623 ?auto_298624 ?auto_298625 ?auto_298622 ?auto_298626 ?auto_298628 ?auto_298627 ?auto_298629 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_300197 - SURFACE
      ?auto_300198 - SURFACE
    )
    :vars
    (
      ?auto_300199 - HOIST
      ?auto_300205 - PLACE
      ?auto_300202 - SURFACE
      ?auto_300200 - PLACE
      ?auto_300203 - HOIST
      ?auto_300201 - SURFACE
      ?auto_300204 - TRUCK
      ?auto_300206 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_300199 ?auto_300205 ) ( SURFACE-AT ?auto_300197 ?auto_300205 ) ( CLEAR ?auto_300197 ) ( IS-CRATE ?auto_300198 ) ( not ( = ?auto_300197 ?auto_300198 ) ) ( ON ?auto_300197 ?auto_300202 ) ( not ( = ?auto_300202 ?auto_300197 ) ) ( not ( = ?auto_300202 ?auto_300198 ) ) ( not ( = ?auto_300200 ?auto_300205 ) ) ( HOIST-AT ?auto_300203 ?auto_300200 ) ( not ( = ?auto_300199 ?auto_300203 ) ) ( AVAILABLE ?auto_300203 ) ( SURFACE-AT ?auto_300198 ?auto_300200 ) ( ON ?auto_300198 ?auto_300201 ) ( CLEAR ?auto_300198 ) ( not ( = ?auto_300197 ?auto_300201 ) ) ( not ( = ?auto_300198 ?auto_300201 ) ) ( not ( = ?auto_300202 ?auto_300201 ) ) ( TRUCK-AT ?auto_300204 ?auto_300205 ) ( LIFTING ?auto_300199 ?auto_300206 ) ( IS-CRATE ?auto_300206 ) ( not ( = ?auto_300197 ?auto_300206 ) ) ( not ( = ?auto_300198 ?auto_300206 ) ) ( not ( = ?auto_300202 ?auto_300206 ) ) ( not ( = ?auto_300201 ?auto_300206 ) ) )
    :subtasks
    ( ( !LOAD ?auto_300199 ?auto_300206 ?auto_300204 ?auto_300205 )
      ( MAKE-1CRATE ?auto_300197 ?auto_300198 )
      ( MAKE-1CRATE-VERIFY ?auto_300197 ?auto_300198 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301534 - SURFACE
      ?auto_301535 - SURFACE
      ?auto_301536 - SURFACE
      ?auto_301533 - SURFACE
      ?auto_301537 - SURFACE
      ?auto_301539 - SURFACE
      ?auto_301538 - SURFACE
      ?auto_301540 - SURFACE
      ?auto_301541 - SURFACE
    )
    :vars
    (
      ?auto_301542 - HOIST
      ?auto_301543 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_301542 ?auto_301543 ) ( SURFACE-AT ?auto_301540 ?auto_301543 ) ( CLEAR ?auto_301540 ) ( LIFTING ?auto_301542 ?auto_301541 ) ( IS-CRATE ?auto_301541 ) ( not ( = ?auto_301540 ?auto_301541 ) ) ( ON ?auto_301535 ?auto_301534 ) ( ON ?auto_301536 ?auto_301535 ) ( ON ?auto_301533 ?auto_301536 ) ( ON ?auto_301537 ?auto_301533 ) ( ON ?auto_301539 ?auto_301537 ) ( ON ?auto_301538 ?auto_301539 ) ( ON ?auto_301540 ?auto_301538 ) ( not ( = ?auto_301534 ?auto_301535 ) ) ( not ( = ?auto_301534 ?auto_301536 ) ) ( not ( = ?auto_301534 ?auto_301533 ) ) ( not ( = ?auto_301534 ?auto_301537 ) ) ( not ( = ?auto_301534 ?auto_301539 ) ) ( not ( = ?auto_301534 ?auto_301538 ) ) ( not ( = ?auto_301534 ?auto_301540 ) ) ( not ( = ?auto_301534 ?auto_301541 ) ) ( not ( = ?auto_301535 ?auto_301536 ) ) ( not ( = ?auto_301535 ?auto_301533 ) ) ( not ( = ?auto_301535 ?auto_301537 ) ) ( not ( = ?auto_301535 ?auto_301539 ) ) ( not ( = ?auto_301535 ?auto_301538 ) ) ( not ( = ?auto_301535 ?auto_301540 ) ) ( not ( = ?auto_301535 ?auto_301541 ) ) ( not ( = ?auto_301536 ?auto_301533 ) ) ( not ( = ?auto_301536 ?auto_301537 ) ) ( not ( = ?auto_301536 ?auto_301539 ) ) ( not ( = ?auto_301536 ?auto_301538 ) ) ( not ( = ?auto_301536 ?auto_301540 ) ) ( not ( = ?auto_301536 ?auto_301541 ) ) ( not ( = ?auto_301533 ?auto_301537 ) ) ( not ( = ?auto_301533 ?auto_301539 ) ) ( not ( = ?auto_301533 ?auto_301538 ) ) ( not ( = ?auto_301533 ?auto_301540 ) ) ( not ( = ?auto_301533 ?auto_301541 ) ) ( not ( = ?auto_301537 ?auto_301539 ) ) ( not ( = ?auto_301537 ?auto_301538 ) ) ( not ( = ?auto_301537 ?auto_301540 ) ) ( not ( = ?auto_301537 ?auto_301541 ) ) ( not ( = ?auto_301539 ?auto_301538 ) ) ( not ( = ?auto_301539 ?auto_301540 ) ) ( not ( = ?auto_301539 ?auto_301541 ) ) ( not ( = ?auto_301538 ?auto_301540 ) ) ( not ( = ?auto_301538 ?auto_301541 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_301540 ?auto_301541 )
      ( MAKE-8CRATE-VERIFY ?auto_301534 ?auto_301535 ?auto_301536 ?auto_301533 ?auto_301537 ?auto_301539 ?auto_301538 ?auto_301540 ?auto_301541 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301601 - SURFACE
      ?auto_301602 - SURFACE
      ?auto_301603 - SURFACE
      ?auto_301600 - SURFACE
      ?auto_301604 - SURFACE
      ?auto_301606 - SURFACE
      ?auto_301605 - SURFACE
      ?auto_301607 - SURFACE
      ?auto_301608 - SURFACE
    )
    :vars
    (
      ?auto_301610 - HOIST
      ?auto_301609 - PLACE
      ?auto_301611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_301610 ?auto_301609 ) ( SURFACE-AT ?auto_301607 ?auto_301609 ) ( CLEAR ?auto_301607 ) ( IS-CRATE ?auto_301608 ) ( not ( = ?auto_301607 ?auto_301608 ) ) ( TRUCK-AT ?auto_301611 ?auto_301609 ) ( AVAILABLE ?auto_301610 ) ( IN ?auto_301608 ?auto_301611 ) ( ON ?auto_301607 ?auto_301605 ) ( not ( = ?auto_301605 ?auto_301607 ) ) ( not ( = ?auto_301605 ?auto_301608 ) ) ( ON ?auto_301602 ?auto_301601 ) ( ON ?auto_301603 ?auto_301602 ) ( ON ?auto_301600 ?auto_301603 ) ( ON ?auto_301604 ?auto_301600 ) ( ON ?auto_301606 ?auto_301604 ) ( ON ?auto_301605 ?auto_301606 ) ( not ( = ?auto_301601 ?auto_301602 ) ) ( not ( = ?auto_301601 ?auto_301603 ) ) ( not ( = ?auto_301601 ?auto_301600 ) ) ( not ( = ?auto_301601 ?auto_301604 ) ) ( not ( = ?auto_301601 ?auto_301606 ) ) ( not ( = ?auto_301601 ?auto_301605 ) ) ( not ( = ?auto_301601 ?auto_301607 ) ) ( not ( = ?auto_301601 ?auto_301608 ) ) ( not ( = ?auto_301602 ?auto_301603 ) ) ( not ( = ?auto_301602 ?auto_301600 ) ) ( not ( = ?auto_301602 ?auto_301604 ) ) ( not ( = ?auto_301602 ?auto_301606 ) ) ( not ( = ?auto_301602 ?auto_301605 ) ) ( not ( = ?auto_301602 ?auto_301607 ) ) ( not ( = ?auto_301602 ?auto_301608 ) ) ( not ( = ?auto_301603 ?auto_301600 ) ) ( not ( = ?auto_301603 ?auto_301604 ) ) ( not ( = ?auto_301603 ?auto_301606 ) ) ( not ( = ?auto_301603 ?auto_301605 ) ) ( not ( = ?auto_301603 ?auto_301607 ) ) ( not ( = ?auto_301603 ?auto_301608 ) ) ( not ( = ?auto_301600 ?auto_301604 ) ) ( not ( = ?auto_301600 ?auto_301606 ) ) ( not ( = ?auto_301600 ?auto_301605 ) ) ( not ( = ?auto_301600 ?auto_301607 ) ) ( not ( = ?auto_301600 ?auto_301608 ) ) ( not ( = ?auto_301604 ?auto_301606 ) ) ( not ( = ?auto_301604 ?auto_301605 ) ) ( not ( = ?auto_301604 ?auto_301607 ) ) ( not ( = ?auto_301604 ?auto_301608 ) ) ( not ( = ?auto_301606 ?auto_301605 ) ) ( not ( = ?auto_301606 ?auto_301607 ) ) ( not ( = ?auto_301606 ?auto_301608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301605 ?auto_301607 ?auto_301608 )
      ( MAKE-8CRATE-VERIFY ?auto_301601 ?auto_301602 ?auto_301603 ?auto_301600 ?auto_301604 ?auto_301606 ?auto_301605 ?auto_301607 ?auto_301608 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301677 - SURFACE
      ?auto_301678 - SURFACE
      ?auto_301679 - SURFACE
      ?auto_301676 - SURFACE
      ?auto_301680 - SURFACE
      ?auto_301682 - SURFACE
      ?auto_301681 - SURFACE
      ?auto_301683 - SURFACE
      ?auto_301684 - SURFACE
    )
    :vars
    (
      ?auto_301685 - HOIST
      ?auto_301687 - PLACE
      ?auto_301686 - TRUCK
      ?auto_301688 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_301685 ?auto_301687 ) ( SURFACE-AT ?auto_301683 ?auto_301687 ) ( CLEAR ?auto_301683 ) ( IS-CRATE ?auto_301684 ) ( not ( = ?auto_301683 ?auto_301684 ) ) ( AVAILABLE ?auto_301685 ) ( IN ?auto_301684 ?auto_301686 ) ( ON ?auto_301683 ?auto_301681 ) ( not ( = ?auto_301681 ?auto_301683 ) ) ( not ( = ?auto_301681 ?auto_301684 ) ) ( TRUCK-AT ?auto_301686 ?auto_301688 ) ( not ( = ?auto_301688 ?auto_301687 ) ) ( ON ?auto_301678 ?auto_301677 ) ( ON ?auto_301679 ?auto_301678 ) ( ON ?auto_301676 ?auto_301679 ) ( ON ?auto_301680 ?auto_301676 ) ( ON ?auto_301682 ?auto_301680 ) ( ON ?auto_301681 ?auto_301682 ) ( not ( = ?auto_301677 ?auto_301678 ) ) ( not ( = ?auto_301677 ?auto_301679 ) ) ( not ( = ?auto_301677 ?auto_301676 ) ) ( not ( = ?auto_301677 ?auto_301680 ) ) ( not ( = ?auto_301677 ?auto_301682 ) ) ( not ( = ?auto_301677 ?auto_301681 ) ) ( not ( = ?auto_301677 ?auto_301683 ) ) ( not ( = ?auto_301677 ?auto_301684 ) ) ( not ( = ?auto_301678 ?auto_301679 ) ) ( not ( = ?auto_301678 ?auto_301676 ) ) ( not ( = ?auto_301678 ?auto_301680 ) ) ( not ( = ?auto_301678 ?auto_301682 ) ) ( not ( = ?auto_301678 ?auto_301681 ) ) ( not ( = ?auto_301678 ?auto_301683 ) ) ( not ( = ?auto_301678 ?auto_301684 ) ) ( not ( = ?auto_301679 ?auto_301676 ) ) ( not ( = ?auto_301679 ?auto_301680 ) ) ( not ( = ?auto_301679 ?auto_301682 ) ) ( not ( = ?auto_301679 ?auto_301681 ) ) ( not ( = ?auto_301679 ?auto_301683 ) ) ( not ( = ?auto_301679 ?auto_301684 ) ) ( not ( = ?auto_301676 ?auto_301680 ) ) ( not ( = ?auto_301676 ?auto_301682 ) ) ( not ( = ?auto_301676 ?auto_301681 ) ) ( not ( = ?auto_301676 ?auto_301683 ) ) ( not ( = ?auto_301676 ?auto_301684 ) ) ( not ( = ?auto_301680 ?auto_301682 ) ) ( not ( = ?auto_301680 ?auto_301681 ) ) ( not ( = ?auto_301680 ?auto_301683 ) ) ( not ( = ?auto_301680 ?auto_301684 ) ) ( not ( = ?auto_301682 ?auto_301681 ) ) ( not ( = ?auto_301682 ?auto_301683 ) ) ( not ( = ?auto_301682 ?auto_301684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301681 ?auto_301683 ?auto_301684 )
      ( MAKE-8CRATE-VERIFY ?auto_301677 ?auto_301678 ?auto_301679 ?auto_301676 ?auto_301680 ?auto_301682 ?auto_301681 ?auto_301683 ?auto_301684 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301761 - SURFACE
      ?auto_301762 - SURFACE
      ?auto_301763 - SURFACE
      ?auto_301760 - SURFACE
      ?auto_301764 - SURFACE
      ?auto_301766 - SURFACE
      ?auto_301765 - SURFACE
      ?auto_301767 - SURFACE
      ?auto_301768 - SURFACE
    )
    :vars
    (
      ?auto_301772 - HOIST
      ?auto_301770 - PLACE
      ?auto_301771 - TRUCK
      ?auto_301769 - PLACE
      ?auto_301773 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_301772 ?auto_301770 ) ( SURFACE-AT ?auto_301767 ?auto_301770 ) ( CLEAR ?auto_301767 ) ( IS-CRATE ?auto_301768 ) ( not ( = ?auto_301767 ?auto_301768 ) ) ( AVAILABLE ?auto_301772 ) ( ON ?auto_301767 ?auto_301765 ) ( not ( = ?auto_301765 ?auto_301767 ) ) ( not ( = ?auto_301765 ?auto_301768 ) ) ( TRUCK-AT ?auto_301771 ?auto_301769 ) ( not ( = ?auto_301769 ?auto_301770 ) ) ( HOIST-AT ?auto_301773 ?auto_301769 ) ( LIFTING ?auto_301773 ?auto_301768 ) ( not ( = ?auto_301772 ?auto_301773 ) ) ( ON ?auto_301762 ?auto_301761 ) ( ON ?auto_301763 ?auto_301762 ) ( ON ?auto_301760 ?auto_301763 ) ( ON ?auto_301764 ?auto_301760 ) ( ON ?auto_301766 ?auto_301764 ) ( ON ?auto_301765 ?auto_301766 ) ( not ( = ?auto_301761 ?auto_301762 ) ) ( not ( = ?auto_301761 ?auto_301763 ) ) ( not ( = ?auto_301761 ?auto_301760 ) ) ( not ( = ?auto_301761 ?auto_301764 ) ) ( not ( = ?auto_301761 ?auto_301766 ) ) ( not ( = ?auto_301761 ?auto_301765 ) ) ( not ( = ?auto_301761 ?auto_301767 ) ) ( not ( = ?auto_301761 ?auto_301768 ) ) ( not ( = ?auto_301762 ?auto_301763 ) ) ( not ( = ?auto_301762 ?auto_301760 ) ) ( not ( = ?auto_301762 ?auto_301764 ) ) ( not ( = ?auto_301762 ?auto_301766 ) ) ( not ( = ?auto_301762 ?auto_301765 ) ) ( not ( = ?auto_301762 ?auto_301767 ) ) ( not ( = ?auto_301762 ?auto_301768 ) ) ( not ( = ?auto_301763 ?auto_301760 ) ) ( not ( = ?auto_301763 ?auto_301764 ) ) ( not ( = ?auto_301763 ?auto_301766 ) ) ( not ( = ?auto_301763 ?auto_301765 ) ) ( not ( = ?auto_301763 ?auto_301767 ) ) ( not ( = ?auto_301763 ?auto_301768 ) ) ( not ( = ?auto_301760 ?auto_301764 ) ) ( not ( = ?auto_301760 ?auto_301766 ) ) ( not ( = ?auto_301760 ?auto_301765 ) ) ( not ( = ?auto_301760 ?auto_301767 ) ) ( not ( = ?auto_301760 ?auto_301768 ) ) ( not ( = ?auto_301764 ?auto_301766 ) ) ( not ( = ?auto_301764 ?auto_301765 ) ) ( not ( = ?auto_301764 ?auto_301767 ) ) ( not ( = ?auto_301764 ?auto_301768 ) ) ( not ( = ?auto_301766 ?auto_301765 ) ) ( not ( = ?auto_301766 ?auto_301767 ) ) ( not ( = ?auto_301766 ?auto_301768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301765 ?auto_301767 ?auto_301768 )
      ( MAKE-8CRATE-VERIFY ?auto_301761 ?auto_301762 ?auto_301763 ?auto_301760 ?auto_301764 ?auto_301766 ?auto_301765 ?auto_301767 ?auto_301768 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301853 - SURFACE
      ?auto_301854 - SURFACE
      ?auto_301855 - SURFACE
      ?auto_301852 - SURFACE
      ?auto_301856 - SURFACE
      ?auto_301858 - SURFACE
      ?auto_301857 - SURFACE
      ?auto_301859 - SURFACE
      ?auto_301860 - SURFACE
    )
    :vars
    (
      ?auto_301866 - HOIST
      ?auto_301861 - PLACE
      ?auto_301863 - TRUCK
      ?auto_301865 - PLACE
      ?auto_301864 - HOIST
      ?auto_301862 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_301866 ?auto_301861 ) ( SURFACE-AT ?auto_301859 ?auto_301861 ) ( CLEAR ?auto_301859 ) ( IS-CRATE ?auto_301860 ) ( not ( = ?auto_301859 ?auto_301860 ) ) ( AVAILABLE ?auto_301866 ) ( ON ?auto_301859 ?auto_301857 ) ( not ( = ?auto_301857 ?auto_301859 ) ) ( not ( = ?auto_301857 ?auto_301860 ) ) ( TRUCK-AT ?auto_301863 ?auto_301865 ) ( not ( = ?auto_301865 ?auto_301861 ) ) ( HOIST-AT ?auto_301864 ?auto_301865 ) ( not ( = ?auto_301866 ?auto_301864 ) ) ( AVAILABLE ?auto_301864 ) ( SURFACE-AT ?auto_301860 ?auto_301865 ) ( ON ?auto_301860 ?auto_301862 ) ( CLEAR ?auto_301860 ) ( not ( = ?auto_301859 ?auto_301862 ) ) ( not ( = ?auto_301860 ?auto_301862 ) ) ( not ( = ?auto_301857 ?auto_301862 ) ) ( ON ?auto_301854 ?auto_301853 ) ( ON ?auto_301855 ?auto_301854 ) ( ON ?auto_301852 ?auto_301855 ) ( ON ?auto_301856 ?auto_301852 ) ( ON ?auto_301858 ?auto_301856 ) ( ON ?auto_301857 ?auto_301858 ) ( not ( = ?auto_301853 ?auto_301854 ) ) ( not ( = ?auto_301853 ?auto_301855 ) ) ( not ( = ?auto_301853 ?auto_301852 ) ) ( not ( = ?auto_301853 ?auto_301856 ) ) ( not ( = ?auto_301853 ?auto_301858 ) ) ( not ( = ?auto_301853 ?auto_301857 ) ) ( not ( = ?auto_301853 ?auto_301859 ) ) ( not ( = ?auto_301853 ?auto_301860 ) ) ( not ( = ?auto_301853 ?auto_301862 ) ) ( not ( = ?auto_301854 ?auto_301855 ) ) ( not ( = ?auto_301854 ?auto_301852 ) ) ( not ( = ?auto_301854 ?auto_301856 ) ) ( not ( = ?auto_301854 ?auto_301858 ) ) ( not ( = ?auto_301854 ?auto_301857 ) ) ( not ( = ?auto_301854 ?auto_301859 ) ) ( not ( = ?auto_301854 ?auto_301860 ) ) ( not ( = ?auto_301854 ?auto_301862 ) ) ( not ( = ?auto_301855 ?auto_301852 ) ) ( not ( = ?auto_301855 ?auto_301856 ) ) ( not ( = ?auto_301855 ?auto_301858 ) ) ( not ( = ?auto_301855 ?auto_301857 ) ) ( not ( = ?auto_301855 ?auto_301859 ) ) ( not ( = ?auto_301855 ?auto_301860 ) ) ( not ( = ?auto_301855 ?auto_301862 ) ) ( not ( = ?auto_301852 ?auto_301856 ) ) ( not ( = ?auto_301852 ?auto_301858 ) ) ( not ( = ?auto_301852 ?auto_301857 ) ) ( not ( = ?auto_301852 ?auto_301859 ) ) ( not ( = ?auto_301852 ?auto_301860 ) ) ( not ( = ?auto_301852 ?auto_301862 ) ) ( not ( = ?auto_301856 ?auto_301858 ) ) ( not ( = ?auto_301856 ?auto_301857 ) ) ( not ( = ?auto_301856 ?auto_301859 ) ) ( not ( = ?auto_301856 ?auto_301860 ) ) ( not ( = ?auto_301856 ?auto_301862 ) ) ( not ( = ?auto_301858 ?auto_301857 ) ) ( not ( = ?auto_301858 ?auto_301859 ) ) ( not ( = ?auto_301858 ?auto_301860 ) ) ( not ( = ?auto_301858 ?auto_301862 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301857 ?auto_301859 ?auto_301860 )
      ( MAKE-8CRATE-VERIFY ?auto_301853 ?auto_301854 ?auto_301855 ?auto_301852 ?auto_301856 ?auto_301858 ?auto_301857 ?auto_301859 ?auto_301860 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301946 - SURFACE
      ?auto_301947 - SURFACE
      ?auto_301948 - SURFACE
      ?auto_301945 - SURFACE
      ?auto_301949 - SURFACE
      ?auto_301951 - SURFACE
      ?auto_301950 - SURFACE
      ?auto_301952 - SURFACE
      ?auto_301953 - SURFACE
    )
    :vars
    (
      ?auto_301958 - HOIST
      ?auto_301956 - PLACE
      ?auto_301955 - PLACE
      ?auto_301957 - HOIST
      ?auto_301959 - SURFACE
      ?auto_301954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_301958 ?auto_301956 ) ( SURFACE-AT ?auto_301952 ?auto_301956 ) ( CLEAR ?auto_301952 ) ( IS-CRATE ?auto_301953 ) ( not ( = ?auto_301952 ?auto_301953 ) ) ( AVAILABLE ?auto_301958 ) ( ON ?auto_301952 ?auto_301950 ) ( not ( = ?auto_301950 ?auto_301952 ) ) ( not ( = ?auto_301950 ?auto_301953 ) ) ( not ( = ?auto_301955 ?auto_301956 ) ) ( HOIST-AT ?auto_301957 ?auto_301955 ) ( not ( = ?auto_301958 ?auto_301957 ) ) ( AVAILABLE ?auto_301957 ) ( SURFACE-AT ?auto_301953 ?auto_301955 ) ( ON ?auto_301953 ?auto_301959 ) ( CLEAR ?auto_301953 ) ( not ( = ?auto_301952 ?auto_301959 ) ) ( not ( = ?auto_301953 ?auto_301959 ) ) ( not ( = ?auto_301950 ?auto_301959 ) ) ( TRUCK-AT ?auto_301954 ?auto_301956 ) ( ON ?auto_301947 ?auto_301946 ) ( ON ?auto_301948 ?auto_301947 ) ( ON ?auto_301945 ?auto_301948 ) ( ON ?auto_301949 ?auto_301945 ) ( ON ?auto_301951 ?auto_301949 ) ( ON ?auto_301950 ?auto_301951 ) ( not ( = ?auto_301946 ?auto_301947 ) ) ( not ( = ?auto_301946 ?auto_301948 ) ) ( not ( = ?auto_301946 ?auto_301945 ) ) ( not ( = ?auto_301946 ?auto_301949 ) ) ( not ( = ?auto_301946 ?auto_301951 ) ) ( not ( = ?auto_301946 ?auto_301950 ) ) ( not ( = ?auto_301946 ?auto_301952 ) ) ( not ( = ?auto_301946 ?auto_301953 ) ) ( not ( = ?auto_301946 ?auto_301959 ) ) ( not ( = ?auto_301947 ?auto_301948 ) ) ( not ( = ?auto_301947 ?auto_301945 ) ) ( not ( = ?auto_301947 ?auto_301949 ) ) ( not ( = ?auto_301947 ?auto_301951 ) ) ( not ( = ?auto_301947 ?auto_301950 ) ) ( not ( = ?auto_301947 ?auto_301952 ) ) ( not ( = ?auto_301947 ?auto_301953 ) ) ( not ( = ?auto_301947 ?auto_301959 ) ) ( not ( = ?auto_301948 ?auto_301945 ) ) ( not ( = ?auto_301948 ?auto_301949 ) ) ( not ( = ?auto_301948 ?auto_301951 ) ) ( not ( = ?auto_301948 ?auto_301950 ) ) ( not ( = ?auto_301948 ?auto_301952 ) ) ( not ( = ?auto_301948 ?auto_301953 ) ) ( not ( = ?auto_301948 ?auto_301959 ) ) ( not ( = ?auto_301945 ?auto_301949 ) ) ( not ( = ?auto_301945 ?auto_301951 ) ) ( not ( = ?auto_301945 ?auto_301950 ) ) ( not ( = ?auto_301945 ?auto_301952 ) ) ( not ( = ?auto_301945 ?auto_301953 ) ) ( not ( = ?auto_301945 ?auto_301959 ) ) ( not ( = ?auto_301949 ?auto_301951 ) ) ( not ( = ?auto_301949 ?auto_301950 ) ) ( not ( = ?auto_301949 ?auto_301952 ) ) ( not ( = ?auto_301949 ?auto_301953 ) ) ( not ( = ?auto_301949 ?auto_301959 ) ) ( not ( = ?auto_301951 ?auto_301950 ) ) ( not ( = ?auto_301951 ?auto_301952 ) ) ( not ( = ?auto_301951 ?auto_301953 ) ) ( not ( = ?auto_301951 ?auto_301959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301950 ?auto_301952 ?auto_301953 )
      ( MAKE-8CRATE-VERIFY ?auto_301946 ?auto_301947 ?auto_301948 ?auto_301945 ?auto_301949 ?auto_301951 ?auto_301950 ?auto_301952 ?auto_301953 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_302039 - SURFACE
      ?auto_302040 - SURFACE
      ?auto_302041 - SURFACE
      ?auto_302038 - SURFACE
      ?auto_302042 - SURFACE
      ?auto_302044 - SURFACE
      ?auto_302043 - SURFACE
      ?auto_302045 - SURFACE
      ?auto_302046 - SURFACE
    )
    :vars
    (
      ?auto_302052 - HOIST
      ?auto_302048 - PLACE
      ?auto_302047 - PLACE
      ?auto_302051 - HOIST
      ?auto_302050 - SURFACE
      ?auto_302049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302052 ?auto_302048 ) ( IS-CRATE ?auto_302046 ) ( not ( = ?auto_302045 ?auto_302046 ) ) ( not ( = ?auto_302043 ?auto_302045 ) ) ( not ( = ?auto_302043 ?auto_302046 ) ) ( not ( = ?auto_302047 ?auto_302048 ) ) ( HOIST-AT ?auto_302051 ?auto_302047 ) ( not ( = ?auto_302052 ?auto_302051 ) ) ( AVAILABLE ?auto_302051 ) ( SURFACE-AT ?auto_302046 ?auto_302047 ) ( ON ?auto_302046 ?auto_302050 ) ( CLEAR ?auto_302046 ) ( not ( = ?auto_302045 ?auto_302050 ) ) ( not ( = ?auto_302046 ?auto_302050 ) ) ( not ( = ?auto_302043 ?auto_302050 ) ) ( TRUCK-AT ?auto_302049 ?auto_302048 ) ( SURFACE-AT ?auto_302043 ?auto_302048 ) ( CLEAR ?auto_302043 ) ( LIFTING ?auto_302052 ?auto_302045 ) ( IS-CRATE ?auto_302045 ) ( ON ?auto_302040 ?auto_302039 ) ( ON ?auto_302041 ?auto_302040 ) ( ON ?auto_302038 ?auto_302041 ) ( ON ?auto_302042 ?auto_302038 ) ( ON ?auto_302044 ?auto_302042 ) ( ON ?auto_302043 ?auto_302044 ) ( not ( = ?auto_302039 ?auto_302040 ) ) ( not ( = ?auto_302039 ?auto_302041 ) ) ( not ( = ?auto_302039 ?auto_302038 ) ) ( not ( = ?auto_302039 ?auto_302042 ) ) ( not ( = ?auto_302039 ?auto_302044 ) ) ( not ( = ?auto_302039 ?auto_302043 ) ) ( not ( = ?auto_302039 ?auto_302045 ) ) ( not ( = ?auto_302039 ?auto_302046 ) ) ( not ( = ?auto_302039 ?auto_302050 ) ) ( not ( = ?auto_302040 ?auto_302041 ) ) ( not ( = ?auto_302040 ?auto_302038 ) ) ( not ( = ?auto_302040 ?auto_302042 ) ) ( not ( = ?auto_302040 ?auto_302044 ) ) ( not ( = ?auto_302040 ?auto_302043 ) ) ( not ( = ?auto_302040 ?auto_302045 ) ) ( not ( = ?auto_302040 ?auto_302046 ) ) ( not ( = ?auto_302040 ?auto_302050 ) ) ( not ( = ?auto_302041 ?auto_302038 ) ) ( not ( = ?auto_302041 ?auto_302042 ) ) ( not ( = ?auto_302041 ?auto_302044 ) ) ( not ( = ?auto_302041 ?auto_302043 ) ) ( not ( = ?auto_302041 ?auto_302045 ) ) ( not ( = ?auto_302041 ?auto_302046 ) ) ( not ( = ?auto_302041 ?auto_302050 ) ) ( not ( = ?auto_302038 ?auto_302042 ) ) ( not ( = ?auto_302038 ?auto_302044 ) ) ( not ( = ?auto_302038 ?auto_302043 ) ) ( not ( = ?auto_302038 ?auto_302045 ) ) ( not ( = ?auto_302038 ?auto_302046 ) ) ( not ( = ?auto_302038 ?auto_302050 ) ) ( not ( = ?auto_302042 ?auto_302044 ) ) ( not ( = ?auto_302042 ?auto_302043 ) ) ( not ( = ?auto_302042 ?auto_302045 ) ) ( not ( = ?auto_302042 ?auto_302046 ) ) ( not ( = ?auto_302042 ?auto_302050 ) ) ( not ( = ?auto_302044 ?auto_302043 ) ) ( not ( = ?auto_302044 ?auto_302045 ) ) ( not ( = ?auto_302044 ?auto_302046 ) ) ( not ( = ?auto_302044 ?auto_302050 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302043 ?auto_302045 ?auto_302046 )
      ( MAKE-8CRATE-VERIFY ?auto_302039 ?auto_302040 ?auto_302041 ?auto_302038 ?auto_302042 ?auto_302044 ?auto_302043 ?auto_302045 ?auto_302046 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_302132 - SURFACE
      ?auto_302133 - SURFACE
      ?auto_302134 - SURFACE
      ?auto_302131 - SURFACE
      ?auto_302135 - SURFACE
      ?auto_302137 - SURFACE
      ?auto_302136 - SURFACE
      ?auto_302138 - SURFACE
      ?auto_302139 - SURFACE
    )
    :vars
    (
      ?auto_302142 - HOIST
      ?auto_302145 - PLACE
      ?auto_302144 - PLACE
      ?auto_302140 - HOIST
      ?auto_302143 - SURFACE
      ?auto_302141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302142 ?auto_302145 ) ( IS-CRATE ?auto_302139 ) ( not ( = ?auto_302138 ?auto_302139 ) ) ( not ( = ?auto_302136 ?auto_302138 ) ) ( not ( = ?auto_302136 ?auto_302139 ) ) ( not ( = ?auto_302144 ?auto_302145 ) ) ( HOIST-AT ?auto_302140 ?auto_302144 ) ( not ( = ?auto_302142 ?auto_302140 ) ) ( AVAILABLE ?auto_302140 ) ( SURFACE-AT ?auto_302139 ?auto_302144 ) ( ON ?auto_302139 ?auto_302143 ) ( CLEAR ?auto_302139 ) ( not ( = ?auto_302138 ?auto_302143 ) ) ( not ( = ?auto_302139 ?auto_302143 ) ) ( not ( = ?auto_302136 ?auto_302143 ) ) ( TRUCK-AT ?auto_302141 ?auto_302145 ) ( SURFACE-AT ?auto_302136 ?auto_302145 ) ( CLEAR ?auto_302136 ) ( IS-CRATE ?auto_302138 ) ( AVAILABLE ?auto_302142 ) ( IN ?auto_302138 ?auto_302141 ) ( ON ?auto_302133 ?auto_302132 ) ( ON ?auto_302134 ?auto_302133 ) ( ON ?auto_302131 ?auto_302134 ) ( ON ?auto_302135 ?auto_302131 ) ( ON ?auto_302137 ?auto_302135 ) ( ON ?auto_302136 ?auto_302137 ) ( not ( = ?auto_302132 ?auto_302133 ) ) ( not ( = ?auto_302132 ?auto_302134 ) ) ( not ( = ?auto_302132 ?auto_302131 ) ) ( not ( = ?auto_302132 ?auto_302135 ) ) ( not ( = ?auto_302132 ?auto_302137 ) ) ( not ( = ?auto_302132 ?auto_302136 ) ) ( not ( = ?auto_302132 ?auto_302138 ) ) ( not ( = ?auto_302132 ?auto_302139 ) ) ( not ( = ?auto_302132 ?auto_302143 ) ) ( not ( = ?auto_302133 ?auto_302134 ) ) ( not ( = ?auto_302133 ?auto_302131 ) ) ( not ( = ?auto_302133 ?auto_302135 ) ) ( not ( = ?auto_302133 ?auto_302137 ) ) ( not ( = ?auto_302133 ?auto_302136 ) ) ( not ( = ?auto_302133 ?auto_302138 ) ) ( not ( = ?auto_302133 ?auto_302139 ) ) ( not ( = ?auto_302133 ?auto_302143 ) ) ( not ( = ?auto_302134 ?auto_302131 ) ) ( not ( = ?auto_302134 ?auto_302135 ) ) ( not ( = ?auto_302134 ?auto_302137 ) ) ( not ( = ?auto_302134 ?auto_302136 ) ) ( not ( = ?auto_302134 ?auto_302138 ) ) ( not ( = ?auto_302134 ?auto_302139 ) ) ( not ( = ?auto_302134 ?auto_302143 ) ) ( not ( = ?auto_302131 ?auto_302135 ) ) ( not ( = ?auto_302131 ?auto_302137 ) ) ( not ( = ?auto_302131 ?auto_302136 ) ) ( not ( = ?auto_302131 ?auto_302138 ) ) ( not ( = ?auto_302131 ?auto_302139 ) ) ( not ( = ?auto_302131 ?auto_302143 ) ) ( not ( = ?auto_302135 ?auto_302137 ) ) ( not ( = ?auto_302135 ?auto_302136 ) ) ( not ( = ?auto_302135 ?auto_302138 ) ) ( not ( = ?auto_302135 ?auto_302139 ) ) ( not ( = ?auto_302135 ?auto_302143 ) ) ( not ( = ?auto_302137 ?auto_302136 ) ) ( not ( = ?auto_302137 ?auto_302138 ) ) ( not ( = ?auto_302137 ?auto_302139 ) ) ( not ( = ?auto_302137 ?auto_302143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302136 ?auto_302138 ?auto_302139 )
      ( MAKE-8CRATE-VERIFY ?auto_302132 ?auto_302133 ?auto_302134 ?auto_302131 ?auto_302135 ?auto_302137 ?auto_302136 ?auto_302138 ?auto_302139 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_302146 - SURFACE
      ?auto_302147 - SURFACE
    )
    :vars
    (
      ?auto_302150 - HOIST
      ?auto_302153 - PLACE
      ?auto_302154 - SURFACE
      ?auto_302152 - PLACE
      ?auto_302148 - HOIST
      ?auto_302151 - SURFACE
      ?auto_302149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302150 ?auto_302153 ) ( IS-CRATE ?auto_302147 ) ( not ( = ?auto_302146 ?auto_302147 ) ) ( not ( = ?auto_302154 ?auto_302146 ) ) ( not ( = ?auto_302154 ?auto_302147 ) ) ( not ( = ?auto_302152 ?auto_302153 ) ) ( HOIST-AT ?auto_302148 ?auto_302152 ) ( not ( = ?auto_302150 ?auto_302148 ) ) ( AVAILABLE ?auto_302148 ) ( SURFACE-AT ?auto_302147 ?auto_302152 ) ( ON ?auto_302147 ?auto_302151 ) ( CLEAR ?auto_302147 ) ( not ( = ?auto_302146 ?auto_302151 ) ) ( not ( = ?auto_302147 ?auto_302151 ) ) ( not ( = ?auto_302154 ?auto_302151 ) ) ( SURFACE-AT ?auto_302154 ?auto_302153 ) ( CLEAR ?auto_302154 ) ( IS-CRATE ?auto_302146 ) ( AVAILABLE ?auto_302150 ) ( IN ?auto_302146 ?auto_302149 ) ( TRUCK-AT ?auto_302149 ?auto_302152 ) )
    :subtasks
    ( ( !DRIVE ?auto_302149 ?auto_302152 ?auto_302153 )
      ( MAKE-2CRATE ?auto_302154 ?auto_302146 ?auto_302147 )
      ( MAKE-1CRATE-VERIFY ?auto_302146 ?auto_302147 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_302155 - SURFACE
      ?auto_302156 - SURFACE
      ?auto_302157 - SURFACE
    )
    :vars
    (
      ?auto_302162 - HOIST
      ?auto_302158 - PLACE
      ?auto_302163 - PLACE
      ?auto_302160 - HOIST
      ?auto_302159 - SURFACE
      ?auto_302161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302162 ?auto_302158 ) ( IS-CRATE ?auto_302157 ) ( not ( = ?auto_302156 ?auto_302157 ) ) ( not ( = ?auto_302155 ?auto_302156 ) ) ( not ( = ?auto_302155 ?auto_302157 ) ) ( not ( = ?auto_302163 ?auto_302158 ) ) ( HOIST-AT ?auto_302160 ?auto_302163 ) ( not ( = ?auto_302162 ?auto_302160 ) ) ( AVAILABLE ?auto_302160 ) ( SURFACE-AT ?auto_302157 ?auto_302163 ) ( ON ?auto_302157 ?auto_302159 ) ( CLEAR ?auto_302157 ) ( not ( = ?auto_302156 ?auto_302159 ) ) ( not ( = ?auto_302157 ?auto_302159 ) ) ( not ( = ?auto_302155 ?auto_302159 ) ) ( SURFACE-AT ?auto_302155 ?auto_302158 ) ( CLEAR ?auto_302155 ) ( IS-CRATE ?auto_302156 ) ( AVAILABLE ?auto_302162 ) ( IN ?auto_302156 ?auto_302161 ) ( TRUCK-AT ?auto_302161 ?auto_302163 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_302156 ?auto_302157 )
      ( MAKE-2CRATE-VERIFY ?auto_302155 ?auto_302156 ?auto_302157 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_302165 - SURFACE
      ?auto_302166 - SURFACE
      ?auto_302167 - SURFACE
      ?auto_302164 - SURFACE
    )
    :vars
    (
      ?auto_302172 - HOIST
      ?auto_302169 - PLACE
      ?auto_302170 - PLACE
      ?auto_302171 - HOIST
      ?auto_302168 - SURFACE
      ?auto_302173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302172 ?auto_302169 ) ( IS-CRATE ?auto_302164 ) ( not ( = ?auto_302167 ?auto_302164 ) ) ( not ( = ?auto_302166 ?auto_302167 ) ) ( not ( = ?auto_302166 ?auto_302164 ) ) ( not ( = ?auto_302170 ?auto_302169 ) ) ( HOIST-AT ?auto_302171 ?auto_302170 ) ( not ( = ?auto_302172 ?auto_302171 ) ) ( AVAILABLE ?auto_302171 ) ( SURFACE-AT ?auto_302164 ?auto_302170 ) ( ON ?auto_302164 ?auto_302168 ) ( CLEAR ?auto_302164 ) ( not ( = ?auto_302167 ?auto_302168 ) ) ( not ( = ?auto_302164 ?auto_302168 ) ) ( not ( = ?auto_302166 ?auto_302168 ) ) ( SURFACE-AT ?auto_302166 ?auto_302169 ) ( CLEAR ?auto_302166 ) ( IS-CRATE ?auto_302167 ) ( AVAILABLE ?auto_302172 ) ( IN ?auto_302167 ?auto_302173 ) ( TRUCK-AT ?auto_302173 ?auto_302170 ) ( ON ?auto_302166 ?auto_302165 ) ( not ( = ?auto_302165 ?auto_302166 ) ) ( not ( = ?auto_302165 ?auto_302167 ) ) ( not ( = ?auto_302165 ?auto_302164 ) ) ( not ( = ?auto_302165 ?auto_302168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302166 ?auto_302167 ?auto_302164 )
      ( MAKE-3CRATE-VERIFY ?auto_302165 ?auto_302166 ?auto_302167 ?auto_302164 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_302175 - SURFACE
      ?auto_302176 - SURFACE
      ?auto_302177 - SURFACE
      ?auto_302174 - SURFACE
      ?auto_302178 - SURFACE
    )
    :vars
    (
      ?auto_302183 - HOIST
      ?auto_302180 - PLACE
      ?auto_302181 - PLACE
      ?auto_302182 - HOIST
      ?auto_302179 - SURFACE
      ?auto_302184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302183 ?auto_302180 ) ( IS-CRATE ?auto_302178 ) ( not ( = ?auto_302174 ?auto_302178 ) ) ( not ( = ?auto_302177 ?auto_302174 ) ) ( not ( = ?auto_302177 ?auto_302178 ) ) ( not ( = ?auto_302181 ?auto_302180 ) ) ( HOIST-AT ?auto_302182 ?auto_302181 ) ( not ( = ?auto_302183 ?auto_302182 ) ) ( AVAILABLE ?auto_302182 ) ( SURFACE-AT ?auto_302178 ?auto_302181 ) ( ON ?auto_302178 ?auto_302179 ) ( CLEAR ?auto_302178 ) ( not ( = ?auto_302174 ?auto_302179 ) ) ( not ( = ?auto_302178 ?auto_302179 ) ) ( not ( = ?auto_302177 ?auto_302179 ) ) ( SURFACE-AT ?auto_302177 ?auto_302180 ) ( CLEAR ?auto_302177 ) ( IS-CRATE ?auto_302174 ) ( AVAILABLE ?auto_302183 ) ( IN ?auto_302174 ?auto_302184 ) ( TRUCK-AT ?auto_302184 ?auto_302181 ) ( ON ?auto_302176 ?auto_302175 ) ( ON ?auto_302177 ?auto_302176 ) ( not ( = ?auto_302175 ?auto_302176 ) ) ( not ( = ?auto_302175 ?auto_302177 ) ) ( not ( = ?auto_302175 ?auto_302174 ) ) ( not ( = ?auto_302175 ?auto_302178 ) ) ( not ( = ?auto_302175 ?auto_302179 ) ) ( not ( = ?auto_302176 ?auto_302177 ) ) ( not ( = ?auto_302176 ?auto_302174 ) ) ( not ( = ?auto_302176 ?auto_302178 ) ) ( not ( = ?auto_302176 ?auto_302179 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302177 ?auto_302174 ?auto_302178 )
      ( MAKE-4CRATE-VERIFY ?auto_302175 ?auto_302176 ?auto_302177 ?auto_302174 ?auto_302178 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_302186 - SURFACE
      ?auto_302187 - SURFACE
      ?auto_302188 - SURFACE
      ?auto_302185 - SURFACE
      ?auto_302189 - SURFACE
      ?auto_302190 - SURFACE
    )
    :vars
    (
      ?auto_302195 - HOIST
      ?auto_302192 - PLACE
      ?auto_302193 - PLACE
      ?auto_302194 - HOIST
      ?auto_302191 - SURFACE
      ?auto_302196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302195 ?auto_302192 ) ( IS-CRATE ?auto_302190 ) ( not ( = ?auto_302189 ?auto_302190 ) ) ( not ( = ?auto_302185 ?auto_302189 ) ) ( not ( = ?auto_302185 ?auto_302190 ) ) ( not ( = ?auto_302193 ?auto_302192 ) ) ( HOIST-AT ?auto_302194 ?auto_302193 ) ( not ( = ?auto_302195 ?auto_302194 ) ) ( AVAILABLE ?auto_302194 ) ( SURFACE-AT ?auto_302190 ?auto_302193 ) ( ON ?auto_302190 ?auto_302191 ) ( CLEAR ?auto_302190 ) ( not ( = ?auto_302189 ?auto_302191 ) ) ( not ( = ?auto_302190 ?auto_302191 ) ) ( not ( = ?auto_302185 ?auto_302191 ) ) ( SURFACE-AT ?auto_302185 ?auto_302192 ) ( CLEAR ?auto_302185 ) ( IS-CRATE ?auto_302189 ) ( AVAILABLE ?auto_302195 ) ( IN ?auto_302189 ?auto_302196 ) ( TRUCK-AT ?auto_302196 ?auto_302193 ) ( ON ?auto_302187 ?auto_302186 ) ( ON ?auto_302188 ?auto_302187 ) ( ON ?auto_302185 ?auto_302188 ) ( not ( = ?auto_302186 ?auto_302187 ) ) ( not ( = ?auto_302186 ?auto_302188 ) ) ( not ( = ?auto_302186 ?auto_302185 ) ) ( not ( = ?auto_302186 ?auto_302189 ) ) ( not ( = ?auto_302186 ?auto_302190 ) ) ( not ( = ?auto_302186 ?auto_302191 ) ) ( not ( = ?auto_302187 ?auto_302188 ) ) ( not ( = ?auto_302187 ?auto_302185 ) ) ( not ( = ?auto_302187 ?auto_302189 ) ) ( not ( = ?auto_302187 ?auto_302190 ) ) ( not ( = ?auto_302187 ?auto_302191 ) ) ( not ( = ?auto_302188 ?auto_302185 ) ) ( not ( = ?auto_302188 ?auto_302189 ) ) ( not ( = ?auto_302188 ?auto_302190 ) ) ( not ( = ?auto_302188 ?auto_302191 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302185 ?auto_302189 ?auto_302190 )
      ( MAKE-5CRATE-VERIFY ?auto_302186 ?auto_302187 ?auto_302188 ?auto_302185 ?auto_302189 ?auto_302190 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_302198 - SURFACE
      ?auto_302199 - SURFACE
      ?auto_302200 - SURFACE
      ?auto_302197 - SURFACE
      ?auto_302201 - SURFACE
      ?auto_302203 - SURFACE
      ?auto_302202 - SURFACE
    )
    :vars
    (
      ?auto_302208 - HOIST
      ?auto_302205 - PLACE
      ?auto_302206 - PLACE
      ?auto_302207 - HOIST
      ?auto_302204 - SURFACE
      ?auto_302209 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302208 ?auto_302205 ) ( IS-CRATE ?auto_302202 ) ( not ( = ?auto_302203 ?auto_302202 ) ) ( not ( = ?auto_302201 ?auto_302203 ) ) ( not ( = ?auto_302201 ?auto_302202 ) ) ( not ( = ?auto_302206 ?auto_302205 ) ) ( HOIST-AT ?auto_302207 ?auto_302206 ) ( not ( = ?auto_302208 ?auto_302207 ) ) ( AVAILABLE ?auto_302207 ) ( SURFACE-AT ?auto_302202 ?auto_302206 ) ( ON ?auto_302202 ?auto_302204 ) ( CLEAR ?auto_302202 ) ( not ( = ?auto_302203 ?auto_302204 ) ) ( not ( = ?auto_302202 ?auto_302204 ) ) ( not ( = ?auto_302201 ?auto_302204 ) ) ( SURFACE-AT ?auto_302201 ?auto_302205 ) ( CLEAR ?auto_302201 ) ( IS-CRATE ?auto_302203 ) ( AVAILABLE ?auto_302208 ) ( IN ?auto_302203 ?auto_302209 ) ( TRUCK-AT ?auto_302209 ?auto_302206 ) ( ON ?auto_302199 ?auto_302198 ) ( ON ?auto_302200 ?auto_302199 ) ( ON ?auto_302197 ?auto_302200 ) ( ON ?auto_302201 ?auto_302197 ) ( not ( = ?auto_302198 ?auto_302199 ) ) ( not ( = ?auto_302198 ?auto_302200 ) ) ( not ( = ?auto_302198 ?auto_302197 ) ) ( not ( = ?auto_302198 ?auto_302201 ) ) ( not ( = ?auto_302198 ?auto_302203 ) ) ( not ( = ?auto_302198 ?auto_302202 ) ) ( not ( = ?auto_302198 ?auto_302204 ) ) ( not ( = ?auto_302199 ?auto_302200 ) ) ( not ( = ?auto_302199 ?auto_302197 ) ) ( not ( = ?auto_302199 ?auto_302201 ) ) ( not ( = ?auto_302199 ?auto_302203 ) ) ( not ( = ?auto_302199 ?auto_302202 ) ) ( not ( = ?auto_302199 ?auto_302204 ) ) ( not ( = ?auto_302200 ?auto_302197 ) ) ( not ( = ?auto_302200 ?auto_302201 ) ) ( not ( = ?auto_302200 ?auto_302203 ) ) ( not ( = ?auto_302200 ?auto_302202 ) ) ( not ( = ?auto_302200 ?auto_302204 ) ) ( not ( = ?auto_302197 ?auto_302201 ) ) ( not ( = ?auto_302197 ?auto_302203 ) ) ( not ( = ?auto_302197 ?auto_302202 ) ) ( not ( = ?auto_302197 ?auto_302204 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302201 ?auto_302203 ?auto_302202 )
      ( MAKE-6CRATE-VERIFY ?auto_302198 ?auto_302199 ?auto_302200 ?auto_302197 ?auto_302201 ?auto_302203 ?auto_302202 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_302211 - SURFACE
      ?auto_302212 - SURFACE
      ?auto_302213 - SURFACE
      ?auto_302210 - SURFACE
      ?auto_302214 - SURFACE
      ?auto_302216 - SURFACE
      ?auto_302215 - SURFACE
      ?auto_302217 - SURFACE
    )
    :vars
    (
      ?auto_302222 - HOIST
      ?auto_302219 - PLACE
      ?auto_302220 - PLACE
      ?auto_302221 - HOIST
      ?auto_302218 - SURFACE
      ?auto_302223 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302222 ?auto_302219 ) ( IS-CRATE ?auto_302217 ) ( not ( = ?auto_302215 ?auto_302217 ) ) ( not ( = ?auto_302216 ?auto_302215 ) ) ( not ( = ?auto_302216 ?auto_302217 ) ) ( not ( = ?auto_302220 ?auto_302219 ) ) ( HOIST-AT ?auto_302221 ?auto_302220 ) ( not ( = ?auto_302222 ?auto_302221 ) ) ( AVAILABLE ?auto_302221 ) ( SURFACE-AT ?auto_302217 ?auto_302220 ) ( ON ?auto_302217 ?auto_302218 ) ( CLEAR ?auto_302217 ) ( not ( = ?auto_302215 ?auto_302218 ) ) ( not ( = ?auto_302217 ?auto_302218 ) ) ( not ( = ?auto_302216 ?auto_302218 ) ) ( SURFACE-AT ?auto_302216 ?auto_302219 ) ( CLEAR ?auto_302216 ) ( IS-CRATE ?auto_302215 ) ( AVAILABLE ?auto_302222 ) ( IN ?auto_302215 ?auto_302223 ) ( TRUCK-AT ?auto_302223 ?auto_302220 ) ( ON ?auto_302212 ?auto_302211 ) ( ON ?auto_302213 ?auto_302212 ) ( ON ?auto_302210 ?auto_302213 ) ( ON ?auto_302214 ?auto_302210 ) ( ON ?auto_302216 ?auto_302214 ) ( not ( = ?auto_302211 ?auto_302212 ) ) ( not ( = ?auto_302211 ?auto_302213 ) ) ( not ( = ?auto_302211 ?auto_302210 ) ) ( not ( = ?auto_302211 ?auto_302214 ) ) ( not ( = ?auto_302211 ?auto_302216 ) ) ( not ( = ?auto_302211 ?auto_302215 ) ) ( not ( = ?auto_302211 ?auto_302217 ) ) ( not ( = ?auto_302211 ?auto_302218 ) ) ( not ( = ?auto_302212 ?auto_302213 ) ) ( not ( = ?auto_302212 ?auto_302210 ) ) ( not ( = ?auto_302212 ?auto_302214 ) ) ( not ( = ?auto_302212 ?auto_302216 ) ) ( not ( = ?auto_302212 ?auto_302215 ) ) ( not ( = ?auto_302212 ?auto_302217 ) ) ( not ( = ?auto_302212 ?auto_302218 ) ) ( not ( = ?auto_302213 ?auto_302210 ) ) ( not ( = ?auto_302213 ?auto_302214 ) ) ( not ( = ?auto_302213 ?auto_302216 ) ) ( not ( = ?auto_302213 ?auto_302215 ) ) ( not ( = ?auto_302213 ?auto_302217 ) ) ( not ( = ?auto_302213 ?auto_302218 ) ) ( not ( = ?auto_302210 ?auto_302214 ) ) ( not ( = ?auto_302210 ?auto_302216 ) ) ( not ( = ?auto_302210 ?auto_302215 ) ) ( not ( = ?auto_302210 ?auto_302217 ) ) ( not ( = ?auto_302210 ?auto_302218 ) ) ( not ( = ?auto_302214 ?auto_302216 ) ) ( not ( = ?auto_302214 ?auto_302215 ) ) ( not ( = ?auto_302214 ?auto_302217 ) ) ( not ( = ?auto_302214 ?auto_302218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302216 ?auto_302215 ?auto_302217 )
      ( MAKE-7CRATE-VERIFY ?auto_302211 ?auto_302212 ?auto_302213 ?auto_302210 ?auto_302214 ?auto_302216 ?auto_302215 ?auto_302217 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_302225 - SURFACE
      ?auto_302226 - SURFACE
      ?auto_302227 - SURFACE
      ?auto_302224 - SURFACE
      ?auto_302228 - SURFACE
      ?auto_302230 - SURFACE
      ?auto_302229 - SURFACE
      ?auto_302231 - SURFACE
      ?auto_302232 - SURFACE
    )
    :vars
    (
      ?auto_302237 - HOIST
      ?auto_302234 - PLACE
      ?auto_302235 - PLACE
      ?auto_302236 - HOIST
      ?auto_302233 - SURFACE
      ?auto_302238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302237 ?auto_302234 ) ( IS-CRATE ?auto_302232 ) ( not ( = ?auto_302231 ?auto_302232 ) ) ( not ( = ?auto_302229 ?auto_302231 ) ) ( not ( = ?auto_302229 ?auto_302232 ) ) ( not ( = ?auto_302235 ?auto_302234 ) ) ( HOIST-AT ?auto_302236 ?auto_302235 ) ( not ( = ?auto_302237 ?auto_302236 ) ) ( AVAILABLE ?auto_302236 ) ( SURFACE-AT ?auto_302232 ?auto_302235 ) ( ON ?auto_302232 ?auto_302233 ) ( CLEAR ?auto_302232 ) ( not ( = ?auto_302231 ?auto_302233 ) ) ( not ( = ?auto_302232 ?auto_302233 ) ) ( not ( = ?auto_302229 ?auto_302233 ) ) ( SURFACE-AT ?auto_302229 ?auto_302234 ) ( CLEAR ?auto_302229 ) ( IS-CRATE ?auto_302231 ) ( AVAILABLE ?auto_302237 ) ( IN ?auto_302231 ?auto_302238 ) ( TRUCK-AT ?auto_302238 ?auto_302235 ) ( ON ?auto_302226 ?auto_302225 ) ( ON ?auto_302227 ?auto_302226 ) ( ON ?auto_302224 ?auto_302227 ) ( ON ?auto_302228 ?auto_302224 ) ( ON ?auto_302230 ?auto_302228 ) ( ON ?auto_302229 ?auto_302230 ) ( not ( = ?auto_302225 ?auto_302226 ) ) ( not ( = ?auto_302225 ?auto_302227 ) ) ( not ( = ?auto_302225 ?auto_302224 ) ) ( not ( = ?auto_302225 ?auto_302228 ) ) ( not ( = ?auto_302225 ?auto_302230 ) ) ( not ( = ?auto_302225 ?auto_302229 ) ) ( not ( = ?auto_302225 ?auto_302231 ) ) ( not ( = ?auto_302225 ?auto_302232 ) ) ( not ( = ?auto_302225 ?auto_302233 ) ) ( not ( = ?auto_302226 ?auto_302227 ) ) ( not ( = ?auto_302226 ?auto_302224 ) ) ( not ( = ?auto_302226 ?auto_302228 ) ) ( not ( = ?auto_302226 ?auto_302230 ) ) ( not ( = ?auto_302226 ?auto_302229 ) ) ( not ( = ?auto_302226 ?auto_302231 ) ) ( not ( = ?auto_302226 ?auto_302232 ) ) ( not ( = ?auto_302226 ?auto_302233 ) ) ( not ( = ?auto_302227 ?auto_302224 ) ) ( not ( = ?auto_302227 ?auto_302228 ) ) ( not ( = ?auto_302227 ?auto_302230 ) ) ( not ( = ?auto_302227 ?auto_302229 ) ) ( not ( = ?auto_302227 ?auto_302231 ) ) ( not ( = ?auto_302227 ?auto_302232 ) ) ( not ( = ?auto_302227 ?auto_302233 ) ) ( not ( = ?auto_302224 ?auto_302228 ) ) ( not ( = ?auto_302224 ?auto_302230 ) ) ( not ( = ?auto_302224 ?auto_302229 ) ) ( not ( = ?auto_302224 ?auto_302231 ) ) ( not ( = ?auto_302224 ?auto_302232 ) ) ( not ( = ?auto_302224 ?auto_302233 ) ) ( not ( = ?auto_302228 ?auto_302230 ) ) ( not ( = ?auto_302228 ?auto_302229 ) ) ( not ( = ?auto_302228 ?auto_302231 ) ) ( not ( = ?auto_302228 ?auto_302232 ) ) ( not ( = ?auto_302228 ?auto_302233 ) ) ( not ( = ?auto_302230 ?auto_302229 ) ) ( not ( = ?auto_302230 ?auto_302231 ) ) ( not ( = ?auto_302230 ?auto_302232 ) ) ( not ( = ?auto_302230 ?auto_302233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302229 ?auto_302231 ?auto_302232 )
      ( MAKE-8CRATE-VERIFY ?auto_302225 ?auto_302226 ?auto_302227 ?auto_302224 ?auto_302228 ?auto_302230 ?auto_302229 ?auto_302231 ?auto_302232 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_302239 - SURFACE
      ?auto_302240 - SURFACE
    )
    :vars
    (
      ?auto_302246 - HOIST
      ?auto_302242 - PLACE
      ?auto_302245 - SURFACE
      ?auto_302243 - PLACE
      ?auto_302244 - HOIST
      ?auto_302241 - SURFACE
      ?auto_302247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302246 ?auto_302242 ) ( IS-CRATE ?auto_302240 ) ( not ( = ?auto_302239 ?auto_302240 ) ) ( not ( = ?auto_302245 ?auto_302239 ) ) ( not ( = ?auto_302245 ?auto_302240 ) ) ( not ( = ?auto_302243 ?auto_302242 ) ) ( HOIST-AT ?auto_302244 ?auto_302243 ) ( not ( = ?auto_302246 ?auto_302244 ) ) ( SURFACE-AT ?auto_302240 ?auto_302243 ) ( ON ?auto_302240 ?auto_302241 ) ( CLEAR ?auto_302240 ) ( not ( = ?auto_302239 ?auto_302241 ) ) ( not ( = ?auto_302240 ?auto_302241 ) ) ( not ( = ?auto_302245 ?auto_302241 ) ) ( SURFACE-AT ?auto_302245 ?auto_302242 ) ( CLEAR ?auto_302245 ) ( IS-CRATE ?auto_302239 ) ( AVAILABLE ?auto_302246 ) ( TRUCK-AT ?auto_302247 ?auto_302243 ) ( LIFTING ?auto_302244 ?auto_302239 ) )
    :subtasks
    ( ( !LOAD ?auto_302244 ?auto_302239 ?auto_302247 ?auto_302243 )
      ( MAKE-2CRATE ?auto_302245 ?auto_302239 ?auto_302240 )
      ( MAKE-1CRATE-VERIFY ?auto_302239 ?auto_302240 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_302248 - SURFACE
      ?auto_302249 - SURFACE
      ?auto_302250 - SURFACE
    )
    :vars
    (
      ?auto_302253 - HOIST
      ?auto_302252 - PLACE
      ?auto_302256 - PLACE
      ?auto_302254 - HOIST
      ?auto_302251 - SURFACE
      ?auto_302255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302253 ?auto_302252 ) ( IS-CRATE ?auto_302250 ) ( not ( = ?auto_302249 ?auto_302250 ) ) ( not ( = ?auto_302248 ?auto_302249 ) ) ( not ( = ?auto_302248 ?auto_302250 ) ) ( not ( = ?auto_302256 ?auto_302252 ) ) ( HOIST-AT ?auto_302254 ?auto_302256 ) ( not ( = ?auto_302253 ?auto_302254 ) ) ( SURFACE-AT ?auto_302250 ?auto_302256 ) ( ON ?auto_302250 ?auto_302251 ) ( CLEAR ?auto_302250 ) ( not ( = ?auto_302249 ?auto_302251 ) ) ( not ( = ?auto_302250 ?auto_302251 ) ) ( not ( = ?auto_302248 ?auto_302251 ) ) ( SURFACE-AT ?auto_302248 ?auto_302252 ) ( CLEAR ?auto_302248 ) ( IS-CRATE ?auto_302249 ) ( AVAILABLE ?auto_302253 ) ( TRUCK-AT ?auto_302255 ?auto_302256 ) ( LIFTING ?auto_302254 ?auto_302249 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_302249 ?auto_302250 )
      ( MAKE-2CRATE-VERIFY ?auto_302248 ?auto_302249 ?auto_302250 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_302258 - SURFACE
      ?auto_302259 - SURFACE
      ?auto_302260 - SURFACE
      ?auto_302257 - SURFACE
    )
    :vars
    (
      ?auto_302265 - HOIST
      ?auto_302264 - PLACE
      ?auto_302263 - PLACE
      ?auto_302261 - HOIST
      ?auto_302262 - SURFACE
      ?auto_302266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302265 ?auto_302264 ) ( IS-CRATE ?auto_302257 ) ( not ( = ?auto_302260 ?auto_302257 ) ) ( not ( = ?auto_302259 ?auto_302260 ) ) ( not ( = ?auto_302259 ?auto_302257 ) ) ( not ( = ?auto_302263 ?auto_302264 ) ) ( HOIST-AT ?auto_302261 ?auto_302263 ) ( not ( = ?auto_302265 ?auto_302261 ) ) ( SURFACE-AT ?auto_302257 ?auto_302263 ) ( ON ?auto_302257 ?auto_302262 ) ( CLEAR ?auto_302257 ) ( not ( = ?auto_302260 ?auto_302262 ) ) ( not ( = ?auto_302257 ?auto_302262 ) ) ( not ( = ?auto_302259 ?auto_302262 ) ) ( SURFACE-AT ?auto_302259 ?auto_302264 ) ( CLEAR ?auto_302259 ) ( IS-CRATE ?auto_302260 ) ( AVAILABLE ?auto_302265 ) ( TRUCK-AT ?auto_302266 ?auto_302263 ) ( LIFTING ?auto_302261 ?auto_302260 ) ( ON ?auto_302259 ?auto_302258 ) ( not ( = ?auto_302258 ?auto_302259 ) ) ( not ( = ?auto_302258 ?auto_302260 ) ) ( not ( = ?auto_302258 ?auto_302257 ) ) ( not ( = ?auto_302258 ?auto_302262 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302259 ?auto_302260 ?auto_302257 )
      ( MAKE-3CRATE-VERIFY ?auto_302258 ?auto_302259 ?auto_302260 ?auto_302257 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_302268 - SURFACE
      ?auto_302269 - SURFACE
      ?auto_302270 - SURFACE
      ?auto_302267 - SURFACE
      ?auto_302271 - SURFACE
    )
    :vars
    (
      ?auto_302276 - HOIST
      ?auto_302275 - PLACE
      ?auto_302274 - PLACE
      ?auto_302272 - HOIST
      ?auto_302273 - SURFACE
      ?auto_302277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302276 ?auto_302275 ) ( IS-CRATE ?auto_302271 ) ( not ( = ?auto_302267 ?auto_302271 ) ) ( not ( = ?auto_302270 ?auto_302267 ) ) ( not ( = ?auto_302270 ?auto_302271 ) ) ( not ( = ?auto_302274 ?auto_302275 ) ) ( HOIST-AT ?auto_302272 ?auto_302274 ) ( not ( = ?auto_302276 ?auto_302272 ) ) ( SURFACE-AT ?auto_302271 ?auto_302274 ) ( ON ?auto_302271 ?auto_302273 ) ( CLEAR ?auto_302271 ) ( not ( = ?auto_302267 ?auto_302273 ) ) ( not ( = ?auto_302271 ?auto_302273 ) ) ( not ( = ?auto_302270 ?auto_302273 ) ) ( SURFACE-AT ?auto_302270 ?auto_302275 ) ( CLEAR ?auto_302270 ) ( IS-CRATE ?auto_302267 ) ( AVAILABLE ?auto_302276 ) ( TRUCK-AT ?auto_302277 ?auto_302274 ) ( LIFTING ?auto_302272 ?auto_302267 ) ( ON ?auto_302269 ?auto_302268 ) ( ON ?auto_302270 ?auto_302269 ) ( not ( = ?auto_302268 ?auto_302269 ) ) ( not ( = ?auto_302268 ?auto_302270 ) ) ( not ( = ?auto_302268 ?auto_302267 ) ) ( not ( = ?auto_302268 ?auto_302271 ) ) ( not ( = ?auto_302268 ?auto_302273 ) ) ( not ( = ?auto_302269 ?auto_302270 ) ) ( not ( = ?auto_302269 ?auto_302267 ) ) ( not ( = ?auto_302269 ?auto_302271 ) ) ( not ( = ?auto_302269 ?auto_302273 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302270 ?auto_302267 ?auto_302271 )
      ( MAKE-4CRATE-VERIFY ?auto_302268 ?auto_302269 ?auto_302270 ?auto_302267 ?auto_302271 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_302279 - SURFACE
      ?auto_302280 - SURFACE
      ?auto_302281 - SURFACE
      ?auto_302278 - SURFACE
      ?auto_302282 - SURFACE
      ?auto_302283 - SURFACE
    )
    :vars
    (
      ?auto_302288 - HOIST
      ?auto_302287 - PLACE
      ?auto_302286 - PLACE
      ?auto_302284 - HOIST
      ?auto_302285 - SURFACE
      ?auto_302289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302288 ?auto_302287 ) ( IS-CRATE ?auto_302283 ) ( not ( = ?auto_302282 ?auto_302283 ) ) ( not ( = ?auto_302278 ?auto_302282 ) ) ( not ( = ?auto_302278 ?auto_302283 ) ) ( not ( = ?auto_302286 ?auto_302287 ) ) ( HOIST-AT ?auto_302284 ?auto_302286 ) ( not ( = ?auto_302288 ?auto_302284 ) ) ( SURFACE-AT ?auto_302283 ?auto_302286 ) ( ON ?auto_302283 ?auto_302285 ) ( CLEAR ?auto_302283 ) ( not ( = ?auto_302282 ?auto_302285 ) ) ( not ( = ?auto_302283 ?auto_302285 ) ) ( not ( = ?auto_302278 ?auto_302285 ) ) ( SURFACE-AT ?auto_302278 ?auto_302287 ) ( CLEAR ?auto_302278 ) ( IS-CRATE ?auto_302282 ) ( AVAILABLE ?auto_302288 ) ( TRUCK-AT ?auto_302289 ?auto_302286 ) ( LIFTING ?auto_302284 ?auto_302282 ) ( ON ?auto_302280 ?auto_302279 ) ( ON ?auto_302281 ?auto_302280 ) ( ON ?auto_302278 ?auto_302281 ) ( not ( = ?auto_302279 ?auto_302280 ) ) ( not ( = ?auto_302279 ?auto_302281 ) ) ( not ( = ?auto_302279 ?auto_302278 ) ) ( not ( = ?auto_302279 ?auto_302282 ) ) ( not ( = ?auto_302279 ?auto_302283 ) ) ( not ( = ?auto_302279 ?auto_302285 ) ) ( not ( = ?auto_302280 ?auto_302281 ) ) ( not ( = ?auto_302280 ?auto_302278 ) ) ( not ( = ?auto_302280 ?auto_302282 ) ) ( not ( = ?auto_302280 ?auto_302283 ) ) ( not ( = ?auto_302280 ?auto_302285 ) ) ( not ( = ?auto_302281 ?auto_302278 ) ) ( not ( = ?auto_302281 ?auto_302282 ) ) ( not ( = ?auto_302281 ?auto_302283 ) ) ( not ( = ?auto_302281 ?auto_302285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302278 ?auto_302282 ?auto_302283 )
      ( MAKE-5CRATE-VERIFY ?auto_302279 ?auto_302280 ?auto_302281 ?auto_302278 ?auto_302282 ?auto_302283 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_302291 - SURFACE
      ?auto_302292 - SURFACE
      ?auto_302293 - SURFACE
      ?auto_302290 - SURFACE
      ?auto_302294 - SURFACE
      ?auto_302296 - SURFACE
      ?auto_302295 - SURFACE
    )
    :vars
    (
      ?auto_302301 - HOIST
      ?auto_302300 - PLACE
      ?auto_302299 - PLACE
      ?auto_302297 - HOIST
      ?auto_302298 - SURFACE
      ?auto_302302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302301 ?auto_302300 ) ( IS-CRATE ?auto_302295 ) ( not ( = ?auto_302296 ?auto_302295 ) ) ( not ( = ?auto_302294 ?auto_302296 ) ) ( not ( = ?auto_302294 ?auto_302295 ) ) ( not ( = ?auto_302299 ?auto_302300 ) ) ( HOIST-AT ?auto_302297 ?auto_302299 ) ( not ( = ?auto_302301 ?auto_302297 ) ) ( SURFACE-AT ?auto_302295 ?auto_302299 ) ( ON ?auto_302295 ?auto_302298 ) ( CLEAR ?auto_302295 ) ( not ( = ?auto_302296 ?auto_302298 ) ) ( not ( = ?auto_302295 ?auto_302298 ) ) ( not ( = ?auto_302294 ?auto_302298 ) ) ( SURFACE-AT ?auto_302294 ?auto_302300 ) ( CLEAR ?auto_302294 ) ( IS-CRATE ?auto_302296 ) ( AVAILABLE ?auto_302301 ) ( TRUCK-AT ?auto_302302 ?auto_302299 ) ( LIFTING ?auto_302297 ?auto_302296 ) ( ON ?auto_302292 ?auto_302291 ) ( ON ?auto_302293 ?auto_302292 ) ( ON ?auto_302290 ?auto_302293 ) ( ON ?auto_302294 ?auto_302290 ) ( not ( = ?auto_302291 ?auto_302292 ) ) ( not ( = ?auto_302291 ?auto_302293 ) ) ( not ( = ?auto_302291 ?auto_302290 ) ) ( not ( = ?auto_302291 ?auto_302294 ) ) ( not ( = ?auto_302291 ?auto_302296 ) ) ( not ( = ?auto_302291 ?auto_302295 ) ) ( not ( = ?auto_302291 ?auto_302298 ) ) ( not ( = ?auto_302292 ?auto_302293 ) ) ( not ( = ?auto_302292 ?auto_302290 ) ) ( not ( = ?auto_302292 ?auto_302294 ) ) ( not ( = ?auto_302292 ?auto_302296 ) ) ( not ( = ?auto_302292 ?auto_302295 ) ) ( not ( = ?auto_302292 ?auto_302298 ) ) ( not ( = ?auto_302293 ?auto_302290 ) ) ( not ( = ?auto_302293 ?auto_302294 ) ) ( not ( = ?auto_302293 ?auto_302296 ) ) ( not ( = ?auto_302293 ?auto_302295 ) ) ( not ( = ?auto_302293 ?auto_302298 ) ) ( not ( = ?auto_302290 ?auto_302294 ) ) ( not ( = ?auto_302290 ?auto_302296 ) ) ( not ( = ?auto_302290 ?auto_302295 ) ) ( not ( = ?auto_302290 ?auto_302298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302294 ?auto_302296 ?auto_302295 )
      ( MAKE-6CRATE-VERIFY ?auto_302291 ?auto_302292 ?auto_302293 ?auto_302290 ?auto_302294 ?auto_302296 ?auto_302295 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_302304 - SURFACE
      ?auto_302305 - SURFACE
      ?auto_302306 - SURFACE
      ?auto_302303 - SURFACE
      ?auto_302307 - SURFACE
      ?auto_302309 - SURFACE
      ?auto_302308 - SURFACE
      ?auto_302310 - SURFACE
    )
    :vars
    (
      ?auto_302315 - HOIST
      ?auto_302314 - PLACE
      ?auto_302313 - PLACE
      ?auto_302311 - HOIST
      ?auto_302312 - SURFACE
      ?auto_302316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302315 ?auto_302314 ) ( IS-CRATE ?auto_302310 ) ( not ( = ?auto_302308 ?auto_302310 ) ) ( not ( = ?auto_302309 ?auto_302308 ) ) ( not ( = ?auto_302309 ?auto_302310 ) ) ( not ( = ?auto_302313 ?auto_302314 ) ) ( HOIST-AT ?auto_302311 ?auto_302313 ) ( not ( = ?auto_302315 ?auto_302311 ) ) ( SURFACE-AT ?auto_302310 ?auto_302313 ) ( ON ?auto_302310 ?auto_302312 ) ( CLEAR ?auto_302310 ) ( not ( = ?auto_302308 ?auto_302312 ) ) ( not ( = ?auto_302310 ?auto_302312 ) ) ( not ( = ?auto_302309 ?auto_302312 ) ) ( SURFACE-AT ?auto_302309 ?auto_302314 ) ( CLEAR ?auto_302309 ) ( IS-CRATE ?auto_302308 ) ( AVAILABLE ?auto_302315 ) ( TRUCK-AT ?auto_302316 ?auto_302313 ) ( LIFTING ?auto_302311 ?auto_302308 ) ( ON ?auto_302305 ?auto_302304 ) ( ON ?auto_302306 ?auto_302305 ) ( ON ?auto_302303 ?auto_302306 ) ( ON ?auto_302307 ?auto_302303 ) ( ON ?auto_302309 ?auto_302307 ) ( not ( = ?auto_302304 ?auto_302305 ) ) ( not ( = ?auto_302304 ?auto_302306 ) ) ( not ( = ?auto_302304 ?auto_302303 ) ) ( not ( = ?auto_302304 ?auto_302307 ) ) ( not ( = ?auto_302304 ?auto_302309 ) ) ( not ( = ?auto_302304 ?auto_302308 ) ) ( not ( = ?auto_302304 ?auto_302310 ) ) ( not ( = ?auto_302304 ?auto_302312 ) ) ( not ( = ?auto_302305 ?auto_302306 ) ) ( not ( = ?auto_302305 ?auto_302303 ) ) ( not ( = ?auto_302305 ?auto_302307 ) ) ( not ( = ?auto_302305 ?auto_302309 ) ) ( not ( = ?auto_302305 ?auto_302308 ) ) ( not ( = ?auto_302305 ?auto_302310 ) ) ( not ( = ?auto_302305 ?auto_302312 ) ) ( not ( = ?auto_302306 ?auto_302303 ) ) ( not ( = ?auto_302306 ?auto_302307 ) ) ( not ( = ?auto_302306 ?auto_302309 ) ) ( not ( = ?auto_302306 ?auto_302308 ) ) ( not ( = ?auto_302306 ?auto_302310 ) ) ( not ( = ?auto_302306 ?auto_302312 ) ) ( not ( = ?auto_302303 ?auto_302307 ) ) ( not ( = ?auto_302303 ?auto_302309 ) ) ( not ( = ?auto_302303 ?auto_302308 ) ) ( not ( = ?auto_302303 ?auto_302310 ) ) ( not ( = ?auto_302303 ?auto_302312 ) ) ( not ( = ?auto_302307 ?auto_302309 ) ) ( not ( = ?auto_302307 ?auto_302308 ) ) ( not ( = ?auto_302307 ?auto_302310 ) ) ( not ( = ?auto_302307 ?auto_302312 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302309 ?auto_302308 ?auto_302310 )
      ( MAKE-7CRATE-VERIFY ?auto_302304 ?auto_302305 ?auto_302306 ?auto_302303 ?auto_302307 ?auto_302309 ?auto_302308 ?auto_302310 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_302318 - SURFACE
      ?auto_302319 - SURFACE
      ?auto_302320 - SURFACE
      ?auto_302317 - SURFACE
      ?auto_302321 - SURFACE
      ?auto_302323 - SURFACE
      ?auto_302322 - SURFACE
      ?auto_302324 - SURFACE
      ?auto_302325 - SURFACE
    )
    :vars
    (
      ?auto_302330 - HOIST
      ?auto_302329 - PLACE
      ?auto_302328 - PLACE
      ?auto_302326 - HOIST
      ?auto_302327 - SURFACE
      ?auto_302331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302330 ?auto_302329 ) ( IS-CRATE ?auto_302325 ) ( not ( = ?auto_302324 ?auto_302325 ) ) ( not ( = ?auto_302322 ?auto_302324 ) ) ( not ( = ?auto_302322 ?auto_302325 ) ) ( not ( = ?auto_302328 ?auto_302329 ) ) ( HOIST-AT ?auto_302326 ?auto_302328 ) ( not ( = ?auto_302330 ?auto_302326 ) ) ( SURFACE-AT ?auto_302325 ?auto_302328 ) ( ON ?auto_302325 ?auto_302327 ) ( CLEAR ?auto_302325 ) ( not ( = ?auto_302324 ?auto_302327 ) ) ( not ( = ?auto_302325 ?auto_302327 ) ) ( not ( = ?auto_302322 ?auto_302327 ) ) ( SURFACE-AT ?auto_302322 ?auto_302329 ) ( CLEAR ?auto_302322 ) ( IS-CRATE ?auto_302324 ) ( AVAILABLE ?auto_302330 ) ( TRUCK-AT ?auto_302331 ?auto_302328 ) ( LIFTING ?auto_302326 ?auto_302324 ) ( ON ?auto_302319 ?auto_302318 ) ( ON ?auto_302320 ?auto_302319 ) ( ON ?auto_302317 ?auto_302320 ) ( ON ?auto_302321 ?auto_302317 ) ( ON ?auto_302323 ?auto_302321 ) ( ON ?auto_302322 ?auto_302323 ) ( not ( = ?auto_302318 ?auto_302319 ) ) ( not ( = ?auto_302318 ?auto_302320 ) ) ( not ( = ?auto_302318 ?auto_302317 ) ) ( not ( = ?auto_302318 ?auto_302321 ) ) ( not ( = ?auto_302318 ?auto_302323 ) ) ( not ( = ?auto_302318 ?auto_302322 ) ) ( not ( = ?auto_302318 ?auto_302324 ) ) ( not ( = ?auto_302318 ?auto_302325 ) ) ( not ( = ?auto_302318 ?auto_302327 ) ) ( not ( = ?auto_302319 ?auto_302320 ) ) ( not ( = ?auto_302319 ?auto_302317 ) ) ( not ( = ?auto_302319 ?auto_302321 ) ) ( not ( = ?auto_302319 ?auto_302323 ) ) ( not ( = ?auto_302319 ?auto_302322 ) ) ( not ( = ?auto_302319 ?auto_302324 ) ) ( not ( = ?auto_302319 ?auto_302325 ) ) ( not ( = ?auto_302319 ?auto_302327 ) ) ( not ( = ?auto_302320 ?auto_302317 ) ) ( not ( = ?auto_302320 ?auto_302321 ) ) ( not ( = ?auto_302320 ?auto_302323 ) ) ( not ( = ?auto_302320 ?auto_302322 ) ) ( not ( = ?auto_302320 ?auto_302324 ) ) ( not ( = ?auto_302320 ?auto_302325 ) ) ( not ( = ?auto_302320 ?auto_302327 ) ) ( not ( = ?auto_302317 ?auto_302321 ) ) ( not ( = ?auto_302317 ?auto_302323 ) ) ( not ( = ?auto_302317 ?auto_302322 ) ) ( not ( = ?auto_302317 ?auto_302324 ) ) ( not ( = ?auto_302317 ?auto_302325 ) ) ( not ( = ?auto_302317 ?auto_302327 ) ) ( not ( = ?auto_302321 ?auto_302323 ) ) ( not ( = ?auto_302321 ?auto_302322 ) ) ( not ( = ?auto_302321 ?auto_302324 ) ) ( not ( = ?auto_302321 ?auto_302325 ) ) ( not ( = ?auto_302321 ?auto_302327 ) ) ( not ( = ?auto_302323 ?auto_302322 ) ) ( not ( = ?auto_302323 ?auto_302324 ) ) ( not ( = ?auto_302323 ?auto_302325 ) ) ( not ( = ?auto_302323 ?auto_302327 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302322 ?auto_302324 ?auto_302325 )
      ( MAKE-8CRATE-VERIFY ?auto_302318 ?auto_302319 ?auto_302320 ?auto_302317 ?auto_302321 ?auto_302323 ?auto_302322 ?auto_302324 ?auto_302325 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_302332 - SURFACE
      ?auto_302333 - SURFACE
    )
    :vars
    (
      ?auto_302339 - HOIST
      ?auto_302338 - PLACE
      ?auto_302334 - SURFACE
      ?auto_302337 - PLACE
      ?auto_302335 - HOIST
      ?auto_302336 - SURFACE
      ?auto_302340 - TRUCK
      ?auto_302341 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_302339 ?auto_302338 ) ( IS-CRATE ?auto_302333 ) ( not ( = ?auto_302332 ?auto_302333 ) ) ( not ( = ?auto_302334 ?auto_302332 ) ) ( not ( = ?auto_302334 ?auto_302333 ) ) ( not ( = ?auto_302337 ?auto_302338 ) ) ( HOIST-AT ?auto_302335 ?auto_302337 ) ( not ( = ?auto_302339 ?auto_302335 ) ) ( SURFACE-AT ?auto_302333 ?auto_302337 ) ( ON ?auto_302333 ?auto_302336 ) ( CLEAR ?auto_302333 ) ( not ( = ?auto_302332 ?auto_302336 ) ) ( not ( = ?auto_302333 ?auto_302336 ) ) ( not ( = ?auto_302334 ?auto_302336 ) ) ( SURFACE-AT ?auto_302334 ?auto_302338 ) ( CLEAR ?auto_302334 ) ( IS-CRATE ?auto_302332 ) ( AVAILABLE ?auto_302339 ) ( TRUCK-AT ?auto_302340 ?auto_302337 ) ( AVAILABLE ?auto_302335 ) ( SURFACE-AT ?auto_302332 ?auto_302337 ) ( ON ?auto_302332 ?auto_302341 ) ( CLEAR ?auto_302332 ) ( not ( = ?auto_302332 ?auto_302341 ) ) ( not ( = ?auto_302333 ?auto_302341 ) ) ( not ( = ?auto_302334 ?auto_302341 ) ) ( not ( = ?auto_302336 ?auto_302341 ) ) )
    :subtasks
    ( ( !LIFT ?auto_302335 ?auto_302332 ?auto_302341 ?auto_302337 )
      ( MAKE-2CRATE ?auto_302334 ?auto_302332 ?auto_302333 )
      ( MAKE-1CRATE-VERIFY ?auto_302332 ?auto_302333 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_302342 - SURFACE
      ?auto_302343 - SURFACE
      ?auto_302344 - SURFACE
    )
    :vars
    (
      ?auto_302345 - HOIST
      ?auto_302349 - PLACE
      ?auto_302351 - PLACE
      ?auto_302347 - HOIST
      ?auto_302348 - SURFACE
      ?auto_302350 - TRUCK
      ?auto_302346 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_302345 ?auto_302349 ) ( IS-CRATE ?auto_302344 ) ( not ( = ?auto_302343 ?auto_302344 ) ) ( not ( = ?auto_302342 ?auto_302343 ) ) ( not ( = ?auto_302342 ?auto_302344 ) ) ( not ( = ?auto_302351 ?auto_302349 ) ) ( HOIST-AT ?auto_302347 ?auto_302351 ) ( not ( = ?auto_302345 ?auto_302347 ) ) ( SURFACE-AT ?auto_302344 ?auto_302351 ) ( ON ?auto_302344 ?auto_302348 ) ( CLEAR ?auto_302344 ) ( not ( = ?auto_302343 ?auto_302348 ) ) ( not ( = ?auto_302344 ?auto_302348 ) ) ( not ( = ?auto_302342 ?auto_302348 ) ) ( SURFACE-AT ?auto_302342 ?auto_302349 ) ( CLEAR ?auto_302342 ) ( IS-CRATE ?auto_302343 ) ( AVAILABLE ?auto_302345 ) ( TRUCK-AT ?auto_302350 ?auto_302351 ) ( AVAILABLE ?auto_302347 ) ( SURFACE-AT ?auto_302343 ?auto_302351 ) ( ON ?auto_302343 ?auto_302346 ) ( CLEAR ?auto_302343 ) ( not ( = ?auto_302343 ?auto_302346 ) ) ( not ( = ?auto_302344 ?auto_302346 ) ) ( not ( = ?auto_302342 ?auto_302346 ) ) ( not ( = ?auto_302348 ?auto_302346 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_302343 ?auto_302344 )
      ( MAKE-2CRATE-VERIFY ?auto_302342 ?auto_302343 ?auto_302344 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_302353 - SURFACE
      ?auto_302354 - SURFACE
      ?auto_302355 - SURFACE
      ?auto_302352 - SURFACE
    )
    :vars
    (
      ?auto_302358 - HOIST
      ?auto_302361 - PLACE
      ?auto_302362 - PLACE
      ?auto_302357 - HOIST
      ?auto_302356 - SURFACE
      ?auto_302359 - TRUCK
      ?auto_302360 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_302358 ?auto_302361 ) ( IS-CRATE ?auto_302352 ) ( not ( = ?auto_302355 ?auto_302352 ) ) ( not ( = ?auto_302354 ?auto_302355 ) ) ( not ( = ?auto_302354 ?auto_302352 ) ) ( not ( = ?auto_302362 ?auto_302361 ) ) ( HOIST-AT ?auto_302357 ?auto_302362 ) ( not ( = ?auto_302358 ?auto_302357 ) ) ( SURFACE-AT ?auto_302352 ?auto_302362 ) ( ON ?auto_302352 ?auto_302356 ) ( CLEAR ?auto_302352 ) ( not ( = ?auto_302355 ?auto_302356 ) ) ( not ( = ?auto_302352 ?auto_302356 ) ) ( not ( = ?auto_302354 ?auto_302356 ) ) ( SURFACE-AT ?auto_302354 ?auto_302361 ) ( CLEAR ?auto_302354 ) ( IS-CRATE ?auto_302355 ) ( AVAILABLE ?auto_302358 ) ( TRUCK-AT ?auto_302359 ?auto_302362 ) ( AVAILABLE ?auto_302357 ) ( SURFACE-AT ?auto_302355 ?auto_302362 ) ( ON ?auto_302355 ?auto_302360 ) ( CLEAR ?auto_302355 ) ( not ( = ?auto_302355 ?auto_302360 ) ) ( not ( = ?auto_302352 ?auto_302360 ) ) ( not ( = ?auto_302354 ?auto_302360 ) ) ( not ( = ?auto_302356 ?auto_302360 ) ) ( ON ?auto_302354 ?auto_302353 ) ( not ( = ?auto_302353 ?auto_302354 ) ) ( not ( = ?auto_302353 ?auto_302355 ) ) ( not ( = ?auto_302353 ?auto_302352 ) ) ( not ( = ?auto_302353 ?auto_302356 ) ) ( not ( = ?auto_302353 ?auto_302360 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302354 ?auto_302355 ?auto_302352 )
      ( MAKE-3CRATE-VERIFY ?auto_302353 ?auto_302354 ?auto_302355 ?auto_302352 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_302364 - SURFACE
      ?auto_302365 - SURFACE
      ?auto_302366 - SURFACE
      ?auto_302363 - SURFACE
      ?auto_302367 - SURFACE
    )
    :vars
    (
      ?auto_302370 - HOIST
      ?auto_302373 - PLACE
      ?auto_302374 - PLACE
      ?auto_302369 - HOIST
      ?auto_302368 - SURFACE
      ?auto_302371 - TRUCK
      ?auto_302372 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_302370 ?auto_302373 ) ( IS-CRATE ?auto_302367 ) ( not ( = ?auto_302363 ?auto_302367 ) ) ( not ( = ?auto_302366 ?auto_302363 ) ) ( not ( = ?auto_302366 ?auto_302367 ) ) ( not ( = ?auto_302374 ?auto_302373 ) ) ( HOIST-AT ?auto_302369 ?auto_302374 ) ( not ( = ?auto_302370 ?auto_302369 ) ) ( SURFACE-AT ?auto_302367 ?auto_302374 ) ( ON ?auto_302367 ?auto_302368 ) ( CLEAR ?auto_302367 ) ( not ( = ?auto_302363 ?auto_302368 ) ) ( not ( = ?auto_302367 ?auto_302368 ) ) ( not ( = ?auto_302366 ?auto_302368 ) ) ( SURFACE-AT ?auto_302366 ?auto_302373 ) ( CLEAR ?auto_302366 ) ( IS-CRATE ?auto_302363 ) ( AVAILABLE ?auto_302370 ) ( TRUCK-AT ?auto_302371 ?auto_302374 ) ( AVAILABLE ?auto_302369 ) ( SURFACE-AT ?auto_302363 ?auto_302374 ) ( ON ?auto_302363 ?auto_302372 ) ( CLEAR ?auto_302363 ) ( not ( = ?auto_302363 ?auto_302372 ) ) ( not ( = ?auto_302367 ?auto_302372 ) ) ( not ( = ?auto_302366 ?auto_302372 ) ) ( not ( = ?auto_302368 ?auto_302372 ) ) ( ON ?auto_302365 ?auto_302364 ) ( ON ?auto_302366 ?auto_302365 ) ( not ( = ?auto_302364 ?auto_302365 ) ) ( not ( = ?auto_302364 ?auto_302366 ) ) ( not ( = ?auto_302364 ?auto_302363 ) ) ( not ( = ?auto_302364 ?auto_302367 ) ) ( not ( = ?auto_302364 ?auto_302368 ) ) ( not ( = ?auto_302364 ?auto_302372 ) ) ( not ( = ?auto_302365 ?auto_302366 ) ) ( not ( = ?auto_302365 ?auto_302363 ) ) ( not ( = ?auto_302365 ?auto_302367 ) ) ( not ( = ?auto_302365 ?auto_302368 ) ) ( not ( = ?auto_302365 ?auto_302372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302366 ?auto_302363 ?auto_302367 )
      ( MAKE-4CRATE-VERIFY ?auto_302364 ?auto_302365 ?auto_302366 ?auto_302363 ?auto_302367 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_302376 - SURFACE
      ?auto_302377 - SURFACE
      ?auto_302378 - SURFACE
      ?auto_302375 - SURFACE
      ?auto_302379 - SURFACE
      ?auto_302380 - SURFACE
    )
    :vars
    (
      ?auto_302383 - HOIST
      ?auto_302386 - PLACE
      ?auto_302387 - PLACE
      ?auto_302382 - HOIST
      ?auto_302381 - SURFACE
      ?auto_302384 - TRUCK
      ?auto_302385 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_302383 ?auto_302386 ) ( IS-CRATE ?auto_302380 ) ( not ( = ?auto_302379 ?auto_302380 ) ) ( not ( = ?auto_302375 ?auto_302379 ) ) ( not ( = ?auto_302375 ?auto_302380 ) ) ( not ( = ?auto_302387 ?auto_302386 ) ) ( HOIST-AT ?auto_302382 ?auto_302387 ) ( not ( = ?auto_302383 ?auto_302382 ) ) ( SURFACE-AT ?auto_302380 ?auto_302387 ) ( ON ?auto_302380 ?auto_302381 ) ( CLEAR ?auto_302380 ) ( not ( = ?auto_302379 ?auto_302381 ) ) ( not ( = ?auto_302380 ?auto_302381 ) ) ( not ( = ?auto_302375 ?auto_302381 ) ) ( SURFACE-AT ?auto_302375 ?auto_302386 ) ( CLEAR ?auto_302375 ) ( IS-CRATE ?auto_302379 ) ( AVAILABLE ?auto_302383 ) ( TRUCK-AT ?auto_302384 ?auto_302387 ) ( AVAILABLE ?auto_302382 ) ( SURFACE-AT ?auto_302379 ?auto_302387 ) ( ON ?auto_302379 ?auto_302385 ) ( CLEAR ?auto_302379 ) ( not ( = ?auto_302379 ?auto_302385 ) ) ( not ( = ?auto_302380 ?auto_302385 ) ) ( not ( = ?auto_302375 ?auto_302385 ) ) ( not ( = ?auto_302381 ?auto_302385 ) ) ( ON ?auto_302377 ?auto_302376 ) ( ON ?auto_302378 ?auto_302377 ) ( ON ?auto_302375 ?auto_302378 ) ( not ( = ?auto_302376 ?auto_302377 ) ) ( not ( = ?auto_302376 ?auto_302378 ) ) ( not ( = ?auto_302376 ?auto_302375 ) ) ( not ( = ?auto_302376 ?auto_302379 ) ) ( not ( = ?auto_302376 ?auto_302380 ) ) ( not ( = ?auto_302376 ?auto_302381 ) ) ( not ( = ?auto_302376 ?auto_302385 ) ) ( not ( = ?auto_302377 ?auto_302378 ) ) ( not ( = ?auto_302377 ?auto_302375 ) ) ( not ( = ?auto_302377 ?auto_302379 ) ) ( not ( = ?auto_302377 ?auto_302380 ) ) ( not ( = ?auto_302377 ?auto_302381 ) ) ( not ( = ?auto_302377 ?auto_302385 ) ) ( not ( = ?auto_302378 ?auto_302375 ) ) ( not ( = ?auto_302378 ?auto_302379 ) ) ( not ( = ?auto_302378 ?auto_302380 ) ) ( not ( = ?auto_302378 ?auto_302381 ) ) ( not ( = ?auto_302378 ?auto_302385 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302375 ?auto_302379 ?auto_302380 )
      ( MAKE-5CRATE-VERIFY ?auto_302376 ?auto_302377 ?auto_302378 ?auto_302375 ?auto_302379 ?auto_302380 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_302389 - SURFACE
      ?auto_302390 - SURFACE
      ?auto_302391 - SURFACE
      ?auto_302388 - SURFACE
      ?auto_302392 - SURFACE
      ?auto_302394 - SURFACE
      ?auto_302393 - SURFACE
    )
    :vars
    (
      ?auto_302397 - HOIST
      ?auto_302400 - PLACE
      ?auto_302401 - PLACE
      ?auto_302396 - HOIST
      ?auto_302395 - SURFACE
      ?auto_302398 - TRUCK
      ?auto_302399 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_302397 ?auto_302400 ) ( IS-CRATE ?auto_302393 ) ( not ( = ?auto_302394 ?auto_302393 ) ) ( not ( = ?auto_302392 ?auto_302394 ) ) ( not ( = ?auto_302392 ?auto_302393 ) ) ( not ( = ?auto_302401 ?auto_302400 ) ) ( HOIST-AT ?auto_302396 ?auto_302401 ) ( not ( = ?auto_302397 ?auto_302396 ) ) ( SURFACE-AT ?auto_302393 ?auto_302401 ) ( ON ?auto_302393 ?auto_302395 ) ( CLEAR ?auto_302393 ) ( not ( = ?auto_302394 ?auto_302395 ) ) ( not ( = ?auto_302393 ?auto_302395 ) ) ( not ( = ?auto_302392 ?auto_302395 ) ) ( SURFACE-AT ?auto_302392 ?auto_302400 ) ( CLEAR ?auto_302392 ) ( IS-CRATE ?auto_302394 ) ( AVAILABLE ?auto_302397 ) ( TRUCK-AT ?auto_302398 ?auto_302401 ) ( AVAILABLE ?auto_302396 ) ( SURFACE-AT ?auto_302394 ?auto_302401 ) ( ON ?auto_302394 ?auto_302399 ) ( CLEAR ?auto_302394 ) ( not ( = ?auto_302394 ?auto_302399 ) ) ( not ( = ?auto_302393 ?auto_302399 ) ) ( not ( = ?auto_302392 ?auto_302399 ) ) ( not ( = ?auto_302395 ?auto_302399 ) ) ( ON ?auto_302390 ?auto_302389 ) ( ON ?auto_302391 ?auto_302390 ) ( ON ?auto_302388 ?auto_302391 ) ( ON ?auto_302392 ?auto_302388 ) ( not ( = ?auto_302389 ?auto_302390 ) ) ( not ( = ?auto_302389 ?auto_302391 ) ) ( not ( = ?auto_302389 ?auto_302388 ) ) ( not ( = ?auto_302389 ?auto_302392 ) ) ( not ( = ?auto_302389 ?auto_302394 ) ) ( not ( = ?auto_302389 ?auto_302393 ) ) ( not ( = ?auto_302389 ?auto_302395 ) ) ( not ( = ?auto_302389 ?auto_302399 ) ) ( not ( = ?auto_302390 ?auto_302391 ) ) ( not ( = ?auto_302390 ?auto_302388 ) ) ( not ( = ?auto_302390 ?auto_302392 ) ) ( not ( = ?auto_302390 ?auto_302394 ) ) ( not ( = ?auto_302390 ?auto_302393 ) ) ( not ( = ?auto_302390 ?auto_302395 ) ) ( not ( = ?auto_302390 ?auto_302399 ) ) ( not ( = ?auto_302391 ?auto_302388 ) ) ( not ( = ?auto_302391 ?auto_302392 ) ) ( not ( = ?auto_302391 ?auto_302394 ) ) ( not ( = ?auto_302391 ?auto_302393 ) ) ( not ( = ?auto_302391 ?auto_302395 ) ) ( not ( = ?auto_302391 ?auto_302399 ) ) ( not ( = ?auto_302388 ?auto_302392 ) ) ( not ( = ?auto_302388 ?auto_302394 ) ) ( not ( = ?auto_302388 ?auto_302393 ) ) ( not ( = ?auto_302388 ?auto_302395 ) ) ( not ( = ?auto_302388 ?auto_302399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302392 ?auto_302394 ?auto_302393 )
      ( MAKE-6CRATE-VERIFY ?auto_302389 ?auto_302390 ?auto_302391 ?auto_302388 ?auto_302392 ?auto_302394 ?auto_302393 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_302403 - SURFACE
      ?auto_302404 - SURFACE
      ?auto_302405 - SURFACE
      ?auto_302402 - SURFACE
      ?auto_302406 - SURFACE
      ?auto_302408 - SURFACE
      ?auto_302407 - SURFACE
      ?auto_302409 - SURFACE
    )
    :vars
    (
      ?auto_302412 - HOIST
      ?auto_302415 - PLACE
      ?auto_302416 - PLACE
      ?auto_302411 - HOIST
      ?auto_302410 - SURFACE
      ?auto_302413 - TRUCK
      ?auto_302414 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_302412 ?auto_302415 ) ( IS-CRATE ?auto_302409 ) ( not ( = ?auto_302407 ?auto_302409 ) ) ( not ( = ?auto_302408 ?auto_302407 ) ) ( not ( = ?auto_302408 ?auto_302409 ) ) ( not ( = ?auto_302416 ?auto_302415 ) ) ( HOIST-AT ?auto_302411 ?auto_302416 ) ( not ( = ?auto_302412 ?auto_302411 ) ) ( SURFACE-AT ?auto_302409 ?auto_302416 ) ( ON ?auto_302409 ?auto_302410 ) ( CLEAR ?auto_302409 ) ( not ( = ?auto_302407 ?auto_302410 ) ) ( not ( = ?auto_302409 ?auto_302410 ) ) ( not ( = ?auto_302408 ?auto_302410 ) ) ( SURFACE-AT ?auto_302408 ?auto_302415 ) ( CLEAR ?auto_302408 ) ( IS-CRATE ?auto_302407 ) ( AVAILABLE ?auto_302412 ) ( TRUCK-AT ?auto_302413 ?auto_302416 ) ( AVAILABLE ?auto_302411 ) ( SURFACE-AT ?auto_302407 ?auto_302416 ) ( ON ?auto_302407 ?auto_302414 ) ( CLEAR ?auto_302407 ) ( not ( = ?auto_302407 ?auto_302414 ) ) ( not ( = ?auto_302409 ?auto_302414 ) ) ( not ( = ?auto_302408 ?auto_302414 ) ) ( not ( = ?auto_302410 ?auto_302414 ) ) ( ON ?auto_302404 ?auto_302403 ) ( ON ?auto_302405 ?auto_302404 ) ( ON ?auto_302402 ?auto_302405 ) ( ON ?auto_302406 ?auto_302402 ) ( ON ?auto_302408 ?auto_302406 ) ( not ( = ?auto_302403 ?auto_302404 ) ) ( not ( = ?auto_302403 ?auto_302405 ) ) ( not ( = ?auto_302403 ?auto_302402 ) ) ( not ( = ?auto_302403 ?auto_302406 ) ) ( not ( = ?auto_302403 ?auto_302408 ) ) ( not ( = ?auto_302403 ?auto_302407 ) ) ( not ( = ?auto_302403 ?auto_302409 ) ) ( not ( = ?auto_302403 ?auto_302410 ) ) ( not ( = ?auto_302403 ?auto_302414 ) ) ( not ( = ?auto_302404 ?auto_302405 ) ) ( not ( = ?auto_302404 ?auto_302402 ) ) ( not ( = ?auto_302404 ?auto_302406 ) ) ( not ( = ?auto_302404 ?auto_302408 ) ) ( not ( = ?auto_302404 ?auto_302407 ) ) ( not ( = ?auto_302404 ?auto_302409 ) ) ( not ( = ?auto_302404 ?auto_302410 ) ) ( not ( = ?auto_302404 ?auto_302414 ) ) ( not ( = ?auto_302405 ?auto_302402 ) ) ( not ( = ?auto_302405 ?auto_302406 ) ) ( not ( = ?auto_302405 ?auto_302408 ) ) ( not ( = ?auto_302405 ?auto_302407 ) ) ( not ( = ?auto_302405 ?auto_302409 ) ) ( not ( = ?auto_302405 ?auto_302410 ) ) ( not ( = ?auto_302405 ?auto_302414 ) ) ( not ( = ?auto_302402 ?auto_302406 ) ) ( not ( = ?auto_302402 ?auto_302408 ) ) ( not ( = ?auto_302402 ?auto_302407 ) ) ( not ( = ?auto_302402 ?auto_302409 ) ) ( not ( = ?auto_302402 ?auto_302410 ) ) ( not ( = ?auto_302402 ?auto_302414 ) ) ( not ( = ?auto_302406 ?auto_302408 ) ) ( not ( = ?auto_302406 ?auto_302407 ) ) ( not ( = ?auto_302406 ?auto_302409 ) ) ( not ( = ?auto_302406 ?auto_302410 ) ) ( not ( = ?auto_302406 ?auto_302414 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302408 ?auto_302407 ?auto_302409 )
      ( MAKE-7CRATE-VERIFY ?auto_302403 ?auto_302404 ?auto_302405 ?auto_302402 ?auto_302406 ?auto_302408 ?auto_302407 ?auto_302409 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_302418 - SURFACE
      ?auto_302419 - SURFACE
      ?auto_302420 - SURFACE
      ?auto_302417 - SURFACE
      ?auto_302421 - SURFACE
      ?auto_302423 - SURFACE
      ?auto_302422 - SURFACE
      ?auto_302424 - SURFACE
      ?auto_302425 - SURFACE
    )
    :vars
    (
      ?auto_302428 - HOIST
      ?auto_302431 - PLACE
      ?auto_302432 - PLACE
      ?auto_302427 - HOIST
      ?auto_302426 - SURFACE
      ?auto_302429 - TRUCK
      ?auto_302430 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_302428 ?auto_302431 ) ( IS-CRATE ?auto_302425 ) ( not ( = ?auto_302424 ?auto_302425 ) ) ( not ( = ?auto_302422 ?auto_302424 ) ) ( not ( = ?auto_302422 ?auto_302425 ) ) ( not ( = ?auto_302432 ?auto_302431 ) ) ( HOIST-AT ?auto_302427 ?auto_302432 ) ( not ( = ?auto_302428 ?auto_302427 ) ) ( SURFACE-AT ?auto_302425 ?auto_302432 ) ( ON ?auto_302425 ?auto_302426 ) ( CLEAR ?auto_302425 ) ( not ( = ?auto_302424 ?auto_302426 ) ) ( not ( = ?auto_302425 ?auto_302426 ) ) ( not ( = ?auto_302422 ?auto_302426 ) ) ( SURFACE-AT ?auto_302422 ?auto_302431 ) ( CLEAR ?auto_302422 ) ( IS-CRATE ?auto_302424 ) ( AVAILABLE ?auto_302428 ) ( TRUCK-AT ?auto_302429 ?auto_302432 ) ( AVAILABLE ?auto_302427 ) ( SURFACE-AT ?auto_302424 ?auto_302432 ) ( ON ?auto_302424 ?auto_302430 ) ( CLEAR ?auto_302424 ) ( not ( = ?auto_302424 ?auto_302430 ) ) ( not ( = ?auto_302425 ?auto_302430 ) ) ( not ( = ?auto_302422 ?auto_302430 ) ) ( not ( = ?auto_302426 ?auto_302430 ) ) ( ON ?auto_302419 ?auto_302418 ) ( ON ?auto_302420 ?auto_302419 ) ( ON ?auto_302417 ?auto_302420 ) ( ON ?auto_302421 ?auto_302417 ) ( ON ?auto_302423 ?auto_302421 ) ( ON ?auto_302422 ?auto_302423 ) ( not ( = ?auto_302418 ?auto_302419 ) ) ( not ( = ?auto_302418 ?auto_302420 ) ) ( not ( = ?auto_302418 ?auto_302417 ) ) ( not ( = ?auto_302418 ?auto_302421 ) ) ( not ( = ?auto_302418 ?auto_302423 ) ) ( not ( = ?auto_302418 ?auto_302422 ) ) ( not ( = ?auto_302418 ?auto_302424 ) ) ( not ( = ?auto_302418 ?auto_302425 ) ) ( not ( = ?auto_302418 ?auto_302426 ) ) ( not ( = ?auto_302418 ?auto_302430 ) ) ( not ( = ?auto_302419 ?auto_302420 ) ) ( not ( = ?auto_302419 ?auto_302417 ) ) ( not ( = ?auto_302419 ?auto_302421 ) ) ( not ( = ?auto_302419 ?auto_302423 ) ) ( not ( = ?auto_302419 ?auto_302422 ) ) ( not ( = ?auto_302419 ?auto_302424 ) ) ( not ( = ?auto_302419 ?auto_302425 ) ) ( not ( = ?auto_302419 ?auto_302426 ) ) ( not ( = ?auto_302419 ?auto_302430 ) ) ( not ( = ?auto_302420 ?auto_302417 ) ) ( not ( = ?auto_302420 ?auto_302421 ) ) ( not ( = ?auto_302420 ?auto_302423 ) ) ( not ( = ?auto_302420 ?auto_302422 ) ) ( not ( = ?auto_302420 ?auto_302424 ) ) ( not ( = ?auto_302420 ?auto_302425 ) ) ( not ( = ?auto_302420 ?auto_302426 ) ) ( not ( = ?auto_302420 ?auto_302430 ) ) ( not ( = ?auto_302417 ?auto_302421 ) ) ( not ( = ?auto_302417 ?auto_302423 ) ) ( not ( = ?auto_302417 ?auto_302422 ) ) ( not ( = ?auto_302417 ?auto_302424 ) ) ( not ( = ?auto_302417 ?auto_302425 ) ) ( not ( = ?auto_302417 ?auto_302426 ) ) ( not ( = ?auto_302417 ?auto_302430 ) ) ( not ( = ?auto_302421 ?auto_302423 ) ) ( not ( = ?auto_302421 ?auto_302422 ) ) ( not ( = ?auto_302421 ?auto_302424 ) ) ( not ( = ?auto_302421 ?auto_302425 ) ) ( not ( = ?auto_302421 ?auto_302426 ) ) ( not ( = ?auto_302421 ?auto_302430 ) ) ( not ( = ?auto_302423 ?auto_302422 ) ) ( not ( = ?auto_302423 ?auto_302424 ) ) ( not ( = ?auto_302423 ?auto_302425 ) ) ( not ( = ?auto_302423 ?auto_302426 ) ) ( not ( = ?auto_302423 ?auto_302430 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302422 ?auto_302424 ?auto_302425 )
      ( MAKE-8CRATE-VERIFY ?auto_302418 ?auto_302419 ?auto_302420 ?auto_302417 ?auto_302421 ?auto_302423 ?auto_302422 ?auto_302424 ?auto_302425 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_302433 - SURFACE
      ?auto_302434 - SURFACE
    )
    :vars
    (
      ?auto_302437 - HOIST
      ?auto_302440 - PLACE
      ?auto_302442 - SURFACE
      ?auto_302441 - PLACE
      ?auto_302436 - HOIST
      ?auto_302435 - SURFACE
      ?auto_302439 - SURFACE
      ?auto_302438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302437 ?auto_302440 ) ( IS-CRATE ?auto_302434 ) ( not ( = ?auto_302433 ?auto_302434 ) ) ( not ( = ?auto_302442 ?auto_302433 ) ) ( not ( = ?auto_302442 ?auto_302434 ) ) ( not ( = ?auto_302441 ?auto_302440 ) ) ( HOIST-AT ?auto_302436 ?auto_302441 ) ( not ( = ?auto_302437 ?auto_302436 ) ) ( SURFACE-AT ?auto_302434 ?auto_302441 ) ( ON ?auto_302434 ?auto_302435 ) ( CLEAR ?auto_302434 ) ( not ( = ?auto_302433 ?auto_302435 ) ) ( not ( = ?auto_302434 ?auto_302435 ) ) ( not ( = ?auto_302442 ?auto_302435 ) ) ( SURFACE-AT ?auto_302442 ?auto_302440 ) ( CLEAR ?auto_302442 ) ( IS-CRATE ?auto_302433 ) ( AVAILABLE ?auto_302437 ) ( AVAILABLE ?auto_302436 ) ( SURFACE-AT ?auto_302433 ?auto_302441 ) ( ON ?auto_302433 ?auto_302439 ) ( CLEAR ?auto_302433 ) ( not ( = ?auto_302433 ?auto_302439 ) ) ( not ( = ?auto_302434 ?auto_302439 ) ) ( not ( = ?auto_302442 ?auto_302439 ) ) ( not ( = ?auto_302435 ?auto_302439 ) ) ( TRUCK-AT ?auto_302438 ?auto_302440 ) )
    :subtasks
    ( ( !DRIVE ?auto_302438 ?auto_302440 ?auto_302441 )
      ( MAKE-2CRATE ?auto_302442 ?auto_302433 ?auto_302434 )
      ( MAKE-1CRATE-VERIFY ?auto_302433 ?auto_302434 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_302443 - SURFACE
      ?auto_302444 - SURFACE
      ?auto_302445 - SURFACE
    )
    :vars
    (
      ?auto_302450 - HOIST
      ?auto_302446 - PLACE
      ?auto_302447 - PLACE
      ?auto_302451 - HOIST
      ?auto_302452 - SURFACE
      ?auto_302448 - SURFACE
      ?auto_302449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302450 ?auto_302446 ) ( IS-CRATE ?auto_302445 ) ( not ( = ?auto_302444 ?auto_302445 ) ) ( not ( = ?auto_302443 ?auto_302444 ) ) ( not ( = ?auto_302443 ?auto_302445 ) ) ( not ( = ?auto_302447 ?auto_302446 ) ) ( HOIST-AT ?auto_302451 ?auto_302447 ) ( not ( = ?auto_302450 ?auto_302451 ) ) ( SURFACE-AT ?auto_302445 ?auto_302447 ) ( ON ?auto_302445 ?auto_302452 ) ( CLEAR ?auto_302445 ) ( not ( = ?auto_302444 ?auto_302452 ) ) ( not ( = ?auto_302445 ?auto_302452 ) ) ( not ( = ?auto_302443 ?auto_302452 ) ) ( SURFACE-AT ?auto_302443 ?auto_302446 ) ( CLEAR ?auto_302443 ) ( IS-CRATE ?auto_302444 ) ( AVAILABLE ?auto_302450 ) ( AVAILABLE ?auto_302451 ) ( SURFACE-AT ?auto_302444 ?auto_302447 ) ( ON ?auto_302444 ?auto_302448 ) ( CLEAR ?auto_302444 ) ( not ( = ?auto_302444 ?auto_302448 ) ) ( not ( = ?auto_302445 ?auto_302448 ) ) ( not ( = ?auto_302443 ?auto_302448 ) ) ( not ( = ?auto_302452 ?auto_302448 ) ) ( TRUCK-AT ?auto_302449 ?auto_302446 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_302444 ?auto_302445 )
      ( MAKE-2CRATE-VERIFY ?auto_302443 ?auto_302444 ?auto_302445 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_302454 - SURFACE
      ?auto_302455 - SURFACE
      ?auto_302456 - SURFACE
      ?auto_302453 - SURFACE
    )
    :vars
    (
      ?auto_302460 - HOIST
      ?auto_302462 - PLACE
      ?auto_302461 - PLACE
      ?auto_302457 - HOIST
      ?auto_302463 - SURFACE
      ?auto_302459 - SURFACE
      ?auto_302458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302460 ?auto_302462 ) ( IS-CRATE ?auto_302453 ) ( not ( = ?auto_302456 ?auto_302453 ) ) ( not ( = ?auto_302455 ?auto_302456 ) ) ( not ( = ?auto_302455 ?auto_302453 ) ) ( not ( = ?auto_302461 ?auto_302462 ) ) ( HOIST-AT ?auto_302457 ?auto_302461 ) ( not ( = ?auto_302460 ?auto_302457 ) ) ( SURFACE-AT ?auto_302453 ?auto_302461 ) ( ON ?auto_302453 ?auto_302463 ) ( CLEAR ?auto_302453 ) ( not ( = ?auto_302456 ?auto_302463 ) ) ( not ( = ?auto_302453 ?auto_302463 ) ) ( not ( = ?auto_302455 ?auto_302463 ) ) ( SURFACE-AT ?auto_302455 ?auto_302462 ) ( CLEAR ?auto_302455 ) ( IS-CRATE ?auto_302456 ) ( AVAILABLE ?auto_302460 ) ( AVAILABLE ?auto_302457 ) ( SURFACE-AT ?auto_302456 ?auto_302461 ) ( ON ?auto_302456 ?auto_302459 ) ( CLEAR ?auto_302456 ) ( not ( = ?auto_302456 ?auto_302459 ) ) ( not ( = ?auto_302453 ?auto_302459 ) ) ( not ( = ?auto_302455 ?auto_302459 ) ) ( not ( = ?auto_302463 ?auto_302459 ) ) ( TRUCK-AT ?auto_302458 ?auto_302462 ) ( ON ?auto_302455 ?auto_302454 ) ( not ( = ?auto_302454 ?auto_302455 ) ) ( not ( = ?auto_302454 ?auto_302456 ) ) ( not ( = ?auto_302454 ?auto_302453 ) ) ( not ( = ?auto_302454 ?auto_302463 ) ) ( not ( = ?auto_302454 ?auto_302459 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302455 ?auto_302456 ?auto_302453 )
      ( MAKE-3CRATE-VERIFY ?auto_302454 ?auto_302455 ?auto_302456 ?auto_302453 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_302465 - SURFACE
      ?auto_302466 - SURFACE
      ?auto_302467 - SURFACE
      ?auto_302464 - SURFACE
      ?auto_302468 - SURFACE
    )
    :vars
    (
      ?auto_302472 - HOIST
      ?auto_302474 - PLACE
      ?auto_302473 - PLACE
      ?auto_302469 - HOIST
      ?auto_302475 - SURFACE
      ?auto_302471 - SURFACE
      ?auto_302470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302472 ?auto_302474 ) ( IS-CRATE ?auto_302468 ) ( not ( = ?auto_302464 ?auto_302468 ) ) ( not ( = ?auto_302467 ?auto_302464 ) ) ( not ( = ?auto_302467 ?auto_302468 ) ) ( not ( = ?auto_302473 ?auto_302474 ) ) ( HOIST-AT ?auto_302469 ?auto_302473 ) ( not ( = ?auto_302472 ?auto_302469 ) ) ( SURFACE-AT ?auto_302468 ?auto_302473 ) ( ON ?auto_302468 ?auto_302475 ) ( CLEAR ?auto_302468 ) ( not ( = ?auto_302464 ?auto_302475 ) ) ( not ( = ?auto_302468 ?auto_302475 ) ) ( not ( = ?auto_302467 ?auto_302475 ) ) ( SURFACE-AT ?auto_302467 ?auto_302474 ) ( CLEAR ?auto_302467 ) ( IS-CRATE ?auto_302464 ) ( AVAILABLE ?auto_302472 ) ( AVAILABLE ?auto_302469 ) ( SURFACE-AT ?auto_302464 ?auto_302473 ) ( ON ?auto_302464 ?auto_302471 ) ( CLEAR ?auto_302464 ) ( not ( = ?auto_302464 ?auto_302471 ) ) ( not ( = ?auto_302468 ?auto_302471 ) ) ( not ( = ?auto_302467 ?auto_302471 ) ) ( not ( = ?auto_302475 ?auto_302471 ) ) ( TRUCK-AT ?auto_302470 ?auto_302474 ) ( ON ?auto_302466 ?auto_302465 ) ( ON ?auto_302467 ?auto_302466 ) ( not ( = ?auto_302465 ?auto_302466 ) ) ( not ( = ?auto_302465 ?auto_302467 ) ) ( not ( = ?auto_302465 ?auto_302464 ) ) ( not ( = ?auto_302465 ?auto_302468 ) ) ( not ( = ?auto_302465 ?auto_302475 ) ) ( not ( = ?auto_302465 ?auto_302471 ) ) ( not ( = ?auto_302466 ?auto_302467 ) ) ( not ( = ?auto_302466 ?auto_302464 ) ) ( not ( = ?auto_302466 ?auto_302468 ) ) ( not ( = ?auto_302466 ?auto_302475 ) ) ( not ( = ?auto_302466 ?auto_302471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302467 ?auto_302464 ?auto_302468 )
      ( MAKE-4CRATE-VERIFY ?auto_302465 ?auto_302466 ?auto_302467 ?auto_302464 ?auto_302468 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_302477 - SURFACE
      ?auto_302478 - SURFACE
      ?auto_302479 - SURFACE
      ?auto_302476 - SURFACE
      ?auto_302480 - SURFACE
      ?auto_302481 - SURFACE
    )
    :vars
    (
      ?auto_302485 - HOIST
      ?auto_302487 - PLACE
      ?auto_302486 - PLACE
      ?auto_302482 - HOIST
      ?auto_302488 - SURFACE
      ?auto_302484 - SURFACE
      ?auto_302483 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302485 ?auto_302487 ) ( IS-CRATE ?auto_302481 ) ( not ( = ?auto_302480 ?auto_302481 ) ) ( not ( = ?auto_302476 ?auto_302480 ) ) ( not ( = ?auto_302476 ?auto_302481 ) ) ( not ( = ?auto_302486 ?auto_302487 ) ) ( HOIST-AT ?auto_302482 ?auto_302486 ) ( not ( = ?auto_302485 ?auto_302482 ) ) ( SURFACE-AT ?auto_302481 ?auto_302486 ) ( ON ?auto_302481 ?auto_302488 ) ( CLEAR ?auto_302481 ) ( not ( = ?auto_302480 ?auto_302488 ) ) ( not ( = ?auto_302481 ?auto_302488 ) ) ( not ( = ?auto_302476 ?auto_302488 ) ) ( SURFACE-AT ?auto_302476 ?auto_302487 ) ( CLEAR ?auto_302476 ) ( IS-CRATE ?auto_302480 ) ( AVAILABLE ?auto_302485 ) ( AVAILABLE ?auto_302482 ) ( SURFACE-AT ?auto_302480 ?auto_302486 ) ( ON ?auto_302480 ?auto_302484 ) ( CLEAR ?auto_302480 ) ( not ( = ?auto_302480 ?auto_302484 ) ) ( not ( = ?auto_302481 ?auto_302484 ) ) ( not ( = ?auto_302476 ?auto_302484 ) ) ( not ( = ?auto_302488 ?auto_302484 ) ) ( TRUCK-AT ?auto_302483 ?auto_302487 ) ( ON ?auto_302478 ?auto_302477 ) ( ON ?auto_302479 ?auto_302478 ) ( ON ?auto_302476 ?auto_302479 ) ( not ( = ?auto_302477 ?auto_302478 ) ) ( not ( = ?auto_302477 ?auto_302479 ) ) ( not ( = ?auto_302477 ?auto_302476 ) ) ( not ( = ?auto_302477 ?auto_302480 ) ) ( not ( = ?auto_302477 ?auto_302481 ) ) ( not ( = ?auto_302477 ?auto_302488 ) ) ( not ( = ?auto_302477 ?auto_302484 ) ) ( not ( = ?auto_302478 ?auto_302479 ) ) ( not ( = ?auto_302478 ?auto_302476 ) ) ( not ( = ?auto_302478 ?auto_302480 ) ) ( not ( = ?auto_302478 ?auto_302481 ) ) ( not ( = ?auto_302478 ?auto_302488 ) ) ( not ( = ?auto_302478 ?auto_302484 ) ) ( not ( = ?auto_302479 ?auto_302476 ) ) ( not ( = ?auto_302479 ?auto_302480 ) ) ( not ( = ?auto_302479 ?auto_302481 ) ) ( not ( = ?auto_302479 ?auto_302488 ) ) ( not ( = ?auto_302479 ?auto_302484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302476 ?auto_302480 ?auto_302481 )
      ( MAKE-5CRATE-VERIFY ?auto_302477 ?auto_302478 ?auto_302479 ?auto_302476 ?auto_302480 ?auto_302481 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_302490 - SURFACE
      ?auto_302491 - SURFACE
      ?auto_302492 - SURFACE
      ?auto_302489 - SURFACE
      ?auto_302493 - SURFACE
      ?auto_302495 - SURFACE
      ?auto_302494 - SURFACE
    )
    :vars
    (
      ?auto_302499 - HOIST
      ?auto_302501 - PLACE
      ?auto_302500 - PLACE
      ?auto_302496 - HOIST
      ?auto_302502 - SURFACE
      ?auto_302498 - SURFACE
      ?auto_302497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302499 ?auto_302501 ) ( IS-CRATE ?auto_302494 ) ( not ( = ?auto_302495 ?auto_302494 ) ) ( not ( = ?auto_302493 ?auto_302495 ) ) ( not ( = ?auto_302493 ?auto_302494 ) ) ( not ( = ?auto_302500 ?auto_302501 ) ) ( HOIST-AT ?auto_302496 ?auto_302500 ) ( not ( = ?auto_302499 ?auto_302496 ) ) ( SURFACE-AT ?auto_302494 ?auto_302500 ) ( ON ?auto_302494 ?auto_302502 ) ( CLEAR ?auto_302494 ) ( not ( = ?auto_302495 ?auto_302502 ) ) ( not ( = ?auto_302494 ?auto_302502 ) ) ( not ( = ?auto_302493 ?auto_302502 ) ) ( SURFACE-AT ?auto_302493 ?auto_302501 ) ( CLEAR ?auto_302493 ) ( IS-CRATE ?auto_302495 ) ( AVAILABLE ?auto_302499 ) ( AVAILABLE ?auto_302496 ) ( SURFACE-AT ?auto_302495 ?auto_302500 ) ( ON ?auto_302495 ?auto_302498 ) ( CLEAR ?auto_302495 ) ( not ( = ?auto_302495 ?auto_302498 ) ) ( not ( = ?auto_302494 ?auto_302498 ) ) ( not ( = ?auto_302493 ?auto_302498 ) ) ( not ( = ?auto_302502 ?auto_302498 ) ) ( TRUCK-AT ?auto_302497 ?auto_302501 ) ( ON ?auto_302491 ?auto_302490 ) ( ON ?auto_302492 ?auto_302491 ) ( ON ?auto_302489 ?auto_302492 ) ( ON ?auto_302493 ?auto_302489 ) ( not ( = ?auto_302490 ?auto_302491 ) ) ( not ( = ?auto_302490 ?auto_302492 ) ) ( not ( = ?auto_302490 ?auto_302489 ) ) ( not ( = ?auto_302490 ?auto_302493 ) ) ( not ( = ?auto_302490 ?auto_302495 ) ) ( not ( = ?auto_302490 ?auto_302494 ) ) ( not ( = ?auto_302490 ?auto_302502 ) ) ( not ( = ?auto_302490 ?auto_302498 ) ) ( not ( = ?auto_302491 ?auto_302492 ) ) ( not ( = ?auto_302491 ?auto_302489 ) ) ( not ( = ?auto_302491 ?auto_302493 ) ) ( not ( = ?auto_302491 ?auto_302495 ) ) ( not ( = ?auto_302491 ?auto_302494 ) ) ( not ( = ?auto_302491 ?auto_302502 ) ) ( not ( = ?auto_302491 ?auto_302498 ) ) ( not ( = ?auto_302492 ?auto_302489 ) ) ( not ( = ?auto_302492 ?auto_302493 ) ) ( not ( = ?auto_302492 ?auto_302495 ) ) ( not ( = ?auto_302492 ?auto_302494 ) ) ( not ( = ?auto_302492 ?auto_302502 ) ) ( not ( = ?auto_302492 ?auto_302498 ) ) ( not ( = ?auto_302489 ?auto_302493 ) ) ( not ( = ?auto_302489 ?auto_302495 ) ) ( not ( = ?auto_302489 ?auto_302494 ) ) ( not ( = ?auto_302489 ?auto_302502 ) ) ( not ( = ?auto_302489 ?auto_302498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302493 ?auto_302495 ?auto_302494 )
      ( MAKE-6CRATE-VERIFY ?auto_302490 ?auto_302491 ?auto_302492 ?auto_302489 ?auto_302493 ?auto_302495 ?auto_302494 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_302504 - SURFACE
      ?auto_302505 - SURFACE
      ?auto_302506 - SURFACE
      ?auto_302503 - SURFACE
      ?auto_302507 - SURFACE
      ?auto_302509 - SURFACE
      ?auto_302508 - SURFACE
      ?auto_302510 - SURFACE
    )
    :vars
    (
      ?auto_302514 - HOIST
      ?auto_302516 - PLACE
      ?auto_302515 - PLACE
      ?auto_302511 - HOIST
      ?auto_302517 - SURFACE
      ?auto_302513 - SURFACE
      ?auto_302512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302514 ?auto_302516 ) ( IS-CRATE ?auto_302510 ) ( not ( = ?auto_302508 ?auto_302510 ) ) ( not ( = ?auto_302509 ?auto_302508 ) ) ( not ( = ?auto_302509 ?auto_302510 ) ) ( not ( = ?auto_302515 ?auto_302516 ) ) ( HOIST-AT ?auto_302511 ?auto_302515 ) ( not ( = ?auto_302514 ?auto_302511 ) ) ( SURFACE-AT ?auto_302510 ?auto_302515 ) ( ON ?auto_302510 ?auto_302517 ) ( CLEAR ?auto_302510 ) ( not ( = ?auto_302508 ?auto_302517 ) ) ( not ( = ?auto_302510 ?auto_302517 ) ) ( not ( = ?auto_302509 ?auto_302517 ) ) ( SURFACE-AT ?auto_302509 ?auto_302516 ) ( CLEAR ?auto_302509 ) ( IS-CRATE ?auto_302508 ) ( AVAILABLE ?auto_302514 ) ( AVAILABLE ?auto_302511 ) ( SURFACE-AT ?auto_302508 ?auto_302515 ) ( ON ?auto_302508 ?auto_302513 ) ( CLEAR ?auto_302508 ) ( not ( = ?auto_302508 ?auto_302513 ) ) ( not ( = ?auto_302510 ?auto_302513 ) ) ( not ( = ?auto_302509 ?auto_302513 ) ) ( not ( = ?auto_302517 ?auto_302513 ) ) ( TRUCK-AT ?auto_302512 ?auto_302516 ) ( ON ?auto_302505 ?auto_302504 ) ( ON ?auto_302506 ?auto_302505 ) ( ON ?auto_302503 ?auto_302506 ) ( ON ?auto_302507 ?auto_302503 ) ( ON ?auto_302509 ?auto_302507 ) ( not ( = ?auto_302504 ?auto_302505 ) ) ( not ( = ?auto_302504 ?auto_302506 ) ) ( not ( = ?auto_302504 ?auto_302503 ) ) ( not ( = ?auto_302504 ?auto_302507 ) ) ( not ( = ?auto_302504 ?auto_302509 ) ) ( not ( = ?auto_302504 ?auto_302508 ) ) ( not ( = ?auto_302504 ?auto_302510 ) ) ( not ( = ?auto_302504 ?auto_302517 ) ) ( not ( = ?auto_302504 ?auto_302513 ) ) ( not ( = ?auto_302505 ?auto_302506 ) ) ( not ( = ?auto_302505 ?auto_302503 ) ) ( not ( = ?auto_302505 ?auto_302507 ) ) ( not ( = ?auto_302505 ?auto_302509 ) ) ( not ( = ?auto_302505 ?auto_302508 ) ) ( not ( = ?auto_302505 ?auto_302510 ) ) ( not ( = ?auto_302505 ?auto_302517 ) ) ( not ( = ?auto_302505 ?auto_302513 ) ) ( not ( = ?auto_302506 ?auto_302503 ) ) ( not ( = ?auto_302506 ?auto_302507 ) ) ( not ( = ?auto_302506 ?auto_302509 ) ) ( not ( = ?auto_302506 ?auto_302508 ) ) ( not ( = ?auto_302506 ?auto_302510 ) ) ( not ( = ?auto_302506 ?auto_302517 ) ) ( not ( = ?auto_302506 ?auto_302513 ) ) ( not ( = ?auto_302503 ?auto_302507 ) ) ( not ( = ?auto_302503 ?auto_302509 ) ) ( not ( = ?auto_302503 ?auto_302508 ) ) ( not ( = ?auto_302503 ?auto_302510 ) ) ( not ( = ?auto_302503 ?auto_302517 ) ) ( not ( = ?auto_302503 ?auto_302513 ) ) ( not ( = ?auto_302507 ?auto_302509 ) ) ( not ( = ?auto_302507 ?auto_302508 ) ) ( not ( = ?auto_302507 ?auto_302510 ) ) ( not ( = ?auto_302507 ?auto_302517 ) ) ( not ( = ?auto_302507 ?auto_302513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302509 ?auto_302508 ?auto_302510 )
      ( MAKE-7CRATE-VERIFY ?auto_302504 ?auto_302505 ?auto_302506 ?auto_302503 ?auto_302507 ?auto_302509 ?auto_302508 ?auto_302510 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_302519 - SURFACE
      ?auto_302520 - SURFACE
      ?auto_302521 - SURFACE
      ?auto_302518 - SURFACE
      ?auto_302522 - SURFACE
      ?auto_302524 - SURFACE
      ?auto_302523 - SURFACE
      ?auto_302525 - SURFACE
      ?auto_302526 - SURFACE
    )
    :vars
    (
      ?auto_302530 - HOIST
      ?auto_302532 - PLACE
      ?auto_302531 - PLACE
      ?auto_302527 - HOIST
      ?auto_302533 - SURFACE
      ?auto_302529 - SURFACE
      ?auto_302528 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302530 ?auto_302532 ) ( IS-CRATE ?auto_302526 ) ( not ( = ?auto_302525 ?auto_302526 ) ) ( not ( = ?auto_302523 ?auto_302525 ) ) ( not ( = ?auto_302523 ?auto_302526 ) ) ( not ( = ?auto_302531 ?auto_302532 ) ) ( HOIST-AT ?auto_302527 ?auto_302531 ) ( not ( = ?auto_302530 ?auto_302527 ) ) ( SURFACE-AT ?auto_302526 ?auto_302531 ) ( ON ?auto_302526 ?auto_302533 ) ( CLEAR ?auto_302526 ) ( not ( = ?auto_302525 ?auto_302533 ) ) ( not ( = ?auto_302526 ?auto_302533 ) ) ( not ( = ?auto_302523 ?auto_302533 ) ) ( SURFACE-AT ?auto_302523 ?auto_302532 ) ( CLEAR ?auto_302523 ) ( IS-CRATE ?auto_302525 ) ( AVAILABLE ?auto_302530 ) ( AVAILABLE ?auto_302527 ) ( SURFACE-AT ?auto_302525 ?auto_302531 ) ( ON ?auto_302525 ?auto_302529 ) ( CLEAR ?auto_302525 ) ( not ( = ?auto_302525 ?auto_302529 ) ) ( not ( = ?auto_302526 ?auto_302529 ) ) ( not ( = ?auto_302523 ?auto_302529 ) ) ( not ( = ?auto_302533 ?auto_302529 ) ) ( TRUCK-AT ?auto_302528 ?auto_302532 ) ( ON ?auto_302520 ?auto_302519 ) ( ON ?auto_302521 ?auto_302520 ) ( ON ?auto_302518 ?auto_302521 ) ( ON ?auto_302522 ?auto_302518 ) ( ON ?auto_302524 ?auto_302522 ) ( ON ?auto_302523 ?auto_302524 ) ( not ( = ?auto_302519 ?auto_302520 ) ) ( not ( = ?auto_302519 ?auto_302521 ) ) ( not ( = ?auto_302519 ?auto_302518 ) ) ( not ( = ?auto_302519 ?auto_302522 ) ) ( not ( = ?auto_302519 ?auto_302524 ) ) ( not ( = ?auto_302519 ?auto_302523 ) ) ( not ( = ?auto_302519 ?auto_302525 ) ) ( not ( = ?auto_302519 ?auto_302526 ) ) ( not ( = ?auto_302519 ?auto_302533 ) ) ( not ( = ?auto_302519 ?auto_302529 ) ) ( not ( = ?auto_302520 ?auto_302521 ) ) ( not ( = ?auto_302520 ?auto_302518 ) ) ( not ( = ?auto_302520 ?auto_302522 ) ) ( not ( = ?auto_302520 ?auto_302524 ) ) ( not ( = ?auto_302520 ?auto_302523 ) ) ( not ( = ?auto_302520 ?auto_302525 ) ) ( not ( = ?auto_302520 ?auto_302526 ) ) ( not ( = ?auto_302520 ?auto_302533 ) ) ( not ( = ?auto_302520 ?auto_302529 ) ) ( not ( = ?auto_302521 ?auto_302518 ) ) ( not ( = ?auto_302521 ?auto_302522 ) ) ( not ( = ?auto_302521 ?auto_302524 ) ) ( not ( = ?auto_302521 ?auto_302523 ) ) ( not ( = ?auto_302521 ?auto_302525 ) ) ( not ( = ?auto_302521 ?auto_302526 ) ) ( not ( = ?auto_302521 ?auto_302533 ) ) ( not ( = ?auto_302521 ?auto_302529 ) ) ( not ( = ?auto_302518 ?auto_302522 ) ) ( not ( = ?auto_302518 ?auto_302524 ) ) ( not ( = ?auto_302518 ?auto_302523 ) ) ( not ( = ?auto_302518 ?auto_302525 ) ) ( not ( = ?auto_302518 ?auto_302526 ) ) ( not ( = ?auto_302518 ?auto_302533 ) ) ( not ( = ?auto_302518 ?auto_302529 ) ) ( not ( = ?auto_302522 ?auto_302524 ) ) ( not ( = ?auto_302522 ?auto_302523 ) ) ( not ( = ?auto_302522 ?auto_302525 ) ) ( not ( = ?auto_302522 ?auto_302526 ) ) ( not ( = ?auto_302522 ?auto_302533 ) ) ( not ( = ?auto_302522 ?auto_302529 ) ) ( not ( = ?auto_302524 ?auto_302523 ) ) ( not ( = ?auto_302524 ?auto_302525 ) ) ( not ( = ?auto_302524 ?auto_302526 ) ) ( not ( = ?auto_302524 ?auto_302533 ) ) ( not ( = ?auto_302524 ?auto_302529 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302523 ?auto_302525 ?auto_302526 )
      ( MAKE-8CRATE-VERIFY ?auto_302519 ?auto_302520 ?auto_302521 ?auto_302518 ?auto_302522 ?auto_302524 ?auto_302523 ?auto_302525 ?auto_302526 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_302534 - SURFACE
      ?auto_302535 - SURFACE
    )
    :vars
    (
      ?auto_302540 - HOIST
      ?auto_302542 - PLACE
      ?auto_302538 - SURFACE
      ?auto_302541 - PLACE
      ?auto_302536 - HOIST
      ?auto_302543 - SURFACE
      ?auto_302539 - SURFACE
      ?auto_302537 - TRUCK
      ?auto_302544 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_302540 ?auto_302542 ) ( IS-CRATE ?auto_302535 ) ( not ( = ?auto_302534 ?auto_302535 ) ) ( not ( = ?auto_302538 ?auto_302534 ) ) ( not ( = ?auto_302538 ?auto_302535 ) ) ( not ( = ?auto_302541 ?auto_302542 ) ) ( HOIST-AT ?auto_302536 ?auto_302541 ) ( not ( = ?auto_302540 ?auto_302536 ) ) ( SURFACE-AT ?auto_302535 ?auto_302541 ) ( ON ?auto_302535 ?auto_302543 ) ( CLEAR ?auto_302535 ) ( not ( = ?auto_302534 ?auto_302543 ) ) ( not ( = ?auto_302535 ?auto_302543 ) ) ( not ( = ?auto_302538 ?auto_302543 ) ) ( IS-CRATE ?auto_302534 ) ( AVAILABLE ?auto_302536 ) ( SURFACE-AT ?auto_302534 ?auto_302541 ) ( ON ?auto_302534 ?auto_302539 ) ( CLEAR ?auto_302534 ) ( not ( = ?auto_302534 ?auto_302539 ) ) ( not ( = ?auto_302535 ?auto_302539 ) ) ( not ( = ?auto_302538 ?auto_302539 ) ) ( not ( = ?auto_302543 ?auto_302539 ) ) ( TRUCK-AT ?auto_302537 ?auto_302542 ) ( SURFACE-AT ?auto_302544 ?auto_302542 ) ( CLEAR ?auto_302544 ) ( LIFTING ?auto_302540 ?auto_302538 ) ( IS-CRATE ?auto_302538 ) ( not ( = ?auto_302544 ?auto_302538 ) ) ( not ( = ?auto_302534 ?auto_302544 ) ) ( not ( = ?auto_302535 ?auto_302544 ) ) ( not ( = ?auto_302543 ?auto_302544 ) ) ( not ( = ?auto_302539 ?auto_302544 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_302544 ?auto_302538 )
      ( MAKE-2CRATE ?auto_302538 ?auto_302534 ?auto_302535 )
      ( MAKE-1CRATE-VERIFY ?auto_302534 ?auto_302535 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_302545 - SURFACE
      ?auto_302546 - SURFACE
      ?auto_302547 - SURFACE
    )
    :vars
    (
      ?auto_302548 - HOIST
      ?auto_302555 - PLACE
      ?auto_302554 - PLACE
      ?auto_302553 - HOIST
      ?auto_302549 - SURFACE
      ?auto_302552 - SURFACE
      ?auto_302550 - TRUCK
      ?auto_302551 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_302548 ?auto_302555 ) ( IS-CRATE ?auto_302547 ) ( not ( = ?auto_302546 ?auto_302547 ) ) ( not ( = ?auto_302545 ?auto_302546 ) ) ( not ( = ?auto_302545 ?auto_302547 ) ) ( not ( = ?auto_302554 ?auto_302555 ) ) ( HOIST-AT ?auto_302553 ?auto_302554 ) ( not ( = ?auto_302548 ?auto_302553 ) ) ( SURFACE-AT ?auto_302547 ?auto_302554 ) ( ON ?auto_302547 ?auto_302549 ) ( CLEAR ?auto_302547 ) ( not ( = ?auto_302546 ?auto_302549 ) ) ( not ( = ?auto_302547 ?auto_302549 ) ) ( not ( = ?auto_302545 ?auto_302549 ) ) ( IS-CRATE ?auto_302546 ) ( AVAILABLE ?auto_302553 ) ( SURFACE-AT ?auto_302546 ?auto_302554 ) ( ON ?auto_302546 ?auto_302552 ) ( CLEAR ?auto_302546 ) ( not ( = ?auto_302546 ?auto_302552 ) ) ( not ( = ?auto_302547 ?auto_302552 ) ) ( not ( = ?auto_302545 ?auto_302552 ) ) ( not ( = ?auto_302549 ?auto_302552 ) ) ( TRUCK-AT ?auto_302550 ?auto_302555 ) ( SURFACE-AT ?auto_302551 ?auto_302555 ) ( CLEAR ?auto_302551 ) ( LIFTING ?auto_302548 ?auto_302545 ) ( IS-CRATE ?auto_302545 ) ( not ( = ?auto_302551 ?auto_302545 ) ) ( not ( = ?auto_302546 ?auto_302551 ) ) ( not ( = ?auto_302547 ?auto_302551 ) ) ( not ( = ?auto_302549 ?auto_302551 ) ) ( not ( = ?auto_302552 ?auto_302551 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_302546 ?auto_302547 )
      ( MAKE-2CRATE-VERIFY ?auto_302545 ?auto_302546 ?auto_302547 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_302557 - SURFACE
      ?auto_302558 - SURFACE
      ?auto_302559 - SURFACE
      ?auto_302556 - SURFACE
    )
    :vars
    (
      ?auto_302566 - HOIST
      ?auto_302562 - PLACE
      ?auto_302561 - PLACE
      ?auto_302564 - HOIST
      ?auto_302563 - SURFACE
      ?auto_302565 - SURFACE
      ?auto_302560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302566 ?auto_302562 ) ( IS-CRATE ?auto_302556 ) ( not ( = ?auto_302559 ?auto_302556 ) ) ( not ( = ?auto_302558 ?auto_302559 ) ) ( not ( = ?auto_302558 ?auto_302556 ) ) ( not ( = ?auto_302561 ?auto_302562 ) ) ( HOIST-AT ?auto_302564 ?auto_302561 ) ( not ( = ?auto_302566 ?auto_302564 ) ) ( SURFACE-AT ?auto_302556 ?auto_302561 ) ( ON ?auto_302556 ?auto_302563 ) ( CLEAR ?auto_302556 ) ( not ( = ?auto_302559 ?auto_302563 ) ) ( not ( = ?auto_302556 ?auto_302563 ) ) ( not ( = ?auto_302558 ?auto_302563 ) ) ( IS-CRATE ?auto_302559 ) ( AVAILABLE ?auto_302564 ) ( SURFACE-AT ?auto_302559 ?auto_302561 ) ( ON ?auto_302559 ?auto_302565 ) ( CLEAR ?auto_302559 ) ( not ( = ?auto_302559 ?auto_302565 ) ) ( not ( = ?auto_302556 ?auto_302565 ) ) ( not ( = ?auto_302558 ?auto_302565 ) ) ( not ( = ?auto_302563 ?auto_302565 ) ) ( TRUCK-AT ?auto_302560 ?auto_302562 ) ( SURFACE-AT ?auto_302557 ?auto_302562 ) ( CLEAR ?auto_302557 ) ( LIFTING ?auto_302566 ?auto_302558 ) ( IS-CRATE ?auto_302558 ) ( not ( = ?auto_302557 ?auto_302558 ) ) ( not ( = ?auto_302559 ?auto_302557 ) ) ( not ( = ?auto_302556 ?auto_302557 ) ) ( not ( = ?auto_302563 ?auto_302557 ) ) ( not ( = ?auto_302565 ?auto_302557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302558 ?auto_302559 ?auto_302556 )
      ( MAKE-3CRATE-VERIFY ?auto_302557 ?auto_302558 ?auto_302559 ?auto_302556 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_302568 - SURFACE
      ?auto_302569 - SURFACE
      ?auto_302570 - SURFACE
      ?auto_302567 - SURFACE
      ?auto_302571 - SURFACE
    )
    :vars
    (
      ?auto_302578 - HOIST
      ?auto_302574 - PLACE
      ?auto_302573 - PLACE
      ?auto_302576 - HOIST
      ?auto_302575 - SURFACE
      ?auto_302577 - SURFACE
      ?auto_302572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302578 ?auto_302574 ) ( IS-CRATE ?auto_302571 ) ( not ( = ?auto_302567 ?auto_302571 ) ) ( not ( = ?auto_302570 ?auto_302567 ) ) ( not ( = ?auto_302570 ?auto_302571 ) ) ( not ( = ?auto_302573 ?auto_302574 ) ) ( HOIST-AT ?auto_302576 ?auto_302573 ) ( not ( = ?auto_302578 ?auto_302576 ) ) ( SURFACE-AT ?auto_302571 ?auto_302573 ) ( ON ?auto_302571 ?auto_302575 ) ( CLEAR ?auto_302571 ) ( not ( = ?auto_302567 ?auto_302575 ) ) ( not ( = ?auto_302571 ?auto_302575 ) ) ( not ( = ?auto_302570 ?auto_302575 ) ) ( IS-CRATE ?auto_302567 ) ( AVAILABLE ?auto_302576 ) ( SURFACE-AT ?auto_302567 ?auto_302573 ) ( ON ?auto_302567 ?auto_302577 ) ( CLEAR ?auto_302567 ) ( not ( = ?auto_302567 ?auto_302577 ) ) ( not ( = ?auto_302571 ?auto_302577 ) ) ( not ( = ?auto_302570 ?auto_302577 ) ) ( not ( = ?auto_302575 ?auto_302577 ) ) ( TRUCK-AT ?auto_302572 ?auto_302574 ) ( SURFACE-AT ?auto_302569 ?auto_302574 ) ( CLEAR ?auto_302569 ) ( LIFTING ?auto_302578 ?auto_302570 ) ( IS-CRATE ?auto_302570 ) ( not ( = ?auto_302569 ?auto_302570 ) ) ( not ( = ?auto_302567 ?auto_302569 ) ) ( not ( = ?auto_302571 ?auto_302569 ) ) ( not ( = ?auto_302575 ?auto_302569 ) ) ( not ( = ?auto_302577 ?auto_302569 ) ) ( ON ?auto_302569 ?auto_302568 ) ( not ( = ?auto_302568 ?auto_302569 ) ) ( not ( = ?auto_302568 ?auto_302570 ) ) ( not ( = ?auto_302568 ?auto_302567 ) ) ( not ( = ?auto_302568 ?auto_302571 ) ) ( not ( = ?auto_302568 ?auto_302575 ) ) ( not ( = ?auto_302568 ?auto_302577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302570 ?auto_302567 ?auto_302571 )
      ( MAKE-4CRATE-VERIFY ?auto_302568 ?auto_302569 ?auto_302570 ?auto_302567 ?auto_302571 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_302580 - SURFACE
      ?auto_302581 - SURFACE
      ?auto_302582 - SURFACE
      ?auto_302579 - SURFACE
      ?auto_302583 - SURFACE
      ?auto_302584 - SURFACE
    )
    :vars
    (
      ?auto_302591 - HOIST
      ?auto_302587 - PLACE
      ?auto_302586 - PLACE
      ?auto_302589 - HOIST
      ?auto_302588 - SURFACE
      ?auto_302590 - SURFACE
      ?auto_302585 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302591 ?auto_302587 ) ( IS-CRATE ?auto_302584 ) ( not ( = ?auto_302583 ?auto_302584 ) ) ( not ( = ?auto_302579 ?auto_302583 ) ) ( not ( = ?auto_302579 ?auto_302584 ) ) ( not ( = ?auto_302586 ?auto_302587 ) ) ( HOIST-AT ?auto_302589 ?auto_302586 ) ( not ( = ?auto_302591 ?auto_302589 ) ) ( SURFACE-AT ?auto_302584 ?auto_302586 ) ( ON ?auto_302584 ?auto_302588 ) ( CLEAR ?auto_302584 ) ( not ( = ?auto_302583 ?auto_302588 ) ) ( not ( = ?auto_302584 ?auto_302588 ) ) ( not ( = ?auto_302579 ?auto_302588 ) ) ( IS-CRATE ?auto_302583 ) ( AVAILABLE ?auto_302589 ) ( SURFACE-AT ?auto_302583 ?auto_302586 ) ( ON ?auto_302583 ?auto_302590 ) ( CLEAR ?auto_302583 ) ( not ( = ?auto_302583 ?auto_302590 ) ) ( not ( = ?auto_302584 ?auto_302590 ) ) ( not ( = ?auto_302579 ?auto_302590 ) ) ( not ( = ?auto_302588 ?auto_302590 ) ) ( TRUCK-AT ?auto_302585 ?auto_302587 ) ( SURFACE-AT ?auto_302582 ?auto_302587 ) ( CLEAR ?auto_302582 ) ( LIFTING ?auto_302591 ?auto_302579 ) ( IS-CRATE ?auto_302579 ) ( not ( = ?auto_302582 ?auto_302579 ) ) ( not ( = ?auto_302583 ?auto_302582 ) ) ( not ( = ?auto_302584 ?auto_302582 ) ) ( not ( = ?auto_302588 ?auto_302582 ) ) ( not ( = ?auto_302590 ?auto_302582 ) ) ( ON ?auto_302581 ?auto_302580 ) ( ON ?auto_302582 ?auto_302581 ) ( not ( = ?auto_302580 ?auto_302581 ) ) ( not ( = ?auto_302580 ?auto_302582 ) ) ( not ( = ?auto_302580 ?auto_302579 ) ) ( not ( = ?auto_302580 ?auto_302583 ) ) ( not ( = ?auto_302580 ?auto_302584 ) ) ( not ( = ?auto_302580 ?auto_302588 ) ) ( not ( = ?auto_302580 ?auto_302590 ) ) ( not ( = ?auto_302581 ?auto_302582 ) ) ( not ( = ?auto_302581 ?auto_302579 ) ) ( not ( = ?auto_302581 ?auto_302583 ) ) ( not ( = ?auto_302581 ?auto_302584 ) ) ( not ( = ?auto_302581 ?auto_302588 ) ) ( not ( = ?auto_302581 ?auto_302590 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302579 ?auto_302583 ?auto_302584 )
      ( MAKE-5CRATE-VERIFY ?auto_302580 ?auto_302581 ?auto_302582 ?auto_302579 ?auto_302583 ?auto_302584 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_302593 - SURFACE
      ?auto_302594 - SURFACE
      ?auto_302595 - SURFACE
      ?auto_302592 - SURFACE
      ?auto_302596 - SURFACE
      ?auto_302598 - SURFACE
      ?auto_302597 - SURFACE
    )
    :vars
    (
      ?auto_302605 - HOIST
      ?auto_302601 - PLACE
      ?auto_302600 - PLACE
      ?auto_302603 - HOIST
      ?auto_302602 - SURFACE
      ?auto_302604 - SURFACE
      ?auto_302599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302605 ?auto_302601 ) ( IS-CRATE ?auto_302597 ) ( not ( = ?auto_302598 ?auto_302597 ) ) ( not ( = ?auto_302596 ?auto_302598 ) ) ( not ( = ?auto_302596 ?auto_302597 ) ) ( not ( = ?auto_302600 ?auto_302601 ) ) ( HOIST-AT ?auto_302603 ?auto_302600 ) ( not ( = ?auto_302605 ?auto_302603 ) ) ( SURFACE-AT ?auto_302597 ?auto_302600 ) ( ON ?auto_302597 ?auto_302602 ) ( CLEAR ?auto_302597 ) ( not ( = ?auto_302598 ?auto_302602 ) ) ( not ( = ?auto_302597 ?auto_302602 ) ) ( not ( = ?auto_302596 ?auto_302602 ) ) ( IS-CRATE ?auto_302598 ) ( AVAILABLE ?auto_302603 ) ( SURFACE-AT ?auto_302598 ?auto_302600 ) ( ON ?auto_302598 ?auto_302604 ) ( CLEAR ?auto_302598 ) ( not ( = ?auto_302598 ?auto_302604 ) ) ( not ( = ?auto_302597 ?auto_302604 ) ) ( not ( = ?auto_302596 ?auto_302604 ) ) ( not ( = ?auto_302602 ?auto_302604 ) ) ( TRUCK-AT ?auto_302599 ?auto_302601 ) ( SURFACE-AT ?auto_302592 ?auto_302601 ) ( CLEAR ?auto_302592 ) ( LIFTING ?auto_302605 ?auto_302596 ) ( IS-CRATE ?auto_302596 ) ( not ( = ?auto_302592 ?auto_302596 ) ) ( not ( = ?auto_302598 ?auto_302592 ) ) ( not ( = ?auto_302597 ?auto_302592 ) ) ( not ( = ?auto_302602 ?auto_302592 ) ) ( not ( = ?auto_302604 ?auto_302592 ) ) ( ON ?auto_302594 ?auto_302593 ) ( ON ?auto_302595 ?auto_302594 ) ( ON ?auto_302592 ?auto_302595 ) ( not ( = ?auto_302593 ?auto_302594 ) ) ( not ( = ?auto_302593 ?auto_302595 ) ) ( not ( = ?auto_302593 ?auto_302592 ) ) ( not ( = ?auto_302593 ?auto_302596 ) ) ( not ( = ?auto_302593 ?auto_302598 ) ) ( not ( = ?auto_302593 ?auto_302597 ) ) ( not ( = ?auto_302593 ?auto_302602 ) ) ( not ( = ?auto_302593 ?auto_302604 ) ) ( not ( = ?auto_302594 ?auto_302595 ) ) ( not ( = ?auto_302594 ?auto_302592 ) ) ( not ( = ?auto_302594 ?auto_302596 ) ) ( not ( = ?auto_302594 ?auto_302598 ) ) ( not ( = ?auto_302594 ?auto_302597 ) ) ( not ( = ?auto_302594 ?auto_302602 ) ) ( not ( = ?auto_302594 ?auto_302604 ) ) ( not ( = ?auto_302595 ?auto_302592 ) ) ( not ( = ?auto_302595 ?auto_302596 ) ) ( not ( = ?auto_302595 ?auto_302598 ) ) ( not ( = ?auto_302595 ?auto_302597 ) ) ( not ( = ?auto_302595 ?auto_302602 ) ) ( not ( = ?auto_302595 ?auto_302604 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302596 ?auto_302598 ?auto_302597 )
      ( MAKE-6CRATE-VERIFY ?auto_302593 ?auto_302594 ?auto_302595 ?auto_302592 ?auto_302596 ?auto_302598 ?auto_302597 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_302607 - SURFACE
      ?auto_302608 - SURFACE
      ?auto_302609 - SURFACE
      ?auto_302606 - SURFACE
      ?auto_302610 - SURFACE
      ?auto_302612 - SURFACE
      ?auto_302611 - SURFACE
      ?auto_302613 - SURFACE
    )
    :vars
    (
      ?auto_302620 - HOIST
      ?auto_302616 - PLACE
      ?auto_302615 - PLACE
      ?auto_302618 - HOIST
      ?auto_302617 - SURFACE
      ?auto_302619 - SURFACE
      ?auto_302614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302620 ?auto_302616 ) ( IS-CRATE ?auto_302613 ) ( not ( = ?auto_302611 ?auto_302613 ) ) ( not ( = ?auto_302612 ?auto_302611 ) ) ( not ( = ?auto_302612 ?auto_302613 ) ) ( not ( = ?auto_302615 ?auto_302616 ) ) ( HOIST-AT ?auto_302618 ?auto_302615 ) ( not ( = ?auto_302620 ?auto_302618 ) ) ( SURFACE-AT ?auto_302613 ?auto_302615 ) ( ON ?auto_302613 ?auto_302617 ) ( CLEAR ?auto_302613 ) ( not ( = ?auto_302611 ?auto_302617 ) ) ( not ( = ?auto_302613 ?auto_302617 ) ) ( not ( = ?auto_302612 ?auto_302617 ) ) ( IS-CRATE ?auto_302611 ) ( AVAILABLE ?auto_302618 ) ( SURFACE-AT ?auto_302611 ?auto_302615 ) ( ON ?auto_302611 ?auto_302619 ) ( CLEAR ?auto_302611 ) ( not ( = ?auto_302611 ?auto_302619 ) ) ( not ( = ?auto_302613 ?auto_302619 ) ) ( not ( = ?auto_302612 ?auto_302619 ) ) ( not ( = ?auto_302617 ?auto_302619 ) ) ( TRUCK-AT ?auto_302614 ?auto_302616 ) ( SURFACE-AT ?auto_302610 ?auto_302616 ) ( CLEAR ?auto_302610 ) ( LIFTING ?auto_302620 ?auto_302612 ) ( IS-CRATE ?auto_302612 ) ( not ( = ?auto_302610 ?auto_302612 ) ) ( not ( = ?auto_302611 ?auto_302610 ) ) ( not ( = ?auto_302613 ?auto_302610 ) ) ( not ( = ?auto_302617 ?auto_302610 ) ) ( not ( = ?auto_302619 ?auto_302610 ) ) ( ON ?auto_302608 ?auto_302607 ) ( ON ?auto_302609 ?auto_302608 ) ( ON ?auto_302606 ?auto_302609 ) ( ON ?auto_302610 ?auto_302606 ) ( not ( = ?auto_302607 ?auto_302608 ) ) ( not ( = ?auto_302607 ?auto_302609 ) ) ( not ( = ?auto_302607 ?auto_302606 ) ) ( not ( = ?auto_302607 ?auto_302610 ) ) ( not ( = ?auto_302607 ?auto_302612 ) ) ( not ( = ?auto_302607 ?auto_302611 ) ) ( not ( = ?auto_302607 ?auto_302613 ) ) ( not ( = ?auto_302607 ?auto_302617 ) ) ( not ( = ?auto_302607 ?auto_302619 ) ) ( not ( = ?auto_302608 ?auto_302609 ) ) ( not ( = ?auto_302608 ?auto_302606 ) ) ( not ( = ?auto_302608 ?auto_302610 ) ) ( not ( = ?auto_302608 ?auto_302612 ) ) ( not ( = ?auto_302608 ?auto_302611 ) ) ( not ( = ?auto_302608 ?auto_302613 ) ) ( not ( = ?auto_302608 ?auto_302617 ) ) ( not ( = ?auto_302608 ?auto_302619 ) ) ( not ( = ?auto_302609 ?auto_302606 ) ) ( not ( = ?auto_302609 ?auto_302610 ) ) ( not ( = ?auto_302609 ?auto_302612 ) ) ( not ( = ?auto_302609 ?auto_302611 ) ) ( not ( = ?auto_302609 ?auto_302613 ) ) ( not ( = ?auto_302609 ?auto_302617 ) ) ( not ( = ?auto_302609 ?auto_302619 ) ) ( not ( = ?auto_302606 ?auto_302610 ) ) ( not ( = ?auto_302606 ?auto_302612 ) ) ( not ( = ?auto_302606 ?auto_302611 ) ) ( not ( = ?auto_302606 ?auto_302613 ) ) ( not ( = ?auto_302606 ?auto_302617 ) ) ( not ( = ?auto_302606 ?auto_302619 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302612 ?auto_302611 ?auto_302613 )
      ( MAKE-7CRATE-VERIFY ?auto_302607 ?auto_302608 ?auto_302609 ?auto_302606 ?auto_302610 ?auto_302612 ?auto_302611 ?auto_302613 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_302622 - SURFACE
      ?auto_302623 - SURFACE
      ?auto_302624 - SURFACE
      ?auto_302621 - SURFACE
      ?auto_302625 - SURFACE
      ?auto_302627 - SURFACE
      ?auto_302626 - SURFACE
      ?auto_302628 - SURFACE
      ?auto_302629 - SURFACE
    )
    :vars
    (
      ?auto_302636 - HOIST
      ?auto_302632 - PLACE
      ?auto_302631 - PLACE
      ?auto_302634 - HOIST
      ?auto_302633 - SURFACE
      ?auto_302635 - SURFACE
      ?auto_302630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_302636 ?auto_302632 ) ( IS-CRATE ?auto_302629 ) ( not ( = ?auto_302628 ?auto_302629 ) ) ( not ( = ?auto_302626 ?auto_302628 ) ) ( not ( = ?auto_302626 ?auto_302629 ) ) ( not ( = ?auto_302631 ?auto_302632 ) ) ( HOIST-AT ?auto_302634 ?auto_302631 ) ( not ( = ?auto_302636 ?auto_302634 ) ) ( SURFACE-AT ?auto_302629 ?auto_302631 ) ( ON ?auto_302629 ?auto_302633 ) ( CLEAR ?auto_302629 ) ( not ( = ?auto_302628 ?auto_302633 ) ) ( not ( = ?auto_302629 ?auto_302633 ) ) ( not ( = ?auto_302626 ?auto_302633 ) ) ( IS-CRATE ?auto_302628 ) ( AVAILABLE ?auto_302634 ) ( SURFACE-AT ?auto_302628 ?auto_302631 ) ( ON ?auto_302628 ?auto_302635 ) ( CLEAR ?auto_302628 ) ( not ( = ?auto_302628 ?auto_302635 ) ) ( not ( = ?auto_302629 ?auto_302635 ) ) ( not ( = ?auto_302626 ?auto_302635 ) ) ( not ( = ?auto_302633 ?auto_302635 ) ) ( TRUCK-AT ?auto_302630 ?auto_302632 ) ( SURFACE-AT ?auto_302627 ?auto_302632 ) ( CLEAR ?auto_302627 ) ( LIFTING ?auto_302636 ?auto_302626 ) ( IS-CRATE ?auto_302626 ) ( not ( = ?auto_302627 ?auto_302626 ) ) ( not ( = ?auto_302628 ?auto_302627 ) ) ( not ( = ?auto_302629 ?auto_302627 ) ) ( not ( = ?auto_302633 ?auto_302627 ) ) ( not ( = ?auto_302635 ?auto_302627 ) ) ( ON ?auto_302623 ?auto_302622 ) ( ON ?auto_302624 ?auto_302623 ) ( ON ?auto_302621 ?auto_302624 ) ( ON ?auto_302625 ?auto_302621 ) ( ON ?auto_302627 ?auto_302625 ) ( not ( = ?auto_302622 ?auto_302623 ) ) ( not ( = ?auto_302622 ?auto_302624 ) ) ( not ( = ?auto_302622 ?auto_302621 ) ) ( not ( = ?auto_302622 ?auto_302625 ) ) ( not ( = ?auto_302622 ?auto_302627 ) ) ( not ( = ?auto_302622 ?auto_302626 ) ) ( not ( = ?auto_302622 ?auto_302628 ) ) ( not ( = ?auto_302622 ?auto_302629 ) ) ( not ( = ?auto_302622 ?auto_302633 ) ) ( not ( = ?auto_302622 ?auto_302635 ) ) ( not ( = ?auto_302623 ?auto_302624 ) ) ( not ( = ?auto_302623 ?auto_302621 ) ) ( not ( = ?auto_302623 ?auto_302625 ) ) ( not ( = ?auto_302623 ?auto_302627 ) ) ( not ( = ?auto_302623 ?auto_302626 ) ) ( not ( = ?auto_302623 ?auto_302628 ) ) ( not ( = ?auto_302623 ?auto_302629 ) ) ( not ( = ?auto_302623 ?auto_302633 ) ) ( not ( = ?auto_302623 ?auto_302635 ) ) ( not ( = ?auto_302624 ?auto_302621 ) ) ( not ( = ?auto_302624 ?auto_302625 ) ) ( not ( = ?auto_302624 ?auto_302627 ) ) ( not ( = ?auto_302624 ?auto_302626 ) ) ( not ( = ?auto_302624 ?auto_302628 ) ) ( not ( = ?auto_302624 ?auto_302629 ) ) ( not ( = ?auto_302624 ?auto_302633 ) ) ( not ( = ?auto_302624 ?auto_302635 ) ) ( not ( = ?auto_302621 ?auto_302625 ) ) ( not ( = ?auto_302621 ?auto_302627 ) ) ( not ( = ?auto_302621 ?auto_302626 ) ) ( not ( = ?auto_302621 ?auto_302628 ) ) ( not ( = ?auto_302621 ?auto_302629 ) ) ( not ( = ?auto_302621 ?auto_302633 ) ) ( not ( = ?auto_302621 ?auto_302635 ) ) ( not ( = ?auto_302625 ?auto_302627 ) ) ( not ( = ?auto_302625 ?auto_302626 ) ) ( not ( = ?auto_302625 ?auto_302628 ) ) ( not ( = ?auto_302625 ?auto_302629 ) ) ( not ( = ?auto_302625 ?auto_302633 ) ) ( not ( = ?auto_302625 ?auto_302635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_302626 ?auto_302628 ?auto_302629 )
      ( MAKE-8CRATE-VERIFY ?auto_302622 ?auto_302623 ?auto_302624 ?auto_302621 ?auto_302625 ?auto_302627 ?auto_302626 ?auto_302628 ?auto_302629 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306159 - SURFACE
      ?auto_306160 - SURFACE
      ?auto_306161 - SURFACE
      ?auto_306158 - SURFACE
      ?auto_306162 - SURFACE
      ?auto_306164 - SURFACE
      ?auto_306163 - SURFACE
      ?auto_306165 - SURFACE
      ?auto_306166 - SURFACE
      ?auto_306167 - SURFACE
    )
    :vars
    (
      ?auto_306169 - HOIST
      ?auto_306168 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_306169 ?auto_306168 ) ( SURFACE-AT ?auto_306166 ?auto_306168 ) ( CLEAR ?auto_306166 ) ( LIFTING ?auto_306169 ?auto_306167 ) ( IS-CRATE ?auto_306167 ) ( not ( = ?auto_306166 ?auto_306167 ) ) ( ON ?auto_306160 ?auto_306159 ) ( ON ?auto_306161 ?auto_306160 ) ( ON ?auto_306158 ?auto_306161 ) ( ON ?auto_306162 ?auto_306158 ) ( ON ?auto_306164 ?auto_306162 ) ( ON ?auto_306163 ?auto_306164 ) ( ON ?auto_306165 ?auto_306163 ) ( ON ?auto_306166 ?auto_306165 ) ( not ( = ?auto_306159 ?auto_306160 ) ) ( not ( = ?auto_306159 ?auto_306161 ) ) ( not ( = ?auto_306159 ?auto_306158 ) ) ( not ( = ?auto_306159 ?auto_306162 ) ) ( not ( = ?auto_306159 ?auto_306164 ) ) ( not ( = ?auto_306159 ?auto_306163 ) ) ( not ( = ?auto_306159 ?auto_306165 ) ) ( not ( = ?auto_306159 ?auto_306166 ) ) ( not ( = ?auto_306159 ?auto_306167 ) ) ( not ( = ?auto_306160 ?auto_306161 ) ) ( not ( = ?auto_306160 ?auto_306158 ) ) ( not ( = ?auto_306160 ?auto_306162 ) ) ( not ( = ?auto_306160 ?auto_306164 ) ) ( not ( = ?auto_306160 ?auto_306163 ) ) ( not ( = ?auto_306160 ?auto_306165 ) ) ( not ( = ?auto_306160 ?auto_306166 ) ) ( not ( = ?auto_306160 ?auto_306167 ) ) ( not ( = ?auto_306161 ?auto_306158 ) ) ( not ( = ?auto_306161 ?auto_306162 ) ) ( not ( = ?auto_306161 ?auto_306164 ) ) ( not ( = ?auto_306161 ?auto_306163 ) ) ( not ( = ?auto_306161 ?auto_306165 ) ) ( not ( = ?auto_306161 ?auto_306166 ) ) ( not ( = ?auto_306161 ?auto_306167 ) ) ( not ( = ?auto_306158 ?auto_306162 ) ) ( not ( = ?auto_306158 ?auto_306164 ) ) ( not ( = ?auto_306158 ?auto_306163 ) ) ( not ( = ?auto_306158 ?auto_306165 ) ) ( not ( = ?auto_306158 ?auto_306166 ) ) ( not ( = ?auto_306158 ?auto_306167 ) ) ( not ( = ?auto_306162 ?auto_306164 ) ) ( not ( = ?auto_306162 ?auto_306163 ) ) ( not ( = ?auto_306162 ?auto_306165 ) ) ( not ( = ?auto_306162 ?auto_306166 ) ) ( not ( = ?auto_306162 ?auto_306167 ) ) ( not ( = ?auto_306164 ?auto_306163 ) ) ( not ( = ?auto_306164 ?auto_306165 ) ) ( not ( = ?auto_306164 ?auto_306166 ) ) ( not ( = ?auto_306164 ?auto_306167 ) ) ( not ( = ?auto_306163 ?auto_306165 ) ) ( not ( = ?auto_306163 ?auto_306166 ) ) ( not ( = ?auto_306163 ?auto_306167 ) ) ( not ( = ?auto_306165 ?auto_306166 ) ) ( not ( = ?auto_306165 ?auto_306167 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_306166 ?auto_306167 )
      ( MAKE-9CRATE-VERIFY ?auto_306159 ?auto_306160 ?auto_306161 ?auto_306158 ?auto_306162 ?auto_306164 ?auto_306163 ?auto_306165 ?auto_306166 ?auto_306167 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306239 - SURFACE
      ?auto_306240 - SURFACE
      ?auto_306241 - SURFACE
      ?auto_306238 - SURFACE
      ?auto_306242 - SURFACE
      ?auto_306244 - SURFACE
      ?auto_306243 - SURFACE
      ?auto_306245 - SURFACE
      ?auto_306246 - SURFACE
      ?auto_306247 - SURFACE
    )
    :vars
    (
      ?auto_306250 - HOIST
      ?auto_306249 - PLACE
      ?auto_306248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_306250 ?auto_306249 ) ( SURFACE-AT ?auto_306246 ?auto_306249 ) ( CLEAR ?auto_306246 ) ( IS-CRATE ?auto_306247 ) ( not ( = ?auto_306246 ?auto_306247 ) ) ( TRUCK-AT ?auto_306248 ?auto_306249 ) ( AVAILABLE ?auto_306250 ) ( IN ?auto_306247 ?auto_306248 ) ( ON ?auto_306246 ?auto_306245 ) ( not ( = ?auto_306245 ?auto_306246 ) ) ( not ( = ?auto_306245 ?auto_306247 ) ) ( ON ?auto_306240 ?auto_306239 ) ( ON ?auto_306241 ?auto_306240 ) ( ON ?auto_306238 ?auto_306241 ) ( ON ?auto_306242 ?auto_306238 ) ( ON ?auto_306244 ?auto_306242 ) ( ON ?auto_306243 ?auto_306244 ) ( ON ?auto_306245 ?auto_306243 ) ( not ( = ?auto_306239 ?auto_306240 ) ) ( not ( = ?auto_306239 ?auto_306241 ) ) ( not ( = ?auto_306239 ?auto_306238 ) ) ( not ( = ?auto_306239 ?auto_306242 ) ) ( not ( = ?auto_306239 ?auto_306244 ) ) ( not ( = ?auto_306239 ?auto_306243 ) ) ( not ( = ?auto_306239 ?auto_306245 ) ) ( not ( = ?auto_306239 ?auto_306246 ) ) ( not ( = ?auto_306239 ?auto_306247 ) ) ( not ( = ?auto_306240 ?auto_306241 ) ) ( not ( = ?auto_306240 ?auto_306238 ) ) ( not ( = ?auto_306240 ?auto_306242 ) ) ( not ( = ?auto_306240 ?auto_306244 ) ) ( not ( = ?auto_306240 ?auto_306243 ) ) ( not ( = ?auto_306240 ?auto_306245 ) ) ( not ( = ?auto_306240 ?auto_306246 ) ) ( not ( = ?auto_306240 ?auto_306247 ) ) ( not ( = ?auto_306241 ?auto_306238 ) ) ( not ( = ?auto_306241 ?auto_306242 ) ) ( not ( = ?auto_306241 ?auto_306244 ) ) ( not ( = ?auto_306241 ?auto_306243 ) ) ( not ( = ?auto_306241 ?auto_306245 ) ) ( not ( = ?auto_306241 ?auto_306246 ) ) ( not ( = ?auto_306241 ?auto_306247 ) ) ( not ( = ?auto_306238 ?auto_306242 ) ) ( not ( = ?auto_306238 ?auto_306244 ) ) ( not ( = ?auto_306238 ?auto_306243 ) ) ( not ( = ?auto_306238 ?auto_306245 ) ) ( not ( = ?auto_306238 ?auto_306246 ) ) ( not ( = ?auto_306238 ?auto_306247 ) ) ( not ( = ?auto_306242 ?auto_306244 ) ) ( not ( = ?auto_306242 ?auto_306243 ) ) ( not ( = ?auto_306242 ?auto_306245 ) ) ( not ( = ?auto_306242 ?auto_306246 ) ) ( not ( = ?auto_306242 ?auto_306247 ) ) ( not ( = ?auto_306244 ?auto_306243 ) ) ( not ( = ?auto_306244 ?auto_306245 ) ) ( not ( = ?auto_306244 ?auto_306246 ) ) ( not ( = ?auto_306244 ?auto_306247 ) ) ( not ( = ?auto_306243 ?auto_306245 ) ) ( not ( = ?auto_306243 ?auto_306246 ) ) ( not ( = ?auto_306243 ?auto_306247 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306245 ?auto_306246 ?auto_306247 )
      ( MAKE-9CRATE-VERIFY ?auto_306239 ?auto_306240 ?auto_306241 ?auto_306238 ?auto_306242 ?auto_306244 ?auto_306243 ?auto_306245 ?auto_306246 ?auto_306247 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306329 - SURFACE
      ?auto_306330 - SURFACE
      ?auto_306331 - SURFACE
      ?auto_306328 - SURFACE
      ?auto_306332 - SURFACE
      ?auto_306334 - SURFACE
      ?auto_306333 - SURFACE
      ?auto_306335 - SURFACE
      ?auto_306336 - SURFACE
      ?auto_306337 - SURFACE
    )
    :vars
    (
      ?auto_306338 - HOIST
      ?auto_306339 - PLACE
      ?auto_306340 - TRUCK
      ?auto_306341 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_306338 ?auto_306339 ) ( SURFACE-AT ?auto_306336 ?auto_306339 ) ( CLEAR ?auto_306336 ) ( IS-CRATE ?auto_306337 ) ( not ( = ?auto_306336 ?auto_306337 ) ) ( AVAILABLE ?auto_306338 ) ( IN ?auto_306337 ?auto_306340 ) ( ON ?auto_306336 ?auto_306335 ) ( not ( = ?auto_306335 ?auto_306336 ) ) ( not ( = ?auto_306335 ?auto_306337 ) ) ( TRUCK-AT ?auto_306340 ?auto_306341 ) ( not ( = ?auto_306341 ?auto_306339 ) ) ( ON ?auto_306330 ?auto_306329 ) ( ON ?auto_306331 ?auto_306330 ) ( ON ?auto_306328 ?auto_306331 ) ( ON ?auto_306332 ?auto_306328 ) ( ON ?auto_306334 ?auto_306332 ) ( ON ?auto_306333 ?auto_306334 ) ( ON ?auto_306335 ?auto_306333 ) ( not ( = ?auto_306329 ?auto_306330 ) ) ( not ( = ?auto_306329 ?auto_306331 ) ) ( not ( = ?auto_306329 ?auto_306328 ) ) ( not ( = ?auto_306329 ?auto_306332 ) ) ( not ( = ?auto_306329 ?auto_306334 ) ) ( not ( = ?auto_306329 ?auto_306333 ) ) ( not ( = ?auto_306329 ?auto_306335 ) ) ( not ( = ?auto_306329 ?auto_306336 ) ) ( not ( = ?auto_306329 ?auto_306337 ) ) ( not ( = ?auto_306330 ?auto_306331 ) ) ( not ( = ?auto_306330 ?auto_306328 ) ) ( not ( = ?auto_306330 ?auto_306332 ) ) ( not ( = ?auto_306330 ?auto_306334 ) ) ( not ( = ?auto_306330 ?auto_306333 ) ) ( not ( = ?auto_306330 ?auto_306335 ) ) ( not ( = ?auto_306330 ?auto_306336 ) ) ( not ( = ?auto_306330 ?auto_306337 ) ) ( not ( = ?auto_306331 ?auto_306328 ) ) ( not ( = ?auto_306331 ?auto_306332 ) ) ( not ( = ?auto_306331 ?auto_306334 ) ) ( not ( = ?auto_306331 ?auto_306333 ) ) ( not ( = ?auto_306331 ?auto_306335 ) ) ( not ( = ?auto_306331 ?auto_306336 ) ) ( not ( = ?auto_306331 ?auto_306337 ) ) ( not ( = ?auto_306328 ?auto_306332 ) ) ( not ( = ?auto_306328 ?auto_306334 ) ) ( not ( = ?auto_306328 ?auto_306333 ) ) ( not ( = ?auto_306328 ?auto_306335 ) ) ( not ( = ?auto_306328 ?auto_306336 ) ) ( not ( = ?auto_306328 ?auto_306337 ) ) ( not ( = ?auto_306332 ?auto_306334 ) ) ( not ( = ?auto_306332 ?auto_306333 ) ) ( not ( = ?auto_306332 ?auto_306335 ) ) ( not ( = ?auto_306332 ?auto_306336 ) ) ( not ( = ?auto_306332 ?auto_306337 ) ) ( not ( = ?auto_306334 ?auto_306333 ) ) ( not ( = ?auto_306334 ?auto_306335 ) ) ( not ( = ?auto_306334 ?auto_306336 ) ) ( not ( = ?auto_306334 ?auto_306337 ) ) ( not ( = ?auto_306333 ?auto_306335 ) ) ( not ( = ?auto_306333 ?auto_306336 ) ) ( not ( = ?auto_306333 ?auto_306337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306335 ?auto_306336 ?auto_306337 )
      ( MAKE-9CRATE-VERIFY ?auto_306329 ?auto_306330 ?auto_306331 ?auto_306328 ?auto_306332 ?auto_306334 ?auto_306333 ?auto_306335 ?auto_306336 ?auto_306337 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306428 - SURFACE
      ?auto_306429 - SURFACE
      ?auto_306430 - SURFACE
      ?auto_306427 - SURFACE
      ?auto_306431 - SURFACE
      ?auto_306433 - SURFACE
      ?auto_306432 - SURFACE
      ?auto_306434 - SURFACE
      ?auto_306435 - SURFACE
      ?auto_306436 - SURFACE
    )
    :vars
    (
      ?auto_306440 - HOIST
      ?auto_306441 - PLACE
      ?auto_306439 - TRUCK
      ?auto_306438 - PLACE
      ?auto_306437 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_306440 ?auto_306441 ) ( SURFACE-AT ?auto_306435 ?auto_306441 ) ( CLEAR ?auto_306435 ) ( IS-CRATE ?auto_306436 ) ( not ( = ?auto_306435 ?auto_306436 ) ) ( AVAILABLE ?auto_306440 ) ( ON ?auto_306435 ?auto_306434 ) ( not ( = ?auto_306434 ?auto_306435 ) ) ( not ( = ?auto_306434 ?auto_306436 ) ) ( TRUCK-AT ?auto_306439 ?auto_306438 ) ( not ( = ?auto_306438 ?auto_306441 ) ) ( HOIST-AT ?auto_306437 ?auto_306438 ) ( LIFTING ?auto_306437 ?auto_306436 ) ( not ( = ?auto_306440 ?auto_306437 ) ) ( ON ?auto_306429 ?auto_306428 ) ( ON ?auto_306430 ?auto_306429 ) ( ON ?auto_306427 ?auto_306430 ) ( ON ?auto_306431 ?auto_306427 ) ( ON ?auto_306433 ?auto_306431 ) ( ON ?auto_306432 ?auto_306433 ) ( ON ?auto_306434 ?auto_306432 ) ( not ( = ?auto_306428 ?auto_306429 ) ) ( not ( = ?auto_306428 ?auto_306430 ) ) ( not ( = ?auto_306428 ?auto_306427 ) ) ( not ( = ?auto_306428 ?auto_306431 ) ) ( not ( = ?auto_306428 ?auto_306433 ) ) ( not ( = ?auto_306428 ?auto_306432 ) ) ( not ( = ?auto_306428 ?auto_306434 ) ) ( not ( = ?auto_306428 ?auto_306435 ) ) ( not ( = ?auto_306428 ?auto_306436 ) ) ( not ( = ?auto_306429 ?auto_306430 ) ) ( not ( = ?auto_306429 ?auto_306427 ) ) ( not ( = ?auto_306429 ?auto_306431 ) ) ( not ( = ?auto_306429 ?auto_306433 ) ) ( not ( = ?auto_306429 ?auto_306432 ) ) ( not ( = ?auto_306429 ?auto_306434 ) ) ( not ( = ?auto_306429 ?auto_306435 ) ) ( not ( = ?auto_306429 ?auto_306436 ) ) ( not ( = ?auto_306430 ?auto_306427 ) ) ( not ( = ?auto_306430 ?auto_306431 ) ) ( not ( = ?auto_306430 ?auto_306433 ) ) ( not ( = ?auto_306430 ?auto_306432 ) ) ( not ( = ?auto_306430 ?auto_306434 ) ) ( not ( = ?auto_306430 ?auto_306435 ) ) ( not ( = ?auto_306430 ?auto_306436 ) ) ( not ( = ?auto_306427 ?auto_306431 ) ) ( not ( = ?auto_306427 ?auto_306433 ) ) ( not ( = ?auto_306427 ?auto_306432 ) ) ( not ( = ?auto_306427 ?auto_306434 ) ) ( not ( = ?auto_306427 ?auto_306435 ) ) ( not ( = ?auto_306427 ?auto_306436 ) ) ( not ( = ?auto_306431 ?auto_306433 ) ) ( not ( = ?auto_306431 ?auto_306432 ) ) ( not ( = ?auto_306431 ?auto_306434 ) ) ( not ( = ?auto_306431 ?auto_306435 ) ) ( not ( = ?auto_306431 ?auto_306436 ) ) ( not ( = ?auto_306433 ?auto_306432 ) ) ( not ( = ?auto_306433 ?auto_306434 ) ) ( not ( = ?auto_306433 ?auto_306435 ) ) ( not ( = ?auto_306433 ?auto_306436 ) ) ( not ( = ?auto_306432 ?auto_306434 ) ) ( not ( = ?auto_306432 ?auto_306435 ) ) ( not ( = ?auto_306432 ?auto_306436 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306434 ?auto_306435 ?auto_306436 )
      ( MAKE-9CRATE-VERIFY ?auto_306428 ?auto_306429 ?auto_306430 ?auto_306427 ?auto_306431 ?auto_306433 ?auto_306432 ?auto_306434 ?auto_306435 ?auto_306436 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306536 - SURFACE
      ?auto_306537 - SURFACE
      ?auto_306538 - SURFACE
      ?auto_306535 - SURFACE
      ?auto_306539 - SURFACE
      ?auto_306541 - SURFACE
      ?auto_306540 - SURFACE
      ?auto_306542 - SURFACE
      ?auto_306543 - SURFACE
      ?auto_306544 - SURFACE
    )
    :vars
    (
      ?auto_306547 - HOIST
      ?auto_306545 - PLACE
      ?auto_306548 - TRUCK
      ?auto_306546 - PLACE
      ?auto_306550 - HOIST
      ?auto_306549 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_306547 ?auto_306545 ) ( SURFACE-AT ?auto_306543 ?auto_306545 ) ( CLEAR ?auto_306543 ) ( IS-CRATE ?auto_306544 ) ( not ( = ?auto_306543 ?auto_306544 ) ) ( AVAILABLE ?auto_306547 ) ( ON ?auto_306543 ?auto_306542 ) ( not ( = ?auto_306542 ?auto_306543 ) ) ( not ( = ?auto_306542 ?auto_306544 ) ) ( TRUCK-AT ?auto_306548 ?auto_306546 ) ( not ( = ?auto_306546 ?auto_306545 ) ) ( HOIST-AT ?auto_306550 ?auto_306546 ) ( not ( = ?auto_306547 ?auto_306550 ) ) ( AVAILABLE ?auto_306550 ) ( SURFACE-AT ?auto_306544 ?auto_306546 ) ( ON ?auto_306544 ?auto_306549 ) ( CLEAR ?auto_306544 ) ( not ( = ?auto_306543 ?auto_306549 ) ) ( not ( = ?auto_306544 ?auto_306549 ) ) ( not ( = ?auto_306542 ?auto_306549 ) ) ( ON ?auto_306537 ?auto_306536 ) ( ON ?auto_306538 ?auto_306537 ) ( ON ?auto_306535 ?auto_306538 ) ( ON ?auto_306539 ?auto_306535 ) ( ON ?auto_306541 ?auto_306539 ) ( ON ?auto_306540 ?auto_306541 ) ( ON ?auto_306542 ?auto_306540 ) ( not ( = ?auto_306536 ?auto_306537 ) ) ( not ( = ?auto_306536 ?auto_306538 ) ) ( not ( = ?auto_306536 ?auto_306535 ) ) ( not ( = ?auto_306536 ?auto_306539 ) ) ( not ( = ?auto_306536 ?auto_306541 ) ) ( not ( = ?auto_306536 ?auto_306540 ) ) ( not ( = ?auto_306536 ?auto_306542 ) ) ( not ( = ?auto_306536 ?auto_306543 ) ) ( not ( = ?auto_306536 ?auto_306544 ) ) ( not ( = ?auto_306536 ?auto_306549 ) ) ( not ( = ?auto_306537 ?auto_306538 ) ) ( not ( = ?auto_306537 ?auto_306535 ) ) ( not ( = ?auto_306537 ?auto_306539 ) ) ( not ( = ?auto_306537 ?auto_306541 ) ) ( not ( = ?auto_306537 ?auto_306540 ) ) ( not ( = ?auto_306537 ?auto_306542 ) ) ( not ( = ?auto_306537 ?auto_306543 ) ) ( not ( = ?auto_306537 ?auto_306544 ) ) ( not ( = ?auto_306537 ?auto_306549 ) ) ( not ( = ?auto_306538 ?auto_306535 ) ) ( not ( = ?auto_306538 ?auto_306539 ) ) ( not ( = ?auto_306538 ?auto_306541 ) ) ( not ( = ?auto_306538 ?auto_306540 ) ) ( not ( = ?auto_306538 ?auto_306542 ) ) ( not ( = ?auto_306538 ?auto_306543 ) ) ( not ( = ?auto_306538 ?auto_306544 ) ) ( not ( = ?auto_306538 ?auto_306549 ) ) ( not ( = ?auto_306535 ?auto_306539 ) ) ( not ( = ?auto_306535 ?auto_306541 ) ) ( not ( = ?auto_306535 ?auto_306540 ) ) ( not ( = ?auto_306535 ?auto_306542 ) ) ( not ( = ?auto_306535 ?auto_306543 ) ) ( not ( = ?auto_306535 ?auto_306544 ) ) ( not ( = ?auto_306535 ?auto_306549 ) ) ( not ( = ?auto_306539 ?auto_306541 ) ) ( not ( = ?auto_306539 ?auto_306540 ) ) ( not ( = ?auto_306539 ?auto_306542 ) ) ( not ( = ?auto_306539 ?auto_306543 ) ) ( not ( = ?auto_306539 ?auto_306544 ) ) ( not ( = ?auto_306539 ?auto_306549 ) ) ( not ( = ?auto_306541 ?auto_306540 ) ) ( not ( = ?auto_306541 ?auto_306542 ) ) ( not ( = ?auto_306541 ?auto_306543 ) ) ( not ( = ?auto_306541 ?auto_306544 ) ) ( not ( = ?auto_306541 ?auto_306549 ) ) ( not ( = ?auto_306540 ?auto_306542 ) ) ( not ( = ?auto_306540 ?auto_306543 ) ) ( not ( = ?auto_306540 ?auto_306544 ) ) ( not ( = ?auto_306540 ?auto_306549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306542 ?auto_306543 ?auto_306544 )
      ( MAKE-9CRATE-VERIFY ?auto_306536 ?auto_306537 ?auto_306538 ?auto_306535 ?auto_306539 ?auto_306541 ?auto_306540 ?auto_306542 ?auto_306543 ?auto_306544 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306645 - SURFACE
      ?auto_306646 - SURFACE
      ?auto_306647 - SURFACE
      ?auto_306644 - SURFACE
      ?auto_306648 - SURFACE
      ?auto_306650 - SURFACE
      ?auto_306649 - SURFACE
      ?auto_306651 - SURFACE
      ?auto_306652 - SURFACE
      ?auto_306653 - SURFACE
    )
    :vars
    (
      ?auto_306655 - HOIST
      ?auto_306659 - PLACE
      ?auto_306658 - PLACE
      ?auto_306657 - HOIST
      ?auto_306654 - SURFACE
      ?auto_306656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_306655 ?auto_306659 ) ( SURFACE-AT ?auto_306652 ?auto_306659 ) ( CLEAR ?auto_306652 ) ( IS-CRATE ?auto_306653 ) ( not ( = ?auto_306652 ?auto_306653 ) ) ( AVAILABLE ?auto_306655 ) ( ON ?auto_306652 ?auto_306651 ) ( not ( = ?auto_306651 ?auto_306652 ) ) ( not ( = ?auto_306651 ?auto_306653 ) ) ( not ( = ?auto_306658 ?auto_306659 ) ) ( HOIST-AT ?auto_306657 ?auto_306658 ) ( not ( = ?auto_306655 ?auto_306657 ) ) ( AVAILABLE ?auto_306657 ) ( SURFACE-AT ?auto_306653 ?auto_306658 ) ( ON ?auto_306653 ?auto_306654 ) ( CLEAR ?auto_306653 ) ( not ( = ?auto_306652 ?auto_306654 ) ) ( not ( = ?auto_306653 ?auto_306654 ) ) ( not ( = ?auto_306651 ?auto_306654 ) ) ( TRUCK-AT ?auto_306656 ?auto_306659 ) ( ON ?auto_306646 ?auto_306645 ) ( ON ?auto_306647 ?auto_306646 ) ( ON ?auto_306644 ?auto_306647 ) ( ON ?auto_306648 ?auto_306644 ) ( ON ?auto_306650 ?auto_306648 ) ( ON ?auto_306649 ?auto_306650 ) ( ON ?auto_306651 ?auto_306649 ) ( not ( = ?auto_306645 ?auto_306646 ) ) ( not ( = ?auto_306645 ?auto_306647 ) ) ( not ( = ?auto_306645 ?auto_306644 ) ) ( not ( = ?auto_306645 ?auto_306648 ) ) ( not ( = ?auto_306645 ?auto_306650 ) ) ( not ( = ?auto_306645 ?auto_306649 ) ) ( not ( = ?auto_306645 ?auto_306651 ) ) ( not ( = ?auto_306645 ?auto_306652 ) ) ( not ( = ?auto_306645 ?auto_306653 ) ) ( not ( = ?auto_306645 ?auto_306654 ) ) ( not ( = ?auto_306646 ?auto_306647 ) ) ( not ( = ?auto_306646 ?auto_306644 ) ) ( not ( = ?auto_306646 ?auto_306648 ) ) ( not ( = ?auto_306646 ?auto_306650 ) ) ( not ( = ?auto_306646 ?auto_306649 ) ) ( not ( = ?auto_306646 ?auto_306651 ) ) ( not ( = ?auto_306646 ?auto_306652 ) ) ( not ( = ?auto_306646 ?auto_306653 ) ) ( not ( = ?auto_306646 ?auto_306654 ) ) ( not ( = ?auto_306647 ?auto_306644 ) ) ( not ( = ?auto_306647 ?auto_306648 ) ) ( not ( = ?auto_306647 ?auto_306650 ) ) ( not ( = ?auto_306647 ?auto_306649 ) ) ( not ( = ?auto_306647 ?auto_306651 ) ) ( not ( = ?auto_306647 ?auto_306652 ) ) ( not ( = ?auto_306647 ?auto_306653 ) ) ( not ( = ?auto_306647 ?auto_306654 ) ) ( not ( = ?auto_306644 ?auto_306648 ) ) ( not ( = ?auto_306644 ?auto_306650 ) ) ( not ( = ?auto_306644 ?auto_306649 ) ) ( not ( = ?auto_306644 ?auto_306651 ) ) ( not ( = ?auto_306644 ?auto_306652 ) ) ( not ( = ?auto_306644 ?auto_306653 ) ) ( not ( = ?auto_306644 ?auto_306654 ) ) ( not ( = ?auto_306648 ?auto_306650 ) ) ( not ( = ?auto_306648 ?auto_306649 ) ) ( not ( = ?auto_306648 ?auto_306651 ) ) ( not ( = ?auto_306648 ?auto_306652 ) ) ( not ( = ?auto_306648 ?auto_306653 ) ) ( not ( = ?auto_306648 ?auto_306654 ) ) ( not ( = ?auto_306650 ?auto_306649 ) ) ( not ( = ?auto_306650 ?auto_306651 ) ) ( not ( = ?auto_306650 ?auto_306652 ) ) ( not ( = ?auto_306650 ?auto_306653 ) ) ( not ( = ?auto_306650 ?auto_306654 ) ) ( not ( = ?auto_306649 ?auto_306651 ) ) ( not ( = ?auto_306649 ?auto_306652 ) ) ( not ( = ?auto_306649 ?auto_306653 ) ) ( not ( = ?auto_306649 ?auto_306654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306651 ?auto_306652 ?auto_306653 )
      ( MAKE-9CRATE-VERIFY ?auto_306645 ?auto_306646 ?auto_306647 ?auto_306644 ?auto_306648 ?auto_306650 ?auto_306649 ?auto_306651 ?auto_306652 ?auto_306653 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306754 - SURFACE
      ?auto_306755 - SURFACE
      ?auto_306756 - SURFACE
      ?auto_306753 - SURFACE
      ?auto_306757 - SURFACE
      ?auto_306759 - SURFACE
      ?auto_306758 - SURFACE
      ?auto_306760 - SURFACE
      ?auto_306761 - SURFACE
      ?auto_306762 - SURFACE
    )
    :vars
    (
      ?auto_306764 - HOIST
      ?auto_306767 - PLACE
      ?auto_306768 - PLACE
      ?auto_306763 - HOIST
      ?auto_306765 - SURFACE
      ?auto_306766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_306764 ?auto_306767 ) ( IS-CRATE ?auto_306762 ) ( not ( = ?auto_306761 ?auto_306762 ) ) ( not ( = ?auto_306760 ?auto_306761 ) ) ( not ( = ?auto_306760 ?auto_306762 ) ) ( not ( = ?auto_306768 ?auto_306767 ) ) ( HOIST-AT ?auto_306763 ?auto_306768 ) ( not ( = ?auto_306764 ?auto_306763 ) ) ( AVAILABLE ?auto_306763 ) ( SURFACE-AT ?auto_306762 ?auto_306768 ) ( ON ?auto_306762 ?auto_306765 ) ( CLEAR ?auto_306762 ) ( not ( = ?auto_306761 ?auto_306765 ) ) ( not ( = ?auto_306762 ?auto_306765 ) ) ( not ( = ?auto_306760 ?auto_306765 ) ) ( TRUCK-AT ?auto_306766 ?auto_306767 ) ( SURFACE-AT ?auto_306760 ?auto_306767 ) ( CLEAR ?auto_306760 ) ( LIFTING ?auto_306764 ?auto_306761 ) ( IS-CRATE ?auto_306761 ) ( ON ?auto_306755 ?auto_306754 ) ( ON ?auto_306756 ?auto_306755 ) ( ON ?auto_306753 ?auto_306756 ) ( ON ?auto_306757 ?auto_306753 ) ( ON ?auto_306759 ?auto_306757 ) ( ON ?auto_306758 ?auto_306759 ) ( ON ?auto_306760 ?auto_306758 ) ( not ( = ?auto_306754 ?auto_306755 ) ) ( not ( = ?auto_306754 ?auto_306756 ) ) ( not ( = ?auto_306754 ?auto_306753 ) ) ( not ( = ?auto_306754 ?auto_306757 ) ) ( not ( = ?auto_306754 ?auto_306759 ) ) ( not ( = ?auto_306754 ?auto_306758 ) ) ( not ( = ?auto_306754 ?auto_306760 ) ) ( not ( = ?auto_306754 ?auto_306761 ) ) ( not ( = ?auto_306754 ?auto_306762 ) ) ( not ( = ?auto_306754 ?auto_306765 ) ) ( not ( = ?auto_306755 ?auto_306756 ) ) ( not ( = ?auto_306755 ?auto_306753 ) ) ( not ( = ?auto_306755 ?auto_306757 ) ) ( not ( = ?auto_306755 ?auto_306759 ) ) ( not ( = ?auto_306755 ?auto_306758 ) ) ( not ( = ?auto_306755 ?auto_306760 ) ) ( not ( = ?auto_306755 ?auto_306761 ) ) ( not ( = ?auto_306755 ?auto_306762 ) ) ( not ( = ?auto_306755 ?auto_306765 ) ) ( not ( = ?auto_306756 ?auto_306753 ) ) ( not ( = ?auto_306756 ?auto_306757 ) ) ( not ( = ?auto_306756 ?auto_306759 ) ) ( not ( = ?auto_306756 ?auto_306758 ) ) ( not ( = ?auto_306756 ?auto_306760 ) ) ( not ( = ?auto_306756 ?auto_306761 ) ) ( not ( = ?auto_306756 ?auto_306762 ) ) ( not ( = ?auto_306756 ?auto_306765 ) ) ( not ( = ?auto_306753 ?auto_306757 ) ) ( not ( = ?auto_306753 ?auto_306759 ) ) ( not ( = ?auto_306753 ?auto_306758 ) ) ( not ( = ?auto_306753 ?auto_306760 ) ) ( not ( = ?auto_306753 ?auto_306761 ) ) ( not ( = ?auto_306753 ?auto_306762 ) ) ( not ( = ?auto_306753 ?auto_306765 ) ) ( not ( = ?auto_306757 ?auto_306759 ) ) ( not ( = ?auto_306757 ?auto_306758 ) ) ( not ( = ?auto_306757 ?auto_306760 ) ) ( not ( = ?auto_306757 ?auto_306761 ) ) ( not ( = ?auto_306757 ?auto_306762 ) ) ( not ( = ?auto_306757 ?auto_306765 ) ) ( not ( = ?auto_306759 ?auto_306758 ) ) ( not ( = ?auto_306759 ?auto_306760 ) ) ( not ( = ?auto_306759 ?auto_306761 ) ) ( not ( = ?auto_306759 ?auto_306762 ) ) ( not ( = ?auto_306759 ?auto_306765 ) ) ( not ( = ?auto_306758 ?auto_306760 ) ) ( not ( = ?auto_306758 ?auto_306761 ) ) ( not ( = ?auto_306758 ?auto_306762 ) ) ( not ( = ?auto_306758 ?auto_306765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306760 ?auto_306761 ?auto_306762 )
      ( MAKE-9CRATE-VERIFY ?auto_306754 ?auto_306755 ?auto_306756 ?auto_306753 ?auto_306757 ?auto_306759 ?auto_306758 ?auto_306760 ?auto_306761 ?auto_306762 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306863 - SURFACE
      ?auto_306864 - SURFACE
      ?auto_306865 - SURFACE
      ?auto_306862 - SURFACE
      ?auto_306866 - SURFACE
      ?auto_306868 - SURFACE
      ?auto_306867 - SURFACE
      ?auto_306869 - SURFACE
      ?auto_306870 - SURFACE
      ?auto_306871 - SURFACE
    )
    :vars
    (
      ?auto_306875 - HOIST
      ?auto_306877 - PLACE
      ?auto_306874 - PLACE
      ?auto_306876 - HOIST
      ?auto_306873 - SURFACE
      ?auto_306872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_306875 ?auto_306877 ) ( IS-CRATE ?auto_306871 ) ( not ( = ?auto_306870 ?auto_306871 ) ) ( not ( = ?auto_306869 ?auto_306870 ) ) ( not ( = ?auto_306869 ?auto_306871 ) ) ( not ( = ?auto_306874 ?auto_306877 ) ) ( HOIST-AT ?auto_306876 ?auto_306874 ) ( not ( = ?auto_306875 ?auto_306876 ) ) ( AVAILABLE ?auto_306876 ) ( SURFACE-AT ?auto_306871 ?auto_306874 ) ( ON ?auto_306871 ?auto_306873 ) ( CLEAR ?auto_306871 ) ( not ( = ?auto_306870 ?auto_306873 ) ) ( not ( = ?auto_306871 ?auto_306873 ) ) ( not ( = ?auto_306869 ?auto_306873 ) ) ( TRUCK-AT ?auto_306872 ?auto_306877 ) ( SURFACE-AT ?auto_306869 ?auto_306877 ) ( CLEAR ?auto_306869 ) ( IS-CRATE ?auto_306870 ) ( AVAILABLE ?auto_306875 ) ( IN ?auto_306870 ?auto_306872 ) ( ON ?auto_306864 ?auto_306863 ) ( ON ?auto_306865 ?auto_306864 ) ( ON ?auto_306862 ?auto_306865 ) ( ON ?auto_306866 ?auto_306862 ) ( ON ?auto_306868 ?auto_306866 ) ( ON ?auto_306867 ?auto_306868 ) ( ON ?auto_306869 ?auto_306867 ) ( not ( = ?auto_306863 ?auto_306864 ) ) ( not ( = ?auto_306863 ?auto_306865 ) ) ( not ( = ?auto_306863 ?auto_306862 ) ) ( not ( = ?auto_306863 ?auto_306866 ) ) ( not ( = ?auto_306863 ?auto_306868 ) ) ( not ( = ?auto_306863 ?auto_306867 ) ) ( not ( = ?auto_306863 ?auto_306869 ) ) ( not ( = ?auto_306863 ?auto_306870 ) ) ( not ( = ?auto_306863 ?auto_306871 ) ) ( not ( = ?auto_306863 ?auto_306873 ) ) ( not ( = ?auto_306864 ?auto_306865 ) ) ( not ( = ?auto_306864 ?auto_306862 ) ) ( not ( = ?auto_306864 ?auto_306866 ) ) ( not ( = ?auto_306864 ?auto_306868 ) ) ( not ( = ?auto_306864 ?auto_306867 ) ) ( not ( = ?auto_306864 ?auto_306869 ) ) ( not ( = ?auto_306864 ?auto_306870 ) ) ( not ( = ?auto_306864 ?auto_306871 ) ) ( not ( = ?auto_306864 ?auto_306873 ) ) ( not ( = ?auto_306865 ?auto_306862 ) ) ( not ( = ?auto_306865 ?auto_306866 ) ) ( not ( = ?auto_306865 ?auto_306868 ) ) ( not ( = ?auto_306865 ?auto_306867 ) ) ( not ( = ?auto_306865 ?auto_306869 ) ) ( not ( = ?auto_306865 ?auto_306870 ) ) ( not ( = ?auto_306865 ?auto_306871 ) ) ( not ( = ?auto_306865 ?auto_306873 ) ) ( not ( = ?auto_306862 ?auto_306866 ) ) ( not ( = ?auto_306862 ?auto_306868 ) ) ( not ( = ?auto_306862 ?auto_306867 ) ) ( not ( = ?auto_306862 ?auto_306869 ) ) ( not ( = ?auto_306862 ?auto_306870 ) ) ( not ( = ?auto_306862 ?auto_306871 ) ) ( not ( = ?auto_306862 ?auto_306873 ) ) ( not ( = ?auto_306866 ?auto_306868 ) ) ( not ( = ?auto_306866 ?auto_306867 ) ) ( not ( = ?auto_306866 ?auto_306869 ) ) ( not ( = ?auto_306866 ?auto_306870 ) ) ( not ( = ?auto_306866 ?auto_306871 ) ) ( not ( = ?auto_306866 ?auto_306873 ) ) ( not ( = ?auto_306868 ?auto_306867 ) ) ( not ( = ?auto_306868 ?auto_306869 ) ) ( not ( = ?auto_306868 ?auto_306870 ) ) ( not ( = ?auto_306868 ?auto_306871 ) ) ( not ( = ?auto_306868 ?auto_306873 ) ) ( not ( = ?auto_306867 ?auto_306869 ) ) ( not ( = ?auto_306867 ?auto_306870 ) ) ( not ( = ?auto_306867 ?auto_306871 ) ) ( not ( = ?auto_306867 ?auto_306873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306869 ?auto_306870 ?auto_306871 )
      ( MAKE-9CRATE-VERIFY ?auto_306863 ?auto_306864 ?auto_306865 ?auto_306862 ?auto_306866 ?auto_306868 ?auto_306867 ?auto_306869 ?auto_306870 ?auto_306871 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312412 - SURFACE
      ?auto_312413 - SURFACE
      ?auto_312414 - SURFACE
      ?auto_312411 - SURFACE
      ?auto_312415 - SURFACE
      ?auto_312417 - SURFACE
      ?auto_312416 - SURFACE
      ?auto_312418 - SURFACE
      ?auto_312419 - SURFACE
      ?auto_312420 - SURFACE
      ?auto_312421 - SURFACE
    )
    :vars
    (
      ?auto_312422 - HOIST
      ?auto_312423 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_312422 ?auto_312423 ) ( SURFACE-AT ?auto_312420 ?auto_312423 ) ( CLEAR ?auto_312420 ) ( LIFTING ?auto_312422 ?auto_312421 ) ( IS-CRATE ?auto_312421 ) ( not ( = ?auto_312420 ?auto_312421 ) ) ( ON ?auto_312413 ?auto_312412 ) ( ON ?auto_312414 ?auto_312413 ) ( ON ?auto_312411 ?auto_312414 ) ( ON ?auto_312415 ?auto_312411 ) ( ON ?auto_312417 ?auto_312415 ) ( ON ?auto_312416 ?auto_312417 ) ( ON ?auto_312418 ?auto_312416 ) ( ON ?auto_312419 ?auto_312418 ) ( ON ?auto_312420 ?auto_312419 ) ( not ( = ?auto_312412 ?auto_312413 ) ) ( not ( = ?auto_312412 ?auto_312414 ) ) ( not ( = ?auto_312412 ?auto_312411 ) ) ( not ( = ?auto_312412 ?auto_312415 ) ) ( not ( = ?auto_312412 ?auto_312417 ) ) ( not ( = ?auto_312412 ?auto_312416 ) ) ( not ( = ?auto_312412 ?auto_312418 ) ) ( not ( = ?auto_312412 ?auto_312419 ) ) ( not ( = ?auto_312412 ?auto_312420 ) ) ( not ( = ?auto_312412 ?auto_312421 ) ) ( not ( = ?auto_312413 ?auto_312414 ) ) ( not ( = ?auto_312413 ?auto_312411 ) ) ( not ( = ?auto_312413 ?auto_312415 ) ) ( not ( = ?auto_312413 ?auto_312417 ) ) ( not ( = ?auto_312413 ?auto_312416 ) ) ( not ( = ?auto_312413 ?auto_312418 ) ) ( not ( = ?auto_312413 ?auto_312419 ) ) ( not ( = ?auto_312413 ?auto_312420 ) ) ( not ( = ?auto_312413 ?auto_312421 ) ) ( not ( = ?auto_312414 ?auto_312411 ) ) ( not ( = ?auto_312414 ?auto_312415 ) ) ( not ( = ?auto_312414 ?auto_312417 ) ) ( not ( = ?auto_312414 ?auto_312416 ) ) ( not ( = ?auto_312414 ?auto_312418 ) ) ( not ( = ?auto_312414 ?auto_312419 ) ) ( not ( = ?auto_312414 ?auto_312420 ) ) ( not ( = ?auto_312414 ?auto_312421 ) ) ( not ( = ?auto_312411 ?auto_312415 ) ) ( not ( = ?auto_312411 ?auto_312417 ) ) ( not ( = ?auto_312411 ?auto_312416 ) ) ( not ( = ?auto_312411 ?auto_312418 ) ) ( not ( = ?auto_312411 ?auto_312419 ) ) ( not ( = ?auto_312411 ?auto_312420 ) ) ( not ( = ?auto_312411 ?auto_312421 ) ) ( not ( = ?auto_312415 ?auto_312417 ) ) ( not ( = ?auto_312415 ?auto_312416 ) ) ( not ( = ?auto_312415 ?auto_312418 ) ) ( not ( = ?auto_312415 ?auto_312419 ) ) ( not ( = ?auto_312415 ?auto_312420 ) ) ( not ( = ?auto_312415 ?auto_312421 ) ) ( not ( = ?auto_312417 ?auto_312416 ) ) ( not ( = ?auto_312417 ?auto_312418 ) ) ( not ( = ?auto_312417 ?auto_312419 ) ) ( not ( = ?auto_312417 ?auto_312420 ) ) ( not ( = ?auto_312417 ?auto_312421 ) ) ( not ( = ?auto_312416 ?auto_312418 ) ) ( not ( = ?auto_312416 ?auto_312419 ) ) ( not ( = ?auto_312416 ?auto_312420 ) ) ( not ( = ?auto_312416 ?auto_312421 ) ) ( not ( = ?auto_312418 ?auto_312419 ) ) ( not ( = ?auto_312418 ?auto_312420 ) ) ( not ( = ?auto_312418 ?auto_312421 ) ) ( not ( = ?auto_312419 ?auto_312420 ) ) ( not ( = ?auto_312419 ?auto_312421 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_312420 ?auto_312421 )
      ( MAKE-10CRATE-VERIFY ?auto_312412 ?auto_312413 ?auto_312414 ?auto_312411 ?auto_312415 ?auto_312417 ?auto_312416 ?auto_312418 ?auto_312419 ?auto_312420 ?auto_312421 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312506 - SURFACE
      ?auto_312507 - SURFACE
      ?auto_312508 - SURFACE
      ?auto_312505 - SURFACE
      ?auto_312509 - SURFACE
      ?auto_312511 - SURFACE
      ?auto_312510 - SURFACE
      ?auto_312512 - SURFACE
      ?auto_312513 - SURFACE
      ?auto_312514 - SURFACE
      ?auto_312515 - SURFACE
    )
    :vars
    (
      ?auto_312518 - HOIST
      ?auto_312516 - PLACE
      ?auto_312517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312518 ?auto_312516 ) ( SURFACE-AT ?auto_312514 ?auto_312516 ) ( CLEAR ?auto_312514 ) ( IS-CRATE ?auto_312515 ) ( not ( = ?auto_312514 ?auto_312515 ) ) ( TRUCK-AT ?auto_312517 ?auto_312516 ) ( AVAILABLE ?auto_312518 ) ( IN ?auto_312515 ?auto_312517 ) ( ON ?auto_312514 ?auto_312513 ) ( not ( = ?auto_312513 ?auto_312514 ) ) ( not ( = ?auto_312513 ?auto_312515 ) ) ( ON ?auto_312507 ?auto_312506 ) ( ON ?auto_312508 ?auto_312507 ) ( ON ?auto_312505 ?auto_312508 ) ( ON ?auto_312509 ?auto_312505 ) ( ON ?auto_312511 ?auto_312509 ) ( ON ?auto_312510 ?auto_312511 ) ( ON ?auto_312512 ?auto_312510 ) ( ON ?auto_312513 ?auto_312512 ) ( not ( = ?auto_312506 ?auto_312507 ) ) ( not ( = ?auto_312506 ?auto_312508 ) ) ( not ( = ?auto_312506 ?auto_312505 ) ) ( not ( = ?auto_312506 ?auto_312509 ) ) ( not ( = ?auto_312506 ?auto_312511 ) ) ( not ( = ?auto_312506 ?auto_312510 ) ) ( not ( = ?auto_312506 ?auto_312512 ) ) ( not ( = ?auto_312506 ?auto_312513 ) ) ( not ( = ?auto_312506 ?auto_312514 ) ) ( not ( = ?auto_312506 ?auto_312515 ) ) ( not ( = ?auto_312507 ?auto_312508 ) ) ( not ( = ?auto_312507 ?auto_312505 ) ) ( not ( = ?auto_312507 ?auto_312509 ) ) ( not ( = ?auto_312507 ?auto_312511 ) ) ( not ( = ?auto_312507 ?auto_312510 ) ) ( not ( = ?auto_312507 ?auto_312512 ) ) ( not ( = ?auto_312507 ?auto_312513 ) ) ( not ( = ?auto_312507 ?auto_312514 ) ) ( not ( = ?auto_312507 ?auto_312515 ) ) ( not ( = ?auto_312508 ?auto_312505 ) ) ( not ( = ?auto_312508 ?auto_312509 ) ) ( not ( = ?auto_312508 ?auto_312511 ) ) ( not ( = ?auto_312508 ?auto_312510 ) ) ( not ( = ?auto_312508 ?auto_312512 ) ) ( not ( = ?auto_312508 ?auto_312513 ) ) ( not ( = ?auto_312508 ?auto_312514 ) ) ( not ( = ?auto_312508 ?auto_312515 ) ) ( not ( = ?auto_312505 ?auto_312509 ) ) ( not ( = ?auto_312505 ?auto_312511 ) ) ( not ( = ?auto_312505 ?auto_312510 ) ) ( not ( = ?auto_312505 ?auto_312512 ) ) ( not ( = ?auto_312505 ?auto_312513 ) ) ( not ( = ?auto_312505 ?auto_312514 ) ) ( not ( = ?auto_312505 ?auto_312515 ) ) ( not ( = ?auto_312509 ?auto_312511 ) ) ( not ( = ?auto_312509 ?auto_312510 ) ) ( not ( = ?auto_312509 ?auto_312512 ) ) ( not ( = ?auto_312509 ?auto_312513 ) ) ( not ( = ?auto_312509 ?auto_312514 ) ) ( not ( = ?auto_312509 ?auto_312515 ) ) ( not ( = ?auto_312511 ?auto_312510 ) ) ( not ( = ?auto_312511 ?auto_312512 ) ) ( not ( = ?auto_312511 ?auto_312513 ) ) ( not ( = ?auto_312511 ?auto_312514 ) ) ( not ( = ?auto_312511 ?auto_312515 ) ) ( not ( = ?auto_312510 ?auto_312512 ) ) ( not ( = ?auto_312510 ?auto_312513 ) ) ( not ( = ?auto_312510 ?auto_312514 ) ) ( not ( = ?auto_312510 ?auto_312515 ) ) ( not ( = ?auto_312512 ?auto_312513 ) ) ( not ( = ?auto_312512 ?auto_312514 ) ) ( not ( = ?auto_312512 ?auto_312515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312513 ?auto_312514 ?auto_312515 )
      ( MAKE-10CRATE-VERIFY ?auto_312506 ?auto_312507 ?auto_312508 ?auto_312505 ?auto_312509 ?auto_312511 ?auto_312510 ?auto_312512 ?auto_312513 ?auto_312514 ?auto_312515 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312611 - SURFACE
      ?auto_312612 - SURFACE
      ?auto_312613 - SURFACE
      ?auto_312610 - SURFACE
      ?auto_312614 - SURFACE
      ?auto_312616 - SURFACE
      ?auto_312615 - SURFACE
      ?auto_312617 - SURFACE
      ?auto_312618 - SURFACE
      ?auto_312619 - SURFACE
      ?auto_312620 - SURFACE
    )
    :vars
    (
      ?auto_312623 - HOIST
      ?auto_312622 - PLACE
      ?auto_312621 - TRUCK
      ?auto_312624 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_312623 ?auto_312622 ) ( SURFACE-AT ?auto_312619 ?auto_312622 ) ( CLEAR ?auto_312619 ) ( IS-CRATE ?auto_312620 ) ( not ( = ?auto_312619 ?auto_312620 ) ) ( AVAILABLE ?auto_312623 ) ( IN ?auto_312620 ?auto_312621 ) ( ON ?auto_312619 ?auto_312618 ) ( not ( = ?auto_312618 ?auto_312619 ) ) ( not ( = ?auto_312618 ?auto_312620 ) ) ( TRUCK-AT ?auto_312621 ?auto_312624 ) ( not ( = ?auto_312624 ?auto_312622 ) ) ( ON ?auto_312612 ?auto_312611 ) ( ON ?auto_312613 ?auto_312612 ) ( ON ?auto_312610 ?auto_312613 ) ( ON ?auto_312614 ?auto_312610 ) ( ON ?auto_312616 ?auto_312614 ) ( ON ?auto_312615 ?auto_312616 ) ( ON ?auto_312617 ?auto_312615 ) ( ON ?auto_312618 ?auto_312617 ) ( not ( = ?auto_312611 ?auto_312612 ) ) ( not ( = ?auto_312611 ?auto_312613 ) ) ( not ( = ?auto_312611 ?auto_312610 ) ) ( not ( = ?auto_312611 ?auto_312614 ) ) ( not ( = ?auto_312611 ?auto_312616 ) ) ( not ( = ?auto_312611 ?auto_312615 ) ) ( not ( = ?auto_312611 ?auto_312617 ) ) ( not ( = ?auto_312611 ?auto_312618 ) ) ( not ( = ?auto_312611 ?auto_312619 ) ) ( not ( = ?auto_312611 ?auto_312620 ) ) ( not ( = ?auto_312612 ?auto_312613 ) ) ( not ( = ?auto_312612 ?auto_312610 ) ) ( not ( = ?auto_312612 ?auto_312614 ) ) ( not ( = ?auto_312612 ?auto_312616 ) ) ( not ( = ?auto_312612 ?auto_312615 ) ) ( not ( = ?auto_312612 ?auto_312617 ) ) ( not ( = ?auto_312612 ?auto_312618 ) ) ( not ( = ?auto_312612 ?auto_312619 ) ) ( not ( = ?auto_312612 ?auto_312620 ) ) ( not ( = ?auto_312613 ?auto_312610 ) ) ( not ( = ?auto_312613 ?auto_312614 ) ) ( not ( = ?auto_312613 ?auto_312616 ) ) ( not ( = ?auto_312613 ?auto_312615 ) ) ( not ( = ?auto_312613 ?auto_312617 ) ) ( not ( = ?auto_312613 ?auto_312618 ) ) ( not ( = ?auto_312613 ?auto_312619 ) ) ( not ( = ?auto_312613 ?auto_312620 ) ) ( not ( = ?auto_312610 ?auto_312614 ) ) ( not ( = ?auto_312610 ?auto_312616 ) ) ( not ( = ?auto_312610 ?auto_312615 ) ) ( not ( = ?auto_312610 ?auto_312617 ) ) ( not ( = ?auto_312610 ?auto_312618 ) ) ( not ( = ?auto_312610 ?auto_312619 ) ) ( not ( = ?auto_312610 ?auto_312620 ) ) ( not ( = ?auto_312614 ?auto_312616 ) ) ( not ( = ?auto_312614 ?auto_312615 ) ) ( not ( = ?auto_312614 ?auto_312617 ) ) ( not ( = ?auto_312614 ?auto_312618 ) ) ( not ( = ?auto_312614 ?auto_312619 ) ) ( not ( = ?auto_312614 ?auto_312620 ) ) ( not ( = ?auto_312616 ?auto_312615 ) ) ( not ( = ?auto_312616 ?auto_312617 ) ) ( not ( = ?auto_312616 ?auto_312618 ) ) ( not ( = ?auto_312616 ?auto_312619 ) ) ( not ( = ?auto_312616 ?auto_312620 ) ) ( not ( = ?auto_312615 ?auto_312617 ) ) ( not ( = ?auto_312615 ?auto_312618 ) ) ( not ( = ?auto_312615 ?auto_312619 ) ) ( not ( = ?auto_312615 ?auto_312620 ) ) ( not ( = ?auto_312617 ?auto_312618 ) ) ( not ( = ?auto_312617 ?auto_312619 ) ) ( not ( = ?auto_312617 ?auto_312620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312618 ?auto_312619 ?auto_312620 )
      ( MAKE-10CRATE-VERIFY ?auto_312611 ?auto_312612 ?auto_312613 ?auto_312610 ?auto_312614 ?auto_312616 ?auto_312615 ?auto_312617 ?auto_312618 ?auto_312619 ?auto_312620 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312726 - SURFACE
      ?auto_312727 - SURFACE
      ?auto_312728 - SURFACE
      ?auto_312725 - SURFACE
      ?auto_312729 - SURFACE
      ?auto_312731 - SURFACE
      ?auto_312730 - SURFACE
      ?auto_312732 - SURFACE
      ?auto_312733 - SURFACE
      ?auto_312734 - SURFACE
      ?auto_312735 - SURFACE
    )
    :vars
    (
      ?auto_312738 - HOIST
      ?auto_312736 - PLACE
      ?auto_312740 - TRUCK
      ?auto_312737 - PLACE
      ?auto_312739 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_312738 ?auto_312736 ) ( SURFACE-AT ?auto_312734 ?auto_312736 ) ( CLEAR ?auto_312734 ) ( IS-CRATE ?auto_312735 ) ( not ( = ?auto_312734 ?auto_312735 ) ) ( AVAILABLE ?auto_312738 ) ( ON ?auto_312734 ?auto_312733 ) ( not ( = ?auto_312733 ?auto_312734 ) ) ( not ( = ?auto_312733 ?auto_312735 ) ) ( TRUCK-AT ?auto_312740 ?auto_312737 ) ( not ( = ?auto_312737 ?auto_312736 ) ) ( HOIST-AT ?auto_312739 ?auto_312737 ) ( LIFTING ?auto_312739 ?auto_312735 ) ( not ( = ?auto_312738 ?auto_312739 ) ) ( ON ?auto_312727 ?auto_312726 ) ( ON ?auto_312728 ?auto_312727 ) ( ON ?auto_312725 ?auto_312728 ) ( ON ?auto_312729 ?auto_312725 ) ( ON ?auto_312731 ?auto_312729 ) ( ON ?auto_312730 ?auto_312731 ) ( ON ?auto_312732 ?auto_312730 ) ( ON ?auto_312733 ?auto_312732 ) ( not ( = ?auto_312726 ?auto_312727 ) ) ( not ( = ?auto_312726 ?auto_312728 ) ) ( not ( = ?auto_312726 ?auto_312725 ) ) ( not ( = ?auto_312726 ?auto_312729 ) ) ( not ( = ?auto_312726 ?auto_312731 ) ) ( not ( = ?auto_312726 ?auto_312730 ) ) ( not ( = ?auto_312726 ?auto_312732 ) ) ( not ( = ?auto_312726 ?auto_312733 ) ) ( not ( = ?auto_312726 ?auto_312734 ) ) ( not ( = ?auto_312726 ?auto_312735 ) ) ( not ( = ?auto_312727 ?auto_312728 ) ) ( not ( = ?auto_312727 ?auto_312725 ) ) ( not ( = ?auto_312727 ?auto_312729 ) ) ( not ( = ?auto_312727 ?auto_312731 ) ) ( not ( = ?auto_312727 ?auto_312730 ) ) ( not ( = ?auto_312727 ?auto_312732 ) ) ( not ( = ?auto_312727 ?auto_312733 ) ) ( not ( = ?auto_312727 ?auto_312734 ) ) ( not ( = ?auto_312727 ?auto_312735 ) ) ( not ( = ?auto_312728 ?auto_312725 ) ) ( not ( = ?auto_312728 ?auto_312729 ) ) ( not ( = ?auto_312728 ?auto_312731 ) ) ( not ( = ?auto_312728 ?auto_312730 ) ) ( not ( = ?auto_312728 ?auto_312732 ) ) ( not ( = ?auto_312728 ?auto_312733 ) ) ( not ( = ?auto_312728 ?auto_312734 ) ) ( not ( = ?auto_312728 ?auto_312735 ) ) ( not ( = ?auto_312725 ?auto_312729 ) ) ( not ( = ?auto_312725 ?auto_312731 ) ) ( not ( = ?auto_312725 ?auto_312730 ) ) ( not ( = ?auto_312725 ?auto_312732 ) ) ( not ( = ?auto_312725 ?auto_312733 ) ) ( not ( = ?auto_312725 ?auto_312734 ) ) ( not ( = ?auto_312725 ?auto_312735 ) ) ( not ( = ?auto_312729 ?auto_312731 ) ) ( not ( = ?auto_312729 ?auto_312730 ) ) ( not ( = ?auto_312729 ?auto_312732 ) ) ( not ( = ?auto_312729 ?auto_312733 ) ) ( not ( = ?auto_312729 ?auto_312734 ) ) ( not ( = ?auto_312729 ?auto_312735 ) ) ( not ( = ?auto_312731 ?auto_312730 ) ) ( not ( = ?auto_312731 ?auto_312732 ) ) ( not ( = ?auto_312731 ?auto_312733 ) ) ( not ( = ?auto_312731 ?auto_312734 ) ) ( not ( = ?auto_312731 ?auto_312735 ) ) ( not ( = ?auto_312730 ?auto_312732 ) ) ( not ( = ?auto_312730 ?auto_312733 ) ) ( not ( = ?auto_312730 ?auto_312734 ) ) ( not ( = ?auto_312730 ?auto_312735 ) ) ( not ( = ?auto_312732 ?auto_312733 ) ) ( not ( = ?auto_312732 ?auto_312734 ) ) ( not ( = ?auto_312732 ?auto_312735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312733 ?auto_312734 ?auto_312735 )
      ( MAKE-10CRATE-VERIFY ?auto_312726 ?auto_312727 ?auto_312728 ?auto_312725 ?auto_312729 ?auto_312731 ?auto_312730 ?auto_312732 ?auto_312733 ?auto_312734 ?auto_312735 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312851 - SURFACE
      ?auto_312852 - SURFACE
      ?auto_312853 - SURFACE
      ?auto_312850 - SURFACE
      ?auto_312854 - SURFACE
      ?auto_312856 - SURFACE
      ?auto_312855 - SURFACE
      ?auto_312857 - SURFACE
      ?auto_312858 - SURFACE
      ?auto_312859 - SURFACE
      ?auto_312860 - SURFACE
    )
    :vars
    (
      ?auto_312865 - HOIST
      ?auto_312861 - PLACE
      ?auto_312866 - TRUCK
      ?auto_312862 - PLACE
      ?auto_312863 - HOIST
      ?auto_312864 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_312865 ?auto_312861 ) ( SURFACE-AT ?auto_312859 ?auto_312861 ) ( CLEAR ?auto_312859 ) ( IS-CRATE ?auto_312860 ) ( not ( = ?auto_312859 ?auto_312860 ) ) ( AVAILABLE ?auto_312865 ) ( ON ?auto_312859 ?auto_312858 ) ( not ( = ?auto_312858 ?auto_312859 ) ) ( not ( = ?auto_312858 ?auto_312860 ) ) ( TRUCK-AT ?auto_312866 ?auto_312862 ) ( not ( = ?auto_312862 ?auto_312861 ) ) ( HOIST-AT ?auto_312863 ?auto_312862 ) ( not ( = ?auto_312865 ?auto_312863 ) ) ( AVAILABLE ?auto_312863 ) ( SURFACE-AT ?auto_312860 ?auto_312862 ) ( ON ?auto_312860 ?auto_312864 ) ( CLEAR ?auto_312860 ) ( not ( = ?auto_312859 ?auto_312864 ) ) ( not ( = ?auto_312860 ?auto_312864 ) ) ( not ( = ?auto_312858 ?auto_312864 ) ) ( ON ?auto_312852 ?auto_312851 ) ( ON ?auto_312853 ?auto_312852 ) ( ON ?auto_312850 ?auto_312853 ) ( ON ?auto_312854 ?auto_312850 ) ( ON ?auto_312856 ?auto_312854 ) ( ON ?auto_312855 ?auto_312856 ) ( ON ?auto_312857 ?auto_312855 ) ( ON ?auto_312858 ?auto_312857 ) ( not ( = ?auto_312851 ?auto_312852 ) ) ( not ( = ?auto_312851 ?auto_312853 ) ) ( not ( = ?auto_312851 ?auto_312850 ) ) ( not ( = ?auto_312851 ?auto_312854 ) ) ( not ( = ?auto_312851 ?auto_312856 ) ) ( not ( = ?auto_312851 ?auto_312855 ) ) ( not ( = ?auto_312851 ?auto_312857 ) ) ( not ( = ?auto_312851 ?auto_312858 ) ) ( not ( = ?auto_312851 ?auto_312859 ) ) ( not ( = ?auto_312851 ?auto_312860 ) ) ( not ( = ?auto_312851 ?auto_312864 ) ) ( not ( = ?auto_312852 ?auto_312853 ) ) ( not ( = ?auto_312852 ?auto_312850 ) ) ( not ( = ?auto_312852 ?auto_312854 ) ) ( not ( = ?auto_312852 ?auto_312856 ) ) ( not ( = ?auto_312852 ?auto_312855 ) ) ( not ( = ?auto_312852 ?auto_312857 ) ) ( not ( = ?auto_312852 ?auto_312858 ) ) ( not ( = ?auto_312852 ?auto_312859 ) ) ( not ( = ?auto_312852 ?auto_312860 ) ) ( not ( = ?auto_312852 ?auto_312864 ) ) ( not ( = ?auto_312853 ?auto_312850 ) ) ( not ( = ?auto_312853 ?auto_312854 ) ) ( not ( = ?auto_312853 ?auto_312856 ) ) ( not ( = ?auto_312853 ?auto_312855 ) ) ( not ( = ?auto_312853 ?auto_312857 ) ) ( not ( = ?auto_312853 ?auto_312858 ) ) ( not ( = ?auto_312853 ?auto_312859 ) ) ( not ( = ?auto_312853 ?auto_312860 ) ) ( not ( = ?auto_312853 ?auto_312864 ) ) ( not ( = ?auto_312850 ?auto_312854 ) ) ( not ( = ?auto_312850 ?auto_312856 ) ) ( not ( = ?auto_312850 ?auto_312855 ) ) ( not ( = ?auto_312850 ?auto_312857 ) ) ( not ( = ?auto_312850 ?auto_312858 ) ) ( not ( = ?auto_312850 ?auto_312859 ) ) ( not ( = ?auto_312850 ?auto_312860 ) ) ( not ( = ?auto_312850 ?auto_312864 ) ) ( not ( = ?auto_312854 ?auto_312856 ) ) ( not ( = ?auto_312854 ?auto_312855 ) ) ( not ( = ?auto_312854 ?auto_312857 ) ) ( not ( = ?auto_312854 ?auto_312858 ) ) ( not ( = ?auto_312854 ?auto_312859 ) ) ( not ( = ?auto_312854 ?auto_312860 ) ) ( not ( = ?auto_312854 ?auto_312864 ) ) ( not ( = ?auto_312856 ?auto_312855 ) ) ( not ( = ?auto_312856 ?auto_312857 ) ) ( not ( = ?auto_312856 ?auto_312858 ) ) ( not ( = ?auto_312856 ?auto_312859 ) ) ( not ( = ?auto_312856 ?auto_312860 ) ) ( not ( = ?auto_312856 ?auto_312864 ) ) ( not ( = ?auto_312855 ?auto_312857 ) ) ( not ( = ?auto_312855 ?auto_312858 ) ) ( not ( = ?auto_312855 ?auto_312859 ) ) ( not ( = ?auto_312855 ?auto_312860 ) ) ( not ( = ?auto_312855 ?auto_312864 ) ) ( not ( = ?auto_312857 ?auto_312858 ) ) ( not ( = ?auto_312857 ?auto_312859 ) ) ( not ( = ?auto_312857 ?auto_312860 ) ) ( not ( = ?auto_312857 ?auto_312864 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312858 ?auto_312859 ?auto_312860 )
      ( MAKE-10CRATE-VERIFY ?auto_312851 ?auto_312852 ?auto_312853 ?auto_312850 ?auto_312854 ?auto_312856 ?auto_312855 ?auto_312857 ?auto_312858 ?auto_312859 ?auto_312860 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312977 - SURFACE
      ?auto_312978 - SURFACE
      ?auto_312979 - SURFACE
      ?auto_312976 - SURFACE
      ?auto_312980 - SURFACE
      ?auto_312982 - SURFACE
      ?auto_312981 - SURFACE
      ?auto_312983 - SURFACE
      ?auto_312984 - SURFACE
      ?auto_312985 - SURFACE
      ?auto_312986 - SURFACE
    )
    :vars
    (
      ?auto_312989 - HOIST
      ?auto_312988 - PLACE
      ?auto_312987 - PLACE
      ?auto_312992 - HOIST
      ?auto_312991 - SURFACE
      ?auto_312990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312989 ?auto_312988 ) ( SURFACE-AT ?auto_312985 ?auto_312988 ) ( CLEAR ?auto_312985 ) ( IS-CRATE ?auto_312986 ) ( not ( = ?auto_312985 ?auto_312986 ) ) ( AVAILABLE ?auto_312989 ) ( ON ?auto_312985 ?auto_312984 ) ( not ( = ?auto_312984 ?auto_312985 ) ) ( not ( = ?auto_312984 ?auto_312986 ) ) ( not ( = ?auto_312987 ?auto_312988 ) ) ( HOIST-AT ?auto_312992 ?auto_312987 ) ( not ( = ?auto_312989 ?auto_312992 ) ) ( AVAILABLE ?auto_312992 ) ( SURFACE-AT ?auto_312986 ?auto_312987 ) ( ON ?auto_312986 ?auto_312991 ) ( CLEAR ?auto_312986 ) ( not ( = ?auto_312985 ?auto_312991 ) ) ( not ( = ?auto_312986 ?auto_312991 ) ) ( not ( = ?auto_312984 ?auto_312991 ) ) ( TRUCK-AT ?auto_312990 ?auto_312988 ) ( ON ?auto_312978 ?auto_312977 ) ( ON ?auto_312979 ?auto_312978 ) ( ON ?auto_312976 ?auto_312979 ) ( ON ?auto_312980 ?auto_312976 ) ( ON ?auto_312982 ?auto_312980 ) ( ON ?auto_312981 ?auto_312982 ) ( ON ?auto_312983 ?auto_312981 ) ( ON ?auto_312984 ?auto_312983 ) ( not ( = ?auto_312977 ?auto_312978 ) ) ( not ( = ?auto_312977 ?auto_312979 ) ) ( not ( = ?auto_312977 ?auto_312976 ) ) ( not ( = ?auto_312977 ?auto_312980 ) ) ( not ( = ?auto_312977 ?auto_312982 ) ) ( not ( = ?auto_312977 ?auto_312981 ) ) ( not ( = ?auto_312977 ?auto_312983 ) ) ( not ( = ?auto_312977 ?auto_312984 ) ) ( not ( = ?auto_312977 ?auto_312985 ) ) ( not ( = ?auto_312977 ?auto_312986 ) ) ( not ( = ?auto_312977 ?auto_312991 ) ) ( not ( = ?auto_312978 ?auto_312979 ) ) ( not ( = ?auto_312978 ?auto_312976 ) ) ( not ( = ?auto_312978 ?auto_312980 ) ) ( not ( = ?auto_312978 ?auto_312982 ) ) ( not ( = ?auto_312978 ?auto_312981 ) ) ( not ( = ?auto_312978 ?auto_312983 ) ) ( not ( = ?auto_312978 ?auto_312984 ) ) ( not ( = ?auto_312978 ?auto_312985 ) ) ( not ( = ?auto_312978 ?auto_312986 ) ) ( not ( = ?auto_312978 ?auto_312991 ) ) ( not ( = ?auto_312979 ?auto_312976 ) ) ( not ( = ?auto_312979 ?auto_312980 ) ) ( not ( = ?auto_312979 ?auto_312982 ) ) ( not ( = ?auto_312979 ?auto_312981 ) ) ( not ( = ?auto_312979 ?auto_312983 ) ) ( not ( = ?auto_312979 ?auto_312984 ) ) ( not ( = ?auto_312979 ?auto_312985 ) ) ( not ( = ?auto_312979 ?auto_312986 ) ) ( not ( = ?auto_312979 ?auto_312991 ) ) ( not ( = ?auto_312976 ?auto_312980 ) ) ( not ( = ?auto_312976 ?auto_312982 ) ) ( not ( = ?auto_312976 ?auto_312981 ) ) ( not ( = ?auto_312976 ?auto_312983 ) ) ( not ( = ?auto_312976 ?auto_312984 ) ) ( not ( = ?auto_312976 ?auto_312985 ) ) ( not ( = ?auto_312976 ?auto_312986 ) ) ( not ( = ?auto_312976 ?auto_312991 ) ) ( not ( = ?auto_312980 ?auto_312982 ) ) ( not ( = ?auto_312980 ?auto_312981 ) ) ( not ( = ?auto_312980 ?auto_312983 ) ) ( not ( = ?auto_312980 ?auto_312984 ) ) ( not ( = ?auto_312980 ?auto_312985 ) ) ( not ( = ?auto_312980 ?auto_312986 ) ) ( not ( = ?auto_312980 ?auto_312991 ) ) ( not ( = ?auto_312982 ?auto_312981 ) ) ( not ( = ?auto_312982 ?auto_312983 ) ) ( not ( = ?auto_312982 ?auto_312984 ) ) ( not ( = ?auto_312982 ?auto_312985 ) ) ( not ( = ?auto_312982 ?auto_312986 ) ) ( not ( = ?auto_312982 ?auto_312991 ) ) ( not ( = ?auto_312981 ?auto_312983 ) ) ( not ( = ?auto_312981 ?auto_312984 ) ) ( not ( = ?auto_312981 ?auto_312985 ) ) ( not ( = ?auto_312981 ?auto_312986 ) ) ( not ( = ?auto_312981 ?auto_312991 ) ) ( not ( = ?auto_312983 ?auto_312984 ) ) ( not ( = ?auto_312983 ?auto_312985 ) ) ( not ( = ?auto_312983 ?auto_312986 ) ) ( not ( = ?auto_312983 ?auto_312991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312984 ?auto_312985 ?auto_312986 )
      ( MAKE-10CRATE-VERIFY ?auto_312977 ?auto_312978 ?auto_312979 ?auto_312976 ?auto_312980 ?auto_312982 ?auto_312981 ?auto_312983 ?auto_312984 ?auto_312985 ?auto_312986 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_313103 - SURFACE
      ?auto_313104 - SURFACE
      ?auto_313105 - SURFACE
      ?auto_313102 - SURFACE
      ?auto_313106 - SURFACE
      ?auto_313108 - SURFACE
      ?auto_313107 - SURFACE
      ?auto_313109 - SURFACE
      ?auto_313110 - SURFACE
      ?auto_313111 - SURFACE
      ?auto_313112 - SURFACE
    )
    :vars
    (
      ?auto_313116 - HOIST
      ?auto_313118 - PLACE
      ?auto_313117 - PLACE
      ?auto_313113 - HOIST
      ?auto_313115 - SURFACE
      ?auto_313114 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313116 ?auto_313118 ) ( IS-CRATE ?auto_313112 ) ( not ( = ?auto_313111 ?auto_313112 ) ) ( not ( = ?auto_313110 ?auto_313111 ) ) ( not ( = ?auto_313110 ?auto_313112 ) ) ( not ( = ?auto_313117 ?auto_313118 ) ) ( HOIST-AT ?auto_313113 ?auto_313117 ) ( not ( = ?auto_313116 ?auto_313113 ) ) ( AVAILABLE ?auto_313113 ) ( SURFACE-AT ?auto_313112 ?auto_313117 ) ( ON ?auto_313112 ?auto_313115 ) ( CLEAR ?auto_313112 ) ( not ( = ?auto_313111 ?auto_313115 ) ) ( not ( = ?auto_313112 ?auto_313115 ) ) ( not ( = ?auto_313110 ?auto_313115 ) ) ( TRUCK-AT ?auto_313114 ?auto_313118 ) ( SURFACE-AT ?auto_313110 ?auto_313118 ) ( CLEAR ?auto_313110 ) ( LIFTING ?auto_313116 ?auto_313111 ) ( IS-CRATE ?auto_313111 ) ( ON ?auto_313104 ?auto_313103 ) ( ON ?auto_313105 ?auto_313104 ) ( ON ?auto_313102 ?auto_313105 ) ( ON ?auto_313106 ?auto_313102 ) ( ON ?auto_313108 ?auto_313106 ) ( ON ?auto_313107 ?auto_313108 ) ( ON ?auto_313109 ?auto_313107 ) ( ON ?auto_313110 ?auto_313109 ) ( not ( = ?auto_313103 ?auto_313104 ) ) ( not ( = ?auto_313103 ?auto_313105 ) ) ( not ( = ?auto_313103 ?auto_313102 ) ) ( not ( = ?auto_313103 ?auto_313106 ) ) ( not ( = ?auto_313103 ?auto_313108 ) ) ( not ( = ?auto_313103 ?auto_313107 ) ) ( not ( = ?auto_313103 ?auto_313109 ) ) ( not ( = ?auto_313103 ?auto_313110 ) ) ( not ( = ?auto_313103 ?auto_313111 ) ) ( not ( = ?auto_313103 ?auto_313112 ) ) ( not ( = ?auto_313103 ?auto_313115 ) ) ( not ( = ?auto_313104 ?auto_313105 ) ) ( not ( = ?auto_313104 ?auto_313102 ) ) ( not ( = ?auto_313104 ?auto_313106 ) ) ( not ( = ?auto_313104 ?auto_313108 ) ) ( not ( = ?auto_313104 ?auto_313107 ) ) ( not ( = ?auto_313104 ?auto_313109 ) ) ( not ( = ?auto_313104 ?auto_313110 ) ) ( not ( = ?auto_313104 ?auto_313111 ) ) ( not ( = ?auto_313104 ?auto_313112 ) ) ( not ( = ?auto_313104 ?auto_313115 ) ) ( not ( = ?auto_313105 ?auto_313102 ) ) ( not ( = ?auto_313105 ?auto_313106 ) ) ( not ( = ?auto_313105 ?auto_313108 ) ) ( not ( = ?auto_313105 ?auto_313107 ) ) ( not ( = ?auto_313105 ?auto_313109 ) ) ( not ( = ?auto_313105 ?auto_313110 ) ) ( not ( = ?auto_313105 ?auto_313111 ) ) ( not ( = ?auto_313105 ?auto_313112 ) ) ( not ( = ?auto_313105 ?auto_313115 ) ) ( not ( = ?auto_313102 ?auto_313106 ) ) ( not ( = ?auto_313102 ?auto_313108 ) ) ( not ( = ?auto_313102 ?auto_313107 ) ) ( not ( = ?auto_313102 ?auto_313109 ) ) ( not ( = ?auto_313102 ?auto_313110 ) ) ( not ( = ?auto_313102 ?auto_313111 ) ) ( not ( = ?auto_313102 ?auto_313112 ) ) ( not ( = ?auto_313102 ?auto_313115 ) ) ( not ( = ?auto_313106 ?auto_313108 ) ) ( not ( = ?auto_313106 ?auto_313107 ) ) ( not ( = ?auto_313106 ?auto_313109 ) ) ( not ( = ?auto_313106 ?auto_313110 ) ) ( not ( = ?auto_313106 ?auto_313111 ) ) ( not ( = ?auto_313106 ?auto_313112 ) ) ( not ( = ?auto_313106 ?auto_313115 ) ) ( not ( = ?auto_313108 ?auto_313107 ) ) ( not ( = ?auto_313108 ?auto_313109 ) ) ( not ( = ?auto_313108 ?auto_313110 ) ) ( not ( = ?auto_313108 ?auto_313111 ) ) ( not ( = ?auto_313108 ?auto_313112 ) ) ( not ( = ?auto_313108 ?auto_313115 ) ) ( not ( = ?auto_313107 ?auto_313109 ) ) ( not ( = ?auto_313107 ?auto_313110 ) ) ( not ( = ?auto_313107 ?auto_313111 ) ) ( not ( = ?auto_313107 ?auto_313112 ) ) ( not ( = ?auto_313107 ?auto_313115 ) ) ( not ( = ?auto_313109 ?auto_313110 ) ) ( not ( = ?auto_313109 ?auto_313111 ) ) ( not ( = ?auto_313109 ?auto_313112 ) ) ( not ( = ?auto_313109 ?auto_313115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313110 ?auto_313111 ?auto_313112 )
      ( MAKE-10CRATE-VERIFY ?auto_313103 ?auto_313104 ?auto_313105 ?auto_313102 ?auto_313106 ?auto_313108 ?auto_313107 ?auto_313109 ?auto_313110 ?auto_313111 ?auto_313112 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_313229 - SURFACE
      ?auto_313230 - SURFACE
      ?auto_313231 - SURFACE
      ?auto_313228 - SURFACE
      ?auto_313232 - SURFACE
      ?auto_313234 - SURFACE
      ?auto_313233 - SURFACE
      ?auto_313235 - SURFACE
      ?auto_313236 - SURFACE
      ?auto_313237 - SURFACE
      ?auto_313238 - SURFACE
    )
    :vars
    (
      ?auto_313241 - HOIST
      ?auto_313239 - PLACE
      ?auto_313244 - PLACE
      ?auto_313242 - HOIST
      ?auto_313240 - SURFACE
      ?auto_313243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313241 ?auto_313239 ) ( IS-CRATE ?auto_313238 ) ( not ( = ?auto_313237 ?auto_313238 ) ) ( not ( = ?auto_313236 ?auto_313237 ) ) ( not ( = ?auto_313236 ?auto_313238 ) ) ( not ( = ?auto_313244 ?auto_313239 ) ) ( HOIST-AT ?auto_313242 ?auto_313244 ) ( not ( = ?auto_313241 ?auto_313242 ) ) ( AVAILABLE ?auto_313242 ) ( SURFACE-AT ?auto_313238 ?auto_313244 ) ( ON ?auto_313238 ?auto_313240 ) ( CLEAR ?auto_313238 ) ( not ( = ?auto_313237 ?auto_313240 ) ) ( not ( = ?auto_313238 ?auto_313240 ) ) ( not ( = ?auto_313236 ?auto_313240 ) ) ( TRUCK-AT ?auto_313243 ?auto_313239 ) ( SURFACE-AT ?auto_313236 ?auto_313239 ) ( CLEAR ?auto_313236 ) ( IS-CRATE ?auto_313237 ) ( AVAILABLE ?auto_313241 ) ( IN ?auto_313237 ?auto_313243 ) ( ON ?auto_313230 ?auto_313229 ) ( ON ?auto_313231 ?auto_313230 ) ( ON ?auto_313228 ?auto_313231 ) ( ON ?auto_313232 ?auto_313228 ) ( ON ?auto_313234 ?auto_313232 ) ( ON ?auto_313233 ?auto_313234 ) ( ON ?auto_313235 ?auto_313233 ) ( ON ?auto_313236 ?auto_313235 ) ( not ( = ?auto_313229 ?auto_313230 ) ) ( not ( = ?auto_313229 ?auto_313231 ) ) ( not ( = ?auto_313229 ?auto_313228 ) ) ( not ( = ?auto_313229 ?auto_313232 ) ) ( not ( = ?auto_313229 ?auto_313234 ) ) ( not ( = ?auto_313229 ?auto_313233 ) ) ( not ( = ?auto_313229 ?auto_313235 ) ) ( not ( = ?auto_313229 ?auto_313236 ) ) ( not ( = ?auto_313229 ?auto_313237 ) ) ( not ( = ?auto_313229 ?auto_313238 ) ) ( not ( = ?auto_313229 ?auto_313240 ) ) ( not ( = ?auto_313230 ?auto_313231 ) ) ( not ( = ?auto_313230 ?auto_313228 ) ) ( not ( = ?auto_313230 ?auto_313232 ) ) ( not ( = ?auto_313230 ?auto_313234 ) ) ( not ( = ?auto_313230 ?auto_313233 ) ) ( not ( = ?auto_313230 ?auto_313235 ) ) ( not ( = ?auto_313230 ?auto_313236 ) ) ( not ( = ?auto_313230 ?auto_313237 ) ) ( not ( = ?auto_313230 ?auto_313238 ) ) ( not ( = ?auto_313230 ?auto_313240 ) ) ( not ( = ?auto_313231 ?auto_313228 ) ) ( not ( = ?auto_313231 ?auto_313232 ) ) ( not ( = ?auto_313231 ?auto_313234 ) ) ( not ( = ?auto_313231 ?auto_313233 ) ) ( not ( = ?auto_313231 ?auto_313235 ) ) ( not ( = ?auto_313231 ?auto_313236 ) ) ( not ( = ?auto_313231 ?auto_313237 ) ) ( not ( = ?auto_313231 ?auto_313238 ) ) ( not ( = ?auto_313231 ?auto_313240 ) ) ( not ( = ?auto_313228 ?auto_313232 ) ) ( not ( = ?auto_313228 ?auto_313234 ) ) ( not ( = ?auto_313228 ?auto_313233 ) ) ( not ( = ?auto_313228 ?auto_313235 ) ) ( not ( = ?auto_313228 ?auto_313236 ) ) ( not ( = ?auto_313228 ?auto_313237 ) ) ( not ( = ?auto_313228 ?auto_313238 ) ) ( not ( = ?auto_313228 ?auto_313240 ) ) ( not ( = ?auto_313232 ?auto_313234 ) ) ( not ( = ?auto_313232 ?auto_313233 ) ) ( not ( = ?auto_313232 ?auto_313235 ) ) ( not ( = ?auto_313232 ?auto_313236 ) ) ( not ( = ?auto_313232 ?auto_313237 ) ) ( not ( = ?auto_313232 ?auto_313238 ) ) ( not ( = ?auto_313232 ?auto_313240 ) ) ( not ( = ?auto_313234 ?auto_313233 ) ) ( not ( = ?auto_313234 ?auto_313235 ) ) ( not ( = ?auto_313234 ?auto_313236 ) ) ( not ( = ?auto_313234 ?auto_313237 ) ) ( not ( = ?auto_313234 ?auto_313238 ) ) ( not ( = ?auto_313234 ?auto_313240 ) ) ( not ( = ?auto_313233 ?auto_313235 ) ) ( not ( = ?auto_313233 ?auto_313236 ) ) ( not ( = ?auto_313233 ?auto_313237 ) ) ( not ( = ?auto_313233 ?auto_313238 ) ) ( not ( = ?auto_313233 ?auto_313240 ) ) ( not ( = ?auto_313235 ?auto_313236 ) ) ( not ( = ?auto_313235 ?auto_313237 ) ) ( not ( = ?auto_313235 ?auto_313238 ) ) ( not ( = ?auto_313235 ?auto_313240 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313236 ?auto_313237 ?auto_313238 )
      ( MAKE-10CRATE-VERIFY ?auto_313229 ?auto_313230 ?auto_313231 ?auto_313228 ?auto_313232 ?auto_313234 ?auto_313233 ?auto_313235 ?auto_313236 ?auto_313237 ?auto_313238 ) )
  )

)

