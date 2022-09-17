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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_703 - SURFACE
      ?auto_704 - SURFACE
      ?auto_705 - SURFACE
    )
    :vars
    (
      ?auto_710 - HOIST
      ?auto_709 - PLACE
      ?auto_707 - PLACE
      ?auto_708 - HOIST
      ?auto_711 - SURFACE
      ?auto_713 - PLACE
      ?auto_714 - HOIST
      ?auto_712 - SURFACE
      ?auto_706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_710 ?auto_709 ) ( IS-CRATE ?auto_705 ) ( not ( = ?auto_707 ?auto_709 ) ) ( HOIST-AT ?auto_708 ?auto_707 ) ( AVAILABLE ?auto_708 ) ( SURFACE-AT ?auto_705 ?auto_707 ) ( ON ?auto_705 ?auto_711 ) ( CLEAR ?auto_705 ) ( not ( = ?auto_704 ?auto_705 ) ) ( not ( = ?auto_704 ?auto_711 ) ) ( not ( = ?auto_705 ?auto_711 ) ) ( not ( = ?auto_710 ?auto_708 ) ) ( SURFACE-AT ?auto_703 ?auto_709 ) ( CLEAR ?auto_703 ) ( IS-CRATE ?auto_704 ) ( AVAILABLE ?auto_710 ) ( not ( = ?auto_713 ?auto_709 ) ) ( HOIST-AT ?auto_714 ?auto_713 ) ( AVAILABLE ?auto_714 ) ( SURFACE-AT ?auto_704 ?auto_713 ) ( ON ?auto_704 ?auto_712 ) ( CLEAR ?auto_704 ) ( TRUCK-AT ?auto_706 ?auto_709 ) ( not ( = ?auto_703 ?auto_704 ) ) ( not ( = ?auto_703 ?auto_712 ) ) ( not ( = ?auto_704 ?auto_712 ) ) ( not ( = ?auto_710 ?auto_714 ) ) ( not ( = ?auto_703 ?auto_705 ) ) ( not ( = ?auto_703 ?auto_711 ) ) ( not ( = ?auto_705 ?auto_712 ) ) ( not ( = ?auto_707 ?auto_713 ) ) ( not ( = ?auto_708 ?auto_714 ) ) ( not ( = ?auto_711 ?auto_712 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_703 ?auto_704 )
      ( MAKE-1CRATE ?auto_704 ?auto_705 )
      ( MAKE-2CRATE-VERIFY ?auto_703 ?auto_704 ?auto_705 ) )
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
      ?auto_734 - HOIST
      ?auto_736 - PLACE
      ?auto_733 - PLACE
      ?auto_738 - HOIST
      ?auto_735 - SURFACE
      ?auto_739 - PLACE
      ?auto_742 - HOIST
      ?auto_740 - SURFACE
      ?auto_741 - SURFACE
      ?auto_737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_734 ?auto_736 ) ( IS-CRATE ?auto_732 ) ( not ( = ?auto_733 ?auto_736 ) ) ( HOIST-AT ?auto_738 ?auto_733 ) ( SURFACE-AT ?auto_732 ?auto_733 ) ( ON ?auto_732 ?auto_735 ) ( CLEAR ?auto_732 ) ( not ( = ?auto_731 ?auto_732 ) ) ( not ( = ?auto_731 ?auto_735 ) ) ( not ( = ?auto_732 ?auto_735 ) ) ( not ( = ?auto_734 ?auto_738 ) ) ( IS-CRATE ?auto_731 ) ( not ( = ?auto_739 ?auto_736 ) ) ( HOIST-AT ?auto_742 ?auto_739 ) ( AVAILABLE ?auto_742 ) ( SURFACE-AT ?auto_731 ?auto_739 ) ( ON ?auto_731 ?auto_740 ) ( CLEAR ?auto_731 ) ( not ( = ?auto_730 ?auto_731 ) ) ( not ( = ?auto_730 ?auto_740 ) ) ( not ( = ?auto_731 ?auto_740 ) ) ( not ( = ?auto_734 ?auto_742 ) ) ( SURFACE-AT ?auto_729 ?auto_736 ) ( CLEAR ?auto_729 ) ( IS-CRATE ?auto_730 ) ( AVAILABLE ?auto_734 ) ( AVAILABLE ?auto_738 ) ( SURFACE-AT ?auto_730 ?auto_733 ) ( ON ?auto_730 ?auto_741 ) ( CLEAR ?auto_730 ) ( TRUCK-AT ?auto_737 ?auto_736 ) ( not ( = ?auto_729 ?auto_730 ) ) ( not ( = ?auto_729 ?auto_741 ) ) ( not ( = ?auto_730 ?auto_741 ) ) ( not ( = ?auto_729 ?auto_731 ) ) ( not ( = ?auto_729 ?auto_740 ) ) ( not ( = ?auto_731 ?auto_741 ) ) ( not ( = ?auto_739 ?auto_733 ) ) ( not ( = ?auto_742 ?auto_738 ) ) ( not ( = ?auto_740 ?auto_741 ) ) ( not ( = ?auto_729 ?auto_732 ) ) ( not ( = ?auto_729 ?auto_735 ) ) ( not ( = ?auto_730 ?auto_732 ) ) ( not ( = ?auto_730 ?auto_735 ) ) ( not ( = ?auto_732 ?auto_740 ) ) ( not ( = ?auto_732 ?auto_741 ) ) ( not ( = ?auto_735 ?auto_740 ) ) ( not ( = ?auto_735 ?auto_741 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_729 ?auto_730 ?auto_731 )
      ( MAKE-1CRATE ?auto_731 ?auto_732 )
      ( MAKE-3CRATE-VERIFY ?auto_729 ?auto_730 ?auto_731 ?auto_732 ) )
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
      ?auto_766 - PLACE
      ?auto_767 - PLACE
      ?auto_763 - HOIST
      ?auto_768 - SURFACE
      ?auto_771 - SURFACE
      ?auto_770 - PLACE
      ?auto_773 - HOIST
      ?auto_769 - SURFACE
      ?auto_772 - SURFACE
      ?auto_764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_765 ?auto_766 ) ( IS-CRATE ?auto_762 ) ( not ( = ?auto_767 ?auto_766 ) ) ( HOIST-AT ?auto_763 ?auto_767 ) ( SURFACE-AT ?auto_762 ?auto_767 ) ( ON ?auto_762 ?auto_768 ) ( CLEAR ?auto_762 ) ( not ( = ?auto_761 ?auto_762 ) ) ( not ( = ?auto_761 ?auto_768 ) ) ( not ( = ?auto_762 ?auto_768 ) ) ( not ( = ?auto_765 ?auto_763 ) ) ( IS-CRATE ?auto_761 ) ( SURFACE-AT ?auto_761 ?auto_767 ) ( ON ?auto_761 ?auto_771 ) ( CLEAR ?auto_761 ) ( not ( = ?auto_760 ?auto_761 ) ) ( not ( = ?auto_760 ?auto_771 ) ) ( not ( = ?auto_761 ?auto_771 ) ) ( IS-CRATE ?auto_760 ) ( not ( = ?auto_770 ?auto_766 ) ) ( HOIST-AT ?auto_773 ?auto_770 ) ( AVAILABLE ?auto_773 ) ( SURFACE-AT ?auto_760 ?auto_770 ) ( ON ?auto_760 ?auto_769 ) ( CLEAR ?auto_760 ) ( not ( = ?auto_759 ?auto_760 ) ) ( not ( = ?auto_759 ?auto_769 ) ) ( not ( = ?auto_760 ?auto_769 ) ) ( not ( = ?auto_765 ?auto_773 ) ) ( SURFACE-AT ?auto_758 ?auto_766 ) ( CLEAR ?auto_758 ) ( IS-CRATE ?auto_759 ) ( AVAILABLE ?auto_765 ) ( AVAILABLE ?auto_763 ) ( SURFACE-AT ?auto_759 ?auto_767 ) ( ON ?auto_759 ?auto_772 ) ( CLEAR ?auto_759 ) ( TRUCK-AT ?auto_764 ?auto_766 ) ( not ( = ?auto_758 ?auto_759 ) ) ( not ( = ?auto_758 ?auto_772 ) ) ( not ( = ?auto_759 ?auto_772 ) ) ( not ( = ?auto_758 ?auto_760 ) ) ( not ( = ?auto_758 ?auto_769 ) ) ( not ( = ?auto_760 ?auto_772 ) ) ( not ( = ?auto_770 ?auto_767 ) ) ( not ( = ?auto_773 ?auto_763 ) ) ( not ( = ?auto_769 ?auto_772 ) ) ( not ( = ?auto_758 ?auto_761 ) ) ( not ( = ?auto_758 ?auto_771 ) ) ( not ( = ?auto_759 ?auto_761 ) ) ( not ( = ?auto_759 ?auto_771 ) ) ( not ( = ?auto_761 ?auto_769 ) ) ( not ( = ?auto_761 ?auto_772 ) ) ( not ( = ?auto_771 ?auto_769 ) ) ( not ( = ?auto_771 ?auto_772 ) ) ( not ( = ?auto_758 ?auto_762 ) ) ( not ( = ?auto_758 ?auto_768 ) ) ( not ( = ?auto_759 ?auto_762 ) ) ( not ( = ?auto_759 ?auto_768 ) ) ( not ( = ?auto_760 ?auto_762 ) ) ( not ( = ?auto_760 ?auto_768 ) ) ( not ( = ?auto_762 ?auto_771 ) ) ( not ( = ?auto_762 ?auto_769 ) ) ( not ( = ?auto_762 ?auto_772 ) ) ( not ( = ?auto_768 ?auto_771 ) ) ( not ( = ?auto_768 ?auto_769 ) ) ( not ( = ?auto_768 ?auto_772 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_758 ?auto_759 ?auto_760 ?auto_761 )
      ( MAKE-1CRATE ?auto_761 ?auto_762 )
      ( MAKE-4CRATE-VERIFY ?auto_758 ?auto_759 ?auto_760 ?auto_761 ?auto_762 ) )
  )

)

