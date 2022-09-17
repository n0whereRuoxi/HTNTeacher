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
      ?auto_60740 - SURFACE
      ?auto_60741 - SURFACE
    )
    :vars
    (
      ?auto_60742 - HOIST
      ?auto_60743 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60742 ?auto_60743 ) ( SURFACE-AT ?auto_60741 ?auto_60743 ) ( CLEAR ?auto_60741 ) ( LIFTING ?auto_60742 ?auto_60740 ) ( IS-CRATE ?auto_60740 ) ( not ( = ?auto_60740 ?auto_60741 ) ) )
    :subtasks
    ( ( !DROP ?auto_60742 ?auto_60740 ?auto_60741 ?auto_60743 )
      ( MAKE-ON-VERIFY ?auto_60740 ?auto_60741 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60744 - SURFACE
      ?auto_60745 - SURFACE
    )
    :vars
    (
      ?auto_60747 - HOIST
      ?auto_60746 - PLACE
      ?auto_60748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60747 ?auto_60746 ) ( SURFACE-AT ?auto_60745 ?auto_60746 ) ( CLEAR ?auto_60745 ) ( IS-CRATE ?auto_60744 ) ( not ( = ?auto_60744 ?auto_60745 ) ) ( TRUCK-AT ?auto_60748 ?auto_60746 ) ( AVAILABLE ?auto_60747 ) ( IN ?auto_60744 ?auto_60748 ) )
    :subtasks
    ( ( !UNLOAD ?auto_60747 ?auto_60744 ?auto_60748 ?auto_60746 )
      ( MAKE-ON ?auto_60744 ?auto_60745 )
      ( MAKE-ON-VERIFY ?auto_60744 ?auto_60745 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60749 - SURFACE
      ?auto_60750 - SURFACE
    )
    :vars
    (
      ?auto_60752 - HOIST
      ?auto_60751 - PLACE
      ?auto_60753 - TRUCK
      ?auto_60754 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60752 ?auto_60751 ) ( SURFACE-AT ?auto_60750 ?auto_60751 ) ( CLEAR ?auto_60750 ) ( IS-CRATE ?auto_60749 ) ( not ( = ?auto_60749 ?auto_60750 ) ) ( AVAILABLE ?auto_60752 ) ( IN ?auto_60749 ?auto_60753 ) ( TRUCK-AT ?auto_60753 ?auto_60754 ) ( not ( = ?auto_60754 ?auto_60751 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_60753 ?auto_60754 ?auto_60751 )
      ( MAKE-ON ?auto_60749 ?auto_60750 )
      ( MAKE-ON-VERIFY ?auto_60749 ?auto_60750 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60755 - SURFACE
      ?auto_60756 - SURFACE
    )
    :vars
    (
      ?auto_60757 - HOIST
      ?auto_60758 - PLACE
      ?auto_60760 - TRUCK
      ?auto_60759 - PLACE
      ?auto_60761 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_60757 ?auto_60758 ) ( SURFACE-AT ?auto_60756 ?auto_60758 ) ( CLEAR ?auto_60756 ) ( IS-CRATE ?auto_60755 ) ( not ( = ?auto_60755 ?auto_60756 ) ) ( AVAILABLE ?auto_60757 ) ( TRUCK-AT ?auto_60760 ?auto_60759 ) ( not ( = ?auto_60759 ?auto_60758 ) ) ( HOIST-AT ?auto_60761 ?auto_60759 ) ( LIFTING ?auto_60761 ?auto_60755 ) ( not ( = ?auto_60757 ?auto_60761 ) ) )
    :subtasks
    ( ( !LOAD ?auto_60761 ?auto_60755 ?auto_60760 ?auto_60759 )
      ( MAKE-ON ?auto_60755 ?auto_60756 )
      ( MAKE-ON-VERIFY ?auto_60755 ?auto_60756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60762 - SURFACE
      ?auto_60763 - SURFACE
    )
    :vars
    (
      ?auto_60764 - HOIST
      ?auto_60767 - PLACE
      ?auto_60766 - TRUCK
      ?auto_60768 - PLACE
      ?auto_60765 - HOIST
      ?auto_60769 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60764 ?auto_60767 ) ( SURFACE-AT ?auto_60763 ?auto_60767 ) ( CLEAR ?auto_60763 ) ( IS-CRATE ?auto_60762 ) ( not ( = ?auto_60762 ?auto_60763 ) ) ( AVAILABLE ?auto_60764 ) ( TRUCK-AT ?auto_60766 ?auto_60768 ) ( not ( = ?auto_60768 ?auto_60767 ) ) ( HOIST-AT ?auto_60765 ?auto_60768 ) ( not ( = ?auto_60764 ?auto_60765 ) ) ( AVAILABLE ?auto_60765 ) ( SURFACE-AT ?auto_60762 ?auto_60768 ) ( ON ?auto_60762 ?auto_60769 ) ( CLEAR ?auto_60762 ) ( not ( = ?auto_60762 ?auto_60769 ) ) ( not ( = ?auto_60763 ?auto_60769 ) ) )
    :subtasks
    ( ( !LIFT ?auto_60765 ?auto_60762 ?auto_60769 ?auto_60768 )
      ( MAKE-ON ?auto_60762 ?auto_60763 )
      ( MAKE-ON-VERIFY ?auto_60762 ?auto_60763 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60770 - SURFACE
      ?auto_60771 - SURFACE
    )
    :vars
    (
      ?auto_60773 - HOIST
      ?auto_60774 - PLACE
      ?auto_60777 - PLACE
      ?auto_60775 - HOIST
      ?auto_60772 - SURFACE
      ?auto_60776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60773 ?auto_60774 ) ( SURFACE-AT ?auto_60771 ?auto_60774 ) ( CLEAR ?auto_60771 ) ( IS-CRATE ?auto_60770 ) ( not ( = ?auto_60770 ?auto_60771 ) ) ( AVAILABLE ?auto_60773 ) ( not ( = ?auto_60777 ?auto_60774 ) ) ( HOIST-AT ?auto_60775 ?auto_60777 ) ( not ( = ?auto_60773 ?auto_60775 ) ) ( AVAILABLE ?auto_60775 ) ( SURFACE-AT ?auto_60770 ?auto_60777 ) ( ON ?auto_60770 ?auto_60772 ) ( CLEAR ?auto_60770 ) ( not ( = ?auto_60770 ?auto_60772 ) ) ( not ( = ?auto_60771 ?auto_60772 ) ) ( TRUCK-AT ?auto_60776 ?auto_60774 ) )
    :subtasks
    ( ( !DRIVE ?auto_60776 ?auto_60774 ?auto_60777 )
      ( MAKE-ON ?auto_60770 ?auto_60771 )
      ( MAKE-ON-VERIFY ?auto_60770 ?auto_60771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60818 - SURFACE
      ?auto_60819 - SURFACE
    )
    :vars
    (
      ?auto_60823 - HOIST
      ?auto_60825 - PLACE
      ?auto_60820 - PLACE
      ?auto_60821 - HOIST
      ?auto_60824 - SURFACE
      ?auto_60822 - TRUCK
      ?auto_60826 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60823 ?auto_60825 ) ( IS-CRATE ?auto_60818 ) ( not ( = ?auto_60818 ?auto_60819 ) ) ( not ( = ?auto_60820 ?auto_60825 ) ) ( HOIST-AT ?auto_60821 ?auto_60820 ) ( not ( = ?auto_60823 ?auto_60821 ) ) ( AVAILABLE ?auto_60821 ) ( SURFACE-AT ?auto_60818 ?auto_60820 ) ( ON ?auto_60818 ?auto_60824 ) ( CLEAR ?auto_60818 ) ( not ( = ?auto_60818 ?auto_60824 ) ) ( not ( = ?auto_60819 ?auto_60824 ) ) ( TRUCK-AT ?auto_60822 ?auto_60825 ) ( SURFACE-AT ?auto_60826 ?auto_60825 ) ( CLEAR ?auto_60826 ) ( LIFTING ?auto_60823 ?auto_60819 ) ( IS-CRATE ?auto_60819 ) ( not ( = ?auto_60818 ?auto_60826 ) ) ( not ( = ?auto_60819 ?auto_60826 ) ) ( not ( = ?auto_60824 ?auto_60826 ) ) )
    :subtasks
    ( ( !DROP ?auto_60823 ?auto_60819 ?auto_60826 ?auto_60825 )
      ( MAKE-ON ?auto_60818 ?auto_60819 )
      ( MAKE-ON-VERIFY ?auto_60818 ?auto_60819 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60827 - SURFACE
      ?auto_60828 - SURFACE
    )
    :vars
    (
      ?auto_60832 - HOIST
      ?auto_60833 - PLACE
      ?auto_60829 - PLACE
      ?auto_60831 - HOIST
      ?auto_60835 - SURFACE
      ?auto_60830 - TRUCK
      ?auto_60834 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60832 ?auto_60833 ) ( IS-CRATE ?auto_60827 ) ( not ( = ?auto_60827 ?auto_60828 ) ) ( not ( = ?auto_60829 ?auto_60833 ) ) ( HOIST-AT ?auto_60831 ?auto_60829 ) ( not ( = ?auto_60832 ?auto_60831 ) ) ( AVAILABLE ?auto_60831 ) ( SURFACE-AT ?auto_60827 ?auto_60829 ) ( ON ?auto_60827 ?auto_60835 ) ( CLEAR ?auto_60827 ) ( not ( = ?auto_60827 ?auto_60835 ) ) ( not ( = ?auto_60828 ?auto_60835 ) ) ( TRUCK-AT ?auto_60830 ?auto_60833 ) ( SURFACE-AT ?auto_60834 ?auto_60833 ) ( CLEAR ?auto_60834 ) ( IS-CRATE ?auto_60828 ) ( not ( = ?auto_60827 ?auto_60834 ) ) ( not ( = ?auto_60828 ?auto_60834 ) ) ( not ( = ?auto_60835 ?auto_60834 ) ) ( AVAILABLE ?auto_60832 ) ( IN ?auto_60828 ?auto_60830 ) )
    :subtasks
    ( ( !UNLOAD ?auto_60832 ?auto_60828 ?auto_60830 ?auto_60833 )
      ( MAKE-ON ?auto_60827 ?auto_60828 )
      ( MAKE-ON-VERIFY ?auto_60827 ?auto_60828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60842 - SURFACE
      ?auto_60843 - SURFACE
    )
    :vars
    (
      ?auto_60844 - HOIST
      ?auto_60849 - PLACE
      ?auto_60847 - PLACE
      ?auto_60848 - HOIST
      ?auto_60845 - SURFACE
      ?auto_60846 - TRUCK
      ?auto_60850 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60844 ?auto_60849 ) ( SURFACE-AT ?auto_60843 ?auto_60849 ) ( CLEAR ?auto_60843 ) ( IS-CRATE ?auto_60842 ) ( not ( = ?auto_60842 ?auto_60843 ) ) ( AVAILABLE ?auto_60844 ) ( not ( = ?auto_60847 ?auto_60849 ) ) ( HOIST-AT ?auto_60848 ?auto_60847 ) ( not ( = ?auto_60844 ?auto_60848 ) ) ( AVAILABLE ?auto_60848 ) ( SURFACE-AT ?auto_60842 ?auto_60847 ) ( ON ?auto_60842 ?auto_60845 ) ( CLEAR ?auto_60842 ) ( not ( = ?auto_60842 ?auto_60845 ) ) ( not ( = ?auto_60843 ?auto_60845 ) ) ( TRUCK-AT ?auto_60846 ?auto_60850 ) ( not ( = ?auto_60850 ?auto_60849 ) ) ( not ( = ?auto_60847 ?auto_60850 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_60846 ?auto_60850 ?auto_60849 )
      ( MAKE-ON ?auto_60842 ?auto_60843 )
      ( MAKE-ON-VERIFY ?auto_60842 ?auto_60843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61015 - SURFACE
      ?auto_61016 - SURFACE
    )
    :vars
    (
      ?auto_61022 - HOIST
      ?auto_61017 - PLACE
      ?auto_61019 - TRUCK
      ?auto_61021 - PLACE
      ?auto_61020 - HOIST
      ?auto_61018 - SURFACE
      ?auto_61023 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61022 ?auto_61017 ) ( SURFACE-AT ?auto_61016 ?auto_61017 ) ( CLEAR ?auto_61016 ) ( IS-CRATE ?auto_61015 ) ( not ( = ?auto_61015 ?auto_61016 ) ) ( AVAILABLE ?auto_61022 ) ( TRUCK-AT ?auto_61019 ?auto_61021 ) ( not ( = ?auto_61021 ?auto_61017 ) ) ( HOIST-AT ?auto_61020 ?auto_61021 ) ( not ( = ?auto_61022 ?auto_61020 ) ) ( SURFACE-AT ?auto_61015 ?auto_61021 ) ( ON ?auto_61015 ?auto_61018 ) ( CLEAR ?auto_61015 ) ( not ( = ?auto_61015 ?auto_61018 ) ) ( not ( = ?auto_61016 ?auto_61018 ) ) ( LIFTING ?auto_61020 ?auto_61023 ) ( IS-CRATE ?auto_61023 ) ( not ( = ?auto_61015 ?auto_61023 ) ) ( not ( = ?auto_61016 ?auto_61023 ) ) ( not ( = ?auto_61018 ?auto_61023 ) ) )
    :subtasks
    ( ( !LOAD ?auto_61020 ?auto_61023 ?auto_61019 ?auto_61021 )
      ( MAKE-ON ?auto_61015 ?auto_61016 )
      ( MAKE-ON-VERIFY ?auto_61015 ?auto_61016 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61131 - SURFACE
      ?auto_61132 - SURFACE
    )
    :vars
    (
      ?auto_61135 - HOIST
      ?auto_61137 - PLACE
      ?auto_61136 - PLACE
      ?auto_61134 - HOIST
      ?auto_61133 - SURFACE
      ?auto_61138 - TRUCK
      ?auto_61139 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61135 ?auto_61137 ) ( SURFACE-AT ?auto_61132 ?auto_61137 ) ( CLEAR ?auto_61132 ) ( IS-CRATE ?auto_61131 ) ( not ( = ?auto_61131 ?auto_61132 ) ) ( not ( = ?auto_61136 ?auto_61137 ) ) ( HOIST-AT ?auto_61134 ?auto_61136 ) ( not ( = ?auto_61135 ?auto_61134 ) ) ( AVAILABLE ?auto_61134 ) ( SURFACE-AT ?auto_61131 ?auto_61136 ) ( ON ?auto_61131 ?auto_61133 ) ( CLEAR ?auto_61131 ) ( not ( = ?auto_61131 ?auto_61133 ) ) ( not ( = ?auto_61132 ?auto_61133 ) ) ( TRUCK-AT ?auto_61138 ?auto_61137 ) ( LIFTING ?auto_61135 ?auto_61139 ) ( IS-CRATE ?auto_61139 ) ( not ( = ?auto_61131 ?auto_61139 ) ) ( not ( = ?auto_61132 ?auto_61139 ) ) ( not ( = ?auto_61133 ?auto_61139 ) ) )
    :subtasks
    ( ( !LOAD ?auto_61135 ?auto_61139 ?auto_61138 ?auto_61137 )
      ( MAKE-ON ?auto_61131 ?auto_61132 )
      ( MAKE-ON-VERIFY ?auto_61131 ?auto_61132 ) )
  )

)

