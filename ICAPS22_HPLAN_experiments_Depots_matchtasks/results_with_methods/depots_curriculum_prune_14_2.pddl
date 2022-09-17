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
      ?auto_17764 - SURFACE
      ?auto_17765 - SURFACE
    )
    :vars
    (
      ?auto_17766 - HOIST
      ?auto_17767 - PLACE
      ?auto_17769 - PLACE
      ?auto_17770 - HOIST
      ?auto_17771 - SURFACE
      ?auto_17768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17766 ?auto_17767 ) ( SURFACE-AT ?auto_17764 ?auto_17767 ) ( CLEAR ?auto_17764 ) ( IS-CRATE ?auto_17765 ) ( AVAILABLE ?auto_17766 ) ( not ( = ?auto_17769 ?auto_17767 ) ) ( HOIST-AT ?auto_17770 ?auto_17769 ) ( AVAILABLE ?auto_17770 ) ( SURFACE-AT ?auto_17765 ?auto_17769 ) ( ON ?auto_17765 ?auto_17771 ) ( CLEAR ?auto_17765 ) ( TRUCK-AT ?auto_17768 ?auto_17767 ) ( not ( = ?auto_17764 ?auto_17765 ) ) ( not ( = ?auto_17764 ?auto_17771 ) ) ( not ( = ?auto_17765 ?auto_17771 ) ) ( not ( = ?auto_17766 ?auto_17770 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17768 ?auto_17767 ?auto_17769 )
      ( !LIFT ?auto_17770 ?auto_17765 ?auto_17771 ?auto_17769 )
      ( !LOAD ?auto_17770 ?auto_17765 ?auto_17768 ?auto_17769 )
      ( !DRIVE ?auto_17768 ?auto_17769 ?auto_17767 )
      ( !UNLOAD ?auto_17766 ?auto_17765 ?auto_17768 ?auto_17767 )
      ( !DROP ?auto_17766 ?auto_17765 ?auto_17764 ?auto_17767 )
      ( MAKE-1CRATE-VERIFY ?auto_17764 ?auto_17765 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17785 - SURFACE
      ?auto_17786 - SURFACE
      ?auto_17787 - SURFACE
    )
    :vars
    (
      ?auto_17790 - HOIST
      ?auto_17793 - PLACE
      ?auto_17791 - PLACE
      ?auto_17788 - HOIST
      ?auto_17792 - SURFACE
      ?auto_17796 - PLACE
      ?auto_17795 - HOIST
      ?auto_17794 - SURFACE
      ?auto_17789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17790 ?auto_17793 ) ( IS-CRATE ?auto_17787 ) ( not ( = ?auto_17791 ?auto_17793 ) ) ( HOIST-AT ?auto_17788 ?auto_17791 ) ( AVAILABLE ?auto_17788 ) ( SURFACE-AT ?auto_17787 ?auto_17791 ) ( ON ?auto_17787 ?auto_17792 ) ( CLEAR ?auto_17787 ) ( not ( = ?auto_17786 ?auto_17787 ) ) ( not ( = ?auto_17786 ?auto_17792 ) ) ( not ( = ?auto_17787 ?auto_17792 ) ) ( not ( = ?auto_17790 ?auto_17788 ) ) ( SURFACE-AT ?auto_17785 ?auto_17793 ) ( CLEAR ?auto_17785 ) ( IS-CRATE ?auto_17786 ) ( AVAILABLE ?auto_17790 ) ( not ( = ?auto_17796 ?auto_17793 ) ) ( HOIST-AT ?auto_17795 ?auto_17796 ) ( AVAILABLE ?auto_17795 ) ( SURFACE-AT ?auto_17786 ?auto_17796 ) ( ON ?auto_17786 ?auto_17794 ) ( CLEAR ?auto_17786 ) ( TRUCK-AT ?auto_17789 ?auto_17793 ) ( not ( = ?auto_17785 ?auto_17786 ) ) ( not ( = ?auto_17785 ?auto_17794 ) ) ( not ( = ?auto_17786 ?auto_17794 ) ) ( not ( = ?auto_17790 ?auto_17795 ) ) ( not ( = ?auto_17785 ?auto_17787 ) ) ( not ( = ?auto_17785 ?auto_17792 ) ) ( not ( = ?auto_17787 ?auto_17794 ) ) ( not ( = ?auto_17791 ?auto_17796 ) ) ( not ( = ?auto_17788 ?auto_17795 ) ) ( not ( = ?auto_17792 ?auto_17794 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17785 ?auto_17786 )
      ( MAKE-1CRATE ?auto_17786 ?auto_17787 )
      ( MAKE-2CRATE-VERIFY ?auto_17785 ?auto_17786 ?auto_17787 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17811 - SURFACE
      ?auto_17812 - SURFACE
      ?auto_17813 - SURFACE
      ?auto_17814 - SURFACE
    )
    :vars
    (
      ?auto_17819 - HOIST
      ?auto_17815 - PLACE
      ?auto_17820 - PLACE
      ?auto_17816 - HOIST
      ?auto_17818 - SURFACE
      ?auto_17825 - PLACE
      ?auto_17826 - HOIST
      ?auto_17821 - SURFACE
      ?auto_17823 - PLACE
      ?auto_17824 - HOIST
      ?auto_17822 - SURFACE
      ?auto_17817 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17819 ?auto_17815 ) ( IS-CRATE ?auto_17814 ) ( not ( = ?auto_17820 ?auto_17815 ) ) ( HOIST-AT ?auto_17816 ?auto_17820 ) ( AVAILABLE ?auto_17816 ) ( SURFACE-AT ?auto_17814 ?auto_17820 ) ( ON ?auto_17814 ?auto_17818 ) ( CLEAR ?auto_17814 ) ( not ( = ?auto_17813 ?auto_17814 ) ) ( not ( = ?auto_17813 ?auto_17818 ) ) ( not ( = ?auto_17814 ?auto_17818 ) ) ( not ( = ?auto_17819 ?auto_17816 ) ) ( IS-CRATE ?auto_17813 ) ( not ( = ?auto_17825 ?auto_17815 ) ) ( HOIST-AT ?auto_17826 ?auto_17825 ) ( AVAILABLE ?auto_17826 ) ( SURFACE-AT ?auto_17813 ?auto_17825 ) ( ON ?auto_17813 ?auto_17821 ) ( CLEAR ?auto_17813 ) ( not ( = ?auto_17812 ?auto_17813 ) ) ( not ( = ?auto_17812 ?auto_17821 ) ) ( not ( = ?auto_17813 ?auto_17821 ) ) ( not ( = ?auto_17819 ?auto_17826 ) ) ( SURFACE-AT ?auto_17811 ?auto_17815 ) ( CLEAR ?auto_17811 ) ( IS-CRATE ?auto_17812 ) ( AVAILABLE ?auto_17819 ) ( not ( = ?auto_17823 ?auto_17815 ) ) ( HOIST-AT ?auto_17824 ?auto_17823 ) ( AVAILABLE ?auto_17824 ) ( SURFACE-AT ?auto_17812 ?auto_17823 ) ( ON ?auto_17812 ?auto_17822 ) ( CLEAR ?auto_17812 ) ( TRUCK-AT ?auto_17817 ?auto_17815 ) ( not ( = ?auto_17811 ?auto_17812 ) ) ( not ( = ?auto_17811 ?auto_17822 ) ) ( not ( = ?auto_17812 ?auto_17822 ) ) ( not ( = ?auto_17819 ?auto_17824 ) ) ( not ( = ?auto_17811 ?auto_17813 ) ) ( not ( = ?auto_17811 ?auto_17821 ) ) ( not ( = ?auto_17813 ?auto_17822 ) ) ( not ( = ?auto_17825 ?auto_17823 ) ) ( not ( = ?auto_17826 ?auto_17824 ) ) ( not ( = ?auto_17821 ?auto_17822 ) ) ( not ( = ?auto_17811 ?auto_17814 ) ) ( not ( = ?auto_17811 ?auto_17818 ) ) ( not ( = ?auto_17812 ?auto_17814 ) ) ( not ( = ?auto_17812 ?auto_17818 ) ) ( not ( = ?auto_17814 ?auto_17821 ) ) ( not ( = ?auto_17814 ?auto_17822 ) ) ( not ( = ?auto_17820 ?auto_17825 ) ) ( not ( = ?auto_17820 ?auto_17823 ) ) ( not ( = ?auto_17816 ?auto_17826 ) ) ( not ( = ?auto_17816 ?auto_17824 ) ) ( not ( = ?auto_17818 ?auto_17821 ) ) ( not ( = ?auto_17818 ?auto_17822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17811 ?auto_17812 ?auto_17813 )
      ( MAKE-1CRATE ?auto_17813 ?auto_17814 )
      ( MAKE-3CRATE-VERIFY ?auto_17811 ?auto_17812 ?auto_17813 ?auto_17814 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17842 - SURFACE
      ?auto_17843 - SURFACE
      ?auto_17844 - SURFACE
      ?auto_17845 - SURFACE
      ?auto_17846 - SURFACE
    )
    :vars
    (
      ?auto_17850 - HOIST
      ?auto_17847 - PLACE
      ?auto_17851 - PLACE
      ?auto_17852 - HOIST
      ?auto_17848 - SURFACE
      ?auto_17861 - PLACE
      ?auto_17857 - HOIST
      ?auto_17859 - SURFACE
      ?auto_17854 - PLACE
      ?auto_17860 - HOIST
      ?auto_17856 - SURFACE
      ?auto_17853 - PLACE
      ?auto_17855 - HOIST
      ?auto_17858 - SURFACE
      ?auto_17849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17850 ?auto_17847 ) ( IS-CRATE ?auto_17846 ) ( not ( = ?auto_17851 ?auto_17847 ) ) ( HOIST-AT ?auto_17852 ?auto_17851 ) ( AVAILABLE ?auto_17852 ) ( SURFACE-AT ?auto_17846 ?auto_17851 ) ( ON ?auto_17846 ?auto_17848 ) ( CLEAR ?auto_17846 ) ( not ( = ?auto_17845 ?auto_17846 ) ) ( not ( = ?auto_17845 ?auto_17848 ) ) ( not ( = ?auto_17846 ?auto_17848 ) ) ( not ( = ?auto_17850 ?auto_17852 ) ) ( IS-CRATE ?auto_17845 ) ( not ( = ?auto_17861 ?auto_17847 ) ) ( HOIST-AT ?auto_17857 ?auto_17861 ) ( AVAILABLE ?auto_17857 ) ( SURFACE-AT ?auto_17845 ?auto_17861 ) ( ON ?auto_17845 ?auto_17859 ) ( CLEAR ?auto_17845 ) ( not ( = ?auto_17844 ?auto_17845 ) ) ( not ( = ?auto_17844 ?auto_17859 ) ) ( not ( = ?auto_17845 ?auto_17859 ) ) ( not ( = ?auto_17850 ?auto_17857 ) ) ( IS-CRATE ?auto_17844 ) ( not ( = ?auto_17854 ?auto_17847 ) ) ( HOIST-AT ?auto_17860 ?auto_17854 ) ( AVAILABLE ?auto_17860 ) ( SURFACE-AT ?auto_17844 ?auto_17854 ) ( ON ?auto_17844 ?auto_17856 ) ( CLEAR ?auto_17844 ) ( not ( = ?auto_17843 ?auto_17844 ) ) ( not ( = ?auto_17843 ?auto_17856 ) ) ( not ( = ?auto_17844 ?auto_17856 ) ) ( not ( = ?auto_17850 ?auto_17860 ) ) ( SURFACE-AT ?auto_17842 ?auto_17847 ) ( CLEAR ?auto_17842 ) ( IS-CRATE ?auto_17843 ) ( AVAILABLE ?auto_17850 ) ( not ( = ?auto_17853 ?auto_17847 ) ) ( HOIST-AT ?auto_17855 ?auto_17853 ) ( AVAILABLE ?auto_17855 ) ( SURFACE-AT ?auto_17843 ?auto_17853 ) ( ON ?auto_17843 ?auto_17858 ) ( CLEAR ?auto_17843 ) ( TRUCK-AT ?auto_17849 ?auto_17847 ) ( not ( = ?auto_17842 ?auto_17843 ) ) ( not ( = ?auto_17842 ?auto_17858 ) ) ( not ( = ?auto_17843 ?auto_17858 ) ) ( not ( = ?auto_17850 ?auto_17855 ) ) ( not ( = ?auto_17842 ?auto_17844 ) ) ( not ( = ?auto_17842 ?auto_17856 ) ) ( not ( = ?auto_17844 ?auto_17858 ) ) ( not ( = ?auto_17854 ?auto_17853 ) ) ( not ( = ?auto_17860 ?auto_17855 ) ) ( not ( = ?auto_17856 ?auto_17858 ) ) ( not ( = ?auto_17842 ?auto_17845 ) ) ( not ( = ?auto_17842 ?auto_17859 ) ) ( not ( = ?auto_17843 ?auto_17845 ) ) ( not ( = ?auto_17843 ?auto_17859 ) ) ( not ( = ?auto_17845 ?auto_17856 ) ) ( not ( = ?auto_17845 ?auto_17858 ) ) ( not ( = ?auto_17861 ?auto_17854 ) ) ( not ( = ?auto_17861 ?auto_17853 ) ) ( not ( = ?auto_17857 ?auto_17860 ) ) ( not ( = ?auto_17857 ?auto_17855 ) ) ( not ( = ?auto_17859 ?auto_17856 ) ) ( not ( = ?auto_17859 ?auto_17858 ) ) ( not ( = ?auto_17842 ?auto_17846 ) ) ( not ( = ?auto_17842 ?auto_17848 ) ) ( not ( = ?auto_17843 ?auto_17846 ) ) ( not ( = ?auto_17843 ?auto_17848 ) ) ( not ( = ?auto_17844 ?auto_17846 ) ) ( not ( = ?auto_17844 ?auto_17848 ) ) ( not ( = ?auto_17846 ?auto_17859 ) ) ( not ( = ?auto_17846 ?auto_17856 ) ) ( not ( = ?auto_17846 ?auto_17858 ) ) ( not ( = ?auto_17851 ?auto_17861 ) ) ( not ( = ?auto_17851 ?auto_17854 ) ) ( not ( = ?auto_17851 ?auto_17853 ) ) ( not ( = ?auto_17852 ?auto_17857 ) ) ( not ( = ?auto_17852 ?auto_17860 ) ) ( not ( = ?auto_17852 ?auto_17855 ) ) ( not ( = ?auto_17848 ?auto_17859 ) ) ( not ( = ?auto_17848 ?auto_17856 ) ) ( not ( = ?auto_17848 ?auto_17858 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_17842 ?auto_17843 ?auto_17844 ?auto_17845 )
      ( MAKE-1CRATE ?auto_17845 ?auto_17846 )
      ( MAKE-4CRATE-VERIFY ?auto_17842 ?auto_17843 ?auto_17844 ?auto_17845 ?auto_17846 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17878 - SURFACE
      ?auto_17879 - SURFACE
      ?auto_17880 - SURFACE
      ?auto_17881 - SURFACE
      ?auto_17882 - SURFACE
      ?auto_17883 - SURFACE
    )
    :vars
    (
      ?auto_17884 - HOIST
      ?auto_17886 - PLACE
      ?auto_17887 - PLACE
      ?auto_17889 - HOIST
      ?auto_17888 - SURFACE
      ?auto_17895 - PLACE
      ?auto_17892 - HOIST
      ?auto_17894 - SURFACE
      ?auto_17893 - PLACE
      ?auto_17899 - HOIST
      ?auto_17896 - SURFACE
      ?auto_17898 - PLACE
      ?auto_17897 - HOIST
      ?auto_17890 - SURFACE
      ?auto_17901 - PLACE
      ?auto_17891 - HOIST
      ?auto_17900 - SURFACE
      ?auto_17885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17884 ?auto_17886 ) ( IS-CRATE ?auto_17883 ) ( not ( = ?auto_17887 ?auto_17886 ) ) ( HOIST-AT ?auto_17889 ?auto_17887 ) ( AVAILABLE ?auto_17889 ) ( SURFACE-AT ?auto_17883 ?auto_17887 ) ( ON ?auto_17883 ?auto_17888 ) ( CLEAR ?auto_17883 ) ( not ( = ?auto_17882 ?auto_17883 ) ) ( not ( = ?auto_17882 ?auto_17888 ) ) ( not ( = ?auto_17883 ?auto_17888 ) ) ( not ( = ?auto_17884 ?auto_17889 ) ) ( IS-CRATE ?auto_17882 ) ( not ( = ?auto_17895 ?auto_17886 ) ) ( HOIST-AT ?auto_17892 ?auto_17895 ) ( AVAILABLE ?auto_17892 ) ( SURFACE-AT ?auto_17882 ?auto_17895 ) ( ON ?auto_17882 ?auto_17894 ) ( CLEAR ?auto_17882 ) ( not ( = ?auto_17881 ?auto_17882 ) ) ( not ( = ?auto_17881 ?auto_17894 ) ) ( not ( = ?auto_17882 ?auto_17894 ) ) ( not ( = ?auto_17884 ?auto_17892 ) ) ( IS-CRATE ?auto_17881 ) ( not ( = ?auto_17893 ?auto_17886 ) ) ( HOIST-AT ?auto_17899 ?auto_17893 ) ( AVAILABLE ?auto_17899 ) ( SURFACE-AT ?auto_17881 ?auto_17893 ) ( ON ?auto_17881 ?auto_17896 ) ( CLEAR ?auto_17881 ) ( not ( = ?auto_17880 ?auto_17881 ) ) ( not ( = ?auto_17880 ?auto_17896 ) ) ( not ( = ?auto_17881 ?auto_17896 ) ) ( not ( = ?auto_17884 ?auto_17899 ) ) ( IS-CRATE ?auto_17880 ) ( not ( = ?auto_17898 ?auto_17886 ) ) ( HOIST-AT ?auto_17897 ?auto_17898 ) ( AVAILABLE ?auto_17897 ) ( SURFACE-AT ?auto_17880 ?auto_17898 ) ( ON ?auto_17880 ?auto_17890 ) ( CLEAR ?auto_17880 ) ( not ( = ?auto_17879 ?auto_17880 ) ) ( not ( = ?auto_17879 ?auto_17890 ) ) ( not ( = ?auto_17880 ?auto_17890 ) ) ( not ( = ?auto_17884 ?auto_17897 ) ) ( SURFACE-AT ?auto_17878 ?auto_17886 ) ( CLEAR ?auto_17878 ) ( IS-CRATE ?auto_17879 ) ( AVAILABLE ?auto_17884 ) ( not ( = ?auto_17901 ?auto_17886 ) ) ( HOIST-AT ?auto_17891 ?auto_17901 ) ( AVAILABLE ?auto_17891 ) ( SURFACE-AT ?auto_17879 ?auto_17901 ) ( ON ?auto_17879 ?auto_17900 ) ( CLEAR ?auto_17879 ) ( TRUCK-AT ?auto_17885 ?auto_17886 ) ( not ( = ?auto_17878 ?auto_17879 ) ) ( not ( = ?auto_17878 ?auto_17900 ) ) ( not ( = ?auto_17879 ?auto_17900 ) ) ( not ( = ?auto_17884 ?auto_17891 ) ) ( not ( = ?auto_17878 ?auto_17880 ) ) ( not ( = ?auto_17878 ?auto_17890 ) ) ( not ( = ?auto_17880 ?auto_17900 ) ) ( not ( = ?auto_17898 ?auto_17901 ) ) ( not ( = ?auto_17897 ?auto_17891 ) ) ( not ( = ?auto_17890 ?auto_17900 ) ) ( not ( = ?auto_17878 ?auto_17881 ) ) ( not ( = ?auto_17878 ?auto_17896 ) ) ( not ( = ?auto_17879 ?auto_17881 ) ) ( not ( = ?auto_17879 ?auto_17896 ) ) ( not ( = ?auto_17881 ?auto_17890 ) ) ( not ( = ?auto_17881 ?auto_17900 ) ) ( not ( = ?auto_17893 ?auto_17898 ) ) ( not ( = ?auto_17893 ?auto_17901 ) ) ( not ( = ?auto_17899 ?auto_17897 ) ) ( not ( = ?auto_17899 ?auto_17891 ) ) ( not ( = ?auto_17896 ?auto_17890 ) ) ( not ( = ?auto_17896 ?auto_17900 ) ) ( not ( = ?auto_17878 ?auto_17882 ) ) ( not ( = ?auto_17878 ?auto_17894 ) ) ( not ( = ?auto_17879 ?auto_17882 ) ) ( not ( = ?auto_17879 ?auto_17894 ) ) ( not ( = ?auto_17880 ?auto_17882 ) ) ( not ( = ?auto_17880 ?auto_17894 ) ) ( not ( = ?auto_17882 ?auto_17896 ) ) ( not ( = ?auto_17882 ?auto_17890 ) ) ( not ( = ?auto_17882 ?auto_17900 ) ) ( not ( = ?auto_17895 ?auto_17893 ) ) ( not ( = ?auto_17895 ?auto_17898 ) ) ( not ( = ?auto_17895 ?auto_17901 ) ) ( not ( = ?auto_17892 ?auto_17899 ) ) ( not ( = ?auto_17892 ?auto_17897 ) ) ( not ( = ?auto_17892 ?auto_17891 ) ) ( not ( = ?auto_17894 ?auto_17896 ) ) ( not ( = ?auto_17894 ?auto_17890 ) ) ( not ( = ?auto_17894 ?auto_17900 ) ) ( not ( = ?auto_17878 ?auto_17883 ) ) ( not ( = ?auto_17878 ?auto_17888 ) ) ( not ( = ?auto_17879 ?auto_17883 ) ) ( not ( = ?auto_17879 ?auto_17888 ) ) ( not ( = ?auto_17880 ?auto_17883 ) ) ( not ( = ?auto_17880 ?auto_17888 ) ) ( not ( = ?auto_17881 ?auto_17883 ) ) ( not ( = ?auto_17881 ?auto_17888 ) ) ( not ( = ?auto_17883 ?auto_17894 ) ) ( not ( = ?auto_17883 ?auto_17896 ) ) ( not ( = ?auto_17883 ?auto_17890 ) ) ( not ( = ?auto_17883 ?auto_17900 ) ) ( not ( = ?auto_17887 ?auto_17895 ) ) ( not ( = ?auto_17887 ?auto_17893 ) ) ( not ( = ?auto_17887 ?auto_17898 ) ) ( not ( = ?auto_17887 ?auto_17901 ) ) ( not ( = ?auto_17889 ?auto_17892 ) ) ( not ( = ?auto_17889 ?auto_17899 ) ) ( not ( = ?auto_17889 ?auto_17897 ) ) ( not ( = ?auto_17889 ?auto_17891 ) ) ( not ( = ?auto_17888 ?auto_17894 ) ) ( not ( = ?auto_17888 ?auto_17896 ) ) ( not ( = ?auto_17888 ?auto_17890 ) ) ( not ( = ?auto_17888 ?auto_17900 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_17878 ?auto_17879 ?auto_17880 ?auto_17881 ?auto_17882 )
      ( MAKE-1CRATE ?auto_17882 ?auto_17883 )
      ( MAKE-5CRATE-VERIFY ?auto_17878 ?auto_17879 ?auto_17880 ?auto_17881 ?auto_17882 ?auto_17883 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_17919 - SURFACE
      ?auto_17920 - SURFACE
      ?auto_17921 - SURFACE
      ?auto_17922 - SURFACE
      ?auto_17923 - SURFACE
      ?auto_17924 - SURFACE
      ?auto_17925 - SURFACE
    )
    :vars
    (
      ?auto_17930 - HOIST
      ?auto_17929 - PLACE
      ?auto_17931 - PLACE
      ?auto_17927 - HOIST
      ?auto_17928 - SURFACE
      ?auto_17943 - PLACE
      ?auto_17932 - HOIST
      ?auto_17944 - SURFACE
      ?auto_17940 - PLACE
      ?auto_17936 - HOIST
      ?auto_17941 - SURFACE
      ?auto_17942 - SURFACE
      ?auto_17939 - PLACE
      ?auto_17933 - HOIST
      ?auto_17938 - SURFACE
      ?auto_17934 - PLACE
      ?auto_17937 - HOIST
      ?auto_17935 - SURFACE
      ?auto_17926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17930 ?auto_17929 ) ( IS-CRATE ?auto_17925 ) ( not ( = ?auto_17931 ?auto_17929 ) ) ( HOIST-AT ?auto_17927 ?auto_17931 ) ( SURFACE-AT ?auto_17925 ?auto_17931 ) ( ON ?auto_17925 ?auto_17928 ) ( CLEAR ?auto_17925 ) ( not ( = ?auto_17924 ?auto_17925 ) ) ( not ( = ?auto_17924 ?auto_17928 ) ) ( not ( = ?auto_17925 ?auto_17928 ) ) ( not ( = ?auto_17930 ?auto_17927 ) ) ( IS-CRATE ?auto_17924 ) ( not ( = ?auto_17943 ?auto_17929 ) ) ( HOIST-AT ?auto_17932 ?auto_17943 ) ( AVAILABLE ?auto_17932 ) ( SURFACE-AT ?auto_17924 ?auto_17943 ) ( ON ?auto_17924 ?auto_17944 ) ( CLEAR ?auto_17924 ) ( not ( = ?auto_17923 ?auto_17924 ) ) ( not ( = ?auto_17923 ?auto_17944 ) ) ( not ( = ?auto_17924 ?auto_17944 ) ) ( not ( = ?auto_17930 ?auto_17932 ) ) ( IS-CRATE ?auto_17923 ) ( not ( = ?auto_17940 ?auto_17929 ) ) ( HOIST-AT ?auto_17936 ?auto_17940 ) ( AVAILABLE ?auto_17936 ) ( SURFACE-AT ?auto_17923 ?auto_17940 ) ( ON ?auto_17923 ?auto_17941 ) ( CLEAR ?auto_17923 ) ( not ( = ?auto_17922 ?auto_17923 ) ) ( not ( = ?auto_17922 ?auto_17941 ) ) ( not ( = ?auto_17923 ?auto_17941 ) ) ( not ( = ?auto_17930 ?auto_17936 ) ) ( IS-CRATE ?auto_17922 ) ( AVAILABLE ?auto_17927 ) ( SURFACE-AT ?auto_17922 ?auto_17931 ) ( ON ?auto_17922 ?auto_17942 ) ( CLEAR ?auto_17922 ) ( not ( = ?auto_17921 ?auto_17922 ) ) ( not ( = ?auto_17921 ?auto_17942 ) ) ( not ( = ?auto_17922 ?auto_17942 ) ) ( IS-CRATE ?auto_17921 ) ( not ( = ?auto_17939 ?auto_17929 ) ) ( HOIST-AT ?auto_17933 ?auto_17939 ) ( AVAILABLE ?auto_17933 ) ( SURFACE-AT ?auto_17921 ?auto_17939 ) ( ON ?auto_17921 ?auto_17938 ) ( CLEAR ?auto_17921 ) ( not ( = ?auto_17920 ?auto_17921 ) ) ( not ( = ?auto_17920 ?auto_17938 ) ) ( not ( = ?auto_17921 ?auto_17938 ) ) ( not ( = ?auto_17930 ?auto_17933 ) ) ( SURFACE-AT ?auto_17919 ?auto_17929 ) ( CLEAR ?auto_17919 ) ( IS-CRATE ?auto_17920 ) ( AVAILABLE ?auto_17930 ) ( not ( = ?auto_17934 ?auto_17929 ) ) ( HOIST-AT ?auto_17937 ?auto_17934 ) ( AVAILABLE ?auto_17937 ) ( SURFACE-AT ?auto_17920 ?auto_17934 ) ( ON ?auto_17920 ?auto_17935 ) ( CLEAR ?auto_17920 ) ( TRUCK-AT ?auto_17926 ?auto_17929 ) ( not ( = ?auto_17919 ?auto_17920 ) ) ( not ( = ?auto_17919 ?auto_17935 ) ) ( not ( = ?auto_17920 ?auto_17935 ) ) ( not ( = ?auto_17930 ?auto_17937 ) ) ( not ( = ?auto_17919 ?auto_17921 ) ) ( not ( = ?auto_17919 ?auto_17938 ) ) ( not ( = ?auto_17921 ?auto_17935 ) ) ( not ( = ?auto_17939 ?auto_17934 ) ) ( not ( = ?auto_17933 ?auto_17937 ) ) ( not ( = ?auto_17938 ?auto_17935 ) ) ( not ( = ?auto_17919 ?auto_17922 ) ) ( not ( = ?auto_17919 ?auto_17942 ) ) ( not ( = ?auto_17920 ?auto_17922 ) ) ( not ( = ?auto_17920 ?auto_17942 ) ) ( not ( = ?auto_17922 ?auto_17938 ) ) ( not ( = ?auto_17922 ?auto_17935 ) ) ( not ( = ?auto_17931 ?auto_17939 ) ) ( not ( = ?auto_17931 ?auto_17934 ) ) ( not ( = ?auto_17927 ?auto_17933 ) ) ( not ( = ?auto_17927 ?auto_17937 ) ) ( not ( = ?auto_17942 ?auto_17938 ) ) ( not ( = ?auto_17942 ?auto_17935 ) ) ( not ( = ?auto_17919 ?auto_17923 ) ) ( not ( = ?auto_17919 ?auto_17941 ) ) ( not ( = ?auto_17920 ?auto_17923 ) ) ( not ( = ?auto_17920 ?auto_17941 ) ) ( not ( = ?auto_17921 ?auto_17923 ) ) ( not ( = ?auto_17921 ?auto_17941 ) ) ( not ( = ?auto_17923 ?auto_17942 ) ) ( not ( = ?auto_17923 ?auto_17938 ) ) ( not ( = ?auto_17923 ?auto_17935 ) ) ( not ( = ?auto_17940 ?auto_17931 ) ) ( not ( = ?auto_17940 ?auto_17939 ) ) ( not ( = ?auto_17940 ?auto_17934 ) ) ( not ( = ?auto_17936 ?auto_17927 ) ) ( not ( = ?auto_17936 ?auto_17933 ) ) ( not ( = ?auto_17936 ?auto_17937 ) ) ( not ( = ?auto_17941 ?auto_17942 ) ) ( not ( = ?auto_17941 ?auto_17938 ) ) ( not ( = ?auto_17941 ?auto_17935 ) ) ( not ( = ?auto_17919 ?auto_17924 ) ) ( not ( = ?auto_17919 ?auto_17944 ) ) ( not ( = ?auto_17920 ?auto_17924 ) ) ( not ( = ?auto_17920 ?auto_17944 ) ) ( not ( = ?auto_17921 ?auto_17924 ) ) ( not ( = ?auto_17921 ?auto_17944 ) ) ( not ( = ?auto_17922 ?auto_17924 ) ) ( not ( = ?auto_17922 ?auto_17944 ) ) ( not ( = ?auto_17924 ?auto_17941 ) ) ( not ( = ?auto_17924 ?auto_17942 ) ) ( not ( = ?auto_17924 ?auto_17938 ) ) ( not ( = ?auto_17924 ?auto_17935 ) ) ( not ( = ?auto_17943 ?auto_17940 ) ) ( not ( = ?auto_17943 ?auto_17931 ) ) ( not ( = ?auto_17943 ?auto_17939 ) ) ( not ( = ?auto_17943 ?auto_17934 ) ) ( not ( = ?auto_17932 ?auto_17936 ) ) ( not ( = ?auto_17932 ?auto_17927 ) ) ( not ( = ?auto_17932 ?auto_17933 ) ) ( not ( = ?auto_17932 ?auto_17937 ) ) ( not ( = ?auto_17944 ?auto_17941 ) ) ( not ( = ?auto_17944 ?auto_17942 ) ) ( not ( = ?auto_17944 ?auto_17938 ) ) ( not ( = ?auto_17944 ?auto_17935 ) ) ( not ( = ?auto_17919 ?auto_17925 ) ) ( not ( = ?auto_17919 ?auto_17928 ) ) ( not ( = ?auto_17920 ?auto_17925 ) ) ( not ( = ?auto_17920 ?auto_17928 ) ) ( not ( = ?auto_17921 ?auto_17925 ) ) ( not ( = ?auto_17921 ?auto_17928 ) ) ( not ( = ?auto_17922 ?auto_17925 ) ) ( not ( = ?auto_17922 ?auto_17928 ) ) ( not ( = ?auto_17923 ?auto_17925 ) ) ( not ( = ?auto_17923 ?auto_17928 ) ) ( not ( = ?auto_17925 ?auto_17944 ) ) ( not ( = ?auto_17925 ?auto_17941 ) ) ( not ( = ?auto_17925 ?auto_17942 ) ) ( not ( = ?auto_17925 ?auto_17938 ) ) ( not ( = ?auto_17925 ?auto_17935 ) ) ( not ( = ?auto_17928 ?auto_17944 ) ) ( not ( = ?auto_17928 ?auto_17941 ) ) ( not ( = ?auto_17928 ?auto_17942 ) ) ( not ( = ?auto_17928 ?auto_17938 ) ) ( not ( = ?auto_17928 ?auto_17935 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_17919 ?auto_17920 ?auto_17921 ?auto_17922 ?auto_17923 ?auto_17924 )
      ( MAKE-1CRATE ?auto_17924 ?auto_17925 )
      ( MAKE-6CRATE-VERIFY ?auto_17919 ?auto_17920 ?auto_17921 ?auto_17922 ?auto_17923 ?auto_17924 ?auto_17925 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_17963 - SURFACE
      ?auto_17964 - SURFACE
      ?auto_17965 - SURFACE
      ?auto_17966 - SURFACE
      ?auto_17967 - SURFACE
      ?auto_17968 - SURFACE
      ?auto_17969 - SURFACE
      ?auto_17970 - SURFACE
    )
    :vars
    (
      ?auto_17973 - HOIST
      ?auto_17972 - PLACE
      ?auto_17971 - PLACE
      ?auto_17975 - HOIST
      ?auto_17976 - SURFACE
      ?auto_17979 - PLACE
      ?auto_17982 - HOIST
      ?auto_17980 - SURFACE
      ?auto_17984 - PLACE
      ?auto_17985 - HOIST
      ?auto_17987 - SURFACE
      ?auto_17983 - PLACE
      ?auto_17990 - HOIST
      ?auto_17992 - SURFACE
      ?auto_17978 - SURFACE
      ?auto_17989 - PLACE
      ?auto_17991 - HOIST
      ?auto_17981 - SURFACE
      ?auto_17977 - PLACE
      ?auto_17988 - HOIST
      ?auto_17986 - SURFACE
      ?auto_17974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17973 ?auto_17972 ) ( IS-CRATE ?auto_17970 ) ( not ( = ?auto_17971 ?auto_17972 ) ) ( HOIST-AT ?auto_17975 ?auto_17971 ) ( AVAILABLE ?auto_17975 ) ( SURFACE-AT ?auto_17970 ?auto_17971 ) ( ON ?auto_17970 ?auto_17976 ) ( CLEAR ?auto_17970 ) ( not ( = ?auto_17969 ?auto_17970 ) ) ( not ( = ?auto_17969 ?auto_17976 ) ) ( not ( = ?auto_17970 ?auto_17976 ) ) ( not ( = ?auto_17973 ?auto_17975 ) ) ( IS-CRATE ?auto_17969 ) ( not ( = ?auto_17979 ?auto_17972 ) ) ( HOIST-AT ?auto_17982 ?auto_17979 ) ( SURFACE-AT ?auto_17969 ?auto_17979 ) ( ON ?auto_17969 ?auto_17980 ) ( CLEAR ?auto_17969 ) ( not ( = ?auto_17968 ?auto_17969 ) ) ( not ( = ?auto_17968 ?auto_17980 ) ) ( not ( = ?auto_17969 ?auto_17980 ) ) ( not ( = ?auto_17973 ?auto_17982 ) ) ( IS-CRATE ?auto_17968 ) ( not ( = ?auto_17984 ?auto_17972 ) ) ( HOIST-AT ?auto_17985 ?auto_17984 ) ( AVAILABLE ?auto_17985 ) ( SURFACE-AT ?auto_17968 ?auto_17984 ) ( ON ?auto_17968 ?auto_17987 ) ( CLEAR ?auto_17968 ) ( not ( = ?auto_17967 ?auto_17968 ) ) ( not ( = ?auto_17967 ?auto_17987 ) ) ( not ( = ?auto_17968 ?auto_17987 ) ) ( not ( = ?auto_17973 ?auto_17985 ) ) ( IS-CRATE ?auto_17967 ) ( not ( = ?auto_17983 ?auto_17972 ) ) ( HOIST-AT ?auto_17990 ?auto_17983 ) ( AVAILABLE ?auto_17990 ) ( SURFACE-AT ?auto_17967 ?auto_17983 ) ( ON ?auto_17967 ?auto_17992 ) ( CLEAR ?auto_17967 ) ( not ( = ?auto_17966 ?auto_17967 ) ) ( not ( = ?auto_17966 ?auto_17992 ) ) ( not ( = ?auto_17967 ?auto_17992 ) ) ( not ( = ?auto_17973 ?auto_17990 ) ) ( IS-CRATE ?auto_17966 ) ( AVAILABLE ?auto_17982 ) ( SURFACE-AT ?auto_17966 ?auto_17979 ) ( ON ?auto_17966 ?auto_17978 ) ( CLEAR ?auto_17966 ) ( not ( = ?auto_17965 ?auto_17966 ) ) ( not ( = ?auto_17965 ?auto_17978 ) ) ( not ( = ?auto_17966 ?auto_17978 ) ) ( IS-CRATE ?auto_17965 ) ( not ( = ?auto_17989 ?auto_17972 ) ) ( HOIST-AT ?auto_17991 ?auto_17989 ) ( AVAILABLE ?auto_17991 ) ( SURFACE-AT ?auto_17965 ?auto_17989 ) ( ON ?auto_17965 ?auto_17981 ) ( CLEAR ?auto_17965 ) ( not ( = ?auto_17964 ?auto_17965 ) ) ( not ( = ?auto_17964 ?auto_17981 ) ) ( not ( = ?auto_17965 ?auto_17981 ) ) ( not ( = ?auto_17973 ?auto_17991 ) ) ( SURFACE-AT ?auto_17963 ?auto_17972 ) ( CLEAR ?auto_17963 ) ( IS-CRATE ?auto_17964 ) ( AVAILABLE ?auto_17973 ) ( not ( = ?auto_17977 ?auto_17972 ) ) ( HOIST-AT ?auto_17988 ?auto_17977 ) ( AVAILABLE ?auto_17988 ) ( SURFACE-AT ?auto_17964 ?auto_17977 ) ( ON ?auto_17964 ?auto_17986 ) ( CLEAR ?auto_17964 ) ( TRUCK-AT ?auto_17974 ?auto_17972 ) ( not ( = ?auto_17963 ?auto_17964 ) ) ( not ( = ?auto_17963 ?auto_17986 ) ) ( not ( = ?auto_17964 ?auto_17986 ) ) ( not ( = ?auto_17973 ?auto_17988 ) ) ( not ( = ?auto_17963 ?auto_17965 ) ) ( not ( = ?auto_17963 ?auto_17981 ) ) ( not ( = ?auto_17965 ?auto_17986 ) ) ( not ( = ?auto_17989 ?auto_17977 ) ) ( not ( = ?auto_17991 ?auto_17988 ) ) ( not ( = ?auto_17981 ?auto_17986 ) ) ( not ( = ?auto_17963 ?auto_17966 ) ) ( not ( = ?auto_17963 ?auto_17978 ) ) ( not ( = ?auto_17964 ?auto_17966 ) ) ( not ( = ?auto_17964 ?auto_17978 ) ) ( not ( = ?auto_17966 ?auto_17981 ) ) ( not ( = ?auto_17966 ?auto_17986 ) ) ( not ( = ?auto_17979 ?auto_17989 ) ) ( not ( = ?auto_17979 ?auto_17977 ) ) ( not ( = ?auto_17982 ?auto_17991 ) ) ( not ( = ?auto_17982 ?auto_17988 ) ) ( not ( = ?auto_17978 ?auto_17981 ) ) ( not ( = ?auto_17978 ?auto_17986 ) ) ( not ( = ?auto_17963 ?auto_17967 ) ) ( not ( = ?auto_17963 ?auto_17992 ) ) ( not ( = ?auto_17964 ?auto_17967 ) ) ( not ( = ?auto_17964 ?auto_17992 ) ) ( not ( = ?auto_17965 ?auto_17967 ) ) ( not ( = ?auto_17965 ?auto_17992 ) ) ( not ( = ?auto_17967 ?auto_17978 ) ) ( not ( = ?auto_17967 ?auto_17981 ) ) ( not ( = ?auto_17967 ?auto_17986 ) ) ( not ( = ?auto_17983 ?auto_17979 ) ) ( not ( = ?auto_17983 ?auto_17989 ) ) ( not ( = ?auto_17983 ?auto_17977 ) ) ( not ( = ?auto_17990 ?auto_17982 ) ) ( not ( = ?auto_17990 ?auto_17991 ) ) ( not ( = ?auto_17990 ?auto_17988 ) ) ( not ( = ?auto_17992 ?auto_17978 ) ) ( not ( = ?auto_17992 ?auto_17981 ) ) ( not ( = ?auto_17992 ?auto_17986 ) ) ( not ( = ?auto_17963 ?auto_17968 ) ) ( not ( = ?auto_17963 ?auto_17987 ) ) ( not ( = ?auto_17964 ?auto_17968 ) ) ( not ( = ?auto_17964 ?auto_17987 ) ) ( not ( = ?auto_17965 ?auto_17968 ) ) ( not ( = ?auto_17965 ?auto_17987 ) ) ( not ( = ?auto_17966 ?auto_17968 ) ) ( not ( = ?auto_17966 ?auto_17987 ) ) ( not ( = ?auto_17968 ?auto_17992 ) ) ( not ( = ?auto_17968 ?auto_17978 ) ) ( not ( = ?auto_17968 ?auto_17981 ) ) ( not ( = ?auto_17968 ?auto_17986 ) ) ( not ( = ?auto_17984 ?auto_17983 ) ) ( not ( = ?auto_17984 ?auto_17979 ) ) ( not ( = ?auto_17984 ?auto_17989 ) ) ( not ( = ?auto_17984 ?auto_17977 ) ) ( not ( = ?auto_17985 ?auto_17990 ) ) ( not ( = ?auto_17985 ?auto_17982 ) ) ( not ( = ?auto_17985 ?auto_17991 ) ) ( not ( = ?auto_17985 ?auto_17988 ) ) ( not ( = ?auto_17987 ?auto_17992 ) ) ( not ( = ?auto_17987 ?auto_17978 ) ) ( not ( = ?auto_17987 ?auto_17981 ) ) ( not ( = ?auto_17987 ?auto_17986 ) ) ( not ( = ?auto_17963 ?auto_17969 ) ) ( not ( = ?auto_17963 ?auto_17980 ) ) ( not ( = ?auto_17964 ?auto_17969 ) ) ( not ( = ?auto_17964 ?auto_17980 ) ) ( not ( = ?auto_17965 ?auto_17969 ) ) ( not ( = ?auto_17965 ?auto_17980 ) ) ( not ( = ?auto_17966 ?auto_17969 ) ) ( not ( = ?auto_17966 ?auto_17980 ) ) ( not ( = ?auto_17967 ?auto_17969 ) ) ( not ( = ?auto_17967 ?auto_17980 ) ) ( not ( = ?auto_17969 ?auto_17987 ) ) ( not ( = ?auto_17969 ?auto_17992 ) ) ( not ( = ?auto_17969 ?auto_17978 ) ) ( not ( = ?auto_17969 ?auto_17981 ) ) ( not ( = ?auto_17969 ?auto_17986 ) ) ( not ( = ?auto_17980 ?auto_17987 ) ) ( not ( = ?auto_17980 ?auto_17992 ) ) ( not ( = ?auto_17980 ?auto_17978 ) ) ( not ( = ?auto_17980 ?auto_17981 ) ) ( not ( = ?auto_17980 ?auto_17986 ) ) ( not ( = ?auto_17963 ?auto_17970 ) ) ( not ( = ?auto_17963 ?auto_17976 ) ) ( not ( = ?auto_17964 ?auto_17970 ) ) ( not ( = ?auto_17964 ?auto_17976 ) ) ( not ( = ?auto_17965 ?auto_17970 ) ) ( not ( = ?auto_17965 ?auto_17976 ) ) ( not ( = ?auto_17966 ?auto_17970 ) ) ( not ( = ?auto_17966 ?auto_17976 ) ) ( not ( = ?auto_17967 ?auto_17970 ) ) ( not ( = ?auto_17967 ?auto_17976 ) ) ( not ( = ?auto_17968 ?auto_17970 ) ) ( not ( = ?auto_17968 ?auto_17976 ) ) ( not ( = ?auto_17970 ?auto_17980 ) ) ( not ( = ?auto_17970 ?auto_17987 ) ) ( not ( = ?auto_17970 ?auto_17992 ) ) ( not ( = ?auto_17970 ?auto_17978 ) ) ( not ( = ?auto_17970 ?auto_17981 ) ) ( not ( = ?auto_17970 ?auto_17986 ) ) ( not ( = ?auto_17971 ?auto_17979 ) ) ( not ( = ?auto_17971 ?auto_17984 ) ) ( not ( = ?auto_17971 ?auto_17983 ) ) ( not ( = ?auto_17971 ?auto_17989 ) ) ( not ( = ?auto_17971 ?auto_17977 ) ) ( not ( = ?auto_17975 ?auto_17982 ) ) ( not ( = ?auto_17975 ?auto_17985 ) ) ( not ( = ?auto_17975 ?auto_17990 ) ) ( not ( = ?auto_17975 ?auto_17991 ) ) ( not ( = ?auto_17975 ?auto_17988 ) ) ( not ( = ?auto_17976 ?auto_17980 ) ) ( not ( = ?auto_17976 ?auto_17987 ) ) ( not ( = ?auto_17976 ?auto_17992 ) ) ( not ( = ?auto_17976 ?auto_17978 ) ) ( not ( = ?auto_17976 ?auto_17981 ) ) ( not ( = ?auto_17976 ?auto_17986 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_17963 ?auto_17964 ?auto_17965 ?auto_17966 ?auto_17967 ?auto_17968 ?auto_17969 )
      ( MAKE-1CRATE ?auto_17969 ?auto_17970 )
      ( MAKE-7CRATE-VERIFY ?auto_17963 ?auto_17964 ?auto_17965 ?auto_17966 ?auto_17967 ?auto_17968 ?auto_17969 ?auto_17970 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_18012 - SURFACE
      ?auto_18013 - SURFACE
      ?auto_18014 - SURFACE
      ?auto_18015 - SURFACE
      ?auto_18016 - SURFACE
      ?auto_18017 - SURFACE
      ?auto_18018 - SURFACE
      ?auto_18019 - SURFACE
      ?auto_18020 - SURFACE
    )
    :vars
    (
      ?auto_18026 - HOIST
      ?auto_18025 - PLACE
      ?auto_18024 - PLACE
      ?auto_18022 - HOIST
      ?auto_18021 - SURFACE
      ?auto_18041 - PLACE
      ?auto_18028 - HOIST
      ?auto_18044 - SURFACE
      ?auto_18038 - PLACE
      ?auto_18043 - HOIST
      ?auto_18039 - SURFACE
      ?auto_18027 - PLACE
      ?auto_18030 - HOIST
      ?auto_18040 - SURFACE
      ?auto_18035 - PLACE
      ?auto_18034 - HOIST
      ?auto_18032 - SURFACE
      ?auto_18045 - SURFACE
      ?auto_18033 - PLACE
      ?auto_18031 - HOIST
      ?auto_18037 - SURFACE
      ?auto_18042 - PLACE
      ?auto_18036 - HOIST
      ?auto_18029 - SURFACE
      ?auto_18023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18026 ?auto_18025 ) ( IS-CRATE ?auto_18020 ) ( not ( = ?auto_18024 ?auto_18025 ) ) ( HOIST-AT ?auto_18022 ?auto_18024 ) ( AVAILABLE ?auto_18022 ) ( SURFACE-AT ?auto_18020 ?auto_18024 ) ( ON ?auto_18020 ?auto_18021 ) ( CLEAR ?auto_18020 ) ( not ( = ?auto_18019 ?auto_18020 ) ) ( not ( = ?auto_18019 ?auto_18021 ) ) ( not ( = ?auto_18020 ?auto_18021 ) ) ( not ( = ?auto_18026 ?auto_18022 ) ) ( IS-CRATE ?auto_18019 ) ( not ( = ?auto_18041 ?auto_18025 ) ) ( HOIST-AT ?auto_18028 ?auto_18041 ) ( AVAILABLE ?auto_18028 ) ( SURFACE-AT ?auto_18019 ?auto_18041 ) ( ON ?auto_18019 ?auto_18044 ) ( CLEAR ?auto_18019 ) ( not ( = ?auto_18018 ?auto_18019 ) ) ( not ( = ?auto_18018 ?auto_18044 ) ) ( not ( = ?auto_18019 ?auto_18044 ) ) ( not ( = ?auto_18026 ?auto_18028 ) ) ( IS-CRATE ?auto_18018 ) ( not ( = ?auto_18038 ?auto_18025 ) ) ( HOIST-AT ?auto_18043 ?auto_18038 ) ( SURFACE-AT ?auto_18018 ?auto_18038 ) ( ON ?auto_18018 ?auto_18039 ) ( CLEAR ?auto_18018 ) ( not ( = ?auto_18017 ?auto_18018 ) ) ( not ( = ?auto_18017 ?auto_18039 ) ) ( not ( = ?auto_18018 ?auto_18039 ) ) ( not ( = ?auto_18026 ?auto_18043 ) ) ( IS-CRATE ?auto_18017 ) ( not ( = ?auto_18027 ?auto_18025 ) ) ( HOIST-AT ?auto_18030 ?auto_18027 ) ( AVAILABLE ?auto_18030 ) ( SURFACE-AT ?auto_18017 ?auto_18027 ) ( ON ?auto_18017 ?auto_18040 ) ( CLEAR ?auto_18017 ) ( not ( = ?auto_18016 ?auto_18017 ) ) ( not ( = ?auto_18016 ?auto_18040 ) ) ( not ( = ?auto_18017 ?auto_18040 ) ) ( not ( = ?auto_18026 ?auto_18030 ) ) ( IS-CRATE ?auto_18016 ) ( not ( = ?auto_18035 ?auto_18025 ) ) ( HOIST-AT ?auto_18034 ?auto_18035 ) ( AVAILABLE ?auto_18034 ) ( SURFACE-AT ?auto_18016 ?auto_18035 ) ( ON ?auto_18016 ?auto_18032 ) ( CLEAR ?auto_18016 ) ( not ( = ?auto_18015 ?auto_18016 ) ) ( not ( = ?auto_18015 ?auto_18032 ) ) ( not ( = ?auto_18016 ?auto_18032 ) ) ( not ( = ?auto_18026 ?auto_18034 ) ) ( IS-CRATE ?auto_18015 ) ( AVAILABLE ?auto_18043 ) ( SURFACE-AT ?auto_18015 ?auto_18038 ) ( ON ?auto_18015 ?auto_18045 ) ( CLEAR ?auto_18015 ) ( not ( = ?auto_18014 ?auto_18015 ) ) ( not ( = ?auto_18014 ?auto_18045 ) ) ( not ( = ?auto_18015 ?auto_18045 ) ) ( IS-CRATE ?auto_18014 ) ( not ( = ?auto_18033 ?auto_18025 ) ) ( HOIST-AT ?auto_18031 ?auto_18033 ) ( AVAILABLE ?auto_18031 ) ( SURFACE-AT ?auto_18014 ?auto_18033 ) ( ON ?auto_18014 ?auto_18037 ) ( CLEAR ?auto_18014 ) ( not ( = ?auto_18013 ?auto_18014 ) ) ( not ( = ?auto_18013 ?auto_18037 ) ) ( not ( = ?auto_18014 ?auto_18037 ) ) ( not ( = ?auto_18026 ?auto_18031 ) ) ( SURFACE-AT ?auto_18012 ?auto_18025 ) ( CLEAR ?auto_18012 ) ( IS-CRATE ?auto_18013 ) ( AVAILABLE ?auto_18026 ) ( not ( = ?auto_18042 ?auto_18025 ) ) ( HOIST-AT ?auto_18036 ?auto_18042 ) ( AVAILABLE ?auto_18036 ) ( SURFACE-AT ?auto_18013 ?auto_18042 ) ( ON ?auto_18013 ?auto_18029 ) ( CLEAR ?auto_18013 ) ( TRUCK-AT ?auto_18023 ?auto_18025 ) ( not ( = ?auto_18012 ?auto_18013 ) ) ( not ( = ?auto_18012 ?auto_18029 ) ) ( not ( = ?auto_18013 ?auto_18029 ) ) ( not ( = ?auto_18026 ?auto_18036 ) ) ( not ( = ?auto_18012 ?auto_18014 ) ) ( not ( = ?auto_18012 ?auto_18037 ) ) ( not ( = ?auto_18014 ?auto_18029 ) ) ( not ( = ?auto_18033 ?auto_18042 ) ) ( not ( = ?auto_18031 ?auto_18036 ) ) ( not ( = ?auto_18037 ?auto_18029 ) ) ( not ( = ?auto_18012 ?auto_18015 ) ) ( not ( = ?auto_18012 ?auto_18045 ) ) ( not ( = ?auto_18013 ?auto_18015 ) ) ( not ( = ?auto_18013 ?auto_18045 ) ) ( not ( = ?auto_18015 ?auto_18037 ) ) ( not ( = ?auto_18015 ?auto_18029 ) ) ( not ( = ?auto_18038 ?auto_18033 ) ) ( not ( = ?auto_18038 ?auto_18042 ) ) ( not ( = ?auto_18043 ?auto_18031 ) ) ( not ( = ?auto_18043 ?auto_18036 ) ) ( not ( = ?auto_18045 ?auto_18037 ) ) ( not ( = ?auto_18045 ?auto_18029 ) ) ( not ( = ?auto_18012 ?auto_18016 ) ) ( not ( = ?auto_18012 ?auto_18032 ) ) ( not ( = ?auto_18013 ?auto_18016 ) ) ( not ( = ?auto_18013 ?auto_18032 ) ) ( not ( = ?auto_18014 ?auto_18016 ) ) ( not ( = ?auto_18014 ?auto_18032 ) ) ( not ( = ?auto_18016 ?auto_18045 ) ) ( not ( = ?auto_18016 ?auto_18037 ) ) ( not ( = ?auto_18016 ?auto_18029 ) ) ( not ( = ?auto_18035 ?auto_18038 ) ) ( not ( = ?auto_18035 ?auto_18033 ) ) ( not ( = ?auto_18035 ?auto_18042 ) ) ( not ( = ?auto_18034 ?auto_18043 ) ) ( not ( = ?auto_18034 ?auto_18031 ) ) ( not ( = ?auto_18034 ?auto_18036 ) ) ( not ( = ?auto_18032 ?auto_18045 ) ) ( not ( = ?auto_18032 ?auto_18037 ) ) ( not ( = ?auto_18032 ?auto_18029 ) ) ( not ( = ?auto_18012 ?auto_18017 ) ) ( not ( = ?auto_18012 ?auto_18040 ) ) ( not ( = ?auto_18013 ?auto_18017 ) ) ( not ( = ?auto_18013 ?auto_18040 ) ) ( not ( = ?auto_18014 ?auto_18017 ) ) ( not ( = ?auto_18014 ?auto_18040 ) ) ( not ( = ?auto_18015 ?auto_18017 ) ) ( not ( = ?auto_18015 ?auto_18040 ) ) ( not ( = ?auto_18017 ?auto_18032 ) ) ( not ( = ?auto_18017 ?auto_18045 ) ) ( not ( = ?auto_18017 ?auto_18037 ) ) ( not ( = ?auto_18017 ?auto_18029 ) ) ( not ( = ?auto_18027 ?auto_18035 ) ) ( not ( = ?auto_18027 ?auto_18038 ) ) ( not ( = ?auto_18027 ?auto_18033 ) ) ( not ( = ?auto_18027 ?auto_18042 ) ) ( not ( = ?auto_18030 ?auto_18034 ) ) ( not ( = ?auto_18030 ?auto_18043 ) ) ( not ( = ?auto_18030 ?auto_18031 ) ) ( not ( = ?auto_18030 ?auto_18036 ) ) ( not ( = ?auto_18040 ?auto_18032 ) ) ( not ( = ?auto_18040 ?auto_18045 ) ) ( not ( = ?auto_18040 ?auto_18037 ) ) ( not ( = ?auto_18040 ?auto_18029 ) ) ( not ( = ?auto_18012 ?auto_18018 ) ) ( not ( = ?auto_18012 ?auto_18039 ) ) ( not ( = ?auto_18013 ?auto_18018 ) ) ( not ( = ?auto_18013 ?auto_18039 ) ) ( not ( = ?auto_18014 ?auto_18018 ) ) ( not ( = ?auto_18014 ?auto_18039 ) ) ( not ( = ?auto_18015 ?auto_18018 ) ) ( not ( = ?auto_18015 ?auto_18039 ) ) ( not ( = ?auto_18016 ?auto_18018 ) ) ( not ( = ?auto_18016 ?auto_18039 ) ) ( not ( = ?auto_18018 ?auto_18040 ) ) ( not ( = ?auto_18018 ?auto_18032 ) ) ( not ( = ?auto_18018 ?auto_18045 ) ) ( not ( = ?auto_18018 ?auto_18037 ) ) ( not ( = ?auto_18018 ?auto_18029 ) ) ( not ( = ?auto_18039 ?auto_18040 ) ) ( not ( = ?auto_18039 ?auto_18032 ) ) ( not ( = ?auto_18039 ?auto_18045 ) ) ( not ( = ?auto_18039 ?auto_18037 ) ) ( not ( = ?auto_18039 ?auto_18029 ) ) ( not ( = ?auto_18012 ?auto_18019 ) ) ( not ( = ?auto_18012 ?auto_18044 ) ) ( not ( = ?auto_18013 ?auto_18019 ) ) ( not ( = ?auto_18013 ?auto_18044 ) ) ( not ( = ?auto_18014 ?auto_18019 ) ) ( not ( = ?auto_18014 ?auto_18044 ) ) ( not ( = ?auto_18015 ?auto_18019 ) ) ( not ( = ?auto_18015 ?auto_18044 ) ) ( not ( = ?auto_18016 ?auto_18019 ) ) ( not ( = ?auto_18016 ?auto_18044 ) ) ( not ( = ?auto_18017 ?auto_18019 ) ) ( not ( = ?auto_18017 ?auto_18044 ) ) ( not ( = ?auto_18019 ?auto_18039 ) ) ( not ( = ?auto_18019 ?auto_18040 ) ) ( not ( = ?auto_18019 ?auto_18032 ) ) ( not ( = ?auto_18019 ?auto_18045 ) ) ( not ( = ?auto_18019 ?auto_18037 ) ) ( not ( = ?auto_18019 ?auto_18029 ) ) ( not ( = ?auto_18041 ?auto_18038 ) ) ( not ( = ?auto_18041 ?auto_18027 ) ) ( not ( = ?auto_18041 ?auto_18035 ) ) ( not ( = ?auto_18041 ?auto_18033 ) ) ( not ( = ?auto_18041 ?auto_18042 ) ) ( not ( = ?auto_18028 ?auto_18043 ) ) ( not ( = ?auto_18028 ?auto_18030 ) ) ( not ( = ?auto_18028 ?auto_18034 ) ) ( not ( = ?auto_18028 ?auto_18031 ) ) ( not ( = ?auto_18028 ?auto_18036 ) ) ( not ( = ?auto_18044 ?auto_18039 ) ) ( not ( = ?auto_18044 ?auto_18040 ) ) ( not ( = ?auto_18044 ?auto_18032 ) ) ( not ( = ?auto_18044 ?auto_18045 ) ) ( not ( = ?auto_18044 ?auto_18037 ) ) ( not ( = ?auto_18044 ?auto_18029 ) ) ( not ( = ?auto_18012 ?auto_18020 ) ) ( not ( = ?auto_18012 ?auto_18021 ) ) ( not ( = ?auto_18013 ?auto_18020 ) ) ( not ( = ?auto_18013 ?auto_18021 ) ) ( not ( = ?auto_18014 ?auto_18020 ) ) ( not ( = ?auto_18014 ?auto_18021 ) ) ( not ( = ?auto_18015 ?auto_18020 ) ) ( not ( = ?auto_18015 ?auto_18021 ) ) ( not ( = ?auto_18016 ?auto_18020 ) ) ( not ( = ?auto_18016 ?auto_18021 ) ) ( not ( = ?auto_18017 ?auto_18020 ) ) ( not ( = ?auto_18017 ?auto_18021 ) ) ( not ( = ?auto_18018 ?auto_18020 ) ) ( not ( = ?auto_18018 ?auto_18021 ) ) ( not ( = ?auto_18020 ?auto_18044 ) ) ( not ( = ?auto_18020 ?auto_18039 ) ) ( not ( = ?auto_18020 ?auto_18040 ) ) ( not ( = ?auto_18020 ?auto_18032 ) ) ( not ( = ?auto_18020 ?auto_18045 ) ) ( not ( = ?auto_18020 ?auto_18037 ) ) ( not ( = ?auto_18020 ?auto_18029 ) ) ( not ( = ?auto_18024 ?auto_18041 ) ) ( not ( = ?auto_18024 ?auto_18038 ) ) ( not ( = ?auto_18024 ?auto_18027 ) ) ( not ( = ?auto_18024 ?auto_18035 ) ) ( not ( = ?auto_18024 ?auto_18033 ) ) ( not ( = ?auto_18024 ?auto_18042 ) ) ( not ( = ?auto_18022 ?auto_18028 ) ) ( not ( = ?auto_18022 ?auto_18043 ) ) ( not ( = ?auto_18022 ?auto_18030 ) ) ( not ( = ?auto_18022 ?auto_18034 ) ) ( not ( = ?auto_18022 ?auto_18031 ) ) ( not ( = ?auto_18022 ?auto_18036 ) ) ( not ( = ?auto_18021 ?auto_18044 ) ) ( not ( = ?auto_18021 ?auto_18039 ) ) ( not ( = ?auto_18021 ?auto_18040 ) ) ( not ( = ?auto_18021 ?auto_18032 ) ) ( not ( = ?auto_18021 ?auto_18045 ) ) ( not ( = ?auto_18021 ?auto_18037 ) ) ( not ( = ?auto_18021 ?auto_18029 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_18012 ?auto_18013 ?auto_18014 ?auto_18015 ?auto_18016 ?auto_18017 ?auto_18018 ?auto_18019 )
      ( MAKE-1CRATE ?auto_18019 ?auto_18020 )
      ( MAKE-8CRATE-VERIFY ?auto_18012 ?auto_18013 ?auto_18014 ?auto_18015 ?auto_18016 ?auto_18017 ?auto_18018 ?auto_18019 ?auto_18020 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_18066 - SURFACE
      ?auto_18067 - SURFACE
      ?auto_18068 - SURFACE
      ?auto_18069 - SURFACE
      ?auto_18070 - SURFACE
      ?auto_18071 - SURFACE
      ?auto_18072 - SURFACE
      ?auto_18073 - SURFACE
      ?auto_18074 - SURFACE
      ?auto_18075 - SURFACE
    )
    :vars
    (
      ?auto_18081 - HOIST
      ?auto_18080 - PLACE
      ?auto_18076 - PLACE
      ?auto_18078 - HOIST
      ?auto_18079 - SURFACE
      ?auto_18091 - PLACE
      ?auto_18089 - HOIST
      ?auto_18084 - SURFACE
      ?auto_18098 - PLACE
      ?auto_18100 - HOIST
      ?auto_18102 - SURFACE
      ?auto_18083 - PLACE
      ?auto_18093 - HOIST
      ?auto_18096 - SURFACE
      ?auto_18087 - PLACE
      ?auto_18090 - HOIST
      ?auto_18085 - SURFACE
      ?auto_18094 - PLACE
      ?auto_18103 - HOIST
      ?auto_18099 - SURFACE
      ?auto_18082 - SURFACE
      ?auto_18086 - PLACE
      ?auto_18088 - HOIST
      ?auto_18095 - SURFACE
      ?auto_18092 - PLACE
      ?auto_18097 - HOIST
      ?auto_18101 - SURFACE
      ?auto_18077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18081 ?auto_18080 ) ( IS-CRATE ?auto_18075 ) ( not ( = ?auto_18076 ?auto_18080 ) ) ( HOIST-AT ?auto_18078 ?auto_18076 ) ( AVAILABLE ?auto_18078 ) ( SURFACE-AT ?auto_18075 ?auto_18076 ) ( ON ?auto_18075 ?auto_18079 ) ( CLEAR ?auto_18075 ) ( not ( = ?auto_18074 ?auto_18075 ) ) ( not ( = ?auto_18074 ?auto_18079 ) ) ( not ( = ?auto_18075 ?auto_18079 ) ) ( not ( = ?auto_18081 ?auto_18078 ) ) ( IS-CRATE ?auto_18074 ) ( not ( = ?auto_18091 ?auto_18080 ) ) ( HOIST-AT ?auto_18089 ?auto_18091 ) ( AVAILABLE ?auto_18089 ) ( SURFACE-AT ?auto_18074 ?auto_18091 ) ( ON ?auto_18074 ?auto_18084 ) ( CLEAR ?auto_18074 ) ( not ( = ?auto_18073 ?auto_18074 ) ) ( not ( = ?auto_18073 ?auto_18084 ) ) ( not ( = ?auto_18074 ?auto_18084 ) ) ( not ( = ?auto_18081 ?auto_18089 ) ) ( IS-CRATE ?auto_18073 ) ( not ( = ?auto_18098 ?auto_18080 ) ) ( HOIST-AT ?auto_18100 ?auto_18098 ) ( AVAILABLE ?auto_18100 ) ( SURFACE-AT ?auto_18073 ?auto_18098 ) ( ON ?auto_18073 ?auto_18102 ) ( CLEAR ?auto_18073 ) ( not ( = ?auto_18072 ?auto_18073 ) ) ( not ( = ?auto_18072 ?auto_18102 ) ) ( not ( = ?auto_18073 ?auto_18102 ) ) ( not ( = ?auto_18081 ?auto_18100 ) ) ( IS-CRATE ?auto_18072 ) ( not ( = ?auto_18083 ?auto_18080 ) ) ( HOIST-AT ?auto_18093 ?auto_18083 ) ( SURFACE-AT ?auto_18072 ?auto_18083 ) ( ON ?auto_18072 ?auto_18096 ) ( CLEAR ?auto_18072 ) ( not ( = ?auto_18071 ?auto_18072 ) ) ( not ( = ?auto_18071 ?auto_18096 ) ) ( not ( = ?auto_18072 ?auto_18096 ) ) ( not ( = ?auto_18081 ?auto_18093 ) ) ( IS-CRATE ?auto_18071 ) ( not ( = ?auto_18087 ?auto_18080 ) ) ( HOIST-AT ?auto_18090 ?auto_18087 ) ( AVAILABLE ?auto_18090 ) ( SURFACE-AT ?auto_18071 ?auto_18087 ) ( ON ?auto_18071 ?auto_18085 ) ( CLEAR ?auto_18071 ) ( not ( = ?auto_18070 ?auto_18071 ) ) ( not ( = ?auto_18070 ?auto_18085 ) ) ( not ( = ?auto_18071 ?auto_18085 ) ) ( not ( = ?auto_18081 ?auto_18090 ) ) ( IS-CRATE ?auto_18070 ) ( not ( = ?auto_18094 ?auto_18080 ) ) ( HOIST-AT ?auto_18103 ?auto_18094 ) ( AVAILABLE ?auto_18103 ) ( SURFACE-AT ?auto_18070 ?auto_18094 ) ( ON ?auto_18070 ?auto_18099 ) ( CLEAR ?auto_18070 ) ( not ( = ?auto_18069 ?auto_18070 ) ) ( not ( = ?auto_18069 ?auto_18099 ) ) ( not ( = ?auto_18070 ?auto_18099 ) ) ( not ( = ?auto_18081 ?auto_18103 ) ) ( IS-CRATE ?auto_18069 ) ( AVAILABLE ?auto_18093 ) ( SURFACE-AT ?auto_18069 ?auto_18083 ) ( ON ?auto_18069 ?auto_18082 ) ( CLEAR ?auto_18069 ) ( not ( = ?auto_18068 ?auto_18069 ) ) ( not ( = ?auto_18068 ?auto_18082 ) ) ( not ( = ?auto_18069 ?auto_18082 ) ) ( IS-CRATE ?auto_18068 ) ( not ( = ?auto_18086 ?auto_18080 ) ) ( HOIST-AT ?auto_18088 ?auto_18086 ) ( AVAILABLE ?auto_18088 ) ( SURFACE-AT ?auto_18068 ?auto_18086 ) ( ON ?auto_18068 ?auto_18095 ) ( CLEAR ?auto_18068 ) ( not ( = ?auto_18067 ?auto_18068 ) ) ( not ( = ?auto_18067 ?auto_18095 ) ) ( not ( = ?auto_18068 ?auto_18095 ) ) ( not ( = ?auto_18081 ?auto_18088 ) ) ( SURFACE-AT ?auto_18066 ?auto_18080 ) ( CLEAR ?auto_18066 ) ( IS-CRATE ?auto_18067 ) ( AVAILABLE ?auto_18081 ) ( not ( = ?auto_18092 ?auto_18080 ) ) ( HOIST-AT ?auto_18097 ?auto_18092 ) ( AVAILABLE ?auto_18097 ) ( SURFACE-AT ?auto_18067 ?auto_18092 ) ( ON ?auto_18067 ?auto_18101 ) ( CLEAR ?auto_18067 ) ( TRUCK-AT ?auto_18077 ?auto_18080 ) ( not ( = ?auto_18066 ?auto_18067 ) ) ( not ( = ?auto_18066 ?auto_18101 ) ) ( not ( = ?auto_18067 ?auto_18101 ) ) ( not ( = ?auto_18081 ?auto_18097 ) ) ( not ( = ?auto_18066 ?auto_18068 ) ) ( not ( = ?auto_18066 ?auto_18095 ) ) ( not ( = ?auto_18068 ?auto_18101 ) ) ( not ( = ?auto_18086 ?auto_18092 ) ) ( not ( = ?auto_18088 ?auto_18097 ) ) ( not ( = ?auto_18095 ?auto_18101 ) ) ( not ( = ?auto_18066 ?auto_18069 ) ) ( not ( = ?auto_18066 ?auto_18082 ) ) ( not ( = ?auto_18067 ?auto_18069 ) ) ( not ( = ?auto_18067 ?auto_18082 ) ) ( not ( = ?auto_18069 ?auto_18095 ) ) ( not ( = ?auto_18069 ?auto_18101 ) ) ( not ( = ?auto_18083 ?auto_18086 ) ) ( not ( = ?auto_18083 ?auto_18092 ) ) ( not ( = ?auto_18093 ?auto_18088 ) ) ( not ( = ?auto_18093 ?auto_18097 ) ) ( not ( = ?auto_18082 ?auto_18095 ) ) ( not ( = ?auto_18082 ?auto_18101 ) ) ( not ( = ?auto_18066 ?auto_18070 ) ) ( not ( = ?auto_18066 ?auto_18099 ) ) ( not ( = ?auto_18067 ?auto_18070 ) ) ( not ( = ?auto_18067 ?auto_18099 ) ) ( not ( = ?auto_18068 ?auto_18070 ) ) ( not ( = ?auto_18068 ?auto_18099 ) ) ( not ( = ?auto_18070 ?auto_18082 ) ) ( not ( = ?auto_18070 ?auto_18095 ) ) ( not ( = ?auto_18070 ?auto_18101 ) ) ( not ( = ?auto_18094 ?auto_18083 ) ) ( not ( = ?auto_18094 ?auto_18086 ) ) ( not ( = ?auto_18094 ?auto_18092 ) ) ( not ( = ?auto_18103 ?auto_18093 ) ) ( not ( = ?auto_18103 ?auto_18088 ) ) ( not ( = ?auto_18103 ?auto_18097 ) ) ( not ( = ?auto_18099 ?auto_18082 ) ) ( not ( = ?auto_18099 ?auto_18095 ) ) ( not ( = ?auto_18099 ?auto_18101 ) ) ( not ( = ?auto_18066 ?auto_18071 ) ) ( not ( = ?auto_18066 ?auto_18085 ) ) ( not ( = ?auto_18067 ?auto_18071 ) ) ( not ( = ?auto_18067 ?auto_18085 ) ) ( not ( = ?auto_18068 ?auto_18071 ) ) ( not ( = ?auto_18068 ?auto_18085 ) ) ( not ( = ?auto_18069 ?auto_18071 ) ) ( not ( = ?auto_18069 ?auto_18085 ) ) ( not ( = ?auto_18071 ?auto_18099 ) ) ( not ( = ?auto_18071 ?auto_18082 ) ) ( not ( = ?auto_18071 ?auto_18095 ) ) ( not ( = ?auto_18071 ?auto_18101 ) ) ( not ( = ?auto_18087 ?auto_18094 ) ) ( not ( = ?auto_18087 ?auto_18083 ) ) ( not ( = ?auto_18087 ?auto_18086 ) ) ( not ( = ?auto_18087 ?auto_18092 ) ) ( not ( = ?auto_18090 ?auto_18103 ) ) ( not ( = ?auto_18090 ?auto_18093 ) ) ( not ( = ?auto_18090 ?auto_18088 ) ) ( not ( = ?auto_18090 ?auto_18097 ) ) ( not ( = ?auto_18085 ?auto_18099 ) ) ( not ( = ?auto_18085 ?auto_18082 ) ) ( not ( = ?auto_18085 ?auto_18095 ) ) ( not ( = ?auto_18085 ?auto_18101 ) ) ( not ( = ?auto_18066 ?auto_18072 ) ) ( not ( = ?auto_18066 ?auto_18096 ) ) ( not ( = ?auto_18067 ?auto_18072 ) ) ( not ( = ?auto_18067 ?auto_18096 ) ) ( not ( = ?auto_18068 ?auto_18072 ) ) ( not ( = ?auto_18068 ?auto_18096 ) ) ( not ( = ?auto_18069 ?auto_18072 ) ) ( not ( = ?auto_18069 ?auto_18096 ) ) ( not ( = ?auto_18070 ?auto_18072 ) ) ( not ( = ?auto_18070 ?auto_18096 ) ) ( not ( = ?auto_18072 ?auto_18085 ) ) ( not ( = ?auto_18072 ?auto_18099 ) ) ( not ( = ?auto_18072 ?auto_18082 ) ) ( not ( = ?auto_18072 ?auto_18095 ) ) ( not ( = ?auto_18072 ?auto_18101 ) ) ( not ( = ?auto_18096 ?auto_18085 ) ) ( not ( = ?auto_18096 ?auto_18099 ) ) ( not ( = ?auto_18096 ?auto_18082 ) ) ( not ( = ?auto_18096 ?auto_18095 ) ) ( not ( = ?auto_18096 ?auto_18101 ) ) ( not ( = ?auto_18066 ?auto_18073 ) ) ( not ( = ?auto_18066 ?auto_18102 ) ) ( not ( = ?auto_18067 ?auto_18073 ) ) ( not ( = ?auto_18067 ?auto_18102 ) ) ( not ( = ?auto_18068 ?auto_18073 ) ) ( not ( = ?auto_18068 ?auto_18102 ) ) ( not ( = ?auto_18069 ?auto_18073 ) ) ( not ( = ?auto_18069 ?auto_18102 ) ) ( not ( = ?auto_18070 ?auto_18073 ) ) ( not ( = ?auto_18070 ?auto_18102 ) ) ( not ( = ?auto_18071 ?auto_18073 ) ) ( not ( = ?auto_18071 ?auto_18102 ) ) ( not ( = ?auto_18073 ?auto_18096 ) ) ( not ( = ?auto_18073 ?auto_18085 ) ) ( not ( = ?auto_18073 ?auto_18099 ) ) ( not ( = ?auto_18073 ?auto_18082 ) ) ( not ( = ?auto_18073 ?auto_18095 ) ) ( not ( = ?auto_18073 ?auto_18101 ) ) ( not ( = ?auto_18098 ?auto_18083 ) ) ( not ( = ?auto_18098 ?auto_18087 ) ) ( not ( = ?auto_18098 ?auto_18094 ) ) ( not ( = ?auto_18098 ?auto_18086 ) ) ( not ( = ?auto_18098 ?auto_18092 ) ) ( not ( = ?auto_18100 ?auto_18093 ) ) ( not ( = ?auto_18100 ?auto_18090 ) ) ( not ( = ?auto_18100 ?auto_18103 ) ) ( not ( = ?auto_18100 ?auto_18088 ) ) ( not ( = ?auto_18100 ?auto_18097 ) ) ( not ( = ?auto_18102 ?auto_18096 ) ) ( not ( = ?auto_18102 ?auto_18085 ) ) ( not ( = ?auto_18102 ?auto_18099 ) ) ( not ( = ?auto_18102 ?auto_18082 ) ) ( not ( = ?auto_18102 ?auto_18095 ) ) ( not ( = ?auto_18102 ?auto_18101 ) ) ( not ( = ?auto_18066 ?auto_18074 ) ) ( not ( = ?auto_18066 ?auto_18084 ) ) ( not ( = ?auto_18067 ?auto_18074 ) ) ( not ( = ?auto_18067 ?auto_18084 ) ) ( not ( = ?auto_18068 ?auto_18074 ) ) ( not ( = ?auto_18068 ?auto_18084 ) ) ( not ( = ?auto_18069 ?auto_18074 ) ) ( not ( = ?auto_18069 ?auto_18084 ) ) ( not ( = ?auto_18070 ?auto_18074 ) ) ( not ( = ?auto_18070 ?auto_18084 ) ) ( not ( = ?auto_18071 ?auto_18074 ) ) ( not ( = ?auto_18071 ?auto_18084 ) ) ( not ( = ?auto_18072 ?auto_18074 ) ) ( not ( = ?auto_18072 ?auto_18084 ) ) ( not ( = ?auto_18074 ?auto_18102 ) ) ( not ( = ?auto_18074 ?auto_18096 ) ) ( not ( = ?auto_18074 ?auto_18085 ) ) ( not ( = ?auto_18074 ?auto_18099 ) ) ( not ( = ?auto_18074 ?auto_18082 ) ) ( not ( = ?auto_18074 ?auto_18095 ) ) ( not ( = ?auto_18074 ?auto_18101 ) ) ( not ( = ?auto_18091 ?auto_18098 ) ) ( not ( = ?auto_18091 ?auto_18083 ) ) ( not ( = ?auto_18091 ?auto_18087 ) ) ( not ( = ?auto_18091 ?auto_18094 ) ) ( not ( = ?auto_18091 ?auto_18086 ) ) ( not ( = ?auto_18091 ?auto_18092 ) ) ( not ( = ?auto_18089 ?auto_18100 ) ) ( not ( = ?auto_18089 ?auto_18093 ) ) ( not ( = ?auto_18089 ?auto_18090 ) ) ( not ( = ?auto_18089 ?auto_18103 ) ) ( not ( = ?auto_18089 ?auto_18088 ) ) ( not ( = ?auto_18089 ?auto_18097 ) ) ( not ( = ?auto_18084 ?auto_18102 ) ) ( not ( = ?auto_18084 ?auto_18096 ) ) ( not ( = ?auto_18084 ?auto_18085 ) ) ( not ( = ?auto_18084 ?auto_18099 ) ) ( not ( = ?auto_18084 ?auto_18082 ) ) ( not ( = ?auto_18084 ?auto_18095 ) ) ( not ( = ?auto_18084 ?auto_18101 ) ) ( not ( = ?auto_18066 ?auto_18075 ) ) ( not ( = ?auto_18066 ?auto_18079 ) ) ( not ( = ?auto_18067 ?auto_18075 ) ) ( not ( = ?auto_18067 ?auto_18079 ) ) ( not ( = ?auto_18068 ?auto_18075 ) ) ( not ( = ?auto_18068 ?auto_18079 ) ) ( not ( = ?auto_18069 ?auto_18075 ) ) ( not ( = ?auto_18069 ?auto_18079 ) ) ( not ( = ?auto_18070 ?auto_18075 ) ) ( not ( = ?auto_18070 ?auto_18079 ) ) ( not ( = ?auto_18071 ?auto_18075 ) ) ( not ( = ?auto_18071 ?auto_18079 ) ) ( not ( = ?auto_18072 ?auto_18075 ) ) ( not ( = ?auto_18072 ?auto_18079 ) ) ( not ( = ?auto_18073 ?auto_18075 ) ) ( not ( = ?auto_18073 ?auto_18079 ) ) ( not ( = ?auto_18075 ?auto_18084 ) ) ( not ( = ?auto_18075 ?auto_18102 ) ) ( not ( = ?auto_18075 ?auto_18096 ) ) ( not ( = ?auto_18075 ?auto_18085 ) ) ( not ( = ?auto_18075 ?auto_18099 ) ) ( not ( = ?auto_18075 ?auto_18082 ) ) ( not ( = ?auto_18075 ?auto_18095 ) ) ( not ( = ?auto_18075 ?auto_18101 ) ) ( not ( = ?auto_18076 ?auto_18091 ) ) ( not ( = ?auto_18076 ?auto_18098 ) ) ( not ( = ?auto_18076 ?auto_18083 ) ) ( not ( = ?auto_18076 ?auto_18087 ) ) ( not ( = ?auto_18076 ?auto_18094 ) ) ( not ( = ?auto_18076 ?auto_18086 ) ) ( not ( = ?auto_18076 ?auto_18092 ) ) ( not ( = ?auto_18078 ?auto_18089 ) ) ( not ( = ?auto_18078 ?auto_18100 ) ) ( not ( = ?auto_18078 ?auto_18093 ) ) ( not ( = ?auto_18078 ?auto_18090 ) ) ( not ( = ?auto_18078 ?auto_18103 ) ) ( not ( = ?auto_18078 ?auto_18088 ) ) ( not ( = ?auto_18078 ?auto_18097 ) ) ( not ( = ?auto_18079 ?auto_18084 ) ) ( not ( = ?auto_18079 ?auto_18102 ) ) ( not ( = ?auto_18079 ?auto_18096 ) ) ( not ( = ?auto_18079 ?auto_18085 ) ) ( not ( = ?auto_18079 ?auto_18099 ) ) ( not ( = ?auto_18079 ?auto_18082 ) ) ( not ( = ?auto_18079 ?auto_18095 ) ) ( not ( = ?auto_18079 ?auto_18101 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_18066 ?auto_18067 ?auto_18068 ?auto_18069 ?auto_18070 ?auto_18071 ?auto_18072 ?auto_18073 ?auto_18074 )
      ( MAKE-1CRATE ?auto_18074 ?auto_18075 )
      ( MAKE-9CRATE-VERIFY ?auto_18066 ?auto_18067 ?auto_18068 ?auto_18069 ?auto_18070 ?auto_18071 ?auto_18072 ?auto_18073 ?auto_18074 ?auto_18075 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_18125 - SURFACE
      ?auto_18126 - SURFACE
      ?auto_18127 - SURFACE
      ?auto_18128 - SURFACE
      ?auto_18129 - SURFACE
      ?auto_18130 - SURFACE
      ?auto_18131 - SURFACE
      ?auto_18132 - SURFACE
      ?auto_18133 - SURFACE
      ?auto_18134 - SURFACE
      ?auto_18135 - SURFACE
    )
    :vars
    (
      ?auto_18141 - HOIST
      ?auto_18139 - PLACE
      ?auto_18136 - PLACE
      ?auto_18138 - HOIST
      ?auto_18137 - SURFACE
      ?auto_18153 - PLACE
      ?auto_18163 - HOIST
      ?auto_18157 - SURFACE
      ?auto_18156 - PLACE
      ?auto_18155 - HOIST
      ?auto_18161 - SURFACE
      ?auto_18145 - SURFACE
      ?auto_18152 - PLACE
      ?auto_18160 - HOIST
      ?auto_18158 - SURFACE
      ?auto_18144 - PLACE
      ?auto_18146 - HOIST
      ?auto_18149 - SURFACE
      ?auto_18159 - PLACE
      ?auto_18147 - HOIST
      ?auto_18164 - SURFACE
      ?auto_18151 - SURFACE
      ?auto_18148 - PLACE
      ?auto_18143 - HOIST
      ?auto_18154 - SURFACE
      ?auto_18150 - PLACE
      ?auto_18142 - HOIST
      ?auto_18162 - SURFACE
      ?auto_18140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18141 ?auto_18139 ) ( IS-CRATE ?auto_18135 ) ( not ( = ?auto_18136 ?auto_18139 ) ) ( HOIST-AT ?auto_18138 ?auto_18136 ) ( SURFACE-AT ?auto_18135 ?auto_18136 ) ( ON ?auto_18135 ?auto_18137 ) ( CLEAR ?auto_18135 ) ( not ( = ?auto_18134 ?auto_18135 ) ) ( not ( = ?auto_18134 ?auto_18137 ) ) ( not ( = ?auto_18135 ?auto_18137 ) ) ( not ( = ?auto_18141 ?auto_18138 ) ) ( IS-CRATE ?auto_18134 ) ( not ( = ?auto_18153 ?auto_18139 ) ) ( HOIST-AT ?auto_18163 ?auto_18153 ) ( AVAILABLE ?auto_18163 ) ( SURFACE-AT ?auto_18134 ?auto_18153 ) ( ON ?auto_18134 ?auto_18157 ) ( CLEAR ?auto_18134 ) ( not ( = ?auto_18133 ?auto_18134 ) ) ( not ( = ?auto_18133 ?auto_18157 ) ) ( not ( = ?auto_18134 ?auto_18157 ) ) ( not ( = ?auto_18141 ?auto_18163 ) ) ( IS-CRATE ?auto_18133 ) ( not ( = ?auto_18156 ?auto_18139 ) ) ( HOIST-AT ?auto_18155 ?auto_18156 ) ( AVAILABLE ?auto_18155 ) ( SURFACE-AT ?auto_18133 ?auto_18156 ) ( ON ?auto_18133 ?auto_18161 ) ( CLEAR ?auto_18133 ) ( not ( = ?auto_18132 ?auto_18133 ) ) ( not ( = ?auto_18132 ?auto_18161 ) ) ( not ( = ?auto_18133 ?auto_18161 ) ) ( not ( = ?auto_18141 ?auto_18155 ) ) ( IS-CRATE ?auto_18132 ) ( AVAILABLE ?auto_18138 ) ( SURFACE-AT ?auto_18132 ?auto_18136 ) ( ON ?auto_18132 ?auto_18145 ) ( CLEAR ?auto_18132 ) ( not ( = ?auto_18131 ?auto_18132 ) ) ( not ( = ?auto_18131 ?auto_18145 ) ) ( not ( = ?auto_18132 ?auto_18145 ) ) ( IS-CRATE ?auto_18131 ) ( not ( = ?auto_18152 ?auto_18139 ) ) ( HOIST-AT ?auto_18160 ?auto_18152 ) ( SURFACE-AT ?auto_18131 ?auto_18152 ) ( ON ?auto_18131 ?auto_18158 ) ( CLEAR ?auto_18131 ) ( not ( = ?auto_18130 ?auto_18131 ) ) ( not ( = ?auto_18130 ?auto_18158 ) ) ( not ( = ?auto_18131 ?auto_18158 ) ) ( not ( = ?auto_18141 ?auto_18160 ) ) ( IS-CRATE ?auto_18130 ) ( not ( = ?auto_18144 ?auto_18139 ) ) ( HOIST-AT ?auto_18146 ?auto_18144 ) ( AVAILABLE ?auto_18146 ) ( SURFACE-AT ?auto_18130 ?auto_18144 ) ( ON ?auto_18130 ?auto_18149 ) ( CLEAR ?auto_18130 ) ( not ( = ?auto_18129 ?auto_18130 ) ) ( not ( = ?auto_18129 ?auto_18149 ) ) ( not ( = ?auto_18130 ?auto_18149 ) ) ( not ( = ?auto_18141 ?auto_18146 ) ) ( IS-CRATE ?auto_18129 ) ( not ( = ?auto_18159 ?auto_18139 ) ) ( HOIST-AT ?auto_18147 ?auto_18159 ) ( AVAILABLE ?auto_18147 ) ( SURFACE-AT ?auto_18129 ?auto_18159 ) ( ON ?auto_18129 ?auto_18164 ) ( CLEAR ?auto_18129 ) ( not ( = ?auto_18128 ?auto_18129 ) ) ( not ( = ?auto_18128 ?auto_18164 ) ) ( not ( = ?auto_18129 ?auto_18164 ) ) ( not ( = ?auto_18141 ?auto_18147 ) ) ( IS-CRATE ?auto_18128 ) ( AVAILABLE ?auto_18160 ) ( SURFACE-AT ?auto_18128 ?auto_18152 ) ( ON ?auto_18128 ?auto_18151 ) ( CLEAR ?auto_18128 ) ( not ( = ?auto_18127 ?auto_18128 ) ) ( not ( = ?auto_18127 ?auto_18151 ) ) ( not ( = ?auto_18128 ?auto_18151 ) ) ( IS-CRATE ?auto_18127 ) ( not ( = ?auto_18148 ?auto_18139 ) ) ( HOIST-AT ?auto_18143 ?auto_18148 ) ( AVAILABLE ?auto_18143 ) ( SURFACE-AT ?auto_18127 ?auto_18148 ) ( ON ?auto_18127 ?auto_18154 ) ( CLEAR ?auto_18127 ) ( not ( = ?auto_18126 ?auto_18127 ) ) ( not ( = ?auto_18126 ?auto_18154 ) ) ( not ( = ?auto_18127 ?auto_18154 ) ) ( not ( = ?auto_18141 ?auto_18143 ) ) ( SURFACE-AT ?auto_18125 ?auto_18139 ) ( CLEAR ?auto_18125 ) ( IS-CRATE ?auto_18126 ) ( AVAILABLE ?auto_18141 ) ( not ( = ?auto_18150 ?auto_18139 ) ) ( HOIST-AT ?auto_18142 ?auto_18150 ) ( AVAILABLE ?auto_18142 ) ( SURFACE-AT ?auto_18126 ?auto_18150 ) ( ON ?auto_18126 ?auto_18162 ) ( CLEAR ?auto_18126 ) ( TRUCK-AT ?auto_18140 ?auto_18139 ) ( not ( = ?auto_18125 ?auto_18126 ) ) ( not ( = ?auto_18125 ?auto_18162 ) ) ( not ( = ?auto_18126 ?auto_18162 ) ) ( not ( = ?auto_18141 ?auto_18142 ) ) ( not ( = ?auto_18125 ?auto_18127 ) ) ( not ( = ?auto_18125 ?auto_18154 ) ) ( not ( = ?auto_18127 ?auto_18162 ) ) ( not ( = ?auto_18148 ?auto_18150 ) ) ( not ( = ?auto_18143 ?auto_18142 ) ) ( not ( = ?auto_18154 ?auto_18162 ) ) ( not ( = ?auto_18125 ?auto_18128 ) ) ( not ( = ?auto_18125 ?auto_18151 ) ) ( not ( = ?auto_18126 ?auto_18128 ) ) ( not ( = ?auto_18126 ?auto_18151 ) ) ( not ( = ?auto_18128 ?auto_18154 ) ) ( not ( = ?auto_18128 ?auto_18162 ) ) ( not ( = ?auto_18152 ?auto_18148 ) ) ( not ( = ?auto_18152 ?auto_18150 ) ) ( not ( = ?auto_18160 ?auto_18143 ) ) ( not ( = ?auto_18160 ?auto_18142 ) ) ( not ( = ?auto_18151 ?auto_18154 ) ) ( not ( = ?auto_18151 ?auto_18162 ) ) ( not ( = ?auto_18125 ?auto_18129 ) ) ( not ( = ?auto_18125 ?auto_18164 ) ) ( not ( = ?auto_18126 ?auto_18129 ) ) ( not ( = ?auto_18126 ?auto_18164 ) ) ( not ( = ?auto_18127 ?auto_18129 ) ) ( not ( = ?auto_18127 ?auto_18164 ) ) ( not ( = ?auto_18129 ?auto_18151 ) ) ( not ( = ?auto_18129 ?auto_18154 ) ) ( not ( = ?auto_18129 ?auto_18162 ) ) ( not ( = ?auto_18159 ?auto_18152 ) ) ( not ( = ?auto_18159 ?auto_18148 ) ) ( not ( = ?auto_18159 ?auto_18150 ) ) ( not ( = ?auto_18147 ?auto_18160 ) ) ( not ( = ?auto_18147 ?auto_18143 ) ) ( not ( = ?auto_18147 ?auto_18142 ) ) ( not ( = ?auto_18164 ?auto_18151 ) ) ( not ( = ?auto_18164 ?auto_18154 ) ) ( not ( = ?auto_18164 ?auto_18162 ) ) ( not ( = ?auto_18125 ?auto_18130 ) ) ( not ( = ?auto_18125 ?auto_18149 ) ) ( not ( = ?auto_18126 ?auto_18130 ) ) ( not ( = ?auto_18126 ?auto_18149 ) ) ( not ( = ?auto_18127 ?auto_18130 ) ) ( not ( = ?auto_18127 ?auto_18149 ) ) ( not ( = ?auto_18128 ?auto_18130 ) ) ( not ( = ?auto_18128 ?auto_18149 ) ) ( not ( = ?auto_18130 ?auto_18164 ) ) ( not ( = ?auto_18130 ?auto_18151 ) ) ( not ( = ?auto_18130 ?auto_18154 ) ) ( not ( = ?auto_18130 ?auto_18162 ) ) ( not ( = ?auto_18144 ?auto_18159 ) ) ( not ( = ?auto_18144 ?auto_18152 ) ) ( not ( = ?auto_18144 ?auto_18148 ) ) ( not ( = ?auto_18144 ?auto_18150 ) ) ( not ( = ?auto_18146 ?auto_18147 ) ) ( not ( = ?auto_18146 ?auto_18160 ) ) ( not ( = ?auto_18146 ?auto_18143 ) ) ( not ( = ?auto_18146 ?auto_18142 ) ) ( not ( = ?auto_18149 ?auto_18164 ) ) ( not ( = ?auto_18149 ?auto_18151 ) ) ( not ( = ?auto_18149 ?auto_18154 ) ) ( not ( = ?auto_18149 ?auto_18162 ) ) ( not ( = ?auto_18125 ?auto_18131 ) ) ( not ( = ?auto_18125 ?auto_18158 ) ) ( not ( = ?auto_18126 ?auto_18131 ) ) ( not ( = ?auto_18126 ?auto_18158 ) ) ( not ( = ?auto_18127 ?auto_18131 ) ) ( not ( = ?auto_18127 ?auto_18158 ) ) ( not ( = ?auto_18128 ?auto_18131 ) ) ( not ( = ?auto_18128 ?auto_18158 ) ) ( not ( = ?auto_18129 ?auto_18131 ) ) ( not ( = ?auto_18129 ?auto_18158 ) ) ( not ( = ?auto_18131 ?auto_18149 ) ) ( not ( = ?auto_18131 ?auto_18164 ) ) ( not ( = ?auto_18131 ?auto_18151 ) ) ( not ( = ?auto_18131 ?auto_18154 ) ) ( not ( = ?auto_18131 ?auto_18162 ) ) ( not ( = ?auto_18158 ?auto_18149 ) ) ( not ( = ?auto_18158 ?auto_18164 ) ) ( not ( = ?auto_18158 ?auto_18151 ) ) ( not ( = ?auto_18158 ?auto_18154 ) ) ( not ( = ?auto_18158 ?auto_18162 ) ) ( not ( = ?auto_18125 ?auto_18132 ) ) ( not ( = ?auto_18125 ?auto_18145 ) ) ( not ( = ?auto_18126 ?auto_18132 ) ) ( not ( = ?auto_18126 ?auto_18145 ) ) ( not ( = ?auto_18127 ?auto_18132 ) ) ( not ( = ?auto_18127 ?auto_18145 ) ) ( not ( = ?auto_18128 ?auto_18132 ) ) ( not ( = ?auto_18128 ?auto_18145 ) ) ( not ( = ?auto_18129 ?auto_18132 ) ) ( not ( = ?auto_18129 ?auto_18145 ) ) ( not ( = ?auto_18130 ?auto_18132 ) ) ( not ( = ?auto_18130 ?auto_18145 ) ) ( not ( = ?auto_18132 ?auto_18158 ) ) ( not ( = ?auto_18132 ?auto_18149 ) ) ( not ( = ?auto_18132 ?auto_18164 ) ) ( not ( = ?auto_18132 ?auto_18151 ) ) ( not ( = ?auto_18132 ?auto_18154 ) ) ( not ( = ?auto_18132 ?auto_18162 ) ) ( not ( = ?auto_18136 ?auto_18152 ) ) ( not ( = ?auto_18136 ?auto_18144 ) ) ( not ( = ?auto_18136 ?auto_18159 ) ) ( not ( = ?auto_18136 ?auto_18148 ) ) ( not ( = ?auto_18136 ?auto_18150 ) ) ( not ( = ?auto_18138 ?auto_18160 ) ) ( not ( = ?auto_18138 ?auto_18146 ) ) ( not ( = ?auto_18138 ?auto_18147 ) ) ( not ( = ?auto_18138 ?auto_18143 ) ) ( not ( = ?auto_18138 ?auto_18142 ) ) ( not ( = ?auto_18145 ?auto_18158 ) ) ( not ( = ?auto_18145 ?auto_18149 ) ) ( not ( = ?auto_18145 ?auto_18164 ) ) ( not ( = ?auto_18145 ?auto_18151 ) ) ( not ( = ?auto_18145 ?auto_18154 ) ) ( not ( = ?auto_18145 ?auto_18162 ) ) ( not ( = ?auto_18125 ?auto_18133 ) ) ( not ( = ?auto_18125 ?auto_18161 ) ) ( not ( = ?auto_18126 ?auto_18133 ) ) ( not ( = ?auto_18126 ?auto_18161 ) ) ( not ( = ?auto_18127 ?auto_18133 ) ) ( not ( = ?auto_18127 ?auto_18161 ) ) ( not ( = ?auto_18128 ?auto_18133 ) ) ( not ( = ?auto_18128 ?auto_18161 ) ) ( not ( = ?auto_18129 ?auto_18133 ) ) ( not ( = ?auto_18129 ?auto_18161 ) ) ( not ( = ?auto_18130 ?auto_18133 ) ) ( not ( = ?auto_18130 ?auto_18161 ) ) ( not ( = ?auto_18131 ?auto_18133 ) ) ( not ( = ?auto_18131 ?auto_18161 ) ) ( not ( = ?auto_18133 ?auto_18145 ) ) ( not ( = ?auto_18133 ?auto_18158 ) ) ( not ( = ?auto_18133 ?auto_18149 ) ) ( not ( = ?auto_18133 ?auto_18164 ) ) ( not ( = ?auto_18133 ?auto_18151 ) ) ( not ( = ?auto_18133 ?auto_18154 ) ) ( not ( = ?auto_18133 ?auto_18162 ) ) ( not ( = ?auto_18156 ?auto_18136 ) ) ( not ( = ?auto_18156 ?auto_18152 ) ) ( not ( = ?auto_18156 ?auto_18144 ) ) ( not ( = ?auto_18156 ?auto_18159 ) ) ( not ( = ?auto_18156 ?auto_18148 ) ) ( not ( = ?auto_18156 ?auto_18150 ) ) ( not ( = ?auto_18155 ?auto_18138 ) ) ( not ( = ?auto_18155 ?auto_18160 ) ) ( not ( = ?auto_18155 ?auto_18146 ) ) ( not ( = ?auto_18155 ?auto_18147 ) ) ( not ( = ?auto_18155 ?auto_18143 ) ) ( not ( = ?auto_18155 ?auto_18142 ) ) ( not ( = ?auto_18161 ?auto_18145 ) ) ( not ( = ?auto_18161 ?auto_18158 ) ) ( not ( = ?auto_18161 ?auto_18149 ) ) ( not ( = ?auto_18161 ?auto_18164 ) ) ( not ( = ?auto_18161 ?auto_18151 ) ) ( not ( = ?auto_18161 ?auto_18154 ) ) ( not ( = ?auto_18161 ?auto_18162 ) ) ( not ( = ?auto_18125 ?auto_18134 ) ) ( not ( = ?auto_18125 ?auto_18157 ) ) ( not ( = ?auto_18126 ?auto_18134 ) ) ( not ( = ?auto_18126 ?auto_18157 ) ) ( not ( = ?auto_18127 ?auto_18134 ) ) ( not ( = ?auto_18127 ?auto_18157 ) ) ( not ( = ?auto_18128 ?auto_18134 ) ) ( not ( = ?auto_18128 ?auto_18157 ) ) ( not ( = ?auto_18129 ?auto_18134 ) ) ( not ( = ?auto_18129 ?auto_18157 ) ) ( not ( = ?auto_18130 ?auto_18134 ) ) ( not ( = ?auto_18130 ?auto_18157 ) ) ( not ( = ?auto_18131 ?auto_18134 ) ) ( not ( = ?auto_18131 ?auto_18157 ) ) ( not ( = ?auto_18132 ?auto_18134 ) ) ( not ( = ?auto_18132 ?auto_18157 ) ) ( not ( = ?auto_18134 ?auto_18161 ) ) ( not ( = ?auto_18134 ?auto_18145 ) ) ( not ( = ?auto_18134 ?auto_18158 ) ) ( not ( = ?auto_18134 ?auto_18149 ) ) ( not ( = ?auto_18134 ?auto_18164 ) ) ( not ( = ?auto_18134 ?auto_18151 ) ) ( not ( = ?auto_18134 ?auto_18154 ) ) ( not ( = ?auto_18134 ?auto_18162 ) ) ( not ( = ?auto_18153 ?auto_18156 ) ) ( not ( = ?auto_18153 ?auto_18136 ) ) ( not ( = ?auto_18153 ?auto_18152 ) ) ( not ( = ?auto_18153 ?auto_18144 ) ) ( not ( = ?auto_18153 ?auto_18159 ) ) ( not ( = ?auto_18153 ?auto_18148 ) ) ( not ( = ?auto_18153 ?auto_18150 ) ) ( not ( = ?auto_18163 ?auto_18155 ) ) ( not ( = ?auto_18163 ?auto_18138 ) ) ( not ( = ?auto_18163 ?auto_18160 ) ) ( not ( = ?auto_18163 ?auto_18146 ) ) ( not ( = ?auto_18163 ?auto_18147 ) ) ( not ( = ?auto_18163 ?auto_18143 ) ) ( not ( = ?auto_18163 ?auto_18142 ) ) ( not ( = ?auto_18157 ?auto_18161 ) ) ( not ( = ?auto_18157 ?auto_18145 ) ) ( not ( = ?auto_18157 ?auto_18158 ) ) ( not ( = ?auto_18157 ?auto_18149 ) ) ( not ( = ?auto_18157 ?auto_18164 ) ) ( not ( = ?auto_18157 ?auto_18151 ) ) ( not ( = ?auto_18157 ?auto_18154 ) ) ( not ( = ?auto_18157 ?auto_18162 ) ) ( not ( = ?auto_18125 ?auto_18135 ) ) ( not ( = ?auto_18125 ?auto_18137 ) ) ( not ( = ?auto_18126 ?auto_18135 ) ) ( not ( = ?auto_18126 ?auto_18137 ) ) ( not ( = ?auto_18127 ?auto_18135 ) ) ( not ( = ?auto_18127 ?auto_18137 ) ) ( not ( = ?auto_18128 ?auto_18135 ) ) ( not ( = ?auto_18128 ?auto_18137 ) ) ( not ( = ?auto_18129 ?auto_18135 ) ) ( not ( = ?auto_18129 ?auto_18137 ) ) ( not ( = ?auto_18130 ?auto_18135 ) ) ( not ( = ?auto_18130 ?auto_18137 ) ) ( not ( = ?auto_18131 ?auto_18135 ) ) ( not ( = ?auto_18131 ?auto_18137 ) ) ( not ( = ?auto_18132 ?auto_18135 ) ) ( not ( = ?auto_18132 ?auto_18137 ) ) ( not ( = ?auto_18133 ?auto_18135 ) ) ( not ( = ?auto_18133 ?auto_18137 ) ) ( not ( = ?auto_18135 ?auto_18157 ) ) ( not ( = ?auto_18135 ?auto_18161 ) ) ( not ( = ?auto_18135 ?auto_18145 ) ) ( not ( = ?auto_18135 ?auto_18158 ) ) ( not ( = ?auto_18135 ?auto_18149 ) ) ( not ( = ?auto_18135 ?auto_18164 ) ) ( not ( = ?auto_18135 ?auto_18151 ) ) ( not ( = ?auto_18135 ?auto_18154 ) ) ( not ( = ?auto_18135 ?auto_18162 ) ) ( not ( = ?auto_18137 ?auto_18157 ) ) ( not ( = ?auto_18137 ?auto_18161 ) ) ( not ( = ?auto_18137 ?auto_18145 ) ) ( not ( = ?auto_18137 ?auto_18158 ) ) ( not ( = ?auto_18137 ?auto_18149 ) ) ( not ( = ?auto_18137 ?auto_18164 ) ) ( not ( = ?auto_18137 ?auto_18151 ) ) ( not ( = ?auto_18137 ?auto_18154 ) ) ( not ( = ?auto_18137 ?auto_18162 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_18125 ?auto_18126 ?auto_18127 ?auto_18128 ?auto_18129 ?auto_18130 ?auto_18131 ?auto_18132 ?auto_18133 ?auto_18134 )
      ( MAKE-1CRATE ?auto_18134 ?auto_18135 )
      ( MAKE-10CRATE-VERIFY ?auto_18125 ?auto_18126 ?auto_18127 ?auto_18128 ?auto_18129 ?auto_18130 ?auto_18131 ?auto_18132 ?auto_18133 ?auto_18134 ?auto_18135 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_18187 - SURFACE
      ?auto_18188 - SURFACE
      ?auto_18189 - SURFACE
      ?auto_18190 - SURFACE
      ?auto_18191 - SURFACE
      ?auto_18192 - SURFACE
      ?auto_18193 - SURFACE
      ?auto_18194 - SURFACE
      ?auto_18195 - SURFACE
      ?auto_18196 - SURFACE
      ?auto_18197 - SURFACE
      ?auto_18198 - SURFACE
    )
    :vars
    (
      ?auto_18203 - HOIST
      ?auto_18199 - PLACE
      ?auto_18202 - PLACE
      ?auto_18204 - HOIST
      ?auto_18201 - SURFACE
      ?auto_18219 - PLACE
      ?auto_18226 - HOIST
      ?auto_18221 - SURFACE
      ?auto_18212 - PLACE
      ?auto_18205 - HOIST
      ?auto_18217 - SURFACE
      ?auto_18227 - PLACE
      ?auto_18218 - HOIST
      ?auto_18207 - SURFACE
      ?auto_18208 - SURFACE
      ?auto_18213 - PLACE
      ?auto_18206 - HOIST
      ?auto_18223 - SURFACE
      ?auto_18210 - PLACE
      ?auto_18228 - HOIST
      ?auto_18229 - SURFACE
      ?auto_18225 - PLACE
      ?auto_18224 - HOIST
      ?auto_18222 - SURFACE
      ?auto_18215 - SURFACE
      ?auto_18216 - PLACE
      ?auto_18211 - HOIST
      ?auto_18214 - SURFACE
      ?auto_18230 - PLACE
      ?auto_18209 - HOIST
      ?auto_18220 - SURFACE
      ?auto_18200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18203 ?auto_18199 ) ( IS-CRATE ?auto_18198 ) ( not ( = ?auto_18202 ?auto_18199 ) ) ( HOIST-AT ?auto_18204 ?auto_18202 ) ( AVAILABLE ?auto_18204 ) ( SURFACE-AT ?auto_18198 ?auto_18202 ) ( ON ?auto_18198 ?auto_18201 ) ( CLEAR ?auto_18198 ) ( not ( = ?auto_18197 ?auto_18198 ) ) ( not ( = ?auto_18197 ?auto_18201 ) ) ( not ( = ?auto_18198 ?auto_18201 ) ) ( not ( = ?auto_18203 ?auto_18204 ) ) ( IS-CRATE ?auto_18197 ) ( not ( = ?auto_18219 ?auto_18199 ) ) ( HOIST-AT ?auto_18226 ?auto_18219 ) ( SURFACE-AT ?auto_18197 ?auto_18219 ) ( ON ?auto_18197 ?auto_18221 ) ( CLEAR ?auto_18197 ) ( not ( = ?auto_18196 ?auto_18197 ) ) ( not ( = ?auto_18196 ?auto_18221 ) ) ( not ( = ?auto_18197 ?auto_18221 ) ) ( not ( = ?auto_18203 ?auto_18226 ) ) ( IS-CRATE ?auto_18196 ) ( not ( = ?auto_18212 ?auto_18199 ) ) ( HOIST-AT ?auto_18205 ?auto_18212 ) ( AVAILABLE ?auto_18205 ) ( SURFACE-AT ?auto_18196 ?auto_18212 ) ( ON ?auto_18196 ?auto_18217 ) ( CLEAR ?auto_18196 ) ( not ( = ?auto_18195 ?auto_18196 ) ) ( not ( = ?auto_18195 ?auto_18217 ) ) ( not ( = ?auto_18196 ?auto_18217 ) ) ( not ( = ?auto_18203 ?auto_18205 ) ) ( IS-CRATE ?auto_18195 ) ( not ( = ?auto_18227 ?auto_18199 ) ) ( HOIST-AT ?auto_18218 ?auto_18227 ) ( AVAILABLE ?auto_18218 ) ( SURFACE-AT ?auto_18195 ?auto_18227 ) ( ON ?auto_18195 ?auto_18207 ) ( CLEAR ?auto_18195 ) ( not ( = ?auto_18194 ?auto_18195 ) ) ( not ( = ?auto_18194 ?auto_18207 ) ) ( not ( = ?auto_18195 ?auto_18207 ) ) ( not ( = ?auto_18203 ?auto_18218 ) ) ( IS-CRATE ?auto_18194 ) ( AVAILABLE ?auto_18226 ) ( SURFACE-AT ?auto_18194 ?auto_18219 ) ( ON ?auto_18194 ?auto_18208 ) ( CLEAR ?auto_18194 ) ( not ( = ?auto_18193 ?auto_18194 ) ) ( not ( = ?auto_18193 ?auto_18208 ) ) ( not ( = ?auto_18194 ?auto_18208 ) ) ( IS-CRATE ?auto_18193 ) ( not ( = ?auto_18213 ?auto_18199 ) ) ( HOIST-AT ?auto_18206 ?auto_18213 ) ( SURFACE-AT ?auto_18193 ?auto_18213 ) ( ON ?auto_18193 ?auto_18223 ) ( CLEAR ?auto_18193 ) ( not ( = ?auto_18192 ?auto_18193 ) ) ( not ( = ?auto_18192 ?auto_18223 ) ) ( not ( = ?auto_18193 ?auto_18223 ) ) ( not ( = ?auto_18203 ?auto_18206 ) ) ( IS-CRATE ?auto_18192 ) ( not ( = ?auto_18210 ?auto_18199 ) ) ( HOIST-AT ?auto_18228 ?auto_18210 ) ( AVAILABLE ?auto_18228 ) ( SURFACE-AT ?auto_18192 ?auto_18210 ) ( ON ?auto_18192 ?auto_18229 ) ( CLEAR ?auto_18192 ) ( not ( = ?auto_18191 ?auto_18192 ) ) ( not ( = ?auto_18191 ?auto_18229 ) ) ( not ( = ?auto_18192 ?auto_18229 ) ) ( not ( = ?auto_18203 ?auto_18228 ) ) ( IS-CRATE ?auto_18191 ) ( not ( = ?auto_18225 ?auto_18199 ) ) ( HOIST-AT ?auto_18224 ?auto_18225 ) ( AVAILABLE ?auto_18224 ) ( SURFACE-AT ?auto_18191 ?auto_18225 ) ( ON ?auto_18191 ?auto_18222 ) ( CLEAR ?auto_18191 ) ( not ( = ?auto_18190 ?auto_18191 ) ) ( not ( = ?auto_18190 ?auto_18222 ) ) ( not ( = ?auto_18191 ?auto_18222 ) ) ( not ( = ?auto_18203 ?auto_18224 ) ) ( IS-CRATE ?auto_18190 ) ( AVAILABLE ?auto_18206 ) ( SURFACE-AT ?auto_18190 ?auto_18213 ) ( ON ?auto_18190 ?auto_18215 ) ( CLEAR ?auto_18190 ) ( not ( = ?auto_18189 ?auto_18190 ) ) ( not ( = ?auto_18189 ?auto_18215 ) ) ( not ( = ?auto_18190 ?auto_18215 ) ) ( IS-CRATE ?auto_18189 ) ( not ( = ?auto_18216 ?auto_18199 ) ) ( HOIST-AT ?auto_18211 ?auto_18216 ) ( AVAILABLE ?auto_18211 ) ( SURFACE-AT ?auto_18189 ?auto_18216 ) ( ON ?auto_18189 ?auto_18214 ) ( CLEAR ?auto_18189 ) ( not ( = ?auto_18188 ?auto_18189 ) ) ( not ( = ?auto_18188 ?auto_18214 ) ) ( not ( = ?auto_18189 ?auto_18214 ) ) ( not ( = ?auto_18203 ?auto_18211 ) ) ( SURFACE-AT ?auto_18187 ?auto_18199 ) ( CLEAR ?auto_18187 ) ( IS-CRATE ?auto_18188 ) ( AVAILABLE ?auto_18203 ) ( not ( = ?auto_18230 ?auto_18199 ) ) ( HOIST-AT ?auto_18209 ?auto_18230 ) ( AVAILABLE ?auto_18209 ) ( SURFACE-AT ?auto_18188 ?auto_18230 ) ( ON ?auto_18188 ?auto_18220 ) ( CLEAR ?auto_18188 ) ( TRUCK-AT ?auto_18200 ?auto_18199 ) ( not ( = ?auto_18187 ?auto_18188 ) ) ( not ( = ?auto_18187 ?auto_18220 ) ) ( not ( = ?auto_18188 ?auto_18220 ) ) ( not ( = ?auto_18203 ?auto_18209 ) ) ( not ( = ?auto_18187 ?auto_18189 ) ) ( not ( = ?auto_18187 ?auto_18214 ) ) ( not ( = ?auto_18189 ?auto_18220 ) ) ( not ( = ?auto_18216 ?auto_18230 ) ) ( not ( = ?auto_18211 ?auto_18209 ) ) ( not ( = ?auto_18214 ?auto_18220 ) ) ( not ( = ?auto_18187 ?auto_18190 ) ) ( not ( = ?auto_18187 ?auto_18215 ) ) ( not ( = ?auto_18188 ?auto_18190 ) ) ( not ( = ?auto_18188 ?auto_18215 ) ) ( not ( = ?auto_18190 ?auto_18214 ) ) ( not ( = ?auto_18190 ?auto_18220 ) ) ( not ( = ?auto_18213 ?auto_18216 ) ) ( not ( = ?auto_18213 ?auto_18230 ) ) ( not ( = ?auto_18206 ?auto_18211 ) ) ( not ( = ?auto_18206 ?auto_18209 ) ) ( not ( = ?auto_18215 ?auto_18214 ) ) ( not ( = ?auto_18215 ?auto_18220 ) ) ( not ( = ?auto_18187 ?auto_18191 ) ) ( not ( = ?auto_18187 ?auto_18222 ) ) ( not ( = ?auto_18188 ?auto_18191 ) ) ( not ( = ?auto_18188 ?auto_18222 ) ) ( not ( = ?auto_18189 ?auto_18191 ) ) ( not ( = ?auto_18189 ?auto_18222 ) ) ( not ( = ?auto_18191 ?auto_18215 ) ) ( not ( = ?auto_18191 ?auto_18214 ) ) ( not ( = ?auto_18191 ?auto_18220 ) ) ( not ( = ?auto_18225 ?auto_18213 ) ) ( not ( = ?auto_18225 ?auto_18216 ) ) ( not ( = ?auto_18225 ?auto_18230 ) ) ( not ( = ?auto_18224 ?auto_18206 ) ) ( not ( = ?auto_18224 ?auto_18211 ) ) ( not ( = ?auto_18224 ?auto_18209 ) ) ( not ( = ?auto_18222 ?auto_18215 ) ) ( not ( = ?auto_18222 ?auto_18214 ) ) ( not ( = ?auto_18222 ?auto_18220 ) ) ( not ( = ?auto_18187 ?auto_18192 ) ) ( not ( = ?auto_18187 ?auto_18229 ) ) ( not ( = ?auto_18188 ?auto_18192 ) ) ( not ( = ?auto_18188 ?auto_18229 ) ) ( not ( = ?auto_18189 ?auto_18192 ) ) ( not ( = ?auto_18189 ?auto_18229 ) ) ( not ( = ?auto_18190 ?auto_18192 ) ) ( not ( = ?auto_18190 ?auto_18229 ) ) ( not ( = ?auto_18192 ?auto_18222 ) ) ( not ( = ?auto_18192 ?auto_18215 ) ) ( not ( = ?auto_18192 ?auto_18214 ) ) ( not ( = ?auto_18192 ?auto_18220 ) ) ( not ( = ?auto_18210 ?auto_18225 ) ) ( not ( = ?auto_18210 ?auto_18213 ) ) ( not ( = ?auto_18210 ?auto_18216 ) ) ( not ( = ?auto_18210 ?auto_18230 ) ) ( not ( = ?auto_18228 ?auto_18224 ) ) ( not ( = ?auto_18228 ?auto_18206 ) ) ( not ( = ?auto_18228 ?auto_18211 ) ) ( not ( = ?auto_18228 ?auto_18209 ) ) ( not ( = ?auto_18229 ?auto_18222 ) ) ( not ( = ?auto_18229 ?auto_18215 ) ) ( not ( = ?auto_18229 ?auto_18214 ) ) ( not ( = ?auto_18229 ?auto_18220 ) ) ( not ( = ?auto_18187 ?auto_18193 ) ) ( not ( = ?auto_18187 ?auto_18223 ) ) ( not ( = ?auto_18188 ?auto_18193 ) ) ( not ( = ?auto_18188 ?auto_18223 ) ) ( not ( = ?auto_18189 ?auto_18193 ) ) ( not ( = ?auto_18189 ?auto_18223 ) ) ( not ( = ?auto_18190 ?auto_18193 ) ) ( not ( = ?auto_18190 ?auto_18223 ) ) ( not ( = ?auto_18191 ?auto_18193 ) ) ( not ( = ?auto_18191 ?auto_18223 ) ) ( not ( = ?auto_18193 ?auto_18229 ) ) ( not ( = ?auto_18193 ?auto_18222 ) ) ( not ( = ?auto_18193 ?auto_18215 ) ) ( not ( = ?auto_18193 ?auto_18214 ) ) ( not ( = ?auto_18193 ?auto_18220 ) ) ( not ( = ?auto_18223 ?auto_18229 ) ) ( not ( = ?auto_18223 ?auto_18222 ) ) ( not ( = ?auto_18223 ?auto_18215 ) ) ( not ( = ?auto_18223 ?auto_18214 ) ) ( not ( = ?auto_18223 ?auto_18220 ) ) ( not ( = ?auto_18187 ?auto_18194 ) ) ( not ( = ?auto_18187 ?auto_18208 ) ) ( not ( = ?auto_18188 ?auto_18194 ) ) ( not ( = ?auto_18188 ?auto_18208 ) ) ( not ( = ?auto_18189 ?auto_18194 ) ) ( not ( = ?auto_18189 ?auto_18208 ) ) ( not ( = ?auto_18190 ?auto_18194 ) ) ( not ( = ?auto_18190 ?auto_18208 ) ) ( not ( = ?auto_18191 ?auto_18194 ) ) ( not ( = ?auto_18191 ?auto_18208 ) ) ( not ( = ?auto_18192 ?auto_18194 ) ) ( not ( = ?auto_18192 ?auto_18208 ) ) ( not ( = ?auto_18194 ?auto_18223 ) ) ( not ( = ?auto_18194 ?auto_18229 ) ) ( not ( = ?auto_18194 ?auto_18222 ) ) ( not ( = ?auto_18194 ?auto_18215 ) ) ( not ( = ?auto_18194 ?auto_18214 ) ) ( not ( = ?auto_18194 ?auto_18220 ) ) ( not ( = ?auto_18219 ?auto_18213 ) ) ( not ( = ?auto_18219 ?auto_18210 ) ) ( not ( = ?auto_18219 ?auto_18225 ) ) ( not ( = ?auto_18219 ?auto_18216 ) ) ( not ( = ?auto_18219 ?auto_18230 ) ) ( not ( = ?auto_18226 ?auto_18206 ) ) ( not ( = ?auto_18226 ?auto_18228 ) ) ( not ( = ?auto_18226 ?auto_18224 ) ) ( not ( = ?auto_18226 ?auto_18211 ) ) ( not ( = ?auto_18226 ?auto_18209 ) ) ( not ( = ?auto_18208 ?auto_18223 ) ) ( not ( = ?auto_18208 ?auto_18229 ) ) ( not ( = ?auto_18208 ?auto_18222 ) ) ( not ( = ?auto_18208 ?auto_18215 ) ) ( not ( = ?auto_18208 ?auto_18214 ) ) ( not ( = ?auto_18208 ?auto_18220 ) ) ( not ( = ?auto_18187 ?auto_18195 ) ) ( not ( = ?auto_18187 ?auto_18207 ) ) ( not ( = ?auto_18188 ?auto_18195 ) ) ( not ( = ?auto_18188 ?auto_18207 ) ) ( not ( = ?auto_18189 ?auto_18195 ) ) ( not ( = ?auto_18189 ?auto_18207 ) ) ( not ( = ?auto_18190 ?auto_18195 ) ) ( not ( = ?auto_18190 ?auto_18207 ) ) ( not ( = ?auto_18191 ?auto_18195 ) ) ( not ( = ?auto_18191 ?auto_18207 ) ) ( not ( = ?auto_18192 ?auto_18195 ) ) ( not ( = ?auto_18192 ?auto_18207 ) ) ( not ( = ?auto_18193 ?auto_18195 ) ) ( not ( = ?auto_18193 ?auto_18207 ) ) ( not ( = ?auto_18195 ?auto_18208 ) ) ( not ( = ?auto_18195 ?auto_18223 ) ) ( not ( = ?auto_18195 ?auto_18229 ) ) ( not ( = ?auto_18195 ?auto_18222 ) ) ( not ( = ?auto_18195 ?auto_18215 ) ) ( not ( = ?auto_18195 ?auto_18214 ) ) ( not ( = ?auto_18195 ?auto_18220 ) ) ( not ( = ?auto_18227 ?auto_18219 ) ) ( not ( = ?auto_18227 ?auto_18213 ) ) ( not ( = ?auto_18227 ?auto_18210 ) ) ( not ( = ?auto_18227 ?auto_18225 ) ) ( not ( = ?auto_18227 ?auto_18216 ) ) ( not ( = ?auto_18227 ?auto_18230 ) ) ( not ( = ?auto_18218 ?auto_18226 ) ) ( not ( = ?auto_18218 ?auto_18206 ) ) ( not ( = ?auto_18218 ?auto_18228 ) ) ( not ( = ?auto_18218 ?auto_18224 ) ) ( not ( = ?auto_18218 ?auto_18211 ) ) ( not ( = ?auto_18218 ?auto_18209 ) ) ( not ( = ?auto_18207 ?auto_18208 ) ) ( not ( = ?auto_18207 ?auto_18223 ) ) ( not ( = ?auto_18207 ?auto_18229 ) ) ( not ( = ?auto_18207 ?auto_18222 ) ) ( not ( = ?auto_18207 ?auto_18215 ) ) ( not ( = ?auto_18207 ?auto_18214 ) ) ( not ( = ?auto_18207 ?auto_18220 ) ) ( not ( = ?auto_18187 ?auto_18196 ) ) ( not ( = ?auto_18187 ?auto_18217 ) ) ( not ( = ?auto_18188 ?auto_18196 ) ) ( not ( = ?auto_18188 ?auto_18217 ) ) ( not ( = ?auto_18189 ?auto_18196 ) ) ( not ( = ?auto_18189 ?auto_18217 ) ) ( not ( = ?auto_18190 ?auto_18196 ) ) ( not ( = ?auto_18190 ?auto_18217 ) ) ( not ( = ?auto_18191 ?auto_18196 ) ) ( not ( = ?auto_18191 ?auto_18217 ) ) ( not ( = ?auto_18192 ?auto_18196 ) ) ( not ( = ?auto_18192 ?auto_18217 ) ) ( not ( = ?auto_18193 ?auto_18196 ) ) ( not ( = ?auto_18193 ?auto_18217 ) ) ( not ( = ?auto_18194 ?auto_18196 ) ) ( not ( = ?auto_18194 ?auto_18217 ) ) ( not ( = ?auto_18196 ?auto_18207 ) ) ( not ( = ?auto_18196 ?auto_18208 ) ) ( not ( = ?auto_18196 ?auto_18223 ) ) ( not ( = ?auto_18196 ?auto_18229 ) ) ( not ( = ?auto_18196 ?auto_18222 ) ) ( not ( = ?auto_18196 ?auto_18215 ) ) ( not ( = ?auto_18196 ?auto_18214 ) ) ( not ( = ?auto_18196 ?auto_18220 ) ) ( not ( = ?auto_18212 ?auto_18227 ) ) ( not ( = ?auto_18212 ?auto_18219 ) ) ( not ( = ?auto_18212 ?auto_18213 ) ) ( not ( = ?auto_18212 ?auto_18210 ) ) ( not ( = ?auto_18212 ?auto_18225 ) ) ( not ( = ?auto_18212 ?auto_18216 ) ) ( not ( = ?auto_18212 ?auto_18230 ) ) ( not ( = ?auto_18205 ?auto_18218 ) ) ( not ( = ?auto_18205 ?auto_18226 ) ) ( not ( = ?auto_18205 ?auto_18206 ) ) ( not ( = ?auto_18205 ?auto_18228 ) ) ( not ( = ?auto_18205 ?auto_18224 ) ) ( not ( = ?auto_18205 ?auto_18211 ) ) ( not ( = ?auto_18205 ?auto_18209 ) ) ( not ( = ?auto_18217 ?auto_18207 ) ) ( not ( = ?auto_18217 ?auto_18208 ) ) ( not ( = ?auto_18217 ?auto_18223 ) ) ( not ( = ?auto_18217 ?auto_18229 ) ) ( not ( = ?auto_18217 ?auto_18222 ) ) ( not ( = ?auto_18217 ?auto_18215 ) ) ( not ( = ?auto_18217 ?auto_18214 ) ) ( not ( = ?auto_18217 ?auto_18220 ) ) ( not ( = ?auto_18187 ?auto_18197 ) ) ( not ( = ?auto_18187 ?auto_18221 ) ) ( not ( = ?auto_18188 ?auto_18197 ) ) ( not ( = ?auto_18188 ?auto_18221 ) ) ( not ( = ?auto_18189 ?auto_18197 ) ) ( not ( = ?auto_18189 ?auto_18221 ) ) ( not ( = ?auto_18190 ?auto_18197 ) ) ( not ( = ?auto_18190 ?auto_18221 ) ) ( not ( = ?auto_18191 ?auto_18197 ) ) ( not ( = ?auto_18191 ?auto_18221 ) ) ( not ( = ?auto_18192 ?auto_18197 ) ) ( not ( = ?auto_18192 ?auto_18221 ) ) ( not ( = ?auto_18193 ?auto_18197 ) ) ( not ( = ?auto_18193 ?auto_18221 ) ) ( not ( = ?auto_18194 ?auto_18197 ) ) ( not ( = ?auto_18194 ?auto_18221 ) ) ( not ( = ?auto_18195 ?auto_18197 ) ) ( not ( = ?auto_18195 ?auto_18221 ) ) ( not ( = ?auto_18197 ?auto_18217 ) ) ( not ( = ?auto_18197 ?auto_18207 ) ) ( not ( = ?auto_18197 ?auto_18208 ) ) ( not ( = ?auto_18197 ?auto_18223 ) ) ( not ( = ?auto_18197 ?auto_18229 ) ) ( not ( = ?auto_18197 ?auto_18222 ) ) ( not ( = ?auto_18197 ?auto_18215 ) ) ( not ( = ?auto_18197 ?auto_18214 ) ) ( not ( = ?auto_18197 ?auto_18220 ) ) ( not ( = ?auto_18221 ?auto_18217 ) ) ( not ( = ?auto_18221 ?auto_18207 ) ) ( not ( = ?auto_18221 ?auto_18208 ) ) ( not ( = ?auto_18221 ?auto_18223 ) ) ( not ( = ?auto_18221 ?auto_18229 ) ) ( not ( = ?auto_18221 ?auto_18222 ) ) ( not ( = ?auto_18221 ?auto_18215 ) ) ( not ( = ?auto_18221 ?auto_18214 ) ) ( not ( = ?auto_18221 ?auto_18220 ) ) ( not ( = ?auto_18187 ?auto_18198 ) ) ( not ( = ?auto_18187 ?auto_18201 ) ) ( not ( = ?auto_18188 ?auto_18198 ) ) ( not ( = ?auto_18188 ?auto_18201 ) ) ( not ( = ?auto_18189 ?auto_18198 ) ) ( not ( = ?auto_18189 ?auto_18201 ) ) ( not ( = ?auto_18190 ?auto_18198 ) ) ( not ( = ?auto_18190 ?auto_18201 ) ) ( not ( = ?auto_18191 ?auto_18198 ) ) ( not ( = ?auto_18191 ?auto_18201 ) ) ( not ( = ?auto_18192 ?auto_18198 ) ) ( not ( = ?auto_18192 ?auto_18201 ) ) ( not ( = ?auto_18193 ?auto_18198 ) ) ( not ( = ?auto_18193 ?auto_18201 ) ) ( not ( = ?auto_18194 ?auto_18198 ) ) ( not ( = ?auto_18194 ?auto_18201 ) ) ( not ( = ?auto_18195 ?auto_18198 ) ) ( not ( = ?auto_18195 ?auto_18201 ) ) ( not ( = ?auto_18196 ?auto_18198 ) ) ( not ( = ?auto_18196 ?auto_18201 ) ) ( not ( = ?auto_18198 ?auto_18221 ) ) ( not ( = ?auto_18198 ?auto_18217 ) ) ( not ( = ?auto_18198 ?auto_18207 ) ) ( not ( = ?auto_18198 ?auto_18208 ) ) ( not ( = ?auto_18198 ?auto_18223 ) ) ( not ( = ?auto_18198 ?auto_18229 ) ) ( not ( = ?auto_18198 ?auto_18222 ) ) ( not ( = ?auto_18198 ?auto_18215 ) ) ( not ( = ?auto_18198 ?auto_18214 ) ) ( not ( = ?auto_18198 ?auto_18220 ) ) ( not ( = ?auto_18202 ?auto_18219 ) ) ( not ( = ?auto_18202 ?auto_18212 ) ) ( not ( = ?auto_18202 ?auto_18227 ) ) ( not ( = ?auto_18202 ?auto_18213 ) ) ( not ( = ?auto_18202 ?auto_18210 ) ) ( not ( = ?auto_18202 ?auto_18225 ) ) ( not ( = ?auto_18202 ?auto_18216 ) ) ( not ( = ?auto_18202 ?auto_18230 ) ) ( not ( = ?auto_18204 ?auto_18226 ) ) ( not ( = ?auto_18204 ?auto_18205 ) ) ( not ( = ?auto_18204 ?auto_18218 ) ) ( not ( = ?auto_18204 ?auto_18206 ) ) ( not ( = ?auto_18204 ?auto_18228 ) ) ( not ( = ?auto_18204 ?auto_18224 ) ) ( not ( = ?auto_18204 ?auto_18211 ) ) ( not ( = ?auto_18204 ?auto_18209 ) ) ( not ( = ?auto_18201 ?auto_18221 ) ) ( not ( = ?auto_18201 ?auto_18217 ) ) ( not ( = ?auto_18201 ?auto_18207 ) ) ( not ( = ?auto_18201 ?auto_18208 ) ) ( not ( = ?auto_18201 ?auto_18223 ) ) ( not ( = ?auto_18201 ?auto_18229 ) ) ( not ( = ?auto_18201 ?auto_18222 ) ) ( not ( = ?auto_18201 ?auto_18215 ) ) ( not ( = ?auto_18201 ?auto_18214 ) ) ( not ( = ?auto_18201 ?auto_18220 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_18187 ?auto_18188 ?auto_18189 ?auto_18190 ?auto_18191 ?auto_18192 ?auto_18193 ?auto_18194 ?auto_18195 ?auto_18196 ?auto_18197 )
      ( MAKE-1CRATE ?auto_18197 ?auto_18198 )
      ( MAKE-11CRATE-VERIFY ?auto_18187 ?auto_18188 ?auto_18189 ?auto_18190 ?auto_18191 ?auto_18192 ?auto_18193 ?auto_18194 ?auto_18195 ?auto_18196 ?auto_18197 ?auto_18198 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_18254 - SURFACE
      ?auto_18255 - SURFACE
      ?auto_18256 - SURFACE
      ?auto_18257 - SURFACE
      ?auto_18258 - SURFACE
      ?auto_18259 - SURFACE
      ?auto_18260 - SURFACE
      ?auto_18261 - SURFACE
      ?auto_18262 - SURFACE
      ?auto_18263 - SURFACE
      ?auto_18264 - SURFACE
      ?auto_18265 - SURFACE
      ?auto_18266 - SURFACE
    )
    :vars
    (
      ?auto_18267 - HOIST
      ?auto_18272 - PLACE
      ?auto_18268 - PLACE
      ?auto_18269 - HOIST
      ?auto_18270 - SURFACE
      ?auto_18276 - PLACE
      ?auto_18286 - HOIST
      ?auto_18299 - SURFACE
      ?auto_18285 - PLACE
      ?auto_18293 - HOIST
      ?auto_18278 - SURFACE
      ?auto_18284 - PLACE
      ?auto_18279 - HOIST
      ?auto_18291 - SURFACE
      ?auto_18289 - SURFACE
      ?auto_18287 - SURFACE
      ?auto_18298 - PLACE
      ?auto_18280 - HOIST
      ?auto_18297 - SURFACE
      ?auto_18294 - PLACE
      ?auto_18296 - HOIST
      ?auto_18292 - SURFACE
      ?auto_18275 - PLACE
      ?auto_18288 - HOIST
      ?auto_18295 - SURFACE
      ?auto_18282 - SURFACE
      ?auto_18277 - PLACE
      ?auto_18283 - HOIST
      ?auto_18281 - SURFACE
      ?auto_18290 - PLACE
      ?auto_18273 - HOIST
      ?auto_18274 - SURFACE
      ?auto_18271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18267 ?auto_18272 ) ( IS-CRATE ?auto_18266 ) ( not ( = ?auto_18268 ?auto_18272 ) ) ( HOIST-AT ?auto_18269 ?auto_18268 ) ( SURFACE-AT ?auto_18266 ?auto_18268 ) ( ON ?auto_18266 ?auto_18270 ) ( CLEAR ?auto_18266 ) ( not ( = ?auto_18265 ?auto_18266 ) ) ( not ( = ?auto_18265 ?auto_18270 ) ) ( not ( = ?auto_18266 ?auto_18270 ) ) ( not ( = ?auto_18267 ?auto_18269 ) ) ( IS-CRATE ?auto_18265 ) ( not ( = ?auto_18276 ?auto_18272 ) ) ( HOIST-AT ?auto_18286 ?auto_18276 ) ( AVAILABLE ?auto_18286 ) ( SURFACE-AT ?auto_18265 ?auto_18276 ) ( ON ?auto_18265 ?auto_18299 ) ( CLEAR ?auto_18265 ) ( not ( = ?auto_18264 ?auto_18265 ) ) ( not ( = ?auto_18264 ?auto_18299 ) ) ( not ( = ?auto_18265 ?auto_18299 ) ) ( not ( = ?auto_18267 ?auto_18286 ) ) ( IS-CRATE ?auto_18264 ) ( not ( = ?auto_18285 ?auto_18272 ) ) ( HOIST-AT ?auto_18293 ?auto_18285 ) ( SURFACE-AT ?auto_18264 ?auto_18285 ) ( ON ?auto_18264 ?auto_18278 ) ( CLEAR ?auto_18264 ) ( not ( = ?auto_18263 ?auto_18264 ) ) ( not ( = ?auto_18263 ?auto_18278 ) ) ( not ( = ?auto_18264 ?auto_18278 ) ) ( not ( = ?auto_18267 ?auto_18293 ) ) ( IS-CRATE ?auto_18263 ) ( not ( = ?auto_18284 ?auto_18272 ) ) ( HOIST-AT ?auto_18279 ?auto_18284 ) ( AVAILABLE ?auto_18279 ) ( SURFACE-AT ?auto_18263 ?auto_18284 ) ( ON ?auto_18263 ?auto_18291 ) ( CLEAR ?auto_18263 ) ( not ( = ?auto_18262 ?auto_18263 ) ) ( not ( = ?auto_18262 ?auto_18291 ) ) ( not ( = ?auto_18263 ?auto_18291 ) ) ( not ( = ?auto_18267 ?auto_18279 ) ) ( IS-CRATE ?auto_18262 ) ( AVAILABLE ?auto_18269 ) ( SURFACE-AT ?auto_18262 ?auto_18268 ) ( ON ?auto_18262 ?auto_18289 ) ( CLEAR ?auto_18262 ) ( not ( = ?auto_18261 ?auto_18262 ) ) ( not ( = ?auto_18261 ?auto_18289 ) ) ( not ( = ?auto_18262 ?auto_18289 ) ) ( IS-CRATE ?auto_18261 ) ( AVAILABLE ?auto_18293 ) ( SURFACE-AT ?auto_18261 ?auto_18285 ) ( ON ?auto_18261 ?auto_18287 ) ( CLEAR ?auto_18261 ) ( not ( = ?auto_18260 ?auto_18261 ) ) ( not ( = ?auto_18260 ?auto_18287 ) ) ( not ( = ?auto_18261 ?auto_18287 ) ) ( IS-CRATE ?auto_18260 ) ( not ( = ?auto_18298 ?auto_18272 ) ) ( HOIST-AT ?auto_18280 ?auto_18298 ) ( SURFACE-AT ?auto_18260 ?auto_18298 ) ( ON ?auto_18260 ?auto_18297 ) ( CLEAR ?auto_18260 ) ( not ( = ?auto_18259 ?auto_18260 ) ) ( not ( = ?auto_18259 ?auto_18297 ) ) ( not ( = ?auto_18260 ?auto_18297 ) ) ( not ( = ?auto_18267 ?auto_18280 ) ) ( IS-CRATE ?auto_18259 ) ( not ( = ?auto_18294 ?auto_18272 ) ) ( HOIST-AT ?auto_18296 ?auto_18294 ) ( AVAILABLE ?auto_18296 ) ( SURFACE-AT ?auto_18259 ?auto_18294 ) ( ON ?auto_18259 ?auto_18292 ) ( CLEAR ?auto_18259 ) ( not ( = ?auto_18258 ?auto_18259 ) ) ( not ( = ?auto_18258 ?auto_18292 ) ) ( not ( = ?auto_18259 ?auto_18292 ) ) ( not ( = ?auto_18267 ?auto_18296 ) ) ( IS-CRATE ?auto_18258 ) ( not ( = ?auto_18275 ?auto_18272 ) ) ( HOIST-AT ?auto_18288 ?auto_18275 ) ( AVAILABLE ?auto_18288 ) ( SURFACE-AT ?auto_18258 ?auto_18275 ) ( ON ?auto_18258 ?auto_18295 ) ( CLEAR ?auto_18258 ) ( not ( = ?auto_18257 ?auto_18258 ) ) ( not ( = ?auto_18257 ?auto_18295 ) ) ( not ( = ?auto_18258 ?auto_18295 ) ) ( not ( = ?auto_18267 ?auto_18288 ) ) ( IS-CRATE ?auto_18257 ) ( AVAILABLE ?auto_18280 ) ( SURFACE-AT ?auto_18257 ?auto_18298 ) ( ON ?auto_18257 ?auto_18282 ) ( CLEAR ?auto_18257 ) ( not ( = ?auto_18256 ?auto_18257 ) ) ( not ( = ?auto_18256 ?auto_18282 ) ) ( not ( = ?auto_18257 ?auto_18282 ) ) ( IS-CRATE ?auto_18256 ) ( not ( = ?auto_18277 ?auto_18272 ) ) ( HOIST-AT ?auto_18283 ?auto_18277 ) ( AVAILABLE ?auto_18283 ) ( SURFACE-AT ?auto_18256 ?auto_18277 ) ( ON ?auto_18256 ?auto_18281 ) ( CLEAR ?auto_18256 ) ( not ( = ?auto_18255 ?auto_18256 ) ) ( not ( = ?auto_18255 ?auto_18281 ) ) ( not ( = ?auto_18256 ?auto_18281 ) ) ( not ( = ?auto_18267 ?auto_18283 ) ) ( SURFACE-AT ?auto_18254 ?auto_18272 ) ( CLEAR ?auto_18254 ) ( IS-CRATE ?auto_18255 ) ( AVAILABLE ?auto_18267 ) ( not ( = ?auto_18290 ?auto_18272 ) ) ( HOIST-AT ?auto_18273 ?auto_18290 ) ( AVAILABLE ?auto_18273 ) ( SURFACE-AT ?auto_18255 ?auto_18290 ) ( ON ?auto_18255 ?auto_18274 ) ( CLEAR ?auto_18255 ) ( TRUCK-AT ?auto_18271 ?auto_18272 ) ( not ( = ?auto_18254 ?auto_18255 ) ) ( not ( = ?auto_18254 ?auto_18274 ) ) ( not ( = ?auto_18255 ?auto_18274 ) ) ( not ( = ?auto_18267 ?auto_18273 ) ) ( not ( = ?auto_18254 ?auto_18256 ) ) ( not ( = ?auto_18254 ?auto_18281 ) ) ( not ( = ?auto_18256 ?auto_18274 ) ) ( not ( = ?auto_18277 ?auto_18290 ) ) ( not ( = ?auto_18283 ?auto_18273 ) ) ( not ( = ?auto_18281 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18257 ) ) ( not ( = ?auto_18254 ?auto_18282 ) ) ( not ( = ?auto_18255 ?auto_18257 ) ) ( not ( = ?auto_18255 ?auto_18282 ) ) ( not ( = ?auto_18257 ?auto_18281 ) ) ( not ( = ?auto_18257 ?auto_18274 ) ) ( not ( = ?auto_18298 ?auto_18277 ) ) ( not ( = ?auto_18298 ?auto_18290 ) ) ( not ( = ?auto_18280 ?auto_18283 ) ) ( not ( = ?auto_18280 ?auto_18273 ) ) ( not ( = ?auto_18282 ?auto_18281 ) ) ( not ( = ?auto_18282 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18258 ) ) ( not ( = ?auto_18254 ?auto_18295 ) ) ( not ( = ?auto_18255 ?auto_18258 ) ) ( not ( = ?auto_18255 ?auto_18295 ) ) ( not ( = ?auto_18256 ?auto_18258 ) ) ( not ( = ?auto_18256 ?auto_18295 ) ) ( not ( = ?auto_18258 ?auto_18282 ) ) ( not ( = ?auto_18258 ?auto_18281 ) ) ( not ( = ?auto_18258 ?auto_18274 ) ) ( not ( = ?auto_18275 ?auto_18298 ) ) ( not ( = ?auto_18275 ?auto_18277 ) ) ( not ( = ?auto_18275 ?auto_18290 ) ) ( not ( = ?auto_18288 ?auto_18280 ) ) ( not ( = ?auto_18288 ?auto_18283 ) ) ( not ( = ?auto_18288 ?auto_18273 ) ) ( not ( = ?auto_18295 ?auto_18282 ) ) ( not ( = ?auto_18295 ?auto_18281 ) ) ( not ( = ?auto_18295 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18259 ) ) ( not ( = ?auto_18254 ?auto_18292 ) ) ( not ( = ?auto_18255 ?auto_18259 ) ) ( not ( = ?auto_18255 ?auto_18292 ) ) ( not ( = ?auto_18256 ?auto_18259 ) ) ( not ( = ?auto_18256 ?auto_18292 ) ) ( not ( = ?auto_18257 ?auto_18259 ) ) ( not ( = ?auto_18257 ?auto_18292 ) ) ( not ( = ?auto_18259 ?auto_18295 ) ) ( not ( = ?auto_18259 ?auto_18282 ) ) ( not ( = ?auto_18259 ?auto_18281 ) ) ( not ( = ?auto_18259 ?auto_18274 ) ) ( not ( = ?auto_18294 ?auto_18275 ) ) ( not ( = ?auto_18294 ?auto_18298 ) ) ( not ( = ?auto_18294 ?auto_18277 ) ) ( not ( = ?auto_18294 ?auto_18290 ) ) ( not ( = ?auto_18296 ?auto_18288 ) ) ( not ( = ?auto_18296 ?auto_18280 ) ) ( not ( = ?auto_18296 ?auto_18283 ) ) ( not ( = ?auto_18296 ?auto_18273 ) ) ( not ( = ?auto_18292 ?auto_18295 ) ) ( not ( = ?auto_18292 ?auto_18282 ) ) ( not ( = ?auto_18292 ?auto_18281 ) ) ( not ( = ?auto_18292 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18260 ) ) ( not ( = ?auto_18254 ?auto_18297 ) ) ( not ( = ?auto_18255 ?auto_18260 ) ) ( not ( = ?auto_18255 ?auto_18297 ) ) ( not ( = ?auto_18256 ?auto_18260 ) ) ( not ( = ?auto_18256 ?auto_18297 ) ) ( not ( = ?auto_18257 ?auto_18260 ) ) ( not ( = ?auto_18257 ?auto_18297 ) ) ( not ( = ?auto_18258 ?auto_18260 ) ) ( not ( = ?auto_18258 ?auto_18297 ) ) ( not ( = ?auto_18260 ?auto_18292 ) ) ( not ( = ?auto_18260 ?auto_18295 ) ) ( not ( = ?auto_18260 ?auto_18282 ) ) ( not ( = ?auto_18260 ?auto_18281 ) ) ( not ( = ?auto_18260 ?auto_18274 ) ) ( not ( = ?auto_18297 ?auto_18292 ) ) ( not ( = ?auto_18297 ?auto_18295 ) ) ( not ( = ?auto_18297 ?auto_18282 ) ) ( not ( = ?auto_18297 ?auto_18281 ) ) ( not ( = ?auto_18297 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18261 ) ) ( not ( = ?auto_18254 ?auto_18287 ) ) ( not ( = ?auto_18255 ?auto_18261 ) ) ( not ( = ?auto_18255 ?auto_18287 ) ) ( not ( = ?auto_18256 ?auto_18261 ) ) ( not ( = ?auto_18256 ?auto_18287 ) ) ( not ( = ?auto_18257 ?auto_18261 ) ) ( not ( = ?auto_18257 ?auto_18287 ) ) ( not ( = ?auto_18258 ?auto_18261 ) ) ( not ( = ?auto_18258 ?auto_18287 ) ) ( not ( = ?auto_18259 ?auto_18261 ) ) ( not ( = ?auto_18259 ?auto_18287 ) ) ( not ( = ?auto_18261 ?auto_18297 ) ) ( not ( = ?auto_18261 ?auto_18292 ) ) ( not ( = ?auto_18261 ?auto_18295 ) ) ( not ( = ?auto_18261 ?auto_18282 ) ) ( not ( = ?auto_18261 ?auto_18281 ) ) ( not ( = ?auto_18261 ?auto_18274 ) ) ( not ( = ?auto_18285 ?auto_18298 ) ) ( not ( = ?auto_18285 ?auto_18294 ) ) ( not ( = ?auto_18285 ?auto_18275 ) ) ( not ( = ?auto_18285 ?auto_18277 ) ) ( not ( = ?auto_18285 ?auto_18290 ) ) ( not ( = ?auto_18293 ?auto_18280 ) ) ( not ( = ?auto_18293 ?auto_18296 ) ) ( not ( = ?auto_18293 ?auto_18288 ) ) ( not ( = ?auto_18293 ?auto_18283 ) ) ( not ( = ?auto_18293 ?auto_18273 ) ) ( not ( = ?auto_18287 ?auto_18297 ) ) ( not ( = ?auto_18287 ?auto_18292 ) ) ( not ( = ?auto_18287 ?auto_18295 ) ) ( not ( = ?auto_18287 ?auto_18282 ) ) ( not ( = ?auto_18287 ?auto_18281 ) ) ( not ( = ?auto_18287 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18262 ) ) ( not ( = ?auto_18254 ?auto_18289 ) ) ( not ( = ?auto_18255 ?auto_18262 ) ) ( not ( = ?auto_18255 ?auto_18289 ) ) ( not ( = ?auto_18256 ?auto_18262 ) ) ( not ( = ?auto_18256 ?auto_18289 ) ) ( not ( = ?auto_18257 ?auto_18262 ) ) ( not ( = ?auto_18257 ?auto_18289 ) ) ( not ( = ?auto_18258 ?auto_18262 ) ) ( not ( = ?auto_18258 ?auto_18289 ) ) ( not ( = ?auto_18259 ?auto_18262 ) ) ( not ( = ?auto_18259 ?auto_18289 ) ) ( not ( = ?auto_18260 ?auto_18262 ) ) ( not ( = ?auto_18260 ?auto_18289 ) ) ( not ( = ?auto_18262 ?auto_18287 ) ) ( not ( = ?auto_18262 ?auto_18297 ) ) ( not ( = ?auto_18262 ?auto_18292 ) ) ( not ( = ?auto_18262 ?auto_18295 ) ) ( not ( = ?auto_18262 ?auto_18282 ) ) ( not ( = ?auto_18262 ?auto_18281 ) ) ( not ( = ?auto_18262 ?auto_18274 ) ) ( not ( = ?auto_18268 ?auto_18285 ) ) ( not ( = ?auto_18268 ?auto_18298 ) ) ( not ( = ?auto_18268 ?auto_18294 ) ) ( not ( = ?auto_18268 ?auto_18275 ) ) ( not ( = ?auto_18268 ?auto_18277 ) ) ( not ( = ?auto_18268 ?auto_18290 ) ) ( not ( = ?auto_18269 ?auto_18293 ) ) ( not ( = ?auto_18269 ?auto_18280 ) ) ( not ( = ?auto_18269 ?auto_18296 ) ) ( not ( = ?auto_18269 ?auto_18288 ) ) ( not ( = ?auto_18269 ?auto_18283 ) ) ( not ( = ?auto_18269 ?auto_18273 ) ) ( not ( = ?auto_18289 ?auto_18287 ) ) ( not ( = ?auto_18289 ?auto_18297 ) ) ( not ( = ?auto_18289 ?auto_18292 ) ) ( not ( = ?auto_18289 ?auto_18295 ) ) ( not ( = ?auto_18289 ?auto_18282 ) ) ( not ( = ?auto_18289 ?auto_18281 ) ) ( not ( = ?auto_18289 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18263 ) ) ( not ( = ?auto_18254 ?auto_18291 ) ) ( not ( = ?auto_18255 ?auto_18263 ) ) ( not ( = ?auto_18255 ?auto_18291 ) ) ( not ( = ?auto_18256 ?auto_18263 ) ) ( not ( = ?auto_18256 ?auto_18291 ) ) ( not ( = ?auto_18257 ?auto_18263 ) ) ( not ( = ?auto_18257 ?auto_18291 ) ) ( not ( = ?auto_18258 ?auto_18263 ) ) ( not ( = ?auto_18258 ?auto_18291 ) ) ( not ( = ?auto_18259 ?auto_18263 ) ) ( not ( = ?auto_18259 ?auto_18291 ) ) ( not ( = ?auto_18260 ?auto_18263 ) ) ( not ( = ?auto_18260 ?auto_18291 ) ) ( not ( = ?auto_18261 ?auto_18263 ) ) ( not ( = ?auto_18261 ?auto_18291 ) ) ( not ( = ?auto_18263 ?auto_18289 ) ) ( not ( = ?auto_18263 ?auto_18287 ) ) ( not ( = ?auto_18263 ?auto_18297 ) ) ( not ( = ?auto_18263 ?auto_18292 ) ) ( not ( = ?auto_18263 ?auto_18295 ) ) ( not ( = ?auto_18263 ?auto_18282 ) ) ( not ( = ?auto_18263 ?auto_18281 ) ) ( not ( = ?auto_18263 ?auto_18274 ) ) ( not ( = ?auto_18284 ?auto_18268 ) ) ( not ( = ?auto_18284 ?auto_18285 ) ) ( not ( = ?auto_18284 ?auto_18298 ) ) ( not ( = ?auto_18284 ?auto_18294 ) ) ( not ( = ?auto_18284 ?auto_18275 ) ) ( not ( = ?auto_18284 ?auto_18277 ) ) ( not ( = ?auto_18284 ?auto_18290 ) ) ( not ( = ?auto_18279 ?auto_18269 ) ) ( not ( = ?auto_18279 ?auto_18293 ) ) ( not ( = ?auto_18279 ?auto_18280 ) ) ( not ( = ?auto_18279 ?auto_18296 ) ) ( not ( = ?auto_18279 ?auto_18288 ) ) ( not ( = ?auto_18279 ?auto_18283 ) ) ( not ( = ?auto_18279 ?auto_18273 ) ) ( not ( = ?auto_18291 ?auto_18289 ) ) ( not ( = ?auto_18291 ?auto_18287 ) ) ( not ( = ?auto_18291 ?auto_18297 ) ) ( not ( = ?auto_18291 ?auto_18292 ) ) ( not ( = ?auto_18291 ?auto_18295 ) ) ( not ( = ?auto_18291 ?auto_18282 ) ) ( not ( = ?auto_18291 ?auto_18281 ) ) ( not ( = ?auto_18291 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18264 ) ) ( not ( = ?auto_18254 ?auto_18278 ) ) ( not ( = ?auto_18255 ?auto_18264 ) ) ( not ( = ?auto_18255 ?auto_18278 ) ) ( not ( = ?auto_18256 ?auto_18264 ) ) ( not ( = ?auto_18256 ?auto_18278 ) ) ( not ( = ?auto_18257 ?auto_18264 ) ) ( not ( = ?auto_18257 ?auto_18278 ) ) ( not ( = ?auto_18258 ?auto_18264 ) ) ( not ( = ?auto_18258 ?auto_18278 ) ) ( not ( = ?auto_18259 ?auto_18264 ) ) ( not ( = ?auto_18259 ?auto_18278 ) ) ( not ( = ?auto_18260 ?auto_18264 ) ) ( not ( = ?auto_18260 ?auto_18278 ) ) ( not ( = ?auto_18261 ?auto_18264 ) ) ( not ( = ?auto_18261 ?auto_18278 ) ) ( not ( = ?auto_18262 ?auto_18264 ) ) ( not ( = ?auto_18262 ?auto_18278 ) ) ( not ( = ?auto_18264 ?auto_18291 ) ) ( not ( = ?auto_18264 ?auto_18289 ) ) ( not ( = ?auto_18264 ?auto_18287 ) ) ( not ( = ?auto_18264 ?auto_18297 ) ) ( not ( = ?auto_18264 ?auto_18292 ) ) ( not ( = ?auto_18264 ?auto_18295 ) ) ( not ( = ?auto_18264 ?auto_18282 ) ) ( not ( = ?auto_18264 ?auto_18281 ) ) ( not ( = ?auto_18264 ?auto_18274 ) ) ( not ( = ?auto_18278 ?auto_18291 ) ) ( not ( = ?auto_18278 ?auto_18289 ) ) ( not ( = ?auto_18278 ?auto_18287 ) ) ( not ( = ?auto_18278 ?auto_18297 ) ) ( not ( = ?auto_18278 ?auto_18292 ) ) ( not ( = ?auto_18278 ?auto_18295 ) ) ( not ( = ?auto_18278 ?auto_18282 ) ) ( not ( = ?auto_18278 ?auto_18281 ) ) ( not ( = ?auto_18278 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18265 ) ) ( not ( = ?auto_18254 ?auto_18299 ) ) ( not ( = ?auto_18255 ?auto_18265 ) ) ( not ( = ?auto_18255 ?auto_18299 ) ) ( not ( = ?auto_18256 ?auto_18265 ) ) ( not ( = ?auto_18256 ?auto_18299 ) ) ( not ( = ?auto_18257 ?auto_18265 ) ) ( not ( = ?auto_18257 ?auto_18299 ) ) ( not ( = ?auto_18258 ?auto_18265 ) ) ( not ( = ?auto_18258 ?auto_18299 ) ) ( not ( = ?auto_18259 ?auto_18265 ) ) ( not ( = ?auto_18259 ?auto_18299 ) ) ( not ( = ?auto_18260 ?auto_18265 ) ) ( not ( = ?auto_18260 ?auto_18299 ) ) ( not ( = ?auto_18261 ?auto_18265 ) ) ( not ( = ?auto_18261 ?auto_18299 ) ) ( not ( = ?auto_18262 ?auto_18265 ) ) ( not ( = ?auto_18262 ?auto_18299 ) ) ( not ( = ?auto_18263 ?auto_18265 ) ) ( not ( = ?auto_18263 ?auto_18299 ) ) ( not ( = ?auto_18265 ?auto_18278 ) ) ( not ( = ?auto_18265 ?auto_18291 ) ) ( not ( = ?auto_18265 ?auto_18289 ) ) ( not ( = ?auto_18265 ?auto_18287 ) ) ( not ( = ?auto_18265 ?auto_18297 ) ) ( not ( = ?auto_18265 ?auto_18292 ) ) ( not ( = ?auto_18265 ?auto_18295 ) ) ( not ( = ?auto_18265 ?auto_18282 ) ) ( not ( = ?auto_18265 ?auto_18281 ) ) ( not ( = ?auto_18265 ?auto_18274 ) ) ( not ( = ?auto_18276 ?auto_18285 ) ) ( not ( = ?auto_18276 ?auto_18284 ) ) ( not ( = ?auto_18276 ?auto_18268 ) ) ( not ( = ?auto_18276 ?auto_18298 ) ) ( not ( = ?auto_18276 ?auto_18294 ) ) ( not ( = ?auto_18276 ?auto_18275 ) ) ( not ( = ?auto_18276 ?auto_18277 ) ) ( not ( = ?auto_18276 ?auto_18290 ) ) ( not ( = ?auto_18286 ?auto_18293 ) ) ( not ( = ?auto_18286 ?auto_18279 ) ) ( not ( = ?auto_18286 ?auto_18269 ) ) ( not ( = ?auto_18286 ?auto_18280 ) ) ( not ( = ?auto_18286 ?auto_18296 ) ) ( not ( = ?auto_18286 ?auto_18288 ) ) ( not ( = ?auto_18286 ?auto_18283 ) ) ( not ( = ?auto_18286 ?auto_18273 ) ) ( not ( = ?auto_18299 ?auto_18278 ) ) ( not ( = ?auto_18299 ?auto_18291 ) ) ( not ( = ?auto_18299 ?auto_18289 ) ) ( not ( = ?auto_18299 ?auto_18287 ) ) ( not ( = ?auto_18299 ?auto_18297 ) ) ( not ( = ?auto_18299 ?auto_18292 ) ) ( not ( = ?auto_18299 ?auto_18295 ) ) ( not ( = ?auto_18299 ?auto_18282 ) ) ( not ( = ?auto_18299 ?auto_18281 ) ) ( not ( = ?auto_18299 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18266 ) ) ( not ( = ?auto_18254 ?auto_18270 ) ) ( not ( = ?auto_18255 ?auto_18266 ) ) ( not ( = ?auto_18255 ?auto_18270 ) ) ( not ( = ?auto_18256 ?auto_18266 ) ) ( not ( = ?auto_18256 ?auto_18270 ) ) ( not ( = ?auto_18257 ?auto_18266 ) ) ( not ( = ?auto_18257 ?auto_18270 ) ) ( not ( = ?auto_18258 ?auto_18266 ) ) ( not ( = ?auto_18258 ?auto_18270 ) ) ( not ( = ?auto_18259 ?auto_18266 ) ) ( not ( = ?auto_18259 ?auto_18270 ) ) ( not ( = ?auto_18260 ?auto_18266 ) ) ( not ( = ?auto_18260 ?auto_18270 ) ) ( not ( = ?auto_18261 ?auto_18266 ) ) ( not ( = ?auto_18261 ?auto_18270 ) ) ( not ( = ?auto_18262 ?auto_18266 ) ) ( not ( = ?auto_18262 ?auto_18270 ) ) ( not ( = ?auto_18263 ?auto_18266 ) ) ( not ( = ?auto_18263 ?auto_18270 ) ) ( not ( = ?auto_18264 ?auto_18266 ) ) ( not ( = ?auto_18264 ?auto_18270 ) ) ( not ( = ?auto_18266 ?auto_18299 ) ) ( not ( = ?auto_18266 ?auto_18278 ) ) ( not ( = ?auto_18266 ?auto_18291 ) ) ( not ( = ?auto_18266 ?auto_18289 ) ) ( not ( = ?auto_18266 ?auto_18287 ) ) ( not ( = ?auto_18266 ?auto_18297 ) ) ( not ( = ?auto_18266 ?auto_18292 ) ) ( not ( = ?auto_18266 ?auto_18295 ) ) ( not ( = ?auto_18266 ?auto_18282 ) ) ( not ( = ?auto_18266 ?auto_18281 ) ) ( not ( = ?auto_18266 ?auto_18274 ) ) ( not ( = ?auto_18270 ?auto_18299 ) ) ( not ( = ?auto_18270 ?auto_18278 ) ) ( not ( = ?auto_18270 ?auto_18291 ) ) ( not ( = ?auto_18270 ?auto_18289 ) ) ( not ( = ?auto_18270 ?auto_18287 ) ) ( not ( = ?auto_18270 ?auto_18297 ) ) ( not ( = ?auto_18270 ?auto_18292 ) ) ( not ( = ?auto_18270 ?auto_18295 ) ) ( not ( = ?auto_18270 ?auto_18282 ) ) ( not ( = ?auto_18270 ?auto_18281 ) ) ( not ( = ?auto_18270 ?auto_18274 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_18254 ?auto_18255 ?auto_18256 ?auto_18257 ?auto_18258 ?auto_18259 ?auto_18260 ?auto_18261 ?auto_18262 ?auto_18263 ?auto_18264 ?auto_18265 )
      ( MAKE-1CRATE ?auto_18265 ?auto_18266 )
      ( MAKE-12CRATE-VERIFY ?auto_18254 ?auto_18255 ?auto_18256 ?auto_18257 ?auto_18258 ?auto_18259 ?auto_18260 ?auto_18261 ?auto_18262 ?auto_18263 ?auto_18264 ?auto_18265 ?auto_18266 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_18324 - SURFACE
      ?auto_18325 - SURFACE
      ?auto_18326 - SURFACE
      ?auto_18327 - SURFACE
      ?auto_18328 - SURFACE
      ?auto_18329 - SURFACE
      ?auto_18330 - SURFACE
      ?auto_18331 - SURFACE
      ?auto_18332 - SURFACE
      ?auto_18333 - SURFACE
      ?auto_18334 - SURFACE
      ?auto_18335 - SURFACE
      ?auto_18336 - SURFACE
      ?auto_18337 - SURFACE
    )
    :vars
    (
      ?auto_18341 - HOIST
      ?auto_18339 - PLACE
      ?auto_18343 - PLACE
      ?auto_18342 - HOIST
      ?auto_18338 - SURFACE
      ?auto_18362 - PLACE
      ?auto_18356 - HOIST
      ?auto_18355 - SURFACE
      ?auto_18354 - SURFACE
      ?auto_18350 - PLACE
      ?auto_18352 - HOIST
      ?auto_18368 - SURFACE
      ?auto_18353 - PLACE
      ?auto_18347 - HOIST
      ?auto_18359 - SURFACE
      ?auto_18357 - SURFACE
      ?auto_18345 - SURFACE
      ?auto_18346 - PLACE
      ?auto_18348 - HOIST
      ?auto_18367 - SURFACE
      ?auto_18363 - PLACE
      ?auto_18366 - HOIST
      ?auto_18351 - SURFACE
      ?auto_18369 - PLACE
      ?auto_18360 - HOIST
      ?auto_18364 - SURFACE
      ?auto_18370 - SURFACE
      ?auto_18365 - PLACE
      ?auto_18371 - HOIST
      ?auto_18349 - SURFACE
      ?auto_18361 - PLACE
      ?auto_18358 - HOIST
      ?auto_18344 - SURFACE
      ?auto_18340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18341 ?auto_18339 ) ( IS-CRATE ?auto_18337 ) ( not ( = ?auto_18343 ?auto_18339 ) ) ( HOIST-AT ?auto_18342 ?auto_18343 ) ( SURFACE-AT ?auto_18337 ?auto_18343 ) ( ON ?auto_18337 ?auto_18338 ) ( CLEAR ?auto_18337 ) ( not ( = ?auto_18336 ?auto_18337 ) ) ( not ( = ?auto_18336 ?auto_18338 ) ) ( not ( = ?auto_18337 ?auto_18338 ) ) ( not ( = ?auto_18341 ?auto_18342 ) ) ( IS-CRATE ?auto_18336 ) ( not ( = ?auto_18362 ?auto_18339 ) ) ( HOIST-AT ?auto_18356 ?auto_18362 ) ( SURFACE-AT ?auto_18336 ?auto_18362 ) ( ON ?auto_18336 ?auto_18355 ) ( CLEAR ?auto_18336 ) ( not ( = ?auto_18335 ?auto_18336 ) ) ( not ( = ?auto_18335 ?auto_18355 ) ) ( not ( = ?auto_18336 ?auto_18355 ) ) ( not ( = ?auto_18341 ?auto_18356 ) ) ( IS-CRATE ?auto_18335 ) ( AVAILABLE ?auto_18342 ) ( SURFACE-AT ?auto_18335 ?auto_18343 ) ( ON ?auto_18335 ?auto_18354 ) ( CLEAR ?auto_18335 ) ( not ( = ?auto_18334 ?auto_18335 ) ) ( not ( = ?auto_18334 ?auto_18354 ) ) ( not ( = ?auto_18335 ?auto_18354 ) ) ( IS-CRATE ?auto_18334 ) ( not ( = ?auto_18350 ?auto_18339 ) ) ( HOIST-AT ?auto_18352 ?auto_18350 ) ( SURFACE-AT ?auto_18334 ?auto_18350 ) ( ON ?auto_18334 ?auto_18368 ) ( CLEAR ?auto_18334 ) ( not ( = ?auto_18333 ?auto_18334 ) ) ( not ( = ?auto_18333 ?auto_18368 ) ) ( not ( = ?auto_18334 ?auto_18368 ) ) ( not ( = ?auto_18341 ?auto_18352 ) ) ( IS-CRATE ?auto_18333 ) ( not ( = ?auto_18353 ?auto_18339 ) ) ( HOIST-AT ?auto_18347 ?auto_18353 ) ( AVAILABLE ?auto_18347 ) ( SURFACE-AT ?auto_18333 ?auto_18353 ) ( ON ?auto_18333 ?auto_18359 ) ( CLEAR ?auto_18333 ) ( not ( = ?auto_18332 ?auto_18333 ) ) ( not ( = ?auto_18332 ?auto_18359 ) ) ( not ( = ?auto_18333 ?auto_18359 ) ) ( not ( = ?auto_18341 ?auto_18347 ) ) ( IS-CRATE ?auto_18332 ) ( AVAILABLE ?auto_18356 ) ( SURFACE-AT ?auto_18332 ?auto_18362 ) ( ON ?auto_18332 ?auto_18357 ) ( CLEAR ?auto_18332 ) ( not ( = ?auto_18331 ?auto_18332 ) ) ( not ( = ?auto_18331 ?auto_18357 ) ) ( not ( = ?auto_18332 ?auto_18357 ) ) ( IS-CRATE ?auto_18331 ) ( AVAILABLE ?auto_18352 ) ( SURFACE-AT ?auto_18331 ?auto_18350 ) ( ON ?auto_18331 ?auto_18345 ) ( CLEAR ?auto_18331 ) ( not ( = ?auto_18330 ?auto_18331 ) ) ( not ( = ?auto_18330 ?auto_18345 ) ) ( not ( = ?auto_18331 ?auto_18345 ) ) ( IS-CRATE ?auto_18330 ) ( not ( = ?auto_18346 ?auto_18339 ) ) ( HOIST-AT ?auto_18348 ?auto_18346 ) ( SURFACE-AT ?auto_18330 ?auto_18346 ) ( ON ?auto_18330 ?auto_18367 ) ( CLEAR ?auto_18330 ) ( not ( = ?auto_18329 ?auto_18330 ) ) ( not ( = ?auto_18329 ?auto_18367 ) ) ( not ( = ?auto_18330 ?auto_18367 ) ) ( not ( = ?auto_18341 ?auto_18348 ) ) ( IS-CRATE ?auto_18329 ) ( not ( = ?auto_18363 ?auto_18339 ) ) ( HOIST-AT ?auto_18366 ?auto_18363 ) ( AVAILABLE ?auto_18366 ) ( SURFACE-AT ?auto_18329 ?auto_18363 ) ( ON ?auto_18329 ?auto_18351 ) ( CLEAR ?auto_18329 ) ( not ( = ?auto_18328 ?auto_18329 ) ) ( not ( = ?auto_18328 ?auto_18351 ) ) ( not ( = ?auto_18329 ?auto_18351 ) ) ( not ( = ?auto_18341 ?auto_18366 ) ) ( IS-CRATE ?auto_18328 ) ( not ( = ?auto_18369 ?auto_18339 ) ) ( HOIST-AT ?auto_18360 ?auto_18369 ) ( AVAILABLE ?auto_18360 ) ( SURFACE-AT ?auto_18328 ?auto_18369 ) ( ON ?auto_18328 ?auto_18364 ) ( CLEAR ?auto_18328 ) ( not ( = ?auto_18327 ?auto_18328 ) ) ( not ( = ?auto_18327 ?auto_18364 ) ) ( not ( = ?auto_18328 ?auto_18364 ) ) ( not ( = ?auto_18341 ?auto_18360 ) ) ( IS-CRATE ?auto_18327 ) ( AVAILABLE ?auto_18348 ) ( SURFACE-AT ?auto_18327 ?auto_18346 ) ( ON ?auto_18327 ?auto_18370 ) ( CLEAR ?auto_18327 ) ( not ( = ?auto_18326 ?auto_18327 ) ) ( not ( = ?auto_18326 ?auto_18370 ) ) ( not ( = ?auto_18327 ?auto_18370 ) ) ( IS-CRATE ?auto_18326 ) ( not ( = ?auto_18365 ?auto_18339 ) ) ( HOIST-AT ?auto_18371 ?auto_18365 ) ( AVAILABLE ?auto_18371 ) ( SURFACE-AT ?auto_18326 ?auto_18365 ) ( ON ?auto_18326 ?auto_18349 ) ( CLEAR ?auto_18326 ) ( not ( = ?auto_18325 ?auto_18326 ) ) ( not ( = ?auto_18325 ?auto_18349 ) ) ( not ( = ?auto_18326 ?auto_18349 ) ) ( not ( = ?auto_18341 ?auto_18371 ) ) ( SURFACE-AT ?auto_18324 ?auto_18339 ) ( CLEAR ?auto_18324 ) ( IS-CRATE ?auto_18325 ) ( AVAILABLE ?auto_18341 ) ( not ( = ?auto_18361 ?auto_18339 ) ) ( HOIST-AT ?auto_18358 ?auto_18361 ) ( AVAILABLE ?auto_18358 ) ( SURFACE-AT ?auto_18325 ?auto_18361 ) ( ON ?auto_18325 ?auto_18344 ) ( CLEAR ?auto_18325 ) ( TRUCK-AT ?auto_18340 ?auto_18339 ) ( not ( = ?auto_18324 ?auto_18325 ) ) ( not ( = ?auto_18324 ?auto_18344 ) ) ( not ( = ?auto_18325 ?auto_18344 ) ) ( not ( = ?auto_18341 ?auto_18358 ) ) ( not ( = ?auto_18324 ?auto_18326 ) ) ( not ( = ?auto_18324 ?auto_18349 ) ) ( not ( = ?auto_18326 ?auto_18344 ) ) ( not ( = ?auto_18365 ?auto_18361 ) ) ( not ( = ?auto_18371 ?auto_18358 ) ) ( not ( = ?auto_18349 ?auto_18344 ) ) ( not ( = ?auto_18324 ?auto_18327 ) ) ( not ( = ?auto_18324 ?auto_18370 ) ) ( not ( = ?auto_18325 ?auto_18327 ) ) ( not ( = ?auto_18325 ?auto_18370 ) ) ( not ( = ?auto_18327 ?auto_18349 ) ) ( not ( = ?auto_18327 ?auto_18344 ) ) ( not ( = ?auto_18346 ?auto_18365 ) ) ( not ( = ?auto_18346 ?auto_18361 ) ) ( not ( = ?auto_18348 ?auto_18371 ) ) ( not ( = ?auto_18348 ?auto_18358 ) ) ( not ( = ?auto_18370 ?auto_18349 ) ) ( not ( = ?auto_18370 ?auto_18344 ) ) ( not ( = ?auto_18324 ?auto_18328 ) ) ( not ( = ?auto_18324 ?auto_18364 ) ) ( not ( = ?auto_18325 ?auto_18328 ) ) ( not ( = ?auto_18325 ?auto_18364 ) ) ( not ( = ?auto_18326 ?auto_18328 ) ) ( not ( = ?auto_18326 ?auto_18364 ) ) ( not ( = ?auto_18328 ?auto_18370 ) ) ( not ( = ?auto_18328 ?auto_18349 ) ) ( not ( = ?auto_18328 ?auto_18344 ) ) ( not ( = ?auto_18369 ?auto_18346 ) ) ( not ( = ?auto_18369 ?auto_18365 ) ) ( not ( = ?auto_18369 ?auto_18361 ) ) ( not ( = ?auto_18360 ?auto_18348 ) ) ( not ( = ?auto_18360 ?auto_18371 ) ) ( not ( = ?auto_18360 ?auto_18358 ) ) ( not ( = ?auto_18364 ?auto_18370 ) ) ( not ( = ?auto_18364 ?auto_18349 ) ) ( not ( = ?auto_18364 ?auto_18344 ) ) ( not ( = ?auto_18324 ?auto_18329 ) ) ( not ( = ?auto_18324 ?auto_18351 ) ) ( not ( = ?auto_18325 ?auto_18329 ) ) ( not ( = ?auto_18325 ?auto_18351 ) ) ( not ( = ?auto_18326 ?auto_18329 ) ) ( not ( = ?auto_18326 ?auto_18351 ) ) ( not ( = ?auto_18327 ?auto_18329 ) ) ( not ( = ?auto_18327 ?auto_18351 ) ) ( not ( = ?auto_18329 ?auto_18364 ) ) ( not ( = ?auto_18329 ?auto_18370 ) ) ( not ( = ?auto_18329 ?auto_18349 ) ) ( not ( = ?auto_18329 ?auto_18344 ) ) ( not ( = ?auto_18363 ?auto_18369 ) ) ( not ( = ?auto_18363 ?auto_18346 ) ) ( not ( = ?auto_18363 ?auto_18365 ) ) ( not ( = ?auto_18363 ?auto_18361 ) ) ( not ( = ?auto_18366 ?auto_18360 ) ) ( not ( = ?auto_18366 ?auto_18348 ) ) ( not ( = ?auto_18366 ?auto_18371 ) ) ( not ( = ?auto_18366 ?auto_18358 ) ) ( not ( = ?auto_18351 ?auto_18364 ) ) ( not ( = ?auto_18351 ?auto_18370 ) ) ( not ( = ?auto_18351 ?auto_18349 ) ) ( not ( = ?auto_18351 ?auto_18344 ) ) ( not ( = ?auto_18324 ?auto_18330 ) ) ( not ( = ?auto_18324 ?auto_18367 ) ) ( not ( = ?auto_18325 ?auto_18330 ) ) ( not ( = ?auto_18325 ?auto_18367 ) ) ( not ( = ?auto_18326 ?auto_18330 ) ) ( not ( = ?auto_18326 ?auto_18367 ) ) ( not ( = ?auto_18327 ?auto_18330 ) ) ( not ( = ?auto_18327 ?auto_18367 ) ) ( not ( = ?auto_18328 ?auto_18330 ) ) ( not ( = ?auto_18328 ?auto_18367 ) ) ( not ( = ?auto_18330 ?auto_18351 ) ) ( not ( = ?auto_18330 ?auto_18364 ) ) ( not ( = ?auto_18330 ?auto_18370 ) ) ( not ( = ?auto_18330 ?auto_18349 ) ) ( not ( = ?auto_18330 ?auto_18344 ) ) ( not ( = ?auto_18367 ?auto_18351 ) ) ( not ( = ?auto_18367 ?auto_18364 ) ) ( not ( = ?auto_18367 ?auto_18370 ) ) ( not ( = ?auto_18367 ?auto_18349 ) ) ( not ( = ?auto_18367 ?auto_18344 ) ) ( not ( = ?auto_18324 ?auto_18331 ) ) ( not ( = ?auto_18324 ?auto_18345 ) ) ( not ( = ?auto_18325 ?auto_18331 ) ) ( not ( = ?auto_18325 ?auto_18345 ) ) ( not ( = ?auto_18326 ?auto_18331 ) ) ( not ( = ?auto_18326 ?auto_18345 ) ) ( not ( = ?auto_18327 ?auto_18331 ) ) ( not ( = ?auto_18327 ?auto_18345 ) ) ( not ( = ?auto_18328 ?auto_18331 ) ) ( not ( = ?auto_18328 ?auto_18345 ) ) ( not ( = ?auto_18329 ?auto_18331 ) ) ( not ( = ?auto_18329 ?auto_18345 ) ) ( not ( = ?auto_18331 ?auto_18367 ) ) ( not ( = ?auto_18331 ?auto_18351 ) ) ( not ( = ?auto_18331 ?auto_18364 ) ) ( not ( = ?auto_18331 ?auto_18370 ) ) ( not ( = ?auto_18331 ?auto_18349 ) ) ( not ( = ?auto_18331 ?auto_18344 ) ) ( not ( = ?auto_18350 ?auto_18346 ) ) ( not ( = ?auto_18350 ?auto_18363 ) ) ( not ( = ?auto_18350 ?auto_18369 ) ) ( not ( = ?auto_18350 ?auto_18365 ) ) ( not ( = ?auto_18350 ?auto_18361 ) ) ( not ( = ?auto_18352 ?auto_18348 ) ) ( not ( = ?auto_18352 ?auto_18366 ) ) ( not ( = ?auto_18352 ?auto_18360 ) ) ( not ( = ?auto_18352 ?auto_18371 ) ) ( not ( = ?auto_18352 ?auto_18358 ) ) ( not ( = ?auto_18345 ?auto_18367 ) ) ( not ( = ?auto_18345 ?auto_18351 ) ) ( not ( = ?auto_18345 ?auto_18364 ) ) ( not ( = ?auto_18345 ?auto_18370 ) ) ( not ( = ?auto_18345 ?auto_18349 ) ) ( not ( = ?auto_18345 ?auto_18344 ) ) ( not ( = ?auto_18324 ?auto_18332 ) ) ( not ( = ?auto_18324 ?auto_18357 ) ) ( not ( = ?auto_18325 ?auto_18332 ) ) ( not ( = ?auto_18325 ?auto_18357 ) ) ( not ( = ?auto_18326 ?auto_18332 ) ) ( not ( = ?auto_18326 ?auto_18357 ) ) ( not ( = ?auto_18327 ?auto_18332 ) ) ( not ( = ?auto_18327 ?auto_18357 ) ) ( not ( = ?auto_18328 ?auto_18332 ) ) ( not ( = ?auto_18328 ?auto_18357 ) ) ( not ( = ?auto_18329 ?auto_18332 ) ) ( not ( = ?auto_18329 ?auto_18357 ) ) ( not ( = ?auto_18330 ?auto_18332 ) ) ( not ( = ?auto_18330 ?auto_18357 ) ) ( not ( = ?auto_18332 ?auto_18345 ) ) ( not ( = ?auto_18332 ?auto_18367 ) ) ( not ( = ?auto_18332 ?auto_18351 ) ) ( not ( = ?auto_18332 ?auto_18364 ) ) ( not ( = ?auto_18332 ?auto_18370 ) ) ( not ( = ?auto_18332 ?auto_18349 ) ) ( not ( = ?auto_18332 ?auto_18344 ) ) ( not ( = ?auto_18362 ?auto_18350 ) ) ( not ( = ?auto_18362 ?auto_18346 ) ) ( not ( = ?auto_18362 ?auto_18363 ) ) ( not ( = ?auto_18362 ?auto_18369 ) ) ( not ( = ?auto_18362 ?auto_18365 ) ) ( not ( = ?auto_18362 ?auto_18361 ) ) ( not ( = ?auto_18356 ?auto_18352 ) ) ( not ( = ?auto_18356 ?auto_18348 ) ) ( not ( = ?auto_18356 ?auto_18366 ) ) ( not ( = ?auto_18356 ?auto_18360 ) ) ( not ( = ?auto_18356 ?auto_18371 ) ) ( not ( = ?auto_18356 ?auto_18358 ) ) ( not ( = ?auto_18357 ?auto_18345 ) ) ( not ( = ?auto_18357 ?auto_18367 ) ) ( not ( = ?auto_18357 ?auto_18351 ) ) ( not ( = ?auto_18357 ?auto_18364 ) ) ( not ( = ?auto_18357 ?auto_18370 ) ) ( not ( = ?auto_18357 ?auto_18349 ) ) ( not ( = ?auto_18357 ?auto_18344 ) ) ( not ( = ?auto_18324 ?auto_18333 ) ) ( not ( = ?auto_18324 ?auto_18359 ) ) ( not ( = ?auto_18325 ?auto_18333 ) ) ( not ( = ?auto_18325 ?auto_18359 ) ) ( not ( = ?auto_18326 ?auto_18333 ) ) ( not ( = ?auto_18326 ?auto_18359 ) ) ( not ( = ?auto_18327 ?auto_18333 ) ) ( not ( = ?auto_18327 ?auto_18359 ) ) ( not ( = ?auto_18328 ?auto_18333 ) ) ( not ( = ?auto_18328 ?auto_18359 ) ) ( not ( = ?auto_18329 ?auto_18333 ) ) ( not ( = ?auto_18329 ?auto_18359 ) ) ( not ( = ?auto_18330 ?auto_18333 ) ) ( not ( = ?auto_18330 ?auto_18359 ) ) ( not ( = ?auto_18331 ?auto_18333 ) ) ( not ( = ?auto_18331 ?auto_18359 ) ) ( not ( = ?auto_18333 ?auto_18357 ) ) ( not ( = ?auto_18333 ?auto_18345 ) ) ( not ( = ?auto_18333 ?auto_18367 ) ) ( not ( = ?auto_18333 ?auto_18351 ) ) ( not ( = ?auto_18333 ?auto_18364 ) ) ( not ( = ?auto_18333 ?auto_18370 ) ) ( not ( = ?auto_18333 ?auto_18349 ) ) ( not ( = ?auto_18333 ?auto_18344 ) ) ( not ( = ?auto_18353 ?auto_18362 ) ) ( not ( = ?auto_18353 ?auto_18350 ) ) ( not ( = ?auto_18353 ?auto_18346 ) ) ( not ( = ?auto_18353 ?auto_18363 ) ) ( not ( = ?auto_18353 ?auto_18369 ) ) ( not ( = ?auto_18353 ?auto_18365 ) ) ( not ( = ?auto_18353 ?auto_18361 ) ) ( not ( = ?auto_18347 ?auto_18356 ) ) ( not ( = ?auto_18347 ?auto_18352 ) ) ( not ( = ?auto_18347 ?auto_18348 ) ) ( not ( = ?auto_18347 ?auto_18366 ) ) ( not ( = ?auto_18347 ?auto_18360 ) ) ( not ( = ?auto_18347 ?auto_18371 ) ) ( not ( = ?auto_18347 ?auto_18358 ) ) ( not ( = ?auto_18359 ?auto_18357 ) ) ( not ( = ?auto_18359 ?auto_18345 ) ) ( not ( = ?auto_18359 ?auto_18367 ) ) ( not ( = ?auto_18359 ?auto_18351 ) ) ( not ( = ?auto_18359 ?auto_18364 ) ) ( not ( = ?auto_18359 ?auto_18370 ) ) ( not ( = ?auto_18359 ?auto_18349 ) ) ( not ( = ?auto_18359 ?auto_18344 ) ) ( not ( = ?auto_18324 ?auto_18334 ) ) ( not ( = ?auto_18324 ?auto_18368 ) ) ( not ( = ?auto_18325 ?auto_18334 ) ) ( not ( = ?auto_18325 ?auto_18368 ) ) ( not ( = ?auto_18326 ?auto_18334 ) ) ( not ( = ?auto_18326 ?auto_18368 ) ) ( not ( = ?auto_18327 ?auto_18334 ) ) ( not ( = ?auto_18327 ?auto_18368 ) ) ( not ( = ?auto_18328 ?auto_18334 ) ) ( not ( = ?auto_18328 ?auto_18368 ) ) ( not ( = ?auto_18329 ?auto_18334 ) ) ( not ( = ?auto_18329 ?auto_18368 ) ) ( not ( = ?auto_18330 ?auto_18334 ) ) ( not ( = ?auto_18330 ?auto_18368 ) ) ( not ( = ?auto_18331 ?auto_18334 ) ) ( not ( = ?auto_18331 ?auto_18368 ) ) ( not ( = ?auto_18332 ?auto_18334 ) ) ( not ( = ?auto_18332 ?auto_18368 ) ) ( not ( = ?auto_18334 ?auto_18359 ) ) ( not ( = ?auto_18334 ?auto_18357 ) ) ( not ( = ?auto_18334 ?auto_18345 ) ) ( not ( = ?auto_18334 ?auto_18367 ) ) ( not ( = ?auto_18334 ?auto_18351 ) ) ( not ( = ?auto_18334 ?auto_18364 ) ) ( not ( = ?auto_18334 ?auto_18370 ) ) ( not ( = ?auto_18334 ?auto_18349 ) ) ( not ( = ?auto_18334 ?auto_18344 ) ) ( not ( = ?auto_18368 ?auto_18359 ) ) ( not ( = ?auto_18368 ?auto_18357 ) ) ( not ( = ?auto_18368 ?auto_18345 ) ) ( not ( = ?auto_18368 ?auto_18367 ) ) ( not ( = ?auto_18368 ?auto_18351 ) ) ( not ( = ?auto_18368 ?auto_18364 ) ) ( not ( = ?auto_18368 ?auto_18370 ) ) ( not ( = ?auto_18368 ?auto_18349 ) ) ( not ( = ?auto_18368 ?auto_18344 ) ) ( not ( = ?auto_18324 ?auto_18335 ) ) ( not ( = ?auto_18324 ?auto_18354 ) ) ( not ( = ?auto_18325 ?auto_18335 ) ) ( not ( = ?auto_18325 ?auto_18354 ) ) ( not ( = ?auto_18326 ?auto_18335 ) ) ( not ( = ?auto_18326 ?auto_18354 ) ) ( not ( = ?auto_18327 ?auto_18335 ) ) ( not ( = ?auto_18327 ?auto_18354 ) ) ( not ( = ?auto_18328 ?auto_18335 ) ) ( not ( = ?auto_18328 ?auto_18354 ) ) ( not ( = ?auto_18329 ?auto_18335 ) ) ( not ( = ?auto_18329 ?auto_18354 ) ) ( not ( = ?auto_18330 ?auto_18335 ) ) ( not ( = ?auto_18330 ?auto_18354 ) ) ( not ( = ?auto_18331 ?auto_18335 ) ) ( not ( = ?auto_18331 ?auto_18354 ) ) ( not ( = ?auto_18332 ?auto_18335 ) ) ( not ( = ?auto_18332 ?auto_18354 ) ) ( not ( = ?auto_18333 ?auto_18335 ) ) ( not ( = ?auto_18333 ?auto_18354 ) ) ( not ( = ?auto_18335 ?auto_18368 ) ) ( not ( = ?auto_18335 ?auto_18359 ) ) ( not ( = ?auto_18335 ?auto_18357 ) ) ( not ( = ?auto_18335 ?auto_18345 ) ) ( not ( = ?auto_18335 ?auto_18367 ) ) ( not ( = ?auto_18335 ?auto_18351 ) ) ( not ( = ?auto_18335 ?auto_18364 ) ) ( not ( = ?auto_18335 ?auto_18370 ) ) ( not ( = ?auto_18335 ?auto_18349 ) ) ( not ( = ?auto_18335 ?auto_18344 ) ) ( not ( = ?auto_18343 ?auto_18350 ) ) ( not ( = ?auto_18343 ?auto_18353 ) ) ( not ( = ?auto_18343 ?auto_18362 ) ) ( not ( = ?auto_18343 ?auto_18346 ) ) ( not ( = ?auto_18343 ?auto_18363 ) ) ( not ( = ?auto_18343 ?auto_18369 ) ) ( not ( = ?auto_18343 ?auto_18365 ) ) ( not ( = ?auto_18343 ?auto_18361 ) ) ( not ( = ?auto_18342 ?auto_18352 ) ) ( not ( = ?auto_18342 ?auto_18347 ) ) ( not ( = ?auto_18342 ?auto_18356 ) ) ( not ( = ?auto_18342 ?auto_18348 ) ) ( not ( = ?auto_18342 ?auto_18366 ) ) ( not ( = ?auto_18342 ?auto_18360 ) ) ( not ( = ?auto_18342 ?auto_18371 ) ) ( not ( = ?auto_18342 ?auto_18358 ) ) ( not ( = ?auto_18354 ?auto_18368 ) ) ( not ( = ?auto_18354 ?auto_18359 ) ) ( not ( = ?auto_18354 ?auto_18357 ) ) ( not ( = ?auto_18354 ?auto_18345 ) ) ( not ( = ?auto_18354 ?auto_18367 ) ) ( not ( = ?auto_18354 ?auto_18351 ) ) ( not ( = ?auto_18354 ?auto_18364 ) ) ( not ( = ?auto_18354 ?auto_18370 ) ) ( not ( = ?auto_18354 ?auto_18349 ) ) ( not ( = ?auto_18354 ?auto_18344 ) ) ( not ( = ?auto_18324 ?auto_18336 ) ) ( not ( = ?auto_18324 ?auto_18355 ) ) ( not ( = ?auto_18325 ?auto_18336 ) ) ( not ( = ?auto_18325 ?auto_18355 ) ) ( not ( = ?auto_18326 ?auto_18336 ) ) ( not ( = ?auto_18326 ?auto_18355 ) ) ( not ( = ?auto_18327 ?auto_18336 ) ) ( not ( = ?auto_18327 ?auto_18355 ) ) ( not ( = ?auto_18328 ?auto_18336 ) ) ( not ( = ?auto_18328 ?auto_18355 ) ) ( not ( = ?auto_18329 ?auto_18336 ) ) ( not ( = ?auto_18329 ?auto_18355 ) ) ( not ( = ?auto_18330 ?auto_18336 ) ) ( not ( = ?auto_18330 ?auto_18355 ) ) ( not ( = ?auto_18331 ?auto_18336 ) ) ( not ( = ?auto_18331 ?auto_18355 ) ) ( not ( = ?auto_18332 ?auto_18336 ) ) ( not ( = ?auto_18332 ?auto_18355 ) ) ( not ( = ?auto_18333 ?auto_18336 ) ) ( not ( = ?auto_18333 ?auto_18355 ) ) ( not ( = ?auto_18334 ?auto_18336 ) ) ( not ( = ?auto_18334 ?auto_18355 ) ) ( not ( = ?auto_18336 ?auto_18354 ) ) ( not ( = ?auto_18336 ?auto_18368 ) ) ( not ( = ?auto_18336 ?auto_18359 ) ) ( not ( = ?auto_18336 ?auto_18357 ) ) ( not ( = ?auto_18336 ?auto_18345 ) ) ( not ( = ?auto_18336 ?auto_18367 ) ) ( not ( = ?auto_18336 ?auto_18351 ) ) ( not ( = ?auto_18336 ?auto_18364 ) ) ( not ( = ?auto_18336 ?auto_18370 ) ) ( not ( = ?auto_18336 ?auto_18349 ) ) ( not ( = ?auto_18336 ?auto_18344 ) ) ( not ( = ?auto_18355 ?auto_18354 ) ) ( not ( = ?auto_18355 ?auto_18368 ) ) ( not ( = ?auto_18355 ?auto_18359 ) ) ( not ( = ?auto_18355 ?auto_18357 ) ) ( not ( = ?auto_18355 ?auto_18345 ) ) ( not ( = ?auto_18355 ?auto_18367 ) ) ( not ( = ?auto_18355 ?auto_18351 ) ) ( not ( = ?auto_18355 ?auto_18364 ) ) ( not ( = ?auto_18355 ?auto_18370 ) ) ( not ( = ?auto_18355 ?auto_18349 ) ) ( not ( = ?auto_18355 ?auto_18344 ) ) ( not ( = ?auto_18324 ?auto_18337 ) ) ( not ( = ?auto_18324 ?auto_18338 ) ) ( not ( = ?auto_18325 ?auto_18337 ) ) ( not ( = ?auto_18325 ?auto_18338 ) ) ( not ( = ?auto_18326 ?auto_18337 ) ) ( not ( = ?auto_18326 ?auto_18338 ) ) ( not ( = ?auto_18327 ?auto_18337 ) ) ( not ( = ?auto_18327 ?auto_18338 ) ) ( not ( = ?auto_18328 ?auto_18337 ) ) ( not ( = ?auto_18328 ?auto_18338 ) ) ( not ( = ?auto_18329 ?auto_18337 ) ) ( not ( = ?auto_18329 ?auto_18338 ) ) ( not ( = ?auto_18330 ?auto_18337 ) ) ( not ( = ?auto_18330 ?auto_18338 ) ) ( not ( = ?auto_18331 ?auto_18337 ) ) ( not ( = ?auto_18331 ?auto_18338 ) ) ( not ( = ?auto_18332 ?auto_18337 ) ) ( not ( = ?auto_18332 ?auto_18338 ) ) ( not ( = ?auto_18333 ?auto_18337 ) ) ( not ( = ?auto_18333 ?auto_18338 ) ) ( not ( = ?auto_18334 ?auto_18337 ) ) ( not ( = ?auto_18334 ?auto_18338 ) ) ( not ( = ?auto_18335 ?auto_18337 ) ) ( not ( = ?auto_18335 ?auto_18338 ) ) ( not ( = ?auto_18337 ?auto_18355 ) ) ( not ( = ?auto_18337 ?auto_18354 ) ) ( not ( = ?auto_18337 ?auto_18368 ) ) ( not ( = ?auto_18337 ?auto_18359 ) ) ( not ( = ?auto_18337 ?auto_18357 ) ) ( not ( = ?auto_18337 ?auto_18345 ) ) ( not ( = ?auto_18337 ?auto_18367 ) ) ( not ( = ?auto_18337 ?auto_18351 ) ) ( not ( = ?auto_18337 ?auto_18364 ) ) ( not ( = ?auto_18337 ?auto_18370 ) ) ( not ( = ?auto_18337 ?auto_18349 ) ) ( not ( = ?auto_18337 ?auto_18344 ) ) ( not ( = ?auto_18338 ?auto_18355 ) ) ( not ( = ?auto_18338 ?auto_18354 ) ) ( not ( = ?auto_18338 ?auto_18368 ) ) ( not ( = ?auto_18338 ?auto_18359 ) ) ( not ( = ?auto_18338 ?auto_18357 ) ) ( not ( = ?auto_18338 ?auto_18345 ) ) ( not ( = ?auto_18338 ?auto_18367 ) ) ( not ( = ?auto_18338 ?auto_18351 ) ) ( not ( = ?auto_18338 ?auto_18364 ) ) ( not ( = ?auto_18338 ?auto_18370 ) ) ( not ( = ?auto_18338 ?auto_18349 ) ) ( not ( = ?auto_18338 ?auto_18344 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_18324 ?auto_18325 ?auto_18326 ?auto_18327 ?auto_18328 ?auto_18329 ?auto_18330 ?auto_18331 ?auto_18332 ?auto_18333 ?auto_18334 ?auto_18335 ?auto_18336 )
      ( MAKE-1CRATE ?auto_18336 ?auto_18337 )
      ( MAKE-13CRATE-VERIFY ?auto_18324 ?auto_18325 ?auto_18326 ?auto_18327 ?auto_18328 ?auto_18329 ?auto_18330 ?auto_18331 ?auto_18332 ?auto_18333 ?auto_18334 ?auto_18335 ?auto_18336 ?auto_18337 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_18397 - SURFACE
      ?auto_18398 - SURFACE
      ?auto_18399 - SURFACE
      ?auto_18400 - SURFACE
      ?auto_18401 - SURFACE
      ?auto_18402 - SURFACE
      ?auto_18403 - SURFACE
      ?auto_18404 - SURFACE
      ?auto_18405 - SURFACE
      ?auto_18406 - SURFACE
      ?auto_18407 - SURFACE
      ?auto_18408 - SURFACE
      ?auto_18409 - SURFACE
      ?auto_18410 - SURFACE
      ?auto_18411 - SURFACE
    )
    :vars
    (
      ?auto_18412 - HOIST
      ?auto_18414 - PLACE
      ?auto_18416 - PLACE
      ?auto_18417 - HOIST
      ?auto_18413 - SURFACE
      ?auto_18429 - SURFACE
      ?auto_18427 - PLACE
      ?auto_18435 - HOIST
      ?auto_18419 - SURFACE
      ?auto_18426 - SURFACE
      ?auto_18443 - PLACE
      ?auto_18418 - HOIST
      ?auto_18424 - SURFACE
      ?auto_18439 - PLACE
      ?auto_18433 - HOIST
      ?auto_18440 - SURFACE
      ?auto_18446 - SURFACE
      ?auto_18441 - SURFACE
      ?auto_18445 - PLACE
      ?auto_18442 - HOIST
      ?auto_18438 - SURFACE
      ?auto_18437 - PLACE
      ?auto_18423 - HOIST
      ?auto_18444 - SURFACE
      ?auto_18425 - PLACE
      ?auto_18431 - HOIST
      ?auto_18432 - SURFACE
      ?auto_18421 - SURFACE
      ?auto_18434 - PLACE
      ?auto_18420 - HOIST
      ?auto_18430 - SURFACE
      ?auto_18436 - PLACE
      ?auto_18428 - HOIST
      ?auto_18422 - SURFACE
      ?auto_18415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18412 ?auto_18414 ) ( IS-CRATE ?auto_18411 ) ( not ( = ?auto_18416 ?auto_18414 ) ) ( HOIST-AT ?auto_18417 ?auto_18416 ) ( SURFACE-AT ?auto_18411 ?auto_18416 ) ( ON ?auto_18411 ?auto_18413 ) ( CLEAR ?auto_18411 ) ( not ( = ?auto_18410 ?auto_18411 ) ) ( not ( = ?auto_18410 ?auto_18413 ) ) ( not ( = ?auto_18411 ?auto_18413 ) ) ( not ( = ?auto_18412 ?auto_18417 ) ) ( IS-CRATE ?auto_18410 ) ( SURFACE-AT ?auto_18410 ?auto_18416 ) ( ON ?auto_18410 ?auto_18429 ) ( CLEAR ?auto_18410 ) ( not ( = ?auto_18409 ?auto_18410 ) ) ( not ( = ?auto_18409 ?auto_18429 ) ) ( not ( = ?auto_18410 ?auto_18429 ) ) ( IS-CRATE ?auto_18409 ) ( not ( = ?auto_18427 ?auto_18414 ) ) ( HOIST-AT ?auto_18435 ?auto_18427 ) ( SURFACE-AT ?auto_18409 ?auto_18427 ) ( ON ?auto_18409 ?auto_18419 ) ( CLEAR ?auto_18409 ) ( not ( = ?auto_18408 ?auto_18409 ) ) ( not ( = ?auto_18408 ?auto_18419 ) ) ( not ( = ?auto_18409 ?auto_18419 ) ) ( not ( = ?auto_18412 ?auto_18435 ) ) ( IS-CRATE ?auto_18408 ) ( AVAILABLE ?auto_18417 ) ( SURFACE-AT ?auto_18408 ?auto_18416 ) ( ON ?auto_18408 ?auto_18426 ) ( CLEAR ?auto_18408 ) ( not ( = ?auto_18407 ?auto_18408 ) ) ( not ( = ?auto_18407 ?auto_18426 ) ) ( not ( = ?auto_18408 ?auto_18426 ) ) ( IS-CRATE ?auto_18407 ) ( not ( = ?auto_18443 ?auto_18414 ) ) ( HOIST-AT ?auto_18418 ?auto_18443 ) ( SURFACE-AT ?auto_18407 ?auto_18443 ) ( ON ?auto_18407 ?auto_18424 ) ( CLEAR ?auto_18407 ) ( not ( = ?auto_18406 ?auto_18407 ) ) ( not ( = ?auto_18406 ?auto_18424 ) ) ( not ( = ?auto_18407 ?auto_18424 ) ) ( not ( = ?auto_18412 ?auto_18418 ) ) ( IS-CRATE ?auto_18406 ) ( not ( = ?auto_18439 ?auto_18414 ) ) ( HOIST-AT ?auto_18433 ?auto_18439 ) ( AVAILABLE ?auto_18433 ) ( SURFACE-AT ?auto_18406 ?auto_18439 ) ( ON ?auto_18406 ?auto_18440 ) ( CLEAR ?auto_18406 ) ( not ( = ?auto_18405 ?auto_18406 ) ) ( not ( = ?auto_18405 ?auto_18440 ) ) ( not ( = ?auto_18406 ?auto_18440 ) ) ( not ( = ?auto_18412 ?auto_18433 ) ) ( IS-CRATE ?auto_18405 ) ( AVAILABLE ?auto_18435 ) ( SURFACE-AT ?auto_18405 ?auto_18427 ) ( ON ?auto_18405 ?auto_18446 ) ( CLEAR ?auto_18405 ) ( not ( = ?auto_18404 ?auto_18405 ) ) ( not ( = ?auto_18404 ?auto_18446 ) ) ( not ( = ?auto_18405 ?auto_18446 ) ) ( IS-CRATE ?auto_18404 ) ( AVAILABLE ?auto_18418 ) ( SURFACE-AT ?auto_18404 ?auto_18443 ) ( ON ?auto_18404 ?auto_18441 ) ( CLEAR ?auto_18404 ) ( not ( = ?auto_18403 ?auto_18404 ) ) ( not ( = ?auto_18403 ?auto_18441 ) ) ( not ( = ?auto_18404 ?auto_18441 ) ) ( IS-CRATE ?auto_18403 ) ( not ( = ?auto_18445 ?auto_18414 ) ) ( HOIST-AT ?auto_18442 ?auto_18445 ) ( SURFACE-AT ?auto_18403 ?auto_18445 ) ( ON ?auto_18403 ?auto_18438 ) ( CLEAR ?auto_18403 ) ( not ( = ?auto_18402 ?auto_18403 ) ) ( not ( = ?auto_18402 ?auto_18438 ) ) ( not ( = ?auto_18403 ?auto_18438 ) ) ( not ( = ?auto_18412 ?auto_18442 ) ) ( IS-CRATE ?auto_18402 ) ( not ( = ?auto_18437 ?auto_18414 ) ) ( HOIST-AT ?auto_18423 ?auto_18437 ) ( AVAILABLE ?auto_18423 ) ( SURFACE-AT ?auto_18402 ?auto_18437 ) ( ON ?auto_18402 ?auto_18444 ) ( CLEAR ?auto_18402 ) ( not ( = ?auto_18401 ?auto_18402 ) ) ( not ( = ?auto_18401 ?auto_18444 ) ) ( not ( = ?auto_18402 ?auto_18444 ) ) ( not ( = ?auto_18412 ?auto_18423 ) ) ( IS-CRATE ?auto_18401 ) ( not ( = ?auto_18425 ?auto_18414 ) ) ( HOIST-AT ?auto_18431 ?auto_18425 ) ( AVAILABLE ?auto_18431 ) ( SURFACE-AT ?auto_18401 ?auto_18425 ) ( ON ?auto_18401 ?auto_18432 ) ( CLEAR ?auto_18401 ) ( not ( = ?auto_18400 ?auto_18401 ) ) ( not ( = ?auto_18400 ?auto_18432 ) ) ( not ( = ?auto_18401 ?auto_18432 ) ) ( not ( = ?auto_18412 ?auto_18431 ) ) ( IS-CRATE ?auto_18400 ) ( AVAILABLE ?auto_18442 ) ( SURFACE-AT ?auto_18400 ?auto_18445 ) ( ON ?auto_18400 ?auto_18421 ) ( CLEAR ?auto_18400 ) ( not ( = ?auto_18399 ?auto_18400 ) ) ( not ( = ?auto_18399 ?auto_18421 ) ) ( not ( = ?auto_18400 ?auto_18421 ) ) ( IS-CRATE ?auto_18399 ) ( not ( = ?auto_18434 ?auto_18414 ) ) ( HOIST-AT ?auto_18420 ?auto_18434 ) ( AVAILABLE ?auto_18420 ) ( SURFACE-AT ?auto_18399 ?auto_18434 ) ( ON ?auto_18399 ?auto_18430 ) ( CLEAR ?auto_18399 ) ( not ( = ?auto_18398 ?auto_18399 ) ) ( not ( = ?auto_18398 ?auto_18430 ) ) ( not ( = ?auto_18399 ?auto_18430 ) ) ( not ( = ?auto_18412 ?auto_18420 ) ) ( SURFACE-AT ?auto_18397 ?auto_18414 ) ( CLEAR ?auto_18397 ) ( IS-CRATE ?auto_18398 ) ( AVAILABLE ?auto_18412 ) ( not ( = ?auto_18436 ?auto_18414 ) ) ( HOIST-AT ?auto_18428 ?auto_18436 ) ( AVAILABLE ?auto_18428 ) ( SURFACE-AT ?auto_18398 ?auto_18436 ) ( ON ?auto_18398 ?auto_18422 ) ( CLEAR ?auto_18398 ) ( TRUCK-AT ?auto_18415 ?auto_18414 ) ( not ( = ?auto_18397 ?auto_18398 ) ) ( not ( = ?auto_18397 ?auto_18422 ) ) ( not ( = ?auto_18398 ?auto_18422 ) ) ( not ( = ?auto_18412 ?auto_18428 ) ) ( not ( = ?auto_18397 ?auto_18399 ) ) ( not ( = ?auto_18397 ?auto_18430 ) ) ( not ( = ?auto_18399 ?auto_18422 ) ) ( not ( = ?auto_18434 ?auto_18436 ) ) ( not ( = ?auto_18420 ?auto_18428 ) ) ( not ( = ?auto_18430 ?auto_18422 ) ) ( not ( = ?auto_18397 ?auto_18400 ) ) ( not ( = ?auto_18397 ?auto_18421 ) ) ( not ( = ?auto_18398 ?auto_18400 ) ) ( not ( = ?auto_18398 ?auto_18421 ) ) ( not ( = ?auto_18400 ?auto_18430 ) ) ( not ( = ?auto_18400 ?auto_18422 ) ) ( not ( = ?auto_18445 ?auto_18434 ) ) ( not ( = ?auto_18445 ?auto_18436 ) ) ( not ( = ?auto_18442 ?auto_18420 ) ) ( not ( = ?auto_18442 ?auto_18428 ) ) ( not ( = ?auto_18421 ?auto_18430 ) ) ( not ( = ?auto_18421 ?auto_18422 ) ) ( not ( = ?auto_18397 ?auto_18401 ) ) ( not ( = ?auto_18397 ?auto_18432 ) ) ( not ( = ?auto_18398 ?auto_18401 ) ) ( not ( = ?auto_18398 ?auto_18432 ) ) ( not ( = ?auto_18399 ?auto_18401 ) ) ( not ( = ?auto_18399 ?auto_18432 ) ) ( not ( = ?auto_18401 ?auto_18421 ) ) ( not ( = ?auto_18401 ?auto_18430 ) ) ( not ( = ?auto_18401 ?auto_18422 ) ) ( not ( = ?auto_18425 ?auto_18445 ) ) ( not ( = ?auto_18425 ?auto_18434 ) ) ( not ( = ?auto_18425 ?auto_18436 ) ) ( not ( = ?auto_18431 ?auto_18442 ) ) ( not ( = ?auto_18431 ?auto_18420 ) ) ( not ( = ?auto_18431 ?auto_18428 ) ) ( not ( = ?auto_18432 ?auto_18421 ) ) ( not ( = ?auto_18432 ?auto_18430 ) ) ( not ( = ?auto_18432 ?auto_18422 ) ) ( not ( = ?auto_18397 ?auto_18402 ) ) ( not ( = ?auto_18397 ?auto_18444 ) ) ( not ( = ?auto_18398 ?auto_18402 ) ) ( not ( = ?auto_18398 ?auto_18444 ) ) ( not ( = ?auto_18399 ?auto_18402 ) ) ( not ( = ?auto_18399 ?auto_18444 ) ) ( not ( = ?auto_18400 ?auto_18402 ) ) ( not ( = ?auto_18400 ?auto_18444 ) ) ( not ( = ?auto_18402 ?auto_18432 ) ) ( not ( = ?auto_18402 ?auto_18421 ) ) ( not ( = ?auto_18402 ?auto_18430 ) ) ( not ( = ?auto_18402 ?auto_18422 ) ) ( not ( = ?auto_18437 ?auto_18425 ) ) ( not ( = ?auto_18437 ?auto_18445 ) ) ( not ( = ?auto_18437 ?auto_18434 ) ) ( not ( = ?auto_18437 ?auto_18436 ) ) ( not ( = ?auto_18423 ?auto_18431 ) ) ( not ( = ?auto_18423 ?auto_18442 ) ) ( not ( = ?auto_18423 ?auto_18420 ) ) ( not ( = ?auto_18423 ?auto_18428 ) ) ( not ( = ?auto_18444 ?auto_18432 ) ) ( not ( = ?auto_18444 ?auto_18421 ) ) ( not ( = ?auto_18444 ?auto_18430 ) ) ( not ( = ?auto_18444 ?auto_18422 ) ) ( not ( = ?auto_18397 ?auto_18403 ) ) ( not ( = ?auto_18397 ?auto_18438 ) ) ( not ( = ?auto_18398 ?auto_18403 ) ) ( not ( = ?auto_18398 ?auto_18438 ) ) ( not ( = ?auto_18399 ?auto_18403 ) ) ( not ( = ?auto_18399 ?auto_18438 ) ) ( not ( = ?auto_18400 ?auto_18403 ) ) ( not ( = ?auto_18400 ?auto_18438 ) ) ( not ( = ?auto_18401 ?auto_18403 ) ) ( not ( = ?auto_18401 ?auto_18438 ) ) ( not ( = ?auto_18403 ?auto_18444 ) ) ( not ( = ?auto_18403 ?auto_18432 ) ) ( not ( = ?auto_18403 ?auto_18421 ) ) ( not ( = ?auto_18403 ?auto_18430 ) ) ( not ( = ?auto_18403 ?auto_18422 ) ) ( not ( = ?auto_18438 ?auto_18444 ) ) ( not ( = ?auto_18438 ?auto_18432 ) ) ( not ( = ?auto_18438 ?auto_18421 ) ) ( not ( = ?auto_18438 ?auto_18430 ) ) ( not ( = ?auto_18438 ?auto_18422 ) ) ( not ( = ?auto_18397 ?auto_18404 ) ) ( not ( = ?auto_18397 ?auto_18441 ) ) ( not ( = ?auto_18398 ?auto_18404 ) ) ( not ( = ?auto_18398 ?auto_18441 ) ) ( not ( = ?auto_18399 ?auto_18404 ) ) ( not ( = ?auto_18399 ?auto_18441 ) ) ( not ( = ?auto_18400 ?auto_18404 ) ) ( not ( = ?auto_18400 ?auto_18441 ) ) ( not ( = ?auto_18401 ?auto_18404 ) ) ( not ( = ?auto_18401 ?auto_18441 ) ) ( not ( = ?auto_18402 ?auto_18404 ) ) ( not ( = ?auto_18402 ?auto_18441 ) ) ( not ( = ?auto_18404 ?auto_18438 ) ) ( not ( = ?auto_18404 ?auto_18444 ) ) ( not ( = ?auto_18404 ?auto_18432 ) ) ( not ( = ?auto_18404 ?auto_18421 ) ) ( not ( = ?auto_18404 ?auto_18430 ) ) ( not ( = ?auto_18404 ?auto_18422 ) ) ( not ( = ?auto_18443 ?auto_18445 ) ) ( not ( = ?auto_18443 ?auto_18437 ) ) ( not ( = ?auto_18443 ?auto_18425 ) ) ( not ( = ?auto_18443 ?auto_18434 ) ) ( not ( = ?auto_18443 ?auto_18436 ) ) ( not ( = ?auto_18418 ?auto_18442 ) ) ( not ( = ?auto_18418 ?auto_18423 ) ) ( not ( = ?auto_18418 ?auto_18431 ) ) ( not ( = ?auto_18418 ?auto_18420 ) ) ( not ( = ?auto_18418 ?auto_18428 ) ) ( not ( = ?auto_18441 ?auto_18438 ) ) ( not ( = ?auto_18441 ?auto_18444 ) ) ( not ( = ?auto_18441 ?auto_18432 ) ) ( not ( = ?auto_18441 ?auto_18421 ) ) ( not ( = ?auto_18441 ?auto_18430 ) ) ( not ( = ?auto_18441 ?auto_18422 ) ) ( not ( = ?auto_18397 ?auto_18405 ) ) ( not ( = ?auto_18397 ?auto_18446 ) ) ( not ( = ?auto_18398 ?auto_18405 ) ) ( not ( = ?auto_18398 ?auto_18446 ) ) ( not ( = ?auto_18399 ?auto_18405 ) ) ( not ( = ?auto_18399 ?auto_18446 ) ) ( not ( = ?auto_18400 ?auto_18405 ) ) ( not ( = ?auto_18400 ?auto_18446 ) ) ( not ( = ?auto_18401 ?auto_18405 ) ) ( not ( = ?auto_18401 ?auto_18446 ) ) ( not ( = ?auto_18402 ?auto_18405 ) ) ( not ( = ?auto_18402 ?auto_18446 ) ) ( not ( = ?auto_18403 ?auto_18405 ) ) ( not ( = ?auto_18403 ?auto_18446 ) ) ( not ( = ?auto_18405 ?auto_18441 ) ) ( not ( = ?auto_18405 ?auto_18438 ) ) ( not ( = ?auto_18405 ?auto_18444 ) ) ( not ( = ?auto_18405 ?auto_18432 ) ) ( not ( = ?auto_18405 ?auto_18421 ) ) ( not ( = ?auto_18405 ?auto_18430 ) ) ( not ( = ?auto_18405 ?auto_18422 ) ) ( not ( = ?auto_18427 ?auto_18443 ) ) ( not ( = ?auto_18427 ?auto_18445 ) ) ( not ( = ?auto_18427 ?auto_18437 ) ) ( not ( = ?auto_18427 ?auto_18425 ) ) ( not ( = ?auto_18427 ?auto_18434 ) ) ( not ( = ?auto_18427 ?auto_18436 ) ) ( not ( = ?auto_18435 ?auto_18418 ) ) ( not ( = ?auto_18435 ?auto_18442 ) ) ( not ( = ?auto_18435 ?auto_18423 ) ) ( not ( = ?auto_18435 ?auto_18431 ) ) ( not ( = ?auto_18435 ?auto_18420 ) ) ( not ( = ?auto_18435 ?auto_18428 ) ) ( not ( = ?auto_18446 ?auto_18441 ) ) ( not ( = ?auto_18446 ?auto_18438 ) ) ( not ( = ?auto_18446 ?auto_18444 ) ) ( not ( = ?auto_18446 ?auto_18432 ) ) ( not ( = ?auto_18446 ?auto_18421 ) ) ( not ( = ?auto_18446 ?auto_18430 ) ) ( not ( = ?auto_18446 ?auto_18422 ) ) ( not ( = ?auto_18397 ?auto_18406 ) ) ( not ( = ?auto_18397 ?auto_18440 ) ) ( not ( = ?auto_18398 ?auto_18406 ) ) ( not ( = ?auto_18398 ?auto_18440 ) ) ( not ( = ?auto_18399 ?auto_18406 ) ) ( not ( = ?auto_18399 ?auto_18440 ) ) ( not ( = ?auto_18400 ?auto_18406 ) ) ( not ( = ?auto_18400 ?auto_18440 ) ) ( not ( = ?auto_18401 ?auto_18406 ) ) ( not ( = ?auto_18401 ?auto_18440 ) ) ( not ( = ?auto_18402 ?auto_18406 ) ) ( not ( = ?auto_18402 ?auto_18440 ) ) ( not ( = ?auto_18403 ?auto_18406 ) ) ( not ( = ?auto_18403 ?auto_18440 ) ) ( not ( = ?auto_18404 ?auto_18406 ) ) ( not ( = ?auto_18404 ?auto_18440 ) ) ( not ( = ?auto_18406 ?auto_18446 ) ) ( not ( = ?auto_18406 ?auto_18441 ) ) ( not ( = ?auto_18406 ?auto_18438 ) ) ( not ( = ?auto_18406 ?auto_18444 ) ) ( not ( = ?auto_18406 ?auto_18432 ) ) ( not ( = ?auto_18406 ?auto_18421 ) ) ( not ( = ?auto_18406 ?auto_18430 ) ) ( not ( = ?auto_18406 ?auto_18422 ) ) ( not ( = ?auto_18439 ?auto_18427 ) ) ( not ( = ?auto_18439 ?auto_18443 ) ) ( not ( = ?auto_18439 ?auto_18445 ) ) ( not ( = ?auto_18439 ?auto_18437 ) ) ( not ( = ?auto_18439 ?auto_18425 ) ) ( not ( = ?auto_18439 ?auto_18434 ) ) ( not ( = ?auto_18439 ?auto_18436 ) ) ( not ( = ?auto_18433 ?auto_18435 ) ) ( not ( = ?auto_18433 ?auto_18418 ) ) ( not ( = ?auto_18433 ?auto_18442 ) ) ( not ( = ?auto_18433 ?auto_18423 ) ) ( not ( = ?auto_18433 ?auto_18431 ) ) ( not ( = ?auto_18433 ?auto_18420 ) ) ( not ( = ?auto_18433 ?auto_18428 ) ) ( not ( = ?auto_18440 ?auto_18446 ) ) ( not ( = ?auto_18440 ?auto_18441 ) ) ( not ( = ?auto_18440 ?auto_18438 ) ) ( not ( = ?auto_18440 ?auto_18444 ) ) ( not ( = ?auto_18440 ?auto_18432 ) ) ( not ( = ?auto_18440 ?auto_18421 ) ) ( not ( = ?auto_18440 ?auto_18430 ) ) ( not ( = ?auto_18440 ?auto_18422 ) ) ( not ( = ?auto_18397 ?auto_18407 ) ) ( not ( = ?auto_18397 ?auto_18424 ) ) ( not ( = ?auto_18398 ?auto_18407 ) ) ( not ( = ?auto_18398 ?auto_18424 ) ) ( not ( = ?auto_18399 ?auto_18407 ) ) ( not ( = ?auto_18399 ?auto_18424 ) ) ( not ( = ?auto_18400 ?auto_18407 ) ) ( not ( = ?auto_18400 ?auto_18424 ) ) ( not ( = ?auto_18401 ?auto_18407 ) ) ( not ( = ?auto_18401 ?auto_18424 ) ) ( not ( = ?auto_18402 ?auto_18407 ) ) ( not ( = ?auto_18402 ?auto_18424 ) ) ( not ( = ?auto_18403 ?auto_18407 ) ) ( not ( = ?auto_18403 ?auto_18424 ) ) ( not ( = ?auto_18404 ?auto_18407 ) ) ( not ( = ?auto_18404 ?auto_18424 ) ) ( not ( = ?auto_18405 ?auto_18407 ) ) ( not ( = ?auto_18405 ?auto_18424 ) ) ( not ( = ?auto_18407 ?auto_18440 ) ) ( not ( = ?auto_18407 ?auto_18446 ) ) ( not ( = ?auto_18407 ?auto_18441 ) ) ( not ( = ?auto_18407 ?auto_18438 ) ) ( not ( = ?auto_18407 ?auto_18444 ) ) ( not ( = ?auto_18407 ?auto_18432 ) ) ( not ( = ?auto_18407 ?auto_18421 ) ) ( not ( = ?auto_18407 ?auto_18430 ) ) ( not ( = ?auto_18407 ?auto_18422 ) ) ( not ( = ?auto_18424 ?auto_18440 ) ) ( not ( = ?auto_18424 ?auto_18446 ) ) ( not ( = ?auto_18424 ?auto_18441 ) ) ( not ( = ?auto_18424 ?auto_18438 ) ) ( not ( = ?auto_18424 ?auto_18444 ) ) ( not ( = ?auto_18424 ?auto_18432 ) ) ( not ( = ?auto_18424 ?auto_18421 ) ) ( not ( = ?auto_18424 ?auto_18430 ) ) ( not ( = ?auto_18424 ?auto_18422 ) ) ( not ( = ?auto_18397 ?auto_18408 ) ) ( not ( = ?auto_18397 ?auto_18426 ) ) ( not ( = ?auto_18398 ?auto_18408 ) ) ( not ( = ?auto_18398 ?auto_18426 ) ) ( not ( = ?auto_18399 ?auto_18408 ) ) ( not ( = ?auto_18399 ?auto_18426 ) ) ( not ( = ?auto_18400 ?auto_18408 ) ) ( not ( = ?auto_18400 ?auto_18426 ) ) ( not ( = ?auto_18401 ?auto_18408 ) ) ( not ( = ?auto_18401 ?auto_18426 ) ) ( not ( = ?auto_18402 ?auto_18408 ) ) ( not ( = ?auto_18402 ?auto_18426 ) ) ( not ( = ?auto_18403 ?auto_18408 ) ) ( not ( = ?auto_18403 ?auto_18426 ) ) ( not ( = ?auto_18404 ?auto_18408 ) ) ( not ( = ?auto_18404 ?auto_18426 ) ) ( not ( = ?auto_18405 ?auto_18408 ) ) ( not ( = ?auto_18405 ?auto_18426 ) ) ( not ( = ?auto_18406 ?auto_18408 ) ) ( not ( = ?auto_18406 ?auto_18426 ) ) ( not ( = ?auto_18408 ?auto_18424 ) ) ( not ( = ?auto_18408 ?auto_18440 ) ) ( not ( = ?auto_18408 ?auto_18446 ) ) ( not ( = ?auto_18408 ?auto_18441 ) ) ( not ( = ?auto_18408 ?auto_18438 ) ) ( not ( = ?auto_18408 ?auto_18444 ) ) ( not ( = ?auto_18408 ?auto_18432 ) ) ( not ( = ?auto_18408 ?auto_18421 ) ) ( not ( = ?auto_18408 ?auto_18430 ) ) ( not ( = ?auto_18408 ?auto_18422 ) ) ( not ( = ?auto_18416 ?auto_18443 ) ) ( not ( = ?auto_18416 ?auto_18439 ) ) ( not ( = ?auto_18416 ?auto_18427 ) ) ( not ( = ?auto_18416 ?auto_18445 ) ) ( not ( = ?auto_18416 ?auto_18437 ) ) ( not ( = ?auto_18416 ?auto_18425 ) ) ( not ( = ?auto_18416 ?auto_18434 ) ) ( not ( = ?auto_18416 ?auto_18436 ) ) ( not ( = ?auto_18417 ?auto_18418 ) ) ( not ( = ?auto_18417 ?auto_18433 ) ) ( not ( = ?auto_18417 ?auto_18435 ) ) ( not ( = ?auto_18417 ?auto_18442 ) ) ( not ( = ?auto_18417 ?auto_18423 ) ) ( not ( = ?auto_18417 ?auto_18431 ) ) ( not ( = ?auto_18417 ?auto_18420 ) ) ( not ( = ?auto_18417 ?auto_18428 ) ) ( not ( = ?auto_18426 ?auto_18424 ) ) ( not ( = ?auto_18426 ?auto_18440 ) ) ( not ( = ?auto_18426 ?auto_18446 ) ) ( not ( = ?auto_18426 ?auto_18441 ) ) ( not ( = ?auto_18426 ?auto_18438 ) ) ( not ( = ?auto_18426 ?auto_18444 ) ) ( not ( = ?auto_18426 ?auto_18432 ) ) ( not ( = ?auto_18426 ?auto_18421 ) ) ( not ( = ?auto_18426 ?auto_18430 ) ) ( not ( = ?auto_18426 ?auto_18422 ) ) ( not ( = ?auto_18397 ?auto_18409 ) ) ( not ( = ?auto_18397 ?auto_18419 ) ) ( not ( = ?auto_18398 ?auto_18409 ) ) ( not ( = ?auto_18398 ?auto_18419 ) ) ( not ( = ?auto_18399 ?auto_18409 ) ) ( not ( = ?auto_18399 ?auto_18419 ) ) ( not ( = ?auto_18400 ?auto_18409 ) ) ( not ( = ?auto_18400 ?auto_18419 ) ) ( not ( = ?auto_18401 ?auto_18409 ) ) ( not ( = ?auto_18401 ?auto_18419 ) ) ( not ( = ?auto_18402 ?auto_18409 ) ) ( not ( = ?auto_18402 ?auto_18419 ) ) ( not ( = ?auto_18403 ?auto_18409 ) ) ( not ( = ?auto_18403 ?auto_18419 ) ) ( not ( = ?auto_18404 ?auto_18409 ) ) ( not ( = ?auto_18404 ?auto_18419 ) ) ( not ( = ?auto_18405 ?auto_18409 ) ) ( not ( = ?auto_18405 ?auto_18419 ) ) ( not ( = ?auto_18406 ?auto_18409 ) ) ( not ( = ?auto_18406 ?auto_18419 ) ) ( not ( = ?auto_18407 ?auto_18409 ) ) ( not ( = ?auto_18407 ?auto_18419 ) ) ( not ( = ?auto_18409 ?auto_18426 ) ) ( not ( = ?auto_18409 ?auto_18424 ) ) ( not ( = ?auto_18409 ?auto_18440 ) ) ( not ( = ?auto_18409 ?auto_18446 ) ) ( not ( = ?auto_18409 ?auto_18441 ) ) ( not ( = ?auto_18409 ?auto_18438 ) ) ( not ( = ?auto_18409 ?auto_18444 ) ) ( not ( = ?auto_18409 ?auto_18432 ) ) ( not ( = ?auto_18409 ?auto_18421 ) ) ( not ( = ?auto_18409 ?auto_18430 ) ) ( not ( = ?auto_18409 ?auto_18422 ) ) ( not ( = ?auto_18419 ?auto_18426 ) ) ( not ( = ?auto_18419 ?auto_18424 ) ) ( not ( = ?auto_18419 ?auto_18440 ) ) ( not ( = ?auto_18419 ?auto_18446 ) ) ( not ( = ?auto_18419 ?auto_18441 ) ) ( not ( = ?auto_18419 ?auto_18438 ) ) ( not ( = ?auto_18419 ?auto_18444 ) ) ( not ( = ?auto_18419 ?auto_18432 ) ) ( not ( = ?auto_18419 ?auto_18421 ) ) ( not ( = ?auto_18419 ?auto_18430 ) ) ( not ( = ?auto_18419 ?auto_18422 ) ) ( not ( = ?auto_18397 ?auto_18410 ) ) ( not ( = ?auto_18397 ?auto_18429 ) ) ( not ( = ?auto_18398 ?auto_18410 ) ) ( not ( = ?auto_18398 ?auto_18429 ) ) ( not ( = ?auto_18399 ?auto_18410 ) ) ( not ( = ?auto_18399 ?auto_18429 ) ) ( not ( = ?auto_18400 ?auto_18410 ) ) ( not ( = ?auto_18400 ?auto_18429 ) ) ( not ( = ?auto_18401 ?auto_18410 ) ) ( not ( = ?auto_18401 ?auto_18429 ) ) ( not ( = ?auto_18402 ?auto_18410 ) ) ( not ( = ?auto_18402 ?auto_18429 ) ) ( not ( = ?auto_18403 ?auto_18410 ) ) ( not ( = ?auto_18403 ?auto_18429 ) ) ( not ( = ?auto_18404 ?auto_18410 ) ) ( not ( = ?auto_18404 ?auto_18429 ) ) ( not ( = ?auto_18405 ?auto_18410 ) ) ( not ( = ?auto_18405 ?auto_18429 ) ) ( not ( = ?auto_18406 ?auto_18410 ) ) ( not ( = ?auto_18406 ?auto_18429 ) ) ( not ( = ?auto_18407 ?auto_18410 ) ) ( not ( = ?auto_18407 ?auto_18429 ) ) ( not ( = ?auto_18408 ?auto_18410 ) ) ( not ( = ?auto_18408 ?auto_18429 ) ) ( not ( = ?auto_18410 ?auto_18419 ) ) ( not ( = ?auto_18410 ?auto_18426 ) ) ( not ( = ?auto_18410 ?auto_18424 ) ) ( not ( = ?auto_18410 ?auto_18440 ) ) ( not ( = ?auto_18410 ?auto_18446 ) ) ( not ( = ?auto_18410 ?auto_18441 ) ) ( not ( = ?auto_18410 ?auto_18438 ) ) ( not ( = ?auto_18410 ?auto_18444 ) ) ( not ( = ?auto_18410 ?auto_18432 ) ) ( not ( = ?auto_18410 ?auto_18421 ) ) ( not ( = ?auto_18410 ?auto_18430 ) ) ( not ( = ?auto_18410 ?auto_18422 ) ) ( not ( = ?auto_18429 ?auto_18419 ) ) ( not ( = ?auto_18429 ?auto_18426 ) ) ( not ( = ?auto_18429 ?auto_18424 ) ) ( not ( = ?auto_18429 ?auto_18440 ) ) ( not ( = ?auto_18429 ?auto_18446 ) ) ( not ( = ?auto_18429 ?auto_18441 ) ) ( not ( = ?auto_18429 ?auto_18438 ) ) ( not ( = ?auto_18429 ?auto_18444 ) ) ( not ( = ?auto_18429 ?auto_18432 ) ) ( not ( = ?auto_18429 ?auto_18421 ) ) ( not ( = ?auto_18429 ?auto_18430 ) ) ( not ( = ?auto_18429 ?auto_18422 ) ) ( not ( = ?auto_18397 ?auto_18411 ) ) ( not ( = ?auto_18397 ?auto_18413 ) ) ( not ( = ?auto_18398 ?auto_18411 ) ) ( not ( = ?auto_18398 ?auto_18413 ) ) ( not ( = ?auto_18399 ?auto_18411 ) ) ( not ( = ?auto_18399 ?auto_18413 ) ) ( not ( = ?auto_18400 ?auto_18411 ) ) ( not ( = ?auto_18400 ?auto_18413 ) ) ( not ( = ?auto_18401 ?auto_18411 ) ) ( not ( = ?auto_18401 ?auto_18413 ) ) ( not ( = ?auto_18402 ?auto_18411 ) ) ( not ( = ?auto_18402 ?auto_18413 ) ) ( not ( = ?auto_18403 ?auto_18411 ) ) ( not ( = ?auto_18403 ?auto_18413 ) ) ( not ( = ?auto_18404 ?auto_18411 ) ) ( not ( = ?auto_18404 ?auto_18413 ) ) ( not ( = ?auto_18405 ?auto_18411 ) ) ( not ( = ?auto_18405 ?auto_18413 ) ) ( not ( = ?auto_18406 ?auto_18411 ) ) ( not ( = ?auto_18406 ?auto_18413 ) ) ( not ( = ?auto_18407 ?auto_18411 ) ) ( not ( = ?auto_18407 ?auto_18413 ) ) ( not ( = ?auto_18408 ?auto_18411 ) ) ( not ( = ?auto_18408 ?auto_18413 ) ) ( not ( = ?auto_18409 ?auto_18411 ) ) ( not ( = ?auto_18409 ?auto_18413 ) ) ( not ( = ?auto_18411 ?auto_18429 ) ) ( not ( = ?auto_18411 ?auto_18419 ) ) ( not ( = ?auto_18411 ?auto_18426 ) ) ( not ( = ?auto_18411 ?auto_18424 ) ) ( not ( = ?auto_18411 ?auto_18440 ) ) ( not ( = ?auto_18411 ?auto_18446 ) ) ( not ( = ?auto_18411 ?auto_18441 ) ) ( not ( = ?auto_18411 ?auto_18438 ) ) ( not ( = ?auto_18411 ?auto_18444 ) ) ( not ( = ?auto_18411 ?auto_18432 ) ) ( not ( = ?auto_18411 ?auto_18421 ) ) ( not ( = ?auto_18411 ?auto_18430 ) ) ( not ( = ?auto_18411 ?auto_18422 ) ) ( not ( = ?auto_18413 ?auto_18429 ) ) ( not ( = ?auto_18413 ?auto_18419 ) ) ( not ( = ?auto_18413 ?auto_18426 ) ) ( not ( = ?auto_18413 ?auto_18424 ) ) ( not ( = ?auto_18413 ?auto_18440 ) ) ( not ( = ?auto_18413 ?auto_18446 ) ) ( not ( = ?auto_18413 ?auto_18441 ) ) ( not ( = ?auto_18413 ?auto_18438 ) ) ( not ( = ?auto_18413 ?auto_18444 ) ) ( not ( = ?auto_18413 ?auto_18432 ) ) ( not ( = ?auto_18413 ?auto_18421 ) ) ( not ( = ?auto_18413 ?auto_18430 ) ) ( not ( = ?auto_18413 ?auto_18422 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_18397 ?auto_18398 ?auto_18399 ?auto_18400 ?auto_18401 ?auto_18402 ?auto_18403 ?auto_18404 ?auto_18405 ?auto_18406 ?auto_18407 ?auto_18408 ?auto_18409 ?auto_18410 )
      ( MAKE-1CRATE ?auto_18410 ?auto_18411 )
      ( MAKE-14CRATE-VERIFY ?auto_18397 ?auto_18398 ?auto_18399 ?auto_18400 ?auto_18401 ?auto_18402 ?auto_18403 ?auto_18404 ?auto_18405 ?auto_18406 ?auto_18407 ?auto_18408 ?auto_18409 ?auto_18410 ?auto_18411 ) )
  )

)

