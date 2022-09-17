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
      ?auto_762 - SURFACE
      ?auto_763 - SURFACE
    )
    :vars
    (
      ?auto_764 - HOIST
      ?auto_765 - PLACE
      ?auto_767 - PLACE
      ?auto_768 - HOIST
      ?auto_769 - SURFACE
      ?auto_766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_764 ?auto_765 ) ( SURFACE-AT ?auto_763 ?auto_765 ) ( CLEAR ?auto_763 ) ( IS-CRATE ?auto_762 ) ( AVAILABLE ?auto_764 ) ( not ( = ?auto_767 ?auto_765 ) ) ( HOIST-AT ?auto_768 ?auto_767 ) ( AVAILABLE ?auto_768 ) ( SURFACE-AT ?auto_762 ?auto_767 ) ( ON ?auto_762 ?auto_769 ) ( CLEAR ?auto_762 ) ( TRUCK-AT ?auto_766 ?auto_765 ) ( not ( = ?auto_762 ?auto_763 ) ) ( not ( = ?auto_762 ?auto_769 ) ) ( not ( = ?auto_763 ?auto_769 ) ) ( not ( = ?auto_764 ?auto_768 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_766 ?auto_765 ?auto_767 )
      ( !LIFT ?auto_768 ?auto_762 ?auto_769 ?auto_767 )
      ( !LOAD ?auto_768 ?auto_762 ?auto_766 ?auto_767 )
      ( !DRIVE ?auto_766 ?auto_767 ?auto_765 )
      ( !UNLOAD ?auto_764 ?auto_762 ?auto_766 ?auto_765 )
      ( !DROP ?auto_764 ?auto_762 ?auto_763 ?auto_765 )
      ( MAKE-ON-VERIFY ?auto_762 ?auto_763 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_772 - SURFACE
      ?auto_773 - SURFACE
    )
    :vars
    (
      ?auto_774 - HOIST
      ?auto_775 - PLACE
      ?auto_777 - PLACE
      ?auto_778 - HOIST
      ?auto_779 - SURFACE
      ?auto_776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_774 ?auto_775 ) ( SURFACE-AT ?auto_773 ?auto_775 ) ( CLEAR ?auto_773 ) ( IS-CRATE ?auto_772 ) ( AVAILABLE ?auto_774 ) ( not ( = ?auto_777 ?auto_775 ) ) ( HOIST-AT ?auto_778 ?auto_777 ) ( AVAILABLE ?auto_778 ) ( SURFACE-AT ?auto_772 ?auto_777 ) ( ON ?auto_772 ?auto_779 ) ( CLEAR ?auto_772 ) ( TRUCK-AT ?auto_776 ?auto_775 ) ( not ( = ?auto_772 ?auto_773 ) ) ( not ( = ?auto_772 ?auto_779 ) ) ( not ( = ?auto_773 ?auto_779 ) ) ( not ( = ?auto_774 ?auto_778 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_776 ?auto_775 ?auto_777 )
      ( !LIFT ?auto_778 ?auto_772 ?auto_779 ?auto_777 )
      ( !LOAD ?auto_778 ?auto_772 ?auto_776 ?auto_777 )
      ( !DRIVE ?auto_776 ?auto_777 ?auto_775 )
      ( !UNLOAD ?auto_774 ?auto_772 ?auto_776 ?auto_775 )
      ( !DROP ?auto_774 ?auto_772 ?auto_773 ?auto_775 )
      ( MAKE-ON-VERIFY ?auto_772 ?auto_773 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_782 - SURFACE
      ?auto_783 - SURFACE
    )
    :vars
    (
      ?auto_784 - HOIST
      ?auto_785 - PLACE
      ?auto_787 - PLACE
      ?auto_788 - HOIST
      ?auto_789 - SURFACE
      ?auto_786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_784 ?auto_785 ) ( SURFACE-AT ?auto_783 ?auto_785 ) ( CLEAR ?auto_783 ) ( IS-CRATE ?auto_782 ) ( AVAILABLE ?auto_784 ) ( not ( = ?auto_787 ?auto_785 ) ) ( HOIST-AT ?auto_788 ?auto_787 ) ( AVAILABLE ?auto_788 ) ( SURFACE-AT ?auto_782 ?auto_787 ) ( ON ?auto_782 ?auto_789 ) ( CLEAR ?auto_782 ) ( TRUCK-AT ?auto_786 ?auto_785 ) ( not ( = ?auto_782 ?auto_783 ) ) ( not ( = ?auto_782 ?auto_789 ) ) ( not ( = ?auto_783 ?auto_789 ) ) ( not ( = ?auto_784 ?auto_788 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_786 ?auto_785 ?auto_787 )
      ( !LIFT ?auto_788 ?auto_782 ?auto_789 ?auto_787 )
      ( !LOAD ?auto_788 ?auto_782 ?auto_786 ?auto_787 )
      ( !DRIVE ?auto_786 ?auto_787 ?auto_785 )
      ( !UNLOAD ?auto_784 ?auto_782 ?auto_786 ?auto_785 )
      ( !DROP ?auto_784 ?auto_782 ?auto_783 ?auto_785 )
      ( MAKE-ON-VERIFY ?auto_782 ?auto_783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_792 - SURFACE
      ?auto_793 - SURFACE
    )
    :vars
    (
      ?auto_794 - HOIST
      ?auto_795 - PLACE
      ?auto_797 - PLACE
      ?auto_798 - HOIST
      ?auto_799 - SURFACE
      ?auto_796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794 ?auto_795 ) ( SURFACE-AT ?auto_793 ?auto_795 ) ( CLEAR ?auto_793 ) ( IS-CRATE ?auto_792 ) ( AVAILABLE ?auto_794 ) ( not ( = ?auto_797 ?auto_795 ) ) ( HOIST-AT ?auto_798 ?auto_797 ) ( AVAILABLE ?auto_798 ) ( SURFACE-AT ?auto_792 ?auto_797 ) ( ON ?auto_792 ?auto_799 ) ( CLEAR ?auto_792 ) ( TRUCK-AT ?auto_796 ?auto_795 ) ( not ( = ?auto_792 ?auto_793 ) ) ( not ( = ?auto_792 ?auto_799 ) ) ( not ( = ?auto_793 ?auto_799 ) ) ( not ( = ?auto_794 ?auto_798 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_796 ?auto_795 ?auto_797 )
      ( !LIFT ?auto_798 ?auto_792 ?auto_799 ?auto_797 )
      ( !LOAD ?auto_798 ?auto_792 ?auto_796 ?auto_797 )
      ( !DRIVE ?auto_796 ?auto_797 ?auto_795 )
      ( !UNLOAD ?auto_794 ?auto_792 ?auto_796 ?auto_795 )
      ( !DROP ?auto_794 ?auto_792 ?auto_793 ?auto_795 )
      ( MAKE-ON-VERIFY ?auto_792 ?auto_793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_802 - SURFACE
      ?auto_803 - SURFACE
    )
    :vars
    (
      ?auto_804 - HOIST
      ?auto_805 - PLACE
      ?auto_807 - PLACE
      ?auto_808 - HOIST
      ?auto_809 - SURFACE
      ?auto_806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_804 ?auto_805 ) ( SURFACE-AT ?auto_803 ?auto_805 ) ( CLEAR ?auto_803 ) ( IS-CRATE ?auto_802 ) ( AVAILABLE ?auto_804 ) ( not ( = ?auto_807 ?auto_805 ) ) ( HOIST-AT ?auto_808 ?auto_807 ) ( AVAILABLE ?auto_808 ) ( SURFACE-AT ?auto_802 ?auto_807 ) ( ON ?auto_802 ?auto_809 ) ( CLEAR ?auto_802 ) ( TRUCK-AT ?auto_806 ?auto_805 ) ( not ( = ?auto_802 ?auto_803 ) ) ( not ( = ?auto_802 ?auto_809 ) ) ( not ( = ?auto_803 ?auto_809 ) ) ( not ( = ?auto_804 ?auto_808 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_806 ?auto_805 ?auto_807 )
      ( !LIFT ?auto_808 ?auto_802 ?auto_809 ?auto_807 )
      ( !LOAD ?auto_808 ?auto_802 ?auto_806 ?auto_807 )
      ( !DRIVE ?auto_806 ?auto_807 ?auto_805 )
      ( !UNLOAD ?auto_804 ?auto_802 ?auto_806 ?auto_805 )
      ( !DROP ?auto_804 ?auto_802 ?auto_803 ?auto_805 )
      ( MAKE-ON-VERIFY ?auto_802 ?auto_803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_812 - SURFACE
      ?auto_813 - SURFACE
    )
    :vars
    (
      ?auto_814 - HOIST
      ?auto_815 - PLACE
      ?auto_817 - PLACE
      ?auto_818 - HOIST
      ?auto_819 - SURFACE
      ?auto_816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_814 ?auto_815 ) ( SURFACE-AT ?auto_813 ?auto_815 ) ( CLEAR ?auto_813 ) ( IS-CRATE ?auto_812 ) ( AVAILABLE ?auto_814 ) ( not ( = ?auto_817 ?auto_815 ) ) ( HOIST-AT ?auto_818 ?auto_817 ) ( AVAILABLE ?auto_818 ) ( SURFACE-AT ?auto_812 ?auto_817 ) ( ON ?auto_812 ?auto_819 ) ( CLEAR ?auto_812 ) ( TRUCK-AT ?auto_816 ?auto_815 ) ( not ( = ?auto_812 ?auto_813 ) ) ( not ( = ?auto_812 ?auto_819 ) ) ( not ( = ?auto_813 ?auto_819 ) ) ( not ( = ?auto_814 ?auto_818 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_816 ?auto_815 ?auto_817 )
      ( !LIFT ?auto_818 ?auto_812 ?auto_819 ?auto_817 )
      ( !LOAD ?auto_818 ?auto_812 ?auto_816 ?auto_817 )
      ( !DRIVE ?auto_816 ?auto_817 ?auto_815 )
      ( !UNLOAD ?auto_814 ?auto_812 ?auto_816 ?auto_815 )
      ( !DROP ?auto_814 ?auto_812 ?auto_813 ?auto_815 )
      ( MAKE-ON-VERIFY ?auto_812 ?auto_813 ) )
  )

)

