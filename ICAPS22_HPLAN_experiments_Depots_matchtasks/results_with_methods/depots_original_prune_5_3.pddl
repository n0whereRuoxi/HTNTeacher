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
      ?auto_21647 - SURFACE
      ?auto_21648 - SURFACE
    )
    :vars
    (
      ?auto_21649 - HOIST
      ?auto_21650 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21649 ?auto_21650 ) ( SURFACE-AT ?auto_21647 ?auto_21650 ) ( CLEAR ?auto_21647 ) ( LIFTING ?auto_21649 ?auto_21648 ) ( IS-CRATE ?auto_21648 ) ( not ( = ?auto_21647 ?auto_21648 ) ) )
    :subtasks
    ( ( !DROP ?auto_21649 ?auto_21648 ?auto_21647 ?auto_21650 )
      ( MAKE-1CRATE-VERIFY ?auto_21647 ?auto_21648 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21651 - SURFACE
      ?auto_21652 - SURFACE
    )
    :vars
    (
      ?auto_21653 - HOIST
      ?auto_21654 - PLACE
      ?auto_21655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21653 ?auto_21654 ) ( SURFACE-AT ?auto_21651 ?auto_21654 ) ( CLEAR ?auto_21651 ) ( IS-CRATE ?auto_21652 ) ( not ( = ?auto_21651 ?auto_21652 ) ) ( TRUCK-AT ?auto_21655 ?auto_21654 ) ( AVAILABLE ?auto_21653 ) ( IN ?auto_21652 ?auto_21655 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21653 ?auto_21652 ?auto_21655 ?auto_21654 )
      ( MAKE-1CRATE ?auto_21651 ?auto_21652 )
      ( MAKE-1CRATE-VERIFY ?auto_21651 ?auto_21652 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21656 - SURFACE
      ?auto_21657 - SURFACE
    )
    :vars
    (
      ?auto_21658 - HOIST
      ?auto_21659 - PLACE
      ?auto_21660 - TRUCK
      ?auto_21661 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21658 ?auto_21659 ) ( SURFACE-AT ?auto_21656 ?auto_21659 ) ( CLEAR ?auto_21656 ) ( IS-CRATE ?auto_21657 ) ( not ( = ?auto_21656 ?auto_21657 ) ) ( AVAILABLE ?auto_21658 ) ( IN ?auto_21657 ?auto_21660 ) ( TRUCK-AT ?auto_21660 ?auto_21661 ) ( not ( = ?auto_21661 ?auto_21659 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21660 ?auto_21661 ?auto_21659 )
      ( MAKE-1CRATE ?auto_21656 ?auto_21657 )
      ( MAKE-1CRATE-VERIFY ?auto_21656 ?auto_21657 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21662 - SURFACE
      ?auto_21663 - SURFACE
    )
    :vars
    (
      ?auto_21666 - HOIST
      ?auto_21665 - PLACE
      ?auto_21664 - TRUCK
      ?auto_21667 - PLACE
      ?auto_21668 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21666 ?auto_21665 ) ( SURFACE-AT ?auto_21662 ?auto_21665 ) ( CLEAR ?auto_21662 ) ( IS-CRATE ?auto_21663 ) ( not ( = ?auto_21662 ?auto_21663 ) ) ( AVAILABLE ?auto_21666 ) ( TRUCK-AT ?auto_21664 ?auto_21667 ) ( not ( = ?auto_21667 ?auto_21665 ) ) ( HOIST-AT ?auto_21668 ?auto_21667 ) ( LIFTING ?auto_21668 ?auto_21663 ) ( not ( = ?auto_21666 ?auto_21668 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21668 ?auto_21663 ?auto_21664 ?auto_21667 )
      ( MAKE-1CRATE ?auto_21662 ?auto_21663 )
      ( MAKE-1CRATE-VERIFY ?auto_21662 ?auto_21663 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21669 - SURFACE
      ?auto_21670 - SURFACE
    )
    :vars
    (
      ?auto_21672 - HOIST
      ?auto_21673 - PLACE
      ?auto_21671 - TRUCK
      ?auto_21675 - PLACE
      ?auto_21674 - HOIST
      ?auto_21676 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21672 ?auto_21673 ) ( SURFACE-AT ?auto_21669 ?auto_21673 ) ( CLEAR ?auto_21669 ) ( IS-CRATE ?auto_21670 ) ( not ( = ?auto_21669 ?auto_21670 ) ) ( AVAILABLE ?auto_21672 ) ( TRUCK-AT ?auto_21671 ?auto_21675 ) ( not ( = ?auto_21675 ?auto_21673 ) ) ( HOIST-AT ?auto_21674 ?auto_21675 ) ( not ( = ?auto_21672 ?auto_21674 ) ) ( AVAILABLE ?auto_21674 ) ( SURFACE-AT ?auto_21670 ?auto_21675 ) ( ON ?auto_21670 ?auto_21676 ) ( CLEAR ?auto_21670 ) ( not ( = ?auto_21669 ?auto_21676 ) ) ( not ( = ?auto_21670 ?auto_21676 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21674 ?auto_21670 ?auto_21676 ?auto_21675 )
      ( MAKE-1CRATE ?auto_21669 ?auto_21670 )
      ( MAKE-1CRATE-VERIFY ?auto_21669 ?auto_21670 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21677 - SURFACE
      ?auto_21678 - SURFACE
    )
    :vars
    (
      ?auto_21681 - HOIST
      ?auto_21680 - PLACE
      ?auto_21683 - PLACE
      ?auto_21679 - HOIST
      ?auto_21682 - SURFACE
      ?auto_21684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21681 ?auto_21680 ) ( SURFACE-AT ?auto_21677 ?auto_21680 ) ( CLEAR ?auto_21677 ) ( IS-CRATE ?auto_21678 ) ( not ( = ?auto_21677 ?auto_21678 ) ) ( AVAILABLE ?auto_21681 ) ( not ( = ?auto_21683 ?auto_21680 ) ) ( HOIST-AT ?auto_21679 ?auto_21683 ) ( not ( = ?auto_21681 ?auto_21679 ) ) ( AVAILABLE ?auto_21679 ) ( SURFACE-AT ?auto_21678 ?auto_21683 ) ( ON ?auto_21678 ?auto_21682 ) ( CLEAR ?auto_21678 ) ( not ( = ?auto_21677 ?auto_21682 ) ) ( not ( = ?auto_21678 ?auto_21682 ) ) ( TRUCK-AT ?auto_21684 ?auto_21680 ) )
    :subtasks
    ( ( !DRIVE ?auto_21684 ?auto_21680 ?auto_21683 )
      ( MAKE-1CRATE ?auto_21677 ?auto_21678 )
      ( MAKE-1CRATE-VERIFY ?auto_21677 ?auto_21678 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21694 - SURFACE
      ?auto_21695 - SURFACE
      ?auto_21696 - SURFACE
    )
    :vars
    (
      ?auto_21697 - HOIST
      ?auto_21698 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21697 ?auto_21698 ) ( SURFACE-AT ?auto_21695 ?auto_21698 ) ( CLEAR ?auto_21695 ) ( LIFTING ?auto_21697 ?auto_21696 ) ( IS-CRATE ?auto_21696 ) ( not ( = ?auto_21695 ?auto_21696 ) ) ( ON ?auto_21695 ?auto_21694 ) ( not ( = ?auto_21694 ?auto_21695 ) ) ( not ( = ?auto_21694 ?auto_21696 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21695 ?auto_21696 )
      ( MAKE-2CRATE-VERIFY ?auto_21694 ?auto_21695 ?auto_21696 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21704 - SURFACE
      ?auto_21705 - SURFACE
      ?auto_21706 - SURFACE
    )
    :vars
    (
      ?auto_21708 - HOIST
      ?auto_21709 - PLACE
      ?auto_21707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21708 ?auto_21709 ) ( SURFACE-AT ?auto_21705 ?auto_21709 ) ( CLEAR ?auto_21705 ) ( IS-CRATE ?auto_21706 ) ( not ( = ?auto_21705 ?auto_21706 ) ) ( TRUCK-AT ?auto_21707 ?auto_21709 ) ( AVAILABLE ?auto_21708 ) ( IN ?auto_21706 ?auto_21707 ) ( ON ?auto_21705 ?auto_21704 ) ( not ( = ?auto_21704 ?auto_21705 ) ) ( not ( = ?auto_21704 ?auto_21706 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21705 ?auto_21706 )
      ( MAKE-2CRATE-VERIFY ?auto_21704 ?auto_21705 ?auto_21706 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21710 - SURFACE
      ?auto_21711 - SURFACE
    )
    :vars
    (
      ?auto_21714 - HOIST
      ?auto_21712 - PLACE
      ?auto_21713 - TRUCK
      ?auto_21715 - SURFACE
      ?auto_21716 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21714 ?auto_21712 ) ( SURFACE-AT ?auto_21710 ?auto_21712 ) ( CLEAR ?auto_21710 ) ( IS-CRATE ?auto_21711 ) ( not ( = ?auto_21710 ?auto_21711 ) ) ( AVAILABLE ?auto_21714 ) ( IN ?auto_21711 ?auto_21713 ) ( ON ?auto_21710 ?auto_21715 ) ( not ( = ?auto_21715 ?auto_21710 ) ) ( not ( = ?auto_21715 ?auto_21711 ) ) ( TRUCK-AT ?auto_21713 ?auto_21716 ) ( not ( = ?auto_21716 ?auto_21712 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21713 ?auto_21716 ?auto_21712 )
      ( MAKE-2CRATE ?auto_21715 ?auto_21710 ?auto_21711 )
      ( MAKE-1CRATE-VERIFY ?auto_21710 ?auto_21711 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21717 - SURFACE
      ?auto_21718 - SURFACE
      ?auto_21719 - SURFACE
    )
    :vars
    (
      ?auto_21720 - HOIST
      ?auto_21722 - PLACE
      ?auto_21723 - TRUCK
      ?auto_21721 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21720 ?auto_21722 ) ( SURFACE-AT ?auto_21718 ?auto_21722 ) ( CLEAR ?auto_21718 ) ( IS-CRATE ?auto_21719 ) ( not ( = ?auto_21718 ?auto_21719 ) ) ( AVAILABLE ?auto_21720 ) ( IN ?auto_21719 ?auto_21723 ) ( ON ?auto_21718 ?auto_21717 ) ( not ( = ?auto_21717 ?auto_21718 ) ) ( not ( = ?auto_21717 ?auto_21719 ) ) ( TRUCK-AT ?auto_21723 ?auto_21721 ) ( not ( = ?auto_21721 ?auto_21722 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21718 ?auto_21719 )
      ( MAKE-2CRATE-VERIFY ?auto_21717 ?auto_21718 ?auto_21719 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21724 - SURFACE
      ?auto_21725 - SURFACE
    )
    :vars
    (
      ?auto_21728 - HOIST
      ?auto_21726 - PLACE
      ?auto_21730 - SURFACE
      ?auto_21729 - TRUCK
      ?auto_21727 - PLACE
      ?auto_21731 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21728 ?auto_21726 ) ( SURFACE-AT ?auto_21724 ?auto_21726 ) ( CLEAR ?auto_21724 ) ( IS-CRATE ?auto_21725 ) ( not ( = ?auto_21724 ?auto_21725 ) ) ( AVAILABLE ?auto_21728 ) ( ON ?auto_21724 ?auto_21730 ) ( not ( = ?auto_21730 ?auto_21724 ) ) ( not ( = ?auto_21730 ?auto_21725 ) ) ( TRUCK-AT ?auto_21729 ?auto_21727 ) ( not ( = ?auto_21727 ?auto_21726 ) ) ( HOIST-AT ?auto_21731 ?auto_21727 ) ( LIFTING ?auto_21731 ?auto_21725 ) ( not ( = ?auto_21728 ?auto_21731 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21731 ?auto_21725 ?auto_21729 ?auto_21727 )
      ( MAKE-2CRATE ?auto_21730 ?auto_21724 ?auto_21725 )
      ( MAKE-1CRATE-VERIFY ?auto_21724 ?auto_21725 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21732 - SURFACE
      ?auto_21733 - SURFACE
      ?auto_21734 - SURFACE
    )
    :vars
    (
      ?auto_21736 - HOIST
      ?auto_21738 - PLACE
      ?auto_21735 - TRUCK
      ?auto_21737 - PLACE
      ?auto_21739 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21736 ?auto_21738 ) ( SURFACE-AT ?auto_21733 ?auto_21738 ) ( CLEAR ?auto_21733 ) ( IS-CRATE ?auto_21734 ) ( not ( = ?auto_21733 ?auto_21734 ) ) ( AVAILABLE ?auto_21736 ) ( ON ?auto_21733 ?auto_21732 ) ( not ( = ?auto_21732 ?auto_21733 ) ) ( not ( = ?auto_21732 ?auto_21734 ) ) ( TRUCK-AT ?auto_21735 ?auto_21737 ) ( not ( = ?auto_21737 ?auto_21738 ) ) ( HOIST-AT ?auto_21739 ?auto_21737 ) ( LIFTING ?auto_21739 ?auto_21734 ) ( not ( = ?auto_21736 ?auto_21739 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21733 ?auto_21734 )
      ( MAKE-2CRATE-VERIFY ?auto_21732 ?auto_21733 ?auto_21734 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21740 - SURFACE
      ?auto_21741 - SURFACE
    )
    :vars
    (
      ?auto_21746 - HOIST
      ?auto_21742 - PLACE
      ?auto_21747 - SURFACE
      ?auto_21743 - TRUCK
      ?auto_21745 - PLACE
      ?auto_21744 - HOIST
      ?auto_21748 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21746 ?auto_21742 ) ( SURFACE-AT ?auto_21740 ?auto_21742 ) ( CLEAR ?auto_21740 ) ( IS-CRATE ?auto_21741 ) ( not ( = ?auto_21740 ?auto_21741 ) ) ( AVAILABLE ?auto_21746 ) ( ON ?auto_21740 ?auto_21747 ) ( not ( = ?auto_21747 ?auto_21740 ) ) ( not ( = ?auto_21747 ?auto_21741 ) ) ( TRUCK-AT ?auto_21743 ?auto_21745 ) ( not ( = ?auto_21745 ?auto_21742 ) ) ( HOIST-AT ?auto_21744 ?auto_21745 ) ( not ( = ?auto_21746 ?auto_21744 ) ) ( AVAILABLE ?auto_21744 ) ( SURFACE-AT ?auto_21741 ?auto_21745 ) ( ON ?auto_21741 ?auto_21748 ) ( CLEAR ?auto_21741 ) ( not ( = ?auto_21740 ?auto_21748 ) ) ( not ( = ?auto_21741 ?auto_21748 ) ) ( not ( = ?auto_21747 ?auto_21748 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21744 ?auto_21741 ?auto_21748 ?auto_21745 )
      ( MAKE-2CRATE ?auto_21747 ?auto_21740 ?auto_21741 )
      ( MAKE-1CRATE-VERIFY ?auto_21740 ?auto_21741 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21749 - SURFACE
      ?auto_21750 - SURFACE
      ?auto_21751 - SURFACE
    )
    :vars
    (
      ?auto_21757 - HOIST
      ?auto_21755 - PLACE
      ?auto_21756 - TRUCK
      ?auto_21752 - PLACE
      ?auto_21753 - HOIST
      ?auto_21754 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21757 ?auto_21755 ) ( SURFACE-AT ?auto_21750 ?auto_21755 ) ( CLEAR ?auto_21750 ) ( IS-CRATE ?auto_21751 ) ( not ( = ?auto_21750 ?auto_21751 ) ) ( AVAILABLE ?auto_21757 ) ( ON ?auto_21750 ?auto_21749 ) ( not ( = ?auto_21749 ?auto_21750 ) ) ( not ( = ?auto_21749 ?auto_21751 ) ) ( TRUCK-AT ?auto_21756 ?auto_21752 ) ( not ( = ?auto_21752 ?auto_21755 ) ) ( HOIST-AT ?auto_21753 ?auto_21752 ) ( not ( = ?auto_21757 ?auto_21753 ) ) ( AVAILABLE ?auto_21753 ) ( SURFACE-AT ?auto_21751 ?auto_21752 ) ( ON ?auto_21751 ?auto_21754 ) ( CLEAR ?auto_21751 ) ( not ( = ?auto_21750 ?auto_21754 ) ) ( not ( = ?auto_21751 ?auto_21754 ) ) ( not ( = ?auto_21749 ?auto_21754 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21750 ?auto_21751 )
      ( MAKE-2CRATE-VERIFY ?auto_21749 ?auto_21750 ?auto_21751 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21758 - SURFACE
      ?auto_21759 - SURFACE
    )
    :vars
    (
      ?auto_21766 - HOIST
      ?auto_21762 - PLACE
      ?auto_21760 - SURFACE
      ?auto_21763 - PLACE
      ?auto_21764 - HOIST
      ?auto_21765 - SURFACE
      ?auto_21761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21766 ?auto_21762 ) ( SURFACE-AT ?auto_21758 ?auto_21762 ) ( CLEAR ?auto_21758 ) ( IS-CRATE ?auto_21759 ) ( not ( = ?auto_21758 ?auto_21759 ) ) ( AVAILABLE ?auto_21766 ) ( ON ?auto_21758 ?auto_21760 ) ( not ( = ?auto_21760 ?auto_21758 ) ) ( not ( = ?auto_21760 ?auto_21759 ) ) ( not ( = ?auto_21763 ?auto_21762 ) ) ( HOIST-AT ?auto_21764 ?auto_21763 ) ( not ( = ?auto_21766 ?auto_21764 ) ) ( AVAILABLE ?auto_21764 ) ( SURFACE-AT ?auto_21759 ?auto_21763 ) ( ON ?auto_21759 ?auto_21765 ) ( CLEAR ?auto_21759 ) ( not ( = ?auto_21758 ?auto_21765 ) ) ( not ( = ?auto_21759 ?auto_21765 ) ) ( not ( = ?auto_21760 ?auto_21765 ) ) ( TRUCK-AT ?auto_21761 ?auto_21762 ) )
    :subtasks
    ( ( !DRIVE ?auto_21761 ?auto_21762 ?auto_21763 )
      ( MAKE-2CRATE ?auto_21760 ?auto_21758 ?auto_21759 )
      ( MAKE-1CRATE-VERIFY ?auto_21758 ?auto_21759 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21767 - SURFACE
      ?auto_21768 - SURFACE
      ?auto_21769 - SURFACE
    )
    :vars
    (
      ?auto_21772 - HOIST
      ?auto_21771 - PLACE
      ?auto_21773 - PLACE
      ?auto_21775 - HOIST
      ?auto_21770 - SURFACE
      ?auto_21774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21772 ?auto_21771 ) ( SURFACE-AT ?auto_21768 ?auto_21771 ) ( CLEAR ?auto_21768 ) ( IS-CRATE ?auto_21769 ) ( not ( = ?auto_21768 ?auto_21769 ) ) ( AVAILABLE ?auto_21772 ) ( ON ?auto_21768 ?auto_21767 ) ( not ( = ?auto_21767 ?auto_21768 ) ) ( not ( = ?auto_21767 ?auto_21769 ) ) ( not ( = ?auto_21773 ?auto_21771 ) ) ( HOIST-AT ?auto_21775 ?auto_21773 ) ( not ( = ?auto_21772 ?auto_21775 ) ) ( AVAILABLE ?auto_21775 ) ( SURFACE-AT ?auto_21769 ?auto_21773 ) ( ON ?auto_21769 ?auto_21770 ) ( CLEAR ?auto_21769 ) ( not ( = ?auto_21768 ?auto_21770 ) ) ( not ( = ?auto_21769 ?auto_21770 ) ) ( not ( = ?auto_21767 ?auto_21770 ) ) ( TRUCK-AT ?auto_21774 ?auto_21771 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21768 ?auto_21769 )
      ( MAKE-2CRATE-VERIFY ?auto_21767 ?auto_21768 ?auto_21769 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21776 - SURFACE
      ?auto_21777 - SURFACE
    )
    :vars
    (
      ?auto_21780 - HOIST
      ?auto_21778 - PLACE
      ?auto_21784 - SURFACE
      ?auto_21783 - PLACE
      ?auto_21781 - HOIST
      ?auto_21782 - SURFACE
      ?auto_21779 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21780 ?auto_21778 ) ( IS-CRATE ?auto_21777 ) ( not ( = ?auto_21776 ?auto_21777 ) ) ( not ( = ?auto_21784 ?auto_21776 ) ) ( not ( = ?auto_21784 ?auto_21777 ) ) ( not ( = ?auto_21783 ?auto_21778 ) ) ( HOIST-AT ?auto_21781 ?auto_21783 ) ( not ( = ?auto_21780 ?auto_21781 ) ) ( AVAILABLE ?auto_21781 ) ( SURFACE-AT ?auto_21777 ?auto_21783 ) ( ON ?auto_21777 ?auto_21782 ) ( CLEAR ?auto_21777 ) ( not ( = ?auto_21776 ?auto_21782 ) ) ( not ( = ?auto_21777 ?auto_21782 ) ) ( not ( = ?auto_21784 ?auto_21782 ) ) ( TRUCK-AT ?auto_21779 ?auto_21778 ) ( SURFACE-AT ?auto_21784 ?auto_21778 ) ( CLEAR ?auto_21784 ) ( LIFTING ?auto_21780 ?auto_21776 ) ( IS-CRATE ?auto_21776 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21784 ?auto_21776 )
      ( MAKE-2CRATE ?auto_21784 ?auto_21776 ?auto_21777 )
      ( MAKE-1CRATE-VERIFY ?auto_21776 ?auto_21777 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21785 - SURFACE
      ?auto_21786 - SURFACE
      ?auto_21787 - SURFACE
    )
    :vars
    (
      ?auto_21790 - HOIST
      ?auto_21788 - PLACE
      ?auto_21791 - PLACE
      ?auto_21792 - HOIST
      ?auto_21789 - SURFACE
      ?auto_21793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21790 ?auto_21788 ) ( IS-CRATE ?auto_21787 ) ( not ( = ?auto_21786 ?auto_21787 ) ) ( not ( = ?auto_21785 ?auto_21786 ) ) ( not ( = ?auto_21785 ?auto_21787 ) ) ( not ( = ?auto_21791 ?auto_21788 ) ) ( HOIST-AT ?auto_21792 ?auto_21791 ) ( not ( = ?auto_21790 ?auto_21792 ) ) ( AVAILABLE ?auto_21792 ) ( SURFACE-AT ?auto_21787 ?auto_21791 ) ( ON ?auto_21787 ?auto_21789 ) ( CLEAR ?auto_21787 ) ( not ( = ?auto_21786 ?auto_21789 ) ) ( not ( = ?auto_21787 ?auto_21789 ) ) ( not ( = ?auto_21785 ?auto_21789 ) ) ( TRUCK-AT ?auto_21793 ?auto_21788 ) ( SURFACE-AT ?auto_21785 ?auto_21788 ) ( CLEAR ?auto_21785 ) ( LIFTING ?auto_21790 ?auto_21786 ) ( IS-CRATE ?auto_21786 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21786 ?auto_21787 )
      ( MAKE-2CRATE-VERIFY ?auto_21785 ?auto_21786 ?auto_21787 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21794 - SURFACE
      ?auto_21795 - SURFACE
    )
    :vars
    (
      ?auto_21797 - HOIST
      ?auto_21800 - PLACE
      ?auto_21802 - SURFACE
      ?auto_21798 - PLACE
      ?auto_21799 - HOIST
      ?auto_21796 - SURFACE
      ?auto_21801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21797 ?auto_21800 ) ( IS-CRATE ?auto_21795 ) ( not ( = ?auto_21794 ?auto_21795 ) ) ( not ( = ?auto_21802 ?auto_21794 ) ) ( not ( = ?auto_21802 ?auto_21795 ) ) ( not ( = ?auto_21798 ?auto_21800 ) ) ( HOIST-AT ?auto_21799 ?auto_21798 ) ( not ( = ?auto_21797 ?auto_21799 ) ) ( AVAILABLE ?auto_21799 ) ( SURFACE-AT ?auto_21795 ?auto_21798 ) ( ON ?auto_21795 ?auto_21796 ) ( CLEAR ?auto_21795 ) ( not ( = ?auto_21794 ?auto_21796 ) ) ( not ( = ?auto_21795 ?auto_21796 ) ) ( not ( = ?auto_21802 ?auto_21796 ) ) ( TRUCK-AT ?auto_21801 ?auto_21800 ) ( SURFACE-AT ?auto_21802 ?auto_21800 ) ( CLEAR ?auto_21802 ) ( IS-CRATE ?auto_21794 ) ( AVAILABLE ?auto_21797 ) ( IN ?auto_21794 ?auto_21801 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21797 ?auto_21794 ?auto_21801 ?auto_21800 )
      ( MAKE-2CRATE ?auto_21802 ?auto_21794 ?auto_21795 )
      ( MAKE-1CRATE-VERIFY ?auto_21794 ?auto_21795 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21803 - SURFACE
      ?auto_21804 - SURFACE
      ?auto_21805 - SURFACE
    )
    :vars
    (
      ?auto_21808 - HOIST
      ?auto_21809 - PLACE
      ?auto_21811 - PLACE
      ?auto_21806 - HOIST
      ?auto_21810 - SURFACE
      ?auto_21807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21808 ?auto_21809 ) ( IS-CRATE ?auto_21805 ) ( not ( = ?auto_21804 ?auto_21805 ) ) ( not ( = ?auto_21803 ?auto_21804 ) ) ( not ( = ?auto_21803 ?auto_21805 ) ) ( not ( = ?auto_21811 ?auto_21809 ) ) ( HOIST-AT ?auto_21806 ?auto_21811 ) ( not ( = ?auto_21808 ?auto_21806 ) ) ( AVAILABLE ?auto_21806 ) ( SURFACE-AT ?auto_21805 ?auto_21811 ) ( ON ?auto_21805 ?auto_21810 ) ( CLEAR ?auto_21805 ) ( not ( = ?auto_21804 ?auto_21810 ) ) ( not ( = ?auto_21805 ?auto_21810 ) ) ( not ( = ?auto_21803 ?auto_21810 ) ) ( TRUCK-AT ?auto_21807 ?auto_21809 ) ( SURFACE-AT ?auto_21803 ?auto_21809 ) ( CLEAR ?auto_21803 ) ( IS-CRATE ?auto_21804 ) ( AVAILABLE ?auto_21808 ) ( IN ?auto_21804 ?auto_21807 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21804 ?auto_21805 )
      ( MAKE-2CRATE-VERIFY ?auto_21803 ?auto_21804 ?auto_21805 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21848 - SURFACE
      ?auto_21849 - SURFACE
    )
    :vars
    (
      ?auto_21855 - HOIST
      ?auto_21854 - PLACE
      ?auto_21851 - SURFACE
      ?auto_21850 - PLACE
      ?auto_21852 - HOIST
      ?auto_21853 - SURFACE
      ?auto_21856 - TRUCK
      ?auto_21857 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21855 ?auto_21854 ) ( SURFACE-AT ?auto_21848 ?auto_21854 ) ( CLEAR ?auto_21848 ) ( IS-CRATE ?auto_21849 ) ( not ( = ?auto_21848 ?auto_21849 ) ) ( AVAILABLE ?auto_21855 ) ( ON ?auto_21848 ?auto_21851 ) ( not ( = ?auto_21851 ?auto_21848 ) ) ( not ( = ?auto_21851 ?auto_21849 ) ) ( not ( = ?auto_21850 ?auto_21854 ) ) ( HOIST-AT ?auto_21852 ?auto_21850 ) ( not ( = ?auto_21855 ?auto_21852 ) ) ( AVAILABLE ?auto_21852 ) ( SURFACE-AT ?auto_21849 ?auto_21850 ) ( ON ?auto_21849 ?auto_21853 ) ( CLEAR ?auto_21849 ) ( not ( = ?auto_21848 ?auto_21853 ) ) ( not ( = ?auto_21849 ?auto_21853 ) ) ( not ( = ?auto_21851 ?auto_21853 ) ) ( TRUCK-AT ?auto_21856 ?auto_21857 ) ( not ( = ?auto_21857 ?auto_21854 ) ) ( not ( = ?auto_21850 ?auto_21857 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21856 ?auto_21857 ?auto_21854 )
      ( MAKE-1CRATE ?auto_21848 ?auto_21849 )
      ( MAKE-1CRATE-VERIFY ?auto_21848 ?auto_21849 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21888 - SURFACE
      ?auto_21889 - SURFACE
      ?auto_21890 - SURFACE
      ?auto_21887 - SURFACE
    )
    :vars
    (
      ?auto_21891 - HOIST
      ?auto_21892 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21891 ?auto_21892 ) ( SURFACE-AT ?auto_21890 ?auto_21892 ) ( CLEAR ?auto_21890 ) ( LIFTING ?auto_21891 ?auto_21887 ) ( IS-CRATE ?auto_21887 ) ( not ( = ?auto_21890 ?auto_21887 ) ) ( ON ?auto_21889 ?auto_21888 ) ( ON ?auto_21890 ?auto_21889 ) ( not ( = ?auto_21888 ?auto_21889 ) ) ( not ( = ?auto_21888 ?auto_21890 ) ) ( not ( = ?auto_21888 ?auto_21887 ) ) ( not ( = ?auto_21889 ?auto_21890 ) ) ( not ( = ?auto_21889 ?auto_21887 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21890 ?auto_21887 )
      ( MAKE-3CRATE-VERIFY ?auto_21888 ?auto_21889 ?auto_21890 ?auto_21887 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21905 - SURFACE
      ?auto_21906 - SURFACE
      ?auto_21907 - SURFACE
      ?auto_21904 - SURFACE
    )
    :vars
    (
      ?auto_21908 - HOIST
      ?auto_21909 - PLACE
      ?auto_21910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21908 ?auto_21909 ) ( SURFACE-AT ?auto_21907 ?auto_21909 ) ( CLEAR ?auto_21907 ) ( IS-CRATE ?auto_21904 ) ( not ( = ?auto_21907 ?auto_21904 ) ) ( TRUCK-AT ?auto_21910 ?auto_21909 ) ( AVAILABLE ?auto_21908 ) ( IN ?auto_21904 ?auto_21910 ) ( ON ?auto_21907 ?auto_21906 ) ( not ( = ?auto_21906 ?auto_21907 ) ) ( not ( = ?auto_21906 ?auto_21904 ) ) ( ON ?auto_21906 ?auto_21905 ) ( not ( = ?auto_21905 ?auto_21906 ) ) ( not ( = ?auto_21905 ?auto_21907 ) ) ( not ( = ?auto_21905 ?auto_21904 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21906 ?auto_21907 ?auto_21904 )
      ( MAKE-3CRATE-VERIFY ?auto_21905 ?auto_21906 ?auto_21907 ?auto_21904 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21926 - SURFACE
      ?auto_21927 - SURFACE
      ?auto_21928 - SURFACE
      ?auto_21925 - SURFACE
    )
    :vars
    (
      ?auto_21929 - HOIST
      ?auto_21931 - PLACE
      ?auto_21930 - TRUCK
      ?auto_21932 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21929 ?auto_21931 ) ( SURFACE-AT ?auto_21928 ?auto_21931 ) ( CLEAR ?auto_21928 ) ( IS-CRATE ?auto_21925 ) ( not ( = ?auto_21928 ?auto_21925 ) ) ( AVAILABLE ?auto_21929 ) ( IN ?auto_21925 ?auto_21930 ) ( ON ?auto_21928 ?auto_21927 ) ( not ( = ?auto_21927 ?auto_21928 ) ) ( not ( = ?auto_21927 ?auto_21925 ) ) ( TRUCK-AT ?auto_21930 ?auto_21932 ) ( not ( = ?auto_21932 ?auto_21931 ) ) ( ON ?auto_21927 ?auto_21926 ) ( not ( = ?auto_21926 ?auto_21927 ) ) ( not ( = ?auto_21926 ?auto_21928 ) ) ( not ( = ?auto_21926 ?auto_21925 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21927 ?auto_21928 ?auto_21925 )
      ( MAKE-3CRATE-VERIFY ?auto_21926 ?auto_21927 ?auto_21928 ?auto_21925 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21950 - SURFACE
      ?auto_21951 - SURFACE
      ?auto_21952 - SURFACE
      ?auto_21949 - SURFACE
    )
    :vars
    (
      ?auto_21956 - HOIST
      ?auto_21955 - PLACE
      ?auto_21953 - TRUCK
      ?auto_21957 - PLACE
      ?auto_21954 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21956 ?auto_21955 ) ( SURFACE-AT ?auto_21952 ?auto_21955 ) ( CLEAR ?auto_21952 ) ( IS-CRATE ?auto_21949 ) ( not ( = ?auto_21952 ?auto_21949 ) ) ( AVAILABLE ?auto_21956 ) ( ON ?auto_21952 ?auto_21951 ) ( not ( = ?auto_21951 ?auto_21952 ) ) ( not ( = ?auto_21951 ?auto_21949 ) ) ( TRUCK-AT ?auto_21953 ?auto_21957 ) ( not ( = ?auto_21957 ?auto_21955 ) ) ( HOIST-AT ?auto_21954 ?auto_21957 ) ( LIFTING ?auto_21954 ?auto_21949 ) ( not ( = ?auto_21956 ?auto_21954 ) ) ( ON ?auto_21951 ?auto_21950 ) ( not ( = ?auto_21950 ?auto_21951 ) ) ( not ( = ?auto_21950 ?auto_21952 ) ) ( not ( = ?auto_21950 ?auto_21949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21951 ?auto_21952 ?auto_21949 )
      ( MAKE-3CRATE-VERIFY ?auto_21950 ?auto_21951 ?auto_21952 ?auto_21949 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21977 - SURFACE
      ?auto_21978 - SURFACE
      ?auto_21979 - SURFACE
      ?auto_21976 - SURFACE
    )
    :vars
    (
      ?auto_21981 - HOIST
      ?auto_21982 - PLACE
      ?auto_21985 - TRUCK
      ?auto_21983 - PLACE
      ?auto_21980 - HOIST
      ?auto_21984 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21981 ?auto_21982 ) ( SURFACE-AT ?auto_21979 ?auto_21982 ) ( CLEAR ?auto_21979 ) ( IS-CRATE ?auto_21976 ) ( not ( = ?auto_21979 ?auto_21976 ) ) ( AVAILABLE ?auto_21981 ) ( ON ?auto_21979 ?auto_21978 ) ( not ( = ?auto_21978 ?auto_21979 ) ) ( not ( = ?auto_21978 ?auto_21976 ) ) ( TRUCK-AT ?auto_21985 ?auto_21983 ) ( not ( = ?auto_21983 ?auto_21982 ) ) ( HOIST-AT ?auto_21980 ?auto_21983 ) ( not ( = ?auto_21981 ?auto_21980 ) ) ( AVAILABLE ?auto_21980 ) ( SURFACE-AT ?auto_21976 ?auto_21983 ) ( ON ?auto_21976 ?auto_21984 ) ( CLEAR ?auto_21976 ) ( not ( = ?auto_21979 ?auto_21984 ) ) ( not ( = ?auto_21976 ?auto_21984 ) ) ( not ( = ?auto_21978 ?auto_21984 ) ) ( ON ?auto_21978 ?auto_21977 ) ( not ( = ?auto_21977 ?auto_21978 ) ) ( not ( = ?auto_21977 ?auto_21979 ) ) ( not ( = ?auto_21977 ?auto_21976 ) ) ( not ( = ?auto_21977 ?auto_21984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21978 ?auto_21979 ?auto_21976 )
      ( MAKE-3CRATE-VERIFY ?auto_21977 ?auto_21978 ?auto_21979 ?auto_21976 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22005 - SURFACE
      ?auto_22006 - SURFACE
      ?auto_22007 - SURFACE
      ?auto_22004 - SURFACE
    )
    :vars
    (
      ?auto_22008 - HOIST
      ?auto_22009 - PLACE
      ?auto_22010 - PLACE
      ?auto_22011 - HOIST
      ?auto_22012 - SURFACE
      ?auto_22013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22008 ?auto_22009 ) ( SURFACE-AT ?auto_22007 ?auto_22009 ) ( CLEAR ?auto_22007 ) ( IS-CRATE ?auto_22004 ) ( not ( = ?auto_22007 ?auto_22004 ) ) ( AVAILABLE ?auto_22008 ) ( ON ?auto_22007 ?auto_22006 ) ( not ( = ?auto_22006 ?auto_22007 ) ) ( not ( = ?auto_22006 ?auto_22004 ) ) ( not ( = ?auto_22010 ?auto_22009 ) ) ( HOIST-AT ?auto_22011 ?auto_22010 ) ( not ( = ?auto_22008 ?auto_22011 ) ) ( AVAILABLE ?auto_22011 ) ( SURFACE-AT ?auto_22004 ?auto_22010 ) ( ON ?auto_22004 ?auto_22012 ) ( CLEAR ?auto_22004 ) ( not ( = ?auto_22007 ?auto_22012 ) ) ( not ( = ?auto_22004 ?auto_22012 ) ) ( not ( = ?auto_22006 ?auto_22012 ) ) ( TRUCK-AT ?auto_22013 ?auto_22009 ) ( ON ?auto_22006 ?auto_22005 ) ( not ( = ?auto_22005 ?auto_22006 ) ) ( not ( = ?auto_22005 ?auto_22007 ) ) ( not ( = ?auto_22005 ?auto_22004 ) ) ( not ( = ?auto_22005 ?auto_22012 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22006 ?auto_22007 ?auto_22004 )
      ( MAKE-3CRATE-VERIFY ?auto_22005 ?auto_22006 ?auto_22007 ?auto_22004 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22033 - SURFACE
      ?auto_22034 - SURFACE
      ?auto_22035 - SURFACE
      ?auto_22032 - SURFACE
    )
    :vars
    (
      ?auto_22037 - HOIST
      ?auto_22041 - PLACE
      ?auto_22039 - PLACE
      ?auto_22036 - HOIST
      ?auto_22038 - SURFACE
      ?auto_22040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22037 ?auto_22041 ) ( IS-CRATE ?auto_22032 ) ( not ( = ?auto_22035 ?auto_22032 ) ) ( not ( = ?auto_22034 ?auto_22035 ) ) ( not ( = ?auto_22034 ?auto_22032 ) ) ( not ( = ?auto_22039 ?auto_22041 ) ) ( HOIST-AT ?auto_22036 ?auto_22039 ) ( not ( = ?auto_22037 ?auto_22036 ) ) ( AVAILABLE ?auto_22036 ) ( SURFACE-AT ?auto_22032 ?auto_22039 ) ( ON ?auto_22032 ?auto_22038 ) ( CLEAR ?auto_22032 ) ( not ( = ?auto_22035 ?auto_22038 ) ) ( not ( = ?auto_22032 ?auto_22038 ) ) ( not ( = ?auto_22034 ?auto_22038 ) ) ( TRUCK-AT ?auto_22040 ?auto_22041 ) ( SURFACE-AT ?auto_22034 ?auto_22041 ) ( CLEAR ?auto_22034 ) ( LIFTING ?auto_22037 ?auto_22035 ) ( IS-CRATE ?auto_22035 ) ( ON ?auto_22034 ?auto_22033 ) ( not ( = ?auto_22033 ?auto_22034 ) ) ( not ( = ?auto_22033 ?auto_22035 ) ) ( not ( = ?auto_22033 ?auto_22032 ) ) ( not ( = ?auto_22033 ?auto_22038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22034 ?auto_22035 ?auto_22032 )
      ( MAKE-3CRATE-VERIFY ?auto_22033 ?auto_22034 ?auto_22035 ?auto_22032 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22061 - SURFACE
      ?auto_22062 - SURFACE
      ?auto_22063 - SURFACE
      ?auto_22060 - SURFACE
    )
    :vars
    (
      ?auto_22066 - HOIST
      ?auto_22065 - PLACE
      ?auto_22068 - PLACE
      ?auto_22067 - HOIST
      ?auto_22069 - SURFACE
      ?auto_22064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22066 ?auto_22065 ) ( IS-CRATE ?auto_22060 ) ( not ( = ?auto_22063 ?auto_22060 ) ) ( not ( = ?auto_22062 ?auto_22063 ) ) ( not ( = ?auto_22062 ?auto_22060 ) ) ( not ( = ?auto_22068 ?auto_22065 ) ) ( HOIST-AT ?auto_22067 ?auto_22068 ) ( not ( = ?auto_22066 ?auto_22067 ) ) ( AVAILABLE ?auto_22067 ) ( SURFACE-AT ?auto_22060 ?auto_22068 ) ( ON ?auto_22060 ?auto_22069 ) ( CLEAR ?auto_22060 ) ( not ( = ?auto_22063 ?auto_22069 ) ) ( not ( = ?auto_22060 ?auto_22069 ) ) ( not ( = ?auto_22062 ?auto_22069 ) ) ( TRUCK-AT ?auto_22064 ?auto_22065 ) ( SURFACE-AT ?auto_22062 ?auto_22065 ) ( CLEAR ?auto_22062 ) ( IS-CRATE ?auto_22063 ) ( AVAILABLE ?auto_22066 ) ( IN ?auto_22063 ?auto_22064 ) ( ON ?auto_22062 ?auto_22061 ) ( not ( = ?auto_22061 ?auto_22062 ) ) ( not ( = ?auto_22061 ?auto_22063 ) ) ( not ( = ?auto_22061 ?auto_22060 ) ) ( not ( = ?auto_22061 ?auto_22069 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22062 ?auto_22063 ?auto_22060 )
      ( MAKE-3CRATE-VERIFY ?auto_22061 ?auto_22062 ?auto_22063 ?auto_22060 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22070 - SURFACE
      ?auto_22071 - SURFACE
    )
    :vars
    (
      ?auto_22074 - HOIST
      ?auto_22073 - PLACE
      ?auto_22075 - SURFACE
      ?auto_22077 - PLACE
      ?auto_22076 - HOIST
      ?auto_22078 - SURFACE
      ?auto_22072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22074 ?auto_22073 ) ( IS-CRATE ?auto_22071 ) ( not ( = ?auto_22070 ?auto_22071 ) ) ( not ( = ?auto_22075 ?auto_22070 ) ) ( not ( = ?auto_22075 ?auto_22071 ) ) ( not ( = ?auto_22077 ?auto_22073 ) ) ( HOIST-AT ?auto_22076 ?auto_22077 ) ( not ( = ?auto_22074 ?auto_22076 ) ) ( AVAILABLE ?auto_22076 ) ( SURFACE-AT ?auto_22071 ?auto_22077 ) ( ON ?auto_22071 ?auto_22078 ) ( CLEAR ?auto_22071 ) ( not ( = ?auto_22070 ?auto_22078 ) ) ( not ( = ?auto_22071 ?auto_22078 ) ) ( not ( = ?auto_22075 ?auto_22078 ) ) ( SURFACE-AT ?auto_22075 ?auto_22073 ) ( CLEAR ?auto_22075 ) ( IS-CRATE ?auto_22070 ) ( AVAILABLE ?auto_22074 ) ( IN ?auto_22070 ?auto_22072 ) ( TRUCK-AT ?auto_22072 ?auto_22077 ) )
    :subtasks
    ( ( !DRIVE ?auto_22072 ?auto_22077 ?auto_22073 )
      ( MAKE-2CRATE ?auto_22075 ?auto_22070 ?auto_22071 )
      ( MAKE-1CRATE-VERIFY ?auto_22070 ?auto_22071 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22079 - SURFACE
      ?auto_22080 - SURFACE
      ?auto_22081 - SURFACE
    )
    :vars
    (
      ?auto_22086 - HOIST
      ?auto_22085 - PLACE
      ?auto_22082 - PLACE
      ?auto_22084 - HOIST
      ?auto_22083 - SURFACE
      ?auto_22087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22086 ?auto_22085 ) ( IS-CRATE ?auto_22081 ) ( not ( = ?auto_22080 ?auto_22081 ) ) ( not ( = ?auto_22079 ?auto_22080 ) ) ( not ( = ?auto_22079 ?auto_22081 ) ) ( not ( = ?auto_22082 ?auto_22085 ) ) ( HOIST-AT ?auto_22084 ?auto_22082 ) ( not ( = ?auto_22086 ?auto_22084 ) ) ( AVAILABLE ?auto_22084 ) ( SURFACE-AT ?auto_22081 ?auto_22082 ) ( ON ?auto_22081 ?auto_22083 ) ( CLEAR ?auto_22081 ) ( not ( = ?auto_22080 ?auto_22083 ) ) ( not ( = ?auto_22081 ?auto_22083 ) ) ( not ( = ?auto_22079 ?auto_22083 ) ) ( SURFACE-AT ?auto_22079 ?auto_22085 ) ( CLEAR ?auto_22079 ) ( IS-CRATE ?auto_22080 ) ( AVAILABLE ?auto_22086 ) ( IN ?auto_22080 ?auto_22087 ) ( TRUCK-AT ?auto_22087 ?auto_22082 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22080 ?auto_22081 )
      ( MAKE-2CRATE-VERIFY ?auto_22079 ?auto_22080 ?auto_22081 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22089 - SURFACE
      ?auto_22090 - SURFACE
      ?auto_22091 - SURFACE
      ?auto_22088 - SURFACE
    )
    :vars
    (
      ?auto_22097 - HOIST
      ?auto_22095 - PLACE
      ?auto_22096 - PLACE
      ?auto_22092 - HOIST
      ?auto_22093 - SURFACE
      ?auto_22094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22097 ?auto_22095 ) ( IS-CRATE ?auto_22088 ) ( not ( = ?auto_22091 ?auto_22088 ) ) ( not ( = ?auto_22090 ?auto_22091 ) ) ( not ( = ?auto_22090 ?auto_22088 ) ) ( not ( = ?auto_22096 ?auto_22095 ) ) ( HOIST-AT ?auto_22092 ?auto_22096 ) ( not ( = ?auto_22097 ?auto_22092 ) ) ( AVAILABLE ?auto_22092 ) ( SURFACE-AT ?auto_22088 ?auto_22096 ) ( ON ?auto_22088 ?auto_22093 ) ( CLEAR ?auto_22088 ) ( not ( = ?auto_22091 ?auto_22093 ) ) ( not ( = ?auto_22088 ?auto_22093 ) ) ( not ( = ?auto_22090 ?auto_22093 ) ) ( SURFACE-AT ?auto_22090 ?auto_22095 ) ( CLEAR ?auto_22090 ) ( IS-CRATE ?auto_22091 ) ( AVAILABLE ?auto_22097 ) ( IN ?auto_22091 ?auto_22094 ) ( TRUCK-AT ?auto_22094 ?auto_22096 ) ( ON ?auto_22090 ?auto_22089 ) ( not ( = ?auto_22089 ?auto_22090 ) ) ( not ( = ?auto_22089 ?auto_22091 ) ) ( not ( = ?auto_22089 ?auto_22088 ) ) ( not ( = ?auto_22089 ?auto_22093 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22090 ?auto_22091 ?auto_22088 )
      ( MAKE-3CRATE-VERIFY ?auto_22089 ?auto_22090 ?auto_22091 ?auto_22088 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22098 - SURFACE
      ?auto_22099 - SURFACE
    )
    :vars
    (
      ?auto_22105 - HOIST
      ?auto_22103 - PLACE
      ?auto_22106 - SURFACE
      ?auto_22104 - PLACE
      ?auto_22100 - HOIST
      ?auto_22101 - SURFACE
      ?auto_22102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22105 ?auto_22103 ) ( IS-CRATE ?auto_22099 ) ( not ( = ?auto_22098 ?auto_22099 ) ) ( not ( = ?auto_22106 ?auto_22098 ) ) ( not ( = ?auto_22106 ?auto_22099 ) ) ( not ( = ?auto_22104 ?auto_22103 ) ) ( HOIST-AT ?auto_22100 ?auto_22104 ) ( not ( = ?auto_22105 ?auto_22100 ) ) ( SURFACE-AT ?auto_22099 ?auto_22104 ) ( ON ?auto_22099 ?auto_22101 ) ( CLEAR ?auto_22099 ) ( not ( = ?auto_22098 ?auto_22101 ) ) ( not ( = ?auto_22099 ?auto_22101 ) ) ( not ( = ?auto_22106 ?auto_22101 ) ) ( SURFACE-AT ?auto_22106 ?auto_22103 ) ( CLEAR ?auto_22106 ) ( IS-CRATE ?auto_22098 ) ( AVAILABLE ?auto_22105 ) ( TRUCK-AT ?auto_22102 ?auto_22104 ) ( LIFTING ?auto_22100 ?auto_22098 ) )
    :subtasks
    ( ( !LOAD ?auto_22100 ?auto_22098 ?auto_22102 ?auto_22104 )
      ( MAKE-2CRATE ?auto_22106 ?auto_22098 ?auto_22099 )
      ( MAKE-1CRATE-VERIFY ?auto_22098 ?auto_22099 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22107 - SURFACE
      ?auto_22108 - SURFACE
      ?auto_22109 - SURFACE
    )
    :vars
    (
      ?auto_22115 - HOIST
      ?auto_22113 - PLACE
      ?auto_22111 - PLACE
      ?auto_22114 - HOIST
      ?auto_22112 - SURFACE
      ?auto_22110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22115 ?auto_22113 ) ( IS-CRATE ?auto_22109 ) ( not ( = ?auto_22108 ?auto_22109 ) ) ( not ( = ?auto_22107 ?auto_22108 ) ) ( not ( = ?auto_22107 ?auto_22109 ) ) ( not ( = ?auto_22111 ?auto_22113 ) ) ( HOIST-AT ?auto_22114 ?auto_22111 ) ( not ( = ?auto_22115 ?auto_22114 ) ) ( SURFACE-AT ?auto_22109 ?auto_22111 ) ( ON ?auto_22109 ?auto_22112 ) ( CLEAR ?auto_22109 ) ( not ( = ?auto_22108 ?auto_22112 ) ) ( not ( = ?auto_22109 ?auto_22112 ) ) ( not ( = ?auto_22107 ?auto_22112 ) ) ( SURFACE-AT ?auto_22107 ?auto_22113 ) ( CLEAR ?auto_22107 ) ( IS-CRATE ?auto_22108 ) ( AVAILABLE ?auto_22115 ) ( TRUCK-AT ?auto_22110 ?auto_22111 ) ( LIFTING ?auto_22114 ?auto_22108 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22108 ?auto_22109 )
      ( MAKE-2CRATE-VERIFY ?auto_22107 ?auto_22108 ?auto_22109 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22117 - SURFACE
      ?auto_22118 - SURFACE
      ?auto_22119 - SURFACE
      ?auto_22116 - SURFACE
    )
    :vars
    (
      ?auto_22122 - HOIST
      ?auto_22121 - PLACE
      ?auto_22120 - PLACE
      ?auto_22125 - HOIST
      ?auto_22123 - SURFACE
      ?auto_22124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22122 ?auto_22121 ) ( IS-CRATE ?auto_22116 ) ( not ( = ?auto_22119 ?auto_22116 ) ) ( not ( = ?auto_22118 ?auto_22119 ) ) ( not ( = ?auto_22118 ?auto_22116 ) ) ( not ( = ?auto_22120 ?auto_22121 ) ) ( HOIST-AT ?auto_22125 ?auto_22120 ) ( not ( = ?auto_22122 ?auto_22125 ) ) ( SURFACE-AT ?auto_22116 ?auto_22120 ) ( ON ?auto_22116 ?auto_22123 ) ( CLEAR ?auto_22116 ) ( not ( = ?auto_22119 ?auto_22123 ) ) ( not ( = ?auto_22116 ?auto_22123 ) ) ( not ( = ?auto_22118 ?auto_22123 ) ) ( SURFACE-AT ?auto_22118 ?auto_22121 ) ( CLEAR ?auto_22118 ) ( IS-CRATE ?auto_22119 ) ( AVAILABLE ?auto_22122 ) ( TRUCK-AT ?auto_22124 ?auto_22120 ) ( LIFTING ?auto_22125 ?auto_22119 ) ( ON ?auto_22118 ?auto_22117 ) ( not ( = ?auto_22117 ?auto_22118 ) ) ( not ( = ?auto_22117 ?auto_22119 ) ) ( not ( = ?auto_22117 ?auto_22116 ) ) ( not ( = ?auto_22117 ?auto_22123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22118 ?auto_22119 ?auto_22116 )
      ( MAKE-3CRATE-VERIFY ?auto_22117 ?auto_22118 ?auto_22119 ?auto_22116 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22126 - SURFACE
      ?auto_22127 - SURFACE
    )
    :vars
    (
      ?auto_22130 - HOIST
      ?auto_22129 - PLACE
      ?auto_22133 - SURFACE
      ?auto_22128 - PLACE
      ?auto_22134 - HOIST
      ?auto_22131 - SURFACE
      ?auto_22132 - TRUCK
      ?auto_22135 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22130 ?auto_22129 ) ( IS-CRATE ?auto_22127 ) ( not ( = ?auto_22126 ?auto_22127 ) ) ( not ( = ?auto_22133 ?auto_22126 ) ) ( not ( = ?auto_22133 ?auto_22127 ) ) ( not ( = ?auto_22128 ?auto_22129 ) ) ( HOIST-AT ?auto_22134 ?auto_22128 ) ( not ( = ?auto_22130 ?auto_22134 ) ) ( SURFACE-AT ?auto_22127 ?auto_22128 ) ( ON ?auto_22127 ?auto_22131 ) ( CLEAR ?auto_22127 ) ( not ( = ?auto_22126 ?auto_22131 ) ) ( not ( = ?auto_22127 ?auto_22131 ) ) ( not ( = ?auto_22133 ?auto_22131 ) ) ( SURFACE-AT ?auto_22133 ?auto_22129 ) ( CLEAR ?auto_22133 ) ( IS-CRATE ?auto_22126 ) ( AVAILABLE ?auto_22130 ) ( TRUCK-AT ?auto_22132 ?auto_22128 ) ( AVAILABLE ?auto_22134 ) ( SURFACE-AT ?auto_22126 ?auto_22128 ) ( ON ?auto_22126 ?auto_22135 ) ( CLEAR ?auto_22126 ) ( not ( = ?auto_22126 ?auto_22135 ) ) ( not ( = ?auto_22127 ?auto_22135 ) ) ( not ( = ?auto_22133 ?auto_22135 ) ) ( not ( = ?auto_22131 ?auto_22135 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22134 ?auto_22126 ?auto_22135 ?auto_22128 )
      ( MAKE-2CRATE ?auto_22133 ?auto_22126 ?auto_22127 )
      ( MAKE-1CRATE-VERIFY ?auto_22126 ?auto_22127 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22136 - SURFACE
      ?auto_22137 - SURFACE
      ?auto_22138 - SURFACE
    )
    :vars
    (
      ?auto_22145 - HOIST
      ?auto_22143 - PLACE
      ?auto_22141 - PLACE
      ?auto_22139 - HOIST
      ?auto_22140 - SURFACE
      ?auto_22142 - TRUCK
      ?auto_22144 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22145 ?auto_22143 ) ( IS-CRATE ?auto_22138 ) ( not ( = ?auto_22137 ?auto_22138 ) ) ( not ( = ?auto_22136 ?auto_22137 ) ) ( not ( = ?auto_22136 ?auto_22138 ) ) ( not ( = ?auto_22141 ?auto_22143 ) ) ( HOIST-AT ?auto_22139 ?auto_22141 ) ( not ( = ?auto_22145 ?auto_22139 ) ) ( SURFACE-AT ?auto_22138 ?auto_22141 ) ( ON ?auto_22138 ?auto_22140 ) ( CLEAR ?auto_22138 ) ( not ( = ?auto_22137 ?auto_22140 ) ) ( not ( = ?auto_22138 ?auto_22140 ) ) ( not ( = ?auto_22136 ?auto_22140 ) ) ( SURFACE-AT ?auto_22136 ?auto_22143 ) ( CLEAR ?auto_22136 ) ( IS-CRATE ?auto_22137 ) ( AVAILABLE ?auto_22145 ) ( TRUCK-AT ?auto_22142 ?auto_22141 ) ( AVAILABLE ?auto_22139 ) ( SURFACE-AT ?auto_22137 ?auto_22141 ) ( ON ?auto_22137 ?auto_22144 ) ( CLEAR ?auto_22137 ) ( not ( = ?auto_22137 ?auto_22144 ) ) ( not ( = ?auto_22138 ?auto_22144 ) ) ( not ( = ?auto_22136 ?auto_22144 ) ) ( not ( = ?auto_22140 ?auto_22144 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22137 ?auto_22138 )
      ( MAKE-2CRATE-VERIFY ?auto_22136 ?auto_22137 ?auto_22138 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22147 - SURFACE
      ?auto_22148 - SURFACE
      ?auto_22149 - SURFACE
      ?auto_22146 - SURFACE
    )
    :vars
    (
      ?auto_22154 - HOIST
      ?auto_22155 - PLACE
      ?auto_22156 - PLACE
      ?auto_22150 - HOIST
      ?auto_22153 - SURFACE
      ?auto_22151 - TRUCK
      ?auto_22152 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22154 ?auto_22155 ) ( IS-CRATE ?auto_22146 ) ( not ( = ?auto_22149 ?auto_22146 ) ) ( not ( = ?auto_22148 ?auto_22149 ) ) ( not ( = ?auto_22148 ?auto_22146 ) ) ( not ( = ?auto_22156 ?auto_22155 ) ) ( HOIST-AT ?auto_22150 ?auto_22156 ) ( not ( = ?auto_22154 ?auto_22150 ) ) ( SURFACE-AT ?auto_22146 ?auto_22156 ) ( ON ?auto_22146 ?auto_22153 ) ( CLEAR ?auto_22146 ) ( not ( = ?auto_22149 ?auto_22153 ) ) ( not ( = ?auto_22146 ?auto_22153 ) ) ( not ( = ?auto_22148 ?auto_22153 ) ) ( SURFACE-AT ?auto_22148 ?auto_22155 ) ( CLEAR ?auto_22148 ) ( IS-CRATE ?auto_22149 ) ( AVAILABLE ?auto_22154 ) ( TRUCK-AT ?auto_22151 ?auto_22156 ) ( AVAILABLE ?auto_22150 ) ( SURFACE-AT ?auto_22149 ?auto_22156 ) ( ON ?auto_22149 ?auto_22152 ) ( CLEAR ?auto_22149 ) ( not ( = ?auto_22149 ?auto_22152 ) ) ( not ( = ?auto_22146 ?auto_22152 ) ) ( not ( = ?auto_22148 ?auto_22152 ) ) ( not ( = ?auto_22153 ?auto_22152 ) ) ( ON ?auto_22148 ?auto_22147 ) ( not ( = ?auto_22147 ?auto_22148 ) ) ( not ( = ?auto_22147 ?auto_22149 ) ) ( not ( = ?auto_22147 ?auto_22146 ) ) ( not ( = ?auto_22147 ?auto_22153 ) ) ( not ( = ?auto_22147 ?auto_22152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22148 ?auto_22149 ?auto_22146 )
      ( MAKE-3CRATE-VERIFY ?auto_22147 ?auto_22148 ?auto_22149 ?auto_22146 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22157 - SURFACE
      ?auto_22158 - SURFACE
    )
    :vars
    (
      ?auto_22163 - HOIST
      ?auto_22164 - PLACE
      ?auto_22166 - SURFACE
      ?auto_22165 - PLACE
      ?auto_22159 - HOIST
      ?auto_22162 - SURFACE
      ?auto_22161 - SURFACE
      ?auto_22160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22163 ?auto_22164 ) ( IS-CRATE ?auto_22158 ) ( not ( = ?auto_22157 ?auto_22158 ) ) ( not ( = ?auto_22166 ?auto_22157 ) ) ( not ( = ?auto_22166 ?auto_22158 ) ) ( not ( = ?auto_22165 ?auto_22164 ) ) ( HOIST-AT ?auto_22159 ?auto_22165 ) ( not ( = ?auto_22163 ?auto_22159 ) ) ( SURFACE-AT ?auto_22158 ?auto_22165 ) ( ON ?auto_22158 ?auto_22162 ) ( CLEAR ?auto_22158 ) ( not ( = ?auto_22157 ?auto_22162 ) ) ( not ( = ?auto_22158 ?auto_22162 ) ) ( not ( = ?auto_22166 ?auto_22162 ) ) ( SURFACE-AT ?auto_22166 ?auto_22164 ) ( CLEAR ?auto_22166 ) ( IS-CRATE ?auto_22157 ) ( AVAILABLE ?auto_22163 ) ( AVAILABLE ?auto_22159 ) ( SURFACE-AT ?auto_22157 ?auto_22165 ) ( ON ?auto_22157 ?auto_22161 ) ( CLEAR ?auto_22157 ) ( not ( = ?auto_22157 ?auto_22161 ) ) ( not ( = ?auto_22158 ?auto_22161 ) ) ( not ( = ?auto_22166 ?auto_22161 ) ) ( not ( = ?auto_22162 ?auto_22161 ) ) ( TRUCK-AT ?auto_22160 ?auto_22164 ) )
    :subtasks
    ( ( !DRIVE ?auto_22160 ?auto_22164 ?auto_22165 )
      ( MAKE-2CRATE ?auto_22166 ?auto_22157 ?auto_22158 )
      ( MAKE-1CRATE-VERIFY ?auto_22157 ?auto_22158 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22167 - SURFACE
      ?auto_22168 - SURFACE
      ?auto_22169 - SURFACE
    )
    :vars
    (
      ?auto_22172 - HOIST
      ?auto_22173 - PLACE
      ?auto_22175 - PLACE
      ?auto_22171 - HOIST
      ?auto_22176 - SURFACE
      ?auto_22170 - SURFACE
      ?auto_22174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22172 ?auto_22173 ) ( IS-CRATE ?auto_22169 ) ( not ( = ?auto_22168 ?auto_22169 ) ) ( not ( = ?auto_22167 ?auto_22168 ) ) ( not ( = ?auto_22167 ?auto_22169 ) ) ( not ( = ?auto_22175 ?auto_22173 ) ) ( HOIST-AT ?auto_22171 ?auto_22175 ) ( not ( = ?auto_22172 ?auto_22171 ) ) ( SURFACE-AT ?auto_22169 ?auto_22175 ) ( ON ?auto_22169 ?auto_22176 ) ( CLEAR ?auto_22169 ) ( not ( = ?auto_22168 ?auto_22176 ) ) ( not ( = ?auto_22169 ?auto_22176 ) ) ( not ( = ?auto_22167 ?auto_22176 ) ) ( SURFACE-AT ?auto_22167 ?auto_22173 ) ( CLEAR ?auto_22167 ) ( IS-CRATE ?auto_22168 ) ( AVAILABLE ?auto_22172 ) ( AVAILABLE ?auto_22171 ) ( SURFACE-AT ?auto_22168 ?auto_22175 ) ( ON ?auto_22168 ?auto_22170 ) ( CLEAR ?auto_22168 ) ( not ( = ?auto_22168 ?auto_22170 ) ) ( not ( = ?auto_22169 ?auto_22170 ) ) ( not ( = ?auto_22167 ?auto_22170 ) ) ( not ( = ?auto_22176 ?auto_22170 ) ) ( TRUCK-AT ?auto_22174 ?auto_22173 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22168 ?auto_22169 )
      ( MAKE-2CRATE-VERIFY ?auto_22167 ?auto_22168 ?auto_22169 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22178 - SURFACE
      ?auto_22179 - SURFACE
      ?auto_22180 - SURFACE
      ?auto_22177 - SURFACE
    )
    :vars
    (
      ?auto_22182 - HOIST
      ?auto_22183 - PLACE
      ?auto_22181 - PLACE
      ?auto_22186 - HOIST
      ?auto_22184 - SURFACE
      ?auto_22185 - SURFACE
      ?auto_22187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22182 ?auto_22183 ) ( IS-CRATE ?auto_22177 ) ( not ( = ?auto_22180 ?auto_22177 ) ) ( not ( = ?auto_22179 ?auto_22180 ) ) ( not ( = ?auto_22179 ?auto_22177 ) ) ( not ( = ?auto_22181 ?auto_22183 ) ) ( HOIST-AT ?auto_22186 ?auto_22181 ) ( not ( = ?auto_22182 ?auto_22186 ) ) ( SURFACE-AT ?auto_22177 ?auto_22181 ) ( ON ?auto_22177 ?auto_22184 ) ( CLEAR ?auto_22177 ) ( not ( = ?auto_22180 ?auto_22184 ) ) ( not ( = ?auto_22177 ?auto_22184 ) ) ( not ( = ?auto_22179 ?auto_22184 ) ) ( SURFACE-AT ?auto_22179 ?auto_22183 ) ( CLEAR ?auto_22179 ) ( IS-CRATE ?auto_22180 ) ( AVAILABLE ?auto_22182 ) ( AVAILABLE ?auto_22186 ) ( SURFACE-AT ?auto_22180 ?auto_22181 ) ( ON ?auto_22180 ?auto_22185 ) ( CLEAR ?auto_22180 ) ( not ( = ?auto_22180 ?auto_22185 ) ) ( not ( = ?auto_22177 ?auto_22185 ) ) ( not ( = ?auto_22179 ?auto_22185 ) ) ( not ( = ?auto_22184 ?auto_22185 ) ) ( TRUCK-AT ?auto_22187 ?auto_22183 ) ( ON ?auto_22179 ?auto_22178 ) ( not ( = ?auto_22178 ?auto_22179 ) ) ( not ( = ?auto_22178 ?auto_22180 ) ) ( not ( = ?auto_22178 ?auto_22177 ) ) ( not ( = ?auto_22178 ?auto_22184 ) ) ( not ( = ?auto_22178 ?auto_22185 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22179 ?auto_22180 ?auto_22177 )
      ( MAKE-3CRATE-VERIFY ?auto_22178 ?auto_22179 ?auto_22180 ?auto_22177 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22188 - SURFACE
      ?auto_22189 - SURFACE
    )
    :vars
    (
      ?auto_22191 - HOIST
      ?auto_22192 - PLACE
      ?auto_22195 - SURFACE
      ?auto_22190 - PLACE
      ?auto_22196 - HOIST
      ?auto_22193 - SURFACE
      ?auto_22194 - SURFACE
      ?auto_22197 - TRUCK
      ?auto_22198 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22191 ?auto_22192 ) ( IS-CRATE ?auto_22189 ) ( not ( = ?auto_22188 ?auto_22189 ) ) ( not ( = ?auto_22195 ?auto_22188 ) ) ( not ( = ?auto_22195 ?auto_22189 ) ) ( not ( = ?auto_22190 ?auto_22192 ) ) ( HOIST-AT ?auto_22196 ?auto_22190 ) ( not ( = ?auto_22191 ?auto_22196 ) ) ( SURFACE-AT ?auto_22189 ?auto_22190 ) ( ON ?auto_22189 ?auto_22193 ) ( CLEAR ?auto_22189 ) ( not ( = ?auto_22188 ?auto_22193 ) ) ( not ( = ?auto_22189 ?auto_22193 ) ) ( not ( = ?auto_22195 ?auto_22193 ) ) ( IS-CRATE ?auto_22188 ) ( AVAILABLE ?auto_22196 ) ( SURFACE-AT ?auto_22188 ?auto_22190 ) ( ON ?auto_22188 ?auto_22194 ) ( CLEAR ?auto_22188 ) ( not ( = ?auto_22188 ?auto_22194 ) ) ( not ( = ?auto_22189 ?auto_22194 ) ) ( not ( = ?auto_22195 ?auto_22194 ) ) ( not ( = ?auto_22193 ?auto_22194 ) ) ( TRUCK-AT ?auto_22197 ?auto_22192 ) ( SURFACE-AT ?auto_22198 ?auto_22192 ) ( CLEAR ?auto_22198 ) ( LIFTING ?auto_22191 ?auto_22195 ) ( IS-CRATE ?auto_22195 ) ( not ( = ?auto_22198 ?auto_22195 ) ) ( not ( = ?auto_22188 ?auto_22198 ) ) ( not ( = ?auto_22189 ?auto_22198 ) ) ( not ( = ?auto_22193 ?auto_22198 ) ) ( not ( = ?auto_22194 ?auto_22198 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22198 ?auto_22195 )
      ( MAKE-2CRATE ?auto_22195 ?auto_22188 ?auto_22189 )
      ( MAKE-1CRATE-VERIFY ?auto_22188 ?auto_22189 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22199 - SURFACE
      ?auto_22200 - SURFACE
      ?auto_22201 - SURFACE
    )
    :vars
    (
      ?auto_22204 - HOIST
      ?auto_22203 - PLACE
      ?auto_22209 - PLACE
      ?auto_22208 - HOIST
      ?auto_22206 - SURFACE
      ?auto_22205 - SURFACE
      ?auto_22202 - TRUCK
      ?auto_22207 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22204 ?auto_22203 ) ( IS-CRATE ?auto_22201 ) ( not ( = ?auto_22200 ?auto_22201 ) ) ( not ( = ?auto_22199 ?auto_22200 ) ) ( not ( = ?auto_22199 ?auto_22201 ) ) ( not ( = ?auto_22209 ?auto_22203 ) ) ( HOIST-AT ?auto_22208 ?auto_22209 ) ( not ( = ?auto_22204 ?auto_22208 ) ) ( SURFACE-AT ?auto_22201 ?auto_22209 ) ( ON ?auto_22201 ?auto_22206 ) ( CLEAR ?auto_22201 ) ( not ( = ?auto_22200 ?auto_22206 ) ) ( not ( = ?auto_22201 ?auto_22206 ) ) ( not ( = ?auto_22199 ?auto_22206 ) ) ( IS-CRATE ?auto_22200 ) ( AVAILABLE ?auto_22208 ) ( SURFACE-AT ?auto_22200 ?auto_22209 ) ( ON ?auto_22200 ?auto_22205 ) ( CLEAR ?auto_22200 ) ( not ( = ?auto_22200 ?auto_22205 ) ) ( not ( = ?auto_22201 ?auto_22205 ) ) ( not ( = ?auto_22199 ?auto_22205 ) ) ( not ( = ?auto_22206 ?auto_22205 ) ) ( TRUCK-AT ?auto_22202 ?auto_22203 ) ( SURFACE-AT ?auto_22207 ?auto_22203 ) ( CLEAR ?auto_22207 ) ( LIFTING ?auto_22204 ?auto_22199 ) ( IS-CRATE ?auto_22199 ) ( not ( = ?auto_22207 ?auto_22199 ) ) ( not ( = ?auto_22200 ?auto_22207 ) ) ( not ( = ?auto_22201 ?auto_22207 ) ) ( not ( = ?auto_22206 ?auto_22207 ) ) ( not ( = ?auto_22205 ?auto_22207 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22200 ?auto_22201 )
      ( MAKE-2CRATE-VERIFY ?auto_22199 ?auto_22200 ?auto_22201 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22211 - SURFACE
      ?auto_22212 - SURFACE
      ?auto_22213 - SURFACE
      ?auto_22210 - SURFACE
    )
    :vars
    (
      ?auto_22215 - HOIST
      ?auto_22217 - PLACE
      ?auto_22218 - PLACE
      ?auto_22219 - HOIST
      ?auto_22216 - SURFACE
      ?auto_22220 - SURFACE
      ?auto_22214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22215 ?auto_22217 ) ( IS-CRATE ?auto_22210 ) ( not ( = ?auto_22213 ?auto_22210 ) ) ( not ( = ?auto_22212 ?auto_22213 ) ) ( not ( = ?auto_22212 ?auto_22210 ) ) ( not ( = ?auto_22218 ?auto_22217 ) ) ( HOIST-AT ?auto_22219 ?auto_22218 ) ( not ( = ?auto_22215 ?auto_22219 ) ) ( SURFACE-AT ?auto_22210 ?auto_22218 ) ( ON ?auto_22210 ?auto_22216 ) ( CLEAR ?auto_22210 ) ( not ( = ?auto_22213 ?auto_22216 ) ) ( not ( = ?auto_22210 ?auto_22216 ) ) ( not ( = ?auto_22212 ?auto_22216 ) ) ( IS-CRATE ?auto_22213 ) ( AVAILABLE ?auto_22219 ) ( SURFACE-AT ?auto_22213 ?auto_22218 ) ( ON ?auto_22213 ?auto_22220 ) ( CLEAR ?auto_22213 ) ( not ( = ?auto_22213 ?auto_22220 ) ) ( not ( = ?auto_22210 ?auto_22220 ) ) ( not ( = ?auto_22212 ?auto_22220 ) ) ( not ( = ?auto_22216 ?auto_22220 ) ) ( TRUCK-AT ?auto_22214 ?auto_22217 ) ( SURFACE-AT ?auto_22211 ?auto_22217 ) ( CLEAR ?auto_22211 ) ( LIFTING ?auto_22215 ?auto_22212 ) ( IS-CRATE ?auto_22212 ) ( not ( = ?auto_22211 ?auto_22212 ) ) ( not ( = ?auto_22213 ?auto_22211 ) ) ( not ( = ?auto_22210 ?auto_22211 ) ) ( not ( = ?auto_22216 ?auto_22211 ) ) ( not ( = ?auto_22220 ?auto_22211 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22212 ?auto_22213 ?auto_22210 )
      ( MAKE-3CRATE-VERIFY ?auto_22211 ?auto_22212 ?auto_22213 ?auto_22210 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22357 - SURFACE
      ?auto_22358 - SURFACE
      ?auto_22359 - SURFACE
      ?auto_22356 - SURFACE
      ?auto_22360 - SURFACE
    )
    :vars
    (
      ?auto_22362 - HOIST
      ?auto_22361 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22362 ?auto_22361 ) ( SURFACE-AT ?auto_22356 ?auto_22361 ) ( CLEAR ?auto_22356 ) ( LIFTING ?auto_22362 ?auto_22360 ) ( IS-CRATE ?auto_22360 ) ( not ( = ?auto_22356 ?auto_22360 ) ) ( ON ?auto_22358 ?auto_22357 ) ( ON ?auto_22359 ?auto_22358 ) ( ON ?auto_22356 ?auto_22359 ) ( not ( = ?auto_22357 ?auto_22358 ) ) ( not ( = ?auto_22357 ?auto_22359 ) ) ( not ( = ?auto_22357 ?auto_22356 ) ) ( not ( = ?auto_22357 ?auto_22360 ) ) ( not ( = ?auto_22358 ?auto_22359 ) ) ( not ( = ?auto_22358 ?auto_22356 ) ) ( not ( = ?auto_22358 ?auto_22360 ) ) ( not ( = ?auto_22359 ?auto_22356 ) ) ( not ( = ?auto_22359 ?auto_22360 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22356 ?auto_22360 )
      ( MAKE-4CRATE-VERIFY ?auto_22357 ?auto_22358 ?auto_22359 ?auto_22356 ?auto_22360 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22382 - SURFACE
      ?auto_22383 - SURFACE
      ?auto_22384 - SURFACE
      ?auto_22381 - SURFACE
      ?auto_22385 - SURFACE
    )
    :vars
    (
      ?auto_22386 - HOIST
      ?auto_22388 - PLACE
      ?auto_22387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22386 ?auto_22388 ) ( SURFACE-AT ?auto_22381 ?auto_22388 ) ( CLEAR ?auto_22381 ) ( IS-CRATE ?auto_22385 ) ( not ( = ?auto_22381 ?auto_22385 ) ) ( TRUCK-AT ?auto_22387 ?auto_22388 ) ( AVAILABLE ?auto_22386 ) ( IN ?auto_22385 ?auto_22387 ) ( ON ?auto_22381 ?auto_22384 ) ( not ( = ?auto_22384 ?auto_22381 ) ) ( not ( = ?auto_22384 ?auto_22385 ) ) ( ON ?auto_22383 ?auto_22382 ) ( ON ?auto_22384 ?auto_22383 ) ( not ( = ?auto_22382 ?auto_22383 ) ) ( not ( = ?auto_22382 ?auto_22384 ) ) ( not ( = ?auto_22382 ?auto_22381 ) ) ( not ( = ?auto_22382 ?auto_22385 ) ) ( not ( = ?auto_22383 ?auto_22384 ) ) ( not ( = ?auto_22383 ?auto_22381 ) ) ( not ( = ?auto_22383 ?auto_22385 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22384 ?auto_22381 ?auto_22385 )
      ( MAKE-4CRATE-VERIFY ?auto_22382 ?auto_22383 ?auto_22384 ?auto_22381 ?auto_22385 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22412 - SURFACE
      ?auto_22413 - SURFACE
      ?auto_22414 - SURFACE
      ?auto_22411 - SURFACE
      ?auto_22415 - SURFACE
    )
    :vars
    (
      ?auto_22416 - HOIST
      ?auto_22418 - PLACE
      ?auto_22419 - TRUCK
      ?auto_22417 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22416 ?auto_22418 ) ( SURFACE-AT ?auto_22411 ?auto_22418 ) ( CLEAR ?auto_22411 ) ( IS-CRATE ?auto_22415 ) ( not ( = ?auto_22411 ?auto_22415 ) ) ( AVAILABLE ?auto_22416 ) ( IN ?auto_22415 ?auto_22419 ) ( ON ?auto_22411 ?auto_22414 ) ( not ( = ?auto_22414 ?auto_22411 ) ) ( not ( = ?auto_22414 ?auto_22415 ) ) ( TRUCK-AT ?auto_22419 ?auto_22417 ) ( not ( = ?auto_22417 ?auto_22418 ) ) ( ON ?auto_22413 ?auto_22412 ) ( ON ?auto_22414 ?auto_22413 ) ( not ( = ?auto_22412 ?auto_22413 ) ) ( not ( = ?auto_22412 ?auto_22414 ) ) ( not ( = ?auto_22412 ?auto_22411 ) ) ( not ( = ?auto_22412 ?auto_22415 ) ) ( not ( = ?auto_22413 ?auto_22414 ) ) ( not ( = ?auto_22413 ?auto_22411 ) ) ( not ( = ?auto_22413 ?auto_22415 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22414 ?auto_22411 ?auto_22415 )
      ( MAKE-4CRATE-VERIFY ?auto_22412 ?auto_22413 ?auto_22414 ?auto_22411 ?auto_22415 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22446 - SURFACE
      ?auto_22447 - SURFACE
      ?auto_22448 - SURFACE
      ?auto_22445 - SURFACE
      ?auto_22449 - SURFACE
    )
    :vars
    (
      ?auto_22450 - HOIST
      ?auto_22452 - PLACE
      ?auto_22451 - TRUCK
      ?auto_22454 - PLACE
      ?auto_22453 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22450 ?auto_22452 ) ( SURFACE-AT ?auto_22445 ?auto_22452 ) ( CLEAR ?auto_22445 ) ( IS-CRATE ?auto_22449 ) ( not ( = ?auto_22445 ?auto_22449 ) ) ( AVAILABLE ?auto_22450 ) ( ON ?auto_22445 ?auto_22448 ) ( not ( = ?auto_22448 ?auto_22445 ) ) ( not ( = ?auto_22448 ?auto_22449 ) ) ( TRUCK-AT ?auto_22451 ?auto_22454 ) ( not ( = ?auto_22454 ?auto_22452 ) ) ( HOIST-AT ?auto_22453 ?auto_22454 ) ( LIFTING ?auto_22453 ?auto_22449 ) ( not ( = ?auto_22450 ?auto_22453 ) ) ( ON ?auto_22447 ?auto_22446 ) ( ON ?auto_22448 ?auto_22447 ) ( not ( = ?auto_22446 ?auto_22447 ) ) ( not ( = ?auto_22446 ?auto_22448 ) ) ( not ( = ?auto_22446 ?auto_22445 ) ) ( not ( = ?auto_22446 ?auto_22449 ) ) ( not ( = ?auto_22447 ?auto_22448 ) ) ( not ( = ?auto_22447 ?auto_22445 ) ) ( not ( = ?auto_22447 ?auto_22449 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22448 ?auto_22445 ?auto_22449 )
      ( MAKE-4CRATE-VERIFY ?auto_22446 ?auto_22447 ?auto_22448 ?auto_22445 ?auto_22449 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22484 - SURFACE
      ?auto_22485 - SURFACE
      ?auto_22486 - SURFACE
      ?auto_22483 - SURFACE
      ?auto_22487 - SURFACE
    )
    :vars
    (
      ?auto_22491 - HOIST
      ?auto_22488 - PLACE
      ?auto_22492 - TRUCK
      ?auto_22489 - PLACE
      ?auto_22490 - HOIST
      ?auto_22493 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22491 ?auto_22488 ) ( SURFACE-AT ?auto_22483 ?auto_22488 ) ( CLEAR ?auto_22483 ) ( IS-CRATE ?auto_22487 ) ( not ( = ?auto_22483 ?auto_22487 ) ) ( AVAILABLE ?auto_22491 ) ( ON ?auto_22483 ?auto_22486 ) ( not ( = ?auto_22486 ?auto_22483 ) ) ( not ( = ?auto_22486 ?auto_22487 ) ) ( TRUCK-AT ?auto_22492 ?auto_22489 ) ( not ( = ?auto_22489 ?auto_22488 ) ) ( HOIST-AT ?auto_22490 ?auto_22489 ) ( not ( = ?auto_22491 ?auto_22490 ) ) ( AVAILABLE ?auto_22490 ) ( SURFACE-AT ?auto_22487 ?auto_22489 ) ( ON ?auto_22487 ?auto_22493 ) ( CLEAR ?auto_22487 ) ( not ( = ?auto_22483 ?auto_22493 ) ) ( not ( = ?auto_22487 ?auto_22493 ) ) ( not ( = ?auto_22486 ?auto_22493 ) ) ( ON ?auto_22485 ?auto_22484 ) ( ON ?auto_22486 ?auto_22485 ) ( not ( = ?auto_22484 ?auto_22485 ) ) ( not ( = ?auto_22484 ?auto_22486 ) ) ( not ( = ?auto_22484 ?auto_22483 ) ) ( not ( = ?auto_22484 ?auto_22487 ) ) ( not ( = ?auto_22484 ?auto_22493 ) ) ( not ( = ?auto_22485 ?auto_22486 ) ) ( not ( = ?auto_22485 ?auto_22483 ) ) ( not ( = ?auto_22485 ?auto_22487 ) ) ( not ( = ?auto_22485 ?auto_22493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22486 ?auto_22483 ?auto_22487 )
      ( MAKE-4CRATE-VERIFY ?auto_22484 ?auto_22485 ?auto_22486 ?auto_22483 ?auto_22487 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22523 - SURFACE
      ?auto_22524 - SURFACE
      ?auto_22525 - SURFACE
      ?auto_22522 - SURFACE
      ?auto_22526 - SURFACE
    )
    :vars
    (
      ?auto_22529 - HOIST
      ?auto_22528 - PLACE
      ?auto_22530 - PLACE
      ?auto_22531 - HOIST
      ?auto_22532 - SURFACE
      ?auto_22527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22529 ?auto_22528 ) ( SURFACE-AT ?auto_22522 ?auto_22528 ) ( CLEAR ?auto_22522 ) ( IS-CRATE ?auto_22526 ) ( not ( = ?auto_22522 ?auto_22526 ) ) ( AVAILABLE ?auto_22529 ) ( ON ?auto_22522 ?auto_22525 ) ( not ( = ?auto_22525 ?auto_22522 ) ) ( not ( = ?auto_22525 ?auto_22526 ) ) ( not ( = ?auto_22530 ?auto_22528 ) ) ( HOIST-AT ?auto_22531 ?auto_22530 ) ( not ( = ?auto_22529 ?auto_22531 ) ) ( AVAILABLE ?auto_22531 ) ( SURFACE-AT ?auto_22526 ?auto_22530 ) ( ON ?auto_22526 ?auto_22532 ) ( CLEAR ?auto_22526 ) ( not ( = ?auto_22522 ?auto_22532 ) ) ( not ( = ?auto_22526 ?auto_22532 ) ) ( not ( = ?auto_22525 ?auto_22532 ) ) ( TRUCK-AT ?auto_22527 ?auto_22528 ) ( ON ?auto_22524 ?auto_22523 ) ( ON ?auto_22525 ?auto_22524 ) ( not ( = ?auto_22523 ?auto_22524 ) ) ( not ( = ?auto_22523 ?auto_22525 ) ) ( not ( = ?auto_22523 ?auto_22522 ) ) ( not ( = ?auto_22523 ?auto_22526 ) ) ( not ( = ?auto_22523 ?auto_22532 ) ) ( not ( = ?auto_22524 ?auto_22525 ) ) ( not ( = ?auto_22524 ?auto_22522 ) ) ( not ( = ?auto_22524 ?auto_22526 ) ) ( not ( = ?auto_22524 ?auto_22532 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22525 ?auto_22522 ?auto_22526 )
      ( MAKE-4CRATE-VERIFY ?auto_22523 ?auto_22524 ?auto_22525 ?auto_22522 ?auto_22526 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22562 - SURFACE
      ?auto_22563 - SURFACE
      ?auto_22564 - SURFACE
      ?auto_22561 - SURFACE
      ?auto_22565 - SURFACE
    )
    :vars
    (
      ?auto_22570 - HOIST
      ?auto_22566 - PLACE
      ?auto_22571 - PLACE
      ?auto_22569 - HOIST
      ?auto_22568 - SURFACE
      ?auto_22567 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22570 ?auto_22566 ) ( IS-CRATE ?auto_22565 ) ( not ( = ?auto_22561 ?auto_22565 ) ) ( not ( = ?auto_22564 ?auto_22561 ) ) ( not ( = ?auto_22564 ?auto_22565 ) ) ( not ( = ?auto_22571 ?auto_22566 ) ) ( HOIST-AT ?auto_22569 ?auto_22571 ) ( not ( = ?auto_22570 ?auto_22569 ) ) ( AVAILABLE ?auto_22569 ) ( SURFACE-AT ?auto_22565 ?auto_22571 ) ( ON ?auto_22565 ?auto_22568 ) ( CLEAR ?auto_22565 ) ( not ( = ?auto_22561 ?auto_22568 ) ) ( not ( = ?auto_22565 ?auto_22568 ) ) ( not ( = ?auto_22564 ?auto_22568 ) ) ( TRUCK-AT ?auto_22567 ?auto_22566 ) ( SURFACE-AT ?auto_22564 ?auto_22566 ) ( CLEAR ?auto_22564 ) ( LIFTING ?auto_22570 ?auto_22561 ) ( IS-CRATE ?auto_22561 ) ( ON ?auto_22563 ?auto_22562 ) ( ON ?auto_22564 ?auto_22563 ) ( not ( = ?auto_22562 ?auto_22563 ) ) ( not ( = ?auto_22562 ?auto_22564 ) ) ( not ( = ?auto_22562 ?auto_22561 ) ) ( not ( = ?auto_22562 ?auto_22565 ) ) ( not ( = ?auto_22562 ?auto_22568 ) ) ( not ( = ?auto_22563 ?auto_22564 ) ) ( not ( = ?auto_22563 ?auto_22561 ) ) ( not ( = ?auto_22563 ?auto_22565 ) ) ( not ( = ?auto_22563 ?auto_22568 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22564 ?auto_22561 ?auto_22565 )
      ( MAKE-4CRATE-VERIFY ?auto_22562 ?auto_22563 ?auto_22564 ?auto_22561 ?auto_22565 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22601 - SURFACE
      ?auto_22602 - SURFACE
      ?auto_22603 - SURFACE
      ?auto_22600 - SURFACE
      ?auto_22604 - SURFACE
    )
    :vars
    (
      ?auto_22607 - HOIST
      ?auto_22608 - PLACE
      ?auto_22609 - PLACE
      ?auto_22610 - HOIST
      ?auto_22606 - SURFACE
      ?auto_22605 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22607 ?auto_22608 ) ( IS-CRATE ?auto_22604 ) ( not ( = ?auto_22600 ?auto_22604 ) ) ( not ( = ?auto_22603 ?auto_22600 ) ) ( not ( = ?auto_22603 ?auto_22604 ) ) ( not ( = ?auto_22609 ?auto_22608 ) ) ( HOIST-AT ?auto_22610 ?auto_22609 ) ( not ( = ?auto_22607 ?auto_22610 ) ) ( AVAILABLE ?auto_22610 ) ( SURFACE-AT ?auto_22604 ?auto_22609 ) ( ON ?auto_22604 ?auto_22606 ) ( CLEAR ?auto_22604 ) ( not ( = ?auto_22600 ?auto_22606 ) ) ( not ( = ?auto_22604 ?auto_22606 ) ) ( not ( = ?auto_22603 ?auto_22606 ) ) ( TRUCK-AT ?auto_22605 ?auto_22608 ) ( SURFACE-AT ?auto_22603 ?auto_22608 ) ( CLEAR ?auto_22603 ) ( IS-CRATE ?auto_22600 ) ( AVAILABLE ?auto_22607 ) ( IN ?auto_22600 ?auto_22605 ) ( ON ?auto_22602 ?auto_22601 ) ( ON ?auto_22603 ?auto_22602 ) ( not ( = ?auto_22601 ?auto_22602 ) ) ( not ( = ?auto_22601 ?auto_22603 ) ) ( not ( = ?auto_22601 ?auto_22600 ) ) ( not ( = ?auto_22601 ?auto_22604 ) ) ( not ( = ?auto_22601 ?auto_22606 ) ) ( not ( = ?auto_22602 ?auto_22603 ) ) ( not ( = ?auto_22602 ?auto_22600 ) ) ( not ( = ?auto_22602 ?auto_22604 ) ) ( not ( = ?auto_22602 ?auto_22606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22603 ?auto_22600 ?auto_22604 )
      ( MAKE-4CRATE-VERIFY ?auto_22601 ?auto_22602 ?auto_22603 ?auto_22600 ?auto_22604 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22873 - SURFACE
      ?auto_22874 - SURFACE
    )
    :vars
    (
      ?auto_22876 - HOIST
      ?auto_22878 - PLACE
      ?auto_22881 - SURFACE
      ?auto_22880 - PLACE
      ?auto_22875 - HOIST
      ?auto_22879 - SURFACE
      ?auto_22877 - TRUCK
      ?auto_22882 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22876 ?auto_22878 ) ( SURFACE-AT ?auto_22873 ?auto_22878 ) ( CLEAR ?auto_22873 ) ( IS-CRATE ?auto_22874 ) ( not ( = ?auto_22873 ?auto_22874 ) ) ( ON ?auto_22873 ?auto_22881 ) ( not ( = ?auto_22881 ?auto_22873 ) ) ( not ( = ?auto_22881 ?auto_22874 ) ) ( not ( = ?auto_22880 ?auto_22878 ) ) ( HOIST-AT ?auto_22875 ?auto_22880 ) ( not ( = ?auto_22876 ?auto_22875 ) ) ( AVAILABLE ?auto_22875 ) ( SURFACE-AT ?auto_22874 ?auto_22880 ) ( ON ?auto_22874 ?auto_22879 ) ( CLEAR ?auto_22874 ) ( not ( = ?auto_22873 ?auto_22879 ) ) ( not ( = ?auto_22874 ?auto_22879 ) ) ( not ( = ?auto_22881 ?auto_22879 ) ) ( TRUCK-AT ?auto_22877 ?auto_22878 ) ( LIFTING ?auto_22876 ?auto_22882 ) ( IS-CRATE ?auto_22882 ) ( not ( = ?auto_22873 ?auto_22882 ) ) ( not ( = ?auto_22874 ?auto_22882 ) ) ( not ( = ?auto_22881 ?auto_22882 ) ) ( not ( = ?auto_22879 ?auto_22882 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22876 ?auto_22882 ?auto_22877 ?auto_22878 )
      ( MAKE-1CRATE ?auto_22873 ?auto_22874 )
      ( MAKE-1CRATE-VERIFY ?auto_22873 ?auto_22874 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23100 - SURFACE
      ?auto_23101 - SURFACE
    )
    :vars
    (
      ?auto_23102 - HOIST
      ?auto_23103 - PLACE
      ?auto_23104 - SURFACE
      ?auto_23108 - TRUCK
      ?auto_23106 - PLACE
      ?auto_23105 - HOIST
      ?auto_23107 - SURFACE
      ?auto_23109 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23102 ?auto_23103 ) ( SURFACE-AT ?auto_23100 ?auto_23103 ) ( CLEAR ?auto_23100 ) ( IS-CRATE ?auto_23101 ) ( not ( = ?auto_23100 ?auto_23101 ) ) ( AVAILABLE ?auto_23102 ) ( ON ?auto_23100 ?auto_23104 ) ( not ( = ?auto_23104 ?auto_23100 ) ) ( not ( = ?auto_23104 ?auto_23101 ) ) ( TRUCK-AT ?auto_23108 ?auto_23106 ) ( not ( = ?auto_23106 ?auto_23103 ) ) ( HOIST-AT ?auto_23105 ?auto_23106 ) ( not ( = ?auto_23102 ?auto_23105 ) ) ( SURFACE-AT ?auto_23101 ?auto_23106 ) ( ON ?auto_23101 ?auto_23107 ) ( CLEAR ?auto_23101 ) ( not ( = ?auto_23100 ?auto_23107 ) ) ( not ( = ?auto_23101 ?auto_23107 ) ) ( not ( = ?auto_23104 ?auto_23107 ) ) ( LIFTING ?auto_23105 ?auto_23109 ) ( IS-CRATE ?auto_23109 ) ( not ( = ?auto_23100 ?auto_23109 ) ) ( not ( = ?auto_23101 ?auto_23109 ) ) ( not ( = ?auto_23104 ?auto_23109 ) ) ( not ( = ?auto_23107 ?auto_23109 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23105 ?auto_23109 ?auto_23108 ?auto_23106 )
      ( MAKE-1CRATE ?auto_23100 ?auto_23101 )
      ( MAKE-1CRATE-VERIFY ?auto_23100 ?auto_23101 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23260 - SURFACE
      ?auto_23261 - SURFACE
      ?auto_23262 - SURFACE
      ?auto_23259 - SURFACE
      ?auto_23263 - SURFACE
      ?auto_23264 - SURFACE
    )
    :vars
    (
      ?auto_23266 - HOIST
      ?auto_23265 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23266 ?auto_23265 ) ( SURFACE-AT ?auto_23263 ?auto_23265 ) ( CLEAR ?auto_23263 ) ( LIFTING ?auto_23266 ?auto_23264 ) ( IS-CRATE ?auto_23264 ) ( not ( = ?auto_23263 ?auto_23264 ) ) ( ON ?auto_23261 ?auto_23260 ) ( ON ?auto_23262 ?auto_23261 ) ( ON ?auto_23259 ?auto_23262 ) ( ON ?auto_23263 ?auto_23259 ) ( not ( = ?auto_23260 ?auto_23261 ) ) ( not ( = ?auto_23260 ?auto_23262 ) ) ( not ( = ?auto_23260 ?auto_23259 ) ) ( not ( = ?auto_23260 ?auto_23263 ) ) ( not ( = ?auto_23260 ?auto_23264 ) ) ( not ( = ?auto_23261 ?auto_23262 ) ) ( not ( = ?auto_23261 ?auto_23259 ) ) ( not ( = ?auto_23261 ?auto_23263 ) ) ( not ( = ?auto_23261 ?auto_23264 ) ) ( not ( = ?auto_23262 ?auto_23259 ) ) ( not ( = ?auto_23262 ?auto_23263 ) ) ( not ( = ?auto_23262 ?auto_23264 ) ) ( not ( = ?auto_23259 ?auto_23263 ) ) ( not ( = ?auto_23259 ?auto_23264 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23263 ?auto_23264 )
      ( MAKE-5CRATE-VERIFY ?auto_23260 ?auto_23261 ?auto_23262 ?auto_23259 ?auto_23263 ?auto_23264 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23294 - SURFACE
      ?auto_23295 - SURFACE
      ?auto_23296 - SURFACE
      ?auto_23293 - SURFACE
      ?auto_23297 - SURFACE
      ?auto_23298 - SURFACE
    )
    :vars
    (
      ?auto_23300 - HOIST
      ?auto_23301 - PLACE
      ?auto_23299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23300 ?auto_23301 ) ( SURFACE-AT ?auto_23297 ?auto_23301 ) ( CLEAR ?auto_23297 ) ( IS-CRATE ?auto_23298 ) ( not ( = ?auto_23297 ?auto_23298 ) ) ( TRUCK-AT ?auto_23299 ?auto_23301 ) ( AVAILABLE ?auto_23300 ) ( IN ?auto_23298 ?auto_23299 ) ( ON ?auto_23297 ?auto_23293 ) ( not ( = ?auto_23293 ?auto_23297 ) ) ( not ( = ?auto_23293 ?auto_23298 ) ) ( ON ?auto_23295 ?auto_23294 ) ( ON ?auto_23296 ?auto_23295 ) ( ON ?auto_23293 ?auto_23296 ) ( not ( = ?auto_23294 ?auto_23295 ) ) ( not ( = ?auto_23294 ?auto_23296 ) ) ( not ( = ?auto_23294 ?auto_23293 ) ) ( not ( = ?auto_23294 ?auto_23297 ) ) ( not ( = ?auto_23294 ?auto_23298 ) ) ( not ( = ?auto_23295 ?auto_23296 ) ) ( not ( = ?auto_23295 ?auto_23293 ) ) ( not ( = ?auto_23295 ?auto_23297 ) ) ( not ( = ?auto_23295 ?auto_23298 ) ) ( not ( = ?auto_23296 ?auto_23293 ) ) ( not ( = ?auto_23296 ?auto_23297 ) ) ( not ( = ?auto_23296 ?auto_23298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23293 ?auto_23297 ?auto_23298 )
      ( MAKE-5CRATE-VERIFY ?auto_23294 ?auto_23295 ?auto_23296 ?auto_23293 ?auto_23297 ?auto_23298 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23334 - SURFACE
      ?auto_23335 - SURFACE
      ?auto_23336 - SURFACE
      ?auto_23333 - SURFACE
      ?auto_23337 - SURFACE
      ?auto_23338 - SURFACE
    )
    :vars
    (
      ?auto_23342 - HOIST
      ?auto_23339 - PLACE
      ?auto_23340 - TRUCK
      ?auto_23341 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23342 ?auto_23339 ) ( SURFACE-AT ?auto_23337 ?auto_23339 ) ( CLEAR ?auto_23337 ) ( IS-CRATE ?auto_23338 ) ( not ( = ?auto_23337 ?auto_23338 ) ) ( AVAILABLE ?auto_23342 ) ( IN ?auto_23338 ?auto_23340 ) ( ON ?auto_23337 ?auto_23333 ) ( not ( = ?auto_23333 ?auto_23337 ) ) ( not ( = ?auto_23333 ?auto_23338 ) ) ( TRUCK-AT ?auto_23340 ?auto_23341 ) ( not ( = ?auto_23341 ?auto_23339 ) ) ( ON ?auto_23335 ?auto_23334 ) ( ON ?auto_23336 ?auto_23335 ) ( ON ?auto_23333 ?auto_23336 ) ( not ( = ?auto_23334 ?auto_23335 ) ) ( not ( = ?auto_23334 ?auto_23336 ) ) ( not ( = ?auto_23334 ?auto_23333 ) ) ( not ( = ?auto_23334 ?auto_23337 ) ) ( not ( = ?auto_23334 ?auto_23338 ) ) ( not ( = ?auto_23335 ?auto_23336 ) ) ( not ( = ?auto_23335 ?auto_23333 ) ) ( not ( = ?auto_23335 ?auto_23337 ) ) ( not ( = ?auto_23335 ?auto_23338 ) ) ( not ( = ?auto_23336 ?auto_23333 ) ) ( not ( = ?auto_23336 ?auto_23337 ) ) ( not ( = ?auto_23336 ?auto_23338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23333 ?auto_23337 ?auto_23338 )
      ( MAKE-5CRATE-VERIFY ?auto_23334 ?auto_23335 ?auto_23336 ?auto_23333 ?auto_23337 ?auto_23338 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23379 - SURFACE
      ?auto_23380 - SURFACE
      ?auto_23381 - SURFACE
      ?auto_23378 - SURFACE
      ?auto_23382 - SURFACE
      ?auto_23383 - SURFACE
    )
    :vars
    (
      ?auto_23387 - HOIST
      ?auto_23384 - PLACE
      ?auto_23388 - TRUCK
      ?auto_23385 - PLACE
      ?auto_23386 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23387 ?auto_23384 ) ( SURFACE-AT ?auto_23382 ?auto_23384 ) ( CLEAR ?auto_23382 ) ( IS-CRATE ?auto_23383 ) ( not ( = ?auto_23382 ?auto_23383 ) ) ( AVAILABLE ?auto_23387 ) ( ON ?auto_23382 ?auto_23378 ) ( not ( = ?auto_23378 ?auto_23382 ) ) ( not ( = ?auto_23378 ?auto_23383 ) ) ( TRUCK-AT ?auto_23388 ?auto_23385 ) ( not ( = ?auto_23385 ?auto_23384 ) ) ( HOIST-AT ?auto_23386 ?auto_23385 ) ( LIFTING ?auto_23386 ?auto_23383 ) ( not ( = ?auto_23387 ?auto_23386 ) ) ( ON ?auto_23380 ?auto_23379 ) ( ON ?auto_23381 ?auto_23380 ) ( ON ?auto_23378 ?auto_23381 ) ( not ( = ?auto_23379 ?auto_23380 ) ) ( not ( = ?auto_23379 ?auto_23381 ) ) ( not ( = ?auto_23379 ?auto_23378 ) ) ( not ( = ?auto_23379 ?auto_23382 ) ) ( not ( = ?auto_23379 ?auto_23383 ) ) ( not ( = ?auto_23380 ?auto_23381 ) ) ( not ( = ?auto_23380 ?auto_23378 ) ) ( not ( = ?auto_23380 ?auto_23382 ) ) ( not ( = ?auto_23380 ?auto_23383 ) ) ( not ( = ?auto_23381 ?auto_23378 ) ) ( not ( = ?auto_23381 ?auto_23382 ) ) ( not ( = ?auto_23381 ?auto_23383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23378 ?auto_23382 ?auto_23383 )
      ( MAKE-5CRATE-VERIFY ?auto_23379 ?auto_23380 ?auto_23381 ?auto_23378 ?auto_23382 ?auto_23383 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23429 - SURFACE
      ?auto_23430 - SURFACE
      ?auto_23431 - SURFACE
      ?auto_23428 - SURFACE
      ?auto_23432 - SURFACE
      ?auto_23433 - SURFACE
    )
    :vars
    (
      ?auto_23439 - HOIST
      ?auto_23438 - PLACE
      ?auto_23434 - TRUCK
      ?auto_23435 - PLACE
      ?auto_23436 - HOIST
      ?auto_23437 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23439 ?auto_23438 ) ( SURFACE-AT ?auto_23432 ?auto_23438 ) ( CLEAR ?auto_23432 ) ( IS-CRATE ?auto_23433 ) ( not ( = ?auto_23432 ?auto_23433 ) ) ( AVAILABLE ?auto_23439 ) ( ON ?auto_23432 ?auto_23428 ) ( not ( = ?auto_23428 ?auto_23432 ) ) ( not ( = ?auto_23428 ?auto_23433 ) ) ( TRUCK-AT ?auto_23434 ?auto_23435 ) ( not ( = ?auto_23435 ?auto_23438 ) ) ( HOIST-AT ?auto_23436 ?auto_23435 ) ( not ( = ?auto_23439 ?auto_23436 ) ) ( AVAILABLE ?auto_23436 ) ( SURFACE-AT ?auto_23433 ?auto_23435 ) ( ON ?auto_23433 ?auto_23437 ) ( CLEAR ?auto_23433 ) ( not ( = ?auto_23432 ?auto_23437 ) ) ( not ( = ?auto_23433 ?auto_23437 ) ) ( not ( = ?auto_23428 ?auto_23437 ) ) ( ON ?auto_23430 ?auto_23429 ) ( ON ?auto_23431 ?auto_23430 ) ( ON ?auto_23428 ?auto_23431 ) ( not ( = ?auto_23429 ?auto_23430 ) ) ( not ( = ?auto_23429 ?auto_23431 ) ) ( not ( = ?auto_23429 ?auto_23428 ) ) ( not ( = ?auto_23429 ?auto_23432 ) ) ( not ( = ?auto_23429 ?auto_23433 ) ) ( not ( = ?auto_23429 ?auto_23437 ) ) ( not ( = ?auto_23430 ?auto_23431 ) ) ( not ( = ?auto_23430 ?auto_23428 ) ) ( not ( = ?auto_23430 ?auto_23432 ) ) ( not ( = ?auto_23430 ?auto_23433 ) ) ( not ( = ?auto_23430 ?auto_23437 ) ) ( not ( = ?auto_23431 ?auto_23428 ) ) ( not ( = ?auto_23431 ?auto_23432 ) ) ( not ( = ?auto_23431 ?auto_23433 ) ) ( not ( = ?auto_23431 ?auto_23437 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23428 ?auto_23432 ?auto_23433 )
      ( MAKE-5CRATE-VERIFY ?auto_23429 ?auto_23430 ?auto_23431 ?auto_23428 ?auto_23432 ?auto_23433 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23480 - SURFACE
      ?auto_23481 - SURFACE
      ?auto_23482 - SURFACE
      ?auto_23479 - SURFACE
      ?auto_23483 - SURFACE
      ?auto_23484 - SURFACE
    )
    :vars
    (
      ?auto_23488 - HOIST
      ?auto_23485 - PLACE
      ?auto_23486 - PLACE
      ?auto_23489 - HOIST
      ?auto_23487 - SURFACE
      ?auto_23490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23488 ?auto_23485 ) ( SURFACE-AT ?auto_23483 ?auto_23485 ) ( CLEAR ?auto_23483 ) ( IS-CRATE ?auto_23484 ) ( not ( = ?auto_23483 ?auto_23484 ) ) ( AVAILABLE ?auto_23488 ) ( ON ?auto_23483 ?auto_23479 ) ( not ( = ?auto_23479 ?auto_23483 ) ) ( not ( = ?auto_23479 ?auto_23484 ) ) ( not ( = ?auto_23486 ?auto_23485 ) ) ( HOIST-AT ?auto_23489 ?auto_23486 ) ( not ( = ?auto_23488 ?auto_23489 ) ) ( AVAILABLE ?auto_23489 ) ( SURFACE-AT ?auto_23484 ?auto_23486 ) ( ON ?auto_23484 ?auto_23487 ) ( CLEAR ?auto_23484 ) ( not ( = ?auto_23483 ?auto_23487 ) ) ( not ( = ?auto_23484 ?auto_23487 ) ) ( not ( = ?auto_23479 ?auto_23487 ) ) ( TRUCK-AT ?auto_23490 ?auto_23485 ) ( ON ?auto_23481 ?auto_23480 ) ( ON ?auto_23482 ?auto_23481 ) ( ON ?auto_23479 ?auto_23482 ) ( not ( = ?auto_23480 ?auto_23481 ) ) ( not ( = ?auto_23480 ?auto_23482 ) ) ( not ( = ?auto_23480 ?auto_23479 ) ) ( not ( = ?auto_23480 ?auto_23483 ) ) ( not ( = ?auto_23480 ?auto_23484 ) ) ( not ( = ?auto_23480 ?auto_23487 ) ) ( not ( = ?auto_23481 ?auto_23482 ) ) ( not ( = ?auto_23481 ?auto_23479 ) ) ( not ( = ?auto_23481 ?auto_23483 ) ) ( not ( = ?auto_23481 ?auto_23484 ) ) ( not ( = ?auto_23481 ?auto_23487 ) ) ( not ( = ?auto_23482 ?auto_23479 ) ) ( not ( = ?auto_23482 ?auto_23483 ) ) ( not ( = ?auto_23482 ?auto_23484 ) ) ( not ( = ?auto_23482 ?auto_23487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23479 ?auto_23483 ?auto_23484 )
      ( MAKE-5CRATE-VERIFY ?auto_23480 ?auto_23481 ?auto_23482 ?auto_23479 ?auto_23483 ?auto_23484 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23531 - SURFACE
      ?auto_23532 - SURFACE
      ?auto_23533 - SURFACE
      ?auto_23530 - SURFACE
      ?auto_23534 - SURFACE
      ?auto_23535 - SURFACE
    )
    :vars
    (
      ?auto_23541 - HOIST
      ?auto_23536 - PLACE
      ?auto_23537 - PLACE
      ?auto_23540 - HOIST
      ?auto_23539 - SURFACE
      ?auto_23538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23541 ?auto_23536 ) ( IS-CRATE ?auto_23535 ) ( not ( = ?auto_23534 ?auto_23535 ) ) ( not ( = ?auto_23530 ?auto_23534 ) ) ( not ( = ?auto_23530 ?auto_23535 ) ) ( not ( = ?auto_23537 ?auto_23536 ) ) ( HOIST-AT ?auto_23540 ?auto_23537 ) ( not ( = ?auto_23541 ?auto_23540 ) ) ( AVAILABLE ?auto_23540 ) ( SURFACE-AT ?auto_23535 ?auto_23537 ) ( ON ?auto_23535 ?auto_23539 ) ( CLEAR ?auto_23535 ) ( not ( = ?auto_23534 ?auto_23539 ) ) ( not ( = ?auto_23535 ?auto_23539 ) ) ( not ( = ?auto_23530 ?auto_23539 ) ) ( TRUCK-AT ?auto_23538 ?auto_23536 ) ( SURFACE-AT ?auto_23530 ?auto_23536 ) ( CLEAR ?auto_23530 ) ( LIFTING ?auto_23541 ?auto_23534 ) ( IS-CRATE ?auto_23534 ) ( ON ?auto_23532 ?auto_23531 ) ( ON ?auto_23533 ?auto_23532 ) ( ON ?auto_23530 ?auto_23533 ) ( not ( = ?auto_23531 ?auto_23532 ) ) ( not ( = ?auto_23531 ?auto_23533 ) ) ( not ( = ?auto_23531 ?auto_23530 ) ) ( not ( = ?auto_23531 ?auto_23534 ) ) ( not ( = ?auto_23531 ?auto_23535 ) ) ( not ( = ?auto_23531 ?auto_23539 ) ) ( not ( = ?auto_23532 ?auto_23533 ) ) ( not ( = ?auto_23532 ?auto_23530 ) ) ( not ( = ?auto_23532 ?auto_23534 ) ) ( not ( = ?auto_23532 ?auto_23535 ) ) ( not ( = ?auto_23532 ?auto_23539 ) ) ( not ( = ?auto_23533 ?auto_23530 ) ) ( not ( = ?auto_23533 ?auto_23534 ) ) ( not ( = ?auto_23533 ?auto_23535 ) ) ( not ( = ?auto_23533 ?auto_23539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23530 ?auto_23534 ?auto_23535 )
      ( MAKE-5CRATE-VERIFY ?auto_23531 ?auto_23532 ?auto_23533 ?auto_23530 ?auto_23534 ?auto_23535 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23582 - SURFACE
      ?auto_23583 - SURFACE
      ?auto_23584 - SURFACE
      ?auto_23581 - SURFACE
      ?auto_23585 - SURFACE
      ?auto_23586 - SURFACE
    )
    :vars
    (
      ?auto_23587 - HOIST
      ?auto_23592 - PLACE
      ?auto_23590 - PLACE
      ?auto_23591 - HOIST
      ?auto_23588 - SURFACE
      ?auto_23589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23587 ?auto_23592 ) ( IS-CRATE ?auto_23586 ) ( not ( = ?auto_23585 ?auto_23586 ) ) ( not ( = ?auto_23581 ?auto_23585 ) ) ( not ( = ?auto_23581 ?auto_23586 ) ) ( not ( = ?auto_23590 ?auto_23592 ) ) ( HOIST-AT ?auto_23591 ?auto_23590 ) ( not ( = ?auto_23587 ?auto_23591 ) ) ( AVAILABLE ?auto_23591 ) ( SURFACE-AT ?auto_23586 ?auto_23590 ) ( ON ?auto_23586 ?auto_23588 ) ( CLEAR ?auto_23586 ) ( not ( = ?auto_23585 ?auto_23588 ) ) ( not ( = ?auto_23586 ?auto_23588 ) ) ( not ( = ?auto_23581 ?auto_23588 ) ) ( TRUCK-AT ?auto_23589 ?auto_23592 ) ( SURFACE-AT ?auto_23581 ?auto_23592 ) ( CLEAR ?auto_23581 ) ( IS-CRATE ?auto_23585 ) ( AVAILABLE ?auto_23587 ) ( IN ?auto_23585 ?auto_23589 ) ( ON ?auto_23583 ?auto_23582 ) ( ON ?auto_23584 ?auto_23583 ) ( ON ?auto_23581 ?auto_23584 ) ( not ( = ?auto_23582 ?auto_23583 ) ) ( not ( = ?auto_23582 ?auto_23584 ) ) ( not ( = ?auto_23582 ?auto_23581 ) ) ( not ( = ?auto_23582 ?auto_23585 ) ) ( not ( = ?auto_23582 ?auto_23586 ) ) ( not ( = ?auto_23582 ?auto_23588 ) ) ( not ( = ?auto_23583 ?auto_23584 ) ) ( not ( = ?auto_23583 ?auto_23581 ) ) ( not ( = ?auto_23583 ?auto_23585 ) ) ( not ( = ?auto_23583 ?auto_23586 ) ) ( not ( = ?auto_23583 ?auto_23588 ) ) ( not ( = ?auto_23584 ?auto_23581 ) ) ( not ( = ?auto_23584 ?auto_23585 ) ) ( not ( = ?auto_23584 ?auto_23586 ) ) ( not ( = ?auto_23584 ?auto_23588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23581 ?auto_23585 ?auto_23586 )
      ( MAKE-5CRATE-VERIFY ?auto_23582 ?auto_23583 ?auto_23584 ?auto_23581 ?auto_23585 ?auto_23586 ) )
  )

)

