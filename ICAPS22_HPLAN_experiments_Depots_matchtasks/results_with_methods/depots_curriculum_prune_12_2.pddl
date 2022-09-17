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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11787 - SURFACE
      ?auto_11788 - SURFACE
      ?auto_11789 - SURFACE
    )
    :vars
    (
      ?auto_11793 - HOIST
      ?auto_11790 - PLACE
      ?auto_11791 - PLACE
      ?auto_11795 - HOIST
      ?auto_11792 - SURFACE
      ?auto_11798 - PLACE
      ?auto_11797 - HOIST
      ?auto_11796 - SURFACE
      ?auto_11794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11793 ?auto_11790 ) ( IS-CRATE ?auto_11789 ) ( not ( = ?auto_11791 ?auto_11790 ) ) ( HOIST-AT ?auto_11795 ?auto_11791 ) ( AVAILABLE ?auto_11795 ) ( SURFACE-AT ?auto_11789 ?auto_11791 ) ( ON ?auto_11789 ?auto_11792 ) ( CLEAR ?auto_11789 ) ( not ( = ?auto_11788 ?auto_11789 ) ) ( not ( = ?auto_11788 ?auto_11792 ) ) ( not ( = ?auto_11789 ?auto_11792 ) ) ( not ( = ?auto_11793 ?auto_11795 ) ) ( SURFACE-AT ?auto_11787 ?auto_11790 ) ( CLEAR ?auto_11787 ) ( IS-CRATE ?auto_11788 ) ( AVAILABLE ?auto_11793 ) ( not ( = ?auto_11798 ?auto_11790 ) ) ( HOIST-AT ?auto_11797 ?auto_11798 ) ( AVAILABLE ?auto_11797 ) ( SURFACE-AT ?auto_11788 ?auto_11798 ) ( ON ?auto_11788 ?auto_11796 ) ( CLEAR ?auto_11788 ) ( TRUCK-AT ?auto_11794 ?auto_11790 ) ( not ( = ?auto_11787 ?auto_11788 ) ) ( not ( = ?auto_11787 ?auto_11796 ) ) ( not ( = ?auto_11788 ?auto_11796 ) ) ( not ( = ?auto_11793 ?auto_11797 ) ) ( not ( = ?auto_11787 ?auto_11789 ) ) ( not ( = ?auto_11787 ?auto_11792 ) ) ( not ( = ?auto_11789 ?auto_11796 ) ) ( not ( = ?auto_11791 ?auto_11798 ) ) ( not ( = ?auto_11795 ?auto_11797 ) ) ( not ( = ?auto_11792 ?auto_11796 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11787 ?auto_11788 )
      ( MAKE-1CRATE ?auto_11788 ?auto_11789 )
      ( MAKE-2CRATE-VERIFY ?auto_11787 ?auto_11788 ?auto_11789 ) )
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
      ?auto_11820 - HOIST
      ?auto_11818 - PLACE
      ?auto_11822 - PLACE
      ?auto_11817 - HOIST
      ?auto_11821 - SURFACE
      ?auto_11823 - PLACE
      ?auto_11824 - HOIST
      ?auto_11825 - SURFACE
      ?auto_11826 - SURFACE
      ?auto_11819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11820 ?auto_11818 ) ( IS-CRATE ?auto_11816 ) ( not ( = ?auto_11822 ?auto_11818 ) ) ( HOIST-AT ?auto_11817 ?auto_11822 ) ( SURFACE-AT ?auto_11816 ?auto_11822 ) ( ON ?auto_11816 ?auto_11821 ) ( CLEAR ?auto_11816 ) ( not ( = ?auto_11815 ?auto_11816 ) ) ( not ( = ?auto_11815 ?auto_11821 ) ) ( not ( = ?auto_11816 ?auto_11821 ) ) ( not ( = ?auto_11820 ?auto_11817 ) ) ( IS-CRATE ?auto_11815 ) ( not ( = ?auto_11823 ?auto_11818 ) ) ( HOIST-AT ?auto_11824 ?auto_11823 ) ( AVAILABLE ?auto_11824 ) ( SURFACE-AT ?auto_11815 ?auto_11823 ) ( ON ?auto_11815 ?auto_11825 ) ( CLEAR ?auto_11815 ) ( not ( = ?auto_11814 ?auto_11815 ) ) ( not ( = ?auto_11814 ?auto_11825 ) ) ( not ( = ?auto_11815 ?auto_11825 ) ) ( not ( = ?auto_11820 ?auto_11824 ) ) ( SURFACE-AT ?auto_11813 ?auto_11818 ) ( CLEAR ?auto_11813 ) ( IS-CRATE ?auto_11814 ) ( AVAILABLE ?auto_11820 ) ( AVAILABLE ?auto_11817 ) ( SURFACE-AT ?auto_11814 ?auto_11822 ) ( ON ?auto_11814 ?auto_11826 ) ( CLEAR ?auto_11814 ) ( TRUCK-AT ?auto_11819 ?auto_11818 ) ( not ( = ?auto_11813 ?auto_11814 ) ) ( not ( = ?auto_11813 ?auto_11826 ) ) ( not ( = ?auto_11814 ?auto_11826 ) ) ( not ( = ?auto_11813 ?auto_11815 ) ) ( not ( = ?auto_11813 ?auto_11825 ) ) ( not ( = ?auto_11815 ?auto_11826 ) ) ( not ( = ?auto_11823 ?auto_11822 ) ) ( not ( = ?auto_11824 ?auto_11817 ) ) ( not ( = ?auto_11825 ?auto_11826 ) ) ( not ( = ?auto_11813 ?auto_11816 ) ) ( not ( = ?auto_11813 ?auto_11821 ) ) ( not ( = ?auto_11814 ?auto_11816 ) ) ( not ( = ?auto_11814 ?auto_11821 ) ) ( not ( = ?auto_11816 ?auto_11825 ) ) ( not ( = ?auto_11816 ?auto_11826 ) ) ( not ( = ?auto_11821 ?auto_11825 ) ) ( not ( = ?auto_11821 ?auto_11826 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11813 ?auto_11814 ?auto_11815 )
      ( MAKE-1CRATE ?auto_11815 ?auto_11816 )
      ( MAKE-3CRATE-VERIFY ?auto_11813 ?auto_11814 ?auto_11815 ?auto_11816 ) )
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
      ?auto_11851 - HOIST
      ?auto_11849 - PLACE
      ?auto_11852 - PLACE
      ?auto_11848 - HOIST
      ?auto_11850 - SURFACE
      ?auto_11856 - PLACE
      ?auto_11853 - HOIST
      ?auto_11854 - SURFACE
      ?auto_11857 - PLACE
      ?auto_11858 - HOIST
      ?auto_11859 - SURFACE
      ?auto_11855 - SURFACE
      ?auto_11847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11851 ?auto_11849 ) ( IS-CRATE ?auto_11846 ) ( not ( = ?auto_11852 ?auto_11849 ) ) ( HOIST-AT ?auto_11848 ?auto_11852 ) ( AVAILABLE ?auto_11848 ) ( SURFACE-AT ?auto_11846 ?auto_11852 ) ( ON ?auto_11846 ?auto_11850 ) ( CLEAR ?auto_11846 ) ( not ( = ?auto_11845 ?auto_11846 ) ) ( not ( = ?auto_11845 ?auto_11850 ) ) ( not ( = ?auto_11846 ?auto_11850 ) ) ( not ( = ?auto_11851 ?auto_11848 ) ) ( IS-CRATE ?auto_11845 ) ( not ( = ?auto_11856 ?auto_11849 ) ) ( HOIST-AT ?auto_11853 ?auto_11856 ) ( SURFACE-AT ?auto_11845 ?auto_11856 ) ( ON ?auto_11845 ?auto_11854 ) ( CLEAR ?auto_11845 ) ( not ( = ?auto_11844 ?auto_11845 ) ) ( not ( = ?auto_11844 ?auto_11854 ) ) ( not ( = ?auto_11845 ?auto_11854 ) ) ( not ( = ?auto_11851 ?auto_11853 ) ) ( IS-CRATE ?auto_11844 ) ( not ( = ?auto_11857 ?auto_11849 ) ) ( HOIST-AT ?auto_11858 ?auto_11857 ) ( AVAILABLE ?auto_11858 ) ( SURFACE-AT ?auto_11844 ?auto_11857 ) ( ON ?auto_11844 ?auto_11859 ) ( CLEAR ?auto_11844 ) ( not ( = ?auto_11843 ?auto_11844 ) ) ( not ( = ?auto_11843 ?auto_11859 ) ) ( not ( = ?auto_11844 ?auto_11859 ) ) ( not ( = ?auto_11851 ?auto_11858 ) ) ( SURFACE-AT ?auto_11842 ?auto_11849 ) ( CLEAR ?auto_11842 ) ( IS-CRATE ?auto_11843 ) ( AVAILABLE ?auto_11851 ) ( AVAILABLE ?auto_11853 ) ( SURFACE-AT ?auto_11843 ?auto_11856 ) ( ON ?auto_11843 ?auto_11855 ) ( CLEAR ?auto_11843 ) ( TRUCK-AT ?auto_11847 ?auto_11849 ) ( not ( = ?auto_11842 ?auto_11843 ) ) ( not ( = ?auto_11842 ?auto_11855 ) ) ( not ( = ?auto_11843 ?auto_11855 ) ) ( not ( = ?auto_11842 ?auto_11844 ) ) ( not ( = ?auto_11842 ?auto_11859 ) ) ( not ( = ?auto_11844 ?auto_11855 ) ) ( not ( = ?auto_11857 ?auto_11856 ) ) ( not ( = ?auto_11858 ?auto_11853 ) ) ( not ( = ?auto_11859 ?auto_11855 ) ) ( not ( = ?auto_11842 ?auto_11845 ) ) ( not ( = ?auto_11842 ?auto_11854 ) ) ( not ( = ?auto_11843 ?auto_11845 ) ) ( not ( = ?auto_11843 ?auto_11854 ) ) ( not ( = ?auto_11845 ?auto_11859 ) ) ( not ( = ?auto_11845 ?auto_11855 ) ) ( not ( = ?auto_11854 ?auto_11859 ) ) ( not ( = ?auto_11854 ?auto_11855 ) ) ( not ( = ?auto_11842 ?auto_11846 ) ) ( not ( = ?auto_11842 ?auto_11850 ) ) ( not ( = ?auto_11843 ?auto_11846 ) ) ( not ( = ?auto_11843 ?auto_11850 ) ) ( not ( = ?auto_11844 ?auto_11846 ) ) ( not ( = ?auto_11844 ?auto_11850 ) ) ( not ( = ?auto_11846 ?auto_11854 ) ) ( not ( = ?auto_11846 ?auto_11859 ) ) ( not ( = ?auto_11846 ?auto_11855 ) ) ( not ( = ?auto_11852 ?auto_11856 ) ) ( not ( = ?auto_11852 ?auto_11857 ) ) ( not ( = ?auto_11848 ?auto_11853 ) ) ( not ( = ?auto_11848 ?auto_11858 ) ) ( not ( = ?auto_11850 ?auto_11854 ) ) ( not ( = ?auto_11850 ?auto_11859 ) ) ( not ( = ?auto_11850 ?auto_11855 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_11842 ?auto_11843 ?auto_11844 ?auto_11845 )
      ( MAKE-1CRATE ?auto_11845 ?auto_11846 )
      ( MAKE-4CRATE-VERIFY ?auto_11842 ?auto_11843 ?auto_11844 ?auto_11845 ?auto_11846 ) )
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
      ?auto_11882 - PLACE
      ?auto_11883 - PLACE
      ?auto_11887 - HOIST
      ?auto_11884 - SURFACE
      ?auto_11897 - PLACE
      ?auto_11890 - HOIST
      ?auto_11896 - SURFACE
      ?auto_11891 - PLACE
      ?auto_11895 - HOIST
      ?auto_11892 - SURFACE
      ?auto_11888 - PLACE
      ?auto_11889 - HOIST
      ?auto_11894 - SURFACE
      ?auto_11893 - SURFACE
      ?auto_11885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11886 ?auto_11882 ) ( IS-CRATE ?auto_11881 ) ( not ( = ?auto_11883 ?auto_11882 ) ) ( HOIST-AT ?auto_11887 ?auto_11883 ) ( AVAILABLE ?auto_11887 ) ( SURFACE-AT ?auto_11881 ?auto_11883 ) ( ON ?auto_11881 ?auto_11884 ) ( CLEAR ?auto_11881 ) ( not ( = ?auto_11880 ?auto_11881 ) ) ( not ( = ?auto_11880 ?auto_11884 ) ) ( not ( = ?auto_11881 ?auto_11884 ) ) ( not ( = ?auto_11886 ?auto_11887 ) ) ( IS-CRATE ?auto_11880 ) ( not ( = ?auto_11897 ?auto_11882 ) ) ( HOIST-AT ?auto_11890 ?auto_11897 ) ( AVAILABLE ?auto_11890 ) ( SURFACE-AT ?auto_11880 ?auto_11897 ) ( ON ?auto_11880 ?auto_11896 ) ( CLEAR ?auto_11880 ) ( not ( = ?auto_11879 ?auto_11880 ) ) ( not ( = ?auto_11879 ?auto_11896 ) ) ( not ( = ?auto_11880 ?auto_11896 ) ) ( not ( = ?auto_11886 ?auto_11890 ) ) ( IS-CRATE ?auto_11879 ) ( not ( = ?auto_11891 ?auto_11882 ) ) ( HOIST-AT ?auto_11895 ?auto_11891 ) ( SURFACE-AT ?auto_11879 ?auto_11891 ) ( ON ?auto_11879 ?auto_11892 ) ( CLEAR ?auto_11879 ) ( not ( = ?auto_11878 ?auto_11879 ) ) ( not ( = ?auto_11878 ?auto_11892 ) ) ( not ( = ?auto_11879 ?auto_11892 ) ) ( not ( = ?auto_11886 ?auto_11895 ) ) ( IS-CRATE ?auto_11878 ) ( not ( = ?auto_11888 ?auto_11882 ) ) ( HOIST-AT ?auto_11889 ?auto_11888 ) ( AVAILABLE ?auto_11889 ) ( SURFACE-AT ?auto_11878 ?auto_11888 ) ( ON ?auto_11878 ?auto_11894 ) ( CLEAR ?auto_11878 ) ( not ( = ?auto_11877 ?auto_11878 ) ) ( not ( = ?auto_11877 ?auto_11894 ) ) ( not ( = ?auto_11878 ?auto_11894 ) ) ( not ( = ?auto_11886 ?auto_11889 ) ) ( SURFACE-AT ?auto_11876 ?auto_11882 ) ( CLEAR ?auto_11876 ) ( IS-CRATE ?auto_11877 ) ( AVAILABLE ?auto_11886 ) ( AVAILABLE ?auto_11895 ) ( SURFACE-AT ?auto_11877 ?auto_11891 ) ( ON ?auto_11877 ?auto_11893 ) ( CLEAR ?auto_11877 ) ( TRUCK-AT ?auto_11885 ?auto_11882 ) ( not ( = ?auto_11876 ?auto_11877 ) ) ( not ( = ?auto_11876 ?auto_11893 ) ) ( not ( = ?auto_11877 ?auto_11893 ) ) ( not ( = ?auto_11876 ?auto_11878 ) ) ( not ( = ?auto_11876 ?auto_11894 ) ) ( not ( = ?auto_11878 ?auto_11893 ) ) ( not ( = ?auto_11888 ?auto_11891 ) ) ( not ( = ?auto_11889 ?auto_11895 ) ) ( not ( = ?auto_11894 ?auto_11893 ) ) ( not ( = ?auto_11876 ?auto_11879 ) ) ( not ( = ?auto_11876 ?auto_11892 ) ) ( not ( = ?auto_11877 ?auto_11879 ) ) ( not ( = ?auto_11877 ?auto_11892 ) ) ( not ( = ?auto_11879 ?auto_11894 ) ) ( not ( = ?auto_11879 ?auto_11893 ) ) ( not ( = ?auto_11892 ?auto_11894 ) ) ( not ( = ?auto_11892 ?auto_11893 ) ) ( not ( = ?auto_11876 ?auto_11880 ) ) ( not ( = ?auto_11876 ?auto_11896 ) ) ( not ( = ?auto_11877 ?auto_11880 ) ) ( not ( = ?auto_11877 ?auto_11896 ) ) ( not ( = ?auto_11878 ?auto_11880 ) ) ( not ( = ?auto_11878 ?auto_11896 ) ) ( not ( = ?auto_11880 ?auto_11892 ) ) ( not ( = ?auto_11880 ?auto_11894 ) ) ( not ( = ?auto_11880 ?auto_11893 ) ) ( not ( = ?auto_11897 ?auto_11891 ) ) ( not ( = ?auto_11897 ?auto_11888 ) ) ( not ( = ?auto_11890 ?auto_11895 ) ) ( not ( = ?auto_11890 ?auto_11889 ) ) ( not ( = ?auto_11896 ?auto_11892 ) ) ( not ( = ?auto_11896 ?auto_11894 ) ) ( not ( = ?auto_11896 ?auto_11893 ) ) ( not ( = ?auto_11876 ?auto_11881 ) ) ( not ( = ?auto_11876 ?auto_11884 ) ) ( not ( = ?auto_11877 ?auto_11881 ) ) ( not ( = ?auto_11877 ?auto_11884 ) ) ( not ( = ?auto_11878 ?auto_11881 ) ) ( not ( = ?auto_11878 ?auto_11884 ) ) ( not ( = ?auto_11879 ?auto_11881 ) ) ( not ( = ?auto_11879 ?auto_11884 ) ) ( not ( = ?auto_11881 ?auto_11896 ) ) ( not ( = ?auto_11881 ?auto_11892 ) ) ( not ( = ?auto_11881 ?auto_11894 ) ) ( not ( = ?auto_11881 ?auto_11893 ) ) ( not ( = ?auto_11883 ?auto_11897 ) ) ( not ( = ?auto_11883 ?auto_11891 ) ) ( not ( = ?auto_11883 ?auto_11888 ) ) ( not ( = ?auto_11887 ?auto_11890 ) ) ( not ( = ?auto_11887 ?auto_11895 ) ) ( not ( = ?auto_11887 ?auto_11889 ) ) ( not ( = ?auto_11884 ?auto_11896 ) ) ( not ( = ?auto_11884 ?auto_11892 ) ) ( not ( = ?auto_11884 ?auto_11894 ) ) ( not ( = ?auto_11884 ?auto_11893 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_11876 ?auto_11877 ?auto_11878 ?auto_11879 ?auto_11880 )
      ( MAKE-1CRATE ?auto_11880 ?auto_11881 )
      ( MAKE-5CRATE-VERIFY ?auto_11876 ?auto_11877 ?auto_11878 ?auto_11879 ?auto_11880 ?auto_11881 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_11915 - SURFACE
      ?auto_11916 - SURFACE
      ?auto_11917 - SURFACE
      ?auto_11918 - SURFACE
      ?auto_11919 - SURFACE
      ?auto_11920 - SURFACE
      ?auto_11921 - SURFACE
    )
    :vars
    (
      ?auto_11927 - HOIST
      ?auto_11922 - PLACE
      ?auto_11923 - PLACE
      ?auto_11925 - HOIST
      ?auto_11926 - SURFACE
      ?auto_11934 - PLACE
      ?auto_11933 - HOIST
      ?auto_11935 - SURFACE
      ?auto_11929 - PLACE
      ?auto_11932 - HOIST
      ?auto_11938 - SURFACE
      ?auto_11937 - SURFACE
      ?auto_11930 - PLACE
      ?auto_11931 - HOIST
      ?auto_11928 - SURFACE
      ?auto_11936 - SURFACE
      ?auto_11924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11927 ?auto_11922 ) ( IS-CRATE ?auto_11921 ) ( not ( = ?auto_11923 ?auto_11922 ) ) ( HOIST-AT ?auto_11925 ?auto_11923 ) ( SURFACE-AT ?auto_11921 ?auto_11923 ) ( ON ?auto_11921 ?auto_11926 ) ( CLEAR ?auto_11921 ) ( not ( = ?auto_11920 ?auto_11921 ) ) ( not ( = ?auto_11920 ?auto_11926 ) ) ( not ( = ?auto_11921 ?auto_11926 ) ) ( not ( = ?auto_11927 ?auto_11925 ) ) ( IS-CRATE ?auto_11920 ) ( not ( = ?auto_11934 ?auto_11922 ) ) ( HOIST-AT ?auto_11933 ?auto_11934 ) ( AVAILABLE ?auto_11933 ) ( SURFACE-AT ?auto_11920 ?auto_11934 ) ( ON ?auto_11920 ?auto_11935 ) ( CLEAR ?auto_11920 ) ( not ( = ?auto_11919 ?auto_11920 ) ) ( not ( = ?auto_11919 ?auto_11935 ) ) ( not ( = ?auto_11920 ?auto_11935 ) ) ( not ( = ?auto_11927 ?auto_11933 ) ) ( IS-CRATE ?auto_11919 ) ( not ( = ?auto_11929 ?auto_11922 ) ) ( HOIST-AT ?auto_11932 ?auto_11929 ) ( AVAILABLE ?auto_11932 ) ( SURFACE-AT ?auto_11919 ?auto_11929 ) ( ON ?auto_11919 ?auto_11938 ) ( CLEAR ?auto_11919 ) ( not ( = ?auto_11918 ?auto_11919 ) ) ( not ( = ?auto_11918 ?auto_11938 ) ) ( not ( = ?auto_11919 ?auto_11938 ) ) ( not ( = ?auto_11927 ?auto_11932 ) ) ( IS-CRATE ?auto_11918 ) ( SURFACE-AT ?auto_11918 ?auto_11923 ) ( ON ?auto_11918 ?auto_11937 ) ( CLEAR ?auto_11918 ) ( not ( = ?auto_11917 ?auto_11918 ) ) ( not ( = ?auto_11917 ?auto_11937 ) ) ( not ( = ?auto_11918 ?auto_11937 ) ) ( IS-CRATE ?auto_11917 ) ( not ( = ?auto_11930 ?auto_11922 ) ) ( HOIST-AT ?auto_11931 ?auto_11930 ) ( AVAILABLE ?auto_11931 ) ( SURFACE-AT ?auto_11917 ?auto_11930 ) ( ON ?auto_11917 ?auto_11928 ) ( CLEAR ?auto_11917 ) ( not ( = ?auto_11916 ?auto_11917 ) ) ( not ( = ?auto_11916 ?auto_11928 ) ) ( not ( = ?auto_11917 ?auto_11928 ) ) ( not ( = ?auto_11927 ?auto_11931 ) ) ( SURFACE-AT ?auto_11915 ?auto_11922 ) ( CLEAR ?auto_11915 ) ( IS-CRATE ?auto_11916 ) ( AVAILABLE ?auto_11927 ) ( AVAILABLE ?auto_11925 ) ( SURFACE-AT ?auto_11916 ?auto_11923 ) ( ON ?auto_11916 ?auto_11936 ) ( CLEAR ?auto_11916 ) ( TRUCK-AT ?auto_11924 ?auto_11922 ) ( not ( = ?auto_11915 ?auto_11916 ) ) ( not ( = ?auto_11915 ?auto_11936 ) ) ( not ( = ?auto_11916 ?auto_11936 ) ) ( not ( = ?auto_11915 ?auto_11917 ) ) ( not ( = ?auto_11915 ?auto_11928 ) ) ( not ( = ?auto_11917 ?auto_11936 ) ) ( not ( = ?auto_11930 ?auto_11923 ) ) ( not ( = ?auto_11931 ?auto_11925 ) ) ( not ( = ?auto_11928 ?auto_11936 ) ) ( not ( = ?auto_11915 ?auto_11918 ) ) ( not ( = ?auto_11915 ?auto_11937 ) ) ( not ( = ?auto_11916 ?auto_11918 ) ) ( not ( = ?auto_11916 ?auto_11937 ) ) ( not ( = ?auto_11918 ?auto_11928 ) ) ( not ( = ?auto_11918 ?auto_11936 ) ) ( not ( = ?auto_11937 ?auto_11928 ) ) ( not ( = ?auto_11937 ?auto_11936 ) ) ( not ( = ?auto_11915 ?auto_11919 ) ) ( not ( = ?auto_11915 ?auto_11938 ) ) ( not ( = ?auto_11916 ?auto_11919 ) ) ( not ( = ?auto_11916 ?auto_11938 ) ) ( not ( = ?auto_11917 ?auto_11919 ) ) ( not ( = ?auto_11917 ?auto_11938 ) ) ( not ( = ?auto_11919 ?auto_11937 ) ) ( not ( = ?auto_11919 ?auto_11928 ) ) ( not ( = ?auto_11919 ?auto_11936 ) ) ( not ( = ?auto_11929 ?auto_11923 ) ) ( not ( = ?auto_11929 ?auto_11930 ) ) ( not ( = ?auto_11932 ?auto_11925 ) ) ( not ( = ?auto_11932 ?auto_11931 ) ) ( not ( = ?auto_11938 ?auto_11937 ) ) ( not ( = ?auto_11938 ?auto_11928 ) ) ( not ( = ?auto_11938 ?auto_11936 ) ) ( not ( = ?auto_11915 ?auto_11920 ) ) ( not ( = ?auto_11915 ?auto_11935 ) ) ( not ( = ?auto_11916 ?auto_11920 ) ) ( not ( = ?auto_11916 ?auto_11935 ) ) ( not ( = ?auto_11917 ?auto_11920 ) ) ( not ( = ?auto_11917 ?auto_11935 ) ) ( not ( = ?auto_11918 ?auto_11920 ) ) ( not ( = ?auto_11918 ?auto_11935 ) ) ( not ( = ?auto_11920 ?auto_11938 ) ) ( not ( = ?auto_11920 ?auto_11937 ) ) ( not ( = ?auto_11920 ?auto_11928 ) ) ( not ( = ?auto_11920 ?auto_11936 ) ) ( not ( = ?auto_11934 ?auto_11929 ) ) ( not ( = ?auto_11934 ?auto_11923 ) ) ( not ( = ?auto_11934 ?auto_11930 ) ) ( not ( = ?auto_11933 ?auto_11932 ) ) ( not ( = ?auto_11933 ?auto_11925 ) ) ( not ( = ?auto_11933 ?auto_11931 ) ) ( not ( = ?auto_11935 ?auto_11938 ) ) ( not ( = ?auto_11935 ?auto_11937 ) ) ( not ( = ?auto_11935 ?auto_11928 ) ) ( not ( = ?auto_11935 ?auto_11936 ) ) ( not ( = ?auto_11915 ?auto_11921 ) ) ( not ( = ?auto_11915 ?auto_11926 ) ) ( not ( = ?auto_11916 ?auto_11921 ) ) ( not ( = ?auto_11916 ?auto_11926 ) ) ( not ( = ?auto_11917 ?auto_11921 ) ) ( not ( = ?auto_11917 ?auto_11926 ) ) ( not ( = ?auto_11918 ?auto_11921 ) ) ( not ( = ?auto_11918 ?auto_11926 ) ) ( not ( = ?auto_11919 ?auto_11921 ) ) ( not ( = ?auto_11919 ?auto_11926 ) ) ( not ( = ?auto_11921 ?auto_11935 ) ) ( not ( = ?auto_11921 ?auto_11938 ) ) ( not ( = ?auto_11921 ?auto_11937 ) ) ( not ( = ?auto_11921 ?auto_11928 ) ) ( not ( = ?auto_11921 ?auto_11936 ) ) ( not ( = ?auto_11926 ?auto_11935 ) ) ( not ( = ?auto_11926 ?auto_11938 ) ) ( not ( = ?auto_11926 ?auto_11937 ) ) ( not ( = ?auto_11926 ?auto_11928 ) ) ( not ( = ?auto_11926 ?auto_11936 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_11915 ?auto_11916 ?auto_11917 ?auto_11918 ?auto_11919 ?auto_11920 )
      ( MAKE-1CRATE ?auto_11920 ?auto_11921 )
      ( MAKE-6CRATE-VERIFY ?auto_11915 ?auto_11916 ?auto_11917 ?auto_11918 ?auto_11919 ?auto_11920 ?auto_11921 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_11957 - SURFACE
      ?auto_11958 - SURFACE
      ?auto_11959 - SURFACE
      ?auto_11960 - SURFACE
      ?auto_11961 - SURFACE
      ?auto_11962 - SURFACE
      ?auto_11963 - SURFACE
      ?auto_11964 - SURFACE
    )
    :vars
    (
      ?auto_11967 - HOIST
      ?auto_11969 - PLACE
      ?auto_11965 - PLACE
      ?auto_11966 - HOIST
      ?auto_11968 - SURFACE
      ?auto_11973 - PLACE
      ?auto_11971 - HOIST
      ?auto_11972 - SURFACE
      ?auto_11982 - PLACE
      ?auto_11983 - HOIST
      ?auto_11981 - SURFACE
      ?auto_11975 - PLACE
      ?auto_11984 - HOIST
      ?auto_11979 - SURFACE
      ?auto_11980 - SURFACE
      ?auto_11976 - PLACE
      ?auto_11974 - HOIST
      ?auto_11977 - SURFACE
      ?auto_11978 - SURFACE
      ?auto_11970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11967 ?auto_11969 ) ( IS-CRATE ?auto_11964 ) ( not ( = ?auto_11965 ?auto_11969 ) ) ( HOIST-AT ?auto_11966 ?auto_11965 ) ( AVAILABLE ?auto_11966 ) ( SURFACE-AT ?auto_11964 ?auto_11965 ) ( ON ?auto_11964 ?auto_11968 ) ( CLEAR ?auto_11964 ) ( not ( = ?auto_11963 ?auto_11964 ) ) ( not ( = ?auto_11963 ?auto_11968 ) ) ( not ( = ?auto_11964 ?auto_11968 ) ) ( not ( = ?auto_11967 ?auto_11966 ) ) ( IS-CRATE ?auto_11963 ) ( not ( = ?auto_11973 ?auto_11969 ) ) ( HOIST-AT ?auto_11971 ?auto_11973 ) ( SURFACE-AT ?auto_11963 ?auto_11973 ) ( ON ?auto_11963 ?auto_11972 ) ( CLEAR ?auto_11963 ) ( not ( = ?auto_11962 ?auto_11963 ) ) ( not ( = ?auto_11962 ?auto_11972 ) ) ( not ( = ?auto_11963 ?auto_11972 ) ) ( not ( = ?auto_11967 ?auto_11971 ) ) ( IS-CRATE ?auto_11962 ) ( not ( = ?auto_11982 ?auto_11969 ) ) ( HOIST-AT ?auto_11983 ?auto_11982 ) ( AVAILABLE ?auto_11983 ) ( SURFACE-AT ?auto_11962 ?auto_11982 ) ( ON ?auto_11962 ?auto_11981 ) ( CLEAR ?auto_11962 ) ( not ( = ?auto_11961 ?auto_11962 ) ) ( not ( = ?auto_11961 ?auto_11981 ) ) ( not ( = ?auto_11962 ?auto_11981 ) ) ( not ( = ?auto_11967 ?auto_11983 ) ) ( IS-CRATE ?auto_11961 ) ( not ( = ?auto_11975 ?auto_11969 ) ) ( HOIST-AT ?auto_11984 ?auto_11975 ) ( AVAILABLE ?auto_11984 ) ( SURFACE-AT ?auto_11961 ?auto_11975 ) ( ON ?auto_11961 ?auto_11979 ) ( CLEAR ?auto_11961 ) ( not ( = ?auto_11960 ?auto_11961 ) ) ( not ( = ?auto_11960 ?auto_11979 ) ) ( not ( = ?auto_11961 ?auto_11979 ) ) ( not ( = ?auto_11967 ?auto_11984 ) ) ( IS-CRATE ?auto_11960 ) ( SURFACE-AT ?auto_11960 ?auto_11973 ) ( ON ?auto_11960 ?auto_11980 ) ( CLEAR ?auto_11960 ) ( not ( = ?auto_11959 ?auto_11960 ) ) ( not ( = ?auto_11959 ?auto_11980 ) ) ( not ( = ?auto_11960 ?auto_11980 ) ) ( IS-CRATE ?auto_11959 ) ( not ( = ?auto_11976 ?auto_11969 ) ) ( HOIST-AT ?auto_11974 ?auto_11976 ) ( AVAILABLE ?auto_11974 ) ( SURFACE-AT ?auto_11959 ?auto_11976 ) ( ON ?auto_11959 ?auto_11977 ) ( CLEAR ?auto_11959 ) ( not ( = ?auto_11958 ?auto_11959 ) ) ( not ( = ?auto_11958 ?auto_11977 ) ) ( not ( = ?auto_11959 ?auto_11977 ) ) ( not ( = ?auto_11967 ?auto_11974 ) ) ( SURFACE-AT ?auto_11957 ?auto_11969 ) ( CLEAR ?auto_11957 ) ( IS-CRATE ?auto_11958 ) ( AVAILABLE ?auto_11967 ) ( AVAILABLE ?auto_11971 ) ( SURFACE-AT ?auto_11958 ?auto_11973 ) ( ON ?auto_11958 ?auto_11978 ) ( CLEAR ?auto_11958 ) ( TRUCK-AT ?auto_11970 ?auto_11969 ) ( not ( = ?auto_11957 ?auto_11958 ) ) ( not ( = ?auto_11957 ?auto_11978 ) ) ( not ( = ?auto_11958 ?auto_11978 ) ) ( not ( = ?auto_11957 ?auto_11959 ) ) ( not ( = ?auto_11957 ?auto_11977 ) ) ( not ( = ?auto_11959 ?auto_11978 ) ) ( not ( = ?auto_11976 ?auto_11973 ) ) ( not ( = ?auto_11974 ?auto_11971 ) ) ( not ( = ?auto_11977 ?auto_11978 ) ) ( not ( = ?auto_11957 ?auto_11960 ) ) ( not ( = ?auto_11957 ?auto_11980 ) ) ( not ( = ?auto_11958 ?auto_11960 ) ) ( not ( = ?auto_11958 ?auto_11980 ) ) ( not ( = ?auto_11960 ?auto_11977 ) ) ( not ( = ?auto_11960 ?auto_11978 ) ) ( not ( = ?auto_11980 ?auto_11977 ) ) ( not ( = ?auto_11980 ?auto_11978 ) ) ( not ( = ?auto_11957 ?auto_11961 ) ) ( not ( = ?auto_11957 ?auto_11979 ) ) ( not ( = ?auto_11958 ?auto_11961 ) ) ( not ( = ?auto_11958 ?auto_11979 ) ) ( not ( = ?auto_11959 ?auto_11961 ) ) ( not ( = ?auto_11959 ?auto_11979 ) ) ( not ( = ?auto_11961 ?auto_11980 ) ) ( not ( = ?auto_11961 ?auto_11977 ) ) ( not ( = ?auto_11961 ?auto_11978 ) ) ( not ( = ?auto_11975 ?auto_11973 ) ) ( not ( = ?auto_11975 ?auto_11976 ) ) ( not ( = ?auto_11984 ?auto_11971 ) ) ( not ( = ?auto_11984 ?auto_11974 ) ) ( not ( = ?auto_11979 ?auto_11980 ) ) ( not ( = ?auto_11979 ?auto_11977 ) ) ( not ( = ?auto_11979 ?auto_11978 ) ) ( not ( = ?auto_11957 ?auto_11962 ) ) ( not ( = ?auto_11957 ?auto_11981 ) ) ( not ( = ?auto_11958 ?auto_11962 ) ) ( not ( = ?auto_11958 ?auto_11981 ) ) ( not ( = ?auto_11959 ?auto_11962 ) ) ( not ( = ?auto_11959 ?auto_11981 ) ) ( not ( = ?auto_11960 ?auto_11962 ) ) ( not ( = ?auto_11960 ?auto_11981 ) ) ( not ( = ?auto_11962 ?auto_11979 ) ) ( not ( = ?auto_11962 ?auto_11980 ) ) ( not ( = ?auto_11962 ?auto_11977 ) ) ( not ( = ?auto_11962 ?auto_11978 ) ) ( not ( = ?auto_11982 ?auto_11975 ) ) ( not ( = ?auto_11982 ?auto_11973 ) ) ( not ( = ?auto_11982 ?auto_11976 ) ) ( not ( = ?auto_11983 ?auto_11984 ) ) ( not ( = ?auto_11983 ?auto_11971 ) ) ( not ( = ?auto_11983 ?auto_11974 ) ) ( not ( = ?auto_11981 ?auto_11979 ) ) ( not ( = ?auto_11981 ?auto_11980 ) ) ( not ( = ?auto_11981 ?auto_11977 ) ) ( not ( = ?auto_11981 ?auto_11978 ) ) ( not ( = ?auto_11957 ?auto_11963 ) ) ( not ( = ?auto_11957 ?auto_11972 ) ) ( not ( = ?auto_11958 ?auto_11963 ) ) ( not ( = ?auto_11958 ?auto_11972 ) ) ( not ( = ?auto_11959 ?auto_11963 ) ) ( not ( = ?auto_11959 ?auto_11972 ) ) ( not ( = ?auto_11960 ?auto_11963 ) ) ( not ( = ?auto_11960 ?auto_11972 ) ) ( not ( = ?auto_11961 ?auto_11963 ) ) ( not ( = ?auto_11961 ?auto_11972 ) ) ( not ( = ?auto_11963 ?auto_11981 ) ) ( not ( = ?auto_11963 ?auto_11979 ) ) ( not ( = ?auto_11963 ?auto_11980 ) ) ( not ( = ?auto_11963 ?auto_11977 ) ) ( not ( = ?auto_11963 ?auto_11978 ) ) ( not ( = ?auto_11972 ?auto_11981 ) ) ( not ( = ?auto_11972 ?auto_11979 ) ) ( not ( = ?auto_11972 ?auto_11980 ) ) ( not ( = ?auto_11972 ?auto_11977 ) ) ( not ( = ?auto_11972 ?auto_11978 ) ) ( not ( = ?auto_11957 ?auto_11964 ) ) ( not ( = ?auto_11957 ?auto_11968 ) ) ( not ( = ?auto_11958 ?auto_11964 ) ) ( not ( = ?auto_11958 ?auto_11968 ) ) ( not ( = ?auto_11959 ?auto_11964 ) ) ( not ( = ?auto_11959 ?auto_11968 ) ) ( not ( = ?auto_11960 ?auto_11964 ) ) ( not ( = ?auto_11960 ?auto_11968 ) ) ( not ( = ?auto_11961 ?auto_11964 ) ) ( not ( = ?auto_11961 ?auto_11968 ) ) ( not ( = ?auto_11962 ?auto_11964 ) ) ( not ( = ?auto_11962 ?auto_11968 ) ) ( not ( = ?auto_11964 ?auto_11972 ) ) ( not ( = ?auto_11964 ?auto_11981 ) ) ( not ( = ?auto_11964 ?auto_11979 ) ) ( not ( = ?auto_11964 ?auto_11980 ) ) ( not ( = ?auto_11964 ?auto_11977 ) ) ( not ( = ?auto_11964 ?auto_11978 ) ) ( not ( = ?auto_11965 ?auto_11973 ) ) ( not ( = ?auto_11965 ?auto_11982 ) ) ( not ( = ?auto_11965 ?auto_11975 ) ) ( not ( = ?auto_11965 ?auto_11976 ) ) ( not ( = ?auto_11966 ?auto_11971 ) ) ( not ( = ?auto_11966 ?auto_11983 ) ) ( not ( = ?auto_11966 ?auto_11984 ) ) ( not ( = ?auto_11966 ?auto_11974 ) ) ( not ( = ?auto_11968 ?auto_11972 ) ) ( not ( = ?auto_11968 ?auto_11981 ) ) ( not ( = ?auto_11968 ?auto_11979 ) ) ( not ( = ?auto_11968 ?auto_11980 ) ) ( not ( = ?auto_11968 ?auto_11977 ) ) ( not ( = ?auto_11968 ?auto_11978 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_11957 ?auto_11958 ?auto_11959 ?auto_11960 ?auto_11961 ?auto_11962 ?auto_11963 )
      ( MAKE-1CRATE ?auto_11963 ?auto_11964 )
      ( MAKE-7CRATE-VERIFY ?auto_11957 ?auto_11958 ?auto_11959 ?auto_11960 ?auto_11961 ?auto_11962 ?auto_11963 ?auto_11964 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_12004 - SURFACE
      ?auto_12005 - SURFACE
      ?auto_12006 - SURFACE
      ?auto_12007 - SURFACE
      ?auto_12008 - SURFACE
      ?auto_12009 - SURFACE
      ?auto_12010 - SURFACE
      ?auto_12011 - SURFACE
      ?auto_12012 - SURFACE
    )
    :vars
    (
      ?auto_12014 - HOIST
      ?auto_12018 - PLACE
      ?auto_12016 - PLACE
      ?auto_12013 - HOIST
      ?auto_12017 - SURFACE
      ?auto_12023 - PLACE
      ?auto_12025 - HOIST
      ?auto_12026 - SURFACE
      ?auto_12029 - PLACE
      ?auto_12024 - HOIST
      ?auto_12028 - SURFACE
      ?auto_12033 - PLACE
      ?auto_12019 - HOIST
      ?auto_12031 - SURFACE
      ?auto_12035 - PLACE
      ?auto_12020 - HOIST
      ?auto_12030 - SURFACE
      ?auto_12032 - SURFACE
      ?auto_12034 - PLACE
      ?auto_12027 - HOIST
      ?auto_12022 - SURFACE
      ?auto_12021 - SURFACE
      ?auto_12015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12014 ?auto_12018 ) ( IS-CRATE ?auto_12012 ) ( not ( = ?auto_12016 ?auto_12018 ) ) ( HOIST-AT ?auto_12013 ?auto_12016 ) ( AVAILABLE ?auto_12013 ) ( SURFACE-AT ?auto_12012 ?auto_12016 ) ( ON ?auto_12012 ?auto_12017 ) ( CLEAR ?auto_12012 ) ( not ( = ?auto_12011 ?auto_12012 ) ) ( not ( = ?auto_12011 ?auto_12017 ) ) ( not ( = ?auto_12012 ?auto_12017 ) ) ( not ( = ?auto_12014 ?auto_12013 ) ) ( IS-CRATE ?auto_12011 ) ( not ( = ?auto_12023 ?auto_12018 ) ) ( HOIST-AT ?auto_12025 ?auto_12023 ) ( AVAILABLE ?auto_12025 ) ( SURFACE-AT ?auto_12011 ?auto_12023 ) ( ON ?auto_12011 ?auto_12026 ) ( CLEAR ?auto_12011 ) ( not ( = ?auto_12010 ?auto_12011 ) ) ( not ( = ?auto_12010 ?auto_12026 ) ) ( not ( = ?auto_12011 ?auto_12026 ) ) ( not ( = ?auto_12014 ?auto_12025 ) ) ( IS-CRATE ?auto_12010 ) ( not ( = ?auto_12029 ?auto_12018 ) ) ( HOIST-AT ?auto_12024 ?auto_12029 ) ( SURFACE-AT ?auto_12010 ?auto_12029 ) ( ON ?auto_12010 ?auto_12028 ) ( CLEAR ?auto_12010 ) ( not ( = ?auto_12009 ?auto_12010 ) ) ( not ( = ?auto_12009 ?auto_12028 ) ) ( not ( = ?auto_12010 ?auto_12028 ) ) ( not ( = ?auto_12014 ?auto_12024 ) ) ( IS-CRATE ?auto_12009 ) ( not ( = ?auto_12033 ?auto_12018 ) ) ( HOIST-AT ?auto_12019 ?auto_12033 ) ( AVAILABLE ?auto_12019 ) ( SURFACE-AT ?auto_12009 ?auto_12033 ) ( ON ?auto_12009 ?auto_12031 ) ( CLEAR ?auto_12009 ) ( not ( = ?auto_12008 ?auto_12009 ) ) ( not ( = ?auto_12008 ?auto_12031 ) ) ( not ( = ?auto_12009 ?auto_12031 ) ) ( not ( = ?auto_12014 ?auto_12019 ) ) ( IS-CRATE ?auto_12008 ) ( not ( = ?auto_12035 ?auto_12018 ) ) ( HOIST-AT ?auto_12020 ?auto_12035 ) ( AVAILABLE ?auto_12020 ) ( SURFACE-AT ?auto_12008 ?auto_12035 ) ( ON ?auto_12008 ?auto_12030 ) ( CLEAR ?auto_12008 ) ( not ( = ?auto_12007 ?auto_12008 ) ) ( not ( = ?auto_12007 ?auto_12030 ) ) ( not ( = ?auto_12008 ?auto_12030 ) ) ( not ( = ?auto_12014 ?auto_12020 ) ) ( IS-CRATE ?auto_12007 ) ( SURFACE-AT ?auto_12007 ?auto_12029 ) ( ON ?auto_12007 ?auto_12032 ) ( CLEAR ?auto_12007 ) ( not ( = ?auto_12006 ?auto_12007 ) ) ( not ( = ?auto_12006 ?auto_12032 ) ) ( not ( = ?auto_12007 ?auto_12032 ) ) ( IS-CRATE ?auto_12006 ) ( not ( = ?auto_12034 ?auto_12018 ) ) ( HOIST-AT ?auto_12027 ?auto_12034 ) ( AVAILABLE ?auto_12027 ) ( SURFACE-AT ?auto_12006 ?auto_12034 ) ( ON ?auto_12006 ?auto_12022 ) ( CLEAR ?auto_12006 ) ( not ( = ?auto_12005 ?auto_12006 ) ) ( not ( = ?auto_12005 ?auto_12022 ) ) ( not ( = ?auto_12006 ?auto_12022 ) ) ( not ( = ?auto_12014 ?auto_12027 ) ) ( SURFACE-AT ?auto_12004 ?auto_12018 ) ( CLEAR ?auto_12004 ) ( IS-CRATE ?auto_12005 ) ( AVAILABLE ?auto_12014 ) ( AVAILABLE ?auto_12024 ) ( SURFACE-AT ?auto_12005 ?auto_12029 ) ( ON ?auto_12005 ?auto_12021 ) ( CLEAR ?auto_12005 ) ( TRUCK-AT ?auto_12015 ?auto_12018 ) ( not ( = ?auto_12004 ?auto_12005 ) ) ( not ( = ?auto_12004 ?auto_12021 ) ) ( not ( = ?auto_12005 ?auto_12021 ) ) ( not ( = ?auto_12004 ?auto_12006 ) ) ( not ( = ?auto_12004 ?auto_12022 ) ) ( not ( = ?auto_12006 ?auto_12021 ) ) ( not ( = ?auto_12034 ?auto_12029 ) ) ( not ( = ?auto_12027 ?auto_12024 ) ) ( not ( = ?auto_12022 ?auto_12021 ) ) ( not ( = ?auto_12004 ?auto_12007 ) ) ( not ( = ?auto_12004 ?auto_12032 ) ) ( not ( = ?auto_12005 ?auto_12007 ) ) ( not ( = ?auto_12005 ?auto_12032 ) ) ( not ( = ?auto_12007 ?auto_12022 ) ) ( not ( = ?auto_12007 ?auto_12021 ) ) ( not ( = ?auto_12032 ?auto_12022 ) ) ( not ( = ?auto_12032 ?auto_12021 ) ) ( not ( = ?auto_12004 ?auto_12008 ) ) ( not ( = ?auto_12004 ?auto_12030 ) ) ( not ( = ?auto_12005 ?auto_12008 ) ) ( not ( = ?auto_12005 ?auto_12030 ) ) ( not ( = ?auto_12006 ?auto_12008 ) ) ( not ( = ?auto_12006 ?auto_12030 ) ) ( not ( = ?auto_12008 ?auto_12032 ) ) ( not ( = ?auto_12008 ?auto_12022 ) ) ( not ( = ?auto_12008 ?auto_12021 ) ) ( not ( = ?auto_12035 ?auto_12029 ) ) ( not ( = ?auto_12035 ?auto_12034 ) ) ( not ( = ?auto_12020 ?auto_12024 ) ) ( not ( = ?auto_12020 ?auto_12027 ) ) ( not ( = ?auto_12030 ?auto_12032 ) ) ( not ( = ?auto_12030 ?auto_12022 ) ) ( not ( = ?auto_12030 ?auto_12021 ) ) ( not ( = ?auto_12004 ?auto_12009 ) ) ( not ( = ?auto_12004 ?auto_12031 ) ) ( not ( = ?auto_12005 ?auto_12009 ) ) ( not ( = ?auto_12005 ?auto_12031 ) ) ( not ( = ?auto_12006 ?auto_12009 ) ) ( not ( = ?auto_12006 ?auto_12031 ) ) ( not ( = ?auto_12007 ?auto_12009 ) ) ( not ( = ?auto_12007 ?auto_12031 ) ) ( not ( = ?auto_12009 ?auto_12030 ) ) ( not ( = ?auto_12009 ?auto_12032 ) ) ( not ( = ?auto_12009 ?auto_12022 ) ) ( not ( = ?auto_12009 ?auto_12021 ) ) ( not ( = ?auto_12033 ?auto_12035 ) ) ( not ( = ?auto_12033 ?auto_12029 ) ) ( not ( = ?auto_12033 ?auto_12034 ) ) ( not ( = ?auto_12019 ?auto_12020 ) ) ( not ( = ?auto_12019 ?auto_12024 ) ) ( not ( = ?auto_12019 ?auto_12027 ) ) ( not ( = ?auto_12031 ?auto_12030 ) ) ( not ( = ?auto_12031 ?auto_12032 ) ) ( not ( = ?auto_12031 ?auto_12022 ) ) ( not ( = ?auto_12031 ?auto_12021 ) ) ( not ( = ?auto_12004 ?auto_12010 ) ) ( not ( = ?auto_12004 ?auto_12028 ) ) ( not ( = ?auto_12005 ?auto_12010 ) ) ( not ( = ?auto_12005 ?auto_12028 ) ) ( not ( = ?auto_12006 ?auto_12010 ) ) ( not ( = ?auto_12006 ?auto_12028 ) ) ( not ( = ?auto_12007 ?auto_12010 ) ) ( not ( = ?auto_12007 ?auto_12028 ) ) ( not ( = ?auto_12008 ?auto_12010 ) ) ( not ( = ?auto_12008 ?auto_12028 ) ) ( not ( = ?auto_12010 ?auto_12031 ) ) ( not ( = ?auto_12010 ?auto_12030 ) ) ( not ( = ?auto_12010 ?auto_12032 ) ) ( not ( = ?auto_12010 ?auto_12022 ) ) ( not ( = ?auto_12010 ?auto_12021 ) ) ( not ( = ?auto_12028 ?auto_12031 ) ) ( not ( = ?auto_12028 ?auto_12030 ) ) ( not ( = ?auto_12028 ?auto_12032 ) ) ( not ( = ?auto_12028 ?auto_12022 ) ) ( not ( = ?auto_12028 ?auto_12021 ) ) ( not ( = ?auto_12004 ?auto_12011 ) ) ( not ( = ?auto_12004 ?auto_12026 ) ) ( not ( = ?auto_12005 ?auto_12011 ) ) ( not ( = ?auto_12005 ?auto_12026 ) ) ( not ( = ?auto_12006 ?auto_12011 ) ) ( not ( = ?auto_12006 ?auto_12026 ) ) ( not ( = ?auto_12007 ?auto_12011 ) ) ( not ( = ?auto_12007 ?auto_12026 ) ) ( not ( = ?auto_12008 ?auto_12011 ) ) ( not ( = ?auto_12008 ?auto_12026 ) ) ( not ( = ?auto_12009 ?auto_12011 ) ) ( not ( = ?auto_12009 ?auto_12026 ) ) ( not ( = ?auto_12011 ?auto_12028 ) ) ( not ( = ?auto_12011 ?auto_12031 ) ) ( not ( = ?auto_12011 ?auto_12030 ) ) ( not ( = ?auto_12011 ?auto_12032 ) ) ( not ( = ?auto_12011 ?auto_12022 ) ) ( not ( = ?auto_12011 ?auto_12021 ) ) ( not ( = ?auto_12023 ?auto_12029 ) ) ( not ( = ?auto_12023 ?auto_12033 ) ) ( not ( = ?auto_12023 ?auto_12035 ) ) ( not ( = ?auto_12023 ?auto_12034 ) ) ( not ( = ?auto_12025 ?auto_12024 ) ) ( not ( = ?auto_12025 ?auto_12019 ) ) ( not ( = ?auto_12025 ?auto_12020 ) ) ( not ( = ?auto_12025 ?auto_12027 ) ) ( not ( = ?auto_12026 ?auto_12028 ) ) ( not ( = ?auto_12026 ?auto_12031 ) ) ( not ( = ?auto_12026 ?auto_12030 ) ) ( not ( = ?auto_12026 ?auto_12032 ) ) ( not ( = ?auto_12026 ?auto_12022 ) ) ( not ( = ?auto_12026 ?auto_12021 ) ) ( not ( = ?auto_12004 ?auto_12012 ) ) ( not ( = ?auto_12004 ?auto_12017 ) ) ( not ( = ?auto_12005 ?auto_12012 ) ) ( not ( = ?auto_12005 ?auto_12017 ) ) ( not ( = ?auto_12006 ?auto_12012 ) ) ( not ( = ?auto_12006 ?auto_12017 ) ) ( not ( = ?auto_12007 ?auto_12012 ) ) ( not ( = ?auto_12007 ?auto_12017 ) ) ( not ( = ?auto_12008 ?auto_12012 ) ) ( not ( = ?auto_12008 ?auto_12017 ) ) ( not ( = ?auto_12009 ?auto_12012 ) ) ( not ( = ?auto_12009 ?auto_12017 ) ) ( not ( = ?auto_12010 ?auto_12012 ) ) ( not ( = ?auto_12010 ?auto_12017 ) ) ( not ( = ?auto_12012 ?auto_12026 ) ) ( not ( = ?auto_12012 ?auto_12028 ) ) ( not ( = ?auto_12012 ?auto_12031 ) ) ( not ( = ?auto_12012 ?auto_12030 ) ) ( not ( = ?auto_12012 ?auto_12032 ) ) ( not ( = ?auto_12012 ?auto_12022 ) ) ( not ( = ?auto_12012 ?auto_12021 ) ) ( not ( = ?auto_12016 ?auto_12023 ) ) ( not ( = ?auto_12016 ?auto_12029 ) ) ( not ( = ?auto_12016 ?auto_12033 ) ) ( not ( = ?auto_12016 ?auto_12035 ) ) ( not ( = ?auto_12016 ?auto_12034 ) ) ( not ( = ?auto_12013 ?auto_12025 ) ) ( not ( = ?auto_12013 ?auto_12024 ) ) ( not ( = ?auto_12013 ?auto_12019 ) ) ( not ( = ?auto_12013 ?auto_12020 ) ) ( not ( = ?auto_12013 ?auto_12027 ) ) ( not ( = ?auto_12017 ?auto_12026 ) ) ( not ( = ?auto_12017 ?auto_12028 ) ) ( not ( = ?auto_12017 ?auto_12031 ) ) ( not ( = ?auto_12017 ?auto_12030 ) ) ( not ( = ?auto_12017 ?auto_12032 ) ) ( not ( = ?auto_12017 ?auto_12022 ) ) ( not ( = ?auto_12017 ?auto_12021 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_12004 ?auto_12005 ?auto_12006 ?auto_12007 ?auto_12008 ?auto_12009 ?auto_12010 ?auto_12011 )
      ( MAKE-1CRATE ?auto_12011 ?auto_12012 )
      ( MAKE-8CRATE-VERIFY ?auto_12004 ?auto_12005 ?auto_12006 ?auto_12007 ?auto_12008 ?auto_12009 ?auto_12010 ?auto_12011 ?auto_12012 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_12056 - SURFACE
      ?auto_12057 - SURFACE
      ?auto_12058 - SURFACE
      ?auto_12059 - SURFACE
      ?auto_12060 - SURFACE
      ?auto_12061 - SURFACE
      ?auto_12062 - SURFACE
      ?auto_12063 - SURFACE
      ?auto_12064 - SURFACE
      ?auto_12065 - SURFACE
    )
    :vars
    (
      ?auto_12070 - HOIST
      ?auto_12068 - PLACE
      ?auto_12069 - PLACE
      ?auto_12067 - HOIST
      ?auto_12071 - SURFACE
      ?auto_12080 - PLACE
      ?auto_12072 - HOIST
      ?auto_12083 - SURFACE
      ?auto_12078 - PLACE
      ?auto_12076 - HOIST
      ?auto_12075 - SURFACE
      ?auto_12089 - PLACE
      ?auto_12077 - HOIST
      ?auto_12085 - SURFACE
      ?auto_12084 - PLACE
      ?auto_12088 - HOIST
      ?auto_12073 - SURFACE
      ?auto_12087 - PLACE
      ?auto_12081 - HOIST
      ?auto_12086 - SURFACE
      ?auto_12074 - SURFACE
      ?auto_12091 - PLACE
      ?auto_12079 - HOIST
      ?auto_12090 - SURFACE
      ?auto_12082 - SURFACE
      ?auto_12066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12070 ?auto_12068 ) ( IS-CRATE ?auto_12065 ) ( not ( = ?auto_12069 ?auto_12068 ) ) ( HOIST-AT ?auto_12067 ?auto_12069 ) ( AVAILABLE ?auto_12067 ) ( SURFACE-AT ?auto_12065 ?auto_12069 ) ( ON ?auto_12065 ?auto_12071 ) ( CLEAR ?auto_12065 ) ( not ( = ?auto_12064 ?auto_12065 ) ) ( not ( = ?auto_12064 ?auto_12071 ) ) ( not ( = ?auto_12065 ?auto_12071 ) ) ( not ( = ?auto_12070 ?auto_12067 ) ) ( IS-CRATE ?auto_12064 ) ( not ( = ?auto_12080 ?auto_12068 ) ) ( HOIST-AT ?auto_12072 ?auto_12080 ) ( AVAILABLE ?auto_12072 ) ( SURFACE-AT ?auto_12064 ?auto_12080 ) ( ON ?auto_12064 ?auto_12083 ) ( CLEAR ?auto_12064 ) ( not ( = ?auto_12063 ?auto_12064 ) ) ( not ( = ?auto_12063 ?auto_12083 ) ) ( not ( = ?auto_12064 ?auto_12083 ) ) ( not ( = ?auto_12070 ?auto_12072 ) ) ( IS-CRATE ?auto_12063 ) ( not ( = ?auto_12078 ?auto_12068 ) ) ( HOIST-AT ?auto_12076 ?auto_12078 ) ( AVAILABLE ?auto_12076 ) ( SURFACE-AT ?auto_12063 ?auto_12078 ) ( ON ?auto_12063 ?auto_12075 ) ( CLEAR ?auto_12063 ) ( not ( = ?auto_12062 ?auto_12063 ) ) ( not ( = ?auto_12062 ?auto_12075 ) ) ( not ( = ?auto_12063 ?auto_12075 ) ) ( not ( = ?auto_12070 ?auto_12076 ) ) ( IS-CRATE ?auto_12062 ) ( not ( = ?auto_12089 ?auto_12068 ) ) ( HOIST-AT ?auto_12077 ?auto_12089 ) ( SURFACE-AT ?auto_12062 ?auto_12089 ) ( ON ?auto_12062 ?auto_12085 ) ( CLEAR ?auto_12062 ) ( not ( = ?auto_12061 ?auto_12062 ) ) ( not ( = ?auto_12061 ?auto_12085 ) ) ( not ( = ?auto_12062 ?auto_12085 ) ) ( not ( = ?auto_12070 ?auto_12077 ) ) ( IS-CRATE ?auto_12061 ) ( not ( = ?auto_12084 ?auto_12068 ) ) ( HOIST-AT ?auto_12088 ?auto_12084 ) ( AVAILABLE ?auto_12088 ) ( SURFACE-AT ?auto_12061 ?auto_12084 ) ( ON ?auto_12061 ?auto_12073 ) ( CLEAR ?auto_12061 ) ( not ( = ?auto_12060 ?auto_12061 ) ) ( not ( = ?auto_12060 ?auto_12073 ) ) ( not ( = ?auto_12061 ?auto_12073 ) ) ( not ( = ?auto_12070 ?auto_12088 ) ) ( IS-CRATE ?auto_12060 ) ( not ( = ?auto_12087 ?auto_12068 ) ) ( HOIST-AT ?auto_12081 ?auto_12087 ) ( AVAILABLE ?auto_12081 ) ( SURFACE-AT ?auto_12060 ?auto_12087 ) ( ON ?auto_12060 ?auto_12086 ) ( CLEAR ?auto_12060 ) ( not ( = ?auto_12059 ?auto_12060 ) ) ( not ( = ?auto_12059 ?auto_12086 ) ) ( not ( = ?auto_12060 ?auto_12086 ) ) ( not ( = ?auto_12070 ?auto_12081 ) ) ( IS-CRATE ?auto_12059 ) ( SURFACE-AT ?auto_12059 ?auto_12089 ) ( ON ?auto_12059 ?auto_12074 ) ( CLEAR ?auto_12059 ) ( not ( = ?auto_12058 ?auto_12059 ) ) ( not ( = ?auto_12058 ?auto_12074 ) ) ( not ( = ?auto_12059 ?auto_12074 ) ) ( IS-CRATE ?auto_12058 ) ( not ( = ?auto_12091 ?auto_12068 ) ) ( HOIST-AT ?auto_12079 ?auto_12091 ) ( AVAILABLE ?auto_12079 ) ( SURFACE-AT ?auto_12058 ?auto_12091 ) ( ON ?auto_12058 ?auto_12090 ) ( CLEAR ?auto_12058 ) ( not ( = ?auto_12057 ?auto_12058 ) ) ( not ( = ?auto_12057 ?auto_12090 ) ) ( not ( = ?auto_12058 ?auto_12090 ) ) ( not ( = ?auto_12070 ?auto_12079 ) ) ( SURFACE-AT ?auto_12056 ?auto_12068 ) ( CLEAR ?auto_12056 ) ( IS-CRATE ?auto_12057 ) ( AVAILABLE ?auto_12070 ) ( AVAILABLE ?auto_12077 ) ( SURFACE-AT ?auto_12057 ?auto_12089 ) ( ON ?auto_12057 ?auto_12082 ) ( CLEAR ?auto_12057 ) ( TRUCK-AT ?auto_12066 ?auto_12068 ) ( not ( = ?auto_12056 ?auto_12057 ) ) ( not ( = ?auto_12056 ?auto_12082 ) ) ( not ( = ?auto_12057 ?auto_12082 ) ) ( not ( = ?auto_12056 ?auto_12058 ) ) ( not ( = ?auto_12056 ?auto_12090 ) ) ( not ( = ?auto_12058 ?auto_12082 ) ) ( not ( = ?auto_12091 ?auto_12089 ) ) ( not ( = ?auto_12079 ?auto_12077 ) ) ( not ( = ?auto_12090 ?auto_12082 ) ) ( not ( = ?auto_12056 ?auto_12059 ) ) ( not ( = ?auto_12056 ?auto_12074 ) ) ( not ( = ?auto_12057 ?auto_12059 ) ) ( not ( = ?auto_12057 ?auto_12074 ) ) ( not ( = ?auto_12059 ?auto_12090 ) ) ( not ( = ?auto_12059 ?auto_12082 ) ) ( not ( = ?auto_12074 ?auto_12090 ) ) ( not ( = ?auto_12074 ?auto_12082 ) ) ( not ( = ?auto_12056 ?auto_12060 ) ) ( not ( = ?auto_12056 ?auto_12086 ) ) ( not ( = ?auto_12057 ?auto_12060 ) ) ( not ( = ?auto_12057 ?auto_12086 ) ) ( not ( = ?auto_12058 ?auto_12060 ) ) ( not ( = ?auto_12058 ?auto_12086 ) ) ( not ( = ?auto_12060 ?auto_12074 ) ) ( not ( = ?auto_12060 ?auto_12090 ) ) ( not ( = ?auto_12060 ?auto_12082 ) ) ( not ( = ?auto_12087 ?auto_12089 ) ) ( not ( = ?auto_12087 ?auto_12091 ) ) ( not ( = ?auto_12081 ?auto_12077 ) ) ( not ( = ?auto_12081 ?auto_12079 ) ) ( not ( = ?auto_12086 ?auto_12074 ) ) ( not ( = ?auto_12086 ?auto_12090 ) ) ( not ( = ?auto_12086 ?auto_12082 ) ) ( not ( = ?auto_12056 ?auto_12061 ) ) ( not ( = ?auto_12056 ?auto_12073 ) ) ( not ( = ?auto_12057 ?auto_12061 ) ) ( not ( = ?auto_12057 ?auto_12073 ) ) ( not ( = ?auto_12058 ?auto_12061 ) ) ( not ( = ?auto_12058 ?auto_12073 ) ) ( not ( = ?auto_12059 ?auto_12061 ) ) ( not ( = ?auto_12059 ?auto_12073 ) ) ( not ( = ?auto_12061 ?auto_12086 ) ) ( not ( = ?auto_12061 ?auto_12074 ) ) ( not ( = ?auto_12061 ?auto_12090 ) ) ( not ( = ?auto_12061 ?auto_12082 ) ) ( not ( = ?auto_12084 ?auto_12087 ) ) ( not ( = ?auto_12084 ?auto_12089 ) ) ( not ( = ?auto_12084 ?auto_12091 ) ) ( not ( = ?auto_12088 ?auto_12081 ) ) ( not ( = ?auto_12088 ?auto_12077 ) ) ( not ( = ?auto_12088 ?auto_12079 ) ) ( not ( = ?auto_12073 ?auto_12086 ) ) ( not ( = ?auto_12073 ?auto_12074 ) ) ( not ( = ?auto_12073 ?auto_12090 ) ) ( not ( = ?auto_12073 ?auto_12082 ) ) ( not ( = ?auto_12056 ?auto_12062 ) ) ( not ( = ?auto_12056 ?auto_12085 ) ) ( not ( = ?auto_12057 ?auto_12062 ) ) ( not ( = ?auto_12057 ?auto_12085 ) ) ( not ( = ?auto_12058 ?auto_12062 ) ) ( not ( = ?auto_12058 ?auto_12085 ) ) ( not ( = ?auto_12059 ?auto_12062 ) ) ( not ( = ?auto_12059 ?auto_12085 ) ) ( not ( = ?auto_12060 ?auto_12062 ) ) ( not ( = ?auto_12060 ?auto_12085 ) ) ( not ( = ?auto_12062 ?auto_12073 ) ) ( not ( = ?auto_12062 ?auto_12086 ) ) ( not ( = ?auto_12062 ?auto_12074 ) ) ( not ( = ?auto_12062 ?auto_12090 ) ) ( not ( = ?auto_12062 ?auto_12082 ) ) ( not ( = ?auto_12085 ?auto_12073 ) ) ( not ( = ?auto_12085 ?auto_12086 ) ) ( not ( = ?auto_12085 ?auto_12074 ) ) ( not ( = ?auto_12085 ?auto_12090 ) ) ( not ( = ?auto_12085 ?auto_12082 ) ) ( not ( = ?auto_12056 ?auto_12063 ) ) ( not ( = ?auto_12056 ?auto_12075 ) ) ( not ( = ?auto_12057 ?auto_12063 ) ) ( not ( = ?auto_12057 ?auto_12075 ) ) ( not ( = ?auto_12058 ?auto_12063 ) ) ( not ( = ?auto_12058 ?auto_12075 ) ) ( not ( = ?auto_12059 ?auto_12063 ) ) ( not ( = ?auto_12059 ?auto_12075 ) ) ( not ( = ?auto_12060 ?auto_12063 ) ) ( not ( = ?auto_12060 ?auto_12075 ) ) ( not ( = ?auto_12061 ?auto_12063 ) ) ( not ( = ?auto_12061 ?auto_12075 ) ) ( not ( = ?auto_12063 ?auto_12085 ) ) ( not ( = ?auto_12063 ?auto_12073 ) ) ( not ( = ?auto_12063 ?auto_12086 ) ) ( not ( = ?auto_12063 ?auto_12074 ) ) ( not ( = ?auto_12063 ?auto_12090 ) ) ( not ( = ?auto_12063 ?auto_12082 ) ) ( not ( = ?auto_12078 ?auto_12089 ) ) ( not ( = ?auto_12078 ?auto_12084 ) ) ( not ( = ?auto_12078 ?auto_12087 ) ) ( not ( = ?auto_12078 ?auto_12091 ) ) ( not ( = ?auto_12076 ?auto_12077 ) ) ( not ( = ?auto_12076 ?auto_12088 ) ) ( not ( = ?auto_12076 ?auto_12081 ) ) ( not ( = ?auto_12076 ?auto_12079 ) ) ( not ( = ?auto_12075 ?auto_12085 ) ) ( not ( = ?auto_12075 ?auto_12073 ) ) ( not ( = ?auto_12075 ?auto_12086 ) ) ( not ( = ?auto_12075 ?auto_12074 ) ) ( not ( = ?auto_12075 ?auto_12090 ) ) ( not ( = ?auto_12075 ?auto_12082 ) ) ( not ( = ?auto_12056 ?auto_12064 ) ) ( not ( = ?auto_12056 ?auto_12083 ) ) ( not ( = ?auto_12057 ?auto_12064 ) ) ( not ( = ?auto_12057 ?auto_12083 ) ) ( not ( = ?auto_12058 ?auto_12064 ) ) ( not ( = ?auto_12058 ?auto_12083 ) ) ( not ( = ?auto_12059 ?auto_12064 ) ) ( not ( = ?auto_12059 ?auto_12083 ) ) ( not ( = ?auto_12060 ?auto_12064 ) ) ( not ( = ?auto_12060 ?auto_12083 ) ) ( not ( = ?auto_12061 ?auto_12064 ) ) ( not ( = ?auto_12061 ?auto_12083 ) ) ( not ( = ?auto_12062 ?auto_12064 ) ) ( not ( = ?auto_12062 ?auto_12083 ) ) ( not ( = ?auto_12064 ?auto_12075 ) ) ( not ( = ?auto_12064 ?auto_12085 ) ) ( not ( = ?auto_12064 ?auto_12073 ) ) ( not ( = ?auto_12064 ?auto_12086 ) ) ( not ( = ?auto_12064 ?auto_12074 ) ) ( not ( = ?auto_12064 ?auto_12090 ) ) ( not ( = ?auto_12064 ?auto_12082 ) ) ( not ( = ?auto_12080 ?auto_12078 ) ) ( not ( = ?auto_12080 ?auto_12089 ) ) ( not ( = ?auto_12080 ?auto_12084 ) ) ( not ( = ?auto_12080 ?auto_12087 ) ) ( not ( = ?auto_12080 ?auto_12091 ) ) ( not ( = ?auto_12072 ?auto_12076 ) ) ( not ( = ?auto_12072 ?auto_12077 ) ) ( not ( = ?auto_12072 ?auto_12088 ) ) ( not ( = ?auto_12072 ?auto_12081 ) ) ( not ( = ?auto_12072 ?auto_12079 ) ) ( not ( = ?auto_12083 ?auto_12075 ) ) ( not ( = ?auto_12083 ?auto_12085 ) ) ( not ( = ?auto_12083 ?auto_12073 ) ) ( not ( = ?auto_12083 ?auto_12086 ) ) ( not ( = ?auto_12083 ?auto_12074 ) ) ( not ( = ?auto_12083 ?auto_12090 ) ) ( not ( = ?auto_12083 ?auto_12082 ) ) ( not ( = ?auto_12056 ?auto_12065 ) ) ( not ( = ?auto_12056 ?auto_12071 ) ) ( not ( = ?auto_12057 ?auto_12065 ) ) ( not ( = ?auto_12057 ?auto_12071 ) ) ( not ( = ?auto_12058 ?auto_12065 ) ) ( not ( = ?auto_12058 ?auto_12071 ) ) ( not ( = ?auto_12059 ?auto_12065 ) ) ( not ( = ?auto_12059 ?auto_12071 ) ) ( not ( = ?auto_12060 ?auto_12065 ) ) ( not ( = ?auto_12060 ?auto_12071 ) ) ( not ( = ?auto_12061 ?auto_12065 ) ) ( not ( = ?auto_12061 ?auto_12071 ) ) ( not ( = ?auto_12062 ?auto_12065 ) ) ( not ( = ?auto_12062 ?auto_12071 ) ) ( not ( = ?auto_12063 ?auto_12065 ) ) ( not ( = ?auto_12063 ?auto_12071 ) ) ( not ( = ?auto_12065 ?auto_12083 ) ) ( not ( = ?auto_12065 ?auto_12075 ) ) ( not ( = ?auto_12065 ?auto_12085 ) ) ( not ( = ?auto_12065 ?auto_12073 ) ) ( not ( = ?auto_12065 ?auto_12086 ) ) ( not ( = ?auto_12065 ?auto_12074 ) ) ( not ( = ?auto_12065 ?auto_12090 ) ) ( not ( = ?auto_12065 ?auto_12082 ) ) ( not ( = ?auto_12069 ?auto_12080 ) ) ( not ( = ?auto_12069 ?auto_12078 ) ) ( not ( = ?auto_12069 ?auto_12089 ) ) ( not ( = ?auto_12069 ?auto_12084 ) ) ( not ( = ?auto_12069 ?auto_12087 ) ) ( not ( = ?auto_12069 ?auto_12091 ) ) ( not ( = ?auto_12067 ?auto_12072 ) ) ( not ( = ?auto_12067 ?auto_12076 ) ) ( not ( = ?auto_12067 ?auto_12077 ) ) ( not ( = ?auto_12067 ?auto_12088 ) ) ( not ( = ?auto_12067 ?auto_12081 ) ) ( not ( = ?auto_12067 ?auto_12079 ) ) ( not ( = ?auto_12071 ?auto_12083 ) ) ( not ( = ?auto_12071 ?auto_12075 ) ) ( not ( = ?auto_12071 ?auto_12085 ) ) ( not ( = ?auto_12071 ?auto_12073 ) ) ( not ( = ?auto_12071 ?auto_12086 ) ) ( not ( = ?auto_12071 ?auto_12074 ) ) ( not ( = ?auto_12071 ?auto_12090 ) ) ( not ( = ?auto_12071 ?auto_12082 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_12056 ?auto_12057 ?auto_12058 ?auto_12059 ?auto_12060 ?auto_12061 ?auto_12062 ?auto_12063 ?auto_12064 )
      ( MAKE-1CRATE ?auto_12064 ?auto_12065 )
      ( MAKE-9CRATE-VERIFY ?auto_12056 ?auto_12057 ?auto_12058 ?auto_12059 ?auto_12060 ?auto_12061 ?auto_12062 ?auto_12063 ?auto_12064 ?auto_12065 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_12113 - SURFACE
      ?auto_12114 - SURFACE
      ?auto_12115 - SURFACE
      ?auto_12116 - SURFACE
      ?auto_12117 - SURFACE
      ?auto_12118 - SURFACE
      ?auto_12119 - SURFACE
      ?auto_12120 - SURFACE
      ?auto_12121 - SURFACE
      ?auto_12122 - SURFACE
      ?auto_12123 - SURFACE
    )
    :vars
    (
      ?auto_12126 - HOIST
      ?auto_12129 - PLACE
      ?auto_12127 - PLACE
      ?auto_12124 - HOIST
      ?auto_12125 - SURFACE
      ?auto_12135 - PLACE
      ?auto_12143 - HOIST
      ?auto_12148 - SURFACE
      ?auto_12142 - PLACE
      ?auto_12147 - HOIST
      ?auto_12150 - SURFACE
      ?auto_12139 - PLACE
      ?auto_12141 - HOIST
      ?auto_12145 - SURFACE
      ?auto_12146 - PLACE
      ?auto_12140 - HOIST
      ?auto_12137 - SURFACE
      ?auto_12136 - PLACE
      ?auto_12132 - HOIST
      ?auto_12149 - SURFACE
      ?auto_12131 - PLACE
      ?auto_12130 - HOIST
      ?auto_12134 - SURFACE
      ?auto_12152 - SURFACE
      ?auto_12133 - PLACE
      ?auto_12138 - HOIST
      ?auto_12151 - SURFACE
      ?auto_12144 - SURFACE
      ?auto_12128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12126 ?auto_12129 ) ( IS-CRATE ?auto_12123 ) ( not ( = ?auto_12127 ?auto_12129 ) ) ( HOIST-AT ?auto_12124 ?auto_12127 ) ( AVAILABLE ?auto_12124 ) ( SURFACE-AT ?auto_12123 ?auto_12127 ) ( ON ?auto_12123 ?auto_12125 ) ( CLEAR ?auto_12123 ) ( not ( = ?auto_12122 ?auto_12123 ) ) ( not ( = ?auto_12122 ?auto_12125 ) ) ( not ( = ?auto_12123 ?auto_12125 ) ) ( not ( = ?auto_12126 ?auto_12124 ) ) ( IS-CRATE ?auto_12122 ) ( not ( = ?auto_12135 ?auto_12129 ) ) ( HOIST-AT ?auto_12143 ?auto_12135 ) ( AVAILABLE ?auto_12143 ) ( SURFACE-AT ?auto_12122 ?auto_12135 ) ( ON ?auto_12122 ?auto_12148 ) ( CLEAR ?auto_12122 ) ( not ( = ?auto_12121 ?auto_12122 ) ) ( not ( = ?auto_12121 ?auto_12148 ) ) ( not ( = ?auto_12122 ?auto_12148 ) ) ( not ( = ?auto_12126 ?auto_12143 ) ) ( IS-CRATE ?auto_12121 ) ( not ( = ?auto_12142 ?auto_12129 ) ) ( HOIST-AT ?auto_12147 ?auto_12142 ) ( AVAILABLE ?auto_12147 ) ( SURFACE-AT ?auto_12121 ?auto_12142 ) ( ON ?auto_12121 ?auto_12150 ) ( CLEAR ?auto_12121 ) ( not ( = ?auto_12120 ?auto_12121 ) ) ( not ( = ?auto_12120 ?auto_12150 ) ) ( not ( = ?auto_12121 ?auto_12150 ) ) ( not ( = ?auto_12126 ?auto_12147 ) ) ( IS-CRATE ?auto_12120 ) ( not ( = ?auto_12139 ?auto_12129 ) ) ( HOIST-AT ?auto_12141 ?auto_12139 ) ( AVAILABLE ?auto_12141 ) ( SURFACE-AT ?auto_12120 ?auto_12139 ) ( ON ?auto_12120 ?auto_12145 ) ( CLEAR ?auto_12120 ) ( not ( = ?auto_12119 ?auto_12120 ) ) ( not ( = ?auto_12119 ?auto_12145 ) ) ( not ( = ?auto_12120 ?auto_12145 ) ) ( not ( = ?auto_12126 ?auto_12141 ) ) ( IS-CRATE ?auto_12119 ) ( not ( = ?auto_12146 ?auto_12129 ) ) ( HOIST-AT ?auto_12140 ?auto_12146 ) ( SURFACE-AT ?auto_12119 ?auto_12146 ) ( ON ?auto_12119 ?auto_12137 ) ( CLEAR ?auto_12119 ) ( not ( = ?auto_12118 ?auto_12119 ) ) ( not ( = ?auto_12118 ?auto_12137 ) ) ( not ( = ?auto_12119 ?auto_12137 ) ) ( not ( = ?auto_12126 ?auto_12140 ) ) ( IS-CRATE ?auto_12118 ) ( not ( = ?auto_12136 ?auto_12129 ) ) ( HOIST-AT ?auto_12132 ?auto_12136 ) ( AVAILABLE ?auto_12132 ) ( SURFACE-AT ?auto_12118 ?auto_12136 ) ( ON ?auto_12118 ?auto_12149 ) ( CLEAR ?auto_12118 ) ( not ( = ?auto_12117 ?auto_12118 ) ) ( not ( = ?auto_12117 ?auto_12149 ) ) ( not ( = ?auto_12118 ?auto_12149 ) ) ( not ( = ?auto_12126 ?auto_12132 ) ) ( IS-CRATE ?auto_12117 ) ( not ( = ?auto_12131 ?auto_12129 ) ) ( HOIST-AT ?auto_12130 ?auto_12131 ) ( AVAILABLE ?auto_12130 ) ( SURFACE-AT ?auto_12117 ?auto_12131 ) ( ON ?auto_12117 ?auto_12134 ) ( CLEAR ?auto_12117 ) ( not ( = ?auto_12116 ?auto_12117 ) ) ( not ( = ?auto_12116 ?auto_12134 ) ) ( not ( = ?auto_12117 ?auto_12134 ) ) ( not ( = ?auto_12126 ?auto_12130 ) ) ( IS-CRATE ?auto_12116 ) ( SURFACE-AT ?auto_12116 ?auto_12146 ) ( ON ?auto_12116 ?auto_12152 ) ( CLEAR ?auto_12116 ) ( not ( = ?auto_12115 ?auto_12116 ) ) ( not ( = ?auto_12115 ?auto_12152 ) ) ( not ( = ?auto_12116 ?auto_12152 ) ) ( IS-CRATE ?auto_12115 ) ( not ( = ?auto_12133 ?auto_12129 ) ) ( HOIST-AT ?auto_12138 ?auto_12133 ) ( AVAILABLE ?auto_12138 ) ( SURFACE-AT ?auto_12115 ?auto_12133 ) ( ON ?auto_12115 ?auto_12151 ) ( CLEAR ?auto_12115 ) ( not ( = ?auto_12114 ?auto_12115 ) ) ( not ( = ?auto_12114 ?auto_12151 ) ) ( not ( = ?auto_12115 ?auto_12151 ) ) ( not ( = ?auto_12126 ?auto_12138 ) ) ( SURFACE-AT ?auto_12113 ?auto_12129 ) ( CLEAR ?auto_12113 ) ( IS-CRATE ?auto_12114 ) ( AVAILABLE ?auto_12126 ) ( AVAILABLE ?auto_12140 ) ( SURFACE-AT ?auto_12114 ?auto_12146 ) ( ON ?auto_12114 ?auto_12144 ) ( CLEAR ?auto_12114 ) ( TRUCK-AT ?auto_12128 ?auto_12129 ) ( not ( = ?auto_12113 ?auto_12114 ) ) ( not ( = ?auto_12113 ?auto_12144 ) ) ( not ( = ?auto_12114 ?auto_12144 ) ) ( not ( = ?auto_12113 ?auto_12115 ) ) ( not ( = ?auto_12113 ?auto_12151 ) ) ( not ( = ?auto_12115 ?auto_12144 ) ) ( not ( = ?auto_12133 ?auto_12146 ) ) ( not ( = ?auto_12138 ?auto_12140 ) ) ( not ( = ?auto_12151 ?auto_12144 ) ) ( not ( = ?auto_12113 ?auto_12116 ) ) ( not ( = ?auto_12113 ?auto_12152 ) ) ( not ( = ?auto_12114 ?auto_12116 ) ) ( not ( = ?auto_12114 ?auto_12152 ) ) ( not ( = ?auto_12116 ?auto_12151 ) ) ( not ( = ?auto_12116 ?auto_12144 ) ) ( not ( = ?auto_12152 ?auto_12151 ) ) ( not ( = ?auto_12152 ?auto_12144 ) ) ( not ( = ?auto_12113 ?auto_12117 ) ) ( not ( = ?auto_12113 ?auto_12134 ) ) ( not ( = ?auto_12114 ?auto_12117 ) ) ( not ( = ?auto_12114 ?auto_12134 ) ) ( not ( = ?auto_12115 ?auto_12117 ) ) ( not ( = ?auto_12115 ?auto_12134 ) ) ( not ( = ?auto_12117 ?auto_12152 ) ) ( not ( = ?auto_12117 ?auto_12151 ) ) ( not ( = ?auto_12117 ?auto_12144 ) ) ( not ( = ?auto_12131 ?auto_12146 ) ) ( not ( = ?auto_12131 ?auto_12133 ) ) ( not ( = ?auto_12130 ?auto_12140 ) ) ( not ( = ?auto_12130 ?auto_12138 ) ) ( not ( = ?auto_12134 ?auto_12152 ) ) ( not ( = ?auto_12134 ?auto_12151 ) ) ( not ( = ?auto_12134 ?auto_12144 ) ) ( not ( = ?auto_12113 ?auto_12118 ) ) ( not ( = ?auto_12113 ?auto_12149 ) ) ( not ( = ?auto_12114 ?auto_12118 ) ) ( not ( = ?auto_12114 ?auto_12149 ) ) ( not ( = ?auto_12115 ?auto_12118 ) ) ( not ( = ?auto_12115 ?auto_12149 ) ) ( not ( = ?auto_12116 ?auto_12118 ) ) ( not ( = ?auto_12116 ?auto_12149 ) ) ( not ( = ?auto_12118 ?auto_12134 ) ) ( not ( = ?auto_12118 ?auto_12152 ) ) ( not ( = ?auto_12118 ?auto_12151 ) ) ( not ( = ?auto_12118 ?auto_12144 ) ) ( not ( = ?auto_12136 ?auto_12131 ) ) ( not ( = ?auto_12136 ?auto_12146 ) ) ( not ( = ?auto_12136 ?auto_12133 ) ) ( not ( = ?auto_12132 ?auto_12130 ) ) ( not ( = ?auto_12132 ?auto_12140 ) ) ( not ( = ?auto_12132 ?auto_12138 ) ) ( not ( = ?auto_12149 ?auto_12134 ) ) ( not ( = ?auto_12149 ?auto_12152 ) ) ( not ( = ?auto_12149 ?auto_12151 ) ) ( not ( = ?auto_12149 ?auto_12144 ) ) ( not ( = ?auto_12113 ?auto_12119 ) ) ( not ( = ?auto_12113 ?auto_12137 ) ) ( not ( = ?auto_12114 ?auto_12119 ) ) ( not ( = ?auto_12114 ?auto_12137 ) ) ( not ( = ?auto_12115 ?auto_12119 ) ) ( not ( = ?auto_12115 ?auto_12137 ) ) ( not ( = ?auto_12116 ?auto_12119 ) ) ( not ( = ?auto_12116 ?auto_12137 ) ) ( not ( = ?auto_12117 ?auto_12119 ) ) ( not ( = ?auto_12117 ?auto_12137 ) ) ( not ( = ?auto_12119 ?auto_12149 ) ) ( not ( = ?auto_12119 ?auto_12134 ) ) ( not ( = ?auto_12119 ?auto_12152 ) ) ( not ( = ?auto_12119 ?auto_12151 ) ) ( not ( = ?auto_12119 ?auto_12144 ) ) ( not ( = ?auto_12137 ?auto_12149 ) ) ( not ( = ?auto_12137 ?auto_12134 ) ) ( not ( = ?auto_12137 ?auto_12152 ) ) ( not ( = ?auto_12137 ?auto_12151 ) ) ( not ( = ?auto_12137 ?auto_12144 ) ) ( not ( = ?auto_12113 ?auto_12120 ) ) ( not ( = ?auto_12113 ?auto_12145 ) ) ( not ( = ?auto_12114 ?auto_12120 ) ) ( not ( = ?auto_12114 ?auto_12145 ) ) ( not ( = ?auto_12115 ?auto_12120 ) ) ( not ( = ?auto_12115 ?auto_12145 ) ) ( not ( = ?auto_12116 ?auto_12120 ) ) ( not ( = ?auto_12116 ?auto_12145 ) ) ( not ( = ?auto_12117 ?auto_12120 ) ) ( not ( = ?auto_12117 ?auto_12145 ) ) ( not ( = ?auto_12118 ?auto_12120 ) ) ( not ( = ?auto_12118 ?auto_12145 ) ) ( not ( = ?auto_12120 ?auto_12137 ) ) ( not ( = ?auto_12120 ?auto_12149 ) ) ( not ( = ?auto_12120 ?auto_12134 ) ) ( not ( = ?auto_12120 ?auto_12152 ) ) ( not ( = ?auto_12120 ?auto_12151 ) ) ( not ( = ?auto_12120 ?auto_12144 ) ) ( not ( = ?auto_12139 ?auto_12146 ) ) ( not ( = ?auto_12139 ?auto_12136 ) ) ( not ( = ?auto_12139 ?auto_12131 ) ) ( not ( = ?auto_12139 ?auto_12133 ) ) ( not ( = ?auto_12141 ?auto_12140 ) ) ( not ( = ?auto_12141 ?auto_12132 ) ) ( not ( = ?auto_12141 ?auto_12130 ) ) ( not ( = ?auto_12141 ?auto_12138 ) ) ( not ( = ?auto_12145 ?auto_12137 ) ) ( not ( = ?auto_12145 ?auto_12149 ) ) ( not ( = ?auto_12145 ?auto_12134 ) ) ( not ( = ?auto_12145 ?auto_12152 ) ) ( not ( = ?auto_12145 ?auto_12151 ) ) ( not ( = ?auto_12145 ?auto_12144 ) ) ( not ( = ?auto_12113 ?auto_12121 ) ) ( not ( = ?auto_12113 ?auto_12150 ) ) ( not ( = ?auto_12114 ?auto_12121 ) ) ( not ( = ?auto_12114 ?auto_12150 ) ) ( not ( = ?auto_12115 ?auto_12121 ) ) ( not ( = ?auto_12115 ?auto_12150 ) ) ( not ( = ?auto_12116 ?auto_12121 ) ) ( not ( = ?auto_12116 ?auto_12150 ) ) ( not ( = ?auto_12117 ?auto_12121 ) ) ( not ( = ?auto_12117 ?auto_12150 ) ) ( not ( = ?auto_12118 ?auto_12121 ) ) ( not ( = ?auto_12118 ?auto_12150 ) ) ( not ( = ?auto_12119 ?auto_12121 ) ) ( not ( = ?auto_12119 ?auto_12150 ) ) ( not ( = ?auto_12121 ?auto_12145 ) ) ( not ( = ?auto_12121 ?auto_12137 ) ) ( not ( = ?auto_12121 ?auto_12149 ) ) ( not ( = ?auto_12121 ?auto_12134 ) ) ( not ( = ?auto_12121 ?auto_12152 ) ) ( not ( = ?auto_12121 ?auto_12151 ) ) ( not ( = ?auto_12121 ?auto_12144 ) ) ( not ( = ?auto_12142 ?auto_12139 ) ) ( not ( = ?auto_12142 ?auto_12146 ) ) ( not ( = ?auto_12142 ?auto_12136 ) ) ( not ( = ?auto_12142 ?auto_12131 ) ) ( not ( = ?auto_12142 ?auto_12133 ) ) ( not ( = ?auto_12147 ?auto_12141 ) ) ( not ( = ?auto_12147 ?auto_12140 ) ) ( not ( = ?auto_12147 ?auto_12132 ) ) ( not ( = ?auto_12147 ?auto_12130 ) ) ( not ( = ?auto_12147 ?auto_12138 ) ) ( not ( = ?auto_12150 ?auto_12145 ) ) ( not ( = ?auto_12150 ?auto_12137 ) ) ( not ( = ?auto_12150 ?auto_12149 ) ) ( not ( = ?auto_12150 ?auto_12134 ) ) ( not ( = ?auto_12150 ?auto_12152 ) ) ( not ( = ?auto_12150 ?auto_12151 ) ) ( not ( = ?auto_12150 ?auto_12144 ) ) ( not ( = ?auto_12113 ?auto_12122 ) ) ( not ( = ?auto_12113 ?auto_12148 ) ) ( not ( = ?auto_12114 ?auto_12122 ) ) ( not ( = ?auto_12114 ?auto_12148 ) ) ( not ( = ?auto_12115 ?auto_12122 ) ) ( not ( = ?auto_12115 ?auto_12148 ) ) ( not ( = ?auto_12116 ?auto_12122 ) ) ( not ( = ?auto_12116 ?auto_12148 ) ) ( not ( = ?auto_12117 ?auto_12122 ) ) ( not ( = ?auto_12117 ?auto_12148 ) ) ( not ( = ?auto_12118 ?auto_12122 ) ) ( not ( = ?auto_12118 ?auto_12148 ) ) ( not ( = ?auto_12119 ?auto_12122 ) ) ( not ( = ?auto_12119 ?auto_12148 ) ) ( not ( = ?auto_12120 ?auto_12122 ) ) ( not ( = ?auto_12120 ?auto_12148 ) ) ( not ( = ?auto_12122 ?auto_12150 ) ) ( not ( = ?auto_12122 ?auto_12145 ) ) ( not ( = ?auto_12122 ?auto_12137 ) ) ( not ( = ?auto_12122 ?auto_12149 ) ) ( not ( = ?auto_12122 ?auto_12134 ) ) ( not ( = ?auto_12122 ?auto_12152 ) ) ( not ( = ?auto_12122 ?auto_12151 ) ) ( not ( = ?auto_12122 ?auto_12144 ) ) ( not ( = ?auto_12135 ?auto_12142 ) ) ( not ( = ?auto_12135 ?auto_12139 ) ) ( not ( = ?auto_12135 ?auto_12146 ) ) ( not ( = ?auto_12135 ?auto_12136 ) ) ( not ( = ?auto_12135 ?auto_12131 ) ) ( not ( = ?auto_12135 ?auto_12133 ) ) ( not ( = ?auto_12143 ?auto_12147 ) ) ( not ( = ?auto_12143 ?auto_12141 ) ) ( not ( = ?auto_12143 ?auto_12140 ) ) ( not ( = ?auto_12143 ?auto_12132 ) ) ( not ( = ?auto_12143 ?auto_12130 ) ) ( not ( = ?auto_12143 ?auto_12138 ) ) ( not ( = ?auto_12148 ?auto_12150 ) ) ( not ( = ?auto_12148 ?auto_12145 ) ) ( not ( = ?auto_12148 ?auto_12137 ) ) ( not ( = ?auto_12148 ?auto_12149 ) ) ( not ( = ?auto_12148 ?auto_12134 ) ) ( not ( = ?auto_12148 ?auto_12152 ) ) ( not ( = ?auto_12148 ?auto_12151 ) ) ( not ( = ?auto_12148 ?auto_12144 ) ) ( not ( = ?auto_12113 ?auto_12123 ) ) ( not ( = ?auto_12113 ?auto_12125 ) ) ( not ( = ?auto_12114 ?auto_12123 ) ) ( not ( = ?auto_12114 ?auto_12125 ) ) ( not ( = ?auto_12115 ?auto_12123 ) ) ( not ( = ?auto_12115 ?auto_12125 ) ) ( not ( = ?auto_12116 ?auto_12123 ) ) ( not ( = ?auto_12116 ?auto_12125 ) ) ( not ( = ?auto_12117 ?auto_12123 ) ) ( not ( = ?auto_12117 ?auto_12125 ) ) ( not ( = ?auto_12118 ?auto_12123 ) ) ( not ( = ?auto_12118 ?auto_12125 ) ) ( not ( = ?auto_12119 ?auto_12123 ) ) ( not ( = ?auto_12119 ?auto_12125 ) ) ( not ( = ?auto_12120 ?auto_12123 ) ) ( not ( = ?auto_12120 ?auto_12125 ) ) ( not ( = ?auto_12121 ?auto_12123 ) ) ( not ( = ?auto_12121 ?auto_12125 ) ) ( not ( = ?auto_12123 ?auto_12148 ) ) ( not ( = ?auto_12123 ?auto_12150 ) ) ( not ( = ?auto_12123 ?auto_12145 ) ) ( not ( = ?auto_12123 ?auto_12137 ) ) ( not ( = ?auto_12123 ?auto_12149 ) ) ( not ( = ?auto_12123 ?auto_12134 ) ) ( not ( = ?auto_12123 ?auto_12152 ) ) ( not ( = ?auto_12123 ?auto_12151 ) ) ( not ( = ?auto_12123 ?auto_12144 ) ) ( not ( = ?auto_12127 ?auto_12135 ) ) ( not ( = ?auto_12127 ?auto_12142 ) ) ( not ( = ?auto_12127 ?auto_12139 ) ) ( not ( = ?auto_12127 ?auto_12146 ) ) ( not ( = ?auto_12127 ?auto_12136 ) ) ( not ( = ?auto_12127 ?auto_12131 ) ) ( not ( = ?auto_12127 ?auto_12133 ) ) ( not ( = ?auto_12124 ?auto_12143 ) ) ( not ( = ?auto_12124 ?auto_12147 ) ) ( not ( = ?auto_12124 ?auto_12141 ) ) ( not ( = ?auto_12124 ?auto_12140 ) ) ( not ( = ?auto_12124 ?auto_12132 ) ) ( not ( = ?auto_12124 ?auto_12130 ) ) ( not ( = ?auto_12124 ?auto_12138 ) ) ( not ( = ?auto_12125 ?auto_12148 ) ) ( not ( = ?auto_12125 ?auto_12150 ) ) ( not ( = ?auto_12125 ?auto_12145 ) ) ( not ( = ?auto_12125 ?auto_12137 ) ) ( not ( = ?auto_12125 ?auto_12149 ) ) ( not ( = ?auto_12125 ?auto_12134 ) ) ( not ( = ?auto_12125 ?auto_12152 ) ) ( not ( = ?auto_12125 ?auto_12151 ) ) ( not ( = ?auto_12125 ?auto_12144 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_12113 ?auto_12114 ?auto_12115 ?auto_12116 ?auto_12117 ?auto_12118 ?auto_12119 ?auto_12120 ?auto_12121 ?auto_12122 )
      ( MAKE-1CRATE ?auto_12122 ?auto_12123 )
      ( MAKE-10CRATE-VERIFY ?auto_12113 ?auto_12114 ?auto_12115 ?auto_12116 ?auto_12117 ?auto_12118 ?auto_12119 ?auto_12120 ?auto_12121 ?auto_12122 ?auto_12123 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_12175 - SURFACE
      ?auto_12176 - SURFACE
      ?auto_12177 - SURFACE
      ?auto_12178 - SURFACE
      ?auto_12179 - SURFACE
      ?auto_12180 - SURFACE
      ?auto_12181 - SURFACE
      ?auto_12182 - SURFACE
      ?auto_12183 - SURFACE
      ?auto_12184 - SURFACE
      ?auto_12185 - SURFACE
      ?auto_12186 - SURFACE
    )
    :vars
    (
      ?auto_12190 - HOIST
      ?auto_12188 - PLACE
      ?auto_12191 - PLACE
      ?auto_12189 - HOIST
      ?auto_12192 - SURFACE
      ?auto_12204 - PLACE
      ?auto_12208 - HOIST
      ?auto_12217 - SURFACE
      ?auto_12200 - PLACE
      ?auto_12218 - HOIST
      ?auto_12211 - SURFACE
      ?auto_12214 - PLACE
      ?auto_12207 - HOIST
      ?auto_12194 - SURFACE
      ?auto_12213 - PLACE
      ?auto_12205 - HOIST
      ?auto_12203 - SURFACE
      ?auto_12210 - PLACE
      ?auto_12195 - HOIST
      ?auto_12193 - SURFACE
      ?auto_12196 - PLACE
      ?auto_12212 - HOIST
      ?auto_12198 - SURFACE
      ?auto_12202 - PLACE
      ?auto_12201 - HOIST
      ?auto_12206 - SURFACE
      ?auto_12215 - SURFACE
      ?auto_12209 - PLACE
      ?auto_12199 - HOIST
      ?auto_12216 - SURFACE
      ?auto_12197 - SURFACE
      ?auto_12187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12190 ?auto_12188 ) ( IS-CRATE ?auto_12186 ) ( not ( = ?auto_12191 ?auto_12188 ) ) ( HOIST-AT ?auto_12189 ?auto_12191 ) ( AVAILABLE ?auto_12189 ) ( SURFACE-AT ?auto_12186 ?auto_12191 ) ( ON ?auto_12186 ?auto_12192 ) ( CLEAR ?auto_12186 ) ( not ( = ?auto_12185 ?auto_12186 ) ) ( not ( = ?auto_12185 ?auto_12192 ) ) ( not ( = ?auto_12186 ?auto_12192 ) ) ( not ( = ?auto_12190 ?auto_12189 ) ) ( IS-CRATE ?auto_12185 ) ( not ( = ?auto_12204 ?auto_12188 ) ) ( HOIST-AT ?auto_12208 ?auto_12204 ) ( AVAILABLE ?auto_12208 ) ( SURFACE-AT ?auto_12185 ?auto_12204 ) ( ON ?auto_12185 ?auto_12217 ) ( CLEAR ?auto_12185 ) ( not ( = ?auto_12184 ?auto_12185 ) ) ( not ( = ?auto_12184 ?auto_12217 ) ) ( not ( = ?auto_12185 ?auto_12217 ) ) ( not ( = ?auto_12190 ?auto_12208 ) ) ( IS-CRATE ?auto_12184 ) ( not ( = ?auto_12200 ?auto_12188 ) ) ( HOIST-AT ?auto_12218 ?auto_12200 ) ( AVAILABLE ?auto_12218 ) ( SURFACE-AT ?auto_12184 ?auto_12200 ) ( ON ?auto_12184 ?auto_12211 ) ( CLEAR ?auto_12184 ) ( not ( = ?auto_12183 ?auto_12184 ) ) ( not ( = ?auto_12183 ?auto_12211 ) ) ( not ( = ?auto_12184 ?auto_12211 ) ) ( not ( = ?auto_12190 ?auto_12218 ) ) ( IS-CRATE ?auto_12183 ) ( not ( = ?auto_12214 ?auto_12188 ) ) ( HOIST-AT ?auto_12207 ?auto_12214 ) ( AVAILABLE ?auto_12207 ) ( SURFACE-AT ?auto_12183 ?auto_12214 ) ( ON ?auto_12183 ?auto_12194 ) ( CLEAR ?auto_12183 ) ( not ( = ?auto_12182 ?auto_12183 ) ) ( not ( = ?auto_12182 ?auto_12194 ) ) ( not ( = ?auto_12183 ?auto_12194 ) ) ( not ( = ?auto_12190 ?auto_12207 ) ) ( IS-CRATE ?auto_12182 ) ( not ( = ?auto_12213 ?auto_12188 ) ) ( HOIST-AT ?auto_12205 ?auto_12213 ) ( AVAILABLE ?auto_12205 ) ( SURFACE-AT ?auto_12182 ?auto_12213 ) ( ON ?auto_12182 ?auto_12203 ) ( CLEAR ?auto_12182 ) ( not ( = ?auto_12181 ?auto_12182 ) ) ( not ( = ?auto_12181 ?auto_12203 ) ) ( not ( = ?auto_12182 ?auto_12203 ) ) ( not ( = ?auto_12190 ?auto_12205 ) ) ( IS-CRATE ?auto_12181 ) ( not ( = ?auto_12210 ?auto_12188 ) ) ( HOIST-AT ?auto_12195 ?auto_12210 ) ( SURFACE-AT ?auto_12181 ?auto_12210 ) ( ON ?auto_12181 ?auto_12193 ) ( CLEAR ?auto_12181 ) ( not ( = ?auto_12180 ?auto_12181 ) ) ( not ( = ?auto_12180 ?auto_12193 ) ) ( not ( = ?auto_12181 ?auto_12193 ) ) ( not ( = ?auto_12190 ?auto_12195 ) ) ( IS-CRATE ?auto_12180 ) ( not ( = ?auto_12196 ?auto_12188 ) ) ( HOIST-AT ?auto_12212 ?auto_12196 ) ( AVAILABLE ?auto_12212 ) ( SURFACE-AT ?auto_12180 ?auto_12196 ) ( ON ?auto_12180 ?auto_12198 ) ( CLEAR ?auto_12180 ) ( not ( = ?auto_12179 ?auto_12180 ) ) ( not ( = ?auto_12179 ?auto_12198 ) ) ( not ( = ?auto_12180 ?auto_12198 ) ) ( not ( = ?auto_12190 ?auto_12212 ) ) ( IS-CRATE ?auto_12179 ) ( not ( = ?auto_12202 ?auto_12188 ) ) ( HOIST-AT ?auto_12201 ?auto_12202 ) ( AVAILABLE ?auto_12201 ) ( SURFACE-AT ?auto_12179 ?auto_12202 ) ( ON ?auto_12179 ?auto_12206 ) ( CLEAR ?auto_12179 ) ( not ( = ?auto_12178 ?auto_12179 ) ) ( not ( = ?auto_12178 ?auto_12206 ) ) ( not ( = ?auto_12179 ?auto_12206 ) ) ( not ( = ?auto_12190 ?auto_12201 ) ) ( IS-CRATE ?auto_12178 ) ( SURFACE-AT ?auto_12178 ?auto_12210 ) ( ON ?auto_12178 ?auto_12215 ) ( CLEAR ?auto_12178 ) ( not ( = ?auto_12177 ?auto_12178 ) ) ( not ( = ?auto_12177 ?auto_12215 ) ) ( not ( = ?auto_12178 ?auto_12215 ) ) ( IS-CRATE ?auto_12177 ) ( not ( = ?auto_12209 ?auto_12188 ) ) ( HOIST-AT ?auto_12199 ?auto_12209 ) ( AVAILABLE ?auto_12199 ) ( SURFACE-AT ?auto_12177 ?auto_12209 ) ( ON ?auto_12177 ?auto_12216 ) ( CLEAR ?auto_12177 ) ( not ( = ?auto_12176 ?auto_12177 ) ) ( not ( = ?auto_12176 ?auto_12216 ) ) ( not ( = ?auto_12177 ?auto_12216 ) ) ( not ( = ?auto_12190 ?auto_12199 ) ) ( SURFACE-AT ?auto_12175 ?auto_12188 ) ( CLEAR ?auto_12175 ) ( IS-CRATE ?auto_12176 ) ( AVAILABLE ?auto_12190 ) ( AVAILABLE ?auto_12195 ) ( SURFACE-AT ?auto_12176 ?auto_12210 ) ( ON ?auto_12176 ?auto_12197 ) ( CLEAR ?auto_12176 ) ( TRUCK-AT ?auto_12187 ?auto_12188 ) ( not ( = ?auto_12175 ?auto_12176 ) ) ( not ( = ?auto_12175 ?auto_12197 ) ) ( not ( = ?auto_12176 ?auto_12197 ) ) ( not ( = ?auto_12175 ?auto_12177 ) ) ( not ( = ?auto_12175 ?auto_12216 ) ) ( not ( = ?auto_12177 ?auto_12197 ) ) ( not ( = ?auto_12209 ?auto_12210 ) ) ( not ( = ?auto_12199 ?auto_12195 ) ) ( not ( = ?auto_12216 ?auto_12197 ) ) ( not ( = ?auto_12175 ?auto_12178 ) ) ( not ( = ?auto_12175 ?auto_12215 ) ) ( not ( = ?auto_12176 ?auto_12178 ) ) ( not ( = ?auto_12176 ?auto_12215 ) ) ( not ( = ?auto_12178 ?auto_12216 ) ) ( not ( = ?auto_12178 ?auto_12197 ) ) ( not ( = ?auto_12215 ?auto_12216 ) ) ( not ( = ?auto_12215 ?auto_12197 ) ) ( not ( = ?auto_12175 ?auto_12179 ) ) ( not ( = ?auto_12175 ?auto_12206 ) ) ( not ( = ?auto_12176 ?auto_12179 ) ) ( not ( = ?auto_12176 ?auto_12206 ) ) ( not ( = ?auto_12177 ?auto_12179 ) ) ( not ( = ?auto_12177 ?auto_12206 ) ) ( not ( = ?auto_12179 ?auto_12215 ) ) ( not ( = ?auto_12179 ?auto_12216 ) ) ( not ( = ?auto_12179 ?auto_12197 ) ) ( not ( = ?auto_12202 ?auto_12210 ) ) ( not ( = ?auto_12202 ?auto_12209 ) ) ( not ( = ?auto_12201 ?auto_12195 ) ) ( not ( = ?auto_12201 ?auto_12199 ) ) ( not ( = ?auto_12206 ?auto_12215 ) ) ( not ( = ?auto_12206 ?auto_12216 ) ) ( not ( = ?auto_12206 ?auto_12197 ) ) ( not ( = ?auto_12175 ?auto_12180 ) ) ( not ( = ?auto_12175 ?auto_12198 ) ) ( not ( = ?auto_12176 ?auto_12180 ) ) ( not ( = ?auto_12176 ?auto_12198 ) ) ( not ( = ?auto_12177 ?auto_12180 ) ) ( not ( = ?auto_12177 ?auto_12198 ) ) ( not ( = ?auto_12178 ?auto_12180 ) ) ( not ( = ?auto_12178 ?auto_12198 ) ) ( not ( = ?auto_12180 ?auto_12206 ) ) ( not ( = ?auto_12180 ?auto_12215 ) ) ( not ( = ?auto_12180 ?auto_12216 ) ) ( not ( = ?auto_12180 ?auto_12197 ) ) ( not ( = ?auto_12196 ?auto_12202 ) ) ( not ( = ?auto_12196 ?auto_12210 ) ) ( not ( = ?auto_12196 ?auto_12209 ) ) ( not ( = ?auto_12212 ?auto_12201 ) ) ( not ( = ?auto_12212 ?auto_12195 ) ) ( not ( = ?auto_12212 ?auto_12199 ) ) ( not ( = ?auto_12198 ?auto_12206 ) ) ( not ( = ?auto_12198 ?auto_12215 ) ) ( not ( = ?auto_12198 ?auto_12216 ) ) ( not ( = ?auto_12198 ?auto_12197 ) ) ( not ( = ?auto_12175 ?auto_12181 ) ) ( not ( = ?auto_12175 ?auto_12193 ) ) ( not ( = ?auto_12176 ?auto_12181 ) ) ( not ( = ?auto_12176 ?auto_12193 ) ) ( not ( = ?auto_12177 ?auto_12181 ) ) ( not ( = ?auto_12177 ?auto_12193 ) ) ( not ( = ?auto_12178 ?auto_12181 ) ) ( not ( = ?auto_12178 ?auto_12193 ) ) ( not ( = ?auto_12179 ?auto_12181 ) ) ( not ( = ?auto_12179 ?auto_12193 ) ) ( not ( = ?auto_12181 ?auto_12198 ) ) ( not ( = ?auto_12181 ?auto_12206 ) ) ( not ( = ?auto_12181 ?auto_12215 ) ) ( not ( = ?auto_12181 ?auto_12216 ) ) ( not ( = ?auto_12181 ?auto_12197 ) ) ( not ( = ?auto_12193 ?auto_12198 ) ) ( not ( = ?auto_12193 ?auto_12206 ) ) ( not ( = ?auto_12193 ?auto_12215 ) ) ( not ( = ?auto_12193 ?auto_12216 ) ) ( not ( = ?auto_12193 ?auto_12197 ) ) ( not ( = ?auto_12175 ?auto_12182 ) ) ( not ( = ?auto_12175 ?auto_12203 ) ) ( not ( = ?auto_12176 ?auto_12182 ) ) ( not ( = ?auto_12176 ?auto_12203 ) ) ( not ( = ?auto_12177 ?auto_12182 ) ) ( not ( = ?auto_12177 ?auto_12203 ) ) ( not ( = ?auto_12178 ?auto_12182 ) ) ( not ( = ?auto_12178 ?auto_12203 ) ) ( not ( = ?auto_12179 ?auto_12182 ) ) ( not ( = ?auto_12179 ?auto_12203 ) ) ( not ( = ?auto_12180 ?auto_12182 ) ) ( not ( = ?auto_12180 ?auto_12203 ) ) ( not ( = ?auto_12182 ?auto_12193 ) ) ( not ( = ?auto_12182 ?auto_12198 ) ) ( not ( = ?auto_12182 ?auto_12206 ) ) ( not ( = ?auto_12182 ?auto_12215 ) ) ( not ( = ?auto_12182 ?auto_12216 ) ) ( not ( = ?auto_12182 ?auto_12197 ) ) ( not ( = ?auto_12213 ?auto_12210 ) ) ( not ( = ?auto_12213 ?auto_12196 ) ) ( not ( = ?auto_12213 ?auto_12202 ) ) ( not ( = ?auto_12213 ?auto_12209 ) ) ( not ( = ?auto_12205 ?auto_12195 ) ) ( not ( = ?auto_12205 ?auto_12212 ) ) ( not ( = ?auto_12205 ?auto_12201 ) ) ( not ( = ?auto_12205 ?auto_12199 ) ) ( not ( = ?auto_12203 ?auto_12193 ) ) ( not ( = ?auto_12203 ?auto_12198 ) ) ( not ( = ?auto_12203 ?auto_12206 ) ) ( not ( = ?auto_12203 ?auto_12215 ) ) ( not ( = ?auto_12203 ?auto_12216 ) ) ( not ( = ?auto_12203 ?auto_12197 ) ) ( not ( = ?auto_12175 ?auto_12183 ) ) ( not ( = ?auto_12175 ?auto_12194 ) ) ( not ( = ?auto_12176 ?auto_12183 ) ) ( not ( = ?auto_12176 ?auto_12194 ) ) ( not ( = ?auto_12177 ?auto_12183 ) ) ( not ( = ?auto_12177 ?auto_12194 ) ) ( not ( = ?auto_12178 ?auto_12183 ) ) ( not ( = ?auto_12178 ?auto_12194 ) ) ( not ( = ?auto_12179 ?auto_12183 ) ) ( not ( = ?auto_12179 ?auto_12194 ) ) ( not ( = ?auto_12180 ?auto_12183 ) ) ( not ( = ?auto_12180 ?auto_12194 ) ) ( not ( = ?auto_12181 ?auto_12183 ) ) ( not ( = ?auto_12181 ?auto_12194 ) ) ( not ( = ?auto_12183 ?auto_12203 ) ) ( not ( = ?auto_12183 ?auto_12193 ) ) ( not ( = ?auto_12183 ?auto_12198 ) ) ( not ( = ?auto_12183 ?auto_12206 ) ) ( not ( = ?auto_12183 ?auto_12215 ) ) ( not ( = ?auto_12183 ?auto_12216 ) ) ( not ( = ?auto_12183 ?auto_12197 ) ) ( not ( = ?auto_12214 ?auto_12213 ) ) ( not ( = ?auto_12214 ?auto_12210 ) ) ( not ( = ?auto_12214 ?auto_12196 ) ) ( not ( = ?auto_12214 ?auto_12202 ) ) ( not ( = ?auto_12214 ?auto_12209 ) ) ( not ( = ?auto_12207 ?auto_12205 ) ) ( not ( = ?auto_12207 ?auto_12195 ) ) ( not ( = ?auto_12207 ?auto_12212 ) ) ( not ( = ?auto_12207 ?auto_12201 ) ) ( not ( = ?auto_12207 ?auto_12199 ) ) ( not ( = ?auto_12194 ?auto_12203 ) ) ( not ( = ?auto_12194 ?auto_12193 ) ) ( not ( = ?auto_12194 ?auto_12198 ) ) ( not ( = ?auto_12194 ?auto_12206 ) ) ( not ( = ?auto_12194 ?auto_12215 ) ) ( not ( = ?auto_12194 ?auto_12216 ) ) ( not ( = ?auto_12194 ?auto_12197 ) ) ( not ( = ?auto_12175 ?auto_12184 ) ) ( not ( = ?auto_12175 ?auto_12211 ) ) ( not ( = ?auto_12176 ?auto_12184 ) ) ( not ( = ?auto_12176 ?auto_12211 ) ) ( not ( = ?auto_12177 ?auto_12184 ) ) ( not ( = ?auto_12177 ?auto_12211 ) ) ( not ( = ?auto_12178 ?auto_12184 ) ) ( not ( = ?auto_12178 ?auto_12211 ) ) ( not ( = ?auto_12179 ?auto_12184 ) ) ( not ( = ?auto_12179 ?auto_12211 ) ) ( not ( = ?auto_12180 ?auto_12184 ) ) ( not ( = ?auto_12180 ?auto_12211 ) ) ( not ( = ?auto_12181 ?auto_12184 ) ) ( not ( = ?auto_12181 ?auto_12211 ) ) ( not ( = ?auto_12182 ?auto_12184 ) ) ( not ( = ?auto_12182 ?auto_12211 ) ) ( not ( = ?auto_12184 ?auto_12194 ) ) ( not ( = ?auto_12184 ?auto_12203 ) ) ( not ( = ?auto_12184 ?auto_12193 ) ) ( not ( = ?auto_12184 ?auto_12198 ) ) ( not ( = ?auto_12184 ?auto_12206 ) ) ( not ( = ?auto_12184 ?auto_12215 ) ) ( not ( = ?auto_12184 ?auto_12216 ) ) ( not ( = ?auto_12184 ?auto_12197 ) ) ( not ( = ?auto_12200 ?auto_12214 ) ) ( not ( = ?auto_12200 ?auto_12213 ) ) ( not ( = ?auto_12200 ?auto_12210 ) ) ( not ( = ?auto_12200 ?auto_12196 ) ) ( not ( = ?auto_12200 ?auto_12202 ) ) ( not ( = ?auto_12200 ?auto_12209 ) ) ( not ( = ?auto_12218 ?auto_12207 ) ) ( not ( = ?auto_12218 ?auto_12205 ) ) ( not ( = ?auto_12218 ?auto_12195 ) ) ( not ( = ?auto_12218 ?auto_12212 ) ) ( not ( = ?auto_12218 ?auto_12201 ) ) ( not ( = ?auto_12218 ?auto_12199 ) ) ( not ( = ?auto_12211 ?auto_12194 ) ) ( not ( = ?auto_12211 ?auto_12203 ) ) ( not ( = ?auto_12211 ?auto_12193 ) ) ( not ( = ?auto_12211 ?auto_12198 ) ) ( not ( = ?auto_12211 ?auto_12206 ) ) ( not ( = ?auto_12211 ?auto_12215 ) ) ( not ( = ?auto_12211 ?auto_12216 ) ) ( not ( = ?auto_12211 ?auto_12197 ) ) ( not ( = ?auto_12175 ?auto_12185 ) ) ( not ( = ?auto_12175 ?auto_12217 ) ) ( not ( = ?auto_12176 ?auto_12185 ) ) ( not ( = ?auto_12176 ?auto_12217 ) ) ( not ( = ?auto_12177 ?auto_12185 ) ) ( not ( = ?auto_12177 ?auto_12217 ) ) ( not ( = ?auto_12178 ?auto_12185 ) ) ( not ( = ?auto_12178 ?auto_12217 ) ) ( not ( = ?auto_12179 ?auto_12185 ) ) ( not ( = ?auto_12179 ?auto_12217 ) ) ( not ( = ?auto_12180 ?auto_12185 ) ) ( not ( = ?auto_12180 ?auto_12217 ) ) ( not ( = ?auto_12181 ?auto_12185 ) ) ( not ( = ?auto_12181 ?auto_12217 ) ) ( not ( = ?auto_12182 ?auto_12185 ) ) ( not ( = ?auto_12182 ?auto_12217 ) ) ( not ( = ?auto_12183 ?auto_12185 ) ) ( not ( = ?auto_12183 ?auto_12217 ) ) ( not ( = ?auto_12185 ?auto_12211 ) ) ( not ( = ?auto_12185 ?auto_12194 ) ) ( not ( = ?auto_12185 ?auto_12203 ) ) ( not ( = ?auto_12185 ?auto_12193 ) ) ( not ( = ?auto_12185 ?auto_12198 ) ) ( not ( = ?auto_12185 ?auto_12206 ) ) ( not ( = ?auto_12185 ?auto_12215 ) ) ( not ( = ?auto_12185 ?auto_12216 ) ) ( not ( = ?auto_12185 ?auto_12197 ) ) ( not ( = ?auto_12204 ?auto_12200 ) ) ( not ( = ?auto_12204 ?auto_12214 ) ) ( not ( = ?auto_12204 ?auto_12213 ) ) ( not ( = ?auto_12204 ?auto_12210 ) ) ( not ( = ?auto_12204 ?auto_12196 ) ) ( not ( = ?auto_12204 ?auto_12202 ) ) ( not ( = ?auto_12204 ?auto_12209 ) ) ( not ( = ?auto_12208 ?auto_12218 ) ) ( not ( = ?auto_12208 ?auto_12207 ) ) ( not ( = ?auto_12208 ?auto_12205 ) ) ( not ( = ?auto_12208 ?auto_12195 ) ) ( not ( = ?auto_12208 ?auto_12212 ) ) ( not ( = ?auto_12208 ?auto_12201 ) ) ( not ( = ?auto_12208 ?auto_12199 ) ) ( not ( = ?auto_12217 ?auto_12211 ) ) ( not ( = ?auto_12217 ?auto_12194 ) ) ( not ( = ?auto_12217 ?auto_12203 ) ) ( not ( = ?auto_12217 ?auto_12193 ) ) ( not ( = ?auto_12217 ?auto_12198 ) ) ( not ( = ?auto_12217 ?auto_12206 ) ) ( not ( = ?auto_12217 ?auto_12215 ) ) ( not ( = ?auto_12217 ?auto_12216 ) ) ( not ( = ?auto_12217 ?auto_12197 ) ) ( not ( = ?auto_12175 ?auto_12186 ) ) ( not ( = ?auto_12175 ?auto_12192 ) ) ( not ( = ?auto_12176 ?auto_12186 ) ) ( not ( = ?auto_12176 ?auto_12192 ) ) ( not ( = ?auto_12177 ?auto_12186 ) ) ( not ( = ?auto_12177 ?auto_12192 ) ) ( not ( = ?auto_12178 ?auto_12186 ) ) ( not ( = ?auto_12178 ?auto_12192 ) ) ( not ( = ?auto_12179 ?auto_12186 ) ) ( not ( = ?auto_12179 ?auto_12192 ) ) ( not ( = ?auto_12180 ?auto_12186 ) ) ( not ( = ?auto_12180 ?auto_12192 ) ) ( not ( = ?auto_12181 ?auto_12186 ) ) ( not ( = ?auto_12181 ?auto_12192 ) ) ( not ( = ?auto_12182 ?auto_12186 ) ) ( not ( = ?auto_12182 ?auto_12192 ) ) ( not ( = ?auto_12183 ?auto_12186 ) ) ( not ( = ?auto_12183 ?auto_12192 ) ) ( not ( = ?auto_12184 ?auto_12186 ) ) ( not ( = ?auto_12184 ?auto_12192 ) ) ( not ( = ?auto_12186 ?auto_12217 ) ) ( not ( = ?auto_12186 ?auto_12211 ) ) ( not ( = ?auto_12186 ?auto_12194 ) ) ( not ( = ?auto_12186 ?auto_12203 ) ) ( not ( = ?auto_12186 ?auto_12193 ) ) ( not ( = ?auto_12186 ?auto_12198 ) ) ( not ( = ?auto_12186 ?auto_12206 ) ) ( not ( = ?auto_12186 ?auto_12215 ) ) ( not ( = ?auto_12186 ?auto_12216 ) ) ( not ( = ?auto_12186 ?auto_12197 ) ) ( not ( = ?auto_12191 ?auto_12204 ) ) ( not ( = ?auto_12191 ?auto_12200 ) ) ( not ( = ?auto_12191 ?auto_12214 ) ) ( not ( = ?auto_12191 ?auto_12213 ) ) ( not ( = ?auto_12191 ?auto_12210 ) ) ( not ( = ?auto_12191 ?auto_12196 ) ) ( not ( = ?auto_12191 ?auto_12202 ) ) ( not ( = ?auto_12191 ?auto_12209 ) ) ( not ( = ?auto_12189 ?auto_12208 ) ) ( not ( = ?auto_12189 ?auto_12218 ) ) ( not ( = ?auto_12189 ?auto_12207 ) ) ( not ( = ?auto_12189 ?auto_12205 ) ) ( not ( = ?auto_12189 ?auto_12195 ) ) ( not ( = ?auto_12189 ?auto_12212 ) ) ( not ( = ?auto_12189 ?auto_12201 ) ) ( not ( = ?auto_12189 ?auto_12199 ) ) ( not ( = ?auto_12192 ?auto_12217 ) ) ( not ( = ?auto_12192 ?auto_12211 ) ) ( not ( = ?auto_12192 ?auto_12194 ) ) ( not ( = ?auto_12192 ?auto_12203 ) ) ( not ( = ?auto_12192 ?auto_12193 ) ) ( not ( = ?auto_12192 ?auto_12198 ) ) ( not ( = ?auto_12192 ?auto_12206 ) ) ( not ( = ?auto_12192 ?auto_12215 ) ) ( not ( = ?auto_12192 ?auto_12216 ) ) ( not ( = ?auto_12192 ?auto_12197 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_12175 ?auto_12176 ?auto_12177 ?auto_12178 ?auto_12179 ?auto_12180 ?auto_12181 ?auto_12182 ?auto_12183 ?auto_12184 ?auto_12185 )
      ( MAKE-1CRATE ?auto_12185 ?auto_12186 )
      ( MAKE-11CRATE-VERIFY ?auto_12175 ?auto_12176 ?auto_12177 ?auto_12178 ?auto_12179 ?auto_12180 ?auto_12181 ?auto_12182 ?auto_12183 ?auto_12184 ?auto_12185 ?auto_12186 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_12242 - SURFACE
      ?auto_12243 - SURFACE
      ?auto_12244 - SURFACE
      ?auto_12245 - SURFACE
      ?auto_12246 - SURFACE
      ?auto_12247 - SURFACE
      ?auto_12248 - SURFACE
      ?auto_12249 - SURFACE
      ?auto_12250 - SURFACE
      ?auto_12251 - SURFACE
      ?auto_12252 - SURFACE
      ?auto_12253 - SURFACE
      ?auto_12254 - SURFACE
    )
    :vars
    (
      ?auto_12260 - HOIST
      ?auto_12255 - PLACE
      ?auto_12256 - PLACE
      ?auto_12257 - HOIST
      ?auto_12258 - SURFACE
      ?auto_12265 - PLACE
      ?auto_12289 - HOIST
      ?auto_12261 - SURFACE
      ?auto_12267 - PLACE
      ?auto_12272 - HOIST
      ?auto_12286 - SURFACE
      ?auto_12263 - PLACE
      ?auto_12262 - HOIST
      ?auto_12277 - SURFACE
      ?auto_12287 - PLACE
      ?auto_12269 - HOIST
      ?auto_12266 - SURFACE
      ?auto_12288 - PLACE
      ?auto_12268 - HOIST
      ?auto_12281 - SURFACE
      ?auto_12271 - PLACE
      ?auto_12273 - HOIST
      ?auto_12275 - SURFACE
      ?auto_12276 - PLACE
      ?auto_12274 - HOIST
      ?auto_12278 - SURFACE
      ?auto_12282 - PLACE
      ?auto_12280 - HOIST
      ?auto_12284 - SURFACE
      ?auto_12285 - SURFACE
      ?auto_12270 - PLACE
      ?auto_12264 - HOIST
      ?auto_12279 - SURFACE
      ?auto_12283 - SURFACE
      ?auto_12259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12260 ?auto_12255 ) ( IS-CRATE ?auto_12254 ) ( not ( = ?auto_12256 ?auto_12255 ) ) ( HOIST-AT ?auto_12257 ?auto_12256 ) ( AVAILABLE ?auto_12257 ) ( SURFACE-AT ?auto_12254 ?auto_12256 ) ( ON ?auto_12254 ?auto_12258 ) ( CLEAR ?auto_12254 ) ( not ( = ?auto_12253 ?auto_12254 ) ) ( not ( = ?auto_12253 ?auto_12258 ) ) ( not ( = ?auto_12254 ?auto_12258 ) ) ( not ( = ?auto_12260 ?auto_12257 ) ) ( IS-CRATE ?auto_12253 ) ( not ( = ?auto_12265 ?auto_12255 ) ) ( HOIST-AT ?auto_12289 ?auto_12265 ) ( AVAILABLE ?auto_12289 ) ( SURFACE-AT ?auto_12253 ?auto_12265 ) ( ON ?auto_12253 ?auto_12261 ) ( CLEAR ?auto_12253 ) ( not ( = ?auto_12252 ?auto_12253 ) ) ( not ( = ?auto_12252 ?auto_12261 ) ) ( not ( = ?auto_12253 ?auto_12261 ) ) ( not ( = ?auto_12260 ?auto_12289 ) ) ( IS-CRATE ?auto_12252 ) ( not ( = ?auto_12267 ?auto_12255 ) ) ( HOIST-AT ?auto_12272 ?auto_12267 ) ( AVAILABLE ?auto_12272 ) ( SURFACE-AT ?auto_12252 ?auto_12267 ) ( ON ?auto_12252 ?auto_12286 ) ( CLEAR ?auto_12252 ) ( not ( = ?auto_12251 ?auto_12252 ) ) ( not ( = ?auto_12251 ?auto_12286 ) ) ( not ( = ?auto_12252 ?auto_12286 ) ) ( not ( = ?auto_12260 ?auto_12272 ) ) ( IS-CRATE ?auto_12251 ) ( not ( = ?auto_12263 ?auto_12255 ) ) ( HOIST-AT ?auto_12262 ?auto_12263 ) ( AVAILABLE ?auto_12262 ) ( SURFACE-AT ?auto_12251 ?auto_12263 ) ( ON ?auto_12251 ?auto_12277 ) ( CLEAR ?auto_12251 ) ( not ( = ?auto_12250 ?auto_12251 ) ) ( not ( = ?auto_12250 ?auto_12277 ) ) ( not ( = ?auto_12251 ?auto_12277 ) ) ( not ( = ?auto_12260 ?auto_12262 ) ) ( IS-CRATE ?auto_12250 ) ( not ( = ?auto_12287 ?auto_12255 ) ) ( HOIST-AT ?auto_12269 ?auto_12287 ) ( AVAILABLE ?auto_12269 ) ( SURFACE-AT ?auto_12250 ?auto_12287 ) ( ON ?auto_12250 ?auto_12266 ) ( CLEAR ?auto_12250 ) ( not ( = ?auto_12249 ?auto_12250 ) ) ( not ( = ?auto_12249 ?auto_12266 ) ) ( not ( = ?auto_12250 ?auto_12266 ) ) ( not ( = ?auto_12260 ?auto_12269 ) ) ( IS-CRATE ?auto_12249 ) ( not ( = ?auto_12288 ?auto_12255 ) ) ( HOIST-AT ?auto_12268 ?auto_12288 ) ( AVAILABLE ?auto_12268 ) ( SURFACE-AT ?auto_12249 ?auto_12288 ) ( ON ?auto_12249 ?auto_12281 ) ( CLEAR ?auto_12249 ) ( not ( = ?auto_12248 ?auto_12249 ) ) ( not ( = ?auto_12248 ?auto_12281 ) ) ( not ( = ?auto_12249 ?auto_12281 ) ) ( not ( = ?auto_12260 ?auto_12268 ) ) ( IS-CRATE ?auto_12248 ) ( not ( = ?auto_12271 ?auto_12255 ) ) ( HOIST-AT ?auto_12273 ?auto_12271 ) ( SURFACE-AT ?auto_12248 ?auto_12271 ) ( ON ?auto_12248 ?auto_12275 ) ( CLEAR ?auto_12248 ) ( not ( = ?auto_12247 ?auto_12248 ) ) ( not ( = ?auto_12247 ?auto_12275 ) ) ( not ( = ?auto_12248 ?auto_12275 ) ) ( not ( = ?auto_12260 ?auto_12273 ) ) ( IS-CRATE ?auto_12247 ) ( not ( = ?auto_12276 ?auto_12255 ) ) ( HOIST-AT ?auto_12274 ?auto_12276 ) ( AVAILABLE ?auto_12274 ) ( SURFACE-AT ?auto_12247 ?auto_12276 ) ( ON ?auto_12247 ?auto_12278 ) ( CLEAR ?auto_12247 ) ( not ( = ?auto_12246 ?auto_12247 ) ) ( not ( = ?auto_12246 ?auto_12278 ) ) ( not ( = ?auto_12247 ?auto_12278 ) ) ( not ( = ?auto_12260 ?auto_12274 ) ) ( IS-CRATE ?auto_12246 ) ( not ( = ?auto_12282 ?auto_12255 ) ) ( HOIST-AT ?auto_12280 ?auto_12282 ) ( AVAILABLE ?auto_12280 ) ( SURFACE-AT ?auto_12246 ?auto_12282 ) ( ON ?auto_12246 ?auto_12284 ) ( CLEAR ?auto_12246 ) ( not ( = ?auto_12245 ?auto_12246 ) ) ( not ( = ?auto_12245 ?auto_12284 ) ) ( not ( = ?auto_12246 ?auto_12284 ) ) ( not ( = ?auto_12260 ?auto_12280 ) ) ( IS-CRATE ?auto_12245 ) ( SURFACE-AT ?auto_12245 ?auto_12271 ) ( ON ?auto_12245 ?auto_12285 ) ( CLEAR ?auto_12245 ) ( not ( = ?auto_12244 ?auto_12245 ) ) ( not ( = ?auto_12244 ?auto_12285 ) ) ( not ( = ?auto_12245 ?auto_12285 ) ) ( IS-CRATE ?auto_12244 ) ( not ( = ?auto_12270 ?auto_12255 ) ) ( HOIST-AT ?auto_12264 ?auto_12270 ) ( AVAILABLE ?auto_12264 ) ( SURFACE-AT ?auto_12244 ?auto_12270 ) ( ON ?auto_12244 ?auto_12279 ) ( CLEAR ?auto_12244 ) ( not ( = ?auto_12243 ?auto_12244 ) ) ( not ( = ?auto_12243 ?auto_12279 ) ) ( not ( = ?auto_12244 ?auto_12279 ) ) ( not ( = ?auto_12260 ?auto_12264 ) ) ( SURFACE-AT ?auto_12242 ?auto_12255 ) ( CLEAR ?auto_12242 ) ( IS-CRATE ?auto_12243 ) ( AVAILABLE ?auto_12260 ) ( AVAILABLE ?auto_12273 ) ( SURFACE-AT ?auto_12243 ?auto_12271 ) ( ON ?auto_12243 ?auto_12283 ) ( CLEAR ?auto_12243 ) ( TRUCK-AT ?auto_12259 ?auto_12255 ) ( not ( = ?auto_12242 ?auto_12243 ) ) ( not ( = ?auto_12242 ?auto_12283 ) ) ( not ( = ?auto_12243 ?auto_12283 ) ) ( not ( = ?auto_12242 ?auto_12244 ) ) ( not ( = ?auto_12242 ?auto_12279 ) ) ( not ( = ?auto_12244 ?auto_12283 ) ) ( not ( = ?auto_12270 ?auto_12271 ) ) ( not ( = ?auto_12264 ?auto_12273 ) ) ( not ( = ?auto_12279 ?auto_12283 ) ) ( not ( = ?auto_12242 ?auto_12245 ) ) ( not ( = ?auto_12242 ?auto_12285 ) ) ( not ( = ?auto_12243 ?auto_12245 ) ) ( not ( = ?auto_12243 ?auto_12285 ) ) ( not ( = ?auto_12245 ?auto_12279 ) ) ( not ( = ?auto_12245 ?auto_12283 ) ) ( not ( = ?auto_12285 ?auto_12279 ) ) ( not ( = ?auto_12285 ?auto_12283 ) ) ( not ( = ?auto_12242 ?auto_12246 ) ) ( not ( = ?auto_12242 ?auto_12284 ) ) ( not ( = ?auto_12243 ?auto_12246 ) ) ( not ( = ?auto_12243 ?auto_12284 ) ) ( not ( = ?auto_12244 ?auto_12246 ) ) ( not ( = ?auto_12244 ?auto_12284 ) ) ( not ( = ?auto_12246 ?auto_12285 ) ) ( not ( = ?auto_12246 ?auto_12279 ) ) ( not ( = ?auto_12246 ?auto_12283 ) ) ( not ( = ?auto_12282 ?auto_12271 ) ) ( not ( = ?auto_12282 ?auto_12270 ) ) ( not ( = ?auto_12280 ?auto_12273 ) ) ( not ( = ?auto_12280 ?auto_12264 ) ) ( not ( = ?auto_12284 ?auto_12285 ) ) ( not ( = ?auto_12284 ?auto_12279 ) ) ( not ( = ?auto_12284 ?auto_12283 ) ) ( not ( = ?auto_12242 ?auto_12247 ) ) ( not ( = ?auto_12242 ?auto_12278 ) ) ( not ( = ?auto_12243 ?auto_12247 ) ) ( not ( = ?auto_12243 ?auto_12278 ) ) ( not ( = ?auto_12244 ?auto_12247 ) ) ( not ( = ?auto_12244 ?auto_12278 ) ) ( not ( = ?auto_12245 ?auto_12247 ) ) ( not ( = ?auto_12245 ?auto_12278 ) ) ( not ( = ?auto_12247 ?auto_12284 ) ) ( not ( = ?auto_12247 ?auto_12285 ) ) ( not ( = ?auto_12247 ?auto_12279 ) ) ( not ( = ?auto_12247 ?auto_12283 ) ) ( not ( = ?auto_12276 ?auto_12282 ) ) ( not ( = ?auto_12276 ?auto_12271 ) ) ( not ( = ?auto_12276 ?auto_12270 ) ) ( not ( = ?auto_12274 ?auto_12280 ) ) ( not ( = ?auto_12274 ?auto_12273 ) ) ( not ( = ?auto_12274 ?auto_12264 ) ) ( not ( = ?auto_12278 ?auto_12284 ) ) ( not ( = ?auto_12278 ?auto_12285 ) ) ( not ( = ?auto_12278 ?auto_12279 ) ) ( not ( = ?auto_12278 ?auto_12283 ) ) ( not ( = ?auto_12242 ?auto_12248 ) ) ( not ( = ?auto_12242 ?auto_12275 ) ) ( not ( = ?auto_12243 ?auto_12248 ) ) ( not ( = ?auto_12243 ?auto_12275 ) ) ( not ( = ?auto_12244 ?auto_12248 ) ) ( not ( = ?auto_12244 ?auto_12275 ) ) ( not ( = ?auto_12245 ?auto_12248 ) ) ( not ( = ?auto_12245 ?auto_12275 ) ) ( not ( = ?auto_12246 ?auto_12248 ) ) ( not ( = ?auto_12246 ?auto_12275 ) ) ( not ( = ?auto_12248 ?auto_12278 ) ) ( not ( = ?auto_12248 ?auto_12284 ) ) ( not ( = ?auto_12248 ?auto_12285 ) ) ( not ( = ?auto_12248 ?auto_12279 ) ) ( not ( = ?auto_12248 ?auto_12283 ) ) ( not ( = ?auto_12275 ?auto_12278 ) ) ( not ( = ?auto_12275 ?auto_12284 ) ) ( not ( = ?auto_12275 ?auto_12285 ) ) ( not ( = ?auto_12275 ?auto_12279 ) ) ( not ( = ?auto_12275 ?auto_12283 ) ) ( not ( = ?auto_12242 ?auto_12249 ) ) ( not ( = ?auto_12242 ?auto_12281 ) ) ( not ( = ?auto_12243 ?auto_12249 ) ) ( not ( = ?auto_12243 ?auto_12281 ) ) ( not ( = ?auto_12244 ?auto_12249 ) ) ( not ( = ?auto_12244 ?auto_12281 ) ) ( not ( = ?auto_12245 ?auto_12249 ) ) ( not ( = ?auto_12245 ?auto_12281 ) ) ( not ( = ?auto_12246 ?auto_12249 ) ) ( not ( = ?auto_12246 ?auto_12281 ) ) ( not ( = ?auto_12247 ?auto_12249 ) ) ( not ( = ?auto_12247 ?auto_12281 ) ) ( not ( = ?auto_12249 ?auto_12275 ) ) ( not ( = ?auto_12249 ?auto_12278 ) ) ( not ( = ?auto_12249 ?auto_12284 ) ) ( not ( = ?auto_12249 ?auto_12285 ) ) ( not ( = ?auto_12249 ?auto_12279 ) ) ( not ( = ?auto_12249 ?auto_12283 ) ) ( not ( = ?auto_12288 ?auto_12271 ) ) ( not ( = ?auto_12288 ?auto_12276 ) ) ( not ( = ?auto_12288 ?auto_12282 ) ) ( not ( = ?auto_12288 ?auto_12270 ) ) ( not ( = ?auto_12268 ?auto_12273 ) ) ( not ( = ?auto_12268 ?auto_12274 ) ) ( not ( = ?auto_12268 ?auto_12280 ) ) ( not ( = ?auto_12268 ?auto_12264 ) ) ( not ( = ?auto_12281 ?auto_12275 ) ) ( not ( = ?auto_12281 ?auto_12278 ) ) ( not ( = ?auto_12281 ?auto_12284 ) ) ( not ( = ?auto_12281 ?auto_12285 ) ) ( not ( = ?auto_12281 ?auto_12279 ) ) ( not ( = ?auto_12281 ?auto_12283 ) ) ( not ( = ?auto_12242 ?auto_12250 ) ) ( not ( = ?auto_12242 ?auto_12266 ) ) ( not ( = ?auto_12243 ?auto_12250 ) ) ( not ( = ?auto_12243 ?auto_12266 ) ) ( not ( = ?auto_12244 ?auto_12250 ) ) ( not ( = ?auto_12244 ?auto_12266 ) ) ( not ( = ?auto_12245 ?auto_12250 ) ) ( not ( = ?auto_12245 ?auto_12266 ) ) ( not ( = ?auto_12246 ?auto_12250 ) ) ( not ( = ?auto_12246 ?auto_12266 ) ) ( not ( = ?auto_12247 ?auto_12250 ) ) ( not ( = ?auto_12247 ?auto_12266 ) ) ( not ( = ?auto_12248 ?auto_12250 ) ) ( not ( = ?auto_12248 ?auto_12266 ) ) ( not ( = ?auto_12250 ?auto_12281 ) ) ( not ( = ?auto_12250 ?auto_12275 ) ) ( not ( = ?auto_12250 ?auto_12278 ) ) ( not ( = ?auto_12250 ?auto_12284 ) ) ( not ( = ?auto_12250 ?auto_12285 ) ) ( not ( = ?auto_12250 ?auto_12279 ) ) ( not ( = ?auto_12250 ?auto_12283 ) ) ( not ( = ?auto_12287 ?auto_12288 ) ) ( not ( = ?auto_12287 ?auto_12271 ) ) ( not ( = ?auto_12287 ?auto_12276 ) ) ( not ( = ?auto_12287 ?auto_12282 ) ) ( not ( = ?auto_12287 ?auto_12270 ) ) ( not ( = ?auto_12269 ?auto_12268 ) ) ( not ( = ?auto_12269 ?auto_12273 ) ) ( not ( = ?auto_12269 ?auto_12274 ) ) ( not ( = ?auto_12269 ?auto_12280 ) ) ( not ( = ?auto_12269 ?auto_12264 ) ) ( not ( = ?auto_12266 ?auto_12281 ) ) ( not ( = ?auto_12266 ?auto_12275 ) ) ( not ( = ?auto_12266 ?auto_12278 ) ) ( not ( = ?auto_12266 ?auto_12284 ) ) ( not ( = ?auto_12266 ?auto_12285 ) ) ( not ( = ?auto_12266 ?auto_12279 ) ) ( not ( = ?auto_12266 ?auto_12283 ) ) ( not ( = ?auto_12242 ?auto_12251 ) ) ( not ( = ?auto_12242 ?auto_12277 ) ) ( not ( = ?auto_12243 ?auto_12251 ) ) ( not ( = ?auto_12243 ?auto_12277 ) ) ( not ( = ?auto_12244 ?auto_12251 ) ) ( not ( = ?auto_12244 ?auto_12277 ) ) ( not ( = ?auto_12245 ?auto_12251 ) ) ( not ( = ?auto_12245 ?auto_12277 ) ) ( not ( = ?auto_12246 ?auto_12251 ) ) ( not ( = ?auto_12246 ?auto_12277 ) ) ( not ( = ?auto_12247 ?auto_12251 ) ) ( not ( = ?auto_12247 ?auto_12277 ) ) ( not ( = ?auto_12248 ?auto_12251 ) ) ( not ( = ?auto_12248 ?auto_12277 ) ) ( not ( = ?auto_12249 ?auto_12251 ) ) ( not ( = ?auto_12249 ?auto_12277 ) ) ( not ( = ?auto_12251 ?auto_12266 ) ) ( not ( = ?auto_12251 ?auto_12281 ) ) ( not ( = ?auto_12251 ?auto_12275 ) ) ( not ( = ?auto_12251 ?auto_12278 ) ) ( not ( = ?auto_12251 ?auto_12284 ) ) ( not ( = ?auto_12251 ?auto_12285 ) ) ( not ( = ?auto_12251 ?auto_12279 ) ) ( not ( = ?auto_12251 ?auto_12283 ) ) ( not ( = ?auto_12263 ?auto_12287 ) ) ( not ( = ?auto_12263 ?auto_12288 ) ) ( not ( = ?auto_12263 ?auto_12271 ) ) ( not ( = ?auto_12263 ?auto_12276 ) ) ( not ( = ?auto_12263 ?auto_12282 ) ) ( not ( = ?auto_12263 ?auto_12270 ) ) ( not ( = ?auto_12262 ?auto_12269 ) ) ( not ( = ?auto_12262 ?auto_12268 ) ) ( not ( = ?auto_12262 ?auto_12273 ) ) ( not ( = ?auto_12262 ?auto_12274 ) ) ( not ( = ?auto_12262 ?auto_12280 ) ) ( not ( = ?auto_12262 ?auto_12264 ) ) ( not ( = ?auto_12277 ?auto_12266 ) ) ( not ( = ?auto_12277 ?auto_12281 ) ) ( not ( = ?auto_12277 ?auto_12275 ) ) ( not ( = ?auto_12277 ?auto_12278 ) ) ( not ( = ?auto_12277 ?auto_12284 ) ) ( not ( = ?auto_12277 ?auto_12285 ) ) ( not ( = ?auto_12277 ?auto_12279 ) ) ( not ( = ?auto_12277 ?auto_12283 ) ) ( not ( = ?auto_12242 ?auto_12252 ) ) ( not ( = ?auto_12242 ?auto_12286 ) ) ( not ( = ?auto_12243 ?auto_12252 ) ) ( not ( = ?auto_12243 ?auto_12286 ) ) ( not ( = ?auto_12244 ?auto_12252 ) ) ( not ( = ?auto_12244 ?auto_12286 ) ) ( not ( = ?auto_12245 ?auto_12252 ) ) ( not ( = ?auto_12245 ?auto_12286 ) ) ( not ( = ?auto_12246 ?auto_12252 ) ) ( not ( = ?auto_12246 ?auto_12286 ) ) ( not ( = ?auto_12247 ?auto_12252 ) ) ( not ( = ?auto_12247 ?auto_12286 ) ) ( not ( = ?auto_12248 ?auto_12252 ) ) ( not ( = ?auto_12248 ?auto_12286 ) ) ( not ( = ?auto_12249 ?auto_12252 ) ) ( not ( = ?auto_12249 ?auto_12286 ) ) ( not ( = ?auto_12250 ?auto_12252 ) ) ( not ( = ?auto_12250 ?auto_12286 ) ) ( not ( = ?auto_12252 ?auto_12277 ) ) ( not ( = ?auto_12252 ?auto_12266 ) ) ( not ( = ?auto_12252 ?auto_12281 ) ) ( not ( = ?auto_12252 ?auto_12275 ) ) ( not ( = ?auto_12252 ?auto_12278 ) ) ( not ( = ?auto_12252 ?auto_12284 ) ) ( not ( = ?auto_12252 ?auto_12285 ) ) ( not ( = ?auto_12252 ?auto_12279 ) ) ( not ( = ?auto_12252 ?auto_12283 ) ) ( not ( = ?auto_12267 ?auto_12263 ) ) ( not ( = ?auto_12267 ?auto_12287 ) ) ( not ( = ?auto_12267 ?auto_12288 ) ) ( not ( = ?auto_12267 ?auto_12271 ) ) ( not ( = ?auto_12267 ?auto_12276 ) ) ( not ( = ?auto_12267 ?auto_12282 ) ) ( not ( = ?auto_12267 ?auto_12270 ) ) ( not ( = ?auto_12272 ?auto_12262 ) ) ( not ( = ?auto_12272 ?auto_12269 ) ) ( not ( = ?auto_12272 ?auto_12268 ) ) ( not ( = ?auto_12272 ?auto_12273 ) ) ( not ( = ?auto_12272 ?auto_12274 ) ) ( not ( = ?auto_12272 ?auto_12280 ) ) ( not ( = ?auto_12272 ?auto_12264 ) ) ( not ( = ?auto_12286 ?auto_12277 ) ) ( not ( = ?auto_12286 ?auto_12266 ) ) ( not ( = ?auto_12286 ?auto_12281 ) ) ( not ( = ?auto_12286 ?auto_12275 ) ) ( not ( = ?auto_12286 ?auto_12278 ) ) ( not ( = ?auto_12286 ?auto_12284 ) ) ( not ( = ?auto_12286 ?auto_12285 ) ) ( not ( = ?auto_12286 ?auto_12279 ) ) ( not ( = ?auto_12286 ?auto_12283 ) ) ( not ( = ?auto_12242 ?auto_12253 ) ) ( not ( = ?auto_12242 ?auto_12261 ) ) ( not ( = ?auto_12243 ?auto_12253 ) ) ( not ( = ?auto_12243 ?auto_12261 ) ) ( not ( = ?auto_12244 ?auto_12253 ) ) ( not ( = ?auto_12244 ?auto_12261 ) ) ( not ( = ?auto_12245 ?auto_12253 ) ) ( not ( = ?auto_12245 ?auto_12261 ) ) ( not ( = ?auto_12246 ?auto_12253 ) ) ( not ( = ?auto_12246 ?auto_12261 ) ) ( not ( = ?auto_12247 ?auto_12253 ) ) ( not ( = ?auto_12247 ?auto_12261 ) ) ( not ( = ?auto_12248 ?auto_12253 ) ) ( not ( = ?auto_12248 ?auto_12261 ) ) ( not ( = ?auto_12249 ?auto_12253 ) ) ( not ( = ?auto_12249 ?auto_12261 ) ) ( not ( = ?auto_12250 ?auto_12253 ) ) ( not ( = ?auto_12250 ?auto_12261 ) ) ( not ( = ?auto_12251 ?auto_12253 ) ) ( not ( = ?auto_12251 ?auto_12261 ) ) ( not ( = ?auto_12253 ?auto_12286 ) ) ( not ( = ?auto_12253 ?auto_12277 ) ) ( not ( = ?auto_12253 ?auto_12266 ) ) ( not ( = ?auto_12253 ?auto_12281 ) ) ( not ( = ?auto_12253 ?auto_12275 ) ) ( not ( = ?auto_12253 ?auto_12278 ) ) ( not ( = ?auto_12253 ?auto_12284 ) ) ( not ( = ?auto_12253 ?auto_12285 ) ) ( not ( = ?auto_12253 ?auto_12279 ) ) ( not ( = ?auto_12253 ?auto_12283 ) ) ( not ( = ?auto_12265 ?auto_12267 ) ) ( not ( = ?auto_12265 ?auto_12263 ) ) ( not ( = ?auto_12265 ?auto_12287 ) ) ( not ( = ?auto_12265 ?auto_12288 ) ) ( not ( = ?auto_12265 ?auto_12271 ) ) ( not ( = ?auto_12265 ?auto_12276 ) ) ( not ( = ?auto_12265 ?auto_12282 ) ) ( not ( = ?auto_12265 ?auto_12270 ) ) ( not ( = ?auto_12289 ?auto_12272 ) ) ( not ( = ?auto_12289 ?auto_12262 ) ) ( not ( = ?auto_12289 ?auto_12269 ) ) ( not ( = ?auto_12289 ?auto_12268 ) ) ( not ( = ?auto_12289 ?auto_12273 ) ) ( not ( = ?auto_12289 ?auto_12274 ) ) ( not ( = ?auto_12289 ?auto_12280 ) ) ( not ( = ?auto_12289 ?auto_12264 ) ) ( not ( = ?auto_12261 ?auto_12286 ) ) ( not ( = ?auto_12261 ?auto_12277 ) ) ( not ( = ?auto_12261 ?auto_12266 ) ) ( not ( = ?auto_12261 ?auto_12281 ) ) ( not ( = ?auto_12261 ?auto_12275 ) ) ( not ( = ?auto_12261 ?auto_12278 ) ) ( not ( = ?auto_12261 ?auto_12284 ) ) ( not ( = ?auto_12261 ?auto_12285 ) ) ( not ( = ?auto_12261 ?auto_12279 ) ) ( not ( = ?auto_12261 ?auto_12283 ) ) ( not ( = ?auto_12242 ?auto_12254 ) ) ( not ( = ?auto_12242 ?auto_12258 ) ) ( not ( = ?auto_12243 ?auto_12254 ) ) ( not ( = ?auto_12243 ?auto_12258 ) ) ( not ( = ?auto_12244 ?auto_12254 ) ) ( not ( = ?auto_12244 ?auto_12258 ) ) ( not ( = ?auto_12245 ?auto_12254 ) ) ( not ( = ?auto_12245 ?auto_12258 ) ) ( not ( = ?auto_12246 ?auto_12254 ) ) ( not ( = ?auto_12246 ?auto_12258 ) ) ( not ( = ?auto_12247 ?auto_12254 ) ) ( not ( = ?auto_12247 ?auto_12258 ) ) ( not ( = ?auto_12248 ?auto_12254 ) ) ( not ( = ?auto_12248 ?auto_12258 ) ) ( not ( = ?auto_12249 ?auto_12254 ) ) ( not ( = ?auto_12249 ?auto_12258 ) ) ( not ( = ?auto_12250 ?auto_12254 ) ) ( not ( = ?auto_12250 ?auto_12258 ) ) ( not ( = ?auto_12251 ?auto_12254 ) ) ( not ( = ?auto_12251 ?auto_12258 ) ) ( not ( = ?auto_12252 ?auto_12254 ) ) ( not ( = ?auto_12252 ?auto_12258 ) ) ( not ( = ?auto_12254 ?auto_12261 ) ) ( not ( = ?auto_12254 ?auto_12286 ) ) ( not ( = ?auto_12254 ?auto_12277 ) ) ( not ( = ?auto_12254 ?auto_12266 ) ) ( not ( = ?auto_12254 ?auto_12281 ) ) ( not ( = ?auto_12254 ?auto_12275 ) ) ( not ( = ?auto_12254 ?auto_12278 ) ) ( not ( = ?auto_12254 ?auto_12284 ) ) ( not ( = ?auto_12254 ?auto_12285 ) ) ( not ( = ?auto_12254 ?auto_12279 ) ) ( not ( = ?auto_12254 ?auto_12283 ) ) ( not ( = ?auto_12256 ?auto_12265 ) ) ( not ( = ?auto_12256 ?auto_12267 ) ) ( not ( = ?auto_12256 ?auto_12263 ) ) ( not ( = ?auto_12256 ?auto_12287 ) ) ( not ( = ?auto_12256 ?auto_12288 ) ) ( not ( = ?auto_12256 ?auto_12271 ) ) ( not ( = ?auto_12256 ?auto_12276 ) ) ( not ( = ?auto_12256 ?auto_12282 ) ) ( not ( = ?auto_12256 ?auto_12270 ) ) ( not ( = ?auto_12257 ?auto_12289 ) ) ( not ( = ?auto_12257 ?auto_12272 ) ) ( not ( = ?auto_12257 ?auto_12262 ) ) ( not ( = ?auto_12257 ?auto_12269 ) ) ( not ( = ?auto_12257 ?auto_12268 ) ) ( not ( = ?auto_12257 ?auto_12273 ) ) ( not ( = ?auto_12257 ?auto_12274 ) ) ( not ( = ?auto_12257 ?auto_12280 ) ) ( not ( = ?auto_12257 ?auto_12264 ) ) ( not ( = ?auto_12258 ?auto_12261 ) ) ( not ( = ?auto_12258 ?auto_12286 ) ) ( not ( = ?auto_12258 ?auto_12277 ) ) ( not ( = ?auto_12258 ?auto_12266 ) ) ( not ( = ?auto_12258 ?auto_12281 ) ) ( not ( = ?auto_12258 ?auto_12275 ) ) ( not ( = ?auto_12258 ?auto_12278 ) ) ( not ( = ?auto_12258 ?auto_12284 ) ) ( not ( = ?auto_12258 ?auto_12285 ) ) ( not ( = ?auto_12258 ?auto_12279 ) ) ( not ( = ?auto_12258 ?auto_12283 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_12242 ?auto_12243 ?auto_12244 ?auto_12245 ?auto_12246 ?auto_12247 ?auto_12248 ?auto_12249 ?auto_12250 ?auto_12251 ?auto_12252 ?auto_12253 )
      ( MAKE-1CRATE ?auto_12253 ?auto_12254 )
      ( MAKE-12CRATE-VERIFY ?auto_12242 ?auto_12243 ?auto_12244 ?auto_12245 ?auto_12246 ?auto_12247 ?auto_12248 ?auto_12249 ?auto_12250 ?auto_12251 ?auto_12252 ?auto_12253 ?auto_12254 ) )
  )

)

