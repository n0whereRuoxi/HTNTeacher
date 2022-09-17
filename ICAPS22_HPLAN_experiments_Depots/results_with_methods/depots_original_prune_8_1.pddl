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
      ?auto_12705 - SURFACE
      ?auto_12706 - SURFACE
    )
    :vars
    (
      ?auto_12707 - HOIST
      ?auto_12708 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12707 ?auto_12708 ) ( SURFACE-AT ?auto_12706 ?auto_12708 ) ( CLEAR ?auto_12706 ) ( LIFTING ?auto_12707 ?auto_12705 ) ( IS-CRATE ?auto_12705 ) ( not ( = ?auto_12705 ?auto_12706 ) ) )
    :subtasks
    ( ( !DROP ?auto_12707 ?auto_12705 ?auto_12706 ?auto_12708 )
      ( MAKE-ON-VERIFY ?auto_12705 ?auto_12706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12709 - SURFACE
      ?auto_12710 - SURFACE
    )
    :vars
    (
      ?auto_12712 - HOIST
      ?auto_12711 - PLACE
      ?auto_12713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12712 ?auto_12711 ) ( SURFACE-AT ?auto_12710 ?auto_12711 ) ( CLEAR ?auto_12710 ) ( IS-CRATE ?auto_12709 ) ( not ( = ?auto_12709 ?auto_12710 ) ) ( TRUCK-AT ?auto_12713 ?auto_12711 ) ( AVAILABLE ?auto_12712 ) ( IN ?auto_12709 ?auto_12713 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12712 ?auto_12709 ?auto_12713 ?auto_12711 )
      ( MAKE-ON ?auto_12709 ?auto_12710 )
      ( MAKE-ON-VERIFY ?auto_12709 ?auto_12710 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12714 - SURFACE
      ?auto_12715 - SURFACE
    )
    :vars
    (
      ?auto_12717 - HOIST
      ?auto_12718 - PLACE
      ?auto_12716 - TRUCK
      ?auto_12719 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12717 ?auto_12718 ) ( SURFACE-AT ?auto_12715 ?auto_12718 ) ( CLEAR ?auto_12715 ) ( IS-CRATE ?auto_12714 ) ( not ( = ?auto_12714 ?auto_12715 ) ) ( AVAILABLE ?auto_12717 ) ( IN ?auto_12714 ?auto_12716 ) ( TRUCK-AT ?auto_12716 ?auto_12719 ) ( not ( = ?auto_12719 ?auto_12718 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12716 ?auto_12719 ?auto_12718 )
      ( MAKE-ON ?auto_12714 ?auto_12715 )
      ( MAKE-ON-VERIFY ?auto_12714 ?auto_12715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12720 - SURFACE
      ?auto_12721 - SURFACE
    )
    :vars
    (
      ?auto_12724 - HOIST
      ?auto_12722 - PLACE
      ?auto_12723 - TRUCK
      ?auto_12725 - PLACE
      ?auto_12726 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12724 ?auto_12722 ) ( SURFACE-AT ?auto_12721 ?auto_12722 ) ( CLEAR ?auto_12721 ) ( IS-CRATE ?auto_12720 ) ( not ( = ?auto_12720 ?auto_12721 ) ) ( AVAILABLE ?auto_12724 ) ( TRUCK-AT ?auto_12723 ?auto_12725 ) ( not ( = ?auto_12725 ?auto_12722 ) ) ( HOIST-AT ?auto_12726 ?auto_12725 ) ( LIFTING ?auto_12726 ?auto_12720 ) ( not ( = ?auto_12724 ?auto_12726 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12726 ?auto_12720 ?auto_12723 ?auto_12725 )
      ( MAKE-ON ?auto_12720 ?auto_12721 )
      ( MAKE-ON-VERIFY ?auto_12720 ?auto_12721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12727 - SURFACE
      ?auto_12728 - SURFACE
    )
    :vars
    (
      ?auto_12733 - HOIST
      ?auto_12732 - PLACE
      ?auto_12730 - TRUCK
      ?auto_12731 - PLACE
      ?auto_12729 - HOIST
      ?auto_12734 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12733 ?auto_12732 ) ( SURFACE-AT ?auto_12728 ?auto_12732 ) ( CLEAR ?auto_12728 ) ( IS-CRATE ?auto_12727 ) ( not ( = ?auto_12727 ?auto_12728 ) ) ( AVAILABLE ?auto_12733 ) ( TRUCK-AT ?auto_12730 ?auto_12731 ) ( not ( = ?auto_12731 ?auto_12732 ) ) ( HOIST-AT ?auto_12729 ?auto_12731 ) ( not ( = ?auto_12733 ?auto_12729 ) ) ( AVAILABLE ?auto_12729 ) ( SURFACE-AT ?auto_12727 ?auto_12731 ) ( ON ?auto_12727 ?auto_12734 ) ( CLEAR ?auto_12727 ) ( not ( = ?auto_12727 ?auto_12734 ) ) ( not ( = ?auto_12728 ?auto_12734 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12729 ?auto_12727 ?auto_12734 ?auto_12731 )
      ( MAKE-ON ?auto_12727 ?auto_12728 )
      ( MAKE-ON-VERIFY ?auto_12727 ?auto_12728 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12735 - SURFACE
      ?auto_12736 - SURFACE
    )
    :vars
    (
      ?auto_12737 - HOIST
      ?auto_12741 - PLACE
      ?auto_12738 - PLACE
      ?auto_12742 - HOIST
      ?auto_12739 - SURFACE
      ?auto_12740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12737 ?auto_12741 ) ( SURFACE-AT ?auto_12736 ?auto_12741 ) ( CLEAR ?auto_12736 ) ( IS-CRATE ?auto_12735 ) ( not ( = ?auto_12735 ?auto_12736 ) ) ( AVAILABLE ?auto_12737 ) ( not ( = ?auto_12738 ?auto_12741 ) ) ( HOIST-AT ?auto_12742 ?auto_12738 ) ( not ( = ?auto_12737 ?auto_12742 ) ) ( AVAILABLE ?auto_12742 ) ( SURFACE-AT ?auto_12735 ?auto_12738 ) ( ON ?auto_12735 ?auto_12739 ) ( CLEAR ?auto_12735 ) ( not ( = ?auto_12735 ?auto_12739 ) ) ( not ( = ?auto_12736 ?auto_12739 ) ) ( TRUCK-AT ?auto_12740 ?auto_12741 ) )
    :subtasks
    ( ( !DRIVE ?auto_12740 ?auto_12741 ?auto_12738 )
      ( MAKE-ON ?auto_12735 ?auto_12736 )
      ( MAKE-ON-VERIFY ?auto_12735 ?auto_12736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12783 - SURFACE
      ?auto_12784 - SURFACE
    )
    :vars
    (
      ?auto_12789 - HOIST
      ?auto_12785 - PLACE
      ?auto_12786 - PLACE
      ?auto_12790 - HOIST
      ?auto_12787 - SURFACE
      ?auto_12788 - TRUCK
      ?auto_12791 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12789 ?auto_12785 ) ( IS-CRATE ?auto_12783 ) ( not ( = ?auto_12783 ?auto_12784 ) ) ( not ( = ?auto_12786 ?auto_12785 ) ) ( HOIST-AT ?auto_12790 ?auto_12786 ) ( not ( = ?auto_12789 ?auto_12790 ) ) ( AVAILABLE ?auto_12790 ) ( SURFACE-AT ?auto_12783 ?auto_12786 ) ( ON ?auto_12783 ?auto_12787 ) ( CLEAR ?auto_12783 ) ( not ( = ?auto_12783 ?auto_12787 ) ) ( not ( = ?auto_12784 ?auto_12787 ) ) ( TRUCK-AT ?auto_12788 ?auto_12785 ) ( SURFACE-AT ?auto_12791 ?auto_12785 ) ( CLEAR ?auto_12791 ) ( LIFTING ?auto_12789 ?auto_12784 ) ( IS-CRATE ?auto_12784 ) ( not ( = ?auto_12783 ?auto_12791 ) ) ( not ( = ?auto_12784 ?auto_12791 ) ) ( not ( = ?auto_12787 ?auto_12791 ) ) )
    :subtasks
    ( ( !DROP ?auto_12789 ?auto_12784 ?auto_12791 ?auto_12785 )
      ( MAKE-ON ?auto_12783 ?auto_12784 )
      ( MAKE-ON-VERIFY ?auto_12783 ?auto_12784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12792 - SURFACE
      ?auto_12793 - SURFACE
    )
    :vars
    (
      ?auto_12796 - HOIST
      ?auto_12794 - PLACE
      ?auto_12795 - PLACE
      ?auto_12798 - HOIST
      ?auto_12797 - SURFACE
      ?auto_12800 - TRUCK
      ?auto_12799 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12796 ?auto_12794 ) ( IS-CRATE ?auto_12792 ) ( not ( = ?auto_12792 ?auto_12793 ) ) ( not ( = ?auto_12795 ?auto_12794 ) ) ( HOIST-AT ?auto_12798 ?auto_12795 ) ( not ( = ?auto_12796 ?auto_12798 ) ) ( AVAILABLE ?auto_12798 ) ( SURFACE-AT ?auto_12792 ?auto_12795 ) ( ON ?auto_12792 ?auto_12797 ) ( CLEAR ?auto_12792 ) ( not ( = ?auto_12792 ?auto_12797 ) ) ( not ( = ?auto_12793 ?auto_12797 ) ) ( TRUCK-AT ?auto_12800 ?auto_12794 ) ( SURFACE-AT ?auto_12799 ?auto_12794 ) ( CLEAR ?auto_12799 ) ( IS-CRATE ?auto_12793 ) ( not ( = ?auto_12792 ?auto_12799 ) ) ( not ( = ?auto_12793 ?auto_12799 ) ) ( not ( = ?auto_12797 ?auto_12799 ) ) ( AVAILABLE ?auto_12796 ) ( IN ?auto_12793 ?auto_12800 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12796 ?auto_12793 ?auto_12800 ?auto_12794 )
      ( MAKE-ON ?auto_12792 ?auto_12793 )
      ( MAKE-ON-VERIFY ?auto_12792 ?auto_12793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12807 - SURFACE
      ?auto_12808 - SURFACE
    )
    :vars
    (
      ?auto_12809 - HOIST
      ?auto_12814 - PLACE
      ?auto_12813 - PLACE
      ?auto_12811 - HOIST
      ?auto_12810 - SURFACE
      ?auto_12812 - TRUCK
      ?auto_12815 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12809 ?auto_12814 ) ( SURFACE-AT ?auto_12808 ?auto_12814 ) ( CLEAR ?auto_12808 ) ( IS-CRATE ?auto_12807 ) ( not ( = ?auto_12807 ?auto_12808 ) ) ( AVAILABLE ?auto_12809 ) ( not ( = ?auto_12813 ?auto_12814 ) ) ( HOIST-AT ?auto_12811 ?auto_12813 ) ( not ( = ?auto_12809 ?auto_12811 ) ) ( AVAILABLE ?auto_12811 ) ( SURFACE-AT ?auto_12807 ?auto_12813 ) ( ON ?auto_12807 ?auto_12810 ) ( CLEAR ?auto_12807 ) ( not ( = ?auto_12807 ?auto_12810 ) ) ( not ( = ?auto_12808 ?auto_12810 ) ) ( TRUCK-AT ?auto_12812 ?auto_12815 ) ( not ( = ?auto_12815 ?auto_12814 ) ) ( not ( = ?auto_12813 ?auto_12815 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12812 ?auto_12815 ?auto_12814 )
      ( MAKE-ON ?auto_12807 ?auto_12808 )
      ( MAKE-ON-VERIFY ?auto_12807 ?auto_12808 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12895 - SURFACE
      ?auto_12896 - SURFACE
    )
    :vars
    (
      ?auto_12897 - HOIST
      ?auto_12899 - PLACE
      ?auto_12902 - TRUCK
      ?auto_12901 - PLACE
      ?auto_12898 - HOIST
      ?auto_12900 - SURFACE
      ?auto_12903 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12897 ?auto_12899 ) ( SURFACE-AT ?auto_12896 ?auto_12899 ) ( CLEAR ?auto_12896 ) ( IS-CRATE ?auto_12895 ) ( not ( = ?auto_12895 ?auto_12896 ) ) ( AVAILABLE ?auto_12897 ) ( TRUCK-AT ?auto_12902 ?auto_12901 ) ( not ( = ?auto_12901 ?auto_12899 ) ) ( HOIST-AT ?auto_12898 ?auto_12901 ) ( not ( = ?auto_12897 ?auto_12898 ) ) ( SURFACE-AT ?auto_12895 ?auto_12901 ) ( ON ?auto_12895 ?auto_12900 ) ( CLEAR ?auto_12895 ) ( not ( = ?auto_12895 ?auto_12900 ) ) ( not ( = ?auto_12896 ?auto_12900 ) ) ( LIFTING ?auto_12898 ?auto_12903 ) ( IS-CRATE ?auto_12903 ) ( not ( = ?auto_12895 ?auto_12903 ) ) ( not ( = ?auto_12896 ?auto_12903 ) ) ( not ( = ?auto_12900 ?auto_12903 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12898 ?auto_12903 ?auto_12902 ?auto_12901 )
      ( MAKE-ON ?auto_12895 ?auto_12896 )
      ( MAKE-ON-VERIFY ?auto_12895 ?auto_12896 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12999 - SURFACE
      ?auto_13000 - SURFACE
    )
    :vars
    (
      ?auto_13006 - HOIST
      ?auto_13001 - PLACE
      ?auto_13005 - PLACE
      ?auto_13003 - HOIST
      ?auto_13002 - SURFACE
      ?auto_13004 - TRUCK
      ?auto_13007 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13006 ?auto_13001 ) ( SURFACE-AT ?auto_13000 ?auto_13001 ) ( CLEAR ?auto_13000 ) ( IS-CRATE ?auto_12999 ) ( not ( = ?auto_12999 ?auto_13000 ) ) ( not ( = ?auto_13005 ?auto_13001 ) ) ( HOIST-AT ?auto_13003 ?auto_13005 ) ( not ( = ?auto_13006 ?auto_13003 ) ) ( AVAILABLE ?auto_13003 ) ( SURFACE-AT ?auto_12999 ?auto_13005 ) ( ON ?auto_12999 ?auto_13002 ) ( CLEAR ?auto_12999 ) ( not ( = ?auto_12999 ?auto_13002 ) ) ( not ( = ?auto_13000 ?auto_13002 ) ) ( TRUCK-AT ?auto_13004 ?auto_13001 ) ( LIFTING ?auto_13006 ?auto_13007 ) ( IS-CRATE ?auto_13007 ) ( not ( = ?auto_12999 ?auto_13007 ) ) ( not ( = ?auto_13000 ?auto_13007 ) ) ( not ( = ?auto_13002 ?auto_13007 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13006 ?auto_13007 ?auto_13004 ?auto_13001 )
      ( MAKE-ON ?auto_12999 ?auto_13000 )
      ( MAKE-ON-VERIFY ?auto_12999 ?auto_13000 ) )
  )

)

