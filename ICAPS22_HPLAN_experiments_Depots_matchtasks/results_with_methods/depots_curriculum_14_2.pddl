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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17774 - SURFACE
      ?auto_17775 - SURFACE
    )
    :vars
    (
      ?auto_17776 - HOIST
      ?auto_17777 - PLACE
      ?auto_17779 - PLACE
      ?auto_17780 - HOIST
      ?auto_17781 - SURFACE
      ?auto_17778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17776 ?auto_17777 ) ( SURFACE-AT ?auto_17774 ?auto_17777 ) ( CLEAR ?auto_17774 ) ( IS-CRATE ?auto_17775 ) ( AVAILABLE ?auto_17776 ) ( not ( = ?auto_17779 ?auto_17777 ) ) ( HOIST-AT ?auto_17780 ?auto_17779 ) ( AVAILABLE ?auto_17780 ) ( SURFACE-AT ?auto_17775 ?auto_17779 ) ( ON ?auto_17775 ?auto_17781 ) ( CLEAR ?auto_17775 ) ( TRUCK-AT ?auto_17778 ?auto_17777 ) ( not ( = ?auto_17774 ?auto_17775 ) ) ( not ( = ?auto_17774 ?auto_17781 ) ) ( not ( = ?auto_17775 ?auto_17781 ) ) ( not ( = ?auto_17776 ?auto_17780 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17778 ?auto_17777 ?auto_17779 )
      ( !LIFT ?auto_17780 ?auto_17775 ?auto_17781 ?auto_17779 )
      ( !LOAD ?auto_17780 ?auto_17775 ?auto_17778 ?auto_17779 )
      ( !DRIVE ?auto_17778 ?auto_17779 ?auto_17777 )
      ( !UNLOAD ?auto_17776 ?auto_17775 ?auto_17778 ?auto_17777 )
      ( !DROP ?auto_17776 ?auto_17775 ?auto_17774 ?auto_17777 )
      ( MAKE-1CRATE-VERIFY ?auto_17774 ?auto_17775 ) )
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
      ?auto_17789 - HOIST
      ?auto_17790 - PLACE
      ?auto_17791 - PLACE
      ?auto_17792 - HOIST
      ?auto_17788 - SURFACE
      ?auto_17794 - PLACE
      ?auto_17795 - HOIST
      ?auto_17796 - SURFACE
      ?auto_17793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17789 ?auto_17790 ) ( IS-CRATE ?auto_17787 ) ( not ( = ?auto_17791 ?auto_17790 ) ) ( HOIST-AT ?auto_17792 ?auto_17791 ) ( AVAILABLE ?auto_17792 ) ( SURFACE-AT ?auto_17787 ?auto_17791 ) ( ON ?auto_17787 ?auto_17788 ) ( CLEAR ?auto_17787 ) ( not ( = ?auto_17786 ?auto_17787 ) ) ( not ( = ?auto_17786 ?auto_17788 ) ) ( not ( = ?auto_17787 ?auto_17788 ) ) ( not ( = ?auto_17789 ?auto_17792 ) ) ( SURFACE-AT ?auto_17785 ?auto_17790 ) ( CLEAR ?auto_17785 ) ( IS-CRATE ?auto_17786 ) ( AVAILABLE ?auto_17789 ) ( not ( = ?auto_17794 ?auto_17790 ) ) ( HOIST-AT ?auto_17795 ?auto_17794 ) ( AVAILABLE ?auto_17795 ) ( SURFACE-AT ?auto_17786 ?auto_17794 ) ( ON ?auto_17786 ?auto_17796 ) ( CLEAR ?auto_17786 ) ( TRUCK-AT ?auto_17793 ?auto_17790 ) ( not ( = ?auto_17785 ?auto_17786 ) ) ( not ( = ?auto_17785 ?auto_17796 ) ) ( not ( = ?auto_17786 ?auto_17796 ) ) ( not ( = ?auto_17789 ?auto_17795 ) ) ( not ( = ?auto_17785 ?auto_17787 ) ) ( not ( = ?auto_17785 ?auto_17788 ) ) ( not ( = ?auto_17787 ?auto_17796 ) ) ( not ( = ?auto_17791 ?auto_17794 ) ) ( not ( = ?auto_17792 ?auto_17795 ) ) ( not ( = ?auto_17788 ?auto_17796 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17785 ?auto_17786 )
      ( MAKE-1CRATE ?auto_17786 ?auto_17787 )
      ( MAKE-2CRATE-VERIFY ?auto_17785 ?auto_17786 ?auto_17787 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17799 - SURFACE
      ?auto_17800 - SURFACE
    )
    :vars
    (
      ?auto_17801 - HOIST
      ?auto_17802 - PLACE
      ?auto_17804 - PLACE
      ?auto_17805 - HOIST
      ?auto_17806 - SURFACE
      ?auto_17803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17801 ?auto_17802 ) ( SURFACE-AT ?auto_17799 ?auto_17802 ) ( CLEAR ?auto_17799 ) ( IS-CRATE ?auto_17800 ) ( AVAILABLE ?auto_17801 ) ( not ( = ?auto_17804 ?auto_17802 ) ) ( HOIST-AT ?auto_17805 ?auto_17804 ) ( AVAILABLE ?auto_17805 ) ( SURFACE-AT ?auto_17800 ?auto_17804 ) ( ON ?auto_17800 ?auto_17806 ) ( CLEAR ?auto_17800 ) ( TRUCK-AT ?auto_17803 ?auto_17802 ) ( not ( = ?auto_17799 ?auto_17800 ) ) ( not ( = ?auto_17799 ?auto_17806 ) ) ( not ( = ?auto_17800 ?auto_17806 ) ) ( not ( = ?auto_17801 ?auto_17805 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17803 ?auto_17802 ?auto_17804 )
      ( !LIFT ?auto_17805 ?auto_17800 ?auto_17806 ?auto_17804 )
      ( !LOAD ?auto_17805 ?auto_17800 ?auto_17803 ?auto_17804 )
      ( !DRIVE ?auto_17803 ?auto_17804 ?auto_17802 )
      ( !UNLOAD ?auto_17801 ?auto_17800 ?auto_17803 ?auto_17802 )
      ( !DROP ?auto_17801 ?auto_17800 ?auto_17799 ?auto_17802 )
      ( MAKE-1CRATE-VERIFY ?auto_17799 ?auto_17800 ) )
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
      ?auto_17817 - SURFACE
      ?auto_17825 - PLACE
      ?auto_17822 - HOIST
      ?auto_17826 - SURFACE
      ?auto_17823 - PLACE
      ?auto_17821 - HOIST
      ?auto_17824 - SURFACE
      ?auto_17818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17819 ?auto_17815 ) ( IS-CRATE ?auto_17814 ) ( not ( = ?auto_17820 ?auto_17815 ) ) ( HOIST-AT ?auto_17816 ?auto_17820 ) ( AVAILABLE ?auto_17816 ) ( SURFACE-AT ?auto_17814 ?auto_17820 ) ( ON ?auto_17814 ?auto_17817 ) ( CLEAR ?auto_17814 ) ( not ( = ?auto_17813 ?auto_17814 ) ) ( not ( = ?auto_17813 ?auto_17817 ) ) ( not ( = ?auto_17814 ?auto_17817 ) ) ( not ( = ?auto_17819 ?auto_17816 ) ) ( IS-CRATE ?auto_17813 ) ( not ( = ?auto_17825 ?auto_17815 ) ) ( HOIST-AT ?auto_17822 ?auto_17825 ) ( AVAILABLE ?auto_17822 ) ( SURFACE-AT ?auto_17813 ?auto_17825 ) ( ON ?auto_17813 ?auto_17826 ) ( CLEAR ?auto_17813 ) ( not ( = ?auto_17812 ?auto_17813 ) ) ( not ( = ?auto_17812 ?auto_17826 ) ) ( not ( = ?auto_17813 ?auto_17826 ) ) ( not ( = ?auto_17819 ?auto_17822 ) ) ( SURFACE-AT ?auto_17811 ?auto_17815 ) ( CLEAR ?auto_17811 ) ( IS-CRATE ?auto_17812 ) ( AVAILABLE ?auto_17819 ) ( not ( = ?auto_17823 ?auto_17815 ) ) ( HOIST-AT ?auto_17821 ?auto_17823 ) ( AVAILABLE ?auto_17821 ) ( SURFACE-AT ?auto_17812 ?auto_17823 ) ( ON ?auto_17812 ?auto_17824 ) ( CLEAR ?auto_17812 ) ( TRUCK-AT ?auto_17818 ?auto_17815 ) ( not ( = ?auto_17811 ?auto_17812 ) ) ( not ( = ?auto_17811 ?auto_17824 ) ) ( not ( = ?auto_17812 ?auto_17824 ) ) ( not ( = ?auto_17819 ?auto_17821 ) ) ( not ( = ?auto_17811 ?auto_17813 ) ) ( not ( = ?auto_17811 ?auto_17826 ) ) ( not ( = ?auto_17813 ?auto_17824 ) ) ( not ( = ?auto_17825 ?auto_17823 ) ) ( not ( = ?auto_17822 ?auto_17821 ) ) ( not ( = ?auto_17826 ?auto_17824 ) ) ( not ( = ?auto_17811 ?auto_17814 ) ) ( not ( = ?auto_17811 ?auto_17817 ) ) ( not ( = ?auto_17812 ?auto_17814 ) ) ( not ( = ?auto_17812 ?auto_17817 ) ) ( not ( = ?auto_17814 ?auto_17826 ) ) ( not ( = ?auto_17814 ?auto_17824 ) ) ( not ( = ?auto_17820 ?auto_17825 ) ) ( not ( = ?auto_17820 ?auto_17823 ) ) ( not ( = ?auto_17816 ?auto_17822 ) ) ( not ( = ?auto_17816 ?auto_17821 ) ) ( not ( = ?auto_17817 ?auto_17826 ) ) ( not ( = ?auto_17817 ?auto_17824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17811 ?auto_17812 ?auto_17813 )
      ( MAKE-1CRATE ?auto_17813 ?auto_17814 )
      ( MAKE-3CRATE-VERIFY ?auto_17811 ?auto_17812 ?auto_17813 ?auto_17814 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17829 - SURFACE
      ?auto_17830 - SURFACE
    )
    :vars
    (
      ?auto_17831 - HOIST
      ?auto_17832 - PLACE
      ?auto_17834 - PLACE
      ?auto_17835 - HOIST
      ?auto_17836 - SURFACE
      ?auto_17833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17831 ?auto_17832 ) ( SURFACE-AT ?auto_17829 ?auto_17832 ) ( CLEAR ?auto_17829 ) ( IS-CRATE ?auto_17830 ) ( AVAILABLE ?auto_17831 ) ( not ( = ?auto_17834 ?auto_17832 ) ) ( HOIST-AT ?auto_17835 ?auto_17834 ) ( AVAILABLE ?auto_17835 ) ( SURFACE-AT ?auto_17830 ?auto_17834 ) ( ON ?auto_17830 ?auto_17836 ) ( CLEAR ?auto_17830 ) ( TRUCK-AT ?auto_17833 ?auto_17832 ) ( not ( = ?auto_17829 ?auto_17830 ) ) ( not ( = ?auto_17829 ?auto_17836 ) ) ( not ( = ?auto_17830 ?auto_17836 ) ) ( not ( = ?auto_17831 ?auto_17835 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17833 ?auto_17832 ?auto_17834 )
      ( !LIFT ?auto_17835 ?auto_17830 ?auto_17836 ?auto_17834 )
      ( !LOAD ?auto_17835 ?auto_17830 ?auto_17833 ?auto_17834 )
      ( !DRIVE ?auto_17833 ?auto_17834 ?auto_17832 )
      ( !UNLOAD ?auto_17831 ?auto_17830 ?auto_17833 ?auto_17832 )
      ( !DROP ?auto_17831 ?auto_17830 ?auto_17829 ?auto_17832 )
      ( MAKE-1CRATE-VERIFY ?auto_17829 ?auto_17830 ) )
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
      ?auto_17847 - HOIST
      ?auto_17849 - PLACE
      ?auto_17850 - PLACE
      ?auto_17851 - HOIST
      ?auto_17852 - SURFACE
      ?auto_17860 - PLACE
      ?auto_17854 - HOIST
      ?auto_17861 - SURFACE
      ?auto_17853 - PLACE
      ?auto_17857 - HOIST
      ?auto_17855 - SURFACE
      ?auto_17858 - PLACE
      ?auto_17859 - HOIST
      ?auto_17856 - SURFACE
      ?auto_17848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17847 ?auto_17849 ) ( IS-CRATE ?auto_17846 ) ( not ( = ?auto_17850 ?auto_17849 ) ) ( HOIST-AT ?auto_17851 ?auto_17850 ) ( AVAILABLE ?auto_17851 ) ( SURFACE-AT ?auto_17846 ?auto_17850 ) ( ON ?auto_17846 ?auto_17852 ) ( CLEAR ?auto_17846 ) ( not ( = ?auto_17845 ?auto_17846 ) ) ( not ( = ?auto_17845 ?auto_17852 ) ) ( not ( = ?auto_17846 ?auto_17852 ) ) ( not ( = ?auto_17847 ?auto_17851 ) ) ( IS-CRATE ?auto_17845 ) ( not ( = ?auto_17860 ?auto_17849 ) ) ( HOIST-AT ?auto_17854 ?auto_17860 ) ( AVAILABLE ?auto_17854 ) ( SURFACE-AT ?auto_17845 ?auto_17860 ) ( ON ?auto_17845 ?auto_17861 ) ( CLEAR ?auto_17845 ) ( not ( = ?auto_17844 ?auto_17845 ) ) ( not ( = ?auto_17844 ?auto_17861 ) ) ( not ( = ?auto_17845 ?auto_17861 ) ) ( not ( = ?auto_17847 ?auto_17854 ) ) ( IS-CRATE ?auto_17844 ) ( not ( = ?auto_17853 ?auto_17849 ) ) ( HOIST-AT ?auto_17857 ?auto_17853 ) ( AVAILABLE ?auto_17857 ) ( SURFACE-AT ?auto_17844 ?auto_17853 ) ( ON ?auto_17844 ?auto_17855 ) ( CLEAR ?auto_17844 ) ( not ( = ?auto_17843 ?auto_17844 ) ) ( not ( = ?auto_17843 ?auto_17855 ) ) ( not ( = ?auto_17844 ?auto_17855 ) ) ( not ( = ?auto_17847 ?auto_17857 ) ) ( SURFACE-AT ?auto_17842 ?auto_17849 ) ( CLEAR ?auto_17842 ) ( IS-CRATE ?auto_17843 ) ( AVAILABLE ?auto_17847 ) ( not ( = ?auto_17858 ?auto_17849 ) ) ( HOIST-AT ?auto_17859 ?auto_17858 ) ( AVAILABLE ?auto_17859 ) ( SURFACE-AT ?auto_17843 ?auto_17858 ) ( ON ?auto_17843 ?auto_17856 ) ( CLEAR ?auto_17843 ) ( TRUCK-AT ?auto_17848 ?auto_17849 ) ( not ( = ?auto_17842 ?auto_17843 ) ) ( not ( = ?auto_17842 ?auto_17856 ) ) ( not ( = ?auto_17843 ?auto_17856 ) ) ( not ( = ?auto_17847 ?auto_17859 ) ) ( not ( = ?auto_17842 ?auto_17844 ) ) ( not ( = ?auto_17842 ?auto_17855 ) ) ( not ( = ?auto_17844 ?auto_17856 ) ) ( not ( = ?auto_17853 ?auto_17858 ) ) ( not ( = ?auto_17857 ?auto_17859 ) ) ( not ( = ?auto_17855 ?auto_17856 ) ) ( not ( = ?auto_17842 ?auto_17845 ) ) ( not ( = ?auto_17842 ?auto_17861 ) ) ( not ( = ?auto_17843 ?auto_17845 ) ) ( not ( = ?auto_17843 ?auto_17861 ) ) ( not ( = ?auto_17845 ?auto_17855 ) ) ( not ( = ?auto_17845 ?auto_17856 ) ) ( not ( = ?auto_17860 ?auto_17853 ) ) ( not ( = ?auto_17860 ?auto_17858 ) ) ( not ( = ?auto_17854 ?auto_17857 ) ) ( not ( = ?auto_17854 ?auto_17859 ) ) ( not ( = ?auto_17861 ?auto_17855 ) ) ( not ( = ?auto_17861 ?auto_17856 ) ) ( not ( = ?auto_17842 ?auto_17846 ) ) ( not ( = ?auto_17842 ?auto_17852 ) ) ( not ( = ?auto_17843 ?auto_17846 ) ) ( not ( = ?auto_17843 ?auto_17852 ) ) ( not ( = ?auto_17844 ?auto_17846 ) ) ( not ( = ?auto_17844 ?auto_17852 ) ) ( not ( = ?auto_17846 ?auto_17861 ) ) ( not ( = ?auto_17846 ?auto_17855 ) ) ( not ( = ?auto_17846 ?auto_17856 ) ) ( not ( = ?auto_17850 ?auto_17860 ) ) ( not ( = ?auto_17850 ?auto_17853 ) ) ( not ( = ?auto_17850 ?auto_17858 ) ) ( not ( = ?auto_17851 ?auto_17854 ) ) ( not ( = ?auto_17851 ?auto_17857 ) ) ( not ( = ?auto_17851 ?auto_17859 ) ) ( not ( = ?auto_17852 ?auto_17861 ) ) ( not ( = ?auto_17852 ?auto_17855 ) ) ( not ( = ?auto_17852 ?auto_17856 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_17842 ?auto_17843 ?auto_17844 ?auto_17845 )
      ( MAKE-1CRATE ?auto_17845 ?auto_17846 )
      ( MAKE-4CRATE-VERIFY ?auto_17842 ?auto_17843 ?auto_17844 ?auto_17845 ?auto_17846 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17864 - SURFACE
      ?auto_17865 - SURFACE
    )
    :vars
    (
      ?auto_17866 - HOIST
      ?auto_17867 - PLACE
      ?auto_17869 - PLACE
      ?auto_17870 - HOIST
      ?auto_17871 - SURFACE
      ?auto_17868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17866 ?auto_17867 ) ( SURFACE-AT ?auto_17864 ?auto_17867 ) ( CLEAR ?auto_17864 ) ( IS-CRATE ?auto_17865 ) ( AVAILABLE ?auto_17866 ) ( not ( = ?auto_17869 ?auto_17867 ) ) ( HOIST-AT ?auto_17870 ?auto_17869 ) ( AVAILABLE ?auto_17870 ) ( SURFACE-AT ?auto_17865 ?auto_17869 ) ( ON ?auto_17865 ?auto_17871 ) ( CLEAR ?auto_17865 ) ( TRUCK-AT ?auto_17868 ?auto_17867 ) ( not ( = ?auto_17864 ?auto_17865 ) ) ( not ( = ?auto_17864 ?auto_17871 ) ) ( not ( = ?auto_17865 ?auto_17871 ) ) ( not ( = ?auto_17866 ?auto_17870 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17868 ?auto_17867 ?auto_17869 )
      ( !LIFT ?auto_17870 ?auto_17865 ?auto_17871 ?auto_17869 )
      ( !LOAD ?auto_17870 ?auto_17865 ?auto_17868 ?auto_17869 )
      ( !DRIVE ?auto_17868 ?auto_17869 ?auto_17867 )
      ( !UNLOAD ?auto_17866 ?auto_17865 ?auto_17868 ?auto_17867 )
      ( !DROP ?auto_17866 ?auto_17865 ?auto_17864 ?auto_17867 )
      ( MAKE-1CRATE-VERIFY ?auto_17864 ?auto_17865 ) )
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
      ?auto_17888 - HOIST
      ?auto_17887 - PLACE
      ?auto_17884 - PLACE
      ?auto_17886 - HOIST
      ?auto_17889 - SURFACE
      ?auto_17896 - PLACE
      ?auto_17890 - HOIST
      ?auto_17892 - SURFACE
      ?auto_17891 - PLACE
      ?auto_17899 - HOIST
      ?auto_17894 - SURFACE
      ?auto_17897 - PLACE
      ?auto_17900 - HOIST
      ?auto_17895 - SURFACE
      ?auto_17893 - PLACE
      ?auto_17901 - HOIST
      ?auto_17898 - SURFACE
      ?auto_17885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17888 ?auto_17887 ) ( IS-CRATE ?auto_17883 ) ( not ( = ?auto_17884 ?auto_17887 ) ) ( HOIST-AT ?auto_17886 ?auto_17884 ) ( AVAILABLE ?auto_17886 ) ( SURFACE-AT ?auto_17883 ?auto_17884 ) ( ON ?auto_17883 ?auto_17889 ) ( CLEAR ?auto_17883 ) ( not ( = ?auto_17882 ?auto_17883 ) ) ( not ( = ?auto_17882 ?auto_17889 ) ) ( not ( = ?auto_17883 ?auto_17889 ) ) ( not ( = ?auto_17888 ?auto_17886 ) ) ( IS-CRATE ?auto_17882 ) ( not ( = ?auto_17896 ?auto_17887 ) ) ( HOIST-AT ?auto_17890 ?auto_17896 ) ( AVAILABLE ?auto_17890 ) ( SURFACE-AT ?auto_17882 ?auto_17896 ) ( ON ?auto_17882 ?auto_17892 ) ( CLEAR ?auto_17882 ) ( not ( = ?auto_17881 ?auto_17882 ) ) ( not ( = ?auto_17881 ?auto_17892 ) ) ( not ( = ?auto_17882 ?auto_17892 ) ) ( not ( = ?auto_17888 ?auto_17890 ) ) ( IS-CRATE ?auto_17881 ) ( not ( = ?auto_17891 ?auto_17887 ) ) ( HOIST-AT ?auto_17899 ?auto_17891 ) ( AVAILABLE ?auto_17899 ) ( SURFACE-AT ?auto_17881 ?auto_17891 ) ( ON ?auto_17881 ?auto_17894 ) ( CLEAR ?auto_17881 ) ( not ( = ?auto_17880 ?auto_17881 ) ) ( not ( = ?auto_17880 ?auto_17894 ) ) ( not ( = ?auto_17881 ?auto_17894 ) ) ( not ( = ?auto_17888 ?auto_17899 ) ) ( IS-CRATE ?auto_17880 ) ( not ( = ?auto_17897 ?auto_17887 ) ) ( HOIST-AT ?auto_17900 ?auto_17897 ) ( AVAILABLE ?auto_17900 ) ( SURFACE-AT ?auto_17880 ?auto_17897 ) ( ON ?auto_17880 ?auto_17895 ) ( CLEAR ?auto_17880 ) ( not ( = ?auto_17879 ?auto_17880 ) ) ( not ( = ?auto_17879 ?auto_17895 ) ) ( not ( = ?auto_17880 ?auto_17895 ) ) ( not ( = ?auto_17888 ?auto_17900 ) ) ( SURFACE-AT ?auto_17878 ?auto_17887 ) ( CLEAR ?auto_17878 ) ( IS-CRATE ?auto_17879 ) ( AVAILABLE ?auto_17888 ) ( not ( = ?auto_17893 ?auto_17887 ) ) ( HOIST-AT ?auto_17901 ?auto_17893 ) ( AVAILABLE ?auto_17901 ) ( SURFACE-AT ?auto_17879 ?auto_17893 ) ( ON ?auto_17879 ?auto_17898 ) ( CLEAR ?auto_17879 ) ( TRUCK-AT ?auto_17885 ?auto_17887 ) ( not ( = ?auto_17878 ?auto_17879 ) ) ( not ( = ?auto_17878 ?auto_17898 ) ) ( not ( = ?auto_17879 ?auto_17898 ) ) ( not ( = ?auto_17888 ?auto_17901 ) ) ( not ( = ?auto_17878 ?auto_17880 ) ) ( not ( = ?auto_17878 ?auto_17895 ) ) ( not ( = ?auto_17880 ?auto_17898 ) ) ( not ( = ?auto_17897 ?auto_17893 ) ) ( not ( = ?auto_17900 ?auto_17901 ) ) ( not ( = ?auto_17895 ?auto_17898 ) ) ( not ( = ?auto_17878 ?auto_17881 ) ) ( not ( = ?auto_17878 ?auto_17894 ) ) ( not ( = ?auto_17879 ?auto_17881 ) ) ( not ( = ?auto_17879 ?auto_17894 ) ) ( not ( = ?auto_17881 ?auto_17895 ) ) ( not ( = ?auto_17881 ?auto_17898 ) ) ( not ( = ?auto_17891 ?auto_17897 ) ) ( not ( = ?auto_17891 ?auto_17893 ) ) ( not ( = ?auto_17899 ?auto_17900 ) ) ( not ( = ?auto_17899 ?auto_17901 ) ) ( not ( = ?auto_17894 ?auto_17895 ) ) ( not ( = ?auto_17894 ?auto_17898 ) ) ( not ( = ?auto_17878 ?auto_17882 ) ) ( not ( = ?auto_17878 ?auto_17892 ) ) ( not ( = ?auto_17879 ?auto_17882 ) ) ( not ( = ?auto_17879 ?auto_17892 ) ) ( not ( = ?auto_17880 ?auto_17882 ) ) ( not ( = ?auto_17880 ?auto_17892 ) ) ( not ( = ?auto_17882 ?auto_17894 ) ) ( not ( = ?auto_17882 ?auto_17895 ) ) ( not ( = ?auto_17882 ?auto_17898 ) ) ( not ( = ?auto_17896 ?auto_17891 ) ) ( not ( = ?auto_17896 ?auto_17897 ) ) ( not ( = ?auto_17896 ?auto_17893 ) ) ( not ( = ?auto_17890 ?auto_17899 ) ) ( not ( = ?auto_17890 ?auto_17900 ) ) ( not ( = ?auto_17890 ?auto_17901 ) ) ( not ( = ?auto_17892 ?auto_17894 ) ) ( not ( = ?auto_17892 ?auto_17895 ) ) ( not ( = ?auto_17892 ?auto_17898 ) ) ( not ( = ?auto_17878 ?auto_17883 ) ) ( not ( = ?auto_17878 ?auto_17889 ) ) ( not ( = ?auto_17879 ?auto_17883 ) ) ( not ( = ?auto_17879 ?auto_17889 ) ) ( not ( = ?auto_17880 ?auto_17883 ) ) ( not ( = ?auto_17880 ?auto_17889 ) ) ( not ( = ?auto_17881 ?auto_17883 ) ) ( not ( = ?auto_17881 ?auto_17889 ) ) ( not ( = ?auto_17883 ?auto_17892 ) ) ( not ( = ?auto_17883 ?auto_17894 ) ) ( not ( = ?auto_17883 ?auto_17895 ) ) ( not ( = ?auto_17883 ?auto_17898 ) ) ( not ( = ?auto_17884 ?auto_17896 ) ) ( not ( = ?auto_17884 ?auto_17891 ) ) ( not ( = ?auto_17884 ?auto_17897 ) ) ( not ( = ?auto_17884 ?auto_17893 ) ) ( not ( = ?auto_17886 ?auto_17890 ) ) ( not ( = ?auto_17886 ?auto_17899 ) ) ( not ( = ?auto_17886 ?auto_17900 ) ) ( not ( = ?auto_17886 ?auto_17901 ) ) ( not ( = ?auto_17889 ?auto_17892 ) ) ( not ( = ?auto_17889 ?auto_17894 ) ) ( not ( = ?auto_17889 ?auto_17895 ) ) ( not ( = ?auto_17889 ?auto_17898 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_17878 ?auto_17879 ?auto_17880 ?auto_17881 ?auto_17882 )
      ( MAKE-1CRATE ?auto_17882 ?auto_17883 )
      ( MAKE-5CRATE-VERIFY ?auto_17878 ?auto_17879 ?auto_17880 ?auto_17881 ?auto_17882 ?auto_17883 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17904 - SURFACE
      ?auto_17905 - SURFACE
    )
    :vars
    (
      ?auto_17906 - HOIST
      ?auto_17907 - PLACE
      ?auto_17909 - PLACE
      ?auto_17910 - HOIST
      ?auto_17911 - SURFACE
      ?auto_17908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17906 ?auto_17907 ) ( SURFACE-AT ?auto_17904 ?auto_17907 ) ( CLEAR ?auto_17904 ) ( IS-CRATE ?auto_17905 ) ( AVAILABLE ?auto_17906 ) ( not ( = ?auto_17909 ?auto_17907 ) ) ( HOIST-AT ?auto_17910 ?auto_17909 ) ( AVAILABLE ?auto_17910 ) ( SURFACE-AT ?auto_17905 ?auto_17909 ) ( ON ?auto_17905 ?auto_17911 ) ( CLEAR ?auto_17905 ) ( TRUCK-AT ?auto_17908 ?auto_17907 ) ( not ( = ?auto_17904 ?auto_17905 ) ) ( not ( = ?auto_17904 ?auto_17911 ) ) ( not ( = ?auto_17905 ?auto_17911 ) ) ( not ( = ?auto_17906 ?auto_17910 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17908 ?auto_17907 ?auto_17909 )
      ( !LIFT ?auto_17910 ?auto_17905 ?auto_17911 ?auto_17909 )
      ( !LOAD ?auto_17910 ?auto_17905 ?auto_17908 ?auto_17909 )
      ( !DRIVE ?auto_17908 ?auto_17909 ?auto_17907 )
      ( !UNLOAD ?auto_17906 ?auto_17905 ?auto_17908 ?auto_17907 )
      ( !DROP ?auto_17906 ?auto_17905 ?auto_17904 ?auto_17907 )
      ( MAKE-1CRATE-VERIFY ?auto_17904 ?auto_17905 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_17919 - SURFACE
      ?auto_17920 - SURFACE
      ?auto_17921 - SURFACE
      ?auto_17922 - SURFACE
      ?auto_17923 - SURFACE
      ?auto_17925 - SURFACE
      ?auto_17924 - SURFACE
    )
    :vars
    (
      ?auto_17930 - HOIST
      ?auto_17926 - PLACE
      ?auto_17928 - PLACE
      ?auto_17929 - HOIST
      ?auto_17927 - SURFACE
      ?auto_17943 - PLACE
      ?auto_17936 - HOIST
      ?auto_17942 - SURFACE
      ?auto_17940 - PLACE
      ?auto_17933 - HOIST
      ?auto_17934 - SURFACE
      ?auto_17939 - SURFACE
      ?auto_17938 - PLACE
      ?auto_17932 - HOIST
      ?auto_17941 - SURFACE
      ?auto_17935 - PLACE
      ?auto_17937 - HOIST
      ?auto_17944 - SURFACE
      ?auto_17931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17930 ?auto_17926 ) ( IS-CRATE ?auto_17924 ) ( not ( = ?auto_17928 ?auto_17926 ) ) ( HOIST-AT ?auto_17929 ?auto_17928 ) ( SURFACE-AT ?auto_17924 ?auto_17928 ) ( ON ?auto_17924 ?auto_17927 ) ( CLEAR ?auto_17924 ) ( not ( = ?auto_17925 ?auto_17924 ) ) ( not ( = ?auto_17925 ?auto_17927 ) ) ( not ( = ?auto_17924 ?auto_17927 ) ) ( not ( = ?auto_17930 ?auto_17929 ) ) ( IS-CRATE ?auto_17925 ) ( not ( = ?auto_17943 ?auto_17926 ) ) ( HOIST-AT ?auto_17936 ?auto_17943 ) ( AVAILABLE ?auto_17936 ) ( SURFACE-AT ?auto_17925 ?auto_17943 ) ( ON ?auto_17925 ?auto_17942 ) ( CLEAR ?auto_17925 ) ( not ( = ?auto_17923 ?auto_17925 ) ) ( not ( = ?auto_17923 ?auto_17942 ) ) ( not ( = ?auto_17925 ?auto_17942 ) ) ( not ( = ?auto_17930 ?auto_17936 ) ) ( IS-CRATE ?auto_17923 ) ( not ( = ?auto_17940 ?auto_17926 ) ) ( HOIST-AT ?auto_17933 ?auto_17940 ) ( AVAILABLE ?auto_17933 ) ( SURFACE-AT ?auto_17923 ?auto_17940 ) ( ON ?auto_17923 ?auto_17934 ) ( CLEAR ?auto_17923 ) ( not ( = ?auto_17922 ?auto_17923 ) ) ( not ( = ?auto_17922 ?auto_17934 ) ) ( not ( = ?auto_17923 ?auto_17934 ) ) ( not ( = ?auto_17930 ?auto_17933 ) ) ( IS-CRATE ?auto_17922 ) ( AVAILABLE ?auto_17929 ) ( SURFACE-AT ?auto_17922 ?auto_17928 ) ( ON ?auto_17922 ?auto_17939 ) ( CLEAR ?auto_17922 ) ( not ( = ?auto_17921 ?auto_17922 ) ) ( not ( = ?auto_17921 ?auto_17939 ) ) ( not ( = ?auto_17922 ?auto_17939 ) ) ( IS-CRATE ?auto_17921 ) ( not ( = ?auto_17938 ?auto_17926 ) ) ( HOIST-AT ?auto_17932 ?auto_17938 ) ( AVAILABLE ?auto_17932 ) ( SURFACE-AT ?auto_17921 ?auto_17938 ) ( ON ?auto_17921 ?auto_17941 ) ( CLEAR ?auto_17921 ) ( not ( = ?auto_17920 ?auto_17921 ) ) ( not ( = ?auto_17920 ?auto_17941 ) ) ( not ( = ?auto_17921 ?auto_17941 ) ) ( not ( = ?auto_17930 ?auto_17932 ) ) ( SURFACE-AT ?auto_17919 ?auto_17926 ) ( CLEAR ?auto_17919 ) ( IS-CRATE ?auto_17920 ) ( AVAILABLE ?auto_17930 ) ( not ( = ?auto_17935 ?auto_17926 ) ) ( HOIST-AT ?auto_17937 ?auto_17935 ) ( AVAILABLE ?auto_17937 ) ( SURFACE-AT ?auto_17920 ?auto_17935 ) ( ON ?auto_17920 ?auto_17944 ) ( CLEAR ?auto_17920 ) ( TRUCK-AT ?auto_17931 ?auto_17926 ) ( not ( = ?auto_17919 ?auto_17920 ) ) ( not ( = ?auto_17919 ?auto_17944 ) ) ( not ( = ?auto_17920 ?auto_17944 ) ) ( not ( = ?auto_17930 ?auto_17937 ) ) ( not ( = ?auto_17919 ?auto_17921 ) ) ( not ( = ?auto_17919 ?auto_17941 ) ) ( not ( = ?auto_17921 ?auto_17944 ) ) ( not ( = ?auto_17938 ?auto_17935 ) ) ( not ( = ?auto_17932 ?auto_17937 ) ) ( not ( = ?auto_17941 ?auto_17944 ) ) ( not ( = ?auto_17919 ?auto_17922 ) ) ( not ( = ?auto_17919 ?auto_17939 ) ) ( not ( = ?auto_17920 ?auto_17922 ) ) ( not ( = ?auto_17920 ?auto_17939 ) ) ( not ( = ?auto_17922 ?auto_17941 ) ) ( not ( = ?auto_17922 ?auto_17944 ) ) ( not ( = ?auto_17928 ?auto_17938 ) ) ( not ( = ?auto_17928 ?auto_17935 ) ) ( not ( = ?auto_17929 ?auto_17932 ) ) ( not ( = ?auto_17929 ?auto_17937 ) ) ( not ( = ?auto_17939 ?auto_17941 ) ) ( not ( = ?auto_17939 ?auto_17944 ) ) ( not ( = ?auto_17919 ?auto_17923 ) ) ( not ( = ?auto_17919 ?auto_17934 ) ) ( not ( = ?auto_17920 ?auto_17923 ) ) ( not ( = ?auto_17920 ?auto_17934 ) ) ( not ( = ?auto_17921 ?auto_17923 ) ) ( not ( = ?auto_17921 ?auto_17934 ) ) ( not ( = ?auto_17923 ?auto_17939 ) ) ( not ( = ?auto_17923 ?auto_17941 ) ) ( not ( = ?auto_17923 ?auto_17944 ) ) ( not ( = ?auto_17940 ?auto_17928 ) ) ( not ( = ?auto_17940 ?auto_17938 ) ) ( not ( = ?auto_17940 ?auto_17935 ) ) ( not ( = ?auto_17933 ?auto_17929 ) ) ( not ( = ?auto_17933 ?auto_17932 ) ) ( not ( = ?auto_17933 ?auto_17937 ) ) ( not ( = ?auto_17934 ?auto_17939 ) ) ( not ( = ?auto_17934 ?auto_17941 ) ) ( not ( = ?auto_17934 ?auto_17944 ) ) ( not ( = ?auto_17919 ?auto_17925 ) ) ( not ( = ?auto_17919 ?auto_17942 ) ) ( not ( = ?auto_17920 ?auto_17925 ) ) ( not ( = ?auto_17920 ?auto_17942 ) ) ( not ( = ?auto_17921 ?auto_17925 ) ) ( not ( = ?auto_17921 ?auto_17942 ) ) ( not ( = ?auto_17922 ?auto_17925 ) ) ( not ( = ?auto_17922 ?auto_17942 ) ) ( not ( = ?auto_17925 ?auto_17934 ) ) ( not ( = ?auto_17925 ?auto_17939 ) ) ( not ( = ?auto_17925 ?auto_17941 ) ) ( not ( = ?auto_17925 ?auto_17944 ) ) ( not ( = ?auto_17943 ?auto_17940 ) ) ( not ( = ?auto_17943 ?auto_17928 ) ) ( not ( = ?auto_17943 ?auto_17938 ) ) ( not ( = ?auto_17943 ?auto_17935 ) ) ( not ( = ?auto_17936 ?auto_17933 ) ) ( not ( = ?auto_17936 ?auto_17929 ) ) ( not ( = ?auto_17936 ?auto_17932 ) ) ( not ( = ?auto_17936 ?auto_17937 ) ) ( not ( = ?auto_17942 ?auto_17934 ) ) ( not ( = ?auto_17942 ?auto_17939 ) ) ( not ( = ?auto_17942 ?auto_17941 ) ) ( not ( = ?auto_17942 ?auto_17944 ) ) ( not ( = ?auto_17919 ?auto_17924 ) ) ( not ( = ?auto_17919 ?auto_17927 ) ) ( not ( = ?auto_17920 ?auto_17924 ) ) ( not ( = ?auto_17920 ?auto_17927 ) ) ( not ( = ?auto_17921 ?auto_17924 ) ) ( not ( = ?auto_17921 ?auto_17927 ) ) ( not ( = ?auto_17922 ?auto_17924 ) ) ( not ( = ?auto_17922 ?auto_17927 ) ) ( not ( = ?auto_17923 ?auto_17924 ) ) ( not ( = ?auto_17923 ?auto_17927 ) ) ( not ( = ?auto_17924 ?auto_17942 ) ) ( not ( = ?auto_17924 ?auto_17934 ) ) ( not ( = ?auto_17924 ?auto_17939 ) ) ( not ( = ?auto_17924 ?auto_17941 ) ) ( not ( = ?auto_17924 ?auto_17944 ) ) ( not ( = ?auto_17927 ?auto_17942 ) ) ( not ( = ?auto_17927 ?auto_17934 ) ) ( not ( = ?auto_17927 ?auto_17939 ) ) ( not ( = ?auto_17927 ?auto_17941 ) ) ( not ( = ?auto_17927 ?auto_17944 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_17919 ?auto_17920 ?auto_17921 ?auto_17922 ?auto_17923 ?auto_17925 )
      ( MAKE-1CRATE ?auto_17925 ?auto_17924 )
      ( MAKE-6CRATE-VERIFY ?auto_17919 ?auto_17920 ?auto_17921 ?auto_17922 ?auto_17923 ?auto_17925 ?auto_17924 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17947 - SURFACE
      ?auto_17948 - SURFACE
    )
    :vars
    (
      ?auto_17949 - HOIST
      ?auto_17950 - PLACE
      ?auto_17952 - PLACE
      ?auto_17953 - HOIST
      ?auto_17954 - SURFACE
      ?auto_17951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17949 ?auto_17950 ) ( SURFACE-AT ?auto_17947 ?auto_17950 ) ( CLEAR ?auto_17947 ) ( IS-CRATE ?auto_17948 ) ( AVAILABLE ?auto_17949 ) ( not ( = ?auto_17952 ?auto_17950 ) ) ( HOIST-AT ?auto_17953 ?auto_17952 ) ( AVAILABLE ?auto_17953 ) ( SURFACE-AT ?auto_17948 ?auto_17952 ) ( ON ?auto_17948 ?auto_17954 ) ( CLEAR ?auto_17948 ) ( TRUCK-AT ?auto_17951 ?auto_17950 ) ( not ( = ?auto_17947 ?auto_17948 ) ) ( not ( = ?auto_17947 ?auto_17954 ) ) ( not ( = ?auto_17948 ?auto_17954 ) ) ( not ( = ?auto_17949 ?auto_17953 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17951 ?auto_17950 ?auto_17952 )
      ( !LIFT ?auto_17953 ?auto_17948 ?auto_17954 ?auto_17952 )
      ( !LOAD ?auto_17953 ?auto_17948 ?auto_17951 ?auto_17952 )
      ( !DRIVE ?auto_17951 ?auto_17952 ?auto_17950 )
      ( !UNLOAD ?auto_17949 ?auto_17948 ?auto_17951 ?auto_17950 )
      ( !DROP ?auto_17949 ?auto_17948 ?auto_17947 ?auto_17950 )
      ( MAKE-1CRATE-VERIFY ?auto_17947 ?auto_17948 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_17963 - SURFACE
      ?auto_17964 - SURFACE
      ?auto_17965 - SURFACE
      ?auto_17966 - SURFACE
      ?auto_17967 - SURFACE
      ?auto_17969 - SURFACE
      ?auto_17968 - SURFACE
      ?auto_17970 - SURFACE
    )
    :vars
    (
      ?auto_17974 - HOIST
      ?auto_17973 - PLACE
      ?auto_17975 - PLACE
      ?auto_17971 - HOIST
      ?auto_17976 - SURFACE
      ?auto_17978 - PLACE
      ?auto_17981 - HOIST
      ?auto_17980 - SURFACE
      ?auto_17991 - PLACE
      ?auto_17985 - HOIST
      ?auto_17979 - SURFACE
      ?auto_17987 - PLACE
      ?auto_17989 - HOIST
      ?auto_17988 - SURFACE
      ?auto_17982 - SURFACE
      ?auto_17983 - PLACE
      ?auto_17977 - HOIST
      ?auto_17990 - SURFACE
      ?auto_17986 - PLACE
      ?auto_17984 - HOIST
      ?auto_17992 - SURFACE
      ?auto_17972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17974 ?auto_17973 ) ( IS-CRATE ?auto_17970 ) ( not ( = ?auto_17975 ?auto_17973 ) ) ( HOIST-AT ?auto_17971 ?auto_17975 ) ( AVAILABLE ?auto_17971 ) ( SURFACE-AT ?auto_17970 ?auto_17975 ) ( ON ?auto_17970 ?auto_17976 ) ( CLEAR ?auto_17970 ) ( not ( = ?auto_17968 ?auto_17970 ) ) ( not ( = ?auto_17968 ?auto_17976 ) ) ( not ( = ?auto_17970 ?auto_17976 ) ) ( not ( = ?auto_17974 ?auto_17971 ) ) ( IS-CRATE ?auto_17968 ) ( not ( = ?auto_17978 ?auto_17973 ) ) ( HOIST-AT ?auto_17981 ?auto_17978 ) ( SURFACE-AT ?auto_17968 ?auto_17978 ) ( ON ?auto_17968 ?auto_17980 ) ( CLEAR ?auto_17968 ) ( not ( = ?auto_17969 ?auto_17968 ) ) ( not ( = ?auto_17969 ?auto_17980 ) ) ( not ( = ?auto_17968 ?auto_17980 ) ) ( not ( = ?auto_17974 ?auto_17981 ) ) ( IS-CRATE ?auto_17969 ) ( not ( = ?auto_17991 ?auto_17973 ) ) ( HOIST-AT ?auto_17985 ?auto_17991 ) ( AVAILABLE ?auto_17985 ) ( SURFACE-AT ?auto_17969 ?auto_17991 ) ( ON ?auto_17969 ?auto_17979 ) ( CLEAR ?auto_17969 ) ( not ( = ?auto_17967 ?auto_17969 ) ) ( not ( = ?auto_17967 ?auto_17979 ) ) ( not ( = ?auto_17969 ?auto_17979 ) ) ( not ( = ?auto_17974 ?auto_17985 ) ) ( IS-CRATE ?auto_17967 ) ( not ( = ?auto_17987 ?auto_17973 ) ) ( HOIST-AT ?auto_17989 ?auto_17987 ) ( AVAILABLE ?auto_17989 ) ( SURFACE-AT ?auto_17967 ?auto_17987 ) ( ON ?auto_17967 ?auto_17988 ) ( CLEAR ?auto_17967 ) ( not ( = ?auto_17966 ?auto_17967 ) ) ( not ( = ?auto_17966 ?auto_17988 ) ) ( not ( = ?auto_17967 ?auto_17988 ) ) ( not ( = ?auto_17974 ?auto_17989 ) ) ( IS-CRATE ?auto_17966 ) ( AVAILABLE ?auto_17981 ) ( SURFACE-AT ?auto_17966 ?auto_17978 ) ( ON ?auto_17966 ?auto_17982 ) ( CLEAR ?auto_17966 ) ( not ( = ?auto_17965 ?auto_17966 ) ) ( not ( = ?auto_17965 ?auto_17982 ) ) ( not ( = ?auto_17966 ?auto_17982 ) ) ( IS-CRATE ?auto_17965 ) ( not ( = ?auto_17983 ?auto_17973 ) ) ( HOIST-AT ?auto_17977 ?auto_17983 ) ( AVAILABLE ?auto_17977 ) ( SURFACE-AT ?auto_17965 ?auto_17983 ) ( ON ?auto_17965 ?auto_17990 ) ( CLEAR ?auto_17965 ) ( not ( = ?auto_17964 ?auto_17965 ) ) ( not ( = ?auto_17964 ?auto_17990 ) ) ( not ( = ?auto_17965 ?auto_17990 ) ) ( not ( = ?auto_17974 ?auto_17977 ) ) ( SURFACE-AT ?auto_17963 ?auto_17973 ) ( CLEAR ?auto_17963 ) ( IS-CRATE ?auto_17964 ) ( AVAILABLE ?auto_17974 ) ( not ( = ?auto_17986 ?auto_17973 ) ) ( HOIST-AT ?auto_17984 ?auto_17986 ) ( AVAILABLE ?auto_17984 ) ( SURFACE-AT ?auto_17964 ?auto_17986 ) ( ON ?auto_17964 ?auto_17992 ) ( CLEAR ?auto_17964 ) ( TRUCK-AT ?auto_17972 ?auto_17973 ) ( not ( = ?auto_17963 ?auto_17964 ) ) ( not ( = ?auto_17963 ?auto_17992 ) ) ( not ( = ?auto_17964 ?auto_17992 ) ) ( not ( = ?auto_17974 ?auto_17984 ) ) ( not ( = ?auto_17963 ?auto_17965 ) ) ( not ( = ?auto_17963 ?auto_17990 ) ) ( not ( = ?auto_17965 ?auto_17992 ) ) ( not ( = ?auto_17983 ?auto_17986 ) ) ( not ( = ?auto_17977 ?auto_17984 ) ) ( not ( = ?auto_17990 ?auto_17992 ) ) ( not ( = ?auto_17963 ?auto_17966 ) ) ( not ( = ?auto_17963 ?auto_17982 ) ) ( not ( = ?auto_17964 ?auto_17966 ) ) ( not ( = ?auto_17964 ?auto_17982 ) ) ( not ( = ?auto_17966 ?auto_17990 ) ) ( not ( = ?auto_17966 ?auto_17992 ) ) ( not ( = ?auto_17978 ?auto_17983 ) ) ( not ( = ?auto_17978 ?auto_17986 ) ) ( not ( = ?auto_17981 ?auto_17977 ) ) ( not ( = ?auto_17981 ?auto_17984 ) ) ( not ( = ?auto_17982 ?auto_17990 ) ) ( not ( = ?auto_17982 ?auto_17992 ) ) ( not ( = ?auto_17963 ?auto_17967 ) ) ( not ( = ?auto_17963 ?auto_17988 ) ) ( not ( = ?auto_17964 ?auto_17967 ) ) ( not ( = ?auto_17964 ?auto_17988 ) ) ( not ( = ?auto_17965 ?auto_17967 ) ) ( not ( = ?auto_17965 ?auto_17988 ) ) ( not ( = ?auto_17967 ?auto_17982 ) ) ( not ( = ?auto_17967 ?auto_17990 ) ) ( not ( = ?auto_17967 ?auto_17992 ) ) ( not ( = ?auto_17987 ?auto_17978 ) ) ( not ( = ?auto_17987 ?auto_17983 ) ) ( not ( = ?auto_17987 ?auto_17986 ) ) ( not ( = ?auto_17989 ?auto_17981 ) ) ( not ( = ?auto_17989 ?auto_17977 ) ) ( not ( = ?auto_17989 ?auto_17984 ) ) ( not ( = ?auto_17988 ?auto_17982 ) ) ( not ( = ?auto_17988 ?auto_17990 ) ) ( not ( = ?auto_17988 ?auto_17992 ) ) ( not ( = ?auto_17963 ?auto_17969 ) ) ( not ( = ?auto_17963 ?auto_17979 ) ) ( not ( = ?auto_17964 ?auto_17969 ) ) ( not ( = ?auto_17964 ?auto_17979 ) ) ( not ( = ?auto_17965 ?auto_17969 ) ) ( not ( = ?auto_17965 ?auto_17979 ) ) ( not ( = ?auto_17966 ?auto_17969 ) ) ( not ( = ?auto_17966 ?auto_17979 ) ) ( not ( = ?auto_17969 ?auto_17988 ) ) ( not ( = ?auto_17969 ?auto_17982 ) ) ( not ( = ?auto_17969 ?auto_17990 ) ) ( not ( = ?auto_17969 ?auto_17992 ) ) ( not ( = ?auto_17991 ?auto_17987 ) ) ( not ( = ?auto_17991 ?auto_17978 ) ) ( not ( = ?auto_17991 ?auto_17983 ) ) ( not ( = ?auto_17991 ?auto_17986 ) ) ( not ( = ?auto_17985 ?auto_17989 ) ) ( not ( = ?auto_17985 ?auto_17981 ) ) ( not ( = ?auto_17985 ?auto_17977 ) ) ( not ( = ?auto_17985 ?auto_17984 ) ) ( not ( = ?auto_17979 ?auto_17988 ) ) ( not ( = ?auto_17979 ?auto_17982 ) ) ( not ( = ?auto_17979 ?auto_17990 ) ) ( not ( = ?auto_17979 ?auto_17992 ) ) ( not ( = ?auto_17963 ?auto_17968 ) ) ( not ( = ?auto_17963 ?auto_17980 ) ) ( not ( = ?auto_17964 ?auto_17968 ) ) ( not ( = ?auto_17964 ?auto_17980 ) ) ( not ( = ?auto_17965 ?auto_17968 ) ) ( not ( = ?auto_17965 ?auto_17980 ) ) ( not ( = ?auto_17966 ?auto_17968 ) ) ( not ( = ?auto_17966 ?auto_17980 ) ) ( not ( = ?auto_17967 ?auto_17968 ) ) ( not ( = ?auto_17967 ?auto_17980 ) ) ( not ( = ?auto_17968 ?auto_17979 ) ) ( not ( = ?auto_17968 ?auto_17988 ) ) ( not ( = ?auto_17968 ?auto_17982 ) ) ( not ( = ?auto_17968 ?auto_17990 ) ) ( not ( = ?auto_17968 ?auto_17992 ) ) ( not ( = ?auto_17980 ?auto_17979 ) ) ( not ( = ?auto_17980 ?auto_17988 ) ) ( not ( = ?auto_17980 ?auto_17982 ) ) ( not ( = ?auto_17980 ?auto_17990 ) ) ( not ( = ?auto_17980 ?auto_17992 ) ) ( not ( = ?auto_17963 ?auto_17970 ) ) ( not ( = ?auto_17963 ?auto_17976 ) ) ( not ( = ?auto_17964 ?auto_17970 ) ) ( not ( = ?auto_17964 ?auto_17976 ) ) ( not ( = ?auto_17965 ?auto_17970 ) ) ( not ( = ?auto_17965 ?auto_17976 ) ) ( not ( = ?auto_17966 ?auto_17970 ) ) ( not ( = ?auto_17966 ?auto_17976 ) ) ( not ( = ?auto_17967 ?auto_17970 ) ) ( not ( = ?auto_17967 ?auto_17976 ) ) ( not ( = ?auto_17969 ?auto_17970 ) ) ( not ( = ?auto_17969 ?auto_17976 ) ) ( not ( = ?auto_17970 ?auto_17980 ) ) ( not ( = ?auto_17970 ?auto_17979 ) ) ( not ( = ?auto_17970 ?auto_17988 ) ) ( not ( = ?auto_17970 ?auto_17982 ) ) ( not ( = ?auto_17970 ?auto_17990 ) ) ( not ( = ?auto_17970 ?auto_17992 ) ) ( not ( = ?auto_17975 ?auto_17978 ) ) ( not ( = ?auto_17975 ?auto_17991 ) ) ( not ( = ?auto_17975 ?auto_17987 ) ) ( not ( = ?auto_17975 ?auto_17983 ) ) ( not ( = ?auto_17975 ?auto_17986 ) ) ( not ( = ?auto_17971 ?auto_17981 ) ) ( not ( = ?auto_17971 ?auto_17985 ) ) ( not ( = ?auto_17971 ?auto_17989 ) ) ( not ( = ?auto_17971 ?auto_17977 ) ) ( not ( = ?auto_17971 ?auto_17984 ) ) ( not ( = ?auto_17976 ?auto_17980 ) ) ( not ( = ?auto_17976 ?auto_17979 ) ) ( not ( = ?auto_17976 ?auto_17988 ) ) ( not ( = ?auto_17976 ?auto_17982 ) ) ( not ( = ?auto_17976 ?auto_17990 ) ) ( not ( = ?auto_17976 ?auto_17992 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_17963 ?auto_17964 ?auto_17965 ?auto_17966 ?auto_17967 ?auto_17969 ?auto_17968 )
      ( MAKE-1CRATE ?auto_17968 ?auto_17970 )
      ( MAKE-7CRATE-VERIFY ?auto_17963 ?auto_17964 ?auto_17965 ?auto_17966 ?auto_17967 ?auto_17969 ?auto_17968 ?auto_17970 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17995 - SURFACE
      ?auto_17996 - SURFACE
    )
    :vars
    (
      ?auto_17997 - HOIST
      ?auto_17998 - PLACE
      ?auto_18000 - PLACE
      ?auto_18001 - HOIST
      ?auto_18002 - SURFACE
      ?auto_17999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17997 ?auto_17998 ) ( SURFACE-AT ?auto_17995 ?auto_17998 ) ( CLEAR ?auto_17995 ) ( IS-CRATE ?auto_17996 ) ( AVAILABLE ?auto_17997 ) ( not ( = ?auto_18000 ?auto_17998 ) ) ( HOIST-AT ?auto_18001 ?auto_18000 ) ( AVAILABLE ?auto_18001 ) ( SURFACE-AT ?auto_17996 ?auto_18000 ) ( ON ?auto_17996 ?auto_18002 ) ( CLEAR ?auto_17996 ) ( TRUCK-AT ?auto_17999 ?auto_17998 ) ( not ( = ?auto_17995 ?auto_17996 ) ) ( not ( = ?auto_17995 ?auto_18002 ) ) ( not ( = ?auto_17996 ?auto_18002 ) ) ( not ( = ?auto_17997 ?auto_18001 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17999 ?auto_17998 ?auto_18000 )
      ( !LIFT ?auto_18001 ?auto_17996 ?auto_18002 ?auto_18000 )
      ( !LOAD ?auto_18001 ?auto_17996 ?auto_17999 ?auto_18000 )
      ( !DRIVE ?auto_17999 ?auto_18000 ?auto_17998 )
      ( !UNLOAD ?auto_17997 ?auto_17996 ?auto_17999 ?auto_17998 )
      ( !DROP ?auto_17997 ?auto_17996 ?auto_17995 ?auto_17998 )
      ( MAKE-1CRATE-VERIFY ?auto_17995 ?auto_17996 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_18012 - SURFACE
      ?auto_18013 - SURFACE
      ?auto_18014 - SURFACE
      ?auto_18015 - SURFACE
      ?auto_18016 - SURFACE
      ?auto_18018 - SURFACE
      ?auto_18017 - SURFACE
      ?auto_18020 - SURFACE
      ?auto_18019 - SURFACE
    )
    :vars
    (
      ?auto_18024 - HOIST
      ?auto_18021 - PLACE
      ?auto_18025 - PLACE
      ?auto_18023 - HOIST
      ?auto_18026 - SURFACE
      ?auto_18041 - PLACE
      ?auto_18027 - HOIST
      ?auto_18042 - SURFACE
      ?auto_18044 - PLACE
      ?auto_18040 - HOIST
      ?auto_18043 - SURFACE
      ?auto_18028 - PLACE
      ?auto_18031 - HOIST
      ?auto_18045 - SURFACE
      ?auto_18032 - PLACE
      ?auto_18035 - HOIST
      ?auto_18034 - SURFACE
      ?auto_18039 - SURFACE
      ?auto_18038 - PLACE
      ?auto_18029 - HOIST
      ?auto_18036 - SURFACE
      ?auto_18033 - PLACE
      ?auto_18037 - HOIST
      ?auto_18030 - SURFACE
      ?auto_18022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18024 ?auto_18021 ) ( IS-CRATE ?auto_18019 ) ( not ( = ?auto_18025 ?auto_18021 ) ) ( HOIST-AT ?auto_18023 ?auto_18025 ) ( AVAILABLE ?auto_18023 ) ( SURFACE-AT ?auto_18019 ?auto_18025 ) ( ON ?auto_18019 ?auto_18026 ) ( CLEAR ?auto_18019 ) ( not ( = ?auto_18020 ?auto_18019 ) ) ( not ( = ?auto_18020 ?auto_18026 ) ) ( not ( = ?auto_18019 ?auto_18026 ) ) ( not ( = ?auto_18024 ?auto_18023 ) ) ( IS-CRATE ?auto_18020 ) ( not ( = ?auto_18041 ?auto_18021 ) ) ( HOIST-AT ?auto_18027 ?auto_18041 ) ( AVAILABLE ?auto_18027 ) ( SURFACE-AT ?auto_18020 ?auto_18041 ) ( ON ?auto_18020 ?auto_18042 ) ( CLEAR ?auto_18020 ) ( not ( = ?auto_18017 ?auto_18020 ) ) ( not ( = ?auto_18017 ?auto_18042 ) ) ( not ( = ?auto_18020 ?auto_18042 ) ) ( not ( = ?auto_18024 ?auto_18027 ) ) ( IS-CRATE ?auto_18017 ) ( not ( = ?auto_18044 ?auto_18021 ) ) ( HOIST-AT ?auto_18040 ?auto_18044 ) ( SURFACE-AT ?auto_18017 ?auto_18044 ) ( ON ?auto_18017 ?auto_18043 ) ( CLEAR ?auto_18017 ) ( not ( = ?auto_18018 ?auto_18017 ) ) ( not ( = ?auto_18018 ?auto_18043 ) ) ( not ( = ?auto_18017 ?auto_18043 ) ) ( not ( = ?auto_18024 ?auto_18040 ) ) ( IS-CRATE ?auto_18018 ) ( not ( = ?auto_18028 ?auto_18021 ) ) ( HOIST-AT ?auto_18031 ?auto_18028 ) ( AVAILABLE ?auto_18031 ) ( SURFACE-AT ?auto_18018 ?auto_18028 ) ( ON ?auto_18018 ?auto_18045 ) ( CLEAR ?auto_18018 ) ( not ( = ?auto_18016 ?auto_18018 ) ) ( not ( = ?auto_18016 ?auto_18045 ) ) ( not ( = ?auto_18018 ?auto_18045 ) ) ( not ( = ?auto_18024 ?auto_18031 ) ) ( IS-CRATE ?auto_18016 ) ( not ( = ?auto_18032 ?auto_18021 ) ) ( HOIST-AT ?auto_18035 ?auto_18032 ) ( AVAILABLE ?auto_18035 ) ( SURFACE-AT ?auto_18016 ?auto_18032 ) ( ON ?auto_18016 ?auto_18034 ) ( CLEAR ?auto_18016 ) ( not ( = ?auto_18015 ?auto_18016 ) ) ( not ( = ?auto_18015 ?auto_18034 ) ) ( not ( = ?auto_18016 ?auto_18034 ) ) ( not ( = ?auto_18024 ?auto_18035 ) ) ( IS-CRATE ?auto_18015 ) ( AVAILABLE ?auto_18040 ) ( SURFACE-AT ?auto_18015 ?auto_18044 ) ( ON ?auto_18015 ?auto_18039 ) ( CLEAR ?auto_18015 ) ( not ( = ?auto_18014 ?auto_18015 ) ) ( not ( = ?auto_18014 ?auto_18039 ) ) ( not ( = ?auto_18015 ?auto_18039 ) ) ( IS-CRATE ?auto_18014 ) ( not ( = ?auto_18038 ?auto_18021 ) ) ( HOIST-AT ?auto_18029 ?auto_18038 ) ( AVAILABLE ?auto_18029 ) ( SURFACE-AT ?auto_18014 ?auto_18038 ) ( ON ?auto_18014 ?auto_18036 ) ( CLEAR ?auto_18014 ) ( not ( = ?auto_18013 ?auto_18014 ) ) ( not ( = ?auto_18013 ?auto_18036 ) ) ( not ( = ?auto_18014 ?auto_18036 ) ) ( not ( = ?auto_18024 ?auto_18029 ) ) ( SURFACE-AT ?auto_18012 ?auto_18021 ) ( CLEAR ?auto_18012 ) ( IS-CRATE ?auto_18013 ) ( AVAILABLE ?auto_18024 ) ( not ( = ?auto_18033 ?auto_18021 ) ) ( HOIST-AT ?auto_18037 ?auto_18033 ) ( AVAILABLE ?auto_18037 ) ( SURFACE-AT ?auto_18013 ?auto_18033 ) ( ON ?auto_18013 ?auto_18030 ) ( CLEAR ?auto_18013 ) ( TRUCK-AT ?auto_18022 ?auto_18021 ) ( not ( = ?auto_18012 ?auto_18013 ) ) ( not ( = ?auto_18012 ?auto_18030 ) ) ( not ( = ?auto_18013 ?auto_18030 ) ) ( not ( = ?auto_18024 ?auto_18037 ) ) ( not ( = ?auto_18012 ?auto_18014 ) ) ( not ( = ?auto_18012 ?auto_18036 ) ) ( not ( = ?auto_18014 ?auto_18030 ) ) ( not ( = ?auto_18038 ?auto_18033 ) ) ( not ( = ?auto_18029 ?auto_18037 ) ) ( not ( = ?auto_18036 ?auto_18030 ) ) ( not ( = ?auto_18012 ?auto_18015 ) ) ( not ( = ?auto_18012 ?auto_18039 ) ) ( not ( = ?auto_18013 ?auto_18015 ) ) ( not ( = ?auto_18013 ?auto_18039 ) ) ( not ( = ?auto_18015 ?auto_18036 ) ) ( not ( = ?auto_18015 ?auto_18030 ) ) ( not ( = ?auto_18044 ?auto_18038 ) ) ( not ( = ?auto_18044 ?auto_18033 ) ) ( not ( = ?auto_18040 ?auto_18029 ) ) ( not ( = ?auto_18040 ?auto_18037 ) ) ( not ( = ?auto_18039 ?auto_18036 ) ) ( not ( = ?auto_18039 ?auto_18030 ) ) ( not ( = ?auto_18012 ?auto_18016 ) ) ( not ( = ?auto_18012 ?auto_18034 ) ) ( not ( = ?auto_18013 ?auto_18016 ) ) ( not ( = ?auto_18013 ?auto_18034 ) ) ( not ( = ?auto_18014 ?auto_18016 ) ) ( not ( = ?auto_18014 ?auto_18034 ) ) ( not ( = ?auto_18016 ?auto_18039 ) ) ( not ( = ?auto_18016 ?auto_18036 ) ) ( not ( = ?auto_18016 ?auto_18030 ) ) ( not ( = ?auto_18032 ?auto_18044 ) ) ( not ( = ?auto_18032 ?auto_18038 ) ) ( not ( = ?auto_18032 ?auto_18033 ) ) ( not ( = ?auto_18035 ?auto_18040 ) ) ( not ( = ?auto_18035 ?auto_18029 ) ) ( not ( = ?auto_18035 ?auto_18037 ) ) ( not ( = ?auto_18034 ?auto_18039 ) ) ( not ( = ?auto_18034 ?auto_18036 ) ) ( not ( = ?auto_18034 ?auto_18030 ) ) ( not ( = ?auto_18012 ?auto_18018 ) ) ( not ( = ?auto_18012 ?auto_18045 ) ) ( not ( = ?auto_18013 ?auto_18018 ) ) ( not ( = ?auto_18013 ?auto_18045 ) ) ( not ( = ?auto_18014 ?auto_18018 ) ) ( not ( = ?auto_18014 ?auto_18045 ) ) ( not ( = ?auto_18015 ?auto_18018 ) ) ( not ( = ?auto_18015 ?auto_18045 ) ) ( not ( = ?auto_18018 ?auto_18034 ) ) ( not ( = ?auto_18018 ?auto_18039 ) ) ( not ( = ?auto_18018 ?auto_18036 ) ) ( not ( = ?auto_18018 ?auto_18030 ) ) ( not ( = ?auto_18028 ?auto_18032 ) ) ( not ( = ?auto_18028 ?auto_18044 ) ) ( not ( = ?auto_18028 ?auto_18038 ) ) ( not ( = ?auto_18028 ?auto_18033 ) ) ( not ( = ?auto_18031 ?auto_18035 ) ) ( not ( = ?auto_18031 ?auto_18040 ) ) ( not ( = ?auto_18031 ?auto_18029 ) ) ( not ( = ?auto_18031 ?auto_18037 ) ) ( not ( = ?auto_18045 ?auto_18034 ) ) ( not ( = ?auto_18045 ?auto_18039 ) ) ( not ( = ?auto_18045 ?auto_18036 ) ) ( not ( = ?auto_18045 ?auto_18030 ) ) ( not ( = ?auto_18012 ?auto_18017 ) ) ( not ( = ?auto_18012 ?auto_18043 ) ) ( not ( = ?auto_18013 ?auto_18017 ) ) ( not ( = ?auto_18013 ?auto_18043 ) ) ( not ( = ?auto_18014 ?auto_18017 ) ) ( not ( = ?auto_18014 ?auto_18043 ) ) ( not ( = ?auto_18015 ?auto_18017 ) ) ( not ( = ?auto_18015 ?auto_18043 ) ) ( not ( = ?auto_18016 ?auto_18017 ) ) ( not ( = ?auto_18016 ?auto_18043 ) ) ( not ( = ?auto_18017 ?auto_18045 ) ) ( not ( = ?auto_18017 ?auto_18034 ) ) ( not ( = ?auto_18017 ?auto_18039 ) ) ( not ( = ?auto_18017 ?auto_18036 ) ) ( not ( = ?auto_18017 ?auto_18030 ) ) ( not ( = ?auto_18043 ?auto_18045 ) ) ( not ( = ?auto_18043 ?auto_18034 ) ) ( not ( = ?auto_18043 ?auto_18039 ) ) ( not ( = ?auto_18043 ?auto_18036 ) ) ( not ( = ?auto_18043 ?auto_18030 ) ) ( not ( = ?auto_18012 ?auto_18020 ) ) ( not ( = ?auto_18012 ?auto_18042 ) ) ( not ( = ?auto_18013 ?auto_18020 ) ) ( not ( = ?auto_18013 ?auto_18042 ) ) ( not ( = ?auto_18014 ?auto_18020 ) ) ( not ( = ?auto_18014 ?auto_18042 ) ) ( not ( = ?auto_18015 ?auto_18020 ) ) ( not ( = ?auto_18015 ?auto_18042 ) ) ( not ( = ?auto_18016 ?auto_18020 ) ) ( not ( = ?auto_18016 ?auto_18042 ) ) ( not ( = ?auto_18018 ?auto_18020 ) ) ( not ( = ?auto_18018 ?auto_18042 ) ) ( not ( = ?auto_18020 ?auto_18043 ) ) ( not ( = ?auto_18020 ?auto_18045 ) ) ( not ( = ?auto_18020 ?auto_18034 ) ) ( not ( = ?auto_18020 ?auto_18039 ) ) ( not ( = ?auto_18020 ?auto_18036 ) ) ( not ( = ?auto_18020 ?auto_18030 ) ) ( not ( = ?auto_18041 ?auto_18044 ) ) ( not ( = ?auto_18041 ?auto_18028 ) ) ( not ( = ?auto_18041 ?auto_18032 ) ) ( not ( = ?auto_18041 ?auto_18038 ) ) ( not ( = ?auto_18041 ?auto_18033 ) ) ( not ( = ?auto_18027 ?auto_18040 ) ) ( not ( = ?auto_18027 ?auto_18031 ) ) ( not ( = ?auto_18027 ?auto_18035 ) ) ( not ( = ?auto_18027 ?auto_18029 ) ) ( not ( = ?auto_18027 ?auto_18037 ) ) ( not ( = ?auto_18042 ?auto_18043 ) ) ( not ( = ?auto_18042 ?auto_18045 ) ) ( not ( = ?auto_18042 ?auto_18034 ) ) ( not ( = ?auto_18042 ?auto_18039 ) ) ( not ( = ?auto_18042 ?auto_18036 ) ) ( not ( = ?auto_18042 ?auto_18030 ) ) ( not ( = ?auto_18012 ?auto_18019 ) ) ( not ( = ?auto_18012 ?auto_18026 ) ) ( not ( = ?auto_18013 ?auto_18019 ) ) ( not ( = ?auto_18013 ?auto_18026 ) ) ( not ( = ?auto_18014 ?auto_18019 ) ) ( not ( = ?auto_18014 ?auto_18026 ) ) ( not ( = ?auto_18015 ?auto_18019 ) ) ( not ( = ?auto_18015 ?auto_18026 ) ) ( not ( = ?auto_18016 ?auto_18019 ) ) ( not ( = ?auto_18016 ?auto_18026 ) ) ( not ( = ?auto_18018 ?auto_18019 ) ) ( not ( = ?auto_18018 ?auto_18026 ) ) ( not ( = ?auto_18017 ?auto_18019 ) ) ( not ( = ?auto_18017 ?auto_18026 ) ) ( not ( = ?auto_18019 ?auto_18042 ) ) ( not ( = ?auto_18019 ?auto_18043 ) ) ( not ( = ?auto_18019 ?auto_18045 ) ) ( not ( = ?auto_18019 ?auto_18034 ) ) ( not ( = ?auto_18019 ?auto_18039 ) ) ( not ( = ?auto_18019 ?auto_18036 ) ) ( not ( = ?auto_18019 ?auto_18030 ) ) ( not ( = ?auto_18025 ?auto_18041 ) ) ( not ( = ?auto_18025 ?auto_18044 ) ) ( not ( = ?auto_18025 ?auto_18028 ) ) ( not ( = ?auto_18025 ?auto_18032 ) ) ( not ( = ?auto_18025 ?auto_18038 ) ) ( not ( = ?auto_18025 ?auto_18033 ) ) ( not ( = ?auto_18023 ?auto_18027 ) ) ( not ( = ?auto_18023 ?auto_18040 ) ) ( not ( = ?auto_18023 ?auto_18031 ) ) ( not ( = ?auto_18023 ?auto_18035 ) ) ( not ( = ?auto_18023 ?auto_18029 ) ) ( not ( = ?auto_18023 ?auto_18037 ) ) ( not ( = ?auto_18026 ?auto_18042 ) ) ( not ( = ?auto_18026 ?auto_18043 ) ) ( not ( = ?auto_18026 ?auto_18045 ) ) ( not ( = ?auto_18026 ?auto_18034 ) ) ( not ( = ?auto_18026 ?auto_18039 ) ) ( not ( = ?auto_18026 ?auto_18036 ) ) ( not ( = ?auto_18026 ?auto_18030 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_18012 ?auto_18013 ?auto_18014 ?auto_18015 ?auto_18016 ?auto_18018 ?auto_18017 ?auto_18020 )
      ( MAKE-1CRATE ?auto_18020 ?auto_18019 )
      ( MAKE-8CRATE-VERIFY ?auto_18012 ?auto_18013 ?auto_18014 ?auto_18015 ?auto_18016 ?auto_18018 ?auto_18017 ?auto_18020 ?auto_18019 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18048 - SURFACE
      ?auto_18049 - SURFACE
    )
    :vars
    (
      ?auto_18050 - HOIST
      ?auto_18051 - PLACE
      ?auto_18053 - PLACE
      ?auto_18054 - HOIST
      ?auto_18055 - SURFACE
      ?auto_18052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18050 ?auto_18051 ) ( SURFACE-AT ?auto_18048 ?auto_18051 ) ( CLEAR ?auto_18048 ) ( IS-CRATE ?auto_18049 ) ( AVAILABLE ?auto_18050 ) ( not ( = ?auto_18053 ?auto_18051 ) ) ( HOIST-AT ?auto_18054 ?auto_18053 ) ( AVAILABLE ?auto_18054 ) ( SURFACE-AT ?auto_18049 ?auto_18053 ) ( ON ?auto_18049 ?auto_18055 ) ( CLEAR ?auto_18049 ) ( TRUCK-AT ?auto_18052 ?auto_18051 ) ( not ( = ?auto_18048 ?auto_18049 ) ) ( not ( = ?auto_18048 ?auto_18055 ) ) ( not ( = ?auto_18049 ?auto_18055 ) ) ( not ( = ?auto_18050 ?auto_18054 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18052 ?auto_18051 ?auto_18053 )
      ( !LIFT ?auto_18054 ?auto_18049 ?auto_18055 ?auto_18053 )
      ( !LOAD ?auto_18054 ?auto_18049 ?auto_18052 ?auto_18053 )
      ( !DRIVE ?auto_18052 ?auto_18053 ?auto_18051 )
      ( !UNLOAD ?auto_18050 ?auto_18049 ?auto_18052 ?auto_18051 )
      ( !DROP ?auto_18050 ?auto_18049 ?auto_18048 ?auto_18051 )
      ( MAKE-1CRATE-VERIFY ?auto_18048 ?auto_18049 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_18066 - SURFACE
      ?auto_18067 - SURFACE
      ?auto_18068 - SURFACE
      ?auto_18069 - SURFACE
      ?auto_18070 - SURFACE
      ?auto_18073 - SURFACE
      ?auto_18071 - SURFACE
      ?auto_18075 - SURFACE
      ?auto_18074 - SURFACE
      ?auto_18072 - SURFACE
    )
    :vars
    (
      ?auto_18077 - HOIST
      ?auto_18079 - PLACE
      ?auto_18081 - PLACE
      ?auto_18076 - HOIST
      ?auto_18080 - SURFACE
      ?auto_18085 - PLACE
      ?auto_18082 - HOIST
      ?auto_18088 - SURFACE
      ?auto_18083 - PLACE
      ?auto_18101 - HOIST
      ?auto_18089 - SURFACE
      ?auto_18102 - PLACE
      ?auto_18093 - HOIST
      ?auto_18100 - SURFACE
      ?auto_18084 - PLACE
      ?auto_18097 - HOIST
      ?auto_18098 - SURFACE
      ?auto_18096 - PLACE
      ?auto_18103 - HOIST
      ?auto_18094 - SURFACE
      ?auto_18092 - SURFACE
      ?auto_18091 - PLACE
      ?auto_18087 - HOIST
      ?auto_18090 - SURFACE
      ?auto_18095 - PLACE
      ?auto_18099 - HOIST
      ?auto_18086 - SURFACE
      ?auto_18078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18077 ?auto_18079 ) ( IS-CRATE ?auto_18072 ) ( not ( = ?auto_18081 ?auto_18079 ) ) ( HOIST-AT ?auto_18076 ?auto_18081 ) ( AVAILABLE ?auto_18076 ) ( SURFACE-AT ?auto_18072 ?auto_18081 ) ( ON ?auto_18072 ?auto_18080 ) ( CLEAR ?auto_18072 ) ( not ( = ?auto_18074 ?auto_18072 ) ) ( not ( = ?auto_18074 ?auto_18080 ) ) ( not ( = ?auto_18072 ?auto_18080 ) ) ( not ( = ?auto_18077 ?auto_18076 ) ) ( IS-CRATE ?auto_18074 ) ( not ( = ?auto_18085 ?auto_18079 ) ) ( HOIST-AT ?auto_18082 ?auto_18085 ) ( AVAILABLE ?auto_18082 ) ( SURFACE-AT ?auto_18074 ?auto_18085 ) ( ON ?auto_18074 ?auto_18088 ) ( CLEAR ?auto_18074 ) ( not ( = ?auto_18075 ?auto_18074 ) ) ( not ( = ?auto_18075 ?auto_18088 ) ) ( not ( = ?auto_18074 ?auto_18088 ) ) ( not ( = ?auto_18077 ?auto_18082 ) ) ( IS-CRATE ?auto_18075 ) ( not ( = ?auto_18083 ?auto_18079 ) ) ( HOIST-AT ?auto_18101 ?auto_18083 ) ( AVAILABLE ?auto_18101 ) ( SURFACE-AT ?auto_18075 ?auto_18083 ) ( ON ?auto_18075 ?auto_18089 ) ( CLEAR ?auto_18075 ) ( not ( = ?auto_18071 ?auto_18075 ) ) ( not ( = ?auto_18071 ?auto_18089 ) ) ( not ( = ?auto_18075 ?auto_18089 ) ) ( not ( = ?auto_18077 ?auto_18101 ) ) ( IS-CRATE ?auto_18071 ) ( not ( = ?auto_18102 ?auto_18079 ) ) ( HOIST-AT ?auto_18093 ?auto_18102 ) ( SURFACE-AT ?auto_18071 ?auto_18102 ) ( ON ?auto_18071 ?auto_18100 ) ( CLEAR ?auto_18071 ) ( not ( = ?auto_18073 ?auto_18071 ) ) ( not ( = ?auto_18073 ?auto_18100 ) ) ( not ( = ?auto_18071 ?auto_18100 ) ) ( not ( = ?auto_18077 ?auto_18093 ) ) ( IS-CRATE ?auto_18073 ) ( not ( = ?auto_18084 ?auto_18079 ) ) ( HOIST-AT ?auto_18097 ?auto_18084 ) ( AVAILABLE ?auto_18097 ) ( SURFACE-AT ?auto_18073 ?auto_18084 ) ( ON ?auto_18073 ?auto_18098 ) ( CLEAR ?auto_18073 ) ( not ( = ?auto_18070 ?auto_18073 ) ) ( not ( = ?auto_18070 ?auto_18098 ) ) ( not ( = ?auto_18073 ?auto_18098 ) ) ( not ( = ?auto_18077 ?auto_18097 ) ) ( IS-CRATE ?auto_18070 ) ( not ( = ?auto_18096 ?auto_18079 ) ) ( HOIST-AT ?auto_18103 ?auto_18096 ) ( AVAILABLE ?auto_18103 ) ( SURFACE-AT ?auto_18070 ?auto_18096 ) ( ON ?auto_18070 ?auto_18094 ) ( CLEAR ?auto_18070 ) ( not ( = ?auto_18069 ?auto_18070 ) ) ( not ( = ?auto_18069 ?auto_18094 ) ) ( not ( = ?auto_18070 ?auto_18094 ) ) ( not ( = ?auto_18077 ?auto_18103 ) ) ( IS-CRATE ?auto_18069 ) ( AVAILABLE ?auto_18093 ) ( SURFACE-AT ?auto_18069 ?auto_18102 ) ( ON ?auto_18069 ?auto_18092 ) ( CLEAR ?auto_18069 ) ( not ( = ?auto_18068 ?auto_18069 ) ) ( not ( = ?auto_18068 ?auto_18092 ) ) ( not ( = ?auto_18069 ?auto_18092 ) ) ( IS-CRATE ?auto_18068 ) ( not ( = ?auto_18091 ?auto_18079 ) ) ( HOIST-AT ?auto_18087 ?auto_18091 ) ( AVAILABLE ?auto_18087 ) ( SURFACE-AT ?auto_18068 ?auto_18091 ) ( ON ?auto_18068 ?auto_18090 ) ( CLEAR ?auto_18068 ) ( not ( = ?auto_18067 ?auto_18068 ) ) ( not ( = ?auto_18067 ?auto_18090 ) ) ( not ( = ?auto_18068 ?auto_18090 ) ) ( not ( = ?auto_18077 ?auto_18087 ) ) ( SURFACE-AT ?auto_18066 ?auto_18079 ) ( CLEAR ?auto_18066 ) ( IS-CRATE ?auto_18067 ) ( AVAILABLE ?auto_18077 ) ( not ( = ?auto_18095 ?auto_18079 ) ) ( HOIST-AT ?auto_18099 ?auto_18095 ) ( AVAILABLE ?auto_18099 ) ( SURFACE-AT ?auto_18067 ?auto_18095 ) ( ON ?auto_18067 ?auto_18086 ) ( CLEAR ?auto_18067 ) ( TRUCK-AT ?auto_18078 ?auto_18079 ) ( not ( = ?auto_18066 ?auto_18067 ) ) ( not ( = ?auto_18066 ?auto_18086 ) ) ( not ( = ?auto_18067 ?auto_18086 ) ) ( not ( = ?auto_18077 ?auto_18099 ) ) ( not ( = ?auto_18066 ?auto_18068 ) ) ( not ( = ?auto_18066 ?auto_18090 ) ) ( not ( = ?auto_18068 ?auto_18086 ) ) ( not ( = ?auto_18091 ?auto_18095 ) ) ( not ( = ?auto_18087 ?auto_18099 ) ) ( not ( = ?auto_18090 ?auto_18086 ) ) ( not ( = ?auto_18066 ?auto_18069 ) ) ( not ( = ?auto_18066 ?auto_18092 ) ) ( not ( = ?auto_18067 ?auto_18069 ) ) ( not ( = ?auto_18067 ?auto_18092 ) ) ( not ( = ?auto_18069 ?auto_18090 ) ) ( not ( = ?auto_18069 ?auto_18086 ) ) ( not ( = ?auto_18102 ?auto_18091 ) ) ( not ( = ?auto_18102 ?auto_18095 ) ) ( not ( = ?auto_18093 ?auto_18087 ) ) ( not ( = ?auto_18093 ?auto_18099 ) ) ( not ( = ?auto_18092 ?auto_18090 ) ) ( not ( = ?auto_18092 ?auto_18086 ) ) ( not ( = ?auto_18066 ?auto_18070 ) ) ( not ( = ?auto_18066 ?auto_18094 ) ) ( not ( = ?auto_18067 ?auto_18070 ) ) ( not ( = ?auto_18067 ?auto_18094 ) ) ( not ( = ?auto_18068 ?auto_18070 ) ) ( not ( = ?auto_18068 ?auto_18094 ) ) ( not ( = ?auto_18070 ?auto_18092 ) ) ( not ( = ?auto_18070 ?auto_18090 ) ) ( not ( = ?auto_18070 ?auto_18086 ) ) ( not ( = ?auto_18096 ?auto_18102 ) ) ( not ( = ?auto_18096 ?auto_18091 ) ) ( not ( = ?auto_18096 ?auto_18095 ) ) ( not ( = ?auto_18103 ?auto_18093 ) ) ( not ( = ?auto_18103 ?auto_18087 ) ) ( not ( = ?auto_18103 ?auto_18099 ) ) ( not ( = ?auto_18094 ?auto_18092 ) ) ( not ( = ?auto_18094 ?auto_18090 ) ) ( not ( = ?auto_18094 ?auto_18086 ) ) ( not ( = ?auto_18066 ?auto_18073 ) ) ( not ( = ?auto_18066 ?auto_18098 ) ) ( not ( = ?auto_18067 ?auto_18073 ) ) ( not ( = ?auto_18067 ?auto_18098 ) ) ( not ( = ?auto_18068 ?auto_18073 ) ) ( not ( = ?auto_18068 ?auto_18098 ) ) ( not ( = ?auto_18069 ?auto_18073 ) ) ( not ( = ?auto_18069 ?auto_18098 ) ) ( not ( = ?auto_18073 ?auto_18094 ) ) ( not ( = ?auto_18073 ?auto_18092 ) ) ( not ( = ?auto_18073 ?auto_18090 ) ) ( not ( = ?auto_18073 ?auto_18086 ) ) ( not ( = ?auto_18084 ?auto_18096 ) ) ( not ( = ?auto_18084 ?auto_18102 ) ) ( not ( = ?auto_18084 ?auto_18091 ) ) ( not ( = ?auto_18084 ?auto_18095 ) ) ( not ( = ?auto_18097 ?auto_18103 ) ) ( not ( = ?auto_18097 ?auto_18093 ) ) ( not ( = ?auto_18097 ?auto_18087 ) ) ( not ( = ?auto_18097 ?auto_18099 ) ) ( not ( = ?auto_18098 ?auto_18094 ) ) ( not ( = ?auto_18098 ?auto_18092 ) ) ( not ( = ?auto_18098 ?auto_18090 ) ) ( not ( = ?auto_18098 ?auto_18086 ) ) ( not ( = ?auto_18066 ?auto_18071 ) ) ( not ( = ?auto_18066 ?auto_18100 ) ) ( not ( = ?auto_18067 ?auto_18071 ) ) ( not ( = ?auto_18067 ?auto_18100 ) ) ( not ( = ?auto_18068 ?auto_18071 ) ) ( not ( = ?auto_18068 ?auto_18100 ) ) ( not ( = ?auto_18069 ?auto_18071 ) ) ( not ( = ?auto_18069 ?auto_18100 ) ) ( not ( = ?auto_18070 ?auto_18071 ) ) ( not ( = ?auto_18070 ?auto_18100 ) ) ( not ( = ?auto_18071 ?auto_18098 ) ) ( not ( = ?auto_18071 ?auto_18094 ) ) ( not ( = ?auto_18071 ?auto_18092 ) ) ( not ( = ?auto_18071 ?auto_18090 ) ) ( not ( = ?auto_18071 ?auto_18086 ) ) ( not ( = ?auto_18100 ?auto_18098 ) ) ( not ( = ?auto_18100 ?auto_18094 ) ) ( not ( = ?auto_18100 ?auto_18092 ) ) ( not ( = ?auto_18100 ?auto_18090 ) ) ( not ( = ?auto_18100 ?auto_18086 ) ) ( not ( = ?auto_18066 ?auto_18075 ) ) ( not ( = ?auto_18066 ?auto_18089 ) ) ( not ( = ?auto_18067 ?auto_18075 ) ) ( not ( = ?auto_18067 ?auto_18089 ) ) ( not ( = ?auto_18068 ?auto_18075 ) ) ( not ( = ?auto_18068 ?auto_18089 ) ) ( not ( = ?auto_18069 ?auto_18075 ) ) ( not ( = ?auto_18069 ?auto_18089 ) ) ( not ( = ?auto_18070 ?auto_18075 ) ) ( not ( = ?auto_18070 ?auto_18089 ) ) ( not ( = ?auto_18073 ?auto_18075 ) ) ( not ( = ?auto_18073 ?auto_18089 ) ) ( not ( = ?auto_18075 ?auto_18100 ) ) ( not ( = ?auto_18075 ?auto_18098 ) ) ( not ( = ?auto_18075 ?auto_18094 ) ) ( not ( = ?auto_18075 ?auto_18092 ) ) ( not ( = ?auto_18075 ?auto_18090 ) ) ( not ( = ?auto_18075 ?auto_18086 ) ) ( not ( = ?auto_18083 ?auto_18102 ) ) ( not ( = ?auto_18083 ?auto_18084 ) ) ( not ( = ?auto_18083 ?auto_18096 ) ) ( not ( = ?auto_18083 ?auto_18091 ) ) ( not ( = ?auto_18083 ?auto_18095 ) ) ( not ( = ?auto_18101 ?auto_18093 ) ) ( not ( = ?auto_18101 ?auto_18097 ) ) ( not ( = ?auto_18101 ?auto_18103 ) ) ( not ( = ?auto_18101 ?auto_18087 ) ) ( not ( = ?auto_18101 ?auto_18099 ) ) ( not ( = ?auto_18089 ?auto_18100 ) ) ( not ( = ?auto_18089 ?auto_18098 ) ) ( not ( = ?auto_18089 ?auto_18094 ) ) ( not ( = ?auto_18089 ?auto_18092 ) ) ( not ( = ?auto_18089 ?auto_18090 ) ) ( not ( = ?auto_18089 ?auto_18086 ) ) ( not ( = ?auto_18066 ?auto_18074 ) ) ( not ( = ?auto_18066 ?auto_18088 ) ) ( not ( = ?auto_18067 ?auto_18074 ) ) ( not ( = ?auto_18067 ?auto_18088 ) ) ( not ( = ?auto_18068 ?auto_18074 ) ) ( not ( = ?auto_18068 ?auto_18088 ) ) ( not ( = ?auto_18069 ?auto_18074 ) ) ( not ( = ?auto_18069 ?auto_18088 ) ) ( not ( = ?auto_18070 ?auto_18074 ) ) ( not ( = ?auto_18070 ?auto_18088 ) ) ( not ( = ?auto_18073 ?auto_18074 ) ) ( not ( = ?auto_18073 ?auto_18088 ) ) ( not ( = ?auto_18071 ?auto_18074 ) ) ( not ( = ?auto_18071 ?auto_18088 ) ) ( not ( = ?auto_18074 ?auto_18089 ) ) ( not ( = ?auto_18074 ?auto_18100 ) ) ( not ( = ?auto_18074 ?auto_18098 ) ) ( not ( = ?auto_18074 ?auto_18094 ) ) ( not ( = ?auto_18074 ?auto_18092 ) ) ( not ( = ?auto_18074 ?auto_18090 ) ) ( not ( = ?auto_18074 ?auto_18086 ) ) ( not ( = ?auto_18085 ?auto_18083 ) ) ( not ( = ?auto_18085 ?auto_18102 ) ) ( not ( = ?auto_18085 ?auto_18084 ) ) ( not ( = ?auto_18085 ?auto_18096 ) ) ( not ( = ?auto_18085 ?auto_18091 ) ) ( not ( = ?auto_18085 ?auto_18095 ) ) ( not ( = ?auto_18082 ?auto_18101 ) ) ( not ( = ?auto_18082 ?auto_18093 ) ) ( not ( = ?auto_18082 ?auto_18097 ) ) ( not ( = ?auto_18082 ?auto_18103 ) ) ( not ( = ?auto_18082 ?auto_18087 ) ) ( not ( = ?auto_18082 ?auto_18099 ) ) ( not ( = ?auto_18088 ?auto_18089 ) ) ( not ( = ?auto_18088 ?auto_18100 ) ) ( not ( = ?auto_18088 ?auto_18098 ) ) ( not ( = ?auto_18088 ?auto_18094 ) ) ( not ( = ?auto_18088 ?auto_18092 ) ) ( not ( = ?auto_18088 ?auto_18090 ) ) ( not ( = ?auto_18088 ?auto_18086 ) ) ( not ( = ?auto_18066 ?auto_18072 ) ) ( not ( = ?auto_18066 ?auto_18080 ) ) ( not ( = ?auto_18067 ?auto_18072 ) ) ( not ( = ?auto_18067 ?auto_18080 ) ) ( not ( = ?auto_18068 ?auto_18072 ) ) ( not ( = ?auto_18068 ?auto_18080 ) ) ( not ( = ?auto_18069 ?auto_18072 ) ) ( not ( = ?auto_18069 ?auto_18080 ) ) ( not ( = ?auto_18070 ?auto_18072 ) ) ( not ( = ?auto_18070 ?auto_18080 ) ) ( not ( = ?auto_18073 ?auto_18072 ) ) ( not ( = ?auto_18073 ?auto_18080 ) ) ( not ( = ?auto_18071 ?auto_18072 ) ) ( not ( = ?auto_18071 ?auto_18080 ) ) ( not ( = ?auto_18075 ?auto_18072 ) ) ( not ( = ?auto_18075 ?auto_18080 ) ) ( not ( = ?auto_18072 ?auto_18088 ) ) ( not ( = ?auto_18072 ?auto_18089 ) ) ( not ( = ?auto_18072 ?auto_18100 ) ) ( not ( = ?auto_18072 ?auto_18098 ) ) ( not ( = ?auto_18072 ?auto_18094 ) ) ( not ( = ?auto_18072 ?auto_18092 ) ) ( not ( = ?auto_18072 ?auto_18090 ) ) ( not ( = ?auto_18072 ?auto_18086 ) ) ( not ( = ?auto_18081 ?auto_18085 ) ) ( not ( = ?auto_18081 ?auto_18083 ) ) ( not ( = ?auto_18081 ?auto_18102 ) ) ( not ( = ?auto_18081 ?auto_18084 ) ) ( not ( = ?auto_18081 ?auto_18096 ) ) ( not ( = ?auto_18081 ?auto_18091 ) ) ( not ( = ?auto_18081 ?auto_18095 ) ) ( not ( = ?auto_18076 ?auto_18082 ) ) ( not ( = ?auto_18076 ?auto_18101 ) ) ( not ( = ?auto_18076 ?auto_18093 ) ) ( not ( = ?auto_18076 ?auto_18097 ) ) ( not ( = ?auto_18076 ?auto_18103 ) ) ( not ( = ?auto_18076 ?auto_18087 ) ) ( not ( = ?auto_18076 ?auto_18099 ) ) ( not ( = ?auto_18080 ?auto_18088 ) ) ( not ( = ?auto_18080 ?auto_18089 ) ) ( not ( = ?auto_18080 ?auto_18100 ) ) ( not ( = ?auto_18080 ?auto_18098 ) ) ( not ( = ?auto_18080 ?auto_18094 ) ) ( not ( = ?auto_18080 ?auto_18092 ) ) ( not ( = ?auto_18080 ?auto_18090 ) ) ( not ( = ?auto_18080 ?auto_18086 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_18066 ?auto_18067 ?auto_18068 ?auto_18069 ?auto_18070 ?auto_18073 ?auto_18071 ?auto_18075 ?auto_18074 )
      ( MAKE-1CRATE ?auto_18074 ?auto_18072 )
      ( MAKE-9CRATE-VERIFY ?auto_18066 ?auto_18067 ?auto_18068 ?auto_18069 ?auto_18070 ?auto_18073 ?auto_18071 ?auto_18075 ?auto_18074 ?auto_18072 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18106 - SURFACE
      ?auto_18107 - SURFACE
    )
    :vars
    (
      ?auto_18108 - HOIST
      ?auto_18109 - PLACE
      ?auto_18111 - PLACE
      ?auto_18112 - HOIST
      ?auto_18113 - SURFACE
      ?auto_18110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18108 ?auto_18109 ) ( SURFACE-AT ?auto_18106 ?auto_18109 ) ( CLEAR ?auto_18106 ) ( IS-CRATE ?auto_18107 ) ( AVAILABLE ?auto_18108 ) ( not ( = ?auto_18111 ?auto_18109 ) ) ( HOIST-AT ?auto_18112 ?auto_18111 ) ( AVAILABLE ?auto_18112 ) ( SURFACE-AT ?auto_18107 ?auto_18111 ) ( ON ?auto_18107 ?auto_18113 ) ( CLEAR ?auto_18107 ) ( TRUCK-AT ?auto_18110 ?auto_18109 ) ( not ( = ?auto_18106 ?auto_18107 ) ) ( not ( = ?auto_18106 ?auto_18113 ) ) ( not ( = ?auto_18107 ?auto_18113 ) ) ( not ( = ?auto_18108 ?auto_18112 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18110 ?auto_18109 ?auto_18111 )
      ( !LIFT ?auto_18112 ?auto_18107 ?auto_18113 ?auto_18111 )
      ( !LOAD ?auto_18112 ?auto_18107 ?auto_18110 ?auto_18111 )
      ( !DRIVE ?auto_18110 ?auto_18111 ?auto_18109 )
      ( !UNLOAD ?auto_18108 ?auto_18107 ?auto_18110 ?auto_18109 )
      ( !DROP ?auto_18108 ?auto_18107 ?auto_18106 ?auto_18109 )
      ( MAKE-1CRATE-VERIFY ?auto_18106 ?auto_18107 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_18125 - SURFACE
      ?auto_18126 - SURFACE
      ?auto_18127 - SURFACE
      ?auto_18128 - SURFACE
      ?auto_18129 - SURFACE
      ?auto_18132 - SURFACE
      ?auto_18130 - SURFACE
      ?auto_18134 - SURFACE
      ?auto_18133 - SURFACE
      ?auto_18131 - SURFACE
      ?auto_18135 - SURFACE
    )
    :vars
    (
      ?auto_18138 - HOIST
      ?auto_18139 - PLACE
      ?auto_18137 - PLACE
      ?auto_18136 - HOIST
      ?auto_18141 - SURFACE
      ?auto_18146 - PLACE
      ?auto_18144 - HOIST
      ?auto_18161 - SURFACE
      ?auto_18156 - PLACE
      ?auto_18157 - HOIST
      ?auto_18162 - SURFACE
      ?auto_18159 - SURFACE
      ?auto_18147 - PLACE
      ?auto_18152 - HOIST
      ?auto_18160 - SURFACE
      ?auto_18149 - PLACE
      ?auto_18153 - HOIST
      ?auto_18148 - SURFACE
      ?auto_18151 - PLACE
      ?auto_18145 - HOIST
      ?auto_18154 - SURFACE
      ?auto_18150 - SURFACE
      ?auto_18158 - PLACE
      ?auto_18163 - HOIST
      ?auto_18143 - SURFACE
      ?auto_18142 - PLACE
      ?auto_18155 - HOIST
      ?auto_18164 - SURFACE
      ?auto_18140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18138 ?auto_18139 ) ( IS-CRATE ?auto_18135 ) ( not ( = ?auto_18137 ?auto_18139 ) ) ( HOIST-AT ?auto_18136 ?auto_18137 ) ( SURFACE-AT ?auto_18135 ?auto_18137 ) ( ON ?auto_18135 ?auto_18141 ) ( CLEAR ?auto_18135 ) ( not ( = ?auto_18131 ?auto_18135 ) ) ( not ( = ?auto_18131 ?auto_18141 ) ) ( not ( = ?auto_18135 ?auto_18141 ) ) ( not ( = ?auto_18138 ?auto_18136 ) ) ( IS-CRATE ?auto_18131 ) ( not ( = ?auto_18146 ?auto_18139 ) ) ( HOIST-AT ?auto_18144 ?auto_18146 ) ( AVAILABLE ?auto_18144 ) ( SURFACE-AT ?auto_18131 ?auto_18146 ) ( ON ?auto_18131 ?auto_18161 ) ( CLEAR ?auto_18131 ) ( not ( = ?auto_18133 ?auto_18131 ) ) ( not ( = ?auto_18133 ?auto_18161 ) ) ( not ( = ?auto_18131 ?auto_18161 ) ) ( not ( = ?auto_18138 ?auto_18144 ) ) ( IS-CRATE ?auto_18133 ) ( not ( = ?auto_18156 ?auto_18139 ) ) ( HOIST-AT ?auto_18157 ?auto_18156 ) ( AVAILABLE ?auto_18157 ) ( SURFACE-AT ?auto_18133 ?auto_18156 ) ( ON ?auto_18133 ?auto_18162 ) ( CLEAR ?auto_18133 ) ( not ( = ?auto_18134 ?auto_18133 ) ) ( not ( = ?auto_18134 ?auto_18162 ) ) ( not ( = ?auto_18133 ?auto_18162 ) ) ( not ( = ?auto_18138 ?auto_18157 ) ) ( IS-CRATE ?auto_18134 ) ( AVAILABLE ?auto_18136 ) ( SURFACE-AT ?auto_18134 ?auto_18137 ) ( ON ?auto_18134 ?auto_18159 ) ( CLEAR ?auto_18134 ) ( not ( = ?auto_18130 ?auto_18134 ) ) ( not ( = ?auto_18130 ?auto_18159 ) ) ( not ( = ?auto_18134 ?auto_18159 ) ) ( IS-CRATE ?auto_18130 ) ( not ( = ?auto_18147 ?auto_18139 ) ) ( HOIST-AT ?auto_18152 ?auto_18147 ) ( SURFACE-AT ?auto_18130 ?auto_18147 ) ( ON ?auto_18130 ?auto_18160 ) ( CLEAR ?auto_18130 ) ( not ( = ?auto_18132 ?auto_18130 ) ) ( not ( = ?auto_18132 ?auto_18160 ) ) ( not ( = ?auto_18130 ?auto_18160 ) ) ( not ( = ?auto_18138 ?auto_18152 ) ) ( IS-CRATE ?auto_18132 ) ( not ( = ?auto_18149 ?auto_18139 ) ) ( HOIST-AT ?auto_18153 ?auto_18149 ) ( AVAILABLE ?auto_18153 ) ( SURFACE-AT ?auto_18132 ?auto_18149 ) ( ON ?auto_18132 ?auto_18148 ) ( CLEAR ?auto_18132 ) ( not ( = ?auto_18129 ?auto_18132 ) ) ( not ( = ?auto_18129 ?auto_18148 ) ) ( not ( = ?auto_18132 ?auto_18148 ) ) ( not ( = ?auto_18138 ?auto_18153 ) ) ( IS-CRATE ?auto_18129 ) ( not ( = ?auto_18151 ?auto_18139 ) ) ( HOIST-AT ?auto_18145 ?auto_18151 ) ( AVAILABLE ?auto_18145 ) ( SURFACE-AT ?auto_18129 ?auto_18151 ) ( ON ?auto_18129 ?auto_18154 ) ( CLEAR ?auto_18129 ) ( not ( = ?auto_18128 ?auto_18129 ) ) ( not ( = ?auto_18128 ?auto_18154 ) ) ( not ( = ?auto_18129 ?auto_18154 ) ) ( not ( = ?auto_18138 ?auto_18145 ) ) ( IS-CRATE ?auto_18128 ) ( AVAILABLE ?auto_18152 ) ( SURFACE-AT ?auto_18128 ?auto_18147 ) ( ON ?auto_18128 ?auto_18150 ) ( CLEAR ?auto_18128 ) ( not ( = ?auto_18127 ?auto_18128 ) ) ( not ( = ?auto_18127 ?auto_18150 ) ) ( not ( = ?auto_18128 ?auto_18150 ) ) ( IS-CRATE ?auto_18127 ) ( not ( = ?auto_18158 ?auto_18139 ) ) ( HOIST-AT ?auto_18163 ?auto_18158 ) ( AVAILABLE ?auto_18163 ) ( SURFACE-AT ?auto_18127 ?auto_18158 ) ( ON ?auto_18127 ?auto_18143 ) ( CLEAR ?auto_18127 ) ( not ( = ?auto_18126 ?auto_18127 ) ) ( not ( = ?auto_18126 ?auto_18143 ) ) ( not ( = ?auto_18127 ?auto_18143 ) ) ( not ( = ?auto_18138 ?auto_18163 ) ) ( SURFACE-AT ?auto_18125 ?auto_18139 ) ( CLEAR ?auto_18125 ) ( IS-CRATE ?auto_18126 ) ( AVAILABLE ?auto_18138 ) ( not ( = ?auto_18142 ?auto_18139 ) ) ( HOIST-AT ?auto_18155 ?auto_18142 ) ( AVAILABLE ?auto_18155 ) ( SURFACE-AT ?auto_18126 ?auto_18142 ) ( ON ?auto_18126 ?auto_18164 ) ( CLEAR ?auto_18126 ) ( TRUCK-AT ?auto_18140 ?auto_18139 ) ( not ( = ?auto_18125 ?auto_18126 ) ) ( not ( = ?auto_18125 ?auto_18164 ) ) ( not ( = ?auto_18126 ?auto_18164 ) ) ( not ( = ?auto_18138 ?auto_18155 ) ) ( not ( = ?auto_18125 ?auto_18127 ) ) ( not ( = ?auto_18125 ?auto_18143 ) ) ( not ( = ?auto_18127 ?auto_18164 ) ) ( not ( = ?auto_18158 ?auto_18142 ) ) ( not ( = ?auto_18163 ?auto_18155 ) ) ( not ( = ?auto_18143 ?auto_18164 ) ) ( not ( = ?auto_18125 ?auto_18128 ) ) ( not ( = ?auto_18125 ?auto_18150 ) ) ( not ( = ?auto_18126 ?auto_18128 ) ) ( not ( = ?auto_18126 ?auto_18150 ) ) ( not ( = ?auto_18128 ?auto_18143 ) ) ( not ( = ?auto_18128 ?auto_18164 ) ) ( not ( = ?auto_18147 ?auto_18158 ) ) ( not ( = ?auto_18147 ?auto_18142 ) ) ( not ( = ?auto_18152 ?auto_18163 ) ) ( not ( = ?auto_18152 ?auto_18155 ) ) ( not ( = ?auto_18150 ?auto_18143 ) ) ( not ( = ?auto_18150 ?auto_18164 ) ) ( not ( = ?auto_18125 ?auto_18129 ) ) ( not ( = ?auto_18125 ?auto_18154 ) ) ( not ( = ?auto_18126 ?auto_18129 ) ) ( not ( = ?auto_18126 ?auto_18154 ) ) ( not ( = ?auto_18127 ?auto_18129 ) ) ( not ( = ?auto_18127 ?auto_18154 ) ) ( not ( = ?auto_18129 ?auto_18150 ) ) ( not ( = ?auto_18129 ?auto_18143 ) ) ( not ( = ?auto_18129 ?auto_18164 ) ) ( not ( = ?auto_18151 ?auto_18147 ) ) ( not ( = ?auto_18151 ?auto_18158 ) ) ( not ( = ?auto_18151 ?auto_18142 ) ) ( not ( = ?auto_18145 ?auto_18152 ) ) ( not ( = ?auto_18145 ?auto_18163 ) ) ( not ( = ?auto_18145 ?auto_18155 ) ) ( not ( = ?auto_18154 ?auto_18150 ) ) ( not ( = ?auto_18154 ?auto_18143 ) ) ( not ( = ?auto_18154 ?auto_18164 ) ) ( not ( = ?auto_18125 ?auto_18132 ) ) ( not ( = ?auto_18125 ?auto_18148 ) ) ( not ( = ?auto_18126 ?auto_18132 ) ) ( not ( = ?auto_18126 ?auto_18148 ) ) ( not ( = ?auto_18127 ?auto_18132 ) ) ( not ( = ?auto_18127 ?auto_18148 ) ) ( not ( = ?auto_18128 ?auto_18132 ) ) ( not ( = ?auto_18128 ?auto_18148 ) ) ( not ( = ?auto_18132 ?auto_18154 ) ) ( not ( = ?auto_18132 ?auto_18150 ) ) ( not ( = ?auto_18132 ?auto_18143 ) ) ( not ( = ?auto_18132 ?auto_18164 ) ) ( not ( = ?auto_18149 ?auto_18151 ) ) ( not ( = ?auto_18149 ?auto_18147 ) ) ( not ( = ?auto_18149 ?auto_18158 ) ) ( not ( = ?auto_18149 ?auto_18142 ) ) ( not ( = ?auto_18153 ?auto_18145 ) ) ( not ( = ?auto_18153 ?auto_18152 ) ) ( not ( = ?auto_18153 ?auto_18163 ) ) ( not ( = ?auto_18153 ?auto_18155 ) ) ( not ( = ?auto_18148 ?auto_18154 ) ) ( not ( = ?auto_18148 ?auto_18150 ) ) ( not ( = ?auto_18148 ?auto_18143 ) ) ( not ( = ?auto_18148 ?auto_18164 ) ) ( not ( = ?auto_18125 ?auto_18130 ) ) ( not ( = ?auto_18125 ?auto_18160 ) ) ( not ( = ?auto_18126 ?auto_18130 ) ) ( not ( = ?auto_18126 ?auto_18160 ) ) ( not ( = ?auto_18127 ?auto_18130 ) ) ( not ( = ?auto_18127 ?auto_18160 ) ) ( not ( = ?auto_18128 ?auto_18130 ) ) ( not ( = ?auto_18128 ?auto_18160 ) ) ( not ( = ?auto_18129 ?auto_18130 ) ) ( not ( = ?auto_18129 ?auto_18160 ) ) ( not ( = ?auto_18130 ?auto_18148 ) ) ( not ( = ?auto_18130 ?auto_18154 ) ) ( not ( = ?auto_18130 ?auto_18150 ) ) ( not ( = ?auto_18130 ?auto_18143 ) ) ( not ( = ?auto_18130 ?auto_18164 ) ) ( not ( = ?auto_18160 ?auto_18148 ) ) ( not ( = ?auto_18160 ?auto_18154 ) ) ( not ( = ?auto_18160 ?auto_18150 ) ) ( not ( = ?auto_18160 ?auto_18143 ) ) ( not ( = ?auto_18160 ?auto_18164 ) ) ( not ( = ?auto_18125 ?auto_18134 ) ) ( not ( = ?auto_18125 ?auto_18159 ) ) ( not ( = ?auto_18126 ?auto_18134 ) ) ( not ( = ?auto_18126 ?auto_18159 ) ) ( not ( = ?auto_18127 ?auto_18134 ) ) ( not ( = ?auto_18127 ?auto_18159 ) ) ( not ( = ?auto_18128 ?auto_18134 ) ) ( not ( = ?auto_18128 ?auto_18159 ) ) ( not ( = ?auto_18129 ?auto_18134 ) ) ( not ( = ?auto_18129 ?auto_18159 ) ) ( not ( = ?auto_18132 ?auto_18134 ) ) ( not ( = ?auto_18132 ?auto_18159 ) ) ( not ( = ?auto_18134 ?auto_18160 ) ) ( not ( = ?auto_18134 ?auto_18148 ) ) ( not ( = ?auto_18134 ?auto_18154 ) ) ( not ( = ?auto_18134 ?auto_18150 ) ) ( not ( = ?auto_18134 ?auto_18143 ) ) ( not ( = ?auto_18134 ?auto_18164 ) ) ( not ( = ?auto_18137 ?auto_18147 ) ) ( not ( = ?auto_18137 ?auto_18149 ) ) ( not ( = ?auto_18137 ?auto_18151 ) ) ( not ( = ?auto_18137 ?auto_18158 ) ) ( not ( = ?auto_18137 ?auto_18142 ) ) ( not ( = ?auto_18136 ?auto_18152 ) ) ( not ( = ?auto_18136 ?auto_18153 ) ) ( not ( = ?auto_18136 ?auto_18145 ) ) ( not ( = ?auto_18136 ?auto_18163 ) ) ( not ( = ?auto_18136 ?auto_18155 ) ) ( not ( = ?auto_18159 ?auto_18160 ) ) ( not ( = ?auto_18159 ?auto_18148 ) ) ( not ( = ?auto_18159 ?auto_18154 ) ) ( not ( = ?auto_18159 ?auto_18150 ) ) ( not ( = ?auto_18159 ?auto_18143 ) ) ( not ( = ?auto_18159 ?auto_18164 ) ) ( not ( = ?auto_18125 ?auto_18133 ) ) ( not ( = ?auto_18125 ?auto_18162 ) ) ( not ( = ?auto_18126 ?auto_18133 ) ) ( not ( = ?auto_18126 ?auto_18162 ) ) ( not ( = ?auto_18127 ?auto_18133 ) ) ( not ( = ?auto_18127 ?auto_18162 ) ) ( not ( = ?auto_18128 ?auto_18133 ) ) ( not ( = ?auto_18128 ?auto_18162 ) ) ( not ( = ?auto_18129 ?auto_18133 ) ) ( not ( = ?auto_18129 ?auto_18162 ) ) ( not ( = ?auto_18132 ?auto_18133 ) ) ( not ( = ?auto_18132 ?auto_18162 ) ) ( not ( = ?auto_18130 ?auto_18133 ) ) ( not ( = ?auto_18130 ?auto_18162 ) ) ( not ( = ?auto_18133 ?auto_18159 ) ) ( not ( = ?auto_18133 ?auto_18160 ) ) ( not ( = ?auto_18133 ?auto_18148 ) ) ( not ( = ?auto_18133 ?auto_18154 ) ) ( not ( = ?auto_18133 ?auto_18150 ) ) ( not ( = ?auto_18133 ?auto_18143 ) ) ( not ( = ?auto_18133 ?auto_18164 ) ) ( not ( = ?auto_18156 ?auto_18137 ) ) ( not ( = ?auto_18156 ?auto_18147 ) ) ( not ( = ?auto_18156 ?auto_18149 ) ) ( not ( = ?auto_18156 ?auto_18151 ) ) ( not ( = ?auto_18156 ?auto_18158 ) ) ( not ( = ?auto_18156 ?auto_18142 ) ) ( not ( = ?auto_18157 ?auto_18136 ) ) ( not ( = ?auto_18157 ?auto_18152 ) ) ( not ( = ?auto_18157 ?auto_18153 ) ) ( not ( = ?auto_18157 ?auto_18145 ) ) ( not ( = ?auto_18157 ?auto_18163 ) ) ( not ( = ?auto_18157 ?auto_18155 ) ) ( not ( = ?auto_18162 ?auto_18159 ) ) ( not ( = ?auto_18162 ?auto_18160 ) ) ( not ( = ?auto_18162 ?auto_18148 ) ) ( not ( = ?auto_18162 ?auto_18154 ) ) ( not ( = ?auto_18162 ?auto_18150 ) ) ( not ( = ?auto_18162 ?auto_18143 ) ) ( not ( = ?auto_18162 ?auto_18164 ) ) ( not ( = ?auto_18125 ?auto_18131 ) ) ( not ( = ?auto_18125 ?auto_18161 ) ) ( not ( = ?auto_18126 ?auto_18131 ) ) ( not ( = ?auto_18126 ?auto_18161 ) ) ( not ( = ?auto_18127 ?auto_18131 ) ) ( not ( = ?auto_18127 ?auto_18161 ) ) ( not ( = ?auto_18128 ?auto_18131 ) ) ( not ( = ?auto_18128 ?auto_18161 ) ) ( not ( = ?auto_18129 ?auto_18131 ) ) ( not ( = ?auto_18129 ?auto_18161 ) ) ( not ( = ?auto_18132 ?auto_18131 ) ) ( not ( = ?auto_18132 ?auto_18161 ) ) ( not ( = ?auto_18130 ?auto_18131 ) ) ( not ( = ?auto_18130 ?auto_18161 ) ) ( not ( = ?auto_18134 ?auto_18131 ) ) ( not ( = ?auto_18134 ?auto_18161 ) ) ( not ( = ?auto_18131 ?auto_18162 ) ) ( not ( = ?auto_18131 ?auto_18159 ) ) ( not ( = ?auto_18131 ?auto_18160 ) ) ( not ( = ?auto_18131 ?auto_18148 ) ) ( not ( = ?auto_18131 ?auto_18154 ) ) ( not ( = ?auto_18131 ?auto_18150 ) ) ( not ( = ?auto_18131 ?auto_18143 ) ) ( not ( = ?auto_18131 ?auto_18164 ) ) ( not ( = ?auto_18146 ?auto_18156 ) ) ( not ( = ?auto_18146 ?auto_18137 ) ) ( not ( = ?auto_18146 ?auto_18147 ) ) ( not ( = ?auto_18146 ?auto_18149 ) ) ( not ( = ?auto_18146 ?auto_18151 ) ) ( not ( = ?auto_18146 ?auto_18158 ) ) ( not ( = ?auto_18146 ?auto_18142 ) ) ( not ( = ?auto_18144 ?auto_18157 ) ) ( not ( = ?auto_18144 ?auto_18136 ) ) ( not ( = ?auto_18144 ?auto_18152 ) ) ( not ( = ?auto_18144 ?auto_18153 ) ) ( not ( = ?auto_18144 ?auto_18145 ) ) ( not ( = ?auto_18144 ?auto_18163 ) ) ( not ( = ?auto_18144 ?auto_18155 ) ) ( not ( = ?auto_18161 ?auto_18162 ) ) ( not ( = ?auto_18161 ?auto_18159 ) ) ( not ( = ?auto_18161 ?auto_18160 ) ) ( not ( = ?auto_18161 ?auto_18148 ) ) ( not ( = ?auto_18161 ?auto_18154 ) ) ( not ( = ?auto_18161 ?auto_18150 ) ) ( not ( = ?auto_18161 ?auto_18143 ) ) ( not ( = ?auto_18161 ?auto_18164 ) ) ( not ( = ?auto_18125 ?auto_18135 ) ) ( not ( = ?auto_18125 ?auto_18141 ) ) ( not ( = ?auto_18126 ?auto_18135 ) ) ( not ( = ?auto_18126 ?auto_18141 ) ) ( not ( = ?auto_18127 ?auto_18135 ) ) ( not ( = ?auto_18127 ?auto_18141 ) ) ( not ( = ?auto_18128 ?auto_18135 ) ) ( not ( = ?auto_18128 ?auto_18141 ) ) ( not ( = ?auto_18129 ?auto_18135 ) ) ( not ( = ?auto_18129 ?auto_18141 ) ) ( not ( = ?auto_18132 ?auto_18135 ) ) ( not ( = ?auto_18132 ?auto_18141 ) ) ( not ( = ?auto_18130 ?auto_18135 ) ) ( not ( = ?auto_18130 ?auto_18141 ) ) ( not ( = ?auto_18134 ?auto_18135 ) ) ( not ( = ?auto_18134 ?auto_18141 ) ) ( not ( = ?auto_18133 ?auto_18135 ) ) ( not ( = ?auto_18133 ?auto_18141 ) ) ( not ( = ?auto_18135 ?auto_18161 ) ) ( not ( = ?auto_18135 ?auto_18162 ) ) ( not ( = ?auto_18135 ?auto_18159 ) ) ( not ( = ?auto_18135 ?auto_18160 ) ) ( not ( = ?auto_18135 ?auto_18148 ) ) ( not ( = ?auto_18135 ?auto_18154 ) ) ( not ( = ?auto_18135 ?auto_18150 ) ) ( not ( = ?auto_18135 ?auto_18143 ) ) ( not ( = ?auto_18135 ?auto_18164 ) ) ( not ( = ?auto_18141 ?auto_18161 ) ) ( not ( = ?auto_18141 ?auto_18162 ) ) ( not ( = ?auto_18141 ?auto_18159 ) ) ( not ( = ?auto_18141 ?auto_18160 ) ) ( not ( = ?auto_18141 ?auto_18148 ) ) ( not ( = ?auto_18141 ?auto_18154 ) ) ( not ( = ?auto_18141 ?auto_18150 ) ) ( not ( = ?auto_18141 ?auto_18143 ) ) ( not ( = ?auto_18141 ?auto_18164 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_18125 ?auto_18126 ?auto_18127 ?auto_18128 ?auto_18129 ?auto_18132 ?auto_18130 ?auto_18134 ?auto_18133 ?auto_18131 )
      ( MAKE-1CRATE ?auto_18131 ?auto_18135 )
      ( MAKE-10CRATE-VERIFY ?auto_18125 ?auto_18126 ?auto_18127 ?auto_18128 ?auto_18129 ?auto_18132 ?auto_18130 ?auto_18134 ?auto_18133 ?auto_18131 ?auto_18135 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18167 - SURFACE
      ?auto_18168 - SURFACE
    )
    :vars
    (
      ?auto_18169 - HOIST
      ?auto_18170 - PLACE
      ?auto_18172 - PLACE
      ?auto_18173 - HOIST
      ?auto_18174 - SURFACE
      ?auto_18171 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18169 ?auto_18170 ) ( SURFACE-AT ?auto_18167 ?auto_18170 ) ( CLEAR ?auto_18167 ) ( IS-CRATE ?auto_18168 ) ( AVAILABLE ?auto_18169 ) ( not ( = ?auto_18172 ?auto_18170 ) ) ( HOIST-AT ?auto_18173 ?auto_18172 ) ( AVAILABLE ?auto_18173 ) ( SURFACE-AT ?auto_18168 ?auto_18172 ) ( ON ?auto_18168 ?auto_18174 ) ( CLEAR ?auto_18168 ) ( TRUCK-AT ?auto_18171 ?auto_18170 ) ( not ( = ?auto_18167 ?auto_18168 ) ) ( not ( = ?auto_18167 ?auto_18174 ) ) ( not ( = ?auto_18168 ?auto_18174 ) ) ( not ( = ?auto_18169 ?auto_18173 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18171 ?auto_18170 ?auto_18172 )
      ( !LIFT ?auto_18173 ?auto_18168 ?auto_18174 ?auto_18172 )
      ( !LOAD ?auto_18173 ?auto_18168 ?auto_18171 ?auto_18172 )
      ( !DRIVE ?auto_18171 ?auto_18172 ?auto_18170 )
      ( !UNLOAD ?auto_18169 ?auto_18168 ?auto_18171 ?auto_18170 )
      ( !DROP ?auto_18169 ?auto_18168 ?auto_18167 ?auto_18170 )
      ( MAKE-1CRATE-VERIFY ?auto_18167 ?auto_18168 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_18187 - SURFACE
      ?auto_18188 - SURFACE
      ?auto_18189 - SURFACE
      ?auto_18190 - SURFACE
      ?auto_18191 - SURFACE
      ?auto_18194 - SURFACE
      ?auto_18192 - SURFACE
      ?auto_18196 - SURFACE
      ?auto_18195 - SURFACE
      ?auto_18193 - SURFACE
      ?auto_18198 - SURFACE
      ?auto_18197 - SURFACE
    )
    :vars
    (
      ?auto_18203 - HOIST
      ?auto_18204 - PLACE
      ?auto_18201 - PLACE
      ?auto_18202 - HOIST
      ?auto_18199 - SURFACE
      ?auto_18211 - PLACE
      ?auto_18225 - HOIST
      ?auto_18222 - SURFACE
      ?auto_18221 - PLACE
      ?auto_18218 - HOIST
      ?auto_18209 - SURFACE
      ?auto_18205 - PLACE
      ?auto_18223 - HOIST
      ?auto_18206 - SURFACE
      ?auto_18220 - SURFACE
      ?auto_18213 - PLACE
      ?auto_18227 - HOIST
      ?auto_18219 - SURFACE
      ?auto_18208 - PLACE
      ?auto_18216 - HOIST
      ?auto_18228 - SURFACE
      ?auto_18224 - PLACE
      ?auto_18215 - HOIST
      ?auto_18226 - SURFACE
      ?auto_18212 - SURFACE
      ?auto_18217 - PLACE
      ?auto_18210 - HOIST
      ?auto_18230 - SURFACE
      ?auto_18214 - PLACE
      ?auto_18229 - HOIST
      ?auto_18207 - SURFACE
      ?auto_18200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18203 ?auto_18204 ) ( IS-CRATE ?auto_18197 ) ( not ( = ?auto_18201 ?auto_18204 ) ) ( HOIST-AT ?auto_18202 ?auto_18201 ) ( AVAILABLE ?auto_18202 ) ( SURFACE-AT ?auto_18197 ?auto_18201 ) ( ON ?auto_18197 ?auto_18199 ) ( CLEAR ?auto_18197 ) ( not ( = ?auto_18198 ?auto_18197 ) ) ( not ( = ?auto_18198 ?auto_18199 ) ) ( not ( = ?auto_18197 ?auto_18199 ) ) ( not ( = ?auto_18203 ?auto_18202 ) ) ( IS-CRATE ?auto_18198 ) ( not ( = ?auto_18211 ?auto_18204 ) ) ( HOIST-AT ?auto_18225 ?auto_18211 ) ( SURFACE-AT ?auto_18198 ?auto_18211 ) ( ON ?auto_18198 ?auto_18222 ) ( CLEAR ?auto_18198 ) ( not ( = ?auto_18193 ?auto_18198 ) ) ( not ( = ?auto_18193 ?auto_18222 ) ) ( not ( = ?auto_18198 ?auto_18222 ) ) ( not ( = ?auto_18203 ?auto_18225 ) ) ( IS-CRATE ?auto_18193 ) ( not ( = ?auto_18221 ?auto_18204 ) ) ( HOIST-AT ?auto_18218 ?auto_18221 ) ( AVAILABLE ?auto_18218 ) ( SURFACE-AT ?auto_18193 ?auto_18221 ) ( ON ?auto_18193 ?auto_18209 ) ( CLEAR ?auto_18193 ) ( not ( = ?auto_18195 ?auto_18193 ) ) ( not ( = ?auto_18195 ?auto_18209 ) ) ( not ( = ?auto_18193 ?auto_18209 ) ) ( not ( = ?auto_18203 ?auto_18218 ) ) ( IS-CRATE ?auto_18195 ) ( not ( = ?auto_18205 ?auto_18204 ) ) ( HOIST-AT ?auto_18223 ?auto_18205 ) ( AVAILABLE ?auto_18223 ) ( SURFACE-AT ?auto_18195 ?auto_18205 ) ( ON ?auto_18195 ?auto_18206 ) ( CLEAR ?auto_18195 ) ( not ( = ?auto_18196 ?auto_18195 ) ) ( not ( = ?auto_18196 ?auto_18206 ) ) ( not ( = ?auto_18195 ?auto_18206 ) ) ( not ( = ?auto_18203 ?auto_18223 ) ) ( IS-CRATE ?auto_18196 ) ( AVAILABLE ?auto_18225 ) ( SURFACE-AT ?auto_18196 ?auto_18211 ) ( ON ?auto_18196 ?auto_18220 ) ( CLEAR ?auto_18196 ) ( not ( = ?auto_18192 ?auto_18196 ) ) ( not ( = ?auto_18192 ?auto_18220 ) ) ( not ( = ?auto_18196 ?auto_18220 ) ) ( IS-CRATE ?auto_18192 ) ( not ( = ?auto_18213 ?auto_18204 ) ) ( HOIST-AT ?auto_18227 ?auto_18213 ) ( SURFACE-AT ?auto_18192 ?auto_18213 ) ( ON ?auto_18192 ?auto_18219 ) ( CLEAR ?auto_18192 ) ( not ( = ?auto_18194 ?auto_18192 ) ) ( not ( = ?auto_18194 ?auto_18219 ) ) ( not ( = ?auto_18192 ?auto_18219 ) ) ( not ( = ?auto_18203 ?auto_18227 ) ) ( IS-CRATE ?auto_18194 ) ( not ( = ?auto_18208 ?auto_18204 ) ) ( HOIST-AT ?auto_18216 ?auto_18208 ) ( AVAILABLE ?auto_18216 ) ( SURFACE-AT ?auto_18194 ?auto_18208 ) ( ON ?auto_18194 ?auto_18228 ) ( CLEAR ?auto_18194 ) ( not ( = ?auto_18191 ?auto_18194 ) ) ( not ( = ?auto_18191 ?auto_18228 ) ) ( not ( = ?auto_18194 ?auto_18228 ) ) ( not ( = ?auto_18203 ?auto_18216 ) ) ( IS-CRATE ?auto_18191 ) ( not ( = ?auto_18224 ?auto_18204 ) ) ( HOIST-AT ?auto_18215 ?auto_18224 ) ( AVAILABLE ?auto_18215 ) ( SURFACE-AT ?auto_18191 ?auto_18224 ) ( ON ?auto_18191 ?auto_18226 ) ( CLEAR ?auto_18191 ) ( not ( = ?auto_18190 ?auto_18191 ) ) ( not ( = ?auto_18190 ?auto_18226 ) ) ( not ( = ?auto_18191 ?auto_18226 ) ) ( not ( = ?auto_18203 ?auto_18215 ) ) ( IS-CRATE ?auto_18190 ) ( AVAILABLE ?auto_18227 ) ( SURFACE-AT ?auto_18190 ?auto_18213 ) ( ON ?auto_18190 ?auto_18212 ) ( CLEAR ?auto_18190 ) ( not ( = ?auto_18189 ?auto_18190 ) ) ( not ( = ?auto_18189 ?auto_18212 ) ) ( not ( = ?auto_18190 ?auto_18212 ) ) ( IS-CRATE ?auto_18189 ) ( not ( = ?auto_18217 ?auto_18204 ) ) ( HOIST-AT ?auto_18210 ?auto_18217 ) ( AVAILABLE ?auto_18210 ) ( SURFACE-AT ?auto_18189 ?auto_18217 ) ( ON ?auto_18189 ?auto_18230 ) ( CLEAR ?auto_18189 ) ( not ( = ?auto_18188 ?auto_18189 ) ) ( not ( = ?auto_18188 ?auto_18230 ) ) ( not ( = ?auto_18189 ?auto_18230 ) ) ( not ( = ?auto_18203 ?auto_18210 ) ) ( SURFACE-AT ?auto_18187 ?auto_18204 ) ( CLEAR ?auto_18187 ) ( IS-CRATE ?auto_18188 ) ( AVAILABLE ?auto_18203 ) ( not ( = ?auto_18214 ?auto_18204 ) ) ( HOIST-AT ?auto_18229 ?auto_18214 ) ( AVAILABLE ?auto_18229 ) ( SURFACE-AT ?auto_18188 ?auto_18214 ) ( ON ?auto_18188 ?auto_18207 ) ( CLEAR ?auto_18188 ) ( TRUCK-AT ?auto_18200 ?auto_18204 ) ( not ( = ?auto_18187 ?auto_18188 ) ) ( not ( = ?auto_18187 ?auto_18207 ) ) ( not ( = ?auto_18188 ?auto_18207 ) ) ( not ( = ?auto_18203 ?auto_18229 ) ) ( not ( = ?auto_18187 ?auto_18189 ) ) ( not ( = ?auto_18187 ?auto_18230 ) ) ( not ( = ?auto_18189 ?auto_18207 ) ) ( not ( = ?auto_18217 ?auto_18214 ) ) ( not ( = ?auto_18210 ?auto_18229 ) ) ( not ( = ?auto_18230 ?auto_18207 ) ) ( not ( = ?auto_18187 ?auto_18190 ) ) ( not ( = ?auto_18187 ?auto_18212 ) ) ( not ( = ?auto_18188 ?auto_18190 ) ) ( not ( = ?auto_18188 ?auto_18212 ) ) ( not ( = ?auto_18190 ?auto_18230 ) ) ( not ( = ?auto_18190 ?auto_18207 ) ) ( not ( = ?auto_18213 ?auto_18217 ) ) ( not ( = ?auto_18213 ?auto_18214 ) ) ( not ( = ?auto_18227 ?auto_18210 ) ) ( not ( = ?auto_18227 ?auto_18229 ) ) ( not ( = ?auto_18212 ?auto_18230 ) ) ( not ( = ?auto_18212 ?auto_18207 ) ) ( not ( = ?auto_18187 ?auto_18191 ) ) ( not ( = ?auto_18187 ?auto_18226 ) ) ( not ( = ?auto_18188 ?auto_18191 ) ) ( not ( = ?auto_18188 ?auto_18226 ) ) ( not ( = ?auto_18189 ?auto_18191 ) ) ( not ( = ?auto_18189 ?auto_18226 ) ) ( not ( = ?auto_18191 ?auto_18212 ) ) ( not ( = ?auto_18191 ?auto_18230 ) ) ( not ( = ?auto_18191 ?auto_18207 ) ) ( not ( = ?auto_18224 ?auto_18213 ) ) ( not ( = ?auto_18224 ?auto_18217 ) ) ( not ( = ?auto_18224 ?auto_18214 ) ) ( not ( = ?auto_18215 ?auto_18227 ) ) ( not ( = ?auto_18215 ?auto_18210 ) ) ( not ( = ?auto_18215 ?auto_18229 ) ) ( not ( = ?auto_18226 ?auto_18212 ) ) ( not ( = ?auto_18226 ?auto_18230 ) ) ( not ( = ?auto_18226 ?auto_18207 ) ) ( not ( = ?auto_18187 ?auto_18194 ) ) ( not ( = ?auto_18187 ?auto_18228 ) ) ( not ( = ?auto_18188 ?auto_18194 ) ) ( not ( = ?auto_18188 ?auto_18228 ) ) ( not ( = ?auto_18189 ?auto_18194 ) ) ( not ( = ?auto_18189 ?auto_18228 ) ) ( not ( = ?auto_18190 ?auto_18194 ) ) ( not ( = ?auto_18190 ?auto_18228 ) ) ( not ( = ?auto_18194 ?auto_18226 ) ) ( not ( = ?auto_18194 ?auto_18212 ) ) ( not ( = ?auto_18194 ?auto_18230 ) ) ( not ( = ?auto_18194 ?auto_18207 ) ) ( not ( = ?auto_18208 ?auto_18224 ) ) ( not ( = ?auto_18208 ?auto_18213 ) ) ( not ( = ?auto_18208 ?auto_18217 ) ) ( not ( = ?auto_18208 ?auto_18214 ) ) ( not ( = ?auto_18216 ?auto_18215 ) ) ( not ( = ?auto_18216 ?auto_18227 ) ) ( not ( = ?auto_18216 ?auto_18210 ) ) ( not ( = ?auto_18216 ?auto_18229 ) ) ( not ( = ?auto_18228 ?auto_18226 ) ) ( not ( = ?auto_18228 ?auto_18212 ) ) ( not ( = ?auto_18228 ?auto_18230 ) ) ( not ( = ?auto_18228 ?auto_18207 ) ) ( not ( = ?auto_18187 ?auto_18192 ) ) ( not ( = ?auto_18187 ?auto_18219 ) ) ( not ( = ?auto_18188 ?auto_18192 ) ) ( not ( = ?auto_18188 ?auto_18219 ) ) ( not ( = ?auto_18189 ?auto_18192 ) ) ( not ( = ?auto_18189 ?auto_18219 ) ) ( not ( = ?auto_18190 ?auto_18192 ) ) ( not ( = ?auto_18190 ?auto_18219 ) ) ( not ( = ?auto_18191 ?auto_18192 ) ) ( not ( = ?auto_18191 ?auto_18219 ) ) ( not ( = ?auto_18192 ?auto_18228 ) ) ( not ( = ?auto_18192 ?auto_18226 ) ) ( not ( = ?auto_18192 ?auto_18212 ) ) ( not ( = ?auto_18192 ?auto_18230 ) ) ( not ( = ?auto_18192 ?auto_18207 ) ) ( not ( = ?auto_18219 ?auto_18228 ) ) ( not ( = ?auto_18219 ?auto_18226 ) ) ( not ( = ?auto_18219 ?auto_18212 ) ) ( not ( = ?auto_18219 ?auto_18230 ) ) ( not ( = ?auto_18219 ?auto_18207 ) ) ( not ( = ?auto_18187 ?auto_18196 ) ) ( not ( = ?auto_18187 ?auto_18220 ) ) ( not ( = ?auto_18188 ?auto_18196 ) ) ( not ( = ?auto_18188 ?auto_18220 ) ) ( not ( = ?auto_18189 ?auto_18196 ) ) ( not ( = ?auto_18189 ?auto_18220 ) ) ( not ( = ?auto_18190 ?auto_18196 ) ) ( not ( = ?auto_18190 ?auto_18220 ) ) ( not ( = ?auto_18191 ?auto_18196 ) ) ( not ( = ?auto_18191 ?auto_18220 ) ) ( not ( = ?auto_18194 ?auto_18196 ) ) ( not ( = ?auto_18194 ?auto_18220 ) ) ( not ( = ?auto_18196 ?auto_18219 ) ) ( not ( = ?auto_18196 ?auto_18228 ) ) ( not ( = ?auto_18196 ?auto_18226 ) ) ( not ( = ?auto_18196 ?auto_18212 ) ) ( not ( = ?auto_18196 ?auto_18230 ) ) ( not ( = ?auto_18196 ?auto_18207 ) ) ( not ( = ?auto_18211 ?auto_18213 ) ) ( not ( = ?auto_18211 ?auto_18208 ) ) ( not ( = ?auto_18211 ?auto_18224 ) ) ( not ( = ?auto_18211 ?auto_18217 ) ) ( not ( = ?auto_18211 ?auto_18214 ) ) ( not ( = ?auto_18225 ?auto_18227 ) ) ( not ( = ?auto_18225 ?auto_18216 ) ) ( not ( = ?auto_18225 ?auto_18215 ) ) ( not ( = ?auto_18225 ?auto_18210 ) ) ( not ( = ?auto_18225 ?auto_18229 ) ) ( not ( = ?auto_18220 ?auto_18219 ) ) ( not ( = ?auto_18220 ?auto_18228 ) ) ( not ( = ?auto_18220 ?auto_18226 ) ) ( not ( = ?auto_18220 ?auto_18212 ) ) ( not ( = ?auto_18220 ?auto_18230 ) ) ( not ( = ?auto_18220 ?auto_18207 ) ) ( not ( = ?auto_18187 ?auto_18195 ) ) ( not ( = ?auto_18187 ?auto_18206 ) ) ( not ( = ?auto_18188 ?auto_18195 ) ) ( not ( = ?auto_18188 ?auto_18206 ) ) ( not ( = ?auto_18189 ?auto_18195 ) ) ( not ( = ?auto_18189 ?auto_18206 ) ) ( not ( = ?auto_18190 ?auto_18195 ) ) ( not ( = ?auto_18190 ?auto_18206 ) ) ( not ( = ?auto_18191 ?auto_18195 ) ) ( not ( = ?auto_18191 ?auto_18206 ) ) ( not ( = ?auto_18194 ?auto_18195 ) ) ( not ( = ?auto_18194 ?auto_18206 ) ) ( not ( = ?auto_18192 ?auto_18195 ) ) ( not ( = ?auto_18192 ?auto_18206 ) ) ( not ( = ?auto_18195 ?auto_18220 ) ) ( not ( = ?auto_18195 ?auto_18219 ) ) ( not ( = ?auto_18195 ?auto_18228 ) ) ( not ( = ?auto_18195 ?auto_18226 ) ) ( not ( = ?auto_18195 ?auto_18212 ) ) ( not ( = ?auto_18195 ?auto_18230 ) ) ( not ( = ?auto_18195 ?auto_18207 ) ) ( not ( = ?auto_18205 ?auto_18211 ) ) ( not ( = ?auto_18205 ?auto_18213 ) ) ( not ( = ?auto_18205 ?auto_18208 ) ) ( not ( = ?auto_18205 ?auto_18224 ) ) ( not ( = ?auto_18205 ?auto_18217 ) ) ( not ( = ?auto_18205 ?auto_18214 ) ) ( not ( = ?auto_18223 ?auto_18225 ) ) ( not ( = ?auto_18223 ?auto_18227 ) ) ( not ( = ?auto_18223 ?auto_18216 ) ) ( not ( = ?auto_18223 ?auto_18215 ) ) ( not ( = ?auto_18223 ?auto_18210 ) ) ( not ( = ?auto_18223 ?auto_18229 ) ) ( not ( = ?auto_18206 ?auto_18220 ) ) ( not ( = ?auto_18206 ?auto_18219 ) ) ( not ( = ?auto_18206 ?auto_18228 ) ) ( not ( = ?auto_18206 ?auto_18226 ) ) ( not ( = ?auto_18206 ?auto_18212 ) ) ( not ( = ?auto_18206 ?auto_18230 ) ) ( not ( = ?auto_18206 ?auto_18207 ) ) ( not ( = ?auto_18187 ?auto_18193 ) ) ( not ( = ?auto_18187 ?auto_18209 ) ) ( not ( = ?auto_18188 ?auto_18193 ) ) ( not ( = ?auto_18188 ?auto_18209 ) ) ( not ( = ?auto_18189 ?auto_18193 ) ) ( not ( = ?auto_18189 ?auto_18209 ) ) ( not ( = ?auto_18190 ?auto_18193 ) ) ( not ( = ?auto_18190 ?auto_18209 ) ) ( not ( = ?auto_18191 ?auto_18193 ) ) ( not ( = ?auto_18191 ?auto_18209 ) ) ( not ( = ?auto_18194 ?auto_18193 ) ) ( not ( = ?auto_18194 ?auto_18209 ) ) ( not ( = ?auto_18192 ?auto_18193 ) ) ( not ( = ?auto_18192 ?auto_18209 ) ) ( not ( = ?auto_18196 ?auto_18193 ) ) ( not ( = ?auto_18196 ?auto_18209 ) ) ( not ( = ?auto_18193 ?auto_18206 ) ) ( not ( = ?auto_18193 ?auto_18220 ) ) ( not ( = ?auto_18193 ?auto_18219 ) ) ( not ( = ?auto_18193 ?auto_18228 ) ) ( not ( = ?auto_18193 ?auto_18226 ) ) ( not ( = ?auto_18193 ?auto_18212 ) ) ( not ( = ?auto_18193 ?auto_18230 ) ) ( not ( = ?auto_18193 ?auto_18207 ) ) ( not ( = ?auto_18221 ?auto_18205 ) ) ( not ( = ?auto_18221 ?auto_18211 ) ) ( not ( = ?auto_18221 ?auto_18213 ) ) ( not ( = ?auto_18221 ?auto_18208 ) ) ( not ( = ?auto_18221 ?auto_18224 ) ) ( not ( = ?auto_18221 ?auto_18217 ) ) ( not ( = ?auto_18221 ?auto_18214 ) ) ( not ( = ?auto_18218 ?auto_18223 ) ) ( not ( = ?auto_18218 ?auto_18225 ) ) ( not ( = ?auto_18218 ?auto_18227 ) ) ( not ( = ?auto_18218 ?auto_18216 ) ) ( not ( = ?auto_18218 ?auto_18215 ) ) ( not ( = ?auto_18218 ?auto_18210 ) ) ( not ( = ?auto_18218 ?auto_18229 ) ) ( not ( = ?auto_18209 ?auto_18206 ) ) ( not ( = ?auto_18209 ?auto_18220 ) ) ( not ( = ?auto_18209 ?auto_18219 ) ) ( not ( = ?auto_18209 ?auto_18228 ) ) ( not ( = ?auto_18209 ?auto_18226 ) ) ( not ( = ?auto_18209 ?auto_18212 ) ) ( not ( = ?auto_18209 ?auto_18230 ) ) ( not ( = ?auto_18209 ?auto_18207 ) ) ( not ( = ?auto_18187 ?auto_18198 ) ) ( not ( = ?auto_18187 ?auto_18222 ) ) ( not ( = ?auto_18188 ?auto_18198 ) ) ( not ( = ?auto_18188 ?auto_18222 ) ) ( not ( = ?auto_18189 ?auto_18198 ) ) ( not ( = ?auto_18189 ?auto_18222 ) ) ( not ( = ?auto_18190 ?auto_18198 ) ) ( not ( = ?auto_18190 ?auto_18222 ) ) ( not ( = ?auto_18191 ?auto_18198 ) ) ( not ( = ?auto_18191 ?auto_18222 ) ) ( not ( = ?auto_18194 ?auto_18198 ) ) ( not ( = ?auto_18194 ?auto_18222 ) ) ( not ( = ?auto_18192 ?auto_18198 ) ) ( not ( = ?auto_18192 ?auto_18222 ) ) ( not ( = ?auto_18196 ?auto_18198 ) ) ( not ( = ?auto_18196 ?auto_18222 ) ) ( not ( = ?auto_18195 ?auto_18198 ) ) ( not ( = ?auto_18195 ?auto_18222 ) ) ( not ( = ?auto_18198 ?auto_18209 ) ) ( not ( = ?auto_18198 ?auto_18206 ) ) ( not ( = ?auto_18198 ?auto_18220 ) ) ( not ( = ?auto_18198 ?auto_18219 ) ) ( not ( = ?auto_18198 ?auto_18228 ) ) ( not ( = ?auto_18198 ?auto_18226 ) ) ( not ( = ?auto_18198 ?auto_18212 ) ) ( not ( = ?auto_18198 ?auto_18230 ) ) ( not ( = ?auto_18198 ?auto_18207 ) ) ( not ( = ?auto_18222 ?auto_18209 ) ) ( not ( = ?auto_18222 ?auto_18206 ) ) ( not ( = ?auto_18222 ?auto_18220 ) ) ( not ( = ?auto_18222 ?auto_18219 ) ) ( not ( = ?auto_18222 ?auto_18228 ) ) ( not ( = ?auto_18222 ?auto_18226 ) ) ( not ( = ?auto_18222 ?auto_18212 ) ) ( not ( = ?auto_18222 ?auto_18230 ) ) ( not ( = ?auto_18222 ?auto_18207 ) ) ( not ( = ?auto_18187 ?auto_18197 ) ) ( not ( = ?auto_18187 ?auto_18199 ) ) ( not ( = ?auto_18188 ?auto_18197 ) ) ( not ( = ?auto_18188 ?auto_18199 ) ) ( not ( = ?auto_18189 ?auto_18197 ) ) ( not ( = ?auto_18189 ?auto_18199 ) ) ( not ( = ?auto_18190 ?auto_18197 ) ) ( not ( = ?auto_18190 ?auto_18199 ) ) ( not ( = ?auto_18191 ?auto_18197 ) ) ( not ( = ?auto_18191 ?auto_18199 ) ) ( not ( = ?auto_18194 ?auto_18197 ) ) ( not ( = ?auto_18194 ?auto_18199 ) ) ( not ( = ?auto_18192 ?auto_18197 ) ) ( not ( = ?auto_18192 ?auto_18199 ) ) ( not ( = ?auto_18196 ?auto_18197 ) ) ( not ( = ?auto_18196 ?auto_18199 ) ) ( not ( = ?auto_18195 ?auto_18197 ) ) ( not ( = ?auto_18195 ?auto_18199 ) ) ( not ( = ?auto_18193 ?auto_18197 ) ) ( not ( = ?auto_18193 ?auto_18199 ) ) ( not ( = ?auto_18197 ?auto_18222 ) ) ( not ( = ?auto_18197 ?auto_18209 ) ) ( not ( = ?auto_18197 ?auto_18206 ) ) ( not ( = ?auto_18197 ?auto_18220 ) ) ( not ( = ?auto_18197 ?auto_18219 ) ) ( not ( = ?auto_18197 ?auto_18228 ) ) ( not ( = ?auto_18197 ?auto_18226 ) ) ( not ( = ?auto_18197 ?auto_18212 ) ) ( not ( = ?auto_18197 ?auto_18230 ) ) ( not ( = ?auto_18197 ?auto_18207 ) ) ( not ( = ?auto_18201 ?auto_18211 ) ) ( not ( = ?auto_18201 ?auto_18221 ) ) ( not ( = ?auto_18201 ?auto_18205 ) ) ( not ( = ?auto_18201 ?auto_18213 ) ) ( not ( = ?auto_18201 ?auto_18208 ) ) ( not ( = ?auto_18201 ?auto_18224 ) ) ( not ( = ?auto_18201 ?auto_18217 ) ) ( not ( = ?auto_18201 ?auto_18214 ) ) ( not ( = ?auto_18202 ?auto_18225 ) ) ( not ( = ?auto_18202 ?auto_18218 ) ) ( not ( = ?auto_18202 ?auto_18223 ) ) ( not ( = ?auto_18202 ?auto_18227 ) ) ( not ( = ?auto_18202 ?auto_18216 ) ) ( not ( = ?auto_18202 ?auto_18215 ) ) ( not ( = ?auto_18202 ?auto_18210 ) ) ( not ( = ?auto_18202 ?auto_18229 ) ) ( not ( = ?auto_18199 ?auto_18222 ) ) ( not ( = ?auto_18199 ?auto_18209 ) ) ( not ( = ?auto_18199 ?auto_18206 ) ) ( not ( = ?auto_18199 ?auto_18220 ) ) ( not ( = ?auto_18199 ?auto_18219 ) ) ( not ( = ?auto_18199 ?auto_18228 ) ) ( not ( = ?auto_18199 ?auto_18226 ) ) ( not ( = ?auto_18199 ?auto_18212 ) ) ( not ( = ?auto_18199 ?auto_18230 ) ) ( not ( = ?auto_18199 ?auto_18207 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_18187 ?auto_18188 ?auto_18189 ?auto_18190 ?auto_18191 ?auto_18194 ?auto_18192 ?auto_18196 ?auto_18195 ?auto_18193 ?auto_18198 )
      ( MAKE-1CRATE ?auto_18198 ?auto_18197 )
      ( MAKE-11CRATE-VERIFY ?auto_18187 ?auto_18188 ?auto_18189 ?auto_18190 ?auto_18191 ?auto_18194 ?auto_18192 ?auto_18196 ?auto_18195 ?auto_18193 ?auto_18198 ?auto_18197 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18233 - SURFACE
      ?auto_18234 - SURFACE
    )
    :vars
    (
      ?auto_18235 - HOIST
      ?auto_18236 - PLACE
      ?auto_18238 - PLACE
      ?auto_18239 - HOIST
      ?auto_18240 - SURFACE
      ?auto_18237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18235 ?auto_18236 ) ( SURFACE-AT ?auto_18233 ?auto_18236 ) ( CLEAR ?auto_18233 ) ( IS-CRATE ?auto_18234 ) ( AVAILABLE ?auto_18235 ) ( not ( = ?auto_18238 ?auto_18236 ) ) ( HOIST-AT ?auto_18239 ?auto_18238 ) ( AVAILABLE ?auto_18239 ) ( SURFACE-AT ?auto_18234 ?auto_18238 ) ( ON ?auto_18234 ?auto_18240 ) ( CLEAR ?auto_18234 ) ( TRUCK-AT ?auto_18237 ?auto_18236 ) ( not ( = ?auto_18233 ?auto_18234 ) ) ( not ( = ?auto_18233 ?auto_18240 ) ) ( not ( = ?auto_18234 ?auto_18240 ) ) ( not ( = ?auto_18235 ?auto_18239 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18237 ?auto_18236 ?auto_18238 )
      ( !LIFT ?auto_18239 ?auto_18234 ?auto_18240 ?auto_18238 )
      ( !LOAD ?auto_18239 ?auto_18234 ?auto_18237 ?auto_18238 )
      ( !DRIVE ?auto_18237 ?auto_18238 ?auto_18236 )
      ( !UNLOAD ?auto_18235 ?auto_18234 ?auto_18237 ?auto_18236 )
      ( !DROP ?auto_18235 ?auto_18234 ?auto_18233 ?auto_18236 )
      ( MAKE-1CRATE-VERIFY ?auto_18233 ?auto_18234 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_18254 - SURFACE
      ?auto_18255 - SURFACE
      ?auto_18256 - SURFACE
      ?auto_18257 - SURFACE
      ?auto_18258 - SURFACE
      ?auto_18261 - SURFACE
      ?auto_18259 - SURFACE
      ?auto_18263 - SURFACE
      ?auto_18262 - SURFACE
      ?auto_18260 - SURFACE
      ?auto_18265 - SURFACE
      ?auto_18264 - SURFACE
      ?auto_18266 - SURFACE
    )
    :vars
    (
      ?auto_18271 - HOIST
      ?auto_18269 - PLACE
      ?auto_18267 - PLACE
      ?auto_18272 - HOIST
      ?auto_18268 - SURFACE
      ?auto_18292 - PLACE
      ?auto_18287 - HOIST
      ?auto_18290 - SURFACE
      ?auto_18277 - PLACE
      ?auto_18291 - HOIST
      ?auto_18278 - SURFACE
      ?auto_18276 - PLACE
      ?auto_18293 - HOIST
      ?auto_18282 - SURFACE
      ?auto_18295 - SURFACE
      ?auto_18284 - SURFACE
      ?auto_18285 - PLACE
      ?auto_18298 - HOIST
      ?auto_18296 - SURFACE
      ?auto_18297 - PLACE
      ?auto_18283 - HOIST
      ?auto_18294 - SURFACE
      ?auto_18299 - PLACE
      ?auto_18289 - HOIST
      ?auto_18286 - SURFACE
      ?auto_18280 - SURFACE
      ?auto_18281 - PLACE
      ?auto_18273 - HOIST
      ?auto_18279 - SURFACE
      ?auto_18288 - PLACE
      ?auto_18275 - HOIST
      ?auto_18274 - SURFACE
      ?auto_18270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18271 ?auto_18269 ) ( IS-CRATE ?auto_18266 ) ( not ( = ?auto_18267 ?auto_18269 ) ) ( HOIST-AT ?auto_18272 ?auto_18267 ) ( SURFACE-AT ?auto_18266 ?auto_18267 ) ( ON ?auto_18266 ?auto_18268 ) ( CLEAR ?auto_18266 ) ( not ( = ?auto_18264 ?auto_18266 ) ) ( not ( = ?auto_18264 ?auto_18268 ) ) ( not ( = ?auto_18266 ?auto_18268 ) ) ( not ( = ?auto_18271 ?auto_18272 ) ) ( IS-CRATE ?auto_18264 ) ( not ( = ?auto_18292 ?auto_18269 ) ) ( HOIST-AT ?auto_18287 ?auto_18292 ) ( AVAILABLE ?auto_18287 ) ( SURFACE-AT ?auto_18264 ?auto_18292 ) ( ON ?auto_18264 ?auto_18290 ) ( CLEAR ?auto_18264 ) ( not ( = ?auto_18265 ?auto_18264 ) ) ( not ( = ?auto_18265 ?auto_18290 ) ) ( not ( = ?auto_18264 ?auto_18290 ) ) ( not ( = ?auto_18271 ?auto_18287 ) ) ( IS-CRATE ?auto_18265 ) ( not ( = ?auto_18277 ?auto_18269 ) ) ( HOIST-AT ?auto_18291 ?auto_18277 ) ( SURFACE-AT ?auto_18265 ?auto_18277 ) ( ON ?auto_18265 ?auto_18278 ) ( CLEAR ?auto_18265 ) ( not ( = ?auto_18260 ?auto_18265 ) ) ( not ( = ?auto_18260 ?auto_18278 ) ) ( not ( = ?auto_18265 ?auto_18278 ) ) ( not ( = ?auto_18271 ?auto_18291 ) ) ( IS-CRATE ?auto_18260 ) ( not ( = ?auto_18276 ?auto_18269 ) ) ( HOIST-AT ?auto_18293 ?auto_18276 ) ( AVAILABLE ?auto_18293 ) ( SURFACE-AT ?auto_18260 ?auto_18276 ) ( ON ?auto_18260 ?auto_18282 ) ( CLEAR ?auto_18260 ) ( not ( = ?auto_18262 ?auto_18260 ) ) ( not ( = ?auto_18262 ?auto_18282 ) ) ( not ( = ?auto_18260 ?auto_18282 ) ) ( not ( = ?auto_18271 ?auto_18293 ) ) ( IS-CRATE ?auto_18262 ) ( AVAILABLE ?auto_18272 ) ( SURFACE-AT ?auto_18262 ?auto_18267 ) ( ON ?auto_18262 ?auto_18295 ) ( CLEAR ?auto_18262 ) ( not ( = ?auto_18263 ?auto_18262 ) ) ( not ( = ?auto_18263 ?auto_18295 ) ) ( not ( = ?auto_18262 ?auto_18295 ) ) ( IS-CRATE ?auto_18263 ) ( AVAILABLE ?auto_18291 ) ( SURFACE-AT ?auto_18263 ?auto_18277 ) ( ON ?auto_18263 ?auto_18284 ) ( CLEAR ?auto_18263 ) ( not ( = ?auto_18259 ?auto_18263 ) ) ( not ( = ?auto_18259 ?auto_18284 ) ) ( not ( = ?auto_18263 ?auto_18284 ) ) ( IS-CRATE ?auto_18259 ) ( not ( = ?auto_18285 ?auto_18269 ) ) ( HOIST-AT ?auto_18298 ?auto_18285 ) ( SURFACE-AT ?auto_18259 ?auto_18285 ) ( ON ?auto_18259 ?auto_18296 ) ( CLEAR ?auto_18259 ) ( not ( = ?auto_18261 ?auto_18259 ) ) ( not ( = ?auto_18261 ?auto_18296 ) ) ( not ( = ?auto_18259 ?auto_18296 ) ) ( not ( = ?auto_18271 ?auto_18298 ) ) ( IS-CRATE ?auto_18261 ) ( not ( = ?auto_18297 ?auto_18269 ) ) ( HOIST-AT ?auto_18283 ?auto_18297 ) ( AVAILABLE ?auto_18283 ) ( SURFACE-AT ?auto_18261 ?auto_18297 ) ( ON ?auto_18261 ?auto_18294 ) ( CLEAR ?auto_18261 ) ( not ( = ?auto_18258 ?auto_18261 ) ) ( not ( = ?auto_18258 ?auto_18294 ) ) ( not ( = ?auto_18261 ?auto_18294 ) ) ( not ( = ?auto_18271 ?auto_18283 ) ) ( IS-CRATE ?auto_18258 ) ( not ( = ?auto_18299 ?auto_18269 ) ) ( HOIST-AT ?auto_18289 ?auto_18299 ) ( AVAILABLE ?auto_18289 ) ( SURFACE-AT ?auto_18258 ?auto_18299 ) ( ON ?auto_18258 ?auto_18286 ) ( CLEAR ?auto_18258 ) ( not ( = ?auto_18257 ?auto_18258 ) ) ( not ( = ?auto_18257 ?auto_18286 ) ) ( not ( = ?auto_18258 ?auto_18286 ) ) ( not ( = ?auto_18271 ?auto_18289 ) ) ( IS-CRATE ?auto_18257 ) ( AVAILABLE ?auto_18298 ) ( SURFACE-AT ?auto_18257 ?auto_18285 ) ( ON ?auto_18257 ?auto_18280 ) ( CLEAR ?auto_18257 ) ( not ( = ?auto_18256 ?auto_18257 ) ) ( not ( = ?auto_18256 ?auto_18280 ) ) ( not ( = ?auto_18257 ?auto_18280 ) ) ( IS-CRATE ?auto_18256 ) ( not ( = ?auto_18281 ?auto_18269 ) ) ( HOIST-AT ?auto_18273 ?auto_18281 ) ( AVAILABLE ?auto_18273 ) ( SURFACE-AT ?auto_18256 ?auto_18281 ) ( ON ?auto_18256 ?auto_18279 ) ( CLEAR ?auto_18256 ) ( not ( = ?auto_18255 ?auto_18256 ) ) ( not ( = ?auto_18255 ?auto_18279 ) ) ( not ( = ?auto_18256 ?auto_18279 ) ) ( not ( = ?auto_18271 ?auto_18273 ) ) ( SURFACE-AT ?auto_18254 ?auto_18269 ) ( CLEAR ?auto_18254 ) ( IS-CRATE ?auto_18255 ) ( AVAILABLE ?auto_18271 ) ( not ( = ?auto_18288 ?auto_18269 ) ) ( HOIST-AT ?auto_18275 ?auto_18288 ) ( AVAILABLE ?auto_18275 ) ( SURFACE-AT ?auto_18255 ?auto_18288 ) ( ON ?auto_18255 ?auto_18274 ) ( CLEAR ?auto_18255 ) ( TRUCK-AT ?auto_18270 ?auto_18269 ) ( not ( = ?auto_18254 ?auto_18255 ) ) ( not ( = ?auto_18254 ?auto_18274 ) ) ( not ( = ?auto_18255 ?auto_18274 ) ) ( not ( = ?auto_18271 ?auto_18275 ) ) ( not ( = ?auto_18254 ?auto_18256 ) ) ( not ( = ?auto_18254 ?auto_18279 ) ) ( not ( = ?auto_18256 ?auto_18274 ) ) ( not ( = ?auto_18281 ?auto_18288 ) ) ( not ( = ?auto_18273 ?auto_18275 ) ) ( not ( = ?auto_18279 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18257 ) ) ( not ( = ?auto_18254 ?auto_18280 ) ) ( not ( = ?auto_18255 ?auto_18257 ) ) ( not ( = ?auto_18255 ?auto_18280 ) ) ( not ( = ?auto_18257 ?auto_18279 ) ) ( not ( = ?auto_18257 ?auto_18274 ) ) ( not ( = ?auto_18285 ?auto_18281 ) ) ( not ( = ?auto_18285 ?auto_18288 ) ) ( not ( = ?auto_18298 ?auto_18273 ) ) ( not ( = ?auto_18298 ?auto_18275 ) ) ( not ( = ?auto_18280 ?auto_18279 ) ) ( not ( = ?auto_18280 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18258 ) ) ( not ( = ?auto_18254 ?auto_18286 ) ) ( not ( = ?auto_18255 ?auto_18258 ) ) ( not ( = ?auto_18255 ?auto_18286 ) ) ( not ( = ?auto_18256 ?auto_18258 ) ) ( not ( = ?auto_18256 ?auto_18286 ) ) ( not ( = ?auto_18258 ?auto_18280 ) ) ( not ( = ?auto_18258 ?auto_18279 ) ) ( not ( = ?auto_18258 ?auto_18274 ) ) ( not ( = ?auto_18299 ?auto_18285 ) ) ( not ( = ?auto_18299 ?auto_18281 ) ) ( not ( = ?auto_18299 ?auto_18288 ) ) ( not ( = ?auto_18289 ?auto_18298 ) ) ( not ( = ?auto_18289 ?auto_18273 ) ) ( not ( = ?auto_18289 ?auto_18275 ) ) ( not ( = ?auto_18286 ?auto_18280 ) ) ( not ( = ?auto_18286 ?auto_18279 ) ) ( not ( = ?auto_18286 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18261 ) ) ( not ( = ?auto_18254 ?auto_18294 ) ) ( not ( = ?auto_18255 ?auto_18261 ) ) ( not ( = ?auto_18255 ?auto_18294 ) ) ( not ( = ?auto_18256 ?auto_18261 ) ) ( not ( = ?auto_18256 ?auto_18294 ) ) ( not ( = ?auto_18257 ?auto_18261 ) ) ( not ( = ?auto_18257 ?auto_18294 ) ) ( not ( = ?auto_18261 ?auto_18286 ) ) ( not ( = ?auto_18261 ?auto_18280 ) ) ( not ( = ?auto_18261 ?auto_18279 ) ) ( not ( = ?auto_18261 ?auto_18274 ) ) ( not ( = ?auto_18297 ?auto_18299 ) ) ( not ( = ?auto_18297 ?auto_18285 ) ) ( not ( = ?auto_18297 ?auto_18281 ) ) ( not ( = ?auto_18297 ?auto_18288 ) ) ( not ( = ?auto_18283 ?auto_18289 ) ) ( not ( = ?auto_18283 ?auto_18298 ) ) ( not ( = ?auto_18283 ?auto_18273 ) ) ( not ( = ?auto_18283 ?auto_18275 ) ) ( not ( = ?auto_18294 ?auto_18286 ) ) ( not ( = ?auto_18294 ?auto_18280 ) ) ( not ( = ?auto_18294 ?auto_18279 ) ) ( not ( = ?auto_18294 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18259 ) ) ( not ( = ?auto_18254 ?auto_18296 ) ) ( not ( = ?auto_18255 ?auto_18259 ) ) ( not ( = ?auto_18255 ?auto_18296 ) ) ( not ( = ?auto_18256 ?auto_18259 ) ) ( not ( = ?auto_18256 ?auto_18296 ) ) ( not ( = ?auto_18257 ?auto_18259 ) ) ( not ( = ?auto_18257 ?auto_18296 ) ) ( not ( = ?auto_18258 ?auto_18259 ) ) ( not ( = ?auto_18258 ?auto_18296 ) ) ( not ( = ?auto_18259 ?auto_18294 ) ) ( not ( = ?auto_18259 ?auto_18286 ) ) ( not ( = ?auto_18259 ?auto_18280 ) ) ( not ( = ?auto_18259 ?auto_18279 ) ) ( not ( = ?auto_18259 ?auto_18274 ) ) ( not ( = ?auto_18296 ?auto_18294 ) ) ( not ( = ?auto_18296 ?auto_18286 ) ) ( not ( = ?auto_18296 ?auto_18280 ) ) ( not ( = ?auto_18296 ?auto_18279 ) ) ( not ( = ?auto_18296 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18263 ) ) ( not ( = ?auto_18254 ?auto_18284 ) ) ( not ( = ?auto_18255 ?auto_18263 ) ) ( not ( = ?auto_18255 ?auto_18284 ) ) ( not ( = ?auto_18256 ?auto_18263 ) ) ( not ( = ?auto_18256 ?auto_18284 ) ) ( not ( = ?auto_18257 ?auto_18263 ) ) ( not ( = ?auto_18257 ?auto_18284 ) ) ( not ( = ?auto_18258 ?auto_18263 ) ) ( not ( = ?auto_18258 ?auto_18284 ) ) ( not ( = ?auto_18261 ?auto_18263 ) ) ( not ( = ?auto_18261 ?auto_18284 ) ) ( not ( = ?auto_18263 ?auto_18296 ) ) ( not ( = ?auto_18263 ?auto_18294 ) ) ( not ( = ?auto_18263 ?auto_18286 ) ) ( not ( = ?auto_18263 ?auto_18280 ) ) ( not ( = ?auto_18263 ?auto_18279 ) ) ( not ( = ?auto_18263 ?auto_18274 ) ) ( not ( = ?auto_18277 ?auto_18285 ) ) ( not ( = ?auto_18277 ?auto_18297 ) ) ( not ( = ?auto_18277 ?auto_18299 ) ) ( not ( = ?auto_18277 ?auto_18281 ) ) ( not ( = ?auto_18277 ?auto_18288 ) ) ( not ( = ?auto_18291 ?auto_18298 ) ) ( not ( = ?auto_18291 ?auto_18283 ) ) ( not ( = ?auto_18291 ?auto_18289 ) ) ( not ( = ?auto_18291 ?auto_18273 ) ) ( not ( = ?auto_18291 ?auto_18275 ) ) ( not ( = ?auto_18284 ?auto_18296 ) ) ( not ( = ?auto_18284 ?auto_18294 ) ) ( not ( = ?auto_18284 ?auto_18286 ) ) ( not ( = ?auto_18284 ?auto_18280 ) ) ( not ( = ?auto_18284 ?auto_18279 ) ) ( not ( = ?auto_18284 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18262 ) ) ( not ( = ?auto_18254 ?auto_18295 ) ) ( not ( = ?auto_18255 ?auto_18262 ) ) ( not ( = ?auto_18255 ?auto_18295 ) ) ( not ( = ?auto_18256 ?auto_18262 ) ) ( not ( = ?auto_18256 ?auto_18295 ) ) ( not ( = ?auto_18257 ?auto_18262 ) ) ( not ( = ?auto_18257 ?auto_18295 ) ) ( not ( = ?auto_18258 ?auto_18262 ) ) ( not ( = ?auto_18258 ?auto_18295 ) ) ( not ( = ?auto_18261 ?auto_18262 ) ) ( not ( = ?auto_18261 ?auto_18295 ) ) ( not ( = ?auto_18259 ?auto_18262 ) ) ( not ( = ?auto_18259 ?auto_18295 ) ) ( not ( = ?auto_18262 ?auto_18284 ) ) ( not ( = ?auto_18262 ?auto_18296 ) ) ( not ( = ?auto_18262 ?auto_18294 ) ) ( not ( = ?auto_18262 ?auto_18286 ) ) ( not ( = ?auto_18262 ?auto_18280 ) ) ( not ( = ?auto_18262 ?auto_18279 ) ) ( not ( = ?auto_18262 ?auto_18274 ) ) ( not ( = ?auto_18267 ?auto_18277 ) ) ( not ( = ?auto_18267 ?auto_18285 ) ) ( not ( = ?auto_18267 ?auto_18297 ) ) ( not ( = ?auto_18267 ?auto_18299 ) ) ( not ( = ?auto_18267 ?auto_18281 ) ) ( not ( = ?auto_18267 ?auto_18288 ) ) ( not ( = ?auto_18272 ?auto_18291 ) ) ( not ( = ?auto_18272 ?auto_18298 ) ) ( not ( = ?auto_18272 ?auto_18283 ) ) ( not ( = ?auto_18272 ?auto_18289 ) ) ( not ( = ?auto_18272 ?auto_18273 ) ) ( not ( = ?auto_18272 ?auto_18275 ) ) ( not ( = ?auto_18295 ?auto_18284 ) ) ( not ( = ?auto_18295 ?auto_18296 ) ) ( not ( = ?auto_18295 ?auto_18294 ) ) ( not ( = ?auto_18295 ?auto_18286 ) ) ( not ( = ?auto_18295 ?auto_18280 ) ) ( not ( = ?auto_18295 ?auto_18279 ) ) ( not ( = ?auto_18295 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18260 ) ) ( not ( = ?auto_18254 ?auto_18282 ) ) ( not ( = ?auto_18255 ?auto_18260 ) ) ( not ( = ?auto_18255 ?auto_18282 ) ) ( not ( = ?auto_18256 ?auto_18260 ) ) ( not ( = ?auto_18256 ?auto_18282 ) ) ( not ( = ?auto_18257 ?auto_18260 ) ) ( not ( = ?auto_18257 ?auto_18282 ) ) ( not ( = ?auto_18258 ?auto_18260 ) ) ( not ( = ?auto_18258 ?auto_18282 ) ) ( not ( = ?auto_18261 ?auto_18260 ) ) ( not ( = ?auto_18261 ?auto_18282 ) ) ( not ( = ?auto_18259 ?auto_18260 ) ) ( not ( = ?auto_18259 ?auto_18282 ) ) ( not ( = ?auto_18263 ?auto_18260 ) ) ( not ( = ?auto_18263 ?auto_18282 ) ) ( not ( = ?auto_18260 ?auto_18295 ) ) ( not ( = ?auto_18260 ?auto_18284 ) ) ( not ( = ?auto_18260 ?auto_18296 ) ) ( not ( = ?auto_18260 ?auto_18294 ) ) ( not ( = ?auto_18260 ?auto_18286 ) ) ( not ( = ?auto_18260 ?auto_18280 ) ) ( not ( = ?auto_18260 ?auto_18279 ) ) ( not ( = ?auto_18260 ?auto_18274 ) ) ( not ( = ?auto_18276 ?auto_18267 ) ) ( not ( = ?auto_18276 ?auto_18277 ) ) ( not ( = ?auto_18276 ?auto_18285 ) ) ( not ( = ?auto_18276 ?auto_18297 ) ) ( not ( = ?auto_18276 ?auto_18299 ) ) ( not ( = ?auto_18276 ?auto_18281 ) ) ( not ( = ?auto_18276 ?auto_18288 ) ) ( not ( = ?auto_18293 ?auto_18272 ) ) ( not ( = ?auto_18293 ?auto_18291 ) ) ( not ( = ?auto_18293 ?auto_18298 ) ) ( not ( = ?auto_18293 ?auto_18283 ) ) ( not ( = ?auto_18293 ?auto_18289 ) ) ( not ( = ?auto_18293 ?auto_18273 ) ) ( not ( = ?auto_18293 ?auto_18275 ) ) ( not ( = ?auto_18282 ?auto_18295 ) ) ( not ( = ?auto_18282 ?auto_18284 ) ) ( not ( = ?auto_18282 ?auto_18296 ) ) ( not ( = ?auto_18282 ?auto_18294 ) ) ( not ( = ?auto_18282 ?auto_18286 ) ) ( not ( = ?auto_18282 ?auto_18280 ) ) ( not ( = ?auto_18282 ?auto_18279 ) ) ( not ( = ?auto_18282 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18265 ) ) ( not ( = ?auto_18254 ?auto_18278 ) ) ( not ( = ?auto_18255 ?auto_18265 ) ) ( not ( = ?auto_18255 ?auto_18278 ) ) ( not ( = ?auto_18256 ?auto_18265 ) ) ( not ( = ?auto_18256 ?auto_18278 ) ) ( not ( = ?auto_18257 ?auto_18265 ) ) ( not ( = ?auto_18257 ?auto_18278 ) ) ( not ( = ?auto_18258 ?auto_18265 ) ) ( not ( = ?auto_18258 ?auto_18278 ) ) ( not ( = ?auto_18261 ?auto_18265 ) ) ( not ( = ?auto_18261 ?auto_18278 ) ) ( not ( = ?auto_18259 ?auto_18265 ) ) ( not ( = ?auto_18259 ?auto_18278 ) ) ( not ( = ?auto_18263 ?auto_18265 ) ) ( not ( = ?auto_18263 ?auto_18278 ) ) ( not ( = ?auto_18262 ?auto_18265 ) ) ( not ( = ?auto_18262 ?auto_18278 ) ) ( not ( = ?auto_18265 ?auto_18282 ) ) ( not ( = ?auto_18265 ?auto_18295 ) ) ( not ( = ?auto_18265 ?auto_18284 ) ) ( not ( = ?auto_18265 ?auto_18296 ) ) ( not ( = ?auto_18265 ?auto_18294 ) ) ( not ( = ?auto_18265 ?auto_18286 ) ) ( not ( = ?auto_18265 ?auto_18280 ) ) ( not ( = ?auto_18265 ?auto_18279 ) ) ( not ( = ?auto_18265 ?auto_18274 ) ) ( not ( = ?auto_18278 ?auto_18282 ) ) ( not ( = ?auto_18278 ?auto_18295 ) ) ( not ( = ?auto_18278 ?auto_18284 ) ) ( not ( = ?auto_18278 ?auto_18296 ) ) ( not ( = ?auto_18278 ?auto_18294 ) ) ( not ( = ?auto_18278 ?auto_18286 ) ) ( not ( = ?auto_18278 ?auto_18280 ) ) ( not ( = ?auto_18278 ?auto_18279 ) ) ( not ( = ?auto_18278 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18264 ) ) ( not ( = ?auto_18254 ?auto_18290 ) ) ( not ( = ?auto_18255 ?auto_18264 ) ) ( not ( = ?auto_18255 ?auto_18290 ) ) ( not ( = ?auto_18256 ?auto_18264 ) ) ( not ( = ?auto_18256 ?auto_18290 ) ) ( not ( = ?auto_18257 ?auto_18264 ) ) ( not ( = ?auto_18257 ?auto_18290 ) ) ( not ( = ?auto_18258 ?auto_18264 ) ) ( not ( = ?auto_18258 ?auto_18290 ) ) ( not ( = ?auto_18261 ?auto_18264 ) ) ( not ( = ?auto_18261 ?auto_18290 ) ) ( not ( = ?auto_18259 ?auto_18264 ) ) ( not ( = ?auto_18259 ?auto_18290 ) ) ( not ( = ?auto_18263 ?auto_18264 ) ) ( not ( = ?auto_18263 ?auto_18290 ) ) ( not ( = ?auto_18262 ?auto_18264 ) ) ( not ( = ?auto_18262 ?auto_18290 ) ) ( not ( = ?auto_18260 ?auto_18264 ) ) ( not ( = ?auto_18260 ?auto_18290 ) ) ( not ( = ?auto_18264 ?auto_18278 ) ) ( not ( = ?auto_18264 ?auto_18282 ) ) ( not ( = ?auto_18264 ?auto_18295 ) ) ( not ( = ?auto_18264 ?auto_18284 ) ) ( not ( = ?auto_18264 ?auto_18296 ) ) ( not ( = ?auto_18264 ?auto_18294 ) ) ( not ( = ?auto_18264 ?auto_18286 ) ) ( not ( = ?auto_18264 ?auto_18280 ) ) ( not ( = ?auto_18264 ?auto_18279 ) ) ( not ( = ?auto_18264 ?auto_18274 ) ) ( not ( = ?auto_18292 ?auto_18277 ) ) ( not ( = ?auto_18292 ?auto_18276 ) ) ( not ( = ?auto_18292 ?auto_18267 ) ) ( not ( = ?auto_18292 ?auto_18285 ) ) ( not ( = ?auto_18292 ?auto_18297 ) ) ( not ( = ?auto_18292 ?auto_18299 ) ) ( not ( = ?auto_18292 ?auto_18281 ) ) ( not ( = ?auto_18292 ?auto_18288 ) ) ( not ( = ?auto_18287 ?auto_18291 ) ) ( not ( = ?auto_18287 ?auto_18293 ) ) ( not ( = ?auto_18287 ?auto_18272 ) ) ( not ( = ?auto_18287 ?auto_18298 ) ) ( not ( = ?auto_18287 ?auto_18283 ) ) ( not ( = ?auto_18287 ?auto_18289 ) ) ( not ( = ?auto_18287 ?auto_18273 ) ) ( not ( = ?auto_18287 ?auto_18275 ) ) ( not ( = ?auto_18290 ?auto_18278 ) ) ( not ( = ?auto_18290 ?auto_18282 ) ) ( not ( = ?auto_18290 ?auto_18295 ) ) ( not ( = ?auto_18290 ?auto_18284 ) ) ( not ( = ?auto_18290 ?auto_18296 ) ) ( not ( = ?auto_18290 ?auto_18294 ) ) ( not ( = ?auto_18290 ?auto_18286 ) ) ( not ( = ?auto_18290 ?auto_18280 ) ) ( not ( = ?auto_18290 ?auto_18279 ) ) ( not ( = ?auto_18290 ?auto_18274 ) ) ( not ( = ?auto_18254 ?auto_18266 ) ) ( not ( = ?auto_18254 ?auto_18268 ) ) ( not ( = ?auto_18255 ?auto_18266 ) ) ( not ( = ?auto_18255 ?auto_18268 ) ) ( not ( = ?auto_18256 ?auto_18266 ) ) ( not ( = ?auto_18256 ?auto_18268 ) ) ( not ( = ?auto_18257 ?auto_18266 ) ) ( not ( = ?auto_18257 ?auto_18268 ) ) ( not ( = ?auto_18258 ?auto_18266 ) ) ( not ( = ?auto_18258 ?auto_18268 ) ) ( not ( = ?auto_18261 ?auto_18266 ) ) ( not ( = ?auto_18261 ?auto_18268 ) ) ( not ( = ?auto_18259 ?auto_18266 ) ) ( not ( = ?auto_18259 ?auto_18268 ) ) ( not ( = ?auto_18263 ?auto_18266 ) ) ( not ( = ?auto_18263 ?auto_18268 ) ) ( not ( = ?auto_18262 ?auto_18266 ) ) ( not ( = ?auto_18262 ?auto_18268 ) ) ( not ( = ?auto_18260 ?auto_18266 ) ) ( not ( = ?auto_18260 ?auto_18268 ) ) ( not ( = ?auto_18265 ?auto_18266 ) ) ( not ( = ?auto_18265 ?auto_18268 ) ) ( not ( = ?auto_18266 ?auto_18290 ) ) ( not ( = ?auto_18266 ?auto_18278 ) ) ( not ( = ?auto_18266 ?auto_18282 ) ) ( not ( = ?auto_18266 ?auto_18295 ) ) ( not ( = ?auto_18266 ?auto_18284 ) ) ( not ( = ?auto_18266 ?auto_18296 ) ) ( not ( = ?auto_18266 ?auto_18294 ) ) ( not ( = ?auto_18266 ?auto_18286 ) ) ( not ( = ?auto_18266 ?auto_18280 ) ) ( not ( = ?auto_18266 ?auto_18279 ) ) ( not ( = ?auto_18266 ?auto_18274 ) ) ( not ( = ?auto_18268 ?auto_18290 ) ) ( not ( = ?auto_18268 ?auto_18278 ) ) ( not ( = ?auto_18268 ?auto_18282 ) ) ( not ( = ?auto_18268 ?auto_18295 ) ) ( not ( = ?auto_18268 ?auto_18284 ) ) ( not ( = ?auto_18268 ?auto_18296 ) ) ( not ( = ?auto_18268 ?auto_18294 ) ) ( not ( = ?auto_18268 ?auto_18286 ) ) ( not ( = ?auto_18268 ?auto_18280 ) ) ( not ( = ?auto_18268 ?auto_18279 ) ) ( not ( = ?auto_18268 ?auto_18274 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_18254 ?auto_18255 ?auto_18256 ?auto_18257 ?auto_18258 ?auto_18261 ?auto_18259 ?auto_18263 ?auto_18262 ?auto_18260 ?auto_18265 ?auto_18264 )
      ( MAKE-1CRATE ?auto_18264 ?auto_18266 )
      ( MAKE-12CRATE-VERIFY ?auto_18254 ?auto_18255 ?auto_18256 ?auto_18257 ?auto_18258 ?auto_18261 ?auto_18259 ?auto_18263 ?auto_18262 ?auto_18260 ?auto_18265 ?auto_18264 ?auto_18266 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18302 - SURFACE
      ?auto_18303 - SURFACE
    )
    :vars
    (
      ?auto_18304 - HOIST
      ?auto_18305 - PLACE
      ?auto_18307 - PLACE
      ?auto_18308 - HOIST
      ?auto_18309 - SURFACE
      ?auto_18306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18304 ?auto_18305 ) ( SURFACE-AT ?auto_18302 ?auto_18305 ) ( CLEAR ?auto_18302 ) ( IS-CRATE ?auto_18303 ) ( AVAILABLE ?auto_18304 ) ( not ( = ?auto_18307 ?auto_18305 ) ) ( HOIST-AT ?auto_18308 ?auto_18307 ) ( AVAILABLE ?auto_18308 ) ( SURFACE-AT ?auto_18303 ?auto_18307 ) ( ON ?auto_18303 ?auto_18309 ) ( CLEAR ?auto_18303 ) ( TRUCK-AT ?auto_18306 ?auto_18305 ) ( not ( = ?auto_18302 ?auto_18303 ) ) ( not ( = ?auto_18302 ?auto_18309 ) ) ( not ( = ?auto_18303 ?auto_18309 ) ) ( not ( = ?auto_18304 ?auto_18308 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18306 ?auto_18305 ?auto_18307 )
      ( !LIFT ?auto_18308 ?auto_18303 ?auto_18309 ?auto_18307 )
      ( !LOAD ?auto_18308 ?auto_18303 ?auto_18306 ?auto_18307 )
      ( !DRIVE ?auto_18306 ?auto_18307 ?auto_18305 )
      ( !UNLOAD ?auto_18304 ?auto_18303 ?auto_18306 ?auto_18305 )
      ( !DROP ?auto_18304 ?auto_18303 ?auto_18302 ?auto_18305 )
      ( MAKE-1CRATE-VERIFY ?auto_18302 ?auto_18303 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_18324 - SURFACE
      ?auto_18325 - SURFACE
      ?auto_18326 - SURFACE
      ?auto_18327 - SURFACE
      ?auto_18328 - SURFACE
      ?auto_18331 - SURFACE
      ?auto_18329 - SURFACE
      ?auto_18333 - SURFACE
      ?auto_18332 - SURFACE
      ?auto_18330 - SURFACE
      ?auto_18335 - SURFACE
      ?auto_18334 - SURFACE
      ?auto_18336 - SURFACE
      ?auto_18337 - SURFACE
    )
    :vars
    (
      ?auto_18342 - HOIST
      ?auto_18340 - PLACE
      ?auto_18339 - PLACE
      ?auto_18343 - HOIST
      ?auto_18341 - SURFACE
      ?auto_18368 - PLACE
      ?auto_18347 - HOIST
      ?auto_18369 - SURFACE
      ?auto_18344 - SURFACE
      ?auto_18350 - PLACE
      ?auto_18366 - HOIST
      ?auto_18359 - SURFACE
      ?auto_18357 - PLACE
      ?auto_18352 - HOIST
      ?auto_18360 - SURFACE
      ?auto_18371 - SURFACE
      ?auto_18351 - SURFACE
      ?auto_18349 - PLACE
      ?auto_18364 - HOIST
      ?auto_18363 - SURFACE
      ?auto_18370 - PLACE
      ?auto_18348 - HOIST
      ?auto_18361 - SURFACE
      ?auto_18346 - PLACE
      ?auto_18362 - HOIST
      ?auto_18367 - SURFACE
      ?auto_18345 - SURFACE
      ?auto_18353 - PLACE
      ?auto_18365 - HOIST
      ?auto_18356 - SURFACE
      ?auto_18354 - PLACE
      ?auto_18358 - HOIST
      ?auto_18355 - SURFACE
      ?auto_18338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18342 ?auto_18340 ) ( IS-CRATE ?auto_18337 ) ( not ( = ?auto_18339 ?auto_18340 ) ) ( HOIST-AT ?auto_18343 ?auto_18339 ) ( SURFACE-AT ?auto_18337 ?auto_18339 ) ( ON ?auto_18337 ?auto_18341 ) ( CLEAR ?auto_18337 ) ( not ( = ?auto_18336 ?auto_18337 ) ) ( not ( = ?auto_18336 ?auto_18341 ) ) ( not ( = ?auto_18337 ?auto_18341 ) ) ( not ( = ?auto_18342 ?auto_18343 ) ) ( IS-CRATE ?auto_18336 ) ( not ( = ?auto_18368 ?auto_18340 ) ) ( HOIST-AT ?auto_18347 ?auto_18368 ) ( SURFACE-AT ?auto_18336 ?auto_18368 ) ( ON ?auto_18336 ?auto_18369 ) ( CLEAR ?auto_18336 ) ( not ( = ?auto_18334 ?auto_18336 ) ) ( not ( = ?auto_18334 ?auto_18369 ) ) ( not ( = ?auto_18336 ?auto_18369 ) ) ( not ( = ?auto_18342 ?auto_18347 ) ) ( IS-CRATE ?auto_18334 ) ( AVAILABLE ?auto_18343 ) ( SURFACE-AT ?auto_18334 ?auto_18339 ) ( ON ?auto_18334 ?auto_18344 ) ( CLEAR ?auto_18334 ) ( not ( = ?auto_18335 ?auto_18334 ) ) ( not ( = ?auto_18335 ?auto_18344 ) ) ( not ( = ?auto_18334 ?auto_18344 ) ) ( IS-CRATE ?auto_18335 ) ( not ( = ?auto_18350 ?auto_18340 ) ) ( HOIST-AT ?auto_18366 ?auto_18350 ) ( SURFACE-AT ?auto_18335 ?auto_18350 ) ( ON ?auto_18335 ?auto_18359 ) ( CLEAR ?auto_18335 ) ( not ( = ?auto_18330 ?auto_18335 ) ) ( not ( = ?auto_18330 ?auto_18359 ) ) ( not ( = ?auto_18335 ?auto_18359 ) ) ( not ( = ?auto_18342 ?auto_18366 ) ) ( IS-CRATE ?auto_18330 ) ( not ( = ?auto_18357 ?auto_18340 ) ) ( HOIST-AT ?auto_18352 ?auto_18357 ) ( AVAILABLE ?auto_18352 ) ( SURFACE-AT ?auto_18330 ?auto_18357 ) ( ON ?auto_18330 ?auto_18360 ) ( CLEAR ?auto_18330 ) ( not ( = ?auto_18332 ?auto_18330 ) ) ( not ( = ?auto_18332 ?auto_18360 ) ) ( not ( = ?auto_18330 ?auto_18360 ) ) ( not ( = ?auto_18342 ?auto_18352 ) ) ( IS-CRATE ?auto_18332 ) ( AVAILABLE ?auto_18347 ) ( SURFACE-AT ?auto_18332 ?auto_18368 ) ( ON ?auto_18332 ?auto_18371 ) ( CLEAR ?auto_18332 ) ( not ( = ?auto_18333 ?auto_18332 ) ) ( not ( = ?auto_18333 ?auto_18371 ) ) ( not ( = ?auto_18332 ?auto_18371 ) ) ( IS-CRATE ?auto_18333 ) ( AVAILABLE ?auto_18366 ) ( SURFACE-AT ?auto_18333 ?auto_18350 ) ( ON ?auto_18333 ?auto_18351 ) ( CLEAR ?auto_18333 ) ( not ( = ?auto_18329 ?auto_18333 ) ) ( not ( = ?auto_18329 ?auto_18351 ) ) ( not ( = ?auto_18333 ?auto_18351 ) ) ( IS-CRATE ?auto_18329 ) ( not ( = ?auto_18349 ?auto_18340 ) ) ( HOIST-AT ?auto_18364 ?auto_18349 ) ( SURFACE-AT ?auto_18329 ?auto_18349 ) ( ON ?auto_18329 ?auto_18363 ) ( CLEAR ?auto_18329 ) ( not ( = ?auto_18331 ?auto_18329 ) ) ( not ( = ?auto_18331 ?auto_18363 ) ) ( not ( = ?auto_18329 ?auto_18363 ) ) ( not ( = ?auto_18342 ?auto_18364 ) ) ( IS-CRATE ?auto_18331 ) ( not ( = ?auto_18370 ?auto_18340 ) ) ( HOIST-AT ?auto_18348 ?auto_18370 ) ( AVAILABLE ?auto_18348 ) ( SURFACE-AT ?auto_18331 ?auto_18370 ) ( ON ?auto_18331 ?auto_18361 ) ( CLEAR ?auto_18331 ) ( not ( = ?auto_18328 ?auto_18331 ) ) ( not ( = ?auto_18328 ?auto_18361 ) ) ( not ( = ?auto_18331 ?auto_18361 ) ) ( not ( = ?auto_18342 ?auto_18348 ) ) ( IS-CRATE ?auto_18328 ) ( not ( = ?auto_18346 ?auto_18340 ) ) ( HOIST-AT ?auto_18362 ?auto_18346 ) ( AVAILABLE ?auto_18362 ) ( SURFACE-AT ?auto_18328 ?auto_18346 ) ( ON ?auto_18328 ?auto_18367 ) ( CLEAR ?auto_18328 ) ( not ( = ?auto_18327 ?auto_18328 ) ) ( not ( = ?auto_18327 ?auto_18367 ) ) ( not ( = ?auto_18328 ?auto_18367 ) ) ( not ( = ?auto_18342 ?auto_18362 ) ) ( IS-CRATE ?auto_18327 ) ( AVAILABLE ?auto_18364 ) ( SURFACE-AT ?auto_18327 ?auto_18349 ) ( ON ?auto_18327 ?auto_18345 ) ( CLEAR ?auto_18327 ) ( not ( = ?auto_18326 ?auto_18327 ) ) ( not ( = ?auto_18326 ?auto_18345 ) ) ( not ( = ?auto_18327 ?auto_18345 ) ) ( IS-CRATE ?auto_18326 ) ( not ( = ?auto_18353 ?auto_18340 ) ) ( HOIST-AT ?auto_18365 ?auto_18353 ) ( AVAILABLE ?auto_18365 ) ( SURFACE-AT ?auto_18326 ?auto_18353 ) ( ON ?auto_18326 ?auto_18356 ) ( CLEAR ?auto_18326 ) ( not ( = ?auto_18325 ?auto_18326 ) ) ( not ( = ?auto_18325 ?auto_18356 ) ) ( not ( = ?auto_18326 ?auto_18356 ) ) ( not ( = ?auto_18342 ?auto_18365 ) ) ( SURFACE-AT ?auto_18324 ?auto_18340 ) ( CLEAR ?auto_18324 ) ( IS-CRATE ?auto_18325 ) ( AVAILABLE ?auto_18342 ) ( not ( = ?auto_18354 ?auto_18340 ) ) ( HOIST-AT ?auto_18358 ?auto_18354 ) ( AVAILABLE ?auto_18358 ) ( SURFACE-AT ?auto_18325 ?auto_18354 ) ( ON ?auto_18325 ?auto_18355 ) ( CLEAR ?auto_18325 ) ( TRUCK-AT ?auto_18338 ?auto_18340 ) ( not ( = ?auto_18324 ?auto_18325 ) ) ( not ( = ?auto_18324 ?auto_18355 ) ) ( not ( = ?auto_18325 ?auto_18355 ) ) ( not ( = ?auto_18342 ?auto_18358 ) ) ( not ( = ?auto_18324 ?auto_18326 ) ) ( not ( = ?auto_18324 ?auto_18356 ) ) ( not ( = ?auto_18326 ?auto_18355 ) ) ( not ( = ?auto_18353 ?auto_18354 ) ) ( not ( = ?auto_18365 ?auto_18358 ) ) ( not ( = ?auto_18356 ?auto_18355 ) ) ( not ( = ?auto_18324 ?auto_18327 ) ) ( not ( = ?auto_18324 ?auto_18345 ) ) ( not ( = ?auto_18325 ?auto_18327 ) ) ( not ( = ?auto_18325 ?auto_18345 ) ) ( not ( = ?auto_18327 ?auto_18356 ) ) ( not ( = ?auto_18327 ?auto_18355 ) ) ( not ( = ?auto_18349 ?auto_18353 ) ) ( not ( = ?auto_18349 ?auto_18354 ) ) ( not ( = ?auto_18364 ?auto_18365 ) ) ( not ( = ?auto_18364 ?auto_18358 ) ) ( not ( = ?auto_18345 ?auto_18356 ) ) ( not ( = ?auto_18345 ?auto_18355 ) ) ( not ( = ?auto_18324 ?auto_18328 ) ) ( not ( = ?auto_18324 ?auto_18367 ) ) ( not ( = ?auto_18325 ?auto_18328 ) ) ( not ( = ?auto_18325 ?auto_18367 ) ) ( not ( = ?auto_18326 ?auto_18328 ) ) ( not ( = ?auto_18326 ?auto_18367 ) ) ( not ( = ?auto_18328 ?auto_18345 ) ) ( not ( = ?auto_18328 ?auto_18356 ) ) ( not ( = ?auto_18328 ?auto_18355 ) ) ( not ( = ?auto_18346 ?auto_18349 ) ) ( not ( = ?auto_18346 ?auto_18353 ) ) ( not ( = ?auto_18346 ?auto_18354 ) ) ( not ( = ?auto_18362 ?auto_18364 ) ) ( not ( = ?auto_18362 ?auto_18365 ) ) ( not ( = ?auto_18362 ?auto_18358 ) ) ( not ( = ?auto_18367 ?auto_18345 ) ) ( not ( = ?auto_18367 ?auto_18356 ) ) ( not ( = ?auto_18367 ?auto_18355 ) ) ( not ( = ?auto_18324 ?auto_18331 ) ) ( not ( = ?auto_18324 ?auto_18361 ) ) ( not ( = ?auto_18325 ?auto_18331 ) ) ( not ( = ?auto_18325 ?auto_18361 ) ) ( not ( = ?auto_18326 ?auto_18331 ) ) ( not ( = ?auto_18326 ?auto_18361 ) ) ( not ( = ?auto_18327 ?auto_18331 ) ) ( not ( = ?auto_18327 ?auto_18361 ) ) ( not ( = ?auto_18331 ?auto_18367 ) ) ( not ( = ?auto_18331 ?auto_18345 ) ) ( not ( = ?auto_18331 ?auto_18356 ) ) ( not ( = ?auto_18331 ?auto_18355 ) ) ( not ( = ?auto_18370 ?auto_18346 ) ) ( not ( = ?auto_18370 ?auto_18349 ) ) ( not ( = ?auto_18370 ?auto_18353 ) ) ( not ( = ?auto_18370 ?auto_18354 ) ) ( not ( = ?auto_18348 ?auto_18362 ) ) ( not ( = ?auto_18348 ?auto_18364 ) ) ( not ( = ?auto_18348 ?auto_18365 ) ) ( not ( = ?auto_18348 ?auto_18358 ) ) ( not ( = ?auto_18361 ?auto_18367 ) ) ( not ( = ?auto_18361 ?auto_18345 ) ) ( not ( = ?auto_18361 ?auto_18356 ) ) ( not ( = ?auto_18361 ?auto_18355 ) ) ( not ( = ?auto_18324 ?auto_18329 ) ) ( not ( = ?auto_18324 ?auto_18363 ) ) ( not ( = ?auto_18325 ?auto_18329 ) ) ( not ( = ?auto_18325 ?auto_18363 ) ) ( not ( = ?auto_18326 ?auto_18329 ) ) ( not ( = ?auto_18326 ?auto_18363 ) ) ( not ( = ?auto_18327 ?auto_18329 ) ) ( not ( = ?auto_18327 ?auto_18363 ) ) ( not ( = ?auto_18328 ?auto_18329 ) ) ( not ( = ?auto_18328 ?auto_18363 ) ) ( not ( = ?auto_18329 ?auto_18361 ) ) ( not ( = ?auto_18329 ?auto_18367 ) ) ( not ( = ?auto_18329 ?auto_18345 ) ) ( not ( = ?auto_18329 ?auto_18356 ) ) ( not ( = ?auto_18329 ?auto_18355 ) ) ( not ( = ?auto_18363 ?auto_18361 ) ) ( not ( = ?auto_18363 ?auto_18367 ) ) ( not ( = ?auto_18363 ?auto_18345 ) ) ( not ( = ?auto_18363 ?auto_18356 ) ) ( not ( = ?auto_18363 ?auto_18355 ) ) ( not ( = ?auto_18324 ?auto_18333 ) ) ( not ( = ?auto_18324 ?auto_18351 ) ) ( not ( = ?auto_18325 ?auto_18333 ) ) ( not ( = ?auto_18325 ?auto_18351 ) ) ( not ( = ?auto_18326 ?auto_18333 ) ) ( not ( = ?auto_18326 ?auto_18351 ) ) ( not ( = ?auto_18327 ?auto_18333 ) ) ( not ( = ?auto_18327 ?auto_18351 ) ) ( not ( = ?auto_18328 ?auto_18333 ) ) ( not ( = ?auto_18328 ?auto_18351 ) ) ( not ( = ?auto_18331 ?auto_18333 ) ) ( not ( = ?auto_18331 ?auto_18351 ) ) ( not ( = ?auto_18333 ?auto_18363 ) ) ( not ( = ?auto_18333 ?auto_18361 ) ) ( not ( = ?auto_18333 ?auto_18367 ) ) ( not ( = ?auto_18333 ?auto_18345 ) ) ( not ( = ?auto_18333 ?auto_18356 ) ) ( not ( = ?auto_18333 ?auto_18355 ) ) ( not ( = ?auto_18350 ?auto_18349 ) ) ( not ( = ?auto_18350 ?auto_18370 ) ) ( not ( = ?auto_18350 ?auto_18346 ) ) ( not ( = ?auto_18350 ?auto_18353 ) ) ( not ( = ?auto_18350 ?auto_18354 ) ) ( not ( = ?auto_18366 ?auto_18364 ) ) ( not ( = ?auto_18366 ?auto_18348 ) ) ( not ( = ?auto_18366 ?auto_18362 ) ) ( not ( = ?auto_18366 ?auto_18365 ) ) ( not ( = ?auto_18366 ?auto_18358 ) ) ( not ( = ?auto_18351 ?auto_18363 ) ) ( not ( = ?auto_18351 ?auto_18361 ) ) ( not ( = ?auto_18351 ?auto_18367 ) ) ( not ( = ?auto_18351 ?auto_18345 ) ) ( not ( = ?auto_18351 ?auto_18356 ) ) ( not ( = ?auto_18351 ?auto_18355 ) ) ( not ( = ?auto_18324 ?auto_18332 ) ) ( not ( = ?auto_18324 ?auto_18371 ) ) ( not ( = ?auto_18325 ?auto_18332 ) ) ( not ( = ?auto_18325 ?auto_18371 ) ) ( not ( = ?auto_18326 ?auto_18332 ) ) ( not ( = ?auto_18326 ?auto_18371 ) ) ( not ( = ?auto_18327 ?auto_18332 ) ) ( not ( = ?auto_18327 ?auto_18371 ) ) ( not ( = ?auto_18328 ?auto_18332 ) ) ( not ( = ?auto_18328 ?auto_18371 ) ) ( not ( = ?auto_18331 ?auto_18332 ) ) ( not ( = ?auto_18331 ?auto_18371 ) ) ( not ( = ?auto_18329 ?auto_18332 ) ) ( not ( = ?auto_18329 ?auto_18371 ) ) ( not ( = ?auto_18332 ?auto_18351 ) ) ( not ( = ?auto_18332 ?auto_18363 ) ) ( not ( = ?auto_18332 ?auto_18361 ) ) ( not ( = ?auto_18332 ?auto_18367 ) ) ( not ( = ?auto_18332 ?auto_18345 ) ) ( not ( = ?auto_18332 ?auto_18356 ) ) ( not ( = ?auto_18332 ?auto_18355 ) ) ( not ( = ?auto_18368 ?auto_18350 ) ) ( not ( = ?auto_18368 ?auto_18349 ) ) ( not ( = ?auto_18368 ?auto_18370 ) ) ( not ( = ?auto_18368 ?auto_18346 ) ) ( not ( = ?auto_18368 ?auto_18353 ) ) ( not ( = ?auto_18368 ?auto_18354 ) ) ( not ( = ?auto_18347 ?auto_18366 ) ) ( not ( = ?auto_18347 ?auto_18364 ) ) ( not ( = ?auto_18347 ?auto_18348 ) ) ( not ( = ?auto_18347 ?auto_18362 ) ) ( not ( = ?auto_18347 ?auto_18365 ) ) ( not ( = ?auto_18347 ?auto_18358 ) ) ( not ( = ?auto_18371 ?auto_18351 ) ) ( not ( = ?auto_18371 ?auto_18363 ) ) ( not ( = ?auto_18371 ?auto_18361 ) ) ( not ( = ?auto_18371 ?auto_18367 ) ) ( not ( = ?auto_18371 ?auto_18345 ) ) ( not ( = ?auto_18371 ?auto_18356 ) ) ( not ( = ?auto_18371 ?auto_18355 ) ) ( not ( = ?auto_18324 ?auto_18330 ) ) ( not ( = ?auto_18324 ?auto_18360 ) ) ( not ( = ?auto_18325 ?auto_18330 ) ) ( not ( = ?auto_18325 ?auto_18360 ) ) ( not ( = ?auto_18326 ?auto_18330 ) ) ( not ( = ?auto_18326 ?auto_18360 ) ) ( not ( = ?auto_18327 ?auto_18330 ) ) ( not ( = ?auto_18327 ?auto_18360 ) ) ( not ( = ?auto_18328 ?auto_18330 ) ) ( not ( = ?auto_18328 ?auto_18360 ) ) ( not ( = ?auto_18331 ?auto_18330 ) ) ( not ( = ?auto_18331 ?auto_18360 ) ) ( not ( = ?auto_18329 ?auto_18330 ) ) ( not ( = ?auto_18329 ?auto_18360 ) ) ( not ( = ?auto_18333 ?auto_18330 ) ) ( not ( = ?auto_18333 ?auto_18360 ) ) ( not ( = ?auto_18330 ?auto_18371 ) ) ( not ( = ?auto_18330 ?auto_18351 ) ) ( not ( = ?auto_18330 ?auto_18363 ) ) ( not ( = ?auto_18330 ?auto_18361 ) ) ( not ( = ?auto_18330 ?auto_18367 ) ) ( not ( = ?auto_18330 ?auto_18345 ) ) ( not ( = ?auto_18330 ?auto_18356 ) ) ( not ( = ?auto_18330 ?auto_18355 ) ) ( not ( = ?auto_18357 ?auto_18368 ) ) ( not ( = ?auto_18357 ?auto_18350 ) ) ( not ( = ?auto_18357 ?auto_18349 ) ) ( not ( = ?auto_18357 ?auto_18370 ) ) ( not ( = ?auto_18357 ?auto_18346 ) ) ( not ( = ?auto_18357 ?auto_18353 ) ) ( not ( = ?auto_18357 ?auto_18354 ) ) ( not ( = ?auto_18352 ?auto_18347 ) ) ( not ( = ?auto_18352 ?auto_18366 ) ) ( not ( = ?auto_18352 ?auto_18364 ) ) ( not ( = ?auto_18352 ?auto_18348 ) ) ( not ( = ?auto_18352 ?auto_18362 ) ) ( not ( = ?auto_18352 ?auto_18365 ) ) ( not ( = ?auto_18352 ?auto_18358 ) ) ( not ( = ?auto_18360 ?auto_18371 ) ) ( not ( = ?auto_18360 ?auto_18351 ) ) ( not ( = ?auto_18360 ?auto_18363 ) ) ( not ( = ?auto_18360 ?auto_18361 ) ) ( not ( = ?auto_18360 ?auto_18367 ) ) ( not ( = ?auto_18360 ?auto_18345 ) ) ( not ( = ?auto_18360 ?auto_18356 ) ) ( not ( = ?auto_18360 ?auto_18355 ) ) ( not ( = ?auto_18324 ?auto_18335 ) ) ( not ( = ?auto_18324 ?auto_18359 ) ) ( not ( = ?auto_18325 ?auto_18335 ) ) ( not ( = ?auto_18325 ?auto_18359 ) ) ( not ( = ?auto_18326 ?auto_18335 ) ) ( not ( = ?auto_18326 ?auto_18359 ) ) ( not ( = ?auto_18327 ?auto_18335 ) ) ( not ( = ?auto_18327 ?auto_18359 ) ) ( not ( = ?auto_18328 ?auto_18335 ) ) ( not ( = ?auto_18328 ?auto_18359 ) ) ( not ( = ?auto_18331 ?auto_18335 ) ) ( not ( = ?auto_18331 ?auto_18359 ) ) ( not ( = ?auto_18329 ?auto_18335 ) ) ( not ( = ?auto_18329 ?auto_18359 ) ) ( not ( = ?auto_18333 ?auto_18335 ) ) ( not ( = ?auto_18333 ?auto_18359 ) ) ( not ( = ?auto_18332 ?auto_18335 ) ) ( not ( = ?auto_18332 ?auto_18359 ) ) ( not ( = ?auto_18335 ?auto_18360 ) ) ( not ( = ?auto_18335 ?auto_18371 ) ) ( not ( = ?auto_18335 ?auto_18351 ) ) ( not ( = ?auto_18335 ?auto_18363 ) ) ( not ( = ?auto_18335 ?auto_18361 ) ) ( not ( = ?auto_18335 ?auto_18367 ) ) ( not ( = ?auto_18335 ?auto_18345 ) ) ( not ( = ?auto_18335 ?auto_18356 ) ) ( not ( = ?auto_18335 ?auto_18355 ) ) ( not ( = ?auto_18359 ?auto_18360 ) ) ( not ( = ?auto_18359 ?auto_18371 ) ) ( not ( = ?auto_18359 ?auto_18351 ) ) ( not ( = ?auto_18359 ?auto_18363 ) ) ( not ( = ?auto_18359 ?auto_18361 ) ) ( not ( = ?auto_18359 ?auto_18367 ) ) ( not ( = ?auto_18359 ?auto_18345 ) ) ( not ( = ?auto_18359 ?auto_18356 ) ) ( not ( = ?auto_18359 ?auto_18355 ) ) ( not ( = ?auto_18324 ?auto_18334 ) ) ( not ( = ?auto_18324 ?auto_18344 ) ) ( not ( = ?auto_18325 ?auto_18334 ) ) ( not ( = ?auto_18325 ?auto_18344 ) ) ( not ( = ?auto_18326 ?auto_18334 ) ) ( not ( = ?auto_18326 ?auto_18344 ) ) ( not ( = ?auto_18327 ?auto_18334 ) ) ( not ( = ?auto_18327 ?auto_18344 ) ) ( not ( = ?auto_18328 ?auto_18334 ) ) ( not ( = ?auto_18328 ?auto_18344 ) ) ( not ( = ?auto_18331 ?auto_18334 ) ) ( not ( = ?auto_18331 ?auto_18344 ) ) ( not ( = ?auto_18329 ?auto_18334 ) ) ( not ( = ?auto_18329 ?auto_18344 ) ) ( not ( = ?auto_18333 ?auto_18334 ) ) ( not ( = ?auto_18333 ?auto_18344 ) ) ( not ( = ?auto_18332 ?auto_18334 ) ) ( not ( = ?auto_18332 ?auto_18344 ) ) ( not ( = ?auto_18330 ?auto_18334 ) ) ( not ( = ?auto_18330 ?auto_18344 ) ) ( not ( = ?auto_18334 ?auto_18359 ) ) ( not ( = ?auto_18334 ?auto_18360 ) ) ( not ( = ?auto_18334 ?auto_18371 ) ) ( not ( = ?auto_18334 ?auto_18351 ) ) ( not ( = ?auto_18334 ?auto_18363 ) ) ( not ( = ?auto_18334 ?auto_18361 ) ) ( not ( = ?auto_18334 ?auto_18367 ) ) ( not ( = ?auto_18334 ?auto_18345 ) ) ( not ( = ?auto_18334 ?auto_18356 ) ) ( not ( = ?auto_18334 ?auto_18355 ) ) ( not ( = ?auto_18339 ?auto_18350 ) ) ( not ( = ?auto_18339 ?auto_18357 ) ) ( not ( = ?auto_18339 ?auto_18368 ) ) ( not ( = ?auto_18339 ?auto_18349 ) ) ( not ( = ?auto_18339 ?auto_18370 ) ) ( not ( = ?auto_18339 ?auto_18346 ) ) ( not ( = ?auto_18339 ?auto_18353 ) ) ( not ( = ?auto_18339 ?auto_18354 ) ) ( not ( = ?auto_18343 ?auto_18366 ) ) ( not ( = ?auto_18343 ?auto_18352 ) ) ( not ( = ?auto_18343 ?auto_18347 ) ) ( not ( = ?auto_18343 ?auto_18364 ) ) ( not ( = ?auto_18343 ?auto_18348 ) ) ( not ( = ?auto_18343 ?auto_18362 ) ) ( not ( = ?auto_18343 ?auto_18365 ) ) ( not ( = ?auto_18343 ?auto_18358 ) ) ( not ( = ?auto_18344 ?auto_18359 ) ) ( not ( = ?auto_18344 ?auto_18360 ) ) ( not ( = ?auto_18344 ?auto_18371 ) ) ( not ( = ?auto_18344 ?auto_18351 ) ) ( not ( = ?auto_18344 ?auto_18363 ) ) ( not ( = ?auto_18344 ?auto_18361 ) ) ( not ( = ?auto_18344 ?auto_18367 ) ) ( not ( = ?auto_18344 ?auto_18345 ) ) ( not ( = ?auto_18344 ?auto_18356 ) ) ( not ( = ?auto_18344 ?auto_18355 ) ) ( not ( = ?auto_18324 ?auto_18336 ) ) ( not ( = ?auto_18324 ?auto_18369 ) ) ( not ( = ?auto_18325 ?auto_18336 ) ) ( not ( = ?auto_18325 ?auto_18369 ) ) ( not ( = ?auto_18326 ?auto_18336 ) ) ( not ( = ?auto_18326 ?auto_18369 ) ) ( not ( = ?auto_18327 ?auto_18336 ) ) ( not ( = ?auto_18327 ?auto_18369 ) ) ( not ( = ?auto_18328 ?auto_18336 ) ) ( not ( = ?auto_18328 ?auto_18369 ) ) ( not ( = ?auto_18331 ?auto_18336 ) ) ( not ( = ?auto_18331 ?auto_18369 ) ) ( not ( = ?auto_18329 ?auto_18336 ) ) ( not ( = ?auto_18329 ?auto_18369 ) ) ( not ( = ?auto_18333 ?auto_18336 ) ) ( not ( = ?auto_18333 ?auto_18369 ) ) ( not ( = ?auto_18332 ?auto_18336 ) ) ( not ( = ?auto_18332 ?auto_18369 ) ) ( not ( = ?auto_18330 ?auto_18336 ) ) ( not ( = ?auto_18330 ?auto_18369 ) ) ( not ( = ?auto_18335 ?auto_18336 ) ) ( not ( = ?auto_18335 ?auto_18369 ) ) ( not ( = ?auto_18336 ?auto_18344 ) ) ( not ( = ?auto_18336 ?auto_18359 ) ) ( not ( = ?auto_18336 ?auto_18360 ) ) ( not ( = ?auto_18336 ?auto_18371 ) ) ( not ( = ?auto_18336 ?auto_18351 ) ) ( not ( = ?auto_18336 ?auto_18363 ) ) ( not ( = ?auto_18336 ?auto_18361 ) ) ( not ( = ?auto_18336 ?auto_18367 ) ) ( not ( = ?auto_18336 ?auto_18345 ) ) ( not ( = ?auto_18336 ?auto_18356 ) ) ( not ( = ?auto_18336 ?auto_18355 ) ) ( not ( = ?auto_18369 ?auto_18344 ) ) ( not ( = ?auto_18369 ?auto_18359 ) ) ( not ( = ?auto_18369 ?auto_18360 ) ) ( not ( = ?auto_18369 ?auto_18371 ) ) ( not ( = ?auto_18369 ?auto_18351 ) ) ( not ( = ?auto_18369 ?auto_18363 ) ) ( not ( = ?auto_18369 ?auto_18361 ) ) ( not ( = ?auto_18369 ?auto_18367 ) ) ( not ( = ?auto_18369 ?auto_18345 ) ) ( not ( = ?auto_18369 ?auto_18356 ) ) ( not ( = ?auto_18369 ?auto_18355 ) ) ( not ( = ?auto_18324 ?auto_18337 ) ) ( not ( = ?auto_18324 ?auto_18341 ) ) ( not ( = ?auto_18325 ?auto_18337 ) ) ( not ( = ?auto_18325 ?auto_18341 ) ) ( not ( = ?auto_18326 ?auto_18337 ) ) ( not ( = ?auto_18326 ?auto_18341 ) ) ( not ( = ?auto_18327 ?auto_18337 ) ) ( not ( = ?auto_18327 ?auto_18341 ) ) ( not ( = ?auto_18328 ?auto_18337 ) ) ( not ( = ?auto_18328 ?auto_18341 ) ) ( not ( = ?auto_18331 ?auto_18337 ) ) ( not ( = ?auto_18331 ?auto_18341 ) ) ( not ( = ?auto_18329 ?auto_18337 ) ) ( not ( = ?auto_18329 ?auto_18341 ) ) ( not ( = ?auto_18333 ?auto_18337 ) ) ( not ( = ?auto_18333 ?auto_18341 ) ) ( not ( = ?auto_18332 ?auto_18337 ) ) ( not ( = ?auto_18332 ?auto_18341 ) ) ( not ( = ?auto_18330 ?auto_18337 ) ) ( not ( = ?auto_18330 ?auto_18341 ) ) ( not ( = ?auto_18335 ?auto_18337 ) ) ( not ( = ?auto_18335 ?auto_18341 ) ) ( not ( = ?auto_18334 ?auto_18337 ) ) ( not ( = ?auto_18334 ?auto_18341 ) ) ( not ( = ?auto_18337 ?auto_18369 ) ) ( not ( = ?auto_18337 ?auto_18344 ) ) ( not ( = ?auto_18337 ?auto_18359 ) ) ( not ( = ?auto_18337 ?auto_18360 ) ) ( not ( = ?auto_18337 ?auto_18371 ) ) ( not ( = ?auto_18337 ?auto_18351 ) ) ( not ( = ?auto_18337 ?auto_18363 ) ) ( not ( = ?auto_18337 ?auto_18361 ) ) ( not ( = ?auto_18337 ?auto_18367 ) ) ( not ( = ?auto_18337 ?auto_18345 ) ) ( not ( = ?auto_18337 ?auto_18356 ) ) ( not ( = ?auto_18337 ?auto_18355 ) ) ( not ( = ?auto_18341 ?auto_18369 ) ) ( not ( = ?auto_18341 ?auto_18344 ) ) ( not ( = ?auto_18341 ?auto_18359 ) ) ( not ( = ?auto_18341 ?auto_18360 ) ) ( not ( = ?auto_18341 ?auto_18371 ) ) ( not ( = ?auto_18341 ?auto_18351 ) ) ( not ( = ?auto_18341 ?auto_18363 ) ) ( not ( = ?auto_18341 ?auto_18361 ) ) ( not ( = ?auto_18341 ?auto_18367 ) ) ( not ( = ?auto_18341 ?auto_18345 ) ) ( not ( = ?auto_18341 ?auto_18356 ) ) ( not ( = ?auto_18341 ?auto_18355 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_18324 ?auto_18325 ?auto_18326 ?auto_18327 ?auto_18328 ?auto_18331 ?auto_18329 ?auto_18333 ?auto_18332 ?auto_18330 ?auto_18335 ?auto_18334 ?auto_18336 )
      ( MAKE-1CRATE ?auto_18336 ?auto_18337 )
      ( MAKE-13CRATE-VERIFY ?auto_18324 ?auto_18325 ?auto_18326 ?auto_18327 ?auto_18328 ?auto_18331 ?auto_18329 ?auto_18333 ?auto_18332 ?auto_18330 ?auto_18335 ?auto_18334 ?auto_18336 ?auto_18337 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18374 - SURFACE
      ?auto_18375 - SURFACE
    )
    :vars
    (
      ?auto_18376 - HOIST
      ?auto_18377 - PLACE
      ?auto_18379 - PLACE
      ?auto_18380 - HOIST
      ?auto_18381 - SURFACE
      ?auto_18378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18376 ?auto_18377 ) ( SURFACE-AT ?auto_18374 ?auto_18377 ) ( CLEAR ?auto_18374 ) ( IS-CRATE ?auto_18375 ) ( AVAILABLE ?auto_18376 ) ( not ( = ?auto_18379 ?auto_18377 ) ) ( HOIST-AT ?auto_18380 ?auto_18379 ) ( AVAILABLE ?auto_18380 ) ( SURFACE-AT ?auto_18375 ?auto_18379 ) ( ON ?auto_18375 ?auto_18381 ) ( CLEAR ?auto_18375 ) ( TRUCK-AT ?auto_18378 ?auto_18377 ) ( not ( = ?auto_18374 ?auto_18375 ) ) ( not ( = ?auto_18374 ?auto_18381 ) ) ( not ( = ?auto_18375 ?auto_18381 ) ) ( not ( = ?auto_18376 ?auto_18380 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18378 ?auto_18377 ?auto_18379 )
      ( !LIFT ?auto_18380 ?auto_18375 ?auto_18381 ?auto_18379 )
      ( !LOAD ?auto_18380 ?auto_18375 ?auto_18378 ?auto_18379 )
      ( !DRIVE ?auto_18378 ?auto_18379 ?auto_18377 )
      ( !UNLOAD ?auto_18376 ?auto_18375 ?auto_18378 ?auto_18377 )
      ( !DROP ?auto_18376 ?auto_18375 ?auto_18374 ?auto_18377 )
      ( MAKE-1CRATE-VERIFY ?auto_18374 ?auto_18375 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_18397 - SURFACE
      ?auto_18398 - SURFACE
      ?auto_18399 - SURFACE
      ?auto_18400 - SURFACE
      ?auto_18401 - SURFACE
      ?auto_18404 - SURFACE
      ?auto_18402 - SURFACE
      ?auto_18406 - SURFACE
      ?auto_18405 - SURFACE
      ?auto_18403 - SURFACE
      ?auto_18408 - SURFACE
      ?auto_18407 - SURFACE
      ?auto_18409 - SURFACE
      ?auto_18410 - SURFACE
      ?auto_18411 - SURFACE
    )
    :vars
    (
      ?auto_18413 - HOIST
      ?auto_18416 - PLACE
      ?auto_18417 - PLACE
      ?auto_18415 - HOIST
      ?auto_18414 - SURFACE
      ?auto_18420 - SURFACE
      ?auto_18444 - PLACE
      ?auto_18433 - HOIST
      ?auto_18431 - SURFACE
      ?auto_18418 - SURFACE
      ?auto_18425 - PLACE
      ?auto_18436 - HOIST
      ?auto_18441 - SURFACE
      ?auto_18423 - PLACE
      ?auto_18422 - HOIST
      ?auto_18427 - SURFACE
      ?auto_18419 - SURFACE
      ?auto_18430 - SURFACE
      ?auto_18443 - PLACE
      ?auto_18445 - HOIST
      ?auto_18440 - SURFACE
      ?auto_18429 - PLACE
      ?auto_18435 - HOIST
      ?auto_18438 - SURFACE
      ?auto_18432 - PLACE
      ?auto_18446 - HOIST
      ?auto_18439 - SURFACE
      ?auto_18434 - SURFACE
      ?auto_18437 - PLACE
      ?auto_18426 - HOIST
      ?auto_18428 - SURFACE
      ?auto_18442 - PLACE
      ?auto_18421 - HOIST
      ?auto_18424 - SURFACE
      ?auto_18412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18413 ?auto_18416 ) ( IS-CRATE ?auto_18411 ) ( not ( = ?auto_18417 ?auto_18416 ) ) ( HOIST-AT ?auto_18415 ?auto_18417 ) ( SURFACE-AT ?auto_18411 ?auto_18417 ) ( ON ?auto_18411 ?auto_18414 ) ( CLEAR ?auto_18411 ) ( not ( = ?auto_18410 ?auto_18411 ) ) ( not ( = ?auto_18410 ?auto_18414 ) ) ( not ( = ?auto_18411 ?auto_18414 ) ) ( not ( = ?auto_18413 ?auto_18415 ) ) ( IS-CRATE ?auto_18410 ) ( SURFACE-AT ?auto_18410 ?auto_18417 ) ( ON ?auto_18410 ?auto_18420 ) ( CLEAR ?auto_18410 ) ( not ( = ?auto_18409 ?auto_18410 ) ) ( not ( = ?auto_18409 ?auto_18420 ) ) ( not ( = ?auto_18410 ?auto_18420 ) ) ( IS-CRATE ?auto_18409 ) ( not ( = ?auto_18444 ?auto_18416 ) ) ( HOIST-AT ?auto_18433 ?auto_18444 ) ( SURFACE-AT ?auto_18409 ?auto_18444 ) ( ON ?auto_18409 ?auto_18431 ) ( CLEAR ?auto_18409 ) ( not ( = ?auto_18407 ?auto_18409 ) ) ( not ( = ?auto_18407 ?auto_18431 ) ) ( not ( = ?auto_18409 ?auto_18431 ) ) ( not ( = ?auto_18413 ?auto_18433 ) ) ( IS-CRATE ?auto_18407 ) ( AVAILABLE ?auto_18415 ) ( SURFACE-AT ?auto_18407 ?auto_18417 ) ( ON ?auto_18407 ?auto_18418 ) ( CLEAR ?auto_18407 ) ( not ( = ?auto_18408 ?auto_18407 ) ) ( not ( = ?auto_18408 ?auto_18418 ) ) ( not ( = ?auto_18407 ?auto_18418 ) ) ( IS-CRATE ?auto_18408 ) ( not ( = ?auto_18425 ?auto_18416 ) ) ( HOIST-AT ?auto_18436 ?auto_18425 ) ( SURFACE-AT ?auto_18408 ?auto_18425 ) ( ON ?auto_18408 ?auto_18441 ) ( CLEAR ?auto_18408 ) ( not ( = ?auto_18403 ?auto_18408 ) ) ( not ( = ?auto_18403 ?auto_18441 ) ) ( not ( = ?auto_18408 ?auto_18441 ) ) ( not ( = ?auto_18413 ?auto_18436 ) ) ( IS-CRATE ?auto_18403 ) ( not ( = ?auto_18423 ?auto_18416 ) ) ( HOIST-AT ?auto_18422 ?auto_18423 ) ( AVAILABLE ?auto_18422 ) ( SURFACE-AT ?auto_18403 ?auto_18423 ) ( ON ?auto_18403 ?auto_18427 ) ( CLEAR ?auto_18403 ) ( not ( = ?auto_18405 ?auto_18403 ) ) ( not ( = ?auto_18405 ?auto_18427 ) ) ( not ( = ?auto_18403 ?auto_18427 ) ) ( not ( = ?auto_18413 ?auto_18422 ) ) ( IS-CRATE ?auto_18405 ) ( AVAILABLE ?auto_18433 ) ( SURFACE-AT ?auto_18405 ?auto_18444 ) ( ON ?auto_18405 ?auto_18419 ) ( CLEAR ?auto_18405 ) ( not ( = ?auto_18406 ?auto_18405 ) ) ( not ( = ?auto_18406 ?auto_18419 ) ) ( not ( = ?auto_18405 ?auto_18419 ) ) ( IS-CRATE ?auto_18406 ) ( AVAILABLE ?auto_18436 ) ( SURFACE-AT ?auto_18406 ?auto_18425 ) ( ON ?auto_18406 ?auto_18430 ) ( CLEAR ?auto_18406 ) ( not ( = ?auto_18402 ?auto_18406 ) ) ( not ( = ?auto_18402 ?auto_18430 ) ) ( not ( = ?auto_18406 ?auto_18430 ) ) ( IS-CRATE ?auto_18402 ) ( not ( = ?auto_18443 ?auto_18416 ) ) ( HOIST-AT ?auto_18445 ?auto_18443 ) ( SURFACE-AT ?auto_18402 ?auto_18443 ) ( ON ?auto_18402 ?auto_18440 ) ( CLEAR ?auto_18402 ) ( not ( = ?auto_18404 ?auto_18402 ) ) ( not ( = ?auto_18404 ?auto_18440 ) ) ( not ( = ?auto_18402 ?auto_18440 ) ) ( not ( = ?auto_18413 ?auto_18445 ) ) ( IS-CRATE ?auto_18404 ) ( not ( = ?auto_18429 ?auto_18416 ) ) ( HOIST-AT ?auto_18435 ?auto_18429 ) ( AVAILABLE ?auto_18435 ) ( SURFACE-AT ?auto_18404 ?auto_18429 ) ( ON ?auto_18404 ?auto_18438 ) ( CLEAR ?auto_18404 ) ( not ( = ?auto_18401 ?auto_18404 ) ) ( not ( = ?auto_18401 ?auto_18438 ) ) ( not ( = ?auto_18404 ?auto_18438 ) ) ( not ( = ?auto_18413 ?auto_18435 ) ) ( IS-CRATE ?auto_18401 ) ( not ( = ?auto_18432 ?auto_18416 ) ) ( HOIST-AT ?auto_18446 ?auto_18432 ) ( AVAILABLE ?auto_18446 ) ( SURFACE-AT ?auto_18401 ?auto_18432 ) ( ON ?auto_18401 ?auto_18439 ) ( CLEAR ?auto_18401 ) ( not ( = ?auto_18400 ?auto_18401 ) ) ( not ( = ?auto_18400 ?auto_18439 ) ) ( not ( = ?auto_18401 ?auto_18439 ) ) ( not ( = ?auto_18413 ?auto_18446 ) ) ( IS-CRATE ?auto_18400 ) ( AVAILABLE ?auto_18445 ) ( SURFACE-AT ?auto_18400 ?auto_18443 ) ( ON ?auto_18400 ?auto_18434 ) ( CLEAR ?auto_18400 ) ( not ( = ?auto_18399 ?auto_18400 ) ) ( not ( = ?auto_18399 ?auto_18434 ) ) ( not ( = ?auto_18400 ?auto_18434 ) ) ( IS-CRATE ?auto_18399 ) ( not ( = ?auto_18437 ?auto_18416 ) ) ( HOIST-AT ?auto_18426 ?auto_18437 ) ( AVAILABLE ?auto_18426 ) ( SURFACE-AT ?auto_18399 ?auto_18437 ) ( ON ?auto_18399 ?auto_18428 ) ( CLEAR ?auto_18399 ) ( not ( = ?auto_18398 ?auto_18399 ) ) ( not ( = ?auto_18398 ?auto_18428 ) ) ( not ( = ?auto_18399 ?auto_18428 ) ) ( not ( = ?auto_18413 ?auto_18426 ) ) ( SURFACE-AT ?auto_18397 ?auto_18416 ) ( CLEAR ?auto_18397 ) ( IS-CRATE ?auto_18398 ) ( AVAILABLE ?auto_18413 ) ( not ( = ?auto_18442 ?auto_18416 ) ) ( HOIST-AT ?auto_18421 ?auto_18442 ) ( AVAILABLE ?auto_18421 ) ( SURFACE-AT ?auto_18398 ?auto_18442 ) ( ON ?auto_18398 ?auto_18424 ) ( CLEAR ?auto_18398 ) ( TRUCK-AT ?auto_18412 ?auto_18416 ) ( not ( = ?auto_18397 ?auto_18398 ) ) ( not ( = ?auto_18397 ?auto_18424 ) ) ( not ( = ?auto_18398 ?auto_18424 ) ) ( not ( = ?auto_18413 ?auto_18421 ) ) ( not ( = ?auto_18397 ?auto_18399 ) ) ( not ( = ?auto_18397 ?auto_18428 ) ) ( not ( = ?auto_18399 ?auto_18424 ) ) ( not ( = ?auto_18437 ?auto_18442 ) ) ( not ( = ?auto_18426 ?auto_18421 ) ) ( not ( = ?auto_18428 ?auto_18424 ) ) ( not ( = ?auto_18397 ?auto_18400 ) ) ( not ( = ?auto_18397 ?auto_18434 ) ) ( not ( = ?auto_18398 ?auto_18400 ) ) ( not ( = ?auto_18398 ?auto_18434 ) ) ( not ( = ?auto_18400 ?auto_18428 ) ) ( not ( = ?auto_18400 ?auto_18424 ) ) ( not ( = ?auto_18443 ?auto_18437 ) ) ( not ( = ?auto_18443 ?auto_18442 ) ) ( not ( = ?auto_18445 ?auto_18426 ) ) ( not ( = ?auto_18445 ?auto_18421 ) ) ( not ( = ?auto_18434 ?auto_18428 ) ) ( not ( = ?auto_18434 ?auto_18424 ) ) ( not ( = ?auto_18397 ?auto_18401 ) ) ( not ( = ?auto_18397 ?auto_18439 ) ) ( not ( = ?auto_18398 ?auto_18401 ) ) ( not ( = ?auto_18398 ?auto_18439 ) ) ( not ( = ?auto_18399 ?auto_18401 ) ) ( not ( = ?auto_18399 ?auto_18439 ) ) ( not ( = ?auto_18401 ?auto_18434 ) ) ( not ( = ?auto_18401 ?auto_18428 ) ) ( not ( = ?auto_18401 ?auto_18424 ) ) ( not ( = ?auto_18432 ?auto_18443 ) ) ( not ( = ?auto_18432 ?auto_18437 ) ) ( not ( = ?auto_18432 ?auto_18442 ) ) ( not ( = ?auto_18446 ?auto_18445 ) ) ( not ( = ?auto_18446 ?auto_18426 ) ) ( not ( = ?auto_18446 ?auto_18421 ) ) ( not ( = ?auto_18439 ?auto_18434 ) ) ( not ( = ?auto_18439 ?auto_18428 ) ) ( not ( = ?auto_18439 ?auto_18424 ) ) ( not ( = ?auto_18397 ?auto_18404 ) ) ( not ( = ?auto_18397 ?auto_18438 ) ) ( not ( = ?auto_18398 ?auto_18404 ) ) ( not ( = ?auto_18398 ?auto_18438 ) ) ( not ( = ?auto_18399 ?auto_18404 ) ) ( not ( = ?auto_18399 ?auto_18438 ) ) ( not ( = ?auto_18400 ?auto_18404 ) ) ( not ( = ?auto_18400 ?auto_18438 ) ) ( not ( = ?auto_18404 ?auto_18439 ) ) ( not ( = ?auto_18404 ?auto_18434 ) ) ( not ( = ?auto_18404 ?auto_18428 ) ) ( not ( = ?auto_18404 ?auto_18424 ) ) ( not ( = ?auto_18429 ?auto_18432 ) ) ( not ( = ?auto_18429 ?auto_18443 ) ) ( not ( = ?auto_18429 ?auto_18437 ) ) ( not ( = ?auto_18429 ?auto_18442 ) ) ( not ( = ?auto_18435 ?auto_18446 ) ) ( not ( = ?auto_18435 ?auto_18445 ) ) ( not ( = ?auto_18435 ?auto_18426 ) ) ( not ( = ?auto_18435 ?auto_18421 ) ) ( not ( = ?auto_18438 ?auto_18439 ) ) ( not ( = ?auto_18438 ?auto_18434 ) ) ( not ( = ?auto_18438 ?auto_18428 ) ) ( not ( = ?auto_18438 ?auto_18424 ) ) ( not ( = ?auto_18397 ?auto_18402 ) ) ( not ( = ?auto_18397 ?auto_18440 ) ) ( not ( = ?auto_18398 ?auto_18402 ) ) ( not ( = ?auto_18398 ?auto_18440 ) ) ( not ( = ?auto_18399 ?auto_18402 ) ) ( not ( = ?auto_18399 ?auto_18440 ) ) ( not ( = ?auto_18400 ?auto_18402 ) ) ( not ( = ?auto_18400 ?auto_18440 ) ) ( not ( = ?auto_18401 ?auto_18402 ) ) ( not ( = ?auto_18401 ?auto_18440 ) ) ( not ( = ?auto_18402 ?auto_18438 ) ) ( not ( = ?auto_18402 ?auto_18439 ) ) ( not ( = ?auto_18402 ?auto_18434 ) ) ( not ( = ?auto_18402 ?auto_18428 ) ) ( not ( = ?auto_18402 ?auto_18424 ) ) ( not ( = ?auto_18440 ?auto_18438 ) ) ( not ( = ?auto_18440 ?auto_18439 ) ) ( not ( = ?auto_18440 ?auto_18434 ) ) ( not ( = ?auto_18440 ?auto_18428 ) ) ( not ( = ?auto_18440 ?auto_18424 ) ) ( not ( = ?auto_18397 ?auto_18406 ) ) ( not ( = ?auto_18397 ?auto_18430 ) ) ( not ( = ?auto_18398 ?auto_18406 ) ) ( not ( = ?auto_18398 ?auto_18430 ) ) ( not ( = ?auto_18399 ?auto_18406 ) ) ( not ( = ?auto_18399 ?auto_18430 ) ) ( not ( = ?auto_18400 ?auto_18406 ) ) ( not ( = ?auto_18400 ?auto_18430 ) ) ( not ( = ?auto_18401 ?auto_18406 ) ) ( not ( = ?auto_18401 ?auto_18430 ) ) ( not ( = ?auto_18404 ?auto_18406 ) ) ( not ( = ?auto_18404 ?auto_18430 ) ) ( not ( = ?auto_18406 ?auto_18440 ) ) ( not ( = ?auto_18406 ?auto_18438 ) ) ( not ( = ?auto_18406 ?auto_18439 ) ) ( not ( = ?auto_18406 ?auto_18434 ) ) ( not ( = ?auto_18406 ?auto_18428 ) ) ( not ( = ?auto_18406 ?auto_18424 ) ) ( not ( = ?auto_18425 ?auto_18443 ) ) ( not ( = ?auto_18425 ?auto_18429 ) ) ( not ( = ?auto_18425 ?auto_18432 ) ) ( not ( = ?auto_18425 ?auto_18437 ) ) ( not ( = ?auto_18425 ?auto_18442 ) ) ( not ( = ?auto_18436 ?auto_18445 ) ) ( not ( = ?auto_18436 ?auto_18435 ) ) ( not ( = ?auto_18436 ?auto_18446 ) ) ( not ( = ?auto_18436 ?auto_18426 ) ) ( not ( = ?auto_18436 ?auto_18421 ) ) ( not ( = ?auto_18430 ?auto_18440 ) ) ( not ( = ?auto_18430 ?auto_18438 ) ) ( not ( = ?auto_18430 ?auto_18439 ) ) ( not ( = ?auto_18430 ?auto_18434 ) ) ( not ( = ?auto_18430 ?auto_18428 ) ) ( not ( = ?auto_18430 ?auto_18424 ) ) ( not ( = ?auto_18397 ?auto_18405 ) ) ( not ( = ?auto_18397 ?auto_18419 ) ) ( not ( = ?auto_18398 ?auto_18405 ) ) ( not ( = ?auto_18398 ?auto_18419 ) ) ( not ( = ?auto_18399 ?auto_18405 ) ) ( not ( = ?auto_18399 ?auto_18419 ) ) ( not ( = ?auto_18400 ?auto_18405 ) ) ( not ( = ?auto_18400 ?auto_18419 ) ) ( not ( = ?auto_18401 ?auto_18405 ) ) ( not ( = ?auto_18401 ?auto_18419 ) ) ( not ( = ?auto_18404 ?auto_18405 ) ) ( not ( = ?auto_18404 ?auto_18419 ) ) ( not ( = ?auto_18402 ?auto_18405 ) ) ( not ( = ?auto_18402 ?auto_18419 ) ) ( not ( = ?auto_18405 ?auto_18430 ) ) ( not ( = ?auto_18405 ?auto_18440 ) ) ( not ( = ?auto_18405 ?auto_18438 ) ) ( not ( = ?auto_18405 ?auto_18439 ) ) ( not ( = ?auto_18405 ?auto_18434 ) ) ( not ( = ?auto_18405 ?auto_18428 ) ) ( not ( = ?auto_18405 ?auto_18424 ) ) ( not ( = ?auto_18444 ?auto_18425 ) ) ( not ( = ?auto_18444 ?auto_18443 ) ) ( not ( = ?auto_18444 ?auto_18429 ) ) ( not ( = ?auto_18444 ?auto_18432 ) ) ( not ( = ?auto_18444 ?auto_18437 ) ) ( not ( = ?auto_18444 ?auto_18442 ) ) ( not ( = ?auto_18433 ?auto_18436 ) ) ( not ( = ?auto_18433 ?auto_18445 ) ) ( not ( = ?auto_18433 ?auto_18435 ) ) ( not ( = ?auto_18433 ?auto_18446 ) ) ( not ( = ?auto_18433 ?auto_18426 ) ) ( not ( = ?auto_18433 ?auto_18421 ) ) ( not ( = ?auto_18419 ?auto_18430 ) ) ( not ( = ?auto_18419 ?auto_18440 ) ) ( not ( = ?auto_18419 ?auto_18438 ) ) ( not ( = ?auto_18419 ?auto_18439 ) ) ( not ( = ?auto_18419 ?auto_18434 ) ) ( not ( = ?auto_18419 ?auto_18428 ) ) ( not ( = ?auto_18419 ?auto_18424 ) ) ( not ( = ?auto_18397 ?auto_18403 ) ) ( not ( = ?auto_18397 ?auto_18427 ) ) ( not ( = ?auto_18398 ?auto_18403 ) ) ( not ( = ?auto_18398 ?auto_18427 ) ) ( not ( = ?auto_18399 ?auto_18403 ) ) ( not ( = ?auto_18399 ?auto_18427 ) ) ( not ( = ?auto_18400 ?auto_18403 ) ) ( not ( = ?auto_18400 ?auto_18427 ) ) ( not ( = ?auto_18401 ?auto_18403 ) ) ( not ( = ?auto_18401 ?auto_18427 ) ) ( not ( = ?auto_18404 ?auto_18403 ) ) ( not ( = ?auto_18404 ?auto_18427 ) ) ( not ( = ?auto_18402 ?auto_18403 ) ) ( not ( = ?auto_18402 ?auto_18427 ) ) ( not ( = ?auto_18406 ?auto_18403 ) ) ( not ( = ?auto_18406 ?auto_18427 ) ) ( not ( = ?auto_18403 ?auto_18419 ) ) ( not ( = ?auto_18403 ?auto_18430 ) ) ( not ( = ?auto_18403 ?auto_18440 ) ) ( not ( = ?auto_18403 ?auto_18438 ) ) ( not ( = ?auto_18403 ?auto_18439 ) ) ( not ( = ?auto_18403 ?auto_18434 ) ) ( not ( = ?auto_18403 ?auto_18428 ) ) ( not ( = ?auto_18403 ?auto_18424 ) ) ( not ( = ?auto_18423 ?auto_18444 ) ) ( not ( = ?auto_18423 ?auto_18425 ) ) ( not ( = ?auto_18423 ?auto_18443 ) ) ( not ( = ?auto_18423 ?auto_18429 ) ) ( not ( = ?auto_18423 ?auto_18432 ) ) ( not ( = ?auto_18423 ?auto_18437 ) ) ( not ( = ?auto_18423 ?auto_18442 ) ) ( not ( = ?auto_18422 ?auto_18433 ) ) ( not ( = ?auto_18422 ?auto_18436 ) ) ( not ( = ?auto_18422 ?auto_18445 ) ) ( not ( = ?auto_18422 ?auto_18435 ) ) ( not ( = ?auto_18422 ?auto_18446 ) ) ( not ( = ?auto_18422 ?auto_18426 ) ) ( not ( = ?auto_18422 ?auto_18421 ) ) ( not ( = ?auto_18427 ?auto_18419 ) ) ( not ( = ?auto_18427 ?auto_18430 ) ) ( not ( = ?auto_18427 ?auto_18440 ) ) ( not ( = ?auto_18427 ?auto_18438 ) ) ( not ( = ?auto_18427 ?auto_18439 ) ) ( not ( = ?auto_18427 ?auto_18434 ) ) ( not ( = ?auto_18427 ?auto_18428 ) ) ( not ( = ?auto_18427 ?auto_18424 ) ) ( not ( = ?auto_18397 ?auto_18408 ) ) ( not ( = ?auto_18397 ?auto_18441 ) ) ( not ( = ?auto_18398 ?auto_18408 ) ) ( not ( = ?auto_18398 ?auto_18441 ) ) ( not ( = ?auto_18399 ?auto_18408 ) ) ( not ( = ?auto_18399 ?auto_18441 ) ) ( not ( = ?auto_18400 ?auto_18408 ) ) ( not ( = ?auto_18400 ?auto_18441 ) ) ( not ( = ?auto_18401 ?auto_18408 ) ) ( not ( = ?auto_18401 ?auto_18441 ) ) ( not ( = ?auto_18404 ?auto_18408 ) ) ( not ( = ?auto_18404 ?auto_18441 ) ) ( not ( = ?auto_18402 ?auto_18408 ) ) ( not ( = ?auto_18402 ?auto_18441 ) ) ( not ( = ?auto_18406 ?auto_18408 ) ) ( not ( = ?auto_18406 ?auto_18441 ) ) ( not ( = ?auto_18405 ?auto_18408 ) ) ( not ( = ?auto_18405 ?auto_18441 ) ) ( not ( = ?auto_18408 ?auto_18427 ) ) ( not ( = ?auto_18408 ?auto_18419 ) ) ( not ( = ?auto_18408 ?auto_18430 ) ) ( not ( = ?auto_18408 ?auto_18440 ) ) ( not ( = ?auto_18408 ?auto_18438 ) ) ( not ( = ?auto_18408 ?auto_18439 ) ) ( not ( = ?auto_18408 ?auto_18434 ) ) ( not ( = ?auto_18408 ?auto_18428 ) ) ( not ( = ?auto_18408 ?auto_18424 ) ) ( not ( = ?auto_18441 ?auto_18427 ) ) ( not ( = ?auto_18441 ?auto_18419 ) ) ( not ( = ?auto_18441 ?auto_18430 ) ) ( not ( = ?auto_18441 ?auto_18440 ) ) ( not ( = ?auto_18441 ?auto_18438 ) ) ( not ( = ?auto_18441 ?auto_18439 ) ) ( not ( = ?auto_18441 ?auto_18434 ) ) ( not ( = ?auto_18441 ?auto_18428 ) ) ( not ( = ?auto_18441 ?auto_18424 ) ) ( not ( = ?auto_18397 ?auto_18407 ) ) ( not ( = ?auto_18397 ?auto_18418 ) ) ( not ( = ?auto_18398 ?auto_18407 ) ) ( not ( = ?auto_18398 ?auto_18418 ) ) ( not ( = ?auto_18399 ?auto_18407 ) ) ( not ( = ?auto_18399 ?auto_18418 ) ) ( not ( = ?auto_18400 ?auto_18407 ) ) ( not ( = ?auto_18400 ?auto_18418 ) ) ( not ( = ?auto_18401 ?auto_18407 ) ) ( not ( = ?auto_18401 ?auto_18418 ) ) ( not ( = ?auto_18404 ?auto_18407 ) ) ( not ( = ?auto_18404 ?auto_18418 ) ) ( not ( = ?auto_18402 ?auto_18407 ) ) ( not ( = ?auto_18402 ?auto_18418 ) ) ( not ( = ?auto_18406 ?auto_18407 ) ) ( not ( = ?auto_18406 ?auto_18418 ) ) ( not ( = ?auto_18405 ?auto_18407 ) ) ( not ( = ?auto_18405 ?auto_18418 ) ) ( not ( = ?auto_18403 ?auto_18407 ) ) ( not ( = ?auto_18403 ?auto_18418 ) ) ( not ( = ?auto_18407 ?auto_18441 ) ) ( not ( = ?auto_18407 ?auto_18427 ) ) ( not ( = ?auto_18407 ?auto_18419 ) ) ( not ( = ?auto_18407 ?auto_18430 ) ) ( not ( = ?auto_18407 ?auto_18440 ) ) ( not ( = ?auto_18407 ?auto_18438 ) ) ( not ( = ?auto_18407 ?auto_18439 ) ) ( not ( = ?auto_18407 ?auto_18434 ) ) ( not ( = ?auto_18407 ?auto_18428 ) ) ( not ( = ?auto_18407 ?auto_18424 ) ) ( not ( = ?auto_18417 ?auto_18425 ) ) ( not ( = ?auto_18417 ?auto_18423 ) ) ( not ( = ?auto_18417 ?auto_18444 ) ) ( not ( = ?auto_18417 ?auto_18443 ) ) ( not ( = ?auto_18417 ?auto_18429 ) ) ( not ( = ?auto_18417 ?auto_18432 ) ) ( not ( = ?auto_18417 ?auto_18437 ) ) ( not ( = ?auto_18417 ?auto_18442 ) ) ( not ( = ?auto_18415 ?auto_18436 ) ) ( not ( = ?auto_18415 ?auto_18422 ) ) ( not ( = ?auto_18415 ?auto_18433 ) ) ( not ( = ?auto_18415 ?auto_18445 ) ) ( not ( = ?auto_18415 ?auto_18435 ) ) ( not ( = ?auto_18415 ?auto_18446 ) ) ( not ( = ?auto_18415 ?auto_18426 ) ) ( not ( = ?auto_18415 ?auto_18421 ) ) ( not ( = ?auto_18418 ?auto_18441 ) ) ( not ( = ?auto_18418 ?auto_18427 ) ) ( not ( = ?auto_18418 ?auto_18419 ) ) ( not ( = ?auto_18418 ?auto_18430 ) ) ( not ( = ?auto_18418 ?auto_18440 ) ) ( not ( = ?auto_18418 ?auto_18438 ) ) ( not ( = ?auto_18418 ?auto_18439 ) ) ( not ( = ?auto_18418 ?auto_18434 ) ) ( not ( = ?auto_18418 ?auto_18428 ) ) ( not ( = ?auto_18418 ?auto_18424 ) ) ( not ( = ?auto_18397 ?auto_18409 ) ) ( not ( = ?auto_18397 ?auto_18431 ) ) ( not ( = ?auto_18398 ?auto_18409 ) ) ( not ( = ?auto_18398 ?auto_18431 ) ) ( not ( = ?auto_18399 ?auto_18409 ) ) ( not ( = ?auto_18399 ?auto_18431 ) ) ( not ( = ?auto_18400 ?auto_18409 ) ) ( not ( = ?auto_18400 ?auto_18431 ) ) ( not ( = ?auto_18401 ?auto_18409 ) ) ( not ( = ?auto_18401 ?auto_18431 ) ) ( not ( = ?auto_18404 ?auto_18409 ) ) ( not ( = ?auto_18404 ?auto_18431 ) ) ( not ( = ?auto_18402 ?auto_18409 ) ) ( not ( = ?auto_18402 ?auto_18431 ) ) ( not ( = ?auto_18406 ?auto_18409 ) ) ( not ( = ?auto_18406 ?auto_18431 ) ) ( not ( = ?auto_18405 ?auto_18409 ) ) ( not ( = ?auto_18405 ?auto_18431 ) ) ( not ( = ?auto_18403 ?auto_18409 ) ) ( not ( = ?auto_18403 ?auto_18431 ) ) ( not ( = ?auto_18408 ?auto_18409 ) ) ( not ( = ?auto_18408 ?auto_18431 ) ) ( not ( = ?auto_18409 ?auto_18418 ) ) ( not ( = ?auto_18409 ?auto_18441 ) ) ( not ( = ?auto_18409 ?auto_18427 ) ) ( not ( = ?auto_18409 ?auto_18419 ) ) ( not ( = ?auto_18409 ?auto_18430 ) ) ( not ( = ?auto_18409 ?auto_18440 ) ) ( not ( = ?auto_18409 ?auto_18438 ) ) ( not ( = ?auto_18409 ?auto_18439 ) ) ( not ( = ?auto_18409 ?auto_18434 ) ) ( not ( = ?auto_18409 ?auto_18428 ) ) ( not ( = ?auto_18409 ?auto_18424 ) ) ( not ( = ?auto_18431 ?auto_18418 ) ) ( not ( = ?auto_18431 ?auto_18441 ) ) ( not ( = ?auto_18431 ?auto_18427 ) ) ( not ( = ?auto_18431 ?auto_18419 ) ) ( not ( = ?auto_18431 ?auto_18430 ) ) ( not ( = ?auto_18431 ?auto_18440 ) ) ( not ( = ?auto_18431 ?auto_18438 ) ) ( not ( = ?auto_18431 ?auto_18439 ) ) ( not ( = ?auto_18431 ?auto_18434 ) ) ( not ( = ?auto_18431 ?auto_18428 ) ) ( not ( = ?auto_18431 ?auto_18424 ) ) ( not ( = ?auto_18397 ?auto_18410 ) ) ( not ( = ?auto_18397 ?auto_18420 ) ) ( not ( = ?auto_18398 ?auto_18410 ) ) ( not ( = ?auto_18398 ?auto_18420 ) ) ( not ( = ?auto_18399 ?auto_18410 ) ) ( not ( = ?auto_18399 ?auto_18420 ) ) ( not ( = ?auto_18400 ?auto_18410 ) ) ( not ( = ?auto_18400 ?auto_18420 ) ) ( not ( = ?auto_18401 ?auto_18410 ) ) ( not ( = ?auto_18401 ?auto_18420 ) ) ( not ( = ?auto_18404 ?auto_18410 ) ) ( not ( = ?auto_18404 ?auto_18420 ) ) ( not ( = ?auto_18402 ?auto_18410 ) ) ( not ( = ?auto_18402 ?auto_18420 ) ) ( not ( = ?auto_18406 ?auto_18410 ) ) ( not ( = ?auto_18406 ?auto_18420 ) ) ( not ( = ?auto_18405 ?auto_18410 ) ) ( not ( = ?auto_18405 ?auto_18420 ) ) ( not ( = ?auto_18403 ?auto_18410 ) ) ( not ( = ?auto_18403 ?auto_18420 ) ) ( not ( = ?auto_18408 ?auto_18410 ) ) ( not ( = ?auto_18408 ?auto_18420 ) ) ( not ( = ?auto_18407 ?auto_18410 ) ) ( not ( = ?auto_18407 ?auto_18420 ) ) ( not ( = ?auto_18410 ?auto_18431 ) ) ( not ( = ?auto_18410 ?auto_18418 ) ) ( not ( = ?auto_18410 ?auto_18441 ) ) ( not ( = ?auto_18410 ?auto_18427 ) ) ( not ( = ?auto_18410 ?auto_18419 ) ) ( not ( = ?auto_18410 ?auto_18430 ) ) ( not ( = ?auto_18410 ?auto_18440 ) ) ( not ( = ?auto_18410 ?auto_18438 ) ) ( not ( = ?auto_18410 ?auto_18439 ) ) ( not ( = ?auto_18410 ?auto_18434 ) ) ( not ( = ?auto_18410 ?auto_18428 ) ) ( not ( = ?auto_18410 ?auto_18424 ) ) ( not ( = ?auto_18420 ?auto_18431 ) ) ( not ( = ?auto_18420 ?auto_18418 ) ) ( not ( = ?auto_18420 ?auto_18441 ) ) ( not ( = ?auto_18420 ?auto_18427 ) ) ( not ( = ?auto_18420 ?auto_18419 ) ) ( not ( = ?auto_18420 ?auto_18430 ) ) ( not ( = ?auto_18420 ?auto_18440 ) ) ( not ( = ?auto_18420 ?auto_18438 ) ) ( not ( = ?auto_18420 ?auto_18439 ) ) ( not ( = ?auto_18420 ?auto_18434 ) ) ( not ( = ?auto_18420 ?auto_18428 ) ) ( not ( = ?auto_18420 ?auto_18424 ) ) ( not ( = ?auto_18397 ?auto_18411 ) ) ( not ( = ?auto_18397 ?auto_18414 ) ) ( not ( = ?auto_18398 ?auto_18411 ) ) ( not ( = ?auto_18398 ?auto_18414 ) ) ( not ( = ?auto_18399 ?auto_18411 ) ) ( not ( = ?auto_18399 ?auto_18414 ) ) ( not ( = ?auto_18400 ?auto_18411 ) ) ( not ( = ?auto_18400 ?auto_18414 ) ) ( not ( = ?auto_18401 ?auto_18411 ) ) ( not ( = ?auto_18401 ?auto_18414 ) ) ( not ( = ?auto_18404 ?auto_18411 ) ) ( not ( = ?auto_18404 ?auto_18414 ) ) ( not ( = ?auto_18402 ?auto_18411 ) ) ( not ( = ?auto_18402 ?auto_18414 ) ) ( not ( = ?auto_18406 ?auto_18411 ) ) ( not ( = ?auto_18406 ?auto_18414 ) ) ( not ( = ?auto_18405 ?auto_18411 ) ) ( not ( = ?auto_18405 ?auto_18414 ) ) ( not ( = ?auto_18403 ?auto_18411 ) ) ( not ( = ?auto_18403 ?auto_18414 ) ) ( not ( = ?auto_18408 ?auto_18411 ) ) ( not ( = ?auto_18408 ?auto_18414 ) ) ( not ( = ?auto_18407 ?auto_18411 ) ) ( not ( = ?auto_18407 ?auto_18414 ) ) ( not ( = ?auto_18409 ?auto_18411 ) ) ( not ( = ?auto_18409 ?auto_18414 ) ) ( not ( = ?auto_18411 ?auto_18420 ) ) ( not ( = ?auto_18411 ?auto_18431 ) ) ( not ( = ?auto_18411 ?auto_18418 ) ) ( not ( = ?auto_18411 ?auto_18441 ) ) ( not ( = ?auto_18411 ?auto_18427 ) ) ( not ( = ?auto_18411 ?auto_18419 ) ) ( not ( = ?auto_18411 ?auto_18430 ) ) ( not ( = ?auto_18411 ?auto_18440 ) ) ( not ( = ?auto_18411 ?auto_18438 ) ) ( not ( = ?auto_18411 ?auto_18439 ) ) ( not ( = ?auto_18411 ?auto_18434 ) ) ( not ( = ?auto_18411 ?auto_18428 ) ) ( not ( = ?auto_18411 ?auto_18424 ) ) ( not ( = ?auto_18414 ?auto_18420 ) ) ( not ( = ?auto_18414 ?auto_18431 ) ) ( not ( = ?auto_18414 ?auto_18418 ) ) ( not ( = ?auto_18414 ?auto_18441 ) ) ( not ( = ?auto_18414 ?auto_18427 ) ) ( not ( = ?auto_18414 ?auto_18419 ) ) ( not ( = ?auto_18414 ?auto_18430 ) ) ( not ( = ?auto_18414 ?auto_18440 ) ) ( not ( = ?auto_18414 ?auto_18438 ) ) ( not ( = ?auto_18414 ?auto_18439 ) ) ( not ( = ?auto_18414 ?auto_18434 ) ) ( not ( = ?auto_18414 ?auto_18428 ) ) ( not ( = ?auto_18414 ?auto_18424 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_18397 ?auto_18398 ?auto_18399 ?auto_18400 ?auto_18401 ?auto_18404 ?auto_18402 ?auto_18406 ?auto_18405 ?auto_18403 ?auto_18408 ?auto_18407 ?auto_18409 ?auto_18410 )
      ( MAKE-1CRATE ?auto_18410 ?auto_18411 )
      ( MAKE-14CRATE-VERIFY ?auto_18397 ?auto_18398 ?auto_18399 ?auto_18400 ?auto_18401 ?auto_18404 ?auto_18402 ?auto_18406 ?auto_18405 ?auto_18403 ?auto_18408 ?auto_18407 ?auto_18409 ?auto_18410 ?auto_18411 ) )
  )

)

