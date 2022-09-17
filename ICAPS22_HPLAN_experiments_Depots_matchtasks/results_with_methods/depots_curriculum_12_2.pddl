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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11766 - SURFACE
      ?auto_11767 - SURFACE
    )
    :vars
    (
      ?auto_11768 - HOIST
      ?auto_11769 - PLACE
      ?auto_11771 - PLACE
      ?auto_11772 - HOIST
      ?auto_11773 - SURFACE
      ?auto_11770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11768 ?auto_11769 ) ( SURFACE-AT ?auto_11766 ?auto_11769 ) ( CLEAR ?auto_11766 ) ( IS-CRATE ?auto_11767 ) ( AVAILABLE ?auto_11768 ) ( not ( = ?auto_11771 ?auto_11769 ) ) ( HOIST-AT ?auto_11772 ?auto_11771 ) ( AVAILABLE ?auto_11772 ) ( SURFACE-AT ?auto_11767 ?auto_11771 ) ( ON ?auto_11767 ?auto_11773 ) ( CLEAR ?auto_11767 ) ( TRUCK-AT ?auto_11770 ?auto_11769 ) ( not ( = ?auto_11766 ?auto_11767 ) ) ( not ( = ?auto_11766 ?auto_11773 ) ) ( not ( = ?auto_11767 ?auto_11773 ) ) ( not ( = ?auto_11768 ?auto_11772 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11770 ?auto_11769 ?auto_11771 )
      ( !LIFT ?auto_11772 ?auto_11767 ?auto_11773 ?auto_11771 )
      ( !LOAD ?auto_11772 ?auto_11767 ?auto_11770 ?auto_11771 )
      ( !DRIVE ?auto_11770 ?auto_11771 ?auto_11769 )
      ( !UNLOAD ?auto_11768 ?auto_11767 ?auto_11770 ?auto_11769 )
      ( !DROP ?auto_11768 ?auto_11767 ?auto_11766 ?auto_11769 )
      ( MAKE-1CRATE-VERIFY ?auto_11766 ?auto_11767 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11776 - SURFACE
      ?auto_11777 - SURFACE
    )
    :vars
    (
      ?auto_11778 - HOIST
      ?auto_11779 - PLACE
      ?auto_11781 - PLACE
      ?auto_11782 - HOIST
      ?auto_11783 - SURFACE
      ?auto_11780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11778 ?auto_11779 ) ( SURFACE-AT ?auto_11776 ?auto_11779 ) ( CLEAR ?auto_11776 ) ( IS-CRATE ?auto_11777 ) ( AVAILABLE ?auto_11778 ) ( not ( = ?auto_11781 ?auto_11779 ) ) ( HOIST-AT ?auto_11782 ?auto_11781 ) ( AVAILABLE ?auto_11782 ) ( SURFACE-AT ?auto_11777 ?auto_11781 ) ( ON ?auto_11777 ?auto_11783 ) ( CLEAR ?auto_11777 ) ( TRUCK-AT ?auto_11780 ?auto_11779 ) ( not ( = ?auto_11776 ?auto_11777 ) ) ( not ( = ?auto_11776 ?auto_11783 ) ) ( not ( = ?auto_11777 ?auto_11783 ) ) ( not ( = ?auto_11778 ?auto_11782 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11780 ?auto_11779 ?auto_11781 )
      ( !LIFT ?auto_11782 ?auto_11777 ?auto_11783 ?auto_11781 )
      ( !LOAD ?auto_11782 ?auto_11777 ?auto_11780 ?auto_11781 )
      ( !DRIVE ?auto_11780 ?auto_11781 ?auto_11779 )
      ( !UNLOAD ?auto_11778 ?auto_11777 ?auto_11780 ?auto_11779 )
      ( !DROP ?auto_11778 ?auto_11777 ?auto_11776 ?auto_11779 )
      ( MAKE-1CRATE-VERIFY ?auto_11776 ?auto_11777 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11787 - SURFACE
      ?auto_11788 - SURFACE
      ?auto_11789 - SURFACE
    )
    :vars
    (
      ?auto_11795 - HOIST
      ?auto_11791 - PLACE
      ?auto_11792 - PLACE
      ?auto_11790 - HOIST
      ?auto_11793 - SURFACE
      ?auto_11796 - PLACE
      ?auto_11798 - HOIST
      ?auto_11797 - SURFACE
      ?auto_11794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11795 ?auto_11791 ) ( IS-CRATE ?auto_11789 ) ( not ( = ?auto_11792 ?auto_11791 ) ) ( HOIST-AT ?auto_11790 ?auto_11792 ) ( AVAILABLE ?auto_11790 ) ( SURFACE-AT ?auto_11789 ?auto_11792 ) ( ON ?auto_11789 ?auto_11793 ) ( CLEAR ?auto_11789 ) ( not ( = ?auto_11788 ?auto_11789 ) ) ( not ( = ?auto_11788 ?auto_11793 ) ) ( not ( = ?auto_11789 ?auto_11793 ) ) ( not ( = ?auto_11795 ?auto_11790 ) ) ( SURFACE-AT ?auto_11787 ?auto_11791 ) ( CLEAR ?auto_11787 ) ( IS-CRATE ?auto_11788 ) ( AVAILABLE ?auto_11795 ) ( not ( = ?auto_11796 ?auto_11791 ) ) ( HOIST-AT ?auto_11798 ?auto_11796 ) ( AVAILABLE ?auto_11798 ) ( SURFACE-AT ?auto_11788 ?auto_11796 ) ( ON ?auto_11788 ?auto_11797 ) ( CLEAR ?auto_11788 ) ( TRUCK-AT ?auto_11794 ?auto_11791 ) ( not ( = ?auto_11787 ?auto_11788 ) ) ( not ( = ?auto_11787 ?auto_11797 ) ) ( not ( = ?auto_11788 ?auto_11797 ) ) ( not ( = ?auto_11795 ?auto_11798 ) ) ( not ( = ?auto_11787 ?auto_11789 ) ) ( not ( = ?auto_11787 ?auto_11793 ) ) ( not ( = ?auto_11789 ?auto_11797 ) ) ( not ( = ?auto_11792 ?auto_11796 ) ) ( not ( = ?auto_11790 ?auto_11798 ) ) ( not ( = ?auto_11793 ?auto_11797 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11787 ?auto_11788 )
      ( MAKE-1CRATE ?auto_11788 ?auto_11789 )
      ( MAKE-2CRATE-VERIFY ?auto_11787 ?auto_11788 ?auto_11789 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11801 - SURFACE
      ?auto_11802 - SURFACE
    )
    :vars
    (
      ?auto_11803 - HOIST
      ?auto_11804 - PLACE
      ?auto_11806 - PLACE
      ?auto_11807 - HOIST
      ?auto_11808 - SURFACE
      ?auto_11805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11803 ?auto_11804 ) ( SURFACE-AT ?auto_11801 ?auto_11804 ) ( CLEAR ?auto_11801 ) ( IS-CRATE ?auto_11802 ) ( AVAILABLE ?auto_11803 ) ( not ( = ?auto_11806 ?auto_11804 ) ) ( HOIST-AT ?auto_11807 ?auto_11806 ) ( AVAILABLE ?auto_11807 ) ( SURFACE-AT ?auto_11802 ?auto_11806 ) ( ON ?auto_11802 ?auto_11808 ) ( CLEAR ?auto_11802 ) ( TRUCK-AT ?auto_11805 ?auto_11804 ) ( not ( = ?auto_11801 ?auto_11802 ) ) ( not ( = ?auto_11801 ?auto_11808 ) ) ( not ( = ?auto_11802 ?auto_11808 ) ) ( not ( = ?auto_11803 ?auto_11807 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11805 ?auto_11804 ?auto_11806 )
      ( !LIFT ?auto_11807 ?auto_11802 ?auto_11808 ?auto_11806 )
      ( !LOAD ?auto_11807 ?auto_11802 ?auto_11805 ?auto_11806 )
      ( !DRIVE ?auto_11805 ?auto_11806 ?auto_11804 )
      ( !UNLOAD ?auto_11803 ?auto_11802 ?auto_11805 ?auto_11804 )
      ( !DROP ?auto_11803 ?auto_11802 ?auto_11801 ?auto_11804 )
      ( MAKE-1CRATE-VERIFY ?auto_11801 ?auto_11802 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11813 - SURFACE
      ?auto_11814 - SURFACE
      ?auto_11815 - SURFACE
      ?auto_11816 - SURFACE
    )
    :vars
    (
      ?auto_11819 - HOIST
      ?auto_11820 - PLACE
      ?auto_11817 - PLACE
      ?auto_11822 - HOIST
      ?auto_11821 - SURFACE
      ?auto_11826 - PLACE
      ?auto_11823 - HOIST
      ?auto_11825 - SURFACE
      ?auto_11824 - SURFACE
      ?auto_11818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11819 ?auto_11820 ) ( IS-CRATE ?auto_11816 ) ( not ( = ?auto_11817 ?auto_11820 ) ) ( HOIST-AT ?auto_11822 ?auto_11817 ) ( SURFACE-AT ?auto_11816 ?auto_11817 ) ( ON ?auto_11816 ?auto_11821 ) ( CLEAR ?auto_11816 ) ( not ( = ?auto_11815 ?auto_11816 ) ) ( not ( = ?auto_11815 ?auto_11821 ) ) ( not ( = ?auto_11816 ?auto_11821 ) ) ( not ( = ?auto_11819 ?auto_11822 ) ) ( IS-CRATE ?auto_11815 ) ( not ( = ?auto_11826 ?auto_11820 ) ) ( HOIST-AT ?auto_11823 ?auto_11826 ) ( AVAILABLE ?auto_11823 ) ( SURFACE-AT ?auto_11815 ?auto_11826 ) ( ON ?auto_11815 ?auto_11825 ) ( CLEAR ?auto_11815 ) ( not ( = ?auto_11814 ?auto_11815 ) ) ( not ( = ?auto_11814 ?auto_11825 ) ) ( not ( = ?auto_11815 ?auto_11825 ) ) ( not ( = ?auto_11819 ?auto_11823 ) ) ( SURFACE-AT ?auto_11813 ?auto_11820 ) ( CLEAR ?auto_11813 ) ( IS-CRATE ?auto_11814 ) ( AVAILABLE ?auto_11819 ) ( AVAILABLE ?auto_11822 ) ( SURFACE-AT ?auto_11814 ?auto_11817 ) ( ON ?auto_11814 ?auto_11824 ) ( CLEAR ?auto_11814 ) ( TRUCK-AT ?auto_11818 ?auto_11820 ) ( not ( = ?auto_11813 ?auto_11814 ) ) ( not ( = ?auto_11813 ?auto_11824 ) ) ( not ( = ?auto_11814 ?auto_11824 ) ) ( not ( = ?auto_11813 ?auto_11815 ) ) ( not ( = ?auto_11813 ?auto_11825 ) ) ( not ( = ?auto_11815 ?auto_11824 ) ) ( not ( = ?auto_11826 ?auto_11817 ) ) ( not ( = ?auto_11823 ?auto_11822 ) ) ( not ( = ?auto_11825 ?auto_11824 ) ) ( not ( = ?auto_11813 ?auto_11816 ) ) ( not ( = ?auto_11813 ?auto_11821 ) ) ( not ( = ?auto_11814 ?auto_11816 ) ) ( not ( = ?auto_11814 ?auto_11821 ) ) ( not ( = ?auto_11816 ?auto_11825 ) ) ( not ( = ?auto_11816 ?auto_11824 ) ) ( not ( = ?auto_11821 ?auto_11825 ) ) ( not ( = ?auto_11821 ?auto_11824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11813 ?auto_11814 ?auto_11815 )
      ( MAKE-1CRATE ?auto_11815 ?auto_11816 )
      ( MAKE-3CRATE-VERIFY ?auto_11813 ?auto_11814 ?auto_11815 ?auto_11816 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11829 - SURFACE
      ?auto_11830 - SURFACE
    )
    :vars
    (
      ?auto_11831 - HOIST
      ?auto_11832 - PLACE
      ?auto_11834 - PLACE
      ?auto_11835 - HOIST
      ?auto_11836 - SURFACE
      ?auto_11833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11831 ?auto_11832 ) ( SURFACE-AT ?auto_11829 ?auto_11832 ) ( CLEAR ?auto_11829 ) ( IS-CRATE ?auto_11830 ) ( AVAILABLE ?auto_11831 ) ( not ( = ?auto_11834 ?auto_11832 ) ) ( HOIST-AT ?auto_11835 ?auto_11834 ) ( AVAILABLE ?auto_11835 ) ( SURFACE-AT ?auto_11830 ?auto_11834 ) ( ON ?auto_11830 ?auto_11836 ) ( CLEAR ?auto_11830 ) ( TRUCK-AT ?auto_11833 ?auto_11832 ) ( not ( = ?auto_11829 ?auto_11830 ) ) ( not ( = ?auto_11829 ?auto_11836 ) ) ( not ( = ?auto_11830 ?auto_11836 ) ) ( not ( = ?auto_11831 ?auto_11835 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11833 ?auto_11832 ?auto_11834 )
      ( !LIFT ?auto_11835 ?auto_11830 ?auto_11836 ?auto_11834 )
      ( !LOAD ?auto_11835 ?auto_11830 ?auto_11833 ?auto_11834 )
      ( !DRIVE ?auto_11833 ?auto_11834 ?auto_11832 )
      ( !UNLOAD ?auto_11831 ?auto_11830 ?auto_11833 ?auto_11832 )
      ( !DROP ?auto_11831 ?auto_11830 ?auto_11829 ?auto_11832 )
      ( MAKE-1CRATE-VERIFY ?auto_11829 ?auto_11830 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11842 - SURFACE
      ?auto_11843 - SURFACE
      ?auto_11844 - SURFACE
      ?auto_11845 - SURFACE
      ?auto_11846 - SURFACE
    )
    :vars
    (
      ?auto_11849 - HOIST
      ?auto_11847 - PLACE
      ?auto_11848 - PLACE
      ?auto_11850 - HOIST
      ?auto_11851 - SURFACE
      ?auto_11857 - PLACE
      ?auto_11855 - HOIST
      ?auto_11856 - SURFACE
      ?auto_11854 - PLACE
      ?auto_11853 - HOIST
      ?auto_11859 - SURFACE
      ?auto_11858 - SURFACE
      ?auto_11852 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11849 ?auto_11847 ) ( IS-CRATE ?auto_11846 ) ( not ( = ?auto_11848 ?auto_11847 ) ) ( HOIST-AT ?auto_11850 ?auto_11848 ) ( AVAILABLE ?auto_11850 ) ( SURFACE-AT ?auto_11846 ?auto_11848 ) ( ON ?auto_11846 ?auto_11851 ) ( CLEAR ?auto_11846 ) ( not ( = ?auto_11845 ?auto_11846 ) ) ( not ( = ?auto_11845 ?auto_11851 ) ) ( not ( = ?auto_11846 ?auto_11851 ) ) ( not ( = ?auto_11849 ?auto_11850 ) ) ( IS-CRATE ?auto_11845 ) ( not ( = ?auto_11857 ?auto_11847 ) ) ( HOIST-AT ?auto_11855 ?auto_11857 ) ( SURFACE-AT ?auto_11845 ?auto_11857 ) ( ON ?auto_11845 ?auto_11856 ) ( CLEAR ?auto_11845 ) ( not ( = ?auto_11844 ?auto_11845 ) ) ( not ( = ?auto_11844 ?auto_11856 ) ) ( not ( = ?auto_11845 ?auto_11856 ) ) ( not ( = ?auto_11849 ?auto_11855 ) ) ( IS-CRATE ?auto_11844 ) ( not ( = ?auto_11854 ?auto_11847 ) ) ( HOIST-AT ?auto_11853 ?auto_11854 ) ( AVAILABLE ?auto_11853 ) ( SURFACE-AT ?auto_11844 ?auto_11854 ) ( ON ?auto_11844 ?auto_11859 ) ( CLEAR ?auto_11844 ) ( not ( = ?auto_11843 ?auto_11844 ) ) ( not ( = ?auto_11843 ?auto_11859 ) ) ( not ( = ?auto_11844 ?auto_11859 ) ) ( not ( = ?auto_11849 ?auto_11853 ) ) ( SURFACE-AT ?auto_11842 ?auto_11847 ) ( CLEAR ?auto_11842 ) ( IS-CRATE ?auto_11843 ) ( AVAILABLE ?auto_11849 ) ( AVAILABLE ?auto_11855 ) ( SURFACE-AT ?auto_11843 ?auto_11857 ) ( ON ?auto_11843 ?auto_11858 ) ( CLEAR ?auto_11843 ) ( TRUCK-AT ?auto_11852 ?auto_11847 ) ( not ( = ?auto_11842 ?auto_11843 ) ) ( not ( = ?auto_11842 ?auto_11858 ) ) ( not ( = ?auto_11843 ?auto_11858 ) ) ( not ( = ?auto_11842 ?auto_11844 ) ) ( not ( = ?auto_11842 ?auto_11859 ) ) ( not ( = ?auto_11844 ?auto_11858 ) ) ( not ( = ?auto_11854 ?auto_11857 ) ) ( not ( = ?auto_11853 ?auto_11855 ) ) ( not ( = ?auto_11859 ?auto_11858 ) ) ( not ( = ?auto_11842 ?auto_11845 ) ) ( not ( = ?auto_11842 ?auto_11856 ) ) ( not ( = ?auto_11843 ?auto_11845 ) ) ( not ( = ?auto_11843 ?auto_11856 ) ) ( not ( = ?auto_11845 ?auto_11859 ) ) ( not ( = ?auto_11845 ?auto_11858 ) ) ( not ( = ?auto_11856 ?auto_11859 ) ) ( not ( = ?auto_11856 ?auto_11858 ) ) ( not ( = ?auto_11842 ?auto_11846 ) ) ( not ( = ?auto_11842 ?auto_11851 ) ) ( not ( = ?auto_11843 ?auto_11846 ) ) ( not ( = ?auto_11843 ?auto_11851 ) ) ( not ( = ?auto_11844 ?auto_11846 ) ) ( not ( = ?auto_11844 ?auto_11851 ) ) ( not ( = ?auto_11846 ?auto_11856 ) ) ( not ( = ?auto_11846 ?auto_11859 ) ) ( not ( = ?auto_11846 ?auto_11858 ) ) ( not ( = ?auto_11848 ?auto_11857 ) ) ( not ( = ?auto_11848 ?auto_11854 ) ) ( not ( = ?auto_11850 ?auto_11855 ) ) ( not ( = ?auto_11850 ?auto_11853 ) ) ( not ( = ?auto_11851 ?auto_11856 ) ) ( not ( = ?auto_11851 ?auto_11859 ) ) ( not ( = ?auto_11851 ?auto_11858 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_11842 ?auto_11843 ?auto_11844 ?auto_11845 )
      ( MAKE-1CRATE ?auto_11845 ?auto_11846 )
      ( MAKE-4CRATE-VERIFY ?auto_11842 ?auto_11843 ?auto_11844 ?auto_11845 ?auto_11846 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11862 - SURFACE
      ?auto_11863 - SURFACE
    )
    :vars
    (
      ?auto_11864 - HOIST
      ?auto_11865 - PLACE
      ?auto_11867 - PLACE
      ?auto_11868 - HOIST
      ?auto_11869 - SURFACE
      ?auto_11866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11864 ?auto_11865 ) ( SURFACE-AT ?auto_11862 ?auto_11865 ) ( CLEAR ?auto_11862 ) ( IS-CRATE ?auto_11863 ) ( AVAILABLE ?auto_11864 ) ( not ( = ?auto_11867 ?auto_11865 ) ) ( HOIST-AT ?auto_11868 ?auto_11867 ) ( AVAILABLE ?auto_11868 ) ( SURFACE-AT ?auto_11863 ?auto_11867 ) ( ON ?auto_11863 ?auto_11869 ) ( CLEAR ?auto_11863 ) ( TRUCK-AT ?auto_11866 ?auto_11865 ) ( not ( = ?auto_11862 ?auto_11863 ) ) ( not ( = ?auto_11862 ?auto_11869 ) ) ( not ( = ?auto_11863 ?auto_11869 ) ) ( not ( = ?auto_11864 ?auto_11868 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11866 ?auto_11865 ?auto_11867 )
      ( !LIFT ?auto_11868 ?auto_11863 ?auto_11869 ?auto_11867 )
      ( !LOAD ?auto_11868 ?auto_11863 ?auto_11866 ?auto_11867 )
      ( !DRIVE ?auto_11866 ?auto_11867 ?auto_11865 )
      ( !UNLOAD ?auto_11864 ?auto_11863 ?auto_11866 ?auto_11865 )
      ( !DROP ?auto_11864 ?auto_11863 ?auto_11862 ?auto_11865 )
      ( MAKE-1CRATE-VERIFY ?auto_11862 ?auto_11863 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_11876 - SURFACE
      ?auto_11877 - SURFACE
      ?auto_11878 - SURFACE
      ?auto_11879 - SURFACE
      ?auto_11880 - SURFACE
      ?auto_11881 - SURFACE
    )
    :vars
    (
      ?auto_11886 - HOIST
      ?auto_11884 - PLACE
      ?auto_11885 - PLACE
      ?auto_11882 - HOIST
      ?auto_11883 - SURFACE
      ?auto_11892 - PLACE
      ?auto_11891 - HOIST
      ?auto_11888 - SURFACE
      ?auto_11889 - PLACE
      ?auto_11895 - HOIST
      ?auto_11893 - SURFACE
      ?auto_11894 - PLACE
      ?auto_11890 - HOIST
      ?auto_11897 - SURFACE
      ?auto_11896 - SURFACE
      ?auto_11887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11886 ?auto_11884 ) ( IS-CRATE ?auto_11881 ) ( not ( = ?auto_11885 ?auto_11884 ) ) ( HOIST-AT ?auto_11882 ?auto_11885 ) ( AVAILABLE ?auto_11882 ) ( SURFACE-AT ?auto_11881 ?auto_11885 ) ( ON ?auto_11881 ?auto_11883 ) ( CLEAR ?auto_11881 ) ( not ( = ?auto_11880 ?auto_11881 ) ) ( not ( = ?auto_11880 ?auto_11883 ) ) ( not ( = ?auto_11881 ?auto_11883 ) ) ( not ( = ?auto_11886 ?auto_11882 ) ) ( IS-CRATE ?auto_11880 ) ( not ( = ?auto_11892 ?auto_11884 ) ) ( HOIST-AT ?auto_11891 ?auto_11892 ) ( AVAILABLE ?auto_11891 ) ( SURFACE-AT ?auto_11880 ?auto_11892 ) ( ON ?auto_11880 ?auto_11888 ) ( CLEAR ?auto_11880 ) ( not ( = ?auto_11879 ?auto_11880 ) ) ( not ( = ?auto_11879 ?auto_11888 ) ) ( not ( = ?auto_11880 ?auto_11888 ) ) ( not ( = ?auto_11886 ?auto_11891 ) ) ( IS-CRATE ?auto_11879 ) ( not ( = ?auto_11889 ?auto_11884 ) ) ( HOIST-AT ?auto_11895 ?auto_11889 ) ( SURFACE-AT ?auto_11879 ?auto_11889 ) ( ON ?auto_11879 ?auto_11893 ) ( CLEAR ?auto_11879 ) ( not ( = ?auto_11878 ?auto_11879 ) ) ( not ( = ?auto_11878 ?auto_11893 ) ) ( not ( = ?auto_11879 ?auto_11893 ) ) ( not ( = ?auto_11886 ?auto_11895 ) ) ( IS-CRATE ?auto_11878 ) ( not ( = ?auto_11894 ?auto_11884 ) ) ( HOIST-AT ?auto_11890 ?auto_11894 ) ( AVAILABLE ?auto_11890 ) ( SURFACE-AT ?auto_11878 ?auto_11894 ) ( ON ?auto_11878 ?auto_11897 ) ( CLEAR ?auto_11878 ) ( not ( = ?auto_11877 ?auto_11878 ) ) ( not ( = ?auto_11877 ?auto_11897 ) ) ( not ( = ?auto_11878 ?auto_11897 ) ) ( not ( = ?auto_11886 ?auto_11890 ) ) ( SURFACE-AT ?auto_11876 ?auto_11884 ) ( CLEAR ?auto_11876 ) ( IS-CRATE ?auto_11877 ) ( AVAILABLE ?auto_11886 ) ( AVAILABLE ?auto_11895 ) ( SURFACE-AT ?auto_11877 ?auto_11889 ) ( ON ?auto_11877 ?auto_11896 ) ( CLEAR ?auto_11877 ) ( TRUCK-AT ?auto_11887 ?auto_11884 ) ( not ( = ?auto_11876 ?auto_11877 ) ) ( not ( = ?auto_11876 ?auto_11896 ) ) ( not ( = ?auto_11877 ?auto_11896 ) ) ( not ( = ?auto_11876 ?auto_11878 ) ) ( not ( = ?auto_11876 ?auto_11897 ) ) ( not ( = ?auto_11878 ?auto_11896 ) ) ( not ( = ?auto_11894 ?auto_11889 ) ) ( not ( = ?auto_11890 ?auto_11895 ) ) ( not ( = ?auto_11897 ?auto_11896 ) ) ( not ( = ?auto_11876 ?auto_11879 ) ) ( not ( = ?auto_11876 ?auto_11893 ) ) ( not ( = ?auto_11877 ?auto_11879 ) ) ( not ( = ?auto_11877 ?auto_11893 ) ) ( not ( = ?auto_11879 ?auto_11897 ) ) ( not ( = ?auto_11879 ?auto_11896 ) ) ( not ( = ?auto_11893 ?auto_11897 ) ) ( not ( = ?auto_11893 ?auto_11896 ) ) ( not ( = ?auto_11876 ?auto_11880 ) ) ( not ( = ?auto_11876 ?auto_11888 ) ) ( not ( = ?auto_11877 ?auto_11880 ) ) ( not ( = ?auto_11877 ?auto_11888 ) ) ( not ( = ?auto_11878 ?auto_11880 ) ) ( not ( = ?auto_11878 ?auto_11888 ) ) ( not ( = ?auto_11880 ?auto_11893 ) ) ( not ( = ?auto_11880 ?auto_11897 ) ) ( not ( = ?auto_11880 ?auto_11896 ) ) ( not ( = ?auto_11892 ?auto_11889 ) ) ( not ( = ?auto_11892 ?auto_11894 ) ) ( not ( = ?auto_11891 ?auto_11895 ) ) ( not ( = ?auto_11891 ?auto_11890 ) ) ( not ( = ?auto_11888 ?auto_11893 ) ) ( not ( = ?auto_11888 ?auto_11897 ) ) ( not ( = ?auto_11888 ?auto_11896 ) ) ( not ( = ?auto_11876 ?auto_11881 ) ) ( not ( = ?auto_11876 ?auto_11883 ) ) ( not ( = ?auto_11877 ?auto_11881 ) ) ( not ( = ?auto_11877 ?auto_11883 ) ) ( not ( = ?auto_11878 ?auto_11881 ) ) ( not ( = ?auto_11878 ?auto_11883 ) ) ( not ( = ?auto_11879 ?auto_11881 ) ) ( not ( = ?auto_11879 ?auto_11883 ) ) ( not ( = ?auto_11881 ?auto_11888 ) ) ( not ( = ?auto_11881 ?auto_11893 ) ) ( not ( = ?auto_11881 ?auto_11897 ) ) ( not ( = ?auto_11881 ?auto_11896 ) ) ( not ( = ?auto_11885 ?auto_11892 ) ) ( not ( = ?auto_11885 ?auto_11889 ) ) ( not ( = ?auto_11885 ?auto_11894 ) ) ( not ( = ?auto_11882 ?auto_11891 ) ) ( not ( = ?auto_11882 ?auto_11895 ) ) ( not ( = ?auto_11882 ?auto_11890 ) ) ( not ( = ?auto_11883 ?auto_11888 ) ) ( not ( = ?auto_11883 ?auto_11893 ) ) ( not ( = ?auto_11883 ?auto_11897 ) ) ( not ( = ?auto_11883 ?auto_11896 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_11876 ?auto_11877 ?auto_11878 ?auto_11879 ?auto_11880 )
      ( MAKE-1CRATE ?auto_11880 ?auto_11881 )
      ( MAKE-5CRATE-VERIFY ?auto_11876 ?auto_11877 ?auto_11878 ?auto_11879 ?auto_11880 ?auto_11881 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11900 - SURFACE
      ?auto_11901 - SURFACE
    )
    :vars
    (
      ?auto_11902 - HOIST
      ?auto_11903 - PLACE
      ?auto_11905 - PLACE
      ?auto_11906 - HOIST
      ?auto_11907 - SURFACE
      ?auto_11904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11902 ?auto_11903 ) ( SURFACE-AT ?auto_11900 ?auto_11903 ) ( CLEAR ?auto_11900 ) ( IS-CRATE ?auto_11901 ) ( AVAILABLE ?auto_11902 ) ( not ( = ?auto_11905 ?auto_11903 ) ) ( HOIST-AT ?auto_11906 ?auto_11905 ) ( AVAILABLE ?auto_11906 ) ( SURFACE-AT ?auto_11901 ?auto_11905 ) ( ON ?auto_11901 ?auto_11907 ) ( CLEAR ?auto_11901 ) ( TRUCK-AT ?auto_11904 ?auto_11903 ) ( not ( = ?auto_11900 ?auto_11901 ) ) ( not ( = ?auto_11900 ?auto_11907 ) ) ( not ( = ?auto_11901 ?auto_11907 ) ) ( not ( = ?auto_11902 ?auto_11906 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11904 ?auto_11903 ?auto_11905 )
      ( !LIFT ?auto_11906 ?auto_11901 ?auto_11907 ?auto_11905 )
      ( !LOAD ?auto_11906 ?auto_11901 ?auto_11904 ?auto_11905 )
      ( !DRIVE ?auto_11904 ?auto_11905 ?auto_11903 )
      ( !UNLOAD ?auto_11902 ?auto_11901 ?auto_11904 ?auto_11903 )
      ( !DROP ?auto_11902 ?auto_11901 ?auto_11900 ?auto_11903 )
      ( MAKE-1CRATE-VERIFY ?auto_11900 ?auto_11901 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_11915 - SURFACE
      ?auto_11916 - SURFACE
      ?auto_11917 - SURFACE
      ?auto_11918 - SURFACE
      ?auto_11919 - SURFACE
      ?auto_11921 - SURFACE
      ?auto_11920 - SURFACE
    )
    :vars
    (
      ?auto_11923 - HOIST
      ?auto_11926 - PLACE
      ?auto_11924 - PLACE
      ?auto_11925 - HOIST
      ?auto_11922 - SURFACE
      ?auto_11938 - PLACE
      ?auto_11930 - HOIST
      ?auto_11937 - SURFACE
      ?auto_11934 - PLACE
      ?auto_11936 - HOIST
      ?auto_11929 - SURFACE
      ?auto_11933 - SURFACE
      ?auto_11932 - PLACE
      ?auto_11928 - HOIST
      ?auto_11931 - SURFACE
      ?auto_11935 - SURFACE
      ?auto_11927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11923 ?auto_11926 ) ( IS-CRATE ?auto_11920 ) ( not ( = ?auto_11924 ?auto_11926 ) ) ( HOIST-AT ?auto_11925 ?auto_11924 ) ( SURFACE-AT ?auto_11920 ?auto_11924 ) ( ON ?auto_11920 ?auto_11922 ) ( CLEAR ?auto_11920 ) ( not ( = ?auto_11921 ?auto_11920 ) ) ( not ( = ?auto_11921 ?auto_11922 ) ) ( not ( = ?auto_11920 ?auto_11922 ) ) ( not ( = ?auto_11923 ?auto_11925 ) ) ( IS-CRATE ?auto_11921 ) ( not ( = ?auto_11938 ?auto_11926 ) ) ( HOIST-AT ?auto_11930 ?auto_11938 ) ( AVAILABLE ?auto_11930 ) ( SURFACE-AT ?auto_11921 ?auto_11938 ) ( ON ?auto_11921 ?auto_11937 ) ( CLEAR ?auto_11921 ) ( not ( = ?auto_11919 ?auto_11921 ) ) ( not ( = ?auto_11919 ?auto_11937 ) ) ( not ( = ?auto_11921 ?auto_11937 ) ) ( not ( = ?auto_11923 ?auto_11930 ) ) ( IS-CRATE ?auto_11919 ) ( not ( = ?auto_11934 ?auto_11926 ) ) ( HOIST-AT ?auto_11936 ?auto_11934 ) ( AVAILABLE ?auto_11936 ) ( SURFACE-AT ?auto_11919 ?auto_11934 ) ( ON ?auto_11919 ?auto_11929 ) ( CLEAR ?auto_11919 ) ( not ( = ?auto_11918 ?auto_11919 ) ) ( not ( = ?auto_11918 ?auto_11929 ) ) ( not ( = ?auto_11919 ?auto_11929 ) ) ( not ( = ?auto_11923 ?auto_11936 ) ) ( IS-CRATE ?auto_11918 ) ( SURFACE-AT ?auto_11918 ?auto_11924 ) ( ON ?auto_11918 ?auto_11933 ) ( CLEAR ?auto_11918 ) ( not ( = ?auto_11917 ?auto_11918 ) ) ( not ( = ?auto_11917 ?auto_11933 ) ) ( not ( = ?auto_11918 ?auto_11933 ) ) ( IS-CRATE ?auto_11917 ) ( not ( = ?auto_11932 ?auto_11926 ) ) ( HOIST-AT ?auto_11928 ?auto_11932 ) ( AVAILABLE ?auto_11928 ) ( SURFACE-AT ?auto_11917 ?auto_11932 ) ( ON ?auto_11917 ?auto_11931 ) ( CLEAR ?auto_11917 ) ( not ( = ?auto_11916 ?auto_11917 ) ) ( not ( = ?auto_11916 ?auto_11931 ) ) ( not ( = ?auto_11917 ?auto_11931 ) ) ( not ( = ?auto_11923 ?auto_11928 ) ) ( SURFACE-AT ?auto_11915 ?auto_11926 ) ( CLEAR ?auto_11915 ) ( IS-CRATE ?auto_11916 ) ( AVAILABLE ?auto_11923 ) ( AVAILABLE ?auto_11925 ) ( SURFACE-AT ?auto_11916 ?auto_11924 ) ( ON ?auto_11916 ?auto_11935 ) ( CLEAR ?auto_11916 ) ( TRUCK-AT ?auto_11927 ?auto_11926 ) ( not ( = ?auto_11915 ?auto_11916 ) ) ( not ( = ?auto_11915 ?auto_11935 ) ) ( not ( = ?auto_11916 ?auto_11935 ) ) ( not ( = ?auto_11915 ?auto_11917 ) ) ( not ( = ?auto_11915 ?auto_11931 ) ) ( not ( = ?auto_11917 ?auto_11935 ) ) ( not ( = ?auto_11932 ?auto_11924 ) ) ( not ( = ?auto_11928 ?auto_11925 ) ) ( not ( = ?auto_11931 ?auto_11935 ) ) ( not ( = ?auto_11915 ?auto_11918 ) ) ( not ( = ?auto_11915 ?auto_11933 ) ) ( not ( = ?auto_11916 ?auto_11918 ) ) ( not ( = ?auto_11916 ?auto_11933 ) ) ( not ( = ?auto_11918 ?auto_11931 ) ) ( not ( = ?auto_11918 ?auto_11935 ) ) ( not ( = ?auto_11933 ?auto_11931 ) ) ( not ( = ?auto_11933 ?auto_11935 ) ) ( not ( = ?auto_11915 ?auto_11919 ) ) ( not ( = ?auto_11915 ?auto_11929 ) ) ( not ( = ?auto_11916 ?auto_11919 ) ) ( not ( = ?auto_11916 ?auto_11929 ) ) ( not ( = ?auto_11917 ?auto_11919 ) ) ( not ( = ?auto_11917 ?auto_11929 ) ) ( not ( = ?auto_11919 ?auto_11933 ) ) ( not ( = ?auto_11919 ?auto_11931 ) ) ( not ( = ?auto_11919 ?auto_11935 ) ) ( not ( = ?auto_11934 ?auto_11924 ) ) ( not ( = ?auto_11934 ?auto_11932 ) ) ( not ( = ?auto_11936 ?auto_11925 ) ) ( not ( = ?auto_11936 ?auto_11928 ) ) ( not ( = ?auto_11929 ?auto_11933 ) ) ( not ( = ?auto_11929 ?auto_11931 ) ) ( not ( = ?auto_11929 ?auto_11935 ) ) ( not ( = ?auto_11915 ?auto_11921 ) ) ( not ( = ?auto_11915 ?auto_11937 ) ) ( not ( = ?auto_11916 ?auto_11921 ) ) ( not ( = ?auto_11916 ?auto_11937 ) ) ( not ( = ?auto_11917 ?auto_11921 ) ) ( not ( = ?auto_11917 ?auto_11937 ) ) ( not ( = ?auto_11918 ?auto_11921 ) ) ( not ( = ?auto_11918 ?auto_11937 ) ) ( not ( = ?auto_11921 ?auto_11929 ) ) ( not ( = ?auto_11921 ?auto_11933 ) ) ( not ( = ?auto_11921 ?auto_11931 ) ) ( not ( = ?auto_11921 ?auto_11935 ) ) ( not ( = ?auto_11938 ?auto_11934 ) ) ( not ( = ?auto_11938 ?auto_11924 ) ) ( not ( = ?auto_11938 ?auto_11932 ) ) ( not ( = ?auto_11930 ?auto_11936 ) ) ( not ( = ?auto_11930 ?auto_11925 ) ) ( not ( = ?auto_11930 ?auto_11928 ) ) ( not ( = ?auto_11937 ?auto_11929 ) ) ( not ( = ?auto_11937 ?auto_11933 ) ) ( not ( = ?auto_11937 ?auto_11931 ) ) ( not ( = ?auto_11937 ?auto_11935 ) ) ( not ( = ?auto_11915 ?auto_11920 ) ) ( not ( = ?auto_11915 ?auto_11922 ) ) ( not ( = ?auto_11916 ?auto_11920 ) ) ( not ( = ?auto_11916 ?auto_11922 ) ) ( not ( = ?auto_11917 ?auto_11920 ) ) ( not ( = ?auto_11917 ?auto_11922 ) ) ( not ( = ?auto_11918 ?auto_11920 ) ) ( not ( = ?auto_11918 ?auto_11922 ) ) ( not ( = ?auto_11919 ?auto_11920 ) ) ( not ( = ?auto_11919 ?auto_11922 ) ) ( not ( = ?auto_11920 ?auto_11937 ) ) ( not ( = ?auto_11920 ?auto_11929 ) ) ( not ( = ?auto_11920 ?auto_11933 ) ) ( not ( = ?auto_11920 ?auto_11931 ) ) ( not ( = ?auto_11920 ?auto_11935 ) ) ( not ( = ?auto_11922 ?auto_11937 ) ) ( not ( = ?auto_11922 ?auto_11929 ) ) ( not ( = ?auto_11922 ?auto_11933 ) ) ( not ( = ?auto_11922 ?auto_11931 ) ) ( not ( = ?auto_11922 ?auto_11935 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_11915 ?auto_11916 ?auto_11917 ?auto_11918 ?auto_11919 ?auto_11921 )
      ( MAKE-1CRATE ?auto_11921 ?auto_11920 )
      ( MAKE-6CRATE-VERIFY ?auto_11915 ?auto_11916 ?auto_11917 ?auto_11918 ?auto_11919 ?auto_11921 ?auto_11920 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11941 - SURFACE
      ?auto_11942 - SURFACE
    )
    :vars
    (
      ?auto_11943 - HOIST
      ?auto_11944 - PLACE
      ?auto_11946 - PLACE
      ?auto_11947 - HOIST
      ?auto_11948 - SURFACE
      ?auto_11945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11943 ?auto_11944 ) ( SURFACE-AT ?auto_11941 ?auto_11944 ) ( CLEAR ?auto_11941 ) ( IS-CRATE ?auto_11942 ) ( AVAILABLE ?auto_11943 ) ( not ( = ?auto_11946 ?auto_11944 ) ) ( HOIST-AT ?auto_11947 ?auto_11946 ) ( AVAILABLE ?auto_11947 ) ( SURFACE-AT ?auto_11942 ?auto_11946 ) ( ON ?auto_11942 ?auto_11948 ) ( CLEAR ?auto_11942 ) ( TRUCK-AT ?auto_11945 ?auto_11944 ) ( not ( = ?auto_11941 ?auto_11942 ) ) ( not ( = ?auto_11941 ?auto_11948 ) ) ( not ( = ?auto_11942 ?auto_11948 ) ) ( not ( = ?auto_11943 ?auto_11947 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11945 ?auto_11944 ?auto_11946 )
      ( !LIFT ?auto_11947 ?auto_11942 ?auto_11948 ?auto_11946 )
      ( !LOAD ?auto_11947 ?auto_11942 ?auto_11945 ?auto_11946 )
      ( !DRIVE ?auto_11945 ?auto_11946 ?auto_11944 )
      ( !UNLOAD ?auto_11943 ?auto_11942 ?auto_11945 ?auto_11944 )
      ( !DROP ?auto_11943 ?auto_11942 ?auto_11941 ?auto_11944 )
      ( MAKE-1CRATE-VERIFY ?auto_11941 ?auto_11942 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_11957 - SURFACE
      ?auto_11958 - SURFACE
      ?auto_11959 - SURFACE
      ?auto_11960 - SURFACE
      ?auto_11961 - SURFACE
      ?auto_11963 - SURFACE
      ?auto_11962 - SURFACE
      ?auto_11964 - SURFACE
    )
    :vars
    (
      ?auto_11969 - HOIST
      ?auto_11967 - PLACE
      ?auto_11966 - PLACE
      ?auto_11968 - HOIST
      ?auto_11970 - SURFACE
      ?auto_11973 - PLACE
      ?auto_11974 - HOIST
      ?auto_11980 - SURFACE
      ?auto_11972 - PLACE
      ?auto_11979 - HOIST
      ?auto_11975 - SURFACE
      ?auto_11977 - PLACE
      ?auto_11984 - HOIST
      ?auto_11981 - SURFACE
      ?auto_11978 - SURFACE
      ?auto_11971 - PLACE
      ?auto_11983 - HOIST
      ?auto_11982 - SURFACE
      ?auto_11976 - SURFACE
      ?auto_11965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11969 ?auto_11967 ) ( IS-CRATE ?auto_11964 ) ( not ( = ?auto_11966 ?auto_11967 ) ) ( HOIST-AT ?auto_11968 ?auto_11966 ) ( AVAILABLE ?auto_11968 ) ( SURFACE-AT ?auto_11964 ?auto_11966 ) ( ON ?auto_11964 ?auto_11970 ) ( CLEAR ?auto_11964 ) ( not ( = ?auto_11962 ?auto_11964 ) ) ( not ( = ?auto_11962 ?auto_11970 ) ) ( not ( = ?auto_11964 ?auto_11970 ) ) ( not ( = ?auto_11969 ?auto_11968 ) ) ( IS-CRATE ?auto_11962 ) ( not ( = ?auto_11973 ?auto_11967 ) ) ( HOIST-AT ?auto_11974 ?auto_11973 ) ( SURFACE-AT ?auto_11962 ?auto_11973 ) ( ON ?auto_11962 ?auto_11980 ) ( CLEAR ?auto_11962 ) ( not ( = ?auto_11963 ?auto_11962 ) ) ( not ( = ?auto_11963 ?auto_11980 ) ) ( not ( = ?auto_11962 ?auto_11980 ) ) ( not ( = ?auto_11969 ?auto_11974 ) ) ( IS-CRATE ?auto_11963 ) ( not ( = ?auto_11972 ?auto_11967 ) ) ( HOIST-AT ?auto_11979 ?auto_11972 ) ( AVAILABLE ?auto_11979 ) ( SURFACE-AT ?auto_11963 ?auto_11972 ) ( ON ?auto_11963 ?auto_11975 ) ( CLEAR ?auto_11963 ) ( not ( = ?auto_11961 ?auto_11963 ) ) ( not ( = ?auto_11961 ?auto_11975 ) ) ( not ( = ?auto_11963 ?auto_11975 ) ) ( not ( = ?auto_11969 ?auto_11979 ) ) ( IS-CRATE ?auto_11961 ) ( not ( = ?auto_11977 ?auto_11967 ) ) ( HOIST-AT ?auto_11984 ?auto_11977 ) ( AVAILABLE ?auto_11984 ) ( SURFACE-AT ?auto_11961 ?auto_11977 ) ( ON ?auto_11961 ?auto_11981 ) ( CLEAR ?auto_11961 ) ( not ( = ?auto_11960 ?auto_11961 ) ) ( not ( = ?auto_11960 ?auto_11981 ) ) ( not ( = ?auto_11961 ?auto_11981 ) ) ( not ( = ?auto_11969 ?auto_11984 ) ) ( IS-CRATE ?auto_11960 ) ( SURFACE-AT ?auto_11960 ?auto_11973 ) ( ON ?auto_11960 ?auto_11978 ) ( CLEAR ?auto_11960 ) ( not ( = ?auto_11959 ?auto_11960 ) ) ( not ( = ?auto_11959 ?auto_11978 ) ) ( not ( = ?auto_11960 ?auto_11978 ) ) ( IS-CRATE ?auto_11959 ) ( not ( = ?auto_11971 ?auto_11967 ) ) ( HOIST-AT ?auto_11983 ?auto_11971 ) ( AVAILABLE ?auto_11983 ) ( SURFACE-AT ?auto_11959 ?auto_11971 ) ( ON ?auto_11959 ?auto_11982 ) ( CLEAR ?auto_11959 ) ( not ( = ?auto_11958 ?auto_11959 ) ) ( not ( = ?auto_11958 ?auto_11982 ) ) ( not ( = ?auto_11959 ?auto_11982 ) ) ( not ( = ?auto_11969 ?auto_11983 ) ) ( SURFACE-AT ?auto_11957 ?auto_11967 ) ( CLEAR ?auto_11957 ) ( IS-CRATE ?auto_11958 ) ( AVAILABLE ?auto_11969 ) ( AVAILABLE ?auto_11974 ) ( SURFACE-AT ?auto_11958 ?auto_11973 ) ( ON ?auto_11958 ?auto_11976 ) ( CLEAR ?auto_11958 ) ( TRUCK-AT ?auto_11965 ?auto_11967 ) ( not ( = ?auto_11957 ?auto_11958 ) ) ( not ( = ?auto_11957 ?auto_11976 ) ) ( not ( = ?auto_11958 ?auto_11976 ) ) ( not ( = ?auto_11957 ?auto_11959 ) ) ( not ( = ?auto_11957 ?auto_11982 ) ) ( not ( = ?auto_11959 ?auto_11976 ) ) ( not ( = ?auto_11971 ?auto_11973 ) ) ( not ( = ?auto_11983 ?auto_11974 ) ) ( not ( = ?auto_11982 ?auto_11976 ) ) ( not ( = ?auto_11957 ?auto_11960 ) ) ( not ( = ?auto_11957 ?auto_11978 ) ) ( not ( = ?auto_11958 ?auto_11960 ) ) ( not ( = ?auto_11958 ?auto_11978 ) ) ( not ( = ?auto_11960 ?auto_11982 ) ) ( not ( = ?auto_11960 ?auto_11976 ) ) ( not ( = ?auto_11978 ?auto_11982 ) ) ( not ( = ?auto_11978 ?auto_11976 ) ) ( not ( = ?auto_11957 ?auto_11961 ) ) ( not ( = ?auto_11957 ?auto_11981 ) ) ( not ( = ?auto_11958 ?auto_11961 ) ) ( not ( = ?auto_11958 ?auto_11981 ) ) ( not ( = ?auto_11959 ?auto_11961 ) ) ( not ( = ?auto_11959 ?auto_11981 ) ) ( not ( = ?auto_11961 ?auto_11978 ) ) ( not ( = ?auto_11961 ?auto_11982 ) ) ( not ( = ?auto_11961 ?auto_11976 ) ) ( not ( = ?auto_11977 ?auto_11973 ) ) ( not ( = ?auto_11977 ?auto_11971 ) ) ( not ( = ?auto_11984 ?auto_11974 ) ) ( not ( = ?auto_11984 ?auto_11983 ) ) ( not ( = ?auto_11981 ?auto_11978 ) ) ( not ( = ?auto_11981 ?auto_11982 ) ) ( not ( = ?auto_11981 ?auto_11976 ) ) ( not ( = ?auto_11957 ?auto_11963 ) ) ( not ( = ?auto_11957 ?auto_11975 ) ) ( not ( = ?auto_11958 ?auto_11963 ) ) ( not ( = ?auto_11958 ?auto_11975 ) ) ( not ( = ?auto_11959 ?auto_11963 ) ) ( not ( = ?auto_11959 ?auto_11975 ) ) ( not ( = ?auto_11960 ?auto_11963 ) ) ( not ( = ?auto_11960 ?auto_11975 ) ) ( not ( = ?auto_11963 ?auto_11981 ) ) ( not ( = ?auto_11963 ?auto_11978 ) ) ( not ( = ?auto_11963 ?auto_11982 ) ) ( not ( = ?auto_11963 ?auto_11976 ) ) ( not ( = ?auto_11972 ?auto_11977 ) ) ( not ( = ?auto_11972 ?auto_11973 ) ) ( not ( = ?auto_11972 ?auto_11971 ) ) ( not ( = ?auto_11979 ?auto_11984 ) ) ( not ( = ?auto_11979 ?auto_11974 ) ) ( not ( = ?auto_11979 ?auto_11983 ) ) ( not ( = ?auto_11975 ?auto_11981 ) ) ( not ( = ?auto_11975 ?auto_11978 ) ) ( not ( = ?auto_11975 ?auto_11982 ) ) ( not ( = ?auto_11975 ?auto_11976 ) ) ( not ( = ?auto_11957 ?auto_11962 ) ) ( not ( = ?auto_11957 ?auto_11980 ) ) ( not ( = ?auto_11958 ?auto_11962 ) ) ( not ( = ?auto_11958 ?auto_11980 ) ) ( not ( = ?auto_11959 ?auto_11962 ) ) ( not ( = ?auto_11959 ?auto_11980 ) ) ( not ( = ?auto_11960 ?auto_11962 ) ) ( not ( = ?auto_11960 ?auto_11980 ) ) ( not ( = ?auto_11961 ?auto_11962 ) ) ( not ( = ?auto_11961 ?auto_11980 ) ) ( not ( = ?auto_11962 ?auto_11975 ) ) ( not ( = ?auto_11962 ?auto_11981 ) ) ( not ( = ?auto_11962 ?auto_11978 ) ) ( not ( = ?auto_11962 ?auto_11982 ) ) ( not ( = ?auto_11962 ?auto_11976 ) ) ( not ( = ?auto_11980 ?auto_11975 ) ) ( not ( = ?auto_11980 ?auto_11981 ) ) ( not ( = ?auto_11980 ?auto_11978 ) ) ( not ( = ?auto_11980 ?auto_11982 ) ) ( not ( = ?auto_11980 ?auto_11976 ) ) ( not ( = ?auto_11957 ?auto_11964 ) ) ( not ( = ?auto_11957 ?auto_11970 ) ) ( not ( = ?auto_11958 ?auto_11964 ) ) ( not ( = ?auto_11958 ?auto_11970 ) ) ( not ( = ?auto_11959 ?auto_11964 ) ) ( not ( = ?auto_11959 ?auto_11970 ) ) ( not ( = ?auto_11960 ?auto_11964 ) ) ( not ( = ?auto_11960 ?auto_11970 ) ) ( not ( = ?auto_11961 ?auto_11964 ) ) ( not ( = ?auto_11961 ?auto_11970 ) ) ( not ( = ?auto_11963 ?auto_11964 ) ) ( not ( = ?auto_11963 ?auto_11970 ) ) ( not ( = ?auto_11964 ?auto_11980 ) ) ( not ( = ?auto_11964 ?auto_11975 ) ) ( not ( = ?auto_11964 ?auto_11981 ) ) ( not ( = ?auto_11964 ?auto_11978 ) ) ( not ( = ?auto_11964 ?auto_11982 ) ) ( not ( = ?auto_11964 ?auto_11976 ) ) ( not ( = ?auto_11966 ?auto_11973 ) ) ( not ( = ?auto_11966 ?auto_11972 ) ) ( not ( = ?auto_11966 ?auto_11977 ) ) ( not ( = ?auto_11966 ?auto_11971 ) ) ( not ( = ?auto_11968 ?auto_11974 ) ) ( not ( = ?auto_11968 ?auto_11979 ) ) ( not ( = ?auto_11968 ?auto_11984 ) ) ( not ( = ?auto_11968 ?auto_11983 ) ) ( not ( = ?auto_11970 ?auto_11980 ) ) ( not ( = ?auto_11970 ?auto_11975 ) ) ( not ( = ?auto_11970 ?auto_11981 ) ) ( not ( = ?auto_11970 ?auto_11978 ) ) ( not ( = ?auto_11970 ?auto_11982 ) ) ( not ( = ?auto_11970 ?auto_11976 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_11957 ?auto_11958 ?auto_11959 ?auto_11960 ?auto_11961 ?auto_11963 ?auto_11962 )
      ( MAKE-1CRATE ?auto_11962 ?auto_11964 )
      ( MAKE-7CRATE-VERIFY ?auto_11957 ?auto_11958 ?auto_11959 ?auto_11960 ?auto_11961 ?auto_11963 ?auto_11962 ?auto_11964 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11987 - SURFACE
      ?auto_11988 - SURFACE
    )
    :vars
    (
      ?auto_11989 - HOIST
      ?auto_11990 - PLACE
      ?auto_11992 - PLACE
      ?auto_11993 - HOIST
      ?auto_11994 - SURFACE
      ?auto_11991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11989 ?auto_11990 ) ( SURFACE-AT ?auto_11987 ?auto_11990 ) ( CLEAR ?auto_11987 ) ( IS-CRATE ?auto_11988 ) ( AVAILABLE ?auto_11989 ) ( not ( = ?auto_11992 ?auto_11990 ) ) ( HOIST-AT ?auto_11993 ?auto_11992 ) ( AVAILABLE ?auto_11993 ) ( SURFACE-AT ?auto_11988 ?auto_11992 ) ( ON ?auto_11988 ?auto_11994 ) ( CLEAR ?auto_11988 ) ( TRUCK-AT ?auto_11991 ?auto_11990 ) ( not ( = ?auto_11987 ?auto_11988 ) ) ( not ( = ?auto_11987 ?auto_11994 ) ) ( not ( = ?auto_11988 ?auto_11994 ) ) ( not ( = ?auto_11989 ?auto_11993 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11991 ?auto_11990 ?auto_11992 )
      ( !LIFT ?auto_11993 ?auto_11988 ?auto_11994 ?auto_11992 )
      ( !LOAD ?auto_11993 ?auto_11988 ?auto_11991 ?auto_11992 )
      ( !DRIVE ?auto_11991 ?auto_11992 ?auto_11990 )
      ( !UNLOAD ?auto_11989 ?auto_11988 ?auto_11991 ?auto_11990 )
      ( !DROP ?auto_11989 ?auto_11988 ?auto_11987 ?auto_11990 )
      ( MAKE-1CRATE-VERIFY ?auto_11987 ?auto_11988 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_12004 - SURFACE
      ?auto_12005 - SURFACE
      ?auto_12006 - SURFACE
      ?auto_12007 - SURFACE
      ?auto_12008 - SURFACE
      ?auto_12010 - SURFACE
      ?auto_12009 - SURFACE
      ?auto_12012 - SURFACE
      ?auto_12011 - SURFACE
    )
    :vars
    (
      ?auto_12018 - HOIST
      ?auto_12013 - PLACE
      ?auto_12017 - PLACE
      ?auto_12016 - HOIST
      ?auto_12014 - SURFACE
      ?auto_12034 - PLACE
      ?auto_12035 - HOIST
      ?auto_12019 - SURFACE
      ?auto_12022 - PLACE
      ?auto_12020 - HOIST
      ?auto_12026 - SURFACE
      ?auto_12021 - PLACE
      ?auto_12024 - HOIST
      ?auto_12033 - SURFACE
      ?auto_12031 - PLACE
      ?auto_12029 - HOIST
      ?auto_12025 - SURFACE
      ?auto_12030 - SURFACE
      ?auto_12023 - PLACE
      ?auto_12028 - HOIST
      ?auto_12027 - SURFACE
      ?auto_12032 - SURFACE
      ?auto_12015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12018 ?auto_12013 ) ( IS-CRATE ?auto_12011 ) ( not ( = ?auto_12017 ?auto_12013 ) ) ( HOIST-AT ?auto_12016 ?auto_12017 ) ( AVAILABLE ?auto_12016 ) ( SURFACE-AT ?auto_12011 ?auto_12017 ) ( ON ?auto_12011 ?auto_12014 ) ( CLEAR ?auto_12011 ) ( not ( = ?auto_12012 ?auto_12011 ) ) ( not ( = ?auto_12012 ?auto_12014 ) ) ( not ( = ?auto_12011 ?auto_12014 ) ) ( not ( = ?auto_12018 ?auto_12016 ) ) ( IS-CRATE ?auto_12012 ) ( not ( = ?auto_12034 ?auto_12013 ) ) ( HOIST-AT ?auto_12035 ?auto_12034 ) ( AVAILABLE ?auto_12035 ) ( SURFACE-AT ?auto_12012 ?auto_12034 ) ( ON ?auto_12012 ?auto_12019 ) ( CLEAR ?auto_12012 ) ( not ( = ?auto_12009 ?auto_12012 ) ) ( not ( = ?auto_12009 ?auto_12019 ) ) ( not ( = ?auto_12012 ?auto_12019 ) ) ( not ( = ?auto_12018 ?auto_12035 ) ) ( IS-CRATE ?auto_12009 ) ( not ( = ?auto_12022 ?auto_12013 ) ) ( HOIST-AT ?auto_12020 ?auto_12022 ) ( SURFACE-AT ?auto_12009 ?auto_12022 ) ( ON ?auto_12009 ?auto_12026 ) ( CLEAR ?auto_12009 ) ( not ( = ?auto_12010 ?auto_12009 ) ) ( not ( = ?auto_12010 ?auto_12026 ) ) ( not ( = ?auto_12009 ?auto_12026 ) ) ( not ( = ?auto_12018 ?auto_12020 ) ) ( IS-CRATE ?auto_12010 ) ( not ( = ?auto_12021 ?auto_12013 ) ) ( HOIST-AT ?auto_12024 ?auto_12021 ) ( AVAILABLE ?auto_12024 ) ( SURFACE-AT ?auto_12010 ?auto_12021 ) ( ON ?auto_12010 ?auto_12033 ) ( CLEAR ?auto_12010 ) ( not ( = ?auto_12008 ?auto_12010 ) ) ( not ( = ?auto_12008 ?auto_12033 ) ) ( not ( = ?auto_12010 ?auto_12033 ) ) ( not ( = ?auto_12018 ?auto_12024 ) ) ( IS-CRATE ?auto_12008 ) ( not ( = ?auto_12031 ?auto_12013 ) ) ( HOIST-AT ?auto_12029 ?auto_12031 ) ( AVAILABLE ?auto_12029 ) ( SURFACE-AT ?auto_12008 ?auto_12031 ) ( ON ?auto_12008 ?auto_12025 ) ( CLEAR ?auto_12008 ) ( not ( = ?auto_12007 ?auto_12008 ) ) ( not ( = ?auto_12007 ?auto_12025 ) ) ( not ( = ?auto_12008 ?auto_12025 ) ) ( not ( = ?auto_12018 ?auto_12029 ) ) ( IS-CRATE ?auto_12007 ) ( SURFACE-AT ?auto_12007 ?auto_12022 ) ( ON ?auto_12007 ?auto_12030 ) ( CLEAR ?auto_12007 ) ( not ( = ?auto_12006 ?auto_12007 ) ) ( not ( = ?auto_12006 ?auto_12030 ) ) ( not ( = ?auto_12007 ?auto_12030 ) ) ( IS-CRATE ?auto_12006 ) ( not ( = ?auto_12023 ?auto_12013 ) ) ( HOIST-AT ?auto_12028 ?auto_12023 ) ( AVAILABLE ?auto_12028 ) ( SURFACE-AT ?auto_12006 ?auto_12023 ) ( ON ?auto_12006 ?auto_12027 ) ( CLEAR ?auto_12006 ) ( not ( = ?auto_12005 ?auto_12006 ) ) ( not ( = ?auto_12005 ?auto_12027 ) ) ( not ( = ?auto_12006 ?auto_12027 ) ) ( not ( = ?auto_12018 ?auto_12028 ) ) ( SURFACE-AT ?auto_12004 ?auto_12013 ) ( CLEAR ?auto_12004 ) ( IS-CRATE ?auto_12005 ) ( AVAILABLE ?auto_12018 ) ( AVAILABLE ?auto_12020 ) ( SURFACE-AT ?auto_12005 ?auto_12022 ) ( ON ?auto_12005 ?auto_12032 ) ( CLEAR ?auto_12005 ) ( TRUCK-AT ?auto_12015 ?auto_12013 ) ( not ( = ?auto_12004 ?auto_12005 ) ) ( not ( = ?auto_12004 ?auto_12032 ) ) ( not ( = ?auto_12005 ?auto_12032 ) ) ( not ( = ?auto_12004 ?auto_12006 ) ) ( not ( = ?auto_12004 ?auto_12027 ) ) ( not ( = ?auto_12006 ?auto_12032 ) ) ( not ( = ?auto_12023 ?auto_12022 ) ) ( not ( = ?auto_12028 ?auto_12020 ) ) ( not ( = ?auto_12027 ?auto_12032 ) ) ( not ( = ?auto_12004 ?auto_12007 ) ) ( not ( = ?auto_12004 ?auto_12030 ) ) ( not ( = ?auto_12005 ?auto_12007 ) ) ( not ( = ?auto_12005 ?auto_12030 ) ) ( not ( = ?auto_12007 ?auto_12027 ) ) ( not ( = ?auto_12007 ?auto_12032 ) ) ( not ( = ?auto_12030 ?auto_12027 ) ) ( not ( = ?auto_12030 ?auto_12032 ) ) ( not ( = ?auto_12004 ?auto_12008 ) ) ( not ( = ?auto_12004 ?auto_12025 ) ) ( not ( = ?auto_12005 ?auto_12008 ) ) ( not ( = ?auto_12005 ?auto_12025 ) ) ( not ( = ?auto_12006 ?auto_12008 ) ) ( not ( = ?auto_12006 ?auto_12025 ) ) ( not ( = ?auto_12008 ?auto_12030 ) ) ( not ( = ?auto_12008 ?auto_12027 ) ) ( not ( = ?auto_12008 ?auto_12032 ) ) ( not ( = ?auto_12031 ?auto_12022 ) ) ( not ( = ?auto_12031 ?auto_12023 ) ) ( not ( = ?auto_12029 ?auto_12020 ) ) ( not ( = ?auto_12029 ?auto_12028 ) ) ( not ( = ?auto_12025 ?auto_12030 ) ) ( not ( = ?auto_12025 ?auto_12027 ) ) ( not ( = ?auto_12025 ?auto_12032 ) ) ( not ( = ?auto_12004 ?auto_12010 ) ) ( not ( = ?auto_12004 ?auto_12033 ) ) ( not ( = ?auto_12005 ?auto_12010 ) ) ( not ( = ?auto_12005 ?auto_12033 ) ) ( not ( = ?auto_12006 ?auto_12010 ) ) ( not ( = ?auto_12006 ?auto_12033 ) ) ( not ( = ?auto_12007 ?auto_12010 ) ) ( not ( = ?auto_12007 ?auto_12033 ) ) ( not ( = ?auto_12010 ?auto_12025 ) ) ( not ( = ?auto_12010 ?auto_12030 ) ) ( not ( = ?auto_12010 ?auto_12027 ) ) ( not ( = ?auto_12010 ?auto_12032 ) ) ( not ( = ?auto_12021 ?auto_12031 ) ) ( not ( = ?auto_12021 ?auto_12022 ) ) ( not ( = ?auto_12021 ?auto_12023 ) ) ( not ( = ?auto_12024 ?auto_12029 ) ) ( not ( = ?auto_12024 ?auto_12020 ) ) ( not ( = ?auto_12024 ?auto_12028 ) ) ( not ( = ?auto_12033 ?auto_12025 ) ) ( not ( = ?auto_12033 ?auto_12030 ) ) ( not ( = ?auto_12033 ?auto_12027 ) ) ( not ( = ?auto_12033 ?auto_12032 ) ) ( not ( = ?auto_12004 ?auto_12009 ) ) ( not ( = ?auto_12004 ?auto_12026 ) ) ( not ( = ?auto_12005 ?auto_12009 ) ) ( not ( = ?auto_12005 ?auto_12026 ) ) ( not ( = ?auto_12006 ?auto_12009 ) ) ( not ( = ?auto_12006 ?auto_12026 ) ) ( not ( = ?auto_12007 ?auto_12009 ) ) ( not ( = ?auto_12007 ?auto_12026 ) ) ( not ( = ?auto_12008 ?auto_12009 ) ) ( not ( = ?auto_12008 ?auto_12026 ) ) ( not ( = ?auto_12009 ?auto_12033 ) ) ( not ( = ?auto_12009 ?auto_12025 ) ) ( not ( = ?auto_12009 ?auto_12030 ) ) ( not ( = ?auto_12009 ?auto_12027 ) ) ( not ( = ?auto_12009 ?auto_12032 ) ) ( not ( = ?auto_12026 ?auto_12033 ) ) ( not ( = ?auto_12026 ?auto_12025 ) ) ( not ( = ?auto_12026 ?auto_12030 ) ) ( not ( = ?auto_12026 ?auto_12027 ) ) ( not ( = ?auto_12026 ?auto_12032 ) ) ( not ( = ?auto_12004 ?auto_12012 ) ) ( not ( = ?auto_12004 ?auto_12019 ) ) ( not ( = ?auto_12005 ?auto_12012 ) ) ( not ( = ?auto_12005 ?auto_12019 ) ) ( not ( = ?auto_12006 ?auto_12012 ) ) ( not ( = ?auto_12006 ?auto_12019 ) ) ( not ( = ?auto_12007 ?auto_12012 ) ) ( not ( = ?auto_12007 ?auto_12019 ) ) ( not ( = ?auto_12008 ?auto_12012 ) ) ( not ( = ?auto_12008 ?auto_12019 ) ) ( not ( = ?auto_12010 ?auto_12012 ) ) ( not ( = ?auto_12010 ?auto_12019 ) ) ( not ( = ?auto_12012 ?auto_12026 ) ) ( not ( = ?auto_12012 ?auto_12033 ) ) ( not ( = ?auto_12012 ?auto_12025 ) ) ( not ( = ?auto_12012 ?auto_12030 ) ) ( not ( = ?auto_12012 ?auto_12027 ) ) ( not ( = ?auto_12012 ?auto_12032 ) ) ( not ( = ?auto_12034 ?auto_12022 ) ) ( not ( = ?auto_12034 ?auto_12021 ) ) ( not ( = ?auto_12034 ?auto_12031 ) ) ( not ( = ?auto_12034 ?auto_12023 ) ) ( not ( = ?auto_12035 ?auto_12020 ) ) ( not ( = ?auto_12035 ?auto_12024 ) ) ( not ( = ?auto_12035 ?auto_12029 ) ) ( not ( = ?auto_12035 ?auto_12028 ) ) ( not ( = ?auto_12019 ?auto_12026 ) ) ( not ( = ?auto_12019 ?auto_12033 ) ) ( not ( = ?auto_12019 ?auto_12025 ) ) ( not ( = ?auto_12019 ?auto_12030 ) ) ( not ( = ?auto_12019 ?auto_12027 ) ) ( not ( = ?auto_12019 ?auto_12032 ) ) ( not ( = ?auto_12004 ?auto_12011 ) ) ( not ( = ?auto_12004 ?auto_12014 ) ) ( not ( = ?auto_12005 ?auto_12011 ) ) ( not ( = ?auto_12005 ?auto_12014 ) ) ( not ( = ?auto_12006 ?auto_12011 ) ) ( not ( = ?auto_12006 ?auto_12014 ) ) ( not ( = ?auto_12007 ?auto_12011 ) ) ( not ( = ?auto_12007 ?auto_12014 ) ) ( not ( = ?auto_12008 ?auto_12011 ) ) ( not ( = ?auto_12008 ?auto_12014 ) ) ( not ( = ?auto_12010 ?auto_12011 ) ) ( not ( = ?auto_12010 ?auto_12014 ) ) ( not ( = ?auto_12009 ?auto_12011 ) ) ( not ( = ?auto_12009 ?auto_12014 ) ) ( not ( = ?auto_12011 ?auto_12019 ) ) ( not ( = ?auto_12011 ?auto_12026 ) ) ( not ( = ?auto_12011 ?auto_12033 ) ) ( not ( = ?auto_12011 ?auto_12025 ) ) ( not ( = ?auto_12011 ?auto_12030 ) ) ( not ( = ?auto_12011 ?auto_12027 ) ) ( not ( = ?auto_12011 ?auto_12032 ) ) ( not ( = ?auto_12017 ?auto_12034 ) ) ( not ( = ?auto_12017 ?auto_12022 ) ) ( not ( = ?auto_12017 ?auto_12021 ) ) ( not ( = ?auto_12017 ?auto_12031 ) ) ( not ( = ?auto_12017 ?auto_12023 ) ) ( not ( = ?auto_12016 ?auto_12035 ) ) ( not ( = ?auto_12016 ?auto_12020 ) ) ( not ( = ?auto_12016 ?auto_12024 ) ) ( not ( = ?auto_12016 ?auto_12029 ) ) ( not ( = ?auto_12016 ?auto_12028 ) ) ( not ( = ?auto_12014 ?auto_12019 ) ) ( not ( = ?auto_12014 ?auto_12026 ) ) ( not ( = ?auto_12014 ?auto_12033 ) ) ( not ( = ?auto_12014 ?auto_12025 ) ) ( not ( = ?auto_12014 ?auto_12030 ) ) ( not ( = ?auto_12014 ?auto_12027 ) ) ( not ( = ?auto_12014 ?auto_12032 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_12004 ?auto_12005 ?auto_12006 ?auto_12007 ?auto_12008 ?auto_12010 ?auto_12009 ?auto_12012 )
      ( MAKE-1CRATE ?auto_12012 ?auto_12011 )
      ( MAKE-8CRATE-VERIFY ?auto_12004 ?auto_12005 ?auto_12006 ?auto_12007 ?auto_12008 ?auto_12010 ?auto_12009 ?auto_12012 ?auto_12011 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12038 - SURFACE
      ?auto_12039 - SURFACE
    )
    :vars
    (
      ?auto_12040 - HOIST
      ?auto_12041 - PLACE
      ?auto_12043 - PLACE
      ?auto_12044 - HOIST
      ?auto_12045 - SURFACE
      ?auto_12042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12040 ?auto_12041 ) ( SURFACE-AT ?auto_12038 ?auto_12041 ) ( CLEAR ?auto_12038 ) ( IS-CRATE ?auto_12039 ) ( AVAILABLE ?auto_12040 ) ( not ( = ?auto_12043 ?auto_12041 ) ) ( HOIST-AT ?auto_12044 ?auto_12043 ) ( AVAILABLE ?auto_12044 ) ( SURFACE-AT ?auto_12039 ?auto_12043 ) ( ON ?auto_12039 ?auto_12045 ) ( CLEAR ?auto_12039 ) ( TRUCK-AT ?auto_12042 ?auto_12041 ) ( not ( = ?auto_12038 ?auto_12039 ) ) ( not ( = ?auto_12038 ?auto_12045 ) ) ( not ( = ?auto_12039 ?auto_12045 ) ) ( not ( = ?auto_12040 ?auto_12044 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12042 ?auto_12041 ?auto_12043 )
      ( !LIFT ?auto_12044 ?auto_12039 ?auto_12045 ?auto_12043 )
      ( !LOAD ?auto_12044 ?auto_12039 ?auto_12042 ?auto_12043 )
      ( !DRIVE ?auto_12042 ?auto_12043 ?auto_12041 )
      ( !UNLOAD ?auto_12040 ?auto_12039 ?auto_12042 ?auto_12041 )
      ( !DROP ?auto_12040 ?auto_12039 ?auto_12038 ?auto_12041 )
      ( MAKE-1CRATE-VERIFY ?auto_12038 ?auto_12039 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_12056 - SURFACE
      ?auto_12057 - SURFACE
      ?auto_12058 - SURFACE
      ?auto_12059 - SURFACE
      ?auto_12060 - SURFACE
      ?auto_12063 - SURFACE
      ?auto_12061 - SURFACE
      ?auto_12065 - SURFACE
      ?auto_12064 - SURFACE
      ?auto_12062 - SURFACE
    )
    :vars
    (
      ?auto_12071 - HOIST
      ?auto_12067 - PLACE
      ?auto_12066 - PLACE
      ?auto_12068 - HOIST
      ?auto_12069 - SURFACE
      ?auto_12072 - PLACE
      ?auto_12077 - HOIST
      ?auto_12091 - SURFACE
      ?auto_12080 - PLACE
      ?auto_12079 - HOIST
      ?auto_12078 - SURFACE
      ?auto_12076 - PLACE
      ?auto_12074 - HOIST
      ?auto_12087 - SURFACE
      ?auto_12075 - PLACE
      ?auto_12089 - HOIST
      ?auto_12073 - SURFACE
      ?auto_12085 - PLACE
      ?auto_12082 - HOIST
      ?auto_12088 - SURFACE
      ?auto_12084 - SURFACE
      ?auto_12090 - PLACE
      ?auto_12083 - HOIST
      ?auto_12081 - SURFACE
      ?auto_12086 - SURFACE
      ?auto_12070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12071 ?auto_12067 ) ( IS-CRATE ?auto_12062 ) ( not ( = ?auto_12066 ?auto_12067 ) ) ( HOIST-AT ?auto_12068 ?auto_12066 ) ( AVAILABLE ?auto_12068 ) ( SURFACE-AT ?auto_12062 ?auto_12066 ) ( ON ?auto_12062 ?auto_12069 ) ( CLEAR ?auto_12062 ) ( not ( = ?auto_12064 ?auto_12062 ) ) ( not ( = ?auto_12064 ?auto_12069 ) ) ( not ( = ?auto_12062 ?auto_12069 ) ) ( not ( = ?auto_12071 ?auto_12068 ) ) ( IS-CRATE ?auto_12064 ) ( not ( = ?auto_12072 ?auto_12067 ) ) ( HOIST-AT ?auto_12077 ?auto_12072 ) ( AVAILABLE ?auto_12077 ) ( SURFACE-AT ?auto_12064 ?auto_12072 ) ( ON ?auto_12064 ?auto_12091 ) ( CLEAR ?auto_12064 ) ( not ( = ?auto_12065 ?auto_12064 ) ) ( not ( = ?auto_12065 ?auto_12091 ) ) ( not ( = ?auto_12064 ?auto_12091 ) ) ( not ( = ?auto_12071 ?auto_12077 ) ) ( IS-CRATE ?auto_12065 ) ( not ( = ?auto_12080 ?auto_12067 ) ) ( HOIST-AT ?auto_12079 ?auto_12080 ) ( AVAILABLE ?auto_12079 ) ( SURFACE-AT ?auto_12065 ?auto_12080 ) ( ON ?auto_12065 ?auto_12078 ) ( CLEAR ?auto_12065 ) ( not ( = ?auto_12061 ?auto_12065 ) ) ( not ( = ?auto_12061 ?auto_12078 ) ) ( not ( = ?auto_12065 ?auto_12078 ) ) ( not ( = ?auto_12071 ?auto_12079 ) ) ( IS-CRATE ?auto_12061 ) ( not ( = ?auto_12076 ?auto_12067 ) ) ( HOIST-AT ?auto_12074 ?auto_12076 ) ( SURFACE-AT ?auto_12061 ?auto_12076 ) ( ON ?auto_12061 ?auto_12087 ) ( CLEAR ?auto_12061 ) ( not ( = ?auto_12063 ?auto_12061 ) ) ( not ( = ?auto_12063 ?auto_12087 ) ) ( not ( = ?auto_12061 ?auto_12087 ) ) ( not ( = ?auto_12071 ?auto_12074 ) ) ( IS-CRATE ?auto_12063 ) ( not ( = ?auto_12075 ?auto_12067 ) ) ( HOIST-AT ?auto_12089 ?auto_12075 ) ( AVAILABLE ?auto_12089 ) ( SURFACE-AT ?auto_12063 ?auto_12075 ) ( ON ?auto_12063 ?auto_12073 ) ( CLEAR ?auto_12063 ) ( not ( = ?auto_12060 ?auto_12063 ) ) ( not ( = ?auto_12060 ?auto_12073 ) ) ( not ( = ?auto_12063 ?auto_12073 ) ) ( not ( = ?auto_12071 ?auto_12089 ) ) ( IS-CRATE ?auto_12060 ) ( not ( = ?auto_12085 ?auto_12067 ) ) ( HOIST-AT ?auto_12082 ?auto_12085 ) ( AVAILABLE ?auto_12082 ) ( SURFACE-AT ?auto_12060 ?auto_12085 ) ( ON ?auto_12060 ?auto_12088 ) ( CLEAR ?auto_12060 ) ( not ( = ?auto_12059 ?auto_12060 ) ) ( not ( = ?auto_12059 ?auto_12088 ) ) ( not ( = ?auto_12060 ?auto_12088 ) ) ( not ( = ?auto_12071 ?auto_12082 ) ) ( IS-CRATE ?auto_12059 ) ( SURFACE-AT ?auto_12059 ?auto_12076 ) ( ON ?auto_12059 ?auto_12084 ) ( CLEAR ?auto_12059 ) ( not ( = ?auto_12058 ?auto_12059 ) ) ( not ( = ?auto_12058 ?auto_12084 ) ) ( not ( = ?auto_12059 ?auto_12084 ) ) ( IS-CRATE ?auto_12058 ) ( not ( = ?auto_12090 ?auto_12067 ) ) ( HOIST-AT ?auto_12083 ?auto_12090 ) ( AVAILABLE ?auto_12083 ) ( SURFACE-AT ?auto_12058 ?auto_12090 ) ( ON ?auto_12058 ?auto_12081 ) ( CLEAR ?auto_12058 ) ( not ( = ?auto_12057 ?auto_12058 ) ) ( not ( = ?auto_12057 ?auto_12081 ) ) ( not ( = ?auto_12058 ?auto_12081 ) ) ( not ( = ?auto_12071 ?auto_12083 ) ) ( SURFACE-AT ?auto_12056 ?auto_12067 ) ( CLEAR ?auto_12056 ) ( IS-CRATE ?auto_12057 ) ( AVAILABLE ?auto_12071 ) ( AVAILABLE ?auto_12074 ) ( SURFACE-AT ?auto_12057 ?auto_12076 ) ( ON ?auto_12057 ?auto_12086 ) ( CLEAR ?auto_12057 ) ( TRUCK-AT ?auto_12070 ?auto_12067 ) ( not ( = ?auto_12056 ?auto_12057 ) ) ( not ( = ?auto_12056 ?auto_12086 ) ) ( not ( = ?auto_12057 ?auto_12086 ) ) ( not ( = ?auto_12056 ?auto_12058 ) ) ( not ( = ?auto_12056 ?auto_12081 ) ) ( not ( = ?auto_12058 ?auto_12086 ) ) ( not ( = ?auto_12090 ?auto_12076 ) ) ( not ( = ?auto_12083 ?auto_12074 ) ) ( not ( = ?auto_12081 ?auto_12086 ) ) ( not ( = ?auto_12056 ?auto_12059 ) ) ( not ( = ?auto_12056 ?auto_12084 ) ) ( not ( = ?auto_12057 ?auto_12059 ) ) ( not ( = ?auto_12057 ?auto_12084 ) ) ( not ( = ?auto_12059 ?auto_12081 ) ) ( not ( = ?auto_12059 ?auto_12086 ) ) ( not ( = ?auto_12084 ?auto_12081 ) ) ( not ( = ?auto_12084 ?auto_12086 ) ) ( not ( = ?auto_12056 ?auto_12060 ) ) ( not ( = ?auto_12056 ?auto_12088 ) ) ( not ( = ?auto_12057 ?auto_12060 ) ) ( not ( = ?auto_12057 ?auto_12088 ) ) ( not ( = ?auto_12058 ?auto_12060 ) ) ( not ( = ?auto_12058 ?auto_12088 ) ) ( not ( = ?auto_12060 ?auto_12084 ) ) ( not ( = ?auto_12060 ?auto_12081 ) ) ( not ( = ?auto_12060 ?auto_12086 ) ) ( not ( = ?auto_12085 ?auto_12076 ) ) ( not ( = ?auto_12085 ?auto_12090 ) ) ( not ( = ?auto_12082 ?auto_12074 ) ) ( not ( = ?auto_12082 ?auto_12083 ) ) ( not ( = ?auto_12088 ?auto_12084 ) ) ( not ( = ?auto_12088 ?auto_12081 ) ) ( not ( = ?auto_12088 ?auto_12086 ) ) ( not ( = ?auto_12056 ?auto_12063 ) ) ( not ( = ?auto_12056 ?auto_12073 ) ) ( not ( = ?auto_12057 ?auto_12063 ) ) ( not ( = ?auto_12057 ?auto_12073 ) ) ( not ( = ?auto_12058 ?auto_12063 ) ) ( not ( = ?auto_12058 ?auto_12073 ) ) ( not ( = ?auto_12059 ?auto_12063 ) ) ( not ( = ?auto_12059 ?auto_12073 ) ) ( not ( = ?auto_12063 ?auto_12088 ) ) ( not ( = ?auto_12063 ?auto_12084 ) ) ( not ( = ?auto_12063 ?auto_12081 ) ) ( not ( = ?auto_12063 ?auto_12086 ) ) ( not ( = ?auto_12075 ?auto_12085 ) ) ( not ( = ?auto_12075 ?auto_12076 ) ) ( not ( = ?auto_12075 ?auto_12090 ) ) ( not ( = ?auto_12089 ?auto_12082 ) ) ( not ( = ?auto_12089 ?auto_12074 ) ) ( not ( = ?auto_12089 ?auto_12083 ) ) ( not ( = ?auto_12073 ?auto_12088 ) ) ( not ( = ?auto_12073 ?auto_12084 ) ) ( not ( = ?auto_12073 ?auto_12081 ) ) ( not ( = ?auto_12073 ?auto_12086 ) ) ( not ( = ?auto_12056 ?auto_12061 ) ) ( not ( = ?auto_12056 ?auto_12087 ) ) ( not ( = ?auto_12057 ?auto_12061 ) ) ( not ( = ?auto_12057 ?auto_12087 ) ) ( not ( = ?auto_12058 ?auto_12061 ) ) ( not ( = ?auto_12058 ?auto_12087 ) ) ( not ( = ?auto_12059 ?auto_12061 ) ) ( not ( = ?auto_12059 ?auto_12087 ) ) ( not ( = ?auto_12060 ?auto_12061 ) ) ( not ( = ?auto_12060 ?auto_12087 ) ) ( not ( = ?auto_12061 ?auto_12073 ) ) ( not ( = ?auto_12061 ?auto_12088 ) ) ( not ( = ?auto_12061 ?auto_12084 ) ) ( not ( = ?auto_12061 ?auto_12081 ) ) ( not ( = ?auto_12061 ?auto_12086 ) ) ( not ( = ?auto_12087 ?auto_12073 ) ) ( not ( = ?auto_12087 ?auto_12088 ) ) ( not ( = ?auto_12087 ?auto_12084 ) ) ( not ( = ?auto_12087 ?auto_12081 ) ) ( not ( = ?auto_12087 ?auto_12086 ) ) ( not ( = ?auto_12056 ?auto_12065 ) ) ( not ( = ?auto_12056 ?auto_12078 ) ) ( not ( = ?auto_12057 ?auto_12065 ) ) ( not ( = ?auto_12057 ?auto_12078 ) ) ( not ( = ?auto_12058 ?auto_12065 ) ) ( not ( = ?auto_12058 ?auto_12078 ) ) ( not ( = ?auto_12059 ?auto_12065 ) ) ( not ( = ?auto_12059 ?auto_12078 ) ) ( not ( = ?auto_12060 ?auto_12065 ) ) ( not ( = ?auto_12060 ?auto_12078 ) ) ( not ( = ?auto_12063 ?auto_12065 ) ) ( not ( = ?auto_12063 ?auto_12078 ) ) ( not ( = ?auto_12065 ?auto_12087 ) ) ( not ( = ?auto_12065 ?auto_12073 ) ) ( not ( = ?auto_12065 ?auto_12088 ) ) ( not ( = ?auto_12065 ?auto_12084 ) ) ( not ( = ?auto_12065 ?auto_12081 ) ) ( not ( = ?auto_12065 ?auto_12086 ) ) ( not ( = ?auto_12080 ?auto_12076 ) ) ( not ( = ?auto_12080 ?auto_12075 ) ) ( not ( = ?auto_12080 ?auto_12085 ) ) ( not ( = ?auto_12080 ?auto_12090 ) ) ( not ( = ?auto_12079 ?auto_12074 ) ) ( not ( = ?auto_12079 ?auto_12089 ) ) ( not ( = ?auto_12079 ?auto_12082 ) ) ( not ( = ?auto_12079 ?auto_12083 ) ) ( not ( = ?auto_12078 ?auto_12087 ) ) ( not ( = ?auto_12078 ?auto_12073 ) ) ( not ( = ?auto_12078 ?auto_12088 ) ) ( not ( = ?auto_12078 ?auto_12084 ) ) ( not ( = ?auto_12078 ?auto_12081 ) ) ( not ( = ?auto_12078 ?auto_12086 ) ) ( not ( = ?auto_12056 ?auto_12064 ) ) ( not ( = ?auto_12056 ?auto_12091 ) ) ( not ( = ?auto_12057 ?auto_12064 ) ) ( not ( = ?auto_12057 ?auto_12091 ) ) ( not ( = ?auto_12058 ?auto_12064 ) ) ( not ( = ?auto_12058 ?auto_12091 ) ) ( not ( = ?auto_12059 ?auto_12064 ) ) ( not ( = ?auto_12059 ?auto_12091 ) ) ( not ( = ?auto_12060 ?auto_12064 ) ) ( not ( = ?auto_12060 ?auto_12091 ) ) ( not ( = ?auto_12063 ?auto_12064 ) ) ( not ( = ?auto_12063 ?auto_12091 ) ) ( not ( = ?auto_12061 ?auto_12064 ) ) ( not ( = ?auto_12061 ?auto_12091 ) ) ( not ( = ?auto_12064 ?auto_12078 ) ) ( not ( = ?auto_12064 ?auto_12087 ) ) ( not ( = ?auto_12064 ?auto_12073 ) ) ( not ( = ?auto_12064 ?auto_12088 ) ) ( not ( = ?auto_12064 ?auto_12084 ) ) ( not ( = ?auto_12064 ?auto_12081 ) ) ( not ( = ?auto_12064 ?auto_12086 ) ) ( not ( = ?auto_12072 ?auto_12080 ) ) ( not ( = ?auto_12072 ?auto_12076 ) ) ( not ( = ?auto_12072 ?auto_12075 ) ) ( not ( = ?auto_12072 ?auto_12085 ) ) ( not ( = ?auto_12072 ?auto_12090 ) ) ( not ( = ?auto_12077 ?auto_12079 ) ) ( not ( = ?auto_12077 ?auto_12074 ) ) ( not ( = ?auto_12077 ?auto_12089 ) ) ( not ( = ?auto_12077 ?auto_12082 ) ) ( not ( = ?auto_12077 ?auto_12083 ) ) ( not ( = ?auto_12091 ?auto_12078 ) ) ( not ( = ?auto_12091 ?auto_12087 ) ) ( not ( = ?auto_12091 ?auto_12073 ) ) ( not ( = ?auto_12091 ?auto_12088 ) ) ( not ( = ?auto_12091 ?auto_12084 ) ) ( not ( = ?auto_12091 ?auto_12081 ) ) ( not ( = ?auto_12091 ?auto_12086 ) ) ( not ( = ?auto_12056 ?auto_12062 ) ) ( not ( = ?auto_12056 ?auto_12069 ) ) ( not ( = ?auto_12057 ?auto_12062 ) ) ( not ( = ?auto_12057 ?auto_12069 ) ) ( not ( = ?auto_12058 ?auto_12062 ) ) ( not ( = ?auto_12058 ?auto_12069 ) ) ( not ( = ?auto_12059 ?auto_12062 ) ) ( not ( = ?auto_12059 ?auto_12069 ) ) ( not ( = ?auto_12060 ?auto_12062 ) ) ( not ( = ?auto_12060 ?auto_12069 ) ) ( not ( = ?auto_12063 ?auto_12062 ) ) ( not ( = ?auto_12063 ?auto_12069 ) ) ( not ( = ?auto_12061 ?auto_12062 ) ) ( not ( = ?auto_12061 ?auto_12069 ) ) ( not ( = ?auto_12065 ?auto_12062 ) ) ( not ( = ?auto_12065 ?auto_12069 ) ) ( not ( = ?auto_12062 ?auto_12091 ) ) ( not ( = ?auto_12062 ?auto_12078 ) ) ( not ( = ?auto_12062 ?auto_12087 ) ) ( not ( = ?auto_12062 ?auto_12073 ) ) ( not ( = ?auto_12062 ?auto_12088 ) ) ( not ( = ?auto_12062 ?auto_12084 ) ) ( not ( = ?auto_12062 ?auto_12081 ) ) ( not ( = ?auto_12062 ?auto_12086 ) ) ( not ( = ?auto_12066 ?auto_12072 ) ) ( not ( = ?auto_12066 ?auto_12080 ) ) ( not ( = ?auto_12066 ?auto_12076 ) ) ( not ( = ?auto_12066 ?auto_12075 ) ) ( not ( = ?auto_12066 ?auto_12085 ) ) ( not ( = ?auto_12066 ?auto_12090 ) ) ( not ( = ?auto_12068 ?auto_12077 ) ) ( not ( = ?auto_12068 ?auto_12079 ) ) ( not ( = ?auto_12068 ?auto_12074 ) ) ( not ( = ?auto_12068 ?auto_12089 ) ) ( not ( = ?auto_12068 ?auto_12082 ) ) ( not ( = ?auto_12068 ?auto_12083 ) ) ( not ( = ?auto_12069 ?auto_12091 ) ) ( not ( = ?auto_12069 ?auto_12078 ) ) ( not ( = ?auto_12069 ?auto_12087 ) ) ( not ( = ?auto_12069 ?auto_12073 ) ) ( not ( = ?auto_12069 ?auto_12088 ) ) ( not ( = ?auto_12069 ?auto_12084 ) ) ( not ( = ?auto_12069 ?auto_12081 ) ) ( not ( = ?auto_12069 ?auto_12086 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_12056 ?auto_12057 ?auto_12058 ?auto_12059 ?auto_12060 ?auto_12063 ?auto_12061 ?auto_12065 ?auto_12064 )
      ( MAKE-1CRATE ?auto_12064 ?auto_12062 )
      ( MAKE-9CRATE-VERIFY ?auto_12056 ?auto_12057 ?auto_12058 ?auto_12059 ?auto_12060 ?auto_12063 ?auto_12061 ?auto_12065 ?auto_12064 ?auto_12062 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12094 - SURFACE
      ?auto_12095 - SURFACE
    )
    :vars
    (
      ?auto_12096 - HOIST
      ?auto_12097 - PLACE
      ?auto_12099 - PLACE
      ?auto_12100 - HOIST
      ?auto_12101 - SURFACE
      ?auto_12098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12096 ?auto_12097 ) ( SURFACE-AT ?auto_12094 ?auto_12097 ) ( CLEAR ?auto_12094 ) ( IS-CRATE ?auto_12095 ) ( AVAILABLE ?auto_12096 ) ( not ( = ?auto_12099 ?auto_12097 ) ) ( HOIST-AT ?auto_12100 ?auto_12099 ) ( AVAILABLE ?auto_12100 ) ( SURFACE-AT ?auto_12095 ?auto_12099 ) ( ON ?auto_12095 ?auto_12101 ) ( CLEAR ?auto_12095 ) ( TRUCK-AT ?auto_12098 ?auto_12097 ) ( not ( = ?auto_12094 ?auto_12095 ) ) ( not ( = ?auto_12094 ?auto_12101 ) ) ( not ( = ?auto_12095 ?auto_12101 ) ) ( not ( = ?auto_12096 ?auto_12100 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12098 ?auto_12097 ?auto_12099 )
      ( !LIFT ?auto_12100 ?auto_12095 ?auto_12101 ?auto_12099 )
      ( !LOAD ?auto_12100 ?auto_12095 ?auto_12098 ?auto_12099 )
      ( !DRIVE ?auto_12098 ?auto_12099 ?auto_12097 )
      ( !UNLOAD ?auto_12096 ?auto_12095 ?auto_12098 ?auto_12097 )
      ( !DROP ?auto_12096 ?auto_12095 ?auto_12094 ?auto_12097 )
      ( MAKE-1CRATE-VERIFY ?auto_12094 ?auto_12095 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_12113 - SURFACE
      ?auto_12114 - SURFACE
      ?auto_12115 - SURFACE
      ?auto_12116 - SURFACE
      ?auto_12117 - SURFACE
      ?auto_12120 - SURFACE
      ?auto_12118 - SURFACE
      ?auto_12122 - SURFACE
      ?auto_12121 - SURFACE
      ?auto_12119 - SURFACE
      ?auto_12123 - SURFACE
    )
    :vars
    (
      ?auto_12124 - HOIST
      ?auto_12125 - PLACE
      ?auto_12127 - PLACE
      ?auto_12129 - HOIST
      ?auto_12128 - SURFACE
      ?auto_12139 - PLACE
      ?auto_12150 - HOIST
      ?auto_12145 - SURFACE
      ?auto_12142 - PLACE
      ?auto_12137 - HOIST
      ?auto_12152 - SURFACE
      ?auto_12140 - PLACE
      ?auto_12135 - HOIST
      ?auto_12136 - SURFACE
      ?auto_12138 - PLACE
      ?auto_12149 - HOIST
      ?auto_12132 - SURFACE
      ?auto_12151 - PLACE
      ?auto_12133 - HOIST
      ?auto_12141 - SURFACE
      ?auto_12134 - PLACE
      ?auto_12146 - HOIST
      ?auto_12130 - SURFACE
      ?auto_12131 - SURFACE
      ?auto_12147 - PLACE
      ?auto_12144 - HOIST
      ?auto_12143 - SURFACE
      ?auto_12148 - SURFACE
      ?auto_12126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12124 ?auto_12125 ) ( IS-CRATE ?auto_12123 ) ( not ( = ?auto_12127 ?auto_12125 ) ) ( HOIST-AT ?auto_12129 ?auto_12127 ) ( AVAILABLE ?auto_12129 ) ( SURFACE-AT ?auto_12123 ?auto_12127 ) ( ON ?auto_12123 ?auto_12128 ) ( CLEAR ?auto_12123 ) ( not ( = ?auto_12119 ?auto_12123 ) ) ( not ( = ?auto_12119 ?auto_12128 ) ) ( not ( = ?auto_12123 ?auto_12128 ) ) ( not ( = ?auto_12124 ?auto_12129 ) ) ( IS-CRATE ?auto_12119 ) ( not ( = ?auto_12139 ?auto_12125 ) ) ( HOIST-AT ?auto_12150 ?auto_12139 ) ( AVAILABLE ?auto_12150 ) ( SURFACE-AT ?auto_12119 ?auto_12139 ) ( ON ?auto_12119 ?auto_12145 ) ( CLEAR ?auto_12119 ) ( not ( = ?auto_12121 ?auto_12119 ) ) ( not ( = ?auto_12121 ?auto_12145 ) ) ( not ( = ?auto_12119 ?auto_12145 ) ) ( not ( = ?auto_12124 ?auto_12150 ) ) ( IS-CRATE ?auto_12121 ) ( not ( = ?auto_12142 ?auto_12125 ) ) ( HOIST-AT ?auto_12137 ?auto_12142 ) ( AVAILABLE ?auto_12137 ) ( SURFACE-AT ?auto_12121 ?auto_12142 ) ( ON ?auto_12121 ?auto_12152 ) ( CLEAR ?auto_12121 ) ( not ( = ?auto_12122 ?auto_12121 ) ) ( not ( = ?auto_12122 ?auto_12152 ) ) ( not ( = ?auto_12121 ?auto_12152 ) ) ( not ( = ?auto_12124 ?auto_12137 ) ) ( IS-CRATE ?auto_12122 ) ( not ( = ?auto_12140 ?auto_12125 ) ) ( HOIST-AT ?auto_12135 ?auto_12140 ) ( AVAILABLE ?auto_12135 ) ( SURFACE-AT ?auto_12122 ?auto_12140 ) ( ON ?auto_12122 ?auto_12136 ) ( CLEAR ?auto_12122 ) ( not ( = ?auto_12118 ?auto_12122 ) ) ( not ( = ?auto_12118 ?auto_12136 ) ) ( not ( = ?auto_12122 ?auto_12136 ) ) ( not ( = ?auto_12124 ?auto_12135 ) ) ( IS-CRATE ?auto_12118 ) ( not ( = ?auto_12138 ?auto_12125 ) ) ( HOIST-AT ?auto_12149 ?auto_12138 ) ( SURFACE-AT ?auto_12118 ?auto_12138 ) ( ON ?auto_12118 ?auto_12132 ) ( CLEAR ?auto_12118 ) ( not ( = ?auto_12120 ?auto_12118 ) ) ( not ( = ?auto_12120 ?auto_12132 ) ) ( not ( = ?auto_12118 ?auto_12132 ) ) ( not ( = ?auto_12124 ?auto_12149 ) ) ( IS-CRATE ?auto_12120 ) ( not ( = ?auto_12151 ?auto_12125 ) ) ( HOIST-AT ?auto_12133 ?auto_12151 ) ( AVAILABLE ?auto_12133 ) ( SURFACE-AT ?auto_12120 ?auto_12151 ) ( ON ?auto_12120 ?auto_12141 ) ( CLEAR ?auto_12120 ) ( not ( = ?auto_12117 ?auto_12120 ) ) ( not ( = ?auto_12117 ?auto_12141 ) ) ( not ( = ?auto_12120 ?auto_12141 ) ) ( not ( = ?auto_12124 ?auto_12133 ) ) ( IS-CRATE ?auto_12117 ) ( not ( = ?auto_12134 ?auto_12125 ) ) ( HOIST-AT ?auto_12146 ?auto_12134 ) ( AVAILABLE ?auto_12146 ) ( SURFACE-AT ?auto_12117 ?auto_12134 ) ( ON ?auto_12117 ?auto_12130 ) ( CLEAR ?auto_12117 ) ( not ( = ?auto_12116 ?auto_12117 ) ) ( not ( = ?auto_12116 ?auto_12130 ) ) ( not ( = ?auto_12117 ?auto_12130 ) ) ( not ( = ?auto_12124 ?auto_12146 ) ) ( IS-CRATE ?auto_12116 ) ( SURFACE-AT ?auto_12116 ?auto_12138 ) ( ON ?auto_12116 ?auto_12131 ) ( CLEAR ?auto_12116 ) ( not ( = ?auto_12115 ?auto_12116 ) ) ( not ( = ?auto_12115 ?auto_12131 ) ) ( not ( = ?auto_12116 ?auto_12131 ) ) ( IS-CRATE ?auto_12115 ) ( not ( = ?auto_12147 ?auto_12125 ) ) ( HOIST-AT ?auto_12144 ?auto_12147 ) ( AVAILABLE ?auto_12144 ) ( SURFACE-AT ?auto_12115 ?auto_12147 ) ( ON ?auto_12115 ?auto_12143 ) ( CLEAR ?auto_12115 ) ( not ( = ?auto_12114 ?auto_12115 ) ) ( not ( = ?auto_12114 ?auto_12143 ) ) ( not ( = ?auto_12115 ?auto_12143 ) ) ( not ( = ?auto_12124 ?auto_12144 ) ) ( SURFACE-AT ?auto_12113 ?auto_12125 ) ( CLEAR ?auto_12113 ) ( IS-CRATE ?auto_12114 ) ( AVAILABLE ?auto_12124 ) ( AVAILABLE ?auto_12149 ) ( SURFACE-AT ?auto_12114 ?auto_12138 ) ( ON ?auto_12114 ?auto_12148 ) ( CLEAR ?auto_12114 ) ( TRUCK-AT ?auto_12126 ?auto_12125 ) ( not ( = ?auto_12113 ?auto_12114 ) ) ( not ( = ?auto_12113 ?auto_12148 ) ) ( not ( = ?auto_12114 ?auto_12148 ) ) ( not ( = ?auto_12113 ?auto_12115 ) ) ( not ( = ?auto_12113 ?auto_12143 ) ) ( not ( = ?auto_12115 ?auto_12148 ) ) ( not ( = ?auto_12147 ?auto_12138 ) ) ( not ( = ?auto_12144 ?auto_12149 ) ) ( not ( = ?auto_12143 ?auto_12148 ) ) ( not ( = ?auto_12113 ?auto_12116 ) ) ( not ( = ?auto_12113 ?auto_12131 ) ) ( not ( = ?auto_12114 ?auto_12116 ) ) ( not ( = ?auto_12114 ?auto_12131 ) ) ( not ( = ?auto_12116 ?auto_12143 ) ) ( not ( = ?auto_12116 ?auto_12148 ) ) ( not ( = ?auto_12131 ?auto_12143 ) ) ( not ( = ?auto_12131 ?auto_12148 ) ) ( not ( = ?auto_12113 ?auto_12117 ) ) ( not ( = ?auto_12113 ?auto_12130 ) ) ( not ( = ?auto_12114 ?auto_12117 ) ) ( not ( = ?auto_12114 ?auto_12130 ) ) ( not ( = ?auto_12115 ?auto_12117 ) ) ( not ( = ?auto_12115 ?auto_12130 ) ) ( not ( = ?auto_12117 ?auto_12131 ) ) ( not ( = ?auto_12117 ?auto_12143 ) ) ( not ( = ?auto_12117 ?auto_12148 ) ) ( not ( = ?auto_12134 ?auto_12138 ) ) ( not ( = ?auto_12134 ?auto_12147 ) ) ( not ( = ?auto_12146 ?auto_12149 ) ) ( not ( = ?auto_12146 ?auto_12144 ) ) ( not ( = ?auto_12130 ?auto_12131 ) ) ( not ( = ?auto_12130 ?auto_12143 ) ) ( not ( = ?auto_12130 ?auto_12148 ) ) ( not ( = ?auto_12113 ?auto_12120 ) ) ( not ( = ?auto_12113 ?auto_12141 ) ) ( not ( = ?auto_12114 ?auto_12120 ) ) ( not ( = ?auto_12114 ?auto_12141 ) ) ( not ( = ?auto_12115 ?auto_12120 ) ) ( not ( = ?auto_12115 ?auto_12141 ) ) ( not ( = ?auto_12116 ?auto_12120 ) ) ( not ( = ?auto_12116 ?auto_12141 ) ) ( not ( = ?auto_12120 ?auto_12130 ) ) ( not ( = ?auto_12120 ?auto_12131 ) ) ( not ( = ?auto_12120 ?auto_12143 ) ) ( not ( = ?auto_12120 ?auto_12148 ) ) ( not ( = ?auto_12151 ?auto_12134 ) ) ( not ( = ?auto_12151 ?auto_12138 ) ) ( not ( = ?auto_12151 ?auto_12147 ) ) ( not ( = ?auto_12133 ?auto_12146 ) ) ( not ( = ?auto_12133 ?auto_12149 ) ) ( not ( = ?auto_12133 ?auto_12144 ) ) ( not ( = ?auto_12141 ?auto_12130 ) ) ( not ( = ?auto_12141 ?auto_12131 ) ) ( not ( = ?auto_12141 ?auto_12143 ) ) ( not ( = ?auto_12141 ?auto_12148 ) ) ( not ( = ?auto_12113 ?auto_12118 ) ) ( not ( = ?auto_12113 ?auto_12132 ) ) ( not ( = ?auto_12114 ?auto_12118 ) ) ( not ( = ?auto_12114 ?auto_12132 ) ) ( not ( = ?auto_12115 ?auto_12118 ) ) ( not ( = ?auto_12115 ?auto_12132 ) ) ( not ( = ?auto_12116 ?auto_12118 ) ) ( not ( = ?auto_12116 ?auto_12132 ) ) ( not ( = ?auto_12117 ?auto_12118 ) ) ( not ( = ?auto_12117 ?auto_12132 ) ) ( not ( = ?auto_12118 ?auto_12141 ) ) ( not ( = ?auto_12118 ?auto_12130 ) ) ( not ( = ?auto_12118 ?auto_12131 ) ) ( not ( = ?auto_12118 ?auto_12143 ) ) ( not ( = ?auto_12118 ?auto_12148 ) ) ( not ( = ?auto_12132 ?auto_12141 ) ) ( not ( = ?auto_12132 ?auto_12130 ) ) ( not ( = ?auto_12132 ?auto_12131 ) ) ( not ( = ?auto_12132 ?auto_12143 ) ) ( not ( = ?auto_12132 ?auto_12148 ) ) ( not ( = ?auto_12113 ?auto_12122 ) ) ( not ( = ?auto_12113 ?auto_12136 ) ) ( not ( = ?auto_12114 ?auto_12122 ) ) ( not ( = ?auto_12114 ?auto_12136 ) ) ( not ( = ?auto_12115 ?auto_12122 ) ) ( not ( = ?auto_12115 ?auto_12136 ) ) ( not ( = ?auto_12116 ?auto_12122 ) ) ( not ( = ?auto_12116 ?auto_12136 ) ) ( not ( = ?auto_12117 ?auto_12122 ) ) ( not ( = ?auto_12117 ?auto_12136 ) ) ( not ( = ?auto_12120 ?auto_12122 ) ) ( not ( = ?auto_12120 ?auto_12136 ) ) ( not ( = ?auto_12122 ?auto_12132 ) ) ( not ( = ?auto_12122 ?auto_12141 ) ) ( not ( = ?auto_12122 ?auto_12130 ) ) ( not ( = ?auto_12122 ?auto_12131 ) ) ( not ( = ?auto_12122 ?auto_12143 ) ) ( not ( = ?auto_12122 ?auto_12148 ) ) ( not ( = ?auto_12140 ?auto_12138 ) ) ( not ( = ?auto_12140 ?auto_12151 ) ) ( not ( = ?auto_12140 ?auto_12134 ) ) ( not ( = ?auto_12140 ?auto_12147 ) ) ( not ( = ?auto_12135 ?auto_12149 ) ) ( not ( = ?auto_12135 ?auto_12133 ) ) ( not ( = ?auto_12135 ?auto_12146 ) ) ( not ( = ?auto_12135 ?auto_12144 ) ) ( not ( = ?auto_12136 ?auto_12132 ) ) ( not ( = ?auto_12136 ?auto_12141 ) ) ( not ( = ?auto_12136 ?auto_12130 ) ) ( not ( = ?auto_12136 ?auto_12131 ) ) ( not ( = ?auto_12136 ?auto_12143 ) ) ( not ( = ?auto_12136 ?auto_12148 ) ) ( not ( = ?auto_12113 ?auto_12121 ) ) ( not ( = ?auto_12113 ?auto_12152 ) ) ( not ( = ?auto_12114 ?auto_12121 ) ) ( not ( = ?auto_12114 ?auto_12152 ) ) ( not ( = ?auto_12115 ?auto_12121 ) ) ( not ( = ?auto_12115 ?auto_12152 ) ) ( not ( = ?auto_12116 ?auto_12121 ) ) ( not ( = ?auto_12116 ?auto_12152 ) ) ( not ( = ?auto_12117 ?auto_12121 ) ) ( not ( = ?auto_12117 ?auto_12152 ) ) ( not ( = ?auto_12120 ?auto_12121 ) ) ( not ( = ?auto_12120 ?auto_12152 ) ) ( not ( = ?auto_12118 ?auto_12121 ) ) ( not ( = ?auto_12118 ?auto_12152 ) ) ( not ( = ?auto_12121 ?auto_12136 ) ) ( not ( = ?auto_12121 ?auto_12132 ) ) ( not ( = ?auto_12121 ?auto_12141 ) ) ( not ( = ?auto_12121 ?auto_12130 ) ) ( not ( = ?auto_12121 ?auto_12131 ) ) ( not ( = ?auto_12121 ?auto_12143 ) ) ( not ( = ?auto_12121 ?auto_12148 ) ) ( not ( = ?auto_12142 ?auto_12140 ) ) ( not ( = ?auto_12142 ?auto_12138 ) ) ( not ( = ?auto_12142 ?auto_12151 ) ) ( not ( = ?auto_12142 ?auto_12134 ) ) ( not ( = ?auto_12142 ?auto_12147 ) ) ( not ( = ?auto_12137 ?auto_12135 ) ) ( not ( = ?auto_12137 ?auto_12149 ) ) ( not ( = ?auto_12137 ?auto_12133 ) ) ( not ( = ?auto_12137 ?auto_12146 ) ) ( not ( = ?auto_12137 ?auto_12144 ) ) ( not ( = ?auto_12152 ?auto_12136 ) ) ( not ( = ?auto_12152 ?auto_12132 ) ) ( not ( = ?auto_12152 ?auto_12141 ) ) ( not ( = ?auto_12152 ?auto_12130 ) ) ( not ( = ?auto_12152 ?auto_12131 ) ) ( not ( = ?auto_12152 ?auto_12143 ) ) ( not ( = ?auto_12152 ?auto_12148 ) ) ( not ( = ?auto_12113 ?auto_12119 ) ) ( not ( = ?auto_12113 ?auto_12145 ) ) ( not ( = ?auto_12114 ?auto_12119 ) ) ( not ( = ?auto_12114 ?auto_12145 ) ) ( not ( = ?auto_12115 ?auto_12119 ) ) ( not ( = ?auto_12115 ?auto_12145 ) ) ( not ( = ?auto_12116 ?auto_12119 ) ) ( not ( = ?auto_12116 ?auto_12145 ) ) ( not ( = ?auto_12117 ?auto_12119 ) ) ( not ( = ?auto_12117 ?auto_12145 ) ) ( not ( = ?auto_12120 ?auto_12119 ) ) ( not ( = ?auto_12120 ?auto_12145 ) ) ( not ( = ?auto_12118 ?auto_12119 ) ) ( not ( = ?auto_12118 ?auto_12145 ) ) ( not ( = ?auto_12122 ?auto_12119 ) ) ( not ( = ?auto_12122 ?auto_12145 ) ) ( not ( = ?auto_12119 ?auto_12152 ) ) ( not ( = ?auto_12119 ?auto_12136 ) ) ( not ( = ?auto_12119 ?auto_12132 ) ) ( not ( = ?auto_12119 ?auto_12141 ) ) ( not ( = ?auto_12119 ?auto_12130 ) ) ( not ( = ?auto_12119 ?auto_12131 ) ) ( not ( = ?auto_12119 ?auto_12143 ) ) ( not ( = ?auto_12119 ?auto_12148 ) ) ( not ( = ?auto_12139 ?auto_12142 ) ) ( not ( = ?auto_12139 ?auto_12140 ) ) ( not ( = ?auto_12139 ?auto_12138 ) ) ( not ( = ?auto_12139 ?auto_12151 ) ) ( not ( = ?auto_12139 ?auto_12134 ) ) ( not ( = ?auto_12139 ?auto_12147 ) ) ( not ( = ?auto_12150 ?auto_12137 ) ) ( not ( = ?auto_12150 ?auto_12135 ) ) ( not ( = ?auto_12150 ?auto_12149 ) ) ( not ( = ?auto_12150 ?auto_12133 ) ) ( not ( = ?auto_12150 ?auto_12146 ) ) ( not ( = ?auto_12150 ?auto_12144 ) ) ( not ( = ?auto_12145 ?auto_12152 ) ) ( not ( = ?auto_12145 ?auto_12136 ) ) ( not ( = ?auto_12145 ?auto_12132 ) ) ( not ( = ?auto_12145 ?auto_12141 ) ) ( not ( = ?auto_12145 ?auto_12130 ) ) ( not ( = ?auto_12145 ?auto_12131 ) ) ( not ( = ?auto_12145 ?auto_12143 ) ) ( not ( = ?auto_12145 ?auto_12148 ) ) ( not ( = ?auto_12113 ?auto_12123 ) ) ( not ( = ?auto_12113 ?auto_12128 ) ) ( not ( = ?auto_12114 ?auto_12123 ) ) ( not ( = ?auto_12114 ?auto_12128 ) ) ( not ( = ?auto_12115 ?auto_12123 ) ) ( not ( = ?auto_12115 ?auto_12128 ) ) ( not ( = ?auto_12116 ?auto_12123 ) ) ( not ( = ?auto_12116 ?auto_12128 ) ) ( not ( = ?auto_12117 ?auto_12123 ) ) ( not ( = ?auto_12117 ?auto_12128 ) ) ( not ( = ?auto_12120 ?auto_12123 ) ) ( not ( = ?auto_12120 ?auto_12128 ) ) ( not ( = ?auto_12118 ?auto_12123 ) ) ( not ( = ?auto_12118 ?auto_12128 ) ) ( not ( = ?auto_12122 ?auto_12123 ) ) ( not ( = ?auto_12122 ?auto_12128 ) ) ( not ( = ?auto_12121 ?auto_12123 ) ) ( not ( = ?auto_12121 ?auto_12128 ) ) ( not ( = ?auto_12123 ?auto_12145 ) ) ( not ( = ?auto_12123 ?auto_12152 ) ) ( not ( = ?auto_12123 ?auto_12136 ) ) ( not ( = ?auto_12123 ?auto_12132 ) ) ( not ( = ?auto_12123 ?auto_12141 ) ) ( not ( = ?auto_12123 ?auto_12130 ) ) ( not ( = ?auto_12123 ?auto_12131 ) ) ( not ( = ?auto_12123 ?auto_12143 ) ) ( not ( = ?auto_12123 ?auto_12148 ) ) ( not ( = ?auto_12127 ?auto_12139 ) ) ( not ( = ?auto_12127 ?auto_12142 ) ) ( not ( = ?auto_12127 ?auto_12140 ) ) ( not ( = ?auto_12127 ?auto_12138 ) ) ( not ( = ?auto_12127 ?auto_12151 ) ) ( not ( = ?auto_12127 ?auto_12134 ) ) ( not ( = ?auto_12127 ?auto_12147 ) ) ( not ( = ?auto_12129 ?auto_12150 ) ) ( not ( = ?auto_12129 ?auto_12137 ) ) ( not ( = ?auto_12129 ?auto_12135 ) ) ( not ( = ?auto_12129 ?auto_12149 ) ) ( not ( = ?auto_12129 ?auto_12133 ) ) ( not ( = ?auto_12129 ?auto_12146 ) ) ( not ( = ?auto_12129 ?auto_12144 ) ) ( not ( = ?auto_12128 ?auto_12145 ) ) ( not ( = ?auto_12128 ?auto_12152 ) ) ( not ( = ?auto_12128 ?auto_12136 ) ) ( not ( = ?auto_12128 ?auto_12132 ) ) ( not ( = ?auto_12128 ?auto_12141 ) ) ( not ( = ?auto_12128 ?auto_12130 ) ) ( not ( = ?auto_12128 ?auto_12131 ) ) ( not ( = ?auto_12128 ?auto_12143 ) ) ( not ( = ?auto_12128 ?auto_12148 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_12113 ?auto_12114 ?auto_12115 ?auto_12116 ?auto_12117 ?auto_12120 ?auto_12118 ?auto_12122 ?auto_12121 ?auto_12119 )
      ( MAKE-1CRATE ?auto_12119 ?auto_12123 )
      ( MAKE-10CRATE-VERIFY ?auto_12113 ?auto_12114 ?auto_12115 ?auto_12116 ?auto_12117 ?auto_12120 ?auto_12118 ?auto_12122 ?auto_12121 ?auto_12119 ?auto_12123 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12155 - SURFACE
      ?auto_12156 - SURFACE
    )
    :vars
    (
      ?auto_12157 - HOIST
      ?auto_12158 - PLACE
      ?auto_12160 - PLACE
      ?auto_12161 - HOIST
      ?auto_12162 - SURFACE
      ?auto_12159 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12157 ?auto_12158 ) ( SURFACE-AT ?auto_12155 ?auto_12158 ) ( CLEAR ?auto_12155 ) ( IS-CRATE ?auto_12156 ) ( AVAILABLE ?auto_12157 ) ( not ( = ?auto_12160 ?auto_12158 ) ) ( HOIST-AT ?auto_12161 ?auto_12160 ) ( AVAILABLE ?auto_12161 ) ( SURFACE-AT ?auto_12156 ?auto_12160 ) ( ON ?auto_12156 ?auto_12162 ) ( CLEAR ?auto_12156 ) ( TRUCK-AT ?auto_12159 ?auto_12158 ) ( not ( = ?auto_12155 ?auto_12156 ) ) ( not ( = ?auto_12155 ?auto_12162 ) ) ( not ( = ?auto_12156 ?auto_12162 ) ) ( not ( = ?auto_12157 ?auto_12161 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12159 ?auto_12158 ?auto_12160 )
      ( !LIFT ?auto_12161 ?auto_12156 ?auto_12162 ?auto_12160 )
      ( !LOAD ?auto_12161 ?auto_12156 ?auto_12159 ?auto_12160 )
      ( !DRIVE ?auto_12159 ?auto_12160 ?auto_12158 )
      ( !UNLOAD ?auto_12157 ?auto_12156 ?auto_12159 ?auto_12158 )
      ( !DROP ?auto_12157 ?auto_12156 ?auto_12155 ?auto_12158 )
      ( MAKE-1CRATE-VERIFY ?auto_12155 ?auto_12156 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_12175 - SURFACE
      ?auto_12176 - SURFACE
      ?auto_12177 - SURFACE
      ?auto_12178 - SURFACE
      ?auto_12179 - SURFACE
      ?auto_12182 - SURFACE
      ?auto_12180 - SURFACE
      ?auto_12184 - SURFACE
      ?auto_12183 - SURFACE
      ?auto_12181 - SURFACE
      ?auto_12186 - SURFACE
      ?auto_12185 - SURFACE
    )
    :vars
    (
      ?auto_12192 - HOIST
      ?auto_12187 - PLACE
      ?auto_12190 - PLACE
      ?auto_12188 - HOIST
      ?auto_12191 - SURFACE
      ?auto_12200 - PLACE
      ?auto_12215 - HOIST
      ?auto_12216 - SURFACE
      ?auto_12203 - PLACE
      ?auto_12193 - HOIST
      ?auto_12206 - SURFACE
      ?auto_12198 - PLACE
      ?auto_12195 - HOIST
      ?auto_12194 - SURFACE
      ?auto_12202 - PLACE
      ?auto_12208 - HOIST
      ?auto_12205 - SURFACE
      ?auto_12207 - PLACE
      ?auto_12196 - HOIST
      ?auto_12213 - SURFACE
      ?auto_12197 - PLACE
      ?auto_12210 - HOIST
      ?auto_12211 - SURFACE
      ?auto_12218 - PLACE
      ?auto_12212 - HOIST
      ?auto_12209 - SURFACE
      ?auto_12204 - SURFACE
      ?auto_12217 - PLACE
      ?auto_12201 - HOIST
      ?auto_12199 - SURFACE
      ?auto_12214 - SURFACE
      ?auto_12189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12192 ?auto_12187 ) ( IS-CRATE ?auto_12185 ) ( not ( = ?auto_12190 ?auto_12187 ) ) ( HOIST-AT ?auto_12188 ?auto_12190 ) ( AVAILABLE ?auto_12188 ) ( SURFACE-AT ?auto_12185 ?auto_12190 ) ( ON ?auto_12185 ?auto_12191 ) ( CLEAR ?auto_12185 ) ( not ( = ?auto_12186 ?auto_12185 ) ) ( not ( = ?auto_12186 ?auto_12191 ) ) ( not ( = ?auto_12185 ?auto_12191 ) ) ( not ( = ?auto_12192 ?auto_12188 ) ) ( IS-CRATE ?auto_12186 ) ( not ( = ?auto_12200 ?auto_12187 ) ) ( HOIST-AT ?auto_12215 ?auto_12200 ) ( AVAILABLE ?auto_12215 ) ( SURFACE-AT ?auto_12186 ?auto_12200 ) ( ON ?auto_12186 ?auto_12216 ) ( CLEAR ?auto_12186 ) ( not ( = ?auto_12181 ?auto_12186 ) ) ( not ( = ?auto_12181 ?auto_12216 ) ) ( not ( = ?auto_12186 ?auto_12216 ) ) ( not ( = ?auto_12192 ?auto_12215 ) ) ( IS-CRATE ?auto_12181 ) ( not ( = ?auto_12203 ?auto_12187 ) ) ( HOIST-AT ?auto_12193 ?auto_12203 ) ( AVAILABLE ?auto_12193 ) ( SURFACE-AT ?auto_12181 ?auto_12203 ) ( ON ?auto_12181 ?auto_12206 ) ( CLEAR ?auto_12181 ) ( not ( = ?auto_12183 ?auto_12181 ) ) ( not ( = ?auto_12183 ?auto_12206 ) ) ( not ( = ?auto_12181 ?auto_12206 ) ) ( not ( = ?auto_12192 ?auto_12193 ) ) ( IS-CRATE ?auto_12183 ) ( not ( = ?auto_12198 ?auto_12187 ) ) ( HOIST-AT ?auto_12195 ?auto_12198 ) ( AVAILABLE ?auto_12195 ) ( SURFACE-AT ?auto_12183 ?auto_12198 ) ( ON ?auto_12183 ?auto_12194 ) ( CLEAR ?auto_12183 ) ( not ( = ?auto_12184 ?auto_12183 ) ) ( not ( = ?auto_12184 ?auto_12194 ) ) ( not ( = ?auto_12183 ?auto_12194 ) ) ( not ( = ?auto_12192 ?auto_12195 ) ) ( IS-CRATE ?auto_12184 ) ( not ( = ?auto_12202 ?auto_12187 ) ) ( HOIST-AT ?auto_12208 ?auto_12202 ) ( AVAILABLE ?auto_12208 ) ( SURFACE-AT ?auto_12184 ?auto_12202 ) ( ON ?auto_12184 ?auto_12205 ) ( CLEAR ?auto_12184 ) ( not ( = ?auto_12180 ?auto_12184 ) ) ( not ( = ?auto_12180 ?auto_12205 ) ) ( not ( = ?auto_12184 ?auto_12205 ) ) ( not ( = ?auto_12192 ?auto_12208 ) ) ( IS-CRATE ?auto_12180 ) ( not ( = ?auto_12207 ?auto_12187 ) ) ( HOIST-AT ?auto_12196 ?auto_12207 ) ( SURFACE-AT ?auto_12180 ?auto_12207 ) ( ON ?auto_12180 ?auto_12213 ) ( CLEAR ?auto_12180 ) ( not ( = ?auto_12182 ?auto_12180 ) ) ( not ( = ?auto_12182 ?auto_12213 ) ) ( not ( = ?auto_12180 ?auto_12213 ) ) ( not ( = ?auto_12192 ?auto_12196 ) ) ( IS-CRATE ?auto_12182 ) ( not ( = ?auto_12197 ?auto_12187 ) ) ( HOIST-AT ?auto_12210 ?auto_12197 ) ( AVAILABLE ?auto_12210 ) ( SURFACE-AT ?auto_12182 ?auto_12197 ) ( ON ?auto_12182 ?auto_12211 ) ( CLEAR ?auto_12182 ) ( not ( = ?auto_12179 ?auto_12182 ) ) ( not ( = ?auto_12179 ?auto_12211 ) ) ( not ( = ?auto_12182 ?auto_12211 ) ) ( not ( = ?auto_12192 ?auto_12210 ) ) ( IS-CRATE ?auto_12179 ) ( not ( = ?auto_12218 ?auto_12187 ) ) ( HOIST-AT ?auto_12212 ?auto_12218 ) ( AVAILABLE ?auto_12212 ) ( SURFACE-AT ?auto_12179 ?auto_12218 ) ( ON ?auto_12179 ?auto_12209 ) ( CLEAR ?auto_12179 ) ( not ( = ?auto_12178 ?auto_12179 ) ) ( not ( = ?auto_12178 ?auto_12209 ) ) ( not ( = ?auto_12179 ?auto_12209 ) ) ( not ( = ?auto_12192 ?auto_12212 ) ) ( IS-CRATE ?auto_12178 ) ( SURFACE-AT ?auto_12178 ?auto_12207 ) ( ON ?auto_12178 ?auto_12204 ) ( CLEAR ?auto_12178 ) ( not ( = ?auto_12177 ?auto_12178 ) ) ( not ( = ?auto_12177 ?auto_12204 ) ) ( not ( = ?auto_12178 ?auto_12204 ) ) ( IS-CRATE ?auto_12177 ) ( not ( = ?auto_12217 ?auto_12187 ) ) ( HOIST-AT ?auto_12201 ?auto_12217 ) ( AVAILABLE ?auto_12201 ) ( SURFACE-AT ?auto_12177 ?auto_12217 ) ( ON ?auto_12177 ?auto_12199 ) ( CLEAR ?auto_12177 ) ( not ( = ?auto_12176 ?auto_12177 ) ) ( not ( = ?auto_12176 ?auto_12199 ) ) ( not ( = ?auto_12177 ?auto_12199 ) ) ( not ( = ?auto_12192 ?auto_12201 ) ) ( SURFACE-AT ?auto_12175 ?auto_12187 ) ( CLEAR ?auto_12175 ) ( IS-CRATE ?auto_12176 ) ( AVAILABLE ?auto_12192 ) ( AVAILABLE ?auto_12196 ) ( SURFACE-AT ?auto_12176 ?auto_12207 ) ( ON ?auto_12176 ?auto_12214 ) ( CLEAR ?auto_12176 ) ( TRUCK-AT ?auto_12189 ?auto_12187 ) ( not ( = ?auto_12175 ?auto_12176 ) ) ( not ( = ?auto_12175 ?auto_12214 ) ) ( not ( = ?auto_12176 ?auto_12214 ) ) ( not ( = ?auto_12175 ?auto_12177 ) ) ( not ( = ?auto_12175 ?auto_12199 ) ) ( not ( = ?auto_12177 ?auto_12214 ) ) ( not ( = ?auto_12217 ?auto_12207 ) ) ( not ( = ?auto_12201 ?auto_12196 ) ) ( not ( = ?auto_12199 ?auto_12214 ) ) ( not ( = ?auto_12175 ?auto_12178 ) ) ( not ( = ?auto_12175 ?auto_12204 ) ) ( not ( = ?auto_12176 ?auto_12178 ) ) ( not ( = ?auto_12176 ?auto_12204 ) ) ( not ( = ?auto_12178 ?auto_12199 ) ) ( not ( = ?auto_12178 ?auto_12214 ) ) ( not ( = ?auto_12204 ?auto_12199 ) ) ( not ( = ?auto_12204 ?auto_12214 ) ) ( not ( = ?auto_12175 ?auto_12179 ) ) ( not ( = ?auto_12175 ?auto_12209 ) ) ( not ( = ?auto_12176 ?auto_12179 ) ) ( not ( = ?auto_12176 ?auto_12209 ) ) ( not ( = ?auto_12177 ?auto_12179 ) ) ( not ( = ?auto_12177 ?auto_12209 ) ) ( not ( = ?auto_12179 ?auto_12204 ) ) ( not ( = ?auto_12179 ?auto_12199 ) ) ( not ( = ?auto_12179 ?auto_12214 ) ) ( not ( = ?auto_12218 ?auto_12207 ) ) ( not ( = ?auto_12218 ?auto_12217 ) ) ( not ( = ?auto_12212 ?auto_12196 ) ) ( not ( = ?auto_12212 ?auto_12201 ) ) ( not ( = ?auto_12209 ?auto_12204 ) ) ( not ( = ?auto_12209 ?auto_12199 ) ) ( not ( = ?auto_12209 ?auto_12214 ) ) ( not ( = ?auto_12175 ?auto_12182 ) ) ( not ( = ?auto_12175 ?auto_12211 ) ) ( not ( = ?auto_12176 ?auto_12182 ) ) ( not ( = ?auto_12176 ?auto_12211 ) ) ( not ( = ?auto_12177 ?auto_12182 ) ) ( not ( = ?auto_12177 ?auto_12211 ) ) ( not ( = ?auto_12178 ?auto_12182 ) ) ( not ( = ?auto_12178 ?auto_12211 ) ) ( not ( = ?auto_12182 ?auto_12209 ) ) ( not ( = ?auto_12182 ?auto_12204 ) ) ( not ( = ?auto_12182 ?auto_12199 ) ) ( not ( = ?auto_12182 ?auto_12214 ) ) ( not ( = ?auto_12197 ?auto_12218 ) ) ( not ( = ?auto_12197 ?auto_12207 ) ) ( not ( = ?auto_12197 ?auto_12217 ) ) ( not ( = ?auto_12210 ?auto_12212 ) ) ( not ( = ?auto_12210 ?auto_12196 ) ) ( not ( = ?auto_12210 ?auto_12201 ) ) ( not ( = ?auto_12211 ?auto_12209 ) ) ( not ( = ?auto_12211 ?auto_12204 ) ) ( not ( = ?auto_12211 ?auto_12199 ) ) ( not ( = ?auto_12211 ?auto_12214 ) ) ( not ( = ?auto_12175 ?auto_12180 ) ) ( not ( = ?auto_12175 ?auto_12213 ) ) ( not ( = ?auto_12176 ?auto_12180 ) ) ( not ( = ?auto_12176 ?auto_12213 ) ) ( not ( = ?auto_12177 ?auto_12180 ) ) ( not ( = ?auto_12177 ?auto_12213 ) ) ( not ( = ?auto_12178 ?auto_12180 ) ) ( not ( = ?auto_12178 ?auto_12213 ) ) ( not ( = ?auto_12179 ?auto_12180 ) ) ( not ( = ?auto_12179 ?auto_12213 ) ) ( not ( = ?auto_12180 ?auto_12211 ) ) ( not ( = ?auto_12180 ?auto_12209 ) ) ( not ( = ?auto_12180 ?auto_12204 ) ) ( not ( = ?auto_12180 ?auto_12199 ) ) ( not ( = ?auto_12180 ?auto_12214 ) ) ( not ( = ?auto_12213 ?auto_12211 ) ) ( not ( = ?auto_12213 ?auto_12209 ) ) ( not ( = ?auto_12213 ?auto_12204 ) ) ( not ( = ?auto_12213 ?auto_12199 ) ) ( not ( = ?auto_12213 ?auto_12214 ) ) ( not ( = ?auto_12175 ?auto_12184 ) ) ( not ( = ?auto_12175 ?auto_12205 ) ) ( not ( = ?auto_12176 ?auto_12184 ) ) ( not ( = ?auto_12176 ?auto_12205 ) ) ( not ( = ?auto_12177 ?auto_12184 ) ) ( not ( = ?auto_12177 ?auto_12205 ) ) ( not ( = ?auto_12178 ?auto_12184 ) ) ( not ( = ?auto_12178 ?auto_12205 ) ) ( not ( = ?auto_12179 ?auto_12184 ) ) ( not ( = ?auto_12179 ?auto_12205 ) ) ( not ( = ?auto_12182 ?auto_12184 ) ) ( not ( = ?auto_12182 ?auto_12205 ) ) ( not ( = ?auto_12184 ?auto_12213 ) ) ( not ( = ?auto_12184 ?auto_12211 ) ) ( not ( = ?auto_12184 ?auto_12209 ) ) ( not ( = ?auto_12184 ?auto_12204 ) ) ( not ( = ?auto_12184 ?auto_12199 ) ) ( not ( = ?auto_12184 ?auto_12214 ) ) ( not ( = ?auto_12202 ?auto_12207 ) ) ( not ( = ?auto_12202 ?auto_12197 ) ) ( not ( = ?auto_12202 ?auto_12218 ) ) ( not ( = ?auto_12202 ?auto_12217 ) ) ( not ( = ?auto_12208 ?auto_12196 ) ) ( not ( = ?auto_12208 ?auto_12210 ) ) ( not ( = ?auto_12208 ?auto_12212 ) ) ( not ( = ?auto_12208 ?auto_12201 ) ) ( not ( = ?auto_12205 ?auto_12213 ) ) ( not ( = ?auto_12205 ?auto_12211 ) ) ( not ( = ?auto_12205 ?auto_12209 ) ) ( not ( = ?auto_12205 ?auto_12204 ) ) ( not ( = ?auto_12205 ?auto_12199 ) ) ( not ( = ?auto_12205 ?auto_12214 ) ) ( not ( = ?auto_12175 ?auto_12183 ) ) ( not ( = ?auto_12175 ?auto_12194 ) ) ( not ( = ?auto_12176 ?auto_12183 ) ) ( not ( = ?auto_12176 ?auto_12194 ) ) ( not ( = ?auto_12177 ?auto_12183 ) ) ( not ( = ?auto_12177 ?auto_12194 ) ) ( not ( = ?auto_12178 ?auto_12183 ) ) ( not ( = ?auto_12178 ?auto_12194 ) ) ( not ( = ?auto_12179 ?auto_12183 ) ) ( not ( = ?auto_12179 ?auto_12194 ) ) ( not ( = ?auto_12182 ?auto_12183 ) ) ( not ( = ?auto_12182 ?auto_12194 ) ) ( not ( = ?auto_12180 ?auto_12183 ) ) ( not ( = ?auto_12180 ?auto_12194 ) ) ( not ( = ?auto_12183 ?auto_12205 ) ) ( not ( = ?auto_12183 ?auto_12213 ) ) ( not ( = ?auto_12183 ?auto_12211 ) ) ( not ( = ?auto_12183 ?auto_12209 ) ) ( not ( = ?auto_12183 ?auto_12204 ) ) ( not ( = ?auto_12183 ?auto_12199 ) ) ( not ( = ?auto_12183 ?auto_12214 ) ) ( not ( = ?auto_12198 ?auto_12202 ) ) ( not ( = ?auto_12198 ?auto_12207 ) ) ( not ( = ?auto_12198 ?auto_12197 ) ) ( not ( = ?auto_12198 ?auto_12218 ) ) ( not ( = ?auto_12198 ?auto_12217 ) ) ( not ( = ?auto_12195 ?auto_12208 ) ) ( not ( = ?auto_12195 ?auto_12196 ) ) ( not ( = ?auto_12195 ?auto_12210 ) ) ( not ( = ?auto_12195 ?auto_12212 ) ) ( not ( = ?auto_12195 ?auto_12201 ) ) ( not ( = ?auto_12194 ?auto_12205 ) ) ( not ( = ?auto_12194 ?auto_12213 ) ) ( not ( = ?auto_12194 ?auto_12211 ) ) ( not ( = ?auto_12194 ?auto_12209 ) ) ( not ( = ?auto_12194 ?auto_12204 ) ) ( not ( = ?auto_12194 ?auto_12199 ) ) ( not ( = ?auto_12194 ?auto_12214 ) ) ( not ( = ?auto_12175 ?auto_12181 ) ) ( not ( = ?auto_12175 ?auto_12206 ) ) ( not ( = ?auto_12176 ?auto_12181 ) ) ( not ( = ?auto_12176 ?auto_12206 ) ) ( not ( = ?auto_12177 ?auto_12181 ) ) ( not ( = ?auto_12177 ?auto_12206 ) ) ( not ( = ?auto_12178 ?auto_12181 ) ) ( not ( = ?auto_12178 ?auto_12206 ) ) ( not ( = ?auto_12179 ?auto_12181 ) ) ( not ( = ?auto_12179 ?auto_12206 ) ) ( not ( = ?auto_12182 ?auto_12181 ) ) ( not ( = ?auto_12182 ?auto_12206 ) ) ( not ( = ?auto_12180 ?auto_12181 ) ) ( not ( = ?auto_12180 ?auto_12206 ) ) ( not ( = ?auto_12184 ?auto_12181 ) ) ( not ( = ?auto_12184 ?auto_12206 ) ) ( not ( = ?auto_12181 ?auto_12194 ) ) ( not ( = ?auto_12181 ?auto_12205 ) ) ( not ( = ?auto_12181 ?auto_12213 ) ) ( not ( = ?auto_12181 ?auto_12211 ) ) ( not ( = ?auto_12181 ?auto_12209 ) ) ( not ( = ?auto_12181 ?auto_12204 ) ) ( not ( = ?auto_12181 ?auto_12199 ) ) ( not ( = ?auto_12181 ?auto_12214 ) ) ( not ( = ?auto_12203 ?auto_12198 ) ) ( not ( = ?auto_12203 ?auto_12202 ) ) ( not ( = ?auto_12203 ?auto_12207 ) ) ( not ( = ?auto_12203 ?auto_12197 ) ) ( not ( = ?auto_12203 ?auto_12218 ) ) ( not ( = ?auto_12203 ?auto_12217 ) ) ( not ( = ?auto_12193 ?auto_12195 ) ) ( not ( = ?auto_12193 ?auto_12208 ) ) ( not ( = ?auto_12193 ?auto_12196 ) ) ( not ( = ?auto_12193 ?auto_12210 ) ) ( not ( = ?auto_12193 ?auto_12212 ) ) ( not ( = ?auto_12193 ?auto_12201 ) ) ( not ( = ?auto_12206 ?auto_12194 ) ) ( not ( = ?auto_12206 ?auto_12205 ) ) ( not ( = ?auto_12206 ?auto_12213 ) ) ( not ( = ?auto_12206 ?auto_12211 ) ) ( not ( = ?auto_12206 ?auto_12209 ) ) ( not ( = ?auto_12206 ?auto_12204 ) ) ( not ( = ?auto_12206 ?auto_12199 ) ) ( not ( = ?auto_12206 ?auto_12214 ) ) ( not ( = ?auto_12175 ?auto_12186 ) ) ( not ( = ?auto_12175 ?auto_12216 ) ) ( not ( = ?auto_12176 ?auto_12186 ) ) ( not ( = ?auto_12176 ?auto_12216 ) ) ( not ( = ?auto_12177 ?auto_12186 ) ) ( not ( = ?auto_12177 ?auto_12216 ) ) ( not ( = ?auto_12178 ?auto_12186 ) ) ( not ( = ?auto_12178 ?auto_12216 ) ) ( not ( = ?auto_12179 ?auto_12186 ) ) ( not ( = ?auto_12179 ?auto_12216 ) ) ( not ( = ?auto_12182 ?auto_12186 ) ) ( not ( = ?auto_12182 ?auto_12216 ) ) ( not ( = ?auto_12180 ?auto_12186 ) ) ( not ( = ?auto_12180 ?auto_12216 ) ) ( not ( = ?auto_12184 ?auto_12186 ) ) ( not ( = ?auto_12184 ?auto_12216 ) ) ( not ( = ?auto_12183 ?auto_12186 ) ) ( not ( = ?auto_12183 ?auto_12216 ) ) ( not ( = ?auto_12186 ?auto_12206 ) ) ( not ( = ?auto_12186 ?auto_12194 ) ) ( not ( = ?auto_12186 ?auto_12205 ) ) ( not ( = ?auto_12186 ?auto_12213 ) ) ( not ( = ?auto_12186 ?auto_12211 ) ) ( not ( = ?auto_12186 ?auto_12209 ) ) ( not ( = ?auto_12186 ?auto_12204 ) ) ( not ( = ?auto_12186 ?auto_12199 ) ) ( not ( = ?auto_12186 ?auto_12214 ) ) ( not ( = ?auto_12200 ?auto_12203 ) ) ( not ( = ?auto_12200 ?auto_12198 ) ) ( not ( = ?auto_12200 ?auto_12202 ) ) ( not ( = ?auto_12200 ?auto_12207 ) ) ( not ( = ?auto_12200 ?auto_12197 ) ) ( not ( = ?auto_12200 ?auto_12218 ) ) ( not ( = ?auto_12200 ?auto_12217 ) ) ( not ( = ?auto_12215 ?auto_12193 ) ) ( not ( = ?auto_12215 ?auto_12195 ) ) ( not ( = ?auto_12215 ?auto_12208 ) ) ( not ( = ?auto_12215 ?auto_12196 ) ) ( not ( = ?auto_12215 ?auto_12210 ) ) ( not ( = ?auto_12215 ?auto_12212 ) ) ( not ( = ?auto_12215 ?auto_12201 ) ) ( not ( = ?auto_12216 ?auto_12206 ) ) ( not ( = ?auto_12216 ?auto_12194 ) ) ( not ( = ?auto_12216 ?auto_12205 ) ) ( not ( = ?auto_12216 ?auto_12213 ) ) ( not ( = ?auto_12216 ?auto_12211 ) ) ( not ( = ?auto_12216 ?auto_12209 ) ) ( not ( = ?auto_12216 ?auto_12204 ) ) ( not ( = ?auto_12216 ?auto_12199 ) ) ( not ( = ?auto_12216 ?auto_12214 ) ) ( not ( = ?auto_12175 ?auto_12185 ) ) ( not ( = ?auto_12175 ?auto_12191 ) ) ( not ( = ?auto_12176 ?auto_12185 ) ) ( not ( = ?auto_12176 ?auto_12191 ) ) ( not ( = ?auto_12177 ?auto_12185 ) ) ( not ( = ?auto_12177 ?auto_12191 ) ) ( not ( = ?auto_12178 ?auto_12185 ) ) ( not ( = ?auto_12178 ?auto_12191 ) ) ( not ( = ?auto_12179 ?auto_12185 ) ) ( not ( = ?auto_12179 ?auto_12191 ) ) ( not ( = ?auto_12182 ?auto_12185 ) ) ( not ( = ?auto_12182 ?auto_12191 ) ) ( not ( = ?auto_12180 ?auto_12185 ) ) ( not ( = ?auto_12180 ?auto_12191 ) ) ( not ( = ?auto_12184 ?auto_12185 ) ) ( not ( = ?auto_12184 ?auto_12191 ) ) ( not ( = ?auto_12183 ?auto_12185 ) ) ( not ( = ?auto_12183 ?auto_12191 ) ) ( not ( = ?auto_12181 ?auto_12185 ) ) ( not ( = ?auto_12181 ?auto_12191 ) ) ( not ( = ?auto_12185 ?auto_12216 ) ) ( not ( = ?auto_12185 ?auto_12206 ) ) ( not ( = ?auto_12185 ?auto_12194 ) ) ( not ( = ?auto_12185 ?auto_12205 ) ) ( not ( = ?auto_12185 ?auto_12213 ) ) ( not ( = ?auto_12185 ?auto_12211 ) ) ( not ( = ?auto_12185 ?auto_12209 ) ) ( not ( = ?auto_12185 ?auto_12204 ) ) ( not ( = ?auto_12185 ?auto_12199 ) ) ( not ( = ?auto_12185 ?auto_12214 ) ) ( not ( = ?auto_12190 ?auto_12200 ) ) ( not ( = ?auto_12190 ?auto_12203 ) ) ( not ( = ?auto_12190 ?auto_12198 ) ) ( not ( = ?auto_12190 ?auto_12202 ) ) ( not ( = ?auto_12190 ?auto_12207 ) ) ( not ( = ?auto_12190 ?auto_12197 ) ) ( not ( = ?auto_12190 ?auto_12218 ) ) ( not ( = ?auto_12190 ?auto_12217 ) ) ( not ( = ?auto_12188 ?auto_12215 ) ) ( not ( = ?auto_12188 ?auto_12193 ) ) ( not ( = ?auto_12188 ?auto_12195 ) ) ( not ( = ?auto_12188 ?auto_12208 ) ) ( not ( = ?auto_12188 ?auto_12196 ) ) ( not ( = ?auto_12188 ?auto_12210 ) ) ( not ( = ?auto_12188 ?auto_12212 ) ) ( not ( = ?auto_12188 ?auto_12201 ) ) ( not ( = ?auto_12191 ?auto_12216 ) ) ( not ( = ?auto_12191 ?auto_12206 ) ) ( not ( = ?auto_12191 ?auto_12194 ) ) ( not ( = ?auto_12191 ?auto_12205 ) ) ( not ( = ?auto_12191 ?auto_12213 ) ) ( not ( = ?auto_12191 ?auto_12211 ) ) ( not ( = ?auto_12191 ?auto_12209 ) ) ( not ( = ?auto_12191 ?auto_12204 ) ) ( not ( = ?auto_12191 ?auto_12199 ) ) ( not ( = ?auto_12191 ?auto_12214 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_12175 ?auto_12176 ?auto_12177 ?auto_12178 ?auto_12179 ?auto_12182 ?auto_12180 ?auto_12184 ?auto_12183 ?auto_12181 ?auto_12186 )
      ( MAKE-1CRATE ?auto_12186 ?auto_12185 )
      ( MAKE-11CRATE-VERIFY ?auto_12175 ?auto_12176 ?auto_12177 ?auto_12178 ?auto_12179 ?auto_12182 ?auto_12180 ?auto_12184 ?auto_12183 ?auto_12181 ?auto_12186 ?auto_12185 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12221 - SURFACE
      ?auto_12222 - SURFACE
    )
    :vars
    (
      ?auto_12223 - HOIST
      ?auto_12224 - PLACE
      ?auto_12226 - PLACE
      ?auto_12227 - HOIST
      ?auto_12228 - SURFACE
      ?auto_12225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12223 ?auto_12224 ) ( SURFACE-AT ?auto_12221 ?auto_12224 ) ( CLEAR ?auto_12221 ) ( IS-CRATE ?auto_12222 ) ( AVAILABLE ?auto_12223 ) ( not ( = ?auto_12226 ?auto_12224 ) ) ( HOIST-AT ?auto_12227 ?auto_12226 ) ( AVAILABLE ?auto_12227 ) ( SURFACE-AT ?auto_12222 ?auto_12226 ) ( ON ?auto_12222 ?auto_12228 ) ( CLEAR ?auto_12222 ) ( TRUCK-AT ?auto_12225 ?auto_12224 ) ( not ( = ?auto_12221 ?auto_12222 ) ) ( not ( = ?auto_12221 ?auto_12228 ) ) ( not ( = ?auto_12222 ?auto_12228 ) ) ( not ( = ?auto_12223 ?auto_12227 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12225 ?auto_12224 ?auto_12226 )
      ( !LIFT ?auto_12227 ?auto_12222 ?auto_12228 ?auto_12226 )
      ( !LOAD ?auto_12227 ?auto_12222 ?auto_12225 ?auto_12226 )
      ( !DRIVE ?auto_12225 ?auto_12226 ?auto_12224 )
      ( !UNLOAD ?auto_12223 ?auto_12222 ?auto_12225 ?auto_12224 )
      ( !DROP ?auto_12223 ?auto_12222 ?auto_12221 ?auto_12224 )
      ( MAKE-1CRATE-VERIFY ?auto_12221 ?auto_12222 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_12242 - SURFACE
      ?auto_12243 - SURFACE
      ?auto_12244 - SURFACE
      ?auto_12245 - SURFACE
      ?auto_12246 - SURFACE
      ?auto_12249 - SURFACE
      ?auto_12247 - SURFACE
      ?auto_12251 - SURFACE
      ?auto_12250 - SURFACE
      ?auto_12248 - SURFACE
      ?auto_12253 - SURFACE
      ?auto_12252 - SURFACE
      ?auto_12254 - SURFACE
    )
    :vars
    (
      ?auto_12256 - HOIST
      ?auto_12257 - PLACE
      ?auto_12258 - PLACE
      ?auto_12260 - HOIST
      ?auto_12255 - SURFACE
      ?auto_12289 - PLACE
      ?auto_12283 - HOIST
      ?auto_12282 - SURFACE
      ?auto_12266 - PLACE
      ?auto_12278 - HOIST
      ?auto_12264 - SURFACE
      ?auto_12280 - PLACE
      ?auto_12277 - HOIST
      ?auto_12263 - SURFACE
      ?auto_12279 - PLACE
      ?auto_12265 - HOIST
      ?auto_12286 - SURFACE
      ?auto_12281 - PLACE
      ?auto_12273 - HOIST
      ?auto_12267 - SURFACE
      ?auto_12261 - PLACE
      ?auto_12276 - HOIST
      ?auto_12287 - SURFACE
      ?auto_12262 - PLACE
      ?auto_12270 - HOIST
      ?auto_12268 - SURFACE
      ?auto_12271 - PLACE
      ?auto_12275 - HOIST
      ?auto_12285 - SURFACE
      ?auto_12274 - SURFACE
      ?auto_12284 - PLACE
      ?auto_12269 - HOIST
      ?auto_12272 - SURFACE
      ?auto_12288 - SURFACE
      ?auto_12259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12256 ?auto_12257 ) ( IS-CRATE ?auto_12254 ) ( not ( = ?auto_12258 ?auto_12257 ) ) ( HOIST-AT ?auto_12260 ?auto_12258 ) ( AVAILABLE ?auto_12260 ) ( SURFACE-AT ?auto_12254 ?auto_12258 ) ( ON ?auto_12254 ?auto_12255 ) ( CLEAR ?auto_12254 ) ( not ( = ?auto_12252 ?auto_12254 ) ) ( not ( = ?auto_12252 ?auto_12255 ) ) ( not ( = ?auto_12254 ?auto_12255 ) ) ( not ( = ?auto_12256 ?auto_12260 ) ) ( IS-CRATE ?auto_12252 ) ( not ( = ?auto_12289 ?auto_12257 ) ) ( HOIST-AT ?auto_12283 ?auto_12289 ) ( AVAILABLE ?auto_12283 ) ( SURFACE-AT ?auto_12252 ?auto_12289 ) ( ON ?auto_12252 ?auto_12282 ) ( CLEAR ?auto_12252 ) ( not ( = ?auto_12253 ?auto_12252 ) ) ( not ( = ?auto_12253 ?auto_12282 ) ) ( not ( = ?auto_12252 ?auto_12282 ) ) ( not ( = ?auto_12256 ?auto_12283 ) ) ( IS-CRATE ?auto_12253 ) ( not ( = ?auto_12266 ?auto_12257 ) ) ( HOIST-AT ?auto_12278 ?auto_12266 ) ( AVAILABLE ?auto_12278 ) ( SURFACE-AT ?auto_12253 ?auto_12266 ) ( ON ?auto_12253 ?auto_12264 ) ( CLEAR ?auto_12253 ) ( not ( = ?auto_12248 ?auto_12253 ) ) ( not ( = ?auto_12248 ?auto_12264 ) ) ( not ( = ?auto_12253 ?auto_12264 ) ) ( not ( = ?auto_12256 ?auto_12278 ) ) ( IS-CRATE ?auto_12248 ) ( not ( = ?auto_12280 ?auto_12257 ) ) ( HOIST-AT ?auto_12277 ?auto_12280 ) ( AVAILABLE ?auto_12277 ) ( SURFACE-AT ?auto_12248 ?auto_12280 ) ( ON ?auto_12248 ?auto_12263 ) ( CLEAR ?auto_12248 ) ( not ( = ?auto_12250 ?auto_12248 ) ) ( not ( = ?auto_12250 ?auto_12263 ) ) ( not ( = ?auto_12248 ?auto_12263 ) ) ( not ( = ?auto_12256 ?auto_12277 ) ) ( IS-CRATE ?auto_12250 ) ( not ( = ?auto_12279 ?auto_12257 ) ) ( HOIST-AT ?auto_12265 ?auto_12279 ) ( AVAILABLE ?auto_12265 ) ( SURFACE-AT ?auto_12250 ?auto_12279 ) ( ON ?auto_12250 ?auto_12286 ) ( CLEAR ?auto_12250 ) ( not ( = ?auto_12251 ?auto_12250 ) ) ( not ( = ?auto_12251 ?auto_12286 ) ) ( not ( = ?auto_12250 ?auto_12286 ) ) ( not ( = ?auto_12256 ?auto_12265 ) ) ( IS-CRATE ?auto_12251 ) ( not ( = ?auto_12281 ?auto_12257 ) ) ( HOIST-AT ?auto_12273 ?auto_12281 ) ( AVAILABLE ?auto_12273 ) ( SURFACE-AT ?auto_12251 ?auto_12281 ) ( ON ?auto_12251 ?auto_12267 ) ( CLEAR ?auto_12251 ) ( not ( = ?auto_12247 ?auto_12251 ) ) ( not ( = ?auto_12247 ?auto_12267 ) ) ( not ( = ?auto_12251 ?auto_12267 ) ) ( not ( = ?auto_12256 ?auto_12273 ) ) ( IS-CRATE ?auto_12247 ) ( not ( = ?auto_12261 ?auto_12257 ) ) ( HOIST-AT ?auto_12276 ?auto_12261 ) ( SURFACE-AT ?auto_12247 ?auto_12261 ) ( ON ?auto_12247 ?auto_12287 ) ( CLEAR ?auto_12247 ) ( not ( = ?auto_12249 ?auto_12247 ) ) ( not ( = ?auto_12249 ?auto_12287 ) ) ( not ( = ?auto_12247 ?auto_12287 ) ) ( not ( = ?auto_12256 ?auto_12276 ) ) ( IS-CRATE ?auto_12249 ) ( not ( = ?auto_12262 ?auto_12257 ) ) ( HOIST-AT ?auto_12270 ?auto_12262 ) ( AVAILABLE ?auto_12270 ) ( SURFACE-AT ?auto_12249 ?auto_12262 ) ( ON ?auto_12249 ?auto_12268 ) ( CLEAR ?auto_12249 ) ( not ( = ?auto_12246 ?auto_12249 ) ) ( not ( = ?auto_12246 ?auto_12268 ) ) ( not ( = ?auto_12249 ?auto_12268 ) ) ( not ( = ?auto_12256 ?auto_12270 ) ) ( IS-CRATE ?auto_12246 ) ( not ( = ?auto_12271 ?auto_12257 ) ) ( HOIST-AT ?auto_12275 ?auto_12271 ) ( AVAILABLE ?auto_12275 ) ( SURFACE-AT ?auto_12246 ?auto_12271 ) ( ON ?auto_12246 ?auto_12285 ) ( CLEAR ?auto_12246 ) ( not ( = ?auto_12245 ?auto_12246 ) ) ( not ( = ?auto_12245 ?auto_12285 ) ) ( not ( = ?auto_12246 ?auto_12285 ) ) ( not ( = ?auto_12256 ?auto_12275 ) ) ( IS-CRATE ?auto_12245 ) ( SURFACE-AT ?auto_12245 ?auto_12261 ) ( ON ?auto_12245 ?auto_12274 ) ( CLEAR ?auto_12245 ) ( not ( = ?auto_12244 ?auto_12245 ) ) ( not ( = ?auto_12244 ?auto_12274 ) ) ( not ( = ?auto_12245 ?auto_12274 ) ) ( IS-CRATE ?auto_12244 ) ( not ( = ?auto_12284 ?auto_12257 ) ) ( HOIST-AT ?auto_12269 ?auto_12284 ) ( AVAILABLE ?auto_12269 ) ( SURFACE-AT ?auto_12244 ?auto_12284 ) ( ON ?auto_12244 ?auto_12272 ) ( CLEAR ?auto_12244 ) ( not ( = ?auto_12243 ?auto_12244 ) ) ( not ( = ?auto_12243 ?auto_12272 ) ) ( not ( = ?auto_12244 ?auto_12272 ) ) ( not ( = ?auto_12256 ?auto_12269 ) ) ( SURFACE-AT ?auto_12242 ?auto_12257 ) ( CLEAR ?auto_12242 ) ( IS-CRATE ?auto_12243 ) ( AVAILABLE ?auto_12256 ) ( AVAILABLE ?auto_12276 ) ( SURFACE-AT ?auto_12243 ?auto_12261 ) ( ON ?auto_12243 ?auto_12288 ) ( CLEAR ?auto_12243 ) ( TRUCK-AT ?auto_12259 ?auto_12257 ) ( not ( = ?auto_12242 ?auto_12243 ) ) ( not ( = ?auto_12242 ?auto_12288 ) ) ( not ( = ?auto_12243 ?auto_12288 ) ) ( not ( = ?auto_12242 ?auto_12244 ) ) ( not ( = ?auto_12242 ?auto_12272 ) ) ( not ( = ?auto_12244 ?auto_12288 ) ) ( not ( = ?auto_12284 ?auto_12261 ) ) ( not ( = ?auto_12269 ?auto_12276 ) ) ( not ( = ?auto_12272 ?auto_12288 ) ) ( not ( = ?auto_12242 ?auto_12245 ) ) ( not ( = ?auto_12242 ?auto_12274 ) ) ( not ( = ?auto_12243 ?auto_12245 ) ) ( not ( = ?auto_12243 ?auto_12274 ) ) ( not ( = ?auto_12245 ?auto_12272 ) ) ( not ( = ?auto_12245 ?auto_12288 ) ) ( not ( = ?auto_12274 ?auto_12272 ) ) ( not ( = ?auto_12274 ?auto_12288 ) ) ( not ( = ?auto_12242 ?auto_12246 ) ) ( not ( = ?auto_12242 ?auto_12285 ) ) ( not ( = ?auto_12243 ?auto_12246 ) ) ( not ( = ?auto_12243 ?auto_12285 ) ) ( not ( = ?auto_12244 ?auto_12246 ) ) ( not ( = ?auto_12244 ?auto_12285 ) ) ( not ( = ?auto_12246 ?auto_12274 ) ) ( not ( = ?auto_12246 ?auto_12272 ) ) ( not ( = ?auto_12246 ?auto_12288 ) ) ( not ( = ?auto_12271 ?auto_12261 ) ) ( not ( = ?auto_12271 ?auto_12284 ) ) ( not ( = ?auto_12275 ?auto_12276 ) ) ( not ( = ?auto_12275 ?auto_12269 ) ) ( not ( = ?auto_12285 ?auto_12274 ) ) ( not ( = ?auto_12285 ?auto_12272 ) ) ( not ( = ?auto_12285 ?auto_12288 ) ) ( not ( = ?auto_12242 ?auto_12249 ) ) ( not ( = ?auto_12242 ?auto_12268 ) ) ( not ( = ?auto_12243 ?auto_12249 ) ) ( not ( = ?auto_12243 ?auto_12268 ) ) ( not ( = ?auto_12244 ?auto_12249 ) ) ( not ( = ?auto_12244 ?auto_12268 ) ) ( not ( = ?auto_12245 ?auto_12249 ) ) ( not ( = ?auto_12245 ?auto_12268 ) ) ( not ( = ?auto_12249 ?auto_12285 ) ) ( not ( = ?auto_12249 ?auto_12274 ) ) ( not ( = ?auto_12249 ?auto_12272 ) ) ( not ( = ?auto_12249 ?auto_12288 ) ) ( not ( = ?auto_12262 ?auto_12271 ) ) ( not ( = ?auto_12262 ?auto_12261 ) ) ( not ( = ?auto_12262 ?auto_12284 ) ) ( not ( = ?auto_12270 ?auto_12275 ) ) ( not ( = ?auto_12270 ?auto_12276 ) ) ( not ( = ?auto_12270 ?auto_12269 ) ) ( not ( = ?auto_12268 ?auto_12285 ) ) ( not ( = ?auto_12268 ?auto_12274 ) ) ( not ( = ?auto_12268 ?auto_12272 ) ) ( not ( = ?auto_12268 ?auto_12288 ) ) ( not ( = ?auto_12242 ?auto_12247 ) ) ( not ( = ?auto_12242 ?auto_12287 ) ) ( not ( = ?auto_12243 ?auto_12247 ) ) ( not ( = ?auto_12243 ?auto_12287 ) ) ( not ( = ?auto_12244 ?auto_12247 ) ) ( not ( = ?auto_12244 ?auto_12287 ) ) ( not ( = ?auto_12245 ?auto_12247 ) ) ( not ( = ?auto_12245 ?auto_12287 ) ) ( not ( = ?auto_12246 ?auto_12247 ) ) ( not ( = ?auto_12246 ?auto_12287 ) ) ( not ( = ?auto_12247 ?auto_12268 ) ) ( not ( = ?auto_12247 ?auto_12285 ) ) ( not ( = ?auto_12247 ?auto_12274 ) ) ( not ( = ?auto_12247 ?auto_12272 ) ) ( not ( = ?auto_12247 ?auto_12288 ) ) ( not ( = ?auto_12287 ?auto_12268 ) ) ( not ( = ?auto_12287 ?auto_12285 ) ) ( not ( = ?auto_12287 ?auto_12274 ) ) ( not ( = ?auto_12287 ?auto_12272 ) ) ( not ( = ?auto_12287 ?auto_12288 ) ) ( not ( = ?auto_12242 ?auto_12251 ) ) ( not ( = ?auto_12242 ?auto_12267 ) ) ( not ( = ?auto_12243 ?auto_12251 ) ) ( not ( = ?auto_12243 ?auto_12267 ) ) ( not ( = ?auto_12244 ?auto_12251 ) ) ( not ( = ?auto_12244 ?auto_12267 ) ) ( not ( = ?auto_12245 ?auto_12251 ) ) ( not ( = ?auto_12245 ?auto_12267 ) ) ( not ( = ?auto_12246 ?auto_12251 ) ) ( not ( = ?auto_12246 ?auto_12267 ) ) ( not ( = ?auto_12249 ?auto_12251 ) ) ( not ( = ?auto_12249 ?auto_12267 ) ) ( not ( = ?auto_12251 ?auto_12287 ) ) ( not ( = ?auto_12251 ?auto_12268 ) ) ( not ( = ?auto_12251 ?auto_12285 ) ) ( not ( = ?auto_12251 ?auto_12274 ) ) ( not ( = ?auto_12251 ?auto_12272 ) ) ( not ( = ?auto_12251 ?auto_12288 ) ) ( not ( = ?auto_12281 ?auto_12261 ) ) ( not ( = ?auto_12281 ?auto_12262 ) ) ( not ( = ?auto_12281 ?auto_12271 ) ) ( not ( = ?auto_12281 ?auto_12284 ) ) ( not ( = ?auto_12273 ?auto_12276 ) ) ( not ( = ?auto_12273 ?auto_12270 ) ) ( not ( = ?auto_12273 ?auto_12275 ) ) ( not ( = ?auto_12273 ?auto_12269 ) ) ( not ( = ?auto_12267 ?auto_12287 ) ) ( not ( = ?auto_12267 ?auto_12268 ) ) ( not ( = ?auto_12267 ?auto_12285 ) ) ( not ( = ?auto_12267 ?auto_12274 ) ) ( not ( = ?auto_12267 ?auto_12272 ) ) ( not ( = ?auto_12267 ?auto_12288 ) ) ( not ( = ?auto_12242 ?auto_12250 ) ) ( not ( = ?auto_12242 ?auto_12286 ) ) ( not ( = ?auto_12243 ?auto_12250 ) ) ( not ( = ?auto_12243 ?auto_12286 ) ) ( not ( = ?auto_12244 ?auto_12250 ) ) ( not ( = ?auto_12244 ?auto_12286 ) ) ( not ( = ?auto_12245 ?auto_12250 ) ) ( not ( = ?auto_12245 ?auto_12286 ) ) ( not ( = ?auto_12246 ?auto_12250 ) ) ( not ( = ?auto_12246 ?auto_12286 ) ) ( not ( = ?auto_12249 ?auto_12250 ) ) ( not ( = ?auto_12249 ?auto_12286 ) ) ( not ( = ?auto_12247 ?auto_12250 ) ) ( not ( = ?auto_12247 ?auto_12286 ) ) ( not ( = ?auto_12250 ?auto_12267 ) ) ( not ( = ?auto_12250 ?auto_12287 ) ) ( not ( = ?auto_12250 ?auto_12268 ) ) ( not ( = ?auto_12250 ?auto_12285 ) ) ( not ( = ?auto_12250 ?auto_12274 ) ) ( not ( = ?auto_12250 ?auto_12272 ) ) ( not ( = ?auto_12250 ?auto_12288 ) ) ( not ( = ?auto_12279 ?auto_12281 ) ) ( not ( = ?auto_12279 ?auto_12261 ) ) ( not ( = ?auto_12279 ?auto_12262 ) ) ( not ( = ?auto_12279 ?auto_12271 ) ) ( not ( = ?auto_12279 ?auto_12284 ) ) ( not ( = ?auto_12265 ?auto_12273 ) ) ( not ( = ?auto_12265 ?auto_12276 ) ) ( not ( = ?auto_12265 ?auto_12270 ) ) ( not ( = ?auto_12265 ?auto_12275 ) ) ( not ( = ?auto_12265 ?auto_12269 ) ) ( not ( = ?auto_12286 ?auto_12267 ) ) ( not ( = ?auto_12286 ?auto_12287 ) ) ( not ( = ?auto_12286 ?auto_12268 ) ) ( not ( = ?auto_12286 ?auto_12285 ) ) ( not ( = ?auto_12286 ?auto_12274 ) ) ( not ( = ?auto_12286 ?auto_12272 ) ) ( not ( = ?auto_12286 ?auto_12288 ) ) ( not ( = ?auto_12242 ?auto_12248 ) ) ( not ( = ?auto_12242 ?auto_12263 ) ) ( not ( = ?auto_12243 ?auto_12248 ) ) ( not ( = ?auto_12243 ?auto_12263 ) ) ( not ( = ?auto_12244 ?auto_12248 ) ) ( not ( = ?auto_12244 ?auto_12263 ) ) ( not ( = ?auto_12245 ?auto_12248 ) ) ( not ( = ?auto_12245 ?auto_12263 ) ) ( not ( = ?auto_12246 ?auto_12248 ) ) ( not ( = ?auto_12246 ?auto_12263 ) ) ( not ( = ?auto_12249 ?auto_12248 ) ) ( not ( = ?auto_12249 ?auto_12263 ) ) ( not ( = ?auto_12247 ?auto_12248 ) ) ( not ( = ?auto_12247 ?auto_12263 ) ) ( not ( = ?auto_12251 ?auto_12248 ) ) ( not ( = ?auto_12251 ?auto_12263 ) ) ( not ( = ?auto_12248 ?auto_12286 ) ) ( not ( = ?auto_12248 ?auto_12267 ) ) ( not ( = ?auto_12248 ?auto_12287 ) ) ( not ( = ?auto_12248 ?auto_12268 ) ) ( not ( = ?auto_12248 ?auto_12285 ) ) ( not ( = ?auto_12248 ?auto_12274 ) ) ( not ( = ?auto_12248 ?auto_12272 ) ) ( not ( = ?auto_12248 ?auto_12288 ) ) ( not ( = ?auto_12280 ?auto_12279 ) ) ( not ( = ?auto_12280 ?auto_12281 ) ) ( not ( = ?auto_12280 ?auto_12261 ) ) ( not ( = ?auto_12280 ?auto_12262 ) ) ( not ( = ?auto_12280 ?auto_12271 ) ) ( not ( = ?auto_12280 ?auto_12284 ) ) ( not ( = ?auto_12277 ?auto_12265 ) ) ( not ( = ?auto_12277 ?auto_12273 ) ) ( not ( = ?auto_12277 ?auto_12276 ) ) ( not ( = ?auto_12277 ?auto_12270 ) ) ( not ( = ?auto_12277 ?auto_12275 ) ) ( not ( = ?auto_12277 ?auto_12269 ) ) ( not ( = ?auto_12263 ?auto_12286 ) ) ( not ( = ?auto_12263 ?auto_12267 ) ) ( not ( = ?auto_12263 ?auto_12287 ) ) ( not ( = ?auto_12263 ?auto_12268 ) ) ( not ( = ?auto_12263 ?auto_12285 ) ) ( not ( = ?auto_12263 ?auto_12274 ) ) ( not ( = ?auto_12263 ?auto_12272 ) ) ( not ( = ?auto_12263 ?auto_12288 ) ) ( not ( = ?auto_12242 ?auto_12253 ) ) ( not ( = ?auto_12242 ?auto_12264 ) ) ( not ( = ?auto_12243 ?auto_12253 ) ) ( not ( = ?auto_12243 ?auto_12264 ) ) ( not ( = ?auto_12244 ?auto_12253 ) ) ( not ( = ?auto_12244 ?auto_12264 ) ) ( not ( = ?auto_12245 ?auto_12253 ) ) ( not ( = ?auto_12245 ?auto_12264 ) ) ( not ( = ?auto_12246 ?auto_12253 ) ) ( not ( = ?auto_12246 ?auto_12264 ) ) ( not ( = ?auto_12249 ?auto_12253 ) ) ( not ( = ?auto_12249 ?auto_12264 ) ) ( not ( = ?auto_12247 ?auto_12253 ) ) ( not ( = ?auto_12247 ?auto_12264 ) ) ( not ( = ?auto_12251 ?auto_12253 ) ) ( not ( = ?auto_12251 ?auto_12264 ) ) ( not ( = ?auto_12250 ?auto_12253 ) ) ( not ( = ?auto_12250 ?auto_12264 ) ) ( not ( = ?auto_12253 ?auto_12263 ) ) ( not ( = ?auto_12253 ?auto_12286 ) ) ( not ( = ?auto_12253 ?auto_12267 ) ) ( not ( = ?auto_12253 ?auto_12287 ) ) ( not ( = ?auto_12253 ?auto_12268 ) ) ( not ( = ?auto_12253 ?auto_12285 ) ) ( not ( = ?auto_12253 ?auto_12274 ) ) ( not ( = ?auto_12253 ?auto_12272 ) ) ( not ( = ?auto_12253 ?auto_12288 ) ) ( not ( = ?auto_12266 ?auto_12280 ) ) ( not ( = ?auto_12266 ?auto_12279 ) ) ( not ( = ?auto_12266 ?auto_12281 ) ) ( not ( = ?auto_12266 ?auto_12261 ) ) ( not ( = ?auto_12266 ?auto_12262 ) ) ( not ( = ?auto_12266 ?auto_12271 ) ) ( not ( = ?auto_12266 ?auto_12284 ) ) ( not ( = ?auto_12278 ?auto_12277 ) ) ( not ( = ?auto_12278 ?auto_12265 ) ) ( not ( = ?auto_12278 ?auto_12273 ) ) ( not ( = ?auto_12278 ?auto_12276 ) ) ( not ( = ?auto_12278 ?auto_12270 ) ) ( not ( = ?auto_12278 ?auto_12275 ) ) ( not ( = ?auto_12278 ?auto_12269 ) ) ( not ( = ?auto_12264 ?auto_12263 ) ) ( not ( = ?auto_12264 ?auto_12286 ) ) ( not ( = ?auto_12264 ?auto_12267 ) ) ( not ( = ?auto_12264 ?auto_12287 ) ) ( not ( = ?auto_12264 ?auto_12268 ) ) ( not ( = ?auto_12264 ?auto_12285 ) ) ( not ( = ?auto_12264 ?auto_12274 ) ) ( not ( = ?auto_12264 ?auto_12272 ) ) ( not ( = ?auto_12264 ?auto_12288 ) ) ( not ( = ?auto_12242 ?auto_12252 ) ) ( not ( = ?auto_12242 ?auto_12282 ) ) ( not ( = ?auto_12243 ?auto_12252 ) ) ( not ( = ?auto_12243 ?auto_12282 ) ) ( not ( = ?auto_12244 ?auto_12252 ) ) ( not ( = ?auto_12244 ?auto_12282 ) ) ( not ( = ?auto_12245 ?auto_12252 ) ) ( not ( = ?auto_12245 ?auto_12282 ) ) ( not ( = ?auto_12246 ?auto_12252 ) ) ( not ( = ?auto_12246 ?auto_12282 ) ) ( not ( = ?auto_12249 ?auto_12252 ) ) ( not ( = ?auto_12249 ?auto_12282 ) ) ( not ( = ?auto_12247 ?auto_12252 ) ) ( not ( = ?auto_12247 ?auto_12282 ) ) ( not ( = ?auto_12251 ?auto_12252 ) ) ( not ( = ?auto_12251 ?auto_12282 ) ) ( not ( = ?auto_12250 ?auto_12252 ) ) ( not ( = ?auto_12250 ?auto_12282 ) ) ( not ( = ?auto_12248 ?auto_12252 ) ) ( not ( = ?auto_12248 ?auto_12282 ) ) ( not ( = ?auto_12252 ?auto_12264 ) ) ( not ( = ?auto_12252 ?auto_12263 ) ) ( not ( = ?auto_12252 ?auto_12286 ) ) ( not ( = ?auto_12252 ?auto_12267 ) ) ( not ( = ?auto_12252 ?auto_12287 ) ) ( not ( = ?auto_12252 ?auto_12268 ) ) ( not ( = ?auto_12252 ?auto_12285 ) ) ( not ( = ?auto_12252 ?auto_12274 ) ) ( not ( = ?auto_12252 ?auto_12272 ) ) ( not ( = ?auto_12252 ?auto_12288 ) ) ( not ( = ?auto_12289 ?auto_12266 ) ) ( not ( = ?auto_12289 ?auto_12280 ) ) ( not ( = ?auto_12289 ?auto_12279 ) ) ( not ( = ?auto_12289 ?auto_12281 ) ) ( not ( = ?auto_12289 ?auto_12261 ) ) ( not ( = ?auto_12289 ?auto_12262 ) ) ( not ( = ?auto_12289 ?auto_12271 ) ) ( not ( = ?auto_12289 ?auto_12284 ) ) ( not ( = ?auto_12283 ?auto_12278 ) ) ( not ( = ?auto_12283 ?auto_12277 ) ) ( not ( = ?auto_12283 ?auto_12265 ) ) ( not ( = ?auto_12283 ?auto_12273 ) ) ( not ( = ?auto_12283 ?auto_12276 ) ) ( not ( = ?auto_12283 ?auto_12270 ) ) ( not ( = ?auto_12283 ?auto_12275 ) ) ( not ( = ?auto_12283 ?auto_12269 ) ) ( not ( = ?auto_12282 ?auto_12264 ) ) ( not ( = ?auto_12282 ?auto_12263 ) ) ( not ( = ?auto_12282 ?auto_12286 ) ) ( not ( = ?auto_12282 ?auto_12267 ) ) ( not ( = ?auto_12282 ?auto_12287 ) ) ( not ( = ?auto_12282 ?auto_12268 ) ) ( not ( = ?auto_12282 ?auto_12285 ) ) ( not ( = ?auto_12282 ?auto_12274 ) ) ( not ( = ?auto_12282 ?auto_12272 ) ) ( not ( = ?auto_12282 ?auto_12288 ) ) ( not ( = ?auto_12242 ?auto_12254 ) ) ( not ( = ?auto_12242 ?auto_12255 ) ) ( not ( = ?auto_12243 ?auto_12254 ) ) ( not ( = ?auto_12243 ?auto_12255 ) ) ( not ( = ?auto_12244 ?auto_12254 ) ) ( not ( = ?auto_12244 ?auto_12255 ) ) ( not ( = ?auto_12245 ?auto_12254 ) ) ( not ( = ?auto_12245 ?auto_12255 ) ) ( not ( = ?auto_12246 ?auto_12254 ) ) ( not ( = ?auto_12246 ?auto_12255 ) ) ( not ( = ?auto_12249 ?auto_12254 ) ) ( not ( = ?auto_12249 ?auto_12255 ) ) ( not ( = ?auto_12247 ?auto_12254 ) ) ( not ( = ?auto_12247 ?auto_12255 ) ) ( not ( = ?auto_12251 ?auto_12254 ) ) ( not ( = ?auto_12251 ?auto_12255 ) ) ( not ( = ?auto_12250 ?auto_12254 ) ) ( not ( = ?auto_12250 ?auto_12255 ) ) ( not ( = ?auto_12248 ?auto_12254 ) ) ( not ( = ?auto_12248 ?auto_12255 ) ) ( not ( = ?auto_12253 ?auto_12254 ) ) ( not ( = ?auto_12253 ?auto_12255 ) ) ( not ( = ?auto_12254 ?auto_12282 ) ) ( not ( = ?auto_12254 ?auto_12264 ) ) ( not ( = ?auto_12254 ?auto_12263 ) ) ( not ( = ?auto_12254 ?auto_12286 ) ) ( not ( = ?auto_12254 ?auto_12267 ) ) ( not ( = ?auto_12254 ?auto_12287 ) ) ( not ( = ?auto_12254 ?auto_12268 ) ) ( not ( = ?auto_12254 ?auto_12285 ) ) ( not ( = ?auto_12254 ?auto_12274 ) ) ( not ( = ?auto_12254 ?auto_12272 ) ) ( not ( = ?auto_12254 ?auto_12288 ) ) ( not ( = ?auto_12258 ?auto_12289 ) ) ( not ( = ?auto_12258 ?auto_12266 ) ) ( not ( = ?auto_12258 ?auto_12280 ) ) ( not ( = ?auto_12258 ?auto_12279 ) ) ( not ( = ?auto_12258 ?auto_12281 ) ) ( not ( = ?auto_12258 ?auto_12261 ) ) ( not ( = ?auto_12258 ?auto_12262 ) ) ( not ( = ?auto_12258 ?auto_12271 ) ) ( not ( = ?auto_12258 ?auto_12284 ) ) ( not ( = ?auto_12260 ?auto_12283 ) ) ( not ( = ?auto_12260 ?auto_12278 ) ) ( not ( = ?auto_12260 ?auto_12277 ) ) ( not ( = ?auto_12260 ?auto_12265 ) ) ( not ( = ?auto_12260 ?auto_12273 ) ) ( not ( = ?auto_12260 ?auto_12276 ) ) ( not ( = ?auto_12260 ?auto_12270 ) ) ( not ( = ?auto_12260 ?auto_12275 ) ) ( not ( = ?auto_12260 ?auto_12269 ) ) ( not ( = ?auto_12255 ?auto_12282 ) ) ( not ( = ?auto_12255 ?auto_12264 ) ) ( not ( = ?auto_12255 ?auto_12263 ) ) ( not ( = ?auto_12255 ?auto_12286 ) ) ( not ( = ?auto_12255 ?auto_12267 ) ) ( not ( = ?auto_12255 ?auto_12287 ) ) ( not ( = ?auto_12255 ?auto_12268 ) ) ( not ( = ?auto_12255 ?auto_12285 ) ) ( not ( = ?auto_12255 ?auto_12274 ) ) ( not ( = ?auto_12255 ?auto_12272 ) ) ( not ( = ?auto_12255 ?auto_12288 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_12242 ?auto_12243 ?auto_12244 ?auto_12245 ?auto_12246 ?auto_12249 ?auto_12247 ?auto_12251 ?auto_12250 ?auto_12248 ?auto_12253 ?auto_12252 )
      ( MAKE-1CRATE ?auto_12252 ?auto_12254 )
      ( MAKE-12CRATE-VERIFY ?auto_12242 ?auto_12243 ?auto_12244 ?auto_12245 ?auto_12246 ?auto_12249 ?auto_12247 ?auto_12251 ?auto_12250 ?auto_12248 ?auto_12253 ?auto_12252 ?auto_12254 ) )
  )

)

