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
      ?auto_52717 - SURFACE
      ?auto_52718 - SURFACE
    )
    :vars
    (
      ?auto_52719 - HOIST
      ?auto_52720 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52719 ?auto_52720 ) ( SURFACE-AT ?auto_52718 ?auto_52720 ) ( CLEAR ?auto_52718 ) ( LIFTING ?auto_52719 ?auto_52717 ) ( IS-CRATE ?auto_52717 ) ( not ( = ?auto_52717 ?auto_52718 ) ) )
    :subtasks
    ( ( !DROP ?auto_52719 ?auto_52717 ?auto_52718 ?auto_52720 )
      ( MAKE-ON-VERIFY ?auto_52717 ?auto_52718 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52721 - SURFACE
      ?auto_52722 - SURFACE
    )
    :vars
    (
      ?auto_52723 - HOIST
      ?auto_52724 - PLACE
      ?auto_52725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52723 ?auto_52724 ) ( SURFACE-AT ?auto_52722 ?auto_52724 ) ( CLEAR ?auto_52722 ) ( IS-CRATE ?auto_52721 ) ( not ( = ?auto_52721 ?auto_52722 ) ) ( TRUCK-AT ?auto_52725 ?auto_52724 ) ( AVAILABLE ?auto_52723 ) ( IN ?auto_52721 ?auto_52725 ) )
    :subtasks
    ( ( !UNLOAD ?auto_52723 ?auto_52721 ?auto_52725 ?auto_52724 )
      ( MAKE-ON ?auto_52721 ?auto_52722 )
      ( MAKE-ON-VERIFY ?auto_52721 ?auto_52722 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52726 - SURFACE
      ?auto_52727 - SURFACE
    )
    :vars
    (
      ?auto_52730 - HOIST
      ?auto_52729 - PLACE
      ?auto_52728 - TRUCK
      ?auto_52731 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52730 ?auto_52729 ) ( SURFACE-AT ?auto_52727 ?auto_52729 ) ( CLEAR ?auto_52727 ) ( IS-CRATE ?auto_52726 ) ( not ( = ?auto_52726 ?auto_52727 ) ) ( AVAILABLE ?auto_52730 ) ( IN ?auto_52726 ?auto_52728 ) ( TRUCK-AT ?auto_52728 ?auto_52731 ) ( not ( = ?auto_52731 ?auto_52729 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_52728 ?auto_52731 ?auto_52729 )
      ( MAKE-ON ?auto_52726 ?auto_52727 )
      ( MAKE-ON-VERIFY ?auto_52726 ?auto_52727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52732 - SURFACE
      ?auto_52733 - SURFACE
    )
    :vars
    (
      ?auto_52737 - HOIST
      ?auto_52734 - PLACE
      ?auto_52736 - TRUCK
      ?auto_52735 - PLACE
      ?auto_52738 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_52737 ?auto_52734 ) ( SURFACE-AT ?auto_52733 ?auto_52734 ) ( CLEAR ?auto_52733 ) ( IS-CRATE ?auto_52732 ) ( not ( = ?auto_52732 ?auto_52733 ) ) ( AVAILABLE ?auto_52737 ) ( TRUCK-AT ?auto_52736 ?auto_52735 ) ( not ( = ?auto_52735 ?auto_52734 ) ) ( HOIST-AT ?auto_52738 ?auto_52735 ) ( LIFTING ?auto_52738 ?auto_52732 ) ( not ( = ?auto_52737 ?auto_52738 ) ) )
    :subtasks
    ( ( !LOAD ?auto_52738 ?auto_52732 ?auto_52736 ?auto_52735 )
      ( MAKE-ON ?auto_52732 ?auto_52733 )
      ( MAKE-ON-VERIFY ?auto_52732 ?auto_52733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52739 - SURFACE
      ?auto_52740 - SURFACE
    )
    :vars
    (
      ?auto_52745 - HOIST
      ?auto_52742 - PLACE
      ?auto_52744 - TRUCK
      ?auto_52741 - PLACE
      ?auto_52743 - HOIST
      ?auto_52746 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52745 ?auto_52742 ) ( SURFACE-AT ?auto_52740 ?auto_52742 ) ( CLEAR ?auto_52740 ) ( IS-CRATE ?auto_52739 ) ( not ( = ?auto_52739 ?auto_52740 ) ) ( AVAILABLE ?auto_52745 ) ( TRUCK-AT ?auto_52744 ?auto_52741 ) ( not ( = ?auto_52741 ?auto_52742 ) ) ( HOIST-AT ?auto_52743 ?auto_52741 ) ( not ( = ?auto_52745 ?auto_52743 ) ) ( AVAILABLE ?auto_52743 ) ( SURFACE-AT ?auto_52739 ?auto_52741 ) ( ON ?auto_52739 ?auto_52746 ) ( CLEAR ?auto_52739 ) ( not ( = ?auto_52739 ?auto_52746 ) ) ( not ( = ?auto_52740 ?auto_52746 ) ) )
    :subtasks
    ( ( !LIFT ?auto_52743 ?auto_52739 ?auto_52746 ?auto_52741 )
      ( MAKE-ON ?auto_52739 ?auto_52740 )
      ( MAKE-ON-VERIFY ?auto_52739 ?auto_52740 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52747 - SURFACE
      ?auto_52748 - SURFACE
    )
    :vars
    (
      ?auto_52752 - HOIST
      ?auto_52749 - PLACE
      ?auto_52754 - PLACE
      ?auto_52750 - HOIST
      ?auto_52753 - SURFACE
      ?auto_52751 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52752 ?auto_52749 ) ( SURFACE-AT ?auto_52748 ?auto_52749 ) ( CLEAR ?auto_52748 ) ( IS-CRATE ?auto_52747 ) ( not ( = ?auto_52747 ?auto_52748 ) ) ( AVAILABLE ?auto_52752 ) ( not ( = ?auto_52754 ?auto_52749 ) ) ( HOIST-AT ?auto_52750 ?auto_52754 ) ( not ( = ?auto_52752 ?auto_52750 ) ) ( AVAILABLE ?auto_52750 ) ( SURFACE-AT ?auto_52747 ?auto_52754 ) ( ON ?auto_52747 ?auto_52753 ) ( CLEAR ?auto_52747 ) ( not ( = ?auto_52747 ?auto_52753 ) ) ( not ( = ?auto_52748 ?auto_52753 ) ) ( TRUCK-AT ?auto_52751 ?auto_52749 ) )
    :subtasks
    ( ( !DRIVE ?auto_52751 ?auto_52749 ?auto_52754 )
      ( MAKE-ON ?auto_52747 ?auto_52748 )
      ( MAKE-ON-VERIFY ?auto_52747 ?auto_52748 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52795 - SURFACE
      ?auto_52796 - SURFACE
    )
    :vars
    (
      ?auto_52797 - HOIST
      ?auto_52799 - PLACE
      ?auto_52801 - PLACE
      ?auto_52802 - HOIST
      ?auto_52798 - SURFACE
      ?auto_52800 - TRUCK
      ?auto_52803 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52797 ?auto_52799 ) ( IS-CRATE ?auto_52795 ) ( not ( = ?auto_52795 ?auto_52796 ) ) ( not ( = ?auto_52801 ?auto_52799 ) ) ( HOIST-AT ?auto_52802 ?auto_52801 ) ( not ( = ?auto_52797 ?auto_52802 ) ) ( AVAILABLE ?auto_52802 ) ( SURFACE-AT ?auto_52795 ?auto_52801 ) ( ON ?auto_52795 ?auto_52798 ) ( CLEAR ?auto_52795 ) ( not ( = ?auto_52795 ?auto_52798 ) ) ( not ( = ?auto_52796 ?auto_52798 ) ) ( TRUCK-AT ?auto_52800 ?auto_52799 ) ( SURFACE-AT ?auto_52803 ?auto_52799 ) ( CLEAR ?auto_52803 ) ( LIFTING ?auto_52797 ?auto_52796 ) ( IS-CRATE ?auto_52796 ) ( not ( = ?auto_52795 ?auto_52803 ) ) ( not ( = ?auto_52796 ?auto_52803 ) ) ( not ( = ?auto_52798 ?auto_52803 ) ) )
    :subtasks
    ( ( !DROP ?auto_52797 ?auto_52796 ?auto_52803 ?auto_52799 )
      ( MAKE-ON ?auto_52795 ?auto_52796 )
      ( MAKE-ON-VERIFY ?auto_52795 ?auto_52796 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52804 - SURFACE
      ?auto_52805 - SURFACE
    )
    :vars
    (
      ?auto_52809 - HOIST
      ?auto_52810 - PLACE
      ?auto_52812 - PLACE
      ?auto_52806 - HOIST
      ?auto_52808 - SURFACE
      ?auto_52807 - TRUCK
      ?auto_52811 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52809 ?auto_52810 ) ( IS-CRATE ?auto_52804 ) ( not ( = ?auto_52804 ?auto_52805 ) ) ( not ( = ?auto_52812 ?auto_52810 ) ) ( HOIST-AT ?auto_52806 ?auto_52812 ) ( not ( = ?auto_52809 ?auto_52806 ) ) ( AVAILABLE ?auto_52806 ) ( SURFACE-AT ?auto_52804 ?auto_52812 ) ( ON ?auto_52804 ?auto_52808 ) ( CLEAR ?auto_52804 ) ( not ( = ?auto_52804 ?auto_52808 ) ) ( not ( = ?auto_52805 ?auto_52808 ) ) ( TRUCK-AT ?auto_52807 ?auto_52810 ) ( SURFACE-AT ?auto_52811 ?auto_52810 ) ( CLEAR ?auto_52811 ) ( IS-CRATE ?auto_52805 ) ( not ( = ?auto_52804 ?auto_52811 ) ) ( not ( = ?auto_52805 ?auto_52811 ) ) ( not ( = ?auto_52808 ?auto_52811 ) ) ( AVAILABLE ?auto_52809 ) ( IN ?auto_52805 ?auto_52807 ) )
    :subtasks
    ( ( !UNLOAD ?auto_52809 ?auto_52805 ?auto_52807 ?auto_52810 )
      ( MAKE-ON ?auto_52804 ?auto_52805 )
      ( MAKE-ON-VERIFY ?auto_52804 ?auto_52805 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52819 - SURFACE
      ?auto_52820 - SURFACE
    )
    :vars
    (
      ?auto_52821 - HOIST
      ?auto_52825 - PLACE
      ?auto_52823 - PLACE
      ?auto_52822 - HOIST
      ?auto_52824 - SURFACE
      ?auto_52826 - TRUCK
      ?auto_52827 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52821 ?auto_52825 ) ( SURFACE-AT ?auto_52820 ?auto_52825 ) ( CLEAR ?auto_52820 ) ( IS-CRATE ?auto_52819 ) ( not ( = ?auto_52819 ?auto_52820 ) ) ( AVAILABLE ?auto_52821 ) ( not ( = ?auto_52823 ?auto_52825 ) ) ( HOIST-AT ?auto_52822 ?auto_52823 ) ( not ( = ?auto_52821 ?auto_52822 ) ) ( AVAILABLE ?auto_52822 ) ( SURFACE-AT ?auto_52819 ?auto_52823 ) ( ON ?auto_52819 ?auto_52824 ) ( CLEAR ?auto_52819 ) ( not ( = ?auto_52819 ?auto_52824 ) ) ( not ( = ?auto_52820 ?auto_52824 ) ) ( TRUCK-AT ?auto_52826 ?auto_52827 ) ( not ( = ?auto_52827 ?auto_52825 ) ) ( not ( = ?auto_52823 ?auto_52827 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_52826 ?auto_52827 ?auto_52825 )
      ( MAKE-ON ?auto_52819 ?auto_52820 )
      ( MAKE-ON-VERIFY ?auto_52819 ?auto_52820 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53500 - SURFACE
      ?auto_53501 - SURFACE
    )
    :vars
    (
      ?auto_53505 - HOIST
      ?auto_53504 - PLACE
      ?auto_53506 - TRUCK
      ?auto_53503 - PLACE
      ?auto_53507 - HOIST
      ?auto_53502 - SURFACE
      ?auto_53508 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53505 ?auto_53504 ) ( SURFACE-AT ?auto_53501 ?auto_53504 ) ( CLEAR ?auto_53501 ) ( IS-CRATE ?auto_53500 ) ( not ( = ?auto_53500 ?auto_53501 ) ) ( AVAILABLE ?auto_53505 ) ( TRUCK-AT ?auto_53506 ?auto_53503 ) ( not ( = ?auto_53503 ?auto_53504 ) ) ( HOIST-AT ?auto_53507 ?auto_53503 ) ( not ( = ?auto_53505 ?auto_53507 ) ) ( SURFACE-AT ?auto_53500 ?auto_53503 ) ( ON ?auto_53500 ?auto_53502 ) ( CLEAR ?auto_53500 ) ( not ( = ?auto_53500 ?auto_53502 ) ) ( not ( = ?auto_53501 ?auto_53502 ) ) ( LIFTING ?auto_53507 ?auto_53508 ) ( IS-CRATE ?auto_53508 ) ( not ( = ?auto_53500 ?auto_53508 ) ) ( not ( = ?auto_53501 ?auto_53508 ) ) ( not ( = ?auto_53502 ?auto_53508 ) ) )
    :subtasks
    ( ( !LOAD ?auto_53507 ?auto_53508 ?auto_53506 ?auto_53503 )
      ( MAKE-ON ?auto_53500 ?auto_53501 )
      ( MAKE-ON-VERIFY ?auto_53500 ?auto_53501 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53664 - SURFACE
      ?auto_53665 - SURFACE
    )
    :vars
    (
      ?auto_53669 - HOIST
      ?auto_53670 - PLACE
      ?auto_53667 - PLACE
      ?auto_53668 - HOIST
      ?auto_53671 - SURFACE
      ?auto_53666 - TRUCK
      ?auto_53672 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53669 ?auto_53670 ) ( SURFACE-AT ?auto_53665 ?auto_53670 ) ( CLEAR ?auto_53665 ) ( IS-CRATE ?auto_53664 ) ( not ( = ?auto_53664 ?auto_53665 ) ) ( not ( = ?auto_53667 ?auto_53670 ) ) ( HOIST-AT ?auto_53668 ?auto_53667 ) ( not ( = ?auto_53669 ?auto_53668 ) ) ( AVAILABLE ?auto_53668 ) ( SURFACE-AT ?auto_53664 ?auto_53667 ) ( ON ?auto_53664 ?auto_53671 ) ( CLEAR ?auto_53664 ) ( not ( = ?auto_53664 ?auto_53671 ) ) ( not ( = ?auto_53665 ?auto_53671 ) ) ( TRUCK-AT ?auto_53666 ?auto_53670 ) ( LIFTING ?auto_53669 ?auto_53672 ) ( IS-CRATE ?auto_53672 ) ( not ( = ?auto_53664 ?auto_53672 ) ) ( not ( = ?auto_53665 ?auto_53672 ) ) ( not ( = ?auto_53671 ?auto_53672 ) ) )
    :subtasks
    ( ( !LOAD ?auto_53669 ?auto_53672 ?auto_53666 ?auto_53670 )
      ( MAKE-ON ?auto_53664 ?auto_53665 )
      ( MAKE-ON-VERIFY ?auto_53664 ?auto_53665 ) )
  )

)

