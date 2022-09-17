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
      ?auto_28634 - SURFACE
      ?auto_28635 - SURFACE
    )
    :vars
    (
      ?auto_28636 - HOIST
      ?auto_28637 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28636 ?auto_28637 ) ( SURFACE-AT ?auto_28634 ?auto_28637 ) ( CLEAR ?auto_28634 ) ( LIFTING ?auto_28636 ?auto_28635 ) ( IS-CRATE ?auto_28635 ) ( not ( = ?auto_28634 ?auto_28635 ) ) )
    :subtasks
    ( ( !DROP ?auto_28636 ?auto_28635 ?auto_28634 ?auto_28637 )
      ( MAKE-1CRATE-VERIFY ?auto_28634 ?auto_28635 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28638 - SURFACE
      ?auto_28639 - SURFACE
    )
    :vars
    (
      ?auto_28640 - HOIST
      ?auto_28641 - PLACE
      ?auto_28642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28640 ?auto_28641 ) ( SURFACE-AT ?auto_28638 ?auto_28641 ) ( CLEAR ?auto_28638 ) ( IS-CRATE ?auto_28639 ) ( not ( = ?auto_28638 ?auto_28639 ) ) ( TRUCK-AT ?auto_28642 ?auto_28641 ) ( AVAILABLE ?auto_28640 ) ( IN ?auto_28639 ?auto_28642 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28640 ?auto_28639 ?auto_28642 ?auto_28641 )
      ( MAKE-1CRATE ?auto_28638 ?auto_28639 )
      ( MAKE-1CRATE-VERIFY ?auto_28638 ?auto_28639 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28643 - SURFACE
      ?auto_28644 - SURFACE
    )
    :vars
    (
      ?auto_28647 - HOIST
      ?auto_28646 - PLACE
      ?auto_28645 - TRUCK
      ?auto_28648 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28647 ?auto_28646 ) ( SURFACE-AT ?auto_28643 ?auto_28646 ) ( CLEAR ?auto_28643 ) ( IS-CRATE ?auto_28644 ) ( not ( = ?auto_28643 ?auto_28644 ) ) ( AVAILABLE ?auto_28647 ) ( IN ?auto_28644 ?auto_28645 ) ( TRUCK-AT ?auto_28645 ?auto_28648 ) ( not ( = ?auto_28648 ?auto_28646 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28645 ?auto_28648 ?auto_28646 )
      ( MAKE-1CRATE ?auto_28643 ?auto_28644 )
      ( MAKE-1CRATE-VERIFY ?auto_28643 ?auto_28644 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28649 - SURFACE
      ?auto_28650 - SURFACE
    )
    :vars
    (
      ?auto_28653 - HOIST
      ?auto_28654 - PLACE
      ?auto_28651 - TRUCK
      ?auto_28652 - PLACE
      ?auto_28655 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28653 ?auto_28654 ) ( SURFACE-AT ?auto_28649 ?auto_28654 ) ( CLEAR ?auto_28649 ) ( IS-CRATE ?auto_28650 ) ( not ( = ?auto_28649 ?auto_28650 ) ) ( AVAILABLE ?auto_28653 ) ( TRUCK-AT ?auto_28651 ?auto_28652 ) ( not ( = ?auto_28652 ?auto_28654 ) ) ( HOIST-AT ?auto_28655 ?auto_28652 ) ( LIFTING ?auto_28655 ?auto_28650 ) ( not ( = ?auto_28653 ?auto_28655 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28655 ?auto_28650 ?auto_28651 ?auto_28652 )
      ( MAKE-1CRATE ?auto_28649 ?auto_28650 )
      ( MAKE-1CRATE-VERIFY ?auto_28649 ?auto_28650 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28656 - SURFACE
      ?auto_28657 - SURFACE
    )
    :vars
    (
      ?auto_28661 - HOIST
      ?auto_28658 - PLACE
      ?auto_28662 - TRUCK
      ?auto_28660 - PLACE
      ?auto_28659 - HOIST
      ?auto_28663 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28661 ?auto_28658 ) ( SURFACE-AT ?auto_28656 ?auto_28658 ) ( CLEAR ?auto_28656 ) ( IS-CRATE ?auto_28657 ) ( not ( = ?auto_28656 ?auto_28657 ) ) ( AVAILABLE ?auto_28661 ) ( TRUCK-AT ?auto_28662 ?auto_28660 ) ( not ( = ?auto_28660 ?auto_28658 ) ) ( HOIST-AT ?auto_28659 ?auto_28660 ) ( not ( = ?auto_28661 ?auto_28659 ) ) ( AVAILABLE ?auto_28659 ) ( SURFACE-AT ?auto_28657 ?auto_28660 ) ( ON ?auto_28657 ?auto_28663 ) ( CLEAR ?auto_28657 ) ( not ( = ?auto_28656 ?auto_28663 ) ) ( not ( = ?auto_28657 ?auto_28663 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28659 ?auto_28657 ?auto_28663 ?auto_28660 )
      ( MAKE-1CRATE ?auto_28656 ?auto_28657 )
      ( MAKE-1CRATE-VERIFY ?auto_28656 ?auto_28657 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28664 - SURFACE
      ?auto_28665 - SURFACE
    )
    :vars
    (
      ?auto_28667 - HOIST
      ?auto_28671 - PLACE
      ?auto_28669 - PLACE
      ?auto_28666 - HOIST
      ?auto_28668 - SURFACE
      ?auto_28670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28667 ?auto_28671 ) ( SURFACE-AT ?auto_28664 ?auto_28671 ) ( CLEAR ?auto_28664 ) ( IS-CRATE ?auto_28665 ) ( not ( = ?auto_28664 ?auto_28665 ) ) ( AVAILABLE ?auto_28667 ) ( not ( = ?auto_28669 ?auto_28671 ) ) ( HOIST-AT ?auto_28666 ?auto_28669 ) ( not ( = ?auto_28667 ?auto_28666 ) ) ( AVAILABLE ?auto_28666 ) ( SURFACE-AT ?auto_28665 ?auto_28669 ) ( ON ?auto_28665 ?auto_28668 ) ( CLEAR ?auto_28665 ) ( not ( = ?auto_28664 ?auto_28668 ) ) ( not ( = ?auto_28665 ?auto_28668 ) ) ( TRUCK-AT ?auto_28670 ?auto_28671 ) )
    :subtasks
    ( ( !DRIVE ?auto_28670 ?auto_28671 ?auto_28669 )
      ( MAKE-1CRATE ?auto_28664 ?auto_28665 )
      ( MAKE-1CRATE-VERIFY ?auto_28664 ?auto_28665 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28677 - SURFACE
      ?auto_28678 - SURFACE
    )
    :vars
    (
      ?auto_28679 - HOIST
      ?auto_28680 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28679 ?auto_28680 ) ( SURFACE-AT ?auto_28677 ?auto_28680 ) ( CLEAR ?auto_28677 ) ( LIFTING ?auto_28679 ?auto_28678 ) ( IS-CRATE ?auto_28678 ) ( not ( = ?auto_28677 ?auto_28678 ) ) )
    :subtasks
    ( ( !DROP ?auto_28679 ?auto_28678 ?auto_28677 ?auto_28680 )
      ( MAKE-1CRATE-VERIFY ?auto_28677 ?auto_28678 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28681 - SURFACE
      ?auto_28682 - SURFACE
      ?auto_28683 - SURFACE
    )
    :vars
    (
      ?auto_28685 - HOIST
      ?auto_28684 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28685 ?auto_28684 ) ( SURFACE-AT ?auto_28682 ?auto_28684 ) ( CLEAR ?auto_28682 ) ( LIFTING ?auto_28685 ?auto_28683 ) ( IS-CRATE ?auto_28683 ) ( not ( = ?auto_28682 ?auto_28683 ) ) ( ON ?auto_28682 ?auto_28681 ) ( not ( = ?auto_28681 ?auto_28682 ) ) ( not ( = ?auto_28681 ?auto_28683 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28682 ?auto_28683 )
      ( MAKE-2CRATE-VERIFY ?auto_28681 ?auto_28682 ?auto_28683 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28686 - SURFACE
      ?auto_28687 - SURFACE
    )
    :vars
    (
      ?auto_28689 - HOIST
      ?auto_28688 - PLACE
      ?auto_28690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28689 ?auto_28688 ) ( SURFACE-AT ?auto_28686 ?auto_28688 ) ( CLEAR ?auto_28686 ) ( IS-CRATE ?auto_28687 ) ( not ( = ?auto_28686 ?auto_28687 ) ) ( TRUCK-AT ?auto_28690 ?auto_28688 ) ( AVAILABLE ?auto_28689 ) ( IN ?auto_28687 ?auto_28690 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28689 ?auto_28687 ?auto_28690 ?auto_28688 )
      ( MAKE-1CRATE ?auto_28686 ?auto_28687 )
      ( MAKE-1CRATE-VERIFY ?auto_28686 ?auto_28687 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28691 - SURFACE
      ?auto_28692 - SURFACE
      ?auto_28693 - SURFACE
    )
    :vars
    (
      ?auto_28695 - HOIST
      ?auto_28696 - PLACE
      ?auto_28694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28695 ?auto_28696 ) ( SURFACE-AT ?auto_28692 ?auto_28696 ) ( CLEAR ?auto_28692 ) ( IS-CRATE ?auto_28693 ) ( not ( = ?auto_28692 ?auto_28693 ) ) ( TRUCK-AT ?auto_28694 ?auto_28696 ) ( AVAILABLE ?auto_28695 ) ( IN ?auto_28693 ?auto_28694 ) ( ON ?auto_28692 ?auto_28691 ) ( not ( = ?auto_28691 ?auto_28692 ) ) ( not ( = ?auto_28691 ?auto_28693 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28692 ?auto_28693 )
      ( MAKE-2CRATE-VERIFY ?auto_28691 ?auto_28692 ?auto_28693 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28697 - SURFACE
      ?auto_28698 - SURFACE
    )
    :vars
    (
      ?auto_28702 - HOIST
      ?auto_28701 - PLACE
      ?auto_28699 - TRUCK
      ?auto_28700 - SURFACE
      ?auto_28703 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28702 ?auto_28701 ) ( SURFACE-AT ?auto_28697 ?auto_28701 ) ( CLEAR ?auto_28697 ) ( IS-CRATE ?auto_28698 ) ( not ( = ?auto_28697 ?auto_28698 ) ) ( AVAILABLE ?auto_28702 ) ( IN ?auto_28698 ?auto_28699 ) ( ON ?auto_28697 ?auto_28700 ) ( not ( = ?auto_28700 ?auto_28697 ) ) ( not ( = ?auto_28700 ?auto_28698 ) ) ( TRUCK-AT ?auto_28699 ?auto_28703 ) ( not ( = ?auto_28703 ?auto_28701 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28699 ?auto_28703 ?auto_28701 )
      ( MAKE-2CRATE ?auto_28700 ?auto_28697 ?auto_28698 )
      ( MAKE-1CRATE-VERIFY ?auto_28697 ?auto_28698 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28704 - SURFACE
      ?auto_28705 - SURFACE
      ?auto_28706 - SURFACE
    )
    :vars
    (
      ?auto_28710 - HOIST
      ?auto_28707 - PLACE
      ?auto_28709 - TRUCK
      ?auto_28708 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28710 ?auto_28707 ) ( SURFACE-AT ?auto_28705 ?auto_28707 ) ( CLEAR ?auto_28705 ) ( IS-CRATE ?auto_28706 ) ( not ( = ?auto_28705 ?auto_28706 ) ) ( AVAILABLE ?auto_28710 ) ( IN ?auto_28706 ?auto_28709 ) ( ON ?auto_28705 ?auto_28704 ) ( not ( = ?auto_28704 ?auto_28705 ) ) ( not ( = ?auto_28704 ?auto_28706 ) ) ( TRUCK-AT ?auto_28709 ?auto_28708 ) ( not ( = ?auto_28708 ?auto_28707 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28705 ?auto_28706 )
      ( MAKE-2CRATE-VERIFY ?auto_28704 ?auto_28705 ?auto_28706 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28711 - SURFACE
      ?auto_28712 - SURFACE
    )
    :vars
    (
      ?auto_28717 - HOIST
      ?auto_28715 - PLACE
      ?auto_28714 - SURFACE
      ?auto_28713 - TRUCK
      ?auto_28716 - PLACE
      ?auto_28718 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28717 ?auto_28715 ) ( SURFACE-AT ?auto_28711 ?auto_28715 ) ( CLEAR ?auto_28711 ) ( IS-CRATE ?auto_28712 ) ( not ( = ?auto_28711 ?auto_28712 ) ) ( AVAILABLE ?auto_28717 ) ( ON ?auto_28711 ?auto_28714 ) ( not ( = ?auto_28714 ?auto_28711 ) ) ( not ( = ?auto_28714 ?auto_28712 ) ) ( TRUCK-AT ?auto_28713 ?auto_28716 ) ( not ( = ?auto_28716 ?auto_28715 ) ) ( HOIST-AT ?auto_28718 ?auto_28716 ) ( LIFTING ?auto_28718 ?auto_28712 ) ( not ( = ?auto_28717 ?auto_28718 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28718 ?auto_28712 ?auto_28713 ?auto_28716 )
      ( MAKE-2CRATE ?auto_28714 ?auto_28711 ?auto_28712 )
      ( MAKE-1CRATE-VERIFY ?auto_28711 ?auto_28712 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28719 - SURFACE
      ?auto_28720 - SURFACE
      ?auto_28721 - SURFACE
    )
    :vars
    (
      ?auto_28724 - HOIST
      ?auto_28726 - PLACE
      ?auto_28722 - TRUCK
      ?auto_28723 - PLACE
      ?auto_28725 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28724 ?auto_28726 ) ( SURFACE-AT ?auto_28720 ?auto_28726 ) ( CLEAR ?auto_28720 ) ( IS-CRATE ?auto_28721 ) ( not ( = ?auto_28720 ?auto_28721 ) ) ( AVAILABLE ?auto_28724 ) ( ON ?auto_28720 ?auto_28719 ) ( not ( = ?auto_28719 ?auto_28720 ) ) ( not ( = ?auto_28719 ?auto_28721 ) ) ( TRUCK-AT ?auto_28722 ?auto_28723 ) ( not ( = ?auto_28723 ?auto_28726 ) ) ( HOIST-AT ?auto_28725 ?auto_28723 ) ( LIFTING ?auto_28725 ?auto_28721 ) ( not ( = ?auto_28724 ?auto_28725 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28720 ?auto_28721 )
      ( MAKE-2CRATE-VERIFY ?auto_28719 ?auto_28720 ?auto_28721 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28727 - SURFACE
      ?auto_28728 - SURFACE
    )
    :vars
    (
      ?auto_28733 - HOIST
      ?auto_28729 - PLACE
      ?auto_28731 - SURFACE
      ?auto_28732 - TRUCK
      ?auto_28730 - PLACE
      ?auto_28734 - HOIST
      ?auto_28735 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28733 ?auto_28729 ) ( SURFACE-AT ?auto_28727 ?auto_28729 ) ( CLEAR ?auto_28727 ) ( IS-CRATE ?auto_28728 ) ( not ( = ?auto_28727 ?auto_28728 ) ) ( AVAILABLE ?auto_28733 ) ( ON ?auto_28727 ?auto_28731 ) ( not ( = ?auto_28731 ?auto_28727 ) ) ( not ( = ?auto_28731 ?auto_28728 ) ) ( TRUCK-AT ?auto_28732 ?auto_28730 ) ( not ( = ?auto_28730 ?auto_28729 ) ) ( HOIST-AT ?auto_28734 ?auto_28730 ) ( not ( = ?auto_28733 ?auto_28734 ) ) ( AVAILABLE ?auto_28734 ) ( SURFACE-AT ?auto_28728 ?auto_28730 ) ( ON ?auto_28728 ?auto_28735 ) ( CLEAR ?auto_28728 ) ( not ( = ?auto_28727 ?auto_28735 ) ) ( not ( = ?auto_28728 ?auto_28735 ) ) ( not ( = ?auto_28731 ?auto_28735 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28734 ?auto_28728 ?auto_28735 ?auto_28730 )
      ( MAKE-2CRATE ?auto_28731 ?auto_28727 ?auto_28728 )
      ( MAKE-1CRATE-VERIFY ?auto_28727 ?auto_28728 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28736 - SURFACE
      ?auto_28737 - SURFACE
      ?auto_28738 - SURFACE
    )
    :vars
    (
      ?auto_28740 - HOIST
      ?auto_28742 - PLACE
      ?auto_28744 - TRUCK
      ?auto_28741 - PLACE
      ?auto_28739 - HOIST
      ?auto_28743 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28740 ?auto_28742 ) ( SURFACE-AT ?auto_28737 ?auto_28742 ) ( CLEAR ?auto_28737 ) ( IS-CRATE ?auto_28738 ) ( not ( = ?auto_28737 ?auto_28738 ) ) ( AVAILABLE ?auto_28740 ) ( ON ?auto_28737 ?auto_28736 ) ( not ( = ?auto_28736 ?auto_28737 ) ) ( not ( = ?auto_28736 ?auto_28738 ) ) ( TRUCK-AT ?auto_28744 ?auto_28741 ) ( not ( = ?auto_28741 ?auto_28742 ) ) ( HOIST-AT ?auto_28739 ?auto_28741 ) ( not ( = ?auto_28740 ?auto_28739 ) ) ( AVAILABLE ?auto_28739 ) ( SURFACE-AT ?auto_28738 ?auto_28741 ) ( ON ?auto_28738 ?auto_28743 ) ( CLEAR ?auto_28738 ) ( not ( = ?auto_28737 ?auto_28743 ) ) ( not ( = ?auto_28738 ?auto_28743 ) ) ( not ( = ?auto_28736 ?auto_28743 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28737 ?auto_28738 )
      ( MAKE-2CRATE-VERIFY ?auto_28736 ?auto_28737 ?auto_28738 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28745 - SURFACE
      ?auto_28746 - SURFACE
    )
    :vars
    (
      ?auto_28748 - HOIST
      ?auto_28751 - PLACE
      ?auto_28749 - SURFACE
      ?auto_28752 - PLACE
      ?auto_28753 - HOIST
      ?auto_28750 - SURFACE
      ?auto_28747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28748 ?auto_28751 ) ( SURFACE-AT ?auto_28745 ?auto_28751 ) ( CLEAR ?auto_28745 ) ( IS-CRATE ?auto_28746 ) ( not ( = ?auto_28745 ?auto_28746 ) ) ( AVAILABLE ?auto_28748 ) ( ON ?auto_28745 ?auto_28749 ) ( not ( = ?auto_28749 ?auto_28745 ) ) ( not ( = ?auto_28749 ?auto_28746 ) ) ( not ( = ?auto_28752 ?auto_28751 ) ) ( HOIST-AT ?auto_28753 ?auto_28752 ) ( not ( = ?auto_28748 ?auto_28753 ) ) ( AVAILABLE ?auto_28753 ) ( SURFACE-AT ?auto_28746 ?auto_28752 ) ( ON ?auto_28746 ?auto_28750 ) ( CLEAR ?auto_28746 ) ( not ( = ?auto_28745 ?auto_28750 ) ) ( not ( = ?auto_28746 ?auto_28750 ) ) ( not ( = ?auto_28749 ?auto_28750 ) ) ( TRUCK-AT ?auto_28747 ?auto_28751 ) )
    :subtasks
    ( ( !DRIVE ?auto_28747 ?auto_28751 ?auto_28752 )
      ( MAKE-2CRATE ?auto_28749 ?auto_28745 ?auto_28746 )
      ( MAKE-1CRATE-VERIFY ?auto_28745 ?auto_28746 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28754 - SURFACE
      ?auto_28755 - SURFACE
      ?auto_28756 - SURFACE
    )
    :vars
    (
      ?auto_28762 - HOIST
      ?auto_28757 - PLACE
      ?auto_28759 - PLACE
      ?auto_28760 - HOIST
      ?auto_28758 - SURFACE
      ?auto_28761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28762 ?auto_28757 ) ( SURFACE-AT ?auto_28755 ?auto_28757 ) ( CLEAR ?auto_28755 ) ( IS-CRATE ?auto_28756 ) ( not ( = ?auto_28755 ?auto_28756 ) ) ( AVAILABLE ?auto_28762 ) ( ON ?auto_28755 ?auto_28754 ) ( not ( = ?auto_28754 ?auto_28755 ) ) ( not ( = ?auto_28754 ?auto_28756 ) ) ( not ( = ?auto_28759 ?auto_28757 ) ) ( HOIST-AT ?auto_28760 ?auto_28759 ) ( not ( = ?auto_28762 ?auto_28760 ) ) ( AVAILABLE ?auto_28760 ) ( SURFACE-AT ?auto_28756 ?auto_28759 ) ( ON ?auto_28756 ?auto_28758 ) ( CLEAR ?auto_28756 ) ( not ( = ?auto_28755 ?auto_28758 ) ) ( not ( = ?auto_28756 ?auto_28758 ) ) ( not ( = ?auto_28754 ?auto_28758 ) ) ( TRUCK-AT ?auto_28761 ?auto_28757 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28755 ?auto_28756 )
      ( MAKE-2CRATE-VERIFY ?auto_28754 ?auto_28755 ?auto_28756 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28763 - SURFACE
      ?auto_28764 - SURFACE
    )
    :vars
    (
      ?auto_28766 - HOIST
      ?auto_28771 - PLACE
      ?auto_28770 - SURFACE
      ?auto_28768 - PLACE
      ?auto_28767 - HOIST
      ?auto_28765 - SURFACE
      ?auto_28769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28766 ?auto_28771 ) ( IS-CRATE ?auto_28764 ) ( not ( = ?auto_28763 ?auto_28764 ) ) ( not ( = ?auto_28770 ?auto_28763 ) ) ( not ( = ?auto_28770 ?auto_28764 ) ) ( not ( = ?auto_28768 ?auto_28771 ) ) ( HOIST-AT ?auto_28767 ?auto_28768 ) ( not ( = ?auto_28766 ?auto_28767 ) ) ( AVAILABLE ?auto_28767 ) ( SURFACE-AT ?auto_28764 ?auto_28768 ) ( ON ?auto_28764 ?auto_28765 ) ( CLEAR ?auto_28764 ) ( not ( = ?auto_28763 ?auto_28765 ) ) ( not ( = ?auto_28764 ?auto_28765 ) ) ( not ( = ?auto_28770 ?auto_28765 ) ) ( TRUCK-AT ?auto_28769 ?auto_28771 ) ( SURFACE-AT ?auto_28770 ?auto_28771 ) ( CLEAR ?auto_28770 ) ( LIFTING ?auto_28766 ?auto_28763 ) ( IS-CRATE ?auto_28763 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28770 ?auto_28763 )
      ( MAKE-2CRATE ?auto_28770 ?auto_28763 ?auto_28764 )
      ( MAKE-1CRATE-VERIFY ?auto_28763 ?auto_28764 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28772 - SURFACE
      ?auto_28773 - SURFACE
      ?auto_28774 - SURFACE
    )
    :vars
    (
      ?auto_28775 - HOIST
      ?auto_28777 - PLACE
      ?auto_28779 - PLACE
      ?auto_28778 - HOIST
      ?auto_28776 - SURFACE
      ?auto_28780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28775 ?auto_28777 ) ( IS-CRATE ?auto_28774 ) ( not ( = ?auto_28773 ?auto_28774 ) ) ( not ( = ?auto_28772 ?auto_28773 ) ) ( not ( = ?auto_28772 ?auto_28774 ) ) ( not ( = ?auto_28779 ?auto_28777 ) ) ( HOIST-AT ?auto_28778 ?auto_28779 ) ( not ( = ?auto_28775 ?auto_28778 ) ) ( AVAILABLE ?auto_28778 ) ( SURFACE-AT ?auto_28774 ?auto_28779 ) ( ON ?auto_28774 ?auto_28776 ) ( CLEAR ?auto_28774 ) ( not ( = ?auto_28773 ?auto_28776 ) ) ( not ( = ?auto_28774 ?auto_28776 ) ) ( not ( = ?auto_28772 ?auto_28776 ) ) ( TRUCK-AT ?auto_28780 ?auto_28777 ) ( SURFACE-AT ?auto_28772 ?auto_28777 ) ( CLEAR ?auto_28772 ) ( LIFTING ?auto_28775 ?auto_28773 ) ( IS-CRATE ?auto_28773 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28773 ?auto_28774 )
      ( MAKE-2CRATE-VERIFY ?auto_28772 ?auto_28773 ?auto_28774 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28781 - SURFACE
      ?auto_28782 - SURFACE
    )
    :vars
    (
      ?auto_28785 - HOIST
      ?auto_28787 - PLACE
      ?auto_28783 - SURFACE
      ?auto_28789 - PLACE
      ?auto_28788 - HOIST
      ?auto_28784 - SURFACE
      ?auto_28786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28785 ?auto_28787 ) ( IS-CRATE ?auto_28782 ) ( not ( = ?auto_28781 ?auto_28782 ) ) ( not ( = ?auto_28783 ?auto_28781 ) ) ( not ( = ?auto_28783 ?auto_28782 ) ) ( not ( = ?auto_28789 ?auto_28787 ) ) ( HOIST-AT ?auto_28788 ?auto_28789 ) ( not ( = ?auto_28785 ?auto_28788 ) ) ( AVAILABLE ?auto_28788 ) ( SURFACE-AT ?auto_28782 ?auto_28789 ) ( ON ?auto_28782 ?auto_28784 ) ( CLEAR ?auto_28782 ) ( not ( = ?auto_28781 ?auto_28784 ) ) ( not ( = ?auto_28782 ?auto_28784 ) ) ( not ( = ?auto_28783 ?auto_28784 ) ) ( TRUCK-AT ?auto_28786 ?auto_28787 ) ( SURFACE-AT ?auto_28783 ?auto_28787 ) ( CLEAR ?auto_28783 ) ( IS-CRATE ?auto_28781 ) ( AVAILABLE ?auto_28785 ) ( IN ?auto_28781 ?auto_28786 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28785 ?auto_28781 ?auto_28786 ?auto_28787 )
      ( MAKE-2CRATE ?auto_28783 ?auto_28781 ?auto_28782 )
      ( MAKE-1CRATE-VERIFY ?auto_28781 ?auto_28782 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28790 - SURFACE
      ?auto_28791 - SURFACE
      ?auto_28792 - SURFACE
    )
    :vars
    (
      ?auto_28793 - HOIST
      ?auto_28797 - PLACE
      ?auto_28795 - PLACE
      ?auto_28794 - HOIST
      ?auto_28798 - SURFACE
      ?auto_28796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28793 ?auto_28797 ) ( IS-CRATE ?auto_28792 ) ( not ( = ?auto_28791 ?auto_28792 ) ) ( not ( = ?auto_28790 ?auto_28791 ) ) ( not ( = ?auto_28790 ?auto_28792 ) ) ( not ( = ?auto_28795 ?auto_28797 ) ) ( HOIST-AT ?auto_28794 ?auto_28795 ) ( not ( = ?auto_28793 ?auto_28794 ) ) ( AVAILABLE ?auto_28794 ) ( SURFACE-AT ?auto_28792 ?auto_28795 ) ( ON ?auto_28792 ?auto_28798 ) ( CLEAR ?auto_28792 ) ( not ( = ?auto_28791 ?auto_28798 ) ) ( not ( = ?auto_28792 ?auto_28798 ) ) ( not ( = ?auto_28790 ?auto_28798 ) ) ( TRUCK-AT ?auto_28796 ?auto_28797 ) ( SURFACE-AT ?auto_28790 ?auto_28797 ) ( CLEAR ?auto_28790 ) ( IS-CRATE ?auto_28791 ) ( AVAILABLE ?auto_28793 ) ( IN ?auto_28791 ?auto_28796 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28791 ?auto_28792 )
      ( MAKE-2CRATE-VERIFY ?auto_28790 ?auto_28791 ?auto_28792 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28799 - SURFACE
      ?auto_28800 - SURFACE
    )
    :vars
    (
      ?auto_28803 - HOIST
      ?auto_28801 - PLACE
      ?auto_28802 - SURFACE
      ?auto_28804 - PLACE
      ?auto_28805 - HOIST
      ?auto_28806 - SURFACE
      ?auto_28807 - TRUCK
      ?auto_28808 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28803 ?auto_28801 ) ( IS-CRATE ?auto_28800 ) ( not ( = ?auto_28799 ?auto_28800 ) ) ( not ( = ?auto_28802 ?auto_28799 ) ) ( not ( = ?auto_28802 ?auto_28800 ) ) ( not ( = ?auto_28804 ?auto_28801 ) ) ( HOIST-AT ?auto_28805 ?auto_28804 ) ( not ( = ?auto_28803 ?auto_28805 ) ) ( AVAILABLE ?auto_28805 ) ( SURFACE-AT ?auto_28800 ?auto_28804 ) ( ON ?auto_28800 ?auto_28806 ) ( CLEAR ?auto_28800 ) ( not ( = ?auto_28799 ?auto_28806 ) ) ( not ( = ?auto_28800 ?auto_28806 ) ) ( not ( = ?auto_28802 ?auto_28806 ) ) ( SURFACE-AT ?auto_28802 ?auto_28801 ) ( CLEAR ?auto_28802 ) ( IS-CRATE ?auto_28799 ) ( AVAILABLE ?auto_28803 ) ( IN ?auto_28799 ?auto_28807 ) ( TRUCK-AT ?auto_28807 ?auto_28808 ) ( not ( = ?auto_28808 ?auto_28801 ) ) ( not ( = ?auto_28804 ?auto_28808 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28807 ?auto_28808 ?auto_28801 )
      ( MAKE-2CRATE ?auto_28802 ?auto_28799 ?auto_28800 )
      ( MAKE-1CRATE-VERIFY ?auto_28799 ?auto_28800 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28809 - SURFACE
      ?auto_28810 - SURFACE
      ?auto_28811 - SURFACE
    )
    :vars
    (
      ?auto_28818 - HOIST
      ?auto_28816 - PLACE
      ?auto_28814 - PLACE
      ?auto_28812 - HOIST
      ?auto_28815 - SURFACE
      ?auto_28813 - TRUCK
      ?auto_28817 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28818 ?auto_28816 ) ( IS-CRATE ?auto_28811 ) ( not ( = ?auto_28810 ?auto_28811 ) ) ( not ( = ?auto_28809 ?auto_28810 ) ) ( not ( = ?auto_28809 ?auto_28811 ) ) ( not ( = ?auto_28814 ?auto_28816 ) ) ( HOIST-AT ?auto_28812 ?auto_28814 ) ( not ( = ?auto_28818 ?auto_28812 ) ) ( AVAILABLE ?auto_28812 ) ( SURFACE-AT ?auto_28811 ?auto_28814 ) ( ON ?auto_28811 ?auto_28815 ) ( CLEAR ?auto_28811 ) ( not ( = ?auto_28810 ?auto_28815 ) ) ( not ( = ?auto_28811 ?auto_28815 ) ) ( not ( = ?auto_28809 ?auto_28815 ) ) ( SURFACE-AT ?auto_28809 ?auto_28816 ) ( CLEAR ?auto_28809 ) ( IS-CRATE ?auto_28810 ) ( AVAILABLE ?auto_28818 ) ( IN ?auto_28810 ?auto_28813 ) ( TRUCK-AT ?auto_28813 ?auto_28817 ) ( not ( = ?auto_28817 ?auto_28816 ) ) ( not ( = ?auto_28814 ?auto_28817 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28810 ?auto_28811 )
      ( MAKE-2CRATE-VERIFY ?auto_28809 ?auto_28810 ?auto_28811 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28819 - SURFACE
      ?auto_28820 - SURFACE
    )
    :vars
    (
      ?auto_28825 - HOIST
      ?auto_28824 - PLACE
      ?auto_28828 - SURFACE
      ?auto_28821 - PLACE
      ?auto_28823 - HOIST
      ?auto_28822 - SURFACE
      ?auto_28826 - TRUCK
      ?auto_28827 - PLACE
      ?auto_28829 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28825 ?auto_28824 ) ( IS-CRATE ?auto_28820 ) ( not ( = ?auto_28819 ?auto_28820 ) ) ( not ( = ?auto_28828 ?auto_28819 ) ) ( not ( = ?auto_28828 ?auto_28820 ) ) ( not ( = ?auto_28821 ?auto_28824 ) ) ( HOIST-AT ?auto_28823 ?auto_28821 ) ( not ( = ?auto_28825 ?auto_28823 ) ) ( AVAILABLE ?auto_28823 ) ( SURFACE-AT ?auto_28820 ?auto_28821 ) ( ON ?auto_28820 ?auto_28822 ) ( CLEAR ?auto_28820 ) ( not ( = ?auto_28819 ?auto_28822 ) ) ( not ( = ?auto_28820 ?auto_28822 ) ) ( not ( = ?auto_28828 ?auto_28822 ) ) ( SURFACE-AT ?auto_28828 ?auto_28824 ) ( CLEAR ?auto_28828 ) ( IS-CRATE ?auto_28819 ) ( AVAILABLE ?auto_28825 ) ( TRUCK-AT ?auto_28826 ?auto_28827 ) ( not ( = ?auto_28827 ?auto_28824 ) ) ( not ( = ?auto_28821 ?auto_28827 ) ) ( HOIST-AT ?auto_28829 ?auto_28827 ) ( LIFTING ?auto_28829 ?auto_28819 ) ( not ( = ?auto_28825 ?auto_28829 ) ) ( not ( = ?auto_28823 ?auto_28829 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28829 ?auto_28819 ?auto_28826 ?auto_28827 )
      ( MAKE-2CRATE ?auto_28828 ?auto_28819 ?auto_28820 )
      ( MAKE-1CRATE-VERIFY ?auto_28819 ?auto_28820 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28830 - SURFACE
      ?auto_28831 - SURFACE
      ?auto_28832 - SURFACE
    )
    :vars
    (
      ?auto_28837 - HOIST
      ?auto_28834 - PLACE
      ?auto_28835 - PLACE
      ?auto_28838 - HOIST
      ?auto_28839 - SURFACE
      ?auto_28840 - TRUCK
      ?auto_28833 - PLACE
      ?auto_28836 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28837 ?auto_28834 ) ( IS-CRATE ?auto_28832 ) ( not ( = ?auto_28831 ?auto_28832 ) ) ( not ( = ?auto_28830 ?auto_28831 ) ) ( not ( = ?auto_28830 ?auto_28832 ) ) ( not ( = ?auto_28835 ?auto_28834 ) ) ( HOIST-AT ?auto_28838 ?auto_28835 ) ( not ( = ?auto_28837 ?auto_28838 ) ) ( AVAILABLE ?auto_28838 ) ( SURFACE-AT ?auto_28832 ?auto_28835 ) ( ON ?auto_28832 ?auto_28839 ) ( CLEAR ?auto_28832 ) ( not ( = ?auto_28831 ?auto_28839 ) ) ( not ( = ?auto_28832 ?auto_28839 ) ) ( not ( = ?auto_28830 ?auto_28839 ) ) ( SURFACE-AT ?auto_28830 ?auto_28834 ) ( CLEAR ?auto_28830 ) ( IS-CRATE ?auto_28831 ) ( AVAILABLE ?auto_28837 ) ( TRUCK-AT ?auto_28840 ?auto_28833 ) ( not ( = ?auto_28833 ?auto_28834 ) ) ( not ( = ?auto_28835 ?auto_28833 ) ) ( HOIST-AT ?auto_28836 ?auto_28833 ) ( LIFTING ?auto_28836 ?auto_28831 ) ( not ( = ?auto_28837 ?auto_28836 ) ) ( not ( = ?auto_28838 ?auto_28836 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28831 ?auto_28832 )
      ( MAKE-2CRATE-VERIFY ?auto_28830 ?auto_28831 ?auto_28832 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28841 - SURFACE
      ?auto_28842 - SURFACE
    )
    :vars
    (
      ?auto_28847 - HOIST
      ?auto_28851 - PLACE
      ?auto_28845 - SURFACE
      ?auto_28843 - PLACE
      ?auto_28846 - HOIST
      ?auto_28850 - SURFACE
      ?auto_28849 - TRUCK
      ?auto_28848 - PLACE
      ?auto_28844 - HOIST
      ?auto_28852 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28847 ?auto_28851 ) ( IS-CRATE ?auto_28842 ) ( not ( = ?auto_28841 ?auto_28842 ) ) ( not ( = ?auto_28845 ?auto_28841 ) ) ( not ( = ?auto_28845 ?auto_28842 ) ) ( not ( = ?auto_28843 ?auto_28851 ) ) ( HOIST-AT ?auto_28846 ?auto_28843 ) ( not ( = ?auto_28847 ?auto_28846 ) ) ( AVAILABLE ?auto_28846 ) ( SURFACE-AT ?auto_28842 ?auto_28843 ) ( ON ?auto_28842 ?auto_28850 ) ( CLEAR ?auto_28842 ) ( not ( = ?auto_28841 ?auto_28850 ) ) ( not ( = ?auto_28842 ?auto_28850 ) ) ( not ( = ?auto_28845 ?auto_28850 ) ) ( SURFACE-AT ?auto_28845 ?auto_28851 ) ( CLEAR ?auto_28845 ) ( IS-CRATE ?auto_28841 ) ( AVAILABLE ?auto_28847 ) ( TRUCK-AT ?auto_28849 ?auto_28848 ) ( not ( = ?auto_28848 ?auto_28851 ) ) ( not ( = ?auto_28843 ?auto_28848 ) ) ( HOIST-AT ?auto_28844 ?auto_28848 ) ( not ( = ?auto_28847 ?auto_28844 ) ) ( not ( = ?auto_28846 ?auto_28844 ) ) ( AVAILABLE ?auto_28844 ) ( SURFACE-AT ?auto_28841 ?auto_28848 ) ( ON ?auto_28841 ?auto_28852 ) ( CLEAR ?auto_28841 ) ( not ( = ?auto_28841 ?auto_28852 ) ) ( not ( = ?auto_28842 ?auto_28852 ) ) ( not ( = ?auto_28845 ?auto_28852 ) ) ( not ( = ?auto_28850 ?auto_28852 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28844 ?auto_28841 ?auto_28852 ?auto_28848 )
      ( MAKE-2CRATE ?auto_28845 ?auto_28841 ?auto_28842 )
      ( MAKE-1CRATE-VERIFY ?auto_28841 ?auto_28842 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28853 - SURFACE
      ?auto_28854 - SURFACE
      ?auto_28855 - SURFACE
    )
    :vars
    (
      ?auto_28858 - HOIST
      ?auto_28856 - PLACE
      ?auto_28862 - PLACE
      ?auto_28857 - HOIST
      ?auto_28859 - SURFACE
      ?auto_28860 - TRUCK
      ?auto_28864 - PLACE
      ?auto_28863 - HOIST
      ?auto_28861 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28858 ?auto_28856 ) ( IS-CRATE ?auto_28855 ) ( not ( = ?auto_28854 ?auto_28855 ) ) ( not ( = ?auto_28853 ?auto_28854 ) ) ( not ( = ?auto_28853 ?auto_28855 ) ) ( not ( = ?auto_28862 ?auto_28856 ) ) ( HOIST-AT ?auto_28857 ?auto_28862 ) ( not ( = ?auto_28858 ?auto_28857 ) ) ( AVAILABLE ?auto_28857 ) ( SURFACE-AT ?auto_28855 ?auto_28862 ) ( ON ?auto_28855 ?auto_28859 ) ( CLEAR ?auto_28855 ) ( not ( = ?auto_28854 ?auto_28859 ) ) ( not ( = ?auto_28855 ?auto_28859 ) ) ( not ( = ?auto_28853 ?auto_28859 ) ) ( SURFACE-AT ?auto_28853 ?auto_28856 ) ( CLEAR ?auto_28853 ) ( IS-CRATE ?auto_28854 ) ( AVAILABLE ?auto_28858 ) ( TRUCK-AT ?auto_28860 ?auto_28864 ) ( not ( = ?auto_28864 ?auto_28856 ) ) ( not ( = ?auto_28862 ?auto_28864 ) ) ( HOIST-AT ?auto_28863 ?auto_28864 ) ( not ( = ?auto_28858 ?auto_28863 ) ) ( not ( = ?auto_28857 ?auto_28863 ) ) ( AVAILABLE ?auto_28863 ) ( SURFACE-AT ?auto_28854 ?auto_28864 ) ( ON ?auto_28854 ?auto_28861 ) ( CLEAR ?auto_28854 ) ( not ( = ?auto_28854 ?auto_28861 ) ) ( not ( = ?auto_28855 ?auto_28861 ) ) ( not ( = ?auto_28853 ?auto_28861 ) ) ( not ( = ?auto_28859 ?auto_28861 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28854 ?auto_28855 )
      ( MAKE-2CRATE-VERIFY ?auto_28853 ?auto_28854 ?auto_28855 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28865 - SURFACE
      ?auto_28866 - SURFACE
    )
    :vars
    (
      ?auto_28874 - HOIST
      ?auto_28868 - PLACE
      ?auto_28870 - SURFACE
      ?auto_28867 - PLACE
      ?auto_28875 - HOIST
      ?auto_28876 - SURFACE
      ?auto_28872 - PLACE
      ?auto_28873 - HOIST
      ?auto_28871 - SURFACE
      ?auto_28869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28874 ?auto_28868 ) ( IS-CRATE ?auto_28866 ) ( not ( = ?auto_28865 ?auto_28866 ) ) ( not ( = ?auto_28870 ?auto_28865 ) ) ( not ( = ?auto_28870 ?auto_28866 ) ) ( not ( = ?auto_28867 ?auto_28868 ) ) ( HOIST-AT ?auto_28875 ?auto_28867 ) ( not ( = ?auto_28874 ?auto_28875 ) ) ( AVAILABLE ?auto_28875 ) ( SURFACE-AT ?auto_28866 ?auto_28867 ) ( ON ?auto_28866 ?auto_28876 ) ( CLEAR ?auto_28866 ) ( not ( = ?auto_28865 ?auto_28876 ) ) ( not ( = ?auto_28866 ?auto_28876 ) ) ( not ( = ?auto_28870 ?auto_28876 ) ) ( SURFACE-AT ?auto_28870 ?auto_28868 ) ( CLEAR ?auto_28870 ) ( IS-CRATE ?auto_28865 ) ( AVAILABLE ?auto_28874 ) ( not ( = ?auto_28872 ?auto_28868 ) ) ( not ( = ?auto_28867 ?auto_28872 ) ) ( HOIST-AT ?auto_28873 ?auto_28872 ) ( not ( = ?auto_28874 ?auto_28873 ) ) ( not ( = ?auto_28875 ?auto_28873 ) ) ( AVAILABLE ?auto_28873 ) ( SURFACE-AT ?auto_28865 ?auto_28872 ) ( ON ?auto_28865 ?auto_28871 ) ( CLEAR ?auto_28865 ) ( not ( = ?auto_28865 ?auto_28871 ) ) ( not ( = ?auto_28866 ?auto_28871 ) ) ( not ( = ?auto_28870 ?auto_28871 ) ) ( not ( = ?auto_28876 ?auto_28871 ) ) ( TRUCK-AT ?auto_28869 ?auto_28868 ) )
    :subtasks
    ( ( !DRIVE ?auto_28869 ?auto_28868 ?auto_28872 )
      ( MAKE-2CRATE ?auto_28870 ?auto_28865 ?auto_28866 )
      ( MAKE-1CRATE-VERIFY ?auto_28865 ?auto_28866 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28877 - SURFACE
      ?auto_28878 - SURFACE
      ?auto_28879 - SURFACE
    )
    :vars
    (
      ?auto_28886 - HOIST
      ?auto_28887 - PLACE
      ?auto_28888 - PLACE
      ?auto_28884 - HOIST
      ?auto_28880 - SURFACE
      ?auto_28885 - PLACE
      ?auto_28881 - HOIST
      ?auto_28882 - SURFACE
      ?auto_28883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28886 ?auto_28887 ) ( IS-CRATE ?auto_28879 ) ( not ( = ?auto_28878 ?auto_28879 ) ) ( not ( = ?auto_28877 ?auto_28878 ) ) ( not ( = ?auto_28877 ?auto_28879 ) ) ( not ( = ?auto_28888 ?auto_28887 ) ) ( HOIST-AT ?auto_28884 ?auto_28888 ) ( not ( = ?auto_28886 ?auto_28884 ) ) ( AVAILABLE ?auto_28884 ) ( SURFACE-AT ?auto_28879 ?auto_28888 ) ( ON ?auto_28879 ?auto_28880 ) ( CLEAR ?auto_28879 ) ( not ( = ?auto_28878 ?auto_28880 ) ) ( not ( = ?auto_28879 ?auto_28880 ) ) ( not ( = ?auto_28877 ?auto_28880 ) ) ( SURFACE-AT ?auto_28877 ?auto_28887 ) ( CLEAR ?auto_28877 ) ( IS-CRATE ?auto_28878 ) ( AVAILABLE ?auto_28886 ) ( not ( = ?auto_28885 ?auto_28887 ) ) ( not ( = ?auto_28888 ?auto_28885 ) ) ( HOIST-AT ?auto_28881 ?auto_28885 ) ( not ( = ?auto_28886 ?auto_28881 ) ) ( not ( = ?auto_28884 ?auto_28881 ) ) ( AVAILABLE ?auto_28881 ) ( SURFACE-AT ?auto_28878 ?auto_28885 ) ( ON ?auto_28878 ?auto_28882 ) ( CLEAR ?auto_28878 ) ( not ( = ?auto_28878 ?auto_28882 ) ) ( not ( = ?auto_28879 ?auto_28882 ) ) ( not ( = ?auto_28877 ?auto_28882 ) ) ( not ( = ?auto_28880 ?auto_28882 ) ) ( TRUCK-AT ?auto_28883 ?auto_28887 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28878 ?auto_28879 )
      ( MAKE-2CRATE-VERIFY ?auto_28877 ?auto_28878 ?auto_28879 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28898 - SURFACE
      ?auto_28899 - SURFACE
    )
    :vars
    (
      ?auto_28900 - HOIST
      ?auto_28901 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28900 ?auto_28901 ) ( SURFACE-AT ?auto_28898 ?auto_28901 ) ( CLEAR ?auto_28898 ) ( LIFTING ?auto_28900 ?auto_28899 ) ( IS-CRATE ?auto_28899 ) ( not ( = ?auto_28898 ?auto_28899 ) ) )
    :subtasks
    ( ( !DROP ?auto_28900 ?auto_28899 ?auto_28898 ?auto_28901 )
      ( MAKE-1CRATE-VERIFY ?auto_28898 ?auto_28899 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28902 - SURFACE
      ?auto_28903 - SURFACE
      ?auto_28904 - SURFACE
    )
    :vars
    (
      ?auto_28906 - HOIST
      ?auto_28905 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28906 ?auto_28905 ) ( SURFACE-AT ?auto_28903 ?auto_28905 ) ( CLEAR ?auto_28903 ) ( LIFTING ?auto_28906 ?auto_28904 ) ( IS-CRATE ?auto_28904 ) ( not ( = ?auto_28903 ?auto_28904 ) ) ( ON ?auto_28903 ?auto_28902 ) ( not ( = ?auto_28902 ?auto_28903 ) ) ( not ( = ?auto_28902 ?auto_28904 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28903 ?auto_28904 )
      ( MAKE-2CRATE-VERIFY ?auto_28902 ?auto_28903 ?auto_28904 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28907 - SURFACE
      ?auto_28908 - SURFACE
      ?auto_28909 - SURFACE
      ?auto_28910 - SURFACE
    )
    :vars
    (
      ?auto_28912 - HOIST
      ?auto_28911 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28912 ?auto_28911 ) ( SURFACE-AT ?auto_28909 ?auto_28911 ) ( CLEAR ?auto_28909 ) ( LIFTING ?auto_28912 ?auto_28910 ) ( IS-CRATE ?auto_28910 ) ( not ( = ?auto_28909 ?auto_28910 ) ) ( ON ?auto_28908 ?auto_28907 ) ( ON ?auto_28909 ?auto_28908 ) ( not ( = ?auto_28907 ?auto_28908 ) ) ( not ( = ?auto_28907 ?auto_28909 ) ) ( not ( = ?auto_28907 ?auto_28910 ) ) ( not ( = ?auto_28908 ?auto_28909 ) ) ( not ( = ?auto_28908 ?auto_28910 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28909 ?auto_28910 )
      ( MAKE-3CRATE-VERIFY ?auto_28907 ?auto_28908 ?auto_28909 ?auto_28910 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28913 - SURFACE
      ?auto_28914 - SURFACE
    )
    :vars
    (
      ?auto_28916 - HOIST
      ?auto_28915 - PLACE
      ?auto_28917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28916 ?auto_28915 ) ( SURFACE-AT ?auto_28913 ?auto_28915 ) ( CLEAR ?auto_28913 ) ( IS-CRATE ?auto_28914 ) ( not ( = ?auto_28913 ?auto_28914 ) ) ( TRUCK-AT ?auto_28917 ?auto_28915 ) ( AVAILABLE ?auto_28916 ) ( IN ?auto_28914 ?auto_28917 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28916 ?auto_28914 ?auto_28917 ?auto_28915 )
      ( MAKE-1CRATE ?auto_28913 ?auto_28914 )
      ( MAKE-1CRATE-VERIFY ?auto_28913 ?auto_28914 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28918 - SURFACE
      ?auto_28919 - SURFACE
      ?auto_28920 - SURFACE
    )
    :vars
    (
      ?auto_28921 - HOIST
      ?auto_28923 - PLACE
      ?auto_28922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28921 ?auto_28923 ) ( SURFACE-AT ?auto_28919 ?auto_28923 ) ( CLEAR ?auto_28919 ) ( IS-CRATE ?auto_28920 ) ( not ( = ?auto_28919 ?auto_28920 ) ) ( TRUCK-AT ?auto_28922 ?auto_28923 ) ( AVAILABLE ?auto_28921 ) ( IN ?auto_28920 ?auto_28922 ) ( ON ?auto_28919 ?auto_28918 ) ( not ( = ?auto_28918 ?auto_28919 ) ) ( not ( = ?auto_28918 ?auto_28920 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28919 ?auto_28920 )
      ( MAKE-2CRATE-VERIFY ?auto_28918 ?auto_28919 ?auto_28920 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28924 - SURFACE
      ?auto_28925 - SURFACE
      ?auto_28926 - SURFACE
      ?auto_28927 - SURFACE
    )
    :vars
    (
      ?auto_28929 - HOIST
      ?auto_28930 - PLACE
      ?auto_28928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28929 ?auto_28930 ) ( SURFACE-AT ?auto_28926 ?auto_28930 ) ( CLEAR ?auto_28926 ) ( IS-CRATE ?auto_28927 ) ( not ( = ?auto_28926 ?auto_28927 ) ) ( TRUCK-AT ?auto_28928 ?auto_28930 ) ( AVAILABLE ?auto_28929 ) ( IN ?auto_28927 ?auto_28928 ) ( ON ?auto_28926 ?auto_28925 ) ( not ( = ?auto_28925 ?auto_28926 ) ) ( not ( = ?auto_28925 ?auto_28927 ) ) ( ON ?auto_28925 ?auto_28924 ) ( not ( = ?auto_28924 ?auto_28925 ) ) ( not ( = ?auto_28924 ?auto_28926 ) ) ( not ( = ?auto_28924 ?auto_28927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28925 ?auto_28926 ?auto_28927 )
      ( MAKE-3CRATE-VERIFY ?auto_28924 ?auto_28925 ?auto_28926 ?auto_28927 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28931 - SURFACE
      ?auto_28932 - SURFACE
    )
    :vars
    (
      ?auto_28935 - HOIST
      ?auto_28936 - PLACE
      ?auto_28933 - TRUCK
      ?auto_28934 - SURFACE
      ?auto_28937 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28935 ?auto_28936 ) ( SURFACE-AT ?auto_28931 ?auto_28936 ) ( CLEAR ?auto_28931 ) ( IS-CRATE ?auto_28932 ) ( not ( = ?auto_28931 ?auto_28932 ) ) ( AVAILABLE ?auto_28935 ) ( IN ?auto_28932 ?auto_28933 ) ( ON ?auto_28931 ?auto_28934 ) ( not ( = ?auto_28934 ?auto_28931 ) ) ( not ( = ?auto_28934 ?auto_28932 ) ) ( TRUCK-AT ?auto_28933 ?auto_28937 ) ( not ( = ?auto_28937 ?auto_28936 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28933 ?auto_28937 ?auto_28936 )
      ( MAKE-2CRATE ?auto_28934 ?auto_28931 ?auto_28932 )
      ( MAKE-1CRATE-VERIFY ?auto_28931 ?auto_28932 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28938 - SURFACE
      ?auto_28939 - SURFACE
      ?auto_28940 - SURFACE
    )
    :vars
    (
      ?auto_28943 - HOIST
      ?auto_28942 - PLACE
      ?auto_28941 - TRUCK
      ?auto_28944 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28943 ?auto_28942 ) ( SURFACE-AT ?auto_28939 ?auto_28942 ) ( CLEAR ?auto_28939 ) ( IS-CRATE ?auto_28940 ) ( not ( = ?auto_28939 ?auto_28940 ) ) ( AVAILABLE ?auto_28943 ) ( IN ?auto_28940 ?auto_28941 ) ( ON ?auto_28939 ?auto_28938 ) ( not ( = ?auto_28938 ?auto_28939 ) ) ( not ( = ?auto_28938 ?auto_28940 ) ) ( TRUCK-AT ?auto_28941 ?auto_28944 ) ( not ( = ?auto_28944 ?auto_28942 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28939 ?auto_28940 )
      ( MAKE-2CRATE-VERIFY ?auto_28938 ?auto_28939 ?auto_28940 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28945 - SURFACE
      ?auto_28946 - SURFACE
      ?auto_28947 - SURFACE
      ?auto_28948 - SURFACE
    )
    :vars
    (
      ?auto_28949 - HOIST
      ?auto_28952 - PLACE
      ?auto_28950 - TRUCK
      ?auto_28951 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28949 ?auto_28952 ) ( SURFACE-AT ?auto_28947 ?auto_28952 ) ( CLEAR ?auto_28947 ) ( IS-CRATE ?auto_28948 ) ( not ( = ?auto_28947 ?auto_28948 ) ) ( AVAILABLE ?auto_28949 ) ( IN ?auto_28948 ?auto_28950 ) ( ON ?auto_28947 ?auto_28946 ) ( not ( = ?auto_28946 ?auto_28947 ) ) ( not ( = ?auto_28946 ?auto_28948 ) ) ( TRUCK-AT ?auto_28950 ?auto_28951 ) ( not ( = ?auto_28951 ?auto_28952 ) ) ( ON ?auto_28946 ?auto_28945 ) ( not ( = ?auto_28945 ?auto_28946 ) ) ( not ( = ?auto_28945 ?auto_28947 ) ) ( not ( = ?auto_28945 ?auto_28948 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28946 ?auto_28947 ?auto_28948 )
      ( MAKE-3CRATE-VERIFY ?auto_28945 ?auto_28946 ?auto_28947 ?auto_28948 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28953 - SURFACE
      ?auto_28954 - SURFACE
    )
    :vars
    (
      ?auto_28955 - HOIST
      ?auto_28959 - PLACE
      ?auto_28956 - SURFACE
      ?auto_28957 - TRUCK
      ?auto_28958 - PLACE
      ?auto_28960 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28955 ?auto_28959 ) ( SURFACE-AT ?auto_28953 ?auto_28959 ) ( CLEAR ?auto_28953 ) ( IS-CRATE ?auto_28954 ) ( not ( = ?auto_28953 ?auto_28954 ) ) ( AVAILABLE ?auto_28955 ) ( ON ?auto_28953 ?auto_28956 ) ( not ( = ?auto_28956 ?auto_28953 ) ) ( not ( = ?auto_28956 ?auto_28954 ) ) ( TRUCK-AT ?auto_28957 ?auto_28958 ) ( not ( = ?auto_28958 ?auto_28959 ) ) ( HOIST-AT ?auto_28960 ?auto_28958 ) ( LIFTING ?auto_28960 ?auto_28954 ) ( not ( = ?auto_28955 ?auto_28960 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28960 ?auto_28954 ?auto_28957 ?auto_28958 )
      ( MAKE-2CRATE ?auto_28956 ?auto_28953 ?auto_28954 )
      ( MAKE-1CRATE-VERIFY ?auto_28953 ?auto_28954 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28961 - SURFACE
      ?auto_28962 - SURFACE
      ?auto_28963 - SURFACE
    )
    :vars
    (
      ?auto_28967 - HOIST
      ?auto_28968 - PLACE
      ?auto_28966 - TRUCK
      ?auto_28964 - PLACE
      ?auto_28965 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28967 ?auto_28968 ) ( SURFACE-AT ?auto_28962 ?auto_28968 ) ( CLEAR ?auto_28962 ) ( IS-CRATE ?auto_28963 ) ( not ( = ?auto_28962 ?auto_28963 ) ) ( AVAILABLE ?auto_28967 ) ( ON ?auto_28962 ?auto_28961 ) ( not ( = ?auto_28961 ?auto_28962 ) ) ( not ( = ?auto_28961 ?auto_28963 ) ) ( TRUCK-AT ?auto_28966 ?auto_28964 ) ( not ( = ?auto_28964 ?auto_28968 ) ) ( HOIST-AT ?auto_28965 ?auto_28964 ) ( LIFTING ?auto_28965 ?auto_28963 ) ( not ( = ?auto_28967 ?auto_28965 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28962 ?auto_28963 )
      ( MAKE-2CRATE-VERIFY ?auto_28961 ?auto_28962 ?auto_28963 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28969 - SURFACE
      ?auto_28970 - SURFACE
      ?auto_28971 - SURFACE
      ?auto_28972 - SURFACE
    )
    :vars
    (
      ?auto_28973 - HOIST
      ?auto_28976 - PLACE
      ?auto_28975 - TRUCK
      ?auto_28977 - PLACE
      ?auto_28974 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28973 ?auto_28976 ) ( SURFACE-AT ?auto_28971 ?auto_28976 ) ( CLEAR ?auto_28971 ) ( IS-CRATE ?auto_28972 ) ( not ( = ?auto_28971 ?auto_28972 ) ) ( AVAILABLE ?auto_28973 ) ( ON ?auto_28971 ?auto_28970 ) ( not ( = ?auto_28970 ?auto_28971 ) ) ( not ( = ?auto_28970 ?auto_28972 ) ) ( TRUCK-AT ?auto_28975 ?auto_28977 ) ( not ( = ?auto_28977 ?auto_28976 ) ) ( HOIST-AT ?auto_28974 ?auto_28977 ) ( LIFTING ?auto_28974 ?auto_28972 ) ( not ( = ?auto_28973 ?auto_28974 ) ) ( ON ?auto_28970 ?auto_28969 ) ( not ( = ?auto_28969 ?auto_28970 ) ) ( not ( = ?auto_28969 ?auto_28971 ) ) ( not ( = ?auto_28969 ?auto_28972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28970 ?auto_28971 ?auto_28972 )
      ( MAKE-3CRATE-VERIFY ?auto_28969 ?auto_28970 ?auto_28971 ?auto_28972 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28978 - SURFACE
      ?auto_28979 - SURFACE
    )
    :vars
    (
      ?auto_28980 - HOIST
      ?auto_28984 - PLACE
      ?auto_28981 - SURFACE
      ?auto_28983 - TRUCK
      ?auto_28985 - PLACE
      ?auto_28982 - HOIST
      ?auto_28986 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28980 ?auto_28984 ) ( SURFACE-AT ?auto_28978 ?auto_28984 ) ( CLEAR ?auto_28978 ) ( IS-CRATE ?auto_28979 ) ( not ( = ?auto_28978 ?auto_28979 ) ) ( AVAILABLE ?auto_28980 ) ( ON ?auto_28978 ?auto_28981 ) ( not ( = ?auto_28981 ?auto_28978 ) ) ( not ( = ?auto_28981 ?auto_28979 ) ) ( TRUCK-AT ?auto_28983 ?auto_28985 ) ( not ( = ?auto_28985 ?auto_28984 ) ) ( HOIST-AT ?auto_28982 ?auto_28985 ) ( not ( = ?auto_28980 ?auto_28982 ) ) ( AVAILABLE ?auto_28982 ) ( SURFACE-AT ?auto_28979 ?auto_28985 ) ( ON ?auto_28979 ?auto_28986 ) ( CLEAR ?auto_28979 ) ( not ( = ?auto_28978 ?auto_28986 ) ) ( not ( = ?auto_28979 ?auto_28986 ) ) ( not ( = ?auto_28981 ?auto_28986 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28982 ?auto_28979 ?auto_28986 ?auto_28985 )
      ( MAKE-2CRATE ?auto_28981 ?auto_28978 ?auto_28979 )
      ( MAKE-1CRATE-VERIFY ?auto_28978 ?auto_28979 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28987 - SURFACE
      ?auto_28988 - SURFACE
      ?auto_28989 - SURFACE
    )
    :vars
    (
      ?auto_28990 - HOIST
      ?auto_28994 - PLACE
      ?auto_28995 - TRUCK
      ?auto_28993 - PLACE
      ?auto_28991 - HOIST
      ?auto_28992 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28990 ?auto_28994 ) ( SURFACE-AT ?auto_28988 ?auto_28994 ) ( CLEAR ?auto_28988 ) ( IS-CRATE ?auto_28989 ) ( not ( = ?auto_28988 ?auto_28989 ) ) ( AVAILABLE ?auto_28990 ) ( ON ?auto_28988 ?auto_28987 ) ( not ( = ?auto_28987 ?auto_28988 ) ) ( not ( = ?auto_28987 ?auto_28989 ) ) ( TRUCK-AT ?auto_28995 ?auto_28993 ) ( not ( = ?auto_28993 ?auto_28994 ) ) ( HOIST-AT ?auto_28991 ?auto_28993 ) ( not ( = ?auto_28990 ?auto_28991 ) ) ( AVAILABLE ?auto_28991 ) ( SURFACE-AT ?auto_28989 ?auto_28993 ) ( ON ?auto_28989 ?auto_28992 ) ( CLEAR ?auto_28989 ) ( not ( = ?auto_28988 ?auto_28992 ) ) ( not ( = ?auto_28989 ?auto_28992 ) ) ( not ( = ?auto_28987 ?auto_28992 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28988 ?auto_28989 )
      ( MAKE-2CRATE-VERIFY ?auto_28987 ?auto_28988 ?auto_28989 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28996 - SURFACE
      ?auto_28997 - SURFACE
      ?auto_28998 - SURFACE
      ?auto_28999 - SURFACE
    )
    :vars
    (
      ?auto_29003 - HOIST
      ?auto_29005 - PLACE
      ?auto_29004 - TRUCK
      ?auto_29000 - PLACE
      ?auto_29001 - HOIST
      ?auto_29002 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29003 ?auto_29005 ) ( SURFACE-AT ?auto_28998 ?auto_29005 ) ( CLEAR ?auto_28998 ) ( IS-CRATE ?auto_28999 ) ( not ( = ?auto_28998 ?auto_28999 ) ) ( AVAILABLE ?auto_29003 ) ( ON ?auto_28998 ?auto_28997 ) ( not ( = ?auto_28997 ?auto_28998 ) ) ( not ( = ?auto_28997 ?auto_28999 ) ) ( TRUCK-AT ?auto_29004 ?auto_29000 ) ( not ( = ?auto_29000 ?auto_29005 ) ) ( HOIST-AT ?auto_29001 ?auto_29000 ) ( not ( = ?auto_29003 ?auto_29001 ) ) ( AVAILABLE ?auto_29001 ) ( SURFACE-AT ?auto_28999 ?auto_29000 ) ( ON ?auto_28999 ?auto_29002 ) ( CLEAR ?auto_28999 ) ( not ( = ?auto_28998 ?auto_29002 ) ) ( not ( = ?auto_28999 ?auto_29002 ) ) ( not ( = ?auto_28997 ?auto_29002 ) ) ( ON ?auto_28997 ?auto_28996 ) ( not ( = ?auto_28996 ?auto_28997 ) ) ( not ( = ?auto_28996 ?auto_28998 ) ) ( not ( = ?auto_28996 ?auto_28999 ) ) ( not ( = ?auto_28996 ?auto_29002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28997 ?auto_28998 ?auto_28999 )
      ( MAKE-3CRATE-VERIFY ?auto_28996 ?auto_28997 ?auto_28998 ?auto_28999 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29006 - SURFACE
      ?auto_29007 - SURFACE
    )
    :vars
    (
      ?auto_29011 - HOIST
      ?auto_29014 - PLACE
      ?auto_29012 - SURFACE
      ?auto_29008 - PLACE
      ?auto_29009 - HOIST
      ?auto_29010 - SURFACE
      ?auto_29013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29011 ?auto_29014 ) ( SURFACE-AT ?auto_29006 ?auto_29014 ) ( CLEAR ?auto_29006 ) ( IS-CRATE ?auto_29007 ) ( not ( = ?auto_29006 ?auto_29007 ) ) ( AVAILABLE ?auto_29011 ) ( ON ?auto_29006 ?auto_29012 ) ( not ( = ?auto_29012 ?auto_29006 ) ) ( not ( = ?auto_29012 ?auto_29007 ) ) ( not ( = ?auto_29008 ?auto_29014 ) ) ( HOIST-AT ?auto_29009 ?auto_29008 ) ( not ( = ?auto_29011 ?auto_29009 ) ) ( AVAILABLE ?auto_29009 ) ( SURFACE-AT ?auto_29007 ?auto_29008 ) ( ON ?auto_29007 ?auto_29010 ) ( CLEAR ?auto_29007 ) ( not ( = ?auto_29006 ?auto_29010 ) ) ( not ( = ?auto_29007 ?auto_29010 ) ) ( not ( = ?auto_29012 ?auto_29010 ) ) ( TRUCK-AT ?auto_29013 ?auto_29014 ) )
    :subtasks
    ( ( !DRIVE ?auto_29013 ?auto_29014 ?auto_29008 )
      ( MAKE-2CRATE ?auto_29012 ?auto_29006 ?auto_29007 )
      ( MAKE-1CRATE-VERIFY ?auto_29006 ?auto_29007 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29015 - SURFACE
      ?auto_29016 - SURFACE
      ?auto_29017 - SURFACE
    )
    :vars
    (
      ?auto_29018 - HOIST
      ?auto_29022 - PLACE
      ?auto_29019 - PLACE
      ?auto_29020 - HOIST
      ?auto_29021 - SURFACE
      ?auto_29023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29018 ?auto_29022 ) ( SURFACE-AT ?auto_29016 ?auto_29022 ) ( CLEAR ?auto_29016 ) ( IS-CRATE ?auto_29017 ) ( not ( = ?auto_29016 ?auto_29017 ) ) ( AVAILABLE ?auto_29018 ) ( ON ?auto_29016 ?auto_29015 ) ( not ( = ?auto_29015 ?auto_29016 ) ) ( not ( = ?auto_29015 ?auto_29017 ) ) ( not ( = ?auto_29019 ?auto_29022 ) ) ( HOIST-AT ?auto_29020 ?auto_29019 ) ( not ( = ?auto_29018 ?auto_29020 ) ) ( AVAILABLE ?auto_29020 ) ( SURFACE-AT ?auto_29017 ?auto_29019 ) ( ON ?auto_29017 ?auto_29021 ) ( CLEAR ?auto_29017 ) ( not ( = ?auto_29016 ?auto_29021 ) ) ( not ( = ?auto_29017 ?auto_29021 ) ) ( not ( = ?auto_29015 ?auto_29021 ) ) ( TRUCK-AT ?auto_29023 ?auto_29022 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29016 ?auto_29017 )
      ( MAKE-2CRATE-VERIFY ?auto_29015 ?auto_29016 ?auto_29017 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29024 - SURFACE
      ?auto_29025 - SURFACE
      ?auto_29026 - SURFACE
      ?auto_29027 - SURFACE
    )
    :vars
    (
      ?auto_29029 - HOIST
      ?auto_29033 - PLACE
      ?auto_29028 - PLACE
      ?auto_29031 - HOIST
      ?auto_29030 - SURFACE
      ?auto_29032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29029 ?auto_29033 ) ( SURFACE-AT ?auto_29026 ?auto_29033 ) ( CLEAR ?auto_29026 ) ( IS-CRATE ?auto_29027 ) ( not ( = ?auto_29026 ?auto_29027 ) ) ( AVAILABLE ?auto_29029 ) ( ON ?auto_29026 ?auto_29025 ) ( not ( = ?auto_29025 ?auto_29026 ) ) ( not ( = ?auto_29025 ?auto_29027 ) ) ( not ( = ?auto_29028 ?auto_29033 ) ) ( HOIST-AT ?auto_29031 ?auto_29028 ) ( not ( = ?auto_29029 ?auto_29031 ) ) ( AVAILABLE ?auto_29031 ) ( SURFACE-AT ?auto_29027 ?auto_29028 ) ( ON ?auto_29027 ?auto_29030 ) ( CLEAR ?auto_29027 ) ( not ( = ?auto_29026 ?auto_29030 ) ) ( not ( = ?auto_29027 ?auto_29030 ) ) ( not ( = ?auto_29025 ?auto_29030 ) ) ( TRUCK-AT ?auto_29032 ?auto_29033 ) ( ON ?auto_29025 ?auto_29024 ) ( not ( = ?auto_29024 ?auto_29025 ) ) ( not ( = ?auto_29024 ?auto_29026 ) ) ( not ( = ?auto_29024 ?auto_29027 ) ) ( not ( = ?auto_29024 ?auto_29030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29025 ?auto_29026 ?auto_29027 )
      ( MAKE-3CRATE-VERIFY ?auto_29024 ?auto_29025 ?auto_29026 ?auto_29027 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29034 - SURFACE
      ?auto_29035 - SURFACE
    )
    :vars
    (
      ?auto_29037 - HOIST
      ?auto_29042 - PLACE
      ?auto_29038 - SURFACE
      ?auto_29036 - PLACE
      ?auto_29040 - HOIST
      ?auto_29039 - SURFACE
      ?auto_29041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29037 ?auto_29042 ) ( IS-CRATE ?auto_29035 ) ( not ( = ?auto_29034 ?auto_29035 ) ) ( not ( = ?auto_29038 ?auto_29034 ) ) ( not ( = ?auto_29038 ?auto_29035 ) ) ( not ( = ?auto_29036 ?auto_29042 ) ) ( HOIST-AT ?auto_29040 ?auto_29036 ) ( not ( = ?auto_29037 ?auto_29040 ) ) ( AVAILABLE ?auto_29040 ) ( SURFACE-AT ?auto_29035 ?auto_29036 ) ( ON ?auto_29035 ?auto_29039 ) ( CLEAR ?auto_29035 ) ( not ( = ?auto_29034 ?auto_29039 ) ) ( not ( = ?auto_29035 ?auto_29039 ) ) ( not ( = ?auto_29038 ?auto_29039 ) ) ( TRUCK-AT ?auto_29041 ?auto_29042 ) ( SURFACE-AT ?auto_29038 ?auto_29042 ) ( CLEAR ?auto_29038 ) ( LIFTING ?auto_29037 ?auto_29034 ) ( IS-CRATE ?auto_29034 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29038 ?auto_29034 )
      ( MAKE-2CRATE ?auto_29038 ?auto_29034 ?auto_29035 )
      ( MAKE-1CRATE-VERIFY ?auto_29034 ?auto_29035 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29043 - SURFACE
      ?auto_29044 - SURFACE
      ?auto_29045 - SURFACE
    )
    :vars
    (
      ?auto_29048 - HOIST
      ?auto_29049 - PLACE
      ?auto_29050 - PLACE
      ?auto_29051 - HOIST
      ?auto_29047 - SURFACE
      ?auto_29046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29048 ?auto_29049 ) ( IS-CRATE ?auto_29045 ) ( not ( = ?auto_29044 ?auto_29045 ) ) ( not ( = ?auto_29043 ?auto_29044 ) ) ( not ( = ?auto_29043 ?auto_29045 ) ) ( not ( = ?auto_29050 ?auto_29049 ) ) ( HOIST-AT ?auto_29051 ?auto_29050 ) ( not ( = ?auto_29048 ?auto_29051 ) ) ( AVAILABLE ?auto_29051 ) ( SURFACE-AT ?auto_29045 ?auto_29050 ) ( ON ?auto_29045 ?auto_29047 ) ( CLEAR ?auto_29045 ) ( not ( = ?auto_29044 ?auto_29047 ) ) ( not ( = ?auto_29045 ?auto_29047 ) ) ( not ( = ?auto_29043 ?auto_29047 ) ) ( TRUCK-AT ?auto_29046 ?auto_29049 ) ( SURFACE-AT ?auto_29043 ?auto_29049 ) ( CLEAR ?auto_29043 ) ( LIFTING ?auto_29048 ?auto_29044 ) ( IS-CRATE ?auto_29044 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29044 ?auto_29045 )
      ( MAKE-2CRATE-VERIFY ?auto_29043 ?auto_29044 ?auto_29045 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29052 - SURFACE
      ?auto_29053 - SURFACE
      ?auto_29054 - SURFACE
      ?auto_29055 - SURFACE
    )
    :vars
    (
      ?auto_29059 - HOIST
      ?auto_29056 - PLACE
      ?auto_29058 - PLACE
      ?auto_29060 - HOIST
      ?auto_29057 - SURFACE
      ?auto_29061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29059 ?auto_29056 ) ( IS-CRATE ?auto_29055 ) ( not ( = ?auto_29054 ?auto_29055 ) ) ( not ( = ?auto_29053 ?auto_29054 ) ) ( not ( = ?auto_29053 ?auto_29055 ) ) ( not ( = ?auto_29058 ?auto_29056 ) ) ( HOIST-AT ?auto_29060 ?auto_29058 ) ( not ( = ?auto_29059 ?auto_29060 ) ) ( AVAILABLE ?auto_29060 ) ( SURFACE-AT ?auto_29055 ?auto_29058 ) ( ON ?auto_29055 ?auto_29057 ) ( CLEAR ?auto_29055 ) ( not ( = ?auto_29054 ?auto_29057 ) ) ( not ( = ?auto_29055 ?auto_29057 ) ) ( not ( = ?auto_29053 ?auto_29057 ) ) ( TRUCK-AT ?auto_29061 ?auto_29056 ) ( SURFACE-AT ?auto_29053 ?auto_29056 ) ( CLEAR ?auto_29053 ) ( LIFTING ?auto_29059 ?auto_29054 ) ( IS-CRATE ?auto_29054 ) ( ON ?auto_29053 ?auto_29052 ) ( not ( = ?auto_29052 ?auto_29053 ) ) ( not ( = ?auto_29052 ?auto_29054 ) ) ( not ( = ?auto_29052 ?auto_29055 ) ) ( not ( = ?auto_29052 ?auto_29057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29053 ?auto_29054 ?auto_29055 )
      ( MAKE-3CRATE-VERIFY ?auto_29052 ?auto_29053 ?auto_29054 ?auto_29055 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29062 - SURFACE
      ?auto_29063 - SURFACE
    )
    :vars
    (
      ?auto_29067 - HOIST
      ?auto_29064 - PLACE
      ?auto_29068 - SURFACE
      ?auto_29066 - PLACE
      ?auto_29069 - HOIST
      ?auto_29065 - SURFACE
      ?auto_29070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29067 ?auto_29064 ) ( IS-CRATE ?auto_29063 ) ( not ( = ?auto_29062 ?auto_29063 ) ) ( not ( = ?auto_29068 ?auto_29062 ) ) ( not ( = ?auto_29068 ?auto_29063 ) ) ( not ( = ?auto_29066 ?auto_29064 ) ) ( HOIST-AT ?auto_29069 ?auto_29066 ) ( not ( = ?auto_29067 ?auto_29069 ) ) ( AVAILABLE ?auto_29069 ) ( SURFACE-AT ?auto_29063 ?auto_29066 ) ( ON ?auto_29063 ?auto_29065 ) ( CLEAR ?auto_29063 ) ( not ( = ?auto_29062 ?auto_29065 ) ) ( not ( = ?auto_29063 ?auto_29065 ) ) ( not ( = ?auto_29068 ?auto_29065 ) ) ( TRUCK-AT ?auto_29070 ?auto_29064 ) ( SURFACE-AT ?auto_29068 ?auto_29064 ) ( CLEAR ?auto_29068 ) ( IS-CRATE ?auto_29062 ) ( AVAILABLE ?auto_29067 ) ( IN ?auto_29062 ?auto_29070 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29067 ?auto_29062 ?auto_29070 ?auto_29064 )
      ( MAKE-2CRATE ?auto_29068 ?auto_29062 ?auto_29063 )
      ( MAKE-1CRATE-VERIFY ?auto_29062 ?auto_29063 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29071 - SURFACE
      ?auto_29072 - SURFACE
      ?auto_29073 - SURFACE
    )
    :vars
    (
      ?auto_29075 - HOIST
      ?auto_29077 - PLACE
      ?auto_29078 - PLACE
      ?auto_29079 - HOIST
      ?auto_29074 - SURFACE
      ?auto_29076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29075 ?auto_29077 ) ( IS-CRATE ?auto_29073 ) ( not ( = ?auto_29072 ?auto_29073 ) ) ( not ( = ?auto_29071 ?auto_29072 ) ) ( not ( = ?auto_29071 ?auto_29073 ) ) ( not ( = ?auto_29078 ?auto_29077 ) ) ( HOIST-AT ?auto_29079 ?auto_29078 ) ( not ( = ?auto_29075 ?auto_29079 ) ) ( AVAILABLE ?auto_29079 ) ( SURFACE-AT ?auto_29073 ?auto_29078 ) ( ON ?auto_29073 ?auto_29074 ) ( CLEAR ?auto_29073 ) ( not ( = ?auto_29072 ?auto_29074 ) ) ( not ( = ?auto_29073 ?auto_29074 ) ) ( not ( = ?auto_29071 ?auto_29074 ) ) ( TRUCK-AT ?auto_29076 ?auto_29077 ) ( SURFACE-AT ?auto_29071 ?auto_29077 ) ( CLEAR ?auto_29071 ) ( IS-CRATE ?auto_29072 ) ( AVAILABLE ?auto_29075 ) ( IN ?auto_29072 ?auto_29076 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29072 ?auto_29073 )
      ( MAKE-2CRATE-VERIFY ?auto_29071 ?auto_29072 ?auto_29073 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29080 - SURFACE
      ?auto_29081 - SURFACE
      ?auto_29082 - SURFACE
      ?auto_29083 - SURFACE
    )
    :vars
    (
      ?auto_29089 - HOIST
      ?auto_29087 - PLACE
      ?auto_29085 - PLACE
      ?auto_29088 - HOIST
      ?auto_29084 - SURFACE
      ?auto_29086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29089 ?auto_29087 ) ( IS-CRATE ?auto_29083 ) ( not ( = ?auto_29082 ?auto_29083 ) ) ( not ( = ?auto_29081 ?auto_29082 ) ) ( not ( = ?auto_29081 ?auto_29083 ) ) ( not ( = ?auto_29085 ?auto_29087 ) ) ( HOIST-AT ?auto_29088 ?auto_29085 ) ( not ( = ?auto_29089 ?auto_29088 ) ) ( AVAILABLE ?auto_29088 ) ( SURFACE-AT ?auto_29083 ?auto_29085 ) ( ON ?auto_29083 ?auto_29084 ) ( CLEAR ?auto_29083 ) ( not ( = ?auto_29082 ?auto_29084 ) ) ( not ( = ?auto_29083 ?auto_29084 ) ) ( not ( = ?auto_29081 ?auto_29084 ) ) ( TRUCK-AT ?auto_29086 ?auto_29087 ) ( SURFACE-AT ?auto_29081 ?auto_29087 ) ( CLEAR ?auto_29081 ) ( IS-CRATE ?auto_29082 ) ( AVAILABLE ?auto_29089 ) ( IN ?auto_29082 ?auto_29086 ) ( ON ?auto_29081 ?auto_29080 ) ( not ( = ?auto_29080 ?auto_29081 ) ) ( not ( = ?auto_29080 ?auto_29082 ) ) ( not ( = ?auto_29080 ?auto_29083 ) ) ( not ( = ?auto_29080 ?auto_29084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29081 ?auto_29082 ?auto_29083 )
      ( MAKE-3CRATE-VERIFY ?auto_29080 ?auto_29081 ?auto_29082 ?auto_29083 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29090 - SURFACE
      ?auto_29091 - SURFACE
    )
    :vars
    (
      ?auto_29098 - HOIST
      ?auto_29096 - PLACE
      ?auto_29094 - SURFACE
      ?auto_29093 - PLACE
      ?auto_29097 - HOIST
      ?auto_29092 - SURFACE
      ?auto_29095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29098 ?auto_29096 ) ( IS-CRATE ?auto_29091 ) ( not ( = ?auto_29090 ?auto_29091 ) ) ( not ( = ?auto_29094 ?auto_29090 ) ) ( not ( = ?auto_29094 ?auto_29091 ) ) ( not ( = ?auto_29093 ?auto_29096 ) ) ( HOIST-AT ?auto_29097 ?auto_29093 ) ( not ( = ?auto_29098 ?auto_29097 ) ) ( AVAILABLE ?auto_29097 ) ( SURFACE-AT ?auto_29091 ?auto_29093 ) ( ON ?auto_29091 ?auto_29092 ) ( CLEAR ?auto_29091 ) ( not ( = ?auto_29090 ?auto_29092 ) ) ( not ( = ?auto_29091 ?auto_29092 ) ) ( not ( = ?auto_29094 ?auto_29092 ) ) ( SURFACE-AT ?auto_29094 ?auto_29096 ) ( CLEAR ?auto_29094 ) ( IS-CRATE ?auto_29090 ) ( AVAILABLE ?auto_29098 ) ( IN ?auto_29090 ?auto_29095 ) ( TRUCK-AT ?auto_29095 ?auto_29093 ) )
    :subtasks
    ( ( !DRIVE ?auto_29095 ?auto_29093 ?auto_29096 )
      ( MAKE-2CRATE ?auto_29094 ?auto_29090 ?auto_29091 )
      ( MAKE-1CRATE-VERIFY ?auto_29090 ?auto_29091 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29099 - SURFACE
      ?auto_29100 - SURFACE
      ?auto_29101 - SURFACE
    )
    :vars
    (
      ?auto_29107 - HOIST
      ?auto_29106 - PLACE
      ?auto_29103 - PLACE
      ?auto_29102 - HOIST
      ?auto_29105 - SURFACE
      ?auto_29104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29107 ?auto_29106 ) ( IS-CRATE ?auto_29101 ) ( not ( = ?auto_29100 ?auto_29101 ) ) ( not ( = ?auto_29099 ?auto_29100 ) ) ( not ( = ?auto_29099 ?auto_29101 ) ) ( not ( = ?auto_29103 ?auto_29106 ) ) ( HOIST-AT ?auto_29102 ?auto_29103 ) ( not ( = ?auto_29107 ?auto_29102 ) ) ( AVAILABLE ?auto_29102 ) ( SURFACE-AT ?auto_29101 ?auto_29103 ) ( ON ?auto_29101 ?auto_29105 ) ( CLEAR ?auto_29101 ) ( not ( = ?auto_29100 ?auto_29105 ) ) ( not ( = ?auto_29101 ?auto_29105 ) ) ( not ( = ?auto_29099 ?auto_29105 ) ) ( SURFACE-AT ?auto_29099 ?auto_29106 ) ( CLEAR ?auto_29099 ) ( IS-CRATE ?auto_29100 ) ( AVAILABLE ?auto_29107 ) ( IN ?auto_29100 ?auto_29104 ) ( TRUCK-AT ?auto_29104 ?auto_29103 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29100 ?auto_29101 )
      ( MAKE-2CRATE-VERIFY ?auto_29099 ?auto_29100 ?auto_29101 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29108 - SURFACE
      ?auto_29109 - SURFACE
      ?auto_29110 - SURFACE
      ?auto_29111 - SURFACE
    )
    :vars
    (
      ?auto_29116 - HOIST
      ?auto_29114 - PLACE
      ?auto_29115 - PLACE
      ?auto_29113 - HOIST
      ?auto_29112 - SURFACE
      ?auto_29117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29116 ?auto_29114 ) ( IS-CRATE ?auto_29111 ) ( not ( = ?auto_29110 ?auto_29111 ) ) ( not ( = ?auto_29109 ?auto_29110 ) ) ( not ( = ?auto_29109 ?auto_29111 ) ) ( not ( = ?auto_29115 ?auto_29114 ) ) ( HOIST-AT ?auto_29113 ?auto_29115 ) ( not ( = ?auto_29116 ?auto_29113 ) ) ( AVAILABLE ?auto_29113 ) ( SURFACE-AT ?auto_29111 ?auto_29115 ) ( ON ?auto_29111 ?auto_29112 ) ( CLEAR ?auto_29111 ) ( not ( = ?auto_29110 ?auto_29112 ) ) ( not ( = ?auto_29111 ?auto_29112 ) ) ( not ( = ?auto_29109 ?auto_29112 ) ) ( SURFACE-AT ?auto_29109 ?auto_29114 ) ( CLEAR ?auto_29109 ) ( IS-CRATE ?auto_29110 ) ( AVAILABLE ?auto_29116 ) ( IN ?auto_29110 ?auto_29117 ) ( TRUCK-AT ?auto_29117 ?auto_29115 ) ( ON ?auto_29109 ?auto_29108 ) ( not ( = ?auto_29108 ?auto_29109 ) ) ( not ( = ?auto_29108 ?auto_29110 ) ) ( not ( = ?auto_29108 ?auto_29111 ) ) ( not ( = ?auto_29108 ?auto_29112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29109 ?auto_29110 ?auto_29111 )
      ( MAKE-3CRATE-VERIFY ?auto_29108 ?auto_29109 ?auto_29110 ?auto_29111 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29118 - SURFACE
      ?auto_29119 - SURFACE
    )
    :vars
    (
      ?auto_29124 - HOIST
      ?auto_29122 - PLACE
      ?auto_29126 - SURFACE
      ?auto_29123 - PLACE
      ?auto_29121 - HOIST
      ?auto_29120 - SURFACE
      ?auto_29125 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29124 ?auto_29122 ) ( IS-CRATE ?auto_29119 ) ( not ( = ?auto_29118 ?auto_29119 ) ) ( not ( = ?auto_29126 ?auto_29118 ) ) ( not ( = ?auto_29126 ?auto_29119 ) ) ( not ( = ?auto_29123 ?auto_29122 ) ) ( HOIST-AT ?auto_29121 ?auto_29123 ) ( not ( = ?auto_29124 ?auto_29121 ) ) ( SURFACE-AT ?auto_29119 ?auto_29123 ) ( ON ?auto_29119 ?auto_29120 ) ( CLEAR ?auto_29119 ) ( not ( = ?auto_29118 ?auto_29120 ) ) ( not ( = ?auto_29119 ?auto_29120 ) ) ( not ( = ?auto_29126 ?auto_29120 ) ) ( SURFACE-AT ?auto_29126 ?auto_29122 ) ( CLEAR ?auto_29126 ) ( IS-CRATE ?auto_29118 ) ( AVAILABLE ?auto_29124 ) ( TRUCK-AT ?auto_29125 ?auto_29123 ) ( LIFTING ?auto_29121 ?auto_29118 ) )
    :subtasks
    ( ( !LOAD ?auto_29121 ?auto_29118 ?auto_29125 ?auto_29123 )
      ( MAKE-2CRATE ?auto_29126 ?auto_29118 ?auto_29119 )
      ( MAKE-1CRATE-VERIFY ?auto_29118 ?auto_29119 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29127 - SURFACE
      ?auto_29128 - SURFACE
      ?auto_29129 - SURFACE
    )
    :vars
    (
      ?auto_29135 - HOIST
      ?auto_29134 - PLACE
      ?auto_29133 - PLACE
      ?auto_29131 - HOIST
      ?auto_29130 - SURFACE
      ?auto_29132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29135 ?auto_29134 ) ( IS-CRATE ?auto_29129 ) ( not ( = ?auto_29128 ?auto_29129 ) ) ( not ( = ?auto_29127 ?auto_29128 ) ) ( not ( = ?auto_29127 ?auto_29129 ) ) ( not ( = ?auto_29133 ?auto_29134 ) ) ( HOIST-AT ?auto_29131 ?auto_29133 ) ( not ( = ?auto_29135 ?auto_29131 ) ) ( SURFACE-AT ?auto_29129 ?auto_29133 ) ( ON ?auto_29129 ?auto_29130 ) ( CLEAR ?auto_29129 ) ( not ( = ?auto_29128 ?auto_29130 ) ) ( not ( = ?auto_29129 ?auto_29130 ) ) ( not ( = ?auto_29127 ?auto_29130 ) ) ( SURFACE-AT ?auto_29127 ?auto_29134 ) ( CLEAR ?auto_29127 ) ( IS-CRATE ?auto_29128 ) ( AVAILABLE ?auto_29135 ) ( TRUCK-AT ?auto_29132 ?auto_29133 ) ( LIFTING ?auto_29131 ?auto_29128 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29128 ?auto_29129 )
      ( MAKE-2CRATE-VERIFY ?auto_29127 ?auto_29128 ?auto_29129 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29136 - SURFACE
      ?auto_29137 - SURFACE
      ?auto_29138 - SURFACE
      ?auto_29139 - SURFACE
    )
    :vars
    (
      ?auto_29145 - HOIST
      ?auto_29143 - PLACE
      ?auto_29141 - PLACE
      ?auto_29144 - HOIST
      ?auto_29140 - SURFACE
      ?auto_29142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29145 ?auto_29143 ) ( IS-CRATE ?auto_29139 ) ( not ( = ?auto_29138 ?auto_29139 ) ) ( not ( = ?auto_29137 ?auto_29138 ) ) ( not ( = ?auto_29137 ?auto_29139 ) ) ( not ( = ?auto_29141 ?auto_29143 ) ) ( HOIST-AT ?auto_29144 ?auto_29141 ) ( not ( = ?auto_29145 ?auto_29144 ) ) ( SURFACE-AT ?auto_29139 ?auto_29141 ) ( ON ?auto_29139 ?auto_29140 ) ( CLEAR ?auto_29139 ) ( not ( = ?auto_29138 ?auto_29140 ) ) ( not ( = ?auto_29139 ?auto_29140 ) ) ( not ( = ?auto_29137 ?auto_29140 ) ) ( SURFACE-AT ?auto_29137 ?auto_29143 ) ( CLEAR ?auto_29137 ) ( IS-CRATE ?auto_29138 ) ( AVAILABLE ?auto_29145 ) ( TRUCK-AT ?auto_29142 ?auto_29141 ) ( LIFTING ?auto_29144 ?auto_29138 ) ( ON ?auto_29137 ?auto_29136 ) ( not ( = ?auto_29136 ?auto_29137 ) ) ( not ( = ?auto_29136 ?auto_29138 ) ) ( not ( = ?auto_29136 ?auto_29139 ) ) ( not ( = ?auto_29136 ?auto_29140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29137 ?auto_29138 ?auto_29139 )
      ( MAKE-3CRATE-VERIFY ?auto_29136 ?auto_29137 ?auto_29138 ?auto_29139 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29146 - SURFACE
      ?auto_29147 - SURFACE
    )
    :vars
    (
      ?auto_29154 - HOIST
      ?auto_29152 - PLACE
      ?auto_29148 - SURFACE
      ?auto_29150 - PLACE
      ?auto_29153 - HOIST
      ?auto_29149 - SURFACE
      ?auto_29151 - TRUCK
      ?auto_29155 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29154 ?auto_29152 ) ( IS-CRATE ?auto_29147 ) ( not ( = ?auto_29146 ?auto_29147 ) ) ( not ( = ?auto_29148 ?auto_29146 ) ) ( not ( = ?auto_29148 ?auto_29147 ) ) ( not ( = ?auto_29150 ?auto_29152 ) ) ( HOIST-AT ?auto_29153 ?auto_29150 ) ( not ( = ?auto_29154 ?auto_29153 ) ) ( SURFACE-AT ?auto_29147 ?auto_29150 ) ( ON ?auto_29147 ?auto_29149 ) ( CLEAR ?auto_29147 ) ( not ( = ?auto_29146 ?auto_29149 ) ) ( not ( = ?auto_29147 ?auto_29149 ) ) ( not ( = ?auto_29148 ?auto_29149 ) ) ( SURFACE-AT ?auto_29148 ?auto_29152 ) ( CLEAR ?auto_29148 ) ( IS-CRATE ?auto_29146 ) ( AVAILABLE ?auto_29154 ) ( TRUCK-AT ?auto_29151 ?auto_29150 ) ( AVAILABLE ?auto_29153 ) ( SURFACE-AT ?auto_29146 ?auto_29150 ) ( ON ?auto_29146 ?auto_29155 ) ( CLEAR ?auto_29146 ) ( not ( = ?auto_29146 ?auto_29155 ) ) ( not ( = ?auto_29147 ?auto_29155 ) ) ( not ( = ?auto_29148 ?auto_29155 ) ) ( not ( = ?auto_29149 ?auto_29155 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29153 ?auto_29146 ?auto_29155 ?auto_29150 )
      ( MAKE-2CRATE ?auto_29148 ?auto_29146 ?auto_29147 )
      ( MAKE-1CRATE-VERIFY ?auto_29146 ?auto_29147 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29156 - SURFACE
      ?auto_29157 - SURFACE
      ?auto_29158 - SURFACE
    )
    :vars
    (
      ?auto_29159 - HOIST
      ?auto_29162 - PLACE
      ?auto_29161 - PLACE
      ?auto_29163 - HOIST
      ?auto_29164 - SURFACE
      ?auto_29160 - TRUCK
      ?auto_29165 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29159 ?auto_29162 ) ( IS-CRATE ?auto_29158 ) ( not ( = ?auto_29157 ?auto_29158 ) ) ( not ( = ?auto_29156 ?auto_29157 ) ) ( not ( = ?auto_29156 ?auto_29158 ) ) ( not ( = ?auto_29161 ?auto_29162 ) ) ( HOIST-AT ?auto_29163 ?auto_29161 ) ( not ( = ?auto_29159 ?auto_29163 ) ) ( SURFACE-AT ?auto_29158 ?auto_29161 ) ( ON ?auto_29158 ?auto_29164 ) ( CLEAR ?auto_29158 ) ( not ( = ?auto_29157 ?auto_29164 ) ) ( not ( = ?auto_29158 ?auto_29164 ) ) ( not ( = ?auto_29156 ?auto_29164 ) ) ( SURFACE-AT ?auto_29156 ?auto_29162 ) ( CLEAR ?auto_29156 ) ( IS-CRATE ?auto_29157 ) ( AVAILABLE ?auto_29159 ) ( TRUCK-AT ?auto_29160 ?auto_29161 ) ( AVAILABLE ?auto_29163 ) ( SURFACE-AT ?auto_29157 ?auto_29161 ) ( ON ?auto_29157 ?auto_29165 ) ( CLEAR ?auto_29157 ) ( not ( = ?auto_29157 ?auto_29165 ) ) ( not ( = ?auto_29158 ?auto_29165 ) ) ( not ( = ?auto_29156 ?auto_29165 ) ) ( not ( = ?auto_29164 ?auto_29165 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29157 ?auto_29158 )
      ( MAKE-2CRATE-VERIFY ?auto_29156 ?auto_29157 ?auto_29158 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29166 - SURFACE
      ?auto_29167 - SURFACE
      ?auto_29168 - SURFACE
      ?auto_29169 - SURFACE
    )
    :vars
    (
      ?auto_29170 - HOIST
      ?auto_29171 - PLACE
      ?auto_29173 - PLACE
      ?auto_29176 - HOIST
      ?auto_29172 - SURFACE
      ?auto_29175 - TRUCK
      ?auto_29174 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29170 ?auto_29171 ) ( IS-CRATE ?auto_29169 ) ( not ( = ?auto_29168 ?auto_29169 ) ) ( not ( = ?auto_29167 ?auto_29168 ) ) ( not ( = ?auto_29167 ?auto_29169 ) ) ( not ( = ?auto_29173 ?auto_29171 ) ) ( HOIST-AT ?auto_29176 ?auto_29173 ) ( not ( = ?auto_29170 ?auto_29176 ) ) ( SURFACE-AT ?auto_29169 ?auto_29173 ) ( ON ?auto_29169 ?auto_29172 ) ( CLEAR ?auto_29169 ) ( not ( = ?auto_29168 ?auto_29172 ) ) ( not ( = ?auto_29169 ?auto_29172 ) ) ( not ( = ?auto_29167 ?auto_29172 ) ) ( SURFACE-AT ?auto_29167 ?auto_29171 ) ( CLEAR ?auto_29167 ) ( IS-CRATE ?auto_29168 ) ( AVAILABLE ?auto_29170 ) ( TRUCK-AT ?auto_29175 ?auto_29173 ) ( AVAILABLE ?auto_29176 ) ( SURFACE-AT ?auto_29168 ?auto_29173 ) ( ON ?auto_29168 ?auto_29174 ) ( CLEAR ?auto_29168 ) ( not ( = ?auto_29168 ?auto_29174 ) ) ( not ( = ?auto_29169 ?auto_29174 ) ) ( not ( = ?auto_29167 ?auto_29174 ) ) ( not ( = ?auto_29172 ?auto_29174 ) ) ( ON ?auto_29167 ?auto_29166 ) ( not ( = ?auto_29166 ?auto_29167 ) ) ( not ( = ?auto_29166 ?auto_29168 ) ) ( not ( = ?auto_29166 ?auto_29169 ) ) ( not ( = ?auto_29166 ?auto_29172 ) ) ( not ( = ?auto_29166 ?auto_29174 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29167 ?auto_29168 ?auto_29169 )
      ( MAKE-3CRATE-VERIFY ?auto_29166 ?auto_29167 ?auto_29168 ?auto_29169 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29177 - SURFACE
      ?auto_29178 - SURFACE
    )
    :vars
    (
      ?auto_29179 - HOIST
      ?auto_29181 - PLACE
      ?auto_29180 - SURFACE
      ?auto_29183 - PLACE
      ?auto_29186 - HOIST
      ?auto_29182 - SURFACE
      ?auto_29184 - SURFACE
      ?auto_29185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29179 ?auto_29181 ) ( IS-CRATE ?auto_29178 ) ( not ( = ?auto_29177 ?auto_29178 ) ) ( not ( = ?auto_29180 ?auto_29177 ) ) ( not ( = ?auto_29180 ?auto_29178 ) ) ( not ( = ?auto_29183 ?auto_29181 ) ) ( HOIST-AT ?auto_29186 ?auto_29183 ) ( not ( = ?auto_29179 ?auto_29186 ) ) ( SURFACE-AT ?auto_29178 ?auto_29183 ) ( ON ?auto_29178 ?auto_29182 ) ( CLEAR ?auto_29178 ) ( not ( = ?auto_29177 ?auto_29182 ) ) ( not ( = ?auto_29178 ?auto_29182 ) ) ( not ( = ?auto_29180 ?auto_29182 ) ) ( SURFACE-AT ?auto_29180 ?auto_29181 ) ( CLEAR ?auto_29180 ) ( IS-CRATE ?auto_29177 ) ( AVAILABLE ?auto_29179 ) ( AVAILABLE ?auto_29186 ) ( SURFACE-AT ?auto_29177 ?auto_29183 ) ( ON ?auto_29177 ?auto_29184 ) ( CLEAR ?auto_29177 ) ( not ( = ?auto_29177 ?auto_29184 ) ) ( not ( = ?auto_29178 ?auto_29184 ) ) ( not ( = ?auto_29180 ?auto_29184 ) ) ( not ( = ?auto_29182 ?auto_29184 ) ) ( TRUCK-AT ?auto_29185 ?auto_29181 ) )
    :subtasks
    ( ( !DRIVE ?auto_29185 ?auto_29181 ?auto_29183 )
      ( MAKE-2CRATE ?auto_29180 ?auto_29177 ?auto_29178 )
      ( MAKE-1CRATE-VERIFY ?auto_29177 ?auto_29178 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29187 - SURFACE
      ?auto_29188 - SURFACE
      ?auto_29189 - SURFACE
    )
    :vars
    (
      ?auto_29193 - HOIST
      ?auto_29196 - PLACE
      ?auto_29195 - PLACE
      ?auto_29194 - HOIST
      ?auto_29190 - SURFACE
      ?auto_29192 - SURFACE
      ?auto_29191 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29193 ?auto_29196 ) ( IS-CRATE ?auto_29189 ) ( not ( = ?auto_29188 ?auto_29189 ) ) ( not ( = ?auto_29187 ?auto_29188 ) ) ( not ( = ?auto_29187 ?auto_29189 ) ) ( not ( = ?auto_29195 ?auto_29196 ) ) ( HOIST-AT ?auto_29194 ?auto_29195 ) ( not ( = ?auto_29193 ?auto_29194 ) ) ( SURFACE-AT ?auto_29189 ?auto_29195 ) ( ON ?auto_29189 ?auto_29190 ) ( CLEAR ?auto_29189 ) ( not ( = ?auto_29188 ?auto_29190 ) ) ( not ( = ?auto_29189 ?auto_29190 ) ) ( not ( = ?auto_29187 ?auto_29190 ) ) ( SURFACE-AT ?auto_29187 ?auto_29196 ) ( CLEAR ?auto_29187 ) ( IS-CRATE ?auto_29188 ) ( AVAILABLE ?auto_29193 ) ( AVAILABLE ?auto_29194 ) ( SURFACE-AT ?auto_29188 ?auto_29195 ) ( ON ?auto_29188 ?auto_29192 ) ( CLEAR ?auto_29188 ) ( not ( = ?auto_29188 ?auto_29192 ) ) ( not ( = ?auto_29189 ?auto_29192 ) ) ( not ( = ?auto_29187 ?auto_29192 ) ) ( not ( = ?auto_29190 ?auto_29192 ) ) ( TRUCK-AT ?auto_29191 ?auto_29196 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29188 ?auto_29189 )
      ( MAKE-2CRATE-VERIFY ?auto_29187 ?auto_29188 ?auto_29189 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29197 - SURFACE
      ?auto_29198 - SURFACE
      ?auto_29199 - SURFACE
      ?auto_29200 - SURFACE
    )
    :vars
    (
      ?auto_29205 - HOIST
      ?auto_29202 - PLACE
      ?auto_29207 - PLACE
      ?auto_29206 - HOIST
      ?auto_29203 - SURFACE
      ?auto_29204 - SURFACE
      ?auto_29201 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29205 ?auto_29202 ) ( IS-CRATE ?auto_29200 ) ( not ( = ?auto_29199 ?auto_29200 ) ) ( not ( = ?auto_29198 ?auto_29199 ) ) ( not ( = ?auto_29198 ?auto_29200 ) ) ( not ( = ?auto_29207 ?auto_29202 ) ) ( HOIST-AT ?auto_29206 ?auto_29207 ) ( not ( = ?auto_29205 ?auto_29206 ) ) ( SURFACE-AT ?auto_29200 ?auto_29207 ) ( ON ?auto_29200 ?auto_29203 ) ( CLEAR ?auto_29200 ) ( not ( = ?auto_29199 ?auto_29203 ) ) ( not ( = ?auto_29200 ?auto_29203 ) ) ( not ( = ?auto_29198 ?auto_29203 ) ) ( SURFACE-AT ?auto_29198 ?auto_29202 ) ( CLEAR ?auto_29198 ) ( IS-CRATE ?auto_29199 ) ( AVAILABLE ?auto_29205 ) ( AVAILABLE ?auto_29206 ) ( SURFACE-AT ?auto_29199 ?auto_29207 ) ( ON ?auto_29199 ?auto_29204 ) ( CLEAR ?auto_29199 ) ( not ( = ?auto_29199 ?auto_29204 ) ) ( not ( = ?auto_29200 ?auto_29204 ) ) ( not ( = ?auto_29198 ?auto_29204 ) ) ( not ( = ?auto_29203 ?auto_29204 ) ) ( TRUCK-AT ?auto_29201 ?auto_29202 ) ( ON ?auto_29198 ?auto_29197 ) ( not ( = ?auto_29197 ?auto_29198 ) ) ( not ( = ?auto_29197 ?auto_29199 ) ) ( not ( = ?auto_29197 ?auto_29200 ) ) ( not ( = ?auto_29197 ?auto_29203 ) ) ( not ( = ?auto_29197 ?auto_29204 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29198 ?auto_29199 ?auto_29200 )
      ( MAKE-3CRATE-VERIFY ?auto_29197 ?auto_29198 ?auto_29199 ?auto_29200 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29208 - SURFACE
      ?auto_29209 - SURFACE
    )
    :vars
    (
      ?auto_29215 - HOIST
      ?auto_29212 - PLACE
      ?auto_29211 - SURFACE
      ?auto_29217 - PLACE
      ?auto_29216 - HOIST
      ?auto_29213 - SURFACE
      ?auto_29214 - SURFACE
      ?auto_29210 - TRUCK
      ?auto_29218 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29215 ?auto_29212 ) ( IS-CRATE ?auto_29209 ) ( not ( = ?auto_29208 ?auto_29209 ) ) ( not ( = ?auto_29211 ?auto_29208 ) ) ( not ( = ?auto_29211 ?auto_29209 ) ) ( not ( = ?auto_29217 ?auto_29212 ) ) ( HOIST-AT ?auto_29216 ?auto_29217 ) ( not ( = ?auto_29215 ?auto_29216 ) ) ( SURFACE-AT ?auto_29209 ?auto_29217 ) ( ON ?auto_29209 ?auto_29213 ) ( CLEAR ?auto_29209 ) ( not ( = ?auto_29208 ?auto_29213 ) ) ( not ( = ?auto_29209 ?auto_29213 ) ) ( not ( = ?auto_29211 ?auto_29213 ) ) ( IS-CRATE ?auto_29208 ) ( AVAILABLE ?auto_29216 ) ( SURFACE-AT ?auto_29208 ?auto_29217 ) ( ON ?auto_29208 ?auto_29214 ) ( CLEAR ?auto_29208 ) ( not ( = ?auto_29208 ?auto_29214 ) ) ( not ( = ?auto_29209 ?auto_29214 ) ) ( not ( = ?auto_29211 ?auto_29214 ) ) ( not ( = ?auto_29213 ?auto_29214 ) ) ( TRUCK-AT ?auto_29210 ?auto_29212 ) ( SURFACE-AT ?auto_29218 ?auto_29212 ) ( CLEAR ?auto_29218 ) ( LIFTING ?auto_29215 ?auto_29211 ) ( IS-CRATE ?auto_29211 ) ( not ( = ?auto_29218 ?auto_29211 ) ) ( not ( = ?auto_29208 ?auto_29218 ) ) ( not ( = ?auto_29209 ?auto_29218 ) ) ( not ( = ?auto_29213 ?auto_29218 ) ) ( not ( = ?auto_29214 ?auto_29218 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29218 ?auto_29211 )
      ( MAKE-2CRATE ?auto_29211 ?auto_29208 ?auto_29209 )
      ( MAKE-1CRATE-VERIFY ?auto_29208 ?auto_29209 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29219 - SURFACE
      ?auto_29220 - SURFACE
      ?auto_29221 - SURFACE
    )
    :vars
    (
      ?auto_29222 - HOIST
      ?auto_29225 - PLACE
      ?auto_29229 - PLACE
      ?auto_29228 - HOIST
      ?auto_29223 - SURFACE
      ?auto_29224 - SURFACE
      ?auto_29227 - TRUCK
      ?auto_29226 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29222 ?auto_29225 ) ( IS-CRATE ?auto_29221 ) ( not ( = ?auto_29220 ?auto_29221 ) ) ( not ( = ?auto_29219 ?auto_29220 ) ) ( not ( = ?auto_29219 ?auto_29221 ) ) ( not ( = ?auto_29229 ?auto_29225 ) ) ( HOIST-AT ?auto_29228 ?auto_29229 ) ( not ( = ?auto_29222 ?auto_29228 ) ) ( SURFACE-AT ?auto_29221 ?auto_29229 ) ( ON ?auto_29221 ?auto_29223 ) ( CLEAR ?auto_29221 ) ( not ( = ?auto_29220 ?auto_29223 ) ) ( not ( = ?auto_29221 ?auto_29223 ) ) ( not ( = ?auto_29219 ?auto_29223 ) ) ( IS-CRATE ?auto_29220 ) ( AVAILABLE ?auto_29228 ) ( SURFACE-AT ?auto_29220 ?auto_29229 ) ( ON ?auto_29220 ?auto_29224 ) ( CLEAR ?auto_29220 ) ( not ( = ?auto_29220 ?auto_29224 ) ) ( not ( = ?auto_29221 ?auto_29224 ) ) ( not ( = ?auto_29219 ?auto_29224 ) ) ( not ( = ?auto_29223 ?auto_29224 ) ) ( TRUCK-AT ?auto_29227 ?auto_29225 ) ( SURFACE-AT ?auto_29226 ?auto_29225 ) ( CLEAR ?auto_29226 ) ( LIFTING ?auto_29222 ?auto_29219 ) ( IS-CRATE ?auto_29219 ) ( not ( = ?auto_29226 ?auto_29219 ) ) ( not ( = ?auto_29220 ?auto_29226 ) ) ( not ( = ?auto_29221 ?auto_29226 ) ) ( not ( = ?auto_29223 ?auto_29226 ) ) ( not ( = ?auto_29224 ?auto_29226 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29220 ?auto_29221 )
      ( MAKE-2CRATE-VERIFY ?auto_29219 ?auto_29220 ?auto_29221 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29230 - SURFACE
      ?auto_29231 - SURFACE
      ?auto_29232 - SURFACE
      ?auto_29233 - SURFACE
    )
    :vars
    (
      ?auto_29240 - HOIST
      ?auto_29239 - PLACE
      ?auto_29236 - PLACE
      ?auto_29237 - HOIST
      ?auto_29234 - SURFACE
      ?auto_29235 - SURFACE
      ?auto_29238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29240 ?auto_29239 ) ( IS-CRATE ?auto_29233 ) ( not ( = ?auto_29232 ?auto_29233 ) ) ( not ( = ?auto_29231 ?auto_29232 ) ) ( not ( = ?auto_29231 ?auto_29233 ) ) ( not ( = ?auto_29236 ?auto_29239 ) ) ( HOIST-AT ?auto_29237 ?auto_29236 ) ( not ( = ?auto_29240 ?auto_29237 ) ) ( SURFACE-AT ?auto_29233 ?auto_29236 ) ( ON ?auto_29233 ?auto_29234 ) ( CLEAR ?auto_29233 ) ( not ( = ?auto_29232 ?auto_29234 ) ) ( not ( = ?auto_29233 ?auto_29234 ) ) ( not ( = ?auto_29231 ?auto_29234 ) ) ( IS-CRATE ?auto_29232 ) ( AVAILABLE ?auto_29237 ) ( SURFACE-AT ?auto_29232 ?auto_29236 ) ( ON ?auto_29232 ?auto_29235 ) ( CLEAR ?auto_29232 ) ( not ( = ?auto_29232 ?auto_29235 ) ) ( not ( = ?auto_29233 ?auto_29235 ) ) ( not ( = ?auto_29231 ?auto_29235 ) ) ( not ( = ?auto_29234 ?auto_29235 ) ) ( TRUCK-AT ?auto_29238 ?auto_29239 ) ( SURFACE-AT ?auto_29230 ?auto_29239 ) ( CLEAR ?auto_29230 ) ( LIFTING ?auto_29240 ?auto_29231 ) ( IS-CRATE ?auto_29231 ) ( not ( = ?auto_29230 ?auto_29231 ) ) ( not ( = ?auto_29232 ?auto_29230 ) ) ( not ( = ?auto_29233 ?auto_29230 ) ) ( not ( = ?auto_29234 ?auto_29230 ) ) ( not ( = ?auto_29235 ?auto_29230 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29231 ?auto_29232 ?auto_29233 )
      ( MAKE-3CRATE-VERIFY ?auto_29230 ?auto_29231 ?auto_29232 ?auto_29233 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29241 - SURFACE
      ?auto_29242 - SURFACE
    )
    :vars
    (
      ?auto_29251 - HOIST
      ?auto_29250 - PLACE
      ?auto_29243 - SURFACE
      ?auto_29247 - PLACE
      ?auto_29248 - HOIST
      ?auto_29244 - SURFACE
      ?auto_29246 - SURFACE
      ?auto_29249 - TRUCK
      ?auto_29245 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29251 ?auto_29250 ) ( IS-CRATE ?auto_29242 ) ( not ( = ?auto_29241 ?auto_29242 ) ) ( not ( = ?auto_29243 ?auto_29241 ) ) ( not ( = ?auto_29243 ?auto_29242 ) ) ( not ( = ?auto_29247 ?auto_29250 ) ) ( HOIST-AT ?auto_29248 ?auto_29247 ) ( not ( = ?auto_29251 ?auto_29248 ) ) ( SURFACE-AT ?auto_29242 ?auto_29247 ) ( ON ?auto_29242 ?auto_29244 ) ( CLEAR ?auto_29242 ) ( not ( = ?auto_29241 ?auto_29244 ) ) ( not ( = ?auto_29242 ?auto_29244 ) ) ( not ( = ?auto_29243 ?auto_29244 ) ) ( IS-CRATE ?auto_29241 ) ( AVAILABLE ?auto_29248 ) ( SURFACE-AT ?auto_29241 ?auto_29247 ) ( ON ?auto_29241 ?auto_29246 ) ( CLEAR ?auto_29241 ) ( not ( = ?auto_29241 ?auto_29246 ) ) ( not ( = ?auto_29242 ?auto_29246 ) ) ( not ( = ?auto_29243 ?auto_29246 ) ) ( not ( = ?auto_29244 ?auto_29246 ) ) ( TRUCK-AT ?auto_29249 ?auto_29250 ) ( SURFACE-AT ?auto_29245 ?auto_29250 ) ( CLEAR ?auto_29245 ) ( IS-CRATE ?auto_29243 ) ( not ( = ?auto_29245 ?auto_29243 ) ) ( not ( = ?auto_29241 ?auto_29245 ) ) ( not ( = ?auto_29242 ?auto_29245 ) ) ( not ( = ?auto_29244 ?auto_29245 ) ) ( not ( = ?auto_29246 ?auto_29245 ) ) ( AVAILABLE ?auto_29251 ) ( IN ?auto_29243 ?auto_29249 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29251 ?auto_29243 ?auto_29249 ?auto_29250 )
      ( MAKE-2CRATE ?auto_29243 ?auto_29241 ?auto_29242 )
      ( MAKE-1CRATE-VERIFY ?auto_29241 ?auto_29242 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29252 - SURFACE
      ?auto_29253 - SURFACE
      ?auto_29254 - SURFACE
    )
    :vars
    (
      ?auto_29259 - HOIST
      ?auto_29256 - PLACE
      ?auto_29255 - PLACE
      ?auto_29260 - HOIST
      ?auto_29258 - SURFACE
      ?auto_29261 - SURFACE
      ?auto_29262 - TRUCK
      ?auto_29257 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29259 ?auto_29256 ) ( IS-CRATE ?auto_29254 ) ( not ( = ?auto_29253 ?auto_29254 ) ) ( not ( = ?auto_29252 ?auto_29253 ) ) ( not ( = ?auto_29252 ?auto_29254 ) ) ( not ( = ?auto_29255 ?auto_29256 ) ) ( HOIST-AT ?auto_29260 ?auto_29255 ) ( not ( = ?auto_29259 ?auto_29260 ) ) ( SURFACE-AT ?auto_29254 ?auto_29255 ) ( ON ?auto_29254 ?auto_29258 ) ( CLEAR ?auto_29254 ) ( not ( = ?auto_29253 ?auto_29258 ) ) ( not ( = ?auto_29254 ?auto_29258 ) ) ( not ( = ?auto_29252 ?auto_29258 ) ) ( IS-CRATE ?auto_29253 ) ( AVAILABLE ?auto_29260 ) ( SURFACE-AT ?auto_29253 ?auto_29255 ) ( ON ?auto_29253 ?auto_29261 ) ( CLEAR ?auto_29253 ) ( not ( = ?auto_29253 ?auto_29261 ) ) ( not ( = ?auto_29254 ?auto_29261 ) ) ( not ( = ?auto_29252 ?auto_29261 ) ) ( not ( = ?auto_29258 ?auto_29261 ) ) ( TRUCK-AT ?auto_29262 ?auto_29256 ) ( SURFACE-AT ?auto_29257 ?auto_29256 ) ( CLEAR ?auto_29257 ) ( IS-CRATE ?auto_29252 ) ( not ( = ?auto_29257 ?auto_29252 ) ) ( not ( = ?auto_29253 ?auto_29257 ) ) ( not ( = ?auto_29254 ?auto_29257 ) ) ( not ( = ?auto_29258 ?auto_29257 ) ) ( not ( = ?auto_29261 ?auto_29257 ) ) ( AVAILABLE ?auto_29259 ) ( IN ?auto_29252 ?auto_29262 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29253 ?auto_29254 )
      ( MAKE-2CRATE-VERIFY ?auto_29252 ?auto_29253 ?auto_29254 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29263 - SURFACE
      ?auto_29264 - SURFACE
      ?auto_29265 - SURFACE
      ?auto_29266 - SURFACE
    )
    :vars
    (
      ?auto_29271 - HOIST
      ?auto_29272 - PLACE
      ?auto_29268 - PLACE
      ?auto_29269 - HOIST
      ?auto_29267 - SURFACE
      ?auto_29270 - SURFACE
      ?auto_29273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29271 ?auto_29272 ) ( IS-CRATE ?auto_29266 ) ( not ( = ?auto_29265 ?auto_29266 ) ) ( not ( = ?auto_29264 ?auto_29265 ) ) ( not ( = ?auto_29264 ?auto_29266 ) ) ( not ( = ?auto_29268 ?auto_29272 ) ) ( HOIST-AT ?auto_29269 ?auto_29268 ) ( not ( = ?auto_29271 ?auto_29269 ) ) ( SURFACE-AT ?auto_29266 ?auto_29268 ) ( ON ?auto_29266 ?auto_29267 ) ( CLEAR ?auto_29266 ) ( not ( = ?auto_29265 ?auto_29267 ) ) ( not ( = ?auto_29266 ?auto_29267 ) ) ( not ( = ?auto_29264 ?auto_29267 ) ) ( IS-CRATE ?auto_29265 ) ( AVAILABLE ?auto_29269 ) ( SURFACE-AT ?auto_29265 ?auto_29268 ) ( ON ?auto_29265 ?auto_29270 ) ( CLEAR ?auto_29265 ) ( not ( = ?auto_29265 ?auto_29270 ) ) ( not ( = ?auto_29266 ?auto_29270 ) ) ( not ( = ?auto_29264 ?auto_29270 ) ) ( not ( = ?auto_29267 ?auto_29270 ) ) ( TRUCK-AT ?auto_29273 ?auto_29272 ) ( SURFACE-AT ?auto_29263 ?auto_29272 ) ( CLEAR ?auto_29263 ) ( IS-CRATE ?auto_29264 ) ( not ( = ?auto_29263 ?auto_29264 ) ) ( not ( = ?auto_29265 ?auto_29263 ) ) ( not ( = ?auto_29266 ?auto_29263 ) ) ( not ( = ?auto_29267 ?auto_29263 ) ) ( not ( = ?auto_29270 ?auto_29263 ) ) ( AVAILABLE ?auto_29271 ) ( IN ?auto_29264 ?auto_29273 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29264 ?auto_29265 ?auto_29266 )
      ( MAKE-3CRATE-VERIFY ?auto_29263 ?auto_29264 ?auto_29265 ?auto_29266 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29274 - SURFACE
      ?auto_29275 - SURFACE
    )
    :vars
    (
      ?auto_29281 - HOIST
      ?auto_29283 - PLACE
      ?auto_29282 - SURFACE
      ?auto_29277 - PLACE
      ?auto_29279 - HOIST
      ?auto_29276 - SURFACE
      ?auto_29280 - SURFACE
      ?auto_29278 - SURFACE
      ?auto_29284 - TRUCK
      ?auto_29285 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29281 ?auto_29283 ) ( IS-CRATE ?auto_29275 ) ( not ( = ?auto_29274 ?auto_29275 ) ) ( not ( = ?auto_29282 ?auto_29274 ) ) ( not ( = ?auto_29282 ?auto_29275 ) ) ( not ( = ?auto_29277 ?auto_29283 ) ) ( HOIST-AT ?auto_29279 ?auto_29277 ) ( not ( = ?auto_29281 ?auto_29279 ) ) ( SURFACE-AT ?auto_29275 ?auto_29277 ) ( ON ?auto_29275 ?auto_29276 ) ( CLEAR ?auto_29275 ) ( not ( = ?auto_29274 ?auto_29276 ) ) ( not ( = ?auto_29275 ?auto_29276 ) ) ( not ( = ?auto_29282 ?auto_29276 ) ) ( IS-CRATE ?auto_29274 ) ( AVAILABLE ?auto_29279 ) ( SURFACE-AT ?auto_29274 ?auto_29277 ) ( ON ?auto_29274 ?auto_29280 ) ( CLEAR ?auto_29274 ) ( not ( = ?auto_29274 ?auto_29280 ) ) ( not ( = ?auto_29275 ?auto_29280 ) ) ( not ( = ?auto_29282 ?auto_29280 ) ) ( not ( = ?auto_29276 ?auto_29280 ) ) ( SURFACE-AT ?auto_29278 ?auto_29283 ) ( CLEAR ?auto_29278 ) ( IS-CRATE ?auto_29282 ) ( not ( = ?auto_29278 ?auto_29282 ) ) ( not ( = ?auto_29274 ?auto_29278 ) ) ( not ( = ?auto_29275 ?auto_29278 ) ) ( not ( = ?auto_29276 ?auto_29278 ) ) ( not ( = ?auto_29280 ?auto_29278 ) ) ( AVAILABLE ?auto_29281 ) ( IN ?auto_29282 ?auto_29284 ) ( TRUCK-AT ?auto_29284 ?auto_29285 ) ( not ( = ?auto_29285 ?auto_29283 ) ) ( not ( = ?auto_29277 ?auto_29285 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29284 ?auto_29285 ?auto_29283 )
      ( MAKE-2CRATE ?auto_29282 ?auto_29274 ?auto_29275 )
      ( MAKE-1CRATE-VERIFY ?auto_29274 ?auto_29275 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29286 - SURFACE
      ?auto_29287 - SURFACE
      ?auto_29288 - SURFACE
    )
    :vars
    (
      ?auto_29295 - HOIST
      ?auto_29290 - PLACE
      ?auto_29289 - PLACE
      ?auto_29293 - HOIST
      ?auto_29294 - SURFACE
      ?auto_29291 - SURFACE
      ?auto_29296 - SURFACE
      ?auto_29292 - TRUCK
      ?auto_29297 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29295 ?auto_29290 ) ( IS-CRATE ?auto_29288 ) ( not ( = ?auto_29287 ?auto_29288 ) ) ( not ( = ?auto_29286 ?auto_29287 ) ) ( not ( = ?auto_29286 ?auto_29288 ) ) ( not ( = ?auto_29289 ?auto_29290 ) ) ( HOIST-AT ?auto_29293 ?auto_29289 ) ( not ( = ?auto_29295 ?auto_29293 ) ) ( SURFACE-AT ?auto_29288 ?auto_29289 ) ( ON ?auto_29288 ?auto_29294 ) ( CLEAR ?auto_29288 ) ( not ( = ?auto_29287 ?auto_29294 ) ) ( not ( = ?auto_29288 ?auto_29294 ) ) ( not ( = ?auto_29286 ?auto_29294 ) ) ( IS-CRATE ?auto_29287 ) ( AVAILABLE ?auto_29293 ) ( SURFACE-AT ?auto_29287 ?auto_29289 ) ( ON ?auto_29287 ?auto_29291 ) ( CLEAR ?auto_29287 ) ( not ( = ?auto_29287 ?auto_29291 ) ) ( not ( = ?auto_29288 ?auto_29291 ) ) ( not ( = ?auto_29286 ?auto_29291 ) ) ( not ( = ?auto_29294 ?auto_29291 ) ) ( SURFACE-AT ?auto_29296 ?auto_29290 ) ( CLEAR ?auto_29296 ) ( IS-CRATE ?auto_29286 ) ( not ( = ?auto_29296 ?auto_29286 ) ) ( not ( = ?auto_29287 ?auto_29296 ) ) ( not ( = ?auto_29288 ?auto_29296 ) ) ( not ( = ?auto_29294 ?auto_29296 ) ) ( not ( = ?auto_29291 ?auto_29296 ) ) ( AVAILABLE ?auto_29295 ) ( IN ?auto_29286 ?auto_29292 ) ( TRUCK-AT ?auto_29292 ?auto_29297 ) ( not ( = ?auto_29297 ?auto_29290 ) ) ( not ( = ?auto_29289 ?auto_29297 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29287 ?auto_29288 )
      ( MAKE-2CRATE-VERIFY ?auto_29286 ?auto_29287 ?auto_29288 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29298 - SURFACE
      ?auto_29299 - SURFACE
      ?auto_29300 - SURFACE
      ?auto_29301 - SURFACE
    )
    :vars
    (
      ?auto_29303 - HOIST
      ?auto_29308 - PLACE
      ?auto_29309 - PLACE
      ?auto_29305 - HOIST
      ?auto_29306 - SURFACE
      ?auto_29302 - SURFACE
      ?auto_29307 - TRUCK
      ?auto_29304 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29303 ?auto_29308 ) ( IS-CRATE ?auto_29301 ) ( not ( = ?auto_29300 ?auto_29301 ) ) ( not ( = ?auto_29299 ?auto_29300 ) ) ( not ( = ?auto_29299 ?auto_29301 ) ) ( not ( = ?auto_29309 ?auto_29308 ) ) ( HOIST-AT ?auto_29305 ?auto_29309 ) ( not ( = ?auto_29303 ?auto_29305 ) ) ( SURFACE-AT ?auto_29301 ?auto_29309 ) ( ON ?auto_29301 ?auto_29306 ) ( CLEAR ?auto_29301 ) ( not ( = ?auto_29300 ?auto_29306 ) ) ( not ( = ?auto_29301 ?auto_29306 ) ) ( not ( = ?auto_29299 ?auto_29306 ) ) ( IS-CRATE ?auto_29300 ) ( AVAILABLE ?auto_29305 ) ( SURFACE-AT ?auto_29300 ?auto_29309 ) ( ON ?auto_29300 ?auto_29302 ) ( CLEAR ?auto_29300 ) ( not ( = ?auto_29300 ?auto_29302 ) ) ( not ( = ?auto_29301 ?auto_29302 ) ) ( not ( = ?auto_29299 ?auto_29302 ) ) ( not ( = ?auto_29306 ?auto_29302 ) ) ( SURFACE-AT ?auto_29298 ?auto_29308 ) ( CLEAR ?auto_29298 ) ( IS-CRATE ?auto_29299 ) ( not ( = ?auto_29298 ?auto_29299 ) ) ( not ( = ?auto_29300 ?auto_29298 ) ) ( not ( = ?auto_29301 ?auto_29298 ) ) ( not ( = ?auto_29306 ?auto_29298 ) ) ( not ( = ?auto_29302 ?auto_29298 ) ) ( AVAILABLE ?auto_29303 ) ( IN ?auto_29299 ?auto_29307 ) ( TRUCK-AT ?auto_29307 ?auto_29304 ) ( not ( = ?auto_29304 ?auto_29308 ) ) ( not ( = ?auto_29309 ?auto_29304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29299 ?auto_29300 ?auto_29301 )
      ( MAKE-3CRATE-VERIFY ?auto_29298 ?auto_29299 ?auto_29300 ?auto_29301 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29310 - SURFACE
      ?auto_29311 - SURFACE
    )
    :vars
    (
      ?auto_29313 - HOIST
      ?auto_29319 - PLACE
      ?auto_29314 - SURFACE
      ?auto_29320 - PLACE
      ?auto_29316 - HOIST
      ?auto_29317 - SURFACE
      ?auto_29312 - SURFACE
      ?auto_29321 - SURFACE
      ?auto_29318 - TRUCK
      ?auto_29315 - PLACE
      ?auto_29322 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29313 ?auto_29319 ) ( IS-CRATE ?auto_29311 ) ( not ( = ?auto_29310 ?auto_29311 ) ) ( not ( = ?auto_29314 ?auto_29310 ) ) ( not ( = ?auto_29314 ?auto_29311 ) ) ( not ( = ?auto_29320 ?auto_29319 ) ) ( HOIST-AT ?auto_29316 ?auto_29320 ) ( not ( = ?auto_29313 ?auto_29316 ) ) ( SURFACE-AT ?auto_29311 ?auto_29320 ) ( ON ?auto_29311 ?auto_29317 ) ( CLEAR ?auto_29311 ) ( not ( = ?auto_29310 ?auto_29317 ) ) ( not ( = ?auto_29311 ?auto_29317 ) ) ( not ( = ?auto_29314 ?auto_29317 ) ) ( IS-CRATE ?auto_29310 ) ( AVAILABLE ?auto_29316 ) ( SURFACE-AT ?auto_29310 ?auto_29320 ) ( ON ?auto_29310 ?auto_29312 ) ( CLEAR ?auto_29310 ) ( not ( = ?auto_29310 ?auto_29312 ) ) ( not ( = ?auto_29311 ?auto_29312 ) ) ( not ( = ?auto_29314 ?auto_29312 ) ) ( not ( = ?auto_29317 ?auto_29312 ) ) ( SURFACE-AT ?auto_29321 ?auto_29319 ) ( CLEAR ?auto_29321 ) ( IS-CRATE ?auto_29314 ) ( not ( = ?auto_29321 ?auto_29314 ) ) ( not ( = ?auto_29310 ?auto_29321 ) ) ( not ( = ?auto_29311 ?auto_29321 ) ) ( not ( = ?auto_29317 ?auto_29321 ) ) ( not ( = ?auto_29312 ?auto_29321 ) ) ( AVAILABLE ?auto_29313 ) ( TRUCK-AT ?auto_29318 ?auto_29315 ) ( not ( = ?auto_29315 ?auto_29319 ) ) ( not ( = ?auto_29320 ?auto_29315 ) ) ( HOIST-AT ?auto_29322 ?auto_29315 ) ( LIFTING ?auto_29322 ?auto_29314 ) ( not ( = ?auto_29313 ?auto_29322 ) ) ( not ( = ?auto_29316 ?auto_29322 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29322 ?auto_29314 ?auto_29318 ?auto_29315 )
      ( MAKE-2CRATE ?auto_29314 ?auto_29310 ?auto_29311 )
      ( MAKE-1CRATE-VERIFY ?auto_29310 ?auto_29311 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29323 - SURFACE
      ?auto_29324 - SURFACE
      ?auto_29325 - SURFACE
    )
    :vars
    (
      ?auto_29327 - HOIST
      ?auto_29331 - PLACE
      ?auto_29335 - PLACE
      ?auto_29334 - HOIST
      ?auto_29328 - SURFACE
      ?auto_29330 - SURFACE
      ?auto_29333 - SURFACE
      ?auto_29329 - TRUCK
      ?auto_29332 - PLACE
      ?auto_29326 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29327 ?auto_29331 ) ( IS-CRATE ?auto_29325 ) ( not ( = ?auto_29324 ?auto_29325 ) ) ( not ( = ?auto_29323 ?auto_29324 ) ) ( not ( = ?auto_29323 ?auto_29325 ) ) ( not ( = ?auto_29335 ?auto_29331 ) ) ( HOIST-AT ?auto_29334 ?auto_29335 ) ( not ( = ?auto_29327 ?auto_29334 ) ) ( SURFACE-AT ?auto_29325 ?auto_29335 ) ( ON ?auto_29325 ?auto_29328 ) ( CLEAR ?auto_29325 ) ( not ( = ?auto_29324 ?auto_29328 ) ) ( not ( = ?auto_29325 ?auto_29328 ) ) ( not ( = ?auto_29323 ?auto_29328 ) ) ( IS-CRATE ?auto_29324 ) ( AVAILABLE ?auto_29334 ) ( SURFACE-AT ?auto_29324 ?auto_29335 ) ( ON ?auto_29324 ?auto_29330 ) ( CLEAR ?auto_29324 ) ( not ( = ?auto_29324 ?auto_29330 ) ) ( not ( = ?auto_29325 ?auto_29330 ) ) ( not ( = ?auto_29323 ?auto_29330 ) ) ( not ( = ?auto_29328 ?auto_29330 ) ) ( SURFACE-AT ?auto_29333 ?auto_29331 ) ( CLEAR ?auto_29333 ) ( IS-CRATE ?auto_29323 ) ( not ( = ?auto_29333 ?auto_29323 ) ) ( not ( = ?auto_29324 ?auto_29333 ) ) ( not ( = ?auto_29325 ?auto_29333 ) ) ( not ( = ?auto_29328 ?auto_29333 ) ) ( not ( = ?auto_29330 ?auto_29333 ) ) ( AVAILABLE ?auto_29327 ) ( TRUCK-AT ?auto_29329 ?auto_29332 ) ( not ( = ?auto_29332 ?auto_29331 ) ) ( not ( = ?auto_29335 ?auto_29332 ) ) ( HOIST-AT ?auto_29326 ?auto_29332 ) ( LIFTING ?auto_29326 ?auto_29323 ) ( not ( = ?auto_29327 ?auto_29326 ) ) ( not ( = ?auto_29334 ?auto_29326 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29324 ?auto_29325 )
      ( MAKE-2CRATE-VERIFY ?auto_29323 ?auto_29324 ?auto_29325 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29336 - SURFACE
      ?auto_29337 - SURFACE
      ?auto_29338 - SURFACE
      ?auto_29339 - SURFACE
    )
    :vars
    (
      ?auto_29347 - HOIST
      ?auto_29340 - PLACE
      ?auto_29346 - PLACE
      ?auto_29345 - HOIST
      ?auto_29344 - SURFACE
      ?auto_29342 - SURFACE
      ?auto_29348 - TRUCK
      ?auto_29343 - PLACE
      ?auto_29341 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29347 ?auto_29340 ) ( IS-CRATE ?auto_29339 ) ( not ( = ?auto_29338 ?auto_29339 ) ) ( not ( = ?auto_29337 ?auto_29338 ) ) ( not ( = ?auto_29337 ?auto_29339 ) ) ( not ( = ?auto_29346 ?auto_29340 ) ) ( HOIST-AT ?auto_29345 ?auto_29346 ) ( not ( = ?auto_29347 ?auto_29345 ) ) ( SURFACE-AT ?auto_29339 ?auto_29346 ) ( ON ?auto_29339 ?auto_29344 ) ( CLEAR ?auto_29339 ) ( not ( = ?auto_29338 ?auto_29344 ) ) ( not ( = ?auto_29339 ?auto_29344 ) ) ( not ( = ?auto_29337 ?auto_29344 ) ) ( IS-CRATE ?auto_29338 ) ( AVAILABLE ?auto_29345 ) ( SURFACE-AT ?auto_29338 ?auto_29346 ) ( ON ?auto_29338 ?auto_29342 ) ( CLEAR ?auto_29338 ) ( not ( = ?auto_29338 ?auto_29342 ) ) ( not ( = ?auto_29339 ?auto_29342 ) ) ( not ( = ?auto_29337 ?auto_29342 ) ) ( not ( = ?auto_29344 ?auto_29342 ) ) ( SURFACE-AT ?auto_29336 ?auto_29340 ) ( CLEAR ?auto_29336 ) ( IS-CRATE ?auto_29337 ) ( not ( = ?auto_29336 ?auto_29337 ) ) ( not ( = ?auto_29338 ?auto_29336 ) ) ( not ( = ?auto_29339 ?auto_29336 ) ) ( not ( = ?auto_29344 ?auto_29336 ) ) ( not ( = ?auto_29342 ?auto_29336 ) ) ( AVAILABLE ?auto_29347 ) ( TRUCK-AT ?auto_29348 ?auto_29343 ) ( not ( = ?auto_29343 ?auto_29340 ) ) ( not ( = ?auto_29346 ?auto_29343 ) ) ( HOIST-AT ?auto_29341 ?auto_29343 ) ( LIFTING ?auto_29341 ?auto_29337 ) ( not ( = ?auto_29347 ?auto_29341 ) ) ( not ( = ?auto_29345 ?auto_29341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29337 ?auto_29338 ?auto_29339 )
      ( MAKE-3CRATE-VERIFY ?auto_29336 ?auto_29337 ?auto_29338 ?auto_29339 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29349 - SURFACE
      ?auto_29350 - SURFACE
    )
    :vars
    (
      ?auto_29360 - HOIST
      ?auto_29351 - PLACE
      ?auto_29358 - SURFACE
      ?auto_29357 - PLACE
      ?auto_29356 - HOIST
      ?auto_29355 - SURFACE
      ?auto_29353 - SURFACE
      ?auto_29359 - SURFACE
      ?auto_29361 - TRUCK
      ?auto_29354 - PLACE
      ?auto_29352 - HOIST
      ?auto_29362 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29360 ?auto_29351 ) ( IS-CRATE ?auto_29350 ) ( not ( = ?auto_29349 ?auto_29350 ) ) ( not ( = ?auto_29358 ?auto_29349 ) ) ( not ( = ?auto_29358 ?auto_29350 ) ) ( not ( = ?auto_29357 ?auto_29351 ) ) ( HOIST-AT ?auto_29356 ?auto_29357 ) ( not ( = ?auto_29360 ?auto_29356 ) ) ( SURFACE-AT ?auto_29350 ?auto_29357 ) ( ON ?auto_29350 ?auto_29355 ) ( CLEAR ?auto_29350 ) ( not ( = ?auto_29349 ?auto_29355 ) ) ( not ( = ?auto_29350 ?auto_29355 ) ) ( not ( = ?auto_29358 ?auto_29355 ) ) ( IS-CRATE ?auto_29349 ) ( AVAILABLE ?auto_29356 ) ( SURFACE-AT ?auto_29349 ?auto_29357 ) ( ON ?auto_29349 ?auto_29353 ) ( CLEAR ?auto_29349 ) ( not ( = ?auto_29349 ?auto_29353 ) ) ( not ( = ?auto_29350 ?auto_29353 ) ) ( not ( = ?auto_29358 ?auto_29353 ) ) ( not ( = ?auto_29355 ?auto_29353 ) ) ( SURFACE-AT ?auto_29359 ?auto_29351 ) ( CLEAR ?auto_29359 ) ( IS-CRATE ?auto_29358 ) ( not ( = ?auto_29359 ?auto_29358 ) ) ( not ( = ?auto_29349 ?auto_29359 ) ) ( not ( = ?auto_29350 ?auto_29359 ) ) ( not ( = ?auto_29355 ?auto_29359 ) ) ( not ( = ?auto_29353 ?auto_29359 ) ) ( AVAILABLE ?auto_29360 ) ( TRUCK-AT ?auto_29361 ?auto_29354 ) ( not ( = ?auto_29354 ?auto_29351 ) ) ( not ( = ?auto_29357 ?auto_29354 ) ) ( HOIST-AT ?auto_29352 ?auto_29354 ) ( not ( = ?auto_29360 ?auto_29352 ) ) ( not ( = ?auto_29356 ?auto_29352 ) ) ( AVAILABLE ?auto_29352 ) ( SURFACE-AT ?auto_29358 ?auto_29354 ) ( ON ?auto_29358 ?auto_29362 ) ( CLEAR ?auto_29358 ) ( not ( = ?auto_29349 ?auto_29362 ) ) ( not ( = ?auto_29350 ?auto_29362 ) ) ( not ( = ?auto_29358 ?auto_29362 ) ) ( not ( = ?auto_29355 ?auto_29362 ) ) ( not ( = ?auto_29353 ?auto_29362 ) ) ( not ( = ?auto_29359 ?auto_29362 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29352 ?auto_29358 ?auto_29362 ?auto_29354 )
      ( MAKE-2CRATE ?auto_29358 ?auto_29349 ?auto_29350 )
      ( MAKE-1CRATE-VERIFY ?auto_29349 ?auto_29350 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29363 - SURFACE
      ?auto_29364 - SURFACE
      ?auto_29365 - SURFACE
    )
    :vars
    (
      ?auto_29373 - HOIST
      ?auto_29370 - PLACE
      ?auto_29366 - PLACE
      ?auto_29371 - HOIST
      ?auto_29374 - SURFACE
      ?auto_29369 - SURFACE
      ?auto_29372 - SURFACE
      ?auto_29368 - TRUCK
      ?auto_29376 - PLACE
      ?auto_29375 - HOIST
      ?auto_29367 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29373 ?auto_29370 ) ( IS-CRATE ?auto_29365 ) ( not ( = ?auto_29364 ?auto_29365 ) ) ( not ( = ?auto_29363 ?auto_29364 ) ) ( not ( = ?auto_29363 ?auto_29365 ) ) ( not ( = ?auto_29366 ?auto_29370 ) ) ( HOIST-AT ?auto_29371 ?auto_29366 ) ( not ( = ?auto_29373 ?auto_29371 ) ) ( SURFACE-AT ?auto_29365 ?auto_29366 ) ( ON ?auto_29365 ?auto_29374 ) ( CLEAR ?auto_29365 ) ( not ( = ?auto_29364 ?auto_29374 ) ) ( not ( = ?auto_29365 ?auto_29374 ) ) ( not ( = ?auto_29363 ?auto_29374 ) ) ( IS-CRATE ?auto_29364 ) ( AVAILABLE ?auto_29371 ) ( SURFACE-AT ?auto_29364 ?auto_29366 ) ( ON ?auto_29364 ?auto_29369 ) ( CLEAR ?auto_29364 ) ( not ( = ?auto_29364 ?auto_29369 ) ) ( not ( = ?auto_29365 ?auto_29369 ) ) ( not ( = ?auto_29363 ?auto_29369 ) ) ( not ( = ?auto_29374 ?auto_29369 ) ) ( SURFACE-AT ?auto_29372 ?auto_29370 ) ( CLEAR ?auto_29372 ) ( IS-CRATE ?auto_29363 ) ( not ( = ?auto_29372 ?auto_29363 ) ) ( not ( = ?auto_29364 ?auto_29372 ) ) ( not ( = ?auto_29365 ?auto_29372 ) ) ( not ( = ?auto_29374 ?auto_29372 ) ) ( not ( = ?auto_29369 ?auto_29372 ) ) ( AVAILABLE ?auto_29373 ) ( TRUCK-AT ?auto_29368 ?auto_29376 ) ( not ( = ?auto_29376 ?auto_29370 ) ) ( not ( = ?auto_29366 ?auto_29376 ) ) ( HOIST-AT ?auto_29375 ?auto_29376 ) ( not ( = ?auto_29373 ?auto_29375 ) ) ( not ( = ?auto_29371 ?auto_29375 ) ) ( AVAILABLE ?auto_29375 ) ( SURFACE-AT ?auto_29363 ?auto_29376 ) ( ON ?auto_29363 ?auto_29367 ) ( CLEAR ?auto_29363 ) ( not ( = ?auto_29364 ?auto_29367 ) ) ( not ( = ?auto_29365 ?auto_29367 ) ) ( not ( = ?auto_29363 ?auto_29367 ) ) ( not ( = ?auto_29374 ?auto_29367 ) ) ( not ( = ?auto_29369 ?auto_29367 ) ) ( not ( = ?auto_29372 ?auto_29367 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29364 ?auto_29365 )
      ( MAKE-2CRATE-VERIFY ?auto_29363 ?auto_29364 ?auto_29365 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29377 - SURFACE
      ?auto_29378 - SURFACE
      ?auto_29379 - SURFACE
      ?auto_29380 - SURFACE
    )
    :vars
    (
      ?auto_29387 - HOIST
      ?auto_29384 - PLACE
      ?auto_29390 - PLACE
      ?auto_29383 - HOIST
      ?auto_29386 - SURFACE
      ?auto_29381 - SURFACE
      ?auto_29385 - TRUCK
      ?auto_29382 - PLACE
      ?auto_29388 - HOIST
      ?auto_29389 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29387 ?auto_29384 ) ( IS-CRATE ?auto_29380 ) ( not ( = ?auto_29379 ?auto_29380 ) ) ( not ( = ?auto_29378 ?auto_29379 ) ) ( not ( = ?auto_29378 ?auto_29380 ) ) ( not ( = ?auto_29390 ?auto_29384 ) ) ( HOIST-AT ?auto_29383 ?auto_29390 ) ( not ( = ?auto_29387 ?auto_29383 ) ) ( SURFACE-AT ?auto_29380 ?auto_29390 ) ( ON ?auto_29380 ?auto_29386 ) ( CLEAR ?auto_29380 ) ( not ( = ?auto_29379 ?auto_29386 ) ) ( not ( = ?auto_29380 ?auto_29386 ) ) ( not ( = ?auto_29378 ?auto_29386 ) ) ( IS-CRATE ?auto_29379 ) ( AVAILABLE ?auto_29383 ) ( SURFACE-AT ?auto_29379 ?auto_29390 ) ( ON ?auto_29379 ?auto_29381 ) ( CLEAR ?auto_29379 ) ( not ( = ?auto_29379 ?auto_29381 ) ) ( not ( = ?auto_29380 ?auto_29381 ) ) ( not ( = ?auto_29378 ?auto_29381 ) ) ( not ( = ?auto_29386 ?auto_29381 ) ) ( SURFACE-AT ?auto_29377 ?auto_29384 ) ( CLEAR ?auto_29377 ) ( IS-CRATE ?auto_29378 ) ( not ( = ?auto_29377 ?auto_29378 ) ) ( not ( = ?auto_29379 ?auto_29377 ) ) ( not ( = ?auto_29380 ?auto_29377 ) ) ( not ( = ?auto_29386 ?auto_29377 ) ) ( not ( = ?auto_29381 ?auto_29377 ) ) ( AVAILABLE ?auto_29387 ) ( TRUCK-AT ?auto_29385 ?auto_29382 ) ( not ( = ?auto_29382 ?auto_29384 ) ) ( not ( = ?auto_29390 ?auto_29382 ) ) ( HOIST-AT ?auto_29388 ?auto_29382 ) ( not ( = ?auto_29387 ?auto_29388 ) ) ( not ( = ?auto_29383 ?auto_29388 ) ) ( AVAILABLE ?auto_29388 ) ( SURFACE-AT ?auto_29378 ?auto_29382 ) ( ON ?auto_29378 ?auto_29389 ) ( CLEAR ?auto_29378 ) ( not ( = ?auto_29379 ?auto_29389 ) ) ( not ( = ?auto_29380 ?auto_29389 ) ) ( not ( = ?auto_29378 ?auto_29389 ) ) ( not ( = ?auto_29386 ?auto_29389 ) ) ( not ( = ?auto_29381 ?auto_29389 ) ) ( not ( = ?auto_29377 ?auto_29389 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29378 ?auto_29379 ?auto_29380 )
      ( MAKE-3CRATE-VERIFY ?auto_29377 ?auto_29378 ?auto_29379 ?auto_29380 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29391 - SURFACE
      ?auto_29392 - SURFACE
    )
    :vars
    (
      ?auto_29400 - HOIST
      ?auto_29397 - PLACE
      ?auto_29402 - SURFACE
      ?auto_29404 - PLACE
      ?auto_29396 - HOIST
      ?auto_29399 - SURFACE
      ?auto_29393 - SURFACE
      ?auto_29395 - SURFACE
      ?auto_29394 - PLACE
      ?auto_29401 - HOIST
      ?auto_29403 - SURFACE
      ?auto_29398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29400 ?auto_29397 ) ( IS-CRATE ?auto_29392 ) ( not ( = ?auto_29391 ?auto_29392 ) ) ( not ( = ?auto_29402 ?auto_29391 ) ) ( not ( = ?auto_29402 ?auto_29392 ) ) ( not ( = ?auto_29404 ?auto_29397 ) ) ( HOIST-AT ?auto_29396 ?auto_29404 ) ( not ( = ?auto_29400 ?auto_29396 ) ) ( SURFACE-AT ?auto_29392 ?auto_29404 ) ( ON ?auto_29392 ?auto_29399 ) ( CLEAR ?auto_29392 ) ( not ( = ?auto_29391 ?auto_29399 ) ) ( not ( = ?auto_29392 ?auto_29399 ) ) ( not ( = ?auto_29402 ?auto_29399 ) ) ( IS-CRATE ?auto_29391 ) ( AVAILABLE ?auto_29396 ) ( SURFACE-AT ?auto_29391 ?auto_29404 ) ( ON ?auto_29391 ?auto_29393 ) ( CLEAR ?auto_29391 ) ( not ( = ?auto_29391 ?auto_29393 ) ) ( not ( = ?auto_29392 ?auto_29393 ) ) ( not ( = ?auto_29402 ?auto_29393 ) ) ( not ( = ?auto_29399 ?auto_29393 ) ) ( SURFACE-AT ?auto_29395 ?auto_29397 ) ( CLEAR ?auto_29395 ) ( IS-CRATE ?auto_29402 ) ( not ( = ?auto_29395 ?auto_29402 ) ) ( not ( = ?auto_29391 ?auto_29395 ) ) ( not ( = ?auto_29392 ?auto_29395 ) ) ( not ( = ?auto_29399 ?auto_29395 ) ) ( not ( = ?auto_29393 ?auto_29395 ) ) ( AVAILABLE ?auto_29400 ) ( not ( = ?auto_29394 ?auto_29397 ) ) ( not ( = ?auto_29404 ?auto_29394 ) ) ( HOIST-AT ?auto_29401 ?auto_29394 ) ( not ( = ?auto_29400 ?auto_29401 ) ) ( not ( = ?auto_29396 ?auto_29401 ) ) ( AVAILABLE ?auto_29401 ) ( SURFACE-AT ?auto_29402 ?auto_29394 ) ( ON ?auto_29402 ?auto_29403 ) ( CLEAR ?auto_29402 ) ( not ( = ?auto_29391 ?auto_29403 ) ) ( not ( = ?auto_29392 ?auto_29403 ) ) ( not ( = ?auto_29402 ?auto_29403 ) ) ( not ( = ?auto_29399 ?auto_29403 ) ) ( not ( = ?auto_29393 ?auto_29403 ) ) ( not ( = ?auto_29395 ?auto_29403 ) ) ( TRUCK-AT ?auto_29398 ?auto_29397 ) )
    :subtasks
    ( ( !DRIVE ?auto_29398 ?auto_29397 ?auto_29394 )
      ( MAKE-2CRATE ?auto_29402 ?auto_29391 ?auto_29392 )
      ( MAKE-1CRATE-VERIFY ?auto_29391 ?auto_29392 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29405 - SURFACE
      ?auto_29406 - SURFACE
      ?auto_29407 - SURFACE
    )
    :vars
    (
      ?auto_29412 - HOIST
      ?auto_29418 - PLACE
      ?auto_29414 - PLACE
      ?auto_29410 - HOIST
      ?auto_29409 - SURFACE
      ?auto_29415 - SURFACE
      ?auto_29413 - SURFACE
      ?auto_29417 - PLACE
      ?auto_29411 - HOIST
      ?auto_29408 - SURFACE
      ?auto_29416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29412 ?auto_29418 ) ( IS-CRATE ?auto_29407 ) ( not ( = ?auto_29406 ?auto_29407 ) ) ( not ( = ?auto_29405 ?auto_29406 ) ) ( not ( = ?auto_29405 ?auto_29407 ) ) ( not ( = ?auto_29414 ?auto_29418 ) ) ( HOIST-AT ?auto_29410 ?auto_29414 ) ( not ( = ?auto_29412 ?auto_29410 ) ) ( SURFACE-AT ?auto_29407 ?auto_29414 ) ( ON ?auto_29407 ?auto_29409 ) ( CLEAR ?auto_29407 ) ( not ( = ?auto_29406 ?auto_29409 ) ) ( not ( = ?auto_29407 ?auto_29409 ) ) ( not ( = ?auto_29405 ?auto_29409 ) ) ( IS-CRATE ?auto_29406 ) ( AVAILABLE ?auto_29410 ) ( SURFACE-AT ?auto_29406 ?auto_29414 ) ( ON ?auto_29406 ?auto_29415 ) ( CLEAR ?auto_29406 ) ( not ( = ?auto_29406 ?auto_29415 ) ) ( not ( = ?auto_29407 ?auto_29415 ) ) ( not ( = ?auto_29405 ?auto_29415 ) ) ( not ( = ?auto_29409 ?auto_29415 ) ) ( SURFACE-AT ?auto_29413 ?auto_29418 ) ( CLEAR ?auto_29413 ) ( IS-CRATE ?auto_29405 ) ( not ( = ?auto_29413 ?auto_29405 ) ) ( not ( = ?auto_29406 ?auto_29413 ) ) ( not ( = ?auto_29407 ?auto_29413 ) ) ( not ( = ?auto_29409 ?auto_29413 ) ) ( not ( = ?auto_29415 ?auto_29413 ) ) ( AVAILABLE ?auto_29412 ) ( not ( = ?auto_29417 ?auto_29418 ) ) ( not ( = ?auto_29414 ?auto_29417 ) ) ( HOIST-AT ?auto_29411 ?auto_29417 ) ( not ( = ?auto_29412 ?auto_29411 ) ) ( not ( = ?auto_29410 ?auto_29411 ) ) ( AVAILABLE ?auto_29411 ) ( SURFACE-AT ?auto_29405 ?auto_29417 ) ( ON ?auto_29405 ?auto_29408 ) ( CLEAR ?auto_29405 ) ( not ( = ?auto_29406 ?auto_29408 ) ) ( not ( = ?auto_29407 ?auto_29408 ) ) ( not ( = ?auto_29405 ?auto_29408 ) ) ( not ( = ?auto_29409 ?auto_29408 ) ) ( not ( = ?auto_29415 ?auto_29408 ) ) ( not ( = ?auto_29413 ?auto_29408 ) ) ( TRUCK-AT ?auto_29416 ?auto_29418 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29406 ?auto_29407 )
      ( MAKE-2CRATE-VERIFY ?auto_29405 ?auto_29406 ?auto_29407 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29419 - SURFACE
      ?auto_29420 - SURFACE
      ?auto_29421 - SURFACE
      ?auto_29422 - SURFACE
    )
    :vars
    (
      ?auto_29428 - HOIST
      ?auto_29423 - PLACE
      ?auto_29429 - PLACE
      ?auto_29432 - HOIST
      ?auto_29424 - SURFACE
      ?auto_29425 - SURFACE
      ?auto_29431 - PLACE
      ?auto_29430 - HOIST
      ?auto_29426 - SURFACE
      ?auto_29427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29428 ?auto_29423 ) ( IS-CRATE ?auto_29422 ) ( not ( = ?auto_29421 ?auto_29422 ) ) ( not ( = ?auto_29420 ?auto_29421 ) ) ( not ( = ?auto_29420 ?auto_29422 ) ) ( not ( = ?auto_29429 ?auto_29423 ) ) ( HOIST-AT ?auto_29432 ?auto_29429 ) ( not ( = ?auto_29428 ?auto_29432 ) ) ( SURFACE-AT ?auto_29422 ?auto_29429 ) ( ON ?auto_29422 ?auto_29424 ) ( CLEAR ?auto_29422 ) ( not ( = ?auto_29421 ?auto_29424 ) ) ( not ( = ?auto_29422 ?auto_29424 ) ) ( not ( = ?auto_29420 ?auto_29424 ) ) ( IS-CRATE ?auto_29421 ) ( AVAILABLE ?auto_29432 ) ( SURFACE-AT ?auto_29421 ?auto_29429 ) ( ON ?auto_29421 ?auto_29425 ) ( CLEAR ?auto_29421 ) ( not ( = ?auto_29421 ?auto_29425 ) ) ( not ( = ?auto_29422 ?auto_29425 ) ) ( not ( = ?auto_29420 ?auto_29425 ) ) ( not ( = ?auto_29424 ?auto_29425 ) ) ( SURFACE-AT ?auto_29419 ?auto_29423 ) ( CLEAR ?auto_29419 ) ( IS-CRATE ?auto_29420 ) ( not ( = ?auto_29419 ?auto_29420 ) ) ( not ( = ?auto_29421 ?auto_29419 ) ) ( not ( = ?auto_29422 ?auto_29419 ) ) ( not ( = ?auto_29424 ?auto_29419 ) ) ( not ( = ?auto_29425 ?auto_29419 ) ) ( AVAILABLE ?auto_29428 ) ( not ( = ?auto_29431 ?auto_29423 ) ) ( not ( = ?auto_29429 ?auto_29431 ) ) ( HOIST-AT ?auto_29430 ?auto_29431 ) ( not ( = ?auto_29428 ?auto_29430 ) ) ( not ( = ?auto_29432 ?auto_29430 ) ) ( AVAILABLE ?auto_29430 ) ( SURFACE-AT ?auto_29420 ?auto_29431 ) ( ON ?auto_29420 ?auto_29426 ) ( CLEAR ?auto_29420 ) ( not ( = ?auto_29421 ?auto_29426 ) ) ( not ( = ?auto_29422 ?auto_29426 ) ) ( not ( = ?auto_29420 ?auto_29426 ) ) ( not ( = ?auto_29424 ?auto_29426 ) ) ( not ( = ?auto_29425 ?auto_29426 ) ) ( not ( = ?auto_29419 ?auto_29426 ) ) ( TRUCK-AT ?auto_29427 ?auto_29423 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29420 ?auto_29421 ?auto_29422 )
      ( MAKE-3CRATE-VERIFY ?auto_29419 ?auto_29420 ?auto_29421 ?auto_29422 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29447 - SURFACE
      ?auto_29448 - SURFACE
    )
    :vars
    (
      ?auto_29449 - HOIST
      ?auto_29450 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29449 ?auto_29450 ) ( SURFACE-AT ?auto_29447 ?auto_29450 ) ( CLEAR ?auto_29447 ) ( LIFTING ?auto_29449 ?auto_29448 ) ( IS-CRATE ?auto_29448 ) ( not ( = ?auto_29447 ?auto_29448 ) ) )
    :subtasks
    ( ( !DROP ?auto_29449 ?auto_29448 ?auto_29447 ?auto_29450 )
      ( MAKE-1CRATE-VERIFY ?auto_29447 ?auto_29448 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29451 - SURFACE
      ?auto_29452 - SURFACE
      ?auto_29453 - SURFACE
    )
    :vars
    (
      ?auto_29455 - HOIST
      ?auto_29454 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29455 ?auto_29454 ) ( SURFACE-AT ?auto_29452 ?auto_29454 ) ( CLEAR ?auto_29452 ) ( LIFTING ?auto_29455 ?auto_29453 ) ( IS-CRATE ?auto_29453 ) ( not ( = ?auto_29452 ?auto_29453 ) ) ( ON ?auto_29452 ?auto_29451 ) ( not ( = ?auto_29451 ?auto_29452 ) ) ( not ( = ?auto_29451 ?auto_29453 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29452 ?auto_29453 )
      ( MAKE-2CRATE-VERIFY ?auto_29451 ?auto_29452 ?auto_29453 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29456 - SURFACE
      ?auto_29457 - SURFACE
      ?auto_29458 - SURFACE
      ?auto_29459 - SURFACE
    )
    :vars
    (
      ?auto_29461 - HOIST
      ?auto_29460 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29461 ?auto_29460 ) ( SURFACE-AT ?auto_29458 ?auto_29460 ) ( CLEAR ?auto_29458 ) ( LIFTING ?auto_29461 ?auto_29459 ) ( IS-CRATE ?auto_29459 ) ( not ( = ?auto_29458 ?auto_29459 ) ) ( ON ?auto_29457 ?auto_29456 ) ( ON ?auto_29458 ?auto_29457 ) ( not ( = ?auto_29456 ?auto_29457 ) ) ( not ( = ?auto_29456 ?auto_29458 ) ) ( not ( = ?auto_29456 ?auto_29459 ) ) ( not ( = ?auto_29457 ?auto_29458 ) ) ( not ( = ?auto_29457 ?auto_29459 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29458 ?auto_29459 )
      ( MAKE-3CRATE-VERIFY ?auto_29456 ?auto_29457 ?auto_29458 ?auto_29459 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29462 - SURFACE
      ?auto_29463 - SURFACE
      ?auto_29464 - SURFACE
      ?auto_29465 - SURFACE
      ?auto_29466 - SURFACE
    )
    :vars
    (
      ?auto_29468 - HOIST
      ?auto_29467 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29468 ?auto_29467 ) ( SURFACE-AT ?auto_29465 ?auto_29467 ) ( CLEAR ?auto_29465 ) ( LIFTING ?auto_29468 ?auto_29466 ) ( IS-CRATE ?auto_29466 ) ( not ( = ?auto_29465 ?auto_29466 ) ) ( ON ?auto_29463 ?auto_29462 ) ( ON ?auto_29464 ?auto_29463 ) ( ON ?auto_29465 ?auto_29464 ) ( not ( = ?auto_29462 ?auto_29463 ) ) ( not ( = ?auto_29462 ?auto_29464 ) ) ( not ( = ?auto_29462 ?auto_29465 ) ) ( not ( = ?auto_29462 ?auto_29466 ) ) ( not ( = ?auto_29463 ?auto_29464 ) ) ( not ( = ?auto_29463 ?auto_29465 ) ) ( not ( = ?auto_29463 ?auto_29466 ) ) ( not ( = ?auto_29464 ?auto_29465 ) ) ( not ( = ?auto_29464 ?auto_29466 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29465 ?auto_29466 )
      ( MAKE-4CRATE-VERIFY ?auto_29462 ?auto_29463 ?auto_29464 ?auto_29465 ?auto_29466 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29469 - SURFACE
      ?auto_29470 - SURFACE
    )
    :vars
    (
      ?auto_29472 - HOIST
      ?auto_29471 - PLACE
      ?auto_29473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29472 ?auto_29471 ) ( SURFACE-AT ?auto_29469 ?auto_29471 ) ( CLEAR ?auto_29469 ) ( IS-CRATE ?auto_29470 ) ( not ( = ?auto_29469 ?auto_29470 ) ) ( TRUCK-AT ?auto_29473 ?auto_29471 ) ( AVAILABLE ?auto_29472 ) ( IN ?auto_29470 ?auto_29473 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29472 ?auto_29470 ?auto_29473 ?auto_29471 )
      ( MAKE-1CRATE ?auto_29469 ?auto_29470 )
      ( MAKE-1CRATE-VERIFY ?auto_29469 ?auto_29470 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29474 - SURFACE
      ?auto_29475 - SURFACE
      ?auto_29476 - SURFACE
    )
    :vars
    (
      ?auto_29477 - HOIST
      ?auto_29479 - PLACE
      ?auto_29478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29477 ?auto_29479 ) ( SURFACE-AT ?auto_29475 ?auto_29479 ) ( CLEAR ?auto_29475 ) ( IS-CRATE ?auto_29476 ) ( not ( = ?auto_29475 ?auto_29476 ) ) ( TRUCK-AT ?auto_29478 ?auto_29479 ) ( AVAILABLE ?auto_29477 ) ( IN ?auto_29476 ?auto_29478 ) ( ON ?auto_29475 ?auto_29474 ) ( not ( = ?auto_29474 ?auto_29475 ) ) ( not ( = ?auto_29474 ?auto_29476 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29475 ?auto_29476 )
      ( MAKE-2CRATE-VERIFY ?auto_29474 ?auto_29475 ?auto_29476 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29480 - SURFACE
      ?auto_29481 - SURFACE
      ?auto_29482 - SURFACE
      ?auto_29483 - SURFACE
    )
    :vars
    (
      ?auto_29486 - HOIST
      ?auto_29485 - PLACE
      ?auto_29484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29486 ?auto_29485 ) ( SURFACE-AT ?auto_29482 ?auto_29485 ) ( CLEAR ?auto_29482 ) ( IS-CRATE ?auto_29483 ) ( not ( = ?auto_29482 ?auto_29483 ) ) ( TRUCK-AT ?auto_29484 ?auto_29485 ) ( AVAILABLE ?auto_29486 ) ( IN ?auto_29483 ?auto_29484 ) ( ON ?auto_29482 ?auto_29481 ) ( not ( = ?auto_29481 ?auto_29482 ) ) ( not ( = ?auto_29481 ?auto_29483 ) ) ( ON ?auto_29481 ?auto_29480 ) ( not ( = ?auto_29480 ?auto_29481 ) ) ( not ( = ?auto_29480 ?auto_29482 ) ) ( not ( = ?auto_29480 ?auto_29483 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29481 ?auto_29482 ?auto_29483 )
      ( MAKE-3CRATE-VERIFY ?auto_29480 ?auto_29481 ?auto_29482 ?auto_29483 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29487 - SURFACE
      ?auto_29488 - SURFACE
      ?auto_29489 - SURFACE
      ?auto_29490 - SURFACE
      ?auto_29491 - SURFACE
    )
    :vars
    (
      ?auto_29494 - HOIST
      ?auto_29493 - PLACE
      ?auto_29492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29494 ?auto_29493 ) ( SURFACE-AT ?auto_29490 ?auto_29493 ) ( CLEAR ?auto_29490 ) ( IS-CRATE ?auto_29491 ) ( not ( = ?auto_29490 ?auto_29491 ) ) ( TRUCK-AT ?auto_29492 ?auto_29493 ) ( AVAILABLE ?auto_29494 ) ( IN ?auto_29491 ?auto_29492 ) ( ON ?auto_29490 ?auto_29489 ) ( not ( = ?auto_29489 ?auto_29490 ) ) ( not ( = ?auto_29489 ?auto_29491 ) ) ( ON ?auto_29488 ?auto_29487 ) ( ON ?auto_29489 ?auto_29488 ) ( not ( = ?auto_29487 ?auto_29488 ) ) ( not ( = ?auto_29487 ?auto_29489 ) ) ( not ( = ?auto_29487 ?auto_29490 ) ) ( not ( = ?auto_29487 ?auto_29491 ) ) ( not ( = ?auto_29488 ?auto_29489 ) ) ( not ( = ?auto_29488 ?auto_29490 ) ) ( not ( = ?auto_29488 ?auto_29491 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29489 ?auto_29490 ?auto_29491 )
      ( MAKE-4CRATE-VERIFY ?auto_29487 ?auto_29488 ?auto_29489 ?auto_29490 ?auto_29491 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29495 - SURFACE
      ?auto_29496 - SURFACE
    )
    :vars
    (
      ?auto_29499 - HOIST
      ?auto_29498 - PLACE
      ?auto_29497 - TRUCK
      ?auto_29500 - SURFACE
      ?auto_29501 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29499 ?auto_29498 ) ( SURFACE-AT ?auto_29495 ?auto_29498 ) ( CLEAR ?auto_29495 ) ( IS-CRATE ?auto_29496 ) ( not ( = ?auto_29495 ?auto_29496 ) ) ( AVAILABLE ?auto_29499 ) ( IN ?auto_29496 ?auto_29497 ) ( ON ?auto_29495 ?auto_29500 ) ( not ( = ?auto_29500 ?auto_29495 ) ) ( not ( = ?auto_29500 ?auto_29496 ) ) ( TRUCK-AT ?auto_29497 ?auto_29501 ) ( not ( = ?auto_29501 ?auto_29498 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29497 ?auto_29501 ?auto_29498 )
      ( MAKE-2CRATE ?auto_29500 ?auto_29495 ?auto_29496 )
      ( MAKE-1CRATE-VERIFY ?auto_29495 ?auto_29496 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29502 - SURFACE
      ?auto_29503 - SURFACE
      ?auto_29504 - SURFACE
    )
    :vars
    (
      ?auto_29508 - HOIST
      ?auto_29507 - PLACE
      ?auto_29505 - TRUCK
      ?auto_29506 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29508 ?auto_29507 ) ( SURFACE-AT ?auto_29503 ?auto_29507 ) ( CLEAR ?auto_29503 ) ( IS-CRATE ?auto_29504 ) ( not ( = ?auto_29503 ?auto_29504 ) ) ( AVAILABLE ?auto_29508 ) ( IN ?auto_29504 ?auto_29505 ) ( ON ?auto_29503 ?auto_29502 ) ( not ( = ?auto_29502 ?auto_29503 ) ) ( not ( = ?auto_29502 ?auto_29504 ) ) ( TRUCK-AT ?auto_29505 ?auto_29506 ) ( not ( = ?auto_29506 ?auto_29507 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29503 ?auto_29504 )
      ( MAKE-2CRATE-VERIFY ?auto_29502 ?auto_29503 ?auto_29504 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29509 - SURFACE
      ?auto_29510 - SURFACE
      ?auto_29511 - SURFACE
      ?auto_29512 - SURFACE
    )
    :vars
    (
      ?auto_29515 - HOIST
      ?auto_29514 - PLACE
      ?auto_29516 - TRUCK
      ?auto_29513 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29515 ?auto_29514 ) ( SURFACE-AT ?auto_29511 ?auto_29514 ) ( CLEAR ?auto_29511 ) ( IS-CRATE ?auto_29512 ) ( not ( = ?auto_29511 ?auto_29512 ) ) ( AVAILABLE ?auto_29515 ) ( IN ?auto_29512 ?auto_29516 ) ( ON ?auto_29511 ?auto_29510 ) ( not ( = ?auto_29510 ?auto_29511 ) ) ( not ( = ?auto_29510 ?auto_29512 ) ) ( TRUCK-AT ?auto_29516 ?auto_29513 ) ( not ( = ?auto_29513 ?auto_29514 ) ) ( ON ?auto_29510 ?auto_29509 ) ( not ( = ?auto_29509 ?auto_29510 ) ) ( not ( = ?auto_29509 ?auto_29511 ) ) ( not ( = ?auto_29509 ?auto_29512 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29510 ?auto_29511 ?auto_29512 )
      ( MAKE-3CRATE-VERIFY ?auto_29509 ?auto_29510 ?auto_29511 ?auto_29512 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29517 - SURFACE
      ?auto_29518 - SURFACE
      ?auto_29519 - SURFACE
      ?auto_29520 - SURFACE
      ?auto_29521 - SURFACE
    )
    :vars
    (
      ?auto_29524 - HOIST
      ?auto_29523 - PLACE
      ?auto_29525 - TRUCK
      ?auto_29522 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29524 ?auto_29523 ) ( SURFACE-AT ?auto_29520 ?auto_29523 ) ( CLEAR ?auto_29520 ) ( IS-CRATE ?auto_29521 ) ( not ( = ?auto_29520 ?auto_29521 ) ) ( AVAILABLE ?auto_29524 ) ( IN ?auto_29521 ?auto_29525 ) ( ON ?auto_29520 ?auto_29519 ) ( not ( = ?auto_29519 ?auto_29520 ) ) ( not ( = ?auto_29519 ?auto_29521 ) ) ( TRUCK-AT ?auto_29525 ?auto_29522 ) ( not ( = ?auto_29522 ?auto_29523 ) ) ( ON ?auto_29518 ?auto_29517 ) ( ON ?auto_29519 ?auto_29518 ) ( not ( = ?auto_29517 ?auto_29518 ) ) ( not ( = ?auto_29517 ?auto_29519 ) ) ( not ( = ?auto_29517 ?auto_29520 ) ) ( not ( = ?auto_29517 ?auto_29521 ) ) ( not ( = ?auto_29518 ?auto_29519 ) ) ( not ( = ?auto_29518 ?auto_29520 ) ) ( not ( = ?auto_29518 ?auto_29521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29519 ?auto_29520 ?auto_29521 )
      ( MAKE-4CRATE-VERIFY ?auto_29517 ?auto_29518 ?auto_29519 ?auto_29520 ?auto_29521 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29526 - SURFACE
      ?auto_29527 - SURFACE
    )
    :vars
    (
      ?auto_29531 - HOIST
      ?auto_29530 - PLACE
      ?auto_29528 - SURFACE
      ?auto_29532 - TRUCK
      ?auto_29529 - PLACE
      ?auto_29533 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29531 ?auto_29530 ) ( SURFACE-AT ?auto_29526 ?auto_29530 ) ( CLEAR ?auto_29526 ) ( IS-CRATE ?auto_29527 ) ( not ( = ?auto_29526 ?auto_29527 ) ) ( AVAILABLE ?auto_29531 ) ( ON ?auto_29526 ?auto_29528 ) ( not ( = ?auto_29528 ?auto_29526 ) ) ( not ( = ?auto_29528 ?auto_29527 ) ) ( TRUCK-AT ?auto_29532 ?auto_29529 ) ( not ( = ?auto_29529 ?auto_29530 ) ) ( HOIST-AT ?auto_29533 ?auto_29529 ) ( LIFTING ?auto_29533 ?auto_29527 ) ( not ( = ?auto_29531 ?auto_29533 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29533 ?auto_29527 ?auto_29532 ?auto_29529 )
      ( MAKE-2CRATE ?auto_29528 ?auto_29526 ?auto_29527 )
      ( MAKE-1CRATE-VERIFY ?auto_29526 ?auto_29527 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29534 - SURFACE
      ?auto_29535 - SURFACE
      ?auto_29536 - SURFACE
    )
    :vars
    (
      ?auto_29537 - HOIST
      ?auto_29538 - PLACE
      ?auto_29539 - TRUCK
      ?auto_29541 - PLACE
      ?auto_29540 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29537 ?auto_29538 ) ( SURFACE-AT ?auto_29535 ?auto_29538 ) ( CLEAR ?auto_29535 ) ( IS-CRATE ?auto_29536 ) ( not ( = ?auto_29535 ?auto_29536 ) ) ( AVAILABLE ?auto_29537 ) ( ON ?auto_29535 ?auto_29534 ) ( not ( = ?auto_29534 ?auto_29535 ) ) ( not ( = ?auto_29534 ?auto_29536 ) ) ( TRUCK-AT ?auto_29539 ?auto_29541 ) ( not ( = ?auto_29541 ?auto_29538 ) ) ( HOIST-AT ?auto_29540 ?auto_29541 ) ( LIFTING ?auto_29540 ?auto_29536 ) ( not ( = ?auto_29537 ?auto_29540 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29535 ?auto_29536 )
      ( MAKE-2CRATE-VERIFY ?auto_29534 ?auto_29535 ?auto_29536 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29542 - SURFACE
      ?auto_29543 - SURFACE
      ?auto_29544 - SURFACE
      ?auto_29545 - SURFACE
    )
    :vars
    (
      ?auto_29549 - HOIST
      ?auto_29550 - PLACE
      ?auto_29548 - TRUCK
      ?auto_29546 - PLACE
      ?auto_29547 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29549 ?auto_29550 ) ( SURFACE-AT ?auto_29544 ?auto_29550 ) ( CLEAR ?auto_29544 ) ( IS-CRATE ?auto_29545 ) ( not ( = ?auto_29544 ?auto_29545 ) ) ( AVAILABLE ?auto_29549 ) ( ON ?auto_29544 ?auto_29543 ) ( not ( = ?auto_29543 ?auto_29544 ) ) ( not ( = ?auto_29543 ?auto_29545 ) ) ( TRUCK-AT ?auto_29548 ?auto_29546 ) ( not ( = ?auto_29546 ?auto_29550 ) ) ( HOIST-AT ?auto_29547 ?auto_29546 ) ( LIFTING ?auto_29547 ?auto_29545 ) ( not ( = ?auto_29549 ?auto_29547 ) ) ( ON ?auto_29543 ?auto_29542 ) ( not ( = ?auto_29542 ?auto_29543 ) ) ( not ( = ?auto_29542 ?auto_29544 ) ) ( not ( = ?auto_29542 ?auto_29545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29543 ?auto_29544 ?auto_29545 )
      ( MAKE-3CRATE-VERIFY ?auto_29542 ?auto_29543 ?auto_29544 ?auto_29545 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29551 - SURFACE
      ?auto_29552 - SURFACE
      ?auto_29553 - SURFACE
      ?auto_29554 - SURFACE
      ?auto_29555 - SURFACE
    )
    :vars
    (
      ?auto_29559 - HOIST
      ?auto_29560 - PLACE
      ?auto_29558 - TRUCK
      ?auto_29556 - PLACE
      ?auto_29557 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29559 ?auto_29560 ) ( SURFACE-AT ?auto_29554 ?auto_29560 ) ( CLEAR ?auto_29554 ) ( IS-CRATE ?auto_29555 ) ( not ( = ?auto_29554 ?auto_29555 ) ) ( AVAILABLE ?auto_29559 ) ( ON ?auto_29554 ?auto_29553 ) ( not ( = ?auto_29553 ?auto_29554 ) ) ( not ( = ?auto_29553 ?auto_29555 ) ) ( TRUCK-AT ?auto_29558 ?auto_29556 ) ( not ( = ?auto_29556 ?auto_29560 ) ) ( HOIST-AT ?auto_29557 ?auto_29556 ) ( LIFTING ?auto_29557 ?auto_29555 ) ( not ( = ?auto_29559 ?auto_29557 ) ) ( ON ?auto_29552 ?auto_29551 ) ( ON ?auto_29553 ?auto_29552 ) ( not ( = ?auto_29551 ?auto_29552 ) ) ( not ( = ?auto_29551 ?auto_29553 ) ) ( not ( = ?auto_29551 ?auto_29554 ) ) ( not ( = ?auto_29551 ?auto_29555 ) ) ( not ( = ?auto_29552 ?auto_29553 ) ) ( not ( = ?auto_29552 ?auto_29554 ) ) ( not ( = ?auto_29552 ?auto_29555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29553 ?auto_29554 ?auto_29555 )
      ( MAKE-4CRATE-VERIFY ?auto_29551 ?auto_29552 ?auto_29553 ?auto_29554 ?auto_29555 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29561 - SURFACE
      ?auto_29562 - SURFACE
    )
    :vars
    (
      ?auto_29566 - HOIST
      ?auto_29568 - PLACE
      ?auto_29567 - SURFACE
      ?auto_29565 - TRUCK
      ?auto_29563 - PLACE
      ?auto_29564 - HOIST
      ?auto_29569 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29566 ?auto_29568 ) ( SURFACE-AT ?auto_29561 ?auto_29568 ) ( CLEAR ?auto_29561 ) ( IS-CRATE ?auto_29562 ) ( not ( = ?auto_29561 ?auto_29562 ) ) ( AVAILABLE ?auto_29566 ) ( ON ?auto_29561 ?auto_29567 ) ( not ( = ?auto_29567 ?auto_29561 ) ) ( not ( = ?auto_29567 ?auto_29562 ) ) ( TRUCK-AT ?auto_29565 ?auto_29563 ) ( not ( = ?auto_29563 ?auto_29568 ) ) ( HOIST-AT ?auto_29564 ?auto_29563 ) ( not ( = ?auto_29566 ?auto_29564 ) ) ( AVAILABLE ?auto_29564 ) ( SURFACE-AT ?auto_29562 ?auto_29563 ) ( ON ?auto_29562 ?auto_29569 ) ( CLEAR ?auto_29562 ) ( not ( = ?auto_29561 ?auto_29569 ) ) ( not ( = ?auto_29562 ?auto_29569 ) ) ( not ( = ?auto_29567 ?auto_29569 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29564 ?auto_29562 ?auto_29569 ?auto_29563 )
      ( MAKE-2CRATE ?auto_29567 ?auto_29561 ?auto_29562 )
      ( MAKE-1CRATE-VERIFY ?auto_29561 ?auto_29562 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29570 - SURFACE
      ?auto_29571 - SURFACE
      ?auto_29572 - SURFACE
    )
    :vars
    (
      ?auto_29577 - HOIST
      ?auto_29574 - PLACE
      ?auto_29576 - TRUCK
      ?auto_29575 - PLACE
      ?auto_29578 - HOIST
      ?auto_29573 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29577 ?auto_29574 ) ( SURFACE-AT ?auto_29571 ?auto_29574 ) ( CLEAR ?auto_29571 ) ( IS-CRATE ?auto_29572 ) ( not ( = ?auto_29571 ?auto_29572 ) ) ( AVAILABLE ?auto_29577 ) ( ON ?auto_29571 ?auto_29570 ) ( not ( = ?auto_29570 ?auto_29571 ) ) ( not ( = ?auto_29570 ?auto_29572 ) ) ( TRUCK-AT ?auto_29576 ?auto_29575 ) ( not ( = ?auto_29575 ?auto_29574 ) ) ( HOIST-AT ?auto_29578 ?auto_29575 ) ( not ( = ?auto_29577 ?auto_29578 ) ) ( AVAILABLE ?auto_29578 ) ( SURFACE-AT ?auto_29572 ?auto_29575 ) ( ON ?auto_29572 ?auto_29573 ) ( CLEAR ?auto_29572 ) ( not ( = ?auto_29571 ?auto_29573 ) ) ( not ( = ?auto_29572 ?auto_29573 ) ) ( not ( = ?auto_29570 ?auto_29573 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29571 ?auto_29572 )
      ( MAKE-2CRATE-VERIFY ?auto_29570 ?auto_29571 ?auto_29572 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29579 - SURFACE
      ?auto_29580 - SURFACE
      ?auto_29581 - SURFACE
      ?auto_29582 - SURFACE
    )
    :vars
    (
      ?auto_29585 - HOIST
      ?auto_29586 - PLACE
      ?auto_29587 - TRUCK
      ?auto_29583 - PLACE
      ?auto_29584 - HOIST
      ?auto_29588 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29585 ?auto_29586 ) ( SURFACE-AT ?auto_29581 ?auto_29586 ) ( CLEAR ?auto_29581 ) ( IS-CRATE ?auto_29582 ) ( not ( = ?auto_29581 ?auto_29582 ) ) ( AVAILABLE ?auto_29585 ) ( ON ?auto_29581 ?auto_29580 ) ( not ( = ?auto_29580 ?auto_29581 ) ) ( not ( = ?auto_29580 ?auto_29582 ) ) ( TRUCK-AT ?auto_29587 ?auto_29583 ) ( not ( = ?auto_29583 ?auto_29586 ) ) ( HOIST-AT ?auto_29584 ?auto_29583 ) ( not ( = ?auto_29585 ?auto_29584 ) ) ( AVAILABLE ?auto_29584 ) ( SURFACE-AT ?auto_29582 ?auto_29583 ) ( ON ?auto_29582 ?auto_29588 ) ( CLEAR ?auto_29582 ) ( not ( = ?auto_29581 ?auto_29588 ) ) ( not ( = ?auto_29582 ?auto_29588 ) ) ( not ( = ?auto_29580 ?auto_29588 ) ) ( ON ?auto_29580 ?auto_29579 ) ( not ( = ?auto_29579 ?auto_29580 ) ) ( not ( = ?auto_29579 ?auto_29581 ) ) ( not ( = ?auto_29579 ?auto_29582 ) ) ( not ( = ?auto_29579 ?auto_29588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29580 ?auto_29581 ?auto_29582 )
      ( MAKE-3CRATE-VERIFY ?auto_29579 ?auto_29580 ?auto_29581 ?auto_29582 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29589 - SURFACE
      ?auto_29590 - SURFACE
      ?auto_29591 - SURFACE
      ?auto_29592 - SURFACE
      ?auto_29593 - SURFACE
    )
    :vars
    (
      ?auto_29596 - HOIST
      ?auto_29597 - PLACE
      ?auto_29598 - TRUCK
      ?auto_29594 - PLACE
      ?auto_29595 - HOIST
      ?auto_29599 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29596 ?auto_29597 ) ( SURFACE-AT ?auto_29592 ?auto_29597 ) ( CLEAR ?auto_29592 ) ( IS-CRATE ?auto_29593 ) ( not ( = ?auto_29592 ?auto_29593 ) ) ( AVAILABLE ?auto_29596 ) ( ON ?auto_29592 ?auto_29591 ) ( not ( = ?auto_29591 ?auto_29592 ) ) ( not ( = ?auto_29591 ?auto_29593 ) ) ( TRUCK-AT ?auto_29598 ?auto_29594 ) ( not ( = ?auto_29594 ?auto_29597 ) ) ( HOIST-AT ?auto_29595 ?auto_29594 ) ( not ( = ?auto_29596 ?auto_29595 ) ) ( AVAILABLE ?auto_29595 ) ( SURFACE-AT ?auto_29593 ?auto_29594 ) ( ON ?auto_29593 ?auto_29599 ) ( CLEAR ?auto_29593 ) ( not ( = ?auto_29592 ?auto_29599 ) ) ( not ( = ?auto_29593 ?auto_29599 ) ) ( not ( = ?auto_29591 ?auto_29599 ) ) ( ON ?auto_29590 ?auto_29589 ) ( ON ?auto_29591 ?auto_29590 ) ( not ( = ?auto_29589 ?auto_29590 ) ) ( not ( = ?auto_29589 ?auto_29591 ) ) ( not ( = ?auto_29589 ?auto_29592 ) ) ( not ( = ?auto_29589 ?auto_29593 ) ) ( not ( = ?auto_29589 ?auto_29599 ) ) ( not ( = ?auto_29590 ?auto_29591 ) ) ( not ( = ?auto_29590 ?auto_29592 ) ) ( not ( = ?auto_29590 ?auto_29593 ) ) ( not ( = ?auto_29590 ?auto_29599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29591 ?auto_29592 ?auto_29593 )
      ( MAKE-4CRATE-VERIFY ?auto_29589 ?auto_29590 ?auto_29591 ?auto_29592 ?auto_29593 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29600 - SURFACE
      ?auto_29601 - SURFACE
    )
    :vars
    (
      ?auto_29604 - HOIST
      ?auto_29605 - PLACE
      ?auto_29608 - SURFACE
      ?auto_29602 - PLACE
      ?auto_29603 - HOIST
      ?auto_29607 - SURFACE
      ?auto_29606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29604 ?auto_29605 ) ( SURFACE-AT ?auto_29600 ?auto_29605 ) ( CLEAR ?auto_29600 ) ( IS-CRATE ?auto_29601 ) ( not ( = ?auto_29600 ?auto_29601 ) ) ( AVAILABLE ?auto_29604 ) ( ON ?auto_29600 ?auto_29608 ) ( not ( = ?auto_29608 ?auto_29600 ) ) ( not ( = ?auto_29608 ?auto_29601 ) ) ( not ( = ?auto_29602 ?auto_29605 ) ) ( HOIST-AT ?auto_29603 ?auto_29602 ) ( not ( = ?auto_29604 ?auto_29603 ) ) ( AVAILABLE ?auto_29603 ) ( SURFACE-AT ?auto_29601 ?auto_29602 ) ( ON ?auto_29601 ?auto_29607 ) ( CLEAR ?auto_29601 ) ( not ( = ?auto_29600 ?auto_29607 ) ) ( not ( = ?auto_29601 ?auto_29607 ) ) ( not ( = ?auto_29608 ?auto_29607 ) ) ( TRUCK-AT ?auto_29606 ?auto_29605 ) )
    :subtasks
    ( ( !DRIVE ?auto_29606 ?auto_29605 ?auto_29602 )
      ( MAKE-2CRATE ?auto_29608 ?auto_29600 ?auto_29601 )
      ( MAKE-1CRATE-VERIFY ?auto_29600 ?auto_29601 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29609 - SURFACE
      ?auto_29610 - SURFACE
      ?auto_29611 - SURFACE
    )
    :vars
    (
      ?auto_29617 - HOIST
      ?auto_29614 - PLACE
      ?auto_29616 - PLACE
      ?auto_29612 - HOIST
      ?auto_29613 - SURFACE
      ?auto_29615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29617 ?auto_29614 ) ( SURFACE-AT ?auto_29610 ?auto_29614 ) ( CLEAR ?auto_29610 ) ( IS-CRATE ?auto_29611 ) ( not ( = ?auto_29610 ?auto_29611 ) ) ( AVAILABLE ?auto_29617 ) ( ON ?auto_29610 ?auto_29609 ) ( not ( = ?auto_29609 ?auto_29610 ) ) ( not ( = ?auto_29609 ?auto_29611 ) ) ( not ( = ?auto_29616 ?auto_29614 ) ) ( HOIST-AT ?auto_29612 ?auto_29616 ) ( not ( = ?auto_29617 ?auto_29612 ) ) ( AVAILABLE ?auto_29612 ) ( SURFACE-AT ?auto_29611 ?auto_29616 ) ( ON ?auto_29611 ?auto_29613 ) ( CLEAR ?auto_29611 ) ( not ( = ?auto_29610 ?auto_29613 ) ) ( not ( = ?auto_29611 ?auto_29613 ) ) ( not ( = ?auto_29609 ?auto_29613 ) ) ( TRUCK-AT ?auto_29615 ?auto_29614 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29610 ?auto_29611 )
      ( MAKE-2CRATE-VERIFY ?auto_29609 ?auto_29610 ?auto_29611 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29618 - SURFACE
      ?auto_29619 - SURFACE
      ?auto_29620 - SURFACE
      ?auto_29621 - SURFACE
    )
    :vars
    (
      ?auto_29627 - HOIST
      ?auto_29626 - PLACE
      ?auto_29624 - PLACE
      ?auto_29622 - HOIST
      ?auto_29623 - SURFACE
      ?auto_29625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29627 ?auto_29626 ) ( SURFACE-AT ?auto_29620 ?auto_29626 ) ( CLEAR ?auto_29620 ) ( IS-CRATE ?auto_29621 ) ( not ( = ?auto_29620 ?auto_29621 ) ) ( AVAILABLE ?auto_29627 ) ( ON ?auto_29620 ?auto_29619 ) ( not ( = ?auto_29619 ?auto_29620 ) ) ( not ( = ?auto_29619 ?auto_29621 ) ) ( not ( = ?auto_29624 ?auto_29626 ) ) ( HOIST-AT ?auto_29622 ?auto_29624 ) ( not ( = ?auto_29627 ?auto_29622 ) ) ( AVAILABLE ?auto_29622 ) ( SURFACE-AT ?auto_29621 ?auto_29624 ) ( ON ?auto_29621 ?auto_29623 ) ( CLEAR ?auto_29621 ) ( not ( = ?auto_29620 ?auto_29623 ) ) ( not ( = ?auto_29621 ?auto_29623 ) ) ( not ( = ?auto_29619 ?auto_29623 ) ) ( TRUCK-AT ?auto_29625 ?auto_29626 ) ( ON ?auto_29619 ?auto_29618 ) ( not ( = ?auto_29618 ?auto_29619 ) ) ( not ( = ?auto_29618 ?auto_29620 ) ) ( not ( = ?auto_29618 ?auto_29621 ) ) ( not ( = ?auto_29618 ?auto_29623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29619 ?auto_29620 ?auto_29621 )
      ( MAKE-3CRATE-VERIFY ?auto_29618 ?auto_29619 ?auto_29620 ?auto_29621 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29628 - SURFACE
      ?auto_29629 - SURFACE
      ?auto_29630 - SURFACE
      ?auto_29631 - SURFACE
      ?auto_29632 - SURFACE
    )
    :vars
    (
      ?auto_29638 - HOIST
      ?auto_29637 - PLACE
      ?auto_29635 - PLACE
      ?auto_29633 - HOIST
      ?auto_29634 - SURFACE
      ?auto_29636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29638 ?auto_29637 ) ( SURFACE-AT ?auto_29631 ?auto_29637 ) ( CLEAR ?auto_29631 ) ( IS-CRATE ?auto_29632 ) ( not ( = ?auto_29631 ?auto_29632 ) ) ( AVAILABLE ?auto_29638 ) ( ON ?auto_29631 ?auto_29630 ) ( not ( = ?auto_29630 ?auto_29631 ) ) ( not ( = ?auto_29630 ?auto_29632 ) ) ( not ( = ?auto_29635 ?auto_29637 ) ) ( HOIST-AT ?auto_29633 ?auto_29635 ) ( not ( = ?auto_29638 ?auto_29633 ) ) ( AVAILABLE ?auto_29633 ) ( SURFACE-AT ?auto_29632 ?auto_29635 ) ( ON ?auto_29632 ?auto_29634 ) ( CLEAR ?auto_29632 ) ( not ( = ?auto_29631 ?auto_29634 ) ) ( not ( = ?auto_29632 ?auto_29634 ) ) ( not ( = ?auto_29630 ?auto_29634 ) ) ( TRUCK-AT ?auto_29636 ?auto_29637 ) ( ON ?auto_29629 ?auto_29628 ) ( ON ?auto_29630 ?auto_29629 ) ( not ( = ?auto_29628 ?auto_29629 ) ) ( not ( = ?auto_29628 ?auto_29630 ) ) ( not ( = ?auto_29628 ?auto_29631 ) ) ( not ( = ?auto_29628 ?auto_29632 ) ) ( not ( = ?auto_29628 ?auto_29634 ) ) ( not ( = ?auto_29629 ?auto_29630 ) ) ( not ( = ?auto_29629 ?auto_29631 ) ) ( not ( = ?auto_29629 ?auto_29632 ) ) ( not ( = ?auto_29629 ?auto_29634 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29630 ?auto_29631 ?auto_29632 )
      ( MAKE-4CRATE-VERIFY ?auto_29628 ?auto_29629 ?auto_29630 ?auto_29631 ?auto_29632 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29639 - SURFACE
      ?auto_29640 - SURFACE
    )
    :vars
    (
      ?auto_29647 - HOIST
      ?auto_29646 - PLACE
      ?auto_29645 - SURFACE
      ?auto_29643 - PLACE
      ?auto_29641 - HOIST
      ?auto_29642 - SURFACE
      ?auto_29644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29647 ?auto_29646 ) ( IS-CRATE ?auto_29640 ) ( not ( = ?auto_29639 ?auto_29640 ) ) ( not ( = ?auto_29645 ?auto_29639 ) ) ( not ( = ?auto_29645 ?auto_29640 ) ) ( not ( = ?auto_29643 ?auto_29646 ) ) ( HOIST-AT ?auto_29641 ?auto_29643 ) ( not ( = ?auto_29647 ?auto_29641 ) ) ( AVAILABLE ?auto_29641 ) ( SURFACE-AT ?auto_29640 ?auto_29643 ) ( ON ?auto_29640 ?auto_29642 ) ( CLEAR ?auto_29640 ) ( not ( = ?auto_29639 ?auto_29642 ) ) ( not ( = ?auto_29640 ?auto_29642 ) ) ( not ( = ?auto_29645 ?auto_29642 ) ) ( TRUCK-AT ?auto_29644 ?auto_29646 ) ( SURFACE-AT ?auto_29645 ?auto_29646 ) ( CLEAR ?auto_29645 ) ( LIFTING ?auto_29647 ?auto_29639 ) ( IS-CRATE ?auto_29639 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29645 ?auto_29639 )
      ( MAKE-2CRATE ?auto_29645 ?auto_29639 ?auto_29640 )
      ( MAKE-1CRATE-VERIFY ?auto_29639 ?auto_29640 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29648 - SURFACE
      ?auto_29649 - SURFACE
      ?auto_29650 - SURFACE
    )
    :vars
    (
      ?auto_29652 - HOIST
      ?auto_29651 - PLACE
      ?auto_29654 - PLACE
      ?auto_29653 - HOIST
      ?auto_29655 - SURFACE
      ?auto_29656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29652 ?auto_29651 ) ( IS-CRATE ?auto_29650 ) ( not ( = ?auto_29649 ?auto_29650 ) ) ( not ( = ?auto_29648 ?auto_29649 ) ) ( not ( = ?auto_29648 ?auto_29650 ) ) ( not ( = ?auto_29654 ?auto_29651 ) ) ( HOIST-AT ?auto_29653 ?auto_29654 ) ( not ( = ?auto_29652 ?auto_29653 ) ) ( AVAILABLE ?auto_29653 ) ( SURFACE-AT ?auto_29650 ?auto_29654 ) ( ON ?auto_29650 ?auto_29655 ) ( CLEAR ?auto_29650 ) ( not ( = ?auto_29649 ?auto_29655 ) ) ( not ( = ?auto_29650 ?auto_29655 ) ) ( not ( = ?auto_29648 ?auto_29655 ) ) ( TRUCK-AT ?auto_29656 ?auto_29651 ) ( SURFACE-AT ?auto_29648 ?auto_29651 ) ( CLEAR ?auto_29648 ) ( LIFTING ?auto_29652 ?auto_29649 ) ( IS-CRATE ?auto_29649 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29649 ?auto_29650 )
      ( MAKE-2CRATE-VERIFY ?auto_29648 ?auto_29649 ?auto_29650 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29657 - SURFACE
      ?auto_29658 - SURFACE
      ?auto_29659 - SURFACE
      ?auto_29660 - SURFACE
    )
    :vars
    (
      ?auto_29663 - HOIST
      ?auto_29662 - PLACE
      ?auto_29661 - PLACE
      ?auto_29665 - HOIST
      ?auto_29666 - SURFACE
      ?auto_29664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29663 ?auto_29662 ) ( IS-CRATE ?auto_29660 ) ( not ( = ?auto_29659 ?auto_29660 ) ) ( not ( = ?auto_29658 ?auto_29659 ) ) ( not ( = ?auto_29658 ?auto_29660 ) ) ( not ( = ?auto_29661 ?auto_29662 ) ) ( HOIST-AT ?auto_29665 ?auto_29661 ) ( not ( = ?auto_29663 ?auto_29665 ) ) ( AVAILABLE ?auto_29665 ) ( SURFACE-AT ?auto_29660 ?auto_29661 ) ( ON ?auto_29660 ?auto_29666 ) ( CLEAR ?auto_29660 ) ( not ( = ?auto_29659 ?auto_29666 ) ) ( not ( = ?auto_29660 ?auto_29666 ) ) ( not ( = ?auto_29658 ?auto_29666 ) ) ( TRUCK-AT ?auto_29664 ?auto_29662 ) ( SURFACE-AT ?auto_29658 ?auto_29662 ) ( CLEAR ?auto_29658 ) ( LIFTING ?auto_29663 ?auto_29659 ) ( IS-CRATE ?auto_29659 ) ( ON ?auto_29658 ?auto_29657 ) ( not ( = ?auto_29657 ?auto_29658 ) ) ( not ( = ?auto_29657 ?auto_29659 ) ) ( not ( = ?auto_29657 ?auto_29660 ) ) ( not ( = ?auto_29657 ?auto_29666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29658 ?auto_29659 ?auto_29660 )
      ( MAKE-3CRATE-VERIFY ?auto_29657 ?auto_29658 ?auto_29659 ?auto_29660 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29667 - SURFACE
      ?auto_29668 - SURFACE
      ?auto_29669 - SURFACE
      ?auto_29670 - SURFACE
      ?auto_29671 - SURFACE
    )
    :vars
    (
      ?auto_29674 - HOIST
      ?auto_29673 - PLACE
      ?auto_29672 - PLACE
      ?auto_29676 - HOIST
      ?auto_29677 - SURFACE
      ?auto_29675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29674 ?auto_29673 ) ( IS-CRATE ?auto_29671 ) ( not ( = ?auto_29670 ?auto_29671 ) ) ( not ( = ?auto_29669 ?auto_29670 ) ) ( not ( = ?auto_29669 ?auto_29671 ) ) ( not ( = ?auto_29672 ?auto_29673 ) ) ( HOIST-AT ?auto_29676 ?auto_29672 ) ( not ( = ?auto_29674 ?auto_29676 ) ) ( AVAILABLE ?auto_29676 ) ( SURFACE-AT ?auto_29671 ?auto_29672 ) ( ON ?auto_29671 ?auto_29677 ) ( CLEAR ?auto_29671 ) ( not ( = ?auto_29670 ?auto_29677 ) ) ( not ( = ?auto_29671 ?auto_29677 ) ) ( not ( = ?auto_29669 ?auto_29677 ) ) ( TRUCK-AT ?auto_29675 ?auto_29673 ) ( SURFACE-AT ?auto_29669 ?auto_29673 ) ( CLEAR ?auto_29669 ) ( LIFTING ?auto_29674 ?auto_29670 ) ( IS-CRATE ?auto_29670 ) ( ON ?auto_29668 ?auto_29667 ) ( ON ?auto_29669 ?auto_29668 ) ( not ( = ?auto_29667 ?auto_29668 ) ) ( not ( = ?auto_29667 ?auto_29669 ) ) ( not ( = ?auto_29667 ?auto_29670 ) ) ( not ( = ?auto_29667 ?auto_29671 ) ) ( not ( = ?auto_29667 ?auto_29677 ) ) ( not ( = ?auto_29668 ?auto_29669 ) ) ( not ( = ?auto_29668 ?auto_29670 ) ) ( not ( = ?auto_29668 ?auto_29671 ) ) ( not ( = ?auto_29668 ?auto_29677 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29669 ?auto_29670 ?auto_29671 )
      ( MAKE-4CRATE-VERIFY ?auto_29667 ?auto_29668 ?auto_29669 ?auto_29670 ?auto_29671 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29678 - SURFACE
      ?auto_29679 - SURFACE
    )
    :vars
    (
      ?auto_29682 - HOIST
      ?auto_29681 - PLACE
      ?auto_29685 - SURFACE
      ?auto_29680 - PLACE
      ?auto_29684 - HOIST
      ?auto_29686 - SURFACE
      ?auto_29683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29682 ?auto_29681 ) ( IS-CRATE ?auto_29679 ) ( not ( = ?auto_29678 ?auto_29679 ) ) ( not ( = ?auto_29685 ?auto_29678 ) ) ( not ( = ?auto_29685 ?auto_29679 ) ) ( not ( = ?auto_29680 ?auto_29681 ) ) ( HOIST-AT ?auto_29684 ?auto_29680 ) ( not ( = ?auto_29682 ?auto_29684 ) ) ( AVAILABLE ?auto_29684 ) ( SURFACE-AT ?auto_29679 ?auto_29680 ) ( ON ?auto_29679 ?auto_29686 ) ( CLEAR ?auto_29679 ) ( not ( = ?auto_29678 ?auto_29686 ) ) ( not ( = ?auto_29679 ?auto_29686 ) ) ( not ( = ?auto_29685 ?auto_29686 ) ) ( TRUCK-AT ?auto_29683 ?auto_29681 ) ( SURFACE-AT ?auto_29685 ?auto_29681 ) ( CLEAR ?auto_29685 ) ( IS-CRATE ?auto_29678 ) ( AVAILABLE ?auto_29682 ) ( IN ?auto_29678 ?auto_29683 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29682 ?auto_29678 ?auto_29683 ?auto_29681 )
      ( MAKE-2CRATE ?auto_29685 ?auto_29678 ?auto_29679 )
      ( MAKE-1CRATE-VERIFY ?auto_29678 ?auto_29679 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29687 - SURFACE
      ?auto_29688 - SURFACE
      ?auto_29689 - SURFACE
    )
    :vars
    (
      ?auto_29690 - HOIST
      ?auto_29691 - PLACE
      ?auto_29694 - PLACE
      ?auto_29695 - HOIST
      ?auto_29692 - SURFACE
      ?auto_29693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29690 ?auto_29691 ) ( IS-CRATE ?auto_29689 ) ( not ( = ?auto_29688 ?auto_29689 ) ) ( not ( = ?auto_29687 ?auto_29688 ) ) ( not ( = ?auto_29687 ?auto_29689 ) ) ( not ( = ?auto_29694 ?auto_29691 ) ) ( HOIST-AT ?auto_29695 ?auto_29694 ) ( not ( = ?auto_29690 ?auto_29695 ) ) ( AVAILABLE ?auto_29695 ) ( SURFACE-AT ?auto_29689 ?auto_29694 ) ( ON ?auto_29689 ?auto_29692 ) ( CLEAR ?auto_29689 ) ( not ( = ?auto_29688 ?auto_29692 ) ) ( not ( = ?auto_29689 ?auto_29692 ) ) ( not ( = ?auto_29687 ?auto_29692 ) ) ( TRUCK-AT ?auto_29693 ?auto_29691 ) ( SURFACE-AT ?auto_29687 ?auto_29691 ) ( CLEAR ?auto_29687 ) ( IS-CRATE ?auto_29688 ) ( AVAILABLE ?auto_29690 ) ( IN ?auto_29688 ?auto_29693 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29688 ?auto_29689 )
      ( MAKE-2CRATE-VERIFY ?auto_29687 ?auto_29688 ?auto_29689 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29696 - SURFACE
      ?auto_29697 - SURFACE
      ?auto_29698 - SURFACE
      ?auto_29699 - SURFACE
    )
    :vars
    (
      ?auto_29703 - HOIST
      ?auto_29702 - PLACE
      ?auto_29700 - PLACE
      ?auto_29705 - HOIST
      ?auto_29704 - SURFACE
      ?auto_29701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29703 ?auto_29702 ) ( IS-CRATE ?auto_29699 ) ( not ( = ?auto_29698 ?auto_29699 ) ) ( not ( = ?auto_29697 ?auto_29698 ) ) ( not ( = ?auto_29697 ?auto_29699 ) ) ( not ( = ?auto_29700 ?auto_29702 ) ) ( HOIST-AT ?auto_29705 ?auto_29700 ) ( not ( = ?auto_29703 ?auto_29705 ) ) ( AVAILABLE ?auto_29705 ) ( SURFACE-AT ?auto_29699 ?auto_29700 ) ( ON ?auto_29699 ?auto_29704 ) ( CLEAR ?auto_29699 ) ( not ( = ?auto_29698 ?auto_29704 ) ) ( not ( = ?auto_29699 ?auto_29704 ) ) ( not ( = ?auto_29697 ?auto_29704 ) ) ( TRUCK-AT ?auto_29701 ?auto_29702 ) ( SURFACE-AT ?auto_29697 ?auto_29702 ) ( CLEAR ?auto_29697 ) ( IS-CRATE ?auto_29698 ) ( AVAILABLE ?auto_29703 ) ( IN ?auto_29698 ?auto_29701 ) ( ON ?auto_29697 ?auto_29696 ) ( not ( = ?auto_29696 ?auto_29697 ) ) ( not ( = ?auto_29696 ?auto_29698 ) ) ( not ( = ?auto_29696 ?auto_29699 ) ) ( not ( = ?auto_29696 ?auto_29704 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29697 ?auto_29698 ?auto_29699 )
      ( MAKE-3CRATE-VERIFY ?auto_29696 ?auto_29697 ?auto_29698 ?auto_29699 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29706 - SURFACE
      ?auto_29707 - SURFACE
      ?auto_29708 - SURFACE
      ?auto_29709 - SURFACE
      ?auto_29710 - SURFACE
    )
    :vars
    (
      ?auto_29714 - HOIST
      ?auto_29713 - PLACE
      ?auto_29711 - PLACE
      ?auto_29716 - HOIST
      ?auto_29715 - SURFACE
      ?auto_29712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29714 ?auto_29713 ) ( IS-CRATE ?auto_29710 ) ( not ( = ?auto_29709 ?auto_29710 ) ) ( not ( = ?auto_29708 ?auto_29709 ) ) ( not ( = ?auto_29708 ?auto_29710 ) ) ( not ( = ?auto_29711 ?auto_29713 ) ) ( HOIST-AT ?auto_29716 ?auto_29711 ) ( not ( = ?auto_29714 ?auto_29716 ) ) ( AVAILABLE ?auto_29716 ) ( SURFACE-AT ?auto_29710 ?auto_29711 ) ( ON ?auto_29710 ?auto_29715 ) ( CLEAR ?auto_29710 ) ( not ( = ?auto_29709 ?auto_29715 ) ) ( not ( = ?auto_29710 ?auto_29715 ) ) ( not ( = ?auto_29708 ?auto_29715 ) ) ( TRUCK-AT ?auto_29712 ?auto_29713 ) ( SURFACE-AT ?auto_29708 ?auto_29713 ) ( CLEAR ?auto_29708 ) ( IS-CRATE ?auto_29709 ) ( AVAILABLE ?auto_29714 ) ( IN ?auto_29709 ?auto_29712 ) ( ON ?auto_29707 ?auto_29706 ) ( ON ?auto_29708 ?auto_29707 ) ( not ( = ?auto_29706 ?auto_29707 ) ) ( not ( = ?auto_29706 ?auto_29708 ) ) ( not ( = ?auto_29706 ?auto_29709 ) ) ( not ( = ?auto_29706 ?auto_29710 ) ) ( not ( = ?auto_29706 ?auto_29715 ) ) ( not ( = ?auto_29707 ?auto_29708 ) ) ( not ( = ?auto_29707 ?auto_29709 ) ) ( not ( = ?auto_29707 ?auto_29710 ) ) ( not ( = ?auto_29707 ?auto_29715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29708 ?auto_29709 ?auto_29710 )
      ( MAKE-4CRATE-VERIFY ?auto_29706 ?auto_29707 ?auto_29708 ?auto_29709 ?auto_29710 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29717 - SURFACE
      ?auto_29718 - SURFACE
    )
    :vars
    (
      ?auto_29723 - HOIST
      ?auto_29722 - PLACE
      ?auto_29719 - SURFACE
      ?auto_29720 - PLACE
      ?auto_29725 - HOIST
      ?auto_29724 - SURFACE
      ?auto_29721 - TRUCK
      ?auto_29726 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29723 ?auto_29722 ) ( IS-CRATE ?auto_29718 ) ( not ( = ?auto_29717 ?auto_29718 ) ) ( not ( = ?auto_29719 ?auto_29717 ) ) ( not ( = ?auto_29719 ?auto_29718 ) ) ( not ( = ?auto_29720 ?auto_29722 ) ) ( HOIST-AT ?auto_29725 ?auto_29720 ) ( not ( = ?auto_29723 ?auto_29725 ) ) ( AVAILABLE ?auto_29725 ) ( SURFACE-AT ?auto_29718 ?auto_29720 ) ( ON ?auto_29718 ?auto_29724 ) ( CLEAR ?auto_29718 ) ( not ( = ?auto_29717 ?auto_29724 ) ) ( not ( = ?auto_29718 ?auto_29724 ) ) ( not ( = ?auto_29719 ?auto_29724 ) ) ( SURFACE-AT ?auto_29719 ?auto_29722 ) ( CLEAR ?auto_29719 ) ( IS-CRATE ?auto_29717 ) ( AVAILABLE ?auto_29723 ) ( IN ?auto_29717 ?auto_29721 ) ( TRUCK-AT ?auto_29721 ?auto_29726 ) ( not ( = ?auto_29726 ?auto_29722 ) ) ( not ( = ?auto_29720 ?auto_29726 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29721 ?auto_29726 ?auto_29722 )
      ( MAKE-2CRATE ?auto_29719 ?auto_29717 ?auto_29718 )
      ( MAKE-1CRATE-VERIFY ?auto_29717 ?auto_29718 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29727 - SURFACE
      ?auto_29728 - SURFACE
      ?auto_29729 - SURFACE
    )
    :vars
    (
      ?auto_29730 - HOIST
      ?auto_29736 - PLACE
      ?auto_29735 - PLACE
      ?auto_29733 - HOIST
      ?auto_29731 - SURFACE
      ?auto_29732 - TRUCK
      ?auto_29734 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29730 ?auto_29736 ) ( IS-CRATE ?auto_29729 ) ( not ( = ?auto_29728 ?auto_29729 ) ) ( not ( = ?auto_29727 ?auto_29728 ) ) ( not ( = ?auto_29727 ?auto_29729 ) ) ( not ( = ?auto_29735 ?auto_29736 ) ) ( HOIST-AT ?auto_29733 ?auto_29735 ) ( not ( = ?auto_29730 ?auto_29733 ) ) ( AVAILABLE ?auto_29733 ) ( SURFACE-AT ?auto_29729 ?auto_29735 ) ( ON ?auto_29729 ?auto_29731 ) ( CLEAR ?auto_29729 ) ( not ( = ?auto_29728 ?auto_29731 ) ) ( not ( = ?auto_29729 ?auto_29731 ) ) ( not ( = ?auto_29727 ?auto_29731 ) ) ( SURFACE-AT ?auto_29727 ?auto_29736 ) ( CLEAR ?auto_29727 ) ( IS-CRATE ?auto_29728 ) ( AVAILABLE ?auto_29730 ) ( IN ?auto_29728 ?auto_29732 ) ( TRUCK-AT ?auto_29732 ?auto_29734 ) ( not ( = ?auto_29734 ?auto_29736 ) ) ( not ( = ?auto_29735 ?auto_29734 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29728 ?auto_29729 )
      ( MAKE-2CRATE-VERIFY ?auto_29727 ?auto_29728 ?auto_29729 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29737 - SURFACE
      ?auto_29738 - SURFACE
      ?auto_29739 - SURFACE
      ?auto_29740 - SURFACE
    )
    :vars
    (
      ?auto_29747 - HOIST
      ?auto_29743 - PLACE
      ?auto_29744 - PLACE
      ?auto_29745 - HOIST
      ?auto_29741 - SURFACE
      ?auto_29746 - TRUCK
      ?auto_29742 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29747 ?auto_29743 ) ( IS-CRATE ?auto_29740 ) ( not ( = ?auto_29739 ?auto_29740 ) ) ( not ( = ?auto_29738 ?auto_29739 ) ) ( not ( = ?auto_29738 ?auto_29740 ) ) ( not ( = ?auto_29744 ?auto_29743 ) ) ( HOIST-AT ?auto_29745 ?auto_29744 ) ( not ( = ?auto_29747 ?auto_29745 ) ) ( AVAILABLE ?auto_29745 ) ( SURFACE-AT ?auto_29740 ?auto_29744 ) ( ON ?auto_29740 ?auto_29741 ) ( CLEAR ?auto_29740 ) ( not ( = ?auto_29739 ?auto_29741 ) ) ( not ( = ?auto_29740 ?auto_29741 ) ) ( not ( = ?auto_29738 ?auto_29741 ) ) ( SURFACE-AT ?auto_29738 ?auto_29743 ) ( CLEAR ?auto_29738 ) ( IS-CRATE ?auto_29739 ) ( AVAILABLE ?auto_29747 ) ( IN ?auto_29739 ?auto_29746 ) ( TRUCK-AT ?auto_29746 ?auto_29742 ) ( not ( = ?auto_29742 ?auto_29743 ) ) ( not ( = ?auto_29744 ?auto_29742 ) ) ( ON ?auto_29738 ?auto_29737 ) ( not ( = ?auto_29737 ?auto_29738 ) ) ( not ( = ?auto_29737 ?auto_29739 ) ) ( not ( = ?auto_29737 ?auto_29740 ) ) ( not ( = ?auto_29737 ?auto_29741 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29738 ?auto_29739 ?auto_29740 )
      ( MAKE-3CRATE-VERIFY ?auto_29737 ?auto_29738 ?auto_29739 ?auto_29740 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29748 - SURFACE
      ?auto_29749 - SURFACE
      ?auto_29750 - SURFACE
      ?auto_29751 - SURFACE
      ?auto_29752 - SURFACE
    )
    :vars
    (
      ?auto_29759 - HOIST
      ?auto_29755 - PLACE
      ?auto_29756 - PLACE
      ?auto_29757 - HOIST
      ?auto_29753 - SURFACE
      ?auto_29758 - TRUCK
      ?auto_29754 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29759 ?auto_29755 ) ( IS-CRATE ?auto_29752 ) ( not ( = ?auto_29751 ?auto_29752 ) ) ( not ( = ?auto_29750 ?auto_29751 ) ) ( not ( = ?auto_29750 ?auto_29752 ) ) ( not ( = ?auto_29756 ?auto_29755 ) ) ( HOIST-AT ?auto_29757 ?auto_29756 ) ( not ( = ?auto_29759 ?auto_29757 ) ) ( AVAILABLE ?auto_29757 ) ( SURFACE-AT ?auto_29752 ?auto_29756 ) ( ON ?auto_29752 ?auto_29753 ) ( CLEAR ?auto_29752 ) ( not ( = ?auto_29751 ?auto_29753 ) ) ( not ( = ?auto_29752 ?auto_29753 ) ) ( not ( = ?auto_29750 ?auto_29753 ) ) ( SURFACE-AT ?auto_29750 ?auto_29755 ) ( CLEAR ?auto_29750 ) ( IS-CRATE ?auto_29751 ) ( AVAILABLE ?auto_29759 ) ( IN ?auto_29751 ?auto_29758 ) ( TRUCK-AT ?auto_29758 ?auto_29754 ) ( not ( = ?auto_29754 ?auto_29755 ) ) ( not ( = ?auto_29756 ?auto_29754 ) ) ( ON ?auto_29749 ?auto_29748 ) ( ON ?auto_29750 ?auto_29749 ) ( not ( = ?auto_29748 ?auto_29749 ) ) ( not ( = ?auto_29748 ?auto_29750 ) ) ( not ( = ?auto_29748 ?auto_29751 ) ) ( not ( = ?auto_29748 ?auto_29752 ) ) ( not ( = ?auto_29748 ?auto_29753 ) ) ( not ( = ?auto_29749 ?auto_29750 ) ) ( not ( = ?auto_29749 ?auto_29751 ) ) ( not ( = ?auto_29749 ?auto_29752 ) ) ( not ( = ?auto_29749 ?auto_29753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29750 ?auto_29751 ?auto_29752 )
      ( MAKE-4CRATE-VERIFY ?auto_29748 ?auto_29749 ?auto_29750 ?auto_29751 ?auto_29752 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29760 - SURFACE
      ?auto_29761 - SURFACE
    )
    :vars
    (
      ?auto_29769 - HOIST
      ?auto_29765 - PLACE
      ?auto_29764 - SURFACE
      ?auto_29766 - PLACE
      ?auto_29767 - HOIST
      ?auto_29762 - SURFACE
      ?auto_29768 - TRUCK
      ?auto_29763 - PLACE
      ?auto_29770 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29769 ?auto_29765 ) ( IS-CRATE ?auto_29761 ) ( not ( = ?auto_29760 ?auto_29761 ) ) ( not ( = ?auto_29764 ?auto_29760 ) ) ( not ( = ?auto_29764 ?auto_29761 ) ) ( not ( = ?auto_29766 ?auto_29765 ) ) ( HOIST-AT ?auto_29767 ?auto_29766 ) ( not ( = ?auto_29769 ?auto_29767 ) ) ( AVAILABLE ?auto_29767 ) ( SURFACE-AT ?auto_29761 ?auto_29766 ) ( ON ?auto_29761 ?auto_29762 ) ( CLEAR ?auto_29761 ) ( not ( = ?auto_29760 ?auto_29762 ) ) ( not ( = ?auto_29761 ?auto_29762 ) ) ( not ( = ?auto_29764 ?auto_29762 ) ) ( SURFACE-AT ?auto_29764 ?auto_29765 ) ( CLEAR ?auto_29764 ) ( IS-CRATE ?auto_29760 ) ( AVAILABLE ?auto_29769 ) ( TRUCK-AT ?auto_29768 ?auto_29763 ) ( not ( = ?auto_29763 ?auto_29765 ) ) ( not ( = ?auto_29766 ?auto_29763 ) ) ( HOIST-AT ?auto_29770 ?auto_29763 ) ( LIFTING ?auto_29770 ?auto_29760 ) ( not ( = ?auto_29769 ?auto_29770 ) ) ( not ( = ?auto_29767 ?auto_29770 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29770 ?auto_29760 ?auto_29768 ?auto_29763 )
      ( MAKE-2CRATE ?auto_29764 ?auto_29760 ?auto_29761 )
      ( MAKE-1CRATE-VERIFY ?auto_29760 ?auto_29761 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29771 - SURFACE
      ?auto_29772 - SURFACE
      ?auto_29773 - SURFACE
    )
    :vars
    (
      ?auto_29776 - HOIST
      ?auto_29779 - PLACE
      ?auto_29780 - PLACE
      ?auto_29774 - HOIST
      ?auto_29778 - SURFACE
      ?auto_29777 - TRUCK
      ?auto_29781 - PLACE
      ?auto_29775 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29776 ?auto_29779 ) ( IS-CRATE ?auto_29773 ) ( not ( = ?auto_29772 ?auto_29773 ) ) ( not ( = ?auto_29771 ?auto_29772 ) ) ( not ( = ?auto_29771 ?auto_29773 ) ) ( not ( = ?auto_29780 ?auto_29779 ) ) ( HOIST-AT ?auto_29774 ?auto_29780 ) ( not ( = ?auto_29776 ?auto_29774 ) ) ( AVAILABLE ?auto_29774 ) ( SURFACE-AT ?auto_29773 ?auto_29780 ) ( ON ?auto_29773 ?auto_29778 ) ( CLEAR ?auto_29773 ) ( not ( = ?auto_29772 ?auto_29778 ) ) ( not ( = ?auto_29773 ?auto_29778 ) ) ( not ( = ?auto_29771 ?auto_29778 ) ) ( SURFACE-AT ?auto_29771 ?auto_29779 ) ( CLEAR ?auto_29771 ) ( IS-CRATE ?auto_29772 ) ( AVAILABLE ?auto_29776 ) ( TRUCK-AT ?auto_29777 ?auto_29781 ) ( not ( = ?auto_29781 ?auto_29779 ) ) ( not ( = ?auto_29780 ?auto_29781 ) ) ( HOIST-AT ?auto_29775 ?auto_29781 ) ( LIFTING ?auto_29775 ?auto_29772 ) ( not ( = ?auto_29776 ?auto_29775 ) ) ( not ( = ?auto_29774 ?auto_29775 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29772 ?auto_29773 )
      ( MAKE-2CRATE-VERIFY ?auto_29771 ?auto_29772 ?auto_29773 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29782 - SURFACE
      ?auto_29783 - SURFACE
      ?auto_29784 - SURFACE
      ?auto_29785 - SURFACE
    )
    :vars
    (
      ?auto_29792 - HOIST
      ?auto_29787 - PLACE
      ?auto_29790 - PLACE
      ?auto_29788 - HOIST
      ?auto_29791 - SURFACE
      ?auto_29793 - TRUCK
      ?auto_29789 - PLACE
      ?auto_29786 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29792 ?auto_29787 ) ( IS-CRATE ?auto_29785 ) ( not ( = ?auto_29784 ?auto_29785 ) ) ( not ( = ?auto_29783 ?auto_29784 ) ) ( not ( = ?auto_29783 ?auto_29785 ) ) ( not ( = ?auto_29790 ?auto_29787 ) ) ( HOIST-AT ?auto_29788 ?auto_29790 ) ( not ( = ?auto_29792 ?auto_29788 ) ) ( AVAILABLE ?auto_29788 ) ( SURFACE-AT ?auto_29785 ?auto_29790 ) ( ON ?auto_29785 ?auto_29791 ) ( CLEAR ?auto_29785 ) ( not ( = ?auto_29784 ?auto_29791 ) ) ( not ( = ?auto_29785 ?auto_29791 ) ) ( not ( = ?auto_29783 ?auto_29791 ) ) ( SURFACE-AT ?auto_29783 ?auto_29787 ) ( CLEAR ?auto_29783 ) ( IS-CRATE ?auto_29784 ) ( AVAILABLE ?auto_29792 ) ( TRUCK-AT ?auto_29793 ?auto_29789 ) ( not ( = ?auto_29789 ?auto_29787 ) ) ( not ( = ?auto_29790 ?auto_29789 ) ) ( HOIST-AT ?auto_29786 ?auto_29789 ) ( LIFTING ?auto_29786 ?auto_29784 ) ( not ( = ?auto_29792 ?auto_29786 ) ) ( not ( = ?auto_29788 ?auto_29786 ) ) ( ON ?auto_29783 ?auto_29782 ) ( not ( = ?auto_29782 ?auto_29783 ) ) ( not ( = ?auto_29782 ?auto_29784 ) ) ( not ( = ?auto_29782 ?auto_29785 ) ) ( not ( = ?auto_29782 ?auto_29791 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29783 ?auto_29784 ?auto_29785 )
      ( MAKE-3CRATE-VERIFY ?auto_29782 ?auto_29783 ?auto_29784 ?auto_29785 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29794 - SURFACE
      ?auto_29795 - SURFACE
      ?auto_29796 - SURFACE
      ?auto_29797 - SURFACE
      ?auto_29798 - SURFACE
    )
    :vars
    (
      ?auto_29805 - HOIST
      ?auto_29800 - PLACE
      ?auto_29803 - PLACE
      ?auto_29801 - HOIST
      ?auto_29804 - SURFACE
      ?auto_29806 - TRUCK
      ?auto_29802 - PLACE
      ?auto_29799 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29805 ?auto_29800 ) ( IS-CRATE ?auto_29798 ) ( not ( = ?auto_29797 ?auto_29798 ) ) ( not ( = ?auto_29796 ?auto_29797 ) ) ( not ( = ?auto_29796 ?auto_29798 ) ) ( not ( = ?auto_29803 ?auto_29800 ) ) ( HOIST-AT ?auto_29801 ?auto_29803 ) ( not ( = ?auto_29805 ?auto_29801 ) ) ( AVAILABLE ?auto_29801 ) ( SURFACE-AT ?auto_29798 ?auto_29803 ) ( ON ?auto_29798 ?auto_29804 ) ( CLEAR ?auto_29798 ) ( not ( = ?auto_29797 ?auto_29804 ) ) ( not ( = ?auto_29798 ?auto_29804 ) ) ( not ( = ?auto_29796 ?auto_29804 ) ) ( SURFACE-AT ?auto_29796 ?auto_29800 ) ( CLEAR ?auto_29796 ) ( IS-CRATE ?auto_29797 ) ( AVAILABLE ?auto_29805 ) ( TRUCK-AT ?auto_29806 ?auto_29802 ) ( not ( = ?auto_29802 ?auto_29800 ) ) ( not ( = ?auto_29803 ?auto_29802 ) ) ( HOIST-AT ?auto_29799 ?auto_29802 ) ( LIFTING ?auto_29799 ?auto_29797 ) ( not ( = ?auto_29805 ?auto_29799 ) ) ( not ( = ?auto_29801 ?auto_29799 ) ) ( ON ?auto_29795 ?auto_29794 ) ( ON ?auto_29796 ?auto_29795 ) ( not ( = ?auto_29794 ?auto_29795 ) ) ( not ( = ?auto_29794 ?auto_29796 ) ) ( not ( = ?auto_29794 ?auto_29797 ) ) ( not ( = ?auto_29794 ?auto_29798 ) ) ( not ( = ?auto_29794 ?auto_29804 ) ) ( not ( = ?auto_29795 ?auto_29796 ) ) ( not ( = ?auto_29795 ?auto_29797 ) ) ( not ( = ?auto_29795 ?auto_29798 ) ) ( not ( = ?auto_29795 ?auto_29804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29796 ?auto_29797 ?auto_29798 )
      ( MAKE-4CRATE-VERIFY ?auto_29794 ?auto_29795 ?auto_29796 ?auto_29797 ?auto_29798 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29807 - SURFACE
      ?auto_29808 - SURFACE
    )
    :vars
    (
      ?auto_29816 - HOIST
      ?auto_29811 - PLACE
      ?auto_29809 - SURFACE
      ?auto_29814 - PLACE
      ?auto_29812 - HOIST
      ?auto_29815 - SURFACE
      ?auto_29817 - TRUCK
      ?auto_29813 - PLACE
      ?auto_29810 - HOIST
      ?auto_29818 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29816 ?auto_29811 ) ( IS-CRATE ?auto_29808 ) ( not ( = ?auto_29807 ?auto_29808 ) ) ( not ( = ?auto_29809 ?auto_29807 ) ) ( not ( = ?auto_29809 ?auto_29808 ) ) ( not ( = ?auto_29814 ?auto_29811 ) ) ( HOIST-AT ?auto_29812 ?auto_29814 ) ( not ( = ?auto_29816 ?auto_29812 ) ) ( AVAILABLE ?auto_29812 ) ( SURFACE-AT ?auto_29808 ?auto_29814 ) ( ON ?auto_29808 ?auto_29815 ) ( CLEAR ?auto_29808 ) ( not ( = ?auto_29807 ?auto_29815 ) ) ( not ( = ?auto_29808 ?auto_29815 ) ) ( not ( = ?auto_29809 ?auto_29815 ) ) ( SURFACE-AT ?auto_29809 ?auto_29811 ) ( CLEAR ?auto_29809 ) ( IS-CRATE ?auto_29807 ) ( AVAILABLE ?auto_29816 ) ( TRUCK-AT ?auto_29817 ?auto_29813 ) ( not ( = ?auto_29813 ?auto_29811 ) ) ( not ( = ?auto_29814 ?auto_29813 ) ) ( HOIST-AT ?auto_29810 ?auto_29813 ) ( not ( = ?auto_29816 ?auto_29810 ) ) ( not ( = ?auto_29812 ?auto_29810 ) ) ( AVAILABLE ?auto_29810 ) ( SURFACE-AT ?auto_29807 ?auto_29813 ) ( ON ?auto_29807 ?auto_29818 ) ( CLEAR ?auto_29807 ) ( not ( = ?auto_29807 ?auto_29818 ) ) ( not ( = ?auto_29808 ?auto_29818 ) ) ( not ( = ?auto_29809 ?auto_29818 ) ) ( not ( = ?auto_29815 ?auto_29818 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29810 ?auto_29807 ?auto_29818 ?auto_29813 )
      ( MAKE-2CRATE ?auto_29809 ?auto_29807 ?auto_29808 )
      ( MAKE-1CRATE-VERIFY ?auto_29807 ?auto_29808 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29819 - SURFACE
      ?auto_29820 - SURFACE
      ?auto_29821 - SURFACE
    )
    :vars
    (
      ?auto_29822 - HOIST
      ?auto_29828 - PLACE
      ?auto_29826 - PLACE
      ?auto_29830 - HOIST
      ?auto_29823 - SURFACE
      ?auto_29829 - TRUCK
      ?auto_29824 - PLACE
      ?auto_29825 - HOIST
      ?auto_29827 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29822 ?auto_29828 ) ( IS-CRATE ?auto_29821 ) ( not ( = ?auto_29820 ?auto_29821 ) ) ( not ( = ?auto_29819 ?auto_29820 ) ) ( not ( = ?auto_29819 ?auto_29821 ) ) ( not ( = ?auto_29826 ?auto_29828 ) ) ( HOIST-AT ?auto_29830 ?auto_29826 ) ( not ( = ?auto_29822 ?auto_29830 ) ) ( AVAILABLE ?auto_29830 ) ( SURFACE-AT ?auto_29821 ?auto_29826 ) ( ON ?auto_29821 ?auto_29823 ) ( CLEAR ?auto_29821 ) ( not ( = ?auto_29820 ?auto_29823 ) ) ( not ( = ?auto_29821 ?auto_29823 ) ) ( not ( = ?auto_29819 ?auto_29823 ) ) ( SURFACE-AT ?auto_29819 ?auto_29828 ) ( CLEAR ?auto_29819 ) ( IS-CRATE ?auto_29820 ) ( AVAILABLE ?auto_29822 ) ( TRUCK-AT ?auto_29829 ?auto_29824 ) ( not ( = ?auto_29824 ?auto_29828 ) ) ( not ( = ?auto_29826 ?auto_29824 ) ) ( HOIST-AT ?auto_29825 ?auto_29824 ) ( not ( = ?auto_29822 ?auto_29825 ) ) ( not ( = ?auto_29830 ?auto_29825 ) ) ( AVAILABLE ?auto_29825 ) ( SURFACE-AT ?auto_29820 ?auto_29824 ) ( ON ?auto_29820 ?auto_29827 ) ( CLEAR ?auto_29820 ) ( not ( = ?auto_29820 ?auto_29827 ) ) ( not ( = ?auto_29821 ?auto_29827 ) ) ( not ( = ?auto_29819 ?auto_29827 ) ) ( not ( = ?auto_29823 ?auto_29827 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29820 ?auto_29821 )
      ( MAKE-2CRATE-VERIFY ?auto_29819 ?auto_29820 ?auto_29821 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29831 - SURFACE
      ?auto_29832 - SURFACE
      ?auto_29833 - SURFACE
      ?auto_29834 - SURFACE
    )
    :vars
    (
      ?auto_29839 - HOIST
      ?auto_29836 - PLACE
      ?auto_29842 - PLACE
      ?auto_29835 - HOIST
      ?auto_29843 - SURFACE
      ?auto_29837 - TRUCK
      ?auto_29838 - PLACE
      ?auto_29841 - HOIST
      ?auto_29840 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29839 ?auto_29836 ) ( IS-CRATE ?auto_29834 ) ( not ( = ?auto_29833 ?auto_29834 ) ) ( not ( = ?auto_29832 ?auto_29833 ) ) ( not ( = ?auto_29832 ?auto_29834 ) ) ( not ( = ?auto_29842 ?auto_29836 ) ) ( HOIST-AT ?auto_29835 ?auto_29842 ) ( not ( = ?auto_29839 ?auto_29835 ) ) ( AVAILABLE ?auto_29835 ) ( SURFACE-AT ?auto_29834 ?auto_29842 ) ( ON ?auto_29834 ?auto_29843 ) ( CLEAR ?auto_29834 ) ( not ( = ?auto_29833 ?auto_29843 ) ) ( not ( = ?auto_29834 ?auto_29843 ) ) ( not ( = ?auto_29832 ?auto_29843 ) ) ( SURFACE-AT ?auto_29832 ?auto_29836 ) ( CLEAR ?auto_29832 ) ( IS-CRATE ?auto_29833 ) ( AVAILABLE ?auto_29839 ) ( TRUCK-AT ?auto_29837 ?auto_29838 ) ( not ( = ?auto_29838 ?auto_29836 ) ) ( not ( = ?auto_29842 ?auto_29838 ) ) ( HOIST-AT ?auto_29841 ?auto_29838 ) ( not ( = ?auto_29839 ?auto_29841 ) ) ( not ( = ?auto_29835 ?auto_29841 ) ) ( AVAILABLE ?auto_29841 ) ( SURFACE-AT ?auto_29833 ?auto_29838 ) ( ON ?auto_29833 ?auto_29840 ) ( CLEAR ?auto_29833 ) ( not ( = ?auto_29833 ?auto_29840 ) ) ( not ( = ?auto_29834 ?auto_29840 ) ) ( not ( = ?auto_29832 ?auto_29840 ) ) ( not ( = ?auto_29843 ?auto_29840 ) ) ( ON ?auto_29832 ?auto_29831 ) ( not ( = ?auto_29831 ?auto_29832 ) ) ( not ( = ?auto_29831 ?auto_29833 ) ) ( not ( = ?auto_29831 ?auto_29834 ) ) ( not ( = ?auto_29831 ?auto_29843 ) ) ( not ( = ?auto_29831 ?auto_29840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29832 ?auto_29833 ?auto_29834 )
      ( MAKE-3CRATE-VERIFY ?auto_29831 ?auto_29832 ?auto_29833 ?auto_29834 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29844 - SURFACE
      ?auto_29845 - SURFACE
      ?auto_29846 - SURFACE
      ?auto_29847 - SURFACE
      ?auto_29848 - SURFACE
    )
    :vars
    (
      ?auto_29853 - HOIST
      ?auto_29850 - PLACE
      ?auto_29856 - PLACE
      ?auto_29849 - HOIST
      ?auto_29857 - SURFACE
      ?auto_29851 - TRUCK
      ?auto_29852 - PLACE
      ?auto_29855 - HOIST
      ?auto_29854 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29853 ?auto_29850 ) ( IS-CRATE ?auto_29848 ) ( not ( = ?auto_29847 ?auto_29848 ) ) ( not ( = ?auto_29846 ?auto_29847 ) ) ( not ( = ?auto_29846 ?auto_29848 ) ) ( not ( = ?auto_29856 ?auto_29850 ) ) ( HOIST-AT ?auto_29849 ?auto_29856 ) ( not ( = ?auto_29853 ?auto_29849 ) ) ( AVAILABLE ?auto_29849 ) ( SURFACE-AT ?auto_29848 ?auto_29856 ) ( ON ?auto_29848 ?auto_29857 ) ( CLEAR ?auto_29848 ) ( not ( = ?auto_29847 ?auto_29857 ) ) ( not ( = ?auto_29848 ?auto_29857 ) ) ( not ( = ?auto_29846 ?auto_29857 ) ) ( SURFACE-AT ?auto_29846 ?auto_29850 ) ( CLEAR ?auto_29846 ) ( IS-CRATE ?auto_29847 ) ( AVAILABLE ?auto_29853 ) ( TRUCK-AT ?auto_29851 ?auto_29852 ) ( not ( = ?auto_29852 ?auto_29850 ) ) ( not ( = ?auto_29856 ?auto_29852 ) ) ( HOIST-AT ?auto_29855 ?auto_29852 ) ( not ( = ?auto_29853 ?auto_29855 ) ) ( not ( = ?auto_29849 ?auto_29855 ) ) ( AVAILABLE ?auto_29855 ) ( SURFACE-AT ?auto_29847 ?auto_29852 ) ( ON ?auto_29847 ?auto_29854 ) ( CLEAR ?auto_29847 ) ( not ( = ?auto_29847 ?auto_29854 ) ) ( not ( = ?auto_29848 ?auto_29854 ) ) ( not ( = ?auto_29846 ?auto_29854 ) ) ( not ( = ?auto_29857 ?auto_29854 ) ) ( ON ?auto_29845 ?auto_29844 ) ( ON ?auto_29846 ?auto_29845 ) ( not ( = ?auto_29844 ?auto_29845 ) ) ( not ( = ?auto_29844 ?auto_29846 ) ) ( not ( = ?auto_29844 ?auto_29847 ) ) ( not ( = ?auto_29844 ?auto_29848 ) ) ( not ( = ?auto_29844 ?auto_29857 ) ) ( not ( = ?auto_29844 ?auto_29854 ) ) ( not ( = ?auto_29845 ?auto_29846 ) ) ( not ( = ?auto_29845 ?auto_29847 ) ) ( not ( = ?auto_29845 ?auto_29848 ) ) ( not ( = ?auto_29845 ?auto_29857 ) ) ( not ( = ?auto_29845 ?auto_29854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29846 ?auto_29847 ?auto_29848 )
      ( MAKE-4CRATE-VERIFY ?auto_29844 ?auto_29845 ?auto_29846 ?auto_29847 ?auto_29848 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29858 - SURFACE
      ?auto_29859 - SURFACE
    )
    :vars
    (
      ?auto_29864 - HOIST
      ?auto_29861 - PLACE
      ?auto_29865 - SURFACE
      ?auto_29868 - PLACE
      ?auto_29860 - HOIST
      ?auto_29869 - SURFACE
      ?auto_29863 - PLACE
      ?auto_29867 - HOIST
      ?auto_29866 - SURFACE
      ?auto_29862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29864 ?auto_29861 ) ( IS-CRATE ?auto_29859 ) ( not ( = ?auto_29858 ?auto_29859 ) ) ( not ( = ?auto_29865 ?auto_29858 ) ) ( not ( = ?auto_29865 ?auto_29859 ) ) ( not ( = ?auto_29868 ?auto_29861 ) ) ( HOIST-AT ?auto_29860 ?auto_29868 ) ( not ( = ?auto_29864 ?auto_29860 ) ) ( AVAILABLE ?auto_29860 ) ( SURFACE-AT ?auto_29859 ?auto_29868 ) ( ON ?auto_29859 ?auto_29869 ) ( CLEAR ?auto_29859 ) ( not ( = ?auto_29858 ?auto_29869 ) ) ( not ( = ?auto_29859 ?auto_29869 ) ) ( not ( = ?auto_29865 ?auto_29869 ) ) ( SURFACE-AT ?auto_29865 ?auto_29861 ) ( CLEAR ?auto_29865 ) ( IS-CRATE ?auto_29858 ) ( AVAILABLE ?auto_29864 ) ( not ( = ?auto_29863 ?auto_29861 ) ) ( not ( = ?auto_29868 ?auto_29863 ) ) ( HOIST-AT ?auto_29867 ?auto_29863 ) ( not ( = ?auto_29864 ?auto_29867 ) ) ( not ( = ?auto_29860 ?auto_29867 ) ) ( AVAILABLE ?auto_29867 ) ( SURFACE-AT ?auto_29858 ?auto_29863 ) ( ON ?auto_29858 ?auto_29866 ) ( CLEAR ?auto_29858 ) ( not ( = ?auto_29858 ?auto_29866 ) ) ( not ( = ?auto_29859 ?auto_29866 ) ) ( not ( = ?auto_29865 ?auto_29866 ) ) ( not ( = ?auto_29869 ?auto_29866 ) ) ( TRUCK-AT ?auto_29862 ?auto_29861 ) )
    :subtasks
    ( ( !DRIVE ?auto_29862 ?auto_29861 ?auto_29863 )
      ( MAKE-2CRATE ?auto_29865 ?auto_29858 ?auto_29859 )
      ( MAKE-1CRATE-VERIFY ?auto_29858 ?auto_29859 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29870 - SURFACE
      ?auto_29871 - SURFACE
      ?auto_29872 - SURFACE
    )
    :vars
    (
      ?auto_29876 - HOIST
      ?auto_29874 - PLACE
      ?auto_29873 - PLACE
      ?auto_29877 - HOIST
      ?auto_29880 - SURFACE
      ?auto_29881 - PLACE
      ?auto_29878 - HOIST
      ?auto_29875 - SURFACE
      ?auto_29879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29876 ?auto_29874 ) ( IS-CRATE ?auto_29872 ) ( not ( = ?auto_29871 ?auto_29872 ) ) ( not ( = ?auto_29870 ?auto_29871 ) ) ( not ( = ?auto_29870 ?auto_29872 ) ) ( not ( = ?auto_29873 ?auto_29874 ) ) ( HOIST-AT ?auto_29877 ?auto_29873 ) ( not ( = ?auto_29876 ?auto_29877 ) ) ( AVAILABLE ?auto_29877 ) ( SURFACE-AT ?auto_29872 ?auto_29873 ) ( ON ?auto_29872 ?auto_29880 ) ( CLEAR ?auto_29872 ) ( not ( = ?auto_29871 ?auto_29880 ) ) ( not ( = ?auto_29872 ?auto_29880 ) ) ( not ( = ?auto_29870 ?auto_29880 ) ) ( SURFACE-AT ?auto_29870 ?auto_29874 ) ( CLEAR ?auto_29870 ) ( IS-CRATE ?auto_29871 ) ( AVAILABLE ?auto_29876 ) ( not ( = ?auto_29881 ?auto_29874 ) ) ( not ( = ?auto_29873 ?auto_29881 ) ) ( HOIST-AT ?auto_29878 ?auto_29881 ) ( not ( = ?auto_29876 ?auto_29878 ) ) ( not ( = ?auto_29877 ?auto_29878 ) ) ( AVAILABLE ?auto_29878 ) ( SURFACE-AT ?auto_29871 ?auto_29881 ) ( ON ?auto_29871 ?auto_29875 ) ( CLEAR ?auto_29871 ) ( not ( = ?auto_29871 ?auto_29875 ) ) ( not ( = ?auto_29872 ?auto_29875 ) ) ( not ( = ?auto_29870 ?auto_29875 ) ) ( not ( = ?auto_29880 ?auto_29875 ) ) ( TRUCK-AT ?auto_29879 ?auto_29874 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29871 ?auto_29872 )
      ( MAKE-2CRATE-VERIFY ?auto_29870 ?auto_29871 ?auto_29872 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29882 - SURFACE
      ?auto_29883 - SURFACE
      ?auto_29884 - SURFACE
      ?auto_29885 - SURFACE
    )
    :vars
    (
      ?auto_29886 - HOIST
      ?auto_29888 - PLACE
      ?auto_29890 - PLACE
      ?auto_29892 - HOIST
      ?auto_29889 - SURFACE
      ?auto_29887 - PLACE
      ?auto_29894 - HOIST
      ?auto_29893 - SURFACE
      ?auto_29891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29886 ?auto_29888 ) ( IS-CRATE ?auto_29885 ) ( not ( = ?auto_29884 ?auto_29885 ) ) ( not ( = ?auto_29883 ?auto_29884 ) ) ( not ( = ?auto_29883 ?auto_29885 ) ) ( not ( = ?auto_29890 ?auto_29888 ) ) ( HOIST-AT ?auto_29892 ?auto_29890 ) ( not ( = ?auto_29886 ?auto_29892 ) ) ( AVAILABLE ?auto_29892 ) ( SURFACE-AT ?auto_29885 ?auto_29890 ) ( ON ?auto_29885 ?auto_29889 ) ( CLEAR ?auto_29885 ) ( not ( = ?auto_29884 ?auto_29889 ) ) ( not ( = ?auto_29885 ?auto_29889 ) ) ( not ( = ?auto_29883 ?auto_29889 ) ) ( SURFACE-AT ?auto_29883 ?auto_29888 ) ( CLEAR ?auto_29883 ) ( IS-CRATE ?auto_29884 ) ( AVAILABLE ?auto_29886 ) ( not ( = ?auto_29887 ?auto_29888 ) ) ( not ( = ?auto_29890 ?auto_29887 ) ) ( HOIST-AT ?auto_29894 ?auto_29887 ) ( not ( = ?auto_29886 ?auto_29894 ) ) ( not ( = ?auto_29892 ?auto_29894 ) ) ( AVAILABLE ?auto_29894 ) ( SURFACE-AT ?auto_29884 ?auto_29887 ) ( ON ?auto_29884 ?auto_29893 ) ( CLEAR ?auto_29884 ) ( not ( = ?auto_29884 ?auto_29893 ) ) ( not ( = ?auto_29885 ?auto_29893 ) ) ( not ( = ?auto_29883 ?auto_29893 ) ) ( not ( = ?auto_29889 ?auto_29893 ) ) ( TRUCK-AT ?auto_29891 ?auto_29888 ) ( ON ?auto_29883 ?auto_29882 ) ( not ( = ?auto_29882 ?auto_29883 ) ) ( not ( = ?auto_29882 ?auto_29884 ) ) ( not ( = ?auto_29882 ?auto_29885 ) ) ( not ( = ?auto_29882 ?auto_29889 ) ) ( not ( = ?auto_29882 ?auto_29893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29883 ?auto_29884 ?auto_29885 )
      ( MAKE-3CRATE-VERIFY ?auto_29882 ?auto_29883 ?auto_29884 ?auto_29885 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29895 - SURFACE
      ?auto_29896 - SURFACE
      ?auto_29897 - SURFACE
      ?auto_29898 - SURFACE
      ?auto_29899 - SURFACE
    )
    :vars
    (
      ?auto_29900 - HOIST
      ?auto_29902 - PLACE
      ?auto_29904 - PLACE
      ?auto_29906 - HOIST
      ?auto_29903 - SURFACE
      ?auto_29901 - PLACE
      ?auto_29908 - HOIST
      ?auto_29907 - SURFACE
      ?auto_29905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29900 ?auto_29902 ) ( IS-CRATE ?auto_29899 ) ( not ( = ?auto_29898 ?auto_29899 ) ) ( not ( = ?auto_29897 ?auto_29898 ) ) ( not ( = ?auto_29897 ?auto_29899 ) ) ( not ( = ?auto_29904 ?auto_29902 ) ) ( HOIST-AT ?auto_29906 ?auto_29904 ) ( not ( = ?auto_29900 ?auto_29906 ) ) ( AVAILABLE ?auto_29906 ) ( SURFACE-AT ?auto_29899 ?auto_29904 ) ( ON ?auto_29899 ?auto_29903 ) ( CLEAR ?auto_29899 ) ( not ( = ?auto_29898 ?auto_29903 ) ) ( not ( = ?auto_29899 ?auto_29903 ) ) ( not ( = ?auto_29897 ?auto_29903 ) ) ( SURFACE-AT ?auto_29897 ?auto_29902 ) ( CLEAR ?auto_29897 ) ( IS-CRATE ?auto_29898 ) ( AVAILABLE ?auto_29900 ) ( not ( = ?auto_29901 ?auto_29902 ) ) ( not ( = ?auto_29904 ?auto_29901 ) ) ( HOIST-AT ?auto_29908 ?auto_29901 ) ( not ( = ?auto_29900 ?auto_29908 ) ) ( not ( = ?auto_29906 ?auto_29908 ) ) ( AVAILABLE ?auto_29908 ) ( SURFACE-AT ?auto_29898 ?auto_29901 ) ( ON ?auto_29898 ?auto_29907 ) ( CLEAR ?auto_29898 ) ( not ( = ?auto_29898 ?auto_29907 ) ) ( not ( = ?auto_29899 ?auto_29907 ) ) ( not ( = ?auto_29897 ?auto_29907 ) ) ( not ( = ?auto_29903 ?auto_29907 ) ) ( TRUCK-AT ?auto_29905 ?auto_29902 ) ( ON ?auto_29896 ?auto_29895 ) ( ON ?auto_29897 ?auto_29896 ) ( not ( = ?auto_29895 ?auto_29896 ) ) ( not ( = ?auto_29895 ?auto_29897 ) ) ( not ( = ?auto_29895 ?auto_29898 ) ) ( not ( = ?auto_29895 ?auto_29899 ) ) ( not ( = ?auto_29895 ?auto_29903 ) ) ( not ( = ?auto_29895 ?auto_29907 ) ) ( not ( = ?auto_29896 ?auto_29897 ) ) ( not ( = ?auto_29896 ?auto_29898 ) ) ( not ( = ?auto_29896 ?auto_29899 ) ) ( not ( = ?auto_29896 ?auto_29903 ) ) ( not ( = ?auto_29896 ?auto_29907 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29897 ?auto_29898 ?auto_29899 )
      ( MAKE-4CRATE-VERIFY ?auto_29895 ?auto_29896 ?auto_29897 ?auto_29898 ?auto_29899 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29909 - SURFACE
      ?auto_29910 - SURFACE
    )
    :vars
    (
      ?auto_29911 - HOIST
      ?auto_29913 - PLACE
      ?auto_29915 - SURFACE
      ?auto_29916 - PLACE
      ?auto_29918 - HOIST
      ?auto_29914 - SURFACE
      ?auto_29912 - PLACE
      ?auto_29920 - HOIST
      ?auto_29919 - SURFACE
      ?auto_29917 - TRUCK
      ?auto_29921 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29911 ?auto_29913 ) ( IS-CRATE ?auto_29910 ) ( not ( = ?auto_29909 ?auto_29910 ) ) ( not ( = ?auto_29915 ?auto_29909 ) ) ( not ( = ?auto_29915 ?auto_29910 ) ) ( not ( = ?auto_29916 ?auto_29913 ) ) ( HOIST-AT ?auto_29918 ?auto_29916 ) ( not ( = ?auto_29911 ?auto_29918 ) ) ( AVAILABLE ?auto_29918 ) ( SURFACE-AT ?auto_29910 ?auto_29916 ) ( ON ?auto_29910 ?auto_29914 ) ( CLEAR ?auto_29910 ) ( not ( = ?auto_29909 ?auto_29914 ) ) ( not ( = ?auto_29910 ?auto_29914 ) ) ( not ( = ?auto_29915 ?auto_29914 ) ) ( IS-CRATE ?auto_29909 ) ( not ( = ?auto_29912 ?auto_29913 ) ) ( not ( = ?auto_29916 ?auto_29912 ) ) ( HOIST-AT ?auto_29920 ?auto_29912 ) ( not ( = ?auto_29911 ?auto_29920 ) ) ( not ( = ?auto_29918 ?auto_29920 ) ) ( AVAILABLE ?auto_29920 ) ( SURFACE-AT ?auto_29909 ?auto_29912 ) ( ON ?auto_29909 ?auto_29919 ) ( CLEAR ?auto_29909 ) ( not ( = ?auto_29909 ?auto_29919 ) ) ( not ( = ?auto_29910 ?auto_29919 ) ) ( not ( = ?auto_29915 ?auto_29919 ) ) ( not ( = ?auto_29914 ?auto_29919 ) ) ( TRUCK-AT ?auto_29917 ?auto_29913 ) ( SURFACE-AT ?auto_29921 ?auto_29913 ) ( CLEAR ?auto_29921 ) ( LIFTING ?auto_29911 ?auto_29915 ) ( IS-CRATE ?auto_29915 ) ( not ( = ?auto_29921 ?auto_29915 ) ) ( not ( = ?auto_29909 ?auto_29921 ) ) ( not ( = ?auto_29910 ?auto_29921 ) ) ( not ( = ?auto_29914 ?auto_29921 ) ) ( not ( = ?auto_29919 ?auto_29921 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29921 ?auto_29915 )
      ( MAKE-2CRATE ?auto_29915 ?auto_29909 ?auto_29910 )
      ( MAKE-1CRATE-VERIFY ?auto_29909 ?auto_29910 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29922 - SURFACE
      ?auto_29923 - SURFACE
      ?auto_29924 - SURFACE
    )
    :vars
    (
      ?auto_29926 - HOIST
      ?auto_29930 - PLACE
      ?auto_29927 - PLACE
      ?auto_29932 - HOIST
      ?auto_29925 - SURFACE
      ?auto_29934 - PLACE
      ?auto_29929 - HOIST
      ?auto_29933 - SURFACE
      ?auto_29931 - TRUCK
      ?auto_29928 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29926 ?auto_29930 ) ( IS-CRATE ?auto_29924 ) ( not ( = ?auto_29923 ?auto_29924 ) ) ( not ( = ?auto_29922 ?auto_29923 ) ) ( not ( = ?auto_29922 ?auto_29924 ) ) ( not ( = ?auto_29927 ?auto_29930 ) ) ( HOIST-AT ?auto_29932 ?auto_29927 ) ( not ( = ?auto_29926 ?auto_29932 ) ) ( AVAILABLE ?auto_29932 ) ( SURFACE-AT ?auto_29924 ?auto_29927 ) ( ON ?auto_29924 ?auto_29925 ) ( CLEAR ?auto_29924 ) ( not ( = ?auto_29923 ?auto_29925 ) ) ( not ( = ?auto_29924 ?auto_29925 ) ) ( not ( = ?auto_29922 ?auto_29925 ) ) ( IS-CRATE ?auto_29923 ) ( not ( = ?auto_29934 ?auto_29930 ) ) ( not ( = ?auto_29927 ?auto_29934 ) ) ( HOIST-AT ?auto_29929 ?auto_29934 ) ( not ( = ?auto_29926 ?auto_29929 ) ) ( not ( = ?auto_29932 ?auto_29929 ) ) ( AVAILABLE ?auto_29929 ) ( SURFACE-AT ?auto_29923 ?auto_29934 ) ( ON ?auto_29923 ?auto_29933 ) ( CLEAR ?auto_29923 ) ( not ( = ?auto_29923 ?auto_29933 ) ) ( not ( = ?auto_29924 ?auto_29933 ) ) ( not ( = ?auto_29922 ?auto_29933 ) ) ( not ( = ?auto_29925 ?auto_29933 ) ) ( TRUCK-AT ?auto_29931 ?auto_29930 ) ( SURFACE-AT ?auto_29928 ?auto_29930 ) ( CLEAR ?auto_29928 ) ( LIFTING ?auto_29926 ?auto_29922 ) ( IS-CRATE ?auto_29922 ) ( not ( = ?auto_29928 ?auto_29922 ) ) ( not ( = ?auto_29923 ?auto_29928 ) ) ( not ( = ?auto_29924 ?auto_29928 ) ) ( not ( = ?auto_29925 ?auto_29928 ) ) ( not ( = ?auto_29933 ?auto_29928 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29923 ?auto_29924 )
      ( MAKE-2CRATE-VERIFY ?auto_29922 ?auto_29923 ?auto_29924 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29935 - SURFACE
      ?auto_29936 - SURFACE
      ?auto_29937 - SURFACE
      ?auto_29938 - SURFACE
    )
    :vars
    (
      ?auto_29943 - HOIST
      ?auto_29941 - PLACE
      ?auto_29942 - PLACE
      ?auto_29946 - HOIST
      ?auto_29939 - SURFACE
      ?auto_29945 - PLACE
      ?auto_29944 - HOIST
      ?auto_29947 - SURFACE
      ?auto_29940 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29943 ?auto_29941 ) ( IS-CRATE ?auto_29938 ) ( not ( = ?auto_29937 ?auto_29938 ) ) ( not ( = ?auto_29936 ?auto_29937 ) ) ( not ( = ?auto_29936 ?auto_29938 ) ) ( not ( = ?auto_29942 ?auto_29941 ) ) ( HOIST-AT ?auto_29946 ?auto_29942 ) ( not ( = ?auto_29943 ?auto_29946 ) ) ( AVAILABLE ?auto_29946 ) ( SURFACE-AT ?auto_29938 ?auto_29942 ) ( ON ?auto_29938 ?auto_29939 ) ( CLEAR ?auto_29938 ) ( not ( = ?auto_29937 ?auto_29939 ) ) ( not ( = ?auto_29938 ?auto_29939 ) ) ( not ( = ?auto_29936 ?auto_29939 ) ) ( IS-CRATE ?auto_29937 ) ( not ( = ?auto_29945 ?auto_29941 ) ) ( not ( = ?auto_29942 ?auto_29945 ) ) ( HOIST-AT ?auto_29944 ?auto_29945 ) ( not ( = ?auto_29943 ?auto_29944 ) ) ( not ( = ?auto_29946 ?auto_29944 ) ) ( AVAILABLE ?auto_29944 ) ( SURFACE-AT ?auto_29937 ?auto_29945 ) ( ON ?auto_29937 ?auto_29947 ) ( CLEAR ?auto_29937 ) ( not ( = ?auto_29937 ?auto_29947 ) ) ( not ( = ?auto_29938 ?auto_29947 ) ) ( not ( = ?auto_29936 ?auto_29947 ) ) ( not ( = ?auto_29939 ?auto_29947 ) ) ( TRUCK-AT ?auto_29940 ?auto_29941 ) ( SURFACE-AT ?auto_29935 ?auto_29941 ) ( CLEAR ?auto_29935 ) ( LIFTING ?auto_29943 ?auto_29936 ) ( IS-CRATE ?auto_29936 ) ( not ( = ?auto_29935 ?auto_29936 ) ) ( not ( = ?auto_29937 ?auto_29935 ) ) ( not ( = ?auto_29938 ?auto_29935 ) ) ( not ( = ?auto_29939 ?auto_29935 ) ) ( not ( = ?auto_29947 ?auto_29935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29936 ?auto_29937 ?auto_29938 )
      ( MAKE-3CRATE-VERIFY ?auto_29935 ?auto_29936 ?auto_29937 ?auto_29938 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29948 - SURFACE
      ?auto_29949 - SURFACE
      ?auto_29950 - SURFACE
      ?auto_29951 - SURFACE
      ?auto_29952 - SURFACE
    )
    :vars
    (
      ?auto_29957 - HOIST
      ?auto_29955 - PLACE
      ?auto_29956 - PLACE
      ?auto_29960 - HOIST
      ?auto_29953 - SURFACE
      ?auto_29959 - PLACE
      ?auto_29958 - HOIST
      ?auto_29961 - SURFACE
      ?auto_29954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29957 ?auto_29955 ) ( IS-CRATE ?auto_29952 ) ( not ( = ?auto_29951 ?auto_29952 ) ) ( not ( = ?auto_29950 ?auto_29951 ) ) ( not ( = ?auto_29950 ?auto_29952 ) ) ( not ( = ?auto_29956 ?auto_29955 ) ) ( HOIST-AT ?auto_29960 ?auto_29956 ) ( not ( = ?auto_29957 ?auto_29960 ) ) ( AVAILABLE ?auto_29960 ) ( SURFACE-AT ?auto_29952 ?auto_29956 ) ( ON ?auto_29952 ?auto_29953 ) ( CLEAR ?auto_29952 ) ( not ( = ?auto_29951 ?auto_29953 ) ) ( not ( = ?auto_29952 ?auto_29953 ) ) ( not ( = ?auto_29950 ?auto_29953 ) ) ( IS-CRATE ?auto_29951 ) ( not ( = ?auto_29959 ?auto_29955 ) ) ( not ( = ?auto_29956 ?auto_29959 ) ) ( HOIST-AT ?auto_29958 ?auto_29959 ) ( not ( = ?auto_29957 ?auto_29958 ) ) ( not ( = ?auto_29960 ?auto_29958 ) ) ( AVAILABLE ?auto_29958 ) ( SURFACE-AT ?auto_29951 ?auto_29959 ) ( ON ?auto_29951 ?auto_29961 ) ( CLEAR ?auto_29951 ) ( not ( = ?auto_29951 ?auto_29961 ) ) ( not ( = ?auto_29952 ?auto_29961 ) ) ( not ( = ?auto_29950 ?auto_29961 ) ) ( not ( = ?auto_29953 ?auto_29961 ) ) ( TRUCK-AT ?auto_29954 ?auto_29955 ) ( SURFACE-AT ?auto_29949 ?auto_29955 ) ( CLEAR ?auto_29949 ) ( LIFTING ?auto_29957 ?auto_29950 ) ( IS-CRATE ?auto_29950 ) ( not ( = ?auto_29949 ?auto_29950 ) ) ( not ( = ?auto_29951 ?auto_29949 ) ) ( not ( = ?auto_29952 ?auto_29949 ) ) ( not ( = ?auto_29953 ?auto_29949 ) ) ( not ( = ?auto_29961 ?auto_29949 ) ) ( ON ?auto_29949 ?auto_29948 ) ( not ( = ?auto_29948 ?auto_29949 ) ) ( not ( = ?auto_29948 ?auto_29950 ) ) ( not ( = ?auto_29948 ?auto_29951 ) ) ( not ( = ?auto_29948 ?auto_29952 ) ) ( not ( = ?auto_29948 ?auto_29953 ) ) ( not ( = ?auto_29948 ?auto_29961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29950 ?auto_29951 ?auto_29952 )
      ( MAKE-4CRATE-VERIFY ?auto_29948 ?auto_29949 ?auto_29950 ?auto_29951 ?auto_29952 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29962 - SURFACE
      ?auto_29963 - SURFACE
    )
    :vars
    (
      ?auto_29969 - HOIST
      ?auto_29967 - PLACE
      ?auto_29971 - SURFACE
      ?auto_29968 - PLACE
      ?auto_29973 - HOIST
      ?auto_29965 - SURFACE
      ?auto_29972 - PLACE
      ?auto_29970 - HOIST
      ?auto_29974 - SURFACE
      ?auto_29966 - TRUCK
      ?auto_29964 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29969 ?auto_29967 ) ( IS-CRATE ?auto_29963 ) ( not ( = ?auto_29962 ?auto_29963 ) ) ( not ( = ?auto_29971 ?auto_29962 ) ) ( not ( = ?auto_29971 ?auto_29963 ) ) ( not ( = ?auto_29968 ?auto_29967 ) ) ( HOIST-AT ?auto_29973 ?auto_29968 ) ( not ( = ?auto_29969 ?auto_29973 ) ) ( AVAILABLE ?auto_29973 ) ( SURFACE-AT ?auto_29963 ?auto_29968 ) ( ON ?auto_29963 ?auto_29965 ) ( CLEAR ?auto_29963 ) ( not ( = ?auto_29962 ?auto_29965 ) ) ( not ( = ?auto_29963 ?auto_29965 ) ) ( not ( = ?auto_29971 ?auto_29965 ) ) ( IS-CRATE ?auto_29962 ) ( not ( = ?auto_29972 ?auto_29967 ) ) ( not ( = ?auto_29968 ?auto_29972 ) ) ( HOIST-AT ?auto_29970 ?auto_29972 ) ( not ( = ?auto_29969 ?auto_29970 ) ) ( not ( = ?auto_29973 ?auto_29970 ) ) ( AVAILABLE ?auto_29970 ) ( SURFACE-AT ?auto_29962 ?auto_29972 ) ( ON ?auto_29962 ?auto_29974 ) ( CLEAR ?auto_29962 ) ( not ( = ?auto_29962 ?auto_29974 ) ) ( not ( = ?auto_29963 ?auto_29974 ) ) ( not ( = ?auto_29971 ?auto_29974 ) ) ( not ( = ?auto_29965 ?auto_29974 ) ) ( TRUCK-AT ?auto_29966 ?auto_29967 ) ( SURFACE-AT ?auto_29964 ?auto_29967 ) ( CLEAR ?auto_29964 ) ( IS-CRATE ?auto_29971 ) ( not ( = ?auto_29964 ?auto_29971 ) ) ( not ( = ?auto_29962 ?auto_29964 ) ) ( not ( = ?auto_29963 ?auto_29964 ) ) ( not ( = ?auto_29965 ?auto_29964 ) ) ( not ( = ?auto_29974 ?auto_29964 ) ) ( AVAILABLE ?auto_29969 ) ( IN ?auto_29971 ?auto_29966 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29969 ?auto_29971 ?auto_29966 ?auto_29967 )
      ( MAKE-2CRATE ?auto_29971 ?auto_29962 ?auto_29963 )
      ( MAKE-1CRATE-VERIFY ?auto_29962 ?auto_29963 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29975 - SURFACE
      ?auto_29976 - SURFACE
      ?auto_29977 - SURFACE
    )
    :vars
    (
      ?auto_29985 - HOIST
      ?auto_29984 - PLACE
      ?auto_29983 - PLACE
      ?auto_29981 - HOIST
      ?auto_29987 - SURFACE
      ?auto_29982 - PLACE
      ?auto_29980 - HOIST
      ?auto_29986 - SURFACE
      ?auto_29978 - TRUCK
      ?auto_29979 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29985 ?auto_29984 ) ( IS-CRATE ?auto_29977 ) ( not ( = ?auto_29976 ?auto_29977 ) ) ( not ( = ?auto_29975 ?auto_29976 ) ) ( not ( = ?auto_29975 ?auto_29977 ) ) ( not ( = ?auto_29983 ?auto_29984 ) ) ( HOIST-AT ?auto_29981 ?auto_29983 ) ( not ( = ?auto_29985 ?auto_29981 ) ) ( AVAILABLE ?auto_29981 ) ( SURFACE-AT ?auto_29977 ?auto_29983 ) ( ON ?auto_29977 ?auto_29987 ) ( CLEAR ?auto_29977 ) ( not ( = ?auto_29976 ?auto_29987 ) ) ( not ( = ?auto_29977 ?auto_29987 ) ) ( not ( = ?auto_29975 ?auto_29987 ) ) ( IS-CRATE ?auto_29976 ) ( not ( = ?auto_29982 ?auto_29984 ) ) ( not ( = ?auto_29983 ?auto_29982 ) ) ( HOIST-AT ?auto_29980 ?auto_29982 ) ( not ( = ?auto_29985 ?auto_29980 ) ) ( not ( = ?auto_29981 ?auto_29980 ) ) ( AVAILABLE ?auto_29980 ) ( SURFACE-AT ?auto_29976 ?auto_29982 ) ( ON ?auto_29976 ?auto_29986 ) ( CLEAR ?auto_29976 ) ( not ( = ?auto_29976 ?auto_29986 ) ) ( not ( = ?auto_29977 ?auto_29986 ) ) ( not ( = ?auto_29975 ?auto_29986 ) ) ( not ( = ?auto_29987 ?auto_29986 ) ) ( TRUCK-AT ?auto_29978 ?auto_29984 ) ( SURFACE-AT ?auto_29979 ?auto_29984 ) ( CLEAR ?auto_29979 ) ( IS-CRATE ?auto_29975 ) ( not ( = ?auto_29979 ?auto_29975 ) ) ( not ( = ?auto_29976 ?auto_29979 ) ) ( not ( = ?auto_29977 ?auto_29979 ) ) ( not ( = ?auto_29987 ?auto_29979 ) ) ( not ( = ?auto_29986 ?auto_29979 ) ) ( AVAILABLE ?auto_29985 ) ( IN ?auto_29975 ?auto_29978 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29976 ?auto_29977 )
      ( MAKE-2CRATE-VERIFY ?auto_29975 ?auto_29976 ?auto_29977 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29988 - SURFACE
      ?auto_29989 - SURFACE
      ?auto_29990 - SURFACE
      ?auto_29991 - SURFACE
    )
    :vars
    (
      ?auto_29993 - HOIST
      ?auto_29997 - PLACE
      ?auto_29999 - PLACE
      ?auto_29996 - HOIST
      ?auto_29994 - SURFACE
      ?auto_29992 - PLACE
      ?auto_29995 - HOIST
      ?auto_30000 - SURFACE
      ?auto_29998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29993 ?auto_29997 ) ( IS-CRATE ?auto_29991 ) ( not ( = ?auto_29990 ?auto_29991 ) ) ( not ( = ?auto_29989 ?auto_29990 ) ) ( not ( = ?auto_29989 ?auto_29991 ) ) ( not ( = ?auto_29999 ?auto_29997 ) ) ( HOIST-AT ?auto_29996 ?auto_29999 ) ( not ( = ?auto_29993 ?auto_29996 ) ) ( AVAILABLE ?auto_29996 ) ( SURFACE-AT ?auto_29991 ?auto_29999 ) ( ON ?auto_29991 ?auto_29994 ) ( CLEAR ?auto_29991 ) ( not ( = ?auto_29990 ?auto_29994 ) ) ( not ( = ?auto_29991 ?auto_29994 ) ) ( not ( = ?auto_29989 ?auto_29994 ) ) ( IS-CRATE ?auto_29990 ) ( not ( = ?auto_29992 ?auto_29997 ) ) ( not ( = ?auto_29999 ?auto_29992 ) ) ( HOIST-AT ?auto_29995 ?auto_29992 ) ( not ( = ?auto_29993 ?auto_29995 ) ) ( not ( = ?auto_29996 ?auto_29995 ) ) ( AVAILABLE ?auto_29995 ) ( SURFACE-AT ?auto_29990 ?auto_29992 ) ( ON ?auto_29990 ?auto_30000 ) ( CLEAR ?auto_29990 ) ( not ( = ?auto_29990 ?auto_30000 ) ) ( not ( = ?auto_29991 ?auto_30000 ) ) ( not ( = ?auto_29989 ?auto_30000 ) ) ( not ( = ?auto_29994 ?auto_30000 ) ) ( TRUCK-AT ?auto_29998 ?auto_29997 ) ( SURFACE-AT ?auto_29988 ?auto_29997 ) ( CLEAR ?auto_29988 ) ( IS-CRATE ?auto_29989 ) ( not ( = ?auto_29988 ?auto_29989 ) ) ( not ( = ?auto_29990 ?auto_29988 ) ) ( not ( = ?auto_29991 ?auto_29988 ) ) ( not ( = ?auto_29994 ?auto_29988 ) ) ( not ( = ?auto_30000 ?auto_29988 ) ) ( AVAILABLE ?auto_29993 ) ( IN ?auto_29989 ?auto_29998 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29989 ?auto_29990 ?auto_29991 )
      ( MAKE-3CRATE-VERIFY ?auto_29988 ?auto_29989 ?auto_29990 ?auto_29991 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30001 - SURFACE
      ?auto_30002 - SURFACE
      ?auto_30003 - SURFACE
      ?auto_30004 - SURFACE
      ?auto_30005 - SURFACE
    )
    :vars
    (
      ?auto_30007 - HOIST
      ?auto_30011 - PLACE
      ?auto_30013 - PLACE
      ?auto_30010 - HOIST
      ?auto_30008 - SURFACE
      ?auto_30006 - PLACE
      ?auto_30009 - HOIST
      ?auto_30014 - SURFACE
      ?auto_30012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30007 ?auto_30011 ) ( IS-CRATE ?auto_30005 ) ( not ( = ?auto_30004 ?auto_30005 ) ) ( not ( = ?auto_30003 ?auto_30004 ) ) ( not ( = ?auto_30003 ?auto_30005 ) ) ( not ( = ?auto_30013 ?auto_30011 ) ) ( HOIST-AT ?auto_30010 ?auto_30013 ) ( not ( = ?auto_30007 ?auto_30010 ) ) ( AVAILABLE ?auto_30010 ) ( SURFACE-AT ?auto_30005 ?auto_30013 ) ( ON ?auto_30005 ?auto_30008 ) ( CLEAR ?auto_30005 ) ( not ( = ?auto_30004 ?auto_30008 ) ) ( not ( = ?auto_30005 ?auto_30008 ) ) ( not ( = ?auto_30003 ?auto_30008 ) ) ( IS-CRATE ?auto_30004 ) ( not ( = ?auto_30006 ?auto_30011 ) ) ( not ( = ?auto_30013 ?auto_30006 ) ) ( HOIST-AT ?auto_30009 ?auto_30006 ) ( not ( = ?auto_30007 ?auto_30009 ) ) ( not ( = ?auto_30010 ?auto_30009 ) ) ( AVAILABLE ?auto_30009 ) ( SURFACE-AT ?auto_30004 ?auto_30006 ) ( ON ?auto_30004 ?auto_30014 ) ( CLEAR ?auto_30004 ) ( not ( = ?auto_30004 ?auto_30014 ) ) ( not ( = ?auto_30005 ?auto_30014 ) ) ( not ( = ?auto_30003 ?auto_30014 ) ) ( not ( = ?auto_30008 ?auto_30014 ) ) ( TRUCK-AT ?auto_30012 ?auto_30011 ) ( SURFACE-AT ?auto_30002 ?auto_30011 ) ( CLEAR ?auto_30002 ) ( IS-CRATE ?auto_30003 ) ( not ( = ?auto_30002 ?auto_30003 ) ) ( not ( = ?auto_30004 ?auto_30002 ) ) ( not ( = ?auto_30005 ?auto_30002 ) ) ( not ( = ?auto_30008 ?auto_30002 ) ) ( not ( = ?auto_30014 ?auto_30002 ) ) ( AVAILABLE ?auto_30007 ) ( IN ?auto_30003 ?auto_30012 ) ( ON ?auto_30002 ?auto_30001 ) ( not ( = ?auto_30001 ?auto_30002 ) ) ( not ( = ?auto_30001 ?auto_30003 ) ) ( not ( = ?auto_30001 ?auto_30004 ) ) ( not ( = ?auto_30001 ?auto_30005 ) ) ( not ( = ?auto_30001 ?auto_30008 ) ) ( not ( = ?auto_30001 ?auto_30014 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30003 ?auto_30004 ?auto_30005 )
      ( MAKE-4CRATE-VERIFY ?auto_30001 ?auto_30002 ?auto_30003 ?auto_30004 ?auto_30005 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30015 - SURFACE
      ?auto_30016 - SURFACE
    )
    :vars
    (
      ?auto_30018 - HOIST
      ?auto_30022 - PLACE
      ?auto_30026 - SURFACE
      ?auto_30025 - PLACE
      ?auto_30021 - HOIST
      ?auto_30019 - SURFACE
      ?auto_30017 - PLACE
      ?auto_30020 - HOIST
      ?auto_30027 - SURFACE
      ?auto_30024 - SURFACE
      ?auto_30023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30018 ?auto_30022 ) ( IS-CRATE ?auto_30016 ) ( not ( = ?auto_30015 ?auto_30016 ) ) ( not ( = ?auto_30026 ?auto_30015 ) ) ( not ( = ?auto_30026 ?auto_30016 ) ) ( not ( = ?auto_30025 ?auto_30022 ) ) ( HOIST-AT ?auto_30021 ?auto_30025 ) ( not ( = ?auto_30018 ?auto_30021 ) ) ( AVAILABLE ?auto_30021 ) ( SURFACE-AT ?auto_30016 ?auto_30025 ) ( ON ?auto_30016 ?auto_30019 ) ( CLEAR ?auto_30016 ) ( not ( = ?auto_30015 ?auto_30019 ) ) ( not ( = ?auto_30016 ?auto_30019 ) ) ( not ( = ?auto_30026 ?auto_30019 ) ) ( IS-CRATE ?auto_30015 ) ( not ( = ?auto_30017 ?auto_30022 ) ) ( not ( = ?auto_30025 ?auto_30017 ) ) ( HOIST-AT ?auto_30020 ?auto_30017 ) ( not ( = ?auto_30018 ?auto_30020 ) ) ( not ( = ?auto_30021 ?auto_30020 ) ) ( AVAILABLE ?auto_30020 ) ( SURFACE-AT ?auto_30015 ?auto_30017 ) ( ON ?auto_30015 ?auto_30027 ) ( CLEAR ?auto_30015 ) ( not ( = ?auto_30015 ?auto_30027 ) ) ( not ( = ?auto_30016 ?auto_30027 ) ) ( not ( = ?auto_30026 ?auto_30027 ) ) ( not ( = ?auto_30019 ?auto_30027 ) ) ( SURFACE-AT ?auto_30024 ?auto_30022 ) ( CLEAR ?auto_30024 ) ( IS-CRATE ?auto_30026 ) ( not ( = ?auto_30024 ?auto_30026 ) ) ( not ( = ?auto_30015 ?auto_30024 ) ) ( not ( = ?auto_30016 ?auto_30024 ) ) ( not ( = ?auto_30019 ?auto_30024 ) ) ( not ( = ?auto_30027 ?auto_30024 ) ) ( AVAILABLE ?auto_30018 ) ( IN ?auto_30026 ?auto_30023 ) ( TRUCK-AT ?auto_30023 ?auto_30017 ) )
    :subtasks
    ( ( !DRIVE ?auto_30023 ?auto_30017 ?auto_30022 )
      ( MAKE-2CRATE ?auto_30026 ?auto_30015 ?auto_30016 )
      ( MAKE-1CRATE-VERIFY ?auto_30015 ?auto_30016 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30028 - SURFACE
      ?auto_30029 - SURFACE
      ?auto_30030 - SURFACE
    )
    :vars
    (
      ?auto_30040 - HOIST
      ?auto_30036 - PLACE
      ?auto_30035 - PLACE
      ?auto_30033 - HOIST
      ?auto_30034 - SURFACE
      ?auto_30031 - PLACE
      ?auto_30039 - HOIST
      ?auto_30038 - SURFACE
      ?auto_30032 - SURFACE
      ?auto_30037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30040 ?auto_30036 ) ( IS-CRATE ?auto_30030 ) ( not ( = ?auto_30029 ?auto_30030 ) ) ( not ( = ?auto_30028 ?auto_30029 ) ) ( not ( = ?auto_30028 ?auto_30030 ) ) ( not ( = ?auto_30035 ?auto_30036 ) ) ( HOIST-AT ?auto_30033 ?auto_30035 ) ( not ( = ?auto_30040 ?auto_30033 ) ) ( AVAILABLE ?auto_30033 ) ( SURFACE-AT ?auto_30030 ?auto_30035 ) ( ON ?auto_30030 ?auto_30034 ) ( CLEAR ?auto_30030 ) ( not ( = ?auto_30029 ?auto_30034 ) ) ( not ( = ?auto_30030 ?auto_30034 ) ) ( not ( = ?auto_30028 ?auto_30034 ) ) ( IS-CRATE ?auto_30029 ) ( not ( = ?auto_30031 ?auto_30036 ) ) ( not ( = ?auto_30035 ?auto_30031 ) ) ( HOIST-AT ?auto_30039 ?auto_30031 ) ( not ( = ?auto_30040 ?auto_30039 ) ) ( not ( = ?auto_30033 ?auto_30039 ) ) ( AVAILABLE ?auto_30039 ) ( SURFACE-AT ?auto_30029 ?auto_30031 ) ( ON ?auto_30029 ?auto_30038 ) ( CLEAR ?auto_30029 ) ( not ( = ?auto_30029 ?auto_30038 ) ) ( not ( = ?auto_30030 ?auto_30038 ) ) ( not ( = ?auto_30028 ?auto_30038 ) ) ( not ( = ?auto_30034 ?auto_30038 ) ) ( SURFACE-AT ?auto_30032 ?auto_30036 ) ( CLEAR ?auto_30032 ) ( IS-CRATE ?auto_30028 ) ( not ( = ?auto_30032 ?auto_30028 ) ) ( not ( = ?auto_30029 ?auto_30032 ) ) ( not ( = ?auto_30030 ?auto_30032 ) ) ( not ( = ?auto_30034 ?auto_30032 ) ) ( not ( = ?auto_30038 ?auto_30032 ) ) ( AVAILABLE ?auto_30040 ) ( IN ?auto_30028 ?auto_30037 ) ( TRUCK-AT ?auto_30037 ?auto_30031 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30029 ?auto_30030 )
      ( MAKE-2CRATE-VERIFY ?auto_30028 ?auto_30029 ?auto_30030 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30041 - SURFACE
      ?auto_30042 - SURFACE
      ?auto_30043 - SURFACE
      ?auto_30044 - SURFACE
    )
    :vars
    (
      ?auto_30053 - HOIST
      ?auto_30048 - PLACE
      ?auto_30045 - PLACE
      ?auto_30052 - HOIST
      ?auto_30047 - SURFACE
      ?auto_30049 - PLACE
      ?auto_30051 - HOIST
      ?auto_30050 - SURFACE
      ?auto_30046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30053 ?auto_30048 ) ( IS-CRATE ?auto_30044 ) ( not ( = ?auto_30043 ?auto_30044 ) ) ( not ( = ?auto_30042 ?auto_30043 ) ) ( not ( = ?auto_30042 ?auto_30044 ) ) ( not ( = ?auto_30045 ?auto_30048 ) ) ( HOIST-AT ?auto_30052 ?auto_30045 ) ( not ( = ?auto_30053 ?auto_30052 ) ) ( AVAILABLE ?auto_30052 ) ( SURFACE-AT ?auto_30044 ?auto_30045 ) ( ON ?auto_30044 ?auto_30047 ) ( CLEAR ?auto_30044 ) ( not ( = ?auto_30043 ?auto_30047 ) ) ( not ( = ?auto_30044 ?auto_30047 ) ) ( not ( = ?auto_30042 ?auto_30047 ) ) ( IS-CRATE ?auto_30043 ) ( not ( = ?auto_30049 ?auto_30048 ) ) ( not ( = ?auto_30045 ?auto_30049 ) ) ( HOIST-AT ?auto_30051 ?auto_30049 ) ( not ( = ?auto_30053 ?auto_30051 ) ) ( not ( = ?auto_30052 ?auto_30051 ) ) ( AVAILABLE ?auto_30051 ) ( SURFACE-AT ?auto_30043 ?auto_30049 ) ( ON ?auto_30043 ?auto_30050 ) ( CLEAR ?auto_30043 ) ( not ( = ?auto_30043 ?auto_30050 ) ) ( not ( = ?auto_30044 ?auto_30050 ) ) ( not ( = ?auto_30042 ?auto_30050 ) ) ( not ( = ?auto_30047 ?auto_30050 ) ) ( SURFACE-AT ?auto_30041 ?auto_30048 ) ( CLEAR ?auto_30041 ) ( IS-CRATE ?auto_30042 ) ( not ( = ?auto_30041 ?auto_30042 ) ) ( not ( = ?auto_30043 ?auto_30041 ) ) ( not ( = ?auto_30044 ?auto_30041 ) ) ( not ( = ?auto_30047 ?auto_30041 ) ) ( not ( = ?auto_30050 ?auto_30041 ) ) ( AVAILABLE ?auto_30053 ) ( IN ?auto_30042 ?auto_30046 ) ( TRUCK-AT ?auto_30046 ?auto_30049 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30042 ?auto_30043 ?auto_30044 )
      ( MAKE-3CRATE-VERIFY ?auto_30041 ?auto_30042 ?auto_30043 ?auto_30044 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30054 - SURFACE
      ?auto_30055 - SURFACE
      ?auto_30056 - SURFACE
      ?auto_30057 - SURFACE
      ?auto_30058 - SURFACE
    )
    :vars
    (
      ?auto_30067 - HOIST
      ?auto_30062 - PLACE
      ?auto_30059 - PLACE
      ?auto_30066 - HOIST
      ?auto_30061 - SURFACE
      ?auto_30063 - PLACE
      ?auto_30065 - HOIST
      ?auto_30064 - SURFACE
      ?auto_30060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30067 ?auto_30062 ) ( IS-CRATE ?auto_30058 ) ( not ( = ?auto_30057 ?auto_30058 ) ) ( not ( = ?auto_30056 ?auto_30057 ) ) ( not ( = ?auto_30056 ?auto_30058 ) ) ( not ( = ?auto_30059 ?auto_30062 ) ) ( HOIST-AT ?auto_30066 ?auto_30059 ) ( not ( = ?auto_30067 ?auto_30066 ) ) ( AVAILABLE ?auto_30066 ) ( SURFACE-AT ?auto_30058 ?auto_30059 ) ( ON ?auto_30058 ?auto_30061 ) ( CLEAR ?auto_30058 ) ( not ( = ?auto_30057 ?auto_30061 ) ) ( not ( = ?auto_30058 ?auto_30061 ) ) ( not ( = ?auto_30056 ?auto_30061 ) ) ( IS-CRATE ?auto_30057 ) ( not ( = ?auto_30063 ?auto_30062 ) ) ( not ( = ?auto_30059 ?auto_30063 ) ) ( HOIST-AT ?auto_30065 ?auto_30063 ) ( not ( = ?auto_30067 ?auto_30065 ) ) ( not ( = ?auto_30066 ?auto_30065 ) ) ( AVAILABLE ?auto_30065 ) ( SURFACE-AT ?auto_30057 ?auto_30063 ) ( ON ?auto_30057 ?auto_30064 ) ( CLEAR ?auto_30057 ) ( not ( = ?auto_30057 ?auto_30064 ) ) ( not ( = ?auto_30058 ?auto_30064 ) ) ( not ( = ?auto_30056 ?auto_30064 ) ) ( not ( = ?auto_30061 ?auto_30064 ) ) ( SURFACE-AT ?auto_30055 ?auto_30062 ) ( CLEAR ?auto_30055 ) ( IS-CRATE ?auto_30056 ) ( not ( = ?auto_30055 ?auto_30056 ) ) ( not ( = ?auto_30057 ?auto_30055 ) ) ( not ( = ?auto_30058 ?auto_30055 ) ) ( not ( = ?auto_30061 ?auto_30055 ) ) ( not ( = ?auto_30064 ?auto_30055 ) ) ( AVAILABLE ?auto_30067 ) ( IN ?auto_30056 ?auto_30060 ) ( TRUCK-AT ?auto_30060 ?auto_30063 ) ( ON ?auto_30055 ?auto_30054 ) ( not ( = ?auto_30054 ?auto_30055 ) ) ( not ( = ?auto_30054 ?auto_30056 ) ) ( not ( = ?auto_30054 ?auto_30057 ) ) ( not ( = ?auto_30054 ?auto_30058 ) ) ( not ( = ?auto_30054 ?auto_30061 ) ) ( not ( = ?auto_30054 ?auto_30064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30056 ?auto_30057 ?auto_30058 )
      ( MAKE-4CRATE-VERIFY ?auto_30054 ?auto_30055 ?auto_30056 ?auto_30057 ?auto_30058 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30068 - SURFACE
      ?auto_30069 - SURFACE
    )
    :vars
    (
      ?auto_30080 - HOIST
      ?auto_30074 - PLACE
      ?auto_30073 - SURFACE
      ?auto_30070 - PLACE
      ?auto_30078 - HOIST
      ?auto_30072 - SURFACE
      ?auto_30075 - PLACE
      ?auto_30077 - HOIST
      ?auto_30076 - SURFACE
      ?auto_30079 - SURFACE
      ?auto_30071 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30080 ?auto_30074 ) ( IS-CRATE ?auto_30069 ) ( not ( = ?auto_30068 ?auto_30069 ) ) ( not ( = ?auto_30073 ?auto_30068 ) ) ( not ( = ?auto_30073 ?auto_30069 ) ) ( not ( = ?auto_30070 ?auto_30074 ) ) ( HOIST-AT ?auto_30078 ?auto_30070 ) ( not ( = ?auto_30080 ?auto_30078 ) ) ( AVAILABLE ?auto_30078 ) ( SURFACE-AT ?auto_30069 ?auto_30070 ) ( ON ?auto_30069 ?auto_30072 ) ( CLEAR ?auto_30069 ) ( not ( = ?auto_30068 ?auto_30072 ) ) ( not ( = ?auto_30069 ?auto_30072 ) ) ( not ( = ?auto_30073 ?auto_30072 ) ) ( IS-CRATE ?auto_30068 ) ( not ( = ?auto_30075 ?auto_30074 ) ) ( not ( = ?auto_30070 ?auto_30075 ) ) ( HOIST-AT ?auto_30077 ?auto_30075 ) ( not ( = ?auto_30080 ?auto_30077 ) ) ( not ( = ?auto_30078 ?auto_30077 ) ) ( SURFACE-AT ?auto_30068 ?auto_30075 ) ( ON ?auto_30068 ?auto_30076 ) ( CLEAR ?auto_30068 ) ( not ( = ?auto_30068 ?auto_30076 ) ) ( not ( = ?auto_30069 ?auto_30076 ) ) ( not ( = ?auto_30073 ?auto_30076 ) ) ( not ( = ?auto_30072 ?auto_30076 ) ) ( SURFACE-AT ?auto_30079 ?auto_30074 ) ( CLEAR ?auto_30079 ) ( IS-CRATE ?auto_30073 ) ( not ( = ?auto_30079 ?auto_30073 ) ) ( not ( = ?auto_30068 ?auto_30079 ) ) ( not ( = ?auto_30069 ?auto_30079 ) ) ( not ( = ?auto_30072 ?auto_30079 ) ) ( not ( = ?auto_30076 ?auto_30079 ) ) ( AVAILABLE ?auto_30080 ) ( TRUCK-AT ?auto_30071 ?auto_30075 ) ( LIFTING ?auto_30077 ?auto_30073 ) )
    :subtasks
    ( ( !LOAD ?auto_30077 ?auto_30073 ?auto_30071 ?auto_30075 )
      ( MAKE-2CRATE ?auto_30073 ?auto_30068 ?auto_30069 )
      ( MAKE-1CRATE-VERIFY ?auto_30068 ?auto_30069 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30081 - SURFACE
      ?auto_30082 - SURFACE
      ?auto_30083 - SURFACE
    )
    :vars
    (
      ?auto_30093 - HOIST
      ?auto_30084 - PLACE
      ?auto_30085 - PLACE
      ?auto_30089 - HOIST
      ?auto_30087 - SURFACE
      ?auto_30090 - PLACE
      ?auto_30092 - HOIST
      ?auto_30086 - SURFACE
      ?auto_30088 - SURFACE
      ?auto_30091 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30093 ?auto_30084 ) ( IS-CRATE ?auto_30083 ) ( not ( = ?auto_30082 ?auto_30083 ) ) ( not ( = ?auto_30081 ?auto_30082 ) ) ( not ( = ?auto_30081 ?auto_30083 ) ) ( not ( = ?auto_30085 ?auto_30084 ) ) ( HOIST-AT ?auto_30089 ?auto_30085 ) ( not ( = ?auto_30093 ?auto_30089 ) ) ( AVAILABLE ?auto_30089 ) ( SURFACE-AT ?auto_30083 ?auto_30085 ) ( ON ?auto_30083 ?auto_30087 ) ( CLEAR ?auto_30083 ) ( not ( = ?auto_30082 ?auto_30087 ) ) ( not ( = ?auto_30083 ?auto_30087 ) ) ( not ( = ?auto_30081 ?auto_30087 ) ) ( IS-CRATE ?auto_30082 ) ( not ( = ?auto_30090 ?auto_30084 ) ) ( not ( = ?auto_30085 ?auto_30090 ) ) ( HOIST-AT ?auto_30092 ?auto_30090 ) ( not ( = ?auto_30093 ?auto_30092 ) ) ( not ( = ?auto_30089 ?auto_30092 ) ) ( SURFACE-AT ?auto_30082 ?auto_30090 ) ( ON ?auto_30082 ?auto_30086 ) ( CLEAR ?auto_30082 ) ( not ( = ?auto_30082 ?auto_30086 ) ) ( not ( = ?auto_30083 ?auto_30086 ) ) ( not ( = ?auto_30081 ?auto_30086 ) ) ( not ( = ?auto_30087 ?auto_30086 ) ) ( SURFACE-AT ?auto_30088 ?auto_30084 ) ( CLEAR ?auto_30088 ) ( IS-CRATE ?auto_30081 ) ( not ( = ?auto_30088 ?auto_30081 ) ) ( not ( = ?auto_30082 ?auto_30088 ) ) ( not ( = ?auto_30083 ?auto_30088 ) ) ( not ( = ?auto_30087 ?auto_30088 ) ) ( not ( = ?auto_30086 ?auto_30088 ) ) ( AVAILABLE ?auto_30093 ) ( TRUCK-AT ?auto_30091 ?auto_30090 ) ( LIFTING ?auto_30092 ?auto_30081 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30082 ?auto_30083 )
      ( MAKE-2CRATE-VERIFY ?auto_30081 ?auto_30082 ?auto_30083 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30094 - SURFACE
      ?auto_30095 - SURFACE
      ?auto_30096 - SURFACE
      ?auto_30097 - SURFACE
    )
    :vars
    (
      ?auto_30101 - HOIST
      ?auto_30105 - PLACE
      ?auto_30104 - PLACE
      ?auto_30098 - HOIST
      ?auto_30099 - SURFACE
      ?auto_30103 - PLACE
      ?auto_30102 - HOIST
      ?auto_30100 - SURFACE
      ?auto_30106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30101 ?auto_30105 ) ( IS-CRATE ?auto_30097 ) ( not ( = ?auto_30096 ?auto_30097 ) ) ( not ( = ?auto_30095 ?auto_30096 ) ) ( not ( = ?auto_30095 ?auto_30097 ) ) ( not ( = ?auto_30104 ?auto_30105 ) ) ( HOIST-AT ?auto_30098 ?auto_30104 ) ( not ( = ?auto_30101 ?auto_30098 ) ) ( AVAILABLE ?auto_30098 ) ( SURFACE-AT ?auto_30097 ?auto_30104 ) ( ON ?auto_30097 ?auto_30099 ) ( CLEAR ?auto_30097 ) ( not ( = ?auto_30096 ?auto_30099 ) ) ( not ( = ?auto_30097 ?auto_30099 ) ) ( not ( = ?auto_30095 ?auto_30099 ) ) ( IS-CRATE ?auto_30096 ) ( not ( = ?auto_30103 ?auto_30105 ) ) ( not ( = ?auto_30104 ?auto_30103 ) ) ( HOIST-AT ?auto_30102 ?auto_30103 ) ( not ( = ?auto_30101 ?auto_30102 ) ) ( not ( = ?auto_30098 ?auto_30102 ) ) ( SURFACE-AT ?auto_30096 ?auto_30103 ) ( ON ?auto_30096 ?auto_30100 ) ( CLEAR ?auto_30096 ) ( not ( = ?auto_30096 ?auto_30100 ) ) ( not ( = ?auto_30097 ?auto_30100 ) ) ( not ( = ?auto_30095 ?auto_30100 ) ) ( not ( = ?auto_30099 ?auto_30100 ) ) ( SURFACE-AT ?auto_30094 ?auto_30105 ) ( CLEAR ?auto_30094 ) ( IS-CRATE ?auto_30095 ) ( not ( = ?auto_30094 ?auto_30095 ) ) ( not ( = ?auto_30096 ?auto_30094 ) ) ( not ( = ?auto_30097 ?auto_30094 ) ) ( not ( = ?auto_30099 ?auto_30094 ) ) ( not ( = ?auto_30100 ?auto_30094 ) ) ( AVAILABLE ?auto_30101 ) ( TRUCK-AT ?auto_30106 ?auto_30103 ) ( LIFTING ?auto_30102 ?auto_30095 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30095 ?auto_30096 ?auto_30097 )
      ( MAKE-3CRATE-VERIFY ?auto_30094 ?auto_30095 ?auto_30096 ?auto_30097 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30107 - SURFACE
      ?auto_30108 - SURFACE
      ?auto_30109 - SURFACE
      ?auto_30110 - SURFACE
      ?auto_30111 - SURFACE
    )
    :vars
    (
      ?auto_30115 - HOIST
      ?auto_30119 - PLACE
      ?auto_30118 - PLACE
      ?auto_30112 - HOIST
      ?auto_30113 - SURFACE
      ?auto_30117 - PLACE
      ?auto_30116 - HOIST
      ?auto_30114 - SURFACE
      ?auto_30120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30115 ?auto_30119 ) ( IS-CRATE ?auto_30111 ) ( not ( = ?auto_30110 ?auto_30111 ) ) ( not ( = ?auto_30109 ?auto_30110 ) ) ( not ( = ?auto_30109 ?auto_30111 ) ) ( not ( = ?auto_30118 ?auto_30119 ) ) ( HOIST-AT ?auto_30112 ?auto_30118 ) ( not ( = ?auto_30115 ?auto_30112 ) ) ( AVAILABLE ?auto_30112 ) ( SURFACE-AT ?auto_30111 ?auto_30118 ) ( ON ?auto_30111 ?auto_30113 ) ( CLEAR ?auto_30111 ) ( not ( = ?auto_30110 ?auto_30113 ) ) ( not ( = ?auto_30111 ?auto_30113 ) ) ( not ( = ?auto_30109 ?auto_30113 ) ) ( IS-CRATE ?auto_30110 ) ( not ( = ?auto_30117 ?auto_30119 ) ) ( not ( = ?auto_30118 ?auto_30117 ) ) ( HOIST-AT ?auto_30116 ?auto_30117 ) ( not ( = ?auto_30115 ?auto_30116 ) ) ( not ( = ?auto_30112 ?auto_30116 ) ) ( SURFACE-AT ?auto_30110 ?auto_30117 ) ( ON ?auto_30110 ?auto_30114 ) ( CLEAR ?auto_30110 ) ( not ( = ?auto_30110 ?auto_30114 ) ) ( not ( = ?auto_30111 ?auto_30114 ) ) ( not ( = ?auto_30109 ?auto_30114 ) ) ( not ( = ?auto_30113 ?auto_30114 ) ) ( SURFACE-AT ?auto_30108 ?auto_30119 ) ( CLEAR ?auto_30108 ) ( IS-CRATE ?auto_30109 ) ( not ( = ?auto_30108 ?auto_30109 ) ) ( not ( = ?auto_30110 ?auto_30108 ) ) ( not ( = ?auto_30111 ?auto_30108 ) ) ( not ( = ?auto_30113 ?auto_30108 ) ) ( not ( = ?auto_30114 ?auto_30108 ) ) ( AVAILABLE ?auto_30115 ) ( TRUCK-AT ?auto_30120 ?auto_30117 ) ( LIFTING ?auto_30116 ?auto_30109 ) ( ON ?auto_30108 ?auto_30107 ) ( not ( = ?auto_30107 ?auto_30108 ) ) ( not ( = ?auto_30107 ?auto_30109 ) ) ( not ( = ?auto_30107 ?auto_30110 ) ) ( not ( = ?auto_30107 ?auto_30111 ) ) ( not ( = ?auto_30107 ?auto_30113 ) ) ( not ( = ?auto_30107 ?auto_30114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30109 ?auto_30110 ?auto_30111 )
      ( MAKE-4CRATE-VERIFY ?auto_30107 ?auto_30108 ?auto_30109 ?auto_30110 ?auto_30111 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30121 - SURFACE
      ?auto_30122 - SURFACE
    )
    :vars
    (
      ?auto_30127 - HOIST
      ?auto_30132 - PLACE
      ?auto_30131 - SURFACE
      ?auto_30130 - PLACE
      ?auto_30123 - HOIST
      ?auto_30124 - SURFACE
      ?auto_30129 - PLACE
      ?auto_30128 - HOIST
      ?auto_30125 - SURFACE
      ?auto_30126 - SURFACE
      ?auto_30133 - TRUCK
      ?auto_30134 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30127 ?auto_30132 ) ( IS-CRATE ?auto_30122 ) ( not ( = ?auto_30121 ?auto_30122 ) ) ( not ( = ?auto_30131 ?auto_30121 ) ) ( not ( = ?auto_30131 ?auto_30122 ) ) ( not ( = ?auto_30130 ?auto_30132 ) ) ( HOIST-AT ?auto_30123 ?auto_30130 ) ( not ( = ?auto_30127 ?auto_30123 ) ) ( AVAILABLE ?auto_30123 ) ( SURFACE-AT ?auto_30122 ?auto_30130 ) ( ON ?auto_30122 ?auto_30124 ) ( CLEAR ?auto_30122 ) ( not ( = ?auto_30121 ?auto_30124 ) ) ( not ( = ?auto_30122 ?auto_30124 ) ) ( not ( = ?auto_30131 ?auto_30124 ) ) ( IS-CRATE ?auto_30121 ) ( not ( = ?auto_30129 ?auto_30132 ) ) ( not ( = ?auto_30130 ?auto_30129 ) ) ( HOIST-AT ?auto_30128 ?auto_30129 ) ( not ( = ?auto_30127 ?auto_30128 ) ) ( not ( = ?auto_30123 ?auto_30128 ) ) ( SURFACE-AT ?auto_30121 ?auto_30129 ) ( ON ?auto_30121 ?auto_30125 ) ( CLEAR ?auto_30121 ) ( not ( = ?auto_30121 ?auto_30125 ) ) ( not ( = ?auto_30122 ?auto_30125 ) ) ( not ( = ?auto_30131 ?auto_30125 ) ) ( not ( = ?auto_30124 ?auto_30125 ) ) ( SURFACE-AT ?auto_30126 ?auto_30132 ) ( CLEAR ?auto_30126 ) ( IS-CRATE ?auto_30131 ) ( not ( = ?auto_30126 ?auto_30131 ) ) ( not ( = ?auto_30121 ?auto_30126 ) ) ( not ( = ?auto_30122 ?auto_30126 ) ) ( not ( = ?auto_30124 ?auto_30126 ) ) ( not ( = ?auto_30125 ?auto_30126 ) ) ( AVAILABLE ?auto_30127 ) ( TRUCK-AT ?auto_30133 ?auto_30129 ) ( AVAILABLE ?auto_30128 ) ( SURFACE-AT ?auto_30131 ?auto_30129 ) ( ON ?auto_30131 ?auto_30134 ) ( CLEAR ?auto_30131 ) ( not ( = ?auto_30121 ?auto_30134 ) ) ( not ( = ?auto_30122 ?auto_30134 ) ) ( not ( = ?auto_30131 ?auto_30134 ) ) ( not ( = ?auto_30124 ?auto_30134 ) ) ( not ( = ?auto_30125 ?auto_30134 ) ) ( not ( = ?auto_30126 ?auto_30134 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30128 ?auto_30131 ?auto_30134 ?auto_30129 )
      ( MAKE-2CRATE ?auto_30131 ?auto_30121 ?auto_30122 )
      ( MAKE-1CRATE-VERIFY ?auto_30121 ?auto_30122 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30135 - SURFACE
      ?auto_30136 - SURFACE
      ?auto_30137 - SURFACE
    )
    :vars
    (
      ?auto_30142 - HOIST
      ?auto_30148 - PLACE
      ?auto_30147 - PLACE
      ?auto_30139 - HOIST
      ?auto_30145 - SURFACE
      ?auto_30141 - PLACE
      ?auto_30146 - HOIST
      ?auto_30138 - SURFACE
      ?auto_30143 - SURFACE
      ?auto_30144 - TRUCK
      ?auto_30140 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30142 ?auto_30148 ) ( IS-CRATE ?auto_30137 ) ( not ( = ?auto_30136 ?auto_30137 ) ) ( not ( = ?auto_30135 ?auto_30136 ) ) ( not ( = ?auto_30135 ?auto_30137 ) ) ( not ( = ?auto_30147 ?auto_30148 ) ) ( HOIST-AT ?auto_30139 ?auto_30147 ) ( not ( = ?auto_30142 ?auto_30139 ) ) ( AVAILABLE ?auto_30139 ) ( SURFACE-AT ?auto_30137 ?auto_30147 ) ( ON ?auto_30137 ?auto_30145 ) ( CLEAR ?auto_30137 ) ( not ( = ?auto_30136 ?auto_30145 ) ) ( not ( = ?auto_30137 ?auto_30145 ) ) ( not ( = ?auto_30135 ?auto_30145 ) ) ( IS-CRATE ?auto_30136 ) ( not ( = ?auto_30141 ?auto_30148 ) ) ( not ( = ?auto_30147 ?auto_30141 ) ) ( HOIST-AT ?auto_30146 ?auto_30141 ) ( not ( = ?auto_30142 ?auto_30146 ) ) ( not ( = ?auto_30139 ?auto_30146 ) ) ( SURFACE-AT ?auto_30136 ?auto_30141 ) ( ON ?auto_30136 ?auto_30138 ) ( CLEAR ?auto_30136 ) ( not ( = ?auto_30136 ?auto_30138 ) ) ( not ( = ?auto_30137 ?auto_30138 ) ) ( not ( = ?auto_30135 ?auto_30138 ) ) ( not ( = ?auto_30145 ?auto_30138 ) ) ( SURFACE-AT ?auto_30143 ?auto_30148 ) ( CLEAR ?auto_30143 ) ( IS-CRATE ?auto_30135 ) ( not ( = ?auto_30143 ?auto_30135 ) ) ( not ( = ?auto_30136 ?auto_30143 ) ) ( not ( = ?auto_30137 ?auto_30143 ) ) ( not ( = ?auto_30145 ?auto_30143 ) ) ( not ( = ?auto_30138 ?auto_30143 ) ) ( AVAILABLE ?auto_30142 ) ( TRUCK-AT ?auto_30144 ?auto_30141 ) ( AVAILABLE ?auto_30146 ) ( SURFACE-AT ?auto_30135 ?auto_30141 ) ( ON ?auto_30135 ?auto_30140 ) ( CLEAR ?auto_30135 ) ( not ( = ?auto_30136 ?auto_30140 ) ) ( not ( = ?auto_30137 ?auto_30140 ) ) ( not ( = ?auto_30135 ?auto_30140 ) ) ( not ( = ?auto_30145 ?auto_30140 ) ) ( not ( = ?auto_30138 ?auto_30140 ) ) ( not ( = ?auto_30143 ?auto_30140 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30136 ?auto_30137 )
      ( MAKE-2CRATE-VERIFY ?auto_30135 ?auto_30136 ?auto_30137 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30149 - SURFACE
      ?auto_30150 - SURFACE
      ?auto_30151 - SURFACE
      ?auto_30152 - SURFACE
    )
    :vars
    (
      ?auto_30156 - HOIST
      ?auto_30153 - PLACE
      ?auto_30154 - PLACE
      ?auto_30161 - HOIST
      ?auto_30155 - SURFACE
      ?auto_30159 - PLACE
      ?auto_30160 - HOIST
      ?auto_30157 - SURFACE
      ?auto_30158 - TRUCK
      ?auto_30162 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30156 ?auto_30153 ) ( IS-CRATE ?auto_30152 ) ( not ( = ?auto_30151 ?auto_30152 ) ) ( not ( = ?auto_30150 ?auto_30151 ) ) ( not ( = ?auto_30150 ?auto_30152 ) ) ( not ( = ?auto_30154 ?auto_30153 ) ) ( HOIST-AT ?auto_30161 ?auto_30154 ) ( not ( = ?auto_30156 ?auto_30161 ) ) ( AVAILABLE ?auto_30161 ) ( SURFACE-AT ?auto_30152 ?auto_30154 ) ( ON ?auto_30152 ?auto_30155 ) ( CLEAR ?auto_30152 ) ( not ( = ?auto_30151 ?auto_30155 ) ) ( not ( = ?auto_30152 ?auto_30155 ) ) ( not ( = ?auto_30150 ?auto_30155 ) ) ( IS-CRATE ?auto_30151 ) ( not ( = ?auto_30159 ?auto_30153 ) ) ( not ( = ?auto_30154 ?auto_30159 ) ) ( HOIST-AT ?auto_30160 ?auto_30159 ) ( not ( = ?auto_30156 ?auto_30160 ) ) ( not ( = ?auto_30161 ?auto_30160 ) ) ( SURFACE-AT ?auto_30151 ?auto_30159 ) ( ON ?auto_30151 ?auto_30157 ) ( CLEAR ?auto_30151 ) ( not ( = ?auto_30151 ?auto_30157 ) ) ( not ( = ?auto_30152 ?auto_30157 ) ) ( not ( = ?auto_30150 ?auto_30157 ) ) ( not ( = ?auto_30155 ?auto_30157 ) ) ( SURFACE-AT ?auto_30149 ?auto_30153 ) ( CLEAR ?auto_30149 ) ( IS-CRATE ?auto_30150 ) ( not ( = ?auto_30149 ?auto_30150 ) ) ( not ( = ?auto_30151 ?auto_30149 ) ) ( not ( = ?auto_30152 ?auto_30149 ) ) ( not ( = ?auto_30155 ?auto_30149 ) ) ( not ( = ?auto_30157 ?auto_30149 ) ) ( AVAILABLE ?auto_30156 ) ( TRUCK-AT ?auto_30158 ?auto_30159 ) ( AVAILABLE ?auto_30160 ) ( SURFACE-AT ?auto_30150 ?auto_30159 ) ( ON ?auto_30150 ?auto_30162 ) ( CLEAR ?auto_30150 ) ( not ( = ?auto_30151 ?auto_30162 ) ) ( not ( = ?auto_30152 ?auto_30162 ) ) ( not ( = ?auto_30150 ?auto_30162 ) ) ( not ( = ?auto_30155 ?auto_30162 ) ) ( not ( = ?auto_30157 ?auto_30162 ) ) ( not ( = ?auto_30149 ?auto_30162 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30150 ?auto_30151 ?auto_30152 )
      ( MAKE-3CRATE-VERIFY ?auto_30149 ?auto_30150 ?auto_30151 ?auto_30152 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30163 - SURFACE
      ?auto_30164 - SURFACE
      ?auto_30165 - SURFACE
      ?auto_30166 - SURFACE
      ?auto_30167 - SURFACE
    )
    :vars
    (
      ?auto_30171 - HOIST
      ?auto_30168 - PLACE
      ?auto_30169 - PLACE
      ?auto_30176 - HOIST
      ?auto_30170 - SURFACE
      ?auto_30174 - PLACE
      ?auto_30175 - HOIST
      ?auto_30172 - SURFACE
      ?auto_30173 - TRUCK
      ?auto_30177 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30171 ?auto_30168 ) ( IS-CRATE ?auto_30167 ) ( not ( = ?auto_30166 ?auto_30167 ) ) ( not ( = ?auto_30165 ?auto_30166 ) ) ( not ( = ?auto_30165 ?auto_30167 ) ) ( not ( = ?auto_30169 ?auto_30168 ) ) ( HOIST-AT ?auto_30176 ?auto_30169 ) ( not ( = ?auto_30171 ?auto_30176 ) ) ( AVAILABLE ?auto_30176 ) ( SURFACE-AT ?auto_30167 ?auto_30169 ) ( ON ?auto_30167 ?auto_30170 ) ( CLEAR ?auto_30167 ) ( not ( = ?auto_30166 ?auto_30170 ) ) ( not ( = ?auto_30167 ?auto_30170 ) ) ( not ( = ?auto_30165 ?auto_30170 ) ) ( IS-CRATE ?auto_30166 ) ( not ( = ?auto_30174 ?auto_30168 ) ) ( not ( = ?auto_30169 ?auto_30174 ) ) ( HOIST-AT ?auto_30175 ?auto_30174 ) ( not ( = ?auto_30171 ?auto_30175 ) ) ( not ( = ?auto_30176 ?auto_30175 ) ) ( SURFACE-AT ?auto_30166 ?auto_30174 ) ( ON ?auto_30166 ?auto_30172 ) ( CLEAR ?auto_30166 ) ( not ( = ?auto_30166 ?auto_30172 ) ) ( not ( = ?auto_30167 ?auto_30172 ) ) ( not ( = ?auto_30165 ?auto_30172 ) ) ( not ( = ?auto_30170 ?auto_30172 ) ) ( SURFACE-AT ?auto_30164 ?auto_30168 ) ( CLEAR ?auto_30164 ) ( IS-CRATE ?auto_30165 ) ( not ( = ?auto_30164 ?auto_30165 ) ) ( not ( = ?auto_30166 ?auto_30164 ) ) ( not ( = ?auto_30167 ?auto_30164 ) ) ( not ( = ?auto_30170 ?auto_30164 ) ) ( not ( = ?auto_30172 ?auto_30164 ) ) ( AVAILABLE ?auto_30171 ) ( TRUCK-AT ?auto_30173 ?auto_30174 ) ( AVAILABLE ?auto_30175 ) ( SURFACE-AT ?auto_30165 ?auto_30174 ) ( ON ?auto_30165 ?auto_30177 ) ( CLEAR ?auto_30165 ) ( not ( = ?auto_30166 ?auto_30177 ) ) ( not ( = ?auto_30167 ?auto_30177 ) ) ( not ( = ?auto_30165 ?auto_30177 ) ) ( not ( = ?auto_30170 ?auto_30177 ) ) ( not ( = ?auto_30172 ?auto_30177 ) ) ( not ( = ?auto_30164 ?auto_30177 ) ) ( ON ?auto_30164 ?auto_30163 ) ( not ( = ?auto_30163 ?auto_30164 ) ) ( not ( = ?auto_30163 ?auto_30165 ) ) ( not ( = ?auto_30163 ?auto_30166 ) ) ( not ( = ?auto_30163 ?auto_30167 ) ) ( not ( = ?auto_30163 ?auto_30170 ) ) ( not ( = ?auto_30163 ?auto_30172 ) ) ( not ( = ?auto_30163 ?auto_30177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30165 ?auto_30166 ?auto_30167 )
      ( MAKE-4CRATE-VERIFY ?auto_30163 ?auto_30164 ?auto_30165 ?auto_30166 ?auto_30167 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30178 - SURFACE
      ?auto_30179 - SURFACE
    )
    :vars
    (
      ?auto_30184 - HOIST
      ?auto_30181 - PLACE
      ?auto_30180 - SURFACE
      ?auto_30182 - PLACE
      ?auto_30189 - HOIST
      ?auto_30183 - SURFACE
      ?auto_30187 - PLACE
      ?auto_30188 - HOIST
      ?auto_30185 - SURFACE
      ?auto_30190 - SURFACE
      ?auto_30191 - SURFACE
      ?auto_30186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30184 ?auto_30181 ) ( IS-CRATE ?auto_30179 ) ( not ( = ?auto_30178 ?auto_30179 ) ) ( not ( = ?auto_30180 ?auto_30178 ) ) ( not ( = ?auto_30180 ?auto_30179 ) ) ( not ( = ?auto_30182 ?auto_30181 ) ) ( HOIST-AT ?auto_30189 ?auto_30182 ) ( not ( = ?auto_30184 ?auto_30189 ) ) ( AVAILABLE ?auto_30189 ) ( SURFACE-AT ?auto_30179 ?auto_30182 ) ( ON ?auto_30179 ?auto_30183 ) ( CLEAR ?auto_30179 ) ( not ( = ?auto_30178 ?auto_30183 ) ) ( not ( = ?auto_30179 ?auto_30183 ) ) ( not ( = ?auto_30180 ?auto_30183 ) ) ( IS-CRATE ?auto_30178 ) ( not ( = ?auto_30187 ?auto_30181 ) ) ( not ( = ?auto_30182 ?auto_30187 ) ) ( HOIST-AT ?auto_30188 ?auto_30187 ) ( not ( = ?auto_30184 ?auto_30188 ) ) ( not ( = ?auto_30189 ?auto_30188 ) ) ( SURFACE-AT ?auto_30178 ?auto_30187 ) ( ON ?auto_30178 ?auto_30185 ) ( CLEAR ?auto_30178 ) ( not ( = ?auto_30178 ?auto_30185 ) ) ( not ( = ?auto_30179 ?auto_30185 ) ) ( not ( = ?auto_30180 ?auto_30185 ) ) ( not ( = ?auto_30183 ?auto_30185 ) ) ( SURFACE-AT ?auto_30190 ?auto_30181 ) ( CLEAR ?auto_30190 ) ( IS-CRATE ?auto_30180 ) ( not ( = ?auto_30190 ?auto_30180 ) ) ( not ( = ?auto_30178 ?auto_30190 ) ) ( not ( = ?auto_30179 ?auto_30190 ) ) ( not ( = ?auto_30183 ?auto_30190 ) ) ( not ( = ?auto_30185 ?auto_30190 ) ) ( AVAILABLE ?auto_30184 ) ( AVAILABLE ?auto_30188 ) ( SURFACE-AT ?auto_30180 ?auto_30187 ) ( ON ?auto_30180 ?auto_30191 ) ( CLEAR ?auto_30180 ) ( not ( = ?auto_30178 ?auto_30191 ) ) ( not ( = ?auto_30179 ?auto_30191 ) ) ( not ( = ?auto_30180 ?auto_30191 ) ) ( not ( = ?auto_30183 ?auto_30191 ) ) ( not ( = ?auto_30185 ?auto_30191 ) ) ( not ( = ?auto_30190 ?auto_30191 ) ) ( TRUCK-AT ?auto_30186 ?auto_30181 ) )
    :subtasks
    ( ( !DRIVE ?auto_30186 ?auto_30181 ?auto_30187 )
      ( MAKE-2CRATE ?auto_30180 ?auto_30178 ?auto_30179 )
      ( MAKE-1CRATE-VERIFY ?auto_30178 ?auto_30179 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30192 - SURFACE
      ?auto_30193 - SURFACE
      ?auto_30194 - SURFACE
    )
    :vars
    (
      ?auto_30196 - HOIST
      ?auto_30201 - PLACE
      ?auto_30205 - PLACE
      ?auto_30195 - HOIST
      ?auto_30198 - SURFACE
      ?auto_30202 - PLACE
      ?auto_30203 - HOIST
      ?auto_30200 - SURFACE
      ?auto_30204 - SURFACE
      ?auto_30197 - SURFACE
      ?auto_30199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30196 ?auto_30201 ) ( IS-CRATE ?auto_30194 ) ( not ( = ?auto_30193 ?auto_30194 ) ) ( not ( = ?auto_30192 ?auto_30193 ) ) ( not ( = ?auto_30192 ?auto_30194 ) ) ( not ( = ?auto_30205 ?auto_30201 ) ) ( HOIST-AT ?auto_30195 ?auto_30205 ) ( not ( = ?auto_30196 ?auto_30195 ) ) ( AVAILABLE ?auto_30195 ) ( SURFACE-AT ?auto_30194 ?auto_30205 ) ( ON ?auto_30194 ?auto_30198 ) ( CLEAR ?auto_30194 ) ( not ( = ?auto_30193 ?auto_30198 ) ) ( not ( = ?auto_30194 ?auto_30198 ) ) ( not ( = ?auto_30192 ?auto_30198 ) ) ( IS-CRATE ?auto_30193 ) ( not ( = ?auto_30202 ?auto_30201 ) ) ( not ( = ?auto_30205 ?auto_30202 ) ) ( HOIST-AT ?auto_30203 ?auto_30202 ) ( not ( = ?auto_30196 ?auto_30203 ) ) ( not ( = ?auto_30195 ?auto_30203 ) ) ( SURFACE-AT ?auto_30193 ?auto_30202 ) ( ON ?auto_30193 ?auto_30200 ) ( CLEAR ?auto_30193 ) ( not ( = ?auto_30193 ?auto_30200 ) ) ( not ( = ?auto_30194 ?auto_30200 ) ) ( not ( = ?auto_30192 ?auto_30200 ) ) ( not ( = ?auto_30198 ?auto_30200 ) ) ( SURFACE-AT ?auto_30204 ?auto_30201 ) ( CLEAR ?auto_30204 ) ( IS-CRATE ?auto_30192 ) ( not ( = ?auto_30204 ?auto_30192 ) ) ( not ( = ?auto_30193 ?auto_30204 ) ) ( not ( = ?auto_30194 ?auto_30204 ) ) ( not ( = ?auto_30198 ?auto_30204 ) ) ( not ( = ?auto_30200 ?auto_30204 ) ) ( AVAILABLE ?auto_30196 ) ( AVAILABLE ?auto_30203 ) ( SURFACE-AT ?auto_30192 ?auto_30202 ) ( ON ?auto_30192 ?auto_30197 ) ( CLEAR ?auto_30192 ) ( not ( = ?auto_30193 ?auto_30197 ) ) ( not ( = ?auto_30194 ?auto_30197 ) ) ( not ( = ?auto_30192 ?auto_30197 ) ) ( not ( = ?auto_30198 ?auto_30197 ) ) ( not ( = ?auto_30200 ?auto_30197 ) ) ( not ( = ?auto_30204 ?auto_30197 ) ) ( TRUCK-AT ?auto_30199 ?auto_30201 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30193 ?auto_30194 )
      ( MAKE-2CRATE-VERIFY ?auto_30192 ?auto_30193 ?auto_30194 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30206 - SURFACE
      ?auto_30207 - SURFACE
      ?auto_30208 - SURFACE
      ?auto_30209 - SURFACE
    )
    :vars
    (
      ?auto_30216 - HOIST
      ?auto_30211 - PLACE
      ?auto_30212 - PLACE
      ?auto_30210 - HOIST
      ?auto_30219 - SURFACE
      ?auto_30217 - PLACE
      ?auto_30218 - HOIST
      ?auto_30215 - SURFACE
      ?auto_30213 - SURFACE
      ?auto_30214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30216 ?auto_30211 ) ( IS-CRATE ?auto_30209 ) ( not ( = ?auto_30208 ?auto_30209 ) ) ( not ( = ?auto_30207 ?auto_30208 ) ) ( not ( = ?auto_30207 ?auto_30209 ) ) ( not ( = ?auto_30212 ?auto_30211 ) ) ( HOIST-AT ?auto_30210 ?auto_30212 ) ( not ( = ?auto_30216 ?auto_30210 ) ) ( AVAILABLE ?auto_30210 ) ( SURFACE-AT ?auto_30209 ?auto_30212 ) ( ON ?auto_30209 ?auto_30219 ) ( CLEAR ?auto_30209 ) ( not ( = ?auto_30208 ?auto_30219 ) ) ( not ( = ?auto_30209 ?auto_30219 ) ) ( not ( = ?auto_30207 ?auto_30219 ) ) ( IS-CRATE ?auto_30208 ) ( not ( = ?auto_30217 ?auto_30211 ) ) ( not ( = ?auto_30212 ?auto_30217 ) ) ( HOIST-AT ?auto_30218 ?auto_30217 ) ( not ( = ?auto_30216 ?auto_30218 ) ) ( not ( = ?auto_30210 ?auto_30218 ) ) ( SURFACE-AT ?auto_30208 ?auto_30217 ) ( ON ?auto_30208 ?auto_30215 ) ( CLEAR ?auto_30208 ) ( not ( = ?auto_30208 ?auto_30215 ) ) ( not ( = ?auto_30209 ?auto_30215 ) ) ( not ( = ?auto_30207 ?auto_30215 ) ) ( not ( = ?auto_30219 ?auto_30215 ) ) ( SURFACE-AT ?auto_30206 ?auto_30211 ) ( CLEAR ?auto_30206 ) ( IS-CRATE ?auto_30207 ) ( not ( = ?auto_30206 ?auto_30207 ) ) ( not ( = ?auto_30208 ?auto_30206 ) ) ( not ( = ?auto_30209 ?auto_30206 ) ) ( not ( = ?auto_30219 ?auto_30206 ) ) ( not ( = ?auto_30215 ?auto_30206 ) ) ( AVAILABLE ?auto_30216 ) ( AVAILABLE ?auto_30218 ) ( SURFACE-AT ?auto_30207 ?auto_30217 ) ( ON ?auto_30207 ?auto_30213 ) ( CLEAR ?auto_30207 ) ( not ( = ?auto_30208 ?auto_30213 ) ) ( not ( = ?auto_30209 ?auto_30213 ) ) ( not ( = ?auto_30207 ?auto_30213 ) ) ( not ( = ?auto_30219 ?auto_30213 ) ) ( not ( = ?auto_30215 ?auto_30213 ) ) ( not ( = ?auto_30206 ?auto_30213 ) ) ( TRUCK-AT ?auto_30214 ?auto_30211 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30207 ?auto_30208 ?auto_30209 )
      ( MAKE-3CRATE-VERIFY ?auto_30206 ?auto_30207 ?auto_30208 ?auto_30209 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30220 - SURFACE
      ?auto_30221 - SURFACE
      ?auto_30222 - SURFACE
      ?auto_30223 - SURFACE
      ?auto_30224 - SURFACE
    )
    :vars
    (
      ?auto_30231 - HOIST
      ?auto_30226 - PLACE
      ?auto_30227 - PLACE
      ?auto_30225 - HOIST
      ?auto_30234 - SURFACE
      ?auto_30232 - PLACE
      ?auto_30233 - HOIST
      ?auto_30230 - SURFACE
      ?auto_30228 - SURFACE
      ?auto_30229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30231 ?auto_30226 ) ( IS-CRATE ?auto_30224 ) ( not ( = ?auto_30223 ?auto_30224 ) ) ( not ( = ?auto_30222 ?auto_30223 ) ) ( not ( = ?auto_30222 ?auto_30224 ) ) ( not ( = ?auto_30227 ?auto_30226 ) ) ( HOIST-AT ?auto_30225 ?auto_30227 ) ( not ( = ?auto_30231 ?auto_30225 ) ) ( AVAILABLE ?auto_30225 ) ( SURFACE-AT ?auto_30224 ?auto_30227 ) ( ON ?auto_30224 ?auto_30234 ) ( CLEAR ?auto_30224 ) ( not ( = ?auto_30223 ?auto_30234 ) ) ( not ( = ?auto_30224 ?auto_30234 ) ) ( not ( = ?auto_30222 ?auto_30234 ) ) ( IS-CRATE ?auto_30223 ) ( not ( = ?auto_30232 ?auto_30226 ) ) ( not ( = ?auto_30227 ?auto_30232 ) ) ( HOIST-AT ?auto_30233 ?auto_30232 ) ( not ( = ?auto_30231 ?auto_30233 ) ) ( not ( = ?auto_30225 ?auto_30233 ) ) ( SURFACE-AT ?auto_30223 ?auto_30232 ) ( ON ?auto_30223 ?auto_30230 ) ( CLEAR ?auto_30223 ) ( not ( = ?auto_30223 ?auto_30230 ) ) ( not ( = ?auto_30224 ?auto_30230 ) ) ( not ( = ?auto_30222 ?auto_30230 ) ) ( not ( = ?auto_30234 ?auto_30230 ) ) ( SURFACE-AT ?auto_30221 ?auto_30226 ) ( CLEAR ?auto_30221 ) ( IS-CRATE ?auto_30222 ) ( not ( = ?auto_30221 ?auto_30222 ) ) ( not ( = ?auto_30223 ?auto_30221 ) ) ( not ( = ?auto_30224 ?auto_30221 ) ) ( not ( = ?auto_30234 ?auto_30221 ) ) ( not ( = ?auto_30230 ?auto_30221 ) ) ( AVAILABLE ?auto_30231 ) ( AVAILABLE ?auto_30233 ) ( SURFACE-AT ?auto_30222 ?auto_30232 ) ( ON ?auto_30222 ?auto_30228 ) ( CLEAR ?auto_30222 ) ( not ( = ?auto_30223 ?auto_30228 ) ) ( not ( = ?auto_30224 ?auto_30228 ) ) ( not ( = ?auto_30222 ?auto_30228 ) ) ( not ( = ?auto_30234 ?auto_30228 ) ) ( not ( = ?auto_30230 ?auto_30228 ) ) ( not ( = ?auto_30221 ?auto_30228 ) ) ( TRUCK-AT ?auto_30229 ?auto_30226 ) ( ON ?auto_30221 ?auto_30220 ) ( not ( = ?auto_30220 ?auto_30221 ) ) ( not ( = ?auto_30220 ?auto_30222 ) ) ( not ( = ?auto_30220 ?auto_30223 ) ) ( not ( = ?auto_30220 ?auto_30224 ) ) ( not ( = ?auto_30220 ?auto_30234 ) ) ( not ( = ?auto_30220 ?auto_30230 ) ) ( not ( = ?auto_30220 ?auto_30228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30222 ?auto_30223 ?auto_30224 )
      ( MAKE-4CRATE-VERIFY ?auto_30220 ?auto_30221 ?auto_30222 ?auto_30223 ?auto_30224 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30235 - SURFACE
      ?auto_30236 - SURFACE
    )
    :vars
    (
      ?auto_30245 - HOIST
      ?auto_30238 - PLACE
      ?auto_30244 - SURFACE
      ?auto_30239 - PLACE
      ?auto_30237 - HOIST
      ?auto_30248 - SURFACE
      ?auto_30246 - PLACE
      ?auto_30247 - HOIST
      ?auto_30243 - SURFACE
      ?auto_30242 - SURFACE
      ?auto_30240 - SURFACE
      ?auto_30241 - TRUCK
      ?auto_30249 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30245 ?auto_30238 ) ( IS-CRATE ?auto_30236 ) ( not ( = ?auto_30235 ?auto_30236 ) ) ( not ( = ?auto_30244 ?auto_30235 ) ) ( not ( = ?auto_30244 ?auto_30236 ) ) ( not ( = ?auto_30239 ?auto_30238 ) ) ( HOIST-AT ?auto_30237 ?auto_30239 ) ( not ( = ?auto_30245 ?auto_30237 ) ) ( AVAILABLE ?auto_30237 ) ( SURFACE-AT ?auto_30236 ?auto_30239 ) ( ON ?auto_30236 ?auto_30248 ) ( CLEAR ?auto_30236 ) ( not ( = ?auto_30235 ?auto_30248 ) ) ( not ( = ?auto_30236 ?auto_30248 ) ) ( not ( = ?auto_30244 ?auto_30248 ) ) ( IS-CRATE ?auto_30235 ) ( not ( = ?auto_30246 ?auto_30238 ) ) ( not ( = ?auto_30239 ?auto_30246 ) ) ( HOIST-AT ?auto_30247 ?auto_30246 ) ( not ( = ?auto_30245 ?auto_30247 ) ) ( not ( = ?auto_30237 ?auto_30247 ) ) ( SURFACE-AT ?auto_30235 ?auto_30246 ) ( ON ?auto_30235 ?auto_30243 ) ( CLEAR ?auto_30235 ) ( not ( = ?auto_30235 ?auto_30243 ) ) ( not ( = ?auto_30236 ?auto_30243 ) ) ( not ( = ?auto_30244 ?auto_30243 ) ) ( not ( = ?auto_30248 ?auto_30243 ) ) ( IS-CRATE ?auto_30244 ) ( not ( = ?auto_30242 ?auto_30244 ) ) ( not ( = ?auto_30235 ?auto_30242 ) ) ( not ( = ?auto_30236 ?auto_30242 ) ) ( not ( = ?auto_30248 ?auto_30242 ) ) ( not ( = ?auto_30243 ?auto_30242 ) ) ( AVAILABLE ?auto_30247 ) ( SURFACE-AT ?auto_30244 ?auto_30246 ) ( ON ?auto_30244 ?auto_30240 ) ( CLEAR ?auto_30244 ) ( not ( = ?auto_30235 ?auto_30240 ) ) ( not ( = ?auto_30236 ?auto_30240 ) ) ( not ( = ?auto_30244 ?auto_30240 ) ) ( not ( = ?auto_30248 ?auto_30240 ) ) ( not ( = ?auto_30243 ?auto_30240 ) ) ( not ( = ?auto_30242 ?auto_30240 ) ) ( TRUCK-AT ?auto_30241 ?auto_30238 ) ( SURFACE-AT ?auto_30249 ?auto_30238 ) ( CLEAR ?auto_30249 ) ( LIFTING ?auto_30245 ?auto_30242 ) ( IS-CRATE ?auto_30242 ) ( not ( = ?auto_30249 ?auto_30242 ) ) ( not ( = ?auto_30235 ?auto_30249 ) ) ( not ( = ?auto_30236 ?auto_30249 ) ) ( not ( = ?auto_30244 ?auto_30249 ) ) ( not ( = ?auto_30248 ?auto_30249 ) ) ( not ( = ?auto_30243 ?auto_30249 ) ) ( not ( = ?auto_30240 ?auto_30249 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30249 ?auto_30242 )
      ( MAKE-2CRATE ?auto_30244 ?auto_30235 ?auto_30236 )
      ( MAKE-1CRATE-VERIFY ?auto_30235 ?auto_30236 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30250 - SURFACE
      ?auto_30251 - SURFACE
      ?auto_30252 - SURFACE
    )
    :vars
    (
      ?auto_30262 - HOIST
      ?auto_30256 - PLACE
      ?auto_30260 - PLACE
      ?auto_30257 - HOIST
      ?auto_30261 - SURFACE
      ?auto_30255 - PLACE
      ?auto_30254 - HOIST
      ?auto_30264 - SURFACE
      ?auto_30263 - SURFACE
      ?auto_30259 - SURFACE
      ?auto_30258 - TRUCK
      ?auto_30253 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30262 ?auto_30256 ) ( IS-CRATE ?auto_30252 ) ( not ( = ?auto_30251 ?auto_30252 ) ) ( not ( = ?auto_30250 ?auto_30251 ) ) ( not ( = ?auto_30250 ?auto_30252 ) ) ( not ( = ?auto_30260 ?auto_30256 ) ) ( HOIST-AT ?auto_30257 ?auto_30260 ) ( not ( = ?auto_30262 ?auto_30257 ) ) ( AVAILABLE ?auto_30257 ) ( SURFACE-AT ?auto_30252 ?auto_30260 ) ( ON ?auto_30252 ?auto_30261 ) ( CLEAR ?auto_30252 ) ( not ( = ?auto_30251 ?auto_30261 ) ) ( not ( = ?auto_30252 ?auto_30261 ) ) ( not ( = ?auto_30250 ?auto_30261 ) ) ( IS-CRATE ?auto_30251 ) ( not ( = ?auto_30255 ?auto_30256 ) ) ( not ( = ?auto_30260 ?auto_30255 ) ) ( HOIST-AT ?auto_30254 ?auto_30255 ) ( not ( = ?auto_30262 ?auto_30254 ) ) ( not ( = ?auto_30257 ?auto_30254 ) ) ( SURFACE-AT ?auto_30251 ?auto_30255 ) ( ON ?auto_30251 ?auto_30264 ) ( CLEAR ?auto_30251 ) ( not ( = ?auto_30251 ?auto_30264 ) ) ( not ( = ?auto_30252 ?auto_30264 ) ) ( not ( = ?auto_30250 ?auto_30264 ) ) ( not ( = ?auto_30261 ?auto_30264 ) ) ( IS-CRATE ?auto_30250 ) ( not ( = ?auto_30263 ?auto_30250 ) ) ( not ( = ?auto_30251 ?auto_30263 ) ) ( not ( = ?auto_30252 ?auto_30263 ) ) ( not ( = ?auto_30261 ?auto_30263 ) ) ( not ( = ?auto_30264 ?auto_30263 ) ) ( AVAILABLE ?auto_30254 ) ( SURFACE-AT ?auto_30250 ?auto_30255 ) ( ON ?auto_30250 ?auto_30259 ) ( CLEAR ?auto_30250 ) ( not ( = ?auto_30251 ?auto_30259 ) ) ( not ( = ?auto_30252 ?auto_30259 ) ) ( not ( = ?auto_30250 ?auto_30259 ) ) ( not ( = ?auto_30261 ?auto_30259 ) ) ( not ( = ?auto_30264 ?auto_30259 ) ) ( not ( = ?auto_30263 ?auto_30259 ) ) ( TRUCK-AT ?auto_30258 ?auto_30256 ) ( SURFACE-AT ?auto_30253 ?auto_30256 ) ( CLEAR ?auto_30253 ) ( LIFTING ?auto_30262 ?auto_30263 ) ( IS-CRATE ?auto_30263 ) ( not ( = ?auto_30253 ?auto_30263 ) ) ( not ( = ?auto_30251 ?auto_30253 ) ) ( not ( = ?auto_30252 ?auto_30253 ) ) ( not ( = ?auto_30250 ?auto_30253 ) ) ( not ( = ?auto_30261 ?auto_30253 ) ) ( not ( = ?auto_30264 ?auto_30253 ) ) ( not ( = ?auto_30259 ?auto_30253 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30251 ?auto_30252 )
      ( MAKE-2CRATE-VERIFY ?auto_30250 ?auto_30251 ?auto_30252 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30265 - SURFACE
      ?auto_30266 - SURFACE
      ?auto_30267 - SURFACE
      ?auto_30268 - SURFACE
    )
    :vars
    (
      ?auto_30278 - HOIST
      ?auto_30271 - PLACE
      ?auto_30277 - PLACE
      ?auto_30279 - HOIST
      ?auto_30272 - SURFACE
      ?auto_30274 - PLACE
      ?auto_30270 - HOIST
      ?auto_30276 - SURFACE
      ?auto_30275 - SURFACE
      ?auto_30269 - TRUCK
      ?auto_30273 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30278 ?auto_30271 ) ( IS-CRATE ?auto_30268 ) ( not ( = ?auto_30267 ?auto_30268 ) ) ( not ( = ?auto_30266 ?auto_30267 ) ) ( not ( = ?auto_30266 ?auto_30268 ) ) ( not ( = ?auto_30277 ?auto_30271 ) ) ( HOIST-AT ?auto_30279 ?auto_30277 ) ( not ( = ?auto_30278 ?auto_30279 ) ) ( AVAILABLE ?auto_30279 ) ( SURFACE-AT ?auto_30268 ?auto_30277 ) ( ON ?auto_30268 ?auto_30272 ) ( CLEAR ?auto_30268 ) ( not ( = ?auto_30267 ?auto_30272 ) ) ( not ( = ?auto_30268 ?auto_30272 ) ) ( not ( = ?auto_30266 ?auto_30272 ) ) ( IS-CRATE ?auto_30267 ) ( not ( = ?auto_30274 ?auto_30271 ) ) ( not ( = ?auto_30277 ?auto_30274 ) ) ( HOIST-AT ?auto_30270 ?auto_30274 ) ( not ( = ?auto_30278 ?auto_30270 ) ) ( not ( = ?auto_30279 ?auto_30270 ) ) ( SURFACE-AT ?auto_30267 ?auto_30274 ) ( ON ?auto_30267 ?auto_30276 ) ( CLEAR ?auto_30267 ) ( not ( = ?auto_30267 ?auto_30276 ) ) ( not ( = ?auto_30268 ?auto_30276 ) ) ( not ( = ?auto_30266 ?auto_30276 ) ) ( not ( = ?auto_30272 ?auto_30276 ) ) ( IS-CRATE ?auto_30266 ) ( not ( = ?auto_30265 ?auto_30266 ) ) ( not ( = ?auto_30267 ?auto_30265 ) ) ( not ( = ?auto_30268 ?auto_30265 ) ) ( not ( = ?auto_30272 ?auto_30265 ) ) ( not ( = ?auto_30276 ?auto_30265 ) ) ( AVAILABLE ?auto_30270 ) ( SURFACE-AT ?auto_30266 ?auto_30274 ) ( ON ?auto_30266 ?auto_30275 ) ( CLEAR ?auto_30266 ) ( not ( = ?auto_30267 ?auto_30275 ) ) ( not ( = ?auto_30268 ?auto_30275 ) ) ( not ( = ?auto_30266 ?auto_30275 ) ) ( not ( = ?auto_30272 ?auto_30275 ) ) ( not ( = ?auto_30276 ?auto_30275 ) ) ( not ( = ?auto_30265 ?auto_30275 ) ) ( TRUCK-AT ?auto_30269 ?auto_30271 ) ( SURFACE-AT ?auto_30273 ?auto_30271 ) ( CLEAR ?auto_30273 ) ( LIFTING ?auto_30278 ?auto_30265 ) ( IS-CRATE ?auto_30265 ) ( not ( = ?auto_30273 ?auto_30265 ) ) ( not ( = ?auto_30267 ?auto_30273 ) ) ( not ( = ?auto_30268 ?auto_30273 ) ) ( not ( = ?auto_30266 ?auto_30273 ) ) ( not ( = ?auto_30272 ?auto_30273 ) ) ( not ( = ?auto_30276 ?auto_30273 ) ) ( not ( = ?auto_30275 ?auto_30273 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30266 ?auto_30267 ?auto_30268 )
      ( MAKE-3CRATE-VERIFY ?auto_30265 ?auto_30266 ?auto_30267 ?auto_30268 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30280 - SURFACE
      ?auto_30281 - SURFACE
      ?auto_30282 - SURFACE
      ?auto_30283 - SURFACE
      ?auto_30284 - SURFACE
    )
    :vars
    (
      ?auto_30293 - HOIST
      ?auto_30287 - PLACE
      ?auto_30292 - PLACE
      ?auto_30294 - HOIST
      ?auto_30288 - SURFACE
      ?auto_30289 - PLACE
      ?auto_30286 - HOIST
      ?auto_30291 - SURFACE
      ?auto_30290 - SURFACE
      ?auto_30285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30293 ?auto_30287 ) ( IS-CRATE ?auto_30284 ) ( not ( = ?auto_30283 ?auto_30284 ) ) ( not ( = ?auto_30282 ?auto_30283 ) ) ( not ( = ?auto_30282 ?auto_30284 ) ) ( not ( = ?auto_30292 ?auto_30287 ) ) ( HOIST-AT ?auto_30294 ?auto_30292 ) ( not ( = ?auto_30293 ?auto_30294 ) ) ( AVAILABLE ?auto_30294 ) ( SURFACE-AT ?auto_30284 ?auto_30292 ) ( ON ?auto_30284 ?auto_30288 ) ( CLEAR ?auto_30284 ) ( not ( = ?auto_30283 ?auto_30288 ) ) ( not ( = ?auto_30284 ?auto_30288 ) ) ( not ( = ?auto_30282 ?auto_30288 ) ) ( IS-CRATE ?auto_30283 ) ( not ( = ?auto_30289 ?auto_30287 ) ) ( not ( = ?auto_30292 ?auto_30289 ) ) ( HOIST-AT ?auto_30286 ?auto_30289 ) ( not ( = ?auto_30293 ?auto_30286 ) ) ( not ( = ?auto_30294 ?auto_30286 ) ) ( SURFACE-AT ?auto_30283 ?auto_30289 ) ( ON ?auto_30283 ?auto_30291 ) ( CLEAR ?auto_30283 ) ( not ( = ?auto_30283 ?auto_30291 ) ) ( not ( = ?auto_30284 ?auto_30291 ) ) ( not ( = ?auto_30282 ?auto_30291 ) ) ( not ( = ?auto_30288 ?auto_30291 ) ) ( IS-CRATE ?auto_30282 ) ( not ( = ?auto_30281 ?auto_30282 ) ) ( not ( = ?auto_30283 ?auto_30281 ) ) ( not ( = ?auto_30284 ?auto_30281 ) ) ( not ( = ?auto_30288 ?auto_30281 ) ) ( not ( = ?auto_30291 ?auto_30281 ) ) ( AVAILABLE ?auto_30286 ) ( SURFACE-AT ?auto_30282 ?auto_30289 ) ( ON ?auto_30282 ?auto_30290 ) ( CLEAR ?auto_30282 ) ( not ( = ?auto_30283 ?auto_30290 ) ) ( not ( = ?auto_30284 ?auto_30290 ) ) ( not ( = ?auto_30282 ?auto_30290 ) ) ( not ( = ?auto_30288 ?auto_30290 ) ) ( not ( = ?auto_30291 ?auto_30290 ) ) ( not ( = ?auto_30281 ?auto_30290 ) ) ( TRUCK-AT ?auto_30285 ?auto_30287 ) ( SURFACE-AT ?auto_30280 ?auto_30287 ) ( CLEAR ?auto_30280 ) ( LIFTING ?auto_30293 ?auto_30281 ) ( IS-CRATE ?auto_30281 ) ( not ( = ?auto_30280 ?auto_30281 ) ) ( not ( = ?auto_30283 ?auto_30280 ) ) ( not ( = ?auto_30284 ?auto_30280 ) ) ( not ( = ?auto_30282 ?auto_30280 ) ) ( not ( = ?auto_30288 ?auto_30280 ) ) ( not ( = ?auto_30291 ?auto_30280 ) ) ( not ( = ?auto_30290 ?auto_30280 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30282 ?auto_30283 ?auto_30284 )
      ( MAKE-4CRATE-VERIFY ?auto_30280 ?auto_30281 ?auto_30282 ?auto_30283 ?auto_30284 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30295 - SURFACE
      ?auto_30296 - SURFACE
    )
    :vars
    (
      ?auto_30308 - HOIST
      ?auto_30299 - PLACE
      ?auto_30305 - SURFACE
      ?auto_30306 - PLACE
      ?auto_30309 - HOIST
      ?auto_30300 - SURFACE
      ?auto_30302 - PLACE
      ?auto_30298 - HOIST
      ?auto_30304 - SURFACE
      ?auto_30307 - SURFACE
      ?auto_30303 - SURFACE
      ?auto_30297 - TRUCK
      ?auto_30301 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30308 ?auto_30299 ) ( IS-CRATE ?auto_30296 ) ( not ( = ?auto_30295 ?auto_30296 ) ) ( not ( = ?auto_30305 ?auto_30295 ) ) ( not ( = ?auto_30305 ?auto_30296 ) ) ( not ( = ?auto_30306 ?auto_30299 ) ) ( HOIST-AT ?auto_30309 ?auto_30306 ) ( not ( = ?auto_30308 ?auto_30309 ) ) ( AVAILABLE ?auto_30309 ) ( SURFACE-AT ?auto_30296 ?auto_30306 ) ( ON ?auto_30296 ?auto_30300 ) ( CLEAR ?auto_30296 ) ( not ( = ?auto_30295 ?auto_30300 ) ) ( not ( = ?auto_30296 ?auto_30300 ) ) ( not ( = ?auto_30305 ?auto_30300 ) ) ( IS-CRATE ?auto_30295 ) ( not ( = ?auto_30302 ?auto_30299 ) ) ( not ( = ?auto_30306 ?auto_30302 ) ) ( HOIST-AT ?auto_30298 ?auto_30302 ) ( not ( = ?auto_30308 ?auto_30298 ) ) ( not ( = ?auto_30309 ?auto_30298 ) ) ( SURFACE-AT ?auto_30295 ?auto_30302 ) ( ON ?auto_30295 ?auto_30304 ) ( CLEAR ?auto_30295 ) ( not ( = ?auto_30295 ?auto_30304 ) ) ( not ( = ?auto_30296 ?auto_30304 ) ) ( not ( = ?auto_30305 ?auto_30304 ) ) ( not ( = ?auto_30300 ?auto_30304 ) ) ( IS-CRATE ?auto_30305 ) ( not ( = ?auto_30307 ?auto_30305 ) ) ( not ( = ?auto_30295 ?auto_30307 ) ) ( not ( = ?auto_30296 ?auto_30307 ) ) ( not ( = ?auto_30300 ?auto_30307 ) ) ( not ( = ?auto_30304 ?auto_30307 ) ) ( AVAILABLE ?auto_30298 ) ( SURFACE-AT ?auto_30305 ?auto_30302 ) ( ON ?auto_30305 ?auto_30303 ) ( CLEAR ?auto_30305 ) ( not ( = ?auto_30295 ?auto_30303 ) ) ( not ( = ?auto_30296 ?auto_30303 ) ) ( not ( = ?auto_30305 ?auto_30303 ) ) ( not ( = ?auto_30300 ?auto_30303 ) ) ( not ( = ?auto_30304 ?auto_30303 ) ) ( not ( = ?auto_30307 ?auto_30303 ) ) ( TRUCK-AT ?auto_30297 ?auto_30299 ) ( SURFACE-AT ?auto_30301 ?auto_30299 ) ( CLEAR ?auto_30301 ) ( IS-CRATE ?auto_30307 ) ( not ( = ?auto_30301 ?auto_30307 ) ) ( not ( = ?auto_30295 ?auto_30301 ) ) ( not ( = ?auto_30296 ?auto_30301 ) ) ( not ( = ?auto_30305 ?auto_30301 ) ) ( not ( = ?auto_30300 ?auto_30301 ) ) ( not ( = ?auto_30304 ?auto_30301 ) ) ( not ( = ?auto_30303 ?auto_30301 ) ) ( AVAILABLE ?auto_30308 ) ( IN ?auto_30307 ?auto_30297 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30308 ?auto_30307 ?auto_30297 ?auto_30299 )
      ( MAKE-2CRATE ?auto_30305 ?auto_30295 ?auto_30296 )
      ( MAKE-1CRATE-VERIFY ?auto_30295 ?auto_30296 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30310 - SURFACE
      ?auto_30311 - SURFACE
      ?auto_30312 - SURFACE
    )
    :vars
    (
      ?auto_30316 - HOIST
      ?auto_30324 - PLACE
      ?auto_30313 - PLACE
      ?auto_30314 - HOIST
      ?auto_30319 - SURFACE
      ?auto_30322 - PLACE
      ?auto_30318 - HOIST
      ?auto_30315 - SURFACE
      ?auto_30321 - SURFACE
      ?auto_30317 - SURFACE
      ?auto_30320 - TRUCK
      ?auto_30323 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30316 ?auto_30324 ) ( IS-CRATE ?auto_30312 ) ( not ( = ?auto_30311 ?auto_30312 ) ) ( not ( = ?auto_30310 ?auto_30311 ) ) ( not ( = ?auto_30310 ?auto_30312 ) ) ( not ( = ?auto_30313 ?auto_30324 ) ) ( HOIST-AT ?auto_30314 ?auto_30313 ) ( not ( = ?auto_30316 ?auto_30314 ) ) ( AVAILABLE ?auto_30314 ) ( SURFACE-AT ?auto_30312 ?auto_30313 ) ( ON ?auto_30312 ?auto_30319 ) ( CLEAR ?auto_30312 ) ( not ( = ?auto_30311 ?auto_30319 ) ) ( not ( = ?auto_30312 ?auto_30319 ) ) ( not ( = ?auto_30310 ?auto_30319 ) ) ( IS-CRATE ?auto_30311 ) ( not ( = ?auto_30322 ?auto_30324 ) ) ( not ( = ?auto_30313 ?auto_30322 ) ) ( HOIST-AT ?auto_30318 ?auto_30322 ) ( not ( = ?auto_30316 ?auto_30318 ) ) ( not ( = ?auto_30314 ?auto_30318 ) ) ( SURFACE-AT ?auto_30311 ?auto_30322 ) ( ON ?auto_30311 ?auto_30315 ) ( CLEAR ?auto_30311 ) ( not ( = ?auto_30311 ?auto_30315 ) ) ( not ( = ?auto_30312 ?auto_30315 ) ) ( not ( = ?auto_30310 ?auto_30315 ) ) ( not ( = ?auto_30319 ?auto_30315 ) ) ( IS-CRATE ?auto_30310 ) ( not ( = ?auto_30321 ?auto_30310 ) ) ( not ( = ?auto_30311 ?auto_30321 ) ) ( not ( = ?auto_30312 ?auto_30321 ) ) ( not ( = ?auto_30319 ?auto_30321 ) ) ( not ( = ?auto_30315 ?auto_30321 ) ) ( AVAILABLE ?auto_30318 ) ( SURFACE-AT ?auto_30310 ?auto_30322 ) ( ON ?auto_30310 ?auto_30317 ) ( CLEAR ?auto_30310 ) ( not ( = ?auto_30311 ?auto_30317 ) ) ( not ( = ?auto_30312 ?auto_30317 ) ) ( not ( = ?auto_30310 ?auto_30317 ) ) ( not ( = ?auto_30319 ?auto_30317 ) ) ( not ( = ?auto_30315 ?auto_30317 ) ) ( not ( = ?auto_30321 ?auto_30317 ) ) ( TRUCK-AT ?auto_30320 ?auto_30324 ) ( SURFACE-AT ?auto_30323 ?auto_30324 ) ( CLEAR ?auto_30323 ) ( IS-CRATE ?auto_30321 ) ( not ( = ?auto_30323 ?auto_30321 ) ) ( not ( = ?auto_30311 ?auto_30323 ) ) ( not ( = ?auto_30312 ?auto_30323 ) ) ( not ( = ?auto_30310 ?auto_30323 ) ) ( not ( = ?auto_30319 ?auto_30323 ) ) ( not ( = ?auto_30315 ?auto_30323 ) ) ( not ( = ?auto_30317 ?auto_30323 ) ) ( AVAILABLE ?auto_30316 ) ( IN ?auto_30321 ?auto_30320 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30311 ?auto_30312 )
      ( MAKE-2CRATE-VERIFY ?auto_30310 ?auto_30311 ?auto_30312 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30325 - SURFACE
      ?auto_30326 - SURFACE
      ?auto_30327 - SURFACE
      ?auto_30328 - SURFACE
    )
    :vars
    (
      ?auto_30331 - HOIST
      ?auto_30335 - PLACE
      ?auto_30334 - PLACE
      ?auto_30337 - HOIST
      ?auto_30338 - SURFACE
      ?auto_30330 - PLACE
      ?auto_30336 - HOIST
      ?auto_30333 - SURFACE
      ?auto_30329 - SURFACE
      ?auto_30332 - TRUCK
      ?auto_30339 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30331 ?auto_30335 ) ( IS-CRATE ?auto_30328 ) ( not ( = ?auto_30327 ?auto_30328 ) ) ( not ( = ?auto_30326 ?auto_30327 ) ) ( not ( = ?auto_30326 ?auto_30328 ) ) ( not ( = ?auto_30334 ?auto_30335 ) ) ( HOIST-AT ?auto_30337 ?auto_30334 ) ( not ( = ?auto_30331 ?auto_30337 ) ) ( AVAILABLE ?auto_30337 ) ( SURFACE-AT ?auto_30328 ?auto_30334 ) ( ON ?auto_30328 ?auto_30338 ) ( CLEAR ?auto_30328 ) ( not ( = ?auto_30327 ?auto_30338 ) ) ( not ( = ?auto_30328 ?auto_30338 ) ) ( not ( = ?auto_30326 ?auto_30338 ) ) ( IS-CRATE ?auto_30327 ) ( not ( = ?auto_30330 ?auto_30335 ) ) ( not ( = ?auto_30334 ?auto_30330 ) ) ( HOIST-AT ?auto_30336 ?auto_30330 ) ( not ( = ?auto_30331 ?auto_30336 ) ) ( not ( = ?auto_30337 ?auto_30336 ) ) ( SURFACE-AT ?auto_30327 ?auto_30330 ) ( ON ?auto_30327 ?auto_30333 ) ( CLEAR ?auto_30327 ) ( not ( = ?auto_30327 ?auto_30333 ) ) ( not ( = ?auto_30328 ?auto_30333 ) ) ( not ( = ?auto_30326 ?auto_30333 ) ) ( not ( = ?auto_30338 ?auto_30333 ) ) ( IS-CRATE ?auto_30326 ) ( not ( = ?auto_30325 ?auto_30326 ) ) ( not ( = ?auto_30327 ?auto_30325 ) ) ( not ( = ?auto_30328 ?auto_30325 ) ) ( not ( = ?auto_30338 ?auto_30325 ) ) ( not ( = ?auto_30333 ?auto_30325 ) ) ( AVAILABLE ?auto_30336 ) ( SURFACE-AT ?auto_30326 ?auto_30330 ) ( ON ?auto_30326 ?auto_30329 ) ( CLEAR ?auto_30326 ) ( not ( = ?auto_30327 ?auto_30329 ) ) ( not ( = ?auto_30328 ?auto_30329 ) ) ( not ( = ?auto_30326 ?auto_30329 ) ) ( not ( = ?auto_30338 ?auto_30329 ) ) ( not ( = ?auto_30333 ?auto_30329 ) ) ( not ( = ?auto_30325 ?auto_30329 ) ) ( TRUCK-AT ?auto_30332 ?auto_30335 ) ( SURFACE-AT ?auto_30339 ?auto_30335 ) ( CLEAR ?auto_30339 ) ( IS-CRATE ?auto_30325 ) ( not ( = ?auto_30339 ?auto_30325 ) ) ( not ( = ?auto_30327 ?auto_30339 ) ) ( not ( = ?auto_30328 ?auto_30339 ) ) ( not ( = ?auto_30326 ?auto_30339 ) ) ( not ( = ?auto_30338 ?auto_30339 ) ) ( not ( = ?auto_30333 ?auto_30339 ) ) ( not ( = ?auto_30329 ?auto_30339 ) ) ( AVAILABLE ?auto_30331 ) ( IN ?auto_30325 ?auto_30332 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30326 ?auto_30327 ?auto_30328 )
      ( MAKE-3CRATE-VERIFY ?auto_30325 ?auto_30326 ?auto_30327 ?auto_30328 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30340 - SURFACE
      ?auto_30341 - SURFACE
      ?auto_30342 - SURFACE
      ?auto_30343 - SURFACE
      ?auto_30344 - SURFACE
    )
    :vars
    (
      ?auto_30347 - HOIST
      ?auto_30351 - PLACE
      ?auto_30350 - PLACE
      ?auto_30353 - HOIST
      ?auto_30354 - SURFACE
      ?auto_30346 - PLACE
      ?auto_30352 - HOIST
      ?auto_30349 - SURFACE
      ?auto_30345 - SURFACE
      ?auto_30348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30347 ?auto_30351 ) ( IS-CRATE ?auto_30344 ) ( not ( = ?auto_30343 ?auto_30344 ) ) ( not ( = ?auto_30342 ?auto_30343 ) ) ( not ( = ?auto_30342 ?auto_30344 ) ) ( not ( = ?auto_30350 ?auto_30351 ) ) ( HOIST-AT ?auto_30353 ?auto_30350 ) ( not ( = ?auto_30347 ?auto_30353 ) ) ( AVAILABLE ?auto_30353 ) ( SURFACE-AT ?auto_30344 ?auto_30350 ) ( ON ?auto_30344 ?auto_30354 ) ( CLEAR ?auto_30344 ) ( not ( = ?auto_30343 ?auto_30354 ) ) ( not ( = ?auto_30344 ?auto_30354 ) ) ( not ( = ?auto_30342 ?auto_30354 ) ) ( IS-CRATE ?auto_30343 ) ( not ( = ?auto_30346 ?auto_30351 ) ) ( not ( = ?auto_30350 ?auto_30346 ) ) ( HOIST-AT ?auto_30352 ?auto_30346 ) ( not ( = ?auto_30347 ?auto_30352 ) ) ( not ( = ?auto_30353 ?auto_30352 ) ) ( SURFACE-AT ?auto_30343 ?auto_30346 ) ( ON ?auto_30343 ?auto_30349 ) ( CLEAR ?auto_30343 ) ( not ( = ?auto_30343 ?auto_30349 ) ) ( not ( = ?auto_30344 ?auto_30349 ) ) ( not ( = ?auto_30342 ?auto_30349 ) ) ( not ( = ?auto_30354 ?auto_30349 ) ) ( IS-CRATE ?auto_30342 ) ( not ( = ?auto_30341 ?auto_30342 ) ) ( not ( = ?auto_30343 ?auto_30341 ) ) ( not ( = ?auto_30344 ?auto_30341 ) ) ( not ( = ?auto_30354 ?auto_30341 ) ) ( not ( = ?auto_30349 ?auto_30341 ) ) ( AVAILABLE ?auto_30352 ) ( SURFACE-AT ?auto_30342 ?auto_30346 ) ( ON ?auto_30342 ?auto_30345 ) ( CLEAR ?auto_30342 ) ( not ( = ?auto_30343 ?auto_30345 ) ) ( not ( = ?auto_30344 ?auto_30345 ) ) ( not ( = ?auto_30342 ?auto_30345 ) ) ( not ( = ?auto_30354 ?auto_30345 ) ) ( not ( = ?auto_30349 ?auto_30345 ) ) ( not ( = ?auto_30341 ?auto_30345 ) ) ( TRUCK-AT ?auto_30348 ?auto_30351 ) ( SURFACE-AT ?auto_30340 ?auto_30351 ) ( CLEAR ?auto_30340 ) ( IS-CRATE ?auto_30341 ) ( not ( = ?auto_30340 ?auto_30341 ) ) ( not ( = ?auto_30343 ?auto_30340 ) ) ( not ( = ?auto_30344 ?auto_30340 ) ) ( not ( = ?auto_30342 ?auto_30340 ) ) ( not ( = ?auto_30354 ?auto_30340 ) ) ( not ( = ?auto_30349 ?auto_30340 ) ) ( not ( = ?auto_30345 ?auto_30340 ) ) ( AVAILABLE ?auto_30347 ) ( IN ?auto_30341 ?auto_30348 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30342 ?auto_30343 ?auto_30344 )
      ( MAKE-4CRATE-VERIFY ?auto_30340 ?auto_30341 ?auto_30342 ?auto_30343 ?auto_30344 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30355 - SURFACE
      ?auto_30356 - SURFACE
    )
    :vars
    (
      ?auto_30360 - HOIST
      ?auto_30364 - PLACE
      ?auto_30357 - SURFACE
      ?auto_30363 - PLACE
      ?auto_30367 - HOIST
      ?auto_30368 - SURFACE
      ?auto_30359 - PLACE
      ?auto_30366 - HOIST
      ?auto_30362 - SURFACE
      ?auto_30365 - SURFACE
      ?auto_30358 - SURFACE
      ?auto_30369 - SURFACE
      ?auto_30361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30360 ?auto_30364 ) ( IS-CRATE ?auto_30356 ) ( not ( = ?auto_30355 ?auto_30356 ) ) ( not ( = ?auto_30357 ?auto_30355 ) ) ( not ( = ?auto_30357 ?auto_30356 ) ) ( not ( = ?auto_30363 ?auto_30364 ) ) ( HOIST-AT ?auto_30367 ?auto_30363 ) ( not ( = ?auto_30360 ?auto_30367 ) ) ( AVAILABLE ?auto_30367 ) ( SURFACE-AT ?auto_30356 ?auto_30363 ) ( ON ?auto_30356 ?auto_30368 ) ( CLEAR ?auto_30356 ) ( not ( = ?auto_30355 ?auto_30368 ) ) ( not ( = ?auto_30356 ?auto_30368 ) ) ( not ( = ?auto_30357 ?auto_30368 ) ) ( IS-CRATE ?auto_30355 ) ( not ( = ?auto_30359 ?auto_30364 ) ) ( not ( = ?auto_30363 ?auto_30359 ) ) ( HOIST-AT ?auto_30366 ?auto_30359 ) ( not ( = ?auto_30360 ?auto_30366 ) ) ( not ( = ?auto_30367 ?auto_30366 ) ) ( SURFACE-AT ?auto_30355 ?auto_30359 ) ( ON ?auto_30355 ?auto_30362 ) ( CLEAR ?auto_30355 ) ( not ( = ?auto_30355 ?auto_30362 ) ) ( not ( = ?auto_30356 ?auto_30362 ) ) ( not ( = ?auto_30357 ?auto_30362 ) ) ( not ( = ?auto_30368 ?auto_30362 ) ) ( IS-CRATE ?auto_30357 ) ( not ( = ?auto_30365 ?auto_30357 ) ) ( not ( = ?auto_30355 ?auto_30365 ) ) ( not ( = ?auto_30356 ?auto_30365 ) ) ( not ( = ?auto_30368 ?auto_30365 ) ) ( not ( = ?auto_30362 ?auto_30365 ) ) ( AVAILABLE ?auto_30366 ) ( SURFACE-AT ?auto_30357 ?auto_30359 ) ( ON ?auto_30357 ?auto_30358 ) ( CLEAR ?auto_30357 ) ( not ( = ?auto_30355 ?auto_30358 ) ) ( not ( = ?auto_30356 ?auto_30358 ) ) ( not ( = ?auto_30357 ?auto_30358 ) ) ( not ( = ?auto_30368 ?auto_30358 ) ) ( not ( = ?auto_30362 ?auto_30358 ) ) ( not ( = ?auto_30365 ?auto_30358 ) ) ( SURFACE-AT ?auto_30369 ?auto_30364 ) ( CLEAR ?auto_30369 ) ( IS-CRATE ?auto_30365 ) ( not ( = ?auto_30369 ?auto_30365 ) ) ( not ( = ?auto_30355 ?auto_30369 ) ) ( not ( = ?auto_30356 ?auto_30369 ) ) ( not ( = ?auto_30357 ?auto_30369 ) ) ( not ( = ?auto_30368 ?auto_30369 ) ) ( not ( = ?auto_30362 ?auto_30369 ) ) ( not ( = ?auto_30358 ?auto_30369 ) ) ( AVAILABLE ?auto_30360 ) ( IN ?auto_30365 ?auto_30361 ) ( TRUCK-AT ?auto_30361 ?auto_30363 ) )
    :subtasks
    ( ( !DRIVE ?auto_30361 ?auto_30363 ?auto_30364 )
      ( MAKE-2CRATE ?auto_30357 ?auto_30355 ?auto_30356 )
      ( MAKE-1CRATE-VERIFY ?auto_30355 ?auto_30356 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30370 - SURFACE
      ?auto_30371 - SURFACE
      ?auto_30372 - SURFACE
    )
    :vars
    (
      ?auto_30382 - HOIST
      ?auto_30380 - PLACE
      ?auto_30383 - PLACE
      ?auto_30377 - HOIST
      ?auto_30376 - SURFACE
      ?auto_30375 - PLACE
      ?auto_30374 - HOIST
      ?auto_30381 - SURFACE
      ?auto_30378 - SURFACE
      ?auto_30384 - SURFACE
      ?auto_30373 - SURFACE
      ?auto_30379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30382 ?auto_30380 ) ( IS-CRATE ?auto_30372 ) ( not ( = ?auto_30371 ?auto_30372 ) ) ( not ( = ?auto_30370 ?auto_30371 ) ) ( not ( = ?auto_30370 ?auto_30372 ) ) ( not ( = ?auto_30383 ?auto_30380 ) ) ( HOIST-AT ?auto_30377 ?auto_30383 ) ( not ( = ?auto_30382 ?auto_30377 ) ) ( AVAILABLE ?auto_30377 ) ( SURFACE-AT ?auto_30372 ?auto_30383 ) ( ON ?auto_30372 ?auto_30376 ) ( CLEAR ?auto_30372 ) ( not ( = ?auto_30371 ?auto_30376 ) ) ( not ( = ?auto_30372 ?auto_30376 ) ) ( not ( = ?auto_30370 ?auto_30376 ) ) ( IS-CRATE ?auto_30371 ) ( not ( = ?auto_30375 ?auto_30380 ) ) ( not ( = ?auto_30383 ?auto_30375 ) ) ( HOIST-AT ?auto_30374 ?auto_30375 ) ( not ( = ?auto_30382 ?auto_30374 ) ) ( not ( = ?auto_30377 ?auto_30374 ) ) ( SURFACE-AT ?auto_30371 ?auto_30375 ) ( ON ?auto_30371 ?auto_30381 ) ( CLEAR ?auto_30371 ) ( not ( = ?auto_30371 ?auto_30381 ) ) ( not ( = ?auto_30372 ?auto_30381 ) ) ( not ( = ?auto_30370 ?auto_30381 ) ) ( not ( = ?auto_30376 ?auto_30381 ) ) ( IS-CRATE ?auto_30370 ) ( not ( = ?auto_30378 ?auto_30370 ) ) ( not ( = ?auto_30371 ?auto_30378 ) ) ( not ( = ?auto_30372 ?auto_30378 ) ) ( not ( = ?auto_30376 ?auto_30378 ) ) ( not ( = ?auto_30381 ?auto_30378 ) ) ( AVAILABLE ?auto_30374 ) ( SURFACE-AT ?auto_30370 ?auto_30375 ) ( ON ?auto_30370 ?auto_30384 ) ( CLEAR ?auto_30370 ) ( not ( = ?auto_30371 ?auto_30384 ) ) ( not ( = ?auto_30372 ?auto_30384 ) ) ( not ( = ?auto_30370 ?auto_30384 ) ) ( not ( = ?auto_30376 ?auto_30384 ) ) ( not ( = ?auto_30381 ?auto_30384 ) ) ( not ( = ?auto_30378 ?auto_30384 ) ) ( SURFACE-AT ?auto_30373 ?auto_30380 ) ( CLEAR ?auto_30373 ) ( IS-CRATE ?auto_30378 ) ( not ( = ?auto_30373 ?auto_30378 ) ) ( not ( = ?auto_30371 ?auto_30373 ) ) ( not ( = ?auto_30372 ?auto_30373 ) ) ( not ( = ?auto_30370 ?auto_30373 ) ) ( not ( = ?auto_30376 ?auto_30373 ) ) ( not ( = ?auto_30381 ?auto_30373 ) ) ( not ( = ?auto_30384 ?auto_30373 ) ) ( AVAILABLE ?auto_30382 ) ( IN ?auto_30378 ?auto_30379 ) ( TRUCK-AT ?auto_30379 ?auto_30383 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30371 ?auto_30372 )
      ( MAKE-2CRATE-VERIFY ?auto_30370 ?auto_30371 ?auto_30372 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30385 - SURFACE
      ?auto_30386 - SURFACE
      ?auto_30387 - SURFACE
      ?auto_30388 - SURFACE
    )
    :vars
    (
      ?auto_30395 - HOIST
      ?auto_30392 - PLACE
      ?auto_30393 - PLACE
      ?auto_30398 - HOIST
      ?auto_30397 - SURFACE
      ?auto_30399 - PLACE
      ?auto_30396 - HOIST
      ?auto_30391 - SURFACE
      ?auto_30389 - SURFACE
      ?auto_30394 - SURFACE
      ?auto_30390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30395 ?auto_30392 ) ( IS-CRATE ?auto_30388 ) ( not ( = ?auto_30387 ?auto_30388 ) ) ( not ( = ?auto_30386 ?auto_30387 ) ) ( not ( = ?auto_30386 ?auto_30388 ) ) ( not ( = ?auto_30393 ?auto_30392 ) ) ( HOIST-AT ?auto_30398 ?auto_30393 ) ( not ( = ?auto_30395 ?auto_30398 ) ) ( AVAILABLE ?auto_30398 ) ( SURFACE-AT ?auto_30388 ?auto_30393 ) ( ON ?auto_30388 ?auto_30397 ) ( CLEAR ?auto_30388 ) ( not ( = ?auto_30387 ?auto_30397 ) ) ( not ( = ?auto_30388 ?auto_30397 ) ) ( not ( = ?auto_30386 ?auto_30397 ) ) ( IS-CRATE ?auto_30387 ) ( not ( = ?auto_30399 ?auto_30392 ) ) ( not ( = ?auto_30393 ?auto_30399 ) ) ( HOIST-AT ?auto_30396 ?auto_30399 ) ( not ( = ?auto_30395 ?auto_30396 ) ) ( not ( = ?auto_30398 ?auto_30396 ) ) ( SURFACE-AT ?auto_30387 ?auto_30399 ) ( ON ?auto_30387 ?auto_30391 ) ( CLEAR ?auto_30387 ) ( not ( = ?auto_30387 ?auto_30391 ) ) ( not ( = ?auto_30388 ?auto_30391 ) ) ( not ( = ?auto_30386 ?auto_30391 ) ) ( not ( = ?auto_30397 ?auto_30391 ) ) ( IS-CRATE ?auto_30386 ) ( not ( = ?auto_30385 ?auto_30386 ) ) ( not ( = ?auto_30387 ?auto_30385 ) ) ( not ( = ?auto_30388 ?auto_30385 ) ) ( not ( = ?auto_30397 ?auto_30385 ) ) ( not ( = ?auto_30391 ?auto_30385 ) ) ( AVAILABLE ?auto_30396 ) ( SURFACE-AT ?auto_30386 ?auto_30399 ) ( ON ?auto_30386 ?auto_30389 ) ( CLEAR ?auto_30386 ) ( not ( = ?auto_30387 ?auto_30389 ) ) ( not ( = ?auto_30388 ?auto_30389 ) ) ( not ( = ?auto_30386 ?auto_30389 ) ) ( not ( = ?auto_30397 ?auto_30389 ) ) ( not ( = ?auto_30391 ?auto_30389 ) ) ( not ( = ?auto_30385 ?auto_30389 ) ) ( SURFACE-AT ?auto_30394 ?auto_30392 ) ( CLEAR ?auto_30394 ) ( IS-CRATE ?auto_30385 ) ( not ( = ?auto_30394 ?auto_30385 ) ) ( not ( = ?auto_30387 ?auto_30394 ) ) ( not ( = ?auto_30388 ?auto_30394 ) ) ( not ( = ?auto_30386 ?auto_30394 ) ) ( not ( = ?auto_30397 ?auto_30394 ) ) ( not ( = ?auto_30391 ?auto_30394 ) ) ( not ( = ?auto_30389 ?auto_30394 ) ) ( AVAILABLE ?auto_30395 ) ( IN ?auto_30385 ?auto_30390 ) ( TRUCK-AT ?auto_30390 ?auto_30393 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30386 ?auto_30387 ?auto_30388 )
      ( MAKE-3CRATE-VERIFY ?auto_30385 ?auto_30386 ?auto_30387 ?auto_30388 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30400 - SURFACE
      ?auto_30401 - SURFACE
      ?auto_30402 - SURFACE
      ?auto_30403 - SURFACE
      ?auto_30404 - SURFACE
    )
    :vars
    (
      ?auto_30410 - HOIST
      ?auto_30408 - PLACE
      ?auto_30409 - PLACE
      ?auto_30413 - HOIST
      ?auto_30412 - SURFACE
      ?auto_30414 - PLACE
      ?auto_30411 - HOIST
      ?auto_30407 - SURFACE
      ?auto_30405 - SURFACE
      ?auto_30406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30410 ?auto_30408 ) ( IS-CRATE ?auto_30404 ) ( not ( = ?auto_30403 ?auto_30404 ) ) ( not ( = ?auto_30402 ?auto_30403 ) ) ( not ( = ?auto_30402 ?auto_30404 ) ) ( not ( = ?auto_30409 ?auto_30408 ) ) ( HOIST-AT ?auto_30413 ?auto_30409 ) ( not ( = ?auto_30410 ?auto_30413 ) ) ( AVAILABLE ?auto_30413 ) ( SURFACE-AT ?auto_30404 ?auto_30409 ) ( ON ?auto_30404 ?auto_30412 ) ( CLEAR ?auto_30404 ) ( not ( = ?auto_30403 ?auto_30412 ) ) ( not ( = ?auto_30404 ?auto_30412 ) ) ( not ( = ?auto_30402 ?auto_30412 ) ) ( IS-CRATE ?auto_30403 ) ( not ( = ?auto_30414 ?auto_30408 ) ) ( not ( = ?auto_30409 ?auto_30414 ) ) ( HOIST-AT ?auto_30411 ?auto_30414 ) ( not ( = ?auto_30410 ?auto_30411 ) ) ( not ( = ?auto_30413 ?auto_30411 ) ) ( SURFACE-AT ?auto_30403 ?auto_30414 ) ( ON ?auto_30403 ?auto_30407 ) ( CLEAR ?auto_30403 ) ( not ( = ?auto_30403 ?auto_30407 ) ) ( not ( = ?auto_30404 ?auto_30407 ) ) ( not ( = ?auto_30402 ?auto_30407 ) ) ( not ( = ?auto_30412 ?auto_30407 ) ) ( IS-CRATE ?auto_30402 ) ( not ( = ?auto_30401 ?auto_30402 ) ) ( not ( = ?auto_30403 ?auto_30401 ) ) ( not ( = ?auto_30404 ?auto_30401 ) ) ( not ( = ?auto_30412 ?auto_30401 ) ) ( not ( = ?auto_30407 ?auto_30401 ) ) ( AVAILABLE ?auto_30411 ) ( SURFACE-AT ?auto_30402 ?auto_30414 ) ( ON ?auto_30402 ?auto_30405 ) ( CLEAR ?auto_30402 ) ( not ( = ?auto_30403 ?auto_30405 ) ) ( not ( = ?auto_30404 ?auto_30405 ) ) ( not ( = ?auto_30402 ?auto_30405 ) ) ( not ( = ?auto_30412 ?auto_30405 ) ) ( not ( = ?auto_30407 ?auto_30405 ) ) ( not ( = ?auto_30401 ?auto_30405 ) ) ( SURFACE-AT ?auto_30400 ?auto_30408 ) ( CLEAR ?auto_30400 ) ( IS-CRATE ?auto_30401 ) ( not ( = ?auto_30400 ?auto_30401 ) ) ( not ( = ?auto_30403 ?auto_30400 ) ) ( not ( = ?auto_30404 ?auto_30400 ) ) ( not ( = ?auto_30402 ?auto_30400 ) ) ( not ( = ?auto_30412 ?auto_30400 ) ) ( not ( = ?auto_30407 ?auto_30400 ) ) ( not ( = ?auto_30405 ?auto_30400 ) ) ( AVAILABLE ?auto_30410 ) ( IN ?auto_30401 ?auto_30406 ) ( TRUCK-AT ?auto_30406 ?auto_30409 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30402 ?auto_30403 ?auto_30404 )
      ( MAKE-4CRATE-VERIFY ?auto_30400 ?auto_30401 ?auto_30402 ?auto_30403 ?auto_30404 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30415 - SURFACE
      ?auto_30416 - SURFACE
    )
    :vars
    (
      ?auto_30424 - HOIST
      ?auto_30421 - PLACE
      ?auto_30425 - SURFACE
      ?auto_30422 - PLACE
      ?auto_30428 - HOIST
      ?auto_30427 - SURFACE
      ?auto_30429 - PLACE
      ?auto_30426 - HOIST
      ?auto_30420 - SURFACE
      ?auto_30419 - SURFACE
      ?auto_30417 - SURFACE
      ?auto_30423 - SURFACE
      ?auto_30418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30424 ?auto_30421 ) ( IS-CRATE ?auto_30416 ) ( not ( = ?auto_30415 ?auto_30416 ) ) ( not ( = ?auto_30425 ?auto_30415 ) ) ( not ( = ?auto_30425 ?auto_30416 ) ) ( not ( = ?auto_30422 ?auto_30421 ) ) ( HOIST-AT ?auto_30428 ?auto_30422 ) ( not ( = ?auto_30424 ?auto_30428 ) ) ( SURFACE-AT ?auto_30416 ?auto_30422 ) ( ON ?auto_30416 ?auto_30427 ) ( CLEAR ?auto_30416 ) ( not ( = ?auto_30415 ?auto_30427 ) ) ( not ( = ?auto_30416 ?auto_30427 ) ) ( not ( = ?auto_30425 ?auto_30427 ) ) ( IS-CRATE ?auto_30415 ) ( not ( = ?auto_30429 ?auto_30421 ) ) ( not ( = ?auto_30422 ?auto_30429 ) ) ( HOIST-AT ?auto_30426 ?auto_30429 ) ( not ( = ?auto_30424 ?auto_30426 ) ) ( not ( = ?auto_30428 ?auto_30426 ) ) ( SURFACE-AT ?auto_30415 ?auto_30429 ) ( ON ?auto_30415 ?auto_30420 ) ( CLEAR ?auto_30415 ) ( not ( = ?auto_30415 ?auto_30420 ) ) ( not ( = ?auto_30416 ?auto_30420 ) ) ( not ( = ?auto_30425 ?auto_30420 ) ) ( not ( = ?auto_30427 ?auto_30420 ) ) ( IS-CRATE ?auto_30425 ) ( not ( = ?auto_30419 ?auto_30425 ) ) ( not ( = ?auto_30415 ?auto_30419 ) ) ( not ( = ?auto_30416 ?auto_30419 ) ) ( not ( = ?auto_30427 ?auto_30419 ) ) ( not ( = ?auto_30420 ?auto_30419 ) ) ( AVAILABLE ?auto_30426 ) ( SURFACE-AT ?auto_30425 ?auto_30429 ) ( ON ?auto_30425 ?auto_30417 ) ( CLEAR ?auto_30425 ) ( not ( = ?auto_30415 ?auto_30417 ) ) ( not ( = ?auto_30416 ?auto_30417 ) ) ( not ( = ?auto_30425 ?auto_30417 ) ) ( not ( = ?auto_30427 ?auto_30417 ) ) ( not ( = ?auto_30420 ?auto_30417 ) ) ( not ( = ?auto_30419 ?auto_30417 ) ) ( SURFACE-AT ?auto_30423 ?auto_30421 ) ( CLEAR ?auto_30423 ) ( IS-CRATE ?auto_30419 ) ( not ( = ?auto_30423 ?auto_30419 ) ) ( not ( = ?auto_30415 ?auto_30423 ) ) ( not ( = ?auto_30416 ?auto_30423 ) ) ( not ( = ?auto_30425 ?auto_30423 ) ) ( not ( = ?auto_30427 ?auto_30423 ) ) ( not ( = ?auto_30420 ?auto_30423 ) ) ( not ( = ?auto_30417 ?auto_30423 ) ) ( AVAILABLE ?auto_30424 ) ( TRUCK-AT ?auto_30418 ?auto_30422 ) ( LIFTING ?auto_30428 ?auto_30419 ) )
    :subtasks
    ( ( !LOAD ?auto_30428 ?auto_30419 ?auto_30418 ?auto_30422 )
      ( MAKE-2CRATE ?auto_30425 ?auto_30415 ?auto_30416 )
      ( MAKE-1CRATE-VERIFY ?auto_30415 ?auto_30416 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30430 - SURFACE
      ?auto_30431 - SURFACE
      ?auto_30432 - SURFACE
    )
    :vars
    (
      ?auto_30436 - HOIST
      ?auto_30437 - PLACE
      ?auto_30433 - PLACE
      ?auto_30442 - HOIST
      ?auto_30435 - SURFACE
      ?auto_30444 - PLACE
      ?auto_30439 - HOIST
      ?auto_30440 - SURFACE
      ?auto_30434 - SURFACE
      ?auto_30441 - SURFACE
      ?auto_30443 - SURFACE
      ?auto_30438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30436 ?auto_30437 ) ( IS-CRATE ?auto_30432 ) ( not ( = ?auto_30431 ?auto_30432 ) ) ( not ( = ?auto_30430 ?auto_30431 ) ) ( not ( = ?auto_30430 ?auto_30432 ) ) ( not ( = ?auto_30433 ?auto_30437 ) ) ( HOIST-AT ?auto_30442 ?auto_30433 ) ( not ( = ?auto_30436 ?auto_30442 ) ) ( SURFACE-AT ?auto_30432 ?auto_30433 ) ( ON ?auto_30432 ?auto_30435 ) ( CLEAR ?auto_30432 ) ( not ( = ?auto_30431 ?auto_30435 ) ) ( not ( = ?auto_30432 ?auto_30435 ) ) ( not ( = ?auto_30430 ?auto_30435 ) ) ( IS-CRATE ?auto_30431 ) ( not ( = ?auto_30444 ?auto_30437 ) ) ( not ( = ?auto_30433 ?auto_30444 ) ) ( HOIST-AT ?auto_30439 ?auto_30444 ) ( not ( = ?auto_30436 ?auto_30439 ) ) ( not ( = ?auto_30442 ?auto_30439 ) ) ( SURFACE-AT ?auto_30431 ?auto_30444 ) ( ON ?auto_30431 ?auto_30440 ) ( CLEAR ?auto_30431 ) ( not ( = ?auto_30431 ?auto_30440 ) ) ( not ( = ?auto_30432 ?auto_30440 ) ) ( not ( = ?auto_30430 ?auto_30440 ) ) ( not ( = ?auto_30435 ?auto_30440 ) ) ( IS-CRATE ?auto_30430 ) ( not ( = ?auto_30434 ?auto_30430 ) ) ( not ( = ?auto_30431 ?auto_30434 ) ) ( not ( = ?auto_30432 ?auto_30434 ) ) ( not ( = ?auto_30435 ?auto_30434 ) ) ( not ( = ?auto_30440 ?auto_30434 ) ) ( AVAILABLE ?auto_30439 ) ( SURFACE-AT ?auto_30430 ?auto_30444 ) ( ON ?auto_30430 ?auto_30441 ) ( CLEAR ?auto_30430 ) ( not ( = ?auto_30431 ?auto_30441 ) ) ( not ( = ?auto_30432 ?auto_30441 ) ) ( not ( = ?auto_30430 ?auto_30441 ) ) ( not ( = ?auto_30435 ?auto_30441 ) ) ( not ( = ?auto_30440 ?auto_30441 ) ) ( not ( = ?auto_30434 ?auto_30441 ) ) ( SURFACE-AT ?auto_30443 ?auto_30437 ) ( CLEAR ?auto_30443 ) ( IS-CRATE ?auto_30434 ) ( not ( = ?auto_30443 ?auto_30434 ) ) ( not ( = ?auto_30431 ?auto_30443 ) ) ( not ( = ?auto_30432 ?auto_30443 ) ) ( not ( = ?auto_30430 ?auto_30443 ) ) ( not ( = ?auto_30435 ?auto_30443 ) ) ( not ( = ?auto_30440 ?auto_30443 ) ) ( not ( = ?auto_30441 ?auto_30443 ) ) ( AVAILABLE ?auto_30436 ) ( TRUCK-AT ?auto_30438 ?auto_30433 ) ( LIFTING ?auto_30442 ?auto_30434 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30431 ?auto_30432 )
      ( MAKE-2CRATE-VERIFY ?auto_30430 ?auto_30431 ?auto_30432 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30445 - SURFACE
      ?auto_30446 - SURFACE
      ?auto_30447 - SURFACE
      ?auto_30448 - SURFACE
    )
    :vars
    (
      ?auto_30454 - HOIST
      ?auto_30458 - PLACE
      ?auto_30449 - PLACE
      ?auto_30456 - HOIST
      ?auto_30451 - SURFACE
      ?auto_30455 - PLACE
      ?auto_30452 - HOIST
      ?auto_30450 - SURFACE
      ?auto_30459 - SURFACE
      ?auto_30457 - SURFACE
      ?auto_30453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30454 ?auto_30458 ) ( IS-CRATE ?auto_30448 ) ( not ( = ?auto_30447 ?auto_30448 ) ) ( not ( = ?auto_30446 ?auto_30447 ) ) ( not ( = ?auto_30446 ?auto_30448 ) ) ( not ( = ?auto_30449 ?auto_30458 ) ) ( HOIST-AT ?auto_30456 ?auto_30449 ) ( not ( = ?auto_30454 ?auto_30456 ) ) ( SURFACE-AT ?auto_30448 ?auto_30449 ) ( ON ?auto_30448 ?auto_30451 ) ( CLEAR ?auto_30448 ) ( not ( = ?auto_30447 ?auto_30451 ) ) ( not ( = ?auto_30448 ?auto_30451 ) ) ( not ( = ?auto_30446 ?auto_30451 ) ) ( IS-CRATE ?auto_30447 ) ( not ( = ?auto_30455 ?auto_30458 ) ) ( not ( = ?auto_30449 ?auto_30455 ) ) ( HOIST-AT ?auto_30452 ?auto_30455 ) ( not ( = ?auto_30454 ?auto_30452 ) ) ( not ( = ?auto_30456 ?auto_30452 ) ) ( SURFACE-AT ?auto_30447 ?auto_30455 ) ( ON ?auto_30447 ?auto_30450 ) ( CLEAR ?auto_30447 ) ( not ( = ?auto_30447 ?auto_30450 ) ) ( not ( = ?auto_30448 ?auto_30450 ) ) ( not ( = ?auto_30446 ?auto_30450 ) ) ( not ( = ?auto_30451 ?auto_30450 ) ) ( IS-CRATE ?auto_30446 ) ( not ( = ?auto_30445 ?auto_30446 ) ) ( not ( = ?auto_30447 ?auto_30445 ) ) ( not ( = ?auto_30448 ?auto_30445 ) ) ( not ( = ?auto_30451 ?auto_30445 ) ) ( not ( = ?auto_30450 ?auto_30445 ) ) ( AVAILABLE ?auto_30452 ) ( SURFACE-AT ?auto_30446 ?auto_30455 ) ( ON ?auto_30446 ?auto_30459 ) ( CLEAR ?auto_30446 ) ( not ( = ?auto_30447 ?auto_30459 ) ) ( not ( = ?auto_30448 ?auto_30459 ) ) ( not ( = ?auto_30446 ?auto_30459 ) ) ( not ( = ?auto_30451 ?auto_30459 ) ) ( not ( = ?auto_30450 ?auto_30459 ) ) ( not ( = ?auto_30445 ?auto_30459 ) ) ( SURFACE-AT ?auto_30457 ?auto_30458 ) ( CLEAR ?auto_30457 ) ( IS-CRATE ?auto_30445 ) ( not ( = ?auto_30457 ?auto_30445 ) ) ( not ( = ?auto_30447 ?auto_30457 ) ) ( not ( = ?auto_30448 ?auto_30457 ) ) ( not ( = ?auto_30446 ?auto_30457 ) ) ( not ( = ?auto_30451 ?auto_30457 ) ) ( not ( = ?auto_30450 ?auto_30457 ) ) ( not ( = ?auto_30459 ?auto_30457 ) ) ( AVAILABLE ?auto_30454 ) ( TRUCK-AT ?auto_30453 ?auto_30449 ) ( LIFTING ?auto_30456 ?auto_30445 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30446 ?auto_30447 ?auto_30448 )
      ( MAKE-3CRATE-VERIFY ?auto_30445 ?auto_30446 ?auto_30447 ?auto_30448 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30460 - SURFACE
      ?auto_30461 - SURFACE
      ?auto_30462 - SURFACE
      ?auto_30463 - SURFACE
      ?auto_30464 - SURFACE
    )
    :vars
    (
      ?auto_30470 - HOIST
      ?auto_30473 - PLACE
      ?auto_30465 - PLACE
      ?auto_30472 - HOIST
      ?auto_30467 - SURFACE
      ?auto_30471 - PLACE
      ?auto_30468 - HOIST
      ?auto_30466 - SURFACE
      ?auto_30474 - SURFACE
      ?auto_30469 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30470 ?auto_30473 ) ( IS-CRATE ?auto_30464 ) ( not ( = ?auto_30463 ?auto_30464 ) ) ( not ( = ?auto_30462 ?auto_30463 ) ) ( not ( = ?auto_30462 ?auto_30464 ) ) ( not ( = ?auto_30465 ?auto_30473 ) ) ( HOIST-AT ?auto_30472 ?auto_30465 ) ( not ( = ?auto_30470 ?auto_30472 ) ) ( SURFACE-AT ?auto_30464 ?auto_30465 ) ( ON ?auto_30464 ?auto_30467 ) ( CLEAR ?auto_30464 ) ( not ( = ?auto_30463 ?auto_30467 ) ) ( not ( = ?auto_30464 ?auto_30467 ) ) ( not ( = ?auto_30462 ?auto_30467 ) ) ( IS-CRATE ?auto_30463 ) ( not ( = ?auto_30471 ?auto_30473 ) ) ( not ( = ?auto_30465 ?auto_30471 ) ) ( HOIST-AT ?auto_30468 ?auto_30471 ) ( not ( = ?auto_30470 ?auto_30468 ) ) ( not ( = ?auto_30472 ?auto_30468 ) ) ( SURFACE-AT ?auto_30463 ?auto_30471 ) ( ON ?auto_30463 ?auto_30466 ) ( CLEAR ?auto_30463 ) ( not ( = ?auto_30463 ?auto_30466 ) ) ( not ( = ?auto_30464 ?auto_30466 ) ) ( not ( = ?auto_30462 ?auto_30466 ) ) ( not ( = ?auto_30467 ?auto_30466 ) ) ( IS-CRATE ?auto_30462 ) ( not ( = ?auto_30461 ?auto_30462 ) ) ( not ( = ?auto_30463 ?auto_30461 ) ) ( not ( = ?auto_30464 ?auto_30461 ) ) ( not ( = ?auto_30467 ?auto_30461 ) ) ( not ( = ?auto_30466 ?auto_30461 ) ) ( AVAILABLE ?auto_30468 ) ( SURFACE-AT ?auto_30462 ?auto_30471 ) ( ON ?auto_30462 ?auto_30474 ) ( CLEAR ?auto_30462 ) ( not ( = ?auto_30463 ?auto_30474 ) ) ( not ( = ?auto_30464 ?auto_30474 ) ) ( not ( = ?auto_30462 ?auto_30474 ) ) ( not ( = ?auto_30467 ?auto_30474 ) ) ( not ( = ?auto_30466 ?auto_30474 ) ) ( not ( = ?auto_30461 ?auto_30474 ) ) ( SURFACE-AT ?auto_30460 ?auto_30473 ) ( CLEAR ?auto_30460 ) ( IS-CRATE ?auto_30461 ) ( not ( = ?auto_30460 ?auto_30461 ) ) ( not ( = ?auto_30463 ?auto_30460 ) ) ( not ( = ?auto_30464 ?auto_30460 ) ) ( not ( = ?auto_30462 ?auto_30460 ) ) ( not ( = ?auto_30467 ?auto_30460 ) ) ( not ( = ?auto_30466 ?auto_30460 ) ) ( not ( = ?auto_30474 ?auto_30460 ) ) ( AVAILABLE ?auto_30470 ) ( TRUCK-AT ?auto_30469 ?auto_30465 ) ( LIFTING ?auto_30472 ?auto_30461 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30462 ?auto_30463 ?auto_30464 )
      ( MAKE-4CRATE-VERIFY ?auto_30460 ?auto_30461 ?auto_30462 ?auto_30463 ?auto_30464 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30475 - SURFACE
      ?auto_30476 - SURFACE
    )
    :vars
    (
      ?auto_30482 - HOIST
      ?auto_30487 - PLACE
      ?auto_30489 - SURFACE
      ?auto_30477 - PLACE
      ?auto_30484 - HOIST
      ?auto_30479 - SURFACE
      ?auto_30483 - PLACE
      ?auto_30480 - HOIST
      ?auto_30478 - SURFACE
      ?auto_30486 - SURFACE
      ?auto_30488 - SURFACE
      ?auto_30485 - SURFACE
      ?auto_30481 - TRUCK
      ?auto_30490 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30482 ?auto_30487 ) ( IS-CRATE ?auto_30476 ) ( not ( = ?auto_30475 ?auto_30476 ) ) ( not ( = ?auto_30489 ?auto_30475 ) ) ( not ( = ?auto_30489 ?auto_30476 ) ) ( not ( = ?auto_30477 ?auto_30487 ) ) ( HOIST-AT ?auto_30484 ?auto_30477 ) ( not ( = ?auto_30482 ?auto_30484 ) ) ( SURFACE-AT ?auto_30476 ?auto_30477 ) ( ON ?auto_30476 ?auto_30479 ) ( CLEAR ?auto_30476 ) ( not ( = ?auto_30475 ?auto_30479 ) ) ( not ( = ?auto_30476 ?auto_30479 ) ) ( not ( = ?auto_30489 ?auto_30479 ) ) ( IS-CRATE ?auto_30475 ) ( not ( = ?auto_30483 ?auto_30487 ) ) ( not ( = ?auto_30477 ?auto_30483 ) ) ( HOIST-AT ?auto_30480 ?auto_30483 ) ( not ( = ?auto_30482 ?auto_30480 ) ) ( not ( = ?auto_30484 ?auto_30480 ) ) ( SURFACE-AT ?auto_30475 ?auto_30483 ) ( ON ?auto_30475 ?auto_30478 ) ( CLEAR ?auto_30475 ) ( not ( = ?auto_30475 ?auto_30478 ) ) ( not ( = ?auto_30476 ?auto_30478 ) ) ( not ( = ?auto_30489 ?auto_30478 ) ) ( not ( = ?auto_30479 ?auto_30478 ) ) ( IS-CRATE ?auto_30489 ) ( not ( = ?auto_30486 ?auto_30489 ) ) ( not ( = ?auto_30475 ?auto_30486 ) ) ( not ( = ?auto_30476 ?auto_30486 ) ) ( not ( = ?auto_30479 ?auto_30486 ) ) ( not ( = ?auto_30478 ?auto_30486 ) ) ( AVAILABLE ?auto_30480 ) ( SURFACE-AT ?auto_30489 ?auto_30483 ) ( ON ?auto_30489 ?auto_30488 ) ( CLEAR ?auto_30489 ) ( not ( = ?auto_30475 ?auto_30488 ) ) ( not ( = ?auto_30476 ?auto_30488 ) ) ( not ( = ?auto_30489 ?auto_30488 ) ) ( not ( = ?auto_30479 ?auto_30488 ) ) ( not ( = ?auto_30478 ?auto_30488 ) ) ( not ( = ?auto_30486 ?auto_30488 ) ) ( SURFACE-AT ?auto_30485 ?auto_30487 ) ( CLEAR ?auto_30485 ) ( IS-CRATE ?auto_30486 ) ( not ( = ?auto_30485 ?auto_30486 ) ) ( not ( = ?auto_30475 ?auto_30485 ) ) ( not ( = ?auto_30476 ?auto_30485 ) ) ( not ( = ?auto_30489 ?auto_30485 ) ) ( not ( = ?auto_30479 ?auto_30485 ) ) ( not ( = ?auto_30478 ?auto_30485 ) ) ( not ( = ?auto_30488 ?auto_30485 ) ) ( AVAILABLE ?auto_30482 ) ( TRUCK-AT ?auto_30481 ?auto_30477 ) ( AVAILABLE ?auto_30484 ) ( SURFACE-AT ?auto_30486 ?auto_30477 ) ( ON ?auto_30486 ?auto_30490 ) ( CLEAR ?auto_30486 ) ( not ( = ?auto_30475 ?auto_30490 ) ) ( not ( = ?auto_30476 ?auto_30490 ) ) ( not ( = ?auto_30489 ?auto_30490 ) ) ( not ( = ?auto_30479 ?auto_30490 ) ) ( not ( = ?auto_30478 ?auto_30490 ) ) ( not ( = ?auto_30486 ?auto_30490 ) ) ( not ( = ?auto_30488 ?auto_30490 ) ) ( not ( = ?auto_30485 ?auto_30490 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30484 ?auto_30486 ?auto_30490 ?auto_30477 )
      ( MAKE-2CRATE ?auto_30489 ?auto_30475 ?auto_30476 )
      ( MAKE-1CRATE-VERIFY ?auto_30475 ?auto_30476 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30491 - SURFACE
      ?auto_30492 - SURFACE
      ?auto_30493 - SURFACE
    )
    :vars
    (
      ?auto_30503 - HOIST
      ?auto_30498 - PLACE
      ?auto_30501 - PLACE
      ?auto_30496 - HOIST
      ?auto_30502 - SURFACE
      ?auto_30504 - PLACE
      ?auto_30497 - HOIST
      ?auto_30500 - SURFACE
      ?auto_30505 - SURFACE
      ?auto_30495 - SURFACE
      ?auto_30494 - SURFACE
      ?auto_30499 - TRUCK
      ?auto_30506 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30503 ?auto_30498 ) ( IS-CRATE ?auto_30493 ) ( not ( = ?auto_30492 ?auto_30493 ) ) ( not ( = ?auto_30491 ?auto_30492 ) ) ( not ( = ?auto_30491 ?auto_30493 ) ) ( not ( = ?auto_30501 ?auto_30498 ) ) ( HOIST-AT ?auto_30496 ?auto_30501 ) ( not ( = ?auto_30503 ?auto_30496 ) ) ( SURFACE-AT ?auto_30493 ?auto_30501 ) ( ON ?auto_30493 ?auto_30502 ) ( CLEAR ?auto_30493 ) ( not ( = ?auto_30492 ?auto_30502 ) ) ( not ( = ?auto_30493 ?auto_30502 ) ) ( not ( = ?auto_30491 ?auto_30502 ) ) ( IS-CRATE ?auto_30492 ) ( not ( = ?auto_30504 ?auto_30498 ) ) ( not ( = ?auto_30501 ?auto_30504 ) ) ( HOIST-AT ?auto_30497 ?auto_30504 ) ( not ( = ?auto_30503 ?auto_30497 ) ) ( not ( = ?auto_30496 ?auto_30497 ) ) ( SURFACE-AT ?auto_30492 ?auto_30504 ) ( ON ?auto_30492 ?auto_30500 ) ( CLEAR ?auto_30492 ) ( not ( = ?auto_30492 ?auto_30500 ) ) ( not ( = ?auto_30493 ?auto_30500 ) ) ( not ( = ?auto_30491 ?auto_30500 ) ) ( not ( = ?auto_30502 ?auto_30500 ) ) ( IS-CRATE ?auto_30491 ) ( not ( = ?auto_30505 ?auto_30491 ) ) ( not ( = ?auto_30492 ?auto_30505 ) ) ( not ( = ?auto_30493 ?auto_30505 ) ) ( not ( = ?auto_30502 ?auto_30505 ) ) ( not ( = ?auto_30500 ?auto_30505 ) ) ( AVAILABLE ?auto_30497 ) ( SURFACE-AT ?auto_30491 ?auto_30504 ) ( ON ?auto_30491 ?auto_30495 ) ( CLEAR ?auto_30491 ) ( not ( = ?auto_30492 ?auto_30495 ) ) ( not ( = ?auto_30493 ?auto_30495 ) ) ( not ( = ?auto_30491 ?auto_30495 ) ) ( not ( = ?auto_30502 ?auto_30495 ) ) ( not ( = ?auto_30500 ?auto_30495 ) ) ( not ( = ?auto_30505 ?auto_30495 ) ) ( SURFACE-AT ?auto_30494 ?auto_30498 ) ( CLEAR ?auto_30494 ) ( IS-CRATE ?auto_30505 ) ( not ( = ?auto_30494 ?auto_30505 ) ) ( not ( = ?auto_30492 ?auto_30494 ) ) ( not ( = ?auto_30493 ?auto_30494 ) ) ( not ( = ?auto_30491 ?auto_30494 ) ) ( not ( = ?auto_30502 ?auto_30494 ) ) ( not ( = ?auto_30500 ?auto_30494 ) ) ( not ( = ?auto_30495 ?auto_30494 ) ) ( AVAILABLE ?auto_30503 ) ( TRUCK-AT ?auto_30499 ?auto_30501 ) ( AVAILABLE ?auto_30496 ) ( SURFACE-AT ?auto_30505 ?auto_30501 ) ( ON ?auto_30505 ?auto_30506 ) ( CLEAR ?auto_30505 ) ( not ( = ?auto_30492 ?auto_30506 ) ) ( not ( = ?auto_30493 ?auto_30506 ) ) ( not ( = ?auto_30491 ?auto_30506 ) ) ( not ( = ?auto_30502 ?auto_30506 ) ) ( not ( = ?auto_30500 ?auto_30506 ) ) ( not ( = ?auto_30505 ?auto_30506 ) ) ( not ( = ?auto_30495 ?auto_30506 ) ) ( not ( = ?auto_30494 ?auto_30506 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30492 ?auto_30493 )
      ( MAKE-2CRATE-VERIFY ?auto_30491 ?auto_30492 ?auto_30493 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30507 - SURFACE
      ?auto_30508 - SURFACE
      ?auto_30509 - SURFACE
      ?auto_30510 - SURFACE
    )
    :vars
    (
      ?auto_30511 - HOIST
      ?auto_30515 - PLACE
      ?auto_30512 - PLACE
      ?auto_30520 - HOIST
      ?auto_30521 - SURFACE
      ?auto_30517 - PLACE
      ?auto_30522 - HOIST
      ?auto_30513 - SURFACE
      ?auto_30516 - SURFACE
      ?auto_30518 - SURFACE
      ?auto_30514 - TRUCK
      ?auto_30519 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30511 ?auto_30515 ) ( IS-CRATE ?auto_30510 ) ( not ( = ?auto_30509 ?auto_30510 ) ) ( not ( = ?auto_30508 ?auto_30509 ) ) ( not ( = ?auto_30508 ?auto_30510 ) ) ( not ( = ?auto_30512 ?auto_30515 ) ) ( HOIST-AT ?auto_30520 ?auto_30512 ) ( not ( = ?auto_30511 ?auto_30520 ) ) ( SURFACE-AT ?auto_30510 ?auto_30512 ) ( ON ?auto_30510 ?auto_30521 ) ( CLEAR ?auto_30510 ) ( not ( = ?auto_30509 ?auto_30521 ) ) ( not ( = ?auto_30510 ?auto_30521 ) ) ( not ( = ?auto_30508 ?auto_30521 ) ) ( IS-CRATE ?auto_30509 ) ( not ( = ?auto_30517 ?auto_30515 ) ) ( not ( = ?auto_30512 ?auto_30517 ) ) ( HOIST-AT ?auto_30522 ?auto_30517 ) ( not ( = ?auto_30511 ?auto_30522 ) ) ( not ( = ?auto_30520 ?auto_30522 ) ) ( SURFACE-AT ?auto_30509 ?auto_30517 ) ( ON ?auto_30509 ?auto_30513 ) ( CLEAR ?auto_30509 ) ( not ( = ?auto_30509 ?auto_30513 ) ) ( not ( = ?auto_30510 ?auto_30513 ) ) ( not ( = ?auto_30508 ?auto_30513 ) ) ( not ( = ?auto_30521 ?auto_30513 ) ) ( IS-CRATE ?auto_30508 ) ( not ( = ?auto_30507 ?auto_30508 ) ) ( not ( = ?auto_30509 ?auto_30507 ) ) ( not ( = ?auto_30510 ?auto_30507 ) ) ( not ( = ?auto_30521 ?auto_30507 ) ) ( not ( = ?auto_30513 ?auto_30507 ) ) ( AVAILABLE ?auto_30522 ) ( SURFACE-AT ?auto_30508 ?auto_30517 ) ( ON ?auto_30508 ?auto_30516 ) ( CLEAR ?auto_30508 ) ( not ( = ?auto_30509 ?auto_30516 ) ) ( not ( = ?auto_30510 ?auto_30516 ) ) ( not ( = ?auto_30508 ?auto_30516 ) ) ( not ( = ?auto_30521 ?auto_30516 ) ) ( not ( = ?auto_30513 ?auto_30516 ) ) ( not ( = ?auto_30507 ?auto_30516 ) ) ( SURFACE-AT ?auto_30518 ?auto_30515 ) ( CLEAR ?auto_30518 ) ( IS-CRATE ?auto_30507 ) ( not ( = ?auto_30518 ?auto_30507 ) ) ( not ( = ?auto_30509 ?auto_30518 ) ) ( not ( = ?auto_30510 ?auto_30518 ) ) ( not ( = ?auto_30508 ?auto_30518 ) ) ( not ( = ?auto_30521 ?auto_30518 ) ) ( not ( = ?auto_30513 ?auto_30518 ) ) ( not ( = ?auto_30516 ?auto_30518 ) ) ( AVAILABLE ?auto_30511 ) ( TRUCK-AT ?auto_30514 ?auto_30512 ) ( AVAILABLE ?auto_30520 ) ( SURFACE-AT ?auto_30507 ?auto_30512 ) ( ON ?auto_30507 ?auto_30519 ) ( CLEAR ?auto_30507 ) ( not ( = ?auto_30509 ?auto_30519 ) ) ( not ( = ?auto_30510 ?auto_30519 ) ) ( not ( = ?auto_30508 ?auto_30519 ) ) ( not ( = ?auto_30521 ?auto_30519 ) ) ( not ( = ?auto_30513 ?auto_30519 ) ) ( not ( = ?auto_30507 ?auto_30519 ) ) ( not ( = ?auto_30516 ?auto_30519 ) ) ( not ( = ?auto_30518 ?auto_30519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30508 ?auto_30509 ?auto_30510 )
      ( MAKE-3CRATE-VERIFY ?auto_30507 ?auto_30508 ?auto_30509 ?auto_30510 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30523 - SURFACE
      ?auto_30524 - SURFACE
      ?auto_30525 - SURFACE
      ?auto_30526 - SURFACE
      ?auto_30527 - SURFACE
    )
    :vars
    (
      ?auto_30528 - HOIST
      ?auto_30532 - PLACE
      ?auto_30529 - PLACE
      ?auto_30536 - HOIST
      ?auto_30537 - SURFACE
      ?auto_30534 - PLACE
      ?auto_30538 - HOIST
      ?auto_30530 - SURFACE
      ?auto_30533 - SURFACE
      ?auto_30531 - TRUCK
      ?auto_30535 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30528 ?auto_30532 ) ( IS-CRATE ?auto_30527 ) ( not ( = ?auto_30526 ?auto_30527 ) ) ( not ( = ?auto_30525 ?auto_30526 ) ) ( not ( = ?auto_30525 ?auto_30527 ) ) ( not ( = ?auto_30529 ?auto_30532 ) ) ( HOIST-AT ?auto_30536 ?auto_30529 ) ( not ( = ?auto_30528 ?auto_30536 ) ) ( SURFACE-AT ?auto_30527 ?auto_30529 ) ( ON ?auto_30527 ?auto_30537 ) ( CLEAR ?auto_30527 ) ( not ( = ?auto_30526 ?auto_30537 ) ) ( not ( = ?auto_30527 ?auto_30537 ) ) ( not ( = ?auto_30525 ?auto_30537 ) ) ( IS-CRATE ?auto_30526 ) ( not ( = ?auto_30534 ?auto_30532 ) ) ( not ( = ?auto_30529 ?auto_30534 ) ) ( HOIST-AT ?auto_30538 ?auto_30534 ) ( not ( = ?auto_30528 ?auto_30538 ) ) ( not ( = ?auto_30536 ?auto_30538 ) ) ( SURFACE-AT ?auto_30526 ?auto_30534 ) ( ON ?auto_30526 ?auto_30530 ) ( CLEAR ?auto_30526 ) ( not ( = ?auto_30526 ?auto_30530 ) ) ( not ( = ?auto_30527 ?auto_30530 ) ) ( not ( = ?auto_30525 ?auto_30530 ) ) ( not ( = ?auto_30537 ?auto_30530 ) ) ( IS-CRATE ?auto_30525 ) ( not ( = ?auto_30524 ?auto_30525 ) ) ( not ( = ?auto_30526 ?auto_30524 ) ) ( not ( = ?auto_30527 ?auto_30524 ) ) ( not ( = ?auto_30537 ?auto_30524 ) ) ( not ( = ?auto_30530 ?auto_30524 ) ) ( AVAILABLE ?auto_30538 ) ( SURFACE-AT ?auto_30525 ?auto_30534 ) ( ON ?auto_30525 ?auto_30533 ) ( CLEAR ?auto_30525 ) ( not ( = ?auto_30526 ?auto_30533 ) ) ( not ( = ?auto_30527 ?auto_30533 ) ) ( not ( = ?auto_30525 ?auto_30533 ) ) ( not ( = ?auto_30537 ?auto_30533 ) ) ( not ( = ?auto_30530 ?auto_30533 ) ) ( not ( = ?auto_30524 ?auto_30533 ) ) ( SURFACE-AT ?auto_30523 ?auto_30532 ) ( CLEAR ?auto_30523 ) ( IS-CRATE ?auto_30524 ) ( not ( = ?auto_30523 ?auto_30524 ) ) ( not ( = ?auto_30526 ?auto_30523 ) ) ( not ( = ?auto_30527 ?auto_30523 ) ) ( not ( = ?auto_30525 ?auto_30523 ) ) ( not ( = ?auto_30537 ?auto_30523 ) ) ( not ( = ?auto_30530 ?auto_30523 ) ) ( not ( = ?auto_30533 ?auto_30523 ) ) ( AVAILABLE ?auto_30528 ) ( TRUCK-AT ?auto_30531 ?auto_30529 ) ( AVAILABLE ?auto_30536 ) ( SURFACE-AT ?auto_30524 ?auto_30529 ) ( ON ?auto_30524 ?auto_30535 ) ( CLEAR ?auto_30524 ) ( not ( = ?auto_30526 ?auto_30535 ) ) ( not ( = ?auto_30527 ?auto_30535 ) ) ( not ( = ?auto_30525 ?auto_30535 ) ) ( not ( = ?auto_30537 ?auto_30535 ) ) ( not ( = ?auto_30530 ?auto_30535 ) ) ( not ( = ?auto_30524 ?auto_30535 ) ) ( not ( = ?auto_30533 ?auto_30535 ) ) ( not ( = ?auto_30523 ?auto_30535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30525 ?auto_30526 ?auto_30527 )
      ( MAKE-4CRATE-VERIFY ?auto_30523 ?auto_30524 ?auto_30525 ?auto_30526 ?auto_30527 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30539 - SURFACE
      ?auto_30540 - SURFACE
    )
    :vars
    (
      ?auto_30541 - HOIST
      ?auto_30545 - PLACE
      ?auto_30547 - SURFACE
      ?auto_30542 - PLACE
      ?auto_30551 - HOIST
      ?auto_30552 - SURFACE
      ?auto_30548 - PLACE
      ?auto_30554 - HOIST
      ?auto_30543 - SURFACE
      ?auto_30553 - SURFACE
      ?auto_30546 - SURFACE
      ?auto_30549 - SURFACE
      ?auto_30550 - SURFACE
      ?auto_30544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30541 ?auto_30545 ) ( IS-CRATE ?auto_30540 ) ( not ( = ?auto_30539 ?auto_30540 ) ) ( not ( = ?auto_30547 ?auto_30539 ) ) ( not ( = ?auto_30547 ?auto_30540 ) ) ( not ( = ?auto_30542 ?auto_30545 ) ) ( HOIST-AT ?auto_30551 ?auto_30542 ) ( not ( = ?auto_30541 ?auto_30551 ) ) ( SURFACE-AT ?auto_30540 ?auto_30542 ) ( ON ?auto_30540 ?auto_30552 ) ( CLEAR ?auto_30540 ) ( not ( = ?auto_30539 ?auto_30552 ) ) ( not ( = ?auto_30540 ?auto_30552 ) ) ( not ( = ?auto_30547 ?auto_30552 ) ) ( IS-CRATE ?auto_30539 ) ( not ( = ?auto_30548 ?auto_30545 ) ) ( not ( = ?auto_30542 ?auto_30548 ) ) ( HOIST-AT ?auto_30554 ?auto_30548 ) ( not ( = ?auto_30541 ?auto_30554 ) ) ( not ( = ?auto_30551 ?auto_30554 ) ) ( SURFACE-AT ?auto_30539 ?auto_30548 ) ( ON ?auto_30539 ?auto_30543 ) ( CLEAR ?auto_30539 ) ( not ( = ?auto_30539 ?auto_30543 ) ) ( not ( = ?auto_30540 ?auto_30543 ) ) ( not ( = ?auto_30547 ?auto_30543 ) ) ( not ( = ?auto_30552 ?auto_30543 ) ) ( IS-CRATE ?auto_30547 ) ( not ( = ?auto_30553 ?auto_30547 ) ) ( not ( = ?auto_30539 ?auto_30553 ) ) ( not ( = ?auto_30540 ?auto_30553 ) ) ( not ( = ?auto_30552 ?auto_30553 ) ) ( not ( = ?auto_30543 ?auto_30553 ) ) ( AVAILABLE ?auto_30554 ) ( SURFACE-AT ?auto_30547 ?auto_30548 ) ( ON ?auto_30547 ?auto_30546 ) ( CLEAR ?auto_30547 ) ( not ( = ?auto_30539 ?auto_30546 ) ) ( not ( = ?auto_30540 ?auto_30546 ) ) ( not ( = ?auto_30547 ?auto_30546 ) ) ( not ( = ?auto_30552 ?auto_30546 ) ) ( not ( = ?auto_30543 ?auto_30546 ) ) ( not ( = ?auto_30553 ?auto_30546 ) ) ( SURFACE-AT ?auto_30549 ?auto_30545 ) ( CLEAR ?auto_30549 ) ( IS-CRATE ?auto_30553 ) ( not ( = ?auto_30549 ?auto_30553 ) ) ( not ( = ?auto_30539 ?auto_30549 ) ) ( not ( = ?auto_30540 ?auto_30549 ) ) ( not ( = ?auto_30547 ?auto_30549 ) ) ( not ( = ?auto_30552 ?auto_30549 ) ) ( not ( = ?auto_30543 ?auto_30549 ) ) ( not ( = ?auto_30546 ?auto_30549 ) ) ( AVAILABLE ?auto_30541 ) ( AVAILABLE ?auto_30551 ) ( SURFACE-AT ?auto_30553 ?auto_30542 ) ( ON ?auto_30553 ?auto_30550 ) ( CLEAR ?auto_30553 ) ( not ( = ?auto_30539 ?auto_30550 ) ) ( not ( = ?auto_30540 ?auto_30550 ) ) ( not ( = ?auto_30547 ?auto_30550 ) ) ( not ( = ?auto_30552 ?auto_30550 ) ) ( not ( = ?auto_30543 ?auto_30550 ) ) ( not ( = ?auto_30553 ?auto_30550 ) ) ( not ( = ?auto_30546 ?auto_30550 ) ) ( not ( = ?auto_30549 ?auto_30550 ) ) ( TRUCK-AT ?auto_30544 ?auto_30545 ) )
    :subtasks
    ( ( !DRIVE ?auto_30544 ?auto_30545 ?auto_30542 )
      ( MAKE-2CRATE ?auto_30547 ?auto_30539 ?auto_30540 )
      ( MAKE-1CRATE-VERIFY ?auto_30539 ?auto_30540 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30555 - SURFACE
      ?auto_30556 - SURFACE
      ?auto_30557 - SURFACE
    )
    :vars
    (
      ?auto_30567 - HOIST
      ?auto_30568 - PLACE
      ?auto_30563 - PLACE
      ?auto_30559 - HOIST
      ?auto_30566 - SURFACE
      ?auto_30564 - PLACE
      ?auto_30561 - HOIST
      ?auto_30562 - SURFACE
      ?auto_30560 - SURFACE
      ?auto_30570 - SURFACE
      ?auto_30565 - SURFACE
      ?auto_30558 - SURFACE
      ?auto_30569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30567 ?auto_30568 ) ( IS-CRATE ?auto_30557 ) ( not ( = ?auto_30556 ?auto_30557 ) ) ( not ( = ?auto_30555 ?auto_30556 ) ) ( not ( = ?auto_30555 ?auto_30557 ) ) ( not ( = ?auto_30563 ?auto_30568 ) ) ( HOIST-AT ?auto_30559 ?auto_30563 ) ( not ( = ?auto_30567 ?auto_30559 ) ) ( SURFACE-AT ?auto_30557 ?auto_30563 ) ( ON ?auto_30557 ?auto_30566 ) ( CLEAR ?auto_30557 ) ( not ( = ?auto_30556 ?auto_30566 ) ) ( not ( = ?auto_30557 ?auto_30566 ) ) ( not ( = ?auto_30555 ?auto_30566 ) ) ( IS-CRATE ?auto_30556 ) ( not ( = ?auto_30564 ?auto_30568 ) ) ( not ( = ?auto_30563 ?auto_30564 ) ) ( HOIST-AT ?auto_30561 ?auto_30564 ) ( not ( = ?auto_30567 ?auto_30561 ) ) ( not ( = ?auto_30559 ?auto_30561 ) ) ( SURFACE-AT ?auto_30556 ?auto_30564 ) ( ON ?auto_30556 ?auto_30562 ) ( CLEAR ?auto_30556 ) ( not ( = ?auto_30556 ?auto_30562 ) ) ( not ( = ?auto_30557 ?auto_30562 ) ) ( not ( = ?auto_30555 ?auto_30562 ) ) ( not ( = ?auto_30566 ?auto_30562 ) ) ( IS-CRATE ?auto_30555 ) ( not ( = ?auto_30560 ?auto_30555 ) ) ( not ( = ?auto_30556 ?auto_30560 ) ) ( not ( = ?auto_30557 ?auto_30560 ) ) ( not ( = ?auto_30566 ?auto_30560 ) ) ( not ( = ?auto_30562 ?auto_30560 ) ) ( AVAILABLE ?auto_30561 ) ( SURFACE-AT ?auto_30555 ?auto_30564 ) ( ON ?auto_30555 ?auto_30570 ) ( CLEAR ?auto_30555 ) ( not ( = ?auto_30556 ?auto_30570 ) ) ( not ( = ?auto_30557 ?auto_30570 ) ) ( not ( = ?auto_30555 ?auto_30570 ) ) ( not ( = ?auto_30566 ?auto_30570 ) ) ( not ( = ?auto_30562 ?auto_30570 ) ) ( not ( = ?auto_30560 ?auto_30570 ) ) ( SURFACE-AT ?auto_30565 ?auto_30568 ) ( CLEAR ?auto_30565 ) ( IS-CRATE ?auto_30560 ) ( not ( = ?auto_30565 ?auto_30560 ) ) ( not ( = ?auto_30556 ?auto_30565 ) ) ( not ( = ?auto_30557 ?auto_30565 ) ) ( not ( = ?auto_30555 ?auto_30565 ) ) ( not ( = ?auto_30566 ?auto_30565 ) ) ( not ( = ?auto_30562 ?auto_30565 ) ) ( not ( = ?auto_30570 ?auto_30565 ) ) ( AVAILABLE ?auto_30567 ) ( AVAILABLE ?auto_30559 ) ( SURFACE-AT ?auto_30560 ?auto_30563 ) ( ON ?auto_30560 ?auto_30558 ) ( CLEAR ?auto_30560 ) ( not ( = ?auto_30556 ?auto_30558 ) ) ( not ( = ?auto_30557 ?auto_30558 ) ) ( not ( = ?auto_30555 ?auto_30558 ) ) ( not ( = ?auto_30566 ?auto_30558 ) ) ( not ( = ?auto_30562 ?auto_30558 ) ) ( not ( = ?auto_30560 ?auto_30558 ) ) ( not ( = ?auto_30570 ?auto_30558 ) ) ( not ( = ?auto_30565 ?auto_30558 ) ) ( TRUCK-AT ?auto_30569 ?auto_30568 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30556 ?auto_30557 )
      ( MAKE-2CRATE-VERIFY ?auto_30555 ?auto_30556 ?auto_30557 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30571 - SURFACE
      ?auto_30572 - SURFACE
      ?auto_30573 - SURFACE
      ?auto_30574 - SURFACE
    )
    :vars
    (
      ?auto_30577 - HOIST
      ?auto_30582 - PLACE
      ?auto_30576 - PLACE
      ?auto_30586 - HOIST
      ?auto_30581 - SURFACE
      ?auto_30584 - PLACE
      ?auto_30580 - HOIST
      ?auto_30575 - SURFACE
      ?auto_30579 - SURFACE
      ?auto_30583 - SURFACE
      ?auto_30578 - SURFACE
      ?auto_30585 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30577 ?auto_30582 ) ( IS-CRATE ?auto_30574 ) ( not ( = ?auto_30573 ?auto_30574 ) ) ( not ( = ?auto_30572 ?auto_30573 ) ) ( not ( = ?auto_30572 ?auto_30574 ) ) ( not ( = ?auto_30576 ?auto_30582 ) ) ( HOIST-AT ?auto_30586 ?auto_30576 ) ( not ( = ?auto_30577 ?auto_30586 ) ) ( SURFACE-AT ?auto_30574 ?auto_30576 ) ( ON ?auto_30574 ?auto_30581 ) ( CLEAR ?auto_30574 ) ( not ( = ?auto_30573 ?auto_30581 ) ) ( not ( = ?auto_30574 ?auto_30581 ) ) ( not ( = ?auto_30572 ?auto_30581 ) ) ( IS-CRATE ?auto_30573 ) ( not ( = ?auto_30584 ?auto_30582 ) ) ( not ( = ?auto_30576 ?auto_30584 ) ) ( HOIST-AT ?auto_30580 ?auto_30584 ) ( not ( = ?auto_30577 ?auto_30580 ) ) ( not ( = ?auto_30586 ?auto_30580 ) ) ( SURFACE-AT ?auto_30573 ?auto_30584 ) ( ON ?auto_30573 ?auto_30575 ) ( CLEAR ?auto_30573 ) ( not ( = ?auto_30573 ?auto_30575 ) ) ( not ( = ?auto_30574 ?auto_30575 ) ) ( not ( = ?auto_30572 ?auto_30575 ) ) ( not ( = ?auto_30581 ?auto_30575 ) ) ( IS-CRATE ?auto_30572 ) ( not ( = ?auto_30571 ?auto_30572 ) ) ( not ( = ?auto_30573 ?auto_30571 ) ) ( not ( = ?auto_30574 ?auto_30571 ) ) ( not ( = ?auto_30581 ?auto_30571 ) ) ( not ( = ?auto_30575 ?auto_30571 ) ) ( AVAILABLE ?auto_30580 ) ( SURFACE-AT ?auto_30572 ?auto_30584 ) ( ON ?auto_30572 ?auto_30579 ) ( CLEAR ?auto_30572 ) ( not ( = ?auto_30573 ?auto_30579 ) ) ( not ( = ?auto_30574 ?auto_30579 ) ) ( not ( = ?auto_30572 ?auto_30579 ) ) ( not ( = ?auto_30581 ?auto_30579 ) ) ( not ( = ?auto_30575 ?auto_30579 ) ) ( not ( = ?auto_30571 ?auto_30579 ) ) ( SURFACE-AT ?auto_30583 ?auto_30582 ) ( CLEAR ?auto_30583 ) ( IS-CRATE ?auto_30571 ) ( not ( = ?auto_30583 ?auto_30571 ) ) ( not ( = ?auto_30573 ?auto_30583 ) ) ( not ( = ?auto_30574 ?auto_30583 ) ) ( not ( = ?auto_30572 ?auto_30583 ) ) ( not ( = ?auto_30581 ?auto_30583 ) ) ( not ( = ?auto_30575 ?auto_30583 ) ) ( not ( = ?auto_30579 ?auto_30583 ) ) ( AVAILABLE ?auto_30577 ) ( AVAILABLE ?auto_30586 ) ( SURFACE-AT ?auto_30571 ?auto_30576 ) ( ON ?auto_30571 ?auto_30578 ) ( CLEAR ?auto_30571 ) ( not ( = ?auto_30573 ?auto_30578 ) ) ( not ( = ?auto_30574 ?auto_30578 ) ) ( not ( = ?auto_30572 ?auto_30578 ) ) ( not ( = ?auto_30581 ?auto_30578 ) ) ( not ( = ?auto_30575 ?auto_30578 ) ) ( not ( = ?auto_30571 ?auto_30578 ) ) ( not ( = ?auto_30579 ?auto_30578 ) ) ( not ( = ?auto_30583 ?auto_30578 ) ) ( TRUCK-AT ?auto_30585 ?auto_30582 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30572 ?auto_30573 ?auto_30574 )
      ( MAKE-3CRATE-VERIFY ?auto_30571 ?auto_30572 ?auto_30573 ?auto_30574 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30587 - SURFACE
      ?auto_30588 - SURFACE
      ?auto_30589 - SURFACE
      ?auto_30590 - SURFACE
      ?auto_30591 - SURFACE
    )
    :vars
    (
      ?auto_30594 - HOIST
      ?auto_30599 - PLACE
      ?auto_30593 - PLACE
      ?auto_30602 - HOIST
      ?auto_30598 - SURFACE
      ?auto_30600 - PLACE
      ?auto_30597 - HOIST
      ?auto_30592 - SURFACE
      ?auto_30596 - SURFACE
      ?auto_30595 - SURFACE
      ?auto_30601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30594 ?auto_30599 ) ( IS-CRATE ?auto_30591 ) ( not ( = ?auto_30590 ?auto_30591 ) ) ( not ( = ?auto_30589 ?auto_30590 ) ) ( not ( = ?auto_30589 ?auto_30591 ) ) ( not ( = ?auto_30593 ?auto_30599 ) ) ( HOIST-AT ?auto_30602 ?auto_30593 ) ( not ( = ?auto_30594 ?auto_30602 ) ) ( SURFACE-AT ?auto_30591 ?auto_30593 ) ( ON ?auto_30591 ?auto_30598 ) ( CLEAR ?auto_30591 ) ( not ( = ?auto_30590 ?auto_30598 ) ) ( not ( = ?auto_30591 ?auto_30598 ) ) ( not ( = ?auto_30589 ?auto_30598 ) ) ( IS-CRATE ?auto_30590 ) ( not ( = ?auto_30600 ?auto_30599 ) ) ( not ( = ?auto_30593 ?auto_30600 ) ) ( HOIST-AT ?auto_30597 ?auto_30600 ) ( not ( = ?auto_30594 ?auto_30597 ) ) ( not ( = ?auto_30602 ?auto_30597 ) ) ( SURFACE-AT ?auto_30590 ?auto_30600 ) ( ON ?auto_30590 ?auto_30592 ) ( CLEAR ?auto_30590 ) ( not ( = ?auto_30590 ?auto_30592 ) ) ( not ( = ?auto_30591 ?auto_30592 ) ) ( not ( = ?auto_30589 ?auto_30592 ) ) ( not ( = ?auto_30598 ?auto_30592 ) ) ( IS-CRATE ?auto_30589 ) ( not ( = ?auto_30588 ?auto_30589 ) ) ( not ( = ?auto_30590 ?auto_30588 ) ) ( not ( = ?auto_30591 ?auto_30588 ) ) ( not ( = ?auto_30598 ?auto_30588 ) ) ( not ( = ?auto_30592 ?auto_30588 ) ) ( AVAILABLE ?auto_30597 ) ( SURFACE-AT ?auto_30589 ?auto_30600 ) ( ON ?auto_30589 ?auto_30596 ) ( CLEAR ?auto_30589 ) ( not ( = ?auto_30590 ?auto_30596 ) ) ( not ( = ?auto_30591 ?auto_30596 ) ) ( not ( = ?auto_30589 ?auto_30596 ) ) ( not ( = ?auto_30598 ?auto_30596 ) ) ( not ( = ?auto_30592 ?auto_30596 ) ) ( not ( = ?auto_30588 ?auto_30596 ) ) ( SURFACE-AT ?auto_30587 ?auto_30599 ) ( CLEAR ?auto_30587 ) ( IS-CRATE ?auto_30588 ) ( not ( = ?auto_30587 ?auto_30588 ) ) ( not ( = ?auto_30590 ?auto_30587 ) ) ( not ( = ?auto_30591 ?auto_30587 ) ) ( not ( = ?auto_30589 ?auto_30587 ) ) ( not ( = ?auto_30598 ?auto_30587 ) ) ( not ( = ?auto_30592 ?auto_30587 ) ) ( not ( = ?auto_30596 ?auto_30587 ) ) ( AVAILABLE ?auto_30594 ) ( AVAILABLE ?auto_30602 ) ( SURFACE-AT ?auto_30588 ?auto_30593 ) ( ON ?auto_30588 ?auto_30595 ) ( CLEAR ?auto_30588 ) ( not ( = ?auto_30590 ?auto_30595 ) ) ( not ( = ?auto_30591 ?auto_30595 ) ) ( not ( = ?auto_30589 ?auto_30595 ) ) ( not ( = ?auto_30598 ?auto_30595 ) ) ( not ( = ?auto_30592 ?auto_30595 ) ) ( not ( = ?auto_30588 ?auto_30595 ) ) ( not ( = ?auto_30596 ?auto_30595 ) ) ( not ( = ?auto_30587 ?auto_30595 ) ) ( TRUCK-AT ?auto_30601 ?auto_30599 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30589 ?auto_30590 ?auto_30591 )
      ( MAKE-4CRATE-VERIFY ?auto_30587 ?auto_30588 ?auto_30589 ?auto_30590 ?auto_30591 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30623 - SURFACE
      ?auto_30624 - SURFACE
    )
    :vars
    (
      ?auto_30625 - HOIST
      ?auto_30626 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30625 ?auto_30626 ) ( SURFACE-AT ?auto_30623 ?auto_30626 ) ( CLEAR ?auto_30623 ) ( LIFTING ?auto_30625 ?auto_30624 ) ( IS-CRATE ?auto_30624 ) ( not ( = ?auto_30623 ?auto_30624 ) ) )
    :subtasks
    ( ( !DROP ?auto_30625 ?auto_30624 ?auto_30623 ?auto_30626 )
      ( MAKE-1CRATE-VERIFY ?auto_30623 ?auto_30624 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30627 - SURFACE
      ?auto_30628 - SURFACE
      ?auto_30629 - SURFACE
    )
    :vars
    (
      ?auto_30631 - HOIST
      ?auto_30630 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30631 ?auto_30630 ) ( SURFACE-AT ?auto_30628 ?auto_30630 ) ( CLEAR ?auto_30628 ) ( LIFTING ?auto_30631 ?auto_30629 ) ( IS-CRATE ?auto_30629 ) ( not ( = ?auto_30628 ?auto_30629 ) ) ( ON ?auto_30628 ?auto_30627 ) ( not ( = ?auto_30627 ?auto_30628 ) ) ( not ( = ?auto_30627 ?auto_30629 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30628 ?auto_30629 )
      ( MAKE-2CRATE-VERIFY ?auto_30627 ?auto_30628 ?auto_30629 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30632 - SURFACE
      ?auto_30633 - SURFACE
      ?auto_30634 - SURFACE
      ?auto_30635 - SURFACE
    )
    :vars
    (
      ?auto_30637 - HOIST
      ?auto_30636 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30637 ?auto_30636 ) ( SURFACE-AT ?auto_30634 ?auto_30636 ) ( CLEAR ?auto_30634 ) ( LIFTING ?auto_30637 ?auto_30635 ) ( IS-CRATE ?auto_30635 ) ( not ( = ?auto_30634 ?auto_30635 ) ) ( ON ?auto_30633 ?auto_30632 ) ( ON ?auto_30634 ?auto_30633 ) ( not ( = ?auto_30632 ?auto_30633 ) ) ( not ( = ?auto_30632 ?auto_30634 ) ) ( not ( = ?auto_30632 ?auto_30635 ) ) ( not ( = ?auto_30633 ?auto_30634 ) ) ( not ( = ?auto_30633 ?auto_30635 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30634 ?auto_30635 )
      ( MAKE-3CRATE-VERIFY ?auto_30632 ?auto_30633 ?auto_30634 ?auto_30635 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30638 - SURFACE
      ?auto_30639 - SURFACE
      ?auto_30640 - SURFACE
      ?auto_30641 - SURFACE
      ?auto_30642 - SURFACE
    )
    :vars
    (
      ?auto_30644 - HOIST
      ?auto_30643 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30644 ?auto_30643 ) ( SURFACE-AT ?auto_30641 ?auto_30643 ) ( CLEAR ?auto_30641 ) ( LIFTING ?auto_30644 ?auto_30642 ) ( IS-CRATE ?auto_30642 ) ( not ( = ?auto_30641 ?auto_30642 ) ) ( ON ?auto_30639 ?auto_30638 ) ( ON ?auto_30640 ?auto_30639 ) ( ON ?auto_30641 ?auto_30640 ) ( not ( = ?auto_30638 ?auto_30639 ) ) ( not ( = ?auto_30638 ?auto_30640 ) ) ( not ( = ?auto_30638 ?auto_30641 ) ) ( not ( = ?auto_30638 ?auto_30642 ) ) ( not ( = ?auto_30639 ?auto_30640 ) ) ( not ( = ?auto_30639 ?auto_30641 ) ) ( not ( = ?auto_30639 ?auto_30642 ) ) ( not ( = ?auto_30640 ?auto_30641 ) ) ( not ( = ?auto_30640 ?auto_30642 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30641 ?auto_30642 )
      ( MAKE-4CRATE-VERIFY ?auto_30638 ?auto_30639 ?auto_30640 ?auto_30641 ?auto_30642 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30645 - SURFACE
      ?auto_30646 - SURFACE
      ?auto_30647 - SURFACE
      ?auto_30648 - SURFACE
      ?auto_30649 - SURFACE
      ?auto_30650 - SURFACE
    )
    :vars
    (
      ?auto_30652 - HOIST
      ?auto_30651 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30652 ?auto_30651 ) ( SURFACE-AT ?auto_30649 ?auto_30651 ) ( CLEAR ?auto_30649 ) ( LIFTING ?auto_30652 ?auto_30650 ) ( IS-CRATE ?auto_30650 ) ( not ( = ?auto_30649 ?auto_30650 ) ) ( ON ?auto_30646 ?auto_30645 ) ( ON ?auto_30647 ?auto_30646 ) ( ON ?auto_30648 ?auto_30647 ) ( ON ?auto_30649 ?auto_30648 ) ( not ( = ?auto_30645 ?auto_30646 ) ) ( not ( = ?auto_30645 ?auto_30647 ) ) ( not ( = ?auto_30645 ?auto_30648 ) ) ( not ( = ?auto_30645 ?auto_30649 ) ) ( not ( = ?auto_30645 ?auto_30650 ) ) ( not ( = ?auto_30646 ?auto_30647 ) ) ( not ( = ?auto_30646 ?auto_30648 ) ) ( not ( = ?auto_30646 ?auto_30649 ) ) ( not ( = ?auto_30646 ?auto_30650 ) ) ( not ( = ?auto_30647 ?auto_30648 ) ) ( not ( = ?auto_30647 ?auto_30649 ) ) ( not ( = ?auto_30647 ?auto_30650 ) ) ( not ( = ?auto_30648 ?auto_30649 ) ) ( not ( = ?auto_30648 ?auto_30650 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30649 ?auto_30650 )
      ( MAKE-5CRATE-VERIFY ?auto_30645 ?auto_30646 ?auto_30647 ?auto_30648 ?auto_30649 ?auto_30650 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30653 - SURFACE
      ?auto_30654 - SURFACE
    )
    :vars
    (
      ?auto_30656 - HOIST
      ?auto_30655 - PLACE
      ?auto_30657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30656 ?auto_30655 ) ( SURFACE-AT ?auto_30653 ?auto_30655 ) ( CLEAR ?auto_30653 ) ( IS-CRATE ?auto_30654 ) ( not ( = ?auto_30653 ?auto_30654 ) ) ( TRUCK-AT ?auto_30657 ?auto_30655 ) ( AVAILABLE ?auto_30656 ) ( IN ?auto_30654 ?auto_30657 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30656 ?auto_30654 ?auto_30657 ?auto_30655 )
      ( MAKE-1CRATE ?auto_30653 ?auto_30654 )
      ( MAKE-1CRATE-VERIFY ?auto_30653 ?auto_30654 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30658 - SURFACE
      ?auto_30659 - SURFACE
      ?auto_30660 - SURFACE
    )
    :vars
    (
      ?auto_30662 - HOIST
      ?auto_30663 - PLACE
      ?auto_30661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30662 ?auto_30663 ) ( SURFACE-AT ?auto_30659 ?auto_30663 ) ( CLEAR ?auto_30659 ) ( IS-CRATE ?auto_30660 ) ( not ( = ?auto_30659 ?auto_30660 ) ) ( TRUCK-AT ?auto_30661 ?auto_30663 ) ( AVAILABLE ?auto_30662 ) ( IN ?auto_30660 ?auto_30661 ) ( ON ?auto_30659 ?auto_30658 ) ( not ( = ?auto_30658 ?auto_30659 ) ) ( not ( = ?auto_30658 ?auto_30660 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30659 ?auto_30660 )
      ( MAKE-2CRATE-VERIFY ?auto_30658 ?auto_30659 ?auto_30660 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30664 - SURFACE
      ?auto_30665 - SURFACE
      ?auto_30666 - SURFACE
      ?auto_30667 - SURFACE
    )
    :vars
    (
      ?auto_30669 - HOIST
      ?auto_30668 - PLACE
      ?auto_30670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30669 ?auto_30668 ) ( SURFACE-AT ?auto_30666 ?auto_30668 ) ( CLEAR ?auto_30666 ) ( IS-CRATE ?auto_30667 ) ( not ( = ?auto_30666 ?auto_30667 ) ) ( TRUCK-AT ?auto_30670 ?auto_30668 ) ( AVAILABLE ?auto_30669 ) ( IN ?auto_30667 ?auto_30670 ) ( ON ?auto_30666 ?auto_30665 ) ( not ( = ?auto_30665 ?auto_30666 ) ) ( not ( = ?auto_30665 ?auto_30667 ) ) ( ON ?auto_30665 ?auto_30664 ) ( not ( = ?auto_30664 ?auto_30665 ) ) ( not ( = ?auto_30664 ?auto_30666 ) ) ( not ( = ?auto_30664 ?auto_30667 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30665 ?auto_30666 ?auto_30667 )
      ( MAKE-3CRATE-VERIFY ?auto_30664 ?auto_30665 ?auto_30666 ?auto_30667 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30671 - SURFACE
      ?auto_30672 - SURFACE
      ?auto_30673 - SURFACE
      ?auto_30674 - SURFACE
      ?auto_30675 - SURFACE
    )
    :vars
    (
      ?auto_30677 - HOIST
      ?auto_30676 - PLACE
      ?auto_30678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30677 ?auto_30676 ) ( SURFACE-AT ?auto_30674 ?auto_30676 ) ( CLEAR ?auto_30674 ) ( IS-CRATE ?auto_30675 ) ( not ( = ?auto_30674 ?auto_30675 ) ) ( TRUCK-AT ?auto_30678 ?auto_30676 ) ( AVAILABLE ?auto_30677 ) ( IN ?auto_30675 ?auto_30678 ) ( ON ?auto_30674 ?auto_30673 ) ( not ( = ?auto_30673 ?auto_30674 ) ) ( not ( = ?auto_30673 ?auto_30675 ) ) ( ON ?auto_30672 ?auto_30671 ) ( ON ?auto_30673 ?auto_30672 ) ( not ( = ?auto_30671 ?auto_30672 ) ) ( not ( = ?auto_30671 ?auto_30673 ) ) ( not ( = ?auto_30671 ?auto_30674 ) ) ( not ( = ?auto_30671 ?auto_30675 ) ) ( not ( = ?auto_30672 ?auto_30673 ) ) ( not ( = ?auto_30672 ?auto_30674 ) ) ( not ( = ?auto_30672 ?auto_30675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30673 ?auto_30674 ?auto_30675 )
      ( MAKE-4CRATE-VERIFY ?auto_30671 ?auto_30672 ?auto_30673 ?auto_30674 ?auto_30675 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30679 - SURFACE
      ?auto_30680 - SURFACE
      ?auto_30681 - SURFACE
      ?auto_30682 - SURFACE
      ?auto_30683 - SURFACE
      ?auto_30684 - SURFACE
    )
    :vars
    (
      ?auto_30686 - HOIST
      ?auto_30685 - PLACE
      ?auto_30687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30686 ?auto_30685 ) ( SURFACE-AT ?auto_30683 ?auto_30685 ) ( CLEAR ?auto_30683 ) ( IS-CRATE ?auto_30684 ) ( not ( = ?auto_30683 ?auto_30684 ) ) ( TRUCK-AT ?auto_30687 ?auto_30685 ) ( AVAILABLE ?auto_30686 ) ( IN ?auto_30684 ?auto_30687 ) ( ON ?auto_30683 ?auto_30682 ) ( not ( = ?auto_30682 ?auto_30683 ) ) ( not ( = ?auto_30682 ?auto_30684 ) ) ( ON ?auto_30680 ?auto_30679 ) ( ON ?auto_30681 ?auto_30680 ) ( ON ?auto_30682 ?auto_30681 ) ( not ( = ?auto_30679 ?auto_30680 ) ) ( not ( = ?auto_30679 ?auto_30681 ) ) ( not ( = ?auto_30679 ?auto_30682 ) ) ( not ( = ?auto_30679 ?auto_30683 ) ) ( not ( = ?auto_30679 ?auto_30684 ) ) ( not ( = ?auto_30680 ?auto_30681 ) ) ( not ( = ?auto_30680 ?auto_30682 ) ) ( not ( = ?auto_30680 ?auto_30683 ) ) ( not ( = ?auto_30680 ?auto_30684 ) ) ( not ( = ?auto_30681 ?auto_30682 ) ) ( not ( = ?auto_30681 ?auto_30683 ) ) ( not ( = ?auto_30681 ?auto_30684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30682 ?auto_30683 ?auto_30684 )
      ( MAKE-5CRATE-VERIFY ?auto_30679 ?auto_30680 ?auto_30681 ?auto_30682 ?auto_30683 ?auto_30684 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30688 - SURFACE
      ?auto_30689 - SURFACE
    )
    :vars
    (
      ?auto_30691 - HOIST
      ?auto_30690 - PLACE
      ?auto_30693 - TRUCK
      ?auto_30692 - SURFACE
      ?auto_30694 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30691 ?auto_30690 ) ( SURFACE-AT ?auto_30688 ?auto_30690 ) ( CLEAR ?auto_30688 ) ( IS-CRATE ?auto_30689 ) ( not ( = ?auto_30688 ?auto_30689 ) ) ( AVAILABLE ?auto_30691 ) ( IN ?auto_30689 ?auto_30693 ) ( ON ?auto_30688 ?auto_30692 ) ( not ( = ?auto_30692 ?auto_30688 ) ) ( not ( = ?auto_30692 ?auto_30689 ) ) ( TRUCK-AT ?auto_30693 ?auto_30694 ) ( not ( = ?auto_30694 ?auto_30690 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30693 ?auto_30694 ?auto_30690 )
      ( MAKE-2CRATE ?auto_30692 ?auto_30688 ?auto_30689 )
      ( MAKE-1CRATE-VERIFY ?auto_30688 ?auto_30689 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30695 - SURFACE
      ?auto_30696 - SURFACE
      ?auto_30697 - SURFACE
    )
    :vars
    (
      ?auto_30699 - HOIST
      ?auto_30701 - PLACE
      ?auto_30700 - TRUCK
      ?auto_30698 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30699 ?auto_30701 ) ( SURFACE-AT ?auto_30696 ?auto_30701 ) ( CLEAR ?auto_30696 ) ( IS-CRATE ?auto_30697 ) ( not ( = ?auto_30696 ?auto_30697 ) ) ( AVAILABLE ?auto_30699 ) ( IN ?auto_30697 ?auto_30700 ) ( ON ?auto_30696 ?auto_30695 ) ( not ( = ?auto_30695 ?auto_30696 ) ) ( not ( = ?auto_30695 ?auto_30697 ) ) ( TRUCK-AT ?auto_30700 ?auto_30698 ) ( not ( = ?auto_30698 ?auto_30701 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30696 ?auto_30697 )
      ( MAKE-2CRATE-VERIFY ?auto_30695 ?auto_30696 ?auto_30697 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30702 - SURFACE
      ?auto_30703 - SURFACE
      ?auto_30704 - SURFACE
      ?auto_30705 - SURFACE
    )
    :vars
    (
      ?auto_30709 - HOIST
      ?auto_30706 - PLACE
      ?auto_30707 - TRUCK
      ?auto_30708 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30709 ?auto_30706 ) ( SURFACE-AT ?auto_30704 ?auto_30706 ) ( CLEAR ?auto_30704 ) ( IS-CRATE ?auto_30705 ) ( not ( = ?auto_30704 ?auto_30705 ) ) ( AVAILABLE ?auto_30709 ) ( IN ?auto_30705 ?auto_30707 ) ( ON ?auto_30704 ?auto_30703 ) ( not ( = ?auto_30703 ?auto_30704 ) ) ( not ( = ?auto_30703 ?auto_30705 ) ) ( TRUCK-AT ?auto_30707 ?auto_30708 ) ( not ( = ?auto_30708 ?auto_30706 ) ) ( ON ?auto_30703 ?auto_30702 ) ( not ( = ?auto_30702 ?auto_30703 ) ) ( not ( = ?auto_30702 ?auto_30704 ) ) ( not ( = ?auto_30702 ?auto_30705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30703 ?auto_30704 ?auto_30705 )
      ( MAKE-3CRATE-VERIFY ?auto_30702 ?auto_30703 ?auto_30704 ?auto_30705 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30710 - SURFACE
      ?auto_30711 - SURFACE
      ?auto_30712 - SURFACE
      ?auto_30713 - SURFACE
      ?auto_30714 - SURFACE
    )
    :vars
    (
      ?auto_30718 - HOIST
      ?auto_30715 - PLACE
      ?auto_30716 - TRUCK
      ?auto_30717 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30718 ?auto_30715 ) ( SURFACE-AT ?auto_30713 ?auto_30715 ) ( CLEAR ?auto_30713 ) ( IS-CRATE ?auto_30714 ) ( not ( = ?auto_30713 ?auto_30714 ) ) ( AVAILABLE ?auto_30718 ) ( IN ?auto_30714 ?auto_30716 ) ( ON ?auto_30713 ?auto_30712 ) ( not ( = ?auto_30712 ?auto_30713 ) ) ( not ( = ?auto_30712 ?auto_30714 ) ) ( TRUCK-AT ?auto_30716 ?auto_30717 ) ( not ( = ?auto_30717 ?auto_30715 ) ) ( ON ?auto_30711 ?auto_30710 ) ( ON ?auto_30712 ?auto_30711 ) ( not ( = ?auto_30710 ?auto_30711 ) ) ( not ( = ?auto_30710 ?auto_30712 ) ) ( not ( = ?auto_30710 ?auto_30713 ) ) ( not ( = ?auto_30710 ?auto_30714 ) ) ( not ( = ?auto_30711 ?auto_30712 ) ) ( not ( = ?auto_30711 ?auto_30713 ) ) ( not ( = ?auto_30711 ?auto_30714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30712 ?auto_30713 ?auto_30714 )
      ( MAKE-4CRATE-VERIFY ?auto_30710 ?auto_30711 ?auto_30712 ?auto_30713 ?auto_30714 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30719 - SURFACE
      ?auto_30720 - SURFACE
      ?auto_30721 - SURFACE
      ?auto_30722 - SURFACE
      ?auto_30723 - SURFACE
      ?auto_30724 - SURFACE
    )
    :vars
    (
      ?auto_30728 - HOIST
      ?auto_30725 - PLACE
      ?auto_30726 - TRUCK
      ?auto_30727 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30728 ?auto_30725 ) ( SURFACE-AT ?auto_30723 ?auto_30725 ) ( CLEAR ?auto_30723 ) ( IS-CRATE ?auto_30724 ) ( not ( = ?auto_30723 ?auto_30724 ) ) ( AVAILABLE ?auto_30728 ) ( IN ?auto_30724 ?auto_30726 ) ( ON ?auto_30723 ?auto_30722 ) ( not ( = ?auto_30722 ?auto_30723 ) ) ( not ( = ?auto_30722 ?auto_30724 ) ) ( TRUCK-AT ?auto_30726 ?auto_30727 ) ( not ( = ?auto_30727 ?auto_30725 ) ) ( ON ?auto_30720 ?auto_30719 ) ( ON ?auto_30721 ?auto_30720 ) ( ON ?auto_30722 ?auto_30721 ) ( not ( = ?auto_30719 ?auto_30720 ) ) ( not ( = ?auto_30719 ?auto_30721 ) ) ( not ( = ?auto_30719 ?auto_30722 ) ) ( not ( = ?auto_30719 ?auto_30723 ) ) ( not ( = ?auto_30719 ?auto_30724 ) ) ( not ( = ?auto_30720 ?auto_30721 ) ) ( not ( = ?auto_30720 ?auto_30722 ) ) ( not ( = ?auto_30720 ?auto_30723 ) ) ( not ( = ?auto_30720 ?auto_30724 ) ) ( not ( = ?auto_30721 ?auto_30722 ) ) ( not ( = ?auto_30721 ?auto_30723 ) ) ( not ( = ?auto_30721 ?auto_30724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30722 ?auto_30723 ?auto_30724 )
      ( MAKE-5CRATE-VERIFY ?auto_30719 ?auto_30720 ?auto_30721 ?auto_30722 ?auto_30723 ?auto_30724 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30729 - SURFACE
      ?auto_30730 - SURFACE
    )
    :vars
    (
      ?auto_30735 - HOIST
      ?auto_30731 - PLACE
      ?auto_30733 - SURFACE
      ?auto_30732 - TRUCK
      ?auto_30734 - PLACE
      ?auto_30736 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30735 ?auto_30731 ) ( SURFACE-AT ?auto_30729 ?auto_30731 ) ( CLEAR ?auto_30729 ) ( IS-CRATE ?auto_30730 ) ( not ( = ?auto_30729 ?auto_30730 ) ) ( AVAILABLE ?auto_30735 ) ( ON ?auto_30729 ?auto_30733 ) ( not ( = ?auto_30733 ?auto_30729 ) ) ( not ( = ?auto_30733 ?auto_30730 ) ) ( TRUCK-AT ?auto_30732 ?auto_30734 ) ( not ( = ?auto_30734 ?auto_30731 ) ) ( HOIST-AT ?auto_30736 ?auto_30734 ) ( LIFTING ?auto_30736 ?auto_30730 ) ( not ( = ?auto_30735 ?auto_30736 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30736 ?auto_30730 ?auto_30732 ?auto_30734 )
      ( MAKE-2CRATE ?auto_30733 ?auto_30729 ?auto_30730 )
      ( MAKE-1CRATE-VERIFY ?auto_30729 ?auto_30730 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30737 - SURFACE
      ?auto_30738 - SURFACE
      ?auto_30739 - SURFACE
    )
    :vars
    (
      ?auto_30744 - HOIST
      ?auto_30743 - PLACE
      ?auto_30741 - TRUCK
      ?auto_30742 - PLACE
      ?auto_30740 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30744 ?auto_30743 ) ( SURFACE-AT ?auto_30738 ?auto_30743 ) ( CLEAR ?auto_30738 ) ( IS-CRATE ?auto_30739 ) ( not ( = ?auto_30738 ?auto_30739 ) ) ( AVAILABLE ?auto_30744 ) ( ON ?auto_30738 ?auto_30737 ) ( not ( = ?auto_30737 ?auto_30738 ) ) ( not ( = ?auto_30737 ?auto_30739 ) ) ( TRUCK-AT ?auto_30741 ?auto_30742 ) ( not ( = ?auto_30742 ?auto_30743 ) ) ( HOIST-AT ?auto_30740 ?auto_30742 ) ( LIFTING ?auto_30740 ?auto_30739 ) ( not ( = ?auto_30744 ?auto_30740 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30738 ?auto_30739 )
      ( MAKE-2CRATE-VERIFY ?auto_30737 ?auto_30738 ?auto_30739 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30745 - SURFACE
      ?auto_30746 - SURFACE
      ?auto_30747 - SURFACE
      ?auto_30748 - SURFACE
    )
    :vars
    (
      ?auto_30749 - HOIST
      ?auto_30752 - PLACE
      ?auto_30751 - TRUCK
      ?auto_30750 - PLACE
      ?auto_30753 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30749 ?auto_30752 ) ( SURFACE-AT ?auto_30747 ?auto_30752 ) ( CLEAR ?auto_30747 ) ( IS-CRATE ?auto_30748 ) ( not ( = ?auto_30747 ?auto_30748 ) ) ( AVAILABLE ?auto_30749 ) ( ON ?auto_30747 ?auto_30746 ) ( not ( = ?auto_30746 ?auto_30747 ) ) ( not ( = ?auto_30746 ?auto_30748 ) ) ( TRUCK-AT ?auto_30751 ?auto_30750 ) ( not ( = ?auto_30750 ?auto_30752 ) ) ( HOIST-AT ?auto_30753 ?auto_30750 ) ( LIFTING ?auto_30753 ?auto_30748 ) ( not ( = ?auto_30749 ?auto_30753 ) ) ( ON ?auto_30746 ?auto_30745 ) ( not ( = ?auto_30745 ?auto_30746 ) ) ( not ( = ?auto_30745 ?auto_30747 ) ) ( not ( = ?auto_30745 ?auto_30748 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30746 ?auto_30747 ?auto_30748 )
      ( MAKE-3CRATE-VERIFY ?auto_30745 ?auto_30746 ?auto_30747 ?auto_30748 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30754 - SURFACE
      ?auto_30755 - SURFACE
      ?auto_30756 - SURFACE
      ?auto_30757 - SURFACE
      ?auto_30758 - SURFACE
    )
    :vars
    (
      ?auto_30759 - HOIST
      ?auto_30762 - PLACE
      ?auto_30761 - TRUCK
      ?auto_30760 - PLACE
      ?auto_30763 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30759 ?auto_30762 ) ( SURFACE-AT ?auto_30757 ?auto_30762 ) ( CLEAR ?auto_30757 ) ( IS-CRATE ?auto_30758 ) ( not ( = ?auto_30757 ?auto_30758 ) ) ( AVAILABLE ?auto_30759 ) ( ON ?auto_30757 ?auto_30756 ) ( not ( = ?auto_30756 ?auto_30757 ) ) ( not ( = ?auto_30756 ?auto_30758 ) ) ( TRUCK-AT ?auto_30761 ?auto_30760 ) ( not ( = ?auto_30760 ?auto_30762 ) ) ( HOIST-AT ?auto_30763 ?auto_30760 ) ( LIFTING ?auto_30763 ?auto_30758 ) ( not ( = ?auto_30759 ?auto_30763 ) ) ( ON ?auto_30755 ?auto_30754 ) ( ON ?auto_30756 ?auto_30755 ) ( not ( = ?auto_30754 ?auto_30755 ) ) ( not ( = ?auto_30754 ?auto_30756 ) ) ( not ( = ?auto_30754 ?auto_30757 ) ) ( not ( = ?auto_30754 ?auto_30758 ) ) ( not ( = ?auto_30755 ?auto_30756 ) ) ( not ( = ?auto_30755 ?auto_30757 ) ) ( not ( = ?auto_30755 ?auto_30758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30756 ?auto_30757 ?auto_30758 )
      ( MAKE-4CRATE-VERIFY ?auto_30754 ?auto_30755 ?auto_30756 ?auto_30757 ?auto_30758 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30764 - SURFACE
      ?auto_30765 - SURFACE
      ?auto_30766 - SURFACE
      ?auto_30767 - SURFACE
      ?auto_30768 - SURFACE
      ?auto_30769 - SURFACE
    )
    :vars
    (
      ?auto_30770 - HOIST
      ?auto_30773 - PLACE
      ?auto_30772 - TRUCK
      ?auto_30771 - PLACE
      ?auto_30774 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30770 ?auto_30773 ) ( SURFACE-AT ?auto_30768 ?auto_30773 ) ( CLEAR ?auto_30768 ) ( IS-CRATE ?auto_30769 ) ( not ( = ?auto_30768 ?auto_30769 ) ) ( AVAILABLE ?auto_30770 ) ( ON ?auto_30768 ?auto_30767 ) ( not ( = ?auto_30767 ?auto_30768 ) ) ( not ( = ?auto_30767 ?auto_30769 ) ) ( TRUCK-AT ?auto_30772 ?auto_30771 ) ( not ( = ?auto_30771 ?auto_30773 ) ) ( HOIST-AT ?auto_30774 ?auto_30771 ) ( LIFTING ?auto_30774 ?auto_30769 ) ( not ( = ?auto_30770 ?auto_30774 ) ) ( ON ?auto_30765 ?auto_30764 ) ( ON ?auto_30766 ?auto_30765 ) ( ON ?auto_30767 ?auto_30766 ) ( not ( = ?auto_30764 ?auto_30765 ) ) ( not ( = ?auto_30764 ?auto_30766 ) ) ( not ( = ?auto_30764 ?auto_30767 ) ) ( not ( = ?auto_30764 ?auto_30768 ) ) ( not ( = ?auto_30764 ?auto_30769 ) ) ( not ( = ?auto_30765 ?auto_30766 ) ) ( not ( = ?auto_30765 ?auto_30767 ) ) ( not ( = ?auto_30765 ?auto_30768 ) ) ( not ( = ?auto_30765 ?auto_30769 ) ) ( not ( = ?auto_30766 ?auto_30767 ) ) ( not ( = ?auto_30766 ?auto_30768 ) ) ( not ( = ?auto_30766 ?auto_30769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30767 ?auto_30768 ?auto_30769 )
      ( MAKE-5CRATE-VERIFY ?auto_30764 ?auto_30765 ?auto_30766 ?auto_30767 ?auto_30768 ?auto_30769 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30775 - SURFACE
      ?auto_30776 - SURFACE
    )
    :vars
    (
      ?auto_30778 - HOIST
      ?auto_30781 - PLACE
      ?auto_30777 - SURFACE
      ?auto_30780 - TRUCK
      ?auto_30779 - PLACE
      ?auto_30782 - HOIST
      ?auto_30783 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30778 ?auto_30781 ) ( SURFACE-AT ?auto_30775 ?auto_30781 ) ( CLEAR ?auto_30775 ) ( IS-CRATE ?auto_30776 ) ( not ( = ?auto_30775 ?auto_30776 ) ) ( AVAILABLE ?auto_30778 ) ( ON ?auto_30775 ?auto_30777 ) ( not ( = ?auto_30777 ?auto_30775 ) ) ( not ( = ?auto_30777 ?auto_30776 ) ) ( TRUCK-AT ?auto_30780 ?auto_30779 ) ( not ( = ?auto_30779 ?auto_30781 ) ) ( HOIST-AT ?auto_30782 ?auto_30779 ) ( not ( = ?auto_30778 ?auto_30782 ) ) ( AVAILABLE ?auto_30782 ) ( SURFACE-AT ?auto_30776 ?auto_30779 ) ( ON ?auto_30776 ?auto_30783 ) ( CLEAR ?auto_30776 ) ( not ( = ?auto_30775 ?auto_30783 ) ) ( not ( = ?auto_30776 ?auto_30783 ) ) ( not ( = ?auto_30777 ?auto_30783 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30782 ?auto_30776 ?auto_30783 ?auto_30779 )
      ( MAKE-2CRATE ?auto_30777 ?auto_30775 ?auto_30776 )
      ( MAKE-1CRATE-VERIFY ?auto_30775 ?auto_30776 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30784 - SURFACE
      ?auto_30785 - SURFACE
      ?auto_30786 - SURFACE
    )
    :vars
    (
      ?auto_30791 - HOIST
      ?auto_30789 - PLACE
      ?auto_30790 - TRUCK
      ?auto_30788 - PLACE
      ?auto_30787 - HOIST
      ?auto_30792 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30791 ?auto_30789 ) ( SURFACE-AT ?auto_30785 ?auto_30789 ) ( CLEAR ?auto_30785 ) ( IS-CRATE ?auto_30786 ) ( not ( = ?auto_30785 ?auto_30786 ) ) ( AVAILABLE ?auto_30791 ) ( ON ?auto_30785 ?auto_30784 ) ( not ( = ?auto_30784 ?auto_30785 ) ) ( not ( = ?auto_30784 ?auto_30786 ) ) ( TRUCK-AT ?auto_30790 ?auto_30788 ) ( not ( = ?auto_30788 ?auto_30789 ) ) ( HOIST-AT ?auto_30787 ?auto_30788 ) ( not ( = ?auto_30791 ?auto_30787 ) ) ( AVAILABLE ?auto_30787 ) ( SURFACE-AT ?auto_30786 ?auto_30788 ) ( ON ?auto_30786 ?auto_30792 ) ( CLEAR ?auto_30786 ) ( not ( = ?auto_30785 ?auto_30792 ) ) ( not ( = ?auto_30786 ?auto_30792 ) ) ( not ( = ?auto_30784 ?auto_30792 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30785 ?auto_30786 )
      ( MAKE-2CRATE-VERIFY ?auto_30784 ?auto_30785 ?auto_30786 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30793 - SURFACE
      ?auto_30794 - SURFACE
      ?auto_30795 - SURFACE
      ?auto_30796 - SURFACE
    )
    :vars
    (
      ?auto_30798 - HOIST
      ?auto_30801 - PLACE
      ?auto_30799 - TRUCK
      ?auto_30797 - PLACE
      ?auto_30800 - HOIST
      ?auto_30802 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30798 ?auto_30801 ) ( SURFACE-AT ?auto_30795 ?auto_30801 ) ( CLEAR ?auto_30795 ) ( IS-CRATE ?auto_30796 ) ( not ( = ?auto_30795 ?auto_30796 ) ) ( AVAILABLE ?auto_30798 ) ( ON ?auto_30795 ?auto_30794 ) ( not ( = ?auto_30794 ?auto_30795 ) ) ( not ( = ?auto_30794 ?auto_30796 ) ) ( TRUCK-AT ?auto_30799 ?auto_30797 ) ( not ( = ?auto_30797 ?auto_30801 ) ) ( HOIST-AT ?auto_30800 ?auto_30797 ) ( not ( = ?auto_30798 ?auto_30800 ) ) ( AVAILABLE ?auto_30800 ) ( SURFACE-AT ?auto_30796 ?auto_30797 ) ( ON ?auto_30796 ?auto_30802 ) ( CLEAR ?auto_30796 ) ( not ( = ?auto_30795 ?auto_30802 ) ) ( not ( = ?auto_30796 ?auto_30802 ) ) ( not ( = ?auto_30794 ?auto_30802 ) ) ( ON ?auto_30794 ?auto_30793 ) ( not ( = ?auto_30793 ?auto_30794 ) ) ( not ( = ?auto_30793 ?auto_30795 ) ) ( not ( = ?auto_30793 ?auto_30796 ) ) ( not ( = ?auto_30793 ?auto_30802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30794 ?auto_30795 ?auto_30796 )
      ( MAKE-3CRATE-VERIFY ?auto_30793 ?auto_30794 ?auto_30795 ?auto_30796 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30803 - SURFACE
      ?auto_30804 - SURFACE
      ?auto_30805 - SURFACE
      ?auto_30806 - SURFACE
      ?auto_30807 - SURFACE
    )
    :vars
    (
      ?auto_30809 - HOIST
      ?auto_30812 - PLACE
      ?auto_30810 - TRUCK
      ?auto_30808 - PLACE
      ?auto_30811 - HOIST
      ?auto_30813 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30809 ?auto_30812 ) ( SURFACE-AT ?auto_30806 ?auto_30812 ) ( CLEAR ?auto_30806 ) ( IS-CRATE ?auto_30807 ) ( not ( = ?auto_30806 ?auto_30807 ) ) ( AVAILABLE ?auto_30809 ) ( ON ?auto_30806 ?auto_30805 ) ( not ( = ?auto_30805 ?auto_30806 ) ) ( not ( = ?auto_30805 ?auto_30807 ) ) ( TRUCK-AT ?auto_30810 ?auto_30808 ) ( not ( = ?auto_30808 ?auto_30812 ) ) ( HOIST-AT ?auto_30811 ?auto_30808 ) ( not ( = ?auto_30809 ?auto_30811 ) ) ( AVAILABLE ?auto_30811 ) ( SURFACE-AT ?auto_30807 ?auto_30808 ) ( ON ?auto_30807 ?auto_30813 ) ( CLEAR ?auto_30807 ) ( not ( = ?auto_30806 ?auto_30813 ) ) ( not ( = ?auto_30807 ?auto_30813 ) ) ( not ( = ?auto_30805 ?auto_30813 ) ) ( ON ?auto_30804 ?auto_30803 ) ( ON ?auto_30805 ?auto_30804 ) ( not ( = ?auto_30803 ?auto_30804 ) ) ( not ( = ?auto_30803 ?auto_30805 ) ) ( not ( = ?auto_30803 ?auto_30806 ) ) ( not ( = ?auto_30803 ?auto_30807 ) ) ( not ( = ?auto_30803 ?auto_30813 ) ) ( not ( = ?auto_30804 ?auto_30805 ) ) ( not ( = ?auto_30804 ?auto_30806 ) ) ( not ( = ?auto_30804 ?auto_30807 ) ) ( not ( = ?auto_30804 ?auto_30813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30805 ?auto_30806 ?auto_30807 )
      ( MAKE-4CRATE-VERIFY ?auto_30803 ?auto_30804 ?auto_30805 ?auto_30806 ?auto_30807 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30814 - SURFACE
      ?auto_30815 - SURFACE
      ?auto_30816 - SURFACE
      ?auto_30817 - SURFACE
      ?auto_30818 - SURFACE
      ?auto_30819 - SURFACE
    )
    :vars
    (
      ?auto_30821 - HOIST
      ?auto_30824 - PLACE
      ?auto_30822 - TRUCK
      ?auto_30820 - PLACE
      ?auto_30823 - HOIST
      ?auto_30825 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30821 ?auto_30824 ) ( SURFACE-AT ?auto_30818 ?auto_30824 ) ( CLEAR ?auto_30818 ) ( IS-CRATE ?auto_30819 ) ( not ( = ?auto_30818 ?auto_30819 ) ) ( AVAILABLE ?auto_30821 ) ( ON ?auto_30818 ?auto_30817 ) ( not ( = ?auto_30817 ?auto_30818 ) ) ( not ( = ?auto_30817 ?auto_30819 ) ) ( TRUCK-AT ?auto_30822 ?auto_30820 ) ( not ( = ?auto_30820 ?auto_30824 ) ) ( HOIST-AT ?auto_30823 ?auto_30820 ) ( not ( = ?auto_30821 ?auto_30823 ) ) ( AVAILABLE ?auto_30823 ) ( SURFACE-AT ?auto_30819 ?auto_30820 ) ( ON ?auto_30819 ?auto_30825 ) ( CLEAR ?auto_30819 ) ( not ( = ?auto_30818 ?auto_30825 ) ) ( not ( = ?auto_30819 ?auto_30825 ) ) ( not ( = ?auto_30817 ?auto_30825 ) ) ( ON ?auto_30815 ?auto_30814 ) ( ON ?auto_30816 ?auto_30815 ) ( ON ?auto_30817 ?auto_30816 ) ( not ( = ?auto_30814 ?auto_30815 ) ) ( not ( = ?auto_30814 ?auto_30816 ) ) ( not ( = ?auto_30814 ?auto_30817 ) ) ( not ( = ?auto_30814 ?auto_30818 ) ) ( not ( = ?auto_30814 ?auto_30819 ) ) ( not ( = ?auto_30814 ?auto_30825 ) ) ( not ( = ?auto_30815 ?auto_30816 ) ) ( not ( = ?auto_30815 ?auto_30817 ) ) ( not ( = ?auto_30815 ?auto_30818 ) ) ( not ( = ?auto_30815 ?auto_30819 ) ) ( not ( = ?auto_30815 ?auto_30825 ) ) ( not ( = ?auto_30816 ?auto_30817 ) ) ( not ( = ?auto_30816 ?auto_30818 ) ) ( not ( = ?auto_30816 ?auto_30819 ) ) ( not ( = ?auto_30816 ?auto_30825 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30817 ?auto_30818 ?auto_30819 )
      ( MAKE-5CRATE-VERIFY ?auto_30814 ?auto_30815 ?auto_30816 ?auto_30817 ?auto_30818 ?auto_30819 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30826 - SURFACE
      ?auto_30827 - SURFACE
    )
    :vars
    (
      ?auto_30830 - HOIST
      ?auto_30833 - PLACE
      ?auto_30829 - SURFACE
      ?auto_30828 - PLACE
      ?auto_30832 - HOIST
      ?auto_30834 - SURFACE
      ?auto_30831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30830 ?auto_30833 ) ( SURFACE-AT ?auto_30826 ?auto_30833 ) ( CLEAR ?auto_30826 ) ( IS-CRATE ?auto_30827 ) ( not ( = ?auto_30826 ?auto_30827 ) ) ( AVAILABLE ?auto_30830 ) ( ON ?auto_30826 ?auto_30829 ) ( not ( = ?auto_30829 ?auto_30826 ) ) ( not ( = ?auto_30829 ?auto_30827 ) ) ( not ( = ?auto_30828 ?auto_30833 ) ) ( HOIST-AT ?auto_30832 ?auto_30828 ) ( not ( = ?auto_30830 ?auto_30832 ) ) ( AVAILABLE ?auto_30832 ) ( SURFACE-AT ?auto_30827 ?auto_30828 ) ( ON ?auto_30827 ?auto_30834 ) ( CLEAR ?auto_30827 ) ( not ( = ?auto_30826 ?auto_30834 ) ) ( not ( = ?auto_30827 ?auto_30834 ) ) ( not ( = ?auto_30829 ?auto_30834 ) ) ( TRUCK-AT ?auto_30831 ?auto_30833 ) )
    :subtasks
    ( ( !DRIVE ?auto_30831 ?auto_30833 ?auto_30828 )
      ( MAKE-2CRATE ?auto_30829 ?auto_30826 ?auto_30827 )
      ( MAKE-1CRATE-VERIFY ?auto_30826 ?auto_30827 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30835 - SURFACE
      ?auto_30836 - SURFACE
      ?auto_30837 - SURFACE
    )
    :vars
    (
      ?auto_30843 - HOIST
      ?auto_30838 - PLACE
      ?auto_30839 - PLACE
      ?auto_30840 - HOIST
      ?auto_30841 - SURFACE
      ?auto_30842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30843 ?auto_30838 ) ( SURFACE-AT ?auto_30836 ?auto_30838 ) ( CLEAR ?auto_30836 ) ( IS-CRATE ?auto_30837 ) ( not ( = ?auto_30836 ?auto_30837 ) ) ( AVAILABLE ?auto_30843 ) ( ON ?auto_30836 ?auto_30835 ) ( not ( = ?auto_30835 ?auto_30836 ) ) ( not ( = ?auto_30835 ?auto_30837 ) ) ( not ( = ?auto_30839 ?auto_30838 ) ) ( HOIST-AT ?auto_30840 ?auto_30839 ) ( not ( = ?auto_30843 ?auto_30840 ) ) ( AVAILABLE ?auto_30840 ) ( SURFACE-AT ?auto_30837 ?auto_30839 ) ( ON ?auto_30837 ?auto_30841 ) ( CLEAR ?auto_30837 ) ( not ( = ?auto_30836 ?auto_30841 ) ) ( not ( = ?auto_30837 ?auto_30841 ) ) ( not ( = ?auto_30835 ?auto_30841 ) ) ( TRUCK-AT ?auto_30842 ?auto_30838 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30836 ?auto_30837 )
      ( MAKE-2CRATE-VERIFY ?auto_30835 ?auto_30836 ?auto_30837 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30844 - SURFACE
      ?auto_30845 - SURFACE
      ?auto_30846 - SURFACE
      ?auto_30847 - SURFACE
    )
    :vars
    (
      ?auto_30853 - HOIST
      ?auto_30851 - PLACE
      ?auto_30852 - PLACE
      ?auto_30849 - HOIST
      ?auto_30848 - SURFACE
      ?auto_30850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30853 ?auto_30851 ) ( SURFACE-AT ?auto_30846 ?auto_30851 ) ( CLEAR ?auto_30846 ) ( IS-CRATE ?auto_30847 ) ( not ( = ?auto_30846 ?auto_30847 ) ) ( AVAILABLE ?auto_30853 ) ( ON ?auto_30846 ?auto_30845 ) ( not ( = ?auto_30845 ?auto_30846 ) ) ( not ( = ?auto_30845 ?auto_30847 ) ) ( not ( = ?auto_30852 ?auto_30851 ) ) ( HOIST-AT ?auto_30849 ?auto_30852 ) ( not ( = ?auto_30853 ?auto_30849 ) ) ( AVAILABLE ?auto_30849 ) ( SURFACE-AT ?auto_30847 ?auto_30852 ) ( ON ?auto_30847 ?auto_30848 ) ( CLEAR ?auto_30847 ) ( not ( = ?auto_30846 ?auto_30848 ) ) ( not ( = ?auto_30847 ?auto_30848 ) ) ( not ( = ?auto_30845 ?auto_30848 ) ) ( TRUCK-AT ?auto_30850 ?auto_30851 ) ( ON ?auto_30845 ?auto_30844 ) ( not ( = ?auto_30844 ?auto_30845 ) ) ( not ( = ?auto_30844 ?auto_30846 ) ) ( not ( = ?auto_30844 ?auto_30847 ) ) ( not ( = ?auto_30844 ?auto_30848 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30845 ?auto_30846 ?auto_30847 )
      ( MAKE-3CRATE-VERIFY ?auto_30844 ?auto_30845 ?auto_30846 ?auto_30847 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30854 - SURFACE
      ?auto_30855 - SURFACE
      ?auto_30856 - SURFACE
      ?auto_30857 - SURFACE
      ?auto_30858 - SURFACE
    )
    :vars
    (
      ?auto_30864 - HOIST
      ?auto_30862 - PLACE
      ?auto_30863 - PLACE
      ?auto_30860 - HOIST
      ?auto_30859 - SURFACE
      ?auto_30861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30864 ?auto_30862 ) ( SURFACE-AT ?auto_30857 ?auto_30862 ) ( CLEAR ?auto_30857 ) ( IS-CRATE ?auto_30858 ) ( not ( = ?auto_30857 ?auto_30858 ) ) ( AVAILABLE ?auto_30864 ) ( ON ?auto_30857 ?auto_30856 ) ( not ( = ?auto_30856 ?auto_30857 ) ) ( not ( = ?auto_30856 ?auto_30858 ) ) ( not ( = ?auto_30863 ?auto_30862 ) ) ( HOIST-AT ?auto_30860 ?auto_30863 ) ( not ( = ?auto_30864 ?auto_30860 ) ) ( AVAILABLE ?auto_30860 ) ( SURFACE-AT ?auto_30858 ?auto_30863 ) ( ON ?auto_30858 ?auto_30859 ) ( CLEAR ?auto_30858 ) ( not ( = ?auto_30857 ?auto_30859 ) ) ( not ( = ?auto_30858 ?auto_30859 ) ) ( not ( = ?auto_30856 ?auto_30859 ) ) ( TRUCK-AT ?auto_30861 ?auto_30862 ) ( ON ?auto_30855 ?auto_30854 ) ( ON ?auto_30856 ?auto_30855 ) ( not ( = ?auto_30854 ?auto_30855 ) ) ( not ( = ?auto_30854 ?auto_30856 ) ) ( not ( = ?auto_30854 ?auto_30857 ) ) ( not ( = ?auto_30854 ?auto_30858 ) ) ( not ( = ?auto_30854 ?auto_30859 ) ) ( not ( = ?auto_30855 ?auto_30856 ) ) ( not ( = ?auto_30855 ?auto_30857 ) ) ( not ( = ?auto_30855 ?auto_30858 ) ) ( not ( = ?auto_30855 ?auto_30859 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30856 ?auto_30857 ?auto_30858 )
      ( MAKE-4CRATE-VERIFY ?auto_30854 ?auto_30855 ?auto_30856 ?auto_30857 ?auto_30858 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30865 - SURFACE
      ?auto_30866 - SURFACE
      ?auto_30867 - SURFACE
      ?auto_30868 - SURFACE
      ?auto_30869 - SURFACE
      ?auto_30870 - SURFACE
    )
    :vars
    (
      ?auto_30876 - HOIST
      ?auto_30874 - PLACE
      ?auto_30875 - PLACE
      ?auto_30872 - HOIST
      ?auto_30871 - SURFACE
      ?auto_30873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30876 ?auto_30874 ) ( SURFACE-AT ?auto_30869 ?auto_30874 ) ( CLEAR ?auto_30869 ) ( IS-CRATE ?auto_30870 ) ( not ( = ?auto_30869 ?auto_30870 ) ) ( AVAILABLE ?auto_30876 ) ( ON ?auto_30869 ?auto_30868 ) ( not ( = ?auto_30868 ?auto_30869 ) ) ( not ( = ?auto_30868 ?auto_30870 ) ) ( not ( = ?auto_30875 ?auto_30874 ) ) ( HOIST-AT ?auto_30872 ?auto_30875 ) ( not ( = ?auto_30876 ?auto_30872 ) ) ( AVAILABLE ?auto_30872 ) ( SURFACE-AT ?auto_30870 ?auto_30875 ) ( ON ?auto_30870 ?auto_30871 ) ( CLEAR ?auto_30870 ) ( not ( = ?auto_30869 ?auto_30871 ) ) ( not ( = ?auto_30870 ?auto_30871 ) ) ( not ( = ?auto_30868 ?auto_30871 ) ) ( TRUCK-AT ?auto_30873 ?auto_30874 ) ( ON ?auto_30866 ?auto_30865 ) ( ON ?auto_30867 ?auto_30866 ) ( ON ?auto_30868 ?auto_30867 ) ( not ( = ?auto_30865 ?auto_30866 ) ) ( not ( = ?auto_30865 ?auto_30867 ) ) ( not ( = ?auto_30865 ?auto_30868 ) ) ( not ( = ?auto_30865 ?auto_30869 ) ) ( not ( = ?auto_30865 ?auto_30870 ) ) ( not ( = ?auto_30865 ?auto_30871 ) ) ( not ( = ?auto_30866 ?auto_30867 ) ) ( not ( = ?auto_30866 ?auto_30868 ) ) ( not ( = ?auto_30866 ?auto_30869 ) ) ( not ( = ?auto_30866 ?auto_30870 ) ) ( not ( = ?auto_30866 ?auto_30871 ) ) ( not ( = ?auto_30867 ?auto_30868 ) ) ( not ( = ?auto_30867 ?auto_30869 ) ) ( not ( = ?auto_30867 ?auto_30870 ) ) ( not ( = ?auto_30867 ?auto_30871 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30868 ?auto_30869 ?auto_30870 )
      ( MAKE-5CRATE-VERIFY ?auto_30865 ?auto_30866 ?auto_30867 ?auto_30868 ?auto_30869 ?auto_30870 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30877 - SURFACE
      ?auto_30878 - SURFACE
    )
    :vars
    (
      ?auto_30885 - HOIST
      ?auto_30883 - PLACE
      ?auto_30881 - SURFACE
      ?auto_30884 - PLACE
      ?auto_30880 - HOIST
      ?auto_30879 - SURFACE
      ?auto_30882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30885 ?auto_30883 ) ( IS-CRATE ?auto_30878 ) ( not ( = ?auto_30877 ?auto_30878 ) ) ( not ( = ?auto_30881 ?auto_30877 ) ) ( not ( = ?auto_30881 ?auto_30878 ) ) ( not ( = ?auto_30884 ?auto_30883 ) ) ( HOIST-AT ?auto_30880 ?auto_30884 ) ( not ( = ?auto_30885 ?auto_30880 ) ) ( AVAILABLE ?auto_30880 ) ( SURFACE-AT ?auto_30878 ?auto_30884 ) ( ON ?auto_30878 ?auto_30879 ) ( CLEAR ?auto_30878 ) ( not ( = ?auto_30877 ?auto_30879 ) ) ( not ( = ?auto_30878 ?auto_30879 ) ) ( not ( = ?auto_30881 ?auto_30879 ) ) ( TRUCK-AT ?auto_30882 ?auto_30883 ) ( SURFACE-AT ?auto_30881 ?auto_30883 ) ( CLEAR ?auto_30881 ) ( LIFTING ?auto_30885 ?auto_30877 ) ( IS-CRATE ?auto_30877 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30881 ?auto_30877 )
      ( MAKE-2CRATE ?auto_30881 ?auto_30877 ?auto_30878 )
      ( MAKE-1CRATE-VERIFY ?auto_30877 ?auto_30878 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30886 - SURFACE
      ?auto_30887 - SURFACE
      ?auto_30888 - SURFACE
    )
    :vars
    (
      ?auto_30894 - HOIST
      ?auto_30889 - PLACE
      ?auto_30892 - PLACE
      ?auto_30893 - HOIST
      ?auto_30891 - SURFACE
      ?auto_30890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30894 ?auto_30889 ) ( IS-CRATE ?auto_30888 ) ( not ( = ?auto_30887 ?auto_30888 ) ) ( not ( = ?auto_30886 ?auto_30887 ) ) ( not ( = ?auto_30886 ?auto_30888 ) ) ( not ( = ?auto_30892 ?auto_30889 ) ) ( HOIST-AT ?auto_30893 ?auto_30892 ) ( not ( = ?auto_30894 ?auto_30893 ) ) ( AVAILABLE ?auto_30893 ) ( SURFACE-AT ?auto_30888 ?auto_30892 ) ( ON ?auto_30888 ?auto_30891 ) ( CLEAR ?auto_30888 ) ( not ( = ?auto_30887 ?auto_30891 ) ) ( not ( = ?auto_30888 ?auto_30891 ) ) ( not ( = ?auto_30886 ?auto_30891 ) ) ( TRUCK-AT ?auto_30890 ?auto_30889 ) ( SURFACE-AT ?auto_30886 ?auto_30889 ) ( CLEAR ?auto_30886 ) ( LIFTING ?auto_30894 ?auto_30887 ) ( IS-CRATE ?auto_30887 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30887 ?auto_30888 )
      ( MAKE-2CRATE-VERIFY ?auto_30886 ?auto_30887 ?auto_30888 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30895 - SURFACE
      ?auto_30896 - SURFACE
      ?auto_30897 - SURFACE
      ?auto_30898 - SURFACE
    )
    :vars
    (
      ?auto_30902 - HOIST
      ?auto_30901 - PLACE
      ?auto_30903 - PLACE
      ?auto_30899 - HOIST
      ?auto_30904 - SURFACE
      ?auto_30900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30902 ?auto_30901 ) ( IS-CRATE ?auto_30898 ) ( not ( = ?auto_30897 ?auto_30898 ) ) ( not ( = ?auto_30896 ?auto_30897 ) ) ( not ( = ?auto_30896 ?auto_30898 ) ) ( not ( = ?auto_30903 ?auto_30901 ) ) ( HOIST-AT ?auto_30899 ?auto_30903 ) ( not ( = ?auto_30902 ?auto_30899 ) ) ( AVAILABLE ?auto_30899 ) ( SURFACE-AT ?auto_30898 ?auto_30903 ) ( ON ?auto_30898 ?auto_30904 ) ( CLEAR ?auto_30898 ) ( not ( = ?auto_30897 ?auto_30904 ) ) ( not ( = ?auto_30898 ?auto_30904 ) ) ( not ( = ?auto_30896 ?auto_30904 ) ) ( TRUCK-AT ?auto_30900 ?auto_30901 ) ( SURFACE-AT ?auto_30896 ?auto_30901 ) ( CLEAR ?auto_30896 ) ( LIFTING ?auto_30902 ?auto_30897 ) ( IS-CRATE ?auto_30897 ) ( ON ?auto_30896 ?auto_30895 ) ( not ( = ?auto_30895 ?auto_30896 ) ) ( not ( = ?auto_30895 ?auto_30897 ) ) ( not ( = ?auto_30895 ?auto_30898 ) ) ( not ( = ?auto_30895 ?auto_30904 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30896 ?auto_30897 ?auto_30898 )
      ( MAKE-3CRATE-VERIFY ?auto_30895 ?auto_30896 ?auto_30897 ?auto_30898 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30905 - SURFACE
      ?auto_30906 - SURFACE
      ?auto_30907 - SURFACE
      ?auto_30908 - SURFACE
      ?auto_30909 - SURFACE
    )
    :vars
    (
      ?auto_30913 - HOIST
      ?auto_30912 - PLACE
      ?auto_30914 - PLACE
      ?auto_30910 - HOIST
      ?auto_30915 - SURFACE
      ?auto_30911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30913 ?auto_30912 ) ( IS-CRATE ?auto_30909 ) ( not ( = ?auto_30908 ?auto_30909 ) ) ( not ( = ?auto_30907 ?auto_30908 ) ) ( not ( = ?auto_30907 ?auto_30909 ) ) ( not ( = ?auto_30914 ?auto_30912 ) ) ( HOIST-AT ?auto_30910 ?auto_30914 ) ( not ( = ?auto_30913 ?auto_30910 ) ) ( AVAILABLE ?auto_30910 ) ( SURFACE-AT ?auto_30909 ?auto_30914 ) ( ON ?auto_30909 ?auto_30915 ) ( CLEAR ?auto_30909 ) ( not ( = ?auto_30908 ?auto_30915 ) ) ( not ( = ?auto_30909 ?auto_30915 ) ) ( not ( = ?auto_30907 ?auto_30915 ) ) ( TRUCK-AT ?auto_30911 ?auto_30912 ) ( SURFACE-AT ?auto_30907 ?auto_30912 ) ( CLEAR ?auto_30907 ) ( LIFTING ?auto_30913 ?auto_30908 ) ( IS-CRATE ?auto_30908 ) ( ON ?auto_30906 ?auto_30905 ) ( ON ?auto_30907 ?auto_30906 ) ( not ( = ?auto_30905 ?auto_30906 ) ) ( not ( = ?auto_30905 ?auto_30907 ) ) ( not ( = ?auto_30905 ?auto_30908 ) ) ( not ( = ?auto_30905 ?auto_30909 ) ) ( not ( = ?auto_30905 ?auto_30915 ) ) ( not ( = ?auto_30906 ?auto_30907 ) ) ( not ( = ?auto_30906 ?auto_30908 ) ) ( not ( = ?auto_30906 ?auto_30909 ) ) ( not ( = ?auto_30906 ?auto_30915 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30907 ?auto_30908 ?auto_30909 )
      ( MAKE-4CRATE-VERIFY ?auto_30905 ?auto_30906 ?auto_30907 ?auto_30908 ?auto_30909 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30916 - SURFACE
      ?auto_30917 - SURFACE
      ?auto_30918 - SURFACE
      ?auto_30919 - SURFACE
      ?auto_30920 - SURFACE
      ?auto_30921 - SURFACE
    )
    :vars
    (
      ?auto_30925 - HOIST
      ?auto_30924 - PLACE
      ?auto_30926 - PLACE
      ?auto_30922 - HOIST
      ?auto_30927 - SURFACE
      ?auto_30923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30925 ?auto_30924 ) ( IS-CRATE ?auto_30921 ) ( not ( = ?auto_30920 ?auto_30921 ) ) ( not ( = ?auto_30919 ?auto_30920 ) ) ( not ( = ?auto_30919 ?auto_30921 ) ) ( not ( = ?auto_30926 ?auto_30924 ) ) ( HOIST-AT ?auto_30922 ?auto_30926 ) ( not ( = ?auto_30925 ?auto_30922 ) ) ( AVAILABLE ?auto_30922 ) ( SURFACE-AT ?auto_30921 ?auto_30926 ) ( ON ?auto_30921 ?auto_30927 ) ( CLEAR ?auto_30921 ) ( not ( = ?auto_30920 ?auto_30927 ) ) ( not ( = ?auto_30921 ?auto_30927 ) ) ( not ( = ?auto_30919 ?auto_30927 ) ) ( TRUCK-AT ?auto_30923 ?auto_30924 ) ( SURFACE-AT ?auto_30919 ?auto_30924 ) ( CLEAR ?auto_30919 ) ( LIFTING ?auto_30925 ?auto_30920 ) ( IS-CRATE ?auto_30920 ) ( ON ?auto_30917 ?auto_30916 ) ( ON ?auto_30918 ?auto_30917 ) ( ON ?auto_30919 ?auto_30918 ) ( not ( = ?auto_30916 ?auto_30917 ) ) ( not ( = ?auto_30916 ?auto_30918 ) ) ( not ( = ?auto_30916 ?auto_30919 ) ) ( not ( = ?auto_30916 ?auto_30920 ) ) ( not ( = ?auto_30916 ?auto_30921 ) ) ( not ( = ?auto_30916 ?auto_30927 ) ) ( not ( = ?auto_30917 ?auto_30918 ) ) ( not ( = ?auto_30917 ?auto_30919 ) ) ( not ( = ?auto_30917 ?auto_30920 ) ) ( not ( = ?auto_30917 ?auto_30921 ) ) ( not ( = ?auto_30917 ?auto_30927 ) ) ( not ( = ?auto_30918 ?auto_30919 ) ) ( not ( = ?auto_30918 ?auto_30920 ) ) ( not ( = ?auto_30918 ?auto_30921 ) ) ( not ( = ?auto_30918 ?auto_30927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30919 ?auto_30920 ?auto_30921 )
      ( MAKE-5CRATE-VERIFY ?auto_30916 ?auto_30917 ?auto_30918 ?auto_30919 ?auto_30920 ?auto_30921 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30928 - SURFACE
      ?auto_30929 - SURFACE
    )
    :vars
    (
      ?auto_30934 - HOIST
      ?auto_30933 - PLACE
      ?auto_30931 - SURFACE
      ?auto_30935 - PLACE
      ?auto_30930 - HOIST
      ?auto_30936 - SURFACE
      ?auto_30932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30934 ?auto_30933 ) ( IS-CRATE ?auto_30929 ) ( not ( = ?auto_30928 ?auto_30929 ) ) ( not ( = ?auto_30931 ?auto_30928 ) ) ( not ( = ?auto_30931 ?auto_30929 ) ) ( not ( = ?auto_30935 ?auto_30933 ) ) ( HOIST-AT ?auto_30930 ?auto_30935 ) ( not ( = ?auto_30934 ?auto_30930 ) ) ( AVAILABLE ?auto_30930 ) ( SURFACE-AT ?auto_30929 ?auto_30935 ) ( ON ?auto_30929 ?auto_30936 ) ( CLEAR ?auto_30929 ) ( not ( = ?auto_30928 ?auto_30936 ) ) ( not ( = ?auto_30929 ?auto_30936 ) ) ( not ( = ?auto_30931 ?auto_30936 ) ) ( TRUCK-AT ?auto_30932 ?auto_30933 ) ( SURFACE-AT ?auto_30931 ?auto_30933 ) ( CLEAR ?auto_30931 ) ( IS-CRATE ?auto_30928 ) ( AVAILABLE ?auto_30934 ) ( IN ?auto_30928 ?auto_30932 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30934 ?auto_30928 ?auto_30932 ?auto_30933 )
      ( MAKE-2CRATE ?auto_30931 ?auto_30928 ?auto_30929 )
      ( MAKE-1CRATE-VERIFY ?auto_30928 ?auto_30929 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30937 - SURFACE
      ?auto_30938 - SURFACE
      ?auto_30939 - SURFACE
    )
    :vars
    (
      ?auto_30944 - HOIST
      ?auto_30941 - PLACE
      ?auto_30942 - PLACE
      ?auto_30945 - HOIST
      ?auto_30940 - SURFACE
      ?auto_30943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30944 ?auto_30941 ) ( IS-CRATE ?auto_30939 ) ( not ( = ?auto_30938 ?auto_30939 ) ) ( not ( = ?auto_30937 ?auto_30938 ) ) ( not ( = ?auto_30937 ?auto_30939 ) ) ( not ( = ?auto_30942 ?auto_30941 ) ) ( HOIST-AT ?auto_30945 ?auto_30942 ) ( not ( = ?auto_30944 ?auto_30945 ) ) ( AVAILABLE ?auto_30945 ) ( SURFACE-AT ?auto_30939 ?auto_30942 ) ( ON ?auto_30939 ?auto_30940 ) ( CLEAR ?auto_30939 ) ( not ( = ?auto_30938 ?auto_30940 ) ) ( not ( = ?auto_30939 ?auto_30940 ) ) ( not ( = ?auto_30937 ?auto_30940 ) ) ( TRUCK-AT ?auto_30943 ?auto_30941 ) ( SURFACE-AT ?auto_30937 ?auto_30941 ) ( CLEAR ?auto_30937 ) ( IS-CRATE ?auto_30938 ) ( AVAILABLE ?auto_30944 ) ( IN ?auto_30938 ?auto_30943 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30938 ?auto_30939 )
      ( MAKE-2CRATE-VERIFY ?auto_30937 ?auto_30938 ?auto_30939 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30946 - SURFACE
      ?auto_30947 - SURFACE
      ?auto_30948 - SURFACE
      ?auto_30949 - SURFACE
    )
    :vars
    (
      ?auto_30953 - HOIST
      ?auto_30955 - PLACE
      ?auto_30950 - PLACE
      ?auto_30952 - HOIST
      ?auto_30951 - SURFACE
      ?auto_30954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30953 ?auto_30955 ) ( IS-CRATE ?auto_30949 ) ( not ( = ?auto_30948 ?auto_30949 ) ) ( not ( = ?auto_30947 ?auto_30948 ) ) ( not ( = ?auto_30947 ?auto_30949 ) ) ( not ( = ?auto_30950 ?auto_30955 ) ) ( HOIST-AT ?auto_30952 ?auto_30950 ) ( not ( = ?auto_30953 ?auto_30952 ) ) ( AVAILABLE ?auto_30952 ) ( SURFACE-AT ?auto_30949 ?auto_30950 ) ( ON ?auto_30949 ?auto_30951 ) ( CLEAR ?auto_30949 ) ( not ( = ?auto_30948 ?auto_30951 ) ) ( not ( = ?auto_30949 ?auto_30951 ) ) ( not ( = ?auto_30947 ?auto_30951 ) ) ( TRUCK-AT ?auto_30954 ?auto_30955 ) ( SURFACE-AT ?auto_30947 ?auto_30955 ) ( CLEAR ?auto_30947 ) ( IS-CRATE ?auto_30948 ) ( AVAILABLE ?auto_30953 ) ( IN ?auto_30948 ?auto_30954 ) ( ON ?auto_30947 ?auto_30946 ) ( not ( = ?auto_30946 ?auto_30947 ) ) ( not ( = ?auto_30946 ?auto_30948 ) ) ( not ( = ?auto_30946 ?auto_30949 ) ) ( not ( = ?auto_30946 ?auto_30951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30947 ?auto_30948 ?auto_30949 )
      ( MAKE-3CRATE-VERIFY ?auto_30946 ?auto_30947 ?auto_30948 ?auto_30949 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30956 - SURFACE
      ?auto_30957 - SURFACE
      ?auto_30958 - SURFACE
      ?auto_30959 - SURFACE
      ?auto_30960 - SURFACE
    )
    :vars
    (
      ?auto_30964 - HOIST
      ?auto_30966 - PLACE
      ?auto_30961 - PLACE
      ?auto_30963 - HOIST
      ?auto_30962 - SURFACE
      ?auto_30965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30964 ?auto_30966 ) ( IS-CRATE ?auto_30960 ) ( not ( = ?auto_30959 ?auto_30960 ) ) ( not ( = ?auto_30958 ?auto_30959 ) ) ( not ( = ?auto_30958 ?auto_30960 ) ) ( not ( = ?auto_30961 ?auto_30966 ) ) ( HOIST-AT ?auto_30963 ?auto_30961 ) ( not ( = ?auto_30964 ?auto_30963 ) ) ( AVAILABLE ?auto_30963 ) ( SURFACE-AT ?auto_30960 ?auto_30961 ) ( ON ?auto_30960 ?auto_30962 ) ( CLEAR ?auto_30960 ) ( not ( = ?auto_30959 ?auto_30962 ) ) ( not ( = ?auto_30960 ?auto_30962 ) ) ( not ( = ?auto_30958 ?auto_30962 ) ) ( TRUCK-AT ?auto_30965 ?auto_30966 ) ( SURFACE-AT ?auto_30958 ?auto_30966 ) ( CLEAR ?auto_30958 ) ( IS-CRATE ?auto_30959 ) ( AVAILABLE ?auto_30964 ) ( IN ?auto_30959 ?auto_30965 ) ( ON ?auto_30957 ?auto_30956 ) ( ON ?auto_30958 ?auto_30957 ) ( not ( = ?auto_30956 ?auto_30957 ) ) ( not ( = ?auto_30956 ?auto_30958 ) ) ( not ( = ?auto_30956 ?auto_30959 ) ) ( not ( = ?auto_30956 ?auto_30960 ) ) ( not ( = ?auto_30956 ?auto_30962 ) ) ( not ( = ?auto_30957 ?auto_30958 ) ) ( not ( = ?auto_30957 ?auto_30959 ) ) ( not ( = ?auto_30957 ?auto_30960 ) ) ( not ( = ?auto_30957 ?auto_30962 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30958 ?auto_30959 ?auto_30960 )
      ( MAKE-4CRATE-VERIFY ?auto_30956 ?auto_30957 ?auto_30958 ?auto_30959 ?auto_30960 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30967 - SURFACE
      ?auto_30968 - SURFACE
      ?auto_30969 - SURFACE
      ?auto_30970 - SURFACE
      ?auto_30971 - SURFACE
      ?auto_30972 - SURFACE
    )
    :vars
    (
      ?auto_30976 - HOIST
      ?auto_30978 - PLACE
      ?auto_30973 - PLACE
      ?auto_30975 - HOIST
      ?auto_30974 - SURFACE
      ?auto_30977 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30976 ?auto_30978 ) ( IS-CRATE ?auto_30972 ) ( not ( = ?auto_30971 ?auto_30972 ) ) ( not ( = ?auto_30970 ?auto_30971 ) ) ( not ( = ?auto_30970 ?auto_30972 ) ) ( not ( = ?auto_30973 ?auto_30978 ) ) ( HOIST-AT ?auto_30975 ?auto_30973 ) ( not ( = ?auto_30976 ?auto_30975 ) ) ( AVAILABLE ?auto_30975 ) ( SURFACE-AT ?auto_30972 ?auto_30973 ) ( ON ?auto_30972 ?auto_30974 ) ( CLEAR ?auto_30972 ) ( not ( = ?auto_30971 ?auto_30974 ) ) ( not ( = ?auto_30972 ?auto_30974 ) ) ( not ( = ?auto_30970 ?auto_30974 ) ) ( TRUCK-AT ?auto_30977 ?auto_30978 ) ( SURFACE-AT ?auto_30970 ?auto_30978 ) ( CLEAR ?auto_30970 ) ( IS-CRATE ?auto_30971 ) ( AVAILABLE ?auto_30976 ) ( IN ?auto_30971 ?auto_30977 ) ( ON ?auto_30968 ?auto_30967 ) ( ON ?auto_30969 ?auto_30968 ) ( ON ?auto_30970 ?auto_30969 ) ( not ( = ?auto_30967 ?auto_30968 ) ) ( not ( = ?auto_30967 ?auto_30969 ) ) ( not ( = ?auto_30967 ?auto_30970 ) ) ( not ( = ?auto_30967 ?auto_30971 ) ) ( not ( = ?auto_30967 ?auto_30972 ) ) ( not ( = ?auto_30967 ?auto_30974 ) ) ( not ( = ?auto_30968 ?auto_30969 ) ) ( not ( = ?auto_30968 ?auto_30970 ) ) ( not ( = ?auto_30968 ?auto_30971 ) ) ( not ( = ?auto_30968 ?auto_30972 ) ) ( not ( = ?auto_30968 ?auto_30974 ) ) ( not ( = ?auto_30969 ?auto_30970 ) ) ( not ( = ?auto_30969 ?auto_30971 ) ) ( not ( = ?auto_30969 ?auto_30972 ) ) ( not ( = ?auto_30969 ?auto_30974 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30970 ?auto_30971 ?auto_30972 )
      ( MAKE-5CRATE-VERIFY ?auto_30967 ?auto_30968 ?auto_30969 ?auto_30970 ?auto_30971 ?auto_30972 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30979 - SURFACE
      ?auto_30980 - SURFACE
    )
    :vars
    (
      ?auto_30985 - HOIST
      ?auto_30987 - PLACE
      ?auto_30982 - SURFACE
      ?auto_30981 - PLACE
      ?auto_30984 - HOIST
      ?auto_30983 - SURFACE
      ?auto_30986 - TRUCK
      ?auto_30988 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30985 ?auto_30987 ) ( IS-CRATE ?auto_30980 ) ( not ( = ?auto_30979 ?auto_30980 ) ) ( not ( = ?auto_30982 ?auto_30979 ) ) ( not ( = ?auto_30982 ?auto_30980 ) ) ( not ( = ?auto_30981 ?auto_30987 ) ) ( HOIST-AT ?auto_30984 ?auto_30981 ) ( not ( = ?auto_30985 ?auto_30984 ) ) ( AVAILABLE ?auto_30984 ) ( SURFACE-AT ?auto_30980 ?auto_30981 ) ( ON ?auto_30980 ?auto_30983 ) ( CLEAR ?auto_30980 ) ( not ( = ?auto_30979 ?auto_30983 ) ) ( not ( = ?auto_30980 ?auto_30983 ) ) ( not ( = ?auto_30982 ?auto_30983 ) ) ( SURFACE-AT ?auto_30982 ?auto_30987 ) ( CLEAR ?auto_30982 ) ( IS-CRATE ?auto_30979 ) ( AVAILABLE ?auto_30985 ) ( IN ?auto_30979 ?auto_30986 ) ( TRUCK-AT ?auto_30986 ?auto_30988 ) ( not ( = ?auto_30988 ?auto_30987 ) ) ( not ( = ?auto_30981 ?auto_30988 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30986 ?auto_30988 ?auto_30987 )
      ( MAKE-2CRATE ?auto_30982 ?auto_30979 ?auto_30980 )
      ( MAKE-1CRATE-VERIFY ?auto_30979 ?auto_30980 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30989 - SURFACE
      ?auto_30990 - SURFACE
      ?auto_30991 - SURFACE
    )
    :vars
    (
      ?auto_30994 - HOIST
      ?auto_30992 - PLACE
      ?auto_30996 - PLACE
      ?auto_30997 - HOIST
      ?auto_30995 - SURFACE
      ?auto_30998 - TRUCK
      ?auto_30993 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30994 ?auto_30992 ) ( IS-CRATE ?auto_30991 ) ( not ( = ?auto_30990 ?auto_30991 ) ) ( not ( = ?auto_30989 ?auto_30990 ) ) ( not ( = ?auto_30989 ?auto_30991 ) ) ( not ( = ?auto_30996 ?auto_30992 ) ) ( HOIST-AT ?auto_30997 ?auto_30996 ) ( not ( = ?auto_30994 ?auto_30997 ) ) ( AVAILABLE ?auto_30997 ) ( SURFACE-AT ?auto_30991 ?auto_30996 ) ( ON ?auto_30991 ?auto_30995 ) ( CLEAR ?auto_30991 ) ( not ( = ?auto_30990 ?auto_30995 ) ) ( not ( = ?auto_30991 ?auto_30995 ) ) ( not ( = ?auto_30989 ?auto_30995 ) ) ( SURFACE-AT ?auto_30989 ?auto_30992 ) ( CLEAR ?auto_30989 ) ( IS-CRATE ?auto_30990 ) ( AVAILABLE ?auto_30994 ) ( IN ?auto_30990 ?auto_30998 ) ( TRUCK-AT ?auto_30998 ?auto_30993 ) ( not ( = ?auto_30993 ?auto_30992 ) ) ( not ( = ?auto_30996 ?auto_30993 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30990 ?auto_30991 )
      ( MAKE-2CRATE-VERIFY ?auto_30989 ?auto_30990 ?auto_30991 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30999 - SURFACE
      ?auto_31000 - SURFACE
      ?auto_31001 - SURFACE
      ?auto_31002 - SURFACE
    )
    :vars
    (
      ?auto_31005 - HOIST
      ?auto_31006 - PLACE
      ?auto_31008 - PLACE
      ?auto_31007 - HOIST
      ?auto_31003 - SURFACE
      ?auto_31009 - TRUCK
      ?auto_31004 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31005 ?auto_31006 ) ( IS-CRATE ?auto_31002 ) ( not ( = ?auto_31001 ?auto_31002 ) ) ( not ( = ?auto_31000 ?auto_31001 ) ) ( not ( = ?auto_31000 ?auto_31002 ) ) ( not ( = ?auto_31008 ?auto_31006 ) ) ( HOIST-AT ?auto_31007 ?auto_31008 ) ( not ( = ?auto_31005 ?auto_31007 ) ) ( AVAILABLE ?auto_31007 ) ( SURFACE-AT ?auto_31002 ?auto_31008 ) ( ON ?auto_31002 ?auto_31003 ) ( CLEAR ?auto_31002 ) ( not ( = ?auto_31001 ?auto_31003 ) ) ( not ( = ?auto_31002 ?auto_31003 ) ) ( not ( = ?auto_31000 ?auto_31003 ) ) ( SURFACE-AT ?auto_31000 ?auto_31006 ) ( CLEAR ?auto_31000 ) ( IS-CRATE ?auto_31001 ) ( AVAILABLE ?auto_31005 ) ( IN ?auto_31001 ?auto_31009 ) ( TRUCK-AT ?auto_31009 ?auto_31004 ) ( not ( = ?auto_31004 ?auto_31006 ) ) ( not ( = ?auto_31008 ?auto_31004 ) ) ( ON ?auto_31000 ?auto_30999 ) ( not ( = ?auto_30999 ?auto_31000 ) ) ( not ( = ?auto_30999 ?auto_31001 ) ) ( not ( = ?auto_30999 ?auto_31002 ) ) ( not ( = ?auto_30999 ?auto_31003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31000 ?auto_31001 ?auto_31002 )
      ( MAKE-3CRATE-VERIFY ?auto_30999 ?auto_31000 ?auto_31001 ?auto_31002 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31010 - SURFACE
      ?auto_31011 - SURFACE
      ?auto_31012 - SURFACE
      ?auto_31013 - SURFACE
      ?auto_31014 - SURFACE
    )
    :vars
    (
      ?auto_31017 - HOIST
      ?auto_31018 - PLACE
      ?auto_31020 - PLACE
      ?auto_31019 - HOIST
      ?auto_31015 - SURFACE
      ?auto_31021 - TRUCK
      ?auto_31016 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31017 ?auto_31018 ) ( IS-CRATE ?auto_31014 ) ( not ( = ?auto_31013 ?auto_31014 ) ) ( not ( = ?auto_31012 ?auto_31013 ) ) ( not ( = ?auto_31012 ?auto_31014 ) ) ( not ( = ?auto_31020 ?auto_31018 ) ) ( HOIST-AT ?auto_31019 ?auto_31020 ) ( not ( = ?auto_31017 ?auto_31019 ) ) ( AVAILABLE ?auto_31019 ) ( SURFACE-AT ?auto_31014 ?auto_31020 ) ( ON ?auto_31014 ?auto_31015 ) ( CLEAR ?auto_31014 ) ( not ( = ?auto_31013 ?auto_31015 ) ) ( not ( = ?auto_31014 ?auto_31015 ) ) ( not ( = ?auto_31012 ?auto_31015 ) ) ( SURFACE-AT ?auto_31012 ?auto_31018 ) ( CLEAR ?auto_31012 ) ( IS-CRATE ?auto_31013 ) ( AVAILABLE ?auto_31017 ) ( IN ?auto_31013 ?auto_31021 ) ( TRUCK-AT ?auto_31021 ?auto_31016 ) ( not ( = ?auto_31016 ?auto_31018 ) ) ( not ( = ?auto_31020 ?auto_31016 ) ) ( ON ?auto_31011 ?auto_31010 ) ( ON ?auto_31012 ?auto_31011 ) ( not ( = ?auto_31010 ?auto_31011 ) ) ( not ( = ?auto_31010 ?auto_31012 ) ) ( not ( = ?auto_31010 ?auto_31013 ) ) ( not ( = ?auto_31010 ?auto_31014 ) ) ( not ( = ?auto_31010 ?auto_31015 ) ) ( not ( = ?auto_31011 ?auto_31012 ) ) ( not ( = ?auto_31011 ?auto_31013 ) ) ( not ( = ?auto_31011 ?auto_31014 ) ) ( not ( = ?auto_31011 ?auto_31015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31012 ?auto_31013 ?auto_31014 )
      ( MAKE-4CRATE-VERIFY ?auto_31010 ?auto_31011 ?auto_31012 ?auto_31013 ?auto_31014 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31022 - SURFACE
      ?auto_31023 - SURFACE
      ?auto_31024 - SURFACE
      ?auto_31025 - SURFACE
      ?auto_31026 - SURFACE
      ?auto_31027 - SURFACE
    )
    :vars
    (
      ?auto_31030 - HOIST
      ?auto_31031 - PLACE
      ?auto_31033 - PLACE
      ?auto_31032 - HOIST
      ?auto_31028 - SURFACE
      ?auto_31034 - TRUCK
      ?auto_31029 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31030 ?auto_31031 ) ( IS-CRATE ?auto_31027 ) ( not ( = ?auto_31026 ?auto_31027 ) ) ( not ( = ?auto_31025 ?auto_31026 ) ) ( not ( = ?auto_31025 ?auto_31027 ) ) ( not ( = ?auto_31033 ?auto_31031 ) ) ( HOIST-AT ?auto_31032 ?auto_31033 ) ( not ( = ?auto_31030 ?auto_31032 ) ) ( AVAILABLE ?auto_31032 ) ( SURFACE-AT ?auto_31027 ?auto_31033 ) ( ON ?auto_31027 ?auto_31028 ) ( CLEAR ?auto_31027 ) ( not ( = ?auto_31026 ?auto_31028 ) ) ( not ( = ?auto_31027 ?auto_31028 ) ) ( not ( = ?auto_31025 ?auto_31028 ) ) ( SURFACE-AT ?auto_31025 ?auto_31031 ) ( CLEAR ?auto_31025 ) ( IS-CRATE ?auto_31026 ) ( AVAILABLE ?auto_31030 ) ( IN ?auto_31026 ?auto_31034 ) ( TRUCK-AT ?auto_31034 ?auto_31029 ) ( not ( = ?auto_31029 ?auto_31031 ) ) ( not ( = ?auto_31033 ?auto_31029 ) ) ( ON ?auto_31023 ?auto_31022 ) ( ON ?auto_31024 ?auto_31023 ) ( ON ?auto_31025 ?auto_31024 ) ( not ( = ?auto_31022 ?auto_31023 ) ) ( not ( = ?auto_31022 ?auto_31024 ) ) ( not ( = ?auto_31022 ?auto_31025 ) ) ( not ( = ?auto_31022 ?auto_31026 ) ) ( not ( = ?auto_31022 ?auto_31027 ) ) ( not ( = ?auto_31022 ?auto_31028 ) ) ( not ( = ?auto_31023 ?auto_31024 ) ) ( not ( = ?auto_31023 ?auto_31025 ) ) ( not ( = ?auto_31023 ?auto_31026 ) ) ( not ( = ?auto_31023 ?auto_31027 ) ) ( not ( = ?auto_31023 ?auto_31028 ) ) ( not ( = ?auto_31024 ?auto_31025 ) ) ( not ( = ?auto_31024 ?auto_31026 ) ) ( not ( = ?auto_31024 ?auto_31027 ) ) ( not ( = ?auto_31024 ?auto_31028 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31025 ?auto_31026 ?auto_31027 )
      ( MAKE-5CRATE-VERIFY ?auto_31022 ?auto_31023 ?auto_31024 ?auto_31025 ?auto_31026 ?auto_31027 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31035 - SURFACE
      ?auto_31036 - SURFACE
    )
    :vars
    (
      ?auto_31039 - HOIST
      ?auto_31040 - PLACE
      ?auto_31041 - SURFACE
      ?auto_31043 - PLACE
      ?auto_31042 - HOIST
      ?auto_31037 - SURFACE
      ?auto_31044 - TRUCK
      ?auto_31038 - PLACE
      ?auto_31045 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31039 ?auto_31040 ) ( IS-CRATE ?auto_31036 ) ( not ( = ?auto_31035 ?auto_31036 ) ) ( not ( = ?auto_31041 ?auto_31035 ) ) ( not ( = ?auto_31041 ?auto_31036 ) ) ( not ( = ?auto_31043 ?auto_31040 ) ) ( HOIST-AT ?auto_31042 ?auto_31043 ) ( not ( = ?auto_31039 ?auto_31042 ) ) ( AVAILABLE ?auto_31042 ) ( SURFACE-AT ?auto_31036 ?auto_31043 ) ( ON ?auto_31036 ?auto_31037 ) ( CLEAR ?auto_31036 ) ( not ( = ?auto_31035 ?auto_31037 ) ) ( not ( = ?auto_31036 ?auto_31037 ) ) ( not ( = ?auto_31041 ?auto_31037 ) ) ( SURFACE-AT ?auto_31041 ?auto_31040 ) ( CLEAR ?auto_31041 ) ( IS-CRATE ?auto_31035 ) ( AVAILABLE ?auto_31039 ) ( TRUCK-AT ?auto_31044 ?auto_31038 ) ( not ( = ?auto_31038 ?auto_31040 ) ) ( not ( = ?auto_31043 ?auto_31038 ) ) ( HOIST-AT ?auto_31045 ?auto_31038 ) ( LIFTING ?auto_31045 ?auto_31035 ) ( not ( = ?auto_31039 ?auto_31045 ) ) ( not ( = ?auto_31042 ?auto_31045 ) ) )
    :subtasks
    ( ( !LOAD ?auto_31045 ?auto_31035 ?auto_31044 ?auto_31038 )
      ( MAKE-2CRATE ?auto_31041 ?auto_31035 ?auto_31036 )
      ( MAKE-1CRATE-VERIFY ?auto_31035 ?auto_31036 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31046 - SURFACE
      ?auto_31047 - SURFACE
      ?auto_31048 - SURFACE
    )
    :vars
    (
      ?auto_31054 - HOIST
      ?auto_31051 - PLACE
      ?auto_31052 - PLACE
      ?auto_31055 - HOIST
      ?auto_31056 - SURFACE
      ?auto_31050 - TRUCK
      ?auto_31049 - PLACE
      ?auto_31053 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31054 ?auto_31051 ) ( IS-CRATE ?auto_31048 ) ( not ( = ?auto_31047 ?auto_31048 ) ) ( not ( = ?auto_31046 ?auto_31047 ) ) ( not ( = ?auto_31046 ?auto_31048 ) ) ( not ( = ?auto_31052 ?auto_31051 ) ) ( HOIST-AT ?auto_31055 ?auto_31052 ) ( not ( = ?auto_31054 ?auto_31055 ) ) ( AVAILABLE ?auto_31055 ) ( SURFACE-AT ?auto_31048 ?auto_31052 ) ( ON ?auto_31048 ?auto_31056 ) ( CLEAR ?auto_31048 ) ( not ( = ?auto_31047 ?auto_31056 ) ) ( not ( = ?auto_31048 ?auto_31056 ) ) ( not ( = ?auto_31046 ?auto_31056 ) ) ( SURFACE-AT ?auto_31046 ?auto_31051 ) ( CLEAR ?auto_31046 ) ( IS-CRATE ?auto_31047 ) ( AVAILABLE ?auto_31054 ) ( TRUCK-AT ?auto_31050 ?auto_31049 ) ( not ( = ?auto_31049 ?auto_31051 ) ) ( not ( = ?auto_31052 ?auto_31049 ) ) ( HOIST-AT ?auto_31053 ?auto_31049 ) ( LIFTING ?auto_31053 ?auto_31047 ) ( not ( = ?auto_31054 ?auto_31053 ) ) ( not ( = ?auto_31055 ?auto_31053 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31047 ?auto_31048 )
      ( MAKE-2CRATE-VERIFY ?auto_31046 ?auto_31047 ?auto_31048 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31057 - SURFACE
      ?auto_31058 - SURFACE
      ?auto_31059 - SURFACE
      ?auto_31060 - SURFACE
    )
    :vars
    (
      ?auto_31063 - HOIST
      ?auto_31062 - PLACE
      ?auto_31068 - PLACE
      ?auto_31064 - HOIST
      ?auto_31065 - SURFACE
      ?auto_31067 - TRUCK
      ?auto_31066 - PLACE
      ?auto_31061 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31063 ?auto_31062 ) ( IS-CRATE ?auto_31060 ) ( not ( = ?auto_31059 ?auto_31060 ) ) ( not ( = ?auto_31058 ?auto_31059 ) ) ( not ( = ?auto_31058 ?auto_31060 ) ) ( not ( = ?auto_31068 ?auto_31062 ) ) ( HOIST-AT ?auto_31064 ?auto_31068 ) ( not ( = ?auto_31063 ?auto_31064 ) ) ( AVAILABLE ?auto_31064 ) ( SURFACE-AT ?auto_31060 ?auto_31068 ) ( ON ?auto_31060 ?auto_31065 ) ( CLEAR ?auto_31060 ) ( not ( = ?auto_31059 ?auto_31065 ) ) ( not ( = ?auto_31060 ?auto_31065 ) ) ( not ( = ?auto_31058 ?auto_31065 ) ) ( SURFACE-AT ?auto_31058 ?auto_31062 ) ( CLEAR ?auto_31058 ) ( IS-CRATE ?auto_31059 ) ( AVAILABLE ?auto_31063 ) ( TRUCK-AT ?auto_31067 ?auto_31066 ) ( not ( = ?auto_31066 ?auto_31062 ) ) ( not ( = ?auto_31068 ?auto_31066 ) ) ( HOIST-AT ?auto_31061 ?auto_31066 ) ( LIFTING ?auto_31061 ?auto_31059 ) ( not ( = ?auto_31063 ?auto_31061 ) ) ( not ( = ?auto_31064 ?auto_31061 ) ) ( ON ?auto_31058 ?auto_31057 ) ( not ( = ?auto_31057 ?auto_31058 ) ) ( not ( = ?auto_31057 ?auto_31059 ) ) ( not ( = ?auto_31057 ?auto_31060 ) ) ( not ( = ?auto_31057 ?auto_31065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31058 ?auto_31059 ?auto_31060 )
      ( MAKE-3CRATE-VERIFY ?auto_31057 ?auto_31058 ?auto_31059 ?auto_31060 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31069 - SURFACE
      ?auto_31070 - SURFACE
      ?auto_31071 - SURFACE
      ?auto_31072 - SURFACE
      ?auto_31073 - SURFACE
    )
    :vars
    (
      ?auto_31076 - HOIST
      ?auto_31075 - PLACE
      ?auto_31081 - PLACE
      ?auto_31077 - HOIST
      ?auto_31078 - SURFACE
      ?auto_31080 - TRUCK
      ?auto_31079 - PLACE
      ?auto_31074 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31076 ?auto_31075 ) ( IS-CRATE ?auto_31073 ) ( not ( = ?auto_31072 ?auto_31073 ) ) ( not ( = ?auto_31071 ?auto_31072 ) ) ( not ( = ?auto_31071 ?auto_31073 ) ) ( not ( = ?auto_31081 ?auto_31075 ) ) ( HOIST-AT ?auto_31077 ?auto_31081 ) ( not ( = ?auto_31076 ?auto_31077 ) ) ( AVAILABLE ?auto_31077 ) ( SURFACE-AT ?auto_31073 ?auto_31081 ) ( ON ?auto_31073 ?auto_31078 ) ( CLEAR ?auto_31073 ) ( not ( = ?auto_31072 ?auto_31078 ) ) ( not ( = ?auto_31073 ?auto_31078 ) ) ( not ( = ?auto_31071 ?auto_31078 ) ) ( SURFACE-AT ?auto_31071 ?auto_31075 ) ( CLEAR ?auto_31071 ) ( IS-CRATE ?auto_31072 ) ( AVAILABLE ?auto_31076 ) ( TRUCK-AT ?auto_31080 ?auto_31079 ) ( not ( = ?auto_31079 ?auto_31075 ) ) ( not ( = ?auto_31081 ?auto_31079 ) ) ( HOIST-AT ?auto_31074 ?auto_31079 ) ( LIFTING ?auto_31074 ?auto_31072 ) ( not ( = ?auto_31076 ?auto_31074 ) ) ( not ( = ?auto_31077 ?auto_31074 ) ) ( ON ?auto_31070 ?auto_31069 ) ( ON ?auto_31071 ?auto_31070 ) ( not ( = ?auto_31069 ?auto_31070 ) ) ( not ( = ?auto_31069 ?auto_31071 ) ) ( not ( = ?auto_31069 ?auto_31072 ) ) ( not ( = ?auto_31069 ?auto_31073 ) ) ( not ( = ?auto_31069 ?auto_31078 ) ) ( not ( = ?auto_31070 ?auto_31071 ) ) ( not ( = ?auto_31070 ?auto_31072 ) ) ( not ( = ?auto_31070 ?auto_31073 ) ) ( not ( = ?auto_31070 ?auto_31078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31071 ?auto_31072 ?auto_31073 )
      ( MAKE-4CRATE-VERIFY ?auto_31069 ?auto_31070 ?auto_31071 ?auto_31072 ?auto_31073 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31082 - SURFACE
      ?auto_31083 - SURFACE
      ?auto_31084 - SURFACE
      ?auto_31085 - SURFACE
      ?auto_31086 - SURFACE
      ?auto_31087 - SURFACE
    )
    :vars
    (
      ?auto_31090 - HOIST
      ?auto_31089 - PLACE
      ?auto_31095 - PLACE
      ?auto_31091 - HOIST
      ?auto_31092 - SURFACE
      ?auto_31094 - TRUCK
      ?auto_31093 - PLACE
      ?auto_31088 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31090 ?auto_31089 ) ( IS-CRATE ?auto_31087 ) ( not ( = ?auto_31086 ?auto_31087 ) ) ( not ( = ?auto_31085 ?auto_31086 ) ) ( not ( = ?auto_31085 ?auto_31087 ) ) ( not ( = ?auto_31095 ?auto_31089 ) ) ( HOIST-AT ?auto_31091 ?auto_31095 ) ( not ( = ?auto_31090 ?auto_31091 ) ) ( AVAILABLE ?auto_31091 ) ( SURFACE-AT ?auto_31087 ?auto_31095 ) ( ON ?auto_31087 ?auto_31092 ) ( CLEAR ?auto_31087 ) ( not ( = ?auto_31086 ?auto_31092 ) ) ( not ( = ?auto_31087 ?auto_31092 ) ) ( not ( = ?auto_31085 ?auto_31092 ) ) ( SURFACE-AT ?auto_31085 ?auto_31089 ) ( CLEAR ?auto_31085 ) ( IS-CRATE ?auto_31086 ) ( AVAILABLE ?auto_31090 ) ( TRUCK-AT ?auto_31094 ?auto_31093 ) ( not ( = ?auto_31093 ?auto_31089 ) ) ( not ( = ?auto_31095 ?auto_31093 ) ) ( HOIST-AT ?auto_31088 ?auto_31093 ) ( LIFTING ?auto_31088 ?auto_31086 ) ( not ( = ?auto_31090 ?auto_31088 ) ) ( not ( = ?auto_31091 ?auto_31088 ) ) ( ON ?auto_31083 ?auto_31082 ) ( ON ?auto_31084 ?auto_31083 ) ( ON ?auto_31085 ?auto_31084 ) ( not ( = ?auto_31082 ?auto_31083 ) ) ( not ( = ?auto_31082 ?auto_31084 ) ) ( not ( = ?auto_31082 ?auto_31085 ) ) ( not ( = ?auto_31082 ?auto_31086 ) ) ( not ( = ?auto_31082 ?auto_31087 ) ) ( not ( = ?auto_31082 ?auto_31092 ) ) ( not ( = ?auto_31083 ?auto_31084 ) ) ( not ( = ?auto_31083 ?auto_31085 ) ) ( not ( = ?auto_31083 ?auto_31086 ) ) ( not ( = ?auto_31083 ?auto_31087 ) ) ( not ( = ?auto_31083 ?auto_31092 ) ) ( not ( = ?auto_31084 ?auto_31085 ) ) ( not ( = ?auto_31084 ?auto_31086 ) ) ( not ( = ?auto_31084 ?auto_31087 ) ) ( not ( = ?auto_31084 ?auto_31092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31085 ?auto_31086 ?auto_31087 )
      ( MAKE-5CRATE-VERIFY ?auto_31082 ?auto_31083 ?auto_31084 ?auto_31085 ?auto_31086 ?auto_31087 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31096 - SURFACE
      ?auto_31097 - SURFACE
    )
    :vars
    (
      ?auto_31100 - HOIST
      ?auto_31099 - PLACE
      ?auto_31103 - SURFACE
      ?auto_31106 - PLACE
      ?auto_31101 - HOIST
      ?auto_31102 - SURFACE
      ?auto_31105 - TRUCK
      ?auto_31104 - PLACE
      ?auto_31098 - HOIST
      ?auto_31107 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31100 ?auto_31099 ) ( IS-CRATE ?auto_31097 ) ( not ( = ?auto_31096 ?auto_31097 ) ) ( not ( = ?auto_31103 ?auto_31096 ) ) ( not ( = ?auto_31103 ?auto_31097 ) ) ( not ( = ?auto_31106 ?auto_31099 ) ) ( HOIST-AT ?auto_31101 ?auto_31106 ) ( not ( = ?auto_31100 ?auto_31101 ) ) ( AVAILABLE ?auto_31101 ) ( SURFACE-AT ?auto_31097 ?auto_31106 ) ( ON ?auto_31097 ?auto_31102 ) ( CLEAR ?auto_31097 ) ( not ( = ?auto_31096 ?auto_31102 ) ) ( not ( = ?auto_31097 ?auto_31102 ) ) ( not ( = ?auto_31103 ?auto_31102 ) ) ( SURFACE-AT ?auto_31103 ?auto_31099 ) ( CLEAR ?auto_31103 ) ( IS-CRATE ?auto_31096 ) ( AVAILABLE ?auto_31100 ) ( TRUCK-AT ?auto_31105 ?auto_31104 ) ( not ( = ?auto_31104 ?auto_31099 ) ) ( not ( = ?auto_31106 ?auto_31104 ) ) ( HOIST-AT ?auto_31098 ?auto_31104 ) ( not ( = ?auto_31100 ?auto_31098 ) ) ( not ( = ?auto_31101 ?auto_31098 ) ) ( AVAILABLE ?auto_31098 ) ( SURFACE-AT ?auto_31096 ?auto_31104 ) ( ON ?auto_31096 ?auto_31107 ) ( CLEAR ?auto_31096 ) ( not ( = ?auto_31096 ?auto_31107 ) ) ( not ( = ?auto_31097 ?auto_31107 ) ) ( not ( = ?auto_31103 ?auto_31107 ) ) ( not ( = ?auto_31102 ?auto_31107 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31098 ?auto_31096 ?auto_31107 ?auto_31104 )
      ( MAKE-2CRATE ?auto_31103 ?auto_31096 ?auto_31097 )
      ( MAKE-1CRATE-VERIFY ?auto_31096 ?auto_31097 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31108 - SURFACE
      ?auto_31109 - SURFACE
      ?auto_31110 - SURFACE
    )
    :vars
    (
      ?auto_31112 - HOIST
      ?auto_31111 - PLACE
      ?auto_31117 - PLACE
      ?auto_31118 - HOIST
      ?auto_31113 - SURFACE
      ?auto_31119 - TRUCK
      ?auto_31114 - PLACE
      ?auto_31116 - HOIST
      ?auto_31115 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31112 ?auto_31111 ) ( IS-CRATE ?auto_31110 ) ( not ( = ?auto_31109 ?auto_31110 ) ) ( not ( = ?auto_31108 ?auto_31109 ) ) ( not ( = ?auto_31108 ?auto_31110 ) ) ( not ( = ?auto_31117 ?auto_31111 ) ) ( HOIST-AT ?auto_31118 ?auto_31117 ) ( not ( = ?auto_31112 ?auto_31118 ) ) ( AVAILABLE ?auto_31118 ) ( SURFACE-AT ?auto_31110 ?auto_31117 ) ( ON ?auto_31110 ?auto_31113 ) ( CLEAR ?auto_31110 ) ( not ( = ?auto_31109 ?auto_31113 ) ) ( not ( = ?auto_31110 ?auto_31113 ) ) ( not ( = ?auto_31108 ?auto_31113 ) ) ( SURFACE-AT ?auto_31108 ?auto_31111 ) ( CLEAR ?auto_31108 ) ( IS-CRATE ?auto_31109 ) ( AVAILABLE ?auto_31112 ) ( TRUCK-AT ?auto_31119 ?auto_31114 ) ( not ( = ?auto_31114 ?auto_31111 ) ) ( not ( = ?auto_31117 ?auto_31114 ) ) ( HOIST-AT ?auto_31116 ?auto_31114 ) ( not ( = ?auto_31112 ?auto_31116 ) ) ( not ( = ?auto_31118 ?auto_31116 ) ) ( AVAILABLE ?auto_31116 ) ( SURFACE-AT ?auto_31109 ?auto_31114 ) ( ON ?auto_31109 ?auto_31115 ) ( CLEAR ?auto_31109 ) ( not ( = ?auto_31109 ?auto_31115 ) ) ( not ( = ?auto_31110 ?auto_31115 ) ) ( not ( = ?auto_31108 ?auto_31115 ) ) ( not ( = ?auto_31113 ?auto_31115 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31109 ?auto_31110 )
      ( MAKE-2CRATE-VERIFY ?auto_31108 ?auto_31109 ?auto_31110 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31120 - SURFACE
      ?auto_31121 - SURFACE
      ?auto_31122 - SURFACE
      ?auto_31123 - SURFACE
    )
    :vars
    (
      ?auto_31124 - HOIST
      ?auto_31132 - PLACE
      ?auto_31131 - PLACE
      ?auto_31128 - HOIST
      ?auto_31125 - SURFACE
      ?auto_31126 - TRUCK
      ?auto_31130 - PLACE
      ?auto_31127 - HOIST
      ?auto_31129 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31124 ?auto_31132 ) ( IS-CRATE ?auto_31123 ) ( not ( = ?auto_31122 ?auto_31123 ) ) ( not ( = ?auto_31121 ?auto_31122 ) ) ( not ( = ?auto_31121 ?auto_31123 ) ) ( not ( = ?auto_31131 ?auto_31132 ) ) ( HOIST-AT ?auto_31128 ?auto_31131 ) ( not ( = ?auto_31124 ?auto_31128 ) ) ( AVAILABLE ?auto_31128 ) ( SURFACE-AT ?auto_31123 ?auto_31131 ) ( ON ?auto_31123 ?auto_31125 ) ( CLEAR ?auto_31123 ) ( not ( = ?auto_31122 ?auto_31125 ) ) ( not ( = ?auto_31123 ?auto_31125 ) ) ( not ( = ?auto_31121 ?auto_31125 ) ) ( SURFACE-AT ?auto_31121 ?auto_31132 ) ( CLEAR ?auto_31121 ) ( IS-CRATE ?auto_31122 ) ( AVAILABLE ?auto_31124 ) ( TRUCK-AT ?auto_31126 ?auto_31130 ) ( not ( = ?auto_31130 ?auto_31132 ) ) ( not ( = ?auto_31131 ?auto_31130 ) ) ( HOIST-AT ?auto_31127 ?auto_31130 ) ( not ( = ?auto_31124 ?auto_31127 ) ) ( not ( = ?auto_31128 ?auto_31127 ) ) ( AVAILABLE ?auto_31127 ) ( SURFACE-AT ?auto_31122 ?auto_31130 ) ( ON ?auto_31122 ?auto_31129 ) ( CLEAR ?auto_31122 ) ( not ( = ?auto_31122 ?auto_31129 ) ) ( not ( = ?auto_31123 ?auto_31129 ) ) ( not ( = ?auto_31121 ?auto_31129 ) ) ( not ( = ?auto_31125 ?auto_31129 ) ) ( ON ?auto_31121 ?auto_31120 ) ( not ( = ?auto_31120 ?auto_31121 ) ) ( not ( = ?auto_31120 ?auto_31122 ) ) ( not ( = ?auto_31120 ?auto_31123 ) ) ( not ( = ?auto_31120 ?auto_31125 ) ) ( not ( = ?auto_31120 ?auto_31129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31121 ?auto_31122 ?auto_31123 )
      ( MAKE-3CRATE-VERIFY ?auto_31120 ?auto_31121 ?auto_31122 ?auto_31123 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31133 - SURFACE
      ?auto_31134 - SURFACE
      ?auto_31135 - SURFACE
      ?auto_31136 - SURFACE
      ?auto_31137 - SURFACE
    )
    :vars
    (
      ?auto_31138 - HOIST
      ?auto_31146 - PLACE
      ?auto_31145 - PLACE
      ?auto_31142 - HOIST
      ?auto_31139 - SURFACE
      ?auto_31140 - TRUCK
      ?auto_31144 - PLACE
      ?auto_31141 - HOIST
      ?auto_31143 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31138 ?auto_31146 ) ( IS-CRATE ?auto_31137 ) ( not ( = ?auto_31136 ?auto_31137 ) ) ( not ( = ?auto_31135 ?auto_31136 ) ) ( not ( = ?auto_31135 ?auto_31137 ) ) ( not ( = ?auto_31145 ?auto_31146 ) ) ( HOIST-AT ?auto_31142 ?auto_31145 ) ( not ( = ?auto_31138 ?auto_31142 ) ) ( AVAILABLE ?auto_31142 ) ( SURFACE-AT ?auto_31137 ?auto_31145 ) ( ON ?auto_31137 ?auto_31139 ) ( CLEAR ?auto_31137 ) ( not ( = ?auto_31136 ?auto_31139 ) ) ( not ( = ?auto_31137 ?auto_31139 ) ) ( not ( = ?auto_31135 ?auto_31139 ) ) ( SURFACE-AT ?auto_31135 ?auto_31146 ) ( CLEAR ?auto_31135 ) ( IS-CRATE ?auto_31136 ) ( AVAILABLE ?auto_31138 ) ( TRUCK-AT ?auto_31140 ?auto_31144 ) ( not ( = ?auto_31144 ?auto_31146 ) ) ( not ( = ?auto_31145 ?auto_31144 ) ) ( HOIST-AT ?auto_31141 ?auto_31144 ) ( not ( = ?auto_31138 ?auto_31141 ) ) ( not ( = ?auto_31142 ?auto_31141 ) ) ( AVAILABLE ?auto_31141 ) ( SURFACE-AT ?auto_31136 ?auto_31144 ) ( ON ?auto_31136 ?auto_31143 ) ( CLEAR ?auto_31136 ) ( not ( = ?auto_31136 ?auto_31143 ) ) ( not ( = ?auto_31137 ?auto_31143 ) ) ( not ( = ?auto_31135 ?auto_31143 ) ) ( not ( = ?auto_31139 ?auto_31143 ) ) ( ON ?auto_31134 ?auto_31133 ) ( ON ?auto_31135 ?auto_31134 ) ( not ( = ?auto_31133 ?auto_31134 ) ) ( not ( = ?auto_31133 ?auto_31135 ) ) ( not ( = ?auto_31133 ?auto_31136 ) ) ( not ( = ?auto_31133 ?auto_31137 ) ) ( not ( = ?auto_31133 ?auto_31139 ) ) ( not ( = ?auto_31133 ?auto_31143 ) ) ( not ( = ?auto_31134 ?auto_31135 ) ) ( not ( = ?auto_31134 ?auto_31136 ) ) ( not ( = ?auto_31134 ?auto_31137 ) ) ( not ( = ?auto_31134 ?auto_31139 ) ) ( not ( = ?auto_31134 ?auto_31143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31135 ?auto_31136 ?auto_31137 )
      ( MAKE-4CRATE-VERIFY ?auto_31133 ?auto_31134 ?auto_31135 ?auto_31136 ?auto_31137 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31147 - SURFACE
      ?auto_31148 - SURFACE
      ?auto_31149 - SURFACE
      ?auto_31150 - SURFACE
      ?auto_31151 - SURFACE
      ?auto_31152 - SURFACE
    )
    :vars
    (
      ?auto_31153 - HOIST
      ?auto_31161 - PLACE
      ?auto_31160 - PLACE
      ?auto_31157 - HOIST
      ?auto_31154 - SURFACE
      ?auto_31155 - TRUCK
      ?auto_31159 - PLACE
      ?auto_31156 - HOIST
      ?auto_31158 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31153 ?auto_31161 ) ( IS-CRATE ?auto_31152 ) ( not ( = ?auto_31151 ?auto_31152 ) ) ( not ( = ?auto_31150 ?auto_31151 ) ) ( not ( = ?auto_31150 ?auto_31152 ) ) ( not ( = ?auto_31160 ?auto_31161 ) ) ( HOIST-AT ?auto_31157 ?auto_31160 ) ( not ( = ?auto_31153 ?auto_31157 ) ) ( AVAILABLE ?auto_31157 ) ( SURFACE-AT ?auto_31152 ?auto_31160 ) ( ON ?auto_31152 ?auto_31154 ) ( CLEAR ?auto_31152 ) ( not ( = ?auto_31151 ?auto_31154 ) ) ( not ( = ?auto_31152 ?auto_31154 ) ) ( not ( = ?auto_31150 ?auto_31154 ) ) ( SURFACE-AT ?auto_31150 ?auto_31161 ) ( CLEAR ?auto_31150 ) ( IS-CRATE ?auto_31151 ) ( AVAILABLE ?auto_31153 ) ( TRUCK-AT ?auto_31155 ?auto_31159 ) ( not ( = ?auto_31159 ?auto_31161 ) ) ( not ( = ?auto_31160 ?auto_31159 ) ) ( HOIST-AT ?auto_31156 ?auto_31159 ) ( not ( = ?auto_31153 ?auto_31156 ) ) ( not ( = ?auto_31157 ?auto_31156 ) ) ( AVAILABLE ?auto_31156 ) ( SURFACE-AT ?auto_31151 ?auto_31159 ) ( ON ?auto_31151 ?auto_31158 ) ( CLEAR ?auto_31151 ) ( not ( = ?auto_31151 ?auto_31158 ) ) ( not ( = ?auto_31152 ?auto_31158 ) ) ( not ( = ?auto_31150 ?auto_31158 ) ) ( not ( = ?auto_31154 ?auto_31158 ) ) ( ON ?auto_31148 ?auto_31147 ) ( ON ?auto_31149 ?auto_31148 ) ( ON ?auto_31150 ?auto_31149 ) ( not ( = ?auto_31147 ?auto_31148 ) ) ( not ( = ?auto_31147 ?auto_31149 ) ) ( not ( = ?auto_31147 ?auto_31150 ) ) ( not ( = ?auto_31147 ?auto_31151 ) ) ( not ( = ?auto_31147 ?auto_31152 ) ) ( not ( = ?auto_31147 ?auto_31154 ) ) ( not ( = ?auto_31147 ?auto_31158 ) ) ( not ( = ?auto_31148 ?auto_31149 ) ) ( not ( = ?auto_31148 ?auto_31150 ) ) ( not ( = ?auto_31148 ?auto_31151 ) ) ( not ( = ?auto_31148 ?auto_31152 ) ) ( not ( = ?auto_31148 ?auto_31154 ) ) ( not ( = ?auto_31148 ?auto_31158 ) ) ( not ( = ?auto_31149 ?auto_31150 ) ) ( not ( = ?auto_31149 ?auto_31151 ) ) ( not ( = ?auto_31149 ?auto_31152 ) ) ( not ( = ?auto_31149 ?auto_31154 ) ) ( not ( = ?auto_31149 ?auto_31158 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31150 ?auto_31151 ?auto_31152 )
      ( MAKE-5CRATE-VERIFY ?auto_31147 ?auto_31148 ?auto_31149 ?auto_31150 ?auto_31151 ?auto_31152 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31162 - SURFACE
      ?auto_31163 - SURFACE
    )
    :vars
    (
      ?auto_31164 - HOIST
      ?auto_31173 - PLACE
      ?auto_31170 - SURFACE
      ?auto_31172 - PLACE
      ?auto_31168 - HOIST
      ?auto_31165 - SURFACE
      ?auto_31171 - PLACE
      ?auto_31167 - HOIST
      ?auto_31169 - SURFACE
      ?auto_31166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31164 ?auto_31173 ) ( IS-CRATE ?auto_31163 ) ( not ( = ?auto_31162 ?auto_31163 ) ) ( not ( = ?auto_31170 ?auto_31162 ) ) ( not ( = ?auto_31170 ?auto_31163 ) ) ( not ( = ?auto_31172 ?auto_31173 ) ) ( HOIST-AT ?auto_31168 ?auto_31172 ) ( not ( = ?auto_31164 ?auto_31168 ) ) ( AVAILABLE ?auto_31168 ) ( SURFACE-AT ?auto_31163 ?auto_31172 ) ( ON ?auto_31163 ?auto_31165 ) ( CLEAR ?auto_31163 ) ( not ( = ?auto_31162 ?auto_31165 ) ) ( not ( = ?auto_31163 ?auto_31165 ) ) ( not ( = ?auto_31170 ?auto_31165 ) ) ( SURFACE-AT ?auto_31170 ?auto_31173 ) ( CLEAR ?auto_31170 ) ( IS-CRATE ?auto_31162 ) ( AVAILABLE ?auto_31164 ) ( not ( = ?auto_31171 ?auto_31173 ) ) ( not ( = ?auto_31172 ?auto_31171 ) ) ( HOIST-AT ?auto_31167 ?auto_31171 ) ( not ( = ?auto_31164 ?auto_31167 ) ) ( not ( = ?auto_31168 ?auto_31167 ) ) ( AVAILABLE ?auto_31167 ) ( SURFACE-AT ?auto_31162 ?auto_31171 ) ( ON ?auto_31162 ?auto_31169 ) ( CLEAR ?auto_31162 ) ( not ( = ?auto_31162 ?auto_31169 ) ) ( not ( = ?auto_31163 ?auto_31169 ) ) ( not ( = ?auto_31170 ?auto_31169 ) ) ( not ( = ?auto_31165 ?auto_31169 ) ) ( TRUCK-AT ?auto_31166 ?auto_31173 ) )
    :subtasks
    ( ( !DRIVE ?auto_31166 ?auto_31173 ?auto_31171 )
      ( MAKE-2CRATE ?auto_31170 ?auto_31162 ?auto_31163 )
      ( MAKE-1CRATE-VERIFY ?auto_31162 ?auto_31163 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31174 - SURFACE
      ?auto_31175 - SURFACE
      ?auto_31176 - SURFACE
    )
    :vars
    (
      ?auto_31180 - HOIST
      ?auto_31185 - PLACE
      ?auto_31178 - PLACE
      ?auto_31179 - HOIST
      ?auto_31181 - SURFACE
      ?auto_31182 - PLACE
      ?auto_31184 - HOIST
      ?auto_31183 - SURFACE
      ?auto_31177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31180 ?auto_31185 ) ( IS-CRATE ?auto_31176 ) ( not ( = ?auto_31175 ?auto_31176 ) ) ( not ( = ?auto_31174 ?auto_31175 ) ) ( not ( = ?auto_31174 ?auto_31176 ) ) ( not ( = ?auto_31178 ?auto_31185 ) ) ( HOIST-AT ?auto_31179 ?auto_31178 ) ( not ( = ?auto_31180 ?auto_31179 ) ) ( AVAILABLE ?auto_31179 ) ( SURFACE-AT ?auto_31176 ?auto_31178 ) ( ON ?auto_31176 ?auto_31181 ) ( CLEAR ?auto_31176 ) ( not ( = ?auto_31175 ?auto_31181 ) ) ( not ( = ?auto_31176 ?auto_31181 ) ) ( not ( = ?auto_31174 ?auto_31181 ) ) ( SURFACE-AT ?auto_31174 ?auto_31185 ) ( CLEAR ?auto_31174 ) ( IS-CRATE ?auto_31175 ) ( AVAILABLE ?auto_31180 ) ( not ( = ?auto_31182 ?auto_31185 ) ) ( not ( = ?auto_31178 ?auto_31182 ) ) ( HOIST-AT ?auto_31184 ?auto_31182 ) ( not ( = ?auto_31180 ?auto_31184 ) ) ( not ( = ?auto_31179 ?auto_31184 ) ) ( AVAILABLE ?auto_31184 ) ( SURFACE-AT ?auto_31175 ?auto_31182 ) ( ON ?auto_31175 ?auto_31183 ) ( CLEAR ?auto_31175 ) ( not ( = ?auto_31175 ?auto_31183 ) ) ( not ( = ?auto_31176 ?auto_31183 ) ) ( not ( = ?auto_31174 ?auto_31183 ) ) ( not ( = ?auto_31181 ?auto_31183 ) ) ( TRUCK-AT ?auto_31177 ?auto_31185 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31175 ?auto_31176 )
      ( MAKE-2CRATE-VERIFY ?auto_31174 ?auto_31175 ?auto_31176 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31186 - SURFACE
      ?auto_31187 - SURFACE
      ?auto_31188 - SURFACE
      ?auto_31189 - SURFACE
    )
    :vars
    (
      ?auto_31192 - HOIST
      ?auto_31196 - PLACE
      ?auto_31197 - PLACE
      ?auto_31194 - HOIST
      ?auto_31195 - SURFACE
      ?auto_31198 - PLACE
      ?auto_31191 - HOIST
      ?auto_31193 - SURFACE
      ?auto_31190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31192 ?auto_31196 ) ( IS-CRATE ?auto_31189 ) ( not ( = ?auto_31188 ?auto_31189 ) ) ( not ( = ?auto_31187 ?auto_31188 ) ) ( not ( = ?auto_31187 ?auto_31189 ) ) ( not ( = ?auto_31197 ?auto_31196 ) ) ( HOIST-AT ?auto_31194 ?auto_31197 ) ( not ( = ?auto_31192 ?auto_31194 ) ) ( AVAILABLE ?auto_31194 ) ( SURFACE-AT ?auto_31189 ?auto_31197 ) ( ON ?auto_31189 ?auto_31195 ) ( CLEAR ?auto_31189 ) ( not ( = ?auto_31188 ?auto_31195 ) ) ( not ( = ?auto_31189 ?auto_31195 ) ) ( not ( = ?auto_31187 ?auto_31195 ) ) ( SURFACE-AT ?auto_31187 ?auto_31196 ) ( CLEAR ?auto_31187 ) ( IS-CRATE ?auto_31188 ) ( AVAILABLE ?auto_31192 ) ( not ( = ?auto_31198 ?auto_31196 ) ) ( not ( = ?auto_31197 ?auto_31198 ) ) ( HOIST-AT ?auto_31191 ?auto_31198 ) ( not ( = ?auto_31192 ?auto_31191 ) ) ( not ( = ?auto_31194 ?auto_31191 ) ) ( AVAILABLE ?auto_31191 ) ( SURFACE-AT ?auto_31188 ?auto_31198 ) ( ON ?auto_31188 ?auto_31193 ) ( CLEAR ?auto_31188 ) ( not ( = ?auto_31188 ?auto_31193 ) ) ( not ( = ?auto_31189 ?auto_31193 ) ) ( not ( = ?auto_31187 ?auto_31193 ) ) ( not ( = ?auto_31195 ?auto_31193 ) ) ( TRUCK-AT ?auto_31190 ?auto_31196 ) ( ON ?auto_31187 ?auto_31186 ) ( not ( = ?auto_31186 ?auto_31187 ) ) ( not ( = ?auto_31186 ?auto_31188 ) ) ( not ( = ?auto_31186 ?auto_31189 ) ) ( not ( = ?auto_31186 ?auto_31195 ) ) ( not ( = ?auto_31186 ?auto_31193 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31187 ?auto_31188 ?auto_31189 )
      ( MAKE-3CRATE-VERIFY ?auto_31186 ?auto_31187 ?auto_31188 ?auto_31189 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31199 - SURFACE
      ?auto_31200 - SURFACE
      ?auto_31201 - SURFACE
      ?auto_31202 - SURFACE
      ?auto_31203 - SURFACE
    )
    :vars
    (
      ?auto_31206 - HOIST
      ?auto_31210 - PLACE
      ?auto_31211 - PLACE
      ?auto_31208 - HOIST
      ?auto_31209 - SURFACE
      ?auto_31212 - PLACE
      ?auto_31205 - HOIST
      ?auto_31207 - SURFACE
      ?auto_31204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31206 ?auto_31210 ) ( IS-CRATE ?auto_31203 ) ( not ( = ?auto_31202 ?auto_31203 ) ) ( not ( = ?auto_31201 ?auto_31202 ) ) ( not ( = ?auto_31201 ?auto_31203 ) ) ( not ( = ?auto_31211 ?auto_31210 ) ) ( HOIST-AT ?auto_31208 ?auto_31211 ) ( not ( = ?auto_31206 ?auto_31208 ) ) ( AVAILABLE ?auto_31208 ) ( SURFACE-AT ?auto_31203 ?auto_31211 ) ( ON ?auto_31203 ?auto_31209 ) ( CLEAR ?auto_31203 ) ( not ( = ?auto_31202 ?auto_31209 ) ) ( not ( = ?auto_31203 ?auto_31209 ) ) ( not ( = ?auto_31201 ?auto_31209 ) ) ( SURFACE-AT ?auto_31201 ?auto_31210 ) ( CLEAR ?auto_31201 ) ( IS-CRATE ?auto_31202 ) ( AVAILABLE ?auto_31206 ) ( not ( = ?auto_31212 ?auto_31210 ) ) ( not ( = ?auto_31211 ?auto_31212 ) ) ( HOIST-AT ?auto_31205 ?auto_31212 ) ( not ( = ?auto_31206 ?auto_31205 ) ) ( not ( = ?auto_31208 ?auto_31205 ) ) ( AVAILABLE ?auto_31205 ) ( SURFACE-AT ?auto_31202 ?auto_31212 ) ( ON ?auto_31202 ?auto_31207 ) ( CLEAR ?auto_31202 ) ( not ( = ?auto_31202 ?auto_31207 ) ) ( not ( = ?auto_31203 ?auto_31207 ) ) ( not ( = ?auto_31201 ?auto_31207 ) ) ( not ( = ?auto_31209 ?auto_31207 ) ) ( TRUCK-AT ?auto_31204 ?auto_31210 ) ( ON ?auto_31200 ?auto_31199 ) ( ON ?auto_31201 ?auto_31200 ) ( not ( = ?auto_31199 ?auto_31200 ) ) ( not ( = ?auto_31199 ?auto_31201 ) ) ( not ( = ?auto_31199 ?auto_31202 ) ) ( not ( = ?auto_31199 ?auto_31203 ) ) ( not ( = ?auto_31199 ?auto_31209 ) ) ( not ( = ?auto_31199 ?auto_31207 ) ) ( not ( = ?auto_31200 ?auto_31201 ) ) ( not ( = ?auto_31200 ?auto_31202 ) ) ( not ( = ?auto_31200 ?auto_31203 ) ) ( not ( = ?auto_31200 ?auto_31209 ) ) ( not ( = ?auto_31200 ?auto_31207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31201 ?auto_31202 ?auto_31203 )
      ( MAKE-4CRATE-VERIFY ?auto_31199 ?auto_31200 ?auto_31201 ?auto_31202 ?auto_31203 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31213 - SURFACE
      ?auto_31214 - SURFACE
      ?auto_31215 - SURFACE
      ?auto_31216 - SURFACE
      ?auto_31217 - SURFACE
      ?auto_31218 - SURFACE
    )
    :vars
    (
      ?auto_31221 - HOIST
      ?auto_31225 - PLACE
      ?auto_31226 - PLACE
      ?auto_31223 - HOIST
      ?auto_31224 - SURFACE
      ?auto_31227 - PLACE
      ?auto_31220 - HOIST
      ?auto_31222 - SURFACE
      ?auto_31219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31221 ?auto_31225 ) ( IS-CRATE ?auto_31218 ) ( not ( = ?auto_31217 ?auto_31218 ) ) ( not ( = ?auto_31216 ?auto_31217 ) ) ( not ( = ?auto_31216 ?auto_31218 ) ) ( not ( = ?auto_31226 ?auto_31225 ) ) ( HOIST-AT ?auto_31223 ?auto_31226 ) ( not ( = ?auto_31221 ?auto_31223 ) ) ( AVAILABLE ?auto_31223 ) ( SURFACE-AT ?auto_31218 ?auto_31226 ) ( ON ?auto_31218 ?auto_31224 ) ( CLEAR ?auto_31218 ) ( not ( = ?auto_31217 ?auto_31224 ) ) ( not ( = ?auto_31218 ?auto_31224 ) ) ( not ( = ?auto_31216 ?auto_31224 ) ) ( SURFACE-AT ?auto_31216 ?auto_31225 ) ( CLEAR ?auto_31216 ) ( IS-CRATE ?auto_31217 ) ( AVAILABLE ?auto_31221 ) ( not ( = ?auto_31227 ?auto_31225 ) ) ( not ( = ?auto_31226 ?auto_31227 ) ) ( HOIST-AT ?auto_31220 ?auto_31227 ) ( not ( = ?auto_31221 ?auto_31220 ) ) ( not ( = ?auto_31223 ?auto_31220 ) ) ( AVAILABLE ?auto_31220 ) ( SURFACE-AT ?auto_31217 ?auto_31227 ) ( ON ?auto_31217 ?auto_31222 ) ( CLEAR ?auto_31217 ) ( not ( = ?auto_31217 ?auto_31222 ) ) ( not ( = ?auto_31218 ?auto_31222 ) ) ( not ( = ?auto_31216 ?auto_31222 ) ) ( not ( = ?auto_31224 ?auto_31222 ) ) ( TRUCK-AT ?auto_31219 ?auto_31225 ) ( ON ?auto_31214 ?auto_31213 ) ( ON ?auto_31215 ?auto_31214 ) ( ON ?auto_31216 ?auto_31215 ) ( not ( = ?auto_31213 ?auto_31214 ) ) ( not ( = ?auto_31213 ?auto_31215 ) ) ( not ( = ?auto_31213 ?auto_31216 ) ) ( not ( = ?auto_31213 ?auto_31217 ) ) ( not ( = ?auto_31213 ?auto_31218 ) ) ( not ( = ?auto_31213 ?auto_31224 ) ) ( not ( = ?auto_31213 ?auto_31222 ) ) ( not ( = ?auto_31214 ?auto_31215 ) ) ( not ( = ?auto_31214 ?auto_31216 ) ) ( not ( = ?auto_31214 ?auto_31217 ) ) ( not ( = ?auto_31214 ?auto_31218 ) ) ( not ( = ?auto_31214 ?auto_31224 ) ) ( not ( = ?auto_31214 ?auto_31222 ) ) ( not ( = ?auto_31215 ?auto_31216 ) ) ( not ( = ?auto_31215 ?auto_31217 ) ) ( not ( = ?auto_31215 ?auto_31218 ) ) ( not ( = ?auto_31215 ?auto_31224 ) ) ( not ( = ?auto_31215 ?auto_31222 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31216 ?auto_31217 ?auto_31218 )
      ( MAKE-5CRATE-VERIFY ?auto_31213 ?auto_31214 ?auto_31215 ?auto_31216 ?auto_31217 ?auto_31218 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31228 - SURFACE
      ?auto_31229 - SURFACE
    )
    :vars
    (
      ?auto_31232 - HOIST
      ?auto_31236 - PLACE
      ?auto_31237 - SURFACE
      ?auto_31238 - PLACE
      ?auto_31234 - HOIST
      ?auto_31235 - SURFACE
      ?auto_31239 - PLACE
      ?auto_31231 - HOIST
      ?auto_31233 - SURFACE
      ?auto_31230 - TRUCK
      ?auto_31240 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31232 ?auto_31236 ) ( IS-CRATE ?auto_31229 ) ( not ( = ?auto_31228 ?auto_31229 ) ) ( not ( = ?auto_31237 ?auto_31228 ) ) ( not ( = ?auto_31237 ?auto_31229 ) ) ( not ( = ?auto_31238 ?auto_31236 ) ) ( HOIST-AT ?auto_31234 ?auto_31238 ) ( not ( = ?auto_31232 ?auto_31234 ) ) ( AVAILABLE ?auto_31234 ) ( SURFACE-AT ?auto_31229 ?auto_31238 ) ( ON ?auto_31229 ?auto_31235 ) ( CLEAR ?auto_31229 ) ( not ( = ?auto_31228 ?auto_31235 ) ) ( not ( = ?auto_31229 ?auto_31235 ) ) ( not ( = ?auto_31237 ?auto_31235 ) ) ( IS-CRATE ?auto_31228 ) ( not ( = ?auto_31239 ?auto_31236 ) ) ( not ( = ?auto_31238 ?auto_31239 ) ) ( HOIST-AT ?auto_31231 ?auto_31239 ) ( not ( = ?auto_31232 ?auto_31231 ) ) ( not ( = ?auto_31234 ?auto_31231 ) ) ( AVAILABLE ?auto_31231 ) ( SURFACE-AT ?auto_31228 ?auto_31239 ) ( ON ?auto_31228 ?auto_31233 ) ( CLEAR ?auto_31228 ) ( not ( = ?auto_31228 ?auto_31233 ) ) ( not ( = ?auto_31229 ?auto_31233 ) ) ( not ( = ?auto_31237 ?auto_31233 ) ) ( not ( = ?auto_31235 ?auto_31233 ) ) ( TRUCK-AT ?auto_31230 ?auto_31236 ) ( SURFACE-AT ?auto_31240 ?auto_31236 ) ( CLEAR ?auto_31240 ) ( LIFTING ?auto_31232 ?auto_31237 ) ( IS-CRATE ?auto_31237 ) ( not ( = ?auto_31240 ?auto_31237 ) ) ( not ( = ?auto_31228 ?auto_31240 ) ) ( not ( = ?auto_31229 ?auto_31240 ) ) ( not ( = ?auto_31235 ?auto_31240 ) ) ( not ( = ?auto_31233 ?auto_31240 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31240 ?auto_31237 )
      ( MAKE-2CRATE ?auto_31237 ?auto_31228 ?auto_31229 )
      ( MAKE-1CRATE-VERIFY ?auto_31228 ?auto_31229 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31241 - SURFACE
      ?auto_31242 - SURFACE
      ?auto_31243 - SURFACE
    )
    :vars
    (
      ?auto_31250 - HOIST
      ?auto_31245 - PLACE
      ?auto_31251 - PLACE
      ?auto_31247 - HOIST
      ?auto_31248 - SURFACE
      ?auto_31253 - PLACE
      ?auto_31252 - HOIST
      ?auto_31249 - SURFACE
      ?auto_31246 - TRUCK
      ?auto_31244 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31250 ?auto_31245 ) ( IS-CRATE ?auto_31243 ) ( not ( = ?auto_31242 ?auto_31243 ) ) ( not ( = ?auto_31241 ?auto_31242 ) ) ( not ( = ?auto_31241 ?auto_31243 ) ) ( not ( = ?auto_31251 ?auto_31245 ) ) ( HOIST-AT ?auto_31247 ?auto_31251 ) ( not ( = ?auto_31250 ?auto_31247 ) ) ( AVAILABLE ?auto_31247 ) ( SURFACE-AT ?auto_31243 ?auto_31251 ) ( ON ?auto_31243 ?auto_31248 ) ( CLEAR ?auto_31243 ) ( not ( = ?auto_31242 ?auto_31248 ) ) ( not ( = ?auto_31243 ?auto_31248 ) ) ( not ( = ?auto_31241 ?auto_31248 ) ) ( IS-CRATE ?auto_31242 ) ( not ( = ?auto_31253 ?auto_31245 ) ) ( not ( = ?auto_31251 ?auto_31253 ) ) ( HOIST-AT ?auto_31252 ?auto_31253 ) ( not ( = ?auto_31250 ?auto_31252 ) ) ( not ( = ?auto_31247 ?auto_31252 ) ) ( AVAILABLE ?auto_31252 ) ( SURFACE-AT ?auto_31242 ?auto_31253 ) ( ON ?auto_31242 ?auto_31249 ) ( CLEAR ?auto_31242 ) ( not ( = ?auto_31242 ?auto_31249 ) ) ( not ( = ?auto_31243 ?auto_31249 ) ) ( not ( = ?auto_31241 ?auto_31249 ) ) ( not ( = ?auto_31248 ?auto_31249 ) ) ( TRUCK-AT ?auto_31246 ?auto_31245 ) ( SURFACE-AT ?auto_31244 ?auto_31245 ) ( CLEAR ?auto_31244 ) ( LIFTING ?auto_31250 ?auto_31241 ) ( IS-CRATE ?auto_31241 ) ( not ( = ?auto_31244 ?auto_31241 ) ) ( not ( = ?auto_31242 ?auto_31244 ) ) ( not ( = ?auto_31243 ?auto_31244 ) ) ( not ( = ?auto_31248 ?auto_31244 ) ) ( not ( = ?auto_31249 ?auto_31244 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31242 ?auto_31243 )
      ( MAKE-2CRATE-VERIFY ?auto_31241 ?auto_31242 ?auto_31243 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31254 - SURFACE
      ?auto_31255 - SURFACE
      ?auto_31256 - SURFACE
      ?auto_31257 - SURFACE
    )
    :vars
    (
      ?auto_31258 - HOIST
      ?auto_31266 - PLACE
      ?auto_31264 - PLACE
      ?auto_31260 - HOIST
      ?auto_31259 - SURFACE
      ?auto_31261 - PLACE
      ?auto_31265 - HOIST
      ?auto_31263 - SURFACE
      ?auto_31262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31258 ?auto_31266 ) ( IS-CRATE ?auto_31257 ) ( not ( = ?auto_31256 ?auto_31257 ) ) ( not ( = ?auto_31255 ?auto_31256 ) ) ( not ( = ?auto_31255 ?auto_31257 ) ) ( not ( = ?auto_31264 ?auto_31266 ) ) ( HOIST-AT ?auto_31260 ?auto_31264 ) ( not ( = ?auto_31258 ?auto_31260 ) ) ( AVAILABLE ?auto_31260 ) ( SURFACE-AT ?auto_31257 ?auto_31264 ) ( ON ?auto_31257 ?auto_31259 ) ( CLEAR ?auto_31257 ) ( not ( = ?auto_31256 ?auto_31259 ) ) ( not ( = ?auto_31257 ?auto_31259 ) ) ( not ( = ?auto_31255 ?auto_31259 ) ) ( IS-CRATE ?auto_31256 ) ( not ( = ?auto_31261 ?auto_31266 ) ) ( not ( = ?auto_31264 ?auto_31261 ) ) ( HOIST-AT ?auto_31265 ?auto_31261 ) ( not ( = ?auto_31258 ?auto_31265 ) ) ( not ( = ?auto_31260 ?auto_31265 ) ) ( AVAILABLE ?auto_31265 ) ( SURFACE-AT ?auto_31256 ?auto_31261 ) ( ON ?auto_31256 ?auto_31263 ) ( CLEAR ?auto_31256 ) ( not ( = ?auto_31256 ?auto_31263 ) ) ( not ( = ?auto_31257 ?auto_31263 ) ) ( not ( = ?auto_31255 ?auto_31263 ) ) ( not ( = ?auto_31259 ?auto_31263 ) ) ( TRUCK-AT ?auto_31262 ?auto_31266 ) ( SURFACE-AT ?auto_31254 ?auto_31266 ) ( CLEAR ?auto_31254 ) ( LIFTING ?auto_31258 ?auto_31255 ) ( IS-CRATE ?auto_31255 ) ( not ( = ?auto_31254 ?auto_31255 ) ) ( not ( = ?auto_31256 ?auto_31254 ) ) ( not ( = ?auto_31257 ?auto_31254 ) ) ( not ( = ?auto_31259 ?auto_31254 ) ) ( not ( = ?auto_31263 ?auto_31254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31255 ?auto_31256 ?auto_31257 )
      ( MAKE-3CRATE-VERIFY ?auto_31254 ?auto_31255 ?auto_31256 ?auto_31257 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31267 - SURFACE
      ?auto_31268 - SURFACE
      ?auto_31269 - SURFACE
      ?auto_31270 - SURFACE
      ?auto_31271 - SURFACE
    )
    :vars
    (
      ?auto_31272 - HOIST
      ?auto_31280 - PLACE
      ?auto_31278 - PLACE
      ?auto_31274 - HOIST
      ?auto_31273 - SURFACE
      ?auto_31275 - PLACE
      ?auto_31279 - HOIST
      ?auto_31277 - SURFACE
      ?auto_31276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31272 ?auto_31280 ) ( IS-CRATE ?auto_31271 ) ( not ( = ?auto_31270 ?auto_31271 ) ) ( not ( = ?auto_31269 ?auto_31270 ) ) ( not ( = ?auto_31269 ?auto_31271 ) ) ( not ( = ?auto_31278 ?auto_31280 ) ) ( HOIST-AT ?auto_31274 ?auto_31278 ) ( not ( = ?auto_31272 ?auto_31274 ) ) ( AVAILABLE ?auto_31274 ) ( SURFACE-AT ?auto_31271 ?auto_31278 ) ( ON ?auto_31271 ?auto_31273 ) ( CLEAR ?auto_31271 ) ( not ( = ?auto_31270 ?auto_31273 ) ) ( not ( = ?auto_31271 ?auto_31273 ) ) ( not ( = ?auto_31269 ?auto_31273 ) ) ( IS-CRATE ?auto_31270 ) ( not ( = ?auto_31275 ?auto_31280 ) ) ( not ( = ?auto_31278 ?auto_31275 ) ) ( HOIST-AT ?auto_31279 ?auto_31275 ) ( not ( = ?auto_31272 ?auto_31279 ) ) ( not ( = ?auto_31274 ?auto_31279 ) ) ( AVAILABLE ?auto_31279 ) ( SURFACE-AT ?auto_31270 ?auto_31275 ) ( ON ?auto_31270 ?auto_31277 ) ( CLEAR ?auto_31270 ) ( not ( = ?auto_31270 ?auto_31277 ) ) ( not ( = ?auto_31271 ?auto_31277 ) ) ( not ( = ?auto_31269 ?auto_31277 ) ) ( not ( = ?auto_31273 ?auto_31277 ) ) ( TRUCK-AT ?auto_31276 ?auto_31280 ) ( SURFACE-AT ?auto_31268 ?auto_31280 ) ( CLEAR ?auto_31268 ) ( LIFTING ?auto_31272 ?auto_31269 ) ( IS-CRATE ?auto_31269 ) ( not ( = ?auto_31268 ?auto_31269 ) ) ( not ( = ?auto_31270 ?auto_31268 ) ) ( not ( = ?auto_31271 ?auto_31268 ) ) ( not ( = ?auto_31273 ?auto_31268 ) ) ( not ( = ?auto_31277 ?auto_31268 ) ) ( ON ?auto_31268 ?auto_31267 ) ( not ( = ?auto_31267 ?auto_31268 ) ) ( not ( = ?auto_31267 ?auto_31269 ) ) ( not ( = ?auto_31267 ?auto_31270 ) ) ( not ( = ?auto_31267 ?auto_31271 ) ) ( not ( = ?auto_31267 ?auto_31273 ) ) ( not ( = ?auto_31267 ?auto_31277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31269 ?auto_31270 ?auto_31271 )
      ( MAKE-4CRATE-VERIFY ?auto_31267 ?auto_31268 ?auto_31269 ?auto_31270 ?auto_31271 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31281 - SURFACE
      ?auto_31282 - SURFACE
      ?auto_31283 - SURFACE
      ?auto_31284 - SURFACE
      ?auto_31285 - SURFACE
      ?auto_31286 - SURFACE
    )
    :vars
    (
      ?auto_31287 - HOIST
      ?auto_31295 - PLACE
      ?auto_31293 - PLACE
      ?auto_31289 - HOIST
      ?auto_31288 - SURFACE
      ?auto_31290 - PLACE
      ?auto_31294 - HOIST
      ?auto_31292 - SURFACE
      ?auto_31291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31287 ?auto_31295 ) ( IS-CRATE ?auto_31286 ) ( not ( = ?auto_31285 ?auto_31286 ) ) ( not ( = ?auto_31284 ?auto_31285 ) ) ( not ( = ?auto_31284 ?auto_31286 ) ) ( not ( = ?auto_31293 ?auto_31295 ) ) ( HOIST-AT ?auto_31289 ?auto_31293 ) ( not ( = ?auto_31287 ?auto_31289 ) ) ( AVAILABLE ?auto_31289 ) ( SURFACE-AT ?auto_31286 ?auto_31293 ) ( ON ?auto_31286 ?auto_31288 ) ( CLEAR ?auto_31286 ) ( not ( = ?auto_31285 ?auto_31288 ) ) ( not ( = ?auto_31286 ?auto_31288 ) ) ( not ( = ?auto_31284 ?auto_31288 ) ) ( IS-CRATE ?auto_31285 ) ( not ( = ?auto_31290 ?auto_31295 ) ) ( not ( = ?auto_31293 ?auto_31290 ) ) ( HOIST-AT ?auto_31294 ?auto_31290 ) ( not ( = ?auto_31287 ?auto_31294 ) ) ( not ( = ?auto_31289 ?auto_31294 ) ) ( AVAILABLE ?auto_31294 ) ( SURFACE-AT ?auto_31285 ?auto_31290 ) ( ON ?auto_31285 ?auto_31292 ) ( CLEAR ?auto_31285 ) ( not ( = ?auto_31285 ?auto_31292 ) ) ( not ( = ?auto_31286 ?auto_31292 ) ) ( not ( = ?auto_31284 ?auto_31292 ) ) ( not ( = ?auto_31288 ?auto_31292 ) ) ( TRUCK-AT ?auto_31291 ?auto_31295 ) ( SURFACE-AT ?auto_31283 ?auto_31295 ) ( CLEAR ?auto_31283 ) ( LIFTING ?auto_31287 ?auto_31284 ) ( IS-CRATE ?auto_31284 ) ( not ( = ?auto_31283 ?auto_31284 ) ) ( not ( = ?auto_31285 ?auto_31283 ) ) ( not ( = ?auto_31286 ?auto_31283 ) ) ( not ( = ?auto_31288 ?auto_31283 ) ) ( not ( = ?auto_31292 ?auto_31283 ) ) ( ON ?auto_31282 ?auto_31281 ) ( ON ?auto_31283 ?auto_31282 ) ( not ( = ?auto_31281 ?auto_31282 ) ) ( not ( = ?auto_31281 ?auto_31283 ) ) ( not ( = ?auto_31281 ?auto_31284 ) ) ( not ( = ?auto_31281 ?auto_31285 ) ) ( not ( = ?auto_31281 ?auto_31286 ) ) ( not ( = ?auto_31281 ?auto_31288 ) ) ( not ( = ?auto_31281 ?auto_31292 ) ) ( not ( = ?auto_31282 ?auto_31283 ) ) ( not ( = ?auto_31282 ?auto_31284 ) ) ( not ( = ?auto_31282 ?auto_31285 ) ) ( not ( = ?auto_31282 ?auto_31286 ) ) ( not ( = ?auto_31282 ?auto_31288 ) ) ( not ( = ?auto_31282 ?auto_31292 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31284 ?auto_31285 ?auto_31286 )
      ( MAKE-5CRATE-VERIFY ?auto_31281 ?auto_31282 ?auto_31283 ?auto_31284 ?auto_31285 ?auto_31286 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31296 - SURFACE
      ?auto_31297 - SURFACE
    )
    :vars
    (
      ?auto_31298 - HOIST
      ?auto_31307 - PLACE
      ?auto_31308 - SURFACE
      ?auto_31305 - PLACE
      ?auto_31301 - HOIST
      ?auto_31299 - SURFACE
      ?auto_31302 - PLACE
      ?auto_31306 - HOIST
      ?auto_31304 - SURFACE
      ?auto_31303 - TRUCK
      ?auto_31300 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31298 ?auto_31307 ) ( IS-CRATE ?auto_31297 ) ( not ( = ?auto_31296 ?auto_31297 ) ) ( not ( = ?auto_31308 ?auto_31296 ) ) ( not ( = ?auto_31308 ?auto_31297 ) ) ( not ( = ?auto_31305 ?auto_31307 ) ) ( HOIST-AT ?auto_31301 ?auto_31305 ) ( not ( = ?auto_31298 ?auto_31301 ) ) ( AVAILABLE ?auto_31301 ) ( SURFACE-AT ?auto_31297 ?auto_31305 ) ( ON ?auto_31297 ?auto_31299 ) ( CLEAR ?auto_31297 ) ( not ( = ?auto_31296 ?auto_31299 ) ) ( not ( = ?auto_31297 ?auto_31299 ) ) ( not ( = ?auto_31308 ?auto_31299 ) ) ( IS-CRATE ?auto_31296 ) ( not ( = ?auto_31302 ?auto_31307 ) ) ( not ( = ?auto_31305 ?auto_31302 ) ) ( HOIST-AT ?auto_31306 ?auto_31302 ) ( not ( = ?auto_31298 ?auto_31306 ) ) ( not ( = ?auto_31301 ?auto_31306 ) ) ( AVAILABLE ?auto_31306 ) ( SURFACE-AT ?auto_31296 ?auto_31302 ) ( ON ?auto_31296 ?auto_31304 ) ( CLEAR ?auto_31296 ) ( not ( = ?auto_31296 ?auto_31304 ) ) ( not ( = ?auto_31297 ?auto_31304 ) ) ( not ( = ?auto_31308 ?auto_31304 ) ) ( not ( = ?auto_31299 ?auto_31304 ) ) ( TRUCK-AT ?auto_31303 ?auto_31307 ) ( SURFACE-AT ?auto_31300 ?auto_31307 ) ( CLEAR ?auto_31300 ) ( IS-CRATE ?auto_31308 ) ( not ( = ?auto_31300 ?auto_31308 ) ) ( not ( = ?auto_31296 ?auto_31300 ) ) ( not ( = ?auto_31297 ?auto_31300 ) ) ( not ( = ?auto_31299 ?auto_31300 ) ) ( not ( = ?auto_31304 ?auto_31300 ) ) ( AVAILABLE ?auto_31298 ) ( IN ?auto_31308 ?auto_31303 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31298 ?auto_31308 ?auto_31303 ?auto_31307 )
      ( MAKE-2CRATE ?auto_31308 ?auto_31296 ?auto_31297 )
      ( MAKE-1CRATE-VERIFY ?auto_31296 ?auto_31297 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31309 - SURFACE
      ?auto_31310 - SURFACE
      ?auto_31311 - SURFACE
    )
    :vars
    (
      ?auto_31320 - HOIST
      ?auto_31312 - PLACE
      ?auto_31313 - PLACE
      ?auto_31315 - HOIST
      ?auto_31318 - SURFACE
      ?auto_31319 - PLACE
      ?auto_31316 - HOIST
      ?auto_31317 - SURFACE
      ?auto_31314 - TRUCK
      ?auto_31321 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31320 ?auto_31312 ) ( IS-CRATE ?auto_31311 ) ( not ( = ?auto_31310 ?auto_31311 ) ) ( not ( = ?auto_31309 ?auto_31310 ) ) ( not ( = ?auto_31309 ?auto_31311 ) ) ( not ( = ?auto_31313 ?auto_31312 ) ) ( HOIST-AT ?auto_31315 ?auto_31313 ) ( not ( = ?auto_31320 ?auto_31315 ) ) ( AVAILABLE ?auto_31315 ) ( SURFACE-AT ?auto_31311 ?auto_31313 ) ( ON ?auto_31311 ?auto_31318 ) ( CLEAR ?auto_31311 ) ( not ( = ?auto_31310 ?auto_31318 ) ) ( not ( = ?auto_31311 ?auto_31318 ) ) ( not ( = ?auto_31309 ?auto_31318 ) ) ( IS-CRATE ?auto_31310 ) ( not ( = ?auto_31319 ?auto_31312 ) ) ( not ( = ?auto_31313 ?auto_31319 ) ) ( HOIST-AT ?auto_31316 ?auto_31319 ) ( not ( = ?auto_31320 ?auto_31316 ) ) ( not ( = ?auto_31315 ?auto_31316 ) ) ( AVAILABLE ?auto_31316 ) ( SURFACE-AT ?auto_31310 ?auto_31319 ) ( ON ?auto_31310 ?auto_31317 ) ( CLEAR ?auto_31310 ) ( not ( = ?auto_31310 ?auto_31317 ) ) ( not ( = ?auto_31311 ?auto_31317 ) ) ( not ( = ?auto_31309 ?auto_31317 ) ) ( not ( = ?auto_31318 ?auto_31317 ) ) ( TRUCK-AT ?auto_31314 ?auto_31312 ) ( SURFACE-AT ?auto_31321 ?auto_31312 ) ( CLEAR ?auto_31321 ) ( IS-CRATE ?auto_31309 ) ( not ( = ?auto_31321 ?auto_31309 ) ) ( not ( = ?auto_31310 ?auto_31321 ) ) ( not ( = ?auto_31311 ?auto_31321 ) ) ( not ( = ?auto_31318 ?auto_31321 ) ) ( not ( = ?auto_31317 ?auto_31321 ) ) ( AVAILABLE ?auto_31320 ) ( IN ?auto_31309 ?auto_31314 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31310 ?auto_31311 )
      ( MAKE-2CRATE-VERIFY ?auto_31309 ?auto_31310 ?auto_31311 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31322 - SURFACE
      ?auto_31323 - SURFACE
      ?auto_31324 - SURFACE
      ?auto_31325 - SURFACE
    )
    :vars
    (
      ?auto_31333 - HOIST
      ?auto_31330 - PLACE
      ?auto_31334 - PLACE
      ?auto_31326 - HOIST
      ?auto_31332 - SURFACE
      ?auto_31329 - PLACE
      ?auto_31327 - HOIST
      ?auto_31328 - SURFACE
      ?auto_31331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31333 ?auto_31330 ) ( IS-CRATE ?auto_31325 ) ( not ( = ?auto_31324 ?auto_31325 ) ) ( not ( = ?auto_31323 ?auto_31324 ) ) ( not ( = ?auto_31323 ?auto_31325 ) ) ( not ( = ?auto_31334 ?auto_31330 ) ) ( HOIST-AT ?auto_31326 ?auto_31334 ) ( not ( = ?auto_31333 ?auto_31326 ) ) ( AVAILABLE ?auto_31326 ) ( SURFACE-AT ?auto_31325 ?auto_31334 ) ( ON ?auto_31325 ?auto_31332 ) ( CLEAR ?auto_31325 ) ( not ( = ?auto_31324 ?auto_31332 ) ) ( not ( = ?auto_31325 ?auto_31332 ) ) ( not ( = ?auto_31323 ?auto_31332 ) ) ( IS-CRATE ?auto_31324 ) ( not ( = ?auto_31329 ?auto_31330 ) ) ( not ( = ?auto_31334 ?auto_31329 ) ) ( HOIST-AT ?auto_31327 ?auto_31329 ) ( not ( = ?auto_31333 ?auto_31327 ) ) ( not ( = ?auto_31326 ?auto_31327 ) ) ( AVAILABLE ?auto_31327 ) ( SURFACE-AT ?auto_31324 ?auto_31329 ) ( ON ?auto_31324 ?auto_31328 ) ( CLEAR ?auto_31324 ) ( not ( = ?auto_31324 ?auto_31328 ) ) ( not ( = ?auto_31325 ?auto_31328 ) ) ( not ( = ?auto_31323 ?auto_31328 ) ) ( not ( = ?auto_31332 ?auto_31328 ) ) ( TRUCK-AT ?auto_31331 ?auto_31330 ) ( SURFACE-AT ?auto_31322 ?auto_31330 ) ( CLEAR ?auto_31322 ) ( IS-CRATE ?auto_31323 ) ( not ( = ?auto_31322 ?auto_31323 ) ) ( not ( = ?auto_31324 ?auto_31322 ) ) ( not ( = ?auto_31325 ?auto_31322 ) ) ( not ( = ?auto_31332 ?auto_31322 ) ) ( not ( = ?auto_31328 ?auto_31322 ) ) ( AVAILABLE ?auto_31333 ) ( IN ?auto_31323 ?auto_31331 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31323 ?auto_31324 ?auto_31325 )
      ( MAKE-3CRATE-VERIFY ?auto_31322 ?auto_31323 ?auto_31324 ?auto_31325 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31335 - SURFACE
      ?auto_31336 - SURFACE
      ?auto_31337 - SURFACE
      ?auto_31338 - SURFACE
      ?auto_31339 - SURFACE
    )
    :vars
    (
      ?auto_31347 - HOIST
      ?auto_31344 - PLACE
      ?auto_31348 - PLACE
      ?auto_31340 - HOIST
      ?auto_31346 - SURFACE
      ?auto_31343 - PLACE
      ?auto_31341 - HOIST
      ?auto_31342 - SURFACE
      ?auto_31345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31347 ?auto_31344 ) ( IS-CRATE ?auto_31339 ) ( not ( = ?auto_31338 ?auto_31339 ) ) ( not ( = ?auto_31337 ?auto_31338 ) ) ( not ( = ?auto_31337 ?auto_31339 ) ) ( not ( = ?auto_31348 ?auto_31344 ) ) ( HOIST-AT ?auto_31340 ?auto_31348 ) ( not ( = ?auto_31347 ?auto_31340 ) ) ( AVAILABLE ?auto_31340 ) ( SURFACE-AT ?auto_31339 ?auto_31348 ) ( ON ?auto_31339 ?auto_31346 ) ( CLEAR ?auto_31339 ) ( not ( = ?auto_31338 ?auto_31346 ) ) ( not ( = ?auto_31339 ?auto_31346 ) ) ( not ( = ?auto_31337 ?auto_31346 ) ) ( IS-CRATE ?auto_31338 ) ( not ( = ?auto_31343 ?auto_31344 ) ) ( not ( = ?auto_31348 ?auto_31343 ) ) ( HOIST-AT ?auto_31341 ?auto_31343 ) ( not ( = ?auto_31347 ?auto_31341 ) ) ( not ( = ?auto_31340 ?auto_31341 ) ) ( AVAILABLE ?auto_31341 ) ( SURFACE-AT ?auto_31338 ?auto_31343 ) ( ON ?auto_31338 ?auto_31342 ) ( CLEAR ?auto_31338 ) ( not ( = ?auto_31338 ?auto_31342 ) ) ( not ( = ?auto_31339 ?auto_31342 ) ) ( not ( = ?auto_31337 ?auto_31342 ) ) ( not ( = ?auto_31346 ?auto_31342 ) ) ( TRUCK-AT ?auto_31345 ?auto_31344 ) ( SURFACE-AT ?auto_31336 ?auto_31344 ) ( CLEAR ?auto_31336 ) ( IS-CRATE ?auto_31337 ) ( not ( = ?auto_31336 ?auto_31337 ) ) ( not ( = ?auto_31338 ?auto_31336 ) ) ( not ( = ?auto_31339 ?auto_31336 ) ) ( not ( = ?auto_31346 ?auto_31336 ) ) ( not ( = ?auto_31342 ?auto_31336 ) ) ( AVAILABLE ?auto_31347 ) ( IN ?auto_31337 ?auto_31345 ) ( ON ?auto_31336 ?auto_31335 ) ( not ( = ?auto_31335 ?auto_31336 ) ) ( not ( = ?auto_31335 ?auto_31337 ) ) ( not ( = ?auto_31335 ?auto_31338 ) ) ( not ( = ?auto_31335 ?auto_31339 ) ) ( not ( = ?auto_31335 ?auto_31346 ) ) ( not ( = ?auto_31335 ?auto_31342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31337 ?auto_31338 ?auto_31339 )
      ( MAKE-4CRATE-VERIFY ?auto_31335 ?auto_31336 ?auto_31337 ?auto_31338 ?auto_31339 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31349 - SURFACE
      ?auto_31350 - SURFACE
      ?auto_31351 - SURFACE
      ?auto_31352 - SURFACE
      ?auto_31353 - SURFACE
      ?auto_31354 - SURFACE
    )
    :vars
    (
      ?auto_31362 - HOIST
      ?auto_31359 - PLACE
      ?auto_31363 - PLACE
      ?auto_31355 - HOIST
      ?auto_31361 - SURFACE
      ?auto_31358 - PLACE
      ?auto_31356 - HOIST
      ?auto_31357 - SURFACE
      ?auto_31360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31362 ?auto_31359 ) ( IS-CRATE ?auto_31354 ) ( not ( = ?auto_31353 ?auto_31354 ) ) ( not ( = ?auto_31352 ?auto_31353 ) ) ( not ( = ?auto_31352 ?auto_31354 ) ) ( not ( = ?auto_31363 ?auto_31359 ) ) ( HOIST-AT ?auto_31355 ?auto_31363 ) ( not ( = ?auto_31362 ?auto_31355 ) ) ( AVAILABLE ?auto_31355 ) ( SURFACE-AT ?auto_31354 ?auto_31363 ) ( ON ?auto_31354 ?auto_31361 ) ( CLEAR ?auto_31354 ) ( not ( = ?auto_31353 ?auto_31361 ) ) ( not ( = ?auto_31354 ?auto_31361 ) ) ( not ( = ?auto_31352 ?auto_31361 ) ) ( IS-CRATE ?auto_31353 ) ( not ( = ?auto_31358 ?auto_31359 ) ) ( not ( = ?auto_31363 ?auto_31358 ) ) ( HOIST-AT ?auto_31356 ?auto_31358 ) ( not ( = ?auto_31362 ?auto_31356 ) ) ( not ( = ?auto_31355 ?auto_31356 ) ) ( AVAILABLE ?auto_31356 ) ( SURFACE-AT ?auto_31353 ?auto_31358 ) ( ON ?auto_31353 ?auto_31357 ) ( CLEAR ?auto_31353 ) ( not ( = ?auto_31353 ?auto_31357 ) ) ( not ( = ?auto_31354 ?auto_31357 ) ) ( not ( = ?auto_31352 ?auto_31357 ) ) ( not ( = ?auto_31361 ?auto_31357 ) ) ( TRUCK-AT ?auto_31360 ?auto_31359 ) ( SURFACE-AT ?auto_31351 ?auto_31359 ) ( CLEAR ?auto_31351 ) ( IS-CRATE ?auto_31352 ) ( not ( = ?auto_31351 ?auto_31352 ) ) ( not ( = ?auto_31353 ?auto_31351 ) ) ( not ( = ?auto_31354 ?auto_31351 ) ) ( not ( = ?auto_31361 ?auto_31351 ) ) ( not ( = ?auto_31357 ?auto_31351 ) ) ( AVAILABLE ?auto_31362 ) ( IN ?auto_31352 ?auto_31360 ) ( ON ?auto_31350 ?auto_31349 ) ( ON ?auto_31351 ?auto_31350 ) ( not ( = ?auto_31349 ?auto_31350 ) ) ( not ( = ?auto_31349 ?auto_31351 ) ) ( not ( = ?auto_31349 ?auto_31352 ) ) ( not ( = ?auto_31349 ?auto_31353 ) ) ( not ( = ?auto_31349 ?auto_31354 ) ) ( not ( = ?auto_31349 ?auto_31361 ) ) ( not ( = ?auto_31349 ?auto_31357 ) ) ( not ( = ?auto_31350 ?auto_31351 ) ) ( not ( = ?auto_31350 ?auto_31352 ) ) ( not ( = ?auto_31350 ?auto_31353 ) ) ( not ( = ?auto_31350 ?auto_31354 ) ) ( not ( = ?auto_31350 ?auto_31361 ) ) ( not ( = ?auto_31350 ?auto_31357 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31352 ?auto_31353 ?auto_31354 )
      ( MAKE-5CRATE-VERIFY ?auto_31349 ?auto_31350 ?auto_31351 ?auto_31352 ?auto_31353 ?auto_31354 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31364 - SURFACE
      ?auto_31365 - SURFACE
    )
    :vars
    (
      ?auto_31375 - HOIST
      ?auto_31371 - PLACE
      ?auto_31367 - SURFACE
      ?auto_31376 - PLACE
      ?auto_31366 - HOIST
      ?auto_31374 - SURFACE
      ?auto_31370 - PLACE
      ?auto_31368 - HOIST
      ?auto_31369 - SURFACE
      ?auto_31372 - SURFACE
      ?auto_31373 - TRUCK
      ?auto_31377 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31375 ?auto_31371 ) ( IS-CRATE ?auto_31365 ) ( not ( = ?auto_31364 ?auto_31365 ) ) ( not ( = ?auto_31367 ?auto_31364 ) ) ( not ( = ?auto_31367 ?auto_31365 ) ) ( not ( = ?auto_31376 ?auto_31371 ) ) ( HOIST-AT ?auto_31366 ?auto_31376 ) ( not ( = ?auto_31375 ?auto_31366 ) ) ( AVAILABLE ?auto_31366 ) ( SURFACE-AT ?auto_31365 ?auto_31376 ) ( ON ?auto_31365 ?auto_31374 ) ( CLEAR ?auto_31365 ) ( not ( = ?auto_31364 ?auto_31374 ) ) ( not ( = ?auto_31365 ?auto_31374 ) ) ( not ( = ?auto_31367 ?auto_31374 ) ) ( IS-CRATE ?auto_31364 ) ( not ( = ?auto_31370 ?auto_31371 ) ) ( not ( = ?auto_31376 ?auto_31370 ) ) ( HOIST-AT ?auto_31368 ?auto_31370 ) ( not ( = ?auto_31375 ?auto_31368 ) ) ( not ( = ?auto_31366 ?auto_31368 ) ) ( AVAILABLE ?auto_31368 ) ( SURFACE-AT ?auto_31364 ?auto_31370 ) ( ON ?auto_31364 ?auto_31369 ) ( CLEAR ?auto_31364 ) ( not ( = ?auto_31364 ?auto_31369 ) ) ( not ( = ?auto_31365 ?auto_31369 ) ) ( not ( = ?auto_31367 ?auto_31369 ) ) ( not ( = ?auto_31374 ?auto_31369 ) ) ( SURFACE-AT ?auto_31372 ?auto_31371 ) ( CLEAR ?auto_31372 ) ( IS-CRATE ?auto_31367 ) ( not ( = ?auto_31372 ?auto_31367 ) ) ( not ( = ?auto_31364 ?auto_31372 ) ) ( not ( = ?auto_31365 ?auto_31372 ) ) ( not ( = ?auto_31374 ?auto_31372 ) ) ( not ( = ?auto_31369 ?auto_31372 ) ) ( AVAILABLE ?auto_31375 ) ( IN ?auto_31367 ?auto_31373 ) ( TRUCK-AT ?auto_31373 ?auto_31377 ) ( not ( = ?auto_31377 ?auto_31371 ) ) ( not ( = ?auto_31376 ?auto_31377 ) ) ( not ( = ?auto_31370 ?auto_31377 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_31373 ?auto_31377 ?auto_31371 )
      ( MAKE-2CRATE ?auto_31367 ?auto_31364 ?auto_31365 )
      ( MAKE-1CRATE-VERIFY ?auto_31364 ?auto_31365 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31378 - SURFACE
      ?auto_31379 - SURFACE
      ?auto_31380 - SURFACE
    )
    :vars
    (
      ?auto_31390 - HOIST
      ?auto_31385 - PLACE
      ?auto_31389 - PLACE
      ?auto_31381 - HOIST
      ?auto_31383 - SURFACE
      ?auto_31386 - PLACE
      ?auto_31388 - HOIST
      ?auto_31391 - SURFACE
      ?auto_31387 - SURFACE
      ?auto_31384 - TRUCK
      ?auto_31382 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31390 ?auto_31385 ) ( IS-CRATE ?auto_31380 ) ( not ( = ?auto_31379 ?auto_31380 ) ) ( not ( = ?auto_31378 ?auto_31379 ) ) ( not ( = ?auto_31378 ?auto_31380 ) ) ( not ( = ?auto_31389 ?auto_31385 ) ) ( HOIST-AT ?auto_31381 ?auto_31389 ) ( not ( = ?auto_31390 ?auto_31381 ) ) ( AVAILABLE ?auto_31381 ) ( SURFACE-AT ?auto_31380 ?auto_31389 ) ( ON ?auto_31380 ?auto_31383 ) ( CLEAR ?auto_31380 ) ( not ( = ?auto_31379 ?auto_31383 ) ) ( not ( = ?auto_31380 ?auto_31383 ) ) ( not ( = ?auto_31378 ?auto_31383 ) ) ( IS-CRATE ?auto_31379 ) ( not ( = ?auto_31386 ?auto_31385 ) ) ( not ( = ?auto_31389 ?auto_31386 ) ) ( HOIST-AT ?auto_31388 ?auto_31386 ) ( not ( = ?auto_31390 ?auto_31388 ) ) ( not ( = ?auto_31381 ?auto_31388 ) ) ( AVAILABLE ?auto_31388 ) ( SURFACE-AT ?auto_31379 ?auto_31386 ) ( ON ?auto_31379 ?auto_31391 ) ( CLEAR ?auto_31379 ) ( not ( = ?auto_31379 ?auto_31391 ) ) ( not ( = ?auto_31380 ?auto_31391 ) ) ( not ( = ?auto_31378 ?auto_31391 ) ) ( not ( = ?auto_31383 ?auto_31391 ) ) ( SURFACE-AT ?auto_31387 ?auto_31385 ) ( CLEAR ?auto_31387 ) ( IS-CRATE ?auto_31378 ) ( not ( = ?auto_31387 ?auto_31378 ) ) ( not ( = ?auto_31379 ?auto_31387 ) ) ( not ( = ?auto_31380 ?auto_31387 ) ) ( not ( = ?auto_31383 ?auto_31387 ) ) ( not ( = ?auto_31391 ?auto_31387 ) ) ( AVAILABLE ?auto_31390 ) ( IN ?auto_31378 ?auto_31384 ) ( TRUCK-AT ?auto_31384 ?auto_31382 ) ( not ( = ?auto_31382 ?auto_31385 ) ) ( not ( = ?auto_31389 ?auto_31382 ) ) ( not ( = ?auto_31386 ?auto_31382 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31379 ?auto_31380 )
      ( MAKE-2CRATE-VERIFY ?auto_31378 ?auto_31379 ?auto_31380 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31392 - SURFACE
      ?auto_31393 - SURFACE
      ?auto_31394 - SURFACE
      ?auto_31395 - SURFACE
    )
    :vars
    (
      ?auto_31400 - HOIST
      ?auto_31404 - PLACE
      ?auto_31403 - PLACE
      ?auto_31397 - HOIST
      ?auto_31405 - SURFACE
      ?auto_31399 - PLACE
      ?auto_31398 - HOIST
      ?auto_31402 - SURFACE
      ?auto_31401 - TRUCK
      ?auto_31396 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31400 ?auto_31404 ) ( IS-CRATE ?auto_31395 ) ( not ( = ?auto_31394 ?auto_31395 ) ) ( not ( = ?auto_31393 ?auto_31394 ) ) ( not ( = ?auto_31393 ?auto_31395 ) ) ( not ( = ?auto_31403 ?auto_31404 ) ) ( HOIST-AT ?auto_31397 ?auto_31403 ) ( not ( = ?auto_31400 ?auto_31397 ) ) ( AVAILABLE ?auto_31397 ) ( SURFACE-AT ?auto_31395 ?auto_31403 ) ( ON ?auto_31395 ?auto_31405 ) ( CLEAR ?auto_31395 ) ( not ( = ?auto_31394 ?auto_31405 ) ) ( not ( = ?auto_31395 ?auto_31405 ) ) ( not ( = ?auto_31393 ?auto_31405 ) ) ( IS-CRATE ?auto_31394 ) ( not ( = ?auto_31399 ?auto_31404 ) ) ( not ( = ?auto_31403 ?auto_31399 ) ) ( HOIST-AT ?auto_31398 ?auto_31399 ) ( not ( = ?auto_31400 ?auto_31398 ) ) ( not ( = ?auto_31397 ?auto_31398 ) ) ( AVAILABLE ?auto_31398 ) ( SURFACE-AT ?auto_31394 ?auto_31399 ) ( ON ?auto_31394 ?auto_31402 ) ( CLEAR ?auto_31394 ) ( not ( = ?auto_31394 ?auto_31402 ) ) ( not ( = ?auto_31395 ?auto_31402 ) ) ( not ( = ?auto_31393 ?auto_31402 ) ) ( not ( = ?auto_31405 ?auto_31402 ) ) ( SURFACE-AT ?auto_31392 ?auto_31404 ) ( CLEAR ?auto_31392 ) ( IS-CRATE ?auto_31393 ) ( not ( = ?auto_31392 ?auto_31393 ) ) ( not ( = ?auto_31394 ?auto_31392 ) ) ( not ( = ?auto_31395 ?auto_31392 ) ) ( not ( = ?auto_31405 ?auto_31392 ) ) ( not ( = ?auto_31402 ?auto_31392 ) ) ( AVAILABLE ?auto_31400 ) ( IN ?auto_31393 ?auto_31401 ) ( TRUCK-AT ?auto_31401 ?auto_31396 ) ( not ( = ?auto_31396 ?auto_31404 ) ) ( not ( = ?auto_31403 ?auto_31396 ) ) ( not ( = ?auto_31399 ?auto_31396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31393 ?auto_31394 ?auto_31395 )
      ( MAKE-3CRATE-VERIFY ?auto_31392 ?auto_31393 ?auto_31394 ?auto_31395 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31406 - SURFACE
      ?auto_31407 - SURFACE
      ?auto_31408 - SURFACE
      ?auto_31409 - SURFACE
      ?auto_31410 - SURFACE
    )
    :vars
    (
      ?auto_31415 - HOIST
      ?auto_31419 - PLACE
      ?auto_31418 - PLACE
      ?auto_31412 - HOIST
      ?auto_31420 - SURFACE
      ?auto_31414 - PLACE
      ?auto_31413 - HOIST
      ?auto_31417 - SURFACE
      ?auto_31416 - TRUCK
      ?auto_31411 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31415 ?auto_31419 ) ( IS-CRATE ?auto_31410 ) ( not ( = ?auto_31409 ?auto_31410 ) ) ( not ( = ?auto_31408 ?auto_31409 ) ) ( not ( = ?auto_31408 ?auto_31410 ) ) ( not ( = ?auto_31418 ?auto_31419 ) ) ( HOIST-AT ?auto_31412 ?auto_31418 ) ( not ( = ?auto_31415 ?auto_31412 ) ) ( AVAILABLE ?auto_31412 ) ( SURFACE-AT ?auto_31410 ?auto_31418 ) ( ON ?auto_31410 ?auto_31420 ) ( CLEAR ?auto_31410 ) ( not ( = ?auto_31409 ?auto_31420 ) ) ( not ( = ?auto_31410 ?auto_31420 ) ) ( not ( = ?auto_31408 ?auto_31420 ) ) ( IS-CRATE ?auto_31409 ) ( not ( = ?auto_31414 ?auto_31419 ) ) ( not ( = ?auto_31418 ?auto_31414 ) ) ( HOIST-AT ?auto_31413 ?auto_31414 ) ( not ( = ?auto_31415 ?auto_31413 ) ) ( not ( = ?auto_31412 ?auto_31413 ) ) ( AVAILABLE ?auto_31413 ) ( SURFACE-AT ?auto_31409 ?auto_31414 ) ( ON ?auto_31409 ?auto_31417 ) ( CLEAR ?auto_31409 ) ( not ( = ?auto_31409 ?auto_31417 ) ) ( not ( = ?auto_31410 ?auto_31417 ) ) ( not ( = ?auto_31408 ?auto_31417 ) ) ( not ( = ?auto_31420 ?auto_31417 ) ) ( SURFACE-AT ?auto_31407 ?auto_31419 ) ( CLEAR ?auto_31407 ) ( IS-CRATE ?auto_31408 ) ( not ( = ?auto_31407 ?auto_31408 ) ) ( not ( = ?auto_31409 ?auto_31407 ) ) ( not ( = ?auto_31410 ?auto_31407 ) ) ( not ( = ?auto_31420 ?auto_31407 ) ) ( not ( = ?auto_31417 ?auto_31407 ) ) ( AVAILABLE ?auto_31415 ) ( IN ?auto_31408 ?auto_31416 ) ( TRUCK-AT ?auto_31416 ?auto_31411 ) ( not ( = ?auto_31411 ?auto_31419 ) ) ( not ( = ?auto_31418 ?auto_31411 ) ) ( not ( = ?auto_31414 ?auto_31411 ) ) ( ON ?auto_31407 ?auto_31406 ) ( not ( = ?auto_31406 ?auto_31407 ) ) ( not ( = ?auto_31406 ?auto_31408 ) ) ( not ( = ?auto_31406 ?auto_31409 ) ) ( not ( = ?auto_31406 ?auto_31410 ) ) ( not ( = ?auto_31406 ?auto_31420 ) ) ( not ( = ?auto_31406 ?auto_31417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31408 ?auto_31409 ?auto_31410 )
      ( MAKE-4CRATE-VERIFY ?auto_31406 ?auto_31407 ?auto_31408 ?auto_31409 ?auto_31410 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31421 - SURFACE
      ?auto_31422 - SURFACE
      ?auto_31423 - SURFACE
      ?auto_31424 - SURFACE
      ?auto_31425 - SURFACE
      ?auto_31426 - SURFACE
    )
    :vars
    (
      ?auto_31431 - HOIST
      ?auto_31435 - PLACE
      ?auto_31434 - PLACE
      ?auto_31428 - HOIST
      ?auto_31436 - SURFACE
      ?auto_31430 - PLACE
      ?auto_31429 - HOIST
      ?auto_31433 - SURFACE
      ?auto_31432 - TRUCK
      ?auto_31427 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31431 ?auto_31435 ) ( IS-CRATE ?auto_31426 ) ( not ( = ?auto_31425 ?auto_31426 ) ) ( not ( = ?auto_31424 ?auto_31425 ) ) ( not ( = ?auto_31424 ?auto_31426 ) ) ( not ( = ?auto_31434 ?auto_31435 ) ) ( HOIST-AT ?auto_31428 ?auto_31434 ) ( not ( = ?auto_31431 ?auto_31428 ) ) ( AVAILABLE ?auto_31428 ) ( SURFACE-AT ?auto_31426 ?auto_31434 ) ( ON ?auto_31426 ?auto_31436 ) ( CLEAR ?auto_31426 ) ( not ( = ?auto_31425 ?auto_31436 ) ) ( not ( = ?auto_31426 ?auto_31436 ) ) ( not ( = ?auto_31424 ?auto_31436 ) ) ( IS-CRATE ?auto_31425 ) ( not ( = ?auto_31430 ?auto_31435 ) ) ( not ( = ?auto_31434 ?auto_31430 ) ) ( HOIST-AT ?auto_31429 ?auto_31430 ) ( not ( = ?auto_31431 ?auto_31429 ) ) ( not ( = ?auto_31428 ?auto_31429 ) ) ( AVAILABLE ?auto_31429 ) ( SURFACE-AT ?auto_31425 ?auto_31430 ) ( ON ?auto_31425 ?auto_31433 ) ( CLEAR ?auto_31425 ) ( not ( = ?auto_31425 ?auto_31433 ) ) ( not ( = ?auto_31426 ?auto_31433 ) ) ( not ( = ?auto_31424 ?auto_31433 ) ) ( not ( = ?auto_31436 ?auto_31433 ) ) ( SURFACE-AT ?auto_31423 ?auto_31435 ) ( CLEAR ?auto_31423 ) ( IS-CRATE ?auto_31424 ) ( not ( = ?auto_31423 ?auto_31424 ) ) ( not ( = ?auto_31425 ?auto_31423 ) ) ( not ( = ?auto_31426 ?auto_31423 ) ) ( not ( = ?auto_31436 ?auto_31423 ) ) ( not ( = ?auto_31433 ?auto_31423 ) ) ( AVAILABLE ?auto_31431 ) ( IN ?auto_31424 ?auto_31432 ) ( TRUCK-AT ?auto_31432 ?auto_31427 ) ( not ( = ?auto_31427 ?auto_31435 ) ) ( not ( = ?auto_31434 ?auto_31427 ) ) ( not ( = ?auto_31430 ?auto_31427 ) ) ( ON ?auto_31422 ?auto_31421 ) ( ON ?auto_31423 ?auto_31422 ) ( not ( = ?auto_31421 ?auto_31422 ) ) ( not ( = ?auto_31421 ?auto_31423 ) ) ( not ( = ?auto_31421 ?auto_31424 ) ) ( not ( = ?auto_31421 ?auto_31425 ) ) ( not ( = ?auto_31421 ?auto_31426 ) ) ( not ( = ?auto_31421 ?auto_31436 ) ) ( not ( = ?auto_31421 ?auto_31433 ) ) ( not ( = ?auto_31422 ?auto_31423 ) ) ( not ( = ?auto_31422 ?auto_31424 ) ) ( not ( = ?auto_31422 ?auto_31425 ) ) ( not ( = ?auto_31422 ?auto_31426 ) ) ( not ( = ?auto_31422 ?auto_31436 ) ) ( not ( = ?auto_31422 ?auto_31433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31424 ?auto_31425 ?auto_31426 )
      ( MAKE-5CRATE-VERIFY ?auto_31421 ?auto_31422 ?auto_31423 ?auto_31424 ?auto_31425 ?auto_31426 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31437 - SURFACE
      ?auto_31438 - SURFACE
    )
    :vars
    (
      ?auto_31444 - HOIST
      ?auto_31449 - PLACE
      ?auto_31446 - SURFACE
      ?auto_31448 - PLACE
      ?auto_31441 - HOIST
      ?auto_31450 - SURFACE
      ?auto_31443 - PLACE
      ?auto_31442 - HOIST
      ?auto_31447 - SURFACE
      ?auto_31439 - SURFACE
      ?auto_31445 - TRUCK
      ?auto_31440 - PLACE
      ?auto_31451 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31444 ?auto_31449 ) ( IS-CRATE ?auto_31438 ) ( not ( = ?auto_31437 ?auto_31438 ) ) ( not ( = ?auto_31446 ?auto_31437 ) ) ( not ( = ?auto_31446 ?auto_31438 ) ) ( not ( = ?auto_31448 ?auto_31449 ) ) ( HOIST-AT ?auto_31441 ?auto_31448 ) ( not ( = ?auto_31444 ?auto_31441 ) ) ( AVAILABLE ?auto_31441 ) ( SURFACE-AT ?auto_31438 ?auto_31448 ) ( ON ?auto_31438 ?auto_31450 ) ( CLEAR ?auto_31438 ) ( not ( = ?auto_31437 ?auto_31450 ) ) ( not ( = ?auto_31438 ?auto_31450 ) ) ( not ( = ?auto_31446 ?auto_31450 ) ) ( IS-CRATE ?auto_31437 ) ( not ( = ?auto_31443 ?auto_31449 ) ) ( not ( = ?auto_31448 ?auto_31443 ) ) ( HOIST-AT ?auto_31442 ?auto_31443 ) ( not ( = ?auto_31444 ?auto_31442 ) ) ( not ( = ?auto_31441 ?auto_31442 ) ) ( AVAILABLE ?auto_31442 ) ( SURFACE-AT ?auto_31437 ?auto_31443 ) ( ON ?auto_31437 ?auto_31447 ) ( CLEAR ?auto_31437 ) ( not ( = ?auto_31437 ?auto_31447 ) ) ( not ( = ?auto_31438 ?auto_31447 ) ) ( not ( = ?auto_31446 ?auto_31447 ) ) ( not ( = ?auto_31450 ?auto_31447 ) ) ( SURFACE-AT ?auto_31439 ?auto_31449 ) ( CLEAR ?auto_31439 ) ( IS-CRATE ?auto_31446 ) ( not ( = ?auto_31439 ?auto_31446 ) ) ( not ( = ?auto_31437 ?auto_31439 ) ) ( not ( = ?auto_31438 ?auto_31439 ) ) ( not ( = ?auto_31450 ?auto_31439 ) ) ( not ( = ?auto_31447 ?auto_31439 ) ) ( AVAILABLE ?auto_31444 ) ( TRUCK-AT ?auto_31445 ?auto_31440 ) ( not ( = ?auto_31440 ?auto_31449 ) ) ( not ( = ?auto_31448 ?auto_31440 ) ) ( not ( = ?auto_31443 ?auto_31440 ) ) ( HOIST-AT ?auto_31451 ?auto_31440 ) ( LIFTING ?auto_31451 ?auto_31446 ) ( not ( = ?auto_31444 ?auto_31451 ) ) ( not ( = ?auto_31441 ?auto_31451 ) ) ( not ( = ?auto_31442 ?auto_31451 ) ) )
    :subtasks
    ( ( !LOAD ?auto_31451 ?auto_31446 ?auto_31445 ?auto_31440 )
      ( MAKE-2CRATE ?auto_31446 ?auto_31437 ?auto_31438 )
      ( MAKE-1CRATE-VERIFY ?auto_31437 ?auto_31438 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31452 - SURFACE
      ?auto_31453 - SURFACE
      ?auto_31454 - SURFACE
    )
    :vars
    (
      ?auto_31459 - HOIST
      ?auto_31458 - PLACE
      ?auto_31463 - PLACE
      ?auto_31455 - HOIST
      ?auto_31464 - SURFACE
      ?auto_31465 - PLACE
      ?auto_31460 - HOIST
      ?auto_31461 - SURFACE
      ?auto_31462 - SURFACE
      ?auto_31466 - TRUCK
      ?auto_31457 - PLACE
      ?auto_31456 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31459 ?auto_31458 ) ( IS-CRATE ?auto_31454 ) ( not ( = ?auto_31453 ?auto_31454 ) ) ( not ( = ?auto_31452 ?auto_31453 ) ) ( not ( = ?auto_31452 ?auto_31454 ) ) ( not ( = ?auto_31463 ?auto_31458 ) ) ( HOIST-AT ?auto_31455 ?auto_31463 ) ( not ( = ?auto_31459 ?auto_31455 ) ) ( AVAILABLE ?auto_31455 ) ( SURFACE-AT ?auto_31454 ?auto_31463 ) ( ON ?auto_31454 ?auto_31464 ) ( CLEAR ?auto_31454 ) ( not ( = ?auto_31453 ?auto_31464 ) ) ( not ( = ?auto_31454 ?auto_31464 ) ) ( not ( = ?auto_31452 ?auto_31464 ) ) ( IS-CRATE ?auto_31453 ) ( not ( = ?auto_31465 ?auto_31458 ) ) ( not ( = ?auto_31463 ?auto_31465 ) ) ( HOIST-AT ?auto_31460 ?auto_31465 ) ( not ( = ?auto_31459 ?auto_31460 ) ) ( not ( = ?auto_31455 ?auto_31460 ) ) ( AVAILABLE ?auto_31460 ) ( SURFACE-AT ?auto_31453 ?auto_31465 ) ( ON ?auto_31453 ?auto_31461 ) ( CLEAR ?auto_31453 ) ( not ( = ?auto_31453 ?auto_31461 ) ) ( not ( = ?auto_31454 ?auto_31461 ) ) ( not ( = ?auto_31452 ?auto_31461 ) ) ( not ( = ?auto_31464 ?auto_31461 ) ) ( SURFACE-AT ?auto_31462 ?auto_31458 ) ( CLEAR ?auto_31462 ) ( IS-CRATE ?auto_31452 ) ( not ( = ?auto_31462 ?auto_31452 ) ) ( not ( = ?auto_31453 ?auto_31462 ) ) ( not ( = ?auto_31454 ?auto_31462 ) ) ( not ( = ?auto_31464 ?auto_31462 ) ) ( not ( = ?auto_31461 ?auto_31462 ) ) ( AVAILABLE ?auto_31459 ) ( TRUCK-AT ?auto_31466 ?auto_31457 ) ( not ( = ?auto_31457 ?auto_31458 ) ) ( not ( = ?auto_31463 ?auto_31457 ) ) ( not ( = ?auto_31465 ?auto_31457 ) ) ( HOIST-AT ?auto_31456 ?auto_31457 ) ( LIFTING ?auto_31456 ?auto_31452 ) ( not ( = ?auto_31459 ?auto_31456 ) ) ( not ( = ?auto_31455 ?auto_31456 ) ) ( not ( = ?auto_31460 ?auto_31456 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31453 ?auto_31454 )
      ( MAKE-2CRATE-VERIFY ?auto_31452 ?auto_31453 ?auto_31454 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31467 - SURFACE
      ?auto_31468 - SURFACE
      ?auto_31469 - SURFACE
      ?auto_31470 - SURFACE
    )
    :vars
    (
      ?auto_31478 - HOIST
      ?auto_31476 - PLACE
      ?auto_31471 - PLACE
      ?auto_31477 - HOIST
      ?auto_31475 - SURFACE
      ?auto_31479 - PLACE
      ?auto_31473 - HOIST
      ?auto_31474 - SURFACE
      ?auto_31481 - TRUCK
      ?auto_31472 - PLACE
      ?auto_31480 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31478 ?auto_31476 ) ( IS-CRATE ?auto_31470 ) ( not ( = ?auto_31469 ?auto_31470 ) ) ( not ( = ?auto_31468 ?auto_31469 ) ) ( not ( = ?auto_31468 ?auto_31470 ) ) ( not ( = ?auto_31471 ?auto_31476 ) ) ( HOIST-AT ?auto_31477 ?auto_31471 ) ( not ( = ?auto_31478 ?auto_31477 ) ) ( AVAILABLE ?auto_31477 ) ( SURFACE-AT ?auto_31470 ?auto_31471 ) ( ON ?auto_31470 ?auto_31475 ) ( CLEAR ?auto_31470 ) ( not ( = ?auto_31469 ?auto_31475 ) ) ( not ( = ?auto_31470 ?auto_31475 ) ) ( not ( = ?auto_31468 ?auto_31475 ) ) ( IS-CRATE ?auto_31469 ) ( not ( = ?auto_31479 ?auto_31476 ) ) ( not ( = ?auto_31471 ?auto_31479 ) ) ( HOIST-AT ?auto_31473 ?auto_31479 ) ( not ( = ?auto_31478 ?auto_31473 ) ) ( not ( = ?auto_31477 ?auto_31473 ) ) ( AVAILABLE ?auto_31473 ) ( SURFACE-AT ?auto_31469 ?auto_31479 ) ( ON ?auto_31469 ?auto_31474 ) ( CLEAR ?auto_31469 ) ( not ( = ?auto_31469 ?auto_31474 ) ) ( not ( = ?auto_31470 ?auto_31474 ) ) ( not ( = ?auto_31468 ?auto_31474 ) ) ( not ( = ?auto_31475 ?auto_31474 ) ) ( SURFACE-AT ?auto_31467 ?auto_31476 ) ( CLEAR ?auto_31467 ) ( IS-CRATE ?auto_31468 ) ( not ( = ?auto_31467 ?auto_31468 ) ) ( not ( = ?auto_31469 ?auto_31467 ) ) ( not ( = ?auto_31470 ?auto_31467 ) ) ( not ( = ?auto_31475 ?auto_31467 ) ) ( not ( = ?auto_31474 ?auto_31467 ) ) ( AVAILABLE ?auto_31478 ) ( TRUCK-AT ?auto_31481 ?auto_31472 ) ( not ( = ?auto_31472 ?auto_31476 ) ) ( not ( = ?auto_31471 ?auto_31472 ) ) ( not ( = ?auto_31479 ?auto_31472 ) ) ( HOIST-AT ?auto_31480 ?auto_31472 ) ( LIFTING ?auto_31480 ?auto_31468 ) ( not ( = ?auto_31478 ?auto_31480 ) ) ( not ( = ?auto_31477 ?auto_31480 ) ) ( not ( = ?auto_31473 ?auto_31480 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31468 ?auto_31469 ?auto_31470 )
      ( MAKE-3CRATE-VERIFY ?auto_31467 ?auto_31468 ?auto_31469 ?auto_31470 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31482 - SURFACE
      ?auto_31483 - SURFACE
      ?auto_31484 - SURFACE
      ?auto_31485 - SURFACE
      ?auto_31486 - SURFACE
    )
    :vars
    (
      ?auto_31494 - HOIST
      ?auto_31492 - PLACE
      ?auto_31487 - PLACE
      ?auto_31493 - HOIST
      ?auto_31491 - SURFACE
      ?auto_31495 - PLACE
      ?auto_31489 - HOIST
      ?auto_31490 - SURFACE
      ?auto_31497 - TRUCK
      ?auto_31488 - PLACE
      ?auto_31496 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31494 ?auto_31492 ) ( IS-CRATE ?auto_31486 ) ( not ( = ?auto_31485 ?auto_31486 ) ) ( not ( = ?auto_31484 ?auto_31485 ) ) ( not ( = ?auto_31484 ?auto_31486 ) ) ( not ( = ?auto_31487 ?auto_31492 ) ) ( HOIST-AT ?auto_31493 ?auto_31487 ) ( not ( = ?auto_31494 ?auto_31493 ) ) ( AVAILABLE ?auto_31493 ) ( SURFACE-AT ?auto_31486 ?auto_31487 ) ( ON ?auto_31486 ?auto_31491 ) ( CLEAR ?auto_31486 ) ( not ( = ?auto_31485 ?auto_31491 ) ) ( not ( = ?auto_31486 ?auto_31491 ) ) ( not ( = ?auto_31484 ?auto_31491 ) ) ( IS-CRATE ?auto_31485 ) ( not ( = ?auto_31495 ?auto_31492 ) ) ( not ( = ?auto_31487 ?auto_31495 ) ) ( HOIST-AT ?auto_31489 ?auto_31495 ) ( not ( = ?auto_31494 ?auto_31489 ) ) ( not ( = ?auto_31493 ?auto_31489 ) ) ( AVAILABLE ?auto_31489 ) ( SURFACE-AT ?auto_31485 ?auto_31495 ) ( ON ?auto_31485 ?auto_31490 ) ( CLEAR ?auto_31485 ) ( not ( = ?auto_31485 ?auto_31490 ) ) ( not ( = ?auto_31486 ?auto_31490 ) ) ( not ( = ?auto_31484 ?auto_31490 ) ) ( not ( = ?auto_31491 ?auto_31490 ) ) ( SURFACE-AT ?auto_31483 ?auto_31492 ) ( CLEAR ?auto_31483 ) ( IS-CRATE ?auto_31484 ) ( not ( = ?auto_31483 ?auto_31484 ) ) ( not ( = ?auto_31485 ?auto_31483 ) ) ( not ( = ?auto_31486 ?auto_31483 ) ) ( not ( = ?auto_31491 ?auto_31483 ) ) ( not ( = ?auto_31490 ?auto_31483 ) ) ( AVAILABLE ?auto_31494 ) ( TRUCK-AT ?auto_31497 ?auto_31488 ) ( not ( = ?auto_31488 ?auto_31492 ) ) ( not ( = ?auto_31487 ?auto_31488 ) ) ( not ( = ?auto_31495 ?auto_31488 ) ) ( HOIST-AT ?auto_31496 ?auto_31488 ) ( LIFTING ?auto_31496 ?auto_31484 ) ( not ( = ?auto_31494 ?auto_31496 ) ) ( not ( = ?auto_31493 ?auto_31496 ) ) ( not ( = ?auto_31489 ?auto_31496 ) ) ( ON ?auto_31483 ?auto_31482 ) ( not ( = ?auto_31482 ?auto_31483 ) ) ( not ( = ?auto_31482 ?auto_31484 ) ) ( not ( = ?auto_31482 ?auto_31485 ) ) ( not ( = ?auto_31482 ?auto_31486 ) ) ( not ( = ?auto_31482 ?auto_31491 ) ) ( not ( = ?auto_31482 ?auto_31490 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31484 ?auto_31485 ?auto_31486 )
      ( MAKE-4CRATE-VERIFY ?auto_31482 ?auto_31483 ?auto_31484 ?auto_31485 ?auto_31486 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31498 - SURFACE
      ?auto_31499 - SURFACE
      ?auto_31500 - SURFACE
      ?auto_31501 - SURFACE
      ?auto_31502 - SURFACE
      ?auto_31503 - SURFACE
    )
    :vars
    (
      ?auto_31511 - HOIST
      ?auto_31509 - PLACE
      ?auto_31504 - PLACE
      ?auto_31510 - HOIST
      ?auto_31508 - SURFACE
      ?auto_31512 - PLACE
      ?auto_31506 - HOIST
      ?auto_31507 - SURFACE
      ?auto_31514 - TRUCK
      ?auto_31505 - PLACE
      ?auto_31513 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31511 ?auto_31509 ) ( IS-CRATE ?auto_31503 ) ( not ( = ?auto_31502 ?auto_31503 ) ) ( not ( = ?auto_31501 ?auto_31502 ) ) ( not ( = ?auto_31501 ?auto_31503 ) ) ( not ( = ?auto_31504 ?auto_31509 ) ) ( HOIST-AT ?auto_31510 ?auto_31504 ) ( not ( = ?auto_31511 ?auto_31510 ) ) ( AVAILABLE ?auto_31510 ) ( SURFACE-AT ?auto_31503 ?auto_31504 ) ( ON ?auto_31503 ?auto_31508 ) ( CLEAR ?auto_31503 ) ( not ( = ?auto_31502 ?auto_31508 ) ) ( not ( = ?auto_31503 ?auto_31508 ) ) ( not ( = ?auto_31501 ?auto_31508 ) ) ( IS-CRATE ?auto_31502 ) ( not ( = ?auto_31512 ?auto_31509 ) ) ( not ( = ?auto_31504 ?auto_31512 ) ) ( HOIST-AT ?auto_31506 ?auto_31512 ) ( not ( = ?auto_31511 ?auto_31506 ) ) ( not ( = ?auto_31510 ?auto_31506 ) ) ( AVAILABLE ?auto_31506 ) ( SURFACE-AT ?auto_31502 ?auto_31512 ) ( ON ?auto_31502 ?auto_31507 ) ( CLEAR ?auto_31502 ) ( not ( = ?auto_31502 ?auto_31507 ) ) ( not ( = ?auto_31503 ?auto_31507 ) ) ( not ( = ?auto_31501 ?auto_31507 ) ) ( not ( = ?auto_31508 ?auto_31507 ) ) ( SURFACE-AT ?auto_31500 ?auto_31509 ) ( CLEAR ?auto_31500 ) ( IS-CRATE ?auto_31501 ) ( not ( = ?auto_31500 ?auto_31501 ) ) ( not ( = ?auto_31502 ?auto_31500 ) ) ( not ( = ?auto_31503 ?auto_31500 ) ) ( not ( = ?auto_31508 ?auto_31500 ) ) ( not ( = ?auto_31507 ?auto_31500 ) ) ( AVAILABLE ?auto_31511 ) ( TRUCK-AT ?auto_31514 ?auto_31505 ) ( not ( = ?auto_31505 ?auto_31509 ) ) ( not ( = ?auto_31504 ?auto_31505 ) ) ( not ( = ?auto_31512 ?auto_31505 ) ) ( HOIST-AT ?auto_31513 ?auto_31505 ) ( LIFTING ?auto_31513 ?auto_31501 ) ( not ( = ?auto_31511 ?auto_31513 ) ) ( not ( = ?auto_31510 ?auto_31513 ) ) ( not ( = ?auto_31506 ?auto_31513 ) ) ( ON ?auto_31499 ?auto_31498 ) ( ON ?auto_31500 ?auto_31499 ) ( not ( = ?auto_31498 ?auto_31499 ) ) ( not ( = ?auto_31498 ?auto_31500 ) ) ( not ( = ?auto_31498 ?auto_31501 ) ) ( not ( = ?auto_31498 ?auto_31502 ) ) ( not ( = ?auto_31498 ?auto_31503 ) ) ( not ( = ?auto_31498 ?auto_31508 ) ) ( not ( = ?auto_31498 ?auto_31507 ) ) ( not ( = ?auto_31499 ?auto_31500 ) ) ( not ( = ?auto_31499 ?auto_31501 ) ) ( not ( = ?auto_31499 ?auto_31502 ) ) ( not ( = ?auto_31499 ?auto_31503 ) ) ( not ( = ?auto_31499 ?auto_31508 ) ) ( not ( = ?auto_31499 ?auto_31507 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31501 ?auto_31502 ?auto_31503 )
      ( MAKE-5CRATE-VERIFY ?auto_31498 ?auto_31499 ?auto_31500 ?auto_31501 ?auto_31502 ?auto_31503 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31515 - SURFACE
      ?auto_31516 - SURFACE
    )
    :vars
    (
      ?auto_31526 - HOIST
      ?auto_31523 - PLACE
      ?auto_31517 - SURFACE
      ?auto_31518 - PLACE
      ?auto_31524 - HOIST
      ?auto_31522 - SURFACE
      ?auto_31527 - PLACE
      ?auto_31520 - HOIST
      ?auto_31521 - SURFACE
      ?auto_31525 - SURFACE
      ?auto_31529 - TRUCK
      ?auto_31519 - PLACE
      ?auto_31528 - HOIST
      ?auto_31530 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31526 ?auto_31523 ) ( IS-CRATE ?auto_31516 ) ( not ( = ?auto_31515 ?auto_31516 ) ) ( not ( = ?auto_31517 ?auto_31515 ) ) ( not ( = ?auto_31517 ?auto_31516 ) ) ( not ( = ?auto_31518 ?auto_31523 ) ) ( HOIST-AT ?auto_31524 ?auto_31518 ) ( not ( = ?auto_31526 ?auto_31524 ) ) ( AVAILABLE ?auto_31524 ) ( SURFACE-AT ?auto_31516 ?auto_31518 ) ( ON ?auto_31516 ?auto_31522 ) ( CLEAR ?auto_31516 ) ( not ( = ?auto_31515 ?auto_31522 ) ) ( not ( = ?auto_31516 ?auto_31522 ) ) ( not ( = ?auto_31517 ?auto_31522 ) ) ( IS-CRATE ?auto_31515 ) ( not ( = ?auto_31527 ?auto_31523 ) ) ( not ( = ?auto_31518 ?auto_31527 ) ) ( HOIST-AT ?auto_31520 ?auto_31527 ) ( not ( = ?auto_31526 ?auto_31520 ) ) ( not ( = ?auto_31524 ?auto_31520 ) ) ( AVAILABLE ?auto_31520 ) ( SURFACE-AT ?auto_31515 ?auto_31527 ) ( ON ?auto_31515 ?auto_31521 ) ( CLEAR ?auto_31515 ) ( not ( = ?auto_31515 ?auto_31521 ) ) ( not ( = ?auto_31516 ?auto_31521 ) ) ( not ( = ?auto_31517 ?auto_31521 ) ) ( not ( = ?auto_31522 ?auto_31521 ) ) ( SURFACE-AT ?auto_31525 ?auto_31523 ) ( CLEAR ?auto_31525 ) ( IS-CRATE ?auto_31517 ) ( not ( = ?auto_31525 ?auto_31517 ) ) ( not ( = ?auto_31515 ?auto_31525 ) ) ( not ( = ?auto_31516 ?auto_31525 ) ) ( not ( = ?auto_31522 ?auto_31525 ) ) ( not ( = ?auto_31521 ?auto_31525 ) ) ( AVAILABLE ?auto_31526 ) ( TRUCK-AT ?auto_31529 ?auto_31519 ) ( not ( = ?auto_31519 ?auto_31523 ) ) ( not ( = ?auto_31518 ?auto_31519 ) ) ( not ( = ?auto_31527 ?auto_31519 ) ) ( HOIST-AT ?auto_31528 ?auto_31519 ) ( not ( = ?auto_31526 ?auto_31528 ) ) ( not ( = ?auto_31524 ?auto_31528 ) ) ( not ( = ?auto_31520 ?auto_31528 ) ) ( AVAILABLE ?auto_31528 ) ( SURFACE-AT ?auto_31517 ?auto_31519 ) ( ON ?auto_31517 ?auto_31530 ) ( CLEAR ?auto_31517 ) ( not ( = ?auto_31515 ?auto_31530 ) ) ( not ( = ?auto_31516 ?auto_31530 ) ) ( not ( = ?auto_31517 ?auto_31530 ) ) ( not ( = ?auto_31522 ?auto_31530 ) ) ( not ( = ?auto_31521 ?auto_31530 ) ) ( not ( = ?auto_31525 ?auto_31530 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31528 ?auto_31517 ?auto_31530 ?auto_31519 )
      ( MAKE-2CRATE ?auto_31517 ?auto_31515 ?auto_31516 )
      ( MAKE-1CRATE-VERIFY ?auto_31515 ?auto_31516 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31531 - SURFACE
      ?auto_31532 - SURFACE
      ?auto_31533 - SURFACE
    )
    :vars
    (
      ?auto_31544 - HOIST
      ?auto_31538 - PLACE
      ?auto_31542 - PLACE
      ?auto_31541 - HOIST
      ?auto_31545 - SURFACE
      ?auto_31539 - PLACE
      ?auto_31536 - HOIST
      ?auto_31534 - SURFACE
      ?auto_31540 - SURFACE
      ?auto_31535 - TRUCK
      ?auto_31537 - PLACE
      ?auto_31546 - HOIST
      ?auto_31543 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31544 ?auto_31538 ) ( IS-CRATE ?auto_31533 ) ( not ( = ?auto_31532 ?auto_31533 ) ) ( not ( = ?auto_31531 ?auto_31532 ) ) ( not ( = ?auto_31531 ?auto_31533 ) ) ( not ( = ?auto_31542 ?auto_31538 ) ) ( HOIST-AT ?auto_31541 ?auto_31542 ) ( not ( = ?auto_31544 ?auto_31541 ) ) ( AVAILABLE ?auto_31541 ) ( SURFACE-AT ?auto_31533 ?auto_31542 ) ( ON ?auto_31533 ?auto_31545 ) ( CLEAR ?auto_31533 ) ( not ( = ?auto_31532 ?auto_31545 ) ) ( not ( = ?auto_31533 ?auto_31545 ) ) ( not ( = ?auto_31531 ?auto_31545 ) ) ( IS-CRATE ?auto_31532 ) ( not ( = ?auto_31539 ?auto_31538 ) ) ( not ( = ?auto_31542 ?auto_31539 ) ) ( HOIST-AT ?auto_31536 ?auto_31539 ) ( not ( = ?auto_31544 ?auto_31536 ) ) ( not ( = ?auto_31541 ?auto_31536 ) ) ( AVAILABLE ?auto_31536 ) ( SURFACE-AT ?auto_31532 ?auto_31539 ) ( ON ?auto_31532 ?auto_31534 ) ( CLEAR ?auto_31532 ) ( not ( = ?auto_31532 ?auto_31534 ) ) ( not ( = ?auto_31533 ?auto_31534 ) ) ( not ( = ?auto_31531 ?auto_31534 ) ) ( not ( = ?auto_31545 ?auto_31534 ) ) ( SURFACE-AT ?auto_31540 ?auto_31538 ) ( CLEAR ?auto_31540 ) ( IS-CRATE ?auto_31531 ) ( not ( = ?auto_31540 ?auto_31531 ) ) ( not ( = ?auto_31532 ?auto_31540 ) ) ( not ( = ?auto_31533 ?auto_31540 ) ) ( not ( = ?auto_31545 ?auto_31540 ) ) ( not ( = ?auto_31534 ?auto_31540 ) ) ( AVAILABLE ?auto_31544 ) ( TRUCK-AT ?auto_31535 ?auto_31537 ) ( not ( = ?auto_31537 ?auto_31538 ) ) ( not ( = ?auto_31542 ?auto_31537 ) ) ( not ( = ?auto_31539 ?auto_31537 ) ) ( HOIST-AT ?auto_31546 ?auto_31537 ) ( not ( = ?auto_31544 ?auto_31546 ) ) ( not ( = ?auto_31541 ?auto_31546 ) ) ( not ( = ?auto_31536 ?auto_31546 ) ) ( AVAILABLE ?auto_31546 ) ( SURFACE-AT ?auto_31531 ?auto_31537 ) ( ON ?auto_31531 ?auto_31543 ) ( CLEAR ?auto_31531 ) ( not ( = ?auto_31532 ?auto_31543 ) ) ( not ( = ?auto_31533 ?auto_31543 ) ) ( not ( = ?auto_31531 ?auto_31543 ) ) ( not ( = ?auto_31545 ?auto_31543 ) ) ( not ( = ?auto_31534 ?auto_31543 ) ) ( not ( = ?auto_31540 ?auto_31543 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31532 ?auto_31533 )
      ( MAKE-2CRATE-VERIFY ?auto_31531 ?auto_31532 ?auto_31533 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31547 - SURFACE
      ?auto_31548 - SURFACE
      ?auto_31549 - SURFACE
      ?auto_31550 - SURFACE
    )
    :vars
    (
      ?auto_31559 - HOIST
      ?auto_31551 - PLACE
      ?auto_31554 - PLACE
      ?auto_31555 - HOIST
      ?auto_31558 - SURFACE
      ?auto_31562 - PLACE
      ?auto_31557 - HOIST
      ?auto_31553 - SURFACE
      ?auto_31560 - TRUCK
      ?auto_31552 - PLACE
      ?auto_31561 - HOIST
      ?auto_31556 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31559 ?auto_31551 ) ( IS-CRATE ?auto_31550 ) ( not ( = ?auto_31549 ?auto_31550 ) ) ( not ( = ?auto_31548 ?auto_31549 ) ) ( not ( = ?auto_31548 ?auto_31550 ) ) ( not ( = ?auto_31554 ?auto_31551 ) ) ( HOIST-AT ?auto_31555 ?auto_31554 ) ( not ( = ?auto_31559 ?auto_31555 ) ) ( AVAILABLE ?auto_31555 ) ( SURFACE-AT ?auto_31550 ?auto_31554 ) ( ON ?auto_31550 ?auto_31558 ) ( CLEAR ?auto_31550 ) ( not ( = ?auto_31549 ?auto_31558 ) ) ( not ( = ?auto_31550 ?auto_31558 ) ) ( not ( = ?auto_31548 ?auto_31558 ) ) ( IS-CRATE ?auto_31549 ) ( not ( = ?auto_31562 ?auto_31551 ) ) ( not ( = ?auto_31554 ?auto_31562 ) ) ( HOIST-AT ?auto_31557 ?auto_31562 ) ( not ( = ?auto_31559 ?auto_31557 ) ) ( not ( = ?auto_31555 ?auto_31557 ) ) ( AVAILABLE ?auto_31557 ) ( SURFACE-AT ?auto_31549 ?auto_31562 ) ( ON ?auto_31549 ?auto_31553 ) ( CLEAR ?auto_31549 ) ( not ( = ?auto_31549 ?auto_31553 ) ) ( not ( = ?auto_31550 ?auto_31553 ) ) ( not ( = ?auto_31548 ?auto_31553 ) ) ( not ( = ?auto_31558 ?auto_31553 ) ) ( SURFACE-AT ?auto_31547 ?auto_31551 ) ( CLEAR ?auto_31547 ) ( IS-CRATE ?auto_31548 ) ( not ( = ?auto_31547 ?auto_31548 ) ) ( not ( = ?auto_31549 ?auto_31547 ) ) ( not ( = ?auto_31550 ?auto_31547 ) ) ( not ( = ?auto_31558 ?auto_31547 ) ) ( not ( = ?auto_31553 ?auto_31547 ) ) ( AVAILABLE ?auto_31559 ) ( TRUCK-AT ?auto_31560 ?auto_31552 ) ( not ( = ?auto_31552 ?auto_31551 ) ) ( not ( = ?auto_31554 ?auto_31552 ) ) ( not ( = ?auto_31562 ?auto_31552 ) ) ( HOIST-AT ?auto_31561 ?auto_31552 ) ( not ( = ?auto_31559 ?auto_31561 ) ) ( not ( = ?auto_31555 ?auto_31561 ) ) ( not ( = ?auto_31557 ?auto_31561 ) ) ( AVAILABLE ?auto_31561 ) ( SURFACE-AT ?auto_31548 ?auto_31552 ) ( ON ?auto_31548 ?auto_31556 ) ( CLEAR ?auto_31548 ) ( not ( = ?auto_31549 ?auto_31556 ) ) ( not ( = ?auto_31550 ?auto_31556 ) ) ( not ( = ?auto_31548 ?auto_31556 ) ) ( not ( = ?auto_31558 ?auto_31556 ) ) ( not ( = ?auto_31553 ?auto_31556 ) ) ( not ( = ?auto_31547 ?auto_31556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31548 ?auto_31549 ?auto_31550 )
      ( MAKE-3CRATE-VERIFY ?auto_31547 ?auto_31548 ?auto_31549 ?auto_31550 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31563 - SURFACE
      ?auto_31564 - SURFACE
      ?auto_31565 - SURFACE
      ?auto_31566 - SURFACE
      ?auto_31567 - SURFACE
    )
    :vars
    (
      ?auto_31576 - HOIST
      ?auto_31568 - PLACE
      ?auto_31571 - PLACE
      ?auto_31572 - HOIST
      ?auto_31575 - SURFACE
      ?auto_31579 - PLACE
      ?auto_31574 - HOIST
      ?auto_31570 - SURFACE
      ?auto_31577 - TRUCK
      ?auto_31569 - PLACE
      ?auto_31578 - HOIST
      ?auto_31573 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31576 ?auto_31568 ) ( IS-CRATE ?auto_31567 ) ( not ( = ?auto_31566 ?auto_31567 ) ) ( not ( = ?auto_31565 ?auto_31566 ) ) ( not ( = ?auto_31565 ?auto_31567 ) ) ( not ( = ?auto_31571 ?auto_31568 ) ) ( HOIST-AT ?auto_31572 ?auto_31571 ) ( not ( = ?auto_31576 ?auto_31572 ) ) ( AVAILABLE ?auto_31572 ) ( SURFACE-AT ?auto_31567 ?auto_31571 ) ( ON ?auto_31567 ?auto_31575 ) ( CLEAR ?auto_31567 ) ( not ( = ?auto_31566 ?auto_31575 ) ) ( not ( = ?auto_31567 ?auto_31575 ) ) ( not ( = ?auto_31565 ?auto_31575 ) ) ( IS-CRATE ?auto_31566 ) ( not ( = ?auto_31579 ?auto_31568 ) ) ( not ( = ?auto_31571 ?auto_31579 ) ) ( HOIST-AT ?auto_31574 ?auto_31579 ) ( not ( = ?auto_31576 ?auto_31574 ) ) ( not ( = ?auto_31572 ?auto_31574 ) ) ( AVAILABLE ?auto_31574 ) ( SURFACE-AT ?auto_31566 ?auto_31579 ) ( ON ?auto_31566 ?auto_31570 ) ( CLEAR ?auto_31566 ) ( not ( = ?auto_31566 ?auto_31570 ) ) ( not ( = ?auto_31567 ?auto_31570 ) ) ( not ( = ?auto_31565 ?auto_31570 ) ) ( not ( = ?auto_31575 ?auto_31570 ) ) ( SURFACE-AT ?auto_31564 ?auto_31568 ) ( CLEAR ?auto_31564 ) ( IS-CRATE ?auto_31565 ) ( not ( = ?auto_31564 ?auto_31565 ) ) ( not ( = ?auto_31566 ?auto_31564 ) ) ( not ( = ?auto_31567 ?auto_31564 ) ) ( not ( = ?auto_31575 ?auto_31564 ) ) ( not ( = ?auto_31570 ?auto_31564 ) ) ( AVAILABLE ?auto_31576 ) ( TRUCK-AT ?auto_31577 ?auto_31569 ) ( not ( = ?auto_31569 ?auto_31568 ) ) ( not ( = ?auto_31571 ?auto_31569 ) ) ( not ( = ?auto_31579 ?auto_31569 ) ) ( HOIST-AT ?auto_31578 ?auto_31569 ) ( not ( = ?auto_31576 ?auto_31578 ) ) ( not ( = ?auto_31572 ?auto_31578 ) ) ( not ( = ?auto_31574 ?auto_31578 ) ) ( AVAILABLE ?auto_31578 ) ( SURFACE-AT ?auto_31565 ?auto_31569 ) ( ON ?auto_31565 ?auto_31573 ) ( CLEAR ?auto_31565 ) ( not ( = ?auto_31566 ?auto_31573 ) ) ( not ( = ?auto_31567 ?auto_31573 ) ) ( not ( = ?auto_31565 ?auto_31573 ) ) ( not ( = ?auto_31575 ?auto_31573 ) ) ( not ( = ?auto_31570 ?auto_31573 ) ) ( not ( = ?auto_31564 ?auto_31573 ) ) ( ON ?auto_31564 ?auto_31563 ) ( not ( = ?auto_31563 ?auto_31564 ) ) ( not ( = ?auto_31563 ?auto_31565 ) ) ( not ( = ?auto_31563 ?auto_31566 ) ) ( not ( = ?auto_31563 ?auto_31567 ) ) ( not ( = ?auto_31563 ?auto_31575 ) ) ( not ( = ?auto_31563 ?auto_31570 ) ) ( not ( = ?auto_31563 ?auto_31573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31565 ?auto_31566 ?auto_31567 )
      ( MAKE-4CRATE-VERIFY ?auto_31563 ?auto_31564 ?auto_31565 ?auto_31566 ?auto_31567 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31580 - SURFACE
      ?auto_31581 - SURFACE
      ?auto_31582 - SURFACE
      ?auto_31583 - SURFACE
      ?auto_31584 - SURFACE
      ?auto_31585 - SURFACE
    )
    :vars
    (
      ?auto_31594 - HOIST
      ?auto_31586 - PLACE
      ?auto_31589 - PLACE
      ?auto_31590 - HOIST
      ?auto_31593 - SURFACE
      ?auto_31597 - PLACE
      ?auto_31592 - HOIST
      ?auto_31588 - SURFACE
      ?auto_31595 - TRUCK
      ?auto_31587 - PLACE
      ?auto_31596 - HOIST
      ?auto_31591 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31594 ?auto_31586 ) ( IS-CRATE ?auto_31585 ) ( not ( = ?auto_31584 ?auto_31585 ) ) ( not ( = ?auto_31583 ?auto_31584 ) ) ( not ( = ?auto_31583 ?auto_31585 ) ) ( not ( = ?auto_31589 ?auto_31586 ) ) ( HOIST-AT ?auto_31590 ?auto_31589 ) ( not ( = ?auto_31594 ?auto_31590 ) ) ( AVAILABLE ?auto_31590 ) ( SURFACE-AT ?auto_31585 ?auto_31589 ) ( ON ?auto_31585 ?auto_31593 ) ( CLEAR ?auto_31585 ) ( not ( = ?auto_31584 ?auto_31593 ) ) ( not ( = ?auto_31585 ?auto_31593 ) ) ( not ( = ?auto_31583 ?auto_31593 ) ) ( IS-CRATE ?auto_31584 ) ( not ( = ?auto_31597 ?auto_31586 ) ) ( not ( = ?auto_31589 ?auto_31597 ) ) ( HOIST-AT ?auto_31592 ?auto_31597 ) ( not ( = ?auto_31594 ?auto_31592 ) ) ( not ( = ?auto_31590 ?auto_31592 ) ) ( AVAILABLE ?auto_31592 ) ( SURFACE-AT ?auto_31584 ?auto_31597 ) ( ON ?auto_31584 ?auto_31588 ) ( CLEAR ?auto_31584 ) ( not ( = ?auto_31584 ?auto_31588 ) ) ( not ( = ?auto_31585 ?auto_31588 ) ) ( not ( = ?auto_31583 ?auto_31588 ) ) ( not ( = ?auto_31593 ?auto_31588 ) ) ( SURFACE-AT ?auto_31582 ?auto_31586 ) ( CLEAR ?auto_31582 ) ( IS-CRATE ?auto_31583 ) ( not ( = ?auto_31582 ?auto_31583 ) ) ( not ( = ?auto_31584 ?auto_31582 ) ) ( not ( = ?auto_31585 ?auto_31582 ) ) ( not ( = ?auto_31593 ?auto_31582 ) ) ( not ( = ?auto_31588 ?auto_31582 ) ) ( AVAILABLE ?auto_31594 ) ( TRUCK-AT ?auto_31595 ?auto_31587 ) ( not ( = ?auto_31587 ?auto_31586 ) ) ( not ( = ?auto_31589 ?auto_31587 ) ) ( not ( = ?auto_31597 ?auto_31587 ) ) ( HOIST-AT ?auto_31596 ?auto_31587 ) ( not ( = ?auto_31594 ?auto_31596 ) ) ( not ( = ?auto_31590 ?auto_31596 ) ) ( not ( = ?auto_31592 ?auto_31596 ) ) ( AVAILABLE ?auto_31596 ) ( SURFACE-AT ?auto_31583 ?auto_31587 ) ( ON ?auto_31583 ?auto_31591 ) ( CLEAR ?auto_31583 ) ( not ( = ?auto_31584 ?auto_31591 ) ) ( not ( = ?auto_31585 ?auto_31591 ) ) ( not ( = ?auto_31583 ?auto_31591 ) ) ( not ( = ?auto_31593 ?auto_31591 ) ) ( not ( = ?auto_31588 ?auto_31591 ) ) ( not ( = ?auto_31582 ?auto_31591 ) ) ( ON ?auto_31581 ?auto_31580 ) ( ON ?auto_31582 ?auto_31581 ) ( not ( = ?auto_31580 ?auto_31581 ) ) ( not ( = ?auto_31580 ?auto_31582 ) ) ( not ( = ?auto_31580 ?auto_31583 ) ) ( not ( = ?auto_31580 ?auto_31584 ) ) ( not ( = ?auto_31580 ?auto_31585 ) ) ( not ( = ?auto_31580 ?auto_31593 ) ) ( not ( = ?auto_31580 ?auto_31588 ) ) ( not ( = ?auto_31580 ?auto_31591 ) ) ( not ( = ?auto_31581 ?auto_31582 ) ) ( not ( = ?auto_31581 ?auto_31583 ) ) ( not ( = ?auto_31581 ?auto_31584 ) ) ( not ( = ?auto_31581 ?auto_31585 ) ) ( not ( = ?auto_31581 ?auto_31593 ) ) ( not ( = ?auto_31581 ?auto_31588 ) ) ( not ( = ?auto_31581 ?auto_31591 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31583 ?auto_31584 ?auto_31585 )
      ( MAKE-5CRATE-VERIFY ?auto_31580 ?auto_31581 ?auto_31582 ?auto_31583 ?auto_31584 ?auto_31585 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31598 - SURFACE
      ?auto_31599 - SURFACE
    )
    :vars
    (
      ?auto_31610 - HOIST
      ?auto_31600 - PLACE
      ?auto_31607 - SURFACE
      ?auto_31604 - PLACE
      ?auto_31605 - HOIST
      ?auto_31609 - SURFACE
      ?auto_31613 - PLACE
      ?auto_31608 - HOIST
      ?auto_31603 - SURFACE
      ?auto_31602 - SURFACE
      ?auto_31601 - PLACE
      ?auto_31612 - HOIST
      ?auto_31606 - SURFACE
      ?auto_31611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31610 ?auto_31600 ) ( IS-CRATE ?auto_31599 ) ( not ( = ?auto_31598 ?auto_31599 ) ) ( not ( = ?auto_31607 ?auto_31598 ) ) ( not ( = ?auto_31607 ?auto_31599 ) ) ( not ( = ?auto_31604 ?auto_31600 ) ) ( HOIST-AT ?auto_31605 ?auto_31604 ) ( not ( = ?auto_31610 ?auto_31605 ) ) ( AVAILABLE ?auto_31605 ) ( SURFACE-AT ?auto_31599 ?auto_31604 ) ( ON ?auto_31599 ?auto_31609 ) ( CLEAR ?auto_31599 ) ( not ( = ?auto_31598 ?auto_31609 ) ) ( not ( = ?auto_31599 ?auto_31609 ) ) ( not ( = ?auto_31607 ?auto_31609 ) ) ( IS-CRATE ?auto_31598 ) ( not ( = ?auto_31613 ?auto_31600 ) ) ( not ( = ?auto_31604 ?auto_31613 ) ) ( HOIST-AT ?auto_31608 ?auto_31613 ) ( not ( = ?auto_31610 ?auto_31608 ) ) ( not ( = ?auto_31605 ?auto_31608 ) ) ( AVAILABLE ?auto_31608 ) ( SURFACE-AT ?auto_31598 ?auto_31613 ) ( ON ?auto_31598 ?auto_31603 ) ( CLEAR ?auto_31598 ) ( not ( = ?auto_31598 ?auto_31603 ) ) ( not ( = ?auto_31599 ?auto_31603 ) ) ( not ( = ?auto_31607 ?auto_31603 ) ) ( not ( = ?auto_31609 ?auto_31603 ) ) ( SURFACE-AT ?auto_31602 ?auto_31600 ) ( CLEAR ?auto_31602 ) ( IS-CRATE ?auto_31607 ) ( not ( = ?auto_31602 ?auto_31607 ) ) ( not ( = ?auto_31598 ?auto_31602 ) ) ( not ( = ?auto_31599 ?auto_31602 ) ) ( not ( = ?auto_31609 ?auto_31602 ) ) ( not ( = ?auto_31603 ?auto_31602 ) ) ( AVAILABLE ?auto_31610 ) ( not ( = ?auto_31601 ?auto_31600 ) ) ( not ( = ?auto_31604 ?auto_31601 ) ) ( not ( = ?auto_31613 ?auto_31601 ) ) ( HOIST-AT ?auto_31612 ?auto_31601 ) ( not ( = ?auto_31610 ?auto_31612 ) ) ( not ( = ?auto_31605 ?auto_31612 ) ) ( not ( = ?auto_31608 ?auto_31612 ) ) ( AVAILABLE ?auto_31612 ) ( SURFACE-AT ?auto_31607 ?auto_31601 ) ( ON ?auto_31607 ?auto_31606 ) ( CLEAR ?auto_31607 ) ( not ( = ?auto_31598 ?auto_31606 ) ) ( not ( = ?auto_31599 ?auto_31606 ) ) ( not ( = ?auto_31607 ?auto_31606 ) ) ( not ( = ?auto_31609 ?auto_31606 ) ) ( not ( = ?auto_31603 ?auto_31606 ) ) ( not ( = ?auto_31602 ?auto_31606 ) ) ( TRUCK-AT ?auto_31611 ?auto_31600 ) )
    :subtasks
    ( ( !DRIVE ?auto_31611 ?auto_31600 ?auto_31601 )
      ( MAKE-2CRATE ?auto_31607 ?auto_31598 ?auto_31599 )
      ( MAKE-1CRATE-VERIFY ?auto_31598 ?auto_31599 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31614 - SURFACE
      ?auto_31615 - SURFACE
      ?auto_31616 - SURFACE
    )
    :vars
    (
      ?auto_31626 - HOIST
      ?auto_31623 - PLACE
      ?auto_31617 - PLACE
      ?auto_31625 - HOIST
      ?auto_31620 - SURFACE
      ?auto_31621 - PLACE
      ?auto_31622 - HOIST
      ?auto_31624 - SURFACE
      ?auto_31628 - SURFACE
      ?auto_31618 - PLACE
      ?auto_31627 - HOIST
      ?auto_31619 - SURFACE
      ?auto_31629 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31626 ?auto_31623 ) ( IS-CRATE ?auto_31616 ) ( not ( = ?auto_31615 ?auto_31616 ) ) ( not ( = ?auto_31614 ?auto_31615 ) ) ( not ( = ?auto_31614 ?auto_31616 ) ) ( not ( = ?auto_31617 ?auto_31623 ) ) ( HOIST-AT ?auto_31625 ?auto_31617 ) ( not ( = ?auto_31626 ?auto_31625 ) ) ( AVAILABLE ?auto_31625 ) ( SURFACE-AT ?auto_31616 ?auto_31617 ) ( ON ?auto_31616 ?auto_31620 ) ( CLEAR ?auto_31616 ) ( not ( = ?auto_31615 ?auto_31620 ) ) ( not ( = ?auto_31616 ?auto_31620 ) ) ( not ( = ?auto_31614 ?auto_31620 ) ) ( IS-CRATE ?auto_31615 ) ( not ( = ?auto_31621 ?auto_31623 ) ) ( not ( = ?auto_31617 ?auto_31621 ) ) ( HOIST-AT ?auto_31622 ?auto_31621 ) ( not ( = ?auto_31626 ?auto_31622 ) ) ( not ( = ?auto_31625 ?auto_31622 ) ) ( AVAILABLE ?auto_31622 ) ( SURFACE-AT ?auto_31615 ?auto_31621 ) ( ON ?auto_31615 ?auto_31624 ) ( CLEAR ?auto_31615 ) ( not ( = ?auto_31615 ?auto_31624 ) ) ( not ( = ?auto_31616 ?auto_31624 ) ) ( not ( = ?auto_31614 ?auto_31624 ) ) ( not ( = ?auto_31620 ?auto_31624 ) ) ( SURFACE-AT ?auto_31628 ?auto_31623 ) ( CLEAR ?auto_31628 ) ( IS-CRATE ?auto_31614 ) ( not ( = ?auto_31628 ?auto_31614 ) ) ( not ( = ?auto_31615 ?auto_31628 ) ) ( not ( = ?auto_31616 ?auto_31628 ) ) ( not ( = ?auto_31620 ?auto_31628 ) ) ( not ( = ?auto_31624 ?auto_31628 ) ) ( AVAILABLE ?auto_31626 ) ( not ( = ?auto_31618 ?auto_31623 ) ) ( not ( = ?auto_31617 ?auto_31618 ) ) ( not ( = ?auto_31621 ?auto_31618 ) ) ( HOIST-AT ?auto_31627 ?auto_31618 ) ( not ( = ?auto_31626 ?auto_31627 ) ) ( not ( = ?auto_31625 ?auto_31627 ) ) ( not ( = ?auto_31622 ?auto_31627 ) ) ( AVAILABLE ?auto_31627 ) ( SURFACE-AT ?auto_31614 ?auto_31618 ) ( ON ?auto_31614 ?auto_31619 ) ( CLEAR ?auto_31614 ) ( not ( = ?auto_31615 ?auto_31619 ) ) ( not ( = ?auto_31616 ?auto_31619 ) ) ( not ( = ?auto_31614 ?auto_31619 ) ) ( not ( = ?auto_31620 ?auto_31619 ) ) ( not ( = ?auto_31624 ?auto_31619 ) ) ( not ( = ?auto_31628 ?auto_31619 ) ) ( TRUCK-AT ?auto_31629 ?auto_31623 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31615 ?auto_31616 )
      ( MAKE-2CRATE-VERIFY ?auto_31614 ?auto_31615 ?auto_31616 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31630 - SURFACE
      ?auto_31631 - SURFACE
      ?auto_31632 - SURFACE
      ?auto_31633 - SURFACE
    )
    :vars
    (
      ?auto_31634 - HOIST
      ?auto_31637 - PLACE
      ?auto_31642 - PLACE
      ?auto_31639 - HOIST
      ?auto_31636 - SURFACE
      ?auto_31643 - PLACE
      ?auto_31640 - HOIST
      ?auto_31638 - SURFACE
      ?auto_31635 - PLACE
      ?auto_31641 - HOIST
      ?auto_31645 - SURFACE
      ?auto_31644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31634 ?auto_31637 ) ( IS-CRATE ?auto_31633 ) ( not ( = ?auto_31632 ?auto_31633 ) ) ( not ( = ?auto_31631 ?auto_31632 ) ) ( not ( = ?auto_31631 ?auto_31633 ) ) ( not ( = ?auto_31642 ?auto_31637 ) ) ( HOIST-AT ?auto_31639 ?auto_31642 ) ( not ( = ?auto_31634 ?auto_31639 ) ) ( AVAILABLE ?auto_31639 ) ( SURFACE-AT ?auto_31633 ?auto_31642 ) ( ON ?auto_31633 ?auto_31636 ) ( CLEAR ?auto_31633 ) ( not ( = ?auto_31632 ?auto_31636 ) ) ( not ( = ?auto_31633 ?auto_31636 ) ) ( not ( = ?auto_31631 ?auto_31636 ) ) ( IS-CRATE ?auto_31632 ) ( not ( = ?auto_31643 ?auto_31637 ) ) ( not ( = ?auto_31642 ?auto_31643 ) ) ( HOIST-AT ?auto_31640 ?auto_31643 ) ( not ( = ?auto_31634 ?auto_31640 ) ) ( not ( = ?auto_31639 ?auto_31640 ) ) ( AVAILABLE ?auto_31640 ) ( SURFACE-AT ?auto_31632 ?auto_31643 ) ( ON ?auto_31632 ?auto_31638 ) ( CLEAR ?auto_31632 ) ( not ( = ?auto_31632 ?auto_31638 ) ) ( not ( = ?auto_31633 ?auto_31638 ) ) ( not ( = ?auto_31631 ?auto_31638 ) ) ( not ( = ?auto_31636 ?auto_31638 ) ) ( SURFACE-AT ?auto_31630 ?auto_31637 ) ( CLEAR ?auto_31630 ) ( IS-CRATE ?auto_31631 ) ( not ( = ?auto_31630 ?auto_31631 ) ) ( not ( = ?auto_31632 ?auto_31630 ) ) ( not ( = ?auto_31633 ?auto_31630 ) ) ( not ( = ?auto_31636 ?auto_31630 ) ) ( not ( = ?auto_31638 ?auto_31630 ) ) ( AVAILABLE ?auto_31634 ) ( not ( = ?auto_31635 ?auto_31637 ) ) ( not ( = ?auto_31642 ?auto_31635 ) ) ( not ( = ?auto_31643 ?auto_31635 ) ) ( HOIST-AT ?auto_31641 ?auto_31635 ) ( not ( = ?auto_31634 ?auto_31641 ) ) ( not ( = ?auto_31639 ?auto_31641 ) ) ( not ( = ?auto_31640 ?auto_31641 ) ) ( AVAILABLE ?auto_31641 ) ( SURFACE-AT ?auto_31631 ?auto_31635 ) ( ON ?auto_31631 ?auto_31645 ) ( CLEAR ?auto_31631 ) ( not ( = ?auto_31632 ?auto_31645 ) ) ( not ( = ?auto_31633 ?auto_31645 ) ) ( not ( = ?auto_31631 ?auto_31645 ) ) ( not ( = ?auto_31636 ?auto_31645 ) ) ( not ( = ?auto_31638 ?auto_31645 ) ) ( not ( = ?auto_31630 ?auto_31645 ) ) ( TRUCK-AT ?auto_31644 ?auto_31637 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31631 ?auto_31632 ?auto_31633 )
      ( MAKE-3CRATE-VERIFY ?auto_31630 ?auto_31631 ?auto_31632 ?auto_31633 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31646 - SURFACE
      ?auto_31647 - SURFACE
      ?auto_31648 - SURFACE
      ?auto_31649 - SURFACE
      ?auto_31650 - SURFACE
    )
    :vars
    (
      ?auto_31651 - HOIST
      ?auto_31654 - PLACE
      ?auto_31659 - PLACE
      ?auto_31656 - HOIST
      ?auto_31653 - SURFACE
      ?auto_31660 - PLACE
      ?auto_31657 - HOIST
      ?auto_31655 - SURFACE
      ?auto_31652 - PLACE
      ?auto_31658 - HOIST
      ?auto_31662 - SURFACE
      ?auto_31661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31651 ?auto_31654 ) ( IS-CRATE ?auto_31650 ) ( not ( = ?auto_31649 ?auto_31650 ) ) ( not ( = ?auto_31648 ?auto_31649 ) ) ( not ( = ?auto_31648 ?auto_31650 ) ) ( not ( = ?auto_31659 ?auto_31654 ) ) ( HOIST-AT ?auto_31656 ?auto_31659 ) ( not ( = ?auto_31651 ?auto_31656 ) ) ( AVAILABLE ?auto_31656 ) ( SURFACE-AT ?auto_31650 ?auto_31659 ) ( ON ?auto_31650 ?auto_31653 ) ( CLEAR ?auto_31650 ) ( not ( = ?auto_31649 ?auto_31653 ) ) ( not ( = ?auto_31650 ?auto_31653 ) ) ( not ( = ?auto_31648 ?auto_31653 ) ) ( IS-CRATE ?auto_31649 ) ( not ( = ?auto_31660 ?auto_31654 ) ) ( not ( = ?auto_31659 ?auto_31660 ) ) ( HOIST-AT ?auto_31657 ?auto_31660 ) ( not ( = ?auto_31651 ?auto_31657 ) ) ( not ( = ?auto_31656 ?auto_31657 ) ) ( AVAILABLE ?auto_31657 ) ( SURFACE-AT ?auto_31649 ?auto_31660 ) ( ON ?auto_31649 ?auto_31655 ) ( CLEAR ?auto_31649 ) ( not ( = ?auto_31649 ?auto_31655 ) ) ( not ( = ?auto_31650 ?auto_31655 ) ) ( not ( = ?auto_31648 ?auto_31655 ) ) ( not ( = ?auto_31653 ?auto_31655 ) ) ( SURFACE-AT ?auto_31647 ?auto_31654 ) ( CLEAR ?auto_31647 ) ( IS-CRATE ?auto_31648 ) ( not ( = ?auto_31647 ?auto_31648 ) ) ( not ( = ?auto_31649 ?auto_31647 ) ) ( not ( = ?auto_31650 ?auto_31647 ) ) ( not ( = ?auto_31653 ?auto_31647 ) ) ( not ( = ?auto_31655 ?auto_31647 ) ) ( AVAILABLE ?auto_31651 ) ( not ( = ?auto_31652 ?auto_31654 ) ) ( not ( = ?auto_31659 ?auto_31652 ) ) ( not ( = ?auto_31660 ?auto_31652 ) ) ( HOIST-AT ?auto_31658 ?auto_31652 ) ( not ( = ?auto_31651 ?auto_31658 ) ) ( not ( = ?auto_31656 ?auto_31658 ) ) ( not ( = ?auto_31657 ?auto_31658 ) ) ( AVAILABLE ?auto_31658 ) ( SURFACE-AT ?auto_31648 ?auto_31652 ) ( ON ?auto_31648 ?auto_31662 ) ( CLEAR ?auto_31648 ) ( not ( = ?auto_31649 ?auto_31662 ) ) ( not ( = ?auto_31650 ?auto_31662 ) ) ( not ( = ?auto_31648 ?auto_31662 ) ) ( not ( = ?auto_31653 ?auto_31662 ) ) ( not ( = ?auto_31655 ?auto_31662 ) ) ( not ( = ?auto_31647 ?auto_31662 ) ) ( TRUCK-AT ?auto_31661 ?auto_31654 ) ( ON ?auto_31647 ?auto_31646 ) ( not ( = ?auto_31646 ?auto_31647 ) ) ( not ( = ?auto_31646 ?auto_31648 ) ) ( not ( = ?auto_31646 ?auto_31649 ) ) ( not ( = ?auto_31646 ?auto_31650 ) ) ( not ( = ?auto_31646 ?auto_31653 ) ) ( not ( = ?auto_31646 ?auto_31655 ) ) ( not ( = ?auto_31646 ?auto_31662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31648 ?auto_31649 ?auto_31650 )
      ( MAKE-4CRATE-VERIFY ?auto_31646 ?auto_31647 ?auto_31648 ?auto_31649 ?auto_31650 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31663 - SURFACE
      ?auto_31664 - SURFACE
      ?auto_31665 - SURFACE
      ?auto_31666 - SURFACE
      ?auto_31667 - SURFACE
      ?auto_31668 - SURFACE
    )
    :vars
    (
      ?auto_31669 - HOIST
      ?auto_31672 - PLACE
      ?auto_31677 - PLACE
      ?auto_31674 - HOIST
      ?auto_31671 - SURFACE
      ?auto_31678 - PLACE
      ?auto_31675 - HOIST
      ?auto_31673 - SURFACE
      ?auto_31670 - PLACE
      ?auto_31676 - HOIST
      ?auto_31680 - SURFACE
      ?auto_31679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31669 ?auto_31672 ) ( IS-CRATE ?auto_31668 ) ( not ( = ?auto_31667 ?auto_31668 ) ) ( not ( = ?auto_31666 ?auto_31667 ) ) ( not ( = ?auto_31666 ?auto_31668 ) ) ( not ( = ?auto_31677 ?auto_31672 ) ) ( HOIST-AT ?auto_31674 ?auto_31677 ) ( not ( = ?auto_31669 ?auto_31674 ) ) ( AVAILABLE ?auto_31674 ) ( SURFACE-AT ?auto_31668 ?auto_31677 ) ( ON ?auto_31668 ?auto_31671 ) ( CLEAR ?auto_31668 ) ( not ( = ?auto_31667 ?auto_31671 ) ) ( not ( = ?auto_31668 ?auto_31671 ) ) ( not ( = ?auto_31666 ?auto_31671 ) ) ( IS-CRATE ?auto_31667 ) ( not ( = ?auto_31678 ?auto_31672 ) ) ( not ( = ?auto_31677 ?auto_31678 ) ) ( HOIST-AT ?auto_31675 ?auto_31678 ) ( not ( = ?auto_31669 ?auto_31675 ) ) ( not ( = ?auto_31674 ?auto_31675 ) ) ( AVAILABLE ?auto_31675 ) ( SURFACE-AT ?auto_31667 ?auto_31678 ) ( ON ?auto_31667 ?auto_31673 ) ( CLEAR ?auto_31667 ) ( not ( = ?auto_31667 ?auto_31673 ) ) ( not ( = ?auto_31668 ?auto_31673 ) ) ( not ( = ?auto_31666 ?auto_31673 ) ) ( not ( = ?auto_31671 ?auto_31673 ) ) ( SURFACE-AT ?auto_31665 ?auto_31672 ) ( CLEAR ?auto_31665 ) ( IS-CRATE ?auto_31666 ) ( not ( = ?auto_31665 ?auto_31666 ) ) ( not ( = ?auto_31667 ?auto_31665 ) ) ( not ( = ?auto_31668 ?auto_31665 ) ) ( not ( = ?auto_31671 ?auto_31665 ) ) ( not ( = ?auto_31673 ?auto_31665 ) ) ( AVAILABLE ?auto_31669 ) ( not ( = ?auto_31670 ?auto_31672 ) ) ( not ( = ?auto_31677 ?auto_31670 ) ) ( not ( = ?auto_31678 ?auto_31670 ) ) ( HOIST-AT ?auto_31676 ?auto_31670 ) ( not ( = ?auto_31669 ?auto_31676 ) ) ( not ( = ?auto_31674 ?auto_31676 ) ) ( not ( = ?auto_31675 ?auto_31676 ) ) ( AVAILABLE ?auto_31676 ) ( SURFACE-AT ?auto_31666 ?auto_31670 ) ( ON ?auto_31666 ?auto_31680 ) ( CLEAR ?auto_31666 ) ( not ( = ?auto_31667 ?auto_31680 ) ) ( not ( = ?auto_31668 ?auto_31680 ) ) ( not ( = ?auto_31666 ?auto_31680 ) ) ( not ( = ?auto_31671 ?auto_31680 ) ) ( not ( = ?auto_31673 ?auto_31680 ) ) ( not ( = ?auto_31665 ?auto_31680 ) ) ( TRUCK-AT ?auto_31679 ?auto_31672 ) ( ON ?auto_31664 ?auto_31663 ) ( ON ?auto_31665 ?auto_31664 ) ( not ( = ?auto_31663 ?auto_31664 ) ) ( not ( = ?auto_31663 ?auto_31665 ) ) ( not ( = ?auto_31663 ?auto_31666 ) ) ( not ( = ?auto_31663 ?auto_31667 ) ) ( not ( = ?auto_31663 ?auto_31668 ) ) ( not ( = ?auto_31663 ?auto_31671 ) ) ( not ( = ?auto_31663 ?auto_31673 ) ) ( not ( = ?auto_31663 ?auto_31680 ) ) ( not ( = ?auto_31664 ?auto_31665 ) ) ( not ( = ?auto_31664 ?auto_31666 ) ) ( not ( = ?auto_31664 ?auto_31667 ) ) ( not ( = ?auto_31664 ?auto_31668 ) ) ( not ( = ?auto_31664 ?auto_31671 ) ) ( not ( = ?auto_31664 ?auto_31673 ) ) ( not ( = ?auto_31664 ?auto_31680 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31666 ?auto_31667 ?auto_31668 )
      ( MAKE-5CRATE-VERIFY ?auto_31663 ?auto_31664 ?auto_31665 ?auto_31666 ?auto_31667 ?auto_31668 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31681 - SURFACE
      ?auto_31682 - SURFACE
    )
    :vars
    (
      ?auto_31683 - HOIST
      ?auto_31686 - PLACE
      ?auto_31687 - SURFACE
      ?auto_31693 - PLACE
      ?auto_31689 - HOIST
      ?auto_31685 - SURFACE
      ?auto_31694 - PLACE
      ?auto_31690 - HOIST
      ?auto_31688 - SURFACE
      ?auto_31691 - SURFACE
      ?auto_31684 - PLACE
      ?auto_31692 - HOIST
      ?auto_31696 - SURFACE
      ?auto_31695 - TRUCK
      ?auto_31697 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31683 ?auto_31686 ) ( IS-CRATE ?auto_31682 ) ( not ( = ?auto_31681 ?auto_31682 ) ) ( not ( = ?auto_31687 ?auto_31681 ) ) ( not ( = ?auto_31687 ?auto_31682 ) ) ( not ( = ?auto_31693 ?auto_31686 ) ) ( HOIST-AT ?auto_31689 ?auto_31693 ) ( not ( = ?auto_31683 ?auto_31689 ) ) ( AVAILABLE ?auto_31689 ) ( SURFACE-AT ?auto_31682 ?auto_31693 ) ( ON ?auto_31682 ?auto_31685 ) ( CLEAR ?auto_31682 ) ( not ( = ?auto_31681 ?auto_31685 ) ) ( not ( = ?auto_31682 ?auto_31685 ) ) ( not ( = ?auto_31687 ?auto_31685 ) ) ( IS-CRATE ?auto_31681 ) ( not ( = ?auto_31694 ?auto_31686 ) ) ( not ( = ?auto_31693 ?auto_31694 ) ) ( HOIST-AT ?auto_31690 ?auto_31694 ) ( not ( = ?auto_31683 ?auto_31690 ) ) ( not ( = ?auto_31689 ?auto_31690 ) ) ( AVAILABLE ?auto_31690 ) ( SURFACE-AT ?auto_31681 ?auto_31694 ) ( ON ?auto_31681 ?auto_31688 ) ( CLEAR ?auto_31681 ) ( not ( = ?auto_31681 ?auto_31688 ) ) ( not ( = ?auto_31682 ?auto_31688 ) ) ( not ( = ?auto_31687 ?auto_31688 ) ) ( not ( = ?auto_31685 ?auto_31688 ) ) ( IS-CRATE ?auto_31687 ) ( not ( = ?auto_31691 ?auto_31687 ) ) ( not ( = ?auto_31681 ?auto_31691 ) ) ( not ( = ?auto_31682 ?auto_31691 ) ) ( not ( = ?auto_31685 ?auto_31691 ) ) ( not ( = ?auto_31688 ?auto_31691 ) ) ( not ( = ?auto_31684 ?auto_31686 ) ) ( not ( = ?auto_31693 ?auto_31684 ) ) ( not ( = ?auto_31694 ?auto_31684 ) ) ( HOIST-AT ?auto_31692 ?auto_31684 ) ( not ( = ?auto_31683 ?auto_31692 ) ) ( not ( = ?auto_31689 ?auto_31692 ) ) ( not ( = ?auto_31690 ?auto_31692 ) ) ( AVAILABLE ?auto_31692 ) ( SURFACE-AT ?auto_31687 ?auto_31684 ) ( ON ?auto_31687 ?auto_31696 ) ( CLEAR ?auto_31687 ) ( not ( = ?auto_31681 ?auto_31696 ) ) ( not ( = ?auto_31682 ?auto_31696 ) ) ( not ( = ?auto_31687 ?auto_31696 ) ) ( not ( = ?auto_31685 ?auto_31696 ) ) ( not ( = ?auto_31688 ?auto_31696 ) ) ( not ( = ?auto_31691 ?auto_31696 ) ) ( TRUCK-AT ?auto_31695 ?auto_31686 ) ( SURFACE-AT ?auto_31697 ?auto_31686 ) ( CLEAR ?auto_31697 ) ( LIFTING ?auto_31683 ?auto_31691 ) ( IS-CRATE ?auto_31691 ) ( not ( = ?auto_31697 ?auto_31691 ) ) ( not ( = ?auto_31681 ?auto_31697 ) ) ( not ( = ?auto_31682 ?auto_31697 ) ) ( not ( = ?auto_31687 ?auto_31697 ) ) ( not ( = ?auto_31685 ?auto_31697 ) ) ( not ( = ?auto_31688 ?auto_31697 ) ) ( not ( = ?auto_31696 ?auto_31697 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31697 ?auto_31691 )
      ( MAKE-2CRATE ?auto_31687 ?auto_31681 ?auto_31682 )
      ( MAKE-1CRATE-VERIFY ?auto_31681 ?auto_31682 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31698 - SURFACE
      ?auto_31699 - SURFACE
      ?auto_31700 - SURFACE
    )
    :vars
    (
      ?auto_31705 - HOIST
      ?auto_31710 - PLACE
      ?auto_31709 - PLACE
      ?auto_31711 - HOIST
      ?auto_31704 - SURFACE
      ?auto_31703 - PLACE
      ?auto_31713 - HOIST
      ?auto_31702 - SURFACE
      ?auto_31712 - SURFACE
      ?auto_31706 - PLACE
      ?auto_31701 - HOIST
      ?auto_31707 - SURFACE
      ?auto_31714 - TRUCK
      ?auto_31708 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31705 ?auto_31710 ) ( IS-CRATE ?auto_31700 ) ( not ( = ?auto_31699 ?auto_31700 ) ) ( not ( = ?auto_31698 ?auto_31699 ) ) ( not ( = ?auto_31698 ?auto_31700 ) ) ( not ( = ?auto_31709 ?auto_31710 ) ) ( HOIST-AT ?auto_31711 ?auto_31709 ) ( not ( = ?auto_31705 ?auto_31711 ) ) ( AVAILABLE ?auto_31711 ) ( SURFACE-AT ?auto_31700 ?auto_31709 ) ( ON ?auto_31700 ?auto_31704 ) ( CLEAR ?auto_31700 ) ( not ( = ?auto_31699 ?auto_31704 ) ) ( not ( = ?auto_31700 ?auto_31704 ) ) ( not ( = ?auto_31698 ?auto_31704 ) ) ( IS-CRATE ?auto_31699 ) ( not ( = ?auto_31703 ?auto_31710 ) ) ( not ( = ?auto_31709 ?auto_31703 ) ) ( HOIST-AT ?auto_31713 ?auto_31703 ) ( not ( = ?auto_31705 ?auto_31713 ) ) ( not ( = ?auto_31711 ?auto_31713 ) ) ( AVAILABLE ?auto_31713 ) ( SURFACE-AT ?auto_31699 ?auto_31703 ) ( ON ?auto_31699 ?auto_31702 ) ( CLEAR ?auto_31699 ) ( not ( = ?auto_31699 ?auto_31702 ) ) ( not ( = ?auto_31700 ?auto_31702 ) ) ( not ( = ?auto_31698 ?auto_31702 ) ) ( not ( = ?auto_31704 ?auto_31702 ) ) ( IS-CRATE ?auto_31698 ) ( not ( = ?auto_31712 ?auto_31698 ) ) ( not ( = ?auto_31699 ?auto_31712 ) ) ( not ( = ?auto_31700 ?auto_31712 ) ) ( not ( = ?auto_31704 ?auto_31712 ) ) ( not ( = ?auto_31702 ?auto_31712 ) ) ( not ( = ?auto_31706 ?auto_31710 ) ) ( not ( = ?auto_31709 ?auto_31706 ) ) ( not ( = ?auto_31703 ?auto_31706 ) ) ( HOIST-AT ?auto_31701 ?auto_31706 ) ( not ( = ?auto_31705 ?auto_31701 ) ) ( not ( = ?auto_31711 ?auto_31701 ) ) ( not ( = ?auto_31713 ?auto_31701 ) ) ( AVAILABLE ?auto_31701 ) ( SURFACE-AT ?auto_31698 ?auto_31706 ) ( ON ?auto_31698 ?auto_31707 ) ( CLEAR ?auto_31698 ) ( not ( = ?auto_31699 ?auto_31707 ) ) ( not ( = ?auto_31700 ?auto_31707 ) ) ( not ( = ?auto_31698 ?auto_31707 ) ) ( not ( = ?auto_31704 ?auto_31707 ) ) ( not ( = ?auto_31702 ?auto_31707 ) ) ( not ( = ?auto_31712 ?auto_31707 ) ) ( TRUCK-AT ?auto_31714 ?auto_31710 ) ( SURFACE-AT ?auto_31708 ?auto_31710 ) ( CLEAR ?auto_31708 ) ( LIFTING ?auto_31705 ?auto_31712 ) ( IS-CRATE ?auto_31712 ) ( not ( = ?auto_31708 ?auto_31712 ) ) ( not ( = ?auto_31699 ?auto_31708 ) ) ( not ( = ?auto_31700 ?auto_31708 ) ) ( not ( = ?auto_31698 ?auto_31708 ) ) ( not ( = ?auto_31704 ?auto_31708 ) ) ( not ( = ?auto_31702 ?auto_31708 ) ) ( not ( = ?auto_31707 ?auto_31708 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31699 ?auto_31700 )
      ( MAKE-2CRATE-VERIFY ?auto_31698 ?auto_31699 ?auto_31700 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31715 - SURFACE
      ?auto_31716 - SURFACE
      ?auto_31717 - SURFACE
      ?auto_31718 - SURFACE
    )
    :vars
    (
      ?auto_31731 - HOIST
      ?auto_31725 - PLACE
      ?auto_31719 - PLACE
      ?auto_31724 - HOIST
      ?auto_31720 - SURFACE
      ?auto_31721 - PLACE
      ?auto_31726 - HOIST
      ?auto_31730 - SURFACE
      ?auto_31722 - PLACE
      ?auto_31728 - HOIST
      ?auto_31729 - SURFACE
      ?auto_31723 - TRUCK
      ?auto_31727 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31731 ?auto_31725 ) ( IS-CRATE ?auto_31718 ) ( not ( = ?auto_31717 ?auto_31718 ) ) ( not ( = ?auto_31716 ?auto_31717 ) ) ( not ( = ?auto_31716 ?auto_31718 ) ) ( not ( = ?auto_31719 ?auto_31725 ) ) ( HOIST-AT ?auto_31724 ?auto_31719 ) ( not ( = ?auto_31731 ?auto_31724 ) ) ( AVAILABLE ?auto_31724 ) ( SURFACE-AT ?auto_31718 ?auto_31719 ) ( ON ?auto_31718 ?auto_31720 ) ( CLEAR ?auto_31718 ) ( not ( = ?auto_31717 ?auto_31720 ) ) ( not ( = ?auto_31718 ?auto_31720 ) ) ( not ( = ?auto_31716 ?auto_31720 ) ) ( IS-CRATE ?auto_31717 ) ( not ( = ?auto_31721 ?auto_31725 ) ) ( not ( = ?auto_31719 ?auto_31721 ) ) ( HOIST-AT ?auto_31726 ?auto_31721 ) ( not ( = ?auto_31731 ?auto_31726 ) ) ( not ( = ?auto_31724 ?auto_31726 ) ) ( AVAILABLE ?auto_31726 ) ( SURFACE-AT ?auto_31717 ?auto_31721 ) ( ON ?auto_31717 ?auto_31730 ) ( CLEAR ?auto_31717 ) ( not ( = ?auto_31717 ?auto_31730 ) ) ( not ( = ?auto_31718 ?auto_31730 ) ) ( not ( = ?auto_31716 ?auto_31730 ) ) ( not ( = ?auto_31720 ?auto_31730 ) ) ( IS-CRATE ?auto_31716 ) ( not ( = ?auto_31715 ?auto_31716 ) ) ( not ( = ?auto_31717 ?auto_31715 ) ) ( not ( = ?auto_31718 ?auto_31715 ) ) ( not ( = ?auto_31720 ?auto_31715 ) ) ( not ( = ?auto_31730 ?auto_31715 ) ) ( not ( = ?auto_31722 ?auto_31725 ) ) ( not ( = ?auto_31719 ?auto_31722 ) ) ( not ( = ?auto_31721 ?auto_31722 ) ) ( HOIST-AT ?auto_31728 ?auto_31722 ) ( not ( = ?auto_31731 ?auto_31728 ) ) ( not ( = ?auto_31724 ?auto_31728 ) ) ( not ( = ?auto_31726 ?auto_31728 ) ) ( AVAILABLE ?auto_31728 ) ( SURFACE-AT ?auto_31716 ?auto_31722 ) ( ON ?auto_31716 ?auto_31729 ) ( CLEAR ?auto_31716 ) ( not ( = ?auto_31717 ?auto_31729 ) ) ( not ( = ?auto_31718 ?auto_31729 ) ) ( not ( = ?auto_31716 ?auto_31729 ) ) ( not ( = ?auto_31720 ?auto_31729 ) ) ( not ( = ?auto_31730 ?auto_31729 ) ) ( not ( = ?auto_31715 ?auto_31729 ) ) ( TRUCK-AT ?auto_31723 ?auto_31725 ) ( SURFACE-AT ?auto_31727 ?auto_31725 ) ( CLEAR ?auto_31727 ) ( LIFTING ?auto_31731 ?auto_31715 ) ( IS-CRATE ?auto_31715 ) ( not ( = ?auto_31727 ?auto_31715 ) ) ( not ( = ?auto_31717 ?auto_31727 ) ) ( not ( = ?auto_31718 ?auto_31727 ) ) ( not ( = ?auto_31716 ?auto_31727 ) ) ( not ( = ?auto_31720 ?auto_31727 ) ) ( not ( = ?auto_31730 ?auto_31727 ) ) ( not ( = ?auto_31729 ?auto_31727 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31716 ?auto_31717 ?auto_31718 )
      ( MAKE-3CRATE-VERIFY ?auto_31715 ?auto_31716 ?auto_31717 ?auto_31718 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31732 - SURFACE
      ?auto_31733 - SURFACE
      ?auto_31734 - SURFACE
      ?auto_31735 - SURFACE
      ?auto_31736 - SURFACE
    )
    :vars
    (
      ?auto_31748 - HOIST
      ?auto_31743 - PLACE
      ?auto_31737 - PLACE
      ?auto_31742 - HOIST
      ?auto_31738 - SURFACE
      ?auto_31739 - PLACE
      ?auto_31744 - HOIST
      ?auto_31747 - SURFACE
      ?auto_31740 - PLACE
      ?auto_31745 - HOIST
      ?auto_31746 - SURFACE
      ?auto_31741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31748 ?auto_31743 ) ( IS-CRATE ?auto_31736 ) ( not ( = ?auto_31735 ?auto_31736 ) ) ( not ( = ?auto_31734 ?auto_31735 ) ) ( not ( = ?auto_31734 ?auto_31736 ) ) ( not ( = ?auto_31737 ?auto_31743 ) ) ( HOIST-AT ?auto_31742 ?auto_31737 ) ( not ( = ?auto_31748 ?auto_31742 ) ) ( AVAILABLE ?auto_31742 ) ( SURFACE-AT ?auto_31736 ?auto_31737 ) ( ON ?auto_31736 ?auto_31738 ) ( CLEAR ?auto_31736 ) ( not ( = ?auto_31735 ?auto_31738 ) ) ( not ( = ?auto_31736 ?auto_31738 ) ) ( not ( = ?auto_31734 ?auto_31738 ) ) ( IS-CRATE ?auto_31735 ) ( not ( = ?auto_31739 ?auto_31743 ) ) ( not ( = ?auto_31737 ?auto_31739 ) ) ( HOIST-AT ?auto_31744 ?auto_31739 ) ( not ( = ?auto_31748 ?auto_31744 ) ) ( not ( = ?auto_31742 ?auto_31744 ) ) ( AVAILABLE ?auto_31744 ) ( SURFACE-AT ?auto_31735 ?auto_31739 ) ( ON ?auto_31735 ?auto_31747 ) ( CLEAR ?auto_31735 ) ( not ( = ?auto_31735 ?auto_31747 ) ) ( not ( = ?auto_31736 ?auto_31747 ) ) ( not ( = ?auto_31734 ?auto_31747 ) ) ( not ( = ?auto_31738 ?auto_31747 ) ) ( IS-CRATE ?auto_31734 ) ( not ( = ?auto_31733 ?auto_31734 ) ) ( not ( = ?auto_31735 ?auto_31733 ) ) ( not ( = ?auto_31736 ?auto_31733 ) ) ( not ( = ?auto_31738 ?auto_31733 ) ) ( not ( = ?auto_31747 ?auto_31733 ) ) ( not ( = ?auto_31740 ?auto_31743 ) ) ( not ( = ?auto_31737 ?auto_31740 ) ) ( not ( = ?auto_31739 ?auto_31740 ) ) ( HOIST-AT ?auto_31745 ?auto_31740 ) ( not ( = ?auto_31748 ?auto_31745 ) ) ( not ( = ?auto_31742 ?auto_31745 ) ) ( not ( = ?auto_31744 ?auto_31745 ) ) ( AVAILABLE ?auto_31745 ) ( SURFACE-AT ?auto_31734 ?auto_31740 ) ( ON ?auto_31734 ?auto_31746 ) ( CLEAR ?auto_31734 ) ( not ( = ?auto_31735 ?auto_31746 ) ) ( not ( = ?auto_31736 ?auto_31746 ) ) ( not ( = ?auto_31734 ?auto_31746 ) ) ( not ( = ?auto_31738 ?auto_31746 ) ) ( not ( = ?auto_31747 ?auto_31746 ) ) ( not ( = ?auto_31733 ?auto_31746 ) ) ( TRUCK-AT ?auto_31741 ?auto_31743 ) ( SURFACE-AT ?auto_31732 ?auto_31743 ) ( CLEAR ?auto_31732 ) ( LIFTING ?auto_31748 ?auto_31733 ) ( IS-CRATE ?auto_31733 ) ( not ( = ?auto_31732 ?auto_31733 ) ) ( not ( = ?auto_31735 ?auto_31732 ) ) ( not ( = ?auto_31736 ?auto_31732 ) ) ( not ( = ?auto_31734 ?auto_31732 ) ) ( not ( = ?auto_31738 ?auto_31732 ) ) ( not ( = ?auto_31747 ?auto_31732 ) ) ( not ( = ?auto_31746 ?auto_31732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31734 ?auto_31735 ?auto_31736 )
      ( MAKE-4CRATE-VERIFY ?auto_31732 ?auto_31733 ?auto_31734 ?auto_31735 ?auto_31736 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31749 - SURFACE
      ?auto_31750 - SURFACE
      ?auto_31751 - SURFACE
      ?auto_31752 - SURFACE
      ?auto_31753 - SURFACE
      ?auto_31754 - SURFACE
    )
    :vars
    (
      ?auto_31766 - HOIST
      ?auto_31761 - PLACE
      ?auto_31755 - PLACE
      ?auto_31760 - HOIST
      ?auto_31756 - SURFACE
      ?auto_31757 - PLACE
      ?auto_31762 - HOIST
      ?auto_31765 - SURFACE
      ?auto_31758 - PLACE
      ?auto_31763 - HOIST
      ?auto_31764 - SURFACE
      ?auto_31759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31766 ?auto_31761 ) ( IS-CRATE ?auto_31754 ) ( not ( = ?auto_31753 ?auto_31754 ) ) ( not ( = ?auto_31752 ?auto_31753 ) ) ( not ( = ?auto_31752 ?auto_31754 ) ) ( not ( = ?auto_31755 ?auto_31761 ) ) ( HOIST-AT ?auto_31760 ?auto_31755 ) ( not ( = ?auto_31766 ?auto_31760 ) ) ( AVAILABLE ?auto_31760 ) ( SURFACE-AT ?auto_31754 ?auto_31755 ) ( ON ?auto_31754 ?auto_31756 ) ( CLEAR ?auto_31754 ) ( not ( = ?auto_31753 ?auto_31756 ) ) ( not ( = ?auto_31754 ?auto_31756 ) ) ( not ( = ?auto_31752 ?auto_31756 ) ) ( IS-CRATE ?auto_31753 ) ( not ( = ?auto_31757 ?auto_31761 ) ) ( not ( = ?auto_31755 ?auto_31757 ) ) ( HOIST-AT ?auto_31762 ?auto_31757 ) ( not ( = ?auto_31766 ?auto_31762 ) ) ( not ( = ?auto_31760 ?auto_31762 ) ) ( AVAILABLE ?auto_31762 ) ( SURFACE-AT ?auto_31753 ?auto_31757 ) ( ON ?auto_31753 ?auto_31765 ) ( CLEAR ?auto_31753 ) ( not ( = ?auto_31753 ?auto_31765 ) ) ( not ( = ?auto_31754 ?auto_31765 ) ) ( not ( = ?auto_31752 ?auto_31765 ) ) ( not ( = ?auto_31756 ?auto_31765 ) ) ( IS-CRATE ?auto_31752 ) ( not ( = ?auto_31751 ?auto_31752 ) ) ( not ( = ?auto_31753 ?auto_31751 ) ) ( not ( = ?auto_31754 ?auto_31751 ) ) ( not ( = ?auto_31756 ?auto_31751 ) ) ( not ( = ?auto_31765 ?auto_31751 ) ) ( not ( = ?auto_31758 ?auto_31761 ) ) ( not ( = ?auto_31755 ?auto_31758 ) ) ( not ( = ?auto_31757 ?auto_31758 ) ) ( HOIST-AT ?auto_31763 ?auto_31758 ) ( not ( = ?auto_31766 ?auto_31763 ) ) ( not ( = ?auto_31760 ?auto_31763 ) ) ( not ( = ?auto_31762 ?auto_31763 ) ) ( AVAILABLE ?auto_31763 ) ( SURFACE-AT ?auto_31752 ?auto_31758 ) ( ON ?auto_31752 ?auto_31764 ) ( CLEAR ?auto_31752 ) ( not ( = ?auto_31753 ?auto_31764 ) ) ( not ( = ?auto_31754 ?auto_31764 ) ) ( not ( = ?auto_31752 ?auto_31764 ) ) ( not ( = ?auto_31756 ?auto_31764 ) ) ( not ( = ?auto_31765 ?auto_31764 ) ) ( not ( = ?auto_31751 ?auto_31764 ) ) ( TRUCK-AT ?auto_31759 ?auto_31761 ) ( SURFACE-AT ?auto_31750 ?auto_31761 ) ( CLEAR ?auto_31750 ) ( LIFTING ?auto_31766 ?auto_31751 ) ( IS-CRATE ?auto_31751 ) ( not ( = ?auto_31750 ?auto_31751 ) ) ( not ( = ?auto_31753 ?auto_31750 ) ) ( not ( = ?auto_31754 ?auto_31750 ) ) ( not ( = ?auto_31752 ?auto_31750 ) ) ( not ( = ?auto_31756 ?auto_31750 ) ) ( not ( = ?auto_31765 ?auto_31750 ) ) ( not ( = ?auto_31764 ?auto_31750 ) ) ( ON ?auto_31750 ?auto_31749 ) ( not ( = ?auto_31749 ?auto_31750 ) ) ( not ( = ?auto_31749 ?auto_31751 ) ) ( not ( = ?auto_31749 ?auto_31752 ) ) ( not ( = ?auto_31749 ?auto_31753 ) ) ( not ( = ?auto_31749 ?auto_31754 ) ) ( not ( = ?auto_31749 ?auto_31756 ) ) ( not ( = ?auto_31749 ?auto_31765 ) ) ( not ( = ?auto_31749 ?auto_31764 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31752 ?auto_31753 ?auto_31754 )
      ( MAKE-5CRATE-VERIFY ?auto_31749 ?auto_31750 ?auto_31751 ?auto_31752 ?auto_31753 ?auto_31754 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31767 - SURFACE
      ?auto_31768 - SURFACE
    )
    :vars
    (
      ?auto_31783 - HOIST
      ?auto_31775 - PLACE
      ?auto_31778 - SURFACE
      ?auto_31769 - PLACE
      ?auto_31774 - HOIST
      ?auto_31770 - SURFACE
      ?auto_31771 - PLACE
      ?auto_31776 - HOIST
      ?auto_31782 - SURFACE
      ?auto_31777 - SURFACE
      ?auto_31772 - PLACE
      ?auto_31780 - HOIST
      ?auto_31781 - SURFACE
      ?auto_31773 - TRUCK
      ?auto_31779 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31783 ?auto_31775 ) ( IS-CRATE ?auto_31768 ) ( not ( = ?auto_31767 ?auto_31768 ) ) ( not ( = ?auto_31778 ?auto_31767 ) ) ( not ( = ?auto_31778 ?auto_31768 ) ) ( not ( = ?auto_31769 ?auto_31775 ) ) ( HOIST-AT ?auto_31774 ?auto_31769 ) ( not ( = ?auto_31783 ?auto_31774 ) ) ( AVAILABLE ?auto_31774 ) ( SURFACE-AT ?auto_31768 ?auto_31769 ) ( ON ?auto_31768 ?auto_31770 ) ( CLEAR ?auto_31768 ) ( not ( = ?auto_31767 ?auto_31770 ) ) ( not ( = ?auto_31768 ?auto_31770 ) ) ( not ( = ?auto_31778 ?auto_31770 ) ) ( IS-CRATE ?auto_31767 ) ( not ( = ?auto_31771 ?auto_31775 ) ) ( not ( = ?auto_31769 ?auto_31771 ) ) ( HOIST-AT ?auto_31776 ?auto_31771 ) ( not ( = ?auto_31783 ?auto_31776 ) ) ( not ( = ?auto_31774 ?auto_31776 ) ) ( AVAILABLE ?auto_31776 ) ( SURFACE-AT ?auto_31767 ?auto_31771 ) ( ON ?auto_31767 ?auto_31782 ) ( CLEAR ?auto_31767 ) ( not ( = ?auto_31767 ?auto_31782 ) ) ( not ( = ?auto_31768 ?auto_31782 ) ) ( not ( = ?auto_31778 ?auto_31782 ) ) ( not ( = ?auto_31770 ?auto_31782 ) ) ( IS-CRATE ?auto_31778 ) ( not ( = ?auto_31777 ?auto_31778 ) ) ( not ( = ?auto_31767 ?auto_31777 ) ) ( not ( = ?auto_31768 ?auto_31777 ) ) ( not ( = ?auto_31770 ?auto_31777 ) ) ( not ( = ?auto_31782 ?auto_31777 ) ) ( not ( = ?auto_31772 ?auto_31775 ) ) ( not ( = ?auto_31769 ?auto_31772 ) ) ( not ( = ?auto_31771 ?auto_31772 ) ) ( HOIST-AT ?auto_31780 ?auto_31772 ) ( not ( = ?auto_31783 ?auto_31780 ) ) ( not ( = ?auto_31774 ?auto_31780 ) ) ( not ( = ?auto_31776 ?auto_31780 ) ) ( AVAILABLE ?auto_31780 ) ( SURFACE-AT ?auto_31778 ?auto_31772 ) ( ON ?auto_31778 ?auto_31781 ) ( CLEAR ?auto_31778 ) ( not ( = ?auto_31767 ?auto_31781 ) ) ( not ( = ?auto_31768 ?auto_31781 ) ) ( not ( = ?auto_31778 ?auto_31781 ) ) ( not ( = ?auto_31770 ?auto_31781 ) ) ( not ( = ?auto_31782 ?auto_31781 ) ) ( not ( = ?auto_31777 ?auto_31781 ) ) ( TRUCK-AT ?auto_31773 ?auto_31775 ) ( SURFACE-AT ?auto_31779 ?auto_31775 ) ( CLEAR ?auto_31779 ) ( IS-CRATE ?auto_31777 ) ( not ( = ?auto_31779 ?auto_31777 ) ) ( not ( = ?auto_31767 ?auto_31779 ) ) ( not ( = ?auto_31768 ?auto_31779 ) ) ( not ( = ?auto_31778 ?auto_31779 ) ) ( not ( = ?auto_31770 ?auto_31779 ) ) ( not ( = ?auto_31782 ?auto_31779 ) ) ( not ( = ?auto_31781 ?auto_31779 ) ) ( AVAILABLE ?auto_31783 ) ( IN ?auto_31777 ?auto_31773 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31783 ?auto_31777 ?auto_31773 ?auto_31775 )
      ( MAKE-2CRATE ?auto_31778 ?auto_31767 ?auto_31768 )
      ( MAKE-1CRATE-VERIFY ?auto_31767 ?auto_31768 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31784 - SURFACE
      ?auto_31785 - SURFACE
      ?auto_31786 - SURFACE
    )
    :vars
    (
      ?auto_31797 - HOIST
      ?auto_31787 - PLACE
      ?auto_31790 - PLACE
      ?auto_31800 - HOIST
      ?auto_31788 - SURFACE
      ?auto_31795 - PLACE
      ?auto_31791 - HOIST
      ?auto_31794 - SURFACE
      ?auto_31798 - SURFACE
      ?auto_31796 - PLACE
      ?auto_31792 - HOIST
      ?auto_31793 - SURFACE
      ?auto_31799 - TRUCK
      ?auto_31789 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31797 ?auto_31787 ) ( IS-CRATE ?auto_31786 ) ( not ( = ?auto_31785 ?auto_31786 ) ) ( not ( = ?auto_31784 ?auto_31785 ) ) ( not ( = ?auto_31784 ?auto_31786 ) ) ( not ( = ?auto_31790 ?auto_31787 ) ) ( HOIST-AT ?auto_31800 ?auto_31790 ) ( not ( = ?auto_31797 ?auto_31800 ) ) ( AVAILABLE ?auto_31800 ) ( SURFACE-AT ?auto_31786 ?auto_31790 ) ( ON ?auto_31786 ?auto_31788 ) ( CLEAR ?auto_31786 ) ( not ( = ?auto_31785 ?auto_31788 ) ) ( not ( = ?auto_31786 ?auto_31788 ) ) ( not ( = ?auto_31784 ?auto_31788 ) ) ( IS-CRATE ?auto_31785 ) ( not ( = ?auto_31795 ?auto_31787 ) ) ( not ( = ?auto_31790 ?auto_31795 ) ) ( HOIST-AT ?auto_31791 ?auto_31795 ) ( not ( = ?auto_31797 ?auto_31791 ) ) ( not ( = ?auto_31800 ?auto_31791 ) ) ( AVAILABLE ?auto_31791 ) ( SURFACE-AT ?auto_31785 ?auto_31795 ) ( ON ?auto_31785 ?auto_31794 ) ( CLEAR ?auto_31785 ) ( not ( = ?auto_31785 ?auto_31794 ) ) ( not ( = ?auto_31786 ?auto_31794 ) ) ( not ( = ?auto_31784 ?auto_31794 ) ) ( not ( = ?auto_31788 ?auto_31794 ) ) ( IS-CRATE ?auto_31784 ) ( not ( = ?auto_31798 ?auto_31784 ) ) ( not ( = ?auto_31785 ?auto_31798 ) ) ( not ( = ?auto_31786 ?auto_31798 ) ) ( not ( = ?auto_31788 ?auto_31798 ) ) ( not ( = ?auto_31794 ?auto_31798 ) ) ( not ( = ?auto_31796 ?auto_31787 ) ) ( not ( = ?auto_31790 ?auto_31796 ) ) ( not ( = ?auto_31795 ?auto_31796 ) ) ( HOIST-AT ?auto_31792 ?auto_31796 ) ( not ( = ?auto_31797 ?auto_31792 ) ) ( not ( = ?auto_31800 ?auto_31792 ) ) ( not ( = ?auto_31791 ?auto_31792 ) ) ( AVAILABLE ?auto_31792 ) ( SURFACE-AT ?auto_31784 ?auto_31796 ) ( ON ?auto_31784 ?auto_31793 ) ( CLEAR ?auto_31784 ) ( not ( = ?auto_31785 ?auto_31793 ) ) ( not ( = ?auto_31786 ?auto_31793 ) ) ( not ( = ?auto_31784 ?auto_31793 ) ) ( not ( = ?auto_31788 ?auto_31793 ) ) ( not ( = ?auto_31794 ?auto_31793 ) ) ( not ( = ?auto_31798 ?auto_31793 ) ) ( TRUCK-AT ?auto_31799 ?auto_31787 ) ( SURFACE-AT ?auto_31789 ?auto_31787 ) ( CLEAR ?auto_31789 ) ( IS-CRATE ?auto_31798 ) ( not ( = ?auto_31789 ?auto_31798 ) ) ( not ( = ?auto_31785 ?auto_31789 ) ) ( not ( = ?auto_31786 ?auto_31789 ) ) ( not ( = ?auto_31784 ?auto_31789 ) ) ( not ( = ?auto_31788 ?auto_31789 ) ) ( not ( = ?auto_31794 ?auto_31789 ) ) ( not ( = ?auto_31793 ?auto_31789 ) ) ( AVAILABLE ?auto_31797 ) ( IN ?auto_31798 ?auto_31799 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31785 ?auto_31786 )
      ( MAKE-2CRATE-VERIFY ?auto_31784 ?auto_31785 ?auto_31786 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31801 - SURFACE
      ?auto_31802 - SURFACE
      ?auto_31803 - SURFACE
      ?auto_31804 - SURFACE
    )
    :vars
    (
      ?auto_31810 - HOIST
      ?auto_31812 - PLACE
      ?auto_31817 - PLACE
      ?auto_31813 - HOIST
      ?auto_31815 - SURFACE
      ?auto_31808 - PLACE
      ?auto_31809 - HOIST
      ?auto_31814 - SURFACE
      ?auto_31805 - PLACE
      ?auto_31807 - HOIST
      ?auto_31806 - SURFACE
      ?auto_31811 - TRUCK
      ?auto_31816 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31810 ?auto_31812 ) ( IS-CRATE ?auto_31804 ) ( not ( = ?auto_31803 ?auto_31804 ) ) ( not ( = ?auto_31802 ?auto_31803 ) ) ( not ( = ?auto_31802 ?auto_31804 ) ) ( not ( = ?auto_31817 ?auto_31812 ) ) ( HOIST-AT ?auto_31813 ?auto_31817 ) ( not ( = ?auto_31810 ?auto_31813 ) ) ( AVAILABLE ?auto_31813 ) ( SURFACE-AT ?auto_31804 ?auto_31817 ) ( ON ?auto_31804 ?auto_31815 ) ( CLEAR ?auto_31804 ) ( not ( = ?auto_31803 ?auto_31815 ) ) ( not ( = ?auto_31804 ?auto_31815 ) ) ( not ( = ?auto_31802 ?auto_31815 ) ) ( IS-CRATE ?auto_31803 ) ( not ( = ?auto_31808 ?auto_31812 ) ) ( not ( = ?auto_31817 ?auto_31808 ) ) ( HOIST-AT ?auto_31809 ?auto_31808 ) ( not ( = ?auto_31810 ?auto_31809 ) ) ( not ( = ?auto_31813 ?auto_31809 ) ) ( AVAILABLE ?auto_31809 ) ( SURFACE-AT ?auto_31803 ?auto_31808 ) ( ON ?auto_31803 ?auto_31814 ) ( CLEAR ?auto_31803 ) ( not ( = ?auto_31803 ?auto_31814 ) ) ( not ( = ?auto_31804 ?auto_31814 ) ) ( not ( = ?auto_31802 ?auto_31814 ) ) ( not ( = ?auto_31815 ?auto_31814 ) ) ( IS-CRATE ?auto_31802 ) ( not ( = ?auto_31801 ?auto_31802 ) ) ( not ( = ?auto_31803 ?auto_31801 ) ) ( not ( = ?auto_31804 ?auto_31801 ) ) ( not ( = ?auto_31815 ?auto_31801 ) ) ( not ( = ?auto_31814 ?auto_31801 ) ) ( not ( = ?auto_31805 ?auto_31812 ) ) ( not ( = ?auto_31817 ?auto_31805 ) ) ( not ( = ?auto_31808 ?auto_31805 ) ) ( HOIST-AT ?auto_31807 ?auto_31805 ) ( not ( = ?auto_31810 ?auto_31807 ) ) ( not ( = ?auto_31813 ?auto_31807 ) ) ( not ( = ?auto_31809 ?auto_31807 ) ) ( AVAILABLE ?auto_31807 ) ( SURFACE-AT ?auto_31802 ?auto_31805 ) ( ON ?auto_31802 ?auto_31806 ) ( CLEAR ?auto_31802 ) ( not ( = ?auto_31803 ?auto_31806 ) ) ( not ( = ?auto_31804 ?auto_31806 ) ) ( not ( = ?auto_31802 ?auto_31806 ) ) ( not ( = ?auto_31815 ?auto_31806 ) ) ( not ( = ?auto_31814 ?auto_31806 ) ) ( not ( = ?auto_31801 ?auto_31806 ) ) ( TRUCK-AT ?auto_31811 ?auto_31812 ) ( SURFACE-AT ?auto_31816 ?auto_31812 ) ( CLEAR ?auto_31816 ) ( IS-CRATE ?auto_31801 ) ( not ( = ?auto_31816 ?auto_31801 ) ) ( not ( = ?auto_31803 ?auto_31816 ) ) ( not ( = ?auto_31804 ?auto_31816 ) ) ( not ( = ?auto_31802 ?auto_31816 ) ) ( not ( = ?auto_31815 ?auto_31816 ) ) ( not ( = ?auto_31814 ?auto_31816 ) ) ( not ( = ?auto_31806 ?auto_31816 ) ) ( AVAILABLE ?auto_31810 ) ( IN ?auto_31801 ?auto_31811 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31802 ?auto_31803 ?auto_31804 )
      ( MAKE-3CRATE-VERIFY ?auto_31801 ?auto_31802 ?auto_31803 ?auto_31804 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31818 - SURFACE
      ?auto_31819 - SURFACE
      ?auto_31820 - SURFACE
      ?auto_31821 - SURFACE
      ?auto_31822 - SURFACE
    )
    :vars
    (
      ?auto_31828 - HOIST
      ?auto_31830 - PLACE
      ?auto_31834 - PLACE
      ?auto_31831 - HOIST
      ?auto_31833 - SURFACE
      ?auto_31826 - PLACE
      ?auto_31827 - HOIST
      ?auto_31832 - SURFACE
      ?auto_31823 - PLACE
      ?auto_31825 - HOIST
      ?auto_31824 - SURFACE
      ?auto_31829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31828 ?auto_31830 ) ( IS-CRATE ?auto_31822 ) ( not ( = ?auto_31821 ?auto_31822 ) ) ( not ( = ?auto_31820 ?auto_31821 ) ) ( not ( = ?auto_31820 ?auto_31822 ) ) ( not ( = ?auto_31834 ?auto_31830 ) ) ( HOIST-AT ?auto_31831 ?auto_31834 ) ( not ( = ?auto_31828 ?auto_31831 ) ) ( AVAILABLE ?auto_31831 ) ( SURFACE-AT ?auto_31822 ?auto_31834 ) ( ON ?auto_31822 ?auto_31833 ) ( CLEAR ?auto_31822 ) ( not ( = ?auto_31821 ?auto_31833 ) ) ( not ( = ?auto_31822 ?auto_31833 ) ) ( not ( = ?auto_31820 ?auto_31833 ) ) ( IS-CRATE ?auto_31821 ) ( not ( = ?auto_31826 ?auto_31830 ) ) ( not ( = ?auto_31834 ?auto_31826 ) ) ( HOIST-AT ?auto_31827 ?auto_31826 ) ( not ( = ?auto_31828 ?auto_31827 ) ) ( not ( = ?auto_31831 ?auto_31827 ) ) ( AVAILABLE ?auto_31827 ) ( SURFACE-AT ?auto_31821 ?auto_31826 ) ( ON ?auto_31821 ?auto_31832 ) ( CLEAR ?auto_31821 ) ( not ( = ?auto_31821 ?auto_31832 ) ) ( not ( = ?auto_31822 ?auto_31832 ) ) ( not ( = ?auto_31820 ?auto_31832 ) ) ( not ( = ?auto_31833 ?auto_31832 ) ) ( IS-CRATE ?auto_31820 ) ( not ( = ?auto_31819 ?auto_31820 ) ) ( not ( = ?auto_31821 ?auto_31819 ) ) ( not ( = ?auto_31822 ?auto_31819 ) ) ( not ( = ?auto_31833 ?auto_31819 ) ) ( not ( = ?auto_31832 ?auto_31819 ) ) ( not ( = ?auto_31823 ?auto_31830 ) ) ( not ( = ?auto_31834 ?auto_31823 ) ) ( not ( = ?auto_31826 ?auto_31823 ) ) ( HOIST-AT ?auto_31825 ?auto_31823 ) ( not ( = ?auto_31828 ?auto_31825 ) ) ( not ( = ?auto_31831 ?auto_31825 ) ) ( not ( = ?auto_31827 ?auto_31825 ) ) ( AVAILABLE ?auto_31825 ) ( SURFACE-AT ?auto_31820 ?auto_31823 ) ( ON ?auto_31820 ?auto_31824 ) ( CLEAR ?auto_31820 ) ( not ( = ?auto_31821 ?auto_31824 ) ) ( not ( = ?auto_31822 ?auto_31824 ) ) ( not ( = ?auto_31820 ?auto_31824 ) ) ( not ( = ?auto_31833 ?auto_31824 ) ) ( not ( = ?auto_31832 ?auto_31824 ) ) ( not ( = ?auto_31819 ?auto_31824 ) ) ( TRUCK-AT ?auto_31829 ?auto_31830 ) ( SURFACE-AT ?auto_31818 ?auto_31830 ) ( CLEAR ?auto_31818 ) ( IS-CRATE ?auto_31819 ) ( not ( = ?auto_31818 ?auto_31819 ) ) ( not ( = ?auto_31821 ?auto_31818 ) ) ( not ( = ?auto_31822 ?auto_31818 ) ) ( not ( = ?auto_31820 ?auto_31818 ) ) ( not ( = ?auto_31833 ?auto_31818 ) ) ( not ( = ?auto_31832 ?auto_31818 ) ) ( not ( = ?auto_31824 ?auto_31818 ) ) ( AVAILABLE ?auto_31828 ) ( IN ?auto_31819 ?auto_31829 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31820 ?auto_31821 ?auto_31822 )
      ( MAKE-4CRATE-VERIFY ?auto_31818 ?auto_31819 ?auto_31820 ?auto_31821 ?auto_31822 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31835 - SURFACE
      ?auto_31836 - SURFACE
      ?auto_31837 - SURFACE
      ?auto_31838 - SURFACE
      ?auto_31839 - SURFACE
      ?auto_31840 - SURFACE
    )
    :vars
    (
      ?auto_31846 - HOIST
      ?auto_31848 - PLACE
      ?auto_31852 - PLACE
      ?auto_31849 - HOIST
      ?auto_31851 - SURFACE
      ?auto_31844 - PLACE
      ?auto_31845 - HOIST
      ?auto_31850 - SURFACE
      ?auto_31841 - PLACE
      ?auto_31843 - HOIST
      ?auto_31842 - SURFACE
      ?auto_31847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31846 ?auto_31848 ) ( IS-CRATE ?auto_31840 ) ( not ( = ?auto_31839 ?auto_31840 ) ) ( not ( = ?auto_31838 ?auto_31839 ) ) ( not ( = ?auto_31838 ?auto_31840 ) ) ( not ( = ?auto_31852 ?auto_31848 ) ) ( HOIST-AT ?auto_31849 ?auto_31852 ) ( not ( = ?auto_31846 ?auto_31849 ) ) ( AVAILABLE ?auto_31849 ) ( SURFACE-AT ?auto_31840 ?auto_31852 ) ( ON ?auto_31840 ?auto_31851 ) ( CLEAR ?auto_31840 ) ( not ( = ?auto_31839 ?auto_31851 ) ) ( not ( = ?auto_31840 ?auto_31851 ) ) ( not ( = ?auto_31838 ?auto_31851 ) ) ( IS-CRATE ?auto_31839 ) ( not ( = ?auto_31844 ?auto_31848 ) ) ( not ( = ?auto_31852 ?auto_31844 ) ) ( HOIST-AT ?auto_31845 ?auto_31844 ) ( not ( = ?auto_31846 ?auto_31845 ) ) ( not ( = ?auto_31849 ?auto_31845 ) ) ( AVAILABLE ?auto_31845 ) ( SURFACE-AT ?auto_31839 ?auto_31844 ) ( ON ?auto_31839 ?auto_31850 ) ( CLEAR ?auto_31839 ) ( not ( = ?auto_31839 ?auto_31850 ) ) ( not ( = ?auto_31840 ?auto_31850 ) ) ( not ( = ?auto_31838 ?auto_31850 ) ) ( not ( = ?auto_31851 ?auto_31850 ) ) ( IS-CRATE ?auto_31838 ) ( not ( = ?auto_31837 ?auto_31838 ) ) ( not ( = ?auto_31839 ?auto_31837 ) ) ( not ( = ?auto_31840 ?auto_31837 ) ) ( not ( = ?auto_31851 ?auto_31837 ) ) ( not ( = ?auto_31850 ?auto_31837 ) ) ( not ( = ?auto_31841 ?auto_31848 ) ) ( not ( = ?auto_31852 ?auto_31841 ) ) ( not ( = ?auto_31844 ?auto_31841 ) ) ( HOIST-AT ?auto_31843 ?auto_31841 ) ( not ( = ?auto_31846 ?auto_31843 ) ) ( not ( = ?auto_31849 ?auto_31843 ) ) ( not ( = ?auto_31845 ?auto_31843 ) ) ( AVAILABLE ?auto_31843 ) ( SURFACE-AT ?auto_31838 ?auto_31841 ) ( ON ?auto_31838 ?auto_31842 ) ( CLEAR ?auto_31838 ) ( not ( = ?auto_31839 ?auto_31842 ) ) ( not ( = ?auto_31840 ?auto_31842 ) ) ( not ( = ?auto_31838 ?auto_31842 ) ) ( not ( = ?auto_31851 ?auto_31842 ) ) ( not ( = ?auto_31850 ?auto_31842 ) ) ( not ( = ?auto_31837 ?auto_31842 ) ) ( TRUCK-AT ?auto_31847 ?auto_31848 ) ( SURFACE-AT ?auto_31836 ?auto_31848 ) ( CLEAR ?auto_31836 ) ( IS-CRATE ?auto_31837 ) ( not ( = ?auto_31836 ?auto_31837 ) ) ( not ( = ?auto_31839 ?auto_31836 ) ) ( not ( = ?auto_31840 ?auto_31836 ) ) ( not ( = ?auto_31838 ?auto_31836 ) ) ( not ( = ?auto_31851 ?auto_31836 ) ) ( not ( = ?auto_31850 ?auto_31836 ) ) ( not ( = ?auto_31842 ?auto_31836 ) ) ( AVAILABLE ?auto_31846 ) ( IN ?auto_31837 ?auto_31847 ) ( ON ?auto_31836 ?auto_31835 ) ( not ( = ?auto_31835 ?auto_31836 ) ) ( not ( = ?auto_31835 ?auto_31837 ) ) ( not ( = ?auto_31835 ?auto_31838 ) ) ( not ( = ?auto_31835 ?auto_31839 ) ) ( not ( = ?auto_31835 ?auto_31840 ) ) ( not ( = ?auto_31835 ?auto_31851 ) ) ( not ( = ?auto_31835 ?auto_31850 ) ) ( not ( = ?auto_31835 ?auto_31842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31838 ?auto_31839 ?auto_31840 )
      ( MAKE-5CRATE-VERIFY ?auto_31835 ?auto_31836 ?auto_31837 ?auto_31838 ?auto_31839 ?auto_31840 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31853 - SURFACE
      ?auto_31854 - SURFACE
    )
    :vars
    (
      ?auto_31860 - HOIST
      ?auto_31862 - PLACE
      ?auto_31864 - SURFACE
      ?auto_31869 - PLACE
      ?auto_31863 - HOIST
      ?auto_31866 - SURFACE
      ?auto_31858 - PLACE
      ?auto_31859 - HOIST
      ?auto_31865 - SURFACE
      ?auto_31867 - SURFACE
      ?auto_31855 - PLACE
      ?auto_31857 - HOIST
      ?auto_31856 - SURFACE
      ?auto_31868 - SURFACE
      ?auto_31861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31860 ?auto_31862 ) ( IS-CRATE ?auto_31854 ) ( not ( = ?auto_31853 ?auto_31854 ) ) ( not ( = ?auto_31864 ?auto_31853 ) ) ( not ( = ?auto_31864 ?auto_31854 ) ) ( not ( = ?auto_31869 ?auto_31862 ) ) ( HOIST-AT ?auto_31863 ?auto_31869 ) ( not ( = ?auto_31860 ?auto_31863 ) ) ( AVAILABLE ?auto_31863 ) ( SURFACE-AT ?auto_31854 ?auto_31869 ) ( ON ?auto_31854 ?auto_31866 ) ( CLEAR ?auto_31854 ) ( not ( = ?auto_31853 ?auto_31866 ) ) ( not ( = ?auto_31854 ?auto_31866 ) ) ( not ( = ?auto_31864 ?auto_31866 ) ) ( IS-CRATE ?auto_31853 ) ( not ( = ?auto_31858 ?auto_31862 ) ) ( not ( = ?auto_31869 ?auto_31858 ) ) ( HOIST-AT ?auto_31859 ?auto_31858 ) ( not ( = ?auto_31860 ?auto_31859 ) ) ( not ( = ?auto_31863 ?auto_31859 ) ) ( AVAILABLE ?auto_31859 ) ( SURFACE-AT ?auto_31853 ?auto_31858 ) ( ON ?auto_31853 ?auto_31865 ) ( CLEAR ?auto_31853 ) ( not ( = ?auto_31853 ?auto_31865 ) ) ( not ( = ?auto_31854 ?auto_31865 ) ) ( not ( = ?auto_31864 ?auto_31865 ) ) ( not ( = ?auto_31866 ?auto_31865 ) ) ( IS-CRATE ?auto_31864 ) ( not ( = ?auto_31867 ?auto_31864 ) ) ( not ( = ?auto_31853 ?auto_31867 ) ) ( not ( = ?auto_31854 ?auto_31867 ) ) ( not ( = ?auto_31866 ?auto_31867 ) ) ( not ( = ?auto_31865 ?auto_31867 ) ) ( not ( = ?auto_31855 ?auto_31862 ) ) ( not ( = ?auto_31869 ?auto_31855 ) ) ( not ( = ?auto_31858 ?auto_31855 ) ) ( HOIST-AT ?auto_31857 ?auto_31855 ) ( not ( = ?auto_31860 ?auto_31857 ) ) ( not ( = ?auto_31863 ?auto_31857 ) ) ( not ( = ?auto_31859 ?auto_31857 ) ) ( AVAILABLE ?auto_31857 ) ( SURFACE-AT ?auto_31864 ?auto_31855 ) ( ON ?auto_31864 ?auto_31856 ) ( CLEAR ?auto_31864 ) ( not ( = ?auto_31853 ?auto_31856 ) ) ( not ( = ?auto_31854 ?auto_31856 ) ) ( not ( = ?auto_31864 ?auto_31856 ) ) ( not ( = ?auto_31866 ?auto_31856 ) ) ( not ( = ?auto_31865 ?auto_31856 ) ) ( not ( = ?auto_31867 ?auto_31856 ) ) ( SURFACE-AT ?auto_31868 ?auto_31862 ) ( CLEAR ?auto_31868 ) ( IS-CRATE ?auto_31867 ) ( not ( = ?auto_31868 ?auto_31867 ) ) ( not ( = ?auto_31853 ?auto_31868 ) ) ( not ( = ?auto_31854 ?auto_31868 ) ) ( not ( = ?auto_31864 ?auto_31868 ) ) ( not ( = ?auto_31866 ?auto_31868 ) ) ( not ( = ?auto_31865 ?auto_31868 ) ) ( not ( = ?auto_31856 ?auto_31868 ) ) ( AVAILABLE ?auto_31860 ) ( IN ?auto_31867 ?auto_31861 ) ( TRUCK-AT ?auto_31861 ?auto_31855 ) )
    :subtasks
    ( ( !DRIVE ?auto_31861 ?auto_31855 ?auto_31862 )
      ( MAKE-2CRATE ?auto_31864 ?auto_31853 ?auto_31854 )
      ( MAKE-1CRATE-VERIFY ?auto_31853 ?auto_31854 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31870 - SURFACE
      ?auto_31871 - SURFACE
      ?auto_31872 - SURFACE
    )
    :vars
    (
      ?auto_31874 - HOIST
      ?auto_31875 - PLACE
      ?auto_31886 - PLACE
      ?auto_31882 - HOIST
      ?auto_31879 - SURFACE
      ?auto_31876 - PLACE
      ?auto_31877 - HOIST
      ?auto_31885 - SURFACE
      ?auto_31884 - SURFACE
      ?auto_31878 - PLACE
      ?auto_31873 - HOIST
      ?auto_31880 - SURFACE
      ?auto_31883 - SURFACE
      ?auto_31881 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31874 ?auto_31875 ) ( IS-CRATE ?auto_31872 ) ( not ( = ?auto_31871 ?auto_31872 ) ) ( not ( = ?auto_31870 ?auto_31871 ) ) ( not ( = ?auto_31870 ?auto_31872 ) ) ( not ( = ?auto_31886 ?auto_31875 ) ) ( HOIST-AT ?auto_31882 ?auto_31886 ) ( not ( = ?auto_31874 ?auto_31882 ) ) ( AVAILABLE ?auto_31882 ) ( SURFACE-AT ?auto_31872 ?auto_31886 ) ( ON ?auto_31872 ?auto_31879 ) ( CLEAR ?auto_31872 ) ( not ( = ?auto_31871 ?auto_31879 ) ) ( not ( = ?auto_31872 ?auto_31879 ) ) ( not ( = ?auto_31870 ?auto_31879 ) ) ( IS-CRATE ?auto_31871 ) ( not ( = ?auto_31876 ?auto_31875 ) ) ( not ( = ?auto_31886 ?auto_31876 ) ) ( HOIST-AT ?auto_31877 ?auto_31876 ) ( not ( = ?auto_31874 ?auto_31877 ) ) ( not ( = ?auto_31882 ?auto_31877 ) ) ( AVAILABLE ?auto_31877 ) ( SURFACE-AT ?auto_31871 ?auto_31876 ) ( ON ?auto_31871 ?auto_31885 ) ( CLEAR ?auto_31871 ) ( not ( = ?auto_31871 ?auto_31885 ) ) ( not ( = ?auto_31872 ?auto_31885 ) ) ( not ( = ?auto_31870 ?auto_31885 ) ) ( not ( = ?auto_31879 ?auto_31885 ) ) ( IS-CRATE ?auto_31870 ) ( not ( = ?auto_31884 ?auto_31870 ) ) ( not ( = ?auto_31871 ?auto_31884 ) ) ( not ( = ?auto_31872 ?auto_31884 ) ) ( not ( = ?auto_31879 ?auto_31884 ) ) ( not ( = ?auto_31885 ?auto_31884 ) ) ( not ( = ?auto_31878 ?auto_31875 ) ) ( not ( = ?auto_31886 ?auto_31878 ) ) ( not ( = ?auto_31876 ?auto_31878 ) ) ( HOIST-AT ?auto_31873 ?auto_31878 ) ( not ( = ?auto_31874 ?auto_31873 ) ) ( not ( = ?auto_31882 ?auto_31873 ) ) ( not ( = ?auto_31877 ?auto_31873 ) ) ( AVAILABLE ?auto_31873 ) ( SURFACE-AT ?auto_31870 ?auto_31878 ) ( ON ?auto_31870 ?auto_31880 ) ( CLEAR ?auto_31870 ) ( not ( = ?auto_31871 ?auto_31880 ) ) ( not ( = ?auto_31872 ?auto_31880 ) ) ( not ( = ?auto_31870 ?auto_31880 ) ) ( not ( = ?auto_31879 ?auto_31880 ) ) ( not ( = ?auto_31885 ?auto_31880 ) ) ( not ( = ?auto_31884 ?auto_31880 ) ) ( SURFACE-AT ?auto_31883 ?auto_31875 ) ( CLEAR ?auto_31883 ) ( IS-CRATE ?auto_31884 ) ( not ( = ?auto_31883 ?auto_31884 ) ) ( not ( = ?auto_31871 ?auto_31883 ) ) ( not ( = ?auto_31872 ?auto_31883 ) ) ( not ( = ?auto_31870 ?auto_31883 ) ) ( not ( = ?auto_31879 ?auto_31883 ) ) ( not ( = ?auto_31885 ?auto_31883 ) ) ( not ( = ?auto_31880 ?auto_31883 ) ) ( AVAILABLE ?auto_31874 ) ( IN ?auto_31884 ?auto_31881 ) ( TRUCK-AT ?auto_31881 ?auto_31878 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31871 ?auto_31872 )
      ( MAKE-2CRATE-VERIFY ?auto_31870 ?auto_31871 ?auto_31872 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31887 - SURFACE
      ?auto_31888 - SURFACE
      ?auto_31889 - SURFACE
      ?auto_31890 - SURFACE
    )
    :vars
    (
      ?auto_31893 - HOIST
      ?auto_31897 - PLACE
      ?auto_31891 - PLACE
      ?auto_31903 - HOIST
      ?auto_31896 - SURFACE
      ?auto_31898 - PLACE
      ?auto_31901 - HOIST
      ?auto_31902 - SURFACE
      ?auto_31892 - PLACE
      ?auto_31900 - HOIST
      ?auto_31895 - SURFACE
      ?auto_31899 - SURFACE
      ?auto_31894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31893 ?auto_31897 ) ( IS-CRATE ?auto_31890 ) ( not ( = ?auto_31889 ?auto_31890 ) ) ( not ( = ?auto_31888 ?auto_31889 ) ) ( not ( = ?auto_31888 ?auto_31890 ) ) ( not ( = ?auto_31891 ?auto_31897 ) ) ( HOIST-AT ?auto_31903 ?auto_31891 ) ( not ( = ?auto_31893 ?auto_31903 ) ) ( AVAILABLE ?auto_31903 ) ( SURFACE-AT ?auto_31890 ?auto_31891 ) ( ON ?auto_31890 ?auto_31896 ) ( CLEAR ?auto_31890 ) ( not ( = ?auto_31889 ?auto_31896 ) ) ( not ( = ?auto_31890 ?auto_31896 ) ) ( not ( = ?auto_31888 ?auto_31896 ) ) ( IS-CRATE ?auto_31889 ) ( not ( = ?auto_31898 ?auto_31897 ) ) ( not ( = ?auto_31891 ?auto_31898 ) ) ( HOIST-AT ?auto_31901 ?auto_31898 ) ( not ( = ?auto_31893 ?auto_31901 ) ) ( not ( = ?auto_31903 ?auto_31901 ) ) ( AVAILABLE ?auto_31901 ) ( SURFACE-AT ?auto_31889 ?auto_31898 ) ( ON ?auto_31889 ?auto_31902 ) ( CLEAR ?auto_31889 ) ( not ( = ?auto_31889 ?auto_31902 ) ) ( not ( = ?auto_31890 ?auto_31902 ) ) ( not ( = ?auto_31888 ?auto_31902 ) ) ( not ( = ?auto_31896 ?auto_31902 ) ) ( IS-CRATE ?auto_31888 ) ( not ( = ?auto_31887 ?auto_31888 ) ) ( not ( = ?auto_31889 ?auto_31887 ) ) ( not ( = ?auto_31890 ?auto_31887 ) ) ( not ( = ?auto_31896 ?auto_31887 ) ) ( not ( = ?auto_31902 ?auto_31887 ) ) ( not ( = ?auto_31892 ?auto_31897 ) ) ( not ( = ?auto_31891 ?auto_31892 ) ) ( not ( = ?auto_31898 ?auto_31892 ) ) ( HOIST-AT ?auto_31900 ?auto_31892 ) ( not ( = ?auto_31893 ?auto_31900 ) ) ( not ( = ?auto_31903 ?auto_31900 ) ) ( not ( = ?auto_31901 ?auto_31900 ) ) ( AVAILABLE ?auto_31900 ) ( SURFACE-AT ?auto_31888 ?auto_31892 ) ( ON ?auto_31888 ?auto_31895 ) ( CLEAR ?auto_31888 ) ( not ( = ?auto_31889 ?auto_31895 ) ) ( not ( = ?auto_31890 ?auto_31895 ) ) ( not ( = ?auto_31888 ?auto_31895 ) ) ( not ( = ?auto_31896 ?auto_31895 ) ) ( not ( = ?auto_31902 ?auto_31895 ) ) ( not ( = ?auto_31887 ?auto_31895 ) ) ( SURFACE-AT ?auto_31899 ?auto_31897 ) ( CLEAR ?auto_31899 ) ( IS-CRATE ?auto_31887 ) ( not ( = ?auto_31899 ?auto_31887 ) ) ( not ( = ?auto_31889 ?auto_31899 ) ) ( not ( = ?auto_31890 ?auto_31899 ) ) ( not ( = ?auto_31888 ?auto_31899 ) ) ( not ( = ?auto_31896 ?auto_31899 ) ) ( not ( = ?auto_31902 ?auto_31899 ) ) ( not ( = ?auto_31895 ?auto_31899 ) ) ( AVAILABLE ?auto_31893 ) ( IN ?auto_31887 ?auto_31894 ) ( TRUCK-AT ?auto_31894 ?auto_31892 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31888 ?auto_31889 ?auto_31890 )
      ( MAKE-3CRATE-VERIFY ?auto_31887 ?auto_31888 ?auto_31889 ?auto_31890 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31904 - SURFACE
      ?auto_31905 - SURFACE
      ?auto_31906 - SURFACE
      ?auto_31907 - SURFACE
      ?auto_31908 - SURFACE
    )
    :vars
    (
      ?auto_31911 - HOIST
      ?auto_31915 - PLACE
      ?auto_31909 - PLACE
      ?auto_31920 - HOIST
      ?auto_31914 - SURFACE
      ?auto_31916 - PLACE
      ?auto_31918 - HOIST
      ?auto_31919 - SURFACE
      ?auto_31910 - PLACE
      ?auto_31917 - HOIST
      ?auto_31913 - SURFACE
      ?auto_31912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31911 ?auto_31915 ) ( IS-CRATE ?auto_31908 ) ( not ( = ?auto_31907 ?auto_31908 ) ) ( not ( = ?auto_31906 ?auto_31907 ) ) ( not ( = ?auto_31906 ?auto_31908 ) ) ( not ( = ?auto_31909 ?auto_31915 ) ) ( HOIST-AT ?auto_31920 ?auto_31909 ) ( not ( = ?auto_31911 ?auto_31920 ) ) ( AVAILABLE ?auto_31920 ) ( SURFACE-AT ?auto_31908 ?auto_31909 ) ( ON ?auto_31908 ?auto_31914 ) ( CLEAR ?auto_31908 ) ( not ( = ?auto_31907 ?auto_31914 ) ) ( not ( = ?auto_31908 ?auto_31914 ) ) ( not ( = ?auto_31906 ?auto_31914 ) ) ( IS-CRATE ?auto_31907 ) ( not ( = ?auto_31916 ?auto_31915 ) ) ( not ( = ?auto_31909 ?auto_31916 ) ) ( HOIST-AT ?auto_31918 ?auto_31916 ) ( not ( = ?auto_31911 ?auto_31918 ) ) ( not ( = ?auto_31920 ?auto_31918 ) ) ( AVAILABLE ?auto_31918 ) ( SURFACE-AT ?auto_31907 ?auto_31916 ) ( ON ?auto_31907 ?auto_31919 ) ( CLEAR ?auto_31907 ) ( not ( = ?auto_31907 ?auto_31919 ) ) ( not ( = ?auto_31908 ?auto_31919 ) ) ( not ( = ?auto_31906 ?auto_31919 ) ) ( not ( = ?auto_31914 ?auto_31919 ) ) ( IS-CRATE ?auto_31906 ) ( not ( = ?auto_31905 ?auto_31906 ) ) ( not ( = ?auto_31907 ?auto_31905 ) ) ( not ( = ?auto_31908 ?auto_31905 ) ) ( not ( = ?auto_31914 ?auto_31905 ) ) ( not ( = ?auto_31919 ?auto_31905 ) ) ( not ( = ?auto_31910 ?auto_31915 ) ) ( not ( = ?auto_31909 ?auto_31910 ) ) ( not ( = ?auto_31916 ?auto_31910 ) ) ( HOIST-AT ?auto_31917 ?auto_31910 ) ( not ( = ?auto_31911 ?auto_31917 ) ) ( not ( = ?auto_31920 ?auto_31917 ) ) ( not ( = ?auto_31918 ?auto_31917 ) ) ( AVAILABLE ?auto_31917 ) ( SURFACE-AT ?auto_31906 ?auto_31910 ) ( ON ?auto_31906 ?auto_31913 ) ( CLEAR ?auto_31906 ) ( not ( = ?auto_31907 ?auto_31913 ) ) ( not ( = ?auto_31908 ?auto_31913 ) ) ( not ( = ?auto_31906 ?auto_31913 ) ) ( not ( = ?auto_31914 ?auto_31913 ) ) ( not ( = ?auto_31919 ?auto_31913 ) ) ( not ( = ?auto_31905 ?auto_31913 ) ) ( SURFACE-AT ?auto_31904 ?auto_31915 ) ( CLEAR ?auto_31904 ) ( IS-CRATE ?auto_31905 ) ( not ( = ?auto_31904 ?auto_31905 ) ) ( not ( = ?auto_31907 ?auto_31904 ) ) ( not ( = ?auto_31908 ?auto_31904 ) ) ( not ( = ?auto_31906 ?auto_31904 ) ) ( not ( = ?auto_31914 ?auto_31904 ) ) ( not ( = ?auto_31919 ?auto_31904 ) ) ( not ( = ?auto_31913 ?auto_31904 ) ) ( AVAILABLE ?auto_31911 ) ( IN ?auto_31905 ?auto_31912 ) ( TRUCK-AT ?auto_31912 ?auto_31910 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31906 ?auto_31907 ?auto_31908 )
      ( MAKE-4CRATE-VERIFY ?auto_31904 ?auto_31905 ?auto_31906 ?auto_31907 ?auto_31908 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31921 - SURFACE
      ?auto_31922 - SURFACE
      ?auto_31923 - SURFACE
      ?auto_31924 - SURFACE
      ?auto_31925 - SURFACE
      ?auto_31926 - SURFACE
    )
    :vars
    (
      ?auto_31929 - HOIST
      ?auto_31933 - PLACE
      ?auto_31927 - PLACE
      ?auto_31938 - HOIST
      ?auto_31932 - SURFACE
      ?auto_31934 - PLACE
      ?auto_31936 - HOIST
      ?auto_31937 - SURFACE
      ?auto_31928 - PLACE
      ?auto_31935 - HOIST
      ?auto_31931 - SURFACE
      ?auto_31930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31929 ?auto_31933 ) ( IS-CRATE ?auto_31926 ) ( not ( = ?auto_31925 ?auto_31926 ) ) ( not ( = ?auto_31924 ?auto_31925 ) ) ( not ( = ?auto_31924 ?auto_31926 ) ) ( not ( = ?auto_31927 ?auto_31933 ) ) ( HOIST-AT ?auto_31938 ?auto_31927 ) ( not ( = ?auto_31929 ?auto_31938 ) ) ( AVAILABLE ?auto_31938 ) ( SURFACE-AT ?auto_31926 ?auto_31927 ) ( ON ?auto_31926 ?auto_31932 ) ( CLEAR ?auto_31926 ) ( not ( = ?auto_31925 ?auto_31932 ) ) ( not ( = ?auto_31926 ?auto_31932 ) ) ( not ( = ?auto_31924 ?auto_31932 ) ) ( IS-CRATE ?auto_31925 ) ( not ( = ?auto_31934 ?auto_31933 ) ) ( not ( = ?auto_31927 ?auto_31934 ) ) ( HOIST-AT ?auto_31936 ?auto_31934 ) ( not ( = ?auto_31929 ?auto_31936 ) ) ( not ( = ?auto_31938 ?auto_31936 ) ) ( AVAILABLE ?auto_31936 ) ( SURFACE-AT ?auto_31925 ?auto_31934 ) ( ON ?auto_31925 ?auto_31937 ) ( CLEAR ?auto_31925 ) ( not ( = ?auto_31925 ?auto_31937 ) ) ( not ( = ?auto_31926 ?auto_31937 ) ) ( not ( = ?auto_31924 ?auto_31937 ) ) ( not ( = ?auto_31932 ?auto_31937 ) ) ( IS-CRATE ?auto_31924 ) ( not ( = ?auto_31923 ?auto_31924 ) ) ( not ( = ?auto_31925 ?auto_31923 ) ) ( not ( = ?auto_31926 ?auto_31923 ) ) ( not ( = ?auto_31932 ?auto_31923 ) ) ( not ( = ?auto_31937 ?auto_31923 ) ) ( not ( = ?auto_31928 ?auto_31933 ) ) ( not ( = ?auto_31927 ?auto_31928 ) ) ( not ( = ?auto_31934 ?auto_31928 ) ) ( HOIST-AT ?auto_31935 ?auto_31928 ) ( not ( = ?auto_31929 ?auto_31935 ) ) ( not ( = ?auto_31938 ?auto_31935 ) ) ( not ( = ?auto_31936 ?auto_31935 ) ) ( AVAILABLE ?auto_31935 ) ( SURFACE-AT ?auto_31924 ?auto_31928 ) ( ON ?auto_31924 ?auto_31931 ) ( CLEAR ?auto_31924 ) ( not ( = ?auto_31925 ?auto_31931 ) ) ( not ( = ?auto_31926 ?auto_31931 ) ) ( not ( = ?auto_31924 ?auto_31931 ) ) ( not ( = ?auto_31932 ?auto_31931 ) ) ( not ( = ?auto_31937 ?auto_31931 ) ) ( not ( = ?auto_31923 ?auto_31931 ) ) ( SURFACE-AT ?auto_31922 ?auto_31933 ) ( CLEAR ?auto_31922 ) ( IS-CRATE ?auto_31923 ) ( not ( = ?auto_31922 ?auto_31923 ) ) ( not ( = ?auto_31925 ?auto_31922 ) ) ( not ( = ?auto_31926 ?auto_31922 ) ) ( not ( = ?auto_31924 ?auto_31922 ) ) ( not ( = ?auto_31932 ?auto_31922 ) ) ( not ( = ?auto_31937 ?auto_31922 ) ) ( not ( = ?auto_31931 ?auto_31922 ) ) ( AVAILABLE ?auto_31929 ) ( IN ?auto_31923 ?auto_31930 ) ( TRUCK-AT ?auto_31930 ?auto_31928 ) ( ON ?auto_31922 ?auto_31921 ) ( not ( = ?auto_31921 ?auto_31922 ) ) ( not ( = ?auto_31921 ?auto_31923 ) ) ( not ( = ?auto_31921 ?auto_31924 ) ) ( not ( = ?auto_31921 ?auto_31925 ) ) ( not ( = ?auto_31921 ?auto_31926 ) ) ( not ( = ?auto_31921 ?auto_31932 ) ) ( not ( = ?auto_31921 ?auto_31937 ) ) ( not ( = ?auto_31921 ?auto_31931 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31924 ?auto_31925 ?auto_31926 )
      ( MAKE-5CRATE-VERIFY ?auto_31921 ?auto_31922 ?auto_31923 ?auto_31924 ?auto_31925 ?auto_31926 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31939 - SURFACE
      ?auto_31940 - SURFACE
    )
    :vars
    (
      ?auto_31944 - HOIST
      ?auto_31948 - PLACE
      ?auto_31941 - SURFACE
      ?auto_31942 - PLACE
      ?auto_31955 - HOIST
      ?auto_31947 - SURFACE
      ?auto_31950 - PLACE
      ?auto_31953 - HOIST
      ?auto_31954 - SURFACE
      ?auto_31949 - SURFACE
      ?auto_31943 - PLACE
      ?auto_31952 - HOIST
      ?auto_31946 - SURFACE
      ?auto_31951 - SURFACE
      ?auto_31945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31944 ?auto_31948 ) ( IS-CRATE ?auto_31940 ) ( not ( = ?auto_31939 ?auto_31940 ) ) ( not ( = ?auto_31941 ?auto_31939 ) ) ( not ( = ?auto_31941 ?auto_31940 ) ) ( not ( = ?auto_31942 ?auto_31948 ) ) ( HOIST-AT ?auto_31955 ?auto_31942 ) ( not ( = ?auto_31944 ?auto_31955 ) ) ( AVAILABLE ?auto_31955 ) ( SURFACE-AT ?auto_31940 ?auto_31942 ) ( ON ?auto_31940 ?auto_31947 ) ( CLEAR ?auto_31940 ) ( not ( = ?auto_31939 ?auto_31947 ) ) ( not ( = ?auto_31940 ?auto_31947 ) ) ( not ( = ?auto_31941 ?auto_31947 ) ) ( IS-CRATE ?auto_31939 ) ( not ( = ?auto_31950 ?auto_31948 ) ) ( not ( = ?auto_31942 ?auto_31950 ) ) ( HOIST-AT ?auto_31953 ?auto_31950 ) ( not ( = ?auto_31944 ?auto_31953 ) ) ( not ( = ?auto_31955 ?auto_31953 ) ) ( AVAILABLE ?auto_31953 ) ( SURFACE-AT ?auto_31939 ?auto_31950 ) ( ON ?auto_31939 ?auto_31954 ) ( CLEAR ?auto_31939 ) ( not ( = ?auto_31939 ?auto_31954 ) ) ( not ( = ?auto_31940 ?auto_31954 ) ) ( not ( = ?auto_31941 ?auto_31954 ) ) ( not ( = ?auto_31947 ?auto_31954 ) ) ( IS-CRATE ?auto_31941 ) ( not ( = ?auto_31949 ?auto_31941 ) ) ( not ( = ?auto_31939 ?auto_31949 ) ) ( not ( = ?auto_31940 ?auto_31949 ) ) ( not ( = ?auto_31947 ?auto_31949 ) ) ( not ( = ?auto_31954 ?auto_31949 ) ) ( not ( = ?auto_31943 ?auto_31948 ) ) ( not ( = ?auto_31942 ?auto_31943 ) ) ( not ( = ?auto_31950 ?auto_31943 ) ) ( HOIST-AT ?auto_31952 ?auto_31943 ) ( not ( = ?auto_31944 ?auto_31952 ) ) ( not ( = ?auto_31955 ?auto_31952 ) ) ( not ( = ?auto_31953 ?auto_31952 ) ) ( SURFACE-AT ?auto_31941 ?auto_31943 ) ( ON ?auto_31941 ?auto_31946 ) ( CLEAR ?auto_31941 ) ( not ( = ?auto_31939 ?auto_31946 ) ) ( not ( = ?auto_31940 ?auto_31946 ) ) ( not ( = ?auto_31941 ?auto_31946 ) ) ( not ( = ?auto_31947 ?auto_31946 ) ) ( not ( = ?auto_31954 ?auto_31946 ) ) ( not ( = ?auto_31949 ?auto_31946 ) ) ( SURFACE-AT ?auto_31951 ?auto_31948 ) ( CLEAR ?auto_31951 ) ( IS-CRATE ?auto_31949 ) ( not ( = ?auto_31951 ?auto_31949 ) ) ( not ( = ?auto_31939 ?auto_31951 ) ) ( not ( = ?auto_31940 ?auto_31951 ) ) ( not ( = ?auto_31941 ?auto_31951 ) ) ( not ( = ?auto_31947 ?auto_31951 ) ) ( not ( = ?auto_31954 ?auto_31951 ) ) ( not ( = ?auto_31946 ?auto_31951 ) ) ( AVAILABLE ?auto_31944 ) ( TRUCK-AT ?auto_31945 ?auto_31943 ) ( LIFTING ?auto_31952 ?auto_31949 ) )
    :subtasks
    ( ( !LOAD ?auto_31952 ?auto_31949 ?auto_31945 ?auto_31943 )
      ( MAKE-2CRATE ?auto_31941 ?auto_31939 ?auto_31940 )
      ( MAKE-1CRATE-VERIFY ?auto_31939 ?auto_31940 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31956 - SURFACE
      ?auto_31957 - SURFACE
      ?auto_31958 - SURFACE
    )
    :vars
    (
      ?auto_31963 - HOIST
      ?auto_31970 - PLACE
      ?auto_31964 - PLACE
      ?auto_31966 - HOIST
      ?auto_31972 - SURFACE
      ?auto_31965 - PLACE
      ?auto_31961 - HOIST
      ?auto_31969 - SURFACE
      ?auto_31962 - SURFACE
      ?auto_31959 - PLACE
      ?auto_31967 - HOIST
      ?auto_31960 - SURFACE
      ?auto_31971 - SURFACE
      ?auto_31968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31963 ?auto_31970 ) ( IS-CRATE ?auto_31958 ) ( not ( = ?auto_31957 ?auto_31958 ) ) ( not ( = ?auto_31956 ?auto_31957 ) ) ( not ( = ?auto_31956 ?auto_31958 ) ) ( not ( = ?auto_31964 ?auto_31970 ) ) ( HOIST-AT ?auto_31966 ?auto_31964 ) ( not ( = ?auto_31963 ?auto_31966 ) ) ( AVAILABLE ?auto_31966 ) ( SURFACE-AT ?auto_31958 ?auto_31964 ) ( ON ?auto_31958 ?auto_31972 ) ( CLEAR ?auto_31958 ) ( not ( = ?auto_31957 ?auto_31972 ) ) ( not ( = ?auto_31958 ?auto_31972 ) ) ( not ( = ?auto_31956 ?auto_31972 ) ) ( IS-CRATE ?auto_31957 ) ( not ( = ?auto_31965 ?auto_31970 ) ) ( not ( = ?auto_31964 ?auto_31965 ) ) ( HOIST-AT ?auto_31961 ?auto_31965 ) ( not ( = ?auto_31963 ?auto_31961 ) ) ( not ( = ?auto_31966 ?auto_31961 ) ) ( AVAILABLE ?auto_31961 ) ( SURFACE-AT ?auto_31957 ?auto_31965 ) ( ON ?auto_31957 ?auto_31969 ) ( CLEAR ?auto_31957 ) ( not ( = ?auto_31957 ?auto_31969 ) ) ( not ( = ?auto_31958 ?auto_31969 ) ) ( not ( = ?auto_31956 ?auto_31969 ) ) ( not ( = ?auto_31972 ?auto_31969 ) ) ( IS-CRATE ?auto_31956 ) ( not ( = ?auto_31962 ?auto_31956 ) ) ( not ( = ?auto_31957 ?auto_31962 ) ) ( not ( = ?auto_31958 ?auto_31962 ) ) ( not ( = ?auto_31972 ?auto_31962 ) ) ( not ( = ?auto_31969 ?auto_31962 ) ) ( not ( = ?auto_31959 ?auto_31970 ) ) ( not ( = ?auto_31964 ?auto_31959 ) ) ( not ( = ?auto_31965 ?auto_31959 ) ) ( HOIST-AT ?auto_31967 ?auto_31959 ) ( not ( = ?auto_31963 ?auto_31967 ) ) ( not ( = ?auto_31966 ?auto_31967 ) ) ( not ( = ?auto_31961 ?auto_31967 ) ) ( SURFACE-AT ?auto_31956 ?auto_31959 ) ( ON ?auto_31956 ?auto_31960 ) ( CLEAR ?auto_31956 ) ( not ( = ?auto_31957 ?auto_31960 ) ) ( not ( = ?auto_31958 ?auto_31960 ) ) ( not ( = ?auto_31956 ?auto_31960 ) ) ( not ( = ?auto_31972 ?auto_31960 ) ) ( not ( = ?auto_31969 ?auto_31960 ) ) ( not ( = ?auto_31962 ?auto_31960 ) ) ( SURFACE-AT ?auto_31971 ?auto_31970 ) ( CLEAR ?auto_31971 ) ( IS-CRATE ?auto_31962 ) ( not ( = ?auto_31971 ?auto_31962 ) ) ( not ( = ?auto_31957 ?auto_31971 ) ) ( not ( = ?auto_31958 ?auto_31971 ) ) ( not ( = ?auto_31956 ?auto_31971 ) ) ( not ( = ?auto_31972 ?auto_31971 ) ) ( not ( = ?auto_31969 ?auto_31971 ) ) ( not ( = ?auto_31960 ?auto_31971 ) ) ( AVAILABLE ?auto_31963 ) ( TRUCK-AT ?auto_31968 ?auto_31959 ) ( LIFTING ?auto_31967 ?auto_31962 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31957 ?auto_31958 )
      ( MAKE-2CRATE-VERIFY ?auto_31956 ?auto_31957 ?auto_31958 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31973 - SURFACE
      ?auto_31974 - SURFACE
      ?auto_31975 - SURFACE
      ?auto_31976 - SURFACE
    )
    :vars
    (
      ?auto_31986 - HOIST
      ?auto_31980 - PLACE
      ?auto_31978 - PLACE
      ?auto_31988 - HOIST
      ?auto_31979 - SURFACE
      ?auto_31981 - PLACE
      ?auto_31985 - HOIST
      ?auto_31987 - SURFACE
      ?auto_31982 - PLACE
      ?auto_31983 - HOIST
      ?auto_31977 - SURFACE
      ?auto_31984 - SURFACE
      ?auto_31989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31986 ?auto_31980 ) ( IS-CRATE ?auto_31976 ) ( not ( = ?auto_31975 ?auto_31976 ) ) ( not ( = ?auto_31974 ?auto_31975 ) ) ( not ( = ?auto_31974 ?auto_31976 ) ) ( not ( = ?auto_31978 ?auto_31980 ) ) ( HOIST-AT ?auto_31988 ?auto_31978 ) ( not ( = ?auto_31986 ?auto_31988 ) ) ( AVAILABLE ?auto_31988 ) ( SURFACE-AT ?auto_31976 ?auto_31978 ) ( ON ?auto_31976 ?auto_31979 ) ( CLEAR ?auto_31976 ) ( not ( = ?auto_31975 ?auto_31979 ) ) ( not ( = ?auto_31976 ?auto_31979 ) ) ( not ( = ?auto_31974 ?auto_31979 ) ) ( IS-CRATE ?auto_31975 ) ( not ( = ?auto_31981 ?auto_31980 ) ) ( not ( = ?auto_31978 ?auto_31981 ) ) ( HOIST-AT ?auto_31985 ?auto_31981 ) ( not ( = ?auto_31986 ?auto_31985 ) ) ( not ( = ?auto_31988 ?auto_31985 ) ) ( AVAILABLE ?auto_31985 ) ( SURFACE-AT ?auto_31975 ?auto_31981 ) ( ON ?auto_31975 ?auto_31987 ) ( CLEAR ?auto_31975 ) ( not ( = ?auto_31975 ?auto_31987 ) ) ( not ( = ?auto_31976 ?auto_31987 ) ) ( not ( = ?auto_31974 ?auto_31987 ) ) ( not ( = ?auto_31979 ?auto_31987 ) ) ( IS-CRATE ?auto_31974 ) ( not ( = ?auto_31973 ?auto_31974 ) ) ( not ( = ?auto_31975 ?auto_31973 ) ) ( not ( = ?auto_31976 ?auto_31973 ) ) ( not ( = ?auto_31979 ?auto_31973 ) ) ( not ( = ?auto_31987 ?auto_31973 ) ) ( not ( = ?auto_31982 ?auto_31980 ) ) ( not ( = ?auto_31978 ?auto_31982 ) ) ( not ( = ?auto_31981 ?auto_31982 ) ) ( HOIST-AT ?auto_31983 ?auto_31982 ) ( not ( = ?auto_31986 ?auto_31983 ) ) ( not ( = ?auto_31988 ?auto_31983 ) ) ( not ( = ?auto_31985 ?auto_31983 ) ) ( SURFACE-AT ?auto_31974 ?auto_31982 ) ( ON ?auto_31974 ?auto_31977 ) ( CLEAR ?auto_31974 ) ( not ( = ?auto_31975 ?auto_31977 ) ) ( not ( = ?auto_31976 ?auto_31977 ) ) ( not ( = ?auto_31974 ?auto_31977 ) ) ( not ( = ?auto_31979 ?auto_31977 ) ) ( not ( = ?auto_31987 ?auto_31977 ) ) ( not ( = ?auto_31973 ?auto_31977 ) ) ( SURFACE-AT ?auto_31984 ?auto_31980 ) ( CLEAR ?auto_31984 ) ( IS-CRATE ?auto_31973 ) ( not ( = ?auto_31984 ?auto_31973 ) ) ( not ( = ?auto_31975 ?auto_31984 ) ) ( not ( = ?auto_31976 ?auto_31984 ) ) ( not ( = ?auto_31974 ?auto_31984 ) ) ( not ( = ?auto_31979 ?auto_31984 ) ) ( not ( = ?auto_31987 ?auto_31984 ) ) ( not ( = ?auto_31977 ?auto_31984 ) ) ( AVAILABLE ?auto_31986 ) ( TRUCK-AT ?auto_31989 ?auto_31982 ) ( LIFTING ?auto_31983 ?auto_31973 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31974 ?auto_31975 ?auto_31976 )
      ( MAKE-3CRATE-VERIFY ?auto_31973 ?auto_31974 ?auto_31975 ?auto_31976 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31990 - SURFACE
      ?auto_31991 - SURFACE
      ?auto_31992 - SURFACE
      ?auto_31993 - SURFACE
      ?auto_31994 - SURFACE
    )
    :vars
    (
      ?auto_32003 - HOIST
      ?auto_31998 - PLACE
      ?auto_31996 - PLACE
      ?auto_32005 - HOIST
      ?auto_31997 - SURFACE
      ?auto_31999 - PLACE
      ?auto_32002 - HOIST
      ?auto_32004 - SURFACE
      ?auto_32000 - PLACE
      ?auto_32001 - HOIST
      ?auto_31995 - SURFACE
      ?auto_32006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32003 ?auto_31998 ) ( IS-CRATE ?auto_31994 ) ( not ( = ?auto_31993 ?auto_31994 ) ) ( not ( = ?auto_31992 ?auto_31993 ) ) ( not ( = ?auto_31992 ?auto_31994 ) ) ( not ( = ?auto_31996 ?auto_31998 ) ) ( HOIST-AT ?auto_32005 ?auto_31996 ) ( not ( = ?auto_32003 ?auto_32005 ) ) ( AVAILABLE ?auto_32005 ) ( SURFACE-AT ?auto_31994 ?auto_31996 ) ( ON ?auto_31994 ?auto_31997 ) ( CLEAR ?auto_31994 ) ( not ( = ?auto_31993 ?auto_31997 ) ) ( not ( = ?auto_31994 ?auto_31997 ) ) ( not ( = ?auto_31992 ?auto_31997 ) ) ( IS-CRATE ?auto_31993 ) ( not ( = ?auto_31999 ?auto_31998 ) ) ( not ( = ?auto_31996 ?auto_31999 ) ) ( HOIST-AT ?auto_32002 ?auto_31999 ) ( not ( = ?auto_32003 ?auto_32002 ) ) ( not ( = ?auto_32005 ?auto_32002 ) ) ( AVAILABLE ?auto_32002 ) ( SURFACE-AT ?auto_31993 ?auto_31999 ) ( ON ?auto_31993 ?auto_32004 ) ( CLEAR ?auto_31993 ) ( not ( = ?auto_31993 ?auto_32004 ) ) ( not ( = ?auto_31994 ?auto_32004 ) ) ( not ( = ?auto_31992 ?auto_32004 ) ) ( not ( = ?auto_31997 ?auto_32004 ) ) ( IS-CRATE ?auto_31992 ) ( not ( = ?auto_31991 ?auto_31992 ) ) ( not ( = ?auto_31993 ?auto_31991 ) ) ( not ( = ?auto_31994 ?auto_31991 ) ) ( not ( = ?auto_31997 ?auto_31991 ) ) ( not ( = ?auto_32004 ?auto_31991 ) ) ( not ( = ?auto_32000 ?auto_31998 ) ) ( not ( = ?auto_31996 ?auto_32000 ) ) ( not ( = ?auto_31999 ?auto_32000 ) ) ( HOIST-AT ?auto_32001 ?auto_32000 ) ( not ( = ?auto_32003 ?auto_32001 ) ) ( not ( = ?auto_32005 ?auto_32001 ) ) ( not ( = ?auto_32002 ?auto_32001 ) ) ( SURFACE-AT ?auto_31992 ?auto_32000 ) ( ON ?auto_31992 ?auto_31995 ) ( CLEAR ?auto_31992 ) ( not ( = ?auto_31993 ?auto_31995 ) ) ( not ( = ?auto_31994 ?auto_31995 ) ) ( not ( = ?auto_31992 ?auto_31995 ) ) ( not ( = ?auto_31997 ?auto_31995 ) ) ( not ( = ?auto_32004 ?auto_31995 ) ) ( not ( = ?auto_31991 ?auto_31995 ) ) ( SURFACE-AT ?auto_31990 ?auto_31998 ) ( CLEAR ?auto_31990 ) ( IS-CRATE ?auto_31991 ) ( not ( = ?auto_31990 ?auto_31991 ) ) ( not ( = ?auto_31993 ?auto_31990 ) ) ( not ( = ?auto_31994 ?auto_31990 ) ) ( not ( = ?auto_31992 ?auto_31990 ) ) ( not ( = ?auto_31997 ?auto_31990 ) ) ( not ( = ?auto_32004 ?auto_31990 ) ) ( not ( = ?auto_31995 ?auto_31990 ) ) ( AVAILABLE ?auto_32003 ) ( TRUCK-AT ?auto_32006 ?auto_32000 ) ( LIFTING ?auto_32001 ?auto_31991 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31992 ?auto_31993 ?auto_31994 )
      ( MAKE-4CRATE-VERIFY ?auto_31990 ?auto_31991 ?auto_31992 ?auto_31993 ?auto_31994 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_32007 - SURFACE
      ?auto_32008 - SURFACE
      ?auto_32009 - SURFACE
      ?auto_32010 - SURFACE
      ?auto_32011 - SURFACE
      ?auto_32012 - SURFACE
    )
    :vars
    (
      ?auto_32021 - HOIST
      ?auto_32016 - PLACE
      ?auto_32014 - PLACE
      ?auto_32023 - HOIST
      ?auto_32015 - SURFACE
      ?auto_32017 - PLACE
      ?auto_32020 - HOIST
      ?auto_32022 - SURFACE
      ?auto_32018 - PLACE
      ?auto_32019 - HOIST
      ?auto_32013 - SURFACE
      ?auto_32024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32021 ?auto_32016 ) ( IS-CRATE ?auto_32012 ) ( not ( = ?auto_32011 ?auto_32012 ) ) ( not ( = ?auto_32010 ?auto_32011 ) ) ( not ( = ?auto_32010 ?auto_32012 ) ) ( not ( = ?auto_32014 ?auto_32016 ) ) ( HOIST-AT ?auto_32023 ?auto_32014 ) ( not ( = ?auto_32021 ?auto_32023 ) ) ( AVAILABLE ?auto_32023 ) ( SURFACE-AT ?auto_32012 ?auto_32014 ) ( ON ?auto_32012 ?auto_32015 ) ( CLEAR ?auto_32012 ) ( not ( = ?auto_32011 ?auto_32015 ) ) ( not ( = ?auto_32012 ?auto_32015 ) ) ( not ( = ?auto_32010 ?auto_32015 ) ) ( IS-CRATE ?auto_32011 ) ( not ( = ?auto_32017 ?auto_32016 ) ) ( not ( = ?auto_32014 ?auto_32017 ) ) ( HOIST-AT ?auto_32020 ?auto_32017 ) ( not ( = ?auto_32021 ?auto_32020 ) ) ( not ( = ?auto_32023 ?auto_32020 ) ) ( AVAILABLE ?auto_32020 ) ( SURFACE-AT ?auto_32011 ?auto_32017 ) ( ON ?auto_32011 ?auto_32022 ) ( CLEAR ?auto_32011 ) ( not ( = ?auto_32011 ?auto_32022 ) ) ( not ( = ?auto_32012 ?auto_32022 ) ) ( not ( = ?auto_32010 ?auto_32022 ) ) ( not ( = ?auto_32015 ?auto_32022 ) ) ( IS-CRATE ?auto_32010 ) ( not ( = ?auto_32009 ?auto_32010 ) ) ( not ( = ?auto_32011 ?auto_32009 ) ) ( not ( = ?auto_32012 ?auto_32009 ) ) ( not ( = ?auto_32015 ?auto_32009 ) ) ( not ( = ?auto_32022 ?auto_32009 ) ) ( not ( = ?auto_32018 ?auto_32016 ) ) ( not ( = ?auto_32014 ?auto_32018 ) ) ( not ( = ?auto_32017 ?auto_32018 ) ) ( HOIST-AT ?auto_32019 ?auto_32018 ) ( not ( = ?auto_32021 ?auto_32019 ) ) ( not ( = ?auto_32023 ?auto_32019 ) ) ( not ( = ?auto_32020 ?auto_32019 ) ) ( SURFACE-AT ?auto_32010 ?auto_32018 ) ( ON ?auto_32010 ?auto_32013 ) ( CLEAR ?auto_32010 ) ( not ( = ?auto_32011 ?auto_32013 ) ) ( not ( = ?auto_32012 ?auto_32013 ) ) ( not ( = ?auto_32010 ?auto_32013 ) ) ( not ( = ?auto_32015 ?auto_32013 ) ) ( not ( = ?auto_32022 ?auto_32013 ) ) ( not ( = ?auto_32009 ?auto_32013 ) ) ( SURFACE-AT ?auto_32008 ?auto_32016 ) ( CLEAR ?auto_32008 ) ( IS-CRATE ?auto_32009 ) ( not ( = ?auto_32008 ?auto_32009 ) ) ( not ( = ?auto_32011 ?auto_32008 ) ) ( not ( = ?auto_32012 ?auto_32008 ) ) ( not ( = ?auto_32010 ?auto_32008 ) ) ( not ( = ?auto_32015 ?auto_32008 ) ) ( not ( = ?auto_32022 ?auto_32008 ) ) ( not ( = ?auto_32013 ?auto_32008 ) ) ( AVAILABLE ?auto_32021 ) ( TRUCK-AT ?auto_32024 ?auto_32018 ) ( LIFTING ?auto_32019 ?auto_32009 ) ( ON ?auto_32008 ?auto_32007 ) ( not ( = ?auto_32007 ?auto_32008 ) ) ( not ( = ?auto_32007 ?auto_32009 ) ) ( not ( = ?auto_32007 ?auto_32010 ) ) ( not ( = ?auto_32007 ?auto_32011 ) ) ( not ( = ?auto_32007 ?auto_32012 ) ) ( not ( = ?auto_32007 ?auto_32015 ) ) ( not ( = ?auto_32007 ?auto_32022 ) ) ( not ( = ?auto_32007 ?auto_32013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32010 ?auto_32011 ?auto_32012 )
      ( MAKE-5CRATE-VERIFY ?auto_32007 ?auto_32008 ?auto_32009 ?auto_32010 ?auto_32011 ?auto_32012 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32025 - SURFACE
      ?auto_32026 - SURFACE
    )
    :vars
    (
      ?auto_32038 - HOIST
      ?auto_32030 - PLACE
      ?auto_32036 - SURFACE
      ?auto_32028 - PLACE
      ?auto_32040 - HOIST
      ?auto_32029 - SURFACE
      ?auto_32031 - PLACE
      ?auto_32037 - HOIST
      ?auto_32039 - SURFACE
      ?auto_32035 - SURFACE
      ?auto_32032 - PLACE
      ?auto_32033 - HOIST
      ?auto_32027 - SURFACE
      ?auto_32034 - SURFACE
      ?auto_32041 - TRUCK
      ?auto_32042 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32038 ?auto_32030 ) ( IS-CRATE ?auto_32026 ) ( not ( = ?auto_32025 ?auto_32026 ) ) ( not ( = ?auto_32036 ?auto_32025 ) ) ( not ( = ?auto_32036 ?auto_32026 ) ) ( not ( = ?auto_32028 ?auto_32030 ) ) ( HOIST-AT ?auto_32040 ?auto_32028 ) ( not ( = ?auto_32038 ?auto_32040 ) ) ( AVAILABLE ?auto_32040 ) ( SURFACE-AT ?auto_32026 ?auto_32028 ) ( ON ?auto_32026 ?auto_32029 ) ( CLEAR ?auto_32026 ) ( not ( = ?auto_32025 ?auto_32029 ) ) ( not ( = ?auto_32026 ?auto_32029 ) ) ( not ( = ?auto_32036 ?auto_32029 ) ) ( IS-CRATE ?auto_32025 ) ( not ( = ?auto_32031 ?auto_32030 ) ) ( not ( = ?auto_32028 ?auto_32031 ) ) ( HOIST-AT ?auto_32037 ?auto_32031 ) ( not ( = ?auto_32038 ?auto_32037 ) ) ( not ( = ?auto_32040 ?auto_32037 ) ) ( AVAILABLE ?auto_32037 ) ( SURFACE-AT ?auto_32025 ?auto_32031 ) ( ON ?auto_32025 ?auto_32039 ) ( CLEAR ?auto_32025 ) ( not ( = ?auto_32025 ?auto_32039 ) ) ( not ( = ?auto_32026 ?auto_32039 ) ) ( not ( = ?auto_32036 ?auto_32039 ) ) ( not ( = ?auto_32029 ?auto_32039 ) ) ( IS-CRATE ?auto_32036 ) ( not ( = ?auto_32035 ?auto_32036 ) ) ( not ( = ?auto_32025 ?auto_32035 ) ) ( not ( = ?auto_32026 ?auto_32035 ) ) ( not ( = ?auto_32029 ?auto_32035 ) ) ( not ( = ?auto_32039 ?auto_32035 ) ) ( not ( = ?auto_32032 ?auto_32030 ) ) ( not ( = ?auto_32028 ?auto_32032 ) ) ( not ( = ?auto_32031 ?auto_32032 ) ) ( HOIST-AT ?auto_32033 ?auto_32032 ) ( not ( = ?auto_32038 ?auto_32033 ) ) ( not ( = ?auto_32040 ?auto_32033 ) ) ( not ( = ?auto_32037 ?auto_32033 ) ) ( SURFACE-AT ?auto_32036 ?auto_32032 ) ( ON ?auto_32036 ?auto_32027 ) ( CLEAR ?auto_32036 ) ( not ( = ?auto_32025 ?auto_32027 ) ) ( not ( = ?auto_32026 ?auto_32027 ) ) ( not ( = ?auto_32036 ?auto_32027 ) ) ( not ( = ?auto_32029 ?auto_32027 ) ) ( not ( = ?auto_32039 ?auto_32027 ) ) ( not ( = ?auto_32035 ?auto_32027 ) ) ( SURFACE-AT ?auto_32034 ?auto_32030 ) ( CLEAR ?auto_32034 ) ( IS-CRATE ?auto_32035 ) ( not ( = ?auto_32034 ?auto_32035 ) ) ( not ( = ?auto_32025 ?auto_32034 ) ) ( not ( = ?auto_32026 ?auto_32034 ) ) ( not ( = ?auto_32036 ?auto_32034 ) ) ( not ( = ?auto_32029 ?auto_32034 ) ) ( not ( = ?auto_32039 ?auto_32034 ) ) ( not ( = ?auto_32027 ?auto_32034 ) ) ( AVAILABLE ?auto_32038 ) ( TRUCK-AT ?auto_32041 ?auto_32032 ) ( AVAILABLE ?auto_32033 ) ( SURFACE-AT ?auto_32035 ?auto_32032 ) ( ON ?auto_32035 ?auto_32042 ) ( CLEAR ?auto_32035 ) ( not ( = ?auto_32025 ?auto_32042 ) ) ( not ( = ?auto_32026 ?auto_32042 ) ) ( not ( = ?auto_32036 ?auto_32042 ) ) ( not ( = ?auto_32029 ?auto_32042 ) ) ( not ( = ?auto_32039 ?auto_32042 ) ) ( not ( = ?auto_32035 ?auto_32042 ) ) ( not ( = ?auto_32027 ?auto_32042 ) ) ( not ( = ?auto_32034 ?auto_32042 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32033 ?auto_32035 ?auto_32042 ?auto_32032 )
      ( MAKE-2CRATE ?auto_32036 ?auto_32025 ?auto_32026 )
      ( MAKE-1CRATE-VERIFY ?auto_32025 ?auto_32026 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32043 - SURFACE
      ?auto_32044 - SURFACE
      ?auto_32045 - SURFACE
    )
    :vars
    (
      ?auto_32058 - HOIST
      ?auto_32051 - PLACE
      ?auto_32052 - PLACE
      ?auto_32059 - HOIST
      ?auto_32046 - SURFACE
      ?auto_32057 - PLACE
      ?auto_32053 - HOIST
      ?auto_32055 - SURFACE
      ?auto_32048 - SURFACE
      ?auto_32060 - PLACE
      ?auto_32056 - HOIST
      ?auto_32049 - SURFACE
      ?auto_32050 - SURFACE
      ?auto_32054 - TRUCK
      ?auto_32047 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32058 ?auto_32051 ) ( IS-CRATE ?auto_32045 ) ( not ( = ?auto_32044 ?auto_32045 ) ) ( not ( = ?auto_32043 ?auto_32044 ) ) ( not ( = ?auto_32043 ?auto_32045 ) ) ( not ( = ?auto_32052 ?auto_32051 ) ) ( HOIST-AT ?auto_32059 ?auto_32052 ) ( not ( = ?auto_32058 ?auto_32059 ) ) ( AVAILABLE ?auto_32059 ) ( SURFACE-AT ?auto_32045 ?auto_32052 ) ( ON ?auto_32045 ?auto_32046 ) ( CLEAR ?auto_32045 ) ( not ( = ?auto_32044 ?auto_32046 ) ) ( not ( = ?auto_32045 ?auto_32046 ) ) ( not ( = ?auto_32043 ?auto_32046 ) ) ( IS-CRATE ?auto_32044 ) ( not ( = ?auto_32057 ?auto_32051 ) ) ( not ( = ?auto_32052 ?auto_32057 ) ) ( HOIST-AT ?auto_32053 ?auto_32057 ) ( not ( = ?auto_32058 ?auto_32053 ) ) ( not ( = ?auto_32059 ?auto_32053 ) ) ( AVAILABLE ?auto_32053 ) ( SURFACE-AT ?auto_32044 ?auto_32057 ) ( ON ?auto_32044 ?auto_32055 ) ( CLEAR ?auto_32044 ) ( not ( = ?auto_32044 ?auto_32055 ) ) ( not ( = ?auto_32045 ?auto_32055 ) ) ( not ( = ?auto_32043 ?auto_32055 ) ) ( not ( = ?auto_32046 ?auto_32055 ) ) ( IS-CRATE ?auto_32043 ) ( not ( = ?auto_32048 ?auto_32043 ) ) ( not ( = ?auto_32044 ?auto_32048 ) ) ( not ( = ?auto_32045 ?auto_32048 ) ) ( not ( = ?auto_32046 ?auto_32048 ) ) ( not ( = ?auto_32055 ?auto_32048 ) ) ( not ( = ?auto_32060 ?auto_32051 ) ) ( not ( = ?auto_32052 ?auto_32060 ) ) ( not ( = ?auto_32057 ?auto_32060 ) ) ( HOIST-AT ?auto_32056 ?auto_32060 ) ( not ( = ?auto_32058 ?auto_32056 ) ) ( not ( = ?auto_32059 ?auto_32056 ) ) ( not ( = ?auto_32053 ?auto_32056 ) ) ( SURFACE-AT ?auto_32043 ?auto_32060 ) ( ON ?auto_32043 ?auto_32049 ) ( CLEAR ?auto_32043 ) ( not ( = ?auto_32044 ?auto_32049 ) ) ( not ( = ?auto_32045 ?auto_32049 ) ) ( not ( = ?auto_32043 ?auto_32049 ) ) ( not ( = ?auto_32046 ?auto_32049 ) ) ( not ( = ?auto_32055 ?auto_32049 ) ) ( not ( = ?auto_32048 ?auto_32049 ) ) ( SURFACE-AT ?auto_32050 ?auto_32051 ) ( CLEAR ?auto_32050 ) ( IS-CRATE ?auto_32048 ) ( not ( = ?auto_32050 ?auto_32048 ) ) ( not ( = ?auto_32044 ?auto_32050 ) ) ( not ( = ?auto_32045 ?auto_32050 ) ) ( not ( = ?auto_32043 ?auto_32050 ) ) ( not ( = ?auto_32046 ?auto_32050 ) ) ( not ( = ?auto_32055 ?auto_32050 ) ) ( not ( = ?auto_32049 ?auto_32050 ) ) ( AVAILABLE ?auto_32058 ) ( TRUCK-AT ?auto_32054 ?auto_32060 ) ( AVAILABLE ?auto_32056 ) ( SURFACE-AT ?auto_32048 ?auto_32060 ) ( ON ?auto_32048 ?auto_32047 ) ( CLEAR ?auto_32048 ) ( not ( = ?auto_32044 ?auto_32047 ) ) ( not ( = ?auto_32045 ?auto_32047 ) ) ( not ( = ?auto_32043 ?auto_32047 ) ) ( not ( = ?auto_32046 ?auto_32047 ) ) ( not ( = ?auto_32055 ?auto_32047 ) ) ( not ( = ?auto_32048 ?auto_32047 ) ) ( not ( = ?auto_32049 ?auto_32047 ) ) ( not ( = ?auto_32050 ?auto_32047 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32044 ?auto_32045 )
      ( MAKE-2CRATE-VERIFY ?auto_32043 ?auto_32044 ?auto_32045 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32061 - SURFACE
      ?auto_32062 - SURFACE
      ?auto_32063 - SURFACE
      ?auto_32064 - SURFACE
    )
    :vars
    (
      ?auto_32070 - HOIST
      ?auto_32076 - PLACE
      ?auto_32067 - PLACE
      ?auto_32065 - HOIST
      ?auto_32071 - SURFACE
      ?auto_32069 - PLACE
      ?auto_32078 - HOIST
      ?auto_32075 - SURFACE
      ?auto_32068 - PLACE
      ?auto_32072 - HOIST
      ?auto_32074 - SURFACE
      ?auto_32073 - SURFACE
      ?auto_32077 - TRUCK
      ?auto_32066 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32070 ?auto_32076 ) ( IS-CRATE ?auto_32064 ) ( not ( = ?auto_32063 ?auto_32064 ) ) ( not ( = ?auto_32062 ?auto_32063 ) ) ( not ( = ?auto_32062 ?auto_32064 ) ) ( not ( = ?auto_32067 ?auto_32076 ) ) ( HOIST-AT ?auto_32065 ?auto_32067 ) ( not ( = ?auto_32070 ?auto_32065 ) ) ( AVAILABLE ?auto_32065 ) ( SURFACE-AT ?auto_32064 ?auto_32067 ) ( ON ?auto_32064 ?auto_32071 ) ( CLEAR ?auto_32064 ) ( not ( = ?auto_32063 ?auto_32071 ) ) ( not ( = ?auto_32064 ?auto_32071 ) ) ( not ( = ?auto_32062 ?auto_32071 ) ) ( IS-CRATE ?auto_32063 ) ( not ( = ?auto_32069 ?auto_32076 ) ) ( not ( = ?auto_32067 ?auto_32069 ) ) ( HOIST-AT ?auto_32078 ?auto_32069 ) ( not ( = ?auto_32070 ?auto_32078 ) ) ( not ( = ?auto_32065 ?auto_32078 ) ) ( AVAILABLE ?auto_32078 ) ( SURFACE-AT ?auto_32063 ?auto_32069 ) ( ON ?auto_32063 ?auto_32075 ) ( CLEAR ?auto_32063 ) ( not ( = ?auto_32063 ?auto_32075 ) ) ( not ( = ?auto_32064 ?auto_32075 ) ) ( not ( = ?auto_32062 ?auto_32075 ) ) ( not ( = ?auto_32071 ?auto_32075 ) ) ( IS-CRATE ?auto_32062 ) ( not ( = ?auto_32061 ?auto_32062 ) ) ( not ( = ?auto_32063 ?auto_32061 ) ) ( not ( = ?auto_32064 ?auto_32061 ) ) ( not ( = ?auto_32071 ?auto_32061 ) ) ( not ( = ?auto_32075 ?auto_32061 ) ) ( not ( = ?auto_32068 ?auto_32076 ) ) ( not ( = ?auto_32067 ?auto_32068 ) ) ( not ( = ?auto_32069 ?auto_32068 ) ) ( HOIST-AT ?auto_32072 ?auto_32068 ) ( not ( = ?auto_32070 ?auto_32072 ) ) ( not ( = ?auto_32065 ?auto_32072 ) ) ( not ( = ?auto_32078 ?auto_32072 ) ) ( SURFACE-AT ?auto_32062 ?auto_32068 ) ( ON ?auto_32062 ?auto_32074 ) ( CLEAR ?auto_32062 ) ( not ( = ?auto_32063 ?auto_32074 ) ) ( not ( = ?auto_32064 ?auto_32074 ) ) ( not ( = ?auto_32062 ?auto_32074 ) ) ( not ( = ?auto_32071 ?auto_32074 ) ) ( not ( = ?auto_32075 ?auto_32074 ) ) ( not ( = ?auto_32061 ?auto_32074 ) ) ( SURFACE-AT ?auto_32073 ?auto_32076 ) ( CLEAR ?auto_32073 ) ( IS-CRATE ?auto_32061 ) ( not ( = ?auto_32073 ?auto_32061 ) ) ( not ( = ?auto_32063 ?auto_32073 ) ) ( not ( = ?auto_32064 ?auto_32073 ) ) ( not ( = ?auto_32062 ?auto_32073 ) ) ( not ( = ?auto_32071 ?auto_32073 ) ) ( not ( = ?auto_32075 ?auto_32073 ) ) ( not ( = ?auto_32074 ?auto_32073 ) ) ( AVAILABLE ?auto_32070 ) ( TRUCK-AT ?auto_32077 ?auto_32068 ) ( AVAILABLE ?auto_32072 ) ( SURFACE-AT ?auto_32061 ?auto_32068 ) ( ON ?auto_32061 ?auto_32066 ) ( CLEAR ?auto_32061 ) ( not ( = ?auto_32063 ?auto_32066 ) ) ( not ( = ?auto_32064 ?auto_32066 ) ) ( not ( = ?auto_32062 ?auto_32066 ) ) ( not ( = ?auto_32071 ?auto_32066 ) ) ( not ( = ?auto_32075 ?auto_32066 ) ) ( not ( = ?auto_32061 ?auto_32066 ) ) ( not ( = ?auto_32074 ?auto_32066 ) ) ( not ( = ?auto_32073 ?auto_32066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32062 ?auto_32063 ?auto_32064 )
      ( MAKE-3CRATE-VERIFY ?auto_32061 ?auto_32062 ?auto_32063 ?auto_32064 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32079 - SURFACE
      ?auto_32080 - SURFACE
      ?auto_32081 - SURFACE
      ?auto_32082 - SURFACE
      ?auto_32083 - SURFACE
    )
    :vars
    (
      ?auto_32089 - HOIST
      ?auto_32094 - PLACE
      ?auto_32086 - PLACE
      ?auto_32084 - HOIST
      ?auto_32090 - SURFACE
      ?auto_32088 - PLACE
      ?auto_32096 - HOIST
      ?auto_32093 - SURFACE
      ?auto_32087 - PLACE
      ?auto_32091 - HOIST
      ?auto_32092 - SURFACE
      ?auto_32095 - TRUCK
      ?auto_32085 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32089 ?auto_32094 ) ( IS-CRATE ?auto_32083 ) ( not ( = ?auto_32082 ?auto_32083 ) ) ( not ( = ?auto_32081 ?auto_32082 ) ) ( not ( = ?auto_32081 ?auto_32083 ) ) ( not ( = ?auto_32086 ?auto_32094 ) ) ( HOIST-AT ?auto_32084 ?auto_32086 ) ( not ( = ?auto_32089 ?auto_32084 ) ) ( AVAILABLE ?auto_32084 ) ( SURFACE-AT ?auto_32083 ?auto_32086 ) ( ON ?auto_32083 ?auto_32090 ) ( CLEAR ?auto_32083 ) ( not ( = ?auto_32082 ?auto_32090 ) ) ( not ( = ?auto_32083 ?auto_32090 ) ) ( not ( = ?auto_32081 ?auto_32090 ) ) ( IS-CRATE ?auto_32082 ) ( not ( = ?auto_32088 ?auto_32094 ) ) ( not ( = ?auto_32086 ?auto_32088 ) ) ( HOIST-AT ?auto_32096 ?auto_32088 ) ( not ( = ?auto_32089 ?auto_32096 ) ) ( not ( = ?auto_32084 ?auto_32096 ) ) ( AVAILABLE ?auto_32096 ) ( SURFACE-AT ?auto_32082 ?auto_32088 ) ( ON ?auto_32082 ?auto_32093 ) ( CLEAR ?auto_32082 ) ( not ( = ?auto_32082 ?auto_32093 ) ) ( not ( = ?auto_32083 ?auto_32093 ) ) ( not ( = ?auto_32081 ?auto_32093 ) ) ( not ( = ?auto_32090 ?auto_32093 ) ) ( IS-CRATE ?auto_32081 ) ( not ( = ?auto_32080 ?auto_32081 ) ) ( not ( = ?auto_32082 ?auto_32080 ) ) ( not ( = ?auto_32083 ?auto_32080 ) ) ( not ( = ?auto_32090 ?auto_32080 ) ) ( not ( = ?auto_32093 ?auto_32080 ) ) ( not ( = ?auto_32087 ?auto_32094 ) ) ( not ( = ?auto_32086 ?auto_32087 ) ) ( not ( = ?auto_32088 ?auto_32087 ) ) ( HOIST-AT ?auto_32091 ?auto_32087 ) ( not ( = ?auto_32089 ?auto_32091 ) ) ( not ( = ?auto_32084 ?auto_32091 ) ) ( not ( = ?auto_32096 ?auto_32091 ) ) ( SURFACE-AT ?auto_32081 ?auto_32087 ) ( ON ?auto_32081 ?auto_32092 ) ( CLEAR ?auto_32081 ) ( not ( = ?auto_32082 ?auto_32092 ) ) ( not ( = ?auto_32083 ?auto_32092 ) ) ( not ( = ?auto_32081 ?auto_32092 ) ) ( not ( = ?auto_32090 ?auto_32092 ) ) ( not ( = ?auto_32093 ?auto_32092 ) ) ( not ( = ?auto_32080 ?auto_32092 ) ) ( SURFACE-AT ?auto_32079 ?auto_32094 ) ( CLEAR ?auto_32079 ) ( IS-CRATE ?auto_32080 ) ( not ( = ?auto_32079 ?auto_32080 ) ) ( not ( = ?auto_32082 ?auto_32079 ) ) ( not ( = ?auto_32083 ?auto_32079 ) ) ( not ( = ?auto_32081 ?auto_32079 ) ) ( not ( = ?auto_32090 ?auto_32079 ) ) ( not ( = ?auto_32093 ?auto_32079 ) ) ( not ( = ?auto_32092 ?auto_32079 ) ) ( AVAILABLE ?auto_32089 ) ( TRUCK-AT ?auto_32095 ?auto_32087 ) ( AVAILABLE ?auto_32091 ) ( SURFACE-AT ?auto_32080 ?auto_32087 ) ( ON ?auto_32080 ?auto_32085 ) ( CLEAR ?auto_32080 ) ( not ( = ?auto_32082 ?auto_32085 ) ) ( not ( = ?auto_32083 ?auto_32085 ) ) ( not ( = ?auto_32081 ?auto_32085 ) ) ( not ( = ?auto_32090 ?auto_32085 ) ) ( not ( = ?auto_32093 ?auto_32085 ) ) ( not ( = ?auto_32080 ?auto_32085 ) ) ( not ( = ?auto_32092 ?auto_32085 ) ) ( not ( = ?auto_32079 ?auto_32085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32081 ?auto_32082 ?auto_32083 )
      ( MAKE-4CRATE-VERIFY ?auto_32079 ?auto_32080 ?auto_32081 ?auto_32082 ?auto_32083 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_32097 - SURFACE
      ?auto_32098 - SURFACE
      ?auto_32099 - SURFACE
      ?auto_32100 - SURFACE
      ?auto_32101 - SURFACE
      ?auto_32102 - SURFACE
    )
    :vars
    (
      ?auto_32108 - HOIST
      ?auto_32113 - PLACE
      ?auto_32105 - PLACE
      ?auto_32103 - HOIST
      ?auto_32109 - SURFACE
      ?auto_32107 - PLACE
      ?auto_32115 - HOIST
      ?auto_32112 - SURFACE
      ?auto_32106 - PLACE
      ?auto_32110 - HOIST
      ?auto_32111 - SURFACE
      ?auto_32114 - TRUCK
      ?auto_32104 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32108 ?auto_32113 ) ( IS-CRATE ?auto_32102 ) ( not ( = ?auto_32101 ?auto_32102 ) ) ( not ( = ?auto_32100 ?auto_32101 ) ) ( not ( = ?auto_32100 ?auto_32102 ) ) ( not ( = ?auto_32105 ?auto_32113 ) ) ( HOIST-AT ?auto_32103 ?auto_32105 ) ( not ( = ?auto_32108 ?auto_32103 ) ) ( AVAILABLE ?auto_32103 ) ( SURFACE-AT ?auto_32102 ?auto_32105 ) ( ON ?auto_32102 ?auto_32109 ) ( CLEAR ?auto_32102 ) ( not ( = ?auto_32101 ?auto_32109 ) ) ( not ( = ?auto_32102 ?auto_32109 ) ) ( not ( = ?auto_32100 ?auto_32109 ) ) ( IS-CRATE ?auto_32101 ) ( not ( = ?auto_32107 ?auto_32113 ) ) ( not ( = ?auto_32105 ?auto_32107 ) ) ( HOIST-AT ?auto_32115 ?auto_32107 ) ( not ( = ?auto_32108 ?auto_32115 ) ) ( not ( = ?auto_32103 ?auto_32115 ) ) ( AVAILABLE ?auto_32115 ) ( SURFACE-AT ?auto_32101 ?auto_32107 ) ( ON ?auto_32101 ?auto_32112 ) ( CLEAR ?auto_32101 ) ( not ( = ?auto_32101 ?auto_32112 ) ) ( not ( = ?auto_32102 ?auto_32112 ) ) ( not ( = ?auto_32100 ?auto_32112 ) ) ( not ( = ?auto_32109 ?auto_32112 ) ) ( IS-CRATE ?auto_32100 ) ( not ( = ?auto_32099 ?auto_32100 ) ) ( not ( = ?auto_32101 ?auto_32099 ) ) ( not ( = ?auto_32102 ?auto_32099 ) ) ( not ( = ?auto_32109 ?auto_32099 ) ) ( not ( = ?auto_32112 ?auto_32099 ) ) ( not ( = ?auto_32106 ?auto_32113 ) ) ( not ( = ?auto_32105 ?auto_32106 ) ) ( not ( = ?auto_32107 ?auto_32106 ) ) ( HOIST-AT ?auto_32110 ?auto_32106 ) ( not ( = ?auto_32108 ?auto_32110 ) ) ( not ( = ?auto_32103 ?auto_32110 ) ) ( not ( = ?auto_32115 ?auto_32110 ) ) ( SURFACE-AT ?auto_32100 ?auto_32106 ) ( ON ?auto_32100 ?auto_32111 ) ( CLEAR ?auto_32100 ) ( not ( = ?auto_32101 ?auto_32111 ) ) ( not ( = ?auto_32102 ?auto_32111 ) ) ( not ( = ?auto_32100 ?auto_32111 ) ) ( not ( = ?auto_32109 ?auto_32111 ) ) ( not ( = ?auto_32112 ?auto_32111 ) ) ( not ( = ?auto_32099 ?auto_32111 ) ) ( SURFACE-AT ?auto_32098 ?auto_32113 ) ( CLEAR ?auto_32098 ) ( IS-CRATE ?auto_32099 ) ( not ( = ?auto_32098 ?auto_32099 ) ) ( not ( = ?auto_32101 ?auto_32098 ) ) ( not ( = ?auto_32102 ?auto_32098 ) ) ( not ( = ?auto_32100 ?auto_32098 ) ) ( not ( = ?auto_32109 ?auto_32098 ) ) ( not ( = ?auto_32112 ?auto_32098 ) ) ( not ( = ?auto_32111 ?auto_32098 ) ) ( AVAILABLE ?auto_32108 ) ( TRUCK-AT ?auto_32114 ?auto_32106 ) ( AVAILABLE ?auto_32110 ) ( SURFACE-AT ?auto_32099 ?auto_32106 ) ( ON ?auto_32099 ?auto_32104 ) ( CLEAR ?auto_32099 ) ( not ( = ?auto_32101 ?auto_32104 ) ) ( not ( = ?auto_32102 ?auto_32104 ) ) ( not ( = ?auto_32100 ?auto_32104 ) ) ( not ( = ?auto_32109 ?auto_32104 ) ) ( not ( = ?auto_32112 ?auto_32104 ) ) ( not ( = ?auto_32099 ?auto_32104 ) ) ( not ( = ?auto_32111 ?auto_32104 ) ) ( not ( = ?auto_32098 ?auto_32104 ) ) ( ON ?auto_32098 ?auto_32097 ) ( not ( = ?auto_32097 ?auto_32098 ) ) ( not ( = ?auto_32097 ?auto_32099 ) ) ( not ( = ?auto_32097 ?auto_32100 ) ) ( not ( = ?auto_32097 ?auto_32101 ) ) ( not ( = ?auto_32097 ?auto_32102 ) ) ( not ( = ?auto_32097 ?auto_32109 ) ) ( not ( = ?auto_32097 ?auto_32112 ) ) ( not ( = ?auto_32097 ?auto_32111 ) ) ( not ( = ?auto_32097 ?auto_32104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32100 ?auto_32101 ?auto_32102 )
      ( MAKE-5CRATE-VERIFY ?auto_32097 ?auto_32098 ?auto_32099 ?auto_32100 ?auto_32101 ?auto_32102 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32116 - SURFACE
      ?auto_32117 - SURFACE
    )
    :vars
    (
      ?auto_32124 - HOIST
      ?auto_32131 - PLACE
      ?auto_32120 - SURFACE
      ?auto_32121 - PLACE
      ?auto_32118 - HOIST
      ?auto_32125 - SURFACE
      ?auto_32123 - PLACE
      ?auto_32133 - HOIST
      ?auto_32130 - SURFACE
      ?auto_32129 - SURFACE
      ?auto_32122 - PLACE
      ?auto_32126 - HOIST
      ?auto_32128 - SURFACE
      ?auto_32127 - SURFACE
      ?auto_32119 - SURFACE
      ?auto_32132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32124 ?auto_32131 ) ( IS-CRATE ?auto_32117 ) ( not ( = ?auto_32116 ?auto_32117 ) ) ( not ( = ?auto_32120 ?auto_32116 ) ) ( not ( = ?auto_32120 ?auto_32117 ) ) ( not ( = ?auto_32121 ?auto_32131 ) ) ( HOIST-AT ?auto_32118 ?auto_32121 ) ( not ( = ?auto_32124 ?auto_32118 ) ) ( AVAILABLE ?auto_32118 ) ( SURFACE-AT ?auto_32117 ?auto_32121 ) ( ON ?auto_32117 ?auto_32125 ) ( CLEAR ?auto_32117 ) ( not ( = ?auto_32116 ?auto_32125 ) ) ( not ( = ?auto_32117 ?auto_32125 ) ) ( not ( = ?auto_32120 ?auto_32125 ) ) ( IS-CRATE ?auto_32116 ) ( not ( = ?auto_32123 ?auto_32131 ) ) ( not ( = ?auto_32121 ?auto_32123 ) ) ( HOIST-AT ?auto_32133 ?auto_32123 ) ( not ( = ?auto_32124 ?auto_32133 ) ) ( not ( = ?auto_32118 ?auto_32133 ) ) ( AVAILABLE ?auto_32133 ) ( SURFACE-AT ?auto_32116 ?auto_32123 ) ( ON ?auto_32116 ?auto_32130 ) ( CLEAR ?auto_32116 ) ( not ( = ?auto_32116 ?auto_32130 ) ) ( not ( = ?auto_32117 ?auto_32130 ) ) ( not ( = ?auto_32120 ?auto_32130 ) ) ( not ( = ?auto_32125 ?auto_32130 ) ) ( IS-CRATE ?auto_32120 ) ( not ( = ?auto_32129 ?auto_32120 ) ) ( not ( = ?auto_32116 ?auto_32129 ) ) ( not ( = ?auto_32117 ?auto_32129 ) ) ( not ( = ?auto_32125 ?auto_32129 ) ) ( not ( = ?auto_32130 ?auto_32129 ) ) ( not ( = ?auto_32122 ?auto_32131 ) ) ( not ( = ?auto_32121 ?auto_32122 ) ) ( not ( = ?auto_32123 ?auto_32122 ) ) ( HOIST-AT ?auto_32126 ?auto_32122 ) ( not ( = ?auto_32124 ?auto_32126 ) ) ( not ( = ?auto_32118 ?auto_32126 ) ) ( not ( = ?auto_32133 ?auto_32126 ) ) ( SURFACE-AT ?auto_32120 ?auto_32122 ) ( ON ?auto_32120 ?auto_32128 ) ( CLEAR ?auto_32120 ) ( not ( = ?auto_32116 ?auto_32128 ) ) ( not ( = ?auto_32117 ?auto_32128 ) ) ( not ( = ?auto_32120 ?auto_32128 ) ) ( not ( = ?auto_32125 ?auto_32128 ) ) ( not ( = ?auto_32130 ?auto_32128 ) ) ( not ( = ?auto_32129 ?auto_32128 ) ) ( SURFACE-AT ?auto_32127 ?auto_32131 ) ( CLEAR ?auto_32127 ) ( IS-CRATE ?auto_32129 ) ( not ( = ?auto_32127 ?auto_32129 ) ) ( not ( = ?auto_32116 ?auto_32127 ) ) ( not ( = ?auto_32117 ?auto_32127 ) ) ( not ( = ?auto_32120 ?auto_32127 ) ) ( not ( = ?auto_32125 ?auto_32127 ) ) ( not ( = ?auto_32130 ?auto_32127 ) ) ( not ( = ?auto_32128 ?auto_32127 ) ) ( AVAILABLE ?auto_32124 ) ( AVAILABLE ?auto_32126 ) ( SURFACE-AT ?auto_32129 ?auto_32122 ) ( ON ?auto_32129 ?auto_32119 ) ( CLEAR ?auto_32129 ) ( not ( = ?auto_32116 ?auto_32119 ) ) ( not ( = ?auto_32117 ?auto_32119 ) ) ( not ( = ?auto_32120 ?auto_32119 ) ) ( not ( = ?auto_32125 ?auto_32119 ) ) ( not ( = ?auto_32130 ?auto_32119 ) ) ( not ( = ?auto_32129 ?auto_32119 ) ) ( not ( = ?auto_32128 ?auto_32119 ) ) ( not ( = ?auto_32127 ?auto_32119 ) ) ( TRUCK-AT ?auto_32132 ?auto_32131 ) )
    :subtasks
    ( ( !DRIVE ?auto_32132 ?auto_32131 ?auto_32122 )
      ( MAKE-2CRATE ?auto_32120 ?auto_32116 ?auto_32117 )
      ( MAKE-1CRATE-VERIFY ?auto_32116 ?auto_32117 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32134 - SURFACE
      ?auto_32135 - SURFACE
      ?auto_32136 - SURFACE
    )
    :vars
    (
      ?auto_32146 - HOIST
      ?auto_32142 - PLACE
      ?auto_32139 - PLACE
      ?auto_32145 - HOIST
      ?auto_32138 - SURFACE
      ?auto_32148 - PLACE
      ?auto_32149 - HOIST
      ?auto_32151 - SURFACE
      ?auto_32141 - SURFACE
      ?auto_32143 - PLACE
      ?auto_32144 - HOIST
      ?auto_32147 - SURFACE
      ?auto_32150 - SURFACE
      ?auto_32140 - SURFACE
      ?auto_32137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32146 ?auto_32142 ) ( IS-CRATE ?auto_32136 ) ( not ( = ?auto_32135 ?auto_32136 ) ) ( not ( = ?auto_32134 ?auto_32135 ) ) ( not ( = ?auto_32134 ?auto_32136 ) ) ( not ( = ?auto_32139 ?auto_32142 ) ) ( HOIST-AT ?auto_32145 ?auto_32139 ) ( not ( = ?auto_32146 ?auto_32145 ) ) ( AVAILABLE ?auto_32145 ) ( SURFACE-AT ?auto_32136 ?auto_32139 ) ( ON ?auto_32136 ?auto_32138 ) ( CLEAR ?auto_32136 ) ( not ( = ?auto_32135 ?auto_32138 ) ) ( not ( = ?auto_32136 ?auto_32138 ) ) ( not ( = ?auto_32134 ?auto_32138 ) ) ( IS-CRATE ?auto_32135 ) ( not ( = ?auto_32148 ?auto_32142 ) ) ( not ( = ?auto_32139 ?auto_32148 ) ) ( HOIST-AT ?auto_32149 ?auto_32148 ) ( not ( = ?auto_32146 ?auto_32149 ) ) ( not ( = ?auto_32145 ?auto_32149 ) ) ( AVAILABLE ?auto_32149 ) ( SURFACE-AT ?auto_32135 ?auto_32148 ) ( ON ?auto_32135 ?auto_32151 ) ( CLEAR ?auto_32135 ) ( not ( = ?auto_32135 ?auto_32151 ) ) ( not ( = ?auto_32136 ?auto_32151 ) ) ( not ( = ?auto_32134 ?auto_32151 ) ) ( not ( = ?auto_32138 ?auto_32151 ) ) ( IS-CRATE ?auto_32134 ) ( not ( = ?auto_32141 ?auto_32134 ) ) ( not ( = ?auto_32135 ?auto_32141 ) ) ( not ( = ?auto_32136 ?auto_32141 ) ) ( not ( = ?auto_32138 ?auto_32141 ) ) ( not ( = ?auto_32151 ?auto_32141 ) ) ( not ( = ?auto_32143 ?auto_32142 ) ) ( not ( = ?auto_32139 ?auto_32143 ) ) ( not ( = ?auto_32148 ?auto_32143 ) ) ( HOIST-AT ?auto_32144 ?auto_32143 ) ( not ( = ?auto_32146 ?auto_32144 ) ) ( not ( = ?auto_32145 ?auto_32144 ) ) ( not ( = ?auto_32149 ?auto_32144 ) ) ( SURFACE-AT ?auto_32134 ?auto_32143 ) ( ON ?auto_32134 ?auto_32147 ) ( CLEAR ?auto_32134 ) ( not ( = ?auto_32135 ?auto_32147 ) ) ( not ( = ?auto_32136 ?auto_32147 ) ) ( not ( = ?auto_32134 ?auto_32147 ) ) ( not ( = ?auto_32138 ?auto_32147 ) ) ( not ( = ?auto_32151 ?auto_32147 ) ) ( not ( = ?auto_32141 ?auto_32147 ) ) ( SURFACE-AT ?auto_32150 ?auto_32142 ) ( CLEAR ?auto_32150 ) ( IS-CRATE ?auto_32141 ) ( not ( = ?auto_32150 ?auto_32141 ) ) ( not ( = ?auto_32135 ?auto_32150 ) ) ( not ( = ?auto_32136 ?auto_32150 ) ) ( not ( = ?auto_32134 ?auto_32150 ) ) ( not ( = ?auto_32138 ?auto_32150 ) ) ( not ( = ?auto_32151 ?auto_32150 ) ) ( not ( = ?auto_32147 ?auto_32150 ) ) ( AVAILABLE ?auto_32146 ) ( AVAILABLE ?auto_32144 ) ( SURFACE-AT ?auto_32141 ?auto_32143 ) ( ON ?auto_32141 ?auto_32140 ) ( CLEAR ?auto_32141 ) ( not ( = ?auto_32135 ?auto_32140 ) ) ( not ( = ?auto_32136 ?auto_32140 ) ) ( not ( = ?auto_32134 ?auto_32140 ) ) ( not ( = ?auto_32138 ?auto_32140 ) ) ( not ( = ?auto_32151 ?auto_32140 ) ) ( not ( = ?auto_32141 ?auto_32140 ) ) ( not ( = ?auto_32147 ?auto_32140 ) ) ( not ( = ?auto_32150 ?auto_32140 ) ) ( TRUCK-AT ?auto_32137 ?auto_32142 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32135 ?auto_32136 )
      ( MAKE-2CRATE-VERIFY ?auto_32134 ?auto_32135 ?auto_32136 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32152 - SURFACE
      ?auto_32153 - SURFACE
      ?auto_32154 - SURFACE
      ?auto_32155 - SURFACE
    )
    :vars
    (
      ?auto_32165 - HOIST
      ?auto_32160 - PLACE
      ?auto_32167 - PLACE
      ?auto_32156 - HOIST
      ?auto_32168 - SURFACE
      ?auto_32159 - PLACE
      ?auto_32169 - HOIST
      ?auto_32164 - SURFACE
      ?auto_32158 - PLACE
      ?auto_32163 - HOIST
      ?auto_32161 - SURFACE
      ?auto_32157 - SURFACE
      ?auto_32162 - SURFACE
      ?auto_32166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32165 ?auto_32160 ) ( IS-CRATE ?auto_32155 ) ( not ( = ?auto_32154 ?auto_32155 ) ) ( not ( = ?auto_32153 ?auto_32154 ) ) ( not ( = ?auto_32153 ?auto_32155 ) ) ( not ( = ?auto_32167 ?auto_32160 ) ) ( HOIST-AT ?auto_32156 ?auto_32167 ) ( not ( = ?auto_32165 ?auto_32156 ) ) ( AVAILABLE ?auto_32156 ) ( SURFACE-AT ?auto_32155 ?auto_32167 ) ( ON ?auto_32155 ?auto_32168 ) ( CLEAR ?auto_32155 ) ( not ( = ?auto_32154 ?auto_32168 ) ) ( not ( = ?auto_32155 ?auto_32168 ) ) ( not ( = ?auto_32153 ?auto_32168 ) ) ( IS-CRATE ?auto_32154 ) ( not ( = ?auto_32159 ?auto_32160 ) ) ( not ( = ?auto_32167 ?auto_32159 ) ) ( HOIST-AT ?auto_32169 ?auto_32159 ) ( not ( = ?auto_32165 ?auto_32169 ) ) ( not ( = ?auto_32156 ?auto_32169 ) ) ( AVAILABLE ?auto_32169 ) ( SURFACE-AT ?auto_32154 ?auto_32159 ) ( ON ?auto_32154 ?auto_32164 ) ( CLEAR ?auto_32154 ) ( not ( = ?auto_32154 ?auto_32164 ) ) ( not ( = ?auto_32155 ?auto_32164 ) ) ( not ( = ?auto_32153 ?auto_32164 ) ) ( not ( = ?auto_32168 ?auto_32164 ) ) ( IS-CRATE ?auto_32153 ) ( not ( = ?auto_32152 ?auto_32153 ) ) ( not ( = ?auto_32154 ?auto_32152 ) ) ( not ( = ?auto_32155 ?auto_32152 ) ) ( not ( = ?auto_32168 ?auto_32152 ) ) ( not ( = ?auto_32164 ?auto_32152 ) ) ( not ( = ?auto_32158 ?auto_32160 ) ) ( not ( = ?auto_32167 ?auto_32158 ) ) ( not ( = ?auto_32159 ?auto_32158 ) ) ( HOIST-AT ?auto_32163 ?auto_32158 ) ( not ( = ?auto_32165 ?auto_32163 ) ) ( not ( = ?auto_32156 ?auto_32163 ) ) ( not ( = ?auto_32169 ?auto_32163 ) ) ( SURFACE-AT ?auto_32153 ?auto_32158 ) ( ON ?auto_32153 ?auto_32161 ) ( CLEAR ?auto_32153 ) ( not ( = ?auto_32154 ?auto_32161 ) ) ( not ( = ?auto_32155 ?auto_32161 ) ) ( not ( = ?auto_32153 ?auto_32161 ) ) ( not ( = ?auto_32168 ?auto_32161 ) ) ( not ( = ?auto_32164 ?auto_32161 ) ) ( not ( = ?auto_32152 ?auto_32161 ) ) ( SURFACE-AT ?auto_32157 ?auto_32160 ) ( CLEAR ?auto_32157 ) ( IS-CRATE ?auto_32152 ) ( not ( = ?auto_32157 ?auto_32152 ) ) ( not ( = ?auto_32154 ?auto_32157 ) ) ( not ( = ?auto_32155 ?auto_32157 ) ) ( not ( = ?auto_32153 ?auto_32157 ) ) ( not ( = ?auto_32168 ?auto_32157 ) ) ( not ( = ?auto_32164 ?auto_32157 ) ) ( not ( = ?auto_32161 ?auto_32157 ) ) ( AVAILABLE ?auto_32165 ) ( AVAILABLE ?auto_32163 ) ( SURFACE-AT ?auto_32152 ?auto_32158 ) ( ON ?auto_32152 ?auto_32162 ) ( CLEAR ?auto_32152 ) ( not ( = ?auto_32154 ?auto_32162 ) ) ( not ( = ?auto_32155 ?auto_32162 ) ) ( not ( = ?auto_32153 ?auto_32162 ) ) ( not ( = ?auto_32168 ?auto_32162 ) ) ( not ( = ?auto_32164 ?auto_32162 ) ) ( not ( = ?auto_32152 ?auto_32162 ) ) ( not ( = ?auto_32161 ?auto_32162 ) ) ( not ( = ?auto_32157 ?auto_32162 ) ) ( TRUCK-AT ?auto_32166 ?auto_32160 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32153 ?auto_32154 ?auto_32155 )
      ( MAKE-3CRATE-VERIFY ?auto_32152 ?auto_32153 ?auto_32154 ?auto_32155 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32170 - SURFACE
      ?auto_32171 - SURFACE
      ?auto_32172 - SURFACE
      ?auto_32173 - SURFACE
      ?auto_32174 - SURFACE
    )
    :vars
    (
      ?auto_32183 - HOIST
      ?auto_32178 - PLACE
      ?auto_32185 - PLACE
      ?auto_32175 - HOIST
      ?auto_32186 - SURFACE
      ?auto_32177 - PLACE
      ?auto_32187 - HOIST
      ?auto_32182 - SURFACE
      ?auto_32176 - PLACE
      ?auto_32181 - HOIST
      ?auto_32179 - SURFACE
      ?auto_32180 - SURFACE
      ?auto_32184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32183 ?auto_32178 ) ( IS-CRATE ?auto_32174 ) ( not ( = ?auto_32173 ?auto_32174 ) ) ( not ( = ?auto_32172 ?auto_32173 ) ) ( not ( = ?auto_32172 ?auto_32174 ) ) ( not ( = ?auto_32185 ?auto_32178 ) ) ( HOIST-AT ?auto_32175 ?auto_32185 ) ( not ( = ?auto_32183 ?auto_32175 ) ) ( AVAILABLE ?auto_32175 ) ( SURFACE-AT ?auto_32174 ?auto_32185 ) ( ON ?auto_32174 ?auto_32186 ) ( CLEAR ?auto_32174 ) ( not ( = ?auto_32173 ?auto_32186 ) ) ( not ( = ?auto_32174 ?auto_32186 ) ) ( not ( = ?auto_32172 ?auto_32186 ) ) ( IS-CRATE ?auto_32173 ) ( not ( = ?auto_32177 ?auto_32178 ) ) ( not ( = ?auto_32185 ?auto_32177 ) ) ( HOIST-AT ?auto_32187 ?auto_32177 ) ( not ( = ?auto_32183 ?auto_32187 ) ) ( not ( = ?auto_32175 ?auto_32187 ) ) ( AVAILABLE ?auto_32187 ) ( SURFACE-AT ?auto_32173 ?auto_32177 ) ( ON ?auto_32173 ?auto_32182 ) ( CLEAR ?auto_32173 ) ( not ( = ?auto_32173 ?auto_32182 ) ) ( not ( = ?auto_32174 ?auto_32182 ) ) ( not ( = ?auto_32172 ?auto_32182 ) ) ( not ( = ?auto_32186 ?auto_32182 ) ) ( IS-CRATE ?auto_32172 ) ( not ( = ?auto_32171 ?auto_32172 ) ) ( not ( = ?auto_32173 ?auto_32171 ) ) ( not ( = ?auto_32174 ?auto_32171 ) ) ( not ( = ?auto_32186 ?auto_32171 ) ) ( not ( = ?auto_32182 ?auto_32171 ) ) ( not ( = ?auto_32176 ?auto_32178 ) ) ( not ( = ?auto_32185 ?auto_32176 ) ) ( not ( = ?auto_32177 ?auto_32176 ) ) ( HOIST-AT ?auto_32181 ?auto_32176 ) ( not ( = ?auto_32183 ?auto_32181 ) ) ( not ( = ?auto_32175 ?auto_32181 ) ) ( not ( = ?auto_32187 ?auto_32181 ) ) ( SURFACE-AT ?auto_32172 ?auto_32176 ) ( ON ?auto_32172 ?auto_32179 ) ( CLEAR ?auto_32172 ) ( not ( = ?auto_32173 ?auto_32179 ) ) ( not ( = ?auto_32174 ?auto_32179 ) ) ( not ( = ?auto_32172 ?auto_32179 ) ) ( not ( = ?auto_32186 ?auto_32179 ) ) ( not ( = ?auto_32182 ?auto_32179 ) ) ( not ( = ?auto_32171 ?auto_32179 ) ) ( SURFACE-AT ?auto_32170 ?auto_32178 ) ( CLEAR ?auto_32170 ) ( IS-CRATE ?auto_32171 ) ( not ( = ?auto_32170 ?auto_32171 ) ) ( not ( = ?auto_32173 ?auto_32170 ) ) ( not ( = ?auto_32174 ?auto_32170 ) ) ( not ( = ?auto_32172 ?auto_32170 ) ) ( not ( = ?auto_32186 ?auto_32170 ) ) ( not ( = ?auto_32182 ?auto_32170 ) ) ( not ( = ?auto_32179 ?auto_32170 ) ) ( AVAILABLE ?auto_32183 ) ( AVAILABLE ?auto_32181 ) ( SURFACE-AT ?auto_32171 ?auto_32176 ) ( ON ?auto_32171 ?auto_32180 ) ( CLEAR ?auto_32171 ) ( not ( = ?auto_32173 ?auto_32180 ) ) ( not ( = ?auto_32174 ?auto_32180 ) ) ( not ( = ?auto_32172 ?auto_32180 ) ) ( not ( = ?auto_32186 ?auto_32180 ) ) ( not ( = ?auto_32182 ?auto_32180 ) ) ( not ( = ?auto_32171 ?auto_32180 ) ) ( not ( = ?auto_32179 ?auto_32180 ) ) ( not ( = ?auto_32170 ?auto_32180 ) ) ( TRUCK-AT ?auto_32184 ?auto_32178 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32172 ?auto_32173 ?auto_32174 )
      ( MAKE-4CRATE-VERIFY ?auto_32170 ?auto_32171 ?auto_32172 ?auto_32173 ?auto_32174 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_32188 - SURFACE
      ?auto_32189 - SURFACE
      ?auto_32190 - SURFACE
      ?auto_32191 - SURFACE
      ?auto_32192 - SURFACE
      ?auto_32193 - SURFACE
    )
    :vars
    (
      ?auto_32202 - HOIST
      ?auto_32197 - PLACE
      ?auto_32204 - PLACE
      ?auto_32194 - HOIST
      ?auto_32205 - SURFACE
      ?auto_32196 - PLACE
      ?auto_32206 - HOIST
      ?auto_32201 - SURFACE
      ?auto_32195 - PLACE
      ?auto_32200 - HOIST
      ?auto_32198 - SURFACE
      ?auto_32199 - SURFACE
      ?auto_32203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32202 ?auto_32197 ) ( IS-CRATE ?auto_32193 ) ( not ( = ?auto_32192 ?auto_32193 ) ) ( not ( = ?auto_32191 ?auto_32192 ) ) ( not ( = ?auto_32191 ?auto_32193 ) ) ( not ( = ?auto_32204 ?auto_32197 ) ) ( HOIST-AT ?auto_32194 ?auto_32204 ) ( not ( = ?auto_32202 ?auto_32194 ) ) ( AVAILABLE ?auto_32194 ) ( SURFACE-AT ?auto_32193 ?auto_32204 ) ( ON ?auto_32193 ?auto_32205 ) ( CLEAR ?auto_32193 ) ( not ( = ?auto_32192 ?auto_32205 ) ) ( not ( = ?auto_32193 ?auto_32205 ) ) ( not ( = ?auto_32191 ?auto_32205 ) ) ( IS-CRATE ?auto_32192 ) ( not ( = ?auto_32196 ?auto_32197 ) ) ( not ( = ?auto_32204 ?auto_32196 ) ) ( HOIST-AT ?auto_32206 ?auto_32196 ) ( not ( = ?auto_32202 ?auto_32206 ) ) ( not ( = ?auto_32194 ?auto_32206 ) ) ( AVAILABLE ?auto_32206 ) ( SURFACE-AT ?auto_32192 ?auto_32196 ) ( ON ?auto_32192 ?auto_32201 ) ( CLEAR ?auto_32192 ) ( not ( = ?auto_32192 ?auto_32201 ) ) ( not ( = ?auto_32193 ?auto_32201 ) ) ( not ( = ?auto_32191 ?auto_32201 ) ) ( not ( = ?auto_32205 ?auto_32201 ) ) ( IS-CRATE ?auto_32191 ) ( not ( = ?auto_32190 ?auto_32191 ) ) ( not ( = ?auto_32192 ?auto_32190 ) ) ( not ( = ?auto_32193 ?auto_32190 ) ) ( not ( = ?auto_32205 ?auto_32190 ) ) ( not ( = ?auto_32201 ?auto_32190 ) ) ( not ( = ?auto_32195 ?auto_32197 ) ) ( not ( = ?auto_32204 ?auto_32195 ) ) ( not ( = ?auto_32196 ?auto_32195 ) ) ( HOIST-AT ?auto_32200 ?auto_32195 ) ( not ( = ?auto_32202 ?auto_32200 ) ) ( not ( = ?auto_32194 ?auto_32200 ) ) ( not ( = ?auto_32206 ?auto_32200 ) ) ( SURFACE-AT ?auto_32191 ?auto_32195 ) ( ON ?auto_32191 ?auto_32198 ) ( CLEAR ?auto_32191 ) ( not ( = ?auto_32192 ?auto_32198 ) ) ( not ( = ?auto_32193 ?auto_32198 ) ) ( not ( = ?auto_32191 ?auto_32198 ) ) ( not ( = ?auto_32205 ?auto_32198 ) ) ( not ( = ?auto_32201 ?auto_32198 ) ) ( not ( = ?auto_32190 ?auto_32198 ) ) ( SURFACE-AT ?auto_32189 ?auto_32197 ) ( CLEAR ?auto_32189 ) ( IS-CRATE ?auto_32190 ) ( not ( = ?auto_32189 ?auto_32190 ) ) ( not ( = ?auto_32192 ?auto_32189 ) ) ( not ( = ?auto_32193 ?auto_32189 ) ) ( not ( = ?auto_32191 ?auto_32189 ) ) ( not ( = ?auto_32205 ?auto_32189 ) ) ( not ( = ?auto_32201 ?auto_32189 ) ) ( not ( = ?auto_32198 ?auto_32189 ) ) ( AVAILABLE ?auto_32202 ) ( AVAILABLE ?auto_32200 ) ( SURFACE-AT ?auto_32190 ?auto_32195 ) ( ON ?auto_32190 ?auto_32199 ) ( CLEAR ?auto_32190 ) ( not ( = ?auto_32192 ?auto_32199 ) ) ( not ( = ?auto_32193 ?auto_32199 ) ) ( not ( = ?auto_32191 ?auto_32199 ) ) ( not ( = ?auto_32205 ?auto_32199 ) ) ( not ( = ?auto_32201 ?auto_32199 ) ) ( not ( = ?auto_32190 ?auto_32199 ) ) ( not ( = ?auto_32198 ?auto_32199 ) ) ( not ( = ?auto_32189 ?auto_32199 ) ) ( TRUCK-AT ?auto_32203 ?auto_32197 ) ( ON ?auto_32189 ?auto_32188 ) ( not ( = ?auto_32188 ?auto_32189 ) ) ( not ( = ?auto_32188 ?auto_32190 ) ) ( not ( = ?auto_32188 ?auto_32191 ) ) ( not ( = ?auto_32188 ?auto_32192 ) ) ( not ( = ?auto_32188 ?auto_32193 ) ) ( not ( = ?auto_32188 ?auto_32205 ) ) ( not ( = ?auto_32188 ?auto_32201 ) ) ( not ( = ?auto_32188 ?auto_32198 ) ) ( not ( = ?auto_32188 ?auto_32199 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32191 ?auto_32192 ?auto_32193 )
      ( MAKE-5CRATE-VERIFY ?auto_32188 ?auto_32189 ?auto_32190 ?auto_32191 ?auto_32192 ?auto_32193 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32207 - SURFACE
      ?auto_32208 - SURFACE
    )
    :vars
    (
      ?auto_32218 - HOIST
      ?auto_32213 - PLACE
      ?auto_32223 - SURFACE
      ?auto_32220 - PLACE
      ?auto_32209 - HOIST
      ?auto_32221 - SURFACE
      ?auto_32212 - PLACE
      ?auto_32224 - HOIST
      ?auto_32217 - SURFACE
      ?auto_32222 - SURFACE
      ?auto_32211 - PLACE
      ?auto_32216 - HOIST
      ?auto_32214 - SURFACE
      ?auto_32210 - SURFACE
      ?auto_32215 - SURFACE
      ?auto_32219 - TRUCK
      ?auto_32225 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32218 ?auto_32213 ) ( IS-CRATE ?auto_32208 ) ( not ( = ?auto_32207 ?auto_32208 ) ) ( not ( = ?auto_32223 ?auto_32207 ) ) ( not ( = ?auto_32223 ?auto_32208 ) ) ( not ( = ?auto_32220 ?auto_32213 ) ) ( HOIST-AT ?auto_32209 ?auto_32220 ) ( not ( = ?auto_32218 ?auto_32209 ) ) ( AVAILABLE ?auto_32209 ) ( SURFACE-AT ?auto_32208 ?auto_32220 ) ( ON ?auto_32208 ?auto_32221 ) ( CLEAR ?auto_32208 ) ( not ( = ?auto_32207 ?auto_32221 ) ) ( not ( = ?auto_32208 ?auto_32221 ) ) ( not ( = ?auto_32223 ?auto_32221 ) ) ( IS-CRATE ?auto_32207 ) ( not ( = ?auto_32212 ?auto_32213 ) ) ( not ( = ?auto_32220 ?auto_32212 ) ) ( HOIST-AT ?auto_32224 ?auto_32212 ) ( not ( = ?auto_32218 ?auto_32224 ) ) ( not ( = ?auto_32209 ?auto_32224 ) ) ( AVAILABLE ?auto_32224 ) ( SURFACE-AT ?auto_32207 ?auto_32212 ) ( ON ?auto_32207 ?auto_32217 ) ( CLEAR ?auto_32207 ) ( not ( = ?auto_32207 ?auto_32217 ) ) ( not ( = ?auto_32208 ?auto_32217 ) ) ( not ( = ?auto_32223 ?auto_32217 ) ) ( not ( = ?auto_32221 ?auto_32217 ) ) ( IS-CRATE ?auto_32223 ) ( not ( = ?auto_32222 ?auto_32223 ) ) ( not ( = ?auto_32207 ?auto_32222 ) ) ( not ( = ?auto_32208 ?auto_32222 ) ) ( not ( = ?auto_32221 ?auto_32222 ) ) ( not ( = ?auto_32217 ?auto_32222 ) ) ( not ( = ?auto_32211 ?auto_32213 ) ) ( not ( = ?auto_32220 ?auto_32211 ) ) ( not ( = ?auto_32212 ?auto_32211 ) ) ( HOIST-AT ?auto_32216 ?auto_32211 ) ( not ( = ?auto_32218 ?auto_32216 ) ) ( not ( = ?auto_32209 ?auto_32216 ) ) ( not ( = ?auto_32224 ?auto_32216 ) ) ( SURFACE-AT ?auto_32223 ?auto_32211 ) ( ON ?auto_32223 ?auto_32214 ) ( CLEAR ?auto_32223 ) ( not ( = ?auto_32207 ?auto_32214 ) ) ( not ( = ?auto_32208 ?auto_32214 ) ) ( not ( = ?auto_32223 ?auto_32214 ) ) ( not ( = ?auto_32221 ?auto_32214 ) ) ( not ( = ?auto_32217 ?auto_32214 ) ) ( not ( = ?auto_32222 ?auto_32214 ) ) ( IS-CRATE ?auto_32222 ) ( not ( = ?auto_32210 ?auto_32222 ) ) ( not ( = ?auto_32207 ?auto_32210 ) ) ( not ( = ?auto_32208 ?auto_32210 ) ) ( not ( = ?auto_32223 ?auto_32210 ) ) ( not ( = ?auto_32221 ?auto_32210 ) ) ( not ( = ?auto_32217 ?auto_32210 ) ) ( not ( = ?auto_32214 ?auto_32210 ) ) ( AVAILABLE ?auto_32216 ) ( SURFACE-AT ?auto_32222 ?auto_32211 ) ( ON ?auto_32222 ?auto_32215 ) ( CLEAR ?auto_32222 ) ( not ( = ?auto_32207 ?auto_32215 ) ) ( not ( = ?auto_32208 ?auto_32215 ) ) ( not ( = ?auto_32223 ?auto_32215 ) ) ( not ( = ?auto_32221 ?auto_32215 ) ) ( not ( = ?auto_32217 ?auto_32215 ) ) ( not ( = ?auto_32222 ?auto_32215 ) ) ( not ( = ?auto_32214 ?auto_32215 ) ) ( not ( = ?auto_32210 ?auto_32215 ) ) ( TRUCK-AT ?auto_32219 ?auto_32213 ) ( SURFACE-AT ?auto_32225 ?auto_32213 ) ( CLEAR ?auto_32225 ) ( LIFTING ?auto_32218 ?auto_32210 ) ( IS-CRATE ?auto_32210 ) ( not ( = ?auto_32225 ?auto_32210 ) ) ( not ( = ?auto_32207 ?auto_32225 ) ) ( not ( = ?auto_32208 ?auto_32225 ) ) ( not ( = ?auto_32223 ?auto_32225 ) ) ( not ( = ?auto_32221 ?auto_32225 ) ) ( not ( = ?auto_32217 ?auto_32225 ) ) ( not ( = ?auto_32222 ?auto_32225 ) ) ( not ( = ?auto_32214 ?auto_32225 ) ) ( not ( = ?auto_32215 ?auto_32225 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32225 ?auto_32210 )
      ( MAKE-2CRATE ?auto_32223 ?auto_32207 ?auto_32208 )
      ( MAKE-1CRATE-VERIFY ?auto_32207 ?auto_32208 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32226 - SURFACE
      ?auto_32227 - SURFACE
      ?auto_32228 - SURFACE
    )
    :vars
    (
      ?auto_32236 - HOIST
      ?auto_32230 - PLACE
      ?auto_32239 - PLACE
      ?auto_32242 - HOIST
      ?auto_32232 - SURFACE
      ?auto_32235 - PLACE
      ?auto_32238 - HOIST
      ?auto_32233 - SURFACE
      ?auto_32244 - SURFACE
      ?auto_32229 - PLACE
      ?auto_32240 - HOIST
      ?auto_32231 - SURFACE
      ?auto_32241 - SURFACE
      ?auto_32243 - SURFACE
      ?auto_32234 - TRUCK
      ?auto_32237 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32236 ?auto_32230 ) ( IS-CRATE ?auto_32228 ) ( not ( = ?auto_32227 ?auto_32228 ) ) ( not ( = ?auto_32226 ?auto_32227 ) ) ( not ( = ?auto_32226 ?auto_32228 ) ) ( not ( = ?auto_32239 ?auto_32230 ) ) ( HOIST-AT ?auto_32242 ?auto_32239 ) ( not ( = ?auto_32236 ?auto_32242 ) ) ( AVAILABLE ?auto_32242 ) ( SURFACE-AT ?auto_32228 ?auto_32239 ) ( ON ?auto_32228 ?auto_32232 ) ( CLEAR ?auto_32228 ) ( not ( = ?auto_32227 ?auto_32232 ) ) ( not ( = ?auto_32228 ?auto_32232 ) ) ( not ( = ?auto_32226 ?auto_32232 ) ) ( IS-CRATE ?auto_32227 ) ( not ( = ?auto_32235 ?auto_32230 ) ) ( not ( = ?auto_32239 ?auto_32235 ) ) ( HOIST-AT ?auto_32238 ?auto_32235 ) ( not ( = ?auto_32236 ?auto_32238 ) ) ( not ( = ?auto_32242 ?auto_32238 ) ) ( AVAILABLE ?auto_32238 ) ( SURFACE-AT ?auto_32227 ?auto_32235 ) ( ON ?auto_32227 ?auto_32233 ) ( CLEAR ?auto_32227 ) ( not ( = ?auto_32227 ?auto_32233 ) ) ( not ( = ?auto_32228 ?auto_32233 ) ) ( not ( = ?auto_32226 ?auto_32233 ) ) ( not ( = ?auto_32232 ?auto_32233 ) ) ( IS-CRATE ?auto_32226 ) ( not ( = ?auto_32244 ?auto_32226 ) ) ( not ( = ?auto_32227 ?auto_32244 ) ) ( not ( = ?auto_32228 ?auto_32244 ) ) ( not ( = ?auto_32232 ?auto_32244 ) ) ( not ( = ?auto_32233 ?auto_32244 ) ) ( not ( = ?auto_32229 ?auto_32230 ) ) ( not ( = ?auto_32239 ?auto_32229 ) ) ( not ( = ?auto_32235 ?auto_32229 ) ) ( HOIST-AT ?auto_32240 ?auto_32229 ) ( not ( = ?auto_32236 ?auto_32240 ) ) ( not ( = ?auto_32242 ?auto_32240 ) ) ( not ( = ?auto_32238 ?auto_32240 ) ) ( SURFACE-AT ?auto_32226 ?auto_32229 ) ( ON ?auto_32226 ?auto_32231 ) ( CLEAR ?auto_32226 ) ( not ( = ?auto_32227 ?auto_32231 ) ) ( not ( = ?auto_32228 ?auto_32231 ) ) ( not ( = ?auto_32226 ?auto_32231 ) ) ( not ( = ?auto_32232 ?auto_32231 ) ) ( not ( = ?auto_32233 ?auto_32231 ) ) ( not ( = ?auto_32244 ?auto_32231 ) ) ( IS-CRATE ?auto_32244 ) ( not ( = ?auto_32241 ?auto_32244 ) ) ( not ( = ?auto_32227 ?auto_32241 ) ) ( not ( = ?auto_32228 ?auto_32241 ) ) ( not ( = ?auto_32226 ?auto_32241 ) ) ( not ( = ?auto_32232 ?auto_32241 ) ) ( not ( = ?auto_32233 ?auto_32241 ) ) ( not ( = ?auto_32231 ?auto_32241 ) ) ( AVAILABLE ?auto_32240 ) ( SURFACE-AT ?auto_32244 ?auto_32229 ) ( ON ?auto_32244 ?auto_32243 ) ( CLEAR ?auto_32244 ) ( not ( = ?auto_32227 ?auto_32243 ) ) ( not ( = ?auto_32228 ?auto_32243 ) ) ( not ( = ?auto_32226 ?auto_32243 ) ) ( not ( = ?auto_32232 ?auto_32243 ) ) ( not ( = ?auto_32233 ?auto_32243 ) ) ( not ( = ?auto_32244 ?auto_32243 ) ) ( not ( = ?auto_32231 ?auto_32243 ) ) ( not ( = ?auto_32241 ?auto_32243 ) ) ( TRUCK-AT ?auto_32234 ?auto_32230 ) ( SURFACE-AT ?auto_32237 ?auto_32230 ) ( CLEAR ?auto_32237 ) ( LIFTING ?auto_32236 ?auto_32241 ) ( IS-CRATE ?auto_32241 ) ( not ( = ?auto_32237 ?auto_32241 ) ) ( not ( = ?auto_32227 ?auto_32237 ) ) ( not ( = ?auto_32228 ?auto_32237 ) ) ( not ( = ?auto_32226 ?auto_32237 ) ) ( not ( = ?auto_32232 ?auto_32237 ) ) ( not ( = ?auto_32233 ?auto_32237 ) ) ( not ( = ?auto_32244 ?auto_32237 ) ) ( not ( = ?auto_32231 ?auto_32237 ) ) ( not ( = ?auto_32243 ?auto_32237 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32227 ?auto_32228 )
      ( MAKE-2CRATE-VERIFY ?auto_32226 ?auto_32227 ?auto_32228 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32245 - SURFACE
      ?auto_32246 - SURFACE
      ?auto_32247 - SURFACE
      ?auto_32248 - SURFACE
    )
    :vars
    (
      ?auto_32263 - HOIST
      ?auto_32258 - PLACE
      ?auto_32256 - PLACE
      ?auto_32253 - HOIST
      ?auto_32250 - SURFACE
      ?auto_32252 - PLACE
      ?auto_32262 - HOIST
      ?auto_32254 - SURFACE
      ?auto_32251 - PLACE
      ?auto_32255 - HOIST
      ?auto_32259 - SURFACE
      ?auto_32257 - SURFACE
      ?auto_32261 - SURFACE
      ?auto_32260 - TRUCK
      ?auto_32249 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32263 ?auto_32258 ) ( IS-CRATE ?auto_32248 ) ( not ( = ?auto_32247 ?auto_32248 ) ) ( not ( = ?auto_32246 ?auto_32247 ) ) ( not ( = ?auto_32246 ?auto_32248 ) ) ( not ( = ?auto_32256 ?auto_32258 ) ) ( HOIST-AT ?auto_32253 ?auto_32256 ) ( not ( = ?auto_32263 ?auto_32253 ) ) ( AVAILABLE ?auto_32253 ) ( SURFACE-AT ?auto_32248 ?auto_32256 ) ( ON ?auto_32248 ?auto_32250 ) ( CLEAR ?auto_32248 ) ( not ( = ?auto_32247 ?auto_32250 ) ) ( not ( = ?auto_32248 ?auto_32250 ) ) ( not ( = ?auto_32246 ?auto_32250 ) ) ( IS-CRATE ?auto_32247 ) ( not ( = ?auto_32252 ?auto_32258 ) ) ( not ( = ?auto_32256 ?auto_32252 ) ) ( HOIST-AT ?auto_32262 ?auto_32252 ) ( not ( = ?auto_32263 ?auto_32262 ) ) ( not ( = ?auto_32253 ?auto_32262 ) ) ( AVAILABLE ?auto_32262 ) ( SURFACE-AT ?auto_32247 ?auto_32252 ) ( ON ?auto_32247 ?auto_32254 ) ( CLEAR ?auto_32247 ) ( not ( = ?auto_32247 ?auto_32254 ) ) ( not ( = ?auto_32248 ?auto_32254 ) ) ( not ( = ?auto_32246 ?auto_32254 ) ) ( not ( = ?auto_32250 ?auto_32254 ) ) ( IS-CRATE ?auto_32246 ) ( not ( = ?auto_32245 ?auto_32246 ) ) ( not ( = ?auto_32247 ?auto_32245 ) ) ( not ( = ?auto_32248 ?auto_32245 ) ) ( not ( = ?auto_32250 ?auto_32245 ) ) ( not ( = ?auto_32254 ?auto_32245 ) ) ( not ( = ?auto_32251 ?auto_32258 ) ) ( not ( = ?auto_32256 ?auto_32251 ) ) ( not ( = ?auto_32252 ?auto_32251 ) ) ( HOIST-AT ?auto_32255 ?auto_32251 ) ( not ( = ?auto_32263 ?auto_32255 ) ) ( not ( = ?auto_32253 ?auto_32255 ) ) ( not ( = ?auto_32262 ?auto_32255 ) ) ( SURFACE-AT ?auto_32246 ?auto_32251 ) ( ON ?auto_32246 ?auto_32259 ) ( CLEAR ?auto_32246 ) ( not ( = ?auto_32247 ?auto_32259 ) ) ( not ( = ?auto_32248 ?auto_32259 ) ) ( not ( = ?auto_32246 ?auto_32259 ) ) ( not ( = ?auto_32250 ?auto_32259 ) ) ( not ( = ?auto_32254 ?auto_32259 ) ) ( not ( = ?auto_32245 ?auto_32259 ) ) ( IS-CRATE ?auto_32245 ) ( not ( = ?auto_32257 ?auto_32245 ) ) ( not ( = ?auto_32247 ?auto_32257 ) ) ( not ( = ?auto_32248 ?auto_32257 ) ) ( not ( = ?auto_32246 ?auto_32257 ) ) ( not ( = ?auto_32250 ?auto_32257 ) ) ( not ( = ?auto_32254 ?auto_32257 ) ) ( not ( = ?auto_32259 ?auto_32257 ) ) ( AVAILABLE ?auto_32255 ) ( SURFACE-AT ?auto_32245 ?auto_32251 ) ( ON ?auto_32245 ?auto_32261 ) ( CLEAR ?auto_32245 ) ( not ( = ?auto_32247 ?auto_32261 ) ) ( not ( = ?auto_32248 ?auto_32261 ) ) ( not ( = ?auto_32246 ?auto_32261 ) ) ( not ( = ?auto_32250 ?auto_32261 ) ) ( not ( = ?auto_32254 ?auto_32261 ) ) ( not ( = ?auto_32245 ?auto_32261 ) ) ( not ( = ?auto_32259 ?auto_32261 ) ) ( not ( = ?auto_32257 ?auto_32261 ) ) ( TRUCK-AT ?auto_32260 ?auto_32258 ) ( SURFACE-AT ?auto_32249 ?auto_32258 ) ( CLEAR ?auto_32249 ) ( LIFTING ?auto_32263 ?auto_32257 ) ( IS-CRATE ?auto_32257 ) ( not ( = ?auto_32249 ?auto_32257 ) ) ( not ( = ?auto_32247 ?auto_32249 ) ) ( not ( = ?auto_32248 ?auto_32249 ) ) ( not ( = ?auto_32246 ?auto_32249 ) ) ( not ( = ?auto_32250 ?auto_32249 ) ) ( not ( = ?auto_32254 ?auto_32249 ) ) ( not ( = ?auto_32245 ?auto_32249 ) ) ( not ( = ?auto_32259 ?auto_32249 ) ) ( not ( = ?auto_32261 ?auto_32249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32246 ?auto_32247 ?auto_32248 )
      ( MAKE-3CRATE-VERIFY ?auto_32245 ?auto_32246 ?auto_32247 ?auto_32248 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32264 - SURFACE
      ?auto_32265 - SURFACE
      ?auto_32266 - SURFACE
      ?auto_32267 - SURFACE
      ?auto_32268 - SURFACE
    )
    :vars
    (
      ?auto_32282 - HOIST
      ?auto_32277 - PLACE
      ?auto_32276 - PLACE
      ?auto_32273 - HOIST
      ?auto_32270 - SURFACE
      ?auto_32272 - PLACE
      ?auto_32281 - HOIST
      ?auto_32274 - SURFACE
      ?auto_32271 - PLACE
      ?auto_32275 - HOIST
      ?auto_32278 - SURFACE
      ?auto_32280 - SURFACE
      ?auto_32279 - TRUCK
      ?auto_32269 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32282 ?auto_32277 ) ( IS-CRATE ?auto_32268 ) ( not ( = ?auto_32267 ?auto_32268 ) ) ( not ( = ?auto_32266 ?auto_32267 ) ) ( not ( = ?auto_32266 ?auto_32268 ) ) ( not ( = ?auto_32276 ?auto_32277 ) ) ( HOIST-AT ?auto_32273 ?auto_32276 ) ( not ( = ?auto_32282 ?auto_32273 ) ) ( AVAILABLE ?auto_32273 ) ( SURFACE-AT ?auto_32268 ?auto_32276 ) ( ON ?auto_32268 ?auto_32270 ) ( CLEAR ?auto_32268 ) ( not ( = ?auto_32267 ?auto_32270 ) ) ( not ( = ?auto_32268 ?auto_32270 ) ) ( not ( = ?auto_32266 ?auto_32270 ) ) ( IS-CRATE ?auto_32267 ) ( not ( = ?auto_32272 ?auto_32277 ) ) ( not ( = ?auto_32276 ?auto_32272 ) ) ( HOIST-AT ?auto_32281 ?auto_32272 ) ( not ( = ?auto_32282 ?auto_32281 ) ) ( not ( = ?auto_32273 ?auto_32281 ) ) ( AVAILABLE ?auto_32281 ) ( SURFACE-AT ?auto_32267 ?auto_32272 ) ( ON ?auto_32267 ?auto_32274 ) ( CLEAR ?auto_32267 ) ( not ( = ?auto_32267 ?auto_32274 ) ) ( not ( = ?auto_32268 ?auto_32274 ) ) ( not ( = ?auto_32266 ?auto_32274 ) ) ( not ( = ?auto_32270 ?auto_32274 ) ) ( IS-CRATE ?auto_32266 ) ( not ( = ?auto_32265 ?auto_32266 ) ) ( not ( = ?auto_32267 ?auto_32265 ) ) ( not ( = ?auto_32268 ?auto_32265 ) ) ( not ( = ?auto_32270 ?auto_32265 ) ) ( not ( = ?auto_32274 ?auto_32265 ) ) ( not ( = ?auto_32271 ?auto_32277 ) ) ( not ( = ?auto_32276 ?auto_32271 ) ) ( not ( = ?auto_32272 ?auto_32271 ) ) ( HOIST-AT ?auto_32275 ?auto_32271 ) ( not ( = ?auto_32282 ?auto_32275 ) ) ( not ( = ?auto_32273 ?auto_32275 ) ) ( not ( = ?auto_32281 ?auto_32275 ) ) ( SURFACE-AT ?auto_32266 ?auto_32271 ) ( ON ?auto_32266 ?auto_32278 ) ( CLEAR ?auto_32266 ) ( not ( = ?auto_32267 ?auto_32278 ) ) ( not ( = ?auto_32268 ?auto_32278 ) ) ( not ( = ?auto_32266 ?auto_32278 ) ) ( not ( = ?auto_32270 ?auto_32278 ) ) ( not ( = ?auto_32274 ?auto_32278 ) ) ( not ( = ?auto_32265 ?auto_32278 ) ) ( IS-CRATE ?auto_32265 ) ( not ( = ?auto_32264 ?auto_32265 ) ) ( not ( = ?auto_32267 ?auto_32264 ) ) ( not ( = ?auto_32268 ?auto_32264 ) ) ( not ( = ?auto_32266 ?auto_32264 ) ) ( not ( = ?auto_32270 ?auto_32264 ) ) ( not ( = ?auto_32274 ?auto_32264 ) ) ( not ( = ?auto_32278 ?auto_32264 ) ) ( AVAILABLE ?auto_32275 ) ( SURFACE-AT ?auto_32265 ?auto_32271 ) ( ON ?auto_32265 ?auto_32280 ) ( CLEAR ?auto_32265 ) ( not ( = ?auto_32267 ?auto_32280 ) ) ( not ( = ?auto_32268 ?auto_32280 ) ) ( not ( = ?auto_32266 ?auto_32280 ) ) ( not ( = ?auto_32270 ?auto_32280 ) ) ( not ( = ?auto_32274 ?auto_32280 ) ) ( not ( = ?auto_32265 ?auto_32280 ) ) ( not ( = ?auto_32278 ?auto_32280 ) ) ( not ( = ?auto_32264 ?auto_32280 ) ) ( TRUCK-AT ?auto_32279 ?auto_32277 ) ( SURFACE-AT ?auto_32269 ?auto_32277 ) ( CLEAR ?auto_32269 ) ( LIFTING ?auto_32282 ?auto_32264 ) ( IS-CRATE ?auto_32264 ) ( not ( = ?auto_32269 ?auto_32264 ) ) ( not ( = ?auto_32267 ?auto_32269 ) ) ( not ( = ?auto_32268 ?auto_32269 ) ) ( not ( = ?auto_32266 ?auto_32269 ) ) ( not ( = ?auto_32270 ?auto_32269 ) ) ( not ( = ?auto_32274 ?auto_32269 ) ) ( not ( = ?auto_32265 ?auto_32269 ) ) ( not ( = ?auto_32278 ?auto_32269 ) ) ( not ( = ?auto_32280 ?auto_32269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32266 ?auto_32267 ?auto_32268 )
      ( MAKE-4CRATE-VERIFY ?auto_32264 ?auto_32265 ?auto_32266 ?auto_32267 ?auto_32268 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_32283 - SURFACE
      ?auto_32284 - SURFACE
      ?auto_32285 - SURFACE
      ?auto_32286 - SURFACE
      ?auto_32287 - SURFACE
      ?auto_32288 - SURFACE
    )
    :vars
    (
      ?auto_32301 - HOIST
      ?auto_32296 - PLACE
      ?auto_32295 - PLACE
      ?auto_32292 - HOIST
      ?auto_32289 - SURFACE
      ?auto_32291 - PLACE
      ?auto_32300 - HOIST
      ?auto_32293 - SURFACE
      ?auto_32290 - PLACE
      ?auto_32294 - HOIST
      ?auto_32297 - SURFACE
      ?auto_32299 - SURFACE
      ?auto_32298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32301 ?auto_32296 ) ( IS-CRATE ?auto_32288 ) ( not ( = ?auto_32287 ?auto_32288 ) ) ( not ( = ?auto_32286 ?auto_32287 ) ) ( not ( = ?auto_32286 ?auto_32288 ) ) ( not ( = ?auto_32295 ?auto_32296 ) ) ( HOIST-AT ?auto_32292 ?auto_32295 ) ( not ( = ?auto_32301 ?auto_32292 ) ) ( AVAILABLE ?auto_32292 ) ( SURFACE-AT ?auto_32288 ?auto_32295 ) ( ON ?auto_32288 ?auto_32289 ) ( CLEAR ?auto_32288 ) ( not ( = ?auto_32287 ?auto_32289 ) ) ( not ( = ?auto_32288 ?auto_32289 ) ) ( not ( = ?auto_32286 ?auto_32289 ) ) ( IS-CRATE ?auto_32287 ) ( not ( = ?auto_32291 ?auto_32296 ) ) ( not ( = ?auto_32295 ?auto_32291 ) ) ( HOIST-AT ?auto_32300 ?auto_32291 ) ( not ( = ?auto_32301 ?auto_32300 ) ) ( not ( = ?auto_32292 ?auto_32300 ) ) ( AVAILABLE ?auto_32300 ) ( SURFACE-AT ?auto_32287 ?auto_32291 ) ( ON ?auto_32287 ?auto_32293 ) ( CLEAR ?auto_32287 ) ( not ( = ?auto_32287 ?auto_32293 ) ) ( not ( = ?auto_32288 ?auto_32293 ) ) ( not ( = ?auto_32286 ?auto_32293 ) ) ( not ( = ?auto_32289 ?auto_32293 ) ) ( IS-CRATE ?auto_32286 ) ( not ( = ?auto_32285 ?auto_32286 ) ) ( not ( = ?auto_32287 ?auto_32285 ) ) ( not ( = ?auto_32288 ?auto_32285 ) ) ( not ( = ?auto_32289 ?auto_32285 ) ) ( not ( = ?auto_32293 ?auto_32285 ) ) ( not ( = ?auto_32290 ?auto_32296 ) ) ( not ( = ?auto_32295 ?auto_32290 ) ) ( not ( = ?auto_32291 ?auto_32290 ) ) ( HOIST-AT ?auto_32294 ?auto_32290 ) ( not ( = ?auto_32301 ?auto_32294 ) ) ( not ( = ?auto_32292 ?auto_32294 ) ) ( not ( = ?auto_32300 ?auto_32294 ) ) ( SURFACE-AT ?auto_32286 ?auto_32290 ) ( ON ?auto_32286 ?auto_32297 ) ( CLEAR ?auto_32286 ) ( not ( = ?auto_32287 ?auto_32297 ) ) ( not ( = ?auto_32288 ?auto_32297 ) ) ( not ( = ?auto_32286 ?auto_32297 ) ) ( not ( = ?auto_32289 ?auto_32297 ) ) ( not ( = ?auto_32293 ?auto_32297 ) ) ( not ( = ?auto_32285 ?auto_32297 ) ) ( IS-CRATE ?auto_32285 ) ( not ( = ?auto_32284 ?auto_32285 ) ) ( not ( = ?auto_32287 ?auto_32284 ) ) ( not ( = ?auto_32288 ?auto_32284 ) ) ( not ( = ?auto_32286 ?auto_32284 ) ) ( not ( = ?auto_32289 ?auto_32284 ) ) ( not ( = ?auto_32293 ?auto_32284 ) ) ( not ( = ?auto_32297 ?auto_32284 ) ) ( AVAILABLE ?auto_32294 ) ( SURFACE-AT ?auto_32285 ?auto_32290 ) ( ON ?auto_32285 ?auto_32299 ) ( CLEAR ?auto_32285 ) ( not ( = ?auto_32287 ?auto_32299 ) ) ( not ( = ?auto_32288 ?auto_32299 ) ) ( not ( = ?auto_32286 ?auto_32299 ) ) ( not ( = ?auto_32289 ?auto_32299 ) ) ( not ( = ?auto_32293 ?auto_32299 ) ) ( not ( = ?auto_32285 ?auto_32299 ) ) ( not ( = ?auto_32297 ?auto_32299 ) ) ( not ( = ?auto_32284 ?auto_32299 ) ) ( TRUCK-AT ?auto_32298 ?auto_32296 ) ( SURFACE-AT ?auto_32283 ?auto_32296 ) ( CLEAR ?auto_32283 ) ( LIFTING ?auto_32301 ?auto_32284 ) ( IS-CRATE ?auto_32284 ) ( not ( = ?auto_32283 ?auto_32284 ) ) ( not ( = ?auto_32287 ?auto_32283 ) ) ( not ( = ?auto_32288 ?auto_32283 ) ) ( not ( = ?auto_32286 ?auto_32283 ) ) ( not ( = ?auto_32289 ?auto_32283 ) ) ( not ( = ?auto_32293 ?auto_32283 ) ) ( not ( = ?auto_32285 ?auto_32283 ) ) ( not ( = ?auto_32297 ?auto_32283 ) ) ( not ( = ?auto_32299 ?auto_32283 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32286 ?auto_32287 ?auto_32288 )
      ( MAKE-5CRATE-VERIFY ?auto_32283 ?auto_32284 ?auto_32285 ?auto_32286 ?auto_32287 ?auto_32288 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32302 - SURFACE
      ?auto_32303 - SURFACE
    )
    :vars
    (
      ?auto_32320 - HOIST
      ?auto_32315 - PLACE
      ?auto_32311 - SURFACE
      ?auto_32313 - PLACE
      ?auto_32309 - HOIST
      ?auto_32306 - SURFACE
      ?auto_32308 - PLACE
      ?auto_32319 - HOIST
      ?auto_32310 - SURFACE
      ?auto_32304 - SURFACE
      ?auto_32307 - PLACE
      ?auto_32312 - HOIST
      ?auto_32316 - SURFACE
      ?auto_32314 - SURFACE
      ?auto_32318 - SURFACE
      ?auto_32317 - TRUCK
      ?auto_32305 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32320 ?auto_32315 ) ( IS-CRATE ?auto_32303 ) ( not ( = ?auto_32302 ?auto_32303 ) ) ( not ( = ?auto_32311 ?auto_32302 ) ) ( not ( = ?auto_32311 ?auto_32303 ) ) ( not ( = ?auto_32313 ?auto_32315 ) ) ( HOIST-AT ?auto_32309 ?auto_32313 ) ( not ( = ?auto_32320 ?auto_32309 ) ) ( AVAILABLE ?auto_32309 ) ( SURFACE-AT ?auto_32303 ?auto_32313 ) ( ON ?auto_32303 ?auto_32306 ) ( CLEAR ?auto_32303 ) ( not ( = ?auto_32302 ?auto_32306 ) ) ( not ( = ?auto_32303 ?auto_32306 ) ) ( not ( = ?auto_32311 ?auto_32306 ) ) ( IS-CRATE ?auto_32302 ) ( not ( = ?auto_32308 ?auto_32315 ) ) ( not ( = ?auto_32313 ?auto_32308 ) ) ( HOIST-AT ?auto_32319 ?auto_32308 ) ( not ( = ?auto_32320 ?auto_32319 ) ) ( not ( = ?auto_32309 ?auto_32319 ) ) ( AVAILABLE ?auto_32319 ) ( SURFACE-AT ?auto_32302 ?auto_32308 ) ( ON ?auto_32302 ?auto_32310 ) ( CLEAR ?auto_32302 ) ( not ( = ?auto_32302 ?auto_32310 ) ) ( not ( = ?auto_32303 ?auto_32310 ) ) ( not ( = ?auto_32311 ?auto_32310 ) ) ( not ( = ?auto_32306 ?auto_32310 ) ) ( IS-CRATE ?auto_32311 ) ( not ( = ?auto_32304 ?auto_32311 ) ) ( not ( = ?auto_32302 ?auto_32304 ) ) ( not ( = ?auto_32303 ?auto_32304 ) ) ( not ( = ?auto_32306 ?auto_32304 ) ) ( not ( = ?auto_32310 ?auto_32304 ) ) ( not ( = ?auto_32307 ?auto_32315 ) ) ( not ( = ?auto_32313 ?auto_32307 ) ) ( not ( = ?auto_32308 ?auto_32307 ) ) ( HOIST-AT ?auto_32312 ?auto_32307 ) ( not ( = ?auto_32320 ?auto_32312 ) ) ( not ( = ?auto_32309 ?auto_32312 ) ) ( not ( = ?auto_32319 ?auto_32312 ) ) ( SURFACE-AT ?auto_32311 ?auto_32307 ) ( ON ?auto_32311 ?auto_32316 ) ( CLEAR ?auto_32311 ) ( not ( = ?auto_32302 ?auto_32316 ) ) ( not ( = ?auto_32303 ?auto_32316 ) ) ( not ( = ?auto_32311 ?auto_32316 ) ) ( not ( = ?auto_32306 ?auto_32316 ) ) ( not ( = ?auto_32310 ?auto_32316 ) ) ( not ( = ?auto_32304 ?auto_32316 ) ) ( IS-CRATE ?auto_32304 ) ( not ( = ?auto_32314 ?auto_32304 ) ) ( not ( = ?auto_32302 ?auto_32314 ) ) ( not ( = ?auto_32303 ?auto_32314 ) ) ( not ( = ?auto_32311 ?auto_32314 ) ) ( not ( = ?auto_32306 ?auto_32314 ) ) ( not ( = ?auto_32310 ?auto_32314 ) ) ( not ( = ?auto_32316 ?auto_32314 ) ) ( AVAILABLE ?auto_32312 ) ( SURFACE-AT ?auto_32304 ?auto_32307 ) ( ON ?auto_32304 ?auto_32318 ) ( CLEAR ?auto_32304 ) ( not ( = ?auto_32302 ?auto_32318 ) ) ( not ( = ?auto_32303 ?auto_32318 ) ) ( not ( = ?auto_32311 ?auto_32318 ) ) ( not ( = ?auto_32306 ?auto_32318 ) ) ( not ( = ?auto_32310 ?auto_32318 ) ) ( not ( = ?auto_32304 ?auto_32318 ) ) ( not ( = ?auto_32316 ?auto_32318 ) ) ( not ( = ?auto_32314 ?auto_32318 ) ) ( TRUCK-AT ?auto_32317 ?auto_32315 ) ( SURFACE-AT ?auto_32305 ?auto_32315 ) ( CLEAR ?auto_32305 ) ( IS-CRATE ?auto_32314 ) ( not ( = ?auto_32305 ?auto_32314 ) ) ( not ( = ?auto_32302 ?auto_32305 ) ) ( not ( = ?auto_32303 ?auto_32305 ) ) ( not ( = ?auto_32311 ?auto_32305 ) ) ( not ( = ?auto_32306 ?auto_32305 ) ) ( not ( = ?auto_32310 ?auto_32305 ) ) ( not ( = ?auto_32304 ?auto_32305 ) ) ( not ( = ?auto_32316 ?auto_32305 ) ) ( not ( = ?auto_32318 ?auto_32305 ) ) ( AVAILABLE ?auto_32320 ) ( IN ?auto_32314 ?auto_32317 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32320 ?auto_32314 ?auto_32317 ?auto_32315 )
      ( MAKE-2CRATE ?auto_32311 ?auto_32302 ?auto_32303 )
      ( MAKE-1CRATE-VERIFY ?auto_32302 ?auto_32303 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32321 - SURFACE
      ?auto_32322 - SURFACE
      ?auto_32323 - SURFACE
    )
    :vars
    (
      ?auto_32327 - HOIST
      ?auto_32337 - PLACE
      ?auto_32324 - PLACE
      ?auto_32332 - HOIST
      ?auto_32336 - SURFACE
      ?auto_32328 - PLACE
      ?auto_32330 - HOIST
      ?auto_32326 - SURFACE
      ?auto_32331 - SURFACE
      ?auto_32333 - PLACE
      ?auto_32335 - HOIST
      ?auto_32325 - SURFACE
      ?auto_32334 - SURFACE
      ?auto_32338 - SURFACE
      ?auto_32329 - TRUCK
      ?auto_32339 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32327 ?auto_32337 ) ( IS-CRATE ?auto_32323 ) ( not ( = ?auto_32322 ?auto_32323 ) ) ( not ( = ?auto_32321 ?auto_32322 ) ) ( not ( = ?auto_32321 ?auto_32323 ) ) ( not ( = ?auto_32324 ?auto_32337 ) ) ( HOIST-AT ?auto_32332 ?auto_32324 ) ( not ( = ?auto_32327 ?auto_32332 ) ) ( AVAILABLE ?auto_32332 ) ( SURFACE-AT ?auto_32323 ?auto_32324 ) ( ON ?auto_32323 ?auto_32336 ) ( CLEAR ?auto_32323 ) ( not ( = ?auto_32322 ?auto_32336 ) ) ( not ( = ?auto_32323 ?auto_32336 ) ) ( not ( = ?auto_32321 ?auto_32336 ) ) ( IS-CRATE ?auto_32322 ) ( not ( = ?auto_32328 ?auto_32337 ) ) ( not ( = ?auto_32324 ?auto_32328 ) ) ( HOIST-AT ?auto_32330 ?auto_32328 ) ( not ( = ?auto_32327 ?auto_32330 ) ) ( not ( = ?auto_32332 ?auto_32330 ) ) ( AVAILABLE ?auto_32330 ) ( SURFACE-AT ?auto_32322 ?auto_32328 ) ( ON ?auto_32322 ?auto_32326 ) ( CLEAR ?auto_32322 ) ( not ( = ?auto_32322 ?auto_32326 ) ) ( not ( = ?auto_32323 ?auto_32326 ) ) ( not ( = ?auto_32321 ?auto_32326 ) ) ( not ( = ?auto_32336 ?auto_32326 ) ) ( IS-CRATE ?auto_32321 ) ( not ( = ?auto_32331 ?auto_32321 ) ) ( not ( = ?auto_32322 ?auto_32331 ) ) ( not ( = ?auto_32323 ?auto_32331 ) ) ( not ( = ?auto_32336 ?auto_32331 ) ) ( not ( = ?auto_32326 ?auto_32331 ) ) ( not ( = ?auto_32333 ?auto_32337 ) ) ( not ( = ?auto_32324 ?auto_32333 ) ) ( not ( = ?auto_32328 ?auto_32333 ) ) ( HOIST-AT ?auto_32335 ?auto_32333 ) ( not ( = ?auto_32327 ?auto_32335 ) ) ( not ( = ?auto_32332 ?auto_32335 ) ) ( not ( = ?auto_32330 ?auto_32335 ) ) ( SURFACE-AT ?auto_32321 ?auto_32333 ) ( ON ?auto_32321 ?auto_32325 ) ( CLEAR ?auto_32321 ) ( not ( = ?auto_32322 ?auto_32325 ) ) ( not ( = ?auto_32323 ?auto_32325 ) ) ( not ( = ?auto_32321 ?auto_32325 ) ) ( not ( = ?auto_32336 ?auto_32325 ) ) ( not ( = ?auto_32326 ?auto_32325 ) ) ( not ( = ?auto_32331 ?auto_32325 ) ) ( IS-CRATE ?auto_32331 ) ( not ( = ?auto_32334 ?auto_32331 ) ) ( not ( = ?auto_32322 ?auto_32334 ) ) ( not ( = ?auto_32323 ?auto_32334 ) ) ( not ( = ?auto_32321 ?auto_32334 ) ) ( not ( = ?auto_32336 ?auto_32334 ) ) ( not ( = ?auto_32326 ?auto_32334 ) ) ( not ( = ?auto_32325 ?auto_32334 ) ) ( AVAILABLE ?auto_32335 ) ( SURFACE-AT ?auto_32331 ?auto_32333 ) ( ON ?auto_32331 ?auto_32338 ) ( CLEAR ?auto_32331 ) ( not ( = ?auto_32322 ?auto_32338 ) ) ( not ( = ?auto_32323 ?auto_32338 ) ) ( not ( = ?auto_32321 ?auto_32338 ) ) ( not ( = ?auto_32336 ?auto_32338 ) ) ( not ( = ?auto_32326 ?auto_32338 ) ) ( not ( = ?auto_32331 ?auto_32338 ) ) ( not ( = ?auto_32325 ?auto_32338 ) ) ( not ( = ?auto_32334 ?auto_32338 ) ) ( TRUCK-AT ?auto_32329 ?auto_32337 ) ( SURFACE-AT ?auto_32339 ?auto_32337 ) ( CLEAR ?auto_32339 ) ( IS-CRATE ?auto_32334 ) ( not ( = ?auto_32339 ?auto_32334 ) ) ( not ( = ?auto_32322 ?auto_32339 ) ) ( not ( = ?auto_32323 ?auto_32339 ) ) ( not ( = ?auto_32321 ?auto_32339 ) ) ( not ( = ?auto_32336 ?auto_32339 ) ) ( not ( = ?auto_32326 ?auto_32339 ) ) ( not ( = ?auto_32331 ?auto_32339 ) ) ( not ( = ?auto_32325 ?auto_32339 ) ) ( not ( = ?auto_32338 ?auto_32339 ) ) ( AVAILABLE ?auto_32327 ) ( IN ?auto_32334 ?auto_32329 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32322 ?auto_32323 )
      ( MAKE-2CRATE-VERIFY ?auto_32321 ?auto_32322 ?auto_32323 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32340 - SURFACE
      ?auto_32341 - SURFACE
      ?auto_32342 - SURFACE
      ?auto_32343 - SURFACE
    )
    :vars
    (
      ?auto_32352 - HOIST
      ?auto_32358 - PLACE
      ?auto_32355 - PLACE
      ?auto_32356 - HOIST
      ?auto_32354 - SURFACE
      ?auto_32351 - PLACE
      ?auto_32344 - HOIST
      ?auto_32345 - SURFACE
      ?auto_32350 - PLACE
      ?auto_32353 - HOIST
      ?auto_32357 - SURFACE
      ?auto_32349 - SURFACE
      ?auto_32348 - SURFACE
      ?auto_32346 - TRUCK
      ?auto_32347 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32352 ?auto_32358 ) ( IS-CRATE ?auto_32343 ) ( not ( = ?auto_32342 ?auto_32343 ) ) ( not ( = ?auto_32341 ?auto_32342 ) ) ( not ( = ?auto_32341 ?auto_32343 ) ) ( not ( = ?auto_32355 ?auto_32358 ) ) ( HOIST-AT ?auto_32356 ?auto_32355 ) ( not ( = ?auto_32352 ?auto_32356 ) ) ( AVAILABLE ?auto_32356 ) ( SURFACE-AT ?auto_32343 ?auto_32355 ) ( ON ?auto_32343 ?auto_32354 ) ( CLEAR ?auto_32343 ) ( not ( = ?auto_32342 ?auto_32354 ) ) ( not ( = ?auto_32343 ?auto_32354 ) ) ( not ( = ?auto_32341 ?auto_32354 ) ) ( IS-CRATE ?auto_32342 ) ( not ( = ?auto_32351 ?auto_32358 ) ) ( not ( = ?auto_32355 ?auto_32351 ) ) ( HOIST-AT ?auto_32344 ?auto_32351 ) ( not ( = ?auto_32352 ?auto_32344 ) ) ( not ( = ?auto_32356 ?auto_32344 ) ) ( AVAILABLE ?auto_32344 ) ( SURFACE-AT ?auto_32342 ?auto_32351 ) ( ON ?auto_32342 ?auto_32345 ) ( CLEAR ?auto_32342 ) ( not ( = ?auto_32342 ?auto_32345 ) ) ( not ( = ?auto_32343 ?auto_32345 ) ) ( not ( = ?auto_32341 ?auto_32345 ) ) ( not ( = ?auto_32354 ?auto_32345 ) ) ( IS-CRATE ?auto_32341 ) ( not ( = ?auto_32340 ?auto_32341 ) ) ( not ( = ?auto_32342 ?auto_32340 ) ) ( not ( = ?auto_32343 ?auto_32340 ) ) ( not ( = ?auto_32354 ?auto_32340 ) ) ( not ( = ?auto_32345 ?auto_32340 ) ) ( not ( = ?auto_32350 ?auto_32358 ) ) ( not ( = ?auto_32355 ?auto_32350 ) ) ( not ( = ?auto_32351 ?auto_32350 ) ) ( HOIST-AT ?auto_32353 ?auto_32350 ) ( not ( = ?auto_32352 ?auto_32353 ) ) ( not ( = ?auto_32356 ?auto_32353 ) ) ( not ( = ?auto_32344 ?auto_32353 ) ) ( SURFACE-AT ?auto_32341 ?auto_32350 ) ( ON ?auto_32341 ?auto_32357 ) ( CLEAR ?auto_32341 ) ( not ( = ?auto_32342 ?auto_32357 ) ) ( not ( = ?auto_32343 ?auto_32357 ) ) ( not ( = ?auto_32341 ?auto_32357 ) ) ( not ( = ?auto_32354 ?auto_32357 ) ) ( not ( = ?auto_32345 ?auto_32357 ) ) ( not ( = ?auto_32340 ?auto_32357 ) ) ( IS-CRATE ?auto_32340 ) ( not ( = ?auto_32349 ?auto_32340 ) ) ( not ( = ?auto_32342 ?auto_32349 ) ) ( not ( = ?auto_32343 ?auto_32349 ) ) ( not ( = ?auto_32341 ?auto_32349 ) ) ( not ( = ?auto_32354 ?auto_32349 ) ) ( not ( = ?auto_32345 ?auto_32349 ) ) ( not ( = ?auto_32357 ?auto_32349 ) ) ( AVAILABLE ?auto_32353 ) ( SURFACE-AT ?auto_32340 ?auto_32350 ) ( ON ?auto_32340 ?auto_32348 ) ( CLEAR ?auto_32340 ) ( not ( = ?auto_32342 ?auto_32348 ) ) ( not ( = ?auto_32343 ?auto_32348 ) ) ( not ( = ?auto_32341 ?auto_32348 ) ) ( not ( = ?auto_32354 ?auto_32348 ) ) ( not ( = ?auto_32345 ?auto_32348 ) ) ( not ( = ?auto_32340 ?auto_32348 ) ) ( not ( = ?auto_32357 ?auto_32348 ) ) ( not ( = ?auto_32349 ?auto_32348 ) ) ( TRUCK-AT ?auto_32346 ?auto_32358 ) ( SURFACE-AT ?auto_32347 ?auto_32358 ) ( CLEAR ?auto_32347 ) ( IS-CRATE ?auto_32349 ) ( not ( = ?auto_32347 ?auto_32349 ) ) ( not ( = ?auto_32342 ?auto_32347 ) ) ( not ( = ?auto_32343 ?auto_32347 ) ) ( not ( = ?auto_32341 ?auto_32347 ) ) ( not ( = ?auto_32354 ?auto_32347 ) ) ( not ( = ?auto_32345 ?auto_32347 ) ) ( not ( = ?auto_32340 ?auto_32347 ) ) ( not ( = ?auto_32357 ?auto_32347 ) ) ( not ( = ?auto_32348 ?auto_32347 ) ) ( AVAILABLE ?auto_32352 ) ( IN ?auto_32349 ?auto_32346 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32341 ?auto_32342 ?auto_32343 )
      ( MAKE-3CRATE-VERIFY ?auto_32340 ?auto_32341 ?auto_32342 ?auto_32343 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32359 - SURFACE
      ?auto_32360 - SURFACE
      ?auto_32361 - SURFACE
      ?auto_32362 - SURFACE
      ?auto_32363 - SURFACE
    )
    :vars
    (
      ?auto_32371 - HOIST
      ?auto_32377 - PLACE
      ?auto_32374 - PLACE
      ?auto_32375 - HOIST
      ?auto_32373 - SURFACE
      ?auto_32370 - PLACE
      ?auto_32364 - HOIST
      ?auto_32365 - SURFACE
      ?auto_32369 - PLACE
      ?auto_32372 - HOIST
      ?auto_32376 - SURFACE
      ?auto_32368 - SURFACE
      ?auto_32366 - TRUCK
      ?auto_32367 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32371 ?auto_32377 ) ( IS-CRATE ?auto_32363 ) ( not ( = ?auto_32362 ?auto_32363 ) ) ( not ( = ?auto_32361 ?auto_32362 ) ) ( not ( = ?auto_32361 ?auto_32363 ) ) ( not ( = ?auto_32374 ?auto_32377 ) ) ( HOIST-AT ?auto_32375 ?auto_32374 ) ( not ( = ?auto_32371 ?auto_32375 ) ) ( AVAILABLE ?auto_32375 ) ( SURFACE-AT ?auto_32363 ?auto_32374 ) ( ON ?auto_32363 ?auto_32373 ) ( CLEAR ?auto_32363 ) ( not ( = ?auto_32362 ?auto_32373 ) ) ( not ( = ?auto_32363 ?auto_32373 ) ) ( not ( = ?auto_32361 ?auto_32373 ) ) ( IS-CRATE ?auto_32362 ) ( not ( = ?auto_32370 ?auto_32377 ) ) ( not ( = ?auto_32374 ?auto_32370 ) ) ( HOIST-AT ?auto_32364 ?auto_32370 ) ( not ( = ?auto_32371 ?auto_32364 ) ) ( not ( = ?auto_32375 ?auto_32364 ) ) ( AVAILABLE ?auto_32364 ) ( SURFACE-AT ?auto_32362 ?auto_32370 ) ( ON ?auto_32362 ?auto_32365 ) ( CLEAR ?auto_32362 ) ( not ( = ?auto_32362 ?auto_32365 ) ) ( not ( = ?auto_32363 ?auto_32365 ) ) ( not ( = ?auto_32361 ?auto_32365 ) ) ( not ( = ?auto_32373 ?auto_32365 ) ) ( IS-CRATE ?auto_32361 ) ( not ( = ?auto_32360 ?auto_32361 ) ) ( not ( = ?auto_32362 ?auto_32360 ) ) ( not ( = ?auto_32363 ?auto_32360 ) ) ( not ( = ?auto_32373 ?auto_32360 ) ) ( not ( = ?auto_32365 ?auto_32360 ) ) ( not ( = ?auto_32369 ?auto_32377 ) ) ( not ( = ?auto_32374 ?auto_32369 ) ) ( not ( = ?auto_32370 ?auto_32369 ) ) ( HOIST-AT ?auto_32372 ?auto_32369 ) ( not ( = ?auto_32371 ?auto_32372 ) ) ( not ( = ?auto_32375 ?auto_32372 ) ) ( not ( = ?auto_32364 ?auto_32372 ) ) ( SURFACE-AT ?auto_32361 ?auto_32369 ) ( ON ?auto_32361 ?auto_32376 ) ( CLEAR ?auto_32361 ) ( not ( = ?auto_32362 ?auto_32376 ) ) ( not ( = ?auto_32363 ?auto_32376 ) ) ( not ( = ?auto_32361 ?auto_32376 ) ) ( not ( = ?auto_32373 ?auto_32376 ) ) ( not ( = ?auto_32365 ?auto_32376 ) ) ( not ( = ?auto_32360 ?auto_32376 ) ) ( IS-CRATE ?auto_32360 ) ( not ( = ?auto_32359 ?auto_32360 ) ) ( not ( = ?auto_32362 ?auto_32359 ) ) ( not ( = ?auto_32363 ?auto_32359 ) ) ( not ( = ?auto_32361 ?auto_32359 ) ) ( not ( = ?auto_32373 ?auto_32359 ) ) ( not ( = ?auto_32365 ?auto_32359 ) ) ( not ( = ?auto_32376 ?auto_32359 ) ) ( AVAILABLE ?auto_32372 ) ( SURFACE-AT ?auto_32360 ?auto_32369 ) ( ON ?auto_32360 ?auto_32368 ) ( CLEAR ?auto_32360 ) ( not ( = ?auto_32362 ?auto_32368 ) ) ( not ( = ?auto_32363 ?auto_32368 ) ) ( not ( = ?auto_32361 ?auto_32368 ) ) ( not ( = ?auto_32373 ?auto_32368 ) ) ( not ( = ?auto_32365 ?auto_32368 ) ) ( not ( = ?auto_32360 ?auto_32368 ) ) ( not ( = ?auto_32376 ?auto_32368 ) ) ( not ( = ?auto_32359 ?auto_32368 ) ) ( TRUCK-AT ?auto_32366 ?auto_32377 ) ( SURFACE-AT ?auto_32367 ?auto_32377 ) ( CLEAR ?auto_32367 ) ( IS-CRATE ?auto_32359 ) ( not ( = ?auto_32367 ?auto_32359 ) ) ( not ( = ?auto_32362 ?auto_32367 ) ) ( not ( = ?auto_32363 ?auto_32367 ) ) ( not ( = ?auto_32361 ?auto_32367 ) ) ( not ( = ?auto_32373 ?auto_32367 ) ) ( not ( = ?auto_32365 ?auto_32367 ) ) ( not ( = ?auto_32360 ?auto_32367 ) ) ( not ( = ?auto_32376 ?auto_32367 ) ) ( not ( = ?auto_32368 ?auto_32367 ) ) ( AVAILABLE ?auto_32371 ) ( IN ?auto_32359 ?auto_32366 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32361 ?auto_32362 ?auto_32363 )
      ( MAKE-4CRATE-VERIFY ?auto_32359 ?auto_32360 ?auto_32361 ?auto_32362 ?auto_32363 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_32378 - SURFACE
      ?auto_32379 - SURFACE
      ?auto_32380 - SURFACE
      ?auto_32381 - SURFACE
      ?auto_32382 - SURFACE
      ?auto_32383 - SURFACE
    )
    :vars
    (
      ?auto_32390 - HOIST
      ?auto_32396 - PLACE
      ?auto_32393 - PLACE
      ?auto_32394 - HOIST
      ?auto_32392 - SURFACE
      ?auto_32389 - PLACE
      ?auto_32384 - HOIST
      ?auto_32385 - SURFACE
      ?auto_32388 - PLACE
      ?auto_32391 - HOIST
      ?auto_32395 - SURFACE
      ?auto_32387 - SURFACE
      ?auto_32386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32390 ?auto_32396 ) ( IS-CRATE ?auto_32383 ) ( not ( = ?auto_32382 ?auto_32383 ) ) ( not ( = ?auto_32381 ?auto_32382 ) ) ( not ( = ?auto_32381 ?auto_32383 ) ) ( not ( = ?auto_32393 ?auto_32396 ) ) ( HOIST-AT ?auto_32394 ?auto_32393 ) ( not ( = ?auto_32390 ?auto_32394 ) ) ( AVAILABLE ?auto_32394 ) ( SURFACE-AT ?auto_32383 ?auto_32393 ) ( ON ?auto_32383 ?auto_32392 ) ( CLEAR ?auto_32383 ) ( not ( = ?auto_32382 ?auto_32392 ) ) ( not ( = ?auto_32383 ?auto_32392 ) ) ( not ( = ?auto_32381 ?auto_32392 ) ) ( IS-CRATE ?auto_32382 ) ( not ( = ?auto_32389 ?auto_32396 ) ) ( not ( = ?auto_32393 ?auto_32389 ) ) ( HOIST-AT ?auto_32384 ?auto_32389 ) ( not ( = ?auto_32390 ?auto_32384 ) ) ( not ( = ?auto_32394 ?auto_32384 ) ) ( AVAILABLE ?auto_32384 ) ( SURFACE-AT ?auto_32382 ?auto_32389 ) ( ON ?auto_32382 ?auto_32385 ) ( CLEAR ?auto_32382 ) ( not ( = ?auto_32382 ?auto_32385 ) ) ( not ( = ?auto_32383 ?auto_32385 ) ) ( not ( = ?auto_32381 ?auto_32385 ) ) ( not ( = ?auto_32392 ?auto_32385 ) ) ( IS-CRATE ?auto_32381 ) ( not ( = ?auto_32380 ?auto_32381 ) ) ( not ( = ?auto_32382 ?auto_32380 ) ) ( not ( = ?auto_32383 ?auto_32380 ) ) ( not ( = ?auto_32392 ?auto_32380 ) ) ( not ( = ?auto_32385 ?auto_32380 ) ) ( not ( = ?auto_32388 ?auto_32396 ) ) ( not ( = ?auto_32393 ?auto_32388 ) ) ( not ( = ?auto_32389 ?auto_32388 ) ) ( HOIST-AT ?auto_32391 ?auto_32388 ) ( not ( = ?auto_32390 ?auto_32391 ) ) ( not ( = ?auto_32394 ?auto_32391 ) ) ( not ( = ?auto_32384 ?auto_32391 ) ) ( SURFACE-AT ?auto_32381 ?auto_32388 ) ( ON ?auto_32381 ?auto_32395 ) ( CLEAR ?auto_32381 ) ( not ( = ?auto_32382 ?auto_32395 ) ) ( not ( = ?auto_32383 ?auto_32395 ) ) ( not ( = ?auto_32381 ?auto_32395 ) ) ( not ( = ?auto_32392 ?auto_32395 ) ) ( not ( = ?auto_32385 ?auto_32395 ) ) ( not ( = ?auto_32380 ?auto_32395 ) ) ( IS-CRATE ?auto_32380 ) ( not ( = ?auto_32379 ?auto_32380 ) ) ( not ( = ?auto_32382 ?auto_32379 ) ) ( not ( = ?auto_32383 ?auto_32379 ) ) ( not ( = ?auto_32381 ?auto_32379 ) ) ( not ( = ?auto_32392 ?auto_32379 ) ) ( not ( = ?auto_32385 ?auto_32379 ) ) ( not ( = ?auto_32395 ?auto_32379 ) ) ( AVAILABLE ?auto_32391 ) ( SURFACE-AT ?auto_32380 ?auto_32388 ) ( ON ?auto_32380 ?auto_32387 ) ( CLEAR ?auto_32380 ) ( not ( = ?auto_32382 ?auto_32387 ) ) ( not ( = ?auto_32383 ?auto_32387 ) ) ( not ( = ?auto_32381 ?auto_32387 ) ) ( not ( = ?auto_32392 ?auto_32387 ) ) ( not ( = ?auto_32385 ?auto_32387 ) ) ( not ( = ?auto_32380 ?auto_32387 ) ) ( not ( = ?auto_32395 ?auto_32387 ) ) ( not ( = ?auto_32379 ?auto_32387 ) ) ( TRUCK-AT ?auto_32386 ?auto_32396 ) ( SURFACE-AT ?auto_32378 ?auto_32396 ) ( CLEAR ?auto_32378 ) ( IS-CRATE ?auto_32379 ) ( not ( = ?auto_32378 ?auto_32379 ) ) ( not ( = ?auto_32382 ?auto_32378 ) ) ( not ( = ?auto_32383 ?auto_32378 ) ) ( not ( = ?auto_32381 ?auto_32378 ) ) ( not ( = ?auto_32392 ?auto_32378 ) ) ( not ( = ?auto_32385 ?auto_32378 ) ) ( not ( = ?auto_32380 ?auto_32378 ) ) ( not ( = ?auto_32395 ?auto_32378 ) ) ( not ( = ?auto_32387 ?auto_32378 ) ) ( AVAILABLE ?auto_32390 ) ( IN ?auto_32379 ?auto_32386 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32381 ?auto_32382 ?auto_32383 )
      ( MAKE-5CRATE-VERIFY ?auto_32378 ?auto_32379 ?auto_32380 ?auto_32381 ?auto_32382 ?auto_32383 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32397 - SURFACE
      ?auto_32398 - SURFACE
    )
    :vars
    (
      ?auto_32409 - HOIST
      ?auto_32415 - PLACE
      ?auto_32401 - SURFACE
      ?auto_32412 - PLACE
      ?auto_32413 - HOIST
      ?auto_32411 - SURFACE
      ?auto_32407 - PLACE
      ?auto_32399 - HOIST
      ?auto_32400 - SURFACE
      ?auto_32408 - SURFACE
      ?auto_32406 - PLACE
      ?auto_32410 - HOIST
      ?auto_32414 - SURFACE
      ?auto_32405 - SURFACE
      ?auto_32404 - SURFACE
      ?auto_32403 - SURFACE
      ?auto_32402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32409 ?auto_32415 ) ( IS-CRATE ?auto_32398 ) ( not ( = ?auto_32397 ?auto_32398 ) ) ( not ( = ?auto_32401 ?auto_32397 ) ) ( not ( = ?auto_32401 ?auto_32398 ) ) ( not ( = ?auto_32412 ?auto_32415 ) ) ( HOIST-AT ?auto_32413 ?auto_32412 ) ( not ( = ?auto_32409 ?auto_32413 ) ) ( AVAILABLE ?auto_32413 ) ( SURFACE-AT ?auto_32398 ?auto_32412 ) ( ON ?auto_32398 ?auto_32411 ) ( CLEAR ?auto_32398 ) ( not ( = ?auto_32397 ?auto_32411 ) ) ( not ( = ?auto_32398 ?auto_32411 ) ) ( not ( = ?auto_32401 ?auto_32411 ) ) ( IS-CRATE ?auto_32397 ) ( not ( = ?auto_32407 ?auto_32415 ) ) ( not ( = ?auto_32412 ?auto_32407 ) ) ( HOIST-AT ?auto_32399 ?auto_32407 ) ( not ( = ?auto_32409 ?auto_32399 ) ) ( not ( = ?auto_32413 ?auto_32399 ) ) ( AVAILABLE ?auto_32399 ) ( SURFACE-AT ?auto_32397 ?auto_32407 ) ( ON ?auto_32397 ?auto_32400 ) ( CLEAR ?auto_32397 ) ( not ( = ?auto_32397 ?auto_32400 ) ) ( not ( = ?auto_32398 ?auto_32400 ) ) ( not ( = ?auto_32401 ?auto_32400 ) ) ( not ( = ?auto_32411 ?auto_32400 ) ) ( IS-CRATE ?auto_32401 ) ( not ( = ?auto_32408 ?auto_32401 ) ) ( not ( = ?auto_32397 ?auto_32408 ) ) ( not ( = ?auto_32398 ?auto_32408 ) ) ( not ( = ?auto_32411 ?auto_32408 ) ) ( not ( = ?auto_32400 ?auto_32408 ) ) ( not ( = ?auto_32406 ?auto_32415 ) ) ( not ( = ?auto_32412 ?auto_32406 ) ) ( not ( = ?auto_32407 ?auto_32406 ) ) ( HOIST-AT ?auto_32410 ?auto_32406 ) ( not ( = ?auto_32409 ?auto_32410 ) ) ( not ( = ?auto_32413 ?auto_32410 ) ) ( not ( = ?auto_32399 ?auto_32410 ) ) ( SURFACE-AT ?auto_32401 ?auto_32406 ) ( ON ?auto_32401 ?auto_32414 ) ( CLEAR ?auto_32401 ) ( not ( = ?auto_32397 ?auto_32414 ) ) ( not ( = ?auto_32398 ?auto_32414 ) ) ( not ( = ?auto_32401 ?auto_32414 ) ) ( not ( = ?auto_32411 ?auto_32414 ) ) ( not ( = ?auto_32400 ?auto_32414 ) ) ( not ( = ?auto_32408 ?auto_32414 ) ) ( IS-CRATE ?auto_32408 ) ( not ( = ?auto_32405 ?auto_32408 ) ) ( not ( = ?auto_32397 ?auto_32405 ) ) ( not ( = ?auto_32398 ?auto_32405 ) ) ( not ( = ?auto_32401 ?auto_32405 ) ) ( not ( = ?auto_32411 ?auto_32405 ) ) ( not ( = ?auto_32400 ?auto_32405 ) ) ( not ( = ?auto_32414 ?auto_32405 ) ) ( AVAILABLE ?auto_32410 ) ( SURFACE-AT ?auto_32408 ?auto_32406 ) ( ON ?auto_32408 ?auto_32404 ) ( CLEAR ?auto_32408 ) ( not ( = ?auto_32397 ?auto_32404 ) ) ( not ( = ?auto_32398 ?auto_32404 ) ) ( not ( = ?auto_32401 ?auto_32404 ) ) ( not ( = ?auto_32411 ?auto_32404 ) ) ( not ( = ?auto_32400 ?auto_32404 ) ) ( not ( = ?auto_32408 ?auto_32404 ) ) ( not ( = ?auto_32414 ?auto_32404 ) ) ( not ( = ?auto_32405 ?auto_32404 ) ) ( SURFACE-AT ?auto_32403 ?auto_32415 ) ( CLEAR ?auto_32403 ) ( IS-CRATE ?auto_32405 ) ( not ( = ?auto_32403 ?auto_32405 ) ) ( not ( = ?auto_32397 ?auto_32403 ) ) ( not ( = ?auto_32398 ?auto_32403 ) ) ( not ( = ?auto_32401 ?auto_32403 ) ) ( not ( = ?auto_32411 ?auto_32403 ) ) ( not ( = ?auto_32400 ?auto_32403 ) ) ( not ( = ?auto_32408 ?auto_32403 ) ) ( not ( = ?auto_32414 ?auto_32403 ) ) ( not ( = ?auto_32404 ?auto_32403 ) ) ( AVAILABLE ?auto_32409 ) ( IN ?auto_32405 ?auto_32402 ) ( TRUCK-AT ?auto_32402 ?auto_32407 ) )
    :subtasks
    ( ( !DRIVE ?auto_32402 ?auto_32407 ?auto_32415 )
      ( MAKE-2CRATE ?auto_32401 ?auto_32397 ?auto_32398 )
      ( MAKE-1CRATE-VERIFY ?auto_32397 ?auto_32398 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32416 - SURFACE
      ?auto_32417 - SURFACE
      ?auto_32418 - SURFACE
    )
    :vars
    (
      ?auto_32425 - HOIST
      ?auto_32419 - PLACE
      ?auto_32429 - PLACE
      ?auto_32430 - HOIST
      ?auto_32421 - SURFACE
      ?auto_32434 - PLACE
      ?auto_32422 - HOIST
      ?auto_32420 - SURFACE
      ?auto_32427 - SURFACE
      ?auto_32431 - PLACE
      ?auto_32432 - HOIST
      ?auto_32423 - SURFACE
      ?auto_32424 - SURFACE
      ?auto_32433 - SURFACE
      ?auto_32428 - SURFACE
      ?auto_32426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32425 ?auto_32419 ) ( IS-CRATE ?auto_32418 ) ( not ( = ?auto_32417 ?auto_32418 ) ) ( not ( = ?auto_32416 ?auto_32417 ) ) ( not ( = ?auto_32416 ?auto_32418 ) ) ( not ( = ?auto_32429 ?auto_32419 ) ) ( HOIST-AT ?auto_32430 ?auto_32429 ) ( not ( = ?auto_32425 ?auto_32430 ) ) ( AVAILABLE ?auto_32430 ) ( SURFACE-AT ?auto_32418 ?auto_32429 ) ( ON ?auto_32418 ?auto_32421 ) ( CLEAR ?auto_32418 ) ( not ( = ?auto_32417 ?auto_32421 ) ) ( not ( = ?auto_32418 ?auto_32421 ) ) ( not ( = ?auto_32416 ?auto_32421 ) ) ( IS-CRATE ?auto_32417 ) ( not ( = ?auto_32434 ?auto_32419 ) ) ( not ( = ?auto_32429 ?auto_32434 ) ) ( HOIST-AT ?auto_32422 ?auto_32434 ) ( not ( = ?auto_32425 ?auto_32422 ) ) ( not ( = ?auto_32430 ?auto_32422 ) ) ( AVAILABLE ?auto_32422 ) ( SURFACE-AT ?auto_32417 ?auto_32434 ) ( ON ?auto_32417 ?auto_32420 ) ( CLEAR ?auto_32417 ) ( not ( = ?auto_32417 ?auto_32420 ) ) ( not ( = ?auto_32418 ?auto_32420 ) ) ( not ( = ?auto_32416 ?auto_32420 ) ) ( not ( = ?auto_32421 ?auto_32420 ) ) ( IS-CRATE ?auto_32416 ) ( not ( = ?auto_32427 ?auto_32416 ) ) ( not ( = ?auto_32417 ?auto_32427 ) ) ( not ( = ?auto_32418 ?auto_32427 ) ) ( not ( = ?auto_32421 ?auto_32427 ) ) ( not ( = ?auto_32420 ?auto_32427 ) ) ( not ( = ?auto_32431 ?auto_32419 ) ) ( not ( = ?auto_32429 ?auto_32431 ) ) ( not ( = ?auto_32434 ?auto_32431 ) ) ( HOIST-AT ?auto_32432 ?auto_32431 ) ( not ( = ?auto_32425 ?auto_32432 ) ) ( not ( = ?auto_32430 ?auto_32432 ) ) ( not ( = ?auto_32422 ?auto_32432 ) ) ( SURFACE-AT ?auto_32416 ?auto_32431 ) ( ON ?auto_32416 ?auto_32423 ) ( CLEAR ?auto_32416 ) ( not ( = ?auto_32417 ?auto_32423 ) ) ( not ( = ?auto_32418 ?auto_32423 ) ) ( not ( = ?auto_32416 ?auto_32423 ) ) ( not ( = ?auto_32421 ?auto_32423 ) ) ( not ( = ?auto_32420 ?auto_32423 ) ) ( not ( = ?auto_32427 ?auto_32423 ) ) ( IS-CRATE ?auto_32427 ) ( not ( = ?auto_32424 ?auto_32427 ) ) ( not ( = ?auto_32417 ?auto_32424 ) ) ( not ( = ?auto_32418 ?auto_32424 ) ) ( not ( = ?auto_32416 ?auto_32424 ) ) ( not ( = ?auto_32421 ?auto_32424 ) ) ( not ( = ?auto_32420 ?auto_32424 ) ) ( not ( = ?auto_32423 ?auto_32424 ) ) ( AVAILABLE ?auto_32432 ) ( SURFACE-AT ?auto_32427 ?auto_32431 ) ( ON ?auto_32427 ?auto_32433 ) ( CLEAR ?auto_32427 ) ( not ( = ?auto_32417 ?auto_32433 ) ) ( not ( = ?auto_32418 ?auto_32433 ) ) ( not ( = ?auto_32416 ?auto_32433 ) ) ( not ( = ?auto_32421 ?auto_32433 ) ) ( not ( = ?auto_32420 ?auto_32433 ) ) ( not ( = ?auto_32427 ?auto_32433 ) ) ( not ( = ?auto_32423 ?auto_32433 ) ) ( not ( = ?auto_32424 ?auto_32433 ) ) ( SURFACE-AT ?auto_32428 ?auto_32419 ) ( CLEAR ?auto_32428 ) ( IS-CRATE ?auto_32424 ) ( not ( = ?auto_32428 ?auto_32424 ) ) ( not ( = ?auto_32417 ?auto_32428 ) ) ( not ( = ?auto_32418 ?auto_32428 ) ) ( not ( = ?auto_32416 ?auto_32428 ) ) ( not ( = ?auto_32421 ?auto_32428 ) ) ( not ( = ?auto_32420 ?auto_32428 ) ) ( not ( = ?auto_32427 ?auto_32428 ) ) ( not ( = ?auto_32423 ?auto_32428 ) ) ( not ( = ?auto_32433 ?auto_32428 ) ) ( AVAILABLE ?auto_32425 ) ( IN ?auto_32424 ?auto_32426 ) ( TRUCK-AT ?auto_32426 ?auto_32434 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32417 ?auto_32418 )
      ( MAKE-2CRATE-VERIFY ?auto_32416 ?auto_32417 ?auto_32418 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32435 - SURFACE
      ?auto_32436 - SURFACE
      ?auto_32437 - SURFACE
      ?auto_32438 - SURFACE
    )
    :vars
    (
      ?auto_32439 - HOIST
      ?auto_32442 - PLACE
      ?auto_32445 - PLACE
      ?auto_32449 - HOIST
      ?auto_32446 - SURFACE
      ?auto_32443 - PLACE
      ?auto_32450 - HOIST
      ?auto_32448 - SURFACE
      ?auto_32451 - PLACE
      ?auto_32440 - HOIST
      ?auto_32453 - SURFACE
      ?auto_32441 - SURFACE
      ?auto_32447 - SURFACE
      ?auto_32444 - SURFACE
      ?auto_32452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32439 ?auto_32442 ) ( IS-CRATE ?auto_32438 ) ( not ( = ?auto_32437 ?auto_32438 ) ) ( not ( = ?auto_32436 ?auto_32437 ) ) ( not ( = ?auto_32436 ?auto_32438 ) ) ( not ( = ?auto_32445 ?auto_32442 ) ) ( HOIST-AT ?auto_32449 ?auto_32445 ) ( not ( = ?auto_32439 ?auto_32449 ) ) ( AVAILABLE ?auto_32449 ) ( SURFACE-AT ?auto_32438 ?auto_32445 ) ( ON ?auto_32438 ?auto_32446 ) ( CLEAR ?auto_32438 ) ( not ( = ?auto_32437 ?auto_32446 ) ) ( not ( = ?auto_32438 ?auto_32446 ) ) ( not ( = ?auto_32436 ?auto_32446 ) ) ( IS-CRATE ?auto_32437 ) ( not ( = ?auto_32443 ?auto_32442 ) ) ( not ( = ?auto_32445 ?auto_32443 ) ) ( HOIST-AT ?auto_32450 ?auto_32443 ) ( not ( = ?auto_32439 ?auto_32450 ) ) ( not ( = ?auto_32449 ?auto_32450 ) ) ( AVAILABLE ?auto_32450 ) ( SURFACE-AT ?auto_32437 ?auto_32443 ) ( ON ?auto_32437 ?auto_32448 ) ( CLEAR ?auto_32437 ) ( not ( = ?auto_32437 ?auto_32448 ) ) ( not ( = ?auto_32438 ?auto_32448 ) ) ( not ( = ?auto_32436 ?auto_32448 ) ) ( not ( = ?auto_32446 ?auto_32448 ) ) ( IS-CRATE ?auto_32436 ) ( not ( = ?auto_32435 ?auto_32436 ) ) ( not ( = ?auto_32437 ?auto_32435 ) ) ( not ( = ?auto_32438 ?auto_32435 ) ) ( not ( = ?auto_32446 ?auto_32435 ) ) ( not ( = ?auto_32448 ?auto_32435 ) ) ( not ( = ?auto_32451 ?auto_32442 ) ) ( not ( = ?auto_32445 ?auto_32451 ) ) ( not ( = ?auto_32443 ?auto_32451 ) ) ( HOIST-AT ?auto_32440 ?auto_32451 ) ( not ( = ?auto_32439 ?auto_32440 ) ) ( not ( = ?auto_32449 ?auto_32440 ) ) ( not ( = ?auto_32450 ?auto_32440 ) ) ( SURFACE-AT ?auto_32436 ?auto_32451 ) ( ON ?auto_32436 ?auto_32453 ) ( CLEAR ?auto_32436 ) ( not ( = ?auto_32437 ?auto_32453 ) ) ( not ( = ?auto_32438 ?auto_32453 ) ) ( not ( = ?auto_32436 ?auto_32453 ) ) ( not ( = ?auto_32446 ?auto_32453 ) ) ( not ( = ?auto_32448 ?auto_32453 ) ) ( not ( = ?auto_32435 ?auto_32453 ) ) ( IS-CRATE ?auto_32435 ) ( not ( = ?auto_32441 ?auto_32435 ) ) ( not ( = ?auto_32437 ?auto_32441 ) ) ( not ( = ?auto_32438 ?auto_32441 ) ) ( not ( = ?auto_32436 ?auto_32441 ) ) ( not ( = ?auto_32446 ?auto_32441 ) ) ( not ( = ?auto_32448 ?auto_32441 ) ) ( not ( = ?auto_32453 ?auto_32441 ) ) ( AVAILABLE ?auto_32440 ) ( SURFACE-AT ?auto_32435 ?auto_32451 ) ( ON ?auto_32435 ?auto_32447 ) ( CLEAR ?auto_32435 ) ( not ( = ?auto_32437 ?auto_32447 ) ) ( not ( = ?auto_32438 ?auto_32447 ) ) ( not ( = ?auto_32436 ?auto_32447 ) ) ( not ( = ?auto_32446 ?auto_32447 ) ) ( not ( = ?auto_32448 ?auto_32447 ) ) ( not ( = ?auto_32435 ?auto_32447 ) ) ( not ( = ?auto_32453 ?auto_32447 ) ) ( not ( = ?auto_32441 ?auto_32447 ) ) ( SURFACE-AT ?auto_32444 ?auto_32442 ) ( CLEAR ?auto_32444 ) ( IS-CRATE ?auto_32441 ) ( not ( = ?auto_32444 ?auto_32441 ) ) ( not ( = ?auto_32437 ?auto_32444 ) ) ( not ( = ?auto_32438 ?auto_32444 ) ) ( not ( = ?auto_32436 ?auto_32444 ) ) ( not ( = ?auto_32446 ?auto_32444 ) ) ( not ( = ?auto_32448 ?auto_32444 ) ) ( not ( = ?auto_32435 ?auto_32444 ) ) ( not ( = ?auto_32453 ?auto_32444 ) ) ( not ( = ?auto_32447 ?auto_32444 ) ) ( AVAILABLE ?auto_32439 ) ( IN ?auto_32441 ?auto_32452 ) ( TRUCK-AT ?auto_32452 ?auto_32443 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32436 ?auto_32437 ?auto_32438 )
      ( MAKE-3CRATE-VERIFY ?auto_32435 ?auto_32436 ?auto_32437 ?auto_32438 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32454 - SURFACE
      ?auto_32455 - SURFACE
      ?auto_32456 - SURFACE
      ?auto_32457 - SURFACE
      ?auto_32458 - SURFACE
    )
    :vars
    (
      ?auto_32459 - HOIST
      ?auto_32461 - PLACE
      ?auto_32464 - PLACE
      ?auto_32468 - HOIST
      ?auto_32465 - SURFACE
      ?auto_32462 - PLACE
      ?auto_32469 - HOIST
      ?auto_32467 - SURFACE
      ?auto_32470 - PLACE
      ?auto_32460 - HOIST
      ?auto_32472 - SURFACE
      ?auto_32466 - SURFACE
      ?auto_32463 - SURFACE
      ?auto_32471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32459 ?auto_32461 ) ( IS-CRATE ?auto_32458 ) ( not ( = ?auto_32457 ?auto_32458 ) ) ( not ( = ?auto_32456 ?auto_32457 ) ) ( not ( = ?auto_32456 ?auto_32458 ) ) ( not ( = ?auto_32464 ?auto_32461 ) ) ( HOIST-AT ?auto_32468 ?auto_32464 ) ( not ( = ?auto_32459 ?auto_32468 ) ) ( AVAILABLE ?auto_32468 ) ( SURFACE-AT ?auto_32458 ?auto_32464 ) ( ON ?auto_32458 ?auto_32465 ) ( CLEAR ?auto_32458 ) ( not ( = ?auto_32457 ?auto_32465 ) ) ( not ( = ?auto_32458 ?auto_32465 ) ) ( not ( = ?auto_32456 ?auto_32465 ) ) ( IS-CRATE ?auto_32457 ) ( not ( = ?auto_32462 ?auto_32461 ) ) ( not ( = ?auto_32464 ?auto_32462 ) ) ( HOIST-AT ?auto_32469 ?auto_32462 ) ( not ( = ?auto_32459 ?auto_32469 ) ) ( not ( = ?auto_32468 ?auto_32469 ) ) ( AVAILABLE ?auto_32469 ) ( SURFACE-AT ?auto_32457 ?auto_32462 ) ( ON ?auto_32457 ?auto_32467 ) ( CLEAR ?auto_32457 ) ( not ( = ?auto_32457 ?auto_32467 ) ) ( not ( = ?auto_32458 ?auto_32467 ) ) ( not ( = ?auto_32456 ?auto_32467 ) ) ( not ( = ?auto_32465 ?auto_32467 ) ) ( IS-CRATE ?auto_32456 ) ( not ( = ?auto_32455 ?auto_32456 ) ) ( not ( = ?auto_32457 ?auto_32455 ) ) ( not ( = ?auto_32458 ?auto_32455 ) ) ( not ( = ?auto_32465 ?auto_32455 ) ) ( not ( = ?auto_32467 ?auto_32455 ) ) ( not ( = ?auto_32470 ?auto_32461 ) ) ( not ( = ?auto_32464 ?auto_32470 ) ) ( not ( = ?auto_32462 ?auto_32470 ) ) ( HOIST-AT ?auto_32460 ?auto_32470 ) ( not ( = ?auto_32459 ?auto_32460 ) ) ( not ( = ?auto_32468 ?auto_32460 ) ) ( not ( = ?auto_32469 ?auto_32460 ) ) ( SURFACE-AT ?auto_32456 ?auto_32470 ) ( ON ?auto_32456 ?auto_32472 ) ( CLEAR ?auto_32456 ) ( not ( = ?auto_32457 ?auto_32472 ) ) ( not ( = ?auto_32458 ?auto_32472 ) ) ( not ( = ?auto_32456 ?auto_32472 ) ) ( not ( = ?auto_32465 ?auto_32472 ) ) ( not ( = ?auto_32467 ?auto_32472 ) ) ( not ( = ?auto_32455 ?auto_32472 ) ) ( IS-CRATE ?auto_32455 ) ( not ( = ?auto_32454 ?auto_32455 ) ) ( not ( = ?auto_32457 ?auto_32454 ) ) ( not ( = ?auto_32458 ?auto_32454 ) ) ( not ( = ?auto_32456 ?auto_32454 ) ) ( not ( = ?auto_32465 ?auto_32454 ) ) ( not ( = ?auto_32467 ?auto_32454 ) ) ( not ( = ?auto_32472 ?auto_32454 ) ) ( AVAILABLE ?auto_32460 ) ( SURFACE-AT ?auto_32455 ?auto_32470 ) ( ON ?auto_32455 ?auto_32466 ) ( CLEAR ?auto_32455 ) ( not ( = ?auto_32457 ?auto_32466 ) ) ( not ( = ?auto_32458 ?auto_32466 ) ) ( not ( = ?auto_32456 ?auto_32466 ) ) ( not ( = ?auto_32465 ?auto_32466 ) ) ( not ( = ?auto_32467 ?auto_32466 ) ) ( not ( = ?auto_32455 ?auto_32466 ) ) ( not ( = ?auto_32472 ?auto_32466 ) ) ( not ( = ?auto_32454 ?auto_32466 ) ) ( SURFACE-AT ?auto_32463 ?auto_32461 ) ( CLEAR ?auto_32463 ) ( IS-CRATE ?auto_32454 ) ( not ( = ?auto_32463 ?auto_32454 ) ) ( not ( = ?auto_32457 ?auto_32463 ) ) ( not ( = ?auto_32458 ?auto_32463 ) ) ( not ( = ?auto_32456 ?auto_32463 ) ) ( not ( = ?auto_32465 ?auto_32463 ) ) ( not ( = ?auto_32467 ?auto_32463 ) ) ( not ( = ?auto_32455 ?auto_32463 ) ) ( not ( = ?auto_32472 ?auto_32463 ) ) ( not ( = ?auto_32466 ?auto_32463 ) ) ( AVAILABLE ?auto_32459 ) ( IN ?auto_32454 ?auto_32471 ) ( TRUCK-AT ?auto_32471 ?auto_32462 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32456 ?auto_32457 ?auto_32458 )
      ( MAKE-4CRATE-VERIFY ?auto_32454 ?auto_32455 ?auto_32456 ?auto_32457 ?auto_32458 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_32473 - SURFACE
      ?auto_32474 - SURFACE
      ?auto_32475 - SURFACE
      ?auto_32476 - SURFACE
      ?auto_32477 - SURFACE
      ?auto_32478 - SURFACE
    )
    :vars
    (
      ?auto_32479 - HOIST
      ?auto_32481 - PLACE
      ?auto_32483 - PLACE
      ?auto_32487 - HOIST
      ?auto_32484 - SURFACE
      ?auto_32482 - PLACE
      ?auto_32488 - HOIST
      ?auto_32486 - SURFACE
      ?auto_32489 - PLACE
      ?auto_32480 - HOIST
      ?auto_32491 - SURFACE
      ?auto_32485 - SURFACE
      ?auto_32490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32479 ?auto_32481 ) ( IS-CRATE ?auto_32478 ) ( not ( = ?auto_32477 ?auto_32478 ) ) ( not ( = ?auto_32476 ?auto_32477 ) ) ( not ( = ?auto_32476 ?auto_32478 ) ) ( not ( = ?auto_32483 ?auto_32481 ) ) ( HOIST-AT ?auto_32487 ?auto_32483 ) ( not ( = ?auto_32479 ?auto_32487 ) ) ( AVAILABLE ?auto_32487 ) ( SURFACE-AT ?auto_32478 ?auto_32483 ) ( ON ?auto_32478 ?auto_32484 ) ( CLEAR ?auto_32478 ) ( not ( = ?auto_32477 ?auto_32484 ) ) ( not ( = ?auto_32478 ?auto_32484 ) ) ( not ( = ?auto_32476 ?auto_32484 ) ) ( IS-CRATE ?auto_32477 ) ( not ( = ?auto_32482 ?auto_32481 ) ) ( not ( = ?auto_32483 ?auto_32482 ) ) ( HOIST-AT ?auto_32488 ?auto_32482 ) ( not ( = ?auto_32479 ?auto_32488 ) ) ( not ( = ?auto_32487 ?auto_32488 ) ) ( AVAILABLE ?auto_32488 ) ( SURFACE-AT ?auto_32477 ?auto_32482 ) ( ON ?auto_32477 ?auto_32486 ) ( CLEAR ?auto_32477 ) ( not ( = ?auto_32477 ?auto_32486 ) ) ( not ( = ?auto_32478 ?auto_32486 ) ) ( not ( = ?auto_32476 ?auto_32486 ) ) ( not ( = ?auto_32484 ?auto_32486 ) ) ( IS-CRATE ?auto_32476 ) ( not ( = ?auto_32475 ?auto_32476 ) ) ( not ( = ?auto_32477 ?auto_32475 ) ) ( not ( = ?auto_32478 ?auto_32475 ) ) ( not ( = ?auto_32484 ?auto_32475 ) ) ( not ( = ?auto_32486 ?auto_32475 ) ) ( not ( = ?auto_32489 ?auto_32481 ) ) ( not ( = ?auto_32483 ?auto_32489 ) ) ( not ( = ?auto_32482 ?auto_32489 ) ) ( HOIST-AT ?auto_32480 ?auto_32489 ) ( not ( = ?auto_32479 ?auto_32480 ) ) ( not ( = ?auto_32487 ?auto_32480 ) ) ( not ( = ?auto_32488 ?auto_32480 ) ) ( SURFACE-AT ?auto_32476 ?auto_32489 ) ( ON ?auto_32476 ?auto_32491 ) ( CLEAR ?auto_32476 ) ( not ( = ?auto_32477 ?auto_32491 ) ) ( not ( = ?auto_32478 ?auto_32491 ) ) ( not ( = ?auto_32476 ?auto_32491 ) ) ( not ( = ?auto_32484 ?auto_32491 ) ) ( not ( = ?auto_32486 ?auto_32491 ) ) ( not ( = ?auto_32475 ?auto_32491 ) ) ( IS-CRATE ?auto_32475 ) ( not ( = ?auto_32474 ?auto_32475 ) ) ( not ( = ?auto_32477 ?auto_32474 ) ) ( not ( = ?auto_32478 ?auto_32474 ) ) ( not ( = ?auto_32476 ?auto_32474 ) ) ( not ( = ?auto_32484 ?auto_32474 ) ) ( not ( = ?auto_32486 ?auto_32474 ) ) ( not ( = ?auto_32491 ?auto_32474 ) ) ( AVAILABLE ?auto_32480 ) ( SURFACE-AT ?auto_32475 ?auto_32489 ) ( ON ?auto_32475 ?auto_32485 ) ( CLEAR ?auto_32475 ) ( not ( = ?auto_32477 ?auto_32485 ) ) ( not ( = ?auto_32478 ?auto_32485 ) ) ( not ( = ?auto_32476 ?auto_32485 ) ) ( not ( = ?auto_32484 ?auto_32485 ) ) ( not ( = ?auto_32486 ?auto_32485 ) ) ( not ( = ?auto_32475 ?auto_32485 ) ) ( not ( = ?auto_32491 ?auto_32485 ) ) ( not ( = ?auto_32474 ?auto_32485 ) ) ( SURFACE-AT ?auto_32473 ?auto_32481 ) ( CLEAR ?auto_32473 ) ( IS-CRATE ?auto_32474 ) ( not ( = ?auto_32473 ?auto_32474 ) ) ( not ( = ?auto_32477 ?auto_32473 ) ) ( not ( = ?auto_32478 ?auto_32473 ) ) ( not ( = ?auto_32476 ?auto_32473 ) ) ( not ( = ?auto_32484 ?auto_32473 ) ) ( not ( = ?auto_32486 ?auto_32473 ) ) ( not ( = ?auto_32475 ?auto_32473 ) ) ( not ( = ?auto_32491 ?auto_32473 ) ) ( not ( = ?auto_32485 ?auto_32473 ) ) ( AVAILABLE ?auto_32479 ) ( IN ?auto_32474 ?auto_32490 ) ( TRUCK-AT ?auto_32490 ?auto_32482 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32476 ?auto_32477 ?auto_32478 )
      ( MAKE-5CRATE-VERIFY ?auto_32473 ?auto_32474 ?auto_32475 ?auto_32476 ?auto_32477 ?auto_32478 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32492 - SURFACE
      ?auto_32493 - SURFACE
    )
    :vars
    (
      ?auto_32494 - HOIST
      ?auto_32497 - PLACE
      ?auto_32505 - SURFACE
      ?auto_32500 - PLACE
      ?auto_32504 - HOIST
      ?auto_32501 - SURFACE
      ?auto_32498 - PLACE
      ?auto_32506 - HOIST
      ?auto_32503 - SURFACE
      ?auto_32508 - SURFACE
      ?auto_32507 - PLACE
      ?auto_32495 - HOIST
      ?auto_32510 - SURFACE
      ?auto_32496 - SURFACE
      ?auto_32502 - SURFACE
      ?auto_32499 - SURFACE
      ?auto_32509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32494 ?auto_32497 ) ( IS-CRATE ?auto_32493 ) ( not ( = ?auto_32492 ?auto_32493 ) ) ( not ( = ?auto_32505 ?auto_32492 ) ) ( not ( = ?auto_32505 ?auto_32493 ) ) ( not ( = ?auto_32500 ?auto_32497 ) ) ( HOIST-AT ?auto_32504 ?auto_32500 ) ( not ( = ?auto_32494 ?auto_32504 ) ) ( AVAILABLE ?auto_32504 ) ( SURFACE-AT ?auto_32493 ?auto_32500 ) ( ON ?auto_32493 ?auto_32501 ) ( CLEAR ?auto_32493 ) ( not ( = ?auto_32492 ?auto_32501 ) ) ( not ( = ?auto_32493 ?auto_32501 ) ) ( not ( = ?auto_32505 ?auto_32501 ) ) ( IS-CRATE ?auto_32492 ) ( not ( = ?auto_32498 ?auto_32497 ) ) ( not ( = ?auto_32500 ?auto_32498 ) ) ( HOIST-AT ?auto_32506 ?auto_32498 ) ( not ( = ?auto_32494 ?auto_32506 ) ) ( not ( = ?auto_32504 ?auto_32506 ) ) ( SURFACE-AT ?auto_32492 ?auto_32498 ) ( ON ?auto_32492 ?auto_32503 ) ( CLEAR ?auto_32492 ) ( not ( = ?auto_32492 ?auto_32503 ) ) ( not ( = ?auto_32493 ?auto_32503 ) ) ( not ( = ?auto_32505 ?auto_32503 ) ) ( not ( = ?auto_32501 ?auto_32503 ) ) ( IS-CRATE ?auto_32505 ) ( not ( = ?auto_32508 ?auto_32505 ) ) ( not ( = ?auto_32492 ?auto_32508 ) ) ( not ( = ?auto_32493 ?auto_32508 ) ) ( not ( = ?auto_32501 ?auto_32508 ) ) ( not ( = ?auto_32503 ?auto_32508 ) ) ( not ( = ?auto_32507 ?auto_32497 ) ) ( not ( = ?auto_32500 ?auto_32507 ) ) ( not ( = ?auto_32498 ?auto_32507 ) ) ( HOIST-AT ?auto_32495 ?auto_32507 ) ( not ( = ?auto_32494 ?auto_32495 ) ) ( not ( = ?auto_32504 ?auto_32495 ) ) ( not ( = ?auto_32506 ?auto_32495 ) ) ( SURFACE-AT ?auto_32505 ?auto_32507 ) ( ON ?auto_32505 ?auto_32510 ) ( CLEAR ?auto_32505 ) ( not ( = ?auto_32492 ?auto_32510 ) ) ( not ( = ?auto_32493 ?auto_32510 ) ) ( not ( = ?auto_32505 ?auto_32510 ) ) ( not ( = ?auto_32501 ?auto_32510 ) ) ( not ( = ?auto_32503 ?auto_32510 ) ) ( not ( = ?auto_32508 ?auto_32510 ) ) ( IS-CRATE ?auto_32508 ) ( not ( = ?auto_32496 ?auto_32508 ) ) ( not ( = ?auto_32492 ?auto_32496 ) ) ( not ( = ?auto_32493 ?auto_32496 ) ) ( not ( = ?auto_32505 ?auto_32496 ) ) ( not ( = ?auto_32501 ?auto_32496 ) ) ( not ( = ?auto_32503 ?auto_32496 ) ) ( not ( = ?auto_32510 ?auto_32496 ) ) ( AVAILABLE ?auto_32495 ) ( SURFACE-AT ?auto_32508 ?auto_32507 ) ( ON ?auto_32508 ?auto_32502 ) ( CLEAR ?auto_32508 ) ( not ( = ?auto_32492 ?auto_32502 ) ) ( not ( = ?auto_32493 ?auto_32502 ) ) ( not ( = ?auto_32505 ?auto_32502 ) ) ( not ( = ?auto_32501 ?auto_32502 ) ) ( not ( = ?auto_32503 ?auto_32502 ) ) ( not ( = ?auto_32508 ?auto_32502 ) ) ( not ( = ?auto_32510 ?auto_32502 ) ) ( not ( = ?auto_32496 ?auto_32502 ) ) ( SURFACE-AT ?auto_32499 ?auto_32497 ) ( CLEAR ?auto_32499 ) ( IS-CRATE ?auto_32496 ) ( not ( = ?auto_32499 ?auto_32496 ) ) ( not ( = ?auto_32492 ?auto_32499 ) ) ( not ( = ?auto_32493 ?auto_32499 ) ) ( not ( = ?auto_32505 ?auto_32499 ) ) ( not ( = ?auto_32501 ?auto_32499 ) ) ( not ( = ?auto_32503 ?auto_32499 ) ) ( not ( = ?auto_32508 ?auto_32499 ) ) ( not ( = ?auto_32510 ?auto_32499 ) ) ( not ( = ?auto_32502 ?auto_32499 ) ) ( AVAILABLE ?auto_32494 ) ( TRUCK-AT ?auto_32509 ?auto_32498 ) ( LIFTING ?auto_32506 ?auto_32496 ) )
    :subtasks
    ( ( !LOAD ?auto_32506 ?auto_32496 ?auto_32509 ?auto_32498 )
      ( MAKE-2CRATE ?auto_32505 ?auto_32492 ?auto_32493 )
      ( MAKE-1CRATE-VERIFY ?auto_32492 ?auto_32493 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32511 - SURFACE
      ?auto_32512 - SURFACE
      ?auto_32513 - SURFACE
    )
    :vars
    (
      ?auto_32521 - HOIST
      ?auto_32518 - PLACE
      ?auto_32526 - PLACE
      ?auto_32519 - HOIST
      ?auto_32524 - SURFACE
      ?auto_32528 - PLACE
      ?auto_32517 - HOIST
      ?auto_32514 - SURFACE
      ?auto_32522 - SURFACE
      ?auto_32520 - PLACE
      ?auto_32525 - HOIST
      ?auto_32523 - SURFACE
      ?auto_32516 - SURFACE
      ?auto_32515 - SURFACE
      ?auto_32529 - SURFACE
      ?auto_32527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32521 ?auto_32518 ) ( IS-CRATE ?auto_32513 ) ( not ( = ?auto_32512 ?auto_32513 ) ) ( not ( = ?auto_32511 ?auto_32512 ) ) ( not ( = ?auto_32511 ?auto_32513 ) ) ( not ( = ?auto_32526 ?auto_32518 ) ) ( HOIST-AT ?auto_32519 ?auto_32526 ) ( not ( = ?auto_32521 ?auto_32519 ) ) ( AVAILABLE ?auto_32519 ) ( SURFACE-AT ?auto_32513 ?auto_32526 ) ( ON ?auto_32513 ?auto_32524 ) ( CLEAR ?auto_32513 ) ( not ( = ?auto_32512 ?auto_32524 ) ) ( not ( = ?auto_32513 ?auto_32524 ) ) ( not ( = ?auto_32511 ?auto_32524 ) ) ( IS-CRATE ?auto_32512 ) ( not ( = ?auto_32528 ?auto_32518 ) ) ( not ( = ?auto_32526 ?auto_32528 ) ) ( HOIST-AT ?auto_32517 ?auto_32528 ) ( not ( = ?auto_32521 ?auto_32517 ) ) ( not ( = ?auto_32519 ?auto_32517 ) ) ( SURFACE-AT ?auto_32512 ?auto_32528 ) ( ON ?auto_32512 ?auto_32514 ) ( CLEAR ?auto_32512 ) ( not ( = ?auto_32512 ?auto_32514 ) ) ( not ( = ?auto_32513 ?auto_32514 ) ) ( not ( = ?auto_32511 ?auto_32514 ) ) ( not ( = ?auto_32524 ?auto_32514 ) ) ( IS-CRATE ?auto_32511 ) ( not ( = ?auto_32522 ?auto_32511 ) ) ( not ( = ?auto_32512 ?auto_32522 ) ) ( not ( = ?auto_32513 ?auto_32522 ) ) ( not ( = ?auto_32524 ?auto_32522 ) ) ( not ( = ?auto_32514 ?auto_32522 ) ) ( not ( = ?auto_32520 ?auto_32518 ) ) ( not ( = ?auto_32526 ?auto_32520 ) ) ( not ( = ?auto_32528 ?auto_32520 ) ) ( HOIST-AT ?auto_32525 ?auto_32520 ) ( not ( = ?auto_32521 ?auto_32525 ) ) ( not ( = ?auto_32519 ?auto_32525 ) ) ( not ( = ?auto_32517 ?auto_32525 ) ) ( SURFACE-AT ?auto_32511 ?auto_32520 ) ( ON ?auto_32511 ?auto_32523 ) ( CLEAR ?auto_32511 ) ( not ( = ?auto_32512 ?auto_32523 ) ) ( not ( = ?auto_32513 ?auto_32523 ) ) ( not ( = ?auto_32511 ?auto_32523 ) ) ( not ( = ?auto_32524 ?auto_32523 ) ) ( not ( = ?auto_32514 ?auto_32523 ) ) ( not ( = ?auto_32522 ?auto_32523 ) ) ( IS-CRATE ?auto_32522 ) ( not ( = ?auto_32516 ?auto_32522 ) ) ( not ( = ?auto_32512 ?auto_32516 ) ) ( not ( = ?auto_32513 ?auto_32516 ) ) ( not ( = ?auto_32511 ?auto_32516 ) ) ( not ( = ?auto_32524 ?auto_32516 ) ) ( not ( = ?auto_32514 ?auto_32516 ) ) ( not ( = ?auto_32523 ?auto_32516 ) ) ( AVAILABLE ?auto_32525 ) ( SURFACE-AT ?auto_32522 ?auto_32520 ) ( ON ?auto_32522 ?auto_32515 ) ( CLEAR ?auto_32522 ) ( not ( = ?auto_32512 ?auto_32515 ) ) ( not ( = ?auto_32513 ?auto_32515 ) ) ( not ( = ?auto_32511 ?auto_32515 ) ) ( not ( = ?auto_32524 ?auto_32515 ) ) ( not ( = ?auto_32514 ?auto_32515 ) ) ( not ( = ?auto_32522 ?auto_32515 ) ) ( not ( = ?auto_32523 ?auto_32515 ) ) ( not ( = ?auto_32516 ?auto_32515 ) ) ( SURFACE-AT ?auto_32529 ?auto_32518 ) ( CLEAR ?auto_32529 ) ( IS-CRATE ?auto_32516 ) ( not ( = ?auto_32529 ?auto_32516 ) ) ( not ( = ?auto_32512 ?auto_32529 ) ) ( not ( = ?auto_32513 ?auto_32529 ) ) ( not ( = ?auto_32511 ?auto_32529 ) ) ( not ( = ?auto_32524 ?auto_32529 ) ) ( not ( = ?auto_32514 ?auto_32529 ) ) ( not ( = ?auto_32522 ?auto_32529 ) ) ( not ( = ?auto_32523 ?auto_32529 ) ) ( not ( = ?auto_32515 ?auto_32529 ) ) ( AVAILABLE ?auto_32521 ) ( TRUCK-AT ?auto_32527 ?auto_32528 ) ( LIFTING ?auto_32517 ?auto_32516 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32512 ?auto_32513 )
      ( MAKE-2CRATE-VERIFY ?auto_32511 ?auto_32512 ?auto_32513 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32530 - SURFACE
      ?auto_32531 - SURFACE
      ?auto_32532 - SURFACE
      ?auto_32533 - SURFACE
    )
    :vars
    (
      ?auto_32544 - HOIST
      ?auto_32538 - PLACE
      ?auto_32548 - PLACE
      ?auto_32545 - HOIST
      ?auto_32540 - SURFACE
      ?auto_32546 - PLACE
      ?auto_32539 - HOIST
      ?auto_32547 - SURFACE
      ?auto_32543 - PLACE
      ?auto_32536 - HOIST
      ?auto_32541 - SURFACE
      ?auto_32537 - SURFACE
      ?auto_32534 - SURFACE
      ?auto_32542 - SURFACE
      ?auto_32535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32544 ?auto_32538 ) ( IS-CRATE ?auto_32533 ) ( not ( = ?auto_32532 ?auto_32533 ) ) ( not ( = ?auto_32531 ?auto_32532 ) ) ( not ( = ?auto_32531 ?auto_32533 ) ) ( not ( = ?auto_32548 ?auto_32538 ) ) ( HOIST-AT ?auto_32545 ?auto_32548 ) ( not ( = ?auto_32544 ?auto_32545 ) ) ( AVAILABLE ?auto_32545 ) ( SURFACE-AT ?auto_32533 ?auto_32548 ) ( ON ?auto_32533 ?auto_32540 ) ( CLEAR ?auto_32533 ) ( not ( = ?auto_32532 ?auto_32540 ) ) ( not ( = ?auto_32533 ?auto_32540 ) ) ( not ( = ?auto_32531 ?auto_32540 ) ) ( IS-CRATE ?auto_32532 ) ( not ( = ?auto_32546 ?auto_32538 ) ) ( not ( = ?auto_32548 ?auto_32546 ) ) ( HOIST-AT ?auto_32539 ?auto_32546 ) ( not ( = ?auto_32544 ?auto_32539 ) ) ( not ( = ?auto_32545 ?auto_32539 ) ) ( SURFACE-AT ?auto_32532 ?auto_32546 ) ( ON ?auto_32532 ?auto_32547 ) ( CLEAR ?auto_32532 ) ( not ( = ?auto_32532 ?auto_32547 ) ) ( not ( = ?auto_32533 ?auto_32547 ) ) ( not ( = ?auto_32531 ?auto_32547 ) ) ( not ( = ?auto_32540 ?auto_32547 ) ) ( IS-CRATE ?auto_32531 ) ( not ( = ?auto_32530 ?auto_32531 ) ) ( not ( = ?auto_32532 ?auto_32530 ) ) ( not ( = ?auto_32533 ?auto_32530 ) ) ( not ( = ?auto_32540 ?auto_32530 ) ) ( not ( = ?auto_32547 ?auto_32530 ) ) ( not ( = ?auto_32543 ?auto_32538 ) ) ( not ( = ?auto_32548 ?auto_32543 ) ) ( not ( = ?auto_32546 ?auto_32543 ) ) ( HOIST-AT ?auto_32536 ?auto_32543 ) ( not ( = ?auto_32544 ?auto_32536 ) ) ( not ( = ?auto_32545 ?auto_32536 ) ) ( not ( = ?auto_32539 ?auto_32536 ) ) ( SURFACE-AT ?auto_32531 ?auto_32543 ) ( ON ?auto_32531 ?auto_32541 ) ( CLEAR ?auto_32531 ) ( not ( = ?auto_32532 ?auto_32541 ) ) ( not ( = ?auto_32533 ?auto_32541 ) ) ( not ( = ?auto_32531 ?auto_32541 ) ) ( not ( = ?auto_32540 ?auto_32541 ) ) ( not ( = ?auto_32547 ?auto_32541 ) ) ( not ( = ?auto_32530 ?auto_32541 ) ) ( IS-CRATE ?auto_32530 ) ( not ( = ?auto_32537 ?auto_32530 ) ) ( not ( = ?auto_32532 ?auto_32537 ) ) ( not ( = ?auto_32533 ?auto_32537 ) ) ( not ( = ?auto_32531 ?auto_32537 ) ) ( not ( = ?auto_32540 ?auto_32537 ) ) ( not ( = ?auto_32547 ?auto_32537 ) ) ( not ( = ?auto_32541 ?auto_32537 ) ) ( AVAILABLE ?auto_32536 ) ( SURFACE-AT ?auto_32530 ?auto_32543 ) ( ON ?auto_32530 ?auto_32534 ) ( CLEAR ?auto_32530 ) ( not ( = ?auto_32532 ?auto_32534 ) ) ( not ( = ?auto_32533 ?auto_32534 ) ) ( not ( = ?auto_32531 ?auto_32534 ) ) ( not ( = ?auto_32540 ?auto_32534 ) ) ( not ( = ?auto_32547 ?auto_32534 ) ) ( not ( = ?auto_32530 ?auto_32534 ) ) ( not ( = ?auto_32541 ?auto_32534 ) ) ( not ( = ?auto_32537 ?auto_32534 ) ) ( SURFACE-AT ?auto_32542 ?auto_32538 ) ( CLEAR ?auto_32542 ) ( IS-CRATE ?auto_32537 ) ( not ( = ?auto_32542 ?auto_32537 ) ) ( not ( = ?auto_32532 ?auto_32542 ) ) ( not ( = ?auto_32533 ?auto_32542 ) ) ( not ( = ?auto_32531 ?auto_32542 ) ) ( not ( = ?auto_32540 ?auto_32542 ) ) ( not ( = ?auto_32547 ?auto_32542 ) ) ( not ( = ?auto_32530 ?auto_32542 ) ) ( not ( = ?auto_32541 ?auto_32542 ) ) ( not ( = ?auto_32534 ?auto_32542 ) ) ( AVAILABLE ?auto_32544 ) ( TRUCK-AT ?auto_32535 ?auto_32546 ) ( LIFTING ?auto_32539 ?auto_32537 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32531 ?auto_32532 ?auto_32533 )
      ( MAKE-3CRATE-VERIFY ?auto_32530 ?auto_32531 ?auto_32532 ?auto_32533 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32549 - SURFACE
      ?auto_32550 - SURFACE
      ?auto_32551 - SURFACE
      ?auto_32552 - SURFACE
      ?auto_32553 - SURFACE
    )
    :vars
    (
      ?auto_32563 - HOIST
      ?auto_32557 - PLACE
      ?auto_32567 - PLACE
      ?auto_32564 - HOIST
      ?auto_32559 - SURFACE
      ?auto_32565 - PLACE
      ?auto_32558 - HOIST
      ?auto_32566 - SURFACE
      ?auto_32562 - PLACE
      ?auto_32556 - HOIST
      ?auto_32560 - SURFACE
      ?auto_32554 - SURFACE
      ?auto_32561 - SURFACE
      ?auto_32555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32563 ?auto_32557 ) ( IS-CRATE ?auto_32553 ) ( not ( = ?auto_32552 ?auto_32553 ) ) ( not ( = ?auto_32551 ?auto_32552 ) ) ( not ( = ?auto_32551 ?auto_32553 ) ) ( not ( = ?auto_32567 ?auto_32557 ) ) ( HOIST-AT ?auto_32564 ?auto_32567 ) ( not ( = ?auto_32563 ?auto_32564 ) ) ( AVAILABLE ?auto_32564 ) ( SURFACE-AT ?auto_32553 ?auto_32567 ) ( ON ?auto_32553 ?auto_32559 ) ( CLEAR ?auto_32553 ) ( not ( = ?auto_32552 ?auto_32559 ) ) ( not ( = ?auto_32553 ?auto_32559 ) ) ( not ( = ?auto_32551 ?auto_32559 ) ) ( IS-CRATE ?auto_32552 ) ( not ( = ?auto_32565 ?auto_32557 ) ) ( not ( = ?auto_32567 ?auto_32565 ) ) ( HOIST-AT ?auto_32558 ?auto_32565 ) ( not ( = ?auto_32563 ?auto_32558 ) ) ( not ( = ?auto_32564 ?auto_32558 ) ) ( SURFACE-AT ?auto_32552 ?auto_32565 ) ( ON ?auto_32552 ?auto_32566 ) ( CLEAR ?auto_32552 ) ( not ( = ?auto_32552 ?auto_32566 ) ) ( not ( = ?auto_32553 ?auto_32566 ) ) ( not ( = ?auto_32551 ?auto_32566 ) ) ( not ( = ?auto_32559 ?auto_32566 ) ) ( IS-CRATE ?auto_32551 ) ( not ( = ?auto_32550 ?auto_32551 ) ) ( not ( = ?auto_32552 ?auto_32550 ) ) ( not ( = ?auto_32553 ?auto_32550 ) ) ( not ( = ?auto_32559 ?auto_32550 ) ) ( not ( = ?auto_32566 ?auto_32550 ) ) ( not ( = ?auto_32562 ?auto_32557 ) ) ( not ( = ?auto_32567 ?auto_32562 ) ) ( not ( = ?auto_32565 ?auto_32562 ) ) ( HOIST-AT ?auto_32556 ?auto_32562 ) ( not ( = ?auto_32563 ?auto_32556 ) ) ( not ( = ?auto_32564 ?auto_32556 ) ) ( not ( = ?auto_32558 ?auto_32556 ) ) ( SURFACE-AT ?auto_32551 ?auto_32562 ) ( ON ?auto_32551 ?auto_32560 ) ( CLEAR ?auto_32551 ) ( not ( = ?auto_32552 ?auto_32560 ) ) ( not ( = ?auto_32553 ?auto_32560 ) ) ( not ( = ?auto_32551 ?auto_32560 ) ) ( not ( = ?auto_32559 ?auto_32560 ) ) ( not ( = ?auto_32566 ?auto_32560 ) ) ( not ( = ?auto_32550 ?auto_32560 ) ) ( IS-CRATE ?auto_32550 ) ( not ( = ?auto_32549 ?auto_32550 ) ) ( not ( = ?auto_32552 ?auto_32549 ) ) ( not ( = ?auto_32553 ?auto_32549 ) ) ( not ( = ?auto_32551 ?auto_32549 ) ) ( not ( = ?auto_32559 ?auto_32549 ) ) ( not ( = ?auto_32566 ?auto_32549 ) ) ( not ( = ?auto_32560 ?auto_32549 ) ) ( AVAILABLE ?auto_32556 ) ( SURFACE-AT ?auto_32550 ?auto_32562 ) ( ON ?auto_32550 ?auto_32554 ) ( CLEAR ?auto_32550 ) ( not ( = ?auto_32552 ?auto_32554 ) ) ( not ( = ?auto_32553 ?auto_32554 ) ) ( not ( = ?auto_32551 ?auto_32554 ) ) ( not ( = ?auto_32559 ?auto_32554 ) ) ( not ( = ?auto_32566 ?auto_32554 ) ) ( not ( = ?auto_32550 ?auto_32554 ) ) ( not ( = ?auto_32560 ?auto_32554 ) ) ( not ( = ?auto_32549 ?auto_32554 ) ) ( SURFACE-AT ?auto_32561 ?auto_32557 ) ( CLEAR ?auto_32561 ) ( IS-CRATE ?auto_32549 ) ( not ( = ?auto_32561 ?auto_32549 ) ) ( not ( = ?auto_32552 ?auto_32561 ) ) ( not ( = ?auto_32553 ?auto_32561 ) ) ( not ( = ?auto_32551 ?auto_32561 ) ) ( not ( = ?auto_32559 ?auto_32561 ) ) ( not ( = ?auto_32566 ?auto_32561 ) ) ( not ( = ?auto_32550 ?auto_32561 ) ) ( not ( = ?auto_32560 ?auto_32561 ) ) ( not ( = ?auto_32554 ?auto_32561 ) ) ( AVAILABLE ?auto_32563 ) ( TRUCK-AT ?auto_32555 ?auto_32565 ) ( LIFTING ?auto_32558 ?auto_32549 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32551 ?auto_32552 ?auto_32553 )
      ( MAKE-4CRATE-VERIFY ?auto_32549 ?auto_32550 ?auto_32551 ?auto_32552 ?auto_32553 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_32568 - SURFACE
      ?auto_32569 - SURFACE
      ?auto_32570 - SURFACE
      ?auto_32571 - SURFACE
      ?auto_32572 - SURFACE
      ?auto_32573 - SURFACE
    )
    :vars
    (
      ?auto_32582 - HOIST
      ?auto_32577 - PLACE
      ?auto_32586 - PLACE
      ?auto_32583 - HOIST
      ?auto_32579 - SURFACE
      ?auto_32584 - PLACE
      ?auto_32578 - HOIST
      ?auto_32585 - SURFACE
      ?auto_32581 - PLACE
      ?auto_32576 - HOIST
      ?auto_32580 - SURFACE
      ?auto_32574 - SURFACE
      ?auto_32575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32582 ?auto_32577 ) ( IS-CRATE ?auto_32573 ) ( not ( = ?auto_32572 ?auto_32573 ) ) ( not ( = ?auto_32571 ?auto_32572 ) ) ( not ( = ?auto_32571 ?auto_32573 ) ) ( not ( = ?auto_32586 ?auto_32577 ) ) ( HOIST-AT ?auto_32583 ?auto_32586 ) ( not ( = ?auto_32582 ?auto_32583 ) ) ( AVAILABLE ?auto_32583 ) ( SURFACE-AT ?auto_32573 ?auto_32586 ) ( ON ?auto_32573 ?auto_32579 ) ( CLEAR ?auto_32573 ) ( not ( = ?auto_32572 ?auto_32579 ) ) ( not ( = ?auto_32573 ?auto_32579 ) ) ( not ( = ?auto_32571 ?auto_32579 ) ) ( IS-CRATE ?auto_32572 ) ( not ( = ?auto_32584 ?auto_32577 ) ) ( not ( = ?auto_32586 ?auto_32584 ) ) ( HOIST-AT ?auto_32578 ?auto_32584 ) ( not ( = ?auto_32582 ?auto_32578 ) ) ( not ( = ?auto_32583 ?auto_32578 ) ) ( SURFACE-AT ?auto_32572 ?auto_32584 ) ( ON ?auto_32572 ?auto_32585 ) ( CLEAR ?auto_32572 ) ( not ( = ?auto_32572 ?auto_32585 ) ) ( not ( = ?auto_32573 ?auto_32585 ) ) ( not ( = ?auto_32571 ?auto_32585 ) ) ( not ( = ?auto_32579 ?auto_32585 ) ) ( IS-CRATE ?auto_32571 ) ( not ( = ?auto_32570 ?auto_32571 ) ) ( not ( = ?auto_32572 ?auto_32570 ) ) ( not ( = ?auto_32573 ?auto_32570 ) ) ( not ( = ?auto_32579 ?auto_32570 ) ) ( not ( = ?auto_32585 ?auto_32570 ) ) ( not ( = ?auto_32581 ?auto_32577 ) ) ( not ( = ?auto_32586 ?auto_32581 ) ) ( not ( = ?auto_32584 ?auto_32581 ) ) ( HOIST-AT ?auto_32576 ?auto_32581 ) ( not ( = ?auto_32582 ?auto_32576 ) ) ( not ( = ?auto_32583 ?auto_32576 ) ) ( not ( = ?auto_32578 ?auto_32576 ) ) ( SURFACE-AT ?auto_32571 ?auto_32581 ) ( ON ?auto_32571 ?auto_32580 ) ( CLEAR ?auto_32571 ) ( not ( = ?auto_32572 ?auto_32580 ) ) ( not ( = ?auto_32573 ?auto_32580 ) ) ( not ( = ?auto_32571 ?auto_32580 ) ) ( not ( = ?auto_32579 ?auto_32580 ) ) ( not ( = ?auto_32585 ?auto_32580 ) ) ( not ( = ?auto_32570 ?auto_32580 ) ) ( IS-CRATE ?auto_32570 ) ( not ( = ?auto_32569 ?auto_32570 ) ) ( not ( = ?auto_32572 ?auto_32569 ) ) ( not ( = ?auto_32573 ?auto_32569 ) ) ( not ( = ?auto_32571 ?auto_32569 ) ) ( not ( = ?auto_32579 ?auto_32569 ) ) ( not ( = ?auto_32585 ?auto_32569 ) ) ( not ( = ?auto_32580 ?auto_32569 ) ) ( AVAILABLE ?auto_32576 ) ( SURFACE-AT ?auto_32570 ?auto_32581 ) ( ON ?auto_32570 ?auto_32574 ) ( CLEAR ?auto_32570 ) ( not ( = ?auto_32572 ?auto_32574 ) ) ( not ( = ?auto_32573 ?auto_32574 ) ) ( not ( = ?auto_32571 ?auto_32574 ) ) ( not ( = ?auto_32579 ?auto_32574 ) ) ( not ( = ?auto_32585 ?auto_32574 ) ) ( not ( = ?auto_32570 ?auto_32574 ) ) ( not ( = ?auto_32580 ?auto_32574 ) ) ( not ( = ?auto_32569 ?auto_32574 ) ) ( SURFACE-AT ?auto_32568 ?auto_32577 ) ( CLEAR ?auto_32568 ) ( IS-CRATE ?auto_32569 ) ( not ( = ?auto_32568 ?auto_32569 ) ) ( not ( = ?auto_32572 ?auto_32568 ) ) ( not ( = ?auto_32573 ?auto_32568 ) ) ( not ( = ?auto_32571 ?auto_32568 ) ) ( not ( = ?auto_32579 ?auto_32568 ) ) ( not ( = ?auto_32585 ?auto_32568 ) ) ( not ( = ?auto_32570 ?auto_32568 ) ) ( not ( = ?auto_32580 ?auto_32568 ) ) ( not ( = ?auto_32574 ?auto_32568 ) ) ( AVAILABLE ?auto_32582 ) ( TRUCK-AT ?auto_32575 ?auto_32584 ) ( LIFTING ?auto_32578 ?auto_32569 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32571 ?auto_32572 ?auto_32573 )
      ( MAKE-5CRATE-VERIFY ?auto_32568 ?auto_32569 ?auto_32570 ?auto_32571 ?auto_32572 ?auto_32573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32587 - SURFACE
      ?auto_32588 - SURFACE
    )
    :vars
    (
      ?auto_32600 - HOIST
      ?auto_32593 - PLACE
      ?auto_32602 - SURFACE
      ?auto_32605 - PLACE
      ?auto_32601 - HOIST
      ?auto_32595 - SURFACE
      ?auto_32603 - PLACE
      ?auto_32594 - HOIST
      ?auto_32604 - SURFACE
      ?auto_32596 - SURFACE
      ?auto_32599 - PLACE
      ?auto_32591 - HOIST
      ?auto_32597 - SURFACE
      ?auto_32592 - SURFACE
      ?auto_32589 - SURFACE
      ?auto_32598 - SURFACE
      ?auto_32590 - TRUCK
      ?auto_32606 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32600 ?auto_32593 ) ( IS-CRATE ?auto_32588 ) ( not ( = ?auto_32587 ?auto_32588 ) ) ( not ( = ?auto_32602 ?auto_32587 ) ) ( not ( = ?auto_32602 ?auto_32588 ) ) ( not ( = ?auto_32605 ?auto_32593 ) ) ( HOIST-AT ?auto_32601 ?auto_32605 ) ( not ( = ?auto_32600 ?auto_32601 ) ) ( AVAILABLE ?auto_32601 ) ( SURFACE-AT ?auto_32588 ?auto_32605 ) ( ON ?auto_32588 ?auto_32595 ) ( CLEAR ?auto_32588 ) ( not ( = ?auto_32587 ?auto_32595 ) ) ( not ( = ?auto_32588 ?auto_32595 ) ) ( not ( = ?auto_32602 ?auto_32595 ) ) ( IS-CRATE ?auto_32587 ) ( not ( = ?auto_32603 ?auto_32593 ) ) ( not ( = ?auto_32605 ?auto_32603 ) ) ( HOIST-AT ?auto_32594 ?auto_32603 ) ( not ( = ?auto_32600 ?auto_32594 ) ) ( not ( = ?auto_32601 ?auto_32594 ) ) ( SURFACE-AT ?auto_32587 ?auto_32603 ) ( ON ?auto_32587 ?auto_32604 ) ( CLEAR ?auto_32587 ) ( not ( = ?auto_32587 ?auto_32604 ) ) ( not ( = ?auto_32588 ?auto_32604 ) ) ( not ( = ?auto_32602 ?auto_32604 ) ) ( not ( = ?auto_32595 ?auto_32604 ) ) ( IS-CRATE ?auto_32602 ) ( not ( = ?auto_32596 ?auto_32602 ) ) ( not ( = ?auto_32587 ?auto_32596 ) ) ( not ( = ?auto_32588 ?auto_32596 ) ) ( not ( = ?auto_32595 ?auto_32596 ) ) ( not ( = ?auto_32604 ?auto_32596 ) ) ( not ( = ?auto_32599 ?auto_32593 ) ) ( not ( = ?auto_32605 ?auto_32599 ) ) ( not ( = ?auto_32603 ?auto_32599 ) ) ( HOIST-AT ?auto_32591 ?auto_32599 ) ( not ( = ?auto_32600 ?auto_32591 ) ) ( not ( = ?auto_32601 ?auto_32591 ) ) ( not ( = ?auto_32594 ?auto_32591 ) ) ( SURFACE-AT ?auto_32602 ?auto_32599 ) ( ON ?auto_32602 ?auto_32597 ) ( CLEAR ?auto_32602 ) ( not ( = ?auto_32587 ?auto_32597 ) ) ( not ( = ?auto_32588 ?auto_32597 ) ) ( not ( = ?auto_32602 ?auto_32597 ) ) ( not ( = ?auto_32595 ?auto_32597 ) ) ( not ( = ?auto_32604 ?auto_32597 ) ) ( not ( = ?auto_32596 ?auto_32597 ) ) ( IS-CRATE ?auto_32596 ) ( not ( = ?auto_32592 ?auto_32596 ) ) ( not ( = ?auto_32587 ?auto_32592 ) ) ( not ( = ?auto_32588 ?auto_32592 ) ) ( not ( = ?auto_32602 ?auto_32592 ) ) ( not ( = ?auto_32595 ?auto_32592 ) ) ( not ( = ?auto_32604 ?auto_32592 ) ) ( not ( = ?auto_32597 ?auto_32592 ) ) ( AVAILABLE ?auto_32591 ) ( SURFACE-AT ?auto_32596 ?auto_32599 ) ( ON ?auto_32596 ?auto_32589 ) ( CLEAR ?auto_32596 ) ( not ( = ?auto_32587 ?auto_32589 ) ) ( not ( = ?auto_32588 ?auto_32589 ) ) ( not ( = ?auto_32602 ?auto_32589 ) ) ( not ( = ?auto_32595 ?auto_32589 ) ) ( not ( = ?auto_32604 ?auto_32589 ) ) ( not ( = ?auto_32596 ?auto_32589 ) ) ( not ( = ?auto_32597 ?auto_32589 ) ) ( not ( = ?auto_32592 ?auto_32589 ) ) ( SURFACE-AT ?auto_32598 ?auto_32593 ) ( CLEAR ?auto_32598 ) ( IS-CRATE ?auto_32592 ) ( not ( = ?auto_32598 ?auto_32592 ) ) ( not ( = ?auto_32587 ?auto_32598 ) ) ( not ( = ?auto_32588 ?auto_32598 ) ) ( not ( = ?auto_32602 ?auto_32598 ) ) ( not ( = ?auto_32595 ?auto_32598 ) ) ( not ( = ?auto_32604 ?auto_32598 ) ) ( not ( = ?auto_32596 ?auto_32598 ) ) ( not ( = ?auto_32597 ?auto_32598 ) ) ( not ( = ?auto_32589 ?auto_32598 ) ) ( AVAILABLE ?auto_32600 ) ( TRUCK-AT ?auto_32590 ?auto_32603 ) ( AVAILABLE ?auto_32594 ) ( SURFACE-AT ?auto_32592 ?auto_32603 ) ( ON ?auto_32592 ?auto_32606 ) ( CLEAR ?auto_32592 ) ( not ( = ?auto_32587 ?auto_32606 ) ) ( not ( = ?auto_32588 ?auto_32606 ) ) ( not ( = ?auto_32602 ?auto_32606 ) ) ( not ( = ?auto_32595 ?auto_32606 ) ) ( not ( = ?auto_32604 ?auto_32606 ) ) ( not ( = ?auto_32596 ?auto_32606 ) ) ( not ( = ?auto_32597 ?auto_32606 ) ) ( not ( = ?auto_32592 ?auto_32606 ) ) ( not ( = ?auto_32589 ?auto_32606 ) ) ( not ( = ?auto_32598 ?auto_32606 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32594 ?auto_32592 ?auto_32606 ?auto_32603 )
      ( MAKE-2CRATE ?auto_32602 ?auto_32587 ?auto_32588 )
      ( MAKE-1CRATE-VERIFY ?auto_32587 ?auto_32588 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32607 - SURFACE
      ?auto_32608 - SURFACE
      ?auto_32609 - SURFACE
    )
    :vars
    (
      ?auto_32621 - HOIST
      ?auto_32620 - PLACE
      ?auto_32616 - PLACE
      ?auto_32613 - HOIST
      ?auto_32619 - SURFACE
      ?auto_32615 - PLACE
      ?auto_32610 - HOIST
      ?auto_32624 - SURFACE
      ?auto_32617 - SURFACE
      ?auto_32614 - PLACE
      ?auto_32623 - HOIST
      ?auto_32612 - SURFACE
      ?auto_32611 - SURFACE
      ?auto_32625 - SURFACE
      ?auto_32622 - SURFACE
      ?auto_32618 - TRUCK
      ?auto_32626 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32621 ?auto_32620 ) ( IS-CRATE ?auto_32609 ) ( not ( = ?auto_32608 ?auto_32609 ) ) ( not ( = ?auto_32607 ?auto_32608 ) ) ( not ( = ?auto_32607 ?auto_32609 ) ) ( not ( = ?auto_32616 ?auto_32620 ) ) ( HOIST-AT ?auto_32613 ?auto_32616 ) ( not ( = ?auto_32621 ?auto_32613 ) ) ( AVAILABLE ?auto_32613 ) ( SURFACE-AT ?auto_32609 ?auto_32616 ) ( ON ?auto_32609 ?auto_32619 ) ( CLEAR ?auto_32609 ) ( not ( = ?auto_32608 ?auto_32619 ) ) ( not ( = ?auto_32609 ?auto_32619 ) ) ( not ( = ?auto_32607 ?auto_32619 ) ) ( IS-CRATE ?auto_32608 ) ( not ( = ?auto_32615 ?auto_32620 ) ) ( not ( = ?auto_32616 ?auto_32615 ) ) ( HOIST-AT ?auto_32610 ?auto_32615 ) ( not ( = ?auto_32621 ?auto_32610 ) ) ( not ( = ?auto_32613 ?auto_32610 ) ) ( SURFACE-AT ?auto_32608 ?auto_32615 ) ( ON ?auto_32608 ?auto_32624 ) ( CLEAR ?auto_32608 ) ( not ( = ?auto_32608 ?auto_32624 ) ) ( not ( = ?auto_32609 ?auto_32624 ) ) ( not ( = ?auto_32607 ?auto_32624 ) ) ( not ( = ?auto_32619 ?auto_32624 ) ) ( IS-CRATE ?auto_32607 ) ( not ( = ?auto_32617 ?auto_32607 ) ) ( not ( = ?auto_32608 ?auto_32617 ) ) ( not ( = ?auto_32609 ?auto_32617 ) ) ( not ( = ?auto_32619 ?auto_32617 ) ) ( not ( = ?auto_32624 ?auto_32617 ) ) ( not ( = ?auto_32614 ?auto_32620 ) ) ( not ( = ?auto_32616 ?auto_32614 ) ) ( not ( = ?auto_32615 ?auto_32614 ) ) ( HOIST-AT ?auto_32623 ?auto_32614 ) ( not ( = ?auto_32621 ?auto_32623 ) ) ( not ( = ?auto_32613 ?auto_32623 ) ) ( not ( = ?auto_32610 ?auto_32623 ) ) ( SURFACE-AT ?auto_32607 ?auto_32614 ) ( ON ?auto_32607 ?auto_32612 ) ( CLEAR ?auto_32607 ) ( not ( = ?auto_32608 ?auto_32612 ) ) ( not ( = ?auto_32609 ?auto_32612 ) ) ( not ( = ?auto_32607 ?auto_32612 ) ) ( not ( = ?auto_32619 ?auto_32612 ) ) ( not ( = ?auto_32624 ?auto_32612 ) ) ( not ( = ?auto_32617 ?auto_32612 ) ) ( IS-CRATE ?auto_32617 ) ( not ( = ?auto_32611 ?auto_32617 ) ) ( not ( = ?auto_32608 ?auto_32611 ) ) ( not ( = ?auto_32609 ?auto_32611 ) ) ( not ( = ?auto_32607 ?auto_32611 ) ) ( not ( = ?auto_32619 ?auto_32611 ) ) ( not ( = ?auto_32624 ?auto_32611 ) ) ( not ( = ?auto_32612 ?auto_32611 ) ) ( AVAILABLE ?auto_32623 ) ( SURFACE-AT ?auto_32617 ?auto_32614 ) ( ON ?auto_32617 ?auto_32625 ) ( CLEAR ?auto_32617 ) ( not ( = ?auto_32608 ?auto_32625 ) ) ( not ( = ?auto_32609 ?auto_32625 ) ) ( not ( = ?auto_32607 ?auto_32625 ) ) ( not ( = ?auto_32619 ?auto_32625 ) ) ( not ( = ?auto_32624 ?auto_32625 ) ) ( not ( = ?auto_32617 ?auto_32625 ) ) ( not ( = ?auto_32612 ?auto_32625 ) ) ( not ( = ?auto_32611 ?auto_32625 ) ) ( SURFACE-AT ?auto_32622 ?auto_32620 ) ( CLEAR ?auto_32622 ) ( IS-CRATE ?auto_32611 ) ( not ( = ?auto_32622 ?auto_32611 ) ) ( not ( = ?auto_32608 ?auto_32622 ) ) ( not ( = ?auto_32609 ?auto_32622 ) ) ( not ( = ?auto_32607 ?auto_32622 ) ) ( not ( = ?auto_32619 ?auto_32622 ) ) ( not ( = ?auto_32624 ?auto_32622 ) ) ( not ( = ?auto_32617 ?auto_32622 ) ) ( not ( = ?auto_32612 ?auto_32622 ) ) ( not ( = ?auto_32625 ?auto_32622 ) ) ( AVAILABLE ?auto_32621 ) ( TRUCK-AT ?auto_32618 ?auto_32615 ) ( AVAILABLE ?auto_32610 ) ( SURFACE-AT ?auto_32611 ?auto_32615 ) ( ON ?auto_32611 ?auto_32626 ) ( CLEAR ?auto_32611 ) ( not ( = ?auto_32608 ?auto_32626 ) ) ( not ( = ?auto_32609 ?auto_32626 ) ) ( not ( = ?auto_32607 ?auto_32626 ) ) ( not ( = ?auto_32619 ?auto_32626 ) ) ( not ( = ?auto_32624 ?auto_32626 ) ) ( not ( = ?auto_32617 ?auto_32626 ) ) ( not ( = ?auto_32612 ?auto_32626 ) ) ( not ( = ?auto_32611 ?auto_32626 ) ) ( not ( = ?auto_32625 ?auto_32626 ) ) ( not ( = ?auto_32622 ?auto_32626 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32608 ?auto_32609 )
      ( MAKE-2CRATE-VERIFY ?auto_32607 ?auto_32608 ?auto_32609 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32627 - SURFACE
      ?auto_32628 - SURFACE
      ?auto_32629 - SURFACE
      ?auto_32630 - SURFACE
    )
    :vars
    (
      ?auto_32642 - HOIST
      ?auto_32638 - PLACE
      ?auto_32643 - PLACE
      ?auto_32644 - HOIST
      ?auto_32646 - SURFACE
      ?auto_32636 - PLACE
      ?auto_32632 - HOIST
      ?auto_32645 - SURFACE
      ?auto_32633 - PLACE
      ?auto_32641 - HOIST
      ?auto_32635 - SURFACE
      ?auto_32639 - SURFACE
      ?auto_32637 - SURFACE
      ?auto_32634 - SURFACE
      ?auto_32631 - TRUCK
      ?auto_32640 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32642 ?auto_32638 ) ( IS-CRATE ?auto_32630 ) ( not ( = ?auto_32629 ?auto_32630 ) ) ( not ( = ?auto_32628 ?auto_32629 ) ) ( not ( = ?auto_32628 ?auto_32630 ) ) ( not ( = ?auto_32643 ?auto_32638 ) ) ( HOIST-AT ?auto_32644 ?auto_32643 ) ( not ( = ?auto_32642 ?auto_32644 ) ) ( AVAILABLE ?auto_32644 ) ( SURFACE-AT ?auto_32630 ?auto_32643 ) ( ON ?auto_32630 ?auto_32646 ) ( CLEAR ?auto_32630 ) ( not ( = ?auto_32629 ?auto_32646 ) ) ( not ( = ?auto_32630 ?auto_32646 ) ) ( not ( = ?auto_32628 ?auto_32646 ) ) ( IS-CRATE ?auto_32629 ) ( not ( = ?auto_32636 ?auto_32638 ) ) ( not ( = ?auto_32643 ?auto_32636 ) ) ( HOIST-AT ?auto_32632 ?auto_32636 ) ( not ( = ?auto_32642 ?auto_32632 ) ) ( not ( = ?auto_32644 ?auto_32632 ) ) ( SURFACE-AT ?auto_32629 ?auto_32636 ) ( ON ?auto_32629 ?auto_32645 ) ( CLEAR ?auto_32629 ) ( not ( = ?auto_32629 ?auto_32645 ) ) ( not ( = ?auto_32630 ?auto_32645 ) ) ( not ( = ?auto_32628 ?auto_32645 ) ) ( not ( = ?auto_32646 ?auto_32645 ) ) ( IS-CRATE ?auto_32628 ) ( not ( = ?auto_32627 ?auto_32628 ) ) ( not ( = ?auto_32629 ?auto_32627 ) ) ( not ( = ?auto_32630 ?auto_32627 ) ) ( not ( = ?auto_32646 ?auto_32627 ) ) ( not ( = ?auto_32645 ?auto_32627 ) ) ( not ( = ?auto_32633 ?auto_32638 ) ) ( not ( = ?auto_32643 ?auto_32633 ) ) ( not ( = ?auto_32636 ?auto_32633 ) ) ( HOIST-AT ?auto_32641 ?auto_32633 ) ( not ( = ?auto_32642 ?auto_32641 ) ) ( not ( = ?auto_32644 ?auto_32641 ) ) ( not ( = ?auto_32632 ?auto_32641 ) ) ( SURFACE-AT ?auto_32628 ?auto_32633 ) ( ON ?auto_32628 ?auto_32635 ) ( CLEAR ?auto_32628 ) ( not ( = ?auto_32629 ?auto_32635 ) ) ( not ( = ?auto_32630 ?auto_32635 ) ) ( not ( = ?auto_32628 ?auto_32635 ) ) ( not ( = ?auto_32646 ?auto_32635 ) ) ( not ( = ?auto_32645 ?auto_32635 ) ) ( not ( = ?auto_32627 ?auto_32635 ) ) ( IS-CRATE ?auto_32627 ) ( not ( = ?auto_32639 ?auto_32627 ) ) ( not ( = ?auto_32629 ?auto_32639 ) ) ( not ( = ?auto_32630 ?auto_32639 ) ) ( not ( = ?auto_32628 ?auto_32639 ) ) ( not ( = ?auto_32646 ?auto_32639 ) ) ( not ( = ?auto_32645 ?auto_32639 ) ) ( not ( = ?auto_32635 ?auto_32639 ) ) ( AVAILABLE ?auto_32641 ) ( SURFACE-AT ?auto_32627 ?auto_32633 ) ( ON ?auto_32627 ?auto_32637 ) ( CLEAR ?auto_32627 ) ( not ( = ?auto_32629 ?auto_32637 ) ) ( not ( = ?auto_32630 ?auto_32637 ) ) ( not ( = ?auto_32628 ?auto_32637 ) ) ( not ( = ?auto_32646 ?auto_32637 ) ) ( not ( = ?auto_32645 ?auto_32637 ) ) ( not ( = ?auto_32627 ?auto_32637 ) ) ( not ( = ?auto_32635 ?auto_32637 ) ) ( not ( = ?auto_32639 ?auto_32637 ) ) ( SURFACE-AT ?auto_32634 ?auto_32638 ) ( CLEAR ?auto_32634 ) ( IS-CRATE ?auto_32639 ) ( not ( = ?auto_32634 ?auto_32639 ) ) ( not ( = ?auto_32629 ?auto_32634 ) ) ( not ( = ?auto_32630 ?auto_32634 ) ) ( not ( = ?auto_32628 ?auto_32634 ) ) ( not ( = ?auto_32646 ?auto_32634 ) ) ( not ( = ?auto_32645 ?auto_32634 ) ) ( not ( = ?auto_32627 ?auto_32634 ) ) ( not ( = ?auto_32635 ?auto_32634 ) ) ( not ( = ?auto_32637 ?auto_32634 ) ) ( AVAILABLE ?auto_32642 ) ( TRUCK-AT ?auto_32631 ?auto_32636 ) ( AVAILABLE ?auto_32632 ) ( SURFACE-AT ?auto_32639 ?auto_32636 ) ( ON ?auto_32639 ?auto_32640 ) ( CLEAR ?auto_32639 ) ( not ( = ?auto_32629 ?auto_32640 ) ) ( not ( = ?auto_32630 ?auto_32640 ) ) ( not ( = ?auto_32628 ?auto_32640 ) ) ( not ( = ?auto_32646 ?auto_32640 ) ) ( not ( = ?auto_32645 ?auto_32640 ) ) ( not ( = ?auto_32627 ?auto_32640 ) ) ( not ( = ?auto_32635 ?auto_32640 ) ) ( not ( = ?auto_32639 ?auto_32640 ) ) ( not ( = ?auto_32637 ?auto_32640 ) ) ( not ( = ?auto_32634 ?auto_32640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32628 ?auto_32629 ?auto_32630 )
      ( MAKE-3CRATE-VERIFY ?auto_32627 ?auto_32628 ?auto_32629 ?auto_32630 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32647 - SURFACE
      ?auto_32648 - SURFACE
      ?auto_32649 - SURFACE
      ?auto_32650 - SURFACE
      ?auto_32651 - SURFACE
    )
    :vars
    (
      ?auto_32662 - HOIST
      ?auto_32659 - PLACE
      ?auto_32663 - PLACE
      ?auto_32664 - HOIST
      ?auto_32666 - SURFACE
      ?auto_32657 - PLACE
      ?auto_32653 - HOIST
      ?auto_32665 - SURFACE
      ?auto_32654 - PLACE
      ?auto_32661 - HOIST
      ?auto_32656 - SURFACE
      ?auto_32658 - SURFACE
      ?auto_32655 - SURFACE
      ?auto_32652 - TRUCK
      ?auto_32660 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32662 ?auto_32659 ) ( IS-CRATE ?auto_32651 ) ( not ( = ?auto_32650 ?auto_32651 ) ) ( not ( = ?auto_32649 ?auto_32650 ) ) ( not ( = ?auto_32649 ?auto_32651 ) ) ( not ( = ?auto_32663 ?auto_32659 ) ) ( HOIST-AT ?auto_32664 ?auto_32663 ) ( not ( = ?auto_32662 ?auto_32664 ) ) ( AVAILABLE ?auto_32664 ) ( SURFACE-AT ?auto_32651 ?auto_32663 ) ( ON ?auto_32651 ?auto_32666 ) ( CLEAR ?auto_32651 ) ( not ( = ?auto_32650 ?auto_32666 ) ) ( not ( = ?auto_32651 ?auto_32666 ) ) ( not ( = ?auto_32649 ?auto_32666 ) ) ( IS-CRATE ?auto_32650 ) ( not ( = ?auto_32657 ?auto_32659 ) ) ( not ( = ?auto_32663 ?auto_32657 ) ) ( HOIST-AT ?auto_32653 ?auto_32657 ) ( not ( = ?auto_32662 ?auto_32653 ) ) ( not ( = ?auto_32664 ?auto_32653 ) ) ( SURFACE-AT ?auto_32650 ?auto_32657 ) ( ON ?auto_32650 ?auto_32665 ) ( CLEAR ?auto_32650 ) ( not ( = ?auto_32650 ?auto_32665 ) ) ( not ( = ?auto_32651 ?auto_32665 ) ) ( not ( = ?auto_32649 ?auto_32665 ) ) ( not ( = ?auto_32666 ?auto_32665 ) ) ( IS-CRATE ?auto_32649 ) ( not ( = ?auto_32648 ?auto_32649 ) ) ( not ( = ?auto_32650 ?auto_32648 ) ) ( not ( = ?auto_32651 ?auto_32648 ) ) ( not ( = ?auto_32666 ?auto_32648 ) ) ( not ( = ?auto_32665 ?auto_32648 ) ) ( not ( = ?auto_32654 ?auto_32659 ) ) ( not ( = ?auto_32663 ?auto_32654 ) ) ( not ( = ?auto_32657 ?auto_32654 ) ) ( HOIST-AT ?auto_32661 ?auto_32654 ) ( not ( = ?auto_32662 ?auto_32661 ) ) ( not ( = ?auto_32664 ?auto_32661 ) ) ( not ( = ?auto_32653 ?auto_32661 ) ) ( SURFACE-AT ?auto_32649 ?auto_32654 ) ( ON ?auto_32649 ?auto_32656 ) ( CLEAR ?auto_32649 ) ( not ( = ?auto_32650 ?auto_32656 ) ) ( not ( = ?auto_32651 ?auto_32656 ) ) ( not ( = ?auto_32649 ?auto_32656 ) ) ( not ( = ?auto_32666 ?auto_32656 ) ) ( not ( = ?auto_32665 ?auto_32656 ) ) ( not ( = ?auto_32648 ?auto_32656 ) ) ( IS-CRATE ?auto_32648 ) ( not ( = ?auto_32647 ?auto_32648 ) ) ( not ( = ?auto_32650 ?auto_32647 ) ) ( not ( = ?auto_32651 ?auto_32647 ) ) ( not ( = ?auto_32649 ?auto_32647 ) ) ( not ( = ?auto_32666 ?auto_32647 ) ) ( not ( = ?auto_32665 ?auto_32647 ) ) ( not ( = ?auto_32656 ?auto_32647 ) ) ( AVAILABLE ?auto_32661 ) ( SURFACE-AT ?auto_32648 ?auto_32654 ) ( ON ?auto_32648 ?auto_32658 ) ( CLEAR ?auto_32648 ) ( not ( = ?auto_32650 ?auto_32658 ) ) ( not ( = ?auto_32651 ?auto_32658 ) ) ( not ( = ?auto_32649 ?auto_32658 ) ) ( not ( = ?auto_32666 ?auto_32658 ) ) ( not ( = ?auto_32665 ?auto_32658 ) ) ( not ( = ?auto_32648 ?auto_32658 ) ) ( not ( = ?auto_32656 ?auto_32658 ) ) ( not ( = ?auto_32647 ?auto_32658 ) ) ( SURFACE-AT ?auto_32655 ?auto_32659 ) ( CLEAR ?auto_32655 ) ( IS-CRATE ?auto_32647 ) ( not ( = ?auto_32655 ?auto_32647 ) ) ( not ( = ?auto_32650 ?auto_32655 ) ) ( not ( = ?auto_32651 ?auto_32655 ) ) ( not ( = ?auto_32649 ?auto_32655 ) ) ( not ( = ?auto_32666 ?auto_32655 ) ) ( not ( = ?auto_32665 ?auto_32655 ) ) ( not ( = ?auto_32648 ?auto_32655 ) ) ( not ( = ?auto_32656 ?auto_32655 ) ) ( not ( = ?auto_32658 ?auto_32655 ) ) ( AVAILABLE ?auto_32662 ) ( TRUCK-AT ?auto_32652 ?auto_32657 ) ( AVAILABLE ?auto_32653 ) ( SURFACE-AT ?auto_32647 ?auto_32657 ) ( ON ?auto_32647 ?auto_32660 ) ( CLEAR ?auto_32647 ) ( not ( = ?auto_32650 ?auto_32660 ) ) ( not ( = ?auto_32651 ?auto_32660 ) ) ( not ( = ?auto_32649 ?auto_32660 ) ) ( not ( = ?auto_32666 ?auto_32660 ) ) ( not ( = ?auto_32665 ?auto_32660 ) ) ( not ( = ?auto_32648 ?auto_32660 ) ) ( not ( = ?auto_32656 ?auto_32660 ) ) ( not ( = ?auto_32647 ?auto_32660 ) ) ( not ( = ?auto_32658 ?auto_32660 ) ) ( not ( = ?auto_32655 ?auto_32660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32649 ?auto_32650 ?auto_32651 )
      ( MAKE-4CRATE-VERIFY ?auto_32647 ?auto_32648 ?auto_32649 ?auto_32650 ?auto_32651 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_32667 - SURFACE
      ?auto_32668 - SURFACE
      ?auto_32669 - SURFACE
      ?auto_32670 - SURFACE
      ?auto_32671 - SURFACE
      ?auto_32672 - SURFACE
    )
    :vars
    (
      ?auto_32682 - HOIST
      ?auto_32679 - PLACE
      ?auto_32683 - PLACE
      ?auto_32684 - HOIST
      ?auto_32686 - SURFACE
      ?auto_32677 - PLACE
      ?auto_32674 - HOIST
      ?auto_32685 - SURFACE
      ?auto_32675 - PLACE
      ?auto_32681 - HOIST
      ?auto_32676 - SURFACE
      ?auto_32678 - SURFACE
      ?auto_32673 - TRUCK
      ?auto_32680 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32682 ?auto_32679 ) ( IS-CRATE ?auto_32672 ) ( not ( = ?auto_32671 ?auto_32672 ) ) ( not ( = ?auto_32670 ?auto_32671 ) ) ( not ( = ?auto_32670 ?auto_32672 ) ) ( not ( = ?auto_32683 ?auto_32679 ) ) ( HOIST-AT ?auto_32684 ?auto_32683 ) ( not ( = ?auto_32682 ?auto_32684 ) ) ( AVAILABLE ?auto_32684 ) ( SURFACE-AT ?auto_32672 ?auto_32683 ) ( ON ?auto_32672 ?auto_32686 ) ( CLEAR ?auto_32672 ) ( not ( = ?auto_32671 ?auto_32686 ) ) ( not ( = ?auto_32672 ?auto_32686 ) ) ( not ( = ?auto_32670 ?auto_32686 ) ) ( IS-CRATE ?auto_32671 ) ( not ( = ?auto_32677 ?auto_32679 ) ) ( not ( = ?auto_32683 ?auto_32677 ) ) ( HOIST-AT ?auto_32674 ?auto_32677 ) ( not ( = ?auto_32682 ?auto_32674 ) ) ( not ( = ?auto_32684 ?auto_32674 ) ) ( SURFACE-AT ?auto_32671 ?auto_32677 ) ( ON ?auto_32671 ?auto_32685 ) ( CLEAR ?auto_32671 ) ( not ( = ?auto_32671 ?auto_32685 ) ) ( not ( = ?auto_32672 ?auto_32685 ) ) ( not ( = ?auto_32670 ?auto_32685 ) ) ( not ( = ?auto_32686 ?auto_32685 ) ) ( IS-CRATE ?auto_32670 ) ( not ( = ?auto_32669 ?auto_32670 ) ) ( not ( = ?auto_32671 ?auto_32669 ) ) ( not ( = ?auto_32672 ?auto_32669 ) ) ( not ( = ?auto_32686 ?auto_32669 ) ) ( not ( = ?auto_32685 ?auto_32669 ) ) ( not ( = ?auto_32675 ?auto_32679 ) ) ( not ( = ?auto_32683 ?auto_32675 ) ) ( not ( = ?auto_32677 ?auto_32675 ) ) ( HOIST-AT ?auto_32681 ?auto_32675 ) ( not ( = ?auto_32682 ?auto_32681 ) ) ( not ( = ?auto_32684 ?auto_32681 ) ) ( not ( = ?auto_32674 ?auto_32681 ) ) ( SURFACE-AT ?auto_32670 ?auto_32675 ) ( ON ?auto_32670 ?auto_32676 ) ( CLEAR ?auto_32670 ) ( not ( = ?auto_32671 ?auto_32676 ) ) ( not ( = ?auto_32672 ?auto_32676 ) ) ( not ( = ?auto_32670 ?auto_32676 ) ) ( not ( = ?auto_32686 ?auto_32676 ) ) ( not ( = ?auto_32685 ?auto_32676 ) ) ( not ( = ?auto_32669 ?auto_32676 ) ) ( IS-CRATE ?auto_32669 ) ( not ( = ?auto_32668 ?auto_32669 ) ) ( not ( = ?auto_32671 ?auto_32668 ) ) ( not ( = ?auto_32672 ?auto_32668 ) ) ( not ( = ?auto_32670 ?auto_32668 ) ) ( not ( = ?auto_32686 ?auto_32668 ) ) ( not ( = ?auto_32685 ?auto_32668 ) ) ( not ( = ?auto_32676 ?auto_32668 ) ) ( AVAILABLE ?auto_32681 ) ( SURFACE-AT ?auto_32669 ?auto_32675 ) ( ON ?auto_32669 ?auto_32678 ) ( CLEAR ?auto_32669 ) ( not ( = ?auto_32671 ?auto_32678 ) ) ( not ( = ?auto_32672 ?auto_32678 ) ) ( not ( = ?auto_32670 ?auto_32678 ) ) ( not ( = ?auto_32686 ?auto_32678 ) ) ( not ( = ?auto_32685 ?auto_32678 ) ) ( not ( = ?auto_32669 ?auto_32678 ) ) ( not ( = ?auto_32676 ?auto_32678 ) ) ( not ( = ?auto_32668 ?auto_32678 ) ) ( SURFACE-AT ?auto_32667 ?auto_32679 ) ( CLEAR ?auto_32667 ) ( IS-CRATE ?auto_32668 ) ( not ( = ?auto_32667 ?auto_32668 ) ) ( not ( = ?auto_32671 ?auto_32667 ) ) ( not ( = ?auto_32672 ?auto_32667 ) ) ( not ( = ?auto_32670 ?auto_32667 ) ) ( not ( = ?auto_32686 ?auto_32667 ) ) ( not ( = ?auto_32685 ?auto_32667 ) ) ( not ( = ?auto_32669 ?auto_32667 ) ) ( not ( = ?auto_32676 ?auto_32667 ) ) ( not ( = ?auto_32678 ?auto_32667 ) ) ( AVAILABLE ?auto_32682 ) ( TRUCK-AT ?auto_32673 ?auto_32677 ) ( AVAILABLE ?auto_32674 ) ( SURFACE-AT ?auto_32668 ?auto_32677 ) ( ON ?auto_32668 ?auto_32680 ) ( CLEAR ?auto_32668 ) ( not ( = ?auto_32671 ?auto_32680 ) ) ( not ( = ?auto_32672 ?auto_32680 ) ) ( not ( = ?auto_32670 ?auto_32680 ) ) ( not ( = ?auto_32686 ?auto_32680 ) ) ( not ( = ?auto_32685 ?auto_32680 ) ) ( not ( = ?auto_32669 ?auto_32680 ) ) ( not ( = ?auto_32676 ?auto_32680 ) ) ( not ( = ?auto_32668 ?auto_32680 ) ) ( not ( = ?auto_32678 ?auto_32680 ) ) ( not ( = ?auto_32667 ?auto_32680 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32670 ?auto_32671 ?auto_32672 )
      ( MAKE-5CRATE-VERIFY ?auto_32667 ?auto_32668 ?auto_32669 ?auto_32670 ?auto_32671 ?auto_32672 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32687 - SURFACE
      ?auto_32688 - SURFACE
    )
    :vars
    (
      ?auto_32700 - HOIST
      ?auto_32696 - PLACE
      ?auto_32701 - SURFACE
      ?auto_32702 - PLACE
      ?auto_32703 - HOIST
      ?auto_32706 - SURFACE
      ?auto_32694 - PLACE
      ?auto_32690 - HOIST
      ?auto_32704 - SURFACE
      ?auto_32705 - SURFACE
      ?auto_32691 - PLACE
      ?auto_32699 - HOIST
      ?auto_32693 - SURFACE
      ?auto_32697 - SURFACE
      ?auto_32695 - SURFACE
      ?auto_32692 - SURFACE
      ?auto_32698 - SURFACE
      ?auto_32689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32700 ?auto_32696 ) ( IS-CRATE ?auto_32688 ) ( not ( = ?auto_32687 ?auto_32688 ) ) ( not ( = ?auto_32701 ?auto_32687 ) ) ( not ( = ?auto_32701 ?auto_32688 ) ) ( not ( = ?auto_32702 ?auto_32696 ) ) ( HOIST-AT ?auto_32703 ?auto_32702 ) ( not ( = ?auto_32700 ?auto_32703 ) ) ( AVAILABLE ?auto_32703 ) ( SURFACE-AT ?auto_32688 ?auto_32702 ) ( ON ?auto_32688 ?auto_32706 ) ( CLEAR ?auto_32688 ) ( not ( = ?auto_32687 ?auto_32706 ) ) ( not ( = ?auto_32688 ?auto_32706 ) ) ( not ( = ?auto_32701 ?auto_32706 ) ) ( IS-CRATE ?auto_32687 ) ( not ( = ?auto_32694 ?auto_32696 ) ) ( not ( = ?auto_32702 ?auto_32694 ) ) ( HOIST-AT ?auto_32690 ?auto_32694 ) ( not ( = ?auto_32700 ?auto_32690 ) ) ( not ( = ?auto_32703 ?auto_32690 ) ) ( SURFACE-AT ?auto_32687 ?auto_32694 ) ( ON ?auto_32687 ?auto_32704 ) ( CLEAR ?auto_32687 ) ( not ( = ?auto_32687 ?auto_32704 ) ) ( not ( = ?auto_32688 ?auto_32704 ) ) ( not ( = ?auto_32701 ?auto_32704 ) ) ( not ( = ?auto_32706 ?auto_32704 ) ) ( IS-CRATE ?auto_32701 ) ( not ( = ?auto_32705 ?auto_32701 ) ) ( not ( = ?auto_32687 ?auto_32705 ) ) ( not ( = ?auto_32688 ?auto_32705 ) ) ( not ( = ?auto_32706 ?auto_32705 ) ) ( not ( = ?auto_32704 ?auto_32705 ) ) ( not ( = ?auto_32691 ?auto_32696 ) ) ( not ( = ?auto_32702 ?auto_32691 ) ) ( not ( = ?auto_32694 ?auto_32691 ) ) ( HOIST-AT ?auto_32699 ?auto_32691 ) ( not ( = ?auto_32700 ?auto_32699 ) ) ( not ( = ?auto_32703 ?auto_32699 ) ) ( not ( = ?auto_32690 ?auto_32699 ) ) ( SURFACE-AT ?auto_32701 ?auto_32691 ) ( ON ?auto_32701 ?auto_32693 ) ( CLEAR ?auto_32701 ) ( not ( = ?auto_32687 ?auto_32693 ) ) ( not ( = ?auto_32688 ?auto_32693 ) ) ( not ( = ?auto_32701 ?auto_32693 ) ) ( not ( = ?auto_32706 ?auto_32693 ) ) ( not ( = ?auto_32704 ?auto_32693 ) ) ( not ( = ?auto_32705 ?auto_32693 ) ) ( IS-CRATE ?auto_32705 ) ( not ( = ?auto_32697 ?auto_32705 ) ) ( not ( = ?auto_32687 ?auto_32697 ) ) ( not ( = ?auto_32688 ?auto_32697 ) ) ( not ( = ?auto_32701 ?auto_32697 ) ) ( not ( = ?auto_32706 ?auto_32697 ) ) ( not ( = ?auto_32704 ?auto_32697 ) ) ( not ( = ?auto_32693 ?auto_32697 ) ) ( AVAILABLE ?auto_32699 ) ( SURFACE-AT ?auto_32705 ?auto_32691 ) ( ON ?auto_32705 ?auto_32695 ) ( CLEAR ?auto_32705 ) ( not ( = ?auto_32687 ?auto_32695 ) ) ( not ( = ?auto_32688 ?auto_32695 ) ) ( not ( = ?auto_32701 ?auto_32695 ) ) ( not ( = ?auto_32706 ?auto_32695 ) ) ( not ( = ?auto_32704 ?auto_32695 ) ) ( not ( = ?auto_32705 ?auto_32695 ) ) ( not ( = ?auto_32693 ?auto_32695 ) ) ( not ( = ?auto_32697 ?auto_32695 ) ) ( SURFACE-AT ?auto_32692 ?auto_32696 ) ( CLEAR ?auto_32692 ) ( IS-CRATE ?auto_32697 ) ( not ( = ?auto_32692 ?auto_32697 ) ) ( not ( = ?auto_32687 ?auto_32692 ) ) ( not ( = ?auto_32688 ?auto_32692 ) ) ( not ( = ?auto_32701 ?auto_32692 ) ) ( not ( = ?auto_32706 ?auto_32692 ) ) ( not ( = ?auto_32704 ?auto_32692 ) ) ( not ( = ?auto_32705 ?auto_32692 ) ) ( not ( = ?auto_32693 ?auto_32692 ) ) ( not ( = ?auto_32695 ?auto_32692 ) ) ( AVAILABLE ?auto_32700 ) ( AVAILABLE ?auto_32690 ) ( SURFACE-AT ?auto_32697 ?auto_32694 ) ( ON ?auto_32697 ?auto_32698 ) ( CLEAR ?auto_32697 ) ( not ( = ?auto_32687 ?auto_32698 ) ) ( not ( = ?auto_32688 ?auto_32698 ) ) ( not ( = ?auto_32701 ?auto_32698 ) ) ( not ( = ?auto_32706 ?auto_32698 ) ) ( not ( = ?auto_32704 ?auto_32698 ) ) ( not ( = ?auto_32705 ?auto_32698 ) ) ( not ( = ?auto_32693 ?auto_32698 ) ) ( not ( = ?auto_32697 ?auto_32698 ) ) ( not ( = ?auto_32695 ?auto_32698 ) ) ( not ( = ?auto_32692 ?auto_32698 ) ) ( TRUCK-AT ?auto_32689 ?auto_32696 ) )
    :subtasks
    ( ( !DRIVE ?auto_32689 ?auto_32696 ?auto_32694 )
      ( MAKE-2CRATE ?auto_32701 ?auto_32687 ?auto_32688 )
      ( MAKE-1CRATE-VERIFY ?auto_32687 ?auto_32688 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32707 - SURFACE
      ?auto_32708 - SURFACE
      ?auto_32709 - SURFACE
    )
    :vars
    (
      ?auto_32726 - HOIST
      ?auto_32718 - PLACE
      ?auto_32715 - PLACE
      ?auto_32725 - HOIST
      ?auto_32711 - SURFACE
      ?auto_32712 - PLACE
      ?auto_32722 - HOIST
      ?auto_32710 - SURFACE
      ?auto_32724 - SURFACE
      ?auto_32713 - PLACE
      ?auto_32717 - HOIST
      ?auto_32716 - SURFACE
      ?auto_32721 - SURFACE
      ?auto_32720 - SURFACE
      ?auto_32719 - SURFACE
      ?auto_32714 - SURFACE
      ?auto_32723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32726 ?auto_32718 ) ( IS-CRATE ?auto_32709 ) ( not ( = ?auto_32708 ?auto_32709 ) ) ( not ( = ?auto_32707 ?auto_32708 ) ) ( not ( = ?auto_32707 ?auto_32709 ) ) ( not ( = ?auto_32715 ?auto_32718 ) ) ( HOIST-AT ?auto_32725 ?auto_32715 ) ( not ( = ?auto_32726 ?auto_32725 ) ) ( AVAILABLE ?auto_32725 ) ( SURFACE-AT ?auto_32709 ?auto_32715 ) ( ON ?auto_32709 ?auto_32711 ) ( CLEAR ?auto_32709 ) ( not ( = ?auto_32708 ?auto_32711 ) ) ( not ( = ?auto_32709 ?auto_32711 ) ) ( not ( = ?auto_32707 ?auto_32711 ) ) ( IS-CRATE ?auto_32708 ) ( not ( = ?auto_32712 ?auto_32718 ) ) ( not ( = ?auto_32715 ?auto_32712 ) ) ( HOIST-AT ?auto_32722 ?auto_32712 ) ( not ( = ?auto_32726 ?auto_32722 ) ) ( not ( = ?auto_32725 ?auto_32722 ) ) ( SURFACE-AT ?auto_32708 ?auto_32712 ) ( ON ?auto_32708 ?auto_32710 ) ( CLEAR ?auto_32708 ) ( not ( = ?auto_32708 ?auto_32710 ) ) ( not ( = ?auto_32709 ?auto_32710 ) ) ( not ( = ?auto_32707 ?auto_32710 ) ) ( not ( = ?auto_32711 ?auto_32710 ) ) ( IS-CRATE ?auto_32707 ) ( not ( = ?auto_32724 ?auto_32707 ) ) ( not ( = ?auto_32708 ?auto_32724 ) ) ( not ( = ?auto_32709 ?auto_32724 ) ) ( not ( = ?auto_32711 ?auto_32724 ) ) ( not ( = ?auto_32710 ?auto_32724 ) ) ( not ( = ?auto_32713 ?auto_32718 ) ) ( not ( = ?auto_32715 ?auto_32713 ) ) ( not ( = ?auto_32712 ?auto_32713 ) ) ( HOIST-AT ?auto_32717 ?auto_32713 ) ( not ( = ?auto_32726 ?auto_32717 ) ) ( not ( = ?auto_32725 ?auto_32717 ) ) ( not ( = ?auto_32722 ?auto_32717 ) ) ( SURFACE-AT ?auto_32707 ?auto_32713 ) ( ON ?auto_32707 ?auto_32716 ) ( CLEAR ?auto_32707 ) ( not ( = ?auto_32708 ?auto_32716 ) ) ( not ( = ?auto_32709 ?auto_32716 ) ) ( not ( = ?auto_32707 ?auto_32716 ) ) ( not ( = ?auto_32711 ?auto_32716 ) ) ( not ( = ?auto_32710 ?auto_32716 ) ) ( not ( = ?auto_32724 ?auto_32716 ) ) ( IS-CRATE ?auto_32724 ) ( not ( = ?auto_32721 ?auto_32724 ) ) ( not ( = ?auto_32708 ?auto_32721 ) ) ( not ( = ?auto_32709 ?auto_32721 ) ) ( not ( = ?auto_32707 ?auto_32721 ) ) ( not ( = ?auto_32711 ?auto_32721 ) ) ( not ( = ?auto_32710 ?auto_32721 ) ) ( not ( = ?auto_32716 ?auto_32721 ) ) ( AVAILABLE ?auto_32717 ) ( SURFACE-AT ?auto_32724 ?auto_32713 ) ( ON ?auto_32724 ?auto_32720 ) ( CLEAR ?auto_32724 ) ( not ( = ?auto_32708 ?auto_32720 ) ) ( not ( = ?auto_32709 ?auto_32720 ) ) ( not ( = ?auto_32707 ?auto_32720 ) ) ( not ( = ?auto_32711 ?auto_32720 ) ) ( not ( = ?auto_32710 ?auto_32720 ) ) ( not ( = ?auto_32724 ?auto_32720 ) ) ( not ( = ?auto_32716 ?auto_32720 ) ) ( not ( = ?auto_32721 ?auto_32720 ) ) ( SURFACE-AT ?auto_32719 ?auto_32718 ) ( CLEAR ?auto_32719 ) ( IS-CRATE ?auto_32721 ) ( not ( = ?auto_32719 ?auto_32721 ) ) ( not ( = ?auto_32708 ?auto_32719 ) ) ( not ( = ?auto_32709 ?auto_32719 ) ) ( not ( = ?auto_32707 ?auto_32719 ) ) ( not ( = ?auto_32711 ?auto_32719 ) ) ( not ( = ?auto_32710 ?auto_32719 ) ) ( not ( = ?auto_32724 ?auto_32719 ) ) ( not ( = ?auto_32716 ?auto_32719 ) ) ( not ( = ?auto_32720 ?auto_32719 ) ) ( AVAILABLE ?auto_32726 ) ( AVAILABLE ?auto_32722 ) ( SURFACE-AT ?auto_32721 ?auto_32712 ) ( ON ?auto_32721 ?auto_32714 ) ( CLEAR ?auto_32721 ) ( not ( = ?auto_32708 ?auto_32714 ) ) ( not ( = ?auto_32709 ?auto_32714 ) ) ( not ( = ?auto_32707 ?auto_32714 ) ) ( not ( = ?auto_32711 ?auto_32714 ) ) ( not ( = ?auto_32710 ?auto_32714 ) ) ( not ( = ?auto_32724 ?auto_32714 ) ) ( not ( = ?auto_32716 ?auto_32714 ) ) ( not ( = ?auto_32721 ?auto_32714 ) ) ( not ( = ?auto_32720 ?auto_32714 ) ) ( not ( = ?auto_32719 ?auto_32714 ) ) ( TRUCK-AT ?auto_32723 ?auto_32718 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32708 ?auto_32709 )
      ( MAKE-2CRATE-VERIFY ?auto_32707 ?auto_32708 ?auto_32709 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32727 - SURFACE
      ?auto_32728 - SURFACE
      ?auto_32729 - SURFACE
      ?auto_32730 - SURFACE
    )
    :vars
    (
      ?auto_32745 - HOIST
      ?auto_32743 - PLACE
      ?auto_32741 - PLACE
      ?auto_32744 - HOIST
      ?auto_32740 - SURFACE
      ?auto_32742 - PLACE
      ?auto_32734 - HOIST
      ?auto_32739 - SURFACE
      ?auto_32746 - PLACE
      ?auto_32732 - HOIST
      ?auto_32735 - SURFACE
      ?auto_32736 - SURFACE
      ?auto_32737 - SURFACE
      ?auto_32738 - SURFACE
      ?auto_32731 - SURFACE
      ?auto_32733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32745 ?auto_32743 ) ( IS-CRATE ?auto_32730 ) ( not ( = ?auto_32729 ?auto_32730 ) ) ( not ( = ?auto_32728 ?auto_32729 ) ) ( not ( = ?auto_32728 ?auto_32730 ) ) ( not ( = ?auto_32741 ?auto_32743 ) ) ( HOIST-AT ?auto_32744 ?auto_32741 ) ( not ( = ?auto_32745 ?auto_32744 ) ) ( AVAILABLE ?auto_32744 ) ( SURFACE-AT ?auto_32730 ?auto_32741 ) ( ON ?auto_32730 ?auto_32740 ) ( CLEAR ?auto_32730 ) ( not ( = ?auto_32729 ?auto_32740 ) ) ( not ( = ?auto_32730 ?auto_32740 ) ) ( not ( = ?auto_32728 ?auto_32740 ) ) ( IS-CRATE ?auto_32729 ) ( not ( = ?auto_32742 ?auto_32743 ) ) ( not ( = ?auto_32741 ?auto_32742 ) ) ( HOIST-AT ?auto_32734 ?auto_32742 ) ( not ( = ?auto_32745 ?auto_32734 ) ) ( not ( = ?auto_32744 ?auto_32734 ) ) ( SURFACE-AT ?auto_32729 ?auto_32742 ) ( ON ?auto_32729 ?auto_32739 ) ( CLEAR ?auto_32729 ) ( not ( = ?auto_32729 ?auto_32739 ) ) ( not ( = ?auto_32730 ?auto_32739 ) ) ( not ( = ?auto_32728 ?auto_32739 ) ) ( not ( = ?auto_32740 ?auto_32739 ) ) ( IS-CRATE ?auto_32728 ) ( not ( = ?auto_32727 ?auto_32728 ) ) ( not ( = ?auto_32729 ?auto_32727 ) ) ( not ( = ?auto_32730 ?auto_32727 ) ) ( not ( = ?auto_32740 ?auto_32727 ) ) ( not ( = ?auto_32739 ?auto_32727 ) ) ( not ( = ?auto_32746 ?auto_32743 ) ) ( not ( = ?auto_32741 ?auto_32746 ) ) ( not ( = ?auto_32742 ?auto_32746 ) ) ( HOIST-AT ?auto_32732 ?auto_32746 ) ( not ( = ?auto_32745 ?auto_32732 ) ) ( not ( = ?auto_32744 ?auto_32732 ) ) ( not ( = ?auto_32734 ?auto_32732 ) ) ( SURFACE-AT ?auto_32728 ?auto_32746 ) ( ON ?auto_32728 ?auto_32735 ) ( CLEAR ?auto_32728 ) ( not ( = ?auto_32729 ?auto_32735 ) ) ( not ( = ?auto_32730 ?auto_32735 ) ) ( not ( = ?auto_32728 ?auto_32735 ) ) ( not ( = ?auto_32740 ?auto_32735 ) ) ( not ( = ?auto_32739 ?auto_32735 ) ) ( not ( = ?auto_32727 ?auto_32735 ) ) ( IS-CRATE ?auto_32727 ) ( not ( = ?auto_32736 ?auto_32727 ) ) ( not ( = ?auto_32729 ?auto_32736 ) ) ( not ( = ?auto_32730 ?auto_32736 ) ) ( not ( = ?auto_32728 ?auto_32736 ) ) ( not ( = ?auto_32740 ?auto_32736 ) ) ( not ( = ?auto_32739 ?auto_32736 ) ) ( not ( = ?auto_32735 ?auto_32736 ) ) ( AVAILABLE ?auto_32732 ) ( SURFACE-AT ?auto_32727 ?auto_32746 ) ( ON ?auto_32727 ?auto_32737 ) ( CLEAR ?auto_32727 ) ( not ( = ?auto_32729 ?auto_32737 ) ) ( not ( = ?auto_32730 ?auto_32737 ) ) ( not ( = ?auto_32728 ?auto_32737 ) ) ( not ( = ?auto_32740 ?auto_32737 ) ) ( not ( = ?auto_32739 ?auto_32737 ) ) ( not ( = ?auto_32727 ?auto_32737 ) ) ( not ( = ?auto_32735 ?auto_32737 ) ) ( not ( = ?auto_32736 ?auto_32737 ) ) ( SURFACE-AT ?auto_32738 ?auto_32743 ) ( CLEAR ?auto_32738 ) ( IS-CRATE ?auto_32736 ) ( not ( = ?auto_32738 ?auto_32736 ) ) ( not ( = ?auto_32729 ?auto_32738 ) ) ( not ( = ?auto_32730 ?auto_32738 ) ) ( not ( = ?auto_32728 ?auto_32738 ) ) ( not ( = ?auto_32740 ?auto_32738 ) ) ( not ( = ?auto_32739 ?auto_32738 ) ) ( not ( = ?auto_32727 ?auto_32738 ) ) ( not ( = ?auto_32735 ?auto_32738 ) ) ( not ( = ?auto_32737 ?auto_32738 ) ) ( AVAILABLE ?auto_32745 ) ( AVAILABLE ?auto_32734 ) ( SURFACE-AT ?auto_32736 ?auto_32742 ) ( ON ?auto_32736 ?auto_32731 ) ( CLEAR ?auto_32736 ) ( not ( = ?auto_32729 ?auto_32731 ) ) ( not ( = ?auto_32730 ?auto_32731 ) ) ( not ( = ?auto_32728 ?auto_32731 ) ) ( not ( = ?auto_32740 ?auto_32731 ) ) ( not ( = ?auto_32739 ?auto_32731 ) ) ( not ( = ?auto_32727 ?auto_32731 ) ) ( not ( = ?auto_32735 ?auto_32731 ) ) ( not ( = ?auto_32736 ?auto_32731 ) ) ( not ( = ?auto_32737 ?auto_32731 ) ) ( not ( = ?auto_32738 ?auto_32731 ) ) ( TRUCK-AT ?auto_32733 ?auto_32743 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32728 ?auto_32729 ?auto_32730 )
      ( MAKE-3CRATE-VERIFY ?auto_32727 ?auto_32728 ?auto_32729 ?auto_32730 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32747 - SURFACE
      ?auto_32748 - SURFACE
      ?auto_32749 - SURFACE
      ?auto_32750 - SURFACE
      ?auto_32751 - SURFACE
    )
    :vars
    (
      ?auto_32765 - HOIST
      ?auto_32763 - PLACE
      ?auto_32761 - PLACE
      ?auto_32764 - HOIST
      ?auto_32760 - SURFACE
      ?auto_32762 - PLACE
      ?auto_32755 - HOIST
      ?auto_32759 - SURFACE
      ?auto_32766 - PLACE
      ?auto_32753 - HOIST
      ?auto_32756 - SURFACE
      ?auto_32757 - SURFACE
      ?auto_32758 - SURFACE
      ?auto_32752 - SURFACE
      ?auto_32754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32765 ?auto_32763 ) ( IS-CRATE ?auto_32751 ) ( not ( = ?auto_32750 ?auto_32751 ) ) ( not ( = ?auto_32749 ?auto_32750 ) ) ( not ( = ?auto_32749 ?auto_32751 ) ) ( not ( = ?auto_32761 ?auto_32763 ) ) ( HOIST-AT ?auto_32764 ?auto_32761 ) ( not ( = ?auto_32765 ?auto_32764 ) ) ( AVAILABLE ?auto_32764 ) ( SURFACE-AT ?auto_32751 ?auto_32761 ) ( ON ?auto_32751 ?auto_32760 ) ( CLEAR ?auto_32751 ) ( not ( = ?auto_32750 ?auto_32760 ) ) ( not ( = ?auto_32751 ?auto_32760 ) ) ( not ( = ?auto_32749 ?auto_32760 ) ) ( IS-CRATE ?auto_32750 ) ( not ( = ?auto_32762 ?auto_32763 ) ) ( not ( = ?auto_32761 ?auto_32762 ) ) ( HOIST-AT ?auto_32755 ?auto_32762 ) ( not ( = ?auto_32765 ?auto_32755 ) ) ( not ( = ?auto_32764 ?auto_32755 ) ) ( SURFACE-AT ?auto_32750 ?auto_32762 ) ( ON ?auto_32750 ?auto_32759 ) ( CLEAR ?auto_32750 ) ( not ( = ?auto_32750 ?auto_32759 ) ) ( not ( = ?auto_32751 ?auto_32759 ) ) ( not ( = ?auto_32749 ?auto_32759 ) ) ( not ( = ?auto_32760 ?auto_32759 ) ) ( IS-CRATE ?auto_32749 ) ( not ( = ?auto_32748 ?auto_32749 ) ) ( not ( = ?auto_32750 ?auto_32748 ) ) ( not ( = ?auto_32751 ?auto_32748 ) ) ( not ( = ?auto_32760 ?auto_32748 ) ) ( not ( = ?auto_32759 ?auto_32748 ) ) ( not ( = ?auto_32766 ?auto_32763 ) ) ( not ( = ?auto_32761 ?auto_32766 ) ) ( not ( = ?auto_32762 ?auto_32766 ) ) ( HOIST-AT ?auto_32753 ?auto_32766 ) ( not ( = ?auto_32765 ?auto_32753 ) ) ( not ( = ?auto_32764 ?auto_32753 ) ) ( not ( = ?auto_32755 ?auto_32753 ) ) ( SURFACE-AT ?auto_32749 ?auto_32766 ) ( ON ?auto_32749 ?auto_32756 ) ( CLEAR ?auto_32749 ) ( not ( = ?auto_32750 ?auto_32756 ) ) ( not ( = ?auto_32751 ?auto_32756 ) ) ( not ( = ?auto_32749 ?auto_32756 ) ) ( not ( = ?auto_32760 ?auto_32756 ) ) ( not ( = ?auto_32759 ?auto_32756 ) ) ( not ( = ?auto_32748 ?auto_32756 ) ) ( IS-CRATE ?auto_32748 ) ( not ( = ?auto_32747 ?auto_32748 ) ) ( not ( = ?auto_32750 ?auto_32747 ) ) ( not ( = ?auto_32751 ?auto_32747 ) ) ( not ( = ?auto_32749 ?auto_32747 ) ) ( not ( = ?auto_32760 ?auto_32747 ) ) ( not ( = ?auto_32759 ?auto_32747 ) ) ( not ( = ?auto_32756 ?auto_32747 ) ) ( AVAILABLE ?auto_32753 ) ( SURFACE-AT ?auto_32748 ?auto_32766 ) ( ON ?auto_32748 ?auto_32757 ) ( CLEAR ?auto_32748 ) ( not ( = ?auto_32750 ?auto_32757 ) ) ( not ( = ?auto_32751 ?auto_32757 ) ) ( not ( = ?auto_32749 ?auto_32757 ) ) ( not ( = ?auto_32760 ?auto_32757 ) ) ( not ( = ?auto_32759 ?auto_32757 ) ) ( not ( = ?auto_32748 ?auto_32757 ) ) ( not ( = ?auto_32756 ?auto_32757 ) ) ( not ( = ?auto_32747 ?auto_32757 ) ) ( SURFACE-AT ?auto_32758 ?auto_32763 ) ( CLEAR ?auto_32758 ) ( IS-CRATE ?auto_32747 ) ( not ( = ?auto_32758 ?auto_32747 ) ) ( not ( = ?auto_32750 ?auto_32758 ) ) ( not ( = ?auto_32751 ?auto_32758 ) ) ( not ( = ?auto_32749 ?auto_32758 ) ) ( not ( = ?auto_32760 ?auto_32758 ) ) ( not ( = ?auto_32759 ?auto_32758 ) ) ( not ( = ?auto_32748 ?auto_32758 ) ) ( not ( = ?auto_32756 ?auto_32758 ) ) ( not ( = ?auto_32757 ?auto_32758 ) ) ( AVAILABLE ?auto_32765 ) ( AVAILABLE ?auto_32755 ) ( SURFACE-AT ?auto_32747 ?auto_32762 ) ( ON ?auto_32747 ?auto_32752 ) ( CLEAR ?auto_32747 ) ( not ( = ?auto_32750 ?auto_32752 ) ) ( not ( = ?auto_32751 ?auto_32752 ) ) ( not ( = ?auto_32749 ?auto_32752 ) ) ( not ( = ?auto_32760 ?auto_32752 ) ) ( not ( = ?auto_32759 ?auto_32752 ) ) ( not ( = ?auto_32748 ?auto_32752 ) ) ( not ( = ?auto_32756 ?auto_32752 ) ) ( not ( = ?auto_32747 ?auto_32752 ) ) ( not ( = ?auto_32757 ?auto_32752 ) ) ( not ( = ?auto_32758 ?auto_32752 ) ) ( TRUCK-AT ?auto_32754 ?auto_32763 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32749 ?auto_32750 ?auto_32751 )
      ( MAKE-4CRATE-VERIFY ?auto_32747 ?auto_32748 ?auto_32749 ?auto_32750 ?auto_32751 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_32767 - SURFACE
      ?auto_32768 - SURFACE
      ?auto_32769 - SURFACE
      ?auto_32770 - SURFACE
      ?auto_32771 - SURFACE
      ?auto_32772 - SURFACE
    )
    :vars
    (
      ?auto_32785 - HOIST
      ?auto_32783 - PLACE
      ?auto_32781 - PLACE
      ?auto_32784 - HOIST
      ?auto_32780 - SURFACE
      ?auto_32782 - PLACE
      ?auto_32776 - HOIST
      ?auto_32779 - SURFACE
      ?auto_32786 - PLACE
      ?auto_32774 - HOIST
      ?auto_32777 - SURFACE
      ?auto_32778 - SURFACE
      ?auto_32773 - SURFACE
      ?auto_32775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32785 ?auto_32783 ) ( IS-CRATE ?auto_32772 ) ( not ( = ?auto_32771 ?auto_32772 ) ) ( not ( = ?auto_32770 ?auto_32771 ) ) ( not ( = ?auto_32770 ?auto_32772 ) ) ( not ( = ?auto_32781 ?auto_32783 ) ) ( HOIST-AT ?auto_32784 ?auto_32781 ) ( not ( = ?auto_32785 ?auto_32784 ) ) ( AVAILABLE ?auto_32784 ) ( SURFACE-AT ?auto_32772 ?auto_32781 ) ( ON ?auto_32772 ?auto_32780 ) ( CLEAR ?auto_32772 ) ( not ( = ?auto_32771 ?auto_32780 ) ) ( not ( = ?auto_32772 ?auto_32780 ) ) ( not ( = ?auto_32770 ?auto_32780 ) ) ( IS-CRATE ?auto_32771 ) ( not ( = ?auto_32782 ?auto_32783 ) ) ( not ( = ?auto_32781 ?auto_32782 ) ) ( HOIST-AT ?auto_32776 ?auto_32782 ) ( not ( = ?auto_32785 ?auto_32776 ) ) ( not ( = ?auto_32784 ?auto_32776 ) ) ( SURFACE-AT ?auto_32771 ?auto_32782 ) ( ON ?auto_32771 ?auto_32779 ) ( CLEAR ?auto_32771 ) ( not ( = ?auto_32771 ?auto_32779 ) ) ( not ( = ?auto_32772 ?auto_32779 ) ) ( not ( = ?auto_32770 ?auto_32779 ) ) ( not ( = ?auto_32780 ?auto_32779 ) ) ( IS-CRATE ?auto_32770 ) ( not ( = ?auto_32769 ?auto_32770 ) ) ( not ( = ?auto_32771 ?auto_32769 ) ) ( not ( = ?auto_32772 ?auto_32769 ) ) ( not ( = ?auto_32780 ?auto_32769 ) ) ( not ( = ?auto_32779 ?auto_32769 ) ) ( not ( = ?auto_32786 ?auto_32783 ) ) ( not ( = ?auto_32781 ?auto_32786 ) ) ( not ( = ?auto_32782 ?auto_32786 ) ) ( HOIST-AT ?auto_32774 ?auto_32786 ) ( not ( = ?auto_32785 ?auto_32774 ) ) ( not ( = ?auto_32784 ?auto_32774 ) ) ( not ( = ?auto_32776 ?auto_32774 ) ) ( SURFACE-AT ?auto_32770 ?auto_32786 ) ( ON ?auto_32770 ?auto_32777 ) ( CLEAR ?auto_32770 ) ( not ( = ?auto_32771 ?auto_32777 ) ) ( not ( = ?auto_32772 ?auto_32777 ) ) ( not ( = ?auto_32770 ?auto_32777 ) ) ( not ( = ?auto_32780 ?auto_32777 ) ) ( not ( = ?auto_32779 ?auto_32777 ) ) ( not ( = ?auto_32769 ?auto_32777 ) ) ( IS-CRATE ?auto_32769 ) ( not ( = ?auto_32768 ?auto_32769 ) ) ( not ( = ?auto_32771 ?auto_32768 ) ) ( not ( = ?auto_32772 ?auto_32768 ) ) ( not ( = ?auto_32770 ?auto_32768 ) ) ( not ( = ?auto_32780 ?auto_32768 ) ) ( not ( = ?auto_32779 ?auto_32768 ) ) ( not ( = ?auto_32777 ?auto_32768 ) ) ( AVAILABLE ?auto_32774 ) ( SURFACE-AT ?auto_32769 ?auto_32786 ) ( ON ?auto_32769 ?auto_32778 ) ( CLEAR ?auto_32769 ) ( not ( = ?auto_32771 ?auto_32778 ) ) ( not ( = ?auto_32772 ?auto_32778 ) ) ( not ( = ?auto_32770 ?auto_32778 ) ) ( not ( = ?auto_32780 ?auto_32778 ) ) ( not ( = ?auto_32779 ?auto_32778 ) ) ( not ( = ?auto_32769 ?auto_32778 ) ) ( not ( = ?auto_32777 ?auto_32778 ) ) ( not ( = ?auto_32768 ?auto_32778 ) ) ( SURFACE-AT ?auto_32767 ?auto_32783 ) ( CLEAR ?auto_32767 ) ( IS-CRATE ?auto_32768 ) ( not ( = ?auto_32767 ?auto_32768 ) ) ( not ( = ?auto_32771 ?auto_32767 ) ) ( not ( = ?auto_32772 ?auto_32767 ) ) ( not ( = ?auto_32770 ?auto_32767 ) ) ( not ( = ?auto_32780 ?auto_32767 ) ) ( not ( = ?auto_32779 ?auto_32767 ) ) ( not ( = ?auto_32769 ?auto_32767 ) ) ( not ( = ?auto_32777 ?auto_32767 ) ) ( not ( = ?auto_32778 ?auto_32767 ) ) ( AVAILABLE ?auto_32785 ) ( AVAILABLE ?auto_32776 ) ( SURFACE-AT ?auto_32768 ?auto_32782 ) ( ON ?auto_32768 ?auto_32773 ) ( CLEAR ?auto_32768 ) ( not ( = ?auto_32771 ?auto_32773 ) ) ( not ( = ?auto_32772 ?auto_32773 ) ) ( not ( = ?auto_32770 ?auto_32773 ) ) ( not ( = ?auto_32780 ?auto_32773 ) ) ( not ( = ?auto_32779 ?auto_32773 ) ) ( not ( = ?auto_32769 ?auto_32773 ) ) ( not ( = ?auto_32777 ?auto_32773 ) ) ( not ( = ?auto_32768 ?auto_32773 ) ) ( not ( = ?auto_32778 ?auto_32773 ) ) ( not ( = ?auto_32767 ?auto_32773 ) ) ( TRUCK-AT ?auto_32775 ?auto_32783 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32770 ?auto_32771 ?auto_32772 )
      ( MAKE-5CRATE-VERIFY ?auto_32767 ?auto_32768 ?auto_32769 ?auto_32770 ?auto_32771 ?auto_32772 ) )
  )

)

