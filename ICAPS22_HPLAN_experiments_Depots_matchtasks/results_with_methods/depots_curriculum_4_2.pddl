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
      ?auto_682 - SURFACE
      ?auto_683 - SURFACE
    )
    :vars
    (
      ?auto_684 - HOIST
      ?auto_685 - PLACE
      ?auto_687 - PLACE
      ?auto_688 - HOIST
      ?auto_689 - SURFACE
      ?auto_686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_684 ?auto_685 ) ( SURFACE-AT ?auto_682 ?auto_685 ) ( CLEAR ?auto_682 ) ( IS-CRATE ?auto_683 ) ( AVAILABLE ?auto_684 ) ( not ( = ?auto_687 ?auto_685 ) ) ( HOIST-AT ?auto_688 ?auto_687 ) ( AVAILABLE ?auto_688 ) ( SURFACE-AT ?auto_683 ?auto_687 ) ( ON ?auto_683 ?auto_689 ) ( CLEAR ?auto_683 ) ( TRUCK-AT ?auto_686 ?auto_685 ) ( not ( = ?auto_682 ?auto_683 ) ) ( not ( = ?auto_682 ?auto_689 ) ) ( not ( = ?auto_683 ?auto_689 ) ) ( not ( = ?auto_684 ?auto_688 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_686 ?auto_685 ?auto_687 )
      ( !LIFT ?auto_688 ?auto_683 ?auto_689 ?auto_687 )
      ( !LOAD ?auto_688 ?auto_683 ?auto_686 ?auto_687 )
      ( !DRIVE ?auto_686 ?auto_687 ?auto_685 )
      ( !UNLOAD ?auto_684 ?auto_683 ?auto_686 ?auto_685 )
      ( !DROP ?auto_684 ?auto_683 ?auto_682 ?auto_685 )
      ( MAKE-1CRATE-VERIFY ?auto_682 ?auto_683 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_692 - SURFACE
      ?auto_693 - SURFACE
    )
    :vars
    (
      ?auto_694 - HOIST
      ?auto_695 - PLACE
      ?auto_697 - PLACE
      ?auto_698 - HOIST
      ?auto_699 - SURFACE
      ?auto_696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694 ?auto_695 ) ( SURFACE-AT ?auto_692 ?auto_695 ) ( CLEAR ?auto_692 ) ( IS-CRATE ?auto_693 ) ( AVAILABLE ?auto_694 ) ( not ( = ?auto_697 ?auto_695 ) ) ( HOIST-AT ?auto_698 ?auto_697 ) ( AVAILABLE ?auto_698 ) ( SURFACE-AT ?auto_693 ?auto_697 ) ( ON ?auto_693 ?auto_699 ) ( CLEAR ?auto_693 ) ( TRUCK-AT ?auto_696 ?auto_695 ) ( not ( = ?auto_692 ?auto_693 ) ) ( not ( = ?auto_692 ?auto_699 ) ) ( not ( = ?auto_693 ?auto_699 ) ) ( not ( = ?auto_694 ?auto_698 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_696 ?auto_695 ?auto_697 )
      ( !LIFT ?auto_698 ?auto_693 ?auto_699 ?auto_697 )
      ( !LOAD ?auto_698 ?auto_693 ?auto_696 ?auto_697 )
      ( !DRIVE ?auto_696 ?auto_697 ?auto_695 )
      ( !UNLOAD ?auto_694 ?auto_693 ?auto_696 ?auto_695 )
      ( !DROP ?auto_694 ?auto_693 ?auto_692 ?auto_695 )
      ( MAKE-1CRATE-VERIFY ?auto_692 ?auto_693 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_703 - SURFACE
      ?auto_704 - SURFACE
      ?auto_705 - SURFACE
    )
    :vars
    (
      ?auto_709 - HOIST
      ?auto_707 - PLACE
      ?auto_710 - PLACE
      ?auto_706 - HOIST
      ?auto_711 - SURFACE
      ?auto_713 - PLACE
      ?auto_714 - HOIST
      ?auto_712 - SURFACE
      ?auto_708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_709 ?auto_707 ) ( IS-CRATE ?auto_705 ) ( not ( = ?auto_710 ?auto_707 ) ) ( HOIST-AT ?auto_706 ?auto_710 ) ( AVAILABLE ?auto_706 ) ( SURFACE-AT ?auto_705 ?auto_710 ) ( ON ?auto_705 ?auto_711 ) ( CLEAR ?auto_705 ) ( not ( = ?auto_704 ?auto_705 ) ) ( not ( = ?auto_704 ?auto_711 ) ) ( not ( = ?auto_705 ?auto_711 ) ) ( not ( = ?auto_709 ?auto_706 ) ) ( SURFACE-AT ?auto_703 ?auto_707 ) ( CLEAR ?auto_703 ) ( IS-CRATE ?auto_704 ) ( AVAILABLE ?auto_709 ) ( not ( = ?auto_713 ?auto_707 ) ) ( HOIST-AT ?auto_714 ?auto_713 ) ( AVAILABLE ?auto_714 ) ( SURFACE-AT ?auto_704 ?auto_713 ) ( ON ?auto_704 ?auto_712 ) ( CLEAR ?auto_704 ) ( TRUCK-AT ?auto_708 ?auto_707 ) ( not ( = ?auto_703 ?auto_704 ) ) ( not ( = ?auto_703 ?auto_712 ) ) ( not ( = ?auto_704 ?auto_712 ) ) ( not ( = ?auto_709 ?auto_714 ) ) ( not ( = ?auto_703 ?auto_705 ) ) ( not ( = ?auto_703 ?auto_711 ) ) ( not ( = ?auto_705 ?auto_712 ) ) ( not ( = ?auto_710 ?auto_713 ) ) ( not ( = ?auto_706 ?auto_714 ) ) ( not ( = ?auto_711 ?auto_712 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_703 ?auto_704 )
      ( MAKE-1CRATE ?auto_704 ?auto_705 )
      ( MAKE-2CRATE-VERIFY ?auto_703 ?auto_704 ?auto_705 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_717 - SURFACE
      ?auto_718 - SURFACE
    )
    :vars
    (
      ?auto_719 - HOIST
      ?auto_720 - PLACE
      ?auto_722 - PLACE
      ?auto_723 - HOIST
      ?auto_724 - SURFACE
      ?auto_721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_719 ?auto_720 ) ( SURFACE-AT ?auto_717 ?auto_720 ) ( CLEAR ?auto_717 ) ( IS-CRATE ?auto_718 ) ( AVAILABLE ?auto_719 ) ( not ( = ?auto_722 ?auto_720 ) ) ( HOIST-AT ?auto_723 ?auto_722 ) ( AVAILABLE ?auto_723 ) ( SURFACE-AT ?auto_718 ?auto_722 ) ( ON ?auto_718 ?auto_724 ) ( CLEAR ?auto_718 ) ( TRUCK-AT ?auto_721 ?auto_720 ) ( not ( = ?auto_717 ?auto_718 ) ) ( not ( = ?auto_717 ?auto_724 ) ) ( not ( = ?auto_718 ?auto_724 ) ) ( not ( = ?auto_719 ?auto_723 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_721 ?auto_720 ?auto_722 )
      ( !LIFT ?auto_723 ?auto_718 ?auto_724 ?auto_722 )
      ( !LOAD ?auto_723 ?auto_718 ?auto_721 ?auto_722 )
      ( !DRIVE ?auto_721 ?auto_722 ?auto_720 )
      ( !UNLOAD ?auto_719 ?auto_718 ?auto_721 ?auto_720 )
      ( !DROP ?auto_719 ?auto_718 ?auto_717 ?auto_720 )
      ( MAKE-1CRATE-VERIFY ?auto_717 ?auto_718 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_729 - SURFACE
      ?auto_730 - SURFACE
      ?auto_731 - SURFACE
      ?auto_732 - SURFACE
    )
    :vars
    (
      ?auto_735 - HOIST
      ?auto_738 - PLACE
      ?auto_736 - PLACE
      ?auto_733 - HOIST
      ?auto_734 - SURFACE
      ?auto_740 - PLACE
      ?auto_739 - HOIST
      ?auto_741 - SURFACE
      ?auto_742 - SURFACE
      ?auto_737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_735 ?auto_738 ) ( IS-CRATE ?auto_732 ) ( not ( = ?auto_736 ?auto_738 ) ) ( HOIST-AT ?auto_733 ?auto_736 ) ( SURFACE-AT ?auto_732 ?auto_736 ) ( ON ?auto_732 ?auto_734 ) ( CLEAR ?auto_732 ) ( not ( = ?auto_731 ?auto_732 ) ) ( not ( = ?auto_731 ?auto_734 ) ) ( not ( = ?auto_732 ?auto_734 ) ) ( not ( = ?auto_735 ?auto_733 ) ) ( IS-CRATE ?auto_731 ) ( not ( = ?auto_740 ?auto_738 ) ) ( HOIST-AT ?auto_739 ?auto_740 ) ( AVAILABLE ?auto_739 ) ( SURFACE-AT ?auto_731 ?auto_740 ) ( ON ?auto_731 ?auto_741 ) ( CLEAR ?auto_731 ) ( not ( = ?auto_730 ?auto_731 ) ) ( not ( = ?auto_730 ?auto_741 ) ) ( not ( = ?auto_731 ?auto_741 ) ) ( not ( = ?auto_735 ?auto_739 ) ) ( SURFACE-AT ?auto_729 ?auto_738 ) ( CLEAR ?auto_729 ) ( IS-CRATE ?auto_730 ) ( AVAILABLE ?auto_735 ) ( AVAILABLE ?auto_733 ) ( SURFACE-AT ?auto_730 ?auto_736 ) ( ON ?auto_730 ?auto_742 ) ( CLEAR ?auto_730 ) ( TRUCK-AT ?auto_737 ?auto_738 ) ( not ( = ?auto_729 ?auto_730 ) ) ( not ( = ?auto_729 ?auto_742 ) ) ( not ( = ?auto_730 ?auto_742 ) ) ( not ( = ?auto_729 ?auto_731 ) ) ( not ( = ?auto_729 ?auto_741 ) ) ( not ( = ?auto_731 ?auto_742 ) ) ( not ( = ?auto_740 ?auto_736 ) ) ( not ( = ?auto_739 ?auto_733 ) ) ( not ( = ?auto_741 ?auto_742 ) ) ( not ( = ?auto_729 ?auto_732 ) ) ( not ( = ?auto_729 ?auto_734 ) ) ( not ( = ?auto_730 ?auto_732 ) ) ( not ( = ?auto_730 ?auto_734 ) ) ( not ( = ?auto_732 ?auto_741 ) ) ( not ( = ?auto_732 ?auto_742 ) ) ( not ( = ?auto_734 ?auto_741 ) ) ( not ( = ?auto_734 ?auto_742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_729 ?auto_730 ?auto_731 )
      ( MAKE-1CRATE ?auto_731 ?auto_732 )
      ( MAKE-3CRATE-VERIFY ?auto_729 ?auto_730 ?auto_731 ?auto_732 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_745 - SURFACE
      ?auto_746 - SURFACE
    )
    :vars
    (
      ?auto_747 - HOIST
      ?auto_748 - PLACE
      ?auto_750 - PLACE
      ?auto_751 - HOIST
      ?auto_752 - SURFACE
      ?auto_749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_747 ?auto_748 ) ( SURFACE-AT ?auto_745 ?auto_748 ) ( CLEAR ?auto_745 ) ( IS-CRATE ?auto_746 ) ( AVAILABLE ?auto_747 ) ( not ( = ?auto_750 ?auto_748 ) ) ( HOIST-AT ?auto_751 ?auto_750 ) ( AVAILABLE ?auto_751 ) ( SURFACE-AT ?auto_746 ?auto_750 ) ( ON ?auto_746 ?auto_752 ) ( CLEAR ?auto_746 ) ( TRUCK-AT ?auto_749 ?auto_748 ) ( not ( = ?auto_745 ?auto_746 ) ) ( not ( = ?auto_745 ?auto_752 ) ) ( not ( = ?auto_746 ?auto_752 ) ) ( not ( = ?auto_747 ?auto_751 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_749 ?auto_748 ?auto_750 )
      ( !LIFT ?auto_751 ?auto_746 ?auto_752 ?auto_750 )
      ( !LOAD ?auto_751 ?auto_746 ?auto_749 ?auto_750 )
      ( !DRIVE ?auto_749 ?auto_750 ?auto_748 )
      ( !UNLOAD ?auto_747 ?auto_746 ?auto_749 ?auto_748 )
      ( !DROP ?auto_747 ?auto_746 ?auto_745 ?auto_748 )
      ( MAKE-1CRATE-VERIFY ?auto_745 ?auto_746 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_758 - SURFACE
      ?auto_759 - SURFACE
      ?auto_760 - SURFACE
      ?auto_761 - SURFACE
      ?auto_762 - SURFACE
    )
    :vars
    (
      ?auto_765 - HOIST
      ?auto_768 - PLACE
      ?auto_766 - PLACE
      ?auto_764 - HOIST
      ?auto_763 - SURFACE
      ?auto_772 - SURFACE
      ?auto_773 - PLACE
      ?auto_769 - HOIST
      ?auto_771 - SURFACE
      ?auto_770 - SURFACE
      ?auto_767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_765 ?auto_768 ) ( IS-CRATE ?auto_762 ) ( not ( = ?auto_766 ?auto_768 ) ) ( HOIST-AT ?auto_764 ?auto_766 ) ( SURFACE-AT ?auto_762 ?auto_766 ) ( ON ?auto_762 ?auto_763 ) ( CLEAR ?auto_762 ) ( not ( = ?auto_761 ?auto_762 ) ) ( not ( = ?auto_761 ?auto_763 ) ) ( not ( = ?auto_762 ?auto_763 ) ) ( not ( = ?auto_765 ?auto_764 ) ) ( IS-CRATE ?auto_761 ) ( SURFACE-AT ?auto_761 ?auto_766 ) ( ON ?auto_761 ?auto_772 ) ( CLEAR ?auto_761 ) ( not ( = ?auto_760 ?auto_761 ) ) ( not ( = ?auto_760 ?auto_772 ) ) ( not ( = ?auto_761 ?auto_772 ) ) ( IS-CRATE ?auto_760 ) ( not ( = ?auto_773 ?auto_768 ) ) ( HOIST-AT ?auto_769 ?auto_773 ) ( AVAILABLE ?auto_769 ) ( SURFACE-AT ?auto_760 ?auto_773 ) ( ON ?auto_760 ?auto_771 ) ( CLEAR ?auto_760 ) ( not ( = ?auto_759 ?auto_760 ) ) ( not ( = ?auto_759 ?auto_771 ) ) ( not ( = ?auto_760 ?auto_771 ) ) ( not ( = ?auto_765 ?auto_769 ) ) ( SURFACE-AT ?auto_758 ?auto_768 ) ( CLEAR ?auto_758 ) ( IS-CRATE ?auto_759 ) ( AVAILABLE ?auto_765 ) ( AVAILABLE ?auto_764 ) ( SURFACE-AT ?auto_759 ?auto_766 ) ( ON ?auto_759 ?auto_770 ) ( CLEAR ?auto_759 ) ( TRUCK-AT ?auto_767 ?auto_768 ) ( not ( = ?auto_758 ?auto_759 ) ) ( not ( = ?auto_758 ?auto_770 ) ) ( not ( = ?auto_759 ?auto_770 ) ) ( not ( = ?auto_758 ?auto_760 ) ) ( not ( = ?auto_758 ?auto_771 ) ) ( not ( = ?auto_760 ?auto_770 ) ) ( not ( = ?auto_773 ?auto_766 ) ) ( not ( = ?auto_769 ?auto_764 ) ) ( not ( = ?auto_771 ?auto_770 ) ) ( not ( = ?auto_758 ?auto_761 ) ) ( not ( = ?auto_758 ?auto_772 ) ) ( not ( = ?auto_759 ?auto_761 ) ) ( not ( = ?auto_759 ?auto_772 ) ) ( not ( = ?auto_761 ?auto_771 ) ) ( not ( = ?auto_761 ?auto_770 ) ) ( not ( = ?auto_772 ?auto_771 ) ) ( not ( = ?auto_772 ?auto_770 ) ) ( not ( = ?auto_758 ?auto_762 ) ) ( not ( = ?auto_758 ?auto_763 ) ) ( not ( = ?auto_759 ?auto_762 ) ) ( not ( = ?auto_759 ?auto_763 ) ) ( not ( = ?auto_760 ?auto_762 ) ) ( not ( = ?auto_760 ?auto_763 ) ) ( not ( = ?auto_762 ?auto_772 ) ) ( not ( = ?auto_762 ?auto_771 ) ) ( not ( = ?auto_762 ?auto_770 ) ) ( not ( = ?auto_763 ?auto_772 ) ) ( not ( = ?auto_763 ?auto_771 ) ) ( not ( = ?auto_763 ?auto_770 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_758 ?auto_759 ?auto_760 ?auto_761 )
      ( MAKE-1CRATE ?auto_761 ?auto_762 )
      ( MAKE-4CRATE-VERIFY ?auto_758 ?auto_759 ?auto_760 ?auto_761 ?auto_762 ) )
  )

)

