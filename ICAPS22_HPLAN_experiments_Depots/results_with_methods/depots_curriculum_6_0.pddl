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
      ?auto_702 - SURFACE
      ?auto_703 - SURFACE
    )
    :vars
    (
      ?auto_704 - HOIST
      ?auto_705 - PLACE
      ?auto_707 - PLACE
      ?auto_708 - HOIST
      ?auto_709 - SURFACE
      ?auto_706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_704 ?auto_705 ) ( SURFACE-AT ?auto_703 ?auto_705 ) ( CLEAR ?auto_703 ) ( IS-CRATE ?auto_702 ) ( AVAILABLE ?auto_704 ) ( not ( = ?auto_707 ?auto_705 ) ) ( HOIST-AT ?auto_708 ?auto_707 ) ( AVAILABLE ?auto_708 ) ( SURFACE-AT ?auto_702 ?auto_707 ) ( ON ?auto_702 ?auto_709 ) ( CLEAR ?auto_702 ) ( TRUCK-AT ?auto_706 ?auto_705 ) ( not ( = ?auto_702 ?auto_703 ) ) ( not ( = ?auto_702 ?auto_709 ) ) ( not ( = ?auto_703 ?auto_709 ) ) ( not ( = ?auto_704 ?auto_708 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_706 ?auto_705 ?auto_707 )
      ( !LIFT ?auto_708 ?auto_702 ?auto_709 ?auto_707 )
      ( !LOAD ?auto_708 ?auto_702 ?auto_706 ?auto_707 )
      ( !DRIVE ?auto_706 ?auto_707 ?auto_705 )
      ( !UNLOAD ?auto_704 ?auto_702 ?auto_706 ?auto_705 )
      ( !DROP ?auto_704 ?auto_702 ?auto_703 ?auto_705 )
      ( MAKE-ON-VERIFY ?auto_702 ?auto_703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_712 - SURFACE
      ?auto_713 - SURFACE
    )
    :vars
    (
      ?auto_714 - HOIST
      ?auto_715 - PLACE
      ?auto_717 - PLACE
      ?auto_718 - HOIST
      ?auto_719 - SURFACE
      ?auto_716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_714 ?auto_715 ) ( SURFACE-AT ?auto_713 ?auto_715 ) ( CLEAR ?auto_713 ) ( IS-CRATE ?auto_712 ) ( AVAILABLE ?auto_714 ) ( not ( = ?auto_717 ?auto_715 ) ) ( HOIST-AT ?auto_718 ?auto_717 ) ( AVAILABLE ?auto_718 ) ( SURFACE-AT ?auto_712 ?auto_717 ) ( ON ?auto_712 ?auto_719 ) ( CLEAR ?auto_712 ) ( TRUCK-AT ?auto_716 ?auto_715 ) ( not ( = ?auto_712 ?auto_713 ) ) ( not ( = ?auto_712 ?auto_719 ) ) ( not ( = ?auto_713 ?auto_719 ) ) ( not ( = ?auto_714 ?auto_718 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_716 ?auto_715 ?auto_717 )
      ( !LIFT ?auto_718 ?auto_712 ?auto_719 ?auto_717 )
      ( !LOAD ?auto_718 ?auto_712 ?auto_716 ?auto_717 )
      ( !DRIVE ?auto_716 ?auto_717 ?auto_715 )
      ( !UNLOAD ?auto_714 ?auto_712 ?auto_716 ?auto_715 )
      ( !DROP ?auto_714 ?auto_712 ?auto_713 ?auto_715 )
      ( MAKE-ON-VERIFY ?auto_712 ?auto_713 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_722 - SURFACE
      ?auto_723 - SURFACE
    )
    :vars
    (
      ?auto_724 - HOIST
      ?auto_725 - PLACE
      ?auto_727 - PLACE
      ?auto_728 - HOIST
      ?auto_729 - SURFACE
      ?auto_726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_724 ?auto_725 ) ( SURFACE-AT ?auto_723 ?auto_725 ) ( CLEAR ?auto_723 ) ( IS-CRATE ?auto_722 ) ( AVAILABLE ?auto_724 ) ( not ( = ?auto_727 ?auto_725 ) ) ( HOIST-AT ?auto_728 ?auto_727 ) ( AVAILABLE ?auto_728 ) ( SURFACE-AT ?auto_722 ?auto_727 ) ( ON ?auto_722 ?auto_729 ) ( CLEAR ?auto_722 ) ( TRUCK-AT ?auto_726 ?auto_725 ) ( not ( = ?auto_722 ?auto_723 ) ) ( not ( = ?auto_722 ?auto_729 ) ) ( not ( = ?auto_723 ?auto_729 ) ) ( not ( = ?auto_724 ?auto_728 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_726 ?auto_725 ?auto_727 )
      ( !LIFT ?auto_728 ?auto_722 ?auto_729 ?auto_727 )
      ( !LOAD ?auto_728 ?auto_722 ?auto_726 ?auto_727 )
      ( !DRIVE ?auto_726 ?auto_727 ?auto_725 )
      ( !UNLOAD ?auto_724 ?auto_722 ?auto_726 ?auto_725 )
      ( !DROP ?auto_724 ?auto_722 ?auto_723 ?auto_725 )
      ( MAKE-ON-VERIFY ?auto_722 ?auto_723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_732 - SURFACE
      ?auto_733 - SURFACE
    )
    :vars
    (
      ?auto_734 - HOIST
      ?auto_735 - PLACE
      ?auto_737 - PLACE
      ?auto_738 - HOIST
      ?auto_739 - SURFACE
      ?auto_736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_734 ?auto_735 ) ( SURFACE-AT ?auto_733 ?auto_735 ) ( CLEAR ?auto_733 ) ( IS-CRATE ?auto_732 ) ( AVAILABLE ?auto_734 ) ( not ( = ?auto_737 ?auto_735 ) ) ( HOIST-AT ?auto_738 ?auto_737 ) ( AVAILABLE ?auto_738 ) ( SURFACE-AT ?auto_732 ?auto_737 ) ( ON ?auto_732 ?auto_739 ) ( CLEAR ?auto_732 ) ( TRUCK-AT ?auto_736 ?auto_735 ) ( not ( = ?auto_732 ?auto_733 ) ) ( not ( = ?auto_732 ?auto_739 ) ) ( not ( = ?auto_733 ?auto_739 ) ) ( not ( = ?auto_734 ?auto_738 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_736 ?auto_735 ?auto_737 )
      ( !LIFT ?auto_738 ?auto_732 ?auto_739 ?auto_737 )
      ( !LOAD ?auto_738 ?auto_732 ?auto_736 ?auto_737 )
      ( !DRIVE ?auto_736 ?auto_737 ?auto_735 )
      ( !UNLOAD ?auto_734 ?auto_732 ?auto_736 ?auto_735 )
      ( !DROP ?auto_734 ?auto_732 ?auto_733 ?auto_735 )
      ( MAKE-ON-VERIFY ?auto_732 ?auto_733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_742 - SURFACE
      ?auto_743 - SURFACE
    )
    :vars
    (
      ?auto_744 - HOIST
      ?auto_745 - PLACE
      ?auto_747 - PLACE
      ?auto_748 - HOIST
      ?auto_749 - SURFACE
      ?auto_746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744 ?auto_745 ) ( SURFACE-AT ?auto_743 ?auto_745 ) ( CLEAR ?auto_743 ) ( IS-CRATE ?auto_742 ) ( AVAILABLE ?auto_744 ) ( not ( = ?auto_747 ?auto_745 ) ) ( HOIST-AT ?auto_748 ?auto_747 ) ( AVAILABLE ?auto_748 ) ( SURFACE-AT ?auto_742 ?auto_747 ) ( ON ?auto_742 ?auto_749 ) ( CLEAR ?auto_742 ) ( TRUCK-AT ?auto_746 ?auto_745 ) ( not ( = ?auto_742 ?auto_743 ) ) ( not ( = ?auto_742 ?auto_749 ) ) ( not ( = ?auto_743 ?auto_749 ) ) ( not ( = ?auto_744 ?auto_748 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_746 ?auto_745 ?auto_747 )
      ( !LIFT ?auto_748 ?auto_742 ?auto_749 ?auto_747 )
      ( !LOAD ?auto_748 ?auto_742 ?auto_746 ?auto_747 )
      ( !DRIVE ?auto_746 ?auto_747 ?auto_745 )
      ( !UNLOAD ?auto_744 ?auto_742 ?auto_746 ?auto_745 )
      ( !DROP ?auto_744 ?auto_742 ?auto_743 ?auto_745 )
      ( MAKE-ON-VERIFY ?auto_742 ?auto_743 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_752 - SURFACE
      ?auto_753 - SURFACE
    )
    :vars
    (
      ?auto_754 - HOIST
      ?auto_755 - PLACE
      ?auto_757 - PLACE
      ?auto_758 - HOIST
      ?auto_759 - SURFACE
      ?auto_756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_754 ?auto_755 ) ( SURFACE-AT ?auto_753 ?auto_755 ) ( CLEAR ?auto_753 ) ( IS-CRATE ?auto_752 ) ( AVAILABLE ?auto_754 ) ( not ( = ?auto_757 ?auto_755 ) ) ( HOIST-AT ?auto_758 ?auto_757 ) ( AVAILABLE ?auto_758 ) ( SURFACE-AT ?auto_752 ?auto_757 ) ( ON ?auto_752 ?auto_759 ) ( CLEAR ?auto_752 ) ( TRUCK-AT ?auto_756 ?auto_755 ) ( not ( = ?auto_752 ?auto_753 ) ) ( not ( = ?auto_752 ?auto_759 ) ) ( not ( = ?auto_753 ?auto_759 ) ) ( not ( = ?auto_754 ?auto_758 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_756 ?auto_755 ?auto_757 )
      ( !LIFT ?auto_758 ?auto_752 ?auto_759 ?auto_757 )
      ( !LOAD ?auto_758 ?auto_752 ?auto_756 ?auto_757 )
      ( !DRIVE ?auto_756 ?auto_757 ?auto_755 )
      ( !UNLOAD ?auto_754 ?auto_752 ?auto_756 ?auto_755 )
      ( !DROP ?auto_754 ?auto_752 ?auto_753 ?auto_755 )
      ( MAKE-ON-VERIFY ?auto_752 ?auto_753 ) )
  )

)

