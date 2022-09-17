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
      ?auto_1174776 - SURFACE
      ?auto_1174777 - SURFACE
    )
    :vars
    (
      ?auto_1174778 - HOIST
      ?auto_1174779 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174778 ?auto_1174779 ) ( SURFACE-AT ?auto_1174776 ?auto_1174779 ) ( CLEAR ?auto_1174776 ) ( LIFTING ?auto_1174778 ?auto_1174777 ) ( IS-CRATE ?auto_1174777 ) ( not ( = ?auto_1174776 ?auto_1174777 ) ) )
    :subtasks
    ( ( !DROP ?auto_1174778 ?auto_1174777 ?auto_1174776 ?auto_1174779 )
      ( MAKE-1CRATE-VERIFY ?auto_1174776 ?auto_1174777 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174780 - SURFACE
      ?auto_1174781 - SURFACE
    )
    :vars
    (
      ?auto_1174782 - HOIST
      ?auto_1174783 - PLACE
      ?auto_1174784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174782 ?auto_1174783 ) ( SURFACE-AT ?auto_1174780 ?auto_1174783 ) ( CLEAR ?auto_1174780 ) ( IS-CRATE ?auto_1174781 ) ( not ( = ?auto_1174780 ?auto_1174781 ) ) ( TRUCK-AT ?auto_1174784 ?auto_1174783 ) ( AVAILABLE ?auto_1174782 ) ( IN ?auto_1174781 ?auto_1174784 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1174782 ?auto_1174781 ?auto_1174784 ?auto_1174783 )
      ( MAKE-1CRATE ?auto_1174780 ?auto_1174781 )
      ( MAKE-1CRATE-VERIFY ?auto_1174780 ?auto_1174781 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174785 - SURFACE
      ?auto_1174786 - SURFACE
    )
    :vars
    (
      ?auto_1174789 - HOIST
      ?auto_1174788 - PLACE
      ?auto_1174787 - TRUCK
      ?auto_1174790 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174789 ?auto_1174788 ) ( SURFACE-AT ?auto_1174785 ?auto_1174788 ) ( CLEAR ?auto_1174785 ) ( IS-CRATE ?auto_1174786 ) ( not ( = ?auto_1174785 ?auto_1174786 ) ) ( AVAILABLE ?auto_1174789 ) ( IN ?auto_1174786 ?auto_1174787 ) ( TRUCK-AT ?auto_1174787 ?auto_1174790 ) ( not ( = ?auto_1174790 ?auto_1174788 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1174787 ?auto_1174790 ?auto_1174788 )
      ( MAKE-1CRATE ?auto_1174785 ?auto_1174786 )
      ( MAKE-1CRATE-VERIFY ?auto_1174785 ?auto_1174786 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174791 - SURFACE
      ?auto_1174792 - SURFACE
    )
    :vars
    (
      ?auto_1174796 - HOIST
      ?auto_1174795 - PLACE
      ?auto_1174793 - TRUCK
      ?auto_1174794 - PLACE
      ?auto_1174797 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174796 ?auto_1174795 ) ( SURFACE-AT ?auto_1174791 ?auto_1174795 ) ( CLEAR ?auto_1174791 ) ( IS-CRATE ?auto_1174792 ) ( not ( = ?auto_1174791 ?auto_1174792 ) ) ( AVAILABLE ?auto_1174796 ) ( TRUCK-AT ?auto_1174793 ?auto_1174794 ) ( not ( = ?auto_1174794 ?auto_1174795 ) ) ( HOIST-AT ?auto_1174797 ?auto_1174794 ) ( LIFTING ?auto_1174797 ?auto_1174792 ) ( not ( = ?auto_1174796 ?auto_1174797 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1174797 ?auto_1174792 ?auto_1174793 ?auto_1174794 )
      ( MAKE-1CRATE ?auto_1174791 ?auto_1174792 )
      ( MAKE-1CRATE-VERIFY ?auto_1174791 ?auto_1174792 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174798 - SURFACE
      ?auto_1174799 - SURFACE
    )
    :vars
    (
      ?auto_1174804 - HOIST
      ?auto_1174800 - PLACE
      ?auto_1174801 - TRUCK
      ?auto_1174803 - PLACE
      ?auto_1174802 - HOIST
      ?auto_1174805 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174804 ?auto_1174800 ) ( SURFACE-AT ?auto_1174798 ?auto_1174800 ) ( CLEAR ?auto_1174798 ) ( IS-CRATE ?auto_1174799 ) ( not ( = ?auto_1174798 ?auto_1174799 ) ) ( AVAILABLE ?auto_1174804 ) ( TRUCK-AT ?auto_1174801 ?auto_1174803 ) ( not ( = ?auto_1174803 ?auto_1174800 ) ) ( HOIST-AT ?auto_1174802 ?auto_1174803 ) ( not ( = ?auto_1174804 ?auto_1174802 ) ) ( AVAILABLE ?auto_1174802 ) ( SURFACE-AT ?auto_1174799 ?auto_1174803 ) ( ON ?auto_1174799 ?auto_1174805 ) ( CLEAR ?auto_1174799 ) ( not ( = ?auto_1174798 ?auto_1174805 ) ) ( not ( = ?auto_1174799 ?auto_1174805 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1174802 ?auto_1174799 ?auto_1174805 ?auto_1174803 )
      ( MAKE-1CRATE ?auto_1174798 ?auto_1174799 )
      ( MAKE-1CRATE-VERIFY ?auto_1174798 ?auto_1174799 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174806 - SURFACE
      ?auto_1174807 - SURFACE
    )
    :vars
    (
      ?auto_1174813 - HOIST
      ?auto_1174808 - PLACE
      ?auto_1174810 - PLACE
      ?auto_1174809 - HOIST
      ?auto_1174812 - SURFACE
      ?auto_1174811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174813 ?auto_1174808 ) ( SURFACE-AT ?auto_1174806 ?auto_1174808 ) ( CLEAR ?auto_1174806 ) ( IS-CRATE ?auto_1174807 ) ( not ( = ?auto_1174806 ?auto_1174807 ) ) ( AVAILABLE ?auto_1174813 ) ( not ( = ?auto_1174810 ?auto_1174808 ) ) ( HOIST-AT ?auto_1174809 ?auto_1174810 ) ( not ( = ?auto_1174813 ?auto_1174809 ) ) ( AVAILABLE ?auto_1174809 ) ( SURFACE-AT ?auto_1174807 ?auto_1174810 ) ( ON ?auto_1174807 ?auto_1174812 ) ( CLEAR ?auto_1174807 ) ( not ( = ?auto_1174806 ?auto_1174812 ) ) ( not ( = ?auto_1174807 ?auto_1174812 ) ) ( TRUCK-AT ?auto_1174811 ?auto_1174808 ) )
    :subtasks
    ( ( !DRIVE ?auto_1174811 ?auto_1174808 ?auto_1174810 )
      ( MAKE-1CRATE ?auto_1174806 ?auto_1174807 )
      ( MAKE-1CRATE-VERIFY ?auto_1174806 ?auto_1174807 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1174823 - SURFACE
      ?auto_1174824 - SURFACE
      ?auto_1174825 - SURFACE
    )
    :vars
    (
      ?auto_1174826 - HOIST
      ?auto_1174827 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174826 ?auto_1174827 ) ( SURFACE-AT ?auto_1174824 ?auto_1174827 ) ( CLEAR ?auto_1174824 ) ( LIFTING ?auto_1174826 ?auto_1174825 ) ( IS-CRATE ?auto_1174825 ) ( not ( = ?auto_1174824 ?auto_1174825 ) ) ( ON ?auto_1174824 ?auto_1174823 ) ( not ( = ?auto_1174823 ?auto_1174824 ) ) ( not ( = ?auto_1174823 ?auto_1174825 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174824 ?auto_1174825 )
      ( MAKE-2CRATE-VERIFY ?auto_1174823 ?auto_1174824 ?auto_1174825 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1174833 - SURFACE
      ?auto_1174834 - SURFACE
      ?auto_1174835 - SURFACE
    )
    :vars
    (
      ?auto_1174838 - HOIST
      ?auto_1174836 - PLACE
      ?auto_1174837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174838 ?auto_1174836 ) ( SURFACE-AT ?auto_1174834 ?auto_1174836 ) ( CLEAR ?auto_1174834 ) ( IS-CRATE ?auto_1174835 ) ( not ( = ?auto_1174834 ?auto_1174835 ) ) ( TRUCK-AT ?auto_1174837 ?auto_1174836 ) ( AVAILABLE ?auto_1174838 ) ( IN ?auto_1174835 ?auto_1174837 ) ( ON ?auto_1174834 ?auto_1174833 ) ( not ( = ?auto_1174833 ?auto_1174834 ) ) ( not ( = ?auto_1174833 ?auto_1174835 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174834 ?auto_1174835 )
      ( MAKE-2CRATE-VERIFY ?auto_1174833 ?auto_1174834 ?auto_1174835 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174839 - SURFACE
      ?auto_1174840 - SURFACE
    )
    :vars
    (
      ?auto_1174841 - HOIST
      ?auto_1174843 - PLACE
      ?auto_1174844 - TRUCK
      ?auto_1174842 - SURFACE
      ?auto_1174845 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174841 ?auto_1174843 ) ( SURFACE-AT ?auto_1174839 ?auto_1174843 ) ( CLEAR ?auto_1174839 ) ( IS-CRATE ?auto_1174840 ) ( not ( = ?auto_1174839 ?auto_1174840 ) ) ( AVAILABLE ?auto_1174841 ) ( IN ?auto_1174840 ?auto_1174844 ) ( ON ?auto_1174839 ?auto_1174842 ) ( not ( = ?auto_1174842 ?auto_1174839 ) ) ( not ( = ?auto_1174842 ?auto_1174840 ) ) ( TRUCK-AT ?auto_1174844 ?auto_1174845 ) ( not ( = ?auto_1174845 ?auto_1174843 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1174844 ?auto_1174845 ?auto_1174843 )
      ( MAKE-2CRATE ?auto_1174842 ?auto_1174839 ?auto_1174840 )
      ( MAKE-1CRATE-VERIFY ?auto_1174839 ?auto_1174840 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1174846 - SURFACE
      ?auto_1174847 - SURFACE
      ?auto_1174848 - SURFACE
    )
    :vars
    (
      ?auto_1174850 - HOIST
      ?auto_1174852 - PLACE
      ?auto_1174851 - TRUCK
      ?auto_1174849 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174850 ?auto_1174852 ) ( SURFACE-AT ?auto_1174847 ?auto_1174852 ) ( CLEAR ?auto_1174847 ) ( IS-CRATE ?auto_1174848 ) ( not ( = ?auto_1174847 ?auto_1174848 ) ) ( AVAILABLE ?auto_1174850 ) ( IN ?auto_1174848 ?auto_1174851 ) ( ON ?auto_1174847 ?auto_1174846 ) ( not ( = ?auto_1174846 ?auto_1174847 ) ) ( not ( = ?auto_1174846 ?auto_1174848 ) ) ( TRUCK-AT ?auto_1174851 ?auto_1174849 ) ( not ( = ?auto_1174849 ?auto_1174852 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174847 ?auto_1174848 )
      ( MAKE-2CRATE-VERIFY ?auto_1174846 ?auto_1174847 ?auto_1174848 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174853 - SURFACE
      ?auto_1174854 - SURFACE
    )
    :vars
    (
      ?auto_1174856 - HOIST
      ?auto_1174855 - PLACE
      ?auto_1174857 - SURFACE
      ?auto_1174859 - TRUCK
      ?auto_1174858 - PLACE
      ?auto_1174860 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174856 ?auto_1174855 ) ( SURFACE-AT ?auto_1174853 ?auto_1174855 ) ( CLEAR ?auto_1174853 ) ( IS-CRATE ?auto_1174854 ) ( not ( = ?auto_1174853 ?auto_1174854 ) ) ( AVAILABLE ?auto_1174856 ) ( ON ?auto_1174853 ?auto_1174857 ) ( not ( = ?auto_1174857 ?auto_1174853 ) ) ( not ( = ?auto_1174857 ?auto_1174854 ) ) ( TRUCK-AT ?auto_1174859 ?auto_1174858 ) ( not ( = ?auto_1174858 ?auto_1174855 ) ) ( HOIST-AT ?auto_1174860 ?auto_1174858 ) ( LIFTING ?auto_1174860 ?auto_1174854 ) ( not ( = ?auto_1174856 ?auto_1174860 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1174860 ?auto_1174854 ?auto_1174859 ?auto_1174858 )
      ( MAKE-2CRATE ?auto_1174857 ?auto_1174853 ?auto_1174854 )
      ( MAKE-1CRATE-VERIFY ?auto_1174853 ?auto_1174854 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1174861 - SURFACE
      ?auto_1174862 - SURFACE
      ?auto_1174863 - SURFACE
    )
    :vars
    (
      ?auto_1174866 - HOIST
      ?auto_1174868 - PLACE
      ?auto_1174867 - TRUCK
      ?auto_1174864 - PLACE
      ?auto_1174865 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174866 ?auto_1174868 ) ( SURFACE-AT ?auto_1174862 ?auto_1174868 ) ( CLEAR ?auto_1174862 ) ( IS-CRATE ?auto_1174863 ) ( not ( = ?auto_1174862 ?auto_1174863 ) ) ( AVAILABLE ?auto_1174866 ) ( ON ?auto_1174862 ?auto_1174861 ) ( not ( = ?auto_1174861 ?auto_1174862 ) ) ( not ( = ?auto_1174861 ?auto_1174863 ) ) ( TRUCK-AT ?auto_1174867 ?auto_1174864 ) ( not ( = ?auto_1174864 ?auto_1174868 ) ) ( HOIST-AT ?auto_1174865 ?auto_1174864 ) ( LIFTING ?auto_1174865 ?auto_1174863 ) ( not ( = ?auto_1174866 ?auto_1174865 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174862 ?auto_1174863 )
      ( MAKE-2CRATE-VERIFY ?auto_1174861 ?auto_1174862 ?auto_1174863 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174869 - SURFACE
      ?auto_1174870 - SURFACE
    )
    :vars
    (
      ?auto_1174873 - HOIST
      ?auto_1174872 - PLACE
      ?auto_1174874 - SURFACE
      ?auto_1174876 - TRUCK
      ?auto_1174875 - PLACE
      ?auto_1174871 - HOIST
      ?auto_1174877 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174873 ?auto_1174872 ) ( SURFACE-AT ?auto_1174869 ?auto_1174872 ) ( CLEAR ?auto_1174869 ) ( IS-CRATE ?auto_1174870 ) ( not ( = ?auto_1174869 ?auto_1174870 ) ) ( AVAILABLE ?auto_1174873 ) ( ON ?auto_1174869 ?auto_1174874 ) ( not ( = ?auto_1174874 ?auto_1174869 ) ) ( not ( = ?auto_1174874 ?auto_1174870 ) ) ( TRUCK-AT ?auto_1174876 ?auto_1174875 ) ( not ( = ?auto_1174875 ?auto_1174872 ) ) ( HOIST-AT ?auto_1174871 ?auto_1174875 ) ( not ( = ?auto_1174873 ?auto_1174871 ) ) ( AVAILABLE ?auto_1174871 ) ( SURFACE-AT ?auto_1174870 ?auto_1174875 ) ( ON ?auto_1174870 ?auto_1174877 ) ( CLEAR ?auto_1174870 ) ( not ( = ?auto_1174869 ?auto_1174877 ) ) ( not ( = ?auto_1174870 ?auto_1174877 ) ) ( not ( = ?auto_1174874 ?auto_1174877 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1174871 ?auto_1174870 ?auto_1174877 ?auto_1174875 )
      ( MAKE-2CRATE ?auto_1174874 ?auto_1174869 ?auto_1174870 )
      ( MAKE-1CRATE-VERIFY ?auto_1174869 ?auto_1174870 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1174878 - SURFACE
      ?auto_1174879 - SURFACE
      ?auto_1174880 - SURFACE
    )
    :vars
    (
      ?auto_1174881 - HOIST
      ?auto_1174884 - PLACE
      ?auto_1174885 - TRUCK
      ?auto_1174883 - PLACE
      ?auto_1174882 - HOIST
      ?auto_1174886 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174881 ?auto_1174884 ) ( SURFACE-AT ?auto_1174879 ?auto_1174884 ) ( CLEAR ?auto_1174879 ) ( IS-CRATE ?auto_1174880 ) ( not ( = ?auto_1174879 ?auto_1174880 ) ) ( AVAILABLE ?auto_1174881 ) ( ON ?auto_1174879 ?auto_1174878 ) ( not ( = ?auto_1174878 ?auto_1174879 ) ) ( not ( = ?auto_1174878 ?auto_1174880 ) ) ( TRUCK-AT ?auto_1174885 ?auto_1174883 ) ( not ( = ?auto_1174883 ?auto_1174884 ) ) ( HOIST-AT ?auto_1174882 ?auto_1174883 ) ( not ( = ?auto_1174881 ?auto_1174882 ) ) ( AVAILABLE ?auto_1174882 ) ( SURFACE-AT ?auto_1174880 ?auto_1174883 ) ( ON ?auto_1174880 ?auto_1174886 ) ( CLEAR ?auto_1174880 ) ( not ( = ?auto_1174879 ?auto_1174886 ) ) ( not ( = ?auto_1174880 ?auto_1174886 ) ) ( not ( = ?auto_1174878 ?auto_1174886 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174879 ?auto_1174880 )
      ( MAKE-2CRATE-VERIFY ?auto_1174878 ?auto_1174879 ?auto_1174880 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174887 - SURFACE
      ?auto_1174888 - SURFACE
    )
    :vars
    (
      ?auto_1174893 - HOIST
      ?auto_1174894 - PLACE
      ?auto_1174889 - SURFACE
      ?auto_1174891 - PLACE
      ?auto_1174890 - HOIST
      ?auto_1174895 - SURFACE
      ?auto_1174892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174893 ?auto_1174894 ) ( SURFACE-AT ?auto_1174887 ?auto_1174894 ) ( CLEAR ?auto_1174887 ) ( IS-CRATE ?auto_1174888 ) ( not ( = ?auto_1174887 ?auto_1174888 ) ) ( AVAILABLE ?auto_1174893 ) ( ON ?auto_1174887 ?auto_1174889 ) ( not ( = ?auto_1174889 ?auto_1174887 ) ) ( not ( = ?auto_1174889 ?auto_1174888 ) ) ( not ( = ?auto_1174891 ?auto_1174894 ) ) ( HOIST-AT ?auto_1174890 ?auto_1174891 ) ( not ( = ?auto_1174893 ?auto_1174890 ) ) ( AVAILABLE ?auto_1174890 ) ( SURFACE-AT ?auto_1174888 ?auto_1174891 ) ( ON ?auto_1174888 ?auto_1174895 ) ( CLEAR ?auto_1174888 ) ( not ( = ?auto_1174887 ?auto_1174895 ) ) ( not ( = ?auto_1174888 ?auto_1174895 ) ) ( not ( = ?auto_1174889 ?auto_1174895 ) ) ( TRUCK-AT ?auto_1174892 ?auto_1174894 ) )
    :subtasks
    ( ( !DRIVE ?auto_1174892 ?auto_1174894 ?auto_1174891 )
      ( MAKE-2CRATE ?auto_1174889 ?auto_1174887 ?auto_1174888 )
      ( MAKE-1CRATE-VERIFY ?auto_1174887 ?auto_1174888 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1174896 - SURFACE
      ?auto_1174897 - SURFACE
      ?auto_1174898 - SURFACE
    )
    :vars
    (
      ?auto_1174900 - HOIST
      ?auto_1174901 - PLACE
      ?auto_1174903 - PLACE
      ?auto_1174899 - HOIST
      ?auto_1174902 - SURFACE
      ?auto_1174904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174900 ?auto_1174901 ) ( SURFACE-AT ?auto_1174897 ?auto_1174901 ) ( CLEAR ?auto_1174897 ) ( IS-CRATE ?auto_1174898 ) ( not ( = ?auto_1174897 ?auto_1174898 ) ) ( AVAILABLE ?auto_1174900 ) ( ON ?auto_1174897 ?auto_1174896 ) ( not ( = ?auto_1174896 ?auto_1174897 ) ) ( not ( = ?auto_1174896 ?auto_1174898 ) ) ( not ( = ?auto_1174903 ?auto_1174901 ) ) ( HOIST-AT ?auto_1174899 ?auto_1174903 ) ( not ( = ?auto_1174900 ?auto_1174899 ) ) ( AVAILABLE ?auto_1174899 ) ( SURFACE-AT ?auto_1174898 ?auto_1174903 ) ( ON ?auto_1174898 ?auto_1174902 ) ( CLEAR ?auto_1174898 ) ( not ( = ?auto_1174897 ?auto_1174902 ) ) ( not ( = ?auto_1174898 ?auto_1174902 ) ) ( not ( = ?auto_1174896 ?auto_1174902 ) ) ( TRUCK-AT ?auto_1174904 ?auto_1174901 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174897 ?auto_1174898 )
      ( MAKE-2CRATE-VERIFY ?auto_1174896 ?auto_1174897 ?auto_1174898 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174905 - SURFACE
      ?auto_1174906 - SURFACE
    )
    :vars
    (
      ?auto_1174908 - HOIST
      ?auto_1174911 - PLACE
      ?auto_1174907 - SURFACE
      ?auto_1174909 - PLACE
      ?auto_1174913 - HOIST
      ?auto_1174910 - SURFACE
      ?auto_1174912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174908 ?auto_1174911 ) ( IS-CRATE ?auto_1174906 ) ( not ( = ?auto_1174905 ?auto_1174906 ) ) ( not ( = ?auto_1174907 ?auto_1174905 ) ) ( not ( = ?auto_1174907 ?auto_1174906 ) ) ( not ( = ?auto_1174909 ?auto_1174911 ) ) ( HOIST-AT ?auto_1174913 ?auto_1174909 ) ( not ( = ?auto_1174908 ?auto_1174913 ) ) ( AVAILABLE ?auto_1174913 ) ( SURFACE-AT ?auto_1174906 ?auto_1174909 ) ( ON ?auto_1174906 ?auto_1174910 ) ( CLEAR ?auto_1174906 ) ( not ( = ?auto_1174905 ?auto_1174910 ) ) ( not ( = ?auto_1174906 ?auto_1174910 ) ) ( not ( = ?auto_1174907 ?auto_1174910 ) ) ( TRUCK-AT ?auto_1174912 ?auto_1174911 ) ( SURFACE-AT ?auto_1174907 ?auto_1174911 ) ( CLEAR ?auto_1174907 ) ( LIFTING ?auto_1174908 ?auto_1174905 ) ( IS-CRATE ?auto_1174905 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174907 ?auto_1174905 )
      ( MAKE-2CRATE ?auto_1174907 ?auto_1174905 ?auto_1174906 )
      ( MAKE-1CRATE-VERIFY ?auto_1174905 ?auto_1174906 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1174914 - SURFACE
      ?auto_1174915 - SURFACE
      ?auto_1174916 - SURFACE
    )
    :vars
    (
      ?auto_1174922 - HOIST
      ?auto_1174921 - PLACE
      ?auto_1174917 - PLACE
      ?auto_1174920 - HOIST
      ?auto_1174919 - SURFACE
      ?auto_1174918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174922 ?auto_1174921 ) ( IS-CRATE ?auto_1174916 ) ( not ( = ?auto_1174915 ?auto_1174916 ) ) ( not ( = ?auto_1174914 ?auto_1174915 ) ) ( not ( = ?auto_1174914 ?auto_1174916 ) ) ( not ( = ?auto_1174917 ?auto_1174921 ) ) ( HOIST-AT ?auto_1174920 ?auto_1174917 ) ( not ( = ?auto_1174922 ?auto_1174920 ) ) ( AVAILABLE ?auto_1174920 ) ( SURFACE-AT ?auto_1174916 ?auto_1174917 ) ( ON ?auto_1174916 ?auto_1174919 ) ( CLEAR ?auto_1174916 ) ( not ( = ?auto_1174915 ?auto_1174919 ) ) ( not ( = ?auto_1174916 ?auto_1174919 ) ) ( not ( = ?auto_1174914 ?auto_1174919 ) ) ( TRUCK-AT ?auto_1174918 ?auto_1174921 ) ( SURFACE-AT ?auto_1174914 ?auto_1174921 ) ( CLEAR ?auto_1174914 ) ( LIFTING ?auto_1174922 ?auto_1174915 ) ( IS-CRATE ?auto_1174915 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174915 ?auto_1174916 )
      ( MAKE-2CRATE-VERIFY ?auto_1174914 ?auto_1174915 ?auto_1174916 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174923 - SURFACE
      ?auto_1174924 - SURFACE
    )
    :vars
    (
      ?auto_1174925 - HOIST
      ?auto_1174929 - PLACE
      ?auto_1174927 - SURFACE
      ?auto_1174928 - PLACE
      ?auto_1174931 - HOIST
      ?auto_1174926 - SURFACE
      ?auto_1174930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174925 ?auto_1174929 ) ( IS-CRATE ?auto_1174924 ) ( not ( = ?auto_1174923 ?auto_1174924 ) ) ( not ( = ?auto_1174927 ?auto_1174923 ) ) ( not ( = ?auto_1174927 ?auto_1174924 ) ) ( not ( = ?auto_1174928 ?auto_1174929 ) ) ( HOIST-AT ?auto_1174931 ?auto_1174928 ) ( not ( = ?auto_1174925 ?auto_1174931 ) ) ( AVAILABLE ?auto_1174931 ) ( SURFACE-AT ?auto_1174924 ?auto_1174928 ) ( ON ?auto_1174924 ?auto_1174926 ) ( CLEAR ?auto_1174924 ) ( not ( = ?auto_1174923 ?auto_1174926 ) ) ( not ( = ?auto_1174924 ?auto_1174926 ) ) ( not ( = ?auto_1174927 ?auto_1174926 ) ) ( TRUCK-AT ?auto_1174930 ?auto_1174929 ) ( SURFACE-AT ?auto_1174927 ?auto_1174929 ) ( CLEAR ?auto_1174927 ) ( IS-CRATE ?auto_1174923 ) ( AVAILABLE ?auto_1174925 ) ( IN ?auto_1174923 ?auto_1174930 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1174925 ?auto_1174923 ?auto_1174930 ?auto_1174929 )
      ( MAKE-2CRATE ?auto_1174927 ?auto_1174923 ?auto_1174924 )
      ( MAKE-1CRATE-VERIFY ?auto_1174923 ?auto_1174924 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1174932 - SURFACE
      ?auto_1174933 - SURFACE
      ?auto_1174934 - SURFACE
    )
    :vars
    (
      ?auto_1174938 - HOIST
      ?auto_1174937 - PLACE
      ?auto_1174936 - PLACE
      ?auto_1174939 - HOIST
      ?auto_1174940 - SURFACE
      ?auto_1174935 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174938 ?auto_1174937 ) ( IS-CRATE ?auto_1174934 ) ( not ( = ?auto_1174933 ?auto_1174934 ) ) ( not ( = ?auto_1174932 ?auto_1174933 ) ) ( not ( = ?auto_1174932 ?auto_1174934 ) ) ( not ( = ?auto_1174936 ?auto_1174937 ) ) ( HOIST-AT ?auto_1174939 ?auto_1174936 ) ( not ( = ?auto_1174938 ?auto_1174939 ) ) ( AVAILABLE ?auto_1174939 ) ( SURFACE-AT ?auto_1174934 ?auto_1174936 ) ( ON ?auto_1174934 ?auto_1174940 ) ( CLEAR ?auto_1174934 ) ( not ( = ?auto_1174933 ?auto_1174940 ) ) ( not ( = ?auto_1174934 ?auto_1174940 ) ) ( not ( = ?auto_1174932 ?auto_1174940 ) ) ( TRUCK-AT ?auto_1174935 ?auto_1174937 ) ( SURFACE-AT ?auto_1174932 ?auto_1174937 ) ( CLEAR ?auto_1174932 ) ( IS-CRATE ?auto_1174933 ) ( AVAILABLE ?auto_1174938 ) ( IN ?auto_1174933 ?auto_1174935 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174933 ?auto_1174934 )
      ( MAKE-2CRATE-VERIFY ?auto_1174932 ?auto_1174933 ?auto_1174934 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174977 - SURFACE
      ?auto_1174978 - SURFACE
    )
    :vars
    (
      ?auto_1174981 - HOIST
      ?auto_1174982 - PLACE
      ?auto_1174980 - SURFACE
      ?auto_1174983 - PLACE
      ?auto_1174979 - HOIST
      ?auto_1174984 - SURFACE
      ?auto_1174985 - TRUCK
      ?auto_1174986 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174981 ?auto_1174982 ) ( SURFACE-AT ?auto_1174977 ?auto_1174982 ) ( CLEAR ?auto_1174977 ) ( IS-CRATE ?auto_1174978 ) ( not ( = ?auto_1174977 ?auto_1174978 ) ) ( AVAILABLE ?auto_1174981 ) ( ON ?auto_1174977 ?auto_1174980 ) ( not ( = ?auto_1174980 ?auto_1174977 ) ) ( not ( = ?auto_1174980 ?auto_1174978 ) ) ( not ( = ?auto_1174983 ?auto_1174982 ) ) ( HOIST-AT ?auto_1174979 ?auto_1174983 ) ( not ( = ?auto_1174981 ?auto_1174979 ) ) ( AVAILABLE ?auto_1174979 ) ( SURFACE-AT ?auto_1174978 ?auto_1174983 ) ( ON ?auto_1174978 ?auto_1174984 ) ( CLEAR ?auto_1174978 ) ( not ( = ?auto_1174977 ?auto_1174984 ) ) ( not ( = ?auto_1174978 ?auto_1174984 ) ) ( not ( = ?auto_1174980 ?auto_1174984 ) ) ( TRUCK-AT ?auto_1174985 ?auto_1174986 ) ( not ( = ?auto_1174986 ?auto_1174982 ) ) ( not ( = ?auto_1174983 ?auto_1174986 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1174985 ?auto_1174986 ?auto_1174982 )
      ( MAKE-1CRATE ?auto_1174977 ?auto_1174978 )
      ( MAKE-1CRATE-VERIFY ?auto_1174977 ?auto_1174978 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1175017 - SURFACE
      ?auto_1175018 - SURFACE
      ?auto_1175019 - SURFACE
      ?auto_1175016 - SURFACE
    )
    :vars
    (
      ?auto_1175020 - HOIST
      ?auto_1175021 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175020 ?auto_1175021 ) ( SURFACE-AT ?auto_1175019 ?auto_1175021 ) ( CLEAR ?auto_1175019 ) ( LIFTING ?auto_1175020 ?auto_1175016 ) ( IS-CRATE ?auto_1175016 ) ( not ( = ?auto_1175019 ?auto_1175016 ) ) ( ON ?auto_1175018 ?auto_1175017 ) ( ON ?auto_1175019 ?auto_1175018 ) ( not ( = ?auto_1175017 ?auto_1175018 ) ) ( not ( = ?auto_1175017 ?auto_1175019 ) ) ( not ( = ?auto_1175017 ?auto_1175016 ) ) ( not ( = ?auto_1175018 ?auto_1175019 ) ) ( not ( = ?auto_1175018 ?auto_1175016 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1175019 ?auto_1175016 )
      ( MAKE-3CRATE-VERIFY ?auto_1175017 ?auto_1175018 ?auto_1175019 ?auto_1175016 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1175034 - SURFACE
      ?auto_1175035 - SURFACE
      ?auto_1175036 - SURFACE
      ?auto_1175033 - SURFACE
    )
    :vars
    (
      ?auto_1175039 - HOIST
      ?auto_1175037 - PLACE
      ?auto_1175038 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175039 ?auto_1175037 ) ( SURFACE-AT ?auto_1175036 ?auto_1175037 ) ( CLEAR ?auto_1175036 ) ( IS-CRATE ?auto_1175033 ) ( not ( = ?auto_1175036 ?auto_1175033 ) ) ( TRUCK-AT ?auto_1175038 ?auto_1175037 ) ( AVAILABLE ?auto_1175039 ) ( IN ?auto_1175033 ?auto_1175038 ) ( ON ?auto_1175036 ?auto_1175035 ) ( not ( = ?auto_1175035 ?auto_1175036 ) ) ( not ( = ?auto_1175035 ?auto_1175033 ) ) ( ON ?auto_1175035 ?auto_1175034 ) ( not ( = ?auto_1175034 ?auto_1175035 ) ) ( not ( = ?auto_1175034 ?auto_1175036 ) ) ( not ( = ?auto_1175034 ?auto_1175033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175035 ?auto_1175036 ?auto_1175033 )
      ( MAKE-3CRATE-VERIFY ?auto_1175034 ?auto_1175035 ?auto_1175036 ?auto_1175033 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1175055 - SURFACE
      ?auto_1175056 - SURFACE
      ?auto_1175057 - SURFACE
      ?auto_1175054 - SURFACE
    )
    :vars
    (
      ?auto_1175059 - HOIST
      ?auto_1175061 - PLACE
      ?auto_1175060 - TRUCK
      ?auto_1175058 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175059 ?auto_1175061 ) ( SURFACE-AT ?auto_1175057 ?auto_1175061 ) ( CLEAR ?auto_1175057 ) ( IS-CRATE ?auto_1175054 ) ( not ( = ?auto_1175057 ?auto_1175054 ) ) ( AVAILABLE ?auto_1175059 ) ( IN ?auto_1175054 ?auto_1175060 ) ( ON ?auto_1175057 ?auto_1175056 ) ( not ( = ?auto_1175056 ?auto_1175057 ) ) ( not ( = ?auto_1175056 ?auto_1175054 ) ) ( TRUCK-AT ?auto_1175060 ?auto_1175058 ) ( not ( = ?auto_1175058 ?auto_1175061 ) ) ( ON ?auto_1175056 ?auto_1175055 ) ( not ( = ?auto_1175055 ?auto_1175056 ) ) ( not ( = ?auto_1175055 ?auto_1175057 ) ) ( not ( = ?auto_1175055 ?auto_1175054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175056 ?auto_1175057 ?auto_1175054 )
      ( MAKE-3CRATE-VERIFY ?auto_1175055 ?auto_1175056 ?auto_1175057 ?auto_1175054 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1175079 - SURFACE
      ?auto_1175080 - SURFACE
      ?auto_1175081 - SURFACE
      ?auto_1175078 - SURFACE
    )
    :vars
    (
      ?auto_1175085 - HOIST
      ?auto_1175086 - PLACE
      ?auto_1175083 - TRUCK
      ?auto_1175082 - PLACE
      ?auto_1175084 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175085 ?auto_1175086 ) ( SURFACE-AT ?auto_1175081 ?auto_1175086 ) ( CLEAR ?auto_1175081 ) ( IS-CRATE ?auto_1175078 ) ( not ( = ?auto_1175081 ?auto_1175078 ) ) ( AVAILABLE ?auto_1175085 ) ( ON ?auto_1175081 ?auto_1175080 ) ( not ( = ?auto_1175080 ?auto_1175081 ) ) ( not ( = ?auto_1175080 ?auto_1175078 ) ) ( TRUCK-AT ?auto_1175083 ?auto_1175082 ) ( not ( = ?auto_1175082 ?auto_1175086 ) ) ( HOIST-AT ?auto_1175084 ?auto_1175082 ) ( LIFTING ?auto_1175084 ?auto_1175078 ) ( not ( = ?auto_1175085 ?auto_1175084 ) ) ( ON ?auto_1175080 ?auto_1175079 ) ( not ( = ?auto_1175079 ?auto_1175080 ) ) ( not ( = ?auto_1175079 ?auto_1175081 ) ) ( not ( = ?auto_1175079 ?auto_1175078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175080 ?auto_1175081 ?auto_1175078 )
      ( MAKE-3CRATE-VERIFY ?auto_1175079 ?auto_1175080 ?auto_1175081 ?auto_1175078 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1175106 - SURFACE
      ?auto_1175107 - SURFACE
      ?auto_1175108 - SURFACE
      ?auto_1175105 - SURFACE
    )
    :vars
    (
      ?auto_1175109 - HOIST
      ?auto_1175111 - PLACE
      ?auto_1175114 - TRUCK
      ?auto_1175113 - PLACE
      ?auto_1175110 - HOIST
      ?auto_1175112 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175109 ?auto_1175111 ) ( SURFACE-AT ?auto_1175108 ?auto_1175111 ) ( CLEAR ?auto_1175108 ) ( IS-CRATE ?auto_1175105 ) ( not ( = ?auto_1175108 ?auto_1175105 ) ) ( AVAILABLE ?auto_1175109 ) ( ON ?auto_1175108 ?auto_1175107 ) ( not ( = ?auto_1175107 ?auto_1175108 ) ) ( not ( = ?auto_1175107 ?auto_1175105 ) ) ( TRUCK-AT ?auto_1175114 ?auto_1175113 ) ( not ( = ?auto_1175113 ?auto_1175111 ) ) ( HOIST-AT ?auto_1175110 ?auto_1175113 ) ( not ( = ?auto_1175109 ?auto_1175110 ) ) ( AVAILABLE ?auto_1175110 ) ( SURFACE-AT ?auto_1175105 ?auto_1175113 ) ( ON ?auto_1175105 ?auto_1175112 ) ( CLEAR ?auto_1175105 ) ( not ( = ?auto_1175108 ?auto_1175112 ) ) ( not ( = ?auto_1175105 ?auto_1175112 ) ) ( not ( = ?auto_1175107 ?auto_1175112 ) ) ( ON ?auto_1175107 ?auto_1175106 ) ( not ( = ?auto_1175106 ?auto_1175107 ) ) ( not ( = ?auto_1175106 ?auto_1175108 ) ) ( not ( = ?auto_1175106 ?auto_1175105 ) ) ( not ( = ?auto_1175106 ?auto_1175112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175107 ?auto_1175108 ?auto_1175105 )
      ( MAKE-3CRATE-VERIFY ?auto_1175106 ?auto_1175107 ?auto_1175108 ?auto_1175105 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1175134 - SURFACE
      ?auto_1175135 - SURFACE
      ?auto_1175136 - SURFACE
      ?auto_1175133 - SURFACE
    )
    :vars
    (
      ?auto_1175142 - HOIST
      ?auto_1175137 - PLACE
      ?auto_1175141 - PLACE
      ?auto_1175138 - HOIST
      ?auto_1175140 - SURFACE
      ?auto_1175139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175142 ?auto_1175137 ) ( SURFACE-AT ?auto_1175136 ?auto_1175137 ) ( CLEAR ?auto_1175136 ) ( IS-CRATE ?auto_1175133 ) ( not ( = ?auto_1175136 ?auto_1175133 ) ) ( AVAILABLE ?auto_1175142 ) ( ON ?auto_1175136 ?auto_1175135 ) ( not ( = ?auto_1175135 ?auto_1175136 ) ) ( not ( = ?auto_1175135 ?auto_1175133 ) ) ( not ( = ?auto_1175141 ?auto_1175137 ) ) ( HOIST-AT ?auto_1175138 ?auto_1175141 ) ( not ( = ?auto_1175142 ?auto_1175138 ) ) ( AVAILABLE ?auto_1175138 ) ( SURFACE-AT ?auto_1175133 ?auto_1175141 ) ( ON ?auto_1175133 ?auto_1175140 ) ( CLEAR ?auto_1175133 ) ( not ( = ?auto_1175136 ?auto_1175140 ) ) ( not ( = ?auto_1175133 ?auto_1175140 ) ) ( not ( = ?auto_1175135 ?auto_1175140 ) ) ( TRUCK-AT ?auto_1175139 ?auto_1175137 ) ( ON ?auto_1175135 ?auto_1175134 ) ( not ( = ?auto_1175134 ?auto_1175135 ) ) ( not ( = ?auto_1175134 ?auto_1175136 ) ) ( not ( = ?auto_1175134 ?auto_1175133 ) ) ( not ( = ?auto_1175134 ?auto_1175140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175135 ?auto_1175136 ?auto_1175133 )
      ( MAKE-3CRATE-VERIFY ?auto_1175134 ?auto_1175135 ?auto_1175136 ?auto_1175133 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1175162 - SURFACE
      ?auto_1175163 - SURFACE
      ?auto_1175164 - SURFACE
      ?auto_1175161 - SURFACE
    )
    :vars
    (
      ?auto_1175165 - HOIST
      ?auto_1175167 - PLACE
      ?auto_1175170 - PLACE
      ?auto_1175169 - HOIST
      ?auto_1175166 - SURFACE
      ?auto_1175168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175165 ?auto_1175167 ) ( IS-CRATE ?auto_1175161 ) ( not ( = ?auto_1175164 ?auto_1175161 ) ) ( not ( = ?auto_1175163 ?auto_1175164 ) ) ( not ( = ?auto_1175163 ?auto_1175161 ) ) ( not ( = ?auto_1175170 ?auto_1175167 ) ) ( HOIST-AT ?auto_1175169 ?auto_1175170 ) ( not ( = ?auto_1175165 ?auto_1175169 ) ) ( AVAILABLE ?auto_1175169 ) ( SURFACE-AT ?auto_1175161 ?auto_1175170 ) ( ON ?auto_1175161 ?auto_1175166 ) ( CLEAR ?auto_1175161 ) ( not ( = ?auto_1175164 ?auto_1175166 ) ) ( not ( = ?auto_1175161 ?auto_1175166 ) ) ( not ( = ?auto_1175163 ?auto_1175166 ) ) ( TRUCK-AT ?auto_1175168 ?auto_1175167 ) ( SURFACE-AT ?auto_1175163 ?auto_1175167 ) ( CLEAR ?auto_1175163 ) ( LIFTING ?auto_1175165 ?auto_1175164 ) ( IS-CRATE ?auto_1175164 ) ( ON ?auto_1175163 ?auto_1175162 ) ( not ( = ?auto_1175162 ?auto_1175163 ) ) ( not ( = ?auto_1175162 ?auto_1175164 ) ) ( not ( = ?auto_1175162 ?auto_1175161 ) ) ( not ( = ?auto_1175162 ?auto_1175166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175163 ?auto_1175164 ?auto_1175161 )
      ( MAKE-3CRATE-VERIFY ?auto_1175162 ?auto_1175163 ?auto_1175164 ?auto_1175161 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1175190 - SURFACE
      ?auto_1175191 - SURFACE
      ?auto_1175192 - SURFACE
      ?auto_1175189 - SURFACE
    )
    :vars
    (
      ?auto_1175194 - HOIST
      ?auto_1175198 - PLACE
      ?auto_1175196 - PLACE
      ?auto_1175195 - HOIST
      ?auto_1175193 - SURFACE
      ?auto_1175197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175194 ?auto_1175198 ) ( IS-CRATE ?auto_1175189 ) ( not ( = ?auto_1175192 ?auto_1175189 ) ) ( not ( = ?auto_1175191 ?auto_1175192 ) ) ( not ( = ?auto_1175191 ?auto_1175189 ) ) ( not ( = ?auto_1175196 ?auto_1175198 ) ) ( HOIST-AT ?auto_1175195 ?auto_1175196 ) ( not ( = ?auto_1175194 ?auto_1175195 ) ) ( AVAILABLE ?auto_1175195 ) ( SURFACE-AT ?auto_1175189 ?auto_1175196 ) ( ON ?auto_1175189 ?auto_1175193 ) ( CLEAR ?auto_1175189 ) ( not ( = ?auto_1175192 ?auto_1175193 ) ) ( not ( = ?auto_1175189 ?auto_1175193 ) ) ( not ( = ?auto_1175191 ?auto_1175193 ) ) ( TRUCK-AT ?auto_1175197 ?auto_1175198 ) ( SURFACE-AT ?auto_1175191 ?auto_1175198 ) ( CLEAR ?auto_1175191 ) ( IS-CRATE ?auto_1175192 ) ( AVAILABLE ?auto_1175194 ) ( IN ?auto_1175192 ?auto_1175197 ) ( ON ?auto_1175191 ?auto_1175190 ) ( not ( = ?auto_1175190 ?auto_1175191 ) ) ( not ( = ?auto_1175190 ?auto_1175192 ) ) ( not ( = ?auto_1175190 ?auto_1175189 ) ) ( not ( = ?auto_1175190 ?auto_1175193 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175191 ?auto_1175192 ?auto_1175189 )
      ( MAKE-3CRATE-VERIFY ?auto_1175190 ?auto_1175191 ?auto_1175192 ?auto_1175189 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1175481 - SURFACE
      ?auto_1175482 - SURFACE
      ?auto_1175483 - SURFACE
      ?auto_1175480 - SURFACE
      ?auto_1175484 - SURFACE
    )
    :vars
    (
      ?auto_1175485 - HOIST
      ?auto_1175486 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175485 ?auto_1175486 ) ( SURFACE-AT ?auto_1175480 ?auto_1175486 ) ( CLEAR ?auto_1175480 ) ( LIFTING ?auto_1175485 ?auto_1175484 ) ( IS-CRATE ?auto_1175484 ) ( not ( = ?auto_1175480 ?auto_1175484 ) ) ( ON ?auto_1175482 ?auto_1175481 ) ( ON ?auto_1175483 ?auto_1175482 ) ( ON ?auto_1175480 ?auto_1175483 ) ( not ( = ?auto_1175481 ?auto_1175482 ) ) ( not ( = ?auto_1175481 ?auto_1175483 ) ) ( not ( = ?auto_1175481 ?auto_1175480 ) ) ( not ( = ?auto_1175481 ?auto_1175484 ) ) ( not ( = ?auto_1175482 ?auto_1175483 ) ) ( not ( = ?auto_1175482 ?auto_1175480 ) ) ( not ( = ?auto_1175482 ?auto_1175484 ) ) ( not ( = ?auto_1175483 ?auto_1175480 ) ) ( not ( = ?auto_1175483 ?auto_1175484 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1175480 ?auto_1175484 )
      ( MAKE-4CRATE-VERIFY ?auto_1175481 ?auto_1175482 ?auto_1175483 ?auto_1175480 ?auto_1175484 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1175506 - SURFACE
      ?auto_1175507 - SURFACE
      ?auto_1175508 - SURFACE
      ?auto_1175505 - SURFACE
      ?auto_1175509 - SURFACE
    )
    :vars
    (
      ?auto_1175511 - HOIST
      ?auto_1175510 - PLACE
      ?auto_1175512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175511 ?auto_1175510 ) ( SURFACE-AT ?auto_1175505 ?auto_1175510 ) ( CLEAR ?auto_1175505 ) ( IS-CRATE ?auto_1175509 ) ( not ( = ?auto_1175505 ?auto_1175509 ) ) ( TRUCK-AT ?auto_1175512 ?auto_1175510 ) ( AVAILABLE ?auto_1175511 ) ( IN ?auto_1175509 ?auto_1175512 ) ( ON ?auto_1175505 ?auto_1175508 ) ( not ( = ?auto_1175508 ?auto_1175505 ) ) ( not ( = ?auto_1175508 ?auto_1175509 ) ) ( ON ?auto_1175507 ?auto_1175506 ) ( ON ?auto_1175508 ?auto_1175507 ) ( not ( = ?auto_1175506 ?auto_1175507 ) ) ( not ( = ?auto_1175506 ?auto_1175508 ) ) ( not ( = ?auto_1175506 ?auto_1175505 ) ) ( not ( = ?auto_1175506 ?auto_1175509 ) ) ( not ( = ?auto_1175507 ?auto_1175508 ) ) ( not ( = ?auto_1175507 ?auto_1175505 ) ) ( not ( = ?auto_1175507 ?auto_1175509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175508 ?auto_1175505 ?auto_1175509 )
      ( MAKE-4CRATE-VERIFY ?auto_1175506 ?auto_1175507 ?auto_1175508 ?auto_1175505 ?auto_1175509 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1175536 - SURFACE
      ?auto_1175537 - SURFACE
      ?auto_1175538 - SURFACE
      ?auto_1175535 - SURFACE
      ?auto_1175539 - SURFACE
    )
    :vars
    (
      ?auto_1175541 - HOIST
      ?auto_1175540 - PLACE
      ?auto_1175543 - TRUCK
      ?auto_1175542 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175541 ?auto_1175540 ) ( SURFACE-AT ?auto_1175535 ?auto_1175540 ) ( CLEAR ?auto_1175535 ) ( IS-CRATE ?auto_1175539 ) ( not ( = ?auto_1175535 ?auto_1175539 ) ) ( AVAILABLE ?auto_1175541 ) ( IN ?auto_1175539 ?auto_1175543 ) ( ON ?auto_1175535 ?auto_1175538 ) ( not ( = ?auto_1175538 ?auto_1175535 ) ) ( not ( = ?auto_1175538 ?auto_1175539 ) ) ( TRUCK-AT ?auto_1175543 ?auto_1175542 ) ( not ( = ?auto_1175542 ?auto_1175540 ) ) ( ON ?auto_1175537 ?auto_1175536 ) ( ON ?auto_1175538 ?auto_1175537 ) ( not ( = ?auto_1175536 ?auto_1175537 ) ) ( not ( = ?auto_1175536 ?auto_1175538 ) ) ( not ( = ?auto_1175536 ?auto_1175535 ) ) ( not ( = ?auto_1175536 ?auto_1175539 ) ) ( not ( = ?auto_1175537 ?auto_1175538 ) ) ( not ( = ?auto_1175537 ?auto_1175535 ) ) ( not ( = ?auto_1175537 ?auto_1175539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175538 ?auto_1175535 ?auto_1175539 )
      ( MAKE-4CRATE-VERIFY ?auto_1175536 ?auto_1175537 ?auto_1175538 ?auto_1175535 ?auto_1175539 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1175570 - SURFACE
      ?auto_1175571 - SURFACE
      ?auto_1175572 - SURFACE
      ?auto_1175569 - SURFACE
      ?auto_1175573 - SURFACE
    )
    :vars
    (
      ?auto_1175577 - HOIST
      ?auto_1175576 - PLACE
      ?auto_1175578 - TRUCK
      ?auto_1175575 - PLACE
      ?auto_1175574 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175577 ?auto_1175576 ) ( SURFACE-AT ?auto_1175569 ?auto_1175576 ) ( CLEAR ?auto_1175569 ) ( IS-CRATE ?auto_1175573 ) ( not ( = ?auto_1175569 ?auto_1175573 ) ) ( AVAILABLE ?auto_1175577 ) ( ON ?auto_1175569 ?auto_1175572 ) ( not ( = ?auto_1175572 ?auto_1175569 ) ) ( not ( = ?auto_1175572 ?auto_1175573 ) ) ( TRUCK-AT ?auto_1175578 ?auto_1175575 ) ( not ( = ?auto_1175575 ?auto_1175576 ) ) ( HOIST-AT ?auto_1175574 ?auto_1175575 ) ( LIFTING ?auto_1175574 ?auto_1175573 ) ( not ( = ?auto_1175577 ?auto_1175574 ) ) ( ON ?auto_1175571 ?auto_1175570 ) ( ON ?auto_1175572 ?auto_1175571 ) ( not ( = ?auto_1175570 ?auto_1175571 ) ) ( not ( = ?auto_1175570 ?auto_1175572 ) ) ( not ( = ?auto_1175570 ?auto_1175569 ) ) ( not ( = ?auto_1175570 ?auto_1175573 ) ) ( not ( = ?auto_1175571 ?auto_1175572 ) ) ( not ( = ?auto_1175571 ?auto_1175569 ) ) ( not ( = ?auto_1175571 ?auto_1175573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175572 ?auto_1175569 ?auto_1175573 )
      ( MAKE-4CRATE-VERIFY ?auto_1175570 ?auto_1175571 ?auto_1175572 ?auto_1175569 ?auto_1175573 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1175608 - SURFACE
      ?auto_1175609 - SURFACE
      ?auto_1175610 - SURFACE
      ?auto_1175607 - SURFACE
      ?auto_1175611 - SURFACE
    )
    :vars
    (
      ?auto_1175613 - HOIST
      ?auto_1175615 - PLACE
      ?auto_1175612 - TRUCK
      ?auto_1175617 - PLACE
      ?auto_1175616 - HOIST
      ?auto_1175614 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175613 ?auto_1175615 ) ( SURFACE-AT ?auto_1175607 ?auto_1175615 ) ( CLEAR ?auto_1175607 ) ( IS-CRATE ?auto_1175611 ) ( not ( = ?auto_1175607 ?auto_1175611 ) ) ( AVAILABLE ?auto_1175613 ) ( ON ?auto_1175607 ?auto_1175610 ) ( not ( = ?auto_1175610 ?auto_1175607 ) ) ( not ( = ?auto_1175610 ?auto_1175611 ) ) ( TRUCK-AT ?auto_1175612 ?auto_1175617 ) ( not ( = ?auto_1175617 ?auto_1175615 ) ) ( HOIST-AT ?auto_1175616 ?auto_1175617 ) ( not ( = ?auto_1175613 ?auto_1175616 ) ) ( AVAILABLE ?auto_1175616 ) ( SURFACE-AT ?auto_1175611 ?auto_1175617 ) ( ON ?auto_1175611 ?auto_1175614 ) ( CLEAR ?auto_1175611 ) ( not ( = ?auto_1175607 ?auto_1175614 ) ) ( not ( = ?auto_1175611 ?auto_1175614 ) ) ( not ( = ?auto_1175610 ?auto_1175614 ) ) ( ON ?auto_1175609 ?auto_1175608 ) ( ON ?auto_1175610 ?auto_1175609 ) ( not ( = ?auto_1175608 ?auto_1175609 ) ) ( not ( = ?auto_1175608 ?auto_1175610 ) ) ( not ( = ?auto_1175608 ?auto_1175607 ) ) ( not ( = ?auto_1175608 ?auto_1175611 ) ) ( not ( = ?auto_1175608 ?auto_1175614 ) ) ( not ( = ?auto_1175609 ?auto_1175610 ) ) ( not ( = ?auto_1175609 ?auto_1175607 ) ) ( not ( = ?auto_1175609 ?auto_1175611 ) ) ( not ( = ?auto_1175609 ?auto_1175614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175610 ?auto_1175607 ?auto_1175611 )
      ( MAKE-4CRATE-VERIFY ?auto_1175608 ?auto_1175609 ?auto_1175610 ?auto_1175607 ?auto_1175611 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1175647 - SURFACE
      ?auto_1175648 - SURFACE
      ?auto_1175649 - SURFACE
      ?auto_1175646 - SURFACE
      ?auto_1175650 - SURFACE
    )
    :vars
    (
      ?auto_1175656 - HOIST
      ?auto_1175655 - PLACE
      ?auto_1175652 - PLACE
      ?auto_1175654 - HOIST
      ?auto_1175653 - SURFACE
      ?auto_1175651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175656 ?auto_1175655 ) ( SURFACE-AT ?auto_1175646 ?auto_1175655 ) ( CLEAR ?auto_1175646 ) ( IS-CRATE ?auto_1175650 ) ( not ( = ?auto_1175646 ?auto_1175650 ) ) ( AVAILABLE ?auto_1175656 ) ( ON ?auto_1175646 ?auto_1175649 ) ( not ( = ?auto_1175649 ?auto_1175646 ) ) ( not ( = ?auto_1175649 ?auto_1175650 ) ) ( not ( = ?auto_1175652 ?auto_1175655 ) ) ( HOIST-AT ?auto_1175654 ?auto_1175652 ) ( not ( = ?auto_1175656 ?auto_1175654 ) ) ( AVAILABLE ?auto_1175654 ) ( SURFACE-AT ?auto_1175650 ?auto_1175652 ) ( ON ?auto_1175650 ?auto_1175653 ) ( CLEAR ?auto_1175650 ) ( not ( = ?auto_1175646 ?auto_1175653 ) ) ( not ( = ?auto_1175650 ?auto_1175653 ) ) ( not ( = ?auto_1175649 ?auto_1175653 ) ) ( TRUCK-AT ?auto_1175651 ?auto_1175655 ) ( ON ?auto_1175648 ?auto_1175647 ) ( ON ?auto_1175649 ?auto_1175648 ) ( not ( = ?auto_1175647 ?auto_1175648 ) ) ( not ( = ?auto_1175647 ?auto_1175649 ) ) ( not ( = ?auto_1175647 ?auto_1175646 ) ) ( not ( = ?auto_1175647 ?auto_1175650 ) ) ( not ( = ?auto_1175647 ?auto_1175653 ) ) ( not ( = ?auto_1175648 ?auto_1175649 ) ) ( not ( = ?auto_1175648 ?auto_1175646 ) ) ( not ( = ?auto_1175648 ?auto_1175650 ) ) ( not ( = ?auto_1175648 ?auto_1175653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175649 ?auto_1175646 ?auto_1175650 )
      ( MAKE-4CRATE-VERIFY ?auto_1175647 ?auto_1175648 ?auto_1175649 ?auto_1175646 ?auto_1175650 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1175686 - SURFACE
      ?auto_1175687 - SURFACE
      ?auto_1175688 - SURFACE
      ?auto_1175685 - SURFACE
      ?auto_1175689 - SURFACE
    )
    :vars
    (
      ?auto_1175693 - HOIST
      ?auto_1175694 - PLACE
      ?auto_1175692 - PLACE
      ?auto_1175691 - HOIST
      ?auto_1175690 - SURFACE
      ?auto_1175695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175693 ?auto_1175694 ) ( IS-CRATE ?auto_1175689 ) ( not ( = ?auto_1175685 ?auto_1175689 ) ) ( not ( = ?auto_1175688 ?auto_1175685 ) ) ( not ( = ?auto_1175688 ?auto_1175689 ) ) ( not ( = ?auto_1175692 ?auto_1175694 ) ) ( HOIST-AT ?auto_1175691 ?auto_1175692 ) ( not ( = ?auto_1175693 ?auto_1175691 ) ) ( AVAILABLE ?auto_1175691 ) ( SURFACE-AT ?auto_1175689 ?auto_1175692 ) ( ON ?auto_1175689 ?auto_1175690 ) ( CLEAR ?auto_1175689 ) ( not ( = ?auto_1175685 ?auto_1175690 ) ) ( not ( = ?auto_1175689 ?auto_1175690 ) ) ( not ( = ?auto_1175688 ?auto_1175690 ) ) ( TRUCK-AT ?auto_1175695 ?auto_1175694 ) ( SURFACE-AT ?auto_1175688 ?auto_1175694 ) ( CLEAR ?auto_1175688 ) ( LIFTING ?auto_1175693 ?auto_1175685 ) ( IS-CRATE ?auto_1175685 ) ( ON ?auto_1175687 ?auto_1175686 ) ( ON ?auto_1175688 ?auto_1175687 ) ( not ( = ?auto_1175686 ?auto_1175687 ) ) ( not ( = ?auto_1175686 ?auto_1175688 ) ) ( not ( = ?auto_1175686 ?auto_1175685 ) ) ( not ( = ?auto_1175686 ?auto_1175689 ) ) ( not ( = ?auto_1175686 ?auto_1175690 ) ) ( not ( = ?auto_1175687 ?auto_1175688 ) ) ( not ( = ?auto_1175687 ?auto_1175685 ) ) ( not ( = ?auto_1175687 ?auto_1175689 ) ) ( not ( = ?auto_1175687 ?auto_1175690 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175688 ?auto_1175685 ?auto_1175689 )
      ( MAKE-4CRATE-VERIFY ?auto_1175686 ?auto_1175687 ?auto_1175688 ?auto_1175685 ?auto_1175689 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1175725 - SURFACE
      ?auto_1175726 - SURFACE
      ?auto_1175727 - SURFACE
      ?auto_1175724 - SURFACE
      ?auto_1175728 - SURFACE
    )
    :vars
    (
      ?auto_1175733 - HOIST
      ?auto_1175732 - PLACE
      ?auto_1175734 - PLACE
      ?auto_1175729 - HOIST
      ?auto_1175731 - SURFACE
      ?auto_1175730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175733 ?auto_1175732 ) ( IS-CRATE ?auto_1175728 ) ( not ( = ?auto_1175724 ?auto_1175728 ) ) ( not ( = ?auto_1175727 ?auto_1175724 ) ) ( not ( = ?auto_1175727 ?auto_1175728 ) ) ( not ( = ?auto_1175734 ?auto_1175732 ) ) ( HOIST-AT ?auto_1175729 ?auto_1175734 ) ( not ( = ?auto_1175733 ?auto_1175729 ) ) ( AVAILABLE ?auto_1175729 ) ( SURFACE-AT ?auto_1175728 ?auto_1175734 ) ( ON ?auto_1175728 ?auto_1175731 ) ( CLEAR ?auto_1175728 ) ( not ( = ?auto_1175724 ?auto_1175731 ) ) ( not ( = ?auto_1175728 ?auto_1175731 ) ) ( not ( = ?auto_1175727 ?auto_1175731 ) ) ( TRUCK-AT ?auto_1175730 ?auto_1175732 ) ( SURFACE-AT ?auto_1175727 ?auto_1175732 ) ( CLEAR ?auto_1175727 ) ( IS-CRATE ?auto_1175724 ) ( AVAILABLE ?auto_1175733 ) ( IN ?auto_1175724 ?auto_1175730 ) ( ON ?auto_1175726 ?auto_1175725 ) ( ON ?auto_1175727 ?auto_1175726 ) ( not ( = ?auto_1175725 ?auto_1175726 ) ) ( not ( = ?auto_1175725 ?auto_1175727 ) ) ( not ( = ?auto_1175725 ?auto_1175724 ) ) ( not ( = ?auto_1175725 ?auto_1175728 ) ) ( not ( = ?auto_1175725 ?auto_1175731 ) ) ( not ( = ?auto_1175726 ?auto_1175727 ) ) ( not ( = ?auto_1175726 ?auto_1175724 ) ) ( not ( = ?auto_1175726 ?auto_1175728 ) ) ( not ( = ?auto_1175726 ?auto_1175731 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175727 ?auto_1175724 ?auto_1175728 )
      ( MAKE-4CRATE-VERIFY ?auto_1175725 ?auto_1175726 ?auto_1175727 ?auto_1175724 ?auto_1175728 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1176385 - SURFACE
      ?auto_1176386 - SURFACE
      ?auto_1176387 - SURFACE
      ?auto_1176384 - SURFACE
      ?auto_1176388 - SURFACE
      ?auto_1176389 - SURFACE
    )
    :vars
    (
      ?auto_1176391 - HOIST
      ?auto_1176390 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176391 ?auto_1176390 ) ( SURFACE-AT ?auto_1176388 ?auto_1176390 ) ( CLEAR ?auto_1176388 ) ( LIFTING ?auto_1176391 ?auto_1176389 ) ( IS-CRATE ?auto_1176389 ) ( not ( = ?auto_1176388 ?auto_1176389 ) ) ( ON ?auto_1176386 ?auto_1176385 ) ( ON ?auto_1176387 ?auto_1176386 ) ( ON ?auto_1176384 ?auto_1176387 ) ( ON ?auto_1176388 ?auto_1176384 ) ( not ( = ?auto_1176385 ?auto_1176386 ) ) ( not ( = ?auto_1176385 ?auto_1176387 ) ) ( not ( = ?auto_1176385 ?auto_1176384 ) ) ( not ( = ?auto_1176385 ?auto_1176388 ) ) ( not ( = ?auto_1176385 ?auto_1176389 ) ) ( not ( = ?auto_1176386 ?auto_1176387 ) ) ( not ( = ?auto_1176386 ?auto_1176384 ) ) ( not ( = ?auto_1176386 ?auto_1176388 ) ) ( not ( = ?auto_1176386 ?auto_1176389 ) ) ( not ( = ?auto_1176387 ?auto_1176384 ) ) ( not ( = ?auto_1176387 ?auto_1176388 ) ) ( not ( = ?auto_1176387 ?auto_1176389 ) ) ( not ( = ?auto_1176384 ?auto_1176388 ) ) ( not ( = ?auto_1176384 ?auto_1176389 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1176388 ?auto_1176389 )
      ( MAKE-5CRATE-VERIFY ?auto_1176385 ?auto_1176386 ?auto_1176387 ?auto_1176384 ?auto_1176388 ?auto_1176389 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1176419 - SURFACE
      ?auto_1176420 - SURFACE
      ?auto_1176421 - SURFACE
      ?auto_1176418 - SURFACE
      ?auto_1176422 - SURFACE
      ?auto_1176423 - SURFACE
    )
    :vars
    (
      ?auto_1176425 - HOIST
      ?auto_1176426 - PLACE
      ?auto_1176424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176425 ?auto_1176426 ) ( SURFACE-AT ?auto_1176422 ?auto_1176426 ) ( CLEAR ?auto_1176422 ) ( IS-CRATE ?auto_1176423 ) ( not ( = ?auto_1176422 ?auto_1176423 ) ) ( TRUCK-AT ?auto_1176424 ?auto_1176426 ) ( AVAILABLE ?auto_1176425 ) ( IN ?auto_1176423 ?auto_1176424 ) ( ON ?auto_1176422 ?auto_1176418 ) ( not ( = ?auto_1176418 ?auto_1176422 ) ) ( not ( = ?auto_1176418 ?auto_1176423 ) ) ( ON ?auto_1176420 ?auto_1176419 ) ( ON ?auto_1176421 ?auto_1176420 ) ( ON ?auto_1176418 ?auto_1176421 ) ( not ( = ?auto_1176419 ?auto_1176420 ) ) ( not ( = ?auto_1176419 ?auto_1176421 ) ) ( not ( = ?auto_1176419 ?auto_1176418 ) ) ( not ( = ?auto_1176419 ?auto_1176422 ) ) ( not ( = ?auto_1176419 ?auto_1176423 ) ) ( not ( = ?auto_1176420 ?auto_1176421 ) ) ( not ( = ?auto_1176420 ?auto_1176418 ) ) ( not ( = ?auto_1176420 ?auto_1176422 ) ) ( not ( = ?auto_1176420 ?auto_1176423 ) ) ( not ( = ?auto_1176421 ?auto_1176418 ) ) ( not ( = ?auto_1176421 ?auto_1176422 ) ) ( not ( = ?auto_1176421 ?auto_1176423 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1176418 ?auto_1176422 ?auto_1176423 )
      ( MAKE-5CRATE-VERIFY ?auto_1176419 ?auto_1176420 ?auto_1176421 ?auto_1176418 ?auto_1176422 ?auto_1176423 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1176459 - SURFACE
      ?auto_1176460 - SURFACE
      ?auto_1176461 - SURFACE
      ?auto_1176458 - SURFACE
      ?auto_1176462 - SURFACE
      ?auto_1176463 - SURFACE
    )
    :vars
    (
      ?auto_1176464 - HOIST
      ?auto_1176466 - PLACE
      ?auto_1176465 - TRUCK
      ?auto_1176467 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176464 ?auto_1176466 ) ( SURFACE-AT ?auto_1176462 ?auto_1176466 ) ( CLEAR ?auto_1176462 ) ( IS-CRATE ?auto_1176463 ) ( not ( = ?auto_1176462 ?auto_1176463 ) ) ( AVAILABLE ?auto_1176464 ) ( IN ?auto_1176463 ?auto_1176465 ) ( ON ?auto_1176462 ?auto_1176458 ) ( not ( = ?auto_1176458 ?auto_1176462 ) ) ( not ( = ?auto_1176458 ?auto_1176463 ) ) ( TRUCK-AT ?auto_1176465 ?auto_1176467 ) ( not ( = ?auto_1176467 ?auto_1176466 ) ) ( ON ?auto_1176460 ?auto_1176459 ) ( ON ?auto_1176461 ?auto_1176460 ) ( ON ?auto_1176458 ?auto_1176461 ) ( not ( = ?auto_1176459 ?auto_1176460 ) ) ( not ( = ?auto_1176459 ?auto_1176461 ) ) ( not ( = ?auto_1176459 ?auto_1176458 ) ) ( not ( = ?auto_1176459 ?auto_1176462 ) ) ( not ( = ?auto_1176459 ?auto_1176463 ) ) ( not ( = ?auto_1176460 ?auto_1176461 ) ) ( not ( = ?auto_1176460 ?auto_1176458 ) ) ( not ( = ?auto_1176460 ?auto_1176462 ) ) ( not ( = ?auto_1176460 ?auto_1176463 ) ) ( not ( = ?auto_1176461 ?auto_1176458 ) ) ( not ( = ?auto_1176461 ?auto_1176462 ) ) ( not ( = ?auto_1176461 ?auto_1176463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1176458 ?auto_1176462 ?auto_1176463 )
      ( MAKE-5CRATE-VERIFY ?auto_1176459 ?auto_1176460 ?auto_1176461 ?auto_1176458 ?auto_1176462 ?auto_1176463 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1176504 - SURFACE
      ?auto_1176505 - SURFACE
      ?auto_1176506 - SURFACE
      ?auto_1176503 - SURFACE
      ?auto_1176507 - SURFACE
      ?auto_1176508 - SURFACE
    )
    :vars
    (
      ?auto_1176509 - HOIST
      ?auto_1176512 - PLACE
      ?auto_1176511 - TRUCK
      ?auto_1176513 - PLACE
      ?auto_1176510 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176509 ?auto_1176512 ) ( SURFACE-AT ?auto_1176507 ?auto_1176512 ) ( CLEAR ?auto_1176507 ) ( IS-CRATE ?auto_1176508 ) ( not ( = ?auto_1176507 ?auto_1176508 ) ) ( AVAILABLE ?auto_1176509 ) ( ON ?auto_1176507 ?auto_1176503 ) ( not ( = ?auto_1176503 ?auto_1176507 ) ) ( not ( = ?auto_1176503 ?auto_1176508 ) ) ( TRUCK-AT ?auto_1176511 ?auto_1176513 ) ( not ( = ?auto_1176513 ?auto_1176512 ) ) ( HOIST-AT ?auto_1176510 ?auto_1176513 ) ( LIFTING ?auto_1176510 ?auto_1176508 ) ( not ( = ?auto_1176509 ?auto_1176510 ) ) ( ON ?auto_1176505 ?auto_1176504 ) ( ON ?auto_1176506 ?auto_1176505 ) ( ON ?auto_1176503 ?auto_1176506 ) ( not ( = ?auto_1176504 ?auto_1176505 ) ) ( not ( = ?auto_1176504 ?auto_1176506 ) ) ( not ( = ?auto_1176504 ?auto_1176503 ) ) ( not ( = ?auto_1176504 ?auto_1176507 ) ) ( not ( = ?auto_1176504 ?auto_1176508 ) ) ( not ( = ?auto_1176505 ?auto_1176506 ) ) ( not ( = ?auto_1176505 ?auto_1176503 ) ) ( not ( = ?auto_1176505 ?auto_1176507 ) ) ( not ( = ?auto_1176505 ?auto_1176508 ) ) ( not ( = ?auto_1176506 ?auto_1176503 ) ) ( not ( = ?auto_1176506 ?auto_1176507 ) ) ( not ( = ?auto_1176506 ?auto_1176508 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1176503 ?auto_1176507 ?auto_1176508 )
      ( MAKE-5CRATE-VERIFY ?auto_1176504 ?auto_1176505 ?auto_1176506 ?auto_1176503 ?auto_1176507 ?auto_1176508 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1176554 - SURFACE
      ?auto_1176555 - SURFACE
      ?auto_1176556 - SURFACE
      ?auto_1176553 - SURFACE
      ?auto_1176557 - SURFACE
      ?auto_1176558 - SURFACE
    )
    :vars
    (
      ?auto_1176561 - HOIST
      ?auto_1176563 - PLACE
      ?auto_1176564 - TRUCK
      ?auto_1176559 - PLACE
      ?auto_1176562 - HOIST
      ?auto_1176560 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176561 ?auto_1176563 ) ( SURFACE-AT ?auto_1176557 ?auto_1176563 ) ( CLEAR ?auto_1176557 ) ( IS-CRATE ?auto_1176558 ) ( not ( = ?auto_1176557 ?auto_1176558 ) ) ( AVAILABLE ?auto_1176561 ) ( ON ?auto_1176557 ?auto_1176553 ) ( not ( = ?auto_1176553 ?auto_1176557 ) ) ( not ( = ?auto_1176553 ?auto_1176558 ) ) ( TRUCK-AT ?auto_1176564 ?auto_1176559 ) ( not ( = ?auto_1176559 ?auto_1176563 ) ) ( HOIST-AT ?auto_1176562 ?auto_1176559 ) ( not ( = ?auto_1176561 ?auto_1176562 ) ) ( AVAILABLE ?auto_1176562 ) ( SURFACE-AT ?auto_1176558 ?auto_1176559 ) ( ON ?auto_1176558 ?auto_1176560 ) ( CLEAR ?auto_1176558 ) ( not ( = ?auto_1176557 ?auto_1176560 ) ) ( not ( = ?auto_1176558 ?auto_1176560 ) ) ( not ( = ?auto_1176553 ?auto_1176560 ) ) ( ON ?auto_1176555 ?auto_1176554 ) ( ON ?auto_1176556 ?auto_1176555 ) ( ON ?auto_1176553 ?auto_1176556 ) ( not ( = ?auto_1176554 ?auto_1176555 ) ) ( not ( = ?auto_1176554 ?auto_1176556 ) ) ( not ( = ?auto_1176554 ?auto_1176553 ) ) ( not ( = ?auto_1176554 ?auto_1176557 ) ) ( not ( = ?auto_1176554 ?auto_1176558 ) ) ( not ( = ?auto_1176554 ?auto_1176560 ) ) ( not ( = ?auto_1176555 ?auto_1176556 ) ) ( not ( = ?auto_1176555 ?auto_1176553 ) ) ( not ( = ?auto_1176555 ?auto_1176557 ) ) ( not ( = ?auto_1176555 ?auto_1176558 ) ) ( not ( = ?auto_1176555 ?auto_1176560 ) ) ( not ( = ?auto_1176556 ?auto_1176553 ) ) ( not ( = ?auto_1176556 ?auto_1176557 ) ) ( not ( = ?auto_1176556 ?auto_1176558 ) ) ( not ( = ?auto_1176556 ?auto_1176560 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1176553 ?auto_1176557 ?auto_1176558 )
      ( MAKE-5CRATE-VERIFY ?auto_1176554 ?auto_1176555 ?auto_1176556 ?auto_1176553 ?auto_1176557 ?auto_1176558 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1176605 - SURFACE
      ?auto_1176606 - SURFACE
      ?auto_1176607 - SURFACE
      ?auto_1176604 - SURFACE
      ?auto_1176608 - SURFACE
      ?auto_1176609 - SURFACE
    )
    :vars
    (
      ?auto_1176610 - HOIST
      ?auto_1176614 - PLACE
      ?auto_1176612 - PLACE
      ?auto_1176613 - HOIST
      ?auto_1176615 - SURFACE
      ?auto_1176611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176610 ?auto_1176614 ) ( SURFACE-AT ?auto_1176608 ?auto_1176614 ) ( CLEAR ?auto_1176608 ) ( IS-CRATE ?auto_1176609 ) ( not ( = ?auto_1176608 ?auto_1176609 ) ) ( AVAILABLE ?auto_1176610 ) ( ON ?auto_1176608 ?auto_1176604 ) ( not ( = ?auto_1176604 ?auto_1176608 ) ) ( not ( = ?auto_1176604 ?auto_1176609 ) ) ( not ( = ?auto_1176612 ?auto_1176614 ) ) ( HOIST-AT ?auto_1176613 ?auto_1176612 ) ( not ( = ?auto_1176610 ?auto_1176613 ) ) ( AVAILABLE ?auto_1176613 ) ( SURFACE-AT ?auto_1176609 ?auto_1176612 ) ( ON ?auto_1176609 ?auto_1176615 ) ( CLEAR ?auto_1176609 ) ( not ( = ?auto_1176608 ?auto_1176615 ) ) ( not ( = ?auto_1176609 ?auto_1176615 ) ) ( not ( = ?auto_1176604 ?auto_1176615 ) ) ( TRUCK-AT ?auto_1176611 ?auto_1176614 ) ( ON ?auto_1176606 ?auto_1176605 ) ( ON ?auto_1176607 ?auto_1176606 ) ( ON ?auto_1176604 ?auto_1176607 ) ( not ( = ?auto_1176605 ?auto_1176606 ) ) ( not ( = ?auto_1176605 ?auto_1176607 ) ) ( not ( = ?auto_1176605 ?auto_1176604 ) ) ( not ( = ?auto_1176605 ?auto_1176608 ) ) ( not ( = ?auto_1176605 ?auto_1176609 ) ) ( not ( = ?auto_1176605 ?auto_1176615 ) ) ( not ( = ?auto_1176606 ?auto_1176607 ) ) ( not ( = ?auto_1176606 ?auto_1176604 ) ) ( not ( = ?auto_1176606 ?auto_1176608 ) ) ( not ( = ?auto_1176606 ?auto_1176609 ) ) ( not ( = ?auto_1176606 ?auto_1176615 ) ) ( not ( = ?auto_1176607 ?auto_1176604 ) ) ( not ( = ?auto_1176607 ?auto_1176608 ) ) ( not ( = ?auto_1176607 ?auto_1176609 ) ) ( not ( = ?auto_1176607 ?auto_1176615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1176604 ?auto_1176608 ?auto_1176609 )
      ( MAKE-5CRATE-VERIFY ?auto_1176605 ?auto_1176606 ?auto_1176607 ?auto_1176604 ?auto_1176608 ?auto_1176609 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1176656 - SURFACE
      ?auto_1176657 - SURFACE
      ?auto_1176658 - SURFACE
      ?auto_1176655 - SURFACE
      ?auto_1176659 - SURFACE
      ?auto_1176660 - SURFACE
    )
    :vars
    (
      ?auto_1176665 - HOIST
      ?auto_1176661 - PLACE
      ?auto_1176662 - PLACE
      ?auto_1176663 - HOIST
      ?auto_1176664 - SURFACE
      ?auto_1176666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176665 ?auto_1176661 ) ( IS-CRATE ?auto_1176660 ) ( not ( = ?auto_1176659 ?auto_1176660 ) ) ( not ( = ?auto_1176655 ?auto_1176659 ) ) ( not ( = ?auto_1176655 ?auto_1176660 ) ) ( not ( = ?auto_1176662 ?auto_1176661 ) ) ( HOIST-AT ?auto_1176663 ?auto_1176662 ) ( not ( = ?auto_1176665 ?auto_1176663 ) ) ( AVAILABLE ?auto_1176663 ) ( SURFACE-AT ?auto_1176660 ?auto_1176662 ) ( ON ?auto_1176660 ?auto_1176664 ) ( CLEAR ?auto_1176660 ) ( not ( = ?auto_1176659 ?auto_1176664 ) ) ( not ( = ?auto_1176660 ?auto_1176664 ) ) ( not ( = ?auto_1176655 ?auto_1176664 ) ) ( TRUCK-AT ?auto_1176666 ?auto_1176661 ) ( SURFACE-AT ?auto_1176655 ?auto_1176661 ) ( CLEAR ?auto_1176655 ) ( LIFTING ?auto_1176665 ?auto_1176659 ) ( IS-CRATE ?auto_1176659 ) ( ON ?auto_1176657 ?auto_1176656 ) ( ON ?auto_1176658 ?auto_1176657 ) ( ON ?auto_1176655 ?auto_1176658 ) ( not ( = ?auto_1176656 ?auto_1176657 ) ) ( not ( = ?auto_1176656 ?auto_1176658 ) ) ( not ( = ?auto_1176656 ?auto_1176655 ) ) ( not ( = ?auto_1176656 ?auto_1176659 ) ) ( not ( = ?auto_1176656 ?auto_1176660 ) ) ( not ( = ?auto_1176656 ?auto_1176664 ) ) ( not ( = ?auto_1176657 ?auto_1176658 ) ) ( not ( = ?auto_1176657 ?auto_1176655 ) ) ( not ( = ?auto_1176657 ?auto_1176659 ) ) ( not ( = ?auto_1176657 ?auto_1176660 ) ) ( not ( = ?auto_1176657 ?auto_1176664 ) ) ( not ( = ?auto_1176658 ?auto_1176655 ) ) ( not ( = ?auto_1176658 ?auto_1176659 ) ) ( not ( = ?auto_1176658 ?auto_1176660 ) ) ( not ( = ?auto_1176658 ?auto_1176664 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1176655 ?auto_1176659 ?auto_1176660 )
      ( MAKE-5CRATE-VERIFY ?auto_1176656 ?auto_1176657 ?auto_1176658 ?auto_1176655 ?auto_1176659 ?auto_1176660 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1176707 - SURFACE
      ?auto_1176708 - SURFACE
      ?auto_1176709 - SURFACE
      ?auto_1176706 - SURFACE
      ?auto_1176710 - SURFACE
      ?auto_1176711 - SURFACE
    )
    :vars
    (
      ?auto_1176716 - HOIST
      ?auto_1176713 - PLACE
      ?auto_1176714 - PLACE
      ?auto_1176715 - HOIST
      ?auto_1176717 - SURFACE
      ?auto_1176712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176716 ?auto_1176713 ) ( IS-CRATE ?auto_1176711 ) ( not ( = ?auto_1176710 ?auto_1176711 ) ) ( not ( = ?auto_1176706 ?auto_1176710 ) ) ( not ( = ?auto_1176706 ?auto_1176711 ) ) ( not ( = ?auto_1176714 ?auto_1176713 ) ) ( HOIST-AT ?auto_1176715 ?auto_1176714 ) ( not ( = ?auto_1176716 ?auto_1176715 ) ) ( AVAILABLE ?auto_1176715 ) ( SURFACE-AT ?auto_1176711 ?auto_1176714 ) ( ON ?auto_1176711 ?auto_1176717 ) ( CLEAR ?auto_1176711 ) ( not ( = ?auto_1176710 ?auto_1176717 ) ) ( not ( = ?auto_1176711 ?auto_1176717 ) ) ( not ( = ?auto_1176706 ?auto_1176717 ) ) ( TRUCK-AT ?auto_1176712 ?auto_1176713 ) ( SURFACE-AT ?auto_1176706 ?auto_1176713 ) ( CLEAR ?auto_1176706 ) ( IS-CRATE ?auto_1176710 ) ( AVAILABLE ?auto_1176716 ) ( IN ?auto_1176710 ?auto_1176712 ) ( ON ?auto_1176708 ?auto_1176707 ) ( ON ?auto_1176709 ?auto_1176708 ) ( ON ?auto_1176706 ?auto_1176709 ) ( not ( = ?auto_1176707 ?auto_1176708 ) ) ( not ( = ?auto_1176707 ?auto_1176709 ) ) ( not ( = ?auto_1176707 ?auto_1176706 ) ) ( not ( = ?auto_1176707 ?auto_1176710 ) ) ( not ( = ?auto_1176707 ?auto_1176711 ) ) ( not ( = ?auto_1176707 ?auto_1176717 ) ) ( not ( = ?auto_1176708 ?auto_1176709 ) ) ( not ( = ?auto_1176708 ?auto_1176706 ) ) ( not ( = ?auto_1176708 ?auto_1176710 ) ) ( not ( = ?auto_1176708 ?auto_1176711 ) ) ( not ( = ?auto_1176708 ?auto_1176717 ) ) ( not ( = ?auto_1176709 ?auto_1176706 ) ) ( not ( = ?auto_1176709 ?auto_1176710 ) ) ( not ( = ?auto_1176709 ?auto_1176711 ) ) ( not ( = ?auto_1176709 ?auto_1176717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1176706 ?auto_1176710 ?auto_1176711 )
      ( MAKE-5CRATE-VERIFY ?auto_1176707 ?auto_1176708 ?auto_1176709 ?auto_1176706 ?auto_1176710 ?auto_1176711 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1177916 - SURFACE
      ?auto_1177917 - SURFACE
      ?auto_1177918 - SURFACE
      ?auto_1177915 - SURFACE
      ?auto_1177919 - SURFACE
      ?auto_1177921 - SURFACE
      ?auto_1177920 - SURFACE
    )
    :vars
    (
      ?auto_1177922 - HOIST
      ?auto_1177923 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1177922 ?auto_1177923 ) ( SURFACE-AT ?auto_1177921 ?auto_1177923 ) ( CLEAR ?auto_1177921 ) ( LIFTING ?auto_1177922 ?auto_1177920 ) ( IS-CRATE ?auto_1177920 ) ( not ( = ?auto_1177921 ?auto_1177920 ) ) ( ON ?auto_1177917 ?auto_1177916 ) ( ON ?auto_1177918 ?auto_1177917 ) ( ON ?auto_1177915 ?auto_1177918 ) ( ON ?auto_1177919 ?auto_1177915 ) ( ON ?auto_1177921 ?auto_1177919 ) ( not ( = ?auto_1177916 ?auto_1177917 ) ) ( not ( = ?auto_1177916 ?auto_1177918 ) ) ( not ( = ?auto_1177916 ?auto_1177915 ) ) ( not ( = ?auto_1177916 ?auto_1177919 ) ) ( not ( = ?auto_1177916 ?auto_1177921 ) ) ( not ( = ?auto_1177916 ?auto_1177920 ) ) ( not ( = ?auto_1177917 ?auto_1177918 ) ) ( not ( = ?auto_1177917 ?auto_1177915 ) ) ( not ( = ?auto_1177917 ?auto_1177919 ) ) ( not ( = ?auto_1177917 ?auto_1177921 ) ) ( not ( = ?auto_1177917 ?auto_1177920 ) ) ( not ( = ?auto_1177918 ?auto_1177915 ) ) ( not ( = ?auto_1177918 ?auto_1177919 ) ) ( not ( = ?auto_1177918 ?auto_1177921 ) ) ( not ( = ?auto_1177918 ?auto_1177920 ) ) ( not ( = ?auto_1177915 ?auto_1177919 ) ) ( not ( = ?auto_1177915 ?auto_1177921 ) ) ( not ( = ?auto_1177915 ?auto_1177920 ) ) ( not ( = ?auto_1177919 ?auto_1177921 ) ) ( not ( = ?auto_1177919 ?auto_1177920 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1177921 ?auto_1177920 )
      ( MAKE-6CRATE-VERIFY ?auto_1177916 ?auto_1177917 ?auto_1177918 ?auto_1177915 ?auto_1177919 ?auto_1177921 ?auto_1177920 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1177960 - SURFACE
      ?auto_1177961 - SURFACE
      ?auto_1177962 - SURFACE
      ?auto_1177959 - SURFACE
      ?auto_1177963 - SURFACE
      ?auto_1177965 - SURFACE
      ?auto_1177964 - SURFACE
    )
    :vars
    (
      ?auto_1177966 - HOIST
      ?auto_1177968 - PLACE
      ?auto_1177967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1177966 ?auto_1177968 ) ( SURFACE-AT ?auto_1177965 ?auto_1177968 ) ( CLEAR ?auto_1177965 ) ( IS-CRATE ?auto_1177964 ) ( not ( = ?auto_1177965 ?auto_1177964 ) ) ( TRUCK-AT ?auto_1177967 ?auto_1177968 ) ( AVAILABLE ?auto_1177966 ) ( IN ?auto_1177964 ?auto_1177967 ) ( ON ?auto_1177965 ?auto_1177963 ) ( not ( = ?auto_1177963 ?auto_1177965 ) ) ( not ( = ?auto_1177963 ?auto_1177964 ) ) ( ON ?auto_1177961 ?auto_1177960 ) ( ON ?auto_1177962 ?auto_1177961 ) ( ON ?auto_1177959 ?auto_1177962 ) ( ON ?auto_1177963 ?auto_1177959 ) ( not ( = ?auto_1177960 ?auto_1177961 ) ) ( not ( = ?auto_1177960 ?auto_1177962 ) ) ( not ( = ?auto_1177960 ?auto_1177959 ) ) ( not ( = ?auto_1177960 ?auto_1177963 ) ) ( not ( = ?auto_1177960 ?auto_1177965 ) ) ( not ( = ?auto_1177960 ?auto_1177964 ) ) ( not ( = ?auto_1177961 ?auto_1177962 ) ) ( not ( = ?auto_1177961 ?auto_1177959 ) ) ( not ( = ?auto_1177961 ?auto_1177963 ) ) ( not ( = ?auto_1177961 ?auto_1177965 ) ) ( not ( = ?auto_1177961 ?auto_1177964 ) ) ( not ( = ?auto_1177962 ?auto_1177959 ) ) ( not ( = ?auto_1177962 ?auto_1177963 ) ) ( not ( = ?auto_1177962 ?auto_1177965 ) ) ( not ( = ?auto_1177962 ?auto_1177964 ) ) ( not ( = ?auto_1177959 ?auto_1177963 ) ) ( not ( = ?auto_1177959 ?auto_1177965 ) ) ( not ( = ?auto_1177959 ?auto_1177964 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1177963 ?auto_1177965 ?auto_1177964 )
      ( MAKE-6CRATE-VERIFY ?auto_1177960 ?auto_1177961 ?auto_1177962 ?auto_1177959 ?auto_1177963 ?auto_1177965 ?auto_1177964 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1178011 - SURFACE
      ?auto_1178012 - SURFACE
      ?auto_1178013 - SURFACE
      ?auto_1178010 - SURFACE
      ?auto_1178014 - SURFACE
      ?auto_1178016 - SURFACE
      ?auto_1178015 - SURFACE
    )
    :vars
    (
      ?auto_1178019 - HOIST
      ?auto_1178017 - PLACE
      ?auto_1178020 - TRUCK
      ?auto_1178018 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1178019 ?auto_1178017 ) ( SURFACE-AT ?auto_1178016 ?auto_1178017 ) ( CLEAR ?auto_1178016 ) ( IS-CRATE ?auto_1178015 ) ( not ( = ?auto_1178016 ?auto_1178015 ) ) ( AVAILABLE ?auto_1178019 ) ( IN ?auto_1178015 ?auto_1178020 ) ( ON ?auto_1178016 ?auto_1178014 ) ( not ( = ?auto_1178014 ?auto_1178016 ) ) ( not ( = ?auto_1178014 ?auto_1178015 ) ) ( TRUCK-AT ?auto_1178020 ?auto_1178018 ) ( not ( = ?auto_1178018 ?auto_1178017 ) ) ( ON ?auto_1178012 ?auto_1178011 ) ( ON ?auto_1178013 ?auto_1178012 ) ( ON ?auto_1178010 ?auto_1178013 ) ( ON ?auto_1178014 ?auto_1178010 ) ( not ( = ?auto_1178011 ?auto_1178012 ) ) ( not ( = ?auto_1178011 ?auto_1178013 ) ) ( not ( = ?auto_1178011 ?auto_1178010 ) ) ( not ( = ?auto_1178011 ?auto_1178014 ) ) ( not ( = ?auto_1178011 ?auto_1178016 ) ) ( not ( = ?auto_1178011 ?auto_1178015 ) ) ( not ( = ?auto_1178012 ?auto_1178013 ) ) ( not ( = ?auto_1178012 ?auto_1178010 ) ) ( not ( = ?auto_1178012 ?auto_1178014 ) ) ( not ( = ?auto_1178012 ?auto_1178016 ) ) ( not ( = ?auto_1178012 ?auto_1178015 ) ) ( not ( = ?auto_1178013 ?auto_1178010 ) ) ( not ( = ?auto_1178013 ?auto_1178014 ) ) ( not ( = ?auto_1178013 ?auto_1178016 ) ) ( not ( = ?auto_1178013 ?auto_1178015 ) ) ( not ( = ?auto_1178010 ?auto_1178014 ) ) ( not ( = ?auto_1178010 ?auto_1178016 ) ) ( not ( = ?auto_1178010 ?auto_1178015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1178014 ?auto_1178016 ?auto_1178015 )
      ( MAKE-6CRATE-VERIFY ?auto_1178011 ?auto_1178012 ?auto_1178013 ?auto_1178010 ?auto_1178014 ?auto_1178016 ?auto_1178015 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1178068 - SURFACE
      ?auto_1178069 - SURFACE
      ?auto_1178070 - SURFACE
      ?auto_1178067 - SURFACE
      ?auto_1178071 - SURFACE
      ?auto_1178073 - SURFACE
      ?auto_1178072 - SURFACE
    )
    :vars
    (
      ?auto_1178078 - HOIST
      ?auto_1178076 - PLACE
      ?auto_1178077 - TRUCK
      ?auto_1178074 - PLACE
      ?auto_1178075 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1178078 ?auto_1178076 ) ( SURFACE-AT ?auto_1178073 ?auto_1178076 ) ( CLEAR ?auto_1178073 ) ( IS-CRATE ?auto_1178072 ) ( not ( = ?auto_1178073 ?auto_1178072 ) ) ( AVAILABLE ?auto_1178078 ) ( ON ?auto_1178073 ?auto_1178071 ) ( not ( = ?auto_1178071 ?auto_1178073 ) ) ( not ( = ?auto_1178071 ?auto_1178072 ) ) ( TRUCK-AT ?auto_1178077 ?auto_1178074 ) ( not ( = ?auto_1178074 ?auto_1178076 ) ) ( HOIST-AT ?auto_1178075 ?auto_1178074 ) ( LIFTING ?auto_1178075 ?auto_1178072 ) ( not ( = ?auto_1178078 ?auto_1178075 ) ) ( ON ?auto_1178069 ?auto_1178068 ) ( ON ?auto_1178070 ?auto_1178069 ) ( ON ?auto_1178067 ?auto_1178070 ) ( ON ?auto_1178071 ?auto_1178067 ) ( not ( = ?auto_1178068 ?auto_1178069 ) ) ( not ( = ?auto_1178068 ?auto_1178070 ) ) ( not ( = ?auto_1178068 ?auto_1178067 ) ) ( not ( = ?auto_1178068 ?auto_1178071 ) ) ( not ( = ?auto_1178068 ?auto_1178073 ) ) ( not ( = ?auto_1178068 ?auto_1178072 ) ) ( not ( = ?auto_1178069 ?auto_1178070 ) ) ( not ( = ?auto_1178069 ?auto_1178067 ) ) ( not ( = ?auto_1178069 ?auto_1178071 ) ) ( not ( = ?auto_1178069 ?auto_1178073 ) ) ( not ( = ?auto_1178069 ?auto_1178072 ) ) ( not ( = ?auto_1178070 ?auto_1178067 ) ) ( not ( = ?auto_1178070 ?auto_1178071 ) ) ( not ( = ?auto_1178070 ?auto_1178073 ) ) ( not ( = ?auto_1178070 ?auto_1178072 ) ) ( not ( = ?auto_1178067 ?auto_1178071 ) ) ( not ( = ?auto_1178067 ?auto_1178073 ) ) ( not ( = ?auto_1178067 ?auto_1178072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1178071 ?auto_1178073 ?auto_1178072 )
      ( MAKE-6CRATE-VERIFY ?auto_1178068 ?auto_1178069 ?auto_1178070 ?auto_1178067 ?auto_1178071 ?auto_1178073 ?auto_1178072 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1178131 - SURFACE
      ?auto_1178132 - SURFACE
      ?auto_1178133 - SURFACE
      ?auto_1178130 - SURFACE
      ?auto_1178134 - SURFACE
      ?auto_1178136 - SURFACE
      ?auto_1178135 - SURFACE
    )
    :vars
    (
      ?auto_1178138 - HOIST
      ?auto_1178141 - PLACE
      ?auto_1178139 - TRUCK
      ?auto_1178137 - PLACE
      ?auto_1178142 - HOIST
      ?auto_1178140 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1178138 ?auto_1178141 ) ( SURFACE-AT ?auto_1178136 ?auto_1178141 ) ( CLEAR ?auto_1178136 ) ( IS-CRATE ?auto_1178135 ) ( not ( = ?auto_1178136 ?auto_1178135 ) ) ( AVAILABLE ?auto_1178138 ) ( ON ?auto_1178136 ?auto_1178134 ) ( not ( = ?auto_1178134 ?auto_1178136 ) ) ( not ( = ?auto_1178134 ?auto_1178135 ) ) ( TRUCK-AT ?auto_1178139 ?auto_1178137 ) ( not ( = ?auto_1178137 ?auto_1178141 ) ) ( HOIST-AT ?auto_1178142 ?auto_1178137 ) ( not ( = ?auto_1178138 ?auto_1178142 ) ) ( AVAILABLE ?auto_1178142 ) ( SURFACE-AT ?auto_1178135 ?auto_1178137 ) ( ON ?auto_1178135 ?auto_1178140 ) ( CLEAR ?auto_1178135 ) ( not ( = ?auto_1178136 ?auto_1178140 ) ) ( not ( = ?auto_1178135 ?auto_1178140 ) ) ( not ( = ?auto_1178134 ?auto_1178140 ) ) ( ON ?auto_1178132 ?auto_1178131 ) ( ON ?auto_1178133 ?auto_1178132 ) ( ON ?auto_1178130 ?auto_1178133 ) ( ON ?auto_1178134 ?auto_1178130 ) ( not ( = ?auto_1178131 ?auto_1178132 ) ) ( not ( = ?auto_1178131 ?auto_1178133 ) ) ( not ( = ?auto_1178131 ?auto_1178130 ) ) ( not ( = ?auto_1178131 ?auto_1178134 ) ) ( not ( = ?auto_1178131 ?auto_1178136 ) ) ( not ( = ?auto_1178131 ?auto_1178135 ) ) ( not ( = ?auto_1178131 ?auto_1178140 ) ) ( not ( = ?auto_1178132 ?auto_1178133 ) ) ( not ( = ?auto_1178132 ?auto_1178130 ) ) ( not ( = ?auto_1178132 ?auto_1178134 ) ) ( not ( = ?auto_1178132 ?auto_1178136 ) ) ( not ( = ?auto_1178132 ?auto_1178135 ) ) ( not ( = ?auto_1178132 ?auto_1178140 ) ) ( not ( = ?auto_1178133 ?auto_1178130 ) ) ( not ( = ?auto_1178133 ?auto_1178134 ) ) ( not ( = ?auto_1178133 ?auto_1178136 ) ) ( not ( = ?auto_1178133 ?auto_1178135 ) ) ( not ( = ?auto_1178133 ?auto_1178140 ) ) ( not ( = ?auto_1178130 ?auto_1178134 ) ) ( not ( = ?auto_1178130 ?auto_1178136 ) ) ( not ( = ?auto_1178130 ?auto_1178135 ) ) ( not ( = ?auto_1178130 ?auto_1178140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1178134 ?auto_1178136 ?auto_1178135 )
      ( MAKE-6CRATE-VERIFY ?auto_1178131 ?auto_1178132 ?auto_1178133 ?auto_1178130 ?auto_1178134 ?auto_1178136 ?auto_1178135 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1178195 - SURFACE
      ?auto_1178196 - SURFACE
      ?auto_1178197 - SURFACE
      ?auto_1178194 - SURFACE
      ?auto_1178198 - SURFACE
      ?auto_1178200 - SURFACE
      ?auto_1178199 - SURFACE
    )
    :vars
    (
      ?auto_1178206 - HOIST
      ?auto_1178204 - PLACE
      ?auto_1178203 - PLACE
      ?auto_1178202 - HOIST
      ?auto_1178201 - SURFACE
      ?auto_1178205 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1178206 ?auto_1178204 ) ( SURFACE-AT ?auto_1178200 ?auto_1178204 ) ( CLEAR ?auto_1178200 ) ( IS-CRATE ?auto_1178199 ) ( not ( = ?auto_1178200 ?auto_1178199 ) ) ( AVAILABLE ?auto_1178206 ) ( ON ?auto_1178200 ?auto_1178198 ) ( not ( = ?auto_1178198 ?auto_1178200 ) ) ( not ( = ?auto_1178198 ?auto_1178199 ) ) ( not ( = ?auto_1178203 ?auto_1178204 ) ) ( HOIST-AT ?auto_1178202 ?auto_1178203 ) ( not ( = ?auto_1178206 ?auto_1178202 ) ) ( AVAILABLE ?auto_1178202 ) ( SURFACE-AT ?auto_1178199 ?auto_1178203 ) ( ON ?auto_1178199 ?auto_1178201 ) ( CLEAR ?auto_1178199 ) ( not ( = ?auto_1178200 ?auto_1178201 ) ) ( not ( = ?auto_1178199 ?auto_1178201 ) ) ( not ( = ?auto_1178198 ?auto_1178201 ) ) ( TRUCK-AT ?auto_1178205 ?auto_1178204 ) ( ON ?auto_1178196 ?auto_1178195 ) ( ON ?auto_1178197 ?auto_1178196 ) ( ON ?auto_1178194 ?auto_1178197 ) ( ON ?auto_1178198 ?auto_1178194 ) ( not ( = ?auto_1178195 ?auto_1178196 ) ) ( not ( = ?auto_1178195 ?auto_1178197 ) ) ( not ( = ?auto_1178195 ?auto_1178194 ) ) ( not ( = ?auto_1178195 ?auto_1178198 ) ) ( not ( = ?auto_1178195 ?auto_1178200 ) ) ( not ( = ?auto_1178195 ?auto_1178199 ) ) ( not ( = ?auto_1178195 ?auto_1178201 ) ) ( not ( = ?auto_1178196 ?auto_1178197 ) ) ( not ( = ?auto_1178196 ?auto_1178194 ) ) ( not ( = ?auto_1178196 ?auto_1178198 ) ) ( not ( = ?auto_1178196 ?auto_1178200 ) ) ( not ( = ?auto_1178196 ?auto_1178199 ) ) ( not ( = ?auto_1178196 ?auto_1178201 ) ) ( not ( = ?auto_1178197 ?auto_1178194 ) ) ( not ( = ?auto_1178197 ?auto_1178198 ) ) ( not ( = ?auto_1178197 ?auto_1178200 ) ) ( not ( = ?auto_1178197 ?auto_1178199 ) ) ( not ( = ?auto_1178197 ?auto_1178201 ) ) ( not ( = ?auto_1178194 ?auto_1178198 ) ) ( not ( = ?auto_1178194 ?auto_1178200 ) ) ( not ( = ?auto_1178194 ?auto_1178199 ) ) ( not ( = ?auto_1178194 ?auto_1178201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1178198 ?auto_1178200 ?auto_1178199 )
      ( MAKE-6CRATE-VERIFY ?auto_1178195 ?auto_1178196 ?auto_1178197 ?auto_1178194 ?auto_1178198 ?auto_1178200 ?auto_1178199 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1178259 - SURFACE
      ?auto_1178260 - SURFACE
      ?auto_1178261 - SURFACE
      ?auto_1178258 - SURFACE
      ?auto_1178262 - SURFACE
      ?auto_1178264 - SURFACE
      ?auto_1178263 - SURFACE
    )
    :vars
    (
      ?auto_1178265 - HOIST
      ?auto_1178269 - PLACE
      ?auto_1178268 - PLACE
      ?auto_1178266 - HOIST
      ?auto_1178270 - SURFACE
      ?auto_1178267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1178265 ?auto_1178269 ) ( IS-CRATE ?auto_1178263 ) ( not ( = ?auto_1178264 ?auto_1178263 ) ) ( not ( = ?auto_1178262 ?auto_1178264 ) ) ( not ( = ?auto_1178262 ?auto_1178263 ) ) ( not ( = ?auto_1178268 ?auto_1178269 ) ) ( HOIST-AT ?auto_1178266 ?auto_1178268 ) ( not ( = ?auto_1178265 ?auto_1178266 ) ) ( AVAILABLE ?auto_1178266 ) ( SURFACE-AT ?auto_1178263 ?auto_1178268 ) ( ON ?auto_1178263 ?auto_1178270 ) ( CLEAR ?auto_1178263 ) ( not ( = ?auto_1178264 ?auto_1178270 ) ) ( not ( = ?auto_1178263 ?auto_1178270 ) ) ( not ( = ?auto_1178262 ?auto_1178270 ) ) ( TRUCK-AT ?auto_1178267 ?auto_1178269 ) ( SURFACE-AT ?auto_1178262 ?auto_1178269 ) ( CLEAR ?auto_1178262 ) ( LIFTING ?auto_1178265 ?auto_1178264 ) ( IS-CRATE ?auto_1178264 ) ( ON ?auto_1178260 ?auto_1178259 ) ( ON ?auto_1178261 ?auto_1178260 ) ( ON ?auto_1178258 ?auto_1178261 ) ( ON ?auto_1178262 ?auto_1178258 ) ( not ( = ?auto_1178259 ?auto_1178260 ) ) ( not ( = ?auto_1178259 ?auto_1178261 ) ) ( not ( = ?auto_1178259 ?auto_1178258 ) ) ( not ( = ?auto_1178259 ?auto_1178262 ) ) ( not ( = ?auto_1178259 ?auto_1178264 ) ) ( not ( = ?auto_1178259 ?auto_1178263 ) ) ( not ( = ?auto_1178259 ?auto_1178270 ) ) ( not ( = ?auto_1178260 ?auto_1178261 ) ) ( not ( = ?auto_1178260 ?auto_1178258 ) ) ( not ( = ?auto_1178260 ?auto_1178262 ) ) ( not ( = ?auto_1178260 ?auto_1178264 ) ) ( not ( = ?auto_1178260 ?auto_1178263 ) ) ( not ( = ?auto_1178260 ?auto_1178270 ) ) ( not ( = ?auto_1178261 ?auto_1178258 ) ) ( not ( = ?auto_1178261 ?auto_1178262 ) ) ( not ( = ?auto_1178261 ?auto_1178264 ) ) ( not ( = ?auto_1178261 ?auto_1178263 ) ) ( not ( = ?auto_1178261 ?auto_1178270 ) ) ( not ( = ?auto_1178258 ?auto_1178262 ) ) ( not ( = ?auto_1178258 ?auto_1178264 ) ) ( not ( = ?auto_1178258 ?auto_1178263 ) ) ( not ( = ?auto_1178258 ?auto_1178270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1178262 ?auto_1178264 ?auto_1178263 )
      ( MAKE-6CRATE-VERIFY ?auto_1178259 ?auto_1178260 ?auto_1178261 ?auto_1178258 ?auto_1178262 ?auto_1178264 ?auto_1178263 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1178323 - SURFACE
      ?auto_1178324 - SURFACE
      ?auto_1178325 - SURFACE
      ?auto_1178322 - SURFACE
      ?auto_1178326 - SURFACE
      ?auto_1178328 - SURFACE
      ?auto_1178327 - SURFACE
    )
    :vars
    (
      ?auto_1178333 - HOIST
      ?auto_1178331 - PLACE
      ?auto_1178329 - PLACE
      ?auto_1178332 - HOIST
      ?auto_1178334 - SURFACE
      ?auto_1178330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1178333 ?auto_1178331 ) ( IS-CRATE ?auto_1178327 ) ( not ( = ?auto_1178328 ?auto_1178327 ) ) ( not ( = ?auto_1178326 ?auto_1178328 ) ) ( not ( = ?auto_1178326 ?auto_1178327 ) ) ( not ( = ?auto_1178329 ?auto_1178331 ) ) ( HOIST-AT ?auto_1178332 ?auto_1178329 ) ( not ( = ?auto_1178333 ?auto_1178332 ) ) ( AVAILABLE ?auto_1178332 ) ( SURFACE-AT ?auto_1178327 ?auto_1178329 ) ( ON ?auto_1178327 ?auto_1178334 ) ( CLEAR ?auto_1178327 ) ( not ( = ?auto_1178328 ?auto_1178334 ) ) ( not ( = ?auto_1178327 ?auto_1178334 ) ) ( not ( = ?auto_1178326 ?auto_1178334 ) ) ( TRUCK-AT ?auto_1178330 ?auto_1178331 ) ( SURFACE-AT ?auto_1178326 ?auto_1178331 ) ( CLEAR ?auto_1178326 ) ( IS-CRATE ?auto_1178328 ) ( AVAILABLE ?auto_1178333 ) ( IN ?auto_1178328 ?auto_1178330 ) ( ON ?auto_1178324 ?auto_1178323 ) ( ON ?auto_1178325 ?auto_1178324 ) ( ON ?auto_1178322 ?auto_1178325 ) ( ON ?auto_1178326 ?auto_1178322 ) ( not ( = ?auto_1178323 ?auto_1178324 ) ) ( not ( = ?auto_1178323 ?auto_1178325 ) ) ( not ( = ?auto_1178323 ?auto_1178322 ) ) ( not ( = ?auto_1178323 ?auto_1178326 ) ) ( not ( = ?auto_1178323 ?auto_1178328 ) ) ( not ( = ?auto_1178323 ?auto_1178327 ) ) ( not ( = ?auto_1178323 ?auto_1178334 ) ) ( not ( = ?auto_1178324 ?auto_1178325 ) ) ( not ( = ?auto_1178324 ?auto_1178322 ) ) ( not ( = ?auto_1178324 ?auto_1178326 ) ) ( not ( = ?auto_1178324 ?auto_1178328 ) ) ( not ( = ?auto_1178324 ?auto_1178327 ) ) ( not ( = ?auto_1178324 ?auto_1178334 ) ) ( not ( = ?auto_1178325 ?auto_1178322 ) ) ( not ( = ?auto_1178325 ?auto_1178326 ) ) ( not ( = ?auto_1178325 ?auto_1178328 ) ) ( not ( = ?auto_1178325 ?auto_1178327 ) ) ( not ( = ?auto_1178325 ?auto_1178334 ) ) ( not ( = ?auto_1178322 ?auto_1178326 ) ) ( not ( = ?auto_1178322 ?auto_1178328 ) ) ( not ( = ?auto_1178322 ?auto_1178327 ) ) ( not ( = ?auto_1178322 ?auto_1178334 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1178326 ?auto_1178328 ?auto_1178327 )
      ( MAKE-6CRATE-VERIFY ?auto_1178323 ?auto_1178324 ?auto_1178325 ?auto_1178322 ?auto_1178326 ?auto_1178328 ?auto_1178327 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1180279 - SURFACE
      ?auto_1180280 - SURFACE
      ?auto_1180281 - SURFACE
      ?auto_1180278 - SURFACE
      ?auto_1180282 - SURFACE
      ?auto_1180284 - SURFACE
      ?auto_1180283 - SURFACE
      ?auto_1180285 - SURFACE
    )
    :vars
    (
      ?auto_1180286 - HOIST
      ?auto_1180287 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180286 ?auto_1180287 ) ( SURFACE-AT ?auto_1180283 ?auto_1180287 ) ( CLEAR ?auto_1180283 ) ( LIFTING ?auto_1180286 ?auto_1180285 ) ( IS-CRATE ?auto_1180285 ) ( not ( = ?auto_1180283 ?auto_1180285 ) ) ( ON ?auto_1180280 ?auto_1180279 ) ( ON ?auto_1180281 ?auto_1180280 ) ( ON ?auto_1180278 ?auto_1180281 ) ( ON ?auto_1180282 ?auto_1180278 ) ( ON ?auto_1180284 ?auto_1180282 ) ( ON ?auto_1180283 ?auto_1180284 ) ( not ( = ?auto_1180279 ?auto_1180280 ) ) ( not ( = ?auto_1180279 ?auto_1180281 ) ) ( not ( = ?auto_1180279 ?auto_1180278 ) ) ( not ( = ?auto_1180279 ?auto_1180282 ) ) ( not ( = ?auto_1180279 ?auto_1180284 ) ) ( not ( = ?auto_1180279 ?auto_1180283 ) ) ( not ( = ?auto_1180279 ?auto_1180285 ) ) ( not ( = ?auto_1180280 ?auto_1180281 ) ) ( not ( = ?auto_1180280 ?auto_1180278 ) ) ( not ( = ?auto_1180280 ?auto_1180282 ) ) ( not ( = ?auto_1180280 ?auto_1180284 ) ) ( not ( = ?auto_1180280 ?auto_1180283 ) ) ( not ( = ?auto_1180280 ?auto_1180285 ) ) ( not ( = ?auto_1180281 ?auto_1180278 ) ) ( not ( = ?auto_1180281 ?auto_1180282 ) ) ( not ( = ?auto_1180281 ?auto_1180284 ) ) ( not ( = ?auto_1180281 ?auto_1180283 ) ) ( not ( = ?auto_1180281 ?auto_1180285 ) ) ( not ( = ?auto_1180278 ?auto_1180282 ) ) ( not ( = ?auto_1180278 ?auto_1180284 ) ) ( not ( = ?auto_1180278 ?auto_1180283 ) ) ( not ( = ?auto_1180278 ?auto_1180285 ) ) ( not ( = ?auto_1180282 ?auto_1180284 ) ) ( not ( = ?auto_1180282 ?auto_1180283 ) ) ( not ( = ?auto_1180282 ?auto_1180285 ) ) ( not ( = ?auto_1180284 ?auto_1180283 ) ) ( not ( = ?auto_1180284 ?auto_1180285 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1180283 ?auto_1180285 )
      ( MAKE-7CRATE-VERIFY ?auto_1180279 ?auto_1180280 ?auto_1180281 ?auto_1180278 ?auto_1180282 ?auto_1180284 ?auto_1180283 ?auto_1180285 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1180334 - SURFACE
      ?auto_1180335 - SURFACE
      ?auto_1180336 - SURFACE
      ?auto_1180333 - SURFACE
      ?auto_1180337 - SURFACE
      ?auto_1180339 - SURFACE
      ?auto_1180338 - SURFACE
      ?auto_1180340 - SURFACE
    )
    :vars
    (
      ?auto_1180342 - HOIST
      ?auto_1180343 - PLACE
      ?auto_1180341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180342 ?auto_1180343 ) ( SURFACE-AT ?auto_1180338 ?auto_1180343 ) ( CLEAR ?auto_1180338 ) ( IS-CRATE ?auto_1180340 ) ( not ( = ?auto_1180338 ?auto_1180340 ) ) ( TRUCK-AT ?auto_1180341 ?auto_1180343 ) ( AVAILABLE ?auto_1180342 ) ( IN ?auto_1180340 ?auto_1180341 ) ( ON ?auto_1180338 ?auto_1180339 ) ( not ( = ?auto_1180339 ?auto_1180338 ) ) ( not ( = ?auto_1180339 ?auto_1180340 ) ) ( ON ?auto_1180335 ?auto_1180334 ) ( ON ?auto_1180336 ?auto_1180335 ) ( ON ?auto_1180333 ?auto_1180336 ) ( ON ?auto_1180337 ?auto_1180333 ) ( ON ?auto_1180339 ?auto_1180337 ) ( not ( = ?auto_1180334 ?auto_1180335 ) ) ( not ( = ?auto_1180334 ?auto_1180336 ) ) ( not ( = ?auto_1180334 ?auto_1180333 ) ) ( not ( = ?auto_1180334 ?auto_1180337 ) ) ( not ( = ?auto_1180334 ?auto_1180339 ) ) ( not ( = ?auto_1180334 ?auto_1180338 ) ) ( not ( = ?auto_1180334 ?auto_1180340 ) ) ( not ( = ?auto_1180335 ?auto_1180336 ) ) ( not ( = ?auto_1180335 ?auto_1180333 ) ) ( not ( = ?auto_1180335 ?auto_1180337 ) ) ( not ( = ?auto_1180335 ?auto_1180339 ) ) ( not ( = ?auto_1180335 ?auto_1180338 ) ) ( not ( = ?auto_1180335 ?auto_1180340 ) ) ( not ( = ?auto_1180336 ?auto_1180333 ) ) ( not ( = ?auto_1180336 ?auto_1180337 ) ) ( not ( = ?auto_1180336 ?auto_1180339 ) ) ( not ( = ?auto_1180336 ?auto_1180338 ) ) ( not ( = ?auto_1180336 ?auto_1180340 ) ) ( not ( = ?auto_1180333 ?auto_1180337 ) ) ( not ( = ?auto_1180333 ?auto_1180339 ) ) ( not ( = ?auto_1180333 ?auto_1180338 ) ) ( not ( = ?auto_1180333 ?auto_1180340 ) ) ( not ( = ?auto_1180337 ?auto_1180339 ) ) ( not ( = ?auto_1180337 ?auto_1180338 ) ) ( not ( = ?auto_1180337 ?auto_1180340 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1180339 ?auto_1180338 ?auto_1180340 )
      ( MAKE-7CRATE-VERIFY ?auto_1180334 ?auto_1180335 ?auto_1180336 ?auto_1180333 ?auto_1180337 ?auto_1180339 ?auto_1180338 ?auto_1180340 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1180397 - SURFACE
      ?auto_1180398 - SURFACE
      ?auto_1180399 - SURFACE
      ?auto_1180396 - SURFACE
      ?auto_1180400 - SURFACE
      ?auto_1180402 - SURFACE
      ?auto_1180401 - SURFACE
      ?auto_1180403 - SURFACE
    )
    :vars
    (
      ?auto_1180407 - HOIST
      ?auto_1180406 - PLACE
      ?auto_1180404 - TRUCK
      ?auto_1180405 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180407 ?auto_1180406 ) ( SURFACE-AT ?auto_1180401 ?auto_1180406 ) ( CLEAR ?auto_1180401 ) ( IS-CRATE ?auto_1180403 ) ( not ( = ?auto_1180401 ?auto_1180403 ) ) ( AVAILABLE ?auto_1180407 ) ( IN ?auto_1180403 ?auto_1180404 ) ( ON ?auto_1180401 ?auto_1180402 ) ( not ( = ?auto_1180402 ?auto_1180401 ) ) ( not ( = ?auto_1180402 ?auto_1180403 ) ) ( TRUCK-AT ?auto_1180404 ?auto_1180405 ) ( not ( = ?auto_1180405 ?auto_1180406 ) ) ( ON ?auto_1180398 ?auto_1180397 ) ( ON ?auto_1180399 ?auto_1180398 ) ( ON ?auto_1180396 ?auto_1180399 ) ( ON ?auto_1180400 ?auto_1180396 ) ( ON ?auto_1180402 ?auto_1180400 ) ( not ( = ?auto_1180397 ?auto_1180398 ) ) ( not ( = ?auto_1180397 ?auto_1180399 ) ) ( not ( = ?auto_1180397 ?auto_1180396 ) ) ( not ( = ?auto_1180397 ?auto_1180400 ) ) ( not ( = ?auto_1180397 ?auto_1180402 ) ) ( not ( = ?auto_1180397 ?auto_1180401 ) ) ( not ( = ?auto_1180397 ?auto_1180403 ) ) ( not ( = ?auto_1180398 ?auto_1180399 ) ) ( not ( = ?auto_1180398 ?auto_1180396 ) ) ( not ( = ?auto_1180398 ?auto_1180400 ) ) ( not ( = ?auto_1180398 ?auto_1180402 ) ) ( not ( = ?auto_1180398 ?auto_1180401 ) ) ( not ( = ?auto_1180398 ?auto_1180403 ) ) ( not ( = ?auto_1180399 ?auto_1180396 ) ) ( not ( = ?auto_1180399 ?auto_1180400 ) ) ( not ( = ?auto_1180399 ?auto_1180402 ) ) ( not ( = ?auto_1180399 ?auto_1180401 ) ) ( not ( = ?auto_1180399 ?auto_1180403 ) ) ( not ( = ?auto_1180396 ?auto_1180400 ) ) ( not ( = ?auto_1180396 ?auto_1180402 ) ) ( not ( = ?auto_1180396 ?auto_1180401 ) ) ( not ( = ?auto_1180396 ?auto_1180403 ) ) ( not ( = ?auto_1180400 ?auto_1180402 ) ) ( not ( = ?auto_1180400 ?auto_1180401 ) ) ( not ( = ?auto_1180400 ?auto_1180403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1180402 ?auto_1180401 ?auto_1180403 )
      ( MAKE-7CRATE-VERIFY ?auto_1180397 ?auto_1180398 ?auto_1180399 ?auto_1180396 ?auto_1180400 ?auto_1180402 ?auto_1180401 ?auto_1180403 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1180467 - SURFACE
      ?auto_1180468 - SURFACE
      ?auto_1180469 - SURFACE
      ?auto_1180466 - SURFACE
      ?auto_1180470 - SURFACE
      ?auto_1180472 - SURFACE
      ?auto_1180471 - SURFACE
      ?auto_1180473 - SURFACE
    )
    :vars
    (
      ?auto_1180477 - HOIST
      ?auto_1180474 - PLACE
      ?auto_1180475 - TRUCK
      ?auto_1180476 - PLACE
      ?auto_1180478 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180477 ?auto_1180474 ) ( SURFACE-AT ?auto_1180471 ?auto_1180474 ) ( CLEAR ?auto_1180471 ) ( IS-CRATE ?auto_1180473 ) ( not ( = ?auto_1180471 ?auto_1180473 ) ) ( AVAILABLE ?auto_1180477 ) ( ON ?auto_1180471 ?auto_1180472 ) ( not ( = ?auto_1180472 ?auto_1180471 ) ) ( not ( = ?auto_1180472 ?auto_1180473 ) ) ( TRUCK-AT ?auto_1180475 ?auto_1180476 ) ( not ( = ?auto_1180476 ?auto_1180474 ) ) ( HOIST-AT ?auto_1180478 ?auto_1180476 ) ( LIFTING ?auto_1180478 ?auto_1180473 ) ( not ( = ?auto_1180477 ?auto_1180478 ) ) ( ON ?auto_1180468 ?auto_1180467 ) ( ON ?auto_1180469 ?auto_1180468 ) ( ON ?auto_1180466 ?auto_1180469 ) ( ON ?auto_1180470 ?auto_1180466 ) ( ON ?auto_1180472 ?auto_1180470 ) ( not ( = ?auto_1180467 ?auto_1180468 ) ) ( not ( = ?auto_1180467 ?auto_1180469 ) ) ( not ( = ?auto_1180467 ?auto_1180466 ) ) ( not ( = ?auto_1180467 ?auto_1180470 ) ) ( not ( = ?auto_1180467 ?auto_1180472 ) ) ( not ( = ?auto_1180467 ?auto_1180471 ) ) ( not ( = ?auto_1180467 ?auto_1180473 ) ) ( not ( = ?auto_1180468 ?auto_1180469 ) ) ( not ( = ?auto_1180468 ?auto_1180466 ) ) ( not ( = ?auto_1180468 ?auto_1180470 ) ) ( not ( = ?auto_1180468 ?auto_1180472 ) ) ( not ( = ?auto_1180468 ?auto_1180471 ) ) ( not ( = ?auto_1180468 ?auto_1180473 ) ) ( not ( = ?auto_1180469 ?auto_1180466 ) ) ( not ( = ?auto_1180469 ?auto_1180470 ) ) ( not ( = ?auto_1180469 ?auto_1180472 ) ) ( not ( = ?auto_1180469 ?auto_1180471 ) ) ( not ( = ?auto_1180469 ?auto_1180473 ) ) ( not ( = ?auto_1180466 ?auto_1180470 ) ) ( not ( = ?auto_1180466 ?auto_1180472 ) ) ( not ( = ?auto_1180466 ?auto_1180471 ) ) ( not ( = ?auto_1180466 ?auto_1180473 ) ) ( not ( = ?auto_1180470 ?auto_1180472 ) ) ( not ( = ?auto_1180470 ?auto_1180471 ) ) ( not ( = ?auto_1180470 ?auto_1180473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1180472 ?auto_1180471 ?auto_1180473 )
      ( MAKE-7CRATE-VERIFY ?auto_1180467 ?auto_1180468 ?auto_1180469 ?auto_1180466 ?auto_1180470 ?auto_1180472 ?auto_1180471 ?auto_1180473 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1180544 - SURFACE
      ?auto_1180545 - SURFACE
      ?auto_1180546 - SURFACE
      ?auto_1180543 - SURFACE
      ?auto_1180547 - SURFACE
      ?auto_1180549 - SURFACE
      ?auto_1180548 - SURFACE
      ?auto_1180550 - SURFACE
    )
    :vars
    (
      ?auto_1180551 - HOIST
      ?auto_1180555 - PLACE
      ?auto_1180556 - TRUCK
      ?auto_1180553 - PLACE
      ?auto_1180552 - HOIST
      ?auto_1180554 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180551 ?auto_1180555 ) ( SURFACE-AT ?auto_1180548 ?auto_1180555 ) ( CLEAR ?auto_1180548 ) ( IS-CRATE ?auto_1180550 ) ( not ( = ?auto_1180548 ?auto_1180550 ) ) ( AVAILABLE ?auto_1180551 ) ( ON ?auto_1180548 ?auto_1180549 ) ( not ( = ?auto_1180549 ?auto_1180548 ) ) ( not ( = ?auto_1180549 ?auto_1180550 ) ) ( TRUCK-AT ?auto_1180556 ?auto_1180553 ) ( not ( = ?auto_1180553 ?auto_1180555 ) ) ( HOIST-AT ?auto_1180552 ?auto_1180553 ) ( not ( = ?auto_1180551 ?auto_1180552 ) ) ( AVAILABLE ?auto_1180552 ) ( SURFACE-AT ?auto_1180550 ?auto_1180553 ) ( ON ?auto_1180550 ?auto_1180554 ) ( CLEAR ?auto_1180550 ) ( not ( = ?auto_1180548 ?auto_1180554 ) ) ( not ( = ?auto_1180550 ?auto_1180554 ) ) ( not ( = ?auto_1180549 ?auto_1180554 ) ) ( ON ?auto_1180545 ?auto_1180544 ) ( ON ?auto_1180546 ?auto_1180545 ) ( ON ?auto_1180543 ?auto_1180546 ) ( ON ?auto_1180547 ?auto_1180543 ) ( ON ?auto_1180549 ?auto_1180547 ) ( not ( = ?auto_1180544 ?auto_1180545 ) ) ( not ( = ?auto_1180544 ?auto_1180546 ) ) ( not ( = ?auto_1180544 ?auto_1180543 ) ) ( not ( = ?auto_1180544 ?auto_1180547 ) ) ( not ( = ?auto_1180544 ?auto_1180549 ) ) ( not ( = ?auto_1180544 ?auto_1180548 ) ) ( not ( = ?auto_1180544 ?auto_1180550 ) ) ( not ( = ?auto_1180544 ?auto_1180554 ) ) ( not ( = ?auto_1180545 ?auto_1180546 ) ) ( not ( = ?auto_1180545 ?auto_1180543 ) ) ( not ( = ?auto_1180545 ?auto_1180547 ) ) ( not ( = ?auto_1180545 ?auto_1180549 ) ) ( not ( = ?auto_1180545 ?auto_1180548 ) ) ( not ( = ?auto_1180545 ?auto_1180550 ) ) ( not ( = ?auto_1180545 ?auto_1180554 ) ) ( not ( = ?auto_1180546 ?auto_1180543 ) ) ( not ( = ?auto_1180546 ?auto_1180547 ) ) ( not ( = ?auto_1180546 ?auto_1180549 ) ) ( not ( = ?auto_1180546 ?auto_1180548 ) ) ( not ( = ?auto_1180546 ?auto_1180550 ) ) ( not ( = ?auto_1180546 ?auto_1180554 ) ) ( not ( = ?auto_1180543 ?auto_1180547 ) ) ( not ( = ?auto_1180543 ?auto_1180549 ) ) ( not ( = ?auto_1180543 ?auto_1180548 ) ) ( not ( = ?auto_1180543 ?auto_1180550 ) ) ( not ( = ?auto_1180543 ?auto_1180554 ) ) ( not ( = ?auto_1180547 ?auto_1180549 ) ) ( not ( = ?auto_1180547 ?auto_1180548 ) ) ( not ( = ?auto_1180547 ?auto_1180550 ) ) ( not ( = ?auto_1180547 ?auto_1180554 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1180549 ?auto_1180548 ?auto_1180550 )
      ( MAKE-7CRATE-VERIFY ?auto_1180544 ?auto_1180545 ?auto_1180546 ?auto_1180543 ?auto_1180547 ?auto_1180549 ?auto_1180548 ?auto_1180550 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1180622 - SURFACE
      ?auto_1180623 - SURFACE
      ?auto_1180624 - SURFACE
      ?auto_1180621 - SURFACE
      ?auto_1180625 - SURFACE
      ?auto_1180627 - SURFACE
      ?auto_1180626 - SURFACE
      ?auto_1180628 - SURFACE
    )
    :vars
    (
      ?auto_1180629 - HOIST
      ?auto_1180634 - PLACE
      ?auto_1180632 - PLACE
      ?auto_1180633 - HOIST
      ?auto_1180631 - SURFACE
      ?auto_1180630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180629 ?auto_1180634 ) ( SURFACE-AT ?auto_1180626 ?auto_1180634 ) ( CLEAR ?auto_1180626 ) ( IS-CRATE ?auto_1180628 ) ( not ( = ?auto_1180626 ?auto_1180628 ) ) ( AVAILABLE ?auto_1180629 ) ( ON ?auto_1180626 ?auto_1180627 ) ( not ( = ?auto_1180627 ?auto_1180626 ) ) ( not ( = ?auto_1180627 ?auto_1180628 ) ) ( not ( = ?auto_1180632 ?auto_1180634 ) ) ( HOIST-AT ?auto_1180633 ?auto_1180632 ) ( not ( = ?auto_1180629 ?auto_1180633 ) ) ( AVAILABLE ?auto_1180633 ) ( SURFACE-AT ?auto_1180628 ?auto_1180632 ) ( ON ?auto_1180628 ?auto_1180631 ) ( CLEAR ?auto_1180628 ) ( not ( = ?auto_1180626 ?auto_1180631 ) ) ( not ( = ?auto_1180628 ?auto_1180631 ) ) ( not ( = ?auto_1180627 ?auto_1180631 ) ) ( TRUCK-AT ?auto_1180630 ?auto_1180634 ) ( ON ?auto_1180623 ?auto_1180622 ) ( ON ?auto_1180624 ?auto_1180623 ) ( ON ?auto_1180621 ?auto_1180624 ) ( ON ?auto_1180625 ?auto_1180621 ) ( ON ?auto_1180627 ?auto_1180625 ) ( not ( = ?auto_1180622 ?auto_1180623 ) ) ( not ( = ?auto_1180622 ?auto_1180624 ) ) ( not ( = ?auto_1180622 ?auto_1180621 ) ) ( not ( = ?auto_1180622 ?auto_1180625 ) ) ( not ( = ?auto_1180622 ?auto_1180627 ) ) ( not ( = ?auto_1180622 ?auto_1180626 ) ) ( not ( = ?auto_1180622 ?auto_1180628 ) ) ( not ( = ?auto_1180622 ?auto_1180631 ) ) ( not ( = ?auto_1180623 ?auto_1180624 ) ) ( not ( = ?auto_1180623 ?auto_1180621 ) ) ( not ( = ?auto_1180623 ?auto_1180625 ) ) ( not ( = ?auto_1180623 ?auto_1180627 ) ) ( not ( = ?auto_1180623 ?auto_1180626 ) ) ( not ( = ?auto_1180623 ?auto_1180628 ) ) ( not ( = ?auto_1180623 ?auto_1180631 ) ) ( not ( = ?auto_1180624 ?auto_1180621 ) ) ( not ( = ?auto_1180624 ?auto_1180625 ) ) ( not ( = ?auto_1180624 ?auto_1180627 ) ) ( not ( = ?auto_1180624 ?auto_1180626 ) ) ( not ( = ?auto_1180624 ?auto_1180628 ) ) ( not ( = ?auto_1180624 ?auto_1180631 ) ) ( not ( = ?auto_1180621 ?auto_1180625 ) ) ( not ( = ?auto_1180621 ?auto_1180627 ) ) ( not ( = ?auto_1180621 ?auto_1180626 ) ) ( not ( = ?auto_1180621 ?auto_1180628 ) ) ( not ( = ?auto_1180621 ?auto_1180631 ) ) ( not ( = ?auto_1180625 ?auto_1180627 ) ) ( not ( = ?auto_1180625 ?auto_1180626 ) ) ( not ( = ?auto_1180625 ?auto_1180628 ) ) ( not ( = ?auto_1180625 ?auto_1180631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1180627 ?auto_1180626 ?auto_1180628 )
      ( MAKE-7CRATE-VERIFY ?auto_1180622 ?auto_1180623 ?auto_1180624 ?auto_1180621 ?auto_1180625 ?auto_1180627 ?auto_1180626 ?auto_1180628 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1180700 - SURFACE
      ?auto_1180701 - SURFACE
      ?auto_1180702 - SURFACE
      ?auto_1180699 - SURFACE
      ?auto_1180703 - SURFACE
      ?auto_1180705 - SURFACE
      ?auto_1180704 - SURFACE
      ?auto_1180706 - SURFACE
    )
    :vars
    (
      ?auto_1180708 - HOIST
      ?auto_1180709 - PLACE
      ?auto_1180710 - PLACE
      ?auto_1180711 - HOIST
      ?auto_1180707 - SURFACE
      ?auto_1180712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180708 ?auto_1180709 ) ( IS-CRATE ?auto_1180706 ) ( not ( = ?auto_1180704 ?auto_1180706 ) ) ( not ( = ?auto_1180705 ?auto_1180704 ) ) ( not ( = ?auto_1180705 ?auto_1180706 ) ) ( not ( = ?auto_1180710 ?auto_1180709 ) ) ( HOIST-AT ?auto_1180711 ?auto_1180710 ) ( not ( = ?auto_1180708 ?auto_1180711 ) ) ( AVAILABLE ?auto_1180711 ) ( SURFACE-AT ?auto_1180706 ?auto_1180710 ) ( ON ?auto_1180706 ?auto_1180707 ) ( CLEAR ?auto_1180706 ) ( not ( = ?auto_1180704 ?auto_1180707 ) ) ( not ( = ?auto_1180706 ?auto_1180707 ) ) ( not ( = ?auto_1180705 ?auto_1180707 ) ) ( TRUCK-AT ?auto_1180712 ?auto_1180709 ) ( SURFACE-AT ?auto_1180705 ?auto_1180709 ) ( CLEAR ?auto_1180705 ) ( LIFTING ?auto_1180708 ?auto_1180704 ) ( IS-CRATE ?auto_1180704 ) ( ON ?auto_1180701 ?auto_1180700 ) ( ON ?auto_1180702 ?auto_1180701 ) ( ON ?auto_1180699 ?auto_1180702 ) ( ON ?auto_1180703 ?auto_1180699 ) ( ON ?auto_1180705 ?auto_1180703 ) ( not ( = ?auto_1180700 ?auto_1180701 ) ) ( not ( = ?auto_1180700 ?auto_1180702 ) ) ( not ( = ?auto_1180700 ?auto_1180699 ) ) ( not ( = ?auto_1180700 ?auto_1180703 ) ) ( not ( = ?auto_1180700 ?auto_1180705 ) ) ( not ( = ?auto_1180700 ?auto_1180704 ) ) ( not ( = ?auto_1180700 ?auto_1180706 ) ) ( not ( = ?auto_1180700 ?auto_1180707 ) ) ( not ( = ?auto_1180701 ?auto_1180702 ) ) ( not ( = ?auto_1180701 ?auto_1180699 ) ) ( not ( = ?auto_1180701 ?auto_1180703 ) ) ( not ( = ?auto_1180701 ?auto_1180705 ) ) ( not ( = ?auto_1180701 ?auto_1180704 ) ) ( not ( = ?auto_1180701 ?auto_1180706 ) ) ( not ( = ?auto_1180701 ?auto_1180707 ) ) ( not ( = ?auto_1180702 ?auto_1180699 ) ) ( not ( = ?auto_1180702 ?auto_1180703 ) ) ( not ( = ?auto_1180702 ?auto_1180705 ) ) ( not ( = ?auto_1180702 ?auto_1180704 ) ) ( not ( = ?auto_1180702 ?auto_1180706 ) ) ( not ( = ?auto_1180702 ?auto_1180707 ) ) ( not ( = ?auto_1180699 ?auto_1180703 ) ) ( not ( = ?auto_1180699 ?auto_1180705 ) ) ( not ( = ?auto_1180699 ?auto_1180704 ) ) ( not ( = ?auto_1180699 ?auto_1180706 ) ) ( not ( = ?auto_1180699 ?auto_1180707 ) ) ( not ( = ?auto_1180703 ?auto_1180705 ) ) ( not ( = ?auto_1180703 ?auto_1180704 ) ) ( not ( = ?auto_1180703 ?auto_1180706 ) ) ( not ( = ?auto_1180703 ?auto_1180707 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1180705 ?auto_1180704 ?auto_1180706 )
      ( MAKE-7CRATE-VERIFY ?auto_1180700 ?auto_1180701 ?auto_1180702 ?auto_1180699 ?auto_1180703 ?auto_1180705 ?auto_1180704 ?auto_1180706 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1180778 - SURFACE
      ?auto_1180779 - SURFACE
      ?auto_1180780 - SURFACE
      ?auto_1180777 - SURFACE
      ?auto_1180781 - SURFACE
      ?auto_1180783 - SURFACE
      ?auto_1180782 - SURFACE
      ?auto_1180784 - SURFACE
    )
    :vars
    (
      ?auto_1180785 - HOIST
      ?auto_1180786 - PLACE
      ?auto_1180790 - PLACE
      ?auto_1180789 - HOIST
      ?auto_1180788 - SURFACE
      ?auto_1180787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180785 ?auto_1180786 ) ( IS-CRATE ?auto_1180784 ) ( not ( = ?auto_1180782 ?auto_1180784 ) ) ( not ( = ?auto_1180783 ?auto_1180782 ) ) ( not ( = ?auto_1180783 ?auto_1180784 ) ) ( not ( = ?auto_1180790 ?auto_1180786 ) ) ( HOIST-AT ?auto_1180789 ?auto_1180790 ) ( not ( = ?auto_1180785 ?auto_1180789 ) ) ( AVAILABLE ?auto_1180789 ) ( SURFACE-AT ?auto_1180784 ?auto_1180790 ) ( ON ?auto_1180784 ?auto_1180788 ) ( CLEAR ?auto_1180784 ) ( not ( = ?auto_1180782 ?auto_1180788 ) ) ( not ( = ?auto_1180784 ?auto_1180788 ) ) ( not ( = ?auto_1180783 ?auto_1180788 ) ) ( TRUCK-AT ?auto_1180787 ?auto_1180786 ) ( SURFACE-AT ?auto_1180783 ?auto_1180786 ) ( CLEAR ?auto_1180783 ) ( IS-CRATE ?auto_1180782 ) ( AVAILABLE ?auto_1180785 ) ( IN ?auto_1180782 ?auto_1180787 ) ( ON ?auto_1180779 ?auto_1180778 ) ( ON ?auto_1180780 ?auto_1180779 ) ( ON ?auto_1180777 ?auto_1180780 ) ( ON ?auto_1180781 ?auto_1180777 ) ( ON ?auto_1180783 ?auto_1180781 ) ( not ( = ?auto_1180778 ?auto_1180779 ) ) ( not ( = ?auto_1180778 ?auto_1180780 ) ) ( not ( = ?auto_1180778 ?auto_1180777 ) ) ( not ( = ?auto_1180778 ?auto_1180781 ) ) ( not ( = ?auto_1180778 ?auto_1180783 ) ) ( not ( = ?auto_1180778 ?auto_1180782 ) ) ( not ( = ?auto_1180778 ?auto_1180784 ) ) ( not ( = ?auto_1180778 ?auto_1180788 ) ) ( not ( = ?auto_1180779 ?auto_1180780 ) ) ( not ( = ?auto_1180779 ?auto_1180777 ) ) ( not ( = ?auto_1180779 ?auto_1180781 ) ) ( not ( = ?auto_1180779 ?auto_1180783 ) ) ( not ( = ?auto_1180779 ?auto_1180782 ) ) ( not ( = ?auto_1180779 ?auto_1180784 ) ) ( not ( = ?auto_1180779 ?auto_1180788 ) ) ( not ( = ?auto_1180780 ?auto_1180777 ) ) ( not ( = ?auto_1180780 ?auto_1180781 ) ) ( not ( = ?auto_1180780 ?auto_1180783 ) ) ( not ( = ?auto_1180780 ?auto_1180782 ) ) ( not ( = ?auto_1180780 ?auto_1180784 ) ) ( not ( = ?auto_1180780 ?auto_1180788 ) ) ( not ( = ?auto_1180777 ?auto_1180781 ) ) ( not ( = ?auto_1180777 ?auto_1180783 ) ) ( not ( = ?auto_1180777 ?auto_1180782 ) ) ( not ( = ?auto_1180777 ?auto_1180784 ) ) ( not ( = ?auto_1180777 ?auto_1180788 ) ) ( not ( = ?auto_1180781 ?auto_1180783 ) ) ( not ( = ?auto_1180781 ?auto_1180782 ) ) ( not ( = ?auto_1180781 ?auto_1180784 ) ) ( not ( = ?auto_1180781 ?auto_1180788 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1180783 ?auto_1180782 ?auto_1180784 )
      ( MAKE-7CRATE-VERIFY ?auto_1180778 ?auto_1180779 ?auto_1180780 ?auto_1180777 ?auto_1180781 ?auto_1180783 ?auto_1180782 ?auto_1180784 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1183348 - SURFACE
      ?auto_1183349 - SURFACE
    )
    :vars
    (
      ?auto_1183351 - HOIST
      ?auto_1183350 - PLACE
      ?auto_1183353 - SURFACE
      ?auto_1183356 - TRUCK
      ?auto_1183352 - PLACE
      ?auto_1183354 - HOIST
      ?auto_1183355 - SURFACE
      ?auto_1183357 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1183351 ?auto_1183350 ) ( SURFACE-AT ?auto_1183348 ?auto_1183350 ) ( CLEAR ?auto_1183348 ) ( IS-CRATE ?auto_1183349 ) ( not ( = ?auto_1183348 ?auto_1183349 ) ) ( AVAILABLE ?auto_1183351 ) ( ON ?auto_1183348 ?auto_1183353 ) ( not ( = ?auto_1183353 ?auto_1183348 ) ) ( not ( = ?auto_1183353 ?auto_1183349 ) ) ( TRUCK-AT ?auto_1183356 ?auto_1183352 ) ( not ( = ?auto_1183352 ?auto_1183350 ) ) ( HOIST-AT ?auto_1183354 ?auto_1183352 ) ( not ( = ?auto_1183351 ?auto_1183354 ) ) ( SURFACE-AT ?auto_1183349 ?auto_1183352 ) ( ON ?auto_1183349 ?auto_1183355 ) ( CLEAR ?auto_1183349 ) ( not ( = ?auto_1183348 ?auto_1183355 ) ) ( not ( = ?auto_1183349 ?auto_1183355 ) ) ( not ( = ?auto_1183353 ?auto_1183355 ) ) ( LIFTING ?auto_1183354 ?auto_1183357 ) ( IS-CRATE ?auto_1183357 ) ( not ( = ?auto_1183348 ?auto_1183357 ) ) ( not ( = ?auto_1183349 ?auto_1183357 ) ) ( not ( = ?auto_1183353 ?auto_1183357 ) ) ( not ( = ?auto_1183355 ?auto_1183357 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1183354 ?auto_1183357 ?auto_1183356 ?auto_1183352 )
      ( MAKE-1CRATE ?auto_1183348 ?auto_1183349 )
      ( MAKE-1CRATE-VERIFY ?auto_1183348 ?auto_1183349 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1183691 - SURFACE
      ?auto_1183692 - SURFACE
      ?auto_1183693 - SURFACE
      ?auto_1183690 - SURFACE
      ?auto_1183694 - SURFACE
      ?auto_1183696 - SURFACE
      ?auto_1183695 - SURFACE
      ?auto_1183697 - SURFACE
      ?auto_1183698 - SURFACE
    )
    :vars
    (
      ?auto_1183699 - HOIST
      ?auto_1183700 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1183699 ?auto_1183700 ) ( SURFACE-AT ?auto_1183697 ?auto_1183700 ) ( CLEAR ?auto_1183697 ) ( LIFTING ?auto_1183699 ?auto_1183698 ) ( IS-CRATE ?auto_1183698 ) ( not ( = ?auto_1183697 ?auto_1183698 ) ) ( ON ?auto_1183692 ?auto_1183691 ) ( ON ?auto_1183693 ?auto_1183692 ) ( ON ?auto_1183690 ?auto_1183693 ) ( ON ?auto_1183694 ?auto_1183690 ) ( ON ?auto_1183696 ?auto_1183694 ) ( ON ?auto_1183695 ?auto_1183696 ) ( ON ?auto_1183697 ?auto_1183695 ) ( not ( = ?auto_1183691 ?auto_1183692 ) ) ( not ( = ?auto_1183691 ?auto_1183693 ) ) ( not ( = ?auto_1183691 ?auto_1183690 ) ) ( not ( = ?auto_1183691 ?auto_1183694 ) ) ( not ( = ?auto_1183691 ?auto_1183696 ) ) ( not ( = ?auto_1183691 ?auto_1183695 ) ) ( not ( = ?auto_1183691 ?auto_1183697 ) ) ( not ( = ?auto_1183691 ?auto_1183698 ) ) ( not ( = ?auto_1183692 ?auto_1183693 ) ) ( not ( = ?auto_1183692 ?auto_1183690 ) ) ( not ( = ?auto_1183692 ?auto_1183694 ) ) ( not ( = ?auto_1183692 ?auto_1183696 ) ) ( not ( = ?auto_1183692 ?auto_1183695 ) ) ( not ( = ?auto_1183692 ?auto_1183697 ) ) ( not ( = ?auto_1183692 ?auto_1183698 ) ) ( not ( = ?auto_1183693 ?auto_1183690 ) ) ( not ( = ?auto_1183693 ?auto_1183694 ) ) ( not ( = ?auto_1183693 ?auto_1183696 ) ) ( not ( = ?auto_1183693 ?auto_1183695 ) ) ( not ( = ?auto_1183693 ?auto_1183697 ) ) ( not ( = ?auto_1183693 ?auto_1183698 ) ) ( not ( = ?auto_1183690 ?auto_1183694 ) ) ( not ( = ?auto_1183690 ?auto_1183696 ) ) ( not ( = ?auto_1183690 ?auto_1183695 ) ) ( not ( = ?auto_1183690 ?auto_1183697 ) ) ( not ( = ?auto_1183690 ?auto_1183698 ) ) ( not ( = ?auto_1183694 ?auto_1183696 ) ) ( not ( = ?auto_1183694 ?auto_1183695 ) ) ( not ( = ?auto_1183694 ?auto_1183697 ) ) ( not ( = ?auto_1183694 ?auto_1183698 ) ) ( not ( = ?auto_1183696 ?auto_1183695 ) ) ( not ( = ?auto_1183696 ?auto_1183697 ) ) ( not ( = ?auto_1183696 ?auto_1183698 ) ) ( not ( = ?auto_1183695 ?auto_1183697 ) ) ( not ( = ?auto_1183695 ?auto_1183698 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1183697 ?auto_1183698 )
      ( MAKE-8CRATE-VERIFY ?auto_1183691 ?auto_1183692 ?auto_1183693 ?auto_1183690 ?auto_1183694 ?auto_1183696 ?auto_1183695 ?auto_1183697 ?auto_1183698 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1183758 - SURFACE
      ?auto_1183759 - SURFACE
      ?auto_1183760 - SURFACE
      ?auto_1183757 - SURFACE
      ?auto_1183761 - SURFACE
      ?auto_1183763 - SURFACE
      ?auto_1183762 - SURFACE
      ?auto_1183764 - SURFACE
      ?auto_1183765 - SURFACE
    )
    :vars
    (
      ?auto_1183766 - HOIST
      ?auto_1183768 - PLACE
      ?auto_1183767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1183766 ?auto_1183768 ) ( SURFACE-AT ?auto_1183764 ?auto_1183768 ) ( CLEAR ?auto_1183764 ) ( IS-CRATE ?auto_1183765 ) ( not ( = ?auto_1183764 ?auto_1183765 ) ) ( TRUCK-AT ?auto_1183767 ?auto_1183768 ) ( AVAILABLE ?auto_1183766 ) ( IN ?auto_1183765 ?auto_1183767 ) ( ON ?auto_1183764 ?auto_1183762 ) ( not ( = ?auto_1183762 ?auto_1183764 ) ) ( not ( = ?auto_1183762 ?auto_1183765 ) ) ( ON ?auto_1183759 ?auto_1183758 ) ( ON ?auto_1183760 ?auto_1183759 ) ( ON ?auto_1183757 ?auto_1183760 ) ( ON ?auto_1183761 ?auto_1183757 ) ( ON ?auto_1183763 ?auto_1183761 ) ( ON ?auto_1183762 ?auto_1183763 ) ( not ( = ?auto_1183758 ?auto_1183759 ) ) ( not ( = ?auto_1183758 ?auto_1183760 ) ) ( not ( = ?auto_1183758 ?auto_1183757 ) ) ( not ( = ?auto_1183758 ?auto_1183761 ) ) ( not ( = ?auto_1183758 ?auto_1183763 ) ) ( not ( = ?auto_1183758 ?auto_1183762 ) ) ( not ( = ?auto_1183758 ?auto_1183764 ) ) ( not ( = ?auto_1183758 ?auto_1183765 ) ) ( not ( = ?auto_1183759 ?auto_1183760 ) ) ( not ( = ?auto_1183759 ?auto_1183757 ) ) ( not ( = ?auto_1183759 ?auto_1183761 ) ) ( not ( = ?auto_1183759 ?auto_1183763 ) ) ( not ( = ?auto_1183759 ?auto_1183762 ) ) ( not ( = ?auto_1183759 ?auto_1183764 ) ) ( not ( = ?auto_1183759 ?auto_1183765 ) ) ( not ( = ?auto_1183760 ?auto_1183757 ) ) ( not ( = ?auto_1183760 ?auto_1183761 ) ) ( not ( = ?auto_1183760 ?auto_1183763 ) ) ( not ( = ?auto_1183760 ?auto_1183762 ) ) ( not ( = ?auto_1183760 ?auto_1183764 ) ) ( not ( = ?auto_1183760 ?auto_1183765 ) ) ( not ( = ?auto_1183757 ?auto_1183761 ) ) ( not ( = ?auto_1183757 ?auto_1183763 ) ) ( not ( = ?auto_1183757 ?auto_1183762 ) ) ( not ( = ?auto_1183757 ?auto_1183764 ) ) ( not ( = ?auto_1183757 ?auto_1183765 ) ) ( not ( = ?auto_1183761 ?auto_1183763 ) ) ( not ( = ?auto_1183761 ?auto_1183762 ) ) ( not ( = ?auto_1183761 ?auto_1183764 ) ) ( not ( = ?auto_1183761 ?auto_1183765 ) ) ( not ( = ?auto_1183763 ?auto_1183762 ) ) ( not ( = ?auto_1183763 ?auto_1183764 ) ) ( not ( = ?auto_1183763 ?auto_1183765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1183762 ?auto_1183764 ?auto_1183765 )
      ( MAKE-8CRATE-VERIFY ?auto_1183758 ?auto_1183759 ?auto_1183760 ?auto_1183757 ?auto_1183761 ?auto_1183763 ?auto_1183762 ?auto_1183764 ?auto_1183765 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1183834 - SURFACE
      ?auto_1183835 - SURFACE
      ?auto_1183836 - SURFACE
      ?auto_1183833 - SURFACE
      ?auto_1183837 - SURFACE
      ?auto_1183839 - SURFACE
      ?auto_1183838 - SURFACE
      ?auto_1183840 - SURFACE
      ?auto_1183841 - SURFACE
    )
    :vars
    (
      ?auto_1183845 - HOIST
      ?auto_1183843 - PLACE
      ?auto_1183842 - TRUCK
      ?auto_1183844 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1183845 ?auto_1183843 ) ( SURFACE-AT ?auto_1183840 ?auto_1183843 ) ( CLEAR ?auto_1183840 ) ( IS-CRATE ?auto_1183841 ) ( not ( = ?auto_1183840 ?auto_1183841 ) ) ( AVAILABLE ?auto_1183845 ) ( IN ?auto_1183841 ?auto_1183842 ) ( ON ?auto_1183840 ?auto_1183838 ) ( not ( = ?auto_1183838 ?auto_1183840 ) ) ( not ( = ?auto_1183838 ?auto_1183841 ) ) ( TRUCK-AT ?auto_1183842 ?auto_1183844 ) ( not ( = ?auto_1183844 ?auto_1183843 ) ) ( ON ?auto_1183835 ?auto_1183834 ) ( ON ?auto_1183836 ?auto_1183835 ) ( ON ?auto_1183833 ?auto_1183836 ) ( ON ?auto_1183837 ?auto_1183833 ) ( ON ?auto_1183839 ?auto_1183837 ) ( ON ?auto_1183838 ?auto_1183839 ) ( not ( = ?auto_1183834 ?auto_1183835 ) ) ( not ( = ?auto_1183834 ?auto_1183836 ) ) ( not ( = ?auto_1183834 ?auto_1183833 ) ) ( not ( = ?auto_1183834 ?auto_1183837 ) ) ( not ( = ?auto_1183834 ?auto_1183839 ) ) ( not ( = ?auto_1183834 ?auto_1183838 ) ) ( not ( = ?auto_1183834 ?auto_1183840 ) ) ( not ( = ?auto_1183834 ?auto_1183841 ) ) ( not ( = ?auto_1183835 ?auto_1183836 ) ) ( not ( = ?auto_1183835 ?auto_1183833 ) ) ( not ( = ?auto_1183835 ?auto_1183837 ) ) ( not ( = ?auto_1183835 ?auto_1183839 ) ) ( not ( = ?auto_1183835 ?auto_1183838 ) ) ( not ( = ?auto_1183835 ?auto_1183840 ) ) ( not ( = ?auto_1183835 ?auto_1183841 ) ) ( not ( = ?auto_1183836 ?auto_1183833 ) ) ( not ( = ?auto_1183836 ?auto_1183837 ) ) ( not ( = ?auto_1183836 ?auto_1183839 ) ) ( not ( = ?auto_1183836 ?auto_1183838 ) ) ( not ( = ?auto_1183836 ?auto_1183840 ) ) ( not ( = ?auto_1183836 ?auto_1183841 ) ) ( not ( = ?auto_1183833 ?auto_1183837 ) ) ( not ( = ?auto_1183833 ?auto_1183839 ) ) ( not ( = ?auto_1183833 ?auto_1183838 ) ) ( not ( = ?auto_1183833 ?auto_1183840 ) ) ( not ( = ?auto_1183833 ?auto_1183841 ) ) ( not ( = ?auto_1183837 ?auto_1183839 ) ) ( not ( = ?auto_1183837 ?auto_1183838 ) ) ( not ( = ?auto_1183837 ?auto_1183840 ) ) ( not ( = ?auto_1183837 ?auto_1183841 ) ) ( not ( = ?auto_1183839 ?auto_1183838 ) ) ( not ( = ?auto_1183839 ?auto_1183840 ) ) ( not ( = ?auto_1183839 ?auto_1183841 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1183838 ?auto_1183840 ?auto_1183841 )
      ( MAKE-8CRATE-VERIFY ?auto_1183834 ?auto_1183835 ?auto_1183836 ?auto_1183833 ?auto_1183837 ?auto_1183839 ?auto_1183838 ?auto_1183840 ?auto_1183841 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1183918 - SURFACE
      ?auto_1183919 - SURFACE
      ?auto_1183920 - SURFACE
      ?auto_1183917 - SURFACE
      ?auto_1183921 - SURFACE
      ?auto_1183923 - SURFACE
      ?auto_1183922 - SURFACE
      ?auto_1183924 - SURFACE
      ?auto_1183925 - SURFACE
    )
    :vars
    (
      ?auto_1183927 - HOIST
      ?auto_1183926 - PLACE
      ?auto_1183928 - TRUCK
      ?auto_1183929 - PLACE
      ?auto_1183930 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1183927 ?auto_1183926 ) ( SURFACE-AT ?auto_1183924 ?auto_1183926 ) ( CLEAR ?auto_1183924 ) ( IS-CRATE ?auto_1183925 ) ( not ( = ?auto_1183924 ?auto_1183925 ) ) ( AVAILABLE ?auto_1183927 ) ( ON ?auto_1183924 ?auto_1183922 ) ( not ( = ?auto_1183922 ?auto_1183924 ) ) ( not ( = ?auto_1183922 ?auto_1183925 ) ) ( TRUCK-AT ?auto_1183928 ?auto_1183929 ) ( not ( = ?auto_1183929 ?auto_1183926 ) ) ( HOIST-AT ?auto_1183930 ?auto_1183929 ) ( LIFTING ?auto_1183930 ?auto_1183925 ) ( not ( = ?auto_1183927 ?auto_1183930 ) ) ( ON ?auto_1183919 ?auto_1183918 ) ( ON ?auto_1183920 ?auto_1183919 ) ( ON ?auto_1183917 ?auto_1183920 ) ( ON ?auto_1183921 ?auto_1183917 ) ( ON ?auto_1183923 ?auto_1183921 ) ( ON ?auto_1183922 ?auto_1183923 ) ( not ( = ?auto_1183918 ?auto_1183919 ) ) ( not ( = ?auto_1183918 ?auto_1183920 ) ) ( not ( = ?auto_1183918 ?auto_1183917 ) ) ( not ( = ?auto_1183918 ?auto_1183921 ) ) ( not ( = ?auto_1183918 ?auto_1183923 ) ) ( not ( = ?auto_1183918 ?auto_1183922 ) ) ( not ( = ?auto_1183918 ?auto_1183924 ) ) ( not ( = ?auto_1183918 ?auto_1183925 ) ) ( not ( = ?auto_1183919 ?auto_1183920 ) ) ( not ( = ?auto_1183919 ?auto_1183917 ) ) ( not ( = ?auto_1183919 ?auto_1183921 ) ) ( not ( = ?auto_1183919 ?auto_1183923 ) ) ( not ( = ?auto_1183919 ?auto_1183922 ) ) ( not ( = ?auto_1183919 ?auto_1183924 ) ) ( not ( = ?auto_1183919 ?auto_1183925 ) ) ( not ( = ?auto_1183920 ?auto_1183917 ) ) ( not ( = ?auto_1183920 ?auto_1183921 ) ) ( not ( = ?auto_1183920 ?auto_1183923 ) ) ( not ( = ?auto_1183920 ?auto_1183922 ) ) ( not ( = ?auto_1183920 ?auto_1183924 ) ) ( not ( = ?auto_1183920 ?auto_1183925 ) ) ( not ( = ?auto_1183917 ?auto_1183921 ) ) ( not ( = ?auto_1183917 ?auto_1183923 ) ) ( not ( = ?auto_1183917 ?auto_1183922 ) ) ( not ( = ?auto_1183917 ?auto_1183924 ) ) ( not ( = ?auto_1183917 ?auto_1183925 ) ) ( not ( = ?auto_1183921 ?auto_1183923 ) ) ( not ( = ?auto_1183921 ?auto_1183922 ) ) ( not ( = ?auto_1183921 ?auto_1183924 ) ) ( not ( = ?auto_1183921 ?auto_1183925 ) ) ( not ( = ?auto_1183923 ?auto_1183922 ) ) ( not ( = ?auto_1183923 ?auto_1183924 ) ) ( not ( = ?auto_1183923 ?auto_1183925 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1183922 ?auto_1183924 ?auto_1183925 )
      ( MAKE-8CRATE-VERIFY ?auto_1183918 ?auto_1183919 ?auto_1183920 ?auto_1183917 ?auto_1183921 ?auto_1183923 ?auto_1183922 ?auto_1183924 ?auto_1183925 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1184010 - SURFACE
      ?auto_1184011 - SURFACE
      ?auto_1184012 - SURFACE
      ?auto_1184009 - SURFACE
      ?auto_1184013 - SURFACE
      ?auto_1184015 - SURFACE
      ?auto_1184014 - SURFACE
      ?auto_1184016 - SURFACE
      ?auto_1184017 - SURFACE
    )
    :vars
    (
      ?auto_1184023 - HOIST
      ?auto_1184019 - PLACE
      ?auto_1184020 - TRUCK
      ?auto_1184022 - PLACE
      ?auto_1184021 - HOIST
      ?auto_1184018 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1184023 ?auto_1184019 ) ( SURFACE-AT ?auto_1184016 ?auto_1184019 ) ( CLEAR ?auto_1184016 ) ( IS-CRATE ?auto_1184017 ) ( not ( = ?auto_1184016 ?auto_1184017 ) ) ( AVAILABLE ?auto_1184023 ) ( ON ?auto_1184016 ?auto_1184014 ) ( not ( = ?auto_1184014 ?auto_1184016 ) ) ( not ( = ?auto_1184014 ?auto_1184017 ) ) ( TRUCK-AT ?auto_1184020 ?auto_1184022 ) ( not ( = ?auto_1184022 ?auto_1184019 ) ) ( HOIST-AT ?auto_1184021 ?auto_1184022 ) ( not ( = ?auto_1184023 ?auto_1184021 ) ) ( AVAILABLE ?auto_1184021 ) ( SURFACE-AT ?auto_1184017 ?auto_1184022 ) ( ON ?auto_1184017 ?auto_1184018 ) ( CLEAR ?auto_1184017 ) ( not ( = ?auto_1184016 ?auto_1184018 ) ) ( not ( = ?auto_1184017 ?auto_1184018 ) ) ( not ( = ?auto_1184014 ?auto_1184018 ) ) ( ON ?auto_1184011 ?auto_1184010 ) ( ON ?auto_1184012 ?auto_1184011 ) ( ON ?auto_1184009 ?auto_1184012 ) ( ON ?auto_1184013 ?auto_1184009 ) ( ON ?auto_1184015 ?auto_1184013 ) ( ON ?auto_1184014 ?auto_1184015 ) ( not ( = ?auto_1184010 ?auto_1184011 ) ) ( not ( = ?auto_1184010 ?auto_1184012 ) ) ( not ( = ?auto_1184010 ?auto_1184009 ) ) ( not ( = ?auto_1184010 ?auto_1184013 ) ) ( not ( = ?auto_1184010 ?auto_1184015 ) ) ( not ( = ?auto_1184010 ?auto_1184014 ) ) ( not ( = ?auto_1184010 ?auto_1184016 ) ) ( not ( = ?auto_1184010 ?auto_1184017 ) ) ( not ( = ?auto_1184010 ?auto_1184018 ) ) ( not ( = ?auto_1184011 ?auto_1184012 ) ) ( not ( = ?auto_1184011 ?auto_1184009 ) ) ( not ( = ?auto_1184011 ?auto_1184013 ) ) ( not ( = ?auto_1184011 ?auto_1184015 ) ) ( not ( = ?auto_1184011 ?auto_1184014 ) ) ( not ( = ?auto_1184011 ?auto_1184016 ) ) ( not ( = ?auto_1184011 ?auto_1184017 ) ) ( not ( = ?auto_1184011 ?auto_1184018 ) ) ( not ( = ?auto_1184012 ?auto_1184009 ) ) ( not ( = ?auto_1184012 ?auto_1184013 ) ) ( not ( = ?auto_1184012 ?auto_1184015 ) ) ( not ( = ?auto_1184012 ?auto_1184014 ) ) ( not ( = ?auto_1184012 ?auto_1184016 ) ) ( not ( = ?auto_1184012 ?auto_1184017 ) ) ( not ( = ?auto_1184012 ?auto_1184018 ) ) ( not ( = ?auto_1184009 ?auto_1184013 ) ) ( not ( = ?auto_1184009 ?auto_1184015 ) ) ( not ( = ?auto_1184009 ?auto_1184014 ) ) ( not ( = ?auto_1184009 ?auto_1184016 ) ) ( not ( = ?auto_1184009 ?auto_1184017 ) ) ( not ( = ?auto_1184009 ?auto_1184018 ) ) ( not ( = ?auto_1184013 ?auto_1184015 ) ) ( not ( = ?auto_1184013 ?auto_1184014 ) ) ( not ( = ?auto_1184013 ?auto_1184016 ) ) ( not ( = ?auto_1184013 ?auto_1184017 ) ) ( not ( = ?auto_1184013 ?auto_1184018 ) ) ( not ( = ?auto_1184015 ?auto_1184014 ) ) ( not ( = ?auto_1184015 ?auto_1184016 ) ) ( not ( = ?auto_1184015 ?auto_1184017 ) ) ( not ( = ?auto_1184015 ?auto_1184018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1184014 ?auto_1184016 ?auto_1184017 )
      ( MAKE-8CRATE-VERIFY ?auto_1184010 ?auto_1184011 ?auto_1184012 ?auto_1184009 ?auto_1184013 ?auto_1184015 ?auto_1184014 ?auto_1184016 ?auto_1184017 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1184103 - SURFACE
      ?auto_1184104 - SURFACE
      ?auto_1184105 - SURFACE
      ?auto_1184102 - SURFACE
      ?auto_1184106 - SURFACE
      ?auto_1184108 - SURFACE
      ?auto_1184107 - SURFACE
      ?auto_1184109 - SURFACE
      ?auto_1184110 - SURFACE
    )
    :vars
    (
      ?auto_1184111 - HOIST
      ?auto_1184116 - PLACE
      ?auto_1184113 - PLACE
      ?auto_1184114 - HOIST
      ?auto_1184112 - SURFACE
      ?auto_1184115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1184111 ?auto_1184116 ) ( SURFACE-AT ?auto_1184109 ?auto_1184116 ) ( CLEAR ?auto_1184109 ) ( IS-CRATE ?auto_1184110 ) ( not ( = ?auto_1184109 ?auto_1184110 ) ) ( AVAILABLE ?auto_1184111 ) ( ON ?auto_1184109 ?auto_1184107 ) ( not ( = ?auto_1184107 ?auto_1184109 ) ) ( not ( = ?auto_1184107 ?auto_1184110 ) ) ( not ( = ?auto_1184113 ?auto_1184116 ) ) ( HOIST-AT ?auto_1184114 ?auto_1184113 ) ( not ( = ?auto_1184111 ?auto_1184114 ) ) ( AVAILABLE ?auto_1184114 ) ( SURFACE-AT ?auto_1184110 ?auto_1184113 ) ( ON ?auto_1184110 ?auto_1184112 ) ( CLEAR ?auto_1184110 ) ( not ( = ?auto_1184109 ?auto_1184112 ) ) ( not ( = ?auto_1184110 ?auto_1184112 ) ) ( not ( = ?auto_1184107 ?auto_1184112 ) ) ( TRUCK-AT ?auto_1184115 ?auto_1184116 ) ( ON ?auto_1184104 ?auto_1184103 ) ( ON ?auto_1184105 ?auto_1184104 ) ( ON ?auto_1184102 ?auto_1184105 ) ( ON ?auto_1184106 ?auto_1184102 ) ( ON ?auto_1184108 ?auto_1184106 ) ( ON ?auto_1184107 ?auto_1184108 ) ( not ( = ?auto_1184103 ?auto_1184104 ) ) ( not ( = ?auto_1184103 ?auto_1184105 ) ) ( not ( = ?auto_1184103 ?auto_1184102 ) ) ( not ( = ?auto_1184103 ?auto_1184106 ) ) ( not ( = ?auto_1184103 ?auto_1184108 ) ) ( not ( = ?auto_1184103 ?auto_1184107 ) ) ( not ( = ?auto_1184103 ?auto_1184109 ) ) ( not ( = ?auto_1184103 ?auto_1184110 ) ) ( not ( = ?auto_1184103 ?auto_1184112 ) ) ( not ( = ?auto_1184104 ?auto_1184105 ) ) ( not ( = ?auto_1184104 ?auto_1184102 ) ) ( not ( = ?auto_1184104 ?auto_1184106 ) ) ( not ( = ?auto_1184104 ?auto_1184108 ) ) ( not ( = ?auto_1184104 ?auto_1184107 ) ) ( not ( = ?auto_1184104 ?auto_1184109 ) ) ( not ( = ?auto_1184104 ?auto_1184110 ) ) ( not ( = ?auto_1184104 ?auto_1184112 ) ) ( not ( = ?auto_1184105 ?auto_1184102 ) ) ( not ( = ?auto_1184105 ?auto_1184106 ) ) ( not ( = ?auto_1184105 ?auto_1184108 ) ) ( not ( = ?auto_1184105 ?auto_1184107 ) ) ( not ( = ?auto_1184105 ?auto_1184109 ) ) ( not ( = ?auto_1184105 ?auto_1184110 ) ) ( not ( = ?auto_1184105 ?auto_1184112 ) ) ( not ( = ?auto_1184102 ?auto_1184106 ) ) ( not ( = ?auto_1184102 ?auto_1184108 ) ) ( not ( = ?auto_1184102 ?auto_1184107 ) ) ( not ( = ?auto_1184102 ?auto_1184109 ) ) ( not ( = ?auto_1184102 ?auto_1184110 ) ) ( not ( = ?auto_1184102 ?auto_1184112 ) ) ( not ( = ?auto_1184106 ?auto_1184108 ) ) ( not ( = ?auto_1184106 ?auto_1184107 ) ) ( not ( = ?auto_1184106 ?auto_1184109 ) ) ( not ( = ?auto_1184106 ?auto_1184110 ) ) ( not ( = ?auto_1184106 ?auto_1184112 ) ) ( not ( = ?auto_1184108 ?auto_1184107 ) ) ( not ( = ?auto_1184108 ?auto_1184109 ) ) ( not ( = ?auto_1184108 ?auto_1184110 ) ) ( not ( = ?auto_1184108 ?auto_1184112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1184107 ?auto_1184109 ?auto_1184110 )
      ( MAKE-8CRATE-VERIFY ?auto_1184103 ?auto_1184104 ?auto_1184105 ?auto_1184102 ?auto_1184106 ?auto_1184108 ?auto_1184107 ?auto_1184109 ?auto_1184110 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1184196 - SURFACE
      ?auto_1184197 - SURFACE
      ?auto_1184198 - SURFACE
      ?auto_1184195 - SURFACE
      ?auto_1184199 - SURFACE
      ?auto_1184201 - SURFACE
      ?auto_1184200 - SURFACE
      ?auto_1184202 - SURFACE
      ?auto_1184203 - SURFACE
    )
    :vars
    (
      ?auto_1184204 - HOIST
      ?auto_1184207 - PLACE
      ?auto_1184206 - PLACE
      ?auto_1184209 - HOIST
      ?auto_1184205 - SURFACE
      ?auto_1184208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1184204 ?auto_1184207 ) ( IS-CRATE ?auto_1184203 ) ( not ( = ?auto_1184202 ?auto_1184203 ) ) ( not ( = ?auto_1184200 ?auto_1184202 ) ) ( not ( = ?auto_1184200 ?auto_1184203 ) ) ( not ( = ?auto_1184206 ?auto_1184207 ) ) ( HOIST-AT ?auto_1184209 ?auto_1184206 ) ( not ( = ?auto_1184204 ?auto_1184209 ) ) ( AVAILABLE ?auto_1184209 ) ( SURFACE-AT ?auto_1184203 ?auto_1184206 ) ( ON ?auto_1184203 ?auto_1184205 ) ( CLEAR ?auto_1184203 ) ( not ( = ?auto_1184202 ?auto_1184205 ) ) ( not ( = ?auto_1184203 ?auto_1184205 ) ) ( not ( = ?auto_1184200 ?auto_1184205 ) ) ( TRUCK-AT ?auto_1184208 ?auto_1184207 ) ( SURFACE-AT ?auto_1184200 ?auto_1184207 ) ( CLEAR ?auto_1184200 ) ( LIFTING ?auto_1184204 ?auto_1184202 ) ( IS-CRATE ?auto_1184202 ) ( ON ?auto_1184197 ?auto_1184196 ) ( ON ?auto_1184198 ?auto_1184197 ) ( ON ?auto_1184195 ?auto_1184198 ) ( ON ?auto_1184199 ?auto_1184195 ) ( ON ?auto_1184201 ?auto_1184199 ) ( ON ?auto_1184200 ?auto_1184201 ) ( not ( = ?auto_1184196 ?auto_1184197 ) ) ( not ( = ?auto_1184196 ?auto_1184198 ) ) ( not ( = ?auto_1184196 ?auto_1184195 ) ) ( not ( = ?auto_1184196 ?auto_1184199 ) ) ( not ( = ?auto_1184196 ?auto_1184201 ) ) ( not ( = ?auto_1184196 ?auto_1184200 ) ) ( not ( = ?auto_1184196 ?auto_1184202 ) ) ( not ( = ?auto_1184196 ?auto_1184203 ) ) ( not ( = ?auto_1184196 ?auto_1184205 ) ) ( not ( = ?auto_1184197 ?auto_1184198 ) ) ( not ( = ?auto_1184197 ?auto_1184195 ) ) ( not ( = ?auto_1184197 ?auto_1184199 ) ) ( not ( = ?auto_1184197 ?auto_1184201 ) ) ( not ( = ?auto_1184197 ?auto_1184200 ) ) ( not ( = ?auto_1184197 ?auto_1184202 ) ) ( not ( = ?auto_1184197 ?auto_1184203 ) ) ( not ( = ?auto_1184197 ?auto_1184205 ) ) ( not ( = ?auto_1184198 ?auto_1184195 ) ) ( not ( = ?auto_1184198 ?auto_1184199 ) ) ( not ( = ?auto_1184198 ?auto_1184201 ) ) ( not ( = ?auto_1184198 ?auto_1184200 ) ) ( not ( = ?auto_1184198 ?auto_1184202 ) ) ( not ( = ?auto_1184198 ?auto_1184203 ) ) ( not ( = ?auto_1184198 ?auto_1184205 ) ) ( not ( = ?auto_1184195 ?auto_1184199 ) ) ( not ( = ?auto_1184195 ?auto_1184201 ) ) ( not ( = ?auto_1184195 ?auto_1184200 ) ) ( not ( = ?auto_1184195 ?auto_1184202 ) ) ( not ( = ?auto_1184195 ?auto_1184203 ) ) ( not ( = ?auto_1184195 ?auto_1184205 ) ) ( not ( = ?auto_1184199 ?auto_1184201 ) ) ( not ( = ?auto_1184199 ?auto_1184200 ) ) ( not ( = ?auto_1184199 ?auto_1184202 ) ) ( not ( = ?auto_1184199 ?auto_1184203 ) ) ( not ( = ?auto_1184199 ?auto_1184205 ) ) ( not ( = ?auto_1184201 ?auto_1184200 ) ) ( not ( = ?auto_1184201 ?auto_1184202 ) ) ( not ( = ?auto_1184201 ?auto_1184203 ) ) ( not ( = ?auto_1184201 ?auto_1184205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1184200 ?auto_1184202 ?auto_1184203 )
      ( MAKE-8CRATE-VERIFY ?auto_1184196 ?auto_1184197 ?auto_1184198 ?auto_1184195 ?auto_1184199 ?auto_1184201 ?auto_1184200 ?auto_1184202 ?auto_1184203 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1184289 - SURFACE
      ?auto_1184290 - SURFACE
      ?auto_1184291 - SURFACE
      ?auto_1184288 - SURFACE
      ?auto_1184292 - SURFACE
      ?auto_1184294 - SURFACE
      ?auto_1184293 - SURFACE
      ?auto_1184295 - SURFACE
      ?auto_1184296 - SURFACE
    )
    :vars
    (
      ?auto_1184298 - HOIST
      ?auto_1184300 - PLACE
      ?auto_1184301 - PLACE
      ?auto_1184297 - HOIST
      ?auto_1184302 - SURFACE
      ?auto_1184299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1184298 ?auto_1184300 ) ( IS-CRATE ?auto_1184296 ) ( not ( = ?auto_1184295 ?auto_1184296 ) ) ( not ( = ?auto_1184293 ?auto_1184295 ) ) ( not ( = ?auto_1184293 ?auto_1184296 ) ) ( not ( = ?auto_1184301 ?auto_1184300 ) ) ( HOIST-AT ?auto_1184297 ?auto_1184301 ) ( not ( = ?auto_1184298 ?auto_1184297 ) ) ( AVAILABLE ?auto_1184297 ) ( SURFACE-AT ?auto_1184296 ?auto_1184301 ) ( ON ?auto_1184296 ?auto_1184302 ) ( CLEAR ?auto_1184296 ) ( not ( = ?auto_1184295 ?auto_1184302 ) ) ( not ( = ?auto_1184296 ?auto_1184302 ) ) ( not ( = ?auto_1184293 ?auto_1184302 ) ) ( TRUCK-AT ?auto_1184299 ?auto_1184300 ) ( SURFACE-AT ?auto_1184293 ?auto_1184300 ) ( CLEAR ?auto_1184293 ) ( IS-CRATE ?auto_1184295 ) ( AVAILABLE ?auto_1184298 ) ( IN ?auto_1184295 ?auto_1184299 ) ( ON ?auto_1184290 ?auto_1184289 ) ( ON ?auto_1184291 ?auto_1184290 ) ( ON ?auto_1184288 ?auto_1184291 ) ( ON ?auto_1184292 ?auto_1184288 ) ( ON ?auto_1184294 ?auto_1184292 ) ( ON ?auto_1184293 ?auto_1184294 ) ( not ( = ?auto_1184289 ?auto_1184290 ) ) ( not ( = ?auto_1184289 ?auto_1184291 ) ) ( not ( = ?auto_1184289 ?auto_1184288 ) ) ( not ( = ?auto_1184289 ?auto_1184292 ) ) ( not ( = ?auto_1184289 ?auto_1184294 ) ) ( not ( = ?auto_1184289 ?auto_1184293 ) ) ( not ( = ?auto_1184289 ?auto_1184295 ) ) ( not ( = ?auto_1184289 ?auto_1184296 ) ) ( not ( = ?auto_1184289 ?auto_1184302 ) ) ( not ( = ?auto_1184290 ?auto_1184291 ) ) ( not ( = ?auto_1184290 ?auto_1184288 ) ) ( not ( = ?auto_1184290 ?auto_1184292 ) ) ( not ( = ?auto_1184290 ?auto_1184294 ) ) ( not ( = ?auto_1184290 ?auto_1184293 ) ) ( not ( = ?auto_1184290 ?auto_1184295 ) ) ( not ( = ?auto_1184290 ?auto_1184296 ) ) ( not ( = ?auto_1184290 ?auto_1184302 ) ) ( not ( = ?auto_1184291 ?auto_1184288 ) ) ( not ( = ?auto_1184291 ?auto_1184292 ) ) ( not ( = ?auto_1184291 ?auto_1184294 ) ) ( not ( = ?auto_1184291 ?auto_1184293 ) ) ( not ( = ?auto_1184291 ?auto_1184295 ) ) ( not ( = ?auto_1184291 ?auto_1184296 ) ) ( not ( = ?auto_1184291 ?auto_1184302 ) ) ( not ( = ?auto_1184288 ?auto_1184292 ) ) ( not ( = ?auto_1184288 ?auto_1184294 ) ) ( not ( = ?auto_1184288 ?auto_1184293 ) ) ( not ( = ?auto_1184288 ?auto_1184295 ) ) ( not ( = ?auto_1184288 ?auto_1184296 ) ) ( not ( = ?auto_1184288 ?auto_1184302 ) ) ( not ( = ?auto_1184292 ?auto_1184294 ) ) ( not ( = ?auto_1184292 ?auto_1184293 ) ) ( not ( = ?auto_1184292 ?auto_1184295 ) ) ( not ( = ?auto_1184292 ?auto_1184296 ) ) ( not ( = ?auto_1184292 ?auto_1184302 ) ) ( not ( = ?auto_1184294 ?auto_1184293 ) ) ( not ( = ?auto_1184294 ?auto_1184295 ) ) ( not ( = ?auto_1184294 ?auto_1184296 ) ) ( not ( = ?auto_1184294 ?auto_1184302 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1184293 ?auto_1184295 ?auto_1184296 )
      ( MAKE-8CRATE-VERIFY ?auto_1184289 ?auto_1184290 ?auto_1184291 ?auto_1184288 ?auto_1184292 ?auto_1184294 ?auto_1184293 ?auto_1184295 ?auto_1184296 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1187983 - SURFACE
      ?auto_1187984 - SURFACE
    )
    :vars
    (
      ?auto_1187987 - HOIST
      ?auto_1187988 - PLACE
      ?auto_1187990 - SURFACE
      ?auto_1187986 - PLACE
      ?auto_1187991 - HOIST
      ?auto_1187989 - SURFACE
      ?auto_1187985 - TRUCK
      ?auto_1187992 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1187987 ?auto_1187988 ) ( SURFACE-AT ?auto_1187983 ?auto_1187988 ) ( CLEAR ?auto_1187983 ) ( IS-CRATE ?auto_1187984 ) ( not ( = ?auto_1187983 ?auto_1187984 ) ) ( ON ?auto_1187983 ?auto_1187990 ) ( not ( = ?auto_1187990 ?auto_1187983 ) ) ( not ( = ?auto_1187990 ?auto_1187984 ) ) ( not ( = ?auto_1187986 ?auto_1187988 ) ) ( HOIST-AT ?auto_1187991 ?auto_1187986 ) ( not ( = ?auto_1187987 ?auto_1187991 ) ) ( AVAILABLE ?auto_1187991 ) ( SURFACE-AT ?auto_1187984 ?auto_1187986 ) ( ON ?auto_1187984 ?auto_1187989 ) ( CLEAR ?auto_1187984 ) ( not ( = ?auto_1187983 ?auto_1187989 ) ) ( not ( = ?auto_1187984 ?auto_1187989 ) ) ( not ( = ?auto_1187990 ?auto_1187989 ) ) ( TRUCK-AT ?auto_1187985 ?auto_1187988 ) ( LIFTING ?auto_1187987 ?auto_1187992 ) ( IS-CRATE ?auto_1187992 ) ( not ( = ?auto_1187983 ?auto_1187992 ) ) ( not ( = ?auto_1187984 ?auto_1187992 ) ) ( not ( = ?auto_1187990 ?auto_1187992 ) ) ( not ( = ?auto_1187989 ?auto_1187992 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1187987 ?auto_1187992 ?auto_1187985 ?auto_1187988 )
      ( MAKE-1CRATE ?auto_1187983 ?auto_1187984 )
      ( MAKE-1CRATE-VERIFY ?auto_1187983 ?auto_1187984 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1188397 - SURFACE
      ?auto_1188398 - SURFACE
      ?auto_1188399 - SURFACE
      ?auto_1188396 - SURFACE
      ?auto_1188400 - SURFACE
      ?auto_1188402 - SURFACE
      ?auto_1188401 - SURFACE
      ?auto_1188403 - SURFACE
      ?auto_1188404 - SURFACE
      ?auto_1188405 - SURFACE
    )
    :vars
    (
      ?auto_1188406 - HOIST
      ?auto_1188407 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188406 ?auto_1188407 ) ( SURFACE-AT ?auto_1188404 ?auto_1188407 ) ( CLEAR ?auto_1188404 ) ( LIFTING ?auto_1188406 ?auto_1188405 ) ( IS-CRATE ?auto_1188405 ) ( not ( = ?auto_1188404 ?auto_1188405 ) ) ( ON ?auto_1188398 ?auto_1188397 ) ( ON ?auto_1188399 ?auto_1188398 ) ( ON ?auto_1188396 ?auto_1188399 ) ( ON ?auto_1188400 ?auto_1188396 ) ( ON ?auto_1188402 ?auto_1188400 ) ( ON ?auto_1188401 ?auto_1188402 ) ( ON ?auto_1188403 ?auto_1188401 ) ( ON ?auto_1188404 ?auto_1188403 ) ( not ( = ?auto_1188397 ?auto_1188398 ) ) ( not ( = ?auto_1188397 ?auto_1188399 ) ) ( not ( = ?auto_1188397 ?auto_1188396 ) ) ( not ( = ?auto_1188397 ?auto_1188400 ) ) ( not ( = ?auto_1188397 ?auto_1188402 ) ) ( not ( = ?auto_1188397 ?auto_1188401 ) ) ( not ( = ?auto_1188397 ?auto_1188403 ) ) ( not ( = ?auto_1188397 ?auto_1188404 ) ) ( not ( = ?auto_1188397 ?auto_1188405 ) ) ( not ( = ?auto_1188398 ?auto_1188399 ) ) ( not ( = ?auto_1188398 ?auto_1188396 ) ) ( not ( = ?auto_1188398 ?auto_1188400 ) ) ( not ( = ?auto_1188398 ?auto_1188402 ) ) ( not ( = ?auto_1188398 ?auto_1188401 ) ) ( not ( = ?auto_1188398 ?auto_1188403 ) ) ( not ( = ?auto_1188398 ?auto_1188404 ) ) ( not ( = ?auto_1188398 ?auto_1188405 ) ) ( not ( = ?auto_1188399 ?auto_1188396 ) ) ( not ( = ?auto_1188399 ?auto_1188400 ) ) ( not ( = ?auto_1188399 ?auto_1188402 ) ) ( not ( = ?auto_1188399 ?auto_1188401 ) ) ( not ( = ?auto_1188399 ?auto_1188403 ) ) ( not ( = ?auto_1188399 ?auto_1188404 ) ) ( not ( = ?auto_1188399 ?auto_1188405 ) ) ( not ( = ?auto_1188396 ?auto_1188400 ) ) ( not ( = ?auto_1188396 ?auto_1188402 ) ) ( not ( = ?auto_1188396 ?auto_1188401 ) ) ( not ( = ?auto_1188396 ?auto_1188403 ) ) ( not ( = ?auto_1188396 ?auto_1188404 ) ) ( not ( = ?auto_1188396 ?auto_1188405 ) ) ( not ( = ?auto_1188400 ?auto_1188402 ) ) ( not ( = ?auto_1188400 ?auto_1188401 ) ) ( not ( = ?auto_1188400 ?auto_1188403 ) ) ( not ( = ?auto_1188400 ?auto_1188404 ) ) ( not ( = ?auto_1188400 ?auto_1188405 ) ) ( not ( = ?auto_1188402 ?auto_1188401 ) ) ( not ( = ?auto_1188402 ?auto_1188403 ) ) ( not ( = ?auto_1188402 ?auto_1188404 ) ) ( not ( = ?auto_1188402 ?auto_1188405 ) ) ( not ( = ?auto_1188401 ?auto_1188403 ) ) ( not ( = ?auto_1188401 ?auto_1188404 ) ) ( not ( = ?auto_1188401 ?auto_1188405 ) ) ( not ( = ?auto_1188403 ?auto_1188404 ) ) ( not ( = ?auto_1188403 ?auto_1188405 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1188404 ?auto_1188405 )
      ( MAKE-9CRATE-VERIFY ?auto_1188397 ?auto_1188398 ?auto_1188399 ?auto_1188396 ?auto_1188400 ?auto_1188402 ?auto_1188401 ?auto_1188403 ?auto_1188404 ?auto_1188405 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1188477 - SURFACE
      ?auto_1188478 - SURFACE
      ?auto_1188479 - SURFACE
      ?auto_1188476 - SURFACE
      ?auto_1188480 - SURFACE
      ?auto_1188482 - SURFACE
      ?auto_1188481 - SURFACE
      ?auto_1188483 - SURFACE
      ?auto_1188484 - SURFACE
      ?auto_1188485 - SURFACE
    )
    :vars
    (
      ?auto_1188488 - HOIST
      ?auto_1188487 - PLACE
      ?auto_1188486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188488 ?auto_1188487 ) ( SURFACE-AT ?auto_1188484 ?auto_1188487 ) ( CLEAR ?auto_1188484 ) ( IS-CRATE ?auto_1188485 ) ( not ( = ?auto_1188484 ?auto_1188485 ) ) ( TRUCK-AT ?auto_1188486 ?auto_1188487 ) ( AVAILABLE ?auto_1188488 ) ( IN ?auto_1188485 ?auto_1188486 ) ( ON ?auto_1188484 ?auto_1188483 ) ( not ( = ?auto_1188483 ?auto_1188484 ) ) ( not ( = ?auto_1188483 ?auto_1188485 ) ) ( ON ?auto_1188478 ?auto_1188477 ) ( ON ?auto_1188479 ?auto_1188478 ) ( ON ?auto_1188476 ?auto_1188479 ) ( ON ?auto_1188480 ?auto_1188476 ) ( ON ?auto_1188482 ?auto_1188480 ) ( ON ?auto_1188481 ?auto_1188482 ) ( ON ?auto_1188483 ?auto_1188481 ) ( not ( = ?auto_1188477 ?auto_1188478 ) ) ( not ( = ?auto_1188477 ?auto_1188479 ) ) ( not ( = ?auto_1188477 ?auto_1188476 ) ) ( not ( = ?auto_1188477 ?auto_1188480 ) ) ( not ( = ?auto_1188477 ?auto_1188482 ) ) ( not ( = ?auto_1188477 ?auto_1188481 ) ) ( not ( = ?auto_1188477 ?auto_1188483 ) ) ( not ( = ?auto_1188477 ?auto_1188484 ) ) ( not ( = ?auto_1188477 ?auto_1188485 ) ) ( not ( = ?auto_1188478 ?auto_1188479 ) ) ( not ( = ?auto_1188478 ?auto_1188476 ) ) ( not ( = ?auto_1188478 ?auto_1188480 ) ) ( not ( = ?auto_1188478 ?auto_1188482 ) ) ( not ( = ?auto_1188478 ?auto_1188481 ) ) ( not ( = ?auto_1188478 ?auto_1188483 ) ) ( not ( = ?auto_1188478 ?auto_1188484 ) ) ( not ( = ?auto_1188478 ?auto_1188485 ) ) ( not ( = ?auto_1188479 ?auto_1188476 ) ) ( not ( = ?auto_1188479 ?auto_1188480 ) ) ( not ( = ?auto_1188479 ?auto_1188482 ) ) ( not ( = ?auto_1188479 ?auto_1188481 ) ) ( not ( = ?auto_1188479 ?auto_1188483 ) ) ( not ( = ?auto_1188479 ?auto_1188484 ) ) ( not ( = ?auto_1188479 ?auto_1188485 ) ) ( not ( = ?auto_1188476 ?auto_1188480 ) ) ( not ( = ?auto_1188476 ?auto_1188482 ) ) ( not ( = ?auto_1188476 ?auto_1188481 ) ) ( not ( = ?auto_1188476 ?auto_1188483 ) ) ( not ( = ?auto_1188476 ?auto_1188484 ) ) ( not ( = ?auto_1188476 ?auto_1188485 ) ) ( not ( = ?auto_1188480 ?auto_1188482 ) ) ( not ( = ?auto_1188480 ?auto_1188481 ) ) ( not ( = ?auto_1188480 ?auto_1188483 ) ) ( not ( = ?auto_1188480 ?auto_1188484 ) ) ( not ( = ?auto_1188480 ?auto_1188485 ) ) ( not ( = ?auto_1188482 ?auto_1188481 ) ) ( not ( = ?auto_1188482 ?auto_1188483 ) ) ( not ( = ?auto_1188482 ?auto_1188484 ) ) ( not ( = ?auto_1188482 ?auto_1188485 ) ) ( not ( = ?auto_1188481 ?auto_1188483 ) ) ( not ( = ?auto_1188481 ?auto_1188484 ) ) ( not ( = ?auto_1188481 ?auto_1188485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1188483 ?auto_1188484 ?auto_1188485 )
      ( MAKE-9CRATE-VERIFY ?auto_1188477 ?auto_1188478 ?auto_1188479 ?auto_1188476 ?auto_1188480 ?auto_1188482 ?auto_1188481 ?auto_1188483 ?auto_1188484 ?auto_1188485 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1188567 - SURFACE
      ?auto_1188568 - SURFACE
      ?auto_1188569 - SURFACE
      ?auto_1188566 - SURFACE
      ?auto_1188570 - SURFACE
      ?auto_1188572 - SURFACE
      ?auto_1188571 - SURFACE
      ?auto_1188573 - SURFACE
      ?auto_1188574 - SURFACE
      ?auto_1188575 - SURFACE
    )
    :vars
    (
      ?auto_1188577 - HOIST
      ?auto_1188578 - PLACE
      ?auto_1188576 - TRUCK
      ?auto_1188579 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188577 ?auto_1188578 ) ( SURFACE-AT ?auto_1188574 ?auto_1188578 ) ( CLEAR ?auto_1188574 ) ( IS-CRATE ?auto_1188575 ) ( not ( = ?auto_1188574 ?auto_1188575 ) ) ( AVAILABLE ?auto_1188577 ) ( IN ?auto_1188575 ?auto_1188576 ) ( ON ?auto_1188574 ?auto_1188573 ) ( not ( = ?auto_1188573 ?auto_1188574 ) ) ( not ( = ?auto_1188573 ?auto_1188575 ) ) ( TRUCK-AT ?auto_1188576 ?auto_1188579 ) ( not ( = ?auto_1188579 ?auto_1188578 ) ) ( ON ?auto_1188568 ?auto_1188567 ) ( ON ?auto_1188569 ?auto_1188568 ) ( ON ?auto_1188566 ?auto_1188569 ) ( ON ?auto_1188570 ?auto_1188566 ) ( ON ?auto_1188572 ?auto_1188570 ) ( ON ?auto_1188571 ?auto_1188572 ) ( ON ?auto_1188573 ?auto_1188571 ) ( not ( = ?auto_1188567 ?auto_1188568 ) ) ( not ( = ?auto_1188567 ?auto_1188569 ) ) ( not ( = ?auto_1188567 ?auto_1188566 ) ) ( not ( = ?auto_1188567 ?auto_1188570 ) ) ( not ( = ?auto_1188567 ?auto_1188572 ) ) ( not ( = ?auto_1188567 ?auto_1188571 ) ) ( not ( = ?auto_1188567 ?auto_1188573 ) ) ( not ( = ?auto_1188567 ?auto_1188574 ) ) ( not ( = ?auto_1188567 ?auto_1188575 ) ) ( not ( = ?auto_1188568 ?auto_1188569 ) ) ( not ( = ?auto_1188568 ?auto_1188566 ) ) ( not ( = ?auto_1188568 ?auto_1188570 ) ) ( not ( = ?auto_1188568 ?auto_1188572 ) ) ( not ( = ?auto_1188568 ?auto_1188571 ) ) ( not ( = ?auto_1188568 ?auto_1188573 ) ) ( not ( = ?auto_1188568 ?auto_1188574 ) ) ( not ( = ?auto_1188568 ?auto_1188575 ) ) ( not ( = ?auto_1188569 ?auto_1188566 ) ) ( not ( = ?auto_1188569 ?auto_1188570 ) ) ( not ( = ?auto_1188569 ?auto_1188572 ) ) ( not ( = ?auto_1188569 ?auto_1188571 ) ) ( not ( = ?auto_1188569 ?auto_1188573 ) ) ( not ( = ?auto_1188569 ?auto_1188574 ) ) ( not ( = ?auto_1188569 ?auto_1188575 ) ) ( not ( = ?auto_1188566 ?auto_1188570 ) ) ( not ( = ?auto_1188566 ?auto_1188572 ) ) ( not ( = ?auto_1188566 ?auto_1188571 ) ) ( not ( = ?auto_1188566 ?auto_1188573 ) ) ( not ( = ?auto_1188566 ?auto_1188574 ) ) ( not ( = ?auto_1188566 ?auto_1188575 ) ) ( not ( = ?auto_1188570 ?auto_1188572 ) ) ( not ( = ?auto_1188570 ?auto_1188571 ) ) ( not ( = ?auto_1188570 ?auto_1188573 ) ) ( not ( = ?auto_1188570 ?auto_1188574 ) ) ( not ( = ?auto_1188570 ?auto_1188575 ) ) ( not ( = ?auto_1188572 ?auto_1188571 ) ) ( not ( = ?auto_1188572 ?auto_1188573 ) ) ( not ( = ?auto_1188572 ?auto_1188574 ) ) ( not ( = ?auto_1188572 ?auto_1188575 ) ) ( not ( = ?auto_1188571 ?auto_1188573 ) ) ( not ( = ?auto_1188571 ?auto_1188574 ) ) ( not ( = ?auto_1188571 ?auto_1188575 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1188573 ?auto_1188574 ?auto_1188575 )
      ( MAKE-9CRATE-VERIFY ?auto_1188567 ?auto_1188568 ?auto_1188569 ?auto_1188566 ?auto_1188570 ?auto_1188572 ?auto_1188571 ?auto_1188573 ?auto_1188574 ?auto_1188575 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1188666 - SURFACE
      ?auto_1188667 - SURFACE
      ?auto_1188668 - SURFACE
      ?auto_1188665 - SURFACE
      ?auto_1188669 - SURFACE
      ?auto_1188671 - SURFACE
      ?auto_1188670 - SURFACE
      ?auto_1188672 - SURFACE
      ?auto_1188673 - SURFACE
      ?auto_1188674 - SURFACE
    )
    :vars
    (
      ?auto_1188675 - HOIST
      ?auto_1188676 - PLACE
      ?auto_1188677 - TRUCK
      ?auto_1188678 - PLACE
      ?auto_1188679 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188675 ?auto_1188676 ) ( SURFACE-AT ?auto_1188673 ?auto_1188676 ) ( CLEAR ?auto_1188673 ) ( IS-CRATE ?auto_1188674 ) ( not ( = ?auto_1188673 ?auto_1188674 ) ) ( AVAILABLE ?auto_1188675 ) ( ON ?auto_1188673 ?auto_1188672 ) ( not ( = ?auto_1188672 ?auto_1188673 ) ) ( not ( = ?auto_1188672 ?auto_1188674 ) ) ( TRUCK-AT ?auto_1188677 ?auto_1188678 ) ( not ( = ?auto_1188678 ?auto_1188676 ) ) ( HOIST-AT ?auto_1188679 ?auto_1188678 ) ( LIFTING ?auto_1188679 ?auto_1188674 ) ( not ( = ?auto_1188675 ?auto_1188679 ) ) ( ON ?auto_1188667 ?auto_1188666 ) ( ON ?auto_1188668 ?auto_1188667 ) ( ON ?auto_1188665 ?auto_1188668 ) ( ON ?auto_1188669 ?auto_1188665 ) ( ON ?auto_1188671 ?auto_1188669 ) ( ON ?auto_1188670 ?auto_1188671 ) ( ON ?auto_1188672 ?auto_1188670 ) ( not ( = ?auto_1188666 ?auto_1188667 ) ) ( not ( = ?auto_1188666 ?auto_1188668 ) ) ( not ( = ?auto_1188666 ?auto_1188665 ) ) ( not ( = ?auto_1188666 ?auto_1188669 ) ) ( not ( = ?auto_1188666 ?auto_1188671 ) ) ( not ( = ?auto_1188666 ?auto_1188670 ) ) ( not ( = ?auto_1188666 ?auto_1188672 ) ) ( not ( = ?auto_1188666 ?auto_1188673 ) ) ( not ( = ?auto_1188666 ?auto_1188674 ) ) ( not ( = ?auto_1188667 ?auto_1188668 ) ) ( not ( = ?auto_1188667 ?auto_1188665 ) ) ( not ( = ?auto_1188667 ?auto_1188669 ) ) ( not ( = ?auto_1188667 ?auto_1188671 ) ) ( not ( = ?auto_1188667 ?auto_1188670 ) ) ( not ( = ?auto_1188667 ?auto_1188672 ) ) ( not ( = ?auto_1188667 ?auto_1188673 ) ) ( not ( = ?auto_1188667 ?auto_1188674 ) ) ( not ( = ?auto_1188668 ?auto_1188665 ) ) ( not ( = ?auto_1188668 ?auto_1188669 ) ) ( not ( = ?auto_1188668 ?auto_1188671 ) ) ( not ( = ?auto_1188668 ?auto_1188670 ) ) ( not ( = ?auto_1188668 ?auto_1188672 ) ) ( not ( = ?auto_1188668 ?auto_1188673 ) ) ( not ( = ?auto_1188668 ?auto_1188674 ) ) ( not ( = ?auto_1188665 ?auto_1188669 ) ) ( not ( = ?auto_1188665 ?auto_1188671 ) ) ( not ( = ?auto_1188665 ?auto_1188670 ) ) ( not ( = ?auto_1188665 ?auto_1188672 ) ) ( not ( = ?auto_1188665 ?auto_1188673 ) ) ( not ( = ?auto_1188665 ?auto_1188674 ) ) ( not ( = ?auto_1188669 ?auto_1188671 ) ) ( not ( = ?auto_1188669 ?auto_1188670 ) ) ( not ( = ?auto_1188669 ?auto_1188672 ) ) ( not ( = ?auto_1188669 ?auto_1188673 ) ) ( not ( = ?auto_1188669 ?auto_1188674 ) ) ( not ( = ?auto_1188671 ?auto_1188670 ) ) ( not ( = ?auto_1188671 ?auto_1188672 ) ) ( not ( = ?auto_1188671 ?auto_1188673 ) ) ( not ( = ?auto_1188671 ?auto_1188674 ) ) ( not ( = ?auto_1188670 ?auto_1188672 ) ) ( not ( = ?auto_1188670 ?auto_1188673 ) ) ( not ( = ?auto_1188670 ?auto_1188674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1188672 ?auto_1188673 ?auto_1188674 )
      ( MAKE-9CRATE-VERIFY ?auto_1188666 ?auto_1188667 ?auto_1188668 ?auto_1188665 ?auto_1188669 ?auto_1188671 ?auto_1188670 ?auto_1188672 ?auto_1188673 ?auto_1188674 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1188774 - SURFACE
      ?auto_1188775 - SURFACE
      ?auto_1188776 - SURFACE
      ?auto_1188773 - SURFACE
      ?auto_1188777 - SURFACE
      ?auto_1188779 - SURFACE
      ?auto_1188778 - SURFACE
      ?auto_1188780 - SURFACE
      ?auto_1188781 - SURFACE
      ?auto_1188782 - SURFACE
    )
    :vars
    (
      ?auto_1188785 - HOIST
      ?auto_1188783 - PLACE
      ?auto_1188787 - TRUCK
      ?auto_1188788 - PLACE
      ?auto_1188786 - HOIST
      ?auto_1188784 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188785 ?auto_1188783 ) ( SURFACE-AT ?auto_1188781 ?auto_1188783 ) ( CLEAR ?auto_1188781 ) ( IS-CRATE ?auto_1188782 ) ( not ( = ?auto_1188781 ?auto_1188782 ) ) ( AVAILABLE ?auto_1188785 ) ( ON ?auto_1188781 ?auto_1188780 ) ( not ( = ?auto_1188780 ?auto_1188781 ) ) ( not ( = ?auto_1188780 ?auto_1188782 ) ) ( TRUCK-AT ?auto_1188787 ?auto_1188788 ) ( not ( = ?auto_1188788 ?auto_1188783 ) ) ( HOIST-AT ?auto_1188786 ?auto_1188788 ) ( not ( = ?auto_1188785 ?auto_1188786 ) ) ( AVAILABLE ?auto_1188786 ) ( SURFACE-AT ?auto_1188782 ?auto_1188788 ) ( ON ?auto_1188782 ?auto_1188784 ) ( CLEAR ?auto_1188782 ) ( not ( = ?auto_1188781 ?auto_1188784 ) ) ( not ( = ?auto_1188782 ?auto_1188784 ) ) ( not ( = ?auto_1188780 ?auto_1188784 ) ) ( ON ?auto_1188775 ?auto_1188774 ) ( ON ?auto_1188776 ?auto_1188775 ) ( ON ?auto_1188773 ?auto_1188776 ) ( ON ?auto_1188777 ?auto_1188773 ) ( ON ?auto_1188779 ?auto_1188777 ) ( ON ?auto_1188778 ?auto_1188779 ) ( ON ?auto_1188780 ?auto_1188778 ) ( not ( = ?auto_1188774 ?auto_1188775 ) ) ( not ( = ?auto_1188774 ?auto_1188776 ) ) ( not ( = ?auto_1188774 ?auto_1188773 ) ) ( not ( = ?auto_1188774 ?auto_1188777 ) ) ( not ( = ?auto_1188774 ?auto_1188779 ) ) ( not ( = ?auto_1188774 ?auto_1188778 ) ) ( not ( = ?auto_1188774 ?auto_1188780 ) ) ( not ( = ?auto_1188774 ?auto_1188781 ) ) ( not ( = ?auto_1188774 ?auto_1188782 ) ) ( not ( = ?auto_1188774 ?auto_1188784 ) ) ( not ( = ?auto_1188775 ?auto_1188776 ) ) ( not ( = ?auto_1188775 ?auto_1188773 ) ) ( not ( = ?auto_1188775 ?auto_1188777 ) ) ( not ( = ?auto_1188775 ?auto_1188779 ) ) ( not ( = ?auto_1188775 ?auto_1188778 ) ) ( not ( = ?auto_1188775 ?auto_1188780 ) ) ( not ( = ?auto_1188775 ?auto_1188781 ) ) ( not ( = ?auto_1188775 ?auto_1188782 ) ) ( not ( = ?auto_1188775 ?auto_1188784 ) ) ( not ( = ?auto_1188776 ?auto_1188773 ) ) ( not ( = ?auto_1188776 ?auto_1188777 ) ) ( not ( = ?auto_1188776 ?auto_1188779 ) ) ( not ( = ?auto_1188776 ?auto_1188778 ) ) ( not ( = ?auto_1188776 ?auto_1188780 ) ) ( not ( = ?auto_1188776 ?auto_1188781 ) ) ( not ( = ?auto_1188776 ?auto_1188782 ) ) ( not ( = ?auto_1188776 ?auto_1188784 ) ) ( not ( = ?auto_1188773 ?auto_1188777 ) ) ( not ( = ?auto_1188773 ?auto_1188779 ) ) ( not ( = ?auto_1188773 ?auto_1188778 ) ) ( not ( = ?auto_1188773 ?auto_1188780 ) ) ( not ( = ?auto_1188773 ?auto_1188781 ) ) ( not ( = ?auto_1188773 ?auto_1188782 ) ) ( not ( = ?auto_1188773 ?auto_1188784 ) ) ( not ( = ?auto_1188777 ?auto_1188779 ) ) ( not ( = ?auto_1188777 ?auto_1188778 ) ) ( not ( = ?auto_1188777 ?auto_1188780 ) ) ( not ( = ?auto_1188777 ?auto_1188781 ) ) ( not ( = ?auto_1188777 ?auto_1188782 ) ) ( not ( = ?auto_1188777 ?auto_1188784 ) ) ( not ( = ?auto_1188779 ?auto_1188778 ) ) ( not ( = ?auto_1188779 ?auto_1188780 ) ) ( not ( = ?auto_1188779 ?auto_1188781 ) ) ( not ( = ?auto_1188779 ?auto_1188782 ) ) ( not ( = ?auto_1188779 ?auto_1188784 ) ) ( not ( = ?auto_1188778 ?auto_1188780 ) ) ( not ( = ?auto_1188778 ?auto_1188781 ) ) ( not ( = ?auto_1188778 ?auto_1188782 ) ) ( not ( = ?auto_1188778 ?auto_1188784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1188780 ?auto_1188781 ?auto_1188782 )
      ( MAKE-9CRATE-VERIFY ?auto_1188774 ?auto_1188775 ?auto_1188776 ?auto_1188773 ?auto_1188777 ?auto_1188779 ?auto_1188778 ?auto_1188780 ?auto_1188781 ?auto_1188782 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1188883 - SURFACE
      ?auto_1188884 - SURFACE
      ?auto_1188885 - SURFACE
      ?auto_1188882 - SURFACE
      ?auto_1188886 - SURFACE
      ?auto_1188888 - SURFACE
      ?auto_1188887 - SURFACE
      ?auto_1188889 - SURFACE
      ?auto_1188890 - SURFACE
      ?auto_1188891 - SURFACE
    )
    :vars
    (
      ?auto_1188895 - HOIST
      ?auto_1188892 - PLACE
      ?auto_1188893 - PLACE
      ?auto_1188896 - HOIST
      ?auto_1188897 - SURFACE
      ?auto_1188894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188895 ?auto_1188892 ) ( SURFACE-AT ?auto_1188890 ?auto_1188892 ) ( CLEAR ?auto_1188890 ) ( IS-CRATE ?auto_1188891 ) ( not ( = ?auto_1188890 ?auto_1188891 ) ) ( AVAILABLE ?auto_1188895 ) ( ON ?auto_1188890 ?auto_1188889 ) ( not ( = ?auto_1188889 ?auto_1188890 ) ) ( not ( = ?auto_1188889 ?auto_1188891 ) ) ( not ( = ?auto_1188893 ?auto_1188892 ) ) ( HOIST-AT ?auto_1188896 ?auto_1188893 ) ( not ( = ?auto_1188895 ?auto_1188896 ) ) ( AVAILABLE ?auto_1188896 ) ( SURFACE-AT ?auto_1188891 ?auto_1188893 ) ( ON ?auto_1188891 ?auto_1188897 ) ( CLEAR ?auto_1188891 ) ( not ( = ?auto_1188890 ?auto_1188897 ) ) ( not ( = ?auto_1188891 ?auto_1188897 ) ) ( not ( = ?auto_1188889 ?auto_1188897 ) ) ( TRUCK-AT ?auto_1188894 ?auto_1188892 ) ( ON ?auto_1188884 ?auto_1188883 ) ( ON ?auto_1188885 ?auto_1188884 ) ( ON ?auto_1188882 ?auto_1188885 ) ( ON ?auto_1188886 ?auto_1188882 ) ( ON ?auto_1188888 ?auto_1188886 ) ( ON ?auto_1188887 ?auto_1188888 ) ( ON ?auto_1188889 ?auto_1188887 ) ( not ( = ?auto_1188883 ?auto_1188884 ) ) ( not ( = ?auto_1188883 ?auto_1188885 ) ) ( not ( = ?auto_1188883 ?auto_1188882 ) ) ( not ( = ?auto_1188883 ?auto_1188886 ) ) ( not ( = ?auto_1188883 ?auto_1188888 ) ) ( not ( = ?auto_1188883 ?auto_1188887 ) ) ( not ( = ?auto_1188883 ?auto_1188889 ) ) ( not ( = ?auto_1188883 ?auto_1188890 ) ) ( not ( = ?auto_1188883 ?auto_1188891 ) ) ( not ( = ?auto_1188883 ?auto_1188897 ) ) ( not ( = ?auto_1188884 ?auto_1188885 ) ) ( not ( = ?auto_1188884 ?auto_1188882 ) ) ( not ( = ?auto_1188884 ?auto_1188886 ) ) ( not ( = ?auto_1188884 ?auto_1188888 ) ) ( not ( = ?auto_1188884 ?auto_1188887 ) ) ( not ( = ?auto_1188884 ?auto_1188889 ) ) ( not ( = ?auto_1188884 ?auto_1188890 ) ) ( not ( = ?auto_1188884 ?auto_1188891 ) ) ( not ( = ?auto_1188884 ?auto_1188897 ) ) ( not ( = ?auto_1188885 ?auto_1188882 ) ) ( not ( = ?auto_1188885 ?auto_1188886 ) ) ( not ( = ?auto_1188885 ?auto_1188888 ) ) ( not ( = ?auto_1188885 ?auto_1188887 ) ) ( not ( = ?auto_1188885 ?auto_1188889 ) ) ( not ( = ?auto_1188885 ?auto_1188890 ) ) ( not ( = ?auto_1188885 ?auto_1188891 ) ) ( not ( = ?auto_1188885 ?auto_1188897 ) ) ( not ( = ?auto_1188882 ?auto_1188886 ) ) ( not ( = ?auto_1188882 ?auto_1188888 ) ) ( not ( = ?auto_1188882 ?auto_1188887 ) ) ( not ( = ?auto_1188882 ?auto_1188889 ) ) ( not ( = ?auto_1188882 ?auto_1188890 ) ) ( not ( = ?auto_1188882 ?auto_1188891 ) ) ( not ( = ?auto_1188882 ?auto_1188897 ) ) ( not ( = ?auto_1188886 ?auto_1188888 ) ) ( not ( = ?auto_1188886 ?auto_1188887 ) ) ( not ( = ?auto_1188886 ?auto_1188889 ) ) ( not ( = ?auto_1188886 ?auto_1188890 ) ) ( not ( = ?auto_1188886 ?auto_1188891 ) ) ( not ( = ?auto_1188886 ?auto_1188897 ) ) ( not ( = ?auto_1188888 ?auto_1188887 ) ) ( not ( = ?auto_1188888 ?auto_1188889 ) ) ( not ( = ?auto_1188888 ?auto_1188890 ) ) ( not ( = ?auto_1188888 ?auto_1188891 ) ) ( not ( = ?auto_1188888 ?auto_1188897 ) ) ( not ( = ?auto_1188887 ?auto_1188889 ) ) ( not ( = ?auto_1188887 ?auto_1188890 ) ) ( not ( = ?auto_1188887 ?auto_1188891 ) ) ( not ( = ?auto_1188887 ?auto_1188897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1188889 ?auto_1188890 ?auto_1188891 )
      ( MAKE-9CRATE-VERIFY ?auto_1188883 ?auto_1188884 ?auto_1188885 ?auto_1188882 ?auto_1188886 ?auto_1188888 ?auto_1188887 ?auto_1188889 ?auto_1188890 ?auto_1188891 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1188992 - SURFACE
      ?auto_1188993 - SURFACE
      ?auto_1188994 - SURFACE
      ?auto_1188991 - SURFACE
      ?auto_1188995 - SURFACE
      ?auto_1188997 - SURFACE
      ?auto_1188996 - SURFACE
      ?auto_1188998 - SURFACE
      ?auto_1188999 - SURFACE
      ?auto_1189000 - SURFACE
    )
    :vars
    (
      ?auto_1189004 - HOIST
      ?auto_1189001 - PLACE
      ?auto_1189003 - PLACE
      ?auto_1189006 - HOIST
      ?auto_1189002 - SURFACE
      ?auto_1189005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1189004 ?auto_1189001 ) ( IS-CRATE ?auto_1189000 ) ( not ( = ?auto_1188999 ?auto_1189000 ) ) ( not ( = ?auto_1188998 ?auto_1188999 ) ) ( not ( = ?auto_1188998 ?auto_1189000 ) ) ( not ( = ?auto_1189003 ?auto_1189001 ) ) ( HOIST-AT ?auto_1189006 ?auto_1189003 ) ( not ( = ?auto_1189004 ?auto_1189006 ) ) ( AVAILABLE ?auto_1189006 ) ( SURFACE-AT ?auto_1189000 ?auto_1189003 ) ( ON ?auto_1189000 ?auto_1189002 ) ( CLEAR ?auto_1189000 ) ( not ( = ?auto_1188999 ?auto_1189002 ) ) ( not ( = ?auto_1189000 ?auto_1189002 ) ) ( not ( = ?auto_1188998 ?auto_1189002 ) ) ( TRUCK-AT ?auto_1189005 ?auto_1189001 ) ( SURFACE-AT ?auto_1188998 ?auto_1189001 ) ( CLEAR ?auto_1188998 ) ( LIFTING ?auto_1189004 ?auto_1188999 ) ( IS-CRATE ?auto_1188999 ) ( ON ?auto_1188993 ?auto_1188992 ) ( ON ?auto_1188994 ?auto_1188993 ) ( ON ?auto_1188991 ?auto_1188994 ) ( ON ?auto_1188995 ?auto_1188991 ) ( ON ?auto_1188997 ?auto_1188995 ) ( ON ?auto_1188996 ?auto_1188997 ) ( ON ?auto_1188998 ?auto_1188996 ) ( not ( = ?auto_1188992 ?auto_1188993 ) ) ( not ( = ?auto_1188992 ?auto_1188994 ) ) ( not ( = ?auto_1188992 ?auto_1188991 ) ) ( not ( = ?auto_1188992 ?auto_1188995 ) ) ( not ( = ?auto_1188992 ?auto_1188997 ) ) ( not ( = ?auto_1188992 ?auto_1188996 ) ) ( not ( = ?auto_1188992 ?auto_1188998 ) ) ( not ( = ?auto_1188992 ?auto_1188999 ) ) ( not ( = ?auto_1188992 ?auto_1189000 ) ) ( not ( = ?auto_1188992 ?auto_1189002 ) ) ( not ( = ?auto_1188993 ?auto_1188994 ) ) ( not ( = ?auto_1188993 ?auto_1188991 ) ) ( not ( = ?auto_1188993 ?auto_1188995 ) ) ( not ( = ?auto_1188993 ?auto_1188997 ) ) ( not ( = ?auto_1188993 ?auto_1188996 ) ) ( not ( = ?auto_1188993 ?auto_1188998 ) ) ( not ( = ?auto_1188993 ?auto_1188999 ) ) ( not ( = ?auto_1188993 ?auto_1189000 ) ) ( not ( = ?auto_1188993 ?auto_1189002 ) ) ( not ( = ?auto_1188994 ?auto_1188991 ) ) ( not ( = ?auto_1188994 ?auto_1188995 ) ) ( not ( = ?auto_1188994 ?auto_1188997 ) ) ( not ( = ?auto_1188994 ?auto_1188996 ) ) ( not ( = ?auto_1188994 ?auto_1188998 ) ) ( not ( = ?auto_1188994 ?auto_1188999 ) ) ( not ( = ?auto_1188994 ?auto_1189000 ) ) ( not ( = ?auto_1188994 ?auto_1189002 ) ) ( not ( = ?auto_1188991 ?auto_1188995 ) ) ( not ( = ?auto_1188991 ?auto_1188997 ) ) ( not ( = ?auto_1188991 ?auto_1188996 ) ) ( not ( = ?auto_1188991 ?auto_1188998 ) ) ( not ( = ?auto_1188991 ?auto_1188999 ) ) ( not ( = ?auto_1188991 ?auto_1189000 ) ) ( not ( = ?auto_1188991 ?auto_1189002 ) ) ( not ( = ?auto_1188995 ?auto_1188997 ) ) ( not ( = ?auto_1188995 ?auto_1188996 ) ) ( not ( = ?auto_1188995 ?auto_1188998 ) ) ( not ( = ?auto_1188995 ?auto_1188999 ) ) ( not ( = ?auto_1188995 ?auto_1189000 ) ) ( not ( = ?auto_1188995 ?auto_1189002 ) ) ( not ( = ?auto_1188997 ?auto_1188996 ) ) ( not ( = ?auto_1188997 ?auto_1188998 ) ) ( not ( = ?auto_1188997 ?auto_1188999 ) ) ( not ( = ?auto_1188997 ?auto_1189000 ) ) ( not ( = ?auto_1188997 ?auto_1189002 ) ) ( not ( = ?auto_1188996 ?auto_1188998 ) ) ( not ( = ?auto_1188996 ?auto_1188999 ) ) ( not ( = ?auto_1188996 ?auto_1189000 ) ) ( not ( = ?auto_1188996 ?auto_1189002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1188998 ?auto_1188999 ?auto_1189000 )
      ( MAKE-9CRATE-VERIFY ?auto_1188992 ?auto_1188993 ?auto_1188994 ?auto_1188991 ?auto_1188995 ?auto_1188997 ?auto_1188996 ?auto_1188998 ?auto_1188999 ?auto_1189000 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1189101 - SURFACE
      ?auto_1189102 - SURFACE
      ?auto_1189103 - SURFACE
      ?auto_1189100 - SURFACE
      ?auto_1189104 - SURFACE
      ?auto_1189106 - SURFACE
      ?auto_1189105 - SURFACE
      ?auto_1189107 - SURFACE
      ?auto_1189108 - SURFACE
      ?auto_1189109 - SURFACE
    )
    :vars
    (
      ?auto_1189114 - HOIST
      ?auto_1189113 - PLACE
      ?auto_1189112 - PLACE
      ?auto_1189110 - HOIST
      ?auto_1189111 - SURFACE
      ?auto_1189115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1189114 ?auto_1189113 ) ( IS-CRATE ?auto_1189109 ) ( not ( = ?auto_1189108 ?auto_1189109 ) ) ( not ( = ?auto_1189107 ?auto_1189108 ) ) ( not ( = ?auto_1189107 ?auto_1189109 ) ) ( not ( = ?auto_1189112 ?auto_1189113 ) ) ( HOIST-AT ?auto_1189110 ?auto_1189112 ) ( not ( = ?auto_1189114 ?auto_1189110 ) ) ( AVAILABLE ?auto_1189110 ) ( SURFACE-AT ?auto_1189109 ?auto_1189112 ) ( ON ?auto_1189109 ?auto_1189111 ) ( CLEAR ?auto_1189109 ) ( not ( = ?auto_1189108 ?auto_1189111 ) ) ( not ( = ?auto_1189109 ?auto_1189111 ) ) ( not ( = ?auto_1189107 ?auto_1189111 ) ) ( TRUCK-AT ?auto_1189115 ?auto_1189113 ) ( SURFACE-AT ?auto_1189107 ?auto_1189113 ) ( CLEAR ?auto_1189107 ) ( IS-CRATE ?auto_1189108 ) ( AVAILABLE ?auto_1189114 ) ( IN ?auto_1189108 ?auto_1189115 ) ( ON ?auto_1189102 ?auto_1189101 ) ( ON ?auto_1189103 ?auto_1189102 ) ( ON ?auto_1189100 ?auto_1189103 ) ( ON ?auto_1189104 ?auto_1189100 ) ( ON ?auto_1189106 ?auto_1189104 ) ( ON ?auto_1189105 ?auto_1189106 ) ( ON ?auto_1189107 ?auto_1189105 ) ( not ( = ?auto_1189101 ?auto_1189102 ) ) ( not ( = ?auto_1189101 ?auto_1189103 ) ) ( not ( = ?auto_1189101 ?auto_1189100 ) ) ( not ( = ?auto_1189101 ?auto_1189104 ) ) ( not ( = ?auto_1189101 ?auto_1189106 ) ) ( not ( = ?auto_1189101 ?auto_1189105 ) ) ( not ( = ?auto_1189101 ?auto_1189107 ) ) ( not ( = ?auto_1189101 ?auto_1189108 ) ) ( not ( = ?auto_1189101 ?auto_1189109 ) ) ( not ( = ?auto_1189101 ?auto_1189111 ) ) ( not ( = ?auto_1189102 ?auto_1189103 ) ) ( not ( = ?auto_1189102 ?auto_1189100 ) ) ( not ( = ?auto_1189102 ?auto_1189104 ) ) ( not ( = ?auto_1189102 ?auto_1189106 ) ) ( not ( = ?auto_1189102 ?auto_1189105 ) ) ( not ( = ?auto_1189102 ?auto_1189107 ) ) ( not ( = ?auto_1189102 ?auto_1189108 ) ) ( not ( = ?auto_1189102 ?auto_1189109 ) ) ( not ( = ?auto_1189102 ?auto_1189111 ) ) ( not ( = ?auto_1189103 ?auto_1189100 ) ) ( not ( = ?auto_1189103 ?auto_1189104 ) ) ( not ( = ?auto_1189103 ?auto_1189106 ) ) ( not ( = ?auto_1189103 ?auto_1189105 ) ) ( not ( = ?auto_1189103 ?auto_1189107 ) ) ( not ( = ?auto_1189103 ?auto_1189108 ) ) ( not ( = ?auto_1189103 ?auto_1189109 ) ) ( not ( = ?auto_1189103 ?auto_1189111 ) ) ( not ( = ?auto_1189100 ?auto_1189104 ) ) ( not ( = ?auto_1189100 ?auto_1189106 ) ) ( not ( = ?auto_1189100 ?auto_1189105 ) ) ( not ( = ?auto_1189100 ?auto_1189107 ) ) ( not ( = ?auto_1189100 ?auto_1189108 ) ) ( not ( = ?auto_1189100 ?auto_1189109 ) ) ( not ( = ?auto_1189100 ?auto_1189111 ) ) ( not ( = ?auto_1189104 ?auto_1189106 ) ) ( not ( = ?auto_1189104 ?auto_1189105 ) ) ( not ( = ?auto_1189104 ?auto_1189107 ) ) ( not ( = ?auto_1189104 ?auto_1189108 ) ) ( not ( = ?auto_1189104 ?auto_1189109 ) ) ( not ( = ?auto_1189104 ?auto_1189111 ) ) ( not ( = ?auto_1189106 ?auto_1189105 ) ) ( not ( = ?auto_1189106 ?auto_1189107 ) ) ( not ( = ?auto_1189106 ?auto_1189108 ) ) ( not ( = ?auto_1189106 ?auto_1189109 ) ) ( not ( = ?auto_1189106 ?auto_1189111 ) ) ( not ( = ?auto_1189105 ?auto_1189107 ) ) ( not ( = ?auto_1189105 ?auto_1189108 ) ) ( not ( = ?auto_1189105 ?auto_1189109 ) ) ( not ( = ?auto_1189105 ?auto_1189111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1189107 ?auto_1189108 ?auto_1189109 )
      ( MAKE-9CRATE-VERIFY ?auto_1189101 ?auto_1189102 ?auto_1189103 ?auto_1189100 ?auto_1189104 ?auto_1189106 ?auto_1189105 ?auto_1189107 ?auto_1189108 ?auto_1189109 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1194654 - SURFACE
      ?auto_1194655 - SURFACE
      ?auto_1194656 - SURFACE
      ?auto_1194653 - SURFACE
      ?auto_1194657 - SURFACE
      ?auto_1194659 - SURFACE
      ?auto_1194658 - SURFACE
      ?auto_1194660 - SURFACE
      ?auto_1194661 - SURFACE
      ?auto_1194662 - SURFACE
      ?auto_1194663 - SURFACE
    )
    :vars
    (
      ?auto_1194664 - HOIST
      ?auto_1194665 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194664 ?auto_1194665 ) ( SURFACE-AT ?auto_1194662 ?auto_1194665 ) ( CLEAR ?auto_1194662 ) ( LIFTING ?auto_1194664 ?auto_1194663 ) ( IS-CRATE ?auto_1194663 ) ( not ( = ?auto_1194662 ?auto_1194663 ) ) ( ON ?auto_1194655 ?auto_1194654 ) ( ON ?auto_1194656 ?auto_1194655 ) ( ON ?auto_1194653 ?auto_1194656 ) ( ON ?auto_1194657 ?auto_1194653 ) ( ON ?auto_1194659 ?auto_1194657 ) ( ON ?auto_1194658 ?auto_1194659 ) ( ON ?auto_1194660 ?auto_1194658 ) ( ON ?auto_1194661 ?auto_1194660 ) ( ON ?auto_1194662 ?auto_1194661 ) ( not ( = ?auto_1194654 ?auto_1194655 ) ) ( not ( = ?auto_1194654 ?auto_1194656 ) ) ( not ( = ?auto_1194654 ?auto_1194653 ) ) ( not ( = ?auto_1194654 ?auto_1194657 ) ) ( not ( = ?auto_1194654 ?auto_1194659 ) ) ( not ( = ?auto_1194654 ?auto_1194658 ) ) ( not ( = ?auto_1194654 ?auto_1194660 ) ) ( not ( = ?auto_1194654 ?auto_1194661 ) ) ( not ( = ?auto_1194654 ?auto_1194662 ) ) ( not ( = ?auto_1194654 ?auto_1194663 ) ) ( not ( = ?auto_1194655 ?auto_1194656 ) ) ( not ( = ?auto_1194655 ?auto_1194653 ) ) ( not ( = ?auto_1194655 ?auto_1194657 ) ) ( not ( = ?auto_1194655 ?auto_1194659 ) ) ( not ( = ?auto_1194655 ?auto_1194658 ) ) ( not ( = ?auto_1194655 ?auto_1194660 ) ) ( not ( = ?auto_1194655 ?auto_1194661 ) ) ( not ( = ?auto_1194655 ?auto_1194662 ) ) ( not ( = ?auto_1194655 ?auto_1194663 ) ) ( not ( = ?auto_1194656 ?auto_1194653 ) ) ( not ( = ?auto_1194656 ?auto_1194657 ) ) ( not ( = ?auto_1194656 ?auto_1194659 ) ) ( not ( = ?auto_1194656 ?auto_1194658 ) ) ( not ( = ?auto_1194656 ?auto_1194660 ) ) ( not ( = ?auto_1194656 ?auto_1194661 ) ) ( not ( = ?auto_1194656 ?auto_1194662 ) ) ( not ( = ?auto_1194656 ?auto_1194663 ) ) ( not ( = ?auto_1194653 ?auto_1194657 ) ) ( not ( = ?auto_1194653 ?auto_1194659 ) ) ( not ( = ?auto_1194653 ?auto_1194658 ) ) ( not ( = ?auto_1194653 ?auto_1194660 ) ) ( not ( = ?auto_1194653 ?auto_1194661 ) ) ( not ( = ?auto_1194653 ?auto_1194662 ) ) ( not ( = ?auto_1194653 ?auto_1194663 ) ) ( not ( = ?auto_1194657 ?auto_1194659 ) ) ( not ( = ?auto_1194657 ?auto_1194658 ) ) ( not ( = ?auto_1194657 ?auto_1194660 ) ) ( not ( = ?auto_1194657 ?auto_1194661 ) ) ( not ( = ?auto_1194657 ?auto_1194662 ) ) ( not ( = ?auto_1194657 ?auto_1194663 ) ) ( not ( = ?auto_1194659 ?auto_1194658 ) ) ( not ( = ?auto_1194659 ?auto_1194660 ) ) ( not ( = ?auto_1194659 ?auto_1194661 ) ) ( not ( = ?auto_1194659 ?auto_1194662 ) ) ( not ( = ?auto_1194659 ?auto_1194663 ) ) ( not ( = ?auto_1194658 ?auto_1194660 ) ) ( not ( = ?auto_1194658 ?auto_1194661 ) ) ( not ( = ?auto_1194658 ?auto_1194662 ) ) ( not ( = ?auto_1194658 ?auto_1194663 ) ) ( not ( = ?auto_1194660 ?auto_1194661 ) ) ( not ( = ?auto_1194660 ?auto_1194662 ) ) ( not ( = ?auto_1194660 ?auto_1194663 ) ) ( not ( = ?auto_1194661 ?auto_1194662 ) ) ( not ( = ?auto_1194661 ?auto_1194663 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1194662 ?auto_1194663 )
      ( MAKE-10CRATE-VERIFY ?auto_1194654 ?auto_1194655 ?auto_1194656 ?auto_1194653 ?auto_1194657 ?auto_1194659 ?auto_1194658 ?auto_1194660 ?auto_1194661 ?auto_1194662 ?auto_1194663 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1194748 - SURFACE
      ?auto_1194749 - SURFACE
      ?auto_1194750 - SURFACE
      ?auto_1194747 - SURFACE
      ?auto_1194751 - SURFACE
      ?auto_1194753 - SURFACE
      ?auto_1194752 - SURFACE
      ?auto_1194754 - SURFACE
      ?auto_1194755 - SURFACE
      ?auto_1194756 - SURFACE
      ?auto_1194757 - SURFACE
    )
    :vars
    (
      ?auto_1194759 - HOIST
      ?auto_1194758 - PLACE
      ?auto_1194760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194759 ?auto_1194758 ) ( SURFACE-AT ?auto_1194756 ?auto_1194758 ) ( CLEAR ?auto_1194756 ) ( IS-CRATE ?auto_1194757 ) ( not ( = ?auto_1194756 ?auto_1194757 ) ) ( TRUCK-AT ?auto_1194760 ?auto_1194758 ) ( AVAILABLE ?auto_1194759 ) ( IN ?auto_1194757 ?auto_1194760 ) ( ON ?auto_1194756 ?auto_1194755 ) ( not ( = ?auto_1194755 ?auto_1194756 ) ) ( not ( = ?auto_1194755 ?auto_1194757 ) ) ( ON ?auto_1194749 ?auto_1194748 ) ( ON ?auto_1194750 ?auto_1194749 ) ( ON ?auto_1194747 ?auto_1194750 ) ( ON ?auto_1194751 ?auto_1194747 ) ( ON ?auto_1194753 ?auto_1194751 ) ( ON ?auto_1194752 ?auto_1194753 ) ( ON ?auto_1194754 ?auto_1194752 ) ( ON ?auto_1194755 ?auto_1194754 ) ( not ( = ?auto_1194748 ?auto_1194749 ) ) ( not ( = ?auto_1194748 ?auto_1194750 ) ) ( not ( = ?auto_1194748 ?auto_1194747 ) ) ( not ( = ?auto_1194748 ?auto_1194751 ) ) ( not ( = ?auto_1194748 ?auto_1194753 ) ) ( not ( = ?auto_1194748 ?auto_1194752 ) ) ( not ( = ?auto_1194748 ?auto_1194754 ) ) ( not ( = ?auto_1194748 ?auto_1194755 ) ) ( not ( = ?auto_1194748 ?auto_1194756 ) ) ( not ( = ?auto_1194748 ?auto_1194757 ) ) ( not ( = ?auto_1194749 ?auto_1194750 ) ) ( not ( = ?auto_1194749 ?auto_1194747 ) ) ( not ( = ?auto_1194749 ?auto_1194751 ) ) ( not ( = ?auto_1194749 ?auto_1194753 ) ) ( not ( = ?auto_1194749 ?auto_1194752 ) ) ( not ( = ?auto_1194749 ?auto_1194754 ) ) ( not ( = ?auto_1194749 ?auto_1194755 ) ) ( not ( = ?auto_1194749 ?auto_1194756 ) ) ( not ( = ?auto_1194749 ?auto_1194757 ) ) ( not ( = ?auto_1194750 ?auto_1194747 ) ) ( not ( = ?auto_1194750 ?auto_1194751 ) ) ( not ( = ?auto_1194750 ?auto_1194753 ) ) ( not ( = ?auto_1194750 ?auto_1194752 ) ) ( not ( = ?auto_1194750 ?auto_1194754 ) ) ( not ( = ?auto_1194750 ?auto_1194755 ) ) ( not ( = ?auto_1194750 ?auto_1194756 ) ) ( not ( = ?auto_1194750 ?auto_1194757 ) ) ( not ( = ?auto_1194747 ?auto_1194751 ) ) ( not ( = ?auto_1194747 ?auto_1194753 ) ) ( not ( = ?auto_1194747 ?auto_1194752 ) ) ( not ( = ?auto_1194747 ?auto_1194754 ) ) ( not ( = ?auto_1194747 ?auto_1194755 ) ) ( not ( = ?auto_1194747 ?auto_1194756 ) ) ( not ( = ?auto_1194747 ?auto_1194757 ) ) ( not ( = ?auto_1194751 ?auto_1194753 ) ) ( not ( = ?auto_1194751 ?auto_1194752 ) ) ( not ( = ?auto_1194751 ?auto_1194754 ) ) ( not ( = ?auto_1194751 ?auto_1194755 ) ) ( not ( = ?auto_1194751 ?auto_1194756 ) ) ( not ( = ?auto_1194751 ?auto_1194757 ) ) ( not ( = ?auto_1194753 ?auto_1194752 ) ) ( not ( = ?auto_1194753 ?auto_1194754 ) ) ( not ( = ?auto_1194753 ?auto_1194755 ) ) ( not ( = ?auto_1194753 ?auto_1194756 ) ) ( not ( = ?auto_1194753 ?auto_1194757 ) ) ( not ( = ?auto_1194752 ?auto_1194754 ) ) ( not ( = ?auto_1194752 ?auto_1194755 ) ) ( not ( = ?auto_1194752 ?auto_1194756 ) ) ( not ( = ?auto_1194752 ?auto_1194757 ) ) ( not ( = ?auto_1194754 ?auto_1194755 ) ) ( not ( = ?auto_1194754 ?auto_1194756 ) ) ( not ( = ?auto_1194754 ?auto_1194757 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194755 ?auto_1194756 ?auto_1194757 )
      ( MAKE-10CRATE-VERIFY ?auto_1194748 ?auto_1194749 ?auto_1194750 ?auto_1194747 ?auto_1194751 ?auto_1194753 ?auto_1194752 ?auto_1194754 ?auto_1194755 ?auto_1194756 ?auto_1194757 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1194853 - SURFACE
      ?auto_1194854 - SURFACE
      ?auto_1194855 - SURFACE
      ?auto_1194852 - SURFACE
      ?auto_1194856 - SURFACE
      ?auto_1194858 - SURFACE
      ?auto_1194857 - SURFACE
      ?auto_1194859 - SURFACE
      ?auto_1194860 - SURFACE
      ?auto_1194861 - SURFACE
      ?auto_1194862 - SURFACE
    )
    :vars
    (
      ?auto_1194864 - HOIST
      ?auto_1194866 - PLACE
      ?auto_1194863 - TRUCK
      ?auto_1194865 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194864 ?auto_1194866 ) ( SURFACE-AT ?auto_1194861 ?auto_1194866 ) ( CLEAR ?auto_1194861 ) ( IS-CRATE ?auto_1194862 ) ( not ( = ?auto_1194861 ?auto_1194862 ) ) ( AVAILABLE ?auto_1194864 ) ( IN ?auto_1194862 ?auto_1194863 ) ( ON ?auto_1194861 ?auto_1194860 ) ( not ( = ?auto_1194860 ?auto_1194861 ) ) ( not ( = ?auto_1194860 ?auto_1194862 ) ) ( TRUCK-AT ?auto_1194863 ?auto_1194865 ) ( not ( = ?auto_1194865 ?auto_1194866 ) ) ( ON ?auto_1194854 ?auto_1194853 ) ( ON ?auto_1194855 ?auto_1194854 ) ( ON ?auto_1194852 ?auto_1194855 ) ( ON ?auto_1194856 ?auto_1194852 ) ( ON ?auto_1194858 ?auto_1194856 ) ( ON ?auto_1194857 ?auto_1194858 ) ( ON ?auto_1194859 ?auto_1194857 ) ( ON ?auto_1194860 ?auto_1194859 ) ( not ( = ?auto_1194853 ?auto_1194854 ) ) ( not ( = ?auto_1194853 ?auto_1194855 ) ) ( not ( = ?auto_1194853 ?auto_1194852 ) ) ( not ( = ?auto_1194853 ?auto_1194856 ) ) ( not ( = ?auto_1194853 ?auto_1194858 ) ) ( not ( = ?auto_1194853 ?auto_1194857 ) ) ( not ( = ?auto_1194853 ?auto_1194859 ) ) ( not ( = ?auto_1194853 ?auto_1194860 ) ) ( not ( = ?auto_1194853 ?auto_1194861 ) ) ( not ( = ?auto_1194853 ?auto_1194862 ) ) ( not ( = ?auto_1194854 ?auto_1194855 ) ) ( not ( = ?auto_1194854 ?auto_1194852 ) ) ( not ( = ?auto_1194854 ?auto_1194856 ) ) ( not ( = ?auto_1194854 ?auto_1194858 ) ) ( not ( = ?auto_1194854 ?auto_1194857 ) ) ( not ( = ?auto_1194854 ?auto_1194859 ) ) ( not ( = ?auto_1194854 ?auto_1194860 ) ) ( not ( = ?auto_1194854 ?auto_1194861 ) ) ( not ( = ?auto_1194854 ?auto_1194862 ) ) ( not ( = ?auto_1194855 ?auto_1194852 ) ) ( not ( = ?auto_1194855 ?auto_1194856 ) ) ( not ( = ?auto_1194855 ?auto_1194858 ) ) ( not ( = ?auto_1194855 ?auto_1194857 ) ) ( not ( = ?auto_1194855 ?auto_1194859 ) ) ( not ( = ?auto_1194855 ?auto_1194860 ) ) ( not ( = ?auto_1194855 ?auto_1194861 ) ) ( not ( = ?auto_1194855 ?auto_1194862 ) ) ( not ( = ?auto_1194852 ?auto_1194856 ) ) ( not ( = ?auto_1194852 ?auto_1194858 ) ) ( not ( = ?auto_1194852 ?auto_1194857 ) ) ( not ( = ?auto_1194852 ?auto_1194859 ) ) ( not ( = ?auto_1194852 ?auto_1194860 ) ) ( not ( = ?auto_1194852 ?auto_1194861 ) ) ( not ( = ?auto_1194852 ?auto_1194862 ) ) ( not ( = ?auto_1194856 ?auto_1194858 ) ) ( not ( = ?auto_1194856 ?auto_1194857 ) ) ( not ( = ?auto_1194856 ?auto_1194859 ) ) ( not ( = ?auto_1194856 ?auto_1194860 ) ) ( not ( = ?auto_1194856 ?auto_1194861 ) ) ( not ( = ?auto_1194856 ?auto_1194862 ) ) ( not ( = ?auto_1194858 ?auto_1194857 ) ) ( not ( = ?auto_1194858 ?auto_1194859 ) ) ( not ( = ?auto_1194858 ?auto_1194860 ) ) ( not ( = ?auto_1194858 ?auto_1194861 ) ) ( not ( = ?auto_1194858 ?auto_1194862 ) ) ( not ( = ?auto_1194857 ?auto_1194859 ) ) ( not ( = ?auto_1194857 ?auto_1194860 ) ) ( not ( = ?auto_1194857 ?auto_1194861 ) ) ( not ( = ?auto_1194857 ?auto_1194862 ) ) ( not ( = ?auto_1194859 ?auto_1194860 ) ) ( not ( = ?auto_1194859 ?auto_1194861 ) ) ( not ( = ?auto_1194859 ?auto_1194862 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194860 ?auto_1194861 ?auto_1194862 )
      ( MAKE-10CRATE-VERIFY ?auto_1194853 ?auto_1194854 ?auto_1194855 ?auto_1194852 ?auto_1194856 ?auto_1194858 ?auto_1194857 ?auto_1194859 ?auto_1194860 ?auto_1194861 ?auto_1194862 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1194968 - SURFACE
      ?auto_1194969 - SURFACE
      ?auto_1194970 - SURFACE
      ?auto_1194967 - SURFACE
      ?auto_1194971 - SURFACE
      ?auto_1194973 - SURFACE
      ?auto_1194972 - SURFACE
      ?auto_1194974 - SURFACE
      ?auto_1194975 - SURFACE
      ?auto_1194976 - SURFACE
      ?auto_1194977 - SURFACE
    )
    :vars
    (
      ?auto_1194979 - HOIST
      ?auto_1194978 - PLACE
      ?auto_1194982 - TRUCK
      ?auto_1194980 - PLACE
      ?auto_1194981 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194979 ?auto_1194978 ) ( SURFACE-AT ?auto_1194976 ?auto_1194978 ) ( CLEAR ?auto_1194976 ) ( IS-CRATE ?auto_1194977 ) ( not ( = ?auto_1194976 ?auto_1194977 ) ) ( AVAILABLE ?auto_1194979 ) ( ON ?auto_1194976 ?auto_1194975 ) ( not ( = ?auto_1194975 ?auto_1194976 ) ) ( not ( = ?auto_1194975 ?auto_1194977 ) ) ( TRUCK-AT ?auto_1194982 ?auto_1194980 ) ( not ( = ?auto_1194980 ?auto_1194978 ) ) ( HOIST-AT ?auto_1194981 ?auto_1194980 ) ( LIFTING ?auto_1194981 ?auto_1194977 ) ( not ( = ?auto_1194979 ?auto_1194981 ) ) ( ON ?auto_1194969 ?auto_1194968 ) ( ON ?auto_1194970 ?auto_1194969 ) ( ON ?auto_1194967 ?auto_1194970 ) ( ON ?auto_1194971 ?auto_1194967 ) ( ON ?auto_1194973 ?auto_1194971 ) ( ON ?auto_1194972 ?auto_1194973 ) ( ON ?auto_1194974 ?auto_1194972 ) ( ON ?auto_1194975 ?auto_1194974 ) ( not ( = ?auto_1194968 ?auto_1194969 ) ) ( not ( = ?auto_1194968 ?auto_1194970 ) ) ( not ( = ?auto_1194968 ?auto_1194967 ) ) ( not ( = ?auto_1194968 ?auto_1194971 ) ) ( not ( = ?auto_1194968 ?auto_1194973 ) ) ( not ( = ?auto_1194968 ?auto_1194972 ) ) ( not ( = ?auto_1194968 ?auto_1194974 ) ) ( not ( = ?auto_1194968 ?auto_1194975 ) ) ( not ( = ?auto_1194968 ?auto_1194976 ) ) ( not ( = ?auto_1194968 ?auto_1194977 ) ) ( not ( = ?auto_1194969 ?auto_1194970 ) ) ( not ( = ?auto_1194969 ?auto_1194967 ) ) ( not ( = ?auto_1194969 ?auto_1194971 ) ) ( not ( = ?auto_1194969 ?auto_1194973 ) ) ( not ( = ?auto_1194969 ?auto_1194972 ) ) ( not ( = ?auto_1194969 ?auto_1194974 ) ) ( not ( = ?auto_1194969 ?auto_1194975 ) ) ( not ( = ?auto_1194969 ?auto_1194976 ) ) ( not ( = ?auto_1194969 ?auto_1194977 ) ) ( not ( = ?auto_1194970 ?auto_1194967 ) ) ( not ( = ?auto_1194970 ?auto_1194971 ) ) ( not ( = ?auto_1194970 ?auto_1194973 ) ) ( not ( = ?auto_1194970 ?auto_1194972 ) ) ( not ( = ?auto_1194970 ?auto_1194974 ) ) ( not ( = ?auto_1194970 ?auto_1194975 ) ) ( not ( = ?auto_1194970 ?auto_1194976 ) ) ( not ( = ?auto_1194970 ?auto_1194977 ) ) ( not ( = ?auto_1194967 ?auto_1194971 ) ) ( not ( = ?auto_1194967 ?auto_1194973 ) ) ( not ( = ?auto_1194967 ?auto_1194972 ) ) ( not ( = ?auto_1194967 ?auto_1194974 ) ) ( not ( = ?auto_1194967 ?auto_1194975 ) ) ( not ( = ?auto_1194967 ?auto_1194976 ) ) ( not ( = ?auto_1194967 ?auto_1194977 ) ) ( not ( = ?auto_1194971 ?auto_1194973 ) ) ( not ( = ?auto_1194971 ?auto_1194972 ) ) ( not ( = ?auto_1194971 ?auto_1194974 ) ) ( not ( = ?auto_1194971 ?auto_1194975 ) ) ( not ( = ?auto_1194971 ?auto_1194976 ) ) ( not ( = ?auto_1194971 ?auto_1194977 ) ) ( not ( = ?auto_1194973 ?auto_1194972 ) ) ( not ( = ?auto_1194973 ?auto_1194974 ) ) ( not ( = ?auto_1194973 ?auto_1194975 ) ) ( not ( = ?auto_1194973 ?auto_1194976 ) ) ( not ( = ?auto_1194973 ?auto_1194977 ) ) ( not ( = ?auto_1194972 ?auto_1194974 ) ) ( not ( = ?auto_1194972 ?auto_1194975 ) ) ( not ( = ?auto_1194972 ?auto_1194976 ) ) ( not ( = ?auto_1194972 ?auto_1194977 ) ) ( not ( = ?auto_1194974 ?auto_1194975 ) ) ( not ( = ?auto_1194974 ?auto_1194976 ) ) ( not ( = ?auto_1194974 ?auto_1194977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194975 ?auto_1194976 ?auto_1194977 )
      ( MAKE-10CRATE-VERIFY ?auto_1194968 ?auto_1194969 ?auto_1194970 ?auto_1194967 ?auto_1194971 ?auto_1194973 ?auto_1194972 ?auto_1194974 ?auto_1194975 ?auto_1194976 ?auto_1194977 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1195093 - SURFACE
      ?auto_1195094 - SURFACE
      ?auto_1195095 - SURFACE
      ?auto_1195092 - SURFACE
      ?auto_1195096 - SURFACE
      ?auto_1195098 - SURFACE
      ?auto_1195097 - SURFACE
      ?auto_1195099 - SURFACE
      ?auto_1195100 - SURFACE
      ?auto_1195101 - SURFACE
      ?auto_1195102 - SURFACE
    )
    :vars
    (
      ?auto_1195105 - HOIST
      ?auto_1195103 - PLACE
      ?auto_1195108 - TRUCK
      ?auto_1195107 - PLACE
      ?auto_1195104 - HOIST
      ?auto_1195106 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195105 ?auto_1195103 ) ( SURFACE-AT ?auto_1195101 ?auto_1195103 ) ( CLEAR ?auto_1195101 ) ( IS-CRATE ?auto_1195102 ) ( not ( = ?auto_1195101 ?auto_1195102 ) ) ( AVAILABLE ?auto_1195105 ) ( ON ?auto_1195101 ?auto_1195100 ) ( not ( = ?auto_1195100 ?auto_1195101 ) ) ( not ( = ?auto_1195100 ?auto_1195102 ) ) ( TRUCK-AT ?auto_1195108 ?auto_1195107 ) ( not ( = ?auto_1195107 ?auto_1195103 ) ) ( HOIST-AT ?auto_1195104 ?auto_1195107 ) ( not ( = ?auto_1195105 ?auto_1195104 ) ) ( AVAILABLE ?auto_1195104 ) ( SURFACE-AT ?auto_1195102 ?auto_1195107 ) ( ON ?auto_1195102 ?auto_1195106 ) ( CLEAR ?auto_1195102 ) ( not ( = ?auto_1195101 ?auto_1195106 ) ) ( not ( = ?auto_1195102 ?auto_1195106 ) ) ( not ( = ?auto_1195100 ?auto_1195106 ) ) ( ON ?auto_1195094 ?auto_1195093 ) ( ON ?auto_1195095 ?auto_1195094 ) ( ON ?auto_1195092 ?auto_1195095 ) ( ON ?auto_1195096 ?auto_1195092 ) ( ON ?auto_1195098 ?auto_1195096 ) ( ON ?auto_1195097 ?auto_1195098 ) ( ON ?auto_1195099 ?auto_1195097 ) ( ON ?auto_1195100 ?auto_1195099 ) ( not ( = ?auto_1195093 ?auto_1195094 ) ) ( not ( = ?auto_1195093 ?auto_1195095 ) ) ( not ( = ?auto_1195093 ?auto_1195092 ) ) ( not ( = ?auto_1195093 ?auto_1195096 ) ) ( not ( = ?auto_1195093 ?auto_1195098 ) ) ( not ( = ?auto_1195093 ?auto_1195097 ) ) ( not ( = ?auto_1195093 ?auto_1195099 ) ) ( not ( = ?auto_1195093 ?auto_1195100 ) ) ( not ( = ?auto_1195093 ?auto_1195101 ) ) ( not ( = ?auto_1195093 ?auto_1195102 ) ) ( not ( = ?auto_1195093 ?auto_1195106 ) ) ( not ( = ?auto_1195094 ?auto_1195095 ) ) ( not ( = ?auto_1195094 ?auto_1195092 ) ) ( not ( = ?auto_1195094 ?auto_1195096 ) ) ( not ( = ?auto_1195094 ?auto_1195098 ) ) ( not ( = ?auto_1195094 ?auto_1195097 ) ) ( not ( = ?auto_1195094 ?auto_1195099 ) ) ( not ( = ?auto_1195094 ?auto_1195100 ) ) ( not ( = ?auto_1195094 ?auto_1195101 ) ) ( not ( = ?auto_1195094 ?auto_1195102 ) ) ( not ( = ?auto_1195094 ?auto_1195106 ) ) ( not ( = ?auto_1195095 ?auto_1195092 ) ) ( not ( = ?auto_1195095 ?auto_1195096 ) ) ( not ( = ?auto_1195095 ?auto_1195098 ) ) ( not ( = ?auto_1195095 ?auto_1195097 ) ) ( not ( = ?auto_1195095 ?auto_1195099 ) ) ( not ( = ?auto_1195095 ?auto_1195100 ) ) ( not ( = ?auto_1195095 ?auto_1195101 ) ) ( not ( = ?auto_1195095 ?auto_1195102 ) ) ( not ( = ?auto_1195095 ?auto_1195106 ) ) ( not ( = ?auto_1195092 ?auto_1195096 ) ) ( not ( = ?auto_1195092 ?auto_1195098 ) ) ( not ( = ?auto_1195092 ?auto_1195097 ) ) ( not ( = ?auto_1195092 ?auto_1195099 ) ) ( not ( = ?auto_1195092 ?auto_1195100 ) ) ( not ( = ?auto_1195092 ?auto_1195101 ) ) ( not ( = ?auto_1195092 ?auto_1195102 ) ) ( not ( = ?auto_1195092 ?auto_1195106 ) ) ( not ( = ?auto_1195096 ?auto_1195098 ) ) ( not ( = ?auto_1195096 ?auto_1195097 ) ) ( not ( = ?auto_1195096 ?auto_1195099 ) ) ( not ( = ?auto_1195096 ?auto_1195100 ) ) ( not ( = ?auto_1195096 ?auto_1195101 ) ) ( not ( = ?auto_1195096 ?auto_1195102 ) ) ( not ( = ?auto_1195096 ?auto_1195106 ) ) ( not ( = ?auto_1195098 ?auto_1195097 ) ) ( not ( = ?auto_1195098 ?auto_1195099 ) ) ( not ( = ?auto_1195098 ?auto_1195100 ) ) ( not ( = ?auto_1195098 ?auto_1195101 ) ) ( not ( = ?auto_1195098 ?auto_1195102 ) ) ( not ( = ?auto_1195098 ?auto_1195106 ) ) ( not ( = ?auto_1195097 ?auto_1195099 ) ) ( not ( = ?auto_1195097 ?auto_1195100 ) ) ( not ( = ?auto_1195097 ?auto_1195101 ) ) ( not ( = ?auto_1195097 ?auto_1195102 ) ) ( not ( = ?auto_1195097 ?auto_1195106 ) ) ( not ( = ?auto_1195099 ?auto_1195100 ) ) ( not ( = ?auto_1195099 ?auto_1195101 ) ) ( not ( = ?auto_1195099 ?auto_1195102 ) ) ( not ( = ?auto_1195099 ?auto_1195106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195100 ?auto_1195101 ?auto_1195102 )
      ( MAKE-10CRATE-VERIFY ?auto_1195093 ?auto_1195094 ?auto_1195095 ?auto_1195092 ?auto_1195096 ?auto_1195098 ?auto_1195097 ?auto_1195099 ?auto_1195100 ?auto_1195101 ?auto_1195102 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1195219 - SURFACE
      ?auto_1195220 - SURFACE
      ?auto_1195221 - SURFACE
      ?auto_1195218 - SURFACE
      ?auto_1195222 - SURFACE
      ?auto_1195224 - SURFACE
      ?auto_1195223 - SURFACE
      ?auto_1195225 - SURFACE
      ?auto_1195226 - SURFACE
      ?auto_1195227 - SURFACE
      ?auto_1195228 - SURFACE
    )
    :vars
    (
      ?auto_1195234 - HOIST
      ?auto_1195233 - PLACE
      ?auto_1195229 - PLACE
      ?auto_1195230 - HOIST
      ?auto_1195232 - SURFACE
      ?auto_1195231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195234 ?auto_1195233 ) ( SURFACE-AT ?auto_1195227 ?auto_1195233 ) ( CLEAR ?auto_1195227 ) ( IS-CRATE ?auto_1195228 ) ( not ( = ?auto_1195227 ?auto_1195228 ) ) ( AVAILABLE ?auto_1195234 ) ( ON ?auto_1195227 ?auto_1195226 ) ( not ( = ?auto_1195226 ?auto_1195227 ) ) ( not ( = ?auto_1195226 ?auto_1195228 ) ) ( not ( = ?auto_1195229 ?auto_1195233 ) ) ( HOIST-AT ?auto_1195230 ?auto_1195229 ) ( not ( = ?auto_1195234 ?auto_1195230 ) ) ( AVAILABLE ?auto_1195230 ) ( SURFACE-AT ?auto_1195228 ?auto_1195229 ) ( ON ?auto_1195228 ?auto_1195232 ) ( CLEAR ?auto_1195228 ) ( not ( = ?auto_1195227 ?auto_1195232 ) ) ( not ( = ?auto_1195228 ?auto_1195232 ) ) ( not ( = ?auto_1195226 ?auto_1195232 ) ) ( TRUCK-AT ?auto_1195231 ?auto_1195233 ) ( ON ?auto_1195220 ?auto_1195219 ) ( ON ?auto_1195221 ?auto_1195220 ) ( ON ?auto_1195218 ?auto_1195221 ) ( ON ?auto_1195222 ?auto_1195218 ) ( ON ?auto_1195224 ?auto_1195222 ) ( ON ?auto_1195223 ?auto_1195224 ) ( ON ?auto_1195225 ?auto_1195223 ) ( ON ?auto_1195226 ?auto_1195225 ) ( not ( = ?auto_1195219 ?auto_1195220 ) ) ( not ( = ?auto_1195219 ?auto_1195221 ) ) ( not ( = ?auto_1195219 ?auto_1195218 ) ) ( not ( = ?auto_1195219 ?auto_1195222 ) ) ( not ( = ?auto_1195219 ?auto_1195224 ) ) ( not ( = ?auto_1195219 ?auto_1195223 ) ) ( not ( = ?auto_1195219 ?auto_1195225 ) ) ( not ( = ?auto_1195219 ?auto_1195226 ) ) ( not ( = ?auto_1195219 ?auto_1195227 ) ) ( not ( = ?auto_1195219 ?auto_1195228 ) ) ( not ( = ?auto_1195219 ?auto_1195232 ) ) ( not ( = ?auto_1195220 ?auto_1195221 ) ) ( not ( = ?auto_1195220 ?auto_1195218 ) ) ( not ( = ?auto_1195220 ?auto_1195222 ) ) ( not ( = ?auto_1195220 ?auto_1195224 ) ) ( not ( = ?auto_1195220 ?auto_1195223 ) ) ( not ( = ?auto_1195220 ?auto_1195225 ) ) ( not ( = ?auto_1195220 ?auto_1195226 ) ) ( not ( = ?auto_1195220 ?auto_1195227 ) ) ( not ( = ?auto_1195220 ?auto_1195228 ) ) ( not ( = ?auto_1195220 ?auto_1195232 ) ) ( not ( = ?auto_1195221 ?auto_1195218 ) ) ( not ( = ?auto_1195221 ?auto_1195222 ) ) ( not ( = ?auto_1195221 ?auto_1195224 ) ) ( not ( = ?auto_1195221 ?auto_1195223 ) ) ( not ( = ?auto_1195221 ?auto_1195225 ) ) ( not ( = ?auto_1195221 ?auto_1195226 ) ) ( not ( = ?auto_1195221 ?auto_1195227 ) ) ( not ( = ?auto_1195221 ?auto_1195228 ) ) ( not ( = ?auto_1195221 ?auto_1195232 ) ) ( not ( = ?auto_1195218 ?auto_1195222 ) ) ( not ( = ?auto_1195218 ?auto_1195224 ) ) ( not ( = ?auto_1195218 ?auto_1195223 ) ) ( not ( = ?auto_1195218 ?auto_1195225 ) ) ( not ( = ?auto_1195218 ?auto_1195226 ) ) ( not ( = ?auto_1195218 ?auto_1195227 ) ) ( not ( = ?auto_1195218 ?auto_1195228 ) ) ( not ( = ?auto_1195218 ?auto_1195232 ) ) ( not ( = ?auto_1195222 ?auto_1195224 ) ) ( not ( = ?auto_1195222 ?auto_1195223 ) ) ( not ( = ?auto_1195222 ?auto_1195225 ) ) ( not ( = ?auto_1195222 ?auto_1195226 ) ) ( not ( = ?auto_1195222 ?auto_1195227 ) ) ( not ( = ?auto_1195222 ?auto_1195228 ) ) ( not ( = ?auto_1195222 ?auto_1195232 ) ) ( not ( = ?auto_1195224 ?auto_1195223 ) ) ( not ( = ?auto_1195224 ?auto_1195225 ) ) ( not ( = ?auto_1195224 ?auto_1195226 ) ) ( not ( = ?auto_1195224 ?auto_1195227 ) ) ( not ( = ?auto_1195224 ?auto_1195228 ) ) ( not ( = ?auto_1195224 ?auto_1195232 ) ) ( not ( = ?auto_1195223 ?auto_1195225 ) ) ( not ( = ?auto_1195223 ?auto_1195226 ) ) ( not ( = ?auto_1195223 ?auto_1195227 ) ) ( not ( = ?auto_1195223 ?auto_1195228 ) ) ( not ( = ?auto_1195223 ?auto_1195232 ) ) ( not ( = ?auto_1195225 ?auto_1195226 ) ) ( not ( = ?auto_1195225 ?auto_1195227 ) ) ( not ( = ?auto_1195225 ?auto_1195228 ) ) ( not ( = ?auto_1195225 ?auto_1195232 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195226 ?auto_1195227 ?auto_1195228 )
      ( MAKE-10CRATE-VERIFY ?auto_1195219 ?auto_1195220 ?auto_1195221 ?auto_1195218 ?auto_1195222 ?auto_1195224 ?auto_1195223 ?auto_1195225 ?auto_1195226 ?auto_1195227 ?auto_1195228 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1195345 - SURFACE
      ?auto_1195346 - SURFACE
      ?auto_1195347 - SURFACE
      ?auto_1195344 - SURFACE
      ?auto_1195348 - SURFACE
      ?auto_1195350 - SURFACE
      ?auto_1195349 - SURFACE
      ?auto_1195351 - SURFACE
      ?auto_1195352 - SURFACE
      ?auto_1195353 - SURFACE
      ?auto_1195354 - SURFACE
    )
    :vars
    (
      ?auto_1195356 - HOIST
      ?auto_1195360 - PLACE
      ?auto_1195357 - PLACE
      ?auto_1195358 - HOIST
      ?auto_1195355 - SURFACE
      ?auto_1195359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195356 ?auto_1195360 ) ( IS-CRATE ?auto_1195354 ) ( not ( = ?auto_1195353 ?auto_1195354 ) ) ( not ( = ?auto_1195352 ?auto_1195353 ) ) ( not ( = ?auto_1195352 ?auto_1195354 ) ) ( not ( = ?auto_1195357 ?auto_1195360 ) ) ( HOIST-AT ?auto_1195358 ?auto_1195357 ) ( not ( = ?auto_1195356 ?auto_1195358 ) ) ( AVAILABLE ?auto_1195358 ) ( SURFACE-AT ?auto_1195354 ?auto_1195357 ) ( ON ?auto_1195354 ?auto_1195355 ) ( CLEAR ?auto_1195354 ) ( not ( = ?auto_1195353 ?auto_1195355 ) ) ( not ( = ?auto_1195354 ?auto_1195355 ) ) ( not ( = ?auto_1195352 ?auto_1195355 ) ) ( TRUCK-AT ?auto_1195359 ?auto_1195360 ) ( SURFACE-AT ?auto_1195352 ?auto_1195360 ) ( CLEAR ?auto_1195352 ) ( LIFTING ?auto_1195356 ?auto_1195353 ) ( IS-CRATE ?auto_1195353 ) ( ON ?auto_1195346 ?auto_1195345 ) ( ON ?auto_1195347 ?auto_1195346 ) ( ON ?auto_1195344 ?auto_1195347 ) ( ON ?auto_1195348 ?auto_1195344 ) ( ON ?auto_1195350 ?auto_1195348 ) ( ON ?auto_1195349 ?auto_1195350 ) ( ON ?auto_1195351 ?auto_1195349 ) ( ON ?auto_1195352 ?auto_1195351 ) ( not ( = ?auto_1195345 ?auto_1195346 ) ) ( not ( = ?auto_1195345 ?auto_1195347 ) ) ( not ( = ?auto_1195345 ?auto_1195344 ) ) ( not ( = ?auto_1195345 ?auto_1195348 ) ) ( not ( = ?auto_1195345 ?auto_1195350 ) ) ( not ( = ?auto_1195345 ?auto_1195349 ) ) ( not ( = ?auto_1195345 ?auto_1195351 ) ) ( not ( = ?auto_1195345 ?auto_1195352 ) ) ( not ( = ?auto_1195345 ?auto_1195353 ) ) ( not ( = ?auto_1195345 ?auto_1195354 ) ) ( not ( = ?auto_1195345 ?auto_1195355 ) ) ( not ( = ?auto_1195346 ?auto_1195347 ) ) ( not ( = ?auto_1195346 ?auto_1195344 ) ) ( not ( = ?auto_1195346 ?auto_1195348 ) ) ( not ( = ?auto_1195346 ?auto_1195350 ) ) ( not ( = ?auto_1195346 ?auto_1195349 ) ) ( not ( = ?auto_1195346 ?auto_1195351 ) ) ( not ( = ?auto_1195346 ?auto_1195352 ) ) ( not ( = ?auto_1195346 ?auto_1195353 ) ) ( not ( = ?auto_1195346 ?auto_1195354 ) ) ( not ( = ?auto_1195346 ?auto_1195355 ) ) ( not ( = ?auto_1195347 ?auto_1195344 ) ) ( not ( = ?auto_1195347 ?auto_1195348 ) ) ( not ( = ?auto_1195347 ?auto_1195350 ) ) ( not ( = ?auto_1195347 ?auto_1195349 ) ) ( not ( = ?auto_1195347 ?auto_1195351 ) ) ( not ( = ?auto_1195347 ?auto_1195352 ) ) ( not ( = ?auto_1195347 ?auto_1195353 ) ) ( not ( = ?auto_1195347 ?auto_1195354 ) ) ( not ( = ?auto_1195347 ?auto_1195355 ) ) ( not ( = ?auto_1195344 ?auto_1195348 ) ) ( not ( = ?auto_1195344 ?auto_1195350 ) ) ( not ( = ?auto_1195344 ?auto_1195349 ) ) ( not ( = ?auto_1195344 ?auto_1195351 ) ) ( not ( = ?auto_1195344 ?auto_1195352 ) ) ( not ( = ?auto_1195344 ?auto_1195353 ) ) ( not ( = ?auto_1195344 ?auto_1195354 ) ) ( not ( = ?auto_1195344 ?auto_1195355 ) ) ( not ( = ?auto_1195348 ?auto_1195350 ) ) ( not ( = ?auto_1195348 ?auto_1195349 ) ) ( not ( = ?auto_1195348 ?auto_1195351 ) ) ( not ( = ?auto_1195348 ?auto_1195352 ) ) ( not ( = ?auto_1195348 ?auto_1195353 ) ) ( not ( = ?auto_1195348 ?auto_1195354 ) ) ( not ( = ?auto_1195348 ?auto_1195355 ) ) ( not ( = ?auto_1195350 ?auto_1195349 ) ) ( not ( = ?auto_1195350 ?auto_1195351 ) ) ( not ( = ?auto_1195350 ?auto_1195352 ) ) ( not ( = ?auto_1195350 ?auto_1195353 ) ) ( not ( = ?auto_1195350 ?auto_1195354 ) ) ( not ( = ?auto_1195350 ?auto_1195355 ) ) ( not ( = ?auto_1195349 ?auto_1195351 ) ) ( not ( = ?auto_1195349 ?auto_1195352 ) ) ( not ( = ?auto_1195349 ?auto_1195353 ) ) ( not ( = ?auto_1195349 ?auto_1195354 ) ) ( not ( = ?auto_1195349 ?auto_1195355 ) ) ( not ( = ?auto_1195351 ?auto_1195352 ) ) ( not ( = ?auto_1195351 ?auto_1195353 ) ) ( not ( = ?auto_1195351 ?auto_1195354 ) ) ( not ( = ?auto_1195351 ?auto_1195355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195352 ?auto_1195353 ?auto_1195354 )
      ( MAKE-10CRATE-VERIFY ?auto_1195345 ?auto_1195346 ?auto_1195347 ?auto_1195344 ?auto_1195348 ?auto_1195350 ?auto_1195349 ?auto_1195351 ?auto_1195352 ?auto_1195353 ?auto_1195354 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1195471 - SURFACE
      ?auto_1195472 - SURFACE
      ?auto_1195473 - SURFACE
      ?auto_1195470 - SURFACE
      ?auto_1195474 - SURFACE
      ?auto_1195476 - SURFACE
      ?auto_1195475 - SURFACE
      ?auto_1195477 - SURFACE
      ?auto_1195478 - SURFACE
      ?auto_1195479 - SURFACE
      ?auto_1195480 - SURFACE
    )
    :vars
    (
      ?auto_1195482 - HOIST
      ?auto_1195483 - PLACE
      ?auto_1195485 - PLACE
      ?auto_1195486 - HOIST
      ?auto_1195481 - SURFACE
      ?auto_1195484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195482 ?auto_1195483 ) ( IS-CRATE ?auto_1195480 ) ( not ( = ?auto_1195479 ?auto_1195480 ) ) ( not ( = ?auto_1195478 ?auto_1195479 ) ) ( not ( = ?auto_1195478 ?auto_1195480 ) ) ( not ( = ?auto_1195485 ?auto_1195483 ) ) ( HOIST-AT ?auto_1195486 ?auto_1195485 ) ( not ( = ?auto_1195482 ?auto_1195486 ) ) ( AVAILABLE ?auto_1195486 ) ( SURFACE-AT ?auto_1195480 ?auto_1195485 ) ( ON ?auto_1195480 ?auto_1195481 ) ( CLEAR ?auto_1195480 ) ( not ( = ?auto_1195479 ?auto_1195481 ) ) ( not ( = ?auto_1195480 ?auto_1195481 ) ) ( not ( = ?auto_1195478 ?auto_1195481 ) ) ( TRUCK-AT ?auto_1195484 ?auto_1195483 ) ( SURFACE-AT ?auto_1195478 ?auto_1195483 ) ( CLEAR ?auto_1195478 ) ( IS-CRATE ?auto_1195479 ) ( AVAILABLE ?auto_1195482 ) ( IN ?auto_1195479 ?auto_1195484 ) ( ON ?auto_1195472 ?auto_1195471 ) ( ON ?auto_1195473 ?auto_1195472 ) ( ON ?auto_1195470 ?auto_1195473 ) ( ON ?auto_1195474 ?auto_1195470 ) ( ON ?auto_1195476 ?auto_1195474 ) ( ON ?auto_1195475 ?auto_1195476 ) ( ON ?auto_1195477 ?auto_1195475 ) ( ON ?auto_1195478 ?auto_1195477 ) ( not ( = ?auto_1195471 ?auto_1195472 ) ) ( not ( = ?auto_1195471 ?auto_1195473 ) ) ( not ( = ?auto_1195471 ?auto_1195470 ) ) ( not ( = ?auto_1195471 ?auto_1195474 ) ) ( not ( = ?auto_1195471 ?auto_1195476 ) ) ( not ( = ?auto_1195471 ?auto_1195475 ) ) ( not ( = ?auto_1195471 ?auto_1195477 ) ) ( not ( = ?auto_1195471 ?auto_1195478 ) ) ( not ( = ?auto_1195471 ?auto_1195479 ) ) ( not ( = ?auto_1195471 ?auto_1195480 ) ) ( not ( = ?auto_1195471 ?auto_1195481 ) ) ( not ( = ?auto_1195472 ?auto_1195473 ) ) ( not ( = ?auto_1195472 ?auto_1195470 ) ) ( not ( = ?auto_1195472 ?auto_1195474 ) ) ( not ( = ?auto_1195472 ?auto_1195476 ) ) ( not ( = ?auto_1195472 ?auto_1195475 ) ) ( not ( = ?auto_1195472 ?auto_1195477 ) ) ( not ( = ?auto_1195472 ?auto_1195478 ) ) ( not ( = ?auto_1195472 ?auto_1195479 ) ) ( not ( = ?auto_1195472 ?auto_1195480 ) ) ( not ( = ?auto_1195472 ?auto_1195481 ) ) ( not ( = ?auto_1195473 ?auto_1195470 ) ) ( not ( = ?auto_1195473 ?auto_1195474 ) ) ( not ( = ?auto_1195473 ?auto_1195476 ) ) ( not ( = ?auto_1195473 ?auto_1195475 ) ) ( not ( = ?auto_1195473 ?auto_1195477 ) ) ( not ( = ?auto_1195473 ?auto_1195478 ) ) ( not ( = ?auto_1195473 ?auto_1195479 ) ) ( not ( = ?auto_1195473 ?auto_1195480 ) ) ( not ( = ?auto_1195473 ?auto_1195481 ) ) ( not ( = ?auto_1195470 ?auto_1195474 ) ) ( not ( = ?auto_1195470 ?auto_1195476 ) ) ( not ( = ?auto_1195470 ?auto_1195475 ) ) ( not ( = ?auto_1195470 ?auto_1195477 ) ) ( not ( = ?auto_1195470 ?auto_1195478 ) ) ( not ( = ?auto_1195470 ?auto_1195479 ) ) ( not ( = ?auto_1195470 ?auto_1195480 ) ) ( not ( = ?auto_1195470 ?auto_1195481 ) ) ( not ( = ?auto_1195474 ?auto_1195476 ) ) ( not ( = ?auto_1195474 ?auto_1195475 ) ) ( not ( = ?auto_1195474 ?auto_1195477 ) ) ( not ( = ?auto_1195474 ?auto_1195478 ) ) ( not ( = ?auto_1195474 ?auto_1195479 ) ) ( not ( = ?auto_1195474 ?auto_1195480 ) ) ( not ( = ?auto_1195474 ?auto_1195481 ) ) ( not ( = ?auto_1195476 ?auto_1195475 ) ) ( not ( = ?auto_1195476 ?auto_1195477 ) ) ( not ( = ?auto_1195476 ?auto_1195478 ) ) ( not ( = ?auto_1195476 ?auto_1195479 ) ) ( not ( = ?auto_1195476 ?auto_1195480 ) ) ( not ( = ?auto_1195476 ?auto_1195481 ) ) ( not ( = ?auto_1195475 ?auto_1195477 ) ) ( not ( = ?auto_1195475 ?auto_1195478 ) ) ( not ( = ?auto_1195475 ?auto_1195479 ) ) ( not ( = ?auto_1195475 ?auto_1195480 ) ) ( not ( = ?auto_1195475 ?auto_1195481 ) ) ( not ( = ?auto_1195477 ?auto_1195478 ) ) ( not ( = ?auto_1195477 ?auto_1195479 ) ) ( not ( = ?auto_1195477 ?auto_1195480 ) ) ( not ( = ?auto_1195477 ?auto_1195481 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195478 ?auto_1195479 ?auto_1195480 )
      ( MAKE-10CRATE-VERIFY ?auto_1195471 ?auto_1195472 ?auto_1195473 ?auto_1195470 ?auto_1195474 ?auto_1195476 ?auto_1195475 ?auto_1195477 ?auto_1195478 ?auto_1195479 ?auto_1195480 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1202722 - SURFACE
      ?auto_1202723 - SURFACE
      ?auto_1202724 - SURFACE
      ?auto_1202721 - SURFACE
      ?auto_1202725 - SURFACE
      ?auto_1202727 - SURFACE
      ?auto_1202726 - SURFACE
      ?auto_1202728 - SURFACE
      ?auto_1202729 - SURFACE
      ?auto_1202730 - SURFACE
      ?auto_1202731 - SURFACE
      ?auto_1202732 - SURFACE
    )
    :vars
    (
      ?auto_1202734 - HOIST
      ?auto_1202733 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1202734 ?auto_1202733 ) ( SURFACE-AT ?auto_1202731 ?auto_1202733 ) ( CLEAR ?auto_1202731 ) ( LIFTING ?auto_1202734 ?auto_1202732 ) ( IS-CRATE ?auto_1202732 ) ( not ( = ?auto_1202731 ?auto_1202732 ) ) ( ON ?auto_1202723 ?auto_1202722 ) ( ON ?auto_1202724 ?auto_1202723 ) ( ON ?auto_1202721 ?auto_1202724 ) ( ON ?auto_1202725 ?auto_1202721 ) ( ON ?auto_1202727 ?auto_1202725 ) ( ON ?auto_1202726 ?auto_1202727 ) ( ON ?auto_1202728 ?auto_1202726 ) ( ON ?auto_1202729 ?auto_1202728 ) ( ON ?auto_1202730 ?auto_1202729 ) ( ON ?auto_1202731 ?auto_1202730 ) ( not ( = ?auto_1202722 ?auto_1202723 ) ) ( not ( = ?auto_1202722 ?auto_1202724 ) ) ( not ( = ?auto_1202722 ?auto_1202721 ) ) ( not ( = ?auto_1202722 ?auto_1202725 ) ) ( not ( = ?auto_1202722 ?auto_1202727 ) ) ( not ( = ?auto_1202722 ?auto_1202726 ) ) ( not ( = ?auto_1202722 ?auto_1202728 ) ) ( not ( = ?auto_1202722 ?auto_1202729 ) ) ( not ( = ?auto_1202722 ?auto_1202730 ) ) ( not ( = ?auto_1202722 ?auto_1202731 ) ) ( not ( = ?auto_1202722 ?auto_1202732 ) ) ( not ( = ?auto_1202723 ?auto_1202724 ) ) ( not ( = ?auto_1202723 ?auto_1202721 ) ) ( not ( = ?auto_1202723 ?auto_1202725 ) ) ( not ( = ?auto_1202723 ?auto_1202727 ) ) ( not ( = ?auto_1202723 ?auto_1202726 ) ) ( not ( = ?auto_1202723 ?auto_1202728 ) ) ( not ( = ?auto_1202723 ?auto_1202729 ) ) ( not ( = ?auto_1202723 ?auto_1202730 ) ) ( not ( = ?auto_1202723 ?auto_1202731 ) ) ( not ( = ?auto_1202723 ?auto_1202732 ) ) ( not ( = ?auto_1202724 ?auto_1202721 ) ) ( not ( = ?auto_1202724 ?auto_1202725 ) ) ( not ( = ?auto_1202724 ?auto_1202727 ) ) ( not ( = ?auto_1202724 ?auto_1202726 ) ) ( not ( = ?auto_1202724 ?auto_1202728 ) ) ( not ( = ?auto_1202724 ?auto_1202729 ) ) ( not ( = ?auto_1202724 ?auto_1202730 ) ) ( not ( = ?auto_1202724 ?auto_1202731 ) ) ( not ( = ?auto_1202724 ?auto_1202732 ) ) ( not ( = ?auto_1202721 ?auto_1202725 ) ) ( not ( = ?auto_1202721 ?auto_1202727 ) ) ( not ( = ?auto_1202721 ?auto_1202726 ) ) ( not ( = ?auto_1202721 ?auto_1202728 ) ) ( not ( = ?auto_1202721 ?auto_1202729 ) ) ( not ( = ?auto_1202721 ?auto_1202730 ) ) ( not ( = ?auto_1202721 ?auto_1202731 ) ) ( not ( = ?auto_1202721 ?auto_1202732 ) ) ( not ( = ?auto_1202725 ?auto_1202727 ) ) ( not ( = ?auto_1202725 ?auto_1202726 ) ) ( not ( = ?auto_1202725 ?auto_1202728 ) ) ( not ( = ?auto_1202725 ?auto_1202729 ) ) ( not ( = ?auto_1202725 ?auto_1202730 ) ) ( not ( = ?auto_1202725 ?auto_1202731 ) ) ( not ( = ?auto_1202725 ?auto_1202732 ) ) ( not ( = ?auto_1202727 ?auto_1202726 ) ) ( not ( = ?auto_1202727 ?auto_1202728 ) ) ( not ( = ?auto_1202727 ?auto_1202729 ) ) ( not ( = ?auto_1202727 ?auto_1202730 ) ) ( not ( = ?auto_1202727 ?auto_1202731 ) ) ( not ( = ?auto_1202727 ?auto_1202732 ) ) ( not ( = ?auto_1202726 ?auto_1202728 ) ) ( not ( = ?auto_1202726 ?auto_1202729 ) ) ( not ( = ?auto_1202726 ?auto_1202730 ) ) ( not ( = ?auto_1202726 ?auto_1202731 ) ) ( not ( = ?auto_1202726 ?auto_1202732 ) ) ( not ( = ?auto_1202728 ?auto_1202729 ) ) ( not ( = ?auto_1202728 ?auto_1202730 ) ) ( not ( = ?auto_1202728 ?auto_1202731 ) ) ( not ( = ?auto_1202728 ?auto_1202732 ) ) ( not ( = ?auto_1202729 ?auto_1202730 ) ) ( not ( = ?auto_1202729 ?auto_1202731 ) ) ( not ( = ?auto_1202729 ?auto_1202732 ) ) ( not ( = ?auto_1202730 ?auto_1202731 ) ) ( not ( = ?auto_1202730 ?auto_1202732 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1202731 ?auto_1202732 )
      ( MAKE-11CRATE-VERIFY ?auto_1202722 ?auto_1202723 ?auto_1202724 ?auto_1202721 ?auto_1202725 ?auto_1202727 ?auto_1202726 ?auto_1202728 ?auto_1202729 ?auto_1202730 ?auto_1202731 ?auto_1202732 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1202831 - SURFACE
      ?auto_1202832 - SURFACE
      ?auto_1202833 - SURFACE
      ?auto_1202830 - SURFACE
      ?auto_1202834 - SURFACE
      ?auto_1202836 - SURFACE
      ?auto_1202835 - SURFACE
      ?auto_1202837 - SURFACE
      ?auto_1202838 - SURFACE
      ?auto_1202839 - SURFACE
      ?auto_1202840 - SURFACE
      ?auto_1202841 - SURFACE
    )
    :vars
    (
      ?auto_1202842 - HOIST
      ?auto_1202843 - PLACE
      ?auto_1202844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1202842 ?auto_1202843 ) ( SURFACE-AT ?auto_1202840 ?auto_1202843 ) ( CLEAR ?auto_1202840 ) ( IS-CRATE ?auto_1202841 ) ( not ( = ?auto_1202840 ?auto_1202841 ) ) ( TRUCK-AT ?auto_1202844 ?auto_1202843 ) ( AVAILABLE ?auto_1202842 ) ( IN ?auto_1202841 ?auto_1202844 ) ( ON ?auto_1202840 ?auto_1202839 ) ( not ( = ?auto_1202839 ?auto_1202840 ) ) ( not ( = ?auto_1202839 ?auto_1202841 ) ) ( ON ?auto_1202832 ?auto_1202831 ) ( ON ?auto_1202833 ?auto_1202832 ) ( ON ?auto_1202830 ?auto_1202833 ) ( ON ?auto_1202834 ?auto_1202830 ) ( ON ?auto_1202836 ?auto_1202834 ) ( ON ?auto_1202835 ?auto_1202836 ) ( ON ?auto_1202837 ?auto_1202835 ) ( ON ?auto_1202838 ?auto_1202837 ) ( ON ?auto_1202839 ?auto_1202838 ) ( not ( = ?auto_1202831 ?auto_1202832 ) ) ( not ( = ?auto_1202831 ?auto_1202833 ) ) ( not ( = ?auto_1202831 ?auto_1202830 ) ) ( not ( = ?auto_1202831 ?auto_1202834 ) ) ( not ( = ?auto_1202831 ?auto_1202836 ) ) ( not ( = ?auto_1202831 ?auto_1202835 ) ) ( not ( = ?auto_1202831 ?auto_1202837 ) ) ( not ( = ?auto_1202831 ?auto_1202838 ) ) ( not ( = ?auto_1202831 ?auto_1202839 ) ) ( not ( = ?auto_1202831 ?auto_1202840 ) ) ( not ( = ?auto_1202831 ?auto_1202841 ) ) ( not ( = ?auto_1202832 ?auto_1202833 ) ) ( not ( = ?auto_1202832 ?auto_1202830 ) ) ( not ( = ?auto_1202832 ?auto_1202834 ) ) ( not ( = ?auto_1202832 ?auto_1202836 ) ) ( not ( = ?auto_1202832 ?auto_1202835 ) ) ( not ( = ?auto_1202832 ?auto_1202837 ) ) ( not ( = ?auto_1202832 ?auto_1202838 ) ) ( not ( = ?auto_1202832 ?auto_1202839 ) ) ( not ( = ?auto_1202832 ?auto_1202840 ) ) ( not ( = ?auto_1202832 ?auto_1202841 ) ) ( not ( = ?auto_1202833 ?auto_1202830 ) ) ( not ( = ?auto_1202833 ?auto_1202834 ) ) ( not ( = ?auto_1202833 ?auto_1202836 ) ) ( not ( = ?auto_1202833 ?auto_1202835 ) ) ( not ( = ?auto_1202833 ?auto_1202837 ) ) ( not ( = ?auto_1202833 ?auto_1202838 ) ) ( not ( = ?auto_1202833 ?auto_1202839 ) ) ( not ( = ?auto_1202833 ?auto_1202840 ) ) ( not ( = ?auto_1202833 ?auto_1202841 ) ) ( not ( = ?auto_1202830 ?auto_1202834 ) ) ( not ( = ?auto_1202830 ?auto_1202836 ) ) ( not ( = ?auto_1202830 ?auto_1202835 ) ) ( not ( = ?auto_1202830 ?auto_1202837 ) ) ( not ( = ?auto_1202830 ?auto_1202838 ) ) ( not ( = ?auto_1202830 ?auto_1202839 ) ) ( not ( = ?auto_1202830 ?auto_1202840 ) ) ( not ( = ?auto_1202830 ?auto_1202841 ) ) ( not ( = ?auto_1202834 ?auto_1202836 ) ) ( not ( = ?auto_1202834 ?auto_1202835 ) ) ( not ( = ?auto_1202834 ?auto_1202837 ) ) ( not ( = ?auto_1202834 ?auto_1202838 ) ) ( not ( = ?auto_1202834 ?auto_1202839 ) ) ( not ( = ?auto_1202834 ?auto_1202840 ) ) ( not ( = ?auto_1202834 ?auto_1202841 ) ) ( not ( = ?auto_1202836 ?auto_1202835 ) ) ( not ( = ?auto_1202836 ?auto_1202837 ) ) ( not ( = ?auto_1202836 ?auto_1202838 ) ) ( not ( = ?auto_1202836 ?auto_1202839 ) ) ( not ( = ?auto_1202836 ?auto_1202840 ) ) ( not ( = ?auto_1202836 ?auto_1202841 ) ) ( not ( = ?auto_1202835 ?auto_1202837 ) ) ( not ( = ?auto_1202835 ?auto_1202838 ) ) ( not ( = ?auto_1202835 ?auto_1202839 ) ) ( not ( = ?auto_1202835 ?auto_1202840 ) ) ( not ( = ?auto_1202835 ?auto_1202841 ) ) ( not ( = ?auto_1202837 ?auto_1202838 ) ) ( not ( = ?auto_1202837 ?auto_1202839 ) ) ( not ( = ?auto_1202837 ?auto_1202840 ) ) ( not ( = ?auto_1202837 ?auto_1202841 ) ) ( not ( = ?auto_1202838 ?auto_1202839 ) ) ( not ( = ?auto_1202838 ?auto_1202840 ) ) ( not ( = ?auto_1202838 ?auto_1202841 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1202839 ?auto_1202840 ?auto_1202841 )
      ( MAKE-11CRATE-VERIFY ?auto_1202831 ?auto_1202832 ?auto_1202833 ?auto_1202830 ?auto_1202834 ?auto_1202836 ?auto_1202835 ?auto_1202837 ?auto_1202838 ?auto_1202839 ?auto_1202840 ?auto_1202841 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1202952 - SURFACE
      ?auto_1202953 - SURFACE
      ?auto_1202954 - SURFACE
      ?auto_1202951 - SURFACE
      ?auto_1202955 - SURFACE
      ?auto_1202957 - SURFACE
      ?auto_1202956 - SURFACE
      ?auto_1202958 - SURFACE
      ?auto_1202959 - SURFACE
      ?auto_1202960 - SURFACE
      ?auto_1202961 - SURFACE
      ?auto_1202962 - SURFACE
    )
    :vars
    (
      ?auto_1202963 - HOIST
      ?auto_1202965 - PLACE
      ?auto_1202966 - TRUCK
      ?auto_1202964 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1202963 ?auto_1202965 ) ( SURFACE-AT ?auto_1202961 ?auto_1202965 ) ( CLEAR ?auto_1202961 ) ( IS-CRATE ?auto_1202962 ) ( not ( = ?auto_1202961 ?auto_1202962 ) ) ( AVAILABLE ?auto_1202963 ) ( IN ?auto_1202962 ?auto_1202966 ) ( ON ?auto_1202961 ?auto_1202960 ) ( not ( = ?auto_1202960 ?auto_1202961 ) ) ( not ( = ?auto_1202960 ?auto_1202962 ) ) ( TRUCK-AT ?auto_1202966 ?auto_1202964 ) ( not ( = ?auto_1202964 ?auto_1202965 ) ) ( ON ?auto_1202953 ?auto_1202952 ) ( ON ?auto_1202954 ?auto_1202953 ) ( ON ?auto_1202951 ?auto_1202954 ) ( ON ?auto_1202955 ?auto_1202951 ) ( ON ?auto_1202957 ?auto_1202955 ) ( ON ?auto_1202956 ?auto_1202957 ) ( ON ?auto_1202958 ?auto_1202956 ) ( ON ?auto_1202959 ?auto_1202958 ) ( ON ?auto_1202960 ?auto_1202959 ) ( not ( = ?auto_1202952 ?auto_1202953 ) ) ( not ( = ?auto_1202952 ?auto_1202954 ) ) ( not ( = ?auto_1202952 ?auto_1202951 ) ) ( not ( = ?auto_1202952 ?auto_1202955 ) ) ( not ( = ?auto_1202952 ?auto_1202957 ) ) ( not ( = ?auto_1202952 ?auto_1202956 ) ) ( not ( = ?auto_1202952 ?auto_1202958 ) ) ( not ( = ?auto_1202952 ?auto_1202959 ) ) ( not ( = ?auto_1202952 ?auto_1202960 ) ) ( not ( = ?auto_1202952 ?auto_1202961 ) ) ( not ( = ?auto_1202952 ?auto_1202962 ) ) ( not ( = ?auto_1202953 ?auto_1202954 ) ) ( not ( = ?auto_1202953 ?auto_1202951 ) ) ( not ( = ?auto_1202953 ?auto_1202955 ) ) ( not ( = ?auto_1202953 ?auto_1202957 ) ) ( not ( = ?auto_1202953 ?auto_1202956 ) ) ( not ( = ?auto_1202953 ?auto_1202958 ) ) ( not ( = ?auto_1202953 ?auto_1202959 ) ) ( not ( = ?auto_1202953 ?auto_1202960 ) ) ( not ( = ?auto_1202953 ?auto_1202961 ) ) ( not ( = ?auto_1202953 ?auto_1202962 ) ) ( not ( = ?auto_1202954 ?auto_1202951 ) ) ( not ( = ?auto_1202954 ?auto_1202955 ) ) ( not ( = ?auto_1202954 ?auto_1202957 ) ) ( not ( = ?auto_1202954 ?auto_1202956 ) ) ( not ( = ?auto_1202954 ?auto_1202958 ) ) ( not ( = ?auto_1202954 ?auto_1202959 ) ) ( not ( = ?auto_1202954 ?auto_1202960 ) ) ( not ( = ?auto_1202954 ?auto_1202961 ) ) ( not ( = ?auto_1202954 ?auto_1202962 ) ) ( not ( = ?auto_1202951 ?auto_1202955 ) ) ( not ( = ?auto_1202951 ?auto_1202957 ) ) ( not ( = ?auto_1202951 ?auto_1202956 ) ) ( not ( = ?auto_1202951 ?auto_1202958 ) ) ( not ( = ?auto_1202951 ?auto_1202959 ) ) ( not ( = ?auto_1202951 ?auto_1202960 ) ) ( not ( = ?auto_1202951 ?auto_1202961 ) ) ( not ( = ?auto_1202951 ?auto_1202962 ) ) ( not ( = ?auto_1202955 ?auto_1202957 ) ) ( not ( = ?auto_1202955 ?auto_1202956 ) ) ( not ( = ?auto_1202955 ?auto_1202958 ) ) ( not ( = ?auto_1202955 ?auto_1202959 ) ) ( not ( = ?auto_1202955 ?auto_1202960 ) ) ( not ( = ?auto_1202955 ?auto_1202961 ) ) ( not ( = ?auto_1202955 ?auto_1202962 ) ) ( not ( = ?auto_1202957 ?auto_1202956 ) ) ( not ( = ?auto_1202957 ?auto_1202958 ) ) ( not ( = ?auto_1202957 ?auto_1202959 ) ) ( not ( = ?auto_1202957 ?auto_1202960 ) ) ( not ( = ?auto_1202957 ?auto_1202961 ) ) ( not ( = ?auto_1202957 ?auto_1202962 ) ) ( not ( = ?auto_1202956 ?auto_1202958 ) ) ( not ( = ?auto_1202956 ?auto_1202959 ) ) ( not ( = ?auto_1202956 ?auto_1202960 ) ) ( not ( = ?auto_1202956 ?auto_1202961 ) ) ( not ( = ?auto_1202956 ?auto_1202962 ) ) ( not ( = ?auto_1202958 ?auto_1202959 ) ) ( not ( = ?auto_1202958 ?auto_1202960 ) ) ( not ( = ?auto_1202958 ?auto_1202961 ) ) ( not ( = ?auto_1202958 ?auto_1202962 ) ) ( not ( = ?auto_1202959 ?auto_1202960 ) ) ( not ( = ?auto_1202959 ?auto_1202961 ) ) ( not ( = ?auto_1202959 ?auto_1202962 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1202960 ?auto_1202961 ?auto_1202962 )
      ( MAKE-11CRATE-VERIFY ?auto_1202952 ?auto_1202953 ?auto_1202954 ?auto_1202951 ?auto_1202955 ?auto_1202957 ?auto_1202956 ?auto_1202958 ?auto_1202959 ?auto_1202960 ?auto_1202961 ?auto_1202962 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1203084 - SURFACE
      ?auto_1203085 - SURFACE
      ?auto_1203086 - SURFACE
      ?auto_1203083 - SURFACE
      ?auto_1203087 - SURFACE
      ?auto_1203089 - SURFACE
      ?auto_1203088 - SURFACE
      ?auto_1203090 - SURFACE
      ?auto_1203091 - SURFACE
      ?auto_1203092 - SURFACE
      ?auto_1203093 - SURFACE
      ?auto_1203094 - SURFACE
    )
    :vars
    (
      ?auto_1203099 - HOIST
      ?auto_1203095 - PLACE
      ?auto_1203098 - TRUCK
      ?auto_1203097 - PLACE
      ?auto_1203096 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1203099 ?auto_1203095 ) ( SURFACE-AT ?auto_1203093 ?auto_1203095 ) ( CLEAR ?auto_1203093 ) ( IS-CRATE ?auto_1203094 ) ( not ( = ?auto_1203093 ?auto_1203094 ) ) ( AVAILABLE ?auto_1203099 ) ( ON ?auto_1203093 ?auto_1203092 ) ( not ( = ?auto_1203092 ?auto_1203093 ) ) ( not ( = ?auto_1203092 ?auto_1203094 ) ) ( TRUCK-AT ?auto_1203098 ?auto_1203097 ) ( not ( = ?auto_1203097 ?auto_1203095 ) ) ( HOIST-AT ?auto_1203096 ?auto_1203097 ) ( LIFTING ?auto_1203096 ?auto_1203094 ) ( not ( = ?auto_1203099 ?auto_1203096 ) ) ( ON ?auto_1203085 ?auto_1203084 ) ( ON ?auto_1203086 ?auto_1203085 ) ( ON ?auto_1203083 ?auto_1203086 ) ( ON ?auto_1203087 ?auto_1203083 ) ( ON ?auto_1203089 ?auto_1203087 ) ( ON ?auto_1203088 ?auto_1203089 ) ( ON ?auto_1203090 ?auto_1203088 ) ( ON ?auto_1203091 ?auto_1203090 ) ( ON ?auto_1203092 ?auto_1203091 ) ( not ( = ?auto_1203084 ?auto_1203085 ) ) ( not ( = ?auto_1203084 ?auto_1203086 ) ) ( not ( = ?auto_1203084 ?auto_1203083 ) ) ( not ( = ?auto_1203084 ?auto_1203087 ) ) ( not ( = ?auto_1203084 ?auto_1203089 ) ) ( not ( = ?auto_1203084 ?auto_1203088 ) ) ( not ( = ?auto_1203084 ?auto_1203090 ) ) ( not ( = ?auto_1203084 ?auto_1203091 ) ) ( not ( = ?auto_1203084 ?auto_1203092 ) ) ( not ( = ?auto_1203084 ?auto_1203093 ) ) ( not ( = ?auto_1203084 ?auto_1203094 ) ) ( not ( = ?auto_1203085 ?auto_1203086 ) ) ( not ( = ?auto_1203085 ?auto_1203083 ) ) ( not ( = ?auto_1203085 ?auto_1203087 ) ) ( not ( = ?auto_1203085 ?auto_1203089 ) ) ( not ( = ?auto_1203085 ?auto_1203088 ) ) ( not ( = ?auto_1203085 ?auto_1203090 ) ) ( not ( = ?auto_1203085 ?auto_1203091 ) ) ( not ( = ?auto_1203085 ?auto_1203092 ) ) ( not ( = ?auto_1203085 ?auto_1203093 ) ) ( not ( = ?auto_1203085 ?auto_1203094 ) ) ( not ( = ?auto_1203086 ?auto_1203083 ) ) ( not ( = ?auto_1203086 ?auto_1203087 ) ) ( not ( = ?auto_1203086 ?auto_1203089 ) ) ( not ( = ?auto_1203086 ?auto_1203088 ) ) ( not ( = ?auto_1203086 ?auto_1203090 ) ) ( not ( = ?auto_1203086 ?auto_1203091 ) ) ( not ( = ?auto_1203086 ?auto_1203092 ) ) ( not ( = ?auto_1203086 ?auto_1203093 ) ) ( not ( = ?auto_1203086 ?auto_1203094 ) ) ( not ( = ?auto_1203083 ?auto_1203087 ) ) ( not ( = ?auto_1203083 ?auto_1203089 ) ) ( not ( = ?auto_1203083 ?auto_1203088 ) ) ( not ( = ?auto_1203083 ?auto_1203090 ) ) ( not ( = ?auto_1203083 ?auto_1203091 ) ) ( not ( = ?auto_1203083 ?auto_1203092 ) ) ( not ( = ?auto_1203083 ?auto_1203093 ) ) ( not ( = ?auto_1203083 ?auto_1203094 ) ) ( not ( = ?auto_1203087 ?auto_1203089 ) ) ( not ( = ?auto_1203087 ?auto_1203088 ) ) ( not ( = ?auto_1203087 ?auto_1203090 ) ) ( not ( = ?auto_1203087 ?auto_1203091 ) ) ( not ( = ?auto_1203087 ?auto_1203092 ) ) ( not ( = ?auto_1203087 ?auto_1203093 ) ) ( not ( = ?auto_1203087 ?auto_1203094 ) ) ( not ( = ?auto_1203089 ?auto_1203088 ) ) ( not ( = ?auto_1203089 ?auto_1203090 ) ) ( not ( = ?auto_1203089 ?auto_1203091 ) ) ( not ( = ?auto_1203089 ?auto_1203092 ) ) ( not ( = ?auto_1203089 ?auto_1203093 ) ) ( not ( = ?auto_1203089 ?auto_1203094 ) ) ( not ( = ?auto_1203088 ?auto_1203090 ) ) ( not ( = ?auto_1203088 ?auto_1203091 ) ) ( not ( = ?auto_1203088 ?auto_1203092 ) ) ( not ( = ?auto_1203088 ?auto_1203093 ) ) ( not ( = ?auto_1203088 ?auto_1203094 ) ) ( not ( = ?auto_1203090 ?auto_1203091 ) ) ( not ( = ?auto_1203090 ?auto_1203092 ) ) ( not ( = ?auto_1203090 ?auto_1203093 ) ) ( not ( = ?auto_1203090 ?auto_1203094 ) ) ( not ( = ?auto_1203091 ?auto_1203092 ) ) ( not ( = ?auto_1203091 ?auto_1203093 ) ) ( not ( = ?auto_1203091 ?auto_1203094 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1203092 ?auto_1203093 ?auto_1203094 )
      ( MAKE-11CRATE-VERIFY ?auto_1203084 ?auto_1203085 ?auto_1203086 ?auto_1203083 ?auto_1203087 ?auto_1203089 ?auto_1203088 ?auto_1203090 ?auto_1203091 ?auto_1203092 ?auto_1203093 ?auto_1203094 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1203227 - SURFACE
      ?auto_1203228 - SURFACE
      ?auto_1203229 - SURFACE
      ?auto_1203226 - SURFACE
      ?auto_1203230 - SURFACE
      ?auto_1203232 - SURFACE
      ?auto_1203231 - SURFACE
      ?auto_1203233 - SURFACE
      ?auto_1203234 - SURFACE
      ?auto_1203235 - SURFACE
      ?auto_1203236 - SURFACE
      ?auto_1203237 - SURFACE
    )
    :vars
    (
      ?auto_1203240 - HOIST
      ?auto_1203241 - PLACE
      ?auto_1203243 - TRUCK
      ?auto_1203242 - PLACE
      ?auto_1203239 - HOIST
      ?auto_1203238 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1203240 ?auto_1203241 ) ( SURFACE-AT ?auto_1203236 ?auto_1203241 ) ( CLEAR ?auto_1203236 ) ( IS-CRATE ?auto_1203237 ) ( not ( = ?auto_1203236 ?auto_1203237 ) ) ( AVAILABLE ?auto_1203240 ) ( ON ?auto_1203236 ?auto_1203235 ) ( not ( = ?auto_1203235 ?auto_1203236 ) ) ( not ( = ?auto_1203235 ?auto_1203237 ) ) ( TRUCK-AT ?auto_1203243 ?auto_1203242 ) ( not ( = ?auto_1203242 ?auto_1203241 ) ) ( HOIST-AT ?auto_1203239 ?auto_1203242 ) ( not ( = ?auto_1203240 ?auto_1203239 ) ) ( AVAILABLE ?auto_1203239 ) ( SURFACE-AT ?auto_1203237 ?auto_1203242 ) ( ON ?auto_1203237 ?auto_1203238 ) ( CLEAR ?auto_1203237 ) ( not ( = ?auto_1203236 ?auto_1203238 ) ) ( not ( = ?auto_1203237 ?auto_1203238 ) ) ( not ( = ?auto_1203235 ?auto_1203238 ) ) ( ON ?auto_1203228 ?auto_1203227 ) ( ON ?auto_1203229 ?auto_1203228 ) ( ON ?auto_1203226 ?auto_1203229 ) ( ON ?auto_1203230 ?auto_1203226 ) ( ON ?auto_1203232 ?auto_1203230 ) ( ON ?auto_1203231 ?auto_1203232 ) ( ON ?auto_1203233 ?auto_1203231 ) ( ON ?auto_1203234 ?auto_1203233 ) ( ON ?auto_1203235 ?auto_1203234 ) ( not ( = ?auto_1203227 ?auto_1203228 ) ) ( not ( = ?auto_1203227 ?auto_1203229 ) ) ( not ( = ?auto_1203227 ?auto_1203226 ) ) ( not ( = ?auto_1203227 ?auto_1203230 ) ) ( not ( = ?auto_1203227 ?auto_1203232 ) ) ( not ( = ?auto_1203227 ?auto_1203231 ) ) ( not ( = ?auto_1203227 ?auto_1203233 ) ) ( not ( = ?auto_1203227 ?auto_1203234 ) ) ( not ( = ?auto_1203227 ?auto_1203235 ) ) ( not ( = ?auto_1203227 ?auto_1203236 ) ) ( not ( = ?auto_1203227 ?auto_1203237 ) ) ( not ( = ?auto_1203227 ?auto_1203238 ) ) ( not ( = ?auto_1203228 ?auto_1203229 ) ) ( not ( = ?auto_1203228 ?auto_1203226 ) ) ( not ( = ?auto_1203228 ?auto_1203230 ) ) ( not ( = ?auto_1203228 ?auto_1203232 ) ) ( not ( = ?auto_1203228 ?auto_1203231 ) ) ( not ( = ?auto_1203228 ?auto_1203233 ) ) ( not ( = ?auto_1203228 ?auto_1203234 ) ) ( not ( = ?auto_1203228 ?auto_1203235 ) ) ( not ( = ?auto_1203228 ?auto_1203236 ) ) ( not ( = ?auto_1203228 ?auto_1203237 ) ) ( not ( = ?auto_1203228 ?auto_1203238 ) ) ( not ( = ?auto_1203229 ?auto_1203226 ) ) ( not ( = ?auto_1203229 ?auto_1203230 ) ) ( not ( = ?auto_1203229 ?auto_1203232 ) ) ( not ( = ?auto_1203229 ?auto_1203231 ) ) ( not ( = ?auto_1203229 ?auto_1203233 ) ) ( not ( = ?auto_1203229 ?auto_1203234 ) ) ( not ( = ?auto_1203229 ?auto_1203235 ) ) ( not ( = ?auto_1203229 ?auto_1203236 ) ) ( not ( = ?auto_1203229 ?auto_1203237 ) ) ( not ( = ?auto_1203229 ?auto_1203238 ) ) ( not ( = ?auto_1203226 ?auto_1203230 ) ) ( not ( = ?auto_1203226 ?auto_1203232 ) ) ( not ( = ?auto_1203226 ?auto_1203231 ) ) ( not ( = ?auto_1203226 ?auto_1203233 ) ) ( not ( = ?auto_1203226 ?auto_1203234 ) ) ( not ( = ?auto_1203226 ?auto_1203235 ) ) ( not ( = ?auto_1203226 ?auto_1203236 ) ) ( not ( = ?auto_1203226 ?auto_1203237 ) ) ( not ( = ?auto_1203226 ?auto_1203238 ) ) ( not ( = ?auto_1203230 ?auto_1203232 ) ) ( not ( = ?auto_1203230 ?auto_1203231 ) ) ( not ( = ?auto_1203230 ?auto_1203233 ) ) ( not ( = ?auto_1203230 ?auto_1203234 ) ) ( not ( = ?auto_1203230 ?auto_1203235 ) ) ( not ( = ?auto_1203230 ?auto_1203236 ) ) ( not ( = ?auto_1203230 ?auto_1203237 ) ) ( not ( = ?auto_1203230 ?auto_1203238 ) ) ( not ( = ?auto_1203232 ?auto_1203231 ) ) ( not ( = ?auto_1203232 ?auto_1203233 ) ) ( not ( = ?auto_1203232 ?auto_1203234 ) ) ( not ( = ?auto_1203232 ?auto_1203235 ) ) ( not ( = ?auto_1203232 ?auto_1203236 ) ) ( not ( = ?auto_1203232 ?auto_1203237 ) ) ( not ( = ?auto_1203232 ?auto_1203238 ) ) ( not ( = ?auto_1203231 ?auto_1203233 ) ) ( not ( = ?auto_1203231 ?auto_1203234 ) ) ( not ( = ?auto_1203231 ?auto_1203235 ) ) ( not ( = ?auto_1203231 ?auto_1203236 ) ) ( not ( = ?auto_1203231 ?auto_1203237 ) ) ( not ( = ?auto_1203231 ?auto_1203238 ) ) ( not ( = ?auto_1203233 ?auto_1203234 ) ) ( not ( = ?auto_1203233 ?auto_1203235 ) ) ( not ( = ?auto_1203233 ?auto_1203236 ) ) ( not ( = ?auto_1203233 ?auto_1203237 ) ) ( not ( = ?auto_1203233 ?auto_1203238 ) ) ( not ( = ?auto_1203234 ?auto_1203235 ) ) ( not ( = ?auto_1203234 ?auto_1203236 ) ) ( not ( = ?auto_1203234 ?auto_1203237 ) ) ( not ( = ?auto_1203234 ?auto_1203238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1203235 ?auto_1203236 ?auto_1203237 )
      ( MAKE-11CRATE-VERIFY ?auto_1203227 ?auto_1203228 ?auto_1203229 ?auto_1203226 ?auto_1203230 ?auto_1203232 ?auto_1203231 ?auto_1203233 ?auto_1203234 ?auto_1203235 ?auto_1203236 ?auto_1203237 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1203371 - SURFACE
      ?auto_1203372 - SURFACE
      ?auto_1203373 - SURFACE
      ?auto_1203370 - SURFACE
      ?auto_1203374 - SURFACE
      ?auto_1203376 - SURFACE
      ?auto_1203375 - SURFACE
      ?auto_1203377 - SURFACE
      ?auto_1203378 - SURFACE
      ?auto_1203379 - SURFACE
      ?auto_1203380 - SURFACE
      ?auto_1203381 - SURFACE
    )
    :vars
    (
      ?auto_1203384 - HOIST
      ?auto_1203386 - PLACE
      ?auto_1203383 - PLACE
      ?auto_1203382 - HOIST
      ?auto_1203387 - SURFACE
      ?auto_1203385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1203384 ?auto_1203386 ) ( SURFACE-AT ?auto_1203380 ?auto_1203386 ) ( CLEAR ?auto_1203380 ) ( IS-CRATE ?auto_1203381 ) ( not ( = ?auto_1203380 ?auto_1203381 ) ) ( AVAILABLE ?auto_1203384 ) ( ON ?auto_1203380 ?auto_1203379 ) ( not ( = ?auto_1203379 ?auto_1203380 ) ) ( not ( = ?auto_1203379 ?auto_1203381 ) ) ( not ( = ?auto_1203383 ?auto_1203386 ) ) ( HOIST-AT ?auto_1203382 ?auto_1203383 ) ( not ( = ?auto_1203384 ?auto_1203382 ) ) ( AVAILABLE ?auto_1203382 ) ( SURFACE-AT ?auto_1203381 ?auto_1203383 ) ( ON ?auto_1203381 ?auto_1203387 ) ( CLEAR ?auto_1203381 ) ( not ( = ?auto_1203380 ?auto_1203387 ) ) ( not ( = ?auto_1203381 ?auto_1203387 ) ) ( not ( = ?auto_1203379 ?auto_1203387 ) ) ( TRUCK-AT ?auto_1203385 ?auto_1203386 ) ( ON ?auto_1203372 ?auto_1203371 ) ( ON ?auto_1203373 ?auto_1203372 ) ( ON ?auto_1203370 ?auto_1203373 ) ( ON ?auto_1203374 ?auto_1203370 ) ( ON ?auto_1203376 ?auto_1203374 ) ( ON ?auto_1203375 ?auto_1203376 ) ( ON ?auto_1203377 ?auto_1203375 ) ( ON ?auto_1203378 ?auto_1203377 ) ( ON ?auto_1203379 ?auto_1203378 ) ( not ( = ?auto_1203371 ?auto_1203372 ) ) ( not ( = ?auto_1203371 ?auto_1203373 ) ) ( not ( = ?auto_1203371 ?auto_1203370 ) ) ( not ( = ?auto_1203371 ?auto_1203374 ) ) ( not ( = ?auto_1203371 ?auto_1203376 ) ) ( not ( = ?auto_1203371 ?auto_1203375 ) ) ( not ( = ?auto_1203371 ?auto_1203377 ) ) ( not ( = ?auto_1203371 ?auto_1203378 ) ) ( not ( = ?auto_1203371 ?auto_1203379 ) ) ( not ( = ?auto_1203371 ?auto_1203380 ) ) ( not ( = ?auto_1203371 ?auto_1203381 ) ) ( not ( = ?auto_1203371 ?auto_1203387 ) ) ( not ( = ?auto_1203372 ?auto_1203373 ) ) ( not ( = ?auto_1203372 ?auto_1203370 ) ) ( not ( = ?auto_1203372 ?auto_1203374 ) ) ( not ( = ?auto_1203372 ?auto_1203376 ) ) ( not ( = ?auto_1203372 ?auto_1203375 ) ) ( not ( = ?auto_1203372 ?auto_1203377 ) ) ( not ( = ?auto_1203372 ?auto_1203378 ) ) ( not ( = ?auto_1203372 ?auto_1203379 ) ) ( not ( = ?auto_1203372 ?auto_1203380 ) ) ( not ( = ?auto_1203372 ?auto_1203381 ) ) ( not ( = ?auto_1203372 ?auto_1203387 ) ) ( not ( = ?auto_1203373 ?auto_1203370 ) ) ( not ( = ?auto_1203373 ?auto_1203374 ) ) ( not ( = ?auto_1203373 ?auto_1203376 ) ) ( not ( = ?auto_1203373 ?auto_1203375 ) ) ( not ( = ?auto_1203373 ?auto_1203377 ) ) ( not ( = ?auto_1203373 ?auto_1203378 ) ) ( not ( = ?auto_1203373 ?auto_1203379 ) ) ( not ( = ?auto_1203373 ?auto_1203380 ) ) ( not ( = ?auto_1203373 ?auto_1203381 ) ) ( not ( = ?auto_1203373 ?auto_1203387 ) ) ( not ( = ?auto_1203370 ?auto_1203374 ) ) ( not ( = ?auto_1203370 ?auto_1203376 ) ) ( not ( = ?auto_1203370 ?auto_1203375 ) ) ( not ( = ?auto_1203370 ?auto_1203377 ) ) ( not ( = ?auto_1203370 ?auto_1203378 ) ) ( not ( = ?auto_1203370 ?auto_1203379 ) ) ( not ( = ?auto_1203370 ?auto_1203380 ) ) ( not ( = ?auto_1203370 ?auto_1203381 ) ) ( not ( = ?auto_1203370 ?auto_1203387 ) ) ( not ( = ?auto_1203374 ?auto_1203376 ) ) ( not ( = ?auto_1203374 ?auto_1203375 ) ) ( not ( = ?auto_1203374 ?auto_1203377 ) ) ( not ( = ?auto_1203374 ?auto_1203378 ) ) ( not ( = ?auto_1203374 ?auto_1203379 ) ) ( not ( = ?auto_1203374 ?auto_1203380 ) ) ( not ( = ?auto_1203374 ?auto_1203381 ) ) ( not ( = ?auto_1203374 ?auto_1203387 ) ) ( not ( = ?auto_1203376 ?auto_1203375 ) ) ( not ( = ?auto_1203376 ?auto_1203377 ) ) ( not ( = ?auto_1203376 ?auto_1203378 ) ) ( not ( = ?auto_1203376 ?auto_1203379 ) ) ( not ( = ?auto_1203376 ?auto_1203380 ) ) ( not ( = ?auto_1203376 ?auto_1203381 ) ) ( not ( = ?auto_1203376 ?auto_1203387 ) ) ( not ( = ?auto_1203375 ?auto_1203377 ) ) ( not ( = ?auto_1203375 ?auto_1203378 ) ) ( not ( = ?auto_1203375 ?auto_1203379 ) ) ( not ( = ?auto_1203375 ?auto_1203380 ) ) ( not ( = ?auto_1203375 ?auto_1203381 ) ) ( not ( = ?auto_1203375 ?auto_1203387 ) ) ( not ( = ?auto_1203377 ?auto_1203378 ) ) ( not ( = ?auto_1203377 ?auto_1203379 ) ) ( not ( = ?auto_1203377 ?auto_1203380 ) ) ( not ( = ?auto_1203377 ?auto_1203381 ) ) ( not ( = ?auto_1203377 ?auto_1203387 ) ) ( not ( = ?auto_1203378 ?auto_1203379 ) ) ( not ( = ?auto_1203378 ?auto_1203380 ) ) ( not ( = ?auto_1203378 ?auto_1203381 ) ) ( not ( = ?auto_1203378 ?auto_1203387 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1203379 ?auto_1203380 ?auto_1203381 )
      ( MAKE-11CRATE-VERIFY ?auto_1203371 ?auto_1203372 ?auto_1203373 ?auto_1203370 ?auto_1203374 ?auto_1203376 ?auto_1203375 ?auto_1203377 ?auto_1203378 ?auto_1203379 ?auto_1203380 ?auto_1203381 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1203515 - SURFACE
      ?auto_1203516 - SURFACE
      ?auto_1203517 - SURFACE
      ?auto_1203514 - SURFACE
      ?auto_1203518 - SURFACE
      ?auto_1203520 - SURFACE
      ?auto_1203519 - SURFACE
      ?auto_1203521 - SURFACE
      ?auto_1203522 - SURFACE
      ?auto_1203523 - SURFACE
      ?auto_1203524 - SURFACE
      ?auto_1203525 - SURFACE
    )
    :vars
    (
      ?auto_1203527 - HOIST
      ?auto_1203531 - PLACE
      ?auto_1203528 - PLACE
      ?auto_1203530 - HOIST
      ?auto_1203526 - SURFACE
      ?auto_1203529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1203527 ?auto_1203531 ) ( IS-CRATE ?auto_1203525 ) ( not ( = ?auto_1203524 ?auto_1203525 ) ) ( not ( = ?auto_1203523 ?auto_1203524 ) ) ( not ( = ?auto_1203523 ?auto_1203525 ) ) ( not ( = ?auto_1203528 ?auto_1203531 ) ) ( HOIST-AT ?auto_1203530 ?auto_1203528 ) ( not ( = ?auto_1203527 ?auto_1203530 ) ) ( AVAILABLE ?auto_1203530 ) ( SURFACE-AT ?auto_1203525 ?auto_1203528 ) ( ON ?auto_1203525 ?auto_1203526 ) ( CLEAR ?auto_1203525 ) ( not ( = ?auto_1203524 ?auto_1203526 ) ) ( not ( = ?auto_1203525 ?auto_1203526 ) ) ( not ( = ?auto_1203523 ?auto_1203526 ) ) ( TRUCK-AT ?auto_1203529 ?auto_1203531 ) ( SURFACE-AT ?auto_1203523 ?auto_1203531 ) ( CLEAR ?auto_1203523 ) ( LIFTING ?auto_1203527 ?auto_1203524 ) ( IS-CRATE ?auto_1203524 ) ( ON ?auto_1203516 ?auto_1203515 ) ( ON ?auto_1203517 ?auto_1203516 ) ( ON ?auto_1203514 ?auto_1203517 ) ( ON ?auto_1203518 ?auto_1203514 ) ( ON ?auto_1203520 ?auto_1203518 ) ( ON ?auto_1203519 ?auto_1203520 ) ( ON ?auto_1203521 ?auto_1203519 ) ( ON ?auto_1203522 ?auto_1203521 ) ( ON ?auto_1203523 ?auto_1203522 ) ( not ( = ?auto_1203515 ?auto_1203516 ) ) ( not ( = ?auto_1203515 ?auto_1203517 ) ) ( not ( = ?auto_1203515 ?auto_1203514 ) ) ( not ( = ?auto_1203515 ?auto_1203518 ) ) ( not ( = ?auto_1203515 ?auto_1203520 ) ) ( not ( = ?auto_1203515 ?auto_1203519 ) ) ( not ( = ?auto_1203515 ?auto_1203521 ) ) ( not ( = ?auto_1203515 ?auto_1203522 ) ) ( not ( = ?auto_1203515 ?auto_1203523 ) ) ( not ( = ?auto_1203515 ?auto_1203524 ) ) ( not ( = ?auto_1203515 ?auto_1203525 ) ) ( not ( = ?auto_1203515 ?auto_1203526 ) ) ( not ( = ?auto_1203516 ?auto_1203517 ) ) ( not ( = ?auto_1203516 ?auto_1203514 ) ) ( not ( = ?auto_1203516 ?auto_1203518 ) ) ( not ( = ?auto_1203516 ?auto_1203520 ) ) ( not ( = ?auto_1203516 ?auto_1203519 ) ) ( not ( = ?auto_1203516 ?auto_1203521 ) ) ( not ( = ?auto_1203516 ?auto_1203522 ) ) ( not ( = ?auto_1203516 ?auto_1203523 ) ) ( not ( = ?auto_1203516 ?auto_1203524 ) ) ( not ( = ?auto_1203516 ?auto_1203525 ) ) ( not ( = ?auto_1203516 ?auto_1203526 ) ) ( not ( = ?auto_1203517 ?auto_1203514 ) ) ( not ( = ?auto_1203517 ?auto_1203518 ) ) ( not ( = ?auto_1203517 ?auto_1203520 ) ) ( not ( = ?auto_1203517 ?auto_1203519 ) ) ( not ( = ?auto_1203517 ?auto_1203521 ) ) ( not ( = ?auto_1203517 ?auto_1203522 ) ) ( not ( = ?auto_1203517 ?auto_1203523 ) ) ( not ( = ?auto_1203517 ?auto_1203524 ) ) ( not ( = ?auto_1203517 ?auto_1203525 ) ) ( not ( = ?auto_1203517 ?auto_1203526 ) ) ( not ( = ?auto_1203514 ?auto_1203518 ) ) ( not ( = ?auto_1203514 ?auto_1203520 ) ) ( not ( = ?auto_1203514 ?auto_1203519 ) ) ( not ( = ?auto_1203514 ?auto_1203521 ) ) ( not ( = ?auto_1203514 ?auto_1203522 ) ) ( not ( = ?auto_1203514 ?auto_1203523 ) ) ( not ( = ?auto_1203514 ?auto_1203524 ) ) ( not ( = ?auto_1203514 ?auto_1203525 ) ) ( not ( = ?auto_1203514 ?auto_1203526 ) ) ( not ( = ?auto_1203518 ?auto_1203520 ) ) ( not ( = ?auto_1203518 ?auto_1203519 ) ) ( not ( = ?auto_1203518 ?auto_1203521 ) ) ( not ( = ?auto_1203518 ?auto_1203522 ) ) ( not ( = ?auto_1203518 ?auto_1203523 ) ) ( not ( = ?auto_1203518 ?auto_1203524 ) ) ( not ( = ?auto_1203518 ?auto_1203525 ) ) ( not ( = ?auto_1203518 ?auto_1203526 ) ) ( not ( = ?auto_1203520 ?auto_1203519 ) ) ( not ( = ?auto_1203520 ?auto_1203521 ) ) ( not ( = ?auto_1203520 ?auto_1203522 ) ) ( not ( = ?auto_1203520 ?auto_1203523 ) ) ( not ( = ?auto_1203520 ?auto_1203524 ) ) ( not ( = ?auto_1203520 ?auto_1203525 ) ) ( not ( = ?auto_1203520 ?auto_1203526 ) ) ( not ( = ?auto_1203519 ?auto_1203521 ) ) ( not ( = ?auto_1203519 ?auto_1203522 ) ) ( not ( = ?auto_1203519 ?auto_1203523 ) ) ( not ( = ?auto_1203519 ?auto_1203524 ) ) ( not ( = ?auto_1203519 ?auto_1203525 ) ) ( not ( = ?auto_1203519 ?auto_1203526 ) ) ( not ( = ?auto_1203521 ?auto_1203522 ) ) ( not ( = ?auto_1203521 ?auto_1203523 ) ) ( not ( = ?auto_1203521 ?auto_1203524 ) ) ( not ( = ?auto_1203521 ?auto_1203525 ) ) ( not ( = ?auto_1203521 ?auto_1203526 ) ) ( not ( = ?auto_1203522 ?auto_1203523 ) ) ( not ( = ?auto_1203522 ?auto_1203524 ) ) ( not ( = ?auto_1203522 ?auto_1203525 ) ) ( not ( = ?auto_1203522 ?auto_1203526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1203523 ?auto_1203524 ?auto_1203525 )
      ( MAKE-11CRATE-VERIFY ?auto_1203515 ?auto_1203516 ?auto_1203517 ?auto_1203514 ?auto_1203518 ?auto_1203520 ?auto_1203519 ?auto_1203521 ?auto_1203522 ?auto_1203523 ?auto_1203524 ?auto_1203525 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1203659 - SURFACE
      ?auto_1203660 - SURFACE
      ?auto_1203661 - SURFACE
      ?auto_1203658 - SURFACE
      ?auto_1203662 - SURFACE
      ?auto_1203664 - SURFACE
      ?auto_1203663 - SURFACE
      ?auto_1203665 - SURFACE
      ?auto_1203666 - SURFACE
      ?auto_1203667 - SURFACE
      ?auto_1203668 - SURFACE
      ?auto_1203669 - SURFACE
    )
    :vars
    (
      ?auto_1203674 - HOIST
      ?auto_1203675 - PLACE
      ?auto_1203670 - PLACE
      ?auto_1203671 - HOIST
      ?auto_1203672 - SURFACE
      ?auto_1203673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1203674 ?auto_1203675 ) ( IS-CRATE ?auto_1203669 ) ( not ( = ?auto_1203668 ?auto_1203669 ) ) ( not ( = ?auto_1203667 ?auto_1203668 ) ) ( not ( = ?auto_1203667 ?auto_1203669 ) ) ( not ( = ?auto_1203670 ?auto_1203675 ) ) ( HOIST-AT ?auto_1203671 ?auto_1203670 ) ( not ( = ?auto_1203674 ?auto_1203671 ) ) ( AVAILABLE ?auto_1203671 ) ( SURFACE-AT ?auto_1203669 ?auto_1203670 ) ( ON ?auto_1203669 ?auto_1203672 ) ( CLEAR ?auto_1203669 ) ( not ( = ?auto_1203668 ?auto_1203672 ) ) ( not ( = ?auto_1203669 ?auto_1203672 ) ) ( not ( = ?auto_1203667 ?auto_1203672 ) ) ( TRUCK-AT ?auto_1203673 ?auto_1203675 ) ( SURFACE-AT ?auto_1203667 ?auto_1203675 ) ( CLEAR ?auto_1203667 ) ( IS-CRATE ?auto_1203668 ) ( AVAILABLE ?auto_1203674 ) ( IN ?auto_1203668 ?auto_1203673 ) ( ON ?auto_1203660 ?auto_1203659 ) ( ON ?auto_1203661 ?auto_1203660 ) ( ON ?auto_1203658 ?auto_1203661 ) ( ON ?auto_1203662 ?auto_1203658 ) ( ON ?auto_1203664 ?auto_1203662 ) ( ON ?auto_1203663 ?auto_1203664 ) ( ON ?auto_1203665 ?auto_1203663 ) ( ON ?auto_1203666 ?auto_1203665 ) ( ON ?auto_1203667 ?auto_1203666 ) ( not ( = ?auto_1203659 ?auto_1203660 ) ) ( not ( = ?auto_1203659 ?auto_1203661 ) ) ( not ( = ?auto_1203659 ?auto_1203658 ) ) ( not ( = ?auto_1203659 ?auto_1203662 ) ) ( not ( = ?auto_1203659 ?auto_1203664 ) ) ( not ( = ?auto_1203659 ?auto_1203663 ) ) ( not ( = ?auto_1203659 ?auto_1203665 ) ) ( not ( = ?auto_1203659 ?auto_1203666 ) ) ( not ( = ?auto_1203659 ?auto_1203667 ) ) ( not ( = ?auto_1203659 ?auto_1203668 ) ) ( not ( = ?auto_1203659 ?auto_1203669 ) ) ( not ( = ?auto_1203659 ?auto_1203672 ) ) ( not ( = ?auto_1203660 ?auto_1203661 ) ) ( not ( = ?auto_1203660 ?auto_1203658 ) ) ( not ( = ?auto_1203660 ?auto_1203662 ) ) ( not ( = ?auto_1203660 ?auto_1203664 ) ) ( not ( = ?auto_1203660 ?auto_1203663 ) ) ( not ( = ?auto_1203660 ?auto_1203665 ) ) ( not ( = ?auto_1203660 ?auto_1203666 ) ) ( not ( = ?auto_1203660 ?auto_1203667 ) ) ( not ( = ?auto_1203660 ?auto_1203668 ) ) ( not ( = ?auto_1203660 ?auto_1203669 ) ) ( not ( = ?auto_1203660 ?auto_1203672 ) ) ( not ( = ?auto_1203661 ?auto_1203658 ) ) ( not ( = ?auto_1203661 ?auto_1203662 ) ) ( not ( = ?auto_1203661 ?auto_1203664 ) ) ( not ( = ?auto_1203661 ?auto_1203663 ) ) ( not ( = ?auto_1203661 ?auto_1203665 ) ) ( not ( = ?auto_1203661 ?auto_1203666 ) ) ( not ( = ?auto_1203661 ?auto_1203667 ) ) ( not ( = ?auto_1203661 ?auto_1203668 ) ) ( not ( = ?auto_1203661 ?auto_1203669 ) ) ( not ( = ?auto_1203661 ?auto_1203672 ) ) ( not ( = ?auto_1203658 ?auto_1203662 ) ) ( not ( = ?auto_1203658 ?auto_1203664 ) ) ( not ( = ?auto_1203658 ?auto_1203663 ) ) ( not ( = ?auto_1203658 ?auto_1203665 ) ) ( not ( = ?auto_1203658 ?auto_1203666 ) ) ( not ( = ?auto_1203658 ?auto_1203667 ) ) ( not ( = ?auto_1203658 ?auto_1203668 ) ) ( not ( = ?auto_1203658 ?auto_1203669 ) ) ( not ( = ?auto_1203658 ?auto_1203672 ) ) ( not ( = ?auto_1203662 ?auto_1203664 ) ) ( not ( = ?auto_1203662 ?auto_1203663 ) ) ( not ( = ?auto_1203662 ?auto_1203665 ) ) ( not ( = ?auto_1203662 ?auto_1203666 ) ) ( not ( = ?auto_1203662 ?auto_1203667 ) ) ( not ( = ?auto_1203662 ?auto_1203668 ) ) ( not ( = ?auto_1203662 ?auto_1203669 ) ) ( not ( = ?auto_1203662 ?auto_1203672 ) ) ( not ( = ?auto_1203664 ?auto_1203663 ) ) ( not ( = ?auto_1203664 ?auto_1203665 ) ) ( not ( = ?auto_1203664 ?auto_1203666 ) ) ( not ( = ?auto_1203664 ?auto_1203667 ) ) ( not ( = ?auto_1203664 ?auto_1203668 ) ) ( not ( = ?auto_1203664 ?auto_1203669 ) ) ( not ( = ?auto_1203664 ?auto_1203672 ) ) ( not ( = ?auto_1203663 ?auto_1203665 ) ) ( not ( = ?auto_1203663 ?auto_1203666 ) ) ( not ( = ?auto_1203663 ?auto_1203667 ) ) ( not ( = ?auto_1203663 ?auto_1203668 ) ) ( not ( = ?auto_1203663 ?auto_1203669 ) ) ( not ( = ?auto_1203663 ?auto_1203672 ) ) ( not ( = ?auto_1203665 ?auto_1203666 ) ) ( not ( = ?auto_1203665 ?auto_1203667 ) ) ( not ( = ?auto_1203665 ?auto_1203668 ) ) ( not ( = ?auto_1203665 ?auto_1203669 ) ) ( not ( = ?auto_1203665 ?auto_1203672 ) ) ( not ( = ?auto_1203666 ?auto_1203667 ) ) ( not ( = ?auto_1203666 ?auto_1203668 ) ) ( not ( = ?auto_1203666 ?auto_1203669 ) ) ( not ( = ?auto_1203666 ?auto_1203672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1203667 ?auto_1203668 ?auto_1203669 )
      ( MAKE-11CRATE-VERIFY ?auto_1203659 ?auto_1203660 ?auto_1203661 ?auto_1203658 ?auto_1203662 ?auto_1203664 ?auto_1203663 ?auto_1203665 ?auto_1203666 ?auto_1203667 ?auto_1203668 ?auto_1203669 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1212929 - SURFACE
      ?auto_1212930 - SURFACE
      ?auto_1212931 - SURFACE
      ?auto_1212928 - SURFACE
      ?auto_1212932 - SURFACE
      ?auto_1212934 - SURFACE
      ?auto_1212933 - SURFACE
      ?auto_1212935 - SURFACE
      ?auto_1212936 - SURFACE
      ?auto_1212937 - SURFACE
      ?auto_1212938 - SURFACE
      ?auto_1212939 - SURFACE
      ?auto_1212940 - SURFACE
    )
    :vars
    (
      ?auto_1212941 - HOIST
      ?auto_1212942 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1212941 ?auto_1212942 ) ( SURFACE-AT ?auto_1212939 ?auto_1212942 ) ( CLEAR ?auto_1212939 ) ( LIFTING ?auto_1212941 ?auto_1212940 ) ( IS-CRATE ?auto_1212940 ) ( not ( = ?auto_1212939 ?auto_1212940 ) ) ( ON ?auto_1212930 ?auto_1212929 ) ( ON ?auto_1212931 ?auto_1212930 ) ( ON ?auto_1212928 ?auto_1212931 ) ( ON ?auto_1212932 ?auto_1212928 ) ( ON ?auto_1212934 ?auto_1212932 ) ( ON ?auto_1212933 ?auto_1212934 ) ( ON ?auto_1212935 ?auto_1212933 ) ( ON ?auto_1212936 ?auto_1212935 ) ( ON ?auto_1212937 ?auto_1212936 ) ( ON ?auto_1212938 ?auto_1212937 ) ( ON ?auto_1212939 ?auto_1212938 ) ( not ( = ?auto_1212929 ?auto_1212930 ) ) ( not ( = ?auto_1212929 ?auto_1212931 ) ) ( not ( = ?auto_1212929 ?auto_1212928 ) ) ( not ( = ?auto_1212929 ?auto_1212932 ) ) ( not ( = ?auto_1212929 ?auto_1212934 ) ) ( not ( = ?auto_1212929 ?auto_1212933 ) ) ( not ( = ?auto_1212929 ?auto_1212935 ) ) ( not ( = ?auto_1212929 ?auto_1212936 ) ) ( not ( = ?auto_1212929 ?auto_1212937 ) ) ( not ( = ?auto_1212929 ?auto_1212938 ) ) ( not ( = ?auto_1212929 ?auto_1212939 ) ) ( not ( = ?auto_1212929 ?auto_1212940 ) ) ( not ( = ?auto_1212930 ?auto_1212931 ) ) ( not ( = ?auto_1212930 ?auto_1212928 ) ) ( not ( = ?auto_1212930 ?auto_1212932 ) ) ( not ( = ?auto_1212930 ?auto_1212934 ) ) ( not ( = ?auto_1212930 ?auto_1212933 ) ) ( not ( = ?auto_1212930 ?auto_1212935 ) ) ( not ( = ?auto_1212930 ?auto_1212936 ) ) ( not ( = ?auto_1212930 ?auto_1212937 ) ) ( not ( = ?auto_1212930 ?auto_1212938 ) ) ( not ( = ?auto_1212930 ?auto_1212939 ) ) ( not ( = ?auto_1212930 ?auto_1212940 ) ) ( not ( = ?auto_1212931 ?auto_1212928 ) ) ( not ( = ?auto_1212931 ?auto_1212932 ) ) ( not ( = ?auto_1212931 ?auto_1212934 ) ) ( not ( = ?auto_1212931 ?auto_1212933 ) ) ( not ( = ?auto_1212931 ?auto_1212935 ) ) ( not ( = ?auto_1212931 ?auto_1212936 ) ) ( not ( = ?auto_1212931 ?auto_1212937 ) ) ( not ( = ?auto_1212931 ?auto_1212938 ) ) ( not ( = ?auto_1212931 ?auto_1212939 ) ) ( not ( = ?auto_1212931 ?auto_1212940 ) ) ( not ( = ?auto_1212928 ?auto_1212932 ) ) ( not ( = ?auto_1212928 ?auto_1212934 ) ) ( not ( = ?auto_1212928 ?auto_1212933 ) ) ( not ( = ?auto_1212928 ?auto_1212935 ) ) ( not ( = ?auto_1212928 ?auto_1212936 ) ) ( not ( = ?auto_1212928 ?auto_1212937 ) ) ( not ( = ?auto_1212928 ?auto_1212938 ) ) ( not ( = ?auto_1212928 ?auto_1212939 ) ) ( not ( = ?auto_1212928 ?auto_1212940 ) ) ( not ( = ?auto_1212932 ?auto_1212934 ) ) ( not ( = ?auto_1212932 ?auto_1212933 ) ) ( not ( = ?auto_1212932 ?auto_1212935 ) ) ( not ( = ?auto_1212932 ?auto_1212936 ) ) ( not ( = ?auto_1212932 ?auto_1212937 ) ) ( not ( = ?auto_1212932 ?auto_1212938 ) ) ( not ( = ?auto_1212932 ?auto_1212939 ) ) ( not ( = ?auto_1212932 ?auto_1212940 ) ) ( not ( = ?auto_1212934 ?auto_1212933 ) ) ( not ( = ?auto_1212934 ?auto_1212935 ) ) ( not ( = ?auto_1212934 ?auto_1212936 ) ) ( not ( = ?auto_1212934 ?auto_1212937 ) ) ( not ( = ?auto_1212934 ?auto_1212938 ) ) ( not ( = ?auto_1212934 ?auto_1212939 ) ) ( not ( = ?auto_1212934 ?auto_1212940 ) ) ( not ( = ?auto_1212933 ?auto_1212935 ) ) ( not ( = ?auto_1212933 ?auto_1212936 ) ) ( not ( = ?auto_1212933 ?auto_1212937 ) ) ( not ( = ?auto_1212933 ?auto_1212938 ) ) ( not ( = ?auto_1212933 ?auto_1212939 ) ) ( not ( = ?auto_1212933 ?auto_1212940 ) ) ( not ( = ?auto_1212935 ?auto_1212936 ) ) ( not ( = ?auto_1212935 ?auto_1212937 ) ) ( not ( = ?auto_1212935 ?auto_1212938 ) ) ( not ( = ?auto_1212935 ?auto_1212939 ) ) ( not ( = ?auto_1212935 ?auto_1212940 ) ) ( not ( = ?auto_1212936 ?auto_1212937 ) ) ( not ( = ?auto_1212936 ?auto_1212938 ) ) ( not ( = ?auto_1212936 ?auto_1212939 ) ) ( not ( = ?auto_1212936 ?auto_1212940 ) ) ( not ( = ?auto_1212937 ?auto_1212938 ) ) ( not ( = ?auto_1212937 ?auto_1212939 ) ) ( not ( = ?auto_1212937 ?auto_1212940 ) ) ( not ( = ?auto_1212938 ?auto_1212939 ) ) ( not ( = ?auto_1212938 ?auto_1212940 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1212939 ?auto_1212940 )
      ( MAKE-12CRATE-VERIFY ?auto_1212929 ?auto_1212930 ?auto_1212931 ?auto_1212928 ?auto_1212932 ?auto_1212934 ?auto_1212933 ?auto_1212935 ?auto_1212936 ?auto_1212937 ?auto_1212938 ?auto_1212939 ?auto_1212940 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213054 - SURFACE
      ?auto_1213055 - SURFACE
      ?auto_1213056 - SURFACE
      ?auto_1213053 - SURFACE
      ?auto_1213057 - SURFACE
      ?auto_1213059 - SURFACE
      ?auto_1213058 - SURFACE
      ?auto_1213060 - SURFACE
      ?auto_1213061 - SURFACE
      ?auto_1213062 - SURFACE
      ?auto_1213063 - SURFACE
      ?auto_1213064 - SURFACE
      ?auto_1213065 - SURFACE
    )
    :vars
    (
      ?auto_1213068 - HOIST
      ?auto_1213067 - PLACE
      ?auto_1213066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213068 ?auto_1213067 ) ( SURFACE-AT ?auto_1213064 ?auto_1213067 ) ( CLEAR ?auto_1213064 ) ( IS-CRATE ?auto_1213065 ) ( not ( = ?auto_1213064 ?auto_1213065 ) ) ( TRUCK-AT ?auto_1213066 ?auto_1213067 ) ( AVAILABLE ?auto_1213068 ) ( IN ?auto_1213065 ?auto_1213066 ) ( ON ?auto_1213064 ?auto_1213063 ) ( not ( = ?auto_1213063 ?auto_1213064 ) ) ( not ( = ?auto_1213063 ?auto_1213065 ) ) ( ON ?auto_1213055 ?auto_1213054 ) ( ON ?auto_1213056 ?auto_1213055 ) ( ON ?auto_1213053 ?auto_1213056 ) ( ON ?auto_1213057 ?auto_1213053 ) ( ON ?auto_1213059 ?auto_1213057 ) ( ON ?auto_1213058 ?auto_1213059 ) ( ON ?auto_1213060 ?auto_1213058 ) ( ON ?auto_1213061 ?auto_1213060 ) ( ON ?auto_1213062 ?auto_1213061 ) ( ON ?auto_1213063 ?auto_1213062 ) ( not ( = ?auto_1213054 ?auto_1213055 ) ) ( not ( = ?auto_1213054 ?auto_1213056 ) ) ( not ( = ?auto_1213054 ?auto_1213053 ) ) ( not ( = ?auto_1213054 ?auto_1213057 ) ) ( not ( = ?auto_1213054 ?auto_1213059 ) ) ( not ( = ?auto_1213054 ?auto_1213058 ) ) ( not ( = ?auto_1213054 ?auto_1213060 ) ) ( not ( = ?auto_1213054 ?auto_1213061 ) ) ( not ( = ?auto_1213054 ?auto_1213062 ) ) ( not ( = ?auto_1213054 ?auto_1213063 ) ) ( not ( = ?auto_1213054 ?auto_1213064 ) ) ( not ( = ?auto_1213054 ?auto_1213065 ) ) ( not ( = ?auto_1213055 ?auto_1213056 ) ) ( not ( = ?auto_1213055 ?auto_1213053 ) ) ( not ( = ?auto_1213055 ?auto_1213057 ) ) ( not ( = ?auto_1213055 ?auto_1213059 ) ) ( not ( = ?auto_1213055 ?auto_1213058 ) ) ( not ( = ?auto_1213055 ?auto_1213060 ) ) ( not ( = ?auto_1213055 ?auto_1213061 ) ) ( not ( = ?auto_1213055 ?auto_1213062 ) ) ( not ( = ?auto_1213055 ?auto_1213063 ) ) ( not ( = ?auto_1213055 ?auto_1213064 ) ) ( not ( = ?auto_1213055 ?auto_1213065 ) ) ( not ( = ?auto_1213056 ?auto_1213053 ) ) ( not ( = ?auto_1213056 ?auto_1213057 ) ) ( not ( = ?auto_1213056 ?auto_1213059 ) ) ( not ( = ?auto_1213056 ?auto_1213058 ) ) ( not ( = ?auto_1213056 ?auto_1213060 ) ) ( not ( = ?auto_1213056 ?auto_1213061 ) ) ( not ( = ?auto_1213056 ?auto_1213062 ) ) ( not ( = ?auto_1213056 ?auto_1213063 ) ) ( not ( = ?auto_1213056 ?auto_1213064 ) ) ( not ( = ?auto_1213056 ?auto_1213065 ) ) ( not ( = ?auto_1213053 ?auto_1213057 ) ) ( not ( = ?auto_1213053 ?auto_1213059 ) ) ( not ( = ?auto_1213053 ?auto_1213058 ) ) ( not ( = ?auto_1213053 ?auto_1213060 ) ) ( not ( = ?auto_1213053 ?auto_1213061 ) ) ( not ( = ?auto_1213053 ?auto_1213062 ) ) ( not ( = ?auto_1213053 ?auto_1213063 ) ) ( not ( = ?auto_1213053 ?auto_1213064 ) ) ( not ( = ?auto_1213053 ?auto_1213065 ) ) ( not ( = ?auto_1213057 ?auto_1213059 ) ) ( not ( = ?auto_1213057 ?auto_1213058 ) ) ( not ( = ?auto_1213057 ?auto_1213060 ) ) ( not ( = ?auto_1213057 ?auto_1213061 ) ) ( not ( = ?auto_1213057 ?auto_1213062 ) ) ( not ( = ?auto_1213057 ?auto_1213063 ) ) ( not ( = ?auto_1213057 ?auto_1213064 ) ) ( not ( = ?auto_1213057 ?auto_1213065 ) ) ( not ( = ?auto_1213059 ?auto_1213058 ) ) ( not ( = ?auto_1213059 ?auto_1213060 ) ) ( not ( = ?auto_1213059 ?auto_1213061 ) ) ( not ( = ?auto_1213059 ?auto_1213062 ) ) ( not ( = ?auto_1213059 ?auto_1213063 ) ) ( not ( = ?auto_1213059 ?auto_1213064 ) ) ( not ( = ?auto_1213059 ?auto_1213065 ) ) ( not ( = ?auto_1213058 ?auto_1213060 ) ) ( not ( = ?auto_1213058 ?auto_1213061 ) ) ( not ( = ?auto_1213058 ?auto_1213062 ) ) ( not ( = ?auto_1213058 ?auto_1213063 ) ) ( not ( = ?auto_1213058 ?auto_1213064 ) ) ( not ( = ?auto_1213058 ?auto_1213065 ) ) ( not ( = ?auto_1213060 ?auto_1213061 ) ) ( not ( = ?auto_1213060 ?auto_1213062 ) ) ( not ( = ?auto_1213060 ?auto_1213063 ) ) ( not ( = ?auto_1213060 ?auto_1213064 ) ) ( not ( = ?auto_1213060 ?auto_1213065 ) ) ( not ( = ?auto_1213061 ?auto_1213062 ) ) ( not ( = ?auto_1213061 ?auto_1213063 ) ) ( not ( = ?auto_1213061 ?auto_1213064 ) ) ( not ( = ?auto_1213061 ?auto_1213065 ) ) ( not ( = ?auto_1213062 ?auto_1213063 ) ) ( not ( = ?auto_1213062 ?auto_1213064 ) ) ( not ( = ?auto_1213062 ?auto_1213065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213063 ?auto_1213064 ?auto_1213065 )
      ( MAKE-12CRATE-VERIFY ?auto_1213054 ?auto_1213055 ?auto_1213056 ?auto_1213053 ?auto_1213057 ?auto_1213059 ?auto_1213058 ?auto_1213060 ?auto_1213061 ?auto_1213062 ?auto_1213063 ?auto_1213064 ?auto_1213065 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213192 - SURFACE
      ?auto_1213193 - SURFACE
      ?auto_1213194 - SURFACE
      ?auto_1213191 - SURFACE
      ?auto_1213195 - SURFACE
      ?auto_1213197 - SURFACE
      ?auto_1213196 - SURFACE
      ?auto_1213198 - SURFACE
      ?auto_1213199 - SURFACE
      ?auto_1213200 - SURFACE
      ?auto_1213201 - SURFACE
      ?auto_1213202 - SURFACE
      ?auto_1213203 - SURFACE
    )
    :vars
    (
      ?auto_1213206 - HOIST
      ?auto_1213204 - PLACE
      ?auto_1213207 - TRUCK
      ?auto_1213205 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213206 ?auto_1213204 ) ( SURFACE-AT ?auto_1213202 ?auto_1213204 ) ( CLEAR ?auto_1213202 ) ( IS-CRATE ?auto_1213203 ) ( not ( = ?auto_1213202 ?auto_1213203 ) ) ( AVAILABLE ?auto_1213206 ) ( IN ?auto_1213203 ?auto_1213207 ) ( ON ?auto_1213202 ?auto_1213201 ) ( not ( = ?auto_1213201 ?auto_1213202 ) ) ( not ( = ?auto_1213201 ?auto_1213203 ) ) ( TRUCK-AT ?auto_1213207 ?auto_1213205 ) ( not ( = ?auto_1213205 ?auto_1213204 ) ) ( ON ?auto_1213193 ?auto_1213192 ) ( ON ?auto_1213194 ?auto_1213193 ) ( ON ?auto_1213191 ?auto_1213194 ) ( ON ?auto_1213195 ?auto_1213191 ) ( ON ?auto_1213197 ?auto_1213195 ) ( ON ?auto_1213196 ?auto_1213197 ) ( ON ?auto_1213198 ?auto_1213196 ) ( ON ?auto_1213199 ?auto_1213198 ) ( ON ?auto_1213200 ?auto_1213199 ) ( ON ?auto_1213201 ?auto_1213200 ) ( not ( = ?auto_1213192 ?auto_1213193 ) ) ( not ( = ?auto_1213192 ?auto_1213194 ) ) ( not ( = ?auto_1213192 ?auto_1213191 ) ) ( not ( = ?auto_1213192 ?auto_1213195 ) ) ( not ( = ?auto_1213192 ?auto_1213197 ) ) ( not ( = ?auto_1213192 ?auto_1213196 ) ) ( not ( = ?auto_1213192 ?auto_1213198 ) ) ( not ( = ?auto_1213192 ?auto_1213199 ) ) ( not ( = ?auto_1213192 ?auto_1213200 ) ) ( not ( = ?auto_1213192 ?auto_1213201 ) ) ( not ( = ?auto_1213192 ?auto_1213202 ) ) ( not ( = ?auto_1213192 ?auto_1213203 ) ) ( not ( = ?auto_1213193 ?auto_1213194 ) ) ( not ( = ?auto_1213193 ?auto_1213191 ) ) ( not ( = ?auto_1213193 ?auto_1213195 ) ) ( not ( = ?auto_1213193 ?auto_1213197 ) ) ( not ( = ?auto_1213193 ?auto_1213196 ) ) ( not ( = ?auto_1213193 ?auto_1213198 ) ) ( not ( = ?auto_1213193 ?auto_1213199 ) ) ( not ( = ?auto_1213193 ?auto_1213200 ) ) ( not ( = ?auto_1213193 ?auto_1213201 ) ) ( not ( = ?auto_1213193 ?auto_1213202 ) ) ( not ( = ?auto_1213193 ?auto_1213203 ) ) ( not ( = ?auto_1213194 ?auto_1213191 ) ) ( not ( = ?auto_1213194 ?auto_1213195 ) ) ( not ( = ?auto_1213194 ?auto_1213197 ) ) ( not ( = ?auto_1213194 ?auto_1213196 ) ) ( not ( = ?auto_1213194 ?auto_1213198 ) ) ( not ( = ?auto_1213194 ?auto_1213199 ) ) ( not ( = ?auto_1213194 ?auto_1213200 ) ) ( not ( = ?auto_1213194 ?auto_1213201 ) ) ( not ( = ?auto_1213194 ?auto_1213202 ) ) ( not ( = ?auto_1213194 ?auto_1213203 ) ) ( not ( = ?auto_1213191 ?auto_1213195 ) ) ( not ( = ?auto_1213191 ?auto_1213197 ) ) ( not ( = ?auto_1213191 ?auto_1213196 ) ) ( not ( = ?auto_1213191 ?auto_1213198 ) ) ( not ( = ?auto_1213191 ?auto_1213199 ) ) ( not ( = ?auto_1213191 ?auto_1213200 ) ) ( not ( = ?auto_1213191 ?auto_1213201 ) ) ( not ( = ?auto_1213191 ?auto_1213202 ) ) ( not ( = ?auto_1213191 ?auto_1213203 ) ) ( not ( = ?auto_1213195 ?auto_1213197 ) ) ( not ( = ?auto_1213195 ?auto_1213196 ) ) ( not ( = ?auto_1213195 ?auto_1213198 ) ) ( not ( = ?auto_1213195 ?auto_1213199 ) ) ( not ( = ?auto_1213195 ?auto_1213200 ) ) ( not ( = ?auto_1213195 ?auto_1213201 ) ) ( not ( = ?auto_1213195 ?auto_1213202 ) ) ( not ( = ?auto_1213195 ?auto_1213203 ) ) ( not ( = ?auto_1213197 ?auto_1213196 ) ) ( not ( = ?auto_1213197 ?auto_1213198 ) ) ( not ( = ?auto_1213197 ?auto_1213199 ) ) ( not ( = ?auto_1213197 ?auto_1213200 ) ) ( not ( = ?auto_1213197 ?auto_1213201 ) ) ( not ( = ?auto_1213197 ?auto_1213202 ) ) ( not ( = ?auto_1213197 ?auto_1213203 ) ) ( not ( = ?auto_1213196 ?auto_1213198 ) ) ( not ( = ?auto_1213196 ?auto_1213199 ) ) ( not ( = ?auto_1213196 ?auto_1213200 ) ) ( not ( = ?auto_1213196 ?auto_1213201 ) ) ( not ( = ?auto_1213196 ?auto_1213202 ) ) ( not ( = ?auto_1213196 ?auto_1213203 ) ) ( not ( = ?auto_1213198 ?auto_1213199 ) ) ( not ( = ?auto_1213198 ?auto_1213200 ) ) ( not ( = ?auto_1213198 ?auto_1213201 ) ) ( not ( = ?auto_1213198 ?auto_1213202 ) ) ( not ( = ?auto_1213198 ?auto_1213203 ) ) ( not ( = ?auto_1213199 ?auto_1213200 ) ) ( not ( = ?auto_1213199 ?auto_1213201 ) ) ( not ( = ?auto_1213199 ?auto_1213202 ) ) ( not ( = ?auto_1213199 ?auto_1213203 ) ) ( not ( = ?auto_1213200 ?auto_1213201 ) ) ( not ( = ?auto_1213200 ?auto_1213202 ) ) ( not ( = ?auto_1213200 ?auto_1213203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213201 ?auto_1213202 ?auto_1213203 )
      ( MAKE-12CRATE-VERIFY ?auto_1213192 ?auto_1213193 ?auto_1213194 ?auto_1213191 ?auto_1213195 ?auto_1213197 ?auto_1213196 ?auto_1213198 ?auto_1213199 ?auto_1213200 ?auto_1213201 ?auto_1213202 ?auto_1213203 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213342 - SURFACE
      ?auto_1213343 - SURFACE
      ?auto_1213344 - SURFACE
      ?auto_1213341 - SURFACE
      ?auto_1213345 - SURFACE
      ?auto_1213347 - SURFACE
      ?auto_1213346 - SURFACE
      ?auto_1213348 - SURFACE
      ?auto_1213349 - SURFACE
      ?auto_1213350 - SURFACE
      ?auto_1213351 - SURFACE
      ?auto_1213352 - SURFACE
      ?auto_1213353 - SURFACE
    )
    :vars
    (
      ?auto_1213355 - HOIST
      ?auto_1213357 - PLACE
      ?auto_1213354 - TRUCK
      ?auto_1213356 - PLACE
      ?auto_1213358 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213355 ?auto_1213357 ) ( SURFACE-AT ?auto_1213352 ?auto_1213357 ) ( CLEAR ?auto_1213352 ) ( IS-CRATE ?auto_1213353 ) ( not ( = ?auto_1213352 ?auto_1213353 ) ) ( AVAILABLE ?auto_1213355 ) ( ON ?auto_1213352 ?auto_1213351 ) ( not ( = ?auto_1213351 ?auto_1213352 ) ) ( not ( = ?auto_1213351 ?auto_1213353 ) ) ( TRUCK-AT ?auto_1213354 ?auto_1213356 ) ( not ( = ?auto_1213356 ?auto_1213357 ) ) ( HOIST-AT ?auto_1213358 ?auto_1213356 ) ( LIFTING ?auto_1213358 ?auto_1213353 ) ( not ( = ?auto_1213355 ?auto_1213358 ) ) ( ON ?auto_1213343 ?auto_1213342 ) ( ON ?auto_1213344 ?auto_1213343 ) ( ON ?auto_1213341 ?auto_1213344 ) ( ON ?auto_1213345 ?auto_1213341 ) ( ON ?auto_1213347 ?auto_1213345 ) ( ON ?auto_1213346 ?auto_1213347 ) ( ON ?auto_1213348 ?auto_1213346 ) ( ON ?auto_1213349 ?auto_1213348 ) ( ON ?auto_1213350 ?auto_1213349 ) ( ON ?auto_1213351 ?auto_1213350 ) ( not ( = ?auto_1213342 ?auto_1213343 ) ) ( not ( = ?auto_1213342 ?auto_1213344 ) ) ( not ( = ?auto_1213342 ?auto_1213341 ) ) ( not ( = ?auto_1213342 ?auto_1213345 ) ) ( not ( = ?auto_1213342 ?auto_1213347 ) ) ( not ( = ?auto_1213342 ?auto_1213346 ) ) ( not ( = ?auto_1213342 ?auto_1213348 ) ) ( not ( = ?auto_1213342 ?auto_1213349 ) ) ( not ( = ?auto_1213342 ?auto_1213350 ) ) ( not ( = ?auto_1213342 ?auto_1213351 ) ) ( not ( = ?auto_1213342 ?auto_1213352 ) ) ( not ( = ?auto_1213342 ?auto_1213353 ) ) ( not ( = ?auto_1213343 ?auto_1213344 ) ) ( not ( = ?auto_1213343 ?auto_1213341 ) ) ( not ( = ?auto_1213343 ?auto_1213345 ) ) ( not ( = ?auto_1213343 ?auto_1213347 ) ) ( not ( = ?auto_1213343 ?auto_1213346 ) ) ( not ( = ?auto_1213343 ?auto_1213348 ) ) ( not ( = ?auto_1213343 ?auto_1213349 ) ) ( not ( = ?auto_1213343 ?auto_1213350 ) ) ( not ( = ?auto_1213343 ?auto_1213351 ) ) ( not ( = ?auto_1213343 ?auto_1213352 ) ) ( not ( = ?auto_1213343 ?auto_1213353 ) ) ( not ( = ?auto_1213344 ?auto_1213341 ) ) ( not ( = ?auto_1213344 ?auto_1213345 ) ) ( not ( = ?auto_1213344 ?auto_1213347 ) ) ( not ( = ?auto_1213344 ?auto_1213346 ) ) ( not ( = ?auto_1213344 ?auto_1213348 ) ) ( not ( = ?auto_1213344 ?auto_1213349 ) ) ( not ( = ?auto_1213344 ?auto_1213350 ) ) ( not ( = ?auto_1213344 ?auto_1213351 ) ) ( not ( = ?auto_1213344 ?auto_1213352 ) ) ( not ( = ?auto_1213344 ?auto_1213353 ) ) ( not ( = ?auto_1213341 ?auto_1213345 ) ) ( not ( = ?auto_1213341 ?auto_1213347 ) ) ( not ( = ?auto_1213341 ?auto_1213346 ) ) ( not ( = ?auto_1213341 ?auto_1213348 ) ) ( not ( = ?auto_1213341 ?auto_1213349 ) ) ( not ( = ?auto_1213341 ?auto_1213350 ) ) ( not ( = ?auto_1213341 ?auto_1213351 ) ) ( not ( = ?auto_1213341 ?auto_1213352 ) ) ( not ( = ?auto_1213341 ?auto_1213353 ) ) ( not ( = ?auto_1213345 ?auto_1213347 ) ) ( not ( = ?auto_1213345 ?auto_1213346 ) ) ( not ( = ?auto_1213345 ?auto_1213348 ) ) ( not ( = ?auto_1213345 ?auto_1213349 ) ) ( not ( = ?auto_1213345 ?auto_1213350 ) ) ( not ( = ?auto_1213345 ?auto_1213351 ) ) ( not ( = ?auto_1213345 ?auto_1213352 ) ) ( not ( = ?auto_1213345 ?auto_1213353 ) ) ( not ( = ?auto_1213347 ?auto_1213346 ) ) ( not ( = ?auto_1213347 ?auto_1213348 ) ) ( not ( = ?auto_1213347 ?auto_1213349 ) ) ( not ( = ?auto_1213347 ?auto_1213350 ) ) ( not ( = ?auto_1213347 ?auto_1213351 ) ) ( not ( = ?auto_1213347 ?auto_1213352 ) ) ( not ( = ?auto_1213347 ?auto_1213353 ) ) ( not ( = ?auto_1213346 ?auto_1213348 ) ) ( not ( = ?auto_1213346 ?auto_1213349 ) ) ( not ( = ?auto_1213346 ?auto_1213350 ) ) ( not ( = ?auto_1213346 ?auto_1213351 ) ) ( not ( = ?auto_1213346 ?auto_1213352 ) ) ( not ( = ?auto_1213346 ?auto_1213353 ) ) ( not ( = ?auto_1213348 ?auto_1213349 ) ) ( not ( = ?auto_1213348 ?auto_1213350 ) ) ( not ( = ?auto_1213348 ?auto_1213351 ) ) ( not ( = ?auto_1213348 ?auto_1213352 ) ) ( not ( = ?auto_1213348 ?auto_1213353 ) ) ( not ( = ?auto_1213349 ?auto_1213350 ) ) ( not ( = ?auto_1213349 ?auto_1213351 ) ) ( not ( = ?auto_1213349 ?auto_1213352 ) ) ( not ( = ?auto_1213349 ?auto_1213353 ) ) ( not ( = ?auto_1213350 ?auto_1213351 ) ) ( not ( = ?auto_1213350 ?auto_1213352 ) ) ( not ( = ?auto_1213350 ?auto_1213353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213351 ?auto_1213352 ?auto_1213353 )
      ( MAKE-12CRATE-VERIFY ?auto_1213342 ?auto_1213343 ?auto_1213344 ?auto_1213341 ?auto_1213345 ?auto_1213347 ?auto_1213346 ?auto_1213348 ?auto_1213349 ?auto_1213350 ?auto_1213351 ?auto_1213352 ?auto_1213353 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213504 - SURFACE
      ?auto_1213505 - SURFACE
      ?auto_1213506 - SURFACE
      ?auto_1213503 - SURFACE
      ?auto_1213507 - SURFACE
      ?auto_1213509 - SURFACE
      ?auto_1213508 - SURFACE
      ?auto_1213510 - SURFACE
      ?auto_1213511 - SURFACE
      ?auto_1213512 - SURFACE
      ?auto_1213513 - SURFACE
      ?auto_1213514 - SURFACE
      ?auto_1213515 - SURFACE
    )
    :vars
    (
      ?auto_1213521 - HOIST
      ?auto_1213516 - PLACE
      ?auto_1213519 - TRUCK
      ?auto_1213517 - PLACE
      ?auto_1213520 - HOIST
      ?auto_1213518 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213521 ?auto_1213516 ) ( SURFACE-AT ?auto_1213514 ?auto_1213516 ) ( CLEAR ?auto_1213514 ) ( IS-CRATE ?auto_1213515 ) ( not ( = ?auto_1213514 ?auto_1213515 ) ) ( AVAILABLE ?auto_1213521 ) ( ON ?auto_1213514 ?auto_1213513 ) ( not ( = ?auto_1213513 ?auto_1213514 ) ) ( not ( = ?auto_1213513 ?auto_1213515 ) ) ( TRUCK-AT ?auto_1213519 ?auto_1213517 ) ( not ( = ?auto_1213517 ?auto_1213516 ) ) ( HOIST-AT ?auto_1213520 ?auto_1213517 ) ( not ( = ?auto_1213521 ?auto_1213520 ) ) ( AVAILABLE ?auto_1213520 ) ( SURFACE-AT ?auto_1213515 ?auto_1213517 ) ( ON ?auto_1213515 ?auto_1213518 ) ( CLEAR ?auto_1213515 ) ( not ( = ?auto_1213514 ?auto_1213518 ) ) ( not ( = ?auto_1213515 ?auto_1213518 ) ) ( not ( = ?auto_1213513 ?auto_1213518 ) ) ( ON ?auto_1213505 ?auto_1213504 ) ( ON ?auto_1213506 ?auto_1213505 ) ( ON ?auto_1213503 ?auto_1213506 ) ( ON ?auto_1213507 ?auto_1213503 ) ( ON ?auto_1213509 ?auto_1213507 ) ( ON ?auto_1213508 ?auto_1213509 ) ( ON ?auto_1213510 ?auto_1213508 ) ( ON ?auto_1213511 ?auto_1213510 ) ( ON ?auto_1213512 ?auto_1213511 ) ( ON ?auto_1213513 ?auto_1213512 ) ( not ( = ?auto_1213504 ?auto_1213505 ) ) ( not ( = ?auto_1213504 ?auto_1213506 ) ) ( not ( = ?auto_1213504 ?auto_1213503 ) ) ( not ( = ?auto_1213504 ?auto_1213507 ) ) ( not ( = ?auto_1213504 ?auto_1213509 ) ) ( not ( = ?auto_1213504 ?auto_1213508 ) ) ( not ( = ?auto_1213504 ?auto_1213510 ) ) ( not ( = ?auto_1213504 ?auto_1213511 ) ) ( not ( = ?auto_1213504 ?auto_1213512 ) ) ( not ( = ?auto_1213504 ?auto_1213513 ) ) ( not ( = ?auto_1213504 ?auto_1213514 ) ) ( not ( = ?auto_1213504 ?auto_1213515 ) ) ( not ( = ?auto_1213504 ?auto_1213518 ) ) ( not ( = ?auto_1213505 ?auto_1213506 ) ) ( not ( = ?auto_1213505 ?auto_1213503 ) ) ( not ( = ?auto_1213505 ?auto_1213507 ) ) ( not ( = ?auto_1213505 ?auto_1213509 ) ) ( not ( = ?auto_1213505 ?auto_1213508 ) ) ( not ( = ?auto_1213505 ?auto_1213510 ) ) ( not ( = ?auto_1213505 ?auto_1213511 ) ) ( not ( = ?auto_1213505 ?auto_1213512 ) ) ( not ( = ?auto_1213505 ?auto_1213513 ) ) ( not ( = ?auto_1213505 ?auto_1213514 ) ) ( not ( = ?auto_1213505 ?auto_1213515 ) ) ( not ( = ?auto_1213505 ?auto_1213518 ) ) ( not ( = ?auto_1213506 ?auto_1213503 ) ) ( not ( = ?auto_1213506 ?auto_1213507 ) ) ( not ( = ?auto_1213506 ?auto_1213509 ) ) ( not ( = ?auto_1213506 ?auto_1213508 ) ) ( not ( = ?auto_1213506 ?auto_1213510 ) ) ( not ( = ?auto_1213506 ?auto_1213511 ) ) ( not ( = ?auto_1213506 ?auto_1213512 ) ) ( not ( = ?auto_1213506 ?auto_1213513 ) ) ( not ( = ?auto_1213506 ?auto_1213514 ) ) ( not ( = ?auto_1213506 ?auto_1213515 ) ) ( not ( = ?auto_1213506 ?auto_1213518 ) ) ( not ( = ?auto_1213503 ?auto_1213507 ) ) ( not ( = ?auto_1213503 ?auto_1213509 ) ) ( not ( = ?auto_1213503 ?auto_1213508 ) ) ( not ( = ?auto_1213503 ?auto_1213510 ) ) ( not ( = ?auto_1213503 ?auto_1213511 ) ) ( not ( = ?auto_1213503 ?auto_1213512 ) ) ( not ( = ?auto_1213503 ?auto_1213513 ) ) ( not ( = ?auto_1213503 ?auto_1213514 ) ) ( not ( = ?auto_1213503 ?auto_1213515 ) ) ( not ( = ?auto_1213503 ?auto_1213518 ) ) ( not ( = ?auto_1213507 ?auto_1213509 ) ) ( not ( = ?auto_1213507 ?auto_1213508 ) ) ( not ( = ?auto_1213507 ?auto_1213510 ) ) ( not ( = ?auto_1213507 ?auto_1213511 ) ) ( not ( = ?auto_1213507 ?auto_1213512 ) ) ( not ( = ?auto_1213507 ?auto_1213513 ) ) ( not ( = ?auto_1213507 ?auto_1213514 ) ) ( not ( = ?auto_1213507 ?auto_1213515 ) ) ( not ( = ?auto_1213507 ?auto_1213518 ) ) ( not ( = ?auto_1213509 ?auto_1213508 ) ) ( not ( = ?auto_1213509 ?auto_1213510 ) ) ( not ( = ?auto_1213509 ?auto_1213511 ) ) ( not ( = ?auto_1213509 ?auto_1213512 ) ) ( not ( = ?auto_1213509 ?auto_1213513 ) ) ( not ( = ?auto_1213509 ?auto_1213514 ) ) ( not ( = ?auto_1213509 ?auto_1213515 ) ) ( not ( = ?auto_1213509 ?auto_1213518 ) ) ( not ( = ?auto_1213508 ?auto_1213510 ) ) ( not ( = ?auto_1213508 ?auto_1213511 ) ) ( not ( = ?auto_1213508 ?auto_1213512 ) ) ( not ( = ?auto_1213508 ?auto_1213513 ) ) ( not ( = ?auto_1213508 ?auto_1213514 ) ) ( not ( = ?auto_1213508 ?auto_1213515 ) ) ( not ( = ?auto_1213508 ?auto_1213518 ) ) ( not ( = ?auto_1213510 ?auto_1213511 ) ) ( not ( = ?auto_1213510 ?auto_1213512 ) ) ( not ( = ?auto_1213510 ?auto_1213513 ) ) ( not ( = ?auto_1213510 ?auto_1213514 ) ) ( not ( = ?auto_1213510 ?auto_1213515 ) ) ( not ( = ?auto_1213510 ?auto_1213518 ) ) ( not ( = ?auto_1213511 ?auto_1213512 ) ) ( not ( = ?auto_1213511 ?auto_1213513 ) ) ( not ( = ?auto_1213511 ?auto_1213514 ) ) ( not ( = ?auto_1213511 ?auto_1213515 ) ) ( not ( = ?auto_1213511 ?auto_1213518 ) ) ( not ( = ?auto_1213512 ?auto_1213513 ) ) ( not ( = ?auto_1213512 ?auto_1213514 ) ) ( not ( = ?auto_1213512 ?auto_1213515 ) ) ( not ( = ?auto_1213512 ?auto_1213518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213513 ?auto_1213514 ?auto_1213515 )
      ( MAKE-12CRATE-VERIFY ?auto_1213504 ?auto_1213505 ?auto_1213506 ?auto_1213503 ?auto_1213507 ?auto_1213509 ?auto_1213508 ?auto_1213510 ?auto_1213511 ?auto_1213512 ?auto_1213513 ?auto_1213514 ?auto_1213515 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213667 - SURFACE
      ?auto_1213668 - SURFACE
      ?auto_1213669 - SURFACE
      ?auto_1213666 - SURFACE
      ?auto_1213670 - SURFACE
      ?auto_1213672 - SURFACE
      ?auto_1213671 - SURFACE
      ?auto_1213673 - SURFACE
      ?auto_1213674 - SURFACE
      ?auto_1213675 - SURFACE
      ?auto_1213676 - SURFACE
      ?auto_1213677 - SURFACE
      ?auto_1213678 - SURFACE
    )
    :vars
    (
      ?auto_1213682 - HOIST
      ?auto_1213681 - PLACE
      ?auto_1213684 - PLACE
      ?auto_1213679 - HOIST
      ?auto_1213683 - SURFACE
      ?auto_1213680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213682 ?auto_1213681 ) ( SURFACE-AT ?auto_1213677 ?auto_1213681 ) ( CLEAR ?auto_1213677 ) ( IS-CRATE ?auto_1213678 ) ( not ( = ?auto_1213677 ?auto_1213678 ) ) ( AVAILABLE ?auto_1213682 ) ( ON ?auto_1213677 ?auto_1213676 ) ( not ( = ?auto_1213676 ?auto_1213677 ) ) ( not ( = ?auto_1213676 ?auto_1213678 ) ) ( not ( = ?auto_1213684 ?auto_1213681 ) ) ( HOIST-AT ?auto_1213679 ?auto_1213684 ) ( not ( = ?auto_1213682 ?auto_1213679 ) ) ( AVAILABLE ?auto_1213679 ) ( SURFACE-AT ?auto_1213678 ?auto_1213684 ) ( ON ?auto_1213678 ?auto_1213683 ) ( CLEAR ?auto_1213678 ) ( not ( = ?auto_1213677 ?auto_1213683 ) ) ( not ( = ?auto_1213678 ?auto_1213683 ) ) ( not ( = ?auto_1213676 ?auto_1213683 ) ) ( TRUCK-AT ?auto_1213680 ?auto_1213681 ) ( ON ?auto_1213668 ?auto_1213667 ) ( ON ?auto_1213669 ?auto_1213668 ) ( ON ?auto_1213666 ?auto_1213669 ) ( ON ?auto_1213670 ?auto_1213666 ) ( ON ?auto_1213672 ?auto_1213670 ) ( ON ?auto_1213671 ?auto_1213672 ) ( ON ?auto_1213673 ?auto_1213671 ) ( ON ?auto_1213674 ?auto_1213673 ) ( ON ?auto_1213675 ?auto_1213674 ) ( ON ?auto_1213676 ?auto_1213675 ) ( not ( = ?auto_1213667 ?auto_1213668 ) ) ( not ( = ?auto_1213667 ?auto_1213669 ) ) ( not ( = ?auto_1213667 ?auto_1213666 ) ) ( not ( = ?auto_1213667 ?auto_1213670 ) ) ( not ( = ?auto_1213667 ?auto_1213672 ) ) ( not ( = ?auto_1213667 ?auto_1213671 ) ) ( not ( = ?auto_1213667 ?auto_1213673 ) ) ( not ( = ?auto_1213667 ?auto_1213674 ) ) ( not ( = ?auto_1213667 ?auto_1213675 ) ) ( not ( = ?auto_1213667 ?auto_1213676 ) ) ( not ( = ?auto_1213667 ?auto_1213677 ) ) ( not ( = ?auto_1213667 ?auto_1213678 ) ) ( not ( = ?auto_1213667 ?auto_1213683 ) ) ( not ( = ?auto_1213668 ?auto_1213669 ) ) ( not ( = ?auto_1213668 ?auto_1213666 ) ) ( not ( = ?auto_1213668 ?auto_1213670 ) ) ( not ( = ?auto_1213668 ?auto_1213672 ) ) ( not ( = ?auto_1213668 ?auto_1213671 ) ) ( not ( = ?auto_1213668 ?auto_1213673 ) ) ( not ( = ?auto_1213668 ?auto_1213674 ) ) ( not ( = ?auto_1213668 ?auto_1213675 ) ) ( not ( = ?auto_1213668 ?auto_1213676 ) ) ( not ( = ?auto_1213668 ?auto_1213677 ) ) ( not ( = ?auto_1213668 ?auto_1213678 ) ) ( not ( = ?auto_1213668 ?auto_1213683 ) ) ( not ( = ?auto_1213669 ?auto_1213666 ) ) ( not ( = ?auto_1213669 ?auto_1213670 ) ) ( not ( = ?auto_1213669 ?auto_1213672 ) ) ( not ( = ?auto_1213669 ?auto_1213671 ) ) ( not ( = ?auto_1213669 ?auto_1213673 ) ) ( not ( = ?auto_1213669 ?auto_1213674 ) ) ( not ( = ?auto_1213669 ?auto_1213675 ) ) ( not ( = ?auto_1213669 ?auto_1213676 ) ) ( not ( = ?auto_1213669 ?auto_1213677 ) ) ( not ( = ?auto_1213669 ?auto_1213678 ) ) ( not ( = ?auto_1213669 ?auto_1213683 ) ) ( not ( = ?auto_1213666 ?auto_1213670 ) ) ( not ( = ?auto_1213666 ?auto_1213672 ) ) ( not ( = ?auto_1213666 ?auto_1213671 ) ) ( not ( = ?auto_1213666 ?auto_1213673 ) ) ( not ( = ?auto_1213666 ?auto_1213674 ) ) ( not ( = ?auto_1213666 ?auto_1213675 ) ) ( not ( = ?auto_1213666 ?auto_1213676 ) ) ( not ( = ?auto_1213666 ?auto_1213677 ) ) ( not ( = ?auto_1213666 ?auto_1213678 ) ) ( not ( = ?auto_1213666 ?auto_1213683 ) ) ( not ( = ?auto_1213670 ?auto_1213672 ) ) ( not ( = ?auto_1213670 ?auto_1213671 ) ) ( not ( = ?auto_1213670 ?auto_1213673 ) ) ( not ( = ?auto_1213670 ?auto_1213674 ) ) ( not ( = ?auto_1213670 ?auto_1213675 ) ) ( not ( = ?auto_1213670 ?auto_1213676 ) ) ( not ( = ?auto_1213670 ?auto_1213677 ) ) ( not ( = ?auto_1213670 ?auto_1213678 ) ) ( not ( = ?auto_1213670 ?auto_1213683 ) ) ( not ( = ?auto_1213672 ?auto_1213671 ) ) ( not ( = ?auto_1213672 ?auto_1213673 ) ) ( not ( = ?auto_1213672 ?auto_1213674 ) ) ( not ( = ?auto_1213672 ?auto_1213675 ) ) ( not ( = ?auto_1213672 ?auto_1213676 ) ) ( not ( = ?auto_1213672 ?auto_1213677 ) ) ( not ( = ?auto_1213672 ?auto_1213678 ) ) ( not ( = ?auto_1213672 ?auto_1213683 ) ) ( not ( = ?auto_1213671 ?auto_1213673 ) ) ( not ( = ?auto_1213671 ?auto_1213674 ) ) ( not ( = ?auto_1213671 ?auto_1213675 ) ) ( not ( = ?auto_1213671 ?auto_1213676 ) ) ( not ( = ?auto_1213671 ?auto_1213677 ) ) ( not ( = ?auto_1213671 ?auto_1213678 ) ) ( not ( = ?auto_1213671 ?auto_1213683 ) ) ( not ( = ?auto_1213673 ?auto_1213674 ) ) ( not ( = ?auto_1213673 ?auto_1213675 ) ) ( not ( = ?auto_1213673 ?auto_1213676 ) ) ( not ( = ?auto_1213673 ?auto_1213677 ) ) ( not ( = ?auto_1213673 ?auto_1213678 ) ) ( not ( = ?auto_1213673 ?auto_1213683 ) ) ( not ( = ?auto_1213674 ?auto_1213675 ) ) ( not ( = ?auto_1213674 ?auto_1213676 ) ) ( not ( = ?auto_1213674 ?auto_1213677 ) ) ( not ( = ?auto_1213674 ?auto_1213678 ) ) ( not ( = ?auto_1213674 ?auto_1213683 ) ) ( not ( = ?auto_1213675 ?auto_1213676 ) ) ( not ( = ?auto_1213675 ?auto_1213677 ) ) ( not ( = ?auto_1213675 ?auto_1213678 ) ) ( not ( = ?auto_1213675 ?auto_1213683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213676 ?auto_1213677 ?auto_1213678 )
      ( MAKE-12CRATE-VERIFY ?auto_1213667 ?auto_1213668 ?auto_1213669 ?auto_1213666 ?auto_1213670 ?auto_1213672 ?auto_1213671 ?auto_1213673 ?auto_1213674 ?auto_1213675 ?auto_1213676 ?auto_1213677 ?auto_1213678 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213830 - SURFACE
      ?auto_1213831 - SURFACE
      ?auto_1213832 - SURFACE
      ?auto_1213829 - SURFACE
      ?auto_1213833 - SURFACE
      ?auto_1213835 - SURFACE
      ?auto_1213834 - SURFACE
      ?auto_1213836 - SURFACE
      ?auto_1213837 - SURFACE
      ?auto_1213838 - SURFACE
      ?auto_1213839 - SURFACE
      ?auto_1213840 - SURFACE
      ?auto_1213841 - SURFACE
    )
    :vars
    (
      ?auto_1213847 - HOIST
      ?auto_1213845 - PLACE
      ?auto_1213844 - PLACE
      ?auto_1213842 - HOIST
      ?auto_1213843 - SURFACE
      ?auto_1213846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213847 ?auto_1213845 ) ( IS-CRATE ?auto_1213841 ) ( not ( = ?auto_1213840 ?auto_1213841 ) ) ( not ( = ?auto_1213839 ?auto_1213840 ) ) ( not ( = ?auto_1213839 ?auto_1213841 ) ) ( not ( = ?auto_1213844 ?auto_1213845 ) ) ( HOIST-AT ?auto_1213842 ?auto_1213844 ) ( not ( = ?auto_1213847 ?auto_1213842 ) ) ( AVAILABLE ?auto_1213842 ) ( SURFACE-AT ?auto_1213841 ?auto_1213844 ) ( ON ?auto_1213841 ?auto_1213843 ) ( CLEAR ?auto_1213841 ) ( not ( = ?auto_1213840 ?auto_1213843 ) ) ( not ( = ?auto_1213841 ?auto_1213843 ) ) ( not ( = ?auto_1213839 ?auto_1213843 ) ) ( TRUCK-AT ?auto_1213846 ?auto_1213845 ) ( SURFACE-AT ?auto_1213839 ?auto_1213845 ) ( CLEAR ?auto_1213839 ) ( LIFTING ?auto_1213847 ?auto_1213840 ) ( IS-CRATE ?auto_1213840 ) ( ON ?auto_1213831 ?auto_1213830 ) ( ON ?auto_1213832 ?auto_1213831 ) ( ON ?auto_1213829 ?auto_1213832 ) ( ON ?auto_1213833 ?auto_1213829 ) ( ON ?auto_1213835 ?auto_1213833 ) ( ON ?auto_1213834 ?auto_1213835 ) ( ON ?auto_1213836 ?auto_1213834 ) ( ON ?auto_1213837 ?auto_1213836 ) ( ON ?auto_1213838 ?auto_1213837 ) ( ON ?auto_1213839 ?auto_1213838 ) ( not ( = ?auto_1213830 ?auto_1213831 ) ) ( not ( = ?auto_1213830 ?auto_1213832 ) ) ( not ( = ?auto_1213830 ?auto_1213829 ) ) ( not ( = ?auto_1213830 ?auto_1213833 ) ) ( not ( = ?auto_1213830 ?auto_1213835 ) ) ( not ( = ?auto_1213830 ?auto_1213834 ) ) ( not ( = ?auto_1213830 ?auto_1213836 ) ) ( not ( = ?auto_1213830 ?auto_1213837 ) ) ( not ( = ?auto_1213830 ?auto_1213838 ) ) ( not ( = ?auto_1213830 ?auto_1213839 ) ) ( not ( = ?auto_1213830 ?auto_1213840 ) ) ( not ( = ?auto_1213830 ?auto_1213841 ) ) ( not ( = ?auto_1213830 ?auto_1213843 ) ) ( not ( = ?auto_1213831 ?auto_1213832 ) ) ( not ( = ?auto_1213831 ?auto_1213829 ) ) ( not ( = ?auto_1213831 ?auto_1213833 ) ) ( not ( = ?auto_1213831 ?auto_1213835 ) ) ( not ( = ?auto_1213831 ?auto_1213834 ) ) ( not ( = ?auto_1213831 ?auto_1213836 ) ) ( not ( = ?auto_1213831 ?auto_1213837 ) ) ( not ( = ?auto_1213831 ?auto_1213838 ) ) ( not ( = ?auto_1213831 ?auto_1213839 ) ) ( not ( = ?auto_1213831 ?auto_1213840 ) ) ( not ( = ?auto_1213831 ?auto_1213841 ) ) ( not ( = ?auto_1213831 ?auto_1213843 ) ) ( not ( = ?auto_1213832 ?auto_1213829 ) ) ( not ( = ?auto_1213832 ?auto_1213833 ) ) ( not ( = ?auto_1213832 ?auto_1213835 ) ) ( not ( = ?auto_1213832 ?auto_1213834 ) ) ( not ( = ?auto_1213832 ?auto_1213836 ) ) ( not ( = ?auto_1213832 ?auto_1213837 ) ) ( not ( = ?auto_1213832 ?auto_1213838 ) ) ( not ( = ?auto_1213832 ?auto_1213839 ) ) ( not ( = ?auto_1213832 ?auto_1213840 ) ) ( not ( = ?auto_1213832 ?auto_1213841 ) ) ( not ( = ?auto_1213832 ?auto_1213843 ) ) ( not ( = ?auto_1213829 ?auto_1213833 ) ) ( not ( = ?auto_1213829 ?auto_1213835 ) ) ( not ( = ?auto_1213829 ?auto_1213834 ) ) ( not ( = ?auto_1213829 ?auto_1213836 ) ) ( not ( = ?auto_1213829 ?auto_1213837 ) ) ( not ( = ?auto_1213829 ?auto_1213838 ) ) ( not ( = ?auto_1213829 ?auto_1213839 ) ) ( not ( = ?auto_1213829 ?auto_1213840 ) ) ( not ( = ?auto_1213829 ?auto_1213841 ) ) ( not ( = ?auto_1213829 ?auto_1213843 ) ) ( not ( = ?auto_1213833 ?auto_1213835 ) ) ( not ( = ?auto_1213833 ?auto_1213834 ) ) ( not ( = ?auto_1213833 ?auto_1213836 ) ) ( not ( = ?auto_1213833 ?auto_1213837 ) ) ( not ( = ?auto_1213833 ?auto_1213838 ) ) ( not ( = ?auto_1213833 ?auto_1213839 ) ) ( not ( = ?auto_1213833 ?auto_1213840 ) ) ( not ( = ?auto_1213833 ?auto_1213841 ) ) ( not ( = ?auto_1213833 ?auto_1213843 ) ) ( not ( = ?auto_1213835 ?auto_1213834 ) ) ( not ( = ?auto_1213835 ?auto_1213836 ) ) ( not ( = ?auto_1213835 ?auto_1213837 ) ) ( not ( = ?auto_1213835 ?auto_1213838 ) ) ( not ( = ?auto_1213835 ?auto_1213839 ) ) ( not ( = ?auto_1213835 ?auto_1213840 ) ) ( not ( = ?auto_1213835 ?auto_1213841 ) ) ( not ( = ?auto_1213835 ?auto_1213843 ) ) ( not ( = ?auto_1213834 ?auto_1213836 ) ) ( not ( = ?auto_1213834 ?auto_1213837 ) ) ( not ( = ?auto_1213834 ?auto_1213838 ) ) ( not ( = ?auto_1213834 ?auto_1213839 ) ) ( not ( = ?auto_1213834 ?auto_1213840 ) ) ( not ( = ?auto_1213834 ?auto_1213841 ) ) ( not ( = ?auto_1213834 ?auto_1213843 ) ) ( not ( = ?auto_1213836 ?auto_1213837 ) ) ( not ( = ?auto_1213836 ?auto_1213838 ) ) ( not ( = ?auto_1213836 ?auto_1213839 ) ) ( not ( = ?auto_1213836 ?auto_1213840 ) ) ( not ( = ?auto_1213836 ?auto_1213841 ) ) ( not ( = ?auto_1213836 ?auto_1213843 ) ) ( not ( = ?auto_1213837 ?auto_1213838 ) ) ( not ( = ?auto_1213837 ?auto_1213839 ) ) ( not ( = ?auto_1213837 ?auto_1213840 ) ) ( not ( = ?auto_1213837 ?auto_1213841 ) ) ( not ( = ?auto_1213837 ?auto_1213843 ) ) ( not ( = ?auto_1213838 ?auto_1213839 ) ) ( not ( = ?auto_1213838 ?auto_1213840 ) ) ( not ( = ?auto_1213838 ?auto_1213841 ) ) ( not ( = ?auto_1213838 ?auto_1213843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213839 ?auto_1213840 ?auto_1213841 )
      ( MAKE-12CRATE-VERIFY ?auto_1213830 ?auto_1213831 ?auto_1213832 ?auto_1213829 ?auto_1213833 ?auto_1213835 ?auto_1213834 ?auto_1213836 ?auto_1213837 ?auto_1213838 ?auto_1213839 ?auto_1213840 ?auto_1213841 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213993 - SURFACE
      ?auto_1213994 - SURFACE
      ?auto_1213995 - SURFACE
      ?auto_1213992 - SURFACE
      ?auto_1213996 - SURFACE
      ?auto_1213998 - SURFACE
      ?auto_1213997 - SURFACE
      ?auto_1213999 - SURFACE
      ?auto_1214000 - SURFACE
      ?auto_1214001 - SURFACE
      ?auto_1214002 - SURFACE
      ?auto_1214003 - SURFACE
      ?auto_1214004 - SURFACE
    )
    :vars
    (
      ?auto_1214006 - HOIST
      ?auto_1214007 - PLACE
      ?auto_1214005 - PLACE
      ?auto_1214010 - HOIST
      ?auto_1214008 - SURFACE
      ?auto_1214009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1214006 ?auto_1214007 ) ( IS-CRATE ?auto_1214004 ) ( not ( = ?auto_1214003 ?auto_1214004 ) ) ( not ( = ?auto_1214002 ?auto_1214003 ) ) ( not ( = ?auto_1214002 ?auto_1214004 ) ) ( not ( = ?auto_1214005 ?auto_1214007 ) ) ( HOIST-AT ?auto_1214010 ?auto_1214005 ) ( not ( = ?auto_1214006 ?auto_1214010 ) ) ( AVAILABLE ?auto_1214010 ) ( SURFACE-AT ?auto_1214004 ?auto_1214005 ) ( ON ?auto_1214004 ?auto_1214008 ) ( CLEAR ?auto_1214004 ) ( not ( = ?auto_1214003 ?auto_1214008 ) ) ( not ( = ?auto_1214004 ?auto_1214008 ) ) ( not ( = ?auto_1214002 ?auto_1214008 ) ) ( TRUCK-AT ?auto_1214009 ?auto_1214007 ) ( SURFACE-AT ?auto_1214002 ?auto_1214007 ) ( CLEAR ?auto_1214002 ) ( IS-CRATE ?auto_1214003 ) ( AVAILABLE ?auto_1214006 ) ( IN ?auto_1214003 ?auto_1214009 ) ( ON ?auto_1213994 ?auto_1213993 ) ( ON ?auto_1213995 ?auto_1213994 ) ( ON ?auto_1213992 ?auto_1213995 ) ( ON ?auto_1213996 ?auto_1213992 ) ( ON ?auto_1213998 ?auto_1213996 ) ( ON ?auto_1213997 ?auto_1213998 ) ( ON ?auto_1213999 ?auto_1213997 ) ( ON ?auto_1214000 ?auto_1213999 ) ( ON ?auto_1214001 ?auto_1214000 ) ( ON ?auto_1214002 ?auto_1214001 ) ( not ( = ?auto_1213993 ?auto_1213994 ) ) ( not ( = ?auto_1213993 ?auto_1213995 ) ) ( not ( = ?auto_1213993 ?auto_1213992 ) ) ( not ( = ?auto_1213993 ?auto_1213996 ) ) ( not ( = ?auto_1213993 ?auto_1213998 ) ) ( not ( = ?auto_1213993 ?auto_1213997 ) ) ( not ( = ?auto_1213993 ?auto_1213999 ) ) ( not ( = ?auto_1213993 ?auto_1214000 ) ) ( not ( = ?auto_1213993 ?auto_1214001 ) ) ( not ( = ?auto_1213993 ?auto_1214002 ) ) ( not ( = ?auto_1213993 ?auto_1214003 ) ) ( not ( = ?auto_1213993 ?auto_1214004 ) ) ( not ( = ?auto_1213993 ?auto_1214008 ) ) ( not ( = ?auto_1213994 ?auto_1213995 ) ) ( not ( = ?auto_1213994 ?auto_1213992 ) ) ( not ( = ?auto_1213994 ?auto_1213996 ) ) ( not ( = ?auto_1213994 ?auto_1213998 ) ) ( not ( = ?auto_1213994 ?auto_1213997 ) ) ( not ( = ?auto_1213994 ?auto_1213999 ) ) ( not ( = ?auto_1213994 ?auto_1214000 ) ) ( not ( = ?auto_1213994 ?auto_1214001 ) ) ( not ( = ?auto_1213994 ?auto_1214002 ) ) ( not ( = ?auto_1213994 ?auto_1214003 ) ) ( not ( = ?auto_1213994 ?auto_1214004 ) ) ( not ( = ?auto_1213994 ?auto_1214008 ) ) ( not ( = ?auto_1213995 ?auto_1213992 ) ) ( not ( = ?auto_1213995 ?auto_1213996 ) ) ( not ( = ?auto_1213995 ?auto_1213998 ) ) ( not ( = ?auto_1213995 ?auto_1213997 ) ) ( not ( = ?auto_1213995 ?auto_1213999 ) ) ( not ( = ?auto_1213995 ?auto_1214000 ) ) ( not ( = ?auto_1213995 ?auto_1214001 ) ) ( not ( = ?auto_1213995 ?auto_1214002 ) ) ( not ( = ?auto_1213995 ?auto_1214003 ) ) ( not ( = ?auto_1213995 ?auto_1214004 ) ) ( not ( = ?auto_1213995 ?auto_1214008 ) ) ( not ( = ?auto_1213992 ?auto_1213996 ) ) ( not ( = ?auto_1213992 ?auto_1213998 ) ) ( not ( = ?auto_1213992 ?auto_1213997 ) ) ( not ( = ?auto_1213992 ?auto_1213999 ) ) ( not ( = ?auto_1213992 ?auto_1214000 ) ) ( not ( = ?auto_1213992 ?auto_1214001 ) ) ( not ( = ?auto_1213992 ?auto_1214002 ) ) ( not ( = ?auto_1213992 ?auto_1214003 ) ) ( not ( = ?auto_1213992 ?auto_1214004 ) ) ( not ( = ?auto_1213992 ?auto_1214008 ) ) ( not ( = ?auto_1213996 ?auto_1213998 ) ) ( not ( = ?auto_1213996 ?auto_1213997 ) ) ( not ( = ?auto_1213996 ?auto_1213999 ) ) ( not ( = ?auto_1213996 ?auto_1214000 ) ) ( not ( = ?auto_1213996 ?auto_1214001 ) ) ( not ( = ?auto_1213996 ?auto_1214002 ) ) ( not ( = ?auto_1213996 ?auto_1214003 ) ) ( not ( = ?auto_1213996 ?auto_1214004 ) ) ( not ( = ?auto_1213996 ?auto_1214008 ) ) ( not ( = ?auto_1213998 ?auto_1213997 ) ) ( not ( = ?auto_1213998 ?auto_1213999 ) ) ( not ( = ?auto_1213998 ?auto_1214000 ) ) ( not ( = ?auto_1213998 ?auto_1214001 ) ) ( not ( = ?auto_1213998 ?auto_1214002 ) ) ( not ( = ?auto_1213998 ?auto_1214003 ) ) ( not ( = ?auto_1213998 ?auto_1214004 ) ) ( not ( = ?auto_1213998 ?auto_1214008 ) ) ( not ( = ?auto_1213997 ?auto_1213999 ) ) ( not ( = ?auto_1213997 ?auto_1214000 ) ) ( not ( = ?auto_1213997 ?auto_1214001 ) ) ( not ( = ?auto_1213997 ?auto_1214002 ) ) ( not ( = ?auto_1213997 ?auto_1214003 ) ) ( not ( = ?auto_1213997 ?auto_1214004 ) ) ( not ( = ?auto_1213997 ?auto_1214008 ) ) ( not ( = ?auto_1213999 ?auto_1214000 ) ) ( not ( = ?auto_1213999 ?auto_1214001 ) ) ( not ( = ?auto_1213999 ?auto_1214002 ) ) ( not ( = ?auto_1213999 ?auto_1214003 ) ) ( not ( = ?auto_1213999 ?auto_1214004 ) ) ( not ( = ?auto_1213999 ?auto_1214008 ) ) ( not ( = ?auto_1214000 ?auto_1214001 ) ) ( not ( = ?auto_1214000 ?auto_1214002 ) ) ( not ( = ?auto_1214000 ?auto_1214003 ) ) ( not ( = ?auto_1214000 ?auto_1214004 ) ) ( not ( = ?auto_1214000 ?auto_1214008 ) ) ( not ( = ?auto_1214001 ?auto_1214002 ) ) ( not ( = ?auto_1214001 ?auto_1214003 ) ) ( not ( = ?auto_1214001 ?auto_1214004 ) ) ( not ( = ?auto_1214001 ?auto_1214008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1214002 ?auto_1214003 ?auto_1214004 )
      ( MAKE-12CRATE-VERIFY ?auto_1213993 ?auto_1213994 ?auto_1213995 ?auto_1213992 ?auto_1213996 ?auto_1213998 ?auto_1213997 ?auto_1213999 ?auto_1214000 ?auto_1214001 ?auto_1214002 ?auto_1214003 ?auto_1214004 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1225597 - SURFACE
      ?auto_1225598 - SURFACE
      ?auto_1225599 - SURFACE
      ?auto_1225596 - SURFACE
      ?auto_1225600 - SURFACE
      ?auto_1225602 - SURFACE
      ?auto_1225601 - SURFACE
      ?auto_1225603 - SURFACE
      ?auto_1225604 - SURFACE
      ?auto_1225605 - SURFACE
      ?auto_1225606 - SURFACE
      ?auto_1225607 - SURFACE
      ?auto_1225608 - SURFACE
      ?auto_1225609 - SURFACE
    )
    :vars
    (
      ?auto_1225611 - HOIST
      ?auto_1225610 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1225611 ?auto_1225610 ) ( SURFACE-AT ?auto_1225608 ?auto_1225610 ) ( CLEAR ?auto_1225608 ) ( LIFTING ?auto_1225611 ?auto_1225609 ) ( IS-CRATE ?auto_1225609 ) ( not ( = ?auto_1225608 ?auto_1225609 ) ) ( ON ?auto_1225598 ?auto_1225597 ) ( ON ?auto_1225599 ?auto_1225598 ) ( ON ?auto_1225596 ?auto_1225599 ) ( ON ?auto_1225600 ?auto_1225596 ) ( ON ?auto_1225602 ?auto_1225600 ) ( ON ?auto_1225601 ?auto_1225602 ) ( ON ?auto_1225603 ?auto_1225601 ) ( ON ?auto_1225604 ?auto_1225603 ) ( ON ?auto_1225605 ?auto_1225604 ) ( ON ?auto_1225606 ?auto_1225605 ) ( ON ?auto_1225607 ?auto_1225606 ) ( ON ?auto_1225608 ?auto_1225607 ) ( not ( = ?auto_1225597 ?auto_1225598 ) ) ( not ( = ?auto_1225597 ?auto_1225599 ) ) ( not ( = ?auto_1225597 ?auto_1225596 ) ) ( not ( = ?auto_1225597 ?auto_1225600 ) ) ( not ( = ?auto_1225597 ?auto_1225602 ) ) ( not ( = ?auto_1225597 ?auto_1225601 ) ) ( not ( = ?auto_1225597 ?auto_1225603 ) ) ( not ( = ?auto_1225597 ?auto_1225604 ) ) ( not ( = ?auto_1225597 ?auto_1225605 ) ) ( not ( = ?auto_1225597 ?auto_1225606 ) ) ( not ( = ?auto_1225597 ?auto_1225607 ) ) ( not ( = ?auto_1225597 ?auto_1225608 ) ) ( not ( = ?auto_1225597 ?auto_1225609 ) ) ( not ( = ?auto_1225598 ?auto_1225599 ) ) ( not ( = ?auto_1225598 ?auto_1225596 ) ) ( not ( = ?auto_1225598 ?auto_1225600 ) ) ( not ( = ?auto_1225598 ?auto_1225602 ) ) ( not ( = ?auto_1225598 ?auto_1225601 ) ) ( not ( = ?auto_1225598 ?auto_1225603 ) ) ( not ( = ?auto_1225598 ?auto_1225604 ) ) ( not ( = ?auto_1225598 ?auto_1225605 ) ) ( not ( = ?auto_1225598 ?auto_1225606 ) ) ( not ( = ?auto_1225598 ?auto_1225607 ) ) ( not ( = ?auto_1225598 ?auto_1225608 ) ) ( not ( = ?auto_1225598 ?auto_1225609 ) ) ( not ( = ?auto_1225599 ?auto_1225596 ) ) ( not ( = ?auto_1225599 ?auto_1225600 ) ) ( not ( = ?auto_1225599 ?auto_1225602 ) ) ( not ( = ?auto_1225599 ?auto_1225601 ) ) ( not ( = ?auto_1225599 ?auto_1225603 ) ) ( not ( = ?auto_1225599 ?auto_1225604 ) ) ( not ( = ?auto_1225599 ?auto_1225605 ) ) ( not ( = ?auto_1225599 ?auto_1225606 ) ) ( not ( = ?auto_1225599 ?auto_1225607 ) ) ( not ( = ?auto_1225599 ?auto_1225608 ) ) ( not ( = ?auto_1225599 ?auto_1225609 ) ) ( not ( = ?auto_1225596 ?auto_1225600 ) ) ( not ( = ?auto_1225596 ?auto_1225602 ) ) ( not ( = ?auto_1225596 ?auto_1225601 ) ) ( not ( = ?auto_1225596 ?auto_1225603 ) ) ( not ( = ?auto_1225596 ?auto_1225604 ) ) ( not ( = ?auto_1225596 ?auto_1225605 ) ) ( not ( = ?auto_1225596 ?auto_1225606 ) ) ( not ( = ?auto_1225596 ?auto_1225607 ) ) ( not ( = ?auto_1225596 ?auto_1225608 ) ) ( not ( = ?auto_1225596 ?auto_1225609 ) ) ( not ( = ?auto_1225600 ?auto_1225602 ) ) ( not ( = ?auto_1225600 ?auto_1225601 ) ) ( not ( = ?auto_1225600 ?auto_1225603 ) ) ( not ( = ?auto_1225600 ?auto_1225604 ) ) ( not ( = ?auto_1225600 ?auto_1225605 ) ) ( not ( = ?auto_1225600 ?auto_1225606 ) ) ( not ( = ?auto_1225600 ?auto_1225607 ) ) ( not ( = ?auto_1225600 ?auto_1225608 ) ) ( not ( = ?auto_1225600 ?auto_1225609 ) ) ( not ( = ?auto_1225602 ?auto_1225601 ) ) ( not ( = ?auto_1225602 ?auto_1225603 ) ) ( not ( = ?auto_1225602 ?auto_1225604 ) ) ( not ( = ?auto_1225602 ?auto_1225605 ) ) ( not ( = ?auto_1225602 ?auto_1225606 ) ) ( not ( = ?auto_1225602 ?auto_1225607 ) ) ( not ( = ?auto_1225602 ?auto_1225608 ) ) ( not ( = ?auto_1225602 ?auto_1225609 ) ) ( not ( = ?auto_1225601 ?auto_1225603 ) ) ( not ( = ?auto_1225601 ?auto_1225604 ) ) ( not ( = ?auto_1225601 ?auto_1225605 ) ) ( not ( = ?auto_1225601 ?auto_1225606 ) ) ( not ( = ?auto_1225601 ?auto_1225607 ) ) ( not ( = ?auto_1225601 ?auto_1225608 ) ) ( not ( = ?auto_1225601 ?auto_1225609 ) ) ( not ( = ?auto_1225603 ?auto_1225604 ) ) ( not ( = ?auto_1225603 ?auto_1225605 ) ) ( not ( = ?auto_1225603 ?auto_1225606 ) ) ( not ( = ?auto_1225603 ?auto_1225607 ) ) ( not ( = ?auto_1225603 ?auto_1225608 ) ) ( not ( = ?auto_1225603 ?auto_1225609 ) ) ( not ( = ?auto_1225604 ?auto_1225605 ) ) ( not ( = ?auto_1225604 ?auto_1225606 ) ) ( not ( = ?auto_1225604 ?auto_1225607 ) ) ( not ( = ?auto_1225604 ?auto_1225608 ) ) ( not ( = ?auto_1225604 ?auto_1225609 ) ) ( not ( = ?auto_1225605 ?auto_1225606 ) ) ( not ( = ?auto_1225605 ?auto_1225607 ) ) ( not ( = ?auto_1225605 ?auto_1225608 ) ) ( not ( = ?auto_1225605 ?auto_1225609 ) ) ( not ( = ?auto_1225606 ?auto_1225607 ) ) ( not ( = ?auto_1225606 ?auto_1225608 ) ) ( not ( = ?auto_1225606 ?auto_1225609 ) ) ( not ( = ?auto_1225607 ?auto_1225608 ) ) ( not ( = ?auto_1225607 ?auto_1225609 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1225608 ?auto_1225609 )
      ( MAKE-13CRATE-VERIFY ?auto_1225597 ?auto_1225598 ?auto_1225599 ?auto_1225596 ?auto_1225600 ?auto_1225602 ?auto_1225601 ?auto_1225603 ?auto_1225604 ?auto_1225605 ?auto_1225606 ?auto_1225607 ?auto_1225608 ?auto_1225609 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1225739 - SURFACE
      ?auto_1225740 - SURFACE
      ?auto_1225741 - SURFACE
      ?auto_1225738 - SURFACE
      ?auto_1225742 - SURFACE
      ?auto_1225744 - SURFACE
      ?auto_1225743 - SURFACE
      ?auto_1225745 - SURFACE
      ?auto_1225746 - SURFACE
      ?auto_1225747 - SURFACE
      ?auto_1225748 - SURFACE
      ?auto_1225749 - SURFACE
      ?auto_1225750 - SURFACE
      ?auto_1225751 - SURFACE
    )
    :vars
    (
      ?auto_1225753 - HOIST
      ?auto_1225752 - PLACE
      ?auto_1225754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1225753 ?auto_1225752 ) ( SURFACE-AT ?auto_1225750 ?auto_1225752 ) ( CLEAR ?auto_1225750 ) ( IS-CRATE ?auto_1225751 ) ( not ( = ?auto_1225750 ?auto_1225751 ) ) ( TRUCK-AT ?auto_1225754 ?auto_1225752 ) ( AVAILABLE ?auto_1225753 ) ( IN ?auto_1225751 ?auto_1225754 ) ( ON ?auto_1225750 ?auto_1225749 ) ( not ( = ?auto_1225749 ?auto_1225750 ) ) ( not ( = ?auto_1225749 ?auto_1225751 ) ) ( ON ?auto_1225740 ?auto_1225739 ) ( ON ?auto_1225741 ?auto_1225740 ) ( ON ?auto_1225738 ?auto_1225741 ) ( ON ?auto_1225742 ?auto_1225738 ) ( ON ?auto_1225744 ?auto_1225742 ) ( ON ?auto_1225743 ?auto_1225744 ) ( ON ?auto_1225745 ?auto_1225743 ) ( ON ?auto_1225746 ?auto_1225745 ) ( ON ?auto_1225747 ?auto_1225746 ) ( ON ?auto_1225748 ?auto_1225747 ) ( ON ?auto_1225749 ?auto_1225748 ) ( not ( = ?auto_1225739 ?auto_1225740 ) ) ( not ( = ?auto_1225739 ?auto_1225741 ) ) ( not ( = ?auto_1225739 ?auto_1225738 ) ) ( not ( = ?auto_1225739 ?auto_1225742 ) ) ( not ( = ?auto_1225739 ?auto_1225744 ) ) ( not ( = ?auto_1225739 ?auto_1225743 ) ) ( not ( = ?auto_1225739 ?auto_1225745 ) ) ( not ( = ?auto_1225739 ?auto_1225746 ) ) ( not ( = ?auto_1225739 ?auto_1225747 ) ) ( not ( = ?auto_1225739 ?auto_1225748 ) ) ( not ( = ?auto_1225739 ?auto_1225749 ) ) ( not ( = ?auto_1225739 ?auto_1225750 ) ) ( not ( = ?auto_1225739 ?auto_1225751 ) ) ( not ( = ?auto_1225740 ?auto_1225741 ) ) ( not ( = ?auto_1225740 ?auto_1225738 ) ) ( not ( = ?auto_1225740 ?auto_1225742 ) ) ( not ( = ?auto_1225740 ?auto_1225744 ) ) ( not ( = ?auto_1225740 ?auto_1225743 ) ) ( not ( = ?auto_1225740 ?auto_1225745 ) ) ( not ( = ?auto_1225740 ?auto_1225746 ) ) ( not ( = ?auto_1225740 ?auto_1225747 ) ) ( not ( = ?auto_1225740 ?auto_1225748 ) ) ( not ( = ?auto_1225740 ?auto_1225749 ) ) ( not ( = ?auto_1225740 ?auto_1225750 ) ) ( not ( = ?auto_1225740 ?auto_1225751 ) ) ( not ( = ?auto_1225741 ?auto_1225738 ) ) ( not ( = ?auto_1225741 ?auto_1225742 ) ) ( not ( = ?auto_1225741 ?auto_1225744 ) ) ( not ( = ?auto_1225741 ?auto_1225743 ) ) ( not ( = ?auto_1225741 ?auto_1225745 ) ) ( not ( = ?auto_1225741 ?auto_1225746 ) ) ( not ( = ?auto_1225741 ?auto_1225747 ) ) ( not ( = ?auto_1225741 ?auto_1225748 ) ) ( not ( = ?auto_1225741 ?auto_1225749 ) ) ( not ( = ?auto_1225741 ?auto_1225750 ) ) ( not ( = ?auto_1225741 ?auto_1225751 ) ) ( not ( = ?auto_1225738 ?auto_1225742 ) ) ( not ( = ?auto_1225738 ?auto_1225744 ) ) ( not ( = ?auto_1225738 ?auto_1225743 ) ) ( not ( = ?auto_1225738 ?auto_1225745 ) ) ( not ( = ?auto_1225738 ?auto_1225746 ) ) ( not ( = ?auto_1225738 ?auto_1225747 ) ) ( not ( = ?auto_1225738 ?auto_1225748 ) ) ( not ( = ?auto_1225738 ?auto_1225749 ) ) ( not ( = ?auto_1225738 ?auto_1225750 ) ) ( not ( = ?auto_1225738 ?auto_1225751 ) ) ( not ( = ?auto_1225742 ?auto_1225744 ) ) ( not ( = ?auto_1225742 ?auto_1225743 ) ) ( not ( = ?auto_1225742 ?auto_1225745 ) ) ( not ( = ?auto_1225742 ?auto_1225746 ) ) ( not ( = ?auto_1225742 ?auto_1225747 ) ) ( not ( = ?auto_1225742 ?auto_1225748 ) ) ( not ( = ?auto_1225742 ?auto_1225749 ) ) ( not ( = ?auto_1225742 ?auto_1225750 ) ) ( not ( = ?auto_1225742 ?auto_1225751 ) ) ( not ( = ?auto_1225744 ?auto_1225743 ) ) ( not ( = ?auto_1225744 ?auto_1225745 ) ) ( not ( = ?auto_1225744 ?auto_1225746 ) ) ( not ( = ?auto_1225744 ?auto_1225747 ) ) ( not ( = ?auto_1225744 ?auto_1225748 ) ) ( not ( = ?auto_1225744 ?auto_1225749 ) ) ( not ( = ?auto_1225744 ?auto_1225750 ) ) ( not ( = ?auto_1225744 ?auto_1225751 ) ) ( not ( = ?auto_1225743 ?auto_1225745 ) ) ( not ( = ?auto_1225743 ?auto_1225746 ) ) ( not ( = ?auto_1225743 ?auto_1225747 ) ) ( not ( = ?auto_1225743 ?auto_1225748 ) ) ( not ( = ?auto_1225743 ?auto_1225749 ) ) ( not ( = ?auto_1225743 ?auto_1225750 ) ) ( not ( = ?auto_1225743 ?auto_1225751 ) ) ( not ( = ?auto_1225745 ?auto_1225746 ) ) ( not ( = ?auto_1225745 ?auto_1225747 ) ) ( not ( = ?auto_1225745 ?auto_1225748 ) ) ( not ( = ?auto_1225745 ?auto_1225749 ) ) ( not ( = ?auto_1225745 ?auto_1225750 ) ) ( not ( = ?auto_1225745 ?auto_1225751 ) ) ( not ( = ?auto_1225746 ?auto_1225747 ) ) ( not ( = ?auto_1225746 ?auto_1225748 ) ) ( not ( = ?auto_1225746 ?auto_1225749 ) ) ( not ( = ?auto_1225746 ?auto_1225750 ) ) ( not ( = ?auto_1225746 ?auto_1225751 ) ) ( not ( = ?auto_1225747 ?auto_1225748 ) ) ( not ( = ?auto_1225747 ?auto_1225749 ) ) ( not ( = ?auto_1225747 ?auto_1225750 ) ) ( not ( = ?auto_1225747 ?auto_1225751 ) ) ( not ( = ?auto_1225748 ?auto_1225749 ) ) ( not ( = ?auto_1225748 ?auto_1225750 ) ) ( not ( = ?auto_1225748 ?auto_1225751 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1225749 ?auto_1225750 ?auto_1225751 )
      ( MAKE-13CRATE-VERIFY ?auto_1225739 ?auto_1225740 ?auto_1225741 ?auto_1225738 ?auto_1225742 ?auto_1225744 ?auto_1225743 ?auto_1225745 ?auto_1225746 ?auto_1225747 ?auto_1225748 ?auto_1225749 ?auto_1225750 ?auto_1225751 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1225895 - SURFACE
      ?auto_1225896 - SURFACE
      ?auto_1225897 - SURFACE
      ?auto_1225894 - SURFACE
      ?auto_1225898 - SURFACE
      ?auto_1225900 - SURFACE
      ?auto_1225899 - SURFACE
      ?auto_1225901 - SURFACE
      ?auto_1225902 - SURFACE
      ?auto_1225903 - SURFACE
      ?auto_1225904 - SURFACE
      ?auto_1225905 - SURFACE
      ?auto_1225906 - SURFACE
      ?auto_1225907 - SURFACE
    )
    :vars
    (
      ?auto_1225911 - HOIST
      ?auto_1225910 - PLACE
      ?auto_1225908 - TRUCK
      ?auto_1225909 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1225911 ?auto_1225910 ) ( SURFACE-AT ?auto_1225906 ?auto_1225910 ) ( CLEAR ?auto_1225906 ) ( IS-CRATE ?auto_1225907 ) ( not ( = ?auto_1225906 ?auto_1225907 ) ) ( AVAILABLE ?auto_1225911 ) ( IN ?auto_1225907 ?auto_1225908 ) ( ON ?auto_1225906 ?auto_1225905 ) ( not ( = ?auto_1225905 ?auto_1225906 ) ) ( not ( = ?auto_1225905 ?auto_1225907 ) ) ( TRUCK-AT ?auto_1225908 ?auto_1225909 ) ( not ( = ?auto_1225909 ?auto_1225910 ) ) ( ON ?auto_1225896 ?auto_1225895 ) ( ON ?auto_1225897 ?auto_1225896 ) ( ON ?auto_1225894 ?auto_1225897 ) ( ON ?auto_1225898 ?auto_1225894 ) ( ON ?auto_1225900 ?auto_1225898 ) ( ON ?auto_1225899 ?auto_1225900 ) ( ON ?auto_1225901 ?auto_1225899 ) ( ON ?auto_1225902 ?auto_1225901 ) ( ON ?auto_1225903 ?auto_1225902 ) ( ON ?auto_1225904 ?auto_1225903 ) ( ON ?auto_1225905 ?auto_1225904 ) ( not ( = ?auto_1225895 ?auto_1225896 ) ) ( not ( = ?auto_1225895 ?auto_1225897 ) ) ( not ( = ?auto_1225895 ?auto_1225894 ) ) ( not ( = ?auto_1225895 ?auto_1225898 ) ) ( not ( = ?auto_1225895 ?auto_1225900 ) ) ( not ( = ?auto_1225895 ?auto_1225899 ) ) ( not ( = ?auto_1225895 ?auto_1225901 ) ) ( not ( = ?auto_1225895 ?auto_1225902 ) ) ( not ( = ?auto_1225895 ?auto_1225903 ) ) ( not ( = ?auto_1225895 ?auto_1225904 ) ) ( not ( = ?auto_1225895 ?auto_1225905 ) ) ( not ( = ?auto_1225895 ?auto_1225906 ) ) ( not ( = ?auto_1225895 ?auto_1225907 ) ) ( not ( = ?auto_1225896 ?auto_1225897 ) ) ( not ( = ?auto_1225896 ?auto_1225894 ) ) ( not ( = ?auto_1225896 ?auto_1225898 ) ) ( not ( = ?auto_1225896 ?auto_1225900 ) ) ( not ( = ?auto_1225896 ?auto_1225899 ) ) ( not ( = ?auto_1225896 ?auto_1225901 ) ) ( not ( = ?auto_1225896 ?auto_1225902 ) ) ( not ( = ?auto_1225896 ?auto_1225903 ) ) ( not ( = ?auto_1225896 ?auto_1225904 ) ) ( not ( = ?auto_1225896 ?auto_1225905 ) ) ( not ( = ?auto_1225896 ?auto_1225906 ) ) ( not ( = ?auto_1225896 ?auto_1225907 ) ) ( not ( = ?auto_1225897 ?auto_1225894 ) ) ( not ( = ?auto_1225897 ?auto_1225898 ) ) ( not ( = ?auto_1225897 ?auto_1225900 ) ) ( not ( = ?auto_1225897 ?auto_1225899 ) ) ( not ( = ?auto_1225897 ?auto_1225901 ) ) ( not ( = ?auto_1225897 ?auto_1225902 ) ) ( not ( = ?auto_1225897 ?auto_1225903 ) ) ( not ( = ?auto_1225897 ?auto_1225904 ) ) ( not ( = ?auto_1225897 ?auto_1225905 ) ) ( not ( = ?auto_1225897 ?auto_1225906 ) ) ( not ( = ?auto_1225897 ?auto_1225907 ) ) ( not ( = ?auto_1225894 ?auto_1225898 ) ) ( not ( = ?auto_1225894 ?auto_1225900 ) ) ( not ( = ?auto_1225894 ?auto_1225899 ) ) ( not ( = ?auto_1225894 ?auto_1225901 ) ) ( not ( = ?auto_1225894 ?auto_1225902 ) ) ( not ( = ?auto_1225894 ?auto_1225903 ) ) ( not ( = ?auto_1225894 ?auto_1225904 ) ) ( not ( = ?auto_1225894 ?auto_1225905 ) ) ( not ( = ?auto_1225894 ?auto_1225906 ) ) ( not ( = ?auto_1225894 ?auto_1225907 ) ) ( not ( = ?auto_1225898 ?auto_1225900 ) ) ( not ( = ?auto_1225898 ?auto_1225899 ) ) ( not ( = ?auto_1225898 ?auto_1225901 ) ) ( not ( = ?auto_1225898 ?auto_1225902 ) ) ( not ( = ?auto_1225898 ?auto_1225903 ) ) ( not ( = ?auto_1225898 ?auto_1225904 ) ) ( not ( = ?auto_1225898 ?auto_1225905 ) ) ( not ( = ?auto_1225898 ?auto_1225906 ) ) ( not ( = ?auto_1225898 ?auto_1225907 ) ) ( not ( = ?auto_1225900 ?auto_1225899 ) ) ( not ( = ?auto_1225900 ?auto_1225901 ) ) ( not ( = ?auto_1225900 ?auto_1225902 ) ) ( not ( = ?auto_1225900 ?auto_1225903 ) ) ( not ( = ?auto_1225900 ?auto_1225904 ) ) ( not ( = ?auto_1225900 ?auto_1225905 ) ) ( not ( = ?auto_1225900 ?auto_1225906 ) ) ( not ( = ?auto_1225900 ?auto_1225907 ) ) ( not ( = ?auto_1225899 ?auto_1225901 ) ) ( not ( = ?auto_1225899 ?auto_1225902 ) ) ( not ( = ?auto_1225899 ?auto_1225903 ) ) ( not ( = ?auto_1225899 ?auto_1225904 ) ) ( not ( = ?auto_1225899 ?auto_1225905 ) ) ( not ( = ?auto_1225899 ?auto_1225906 ) ) ( not ( = ?auto_1225899 ?auto_1225907 ) ) ( not ( = ?auto_1225901 ?auto_1225902 ) ) ( not ( = ?auto_1225901 ?auto_1225903 ) ) ( not ( = ?auto_1225901 ?auto_1225904 ) ) ( not ( = ?auto_1225901 ?auto_1225905 ) ) ( not ( = ?auto_1225901 ?auto_1225906 ) ) ( not ( = ?auto_1225901 ?auto_1225907 ) ) ( not ( = ?auto_1225902 ?auto_1225903 ) ) ( not ( = ?auto_1225902 ?auto_1225904 ) ) ( not ( = ?auto_1225902 ?auto_1225905 ) ) ( not ( = ?auto_1225902 ?auto_1225906 ) ) ( not ( = ?auto_1225902 ?auto_1225907 ) ) ( not ( = ?auto_1225903 ?auto_1225904 ) ) ( not ( = ?auto_1225903 ?auto_1225905 ) ) ( not ( = ?auto_1225903 ?auto_1225906 ) ) ( not ( = ?auto_1225903 ?auto_1225907 ) ) ( not ( = ?auto_1225904 ?auto_1225905 ) ) ( not ( = ?auto_1225904 ?auto_1225906 ) ) ( not ( = ?auto_1225904 ?auto_1225907 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1225905 ?auto_1225906 ?auto_1225907 )
      ( MAKE-13CRATE-VERIFY ?auto_1225895 ?auto_1225896 ?auto_1225897 ?auto_1225894 ?auto_1225898 ?auto_1225900 ?auto_1225899 ?auto_1225901 ?auto_1225902 ?auto_1225903 ?auto_1225904 ?auto_1225905 ?auto_1225906 ?auto_1225907 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1226064 - SURFACE
      ?auto_1226065 - SURFACE
      ?auto_1226066 - SURFACE
      ?auto_1226063 - SURFACE
      ?auto_1226067 - SURFACE
      ?auto_1226069 - SURFACE
      ?auto_1226068 - SURFACE
      ?auto_1226070 - SURFACE
      ?auto_1226071 - SURFACE
      ?auto_1226072 - SURFACE
      ?auto_1226073 - SURFACE
      ?auto_1226074 - SURFACE
      ?auto_1226075 - SURFACE
      ?auto_1226076 - SURFACE
    )
    :vars
    (
      ?auto_1226080 - HOIST
      ?auto_1226081 - PLACE
      ?auto_1226079 - TRUCK
      ?auto_1226077 - PLACE
      ?auto_1226078 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1226080 ?auto_1226081 ) ( SURFACE-AT ?auto_1226075 ?auto_1226081 ) ( CLEAR ?auto_1226075 ) ( IS-CRATE ?auto_1226076 ) ( not ( = ?auto_1226075 ?auto_1226076 ) ) ( AVAILABLE ?auto_1226080 ) ( ON ?auto_1226075 ?auto_1226074 ) ( not ( = ?auto_1226074 ?auto_1226075 ) ) ( not ( = ?auto_1226074 ?auto_1226076 ) ) ( TRUCK-AT ?auto_1226079 ?auto_1226077 ) ( not ( = ?auto_1226077 ?auto_1226081 ) ) ( HOIST-AT ?auto_1226078 ?auto_1226077 ) ( LIFTING ?auto_1226078 ?auto_1226076 ) ( not ( = ?auto_1226080 ?auto_1226078 ) ) ( ON ?auto_1226065 ?auto_1226064 ) ( ON ?auto_1226066 ?auto_1226065 ) ( ON ?auto_1226063 ?auto_1226066 ) ( ON ?auto_1226067 ?auto_1226063 ) ( ON ?auto_1226069 ?auto_1226067 ) ( ON ?auto_1226068 ?auto_1226069 ) ( ON ?auto_1226070 ?auto_1226068 ) ( ON ?auto_1226071 ?auto_1226070 ) ( ON ?auto_1226072 ?auto_1226071 ) ( ON ?auto_1226073 ?auto_1226072 ) ( ON ?auto_1226074 ?auto_1226073 ) ( not ( = ?auto_1226064 ?auto_1226065 ) ) ( not ( = ?auto_1226064 ?auto_1226066 ) ) ( not ( = ?auto_1226064 ?auto_1226063 ) ) ( not ( = ?auto_1226064 ?auto_1226067 ) ) ( not ( = ?auto_1226064 ?auto_1226069 ) ) ( not ( = ?auto_1226064 ?auto_1226068 ) ) ( not ( = ?auto_1226064 ?auto_1226070 ) ) ( not ( = ?auto_1226064 ?auto_1226071 ) ) ( not ( = ?auto_1226064 ?auto_1226072 ) ) ( not ( = ?auto_1226064 ?auto_1226073 ) ) ( not ( = ?auto_1226064 ?auto_1226074 ) ) ( not ( = ?auto_1226064 ?auto_1226075 ) ) ( not ( = ?auto_1226064 ?auto_1226076 ) ) ( not ( = ?auto_1226065 ?auto_1226066 ) ) ( not ( = ?auto_1226065 ?auto_1226063 ) ) ( not ( = ?auto_1226065 ?auto_1226067 ) ) ( not ( = ?auto_1226065 ?auto_1226069 ) ) ( not ( = ?auto_1226065 ?auto_1226068 ) ) ( not ( = ?auto_1226065 ?auto_1226070 ) ) ( not ( = ?auto_1226065 ?auto_1226071 ) ) ( not ( = ?auto_1226065 ?auto_1226072 ) ) ( not ( = ?auto_1226065 ?auto_1226073 ) ) ( not ( = ?auto_1226065 ?auto_1226074 ) ) ( not ( = ?auto_1226065 ?auto_1226075 ) ) ( not ( = ?auto_1226065 ?auto_1226076 ) ) ( not ( = ?auto_1226066 ?auto_1226063 ) ) ( not ( = ?auto_1226066 ?auto_1226067 ) ) ( not ( = ?auto_1226066 ?auto_1226069 ) ) ( not ( = ?auto_1226066 ?auto_1226068 ) ) ( not ( = ?auto_1226066 ?auto_1226070 ) ) ( not ( = ?auto_1226066 ?auto_1226071 ) ) ( not ( = ?auto_1226066 ?auto_1226072 ) ) ( not ( = ?auto_1226066 ?auto_1226073 ) ) ( not ( = ?auto_1226066 ?auto_1226074 ) ) ( not ( = ?auto_1226066 ?auto_1226075 ) ) ( not ( = ?auto_1226066 ?auto_1226076 ) ) ( not ( = ?auto_1226063 ?auto_1226067 ) ) ( not ( = ?auto_1226063 ?auto_1226069 ) ) ( not ( = ?auto_1226063 ?auto_1226068 ) ) ( not ( = ?auto_1226063 ?auto_1226070 ) ) ( not ( = ?auto_1226063 ?auto_1226071 ) ) ( not ( = ?auto_1226063 ?auto_1226072 ) ) ( not ( = ?auto_1226063 ?auto_1226073 ) ) ( not ( = ?auto_1226063 ?auto_1226074 ) ) ( not ( = ?auto_1226063 ?auto_1226075 ) ) ( not ( = ?auto_1226063 ?auto_1226076 ) ) ( not ( = ?auto_1226067 ?auto_1226069 ) ) ( not ( = ?auto_1226067 ?auto_1226068 ) ) ( not ( = ?auto_1226067 ?auto_1226070 ) ) ( not ( = ?auto_1226067 ?auto_1226071 ) ) ( not ( = ?auto_1226067 ?auto_1226072 ) ) ( not ( = ?auto_1226067 ?auto_1226073 ) ) ( not ( = ?auto_1226067 ?auto_1226074 ) ) ( not ( = ?auto_1226067 ?auto_1226075 ) ) ( not ( = ?auto_1226067 ?auto_1226076 ) ) ( not ( = ?auto_1226069 ?auto_1226068 ) ) ( not ( = ?auto_1226069 ?auto_1226070 ) ) ( not ( = ?auto_1226069 ?auto_1226071 ) ) ( not ( = ?auto_1226069 ?auto_1226072 ) ) ( not ( = ?auto_1226069 ?auto_1226073 ) ) ( not ( = ?auto_1226069 ?auto_1226074 ) ) ( not ( = ?auto_1226069 ?auto_1226075 ) ) ( not ( = ?auto_1226069 ?auto_1226076 ) ) ( not ( = ?auto_1226068 ?auto_1226070 ) ) ( not ( = ?auto_1226068 ?auto_1226071 ) ) ( not ( = ?auto_1226068 ?auto_1226072 ) ) ( not ( = ?auto_1226068 ?auto_1226073 ) ) ( not ( = ?auto_1226068 ?auto_1226074 ) ) ( not ( = ?auto_1226068 ?auto_1226075 ) ) ( not ( = ?auto_1226068 ?auto_1226076 ) ) ( not ( = ?auto_1226070 ?auto_1226071 ) ) ( not ( = ?auto_1226070 ?auto_1226072 ) ) ( not ( = ?auto_1226070 ?auto_1226073 ) ) ( not ( = ?auto_1226070 ?auto_1226074 ) ) ( not ( = ?auto_1226070 ?auto_1226075 ) ) ( not ( = ?auto_1226070 ?auto_1226076 ) ) ( not ( = ?auto_1226071 ?auto_1226072 ) ) ( not ( = ?auto_1226071 ?auto_1226073 ) ) ( not ( = ?auto_1226071 ?auto_1226074 ) ) ( not ( = ?auto_1226071 ?auto_1226075 ) ) ( not ( = ?auto_1226071 ?auto_1226076 ) ) ( not ( = ?auto_1226072 ?auto_1226073 ) ) ( not ( = ?auto_1226072 ?auto_1226074 ) ) ( not ( = ?auto_1226072 ?auto_1226075 ) ) ( not ( = ?auto_1226072 ?auto_1226076 ) ) ( not ( = ?auto_1226073 ?auto_1226074 ) ) ( not ( = ?auto_1226073 ?auto_1226075 ) ) ( not ( = ?auto_1226073 ?auto_1226076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1226074 ?auto_1226075 ?auto_1226076 )
      ( MAKE-13CRATE-VERIFY ?auto_1226064 ?auto_1226065 ?auto_1226066 ?auto_1226063 ?auto_1226067 ?auto_1226069 ?auto_1226068 ?auto_1226070 ?auto_1226071 ?auto_1226072 ?auto_1226073 ?auto_1226074 ?auto_1226075 ?auto_1226076 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1226246 - SURFACE
      ?auto_1226247 - SURFACE
      ?auto_1226248 - SURFACE
      ?auto_1226245 - SURFACE
      ?auto_1226249 - SURFACE
      ?auto_1226251 - SURFACE
      ?auto_1226250 - SURFACE
      ?auto_1226252 - SURFACE
      ?auto_1226253 - SURFACE
      ?auto_1226254 - SURFACE
      ?auto_1226255 - SURFACE
      ?auto_1226256 - SURFACE
      ?auto_1226257 - SURFACE
      ?auto_1226258 - SURFACE
    )
    :vars
    (
      ?auto_1226262 - HOIST
      ?auto_1226263 - PLACE
      ?auto_1226259 - TRUCK
      ?auto_1226264 - PLACE
      ?auto_1226260 - HOIST
      ?auto_1226261 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1226262 ?auto_1226263 ) ( SURFACE-AT ?auto_1226257 ?auto_1226263 ) ( CLEAR ?auto_1226257 ) ( IS-CRATE ?auto_1226258 ) ( not ( = ?auto_1226257 ?auto_1226258 ) ) ( AVAILABLE ?auto_1226262 ) ( ON ?auto_1226257 ?auto_1226256 ) ( not ( = ?auto_1226256 ?auto_1226257 ) ) ( not ( = ?auto_1226256 ?auto_1226258 ) ) ( TRUCK-AT ?auto_1226259 ?auto_1226264 ) ( not ( = ?auto_1226264 ?auto_1226263 ) ) ( HOIST-AT ?auto_1226260 ?auto_1226264 ) ( not ( = ?auto_1226262 ?auto_1226260 ) ) ( AVAILABLE ?auto_1226260 ) ( SURFACE-AT ?auto_1226258 ?auto_1226264 ) ( ON ?auto_1226258 ?auto_1226261 ) ( CLEAR ?auto_1226258 ) ( not ( = ?auto_1226257 ?auto_1226261 ) ) ( not ( = ?auto_1226258 ?auto_1226261 ) ) ( not ( = ?auto_1226256 ?auto_1226261 ) ) ( ON ?auto_1226247 ?auto_1226246 ) ( ON ?auto_1226248 ?auto_1226247 ) ( ON ?auto_1226245 ?auto_1226248 ) ( ON ?auto_1226249 ?auto_1226245 ) ( ON ?auto_1226251 ?auto_1226249 ) ( ON ?auto_1226250 ?auto_1226251 ) ( ON ?auto_1226252 ?auto_1226250 ) ( ON ?auto_1226253 ?auto_1226252 ) ( ON ?auto_1226254 ?auto_1226253 ) ( ON ?auto_1226255 ?auto_1226254 ) ( ON ?auto_1226256 ?auto_1226255 ) ( not ( = ?auto_1226246 ?auto_1226247 ) ) ( not ( = ?auto_1226246 ?auto_1226248 ) ) ( not ( = ?auto_1226246 ?auto_1226245 ) ) ( not ( = ?auto_1226246 ?auto_1226249 ) ) ( not ( = ?auto_1226246 ?auto_1226251 ) ) ( not ( = ?auto_1226246 ?auto_1226250 ) ) ( not ( = ?auto_1226246 ?auto_1226252 ) ) ( not ( = ?auto_1226246 ?auto_1226253 ) ) ( not ( = ?auto_1226246 ?auto_1226254 ) ) ( not ( = ?auto_1226246 ?auto_1226255 ) ) ( not ( = ?auto_1226246 ?auto_1226256 ) ) ( not ( = ?auto_1226246 ?auto_1226257 ) ) ( not ( = ?auto_1226246 ?auto_1226258 ) ) ( not ( = ?auto_1226246 ?auto_1226261 ) ) ( not ( = ?auto_1226247 ?auto_1226248 ) ) ( not ( = ?auto_1226247 ?auto_1226245 ) ) ( not ( = ?auto_1226247 ?auto_1226249 ) ) ( not ( = ?auto_1226247 ?auto_1226251 ) ) ( not ( = ?auto_1226247 ?auto_1226250 ) ) ( not ( = ?auto_1226247 ?auto_1226252 ) ) ( not ( = ?auto_1226247 ?auto_1226253 ) ) ( not ( = ?auto_1226247 ?auto_1226254 ) ) ( not ( = ?auto_1226247 ?auto_1226255 ) ) ( not ( = ?auto_1226247 ?auto_1226256 ) ) ( not ( = ?auto_1226247 ?auto_1226257 ) ) ( not ( = ?auto_1226247 ?auto_1226258 ) ) ( not ( = ?auto_1226247 ?auto_1226261 ) ) ( not ( = ?auto_1226248 ?auto_1226245 ) ) ( not ( = ?auto_1226248 ?auto_1226249 ) ) ( not ( = ?auto_1226248 ?auto_1226251 ) ) ( not ( = ?auto_1226248 ?auto_1226250 ) ) ( not ( = ?auto_1226248 ?auto_1226252 ) ) ( not ( = ?auto_1226248 ?auto_1226253 ) ) ( not ( = ?auto_1226248 ?auto_1226254 ) ) ( not ( = ?auto_1226248 ?auto_1226255 ) ) ( not ( = ?auto_1226248 ?auto_1226256 ) ) ( not ( = ?auto_1226248 ?auto_1226257 ) ) ( not ( = ?auto_1226248 ?auto_1226258 ) ) ( not ( = ?auto_1226248 ?auto_1226261 ) ) ( not ( = ?auto_1226245 ?auto_1226249 ) ) ( not ( = ?auto_1226245 ?auto_1226251 ) ) ( not ( = ?auto_1226245 ?auto_1226250 ) ) ( not ( = ?auto_1226245 ?auto_1226252 ) ) ( not ( = ?auto_1226245 ?auto_1226253 ) ) ( not ( = ?auto_1226245 ?auto_1226254 ) ) ( not ( = ?auto_1226245 ?auto_1226255 ) ) ( not ( = ?auto_1226245 ?auto_1226256 ) ) ( not ( = ?auto_1226245 ?auto_1226257 ) ) ( not ( = ?auto_1226245 ?auto_1226258 ) ) ( not ( = ?auto_1226245 ?auto_1226261 ) ) ( not ( = ?auto_1226249 ?auto_1226251 ) ) ( not ( = ?auto_1226249 ?auto_1226250 ) ) ( not ( = ?auto_1226249 ?auto_1226252 ) ) ( not ( = ?auto_1226249 ?auto_1226253 ) ) ( not ( = ?auto_1226249 ?auto_1226254 ) ) ( not ( = ?auto_1226249 ?auto_1226255 ) ) ( not ( = ?auto_1226249 ?auto_1226256 ) ) ( not ( = ?auto_1226249 ?auto_1226257 ) ) ( not ( = ?auto_1226249 ?auto_1226258 ) ) ( not ( = ?auto_1226249 ?auto_1226261 ) ) ( not ( = ?auto_1226251 ?auto_1226250 ) ) ( not ( = ?auto_1226251 ?auto_1226252 ) ) ( not ( = ?auto_1226251 ?auto_1226253 ) ) ( not ( = ?auto_1226251 ?auto_1226254 ) ) ( not ( = ?auto_1226251 ?auto_1226255 ) ) ( not ( = ?auto_1226251 ?auto_1226256 ) ) ( not ( = ?auto_1226251 ?auto_1226257 ) ) ( not ( = ?auto_1226251 ?auto_1226258 ) ) ( not ( = ?auto_1226251 ?auto_1226261 ) ) ( not ( = ?auto_1226250 ?auto_1226252 ) ) ( not ( = ?auto_1226250 ?auto_1226253 ) ) ( not ( = ?auto_1226250 ?auto_1226254 ) ) ( not ( = ?auto_1226250 ?auto_1226255 ) ) ( not ( = ?auto_1226250 ?auto_1226256 ) ) ( not ( = ?auto_1226250 ?auto_1226257 ) ) ( not ( = ?auto_1226250 ?auto_1226258 ) ) ( not ( = ?auto_1226250 ?auto_1226261 ) ) ( not ( = ?auto_1226252 ?auto_1226253 ) ) ( not ( = ?auto_1226252 ?auto_1226254 ) ) ( not ( = ?auto_1226252 ?auto_1226255 ) ) ( not ( = ?auto_1226252 ?auto_1226256 ) ) ( not ( = ?auto_1226252 ?auto_1226257 ) ) ( not ( = ?auto_1226252 ?auto_1226258 ) ) ( not ( = ?auto_1226252 ?auto_1226261 ) ) ( not ( = ?auto_1226253 ?auto_1226254 ) ) ( not ( = ?auto_1226253 ?auto_1226255 ) ) ( not ( = ?auto_1226253 ?auto_1226256 ) ) ( not ( = ?auto_1226253 ?auto_1226257 ) ) ( not ( = ?auto_1226253 ?auto_1226258 ) ) ( not ( = ?auto_1226253 ?auto_1226261 ) ) ( not ( = ?auto_1226254 ?auto_1226255 ) ) ( not ( = ?auto_1226254 ?auto_1226256 ) ) ( not ( = ?auto_1226254 ?auto_1226257 ) ) ( not ( = ?auto_1226254 ?auto_1226258 ) ) ( not ( = ?auto_1226254 ?auto_1226261 ) ) ( not ( = ?auto_1226255 ?auto_1226256 ) ) ( not ( = ?auto_1226255 ?auto_1226257 ) ) ( not ( = ?auto_1226255 ?auto_1226258 ) ) ( not ( = ?auto_1226255 ?auto_1226261 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1226256 ?auto_1226257 ?auto_1226258 )
      ( MAKE-13CRATE-VERIFY ?auto_1226246 ?auto_1226247 ?auto_1226248 ?auto_1226245 ?auto_1226249 ?auto_1226251 ?auto_1226250 ?auto_1226252 ?auto_1226253 ?auto_1226254 ?auto_1226255 ?auto_1226256 ?auto_1226257 ?auto_1226258 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1226429 - SURFACE
      ?auto_1226430 - SURFACE
      ?auto_1226431 - SURFACE
      ?auto_1226428 - SURFACE
      ?auto_1226432 - SURFACE
      ?auto_1226434 - SURFACE
      ?auto_1226433 - SURFACE
      ?auto_1226435 - SURFACE
      ?auto_1226436 - SURFACE
      ?auto_1226437 - SURFACE
      ?auto_1226438 - SURFACE
      ?auto_1226439 - SURFACE
      ?auto_1226440 - SURFACE
      ?auto_1226441 - SURFACE
    )
    :vars
    (
      ?auto_1226447 - HOIST
      ?auto_1226443 - PLACE
      ?auto_1226446 - PLACE
      ?auto_1226445 - HOIST
      ?auto_1226442 - SURFACE
      ?auto_1226444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1226447 ?auto_1226443 ) ( SURFACE-AT ?auto_1226440 ?auto_1226443 ) ( CLEAR ?auto_1226440 ) ( IS-CRATE ?auto_1226441 ) ( not ( = ?auto_1226440 ?auto_1226441 ) ) ( AVAILABLE ?auto_1226447 ) ( ON ?auto_1226440 ?auto_1226439 ) ( not ( = ?auto_1226439 ?auto_1226440 ) ) ( not ( = ?auto_1226439 ?auto_1226441 ) ) ( not ( = ?auto_1226446 ?auto_1226443 ) ) ( HOIST-AT ?auto_1226445 ?auto_1226446 ) ( not ( = ?auto_1226447 ?auto_1226445 ) ) ( AVAILABLE ?auto_1226445 ) ( SURFACE-AT ?auto_1226441 ?auto_1226446 ) ( ON ?auto_1226441 ?auto_1226442 ) ( CLEAR ?auto_1226441 ) ( not ( = ?auto_1226440 ?auto_1226442 ) ) ( not ( = ?auto_1226441 ?auto_1226442 ) ) ( not ( = ?auto_1226439 ?auto_1226442 ) ) ( TRUCK-AT ?auto_1226444 ?auto_1226443 ) ( ON ?auto_1226430 ?auto_1226429 ) ( ON ?auto_1226431 ?auto_1226430 ) ( ON ?auto_1226428 ?auto_1226431 ) ( ON ?auto_1226432 ?auto_1226428 ) ( ON ?auto_1226434 ?auto_1226432 ) ( ON ?auto_1226433 ?auto_1226434 ) ( ON ?auto_1226435 ?auto_1226433 ) ( ON ?auto_1226436 ?auto_1226435 ) ( ON ?auto_1226437 ?auto_1226436 ) ( ON ?auto_1226438 ?auto_1226437 ) ( ON ?auto_1226439 ?auto_1226438 ) ( not ( = ?auto_1226429 ?auto_1226430 ) ) ( not ( = ?auto_1226429 ?auto_1226431 ) ) ( not ( = ?auto_1226429 ?auto_1226428 ) ) ( not ( = ?auto_1226429 ?auto_1226432 ) ) ( not ( = ?auto_1226429 ?auto_1226434 ) ) ( not ( = ?auto_1226429 ?auto_1226433 ) ) ( not ( = ?auto_1226429 ?auto_1226435 ) ) ( not ( = ?auto_1226429 ?auto_1226436 ) ) ( not ( = ?auto_1226429 ?auto_1226437 ) ) ( not ( = ?auto_1226429 ?auto_1226438 ) ) ( not ( = ?auto_1226429 ?auto_1226439 ) ) ( not ( = ?auto_1226429 ?auto_1226440 ) ) ( not ( = ?auto_1226429 ?auto_1226441 ) ) ( not ( = ?auto_1226429 ?auto_1226442 ) ) ( not ( = ?auto_1226430 ?auto_1226431 ) ) ( not ( = ?auto_1226430 ?auto_1226428 ) ) ( not ( = ?auto_1226430 ?auto_1226432 ) ) ( not ( = ?auto_1226430 ?auto_1226434 ) ) ( not ( = ?auto_1226430 ?auto_1226433 ) ) ( not ( = ?auto_1226430 ?auto_1226435 ) ) ( not ( = ?auto_1226430 ?auto_1226436 ) ) ( not ( = ?auto_1226430 ?auto_1226437 ) ) ( not ( = ?auto_1226430 ?auto_1226438 ) ) ( not ( = ?auto_1226430 ?auto_1226439 ) ) ( not ( = ?auto_1226430 ?auto_1226440 ) ) ( not ( = ?auto_1226430 ?auto_1226441 ) ) ( not ( = ?auto_1226430 ?auto_1226442 ) ) ( not ( = ?auto_1226431 ?auto_1226428 ) ) ( not ( = ?auto_1226431 ?auto_1226432 ) ) ( not ( = ?auto_1226431 ?auto_1226434 ) ) ( not ( = ?auto_1226431 ?auto_1226433 ) ) ( not ( = ?auto_1226431 ?auto_1226435 ) ) ( not ( = ?auto_1226431 ?auto_1226436 ) ) ( not ( = ?auto_1226431 ?auto_1226437 ) ) ( not ( = ?auto_1226431 ?auto_1226438 ) ) ( not ( = ?auto_1226431 ?auto_1226439 ) ) ( not ( = ?auto_1226431 ?auto_1226440 ) ) ( not ( = ?auto_1226431 ?auto_1226441 ) ) ( not ( = ?auto_1226431 ?auto_1226442 ) ) ( not ( = ?auto_1226428 ?auto_1226432 ) ) ( not ( = ?auto_1226428 ?auto_1226434 ) ) ( not ( = ?auto_1226428 ?auto_1226433 ) ) ( not ( = ?auto_1226428 ?auto_1226435 ) ) ( not ( = ?auto_1226428 ?auto_1226436 ) ) ( not ( = ?auto_1226428 ?auto_1226437 ) ) ( not ( = ?auto_1226428 ?auto_1226438 ) ) ( not ( = ?auto_1226428 ?auto_1226439 ) ) ( not ( = ?auto_1226428 ?auto_1226440 ) ) ( not ( = ?auto_1226428 ?auto_1226441 ) ) ( not ( = ?auto_1226428 ?auto_1226442 ) ) ( not ( = ?auto_1226432 ?auto_1226434 ) ) ( not ( = ?auto_1226432 ?auto_1226433 ) ) ( not ( = ?auto_1226432 ?auto_1226435 ) ) ( not ( = ?auto_1226432 ?auto_1226436 ) ) ( not ( = ?auto_1226432 ?auto_1226437 ) ) ( not ( = ?auto_1226432 ?auto_1226438 ) ) ( not ( = ?auto_1226432 ?auto_1226439 ) ) ( not ( = ?auto_1226432 ?auto_1226440 ) ) ( not ( = ?auto_1226432 ?auto_1226441 ) ) ( not ( = ?auto_1226432 ?auto_1226442 ) ) ( not ( = ?auto_1226434 ?auto_1226433 ) ) ( not ( = ?auto_1226434 ?auto_1226435 ) ) ( not ( = ?auto_1226434 ?auto_1226436 ) ) ( not ( = ?auto_1226434 ?auto_1226437 ) ) ( not ( = ?auto_1226434 ?auto_1226438 ) ) ( not ( = ?auto_1226434 ?auto_1226439 ) ) ( not ( = ?auto_1226434 ?auto_1226440 ) ) ( not ( = ?auto_1226434 ?auto_1226441 ) ) ( not ( = ?auto_1226434 ?auto_1226442 ) ) ( not ( = ?auto_1226433 ?auto_1226435 ) ) ( not ( = ?auto_1226433 ?auto_1226436 ) ) ( not ( = ?auto_1226433 ?auto_1226437 ) ) ( not ( = ?auto_1226433 ?auto_1226438 ) ) ( not ( = ?auto_1226433 ?auto_1226439 ) ) ( not ( = ?auto_1226433 ?auto_1226440 ) ) ( not ( = ?auto_1226433 ?auto_1226441 ) ) ( not ( = ?auto_1226433 ?auto_1226442 ) ) ( not ( = ?auto_1226435 ?auto_1226436 ) ) ( not ( = ?auto_1226435 ?auto_1226437 ) ) ( not ( = ?auto_1226435 ?auto_1226438 ) ) ( not ( = ?auto_1226435 ?auto_1226439 ) ) ( not ( = ?auto_1226435 ?auto_1226440 ) ) ( not ( = ?auto_1226435 ?auto_1226441 ) ) ( not ( = ?auto_1226435 ?auto_1226442 ) ) ( not ( = ?auto_1226436 ?auto_1226437 ) ) ( not ( = ?auto_1226436 ?auto_1226438 ) ) ( not ( = ?auto_1226436 ?auto_1226439 ) ) ( not ( = ?auto_1226436 ?auto_1226440 ) ) ( not ( = ?auto_1226436 ?auto_1226441 ) ) ( not ( = ?auto_1226436 ?auto_1226442 ) ) ( not ( = ?auto_1226437 ?auto_1226438 ) ) ( not ( = ?auto_1226437 ?auto_1226439 ) ) ( not ( = ?auto_1226437 ?auto_1226440 ) ) ( not ( = ?auto_1226437 ?auto_1226441 ) ) ( not ( = ?auto_1226437 ?auto_1226442 ) ) ( not ( = ?auto_1226438 ?auto_1226439 ) ) ( not ( = ?auto_1226438 ?auto_1226440 ) ) ( not ( = ?auto_1226438 ?auto_1226441 ) ) ( not ( = ?auto_1226438 ?auto_1226442 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1226439 ?auto_1226440 ?auto_1226441 )
      ( MAKE-13CRATE-VERIFY ?auto_1226429 ?auto_1226430 ?auto_1226431 ?auto_1226428 ?auto_1226432 ?auto_1226434 ?auto_1226433 ?auto_1226435 ?auto_1226436 ?auto_1226437 ?auto_1226438 ?auto_1226439 ?auto_1226440 ?auto_1226441 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1226612 - SURFACE
      ?auto_1226613 - SURFACE
      ?auto_1226614 - SURFACE
      ?auto_1226611 - SURFACE
      ?auto_1226615 - SURFACE
      ?auto_1226617 - SURFACE
      ?auto_1226616 - SURFACE
      ?auto_1226618 - SURFACE
      ?auto_1226619 - SURFACE
      ?auto_1226620 - SURFACE
      ?auto_1226621 - SURFACE
      ?auto_1226622 - SURFACE
      ?auto_1226623 - SURFACE
      ?auto_1226624 - SURFACE
    )
    :vars
    (
      ?auto_1226625 - HOIST
      ?auto_1226630 - PLACE
      ?auto_1226626 - PLACE
      ?auto_1226627 - HOIST
      ?auto_1226629 - SURFACE
      ?auto_1226628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1226625 ?auto_1226630 ) ( IS-CRATE ?auto_1226624 ) ( not ( = ?auto_1226623 ?auto_1226624 ) ) ( not ( = ?auto_1226622 ?auto_1226623 ) ) ( not ( = ?auto_1226622 ?auto_1226624 ) ) ( not ( = ?auto_1226626 ?auto_1226630 ) ) ( HOIST-AT ?auto_1226627 ?auto_1226626 ) ( not ( = ?auto_1226625 ?auto_1226627 ) ) ( AVAILABLE ?auto_1226627 ) ( SURFACE-AT ?auto_1226624 ?auto_1226626 ) ( ON ?auto_1226624 ?auto_1226629 ) ( CLEAR ?auto_1226624 ) ( not ( = ?auto_1226623 ?auto_1226629 ) ) ( not ( = ?auto_1226624 ?auto_1226629 ) ) ( not ( = ?auto_1226622 ?auto_1226629 ) ) ( TRUCK-AT ?auto_1226628 ?auto_1226630 ) ( SURFACE-AT ?auto_1226622 ?auto_1226630 ) ( CLEAR ?auto_1226622 ) ( LIFTING ?auto_1226625 ?auto_1226623 ) ( IS-CRATE ?auto_1226623 ) ( ON ?auto_1226613 ?auto_1226612 ) ( ON ?auto_1226614 ?auto_1226613 ) ( ON ?auto_1226611 ?auto_1226614 ) ( ON ?auto_1226615 ?auto_1226611 ) ( ON ?auto_1226617 ?auto_1226615 ) ( ON ?auto_1226616 ?auto_1226617 ) ( ON ?auto_1226618 ?auto_1226616 ) ( ON ?auto_1226619 ?auto_1226618 ) ( ON ?auto_1226620 ?auto_1226619 ) ( ON ?auto_1226621 ?auto_1226620 ) ( ON ?auto_1226622 ?auto_1226621 ) ( not ( = ?auto_1226612 ?auto_1226613 ) ) ( not ( = ?auto_1226612 ?auto_1226614 ) ) ( not ( = ?auto_1226612 ?auto_1226611 ) ) ( not ( = ?auto_1226612 ?auto_1226615 ) ) ( not ( = ?auto_1226612 ?auto_1226617 ) ) ( not ( = ?auto_1226612 ?auto_1226616 ) ) ( not ( = ?auto_1226612 ?auto_1226618 ) ) ( not ( = ?auto_1226612 ?auto_1226619 ) ) ( not ( = ?auto_1226612 ?auto_1226620 ) ) ( not ( = ?auto_1226612 ?auto_1226621 ) ) ( not ( = ?auto_1226612 ?auto_1226622 ) ) ( not ( = ?auto_1226612 ?auto_1226623 ) ) ( not ( = ?auto_1226612 ?auto_1226624 ) ) ( not ( = ?auto_1226612 ?auto_1226629 ) ) ( not ( = ?auto_1226613 ?auto_1226614 ) ) ( not ( = ?auto_1226613 ?auto_1226611 ) ) ( not ( = ?auto_1226613 ?auto_1226615 ) ) ( not ( = ?auto_1226613 ?auto_1226617 ) ) ( not ( = ?auto_1226613 ?auto_1226616 ) ) ( not ( = ?auto_1226613 ?auto_1226618 ) ) ( not ( = ?auto_1226613 ?auto_1226619 ) ) ( not ( = ?auto_1226613 ?auto_1226620 ) ) ( not ( = ?auto_1226613 ?auto_1226621 ) ) ( not ( = ?auto_1226613 ?auto_1226622 ) ) ( not ( = ?auto_1226613 ?auto_1226623 ) ) ( not ( = ?auto_1226613 ?auto_1226624 ) ) ( not ( = ?auto_1226613 ?auto_1226629 ) ) ( not ( = ?auto_1226614 ?auto_1226611 ) ) ( not ( = ?auto_1226614 ?auto_1226615 ) ) ( not ( = ?auto_1226614 ?auto_1226617 ) ) ( not ( = ?auto_1226614 ?auto_1226616 ) ) ( not ( = ?auto_1226614 ?auto_1226618 ) ) ( not ( = ?auto_1226614 ?auto_1226619 ) ) ( not ( = ?auto_1226614 ?auto_1226620 ) ) ( not ( = ?auto_1226614 ?auto_1226621 ) ) ( not ( = ?auto_1226614 ?auto_1226622 ) ) ( not ( = ?auto_1226614 ?auto_1226623 ) ) ( not ( = ?auto_1226614 ?auto_1226624 ) ) ( not ( = ?auto_1226614 ?auto_1226629 ) ) ( not ( = ?auto_1226611 ?auto_1226615 ) ) ( not ( = ?auto_1226611 ?auto_1226617 ) ) ( not ( = ?auto_1226611 ?auto_1226616 ) ) ( not ( = ?auto_1226611 ?auto_1226618 ) ) ( not ( = ?auto_1226611 ?auto_1226619 ) ) ( not ( = ?auto_1226611 ?auto_1226620 ) ) ( not ( = ?auto_1226611 ?auto_1226621 ) ) ( not ( = ?auto_1226611 ?auto_1226622 ) ) ( not ( = ?auto_1226611 ?auto_1226623 ) ) ( not ( = ?auto_1226611 ?auto_1226624 ) ) ( not ( = ?auto_1226611 ?auto_1226629 ) ) ( not ( = ?auto_1226615 ?auto_1226617 ) ) ( not ( = ?auto_1226615 ?auto_1226616 ) ) ( not ( = ?auto_1226615 ?auto_1226618 ) ) ( not ( = ?auto_1226615 ?auto_1226619 ) ) ( not ( = ?auto_1226615 ?auto_1226620 ) ) ( not ( = ?auto_1226615 ?auto_1226621 ) ) ( not ( = ?auto_1226615 ?auto_1226622 ) ) ( not ( = ?auto_1226615 ?auto_1226623 ) ) ( not ( = ?auto_1226615 ?auto_1226624 ) ) ( not ( = ?auto_1226615 ?auto_1226629 ) ) ( not ( = ?auto_1226617 ?auto_1226616 ) ) ( not ( = ?auto_1226617 ?auto_1226618 ) ) ( not ( = ?auto_1226617 ?auto_1226619 ) ) ( not ( = ?auto_1226617 ?auto_1226620 ) ) ( not ( = ?auto_1226617 ?auto_1226621 ) ) ( not ( = ?auto_1226617 ?auto_1226622 ) ) ( not ( = ?auto_1226617 ?auto_1226623 ) ) ( not ( = ?auto_1226617 ?auto_1226624 ) ) ( not ( = ?auto_1226617 ?auto_1226629 ) ) ( not ( = ?auto_1226616 ?auto_1226618 ) ) ( not ( = ?auto_1226616 ?auto_1226619 ) ) ( not ( = ?auto_1226616 ?auto_1226620 ) ) ( not ( = ?auto_1226616 ?auto_1226621 ) ) ( not ( = ?auto_1226616 ?auto_1226622 ) ) ( not ( = ?auto_1226616 ?auto_1226623 ) ) ( not ( = ?auto_1226616 ?auto_1226624 ) ) ( not ( = ?auto_1226616 ?auto_1226629 ) ) ( not ( = ?auto_1226618 ?auto_1226619 ) ) ( not ( = ?auto_1226618 ?auto_1226620 ) ) ( not ( = ?auto_1226618 ?auto_1226621 ) ) ( not ( = ?auto_1226618 ?auto_1226622 ) ) ( not ( = ?auto_1226618 ?auto_1226623 ) ) ( not ( = ?auto_1226618 ?auto_1226624 ) ) ( not ( = ?auto_1226618 ?auto_1226629 ) ) ( not ( = ?auto_1226619 ?auto_1226620 ) ) ( not ( = ?auto_1226619 ?auto_1226621 ) ) ( not ( = ?auto_1226619 ?auto_1226622 ) ) ( not ( = ?auto_1226619 ?auto_1226623 ) ) ( not ( = ?auto_1226619 ?auto_1226624 ) ) ( not ( = ?auto_1226619 ?auto_1226629 ) ) ( not ( = ?auto_1226620 ?auto_1226621 ) ) ( not ( = ?auto_1226620 ?auto_1226622 ) ) ( not ( = ?auto_1226620 ?auto_1226623 ) ) ( not ( = ?auto_1226620 ?auto_1226624 ) ) ( not ( = ?auto_1226620 ?auto_1226629 ) ) ( not ( = ?auto_1226621 ?auto_1226622 ) ) ( not ( = ?auto_1226621 ?auto_1226623 ) ) ( not ( = ?auto_1226621 ?auto_1226624 ) ) ( not ( = ?auto_1226621 ?auto_1226629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1226622 ?auto_1226623 ?auto_1226624 )
      ( MAKE-13CRATE-VERIFY ?auto_1226612 ?auto_1226613 ?auto_1226614 ?auto_1226611 ?auto_1226615 ?auto_1226617 ?auto_1226616 ?auto_1226618 ?auto_1226619 ?auto_1226620 ?auto_1226621 ?auto_1226622 ?auto_1226623 ?auto_1226624 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1226795 - SURFACE
      ?auto_1226796 - SURFACE
      ?auto_1226797 - SURFACE
      ?auto_1226794 - SURFACE
      ?auto_1226798 - SURFACE
      ?auto_1226800 - SURFACE
      ?auto_1226799 - SURFACE
      ?auto_1226801 - SURFACE
      ?auto_1226802 - SURFACE
      ?auto_1226803 - SURFACE
      ?auto_1226804 - SURFACE
      ?auto_1226805 - SURFACE
      ?auto_1226806 - SURFACE
      ?auto_1226807 - SURFACE
    )
    :vars
    (
      ?auto_1226811 - HOIST
      ?auto_1226809 - PLACE
      ?auto_1226810 - PLACE
      ?auto_1226813 - HOIST
      ?auto_1226812 - SURFACE
      ?auto_1226808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1226811 ?auto_1226809 ) ( IS-CRATE ?auto_1226807 ) ( not ( = ?auto_1226806 ?auto_1226807 ) ) ( not ( = ?auto_1226805 ?auto_1226806 ) ) ( not ( = ?auto_1226805 ?auto_1226807 ) ) ( not ( = ?auto_1226810 ?auto_1226809 ) ) ( HOIST-AT ?auto_1226813 ?auto_1226810 ) ( not ( = ?auto_1226811 ?auto_1226813 ) ) ( AVAILABLE ?auto_1226813 ) ( SURFACE-AT ?auto_1226807 ?auto_1226810 ) ( ON ?auto_1226807 ?auto_1226812 ) ( CLEAR ?auto_1226807 ) ( not ( = ?auto_1226806 ?auto_1226812 ) ) ( not ( = ?auto_1226807 ?auto_1226812 ) ) ( not ( = ?auto_1226805 ?auto_1226812 ) ) ( TRUCK-AT ?auto_1226808 ?auto_1226809 ) ( SURFACE-AT ?auto_1226805 ?auto_1226809 ) ( CLEAR ?auto_1226805 ) ( IS-CRATE ?auto_1226806 ) ( AVAILABLE ?auto_1226811 ) ( IN ?auto_1226806 ?auto_1226808 ) ( ON ?auto_1226796 ?auto_1226795 ) ( ON ?auto_1226797 ?auto_1226796 ) ( ON ?auto_1226794 ?auto_1226797 ) ( ON ?auto_1226798 ?auto_1226794 ) ( ON ?auto_1226800 ?auto_1226798 ) ( ON ?auto_1226799 ?auto_1226800 ) ( ON ?auto_1226801 ?auto_1226799 ) ( ON ?auto_1226802 ?auto_1226801 ) ( ON ?auto_1226803 ?auto_1226802 ) ( ON ?auto_1226804 ?auto_1226803 ) ( ON ?auto_1226805 ?auto_1226804 ) ( not ( = ?auto_1226795 ?auto_1226796 ) ) ( not ( = ?auto_1226795 ?auto_1226797 ) ) ( not ( = ?auto_1226795 ?auto_1226794 ) ) ( not ( = ?auto_1226795 ?auto_1226798 ) ) ( not ( = ?auto_1226795 ?auto_1226800 ) ) ( not ( = ?auto_1226795 ?auto_1226799 ) ) ( not ( = ?auto_1226795 ?auto_1226801 ) ) ( not ( = ?auto_1226795 ?auto_1226802 ) ) ( not ( = ?auto_1226795 ?auto_1226803 ) ) ( not ( = ?auto_1226795 ?auto_1226804 ) ) ( not ( = ?auto_1226795 ?auto_1226805 ) ) ( not ( = ?auto_1226795 ?auto_1226806 ) ) ( not ( = ?auto_1226795 ?auto_1226807 ) ) ( not ( = ?auto_1226795 ?auto_1226812 ) ) ( not ( = ?auto_1226796 ?auto_1226797 ) ) ( not ( = ?auto_1226796 ?auto_1226794 ) ) ( not ( = ?auto_1226796 ?auto_1226798 ) ) ( not ( = ?auto_1226796 ?auto_1226800 ) ) ( not ( = ?auto_1226796 ?auto_1226799 ) ) ( not ( = ?auto_1226796 ?auto_1226801 ) ) ( not ( = ?auto_1226796 ?auto_1226802 ) ) ( not ( = ?auto_1226796 ?auto_1226803 ) ) ( not ( = ?auto_1226796 ?auto_1226804 ) ) ( not ( = ?auto_1226796 ?auto_1226805 ) ) ( not ( = ?auto_1226796 ?auto_1226806 ) ) ( not ( = ?auto_1226796 ?auto_1226807 ) ) ( not ( = ?auto_1226796 ?auto_1226812 ) ) ( not ( = ?auto_1226797 ?auto_1226794 ) ) ( not ( = ?auto_1226797 ?auto_1226798 ) ) ( not ( = ?auto_1226797 ?auto_1226800 ) ) ( not ( = ?auto_1226797 ?auto_1226799 ) ) ( not ( = ?auto_1226797 ?auto_1226801 ) ) ( not ( = ?auto_1226797 ?auto_1226802 ) ) ( not ( = ?auto_1226797 ?auto_1226803 ) ) ( not ( = ?auto_1226797 ?auto_1226804 ) ) ( not ( = ?auto_1226797 ?auto_1226805 ) ) ( not ( = ?auto_1226797 ?auto_1226806 ) ) ( not ( = ?auto_1226797 ?auto_1226807 ) ) ( not ( = ?auto_1226797 ?auto_1226812 ) ) ( not ( = ?auto_1226794 ?auto_1226798 ) ) ( not ( = ?auto_1226794 ?auto_1226800 ) ) ( not ( = ?auto_1226794 ?auto_1226799 ) ) ( not ( = ?auto_1226794 ?auto_1226801 ) ) ( not ( = ?auto_1226794 ?auto_1226802 ) ) ( not ( = ?auto_1226794 ?auto_1226803 ) ) ( not ( = ?auto_1226794 ?auto_1226804 ) ) ( not ( = ?auto_1226794 ?auto_1226805 ) ) ( not ( = ?auto_1226794 ?auto_1226806 ) ) ( not ( = ?auto_1226794 ?auto_1226807 ) ) ( not ( = ?auto_1226794 ?auto_1226812 ) ) ( not ( = ?auto_1226798 ?auto_1226800 ) ) ( not ( = ?auto_1226798 ?auto_1226799 ) ) ( not ( = ?auto_1226798 ?auto_1226801 ) ) ( not ( = ?auto_1226798 ?auto_1226802 ) ) ( not ( = ?auto_1226798 ?auto_1226803 ) ) ( not ( = ?auto_1226798 ?auto_1226804 ) ) ( not ( = ?auto_1226798 ?auto_1226805 ) ) ( not ( = ?auto_1226798 ?auto_1226806 ) ) ( not ( = ?auto_1226798 ?auto_1226807 ) ) ( not ( = ?auto_1226798 ?auto_1226812 ) ) ( not ( = ?auto_1226800 ?auto_1226799 ) ) ( not ( = ?auto_1226800 ?auto_1226801 ) ) ( not ( = ?auto_1226800 ?auto_1226802 ) ) ( not ( = ?auto_1226800 ?auto_1226803 ) ) ( not ( = ?auto_1226800 ?auto_1226804 ) ) ( not ( = ?auto_1226800 ?auto_1226805 ) ) ( not ( = ?auto_1226800 ?auto_1226806 ) ) ( not ( = ?auto_1226800 ?auto_1226807 ) ) ( not ( = ?auto_1226800 ?auto_1226812 ) ) ( not ( = ?auto_1226799 ?auto_1226801 ) ) ( not ( = ?auto_1226799 ?auto_1226802 ) ) ( not ( = ?auto_1226799 ?auto_1226803 ) ) ( not ( = ?auto_1226799 ?auto_1226804 ) ) ( not ( = ?auto_1226799 ?auto_1226805 ) ) ( not ( = ?auto_1226799 ?auto_1226806 ) ) ( not ( = ?auto_1226799 ?auto_1226807 ) ) ( not ( = ?auto_1226799 ?auto_1226812 ) ) ( not ( = ?auto_1226801 ?auto_1226802 ) ) ( not ( = ?auto_1226801 ?auto_1226803 ) ) ( not ( = ?auto_1226801 ?auto_1226804 ) ) ( not ( = ?auto_1226801 ?auto_1226805 ) ) ( not ( = ?auto_1226801 ?auto_1226806 ) ) ( not ( = ?auto_1226801 ?auto_1226807 ) ) ( not ( = ?auto_1226801 ?auto_1226812 ) ) ( not ( = ?auto_1226802 ?auto_1226803 ) ) ( not ( = ?auto_1226802 ?auto_1226804 ) ) ( not ( = ?auto_1226802 ?auto_1226805 ) ) ( not ( = ?auto_1226802 ?auto_1226806 ) ) ( not ( = ?auto_1226802 ?auto_1226807 ) ) ( not ( = ?auto_1226802 ?auto_1226812 ) ) ( not ( = ?auto_1226803 ?auto_1226804 ) ) ( not ( = ?auto_1226803 ?auto_1226805 ) ) ( not ( = ?auto_1226803 ?auto_1226806 ) ) ( not ( = ?auto_1226803 ?auto_1226807 ) ) ( not ( = ?auto_1226803 ?auto_1226812 ) ) ( not ( = ?auto_1226804 ?auto_1226805 ) ) ( not ( = ?auto_1226804 ?auto_1226806 ) ) ( not ( = ?auto_1226804 ?auto_1226807 ) ) ( not ( = ?auto_1226804 ?auto_1226812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1226805 ?auto_1226806 ?auto_1226807 )
      ( MAKE-13CRATE-VERIFY ?auto_1226795 ?auto_1226796 ?auto_1226797 ?auto_1226794 ?auto_1226798 ?auto_1226800 ?auto_1226799 ?auto_1226801 ?auto_1226802 ?auto_1226803 ?auto_1226804 ?auto_1226805 ?auto_1226806 ?auto_1226807 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1241036 - SURFACE
      ?auto_1241037 - SURFACE
      ?auto_1241038 - SURFACE
      ?auto_1241035 - SURFACE
      ?auto_1241039 - SURFACE
      ?auto_1241041 - SURFACE
      ?auto_1241040 - SURFACE
      ?auto_1241042 - SURFACE
      ?auto_1241043 - SURFACE
      ?auto_1241044 - SURFACE
      ?auto_1241045 - SURFACE
      ?auto_1241046 - SURFACE
      ?auto_1241047 - SURFACE
      ?auto_1241048 - SURFACE
      ?auto_1241049 - SURFACE
    )
    :vars
    (
      ?auto_1241050 - HOIST
      ?auto_1241051 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1241050 ?auto_1241051 ) ( SURFACE-AT ?auto_1241048 ?auto_1241051 ) ( CLEAR ?auto_1241048 ) ( LIFTING ?auto_1241050 ?auto_1241049 ) ( IS-CRATE ?auto_1241049 ) ( not ( = ?auto_1241048 ?auto_1241049 ) ) ( ON ?auto_1241037 ?auto_1241036 ) ( ON ?auto_1241038 ?auto_1241037 ) ( ON ?auto_1241035 ?auto_1241038 ) ( ON ?auto_1241039 ?auto_1241035 ) ( ON ?auto_1241041 ?auto_1241039 ) ( ON ?auto_1241040 ?auto_1241041 ) ( ON ?auto_1241042 ?auto_1241040 ) ( ON ?auto_1241043 ?auto_1241042 ) ( ON ?auto_1241044 ?auto_1241043 ) ( ON ?auto_1241045 ?auto_1241044 ) ( ON ?auto_1241046 ?auto_1241045 ) ( ON ?auto_1241047 ?auto_1241046 ) ( ON ?auto_1241048 ?auto_1241047 ) ( not ( = ?auto_1241036 ?auto_1241037 ) ) ( not ( = ?auto_1241036 ?auto_1241038 ) ) ( not ( = ?auto_1241036 ?auto_1241035 ) ) ( not ( = ?auto_1241036 ?auto_1241039 ) ) ( not ( = ?auto_1241036 ?auto_1241041 ) ) ( not ( = ?auto_1241036 ?auto_1241040 ) ) ( not ( = ?auto_1241036 ?auto_1241042 ) ) ( not ( = ?auto_1241036 ?auto_1241043 ) ) ( not ( = ?auto_1241036 ?auto_1241044 ) ) ( not ( = ?auto_1241036 ?auto_1241045 ) ) ( not ( = ?auto_1241036 ?auto_1241046 ) ) ( not ( = ?auto_1241036 ?auto_1241047 ) ) ( not ( = ?auto_1241036 ?auto_1241048 ) ) ( not ( = ?auto_1241036 ?auto_1241049 ) ) ( not ( = ?auto_1241037 ?auto_1241038 ) ) ( not ( = ?auto_1241037 ?auto_1241035 ) ) ( not ( = ?auto_1241037 ?auto_1241039 ) ) ( not ( = ?auto_1241037 ?auto_1241041 ) ) ( not ( = ?auto_1241037 ?auto_1241040 ) ) ( not ( = ?auto_1241037 ?auto_1241042 ) ) ( not ( = ?auto_1241037 ?auto_1241043 ) ) ( not ( = ?auto_1241037 ?auto_1241044 ) ) ( not ( = ?auto_1241037 ?auto_1241045 ) ) ( not ( = ?auto_1241037 ?auto_1241046 ) ) ( not ( = ?auto_1241037 ?auto_1241047 ) ) ( not ( = ?auto_1241037 ?auto_1241048 ) ) ( not ( = ?auto_1241037 ?auto_1241049 ) ) ( not ( = ?auto_1241038 ?auto_1241035 ) ) ( not ( = ?auto_1241038 ?auto_1241039 ) ) ( not ( = ?auto_1241038 ?auto_1241041 ) ) ( not ( = ?auto_1241038 ?auto_1241040 ) ) ( not ( = ?auto_1241038 ?auto_1241042 ) ) ( not ( = ?auto_1241038 ?auto_1241043 ) ) ( not ( = ?auto_1241038 ?auto_1241044 ) ) ( not ( = ?auto_1241038 ?auto_1241045 ) ) ( not ( = ?auto_1241038 ?auto_1241046 ) ) ( not ( = ?auto_1241038 ?auto_1241047 ) ) ( not ( = ?auto_1241038 ?auto_1241048 ) ) ( not ( = ?auto_1241038 ?auto_1241049 ) ) ( not ( = ?auto_1241035 ?auto_1241039 ) ) ( not ( = ?auto_1241035 ?auto_1241041 ) ) ( not ( = ?auto_1241035 ?auto_1241040 ) ) ( not ( = ?auto_1241035 ?auto_1241042 ) ) ( not ( = ?auto_1241035 ?auto_1241043 ) ) ( not ( = ?auto_1241035 ?auto_1241044 ) ) ( not ( = ?auto_1241035 ?auto_1241045 ) ) ( not ( = ?auto_1241035 ?auto_1241046 ) ) ( not ( = ?auto_1241035 ?auto_1241047 ) ) ( not ( = ?auto_1241035 ?auto_1241048 ) ) ( not ( = ?auto_1241035 ?auto_1241049 ) ) ( not ( = ?auto_1241039 ?auto_1241041 ) ) ( not ( = ?auto_1241039 ?auto_1241040 ) ) ( not ( = ?auto_1241039 ?auto_1241042 ) ) ( not ( = ?auto_1241039 ?auto_1241043 ) ) ( not ( = ?auto_1241039 ?auto_1241044 ) ) ( not ( = ?auto_1241039 ?auto_1241045 ) ) ( not ( = ?auto_1241039 ?auto_1241046 ) ) ( not ( = ?auto_1241039 ?auto_1241047 ) ) ( not ( = ?auto_1241039 ?auto_1241048 ) ) ( not ( = ?auto_1241039 ?auto_1241049 ) ) ( not ( = ?auto_1241041 ?auto_1241040 ) ) ( not ( = ?auto_1241041 ?auto_1241042 ) ) ( not ( = ?auto_1241041 ?auto_1241043 ) ) ( not ( = ?auto_1241041 ?auto_1241044 ) ) ( not ( = ?auto_1241041 ?auto_1241045 ) ) ( not ( = ?auto_1241041 ?auto_1241046 ) ) ( not ( = ?auto_1241041 ?auto_1241047 ) ) ( not ( = ?auto_1241041 ?auto_1241048 ) ) ( not ( = ?auto_1241041 ?auto_1241049 ) ) ( not ( = ?auto_1241040 ?auto_1241042 ) ) ( not ( = ?auto_1241040 ?auto_1241043 ) ) ( not ( = ?auto_1241040 ?auto_1241044 ) ) ( not ( = ?auto_1241040 ?auto_1241045 ) ) ( not ( = ?auto_1241040 ?auto_1241046 ) ) ( not ( = ?auto_1241040 ?auto_1241047 ) ) ( not ( = ?auto_1241040 ?auto_1241048 ) ) ( not ( = ?auto_1241040 ?auto_1241049 ) ) ( not ( = ?auto_1241042 ?auto_1241043 ) ) ( not ( = ?auto_1241042 ?auto_1241044 ) ) ( not ( = ?auto_1241042 ?auto_1241045 ) ) ( not ( = ?auto_1241042 ?auto_1241046 ) ) ( not ( = ?auto_1241042 ?auto_1241047 ) ) ( not ( = ?auto_1241042 ?auto_1241048 ) ) ( not ( = ?auto_1241042 ?auto_1241049 ) ) ( not ( = ?auto_1241043 ?auto_1241044 ) ) ( not ( = ?auto_1241043 ?auto_1241045 ) ) ( not ( = ?auto_1241043 ?auto_1241046 ) ) ( not ( = ?auto_1241043 ?auto_1241047 ) ) ( not ( = ?auto_1241043 ?auto_1241048 ) ) ( not ( = ?auto_1241043 ?auto_1241049 ) ) ( not ( = ?auto_1241044 ?auto_1241045 ) ) ( not ( = ?auto_1241044 ?auto_1241046 ) ) ( not ( = ?auto_1241044 ?auto_1241047 ) ) ( not ( = ?auto_1241044 ?auto_1241048 ) ) ( not ( = ?auto_1241044 ?auto_1241049 ) ) ( not ( = ?auto_1241045 ?auto_1241046 ) ) ( not ( = ?auto_1241045 ?auto_1241047 ) ) ( not ( = ?auto_1241045 ?auto_1241048 ) ) ( not ( = ?auto_1241045 ?auto_1241049 ) ) ( not ( = ?auto_1241046 ?auto_1241047 ) ) ( not ( = ?auto_1241046 ?auto_1241048 ) ) ( not ( = ?auto_1241046 ?auto_1241049 ) ) ( not ( = ?auto_1241047 ?auto_1241048 ) ) ( not ( = ?auto_1241047 ?auto_1241049 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1241048 ?auto_1241049 )
      ( MAKE-14CRATE-VERIFY ?auto_1241036 ?auto_1241037 ?auto_1241038 ?auto_1241035 ?auto_1241039 ?auto_1241041 ?auto_1241040 ?auto_1241042 ?auto_1241043 ?auto_1241044 ?auto_1241045 ?auto_1241046 ?auto_1241047 ?auto_1241048 ?auto_1241049 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1241196 - SURFACE
      ?auto_1241197 - SURFACE
      ?auto_1241198 - SURFACE
      ?auto_1241195 - SURFACE
      ?auto_1241199 - SURFACE
      ?auto_1241201 - SURFACE
      ?auto_1241200 - SURFACE
      ?auto_1241202 - SURFACE
      ?auto_1241203 - SURFACE
      ?auto_1241204 - SURFACE
      ?auto_1241205 - SURFACE
      ?auto_1241206 - SURFACE
      ?auto_1241207 - SURFACE
      ?auto_1241208 - SURFACE
      ?auto_1241209 - SURFACE
    )
    :vars
    (
      ?auto_1241211 - HOIST
      ?auto_1241210 - PLACE
      ?auto_1241212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1241211 ?auto_1241210 ) ( SURFACE-AT ?auto_1241208 ?auto_1241210 ) ( CLEAR ?auto_1241208 ) ( IS-CRATE ?auto_1241209 ) ( not ( = ?auto_1241208 ?auto_1241209 ) ) ( TRUCK-AT ?auto_1241212 ?auto_1241210 ) ( AVAILABLE ?auto_1241211 ) ( IN ?auto_1241209 ?auto_1241212 ) ( ON ?auto_1241208 ?auto_1241207 ) ( not ( = ?auto_1241207 ?auto_1241208 ) ) ( not ( = ?auto_1241207 ?auto_1241209 ) ) ( ON ?auto_1241197 ?auto_1241196 ) ( ON ?auto_1241198 ?auto_1241197 ) ( ON ?auto_1241195 ?auto_1241198 ) ( ON ?auto_1241199 ?auto_1241195 ) ( ON ?auto_1241201 ?auto_1241199 ) ( ON ?auto_1241200 ?auto_1241201 ) ( ON ?auto_1241202 ?auto_1241200 ) ( ON ?auto_1241203 ?auto_1241202 ) ( ON ?auto_1241204 ?auto_1241203 ) ( ON ?auto_1241205 ?auto_1241204 ) ( ON ?auto_1241206 ?auto_1241205 ) ( ON ?auto_1241207 ?auto_1241206 ) ( not ( = ?auto_1241196 ?auto_1241197 ) ) ( not ( = ?auto_1241196 ?auto_1241198 ) ) ( not ( = ?auto_1241196 ?auto_1241195 ) ) ( not ( = ?auto_1241196 ?auto_1241199 ) ) ( not ( = ?auto_1241196 ?auto_1241201 ) ) ( not ( = ?auto_1241196 ?auto_1241200 ) ) ( not ( = ?auto_1241196 ?auto_1241202 ) ) ( not ( = ?auto_1241196 ?auto_1241203 ) ) ( not ( = ?auto_1241196 ?auto_1241204 ) ) ( not ( = ?auto_1241196 ?auto_1241205 ) ) ( not ( = ?auto_1241196 ?auto_1241206 ) ) ( not ( = ?auto_1241196 ?auto_1241207 ) ) ( not ( = ?auto_1241196 ?auto_1241208 ) ) ( not ( = ?auto_1241196 ?auto_1241209 ) ) ( not ( = ?auto_1241197 ?auto_1241198 ) ) ( not ( = ?auto_1241197 ?auto_1241195 ) ) ( not ( = ?auto_1241197 ?auto_1241199 ) ) ( not ( = ?auto_1241197 ?auto_1241201 ) ) ( not ( = ?auto_1241197 ?auto_1241200 ) ) ( not ( = ?auto_1241197 ?auto_1241202 ) ) ( not ( = ?auto_1241197 ?auto_1241203 ) ) ( not ( = ?auto_1241197 ?auto_1241204 ) ) ( not ( = ?auto_1241197 ?auto_1241205 ) ) ( not ( = ?auto_1241197 ?auto_1241206 ) ) ( not ( = ?auto_1241197 ?auto_1241207 ) ) ( not ( = ?auto_1241197 ?auto_1241208 ) ) ( not ( = ?auto_1241197 ?auto_1241209 ) ) ( not ( = ?auto_1241198 ?auto_1241195 ) ) ( not ( = ?auto_1241198 ?auto_1241199 ) ) ( not ( = ?auto_1241198 ?auto_1241201 ) ) ( not ( = ?auto_1241198 ?auto_1241200 ) ) ( not ( = ?auto_1241198 ?auto_1241202 ) ) ( not ( = ?auto_1241198 ?auto_1241203 ) ) ( not ( = ?auto_1241198 ?auto_1241204 ) ) ( not ( = ?auto_1241198 ?auto_1241205 ) ) ( not ( = ?auto_1241198 ?auto_1241206 ) ) ( not ( = ?auto_1241198 ?auto_1241207 ) ) ( not ( = ?auto_1241198 ?auto_1241208 ) ) ( not ( = ?auto_1241198 ?auto_1241209 ) ) ( not ( = ?auto_1241195 ?auto_1241199 ) ) ( not ( = ?auto_1241195 ?auto_1241201 ) ) ( not ( = ?auto_1241195 ?auto_1241200 ) ) ( not ( = ?auto_1241195 ?auto_1241202 ) ) ( not ( = ?auto_1241195 ?auto_1241203 ) ) ( not ( = ?auto_1241195 ?auto_1241204 ) ) ( not ( = ?auto_1241195 ?auto_1241205 ) ) ( not ( = ?auto_1241195 ?auto_1241206 ) ) ( not ( = ?auto_1241195 ?auto_1241207 ) ) ( not ( = ?auto_1241195 ?auto_1241208 ) ) ( not ( = ?auto_1241195 ?auto_1241209 ) ) ( not ( = ?auto_1241199 ?auto_1241201 ) ) ( not ( = ?auto_1241199 ?auto_1241200 ) ) ( not ( = ?auto_1241199 ?auto_1241202 ) ) ( not ( = ?auto_1241199 ?auto_1241203 ) ) ( not ( = ?auto_1241199 ?auto_1241204 ) ) ( not ( = ?auto_1241199 ?auto_1241205 ) ) ( not ( = ?auto_1241199 ?auto_1241206 ) ) ( not ( = ?auto_1241199 ?auto_1241207 ) ) ( not ( = ?auto_1241199 ?auto_1241208 ) ) ( not ( = ?auto_1241199 ?auto_1241209 ) ) ( not ( = ?auto_1241201 ?auto_1241200 ) ) ( not ( = ?auto_1241201 ?auto_1241202 ) ) ( not ( = ?auto_1241201 ?auto_1241203 ) ) ( not ( = ?auto_1241201 ?auto_1241204 ) ) ( not ( = ?auto_1241201 ?auto_1241205 ) ) ( not ( = ?auto_1241201 ?auto_1241206 ) ) ( not ( = ?auto_1241201 ?auto_1241207 ) ) ( not ( = ?auto_1241201 ?auto_1241208 ) ) ( not ( = ?auto_1241201 ?auto_1241209 ) ) ( not ( = ?auto_1241200 ?auto_1241202 ) ) ( not ( = ?auto_1241200 ?auto_1241203 ) ) ( not ( = ?auto_1241200 ?auto_1241204 ) ) ( not ( = ?auto_1241200 ?auto_1241205 ) ) ( not ( = ?auto_1241200 ?auto_1241206 ) ) ( not ( = ?auto_1241200 ?auto_1241207 ) ) ( not ( = ?auto_1241200 ?auto_1241208 ) ) ( not ( = ?auto_1241200 ?auto_1241209 ) ) ( not ( = ?auto_1241202 ?auto_1241203 ) ) ( not ( = ?auto_1241202 ?auto_1241204 ) ) ( not ( = ?auto_1241202 ?auto_1241205 ) ) ( not ( = ?auto_1241202 ?auto_1241206 ) ) ( not ( = ?auto_1241202 ?auto_1241207 ) ) ( not ( = ?auto_1241202 ?auto_1241208 ) ) ( not ( = ?auto_1241202 ?auto_1241209 ) ) ( not ( = ?auto_1241203 ?auto_1241204 ) ) ( not ( = ?auto_1241203 ?auto_1241205 ) ) ( not ( = ?auto_1241203 ?auto_1241206 ) ) ( not ( = ?auto_1241203 ?auto_1241207 ) ) ( not ( = ?auto_1241203 ?auto_1241208 ) ) ( not ( = ?auto_1241203 ?auto_1241209 ) ) ( not ( = ?auto_1241204 ?auto_1241205 ) ) ( not ( = ?auto_1241204 ?auto_1241206 ) ) ( not ( = ?auto_1241204 ?auto_1241207 ) ) ( not ( = ?auto_1241204 ?auto_1241208 ) ) ( not ( = ?auto_1241204 ?auto_1241209 ) ) ( not ( = ?auto_1241205 ?auto_1241206 ) ) ( not ( = ?auto_1241205 ?auto_1241207 ) ) ( not ( = ?auto_1241205 ?auto_1241208 ) ) ( not ( = ?auto_1241205 ?auto_1241209 ) ) ( not ( = ?auto_1241206 ?auto_1241207 ) ) ( not ( = ?auto_1241206 ?auto_1241208 ) ) ( not ( = ?auto_1241206 ?auto_1241209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1241207 ?auto_1241208 ?auto_1241209 )
      ( MAKE-14CRATE-VERIFY ?auto_1241196 ?auto_1241197 ?auto_1241198 ?auto_1241195 ?auto_1241199 ?auto_1241201 ?auto_1241200 ?auto_1241202 ?auto_1241203 ?auto_1241204 ?auto_1241205 ?auto_1241206 ?auto_1241207 ?auto_1241208 ?auto_1241209 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1241371 - SURFACE
      ?auto_1241372 - SURFACE
      ?auto_1241373 - SURFACE
      ?auto_1241370 - SURFACE
      ?auto_1241374 - SURFACE
      ?auto_1241376 - SURFACE
      ?auto_1241375 - SURFACE
      ?auto_1241377 - SURFACE
      ?auto_1241378 - SURFACE
      ?auto_1241379 - SURFACE
      ?auto_1241380 - SURFACE
      ?auto_1241381 - SURFACE
      ?auto_1241382 - SURFACE
      ?auto_1241383 - SURFACE
      ?auto_1241384 - SURFACE
    )
    :vars
    (
      ?auto_1241385 - HOIST
      ?auto_1241387 - PLACE
      ?auto_1241386 - TRUCK
      ?auto_1241388 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1241385 ?auto_1241387 ) ( SURFACE-AT ?auto_1241383 ?auto_1241387 ) ( CLEAR ?auto_1241383 ) ( IS-CRATE ?auto_1241384 ) ( not ( = ?auto_1241383 ?auto_1241384 ) ) ( AVAILABLE ?auto_1241385 ) ( IN ?auto_1241384 ?auto_1241386 ) ( ON ?auto_1241383 ?auto_1241382 ) ( not ( = ?auto_1241382 ?auto_1241383 ) ) ( not ( = ?auto_1241382 ?auto_1241384 ) ) ( TRUCK-AT ?auto_1241386 ?auto_1241388 ) ( not ( = ?auto_1241388 ?auto_1241387 ) ) ( ON ?auto_1241372 ?auto_1241371 ) ( ON ?auto_1241373 ?auto_1241372 ) ( ON ?auto_1241370 ?auto_1241373 ) ( ON ?auto_1241374 ?auto_1241370 ) ( ON ?auto_1241376 ?auto_1241374 ) ( ON ?auto_1241375 ?auto_1241376 ) ( ON ?auto_1241377 ?auto_1241375 ) ( ON ?auto_1241378 ?auto_1241377 ) ( ON ?auto_1241379 ?auto_1241378 ) ( ON ?auto_1241380 ?auto_1241379 ) ( ON ?auto_1241381 ?auto_1241380 ) ( ON ?auto_1241382 ?auto_1241381 ) ( not ( = ?auto_1241371 ?auto_1241372 ) ) ( not ( = ?auto_1241371 ?auto_1241373 ) ) ( not ( = ?auto_1241371 ?auto_1241370 ) ) ( not ( = ?auto_1241371 ?auto_1241374 ) ) ( not ( = ?auto_1241371 ?auto_1241376 ) ) ( not ( = ?auto_1241371 ?auto_1241375 ) ) ( not ( = ?auto_1241371 ?auto_1241377 ) ) ( not ( = ?auto_1241371 ?auto_1241378 ) ) ( not ( = ?auto_1241371 ?auto_1241379 ) ) ( not ( = ?auto_1241371 ?auto_1241380 ) ) ( not ( = ?auto_1241371 ?auto_1241381 ) ) ( not ( = ?auto_1241371 ?auto_1241382 ) ) ( not ( = ?auto_1241371 ?auto_1241383 ) ) ( not ( = ?auto_1241371 ?auto_1241384 ) ) ( not ( = ?auto_1241372 ?auto_1241373 ) ) ( not ( = ?auto_1241372 ?auto_1241370 ) ) ( not ( = ?auto_1241372 ?auto_1241374 ) ) ( not ( = ?auto_1241372 ?auto_1241376 ) ) ( not ( = ?auto_1241372 ?auto_1241375 ) ) ( not ( = ?auto_1241372 ?auto_1241377 ) ) ( not ( = ?auto_1241372 ?auto_1241378 ) ) ( not ( = ?auto_1241372 ?auto_1241379 ) ) ( not ( = ?auto_1241372 ?auto_1241380 ) ) ( not ( = ?auto_1241372 ?auto_1241381 ) ) ( not ( = ?auto_1241372 ?auto_1241382 ) ) ( not ( = ?auto_1241372 ?auto_1241383 ) ) ( not ( = ?auto_1241372 ?auto_1241384 ) ) ( not ( = ?auto_1241373 ?auto_1241370 ) ) ( not ( = ?auto_1241373 ?auto_1241374 ) ) ( not ( = ?auto_1241373 ?auto_1241376 ) ) ( not ( = ?auto_1241373 ?auto_1241375 ) ) ( not ( = ?auto_1241373 ?auto_1241377 ) ) ( not ( = ?auto_1241373 ?auto_1241378 ) ) ( not ( = ?auto_1241373 ?auto_1241379 ) ) ( not ( = ?auto_1241373 ?auto_1241380 ) ) ( not ( = ?auto_1241373 ?auto_1241381 ) ) ( not ( = ?auto_1241373 ?auto_1241382 ) ) ( not ( = ?auto_1241373 ?auto_1241383 ) ) ( not ( = ?auto_1241373 ?auto_1241384 ) ) ( not ( = ?auto_1241370 ?auto_1241374 ) ) ( not ( = ?auto_1241370 ?auto_1241376 ) ) ( not ( = ?auto_1241370 ?auto_1241375 ) ) ( not ( = ?auto_1241370 ?auto_1241377 ) ) ( not ( = ?auto_1241370 ?auto_1241378 ) ) ( not ( = ?auto_1241370 ?auto_1241379 ) ) ( not ( = ?auto_1241370 ?auto_1241380 ) ) ( not ( = ?auto_1241370 ?auto_1241381 ) ) ( not ( = ?auto_1241370 ?auto_1241382 ) ) ( not ( = ?auto_1241370 ?auto_1241383 ) ) ( not ( = ?auto_1241370 ?auto_1241384 ) ) ( not ( = ?auto_1241374 ?auto_1241376 ) ) ( not ( = ?auto_1241374 ?auto_1241375 ) ) ( not ( = ?auto_1241374 ?auto_1241377 ) ) ( not ( = ?auto_1241374 ?auto_1241378 ) ) ( not ( = ?auto_1241374 ?auto_1241379 ) ) ( not ( = ?auto_1241374 ?auto_1241380 ) ) ( not ( = ?auto_1241374 ?auto_1241381 ) ) ( not ( = ?auto_1241374 ?auto_1241382 ) ) ( not ( = ?auto_1241374 ?auto_1241383 ) ) ( not ( = ?auto_1241374 ?auto_1241384 ) ) ( not ( = ?auto_1241376 ?auto_1241375 ) ) ( not ( = ?auto_1241376 ?auto_1241377 ) ) ( not ( = ?auto_1241376 ?auto_1241378 ) ) ( not ( = ?auto_1241376 ?auto_1241379 ) ) ( not ( = ?auto_1241376 ?auto_1241380 ) ) ( not ( = ?auto_1241376 ?auto_1241381 ) ) ( not ( = ?auto_1241376 ?auto_1241382 ) ) ( not ( = ?auto_1241376 ?auto_1241383 ) ) ( not ( = ?auto_1241376 ?auto_1241384 ) ) ( not ( = ?auto_1241375 ?auto_1241377 ) ) ( not ( = ?auto_1241375 ?auto_1241378 ) ) ( not ( = ?auto_1241375 ?auto_1241379 ) ) ( not ( = ?auto_1241375 ?auto_1241380 ) ) ( not ( = ?auto_1241375 ?auto_1241381 ) ) ( not ( = ?auto_1241375 ?auto_1241382 ) ) ( not ( = ?auto_1241375 ?auto_1241383 ) ) ( not ( = ?auto_1241375 ?auto_1241384 ) ) ( not ( = ?auto_1241377 ?auto_1241378 ) ) ( not ( = ?auto_1241377 ?auto_1241379 ) ) ( not ( = ?auto_1241377 ?auto_1241380 ) ) ( not ( = ?auto_1241377 ?auto_1241381 ) ) ( not ( = ?auto_1241377 ?auto_1241382 ) ) ( not ( = ?auto_1241377 ?auto_1241383 ) ) ( not ( = ?auto_1241377 ?auto_1241384 ) ) ( not ( = ?auto_1241378 ?auto_1241379 ) ) ( not ( = ?auto_1241378 ?auto_1241380 ) ) ( not ( = ?auto_1241378 ?auto_1241381 ) ) ( not ( = ?auto_1241378 ?auto_1241382 ) ) ( not ( = ?auto_1241378 ?auto_1241383 ) ) ( not ( = ?auto_1241378 ?auto_1241384 ) ) ( not ( = ?auto_1241379 ?auto_1241380 ) ) ( not ( = ?auto_1241379 ?auto_1241381 ) ) ( not ( = ?auto_1241379 ?auto_1241382 ) ) ( not ( = ?auto_1241379 ?auto_1241383 ) ) ( not ( = ?auto_1241379 ?auto_1241384 ) ) ( not ( = ?auto_1241380 ?auto_1241381 ) ) ( not ( = ?auto_1241380 ?auto_1241382 ) ) ( not ( = ?auto_1241380 ?auto_1241383 ) ) ( not ( = ?auto_1241380 ?auto_1241384 ) ) ( not ( = ?auto_1241381 ?auto_1241382 ) ) ( not ( = ?auto_1241381 ?auto_1241383 ) ) ( not ( = ?auto_1241381 ?auto_1241384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1241382 ?auto_1241383 ?auto_1241384 )
      ( MAKE-14CRATE-VERIFY ?auto_1241371 ?auto_1241372 ?auto_1241373 ?auto_1241370 ?auto_1241374 ?auto_1241376 ?auto_1241375 ?auto_1241377 ?auto_1241378 ?auto_1241379 ?auto_1241380 ?auto_1241381 ?auto_1241382 ?auto_1241383 ?auto_1241384 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1241560 - SURFACE
      ?auto_1241561 - SURFACE
      ?auto_1241562 - SURFACE
      ?auto_1241559 - SURFACE
      ?auto_1241563 - SURFACE
      ?auto_1241565 - SURFACE
      ?auto_1241564 - SURFACE
      ?auto_1241566 - SURFACE
      ?auto_1241567 - SURFACE
      ?auto_1241568 - SURFACE
      ?auto_1241569 - SURFACE
      ?auto_1241570 - SURFACE
      ?auto_1241571 - SURFACE
      ?auto_1241572 - SURFACE
      ?auto_1241573 - SURFACE
    )
    :vars
    (
      ?auto_1241574 - HOIST
      ?auto_1241575 - PLACE
      ?auto_1241578 - TRUCK
      ?auto_1241577 - PLACE
      ?auto_1241576 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1241574 ?auto_1241575 ) ( SURFACE-AT ?auto_1241572 ?auto_1241575 ) ( CLEAR ?auto_1241572 ) ( IS-CRATE ?auto_1241573 ) ( not ( = ?auto_1241572 ?auto_1241573 ) ) ( AVAILABLE ?auto_1241574 ) ( ON ?auto_1241572 ?auto_1241571 ) ( not ( = ?auto_1241571 ?auto_1241572 ) ) ( not ( = ?auto_1241571 ?auto_1241573 ) ) ( TRUCK-AT ?auto_1241578 ?auto_1241577 ) ( not ( = ?auto_1241577 ?auto_1241575 ) ) ( HOIST-AT ?auto_1241576 ?auto_1241577 ) ( LIFTING ?auto_1241576 ?auto_1241573 ) ( not ( = ?auto_1241574 ?auto_1241576 ) ) ( ON ?auto_1241561 ?auto_1241560 ) ( ON ?auto_1241562 ?auto_1241561 ) ( ON ?auto_1241559 ?auto_1241562 ) ( ON ?auto_1241563 ?auto_1241559 ) ( ON ?auto_1241565 ?auto_1241563 ) ( ON ?auto_1241564 ?auto_1241565 ) ( ON ?auto_1241566 ?auto_1241564 ) ( ON ?auto_1241567 ?auto_1241566 ) ( ON ?auto_1241568 ?auto_1241567 ) ( ON ?auto_1241569 ?auto_1241568 ) ( ON ?auto_1241570 ?auto_1241569 ) ( ON ?auto_1241571 ?auto_1241570 ) ( not ( = ?auto_1241560 ?auto_1241561 ) ) ( not ( = ?auto_1241560 ?auto_1241562 ) ) ( not ( = ?auto_1241560 ?auto_1241559 ) ) ( not ( = ?auto_1241560 ?auto_1241563 ) ) ( not ( = ?auto_1241560 ?auto_1241565 ) ) ( not ( = ?auto_1241560 ?auto_1241564 ) ) ( not ( = ?auto_1241560 ?auto_1241566 ) ) ( not ( = ?auto_1241560 ?auto_1241567 ) ) ( not ( = ?auto_1241560 ?auto_1241568 ) ) ( not ( = ?auto_1241560 ?auto_1241569 ) ) ( not ( = ?auto_1241560 ?auto_1241570 ) ) ( not ( = ?auto_1241560 ?auto_1241571 ) ) ( not ( = ?auto_1241560 ?auto_1241572 ) ) ( not ( = ?auto_1241560 ?auto_1241573 ) ) ( not ( = ?auto_1241561 ?auto_1241562 ) ) ( not ( = ?auto_1241561 ?auto_1241559 ) ) ( not ( = ?auto_1241561 ?auto_1241563 ) ) ( not ( = ?auto_1241561 ?auto_1241565 ) ) ( not ( = ?auto_1241561 ?auto_1241564 ) ) ( not ( = ?auto_1241561 ?auto_1241566 ) ) ( not ( = ?auto_1241561 ?auto_1241567 ) ) ( not ( = ?auto_1241561 ?auto_1241568 ) ) ( not ( = ?auto_1241561 ?auto_1241569 ) ) ( not ( = ?auto_1241561 ?auto_1241570 ) ) ( not ( = ?auto_1241561 ?auto_1241571 ) ) ( not ( = ?auto_1241561 ?auto_1241572 ) ) ( not ( = ?auto_1241561 ?auto_1241573 ) ) ( not ( = ?auto_1241562 ?auto_1241559 ) ) ( not ( = ?auto_1241562 ?auto_1241563 ) ) ( not ( = ?auto_1241562 ?auto_1241565 ) ) ( not ( = ?auto_1241562 ?auto_1241564 ) ) ( not ( = ?auto_1241562 ?auto_1241566 ) ) ( not ( = ?auto_1241562 ?auto_1241567 ) ) ( not ( = ?auto_1241562 ?auto_1241568 ) ) ( not ( = ?auto_1241562 ?auto_1241569 ) ) ( not ( = ?auto_1241562 ?auto_1241570 ) ) ( not ( = ?auto_1241562 ?auto_1241571 ) ) ( not ( = ?auto_1241562 ?auto_1241572 ) ) ( not ( = ?auto_1241562 ?auto_1241573 ) ) ( not ( = ?auto_1241559 ?auto_1241563 ) ) ( not ( = ?auto_1241559 ?auto_1241565 ) ) ( not ( = ?auto_1241559 ?auto_1241564 ) ) ( not ( = ?auto_1241559 ?auto_1241566 ) ) ( not ( = ?auto_1241559 ?auto_1241567 ) ) ( not ( = ?auto_1241559 ?auto_1241568 ) ) ( not ( = ?auto_1241559 ?auto_1241569 ) ) ( not ( = ?auto_1241559 ?auto_1241570 ) ) ( not ( = ?auto_1241559 ?auto_1241571 ) ) ( not ( = ?auto_1241559 ?auto_1241572 ) ) ( not ( = ?auto_1241559 ?auto_1241573 ) ) ( not ( = ?auto_1241563 ?auto_1241565 ) ) ( not ( = ?auto_1241563 ?auto_1241564 ) ) ( not ( = ?auto_1241563 ?auto_1241566 ) ) ( not ( = ?auto_1241563 ?auto_1241567 ) ) ( not ( = ?auto_1241563 ?auto_1241568 ) ) ( not ( = ?auto_1241563 ?auto_1241569 ) ) ( not ( = ?auto_1241563 ?auto_1241570 ) ) ( not ( = ?auto_1241563 ?auto_1241571 ) ) ( not ( = ?auto_1241563 ?auto_1241572 ) ) ( not ( = ?auto_1241563 ?auto_1241573 ) ) ( not ( = ?auto_1241565 ?auto_1241564 ) ) ( not ( = ?auto_1241565 ?auto_1241566 ) ) ( not ( = ?auto_1241565 ?auto_1241567 ) ) ( not ( = ?auto_1241565 ?auto_1241568 ) ) ( not ( = ?auto_1241565 ?auto_1241569 ) ) ( not ( = ?auto_1241565 ?auto_1241570 ) ) ( not ( = ?auto_1241565 ?auto_1241571 ) ) ( not ( = ?auto_1241565 ?auto_1241572 ) ) ( not ( = ?auto_1241565 ?auto_1241573 ) ) ( not ( = ?auto_1241564 ?auto_1241566 ) ) ( not ( = ?auto_1241564 ?auto_1241567 ) ) ( not ( = ?auto_1241564 ?auto_1241568 ) ) ( not ( = ?auto_1241564 ?auto_1241569 ) ) ( not ( = ?auto_1241564 ?auto_1241570 ) ) ( not ( = ?auto_1241564 ?auto_1241571 ) ) ( not ( = ?auto_1241564 ?auto_1241572 ) ) ( not ( = ?auto_1241564 ?auto_1241573 ) ) ( not ( = ?auto_1241566 ?auto_1241567 ) ) ( not ( = ?auto_1241566 ?auto_1241568 ) ) ( not ( = ?auto_1241566 ?auto_1241569 ) ) ( not ( = ?auto_1241566 ?auto_1241570 ) ) ( not ( = ?auto_1241566 ?auto_1241571 ) ) ( not ( = ?auto_1241566 ?auto_1241572 ) ) ( not ( = ?auto_1241566 ?auto_1241573 ) ) ( not ( = ?auto_1241567 ?auto_1241568 ) ) ( not ( = ?auto_1241567 ?auto_1241569 ) ) ( not ( = ?auto_1241567 ?auto_1241570 ) ) ( not ( = ?auto_1241567 ?auto_1241571 ) ) ( not ( = ?auto_1241567 ?auto_1241572 ) ) ( not ( = ?auto_1241567 ?auto_1241573 ) ) ( not ( = ?auto_1241568 ?auto_1241569 ) ) ( not ( = ?auto_1241568 ?auto_1241570 ) ) ( not ( = ?auto_1241568 ?auto_1241571 ) ) ( not ( = ?auto_1241568 ?auto_1241572 ) ) ( not ( = ?auto_1241568 ?auto_1241573 ) ) ( not ( = ?auto_1241569 ?auto_1241570 ) ) ( not ( = ?auto_1241569 ?auto_1241571 ) ) ( not ( = ?auto_1241569 ?auto_1241572 ) ) ( not ( = ?auto_1241569 ?auto_1241573 ) ) ( not ( = ?auto_1241570 ?auto_1241571 ) ) ( not ( = ?auto_1241570 ?auto_1241572 ) ) ( not ( = ?auto_1241570 ?auto_1241573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1241571 ?auto_1241572 ?auto_1241573 )
      ( MAKE-14CRATE-VERIFY ?auto_1241560 ?auto_1241561 ?auto_1241562 ?auto_1241559 ?auto_1241563 ?auto_1241565 ?auto_1241564 ?auto_1241566 ?auto_1241567 ?auto_1241568 ?auto_1241569 ?auto_1241570 ?auto_1241571 ?auto_1241572 ?auto_1241573 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1241763 - SURFACE
      ?auto_1241764 - SURFACE
      ?auto_1241765 - SURFACE
      ?auto_1241762 - SURFACE
      ?auto_1241766 - SURFACE
      ?auto_1241768 - SURFACE
      ?auto_1241767 - SURFACE
      ?auto_1241769 - SURFACE
      ?auto_1241770 - SURFACE
      ?auto_1241771 - SURFACE
      ?auto_1241772 - SURFACE
      ?auto_1241773 - SURFACE
      ?auto_1241774 - SURFACE
      ?auto_1241775 - SURFACE
      ?auto_1241776 - SURFACE
    )
    :vars
    (
      ?auto_1241781 - HOIST
      ?auto_1241778 - PLACE
      ?auto_1241777 - TRUCK
      ?auto_1241779 - PLACE
      ?auto_1241782 - HOIST
      ?auto_1241780 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1241781 ?auto_1241778 ) ( SURFACE-AT ?auto_1241775 ?auto_1241778 ) ( CLEAR ?auto_1241775 ) ( IS-CRATE ?auto_1241776 ) ( not ( = ?auto_1241775 ?auto_1241776 ) ) ( AVAILABLE ?auto_1241781 ) ( ON ?auto_1241775 ?auto_1241774 ) ( not ( = ?auto_1241774 ?auto_1241775 ) ) ( not ( = ?auto_1241774 ?auto_1241776 ) ) ( TRUCK-AT ?auto_1241777 ?auto_1241779 ) ( not ( = ?auto_1241779 ?auto_1241778 ) ) ( HOIST-AT ?auto_1241782 ?auto_1241779 ) ( not ( = ?auto_1241781 ?auto_1241782 ) ) ( AVAILABLE ?auto_1241782 ) ( SURFACE-AT ?auto_1241776 ?auto_1241779 ) ( ON ?auto_1241776 ?auto_1241780 ) ( CLEAR ?auto_1241776 ) ( not ( = ?auto_1241775 ?auto_1241780 ) ) ( not ( = ?auto_1241776 ?auto_1241780 ) ) ( not ( = ?auto_1241774 ?auto_1241780 ) ) ( ON ?auto_1241764 ?auto_1241763 ) ( ON ?auto_1241765 ?auto_1241764 ) ( ON ?auto_1241762 ?auto_1241765 ) ( ON ?auto_1241766 ?auto_1241762 ) ( ON ?auto_1241768 ?auto_1241766 ) ( ON ?auto_1241767 ?auto_1241768 ) ( ON ?auto_1241769 ?auto_1241767 ) ( ON ?auto_1241770 ?auto_1241769 ) ( ON ?auto_1241771 ?auto_1241770 ) ( ON ?auto_1241772 ?auto_1241771 ) ( ON ?auto_1241773 ?auto_1241772 ) ( ON ?auto_1241774 ?auto_1241773 ) ( not ( = ?auto_1241763 ?auto_1241764 ) ) ( not ( = ?auto_1241763 ?auto_1241765 ) ) ( not ( = ?auto_1241763 ?auto_1241762 ) ) ( not ( = ?auto_1241763 ?auto_1241766 ) ) ( not ( = ?auto_1241763 ?auto_1241768 ) ) ( not ( = ?auto_1241763 ?auto_1241767 ) ) ( not ( = ?auto_1241763 ?auto_1241769 ) ) ( not ( = ?auto_1241763 ?auto_1241770 ) ) ( not ( = ?auto_1241763 ?auto_1241771 ) ) ( not ( = ?auto_1241763 ?auto_1241772 ) ) ( not ( = ?auto_1241763 ?auto_1241773 ) ) ( not ( = ?auto_1241763 ?auto_1241774 ) ) ( not ( = ?auto_1241763 ?auto_1241775 ) ) ( not ( = ?auto_1241763 ?auto_1241776 ) ) ( not ( = ?auto_1241763 ?auto_1241780 ) ) ( not ( = ?auto_1241764 ?auto_1241765 ) ) ( not ( = ?auto_1241764 ?auto_1241762 ) ) ( not ( = ?auto_1241764 ?auto_1241766 ) ) ( not ( = ?auto_1241764 ?auto_1241768 ) ) ( not ( = ?auto_1241764 ?auto_1241767 ) ) ( not ( = ?auto_1241764 ?auto_1241769 ) ) ( not ( = ?auto_1241764 ?auto_1241770 ) ) ( not ( = ?auto_1241764 ?auto_1241771 ) ) ( not ( = ?auto_1241764 ?auto_1241772 ) ) ( not ( = ?auto_1241764 ?auto_1241773 ) ) ( not ( = ?auto_1241764 ?auto_1241774 ) ) ( not ( = ?auto_1241764 ?auto_1241775 ) ) ( not ( = ?auto_1241764 ?auto_1241776 ) ) ( not ( = ?auto_1241764 ?auto_1241780 ) ) ( not ( = ?auto_1241765 ?auto_1241762 ) ) ( not ( = ?auto_1241765 ?auto_1241766 ) ) ( not ( = ?auto_1241765 ?auto_1241768 ) ) ( not ( = ?auto_1241765 ?auto_1241767 ) ) ( not ( = ?auto_1241765 ?auto_1241769 ) ) ( not ( = ?auto_1241765 ?auto_1241770 ) ) ( not ( = ?auto_1241765 ?auto_1241771 ) ) ( not ( = ?auto_1241765 ?auto_1241772 ) ) ( not ( = ?auto_1241765 ?auto_1241773 ) ) ( not ( = ?auto_1241765 ?auto_1241774 ) ) ( not ( = ?auto_1241765 ?auto_1241775 ) ) ( not ( = ?auto_1241765 ?auto_1241776 ) ) ( not ( = ?auto_1241765 ?auto_1241780 ) ) ( not ( = ?auto_1241762 ?auto_1241766 ) ) ( not ( = ?auto_1241762 ?auto_1241768 ) ) ( not ( = ?auto_1241762 ?auto_1241767 ) ) ( not ( = ?auto_1241762 ?auto_1241769 ) ) ( not ( = ?auto_1241762 ?auto_1241770 ) ) ( not ( = ?auto_1241762 ?auto_1241771 ) ) ( not ( = ?auto_1241762 ?auto_1241772 ) ) ( not ( = ?auto_1241762 ?auto_1241773 ) ) ( not ( = ?auto_1241762 ?auto_1241774 ) ) ( not ( = ?auto_1241762 ?auto_1241775 ) ) ( not ( = ?auto_1241762 ?auto_1241776 ) ) ( not ( = ?auto_1241762 ?auto_1241780 ) ) ( not ( = ?auto_1241766 ?auto_1241768 ) ) ( not ( = ?auto_1241766 ?auto_1241767 ) ) ( not ( = ?auto_1241766 ?auto_1241769 ) ) ( not ( = ?auto_1241766 ?auto_1241770 ) ) ( not ( = ?auto_1241766 ?auto_1241771 ) ) ( not ( = ?auto_1241766 ?auto_1241772 ) ) ( not ( = ?auto_1241766 ?auto_1241773 ) ) ( not ( = ?auto_1241766 ?auto_1241774 ) ) ( not ( = ?auto_1241766 ?auto_1241775 ) ) ( not ( = ?auto_1241766 ?auto_1241776 ) ) ( not ( = ?auto_1241766 ?auto_1241780 ) ) ( not ( = ?auto_1241768 ?auto_1241767 ) ) ( not ( = ?auto_1241768 ?auto_1241769 ) ) ( not ( = ?auto_1241768 ?auto_1241770 ) ) ( not ( = ?auto_1241768 ?auto_1241771 ) ) ( not ( = ?auto_1241768 ?auto_1241772 ) ) ( not ( = ?auto_1241768 ?auto_1241773 ) ) ( not ( = ?auto_1241768 ?auto_1241774 ) ) ( not ( = ?auto_1241768 ?auto_1241775 ) ) ( not ( = ?auto_1241768 ?auto_1241776 ) ) ( not ( = ?auto_1241768 ?auto_1241780 ) ) ( not ( = ?auto_1241767 ?auto_1241769 ) ) ( not ( = ?auto_1241767 ?auto_1241770 ) ) ( not ( = ?auto_1241767 ?auto_1241771 ) ) ( not ( = ?auto_1241767 ?auto_1241772 ) ) ( not ( = ?auto_1241767 ?auto_1241773 ) ) ( not ( = ?auto_1241767 ?auto_1241774 ) ) ( not ( = ?auto_1241767 ?auto_1241775 ) ) ( not ( = ?auto_1241767 ?auto_1241776 ) ) ( not ( = ?auto_1241767 ?auto_1241780 ) ) ( not ( = ?auto_1241769 ?auto_1241770 ) ) ( not ( = ?auto_1241769 ?auto_1241771 ) ) ( not ( = ?auto_1241769 ?auto_1241772 ) ) ( not ( = ?auto_1241769 ?auto_1241773 ) ) ( not ( = ?auto_1241769 ?auto_1241774 ) ) ( not ( = ?auto_1241769 ?auto_1241775 ) ) ( not ( = ?auto_1241769 ?auto_1241776 ) ) ( not ( = ?auto_1241769 ?auto_1241780 ) ) ( not ( = ?auto_1241770 ?auto_1241771 ) ) ( not ( = ?auto_1241770 ?auto_1241772 ) ) ( not ( = ?auto_1241770 ?auto_1241773 ) ) ( not ( = ?auto_1241770 ?auto_1241774 ) ) ( not ( = ?auto_1241770 ?auto_1241775 ) ) ( not ( = ?auto_1241770 ?auto_1241776 ) ) ( not ( = ?auto_1241770 ?auto_1241780 ) ) ( not ( = ?auto_1241771 ?auto_1241772 ) ) ( not ( = ?auto_1241771 ?auto_1241773 ) ) ( not ( = ?auto_1241771 ?auto_1241774 ) ) ( not ( = ?auto_1241771 ?auto_1241775 ) ) ( not ( = ?auto_1241771 ?auto_1241776 ) ) ( not ( = ?auto_1241771 ?auto_1241780 ) ) ( not ( = ?auto_1241772 ?auto_1241773 ) ) ( not ( = ?auto_1241772 ?auto_1241774 ) ) ( not ( = ?auto_1241772 ?auto_1241775 ) ) ( not ( = ?auto_1241772 ?auto_1241776 ) ) ( not ( = ?auto_1241772 ?auto_1241780 ) ) ( not ( = ?auto_1241773 ?auto_1241774 ) ) ( not ( = ?auto_1241773 ?auto_1241775 ) ) ( not ( = ?auto_1241773 ?auto_1241776 ) ) ( not ( = ?auto_1241773 ?auto_1241780 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1241774 ?auto_1241775 ?auto_1241776 )
      ( MAKE-14CRATE-VERIFY ?auto_1241763 ?auto_1241764 ?auto_1241765 ?auto_1241762 ?auto_1241766 ?auto_1241768 ?auto_1241767 ?auto_1241769 ?auto_1241770 ?auto_1241771 ?auto_1241772 ?auto_1241773 ?auto_1241774 ?auto_1241775 ?auto_1241776 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1241967 - SURFACE
      ?auto_1241968 - SURFACE
      ?auto_1241969 - SURFACE
      ?auto_1241966 - SURFACE
      ?auto_1241970 - SURFACE
      ?auto_1241972 - SURFACE
      ?auto_1241971 - SURFACE
      ?auto_1241973 - SURFACE
      ?auto_1241974 - SURFACE
      ?auto_1241975 - SURFACE
      ?auto_1241976 - SURFACE
      ?auto_1241977 - SURFACE
      ?auto_1241978 - SURFACE
      ?auto_1241979 - SURFACE
      ?auto_1241980 - SURFACE
    )
    :vars
    (
      ?auto_1241985 - HOIST
      ?auto_1241982 - PLACE
      ?auto_1241981 - PLACE
      ?auto_1241984 - HOIST
      ?auto_1241986 - SURFACE
      ?auto_1241983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1241985 ?auto_1241982 ) ( SURFACE-AT ?auto_1241979 ?auto_1241982 ) ( CLEAR ?auto_1241979 ) ( IS-CRATE ?auto_1241980 ) ( not ( = ?auto_1241979 ?auto_1241980 ) ) ( AVAILABLE ?auto_1241985 ) ( ON ?auto_1241979 ?auto_1241978 ) ( not ( = ?auto_1241978 ?auto_1241979 ) ) ( not ( = ?auto_1241978 ?auto_1241980 ) ) ( not ( = ?auto_1241981 ?auto_1241982 ) ) ( HOIST-AT ?auto_1241984 ?auto_1241981 ) ( not ( = ?auto_1241985 ?auto_1241984 ) ) ( AVAILABLE ?auto_1241984 ) ( SURFACE-AT ?auto_1241980 ?auto_1241981 ) ( ON ?auto_1241980 ?auto_1241986 ) ( CLEAR ?auto_1241980 ) ( not ( = ?auto_1241979 ?auto_1241986 ) ) ( not ( = ?auto_1241980 ?auto_1241986 ) ) ( not ( = ?auto_1241978 ?auto_1241986 ) ) ( TRUCK-AT ?auto_1241983 ?auto_1241982 ) ( ON ?auto_1241968 ?auto_1241967 ) ( ON ?auto_1241969 ?auto_1241968 ) ( ON ?auto_1241966 ?auto_1241969 ) ( ON ?auto_1241970 ?auto_1241966 ) ( ON ?auto_1241972 ?auto_1241970 ) ( ON ?auto_1241971 ?auto_1241972 ) ( ON ?auto_1241973 ?auto_1241971 ) ( ON ?auto_1241974 ?auto_1241973 ) ( ON ?auto_1241975 ?auto_1241974 ) ( ON ?auto_1241976 ?auto_1241975 ) ( ON ?auto_1241977 ?auto_1241976 ) ( ON ?auto_1241978 ?auto_1241977 ) ( not ( = ?auto_1241967 ?auto_1241968 ) ) ( not ( = ?auto_1241967 ?auto_1241969 ) ) ( not ( = ?auto_1241967 ?auto_1241966 ) ) ( not ( = ?auto_1241967 ?auto_1241970 ) ) ( not ( = ?auto_1241967 ?auto_1241972 ) ) ( not ( = ?auto_1241967 ?auto_1241971 ) ) ( not ( = ?auto_1241967 ?auto_1241973 ) ) ( not ( = ?auto_1241967 ?auto_1241974 ) ) ( not ( = ?auto_1241967 ?auto_1241975 ) ) ( not ( = ?auto_1241967 ?auto_1241976 ) ) ( not ( = ?auto_1241967 ?auto_1241977 ) ) ( not ( = ?auto_1241967 ?auto_1241978 ) ) ( not ( = ?auto_1241967 ?auto_1241979 ) ) ( not ( = ?auto_1241967 ?auto_1241980 ) ) ( not ( = ?auto_1241967 ?auto_1241986 ) ) ( not ( = ?auto_1241968 ?auto_1241969 ) ) ( not ( = ?auto_1241968 ?auto_1241966 ) ) ( not ( = ?auto_1241968 ?auto_1241970 ) ) ( not ( = ?auto_1241968 ?auto_1241972 ) ) ( not ( = ?auto_1241968 ?auto_1241971 ) ) ( not ( = ?auto_1241968 ?auto_1241973 ) ) ( not ( = ?auto_1241968 ?auto_1241974 ) ) ( not ( = ?auto_1241968 ?auto_1241975 ) ) ( not ( = ?auto_1241968 ?auto_1241976 ) ) ( not ( = ?auto_1241968 ?auto_1241977 ) ) ( not ( = ?auto_1241968 ?auto_1241978 ) ) ( not ( = ?auto_1241968 ?auto_1241979 ) ) ( not ( = ?auto_1241968 ?auto_1241980 ) ) ( not ( = ?auto_1241968 ?auto_1241986 ) ) ( not ( = ?auto_1241969 ?auto_1241966 ) ) ( not ( = ?auto_1241969 ?auto_1241970 ) ) ( not ( = ?auto_1241969 ?auto_1241972 ) ) ( not ( = ?auto_1241969 ?auto_1241971 ) ) ( not ( = ?auto_1241969 ?auto_1241973 ) ) ( not ( = ?auto_1241969 ?auto_1241974 ) ) ( not ( = ?auto_1241969 ?auto_1241975 ) ) ( not ( = ?auto_1241969 ?auto_1241976 ) ) ( not ( = ?auto_1241969 ?auto_1241977 ) ) ( not ( = ?auto_1241969 ?auto_1241978 ) ) ( not ( = ?auto_1241969 ?auto_1241979 ) ) ( not ( = ?auto_1241969 ?auto_1241980 ) ) ( not ( = ?auto_1241969 ?auto_1241986 ) ) ( not ( = ?auto_1241966 ?auto_1241970 ) ) ( not ( = ?auto_1241966 ?auto_1241972 ) ) ( not ( = ?auto_1241966 ?auto_1241971 ) ) ( not ( = ?auto_1241966 ?auto_1241973 ) ) ( not ( = ?auto_1241966 ?auto_1241974 ) ) ( not ( = ?auto_1241966 ?auto_1241975 ) ) ( not ( = ?auto_1241966 ?auto_1241976 ) ) ( not ( = ?auto_1241966 ?auto_1241977 ) ) ( not ( = ?auto_1241966 ?auto_1241978 ) ) ( not ( = ?auto_1241966 ?auto_1241979 ) ) ( not ( = ?auto_1241966 ?auto_1241980 ) ) ( not ( = ?auto_1241966 ?auto_1241986 ) ) ( not ( = ?auto_1241970 ?auto_1241972 ) ) ( not ( = ?auto_1241970 ?auto_1241971 ) ) ( not ( = ?auto_1241970 ?auto_1241973 ) ) ( not ( = ?auto_1241970 ?auto_1241974 ) ) ( not ( = ?auto_1241970 ?auto_1241975 ) ) ( not ( = ?auto_1241970 ?auto_1241976 ) ) ( not ( = ?auto_1241970 ?auto_1241977 ) ) ( not ( = ?auto_1241970 ?auto_1241978 ) ) ( not ( = ?auto_1241970 ?auto_1241979 ) ) ( not ( = ?auto_1241970 ?auto_1241980 ) ) ( not ( = ?auto_1241970 ?auto_1241986 ) ) ( not ( = ?auto_1241972 ?auto_1241971 ) ) ( not ( = ?auto_1241972 ?auto_1241973 ) ) ( not ( = ?auto_1241972 ?auto_1241974 ) ) ( not ( = ?auto_1241972 ?auto_1241975 ) ) ( not ( = ?auto_1241972 ?auto_1241976 ) ) ( not ( = ?auto_1241972 ?auto_1241977 ) ) ( not ( = ?auto_1241972 ?auto_1241978 ) ) ( not ( = ?auto_1241972 ?auto_1241979 ) ) ( not ( = ?auto_1241972 ?auto_1241980 ) ) ( not ( = ?auto_1241972 ?auto_1241986 ) ) ( not ( = ?auto_1241971 ?auto_1241973 ) ) ( not ( = ?auto_1241971 ?auto_1241974 ) ) ( not ( = ?auto_1241971 ?auto_1241975 ) ) ( not ( = ?auto_1241971 ?auto_1241976 ) ) ( not ( = ?auto_1241971 ?auto_1241977 ) ) ( not ( = ?auto_1241971 ?auto_1241978 ) ) ( not ( = ?auto_1241971 ?auto_1241979 ) ) ( not ( = ?auto_1241971 ?auto_1241980 ) ) ( not ( = ?auto_1241971 ?auto_1241986 ) ) ( not ( = ?auto_1241973 ?auto_1241974 ) ) ( not ( = ?auto_1241973 ?auto_1241975 ) ) ( not ( = ?auto_1241973 ?auto_1241976 ) ) ( not ( = ?auto_1241973 ?auto_1241977 ) ) ( not ( = ?auto_1241973 ?auto_1241978 ) ) ( not ( = ?auto_1241973 ?auto_1241979 ) ) ( not ( = ?auto_1241973 ?auto_1241980 ) ) ( not ( = ?auto_1241973 ?auto_1241986 ) ) ( not ( = ?auto_1241974 ?auto_1241975 ) ) ( not ( = ?auto_1241974 ?auto_1241976 ) ) ( not ( = ?auto_1241974 ?auto_1241977 ) ) ( not ( = ?auto_1241974 ?auto_1241978 ) ) ( not ( = ?auto_1241974 ?auto_1241979 ) ) ( not ( = ?auto_1241974 ?auto_1241980 ) ) ( not ( = ?auto_1241974 ?auto_1241986 ) ) ( not ( = ?auto_1241975 ?auto_1241976 ) ) ( not ( = ?auto_1241975 ?auto_1241977 ) ) ( not ( = ?auto_1241975 ?auto_1241978 ) ) ( not ( = ?auto_1241975 ?auto_1241979 ) ) ( not ( = ?auto_1241975 ?auto_1241980 ) ) ( not ( = ?auto_1241975 ?auto_1241986 ) ) ( not ( = ?auto_1241976 ?auto_1241977 ) ) ( not ( = ?auto_1241976 ?auto_1241978 ) ) ( not ( = ?auto_1241976 ?auto_1241979 ) ) ( not ( = ?auto_1241976 ?auto_1241980 ) ) ( not ( = ?auto_1241976 ?auto_1241986 ) ) ( not ( = ?auto_1241977 ?auto_1241978 ) ) ( not ( = ?auto_1241977 ?auto_1241979 ) ) ( not ( = ?auto_1241977 ?auto_1241980 ) ) ( not ( = ?auto_1241977 ?auto_1241986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1241978 ?auto_1241979 ?auto_1241980 )
      ( MAKE-14CRATE-VERIFY ?auto_1241967 ?auto_1241968 ?auto_1241969 ?auto_1241966 ?auto_1241970 ?auto_1241972 ?auto_1241971 ?auto_1241973 ?auto_1241974 ?auto_1241975 ?auto_1241976 ?auto_1241977 ?auto_1241978 ?auto_1241979 ?auto_1241980 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1242171 - SURFACE
      ?auto_1242172 - SURFACE
      ?auto_1242173 - SURFACE
      ?auto_1242170 - SURFACE
      ?auto_1242174 - SURFACE
      ?auto_1242176 - SURFACE
      ?auto_1242175 - SURFACE
      ?auto_1242177 - SURFACE
      ?auto_1242178 - SURFACE
      ?auto_1242179 - SURFACE
      ?auto_1242180 - SURFACE
      ?auto_1242181 - SURFACE
      ?auto_1242182 - SURFACE
      ?auto_1242183 - SURFACE
      ?auto_1242184 - SURFACE
    )
    :vars
    (
      ?auto_1242187 - HOIST
      ?auto_1242186 - PLACE
      ?auto_1242188 - PLACE
      ?auto_1242189 - HOIST
      ?auto_1242185 - SURFACE
      ?auto_1242190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1242187 ?auto_1242186 ) ( IS-CRATE ?auto_1242184 ) ( not ( = ?auto_1242183 ?auto_1242184 ) ) ( not ( = ?auto_1242182 ?auto_1242183 ) ) ( not ( = ?auto_1242182 ?auto_1242184 ) ) ( not ( = ?auto_1242188 ?auto_1242186 ) ) ( HOIST-AT ?auto_1242189 ?auto_1242188 ) ( not ( = ?auto_1242187 ?auto_1242189 ) ) ( AVAILABLE ?auto_1242189 ) ( SURFACE-AT ?auto_1242184 ?auto_1242188 ) ( ON ?auto_1242184 ?auto_1242185 ) ( CLEAR ?auto_1242184 ) ( not ( = ?auto_1242183 ?auto_1242185 ) ) ( not ( = ?auto_1242184 ?auto_1242185 ) ) ( not ( = ?auto_1242182 ?auto_1242185 ) ) ( TRUCK-AT ?auto_1242190 ?auto_1242186 ) ( SURFACE-AT ?auto_1242182 ?auto_1242186 ) ( CLEAR ?auto_1242182 ) ( LIFTING ?auto_1242187 ?auto_1242183 ) ( IS-CRATE ?auto_1242183 ) ( ON ?auto_1242172 ?auto_1242171 ) ( ON ?auto_1242173 ?auto_1242172 ) ( ON ?auto_1242170 ?auto_1242173 ) ( ON ?auto_1242174 ?auto_1242170 ) ( ON ?auto_1242176 ?auto_1242174 ) ( ON ?auto_1242175 ?auto_1242176 ) ( ON ?auto_1242177 ?auto_1242175 ) ( ON ?auto_1242178 ?auto_1242177 ) ( ON ?auto_1242179 ?auto_1242178 ) ( ON ?auto_1242180 ?auto_1242179 ) ( ON ?auto_1242181 ?auto_1242180 ) ( ON ?auto_1242182 ?auto_1242181 ) ( not ( = ?auto_1242171 ?auto_1242172 ) ) ( not ( = ?auto_1242171 ?auto_1242173 ) ) ( not ( = ?auto_1242171 ?auto_1242170 ) ) ( not ( = ?auto_1242171 ?auto_1242174 ) ) ( not ( = ?auto_1242171 ?auto_1242176 ) ) ( not ( = ?auto_1242171 ?auto_1242175 ) ) ( not ( = ?auto_1242171 ?auto_1242177 ) ) ( not ( = ?auto_1242171 ?auto_1242178 ) ) ( not ( = ?auto_1242171 ?auto_1242179 ) ) ( not ( = ?auto_1242171 ?auto_1242180 ) ) ( not ( = ?auto_1242171 ?auto_1242181 ) ) ( not ( = ?auto_1242171 ?auto_1242182 ) ) ( not ( = ?auto_1242171 ?auto_1242183 ) ) ( not ( = ?auto_1242171 ?auto_1242184 ) ) ( not ( = ?auto_1242171 ?auto_1242185 ) ) ( not ( = ?auto_1242172 ?auto_1242173 ) ) ( not ( = ?auto_1242172 ?auto_1242170 ) ) ( not ( = ?auto_1242172 ?auto_1242174 ) ) ( not ( = ?auto_1242172 ?auto_1242176 ) ) ( not ( = ?auto_1242172 ?auto_1242175 ) ) ( not ( = ?auto_1242172 ?auto_1242177 ) ) ( not ( = ?auto_1242172 ?auto_1242178 ) ) ( not ( = ?auto_1242172 ?auto_1242179 ) ) ( not ( = ?auto_1242172 ?auto_1242180 ) ) ( not ( = ?auto_1242172 ?auto_1242181 ) ) ( not ( = ?auto_1242172 ?auto_1242182 ) ) ( not ( = ?auto_1242172 ?auto_1242183 ) ) ( not ( = ?auto_1242172 ?auto_1242184 ) ) ( not ( = ?auto_1242172 ?auto_1242185 ) ) ( not ( = ?auto_1242173 ?auto_1242170 ) ) ( not ( = ?auto_1242173 ?auto_1242174 ) ) ( not ( = ?auto_1242173 ?auto_1242176 ) ) ( not ( = ?auto_1242173 ?auto_1242175 ) ) ( not ( = ?auto_1242173 ?auto_1242177 ) ) ( not ( = ?auto_1242173 ?auto_1242178 ) ) ( not ( = ?auto_1242173 ?auto_1242179 ) ) ( not ( = ?auto_1242173 ?auto_1242180 ) ) ( not ( = ?auto_1242173 ?auto_1242181 ) ) ( not ( = ?auto_1242173 ?auto_1242182 ) ) ( not ( = ?auto_1242173 ?auto_1242183 ) ) ( not ( = ?auto_1242173 ?auto_1242184 ) ) ( not ( = ?auto_1242173 ?auto_1242185 ) ) ( not ( = ?auto_1242170 ?auto_1242174 ) ) ( not ( = ?auto_1242170 ?auto_1242176 ) ) ( not ( = ?auto_1242170 ?auto_1242175 ) ) ( not ( = ?auto_1242170 ?auto_1242177 ) ) ( not ( = ?auto_1242170 ?auto_1242178 ) ) ( not ( = ?auto_1242170 ?auto_1242179 ) ) ( not ( = ?auto_1242170 ?auto_1242180 ) ) ( not ( = ?auto_1242170 ?auto_1242181 ) ) ( not ( = ?auto_1242170 ?auto_1242182 ) ) ( not ( = ?auto_1242170 ?auto_1242183 ) ) ( not ( = ?auto_1242170 ?auto_1242184 ) ) ( not ( = ?auto_1242170 ?auto_1242185 ) ) ( not ( = ?auto_1242174 ?auto_1242176 ) ) ( not ( = ?auto_1242174 ?auto_1242175 ) ) ( not ( = ?auto_1242174 ?auto_1242177 ) ) ( not ( = ?auto_1242174 ?auto_1242178 ) ) ( not ( = ?auto_1242174 ?auto_1242179 ) ) ( not ( = ?auto_1242174 ?auto_1242180 ) ) ( not ( = ?auto_1242174 ?auto_1242181 ) ) ( not ( = ?auto_1242174 ?auto_1242182 ) ) ( not ( = ?auto_1242174 ?auto_1242183 ) ) ( not ( = ?auto_1242174 ?auto_1242184 ) ) ( not ( = ?auto_1242174 ?auto_1242185 ) ) ( not ( = ?auto_1242176 ?auto_1242175 ) ) ( not ( = ?auto_1242176 ?auto_1242177 ) ) ( not ( = ?auto_1242176 ?auto_1242178 ) ) ( not ( = ?auto_1242176 ?auto_1242179 ) ) ( not ( = ?auto_1242176 ?auto_1242180 ) ) ( not ( = ?auto_1242176 ?auto_1242181 ) ) ( not ( = ?auto_1242176 ?auto_1242182 ) ) ( not ( = ?auto_1242176 ?auto_1242183 ) ) ( not ( = ?auto_1242176 ?auto_1242184 ) ) ( not ( = ?auto_1242176 ?auto_1242185 ) ) ( not ( = ?auto_1242175 ?auto_1242177 ) ) ( not ( = ?auto_1242175 ?auto_1242178 ) ) ( not ( = ?auto_1242175 ?auto_1242179 ) ) ( not ( = ?auto_1242175 ?auto_1242180 ) ) ( not ( = ?auto_1242175 ?auto_1242181 ) ) ( not ( = ?auto_1242175 ?auto_1242182 ) ) ( not ( = ?auto_1242175 ?auto_1242183 ) ) ( not ( = ?auto_1242175 ?auto_1242184 ) ) ( not ( = ?auto_1242175 ?auto_1242185 ) ) ( not ( = ?auto_1242177 ?auto_1242178 ) ) ( not ( = ?auto_1242177 ?auto_1242179 ) ) ( not ( = ?auto_1242177 ?auto_1242180 ) ) ( not ( = ?auto_1242177 ?auto_1242181 ) ) ( not ( = ?auto_1242177 ?auto_1242182 ) ) ( not ( = ?auto_1242177 ?auto_1242183 ) ) ( not ( = ?auto_1242177 ?auto_1242184 ) ) ( not ( = ?auto_1242177 ?auto_1242185 ) ) ( not ( = ?auto_1242178 ?auto_1242179 ) ) ( not ( = ?auto_1242178 ?auto_1242180 ) ) ( not ( = ?auto_1242178 ?auto_1242181 ) ) ( not ( = ?auto_1242178 ?auto_1242182 ) ) ( not ( = ?auto_1242178 ?auto_1242183 ) ) ( not ( = ?auto_1242178 ?auto_1242184 ) ) ( not ( = ?auto_1242178 ?auto_1242185 ) ) ( not ( = ?auto_1242179 ?auto_1242180 ) ) ( not ( = ?auto_1242179 ?auto_1242181 ) ) ( not ( = ?auto_1242179 ?auto_1242182 ) ) ( not ( = ?auto_1242179 ?auto_1242183 ) ) ( not ( = ?auto_1242179 ?auto_1242184 ) ) ( not ( = ?auto_1242179 ?auto_1242185 ) ) ( not ( = ?auto_1242180 ?auto_1242181 ) ) ( not ( = ?auto_1242180 ?auto_1242182 ) ) ( not ( = ?auto_1242180 ?auto_1242183 ) ) ( not ( = ?auto_1242180 ?auto_1242184 ) ) ( not ( = ?auto_1242180 ?auto_1242185 ) ) ( not ( = ?auto_1242181 ?auto_1242182 ) ) ( not ( = ?auto_1242181 ?auto_1242183 ) ) ( not ( = ?auto_1242181 ?auto_1242184 ) ) ( not ( = ?auto_1242181 ?auto_1242185 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1242182 ?auto_1242183 ?auto_1242184 )
      ( MAKE-14CRATE-VERIFY ?auto_1242171 ?auto_1242172 ?auto_1242173 ?auto_1242170 ?auto_1242174 ?auto_1242176 ?auto_1242175 ?auto_1242177 ?auto_1242178 ?auto_1242179 ?auto_1242180 ?auto_1242181 ?auto_1242182 ?auto_1242183 ?auto_1242184 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1242375 - SURFACE
      ?auto_1242376 - SURFACE
      ?auto_1242377 - SURFACE
      ?auto_1242374 - SURFACE
      ?auto_1242378 - SURFACE
      ?auto_1242380 - SURFACE
      ?auto_1242379 - SURFACE
      ?auto_1242381 - SURFACE
      ?auto_1242382 - SURFACE
      ?auto_1242383 - SURFACE
      ?auto_1242384 - SURFACE
      ?auto_1242385 - SURFACE
      ?auto_1242386 - SURFACE
      ?auto_1242387 - SURFACE
      ?auto_1242388 - SURFACE
    )
    :vars
    (
      ?auto_1242392 - HOIST
      ?auto_1242394 - PLACE
      ?auto_1242390 - PLACE
      ?auto_1242391 - HOIST
      ?auto_1242393 - SURFACE
      ?auto_1242389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1242392 ?auto_1242394 ) ( IS-CRATE ?auto_1242388 ) ( not ( = ?auto_1242387 ?auto_1242388 ) ) ( not ( = ?auto_1242386 ?auto_1242387 ) ) ( not ( = ?auto_1242386 ?auto_1242388 ) ) ( not ( = ?auto_1242390 ?auto_1242394 ) ) ( HOIST-AT ?auto_1242391 ?auto_1242390 ) ( not ( = ?auto_1242392 ?auto_1242391 ) ) ( AVAILABLE ?auto_1242391 ) ( SURFACE-AT ?auto_1242388 ?auto_1242390 ) ( ON ?auto_1242388 ?auto_1242393 ) ( CLEAR ?auto_1242388 ) ( not ( = ?auto_1242387 ?auto_1242393 ) ) ( not ( = ?auto_1242388 ?auto_1242393 ) ) ( not ( = ?auto_1242386 ?auto_1242393 ) ) ( TRUCK-AT ?auto_1242389 ?auto_1242394 ) ( SURFACE-AT ?auto_1242386 ?auto_1242394 ) ( CLEAR ?auto_1242386 ) ( IS-CRATE ?auto_1242387 ) ( AVAILABLE ?auto_1242392 ) ( IN ?auto_1242387 ?auto_1242389 ) ( ON ?auto_1242376 ?auto_1242375 ) ( ON ?auto_1242377 ?auto_1242376 ) ( ON ?auto_1242374 ?auto_1242377 ) ( ON ?auto_1242378 ?auto_1242374 ) ( ON ?auto_1242380 ?auto_1242378 ) ( ON ?auto_1242379 ?auto_1242380 ) ( ON ?auto_1242381 ?auto_1242379 ) ( ON ?auto_1242382 ?auto_1242381 ) ( ON ?auto_1242383 ?auto_1242382 ) ( ON ?auto_1242384 ?auto_1242383 ) ( ON ?auto_1242385 ?auto_1242384 ) ( ON ?auto_1242386 ?auto_1242385 ) ( not ( = ?auto_1242375 ?auto_1242376 ) ) ( not ( = ?auto_1242375 ?auto_1242377 ) ) ( not ( = ?auto_1242375 ?auto_1242374 ) ) ( not ( = ?auto_1242375 ?auto_1242378 ) ) ( not ( = ?auto_1242375 ?auto_1242380 ) ) ( not ( = ?auto_1242375 ?auto_1242379 ) ) ( not ( = ?auto_1242375 ?auto_1242381 ) ) ( not ( = ?auto_1242375 ?auto_1242382 ) ) ( not ( = ?auto_1242375 ?auto_1242383 ) ) ( not ( = ?auto_1242375 ?auto_1242384 ) ) ( not ( = ?auto_1242375 ?auto_1242385 ) ) ( not ( = ?auto_1242375 ?auto_1242386 ) ) ( not ( = ?auto_1242375 ?auto_1242387 ) ) ( not ( = ?auto_1242375 ?auto_1242388 ) ) ( not ( = ?auto_1242375 ?auto_1242393 ) ) ( not ( = ?auto_1242376 ?auto_1242377 ) ) ( not ( = ?auto_1242376 ?auto_1242374 ) ) ( not ( = ?auto_1242376 ?auto_1242378 ) ) ( not ( = ?auto_1242376 ?auto_1242380 ) ) ( not ( = ?auto_1242376 ?auto_1242379 ) ) ( not ( = ?auto_1242376 ?auto_1242381 ) ) ( not ( = ?auto_1242376 ?auto_1242382 ) ) ( not ( = ?auto_1242376 ?auto_1242383 ) ) ( not ( = ?auto_1242376 ?auto_1242384 ) ) ( not ( = ?auto_1242376 ?auto_1242385 ) ) ( not ( = ?auto_1242376 ?auto_1242386 ) ) ( not ( = ?auto_1242376 ?auto_1242387 ) ) ( not ( = ?auto_1242376 ?auto_1242388 ) ) ( not ( = ?auto_1242376 ?auto_1242393 ) ) ( not ( = ?auto_1242377 ?auto_1242374 ) ) ( not ( = ?auto_1242377 ?auto_1242378 ) ) ( not ( = ?auto_1242377 ?auto_1242380 ) ) ( not ( = ?auto_1242377 ?auto_1242379 ) ) ( not ( = ?auto_1242377 ?auto_1242381 ) ) ( not ( = ?auto_1242377 ?auto_1242382 ) ) ( not ( = ?auto_1242377 ?auto_1242383 ) ) ( not ( = ?auto_1242377 ?auto_1242384 ) ) ( not ( = ?auto_1242377 ?auto_1242385 ) ) ( not ( = ?auto_1242377 ?auto_1242386 ) ) ( not ( = ?auto_1242377 ?auto_1242387 ) ) ( not ( = ?auto_1242377 ?auto_1242388 ) ) ( not ( = ?auto_1242377 ?auto_1242393 ) ) ( not ( = ?auto_1242374 ?auto_1242378 ) ) ( not ( = ?auto_1242374 ?auto_1242380 ) ) ( not ( = ?auto_1242374 ?auto_1242379 ) ) ( not ( = ?auto_1242374 ?auto_1242381 ) ) ( not ( = ?auto_1242374 ?auto_1242382 ) ) ( not ( = ?auto_1242374 ?auto_1242383 ) ) ( not ( = ?auto_1242374 ?auto_1242384 ) ) ( not ( = ?auto_1242374 ?auto_1242385 ) ) ( not ( = ?auto_1242374 ?auto_1242386 ) ) ( not ( = ?auto_1242374 ?auto_1242387 ) ) ( not ( = ?auto_1242374 ?auto_1242388 ) ) ( not ( = ?auto_1242374 ?auto_1242393 ) ) ( not ( = ?auto_1242378 ?auto_1242380 ) ) ( not ( = ?auto_1242378 ?auto_1242379 ) ) ( not ( = ?auto_1242378 ?auto_1242381 ) ) ( not ( = ?auto_1242378 ?auto_1242382 ) ) ( not ( = ?auto_1242378 ?auto_1242383 ) ) ( not ( = ?auto_1242378 ?auto_1242384 ) ) ( not ( = ?auto_1242378 ?auto_1242385 ) ) ( not ( = ?auto_1242378 ?auto_1242386 ) ) ( not ( = ?auto_1242378 ?auto_1242387 ) ) ( not ( = ?auto_1242378 ?auto_1242388 ) ) ( not ( = ?auto_1242378 ?auto_1242393 ) ) ( not ( = ?auto_1242380 ?auto_1242379 ) ) ( not ( = ?auto_1242380 ?auto_1242381 ) ) ( not ( = ?auto_1242380 ?auto_1242382 ) ) ( not ( = ?auto_1242380 ?auto_1242383 ) ) ( not ( = ?auto_1242380 ?auto_1242384 ) ) ( not ( = ?auto_1242380 ?auto_1242385 ) ) ( not ( = ?auto_1242380 ?auto_1242386 ) ) ( not ( = ?auto_1242380 ?auto_1242387 ) ) ( not ( = ?auto_1242380 ?auto_1242388 ) ) ( not ( = ?auto_1242380 ?auto_1242393 ) ) ( not ( = ?auto_1242379 ?auto_1242381 ) ) ( not ( = ?auto_1242379 ?auto_1242382 ) ) ( not ( = ?auto_1242379 ?auto_1242383 ) ) ( not ( = ?auto_1242379 ?auto_1242384 ) ) ( not ( = ?auto_1242379 ?auto_1242385 ) ) ( not ( = ?auto_1242379 ?auto_1242386 ) ) ( not ( = ?auto_1242379 ?auto_1242387 ) ) ( not ( = ?auto_1242379 ?auto_1242388 ) ) ( not ( = ?auto_1242379 ?auto_1242393 ) ) ( not ( = ?auto_1242381 ?auto_1242382 ) ) ( not ( = ?auto_1242381 ?auto_1242383 ) ) ( not ( = ?auto_1242381 ?auto_1242384 ) ) ( not ( = ?auto_1242381 ?auto_1242385 ) ) ( not ( = ?auto_1242381 ?auto_1242386 ) ) ( not ( = ?auto_1242381 ?auto_1242387 ) ) ( not ( = ?auto_1242381 ?auto_1242388 ) ) ( not ( = ?auto_1242381 ?auto_1242393 ) ) ( not ( = ?auto_1242382 ?auto_1242383 ) ) ( not ( = ?auto_1242382 ?auto_1242384 ) ) ( not ( = ?auto_1242382 ?auto_1242385 ) ) ( not ( = ?auto_1242382 ?auto_1242386 ) ) ( not ( = ?auto_1242382 ?auto_1242387 ) ) ( not ( = ?auto_1242382 ?auto_1242388 ) ) ( not ( = ?auto_1242382 ?auto_1242393 ) ) ( not ( = ?auto_1242383 ?auto_1242384 ) ) ( not ( = ?auto_1242383 ?auto_1242385 ) ) ( not ( = ?auto_1242383 ?auto_1242386 ) ) ( not ( = ?auto_1242383 ?auto_1242387 ) ) ( not ( = ?auto_1242383 ?auto_1242388 ) ) ( not ( = ?auto_1242383 ?auto_1242393 ) ) ( not ( = ?auto_1242384 ?auto_1242385 ) ) ( not ( = ?auto_1242384 ?auto_1242386 ) ) ( not ( = ?auto_1242384 ?auto_1242387 ) ) ( not ( = ?auto_1242384 ?auto_1242388 ) ) ( not ( = ?auto_1242384 ?auto_1242393 ) ) ( not ( = ?auto_1242385 ?auto_1242386 ) ) ( not ( = ?auto_1242385 ?auto_1242387 ) ) ( not ( = ?auto_1242385 ?auto_1242388 ) ) ( not ( = ?auto_1242385 ?auto_1242393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1242386 ?auto_1242387 ?auto_1242388 )
      ( MAKE-14CRATE-VERIFY ?auto_1242375 ?auto_1242376 ?auto_1242377 ?auto_1242374 ?auto_1242378 ?auto_1242380 ?auto_1242379 ?auto_1242381 ?auto_1242382 ?auto_1242383 ?auto_1242384 ?auto_1242385 ?auto_1242386 ?auto_1242387 ?auto_1242388 ) )
  )

)

