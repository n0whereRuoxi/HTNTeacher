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

  ( :method MAKE-11CRATE-VERIFY
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
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
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
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
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
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
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
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511755 - SURFACE
      ?auto_1511756 - SURFACE
    )
    :vars
    (
      ?auto_1511757 - HOIST
      ?auto_1511758 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511757 ?auto_1511758 ) ( SURFACE-AT ?auto_1511755 ?auto_1511758 ) ( CLEAR ?auto_1511755 ) ( LIFTING ?auto_1511757 ?auto_1511756 ) ( IS-CRATE ?auto_1511756 ) ( not ( = ?auto_1511755 ?auto_1511756 ) ) )
    :subtasks
    ( ( !DROP ?auto_1511757 ?auto_1511756 ?auto_1511755 ?auto_1511758 )
      ( MAKE-1CRATE-VERIFY ?auto_1511755 ?auto_1511756 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511759 - SURFACE
      ?auto_1511760 - SURFACE
    )
    :vars
    (
      ?auto_1511761 - HOIST
      ?auto_1511762 - PLACE
      ?auto_1511763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511761 ?auto_1511762 ) ( SURFACE-AT ?auto_1511759 ?auto_1511762 ) ( CLEAR ?auto_1511759 ) ( IS-CRATE ?auto_1511760 ) ( not ( = ?auto_1511759 ?auto_1511760 ) ) ( TRUCK-AT ?auto_1511763 ?auto_1511762 ) ( AVAILABLE ?auto_1511761 ) ( IN ?auto_1511760 ?auto_1511763 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1511761 ?auto_1511760 ?auto_1511763 ?auto_1511762 )
      ( MAKE-1CRATE ?auto_1511759 ?auto_1511760 )
      ( MAKE-1CRATE-VERIFY ?auto_1511759 ?auto_1511760 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511764 - SURFACE
      ?auto_1511765 - SURFACE
    )
    :vars
    (
      ?auto_1511766 - HOIST
      ?auto_1511767 - PLACE
      ?auto_1511768 - TRUCK
      ?auto_1511769 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511766 ?auto_1511767 ) ( SURFACE-AT ?auto_1511764 ?auto_1511767 ) ( CLEAR ?auto_1511764 ) ( IS-CRATE ?auto_1511765 ) ( not ( = ?auto_1511764 ?auto_1511765 ) ) ( AVAILABLE ?auto_1511766 ) ( IN ?auto_1511765 ?auto_1511768 ) ( TRUCK-AT ?auto_1511768 ?auto_1511769 ) ( not ( = ?auto_1511769 ?auto_1511767 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1511768 ?auto_1511769 ?auto_1511767 )
      ( MAKE-1CRATE ?auto_1511764 ?auto_1511765 )
      ( MAKE-1CRATE-VERIFY ?auto_1511764 ?auto_1511765 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511770 - SURFACE
      ?auto_1511771 - SURFACE
    )
    :vars
    (
      ?auto_1511775 - HOIST
      ?auto_1511772 - PLACE
      ?auto_1511773 - TRUCK
      ?auto_1511774 - PLACE
      ?auto_1511776 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511775 ?auto_1511772 ) ( SURFACE-AT ?auto_1511770 ?auto_1511772 ) ( CLEAR ?auto_1511770 ) ( IS-CRATE ?auto_1511771 ) ( not ( = ?auto_1511770 ?auto_1511771 ) ) ( AVAILABLE ?auto_1511775 ) ( TRUCK-AT ?auto_1511773 ?auto_1511774 ) ( not ( = ?auto_1511774 ?auto_1511772 ) ) ( HOIST-AT ?auto_1511776 ?auto_1511774 ) ( LIFTING ?auto_1511776 ?auto_1511771 ) ( not ( = ?auto_1511775 ?auto_1511776 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1511776 ?auto_1511771 ?auto_1511773 ?auto_1511774 )
      ( MAKE-1CRATE ?auto_1511770 ?auto_1511771 )
      ( MAKE-1CRATE-VERIFY ?auto_1511770 ?auto_1511771 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511777 - SURFACE
      ?auto_1511778 - SURFACE
    )
    :vars
    (
      ?auto_1511781 - HOIST
      ?auto_1511779 - PLACE
      ?auto_1511780 - TRUCK
      ?auto_1511783 - PLACE
      ?auto_1511782 - HOIST
      ?auto_1511784 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511781 ?auto_1511779 ) ( SURFACE-AT ?auto_1511777 ?auto_1511779 ) ( CLEAR ?auto_1511777 ) ( IS-CRATE ?auto_1511778 ) ( not ( = ?auto_1511777 ?auto_1511778 ) ) ( AVAILABLE ?auto_1511781 ) ( TRUCK-AT ?auto_1511780 ?auto_1511783 ) ( not ( = ?auto_1511783 ?auto_1511779 ) ) ( HOIST-AT ?auto_1511782 ?auto_1511783 ) ( not ( = ?auto_1511781 ?auto_1511782 ) ) ( AVAILABLE ?auto_1511782 ) ( SURFACE-AT ?auto_1511778 ?auto_1511783 ) ( ON ?auto_1511778 ?auto_1511784 ) ( CLEAR ?auto_1511778 ) ( not ( = ?auto_1511777 ?auto_1511784 ) ) ( not ( = ?auto_1511778 ?auto_1511784 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1511782 ?auto_1511778 ?auto_1511784 ?auto_1511783 )
      ( MAKE-1CRATE ?auto_1511777 ?auto_1511778 )
      ( MAKE-1CRATE-VERIFY ?auto_1511777 ?auto_1511778 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511785 - SURFACE
      ?auto_1511786 - SURFACE
    )
    :vars
    (
      ?auto_1511788 - HOIST
      ?auto_1511792 - PLACE
      ?auto_1511790 - PLACE
      ?auto_1511791 - HOIST
      ?auto_1511787 - SURFACE
      ?auto_1511789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511788 ?auto_1511792 ) ( SURFACE-AT ?auto_1511785 ?auto_1511792 ) ( CLEAR ?auto_1511785 ) ( IS-CRATE ?auto_1511786 ) ( not ( = ?auto_1511785 ?auto_1511786 ) ) ( AVAILABLE ?auto_1511788 ) ( not ( = ?auto_1511790 ?auto_1511792 ) ) ( HOIST-AT ?auto_1511791 ?auto_1511790 ) ( not ( = ?auto_1511788 ?auto_1511791 ) ) ( AVAILABLE ?auto_1511791 ) ( SURFACE-AT ?auto_1511786 ?auto_1511790 ) ( ON ?auto_1511786 ?auto_1511787 ) ( CLEAR ?auto_1511786 ) ( not ( = ?auto_1511785 ?auto_1511787 ) ) ( not ( = ?auto_1511786 ?auto_1511787 ) ) ( TRUCK-AT ?auto_1511789 ?auto_1511792 ) )
    :subtasks
    ( ( !DRIVE ?auto_1511789 ?auto_1511792 ?auto_1511790 )
      ( MAKE-1CRATE ?auto_1511785 ?auto_1511786 )
      ( MAKE-1CRATE-VERIFY ?auto_1511785 ?auto_1511786 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1511802 - SURFACE
      ?auto_1511803 - SURFACE
      ?auto_1511804 - SURFACE
    )
    :vars
    (
      ?auto_1511806 - HOIST
      ?auto_1511805 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511806 ?auto_1511805 ) ( SURFACE-AT ?auto_1511803 ?auto_1511805 ) ( CLEAR ?auto_1511803 ) ( LIFTING ?auto_1511806 ?auto_1511804 ) ( IS-CRATE ?auto_1511804 ) ( not ( = ?auto_1511803 ?auto_1511804 ) ) ( ON ?auto_1511803 ?auto_1511802 ) ( not ( = ?auto_1511802 ?auto_1511803 ) ) ( not ( = ?auto_1511802 ?auto_1511804 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511803 ?auto_1511804 )
      ( MAKE-2CRATE-VERIFY ?auto_1511802 ?auto_1511803 ?auto_1511804 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1511812 - SURFACE
      ?auto_1511813 - SURFACE
      ?auto_1511814 - SURFACE
    )
    :vars
    (
      ?auto_1511815 - HOIST
      ?auto_1511817 - PLACE
      ?auto_1511816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511815 ?auto_1511817 ) ( SURFACE-AT ?auto_1511813 ?auto_1511817 ) ( CLEAR ?auto_1511813 ) ( IS-CRATE ?auto_1511814 ) ( not ( = ?auto_1511813 ?auto_1511814 ) ) ( TRUCK-AT ?auto_1511816 ?auto_1511817 ) ( AVAILABLE ?auto_1511815 ) ( IN ?auto_1511814 ?auto_1511816 ) ( ON ?auto_1511813 ?auto_1511812 ) ( not ( = ?auto_1511812 ?auto_1511813 ) ) ( not ( = ?auto_1511812 ?auto_1511814 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511813 ?auto_1511814 )
      ( MAKE-2CRATE-VERIFY ?auto_1511812 ?auto_1511813 ?auto_1511814 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511818 - SURFACE
      ?auto_1511819 - SURFACE
    )
    :vars
    (
      ?auto_1511821 - HOIST
      ?auto_1511820 - PLACE
      ?auto_1511823 - TRUCK
      ?auto_1511822 - SURFACE
      ?auto_1511824 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511821 ?auto_1511820 ) ( SURFACE-AT ?auto_1511818 ?auto_1511820 ) ( CLEAR ?auto_1511818 ) ( IS-CRATE ?auto_1511819 ) ( not ( = ?auto_1511818 ?auto_1511819 ) ) ( AVAILABLE ?auto_1511821 ) ( IN ?auto_1511819 ?auto_1511823 ) ( ON ?auto_1511818 ?auto_1511822 ) ( not ( = ?auto_1511822 ?auto_1511818 ) ) ( not ( = ?auto_1511822 ?auto_1511819 ) ) ( TRUCK-AT ?auto_1511823 ?auto_1511824 ) ( not ( = ?auto_1511824 ?auto_1511820 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1511823 ?auto_1511824 ?auto_1511820 )
      ( MAKE-2CRATE ?auto_1511822 ?auto_1511818 ?auto_1511819 )
      ( MAKE-1CRATE-VERIFY ?auto_1511818 ?auto_1511819 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1511825 - SURFACE
      ?auto_1511826 - SURFACE
      ?auto_1511827 - SURFACE
    )
    :vars
    (
      ?auto_1511830 - HOIST
      ?auto_1511828 - PLACE
      ?auto_1511831 - TRUCK
      ?auto_1511829 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511830 ?auto_1511828 ) ( SURFACE-AT ?auto_1511826 ?auto_1511828 ) ( CLEAR ?auto_1511826 ) ( IS-CRATE ?auto_1511827 ) ( not ( = ?auto_1511826 ?auto_1511827 ) ) ( AVAILABLE ?auto_1511830 ) ( IN ?auto_1511827 ?auto_1511831 ) ( ON ?auto_1511826 ?auto_1511825 ) ( not ( = ?auto_1511825 ?auto_1511826 ) ) ( not ( = ?auto_1511825 ?auto_1511827 ) ) ( TRUCK-AT ?auto_1511831 ?auto_1511829 ) ( not ( = ?auto_1511829 ?auto_1511828 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511826 ?auto_1511827 )
      ( MAKE-2CRATE-VERIFY ?auto_1511825 ?auto_1511826 ?auto_1511827 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511832 - SURFACE
      ?auto_1511833 - SURFACE
    )
    :vars
    (
      ?auto_1511834 - HOIST
      ?auto_1511837 - PLACE
      ?auto_1511838 - SURFACE
      ?auto_1511836 - TRUCK
      ?auto_1511835 - PLACE
      ?auto_1511839 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511834 ?auto_1511837 ) ( SURFACE-AT ?auto_1511832 ?auto_1511837 ) ( CLEAR ?auto_1511832 ) ( IS-CRATE ?auto_1511833 ) ( not ( = ?auto_1511832 ?auto_1511833 ) ) ( AVAILABLE ?auto_1511834 ) ( ON ?auto_1511832 ?auto_1511838 ) ( not ( = ?auto_1511838 ?auto_1511832 ) ) ( not ( = ?auto_1511838 ?auto_1511833 ) ) ( TRUCK-AT ?auto_1511836 ?auto_1511835 ) ( not ( = ?auto_1511835 ?auto_1511837 ) ) ( HOIST-AT ?auto_1511839 ?auto_1511835 ) ( LIFTING ?auto_1511839 ?auto_1511833 ) ( not ( = ?auto_1511834 ?auto_1511839 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1511839 ?auto_1511833 ?auto_1511836 ?auto_1511835 )
      ( MAKE-2CRATE ?auto_1511838 ?auto_1511832 ?auto_1511833 )
      ( MAKE-1CRATE-VERIFY ?auto_1511832 ?auto_1511833 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1511840 - SURFACE
      ?auto_1511841 - SURFACE
      ?auto_1511842 - SURFACE
    )
    :vars
    (
      ?auto_1511844 - HOIST
      ?auto_1511847 - PLACE
      ?auto_1511845 - TRUCK
      ?auto_1511843 - PLACE
      ?auto_1511846 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511844 ?auto_1511847 ) ( SURFACE-AT ?auto_1511841 ?auto_1511847 ) ( CLEAR ?auto_1511841 ) ( IS-CRATE ?auto_1511842 ) ( not ( = ?auto_1511841 ?auto_1511842 ) ) ( AVAILABLE ?auto_1511844 ) ( ON ?auto_1511841 ?auto_1511840 ) ( not ( = ?auto_1511840 ?auto_1511841 ) ) ( not ( = ?auto_1511840 ?auto_1511842 ) ) ( TRUCK-AT ?auto_1511845 ?auto_1511843 ) ( not ( = ?auto_1511843 ?auto_1511847 ) ) ( HOIST-AT ?auto_1511846 ?auto_1511843 ) ( LIFTING ?auto_1511846 ?auto_1511842 ) ( not ( = ?auto_1511844 ?auto_1511846 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511841 ?auto_1511842 )
      ( MAKE-2CRATE-VERIFY ?auto_1511840 ?auto_1511841 ?auto_1511842 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511848 - SURFACE
      ?auto_1511849 - SURFACE
    )
    :vars
    (
      ?auto_1511853 - HOIST
      ?auto_1511851 - PLACE
      ?auto_1511855 - SURFACE
      ?auto_1511850 - TRUCK
      ?auto_1511852 - PLACE
      ?auto_1511854 - HOIST
      ?auto_1511856 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511853 ?auto_1511851 ) ( SURFACE-AT ?auto_1511848 ?auto_1511851 ) ( CLEAR ?auto_1511848 ) ( IS-CRATE ?auto_1511849 ) ( not ( = ?auto_1511848 ?auto_1511849 ) ) ( AVAILABLE ?auto_1511853 ) ( ON ?auto_1511848 ?auto_1511855 ) ( not ( = ?auto_1511855 ?auto_1511848 ) ) ( not ( = ?auto_1511855 ?auto_1511849 ) ) ( TRUCK-AT ?auto_1511850 ?auto_1511852 ) ( not ( = ?auto_1511852 ?auto_1511851 ) ) ( HOIST-AT ?auto_1511854 ?auto_1511852 ) ( not ( = ?auto_1511853 ?auto_1511854 ) ) ( AVAILABLE ?auto_1511854 ) ( SURFACE-AT ?auto_1511849 ?auto_1511852 ) ( ON ?auto_1511849 ?auto_1511856 ) ( CLEAR ?auto_1511849 ) ( not ( = ?auto_1511848 ?auto_1511856 ) ) ( not ( = ?auto_1511849 ?auto_1511856 ) ) ( not ( = ?auto_1511855 ?auto_1511856 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1511854 ?auto_1511849 ?auto_1511856 ?auto_1511852 )
      ( MAKE-2CRATE ?auto_1511855 ?auto_1511848 ?auto_1511849 )
      ( MAKE-1CRATE-VERIFY ?auto_1511848 ?auto_1511849 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1511857 - SURFACE
      ?auto_1511858 - SURFACE
      ?auto_1511859 - SURFACE
    )
    :vars
    (
      ?auto_1511863 - HOIST
      ?auto_1511861 - PLACE
      ?auto_1511865 - TRUCK
      ?auto_1511862 - PLACE
      ?auto_1511860 - HOIST
      ?auto_1511864 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511863 ?auto_1511861 ) ( SURFACE-AT ?auto_1511858 ?auto_1511861 ) ( CLEAR ?auto_1511858 ) ( IS-CRATE ?auto_1511859 ) ( not ( = ?auto_1511858 ?auto_1511859 ) ) ( AVAILABLE ?auto_1511863 ) ( ON ?auto_1511858 ?auto_1511857 ) ( not ( = ?auto_1511857 ?auto_1511858 ) ) ( not ( = ?auto_1511857 ?auto_1511859 ) ) ( TRUCK-AT ?auto_1511865 ?auto_1511862 ) ( not ( = ?auto_1511862 ?auto_1511861 ) ) ( HOIST-AT ?auto_1511860 ?auto_1511862 ) ( not ( = ?auto_1511863 ?auto_1511860 ) ) ( AVAILABLE ?auto_1511860 ) ( SURFACE-AT ?auto_1511859 ?auto_1511862 ) ( ON ?auto_1511859 ?auto_1511864 ) ( CLEAR ?auto_1511859 ) ( not ( = ?auto_1511858 ?auto_1511864 ) ) ( not ( = ?auto_1511859 ?auto_1511864 ) ) ( not ( = ?auto_1511857 ?auto_1511864 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511858 ?auto_1511859 )
      ( MAKE-2CRATE-VERIFY ?auto_1511857 ?auto_1511858 ?auto_1511859 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511866 - SURFACE
      ?auto_1511867 - SURFACE
    )
    :vars
    (
      ?auto_1511868 - HOIST
      ?auto_1511871 - PLACE
      ?auto_1511873 - SURFACE
      ?auto_1511870 - PLACE
      ?auto_1511869 - HOIST
      ?auto_1511874 - SURFACE
      ?auto_1511872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511868 ?auto_1511871 ) ( SURFACE-AT ?auto_1511866 ?auto_1511871 ) ( CLEAR ?auto_1511866 ) ( IS-CRATE ?auto_1511867 ) ( not ( = ?auto_1511866 ?auto_1511867 ) ) ( AVAILABLE ?auto_1511868 ) ( ON ?auto_1511866 ?auto_1511873 ) ( not ( = ?auto_1511873 ?auto_1511866 ) ) ( not ( = ?auto_1511873 ?auto_1511867 ) ) ( not ( = ?auto_1511870 ?auto_1511871 ) ) ( HOIST-AT ?auto_1511869 ?auto_1511870 ) ( not ( = ?auto_1511868 ?auto_1511869 ) ) ( AVAILABLE ?auto_1511869 ) ( SURFACE-AT ?auto_1511867 ?auto_1511870 ) ( ON ?auto_1511867 ?auto_1511874 ) ( CLEAR ?auto_1511867 ) ( not ( = ?auto_1511866 ?auto_1511874 ) ) ( not ( = ?auto_1511867 ?auto_1511874 ) ) ( not ( = ?auto_1511873 ?auto_1511874 ) ) ( TRUCK-AT ?auto_1511872 ?auto_1511871 ) )
    :subtasks
    ( ( !DRIVE ?auto_1511872 ?auto_1511871 ?auto_1511870 )
      ( MAKE-2CRATE ?auto_1511873 ?auto_1511866 ?auto_1511867 )
      ( MAKE-1CRATE-VERIFY ?auto_1511866 ?auto_1511867 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1511875 - SURFACE
      ?auto_1511876 - SURFACE
      ?auto_1511877 - SURFACE
    )
    :vars
    (
      ?auto_1511878 - HOIST
      ?auto_1511879 - PLACE
      ?auto_1511883 - PLACE
      ?auto_1511882 - HOIST
      ?auto_1511880 - SURFACE
      ?auto_1511881 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511878 ?auto_1511879 ) ( SURFACE-AT ?auto_1511876 ?auto_1511879 ) ( CLEAR ?auto_1511876 ) ( IS-CRATE ?auto_1511877 ) ( not ( = ?auto_1511876 ?auto_1511877 ) ) ( AVAILABLE ?auto_1511878 ) ( ON ?auto_1511876 ?auto_1511875 ) ( not ( = ?auto_1511875 ?auto_1511876 ) ) ( not ( = ?auto_1511875 ?auto_1511877 ) ) ( not ( = ?auto_1511883 ?auto_1511879 ) ) ( HOIST-AT ?auto_1511882 ?auto_1511883 ) ( not ( = ?auto_1511878 ?auto_1511882 ) ) ( AVAILABLE ?auto_1511882 ) ( SURFACE-AT ?auto_1511877 ?auto_1511883 ) ( ON ?auto_1511877 ?auto_1511880 ) ( CLEAR ?auto_1511877 ) ( not ( = ?auto_1511876 ?auto_1511880 ) ) ( not ( = ?auto_1511877 ?auto_1511880 ) ) ( not ( = ?auto_1511875 ?auto_1511880 ) ) ( TRUCK-AT ?auto_1511881 ?auto_1511879 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511876 ?auto_1511877 )
      ( MAKE-2CRATE-VERIFY ?auto_1511875 ?auto_1511876 ?auto_1511877 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511884 - SURFACE
      ?auto_1511885 - SURFACE
    )
    :vars
    (
      ?auto_1511888 - HOIST
      ?auto_1511887 - PLACE
      ?auto_1511890 - SURFACE
      ?auto_1511891 - PLACE
      ?auto_1511886 - HOIST
      ?auto_1511889 - SURFACE
      ?auto_1511892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511888 ?auto_1511887 ) ( IS-CRATE ?auto_1511885 ) ( not ( = ?auto_1511884 ?auto_1511885 ) ) ( not ( = ?auto_1511890 ?auto_1511884 ) ) ( not ( = ?auto_1511890 ?auto_1511885 ) ) ( not ( = ?auto_1511891 ?auto_1511887 ) ) ( HOIST-AT ?auto_1511886 ?auto_1511891 ) ( not ( = ?auto_1511888 ?auto_1511886 ) ) ( AVAILABLE ?auto_1511886 ) ( SURFACE-AT ?auto_1511885 ?auto_1511891 ) ( ON ?auto_1511885 ?auto_1511889 ) ( CLEAR ?auto_1511885 ) ( not ( = ?auto_1511884 ?auto_1511889 ) ) ( not ( = ?auto_1511885 ?auto_1511889 ) ) ( not ( = ?auto_1511890 ?auto_1511889 ) ) ( TRUCK-AT ?auto_1511892 ?auto_1511887 ) ( SURFACE-AT ?auto_1511890 ?auto_1511887 ) ( CLEAR ?auto_1511890 ) ( LIFTING ?auto_1511888 ?auto_1511884 ) ( IS-CRATE ?auto_1511884 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511890 ?auto_1511884 )
      ( MAKE-2CRATE ?auto_1511890 ?auto_1511884 ?auto_1511885 )
      ( MAKE-1CRATE-VERIFY ?auto_1511884 ?auto_1511885 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1511893 - SURFACE
      ?auto_1511894 - SURFACE
      ?auto_1511895 - SURFACE
    )
    :vars
    (
      ?auto_1511901 - HOIST
      ?auto_1511897 - PLACE
      ?auto_1511896 - PLACE
      ?auto_1511898 - HOIST
      ?auto_1511900 - SURFACE
      ?auto_1511899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511901 ?auto_1511897 ) ( IS-CRATE ?auto_1511895 ) ( not ( = ?auto_1511894 ?auto_1511895 ) ) ( not ( = ?auto_1511893 ?auto_1511894 ) ) ( not ( = ?auto_1511893 ?auto_1511895 ) ) ( not ( = ?auto_1511896 ?auto_1511897 ) ) ( HOIST-AT ?auto_1511898 ?auto_1511896 ) ( not ( = ?auto_1511901 ?auto_1511898 ) ) ( AVAILABLE ?auto_1511898 ) ( SURFACE-AT ?auto_1511895 ?auto_1511896 ) ( ON ?auto_1511895 ?auto_1511900 ) ( CLEAR ?auto_1511895 ) ( not ( = ?auto_1511894 ?auto_1511900 ) ) ( not ( = ?auto_1511895 ?auto_1511900 ) ) ( not ( = ?auto_1511893 ?auto_1511900 ) ) ( TRUCK-AT ?auto_1511899 ?auto_1511897 ) ( SURFACE-AT ?auto_1511893 ?auto_1511897 ) ( CLEAR ?auto_1511893 ) ( LIFTING ?auto_1511901 ?auto_1511894 ) ( IS-CRATE ?auto_1511894 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511894 ?auto_1511895 )
      ( MAKE-2CRATE-VERIFY ?auto_1511893 ?auto_1511894 ?auto_1511895 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511902 - SURFACE
      ?auto_1511903 - SURFACE
    )
    :vars
    (
      ?auto_1511906 - HOIST
      ?auto_1511907 - PLACE
      ?auto_1511910 - SURFACE
      ?auto_1511909 - PLACE
      ?auto_1511905 - HOIST
      ?auto_1511904 - SURFACE
      ?auto_1511908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511906 ?auto_1511907 ) ( IS-CRATE ?auto_1511903 ) ( not ( = ?auto_1511902 ?auto_1511903 ) ) ( not ( = ?auto_1511910 ?auto_1511902 ) ) ( not ( = ?auto_1511910 ?auto_1511903 ) ) ( not ( = ?auto_1511909 ?auto_1511907 ) ) ( HOIST-AT ?auto_1511905 ?auto_1511909 ) ( not ( = ?auto_1511906 ?auto_1511905 ) ) ( AVAILABLE ?auto_1511905 ) ( SURFACE-AT ?auto_1511903 ?auto_1511909 ) ( ON ?auto_1511903 ?auto_1511904 ) ( CLEAR ?auto_1511903 ) ( not ( = ?auto_1511902 ?auto_1511904 ) ) ( not ( = ?auto_1511903 ?auto_1511904 ) ) ( not ( = ?auto_1511910 ?auto_1511904 ) ) ( TRUCK-AT ?auto_1511908 ?auto_1511907 ) ( SURFACE-AT ?auto_1511910 ?auto_1511907 ) ( CLEAR ?auto_1511910 ) ( IS-CRATE ?auto_1511902 ) ( AVAILABLE ?auto_1511906 ) ( IN ?auto_1511902 ?auto_1511908 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1511906 ?auto_1511902 ?auto_1511908 ?auto_1511907 )
      ( MAKE-2CRATE ?auto_1511910 ?auto_1511902 ?auto_1511903 )
      ( MAKE-1CRATE-VERIFY ?auto_1511902 ?auto_1511903 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1511911 - SURFACE
      ?auto_1511912 - SURFACE
      ?auto_1511913 - SURFACE
    )
    :vars
    (
      ?auto_1511915 - HOIST
      ?auto_1511914 - PLACE
      ?auto_1511918 - PLACE
      ?auto_1511916 - HOIST
      ?auto_1511919 - SURFACE
      ?auto_1511917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511915 ?auto_1511914 ) ( IS-CRATE ?auto_1511913 ) ( not ( = ?auto_1511912 ?auto_1511913 ) ) ( not ( = ?auto_1511911 ?auto_1511912 ) ) ( not ( = ?auto_1511911 ?auto_1511913 ) ) ( not ( = ?auto_1511918 ?auto_1511914 ) ) ( HOIST-AT ?auto_1511916 ?auto_1511918 ) ( not ( = ?auto_1511915 ?auto_1511916 ) ) ( AVAILABLE ?auto_1511916 ) ( SURFACE-AT ?auto_1511913 ?auto_1511918 ) ( ON ?auto_1511913 ?auto_1511919 ) ( CLEAR ?auto_1511913 ) ( not ( = ?auto_1511912 ?auto_1511919 ) ) ( not ( = ?auto_1511913 ?auto_1511919 ) ) ( not ( = ?auto_1511911 ?auto_1511919 ) ) ( TRUCK-AT ?auto_1511917 ?auto_1511914 ) ( SURFACE-AT ?auto_1511911 ?auto_1511914 ) ( CLEAR ?auto_1511911 ) ( IS-CRATE ?auto_1511912 ) ( AVAILABLE ?auto_1511915 ) ( IN ?auto_1511912 ?auto_1511917 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511912 ?auto_1511913 )
      ( MAKE-2CRATE-VERIFY ?auto_1511911 ?auto_1511912 ?auto_1511913 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511956 - SURFACE
      ?auto_1511957 - SURFACE
    )
    :vars
    (
      ?auto_1511963 - HOIST
      ?auto_1511960 - PLACE
      ?auto_1511958 - SURFACE
      ?auto_1511964 - PLACE
      ?auto_1511961 - HOIST
      ?auto_1511962 - SURFACE
      ?auto_1511959 - TRUCK
      ?auto_1511965 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511963 ?auto_1511960 ) ( SURFACE-AT ?auto_1511956 ?auto_1511960 ) ( CLEAR ?auto_1511956 ) ( IS-CRATE ?auto_1511957 ) ( not ( = ?auto_1511956 ?auto_1511957 ) ) ( AVAILABLE ?auto_1511963 ) ( ON ?auto_1511956 ?auto_1511958 ) ( not ( = ?auto_1511958 ?auto_1511956 ) ) ( not ( = ?auto_1511958 ?auto_1511957 ) ) ( not ( = ?auto_1511964 ?auto_1511960 ) ) ( HOIST-AT ?auto_1511961 ?auto_1511964 ) ( not ( = ?auto_1511963 ?auto_1511961 ) ) ( AVAILABLE ?auto_1511961 ) ( SURFACE-AT ?auto_1511957 ?auto_1511964 ) ( ON ?auto_1511957 ?auto_1511962 ) ( CLEAR ?auto_1511957 ) ( not ( = ?auto_1511956 ?auto_1511962 ) ) ( not ( = ?auto_1511957 ?auto_1511962 ) ) ( not ( = ?auto_1511958 ?auto_1511962 ) ) ( TRUCK-AT ?auto_1511959 ?auto_1511965 ) ( not ( = ?auto_1511965 ?auto_1511960 ) ) ( not ( = ?auto_1511964 ?auto_1511965 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1511959 ?auto_1511965 ?auto_1511960 )
      ( MAKE-1CRATE ?auto_1511956 ?auto_1511957 )
      ( MAKE-1CRATE-VERIFY ?auto_1511956 ?auto_1511957 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1511996 - SURFACE
      ?auto_1511997 - SURFACE
      ?auto_1511998 - SURFACE
      ?auto_1511995 - SURFACE
    )
    :vars
    (
      ?auto_1512000 - HOIST
      ?auto_1511999 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512000 ?auto_1511999 ) ( SURFACE-AT ?auto_1511998 ?auto_1511999 ) ( CLEAR ?auto_1511998 ) ( LIFTING ?auto_1512000 ?auto_1511995 ) ( IS-CRATE ?auto_1511995 ) ( not ( = ?auto_1511998 ?auto_1511995 ) ) ( ON ?auto_1511997 ?auto_1511996 ) ( ON ?auto_1511998 ?auto_1511997 ) ( not ( = ?auto_1511996 ?auto_1511997 ) ) ( not ( = ?auto_1511996 ?auto_1511998 ) ) ( not ( = ?auto_1511996 ?auto_1511995 ) ) ( not ( = ?auto_1511997 ?auto_1511998 ) ) ( not ( = ?auto_1511997 ?auto_1511995 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511998 ?auto_1511995 )
      ( MAKE-3CRATE-VERIFY ?auto_1511996 ?auto_1511997 ?auto_1511998 ?auto_1511995 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1512013 - SURFACE
      ?auto_1512014 - SURFACE
      ?auto_1512015 - SURFACE
      ?auto_1512012 - SURFACE
    )
    :vars
    (
      ?auto_1512016 - HOIST
      ?auto_1512017 - PLACE
      ?auto_1512018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512016 ?auto_1512017 ) ( SURFACE-AT ?auto_1512015 ?auto_1512017 ) ( CLEAR ?auto_1512015 ) ( IS-CRATE ?auto_1512012 ) ( not ( = ?auto_1512015 ?auto_1512012 ) ) ( TRUCK-AT ?auto_1512018 ?auto_1512017 ) ( AVAILABLE ?auto_1512016 ) ( IN ?auto_1512012 ?auto_1512018 ) ( ON ?auto_1512015 ?auto_1512014 ) ( not ( = ?auto_1512014 ?auto_1512015 ) ) ( not ( = ?auto_1512014 ?auto_1512012 ) ) ( ON ?auto_1512014 ?auto_1512013 ) ( not ( = ?auto_1512013 ?auto_1512014 ) ) ( not ( = ?auto_1512013 ?auto_1512015 ) ) ( not ( = ?auto_1512013 ?auto_1512012 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512014 ?auto_1512015 ?auto_1512012 )
      ( MAKE-3CRATE-VERIFY ?auto_1512013 ?auto_1512014 ?auto_1512015 ?auto_1512012 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1512034 - SURFACE
      ?auto_1512035 - SURFACE
      ?auto_1512036 - SURFACE
      ?auto_1512033 - SURFACE
    )
    :vars
    (
      ?auto_1512037 - HOIST
      ?auto_1512040 - PLACE
      ?auto_1512039 - TRUCK
      ?auto_1512038 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512037 ?auto_1512040 ) ( SURFACE-AT ?auto_1512036 ?auto_1512040 ) ( CLEAR ?auto_1512036 ) ( IS-CRATE ?auto_1512033 ) ( not ( = ?auto_1512036 ?auto_1512033 ) ) ( AVAILABLE ?auto_1512037 ) ( IN ?auto_1512033 ?auto_1512039 ) ( ON ?auto_1512036 ?auto_1512035 ) ( not ( = ?auto_1512035 ?auto_1512036 ) ) ( not ( = ?auto_1512035 ?auto_1512033 ) ) ( TRUCK-AT ?auto_1512039 ?auto_1512038 ) ( not ( = ?auto_1512038 ?auto_1512040 ) ) ( ON ?auto_1512035 ?auto_1512034 ) ( not ( = ?auto_1512034 ?auto_1512035 ) ) ( not ( = ?auto_1512034 ?auto_1512036 ) ) ( not ( = ?auto_1512034 ?auto_1512033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512035 ?auto_1512036 ?auto_1512033 )
      ( MAKE-3CRATE-VERIFY ?auto_1512034 ?auto_1512035 ?auto_1512036 ?auto_1512033 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1512058 - SURFACE
      ?auto_1512059 - SURFACE
      ?auto_1512060 - SURFACE
      ?auto_1512057 - SURFACE
    )
    :vars
    (
      ?auto_1512061 - HOIST
      ?auto_1512065 - PLACE
      ?auto_1512064 - TRUCK
      ?auto_1512063 - PLACE
      ?auto_1512062 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512061 ?auto_1512065 ) ( SURFACE-AT ?auto_1512060 ?auto_1512065 ) ( CLEAR ?auto_1512060 ) ( IS-CRATE ?auto_1512057 ) ( not ( = ?auto_1512060 ?auto_1512057 ) ) ( AVAILABLE ?auto_1512061 ) ( ON ?auto_1512060 ?auto_1512059 ) ( not ( = ?auto_1512059 ?auto_1512060 ) ) ( not ( = ?auto_1512059 ?auto_1512057 ) ) ( TRUCK-AT ?auto_1512064 ?auto_1512063 ) ( not ( = ?auto_1512063 ?auto_1512065 ) ) ( HOIST-AT ?auto_1512062 ?auto_1512063 ) ( LIFTING ?auto_1512062 ?auto_1512057 ) ( not ( = ?auto_1512061 ?auto_1512062 ) ) ( ON ?auto_1512059 ?auto_1512058 ) ( not ( = ?auto_1512058 ?auto_1512059 ) ) ( not ( = ?auto_1512058 ?auto_1512060 ) ) ( not ( = ?auto_1512058 ?auto_1512057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512059 ?auto_1512060 ?auto_1512057 )
      ( MAKE-3CRATE-VERIFY ?auto_1512058 ?auto_1512059 ?auto_1512060 ?auto_1512057 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1512085 - SURFACE
      ?auto_1512086 - SURFACE
      ?auto_1512087 - SURFACE
      ?auto_1512084 - SURFACE
    )
    :vars
    (
      ?auto_1512089 - HOIST
      ?auto_1512091 - PLACE
      ?auto_1512090 - TRUCK
      ?auto_1512092 - PLACE
      ?auto_1512093 - HOIST
      ?auto_1512088 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512089 ?auto_1512091 ) ( SURFACE-AT ?auto_1512087 ?auto_1512091 ) ( CLEAR ?auto_1512087 ) ( IS-CRATE ?auto_1512084 ) ( not ( = ?auto_1512087 ?auto_1512084 ) ) ( AVAILABLE ?auto_1512089 ) ( ON ?auto_1512087 ?auto_1512086 ) ( not ( = ?auto_1512086 ?auto_1512087 ) ) ( not ( = ?auto_1512086 ?auto_1512084 ) ) ( TRUCK-AT ?auto_1512090 ?auto_1512092 ) ( not ( = ?auto_1512092 ?auto_1512091 ) ) ( HOIST-AT ?auto_1512093 ?auto_1512092 ) ( not ( = ?auto_1512089 ?auto_1512093 ) ) ( AVAILABLE ?auto_1512093 ) ( SURFACE-AT ?auto_1512084 ?auto_1512092 ) ( ON ?auto_1512084 ?auto_1512088 ) ( CLEAR ?auto_1512084 ) ( not ( = ?auto_1512087 ?auto_1512088 ) ) ( not ( = ?auto_1512084 ?auto_1512088 ) ) ( not ( = ?auto_1512086 ?auto_1512088 ) ) ( ON ?auto_1512086 ?auto_1512085 ) ( not ( = ?auto_1512085 ?auto_1512086 ) ) ( not ( = ?auto_1512085 ?auto_1512087 ) ) ( not ( = ?auto_1512085 ?auto_1512084 ) ) ( not ( = ?auto_1512085 ?auto_1512088 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512086 ?auto_1512087 ?auto_1512084 )
      ( MAKE-3CRATE-VERIFY ?auto_1512085 ?auto_1512086 ?auto_1512087 ?auto_1512084 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1512113 - SURFACE
      ?auto_1512114 - SURFACE
      ?auto_1512115 - SURFACE
      ?auto_1512112 - SURFACE
    )
    :vars
    (
      ?auto_1512119 - HOIST
      ?auto_1512121 - PLACE
      ?auto_1512118 - PLACE
      ?auto_1512120 - HOIST
      ?auto_1512116 - SURFACE
      ?auto_1512117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512119 ?auto_1512121 ) ( SURFACE-AT ?auto_1512115 ?auto_1512121 ) ( CLEAR ?auto_1512115 ) ( IS-CRATE ?auto_1512112 ) ( not ( = ?auto_1512115 ?auto_1512112 ) ) ( AVAILABLE ?auto_1512119 ) ( ON ?auto_1512115 ?auto_1512114 ) ( not ( = ?auto_1512114 ?auto_1512115 ) ) ( not ( = ?auto_1512114 ?auto_1512112 ) ) ( not ( = ?auto_1512118 ?auto_1512121 ) ) ( HOIST-AT ?auto_1512120 ?auto_1512118 ) ( not ( = ?auto_1512119 ?auto_1512120 ) ) ( AVAILABLE ?auto_1512120 ) ( SURFACE-AT ?auto_1512112 ?auto_1512118 ) ( ON ?auto_1512112 ?auto_1512116 ) ( CLEAR ?auto_1512112 ) ( not ( = ?auto_1512115 ?auto_1512116 ) ) ( not ( = ?auto_1512112 ?auto_1512116 ) ) ( not ( = ?auto_1512114 ?auto_1512116 ) ) ( TRUCK-AT ?auto_1512117 ?auto_1512121 ) ( ON ?auto_1512114 ?auto_1512113 ) ( not ( = ?auto_1512113 ?auto_1512114 ) ) ( not ( = ?auto_1512113 ?auto_1512115 ) ) ( not ( = ?auto_1512113 ?auto_1512112 ) ) ( not ( = ?auto_1512113 ?auto_1512116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512114 ?auto_1512115 ?auto_1512112 )
      ( MAKE-3CRATE-VERIFY ?auto_1512113 ?auto_1512114 ?auto_1512115 ?auto_1512112 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1512141 - SURFACE
      ?auto_1512142 - SURFACE
      ?auto_1512143 - SURFACE
      ?auto_1512140 - SURFACE
    )
    :vars
    (
      ?auto_1512147 - HOIST
      ?auto_1512145 - PLACE
      ?auto_1512144 - PLACE
      ?auto_1512148 - HOIST
      ?auto_1512149 - SURFACE
      ?auto_1512146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512147 ?auto_1512145 ) ( IS-CRATE ?auto_1512140 ) ( not ( = ?auto_1512143 ?auto_1512140 ) ) ( not ( = ?auto_1512142 ?auto_1512143 ) ) ( not ( = ?auto_1512142 ?auto_1512140 ) ) ( not ( = ?auto_1512144 ?auto_1512145 ) ) ( HOIST-AT ?auto_1512148 ?auto_1512144 ) ( not ( = ?auto_1512147 ?auto_1512148 ) ) ( AVAILABLE ?auto_1512148 ) ( SURFACE-AT ?auto_1512140 ?auto_1512144 ) ( ON ?auto_1512140 ?auto_1512149 ) ( CLEAR ?auto_1512140 ) ( not ( = ?auto_1512143 ?auto_1512149 ) ) ( not ( = ?auto_1512140 ?auto_1512149 ) ) ( not ( = ?auto_1512142 ?auto_1512149 ) ) ( TRUCK-AT ?auto_1512146 ?auto_1512145 ) ( SURFACE-AT ?auto_1512142 ?auto_1512145 ) ( CLEAR ?auto_1512142 ) ( LIFTING ?auto_1512147 ?auto_1512143 ) ( IS-CRATE ?auto_1512143 ) ( ON ?auto_1512142 ?auto_1512141 ) ( not ( = ?auto_1512141 ?auto_1512142 ) ) ( not ( = ?auto_1512141 ?auto_1512143 ) ) ( not ( = ?auto_1512141 ?auto_1512140 ) ) ( not ( = ?auto_1512141 ?auto_1512149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512142 ?auto_1512143 ?auto_1512140 )
      ( MAKE-3CRATE-VERIFY ?auto_1512141 ?auto_1512142 ?auto_1512143 ?auto_1512140 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1512169 - SURFACE
      ?auto_1512170 - SURFACE
      ?auto_1512171 - SURFACE
      ?auto_1512168 - SURFACE
    )
    :vars
    (
      ?auto_1512173 - HOIST
      ?auto_1512175 - PLACE
      ?auto_1512172 - PLACE
      ?auto_1512174 - HOIST
      ?auto_1512177 - SURFACE
      ?auto_1512176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512173 ?auto_1512175 ) ( IS-CRATE ?auto_1512168 ) ( not ( = ?auto_1512171 ?auto_1512168 ) ) ( not ( = ?auto_1512170 ?auto_1512171 ) ) ( not ( = ?auto_1512170 ?auto_1512168 ) ) ( not ( = ?auto_1512172 ?auto_1512175 ) ) ( HOIST-AT ?auto_1512174 ?auto_1512172 ) ( not ( = ?auto_1512173 ?auto_1512174 ) ) ( AVAILABLE ?auto_1512174 ) ( SURFACE-AT ?auto_1512168 ?auto_1512172 ) ( ON ?auto_1512168 ?auto_1512177 ) ( CLEAR ?auto_1512168 ) ( not ( = ?auto_1512171 ?auto_1512177 ) ) ( not ( = ?auto_1512168 ?auto_1512177 ) ) ( not ( = ?auto_1512170 ?auto_1512177 ) ) ( TRUCK-AT ?auto_1512176 ?auto_1512175 ) ( SURFACE-AT ?auto_1512170 ?auto_1512175 ) ( CLEAR ?auto_1512170 ) ( IS-CRATE ?auto_1512171 ) ( AVAILABLE ?auto_1512173 ) ( IN ?auto_1512171 ?auto_1512176 ) ( ON ?auto_1512170 ?auto_1512169 ) ( not ( = ?auto_1512169 ?auto_1512170 ) ) ( not ( = ?auto_1512169 ?auto_1512171 ) ) ( not ( = ?auto_1512169 ?auto_1512168 ) ) ( not ( = ?auto_1512169 ?auto_1512177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512170 ?auto_1512171 ?auto_1512168 )
      ( MAKE-3CRATE-VERIFY ?auto_1512169 ?auto_1512170 ?auto_1512171 ?auto_1512168 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1512460 - SURFACE
      ?auto_1512461 - SURFACE
      ?auto_1512462 - SURFACE
      ?auto_1512459 - SURFACE
      ?auto_1512463 - SURFACE
    )
    :vars
    (
      ?auto_1512465 - HOIST
      ?auto_1512464 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512465 ?auto_1512464 ) ( SURFACE-AT ?auto_1512459 ?auto_1512464 ) ( CLEAR ?auto_1512459 ) ( LIFTING ?auto_1512465 ?auto_1512463 ) ( IS-CRATE ?auto_1512463 ) ( not ( = ?auto_1512459 ?auto_1512463 ) ) ( ON ?auto_1512461 ?auto_1512460 ) ( ON ?auto_1512462 ?auto_1512461 ) ( ON ?auto_1512459 ?auto_1512462 ) ( not ( = ?auto_1512460 ?auto_1512461 ) ) ( not ( = ?auto_1512460 ?auto_1512462 ) ) ( not ( = ?auto_1512460 ?auto_1512459 ) ) ( not ( = ?auto_1512460 ?auto_1512463 ) ) ( not ( = ?auto_1512461 ?auto_1512462 ) ) ( not ( = ?auto_1512461 ?auto_1512459 ) ) ( not ( = ?auto_1512461 ?auto_1512463 ) ) ( not ( = ?auto_1512462 ?auto_1512459 ) ) ( not ( = ?auto_1512462 ?auto_1512463 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1512459 ?auto_1512463 )
      ( MAKE-4CRATE-VERIFY ?auto_1512460 ?auto_1512461 ?auto_1512462 ?auto_1512459 ?auto_1512463 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1512485 - SURFACE
      ?auto_1512486 - SURFACE
      ?auto_1512487 - SURFACE
      ?auto_1512484 - SURFACE
      ?auto_1512488 - SURFACE
    )
    :vars
    (
      ?auto_1512489 - HOIST
      ?auto_1512491 - PLACE
      ?auto_1512490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512489 ?auto_1512491 ) ( SURFACE-AT ?auto_1512484 ?auto_1512491 ) ( CLEAR ?auto_1512484 ) ( IS-CRATE ?auto_1512488 ) ( not ( = ?auto_1512484 ?auto_1512488 ) ) ( TRUCK-AT ?auto_1512490 ?auto_1512491 ) ( AVAILABLE ?auto_1512489 ) ( IN ?auto_1512488 ?auto_1512490 ) ( ON ?auto_1512484 ?auto_1512487 ) ( not ( = ?auto_1512487 ?auto_1512484 ) ) ( not ( = ?auto_1512487 ?auto_1512488 ) ) ( ON ?auto_1512486 ?auto_1512485 ) ( ON ?auto_1512487 ?auto_1512486 ) ( not ( = ?auto_1512485 ?auto_1512486 ) ) ( not ( = ?auto_1512485 ?auto_1512487 ) ) ( not ( = ?auto_1512485 ?auto_1512484 ) ) ( not ( = ?auto_1512485 ?auto_1512488 ) ) ( not ( = ?auto_1512486 ?auto_1512487 ) ) ( not ( = ?auto_1512486 ?auto_1512484 ) ) ( not ( = ?auto_1512486 ?auto_1512488 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512487 ?auto_1512484 ?auto_1512488 )
      ( MAKE-4CRATE-VERIFY ?auto_1512485 ?auto_1512486 ?auto_1512487 ?auto_1512484 ?auto_1512488 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1512515 - SURFACE
      ?auto_1512516 - SURFACE
      ?auto_1512517 - SURFACE
      ?auto_1512514 - SURFACE
      ?auto_1512518 - SURFACE
    )
    :vars
    (
      ?auto_1512521 - HOIST
      ?auto_1512520 - PLACE
      ?auto_1512522 - TRUCK
      ?auto_1512519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512521 ?auto_1512520 ) ( SURFACE-AT ?auto_1512514 ?auto_1512520 ) ( CLEAR ?auto_1512514 ) ( IS-CRATE ?auto_1512518 ) ( not ( = ?auto_1512514 ?auto_1512518 ) ) ( AVAILABLE ?auto_1512521 ) ( IN ?auto_1512518 ?auto_1512522 ) ( ON ?auto_1512514 ?auto_1512517 ) ( not ( = ?auto_1512517 ?auto_1512514 ) ) ( not ( = ?auto_1512517 ?auto_1512518 ) ) ( TRUCK-AT ?auto_1512522 ?auto_1512519 ) ( not ( = ?auto_1512519 ?auto_1512520 ) ) ( ON ?auto_1512516 ?auto_1512515 ) ( ON ?auto_1512517 ?auto_1512516 ) ( not ( = ?auto_1512515 ?auto_1512516 ) ) ( not ( = ?auto_1512515 ?auto_1512517 ) ) ( not ( = ?auto_1512515 ?auto_1512514 ) ) ( not ( = ?auto_1512515 ?auto_1512518 ) ) ( not ( = ?auto_1512516 ?auto_1512517 ) ) ( not ( = ?auto_1512516 ?auto_1512514 ) ) ( not ( = ?auto_1512516 ?auto_1512518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512517 ?auto_1512514 ?auto_1512518 )
      ( MAKE-4CRATE-VERIFY ?auto_1512515 ?auto_1512516 ?auto_1512517 ?auto_1512514 ?auto_1512518 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1512549 - SURFACE
      ?auto_1512550 - SURFACE
      ?auto_1512551 - SURFACE
      ?auto_1512548 - SURFACE
      ?auto_1512552 - SURFACE
    )
    :vars
    (
      ?auto_1512553 - HOIST
      ?auto_1512555 - PLACE
      ?auto_1512557 - TRUCK
      ?auto_1512554 - PLACE
      ?auto_1512556 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512553 ?auto_1512555 ) ( SURFACE-AT ?auto_1512548 ?auto_1512555 ) ( CLEAR ?auto_1512548 ) ( IS-CRATE ?auto_1512552 ) ( not ( = ?auto_1512548 ?auto_1512552 ) ) ( AVAILABLE ?auto_1512553 ) ( ON ?auto_1512548 ?auto_1512551 ) ( not ( = ?auto_1512551 ?auto_1512548 ) ) ( not ( = ?auto_1512551 ?auto_1512552 ) ) ( TRUCK-AT ?auto_1512557 ?auto_1512554 ) ( not ( = ?auto_1512554 ?auto_1512555 ) ) ( HOIST-AT ?auto_1512556 ?auto_1512554 ) ( LIFTING ?auto_1512556 ?auto_1512552 ) ( not ( = ?auto_1512553 ?auto_1512556 ) ) ( ON ?auto_1512550 ?auto_1512549 ) ( ON ?auto_1512551 ?auto_1512550 ) ( not ( = ?auto_1512549 ?auto_1512550 ) ) ( not ( = ?auto_1512549 ?auto_1512551 ) ) ( not ( = ?auto_1512549 ?auto_1512548 ) ) ( not ( = ?auto_1512549 ?auto_1512552 ) ) ( not ( = ?auto_1512550 ?auto_1512551 ) ) ( not ( = ?auto_1512550 ?auto_1512548 ) ) ( not ( = ?auto_1512550 ?auto_1512552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512551 ?auto_1512548 ?auto_1512552 )
      ( MAKE-4CRATE-VERIFY ?auto_1512549 ?auto_1512550 ?auto_1512551 ?auto_1512548 ?auto_1512552 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1512587 - SURFACE
      ?auto_1512588 - SURFACE
      ?auto_1512589 - SURFACE
      ?auto_1512586 - SURFACE
      ?auto_1512590 - SURFACE
    )
    :vars
    (
      ?auto_1512596 - HOIST
      ?auto_1512594 - PLACE
      ?auto_1512592 - TRUCK
      ?auto_1512595 - PLACE
      ?auto_1512591 - HOIST
      ?auto_1512593 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512596 ?auto_1512594 ) ( SURFACE-AT ?auto_1512586 ?auto_1512594 ) ( CLEAR ?auto_1512586 ) ( IS-CRATE ?auto_1512590 ) ( not ( = ?auto_1512586 ?auto_1512590 ) ) ( AVAILABLE ?auto_1512596 ) ( ON ?auto_1512586 ?auto_1512589 ) ( not ( = ?auto_1512589 ?auto_1512586 ) ) ( not ( = ?auto_1512589 ?auto_1512590 ) ) ( TRUCK-AT ?auto_1512592 ?auto_1512595 ) ( not ( = ?auto_1512595 ?auto_1512594 ) ) ( HOIST-AT ?auto_1512591 ?auto_1512595 ) ( not ( = ?auto_1512596 ?auto_1512591 ) ) ( AVAILABLE ?auto_1512591 ) ( SURFACE-AT ?auto_1512590 ?auto_1512595 ) ( ON ?auto_1512590 ?auto_1512593 ) ( CLEAR ?auto_1512590 ) ( not ( = ?auto_1512586 ?auto_1512593 ) ) ( not ( = ?auto_1512590 ?auto_1512593 ) ) ( not ( = ?auto_1512589 ?auto_1512593 ) ) ( ON ?auto_1512588 ?auto_1512587 ) ( ON ?auto_1512589 ?auto_1512588 ) ( not ( = ?auto_1512587 ?auto_1512588 ) ) ( not ( = ?auto_1512587 ?auto_1512589 ) ) ( not ( = ?auto_1512587 ?auto_1512586 ) ) ( not ( = ?auto_1512587 ?auto_1512590 ) ) ( not ( = ?auto_1512587 ?auto_1512593 ) ) ( not ( = ?auto_1512588 ?auto_1512589 ) ) ( not ( = ?auto_1512588 ?auto_1512586 ) ) ( not ( = ?auto_1512588 ?auto_1512590 ) ) ( not ( = ?auto_1512588 ?auto_1512593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512589 ?auto_1512586 ?auto_1512590 )
      ( MAKE-4CRATE-VERIFY ?auto_1512587 ?auto_1512588 ?auto_1512589 ?auto_1512586 ?auto_1512590 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1512626 - SURFACE
      ?auto_1512627 - SURFACE
      ?auto_1512628 - SURFACE
      ?auto_1512625 - SURFACE
      ?auto_1512629 - SURFACE
    )
    :vars
    (
      ?auto_1512631 - HOIST
      ?auto_1512630 - PLACE
      ?auto_1512633 - PLACE
      ?auto_1512632 - HOIST
      ?auto_1512635 - SURFACE
      ?auto_1512634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512631 ?auto_1512630 ) ( SURFACE-AT ?auto_1512625 ?auto_1512630 ) ( CLEAR ?auto_1512625 ) ( IS-CRATE ?auto_1512629 ) ( not ( = ?auto_1512625 ?auto_1512629 ) ) ( AVAILABLE ?auto_1512631 ) ( ON ?auto_1512625 ?auto_1512628 ) ( not ( = ?auto_1512628 ?auto_1512625 ) ) ( not ( = ?auto_1512628 ?auto_1512629 ) ) ( not ( = ?auto_1512633 ?auto_1512630 ) ) ( HOIST-AT ?auto_1512632 ?auto_1512633 ) ( not ( = ?auto_1512631 ?auto_1512632 ) ) ( AVAILABLE ?auto_1512632 ) ( SURFACE-AT ?auto_1512629 ?auto_1512633 ) ( ON ?auto_1512629 ?auto_1512635 ) ( CLEAR ?auto_1512629 ) ( not ( = ?auto_1512625 ?auto_1512635 ) ) ( not ( = ?auto_1512629 ?auto_1512635 ) ) ( not ( = ?auto_1512628 ?auto_1512635 ) ) ( TRUCK-AT ?auto_1512634 ?auto_1512630 ) ( ON ?auto_1512627 ?auto_1512626 ) ( ON ?auto_1512628 ?auto_1512627 ) ( not ( = ?auto_1512626 ?auto_1512627 ) ) ( not ( = ?auto_1512626 ?auto_1512628 ) ) ( not ( = ?auto_1512626 ?auto_1512625 ) ) ( not ( = ?auto_1512626 ?auto_1512629 ) ) ( not ( = ?auto_1512626 ?auto_1512635 ) ) ( not ( = ?auto_1512627 ?auto_1512628 ) ) ( not ( = ?auto_1512627 ?auto_1512625 ) ) ( not ( = ?auto_1512627 ?auto_1512629 ) ) ( not ( = ?auto_1512627 ?auto_1512635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512628 ?auto_1512625 ?auto_1512629 )
      ( MAKE-4CRATE-VERIFY ?auto_1512626 ?auto_1512627 ?auto_1512628 ?auto_1512625 ?auto_1512629 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1512665 - SURFACE
      ?auto_1512666 - SURFACE
      ?auto_1512667 - SURFACE
      ?auto_1512664 - SURFACE
      ?auto_1512668 - SURFACE
    )
    :vars
    (
      ?auto_1512670 - HOIST
      ?auto_1512671 - PLACE
      ?auto_1512673 - PLACE
      ?auto_1512669 - HOIST
      ?auto_1512672 - SURFACE
      ?auto_1512674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512670 ?auto_1512671 ) ( IS-CRATE ?auto_1512668 ) ( not ( = ?auto_1512664 ?auto_1512668 ) ) ( not ( = ?auto_1512667 ?auto_1512664 ) ) ( not ( = ?auto_1512667 ?auto_1512668 ) ) ( not ( = ?auto_1512673 ?auto_1512671 ) ) ( HOIST-AT ?auto_1512669 ?auto_1512673 ) ( not ( = ?auto_1512670 ?auto_1512669 ) ) ( AVAILABLE ?auto_1512669 ) ( SURFACE-AT ?auto_1512668 ?auto_1512673 ) ( ON ?auto_1512668 ?auto_1512672 ) ( CLEAR ?auto_1512668 ) ( not ( = ?auto_1512664 ?auto_1512672 ) ) ( not ( = ?auto_1512668 ?auto_1512672 ) ) ( not ( = ?auto_1512667 ?auto_1512672 ) ) ( TRUCK-AT ?auto_1512674 ?auto_1512671 ) ( SURFACE-AT ?auto_1512667 ?auto_1512671 ) ( CLEAR ?auto_1512667 ) ( LIFTING ?auto_1512670 ?auto_1512664 ) ( IS-CRATE ?auto_1512664 ) ( ON ?auto_1512666 ?auto_1512665 ) ( ON ?auto_1512667 ?auto_1512666 ) ( not ( = ?auto_1512665 ?auto_1512666 ) ) ( not ( = ?auto_1512665 ?auto_1512667 ) ) ( not ( = ?auto_1512665 ?auto_1512664 ) ) ( not ( = ?auto_1512665 ?auto_1512668 ) ) ( not ( = ?auto_1512665 ?auto_1512672 ) ) ( not ( = ?auto_1512666 ?auto_1512667 ) ) ( not ( = ?auto_1512666 ?auto_1512664 ) ) ( not ( = ?auto_1512666 ?auto_1512668 ) ) ( not ( = ?auto_1512666 ?auto_1512672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512667 ?auto_1512664 ?auto_1512668 )
      ( MAKE-4CRATE-VERIFY ?auto_1512665 ?auto_1512666 ?auto_1512667 ?auto_1512664 ?auto_1512668 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1512704 - SURFACE
      ?auto_1512705 - SURFACE
      ?auto_1512706 - SURFACE
      ?auto_1512703 - SURFACE
      ?auto_1512707 - SURFACE
    )
    :vars
    (
      ?auto_1512711 - HOIST
      ?auto_1512708 - PLACE
      ?auto_1512713 - PLACE
      ?auto_1512710 - HOIST
      ?auto_1512709 - SURFACE
      ?auto_1512712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512711 ?auto_1512708 ) ( IS-CRATE ?auto_1512707 ) ( not ( = ?auto_1512703 ?auto_1512707 ) ) ( not ( = ?auto_1512706 ?auto_1512703 ) ) ( not ( = ?auto_1512706 ?auto_1512707 ) ) ( not ( = ?auto_1512713 ?auto_1512708 ) ) ( HOIST-AT ?auto_1512710 ?auto_1512713 ) ( not ( = ?auto_1512711 ?auto_1512710 ) ) ( AVAILABLE ?auto_1512710 ) ( SURFACE-AT ?auto_1512707 ?auto_1512713 ) ( ON ?auto_1512707 ?auto_1512709 ) ( CLEAR ?auto_1512707 ) ( not ( = ?auto_1512703 ?auto_1512709 ) ) ( not ( = ?auto_1512707 ?auto_1512709 ) ) ( not ( = ?auto_1512706 ?auto_1512709 ) ) ( TRUCK-AT ?auto_1512712 ?auto_1512708 ) ( SURFACE-AT ?auto_1512706 ?auto_1512708 ) ( CLEAR ?auto_1512706 ) ( IS-CRATE ?auto_1512703 ) ( AVAILABLE ?auto_1512711 ) ( IN ?auto_1512703 ?auto_1512712 ) ( ON ?auto_1512705 ?auto_1512704 ) ( ON ?auto_1512706 ?auto_1512705 ) ( not ( = ?auto_1512704 ?auto_1512705 ) ) ( not ( = ?auto_1512704 ?auto_1512706 ) ) ( not ( = ?auto_1512704 ?auto_1512703 ) ) ( not ( = ?auto_1512704 ?auto_1512707 ) ) ( not ( = ?auto_1512704 ?auto_1512709 ) ) ( not ( = ?auto_1512705 ?auto_1512706 ) ) ( not ( = ?auto_1512705 ?auto_1512703 ) ) ( not ( = ?auto_1512705 ?auto_1512707 ) ) ( not ( = ?auto_1512705 ?auto_1512709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512706 ?auto_1512703 ?auto_1512707 )
      ( MAKE-4CRATE-VERIFY ?auto_1512704 ?auto_1512705 ?auto_1512706 ?auto_1512703 ?auto_1512707 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1513364 - SURFACE
      ?auto_1513365 - SURFACE
      ?auto_1513366 - SURFACE
      ?auto_1513363 - SURFACE
      ?auto_1513367 - SURFACE
      ?auto_1513368 - SURFACE
    )
    :vars
    (
      ?auto_1513370 - HOIST
      ?auto_1513369 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513370 ?auto_1513369 ) ( SURFACE-AT ?auto_1513367 ?auto_1513369 ) ( CLEAR ?auto_1513367 ) ( LIFTING ?auto_1513370 ?auto_1513368 ) ( IS-CRATE ?auto_1513368 ) ( not ( = ?auto_1513367 ?auto_1513368 ) ) ( ON ?auto_1513365 ?auto_1513364 ) ( ON ?auto_1513366 ?auto_1513365 ) ( ON ?auto_1513363 ?auto_1513366 ) ( ON ?auto_1513367 ?auto_1513363 ) ( not ( = ?auto_1513364 ?auto_1513365 ) ) ( not ( = ?auto_1513364 ?auto_1513366 ) ) ( not ( = ?auto_1513364 ?auto_1513363 ) ) ( not ( = ?auto_1513364 ?auto_1513367 ) ) ( not ( = ?auto_1513364 ?auto_1513368 ) ) ( not ( = ?auto_1513365 ?auto_1513366 ) ) ( not ( = ?auto_1513365 ?auto_1513363 ) ) ( not ( = ?auto_1513365 ?auto_1513367 ) ) ( not ( = ?auto_1513365 ?auto_1513368 ) ) ( not ( = ?auto_1513366 ?auto_1513363 ) ) ( not ( = ?auto_1513366 ?auto_1513367 ) ) ( not ( = ?auto_1513366 ?auto_1513368 ) ) ( not ( = ?auto_1513363 ?auto_1513367 ) ) ( not ( = ?auto_1513363 ?auto_1513368 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1513367 ?auto_1513368 )
      ( MAKE-5CRATE-VERIFY ?auto_1513364 ?auto_1513365 ?auto_1513366 ?auto_1513363 ?auto_1513367 ?auto_1513368 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1513398 - SURFACE
      ?auto_1513399 - SURFACE
      ?auto_1513400 - SURFACE
      ?auto_1513397 - SURFACE
      ?auto_1513401 - SURFACE
      ?auto_1513402 - SURFACE
    )
    :vars
    (
      ?auto_1513404 - HOIST
      ?auto_1513405 - PLACE
      ?auto_1513403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513404 ?auto_1513405 ) ( SURFACE-AT ?auto_1513401 ?auto_1513405 ) ( CLEAR ?auto_1513401 ) ( IS-CRATE ?auto_1513402 ) ( not ( = ?auto_1513401 ?auto_1513402 ) ) ( TRUCK-AT ?auto_1513403 ?auto_1513405 ) ( AVAILABLE ?auto_1513404 ) ( IN ?auto_1513402 ?auto_1513403 ) ( ON ?auto_1513401 ?auto_1513397 ) ( not ( = ?auto_1513397 ?auto_1513401 ) ) ( not ( = ?auto_1513397 ?auto_1513402 ) ) ( ON ?auto_1513399 ?auto_1513398 ) ( ON ?auto_1513400 ?auto_1513399 ) ( ON ?auto_1513397 ?auto_1513400 ) ( not ( = ?auto_1513398 ?auto_1513399 ) ) ( not ( = ?auto_1513398 ?auto_1513400 ) ) ( not ( = ?auto_1513398 ?auto_1513397 ) ) ( not ( = ?auto_1513398 ?auto_1513401 ) ) ( not ( = ?auto_1513398 ?auto_1513402 ) ) ( not ( = ?auto_1513399 ?auto_1513400 ) ) ( not ( = ?auto_1513399 ?auto_1513397 ) ) ( not ( = ?auto_1513399 ?auto_1513401 ) ) ( not ( = ?auto_1513399 ?auto_1513402 ) ) ( not ( = ?auto_1513400 ?auto_1513397 ) ) ( not ( = ?auto_1513400 ?auto_1513401 ) ) ( not ( = ?auto_1513400 ?auto_1513402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513397 ?auto_1513401 ?auto_1513402 )
      ( MAKE-5CRATE-VERIFY ?auto_1513398 ?auto_1513399 ?auto_1513400 ?auto_1513397 ?auto_1513401 ?auto_1513402 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1513438 - SURFACE
      ?auto_1513439 - SURFACE
      ?auto_1513440 - SURFACE
      ?auto_1513437 - SURFACE
      ?auto_1513441 - SURFACE
      ?auto_1513442 - SURFACE
    )
    :vars
    (
      ?auto_1513443 - HOIST
      ?auto_1513446 - PLACE
      ?auto_1513445 - TRUCK
      ?auto_1513444 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513443 ?auto_1513446 ) ( SURFACE-AT ?auto_1513441 ?auto_1513446 ) ( CLEAR ?auto_1513441 ) ( IS-CRATE ?auto_1513442 ) ( not ( = ?auto_1513441 ?auto_1513442 ) ) ( AVAILABLE ?auto_1513443 ) ( IN ?auto_1513442 ?auto_1513445 ) ( ON ?auto_1513441 ?auto_1513437 ) ( not ( = ?auto_1513437 ?auto_1513441 ) ) ( not ( = ?auto_1513437 ?auto_1513442 ) ) ( TRUCK-AT ?auto_1513445 ?auto_1513444 ) ( not ( = ?auto_1513444 ?auto_1513446 ) ) ( ON ?auto_1513439 ?auto_1513438 ) ( ON ?auto_1513440 ?auto_1513439 ) ( ON ?auto_1513437 ?auto_1513440 ) ( not ( = ?auto_1513438 ?auto_1513439 ) ) ( not ( = ?auto_1513438 ?auto_1513440 ) ) ( not ( = ?auto_1513438 ?auto_1513437 ) ) ( not ( = ?auto_1513438 ?auto_1513441 ) ) ( not ( = ?auto_1513438 ?auto_1513442 ) ) ( not ( = ?auto_1513439 ?auto_1513440 ) ) ( not ( = ?auto_1513439 ?auto_1513437 ) ) ( not ( = ?auto_1513439 ?auto_1513441 ) ) ( not ( = ?auto_1513439 ?auto_1513442 ) ) ( not ( = ?auto_1513440 ?auto_1513437 ) ) ( not ( = ?auto_1513440 ?auto_1513441 ) ) ( not ( = ?auto_1513440 ?auto_1513442 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513437 ?auto_1513441 ?auto_1513442 )
      ( MAKE-5CRATE-VERIFY ?auto_1513438 ?auto_1513439 ?auto_1513440 ?auto_1513437 ?auto_1513441 ?auto_1513442 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1513483 - SURFACE
      ?auto_1513484 - SURFACE
      ?auto_1513485 - SURFACE
      ?auto_1513482 - SURFACE
      ?auto_1513486 - SURFACE
      ?auto_1513487 - SURFACE
    )
    :vars
    (
      ?auto_1513491 - HOIST
      ?auto_1513489 - PLACE
      ?auto_1513488 - TRUCK
      ?auto_1513490 - PLACE
      ?auto_1513492 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513491 ?auto_1513489 ) ( SURFACE-AT ?auto_1513486 ?auto_1513489 ) ( CLEAR ?auto_1513486 ) ( IS-CRATE ?auto_1513487 ) ( not ( = ?auto_1513486 ?auto_1513487 ) ) ( AVAILABLE ?auto_1513491 ) ( ON ?auto_1513486 ?auto_1513482 ) ( not ( = ?auto_1513482 ?auto_1513486 ) ) ( not ( = ?auto_1513482 ?auto_1513487 ) ) ( TRUCK-AT ?auto_1513488 ?auto_1513490 ) ( not ( = ?auto_1513490 ?auto_1513489 ) ) ( HOIST-AT ?auto_1513492 ?auto_1513490 ) ( LIFTING ?auto_1513492 ?auto_1513487 ) ( not ( = ?auto_1513491 ?auto_1513492 ) ) ( ON ?auto_1513484 ?auto_1513483 ) ( ON ?auto_1513485 ?auto_1513484 ) ( ON ?auto_1513482 ?auto_1513485 ) ( not ( = ?auto_1513483 ?auto_1513484 ) ) ( not ( = ?auto_1513483 ?auto_1513485 ) ) ( not ( = ?auto_1513483 ?auto_1513482 ) ) ( not ( = ?auto_1513483 ?auto_1513486 ) ) ( not ( = ?auto_1513483 ?auto_1513487 ) ) ( not ( = ?auto_1513484 ?auto_1513485 ) ) ( not ( = ?auto_1513484 ?auto_1513482 ) ) ( not ( = ?auto_1513484 ?auto_1513486 ) ) ( not ( = ?auto_1513484 ?auto_1513487 ) ) ( not ( = ?auto_1513485 ?auto_1513482 ) ) ( not ( = ?auto_1513485 ?auto_1513486 ) ) ( not ( = ?auto_1513485 ?auto_1513487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513482 ?auto_1513486 ?auto_1513487 )
      ( MAKE-5CRATE-VERIFY ?auto_1513483 ?auto_1513484 ?auto_1513485 ?auto_1513482 ?auto_1513486 ?auto_1513487 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1513533 - SURFACE
      ?auto_1513534 - SURFACE
      ?auto_1513535 - SURFACE
      ?auto_1513532 - SURFACE
      ?auto_1513536 - SURFACE
      ?auto_1513537 - SURFACE
    )
    :vars
    (
      ?auto_1513541 - HOIST
      ?auto_1513540 - PLACE
      ?auto_1513539 - TRUCK
      ?auto_1513543 - PLACE
      ?auto_1513542 - HOIST
      ?auto_1513538 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513541 ?auto_1513540 ) ( SURFACE-AT ?auto_1513536 ?auto_1513540 ) ( CLEAR ?auto_1513536 ) ( IS-CRATE ?auto_1513537 ) ( not ( = ?auto_1513536 ?auto_1513537 ) ) ( AVAILABLE ?auto_1513541 ) ( ON ?auto_1513536 ?auto_1513532 ) ( not ( = ?auto_1513532 ?auto_1513536 ) ) ( not ( = ?auto_1513532 ?auto_1513537 ) ) ( TRUCK-AT ?auto_1513539 ?auto_1513543 ) ( not ( = ?auto_1513543 ?auto_1513540 ) ) ( HOIST-AT ?auto_1513542 ?auto_1513543 ) ( not ( = ?auto_1513541 ?auto_1513542 ) ) ( AVAILABLE ?auto_1513542 ) ( SURFACE-AT ?auto_1513537 ?auto_1513543 ) ( ON ?auto_1513537 ?auto_1513538 ) ( CLEAR ?auto_1513537 ) ( not ( = ?auto_1513536 ?auto_1513538 ) ) ( not ( = ?auto_1513537 ?auto_1513538 ) ) ( not ( = ?auto_1513532 ?auto_1513538 ) ) ( ON ?auto_1513534 ?auto_1513533 ) ( ON ?auto_1513535 ?auto_1513534 ) ( ON ?auto_1513532 ?auto_1513535 ) ( not ( = ?auto_1513533 ?auto_1513534 ) ) ( not ( = ?auto_1513533 ?auto_1513535 ) ) ( not ( = ?auto_1513533 ?auto_1513532 ) ) ( not ( = ?auto_1513533 ?auto_1513536 ) ) ( not ( = ?auto_1513533 ?auto_1513537 ) ) ( not ( = ?auto_1513533 ?auto_1513538 ) ) ( not ( = ?auto_1513534 ?auto_1513535 ) ) ( not ( = ?auto_1513534 ?auto_1513532 ) ) ( not ( = ?auto_1513534 ?auto_1513536 ) ) ( not ( = ?auto_1513534 ?auto_1513537 ) ) ( not ( = ?auto_1513534 ?auto_1513538 ) ) ( not ( = ?auto_1513535 ?auto_1513532 ) ) ( not ( = ?auto_1513535 ?auto_1513536 ) ) ( not ( = ?auto_1513535 ?auto_1513537 ) ) ( not ( = ?auto_1513535 ?auto_1513538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513532 ?auto_1513536 ?auto_1513537 )
      ( MAKE-5CRATE-VERIFY ?auto_1513533 ?auto_1513534 ?auto_1513535 ?auto_1513532 ?auto_1513536 ?auto_1513537 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1513584 - SURFACE
      ?auto_1513585 - SURFACE
      ?auto_1513586 - SURFACE
      ?auto_1513583 - SURFACE
      ?auto_1513587 - SURFACE
      ?auto_1513588 - SURFACE
    )
    :vars
    (
      ?auto_1513593 - HOIST
      ?auto_1513592 - PLACE
      ?auto_1513589 - PLACE
      ?auto_1513590 - HOIST
      ?auto_1513591 - SURFACE
      ?auto_1513594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513593 ?auto_1513592 ) ( SURFACE-AT ?auto_1513587 ?auto_1513592 ) ( CLEAR ?auto_1513587 ) ( IS-CRATE ?auto_1513588 ) ( not ( = ?auto_1513587 ?auto_1513588 ) ) ( AVAILABLE ?auto_1513593 ) ( ON ?auto_1513587 ?auto_1513583 ) ( not ( = ?auto_1513583 ?auto_1513587 ) ) ( not ( = ?auto_1513583 ?auto_1513588 ) ) ( not ( = ?auto_1513589 ?auto_1513592 ) ) ( HOIST-AT ?auto_1513590 ?auto_1513589 ) ( not ( = ?auto_1513593 ?auto_1513590 ) ) ( AVAILABLE ?auto_1513590 ) ( SURFACE-AT ?auto_1513588 ?auto_1513589 ) ( ON ?auto_1513588 ?auto_1513591 ) ( CLEAR ?auto_1513588 ) ( not ( = ?auto_1513587 ?auto_1513591 ) ) ( not ( = ?auto_1513588 ?auto_1513591 ) ) ( not ( = ?auto_1513583 ?auto_1513591 ) ) ( TRUCK-AT ?auto_1513594 ?auto_1513592 ) ( ON ?auto_1513585 ?auto_1513584 ) ( ON ?auto_1513586 ?auto_1513585 ) ( ON ?auto_1513583 ?auto_1513586 ) ( not ( = ?auto_1513584 ?auto_1513585 ) ) ( not ( = ?auto_1513584 ?auto_1513586 ) ) ( not ( = ?auto_1513584 ?auto_1513583 ) ) ( not ( = ?auto_1513584 ?auto_1513587 ) ) ( not ( = ?auto_1513584 ?auto_1513588 ) ) ( not ( = ?auto_1513584 ?auto_1513591 ) ) ( not ( = ?auto_1513585 ?auto_1513586 ) ) ( not ( = ?auto_1513585 ?auto_1513583 ) ) ( not ( = ?auto_1513585 ?auto_1513587 ) ) ( not ( = ?auto_1513585 ?auto_1513588 ) ) ( not ( = ?auto_1513585 ?auto_1513591 ) ) ( not ( = ?auto_1513586 ?auto_1513583 ) ) ( not ( = ?auto_1513586 ?auto_1513587 ) ) ( not ( = ?auto_1513586 ?auto_1513588 ) ) ( not ( = ?auto_1513586 ?auto_1513591 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513583 ?auto_1513587 ?auto_1513588 )
      ( MAKE-5CRATE-VERIFY ?auto_1513584 ?auto_1513585 ?auto_1513586 ?auto_1513583 ?auto_1513587 ?auto_1513588 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1513635 - SURFACE
      ?auto_1513636 - SURFACE
      ?auto_1513637 - SURFACE
      ?auto_1513634 - SURFACE
      ?auto_1513638 - SURFACE
      ?auto_1513639 - SURFACE
    )
    :vars
    (
      ?auto_1513641 - HOIST
      ?auto_1513644 - PLACE
      ?auto_1513643 - PLACE
      ?auto_1513640 - HOIST
      ?auto_1513645 - SURFACE
      ?auto_1513642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513641 ?auto_1513644 ) ( IS-CRATE ?auto_1513639 ) ( not ( = ?auto_1513638 ?auto_1513639 ) ) ( not ( = ?auto_1513634 ?auto_1513638 ) ) ( not ( = ?auto_1513634 ?auto_1513639 ) ) ( not ( = ?auto_1513643 ?auto_1513644 ) ) ( HOIST-AT ?auto_1513640 ?auto_1513643 ) ( not ( = ?auto_1513641 ?auto_1513640 ) ) ( AVAILABLE ?auto_1513640 ) ( SURFACE-AT ?auto_1513639 ?auto_1513643 ) ( ON ?auto_1513639 ?auto_1513645 ) ( CLEAR ?auto_1513639 ) ( not ( = ?auto_1513638 ?auto_1513645 ) ) ( not ( = ?auto_1513639 ?auto_1513645 ) ) ( not ( = ?auto_1513634 ?auto_1513645 ) ) ( TRUCK-AT ?auto_1513642 ?auto_1513644 ) ( SURFACE-AT ?auto_1513634 ?auto_1513644 ) ( CLEAR ?auto_1513634 ) ( LIFTING ?auto_1513641 ?auto_1513638 ) ( IS-CRATE ?auto_1513638 ) ( ON ?auto_1513636 ?auto_1513635 ) ( ON ?auto_1513637 ?auto_1513636 ) ( ON ?auto_1513634 ?auto_1513637 ) ( not ( = ?auto_1513635 ?auto_1513636 ) ) ( not ( = ?auto_1513635 ?auto_1513637 ) ) ( not ( = ?auto_1513635 ?auto_1513634 ) ) ( not ( = ?auto_1513635 ?auto_1513638 ) ) ( not ( = ?auto_1513635 ?auto_1513639 ) ) ( not ( = ?auto_1513635 ?auto_1513645 ) ) ( not ( = ?auto_1513636 ?auto_1513637 ) ) ( not ( = ?auto_1513636 ?auto_1513634 ) ) ( not ( = ?auto_1513636 ?auto_1513638 ) ) ( not ( = ?auto_1513636 ?auto_1513639 ) ) ( not ( = ?auto_1513636 ?auto_1513645 ) ) ( not ( = ?auto_1513637 ?auto_1513634 ) ) ( not ( = ?auto_1513637 ?auto_1513638 ) ) ( not ( = ?auto_1513637 ?auto_1513639 ) ) ( not ( = ?auto_1513637 ?auto_1513645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513634 ?auto_1513638 ?auto_1513639 )
      ( MAKE-5CRATE-VERIFY ?auto_1513635 ?auto_1513636 ?auto_1513637 ?auto_1513634 ?auto_1513638 ?auto_1513639 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1513686 - SURFACE
      ?auto_1513687 - SURFACE
      ?auto_1513688 - SURFACE
      ?auto_1513685 - SURFACE
      ?auto_1513689 - SURFACE
      ?auto_1513690 - SURFACE
    )
    :vars
    (
      ?auto_1513692 - HOIST
      ?auto_1513691 - PLACE
      ?auto_1513694 - PLACE
      ?auto_1513695 - HOIST
      ?auto_1513693 - SURFACE
      ?auto_1513696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513692 ?auto_1513691 ) ( IS-CRATE ?auto_1513690 ) ( not ( = ?auto_1513689 ?auto_1513690 ) ) ( not ( = ?auto_1513685 ?auto_1513689 ) ) ( not ( = ?auto_1513685 ?auto_1513690 ) ) ( not ( = ?auto_1513694 ?auto_1513691 ) ) ( HOIST-AT ?auto_1513695 ?auto_1513694 ) ( not ( = ?auto_1513692 ?auto_1513695 ) ) ( AVAILABLE ?auto_1513695 ) ( SURFACE-AT ?auto_1513690 ?auto_1513694 ) ( ON ?auto_1513690 ?auto_1513693 ) ( CLEAR ?auto_1513690 ) ( not ( = ?auto_1513689 ?auto_1513693 ) ) ( not ( = ?auto_1513690 ?auto_1513693 ) ) ( not ( = ?auto_1513685 ?auto_1513693 ) ) ( TRUCK-AT ?auto_1513696 ?auto_1513691 ) ( SURFACE-AT ?auto_1513685 ?auto_1513691 ) ( CLEAR ?auto_1513685 ) ( IS-CRATE ?auto_1513689 ) ( AVAILABLE ?auto_1513692 ) ( IN ?auto_1513689 ?auto_1513696 ) ( ON ?auto_1513687 ?auto_1513686 ) ( ON ?auto_1513688 ?auto_1513687 ) ( ON ?auto_1513685 ?auto_1513688 ) ( not ( = ?auto_1513686 ?auto_1513687 ) ) ( not ( = ?auto_1513686 ?auto_1513688 ) ) ( not ( = ?auto_1513686 ?auto_1513685 ) ) ( not ( = ?auto_1513686 ?auto_1513689 ) ) ( not ( = ?auto_1513686 ?auto_1513690 ) ) ( not ( = ?auto_1513686 ?auto_1513693 ) ) ( not ( = ?auto_1513687 ?auto_1513688 ) ) ( not ( = ?auto_1513687 ?auto_1513685 ) ) ( not ( = ?auto_1513687 ?auto_1513689 ) ) ( not ( = ?auto_1513687 ?auto_1513690 ) ) ( not ( = ?auto_1513687 ?auto_1513693 ) ) ( not ( = ?auto_1513688 ?auto_1513685 ) ) ( not ( = ?auto_1513688 ?auto_1513689 ) ) ( not ( = ?auto_1513688 ?auto_1513690 ) ) ( not ( = ?auto_1513688 ?auto_1513693 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513685 ?auto_1513689 ?auto_1513690 )
      ( MAKE-5CRATE-VERIFY ?auto_1513686 ?auto_1513687 ?auto_1513688 ?auto_1513685 ?auto_1513689 ?auto_1513690 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1514895 - SURFACE
      ?auto_1514896 - SURFACE
      ?auto_1514897 - SURFACE
      ?auto_1514894 - SURFACE
      ?auto_1514898 - SURFACE
      ?auto_1514900 - SURFACE
      ?auto_1514899 - SURFACE
    )
    :vars
    (
      ?auto_1514902 - HOIST
      ?auto_1514901 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514902 ?auto_1514901 ) ( SURFACE-AT ?auto_1514900 ?auto_1514901 ) ( CLEAR ?auto_1514900 ) ( LIFTING ?auto_1514902 ?auto_1514899 ) ( IS-CRATE ?auto_1514899 ) ( not ( = ?auto_1514900 ?auto_1514899 ) ) ( ON ?auto_1514896 ?auto_1514895 ) ( ON ?auto_1514897 ?auto_1514896 ) ( ON ?auto_1514894 ?auto_1514897 ) ( ON ?auto_1514898 ?auto_1514894 ) ( ON ?auto_1514900 ?auto_1514898 ) ( not ( = ?auto_1514895 ?auto_1514896 ) ) ( not ( = ?auto_1514895 ?auto_1514897 ) ) ( not ( = ?auto_1514895 ?auto_1514894 ) ) ( not ( = ?auto_1514895 ?auto_1514898 ) ) ( not ( = ?auto_1514895 ?auto_1514900 ) ) ( not ( = ?auto_1514895 ?auto_1514899 ) ) ( not ( = ?auto_1514896 ?auto_1514897 ) ) ( not ( = ?auto_1514896 ?auto_1514894 ) ) ( not ( = ?auto_1514896 ?auto_1514898 ) ) ( not ( = ?auto_1514896 ?auto_1514900 ) ) ( not ( = ?auto_1514896 ?auto_1514899 ) ) ( not ( = ?auto_1514897 ?auto_1514894 ) ) ( not ( = ?auto_1514897 ?auto_1514898 ) ) ( not ( = ?auto_1514897 ?auto_1514900 ) ) ( not ( = ?auto_1514897 ?auto_1514899 ) ) ( not ( = ?auto_1514894 ?auto_1514898 ) ) ( not ( = ?auto_1514894 ?auto_1514900 ) ) ( not ( = ?auto_1514894 ?auto_1514899 ) ) ( not ( = ?auto_1514898 ?auto_1514900 ) ) ( not ( = ?auto_1514898 ?auto_1514899 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1514900 ?auto_1514899 )
      ( MAKE-6CRATE-VERIFY ?auto_1514895 ?auto_1514896 ?auto_1514897 ?auto_1514894 ?auto_1514898 ?auto_1514900 ?auto_1514899 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1514939 - SURFACE
      ?auto_1514940 - SURFACE
      ?auto_1514941 - SURFACE
      ?auto_1514938 - SURFACE
      ?auto_1514942 - SURFACE
      ?auto_1514944 - SURFACE
      ?auto_1514943 - SURFACE
    )
    :vars
    (
      ?auto_1514945 - HOIST
      ?auto_1514947 - PLACE
      ?auto_1514946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514945 ?auto_1514947 ) ( SURFACE-AT ?auto_1514944 ?auto_1514947 ) ( CLEAR ?auto_1514944 ) ( IS-CRATE ?auto_1514943 ) ( not ( = ?auto_1514944 ?auto_1514943 ) ) ( TRUCK-AT ?auto_1514946 ?auto_1514947 ) ( AVAILABLE ?auto_1514945 ) ( IN ?auto_1514943 ?auto_1514946 ) ( ON ?auto_1514944 ?auto_1514942 ) ( not ( = ?auto_1514942 ?auto_1514944 ) ) ( not ( = ?auto_1514942 ?auto_1514943 ) ) ( ON ?auto_1514940 ?auto_1514939 ) ( ON ?auto_1514941 ?auto_1514940 ) ( ON ?auto_1514938 ?auto_1514941 ) ( ON ?auto_1514942 ?auto_1514938 ) ( not ( = ?auto_1514939 ?auto_1514940 ) ) ( not ( = ?auto_1514939 ?auto_1514941 ) ) ( not ( = ?auto_1514939 ?auto_1514938 ) ) ( not ( = ?auto_1514939 ?auto_1514942 ) ) ( not ( = ?auto_1514939 ?auto_1514944 ) ) ( not ( = ?auto_1514939 ?auto_1514943 ) ) ( not ( = ?auto_1514940 ?auto_1514941 ) ) ( not ( = ?auto_1514940 ?auto_1514938 ) ) ( not ( = ?auto_1514940 ?auto_1514942 ) ) ( not ( = ?auto_1514940 ?auto_1514944 ) ) ( not ( = ?auto_1514940 ?auto_1514943 ) ) ( not ( = ?auto_1514941 ?auto_1514938 ) ) ( not ( = ?auto_1514941 ?auto_1514942 ) ) ( not ( = ?auto_1514941 ?auto_1514944 ) ) ( not ( = ?auto_1514941 ?auto_1514943 ) ) ( not ( = ?auto_1514938 ?auto_1514942 ) ) ( not ( = ?auto_1514938 ?auto_1514944 ) ) ( not ( = ?auto_1514938 ?auto_1514943 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514942 ?auto_1514944 ?auto_1514943 )
      ( MAKE-6CRATE-VERIFY ?auto_1514939 ?auto_1514940 ?auto_1514941 ?auto_1514938 ?auto_1514942 ?auto_1514944 ?auto_1514943 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1514990 - SURFACE
      ?auto_1514991 - SURFACE
      ?auto_1514992 - SURFACE
      ?auto_1514989 - SURFACE
      ?auto_1514993 - SURFACE
      ?auto_1514995 - SURFACE
      ?auto_1514994 - SURFACE
    )
    :vars
    (
      ?auto_1514996 - HOIST
      ?auto_1514997 - PLACE
      ?auto_1514998 - TRUCK
      ?auto_1514999 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514996 ?auto_1514997 ) ( SURFACE-AT ?auto_1514995 ?auto_1514997 ) ( CLEAR ?auto_1514995 ) ( IS-CRATE ?auto_1514994 ) ( not ( = ?auto_1514995 ?auto_1514994 ) ) ( AVAILABLE ?auto_1514996 ) ( IN ?auto_1514994 ?auto_1514998 ) ( ON ?auto_1514995 ?auto_1514993 ) ( not ( = ?auto_1514993 ?auto_1514995 ) ) ( not ( = ?auto_1514993 ?auto_1514994 ) ) ( TRUCK-AT ?auto_1514998 ?auto_1514999 ) ( not ( = ?auto_1514999 ?auto_1514997 ) ) ( ON ?auto_1514991 ?auto_1514990 ) ( ON ?auto_1514992 ?auto_1514991 ) ( ON ?auto_1514989 ?auto_1514992 ) ( ON ?auto_1514993 ?auto_1514989 ) ( not ( = ?auto_1514990 ?auto_1514991 ) ) ( not ( = ?auto_1514990 ?auto_1514992 ) ) ( not ( = ?auto_1514990 ?auto_1514989 ) ) ( not ( = ?auto_1514990 ?auto_1514993 ) ) ( not ( = ?auto_1514990 ?auto_1514995 ) ) ( not ( = ?auto_1514990 ?auto_1514994 ) ) ( not ( = ?auto_1514991 ?auto_1514992 ) ) ( not ( = ?auto_1514991 ?auto_1514989 ) ) ( not ( = ?auto_1514991 ?auto_1514993 ) ) ( not ( = ?auto_1514991 ?auto_1514995 ) ) ( not ( = ?auto_1514991 ?auto_1514994 ) ) ( not ( = ?auto_1514992 ?auto_1514989 ) ) ( not ( = ?auto_1514992 ?auto_1514993 ) ) ( not ( = ?auto_1514992 ?auto_1514995 ) ) ( not ( = ?auto_1514992 ?auto_1514994 ) ) ( not ( = ?auto_1514989 ?auto_1514993 ) ) ( not ( = ?auto_1514989 ?auto_1514995 ) ) ( not ( = ?auto_1514989 ?auto_1514994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514993 ?auto_1514995 ?auto_1514994 )
      ( MAKE-6CRATE-VERIFY ?auto_1514990 ?auto_1514991 ?auto_1514992 ?auto_1514989 ?auto_1514993 ?auto_1514995 ?auto_1514994 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1515047 - SURFACE
      ?auto_1515048 - SURFACE
      ?auto_1515049 - SURFACE
      ?auto_1515046 - SURFACE
      ?auto_1515050 - SURFACE
      ?auto_1515052 - SURFACE
      ?auto_1515051 - SURFACE
    )
    :vars
    (
      ?auto_1515056 - HOIST
      ?auto_1515057 - PLACE
      ?auto_1515053 - TRUCK
      ?auto_1515055 - PLACE
      ?auto_1515054 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1515056 ?auto_1515057 ) ( SURFACE-AT ?auto_1515052 ?auto_1515057 ) ( CLEAR ?auto_1515052 ) ( IS-CRATE ?auto_1515051 ) ( not ( = ?auto_1515052 ?auto_1515051 ) ) ( AVAILABLE ?auto_1515056 ) ( ON ?auto_1515052 ?auto_1515050 ) ( not ( = ?auto_1515050 ?auto_1515052 ) ) ( not ( = ?auto_1515050 ?auto_1515051 ) ) ( TRUCK-AT ?auto_1515053 ?auto_1515055 ) ( not ( = ?auto_1515055 ?auto_1515057 ) ) ( HOIST-AT ?auto_1515054 ?auto_1515055 ) ( LIFTING ?auto_1515054 ?auto_1515051 ) ( not ( = ?auto_1515056 ?auto_1515054 ) ) ( ON ?auto_1515048 ?auto_1515047 ) ( ON ?auto_1515049 ?auto_1515048 ) ( ON ?auto_1515046 ?auto_1515049 ) ( ON ?auto_1515050 ?auto_1515046 ) ( not ( = ?auto_1515047 ?auto_1515048 ) ) ( not ( = ?auto_1515047 ?auto_1515049 ) ) ( not ( = ?auto_1515047 ?auto_1515046 ) ) ( not ( = ?auto_1515047 ?auto_1515050 ) ) ( not ( = ?auto_1515047 ?auto_1515052 ) ) ( not ( = ?auto_1515047 ?auto_1515051 ) ) ( not ( = ?auto_1515048 ?auto_1515049 ) ) ( not ( = ?auto_1515048 ?auto_1515046 ) ) ( not ( = ?auto_1515048 ?auto_1515050 ) ) ( not ( = ?auto_1515048 ?auto_1515052 ) ) ( not ( = ?auto_1515048 ?auto_1515051 ) ) ( not ( = ?auto_1515049 ?auto_1515046 ) ) ( not ( = ?auto_1515049 ?auto_1515050 ) ) ( not ( = ?auto_1515049 ?auto_1515052 ) ) ( not ( = ?auto_1515049 ?auto_1515051 ) ) ( not ( = ?auto_1515046 ?auto_1515050 ) ) ( not ( = ?auto_1515046 ?auto_1515052 ) ) ( not ( = ?auto_1515046 ?auto_1515051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1515050 ?auto_1515052 ?auto_1515051 )
      ( MAKE-6CRATE-VERIFY ?auto_1515047 ?auto_1515048 ?auto_1515049 ?auto_1515046 ?auto_1515050 ?auto_1515052 ?auto_1515051 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1515110 - SURFACE
      ?auto_1515111 - SURFACE
      ?auto_1515112 - SURFACE
      ?auto_1515109 - SURFACE
      ?auto_1515113 - SURFACE
      ?auto_1515115 - SURFACE
      ?auto_1515114 - SURFACE
    )
    :vars
    (
      ?auto_1515120 - HOIST
      ?auto_1515121 - PLACE
      ?auto_1515119 - TRUCK
      ?auto_1515117 - PLACE
      ?auto_1515118 - HOIST
      ?auto_1515116 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1515120 ?auto_1515121 ) ( SURFACE-AT ?auto_1515115 ?auto_1515121 ) ( CLEAR ?auto_1515115 ) ( IS-CRATE ?auto_1515114 ) ( not ( = ?auto_1515115 ?auto_1515114 ) ) ( AVAILABLE ?auto_1515120 ) ( ON ?auto_1515115 ?auto_1515113 ) ( not ( = ?auto_1515113 ?auto_1515115 ) ) ( not ( = ?auto_1515113 ?auto_1515114 ) ) ( TRUCK-AT ?auto_1515119 ?auto_1515117 ) ( not ( = ?auto_1515117 ?auto_1515121 ) ) ( HOIST-AT ?auto_1515118 ?auto_1515117 ) ( not ( = ?auto_1515120 ?auto_1515118 ) ) ( AVAILABLE ?auto_1515118 ) ( SURFACE-AT ?auto_1515114 ?auto_1515117 ) ( ON ?auto_1515114 ?auto_1515116 ) ( CLEAR ?auto_1515114 ) ( not ( = ?auto_1515115 ?auto_1515116 ) ) ( not ( = ?auto_1515114 ?auto_1515116 ) ) ( not ( = ?auto_1515113 ?auto_1515116 ) ) ( ON ?auto_1515111 ?auto_1515110 ) ( ON ?auto_1515112 ?auto_1515111 ) ( ON ?auto_1515109 ?auto_1515112 ) ( ON ?auto_1515113 ?auto_1515109 ) ( not ( = ?auto_1515110 ?auto_1515111 ) ) ( not ( = ?auto_1515110 ?auto_1515112 ) ) ( not ( = ?auto_1515110 ?auto_1515109 ) ) ( not ( = ?auto_1515110 ?auto_1515113 ) ) ( not ( = ?auto_1515110 ?auto_1515115 ) ) ( not ( = ?auto_1515110 ?auto_1515114 ) ) ( not ( = ?auto_1515110 ?auto_1515116 ) ) ( not ( = ?auto_1515111 ?auto_1515112 ) ) ( not ( = ?auto_1515111 ?auto_1515109 ) ) ( not ( = ?auto_1515111 ?auto_1515113 ) ) ( not ( = ?auto_1515111 ?auto_1515115 ) ) ( not ( = ?auto_1515111 ?auto_1515114 ) ) ( not ( = ?auto_1515111 ?auto_1515116 ) ) ( not ( = ?auto_1515112 ?auto_1515109 ) ) ( not ( = ?auto_1515112 ?auto_1515113 ) ) ( not ( = ?auto_1515112 ?auto_1515115 ) ) ( not ( = ?auto_1515112 ?auto_1515114 ) ) ( not ( = ?auto_1515112 ?auto_1515116 ) ) ( not ( = ?auto_1515109 ?auto_1515113 ) ) ( not ( = ?auto_1515109 ?auto_1515115 ) ) ( not ( = ?auto_1515109 ?auto_1515114 ) ) ( not ( = ?auto_1515109 ?auto_1515116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1515113 ?auto_1515115 ?auto_1515114 )
      ( MAKE-6CRATE-VERIFY ?auto_1515110 ?auto_1515111 ?auto_1515112 ?auto_1515109 ?auto_1515113 ?auto_1515115 ?auto_1515114 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1515174 - SURFACE
      ?auto_1515175 - SURFACE
      ?auto_1515176 - SURFACE
      ?auto_1515173 - SURFACE
      ?auto_1515177 - SURFACE
      ?auto_1515179 - SURFACE
      ?auto_1515178 - SURFACE
    )
    :vars
    (
      ?auto_1515182 - HOIST
      ?auto_1515185 - PLACE
      ?auto_1515180 - PLACE
      ?auto_1515184 - HOIST
      ?auto_1515181 - SURFACE
      ?auto_1515183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1515182 ?auto_1515185 ) ( SURFACE-AT ?auto_1515179 ?auto_1515185 ) ( CLEAR ?auto_1515179 ) ( IS-CRATE ?auto_1515178 ) ( not ( = ?auto_1515179 ?auto_1515178 ) ) ( AVAILABLE ?auto_1515182 ) ( ON ?auto_1515179 ?auto_1515177 ) ( not ( = ?auto_1515177 ?auto_1515179 ) ) ( not ( = ?auto_1515177 ?auto_1515178 ) ) ( not ( = ?auto_1515180 ?auto_1515185 ) ) ( HOIST-AT ?auto_1515184 ?auto_1515180 ) ( not ( = ?auto_1515182 ?auto_1515184 ) ) ( AVAILABLE ?auto_1515184 ) ( SURFACE-AT ?auto_1515178 ?auto_1515180 ) ( ON ?auto_1515178 ?auto_1515181 ) ( CLEAR ?auto_1515178 ) ( not ( = ?auto_1515179 ?auto_1515181 ) ) ( not ( = ?auto_1515178 ?auto_1515181 ) ) ( not ( = ?auto_1515177 ?auto_1515181 ) ) ( TRUCK-AT ?auto_1515183 ?auto_1515185 ) ( ON ?auto_1515175 ?auto_1515174 ) ( ON ?auto_1515176 ?auto_1515175 ) ( ON ?auto_1515173 ?auto_1515176 ) ( ON ?auto_1515177 ?auto_1515173 ) ( not ( = ?auto_1515174 ?auto_1515175 ) ) ( not ( = ?auto_1515174 ?auto_1515176 ) ) ( not ( = ?auto_1515174 ?auto_1515173 ) ) ( not ( = ?auto_1515174 ?auto_1515177 ) ) ( not ( = ?auto_1515174 ?auto_1515179 ) ) ( not ( = ?auto_1515174 ?auto_1515178 ) ) ( not ( = ?auto_1515174 ?auto_1515181 ) ) ( not ( = ?auto_1515175 ?auto_1515176 ) ) ( not ( = ?auto_1515175 ?auto_1515173 ) ) ( not ( = ?auto_1515175 ?auto_1515177 ) ) ( not ( = ?auto_1515175 ?auto_1515179 ) ) ( not ( = ?auto_1515175 ?auto_1515178 ) ) ( not ( = ?auto_1515175 ?auto_1515181 ) ) ( not ( = ?auto_1515176 ?auto_1515173 ) ) ( not ( = ?auto_1515176 ?auto_1515177 ) ) ( not ( = ?auto_1515176 ?auto_1515179 ) ) ( not ( = ?auto_1515176 ?auto_1515178 ) ) ( not ( = ?auto_1515176 ?auto_1515181 ) ) ( not ( = ?auto_1515173 ?auto_1515177 ) ) ( not ( = ?auto_1515173 ?auto_1515179 ) ) ( not ( = ?auto_1515173 ?auto_1515178 ) ) ( not ( = ?auto_1515173 ?auto_1515181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1515177 ?auto_1515179 ?auto_1515178 )
      ( MAKE-6CRATE-VERIFY ?auto_1515174 ?auto_1515175 ?auto_1515176 ?auto_1515173 ?auto_1515177 ?auto_1515179 ?auto_1515178 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1515238 - SURFACE
      ?auto_1515239 - SURFACE
      ?auto_1515240 - SURFACE
      ?auto_1515237 - SURFACE
      ?auto_1515241 - SURFACE
      ?auto_1515243 - SURFACE
      ?auto_1515242 - SURFACE
    )
    :vars
    (
      ?auto_1515247 - HOIST
      ?auto_1515246 - PLACE
      ?auto_1515248 - PLACE
      ?auto_1515245 - HOIST
      ?auto_1515244 - SURFACE
      ?auto_1515249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1515247 ?auto_1515246 ) ( IS-CRATE ?auto_1515242 ) ( not ( = ?auto_1515243 ?auto_1515242 ) ) ( not ( = ?auto_1515241 ?auto_1515243 ) ) ( not ( = ?auto_1515241 ?auto_1515242 ) ) ( not ( = ?auto_1515248 ?auto_1515246 ) ) ( HOIST-AT ?auto_1515245 ?auto_1515248 ) ( not ( = ?auto_1515247 ?auto_1515245 ) ) ( AVAILABLE ?auto_1515245 ) ( SURFACE-AT ?auto_1515242 ?auto_1515248 ) ( ON ?auto_1515242 ?auto_1515244 ) ( CLEAR ?auto_1515242 ) ( not ( = ?auto_1515243 ?auto_1515244 ) ) ( not ( = ?auto_1515242 ?auto_1515244 ) ) ( not ( = ?auto_1515241 ?auto_1515244 ) ) ( TRUCK-AT ?auto_1515249 ?auto_1515246 ) ( SURFACE-AT ?auto_1515241 ?auto_1515246 ) ( CLEAR ?auto_1515241 ) ( LIFTING ?auto_1515247 ?auto_1515243 ) ( IS-CRATE ?auto_1515243 ) ( ON ?auto_1515239 ?auto_1515238 ) ( ON ?auto_1515240 ?auto_1515239 ) ( ON ?auto_1515237 ?auto_1515240 ) ( ON ?auto_1515241 ?auto_1515237 ) ( not ( = ?auto_1515238 ?auto_1515239 ) ) ( not ( = ?auto_1515238 ?auto_1515240 ) ) ( not ( = ?auto_1515238 ?auto_1515237 ) ) ( not ( = ?auto_1515238 ?auto_1515241 ) ) ( not ( = ?auto_1515238 ?auto_1515243 ) ) ( not ( = ?auto_1515238 ?auto_1515242 ) ) ( not ( = ?auto_1515238 ?auto_1515244 ) ) ( not ( = ?auto_1515239 ?auto_1515240 ) ) ( not ( = ?auto_1515239 ?auto_1515237 ) ) ( not ( = ?auto_1515239 ?auto_1515241 ) ) ( not ( = ?auto_1515239 ?auto_1515243 ) ) ( not ( = ?auto_1515239 ?auto_1515242 ) ) ( not ( = ?auto_1515239 ?auto_1515244 ) ) ( not ( = ?auto_1515240 ?auto_1515237 ) ) ( not ( = ?auto_1515240 ?auto_1515241 ) ) ( not ( = ?auto_1515240 ?auto_1515243 ) ) ( not ( = ?auto_1515240 ?auto_1515242 ) ) ( not ( = ?auto_1515240 ?auto_1515244 ) ) ( not ( = ?auto_1515237 ?auto_1515241 ) ) ( not ( = ?auto_1515237 ?auto_1515243 ) ) ( not ( = ?auto_1515237 ?auto_1515242 ) ) ( not ( = ?auto_1515237 ?auto_1515244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1515241 ?auto_1515243 ?auto_1515242 )
      ( MAKE-6CRATE-VERIFY ?auto_1515238 ?auto_1515239 ?auto_1515240 ?auto_1515237 ?auto_1515241 ?auto_1515243 ?auto_1515242 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1515302 - SURFACE
      ?auto_1515303 - SURFACE
      ?auto_1515304 - SURFACE
      ?auto_1515301 - SURFACE
      ?auto_1515305 - SURFACE
      ?auto_1515307 - SURFACE
      ?auto_1515306 - SURFACE
    )
    :vars
    (
      ?auto_1515310 - HOIST
      ?auto_1515309 - PLACE
      ?auto_1515308 - PLACE
      ?auto_1515312 - HOIST
      ?auto_1515313 - SURFACE
      ?auto_1515311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1515310 ?auto_1515309 ) ( IS-CRATE ?auto_1515306 ) ( not ( = ?auto_1515307 ?auto_1515306 ) ) ( not ( = ?auto_1515305 ?auto_1515307 ) ) ( not ( = ?auto_1515305 ?auto_1515306 ) ) ( not ( = ?auto_1515308 ?auto_1515309 ) ) ( HOIST-AT ?auto_1515312 ?auto_1515308 ) ( not ( = ?auto_1515310 ?auto_1515312 ) ) ( AVAILABLE ?auto_1515312 ) ( SURFACE-AT ?auto_1515306 ?auto_1515308 ) ( ON ?auto_1515306 ?auto_1515313 ) ( CLEAR ?auto_1515306 ) ( not ( = ?auto_1515307 ?auto_1515313 ) ) ( not ( = ?auto_1515306 ?auto_1515313 ) ) ( not ( = ?auto_1515305 ?auto_1515313 ) ) ( TRUCK-AT ?auto_1515311 ?auto_1515309 ) ( SURFACE-AT ?auto_1515305 ?auto_1515309 ) ( CLEAR ?auto_1515305 ) ( IS-CRATE ?auto_1515307 ) ( AVAILABLE ?auto_1515310 ) ( IN ?auto_1515307 ?auto_1515311 ) ( ON ?auto_1515303 ?auto_1515302 ) ( ON ?auto_1515304 ?auto_1515303 ) ( ON ?auto_1515301 ?auto_1515304 ) ( ON ?auto_1515305 ?auto_1515301 ) ( not ( = ?auto_1515302 ?auto_1515303 ) ) ( not ( = ?auto_1515302 ?auto_1515304 ) ) ( not ( = ?auto_1515302 ?auto_1515301 ) ) ( not ( = ?auto_1515302 ?auto_1515305 ) ) ( not ( = ?auto_1515302 ?auto_1515307 ) ) ( not ( = ?auto_1515302 ?auto_1515306 ) ) ( not ( = ?auto_1515302 ?auto_1515313 ) ) ( not ( = ?auto_1515303 ?auto_1515304 ) ) ( not ( = ?auto_1515303 ?auto_1515301 ) ) ( not ( = ?auto_1515303 ?auto_1515305 ) ) ( not ( = ?auto_1515303 ?auto_1515307 ) ) ( not ( = ?auto_1515303 ?auto_1515306 ) ) ( not ( = ?auto_1515303 ?auto_1515313 ) ) ( not ( = ?auto_1515304 ?auto_1515301 ) ) ( not ( = ?auto_1515304 ?auto_1515305 ) ) ( not ( = ?auto_1515304 ?auto_1515307 ) ) ( not ( = ?auto_1515304 ?auto_1515306 ) ) ( not ( = ?auto_1515304 ?auto_1515313 ) ) ( not ( = ?auto_1515301 ?auto_1515305 ) ) ( not ( = ?auto_1515301 ?auto_1515307 ) ) ( not ( = ?auto_1515301 ?auto_1515306 ) ) ( not ( = ?auto_1515301 ?auto_1515313 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1515305 ?auto_1515307 ?auto_1515306 )
      ( MAKE-6CRATE-VERIFY ?auto_1515302 ?auto_1515303 ?auto_1515304 ?auto_1515301 ?auto_1515305 ?auto_1515307 ?auto_1515306 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1517258 - SURFACE
      ?auto_1517259 - SURFACE
      ?auto_1517260 - SURFACE
      ?auto_1517257 - SURFACE
      ?auto_1517261 - SURFACE
      ?auto_1517263 - SURFACE
      ?auto_1517262 - SURFACE
      ?auto_1517264 - SURFACE
    )
    :vars
    (
      ?auto_1517266 - HOIST
      ?auto_1517265 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1517266 ?auto_1517265 ) ( SURFACE-AT ?auto_1517262 ?auto_1517265 ) ( CLEAR ?auto_1517262 ) ( LIFTING ?auto_1517266 ?auto_1517264 ) ( IS-CRATE ?auto_1517264 ) ( not ( = ?auto_1517262 ?auto_1517264 ) ) ( ON ?auto_1517259 ?auto_1517258 ) ( ON ?auto_1517260 ?auto_1517259 ) ( ON ?auto_1517257 ?auto_1517260 ) ( ON ?auto_1517261 ?auto_1517257 ) ( ON ?auto_1517263 ?auto_1517261 ) ( ON ?auto_1517262 ?auto_1517263 ) ( not ( = ?auto_1517258 ?auto_1517259 ) ) ( not ( = ?auto_1517258 ?auto_1517260 ) ) ( not ( = ?auto_1517258 ?auto_1517257 ) ) ( not ( = ?auto_1517258 ?auto_1517261 ) ) ( not ( = ?auto_1517258 ?auto_1517263 ) ) ( not ( = ?auto_1517258 ?auto_1517262 ) ) ( not ( = ?auto_1517258 ?auto_1517264 ) ) ( not ( = ?auto_1517259 ?auto_1517260 ) ) ( not ( = ?auto_1517259 ?auto_1517257 ) ) ( not ( = ?auto_1517259 ?auto_1517261 ) ) ( not ( = ?auto_1517259 ?auto_1517263 ) ) ( not ( = ?auto_1517259 ?auto_1517262 ) ) ( not ( = ?auto_1517259 ?auto_1517264 ) ) ( not ( = ?auto_1517260 ?auto_1517257 ) ) ( not ( = ?auto_1517260 ?auto_1517261 ) ) ( not ( = ?auto_1517260 ?auto_1517263 ) ) ( not ( = ?auto_1517260 ?auto_1517262 ) ) ( not ( = ?auto_1517260 ?auto_1517264 ) ) ( not ( = ?auto_1517257 ?auto_1517261 ) ) ( not ( = ?auto_1517257 ?auto_1517263 ) ) ( not ( = ?auto_1517257 ?auto_1517262 ) ) ( not ( = ?auto_1517257 ?auto_1517264 ) ) ( not ( = ?auto_1517261 ?auto_1517263 ) ) ( not ( = ?auto_1517261 ?auto_1517262 ) ) ( not ( = ?auto_1517261 ?auto_1517264 ) ) ( not ( = ?auto_1517263 ?auto_1517262 ) ) ( not ( = ?auto_1517263 ?auto_1517264 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1517262 ?auto_1517264 )
      ( MAKE-7CRATE-VERIFY ?auto_1517258 ?auto_1517259 ?auto_1517260 ?auto_1517257 ?auto_1517261 ?auto_1517263 ?auto_1517262 ?auto_1517264 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1517313 - SURFACE
      ?auto_1517314 - SURFACE
      ?auto_1517315 - SURFACE
      ?auto_1517312 - SURFACE
      ?auto_1517316 - SURFACE
      ?auto_1517318 - SURFACE
      ?auto_1517317 - SURFACE
      ?auto_1517319 - SURFACE
    )
    :vars
    (
      ?auto_1517322 - HOIST
      ?auto_1517320 - PLACE
      ?auto_1517321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1517322 ?auto_1517320 ) ( SURFACE-AT ?auto_1517317 ?auto_1517320 ) ( CLEAR ?auto_1517317 ) ( IS-CRATE ?auto_1517319 ) ( not ( = ?auto_1517317 ?auto_1517319 ) ) ( TRUCK-AT ?auto_1517321 ?auto_1517320 ) ( AVAILABLE ?auto_1517322 ) ( IN ?auto_1517319 ?auto_1517321 ) ( ON ?auto_1517317 ?auto_1517318 ) ( not ( = ?auto_1517318 ?auto_1517317 ) ) ( not ( = ?auto_1517318 ?auto_1517319 ) ) ( ON ?auto_1517314 ?auto_1517313 ) ( ON ?auto_1517315 ?auto_1517314 ) ( ON ?auto_1517312 ?auto_1517315 ) ( ON ?auto_1517316 ?auto_1517312 ) ( ON ?auto_1517318 ?auto_1517316 ) ( not ( = ?auto_1517313 ?auto_1517314 ) ) ( not ( = ?auto_1517313 ?auto_1517315 ) ) ( not ( = ?auto_1517313 ?auto_1517312 ) ) ( not ( = ?auto_1517313 ?auto_1517316 ) ) ( not ( = ?auto_1517313 ?auto_1517318 ) ) ( not ( = ?auto_1517313 ?auto_1517317 ) ) ( not ( = ?auto_1517313 ?auto_1517319 ) ) ( not ( = ?auto_1517314 ?auto_1517315 ) ) ( not ( = ?auto_1517314 ?auto_1517312 ) ) ( not ( = ?auto_1517314 ?auto_1517316 ) ) ( not ( = ?auto_1517314 ?auto_1517318 ) ) ( not ( = ?auto_1517314 ?auto_1517317 ) ) ( not ( = ?auto_1517314 ?auto_1517319 ) ) ( not ( = ?auto_1517315 ?auto_1517312 ) ) ( not ( = ?auto_1517315 ?auto_1517316 ) ) ( not ( = ?auto_1517315 ?auto_1517318 ) ) ( not ( = ?auto_1517315 ?auto_1517317 ) ) ( not ( = ?auto_1517315 ?auto_1517319 ) ) ( not ( = ?auto_1517312 ?auto_1517316 ) ) ( not ( = ?auto_1517312 ?auto_1517318 ) ) ( not ( = ?auto_1517312 ?auto_1517317 ) ) ( not ( = ?auto_1517312 ?auto_1517319 ) ) ( not ( = ?auto_1517316 ?auto_1517318 ) ) ( not ( = ?auto_1517316 ?auto_1517317 ) ) ( not ( = ?auto_1517316 ?auto_1517319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1517318 ?auto_1517317 ?auto_1517319 )
      ( MAKE-7CRATE-VERIFY ?auto_1517313 ?auto_1517314 ?auto_1517315 ?auto_1517312 ?auto_1517316 ?auto_1517318 ?auto_1517317 ?auto_1517319 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1517376 - SURFACE
      ?auto_1517377 - SURFACE
      ?auto_1517378 - SURFACE
      ?auto_1517375 - SURFACE
      ?auto_1517379 - SURFACE
      ?auto_1517381 - SURFACE
      ?auto_1517380 - SURFACE
      ?auto_1517382 - SURFACE
    )
    :vars
    (
      ?auto_1517386 - HOIST
      ?auto_1517385 - PLACE
      ?auto_1517384 - TRUCK
      ?auto_1517383 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1517386 ?auto_1517385 ) ( SURFACE-AT ?auto_1517380 ?auto_1517385 ) ( CLEAR ?auto_1517380 ) ( IS-CRATE ?auto_1517382 ) ( not ( = ?auto_1517380 ?auto_1517382 ) ) ( AVAILABLE ?auto_1517386 ) ( IN ?auto_1517382 ?auto_1517384 ) ( ON ?auto_1517380 ?auto_1517381 ) ( not ( = ?auto_1517381 ?auto_1517380 ) ) ( not ( = ?auto_1517381 ?auto_1517382 ) ) ( TRUCK-AT ?auto_1517384 ?auto_1517383 ) ( not ( = ?auto_1517383 ?auto_1517385 ) ) ( ON ?auto_1517377 ?auto_1517376 ) ( ON ?auto_1517378 ?auto_1517377 ) ( ON ?auto_1517375 ?auto_1517378 ) ( ON ?auto_1517379 ?auto_1517375 ) ( ON ?auto_1517381 ?auto_1517379 ) ( not ( = ?auto_1517376 ?auto_1517377 ) ) ( not ( = ?auto_1517376 ?auto_1517378 ) ) ( not ( = ?auto_1517376 ?auto_1517375 ) ) ( not ( = ?auto_1517376 ?auto_1517379 ) ) ( not ( = ?auto_1517376 ?auto_1517381 ) ) ( not ( = ?auto_1517376 ?auto_1517380 ) ) ( not ( = ?auto_1517376 ?auto_1517382 ) ) ( not ( = ?auto_1517377 ?auto_1517378 ) ) ( not ( = ?auto_1517377 ?auto_1517375 ) ) ( not ( = ?auto_1517377 ?auto_1517379 ) ) ( not ( = ?auto_1517377 ?auto_1517381 ) ) ( not ( = ?auto_1517377 ?auto_1517380 ) ) ( not ( = ?auto_1517377 ?auto_1517382 ) ) ( not ( = ?auto_1517378 ?auto_1517375 ) ) ( not ( = ?auto_1517378 ?auto_1517379 ) ) ( not ( = ?auto_1517378 ?auto_1517381 ) ) ( not ( = ?auto_1517378 ?auto_1517380 ) ) ( not ( = ?auto_1517378 ?auto_1517382 ) ) ( not ( = ?auto_1517375 ?auto_1517379 ) ) ( not ( = ?auto_1517375 ?auto_1517381 ) ) ( not ( = ?auto_1517375 ?auto_1517380 ) ) ( not ( = ?auto_1517375 ?auto_1517382 ) ) ( not ( = ?auto_1517379 ?auto_1517381 ) ) ( not ( = ?auto_1517379 ?auto_1517380 ) ) ( not ( = ?auto_1517379 ?auto_1517382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1517381 ?auto_1517380 ?auto_1517382 )
      ( MAKE-7CRATE-VERIFY ?auto_1517376 ?auto_1517377 ?auto_1517378 ?auto_1517375 ?auto_1517379 ?auto_1517381 ?auto_1517380 ?auto_1517382 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1517446 - SURFACE
      ?auto_1517447 - SURFACE
      ?auto_1517448 - SURFACE
      ?auto_1517445 - SURFACE
      ?auto_1517449 - SURFACE
      ?auto_1517451 - SURFACE
      ?auto_1517450 - SURFACE
      ?auto_1517452 - SURFACE
    )
    :vars
    (
      ?auto_1517454 - HOIST
      ?auto_1517455 - PLACE
      ?auto_1517457 - TRUCK
      ?auto_1517453 - PLACE
      ?auto_1517456 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1517454 ?auto_1517455 ) ( SURFACE-AT ?auto_1517450 ?auto_1517455 ) ( CLEAR ?auto_1517450 ) ( IS-CRATE ?auto_1517452 ) ( not ( = ?auto_1517450 ?auto_1517452 ) ) ( AVAILABLE ?auto_1517454 ) ( ON ?auto_1517450 ?auto_1517451 ) ( not ( = ?auto_1517451 ?auto_1517450 ) ) ( not ( = ?auto_1517451 ?auto_1517452 ) ) ( TRUCK-AT ?auto_1517457 ?auto_1517453 ) ( not ( = ?auto_1517453 ?auto_1517455 ) ) ( HOIST-AT ?auto_1517456 ?auto_1517453 ) ( LIFTING ?auto_1517456 ?auto_1517452 ) ( not ( = ?auto_1517454 ?auto_1517456 ) ) ( ON ?auto_1517447 ?auto_1517446 ) ( ON ?auto_1517448 ?auto_1517447 ) ( ON ?auto_1517445 ?auto_1517448 ) ( ON ?auto_1517449 ?auto_1517445 ) ( ON ?auto_1517451 ?auto_1517449 ) ( not ( = ?auto_1517446 ?auto_1517447 ) ) ( not ( = ?auto_1517446 ?auto_1517448 ) ) ( not ( = ?auto_1517446 ?auto_1517445 ) ) ( not ( = ?auto_1517446 ?auto_1517449 ) ) ( not ( = ?auto_1517446 ?auto_1517451 ) ) ( not ( = ?auto_1517446 ?auto_1517450 ) ) ( not ( = ?auto_1517446 ?auto_1517452 ) ) ( not ( = ?auto_1517447 ?auto_1517448 ) ) ( not ( = ?auto_1517447 ?auto_1517445 ) ) ( not ( = ?auto_1517447 ?auto_1517449 ) ) ( not ( = ?auto_1517447 ?auto_1517451 ) ) ( not ( = ?auto_1517447 ?auto_1517450 ) ) ( not ( = ?auto_1517447 ?auto_1517452 ) ) ( not ( = ?auto_1517448 ?auto_1517445 ) ) ( not ( = ?auto_1517448 ?auto_1517449 ) ) ( not ( = ?auto_1517448 ?auto_1517451 ) ) ( not ( = ?auto_1517448 ?auto_1517450 ) ) ( not ( = ?auto_1517448 ?auto_1517452 ) ) ( not ( = ?auto_1517445 ?auto_1517449 ) ) ( not ( = ?auto_1517445 ?auto_1517451 ) ) ( not ( = ?auto_1517445 ?auto_1517450 ) ) ( not ( = ?auto_1517445 ?auto_1517452 ) ) ( not ( = ?auto_1517449 ?auto_1517451 ) ) ( not ( = ?auto_1517449 ?auto_1517450 ) ) ( not ( = ?auto_1517449 ?auto_1517452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1517451 ?auto_1517450 ?auto_1517452 )
      ( MAKE-7CRATE-VERIFY ?auto_1517446 ?auto_1517447 ?auto_1517448 ?auto_1517445 ?auto_1517449 ?auto_1517451 ?auto_1517450 ?auto_1517452 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1517523 - SURFACE
      ?auto_1517524 - SURFACE
      ?auto_1517525 - SURFACE
      ?auto_1517522 - SURFACE
      ?auto_1517526 - SURFACE
      ?auto_1517528 - SURFACE
      ?auto_1517527 - SURFACE
      ?auto_1517529 - SURFACE
    )
    :vars
    (
      ?auto_1517535 - HOIST
      ?auto_1517531 - PLACE
      ?auto_1517534 - TRUCK
      ?auto_1517533 - PLACE
      ?auto_1517530 - HOIST
      ?auto_1517532 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1517535 ?auto_1517531 ) ( SURFACE-AT ?auto_1517527 ?auto_1517531 ) ( CLEAR ?auto_1517527 ) ( IS-CRATE ?auto_1517529 ) ( not ( = ?auto_1517527 ?auto_1517529 ) ) ( AVAILABLE ?auto_1517535 ) ( ON ?auto_1517527 ?auto_1517528 ) ( not ( = ?auto_1517528 ?auto_1517527 ) ) ( not ( = ?auto_1517528 ?auto_1517529 ) ) ( TRUCK-AT ?auto_1517534 ?auto_1517533 ) ( not ( = ?auto_1517533 ?auto_1517531 ) ) ( HOIST-AT ?auto_1517530 ?auto_1517533 ) ( not ( = ?auto_1517535 ?auto_1517530 ) ) ( AVAILABLE ?auto_1517530 ) ( SURFACE-AT ?auto_1517529 ?auto_1517533 ) ( ON ?auto_1517529 ?auto_1517532 ) ( CLEAR ?auto_1517529 ) ( not ( = ?auto_1517527 ?auto_1517532 ) ) ( not ( = ?auto_1517529 ?auto_1517532 ) ) ( not ( = ?auto_1517528 ?auto_1517532 ) ) ( ON ?auto_1517524 ?auto_1517523 ) ( ON ?auto_1517525 ?auto_1517524 ) ( ON ?auto_1517522 ?auto_1517525 ) ( ON ?auto_1517526 ?auto_1517522 ) ( ON ?auto_1517528 ?auto_1517526 ) ( not ( = ?auto_1517523 ?auto_1517524 ) ) ( not ( = ?auto_1517523 ?auto_1517525 ) ) ( not ( = ?auto_1517523 ?auto_1517522 ) ) ( not ( = ?auto_1517523 ?auto_1517526 ) ) ( not ( = ?auto_1517523 ?auto_1517528 ) ) ( not ( = ?auto_1517523 ?auto_1517527 ) ) ( not ( = ?auto_1517523 ?auto_1517529 ) ) ( not ( = ?auto_1517523 ?auto_1517532 ) ) ( not ( = ?auto_1517524 ?auto_1517525 ) ) ( not ( = ?auto_1517524 ?auto_1517522 ) ) ( not ( = ?auto_1517524 ?auto_1517526 ) ) ( not ( = ?auto_1517524 ?auto_1517528 ) ) ( not ( = ?auto_1517524 ?auto_1517527 ) ) ( not ( = ?auto_1517524 ?auto_1517529 ) ) ( not ( = ?auto_1517524 ?auto_1517532 ) ) ( not ( = ?auto_1517525 ?auto_1517522 ) ) ( not ( = ?auto_1517525 ?auto_1517526 ) ) ( not ( = ?auto_1517525 ?auto_1517528 ) ) ( not ( = ?auto_1517525 ?auto_1517527 ) ) ( not ( = ?auto_1517525 ?auto_1517529 ) ) ( not ( = ?auto_1517525 ?auto_1517532 ) ) ( not ( = ?auto_1517522 ?auto_1517526 ) ) ( not ( = ?auto_1517522 ?auto_1517528 ) ) ( not ( = ?auto_1517522 ?auto_1517527 ) ) ( not ( = ?auto_1517522 ?auto_1517529 ) ) ( not ( = ?auto_1517522 ?auto_1517532 ) ) ( not ( = ?auto_1517526 ?auto_1517528 ) ) ( not ( = ?auto_1517526 ?auto_1517527 ) ) ( not ( = ?auto_1517526 ?auto_1517529 ) ) ( not ( = ?auto_1517526 ?auto_1517532 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1517528 ?auto_1517527 ?auto_1517529 )
      ( MAKE-7CRATE-VERIFY ?auto_1517523 ?auto_1517524 ?auto_1517525 ?auto_1517522 ?auto_1517526 ?auto_1517528 ?auto_1517527 ?auto_1517529 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1517601 - SURFACE
      ?auto_1517602 - SURFACE
      ?auto_1517603 - SURFACE
      ?auto_1517600 - SURFACE
      ?auto_1517604 - SURFACE
      ?auto_1517606 - SURFACE
      ?auto_1517605 - SURFACE
      ?auto_1517607 - SURFACE
    )
    :vars
    (
      ?auto_1517610 - HOIST
      ?auto_1517609 - PLACE
      ?auto_1517611 - PLACE
      ?auto_1517612 - HOIST
      ?auto_1517608 - SURFACE
      ?auto_1517613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1517610 ?auto_1517609 ) ( SURFACE-AT ?auto_1517605 ?auto_1517609 ) ( CLEAR ?auto_1517605 ) ( IS-CRATE ?auto_1517607 ) ( not ( = ?auto_1517605 ?auto_1517607 ) ) ( AVAILABLE ?auto_1517610 ) ( ON ?auto_1517605 ?auto_1517606 ) ( not ( = ?auto_1517606 ?auto_1517605 ) ) ( not ( = ?auto_1517606 ?auto_1517607 ) ) ( not ( = ?auto_1517611 ?auto_1517609 ) ) ( HOIST-AT ?auto_1517612 ?auto_1517611 ) ( not ( = ?auto_1517610 ?auto_1517612 ) ) ( AVAILABLE ?auto_1517612 ) ( SURFACE-AT ?auto_1517607 ?auto_1517611 ) ( ON ?auto_1517607 ?auto_1517608 ) ( CLEAR ?auto_1517607 ) ( not ( = ?auto_1517605 ?auto_1517608 ) ) ( not ( = ?auto_1517607 ?auto_1517608 ) ) ( not ( = ?auto_1517606 ?auto_1517608 ) ) ( TRUCK-AT ?auto_1517613 ?auto_1517609 ) ( ON ?auto_1517602 ?auto_1517601 ) ( ON ?auto_1517603 ?auto_1517602 ) ( ON ?auto_1517600 ?auto_1517603 ) ( ON ?auto_1517604 ?auto_1517600 ) ( ON ?auto_1517606 ?auto_1517604 ) ( not ( = ?auto_1517601 ?auto_1517602 ) ) ( not ( = ?auto_1517601 ?auto_1517603 ) ) ( not ( = ?auto_1517601 ?auto_1517600 ) ) ( not ( = ?auto_1517601 ?auto_1517604 ) ) ( not ( = ?auto_1517601 ?auto_1517606 ) ) ( not ( = ?auto_1517601 ?auto_1517605 ) ) ( not ( = ?auto_1517601 ?auto_1517607 ) ) ( not ( = ?auto_1517601 ?auto_1517608 ) ) ( not ( = ?auto_1517602 ?auto_1517603 ) ) ( not ( = ?auto_1517602 ?auto_1517600 ) ) ( not ( = ?auto_1517602 ?auto_1517604 ) ) ( not ( = ?auto_1517602 ?auto_1517606 ) ) ( not ( = ?auto_1517602 ?auto_1517605 ) ) ( not ( = ?auto_1517602 ?auto_1517607 ) ) ( not ( = ?auto_1517602 ?auto_1517608 ) ) ( not ( = ?auto_1517603 ?auto_1517600 ) ) ( not ( = ?auto_1517603 ?auto_1517604 ) ) ( not ( = ?auto_1517603 ?auto_1517606 ) ) ( not ( = ?auto_1517603 ?auto_1517605 ) ) ( not ( = ?auto_1517603 ?auto_1517607 ) ) ( not ( = ?auto_1517603 ?auto_1517608 ) ) ( not ( = ?auto_1517600 ?auto_1517604 ) ) ( not ( = ?auto_1517600 ?auto_1517606 ) ) ( not ( = ?auto_1517600 ?auto_1517605 ) ) ( not ( = ?auto_1517600 ?auto_1517607 ) ) ( not ( = ?auto_1517600 ?auto_1517608 ) ) ( not ( = ?auto_1517604 ?auto_1517606 ) ) ( not ( = ?auto_1517604 ?auto_1517605 ) ) ( not ( = ?auto_1517604 ?auto_1517607 ) ) ( not ( = ?auto_1517604 ?auto_1517608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1517606 ?auto_1517605 ?auto_1517607 )
      ( MAKE-7CRATE-VERIFY ?auto_1517601 ?auto_1517602 ?auto_1517603 ?auto_1517600 ?auto_1517604 ?auto_1517606 ?auto_1517605 ?auto_1517607 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1517679 - SURFACE
      ?auto_1517680 - SURFACE
      ?auto_1517681 - SURFACE
      ?auto_1517678 - SURFACE
      ?auto_1517682 - SURFACE
      ?auto_1517684 - SURFACE
      ?auto_1517683 - SURFACE
      ?auto_1517685 - SURFACE
    )
    :vars
    (
      ?auto_1517690 - HOIST
      ?auto_1517689 - PLACE
      ?auto_1517687 - PLACE
      ?auto_1517691 - HOIST
      ?auto_1517688 - SURFACE
      ?auto_1517686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1517690 ?auto_1517689 ) ( IS-CRATE ?auto_1517685 ) ( not ( = ?auto_1517683 ?auto_1517685 ) ) ( not ( = ?auto_1517684 ?auto_1517683 ) ) ( not ( = ?auto_1517684 ?auto_1517685 ) ) ( not ( = ?auto_1517687 ?auto_1517689 ) ) ( HOIST-AT ?auto_1517691 ?auto_1517687 ) ( not ( = ?auto_1517690 ?auto_1517691 ) ) ( AVAILABLE ?auto_1517691 ) ( SURFACE-AT ?auto_1517685 ?auto_1517687 ) ( ON ?auto_1517685 ?auto_1517688 ) ( CLEAR ?auto_1517685 ) ( not ( = ?auto_1517683 ?auto_1517688 ) ) ( not ( = ?auto_1517685 ?auto_1517688 ) ) ( not ( = ?auto_1517684 ?auto_1517688 ) ) ( TRUCK-AT ?auto_1517686 ?auto_1517689 ) ( SURFACE-AT ?auto_1517684 ?auto_1517689 ) ( CLEAR ?auto_1517684 ) ( LIFTING ?auto_1517690 ?auto_1517683 ) ( IS-CRATE ?auto_1517683 ) ( ON ?auto_1517680 ?auto_1517679 ) ( ON ?auto_1517681 ?auto_1517680 ) ( ON ?auto_1517678 ?auto_1517681 ) ( ON ?auto_1517682 ?auto_1517678 ) ( ON ?auto_1517684 ?auto_1517682 ) ( not ( = ?auto_1517679 ?auto_1517680 ) ) ( not ( = ?auto_1517679 ?auto_1517681 ) ) ( not ( = ?auto_1517679 ?auto_1517678 ) ) ( not ( = ?auto_1517679 ?auto_1517682 ) ) ( not ( = ?auto_1517679 ?auto_1517684 ) ) ( not ( = ?auto_1517679 ?auto_1517683 ) ) ( not ( = ?auto_1517679 ?auto_1517685 ) ) ( not ( = ?auto_1517679 ?auto_1517688 ) ) ( not ( = ?auto_1517680 ?auto_1517681 ) ) ( not ( = ?auto_1517680 ?auto_1517678 ) ) ( not ( = ?auto_1517680 ?auto_1517682 ) ) ( not ( = ?auto_1517680 ?auto_1517684 ) ) ( not ( = ?auto_1517680 ?auto_1517683 ) ) ( not ( = ?auto_1517680 ?auto_1517685 ) ) ( not ( = ?auto_1517680 ?auto_1517688 ) ) ( not ( = ?auto_1517681 ?auto_1517678 ) ) ( not ( = ?auto_1517681 ?auto_1517682 ) ) ( not ( = ?auto_1517681 ?auto_1517684 ) ) ( not ( = ?auto_1517681 ?auto_1517683 ) ) ( not ( = ?auto_1517681 ?auto_1517685 ) ) ( not ( = ?auto_1517681 ?auto_1517688 ) ) ( not ( = ?auto_1517678 ?auto_1517682 ) ) ( not ( = ?auto_1517678 ?auto_1517684 ) ) ( not ( = ?auto_1517678 ?auto_1517683 ) ) ( not ( = ?auto_1517678 ?auto_1517685 ) ) ( not ( = ?auto_1517678 ?auto_1517688 ) ) ( not ( = ?auto_1517682 ?auto_1517684 ) ) ( not ( = ?auto_1517682 ?auto_1517683 ) ) ( not ( = ?auto_1517682 ?auto_1517685 ) ) ( not ( = ?auto_1517682 ?auto_1517688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1517684 ?auto_1517683 ?auto_1517685 )
      ( MAKE-7CRATE-VERIFY ?auto_1517679 ?auto_1517680 ?auto_1517681 ?auto_1517678 ?auto_1517682 ?auto_1517684 ?auto_1517683 ?auto_1517685 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1517757 - SURFACE
      ?auto_1517758 - SURFACE
      ?auto_1517759 - SURFACE
      ?auto_1517756 - SURFACE
      ?auto_1517760 - SURFACE
      ?auto_1517762 - SURFACE
      ?auto_1517761 - SURFACE
      ?auto_1517763 - SURFACE
    )
    :vars
    (
      ?auto_1517769 - HOIST
      ?auto_1517767 - PLACE
      ?auto_1517768 - PLACE
      ?auto_1517764 - HOIST
      ?auto_1517766 - SURFACE
      ?auto_1517765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1517769 ?auto_1517767 ) ( IS-CRATE ?auto_1517763 ) ( not ( = ?auto_1517761 ?auto_1517763 ) ) ( not ( = ?auto_1517762 ?auto_1517761 ) ) ( not ( = ?auto_1517762 ?auto_1517763 ) ) ( not ( = ?auto_1517768 ?auto_1517767 ) ) ( HOIST-AT ?auto_1517764 ?auto_1517768 ) ( not ( = ?auto_1517769 ?auto_1517764 ) ) ( AVAILABLE ?auto_1517764 ) ( SURFACE-AT ?auto_1517763 ?auto_1517768 ) ( ON ?auto_1517763 ?auto_1517766 ) ( CLEAR ?auto_1517763 ) ( not ( = ?auto_1517761 ?auto_1517766 ) ) ( not ( = ?auto_1517763 ?auto_1517766 ) ) ( not ( = ?auto_1517762 ?auto_1517766 ) ) ( TRUCK-AT ?auto_1517765 ?auto_1517767 ) ( SURFACE-AT ?auto_1517762 ?auto_1517767 ) ( CLEAR ?auto_1517762 ) ( IS-CRATE ?auto_1517761 ) ( AVAILABLE ?auto_1517769 ) ( IN ?auto_1517761 ?auto_1517765 ) ( ON ?auto_1517758 ?auto_1517757 ) ( ON ?auto_1517759 ?auto_1517758 ) ( ON ?auto_1517756 ?auto_1517759 ) ( ON ?auto_1517760 ?auto_1517756 ) ( ON ?auto_1517762 ?auto_1517760 ) ( not ( = ?auto_1517757 ?auto_1517758 ) ) ( not ( = ?auto_1517757 ?auto_1517759 ) ) ( not ( = ?auto_1517757 ?auto_1517756 ) ) ( not ( = ?auto_1517757 ?auto_1517760 ) ) ( not ( = ?auto_1517757 ?auto_1517762 ) ) ( not ( = ?auto_1517757 ?auto_1517761 ) ) ( not ( = ?auto_1517757 ?auto_1517763 ) ) ( not ( = ?auto_1517757 ?auto_1517766 ) ) ( not ( = ?auto_1517758 ?auto_1517759 ) ) ( not ( = ?auto_1517758 ?auto_1517756 ) ) ( not ( = ?auto_1517758 ?auto_1517760 ) ) ( not ( = ?auto_1517758 ?auto_1517762 ) ) ( not ( = ?auto_1517758 ?auto_1517761 ) ) ( not ( = ?auto_1517758 ?auto_1517763 ) ) ( not ( = ?auto_1517758 ?auto_1517766 ) ) ( not ( = ?auto_1517759 ?auto_1517756 ) ) ( not ( = ?auto_1517759 ?auto_1517760 ) ) ( not ( = ?auto_1517759 ?auto_1517762 ) ) ( not ( = ?auto_1517759 ?auto_1517761 ) ) ( not ( = ?auto_1517759 ?auto_1517763 ) ) ( not ( = ?auto_1517759 ?auto_1517766 ) ) ( not ( = ?auto_1517756 ?auto_1517760 ) ) ( not ( = ?auto_1517756 ?auto_1517762 ) ) ( not ( = ?auto_1517756 ?auto_1517761 ) ) ( not ( = ?auto_1517756 ?auto_1517763 ) ) ( not ( = ?auto_1517756 ?auto_1517766 ) ) ( not ( = ?auto_1517760 ?auto_1517762 ) ) ( not ( = ?auto_1517760 ?auto_1517761 ) ) ( not ( = ?auto_1517760 ?auto_1517763 ) ) ( not ( = ?auto_1517760 ?auto_1517766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1517762 ?auto_1517761 ?auto_1517763 )
      ( MAKE-7CRATE-VERIFY ?auto_1517757 ?auto_1517758 ?auto_1517759 ?auto_1517756 ?auto_1517760 ?auto_1517762 ?auto_1517761 ?auto_1517763 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1520676 - SURFACE
      ?auto_1520677 - SURFACE
      ?auto_1520678 - SURFACE
      ?auto_1520675 - SURFACE
      ?auto_1520679 - SURFACE
      ?auto_1520681 - SURFACE
      ?auto_1520680 - SURFACE
      ?auto_1520682 - SURFACE
      ?auto_1520683 - SURFACE
    )
    :vars
    (
      ?auto_1520685 - HOIST
      ?auto_1520684 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1520685 ?auto_1520684 ) ( SURFACE-AT ?auto_1520682 ?auto_1520684 ) ( CLEAR ?auto_1520682 ) ( LIFTING ?auto_1520685 ?auto_1520683 ) ( IS-CRATE ?auto_1520683 ) ( not ( = ?auto_1520682 ?auto_1520683 ) ) ( ON ?auto_1520677 ?auto_1520676 ) ( ON ?auto_1520678 ?auto_1520677 ) ( ON ?auto_1520675 ?auto_1520678 ) ( ON ?auto_1520679 ?auto_1520675 ) ( ON ?auto_1520681 ?auto_1520679 ) ( ON ?auto_1520680 ?auto_1520681 ) ( ON ?auto_1520682 ?auto_1520680 ) ( not ( = ?auto_1520676 ?auto_1520677 ) ) ( not ( = ?auto_1520676 ?auto_1520678 ) ) ( not ( = ?auto_1520676 ?auto_1520675 ) ) ( not ( = ?auto_1520676 ?auto_1520679 ) ) ( not ( = ?auto_1520676 ?auto_1520681 ) ) ( not ( = ?auto_1520676 ?auto_1520680 ) ) ( not ( = ?auto_1520676 ?auto_1520682 ) ) ( not ( = ?auto_1520676 ?auto_1520683 ) ) ( not ( = ?auto_1520677 ?auto_1520678 ) ) ( not ( = ?auto_1520677 ?auto_1520675 ) ) ( not ( = ?auto_1520677 ?auto_1520679 ) ) ( not ( = ?auto_1520677 ?auto_1520681 ) ) ( not ( = ?auto_1520677 ?auto_1520680 ) ) ( not ( = ?auto_1520677 ?auto_1520682 ) ) ( not ( = ?auto_1520677 ?auto_1520683 ) ) ( not ( = ?auto_1520678 ?auto_1520675 ) ) ( not ( = ?auto_1520678 ?auto_1520679 ) ) ( not ( = ?auto_1520678 ?auto_1520681 ) ) ( not ( = ?auto_1520678 ?auto_1520680 ) ) ( not ( = ?auto_1520678 ?auto_1520682 ) ) ( not ( = ?auto_1520678 ?auto_1520683 ) ) ( not ( = ?auto_1520675 ?auto_1520679 ) ) ( not ( = ?auto_1520675 ?auto_1520681 ) ) ( not ( = ?auto_1520675 ?auto_1520680 ) ) ( not ( = ?auto_1520675 ?auto_1520682 ) ) ( not ( = ?auto_1520675 ?auto_1520683 ) ) ( not ( = ?auto_1520679 ?auto_1520681 ) ) ( not ( = ?auto_1520679 ?auto_1520680 ) ) ( not ( = ?auto_1520679 ?auto_1520682 ) ) ( not ( = ?auto_1520679 ?auto_1520683 ) ) ( not ( = ?auto_1520681 ?auto_1520680 ) ) ( not ( = ?auto_1520681 ?auto_1520682 ) ) ( not ( = ?auto_1520681 ?auto_1520683 ) ) ( not ( = ?auto_1520680 ?auto_1520682 ) ) ( not ( = ?auto_1520680 ?auto_1520683 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1520682 ?auto_1520683 )
      ( MAKE-8CRATE-VERIFY ?auto_1520676 ?auto_1520677 ?auto_1520678 ?auto_1520675 ?auto_1520679 ?auto_1520681 ?auto_1520680 ?auto_1520682 ?auto_1520683 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1520743 - SURFACE
      ?auto_1520744 - SURFACE
      ?auto_1520745 - SURFACE
      ?auto_1520742 - SURFACE
      ?auto_1520746 - SURFACE
      ?auto_1520748 - SURFACE
      ?auto_1520747 - SURFACE
      ?auto_1520749 - SURFACE
      ?auto_1520750 - SURFACE
    )
    :vars
    (
      ?auto_1520751 - HOIST
      ?auto_1520752 - PLACE
      ?auto_1520753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1520751 ?auto_1520752 ) ( SURFACE-AT ?auto_1520749 ?auto_1520752 ) ( CLEAR ?auto_1520749 ) ( IS-CRATE ?auto_1520750 ) ( not ( = ?auto_1520749 ?auto_1520750 ) ) ( TRUCK-AT ?auto_1520753 ?auto_1520752 ) ( AVAILABLE ?auto_1520751 ) ( IN ?auto_1520750 ?auto_1520753 ) ( ON ?auto_1520749 ?auto_1520747 ) ( not ( = ?auto_1520747 ?auto_1520749 ) ) ( not ( = ?auto_1520747 ?auto_1520750 ) ) ( ON ?auto_1520744 ?auto_1520743 ) ( ON ?auto_1520745 ?auto_1520744 ) ( ON ?auto_1520742 ?auto_1520745 ) ( ON ?auto_1520746 ?auto_1520742 ) ( ON ?auto_1520748 ?auto_1520746 ) ( ON ?auto_1520747 ?auto_1520748 ) ( not ( = ?auto_1520743 ?auto_1520744 ) ) ( not ( = ?auto_1520743 ?auto_1520745 ) ) ( not ( = ?auto_1520743 ?auto_1520742 ) ) ( not ( = ?auto_1520743 ?auto_1520746 ) ) ( not ( = ?auto_1520743 ?auto_1520748 ) ) ( not ( = ?auto_1520743 ?auto_1520747 ) ) ( not ( = ?auto_1520743 ?auto_1520749 ) ) ( not ( = ?auto_1520743 ?auto_1520750 ) ) ( not ( = ?auto_1520744 ?auto_1520745 ) ) ( not ( = ?auto_1520744 ?auto_1520742 ) ) ( not ( = ?auto_1520744 ?auto_1520746 ) ) ( not ( = ?auto_1520744 ?auto_1520748 ) ) ( not ( = ?auto_1520744 ?auto_1520747 ) ) ( not ( = ?auto_1520744 ?auto_1520749 ) ) ( not ( = ?auto_1520744 ?auto_1520750 ) ) ( not ( = ?auto_1520745 ?auto_1520742 ) ) ( not ( = ?auto_1520745 ?auto_1520746 ) ) ( not ( = ?auto_1520745 ?auto_1520748 ) ) ( not ( = ?auto_1520745 ?auto_1520747 ) ) ( not ( = ?auto_1520745 ?auto_1520749 ) ) ( not ( = ?auto_1520745 ?auto_1520750 ) ) ( not ( = ?auto_1520742 ?auto_1520746 ) ) ( not ( = ?auto_1520742 ?auto_1520748 ) ) ( not ( = ?auto_1520742 ?auto_1520747 ) ) ( not ( = ?auto_1520742 ?auto_1520749 ) ) ( not ( = ?auto_1520742 ?auto_1520750 ) ) ( not ( = ?auto_1520746 ?auto_1520748 ) ) ( not ( = ?auto_1520746 ?auto_1520747 ) ) ( not ( = ?auto_1520746 ?auto_1520749 ) ) ( not ( = ?auto_1520746 ?auto_1520750 ) ) ( not ( = ?auto_1520748 ?auto_1520747 ) ) ( not ( = ?auto_1520748 ?auto_1520749 ) ) ( not ( = ?auto_1520748 ?auto_1520750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1520747 ?auto_1520749 ?auto_1520750 )
      ( MAKE-8CRATE-VERIFY ?auto_1520743 ?auto_1520744 ?auto_1520745 ?auto_1520742 ?auto_1520746 ?auto_1520748 ?auto_1520747 ?auto_1520749 ?auto_1520750 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1520819 - SURFACE
      ?auto_1520820 - SURFACE
      ?auto_1520821 - SURFACE
      ?auto_1520818 - SURFACE
      ?auto_1520822 - SURFACE
      ?auto_1520824 - SURFACE
      ?auto_1520823 - SURFACE
      ?auto_1520825 - SURFACE
      ?auto_1520826 - SURFACE
    )
    :vars
    (
      ?auto_1520828 - HOIST
      ?auto_1520827 - PLACE
      ?auto_1520829 - TRUCK
      ?auto_1520830 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1520828 ?auto_1520827 ) ( SURFACE-AT ?auto_1520825 ?auto_1520827 ) ( CLEAR ?auto_1520825 ) ( IS-CRATE ?auto_1520826 ) ( not ( = ?auto_1520825 ?auto_1520826 ) ) ( AVAILABLE ?auto_1520828 ) ( IN ?auto_1520826 ?auto_1520829 ) ( ON ?auto_1520825 ?auto_1520823 ) ( not ( = ?auto_1520823 ?auto_1520825 ) ) ( not ( = ?auto_1520823 ?auto_1520826 ) ) ( TRUCK-AT ?auto_1520829 ?auto_1520830 ) ( not ( = ?auto_1520830 ?auto_1520827 ) ) ( ON ?auto_1520820 ?auto_1520819 ) ( ON ?auto_1520821 ?auto_1520820 ) ( ON ?auto_1520818 ?auto_1520821 ) ( ON ?auto_1520822 ?auto_1520818 ) ( ON ?auto_1520824 ?auto_1520822 ) ( ON ?auto_1520823 ?auto_1520824 ) ( not ( = ?auto_1520819 ?auto_1520820 ) ) ( not ( = ?auto_1520819 ?auto_1520821 ) ) ( not ( = ?auto_1520819 ?auto_1520818 ) ) ( not ( = ?auto_1520819 ?auto_1520822 ) ) ( not ( = ?auto_1520819 ?auto_1520824 ) ) ( not ( = ?auto_1520819 ?auto_1520823 ) ) ( not ( = ?auto_1520819 ?auto_1520825 ) ) ( not ( = ?auto_1520819 ?auto_1520826 ) ) ( not ( = ?auto_1520820 ?auto_1520821 ) ) ( not ( = ?auto_1520820 ?auto_1520818 ) ) ( not ( = ?auto_1520820 ?auto_1520822 ) ) ( not ( = ?auto_1520820 ?auto_1520824 ) ) ( not ( = ?auto_1520820 ?auto_1520823 ) ) ( not ( = ?auto_1520820 ?auto_1520825 ) ) ( not ( = ?auto_1520820 ?auto_1520826 ) ) ( not ( = ?auto_1520821 ?auto_1520818 ) ) ( not ( = ?auto_1520821 ?auto_1520822 ) ) ( not ( = ?auto_1520821 ?auto_1520824 ) ) ( not ( = ?auto_1520821 ?auto_1520823 ) ) ( not ( = ?auto_1520821 ?auto_1520825 ) ) ( not ( = ?auto_1520821 ?auto_1520826 ) ) ( not ( = ?auto_1520818 ?auto_1520822 ) ) ( not ( = ?auto_1520818 ?auto_1520824 ) ) ( not ( = ?auto_1520818 ?auto_1520823 ) ) ( not ( = ?auto_1520818 ?auto_1520825 ) ) ( not ( = ?auto_1520818 ?auto_1520826 ) ) ( not ( = ?auto_1520822 ?auto_1520824 ) ) ( not ( = ?auto_1520822 ?auto_1520823 ) ) ( not ( = ?auto_1520822 ?auto_1520825 ) ) ( not ( = ?auto_1520822 ?auto_1520826 ) ) ( not ( = ?auto_1520824 ?auto_1520823 ) ) ( not ( = ?auto_1520824 ?auto_1520825 ) ) ( not ( = ?auto_1520824 ?auto_1520826 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1520823 ?auto_1520825 ?auto_1520826 )
      ( MAKE-8CRATE-VERIFY ?auto_1520819 ?auto_1520820 ?auto_1520821 ?auto_1520818 ?auto_1520822 ?auto_1520824 ?auto_1520823 ?auto_1520825 ?auto_1520826 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1520903 - SURFACE
      ?auto_1520904 - SURFACE
      ?auto_1520905 - SURFACE
      ?auto_1520902 - SURFACE
      ?auto_1520906 - SURFACE
      ?auto_1520908 - SURFACE
      ?auto_1520907 - SURFACE
      ?auto_1520909 - SURFACE
      ?auto_1520910 - SURFACE
    )
    :vars
    (
      ?auto_1520913 - HOIST
      ?auto_1520912 - PLACE
      ?auto_1520911 - TRUCK
      ?auto_1520915 - PLACE
      ?auto_1520914 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1520913 ?auto_1520912 ) ( SURFACE-AT ?auto_1520909 ?auto_1520912 ) ( CLEAR ?auto_1520909 ) ( IS-CRATE ?auto_1520910 ) ( not ( = ?auto_1520909 ?auto_1520910 ) ) ( AVAILABLE ?auto_1520913 ) ( ON ?auto_1520909 ?auto_1520907 ) ( not ( = ?auto_1520907 ?auto_1520909 ) ) ( not ( = ?auto_1520907 ?auto_1520910 ) ) ( TRUCK-AT ?auto_1520911 ?auto_1520915 ) ( not ( = ?auto_1520915 ?auto_1520912 ) ) ( HOIST-AT ?auto_1520914 ?auto_1520915 ) ( LIFTING ?auto_1520914 ?auto_1520910 ) ( not ( = ?auto_1520913 ?auto_1520914 ) ) ( ON ?auto_1520904 ?auto_1520903 ) ( ON ?auto_1520905 ?auto_1520904 ) ( ON ?auto_1520902 ?auto_1520905 ) ( ON ?auto_1520906 ?auto_1520902 ) ( ON ?auto_1520908 ?auto_1520906 ) ( ON ?auto_1520907 ?auto_1520908 ) ( not ( = ?auto_1520903 ?auto_1520904 ) ) ( not ( = ?auto_1520903 ?auto_1520905 ) ) ( not ( = ?auto_1520903 ?auto_1520902 ) ) ( not ( = ?auto_1520903 ?auto_1520906 ) ) ( not ( = ?auto_1520903 ?auto_1520908 ) ) ( not ( = ?auto_1520903 ?auto_1520907 ) ) ( not ( = ?auto_1520903 ?auto_1520909 ) ) ( not ( = ?auto_1520903 ?auto_1520910 ) ) ( not ( = ?auto_1520904 ?auto_1520905 ) ) ( not ( = ?auto_1520904 ?auto_1520902 ) ) ( not ( = ?auto_1520904 ?auto_1520906 ) ) ( not ( = ?auto_1520904 ?auto_1520908 ) ) ( not ( = ?auto_1520904 ?auto_1520907 ) ) ( not ( = ?auto_1520904 ?auto_1520909 ) ) ( not ( = ?auto_1520904 ?auto_1520910 ) ) ( not ( = ?auto_1520905 ?auto_1520902 ) ) ( not ( = ?auto_1520905 ?auto_1520906 ) ) ( not ( = ?auto_1520905 ?auto_1520908 ) ) ( not ( = ?auto_1520905 ?auto_1520907 ) ) ( not ( = ?auto_1520905 ?auto_1520909 ) ) ( not ( = ?auto_1520905 ?auto_1520910 ) ) ( not ( = ?auto_1520902 ?auto_1520906 ) ) ( not ( = ?auto_1520902 ?auto_1520908 ) ) ( not ( = ?auto_1520902 ?auto_1520907 ) ) ( not ( = ?auto_1520902 ?auto_1520909 ) ) ( not ( = ?auto_1520902 ?auto_1520910 ) ) ( not ( = ?auto_1520906 ?auto_1520908 ) ) ( not ( = ?auto_1520906 ?auto_1520907 ) ) ( not ( = ?auto_1520906 ?auto_1520909 ) ) ( not ( = ?auto_1520906 ?auto_1520910 ) ) ( not ( = ?auto_1520908 ?auto_1520907 ) ) ( not ( = ?auto_1520908 ?auto_1520909 ) ) ( not ( = ?auto_1520908 ?auto_1520910 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1520907 ?auto_1520909 ?auto_1520910 )
      ( MAKE-8CRATE-VERIFY ?auto_1520903 ?auto_1520904 ?auto_1520905 ?auto_1520902 ?auto_1520906 ?auto_1520908 ?auto_1520907 ?auto_1520909 ?auto_1520910 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1520995 - SURFACE
      ?auto_1520996 - SURFACE
      ?auto_1520997 - SURFACE
      ?auto_1520994 - SURFACE
      ?auto_1520998 - SURFACE
      ?auto_1521000 - SURFACE
      ?auto_1520999 - SURFACE
      ?auto_1521001 - SURFACE
      ?auto_1521002 - SURFACE
    )
    :vars
    (
      ?auto_1521008 - HOIST
      ?auto_1521007 - PLACE
      ?auto_1521004 - TRUCK
      ?auto_1521003 - PLACE
      ?auto_1521006 - HOIST
      ?auto_1521005 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1521008 ?auto_1521007 ) ( SURFACE-AT ?auto_1521001 ?auto_1521007 ) ( CLEAR ?auto_1521001 ) ( IS-CRATE ?auto_1521002 ) ( not ( = ?auto_1521001 ?auto_1521002 ) ) ( AVAILABLE ?auto_1521008 ) ( ON ?auto_1521001 ?auto_1520999 ) ( not ( = ?auto_1520999 ?auto_1521001 ) ) ( not ( = ?auto_1520999 ?auto_1521002 ) ) ( TRUCK-AT ?auto_1521004 ?auto_1521003 ) ( not ( = ?auto_1521003 ?auto_1521007 ) ) ( HOIST-AT ?auto_1521006 ?auto_1521003 ) ( not ( = ?auto_1521008 ?auto_1521006 ) ) ( AVAILABLE ?auto_1521006 ) ( SURFACE-AT ?auto_1521002 ?auto_1521003 ) ( ON ?auto_1521002 ?auto_1521005 ) ( CLEAR ?auto_1521002 ) ( not ( = ?auto_1521001 ?auto_1521005 ) ) ( not ( = ?auto_1521002 ?auto_1521005 ) ) ( not ( = ?auto_1520999 ?auto_1521005 ) ) ( ON ?auto_1520996 ?auto_1520995 ) ( ON ?auto_1520997 ?auto_1520996 ) ( ON ?auto_1520994 ?auto_1520997 ) ( ON ?auto_1520998 ?auto_1520994 ) ( ON ?auto_1521000 ?auto_1520998 ) ( ON ?auto_1520999 ?auto_1521000 ) ( not ( = ?auto_1520995 ?auto_1520996 ) ) ( not ( = ?auto_1520995 ?auto_1520997 ) ) ( not ( = ?auto_1520995 ?auto_1520994 ) ) ( not ( = ?auto_1520995 ?auto_1520998 ) ) ( not ( = ?auto_1520995 ?auto_1521000 ) ) ( not ( = ?auto_1520995 ?auto_1520999 ) ) ( not ( = ?auto_1520995 ?auto_1521001 ) ) ( not ( = ?auto_1520995 ?auto_1521002 ) ) ( not ( = ?auto_1520995 ?auto_1521005 ) ) ( not ( = ?auto_1520996 ?auto_1520997 ) ) ( not ( = ?auto_1520996 ?auto_1520994 ) ) ( not ( = ?auto_1520996 ?auto_1520998 ) ) ( not ( = ?auto_1520996 ?auto_1521000 ) ) ( not ( = ?auto_1520996 ?auto_1520999 ) ) ( not ( = ?auto_1520996 ?auto_1521001 ) ) ( not ( = ?auto_1520996 ?auto_1521002 ) ) ( not ( = ?auto_1520996 ?auto_1521005 ) ) ( not ( = ?auto_1520997 ?auto_1520994 ) ) ( not ( = ?auto_1520997 ?auto_1520998 ) ) ( not ( = ?auto_1520997 ?auto_1521000 ) ) ( not ( = ?auto_1520997 ?auto_1520999 ) ) ( not ( = ?auto_1520997 ?auto_1521001 ) ) ( not ( = ?auto_1520997 ?auto_1521002 ) ) ( not ( = ?auto_1520997 ?auto_1521005 ) ) ( not ( = ?auto_1520994 ?auto_1520998 ) ) ( not ( = ?auto_1520994 ?auto_1521000 ) ) ( not ( = ?auto_1520994 ?auto_1520999 ) ) ( not ( = ?auto_1520994 ?auto_1521001 ) ) ( not ( = ?auto_1520994 ?auto_1521002 ) ) ( not ( = ?auto_1520994 ?auto_1521005 ) ) ( not ( = ?auto_1520998 ?auto_1521000 ) ) ( not ( = ?auto_1520998 ?auto_1520999 ) ) ( not ( = ?auto_1520998 ?auto_1521001 ) ) ( not ( = ?auto_1520998 ?auto_1521002 ) ) ( not ( = ?auto_1520998 ?auto_1521005 ) ) ( not ( = ?auto_1521000 ?auto_1520999 ) ) ( not ( = ?auto_1521000 ?auto_1521001 ) ) ( not ( = ?auto_1521000 ?auto_1521002 ) ) ( not ( = ?auto_1521000 ?auto_1521005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1520999 ?auto_1521001 ?auto_1521002 )
      ( MAKE-8CRATE-VERIFY ?auto_1520995 ?auto_1520996 ?auto_1520997 ?auto_1520994 ?auto_1520998 ?auto_1521000 ?auto_1520999 ?auto_1521001 ?auto_1521002 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1521088 - SURFACE
      ?auto_1521089 - SURFACE
      ?auto_1521090 - SURFACE
      ?auto_1521087 - SURFACE
      ?auto_1521091 - SURFACE
      ?auto_1521093 - SURFACE
      ?auto_1521092 - SURFACE
      ?auto_1521094 - SURFACE
      ?auto_1521095 - SURFACE
    )
    :vars
    (
      ?auto_1521098 - HOIST
      ?auto_1521100 - PLACE
      ?auto_1521099 - PLACE
      ?auto_1521096 - HOIST
      ?auto_1521097 - SURFACE
      ?auto_1521101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1521098 ?auto_1521100 ) ( SURFACE-AT ?auto_1521094 ?auto_1521100 ) ( CLEAR ?auto_1521094 ) ( IS-CRATE ?auto_1521095 ) ( not ( = ?auto_1521094 ?auto_1521095 ) ) ( AVAILABLE ?auto_1521098 ) ( ON ?auto_1521094 ?auto_1521092 ) ( not ( = ?auto_1521092 ?auto_1521094 ) ) ( not ( = ?auto_1521092 ?auto_1521095 ) ) ( not ( = ?auto_1521099 ?auto_1521100 ) ) ( HOIST-AT ?auto_1521096 ?auto_1521099 ) ( not ( = ?auto_1521098 ?auto_1521096 ) ) ( AVAILABLE ?auto_1521096 ) ( SURFACE-AT ?auto_1521095 ?auto_1521099 ) ( ON ?auto_1521095 ?auto_1521097 ) ( CLEAR ?auto_1521095 ) ( not ( = ?auto_1521094 ?auto_1521097 ) ) ( not ( = ?auto_1521095 ?auto_1521097 ) ) ( not ( = ?auto_1521092 ?auto_1521097 ) ) ( TRUCK-AT ?auto_1521101 ?auto_1521100 ) ( ON ?auto_1521089 ?auto_1521088 ) ( ON ?auto_1521090 ?auto_1521089 ) ( ON ?auto_1521087 ?auto_1521090 ) ( ON ?auto_1521091 ?auto_1521087 ) ( ON ?auto_1521093 ?auto_1521091 ) ( ON ?auto_1521092 ?auto_1521093 ) ( not ( = ?auto_1521088 ?auto_1521089 ) ) ( not ( = ?auto_1521088 ?auto_1521090 ) ) ( not ( = ?auto_1521088 ?auto_1521087 ) ) ( not ( = ?auto_1521088 ?auto_1521091 ) ) ( not ( = ?auto_1521088 ?auto_1521093 ) ) ( not ( = ?auto_1521088 ?auto_1521092 ) ) ( not ( = ?auto_1521088 ?auto_1521094 ) ) ( not ( = ?auto_1521088 ?auto_1521095 ) ) ( not ( = ?auto_1521088 ?auto_1521097 ) ) ( not ( = ?auto_1521089 ?auto_1521090 ) ) ( not ( = ?auto_1521089 ?auto_1521087 ) ) ( not ( = ?auto_1521089 ?auto_1521091 ) ) ( not ( = ?auto_1521089 ?auto_1521093 ) ) ( not ( = ?auto_1521089 ?auto_1521092 ) ) ( not ( = ?auto_1521089 ?auto_1521094 ) ) ( not ( = ?auto_1521089 ?auto_1521095 ) ) ( not ( = ?auto_1521089 ?auto_1521097 ) ) ( not ( = ?auto_1521090 ?auto_1521087 ) ) ( not ( = ?auto_1521090 ?auto_1521091 ) ) ( not ( = ?auto_1521090 ?auto_1521093 ) ) ( not ( = ?auto_1521090 ?auto_1521092 ) ) ( not ( = ?auto_1521090 ?auto_1521094 ) ) ( not ( = ?auto_1521090 ?auto_1521095 ) ) ( not ( = ?auto_1521090 ?auto_1521097 ) ) ( not ( = ?auto_1521087 ?auto_1521091 ) ) ( not ( = ?auto_1521087 ?auto_1521093 ) ) ( not ( = ?auto_1521087 ?auto_1521092 ) ) ( not ( = ?auto_1521087 ?auto_1521094 ) ) ( not ( = ?auto_1521087 ?auto_1521095 ) ) ( not ( = ?auto_1521087 ?auto_1521097 ) ) ( not ( = ?auto_1521091 ?auto_1521093 ) ) ( not ( = ?auto_1521091 ?auto_1521092 ) ) ( not ( = ?auto_1521091 ?auto_1521094 ) ) ( not ( = ?auto_1521091 ?auto_1521095 ) ) ( not ( = ?auto_1521091 ?auto_1521097 ) ) ( not ( = ?auto_1521093 ?auto_1521092 ) ) ( not ( = ?auto_1521093 ?auto_1521094 ) ) ( not ( = ?auto_1521093 ?auto_1521095 ) ) ( not ( = ?auto_1521093 ?auto_1521097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1521092 ?auto_1521094 ?auto_1521095 )
      ( MAKE-8CRATE-VERIFY ?auto_1521088 ?auto_1521089 ?auto_1521090 ?auto_1521087 ?auto_1521091 ?auto_1521093 ?auto_1521092 ?auto_1521094 ?auto_1521095 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1521181 - SURFACE
      ?auto_1521182 - SURFACE
      ?auto_1521183 - SURFACE
      ?auto_1521180 - SURFACE
      ?auto_1521184 - SURFACE
      ?auto_1521186 - SURFACE
      ?auto_1521185 - SURFACE
      ?auto_1521187 - SURFACE
      ?auto_1521188 - SURFACE
    )
    :vars
    (
      ?auto_1521194 - HOIST
      ?auto_1521189 - PLACE
      ?auto_1521191 - PLACE
      ?auto_1521192 - HOIST
      ?auto_1521193 - SURFACE
      ?auto_1521190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1521194 ?auto_1521189 ) ( IS-CRATE ?auto_1521188 ) ( not ( = ?auto_1521187 ?auto_1521188 ) ) ( not ( = ?auto_1521185 ?auto_1521187 ) ) ( not ( = ?auto_1521185 ?auto_1521188 ) ) ( not ( = ?auto_1521191 ?auto_1521189 ) ) ( HOIST-AT ?auto_1521192 ?auto_1521191 ) ( not ( = ?auto_1521194 ?auto_1521192 ) ) ( AVAILABLE ?auto_1521192 ) ( SURFACE-AT ?auto_1521188 ?auto_1521191 ) ( ON ?auto_1521188 ?auto_1521193 ) ( CLEAR ?auto_1521188 ) ( not ( = ?auto_1521187 ?auto_1521193 ) ) ( not ( = ?auto_1521188 ?auto_1521193 ) ) ( not ( = ?auto_1521185 ?auto_1521193 ) ) ( TRUCK-AT ?auto_1521190 ?auto_1521189 ) ( SURFACE-AT ?auto_1521185 ?auto_1521189 ) ( CLEAR ?auto_1521185 ) ( LIFTING ?auto_1521194 ?auto_1521187 ) ( IS-CRATE ?auto_1521187 ) ( ON ?auto_1521182 ?auto_1521181 ) ( ON ?auto_1521183 ?auto_1521182 ) ( ON ?auto_1521180 ?auto_1521183 ) ( ON ?auto_1521184 ?auto_1521180 ) ( ON ?auto_1521186 ?auto_1521184 ) ( ON ?auto_1521185 ?auto_1521186 ) ( not ( = ?auto_1521181 ?auto_1521182 ) ) ( not ( = ?auto_1521181 ?auto_1521183 ) ) ( not ( = ?auto_1521181 ?auto_1521180 ) ) ( not ( = ?auto_1521181 ?auto_1521184 ) ) ( not ( = ?auto_1521181 ?auto_1521186 ) ) ( not ( = ?auto_1521181 ?auto_1521185 ) ) ( not ( = ?auto_1521181 ?auto_1521187 ) ) ( not ( = ?auto_1521181 ?auto_1521188 ) ) ( not ( = ?auto_1521181 ?auto_1521193 ) ) ( not ( = ?auto_1521182 ?auto_1521183 ) ) ( not ( = ?auto_1521182 ?auto_1521180 ) ) ( not ( = ?auto_1521182 ?auto_1521184 ) ) ( not ( = ?auto_1521182 ?auto_1521186 ) ) ( not ( = ?auto_1521182 ?auto_1521185 ) ) ( not ( = ?auto_1521182 ?auto_1521187 ) ) ( not ( = ?auto_1521182 ?auto_1521188 ) ) ( not ( = ?auto_1521182 ?auto_1521193 ) ) ( not ( = ?auto_1521183 ?auto_1521180 ) ) ( not ( = ?auto_1521183 ?auto_1521184 ) ) ( not ( = ?auto_1521183 ?auto_1521186 ) ) ( not ( = ?auto_1521183 ?auto_1521185 ) ) ( not ( = ?auto_1521183 ?auto_1521187 ) ) ( not ( = ?auto_1521183 ?auto_1521188 ) ) ( not ( = ?auto_1521183 ?auto_1521193 ) ) ( not ( = ?auto_1521180 ?auto_1521184 ) ) ( not ( = ?auto_1521180 ?auto_1521186 ) ) ( not ( = ?auto_1521180 ?auto_1521185 ) ) ( not ( = ?auto_1521180 ?auto_1521187 ) ) ( not ( = ?auto_1521180 ?auto_1521188 ) ) ( not ( = ?auto_1521180 ?auto_1521193 ) ) ( not ( = ?auto_1521184 ?auto_1521186 ) ) ( not ( = ?auto_1521184 ?auto_1521185 ) ) ( not ( = ?auto_1521184 ?auto_1521187 ) ) ( not ( = ?auto_1521184 ?auto_1521188 ) ) ( not ( = ?auto_1521184 ?auto_1521193 ) ) ( not ( = ?auto_1521186 ?auto_1521185 ) ) ( not ( = ?auto_1521186 ?auto_1521187 ) ) ( not ( = ?auto_1521186 ?auto_1521188 ) ) ( not ( = ?auto_1521186 ?auto_1521193 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1521185 ?auto_1521187 ?auto_1521188 )
      ( MAKE-8CRATE-VERIFY ?auto_1521181 ?auto_1521182 ?auto_1521183 ?auto_1521180 ?auto_1521184 ?auto_1521186 ?auto_1521185 ?auto_1521187 ?auto_1521188 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1521274 - SURFACE
      ?auto_1521275 - SURFACE
      ?auto_1521276 - SURFACE
      ?auto_1521273 - SURFACE
      ?auto_1521277 - SURFACE
      ?auto_1521279 - SURFACE
      ?auto_1521278 - SURFACE
      ?auto_1521280 - SURFACE
      ?auto_1521281 - SURFACE
    )
    :vars
    (
      ?auto_1521285 - HOIST
      ?auto_1521284 - PLACE
      ?auto_1521283 - PLACE
      ?auto_1521287 - HOIST
      ?auto_1521282 - SURFACE
      ?auto_1521286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1521285 ?auto_1521284 ) ( IS-CRATE ?auto_1521281 ) ( not ( = ?auto_1521280 ?auto_1521281 ) ) ( not ( = ?auto_1521278 ?auto_1521280 ) ) ( not ( = ?auto_1521278 ?auto_1521281 ) ) ( not ( = ?auto_1521283 ?auto_1521284 ) ) ( HOIST-AT ?auto_1521287 ?auto_1521283 ) ( not ( = ?auto_1521285 ?auto_1521287 ) ) ( AVAILABLE ?auto_1521287 ) ( SURFACE-AT ?auto_1521281 ?auto_1521283 ) ( ON ?auto_1521281 ?auto_1521282 ) ( CLEAR ?auto_1521281 ) ( not ( = ?auto_1521280 ?auto_1521282 ) ) ( not ( = ?auto_1521281 ?auto_1521282 ) ) ( not ( = ?auto_1521278 ?auto_1521282 ) ) ( TRUCK-AT ?auto_1521286 ?auto_1521284 ) ( SURFACE-AT ?auto_1521278 ?auto_1521284 ) ( CLEAR ?auto_1521278 ) ( IS-CRATE ?auto_1521280 ) ( AVAILABLE ?auto_1521285 ) ( IN ?auto_1521280 ?auto_1521286 ) ( ON ?auto_1521275 ?auto_1521274 ) ( ON ?auto_1521276 ?auto_1521275 ) ( ON ?auto_1521273 ?auto_1521276 ) ( ON ?auto_1521277 ?auto_1521273 ) ( ON ?auto_1521279 ?auto_1521277 ) ( ON ?auto_1521278 ?auto_1521279 ) ( not ( = ?auto_1521274 ?auto_1521275 ) ) ( not ( = ?auto_1521274 ?auto_1521276 ) ) ( not ( = ?auto_1521274 ?auto_1521273 ) ) ( not ( = ?auto_1521274 ?auto_1521277 ) ) ( not ( = ?auto_1521274 ?auto_1521279 ) ) ( not ( = ?auto_1521274 ?auto_1521278 ) ) ( not ( = ?auto_1521274 ?auto_1521280 ) ) ( not ( = ?auto_1521274 ?auto_1521281 ) ) ( not ( = ?auto_1521274 ?auto_1521282 ) ) ( not ( = ?auto_1521275 ?auto_1521276 ) ) ( not ( = ?auto_1521275 ?auto_1521273 ) ) ( not ( = ?auto_1521275 ?auto_1521277 ) ) ( not ( = ?auto_1521275 ?auto_1521279 ) ) ( not ( = ?auto_1521275 ?auto_1521278 ) ) ( not ( = ?auto_1521275 ?auto_1521280 ) ) ( not ( = ?auto_1521275 ?auto_1521281 ) ) ( not ( = ?auto_1521275 ?auto_1521282 ) ) ( not ( = ?auto_1521276 ?auto_1521273 ) ) ( not ( = ?auto_1521276 ?auto_1521277 ) ) ( not ( = ?auto_1521276 ?auto_1521279 ) ) ( not ( = ?auto_1521276 ?auto_1521278 ) ) ( not ( = ?auto_1521276 ?auto_1521280 ) ) ( not ( = ?auto_1521276 ?auto_1521281 ) ) ( not ( = ?auto_1521276 ?auto_1521282 ) ) ( not ( = ?auto_1521273 ?auto_1521277 ) ) ( not ( = ?auto_1521273 ?auto_1521279 ) ) ( not ( = ?auto_1521273 ?auto_1521278 ) ) ( not ( = ?auto_1521273 ?auto_1521280 ) ) ( not ( = ?auto_1521273 ?auto_1521281 ) ) ( not ( = ?auto_1521273 ?auto_1521282 ) ) ( not ( = ?auto_1521277 ?auto_1521279 ) ) ( not ( = ?auto_1521277 ?auto_1521278 ) ) ( not ( = ?auto_1521277 ?auto_1521280 ) ) ( not ( = ?auto_1521277 ?auto_1521281 ) ) ( not ( = ?auto_1521277 ?auto_1521282 ) ) ( not ( = ?auto_1521279 ?auto_1521278 ) ) ( not ( = ?auto_1521279 ?auto_1521280 ) ) ( not ( = ?auto_1521279 ?auto_1521281 ) ) ( not ( = ?auto_1521279 ?auto_1521282 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1521278 ?auto_1521280 ?auto_1521281 )
      ( MAKE-8CRATE-VERIFY ?auto_1521274 ?auto_1521275 ?auto_1521276 ?auto_1521273 ?auto_1521277 ?auto_1521279 ?auto_1521278 ?auto_1521280 ?auto_1521281 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1525390 - SURFACE
      ?auto_1525391 - SURFACE
      ?auto_1525392 - SURFACE
      ?auto_1525389 - SURFACE
      ?auto_1525393 - SURFACE
      ?auto_1525395 - SURFACE
      ?auto_1525394 - SURFACE
      ?auto_1525396 - SURFACE
      ?auto_1525397 - SURFACE
      ?auto_1525398 - SURFACE
    )
    :vars
    (
      ?auto_1525400 - HOIST
      ?auto_1525399 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525400 ?auto_1525399 ) ( SURFACE-AT ?auto_1525397 ?auto_1525399 ) ( CLEAR ?auto_1525397 ) ( LIFTING ?auto_1525400 ?auto_1525398 ) ( IS-CRATE ?auto_1525398 ) ( not ( = ?auto_1525397 ?auto_1525398 ) ) ( ON ?auto_1525391 ?auto_1525390 ) ( ON ?auto_1525392 ?auto_1525391 ) ( ON ?auto_1525389 ?auto_1525392 ) ( ON ?auto_1525393 ?auto_1525389 ) ( ON ?auto_1525395 ?auto_1525393 ) ( ON ?auto_1525394 ?auto_1525395 ) ( ON ?auto_1525396 ?auto_1525394 ) ( ON ?auto_1525397 ?auto_1525396 ) ( not ( = ?auto_1525390 ?auto_1525391 ) ) ( not ( = ?auto_1525390 ?auto_1525392 ) ) ( not ( = ?auto_1525390 ?auto_1525389 ) ) ( not ( = ?auto_1525390 ?auto_1525393 ) ) ( not ( = ?auto_1525390 ?auto_1525395 ) ) ( not ( = ?auto_1525390 ?auto_1525394 ) ) ( not ( = ?auto_1525390 ?auto_1525396 ) ) ( not ( = ?auto_1525390 ?auto_1525397 ) ) ( not ( = ?auto_1525390 ?auto_1525398 ) ) ( not ( = ?auto_1525391 ?auto_1525392 ) ) ( not ( = ?auto_1525391 ?auto_1525389 ) ) ( not ( = ?auto_1525391 ?auto_1525393 ) ) ( not ( = ?auto_1525391 ?auto_1525395 ) ) ( not ( = ?auto_1525391 ?auto_1525394 ) ) ( not ( = ?auto_1525391 ?auto_1525396 ) ) ( not ( = ?auto_1525391 ?auto_1525397 ) ) ( not ( = ?auto_1525391 ?auto_1525398 ) ) ( not ( = ?auto_1525392 ?auto_1525389 ) ) ( not ( = ?auto_1525392 ?auto_1525393 ) ) ( not ( = ?auto_1525392 ?auto_1525395 ) ) ( not ( = ?auto_1525392 ?auto_1525394 ) ) ( not ( = ?auto_1525392 ?auto_1525396 ) ) ( not ( = ?auto_1525392 ?auto_1525397 ) ) ( not ( = ?auto_1525392 ?auto_1525398 ) ) ( not ( = ?auto_1525389 ?auto_1525393 ) ) ( not ( = ?auto_1525389 ?auto_1525395 ) ) ( not ( = ?auto_1525389 ?auto_1525394 ) ) ( not ( = ?auto_1525389 ?auto_1525396 ) ) ( not ( = ?auto_1525389 ?auto_1525397 ) ) ( not ( = ?auto_1525389 ?auto_1525398 ) ) ( not ( = ?auto_1525393 ?auto_1525395 ) ) ( not ( = ?auto_1525393 ?auto_1525394 ) ) ( not ( = ?auto_1525393 ?auto_1525396 ) ) ( not ( = ?auto_1525393 ?auto_1525397 ) ) ( not ( = ?auto_1525393 ?auto_1525398 ) ) ( not ( = ?auto_1525395 ?auto_1525394 ) ) ( not ( = ?auto_1525395 ?auto_1525396 ) ) ( not ( = ?auto_1525395 ?auto_1525397 ) ) ( not ( = ?auto_1525395 ?auto_1525398 ) ) ( not ( = ?auto_1525394 ?auto_1525396 ) ) ( not ( = ?auto_1525394 ?auto_1525397 ) ) ( not ( = ?auto_1525394 ?auto_1525398 ) ) ( not ( = ?auto_1525396 ?auto_1525397 ) ) ( not ( = ?auto_1525396 ?auto_1525398 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1525397 ?auto_1525398 )
      ( MAKE-9CRATE-VERIFY ?auto_1525390 ?auto_1525391 ?auto_1525392 ?auto_1525389 ?auto_1525393 ?auto_1525395 ?auto_1525394 ?auto_1525396 ?auto_1525397 ?auto_1525398 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1525470 - SURFACE
      ?auto_1525471 - SURFACE
      ?auto_1525472 - SURFACE
      ?auto_1525469 - SURFACE
      ?auto_1525473 - SURFACE
      ?auto_1525475 - SURFACE
      ?auto_1525474 - SURFACE
      ?auto_1525476 - SURFACE
      ?auto_1525477 - SURFACE
      ?auto_1525478 - SURFACE
    )
    :vars
    (
      ?auto_1525479 - HOIST
      ?auto_1525480 - PLACE
      ?auto_1525481 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525479 ?auto_1525480 ) ( SURFACE-AT ?auto_1525477 ?auto_1525480 ) ( CLEAR ?auto_1525477 ) ( IS-CRATE ?auto_1525478 ) ( not ( = ?auto_1525477 ?auto_1525478 ) ) ( TRUCK-AT ?auto_1525481 ?auto_1525480 ) ( AVAILABLE ?auto_1525479 ) ( IN ?auto_1525478 ?auto_1525481 ) ( ON ?auto_1525477 ?auto_1525476 ) ( not ( = ?auto_1525476 ?auto_1525477 ) ) ( not ( = ?auto_1525476 ?auto_1525478 ) ) ( ON ?auto_1525471 ?auto_1525470 ) ( ON ?auto_1525472 ?auto_1525471 ) ( ON ?auto_1525469 ?auto_1525472 ) ( ON ?auto_1525473 ?auto_1525469 ) ( ON ?auto_1525475 ?auto_1525473 ) ( ON ?auto_1525474 ?auto_1525475 ) ( ON ?auto_1525476 ?auto_1525474 ) ( not ( = ?auto_1525470 ?auto_1525471 ) ) ( not ( = ?auto_1525470 ?auto_1525472 ) ) ( not ( = ?auto_1525470 ?auto_1525469 ) ) ( not ( = ?auto_1525470 ?auto_1525473 ) ) ( not ( = ?auto_1525470 ?auto_1525475 ) ) ( not ( = ?auto_1525470 ?auto_1525474 ) ) ( not ( = ?auto_1525470 ?auto_1525476 ) ) ( not ( = ?auto_1525470 ?auto_1525477 ) ) ( not ( = ?auto_1525470 ?auto_1525478 ) ) ( not ( = ?auto_1525471 ?auto_1525472 ) ) ( not ( = ?auto_1525471 ?auto_1525469 ) ) ( not ( = ?auto_1525471 ?auto_1525473 ) ) ( not ( = ?auto_1525471 ?auto_1525475 ) ) ( not ( = ?auto_1525471 ?auto_1525474 ) ) ( not ( = ?auto_1525471 ?auto_1525476 ) ) ( not ( = ?auto_1525471 ?auto_1525477 ) ) ( not ( = ?auto_1525471 ?auto_1525478 ) ) ( not ( = ?auto_1525472 ?auto_1525469 ) ) ( not ( = ?auto_1525472 ?auto_1525473 ) ) ( not ( = ?auto_1525472 ?auto_1525475 ) ) ( not ( = ?auto_1525472 ?auto_1525474 ) ) ( not ( = ?auto_1525472 ?auto_1525476 ) ) ( not ( = ?auto_1525472 ?auto_1525477 ) ) ( not ( = ?auto_1525472 ?auto_1525478 ) ) ( not ( = ?auto_1525469 ?auto_1525473 ) ) ( not ( = ?auto_1525469 ?auto_1525475 ) ) ( not ( = ?auto_1525469 ?auto_1525474 ) ) ( not ( = ?auto_1525469 ?auto_1525476 ) ) ( not ( = ?auto_1525469 ?auto_1525477 ) ) ( not ( = ?auto_1525469 ?auto_1525478 ) ) ( not ( = ?auto_1525473 ?auto_1525475 ) ) ( not ( = ?auto_1525473 ?auto_1525474 ) ) ( not ( = ?auto_1525473 ?auto_1525476 ) ) ( not ( = ?auto_1525473 ?auto_1525477 ) ) ( not ( = ?auto_1525473 ?auto_1525478 ) ) ( not ( = ?auto_1525475 ?auto_1525474 ) ) ( not ( = ?auto_1525475 ?auto_1525476 ) ) ( not ( = ?auto_1525475 ?auto_1525477 ) ) ( not ( = ?auto_1525475 ?auto_1525478 ) ) ( not ( = ?auto_1525474 ?auto_1525476 ) ) ( not ( = ?auto_1525474 ?auto_1525477 ) ) ( not ( = ?auto_1525474 ?auto_1525478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525476 ?auto_1525477 ?auto_1525478 )
      ( MAKE-9CRATE-VERIFY ?auto_1525470 ?auto_1525471 ?auto_1525472 ?auto_1525469 ?auto_1525473 ?auto_1525475 ?auto_1525474 ?auto_1525476 ?auto_1525477 ?auto_1525478 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1525560 - SURFACE
      ?auto_1525561 - SURFACE
      ?auto_1525562 - SURFACE
      ?auto_1525559 - SURFACE
      ?auto_1525563 - SURFACE
      ?auto_1525565 - SURFACE
      ?auto_1525564 - SURFACE
      ?auto_1525566 - SURFACE
      ?auto_1525567 - SURFACE
      ?auto_1525568 - SURFACE
    )
    :vars
    (
      ?auto_1525569 - HOIST
      ?auto_1525572 - PLACE
      ?auto_1525571 - TRUCK
      ?auto_1525570 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525569 ?auto_1525572 ) ( SURFACE-AT ?auto_1525567 ?auto_1525572 ) ( CLEAR ?auto_1525567 ) ( IS-CRATE ?auto_1525568 ) ( not ( = ?auto_1525567 ?auto_1525568 ) ) ( AVAILABLE ?auto_1525569 ) ( IN ?auto_1525568 ?auto_1525571 ) ( ON ?auto_1525567 ?auto_1525566 ) ( not ( = ?auto_1525566 ?auto_1525567 ) ) ( not ( = ?auto_1525566 ?auto_1525568 ) ) ( TRUCK-AT ?auto_1525571 ?auto_1525570 ) ( not ( = ?auto_1525570 ?auto_1525572 ) ) ( ON ?auto_1525561 ?auto_1525560 ) ( ON ?auto_1525562 ?auto_1525561 ) ( ON ?auto_1525559 ?auto_1525562 ) ( ON ?auto_1525563 ?auto_1525559 ) ( ON ?auto_1525565 ?auto_1525563 ) ( ON ?auto_1525564 ?auto_1525565 ) ( ON ?auto_1525566 ?auto_1525564 ) ( not ( = ?auto_1525560 ?auto_1525561 ) ) ( not ( = ?auto_1525560 ?auto_1525562 ) ) ( not ( = ?auto_1525560 ?auto_1525559 ) ) ( not ( = ?auto_1525560 ?auto_1525563 ) ) ( not ( = ?auto_1525560 ?auto_1525565 ) ) ( not ( = ?auto_1525560 ?auto_1525564 ) ) ( not ( = ?auto_1525560 ?auto_1525566 ) ) ( not ( = ?auto_1525560 ?auto_1525567 ) ) ( not ( = ?auto_1525560 ?auto_1525568 ) ) ( not ( = ?auto_1525561 ?auto_1525562 ) ) ( not ( = ?auto_1525561 ?auto_1525559 ) ) ( not ( = ?auto_1525561 ?auto_1525563 ) ) ( not ( = ?auto_1525561 ?auto_1525565 ) ) ( not ( = ?auto_1525561 ?auto_1525564 ) ) ( not ( = ?auto_1525561 ?auto_1525566 ) ) ( not ( = ?auto_1525561 ?auto_1525567 ) ) ( not ( = ?auto_1525561 ?auto_1525568 ) ) ( not ( = ?auto_1525562 ?auto_1525559 ) ) ( not ( = ?auto_1525562 ?auto_1525563 ) ) ( not ( = ?auto_1525562 ?auto_1525565 ) ) ( not ( = ?auto_1525562 ?auto_1525564 ) ) ( not ( = ?auto_1525562 ?auto_1525566 ) ) ( not ( = ?auto_1525562 ?auto_1525567 ) ) ( not ( = ?auto_1525562 ?auto_1525568 ) ) ( not ( = ?auto_1525559 ?auto_1525563 ) ) ( not ( = ?auto_1525559 ?auto_1525565 ) ) ( not ( = ?auto_1525559 ?auto_1525564 ) ) ( not ( = ?auto_1525559 ?auto_1525566 ) ) ( not ( = ?auto_1525559 ?auto_1525567 ) ) ( not ( = ?auto_1525559 ?auto_1525568 ) ) ( not ( = ?auto_1525563 ?auto_1525565 ) ) ( not ( = ?auto_1525563 ?auto_1525564 ) ) ( not ( = ?auto_1525563 ?auto_1525566 ) ) ( not ( = ?auto_1525563 ?auto_1525567 ) ) ( not ( = ?auto_1525563 ?auto_1525568 ) ) ( not ( = ?auto_1525565 ?auto_1525564 ) ) ( not ( = ?auto_1525565 ?auto_1525566 ) ) ( not ( = ?auto_1525565 ?auto_1525567 ) ) ( not ( = ?auto_1525565 ?auto_1525568 ) ) ( not ( = ?auto_1525564 ?auto_1525566 ) ) ( not ( = ?auto_1525564 ?auto_1525567 ) ) ( not ( = ?auto_1525564 ?auto_1525568 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525566 ?auto_1525567 ?auto_1525568 )
      ( MAKE-9CRATE-VERIFY ?auto_1525560 ?auto_1525561 ?auto_1525562 ?auto_1525559 ?auto_1525563 ?auto_1525565 ?auto_1525564 ?auto_1525566 ?auto_1525567 ?auto_1525568 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1525659 - SURFACE
      ?auto_1525660 - SURFACE
      ?auto_1525661 - SURFACE
      ?auto_1525658 - SURFACE
      ?auto_1525662 - SURFACE
      ?auto_1525664 - SURFACE
      ?auto_1525663 - SURFACE
      ?auto_1525665 - SURFACE
      ?auto_1525666 - SURFACE
      ?auto_1525667 - SURFACE
    )
    :vars
    (
      ?auto_1525669 - HOIST
      ?auto_1525672 - PLACE
      ?auto_1525670 - TRUCK
      ?auto_1525668 - PLACE
      ?auto_1525671 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525669 ?auto_1525672 ) ( SURFACE-AT ?auto_1525666 ?auto_1525672 ) ( CLEAR ?auto_1525666 ) ( IS-CRATE ?auto_1525667 ) ( not ( = ?auto_1525666 ?auto_1525667 ) ) ( AVAILABLE ?auto_1525669 ) ( ON ?auto_1525666 ?auto_1525665 ) ( not ( = ?auto_1525665 ?auto_1525666 ) ) ( not ( = ?auto_1525665 ?auto_1525667 ) ) ( TRUCK-AT ?auto_1525670 ?auto_1525668 ) ( not ( = ?auto_1525668 ?auto_1525672 ) ) ( HOIST-AT ?auto_1525671 ?auto_1525668 ) ( LIFTING ?auto_1525671 ?auto_1525667 ) ( not ( = ?auto_1525669 ?auto_1525671 ) ) ( ON ?auto_1525660 ?auto_1525659 ) ( ON ?auto_1525661 ?auto_1525660 ) ( ON ?auto_1525658 ?auto_1525661 ) ( ON ?auto_1525662 ?auto_1525658 ) ( ON ?auto_1525664 ?auto_1525662 ) ( ON ?auto_1525663 ?auto_1525664 ) ( ON ?auto_1525665 ?auto_1525663 ) ( not ( = ?auto_1525659 ?auto_1525660 ) ) ( not ( = ?auto_1525659 ?auto_1525661 ) ) ( not ( = ?auto_1525659 ?auto_1525658 ) ) ( not ( = ?auto_1525659 ?auto_1525662 ) ) ( not ( = ?auto_1525659 ?auto_1525664 ) ) ( not ( = ?auto_1525659 ?auto_1525663 ) ) ( not ( = ?auto_1525659 ?auto_1525665 ) ) ( not ( = ?auto_1525659 ?auto_1525666 ) ) ( not ( = ?auto_1525659 ?auto_1525667 ) ) ( not ( = ?auto_1525660 ?auto_1525661 ) ) ( not ( = ?auto_1525660 ?auto_1525658 ) ) ( not ( = ?auto_1525660 ?auto_1525662 ) ) ( not ( = ?auto_1525660 ?auto_1525664 ) ) ( not ( = ?auto_1525660 ?auto_1525663 ) ) ( not ( = ?auto_1525660 ?auto_1525665 ) ) ( not ( = ?auto_1525660 ?auto_1525666 ) ) ( not ( = ?auto_1525660 ?auto_1525667 ) ) ( not ( = ?auto_1525661 ?auto_1525658 ) ) ( not ( = ?auto_1525661 ?auto_1525662 ) ) ( not ( = ?auto_1525661 ?auto_1525664 ) ) ( not ( = ?auto_1525661 ?auto_1525663 ) ) ( not ( = ?auto_1525661 ?auto_1525665 ) ) ( not ( = ?auto_1525661 ?auto_1525666 ) ) ( not ( = ?auto_1525661 ?auto_1525667 ) ) ( not ( = ?auto_1525658 ?auto_1525662 ) ) ( not ( = ?auto_1525658 ?auto_1525664 ) ) ( not ( = ?auto_1525658 ?auto_1525663 ) ) ( not ( = ?auto_1525658 ?auto_1525665 ) ) ( not ( = ?auto_1525658 ?auto_1525666 ) ) ( not ( = ?auto_1525658 ?auto_1525667 ) ) ( not ( = ?auto_1525662 ?auto_1525664 ) ) ( not ( = ?auto_1525662 ?auto_1525663 ) ) ( not ( = ?auto_1525662 ?auto_1525665 ) ) ( not ( = ?auto_1525662 ?auto_1525666 ) ) ( not ( = ?auto_1525662 ?auto_1525667 ) ) ( not ( = ?auto_1525664 ?auto_1525663 ) ) ( not ( = ?auto_1525664 ?auto_1525665 ) ) ( not ( = ?auto_1525664 ?auto_1525666 ) ) ( not ( = ?auto_1525664 ?auto_1525667 ) ) ( not ( = ?auto_1525663 ?auto_1525665 ) ) ( not ( = ?auto_1525663 ?auto_1525666 ) ) ( not ( = ?auto_1525663 ?auto_1525667 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525665 ?auto_1525666 ?auto_1525667 )
      ( MAKE-9CRATE-VERIFY ?auto_1525659 ?auto_1525660 ?auto_1525661 ?auto_1525658 ?auto_1525662 ?auto_1525664 ?auto_1525663 ?auto_1525665 ?auto_1525666 ?auto_1525667 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1525767 - SURFACE
      ?auto_1525768 - SURFACE
      ?auto_1525769 - SURFACE
      ?auto_1525766 - SURFACE
      ?auto_1525770 - SURFACE
      ?auto_1525772 - SURFACE
      ?auto_1525771 - SURFACE
      ?auto_1525773 - SURFACE
      ?auto_1525774 - SURFACE
      ?auto_1525775 - SURFACE
    )
    :vars
    (
      ?auto_1525779 - HOIST
      ?auto_1525780 - PLACE
      ?auto_1525781 - TRUCK
      ?auto_1525776 - PLACE
      ?auto_1525777 - HOIST
      ?auto_1525778 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525779 ?auto_1525780 ) ( SURFACE-AT ?auto_1525774 ?auto_1525780 ) ( CLEAR ?auto_1525774 ) ( IS-CRATE ?auto_1525775 ) ( not ( = ?auto_1525774 ?auto_1525775 ) ) ( AVAILABLE ?auto_1525779 ) ( ON ?auto_1525774 ?auto_1525773 ) ( not ( = ?auto_1525773 ?auto_1525774 ) ) ( not ( = ?auto_1525773 ?auto_1525775 ) ) ( TRUCK-AT ?auto_1525781 ?auto_1525776 ) ( not ( = ?auto_1525776 ?auto_1525780 ) ) ( HOIST-AT ?auto_1525777 ?auto_1525776 ) ( not ( = ?auto_1525779 ?auto_1525777 ) ) ( AVAILABLE ?auto_1525777 ) ( SURFACE-AT ?auto_1525775 ?auto_1525776 ) ( ON ?auto_1525775 ?auto_1525778 ) ( CLEAR ?auto_1525775 ) ( not ( = ?auto_1525774 ?auto_1525778 ) ) ( not ( = ?auto_1525775 ?auto_1525778 ) ) ( not ( = ?auto_1525773 ?auto_1525778 ) ) ( ON ?auto_1525768 ?auto_1525767 ) ( ON ?auto_1525769 ?auto_1525768 ) ( ON ?auto_1525766 ?auto_1525769 ) ( ON ?auto_1525770 ?auto_1525766 ) ( ON ?auto_1525772 ?auto_1525770 ) ( ON ?auto_1525771 ?auto_1525772 ) ( ON ?auto_1525773 ?auto_1525771 ) ( not ( = ?auto_1525767 ?auto_1525768 ) ) ( not ( = ?auto_1525767 ?auto_1525769 ) ) ( not ( = ?auto_1525767 ?auto_1525766 ) ) ( not ( = ?auto_1525767 ?auto_1525770 ) ) ( not ( = ?auto_1525767 ?auto_1525772 ) ) ( not ( = ?auto_1525767 ?auto_1525771 ) ) ( not ( = ?auto_1525767 ?auto_1525773 ) ) ( not ( = ?auto_1525767 ?auto_1525774 ) ) ( not ( = ?auto_1525767 ?auto_1525775 ) ) ( not ( = ?auto_1525767 ?auto_1525778 ) ) ( not ( = ?auto_1525768 ?auto_1525769 ) ) ( not ( = ?auto_1525768 ?auto_1525766 ) ) ( not ( = ?auto_1525768 ?auto_1525770 ) ) ( not ( = ?auto_1525768 ?auto_1525772 ) ) ( not ( = ?auto_1525768 ?auto_1525771 ) ) ( not ( = ?auto_1525768 ?auto_1525773 ) ) ( not ( = ?auto_1525768 ?auto_1525774 ) ) ( not ( = ?auto_1525768 ?auto_1525775 ) ) ( not ( = ?auto_1525768 ?auto_1525778 ) ) ( not ( = ?auto_1525769 ?auto_1525766 ) ) ( not ( = ?auto_1525769 ?auto_1525770 ) ) ( not ( = ?auto_1525769 ?auto_1525772 ) ) ( not ( = ?auto_1525769 ?auto_1525771 ) ) ( not ( = ?auto_1525769 ?auto_1525773 ) ) ( not ( = ?auto_1525769 ?auto_1525774 ) ) ( not ( = ?auto_1525769 ?auto_1525775 ) ) ( not ( = ?auto_1525769 ?auto_1525778 ) ) ( not ( = ?auto_1525766 ?auto_1525770 ) ) ( not ( = ?auto_1525766 ?auto_1525772 ) ) ( not ( = ?auto_1525766 ?auto_1525771 ) ) ( not ( = ?auto_1525766 ?auto_1525773 ) ) ( not ( = ?auto_1525766 ?auto_1525774 ) ) ( not ( = ?auto_1525766 ?auto_1525775 ) ) ( not ( = ?auto_1525766 ?auto_1525778 ) ) ( not ( = ?auto_1525770 ?auto_1525772 ) ) ( not ( = ?auto_1525770 ?auto_1525771 ) ) ( not ( = ?auto_1525770 ?auto_1525773 ) ) ( not ( = ?auto_1525770 ?auto_1525774 ) ) ( not ( = ?auto_1525770 ?auto_1525775 ) ) ( not ( = ?auto_1525770 ?auto_1525778 ) ) ( not ( = ?auto_1525772 ?auto_1525771 ) ) ( not ( = ?auto_1525772 ?auto_1525773 ) ) ( not ( = ?auto_1525772 ?auto_1525774 ) ) ( not ( = ?auto_1525772 ?auto_1525775 ) ) ( not ( = ?auto_1525772 ?auto_1525778 ) ) ( not ( = ?auto_1525771 ?auto_1525773 ) ) ( not ( = ?auto_1525771 ?auto_1525774 ) ) ( not ( = ?auto_1525771 ?auto_1525775 ) ) ( not ( = ?auto_1525771 ?auto_1525778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525773 ?auto_1525774 ?auto_1525775 )
      ( MAKE-9CRATE-VERIFY ?auto_1525767 ?auto_1525768 ?auto_1525769 ?auto_1525766 ?auto_1525770 ?auto_1525772 ?auto_1525771 ?auto_1525773 ?auto_1525774 ?auto_1525775 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1525876 - SURFACE
      ?auto_1525877 - SURFACE
      ?auto_1525878 - SURFACE
      ?auto_1525875 - SURFACE
      ?auto_1525879 - SURFACE
      ?auto_1525881 - SURFACE
      ?auto_1525880 - SURFACE
      ?auto_1525882 - SURFACE
      ?auto_1525883 - SURFACE
      ?auto_1525884 - SURFACE
    )
    :vars
    (
      ?auto_1525887 - HOIST
      ?auto_1525890 - PLACE
      ?auto_1525888 - PLACE
      ?auto_1525889 - HOIST
      ?auto_1525886 - SURFACE
      ?auto_1525885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525887 ?auto_1525890 ) ( SURFACE-AT ?auto_1525883 ?auto_1525890 ) ( CLEAR ?auto_1525883 ) ( IS-CRATE ?auto_1525884 ) ( not ( = ?auto_1525883 ?auto_1525884 ) ) ( AVAILABLE ?auto_1525887 ) ( ON ?auto_1525883 ?auto_1525882 ) ( not ( = ?auto_1525882 ?auto_1525883 ) ) ( not ( = ?auto_1525882 ?auto_1525884 ) ) ( not ( = ?auto_1525888 ?auto_1525890 ) ) ( HOIST-AT ?auto_1525889 ?auto_1525888 ) ( not ( = ?auto_1525887 ?auto_1525889 ) ) ( AVAILABLE ?auto_1525889 ) ( SURFACE-AT ?auto_1525884 ?auto_1525888 ) ( ON ?auto_1525884 ?auto_1525886 ) ( CLEAR ?auto_1525884 ) ( not ( = ?auto_1525883 ?auto_1525886 ) ) ( not ( = ?auto_1525884 ?auto_1525886 ) ) ( not ( = ?auto_1525882 ?auto_1525886 ) ) ( TRUCK-AT ?auto_1525885 ?auto_1525890 ) ( ON ?auto_1525877 ?auto_1525876 ) ( ON ?auto_1525878 ?auto_1525877 ) ( ON ?auto_1525875 ?auto_1525878 ) ( ON ?auto_1525879 ?auto_1525875 ) ( ON ?auto_1525881 ?auto_1525879 ) ( ON ?auto_1525880 ?auto_1525881 ) ( ON ?auto_1525882 ?auto_1525880 ) ( not ( = ?auto_1525876 ?auto_1525877 ) ) ( not ( = ?auto_1525876 ?auto_1525878 ) ) ( not ( = ?auto_1525876 ?auto_1525875 ) ) ( not ( = ?auto_1525876 ?auto_1525879 ) ) ( not ( = ?auto_1525876 ?auto_1525881 ) ) ( not ( = ?auto_1525876 ?auto_1525880 ) ) ( not ( = ?auto_1525876 ?auto_1525882 ) ) ( not ( = ?auto_1525876 ?auto_1525883 ) ) ( not ( = ?auto_1525876 ?auto_1525884 ) ) ( not ( = ?auto_1525876 ?auto_1525886 ) ) ( not ( = ?auto_1525877 ?auto_1525878 ) ) ( not ( = ?auto_1525877 ?auto_1525875 ) ) ( not ( = ?auto_1525877 ?auto_1525879 ) ) ( not ( = ?auto_1525877 ?auto_1525881 ) ) ( not ( = ?auto_1525877 ?auto_1525880 ) ) ( not ( = ?auto_1525877 ?auto_1525882 ) ) ( not ( = ?auto_1525877 ?auto_1525883 ) ) ( not ( = ?auto_1525877 ?auto_1525884 ) ) ( not ( = ?auto_1525877 ?auto_1525886 ) ) ( not ( = ?auto_1525878 ?auto_1525875 ) ) ( not ( = ?auto_1525878 ?auto_1525879 ) ) ( not ( = ?auto_1525878 ?auto_1525881 ) ) ( not ( = ?auto_1525878 ?auto_1525880 ) ) ( not ( = ?auto_1525878 ?auto_1525882 ) ) ( not ( = ?auto_1525878 ?auto_1525883 ) ) ( not ( = ?auto_1525878 ?auto_1525884 ) ) ( not ( = ?auto_1525878 ?auto_1525886 ) ) ( not ( = ?auto_1525875 ?auto_1525879 ) ) ( not ( = ?auto_1525875 ?auto_1525881 ) ) ( not ( = ?auto_1525875 ?auto_1525880 ) ) ( not ( = ?auto_1525875 ?auto_1525882 ) ) ( not ( = ?auto_1525875 ?auto_1525883 ) ) ( not ( = ?auto_1525875 ?auto_1525884 ) ) ( not ( = ?auto_1525875 ?auto_1525886 ) ) ( not ( = ?auto_1525879 ?auto_1525881 ) ) ( not ( = ?auto_1525879 ?auto_1525880 ) ) ( not ( = ?auto_1525879 ?auto_1525882 ) ) ( not ( = ?auto_1525879 ?auto_1525883 ) ) ( not ( = ?auto_1525879 ?auto_1525884 ) ) ( not ( = ?auto_1525879 ?auto_1525886 ) ) ( not ( = ?auto_1525881 ?auto_1525880 ) ) ( not ( = ?auto_1525881 ?auto_1525882 ) ) ( not ( = ?auto_1525881 ?auto_1525883 ) ) ( not ( = ?auto_1525881 ?auto_1525884 ) ) ( not ( = ?auto_1525881 ?auto_1525886 ) ) ( not ( = ?auto_1525880 ?auto_1525882 ) ) ( not ( = ?auto_1525880 ?auto_1525883 ) ) ( not ( = ?auto_1525880 ?auto_1525884 ) ) ( not ( = ?auto_1525880 ?auto_1525886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525882 ?auto_1525883 ?auto_1525884 )
      ( MAKE-9CRATE-VERIFY ?auto_1525876 ?auto_1525877 ?auto_1525878 ?auto_1525875 ?auto_1525879 ?auto_1525881 ?auto_1525880 ?auto_1525882 ?auto_1525883 ?auto_1525884 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1525985 - SURFACE
      ?auto_1525986 - SURFACE
      ?auto_1525987 - SURFACE
      ?auto_1525984 - SURFACE
      ?auto_1525988 - SURFACE
      ?auto_1525990 - SURFACE
      ?auto_1525989 - SURFACE
      ?auto_1525991 - SURFACE
      ?auto_1525992 - SURFACE
      ?auto_1525993 - SURFACE
    )
    :vars
    (
      ?auto_1525998 - HOIST
      ?auto_1525994 - PLACE
      ?auto_1525999 - PLACE
      ?auto_1525996 - HOIST
      ?auto_1525995 - SURFACE
      ?auto_1525997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525998 ?auto_1525994 ) ( IS-CRATE ?auto_1525993 ) ( not ( = ?auto_1525992 ?auto_1525993 ) ) ( not ( = ?auto_1525991 ?auto_1525992 ) ) ( not ( = ?auto_1525991 ?auto_1525993 ) ) ( not ( = ?auto_1525999 ?auto_1525994 ) ) ( HOIST-AT ?auto_1525996 ?auto_1525999 ) ( not ( = ?auto_1525998 ?auto_1525996 ) ) ( AVAILABLE ?auto_1525996 ) ( SURFACE-AT ?auto_1525993 ?auto_1525999 ) ( ON ?auto_1525993 ?auto_1525995 ) ( CLEAR ?auto_1525993 ) ( not ( = ?auto_1525992 ?auto_1525995 ) ) ( not ( = ?auto_1525993 ?auto_1525995 ) ) ( not ( = ?auto_1525991 ?auto_1525995 ) ) ( TRUCK-AT ?auto_1525997 ?auto_1525994 ) ( SURFACE-AT ?auto_1525991 ?auto_1525994 ) ( CLEAR ?auto_1525991 ) ( LIFTING ?auto_1525998 ?auto_1525992 ) ( IS-CRATE ?auto_1525992 ) ( ON ?auto_1525986 ?auto_1525985 ) ( ON ?auto_1525987 ?auto_1525986 ) ( ON ?auto_1525984 ?auto_1525987 ) ( ON ?auto_1525988 ?auto_1525984 ) ( ON ?auto_1525990 ?auto_1525988 ) ( ON ?auto_1525989 ?auto_1525990 ) ( ON ?auto_1525991 ?auto_1525989 ) ( not ( = ?auto_1525985 ?auto_1525986 ) ) ( not ( = ?auto_1525985 ?auto_1525987 ) ) ( not ( = ?auto_1525985 ?auto_1525984 ) ) ( not ( = ?auto_1525985 ?auto_1525988 ) ) ( not ( = ?auto_1525985 ?auto_1525990 ) ) ( not ( = ?auto_1525985 ?auto_1525989 ) ) ( not ( = ?auto_1525985 ?auto_1525991 ) ) ( not ( = ?auto_1525985 ?auto_1525992 ) ) ( not ( = ?auto_1525985 ?auto_1525993 ) ) ( not ( = ?auto_1525985 ?auto_1525995 ) ) ( not ( = ?auto_1525986 ?auto_1525987 ) ) ( not ( = ?auto_1525986 ?auto_1525984 ) ) ( not ( = ?auto_1525986 ?auto_1525988 ) ) ( not ( = ?auto_1525986 ?auto_1525990 ) ) ( not ( = ?auto_1525986 ?auto_1525989 ) ) ( not ( = ?auto_1525986 ?auto_1525991 ) ) ( not ( = ?auto_1525986 ?auto_1525992 ) ) ( not ( = ?auto_1525986 ?auto_1525993 ) ) ( not ( = ?auto_1525986 ?auto_1525995 ) ) ( not ( = ?auto_1525987 ?auto_1525984 ) ) ( not ( = ?auto_1525987 ?auto_1525988 ) ) ( not ( = ?auto_1525987 ?auto_1525990 ) ) ( not ( = ?auto_1525987 ?auto_1525989 ) ) ( not ( = ?auto_1525987 ?auto_1525991 ) ) ( not ( = ?auto_1525987 ?auto_1525992 ) ) ( not ( = ?auto_1525987 ?auto_1525993 ) ) ( not ( = ?auto_1525987 ?auto_1525995 ) ) ( not ( = ?auto_1525984 ?auto_1525988 ) ) ( not ( = ?auto_1525984 ?auto_1525990 ) ) ( not ( = ?auto_1525984 ?auto_1525989 ) ) ( not ( = ?auto_1525984 ?auto_1525991 ) ) ( not ( = ?auto_1525984 ?auto_1525992 ) ) ( not ( = ?auto_1525984 ?auto_1525993 ) ) ( not ( = ?auto_1525984 ?auto_1525995 ) ) ( not ( = ?auto_1525988 ?auto_1525990 ) ) ( not ( = ?auto_1525988 ?auto_1525989 ) ) ( not ( = ?auto_1525988 ?auto_1525991 ) ) ( not ( = ?auto_1525988 ?auto_1525992 ) ) ( not ( = ?auto_1525988 ?auto_1525993 ) ) ( not ( = ?auto_1525988 ?auto_1525995 ) ) ( not ( = ?auto_1525990 ?auto_1525989 ) ) ( not ( = ?auto_1525990 ?auto_1525991 ) ) ( not ( = ?auto_1525990 ?auto_1525992 ) ) ( not ( = ?auto_1525990 ?auto_1525993 ) ) ( not ( = ?auto_1525990 ?auto_1525995 ) ) ( not ( = ?auto_1525989 ?auto_1525991 ) ) ( not ( = ?auto_1525989 ?auto_1525992 ) ) ( not ( = ?auto_1525989 ?auto_1525993 ) ) ( not ( = ?auto_1525989 ?auto_1525995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525991 ?auto_1525992 ?auto_1525993 )
      ( MAKE-9CRATE-VERIFY ?auto_1525985 ?auto_1525986 ?auto_1525987 ?auto_1525984 ?auto_1525988 ?auto_1525990 ?auto_1525989 ?auto_1525991 ?auto_1525992 ?auto_1525993 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1526094 - SURFACE
      ?auto_1526095 - SURFACE
      ?auto_1526096 - SURFACE
      ?auto_1526093 - SURFACE
      ?auto_1526097 - SURFACE
      ?auto_1526099 - SURFACE
      ?auto_1526098 - SURFACE
      ?auto_1526100 - SURFACE
      ?auto_1526101 - SURFACE
      ?auto_1526102 - SURFACE
    )
    :vars
    (
      ?auto_1526103 - HOIST
      ?auto_1526108 - PLACE
      ?auto_1526105 - PLACE
      ?auto_1526104 - HOIST
      ?auto_1526107 - SURFACE
      ?auto_1526106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526103 ?auto_1526108 ) ( IS-CRATE ?auto_1526102 ) ( not ( = ?auto_1526101 ?auto_1526102 ) ) ( not ( = ?auto_1526100 ?auto_1526101 ) ) ( not ( = ?auto_1526100 ?auto_1526102 ) ) ( not ( = ?auto_1526105 ?auto_1526108 ) ) ( HOIST-AT ?auto_1526104 ?auto_1526105 ) ( not ( = ?auto_1526103 ?auto_1526104 ) ) ( AVAILABLE ?auto_1526104 ) ( SURFACE-AT ?auto_1526102 ?auto_1526105 ) ( ON ?auto_1526102 ?auto_1526107 ) ( CLEAR ?auto_1526102 ) ( not ( = ?auto_1526101 ?auto_1526107 ) ) ( not ( = ?auto_1526102 ?auto_1526107 ) ) ( not ( = ?auto_1526100 ?auto_1526107 ) ) ( TRUCK-AT ?auto_1526106 ?auto_1526108 ) ( SURFACE-AT ?auto_1526100 ?auto_1526108 ) ( CLEAR ?auto_1526100 ) ( IS-CRATE ?auto_1526101 ) ( AVAILABLE ?auto_1526103 ) ( IN ?auto_1526101 ?auto_1526106 ) ( ON ?auto_1526095 ?auto_1526094 ) ( ON ?auto_1526096 ?auto_1526095 ) ( ON ?auto_1526093 ?auto_1526096 ) ( ON ?auto_1526097 ?auto_1526093 ) ( ON ?auto_1526099 ?auto_1526097 ) ( ON ?auto_1526098 ?auto_1526099 ) ( ON ?auto_1526100 ?auto_1526098 ) ( not ( = ?auto_1526094 ?auto_1526095 ) ) ( not ( = ?auto_1526094 ?auto_1526096 ) ) ( not ( = ?auto_1526094 ?auto_1526093 ) ) ( not ( = ?auto_1526094 ?auto_1526097 ) ) ( not ( = ?auto_1526094 ?auto_1526099 ) ) ( not ( = ?auto_1526094 ?auto_1526098 ) ) ( not ( = ?auto_1526094 ?auto_1526100 ) ) ( not ( = ?auto_1526094 ?auto_1526101 ) ) ( not ( = ?auto_1526094 ?auto_1526102 ) ) ( not ( = ?auto_1526094 ?auto_1526107 ) ) ( not ( = ?auto_1526095 ?auto_1526096 ) ) ( not ( = ?auto_1526095 ?auto_1526093 ) ) ( not ( = ?auto_1526095 ?auto_1526097 ) ) ( not ( = ?auto_1526095 ?auto_1526099 ) ) ( not ( = ?auto_1526095 ?auto_1526098 ) ) ( not ( = ?auto_1526095 ?auto_1526100 ) ) ( not ( = ?auto_1526095 ?auto_1526101 ) ) ( not ( = ?auto_1526095 ?auto_1526102 ) ) ( not ( = ?auto_1526095 ?auto_1526107 ) ) ( not ( = ?auto_1526096 ?auto_1526093 ) ) ( not ( = ?auto_1526096 ?auto_1526097 ) ) ( not ( = ?auto_1526096 ?auto_1526099 ) ) ( not ( = ?auto_1526096 ?auto_1526098 ) ) ( not ( = ?auto_1526096 ?auto_1526100 ) ) ( not ( = ?auto_1526096 ?auto_1526101 ) ) ( not ( = ?auto_1526096 ?auto_1526102 ) ) ( not ( = ?auto_1526096 ?auto_1526107 ) ) ( not ( = ?auto_1526093 ?auto_1526097 ) ) ( not ( = ?auto_1526093 ?auto_1526099 ) ) ( not ( = ?auto_1526093 ?auto_1526098 ) ) ( not ( = ?auto_1526093 ?auto_1526100 ) ) ( not ( = ?auto_1526093 ?auto_1526101 ) ) ( not ( = ?auto_1526093 ?auto_1526102 ) ) ( not ( = ?auto_1526093 ?auto_1526107 ) ) ( not ( = ?auto_1526097 ?auto_1526099 ) ) ( not ( = ?auto_1526097 ?auto_1526098 ) ) ( not ( = ?auto_1526097 ?auto_1526100 ) ) ( not ( = ?auto_1526097 ?auto_1526101 ) ) ( not ( = ?auto_1526097 ?auto_1526102 ) ) ( not ( = ?auto_1526097 ?auto_1526107 ) ) ( not ( = ?auto_1526099 ?auto_1526098 ) ) ( not ( = ?auto_1526099 ?auto_1526100 ) ) ( not ( = ?auto_1526099 ?auto_1526101 ) ) ( not ( = ?auto_1526099 ?auto_1526102 ) ) ( not ( = ?auto_1526099 ?auto_1526107 ) ) ( not ( = ?auto_1526098 ?auto_1526100 ) ) ( not ( = ?auto_1526098 ?auto_1526101 ) ) ( not ( = ?auto_1526098 ?auto_1526102 ) ) ( not ( = ?auto_1526098 ?auto_1526107 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526100 ?auto_1526101 ?auto_1526102 )
      ( MAKE-9CRATE-VERIFY ?auto_1526094 ?auto_1526095 ?auto_1526096 ?auto_1526093 ?auto_1526097 ?auto_1526099 ?auto_1526098 ?auto_1526100 ?auto_1526101 ?auto_1526102 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1531659 - SURFACE
      ?auto_1531660 - SURFACE
      ?auto_1531661 - SURFACE
      ?auto_1531658 - SURFACE
      ?auto_1531662 - SURFACE
      ?auto_1531664 - SURFACE
      ?auto_1531663 - SURFACE
      ?auto_1531665 - SURFACE
      ?auto_1531666 - SURFACE
      ?auto_1531667 - SURFACE
      ?auto_1531668 - SURFACE
    )
    :vars
    (
      ?auto_1531670 - HOIST
      ?auto_1531669 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1531670 ?auto_1531669 ) ( SURFACE-AT ?auto_1531667 ?auto_1531669 ) ( CLEAR ?auto_1531667 ) ( LIFTING ?auto_1531670 ?auto_1531668 ) ( IS-CRATE ?auto_1531668 ) ( not ( = ?auto_1531667 ?auto_1531668 ) ) ( ON ?auto_1531660 ?auto_1531659 ) ( ON ?auto_1531661 ?auto_1531660 ) ( ON ?auto_1531658 ?auto_1531661 ) ( ON ?auto_1531662 ?auto_1531658 ) ( ON ?auto_1531664 ?auto_1531662 ) ( ON ?auto_1531663 ?auto_1531664 ) ( ON ?auto_1531665 ?auto_1531663 ) ( ON ?auto_1531666 ?auto_1531665 ) ( ON ?auto_1531667 ?auto_1531666 ) ( not ( = ?auto_1531659 ?auto_1531660 ) ) ( not ( = ?auto_1531659 ?auto_1531661 ) ) ( not ( = ?auto_1531659 ?auto_1531658 ) ) ( not ( = ?auto_1531659 ?auto_1531662 ) ) ( not ( = ?auto_1531659 ?auto_1531664 ) ) ( not ( = ?auto_1531659 ?auto_1531663 ) ) ( not ( = ?auto_1531659 ?auto_1531665 ) ) ( not ( = ?auto_1531659 ?auto_1531666 ) ) ( not ( = ?auto_1531659 ?auto_1531667 ) ) ( not ( = ?auto_1531659 ?auto_1531668 ) ) ( not ( = ?auto_1531660 ?auto_1531661 ) ) ( not ( = ?auto_1531660 ?auto_1531658 ) ) ( not ( = ?auto_1531660 ?auto_1531662 ) ) ( not ( = ?auto_1531660 ?auto_1531664 ) ) ( not ( = ?auto_1531660 ?auto_1531663 ) ) ( not ( = ?auto_1531660 ?auto_1531665 ) ) ( not ( = ?auto_1531660 ?auto_1531666 ) ) ( not ( = ?auto_1531660 ?auto_1531667 ) ) ( not ( = ?auto_1531660 ?auto_1531668 ) ) ( not ( = ?auto_1531661 ?auto_1531658 ) ) ( not ( = ?auto_1531661 ?auto_1531662 ) ) ( not ( = ?auto_1531661 ?auto_1531664 ) ) ( not ( = ?auto_1531661 ?auto_1531663 ) ) ( not ( = ?auto_1531661 ?auto_1531665 ) ) ( not ( = ?auto_1531661 ?auto_1531666 ) ) ( not ( = ?auto_1531661 ?auto_1531667 ) ) ( not ( = ?auto_1531661 ?auto_1531668 ) ) ( not ( = ?auto_1531658 ?auto_1531662 ) ) ( not ( = ?auto_1531658 ?auto_1531664 ) ) ( not ( = ?auto_1531658 ?auto_1531663 ) ) ( not ( = ?auto_1531658 ?auto_1531665 ) ) ( not ( = ?auto_1531658 ?auto_1531666 ) ) ( not ( = ?auto_1531658 ?auto_1531667 ) ) ( not ( = ?auto_1531658 ?auto_1531668 ) ) ( not ( = ?auto_1531662 ?auto_1531664 ) ) ( not ( = ?auto_1531662 ?auto_1531663 ) ) ( not ( = ?auto_1531662 ?auto_1531665 ) ) ( not ( = ?auto_1531662 ?auto_1531666 ) ) ( not ( = ?auto_1531662 ?auto_1531667 ) ) ( not ( = ?auto_1531662 ?auto_1531668 ) ) ( not ( = ?auto_1531664 ?auto_1531663 ) ) ( not ( = ?auto_1531664 ?auto_1531665 ) ) ( not ( = ?auto_1531664 ?auto_1531666 ) ) ( not ( = ?auto_1531664 ?auto_1531667 ) ) ( not ( = ?auto_1531664 ?auto_1531668 ) ) ( not ( = ?auto_1531663 ?auto_1531665 ) ) ( not ( = ?auto_1531663 ?auto_1531666 ) ) ( not ( = ?auto_1531663 ?auto_1531667 ) ) ( not ( = ?auto_1531663 ?auto_1531668 ) ) ( not ( = ?auto_1531665 ?auto_1531666 ) ) ( not ( = ?auto_1531665 ?auto_1531667 ) ) ( not ( = ?auto_1531665 ?auto_1531668 ) ) ( not ( = ?auto_1531666 ?auto_1531667 ) ) ( not ( = ?auto_1531666 ?auto_1531668 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1531667 ?auto_1531668 )
      ( MAKE-10CRATE-VERIFY ?auto_1531659 ?auto_1531660 ?auto_1531661 ?auto_1531658 ?auto_1531662 ?auto_1531664 ?auto_1531663 ?auto_1531665 ?auto_1531666 ?auto_1531667 ?auto_1531668 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1531753 - SURFACE
      ?auto_1531754 - SURFACE
      ?auto_1531755 - SURFACE
      ?auto_1531752 - SURFACE
      ?auto_1531756 - SURFACE
      ?auto_1531758 - SURFACE
      ?auto_1531757 - SURFACE
      ?auto_1531759 - SURFACE
      ?auto_1531760 - SURFACE
      ?auto_1531761 - SURFACE
      ?auto_1531762 - SURFACE
    )
    :vars
    (
      ?auto_1531764 - HOIST
      ?auto_1531765 - PLACE
      ?auto_1531763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1531764 ?auto_1531765 ) ( SURFACE-AT ?auto_1531761 ?auto_1531765 ) ( CLEAR ?auto_1531761 ) ( IS-CRATE ?auto_1531762 ) ( not ( = ?auto_1531761 ?auto_1531762 ) ) ( TRUCK-AT ?auto_1531763 ?auto_1531765 ) ( AVAILABLE ?auto_1531764 ) ( IN ?auto_1531762 ?auto_1531763 ) ( ON ?auto_1531761 ?auto_1531760 ) ( not ( = ?auto_1531760 ?auto_1531761 ) ) ( not ( = ?auto_1531760 ?auto_1531762 ) ) ( ON ?auto_1531754 ?auto_1531753 ) ( ON ?auto_1531755 ?auto_1531754 ) ( ON ?auto_1531752 ?auto_1531755 ) ( ON ?auto_1531756 ?auto_1531752 ) ( ON ?auto_1531758 ?auto_1531756 ) ( ON ?auto_1531757 ?auto_1531758 ) ( ON ?auto_1531759 ?auto_1531757 ) ( ON ?auto_1531760 ?auto_1531759 ) ( not ( = ?auto_1531753 ?auto_1531754 ) ) ( not ( = ?auto_1531753 ?auto_1531755 ) ) ( not ( = ?auto_1531753 ?auto_1531752 ) ) ( not ( = ?auto_1531753 ?auto_1531756 ) ) ( not ( = ?auto_1531753 ?auto_1531758 ) ) ( not ( = ?auto_1531753 ?auto_1531757 ) ) ( not ( = ?auto_1531753 ?auto_1531759 ) ) ( not ( = ?auto_1531753 ?auto_1531760 ) ) ( not ( = ?auto_1531753 ?auto_1531761 ) ) ( not ( = ?auto_1531753 ?auto_1531762 ) ) ( not ( = ?auto_1531754 ?auto_1531755 ) ) ( not ( = ?auto_1531754 ?auto_1531752 ) ) ( not ( = ?auto_1531754 ?auto_1531756 ) ) ( not ( = ?auto_1531754 ?auto_1531758 ) ) ( not ( = ?auto_1531754 ?auto_1531757 ) ) ( not ( = ?auto_1531754 ?auto_1531759 ) ) ( not ( = ?auto_1531754 ?auto_1531760 ) ) ( not ( = ?auto_1531754 ?auto_1531761 ) ) ( not ( = ?auto_1531754 ?auto_1531762 ) ) ( not ( = ?auto_1531755 ?auto_1531752 ) ) ( not ( = ?auto_1531755 ?auto_1531756 ) ) ( not ( = ?auto_1531755 ?auto_1531758 ) ) ( not ( = ?auto_1531755 ?auto_1531757 ) ) ( not ( = ?auto_1531755 ?auto_1531759 ) ) ( not ( = ?auto_1531755 ?auto_1531760 ) ) ( not ( = ?auto_1531755 ?auto_1531761 ) ) ( not ( = ?auto_1531755 ?auto_1531762 ) ) ( not ( = ?auto_1531752 ?auto_1531756 ) ) ( not ( = ?auto_1531752 ?auto_1531758 ) ) ( not ( = ?auto_1531752 ?auto_1531757 ) ) ( not ( = ?auto_1531752 ?auto_1531759 ) ) ( not ( = ?auto_1531752 ?auto_1531760 ) ) ( not ( = ?auto_1531752 ?auto_1531761 ) ) ( not ( = ?auto_1531752 ?auto_1531762 ) ) ( not ( = ?auto_1531756 ?auto_1531758 ) ) ( not ( = ?auto_1531756 ?auto_1531757 ) ) ( not ( = ?auto_1531756 ?auto_1531759 ) ) ( not ( = ?auto_1531756 ?auto_1531760 ) ) ( not ( = ?auto_1531756 ?auto_1531761 ) ) ( not ( = ?auto_1531756 ?auto_1531762 ) ) ( not ( = ?auto_1531758 ?auto_1531757 ) ) ( not ( = ?auto_1531758 ?auto_1531759 ) ) ( not ( = ?auto_1531758 ?auto_1531760 ) ) ( not ( = ?auto_1531758 ?auto_1531761 ) ) ( not ( = ?auto_1531758 ?auto_1531762 ) ) ( not ( = ?auto_1531757 ?auto_1531759 ) ) ( not ( = ?auto_1531757 ?auto_1531760 ) ) ( not ( = ?auto_1531757 ?auto_1531761 ) ) ( not ( = ?auto_1531757 ?auto_1531762 ) ) ( not ( = ?auto_1531759 ?auto_1531760 ) ) ( not ( = ?auto_1531759 ?auto_1531761 ) ) ( not ( = ?auto_1531759 ?auto_1531762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1531760 ?auto_1531761 ?auto_1531762 )
      ( MAKE-10CRATE-VERIFY ?auto_1531753 ?auto_1531754 ?auto_1531755 ?auto_1531752 ?auto_1531756 ?auto_1531758 ?auto_1531757 ?auto_1531759 ?auto_1531760 ?auto_1531761 ?auto_1531762 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1531858 - SURFACE
      ?auto_1531859 - SURFACE
      ?auto_1531860 - SURFACE
      ?auto_1531857 - SURFACE
      ?auto_1531861 - SURFACE
      ?auto_1531863 - SURFACE
      ?auto_1531862 - SURFACE
      ?auto_1531864 - SURFACE
      ?auto_1531865 - SURFACE
      ?auto_1531866 - SURFACE
      ?auto_1531867 - SURFACE
    )
    :vars
    (
      ?auto_1531869 - HOIST
      ?auto_1531871 - PLACE
      ?auto_1531870 - TRUCK
      ?auto_1531868 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1531869 ?auto_1531871 ) ( SURFACE-AT ?auto_1531866 ?auto_1531871 ) ( CLEAR ?auto_1531866 ) ( IS-CRATE ?auto_1531867 ) ( not ( = ?auto_1531866 ?auto_1531867 ) ) ( AVAILABLE ?auto_1531869 ) ( IN ?auto_1531867 ?auto_1531870 ) ( ON ?auto_1531866 ?auto_1531865 ) ( not ( = ?auto_1531865 ?auto_1531866 ) ) ( not ( = ?auto_1531865 ?auto_1531867 ) ) ( TRUCK-AT ?auto_1531870 ?auto_1531868 ) ( not ( = ?auto_1531868 ?auto_1531871 ) ) ( ON ?auto_1531859 ?auto_1531858 ) ( ON ?auto_1531860 ?auto_1531859 ) ( ON ?auto_1531857 ?auto_1531860 ) ( ON ?auto_1531861 ?auto_1531857 ) ( ON ?auto_1531863 ?auto_1531861 ) ( ON ?auto_1531862 ?auto_1531863 ) ( ON ?auto_1531864 ?auto_1531862 ) ( ON ?auto_1531865 ?auto_1531864 ) ( not ( = ?auto_1531858 ?auto_1531859 ) ) ( not ( = ?auto_1531858 ?auto_1531860 ) ) ( not ( = ?auto_1531858 ?auto_1531857 ) ) ( not ( = ?auto_1531858 ?auto_1531861 ) ) ( not ( = ?auto_1531858 ?auto_1531863 ) ) ( not ( = ?auto_1531858 ?auto_1531862 ) ) ( not ( = ?auto_1531858 ?auto_1531864 ) ) ( not ( = ?auto_1531858 ?auto_1531865 ) ) ( not ( = ?auto_1531858 ?auto_1531866 ) ) ( not ( = ?auto_1531858 ?auto_1531867 ) ) ( not ( = ?auto_1531859 ?auto_1531860 ) ) ( not ( = ?auto_1531859 ?auto_1531857 ) ) ( not ( = ?auto_1531859 ?auto_1531861 ) ) ( not ( = ?auto_1531859 ?auto_1531863 ) ) ( not ( = ?auto_1531859 ?auto_1531862 ) ) ( not ( = ?auto_1531859 ?auto_1531864 ) ) ( not ( = ?auto_1531859 ?auto_1531865 ) ) ( not ( = ?auto_1531859 ?auto_1531866 ) ) ( not ( = ?auto_1531859 ?auto_1531867 ) ) ( not ( = ?auto_1531860 ?auto_1531857 ) ) ( not ( = ?auto_1531860 ?auto_1531861 ) ) ( not ( = ?auto_1531860 ?auto_1531863 ) ) ( not ( = ?auto_1531860 ?auto_1531862 ) ) ( not ( = ?auto_1531860 ?auto_1531864 ) ) ( not ( = ?auto_1531860 ?auto_1531865 ) ) ( not ( = ?auto_1531860 ?auto_1531866 ) ) ( not ( = ?auto_1531860 ?auto_1531867 ) ) ( not ( = ?auto_1531857 ?auto_1531861 ) ) ( not ( = ?auto_1531857 ?auto_1531863 ) ) ( not ( = ?auto_1531857 ?auto_1531862 ) ) ( not ( = ?auto_1531857 ?auto_1531864 ) ) ( not ( = ?auto_1531857 ?auto_1531865 ) ) ( not ( = ?auto_1531857 ?auto_1531866 ) ) ( not ( = ?auto_1531857 ?auto_1531867 ) ) ( not ( = ?auto_1531861 ?auto_1531863 ) ) ( not ( = ?auto_1531861 ?auto_1531862 ) ) ( not ( = ?auto_1531861 ?auto_1531864 ) ) ( not ( = ?auto_1531861 ?auto_1531865 ) ) ( not ( = ?auto_1531861 ?auto_1531866 ) ) ( not ( = ?auto_1531861 ?auto_1531867 ) ) ( not ( = ?auto_1531863 ?auto_1531862 ) ) ( not ( = ?auto_1531863 ?auto_1531864 ) ) ( not ( = ?auto_1531863 ?auto_1531865 ) ) ( not ( = ?auto_1531863 ?auto_1531866 ) ) ( not ( = ?auto_1531863 ?auto_1531867 ) ) ( not ( = ?auto_1531862 ?auto_1531864 ) ) ( not ( = ?auto_1531862 ?auto_1531865 ) ) ( not ( = ?auto_1531862 ?auto_1531866 ) ) ( not ( = ?auto_1531862 ?auto_1531867 ) ) ( not ( = ?auto_1531864 ?auto_1531865 ) ) ( not ( = ?auto_1531864 ?auto_1531866 ) ) ( not ( = ?auto_1531864 ?auto_1531867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1531865 ?auto_1531866 ?auto_1531867 )
      ( MAKE-10CRATE-VERIFY ?auto_1531858 ?auto_1531859 ?auto_1531860 ?auto_1531857 ?auto_1531861 ?auto_1531863 ?auto_1531862 ?auto_1531864 ?auto_1531865 ?auto_1531866 ?auto_1531867 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1531973 - SURFACE
      ?auto_1531974 - SURFACE
      ?auto_1531975 - SURFACE
      ?auto_1531972 - SURFACE
      ?auto_1531976 - SURFACE
      ?auto_1531978 - SURFACE
      ?auto_1531977 - SURFACE
      ?auto_1531979 - SURFACE
      ?auto_1531980 - SURFACE
      ?auto_1531981 - SURFACE
      ?auto_1531982 - SURFACE
    )
    :vars
    (
      ?auto_1531986 - HOIST
      ?auto_1531987 - PLACE
      ?auto_1531983 - TRUCK
      ?auto_1531985 - PLACE
      ?auto_1531984 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1531986 ?auto_1531987 ) ( SURFACE-AT ?auto_1531981 ?auto_1531987 ) ( CLEAR ?auto_1531981 ) ( IS-CRATE ?auto_1531982 ) ( not ( = ?auto_1531981 ?auto_1531982 ) ) ( AVAILABLE ?auto_1531986 ) ( ON ?auto_1531981 ?auto_1531980 ) ( not ( = ?auto_1531980 ?auto_1531981 ) ) ( not ( = ?auto_1531980 ?auto_1531982 ) ) ( TRUCK-AT ?auto_1531983 ?auto_1531985 ) ( not ( = ?auto_1531985 ?auto_1531987 ) ) ( HOIST-AT ?auto_1531984 ?auto_1531985 ) ( LIFTING ?auto_1531984 ?auto_1531982 ) ( not ( = ?auto_1531986 ?auto_1531984 ) ) ( ON ?auto_1531974 ?auto_1531973 ) ( ON ?auto_1531975 ?auto_1531974 ) ( ON ?auto_1531972 ?auto_1531975 ) ( ON ?auto_1531976 ?auto_1531972 ) ( ON ?auto_1531978 ?auto_1531976 ) ( ON ?auto_1531977 ?auto_1531978 ) ( ON ?auto_1531979 ?auto_1531977 ) ( ON ?auto_1531980 ?auto_1531979 ) ( not ( = ?auto_1531973 ?auto_1531974 ) ) ( not ( = ?auto_1531973 ?auto_1531975 ) ) ( not ( = ?auto_1531973 ?auto_1531972 ) ) ( not ( = ?auto_1531973 ?auto_1531976 ) ) ( not ( = ?auto_1531973 ?auto_1531978 ) ) ( not ( = ?auto_1531973 ?auto_1531977 ) ) ( not ( = ?auto_1531973 ?auto_1531979 ) ) ( not ( = ?auto_1531973 ?auto_1531980 ) ) ( not ( = ?auto_1531973 ?auto_1531981 ) ) ( not ( = ?auto_1531973 ?auto_1531982 ) ) ( not ( = ?auto_1531974 ?auto_1531975 ) ) ( not ( = ?auto_1531974 ?auto_1531972 ) ) ( not ( = ?auto_1531974 ?auto_1531976 ) ) ( not ( = ?auto_1531974 ?auto_1531978 ) ) ( not ( = ?auto_1531974 ?auto_1531977 ) ) ( not ( = ?auto_1531974 ?auto_1531979 ) ) ( not ( = ?auto_1531974 ?auto_1531980 ) ) ( not ( = ?auto_1531974 ?auto_1531981 ) ) ( not ( = ?auto_1531974 ?auto_1531982 ) ) ( not ( = ?auto_1531975 ?auto_1531972 ) ) ( not ( = ?auto_1531975 ?auto_1531976 ) ) ( not ( = ?auto_1531975 ?auto_1531978 ) ) ( not ( = ?auto_1531975 ?auto_1531977 ) ) ( not ( = ?auto_1531975 ?auto_1531979 ) ) ( not ( = ?auto_1531975 ?auto_1531980 ) ) ( not ( = ?auto_1531975 ?auto_1531981 ) ) ( not ( = ?auto_1531975 ?auto_1531982 ) ) ( not ( = ?auto_1531972 ?auto_1531976 ) ) ( not ( = ?auto_1531972 ?auto_1531978 ) ) ( not ( = ?auto_1531972 ?auto_1531977 ) ) ( not ( = ?auto_1531972 ?auto_1531979 ) ) ( not ( = ?auto_1531972 ?auto_1531980 ) ) ( not ( = ?auto_1531972 ?auto_1531981 ) ) ( not ( = ?auto_1531972 ?auto_1531982 ) ) ( not ( = ?auto_1531976 ?auto_1531978 ) ) ( not ( = ?auto_1531976 ?auto_1531977 ) ) ( not ( = ?auto_1531976 ?auto_1531979 ) ) ( not ( = ?auto_1531976 ?auto_1531980 ) ) ( not ( = ?auto_1531976 ?auto_1531981 ) ) ( not ( = ?auto_1531976 ?auto_1531982 ) ) ( not ( = ?auto_1531978 ?auto_1531977 ) ) ( not ( = ?auto_1531978 ?auto_1531979 ) ) ( not ( = ?auto_1531978 ?auto_1531980 ) ) ( not ( = ?auto_1531978 ?auto_1531981 ) ) ( not ( = ?auto_1531978 ?auto_1531982 ) ) ( not ( = ?auto_1531977 ?auto_1531979 ) ) ( not ( = ?auto_1531977 ?auto_1531980 ) ) ( not ( = ?auto_1531977 ?auto_1531981 ) ) ( not ( = ?auto_1531977 ?auto_1531982 ) ) ( not ( = ?auto_1531979 ?auto_1531980 ) ) ( not ( = ?auto_1531979 ?auto_1531981 ) ) ( not ( = ?auto_1531979 ?auto_1531982 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1531980 ?auto_1531981 ?auto_1531982 )
      ( MAKE-10CRATE-VERIFY ?auto_1531973 ?auto_1531974 ?auto_1531975 ?auto_1531972 ?auto_1531976 ?auto_1531978 ?auto_1531977 ?auto_1531979 ?auto_1531980 ?auto_1531981 ?auto_1531982 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1532098 - SURFACE
      ?auto_1532099 - SURFACE
      ?auto_1532100 - SURFACE
      ?auto_1532097 - SURFACE
      ?auto_1532101 - SURFACE
      ?auto_1532103 - SURFACE
      ?auto_1532102 - SURFACE
      ?auto_1532104 - SURFACE
      ?auto_1532105 - SURFACE
      ?auto_1532106 - SURFACE
      ?auto_1532107 - SURFACE
    )
    :vars
    (
      ?auto_1532108 - HOIST
      ?auto_1532113 - PLACE
      ?auto_1532109 - TRUCK
      ?auto_1532110 - PLACE
      ?auto_1532111 - HOIST
      ?auto_1532112 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1532108 ?auto_1532113 ) ( SURFACE-AT ?auto_1532106 ?auto_1532113 ) ( CLEAR ?auto_1532106 ) ( IS-CRATE ?auto_1532107 ) ( not ( = ?auto_1532106 ?auto_1532107 ) ) ( AVAILABLE ?auto_1532108 ) ( ON ?auto_1532106 ?auto_1532105 ) ( not ( = ?auto_1532105 ?auto_1532106 ) ) ( not ( = ?auto_1532105 ?auto_1532107 ) ) ( TRUCK-AT ?auto_1532109 ?auto_1532110 ) ( not ( = ?auto_1532110 ?auto_1532113 ) ) ( HOIST-AT ?auto_1532111 ?auto_1532110 ) ( not ( = ?auto_1532108 ?auto_1532111 ) ) ( AVAILABLE ?auto_1532111 ) ( SURFACE-AT ?auto_1532107 ?auto_1532110 ) ( ON ?auto_1532107 ?auto_1532112 ) ( CLEAR ?auto_1532107 ) ( not ( = ?auto_1532106 ?auto_1532112 ) ) ( not ( = ?auto_1532107 ?auto_1532112 ) ) ( not ( = ?auto_1532105 ?auto_1532112 ) ) ( ON ?auto_1532099 ?auto_1532098 ) ( ON ?auto_1532100 ?auto_1532099 ) ( ON ?auto_1532097 ?auto_1532100 ) ( ON ?auto_1532101 ?auto_1532097 ) ( ON ?auto_1532103 ?auto_1532101 ) ( ON ?auto_1532102 ?auto_1532103 ) ( ON ?auto_1532104 ?auto_1532102 ) ( ON ?auto_1532105 ?auto_1532104 ) ( not ( = ?auto_1532098 ?auto_1532099 ) ) ( not ( = ?auto_1532098 ?auto_1532100 ) ) ( not ( = ?auto_1532098 ?auto_1532097 ) ) ( not ( = ?auto_1532098 ?auto_1532101 ) ) ( not ( = ?auto_1532098 ?auto_1532103 ) ) ( not ( = ?auto_1532098 ?auto_1532102 ) ) ( not ( = ?auto_1532098 ?auto_1532104 ) ) ( not ( = ?auto_1532098 ?auto_1532105 ) ) ( not ( = ?auto_1532098 ?auto_1532106 ) ) ( not ( = ?auto_1532098 ?auto_1532107 ) ) ( not ( = ?auto_1532098 ?auto_1532112 ) ) ( not ( = ?auto_1532099 ?auto_1532100 ) ) ( not ( = ?auto_1532099 ?auto_1532097 ) ) ( not ( = ?auto_1532099 ?auto_1532101 ) ) ( not ( = ?auto_1532099 ?auto_1532103 ) ) ( not ( = ?auto_1532099 ?auto_1532102 ) ) ( not ( = ?auto_1532099 ?auto_1532104 ) ) ( not ( = ?auto_1532099 ?auto_1532105 ) ) ( not ( = ?auto_1532099 ?auto_1532106 ) ) ( not ( = ?auto_1532099 ?auto_1532107 ) ) ( not ( = ?auto_1532099 ?auto_1532112 ) ) ( not ( = ?auto_1532100 ?auto_1532097 ) ) ( not ( = ?auto_1532100 ?auto_1532101 ) ) ( not ( = ?auto_1532100 ?auto_1532103 ) ) ( not ( = ?auto_1532100 ?auto_1532102 ) ) ( not ( = ?auto_1532100 ?auto_1532104 ) ) ( not ( = ?auto_1532100 ?auto_1532105 ) ) ( not ( = ?auto_1532100 ?auto_1532106 ) ) ( not ( = ?auto_1532100 ?auto_1532107 ) ) ( not ( = ?auto_1532100 ?auto_1532112 ) ) ( not ( = ?auto_1532097 ?auto_1532101 ) ) ( not ( = ?auto_1532097 ?auto_1532103 ) ) ( not ( = ?auto_1532097 ?auto_1532102 ) ) ( not ( = ?auto_1532097 ?auto_1532104 ) ) ( not ( = ?auto_1532097 ?auto_1532105 ) ) ( not ( = ?auto_1532097 ?auto_1532106 ) ) ( not ( = ?auto_1532097 ?auto_1532107 ) ) ( not ( = ?auto_1532097 ?auto_1532112 ) ) ( not ( = ?auto_1532101 ?auto_1532103 ) ) ( not ( = ?auto_1532101 ?auto_1532102 ) ) ( not ( = ?auto_1532101 ?auto_1532104 ) ) ( not ( = ?auto_1532101 ?auto_1532105 ) ) ( not ( = ?auto_1532101 ?auto_1532106 ) ) ( not ( = ?auto_1532101 ?auto_1532107 ) ) ( not ( = ?auto_1532101 ?auto_1532112 ) ) ( not ( = ?auto_1532103 ?auto_1532102 ) ) ( not ( = ?auto_1532103 ?auto_1532104 ) ) ( not ( = ?auto_1532103 ?auto_1532105 ) ) ( not ( = ?auto_1532103 ?auto_1532106 ) ) ( not ( = ?auto_1532103 ?auto_1532107 ) ) ( not ( = ?auto_1532103 ?auto_1532112 ) ) ( not ( = ?auto_1532102 ?auto_1532104 ) ) ( not ( = ?auto_1532102 ?auto_1532105 ) ) ( not ( = ?auto_1532102 ?auto_1532106 ) ) ( not ( = ?auto_1532102 ?auto_1532107 ) ) ( not ( = ?auto_1532102 ?auto_1532112 ) ) ( not ( = ?auto_1532104 ?auto_1532105 ) ) ( not ( = ?auto_1532104 ?auto_1532106 ) ) ( not ( = ?auto_1532104 ?auto_1532107 ) ) ( not ( = ?auto_1532104 ?auto_1532112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1532105 ?auto_1532106 ?auto_1532107 )
      ( MAKE-10CRATE-VERIFY ?auto_1532098 ?auto_1532099 ?auto_1532100 ?auto_1532097 ?auto_1532101 ?auto_1532103 ?auto_1532102 ?auto_1532104 ?auto_1532105 ?auto_1532106 ?auto_1532107 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1532224 - SURFACE
      ?auto_1532225 - SURFACE
      ?auto_1532226 - SURFACE
      ?auto_1532223 - SURFACE
      ?auto_1532227 - SURFACE
      ?auto_1532229 - SURFACE
      ?auto_1532228 - SURFACE
      ?auto_1532230 - SURFACE
      ?auto_1532231 - SURFACE
      ?auto_1532232 - SURFACE
      ?auto_1532233 - SURFACE
    )
    :vars
    (
      ?auto_1532235 - HOIST
      ?auto_1532236 - PLACE
      ?auto_1532237 - PLACE
      ?auto_1532239 - HOIST
      ?auto_1532238 - SURFACE
      ?auto_1532234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1532235 ?auto_1532236 ) ( SURFACE-AT ?auto_1532232 ?auto_1532236 ) ( CLEAR ?auto_1532232 ) ( IS-CRATE ?auto_1532233 ) ( not ( = ?auto_1532232 ?auto_1532233 ) ) ( AVAILABLE ?auto_1532235 ) ( ON ?auto_1532232 ?auto_1532231 ) ( not ( = ?auto_1532231 ?auto_1532232 ) ) ( not ( = ?auto_1532231 ?auto_1532233 ) ) ( not ( = ?auto_1532237 ?auto_1532236 ) ) ( HOIST-AT ?auto_1532239 ?auto_1532237 ) ( not ( = ?auto_1532235 ?auto_1532239 ) ) ( AVAILABLE ?auto_1532239 ) ( SURFACE-AT ?auto_1532233 ?auto_1532237 ) ( ON ?auto_1532233 ?auto_1532238 ) ( CLEAR ?auto_1532233 ) ( not ( = ?auto_1532232 ?auto_1532238 ) ) ( not ( = ?auto_1532233 ?auto_1532238 ) ) ( not ( = ?auto_1532231 ?auto_1532238 ) ) ( TRUCK-AT ?auto_1532234 ?auto_1532236 ) ( ON ?auto_1532225 ?auto_1532224 ) ( ON ?auto_1532226 ?auto_1532225 ) ( ON ?auto_1532223 ?auto_1532226 ) ( ON ?auto_1532227 ?auto_1532223 ) ( ON ?auto_1532229 ?auto_1532227 ) ( ON ?auto_1532228 ?auto_1532229 ) ( ON ?auto_1532230 ?auto_1532228 ) ( ON ?auto_1532231 ?auto_1532230 ) ( not ( = ?auto_1532224 ?auto_1532225 ) ) ( not ( = ?auto_1532224 ?auto_1532226 ) ) ( not ( = ?auto_1532224 ?auto_1532223 ) ) ( not ( = ?auto_1532224 ?auto_1532227 ) ) ( not ( = ?auto_1532224 ?auto_1532229 ) ) ( not ( = ?auto_1532224 ?auto_1532228 ) ) ( not ( = ?auto_1532224 ?auto_1532230 ) ) ( not ( = ?auto_1532224 ?auto_1532231 ) ) ( not ( = ?auto_1532224 ?auto_1532232 ) ) ( not ( = ?auto_1532224 ?auto_1532233 ) ) ( not ( = ?auto_1532224 ?auto_1532238 ) ) ( not ( = ?auto_1532225 ?auto_1532226 ) ) ( not ( = ?auto_1532225 ?auto_1532223 ) ) ( not ( = ?auto_1532225 ?auto_1532227 ) ) ( not ( = ?auto_1532225 ?auto_1532229 ) ) ( not ( = ?auto_1532225 ?auto_1532228 ) ) ( not ( = ?auto_1532225 ?auto_1532230 ) ) ( not ( = ?auto_1532225 ?auto_1532231 ) ) ( not ( = ?auto_1532225 ?auto_1532232 ) ) ( not ( = ?auto_1532225 ?auto_1532233 ) ) ( not ( = ?auto_1532225 ?auto_1532238 ) ) ( not ( = ?auto_1532226 ?auto_1532223 ) ) ( not ( = ?auto_1532226 ?auto_1532227 ) ) ( not ( = ?auto_1532226 ?auto_1532229 ) ) ( not ( = ?auto_1532226 ?auto_1532228 ) ) ( not ( = ?auto_1532226 ?auto_1532230 ) ) ( not ( = ?auto_1532226 ?auto_1532231 ) ) ( not ( = ?auto_1532226 ?auto_1532232 ) ) ( not ( = ?auto_1532226 ?auto_1532233 ) ) ( not ( = ?auto_1532226 ?auto_1532238 ) ) ( not ( = ?auto_1532223 ?auto_1532227 ) ) ( not ( = ?auto_1532223 ?auto_1532229 ) ) ( not ( = ?auto_1532223 ?auto_1532228 ) ) ( not ( = ?auto_1532223 ?auto_1532230 ) ) ( not ( = ?auto_1532223 ?auto_1532231 ) ) ( not ( = ?auto_1532223 ?auto_1532232 ) ) ( not ( = ?auto_1532223 ?auto_1532233 ) ) ( not ( = ?auto_1532223 ?auto_1532238 ) ) ( not ( = ?auto_1532227 ?auto_1532229 ) ) ( not ( = ?auto_1532227 ?auto_1532228 ) ) ( not ( = ?auto_1532227 ?auto_1532230 ) ) ( not ( = ?auto_1532227 ?auto_1532231 ) ) ( not ( = ?auto_1532227 ?auto_1532232 ) ) ( not ( = ?auto_1532227 ?auto_1532233 ) ) ( not ( = ?auto_1532227 ?auto_1532238 ) ) ( not ( = ?auto_1532229 ?auto_1532228 ) ) ( not ( = ?auto_1532229 ?auto_1532230 ) ) ( not ( = ?auto_1532229 ?auto_1532231 ) ) ( not ( = ?auto_1532229 ?auto_1532232 ) ) ( not ( = ?auto_1532229 ?auto_1532233 ) ) ( not ( = ?auto_1532229 ?auto_1532238 ) ) ( not ( = ?auto_1532228 ?auto_1532230 ) ) ( not ( = ?auto_1532228 ?auto_1532231 ) ) ( not ( = ?auto_1532228 ?auto_1532232 ) ) ( not ( = ?auto_1532228 ?auto_1532233 ) ) ( not ( = ?auto_1532228 ?auto_1532238 ) ) ( not ( = ?auto_1532230 ?auto_1532231 ) ) ( not ( = ?auto_1532230 ?auto_1532232 ) ) ( not ( = ?auto_1532230 ?auto_1532233 ) ) ( not ( = ?auto_1532230 ?auto_1532238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1532231 ?auto_1532232 ?auto_1532233 )
      ( MAKE-10CRATE-VERIFY ?auto_1532224 ?auto_1532225 ?auto_1532226 ?auto_1532223 ?auto_1532227 ?auto_1532229 ?auto_1532228 ?auto_1532230 ?auto_1532231 ?auto_1532232 ?auto_1532233 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1532350 - SURFACE
      ?auto_1532351 - SURFACE
      ?auto_1532352 - SURFACE
      ?auto_1532349 - SURFACE
      ?auto_1532353 - SURFACE
      ?auto_1532355 - SURFACE
      ?auto_1532354 - SURFACE
      ?auto_1532356 - SURFACE
      ?auto_1532357 - SURFACE
      ?auto_1532358 - SURFACE
      ?auto_1532359 - SURFACE
    )
    :vars
    (
      ?auto_1532365 - HOIST
      ?auto_1532364 - PLACE
      ?auto_1532363 - PLACE
      ?auto_1532360 - HOIST
      ?auto_1532361 - SURFACE
      ?auto_1532362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1532365 ?auto_1532364 ) ( IS-CRATE ?auto_1532359 ) ( not ( = ?auto_1532358 ?auto_1532359 ) ) ( not ( = ?auto_1532357 ?auto_1532358 ) ) ( not ( = ?auto_1532357 ?auto_1532359 ) ) ( not ( = ?auto_1532363 ?auto_1532364 ) ) ( HOIST-AT ?auto_1532360 ?auto_1532363 ) ( not ( = ?auto_1532365 ?auto_1532360 ) ) ( AVAILABLE ?auto_1532360 ) ( SURFACE-AT ?auto_1532359 ?auto_1532363 ) ( ON ?auto_1532359 ?auto_1532361 ) ( CLEAR ?auto_1532359 ) ( not ( = ?auto_1532358 ?auto_1532361 ) ) ( not ( = ?auto_1532359 ?auto_1532361 ) ) ( not ( = ?auto_1532357 ?auto_1532361 ) ) ( TRUCK-AT ?auto_1532362 ?auto_1532364 ) ( SURFACE-AT ?auto_1532357 ?auto_1532364 ) ( CLEAR ?auto_1532357 ) ( LIFTING ?auto_1532365 ?auto_1532358 ) ( IS-CRATE ?auto_1532358 ) ( ON ?auto_1532351 ?auto_1532350 ) ( ON ?auto_1532352 ?auto_1532351 ) ( ON ?auto_1532349 ?auto_1532352 ) ( ON ?auto_1532353 ?auto_1532349 ) ( ON ?auto_1532355 ?auto_1532353 ) ( ON ?auto_1532354 ?auto_1532355 ) ( ON ?auto_1532356 ?auto_1532354 ) ( ON ?auto_1532357 ?auto_1532356 ) ( not ( = ?auto_1532350 ?auto_1532351 ) ) ( not ( = ?auto_1532350 ?auto_1532352 ) ) ( not ( = ?auto_1532350 ?auto_1532349 ) ) ( not ( = ?auto_1532350 ?auto_1532353 ) ) ( not ( = ?auto_1532350 ?auto_1532355 ) ) ( not ( = ?auto_1532350 ?auto_1532354 ) ) ( not ( = ?auto_1532350 ?auto_1532356 ) ) ( not ( = ?auto_1532350 ?auto_1532357 ) ) ( not ( = ?auto_1532350 ?auto_1532358 ) ) ( not ( = ?auto_1532350 ?auto_1532359 ) ) ( not ( = ?auto_1532350 ?auto_1532361 ) ) ( not ( = ?auto_1532351 ?auto_1532352 ) ) ( not ( = ?auto_1532351 ?auto_1532349 ) ) ( not ( = ?auto_1532351 ?auto_1532353 ) ) ( not ( = ?auto_1532351 ?auto_1532355 ) ) ( not ( = ?auto_1532351 ?auto_1532354 ) ) ( not ( = ?auto_1532351 ?auto_1532356 ) ) ( not ( = ?auto_1532351 ?auto_1532357 ) ) ( not ( = ?auto_1532351 ?auto_1532358 ) ) ( not ( = ?auto_1532351 ?auto_1532359 ) ) ( not ( = ?auto_1532351 ?auto_1532361 ) ) ( not ( = ?auto_1532352 ?auto_1532349 ) ) ( not ( = ?auto_1532352 ?auto_1532353 ) ) ( not ( = ?auto_1532352 ?auto_1532355 ) ) ( not ( = ?auto_1532352 ?auto_1532354 ) ) ( not ( = ?auto_1532352 ?auto_1532356 ) ) ( not ( = ?auto_1532352 ?auto_1532357 ) ) ( not ( = ?auto_1532352 ?auto_1532358 ) ) ( not ( = ?auto_1532352 ?auto_1532359 ) ) ( not ( = ?auto_1532352 ?auto_1532361 ) ) ( not ( = ?auto_1532349 ?auto_1532353 ) ) ( not ( = ?auto_1532349 ?auto_1532355 ) ) ( not ( = ?auto_1532349 ?auto_1532354 ) ) ( not ( = ?auto_1532349 ?auto_1532356 ) ) ( not ( = ?auto_1532349 ?auto_1532357 ) ) ( not ( = ?auto_1532349 ?auto_1532358 ) ) ( not ( = ?auto_1532349 ?auto_1532359 ) ) ( not ( = ?auto_1532349 ?auto_1532361 ) ) ( not ( = ?auto_1532353 ?auto_1532355 ) ) ( not ( = ?auto_1532353 ?auto_1532354 ) ) ( not ( = ?auto_1532353 ?auto_1532356 ) ) ( not ( = ?auto_1532353 ?auto_1532357 ) ) ( not ( = ?auto_1532353 ?auto_1532358 ) ) ( not ( = ?auto_1532353 ?auto_1532359 ) ) ( not ( = ?auto_1532353 ?auto_1532361 ) ) ( not ( = ?auto_1532355 ?auto_1532354 ) ) ( not ( = ?auto_1532355 ?auto_1532356 ) ) ( not ( = ?auto_1532355 ?auto_1532357 ) ) ( not ( = ?auto_1532355 ?auto_1532358 ) ) ( not ( = ?auto_1532355 ?auto_1532359 ) ) ( not ( = ?auto_1532355 ?auto_1532361 ) ) ( not ( = ?auto_1532354 ?auto_1532356 ) ) ( not ( = ?auto_1532354 ?auto_1532357 ) ) ( not ( = ?auto_1532354 ?auto_1532358 ) ) ( not ( = ?auto_1532354 ?auto_1532359 ) ) ( not ( = ?auto_1532354 ?auto_1532361 ) ) ( not ( = ?auto_1532356 ?auto_1532357 ) ) ( not ( = ?auto_1532356 ?auto_1532358 ) ) ( not ( = ?auto_1532356 ?auto_1532359 ) ) ( not ( = ?auto_1532356 ?auto_1532361 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1532357 ?auto_1532358 ?auto_1532359 )
      ( MAKE-10CRATE-VERIFY ?auto_1532350 ?auto_1532351 ?auto_1532352 ?auto_1532349 ?auto_1532353 ?auto_1532355 ?auto_1532354 ?auto_1532356 ?auto_1532357 ?auto_1532358 ?auto_1532359 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1532476 - SURFACE
      ?auto_1532477 - SURFACE
      ?auto_1532478 - SURFACE
      ?auto_1532475 - SURFACE
      ?auto_1532479 - SURFACE
      ?auto_1532481 - SURFACE
      ?auto_1532480 - SURFACE
      ?auto_1532482 - SURFACE
      ?auto_1532483 - SURFACE
      ?auto_1532484 - SURFACE
      ?auto_1532485 - SURFACE
    )
    :vars
    (
      ?auto_1532489 - HOIST
      ?auto_1532490 - PLACE
      ?auto_1532491 - PLACE
      ?auto_1532486 - HOIST
      ?auto_1532488 - SURFACE
      ?auto_1532487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1532489 ?auto_1532490 ) ( IS-CRATE ?auto_1532485 ) ( not ( = ?auto_1532484 ?auto_1532485 ) ) ( not ( = ?auto_1532483 ?auto_1532484 ) ) ( not ( = ?auto_1532483 ?auto_1532485 ) ) ( not ( = ?auto_1532491 ?auto_1532490 ) ) ( HOIST-AT ?auto_1532486 ?auto_1532491 ) ( not ( = ?auto_1532489 ?auto_1532486 ) ) ( AVAILABLE ?auto_1532486 ) ( SURFACE-AT ?auto_1532485 ?auto_1532491 ) ( ON ?auto_1532485 ?auto_1532488 ) ( CLEAR ?auto_1532485 ) ( not ( = ?auto_1532484 ?auto_1532488 ) ) ( not ( = ?auto_1532485 ?auto_1532488 ) ) ( not ( = ?auto_1532483 ?auto_1532488 ) ) ( TRUCK-AT ?auto_1532487 ?auto_1532490 ) ( SURFACE-AT ?auto_1532483 ?auto_1532490 ) ( CLEAR ?auto_1532483 ) ( IS-CRATE ?auto_1532484 ) ( AVAILABLE ?auto_1532489 ) ( IN ?auto_1532484 ?auto_1532487 ) ( ON ?auto_1532477 ?auto_1532476 ) ( ON ?auto_1532478 ?auto_1532477 ) ( ON ?auto_1532475 ?auto_1532478 ) ( ON ?auto_1532479 ?auto_1532475 ) ( ON ?auto_1532481 ?auto_1532479 ) ( ON ?auto_1532480 ?auto_1532481 ) ( ON ?auto_1532482 ?auto_1532480 ) ( ON ?auto_1532483 ?auto_1532482 ) ( not ( = ?auto_1532476 ?auto_1532477 ) ) ( not ( = ?auto_1532476 ?auto_1532478 ) ) ( not ( = ?auto_1532476 ?auto_1532475 ) ) ( not ( = ?auto_1532476 ?auto_1532479 ) ) ( not ( = ?auto_1532476 ?auto_1532481 ) ) ( not ( = ?auto_1532476 ?auto_1532480 ) ) ( not ( = ?auto_1532476 ?auto_1532482 ) ) ( not ( = ?auto_1532476 ?auto_1532483 ) ) ( not ( = ?auto_1532476 ?auto_1532484 ) ) ( not ( = ?auto_1532476 ?auto_1532485 ) ) ( not ( = ?auto_1532476 ?auto_1532488 ) ) ( not ( = ?auto_1532477 ?auto_1532478 ) ) ( not ( = ?auto_1532477 ?auto_1532475 ) ) ( not ( = ?auto_1532477 ?auto_1532479 ) ) ( not ( = ?auto_1532477 ?auto_1532481 ) ) ( not ( = ?auto_1532477 ?auto_1532480 ) ) ( not ( = ?auto_1532477 ?auto_1532482 ) ) ( not ( = ?auto_1532477 ?auto_1532483 ) ) ( not ( = ?auto_1532477 ?auto_1532484 ) ) ( not ( = ?auto_1532477 ?auto_1532485 ) ) ( not ( = ?auto_1532477 ?auto_1532488 ) ) ( not ( = ?auto_1532478 ?auto_1532475 ) ) ( not ( = ?auto_1532478 ?auto_1532479 ) ) ( not ( = ?auto_1532478 ?auto_1532481 ) ) ( not ( = ?auto_1532478 ?auto_1532480 ) ) ( not ( = ?auto_1532478 ?auto_1532482 ) ) ( not ( = ?auto_1532478 ?auto_1532483 ) ) ( not ( = ?auto_1532478 ?auto_1532484 ) ) ( not ( = ?auto_1532478 ?auto_1532485 ) ) ( not ( = ?auto_1532478 ?auto_1532488 ) ) ( not ( = ?auto_1532475 ?auto_1532479 ) ) ( not ( = ?auto_1532475 ?auto_1532481 ) ) ( not ( = ?auto_1532475 ?auto_1532480 ) ) ( not ( = ?auto_1532475 ?auto_1532482 ) ) ( not ( = ?auto_1532475 ?auto_1532483 ) ) ( not ( = ?auto_1532475 ?auto_1532484 ) ) ( not ( = ?auto_1532475 ?auto_1532485 ) ) ( not ( = ?auto_1532475 ?auto_1532488 ) ) ( not ( = ?auto_1532479 ?auto_1532481 ) ) ( not ( = ?auto_1532479 ?auto_1532480 ) ) ( not ( = ?auto_1532479 ?auto_1532482 ) ) ( not ( = ?auto_1532479 ?auto_1532483 ) ) ( not ( = ?auto_1532479 ?auto_1532484 ) ) ( not ( = ?auto_1532479 ?auto_1532485 ) ) ( not ( = ?auto_1532479 ?auto_1532488 ) ) ( not ( = ?auto_1532481 ?auto_1532480 ) ) ( not ( = ?auto_1532481 ?auto_1532482 ) ) ( not ( = ?auto_1532481 ?auto_1532483 ) ) ( not ( = ?auto_1532481 ?auto_1532484 ) ) ( not ( = ?auto_1532481 ?auto_1532485 ) ) ( not ( = ?auto_1532481 ?auto_1532488 ) ) ( not ( = ?auto_1532480 ?auto_1532482 ) ) ( not ( = ?auto_1532480 ?auto_1532483 ) ) ( not ( = ?auto_1532480 ?auto_1532484 ) ) ( not ( = ?auto_1532480 ?auto_1532485 ) ) ( not ( = ?auto_1532480 ?auto_1532488 ) ) ( not ( = ?auto_1532482 ?auto_1532483 ) ) ( not ( = ?auto_1532482 ?auto_1532484 ) ) ( not ( = ?auto_1532482 ?auto_1532485 ) ) ( not ( = ?auto_1532482 ?auto_1532488 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1532483 ?auto_1532484 ?auto_1532485 )
      ( MAKE-10CRATE-VERIFY ?auto_1532476 ?auto_1532477 ?auto_1532478 ?auto_1532475 ?auto_1532479 ?auto_1532481 ?auto_1532480 ?auto_1532482 ?auto_1532483 ?auto_1532484 ?auto_1532485 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1539760 - SURFACE
      ?auto_1539761 - SURFACE
      ?auto_1539762 - SURFACE
      ?auto_1539759 - SURFACE
      ?auto_1539763 - SURFACE
      ?auto_1539765 - SURFACE
      ?auto_1539764 - SURFACE
      ?auto_1539766 - SURFACE
      ?auto_1539767 - SURFACE
      ?auto_1539768 - SURFACE
      ?auto_1539769 - SURFACE
      ?auto_1539770 - SURFACE
    )
    :vars
    (
      ?auto_1539771 - HOIST
      ?auto_1539772 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1539771 ?auto_1539772 ) ( SURFACE-AT ?auto_1539769 ?auto_1539772 ) ( CLEAR ?auto_1539769 ) ( LIFTING ?auto_1539771 ?auto_1539770 ) ( IS-CRATE ?auto_1539770 ) ( not ( = ?auto_1539769 ?auto_1539770 ) ) ( ON ?auto_1539761 ?auto_1539760 ) ( ON ?auto_1539762 ?auto_1539761 ) ( ON ?auto_1539759 ?auto_1539762 ) ( ON ?auto_1539763 ?auto_1539759 ) ( ON ?auto_1539765 ?auto_1539763 ) ( ON ?auto_1539764 ?auto_1539765 ) ( ON ?auto_1539766 ?auto_1539764 ) ( ON ?auto_1539767 ?auto_1539766 ) ( ON ?auto_1539768 ?auto_1539767 ) ( ON ?auto_1539769 ?auto_1539768 ) ( not ( = ?auto_1539760 ?auto_1539761 ) ) ( not ( = ?auto_1539760 ?auto_1539762 ) ) ( not ( = ?auto_1539760 ?auto_1539759 ) ) ( not ( = ?auto_1539760 ?auto_1539763 ) ) ( not ( = ?auto_1539760 ?auto_1539765 ) ) ( not ( = ?auto_1539760 ?auto_1539764 ) ) ( not ( = ?auto_1539760 ?auto_1539766 ) ) ( not ( = ?auto_1539760 ?auto_1539767 ) ) ( not ( = ?auto_1539760 ?auto_1539768 ) ) ( not ( = ?auto_1539760 ?auto_1539769 ) ) ( not ( = ?auto_1539760 ?auto_1539770 ) ) ( not ( = ?auto_1539761 ?auto_1539762 ) ) ( not ( = ?auto_1539761 ?auto_1539759 ) ) ( not ( = ?auto_1539761 ?auto_1539763 ) ) ( not ( = ?auto_1539761 ?auto_1539765 ) ) ( not ( = ?auto_1539761 ?auto_1539764 ) ) ( not ( = ?auto_1539761 ?auto_1539766 ) ) ( not ( = ?auto_1539761 ?auto_1539767 ) ) ( not ( = ?auto_1539761 ?auto_1539768 ) ) ( not ( = ?auto_1539761 ?auto_1539769 ) ) ( not ( = ?auto_1539761 ?auto_1539770 ) ) ( not ( = ?auto_1539762 ?auto_1539759 ) ) ( not ( = ?auto_1539762 ?auto_1539763 ) ) ( not ( = ?auto_1539762 ?auto_1539765 ) ) ( not ( = ?auto_1539762 ?auto_1539764 ) ) ( not ( = ?auto_1539762 ?auto_1539766 ) ) ( not ( = ?auto_1539762 ?auto_1539767 ) ) ( not ( = ?auto_1539762 ?auto_1539768 ) ) ( not ( = ?auto_1539762 ?auto_1539769 ) ) ( not ( = ?auto_1539762 ?auto_1539770 ) ) ( not ( = ?auto_1539759 ?auto_1539763 ) ) ( not ( = ?auto_1539759 ?auto_1539765 ) ) ( not ( = ?auto_1539759 ?auto_1539764 ) ) ( not ( = ?auto_1539759 ?auto_1539766 ) ) ( not ( = ?auto_1539759 ?auto_1539767 ) ) ( not ( = ?auto_1539759 ?auto_1539768 ) ) ( not ( = ?auto_1539759 ?auto_1539769 ) ) ( not ( = ?auto_1539759 ?auto_1539770 ) ) ( not ( = ?auto_1539763 ?auto_1539765 ) ) ( not ( = ?auto_1539763 ?auto_1539764 ) ) ( not ( = ?auto_1539763 ?auto_1539766 ) ) ( not ( = ?auto_1539763 ?auto_1539767 ) ) ( not ( = ?auto_1539763 ?auto_1539768 ) ) ( not ( = ?auto_1539763 ?auto_1539769 ) ) ( not ( = ?auto_1539763 ?auto_1539770 ) ) ( not ( = ?auto_1539765 ?auto_1539764 ) ) ( not ( = ?auto_1539765 ?auto_1539766 ) ) ( not ( = ?auto_1539765 ?auto_1539767 ) ) ( not ( = ?auto_1539765 ?auto_1539768 ) ) ( not ( = ?auto_1539765 ?auto_1539769 ) ) ( not ( = ?auto_1539765 ?auto_1539770 ) ) ( not ( = ?auto_1539764 ?auto_1539766 ) ) ( not ( = ?auto_1539764 ?auto_1539767 ) ) ( not ( = ?auto_1539764 ?auto_1539768 ) ) ( not ( = ?auto_1539764 ?auto_1539769 ) ) ( not ( = ?auto_1539764 ?auto_1539770 ) ) ( not ( = ?auto_1539766 ?auto_1539767 ) ) ( not ( = ?auto_1539766 ?auto_1539768 ) ) ( not ( = ?auto_1539766 ?auto_1539769 ) ) ( not ( = ?auto_1539766 ?auto_1539770 ) ) ( not ( = ?auto_1539767 ?auto_1539768 ) ) ( not ( = ?auto_1539767 ?auto_1539769 ) ) ( not ( = ?auto_1539767 ?auto_1539770 ) ) ( not ( = ?auto_1539768 ?auto_1539769 ) ) ( not ( = ?auto_1539768 ?auto_1539770 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1539769 ?auto_1539770 )
      ( MAKE-11CRATE-VERIFY ?auto_1539760 ?auto_1539761 ?auto_1539762 ?auto_1539759 ?auto_1539763 ?auto_1539765 ?auto_1539764 ?auto_1539766 ?auto_1539767 ?auto_1539768 ?auto_1539769 ?auto_1539770 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1539869 - SURFACE
      ?auto_1539870 - SURFACE
      ?auto_1539871 - SURFACE
      ?auto_1539868 - SURFACE
      ?auto_1539872 - SURFACE
      ?auto_1539874 - SURFACE
      ?auto_1539873 - SURFACE
      ?auto_1539875 - SURFACE
      ?auto_1539876 - SURFACE
      ?auto_1539877 - SURFACE
      ?auto_1539878 - SURFACE
      ?auto_1539879 - SURFACE
    )
    :vars
    (
      ?auto_1539880 - HOIST
      ?auto_1539881 - PLACE
      ?auto_1539882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1539880 ?auto_1539881 ) ( SURFACE-AT ?auto_1539878 ?auto_1539881 ) ( CLEAR ?auto_1539878 ) ( IS-CRATE ?auto_1539879 ) ( not ( = ?auto_1539878 ?auto_1539879 ) ) ( TRUCK-AT ?auto_1539882 ?auto_1539881 ) ( AVAILABLE ?auto_1539880 ) ( IN ?auto_1539879 ?auto_1539882 ) ( ON ?auto_1539878 ?auto_1539877 ) ( not ( = ?auto_1539877 ?auto_1539878 ) ) ( not ( = ?auto_1539877 ?auto_1539879 ) ) ( ON ?auto_1539870 ?auto_1539869 ) ( ON ?auto_1539871 ?auto_1539870 ) ( ON ?auto_1539868 ?auto_1539871 ) ( ON ?auto_1539872 ?auto_1539868 ) ( ON ?auto_1539874 ?auto_1539872 ) ( ON ?auto_1539873 ?auto_1539874 ) ( ON ?auto_1539875 ?auto_1539873 ) ( ON ?auto_1539876 ?auto_1539875 ) ( ON ?auto_1539877 ?auto_1539876 ) ( not ( = ?auto_1539869 ?auto_1539870 ) ) ( not ( = ?auto_1539869 ?auto_1539871 ) ) ( not ( = ?auto_1539869 ?auto_1539868 ) ) ( not ( = ?auto_1539869 ?auto_1539872 ) ) ( not ( = ?auto_1539869 ?auto_1539874 ) ) ( not ( = ?auto_1539869 ?auto_1539873 ) ) ( not ( = ?auto_1539869 ?auto_1539875 ) ) ( not ( = ?auto_1539869 ?auto_1539876 ) ) ( not ( = ?auto_1539869 ?auto_1539877 ) ) ( not ( = ?auto_1539869 ?auto_1539878 ) ) ( not ( = ?auto_1539869 ?auto_1539879 ) ) ( not ( = ?auto_1539870 ?auto_1539871 ) ) ( not ( = ?auto_1539870 ?auto_1539868 ) ) ( not ( = ?auto_1539870 ?auto_1539872 ) ) ( not ( = ?auto_1539870 ?auto_1539874 ) ) ( not ( = ?auto_1539870 ?auto_1539873 ) ) ( not ( = ?auto_1539870 ?auto_1539875 ) ) ( not ( = ?auto_1539870 ?auto_1539876 ) ) ( not ( = ?auto_1539870 ?auto_1539877 ) ) ( not ( = ?auto_1539870 ?auto_1539878 ) ) ( not ( = ?auto_1539870 ?auto_1539879 ) ) ( not ( = ?auto_1539871 ?auto_1539868 ) ) ( not ( = ?auto_1539871 ?auto_1539872 ) ) ( not ( = ?auto_1539871 ?auto_1539874 ) ) ( not ( = ?auto_1539871 ?auto_1539873 ) ) ( not ( = ?auto_1539871 ?auto_1539875 ) ) ( not ( = ?auto_1539871 ?auto_1539876 ) ) ( not ( = ?auto_1539871 ?auto_1539877 ) ) ( not ( = ?auto_1539871 ?auto_1539878 ) ) ( not ( = ?auto_1539871 ?auto_1539879 ) ) ( not ( = ?auto_1539868 ?auto_1539872 ) ) ( not ( = ?auto_1539868 ?auto_1539874 ) ) ( not ( = ?auto_1539868 ?auto_1539873 ) ) ( not ( = ?auto_1539868 ?auto_1539875 ) ) ( not ( = ?auto_1539868 ?auto_1539876 ) ) ( not ( = ?auto_1539868 ?auto_1539877 ) ) ( not ( = ?auto_1539868 ?auto_1539878 ) ) ( not ( = ?auto_1539868 ?auto_1539879 ) ) ( not ( = ?auto_1539872 ?auto_1539874 ) ) ( not ( = ?auto_1539872 ?auto_1539873 ) ) ( not ( = ?auto_1539872 ?auto_1539875 ) ) ( not ( = ?auto_1539872 ?auto_1539876 ) ) ( not ( = ?auto_1539872 ?auto_1539877 ) ) ( not ( = ?auto_1539872 ?auto_1539878 ) ) ( not ( = ?auto_1539872 ?auto_1539879 ) ) ( not ( = ?auto_1539874 ?auto_1539873 ) ) ( not ( = ?auto_1539874 ?auto_1539875 ) ) ( not ( = ?auto_1539874 ?auto_1539876 ) ) ( not ( = ?auto_1539874 ?auto_1539877 ) ) ( not ( = ?auto_1539874 ?auto_1539878 ) ) ( not ( = ?auto_1539874 ?auto_1539879 ) ) ( not ( = ?auto_1539873 ?auto_1539875 ) ) ( not ( = ?auto_1539873 ?auto_1539876 ) ) ( not ( = ?auto_1539873 ?auto_1539877 ) ) ( not ( = ?auto_1539873 ?auto_1539878 ) ) ( not ( = ?auto_1539873 ?auto_1539879 ) ) ( not ( = ?auto_1539875 ?auto_1539876 ) ) ( not ( = ?auto_1539875 ?auto_1539877 ) ) ( not ( = ?auto_1539875 ?auto_1539878 ) ) ( not ( = ?auto_1539875 ?auto_1539879 ) ) ( not ( = ?auto_1539876 ?auto_1539877 ) ) ( not ( = ?auto_1539876 ?auto_1539878 ) ) ( not ( = ?auto_1539876 ?auto_1539879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1539877 ?auto_1539878 ?auto_1539879 )
      ( MAKE-11CRATE-VERIFY ?auto_1539869 ?auto_1539870 ?auto_1539871 ?auto_1539868 ?auto_1539872 ?auto_1539874 ?auto_1539873 ?auto_1539875 ?auto_1539876 ?auto_1539877 ?auto_1539878 ?auto_1539879 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1539990 - SURFACE
      ?auto_1539991 - SURFACE
      ?auto_1539992 - SURFACE
      ?auto_1539989 - SURFACE
      ?auto_1539993 - SURFACE
      ?auto_1539995 - SURFACE
      ?auto_1539994 - SURFACE
      ?auto_1539996 - SURFACE
      ?auto_1539997 - SURFACE
      ?auto_1539998 - SURFACE
      ?auto_1539999 - SURFACE
      ?auto_1540000 - SURFACE
    )
    :vars
    (
      ?auto_1540002 - HOIST
      ?auto_1540003 - PLACE
      ?auto_1540004 - TRUCK
      ?auto_1540001 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1540002 ?auto_1540003 ) ( SURFACE-AT ?auto_1539999 ?auto_1540003 ) ( CLEAR ?auto_1539999 ) ( IS-CRATE ?auto_1540000 ) ( not ( = ?auto_1539999 ?auto_1540000 ) ) ( AVAILABLE ?auto_1540002 ) ( IN ?auto_1540000 ?auto_1540004 ) ( ON ?auto_1539999 ?auto_1539998 ) ( not ( = ?auto_1539998 ?auto_1539999 ) ) ( not ( = ?auto_1539998 ?auto_1540000 ) ) ( TRUCK-AT ?auto_1540004 ?auto_1540001 ) ( not ( = ?auto_1540001 ?auto_1540003 ) ) ( ON ?auto_1539991 ?auto_1539990 ) ( ON ?auto_1539992 ?auto_1539991 ) ( ON ?auto_1539989 ?auto_1539992 ) ( ON ?auto_1539993 ?auto_1539989 ) ( ON ?auto_1539995 ?auto_1539993 ) ( ON ?auto_1539994 ?auto_1539995 ) ( ON ?auto_1539996 ?auto_1539994 ) ( ON ?auto_1539997 ?auto_1539996 ) ( ON ?auto_1539998 ?auto_1539997 ) ( not ( = ?auto_1539990 ?auto_1539991 ) ) ( not ( = ?auto_1539990 ?auto_1539992 ) ) ( not ( = ?auto_1539990 ?auto_1539989 ) ) ( not ( = ?auto_1539990 ?auto_1539993 ) ) ( not ( = ?auto_1539990 ?auto_1539995 ) ) ( not ( = ?auto_1539990 ?auto_1539994 ) ) ( not ( = ?auto_1539990 ?auto_1539996 ) ) ( not ( = ?auto_1539990 ?auto_1539997 ) ) ( not ( = ?auto_1539990 ?auto_1539998 ) ) ( not ( = ?auto_1539990 ?auto_1539999 ) ) ( not ( = ?auto_1539990 ?auto_1540000 ) ) ( not ( = ?auto_1539991 ?auto_1539992 ) ) ( not ( = ?auto_1539991 ?auto_1539989 ) ) ( not ( = ?auto_1539991 ?auto_1539993 ) ) ( not ( = ?auto_1539991 ?auto_1539995 ) ) ( not ( = ?auto_1539991 ?auto_1539994 ) ) ( not ( = ?auto_1539991 ?auto_1539996 ) ) ( not ( = ?auto_1539991 ?auto_1539997 ) ) ( not ( = ?auto_1539991 ?auto_1539998 ) ) ( not ( = ?auto_1539991 ?auto_1539999 ) ) ( not ( = ?auto_1539991 ?auto_1540000 ) ) ( not ( = ?auto_1539992 ?auto_1539989 ) ) ( not ( = ?auto_1539992 ?auto_1539993 ) ) ( not ( = ?auto_1539992 ?auto_1539995 ) ) ( not ( = ?auto_1539992 ?auto_1539994 ) ) ( not ( = ?auto_1539992 ?auto_1539996 ) ) ( not ( = ?auto_1539992 ?auto_1539997 ) ) ( not ( = ?auto_1539992 ?auto_1539998 ) ) ( not ( = ?auto_1539992 ?auto_1539999 ) ) ( not ( = ?auto_1539992 ?auto_1540000 ) ) ( not ( = ?auto_1539989 ?auto_1539993 ) ) ( not ( = ?auto_1539989 ?auto_1539995 ) ) ( not ( = ?auto_1539989 ?auto_1539994 ) ) ( not ( = ?auto_1539989 ?auto_1539996 ) ) ( not ( = ?auto_1539989 ?auto_1539997 ) ) ( not ( = ?auto_1539989 ?auto_1539998 ) ) ( not ( = ?auto_1539989 ?auto_1539999 ) ) ( not ( = ?auto_1539989 ?auto_1540000 ) ) ( not ( = ?auto_1539993 ?auto_1539995 ) ) ( not ( = ?auto_1539993 ?auto_1539994 ) ) ( not ( = ?auto_1539993 ?auto_1539996 ) ) ( not ( = ?auto_1539993 ?auto_1539997 ) ) ( not ( = ?auto_1539993 ?auto_1539998 ) ) ( not ( = ?auto_1539993 ?auto_1539999 ) ) ( not ( = ?auto_1539993 ?auto_1540000 ) ) ( not ( = ?auto_1539995 ?auto_1539994 ) ) ( not ( = ?auto_1539995 ?auto_1539996 ) ) ( not ( = ?auto_1539995 ?auto_1539997 ) ) ( not ( = ?auto_1539995 ?auto_1539998 ) ) ( not ( = ?auto_1539995 ?auto_1539999 ) ) ( not ( = ?auto_1539995 ?auto_1540000 ) ) ( not ( = ?auto_1539994 ?auto_1539996 ) ) ( not ( = ?auto_1539994 ?auto_1539997 ) ) ( not ( = ?auto_1539994 ?auto_1539998 ) ) ( not ( = ?auto_1539994 ?auto_1539999 ) ) ( not ( = ?auto_1539994 ?auto_1540000 ) ) ( not ( = ?auto_1539996 ?auto_1539997 ) ) ( not ( = ?auto_1539996 ?auto_1539998 ) ) ( not ( = ?auto_1539996 ?auto_1539999 ) ) ( not ( = ?auto_1539996 ?auto_1540000 ) ) ( not ( = ?auto_1539997 ?auto_1539998 ) ) ( not ( = ?auto_1539997 ?auto_1539999 ) ) ( not ( = ?auto_1539997 ?auto_1540000 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1539998 ?auto_1539999 ?auto_1540000 )
      ( MAKE-11CRATE-VERIFY ?auto_1539990 ?auto_1539991 ?auto_1539992 ?auto_1539989 ?auto_1539993 ?auto_1539995 ?auto_1539994 ?auto_1539996 ?auto_1539997 ?auto_1539998 ?auto_1539999 ?auto_1540000 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1540122 - SURFACE
      ?auto_1540123 - SURFACE
      ?auto_1540124 - SURFACE
      ?auto_1540121 - SURFACE
      ?auto_1540125 - SURFACE
      ?auto_1540127 - SURFACE
      ?auto_1540126 - SURFACE
      ?auto_1540128 - SURFACE
      ?auto_1540129 - SURFACE
      ?auto_1540130 - SURFACE
      ?auto_1540131 - SURFACE
      ?auto_1540132 - SURFACE
    )
    :vars
    (
      ?auto_1540136 - HOIST
      ?auto_1540134 - PLACE
      ?auto_1540133 - TRUCK
      ?auto_1540137 - PLACE
      ?auto_1540135 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1540136 ?auto_1540134 ) ( SURFACE-AT ?auto_1540131 ?auto_1540134 ) ( CLEAR ?auto_1540131 ) ( IS-CRATE ?auto_1540132 ) ( not ( = ?auto_1540131 ?auto_1540132 ) ) ( AVAILABLE ?auto_1540136 ) ( ON ?auto_1540131 ?auto_1540130 ) ( not ( = ?auto_1540130 ?auto_1540131 ) ) ( not ( = ?auto_1540130 ?auto_1540132 ) ) ( TRUCK-AT ?auto_1540133 ?auto_1540137 ) ( not ( = ?auto_1540137 ?auto_1540134 ) ) ( HOIST-AT ?auto_1540135 ?auto_1540137 ) ( LIFTING ?auto_1540135 ?auto_1540132 ) ( not ( = ?auto_1540136 ?auto_1540135 ) ) ( ON ?auto_1540123 ?auto_1540122 ) ( ON ?auto_1540124 ?auto_1540123 ) ( ON ?auto_1540121 ?auto_1540124 ) ( ON ?auto_1540125 ?auto_1540121 ) ( ON ?auto_1540127 ?auto_1540125 ) ( ON ?auto_1540126 ?auto_1540127 ) ( ON ?auto_1540128 ?auto_1540126 ) ( ON ?auto_1540129 ?auto_1540128 ) ( ON ?auto_1540130 ?auto_1540129 ) ( not ( = ?auto_1540122 ?auto_1540123 ) ) ( not ( = ?auto_1540122 ?auto_1540124 ) ) ( not ( = ?auto_1540122 ?auto_1540121 ) ) ( not ( = ?auto_1540122 ?auto_1540125 ) ) ( not ( = ?auto_1540122 ?auto_1540127 ) ) ( not ( = ?auto_1540122 ?auto_1540126 ) ) ( not ( = ?auto_1540122 ?auto_1540128 ) ) ( not ( = ?auto_1540122 ?auto_1540129 ) ) ( not ( = ?auto_1540122 ?auto_1540130 ) ) ( not ( = ?auto_1540122 ?auto_1540131 ) ) ( not ( = ?auto_1540122 ?auto_1540132 ) ) ( not ( = ?auto_1540123 ?auto_1540124 ) ) ( not ( = ?auto_1540123 ?auto_1540121 ) ) ( not ( = ?auto_1540123 ?auto_1540125 ) ) ( not ( = ?auto_1540123 ?auto_1540127 ) ) ( not ( = ?auto_1540123 ?auto_1540126 ) ) ( not ( = ?auto_1540123 ?auto_1540128 ) ) ( not ( = ?auto_1540123 ?auto_1540129 ) ) ( not ( = ?auto_1540123 ?auto_1540130 ) ) ( not ( = ?auto_1540123 ?auto_1540131 ) ) ( not ( = ?auto_1540123 ?auto_1540132 ) ) ( not ( = ?auto_1540124 ?auto_1540121 ) ) ( not ( = ?auto_1540124 ?auto_1540125 ) ) ( not ( = ?auto_1540124 ?auto_1540127 ) ) ( not ( = ?auto_1540124 ?auto_1540126 ) ) ( not ( = ?auto_1540124 ?auto_1540128 ) ) ( not ( = ?auto_1540124 ?auto_1540129 ) ) ( not ( = ?auto_1540124 ?auto_1540130 ) ) ( not ( = ?auto_1540124 ?auto_1540131 ) ) ( not ( = ?auto_1540124 ?auto_1540132 ) ) ( not ( = ?auto_1540121 ?auto_1540125 ) ) ( not ( = ?auto_1540121 ?auto_1540127 ) ) ( not ( = ?auto_1540121 ?auto_1540126 ) ) ( not ( = ?auto_1540121 ?auto_1540128 ) ) ( not ( = ?auto_1540121 ?auto_1540129 ) ) ( not ( = ?auto_1540121 ?auto_1540130 ) ) ( not ( = ?auto_1540121 ?auto_1540131 ) ) ( not ( = ?auto_1540121 ?auto_1540132 ) ) ( not ( = ?auto_1540125 ?auto_1540127 ) ) ( not ( = ?auto_1540125 ?auto_1540126 ) ) ( not ( = ?auto_1540125 ?auto_1540128 ) ) ( not ( = ?auto_1540125 ?auto_1540129 ) ) ( not ( = ?auto_1540125 ?auto_1540130 ) ) ( not ( = ?auto_1540125 ?auto_1540131 ) ) ( not ( = ?auto_1540125 ?auto_1540132 ) ) ( not ( = ?auto_1540127 ?auto_1540126 ) ) ( not ( = ?auto_1540127 ?auto_1540128 ) ) ( not ( = ?auto_1540127 ?auto_1540129 ) ) ( not ( = ?auto_1540127 ?auto_1540130 ) ) ( not ( = ?auto_1540127 ?auto_1540131 ) ) ( not ( = ?auto_1540127 ?auto_1540132 ) ) ( not ( = ?auto_1540126 ?auto_1540128 ) ) ( not ( = ?auto_1540126 ?auto_1540129 ) ) ( not ( = ?auto_1540126 ?auto_1540130 ) ) ( not ( = ?auto_1540126 ?auto_1540131 ) ) ( not ( = ?auto_1540126 ?auto_1540132 ) ) ( not ( = ?auto_1540128 ?auto_1540129 ) ) ( not ( = ?auto_1540128 ?auto_1540130 ) ) ( not ( = ?auto_1540128 ?auto_1540131 ) ) ( not ( = ?auto_1540128 ?auto_1540132 ) ) ( not ( = ?auto_1540129 ?auto_1540130 ) ) ( not ( = ?auto_1540129 ?auto_1540131 ) ) ( not ( = ?auto_1540129 ?auto_1540132 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1540130 ?auto_1540131 ?auto_1540132 )
      ( MAKE-11CRATE-VERIFY ?auto_1540122 ?auto_1540123 ?auto_1540124 ?auto_1540121 ?auto_1540125 ?auto_1540127 ?auto_1540126 ?auto_1540128 ?auto_1540129 ?auto_1540130 ?auto_1540131 ?auto_1540132 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1540265 - SURFACE
      ?auto_1540266 - SURFACE
      ?auto_1540267 - SURFACE
      ?auto_1540264 - SURFACE
      ?auto_1540268 - SURFACE
      ?auto_1540270 - SURFACE
      ?auto_1540269 - SURFACE
      ?auto_1540271 - SURFACE
      ?auto_1540272 - SURFACE
      ?auto_1540273 - SURFACE
      ?auto_1540274 - SURFACE
      ?auto_1540275 - SURFACE
    )
    :vars
    (
      ?auto_1540276 - HOIST
      ?auto_1540281 - PLACE
      ?auto_1540277 - TRUCK
      ?auto_1540279 - PLACE
      ?auto_1540278 - HOIST
      ?auto_1540280 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1540276 ?auto_1540281 ) ( SURFACE-AT ?auto_1540274 ?auto_1540281 ) ( CLEAR ?auto_1540274 ) ( IS-CRATE ?auto_1540275 ) ( not ( = ?auto_1540274 ?auto_1540275 ) ) ( AVAILABLE ?auto_1540276 ) ( ON ?auto_1540274 ?auto_1540273 ) ( not ( = ?auto_1540273 ?auto_1540274 ) ) ( not ( = ?auto_1540273 ?auto_1540275 ) ) ( TRUCK-AT ?auto_1540277 ?auto_1540279 ) ( not ( = ?auto_1540279 ?auto_1540281 ) ) ( HOIST-AT ?auto_1540278 ?auto_1540279 ) ( not ( = ?auto_1540276 ?auto_1540278 ) ) ( AVAILABLE ?auto_1540278 ) ( SURFACE-AT ?auto_1540275 ?auto_1540279 ) ( ON ?auto_1540275 ?auto_1540280 ) ( CLEAR ?auto_1540275 ) ( not ( = ?auto_1540274 ?auto_1540280 ) ) ( not ( = ?auto_1540275 ?auto_1540280 ) ) ( not ( = ?auto_1540273 ?auto_1540280 ) ) ( ON ?auto_1540266 ?auto_1540265 ) ( ON ?auto_1540267 ?auto_1540266 ) ( ON ?auto_1540264 ?auto_1540267 ) ( ON ?auto_1540268 ?auto_1540264 ) ( ON ?auto_1540270 ?auto_1540268 ) ( ON ?auto_1540269 ?auto_1540270 ) ( ON ?auto_1540271 ?auto_1540269 ) ( ON ?auto_1540272 ?auto_1540271 ) ( ON ?auto_1540273 ?auto_1540272 ) ( not ( = ?auto_1540265 ?auto_1540266 ) ) ( not ( = ?auto_1540265 ?auto_1540267 ) ) ( not ( = ?auto_1540265 ?auto_1540264 ) ) ( not ( = ?auto_1540265 ?auto_1540268 ) ) ( not ( = ?auto_1540265 ?auto_1540270 ) ) ( not ( = ?auto_1540265 ?auto_1540269 ) ) ( not ( = ?auto_1540265 ?auto_1540271 ) ) ( not ( = ?auto_1540265 ?auto_1540272 ) ) ( not ( = ?auto_1540265 ?auto_1540273 ) ) ( not ( = ?auto_1540265 ?auto_1540274 ) ) ( not ( = ?auto_1540265 ?auto_1540275 ) ) ( not ( = ?auto_1540265 ?auto_1540280 ) ) ( not ( = ?auto_1540266 ?auto_1540267 ) ) ( not ( = ?auto_1540266 ?auto_1540264 ) ) ( not ( = ?auto_1540266 ?auto_1540268 ) ) ( not ( = ?auto_1540266 ?auto_1540270 ) ) ( not ( = ?auto_1540266 ?auto_1540269 ) ) ( not ( = ?auto_1540266 ?auto_1540271 ) ) ( not ( = ?auto_1540266 ?auto_1540272 ) ) ( not ( = ?auto_1540266 ?auto_1540273 ) ) ( not ( = ?auto_1540266 ?auto_1540274 ) ) ( not ( = ?auto_1540266 ?auto_1540275 ) ) ( not ( = ?auto_1540266 ?auto_1540280 ) ) ( not ( = ?auto_1540267 ?auto_1540264 ) ) ( not ( = ?auto_1540267 ?auto_1540268 ) ) ( not ( = ?auto_1540267 ?auto_1540270 ) ) ( not ( = ?auto_1540267 ?auto_1540269 ) ) ( not ( = ?auto_1540267 ?auto_1540271 ) ) ( not ( = ?auto_1540267 ?auto_1540272 ) ) ( not ( = ?auto_1540267 ?auto_1540273 ) ) ( not ( = ?auto_1540267 ?auto_1540274 ) ) ( not ( = ?auto_1540267 ?auto_1540275 ) ) ( not ( = ?auto_1540267 ?auto_1540280 ) ) ( not ( = ?auto_1540264 ?auto_1540268 ) ) ( not ( = ?auto_1540264 ?auto_1540270 ) ) ( not ( = ?auto_1540264 ?auto_1540269 ) ) ( not ( = ?auto_1540264 ?auto_1540271 ) ) ( not ( = ?auto_1540264 ?auto_1540272 ) ) ( not ( = ?auto_1540264 ?auto_1540273 ) ) ( not ( = ?auto_1540264 ?auto_1540274 ) ) ( not ( = ?auto_1540264 ?auto_1540275 ) ) ( not ( = ?auto_1540264 ?auto_1540280 ) ) ( not ( = ?auto_1540268 ?auto_1540270 ) ) ( not ( = ?auto_1540268 ?auto_1540269 ) ) ( not ( = ?auto_1540268 ?auto_1540271 ) ) ( not ( = ?auto_1540268 ?auto_1540272 ) ) ( not ( = ?auto_1540268 ?auto_1540273 ) ) ( not ( = ?auto_1540268 ?auto_1540274 ) ) ( not ( = ?auto_1540268 ?auto_1540275 ) ) ( not ( = ?auto_1540268 ?auto_1540280 ) ) ( not ( = ?auto_1540270 ?auto_1540269 ) ) ( not ( = ?auto_1540270 ?auto_1540271 ) ) ( not ( = ?auto_1540270 ?auto_1540272 ) ) ( not ( = ?auto_1540270 ?auto_1540273 ) ) ( not ( = ?auto_1540270 ?auto_1540274 ) ) ( not ( = ?auto_1540270 ?auto_1540275 ) ) ( not ( = ?auto_1540270 ?auto_1540280 ) ) ( not ( = ?auto_1540269 ?auto_1540271 ) ) ( not ( = ?auto_1540269 ?auto_1540272 ) ) ( not ( = ?auto_1540269 ?auto_1540273 ) ) ( not ( = ?auto_1540269 ?auto_1540274 ) ) ( not ( = ?auto_1540269 ?auto_1540275 ) ) ( not ( = ?auto_1540269 ?auto_1540280 ) ) ( not ( = ?auto_1540271 ?auto_1540272 ) ) ( not ( = ?auto_1540271 ?auto_1540273 ) ) ( not ( = ?auto_1540271 ?auto_1540274 ) ) ( not ( = ?auto_1540271 ?auto_1540275 ) ) ( not ( = ?auto_1540271 ?auto_1540280 ) ) ( not ( = ?auto_1540272 ?auto_1540273 ) ) ( not ( = ?auto_1540272 ?auto_1540274 ) ) ( not ( = ?auto_1540272 ?auto_1540275 ) ) ( not ( = ?auto_1540272 ?auto_1540280 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1540273 ?auto_1540274 ?auto_1540275 )
      ( MAKE-11CRATE-VERIFY ?auto_1540265 ?auto_1540266 ?auto_1540267 ?auto_1540264 ?auto_1540268 ?auto_1540270 ?auto_1540269 ?auto_1540271 ?auto_1540272 ?auto_1540273 ?auto_1540274 ?auto_1540275 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1540409 - SURFACE
      ?auto_1540410 - SURFACE
      ?auto_1540411 - SURFACE
      ?auto_1540408 - SURFACE
      ?auto_1540412 - SURFACE
      ?auto_1540414 - SURFACE
      ?auto_1540413 - SURFACE
      ?auto_1540415 - SURFACE
      ?auto_1540416 - SURFACE
      ?auto_1540417 - SURFACE
      ?auto_1540418 - SURFACE
      ?auto_1540419 - SURFACE
    )
    :vars
    (
      ?auto_1540425 - HOIST
      ?auto_1540424 - PLACE
      ?auto_1540423 - PLACE
      ?auto_1540421 - HOIST
      ?auto_1540420 - SURFACE
      ?auto_1540422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1540425 ?auto_1540424 ) ( SURFACE-AT ?auto_1540418 ?auto_1540424 ) ( CLEAR ?auto_1540418 ) ( IS-CRATE ?auto_1540419 ) ( not ( = ?auto_1540418 ?auto_1540419 ) ) ( AVAILABLE ?auto_1540425 ) ( ON ?auto_1540418 ?auto_1540417 ) ( not ( = ?auto_1540417 ?auto_1540418 ) ) ( not ( = ?auto_1540417 ?auto_1540419 ) ) ( not ( = ?auto_1540423 ?auto_1540424 ) ) ( HOIST-AT ?auto_1540421 ?auto_1540423 ) ( not ( = ?auto_1540425 ?auto_1540421 ) ) ( AVAILABLE ?auto_1540421 ) ( SURFACE-AT ?auto_1540419 ?auto_1540423 ) ( ON ?auto_1540419 ?auto_1540420 ) ( CLEAR ?auto_1540419 ) ( not ( = ?auto_1540418 ?auto_1540420 ) ) ( not ( = ?auto_1540419 ?auto_1540420 ) ) ( not ( = ?auto_1540417 ?auto_1540420 ) ) ( TRUCK-AT ?auto_1540422 ?auto_1540424 ) ( ON ?auto_1540410 ?auto_1540409 ) ( ON ?auto_1540411 ?auto_1540410 ) ( ON ?auto_1540408 ?auto_1540411 ) ( ON ?auto_1540412 ?auto_1540408 ) ( ON ?auto_1540414 ?auto_1540412 ) ( ON ?auto_1540413 ?auto_1540414 ) ( ON ?auto_1540415 ?auto_1540413 ) ( ON ?auto_1540416 ?auto_1540415 ) ( ON ?auto_1540417 ?auto_1540416 ) ( not ( = ?auto_1540409 ?auto_1540410 ) ) ( not ( = ?auto_1540409 ?auto_1540411 ) ) ( not ( = ?auto_1540409 ?auto_1540408 ) ) ( not ( = ?auto_1540409 ?auto_1540412 ) ) ( not ( = ?auto_1540409 ?auto_1540414 ) ) ( not ( = ?auto_1540409 ?auto_1540413 ) ) ( not ( = ?auto_1540409 ?auto_1540415 ) ) ( not ( = ?auto_1540409 ?auto_1540416 ) ) ( not ( = ?auto_1540409 ?auto_1540417 ) ) ( not ( = ?auto_1540409 ?auto_1540418 ) ) ( not ( = ?auto_1540409 ?auto_1540419 ) ) ( not ( = ?auto_1540409 ?auto_1540420 ) ) ( not ( = ?auto_1540410 ?auto_1540411 ) ) ( not ( = ?auto_1540410 ?auto_1540408 ) ) ( not ( = ?auto_1540410 ?auto_1540412 ) ) ( not ( = ?auto_1540410 ?auto_1540414 ) ) ( not ( = ?auto_1540410 ?auto_1540413 ) ) ( not ( = ?auto_1540410 ?auto_1540415 ) ) ( not ( = ?auto_1540410 ?auto_1540416 ) ) ( not ( = ?auto_1540410 ?auto_1540417 ) ) ( not ( = ?auto_1540410 ?auto_1540418 ) ) ( not ( = ?auto_1540410 ?auto_1540419 ) ) ( not ( = ?auto_1540410 ?auto_1540420 ) ) ( not ( = ?auto_1540411 ?auto_1540408 ) ) ( not ( = ?auto_1540411 ?auto_1540412 ) ) ( not ( = ?auto_1540411 ?auto_1540414 ) ) ( not ( = ?auto_1540411 ?auto_1540413 ) ) ( not ( = ?auto_1540411 ?auto_1540415 ) ) ( not ( = ?auto_1540411 ?auto_1540416 ) ) ( not ( = ?auto_1540411 ?auto_1540417 ) ) ( not ( = ?auto_1540411 ?auto_1540418 ) ) ( not ( = ?auto_1540411 ?auto_1540419 ) ) ( not ( = ?auto_1540411 ?auto_1540420 ) ) ( not ( = ?auto_1540408 ?auto_1540412 ) ) ( not ( = ?auto_1540408 ?auto_1540414 ) ) ( not ( = ?auto_1540408 ?auto_1540413 ) ) ( not ( = ?auto_1540408 ?auto_1540415 ) ) ( not ( = ?auto_1540408 ?auto_1540416 ) ) ( not ( = ?auto_1540408 ?auto_1540417 ) ) ( not ( = ?auto_1540408 ?auto_1540418 ) ) ( not ( = ?auto_1540408 ?auto_1540419 ) ) ( not ( = ?auto_1540408 ?auto_1540420 ) ) ( not ( = ?auto_1540412 ?auto_1540414 ) ) ( not ( = ?auto_1540412 ?auto_1540413 ) ) ( not ( = ?auto_1540412 ?auto_1540415 ) ) ( not ( = ?auto_1540412 ?auto_1540416 ) ) ( not ( = ?auto_1540412 ?auto_1540417 ) ) ( not ( = ?auto_1540412 ?auto_1540418 ) ) ( not ( = ?auto_1540412 ?auto_1540419 ) ) ( not ( = ?auto_1540412 ?auto_1540420 ) ) ( not ( = ?auto_1540414 ?auto_1540413 ) ) ( not ( = ?auto_1540414 ?auto_1540415 ) ) ( not ( = ?auto_1540414 ?auto_1540416 ) ) ( not ( = ?auto_1540414 ?auto_1540417 ) ) ( not ( = ?auto_1540414 ?auto_1540418 ) ) ( not ( = ?auto_1540414 ?auto_1540419 ) ) ( not ( = ?auto_1540414 ?auto_1540420 ) ) ( not ( = ?auto_1540413 ?auto_1540415 ) ) ( not ( = ?auto_1540413 ?auto_1540416 ) ) ( not ( = ?auto_1540413 ?auto_1540417 ) ) ( not ( = ?auto_1540413 ?auto_1540418 ) ) ( not ( = ?auto_1540413 ?auto_1540419 ) ) ( not ( = ?auto_1540413 ?auto_1540420 ) ) ( not ( = ?auto_1540415 ?auto_1540416 ) ) ( not ( = ?auto_1540415 ?auto_1540417 ) ) ( not ( = ?auto_1540415 ?auto_1540418 ) ) ( not ( = ?auto_1540415 ?auto_1540419 ) ) ( not ( = ?auto_1540415 ?auto_1540420 ) ) ( not ( = ?auto_1540416 ?auto_1540417 ) ) ( not ( = ?auto_1540416 ?auto_1540418 ) ) ( not ( = ?auto_1540416 ?auto_1540419 ) ) ( not ( = ?auto_1540416 ?auto_1540420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1540417 ?auto_1540418 ?auto_1540419 )
      ( MAKE-11CRATE-VERIFY ?auto_1540409 ?auto_1540410 ?auto_1540411 ?auto_1540408 ?auto_1540412 ?auto_1540414 ?auto_1540413 ?auto_1540415 ?auto_1540416 ?auto_1540417 ?auto_1540418 ?auto_1540419 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1540553 - SURFACE
      ?auto_1540554 - SURFACE
      ?auto_1540555 - SURFACE
      ?auto_1540552 - SURFACE
      ?auto_1540556 - SURFACE
      ?auto_1540558 - SURFACE
      ?auto_1540557 - SURFACE
      ?auto_1540559 - SURFACE
      ?auto_1540560 - SURFACE
      ?auto_1540561 - SURFACE
      ?auto_1540562 - SURFACE
      ?auto_1540563 - SURFACE
    )
    :vars
    (
      ?auto_1540568 - HOIST
      ?auto_1540567 - PLACE
      ?auto_1540569 - PLACE
      ?auto_1540566 - HOIST
      ?auto_1540565 - SURFACE
      ?auto_1540564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1540568 ?auto_1540567 ) ( IS-CRATE ?auto_1540563 ) ( not ( = ?auto_1540562 ?auto_1540563 ) ) ( not ( = ?auto_1540561 ?auto_1540562 ) ) ( not ( = ?auto_1540561 ?auto_1540563 ) ) ( not ( = ?auto_1540569 ?auto_1540567 ) ) ( HOIST-AT ?auto_1540566 ?auto_1540569 ) ( not ( = ?auto_1540568 ?auto_1540566 ) ) ( AVAILABLE ?auto_1540566 ) ( SURFACE-AT ?auto_1540563 ?auto_1540569 ) ( ON ?auto_1540563 ?auto_1540565 ) ( CLEAR ?auto_1540563 ) ( not ( = ?auto_1540562 ?auto_1540565 ) ) ( not ( = ?auto_1540563 ?auto_1540565 ) ) ( not ( = ?auto_1540561 ?auto_1540565 ) ) ( TRUCK-AT ?auto_1540564 ?auto_1540567 ) ( SURFACE-AT ?auto_1540561 ?auto_1540567 ) ( CLEAR ?auto_1540561 ) ( LIFTING ?auto_1540568 ?auto_1540562 ) ( IS-CRATE ?auto_1540562 ) ( ON ?auto_1540554 ?auto_1540553 ) ( ON ?auto_1540555 ?auto_1540554 ) ( ON ?auto_1540552 ?auto_1540555 ) ( ON ?auto_1540556 ?auto_1540552 ) ( ON ?auto_1540558 ?auto_1540556 ) ( ON ?auto_1540557 ?auto_1540558 ) ( ON ?auto_1540559 ?auto_1540557 ) ( ON ?auto_1540560 ?auto_1540559 ) ( ON ?auto_1540561 ?auto_1540560 ) ( not ( = ?auto_1540553 ?auto_1540554 ) ) ( not ( = ?auto_1540553 ?auto_1540555 ) ) ( not ( = ?auto_1540553 ?auto_1540552 ) ) ( not ( = ?auto_1540553 ?auto_1540556 ) ) ( not ( = ?auto_1540553 ?auto_1540558 ) ) ( not ( = ?auto_1540553 ?auto_1540557 ) ) ( not ( = ?auto_1540553 ?auto_1540559 ) ) ( not ( = ?auto_1540553 ?auto_1540560 ) ) ( not ( = ?auto_1540553 ?auto_1540561 ) ) ( not ( = ?auto_1540553 ?auto_1540562 ) ) ( not ( = ?auto_1540553 ?auto_1540563 ) ) ( not ( = ?auto_1540553 ?auto_1540565 ) ) ( not ( = ?auto_1540554 ?auto_1540555 ) ) ( not ( = ?auto_1540554 ?auto_1540552 ) ) ( not ( = ?auto_1540554 ?auto_1540556 ) ) ( not ( = ?auto_1540554 ?auto_1540558 ) ) ( not ( = ?auto_1540554 ?auto_1540557 ) ) ( not ( = ?auto_1540554 ?auto_1540559 ) ) ( not ( = ?auto_1540554 ?auto_1540560 ) ) ( not ( = ?auto_1540554 ?auto_1540561 ) ) ( not ( = ?auto_1540554 ?auto_1540562 ) ) ( not ( = ?auto_1540554 ?auto_1540563 ) ) ( not ( = ?auto_1540554 ?auto_1540565 ) ) ( not ( = ?auto_1540555 ?auto_1540552 ) ) ( not ( = ?auto_1540555 ?auto_1540556 ) ) ( not ( = ?auto_1540555 ?auto_1540558 ) ) ( not ( = ?auto_1540555 ?auto_1540557 ) ) ( not ( = ?auto_1540555 ?auto_1540559 ) ) ( not ( = ?auto_1540555 ?auto_1540560 ) ) ( not ( = ?auto_1540555 ?auto_1540561 ) ) ( not ( = ?auto_1540555 ?auto_1540562 ) ) ( not ( = ?auto_1540555 ?auto_1540563 ) ) ( not ( = ?auto_1540555 ?auto_1540565 ) ) ( not ( = ?auto_1540552 ?auto_1540556 ) ) ( not ( = ?auto_1540552 ?auto_1540558 ) ) ( not ( = ?auto_1540552 ?auto_1540557 ) ) ( not ( = ?auto_1540552 ?auto_1540559 ) ) ( not ( = ?auto_1540552 ?auto_1540560 ) ) ( not ( = ?auto_1540552 ?auto_1540561 ) ) ( not ( = ?auto_1540552 ?auto_1540562 ) ) ( not ( = ?auto_1540552 ?auto_1540563 ) ) ( not ( = ?auto_1540552 ?auto_1540565 ) ) ( not ( = ?auto_1540556 ?auto_1540558 ) ) ( not ( = ?auto_1540556 ?auto_1540557 ) ) ( not ( = ?auto_1540556 ?auto_1540559 ) ) ( not ( = ?auto_1540556 ?auto_1540560 ) ) ( not ( = ?auto_1540556 ?auto_1540561 ) ) ( not ( = ?auto_1540556 ?auto_1540562 ) ) ( not ( = ?auto_1540556 ?auto_1540563 ) ) ( not ( = ?auto_1540556 ?auto_1540565 ) ) ( not ( = ?auto_1540558 ?auto_1540557 ) ) ( not ( = ?auto_1540558 ?auto_1540559 ) ) ( not ( = ?auto_1540558 ?auto_1540560 ) ) ( not ( = ?auto_1540558 ?auto_1540561 ) ) ( not ( = ?auto_1540558 ?auto_1540562 ) ) ( not ( = ?auto_1540558 ?auto_1540563 ) ) ( not ( = ?auto_1540558 ?auto_1540565 ) ) ( not ( = ?auto_1540557 ?auto_1540559 ) ) ( not ( = ?auto_1540557 ?auto_1540560 ) ) ( not ( = ?auto_1540557 ?auto_1540561 ) ) ( not ( = ?auto_1540557 ?auto_1540562 ) ) ( not ( = ?auto_1540557 ?auto_1540563 ) ) ( not ( = ?auto_1540557 ?auto_1540565 ) ) ( not ( = ?auto_1540559 ?auto_1540560 ) ) ( not ( = ?auto_1540559 ?auto_1540561 ) ) ( not ( = ?auto_1540559 ?auto_1540562 ) ) ( not ( = ?auto_1540559 ?auto_1540563 ) ) ( not ( = ?auto_1540559 ?auto_1540565 ) ) ( not ( = ?auto_1540560 ?auto_1540561 ) ) ( not ( = ?auto_1540560 ?auto_1540562 ) ) ( not ( = ?auto_1540560 ?auto_1540563 ) ) ( not ( = ?auto_1540560 ?auto_1540565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1540561 ?auto_1540562 ?auto_1540563 )
      ( MAKE-11CRATE-VERIFY ?auto_1540553 ?auto_1540554 ?auto_1540555 ?auto_1540552 ?auto_1540556 ?auto_1540558 ?auto_1540557 ?auto_1540559 ?auto_1540560 ?auto_1540561 ?auto_1540562 ?auto_1540563 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1540697 - SURFACE
      ?auto_1540698 - SURFACE
      ?auto_1540699 - SURFACE
      ?auto_1540696 - SURFACE
      ?auto_1540700 - SURFACE
      ?auto_1540702 - SURFACE
      ?auto_1540701 - SURFACE
      ?auto_1540703 - SURFACE
      ?auto_1540704 - SURFACE
      ?auto_1540705 - SURFACE
      ?auto_1540706 - SURFACE
      ?auto_1540707 - SURFACE
    )
    :vars
    (
      ?auto_1540708 - HOIST
      ?auto_1540709 - PLACE
      ?auto_1540710 - PLACE
      ?auto_1540713 - HOIST
      ?auto_1540712 - SURFACE
      ?auto_1540711 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1540708 ?auto_1540709 ) ( IS-CRATE ?auto_1540707 ) ( not ( = ?auto_1540706 ?auto_1540707 ) ) ( not ( = ?auto_1540705 ?auto_1540706 ) ) ( not ( = ?auto_1540705 ?auto_1540707 ) ) ( not ( = ?auto_1540710 ?auto_1540709 ) ) ( HOIST-AT ?auto_1540713 ?auto_1540710 ) ( not ( = ?auto_1540708 ?auto_1540713 ) ) ( AVAILABLE ?auto_1540713 ) ( SURFACE-AT ?auto_1540707 ?auto_1540710 ) ( ON ?auto_1540707 ?auto_1540712 ) ( CLEAR ?auto_1540707 ) ( not ( = ?auto_1540706 ?auto_1540712 ) ) ( not ( = ?auto_1540707 ?auto_1540712 ) ) ( not ( = ?auto_1540705 ?auto_1540712 ) ) ( TRUCK-AT ?auto_1540711 ?auto_1540709 ) ( SURFACE-AT ?auto_1540705 ?auto_1540709 ) ( CLEAR ?auto_1540705 ) ( IS-CRATE ?auto_1540706 ) ( AVAILABLE ?auto_1540708 ) ( IN ?auto_1540706 ?auto_1540711 ) ( ON ?auto_1540698 ?auto_1540697 ) ( ON ?auto_1540699 ?auto_1540698 ) ( ON ?auto_1540696 ?auto_1540699 ) ( ON ?auto_1540700 ?auto_1540696 ) ( ON ?auto_1540702 ?auto_1540700 ) ( ON ?auto_1540701 ?auto_1540702 ) ( ON ?auto_1540703 ?auto_1540701 ) ( ON ?auto_1540704 ?auto_1540703 ) ( ON ?auto_1540705 ?auto_1540704 ) ( not ( = ?auto_1540697 ?auto_1540698 ) ) ( not ( = ?auto_1540697 ?auto_1540699 ) ) ( not ( = ?auto_1540697 ?auto_1540696 ) ) ( not ( = ?auto_1540697 ?auto_1540700 ) ) ( not ( = ?auto_1540697 ?auto_1540702 ) ) ( not ( = ?auto_1540697 ?auto_1540701 ) ) ( not ( = ?auto_1540697 ?auto_1540703 ) ) ( not ( = ?auto_1540697 ?auto_1540704 ) ) ( not ( = ?auto_1540697 ?auto_1540705 ) ) ( not ( = ?auto_1540697 ?auto_1540706 ) ) ( not ( = ?auto_1540697 ?auto_1540707 ) ) ( not ( = ?auto_1540697 ?auto_1540712 ) ) ( not ( = ?auto_1540698 ?auto_1540699 ) ) ( not ( = ?auto_1540698 ?auto_1540696 ) ) ( not ( = ?auto_1540698 ?auto_1540700 ) ) ( not ( = ?auto_1540698 ?auto_1540702 ) ) ( not ( = ?auto_1540698 ?auto_1540701 ) ) ( not ( = ?auto_1540698 ?auto_1540703 ) ) ( not ( = ?auto_1540698 ?auto_1540704 ) ) ( not ( = ?auto_1540698 ?auto_1540705 ) ) ( not ( = ?auto_1540698 ?auto_1540706 ) ) ( not ( = ?auto_1540698 ?auto_1540707 ) ) ( not ( = ?auto_1540698 ?auto_1540712 ) ) ( not ( = ?auto_1540699 ?auto_1540696 ) ) ( not ( = ?auto_1540699 ?auto_1540700 ) ) ( not ( = ?auto_1540699 ?auto_1540702 ) ) ( not ( = ?auto_1540699 ?auto_1540701 ) ) ( not ( = ?auto_1540699 ?auto_1540703 ) ) ( not ( = ?auto_1540699 ?auto_1540704 ) ) ( not ( = ?auto_1540699 ?auto_1540705 ) ) ( not ( = ?auto_1540699 ?auto_1540706 ) ) ( not ( = ?auto_1540699 ?auto_1540707 ) ) ( not ( = ?auto_1540699 ?auto_1540712 ) ) ( not ( = ?auto_1540696 ?auto_1540700 ) ) ( not ( = ?auto_1540696 ?auto_1540702 ) ) ( not ( = ?auto_1540696 ?auto_1540701 ) ) ( not ( = ?auto_1540696 ?auto_1540703 ) ) ( not ( = ?auto_1540696 ?auto_1540704 ) ) ( not ( = ?auto_1540696 ?auto_1540705 ) ) ( not ( = ?auto_1540696 ?auto_1540706 ) ) ( not ( = ?auto_1540696 ?auto_1540707 ) ) ( not ( = ?auto_1540696 ?auto_1540712 ) ) ( not ( = ?auto_1540700 ?auto_1540702 ) ) ( not ( = ?auto_1540700 ?auto_1540701 ) ) ( not ( = ?auto_1540700 ?auto_1540703 ) ) ( not ( = ?auto_1540700 ?auto_1540704 ) ) ( not ( = ?auto_1540700 ?auto_1540705 ) ) ( not ( = ?auto_1540700 ?auto_1540706 ) ) ( not ( = ?auto_1540700 ?auto_1540707 ) ) ( not ( = ?auto_1540700 ?auto_1540712 ) ) ( not ( = ?auto_1540702 ?auto_1540701 ) ) ( not ( = ?auto_1540702 ?auto_1540703 ) ) ( not ( = ?auto_1540702 ?auto_1540704 ) ) ( not ( = ?auto_1540702 ?auto_1540705 ) ) ( not ( = ?auto_1540702 ?auto_1540706 ) ) ( not ( = ?auto_1540702 ?auto_1540707 ) ) ( not ( = ?auto_1540702 ?auto_1540712 ) ) ( not ( = ?auto_1540701 ?auto_1540703 ) ) ( not ( = ?auto_1540701 ?auto_1540704 ) ) ( not ( = ?auto_1540701 ?auto_1540705 ) ) ( not ( = ?auto_1540701 ?auto_1540706 ) ) ( not ( = ?auto_1540701 ?auto_1540707 ) ) ( not ( = ?auto_1540701 ?auto_1540712 ) ) ( not ( = ?auto_1540703 ?auto_1540704 ) ) ( not ( = ?auto_1540703 ?auto_1540705 ) ) ( not ( = ?auto_1540703 ?auto_1540706 ) ) ( not ( = ?auto_1540703 ?auto_1540707 ) ) ( not ( = ?auto_1540703 ?auto_1540712 ) ) ( not ( = ?auto_1540704 ?auto_1540705 ) ) ( not ( = ?auto_1540704 ?auto_1540706 ) ) ( not ( = ?auto_1540704 ?auto_1540707 ) ) ( not ( = ?auto_1540704 ?auto_1540712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1540705 ?auto_1540706 ?auto_1540707 )
      ( MAKE-11CRATE-VERIFY ?auto_1540697 ?auto_1540698 ?auto_1540699 ?auto_1540696 ?auto_1540700 ?auto_1540702 ?auto_1540701 ?auto_1540703 ?auto_1540704 ?auto_1540705 ?auto_1540706 ?auto_1540707 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1549988 - SURFACE
      ?auto_1549989 - SURFACE
      ?auto_1549990 - SURFACE
      ?auto_1549987 - SURFACE
      ?auto_1549991 - SURFACE
      ?auto_1549993 - SURFACE
      ?auto_1549992 - SURFACE
      ?auto_1549994 - SURFACE
      ?auto_1549995 - SURFACE
      ?auto_1549996 - SURFACE
      ?auto_1549997 - SURFACE
      ?auto_1549998 - SURFACE
      ?auto_1549999 - SURFACE
    )
    :vars
    (
      ?auto_1550000 - HOIST
      ?auto_1550001 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1550000 ?auto_1550001 ) ( SURFACE-AT ?auto_1549998 ?auto_1550001 ) ( CLEAR ?auto_1549998 ) ( LIFTING ?auto_1550000 ?auto_1549999 ) ( IS-CRATE ?auto_1549999 ) ( not ( = ?auto_1549998 ?auto_1549999 ) ) ( ON ?auto_1549989 ?auto_1549988 ) ( ON ?auto_1549990 ?auto_1549989 ) ( ON ?auto_1549987 ?auto_1549990 ) ( ON ?auto_1549991 ?auto_1549987 ) ( ON ?auto_1549993 ?auto_1549991 ) ( ON ?auto_1549992 ?auto_1549993 ) ( ON ?auto_1549994 ?auto_1549992 ) ( ON ?auto_1549995 ?auto_1549994 ) ( ON ?auto_1549996 ?auto_1549995 ) ( ON ?auto_1549997 ?auto_1549996 ) ( ON ?auto_1549998 ?auto_1549997 ) ( not ( = ?auto_1549988 ?auto_1549989 ) ) ( not ( = ?auto_1549988 ?auto_1549990 ) ) ( not ( = ?auto_1549988 ?auto_1549987 ) ) ( not ( = ?auto_1549988 ?auto_1549991 ) ) ( not ( = ?auto_1549988 ?auto_1549993 ) ) ( not ( = ?auto_1549988 ?auto_1549992 ) ) ( not ( = ?auto_1549988 ?auto_1549994 ) ) ( not ( = ?auto_1549988 ?auto_1549995 ) ) ( not ( = ?auto_1549988 ?auto_1549996 ) ) ( not ( = ?auto_1549988 ?auto_1549997 ) ) ( not ( = ?auto_1549988 ?auto_1549998 ) ) ( not ( = ?auto_1549988 ?auto_1549999 ) ) ( not ( = ?auto_1549989 ?auto_1549990 ) ) ( not ( = ?auto_1549989 ?auto_1549987 ) ) ( not ( = ?auto_1549989 ?auto_1549991 ) ) ( not ( = ?auto_1549989 ?auto_1549993 ) ) ( not ( = ?auto_1549989 ?auto_1549992 ) ) ( not ( = ?auto_1549989 ?auto_1549994 ) ) ( not ( = ?auto_1549989 ?auto_1549995 ) ) ( not ( = ?auto_1549989 ?auto_1549996 ) ) ( not ( = ?auto_1549989 ?auto_1549997 ) ) ( not ( = ?auto_1549989 ?auto_1549998 ) ) ( not ( = ?auto_1549989 ?auto_1549999 ) ) ( not ( = ?auto_1549990 ?auto_1549987 ) ) ( not ( = ?auto_1549990 ?auto_1549991 ) ) ( not ( = ?auto_1549990 ?auto_1549993 ) ) ( not ( = ?auto_1549990 ?auto_1549992 ) ) ( not ( = ?auto_1549990 ?auto_1549994 ) ) ( not ( = ?auto_1549990 ?auto_1549995 ) ) ( not ( = ?auto_1549990 ?auto_1549996 ) ) ( not ( = ?auto_1549990 ?auto_1549997 ) ) ( not ( = ?auto_1549990 ?auto_1549998 ) ) ( not ( = ?auto_1549990 ?auto_1549999 ) ) ( not ( = ?auto_1549987 ?auto_1549991 ) ) ( not ( = ?auto_1549987 ?auto_1549993 ) ) ( not ( = ?auto_1549987 ?auto_1549992 ) ) ( not ( = ?auto_1549987 ?auto_1549994 ) ) ( not ( = ?auto_1549987 ?auto_1549995 ) ) ( not ( = ?auto_1549987 ?auto_1549996 ) ) ( not ( = ?auto_1549987 ?auto_1549997 ) ) ( not ( = ?auto_1549987 ?auto_1549998 ) ) ( not ( = ?auto_1549987 ?auto_1549999 ) ) ( not ( = ?auto_1549991 ?auto_1549993 ) ) ( not ( = ?auto_1549991 ?auto_1549992 ) ) ( not ( = ?auto_1549991 ?auto_1549994 ) ) ( not ( = ?auto_1549991 ?auto_1549995 ) ) ( not ( = ?auto_1549991 ?auto_1549996 ) ) ( not ( = ?auto_1549991 ?auto_1549997 ) ) ( not ( = ?auto_1549991 ?auto_1549998 ) ) ( not ( = ?auto_1549991 ?auto_1549999 ) ) ( not ( = ?auto_1549993 ?auto_1549992 ) ) ( not ( = ?auto_1549993 ?auto_1549994 ) ) ( not ( = ?auto_1549993 ?auto_1549995 ) ) ( not ( = ?auto_1549993 ?auto_1549996 ) ) ( not ( = ?auto_1549993 ?auto_1549997 ) ) ( not ( = ?auto_1549993 ?auto_1549998 ) ) ( not ( = ?auto_1549993 ?auto_1549999 ) ) ( not ( = ?auto_1549992 ?auto_1549994 ) ) ( not ( = ?auto_1549992 ?auto_1549995 ) ) ( not ( = ?auto_1549992 ?auto_1549996 ) ) ( not ( = ?auto_1549992 ?auto_1549997 ) ) ( not ( = ?auto_1549992 ?auto_1549998 ) ) ( not ( = ?auto_1549992 ?auto_1549999 ) ) ( not ( = ?auto_1549994 ?auto_1549995 ) ) ( not ( = ?auto_1549994 ?auto_1549996 ) ) ( not ( = ?auto_1549994 ?auto_1549997 ) ) ( not ( = ?auto_1549994 ?auto_1549998 ) ) ( not ( = ?auto_1549994 ?auto_1549999 ) ) ( not ( = ?auto_1549995 ?auto_1549996 ) ) ( not ( = ?auto_1549995 ?auto_1549997 ) ) ( not ( = ?auto_1549995 ?auto_1549998 ) ) ( not ( = ?auto_1549995 ?auto_1549999 ) ) ( not ( = ?auto_1549996 ?auto_1549997 ) ) ( not ( = ?auto_1549996 ?auto_1549998 ) ) ( not ( = ?auto_1549996 ?auto_1549999 ) ) ( not ( = ?auto_1549997 ?auto_1549998 ) ) ( not ( = ?auto_1549997 ?auto_1549999 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1549998 ?auto_1549999 )
      ( MAKE-12CRATE-VERIFY ?auto_1549988 ?auto_1549989 ?auto_1549990 ?auto_1549987 ?auto_1549991 ?auto_1549993 ?auto_1549992 ?auto_1549994 ?auto_1549995 ?auto_1549996 ?auto_1549997 ?auto_1549998 ?auto_1549999 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1550113 - SURFACE
      ?auto_1550114 - SURFACE
      ?auto_1550115 - SURFACE
      ?auto_1550112 - SURFACE
      ?auto_1550116 - SURFACE
      ?auto_1550118 - SURFACE
      ?auto_1550117 - SURFACE
      ?auto_1550119 - SURFACE
      ?auto_1550120 - SURFACE
      ?auto_1550121 - SURFACE
      ?auto_1550122 - SURFACE
      ?auto_1550123 - SURFACE
      ?auto_1550124 - SURFACE
    )
    :vars
    (
      ?auto_1550127 - HOIST
      ?auto_1550126 - PLACE
      ?auto_1550125 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1550127 ?auto_1550126 ) ( SURFACE-AT ?auto_1550123 ?auto_1550126 ) ( CLEAR ?auto_1550123 ) ( IS-CRATE ?auto_1550124 ) ( not ( = ?auto_1550123 ?auto_1550124 ) ) ( TRUCK-AT ?auto_1550125 ?auto_1550126 ) ( AVAILABLE ?auto_1550127 ) ( IN ?auto_1550124 ?auto_1550125 ) ( ON ?auto_1550123 ?auto_1550122 ) ( not ( = ?auto_1550122 ?auto_1550123 ) ) ( not ( = ?auto_1550122 ?auto_1550124 ) ) ( ON ?auto_1550114 ?auto_1550113 ) ( ON ?auto_1550115 ?auto_1550114 ) ( ON ?auto_1550112 ?auto_1550115 ) ( ON ?auto_1550116 ?auto_1550112 ) ( ON ?auto_1550118 ?auto_1550116 ) ( ON ?auto_1550117 ?auto_1550118 ) ( ON ?auto_1550119 ?auto_1550117 ) ( ON ?auto_1550120 ?auto_1550119 ) ( ON ?auto_1550121 ?auto_1550120 ) ( ON ?auto_1550122 ?auto_1550121 ) ( not ( = ?auto_1550113 ?auto_1550114 ) ) ( not ( = ?auto_1550113 ?auto_1550115 ) ) ( not ( = ?auto_1550113 ?auto_1550112 ) ) ( not ( = ?auto_1550113 ?auto_1550116 ) ) ( not ( = ?auto_1550113 ?auto_1550118 ) ) ( not ( = ?auto_1550113 ?auto_1550117 ) ) ( not ( = ?auto_1550113 ?auto_1550119 ) ) ( not ( = ?auto_1550113 ?auto_1550120 ) ) ( not ( = ?auto_1550113 ?auto_1550121 ) ) ( not ( = ?auto_1550113 ?auto_1550122 ) ) ( not ( = ?auto_1550113 ?auto_1550123 ) ) ( not ( = ?auto_1550113 ?auto_1550124 ) ) ( not ( = ?auto_1550114 ?auto_1550115 ) ) ( not ( = ?auto_1550114 ?auto_1550112 ) ) ( not ( = ?auto_1550114 ?auto_1550116 ) ) ( not ( = ?auto_1550114 ?auto_1550118 ) ) ( not ( = ?auto_1550114 ?auto_1550117 ) ) ( not ( = ?auto_1550114 ?auto_1550119 ) ) ( not ( = ?auto_1550114 ?auto_1550120 ) ) ( not ( = ?auto_1550114 ?auto_1550121 ) ) ( not ( = ?auto_1550114 ?auto_1550122 ) ) ( not ( = ?auto_1550114 ?auto_1550123 ) ) ( not ( = ?auto_1550114 ?auto_1550124 ) ) ( not ( = ?auto_1550115 ?auto_1550112 ) ) ( not ( = ?auto_1550115 ?auto_1550116 ) ) ( not ( = ?auto_1550115 ?auto_1550118 ) ) ( not ( = ?auto_1550115 ?auto_1550117 ) ) ( not ( = ?auto_1550115 ?auto_1550119 ) ) ( not ( = ?auto_1550115 ?auto_1550120 ) ) ( not ( = ?auto_1550115 ?auto_1550121 ) ) ( not ( = ?auto_1550115 ?auto_1550122 ) ) ( not ( = ?auto_1550115 ?auto_1550123 ) ) ( not ( = ?auto_1550115 ?auto_1550124 ) ) ( not ( = ?auto_1550112 ?auto_1550116 ) ) ( not ( = ?auto_1550112 ?auto_1550118 ) ) ( not ( = ?auto_1550112 ?auto_1550117 ) ) ( not ( = ?auto_1550112 ?auto_1550119 ) ) ( not ( = ?auto_1550112 ?auto_1550120 ) ) ( not ( = ?auto_1550112 ?auto_1550121 ) ) ( not ( = ?auto_1550112 ?auto_1550122 ) ) ( not ( = ?auto_1550112 ?auto_1550123 ) ) ( not ( = ?auto_1550112 ?auto_1550124 ) ) ( not ( = ?auto_1550116 ?auto_1550118 ) ) ( not ( = ?auto_1550116 ?auto_1550117 ) ) ( not ( = ?auto_1550116 ?auto_1550119 ) ) ( not ( = ?auto_1550116 ?auto_1550120 ) ) ( not ( = ?auto_1550116 ?auto_1550121 ) ) ( not ( = ?auto_1550116 ?auto_1550122 ) ) ( not ( = ?auto_1550116 ?auto_1550123 ) ) ( not ( = ?auto_1550116 ?auto_1550124 ) ) ( not ( = ?auto_1550118 ?auto_1550117 ) ) ( not ( = ?auto_1550118 ?auto_1550119 ) ) ( not ( = ?auto_1550118 ?auto_1550120 ) ) ( not ( = ?auto_1550118 ?auto_1550121 ) ) ( not ( = ?auto_1550118 ?auto_1550122 ) ) ( not ( = ?auto_1550118 ?auto_1550123 ) ) ( not ( = ?auto_1550118 ?auto_1550124 ) ) ( not ( = ?auto_1550117 ?auto_1550119 ) ) ( not ( = ?auto_1550117 ?auto_1550120 ) ) ( not ( = ?auto_1550117 ?auto_1550121 ) ) ( not ( = ?auto_1550117 ?auto_1550122 ) ) ( not ( = ?auto_1550117 ?auto_1550123 ) ) ( not ( = ?auto_1550117 ?auto_1550124 ) ) ( not ( = ?auto_1550119 ?auto_1550120 ) ) ( not ( = ?auto_1550119 ?auto_1550121 ) ) ( not ( = ?auto_1550119 ?auto_1550122 ) ) ( not ( = ?auto_1550119 ?auto_1550123 ) ) ( not ( = ?auto_1550119 ?auto_1550124 ) ) ( not ( = ?auto_1550120 ?auto_1550121 ) ) ( not ( = ?auto_1550120 ?auto_1550122 ) ) ( not ( = ?auto_1550120 ?auto_1550123 ) ) ( not ( = ?auto_1550120 ?auto_1550124 ) ) ( not ( = ?auto_1550121 ?auto_1550122 ) ) ( not ( = ?auto_1550121 ?auto_1550123 ) ) ( not ( = ?auto_1550121 ?auto_1550124 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1550122 ?auto_1550123 ?auto_1550124 )
      ( MAKE-12CRATE-VERIFY ?auto_1550113 ?auto_1550114 ?auto_1550115 ?auto_1550112 ?auto_1550116 ?auto_1550118 ?auto_1550117 ?auto_1550119 ?auto_1550120 ?auto_1550121 ?auto_1550122 ?auto_1550123 ?auto_1550124 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1550251 - SURFACE
      ?auto_1550252 - SURFACE
      ?auto_1550253 - SURFACE
      ?auto_1550250 - SURFACE
      ?auto_1550254 - SURFACE
      ?auto_1550256 - SURFACE
      ?auto_1550255 - SURFACE
      ?auto_1550257 - SURFACE
      ?auto_1550258 - SURFACE
      ?auto_1550259 - SURFACE
      ?auto_1550260 - SURFACE
      ?auto_1550261 - SURFACE
      ?auto_1550262 - SURFACE
    )
    :vars
    (
      ?auto_1550265 - HOIST
      ?auto_1550263 - PLACE
      ?auto_1550264 - TRUCK
      ?auto_1550266 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1550265 ?auto_1550263 ) ( SURFACE-AT ?auto_1550261 ?auto_1550263 ) ( CLEAR ?auto_1550261 ) ( IS-CRATE ?auto_1550262 ) ( not ( = ?auto_1550261 ?auto_1550262 ) ) ( AVAILABLE ?auto_1550265 ) ( IN ?auto_1550262 ?auto_1550264 ) ( ON ?auto_1550261 ?auto_1550260 ) ( not ( = ?auto_1550260 ?auto_1550261 ) ) ( not ( = ?auto_1550260 ?auto_1550262 ) ) ( TRUCK-AT ?auto_1550264 ?auto_1550266 ) ( not ( = ?auto_1550266 ?auto_1550263 ) ) ( ON ?auto_1550252 ?auto_1550251 ) ( ON ?auto_1550253 ?auto_1550252 ) ( ON ?auto_1550250 ?auto_1550253 ) ( ON ?auto_1550254 ?auto_1550250 ) ( ON ?auto_1550256 ?auto_1550254 ) ( ON ?auto_1550255 ?auto_1550256 ) ( ON ?auto_1550257 ?auto_1550255 ) ( ON ?auto_1550258 ?auto_1550257 ) ( ON ?auto_1550259 ?auto_1550258 ) ( ON ?auto_1550260 ?auto_1550259 ) ( not ( = ?auto_1550251 ?auto_1550252 ) ) ( not ( = ?auto_1550251 ?auto_1550253 ) ) ( not ( = ?auto_1550251 ?auto_1550250 ) ) ( not ( = ?auto_1550251 ?auto_1550254 ) ) ( not ( = ?auto_1550251 ?auto_1550256 ) ) ( not ( = ?auto_1550251 ?auto_1550255 ) ) ( not ( = ?auto_1550251 ?auto_1550257 ) ) ( not ( = ?auto_1550251 ?auto_1550258 ) ) ( not ( = ?auto_1550251 ?auto_1550259 ) ) ( not ( = ?auto_1550251 ?auto_1550260 ) ) ( not ( = ?auto_1550251 ?auto_1550261 ) ) ( not ( = ?auto_1550251 ?auto_1550262 ) ) ( not ( = ?auto_1550252 ?auto_1550253 ) ) ( not ( = ?auto_1550252 ?auto_1550250 ) ) ( not ( = ?auto_1550252 ?auto_1550254 ) ) ( not ( = ?auto_1550252 ?auto_1550256 ) ) ( not ( = ?auto_1550252 ?auto_1550255 ) ) ( not ( = ?auto_1550252 ?auto_1550257 ) ) ( not ( = ?auto_1550252 ?auto_1550258 ) ) ( not ( = ?auto_1550252 ?auto_1550259 ) ) ( not ( = ?auto_1550252 ?auto_1550260 ) ) ( not ( = ?auto_1550252 ?auto_1550261 ) ) ( not ( = ?auto_1550252 ?auto_1550262 ) ) ( not ( = ?auto_1550253 ?auto_1550250 ) ) ( not ( = ?auto_1550253 ?auto_1550254 ) ) ( not ( = ?auto_1550253 ?auto_1550256 ) ) ( not ( = ?auto_1550253 ?auto_1550255 ) ) ( not ( = ?auto_1550253 ?auto_1550257 ) ) ( not ( = ?auto_1550253 ?auto_1550258 ) ) ( not ( = ?auto_1550253 ?auto_1550259 ) ) ( not ( = ?auto_1550253 ?auto_1550260 ) ) ( not ( = ?auto_1550253 ?auto_1550261 ) ) ( not ( = ?auto_1550253 ?auto_1550262 ) ) ( not ( = ?auto_1550250 ?auto_1550254 ) ) ( not ( = ?auto_1550250 ?auto_1550256 ) ) ( not ( = ?auto_1550250 ?auto_1550255 ) ) ( not ( = ?auto_1550250 ?auto_1550257 ) ) ( not ( = ?auto_1550250 ?auto_1550258 ) ) ( not ( = ?auto_1550250 ?auto_1550259 ) ) ( not ( = ?auto_1550250 ?auto_1550260 ) ) ( not ( = ?auto_1550250 ?auto_1550261 ) ) ( not ( = ?auto_1550250 ?auto_1550262 ) ) ( not ( = ?auto_1550254 ?auto_1550256 ) ) ( not ( = ?auto_1550254 ?auto_1550255 ) ) ( not ( = ?auto_1550254 ?auto_1550257 ) ) ( not ( = ?auto_1550254 ?auto_1550258 ) ) ( not ( = ?auto_1550254 ?auto_1550259 ) ) ( not ( = ?auto_1550254 ?auto_1550260 ) ) ( not ( = ?auto_1550254 ?auto_1550261 ) ) ( not ( = ?auto_1550254 ?auto_1550262 ) ) ( not ( = ?auto_1550256 ?auto_1550255 ) ) ( not ( = ?auto_1550256 ?auto_1550257 ) ) ( not ( = ?auto_1550256 ?auto_1550258 ) ) ( not ( = ?auto_1550256 ?auto_1550259 ) ) ( not ( = ?auto_1550256 ?auto_1550260 ) ) ( not ( = ?auto_1550256 ?auto_1550261 ) ) ( not ( = ?auto_1550256 ?auto_1550262 ) ) ( not ( = ?auto_1550255 ?auto_1550257 ) ) ( not ( = ?auto_1550255 ?auto_1550258 ) ) ( not ( = ?auto_1550255 ?auto_1550259 ) ) ( not ( = ?auto_1550255 ?auto_1550260 ) ) ( not ( = ?auto_1550255 ?auto_1550261 ) ) ( not ( = ?auto_1550255 ?auto_1550262 ) ) ( not ( = ?auto_1550257 ?auto_1550258 ) ) ( not ( = ?auto_1550257 ?auto_1550259 ) ) ( not ( = ?auto_1550257 ?auto_1550260 ) ) ( not ( = ?auto_1550257 ?auto_1550261 ) ) ( not ( = ?auto_1550257 ?auto_1550262 ) ) ( not ( = ?auto_1550258 ?auto_1550259 ) ) ( not ( = ?auto_1550258 ?auto_1550260 ) ) ( not ( = ?auto_1550258 ?auto_1550261 ) ) ( not ( = ?auto_1550258 ?auto_1550262 ) ) ( not ( = ?auto_1550259 ?auto_1550260 ) ) ( not ( = ?auto_1550259 ?auto_1550261 ) ) ( not ( = ?auto_1550259 ?auto_1550262 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1550260 ?auto_1550261 ?auto_1550262 )
      ( MAKE-12CRATE-VERIFY ?auto_1550251 ?auto_1550252 ?auto_1550253 ?auto_1550250 ?auto_1550254 ?auto_1550256 ?auto_1550255 ?auto_1550257 ?auto_1550258 ?auto_1550259 ?auto_1550260 ?auto_1550261 ?auto_1550262 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1550401 - SURFACE
      ?auto_1550402 - SURFACE
      ?auto_1550403 - SURFACE
      ?auto_1550400 - SURFACE
      ?auto_1550404 - SURFACE
      ?auto_1550406 - SURFACE
      ?auto_1550405 - SURFACE
      ?auto_1550407 - SURFACE
      ?auto_1550408 - SURFACE
      ?auto_1550409 - SURFACE
      ?auto_1550410 - SURFACE
      ?auto_1550411 - SURFACE
      ?auto_1550412 - SURFACE
    )
    :vars
    (
      ?auto_1550417 - HOIST
      ?auto_1550415 - PLACE
      ?auto_1550416 - TRUCK
      ?auto_1550414 - PLACE
      ?auto_1550413 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1550417 ?auto_1550415 ) ( SURFACE-AT ?auto_1550411 ?auto_1550415 ) ( CLEAR ?auto_1550411 ) ( IS-CRATE ?auto_1550412 ) ( not ( = ?auto_1550411 ?auto_1550412 ) ) ( AVAILABLE ?auto_1550417 ) ( ON ?auto_1550411 ?auto_1550410 ) ( not ( = ?auto_1550410 ?auto_1550411 ) ) ( not ( = ?auto_1550410 ?auto_1550412 ) ) ( TRUCK-AT ?auto_1550416 ?auto_1550414 ) ( not ( = ?auto_1550414 ?auto_1550415 ) ) ( HOIST-AT ?auto_1550413 ?auto_1550414 ) ( LIFTING ?auto_1550413 ?auto_1550412 ) ( not ( = ?auto_1550417 ?auto_1550413 ) ) ( ON ?auto_1550402 ?auto_1550401 ) ( ON ?auto_1550403 ?auto_1550402 ) ( ON ?auto_1550400 ?auto_1550403 ) ( ON ?auto_1550404 ?auto_1550400 ) ( ON ?auto_1550406 ?auto_1550404 ) ( ON ?auto_1550405 ?auto_1550406 ) ( ON ?auto_1550407 ?auto_1550405 ) ( ON ?auto_1550408 ?auto_1550407 ) ( ON ?auto_1550409 ?auto_1550408 ) ( ON ?auto_1550410 ?auto_1550409 ) ( not ( = ?auto_1550401 ?auto_1550402 ) ) ( not ( = ?auto_1550401 ?auto_1550403 ) ) ( not ( = ?auto_1550401 ?auto_1550400 ) ) ( not ( = ?auto_1550401 ?auto_1550404 ) ) ( not ( = ?auto_1550401 ?auto_1550406 ) ) ( not ( = ?auto_1550401 ?auto_1550405 ) ) ( not ( = ?auto_1550401 ?auto_1550407 ) ) ( not ( = ?auto_1550401 ?auto_1550408 ) ) ( not ( = ?auto_1550401 ?auto_1550409 ) ) ( not ( = ?auto_1550401 ?auto_1550410 ) ) ( not ( = ?auto_1550401 ?auto_1550411 ) ) ( not ( = ?auto_1550401 ?auto_1550412 ) ) ( not ( = ?auto_1550402 ?auto_1550403 ) ) ( not ( = ?auto_1550402 ?auto_1550400 ) ) ( not ( = ?auto_1550402 ?auto_1550404 ) ) ( not ( = ?auto_1550402 ?auto_1550406 ) ) ( not ( = ?auto_1550402 ?auto_1550405 ) ) ( not ( = ?auto_1550402 ?auto_1550407 ) ) ( not ( = ?auto_1550402 ?auto_1550408 ) ) ( not ( = ?auto_1550402 ?auto_1550409 ) ) ( not ( = ?auto_1550402 ?auto_1550410 ) ) ( not ( = ?auto_1550402 ?auto_1550411 ) ) ( not ( = ?auto_1550402 ?auto_1550412 ) ) ( not ( = ?auto_1550403 ?auto_1550400 ) ) ( not ( = ?auto_1550403 ?auto_1550404 ) ) ( not ( = ?auto_1550403 ?auto_1550406 ) ) ( not ( = ?auto_1550403 ?auto_1550405 ) ) ( not ( = ?auto_1550403 ?auto_1550407 ) ) ( not ( = ?auto_1550403 ?auto_1550408 ) ) ( not ( = ?auto_1550403 ?auto_1550409 ) ) ( not ( = ?auto_1550403 ?auto_1550410 ) ) ( not ( = ?auto_1550403 ?auto_1550411 ) ) ( not ( = ?auto_1550403 ?auto_1550412 ) ) ( not ( = ?auto_1550400 ?auto_1550404 ) ) ( not ( = ?auto_1550400 ?auto_1550406 ) ) ( not ( = ?auto_1550400 ?auto_1550405 ) ) ( not ( = ?auto_1550400 ?auto_1550407 ) ) ( not ( = ?auto_1550400 ?auto_1550408 ) ) ( not ( = ?auto_1550400 ?auto_1550409 ) ) ( not ( = ?auto_1550400 ?auto_1550410 ) ) ( not ( = ?auto_1550400 ?auto_1550411 ) ) ( not ( = ?auto_1550400 ?auto_1550412 ) ) ( not ( = ?auto_1550404 ?auto_1550406 ) ) ( not ( = ?auto_1550404 ?auto_1550405 ) ) ( not ( = ?auto_1550404 ?auto_1550407 ) ) ( not ( = ?auto_1550404 ?auto_1550408 ) ) ( not ( = ?auto_1550404 ?auto_1550409 ) ) ( not ( = ?auto_1550404 ?auto_1550410 ) ) ( not ( = ?auto_1550404 ?auto_1550411 ) ) ( not ( = ?auto_1550404 ?auto_1550412 ) ) ( not ( = ?auto_1550406 ?auto_1550405 ) ) ( not ( = ?auto_1550406 ?auto_1550407 ) ) ( not ( = ?auto_1550406 ?auto_1550408 ) ) ( not ( = ?auto_1550406 ?auto_1550409 ) ) ( not ( = ?auto_1550406 ?auto_1550410 ) ) ( not ( = ?auto_1550406 ?auto_1550411 ) ) ( not ( = ?auto_1550406 ?auto_1550412 ) ) ( not ( = ?auto_1550405 ?auto_1550407 ) ) ( not ( = ?auto_1550405 ?auto_1550408 ) ) ( not ( = ?auto_1550405 ?auto_1550409 ) ) ( not ( = ?auto_1550405 ?auto_1550410 ) ) ( not ( = ?auto_1550405 ?auto_1550411 ) ) ( not ( = ?auto_1550405 ?auto_1550412 ) ) ( not ( = ?auto_1550407 ?auto_1550408 ) ) ( not ( = ?auto_1550407 ?auto_1550409 ) ) ( not ( = ?auto_1550407 ?auto_1550410 ) ) ( not ( = ?auto_1550407 ?auto_1550411 ) ) ( not ( = ?auto_1550407 ?auto_1550412 ) ) ( not ( = ?auto_1550408 ?auto_1550409 ) ) ( not ( = ?auto_1550408 ?auto_1550410 ) ) ( not ( = ?auto_1550408 ?auto_1550411 ) ) ( not ( = ?auto_1550408 ?auto_1550412 ) ) ( not ( = ?auto_1550409 ?auto_1550410 ) ) ( not ( = ?auto_1550409 ?auto_1550411 ) ) ( not ( = ?auto_1550409 ?auto_1550412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1550410 ?auto_1550411 ?auto_1550412 )
      ( MAKE-12CRATE-VERIFY ?auto_1550401 ?auto_1550402 ?auto_1550403 ?auto_1550400 ?auto_1550404 ?auto_1550406 ?auto_1550405 ?auto_1550407 ?auto_1550408 ?auto_1550409 ?auto_1550410 ?auto_1550411 ?auto_1550412 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1550563 - SURFACE
      ?auto_1550564 - SURFACE
      ?auto_1550565 - SURFACE
      ?auto_1550562 - SURFACE
      ?auto_1550566 - SURFACE
      ?auto_1550568 - SURFACE
      ?auto_1550567 - SURFACE
      ?auto_1550569 - SURFACE
      ?auto_1550570 - SURFACE
      ?auto_1550571 - SURFACE
      ?auto_1550572 - SURFACE
      ?auto_1550573 - SURFACE
      ?auto_1550574 - SURFACE
    )
    :vars
    (
      ?auto_1550576 - HOIST
      ?auto_1550580 - PLACE
      ?auto_1550579 - TRUCK
      ?auto_1550577 - PLACE
      ?auto_1550578 - HOIST
      ?auto_1550575 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1550576 ?auto_1550580 ) ( SURFACE-AT ?auto_1550573 ?auto_1550580 ) ( CLEAR ?auto_1550573 ) ( IS-CRATE ?auto_1550574 ) ( not ( = ?auto_1550573 ?auto_1550574 ) ) ( AVAILABLE ?auto_1550576 ) ( ON ?auto_1550573 ?auto_1550572 ) ( not ( = ?auto_1550572 ?auto_1550573 ) ) ( not ( = ?auto_1550572 ?auto_1550574 ) ) ( TRUCK-AT ?auto_1550579 ?auto_1550577 ) ( not ( = ?auto_1550577 ?auto_1550580 ) ) ( HOIST-AT ?auto_1550578 ?auto_1550577 ) ( not ( = ?auto_1550576 ?auto_1550578 ) ) ( AVAILABLE ?auto_1550578 ) ( SURFACE-AT ?auto_1550574 ?auto_1550577 ) ( ON ?auto_1550574 ?auto_1550575 ) ( CLEAR ?auto_1550574 ) ( not ( = ?auto_1550573 ?auto_1550575 ) ) ( not ( = ?auto_1550574 ?auto_1550575 ) ) ( not ( = ?auto_1550572 ?auto_1550575 ) ) ( ON ?auto_1550564 ?auto_1550563 ) ( ON ?auto_1550565 ?auto_1550564 ) ( ON ?auto_1550562 ?auto_1550565 ) ( ON ?auto_1550566 ?auto_1550562 ) ( ON ?auto_1550568 ?auto_1550566 ) ( ON ?auto_1550567 ?auto_1550568 ) ( ON ?auto_1550569 ?auto_1550567 ) ( ON ?auto_1550570 ?auto_1550569 ) ( ON ?auto_1550571 ?auto_1550570 ) ( ON ?auto_1550572 ?auto_1550571 ) ( not ( = ?auto_1550563 ?auto_1550564 ) ) ( not ( = ?auto_1550563 ?auto_1550565 ) ) ( not ( = ?auto_1550563 ?auto_1550562 ) ) ( not ( = ?auto_1550563 ?auto_1550566 ) ) ( not ( = ?auto_1550563 ?auto_1550568 ) ) ( not ( = ?auto_1550563 ?auto_1550567 ) ) ( not ( = ?auto_1550563 ?auto_1550569 ) ) ( not ( = ?auto_1550563 ?auto_1550570 ) ) ( not ( = ?auto_1550563 ?auto_1550571 ) ) ( not ( = ?auto_1550563 ?auto_1550572 ) ) ( not ( = ?auto_1550563 ?auto_1550573 ) ) ( not ( = ?auto_1550563 ?auto_1550574 ) ) ( not ( = ?auto_1550563 ?auto_1550575 ) ) ( not ( = ?auto_1550564 ?auto_1550565 ) ) ( not ( = ?auto_1550564 ?auto_1550562 ) ) ( not ( = ?auto_1550564 ?auto_1550566 ) ) ( not ( = ?auto_1550564 ?auto_1550568 ) ) ( not ( = ?auto_1550564 ?auto_1550567 ) ) ( not ( = ?auto_1550564 ?auto_1550569 ) ) ( not ( = ?auto_1550564 ?auto_1550570 ) ) ( not ( = ?auto_1550564 ?auto_1550571 ) ) ( not ( = ?auto_1550564 ?auto_1550572 ) ) ( not ( = ?auto_1550564 ?auto_1550573 ) ) ( not ( = ?auto_1550564 ?auto_1550574 ) ) ( not ( = ?auto_1550564 ?auto_1550575 ) ) ( not ( = ?auto_1550565 ?auto_1550562 ) ) ( not ( = ?auto_1550565 ?auto_1550566 ) ) ( not ( = ?auto_1550565 ?auto_1550568 ) ) ( not ( = ?auto_1550565 ?auto_1550567 ) ) ( not ( = ?auto_1550565 ?auto_1550569 ) ) ( not ( = ?auto_1550565 ?auto_1550570 ) ) ( not ( = ?auto_1550565 ?auto_1550571 ) ) ( not ( = ?auto_1550565 ?auto_1550572 ) ) ( not ( = ?auto_1550565 ?auto_1550573 ) ) ( not ( = ?auto_1550565 ?auto_1550574 ) ) ( not ( = ?auto_1550565 ?auto_1550575 ) ) ( not ( = ?auto_1550562 ?auto_1550566 ) ) ( not ( = ?auto_1550562 ?auto_1550568 ) ) ( not ( = ?auto_1550562 ?auto_1550567 ) ) ( not ( = ?auto_1550562 ?auto_1550569 ) ) ( not ( = ?auto_1550562 ?auto_1550570 ) ) ( not ( = ?auto_1550562 ?auto_1550571 ) ) ( not ( = ?auto_1550562 ?auto_1550572 ) ) ( not ( = ?auto_1550562 ?auto_1550573 ) ) ( not ( = ?auto_1550562 ?auto_1550574 ) ) ( not ( = ?auto_1550562 ?auto_1550575 ) ) ( not ( = ?auto_1550566 ?auto_1550568 ) ) ( not ( = ?auto_1550566 ?auto_1550567 ) ) ( not ( = ?auto_1550566 ?auto_1550569 ) ) ( not ( = ?auto_1550566 ?auto_1550570 ) ) ( not ( = ?auto_1550566 ?auto_1550571 ) ) ( not ( = ?auto_1550566 ?auto_1550572 ) ) ( not ( = ?auto_1550566 ?auto_1550573 ) ) ( not ( = ?auto_1550566 ?auto_1550574 ) ) ( not ( = ?auto_1550566 ?auto_1550575 ) ) ( not ( = ?auto_1550568 ?auto_1550567 ) ) ( not ( = ?auto_1550568 ?auto_1550569 ) ) ( not ( = ?auto_1550568 ?auto_1550570 ) ) ( not ( = ?auto_1550568 ?auto_1550571 ) ) ( not ( = ?auto_1550568 ?auto_1550572 ) ) ( not ( = ?auto_1550568 ?auto_1550573 ) ) ( not ( = ?auto_1550568 ?auto_1550574 ) ) ( not ( = ?auto_1550568 ?auto_1550575 ) ) ( not ( = ?auto_1550567 ?auto_1550569 ) ) ( not ( = ?auto_1550567 ?auto_1550570 ) ) ( not ( = ?auto_1550567 ?auto_1550571 ) ) ( not ( = ?auto_1550567 ?auto_1550572 ) ) ( not ( = ?auto_1550567 ?auto_1550573 ) ) ( not ( = ?auto_1550567 ?auto_1550574 ) ) ( not ( = ?auto_1550567 ?auto_1550575 ) ) ( not ( = ?auto_1550569 ?auto_1550570 ) ) ( not ( = ?auto_1550569 ?auto_1550571 ) ) ( not ( = ?auto_1550569 ?auto_1550572 ) ) ( not ( = ?auto_1550569 ?auto_1550573 ) ) ( not ( = ?auto_1550569 ?auto_1550574 ) ) ( not ( = ?auto_1550569 ?auto_1550575 ) ) ( not ( = ?auto_1550570 ?auto_1550571 ) ) ( not ( = ?auto_1550570 ?auto_1550572 ) ) ( not ( = ?auto_1550570 ?auto_1550573 ) ) ( not ( = ?auto_1550570 ?auto_1550574 ) ) ( not ( = ?auto_1550570 ?auto_1550575 ) ) ( not ( = ?auto_1550571 ?auto_1550572 ) ) ( not ( = ?auto_1550571 ?auto_1550573 ) ) ( not ( = ?auto_1550571 ?auto_1550574 ) ) ( not ( = ?auto_1550571 ?auto_1550575 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1550572 ?auto_1550573 ?auto_1550574 )
      ( MAKE-12CRATE-VERIFY ?auto_1550563 ?auto_1550564 ?auto_1550565 ?auto_1550562 ?auto_1550566 ?auto_1550568 ?auto_1550567 ?auto_1550569 ?auto_1550570 ?auto_1550571 ?auto_1550572 ?auto_1550573 ?auto_1550574 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1550726 - SURFACE
      ?auto_1550727 - SURFACE
      ?auto_1550728 - SURFACE
      ?auto_1550725 - SURFACE
      ?auto_1550729 - SURFACE
      ?auto_1550731 - SURFACE
      ?auto_1550730 - SURFACE
      ?auto_1550732 - SURFACE
      ?auto_1550733 - SURFACE
      ?auto_1550734 - SURFACE
      ?auto_1550735 - SURFACE
      ?auto_1550736 - SURFACE
      ?auto_1550737 - SURFACE
    )
    :vars
    (
      ?auto_1550743 - HOIST
      ?auto_1550742 - PLACE
      ?auto_1550739 - PLACE
      ?auto_1550738 - HOIST
      ?auto_1550740 - SURFACE
      ?auto_1550741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1550743 ?auto_1550742 ) ( SURFACE-AT ?auto_1550736 ?auto_1550742 ) ( CLEAR ?auto_1550736 ) ( IS-CRATE ?auto_1550737 ) ( not ( = ?auto_1550736 ?auto_1550737 ) ) ( AVAILABLE ?auto_1550743 ) ( ON ?auto_1550736 ?auto_1550735 ) ( not ( = ?auto_1550735 ?auto_1550736 ) ) ( not ( = ?auto_1550735 ?auto_1550737 ) ) ( not ( = ?auto_1550739 ?auto_1550742 ) ) ( HOIST-AT ?auto_1550738 ?auto_1550739 ) ( not ( = ?auto_1550743 ?auto_1550738 ) ) ( AVAILABLE ?auto_1550738 ) ( SURFACE-AT ?auto_1550737 ?auto_1550739 ) ( ON ?auto_1550737 ?auto_1550740 ) ( CLEAR ?auto_1550737 ) ( not ( = ?auto_1550736 ?auto_1550740 ) ) ( not ( = ?auto_1550737 ?auto_1550740 ) ) ( not ( = ?auto_1550735 ?auto_1550740 ) ) ( TRUCK-AT ?auto_1550741 ?auto_1550742 ) ( ON ?auto_1550727 ?auto_1550726 ) ( ON ?auto_1550728 ?auto_1550727 ) ( ON ?auto_1550725 ?auto_1550728 ) ( ON ?auto_1550729 ?auto_1550725 ) ( ON ?auto_1550731 ?auto_1550729 ) ( ON ?auto_1550730 ?auto_1550731 ) ( ON ?auto_1550732 ?auto_1550730 ) ( ON ?auto_1550733 ?auto_1550732 ) ( ON ?auto_1550734 ?auto_1550733 ) ( ON ?auto_1550735 ?auto_1550734 ) ( not ( = ?auto_1550726 ?auto_1550727 ) ) ( not ( = ?auto_1550726 ?auto_1550728 ) ) ( not ( = ?auto_1550726 ?auto_1550725 ) ) ( not ( = ?auto_1550726 ?auto_1550729 ) ) ( not ( = ?auto_1550726 ?auto_1550731 ) ) ( not ( = ?auto_1550726 ?auto_1550730 ) ) ( not ( = ?auto_1550726 ?auto_1550732 ) ) ( not ( = ?auto_1550726 ?auto_1550733 ) ) ( not ( = ?auto_1550726 ?auto_1550734 ) ) ( not ( = ?auto_1550726 ?auto_1550735 ) ) ( not ( = ?auto_1550726 ?auto_1550736 ) ) ( not ( = ?auto_1550726 ?auto_1550737 ) ) ( not ( = ?auto_1550726 ?auto_1550740 ) ) ( not ( = ?auto_1550727 ?auto_1550728 ) ) ( not ( = ?auto_1550727 ?auto_1550725 ) ) ( not ( = ?auto_1550727 ?auto_1550729 ) ) ( not ( = ?auto_1550727 ?auto_1550731 ) ) ( not ( = ?auto_1550727 ?auto_1550730 ) ) ( not ( = ?auto_1550727 ?auto_1550732 ) ) ( not ( = ?auto_1550727 ?auto_1550733 ) ) ( not ( = ?auto_1550727 ?auto_1550734 ) ) ( not ( = ?auto_1550727 ?auto_1550735 ) ) ( not ( = ?auto_1550727 ?auto_1550736 ) ) ( not ( = ?auto_1550727 ?auto_1550737 ) ) ( not ( = ?auto_1550727 ?auto_1550740 ) ) ( not ( = ?auto_1550728 ?auto_1550725 ) ) ( not ( = ?auto_1550728 ?auto_1550729 ) ) ( not ( = ?auto_1550728 ?auto_1550731 ) ) ( not ( = ?auto_1550728 ?auto_1550730 ) ) ( not ( = ?auto_1550728 ?auto_1550732 ) ) ( not ( = ?auto_1550728 ?auto_1550733 ) ) ( not ( = ?auto_1550728 ?auto_1550734 ) ) ( not ( = ?auto_1550728 ?auto_1550735 ) ) ( not ( = ?auto_1550728 ?auto_1550736 ) ) ( not ( = ?auto_1550728 ?auto_1550737 ) ) ( not ( = ?auto_1550728 ?auto_1550740 ) ) ( not ( = ?auto_1550725 ?auto_1550729 ) ) ( not ( = ?auto_1550725 ?auto_1550731 ) ) ( not ( = ?auto_1550725 ?auto_1550730 ) ) ( not ( = ?auto_1550725 ?auto_1550732 ) ) ( not ( = ?auto_1550725 ?auto_1550733 ) ) ( not ( = ?auto_1550725 ?auto_1550734 ) ) ( not ( = ?auto_1550725 ?auto_1550735 ) ) ( not ( = ?auto_1550725 ?auto_1550736 ) ) ( not ( = ?auto_1550725 ?auto_1550737 ) ) ( not ( = ?auto_1550725 ?auto_1550740 ) ) ( not ( = ?auto_1550729 ?auto_1550731 ) ) ( not ( = ?auto_1550729 ?auto_1550730 ) ) ( not ( = ?auto_1550729 ?auto_1550732 ) ) ( not ( = ?auto_1550729 ?auto_1550733 ) ) ( not ( = ?auto_1550729 ?auto_1550734 ) ) ( not ( = ?auto_1550729 ?auto_1550735 ) ) ( not ( = ?auto_1550729 ?auto_1550736 ) ) ( not ( = ?auto_1550729 ?auto_1550737 ) ) ( not ( = ?auto_1550729 ?auto_1550740 ) ) ( not ( = ?auto_1550731 ?auto_1550730 ) ) ( not ( = ?auto_1550731 ?auto_1550732 ) ) ( not ( = ?auto_1550731 ?auto_1550733 ) ) ( not ( = ?auto_1550731 ?auto_1550734 ) ) ( not ( = ?auto_1550731 ?auto_1550735 ) ) ( not ( = ?auto_1550731 ?auto_1550736 ) ) ( not ( = ?auto_1550731 ?auto_1550737 ) ) ( not ( = ?auto_1550731 ?auto_1550740 ) ) ( not ( = ?auto_1550730 ?auto_1550732 ) ) ( not ( = ?auto_1550730 ?auto_1550733 ) ) ( not ( = ?auto_1550730 ?auto_1550734 ) ) ( not ( = ?auto_1550730 ?auto_1550735 ) ) ( not ( = ?auto_1550730 ?auto_1550736 ) ) ( not ( = ?auto_1550730 ?auto_1550737 ) ) ( not ( = ?auto_1550730 ?auto_1550740 ) ) ( not ( = ?auto_1550732 ?auto_1550733 ) ) ( not ( = ?auto_1550732 ?auto_1550734 ) ) ( not ( = ?auto_1550732 ?auto_1550735 ) ) ( not ( = ?auto_1550732 ?auto_1550736 ) ) ( not ( = ?auto_1550732 ?auto_1550737 ) ) ( not ( = ?auto_1550732 ?auto_1550740 ) ) ( not ( = ?auto_1550733 ?auto_1550734 ) ) ( not ( = ?auto_1550733 ?auto_1550735 ) ) ( not ( = ?auto_1550733 ?auto_1550736 ) ) ( not ( = ?auto_1550733 ?auto_1550737 ) ) ( not ( = ?auto_1550733 ?auto_1550740 ) ) ( not ( = ?auto_1550734 ?auto_1550735 ) ) ( not ( = ?auto_1550734 ?auto_1550736 ) ) ( not ( = ?auto_1550734 ?auto_1550737 ) ) ( not ( = ?auto_1550734 ?auto_1550740 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1550735 ?auto_1550736 ?auto_1550737 )
      ( MAKE-12CRATE-VERIFY ?auto_1550726 ?auto_1550727 ?auto_1550728 ?auto_1550725 ?auto_1550729 ?auto_1550731 ?auto_1550730 ?auto_1550732 ?auto_1550733 ?auto_1550734 ?auto_1550735 ?auto_1550736 ?auto_1550737 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1550889 - SURFACE
      ?auto_1550890 - SURFACE
      ?auto_1550891 - SURFACE
      ?auto_1550888 - SURFACE
      ?auto_1550892 - SURFACE
      ?auto_1550894 - SURFACE
      ?auto_1550893 - SURFACE
      ?auto_1550895 - SURFACE
      ?auto_1550896 - SURFACE
      ?auto_1550897 - SURFACE
      ?auto_1550898 - SURFACE
      ?auto_1550899 - SURFACE
      ?auto_1550900 - SURFACE
    )
    :vars
    (
      ?auto_1550903 - HOIST
      ?auto_1550902 - PLACE
      ?auto_1550905 - PLACE
      ?auto_1550901 - HOIST
      ?auto_1550906 - SURFACE
      ?auto_1550904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1550903 ?auto_1550902 ) ( IS-CRATE ?auto_1550900 ) ( not ( = ?auto_1550899 ?auto_1550900 ) ) ( not ( = ?auto_1550898 ?auto_1550899 ) ) ( not ( = ?auto_1550898 ?auto_1550900 ) ) ( not ( = ?auto_1550905 ?auto_1550902 ) ) ( HOIST-AT ?auto_1550901 ?auto_1550905 ) ( not ( = ?auto_1550903 ?auto_1550901 ) ) ( AVAILABLE ?auto_1550901 ) ( SURFACE-AT ?auto_1550900 ?auto_1550905 ) ( ON ?auto_1550900 ?auto_1550906 ) ( CLEAR ?auto_1550900 ) ( not ( = ?auto_1550899 ?auto_1550906 ) ) ( not ( = ?auto_1550900 ?auto_1550906 ) ) ( not ( = ?auto_1550898 ?auto_1550906 ) ) ( TRUCK-AT ?auto_1550904 ?auto_1550902 ) ( SURFACE-AT ?auto_1550898 ?auto_1550902 ) ( CLEAR ?auto_1550898 ) ( LIFTING ?auto_1550903 ?auto_1550899 ) ( IS-CRATE ?auto_1550899 ) ( ON ?auto_1550890 ?auto_1550889 ) ( ON ?auto_1550891 ?auto_1550890 ) ( ON ?auto_1550888 ?auto_1550891 ) ( ON ?auto_1550892 ?auto_1550888 ) ( ON ?auto_1550894 ?auto_1550892 ) ( ON ?auto_1550893 ?auto_1550894 ) ( ON ?auto_1550895 ?auto_1550893 ) ( ON ?auto_1550896 ?auto_1550895 ) ( ON ?auto_1550897 ?auto_1550896 ) ( ON ?auto_1550898 ?auto_1550897 ) ( not ( = ?auto_1550889 ?auto_1550890 ) ) ( not ( = ?auto_1550889 ?auto_1550891 ) ) ( not ( = ?auto_1550889 ?auto_1550888 ) ) ( not ( = ?auto_1550889 ?auto_1550892 ) ) ( not ( = ?auto_1550889 ?auto_1550894 ) ) ( not ( = ?auto_1550889 ?auto_1550893 ) ) ( not ( = ?auto_1550889 ?auto_1550895 ) ) ( not ( = ?auto_1550889 ?auto_1550896 ) ) ( not ( = ?auto_1550889 ?auto_1550897 ) ) ( not ( = ?auto_1550889 ?auto_1550898 ) ) ( not ( = ?auto_1550889 ?auto_1550899 ) ) ( not ( = ?auto_1550889 ?auto_1550900 ) ) ( not ( = ?auto_1550889 ?auto_1550906 ) ) ( not ( = ?auto_1550890 ?auto_1550891 ) ) ( not ( = ?auto_1550890 ?auto_1550888 ) ) ( not ( = ?auto_1550890 ?auto_1550892 ) ) ( not ( = ?auto_1550890 ?auto_1550894 ) ) ( not ( = ?auto_1550890 ?auto_1550893 ) ) ( not ( = ?auto_1550890 ?auto_1550895 ) ) ( not ( = ?auto_1550890 ?auto_1550896 ) ) ( not ( = ?auto_1550890 ?auto_1550897 ) ) ( not ( = ?auto_1550890 ?auto_1550898 ) ) ( not ( = ?auto_1550890 ?auto_1550899 ) ) ( not ( = ?auto_1550890 ?auto_1550900 ) ) ( not ( = ?auto_1550890 ?auto_1550906 ) ) ( not ( = ?auto_1550891 ?auto_1550888 ) ) ( not ( = ?auto_1550891 ?auto_1550892 ) ) ( not ( = ?auto_1550891 ?auto_1550894 ) ) ( not ( = ?auto_1550891 ?auto_1550893 ) ) ( not ( = ?auto_1550891 ?auto_1550895 ) ) ( not ( = ?auto_1550891 ?auto_1550896 ) ) ( not ( = ?auto_1550891 ?auto_1550897 ) ) ( not ( = ?auto_1550891 ?auto_1550898 ) ) ( not ( = ?auto_1550891 ?auto_1550899 ) ) ( not ( = ?auto_1550891 ?auto_1550900 ) ) ( not ( = ?auto_1550891 ?auto_1550906 ) ) ( not ( = ?auto_1550888 ?auto_1550892 ) ) ( not ( = ?auto_1550888 ?auto_1550894 ) ) ( not ( = ?auto_1550888 ?auto_1550893 ) ) ( not ( = ?auto_1550888 ?auto_1550895 ) ) ( not ( = ?auto_1550888 ?auto_1550896 ) ) ( not ( = ?auto_1550888 ?auto_1550897 ) ) ( not ( = ?auto_1550888 ?auto_1550898 ) ) ( not ( = ?auto_1550888 ?auto_1550899 ) ) ( not ( = ?auto_1550888 ?auto_1550900 ) ) ( not ( = ?auto_1550888 ?auto_1550906 ) ) ( not ( = ?auto_1550892 ?auto_1550894 ) ) ( not ( = ?auto_1550892 ?auto_1550893 ) ) ( not ( = ?auto_1550892 ?auto_1550895 ) ) ( not ( = ?auto_1550892 ?auto_1550896 ) ) ( not ( = ?auto_1550892 ?auto_1550897 ) ) ( not ( = ?auto_1550892 ?auto_1550898 ) ) ( not ( = ?auto_1550892 ?auto_1550899 ) ) ( not ( = ?auto_1550892 ?auto_1550900 ) ) ( not ( = ?auto_1550892 ?auto_1550906 ) ) ( not ( = ?auto_1550894 ?auto_1550893 ) ) ( not ( = ?auto_1550894 ?auto_1550895 ) ) ( not ( = ?auto_1550894 ?auto_1550896 ) ) ( not ( = ?auto_1550894 ?auto_1550897 ) ) ( not ( = ?auto_1550894 ?auto_1550898 ) ) ( not ( = ?auto_1550894 ?auto_1550899 ) ) ( not ( = ?auto_1550894 ?auto_1550900 ) ) ( not ( = ?auto_1550894 ?auto_1550906 ) ) ( not ( = ?auto_1550893 ?auto_1550895 ) ) ( not ( = ?auto_1550893 ?auto_1550896 ) ) ( not ( = ?auto_1550893 ?auto_1550897 ) ) ( not ( = ?auto_1550893 ?auto_1550898 ) ) ( not ( = ?auto_1550893 ?auto_1550899 ) ) ( not ( = ?auto_1550893 ?auto_1550900 ) ) ( not ( = ?auto_1550893 ?auto_1550906 ) ) ( not ( = ?auto_1550895 ?auto_1550896 ) ) ( not ( = ?auto_1550895 ?auto_1550897 ) ) ( not ( = ?auto_1550895 ?auto_1550898 ) ) ( not ( = ?auto_1550895 ?auto_1550899 ) ) ( not ( = ?auto_1550895 ?auto_1550900 ) ) ( not ( = ?auto_1550895 ?auto_1550906 ) ) ( not ( = ?auto_1550896 ?auto_1550897 ) ) ( not ( = ?auto_1550896 ?auto_1550898 ) ) ( not ( = ?auto_1550896 ?auto_1550899 ) ) ( not ( = ?auto_1550896 ?auto_1550900 ) ) ( not ( = ?auto_1550896 ?auto_1550906 ) ) ( not ( = ?auto_1550897 ?auto_1550898 ) ) ( not ( = ?auto_1550897 ?auto_1550899 ) ) ( not ( = ?auto_1550897 ?auto_1550900 ) ) ( not ( = ?auto_1550897 ?auto_1550906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1550898 ?auto_1550899 ?auto_1550900 )
      ( MAKE-12CRATE-VERIFY ?auto_1550889 ?auto_1550890 ?auto_1550891 ?auto_1550888 ?auto_1550892 ?auto_1550894 ?auto_1550893 ?auto_1550895 ?auto_1550896 ?auto_1550897 ?auto_1550898 ?auto_1550899 ?auto_1550900 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1551052 - SURFACE
      ?auto_1551053 - SURFACE
      ?auto_1551054 - SURFACE
      ?auto_1551051 - SURFACE
      ?auto_1551055 - SURFACE
      ?auto_1551057 - SURFACE
      ?auto_1551056 - SURFACE
      ?auto_1551058 - SURFACE
      ?auto_1551059 - SURFACE
      ?auto_1551060 - SURFACE
      ?auto_1551061 - SURFACE
      ?auto_1551062 - SURFACE
      ?auto_1551063 - SURFACE
    )
    :vars
    (
      ?auto_1551068 - HOIST
      ?auto_1551067 - PLACE
      ?auto_1551069 - PLACE
      ?auto_1551065 - HOIST
      ?auto_1551064 - SURFACE
      ?auto_1551066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1551068 ?auto_1551067 ) ( IS-CRATE ?auto_1551063 ) ( not ( = ?auto_1551062 ?auto_1551063 ) ) ( not ( = ?auto_1551061 ?auto_1551062 ) ) ( not ( = ?auto_1551061 ?auto_1551063 ) ) ( not ( = ?auto_1551069 ?auto_1551067 ) ) ( HOIST-AT ?auto_1551065 ?auto_1551069 ) ( not ( = ?auto_1551068 ?auto_1551065 ) ) ( AVAILABLE ?auto_1551065 ) ( SURFACE-AT ?auto_1551063 ?auto_1551069 ) ( ON ?auto_1551063 ?auto_1551064 ) ( CLEAR ?auto_1551063 ) ( not ( = ?auto_1551062 ?auto_1551064 ) ) ( not ( = ?auto_1551063 ?auto_1551064 ) ) ( not ( = ?auto_1551061 ?auto_1551064 ) ) ( TRUCK-AT ?auto_1551066 ?auto_1551067 ) ( SURFACE-AT ?auto_1551061 ?auto_1551067 ) ( CLEAR ?auto_1551061 ) ( IS-CRATE ?auto_1551062 ) ( AVAILABLE ?auto_1551068 ) ( IN ?auto_1551062 ?auto_1551066 ) ( ON ?auto_1551053 ?auto_1551052 ) ( ON ?auto_1551054 ?auto_1551053 ) ( ON ?auto_1551051 ?auto_1551054 ) ( ON ?auto_1551055 ?auto_1551051 ) ( ON ?auto_1551057 ?auto_1551055 ) ( ON ?auto_1551056 ?auto_1551057 ) ( ON ?auto_1551058 ?auto_1551056 ) ( ON ?auto_1551059 ?auto_1551058 ) ( ON ?auto_1551060 ?auto_1551059 ) ( ON ?auto_1551061 ?auto_1551060 ) ( not ( = ?auto_1551052 ?auto_1551053 ) ) ( not ( = ?auto_1551052 ?auto_1551054 ) ) ( not ( = ?auto_1551052 ?auto_1551051 ) ) ( not ( = ?auto_1551052 ?auto_1551055 ) ) ( not ( = ?auto_1551052 ?auto_1551057 ) ) ( not ( = ?auto_1551052 ?auto_1551056 ) ) ( not ( = ?auto_1551052 ?auto_1551058 ) ) ( not ( = ?auto_1551052 ?auto_1551059 ) ) ( not ( = ?auto_1551052 ?auto_1551060 ) ) ( not ( = ?auto_1551052 ?auto_1551061 ) ) ( not ( = ?auto_1551052 ?auto_1551062 ) ) ( not ( = ?auto_1551052 ?auto_1551063 ) ) ( not ( = ?auto_1551052 ?auto_1551064 ) ) ( not ( = ?auto_1551053 ?auto_1551054 ) ) ( not ( = ?auto_1551053 ?auto_1551051 ) ) ( not ( = ?auto_1551053 ?auto_1551055 ) ) ( not ( = ?auto_1551053 ?auto_1551057 ) ) ( not ( = ?auto_1551053 ?auto_1551056 ) ) ( not ( = ?auto_1551053 ?auto_1551058 ) ) ( not ( = ?auto_1551053 ?auto_1551059 ) ) ( not ( = ?auto_1551053 ?auto_1551060 ) ) ( not ( = ?auto_1551053 ?auto_1551061 ) ) ( not ( = ?auto_1551053 ?auto_1551062 ) ) ( not ( = ?auto_1551053 ?auto_1551063 ) ) ( not ( = ?auto_1551053 ?auto_1551064 ) ) ( not ( = ?auto_1551054 ?auto_1551051 ) ) ( not ( = ?auto_1551054 ?auto_1551055 ) ) ( not ( = ?auto_1551054 ?auto_1551057 ) ) ( not ( = ?auto_1551054 ?auto_1551056 ) ) ( not ( = ?auto_1551054 ?auto_1551058 ) ) ( not ( = ?auto_1551054 ?auto_1551059 ) ) ( not ( = ?auto_1551054 ?auto_1551060 ) ) ( not ( = ?auto_1551054 ?auto_1551061 ) ) ( not ( = ?auto_1551054 ?auto_1551062 ) ) ( not ( = ?auto_1551054 ?auto_1551063 ) ) ( not ( = ?auto_1551054 ?auto_1551064 ) ) ( not ( = ?auto_1551051 ?auto_1551055 ) ) ( not ( = ?auto_1551051 ?auto_1551057 ) ) ( not ( = ?auto_1551051 ?auto_1551056 ) ) ( not ( = ?auto_1551051 ?auto_1551058 ) ) ( not ( = ?auto_1551051 ?auto_1551059 ) ) ( not ( = ?auto_1551051 ?auto_1551060 ) ) ( not ( = ?auto_1551051 ?auto_1551061 ) ) ( not ( = ?auto_1551051 ?auto_1551062 ) ) ( not ( = ?auto_1551051 ?auto_1551063 ) ) ( not ( = ?auto_1551051 ?auto_1551064 ) ) ( not ( = ?auto_1551055 ?auto_1551057 ) ) ( not ( = ?auto_1551055 ?auto_1551056 ) ) ( not ( = ?auto_1551055 ?auto_1551058 ) ) ( not ( = ?auto_1551055 ?auto_1551059 ) ) ( not ( = ?auto_1551055 ?auto_1551060 ) ) ( not ( = ?auto_1551055 ?auto_1551061 ) ) ( not ( = ?auto_1551055 ?auto_1551062 ) ) ( not ( = ?auto_1551055 ?auto_1551063 ) ) ( not ( = ?auto_1551055 ?auto_1551064 ) ) ( not ( = ?auto_1551057 ?auto_1551056 ) ) ( not ( = ?auto_1551057 ?auto_1551058 ) ) ( not ( = ?auto_1551057 ?auto_1551059 ) ) ( not ( = ?auto_1551057 ?auto_1551060 ) ) ( not ( = ?auto_1551057 ?auto_1551061 ) ) ( not ( = ?auto_1551057 ?auto_1551062 ) ) ( not ( = ?auto_1551057 ?auto_1551063 ) ) ( not ( = ?auto_1551057 ?auto_1551064 ) ) ( not ( = ?auto_1551056 ?auto_1551058 ) ) ( not ( = ?auto_1551056 ?auto_1551059 ) ) ( not ( = ?auto_1551056 ?auto_1551060 ) ) ( not ( = ?auto_1551056 ?auto_1551061 ) ) ( not ( = ?auto_1551056 ?auto_1551062 ) ) ( not ( = ?auto_1551056 ?auto_1551063 ) ) ( not ( = ?auto_1551056 ?auto_1551064 ) ) ( not ( = ?auto_1551058 ?auto_1551059 ) ) ( not ( = ?auto_1551058 ?auto_1551060 ) ) ( not ( = ?auto_1551058 ?auto_1551061 ) ) ( not ( = ?auto_1551058 ?auto_1551062 ) ) ( not ( = ?auto_1551058 ?auto_1551063 ) ) ( not ( = ?auto_1551058 ?auto_1551064 ) ) ( not ( = ?auto_1551059 ?auto_1551060 ) ) ( not ( = ?auto_1551059 ?auto_1551061 ) ) ( not ( = ?auto_1551059 ?auto_1551062 ) ) ( not ( = ?auto_1551059 ?auto_1551063 ) ) ( not ( = ?auto_1551059 ?auto_1551064 ) ) ( not ( = ?auto_1551060 ?auto_1551061 ) ) ( not ( = ?auto_1551060 ?auto_1551062 ) ) ( not ( = ?auto_1551060 ?auto_1551063 ) ) ( not ( = ?auto_1551060 ?auto_1551064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1551061 ?auto_1551062 ?auto_1551063 )
      ( MAKE-12CRATE-VERIFY ?auto_1551052 ?auto_1551053 ?auto_1551054 ?auto_1551051 ?auto_1551055 ?auto_1551057 ?auto_1551056 ?auto_1551058 ?auto_1551059 ?auto_1551060 ?auto_1551061 ?auto_1551062 ?auto_1551063 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1562656 - SURFACE
      ?auto_1562657 - SURFACE
      ?auto_1562658 - SURFACE
      ?auto_1562655 - SURFACE
      ?auto_1562659 - SURFACE
      ?auto_1562661 - SURFACE
      ?auto_1562660 - SURFACE
      ?auto_1562662 - SURFACE
      ?auto_1562663 - SURFACE
      ?auto_1562664 - SURFACE
      ?auto_1562665 - SURFACE
      ?auto_1562666 - SURFACE
      ?auto_1562667 - SURFACE
      ?auto_1562668 - SURFACE
    )
    :vars
    (
      ?auto_1562669 - HOIST
      ?auto_1562670 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1562669 ?auto_1562670 ) ( SURFACE-AT ?auto_1562667 ?auto_1562670 ) ( CLEAR ?auto_1562667 ) ( LIFTING ?auto_1562669 ?auto_1562668 ) ( IS-CRATE ?auto_1562668 ) ( not ( = ?auto_1562667 ?auto_1562668 ) ) ( ON ?auto_1562657 ?auto_1562656 ) ( ON ?auto_1562658 ?auto_1562657 ) ( ON ?auto_1562655 ?auto_1562658 ) ( ON ?auto_1562659 ?auto_1562655 ) ( ON ?auto_1562661 ?auto_1562659 ) ( ON ?auto_1562660 ?auto_1562661 ) ( ON ?auto_1562662 ?auto_1562660 ) ( ON ?auto_1562663 ?auto_1562662 ) ( ON ?auto_1562664 ?auto_1562663 ) ( ON ?auto_1562665 ?auto_1562664 ) ( ON ?auto_1562666 ?auto_1562665 ) ( ON ?auto_1562667 ?auto_1562666 ) ( not ( = ?auto_1562656 ?auto_1562657 ) ) ( not ( = ?auto_1562656 ?auto_1562658 ) ) ( not ( = ?auto_1562656 ?auto_1562655 ) ) ( not ( = ?auto_1562656 ?auto_1562659 ) ) ( not ( = ?auto_1562656 ?auto_1562661 ) ) ( not ( = ?auto_1562656 ?auto_1562660 ) ) ( not ( = ?auto_1562656 ?auto_1562662 ) ) ( not ( = ?auto_1562656 ?auto_1562663 ) ) ( not ( = ?auto_1562656 ?auto_1562664 ) ) ( not ( = ?auto_1562656 ?auto_1562665 ) ) ( not ( = ?auto_1562656 ?auto_1562666 ) ) ( not ( = ?auto_1562656 ?auto_1562667 ) ) ( not ( = ?auto_1562656 ?auto_1562668 ) ) ( not ( = ?auto_1562657 ?auto_1562658 ) ) ( not ( = ?auto_1562657 ?auto_1562655 ) ) ( not ( = ?auto_1562657 ?auto_1562659 ) ) ( not ( = ?auto_1562657 ?auto_1562661 ) ) ( not ( = ?auto_1562657 ?auto_1562660 ) ) ( not ( = ?auto_1562657 ?auto_1562662 ) ) ( not ( = ?auto_1562657 ?auto_1562663 ) ) ( not ( = ?auto_1562657 ?auto_1562664 ) ) ( not ( = ?auto_1562657 ?auto_1562665 ) ) ( not ( = ?auto_1562657 ?auto_1562666 ) ) ( not ( = ?auto_1562657 ?auto_1562667 ) ) ( not ( = ?auto_1562657 ?auto_1562668 ) ) ( not ( = ?auto_1562658 ?auto_1562655 ) ) ( not ( = ?auto_1562658 ?auto_1562659 ) ) ( not ( = ?auto_1562658 ?auto_1562661 ) ) ( not ( = ?auto_1562658 ?auto_1562660 ) ) ( not ( = ?auto_1562658 ?auto_1562662 ) ) ( not ( = ?auto_1562658 ?auto_1562663 ) ) ( not ( = ?auto_1562658 ?auto_1562664 ) ) ( not ( = ?auto_1562658 ?auto_1562665 ) ) ( not ( = ?auto_1562658 ?auto_1562666 ) ) ( not ( = ?auto_1562658 ?auto_1562667 ) ) ( not ( = ?auto_1562658 ?auto_1562668 ) ) ( not ( = ?auto_1562655 ?auto_1562659 ) ) ( not ( = ?auto_1562655 ?auto_1562661 ) ) ( not ( = ?auto_1562655 ?auto_1562660 ) ) ( not ( = ?auto_1562655 ?auto_1562662 ) ) ( not ( = ?auto_1562655 ?auto_1562663 ) ) ( not ( = ?auto_1562655 ?auto_1562664 ) ) ( not ( = ?auto_1562655 ?auto_1562665 ) ) ( not ( = ?auto_1562655 ?auto_1562666 ) ) ( not ( = ?auto_1562655 ?auto_1562667 ) ) ( not ( = ?auto_1562655 ?auto_1562668 ) ) ( not ( = ?auto_1562659 ?auto_1562661 ) ) ( not ( = ?auto_1562659 ?auto_1562660 ) ) ( not ( = ?auto_1562659 ?auto_1562662 ) ) ( not ( = ?auto_1562659 ?auto_1562663 ) ) ( not ( = ?auto_1562659 ?auto_1562664 ) ) ( not ( = ?auto_1562659 ?auto_1562665 ) ) ( not ( = ?auto_1562659 ?auto_1562666 ) ) ( not ( = ?auto_1562659 ?auto_1562667 ) ) ( not ( = ?auto_1562659 ?auto_1562668 ) ) ( not ( = ?auto_1562661 ?auto_1562660 ) ) ( not ( = ?auto_1562661 ?auto_1562662 ) ) ( not ( = ?auto_1562661 ?auto_1562663 ) ) ( not ( = ?auto_1562661 ?auto_1562664 ) ) ( not ( = ?auto_1562661 ?auto_1562665 ) ) ( not ( = ?auto_1562661 ?auto_1562666 ) ) ( not ( = ?auto_1562661 ?auto_1562667 ) ) ( not ( = ?auto_1562661 ?auto_1562668 ) ) ( not ( = ?auto_1562660 ?auto_1562662 ) ) ( not ( = ?auto_1562660 ?auto_1562663 ) ) ( not ( = ?auto_1562660 ?auto_1562664 ) ) ( not ( = ?auto_1562660 ?auto_1562665 ) ) ( not ( = ?auto_1562660 ?auto_1562666 ) ) ( not ( = ?auto_1562660 ?auto_1562667 ) ) ( not ( = ?auto_1562660 ?auto_1562668 ) ) ( not ( = ?auto_1562662 ?auto_1562663 ) ) ( not ( = ?auto_1562662 ?auto_1562664 ) ) ( not ( = ?auto_1562662 ?auto_1562665 ) ) ( not ( = ?auto_1562662 ?auto_1562666 ) ) ( not ( = ?auto_1562662 ?auto_1562667 ) ) ( not ( = ?auto_1562662 ?auto_1562668 ) ) ( not ( = ?auto_1562663 ?auto_1562664 ) ) ( not ( = ?auto_1562663 ?auto_1562665 ) ) ( not ( = ?auto_1562663 ?auto_1562666 ) ) ( not ( = ?auto_1562663 ?auto_1562667 ) ) ( not ( = ?auto_1562663 ?auto_1562668 ) ) ( not ( = ?auto_1562664 ?auto_1562665 ) ) ( not ( = ?auto_1562664 ?auto_1562666 ) ) ( not ( = ?auto_1562664 ?auto_1562667 ) ) ( not ( = ?auto_1562664 ?auto_1562668 ) ) ( not ( = ?auto_1562665 ?auto_1562666 ) ) ( not ( = ?auto_1562665 ?auto_1562667 ) ) ( not ( = ?auto_1562665 ?auto_1562668 ) ) ( not ( = ?auto_1562666 ?auto_1562667 ) ) ( not ( = ?auto_1562666 ?auto_1562668 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1562667 ?auto_1562668 )
      ( MAKE-13CRATE-VERIFY ?auto_1562656 ?auto_1562657 ?auto_1562658 ?auto_1562655 ?auto_1562659 ?auto_1562661 ?auto_1562660 ?auto_1562662 ?auto_1562663 ?auto_1562664 ?auto_1562665 ?auto_1562666 ?auto_1562667 ?auto_1562668 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1562798 - SURFACE
      ?auto_1562799 - SURFACE
      ?auto_1562800 - SURFACE
      ?auto_1562797 - SURFACE
      ?auto_1562801 - SURFACE
      ?auto_1562803 - SURFACE
      ?auto_1562802 - SURFACE
      ?auto_1562804 - SURFACE
      ?auto_1562805 - SURFACE
      ?auto_1562806 - SURFACE
      ?auto_1562807 - SURFACE
      ?auto_1562808 - SURFACE
      ?auto_1562809 - SURFACE
      ?auto_1562810 - SURFACE
    )
    :vars
    (
      ?auto_1562811 - HOIST
      ?auto_1562812 - PLACE
      ?auto_1562813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1562811 ?auto_1562812 ) ( SURFACE-AT ?auto_1562809 ?auto_1562812 ) ( CLEAR ?auto_1562809 ) ( IS-CRATE ?auto_1562810 ) ( not ( = ?auto_1562809 ?auto_1562810 ) ) ( TRUCK-AT ?auto_1562813 ?auto_1562812 ) ( AVAILABLE ?auto_1562811 ) ( IN ?auto_1562810 ?auto_1562813 ) ( ON ?auto_1562809 ?auto_1562808 ) ( not ( = ?auto_1562808 ?auto_1562809 ) ) ( not ( = ?auto_1562808 ?auto_1562810 ) ) ( ON ?auto_1562799 ?auto_1562798 ) ( ON ?auto_1562800 ?auto_1562799 ) ( ON ?auto_1562797 ?auto_1562800 ) ( ON ?auto_1562801 ?auto_1562797 ) ( ON ?auto_1562803 ?auto_1562801 ) ( ON ?auto_1562802 ?auto_1562803 ) ( ON ?auto_1562804 ?auto_1562802 ) ( ON ?auto_1562805 ?auto_1562804 ) ( ON ?auto_1562806 ?auto_1562805 ) ( ON ?auto_1562807 ?auto_1562806 ) ( ON ?auto_1562808 ?auto_1562807 ) ( not ( = ?auto_1562798 ?auto_1562799 ) ) ( not ( = ?auto_1562798 ?auto_1562800 ) ) ( not ( = ?auto_1562798 ?auto_1562797 ) ) ( not ( = ?auto_1562798 ?auto_1562801 ) ) ( not ( = ?auto_1562798 ?auto_1562803 ) ) ( not ( = ?auto_1562798 ?auto_1562802 ) ) ( not ( = ?auto_1562798 ?auto_1562804 ) ) ( not ( = ?auto_1562798 ?auto_1562805 ) ) ( not ( = ?auto_1562798 ?auto_1562806 ) ) ( not ( = ?auto_1562798 ?auto_1562807 ) ) ( not ( = ?auto_1562798 ?auto_1562808 ) ) ( not ( = ?auto_1562798 ?auto_1562809 ) ) ( not ( = ?auto_1562798 ?auto_1562810 ) ) ( not ( = ?auto_1562799 ?auto_1562800 ) ) ( not ( = ?auto_1562799 ?auto_1562797 ) ) ( not ( = ?auto_1562799 ?auto_1562801 ) ) ( not ( = ?auto_1562799 ?auto_1562803 ) ) ( not ( = ?auto_1562799 ?auto_1562802 ) ) ( not ( = ?auto_1562799 ?auto_1562804 ) ) ( not ( = ?auto_1562799 ?auto_1562805 ) ) ( not ( = ?auto_1562799 ?auto_1562806 ) ) ( not ( = ?auto_1562799 ?auto_1562807 ) ) ( not ( = ?auto_1562799 ?auto_1562808 ) ) ( not ( = ?auto_1562799 ?auto_1562809 ) ) ( not ( = ?auto_1562799 ?auto_1562810 ) ) ( not ( = ?auto_1562800 ?auto_1562797 ) ) ( not ( = ?auto_1562800 ?auto_1562801 ) ) ( not ( = ?auto_1562800 ?auto_1562803 ) ) ( not ( = ?auto_1562800 ?auto_1562802 ) ) ( not ( = ?auto_1562800 ?auto_1562804 ) ) ( not ( = ?auto_1562800 ?auto_1562805 ) ) ( not ( = ?auto_1562800 ?auto_1562806 ) ) ( not ( = ?auto_1562800 ?auto_1562807 ) ) ( not ( = ?auto_1562800 ?auto_1562808 ) ) ( not ( = ?auto_1562800 ?auto_1562809 ) ) ( not ( = ?auto_1562800 ?auto_1562810 ) ) ( not ( = ?auto_1562797 ?auto_1562801 ) ) ( not ( = ?auto_1562797 ?auto_1562803 ) ) ( not ( = ?auto_1562797 ?auto_1562802 ) ) ( not ( = ?auto_1562797 ?auto_1562804 ) ) ( not ( = ?auto_1562797 ?auto_1562805 ) ) ( not ( = ?auto_1562797 ?auto_1562806 ) ) ( not ( = ?auto_1562797 ?auto_1562807 ) ) ( not ( = ?auto_1562797 ?auto_1562808 ) ) ( not ( = ?auto_1562797 ?auto_1562809 ) ) ( not ( = ?auto_1562797 ?auto_1562810 ) ) ( not ( = ?auto_1562801 ?auto_1562803 ) ) ( not ( = ?auto_1562801 ?auto_1562802 ) ) ( not ( = ?auto_1562801 ?auto_1562804 ) ) ( not ( = ?auto_1562801 ?auto_1562805 ) ) ( not ( = ?auto_1562801 ?auto_1562806 ) ) ( not ( = ?auto_1562801 ?auto_1562807 ) ) ( not ( = ?auto_1562801 ?auto_1562808 ) ) ( not ( = ?auto_1562801 ?auto_1562809 ) ) ( not ( = ?auto_1562801 ?auto_1562810 ) ) ( not ( = ?auto_1562803 ?auto_1562802 ) ) ( not ( = ?auto_1562803 ?auto_1562804 ) ) ( not ( = ?auto_1562803 ?auto_1562805 ) ) ( not ( = ?auto_1562803 ?auto_1562806 ) ) ( not ( = ?auto_1562803 ?auto_1562807 ) ) ( not ( = ?auto_1562803 ?auto_1562808 ) ) ( not ( = ?auto_1562803 ?auto_1562809 ) ) ( not ( = ?auto_1562803 ?auto_1562810 ) ) ( not ( = ?auto_1562802 ?auto_1562804 ) ) ( not ( = ?auto_1562802 ?auto_1562805 ) ) ( not ( = ?auto_1562802 ?auto_1562806 ) ) ( not ( = ?auto_1562802 ?auto_1562807 ) ) ( not ( = ?auto_1562802 ?auto_1562808 ) ) ( not ( = ?auto_1562802 ?auto_1562809 ) ) ( not ( = ?auto_1562802 ?auto_1562810 ) ) ( not ( = ?auto_1562804 ?auto_1562805 ) ) ( not ( = ?auto_1562804 ?auto_1562806 ) ) ( not ( = ?auto_1562804 ?auto_1562807 ) ) ( not ( = ?auto_1562804 ?auto_1562808 ) ) ( not ( = ?auto_1562804 ?auto_1562809 ) ) ( not ( = ?auto_1562804 ?auto_1562810 ) ) ( not ( = ?auto_1562805 ?auto_1562806 ) ) ( not ( = ?auto_1562805 ?auto_1562807 ) ) ( not ( = ?auto_1562805 ?auto_1562808 ) ) ( not ( = ?auto_1562805 ?auto_1562809 ) ) ( not ( = ?auto_1562805 ?auto_1562810 ) ) ( not ( = ?auto_1562806 ?auto_1562807 ) ) ( not ( = ?auto_1562806 ?auto_1562808 ) ) ( not ( = ?auto_1562806 ?auto_1562809 ) ) ( not ( = ?auto_1562806 ?auto_1562810 ) ) ( not ( = ?auto_1562807 ?auto_1562808 ) ) ( not ( = ?auto_1562807 ?auto_1562809 ) ) ( not ( = ?auto_1562807 ?auto_1562810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1562808 ?auto_1562809 ?auto_1562810 )
      ( MAKE-13CRATE-VERIFY ?auto_1562798 ?auto_1562799 ?auto_1562800 ?auto_1562797 ?auto_1562801 ?auto_1562803 ?auto_1562802 ?auto_1562804 ?auto_1562805 ?auto_1562806 ?auto_1562807 ?auto_1562808 ?auto_1562809 ?auto_1562810 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1562954 - SURFACE
      ?auto_1562955 - SURFACE
      ?auto_1562956 - SURFACE
      ?auto_1562953 - SURFACE
      ?auto_1562957 - SURFACE
      ?auto_1562959 - SURFACE
      ?auto_1562958 - SURFACE
      ?auto_1562960 - SURFACE
      ?auto_1562961 - SURFACE
      ?auto_1562962 - SURFACE
      ?auto_1562963 - SURFACE
      ?auto_1562964 - SURFACE
      ?auto_1562965 - SURFACE
      ?auto_1562966 - SURFACE
    )
    :vars
    (
      ?auto_1562969 - HOIST
      ?auto_1562967 - PLACE
      ?auto_1562968 - TRUCK
      ?auto_1562970 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1562969 ?auto_1562967 ) ( SURFACE-AT ?auto_1562965 ?auto_1562967 ) ( CLEAR ?auto_1562965 ) ( IS-CRATE ?auto_1562966 ) ( not ( = ?auto_1562965 ?auto_1562966 ) ) ( AVAILABLE ?auto_1562969 ) ( IN ?auto_1562966 ?auto_1562968 ) ( ON ?auto_1562965 ?auto_1562964 ) ( not ( = ?auto_1562964 ?auto_1562965 ) ) ( not ( = ?auto_1562964 ?auto_1562966 ) ) ( TRUCK-AT ?auto_1562968 ?auto_1562970 ) ( not ( = ?auto_1562970 ?auto_1562967 ) ) ( ON ?auto_1562955 ?auto_1562954 ) ( ON ?auto_1562956 ?auto_1562955 ) ( ON ?auto_1562953 ?auto_1562956 ) ( ON ?auto_1562957 ?auto_1562953 ) ( ON ?auto_1562959 ?auto_1562957 ) ( ON ?auto_1562958 ?auto_1562959 ) ( ON ?auto_1562960 ?auto_1562958 ) ( ON ?auto_1562961 ?auto_1562960 ) ( ON ?auto_1562962 ?auto_1562961 ) ( ON ?auto_1562963 ?auto_1562962 ) ( ON ?auto_1562964 ?auto_1562963 ) ( not ( = ?auto_1562954 ?auto_1562955 ) ) ( not ( = ?auto_1562954 ?auto_1562956 ) ) ( not ( = ?auto_1562954 ?auto_1562953 ) ) ( not ( = ?auto_1562954 ?auto_1562957 ) ) ( not ( = ?auto_1562954 ?auto_1562959 ) ) ( not ( = ?auto_1562954 ?auto_1562958 ) ) ( not ( = ?auto_1562954 ?auto_1562960 ) ) ( not ( = ?auto_1562954 ?auto_1562961 ) ) ( not ( = ?auto_1562954 ?auto_1562962 ) ) ( not ( = ?auto_1562954 ?auto_1562963 ) ) ( not ( = ?auto_1562954 ?auto_1562964 ) ) ( not ( = ?auto_1562954 ?auto_1562965 ) ) ( not ( = ?auto_1562954 ?auto_1562966 ) ) ( not ( = ?auto_1562955 ?auto_1562956 ) ) ( not ( = ?auto_1562955 ?auto_1562953 ) ) ( not ( = ?auto_1562955 ?auto_1562957 ) ) ( not ( = ?auto_1562955 ?auto_1562959 ) ) ( not ( = ?auto_1562955 ?auto_1562958 ) ) ( not ( = ?auto_1562955 ?auto_1562960 ) ) ( not ( = ?auto_1562955 ?auto_1562961 ) ) ( not ( = ?auto_1562955 ?auto_1562962 ) ) ( not ( = ?auto_1562955 ?auto_1562963 ) ) ( not ( = ?auto_1562955 ?auto_1562964 ) ) ( not ( = ?auto_1562955 ?auto_1562965 ) ) ( not ( = ?auto_1562955 ?auto_1562966 ) ) ( not ( = ?auto_1562956 ?auto_1562953 ) ) ( not ( = ?auto_1562956 ?auto_1562957 ) ) ( not ( = ?auto_1562956 ?auto_1562959 ) ) ( not ( = ?auto_1562956 ?auto_1562958 ) ) ( not ( = ?auto_1562956 ?auto_1562960 ) ) ( not ( = ?auto_1562956 ?auto_1562961 ) ) ( not ( = ?auto_1562956 ?auto_1562962 ) ) ( not ( = ?auto_1562956 ?auto_1562963 ) ) ( not ( = ?auto_1562956 ?auto_1562964 ) ) ( not ( = ?auto_1562956 ?auto_1562965 ) ) ( not ( = ?auto_1562956 ?auto_1562966 ) ) ( not ( = ?auto_1562953 ?auto_1562957 ) ) ( not ( = ?auto_1562953 ?auto_1562959 ) ) ( not ( = ?auto_1562953 ?auto_1562958 ) ) ( not ( = ?auto_1562953 ?auto_1562960 ) ) ( not ( = ?auto_1562953 ?auto_1562961 ) ) ( not ( = ?auto_1562953 ?auto_1562962 ) ) ( not ( = ?auto_1562953 ?auto_1562963 ) ) ( not ( = ?auto_1562953 ?auto_1562964 ) ) ( not ( = ?auto_1562953 ?auto_1562965 ) ) ( not ( = ?auto_1562953 ?auto_1562966 ) ) ( not ( = ?auto_1562957 ?auto_1562959 ) ) ( not ( = ?auto_1562957 ?auto_1562958 ) ) ( not ( = ?auto_1562957 ?auto_1562960 ) ) ( not ( = ?auto_1562957 ?auto_1562961 ) ) ( not ( = ?auto_1562957 ?auto_1562962 ) ) ( not ( = ?auto_1562957 ?auto_1562963 ) ) ( not ( = ?auto_1562957 ?auto_1562964 ) ) ( not ( = ?auto_1562957 ?auto_1562965 ) ) ( not ( = ?auto_1562957 ?auto_1562966 ) ) ( not ( = ?auto_1562959 ?auto_1562958 ) ) ( not ( = ?auto_1562959 ?auto_1562960 ) ) ( not ( = ?auto_1562959 ?auto_1562961 ) ) ( not ( = ?auto_1562959 ?auto_1562962 ) ) ( not ( = ?auto_1562959 ?auto_1562963 ) ) ( not ( = ?auto_1562959 ?auto_1562964 ) ) ( not ( = ?auto_1562959 ?auto_1562965 ) ) ( not ( = ?auto_1562959 ?auto_1562966 ) ) ( not ( = ?auto_1562958 ?auto_1562960 ) ) ( not ( = ?auto_1562958 ?auto_1562961 ) ) ( not ( = ?auto_1562958 ?auto_1562962 ) ) ( not ( = ?auto_1562958 ?auto_1562963 ) ) ( not ( = ?auto_1562958 ?auto_1562964 ) ) ( not ( = ?auto_1562958 ?auto_1562965 ) ) ( not ( = ?auto_1562958 ?auto_1562966 ) ) ( not ( = ?auto_1562960 ?auto_1562961 ) ) ( not ( = ?auto_1562960 ?auto_1562962 ) ) ( not ( = ?auto_1562960 ?auto_1562963 ) ) ( not ( = ?auto_1562960 ?auto_1562964 ) ) ( not ( = ?auto_1562960 ?auto_1562965 ) ) ( not ( = ?auto_1562960 ?auto_1562966 ) ) ( not ( = ?auto_1562961 ?auto_1562962 ) ) ( not ( = ?auto_1562961 ?auto_1562963 ) ) ( not ( = ?auto_1562961 ?auto_1562964 ) ) ( not ( = ?auto_1562961 ?auto_1562965 ) ) ( not ( = ?auto_1562961 ?auto_1562966 ) ) ( not ( = ?auto_1562962 ?auto_1562963 ) ) ( not ( = ?auto_1562962 ?auto_1562964 ) ) ( not ( = ?auto_1562962 ?auto_1562965 ) ) ( not ( = ?auto_1562962 ?auto_1562966 ) ) ( not ( = ?auto_1562963 ?auto_1562964 ) ) ( not ( = ?auto_1562963 ?auto_1562965 ) ) ( not ( = ?auto_1562963 ?auto_1562966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1562964 ?auto_1562965 ?auto_1562966 )
      ( MAKE-13CRATE-VERIFY ?auto_1562954 ?auto_1562955 ?auto_1562956 ?auto_1562953 ?auto_1562957 ?auto_1562959 ?auto_1562958 ?auto_1562960 ?auto_1562961 ?auto_1562962 ?auto_1562963 ?auto_1562964 ?auto_1562965 ?auto_1562966 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1563123 - SURFACE
      ?auto_1563124 - SURFACE
      ?auto_1563125 - SURFACE
      ?auto_1563122 - SURFACE
      ?auto_1563126 - SURFACE
      ?auto_1563128 - SURFACE
      ?auto_1563127 - SURFACE
      ?auto_1563129 - SURFACE
      ?auto_1563130 - SURFACE
      ?auto_1563131 - SURFACE
      ?auto_1563132 - SURFACE
      ?auto_1563133 - SURFACE
      ?auto_1563134 - SURFACE
      ?auto_1563135 - SURFACE
    )
    :vars
    (
      ?auto_1563140 - HOIST
      ?auto_1563136 - PLACE
      ?auto_1563138 - TRUCK
      ?auto_1563139 - PLACE
      ?auto_1563137 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1563140 ?auto_1563136 ) ( SURFACE-AT ?auto_1563134 ?auto_1563136 ) ( CLEAR ?auto_1563134 ) ( IS-CRATE ?auto_1563135 ) ( not ( = ?auto_1563134 ?auto_1563135 ) ) ( AVAILABLE ?auto_1563140 ) ( ON ?auto_1563134 ?auto_1563133 ) ( not ( = ?auto_1563133 ?auto_1563134 ) ) ( not ( = ?auto_1563133 ?auto_1563135 ) ) ( TRUCK-AT ?auto_1563138 ?auto_1563139 ) ( not ( = ?auto_1563139 ?auto_1563136 ) ) ( HOIST-AT ?auto_1563137 ?auto_1563139 ) ( LIFTING ?auto_1563137 ?auto_1563135 ) ( not ( = ?auto_1563140 ?auto_1563137 ) ) ( ON ?auto_1563124 ?auto_1563123 ) ( ON ?auto_1563125 ?auto_1563124 ) ( ON ?auto_1563122 ?auto_1563125 ) ( ON ?auto_1563126 ?auto_1563122 ) ( ON ?auto_1563128 ?auto_1563126 ) ( ON ?auto_1563127 ?auto_1563128 ) ( ON ?auto_1563129 ?auto_1563127 ) ( ON ?auto_1563130 ?auto_1563129 ) ( ON ?auto_1563131 ?auto_1563130 ) ( ON ?auto_1563132 ?auto_1563131 ) ( ON ?auto_1563133 ?auto_1563132 ) ( not ( = ?auto_1563123 ?auto_1563124 ) ) ( not ( = ?auto_1563123 ?auto_1563125 ) ) ( not ( = ?auto_1563123 ?auto_1563122 ) ) ( not ( = ?auto_1563123 ?auto_1563126 ) ) ( not ( = ?auto_1563123 ?auto_1563128 ) ) ( not ( = ?auto_1563123 ?auto_1563127 ) ) ( not ( = ?auto_1563123 ?auto_1563129 ) ) ( not ( = ?auto_1563123 ?auto_1563130 ) ) ( not ( = ?auto_1563123 ?auto_1563131 ) ) ( not ( = ?auto_1563123 ?auto_1563132 ) ) ( not ( = ?auto_1563123 ?auto_1563133 ) ) ( not ( = ?auto_1563123 ?auto_1563134 ) ) ( not ( = ?auto_1563123 ?auto_1563135 ) ) ( not ( = ?auto_1563124 ?auto_1563125 ) ) ( not ( = ?auto_1563124 ?auto_1563122 ) ) ( not ( = ?auto_1563124 ?auto_1563126 ) ) ( not ( = ?auto_1563124 ?auto_1563128 ) ) ( not ( = ?auto_1563124 ?auto_1563127 ) ) ( not ( = ?auto_1563124 ?auto_1563129 ) ) ( not ( = ?auto_1563124 ?auto_1563130 ) ) ( not ( = ?auto_1563124 ?auto_1563131 ) ) ( not ( = ?auto_1563124 ?auto_1563132 ) ) ( not ( = ?auto_1563124 ?auto_1563133 ) ) ( not ( = ?auto_1563124 ?auto_1563134 ) ) ( not ( = ?auto_1563124 ?auto_1563135 ) ) ( not ( = ?auto_1563125 ?auto_1563122 ) ) ( not ( = ?auto_1563125 ?auto_1563126 ) ) ( not ( = ?auto_1563125 ?auto_1563128 ) ) ( not ( = ?auto_1563125 ?auto_1563127 ) ) ( not ( = ?auto_1563125 ?auto_1563129 ) ) ( not ( = ?auto_1563125 ?auto_1563130 ) ) ( not ( = ?auto_1563125 ?auto_1563131 ) ) ( not ( = ?auto_1563125 ?auto_1563132 ) ) ( not ( = ?auto_1563125 ?auto_1563133 ) ) ( not ( = ?auto_1563125 ?auto_1563134 ) ) ( not ( = ?auto_1563125 ?auto_1563135 ) ) ( not ( = ?auto_1563122 ?auto_1563126 ) ) ( not ( = ?auto_1563122 ?auto_1563128 ) ) ( not ( = ?auto_1563122 ?auto_1563127 ) ) ( not ( = ?auto_1563122 ?auto_1563129 ) ) ( not ( = ?auto_1563122 ?auto_1563130 ) ) ( not ( = ?auto_1563122 ?auto_1563131 ) ) ( not ( = ?auto_1563122 ?auto_1563132 ) ) ( not ( = ?auto_1563122 ?auto_1563133 ) ) ( not ( = ?auto_1563122 ?auto_1563134 ) ) ( not ( = ?auto_1563122 ?auto_1563135 ) ) ( not ( = ?auto_1563126 ?auto_1563128 ) ) ( not ( = ?auto_1563126 ?auto_1563127 ) ) ( not ( = ?auto_1563126 ?auto_1563129 ) ) ( not ( = ?auto_1563126 ?auto_1563130 ) ) ( not ( = ?auto_1563126 ?auto_1563131 ) ) ( not ( = ?auto_1563126 ?auto_1563132 ) ) ( not ( = ?auto_1563126 ?auto_1563133 ) ) ( not ( = ?auto_1563126 ?auto_1563134 ) ) ( not ( = ?auto_1563126 ?auto_1563135 ) ) ( not ( = ?auto_1563128 ?auto_1563127 ) ) ( not ( = ?auto_1563128 ?auto_1563129 ) ) ( not ( = ?auto_1563128 ?auto_1563130 ) ) ( not ( = ?auto_1563128 ?auto_1563131 ) ) ( not ( = ?auto_1563128 ?auto_1563132 ) ) ( not ( = ?auto_1563128 ?auto_1563133 ) ) ( not ( = ?auto_1563128 ?auto_1563134 ) ) ( not ( = ?auto_1563128 ?auto_1563135 ) ) ( not ( = ?auto_1563127 ?auto_1563129 ) ) ( not ( = ?auto_1563127 ?auto_1563130 ) ) ( not ( = ?auto_1563127 ?auto_1563131 ) ) ( not ( = ?auto_1563127 ?auto_1563132 ) ) ( not ( = ?auto_1563127 ?auto_1563133 ) ) ( not ( = ?auto_1563127 ?auto_1563134 ) ) ( not ( = ?auto_1563127 ?auto_1563135 ) ) ( not ( = ?auto_1563129 ?auto_1563130 ) ) ( not ( = ?auto_1563129 ?auto_1563131 ) ) ( not ( = ?auto_1563129 ?auto_1563132 ) ) ( not ( = ?auto_1563129 ?auto_1563133 ) ) ( not ( = ?auto_1563129 ?auto_1563134 ) ) ( not ( = ?auto_1563129 ?auto_1563135 ) ) ( not ( = ?auto_1563130 ?auto_1563131 ) ) ( not ( = ?auto_1563130 ?auto_1563132 ) ) ( not ( = ?auto_1563130 ?auto_1563133 ) ) ( not ( = ?auto_1563130 ?auto_1563134 ) ) ( not ( = ?auto_1563130 ?auto_1563135 ) ) ( not ( = ?auto_1563131 ?auto_1563132 ) ) ( not ( = ?auto_1563131 ?auto_1563133 ) ) ( not ( = ?auto_1563131 ?auto_1563134 ) ) ( not ( = ?auto_1563131 ?auto_1563135 ) ) ( not ( = ?auto_1563132 ?auto_1563133 ) ) ( not ( = ?auto_1563132 ?auto_1563134 ) ) ( not ( = ?auto_1563132 ?auto_1563135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1563133 ?auto_1563134 ?auto_1563135 )
      ( MAKE-13CRATE-VERIFY ?auto_1563123 ?auto_1563124 ?auto_1563125 ?auto_1563122 ?auto_1563126 ?auto_1563128 ?auto_1563127 ?auto_1563129 ?auto_1563130 ?auto_1563131 ?auto_1563132 ?auto_1563133 ?auto_1563134 ?auto_1563135 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1563305 - SURFACE
      ?auto_1563306 - SURFACE
      ?auto_1563307 - SURFACE
      ?auto_1563304 - SURFACE
      ?auto_1563308 - SURFACE
      ?auto_1563310 - SURFACE
      ?auto_1563309 - SURFACE
      ?auto_1563311 - SURFACE
      ?auto_1563312 - SURFACE
      ?auto_1563313 - SURFACE
      ?auto_1563314 - SURFACE
      ?auto_1563315 - SURFACE
      ?auto_1563316 - SURFACE
      ?auto_1563317 - SURFACE
    )
    :vars
    (
      ?auto_1563321 - HOIST
      ?auto_1563319 - PLACE
      ?auto_1563323 - TRUCK
      ?auto_1563320 - PLACE
      ?auto_1563318 - HOIST
      ?auto_1563322 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1563321 ?auto_1563319 ) ( SURFACE-AT ?auto_1563316 ?auto_1563319 ) ( CLEAR ?auto_1563316 ) ( IS-CRATE ?auto_1563317 ) ( not ( = ?auto_1563316 ?auto_1563317 ) ) ( AVAILABLE ?auto_1563321 ) ( ON ?auto_1563316 ?auto_1563315 ) ( not ( = ?auto_1563315 ?auto_1563316 ) ) ( not ( = ?auto_1563315 ?auto_1563317 ) ) ( TRUCK-AT ?auto_1563323 ?auto_1563320 ) ( not ( = ?auto_1563320 ?auto_1563319 ) ) ( HOIST-AT ?auto_1563318 ?auto_1563320 ) ( not ( = ?auto_1563321 ?auto_1563318 ) ) ( AVAILABLE ?auto_1563318 ) ( SURFACE-AT ?auto_1563317 ?auto_1563320 ) ( ON ?auto_1563317 ?auto_1563322 ) ( CLEAR ?auto_1563317 ) ( not ( = ?auto_1563316 ?auto_1563322 ) ) ( not ( = ?auto_1563317 ?auto_1563322 ) ) ( not ( = ?auto_1563315 ?auto_1563322 ) ) ( ON ?auto_1563306 ?auto_1563305 ) ( ON ?auto_1563307 ?auto_1563306 ) ( ON ?auto_1563304 ?auto_1563307 ) ( ON ?auto_1563308 ?auto_1563304 ) ( ON ?auto_1563310 ?auto_1563308 ) ( ON ?auto_1563309 ?auto_1563310 ) ( ON ?auto_1563311 ?auto_1563309 ) ( ON ?auto_1563312 ?auto_1563311 ) ( ON ?auto_1563313 ?auto_1563312 ) ( ON ?auto_1563314 ?auto_1563313 ) ( ON ?auto_1563315 ?auto_1563314 ) ( not ( = ?auto_1563305 ?auto_1563306 ) ) ( not ( = ?auto_1563305 ?auto_1563307 ) ) ( not ( = ?auto_1563305 ?auto_1563304 ) ) ( not ( = ?auto_1563305 ?auto_1563308 ) ) ( not ( = ?auto_1563305 ?auto_1563310 ) ) ( not ( = ?auto_1563305 ?auto_1563309 ) ) ( not ( = ?auto_1563305 ?auto_1563311 ) ) ( not ( = ?auto_1563305 ?auto_1563312 ) ) ( not ( = ?auto_1563305 ?auto_1563313 ) ) ( not ( = ?auto_1563305 ?auto_1563314 ) ) ( not ( = ?auto_1563305 ?auto_1563315 ) ) ( not ( = ?auto_1563305 ?auto_1563316 ) ) ( not ( = ?auto_1563305 ?auto_1563317 ) ) ( not ( = ?auto_1563305 ?auto_1563322 ) ) ( not ( = ?auto_1563306 ?auto_1563307 ) ) ( not ( = ?auto_1563306 ?auto_1563304 ) ) ( not ( = ?auto_1563306 ?auto_1563308 ) ) ( not ( = ?auto_1563306 ?auto_1563310 ) ) ( not ( = ?auto_1563306 ?auto_1563309 ) ) ( not ( = ?auto_1563306 ?auto_1563311 ) ) ( not ( = ?auto_1563306 ?auto_1563312 ) ) ( not ( = ?auto_1563306 ?auto_1563313 ) ) ( not ( = ?auto_1563306 ?auto_1563314 ) ) ( not ( = ?auto_1563306 ?auto_1563315 ) ) ( not ( = ?auto_1563306 ?auto_1563316 ) ) ( not ( = ?auto_1563306 ?auto_1563317 ) ) ( not ( = ?auto_1563306 ?auto_1563322 ) ) ( not ( = ?auto_1563307 ?auto_1563304 ) ) ( not ( = ?auto_1563307 ?auto_1563308 ) ) ( not ( = ?auto_1563307 ?auto_1563310 ) ) ( not ( = ?auto_1563307 ?auto_1563309 ) ) ( not ( = ?auto_1563307 ?auto_1563311 ) ) ( not ( = ?auto_1563307 ?auto_1563312 ) ) ( not ( = ?auto_1563307 ?auto_1563313 ) ) ( not ( = ?auto_1563307 ?auto_1563314 ) ) ( not ( = ?auto_1563307 ?auto_1563315 ) ) ( not ( = ?auto_1563307 ?auto_1563316 ) ) ( not ( = ?auto_1563307 ?auto_1563317 ) ) ( not ( = ?auto_1563307 ?auto_1563322 ) ) ( not ( = ?auto_1563304 ?auto_1563308 ) ) ( not ( = ?auto_1563304 ?auto_1563310 ) ) ( not ( = ?auto_1563304 ?auto_1563309 ) ) ( not ( = ?auto_1563304 ?auto_1563311 ) ) ( not ( = ?auto_1563304 ?auto_1563312 ) ) ( not ( = ?auto_1563304 ?auto_1563313 ) ) ( not ( = ?auto_1563304 ?auto_1563314 ) ) ( not ( = ?auto_1563304 ?auto_1563315 ) ) ( not ( = ?auto_1563304 ?auto_1563316 ) ) ( not ( = ?auto_1563304 ?auto_1563317 ) ) ( not ( = ?auto_1563304 ?auto_1563322 ) ) ( not ( = ?auto_1563308 ?auto_1563310 ) ) ( not ( = ?auto_1563308 ?auto_1563309 ) ) ( not ( = ?auto_1563308 ?auto_1563311 ) ) ( not ( = ?auto_1563308 ?auto_1563312 ) ) ( not ( = ?auto_1563308 ?auto_1563313 ) ) ( not ( = ?auto_1563308 ?auto_1563314 ) ) ( not ( = ?auto_1563308 ?auto_1563315 ) ) ( not ( = ?auto_1563308 ?auto_1563316 ) ) ( not ( = ?auto_1563308 ?auto_1563317 ) ) ( not ( = ?auto_1563308 ?auto_1563322 ) ) ( not ( = ?auto_1563310 ?auto_1563309 ) ) ( not ( = ?auto_1563310 ?auto_1563311 ) ) ( not ( = ?auto_1563310 ?auto_1563312 ) ) ( not ( = ?auto_1563310 ?auto_1563313 ) ) ( not ( = ?auto_1563310 ?auto_1563314 ) ) ( not ( = ?auto_1563310 ?auto_1563315 ) ) ( not ( = ?auto_1563310 ?auto_1563316 ) ) ( not ( = ?auto_1563310 ?auto_1563317 ) ) ( not ( = ?auto_1563310 ?auto_1563322 ) ) ( not ( = ?auto_1563309 ?auto_1563311 ) ) ( not ( = ?auto_1563309 ?auto_1563312 ) ) ( not ( = ?auto_1563309 ?auto_1563313 ) ) ( not ( = ?auto_1563309 ?auto_1563314 ) ) ( not ( = ?auto_1563309 ?auto_1563315 ) ) ( not ( = ?auto_1563309 ?auto_1563316 ) ) ( not ( = ?auto_1563309 ?auto_1563317 ) ) ( not ( = ?auto_1563309 ?auto_1563322 ) ) ( not ( = ?auto_1563311 ?auto_1563312 ) ) ( not ( = ?auto_1563311 ?auto_1563313 ) ) ( not ( = ?auto_1563311 ?auto_1563314 ) ) ( not ( = ?auto_1563311 ?auto_1563315 ) ) ( not ( = ?auto_1563311 ?auto_1563316 ) ) ( not ( = ?auto_1563311 ?auto_1563317 ) ) ( not ( = ?auto_1563311 ?auto_1563322 ) ) ( not ( = ?auto_1563312 ?auto_1563313 ) ) ( not ( = ?auto_1563312 ?auto_1563314 ) ) ( not ( = ?auto_1563312 ?auto_1563315 ) ) ( not ( = ?auto_1563312 ?auto_1563316 ) ) ( not ( = ?auto_1563312 ?auto_1563317 ) ) ( not ( = ?auto_1563312 ?auto_1563322 ) ) ( not ( = ?auto_1563313 ?auto_1563314 ) ) ( not ( = ?auto_1563313 ?auto_1563315 ) ) ( not ( = ?auto_1563313 ?auto_1563316 ) ) ( not ( = ?auto_1563313 ?auto_1563317 ) ) ( not ( = ?auto_1563313 ?auto_1563322 ) ) ( not ( = ?auto_1563314 ?auto_1563315 ) ) ( not ( = ?auto_1563314 ?auto_1563316 ) ) ( not ( = ?auto_1563314 ?auto_1563317 ) ) ( not ( = ?auto_1563314 ?auto_1563322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1563315 ?auto_1563316 ?auto_1563317 )
      ( MAKE-13CRATE-VERIFY ?auto_1563305 ?auto_1563306 ?auto_1563307 ?auto_1563304 ?auto_1563308 ?auto_1563310 ?auto_1563309 ?auto_1563311 ?auto_1563312 ?auto_1563313 ?auto_1563314 ?auto_1563315 ?auto_1563316 ?auto_1563317 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1563488 - SURFACE
      ?auto_1563489 - SURFACE
      ?auto_1563490 - SURFACE
      ?auto_1563487 - SURFACE
      ?auto_1563491 - SURFACE
      ?auto_1563493 - SURFACE
      ?auto_1563492 - SURFACE
      ?auto_1563494 - SURFACE
      ?auto_1563495 - SURFACE
      ?auto_1563496 - SURFACE
      ?auto_1563497 - SURFACE
      ?auto_1563498 - SURFACE
      ?auto_1563499 - SURFACE
      ?auto_1563500 - SURFACE
    )
    :vars
    (
      ?auto_1563503 - HOIST
      ?auto_1563504 - PLACE
      ?auto_1563505 - PLACE
      ?auto_1563502 - HOIST
      ?auto_1563501 - SURFACE
      ?auto_1563506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1563503 ?auto_1563504 ) ( SURFACE-AT ?auto_1563499 ?auto_1563504 ) ( CLEAR ?auto_1563499 ) ( IS-CRATE ?auto_1563500 ) ( not ( = ?auto_1563499 ?auto_1563500 ) ) ( AVAILABLE ?auto_1563503 ) ( ON ?auto_1563499 ?auto_1563498 ) ( not ( = ?auto_1563498 ?auto_1563499 ) ) ( not ( = ?auto_1563498 ?auto_1563500 ) ) ( not ( = ?auto_1563505 ?auto_1563504 ) ) ( HOIST-AT ?auto_1563502 ?auto_1563505 ) ( not ( = ?auto_1563503 ?auto_1563502 ) ) ( AVAILABLE ?auto_1563502 ) ( SURFACE-AT ?auto_1563500 ?auto_1563505 ) ( ON ?auto_1563500 ?auto_1563501 ) ( CLEAR ?auto_1563500 ) ( not ( = ?auto_1563499 ?auto_1563501 ) ) ( not ( = ?auto_1563500 ?auto_1563501 ) ) ( not ( = ?auto_1563498 ?auto_1563501 ) ) ( TRUCK-AT ?auto_1563506 ?auto_1563504 ) ( ON ?auto_1563489 ?auto_1563488 ) ( ON ?auto_1563490 ?auto_1563489 ) ( ON ?auto_1563487 ?auto_1563490 ) ( ON ?auto_1563491 ?auto_1563487 ) ( ON ?auto_1563493 ?auto_1563491 ) ( ON ?auto_1563492 ?auto_1563493 ) ( ON ?auto_1563494 ?auto_1563492 ) ( ON ?auto_1563495 ?auto_1563494 ) ( ON ?auto_1563496 ?auto_1563495 ) ( ON ?auto_1563497 ?auto_1563496 ) ( ON ?auto_1563498 ?auto_1563497 ) ( not ( = ?auto_1563488 ?auto_1563489 ) ) ( not ( = ?auto_1563488 ?auto_1563490 ) ) ( not ( = ?auto_1563488 ?auto_1563487 ) ) ( not ( = ?auto_1563488 ?auto_1563491 ) ) ( not ( = ?auto_1563488 ?auto_1563493 ) ) ( not ( = ?auto_1563488 ?auto_1563492 ) ) ( not ( = ?auto_1563488 ?auto_1563494 ) ) ( not ( = ?auto_1563488 ?auto_1563495 ) ) ( not ( = ?auto_1563488 ?auto_1563496 ) ) ( not ( = ?auto_1563488 ?auto_1563497 ) ) ( not ( = ?auto_1563488 ?auto_1563498 ) ) ( not ( = ?auto_1563488 ?auto_1563499 ) ) ( not ( = ?auto_1563488 ?auto_1563500 ) ) ( not ( = ?auto_1563488 ?auto_1563501 ) ) ( not ( = ?auto_1563489 ?auto_1563490 ) ) ( not ( = ?auto_1563489 ?auto_1563487 ) ) ( not ( = ?auto_1563489 ?auto_1563491 ) ) ( not ( = ?auto_1563489 ?auto_1563493 ) ) ( not ( = ?auto_1563489 ?auto_1563492 ) ) ( not ( = ?auto_1563489 ?auto_1563494 ) ) ( not ( = ?auto_1563489 ?auto_1563495 ) ) ( not ( = ?auto_1563489 ?auto_1563496 ) ) ( not ( = ?auto_1563489 ?auto_1563497 ) ) ( not ( = ?auto_1563489 ?auto_1563498 ) ) ( not ( = ?auto_1563489 ?auto_1563499 ) ) ( not ( = ?auto_1563489 ?auto_1563500 ) ) ( not ( = ?auto_1563489 ?auto_1563501 ) ) ( not ( = ?auto_1563490 ?auto_1563487 ) ) ( not ( = ?auto_1563490 ?auto_1563491 ) ) ( not ( = ?auto_1563490 ?auto_1563493 ) ) ( not ( = ?auto_1563490 ?auto_1563492 ) ) ( not ( = ?auto_1563490 ?auto_1563494 ) ) ( not ( = ?auto_1563490 ?auto_1563495 ) ) ( not ( = ?auto_1563490 ?auto_1563496 ) ) ( not ( = ?auto_1563490 ?auto_1563497 ) ) ( not ( = ?auto_1563490 ?auto_1563498 ) ) ( not ( = ?auto_1563490 ?auto_1563499 ) ) ( not ( = ?auto_1563490 ?auto_1563500 ) ) ( not ( = ?auto_1563490 ?auto_1563501 ) ) ( not ( = ?auto_1563487 ?auto_1563491 ) ) ( not ( = ?auto_1563487 ?auto_1563493 ) ) ( not ( = ?auto_1563487 ?auto_1563492 ) ) ( not ( = ?auto_1563487 ?auto_1563494 ) ) ( not ( = ?auto_1563487 ?auto_1563495 ) ) ( not ( = ?auto_1563487 ?auto_1563496 ) ) ( not ( = ?auto_1563487 ?auto_1563497 ) ) ( not ( = ?auto_1563487 ?auto_1563498 ) ) ( not ( = ?auto_1563487 ?auto_1563499 ) ) ( not ( = ?auto_1563487 ?auto_1563500 ) ) ( not ( = ?auto_1563487 ?auto_1563501 ) ) ( not ( = ?auto_1563491 ?auto_1563493 ) ) ( not ( = ?auto_1563491 ?auto_1563492 ) ) ( not ( = ?auto_1563491 ?auto_1563494 ) ) ( not ( = ?auto_1563491 ?auto_1563495 ) ) ( not ( = ?auto_1563491 ?auto_1563496 ) ) ( not ( = ?auto_1563491 ?auto_1563497 ) ) ( not ( = ?auto_1563491 ?auto_1563498 ) ) ( not ( = ?auto_1563491 ?auto_1563499 ) ) ( not ( = ?auto_1563491 ?auto_1563500 ) ) ( not ( = ?auto_1563491 ?auto_1563501 ) ) ( not ( = ?auto_1563493 ?auto_1563492 ) ) ( not ( = ?auto_1563493 ?auto_1563494 ) ) ( not ( = ?auto_1563493 ?auto_1563495 ) ) ( not ( = ?auto_1563493 ?auto_1563496 ) ) ( not ( = ?auto_1563493 ?auto_1563497 ) ) ( not ( = ?auto_1563493 ?auto_1563498 ) ) ( not ( = ?auto_1563493 ?auto_1563499 ) ) ( not ( = ?auto_1563493 ?auto_1563500 ) ) ( not ( = ?auto_1563493 ?auto_1563501 ) ) ( not ( = ?auto_1563492 ?auto_1563494 ) ) ( not ( = ?auto_1563492 ?auto_1563495 ) ) ( not ( = ?auto_1563492 ?auto_1563496 ) ) ( not ( = ?auto_1563492 ?auto_1563497 ) ) ( not ( = ?auto_1563492 ?auto_1563498 ) ) ( not ( = ?auto_1563492 ?auto_1563499 ) ) ( not ( = ?auto_1563492 ?auto_1563500 ) ) ( not ( = ?auto_1563492 ?auto_1563501 ) ) ( not ( = ?auto_1563494 ?auto_1563495 ) ) ( not ( = ?auto_1563494 ?auto_1563496 ) ) ( not ( = ?auto_1563494 ?auto_1563497 ) ) ( not ( = ?auto_1563494 ?auto_1563498 ) ) ( not ( = ?auto_1563494 ?auto_1563499 ) ) ( not ( = ?auto_1563494 ?auto_1563500 ) ) ( not ( = ?auto_1563494 ?auto_1563501 ) ) ( not ( = ?auto_1563495 ?auto_1563496 ) ) ( not ( = ?auto_1563495 ?auto_1563497 ) ) ( not ( = ?auto_1563495 ?auto_1563498 ) ) ( not ( = ?auto_1563495 ?auto_1563499 ) ) ( not ( = ?auto_1563495 ?auto_1563500 ) ) ( not ( = ?auto_1563495 ?auto_1563501 ) ) ( not ( = ?auto_1563496 ?auto_1563497 ) ) ( not ( = ?auto_1563496 ?auto_1563498 ) ) ( not ( = ?auto_1563496 ?auto_1563499 ) ) ( not ( = ?auto_1563496 ?auto_1563500 ) ) ( not ( = ?auto_1563496 ?auto_1563501 ) ) ( not ( = ?auto_1563497 ?auto_1563498 ) ) ( not ( = ?auto_1563497 ?auto_1563499 ) ) ( not ( = ?auto_1563497 ?auto_1563500 ) ) ( not ( = ?auto_1563497 ?auto_1563501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1563498 ?auto_1563499 ?auto_1563500 )
      ( MAKE-13CRATE-VERIFY ?auto_1563488 ?auto_1563489 ?auto_1563490 ?auto_1563487 ?auto_1563491 ?auto_1563493 ?auto_1563492 ?auto_1563494 ?auto_1563495 ?auto_1563496 ?auto_1563497 ?auto_1563498 ?auto_1563499 ?auto_1563500 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1563671 - SURFACE
      ?auto_1563672 - SURFACE
      ?auto_1563673 - SURFACE
      ?auto_1563670 - SURFACE
      ?auto_1563674 - SURFACE
      ?auto_1563676 - SURFACE
      ?auto_1563675 - SURFACE
      ?auto_1563677 - SURFACE
      ?auto_1563678 - SURFACE
      ?auto_1563679 - SURFACE
      ?auto_1563680 - SURFACE
      ?auto_1563681 - SURFACE
      ?auto_1563682 - SURFACE
      ?auto_1563683 - SURFACE
    )
    :vars
    (
      ?auto_1563685 - HOIST
      ?auto_1563686 - PLACE
      ?auto_1563687 - PLACE
      ?auto_1563689 - HOIST
      ?auto_1563688 - SURFACE
      ?auto_1563684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1563685 ?auto_1563686 ) ( IS-CRATE ?auto_1563683 ) ( not ( = ?auto_1563682 ?auto_1563683 ) ) ( not ( = ?auto_1563681 ?auto_1563682 ) ) ( not ( = ?auto_1563681 ?auto_1563683 ) ) ( not ( = ?auto_1563687 ?auto_1563686 ) ) ( HOIST-AT ?auto_1563689 ?auto_1563687 ) ( not ( = ?auto_1563685 ?auto_1563689 ) ) ( AVAILABLE ?auto_1563689 ) ( SURFACE-AT ?auto_1563683 ?auto_1563687 ) ( ON ?auto_1563683 ?auto_1563688 ) ( CLEAR ?auto_1563683 ) ( not ( = ?auto_1563682 ?auto_1563688 ) ) ( not ( = ?auto_1563683 ?auto_1563688 ) ) ( not ( = ?auto_1563681 ?auto_1563688 ) ) ( TRUCK-AT ?auto_1563684 ?auto_1563686 ) ( SURFACE-AT ?auto_1563681 ?auto_1563686 ) ( CLEAR ?auto_1563681 ) ( LIFTING ?auto_1563685 ?auto_1563682 ) ( IS-CRATE ?auto_1563682 ) ( ON ?auto_1563672 ?auto_1563671 ) ( ON ?auto_1563673 ?auto_1563672 ) ( ON ?auto_1563670 ?auto_1563673 ) ( ON ?auto_1563674 ?auto_1563670 ) ( ON ?auto_1563676 ?auto_1563674 ) ( ON ?auto_1563675 ?auto_1563676 ) ( ON ?auto_1563677 ?auto_1563675 ) ( ON ?auto_1563678 ?auto_1563677 ) ( ON ?auto_1563679 ?auto_1563678 ) ( ON ?auto_1563680 ?auto_1563679 ) ( ON ?auto_1563681 ?auto_1563680 ) ( not ( = ?auto_1563671 ?auto_1563672 ) ) ( not ( = ?auto_1563671 ?auto_1563673 ) ) ( not ( = ?auto_1563671 ?auto_1563670 ) ) ( not ( = ?auto_1563671 ?auto_1563674 ) ) ( not ( = ?auto_1563671 ?auto_1563676 ) ) ( not ( = ?auto_1563671 ?auto_1563675 ) ) ( not ( = ?auto_1563671 ?auto_1563677 ) ) ( not ( = ?auto_1563671 ?auto_1563678 ) ) ( not ( = ?auto_1563671 ?auto_1563679 ) ) ( not ( = ?auto_1563671 ?auto_1563680 ) ) ( not ( = ?auto_1563671 ?auto_1563681 ) ) ( not ( = ?auto_1563671 ?auto_1563682 ) ) ( not ( = ?auto_1563671 ?auto_1563683 ) ) ( not ( = ?auto_1563671 ?auto_1563688 ) ) ( not ( = ?auto_1563672 ?auto_1563673 ) ) ( not ( = ?auto_1563672 ?auto_1563670 ) ) ( not ( = ?auto_1563672 ?auto_1563674 ) ) ( not ( = ?auto_1563672 ?auto_1563676 ) ) ( not ( = ?auto_1563672 ?auto_1563675 ) ) ( not ( = ?auto_1563672 ?auto_1563677 ) ) ( not ( = ?auto_1563672 ?auto_1563678 ) ) ( not ( = ?auto_1563672 ?auto_1563679 ) ) ( not ( = ?auto_1563672 ?auto_1563680 ) ) ( not ( = ?auto_1563672 ?auto_1563681 ) ) ( not ( = ?auto_1563672 ?auto_1563682 ) ) ( not ( = ?auto_1563672 ?auto_1563683 ) ) ( not ( = ?auto_1563672 ?auto_1563688 ) ) ( not ( = ?auto_1563673 ?auto_1563670 ) ) ( not ( = ?auto_1563673 ?auto_1563674 ) ) ( not ( = ?auto_1563673 ?auto_1563676 ) ) ( not ( = ?auto_1563673 ?auto_1563675 ) ) ( not ( = ?auto_1563673 ?auto_1563677 ) ) ( not ( = ?auto_1563673 ?auto_1563678 ) ) ( not ( = ?auto_1563673 ?auto_1563679 ) ) ( not ( = ?auto_1563673 ?auto_1563680 ) ) ( not ( = ?auto_1563673 ?auto_1563681 ) ) ( not ( = ?auto_1563673 ?auto_1563682 ) ) ( not ( = ?auto_1563673 ?auto_1563683 ) ) ( not ( = ?auto_1563673 ?auto_1563688 ) ) ( not ( = ?auto_1563670 ?auto_1563674 ) ) ( not ( = ?auto_1563670 ?auto_1563676 ) ) ( not ( = ?auto_1563670 ?auto_1563675 ) ) ( not ( = ?auto_1563670 ?auto_1563677 ) ) ( not ( = ?auto_1563670 ?auto_1563678 ) ) ( not ( = ?auto_1563670 ?auto_1563679 ) ) ( not ( = ?auto_1563670 ?auto_1563680 ) ) ( not ( = ?auto_1563670 ?auto_1563681 ) ) ( not ( = ?auto_1563670 ?auto_1563682 ) ) ( not ( = ?auto_1563670 ?auto_1563683 ) ) ( not ( = ?auto_1563670 ?auto_1563688 ) ) ( not ( = ?auto_1563674 ?auto_1563676 ) ) ( not ( = ?auto_1563674 ?auto_1563675 ) ) ( not ( = ?auto_1563674 ?auto_1563677 ) ) ( not ( = ?auto_1563674 ?auto_1563678 ) ) ( not ( = ?auto_1563674 ?auto_1563679 ) ) ( not ( = ?auto_1563674 ?auto_1563680 ) ) ( not ( = ?auto_1563674 ?auto_1563681 ) ) ( not ( = ?auto_1563674 ?auto_1563682 ) ) ( not ( = ?auto_1563674 ?auto_1563683 ) ) ( not ( = ?auto_1563674 ?auto_1563688 ) ) ( not ( = ?auto_1563676 ?auto_1563675 ) ) ( not ( = ?auto_1563676 ?auto_1563677 ) ) ( not ( = ?auto_1563676 ?auto_1563678 ) ) ( not ( = ?auto_1563676 ?auto_1563679 ) ) ( not ( = ?auto_1563676 ?auto_1563680 ) ) ( not ( = ?auto_1563676 ?auto_1563681 ) ) ( not ( = ?auto_1563676 ?auto_1563682 ) ) ( not ( = ?auto_1563676 ?auto_1563683 ) ) ( not ( = ?auto_1563676 ?auto_1563688 ) ) ( not ( = ?auto_1563675 ?auto_1563677 ) ) ( not ( = ?auto_1563675 ?auto_1563678 ) ) ( not ( = ?auto_1563675 ?auto_1563679 ) ) ( not ( = ?auto_1563675 ?auto_1563680 ) ) ( not ( = ?auto_1563675 ?auto_1563681 ) ) ( not ( = ?auto_1563675 ?auto_1563682 ) ) ( not ( = ?auto_1563675 ?auto_1563683 ) ) ( not ( = ?auto_1563675 ?auto_1563688 ) ) ( not ( = ?auto_1563677 ?auto_1563678 ) ) ( not ( = ?auto_1563677 ?auto_1563679 ) ) ( not ( = ?auto_1563677 ?auto_1563680 ) ) ( not ( = ?auto_1563677 ?auto_1563681 ) ) ( not ( = ?auto_1563677 ?auto_1563682 ) ) ( not ( = ?auto_1563677 ?auto_1563683 ) ) ( not ( = ?auto_1563677 ?auto_1563688 ) ) ( not ( = ?auto_1563678 ?auto_1563679 ) ) ( not ( = ?auto_1563678 ?auto_1563680 ) ) ( not ( = ?auto_1563678 ?auto_1563681 ) ) ( not ( = ?auto_1563678 ?auto_1563682 ) ) ( not ( = ?auto_1563678 ?auto_1563683 ) ) ( not ( = ?auto_1563678 ?auto_1563688 ) ) ( not ( = ?auto_1563679 ?auto_1563680 ) ) ( not ( = ?auto_1563679 ?auto_1563681 ) ) ( not ( = ?auto_1563679 ?auto_1563682 ) ) ( not ( = ?auto_1563679 ?auto_1563683 ) ) ( not ( = ?auto_1563679 ?auto_1563688 ) ) ( not ( = ?auto_1563680 ?auto_1563681 ) ) ( not ( = ?auto_1563680 ?auto_1563682 ) ) ( not ( = ?auto_1563680 ?auto_1563683 ) ) ( not ( = ?auto_1563680 ?auto_1563688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1563681 ?auto_1563682 ?auto_1563683 )
      ( MAKE-13CRATE-VERIFY ?auto_1563671 ?auto_1563672 ?auto_1563673 ?auto_1563670 ?auto_1563674 ?auto_1563676 ?auto_1563675 ?auto_1563677 ?auto_1563678 ?auto_1563679 ?auto_1563680 ?auto_1563681 ?auto_1563682 ?auto_1563683 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1563854 - SURFACE
      ?auto_1563855 - SURFACE
      ?auto_1563856 - SURFACE
      ?auto_1563853 - SURFACE
      ?auto_1563857 - SURFACE
      ?auto_1563859 - SURFACE
      ?auto_1563858 - SURFACE
      ?auto_1563860 - SURFACE
      ?auto_1563861 - SURFACE
      ?auto_1563862 - SURFACE
      ?auto_1563863 - SURFACE
      ?auto_1563864 - SURFACE
      ?auto_1563865 - SURFACE
      ?auto_1563866 - SURFACE
    )
    :vars
    (
      ?auto_1563872 - HOIST
      ?auto_1563871 - PLACE
      ?auto_1563867 - PLACE
      ?auto_1563870 - HOIST
      ?auto_1563869 - SURFACE
      ?auto_1563868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1563872 ?auto_1563871 ) ( IS-CRATE ?auto_1563866 ) ( not ( = ?auto_1563865 ?auto_1563866 ) ) ( not ( = ?auto_1563864 ?auto_1563865 ) ) ( not ( = ?auto_1563864 ?auto_1563866 ) ) ( not ( = ?auto_1563867 ?auto_1563871 ) ) ( HOIST-AT ?auto_1563870 ?auto_1563867 ) ( not ( = ?auto_1563872 ?auto_1563870 ) ) ( AVAILABLE ?auto_1563870 ) ( SURFACE-AT ?auto_1563866 ?auto_1563867 ) ( ON ?auto_1563866 ?auto_1563869 ) ( CLEAR ?auto_1563866 ) ( not ( = ?auto_1563865 ?auto_1563869 ) ) ( not ( = ?auto_1563866 ?auto_1563869 ) ) ( not ( = ?auto_1563864 ?auto_1563869 ) ) ( TRUCK-AT ?auto_1563868 ?auto_1563871 ) ( SURFACE-AT ?auto_1563864 ?auto_1563871 ) ( CLEAR ?auto_1563864 ) ( IS-CRATE ?auto_1563865 ) ( AVAILABLE ?auto_1563872 ) ( IN ?auto_1563865 ?auto_1563868 ) ( ON ?auto_1563855 ?auto_1563854 ) ( ON ?auto_1563856 ?auto_1563855 ) ( ON ?auto_1563853 ?auto_1563856 ) ( ON ?auto_1563857 ?auto_1563853 ) ( ON ?auto_1563859 ?auto_1563857 ) ( ON ?auto_1563858 ?auto_1563859 ) ( ON ?auto_1563860 ?auto_1563858 ) ( ON ?auto_1563861 ?auto_1563860 ) ( ON ?auto_1563862 ?auto_1563861 ) ( ON ?auto_1563863 ?auto_1563862 ) ( ON ?auto_1563864 ?auto_1563863 ) ( not ( = ?auto_1563854 ?auto_1563855 ) ) ( not ( = ?auto_1563854 ?auto_1563856 ) ) ( not ( = ?auto_1563854 ?auto_1563853 ) ) ( not ( = ?auto_1563854 ?auto_1563857 ) ) ( not ( = ?auto_1563854 ?auto_1563859 ) ) ( not ( = ?auto_1563854 ?auto_1563858 ) ) ( not ( = ?auto_1563854 ?auto_1563860 ) ) ( not ( = ?auto_1563854 ?auto_1563861 ) ) ( not ( = ?auto_1563854 ?auto_1563862 ) ) ( not ( = ?auto_1563854 ?auto_1563863 ) ) ( not ( = ?auto_1563854 ?auto_1563864 ) ) ( not ( = ?auto_1563854 ?auto_1563865 ) ) ( not ( = ?auto_1563854 ?auto_1563866 ) ) ( not ( = ?auto_1563854 ?auto_1563869 ) ) ( not ( = ?auto_1563855 ?auto_1563856 ) ) ( not ( = ?auto_1563855 ?auto_1563853 ) ) ( not ( = ?auto_1563855 ?auto_1563857 ) ) ( not ( = ?auto_1563855 ?auto_1563859 ) ) ( not ( = ?auto_1563855 ?auto_1563858 ) ) ( not ( = ?auto_1563855 ?auto_1563860 ) ) ( not ( = ?auto_1563855 ?auto_1563861 ) ) ( not ( = ?auto_1563855 ?auto_1563862 ) ) ( not ( = ?auto_1563855 ?auto_1563863 ) ) ( not ( = ?auto_1563855 ?auto_1563864 ) ) ( not ( = ?auto_1563855 ?auto_1563865 ) ) ( not ( = ?auto_1563855 ?auto_1563866 ) ) ( not ( = ?auto_1563855 ?auto_1563869 ) ) ( not ( = ?auto_1563856 ?auto_1563853 ) ) ( not ( = ?auto_1563856 ?auto_1563857 ) ) ( not ( = ?auto_1563856 ?auto_1563859 ) ) ( not ( = ?auto_1563856 ?auto_1563858 ) ) ( not ( = ?auto_1563856 ?auto_1563860 ) ) ( not ( = ?auto_1563856 ?auto_1563861 ) ) ( not ( = ?auto_1563856 ?auto_1563862 ) ) ( not ( = ?auto_1563856 ?auto_1563863 ) ) ( not ( = ?auto_1563856 ?auto_1563864 ) ) ( not ( = ?auto_1563856 ?auto_1563865 ) ) ( not ( = ?auto_1563856 ?auto_1563866 ) ) ( not ( = ?auto_1563856 ?auto_1563869 ) ) ( not ( = ?auto_1563853 ?auto_1563857 ) ) ( not ( = ?auto_1563853 ?auto_1563859 ) ) ( not ( = ?auto_1563853 ?auto_1563858 ) ) ( not ( = ?auto_1563853 ?auto_1563860 ) ) ( not ( = ?auto_1563853 ?auto_1563861 ) ) ( not ( = ?auto_1563853 ?auto_1563862 ) ) ( not ( = ?auto_1563853 ?auto_1563863 ) ) ( not ( = ?auto_1563853 ?auto_1563864 ) ) ( not ( = ?auto_1563853 ?auto_1563865 ) ) ( not ( = ?auto_1563853 ?auto_1563866 ) ) ( not ( = ?auto_1563853 ?auto_1563869 ) ) ( not ( = ?auto_1563857 ?auto_1563859 ) ) ( not ( = ?auto_1563857 ?auto_1563858 ) ) ( not ( = ?auto_1563857 ?auto_1563860 ) ) ( not ( = ?auto_1563857 ?auto_1563861 ) ) ( not ( = ?auto_1563857 ?auto_1563862 ) ) ( not ( = ?auto_1563857 ?auto_1563863 ) ) ( not ( = ?auto_1563857 ?auto_1563864 ) ) ( not ( = ?auto_1563857 ?auto_1563865 ) ) ( not ( = ?auto_1563857 ?auto_1563866 ) ) ( not ( = ?auto_1563857 ?auto_1563869 ) ) ( not ( = ?auto_1563859 ?auto_1563858 ) ) ( not ( = ?auto_1563859 ?auto_1563860 ) ) ( not ( = ?auto_1563859 ?auto_1563861 ) ) ( not ( = ?auto_1563859 ?auto_1563862 ) ) ( not ( = ?auto_1563859 ?auto_1563863 ) ) ( not ( = ?auto_1563859 ?auto_1563864 ) ) ( not ( = ?auto_1563859 ?auto_1563865 ) ) ( not ( = ?auto_1563859 ?auto_1563866 ) ) ( not ( = ?auto_1563859 ?auto_1563869 ) ) ( not ( = ?auto_1563858 ?auto_1563860 ) ) ( not ( = ?auto_1563858 ?auto_1563861 ) ) ( not ( = ?auto_1563858 ?auto_1563862 ) ) ( not ( = ?auto_1563858 ?auto_1563863 ) ) ( not ( = ?auto_1563858 ?auto_1563864 ) ) ( not ( = ?auto_1563858 ?auto_1563865 ) ) ( not ( = ?auto_1563858 ?auto_1563866 ) ) ( not ( = ?auto_1563858 ?auto_1563869 ) ) ( not ( = ?auto_1563860 ?auto_1563861 ) ) ( not ( = ?auto_1563860 ?auto_1563862 ) ) ( not ( = ?auto_1563860 ?auto_1563863 ) ) ( not ( = ?auto_1563860 ?auto_1563864 ) ) ( not ( = ?auto_1563860 ?auto_1563865 ) ) ( not ( = ?auto_1563860 ?auto_1563866 ) ) ( not ( = ?auto_1563860 ?auto_1563869 ) ) ( not ( = ?auto_1563861 ?auto_1563862 ) ) ( not ( = ?auto_1563861 ?auto_1563863 ) ) ( not ( = ?auto_1563861 ?auto_1563864 ) ) ( not ( = ?auto_1563861 ?auto_1563865 ) ) ( not ( = ?auto_1563861 ?auto_1563866 ) ) ( not ( = ?auto_1563861 ?auto_1563869 ) ) ( not ( = ?auto_1563862 ?auto_1563863 ) ) ( not ( = ?auto_1563862 ?auto_1563864 ) ) ( not ( = ?auto_1563862 ?auto_1563865 ) ) ( not ( = ?auto_1563862 ?auto_1563866 ) ) ( not ( = ?auto_1563862 ?auto_1563869 ) ) ( not ( = ?auto_1563863 ?auto_1563864 ) ) ( not ( = ?auto_1563863 ?auto_1563865 ) ) ( not ( = ?auto_1563863 ?auto_1563866 ) ) ( not ( = ?auto_1563863 ?auto_1563869 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1563864 ?auto_1563865 ?auto_1563866 )
      ( MAKE-13CRATE-VERIFY ?auto_1563854 ?auto_1563855 ?auto_1563856 ?auto_1563853 ?auto_1563857 ?auto_1563859 ?auto_1563858 ?auto_1563860 ?auto_1563861 ?auto_1563862 ?auto_1563863 ?auto_1563864 ?auto_1563865 ?auto_1563866 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1578095 - SURFACE
      ?auto_1578096 - SURFACE
      ?auto_1578097 - SURFACE
      ?auto_1578094 - SURFACE
      ?auto_1578098 - SURFACE
      ?auto_1578100 - SURFACE
      ?auto_1578099 - SURFACE
      ?auto_1578101 - SURFACE
      ?auto_1578102 - SURFACE
      ?auto_1578103 - SURFACE
      ?auto_1578104 - SURFACE
      ?auto_1578105 - SURFACE
      ?auto_1578106 - SURFACE
      ?auto_1578107 - SURFACE
      ?auto_1578108 - SURFACE
    )
    :vars
    (
      ?auto_1578110 - HOIST
      ?auto_1578109 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1578110 ?auto_1578109 ) ( SURFACE-AT ?auto_1578107 ?auto_1578109 ) ( CLEAR ?auto_1578107 ) ( LIFTING ?auto_1578110 ?auto_1578108 ) ( IS-CRATE ?auto_1578108 ) ( not ( = ?auto_1578107 ?auto_1578108 ) ) ( ON ?auto_1578096 ?auto_1578095 ) ( ON ?auto_1578097 ?auto_1578096 ) ( ON ?auto_1578094 ?auto_1578097 ) ( ON ?auto_1578098 ?auto_1578094 ) ( ON ?auto_1578100 ?auto_1578098 ) ( ON ?auto_1578099 ?auto_1578100 ) ( ON ?auto_1578101 ?auto_1578099 ) ( ON ?auto_1578102 ?auto_1578101 ) ( ON ?auto_1578103 ?auto_1578102 ) ( ON ?auto_1578104 ?auto_1578103 ) ( ON ?auto_1578105 ?auto_1578104 ) ( ON ?auto_1578106 ?auto_1578105 ) ( ON ?auto_1578107 ?auto_1578106 ) ( not ( = ?auto_1578095 ?auto_1578096 ) ) ( not ( = ?auto_1578095 ?auto_1578097 ) ) ( not ( = ?auto_1578095 ?auto_1578094 ) ) ( not ( = ?auto_1578095 ?auto_1578098 ) ) ( not ( = ?auto_1578095 ?auto_1578100 ) ) ( not ( = ?auto_1578095 ?auto_1578099 ) ) ( not ( = ?auto_1578095 ?auto_1578101 ) ) ( not ( = ?auto_1578095 ?auto_1578102 ) ) ( not ( = ?auto_1578095 ?auto_1578103 ) ) ( not ( = ?auto_1578095 ?auto_1578104 ) ) ( not ( = ?auto_1578095 ?auto_1578105 ) ) ( not ( = ?auto_1578095 ?auto_1578106 ) ) ( not ( = ?auto_1578095 ?auto_1578107 ) ) ( not ( = ?auto_1578095 ?auto_1578108 ) ) ( not ( = ?auto_1578096 ?auto_1578097 ) ) ( not ( = ?auto_1578096 ?auto_1578094 ) ) ( not ( = ?auto_1578096 ?auto_1578098 ) ) ( not ( = ?auto_1578096 ?auto_1578100 ) ) ( not ( = ?auto_1578096 ?auto_1578099 ) ) ( not ( = ?auto_1578096 ?auto_1578101 ) ) ( not ( = ?auto_1578096 ?auto_1578102 ) ) ( not ( = ?auto_1578096 ?auto_1578103 ) ) ( not ( = ?auto_1578096 ?auto_1578104 ) ) ( not ( = ?auto_1578096 ?auto_1578105 ) ) ( not ( = ?auto_1578096 ?auto_1578106 ) ) ( not ( = ?auto_1578096 ?auto_1578107 ) ) ( not ( = ?auto_1578096 ?auto_1578108 ) ) ( not ( = ?auto_1578097 ?auto_1578094 ) ) ( not ( = ?auto_1578097 ?auto_1578098 ) ) ( not ( = ?auto_1578097 ?auto_1578100 ) ) ( not ( = ?auto_1578097 ?auto_1578099 ) ) ( not ( = ?auto_1578097 ?auto_1578101 ) ) ( not ( = ?auto_1578097 ?auto_1578102 ) ) ( not ( = ?auto_1578097 ?auto_1578103 ) ) ( not ( = ?auto_1578097 ?auto_1578104 ) ) ( not ( = ?auto_1578097 ?auto_1578105 ) ) ( not ( = ?auto_1578097 ?auto_1578106 ) ) ( not ( = ?auto_1578097 ?auto_1578107 ) ) ( not ( = ?auto_1578097 ?auto_1578108 ) ) ( not ( = ?auto_1578094 ?auto_1578098 ) ) ( not ( = ?auto_1578094 ?auto_1578100 ) ) ( not ( = ?auto_1578094 ?auto_1578099 ) ) ( not ( = ?auto_1578094 ?auto_1578101 ) ) ( not ( = ?auto_1578094 ?auto_1578102 ) ) ( not ( = ?auto_1578094 ?auto_1578103 ) ) ( not ( = ?auto_1578094 ?auto_1578104 ) ) ( not ( = ?auto_1578094 ?auto_1578105 ) ) ( not ( = ?auto_1578094 ?auto_1578106 ) ) ( not ( = ?auto_1578094 ?auto_1578107 ) ) ( not ( = ?auto_1578094 ?auto_1578108 ) ) ( not ( = ?auto_1578098 ?auto_1578100 ) ) ( not ( = ?auto_1578098 ?auto_1578099 ) ) ( not ( = ?auto_1578098 ?auto_1578101 ) ) ( not ( = ?auto_1578098 ?auto_1578102 ) ) ( not ( = ?auto_1578098 ?auto_1578103 ) ) ( not ( = ?auto_1578098 ?auto_1578104 ) ) ( not ( = ?auto_1578098 ?auto_1578105 ) ) ( not ( = ?auto_1578098 ?auto_1578106 ) ) ( not ( = ?auto_1578098 ?auto_1578107 ) ) ( not ( = ?auto_1578098 ?auto_1578108 ) ) ( not ( = ?auto_1578100 ?auto_1578099 ) ) ( not ( = ?auto_1578100 ?auto_1578101 ) ) ( not ( = ?auto_1578100 ?auto_1578102 ) ) ( not ( = ?auto_1578100 ?auto_1578103 ) ) ( not ( = ?auto_1578100 ?auto_1578104 ) ) ( not ( = ?auto_1578100 ?auto_1578105 ) ) ( not ( = ?auto_1578100 ?auto_1578106 ) ) ( not ( = ?auto_1578100 ?auto_1578107 ) ) ( not ( = ?auto_1578100 ?auto_1578108 ) ) ( not ( = ?auto_1578099 ?auto_1578101 ) ) ( not ( = ?auto_1578099 ?auto_1578102 ) ) ( not ( = ?auto_1578099 ?auto_1578103 ) ) ( not ( = ?auto_1578099 ?auto_1578104 ) ) ( not ( = ?auto_1578099 ?auto_1578105 ) ) ( not ( = ?auto_1578099 ?auto_1578106 ) ) ( not ( = ?auto_1578099 ?auto_1578107 ) ) ( not ( = ?auto_1578099 ?auto_1578108 ) ) ( not ( = ?auto_1578101 ?auto_1578102 ) ) ( not ( = ?auto_1578101 ?auto_1578103 ) ) ( not ( = ?auto_1578101 ?auto_1578104 ) ) ( not ( = ?auto_1578101 ?auto_1578105 ) ) ( not ( = ?auto_1578101 ?auto_1578106 ) ) ( not ( = ?auto_1578101 ?auto_1578107 ) ) ( not ( = ?auto_1578101 ?auto_1578108 ) ) ( not ( = ?auto_1578102 ?auto_1578103 ) ) ( not ( = ?auto_1578102 ?auto_1578104 ) ) ( not ( = ?auto_1578102 ?auto_1578105 ) ) ( not ( = ?auto_1578102 ?auto_1578106 ) ) ( not ( = ?auto_1578102 ?auto_1578107 ) ) ( not ( = ?auto_1578102 ?auto_1578108 ) ) ( not ( = ?auto_1578103 ?auto_1578104 ) ) ( not ( = ?auto_1578103 ?auto_1578105 ) ) ( not ( = ?auto_1578103 ?auto_1578106 ) ) ( not ( = ?auto_1578103 ?auto_1578107 ) ) ( not ( = ?auto_1578103 ?auto_1578108 ) ) ( not ( = ?auto_1578104 ?auto_1578105 ) ) ( not ( = ?auto_1578104 ?auto_1578106 ) ) ( not ( = ?auto_1578104 ?auto_1578107 ) ) ( not ( = ?auto_1578104 ?auto_1578108 ) ) ( not ( = ?auto_1578105 ?auto_1578106 ) ) ( not ( = ?auto_1578105 ?auto_1578107 ) ) ( not ( = ?auto_1578105 ?auto_1578108 ) ) ( not ( = ?auto_1578106 ?auto_1578107 ) ) ( not ( = ?auto_1578106 ?auto_1578108 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1578107 ?auto_1578108 )
      ( MAKE-14CRATE-VERIFY ?auto_1578095 ?auto_1578096 ?auto_1578097 ?auto_1578094 ?auto_1578098 ?auto_1578100 ?auto_1578099 ?auto_1578101 ?auto_1578102 ?auto_1578103 ?auto_1578104 ?auto_1578105 ?auto_1578106 ?auto_1578107 ?auto_1578108 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1578255 - SURFACE
      ?auto_1578256 - SURFACE
      ?auto_1578257 - SURFACE
      ?auto_1578254 - SURFACE
      ?auto_1578258 - SURFACE
      ?auto_1578260 - SURFACE
      ?auto_1578259 - SURFACE
      ?auto_1578261 - SURFACE
      ?auto_1578262 - SURFACE
      ?auto_1578263 - SURFACE
      ?auto_1578264 - SURFACE
      ?auto_1578265 - SURFACE
      ?auto_1578266 - SURFACE
      ?auto_1578267 - SURFACE
      ?auto_1578268 - SURFACE
    )
    :vars
    (
      ?auto_1578270 - HOIST
      ?auto_1578269 - PLACE
      ?auto_1578271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1578270 ?auto_1578269 ) ( SURFACE-AT ?auto_1578267 ?auto_1578269 ) ( CLEAR ?auto_1578267 ) ( IS-CRATE ?auto_1578268 ) ( not ( = ?auto_1578267 ?auto_1578268 ) ) ( TRUCK-AT ?auto_1578271 ?auto_1578269 ) ( AVAILABLE ?auto_1578270 ) ( IN ?auto_1578268 ?auto_1578271 ) ( ON ?auto_1578267 ?auto_1578266 ) ( not ( = ?auto_1578266 ?auto_1578267 ) ) ( not ( = ?auto_1578266 ?auto_1578268 ) ) ( ON ?auto_1578256 ?auto_1578255 ) ( ON ?auto_1578257 ?auto_1578256 ) ( ON ?auto_1578254 ?auto_1578257 ) ( ON ?auto_1578258 ?auto_1578254 ) ( ON ?auto_1578260 ?auto_1578258 ) ( ON ?auto_1578259 ?auto_1578260 ) ( ON ?auto_1578261 ?auto_1578259 ) ( ON ?auto_1578262 ?auto_1578261 ) ( ON ?auto_1578263 ?auto_1578262 ) ( ON ?auto_1578264 ?auto_1578263 ) ( ON ?auto_1578265 ?auto_1578264 ) ( ON ?auto_1578266 ?auto_1578265 ) ( not ( = ?auto_1578255 ?auto_1578256 ) ) ( not ( = ?auto_1578255 ?auto_1578257 ) ) ( not ( = ?auto_1578255 ?auto_1578254 ) ) ( not ( = ?auto_1578255 ?auto_1578258 ) ) ( not ( = ?auto_1578255 ?auto_1578260 ) ) ( not ( = ?auto_1578255 ?auto_1578259 ) ) ( not ( = ?auto_1578255 ?auto_1578261 ) ) ( not ( = ?auto_1578255 ?auto_1578262 ) ) ( not ( = ?auto_1578255 ?auto_1578263 ) ) ( not ( = ?auto_1578255 ?auto_1578264 ) ) ( not ( = ?auto_1578255 ?auto_1578265 ) ) ( not ( = ?auto_1578255 ?auto_1578266 ) ) ( not ( = ?auto_1578255 ?auto_1578267 ) ) ( not ( = ?auto_1578255 ?auto_1578268 ) ) ( not ( = ?auto_1578256 ?auto_1578257 ) ) ( not ( = ?auto_1578256 ?auto_1578254 ) ) ( not ( = ?auto_1578256 ?auto_1578258 ) ) ( not ( = ?auto_1578256 ?auto_1578260 ) ) ( not ( = ?auto_1578256 ?auto_1578259 ) ) ( not ( = ?auto_1578256 ?auto_1578261 ) ) ( not ( = ?auto_1578256 ?auto_1578262 ) ) ( not ( = ?auto_1578256 ?auto_1578263 ) ) ( not ( = ?auto_1578256 ?auto_1578264 ) ) ( not ( = ?auto_1578256 ?auto_1578265 ) ) ( not ( = ?auto_1578256 ?auto_1578266 ) ) ( not ( = ?auto_1578256 ?auto_1578267 ) ) ( not ( = ?auto_1578256 ?auto_1578268 ) ) ( not ( = ?auto_1578257 ?auto_1578254 ) ) ( not ( = ?auto_1578257 ?auto_1578258 ) ) ( not ( = ?auto_1578257 ?auto_1578260 ) ) ( not ( = ?auto_1578257 ?auto_1578259 ) ) ( not ( = ?auto_1578257 ?auto_1578261 ) ) ( not ( = ?auto_1578257 ?auto_1578262 ) ) ( not ( = ?auto_1578257 ?auto_1578263 ) ) ( not ( = ?auto_1578257 ?auto_1578264 ) ) ( not ( = ?auto_1578257 ?auto_1578265 ) ) ( not ( = ?auto_1578257 ?auto_1578266 ) ) ( not ( = ?auto_1578257 ?auto_1578267 ) ) ( not ( = ?auto_1578257 ?auto_1578268 ) ) ( not ( = ?auto_1578254 ?auto_1578258 ) ) ( not ( = ?auto_1578254 ?auto_1578260 ) ) ( not ( = ?auto_1578254 ?auto_1578259 ) ) ( not ( = ?auto_1578254 ?auto_1578261 ) ) ( not ( = ?auto_1578254 ?auto_1578262 ) ) ( not ( = ?auto_1578254 ?auto_1578263 ) ) ( not ( = ?auto_1578254 ?auto_1578264 ) ) ( not ( = ?auto_1578254 ?auto_1578265 ) ) ( not ( = ?auto_1578254 ?auto_1578266 ) ) ( not ( = ?auto_1578254 ?auto_1578267 ) ) ( not ( = ?auto_1578254 ?auto_1578268 ) ) ( not ( = ?auto_1578258 ?auto_1578260 ) ) ( not ( = ?auto_1578258 ?auto_1578259 ) ) ( not ( = ?auto_1578258 ?auto_1578261 ) ) ( not ( = ?auto_1578258 ?auto_1578262 ) ) ( not ( = ?auto_1578258 ?auto_1578263 ) ) ( not ( = ?auto_1578258 ?auto_1578264 ) ) ( not ( = ?auto_1578258 ?auto_1578265 ) ) ( not ( = ?auto_1578258 ?auto_1578266 ) ) ( not ( = ?auto_1578258 ?auto_1578267 ) ) ( not ( = ?auto_1578258 ?auto_1578268 ) ) ( not ( = ?auto_1578260 ?auto_1578259 ) ) ( not ( = ?auto_1578260 ?auto_1578261 ) ) ( not ( = ?auto_1578260 ?auto_1578262 ) ) ( not ( = ?auto_1578260 ?auto_1578263 ) ) ( not ( = ?auto_1578260 ?auto_1578264 ) ) ( not ( = ?auto_1578260 ?auto_1578265 ) ) ( not ( = ?auto_1578260 ?auto_1578266 ) ) ( not ( = ?auto_1578260 ?auto_1578267 ) ) ( not ( = ?auto_1578260 ?auto_1578268 ) ) ( not ( = ?auto_1578259 ?auto_1578261 ) ) ( not ( = ?auto_1578259 ?auto_1578262 ) ) ( not ( = ?auto_1578259 ?auto_1578263 ) ) ( not ( = ?auto_1578259 ?auto_1578264 ) ) ( not ( = ?auto_1578259 ?auto_1578265 ) ) ( not ( = ?auto_1578259 ?auto_1578266 ) ) ( not ( = ?auto_1578259 ?auto_1578267 ) ) ( not ( = ?auto_1578259 ?auto_1578268 ) ) ( not ( = ?auto_1578261 ?auto_1578262 ) ) ( not ( = ?auto_1578261 ?auto_1578263 ) ) ( not ( = ?auto_1578261 ?auto_1578264 ) ) ( not ( = ?auto_1578261 ?auto_1578265 ) ) ( not ( = ?auto_1578261 ?auto_1578266 ) ) ( not ( = ?auto_1578261 ?auto_1578267 ) ) ( not ( = ?auto_1578261 ?auto_1578268 ) ) ( not ( = ?auto_1578262 ?auto_1578263 ) ) ( not ( = ?auto_1578262 ?auto_1578264 ) ) ( not ( = ?auto_1578262 ?auto_1578265 ) ) ( not ( = ?auto_1578262 ?auto_1578266 ) ) ( not ( = ?auto_1578262 ?auto_1578267 ) ) ( not ( = ?auto_1578262 ?auto_1578268 ) ) ( not ( = ?auto_1578263 ?auto_1578264 ) ) ( not ( = ?auto_1578263 ?auto_1578265 ) ) ( not ( = ?auto_1578263 ?auto_1578266 ) ) ( not ( = ?auto_1578263 ?auto_1578267 ) ) ( not ( = ?auto_1578263 ?auto_1578268 ) ) ( not ( = ?auto_1578264 ?auto_1578265 ) ) ( not ( = ?auto_1578264 ?auto_1578266 ) ) ( not ( = ?auto_1578264 ?auto_1578267 ) ) ( not ( = ?auto_1578264 ?auto_1578268 ) ) ( not ( = ?auto_1578265 ?auto_1578266 ) ) ( not ( = ?auto_1578265 ?auto_1578267 ) ) ( not ( = ?auto_1578265 ?auto_1578268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1578266 ?auto_1578267 ?auto_1578268 )
      ( MAKE-14CRATE-VERIFY ?auto_1578255 ?auto_1578256 ?auto_1578257 ?auto_1578254 ?auto_1578258 ?auto_1578260 ?auto_1578259 ?auto_1578261 ?auto_1578262 ?auto_1578263 ?auto_1578264 ?auto_1578265 ?auto_1578266 ?auto_1578267 ?auto_1578268 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1578430 - SURFACE
      ?auto_1578431 - SURFACE
      ?auto_1578432 - SURFACE
      ?auto_1578429 - SURFACE
      ?auto_1578433 - SURFACE
      ?auto_1578435 - SURFACE
      ?auto_1578434 - SURFACE
      ?auto_1578436 - SURFACE
      ?auto_1578437 - SURFACE
      ?auto_1578438 - SURFACE
      ?auto_1578439 - SURFACE
      ?auto_1578440 - SURFACE
      ?auto_1578441 - SURFACE
      ?auto_1578442 - SURFACE
      ?auto_1578443 - SURFACE
    )
    :vars
    (
      ?auto_1578447 - HOIST
      ?auto_1578444 - PLACE
      ?auto_1578445 - TRUCK
      ?auto_1578446 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1578447 ?auto_1578444 ) ( SURFACE-AT ?auto_1578442 ?auto_1578444 ) ( CLEAR ?auto_1578442 ) ( IS-CRATE ?auto_1578443 ) ( not ( = ?auto_1578442 ?auto_1578443 ) ) ( AVAILABLE ?auto_1578447 ) ( IN ?auto_1578443 ?auto_1578445 ) ( ON ?auto_1578442 ?auto_1578441 ) ( not ( = ?auto_1578441 ?auto_1578442 ) ) ( not ( = ?auto_1578441 ?auto_1578443 ) ) ( TRUCK-AT ?auto_1578445 ?auto_1578446 ) ( not ( = ?auto_1578446 ?auto_1578444 ) ) ( ON ?auto_1578431 ?auto_1578430 ) ( ON ?auto_1578432 ?auto_1578431 ) ( ON ?auto_1578429 ?auto_1578432 ) ( ON ?auto_1578433 ?auto_1578429 ) ( ON ?auto_1578435 ?auto_1578433 ) ( ON ?auto_1578434 ?auto_1578435 ) ( ON ?auto_1578436 ?auto_1578434 ) ( ON ?auto_1578437 ?auto_1578436 ) ( ON ?auto_1578438 ?auto_1578437 ) ( ON ?auto_1578439 ?auto_1578438 ) ( ON ?auto_1578440 ?auto_1578439 ) ( ON ?auto_1578441 ?auto_1578440 ) ( not ( = ?auto_1578430 ?auto_1578431 ) ) ( not ( = ?auto_1578430 ?auto_1578432 ) ) ( not ( = ?auto_1578430 ?auto_1578429 ) ) ( not ( = ?auto_1578430 ?auto_1578433 ) ) ( not ( = ?auto_1578430 ?auto_1578435 ) ) ( not ( = ?auto_1578430 ?auto_1578434 ) ) ( not ( = ?auto_1578430 ?auto_1578436 ) ) ( not ( = ?auto_1578430 ?auto_1578437 ) ) ( not ( = ?auto_1578430 ?auto_1578438 ) ) ( not ( = ?auto_1578430 ?auto_1578439 ) ) ( not ( = ?auto_1578430 ?auto_1578440 ) ) ( not ( = ?auto_1578430 ?auto_1578441 ) ) ( not ( = ?auto_1578430 ?auto_1578442 ) ) ( not ( = ?auto_1578430 ?auto_1578443 ) ) ( not ( = ?auto_1578431 ?auto_1578432 ) ) ( not ( = ?auto_1578431 ?auto_1578429 ) ) ( not ( = ?auto_1578431 ?auto_1578433 ) ) ( not ( = ?auto_1578431 ?auto_1578435 ) ) ( not ( = ?auto_1578431 ?auto_1578434 ) ) ( not ( = ?auto_1578431 ?auto_1578436 ) ) ( not ( = ?auto_1578431 ?auto_1578437 ) ) ( not ( = ?auto_1578431 ?auto_1578438 ) ) ( not ( = ?auto_1578431 ?auto_1578439 ) ) ( not ( = ?auto_1578431 ?auto_1578440 ) ) ( not ( = ?auto_1578431 ?auto_1578441 ) ) ( not ( = ?auto_1578431 ?auto_1578442 ) ) ( not ( = ?auto_1578431 ?auto_1578443 ) ) ( not ( = ?auto_1578432 ?auto_1578429 ) ) ( not ( = ?auto_1578432 ?auto_1578433 ) ) ( not ( = ?auto_1578432 ?auto_1578435 ) ) ( not ( = ?auto_1578432 ?auto_1578434 ) ) ( not ( = ?auto_1578432 ?auto_1578436 ) ) ( not ( = ?auto_1578432 ?auto_1578437 ) ) ( not ( = ?auto_1578432 ?auto_1578438 ) ) ( not ( = ?auto_1578432 ?auto_1578439 ) ) ( not ( = ?auto_1578432 ?auto_1578440 ) ) ( not ( = ?auto_1578432 ?auto_1578441 ) ) ( not ( = ?auto_1578432 ?auto_1578442 ) ) ( not ( = ?auto_1578432 ?auto_1578443 ) ) ( not ( = ?auto_1578429 ?auto_1578433 ) ) ( not ( = ?auto_1578429 ?auto_1578435 ) ) ( not ( = ?auto_1578429 ?auto_1578434 ) ) ( not ( = ?auto_1578429 ?auto_1578436 ) ) ( not ( = ?auto_1578429 ?auto_1578437 ) ) ( not ( = ?auto_1578429 ?auto_1578438 ) ) ( not ( = ?auto_1578429 ?auto_1578439 ) ) ( not ( = ?auto_1578429 ?auto_1578440 ) ) ( not ( = ?auto_1578429 ?auto_1578441 ) ) ( not ( = ?auto_1578429 ?auto_1578442 ) ) ( not ( = ?auto_1578429 ?auto_1578443 ) ) ( not ( = ?auto_1578433 ?auto_1578435 ) ) ( not ( = ?auto_1578433 ?auto_1578434 ) ) ( not ( = ?auto_1578433 ?auto_1578436 ) ) ( not ( = ?auto_1578433 ?auto_1578437 ) ) ( not ( = ?auto_1578433 ?auto_1578438 ) ) ( not ( = ?auto_1578433 ?auto_1578439 ) ) ( not ( = ?auto_1578433 ?auto_1578440 ) ) ( not ( = ?auto_1578433 ?auto_1578441 ) ) ( not ( = ?auto_1578433 ?auto_1578442 ) ) ( not ( = ?auto_1578433 ?auto_1578443 ) ) ( not ( = ?auto_1578435 ?auto_1578434 ) ) ( not ( = ?auto_1578435 ?auto_1578436 ) ) ( not ( = ?auto_1578435 ?auto_1578437 ) ) ( not ( = ?auto_1578435 ?auto_1578438 ) ) ( not ( = ?auto_1578435 ?auto_1578439 ) ) ( not ( = ?auto_1578435 ?auto_1578440 ) ) ( not ( = ?auto_1578435 ?auto_1578441 ) ) ( not ( = ?auto_1578435 ?auto_1578442 ) ) ( not ( = ?auto_1578435 ?auto_1578443 ) ) ( not ( = ?auto_1578434 ?auto_1578436 ) ) ( not ( = ?auto_1578434 ?auto_1578437 ) ) ( not ( = ?auto_1578434 ?auto_1578438 ) ) ( not ( = ?auto_1578434 ?auto_1578439 ) ) ( not ( = ?auto_1578434 ?auto_1578440 ) ) ( not ( = ?auto_1578434 ?auto_1578441 ) ) ( not ( = ?auto_1578434 ?auto_1578442 ) ) ( not ( = ?auto_1578434 ?auto_1578443 ) ) ( not ( = ?auto_1578436 ?auto_1578437 ) ) ( not ( = ?auto_1578436 ?auto_1578438 ) ) ( not ( = ?auto_1578436 ?auto_1578439 ) ) ( not ( = ?auto_1578436 ?auto_1578440 ) ) ( not ( = ?auto_1578436 ?auto_1578441 ) ) ( not ( = ?auto_1578436 ?auto_1578442 ) ) ( not ( = ?auto_1578436 ?auto_1578443 ) ) ( not ( = ?auto_1578437 ?auto_1578438 ) ) ( not ( = ?auto_1578437 ?auto_1578439 ) ) ( not ( = ?auto_1578437 ?auto_1578440 ) ) ( not ( = ?auto_1578437 ?auto_1578441 ) ) ( not ( = ?auto_1578437 ?auto_1578442 ) ) ( not ( = ?auto_1578437 ?auto_1578443 ) ) ( not ( = ?auto_1578438 ?auto_1578439 ) ) ( not ( = ?auto_1578438 ?auto_1578440 ) ) ( not ( = ?auto_1578438 ?auto_1578441 ) ) ( not ( = ?auto_1578438 ?auto_1578442 ) ) ( not ( = ?auto_1578438 ?auto_1578443 ) ) ( not ( = ?auto_1578439 ?auto_1578440 ) ) ( not ( = ?auto_1578439 ?auto_1578441 ) ) ( not ( = ?auto_1578439 ?auto_1578442 ) ) ( not ( = ?auto_1578439 ?auto_1578443 ) ) ( not ( = ?auto_1578440 ?auto_1578441 ) ) ( not ( = ?auto_1578440 ?auto_1578442 ) ) ( not ( = ?auto_1578440 ?auto_1578443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1578441 ?auto_1578442 ?auto_1578443 )
      ( MAKE-14CRATE-VERIFY ?auto_1578430 ?auto_1578431 ?auto_1578432 ?auto_1578429 ?auto_1578433 ?auto_1578435 ?auto_1578434 ?auto_1578436 ?auto_1578437 ?auto_1578438 ?auto_1578439 ?auto_1578440 ?auto_1578441 ?auto_1578442 ?auto_1578443 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1578619 - SURFACE
      ?auto_1578620 - SURFACE
      ?auto_1578621 - SURFACE
      ?auto_1578618 - SURFACE
      ?auto_1578622 - SURFACE
      ?auto_1578624 - SURFACE
      ?auto_1578623 - SURFACE
      ?auto_1578625 - SURFACE
      ?auto_1578626 - SURFACE
      ?auto_1578627 - SURFACE
      ?auto_1578628 - SURFACE
      ?auto_1578629 - SURFACE
      ?auto_1578630 - SURFACE
      ?auto_1578631 - SURFACE
      ?auto_1578632 - SURFACE
    )
    :vars
    (
      ?auto_1578633 - HOIST
      ?auto_1578636 - PLACE
      ?auto_1578635 - TRUCK
      ?auto_1578637 - PLACE
      ?auto_1578634 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1578633 ?auto_1578636 ) ( SURFACE-AT ?auto_1578631 ?auto_1578636 ) ( CLEAR ?auto_1578631 ) ( IS-CRATE ?auto_1578632 ) ( not ( = ?auto_1578631 ?auto_1578632 ) ) ( AVAILABLE ?auto_1578633 ) ( ON ?auto_1578631 ?auto_1578630 ) ( not ( = ?auto_1578630 ?auto_1578631 ) ) ( not ( = ?auto_1578630 ?auto_1578632 ) ) ( TRUCK-AT ?auto_1578635 ?auto_1578637 ) ( not ( = ?auto_1578637 ?auto_1578636 ) ) ( HOIST-AT ?auto_1578634 ?auto_1578637 ) ( LIFTING ?auto_1578634 ?auto_1578632 ) ( not ( = ?auto_1578633 ?auto_1578634 ) ) ( ON ?auto_1578620 ?auto_1578619 ) ( ON ?auto_1578621 ?auto_1578620 ) ( ON ?auto_1578618 ?auto_1578621 ) ( ON ?auto_1578622 ?auto_1578618 ) ( ON ?auto_1578624 ?auto_1578622 ) ( ON ?auto_1578623 ?auto_1578624 ) ( ON ?auto_1578625 ?auto_1578623 ) ( ON ?auto_1578626 ?auto_1578625 ) ( ON ?auto_1578627 ?auto_1578626 ) ( ON ?auto_1578628 ?auto_1578627 ) ( ON ?auto_1578629 ?auto_1578628 ) ( ON ?auto_1578630 ?auto_1578629 ) ( not ( = ?auto_1578619 ?auto_1578620 ) ) ( not ( = ?auto_1578619 ?auto_1578621 ) ) ( not ( = ?auto_1578619 ?auto_1578618 ) ) ( not ( = ?auto_1578619 ?auto_1578622 ) ) ( not ( = ?auto_1578619 ?auto_1578624 ) ) ( not ( = ?auto_1578619 ?auto_1578623 ) ) ( not ( = ?auto_1578619 ?auto_1578625 ) ) ( not ( = ?auto_1578619 ?auto_1578626 ) ) ( not ( = ?auto_1578619 ?auto_1578627 ) ) ( not ( = ?auto_1578619 ?auto_1578628 ) ) ( not ( = ?auto_1578619 ?auto_1578629 ) ) ( not ( = ?auto_1578619 ?auto_1578630 ) ) ( not ( = ?auto_1578619 ?auto_1578631 ) ) ( not ( = ?auto_1578619 ?auto_1578632 ) ) ( not ( = ?auto_1578620 ?auto_1578621 ) ) ( not ( = ?auto_1578620 ?auto_1578618 ) ) ( not ( = ?auto_1578620 ?auto_1578622 ) ) ( not ( = ?auto_1578620 ?auto_1578624 ) ) ( not ( = ?auto_1578620 ?auto_1578623 ) ) ( not ( = ?auto_1578620 ?auto_1578625 ) ) ( not ( = ?auto_1578620 ?auto_1578626 ) ) ( not ( = ?auto_1578620 ?auto_1578627 ) ) ( not ( = ?auto_1578620 ?auto_1578628 ) ) ( not ( = ?auto_1578620 ?auto_1578629 ) ) ( not ( = ?auto_1578620 ?auto_1578630 ) ) ( not ( = ?auto_1578620 ?auto_1578631 ) ) ( not ( = ?auto_1578620 ?auto_1578632 ) ) ( not ( = ?auto_1578621 ?auto_1578618 ) ) ( not ( = ?auto_1578621 ?auto_1578622 ) ) ( not ( = ?auto_1578621 ?auto_1578624 ) ) ( not ( = ?auto_1578621 ?auto_1578623 ) ) ( not ( = ?auto_1578621 ?auto_1578625 ) ) ( not ( = ?auto_1578621 ?auto_1578626 ) ) ( not ( = ?auto_1578621 ?auto_1578627 ) ) ( not ( = ?auto_1578621 ?auto_1578628 ) ) ( not ( = ?auto_1578621 ?auto_1578629 ) ) ( not ( = ?auto_1578621 ?auto_1578630 ) ) ( not ( = ?auto_1578621 ?auto_1578631 ) ) ( not ( = ?auto_1578621 ?auto_1578632 ) ) ( not ( = ?auto_1578618 ?auto_1578622 ) ) ( not ( = ?auto_1578618 ?auto_1578624 ) ) ( not ( = ?auto_1578618 ?auto_1578623 ) ) ( not ( = ?auto_1578618 ?auto_1578625 ) ) ( not ( = ?auto_1578618 ?auto_1578626 ) ) ( not ( = ?auto_1578618 ?auto_1578627 ) ) ( not ( = ?auto_1578618 ?auto_1578628 ) ) ( not ( = ?auto_1578618 ?auto_1578629 ) ) ( not ( = ?auto_1578618 ?auto_1578630 ) ) ( not ( = ?auto_1578618 ?auto_1578631 ) ) ( not ( = ?auto_1578618 ?auto_1578632 ) ) ( not ( = ?auto_1578622 ?auto_1578624 ) ) ( not ( = ?auto_1578622 ?auto_1578623 ) ) ( not ( = ?auto_1578622 ?auto_1578625 ) ) ( not ( = ?auto_1578622 ?auto_1578626 ) ) ( not ( = ?auto_1578622 ?auto_1578627 ) ) ( not ( = ?auto_1578622 ?auto_1578628 ) ) ( not ( = ?auto_1578622 ?auto_1578629 ) ) ( not ( = ?auto_1578622 ?auto_1578630 ) ) ( not ( = ?auto_1578622 ?auto_1578631 ) ) ( not ( = ?auto_1578622 ?auto_1578632 ) ) ( not ( = ?auto_1578624 ?auto_1578623 ) ) ( not ( = ?auto_1578624 ?auto_1578625 ) ) ( not ( = ?auto_1578624 ?auto_1578626 ) ) ( not ( = ?auto_1578624 ?auto_1578627 ) ) ( not ( = ?auto_1578624 ?auto_1578628 ) ) ( not ( = ?auto_1578624 ?auto_1578629 ) ) ( not ( = ?auto_1578624 ?auto_1578630 ) ) ( not ( = ?auto_1578624 ?auto_1578631 ) ) ( not ( = ?auto_1578624 ?auto_1578632 ) ) ( not ( = ?auto_1578623 ?auto_1578625 ) ) ( not ( = ?auto_1578623 ?auto_1578626 ) ) ( not ( = ?auto_1578623 ?auto_1578627 ) ) ( not ( = ?auto_1578623 ?auto_1578628 ) ) ( not ( = ?auto_1578623 ?auto_1578629 ) ) ( not ( = ?auto_1578623 ?auto_1578630 ) ) ( not ( = ?auto_1578623 ?auto_1578631 ) ) ( not ( = ?auto_1578623 ?auto_1578632 ) ) ( not ( = ?auto_1578625 ?auto_1578626 ) ) ( not ( = ?auto_1578625 ?auto_1578627 ) ) ( not ( = ?auto_1578625 ?auto_1578628 ) ) ( not ( = ?auto_1578625 ?auto_1578629 ) ) ( not ( = ?auto_1578625 ?auto_1578630 ) ) ( not ( = ?auto_1578625 ?auto_1578631 ) ) ( not ( = ?auto_1578625 ?auto_1578632 ) ) ( not ( = ?auto_1578626 ?auto_1578627 ) ) ( not ( = ?auto_1578626 ?auto_1578628 ) ) ( not ( = ?auto_1578626 ?auto_1578629 ) ) ( not ( = ?auto_1578626 ?auto_1578630 ) ) ( not ( = ?auto_1578626 ?auto_1578631 ) ) ( not ( = ?auto_1578626 ?auto_1578632 ) ) ( not ( = ?auto_1578627 ?auto_1578628 ) ) ( not ( = ?auto_1578627 ?auto_1578629 ) ) ( not ( = ?auto_1578627 ?auto_1578630 ) ) ( not ( = ?auto_1578627 ?auto_1578631 ) ) ( not ( = ?auto_1578627 ?auto_1578632 ) ) ( not ( = ?auto_1578628 ?auto_1578629 ) ) ( not ( = ?auto_1578628 ?auto_1578630 ) ) ( not ( = ?auto_1578628 ?auto_1578631 ) ) ( not ( = ?auto_1578628 ?auto_1578632 ) ) ( not ( = ?auto_1578629 ?auto_1578630 ) ) ( not ( = ?auto_1578629 ?auto_1578631 ) ) ( not ( = ?auto_1578629 ?auto_1578632 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1578630 ?auto_1578631 ?auto_1578632 )
      ( MAKE-14CRATE-VERIFY ?auto_1578619 ?auto_1578620 ?auto_1578621 ?auto_1578618 ?auto_1578622 ?auto_1578624 ?auto_1578623 ?auto_1578625 ?auto_1578626 ?auto_1578627 ?auto_1578628 ?auto_1578629 ?auto_1578630 ?auto_1578631 ?auto_1578632 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1578822 - SURFACE
      ?auto_1578823 - SURFACE
      ?auto_1578824 - SURFACE
      ?auto_1578821 - SURFACE
      ?auto_1578825 - SURFACE
      ?auto_1578827 - SURFACE
      ?auto_1578826 - SURFACE
      ?auto_1578828 - SURFACE
      ?auto_1578829 - SURFACE
      ?auto_1578830 - SURFACE
      ?auto_1578831 - SURFACE
      ?auto_1578832 - SURFACE
      ?auto_1578833 - SURFACE
      ?auto_1578834 - SURFACE
      ?auto_1578835 - SURFACE
    )
    :vars
    (
      ?auto_1578841 - HOIST
      ?auto_1578837 - PLACE
      ?auto_1578839 - TRUCK
      ?auto_1578836 - PLACE
      ?auto_1578838 - HOIST
      ?auto_1578840 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1578841 ?auto_1578837 ) ( SURFACE-AT ?auto_1578834 ?auto_1578837 ) ( CLEAR ?auto_1578834 ) ( IS-CRATE ?auto_1578835 ) ( not ( = ?auto_1578834 ?auto_1578835 ) ) ( AVAILABLE ?auto_1578841 ) ( ON ?auto_1578834 ?auto_1578833 ) ( not ( = ?auto_1578833 ?auto_1578834 ) ) ( not ( = ?auto_1578833 ?auto_1578835 ) ) ( TRUCK-AT ?auto_1578839 ?auto_1578836 ) ( not ( = ?auto_1578836 ?auto_1578837 ) ) ( HOIST-AT ?auto_1578838 ?auto_1578836 ) ( not ( = ?auto_1578841 ?auto_1578838 ) ) ( AVAILABLE ?auto_1578838 ) ( SURFACE-AT ?auto_1578835 ?auto_1578836 ) ( ON ?auto_1578835 ?auto_1578840 ) ( CLEAR ?auto_1578835 ) ( not ( = ?auto_1578834 ?auto_1578840 ) ) ( not ( = ?auto_1578835 ?auto_1578840 ) ) ( not ( = ?auto_1578833 ?auto_1578840 ) ) ( ON ?auto_1578823 ?auto_1578822 ) ( ON ?auto_1578824 ?auto_1578823 ) ( ON ?auto_1578821 ?auto_1578824 ) ( ON ?auto_1578825 ?auto_1578821 ) ( ON ?auto_1578827 ?auto_1578825 ) ( ON ?auto_1578826 ?auto_1578827 ) ( ON ?auto_1578828 ?auto_1578826 ) ( ON ?auto_1578829 ?auto_1578828 ) ( ON ?auto_1578830 ?auto_1578829 ) ( ON ?auto_1578831 ?auto_1578830 ) ( ON ?auto_1578832 ?auto_1578831 ) ( ON ?auto_1578833 ?auto_1578832 ) ( not ( = ?auto_1578822 ?auto_1578823 ) ) ( not ( = ?auto_1578822 ?auto_1578824 ) ) ( not ( = ?auto_1578822 ?auto_1578821 ) ) ( not ( = ?auto_1578822 ?auto_1578825 ) ) ( not ( = ?auto_1578822 ?auto_1578827 ) ) ( not ( = ?auto_1578822 ?auto_1578826 ) ) ( not ( = ?auto_1578822 ?auto_1578828 ) ) ( not ( = ?auto_1578822 ?auto_1578829 ) ) ( not ( = ?auto_1578822 ?auto_1578830 ) ) ( not ( = ?auto_1578822 ?auto_1578831 ) ) ( not ( = ?auto_1578822 ?auto_1578832 ) ) ( not ( = ?auto_1578822 ?auto_1578833 ) ) ( not ( = ?auto_1578822 ?auto_1578834 ) ) ( not ( = ?auto_1578822 ?auto_1578835 ) ) ( not ( = ?auto_1578822 ?auto_1578840 ) ) ( not ( = ?auto_1578823 ?auto_1578824 ) ) ( not ( = ?auto_1578823 ?auto_1578821 ) ) ( not ( = ?auto_1578823 ?auto_1578825 ) ) ( not ( = ?auto_1578823 ?auto_1578827 ) ) ( not ( = ?auto_1578823 ?auto_1578826 ) ) ( not ( = ?auto_1578823 ?auto_1578828 ) ) ( not ( = ?auto_1578823 ?auto_1578829 ) ) ( not ( = ?auto_1578823 ?auto_1578830 ) ) ( not ( = ?auto_1578823 ?auto_1578831 ) ) ( not ( = ?auto_1578823 ?auto_1578832 ) ) ( not ( = ?auto_1578823 ?auto_1578833 ) ) ( not ( = ?auto_1578823 ?auto_1578834 ) ) ( not ( = ?auto_1578823 ?auto_1578835 ) ) ( not ( = ?auto_1578823 ?auto_1578840 ) ) ( not ( = ?auto_1578824 ?auto_1578821 ) ) ( not ( = ?auto_1578824 ?auto_1578825 ) ) ( not ( = ?auto_1578824 ?auto_1578827 ) ) ( not ( = ?auto_1578824 ?auto_1578826 ) ) ( not ( = ?auto_1578824 ?auto_1578828 ) ) ( not ( = ?auto_1578824 ?auto_1578829 ) ) ( not ( = ?auto_1578824 ?auto_1578830 ) ) ( not ( = ?auto_1578824 ?auto_1578831 ) ) ( not ( = ?auto_1578824 ?auto_1578832 ) ) ( not ( = ?auto_1578824 ?auto_1578833 ) ) ( not ( = ?auto_1578824 ?auto_1578834 ) ) ( not ( = ?auto_1578824 ?auto_1578835 ) ) ( not ( = ?auto_1578824 ?auto_1578840 ) ) ( not ( = ?auto_1578821 ?auto_1578825 ) ) ( not ( = ?auto_1578821 ?auto_1578827 ) ) ( not ( = ?auto_1578821 ?auto_1578826 ) ) ( not ( = ?auto_1578821 ?auto_1578828 ) ) ( not ( = ?auto_1578821 ?auto_1578829 ) ) ( not ( = ?auto_1578821 ?auto_1578830 ) ) ( not ( = ?auto_1578821 ?auto_1578831 ) ) ( not ( = ?auto_1578821 ?auto_1578832 ) ) ( not ( = ?auto_1578821 ?auto_1578833 ) ) ( not ( = ?auto_1578821 ?auto_1578834 ) ) ( not ( = ?auto_1578821 ?auto_1578835 ) ) ( not ( = ?auto_1578821 ?auto_1578840 ) ) ( not ( = ?auto_1578825 ?auto_1578827 ) ) ( not ( = ?auto_1578825 ?auto_1578826 ) ) ( not ( = ?auto_1578825 ?auto_1578828 ) ) ( not ( = ?auto_1578825 ?auto_1578829 ) ) ( not ( = ?auto_1578825 ?auto_1578830 ) ) ( not ( = ?auto_1578825 ?auto_1578831 ) ) ( not ( = ?auto_1578825 ?auto_1578832 ) ) ( not ( = ?auto_1578825 ?auto_1578833 ) ) ( not ( = ?auto_1578825 ?auto_1578834 ) ) ( not ( = ?auto_1578825 ?auto_1578835 ) ) ( not ( = ?auto_1578825 ?auto_1578840 ) ) ( not ( = ?auto_1578827 ?auto_1578826 ) ) ( not ( = ?auto_1578827 ?auto_1578828 ) ) ( not ( = ?auto_1578827 ?auto_1578829 ) ) ( not ( = ?auto_1578827 ?auto_1578830 ) ) ( not ( = ?auto_1578827 ?auto_1578831 ) ) ( not ( = ?auto_1578827 ?auto_1578832 ) ) ( not ( = ?auto_1578827 ?auto_1578833 ) ) ( not ( = ?auto_1578827 ?auto_1578834 ) ) ( not ( = ?auto_1578827 ?auto_1578835 ) ) ( not ( = ?auto_1578827 ?auto_1578840 ) ) ( not ( = ?auto_1578826 ?auto_1578828 ) ) ( not ( = ?auto_1578826 ?auto_1578829 ) ) ( not ( = ?auto_1578826 ?auto_1578830 ) ) ( not ( = ?auto_1578826 ?auto_1578831 ) ) ( not ( = ?auto_1578826 ?auto_1578832 ) ) ( not ( = ?auto_1578826 ?auto_1578833 ) ) ( not ( = ?auto_1578826 ?auto_1578834 ) ) ( not ( = ?auto_1578826 ?auto_1578835 ) ) ( not ( = ?auto_1578826 ?auto_1578840 ) ) ( not ( = ?auto_1578828 ?auto_1578829 ) ) ( not ( = ?auto_1578828 ?auto_1578830 ) ) ( not ( = ?auto_1578828 ?auto_1578831 ) ) ( not ( = ?auto_1578828 ?auto_1578832 ) ) ( not ( = ?auto_1578828 ?auto_1578833 ) ) ( not ( = ?auto_1578828 ?auto_1578834 ) ) ( not ( = ?auto_1578828 ?auto_1578835 ) ) ( not ( = ?auto_1578828 ?auto_1578840 ) ) ( not ( = ?auto_1578829 ?auto_1578830 ) ) ( not ( = ?auto_1578829 ?auto_1578831 ) ) ( not ( = ?auto_1578829 ?auto_1578832 ) ) ( not ( = ?auto_1578829 ?auto_1578833 ) ) ( not ( = ?auto_1578829 ?auto_1578834 ) ) ( not ( = ?auto_1578829 ?auto_1578835 ) ) ( not ( = ?auto_1578829 ?auto_1578840 ) ) ( not ( = ?auto_1578830 ?auto_1578831 ) ) ( not ( = ?auto_1578830 ?auto_1578832 ) ) ( not ( = ?auto_1578830 ?auto_1578833 ) ) ( not ( = ?auto_1578830 ?auto_1578834 ) ) ( not ( = ?auto_1578830 ?auto_1578835 ) ) ( not ( = ?auto_1578830 ?auto_1578840 ) ) ( not ( = ?auto_1578831 ?auto_1578832 ) ) ( not ( = ?auto_1578831 ?auto_1578833 ) ) ( not ( = ?auto_1578831 ?auto_1578834 ) ) ( not ( = ?auto_1578831 ?auto_1578835 ) ) ( not ( = ?auto_1578831 ?auto_1578840 ) ) ( not ( = ?auto_1578832 ?auto_1578833 ) ) ( not ( = ?auto_1578832 ?auto_1578834 ) ) ( not ( = ?auto_1578832 ?auto_1578835 ) ) ( not ( = ?auto_1578832 ?auto_1578840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1578833 ?auto_1578834 ?auto_1578835 )
      ( MAKE-14CRATE-VERIFY ?auto_1578822 ?auto_1578823 ?auto_1578824 ?auto_1578821 ?auto_1578825 ?auto_1578827 ?auto_1578826 ?auto_1578828 ?auto_1578829 ?auto_1578830 ?auto_1578831 ?auto_1578832 ?auto_1578833 ?auto_1578834 ?auto_1578835 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1579026 - SURFACE
      ?auto_1579027 - SURFACE
      ?auto_1579028 - SURFACE
      ?auto_1579025 - SURFACE
      ?auto_1579029 - SURFACE
      ?auto_1579031 - SURFACE
      ?auto_1579030 - SURFACE
      ?auto_1579032 - SURFACE
      ?auto_1579033 - SURFACE
      ?auto_1579034 - SURFACE
      ?auto_1579035 - SURFACE
      ?auto_1579036 - SURFACE
      ?auto_1579037 - SURFACE
      ?auto_1579038 - SURFACE
      ?auto_1579039 - SURFACE
    )
    :vars
    (
      ?auto_1579042 - HOIST
      ?auto_1579044 - PLACE
      ?auto_1579043 - PLACE
      ?auto_1579045 - HOIST
      ?auto_1579041 - SURFACE
      ?auto_1579040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1579042 ?auto_1579044 ) ( SURFACE-AT ?auto_1579038 ?auto_1579044 ) ( CLEAR ?auto_1579038 ) ( IS-CRATE ?auto_1579039 ) ( not ( = ?auto_1579038 ?auto_1579039 ) ) ( AVAILABLE ?auto_1579042 ) ( ON ?auto_1579038 ?auto_1579037 ) ( not ( = ?auto_1579037 ?auto_1579038 ) ) ( not ( = ?auto_1579037 ?auto_1579039 ) ) ( not ( = ?auto_1579043 ?auto_1579044 ) ) ( HOIST-AT ?auto_1579045 ?auto_1579043 ) ( not ( = ?auto_1579042 ?auto_1579045 ) ) ( AVAILABLE ?auto_1579045 ) ( SURFACE-AT ?auto_1579039 ?auto_1579043 ) ( ON ?auto_1579039 ?auto_1579041 ) ( CLEAR ?auto_1579039 ) ( not ( = ?auto_1579038 ?auto_1579041 ) ) ( not ( = ?auto_1579039 ?auto_1579041 ) ) ( not ( = ?auto_1579037 ?auto_1579041 ) ) ( TRUCK-AT ?auto_1579040 ?auto_1579044 ) ( ON ?auto_1579027 ?auto_1579026 ) ( ON ?auto_1579028 ?auto_1579027 ) ( ON ?auto_1579025 ?auto_1579028 ) ( ON ?auto_1579029 ?auto_1579025 ) ( ON ?auto_1579031 ?auto_1579029 ) ( ON ?auto_1579030 ?auto_1579031 ) ( ON ?auto_1579032 ?auto_1579030 ) ( ON ?auto_1579033 ?auto_1579032 ) ( ON ?auto_1579034 ?auto_1579033 ) ( ON ?auto_1579035 ?auto_1579034 ) ( ON ?auto_1579036 ?auto_1579035 ) ( ON ?auto_1579037 ?auto_1579036 ) ( not ( = ?auto_1579026 ?auto_1579027 ) ) ( not ( = ?auto_1579026 ?auto_1579028 ) ) ( not ( = ?auto_1579026 ?auto_1579025 ) ) ( not ( = ?auto_1579026 ?auto_1579029 ) ) ( not ( = ?auto_1579026 ?auto_1579031 ) ) ( not ( = ?auto_1579026 ?auto_1579030 ) ) ( not ( = ?auto_1579026 ?auto_1579032 ) ) ( not ( = ?auto_1579026 ?auto_1579033 ) ) ( not ( = ?auto_1579026 ?auto_1579034 ) ) ( not ( = ?auto_1579026 ?auto_1579035 ) ) ( not ( = ?auto_1579026 ?auto_1579036 ) ) ( not ( = ?auto_1579026 ?auto_1579037 ) ) ( not ( = ?auto_1579026 ?auto_1579038 ) ) ( not ( = ?auto_1579026 ?auto_1579039 ) ) ( not ( = ?auto_1579026 ?auto_1579041 ) ) ( not ( = ?auto_1579027 ?auto_1579028 ) ) ( not ( = ?auto_1579027 ?auto_1579025 ) ) ( not ( = ?auto_1579027 ?auto_1579029 ) ) ( not ( = ?auto_1579027 ?auto_1579031 ) ) ( not ( = ?auto_1579027 ?auto_1579030 ) ) ( not ( = ?auto_1579027 ?auto_1579032 ) ) ( not ( = ?auto_1579027 ?auto_1579033 ) ) ( not ( = ?auto_1579027 ?auto_1579034 ) ) ( not ( = ?auto_1579027 ?auto_1579035 ) ) ( not ( = ?auto_1579027 ?auto_1579036 ) ) ( not ( = ?auto_1579027 ?auto_1579037 ) ) ( not ( = ?auto_1579027 ?auto_1579038 ) ) ( not ( = ?auto_1579027 ?auto_1579039 ) ) ( not ( = ?auto_1579027 ?auto_1579041 ) ) ( not ( = ?auto_1579028 ?auto_1579025 ) ) ( not ( = ?auto_1579028 ?auto_1579029 ) ) ( not ( = ?auto_1579028 ?auto_1579031 ) ) ( not ( = ?auto_1579028 ?auto_1579030 ) ) ( not ( = ?auto_1579028 ?auto_1579032 ) ) ( not ( = ?auto_1579028 ?auto_1579033 ) ) ( not ( = ?auto_1579028 ?auto_1579034 ) ) ( not ( = ?auto_1579028 ?auto_1579035 ) ) ( not ( = ?auto_1579028 ?auto_1579036 ) ) ( not ( = ?auto_1579028 ?auto_1579037 ) ) ( not ( = ?auto_1579028 ?auto_1579038 ) ) ( not ( = ?auto_1579028 ?auto_1579039 ) ) ( not ( = ?auto_1579028 ?auto_1579041 ) ) ( not ( = ?auto_1579025 ?auto_1579029 ) ) ( not ( = ?auto_1579025 ?auto_1579031 ) ) ( not ( = ?auto_1579025 ?auto_1579030 ) ) ( not ( = ?auto_1579025 ?auto_1579032 ) ) ( not ( = ?auto_1579025 ?auto_1579033 ) ) ( not ( = ?auto_1579025 ?auto_1579034 ) ) ( not ( = ?auto_1579025 ?auto_1579035 ) ) ( not ( = ?auto_1579025 ?auto_1579036 ) ) ( not ( = ?auto_1579025 ?auto_1579037 ) ) ( not ( = ?auto_1579025 ?auto_1579038 ) ) ( not ( = ?auto_1579025 ?auto_1579039 ) ) ( not ( = ?auto_1579025 ?auto_1579041 ) ) ( not ( = ?auto_1579029 ?auto_1579031 ) ) ( not ( = ?auto_1579029 ?auto_1579030 ) ) ( not ( = ?auto_1579029 ?auto_1579032 ) ) ( not ( = ?auto_1579029 ?auto_1579033 ) ) ( not ( = ?auto_1579029 ?auto_1579034 ) ) ( not ( = ?auto_1579029 ?auto_1579035 ) ) ( not ( = ?auto_1579029 ?auto_1579036 ) ) ( not ( = ?auto_1579029 ?auto_1579037 ) ) ( not ( = ?auto_1579029 ?auto_1579038 ) ) ( not ( = ?auto_1579029 ?auto_1579039 ) ) ( not ( = ?auto_1579029 ?auto_1579041 ) ) ( not ( = ?auto_1579031 ?auto_1579030 ) ) ( not ( = ?auto_1579031 ?auto_1579032 ) ) ( not ( = ?auto_1579031 ?auto_1579033 ) ) ( not ( = ?auto_1579031 ?auto_1579034 ) ) ( not ( = ?auto_1579031 ?auto_1579035 ) ) ( not ( = ?auto_1579031 ?auto_1579036 ) ) ( not ( = ?auto_1579031 ?auto_1579037 ) ) ( not ( = ?auto_1579031 ?auto_1579038 ) ) ( not ( = ?auto_1579031 ?auto_1579039 ) ) ( not ( = ?auto_1579031 ?auto_1579041 ) ) ( not ( = ?auto_1579030 ?auto_1579032 ) ) ( not ( = ?auto_1579030 ?auto_1579033 ) ) ( not ( = ?auto_1579030 ?auto_1579034 ) ) ( not ( = ?auto_1579030 ?auto_1579035 ) ) ( not ( = ?auto_1579030 ?auto_1579036 ) ) ( not ( = ?auto_1579030 ?auto_1579037 ) ) ( not ( = ?auto_1579030 ?auto_1579038 ) ) ( not ( = ?auto_1579030 ?auto_1579039 ) ) ( not ( = ?auto_1579030 ?auto_1579041 ) ) ( not ( = ?auto_1579032 ?auto_1579033 ) ) ( not ( = ?auto_1579032 ?auto_1579034 ) ) ( not ( = ?auto_1579032 ?auto_1579035 ) ) ( not ( = ?auto_1579032 ?auto_1579036 ) ) ( not ( = ?auto_1579032 ?auto_1579037 ) ) ( not ( = ?auto_1579032 ?auto_1579038 ) ) ( not ( = ?auto_1579032 ?auto_1579039 ) ) ( not ( = ?auto_1579032 ?auto_1579041 ) ) ( not ( = ?auto_1579033 ?auto_1579034 ) ) ( not ( = ?auto_1579033 ?auto_1579035 ) ) ( not ( = ?auto_1579033 ?auto_1579036 ) ) ( not ( = ?auto_1579033 ?auto_1579037 ) ) ( not ( = ?auto_1579033 ?auto_1579038 ) ) ( not ( = ?auto_1579033 ?auto_1579039 ) ) ( not ( = ?auto_1579033 ?auto_1579041 ) ) ( not ( = ?auto_1579034 ?auto_1579035 ) ) ( not ( = ?auto_1579034 ?auto_1579036 ) ) ( not ( = ?auto_1579034 ?auto_1579037 ) ) ( not ( = ?auto_1579034 ?auto_1579038 ) ) ( not ( = ?auto_1579034 ?auto_1579039 ) ) ( not ( = ?auto_1579034 ?auto_1579041 ) ) ( not ( = ?auto_1579035 ?auto_1579036 ) ) ( not ( = ?auto_1579035 ?auto_1579037 ) ) ( not ( = ?auto_1579035 ?auto_1579038 ) ) ( not ( = ?auto_1579035 ?auto_1579039 ) ) ( not ( = ?auto_1579035 ?auto_1579041 ) ) ( not ( = ?auto_1579036 ?auto_1579037 ) ) ( not ( = ?auto_1579036 ?auto_1579038 ) ) ( not ( = ?auto_1579036 ?auto_1579039 ) ) ( not ( = ?auto_1579036 ?auto_1579041 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1579037 ?auto_1579038 ?auto_1579039 )
      ( MAKE-14CRATE-VERIFY ?auto_1579026 ?auto_1579027 ?auto_1579028 ?auto_1579025 ?auto_1579029 ?auto_1579031 ?auto_1579030 ?auto_1579032 ?auto_1579033 ?auto_1579034 ?auto_1579035 ?auto_1579036 ?auto_1579037 ?auto_1579038 ?auto_1579039 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1579230 - SURFACE
      ?auto_1579231 - SURFACE
      ?auto_1579232 - SURFACE
      ?auto_1579229 - SURFACE
      ?auto_1579233 - SURFACE
      ?auto_1579235 - SURFACE
      ?auto_1579234 - SURFACE
      ?auto_1579236 - SURFACE
      ?auto_1579237 - SURFACE
      ?auto_1579238 - SURFACE
      ?auto_1579239 - SURFACE
      ?auto_1579240 - SURFACE
      ?auto_1579241 - SURFACE
      ?auto_1579242 - SURFACE
      ?auto_1579243 - SURFACE
    )
    :vars
    (
      ?auto_1579247 - HOIST
      ?auto_1579246 - PLACE
      ?auto_1579244 - PLACE
      ?auto_1579245 - HOIST
      ?auto_1579249 - SURFACE
      ?auto_1579248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1579247 ?auto_1579246 ) ( IS-CRATE ?auto_1579243 ) ( not ( = ?auto_1579242 ?auto_1579243 ) ) ( not ( = ?auto_1579241 ?auto_1579242 ) ) ( not ( = ?auto_1579241 ?auto_1579243 ) ) ( not ( = ?auto_1579244 ?auto_1579246 ) ) ( HOIST-AT ?auto_1579245 ?auto_1579244 ) ( not ( = ?auto_1579247 ?auto_1579245 ) ) ( AVAILABLE ?auto_1579245 ) ( SURFACE-AT ?auto_1579243 ?auto_1579244 ) ( ON ?auto_1579243 ?auto_1579249 ) ( CLEAR ?auto_1579243 ) ( not ( = ?auto_1579242 ?auto_1579249 ) ) ( not ( = ?auto_1579243 ?auto_1579249 ) ) ( not ( = ?auto_1579241 ?auto_1579249 ) ) ( TRUCK-AT ?auto_1579248 ?auto_1579246 ) ( SURFACE-AT ?auto_1579241 ?auto_1579246 ) ( CLEAR ?auto_1579241 ) ( LIFTING ?auto_1579247 ?auto_1579242 ) ( IS-CRATE ?auto_1579242 ) ( ON ?auto_1579231 ?auto_1579230 ) ( ON ?auto_1579232 ?auto_1579231 ) ( ON ?auto_1579229 ?auto_1579232 ) ( ON ?auto_1579233 ?auto_1579229 ) ( ON ?auto_1579235 ?auto_1579233 ) ( ON ?auto_1579234 ?auto_1579235 ) ( ON ?auto_1579236 ?auto_1579234 ) ( ON ?auto_1579237 ?auto_1579236 ) ( ON ?auto_1579238 ?auto_1579237 ) ( ON ?auto_1579239 ?auto_1579238 ) ( ON ?auto_1579240 ?auto_1579239 ) ( ON ?auto_1579241 ?auto_1579240 ) ( not ( = ?auto_1579230 ?auto_1579231 ) ) ( not ( = ?auto_1579230 ?auto_1579232 ) ) ( not ( = ?auto_1579230 ?auto_1579229 ) ) ( not ( = ?auto_1579230 ?auto_1579233 ) ) ( not ( = ?auto_1579230 ?auto_1579235 ) ) ( not ( = ?auto_1579230 ?auto_1579234 ) ) ( not ( = ?auto_1579230 ?auto_1579236 ) ) ( not ( = ?auto_1579230 ?auto_1579237 ) ) ( not ( = ?auto_1579230 ?auto_1579238 ) ) ( not ( = ?auto_1579230 ?auto_1579239 ) ) ( not ( = ?auto_1579230 ?auto_1579240 ) ) ( not ( = ?auto_1579230 ?auto_1579241 ) ) ( not ( = ?auto_1579230 ?auto_1579242 ) ) ( not ( = ?auto_1579230 ?auto_1579243 ) ) ( not ( = ?auto_1579230 ?auto_1579249 ) ) ( not ( = ?auto_1579231 ?auto_1579232 ) ) ( not ( = ?auto_1579231 ?auto_1579229 ) ) ( not ( = ?auto_1579231 ?auto_1579233 ) ) ( not ( = ?auto_1579231 ?auto_1579235 ) ) ( not ( = ?auto_1579231 ?auto_1579234 ) ) ( not ( = ?auto_1579231 ?auto_1579236 ) ) ( not ( = ?auto_1579231 ?auto_1579237 ) ) ( not ( = ?auto_1579231 ?auto_1579238 ) ) ( not ( = ?auto_1579231 ?auto_1579239 ) ) ( not ( = ?auto_1579231 ?auto_1579240 ) ) ( not ( = ?auto_1579231 ?auto_1579241 ) ) ( not ( = ?auto_1579231 ?auto_1579242 ) ) ( not ( = ?auto_1579231 ?auto_1579243 ) ) ( not ( = ?auto_1579231 ?auto_1579249 ) ) ( not ( = ?auto_1579232 ?auto_1579229 ) ) ( not ( = ?auto_1579232 ?auto_1579233 ) ) ( not ( = ?auto_1579232 ?auto_1579235 ) ) ( not ( = ?auto_1579232 ?auto_1579234 ) ) ( not ( = ?auto_1579232 ?auto_1579236 ) ) ( not ( = ?auto_1579232 ?auto_1579237 ) ) ( not ( = ?auto_1579232 ?auto_1579238 ) ) ( not ( = ?auto_1579232 ?auto_1579239 ) ) ( not ( = ?auto_1579232 ?auto_1579240 ) ) ( not ( = ?auto_1579232 ?auto_1579241 ) ) ( not ( = ?auto_1579232 ?auto_1579242 ) ) ( not ( = ?auto_1579232 ?auto_1579243 ) ) ( not ( = ?auto_1579232 ?auto_1579249 ) ) ( not ( = ?auto_1579229 ?auto_1579233 ) ) ( not ( = ?auto_1579229 ?auto_1579235 ) ) ( not ( = ?auto_1579229 ?auto_1579234 ) ) ( not ( = ?auto_1579229 ?auto_1579236 ) ) ( not ( = ?auto_1579229 ?auto_1579237 ) ) ( not ( = ?auto_1579229 ?auto_1579238 ) ) ( not ( = ?auto_1579229 ?auto_1579239 ) ) ( not ( = ?auto_1579229 ?auto_1579240 ) ) ( not ( = ?auto_1579229 ?auto_1579241 ) ) ( not ( = ?auto_1579229 ?auto_1579242 ) ) ( not ( = ?auto_1579229 ?auto_1579243 ) ) ( not ( = ?auto_1579229 ?auto_1579249 ) ) ( not ( = ?auto_1579233 ?auto_1579235 ) ) ( not ( = ?auto_1579233 ?auto_1579234 ) ) ( not ( = ?auto_1579233 ?auto_1579236 ) ) ( not ( = ?auto_1579233 ?auto_1579237 ) ) ( not ( = ?auto_1579233 ?auto_1579238 ) ) ( not ( = ?auto_1579233 ?auto_1579239 ) ) ( not ( = ?auto_1579233 ?auto_1579240 ) ) ( not ( = ?auto_1579233 ?auto_1579241 ) ) ( not ( = ?auto_1579233 ?auto_1579242 ) ) ( not ( = ?auto_1579233 ?auto_1579243 ) ) ( not ( = ?auto_1579233 ?auto_1579249 ) ) ( not ( = ?auto_1579235 ?auto_1579234 ) ) ( not ( = ?auto_1579235 ?auto_1579236 ) ) ( not ( = ?auto_1579235 ?auto_1579237 ) ) ( not ( = ?auto_1579235 ?auto_1579238 ) ) ( not ( = ?auto_1579235 ?auto_1579239 ) ) ( not ( = ?auto_1579235 ?auto_1579240 ) ) ( not ( = ?auto_1579235 ?auto_1579241 ) ) ( not ( = ?auto_1579235 ?auto_1579242 ) ) ( not ( = ?auto_1579235 ?auto_1579243 ) ) ( not ( = ?auto_1579235 ?auto_1579249 ) ) ( not ( = ?auto_1579234 ?auto_1579236 ) ) ( not ( = ?auto_1579234 ?auto_1579237 ) ) ( not ( = ?auto_1579234 ?auto_1579238 ) ) ( not ( = ?auto_1579234 ?auto_1579239 ) ) ( not ( = ?auto_1579234 ?auto_1579240 ) ) ( not ( = ?auto_1579234 ?auto_1579241 ) ) ( not ( = ?auto_1579234 ?auto_1579242 ) ) ( not ( = ?auto_1579234 ?auto_1579243 ) ) ( not ( = ?auto_1579234 ?auto_1579249 ) ) ( not ( = ?auto_1579236 ?auto_1579237 ) ) ( not ( = ?auto_1579236 ?auto_1579238 ) ) ( not ( = ?auto_1579236 ?auto_1579239 ) ) ( not ( = ?auto_1579236 ?auto_1579240 ) ) ( not ( = ?auto_1579236 ?auto_1579241 ) ) ( not ( = ?auto_1579236 ?auto_1579242 ) ) ( not ( = ?auto_1579236 ?auto_1579243 ) ) ( not ( = ?auto_1579236 ?auto_1579249 ) ) ( not ( = ?auto_1579237 ?auto_1579238 ) ) ( not ( = ?auto_1579237 ?auto_1579239 ) ) ( not ( = ?auto_1579237 ?auto_1579240 ) ) ( not ( = ?auto_1579237 ?auto_1579241 ) ) ( not ( = ?auto_1579237 ?auto_1579242 ) ) ( not ( = ?auto_1579237 ?auto_1579243 ) ) ( not ( = ?auto_1579237 ?auto_1579249 ) ) ( not ( = ?auto_1579238 ?auto_1579239 ) ) ( not ( = ?auto_1579238 ?auto_1579240 ) ) ( not ( = ?auto_1579238 ?auto_1579241 ) ) ( not ( = ?auto_1579238 ?auto_1579242 ) ) ( not ( = ?auto_1579238 ?auto_1579243 ) ) ( not ( = ?auto_1579238 ?auto_1579249 ) ) ( not ( = ?auto_1579239 ?auto_1579240 ) ) ( not ( = ?auto_1579239 ?auto_1579241 ) ) ( not ( = ?auto_1579239 ?auto_1579242 ) ) ( not ( = ?auto_1579239 ?auto_1579243 ) ) ( not ( = ?auto_1579239 ?auto_1579249 ) ) ( not ( = ?auto_1579240 ?auto_1579241 ) ) ( not ( = ?auto_1579240 ?auto_1579242 ) ) ( not ( = ?auto_1579240 ?auto_1579243 ) ) ( not ( = ?auto_1579240 ?auto_1579249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1579241 ?auto_1579242 ?auto_1579243 )
      ( MAKE-14CRATE-VERIFY ?auto_1579230 ?auto_1579231 ?auto_1579232 ?auto_1579229 ?auto_1579233 ?auto_1579235 ?auto_1579234 ?auto_1579236 ?auto_1579237 ?auto_1579238 ?auto_1579239 ?auto_1579240 ?auto_1579241 ?auto_1579242 ?auto_1579243 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1579434 - SURFACE
      ?auto_1579435 - SURFACE
      ?auto_1579436 - SURFACE
      ?auto_1579433 - SURFACE
      ?auto_1579437 - SURFACE
      ?auto_1579439 - SURFACE
      ?auto_1579438 - SURFACE
      ?auto_1579440 - SURFACE
      ?auto_1579441 - SURFACE
      ?auto_1579442 - SURFACE
      ?auto_1579443 - SURFACE
      ?auto_1579444 - SURFACE
      ?auto_1579445 - SURFACE
      ?auto_1579446 - SURFACE
      ?auto_1579447 - SURFACE
    )
    :vars
    (
      ?auto_1579451 - HOIST
      ?auto_1579452 - PLACE
      ?auto_1579448 - PLACE
      ?auto_1579449 - HOIST
      ?auto_1579453 - SURFACE
      ?auto_1579450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1579451 ?auto_1579452 ) ( IS-CRATE ?auto_1579447 ) ( not ( = ?auto_1579446 ?auto_1579447 ) ) ( not ( = ?auto_1579445 ?auto_1579446 ) ) ( not ( = ?auto_1579445 ?auto_1579447 ) ) ( not ( = ?auto_1579448 ?auto_1579452 ) ) ( HOIST-AT ?auto_1579449 ?auto_1579448 ) ( not ( = ?auto_1579451 ?auto_1579449 ) ) ( AVAILABLE ?auto_1579449 ) ( SURFACE-AT ?auto_1579447 ?auto_1579448 ) ( ON ?auto_1579447 ?auto_1579453 ) ( CLEAR ?auto_1579447 ) ( not ( = ?auto_1579446 ?auto_1579453 ) ) ( not ( = ?auto_1579447 ?auto_1579453 ) ) ( not ( = ?auto_1579445 ?auto_1579453 ) ) ( TRUCK-AT ?auto_1579450 ?auto_1579452 ) ( SURFACE-AT ?auto_1579445 ?auto_1579452 ) ( CLEAR ?auto_1579445 ) ( IS-CRATE ?auto_1579446 ) ( AVAILABLE ?auto_1579451 ) ( IN ?auto_1579446 ?auto_1579450 ) ( ON ?auto_1579435 ?auto_1579434 ) ( ON ?auto_1579436 ?auto_1579435 ) ( ON ?auto_1579433 ?auto_1579436 ) ( ON ?auto_1579437 ?auto_1579433 ) ( ON ?auto_1579439 ?auto_1579437 ) ( ON ?auto_1579438 ?auto_1579439 ) ( ON ?auto_1579440 ?auto_1579438 ) ( ON ?auto_1579441 ?auto_1579440 ) ( ON ?auto_1579442 ?auto_1579441 ) ( ON ?auto_1579443 ?auto_1579442 ) ( ON ?auto_1579444 ?auto_1579443 ) ( ON ?auto_1579445 ?auto_1579444 ) ( not ( = ?auto_1579434 ?auto_1579435 ) ) ( not ( = ?auto_1579434 ?auto_1579436 ) ) ( not ( = ?auto_1579434 ?auto_1579433 ) ) ( not ( = ?auto_1579434 ?auto_1579437 ) ) ( not ( = ?auto_1579434 ?auto_1579439 ) ) ( not ( = ?auto_1579434 ?auto_1579438 ) ) ( not ( = ?auto_1579434 ?auto_1579440 ) ) ( not ( = ?auto_1579434 ?auto_1579441 ) ) ( not ( = ?auto_1579434 ?auto_1579442 ) ) ( not ( = ?auto_1579434 ?auto_1579443 ) ) ( not ( = ?auto_1579434 ?auto_1579444 ) ) ( not ( = ?auto_1579434 ?auto_1579445 ) ) ( not ( = ?auto_1579434 ?auto_1579446 ) ) ( not ( = ?auto_1579434 ?auto_1579447 ) ) ( not ( = ?auto_1579434 ?auto_1579453 ) ) ( not ( = ?auto_1579435 ?auto_1579436 ) ) ( not ( = ?auto_1579435 ?auto_1579433 ) ) ( not ( = ?auto_1579435 ?auto_1579437 ) ) ( not ( = ?auto_1579435 ?auto_1579439 ) ) ( not ( = ?auto_1579435 ?auto_1579438 ) ) ( not ( = ?auto_1579435 ?auto_1579440 ) ) ( not ( = ?auto_1579435 ?auto_1579441 ) ) ( not ( = ?auto_1579435 ?auto_1579442 ) ) ( not ( = ?auto_1579435 ?auto_1579443 ) ) ( not ( = ?auto_1579435 ?auto_1579444 ) ) ( not ( = ?auto_1579435 ?auto_1579445 ) ) ( not ( = ?auto_1579435 ?auto_1579446 ) ) ( not ( = ?auto_1579435 ?auto_1579447 ) ) ( not ( = ?auto_1579435 ?auto_1579453 ) ) ( not ( = ?auto_1579436 ?auto_1579433 ) ) ( not ( = ?auto_1579436 ?auto_1579437 ) ) ( not ( = ?auto_1579436 ?auto_1579439 ) ) ( not ( = ?auto_1579436 ?auto_1579438 ) ) ( not ( = ?auto_1579436 ?auto_1579440 ) ) ( not ( = ?auto_1579436 ?auto_1579441 ) ) ( not ( = ?auto_1579436 ?auto_1579442 ) ) ( not ( = ?auto_1579436 ?auto_1579443 ) ) ( not ( = ?auto_1579436 ?auto_1579444 ) ) ( not ( = ?auto_1579436 ?auto_1579445 ) ) ( not ( = ?auto_1579436 ?auto_1579446 ) ) ( not ( = ?auto_1579436 ?auto_1579447 ) ) ( not ( = ?auto_1579436 ?auto_1579453 ) ) ( not ( = ?auto_1579433 ?auto_1579437 ) ) ( not ( = ?auto_1579433 ?auto_1579439 ) ) ( not ( = ?auto_1579433 ?auto_1579438 ) ) ( not ( = ?auto_1579433 ?auto_1579440 ) ) ( not ( = ?auto_1579433 ?auto_1579441 ) ) ( not ( = ?auto_1579433 ?auto_1579442 ) ) ( not ( = ?auto_1579433 ?auto_1579443 ) ) ( not ( = ?auto_1579433 ?auto_1579444 ) ) ( not ( = ?auto_1579433 ?auto_1579445 ) ) ( not ( = ?auto_1579433 ?auto_1579446 ) ) ( not ( = ?auto_1579433 ?auto_1579447 ) ) ( not ( = ?auto_1579433 ?auto_1579453 ) ) ( not ( = ?auto_1579437 ?auto_1579439 ) ) ( not ( = ?auto_1579437 ?auto_1579438 ) ) ( not ( = ?auto_1579437 ?auto_1579440 ) ) ( not ( = ?auto_1579437 ?auto_1579441 ) ) ( not ( = ?auto_1579437 ?auto_1579442 ) ) ( not ( = ?auto_1579437 ?auto_1579443 ) ) ( not ( = ?auto_1579437 ?auto_1579444 ) ) ( not ( = ?auto_1579437 ?auto_1579445 ) ) ( not ( = ?auto_1579437 ?auto_1579446 ) ) ( not ( = ?auto_1579437 ?auto_1579447 ) ) ( not ( = ?auto_1579437 ?auto_1579453 ) ) ( not ( = ?auto_1579439 ?auto_1579438 ) ) ( not ( = ?auto_1579439 ?auto_1579440 ) ) ( not ( = ?auto_1579439 ?auto_1579441 ) ) ( not ( = ?auto_1579439 ?auto_1579442 ) ) ( not ( = ?auto_1579439 ?auto_1579443 ) ) ( not ( = ?auto_1579439 ?auto_1579444 ) ) ( not ( = ?auto_1579439 ?auto_1579445 ) ) ( not ( = ?auto_1579439 ?auto_1579446 ) ) ( not ( = ?auto_1579439 ?auto_1579447 ) ) ( not ( = ?auto_1579439 ?auto_1579453 ) ) ( not ( = ?auto_1579438 ?auto_1579440 ) ) ( not ( = ?auto_1579438 ?auto_1579441 ) ) ( not ( = ?auto_1579438 ?auto_1579442 ) ) ( not ( = ?auto_1579438 ?auto_1579443 ) ) ( not ( = ?auto_1579438 ?auto_1579444 ) ) ( not ( = ?auto_1579438 ?auto_1579445 ) ) ( not ( = ?auto_1579438 ?auto_1579446 ) ) ( not ( = ?auto_1579438 ?auto_1579447 ) ) ( not ( = ?auto_1579438 ?auto_1579453 ) ) ( not ( = ?auto_1579440 ?auto_1579441 ) ) ( not ( = ?auto_1579440 ?auto_1579442 ) ) ( not ( = ?auto_1579440 ?auto_1579443 ) ) ( not ( = ?auto_1579440 ?auto_1579444 ) ) ( not ( = ?auto_1579440 ?auto_1579445 ) ) ( not ( = ?auto_1579440 ?auto_1579446 ) ) ( not ( = ?auto_1579440 ?auto_1579447 ) ) ( not ( = ?auto_1579440 ?auto_1579453 ) ) ( not ( = ?auto_1579441 ?auto_1579442 ) ) ( not ( = ?auto_1579441 ?auto_1579443 ) ) ( not ( = ?auto_1579441 ?auto_1579444 ) ) ( not ( = ?auto_1579441 ?auto_1579445 ) ) ( not ( = ?auto_1579441 ?auto_1579446 ) ) ( not ( = ?auto_1579441 ?auto_1579447 ) ) ( not ( = ?auto_1579441 ?auto_1579453 ) ) ( not ( = ?auto_1579442 ?auto_1579443 ) ) ( not ( = ?auto_1579442 ?auto_1579444 ) ) ( not ( = ?auto_1579442 ?auto_1579445 ) ) ( not ( = ?auto_1579442 ?auto_1579446 ) ) ( not ( = ?auto_1579442 ?auto_1579447 ) ) ( not ( = ?auto_1579442 ?auto_1579453 ) ) ( not ( = ?auto_1579443 ?auto_1579444 ) ) ( not ( = ?auto_1579443 ?auto_1579445 ) ) ( not ( = ?auto_1579443 ?auto_1579446 ) ) ( not ( = ?auto_1579443 ?auto_1579447 ) ) ( not ( = ?auto_1579443 ?auto_1579453 ) ) ( not ( = ?auto_1579444 ?auto_1579445 ) ) ( not ( = ?auto_1579444 ?auto_1579446 ) ) ( not ( = ?auto_1579444 ?auto_1579447 ) ) ( not ( = ?auto_1579444 ?auto_1579453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1579445 ?auto_1579446 ?auto_1579447 )
      ( MAKE-14CRATE-VERIFY ?auto_1579434 ?auto_1579435 ?auto_1579436 ?auto_1579433 ?auto_1579437 ?auto_1579439 ?auto_1579438 ?auto_1579440 ?auto_1579441 ?auto_1579442 ?auto_1579443 ?auto_1579444 ?auto_1579445 ?auto_1579446 ?auto_1579447 ) )
  )

)

